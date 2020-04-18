Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C72761AEBD9
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2020 12:37:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725893AbgDRKg5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Apr 2020 06:36:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:40740 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725873AbgDRKg4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Apr 2020 06:36:56 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9452221D79;
        Sat, 18 Apr 2020 10:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587206215;
        bh=vP5/Rck1WrDqozyC/lEJJiqm/CNCJjvW8McfYF02WvE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tvBRs8F5jLA7qGs0rAMkuivMKfljxQkXYCIRjLGbH+zWrcnt2prm6q2HKzeuXhdld
         Afuzecu/ked1OfxYuRK+SGYDyKyStNjB+ptlaUg7NaoyyCbNLEprbCuuL/EK3O3sH4
         VzZel4F4Q08cGbyAglwT+G0FYw1SyeRtmETX6Z6g=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jPkqD-00838b-M4; Sat, 18 Apr 2020 12:36:53 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 3/3] media: admin-guide: split driver-specific indexes to new files
Date:   Sat, 18 Apr 2020 12:36:52 +0200
Message-Id: <7f5d96c64d3c52fa222979e92bf030082492471e.1587206071.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <cover.1587206071.git.mchehab+huawei@kernel.org>
References: <cover.1587206071.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In order to better organize the main admin-guide index,
place the driver-specific indexes on separate files.

This ensures a more consistent numbering at the main index.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../admin-guide/media/cec-drivers.rst         | 10 +++
 .../admin-guide/media/dvb-drivers.rst         | 16 ++++
 Documentation/admin-guide/media/index.rst     | 79 +------------------
 .../admin-guide/media/v4l-drivers.rst         | 33 ++++++++
 4 files changed, 63 insertions(+), 75 deletions(-)
 create mode 100644 Documentation/admin-guide/media/cec-drivers.rst
 create mode 100644 Documentation/admin-guide/media/dvb-drivers.rst
 create mode 100644 Documentation/admin-guide/media/v4l-drivers.rst

diff --git a/Documentation/admin-guide/media/cec-drivers.rst b/Documentation/admin-guide/media/cec-drivers.rst
new file mode 100644
index 000000000000..8d9686c08df9
--- /dev/null
+++ b/Documentation/admin-guide/media/cec-drivers.rst
@@ -0,0 +1,10 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=================================
+CEC driver-specific documentation
+=================================
+
+.. toctree::
+	:maxdepth: 2
+
+	pulse8-cec
diff --git a/Documentation/admin-guide/media/dvb-drivers.rst b/Documentation/admin-guide/media/dvb-drivers.rst
new file mode 100644
index 000000000000..8df637c375f9
--- /dev/null
+++ b/Documentation/admin-guide/media/dvb-drivers.rst
@@ -0,0 +1,16 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+========================================
+Digital TV driver-specific documentation
+========================================
+
+.. toctree::
+	:maxdepth: 2
+
+	avermedia
+	bt8xx
+	lmedm04
+	opera-firmware
+	technisat
+	ttusb-dec
+	zr364xx
diff --git a/Documentation/admin-guide/media/index.rst b/Documentation/admin-guide/media/index.rst
index 05ddd4930699..6e0d2bae7154 100644
--- a/Documentation/admin-guide/media/index.rst
+++ b/Documentation/admin-guide/media/index.rst
@@ -28,7 +28,7 @@ The media subsystem
         Table of Contents
 
 .. toctree::
-	:maxdepth: 5
+	:maxdepth: 2
 	:numbered:
 
 	intro
@@ -40,80 +40,9 @@ The media subsystem
 
 	cardlist
 
-
-.. _uapi-v4l-drivers:
-
-Video4Linux (V4L) driver-specific documentation
-===============================================
-
-.. only:: html
-
-    .. class:: toc-title
-
-        Table of Contents
-
-.. toctree::
-	:maxdepth: 5
-	:numbered:
-
-	bttv
-	cafe_ccic
-	cpia2
-	cx88
-	davinci-vpbe
-	fimc
-	imx
-	imx7
-	ipu3
-	ivtv
-	meye
-	omap3isp
-	omap4_camera
-	philips
-	qcom_camss
-	rcar-fdp1
-	saa7134
-	si470x
-	si4713
-	si476x
-	vimc
-	vivid
-
-Digital TV driver-specific documentation
-========================================
-
-.. only:: html
-
-    .. class:: toc-title
-
-        Table of Contents
-
-.. toctree::
-	:maxdepth: 5
-	:numbered:
-
-	avermedia
-	bt8xx
-	lmedm04
-	opera-firmware
-	technisat
-	ttusb-dec
-	zr364xx
-
-CEC driver-specific documentation
-=================================
-
-.. only:: html
-
-    .. class:: toc-title
-
-        Table of Contents
-
-.. toctree::
-	:maxdepth: 5
-	:numbered:
-
-	pulse8-cec
+	v4l-drivers
+	dvb-drivers
+	cec-drivers
 
 **Copyright** |copy| 1999-2020 : LinuxTV Developers
 
diff --git a/Documentation/admin-guide/media/v4l-drivers.rst b/Documentation/admin-guide/media/v4l-drivers.rst
new file mode 100644
index 000000000000..251cc4ede0b6
--- /dev/null
+++ b/Documentation/admin-guide/media/v4l-drivers.rst
@@ -0,0 +1,33 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. _uapi-v4l-drivers:
+
+===============================================
+Video4Linux (V4L) driver-specific documentation
+===============================================
+
+.. toctree::
+	:maxdepth: 2
+
+	bttv
+	cafe_ccic
+	cpia2
+	cx88
+	davinci-vpbe
+	fimc
+	imx
+	imx7
+	ipu3
+	ivtv
+	meye
+	omap3isp
+	omap4_camera
+	philips
+	qcom_camss
+	rcar-fdp1
+	saa7134
+	si470x
+	si4713
+	si476x
+	vimc
+	vivid
-- 
2.25.2

