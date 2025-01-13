Return-Path: <linux-media+bounces-24685-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 296E7A0B3A9
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2025 10:54:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B92618819AF
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2025 09:54:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A547B21ADB7;
	Mon, 13 Jan 2025 09:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nAhcCpes"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EFAC204599
	for <linux-media@vger.kernel.org>; Mon, 13 Jan 2025 09:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736762035; cv=none; b=R+vjqNbtRNZzmwMvtwvjxgf3xdN/vRPIZfyxVLpR+kO+jrtRe81J3a+4yYMFC162gsTKqiNP8jkoTiX1ygIVdW7ZBH7Vl3yCXBYh03vd+wPXvweQmmpBvxvbuniE/DjPR30JpWQN7zyM6+MGRhxJnHDRyY9I37cRKTqQtmVk1Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736762035; c=relaxed/simple;
	bh=Ic17kfBFEswigerUPPyAWbVpLAW5I7CJRGIoF3f2Cz4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HQPGjAzTp2KtcFZEytw2HBUbMjSZGJ1hCl6Xe0fJCltSIr3Ig0WEKNpvUbaJY0G8fSkzYf/a0KA+5xEIHkfNKabdsTVoxRuZx3qFB7vOSCESUuvstDhx4+C8ugkIA37DtxXrIxhFlS3GZ4+DyyuMd2dhusuqYaVjBhlqI9X8jik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nAhcCpes; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5401c68b89eso4434055e87.0
        for <linux-media@vger.kernel.org>; Mon, 13 Jan 2025 01:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736762031; x=1737366831; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tYam0PHNUR63LLlWlH1Vtdfw12t5C9h1Tb67zYZaKyw=;
        b=nAhcCpesne6L1QEgNnbO1ue9CkbiD+ShhTMVvd61BEgJrzvaFkW+v7JAU7IwP3SCAz
         AbEX5mMCrzDHTUksBy86X9DWGFHGfANqGM+Qrp1WUUz+lOzfpGcMoQK7LKTcvsr7ftAl
         VN0J+B0F0gtzJTd7KAOq9kilICPjN3a0/K+jgdpZKfIu6lj9Xn5EsZd3hDgAZyhxqC4b
         078Sa1uM+sbrMZzIEinE+vwPkBX+WEmgvMIG/d48Qe22kZlsCQTOc9N1ycrDhg6pZiGe
         Qi2p6KsfFAgwQg54Tf8SpPz1DqRi+MpjGnt8u+zPLdg9iRA0UueGu+T78mM0HPjHQhEK
         x88Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736762031; x=1737366831;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tYam0PHNUR63LLlWlH1Vtdfw12t5C9h1Tb67zYZaKyw=;
        b=ZJesMDqC2ylUwqb/RTF0Qz3D4kaCyATTywuNMk6IOAdmvAUJsTM/ZRTvs1ADpvFO88
         KV0A9RiqsDS4PBd7EuQWbiaTmHHAkOZeGoxqexmxOjO6XQQ3cp/fcnvmRachmh7Q04P5
         KdwIjx2CTNItj/I0swuvkt3evIFhWhzqyJk5csT33ObqyeylWDdXx6YBURBMyWGmIqkP
         5RdZk06TuLPcLUNvSA3upkzrkl7JT2zR8RL67XNHecibVBnXPvHZ9eSoQ0qT+OjCGMBp
         EHsVQ/wxcLKlwVn53mrZdnb5IUDaax2nTMZc54AaohIFICLSyPNwE1l8lfPoT/edjaKG
         5njg==
X-Forwarded-Encrypted: i=1; AJvYcCWMH8tWroKNiLS+C8Os/eY663sfLu2bqX6OVJaD5L8mRPedYcLRDQVjVr0V+07dW5n6TEinz31JNfg9lw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGwo1vb9MXjNz7kjVG2qsLOXQnXfa31qW25aaAsaLE7GWAay0s
	KFY/CzYVeHaA8PB5lGe0WKWJWK3hBTo0ioKHEUYvvFrOcJXx2KpfqKjC9riPH6Q=
X-Gm-Gg: ASbGncsLeKndM6aVMyI9g6vYKIVAZ72PvPXqN3fC49M4azbbWnAFWzJc4w4xGUD+nDH
	L1DXEUHJmBB3Y5pQPJRIztAMVp6pF7patSWYCuz2Y9ypEoU9mH6zhnD9IjZFd0UaKMIlUHaV5AN
	10/nkxbCf2o6s9JjB1s93bmdA5x7m0eIKYiwymd03FVYPz+LT18uJ2r8SXMiN9BCIL0eqclucKt
	BHogQSxQQi4vALgHxJgiTg5Bk3NF6+yL516N9BZSiF7wCbiXg+nBt1xG7Qv8cHq
X-Google-Smtp-Source: AGHT+IEgZgMT6aGcz1FkeuACFwbNLj4TxthV4kSPiuMJ/6t2E3WuFNbC0Qw+Px78twvyB2hiXv5GzQ==
X-Received: by 2002:a05:6512:318b:b0:542:23b2:8010 with SMTP id 2adb3069b0e04-5428a68a3e5mr4531967e87.23.1736762031085;
        Mon, 13 Jan 2025 01:53:51 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428bea6a67sm1287085e87.167.2025.01.13.01.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 01:53:49 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 13 Jan 2025 11:53:46 +0200
Subject: [PATCH v3 3/3] drm/i2c: move TDA998x driver under
 drivers/gpu/drm/bridge
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250113-drm-move-tda998x-v3-3-214e0682a5e4@linaro.org>
References: <20250113-drm-move-tda998x-v3-0-214e0682a5e4@linaro.org>
In-Reply-To: <20250113-drm-move-tda998x-v3-0-214e0682a5e4@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Liviu Dudau <liviu.dudau@arm.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Hans Verkuil <hverkuil@xs4all.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-media@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4689;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Ic17kfBFEswigerUPPyAWbVpLAW5I7CJRGIoF3f2Cz4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnhOKqewzGoygP5cg0eoYvM91fAPhTv299hcS1p
 OK4U+10NraJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ4TiqgAKCRCLPIo+Aiko
 1ZINCACp1RNdlKNHD1se30iTWT5n30rRxiyxYCZcqKUjC5TLJQ5gmkz2sv+HltGnP/RxTLTdp41
 0WvWsU9C0PO7X/KXxRUzP1A7Dzwll13s0kxmMDJf1+tbBMQgiLBKqbeZNSjKgIeTzZAQg5+v94n
 MSiG2ONdyWD0JY/dxl3rSRWCLNRZnE9J7mCnXoe7LRtBDBF+vL7j4sVkKenzUbB4dbXixGaqdz5
 JLtz6MEnjtW7susXlaSx+L6bHYP7SPIfuzCfs6WnHn+QqKMFG7byaSskl5rEL4LWOvbHU7E3lpx
 K69eJ4UwN9AlE3ZYk3oeWu82lrvS/ESmhG2XKt9FoLalcI93
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

TDA998x is the HDMI bridge driver, incorporating drm_connector and
optional drm_encoder (created via the component bind API by the TICLDC
and HDLCD drivers). Thus it should be residing together with the other
DRM bridge drivers under drivers/gpu/drm/bridge/.

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
Acked-by: Liviu Dudau <liviu.dudau@arm.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 MAINTAINERS                                   |  2 +-
 drivers/gpu/drm/arm/Kconfig                   |  1 +
 drivers/gpu/drm/bridge/Kconfig                |  8 ++++++++
 drivers/gpu/drm/bridge/Makefile               |  4 ++++
 drivers/gpu/drm/{i2c => bridge}/tda998x_drv.c |  0
 drivers/gpu/drm/i2c/Kconfig                   | 13 -------------
 drivers/gpu/drm/i2c/Makefile                  |  3 ---
 7 files changed, 14 insertions(+), 17 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 223eb6bfd0579768c246dcc51831048627fb8d02..7a15fb49c2905dcba7bc08f03abe12bd7f493f84 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17045,7 +17045,7 @@ M:	Russell King <linux@armlinux.org.uk>
 S:	Maintained
 T:	git git://git.armlinux.org.uk/~rmk/linux-arm.git drm-tda998x-devel
 T:	git git://git.armlinux.org.uk/~rmk/linux-arm.git drm-tda998x-fixes
-F:	drivers/gpu/drm/i2c/tda998x_drv.c
+F:	drivers/gpu/drm/bridge/tda998x_drv.c
 F:	include/dt-bindings/display/tda998x.h
 K:	"nxp,tda998x"
 
diff --git a/drivers/gpu/drm/arm/Kconfig b/drivers/gpu/drm/arm/Kconfig
index c901ac00c0c3a8f356bd53d97305c6b39b3e6662..ed3ed617c6884876368c8bd072c53f1b710df443 100644
--- a/drivers/gpu/drm/arm/Kconfig
+++ b/drivers/gpu/drm/arm/Kconfig
@@ -9,6 +9,7 @@ config DRM_HDLCD
 	select DRM_CLIENT_SELECTION
 	select DRM_KMS_HELPER
 	select DRM_GEM_DMA_HELPER
+	select DRM_BRIDGE # for TDA998x
 	help
 	  Choose this option if you have an ARM High Definition Colour LCD
 	  controller.
diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 6b4664d91faa80f096ac6a0548ed342e802ae68b..d20f1646dac27898ecb7599a9a06663357dcca14 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -90,6 +90,14 @@ config DRM_FSL_LDB
 	help
 	  Support for i.MX8MP DPI-to-LVDS on-SoC encoder.
 
+config DRM_I2C_NXP_TDA998X
+       tristate "NXP Semiconductors TDA998X HDMI encoder"
+       default m if DRM_TILCDC
+       select CEC_CORE if CEC_NOTIFIER
+       select SND_SOC_HDMI_CODEC if SND_SOC
+       help
+         Support for NXP Semiconductors TDA998X HDMI encoders.
+
 config DRM_ITE_IT6263
 	tristate "ITE IT6263 LVDS/HDMI bridge"
 	depends on OF
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index 97304b429a530c108dcbff906965cda091b0a7a2..245e8a27e3fc525ffe02103e4436c71313f55d9a 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -6,6 +6,10 @@ obj-$(CONFIG_DRM_CHRONTEL_CH7033) += chrontel-ch7033.o
 obj-$(CONFIG_DRM_CROS_EC_ANX7688) += cros-ec-anx7688.o
 obj-$(CONFIG_DRM_DISPLAY_CONNECTOR) += display-connector.o
 obj-$(CONFIG_DRM_FSL_LDB) += fsl-ldb.o
+
+tda998x-y := tda998x_drv.o
+obj-$(CONFIG_DRM_I2C_NXP_TDA998X) += tda998x.o
+
 obj-$(CONFIG_DRM_ITE_IT6263) += ite-it6263.o
 obj-$(CONFIG_DRM_ITE_IT6505) += ite-it6505.o
 obj-$(CONFIG_DRM_LONTIUM_LT8912B) += lontium-lt8912b.o
diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/bridge/tda998x_drv.c
similarity index 100%
rename from drivers/gpu/drm/i2c/tda998x_drv.c
rename to drivers/gpu/drm/bridge/tda998x_drv.c
diff --git a/drivers/gpu/drm/i2c/Kconfig b/drivers/gpu/drm/i2c/Kconfig
deleted file mode 100644
index 1aa2a0bf5cc183b4ce92fc4f7eb61fd0065250d1..0000000000000000000000000000000000000000
--- a/drivers/gpu/drm/i2c/Kconfig
+++ /dev/null
@@ -1,13 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-menu "I2C encoder or helper chips"
-     depends on DRM && DRM_KMS_HELPER && I2C
-
-config DRM_I2C_NXP_TDA998X
-	tristate "NXP Semiconductors TDA998X HDMI encoder"
-	default m if DRM_TILCDC
-	select CEC_CORE if CEC_NOTIFIER
-	select SND_SOC_HDMI_CODEC if SND_SOC
-	help
-	  Support for NXP Semiconductors TDA998X HDMI encoders.
-
-endmenu
diff --git a/drivers/gpu/drm/i2c/Makefile b/drivers/gpu/drm/i2c/Makefile
deleted file mode 100644
index 45791fbfae983eecf58565109cf8eecb6431643b..0000000000000000000000000000000000000000
--- a/drivers/gpu/drm/i2c/Makefile
+++ /dev/null
@@ -1,3 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-tda998x-y := tda998x_drv.o
-obj-$(CONFIG_DRM_I2C_NXP_TDA998X) += tda998x.o

-- 
2.39.5


