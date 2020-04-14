Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82AF61A7683
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2020 10:51:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437126AbgDNIv2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Apr 2020 04:51:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:52312 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2437108AbgDNIvQ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Apr 2020 04:51:16 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4F29521707;
        Tue, 14 Apr 2020 08:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586854269;
        bh=yhXlg/zcc8kf336uIZ3JMI5px5bMxGaDX7kr2NCVb6k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=xlCXvsO8jvAIfWL2oWveg2wB+7MVxhNr2qiKxGOD+H7/qXEnLoNukvY8pojsx0oOF
         /aBFa5WKdm45E7gTf03kBl96AOPK2uM3iJ8WRXiNhbh3uxvMZkuH01NMJEHBHrjfqW
         UnKJXsJa1JmGOIOyEwHupsQnRTUsZnSU6OS3wUd4=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jOHHf-002x04-J8; Tue, 14 Apr 2020 10:51:07 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH 17/19] media: docs: move copyrights to the end and update them
Date:   Tue, 14 Apr 2020 10:51:03 +0200
Message-Id: <09b08462b0bae0ac2c814ff554505d51a30d08f6.1586854191.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <cover.1586854191.git.mchehab+huawei@kernel.org>
References: <cover.1586854191.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The copyright info is not the most valuable information
there. Move them to the end.

While here, change the copyright to cover up to this
year (2020).

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/admin-guide/media/index.rst   | 25 +++++++++++++-------
 Documentation/driver-api/media/index.rst    | 26 +++++++++++++--------
 Documentation/userspace-api/media/index.rst | 16 ++++++++-----
 3 files changed, 42 insertions(+), 25 deletions(-)

diff --git a/Documentation/admin-guide/media/index.rst b/Documentation/admin-guide/media/index.rst
index 04bc259f3325..eb1d82dffcc9 100644
--- a/Documentation/admin-guide/media/index.rst
+++ b/Documentation/admin-guide/media/index.rst
@@ -2,18 +2,9 @@
 
 .. include:: <isonum.txt>
 
-**Copyright** |copy| 1999-2020 : LinuxTV Developers
 
-This documentation is free software; you can redistribute it and/or modify it
-under the terms of the GNU General Public License as published by the Free
-Software Foundation version 2 of the License.
 
-This program is distributed in the hope that it will be useful, but WITHOUT
-ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
-FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
-more details.
 
-For more details see the file COPYING in the source distribution of Linux.
 
 .. _uapi-v4l-drivers:
 
@@ -101,3 +92,19 @@ CEC driver-specific documentation
 	:numbered:
 
 	pulse8-cec
+
+**Copyright** |copy| 1999-2020 : LinuxTV Developers
+
+::
+
+  This documentation is free software; you can redistribute it and/or modify it
+  under the terms of the GNU General Public License as published by the Free
+  Software Foundation; either version 2 of the License, or (at your option) any
+  later version.
+
+  This program is distributed in the hope that it will be useful, but WITHOUT
+  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+  FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
+  more details.
+
+  For more details see the file COPYING in the source distribution of Linux.
diff --git a/Documentation/driver-api/media/index.rst b/Documentation/driver-api/media/index.rst
index 57383df79bd3..5e9f67f34081 100644
--- a/Documentation/driver-api/media/index.rst
+++ b/Documentation/driver-api/media/index.rst
@@ -6,19 +6,9 @@
 Media subsystem kernel internal API
 ===================================
 
-**Copyright** |copy| 2009-2016 : LinuxTV Developers
 
-This documentation is free software; you can redistribute it and/or modify it
-under the terms of the GNU General Public License as published by the Free
-Software Foundation; either version 2 of the License, or (at your option) any
-later version.
 
-This program is distributed in the hope that it will be useful, but WITHOUT
-ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
-FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
-more details.
 
-For more details see the file COPYING in the source distribution of Linux.
 
 .. only:: html
 
@@ -38,3 +28,19 @@ For more details see the file COPYING in the source distribution of Linux.
     csi2
 
     drivers/index
+
+**Copyright** |copy| 2009-2020 : LinuxTV Developers
+
+::
+
+  This documentation is free software; you can redistribute it and/or modify it
+  under the terms of the GNU General Public License as published by the Free
+  Software Foundation; either version 2 of the License, or (at your option) any
+  later version.
+
+  This program is distributed in the hope that it will be useful, but WITHOUT
+  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+  FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
+  more details.
+
+  For more details see the file COPYING in the source distribution of Linux.
diff --git a/Documentation/userspace-api/media/index.rst b/Documentation/userspace-api/media/index.rst
index bcfdd1a5caa0..2c2c96a6f146 100644
--- a/Documentation/userspace-api/media/index.rst
+++ b/Documentation/userspace-api/media/index.rst
@@ -6,13 +6,7 @@
 Linux Media Infrastructure userspace API
 ########################################
 
-**Copyright** |copy| 2009-2016 : LinuxTV Developers
 
-Permission is granted to copy, distribute and/or modify this document
-under the terms of the GNU Free Documentation License, Version 1.1 or
-any later version published by the Free Software Foundation, with no
-Invariant Sections. A copy of the license is included in the chapter
-entitled "GNU Free Documentation License".
 
 .. only:: html
 
@@ -33,3 +27,13 @@ entitled "GNU Free Documentation License".
     fdl-appendix
 
     drivers/index
+
+**Copyright** |copy| 2009-2020 : LinuxTV Developers
+
+::
+
+  Permission is granted to copy, distribute and/or modify this document
+  under the terms of the GNU Free Documentation License, Version 1.1 or
+  any later version published by the Free Software Foundation, with no
+  Invariant Sections. A copy of the license is included in the chapter
+  entitled "GNU Free Documentation License".
-- 
2.25.2

