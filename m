Return-Path: <linux-media+bounces-32681-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A46ABA9E1
	for <lists+linux-media@lfdr.de>; Sat, 17 May 2025 13:43:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA467189F67A
	for <lists+linux-media@lfdr.de>; Sat, 17 May 2025 11:43:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFD6B1FAC59;
	Sat, 17 May 2025 11:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WZVQohNd"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B261E1F8725
	for <linux-media@vger.kernel.org>; Sat, 17 May 2025 11:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747482208; cv=none; b=bg/sSaQ4zUyyMIAv5wekbW+toortFA5dO/UqobtMXw7EB+C+I1DMt6BxvkNms30hsevKQIqJcmGI08zFOO+VIsh6ykzFtISNdHMbacqMiEpacJQJUoN6ZBCS4UHe25iBZ74gGfjIX47ttEDaWWebK04QWJ2X7u3XeqkVHgwG4WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747482208; c=relaxed/simple;
	bh=THLwXoOgLDd9wnrQQCSeUCTUq2Z3AORPxae7EyvzTEY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KI6qCuOFBRT+vBDOontkV18+Wl6Skul6kAv7fUHtvj+OvzGHUm9mrhpuWzuc4sA7y6Q27EDgXsOL+5v0OyALIRYJxsxv72kGdiY0KOYpGr5xqspt1cWOvFX492PQiwVL/q3+KA5wKwbd/GThF2O/YGkjWts/nKrlZjRaOR4UkbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WZVQohNd; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747482205;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XjCDQy6h9xDMmBhLCAE6eWX7GA2oOa+aYh/ywEQ20as=;
	b=WZVQohNd42ckSmzQAMp7sNk5Ik3O0fE8Mom/7sAsGBr+Tls8OWycPFyUP8PustaEI59mHr
	E8gDmUJoD6HjiHvHNIcgNevFx7LLeyiNEM0Im5GRsVr2vq7E69Mz5c9swc/R4vvBJ/uBiW
	HimYZAUWzNLzyZH7Y63s7PDWZddQ9Is=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-260-hp3dmKehORy4vmGjCtUxrQ-1; Sat,
 17 May 2025 07:43:22 -0400
X-MC-Unique: hp3dmKehORy4vmGjCtUxrQ-1
X-Mimecast-MFC-AGG-ID: hp3dmKehORy4vmGjCtUxrQ_1747482200
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C2397180034E;
	Sat, 17 May 2025 11:43:20 +0000 (UTC)
Received: from x1.redhat.com (unknown [10.45.224.43])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0DCC818003FC;
	Sat, 17 May 2025 11:43:16 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 23/23] media: Move gc0310 sensor drivers to drivers/media/i2c/
Date: Sat, 17 May 2025 13:41:06 +0200
Message-ID: <20250517114106.43494-24-hdegoede@redhat.com>
In-Reply-To: <20250517114106.43494-1-hdegoede@redhat.com>
References: <20250517114106.43494-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

The atomisp gc0310 sensor driver has now been fully converted to
a standard v4l2 sensor driver. Move it to drivers/media/i2c/
to reflect this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 MAINTAINERS                                            |  6 ++++++
 drivers/media/i2c/Kconfig                              | 10 ++++++++++
 drivers/media/i2c/Makefile                             |  1 +
 .../i2c/atomisp-gc0310.c => media/i2c/gc0310.c}        |  0
 drivers/staging/media/atomisp/i2c/Kconfig              |  9 ---------
 drivers/staging/media/atomisp/i2c/Makefile             |  1 -
 6 files changed, 17 insertions(+), 10 deletions(-)
 rename drivers/{staging/media/atomisp/i2c/atomisp-gc0310.c => media/i2c/gc0310.c} (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 43a3d9afbb76..445120c55ad7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9800,6 +9800,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/galaxycore,gc0308.yaml
 F:	drivers/media/i2c/gc0308.c
 
+GALAXYCORE GC0310 CAMERA SENSOR DRIVER
+M:	Hans de Goede <hansg@kernel.org>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	drivers/media/i2c/gc0310.c
+
 GALAXYCORE GC05a2 CAMERA SENSOR DRIVER
 M:	Zhi Mao <zhi.mao@mediatek.com>
 L:	linux-media@vger.kernel.org
diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index b213cf27d4ea..bdfa41770090 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -70,6 +70,16 @@ config VIDEO_GC0308
 	  To compile this driver as a module, choose M here: the
 	  module will be called gc0308.
 
+config VIDEO_GC0310
+	tristate "GalaxyCore GC0310 sensor support"
+	select V4L2_CCI_I2C
+	help
+	  This is a Video4Linux2 sensor-level driver for the Galaxycore
+	  GC0310 0.3MP sensor.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called gc0310.
+
 config VIDEO_GC05A2
 	tristate "GalaxyCore gc05a2 sensor support"
 	select V4L2_CCI_I2C
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index 92c1c69b346b..01e9f7259289 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -39,6 +39,7 @@ obj-$(CONFIG_VIDEO_DW9768) += dw9768.o
 obj-$(CONFIG_VIDEO_DW9807_VCM) += dw9807-vcm.o
 obj-$(CONFIG_VIDEO_ET8EK8) += et8ek8/
 obj-$(CONFIG_VIDEO_GC0308) += gc0308.o
+obj-$(CONFIG_VIDEO_GC0310) += gc0310.o
 obj-$(CONFIG_VIDEO_GC05A2) += gc05a2.o
 obj-$(CONFIG_VIDEO_GC08A3) += gc08a3.o
 obj-$(CONFIG_VIDEO_GC2145) += gc2145.o
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/media/i2c/gc0310.c
similarity index 100%
rename from drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
rename to drivers/media/i2c/gc0310.c
diff --git a/drivers/staging/media/atomisp/i2c/Kconfig b/drivers/staging/media/atomisp/i2c/Kconfig
index ef2094c22347..7d447ba7a7e1 100644
--- a/drivers/staging/media/atomisp/i2c/Kconfig
+++ b/drivers/staging/media/atomisp/i2c/Kconfig
@@ -26,12 +26,3 @@ config VIDEO_ATOMISP_GC2235
 	  GC2235 is a 2M raw sensor.
 
 	  It currently only works with the atomisp driver.
-
-config VIDEO_ATOMISP_GC0310
-	tristate "GC0310 sensor support"
-	depends on ACPI
-	depends on I2C && VIDEO_DEV
-	select V4L2_CCI_I2C
-	help
-	  This is a Video4Linux2 sensor-level driver for the Galaxycore
-	  GC0310 0.3MP sensor.
diff --git a/drivers/staging/media/atomisp/i2c/Makefile b/drivers/staging/media/atomisp/i2c/Makefile
index e1637417e5c5..161aa542ef34 100644
--- a/drivers/staging/media/atomisp/i2c/Makefile
+++ b/drivers/staging/media/atomisp/i2c/Makefile
@@ -5,4 +5,3 @@
 
 obj-$(CONFIG_VIDEO_ATOMISP_GC2235)     += atomisp-gc2235.o
 obj-$(CONFIG_VIDEO_ATOMISP_OV2722)     += atomisp-ov2722.o
-obj-$(CONFIG_VIDEO_ATOMISP_GC0310)     += atomisp-gc0310.o
-- 
2.49.0


