Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 391E51C227C
	for <lists+linux-media@lfdr.de>; Sat,  2 May 2020 05:23:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726799AbgEBDWd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 May 2020 23:22:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726439AbgEBDWc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 May 2020 23:22:32 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59EA1C061A0C;
        Fri,  1 May 2020 20:22:32 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id g16so5554371qtp.11;
        Fri, 01 May 2020 20:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/bMUwdeTMh2W9i+EOVv7dhyz664fp1ziAg67LLNKBOI=;
        b=FANSfkIBdsdts7VxUCboxxpikHryJy5QikgpmBM55Bp0YmsRcr6F3V9jQC0D0K+/5R
         qZouMJxes353v5Y/J9marUqnDfGkurq74bDqdW0ngcsEdE0PZwq//bV6b6RAsGj7SeJW
         3hU0bqn36fz0CRuLqNOsVNdWxfQByyzIhXjrdUHLq6m3++HH41fy2JC9a3IW9x6v8pmK
         nKizn31xWpquTXYzYPnrL/iP4/mi590dvWrc3NpkvQk8FLGvEAuH1hhJAFBAvToWasDt
         nZZ4FFgCvB1vMgFPgso+O0yCRLYXGYVRkp0wwTR88WGgmduCgCzYFj5m5pVBFyM2oWZE
         ZQSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/bMUwdeTMh2W9i+EOVv7dhyz664fp1ziAg67LLNKBOI=;
        b=JprLfl9yXo5oryIxJ93YiA+JcaDfKSRWGKXA/FDZOwTWdKl+eC5w8b9VVPBhWSks1B
         vaslTrhcJkmEE1j+x1+/m/slXRTitdtzv6vYfUsinQT6B0EjZ8YyWJuunelvL4bb5fl8
         eICr//euefRBo2qIvvGewJJWMQ/Od02mZokE4td8iWsA7zD6m6pSKjDptPhI+dzjAQes
         K7ykVKLjgzvHWEmGbloU7CP82AHY6NaYKsycCq4rmmZEhLXHVzzTr3+slaifb6hcaweV
         K871r5tgvBwoWHdk5NClgikXsZ5eLYXFd75ooREcAn3R06BmLeu5p6iUHBUkfriLs7Bu
         long==
X-Gm-Message-State: AGi0PuZuYxrxdfCjWqh+5mFKzNIv1JjSsNniPnxJHT+g4uHgX4BJB8NX
        Co8BRjrEVvzUI1+wUF9RU1I=
X-Google-Smtp-Source: APiQypIMzIR8/Ng+dJ8wepy8MQb8xYjhyQiwV+O/vZXG3B+0Pm9D2SiwKiqUSQBBz3qvj1cFVYEXYA==
X-Received: by 2002:ac8:4c8d:: with SMTP id j13mr6830790qtv.142.1588389751538;
        Fri, 01 May 2020 20:22:31 -0700 (PDT)
Received: from localhost.localdomain ([2804:18:602b:723a:1b2a:57a1:a611:34ed])
        by smtp.gmail.com with ESMTPSA id c41sm4410399qta.96.2020.05.01.20.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 20:22:31 -0700 (PDT)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab+huawei@kernel.org, sean@mess.org,
        kstewart@linuxfoundation.org, allison@lohutok.net,
        tglx@linutronix.de
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        linux-media@vger.kernel.org, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org
Subject: [RFC, WIP, v4 01/11] media: vidtv: add Kconfig entry
Date:   Sat,  2 May 2020 00:22:06 -0300
Message-Id: <20200502032216.197977-2-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200502032216.197977-1-dwlsalmeida@gmail.com>
References: <20200502032216.197977-1-dwlsalmeida@gmail.com>
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

