Return-Path: <linux-media+bounces-24683-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9639AA0B3A2
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2025 10:54:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9FF70162B63
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2025 09:54:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60E6A204589;
	Mon, 13 Jan 2025 09:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KnSwKa5Q"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB53A1FDA6A
	for <linux-media@vger.kernel.org>; Mon, 13 Jan 2025 09:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736762031; cv=none; b=aJlNPwbtuV6rd0FZSd6jUami9GoFcEe+0FMvpSRVwuRjJB/Itet4LcBL4T9QSQciKuyXZTX744DPKvzIXFBrvBd6I2EGhi9vRfDq+bZBAlYPa3SVm5y4b4+SpphQkHnUB46DdT0D9vnthZ4R90bnhSWAQowRaA/0gga8LcN72k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736762031; c=relaxed/simple;
	bh=ynoYEf8e255Bg4jgwwDTCT/Dnh62RtjqpzCFJ2/k3Vs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OKJFVEGOKqFqkhnSXQg+E9d6H9XR1D0lWBOzuWJkO89bNk7I5bSjx+O7ZQnMuHG3ChOZtv2t85h2ETh+hmvG3v3M8VzZ+W0Emf5/gccBqnpJtq7EJP+99Rj5hENpEEg8Q+LE2uOpUMygmfca521aS5KHfq+Bs7hsAXNQYlqlUbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KnSwKa5Q; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-540218726d5so3826407e87.2
        for <linux-media@vger.kernel.org>; Mon, 13 Jan 2025 01:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736762028; x=1737366828; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pu+t3eGEK8ZKk4cbdeq2Wt6p9hR7Yq831BJnA041QI0=;
        b=KnSwKa5QGKUqwrfgeO3MA7Y+Pf+Iuz1mIguJoV0EdHQhTgKeVivosvAsQ0qxF/t2gR
         yOMiNKXGZku1QnwqBqKAoRqEC1pflz9AGoEagX6lOKzg07g31aOtp9OXSyUSv/ZOWEh0
         NGUg1sZomJQS7xeB2lo9oNtxihhsi/RUMpPoG50SFd6RY/RUyzgSb26T3vDBGPS9PkW6
         DQ3N++kTHrLJ3barbH2C0UgKfoxX6gVLaD4umX+GhSLwNccsAyLazcuwlqaYY4wps/u/
         1guRfN+0OMq2MKkOeFLiTj4JgFrEuoL+G//6oTtpWbP5zFSfwa8Gdi1dO+40nfj9wzG0
         eIsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736762028; x=1737366828;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pu+t3eGEK8ZKk4cbdeq2Wt6p9hR7Yq831BJnA041QI0=;
        b=wRsHW9jokHe8mYiE03g1Biu+HZsgFQ88i8tcht66iy6rzu3Kx8lZLvFFSv3wdOCvEk
         aXhDpifLmkltywANi7FuFHqnpL6KVDEM28T54URjazfPbwPVavEadJg4PkvAFEdI7Nn0
         +nWqa8W4FGAF2nINS+6U6plkj5VG4NtHdPWOXy2vS35eWdW68ffB2lGH0STXuM4sm2cH
         qi6TO8IqJLiwrHEQcUcXo2K7T87YRetnQRUZ7c31Aqm4Uy2sT/CImzg9AQfdKXgxgwRi
         zS9O4t6RQNGL5c6wF6yWPAthOkmZXS2pUSG5sHWGoxDLCDdp27q7z0rPnih6lpGngfN3
         hbag==
X-Forwarded-Encrypted: i=1; AJvYcCUlOq7eD5lWOloGSsUPiqLuUharBzQfNqiAoeDJWZ2ruplU5dHq9qHh78Ld63Mam92ZmaIxEcvJymeq0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUtUYbjhxHBX4XZ+yen9yw2HaUGxICImXb6weiYLTOeq5Zytuf
	tVk2iF21p6FtqJ/HE9aPDjoVlpIt5sur8zurtXEIG7kcBDfEj8rCTNHPwBTBntI=
X-Gm-Gg: ASbGncsXENx3a/7JvGDs06R5fIdG9PrabgsNpa6Dlr73I6QJ4x+qmXegghmsMLqGz9e
	BUV2HzrOtuuZS5DyrWeW5wHzegPdUTJsh5MBawqDG5qEiZnXvn0X2djCwjz9gYMzl6vxRn1oqSq
	S5d1EP3pFKU7bi7ju44urvYXQ1rYmAbRe7cznl+BcQEvqDfEgbXhlg8jBHUSNXmNGjToO+lGSN7
	JKIJP6hwOz6uqEeudgOJqQAXh+MZnIfvf5dIfW+N3W8aQ3+XyOdYpUSEAvdC/BC
X-Google-Smtp-Source: AGHT+IGyYsua+oSEuP0SJyrXE0+rZOjxnrGvxktSXWp88tTL5G6A6GO6/YM4oZ7l3TYHL2JM9UtLxA==
X-Received: by 2002:a05:6512:3b9d:b0:542:6d01:f55f with SMTP id 2adb3069b0e04-5428481ceaamr6522362e87.48.1736762027923;
        Mon, 13 Jan 2025 01:53:47 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428bea6a67sm1287085e87.167.2025.01.13.01.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 01:53:47 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 13 Jan 2025 11:53:44 +0200
Subject: [PATCH v3 1/3] drm/i2c: tda998x: drop support for platform_data
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250113-drm-move-tda998x-v3-1-214e0682a5e4@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5039;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ynoYEf8e255Bg4jgwwDTCT/Dnh62RtjqpzCFJ2/k3Vs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnhOKq+7t8TNgfGh825v8KqzGW6hDBCJjGIJUtt
 6MkbRUdqOWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ4TiqgAKCRCLPIo+Aiko
 1VonB/0ZfyIt5HcpNepYuB1zqHG3DQTe7QjNBrzkMoJ2Tj9sTZr/nVTqTW7bOzvnVpRk89YgbVV
 2CUtU+Aez1UIMe94fBVA32wvlXipmPzSIv0DtoLHEepvuOwygjF0TN2RAY2mQsNJ6vpYACzDHau
 FES2Dar2JY4tZukZtN7NQmNjuc9ydnHU7B6giwyAQpY7cZuqzFPUkwbEiu83h2gs6t5i/6lPyHp
 LGTgl0us7w4HMnCd6pXVsRlWnuQG+JSFh+BgMlVeHorP5BFK7eaiG0/sXZy7UnZNjpFuRINrvtC
 9U/HAl6K0rniWjdtoJgIDjh1jh5SjY5N4EIkE/KaWbq28apo
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

After the commit 0fb2970b4b6b ("drm/armada: remove non-component
support") there are no remaining users of the struct
tda998x_encoder_params. Drop the header and corresponding API from the
TDA998x driver.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 MAINTAINERS                       |  1 -
 drivers/gpu/drm/i2c/tda998x_drv.c | 49 ++++-----------------------------------
 include/drm/i2c/tda998x.h         | 40 --------------------------------
 3 files changed, 4 insertions(+), 86 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a3566163f1cbd583b8fdb7f2f18d5289263adc31..223eb6bfd0579768c246dcc51831048627fb8d02 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17046,7 +17046,6 @@ S:	Maintained
 T:	git git://git.armlinux.org.uk/~rmk/linux-arm.git drm-tda998x-devel
 T:	git git://git.armlinux.org.uk/~rmk/linux-arm.git drm-tda998x-fixes
 F:	drivers/gpu/drm/i2c/tda998x_drv.c
-F:	include/drm/i2c/tda998x.h
 F:	include/dt-bindings/display/tda998x.h
 K:	"nxp,tda998x"
 
diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/i2c/tda998x_drv.c
index 82d4a4e206a584e045a8fcd593fc12b7c1257bfe..ebc758c72891188e236d4da0cde283f108d80aca 100644
--- a/drivers/gpu/drm/i2c/tda998x_drv.c
+++ b/drivers/gpu/drm/i2c/tda998x_drv.c
@@ -21,10 +21,11 @@
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
-#include <drm/i2c/tda998x.h>
 
 #include <media/cec-notifier.h>
 
+#include <dt-bindings/display/tda998x.h>
+
 #define DBG(fmt, ...) DRM_DEBUG(fmt"\n", ##__VA_ARGS__)
 
 enum {
@@ -1717,10 +1718,10 @@ static int tda998x_get_audio_ports(struct tda998x_priv *priv,
 		u8 ena_ap = be32_to_cpup(&port_data[2*i+1]);
 
 		switch (afmt) {
-		case AFMT_I2S:
+		case TDA998x_I2S:
 			route = AUDIO_ROUTE_I2S;
 			break;
-		case AFMT_SPDIF:
+		case TDA998x_SPDIF:
 			route = AUDIO_ROUTE_SPDIF;
 			break;
 		default:
@@ -1746,44 +1747,6 @@ static int tda998x_get_audio_ports(struct tda998x_priv *priv,
 	return 0;
 }
 
-static int tda998x_set_config(struct tda998x_priv *priv,
-			      const struct tda998x_encoder_params *p)
-{
-	priv->vip_cntrl_0 = VIP_CNTRL_0_SWAP_A(p->swap_a) |
-			    (p->mirr_a ? VIP_CNTRL_0_MIRR_A : 0) |
-			    VIP_CNTRL_0_SWAP_B(p->swap_b) |
-			    (p->mirr_b ? VIP_CNTRL_0_MIRR_B : 0);
-	priv->vip_cntrl_1 = VIP_CNTRL_1_SWAP_C(p->swap_c) |
-			    (p->mirr_c ? VIP_CNTRL_1_MIRR_C : 0) |
-			    VIP_CNTRL_1_SWAP_D(p->swap_d) |
-			    (p->mirr_d ? VIP_CNTRL_1_MIRR_D : 0);
-	priv->vip_cntrl_2 = VIP_CNTRL_2_SWAP_E(p->swap_e) |
-			    (p->mirr_e ? VIP_CNTRL_2_MIRR_E : 0) |
-			    VIP_CNTRL_2_SWAP_F(p->swap_f) |
-			    (p->mirr_f ? VIP_CNTRL_2_MIRR_F : 0);
-
-	if (p->audio_params.format != AFMT_UNUSED) {
-		unsigned int ratio, route;
-		bool spdif = p->audio_params.format == AFMT_SPDIF;
-
-		route = AUDIO_ROUTE_I2S + spdif;
-
-		priv->audio.route = &tda998x_audio_route[route];
-		priv->audio.cea = p->audio_params.cea;
-		priv->audio.sample_rate = p->audio_params.sample_rate;
-		memcpy(priv->audio.status, p->audio_params.status,
-		       min(sizeof(priv->audio.status),
-			   sizeof(p->audio_params.status)));
-		priv->audio.ena_ap = p->audio_params.config;
-		priv->audio.i2s_format = I2S_FORMAT_PHILIPS;
-
-		ratio = spdif ? 64 : p->audio_params.sample_width * 2;
-		return tda998x_derive_cts_n(priv, &priv->audio, ratio);
-	}
-
-	return 0;
-}
-
 static void tda998x_destroy(struct device *dev)
 {
 	struct tda998x_priv *priv = dev_get_drvdata(dev);
@@ -1982,10 +1945,6 @@ static int tda998x_create(struct device *dev)
 		if (priv->audio_port_enable[AUDIO_ROUTE_I2S] ||
 		    priv->audio_port_enable[AUDIO_ROUTE_SPDIF])
 			tda998x_audio_codec_init(priv, &client->dev);
-	} else if (dev->platform_data) {
-		ret = tda998x_set_config(priv, dev->platform_data);
-		if (ret)
-			goto fail;
 	}
 
 	priv->bridge.funcs = &tda998x_bridge_funcs;
diff --git a/include/drm/i2c/tda998x.h b/include/drm/i2c/tda998x.h
deleted file mode 100644
index 3cb25ccbe5e68bf95ce13249f15549b7e2582281..0000000000000000000000000000000000000000
--- a/include/drm/i2c/tda998x.h
+++ /dev/null
@@ -1,40 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __DRM_I2C_TDA998X_H__
-#define __DRM_I2C_TDA998X_H__
-
-#include <linux/hdmi.h>
-#include <dt-bindings/display/tda998x.h>
-
-enum {
-	AFMT_UNUSED =	0,
-	AFMT_SPDIF =	TDA998x_SPDIF,
-	AFMT_I2S =	TDA998x_I2S,
-};
-
-struct tda998x_audio_params {
-	u8 config;
-	u8 format;
-	unsigned sample_width;
-	unsigned sample_rate;
-	struct hdmi_audio_infoframe cea;
-	u8 status[5];
-};
-
-struct tda998x_encoder_params {
-	u8 swap_b:3;
-	u8 mirr_b:1;
-	u8 swap_a:3;
-	u8 mirr_a:1;
-	u8 swap_d:3;
-	u8 mirr_d:1;
-	u8 swap_c:3;
-	u8 mirr_c:1;
-	u8 swap_f:3;
-	u8 mirr_f:1;
-	u8 swap_e:3;
-	u8 mirr_e:1;
-
-	struct tda998x_audio_params audio_params;
-};
-
-#endif

-- 
2.39.5


