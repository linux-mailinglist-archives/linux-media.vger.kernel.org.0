Return-Path: <linux-media+bounces-24684-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDB9A0B3A4
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2025 10:54:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D5E44163003
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2025 09:54:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDF102045B6;
	Mon, 13 Jan 2025 09:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nkQPG4ol"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4EF1FDA86
	for <linux-media@vger.kernel.org>; Mon, 13 Jan 2025 09:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736762033; cv=none; b=mp8hIwbM/Xv4TLj7ziuEOgiQzBMjQsV1Qa8efPMF8rsLnYcRAMi0OpeYjOZnytwJlUCsDE1oO6NkR4UT6FN/JHNEhJzXK6AOavKfSEB8m4vpsBRXCOuSfQOqyNZrzamLBQ+0+8NyyUeRHdoRMDuV+ex+RdWDKIyCCpeqQ3aGVbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736762033; c=relaxed/simple;
	bh=18CnAyxjLuzT65z1y3huWbOQwdYExGvyWFR+pnRfSqM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nAW+hAb0JfEBQ3qRhN+4T1Z+3zQRc94I6qTjCDp2zAD/0WTNOXxCx/CRYD/ga7kFw26eLJLCznTlfBiZb7cex3NVGzPwchU/j7E3aez6DR1PLD2aGnCVbx9Z34zWxEDsX9BU9e54cvPC9YWg16z1vJtugdac1kWpEg2W/ZEIdf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nkQPG4ol; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-540218726d5so3826440e87.2
        for <linux-media@vger.kernel.org>; Mon, 13 Jan 2025 01:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736762029; x=1737366829; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oXs1vUKOp07Lh7MvZmn/kX1druV2/H8ljgw6d1TArsU=;
        b=nkQPG4olndFpg4DvmZHLGfjVa0iu72FTXsF5hg5IrBemntFJdqyUjPX/sEozAONW59
         /J28nqk/vdeV1jPIjblzhCI25wqqUaD2qMh37axjp7Tfv6JDfeiwd9pP/b6RWtgar1nz
         KlAZNreVIMEB6dqeuBX7VAA9b7/Xchz912aAl/er9nS8e7s8hfz6MJ0bbp477MXtkRvP
         9/ejcHJFfiBZHhfW0ozeXhJQQLethno//PLm95YOrj3PgPM5m/5WjN3fGh7SZ+Um27TD
         odfvvDZnOHPg+Yayfn1qNIKEf4y2Yu/qwoXJ3zmOXaFlJxZMQUFuUbclv2T45e6sC+kU
         mOiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736762029; x=1737366829;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oXs1vUKOp07Lh7MvZmn/kX1druV2/H8ljgw6d1TArsU=;
        b=ZYKxW5tng+x2XKOBZ8L2O/4WLFwfPANQssC/WukrWdjaH3EVgVd4CeSPNhFVhvkQDj
         TFS6MSM9DULofdxldZ55SkDaKQeggXhTI3UYOGIhj/QnMreQ0kSaXj28GoX7OozcIQk5
         zTVDWGEinyFLoNO3xMbv7Uwm5MSmsqMl7MSag3oolS6+NDrOVmriQw8IjodsNoAWF3P9
         rWXdru68qi7sYIAnFyJusvA+MrbYzPCeY2SQG7Q9+gD/fiD/yik+/T47eLbaTJZjr2PP
         Jj06x2SL9I1kjjjMelB1VOCUli5x5Fo0fCpjeWSHfW1FF4FN9zJh8F9McAz9Rslsh+I5
         JzlA==
X-Forwarded-Encrypted: i=1; AJvYcCUHfvgiduRdjY47FyCe0/2lVDk2lQM5yi8WlA6E/zOPhMUvY7eu/gAc22TLBnXuvV3LixfjtX0XD9HlEg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy//Msunm2Rdkoh2Lq8Q0xRhyuLblV4MTm4Mn8GM98LZDQfwQyR
	u4nOWL2nDEQH/rsHheuxqhW9K/SunWHxkBZPf1C9D0YgCOD9PvefQr+ul4h4bIw=
X-Gm-Gg: ASbGncscGzGTjZA8umAvn+0AaS61FL4IXzTo+bv3E75aiC6OVnga1htVaQRjhsd0XOz
	3CTc65XqJGrEq6eqwT+Qgr3J3WavYVvIbhY5GFfVS9nLgS3yfvMQ/G78OtSsiRUmbp8aAMTlCZt
	CvqtfTCsuok8n+Lr3n+MN2PdDzREjpAvw54hyH5+AxAMWeGcCtHcSjmKFKJaNtsisTv9Aan5/JP
	R20pVfb7a+oaXJIkaQrd+QRpLyJj40ugNk/8POrCG3CZmn/pqdI9jHN8d9pn4Hb
X-Google-Smtp-Source: AGHT+IF+h31WfsFmobpodKgDnSta6YnhkeQaVEHS4krRz0FXT9qy9HA9r3wcFLj2hsHiFB0Tc/xx2Q==
X-Received: by 2002:a05:6512:3ba8:b0:540:1f7d:8bc0 with SMTP id 2adb3069b0e04-5428481d028mr6641931e87.49.1736762029457;
        Mon, 13 Jan 2025 01:53:49 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428bea6a67sm1287085e87.167.2025.01.13.01.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 01:53:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 13 Jan 2025 11:53:45 +0200
Subject: [PATCH v3 2/3] media: cec: move driver for TDA9950 from drm/i2c
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250113-drm-move-tda998x-v3-2-214e0682a5e4@linaro.org>
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
 linux-media@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2981;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=18CnAyxjLuzT65z1y3huWbOQwdYExGvyWFR+pnRfSqM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnhOKqiJ4twX8bcD10UooMtxQ99Ns/x9mvJ+v2v
 Kzz8MW494aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ4TiqgAKCRCLPIo+Aiko
 1b9UB/4n5SnoZc7cCIp92otesK+Heqeq+wluKL7rk4XbgQ9hQwSjrtqgB09Y67E5tndPI0qZHI8
 vU7O7F4YptLo/rQDV4LMK8ZLnDHgGhMw8YpwzbtarzBxXJa3lBzSouVliNzvjIo4osZ/6tizyIa
 K8SrAsGisdsilo183vplQN1/5pSgRdagFEpmjbdGRfOGrozfFkOwU+L/uvQiIusA+cdUIpXaMXz
 qE83C/yL/1s/Y/IxnK3MtlFbLBNrgqdVzbC9Dh+5r9XHghE5oOYnxF97nT3RK+0b8vZYRF226EQ
 RJB39Bn0wbRytlwLEGdHo7FYKmG/qJwDiFVFlXDvFRS2vDl8
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Move the driver for NXP TDA9950 / CEC part of TDA998x together to
drivers/media/i2c, close to other CEC drivers. Specify 'default
DRM_I2C_NXP_TDA998X' in order to simplify migration from old config
files as the Kconfig name has been changed to follow media/cec style.

Acked-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/i2c/Kconfig                  | 5 -----
 drivers/gpu/drm/i2c/Makefile                 | 1 -
 drivers/media/cec/i2c/Kconfig                | 9 +++++++++
 drivers/media/cec/i2c/Makefile               | 1 +
 drivers/{gpu/drm => media/cec}/i2c/tda9950.c | 0
 5 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i2c/Kconfig b/drivers/gpu/drm/i2c/Kconfig
index d5200f67958e68a8ec73401f1d3b79cbe0aa303d..1aa2a0bf5cc183b4ce92fc4f7eb61fd0065250d1 100644
--- a/drivers/gpu/drm/i2c/Kconfig
+++ b/drivers/gpu/drm/i2c/Kconfig
@@ -10,9 +10,4 @@ config DRM_I2C_NXP_TDA998X
 	help
 	  Support for NXP Semiconductors TDA998X HDMI encoders.
 
-config DRM_I2C_NXP_TDA9950
-	tristate "NXP Semiconductors TDA9950/TDA998X HDMI CEC"
-	select CEC_NOTIFIER
-	select CEC_CORE
-
 endmenu
diff --git a/drivers/gpu/drm/i2c/Makefile b/drivers/gpu/drm/i2c/Makefile
index 31fd35527d99d7eb23851d290175a3ff0c756772..45791fbfae983eecf58565109cf8eecb6431643b 100644
--- a/drivers/gpu/drm/i2c/Makefile
+++ b/drivers/gpu/drm/i2c/Makefile
@@ -1,4 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
 tda998x-y := tda998x_drv.o
 obj-$(CONFIG_DRM_I2C_NXP_TDA998X) += tda998x.o
-obj-$(CONFIG_DRM_I2C_NXP_TDA9950) += tda9950.o
diff --git a/drivers/media/cec/i2c/Kconfig b/drivers/media/cec/i2c/Kconfig
index d912d143fb3129c6b3d0133dbfceffdd48bd543d..b9d21643eef1892ccff508b1864db30e83570212 100644
--- a/drivers/media/cec/i2c/Kconfig
+++ b/drivers/media/cec/i2c/Kconfig
@@ -13,3 +13,12 @@ config CEC_CH7322
 	  generic CEC framework interface.
 	  CEC bus is present in the HDMI connector and enables communication
 	  between compatible devices.
+
+config CEC_NXP_TDA9950
+	tristate "NXP Semiconductors TDA9950/TDA998X HDMI CEC"
+	select CEC_NOTIFIER
+	select CEC_CORE
+	default DRM_I2C_NXP_TDA998X
+	help
+	  This is a driver for the NXP TDA9950 CEC controller and for the CEC
+	  controller block integrated into several NXP TDA998x HDMI encoders.
diff --git a/drivers/media/cec/i2c/Makefile b/drivers/media/cec/i2c/Makefile
index d7496dfd0fa49631299ff56c20e946757e50cdb2..95c9eda5258361c4d9196acb527e0c1b4351dbe0 100644
--- a/drivers/media/cec/i2c/Makefile
+++ b/drivers/media/cec/i2c/Makefile
@@ -3,3 +3,4 @@
 # Makefile for the CEC I2C device drivers.
 #
 obj-$(CONFIG_CEC_CH7322) += ch7322.o
+obj-$(CONFIG_CEC_NXP_TDA9950) += tda9950.o
diff --git a/drivers/gpu/drm/i2c/tda9950.c b/drivers/media/cec/i2c/tda9950.c
similarity index 100%
rename from drivers/gpu/drm/i2c/tda9950.c
rename to drivers/media/cec/i2c/tda9950.c

-- 
2.39.5


