Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B7C4AACA0
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2019 21:58:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391629AbfIET6X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Sep 2019 15:58:23 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:58466 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389223AbfIET56 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Sep 2019 15:57:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=lmKR/QfPflgztvdRJ0TtD1IDJABz8ilaEopVRFO1xZk=; b=BKqaFdapbjhlq/k/T7gDhH0z9l
        OUEh17fjaZsvdHiHqYWIwk0of2f24eoQpwVvWiBwjLKOk5LNzP37/dnhgx701sDuqLvmKYVgs87Qx
        mr4YG+mqZoFkOF/F77Otea1denCJwSSAfIqyIkno+0GQEmvrTgPtVa8gO6NYKpMFTxJw3i2LVGzEf
        GX14OjhKmh1EJleZQmAefzxiufUpSz8QqQtnn39fulF1KmTFr+Ir2YiA+8Py0lkMwNP/jGT9icWAT
        Bes9gP4w2nOYu6rTiv3+rsK3n/rx89LXTsE61lOC92ieXt+AupbWVmRRxoab0RvUwq7/eWqfQtbhs
        xbuoIX9Q==;
Received: from [177.159.253.249] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1i5xtF-0000IG-Es; Thu, 05 Sep 2019 19:57:57 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92.1)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1i5xtC-0005mO-PD; Thu, 05 Sep 2019 16:57:54 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Sven Eckelmann <sven@narfation.org>,
        Thierry Reding <treding@nvidia.com>,
        =?UTF-8?q?Aur=C3=A9lien=20Cedeyn?= <aurelien.cedeyn@gmail.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>
Subject: [PATCH 6/6] scripts/spdxcheck.py: check if the line number follows the strict rule
Date:   Thu,  5 Sep 2019 16:57:53 -0300
Message-Id: <1b7b5c906646f8165fd818ec9e400609d7a7290b.1567712829.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1567712829.git.mchehab+samsung@kernel.org>
References: <cover.1567712829.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There is a very strict rule saying on what line a SPDX header
should be. Add an optional pedantic check for it.

When the check is enabled, it will verify if the file has the
SPDX header "at the first possible line in a file which can contain
a comment", as stated at:

	Documentation/process/license-rules.rst

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 scripts/spdxcheck.py | 34 +++++++++++++++++++++++++---------
 1 file changed, 25 insertions(+), 9 deletions(-)

diff --git a/scripts/spdxcheck.py b/scripts/spdxcheck.py
index c969b050366f..f3260391f091 100755
--- a/scripts/spdxcheck.py
+++ b/scripts/spdxcheck.py
@@ -164,9 +164,15 @@ class id_parser(object):
         self.lastid = None
         self.parser.parse(expr, lexer = self.lexer)
 
-    def parse_lines(self, fd, maxlines, fname):
+    def parse_lines(self, fd, maxlines, fname, strict):
         self.checked += 1
         self.curline = 0
+        self.max_line = 1
+        self.is_python = False
+
+        if fname.find("COPYING") >= 0:
+            self.max_line = maxlines
+
         try:
             for line in fd:
                 line = line.decode(locale.getpreferredencoding(False), errors='ignore')
@@ -174,6 +180,13 @@ class id_parser(object):
                 if self.curline > maxlines:
                     break
                 self.lines_checked += 1
+                if self.curline == 1:
+		    if re.match("\#\!", line):
+                        self.max_line = 2
+			if re.match("\#\!.*python", line):
+			    is_python = True
+                if self.curline == 2 and self.is_python and re.match("^[ \t\f]*#.*?coding[:=][ \t]*([-_.a-zA-Z0-9]+)", line):
+                        self.max_line = 3
                 if line.find("SPDX-License-Identifier:") < 0:
                     continue
                 expr = line.split(':')[1].strip()
@@ -189,6 +202,8 @@ class id_parser(object):
                 # Should we check for more SPDX ids in the same file and
                 # complain if there are any?
                 #
+                if strict and self.curline > self.max_line:
+                    sys.stderr.write('Warning: SPDX header for file %s is at line %d\n' % (fname,self.curline))
                 return self.curline - 1
 
             return -1
@@ -202,7 +217,7 @@ class id_parser(object):
                 sys.stdout.write('%s: %d:0 %s\n' %(fname, self.curline, col, pe.txt))
             self.spdx_errors += 1
 
-def scan_git_tree(ln_count, tree):
+def scan_git_tree(ln_count, tree, strict):
     for el in tree.traverse():
         # Exclude stuff which would make pointless noise
         # FIXME: Put this somewhere more sensible
@@ -213,15 +228,15 @@ def scan_git_tree(ln_count, tree):
         if not os.path.isfile(el.path):
             continue
         with open(el.path, 'rb') as fd:
-            ln = parser.parse_lines(fd, args.maxlines, el.path)
+            ln = parser.parse_lines(fd, args.maxlines, el.path, strict)
             if ln >= 0:
                 ln_count[ln] += 1;
     return ln_count
 
-def scan_git_subtree(ln_count, tree, path):
+def scan_git_subtree(ln_count, tree, path, strict):
     for p in path.strip('/').split('/'):
         tree = tree[p]
-    scan_git_tree(ln_count, tree)
+    scan_git_tree(ln_count, tree, strict)
 
 if __name__ == '__main__':
 
@@ -231,6 +246,7 @@ if __name__ == '__main__':
                     help='Maximum number of lines to scan in a file. Default 15')
     ap.add_argument('-v', '--verbose', action='store_true', help='Verbose statistics output')
     ap.add_argument('-H', '--histogram', action='store_true', help='Verbose histogram about SPDX header position')
+    ap.add_argument('-s', '--strict', action='store_true', help='Enable strict mode, making it complain about SPDX line position')
     args = ap.parse_args()
 
     # Sanity check path arguments
@@ -266,7 +282,7 @@ if __name__ == '__main__':
     try:
         if len(args.path) and args.path[0] == '-':
             stdin = os.fdopen(sys.stdin.fileno(), 'rb')
-            ln = parser.parse_lines(stdin, args.maxlines, '-')
+            ln = parser.parse_lines(stdin, args.maxlines, '-', args.strict)
             if ln >= 0:
                 ln_count[ln] += 1;
 
@@ -274,18 +290,18 @@ if __name__ == '__main__':
             if args.path:
                 for p in args.path:
                     if os.path.isfile(p):
-                        ln = parser.parse_lines(open(p, 'rb'), args.maxlines, p)
+                        ln = parser.parse_lines(open(p, 'rb'), args.maxlines, p, args.strict)
                         if ln >= 0:
                             ln_count[ln] += 1;
 
                     elif os.path.isdir(p):
-                        scan_git_subtree(ln_count, repo.head.reference.commit.tree, p)
+                        scan_git_subtree(ln_count, repo.head.reference.commit.tree, p, args.strict)
                     else:
                         sys.stderr.write('path %s does not exist\n' %p)
                         sys.exit(1)
             else:
                 # Full git tree scan
-                scan_git_tree(ln_count, repo.head.commit.tree)
+                scan_git_tree(ln_count, repo.head.commit.tree, args.strict)
 
             if args.verbose:
                 sys.stderr.write('\n')
-- 
2.21.0

