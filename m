Return-Path: <linux-media+bounces-2267-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC0980F0F4
	for <lists+linux-media@lfdr.de>; Tue, 12 Dec 2023 16:30:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7E937B216D7
	for <lists+linux-media@lfdr.de>; Tue, 12 Dec 2023 15:30:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97DA07A225;
	Tue, 12 Dec 2023 15:28:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6706D65
	for <linux-media@vger.kernel.org>; Tue, 12 Dec 2023 07:28:12 -0800 (PST)
From: James Le Cuirot <chewi@gentoo.org>
To: linux-media@vger.kernel.org
Cc: James Le Cuirot <chewi@gentoo.org>
Subject: [PATCH 2/2] meson: Allow documentation directory to be specified with -Ddocdir
Date: Tue, 12 Dec 2023 15:24:06 +0000
Message-ID: <20231212152418.20584-2-chewi@gentoo.org>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231212152418.20584-1-chewi@gentoo.org>
References: <20231212152418.20584-1-chewi@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is needed by Gentoo Linux QA.

Signed-off-by: James Le Cuirot <chewi@gentoo.org>
---
 doc/meson.build   | 2 +-
 meson.build       | 5 +++++
 meson_options.txt | 2 ++
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/doc/meson.build b/doc/meson.build
index 8f4437e7..4b23c3de 100644
--- a/doc/meson.build
+++ b/doc/meson.build
@@ -20,7 +20,7 @@ doxygen_install_dirs = []
 doxygen_output = []
 if get_option('doxygen-html')
     doxygen_output += 'html'
-    doxygen_install_dirs += get_option('datadir') / 'doc' / '@0@'.format(meson.project_name())
+    doxygen_install_dirs += docdir
 endif
 if get_option('doxygen-man')
     doxygen_output += 'man'
diff --git a/meson.build b/meson.build
index d9689d35..af243cbd 100644
--- a/meson.build
+++ b/meson.build
@@ -306,6 +306,11 @@ if udevdir == ''
     udevdir = '/lib/udev'
 endif
 
+docdir = get_option('docdir')
+if docdir == ''
+    docdir = get_option('datadir') / 'doc' / '@0@'.format(meson.project_name())
+endif
+
 qt_opengl_test = '''
 #define GL_GLEXT_PROTOTYPES
 #define QT_NO_OPENGL_ES_2
diff --git a/meson_options.txt b/meson_options.txt
index 2fa046c0..53cf832f 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -32,6 +32,8 @@ option('v4l2-ctl-stream-to', type : 'boolean',
        description : 'Enable use of --stream-to in v4l2-ctl')
 
 # Directories
+option('docdir', type : 'string',
+       description : 'Set documentation directory')
 option('gconvsysdir', type : 'string',
        description : 'Set system gconv directory (default is to autodetect)')
 option('libv4l1subdir', type : 'string', value : 'libv4l',
-- 
2.42.1


