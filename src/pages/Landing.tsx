import { Link } from 'react-router-dom';
import { CheckCircle, LayoutDashboard } from 'lucide-react';

export function Landing() {
  return (
    <div className="min-h-screen bg-gradient-to-br from-blue-50 to-indigo-100 flex flex-col items-center justify-center px-4">
      <div className="max-w-md text-center">
        <div className="flex justify-center mb-6">
          <div className="bg-blue-600 p-4 rounded-lg">
            <LayoutDashboard className="w-12 h-12 text-white" />
          </div>
        </div>

        <h1 className="text-4xl font-bold text-gray-900 mb-3">
          Team Task Manager
        </h1>

        <p className="text-lg text-gray-600 mb-8">
          Organize and track your team's tasks with a Kanban-style board. Stay focused, stay productive.
        </p>

        <div className="space-y-3 mb-8">
          <div className="flex items-center gap-3 text-gray-700">
            <CheckCircle className="w-5 h-5 text-blue-600 flex-shrink-0" />
            <span>Drag and drop tasks between columns</span>
          </div>
          <div className="flex items-center gap-3 text-gray-700">
            <CheckCircle className="w-5 h-5 text-blue-600 flex-shrink-0" />
            <span>Create tasks with priorities</span>
          </div>
          <div className="flex items-center gap-3 text-gray-700">
            <CheckCircle className="w-5 h-5 text-blue-600 flex-shrink-0" />
            <span>Manage team productivity</span>
          </div>
        </div>

        <Link
          to="/login"
          className="inline-flex items-center gap-2 px-8 py-3 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-colors font-medium text-lg"
        >
          Get Started
        </Link>

        <div className="mt-8 p-4 bg-white rounded-lg shadow-sm border border-gray-200">
          <p className="text-sm text-gray-600 mb-2">Demo Credentials</p>
          <div className="space-y-1 text-sm font-mono">
            <div className="text-gray-700">
              <span className="text-gray-500">Admin:</span> admin / admin123
            </div>
            <div className="text-gray-700">
              <span className="text-gray-500">User:</span> user / user123
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
