Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BF2C1DAB58
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2020 09:06:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726369AbgETHDs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 May 2020 03:03:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726714AbgETHDr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 May 2020 03:03:47 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5A53C061A0E;
        Wed, 20 May 2020 00:03:47 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id i68so1782692qtb.5;
        Wed, 20 May 2020 00:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/bMUwdeTMh2W9i+EOVv7dhyz664fp1ziAg67LLNKBOI=;
        b=HbXqbch2rS5fgngKGR1Sm2dQbxdU192Y5c3MlFvEYaUbXvLcOFAvcMRrdfLzHlamaq
         GhvMmpQebC0AYLWCvrbPlqfnCjqZyJGVAb4lIRN4mqmJQrbEWGYTBriUdrRHsykASyh3
         F0MKWsaWjJd7WmioFTsxJaOtNRcAuItHQraJ82XyuiTds0UFzYA+c6hwhU7tcHYc9aBc
         LIyOl1KCOrzAVJtmorc3+3WPVf+gOWAGD7yUL7koovgVdGWKx3DMsu/xOFuXzhjhxUuo
         2u5WpAE9JVhnFmJf9xzz8WfN0LVytt5Tsp7V3sKDhVmrjJLUxT9Q5peLOEMG7j//GHZT
         CIJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/bMUwdeTMh2W9i+EOVv7dhyz664fp1ziAg67LLNKBOI=;
        b=ZpnQPElB3MpCzXHG7ZRSw+f7iVJGXTq7F0wigxJM28SMu5OgEqO5vzkOLyVVZyGqTs
         WGmG8dA4gCvcjRJCT4a0cgItMI62IXnei02ZV/+cYmoaYuj7BObDoXuKxyq2egRMKYzw
         LLkuiEyaCl5O1Go9hkn8YMSvCEdDpNktJHuvA0AvAumN45f+XDUobsNzwKb+bNUZ5x4w
         S16vphRudnK3tdCWLjbQePdsjapi3eKSALrN0j0YI3PWBMYD9AzlzlUL9wvGWvv3owkE
         hVQyB5iIOO786gdXYKg75aLlEZFakJchZsIDqbN1GlAEgh2O+hepJzM2qbEeAkzp6wAj
         xJVA==
X-Gm-Message-State: AOAM532/ThvzdrGwS3/LXsfznOponkRU24jgsrVi7heFebLxcHz6gfih
        1JzyRi1oZKZgVjzht5Dm/84=
X-Google-Smtp-Source: ABdhPJyXyN7PbTHQV1zOP1vLExnTCKYT4/Ja78kVZ23F83MSq4XOLVctvtmRZuYna4uILW1uNsBKBQ==
X-Received: by 2002:ac8:2f64:: with SMTP id k33mr3813298qta.105.1589958226820;
        Wed, 20 May 2020 00:03:46 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
        by smtp.gmail.com with ESMTPSA id i23sm1598893qke.65.2020.05.20.00.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 00:03:46 -0700 (PDT)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab+huawei@kernel.org, sean@mess.org,
        kstewart@linuxfoundation.org, allison@lohutok.net,
        tglx@linutronix.de
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        linux-media@vger.kernel.org, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org
Subject: [RFC, WIP, v6 01/10] media: vidtv: add Kconfig entry
Date:   Wed, 20 May 2020 04:03:25 -0300
Message-Id: <20200520070334.1778751-2-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200520070334.1778751-1-dwlsalmeida@gmail.com>
References: <20200520070334.1778751-1-dwlsalmeida@gmail.com>
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
 drivers/media/test-drivers/Kconfig        | 10 ++++++++++
 drivers/media/test-drivers/Makefile       |  1 +
 drivers/media/test-drivers/vidtv/Kconfig  | 11 +++++++++++
 drivers/media/test-drivers/vidtv/Makefile |  2 ++
 4 files changed, 24 insertions(+)
 create mode 100644 drivers/media/test-drivers/vidtv/Kconfig
 create mode 100644 drivers/media/test-drivers/vidtv/Makefile

diff --git a/drivers/media/test-drivers/Kconfig b/drivers/media/test-drivers/Kconfig
index 188381c855939..7d273a8a7acc2 100644
--- a/drivers/media/test-drivers/Kconfig
+++ b/drivers/media/test-drivers/Kconfig
@@ -4,6 +4,10 @@ menuconfig V4L_TEST_DRIVERS
 	bool "V4L test drivers"
 	depends on VIDEO_DEV
 
+menuconfig DVB_TEST_DRIVERS
+	bool "DVB test drivers"
+	depends on DVB_CORE && MEDIA_SUPPORT && I2C
+
 if V4L_TEST_DRIVERS
 
 source "drivers/media/test-drivers/vimc/Kconfig"
@@ -24,3 +28,9 @@ config VIDEO_VIM2M
 source "drivers/media/test-drivers/vicodec/Kconfig"
 
 endif #V4L_TEST_DRIVERS
+
+if DVB_TEST_DRIVERS
+
+source "drivers/media/test-drivers/vidtv/Kconfig"
+
+endif #DVB_TEST_DRIVERS
diff --git a/drivers/media/test-drivers/Makefile b/drivers/media/test-drivers/Makefile
index 74410d3a9f2d2..9f0e4ebb2efe7 100644
--- a/drivers/media/test-drivers/Makefile
+++ b/drivers/media/test-drivers/Makefile
@@ -7,3 +7,4 @@ obj-$(CONFIG_VIDEO_VIMC)		+= vimc/
 obj-$(CONFIG_VIDEO_VIVID)		+= vivid/
 obj-$(CONFIG_VIDEO_VIM2M)		+= vim2m.o
 obj-$(CONFIG_VIDEO_VICODEC)		+= vicodec/
+obj-$(CONFIG_DVB_VIDTV)			+= vidtv/
diff --git a/drivers/media/test-drivers/vidtv/Kconfig b/drivers/media/test-drivers/vidtv/Kconfig
new file mode 100644
index 0000000000000..22c4fd39461f1
--- /dev/null
+++ b/drivers/media/test-drivers/vidtv/Kconfig
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
diff --git a/drivers/media/test-drivers/vidtv/Makefile b/drivers/media/test-drivers/vidtv/Makefile
new file mode 100644
index 0000000000000..d1558d84eeaed
--- /dev/null
+++ b/drivers/media/test-drivers/vidtv/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+
-- 
2.26.2

