Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D655AB7B2
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2019 14:04:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403947AbfIFMEp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Sep 2019 08:04:45 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:43894 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403871AbfIFMEp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Sep 2019 08:04:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=IjejP0JivUPaE/S6eWHK4rjSZSkDVH4JEZl30906qmU=; b=TZO9dy/zykqjfF5gYELED+err
        g9eAVNvO5sW+n3QneUdSqvb1Vd44f/J0O8+loUFhz5zsZXQcmGuSTmfjl9eVgjtzj+UsDc+GtLHpx
        eZEMUroQVUryQIaXI7DXo2LGTtWohIVdg6/pxkLLAf5fCzLRKdf7k4VE06CPcTadO7xya3rCKuOkR
        npvZJ0hGEwJtzqNgTMk413/SUX1HL++TDIA9za7FfR8OSSc4At2oNXJeWC0rWa6sEBccOwE8Ws3UX
        Q34s4BTcCOURRylXnfy8JcSRKm1s8VYPMlx/2sBEX5J9/gzfF7RXSUGlvjYTz+NKmtIY3OcH1mme+
        ohI6XjTvw==;
Received: from [177.159.253.249] (helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1i6Cyq-0006Cw-EP; Fri, 06 Sep 2019 12:04:44 +0000
Date:   Fri, 6 Sep 2019 09:04:39 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Sven Eckelmann <sven@narfation.org>,
        Thierry Reding <treding@nvidia.com>,
        =?UTF-8?B?QXVyw6lsaWVu?= Cedeyn <aurelien.cedeyn@gmail.com>,
        Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= 
        <u.kleine-koenig@pengutronix.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>
Subject: [PATCH v2 6/6] scripts/spdxcheck.py: check if the line number
 follows the strict rule
Message-ID: <20190906090439.37b8d334@coco.lan>
In-Reply-To: <1b7b5c906646f8165fd818ec9e400609d7a7290b.1567712829.git.mchehab+samsung@kernel.org>
References: <cover.1567712829.git.mchehab+samsung@kernel.org>
        <1b7b5c906646f8165fd818ec9e400609d7a7290b.1567712829.git.mchehab+samsung@kernel.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

diff --git a/scripts/spdxcheck.py b/scripts/spdxcheck.py
index c969b050366f..920cceb0d036 100755
--- a/scripts/spdxcheck.py
+++ b/scripts/spdxcheck.py
@@ -164,9 +164,18 @@ class id_parser(object):
         self.lastid = None
         self.parser.parse(expr, lexer = self.lexer)
 
-    def parse_lines(self, fd, maxlines, fname):
+    def parse_lines(self, fd, maxlines, fname, strict):
         self.checked += 1
         self.curline = 0
+        self.max_line = 1
+        self.is_python = False
+
+        if fname.endswith(".py"):
+            self.is_python = True
+
+        if fname.find("COPYING") >= 0:
+            self.max_line = maxlines
+
         try:
             for line in fd:
                 line = line.decode(locale.getpreferredencoding(False), errors='ignore')
@@ -174,6 +183,13 @@ class id_parser(object):
                 if self.curline > maxlines:
                     break
                 self.lines_checked += 1
+                if self.curline == 1:
+		    if re.match("\#\!", line):
+                        self.max_line = 2
+			if re.match("\#\!.*python", line):
+			    is_python = True
+                if self.curline <= 2 and self.is_python and re.match("^[ \t\f]*#.*?coding[:=][ \t]*([-_.a-zA-Z0-9]+)", line):
+                        self.max_line += 1
                 if line.find("SPDX-License-Identifier:") < 0:
                     continue
                 expr = line.split(':')[1].strip()
@@ -189,6 +205,8 @@ class id_parser(object):
                 # Should we check for more SPDX ids in the same file and
                 # complain if there are any?
                 #
+                if strict and self.curline > self.max_line:
+                    sys.stderr.write('Warning: SPDX header for file %s is at line %d\n' % (fname,self.curline))
                 return self.curline - 1
 
             return -1
@@ -202,7 +220,7 @@ class id_parser(object):
                 sys.stdout.write('%s: %d:0 %s\n' %(fname, self.curline, col, pe.txt))
             self.spdx_errors += 1
 
-def scan_git_tree(ln_count, tree):
+def scan_git_tree(ln_count, tree, strict):
     for el in tree.traverse():
         # Exclude stuff which would make pointless noise
         # FIXME: Put this somewhere more sensible
@@ -213,15 +231,15 @@ def scan_git_tree(ln_count, tree):
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
 
@@ -231,6 +249,7 @@ if __name__ == '__main__':
                     help='Maximum number of lines to scan in a file. Default 15')
     ap.add_argument('-v', '--verbose', action='store_true', help='Verbose statistics output')
     ap.add_argument('-H', '--histogram', action='store_true', help='Verbose histogram about SPDX header position')
+    ap.add_argument('-s', '--strict', action='store_true', help='Enable strict mode, making it complain about SPDX line position')
     args = ap.parse_args()
 
     # Sanity check path arguments
@@ -266,7 +285,7 @@ if __name__ == '__main__':
     try:
         if len(args.path) and args.path[0] == '-':
             stdin = os.fdopen(sys.stdin.fileno(), 'rb')
-            ln = parser.parse_lines(stdin, args.maxlines, '-')
+            ln = parser.parse_lines(stdin, args.maxlines, '-', args.strict)
             if ln >= 0:
                 ln_count[ln] += 1;
 
@@ -274,18 +293,18 @@ if __name__ == '__main__':
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
