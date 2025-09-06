Return-Path: <linux-media+bounces-41893-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B3BB46F7A
	for <lists+linux-media@lfdr.de>; Sat,  6 Sep 2025 15:56:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0AC757B6C87
	for <lists+linux-media@lfdr.de>; Sat,  6 Sep 2025 13:54:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3A8E2FB09B;
	Sat,  6 Sep 2025 13:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c609L9RF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4462F9982;
	Sat,  6 Sep 2025 13:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757166857; cv=none; b=KUSdMCrKVK+mm3FzHX594lx4Bow4nBPQH2+m6+GGcnZUPLcIfVo6Bc4Ig/4KxRyEMWbJHk9L2ZDTTJJOb+/uhWRJFUm8WopXO28A5vHJGMEbMoUrkqw8jgVrxAzfjH1EcX7s6rDEI8L4MW33UTgvAoi+8MXXgdxFcW5mE52y+WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757166857; c=relaxed/simple;
	bh=83trvudS29OzdJHAxuOmZvr+OlnRGtgmEdTMi7zJdY4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K5hpo7siuf3jO8ZhQBzc9/XWi+WwIeswv34eGY2Uzk+SXxZpTWH6FHOAT2sKevt4bNyyxE7dksQlzkSPa7SWRhO1Qf2PHL41W1MmfY4udLoi4NynbgpMghleVpV6Zvjw8CYoAXoHkYqEM4m95gmI19rMH4yqD6wYI3igmDw/K8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c609L9RF; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5608d792558so3492146e87.0;
        Sat, 06 Sep 2025 06:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757166853; x=1757771653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=srN5K9aEte+IHJ7do+e8te0vwtoLo2YE64UbrpcA8GY=;
        b=c609L9RFuB8si+PEcfkeOhE/ctQnw3GnS/BzaJ/z2GTgZUANvRAIjQI4y4/jF28f/G
         FEcREv6B8SdTqkqyTidA6J9I/bdmXrA19v4sEHO8UbWcXdEQvkp3tKJ/GKTWuhWQVKcZ
         3THHCOc/jaP2DsoqnfbIA4z2vTYWguDOd8rBi62KwiWzKNIh7n0kXJroEBR44EtjJLkP
         MAs12ZnWtAGLrsvDe9nByZQcRdoNGUx6ps7Oq+8vTbolesn4LwbceUHCZ0fcbEDqi6Mb
         E7/HMOVoUCFrrQ5sM7IC1GKEUzofvsNKiT7W3CGN0fw48OVB3gKzIOQMdmR8DYsdFU15
         yjtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757166853; x=1757771653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=srN5K9aEte+IHJ7do+e8te0vwtoLo2YE64UbrpcA8GY=;
        b=Z/Qhm0LX/YbPse4rDny6ZX69BUTtze4w5Cs3latYPmYL7WjjTKMLRpPLn1wH1HOY4J
         UqA2kBvKJxPKhexUvlAsz89UMG/9YAIQvzimMD7yjKzLpTLzCfC0ea2Hsgzi0251lAdw
         vIrkkkWwoO4HwnqCTbPO307JCgCb+0gfyEUbXJckLuQ2IBrlpEFpG3uM1iUS5nbRX3cx
         aEulQFUgLjyvT52aUMuPoPeKEM2zX/qKlNydjuJ9RWuBQ5u0EbmjEc86rnN3h0fJ1t0O
         Tas49Nx5uvjxqhO4uI9/xlb1Pb/bE+hO1Yhaj3h0s6c+eRM933vGSA1ze8wLYVP+DXYf
         n8Mg==
X-Forwarded-Encrypted: i=1; AJvYcCUKA0CKXY6fUT+HJ+WEWvG/7HSWKa1Kz6/xfOrBdwijYmEmPsxqoHh7t6WBaSirQaSOlt6lx1q4dPd/@vger.kernel.org, AJvYcCUzSwM07bfgxMDmM+0rfFh+2y5JMGMgSxK0ezyMCtEnmqJIACvBPBKH3H3uHr5tP3VZjCCDugrznvgJEM4=@vger.kernel.org, AJvYcCVgvjq6qevoTMWQRFoewYCiUg/lCwB4MiZvH7Sb9k0lgb4EcuvDLbbhRCCaiqc+eIlHZkbDy+xu1huRP+k=@vger.kernel.org, AJvYcCW4/EP2TYxnU0L+QduS21r8AajI+LtS3fSjrBMC85kuTqgoYClmXDmZ2XIQCW1shiOy3TsgbvVpwjtX@vger.kernel.org, AJvYcCXiIPY7xeOXusxXG2X3ivrCOy5QJrvF/dKwV9CVolOGOl/d/hM6B3nCF6bwJk3tTzmOeAfRHD82BekQh73K@vger.kernel.org
X-Gm-Message-State: AOJu0YxoMymE9CB2I5ZwSu8e9ygm43HiscAhRmWfpn+5Gul5CbGkEQM2
	KxsI9kzMw9DfgXhUJ/JvqXFjiGEhtqPBJkrIg22/vHSYQQO3GUS+Wef1
X-Gm-Gg: ASbGncs4pswBNFNrTWlTrTkPX3B4PO5mgksitdUXb5uqeYgc7GcrlMmvtx54yTpXJHC
	2najv+B4axVEFYxnafjw9uJkNuFPsAMb8sE4wuqi3DVoNOC57BJbtXmTGVvGeBT26o898J0iwVk
	9xN2TA0s/YatPmYbvjhcls83pCBH5dVecB2i8MTFF9Dr0XwLGmd3UE+89+dzd0b3gB08QmiCIdH
	YmYoGVnCLy69TN5LqTxcOdt0eMDW+grwz05QbfxKmiVtlGT3H7DjuhYXXghqfIjZlUsF7jnbYbt
	iQi/Qu/OeZDUN6P6tc4CW1VafaheqXDGYNO7CejtWpMy4+4b1PaMuQtMzvpuW4JWhUOky07Q/mf
	6L/lz6/zh0JOfbbLUB15TFP6H
X-Google-Smtp-Source: AGHT+IGCt2eHiwI1aZznp5qV4unVuJPYb6+RIXeJ7Ssqv7sSVpNp64yWTQMgPLJorRM1xtlStCmyhw==
X-Received: by 2002:a05:6512:39d6:b0:55f:391b:54df with SMTP id 2adb3069b0e04-562618e1854mr654591e87.47.1757166853171;
        Sat, 06 Sep 2025 06:54:13 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ace9c65sm2357467e87.85.2025.09.06.06.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 06:54:12 -0700 (PDT)
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
Subject: [PATCH v2 07/23] staging: media: tegra-video: vi: add flip controls only if no source controls are provided
Date: Sat,  6 Sep 2025 16:53:28 +0300
Message-ID: <20250906135345.241229-8-clamor95@gmail.com>
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

Add HFLIP and VFLIP from SoC only if camera sensor does not provide those
controls.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/vi.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 856b7c18b551..90473729b546 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -961,6 +961,7 @@ static int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan)
 	}
 #else
 	struct v4l2_subdev *subdev;
+	struct v4l2_ctrl *hflip, *vflip;
 
 	/* custom control */
 	v4l2_ctrl_new_custom(&chan->ctrl_handler, &syncpt_timeout_ctrl, NULL);
@@ -986,11 +987,13 @@ static int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan)
 		return ret;
 	}
 
-	if (chan->vi->soc->has_h_v_flip) {
+	hflip = v4l2_ctrl_find(subdev->ctrl_handler, V4L2_CID_HFLIP);
+	if (chan->vi->soc->has_h_v_flip && !hflip)
 		v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2_CID_HFLIP, 0, 1, 1, 0);
-		v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2_CID_VFLIP, 0, 1, 1, 0);
-	}
 
+	vflip = v4l2_ctrl_find(subdev->ctrl_handler, V4L2_CID_VFLIP);
+	if (chan->vi->soc->has_h_v_flip && !vflip)
+		v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2_CID_VFLIP, 0, 1, 1, 0);
 #endif
 
 	/* setup the controls */
-- 
2.48.1


