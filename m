Return-Path: <linux-media+bounces-41896-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B23BFB46F89
	for <lists+linux-media@lfdr.de>; Sat,  6 Sep 2025 15:58:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 68103164731
	for <lists+linux-media@lfdr.de>; Sat,  6 Sep 2025 13:58:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF3ED2FDC58;
	Sat,  6 Sep 2025 13:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="On7FLZGj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78E62FC026;
	Sat,  6 Sep 2025 13:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757166862; cv=none; b=qzA72nnh1rBqfiL4WJRJ3kea4INqsE/GE+AQkqSMsQzLhMj1WxqPs5+CpBKblbwqjiQ2shXuJzraqzFdEESO7MvUUTkVQoUTWD2AffrlCLnAOopyr4/Zr9XuuuwK2mBp1nEjPoSI+HKcKCXNGk6MPOuZ2lBs7hxTIRpq9Xh7F2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757166862; c=relaxed/simple;
	bh=oDbo9QsqEy2foTEPE1s1RDeFNVI2fu9L/rdGqqDdpzA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DPr2OUOhWP/Yh0d0kporfWmaN/QNKy9K1CAxQ4xiE4uqIEBgGGJ31GjLWFIAOxSwWCu1KW/WAbC5PXiPxxdfk2PDbwdSZBO0vQ2OXbZmX1EjDkgBbnXq3UjK0qMjt40A2am6efO2JEULEWzxgTJTj1uQvNN1yzWvQGB63i49W00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=On7FLZGj; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-55f7039aa1eso3417708e87.1;
        Sat, 06 Sep 2025 06:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757166858; x=1757771658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dchXyakOLLQNmX90Db7XOELO9qq/NGifFST78n+g49g=;
        b=On7FLZGj6bsFKlaKcmcY0DeUHSy7CaRRMZtn7NiakOYT31RxQVWyNGhtb0xgEV8eDL
         0SWBZ1OxILDtZn3nG4fXo6OeF6ASIld15H3WVUEWztIAjj1/El40ZvE7PRoVeYcmLJss
         x08cTS71wbvLifFSvzos6Hc7/atd8Qbe/989mfMa9QftZXPSH3Md3FFDSyGf2sKaV+n/
         M96n4Irh7GQ4G14OlVPywp/1M1lA0R6qCLd/5t42Cm2o+PD8HjOQRDO0JLUJPsEDewMq
         bo8YVLem2wGGdKYmGxzrRKxveQ+BnNX5e2Kl57EecR4nX3yPXCFuly/M0d25/m8Kt1ok
         NS3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757166858; x=1757771658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dchXyakOLLQNmX90Db7XOELO9qq/NGifFST78n+g49g=;
        b=FM0RZnrSm55T8WVe4ZJ9AJLl5dUHd2k9NkQDtiT0tTlX+dfgMK/WPY9MTYbUDYd5Ux
         Gd87vpNl5y/q20oa+pro9oTSDxu8yapPaQY5imfsYKnJ8RNJNBmbjaUDkAIVh7WnFYP6
         OxZehpEQ/aTHavWWj52Pn7rX9VnhsFgw5ewDwDVo+0dibrQSRvJcPZKhFq0wMYVa5q7S
         oxF0KdigycJa9pUQT6uLp+xMt/dzjEXqTCohZWGk0AbfqdBZMU1jo1nY51CtxeTE0GeE
         qTZRbxpWkUyBIzly1/CUqbliuSj86EUS5CxXUkuC5kOfKyv6qfkUME2M1arX6Y7uaHvf
         Dnyw==
X-Forwarded-Encrypted: i=1; AJvYcCU3gFE9QGy4IyI4jg9ad1a3V3/QzTs13hCYKPVtGf1aNgD2lWigjE+PS/MfoEe53MlvstdqP9rJOngdbKo=@vger.kernel.org, AJvYcCVeSNooLA7bbXa+qzZqVR4CEEMA8fF7+B4dc/2MUbLE/+hY30acE+bkJxzMAVfwXw7Ls4UzkOh/jXp+@vger.kernel.org, AJvYcCVmnPJnJigddgfZf38ye53gFm0No/BFwwA59TIAYGcZkoisM6822KlcXDlSU1BapoBzgvZg0DakuFiSTCja@vger.kernel.org, AJvYcCWqjGnw0pTgiPcBES9RWgKYdtwsl/GdCz3cL3WbYR8bsxnCq4EbfZBr+2kYCTowaT27uwhf2qmyE8fL3WA=@vger.kernel.org, AJvYcCXqo3zva5jB69YAFMzqIZiuXusjDJT6jrOn9QFjcuoGfNyCeaRx5hm4gd1HrwQd0+MDQQVlTLBRWVdD@vger.kernel.org
X-Gm-Message-State: AOJu0Yzudt53vvQO9XiaPr/CUe8DrOZgeShvNAQr0rkisnoHi5hYWTVJ
	p3mMIG+SFHTDKsaL/10dProiZ5r8XMQckJ+OfszZFLlwPqoRGrQj4ASS
X-Gm-Gg: ASbGncsR40lcFUanqgjGScJ/RGXiCA3BgNcDHX+8iQmf9vEHGkXNruD9etw50KLC5Ub
	lOK97gRYwGJs1XT/3xRbPAPwaGZKeQqvd12PY3QeRSlCh4XTkawE20+m2VoyTW3ZvPPYO+b/E3V
	4D6Pn1rLKSxc3KOG7HonseAiIcAvP7bUIHbHKco6z425eyNPXlA5T5O6Jzk+oT6m6c8liaV8p34
	IcCyjR4wtujIZmz3khskO1gn4js3ZuRJHy2ioeTC0dHL8tmJeZ3nI3VgfN2kckEEHWx4RbFFgaS
	gFuQd927bDpK5t9fSBoN8C1i/MHQsFGaTvxpwFq3tIk0vH5A+cr8EZr9Yj6c0VkK9pxvOF74fRW
	SKpIU53wrtzsnTA==
X-Google-Smtp-Source: AGHT+IH8I2Auff/z35J3ggxpo1vwJ884ltjyjaLfaaaFMsTd6bn72w00EmrUSpTJ7lT5WXdLaRygAQ==
X-Received: by 2002:a05:6512:1546:10b0:562:d04d:fa05 with SMTP id 2adb3069b0e04-562d04dfad0mr274283e87.54.1757166857844;
        Sat, 06 Sep 2025 06:54:17 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ace9c65sm2357467e87.85.2025.09.06.06.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 06:54:17 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 10/23] staging: media: tegra-video: csi: add support for SoCs with integrated MIPI calibration
Date: Sat,  6 Sep 2025 16:53:31 +0300
Message-ID: <20250906135345.241229-11-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250906135345.241229-1-clamor95@gmail.com>
References: <20250906135345.241229-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tegra20/Tegra30 SoC have MIPI calibration logic integrated into CSI block.
This commit adds support for using the entire CSI block for MIPI
calibration not only for CSI itself but for DSI too.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/host1x/mipi.c                     | 18 ++++++++---
 drivers/staging/media/tegra-video/csi.c       |  7 +++-
 drivers/staging/media/tegra-video/tegra20.c   |  1 +
 drivers/staging/media/tegra-video/tegra210.c  |  2 +-
 drivers/staging/media/tegra-video/vi.h        |  3 +-
 .../csi.h => include/linux/tegra-csi.h        |  6 ++++
 include/linux/tegra-mipi-cal.h                | 32 +++++++++++++++++++
 7 files changed, 61 insertions(+), 8 deletions(-)
 rename drivers/staging/media/tegra-video/csi.h => include/linux/tegra-csi.h (95%)

diff --git a/drivers/gpu/host1x/mipi.c b/drivers/gpu/host1x/mipi.c
index 2fa339a428f3..262f71296b75 100644
--- a/drivers/gpu/host1x/mipi.c
+++ b/drivers/gpu/host1x/mipi.c
@@ -215,10 +215,20 @@ struct tegra_mipi_device *tegra_mipi_request(struct device *device,
 		goto free;
 	}
 
-	dev->mipi = platform_get_drvdata(dev->pdev);
-	if (!dev->mipi) {
-		err = -EPROBE_DEFER;
-		goto put;
+	/* Tegra20/Tegra30 add CSI structure to MIPI device */
+	if (of_machine_is_compatible("nvidia,tegra20") ||
+	    of_machine_is_compatible("nvidia,tegra30")) {
+		dev->csi = platform_get_drvdata(dev->pdev);
+		if (!dev->csi) {
+			err = -EPROBE_DEFER;
+			goto put;
+		}
+	} else {
+		dev->mipi = platform_get_drvdata(dev->pdev);
+		if (!dev->mipi) {
+			err = -EPROBE_DEFER;
+			goto put;
+		}
 	}
 
 	of_node_put(args.np);
diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index 9e3bd6109781..3d1d5e1615c2 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -12,11 +12,11 @@
 #include <linux/of_graph.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/tegra-csi.h>
 #include <linux/tegra-mipi-cal.h>
 
 #include <media/v4l2-fwnode.h>
 
-#include "csi.h"
 #include "video.h"
 
 #define MHZ			1000000
@@ -794,6 +794,11 @@ static int tegra_csi_probe(struct platform_device *pdev)
 
 	csi->dev = &pdev->dev;
 	csi->ops = csi->soc->ops;
+	if (csi->soc->mipi_ops)
+		csi->mipi_ops = csi->soc->mipi_ops;
+
+	mutex_init(&csi->mipi_lock);
+
 	platform_set_drvdata(pdev, csi);
 	pm_runtime_enable(&pdev->dev);
 
diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 7b8f8f810b35..461593c49594 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -16,6 +16,7 @@
 #include <linux/host1x.h>
 #include <linux/kernel.h>
 #include <linux/kthread.h>
+#include <linux/tegra-csi.h>
 #include <linux/v4l2-mediabus.h>
 
 #include "vip.h"
diff --git a/drivers/staging/media/tegra-video/tegra210.c b/drivers/staging/media/tegra-video/tegra210.c
index da99f19a39e7..59224c2f9948 100644
--- a/drivers/staging/media/tegra-video/tegra210.c
+++ b/drivers/staging/media/tegra-video/tegra210.c
@@ -13,8 +13,8 @@
 #include <linux/delay.h>
 #include <linux/host1x.h>
 #include <linux/kthread.h>
+#include <linux/tegra-csi.h>
 
-#include "csi.h"
 #include "vi.h"
 
 #define TEGRA210_MIN_WIDTH	32U
diff --git a/drivers/staging/media/tegra-video/vi.h b/drivers/staging/media/tegra-video/vi.h
index cac0c0d0e225..64655ac1b41f 100644
--- a/drivers/staging/media/tegra-video/vi.h
+++ b/drivers/staging/media/tegra-video/vi.h
@@ -12,6 +12,7 @@
 #include <linux/mutex.h>
 #include <linux/spinlock.h>
 #include <linux/wait.h>
+#include <linux/tegra-csi.h>
 
 #include <media/media-entity.h>
 #include <media/v4l2-async.h>
@@ -21,8 +22,6 @@
 #include <media/v4l2-subdev.h>
 #include <media/videobuf2-v4l2.h>
 
-#include "csi.h"
-
 #define V4L2_CID_TEGRA_SYNCPT_TIMEOUT_RETRY	(V4L2_CTRL_CLASS_CAMERA | 0x1001)
 
 #define TEGRA_DEF_WIDTH		1920
diff --git a/drivers/staging/media/tegra-video/csi.h b/include/linux/tegra-csi.h
similarity index 95%
rename from drivers/staging/media/tegra-video/csi.h
rename to include/linux/tegra-csi.h
index 3ed2dbc73ce9..b47f48ef7115 100644
--- a/drivers/staging/media/tegra-video/csi.h
+++ b/include/linux/tegra-csi.h
@@ -115,6 +115,7 @@ struct tegra_csi_ops {
  * struct tegra_csi_soc - NVIDIA Tegra CSI SoC structure
  *
  * @ops: csi hardware operations
+ * @mipi_ops: MIPI calibration operations
  * @csi_max_channels: supported max streaming channels
  * @clk_names: csi and cil clock names
  * @num_clks: total clocks count
@@ -123,6 +124,7 @@ struct tegra_csi_ops {
  */
 struct tegra_csi_soc {
 	const struct tegra_csi_ops *ops;
+	const struct tegra_mipi_ops *mipi_ops;
 	unsigned int csi_max_channels;
 	const char * const *clk_names;
 	unsigned int num_clks;
@@ -139,6 +141,8 @@ struct tegra_csi_soc {
  * @clks: clock for CSI and CIL
  * @soc: pointer to SoC data structure
  * @ops: csi operations
+ * @mipi_ops: MIPI calibration operations
+ * @mipi_lock: for MIPI calibration operations
  * @csi_chans: list head for CSI channels
  */
 struct tegra_csi {
@@ -148,6 +152,8 @@ struct tegra_csi {
 	struct clk_bulk_data *clks;
 	const struct tegra_csi_soc *soc;
 	const struct tegra_csi_ops *ops;
+	const struct tegra_mipi_ops *mipi_ops;
+	struct mutex mipi_lock;
 	struct list_head csi_chans;
 };
 
diff --git a/include/linux/tegra-mipi-cal.h b/include/linux/tegra-mipi-cal.h
index 2bfdbfd3cb77..81784b1f2135 100644
--- a/include/linux/tegra-mipi-cal.h
+++ b/include/linux/tegra-mipi-cal.h
@@ -3,6 +3,8 @@
 #ifndef __TEGRA_MIPI_CAL_H_
 #define __TEGRA_MIPI_CAL_H_
 
+#include <linux/tegra-csi.h>
+
 struct tegra_mipi {
 	const struct tegra_mipi_soc *soc;
 	const struct tegra_mipi_ops *ops;
@@ -17,6 +19,7 @@ struct tegra_mipi {
 struct tegra_mipi_device {
 	struct platform_device *pdev;
 	struct tegra_mipi *mipi;
+	struct tegra_csi *csi;
 	struct device *device;
 	unsigned long pads;
 };
@@ -69,6 +72,14 @@ static inline int tegra_mipi_enable(struct tegra_mipi_device *device)
 		return device->mipi->ops->tegra_mipi_enable(device);
 	}
 
+	/* Tegra20/Tegra30 have MIPI calibration logic inside CSI block */
+	if (device->csi) {
+		if (!device->csi->mipi_ops->tegra_mipi_enable)
+			return 0;
+
+		return device->csi->mipi_ops->tegra_mipi_enable(device);
+	}
+
 	return -ENOSYS;
 }
 
@@ -81,6 +92,13 @@ static inline int tegra_mipi_disable(struct tegra_mipi_device *device)
 		return device->mipi->ops->tegra_mipi_disable(device);
 	}
 
+	if (device->csi) {
+		if (!device->csi->mipi_ops->tegra_mipi_disable)
+			return 0;
+
+		return device->csi->mipi_ops->tegra_mipi_disable(device);
+	}
+
 	return -ENOSYS;
 }
 
@@ -93,6 +111,13 @@ static inline int tegra_mipi_start_calibration(struct tegra_mipi_device *device)
 		return device->mipi->ops->tegra_mipi_start_calibration(device);
 	}
 
+	if (device->csi) {
+		if (!device->csi->mipi_ops->tegra_mipi_start_calibration)
+			return 0;
+
+		return device->csi->mipi_ops->tegra_mipi_start_calibration(device);
+	}
+
 	return -ENOSYS;
 }
 
@@ -105,6 +130,13 @@ static inline int tegra_mipi_finish_calibration(struct tegra_mipi_device *device
 		return device->mipi->ops->tegra_mipi_finish_calibration(device);
 	}
 
+	if (device->csi) {
+		if (!device->csi->mipi_ops->tegra_mipi_finish_calibration)
+			return 0;
+
+		return device->csi->mipi_ops->tegra_mipi_finish_calibration(device);
+	}
+
 	return -ENOSYS;
 }
 
-- 
2.48.1


