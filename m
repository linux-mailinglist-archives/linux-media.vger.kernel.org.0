Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A930AAC9C
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2019 21:58:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391620AbfIET6R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Sep 2019 15:58:17 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:58474 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389054AbfIET56 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Sep 2019 15:57:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=hjTNA3WcjVQ1uVRvCaEO2GNT0hn8OZTUbCOvEeEU8T0=; b=PeK9oXTeWZIh4q39Lc0Fzifyff
        Vomz2Nj7gjmbp+rqmEckZ6W1mQRiPm1kkimuh3rjPZK7SU2tGXFXdqSxVuvrsw637KDqx/FjlMxOk
        ABurgBaVqeALu7Wu0T7wdxNx0IDngBYOtL4rN1C9KsPN1b6ScKcTMdcspMsuOwrLbtLFi8wj1TRnA
        p0SY9njUWHuFDtU5HA13uK+FzMchk4sLgG4IhZIOop+yUWpYF5ra7K2y/4byTDv4YKS7NB5FovOyN
        K0TWcyk20eMsVZtmvhQMtiAfcHRfBgEpXzlkIe8Rv6aNkUQpUBJL1VO0NXb0RQMoIX84PQ2L3MxCu
        31tEXKiw==;
Received: from [177.159.253.249] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1i5xtF-0000ID-Bg; Thu, 05 Sep 2019 19:57:57 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92.1)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1i5xtC-0005mK-OO; Thu, 05 Sep 2019 16:57:54 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Sven Eckelmann <sven@narfation.org>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Thierry Reding <treding@nvidia.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>
Subject: [PATCH 5/6] scripts/spdxcheck.py: keep track on what line SPDX header was found
Date:   Thu,  5 Sep 2019 16:57:52 -0300
Message-Id: <8d73ce62170345f748f990861bf5352c4423281b.1567712829.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1567712829.git.mchehab+samsung@kernel.org>
References: <cover.1567712829.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

According with Documentation/process/license-rules.rst, SPDX headers
can be found only at the first lines.

However, this script doesn't enforce it, and several files violate
that. It could be useful to be able to show a histogram with the
number of files that have the SPDX header on each line number.

This feature is optional, enabled with -H or --histogram.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 scripts/spdxcheck.py | 37 ++++++++++++++++++++++++++++---------
 1 file changed, 28 insertions(+), 9 deletions(-)

diff --git a/scripts/spdxcheck.py b/scripts/spdxcheck.py
index 6374e078a5f2..c969b050366f 100755
--- a/scripts/spdxcheck.py
+++ b/scripts/spdxcheck.py
@@ -189,7 +189,9 @@ class id_parser(object):
                 # Should we check for more SPDX ids in the same file and
                 # complain if there are any?
                 #
-                break
+                return self.curline - 1
+
+            return -1
 
         except ParserException as pe:
             if pe.tok:
@@ -200,7 +202,7 @@ class id_parser(object):
                 sys.stdout.write('%s: %d:0 %s\n' %(fname, self.curline, col, pe.txt))
             self.spdx_errors += 1
 
-def scan_git_tree(tree):
+def scan_git_tree(ln_count, tree):
     for el in tree.traverse():
         # Exclude stuff which would make pointless noise
         # FIXME: Put this somewhere more sensible
@@ -211,12 +213,15 @@ def scan_git_tree(tree):
         if not os.path.isfile(el.path):
             continue
         with open(el.path, 'rb') as fd:
-            parser.parse_lines(fd, args.maxlines, el.path)
+            ln = parser.parse_lines(fd, args.maxlines, el.path)
+            if ln >= 0:
+                ln_count[ln] += 1;
+    return ln_count
 
-def scan_git_subtree(tree, path):
+def scan_git_subtree(ln_count, tree, path):
     for p in path.strip('/').split('/'):
         tree = tree[p]
-    scan_git_tree(tree)
+    scan_git_tree(ln_count, tree)
 
 if __name__ == '__main__':
 
@@ -225,6 +230,7 @@ if __name__ == '__main__':
     ap.add_argument('-m', '--maxlines', type=int, default=15,
                     help='Maximum number of lines to scan in a file. Default 15')
     ap.add_argument('-v', '--verbose', action='store_true', help='Verbose statistics output')
+    ap.add_argument('-H', '--histogram', action='store_true', help='Verbose histogram about SPDX header position')
     args = ap.parse_args()
 
     # Sanity check path arguments
@@ -255,23 +261,31 @@ if __name__ == '__main__':
         sys.stderr.write('%s\n' %traceback.format_exc())
         sys.exit(1)
 
+    ln_count= [0] * args.maxlines
+
     try:
         if len(args.path) and args.path[0] == '-':
             stdin = os.fdopen(sys.stdin.fileno(), 'rb')
-            parser.parse_lines(stdin, args.maxlines, '-')
+            ln = parser.parse_lines(stdin, args.maxlines, '-')
+            if ln >= 0:
+                ln_count[ln] += 1;
+
         else:
             if args.path:
                 for p in args.path:
                     if os.path.isfile(p):
-                        parser.parse_lines(open(p, 'rb'), args.maxlines, p)
+                        ln = parser.parse_lines(open(p, 'rb'), args.maxlines, p)
+                        if ln >= 0:
+                            ln_count[ln] += 1;
+
                     elif os.path.isdir(p):
-                        scan_git_subtree(repo.head.reference.commit.tree, p)
+                        scan_git_subtree(ln_count, repo.head.reference.commit.tree, p)
                     else:
                         sys.stderr.write('path %s does not exist\n' %p)
                         sys.exit(1)
             else:
                 # Full git tree scan
-                scan_git_tree(repo.head.commit.tree)
+                scan_git_tree(ln_count, repo.head.commit.tree)
 
             if args.verbose:
                 sys.stderr.write('\n')
@@ -284,6 +298,11 @@ if __name__ == '__main__':
                 sys.stderr.write('Lines checked:     %12d\n' %parser.lines_checked)
                 sys.stderr.write('Files with SPDX:   %12d\n' %parser.spdx_valid)
                 sys.stderr.write('Files with errors: %12d\n' %parser.spdx_errors)
+                sys.stderr.write('\n')
+            if args.histogram:
+                for i in range(0, len(ln_count)):
+                    if ln_count[i] > 0:
+                        sys.stderr.write('Files with SPDX at line #%-5d:   %12d\n' % (i + 1, ln_count[i]))
 
             sys.exit(0)
 
-- 
2.21.0

