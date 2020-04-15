Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4B6E1A9A93
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2020 12:32:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406071AbgDOKcn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Apr 2020 06:32:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:33684 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2408645AbgDOKbl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Apr 2020 06:31:41 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 05D58214D8;
        Wed, 15 Apr 2020 10:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586946701;
        bh=2jH+QFJ7VKqKx288GpdmlUXxwK+izHYxf9PlYgB3QI4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UkE6rCJXoAJqAL8emtVci88Gbl4OUAyxdxErWcO7/106F41NwTt/QUzM8nCVEsqef
         8DtVvuOliuOxWfcLMwTr7TpTjaTEHX7SkC77juCHDF9U5SAqkgPWoIUrx+BwGelKyZ
         2WD3EW+Ns0uEFeUZ4rFcS8+1waTWVDO7J2+O5S4c=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jOfKV-006gMR-9c; Wed, 15 Apr 2020 12:31:39 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v2 6/6] media: cec: rename USB config options
Date:   Wed, 15 Apr 2020 12:31:37 +0200
Message-Id: <3512e9983c79c144c2010cefe6de92bb37658911.1586946605.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <cover.1586946605.git.mchehab+huawei@kernel.org>
References: <cover.1586946605.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In order to standardize, let's also rename those options to
CEC_<driver>, just like the platform driver config options.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/cec/usb/Makefile            | 4 ++--
 drivers/media/cec/usb/pulse8/Kconfig      | 2 +-
 drivers/media/cec/usb/pulse8/Makefile     | 2 +-
 drivers/media/cec/usb/rainshadow/Kconfig  | 2 +-
 drivers/media/cec/usb/rainshadow/Makefile | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/cec/usb/Makefile b/drivers/media/cec/usb/Makefile
index e4183d1bfa9a..07ff817c7121 100644
--- a/drivers/media/cec/usb/Makefile
+++ b/drivers/media/cec/usb/Makefile
@@ -2,5 +2,5 @@
 #
 # Makefile for the CEC USB device drivers.
 #
-obj-$(CONFIG_USB_PULSE8_CEC) += pulse8/
-obj-$(CONFIG_USB_RAINSHADOW_CEC) += rainshadow/
+obj-$(CONFIG_CEC_PULSE8) += pulse8/
+obj-$(CONFIG_CEC_RAINSHADOW) += rainshadow/
diff --git a/drivers/media/cec/usb/pulse8/Kconfig b/drivers/media/cec/usb/pulse8/Kconfig
index a0224ef80e6c..3bcc40959308 100644
--- a/drivers/media/cec/usb/pulse8/Kconfig
+++ b/drivers/media/cec/usb/pulse8/Kconfig
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-config USB_PULSE8_CEC
+config CEC_PULSE8
 	tristate "Pulse Eight HDMI CEC"
 	select CEC_CORE
 	select USB
diff --git a/drivers/media/cec/usb/pulse8/Makefile b/drivers/media/cec/usb/pulse8/Makefile
index 7816c68bf928..f39d67f8a2c8 100644
--- a/drivers/media/cec/usb/pulse8/Makefile
+++ b/drivers/media/cec/usb/pulse8/Makefile
@@ -1,2 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-$(CONFIG_USB_PULSE8_CEC) += pulse8-cec.o
+obj-$(CONFIG_CEC_PULSE8) += pulse8-cec.o
diff --git a/drivers/media/cec/usb/rainshadow/Kconfig b/drivers/media/cec/usb/rainshadow/Kconfig
index c9ef2c192b17..b46b3f46bc41 100644
--- a/drivers/media/cec/usb/rainshadow/Kconfig
+++ b/drivers/media/cec/usb/rainshadow/Kconfig
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-config USB_RAINSHADOW_CEC
+config CEC_RAINSHADOW
 	tristate "RainShadow Tech HDMI CEC"
 	select CEC_CORE
 	select USB
diff --git a/drivers/media/cec/usb/rainshadow/Makefile b/drivers/media/cec/usb/rainshadow/Makefile
index 47b33c574c3e..c0b78b223ae9 100644
--- a/drivers/media/cec/usb/rainshadow/Makefile
+++ b/drivers/media/cec/usb/rainshadow/Makefile
@@ -1,2 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-$(CONFIG_USB_RAINSHADOW_CEC) += rainshadow-cec.o
+obj-$(CONFIG_CEC_RAINSHADOW) += rainshadow-cec.o
-- 
2.25.2

