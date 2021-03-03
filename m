Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D53FD32C76B
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 02:10:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381109AbhCDAb6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Mar 2021 19:31:58 -0500
Received: from mail.kernel.org ([198.145.29.99]:56714 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1345134AbhCCP6s (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 3 Mar 2021 10:58:48 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 65CFC64EDB;
        Wed,  3 Mar 2021 15:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614787084;
        bh=GKrMTWwEh1kLtPzdDB87gc1HSZh5O2LMmCKt9KLcS9o=;
        h=From:To:Cc:Subject:Date:From;
        b=nnrvgGQ4NiILw1zfzLL4bQjkcZ1FKnZ6lrIZUWBIMVZw8A/jfK9HgmKc5JCz7O85s
         DK4BIms+p/PM3cgwvpyW/lBpYSSgelOHbcUtDWiBDbEiAYcUs1G2SRJkKadCm2tkpw
         lRj8ISpU0Zh7mfmGtUF8FR/Gtsy5jC32gFV8zT6tiU0m3+ZlhfREB9gpvtT20sOs+q
         ifKkcciKrRsb/4xxQDql46pZOXDKn8/02jh6S1WycGUa+1xTq2pP2swe/nnfeiIsfj
         l0gsXnb41nyeVXUaOK6e5WF6StdKT007adzrmld7NPq3PCViSGLSn1pKAswOHNFGTZ
         hTgW8XMTgGTBg==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lHTsv-001iva-Tt; Wed, 03 Mar 2021 16:58:01 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] docs: conf.py: adjust the LaTeX document output
Date:   Wed,  3 Mar 2021 16:58:00 +0100
Message-Id: <911fbac185dd09c7df715cf4153361b81f04b7ad.1614787053.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Changeset f546ff0c0c07 ("Move our minimum Sphinx version to 1.7")
cleaned up some compatibility issues with previous Sphinx
versions, but it also dropped the PDF margin sets.

Without that, the media documentation won't build fine, as
the margins are too wide to display texts with monospaced
fonts.

While here, align the  "latex_elements = {" values, and add
a few other sphinxsetup configs in order to allow Sphinx to
wrap long lines on literal blocks.

Fixes: f546ff0c0c07 ("Move our minimum Sphinx version to 1.7")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

 Documentation/conf.py | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/Documentation/conf.py b/Documentation/conf.py
index fd65168c10f8..879e86dbea66 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -331,27 +331,34 @@ htmlhelp_basename = 'TheLinuxKerneldoc'
 # -- Options for LaTeX output ---------------------------------------------
 
 latex_elements = {
-# The paper size ('letterpaper' or 'a4paper').
-'papersize': 'a4paper',
+    # The paper size ('letterpaper' or 'a4paper').
+    'papersize': 'a4paper',
 
-# The font size ('10pt', '11pt' or '12pt').
-'pointsize': '11pt',
+    # The font size ('10pt', '11pt' or '12pt').
+    'pointsize': '11pt',
 
-# Latex figure (float) alignment
-#'figure_align': 'htbp',
+    # Latex figure (float) alignment
+    #'figure_align': 'htbp',
 
-# Don't mangle with UTF-8 chars
-'inputenc': '',
-'utf8extra': '',
+    # Don't mangle with UTF-8 chars
+    'inputenc': '',
+    'utf8extra': '',
 
-# Additional stuff for the LaTeX preamble.
+    # Set document margins
+    'sphinxsetup': '''
+        hmargin=0.5in, vmargin=1in,
+        parsedliteralwraps=true,
+        verbatimhintsturnover=false,
+    ''',
+
+    # Additional stuff for the LaTeX preamble.
     'preamble': '''
-	% Use some font with UTF-8 support with XeLaTeX
+        % Use some font with UTF-8 support with XeLaTeX
         \\usepackage{fontspec}
         \\setsansfont{DejaVu Sans}
         \\setromanfont{DejaVu Serif}
         \\setmonofont{DejaVu Sans Mono}
-     '''
+     ''',
 }
 
 # At least one book (translations) may have Asian characters
-- 
2.29.2


