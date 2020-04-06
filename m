Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0905F1A0192
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2020 01:21:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726571AbgDFXVM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 19:21:12 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:34304 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726254AbgDFXVL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Apr 2020 19:21:11 -0400
Received: by mail-qt1-f193.google.com with SMTP id 14so1357410qtp.1;
        Mon, 06 Apr 2020 16:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qYLbut/xX+hjmPe9RzWA90KmfgDd7VcddBEKSA5kQ5c=;
        b=Sy5/SLnkA+S9bkiFDB2dfPAELaCJGzkQc6kHCaXQngzyYZ0prZ0RlndfkF6lPoyBRN
         bTYOGckd/UNuBPFrPOmCeXv4tPQTaWmwftmDtfDwHEdlIoAx7Gzig4V7uHqWER5VP8Hp
         GJAlYD0wgGNnORPAzRpTqGQutMi47FtxEjbl8L1aybXAfGdhNg0nZz4D4zAJ+Ky2h1Mr
         4dKZGrA7r0v3jMatsjRtc+agfb5v7oifmHTY7fiwXoRdYbMxObraspqBfZWv2Z+9RxJU
         zlde1Y2RTMA8J5y2Dd5t0vO2WhgYMRX7ExauHvv9+7gRN3g+nuSiUuX39ichdi2ANR9R
         dF6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qYLbut/xX+hjmPe9RzWA90KmfgDd7VcddBEKSA5kQ5c=;
        b=mCGju8h1bLWJG/Nc9jkPJ9iXkoNpVuqLebCfnF5K/ffYyBmHlWK4BOSfpX2I+IJfjy
         KgqXzmBZUvNQDduA+PkRpU3rcYRL7ebskMy01qKgHO2kXkoX4L233TbWuJIoCv2N03ph
         nLsgkyY9YeCvsB7OvBBEUHDjuMu78sJKk4pNmhKVR/dzO6w7kcU2KCAWyZgh9EVJOqQN
         ykY0OC9LAzCxUke38kOB+lYcEojOgdYMDT0h8c2iq4Aekpk8nEGu7TPUJvNoxzOOhOXL
         gQ8mWEbEPq0KIg0jzmgnRCZZla3fPmOSktm+kdMSb2SlcTQiQ/DUGFvGuIFpOYuD0lH6
         NIlw==
X-Gm-Message-State: AGi0PuavTkHX9W2cXn+OplMSAxRTbsSJ3VSGUjqhtuAjzPNTVVxt8qfD
        HE2gP+XmP60jA9rAH/EVR00=
X-Google-Smtp-Source: APiQypKFyGFHbTWdKNBlwKIiKmcWH5TlE7cQwKz3a2q7rHfDcj87BH2mA0YWa2SsZHsZsuKR9Bdh8A==
X-Received: by 2002:ac8:1684:: with SMTP id r4mr1974418qtj.287.1586215271062;
        Mon, 06 Apr 2020 16:21:11 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:da15:c0bd:33c1:e2ad])
        by smtp.gmail.com with ESMTPSA id u26sm1490978qku.54.2020.04.06.16.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 16:21:10 -0700 (PDT)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab+huawei@kernel.org, sean@mess.org,
        kstewart@linuxfoundation.org, allison@lohutok.net,
        tglx@linutronix.de
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        linux-media@vger.kernel.org, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org
Subject: [RFC, WIP, v3 1/6] media: vidtv: add Kconfig entry
Date:   Mon,  6 Apr 2020 20:20:50 -0300
Message-Id: <20200406232055.1023946-2-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200406232055.1023946-1-dwlsalmeida@gmail.com>
References: <20200406232055.1023946-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

Add the necessary Kconfig entries and a dummy Makefile to compile the new
virtual DVB test driver (vidtv).

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/test_drivers/Kconfig        | 10 ++++++++++
 drivers/media/test_drivers/Makefile       |  1 +
 drivers/media/test_drivers/vidtv/Kconfig  | 11 +++++++++++
 drivers/media/test_drivers/vidtv/Makefile |  2 ++
 4 files changed, 24 insertions(+)
 create mode 100644 drivers/media/test_drivers/vidtv/Kconfig
 create mode 100644 drivers/media/test_drivers/vidtv/Makefile

diff --git a/drivers/media/test_drivers/Kconfig b/drivers/media/test_drivers/Kconfig
index 9f4a9cfbacc9c..997594ab3842a 100644
--- a/drivers/media/test_drivers/Kconfig
+++ b/drivers/media/test_drivers/Kconfig
@@ -6,6 +6,10 @@ menuconfig V4L_TEST_DRIVERS
 	bool "V4L test drivers"
 	depends on VIDEO_DEV
 
+menuconfig DVB_TEST_DRIVERS
+	bool "DVB test drivers"
+	depends on DVB_CORE && MEDIA_SUPPORT && I2C
+
 if V4L_TEST_DRIVERS
 
 source "drivers/media/test_drivers/vimc/Kconfig"
@@ -25,4 +29,10 @@ source "drivers/media/test_drivers/vicodec/Kconfig"
 
 endif #V4L_TEST_DRIVERS
 
+if DVB_TEST_DRIVERS
+
+source "drivers/media/test_drivers/vidtv/Kconfig"
+
+endif #DVB_TEST_DRIVERS
+
 endif #MEDIA_TEST_SUPPORT
diff --git a/drivers/media/test_drivers/Makefile b/drivers/media/test_drivers/Makefile
index 74410d3a9f2d2..9f0e4ebb2efe7 100644
--- a/drivers/media/test_drivers/Makefile
+++ b/drivers/media/test_drivers/Makefile
@@ -7,3 +7,4 @@ obj-$(CONFIG_VIDEO_VIMC)		+= vimc/
 obj-$(CONFIG_VIDEO_VIVID)		+= vivid/
 obj-$(CONFIG_VIDEO_VIM2M)		+= vim2m.o
 obj-$(CONFIG_VIDEO_VICODEC)		+= vicodec/
+obj-$(CONFIG_DVB_VIDTV)			+= vidtv/
diff --git a/drivers/media/test_drivers/vidtv/Kconfig b/drivers/media/test_drivers/vidtv/Kconfig
new file mode 100644
index 0000000000000..22c4fd39461f1
--- /dev/null
+++ b/drivers/media/test_drivers/vidtv/Kconfig
@@ -0,0 +1,11 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config DVB_VIDTV
+	tristate "Virtual DVB Driver (vidtv)"
+	depends on DVB_CORE && MEDIA_SUPPORT && I2C
+	help
+	  The virtual DVB test driver serves as a reference DVB driver and helps
+	  validate the existing APIs in the media subsystem. It can also aid developers
+	  working on userspace applications.
+
+
+	  When in doubt, say N.
diff --git a/drivers/media/test_drivers/vidtv/Makefile b/drivers/media/test_drivers/vidtv/Makefile
new file mode 100644
index 0000000000000..d1558d84eeaed
--- /dev/null
+++ b/drivers/media/test_drivers/vidtv/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+
-- 
2.26.0

