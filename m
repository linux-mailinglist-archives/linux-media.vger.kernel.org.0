Return-Path: <linux-media+bounces-24612-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CE611A0907A
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 13:32:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 865DF188ECAF
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 12:32:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A457F20E309;
	Fri, 10 Jan 2025 12:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B8cptrXp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FAE120D4FB
	for <linux-media@vger.kernel.org>; Fri, 10 Jan 2025 12:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736512324; cv=none; b=WLKs0cqX4j4exc3gyDdX7voLsbN4d58vf0TdkQWg0djcvNjETGOe88eKgVb8tSI40+YRg3ZX8DvcUuiv6sY2bLI6hzzM4RjVUcsm6WuTc2d2AGNNpqDJONWe9y/B3jtv80Tahwruj7Uv8l/ey7f4AiRX7ukTvPVtFpsk/UUYwGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736512324; c=relaxed/simple;
	bh=8laCO1G6C22Qn5+rN+sCPt76jMJ4MGhNPQxJk96BxX4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q19MsXDXlNIhlr6y9I7HTFE49+PRk6NtN+kl/XwXt4GZieY2XN0+LAaeNavOhtBlZjsC5kUZz/ProERvV14ps8+mMzOYlLjrrSV8CQya9Mb59mAYLlKJ1d3TeHITN85bhoVlzNLh+ZPpPQOQuX47x7XEREVBro3L6M+Rmow3QsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B8cptrXp; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-306007227d3so13767281fa.0
        for <linux-media@vger.kernel.org>; Fri, 10 Jan 2025 04:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736512320; x=1737117120; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LNqcxeemu0dTYtSJZLx7nl127aYJDaVFq9hJPsyhj4k=;
        b=B8cptrXpFNA/KTbWBbgN2KEAgqkmEYJMVVk9UeB48BWmI/mm5Y1oinSW1ZwQCA6D75
         BCkkvhDhiQgnVnrgu9L7Oxf5CeLHxthzKfDKDi0YaXrExoiej/OCnyzdtxVnw6+rSVyX
         mFYnZ7KrpDevLSdtbTM2xVnbD9zn5YF1uWTrJt/IfNf7AoDqDKanNc6+kW1E/LGjDIms
         Zm29e2KXlj99wZMCUpN3BlwlpXYwcoa5YzxRWh1WJOTHXV+xqaQDv3QzwSNRihj75Bj9
         94wwC1ArpCGyahrxJnW/1aG+cS8o3LPQ7XSKIbEArTfNCPfMw202iO8mwvTSlwY+F5wQ
         065w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736512320; x=1737117120;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LNqcxeemu0dTYtSJZLx7nl127aYJDaVFq9hJPsyhj4k=;
        b=OPdrTsw6NPVsoiH+cT+rEyYsOF784nAvXA99HKmRpFTEYq2odjtO/F+4HTNX1CwIjs
         umnnCAiF5CzlmgdVPxJkdybmSfSLu0MhE5FKzjB4iGjso0nqM4cXCfotm6XIdPulob4V
         n+AqBGlal+b8Lpelm9THwcIVT8dnfYMB8a2X/y/HO4diCJoiLV/l0xW4fLwScpp/eIyc
         Psgei0C9BF9xXxVGZK6+/26AaTU/FPYJ34ZOrxwr4Q0ga+UP0TI5BQ/aXCDbQFhAv+qI
         asI44sy9795+WBC9jdes85/k3VC/nwLrJXe6VmDvIvrurrcq/yGTZTG8mxukzmRmg/z3
         pMyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDLtGlCze4OM72UdG8sRZ5ukSKRc3zwvnkGyrzwHaaKqR6c9zvuRzKMg0z0TnEvy3SnAE8c4gDPk8qHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YysTEmEuq6d0BulEAeJTvMool2viAdAYX9MBNCx55UYZ403y5hj
	2wL1ZDBq3wTjao41EardqpBE5h/R6gUu1IDh6TWKdgYqPlkZIJhJx+hKl/mCk60=
X-Gm-Gg: ASbGncvvQQJw9/+F0CqGHFwIT6oQQnZzXF9BbVgQ/1VaYBfMj8nlv2tQs1yWHDsRfTH
	7r1qhAcihRdVLppJuoPv5MKLB+inTF/km2ZmSTTg2/pa40sjzTYf7i8RTduKIcJIgOXDoosDTkq
	bZPsAB5KopK2Byd5/pGUxQTKZy5+FALHxFEDapyZKt6ez1ik8FTSbIuQPD39jikuwBKN+/FWn47
	Tf5Nb3mqjuXfZ3SMUvLPpcJt+Y7MJQNI4lfTt/8gFccmJOreyuBumQfwjgSsnue
X-Google-Smtp-Source: AGHT+IHpCKgjAmWJKiXDpM6QD6fFZBeaBe5TuPx/yke+1hwwlNLWjhZffdT0BC9t/x6+79dRRNucFQ==
X-Received: by 2002:a05:651c:221a:b0:300:38ff:f8d9 with SMTP id 38308e7fff4ca-305f4533083mr26808201fa.3.1736512320358;
        Fri, 10 Jan 2025 04:32:00 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-305ff0cedafsm4720691fa.29.2025.01.10.04.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 04:31:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 10 Jan 2025 14:31:54 +0200
Subject: [PATCH v2 2/3] media: cec: move driver for TDA9950 from drm/i2c
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-drm-move-tda998x-v2-2-ef2ae5832d21@linaro.org>
References: <20250110-drm-move-tda998x-v2-0-ef2ae5832d21@linaro.org>
In-Reply-To: <20250110-drm-move-tda998x-v2-0-ef2ae5832d21@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2936;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=8laCO1G6C22Qn5+rN+sCPt76jMJ4MGhNPQxJk96BxX4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBngRM8PZfvrJ3WUN4XrAgEELpTl91x/xncm8aZ/
 NQ1/RMTwOqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ4ETPAAKCRCLPIo+Aiko
 1T1MB/4y9YgyIHmTdSzZpNz5olrK+8CNKOizShHvjLGlppR0+W+ax17g3FhL7KY98otV0YORhmo
 Sw3GHeT/2j3q6C7ptJekboAfZsTCndAeNaVbGFwwRIpQCkRsC0bxm0Z3/WZO1EmO6+0aD/+TKY3
 iybvwPOa8A5/wxZzeFLH/jNecwdDMdPkE4r4X/8WdzRQwV/1ogiMDPqrOSAcCrlEkjsNw2qOjzN
 uy00+Gk8M3J5QYgSAIumS9vL6O0AmcMJ7YOKFnBDJQZw6SkfiNOeEclMupSieWgTL+GX2N+NRVR
 z/+QeClMiNv5z6SXEm6oDk9tMiDgjQPrOPOdLhyWxb3C6KdL
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Move the driver for NXP TDA9950 / CEC part of TDA998x together to
drivers/media/i2c, close to other CEC drivers. Specify 'default
DRM_I2C_NXP_TDA998X' in order to simplify migration from old config
files as the Kconfig name has been changed to follow media/cec style.

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


