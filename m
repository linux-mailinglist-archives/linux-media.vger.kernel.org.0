Return-Path: <linux-media+bounces-24610-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D96FA09077
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 13:32:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DEF31188EC79
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 12:32:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89A9020E008;
	Fri, 10 Jan 2025 12:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FnHPmCmr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42CDDF78
	for <linux-media@vger.kernel.org>; Fri, 10 Jan 2025 12:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736512321; cv=none; b=p5qDEYN3FVyU+TnfUxAG72guk2LjK5EvlyMeT2mk990ZqqJsBq3t2ewQ3FtI/Xo9lJyqnnzbb3dJ3G0kzv2oSnYErsiNODZWrS+ZNq4CPgJVDJ/P7ITbgY5DhZbgYdWOC5H2hutD4SWghtF/ILbQe9w8LoPLCQP/UzL27pMQ+vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736512321; c=relaxed/simple;
	bh=ynoYEf8e255Bg4jgwwDTCT/Dnh62RtjqpzCFJ2/k3Vs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q1Zn9yope2TxQJbUHZW4GPBU6nRRaRvq327x3gWH/0jzk61C/Cy8j54tKZOcELt97N5Nr9rWxc6TgAO9TnPoYW0YTKegw8CmJLpHCuDO4NQKkOv3rwMiIaDV9s6Ru1qnRfIQgNC2IHT4JWG/c14SGnSSgWY4CFkAfQRjI40jRPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FnHPmCmr; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3003c0c43c0so17975401fa.1
        for <linux-media@vger.kernel.org>; Fri, 10 Jan 2025 04:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736512318; x=1737117118; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pu+t3eGEK8ZKk4cbdeq2Wt6p9hR7Yq831BJnA041QI0=;
        b=FnHPmCmrx+ZSL1i7UWGQfvNAX1NaAdyxj9U6obTl+DN8PmrblCkj+KhsYvmpZfizDB
         Qkl9KEZ6l+rEtQ0pVCBYrDk9UdoFWfXx/iW2RaMMqkhrRlTjRiEPZyg09Qg+LASBCtqk
         ox8KrXpY4ixMtVcMr5y14feTgxyHi/+pSpSvk1z24MXki22ZXEgmUXi/PmdzdnOUvQ5k
         306GZZCuZhUGltM2wCV18mWiuxIxHzCb2L7zBuT+EUACN+jPMMirfaPTiPcc/jwE1l91
         yoqlEgwgvTVokFW7LiZurNUVwh1g5ttbGOuUrax8dt87p0L8CU4dO5RdKJaonZGe6B2g
         1Msg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736512318; x=1737117118;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pu+t3eGEK8ZKk4cbdeq2Wt6p9hR7Yq831BJnA041QI0=;
        b=UVOW3aBos5sooH1bTgY8cGwIFVGHYEdRSD+vtuTPmjw+QqrC2bIIkzUWAQe1VDRq/n
         JgptNmAtD5WeruEiKWG8uuU2NFrF8WDut9/3eGkBYJ1y+IjSwzgrJh3MiXL2TGWQ7xge
         4ezjy6iv8uFPfPJGupsPyVFL4zcN14tLY5ViPzj1afHmQjv91hehoanERzJkCdpMAggs
         fGq8fVUPfJ9CL83OSeYALBYemw5XcqccMahKZoYO8TCw0UJoum0Sw+KuirZayzSx7jFf
         LTpMfGzS5uSrKsBFDBg+ScWzu0ZEDBKSJE9VKwLPndno85XVceBad9NwLRIZ+yJvJjV7
         YiWA==
X-Forwarded-Encrypted: i=1; AJvYcCX6dqqCyvAvBjAOQbIpAzEjYEmK8SY/6ZugniX0vlJ74DdT7J5ljZ2DsnIgLglTq88NKova6KPiTHSxig==@vger.kernel.org
X-Gm-Message-State: AOJu0YyW46RoRtpim7RrVCyBQgH7hCRibjlmPNykZmACHuThs/tiBNWP
	ReqdLddwro7j8GGy+U9FM2yke5V7GVRVXMhG4dAaqobZzYx4OO8+c/FwTaAcalI=
X-Gm-Gg: ASbGnct7bhU997BHMkhYlVIxoocz/wqItTr/aHgfRXm4KISRhOGTirvrh0/Fe2A4tYy
	zM3L76Nuxk2ZP2WjvF6Gt6ubOmNHtl2bHr9FRdG7hinNBpgYFVHlFwGzuH5fSw4orVBkNT6Jc62
	t8rSCcvBXFdvOvuNkM5GekMPqPZACbC3qkYAfR9RqHhd1uUYwNQOM2hVmKLzJT+DTMwNA+11c8p
	xCoGdddWHGSXiNAlBVeJ9h+zqXkUzK+JXpZvp04rkHEaTalBe/se2e1WZc2kEnG
X-Google-Smtp-Source: AGHT+IHIqxOyaNaQN2BbTx5w9qm3mPKfSMMsxEhtpOB8wpjQpkZW05iGwIzfb5VpPrzZMnxU/eo2ow==
X-Received: by 2002:a05:651c:1a0c:b0:300:322e:6a with SMTP id 38308e7fff4ca-305f45aed51mr34797561fa.23.1736512317990;
        Fri, 10 Jan 2025 04:31:57 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-305ff0cedafsm4720691fa.29.2025.01.10.04.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 04:31:57 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 10 Jan 2025 14:31:53 +0200
Subject: [PATCH v2 1/3] drm/i2c: tda998x: drop support for platform_data
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-drm-move-tda998x-v2-1-ef2ae5832d21@linaro.org>
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
 linux-media@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5039;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ynoYEf8e255Bg4jgwwDTCT/Dnh62RtjqpzCFJ2/k3Vs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBngRM8LT2PCkJ7DKSTs3koimwKHNVTXiPHe9Tfa
 KflWlY3FruJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ4ETPAAKCRCLPIo+Aiko
 1cFHB/9ziikfq/rWdcHX+v+rI9cm13Q1bzq5NuebkB3/EUtKi7J8WNQqOvl9fQIbix4A01x0Sl1
 oLy855x2xdcOsKws3KrDfzzVjmP1dnftx5x1iJOkV3laaPEFS1O39FFKMSlAPwhlZ+SL4wddGDb
 SX8mCjz09HVmGYVhO1pDNg+RyAyTRMjHIuW1FULp+rKYmofnSuZ+EwGgw9KQ0B1AMpqjX5/2Cbv
 rBuT47VvM2fKlZmRVp3Tu+XzfBrF8HfogpGt/hIwJuCGqiaMVIIl/7BdB1Fsq6gYy/qvtEzRB6B
 G5G0gatX1q6jLqOwkijn3bnYSFWe3soChcbhgSxl3FBqClCS
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


