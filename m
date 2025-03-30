Return-Path: <linux-media+bounces-29010-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D57EA75CA2
	for <lists+linux-media@lfdr.de>; Sun, 30 Mar 2025 23:12:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4DDF03A95FB
	for <lists+linux-media@lfdr.de>; Sun, 30 Mar 2025 21:12:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6A9E1EB5EB;
	Sun, 30 Mar 2025 21:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iGMEBb8M"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63DD81DF273;
	Sun, 30 Mar 2025 21:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743368908; cv=none; b=oXZiH4l7lDR8pd0eM7wJFAEuE0ngPQgQFR+uDBsBdQ+BwjAk9/hpPyt+rrH+KSvtF+0YPbWJdqDgfSCqyzuDwbjDKWzSeHdNxjwjCDV2EDEAIIsdOInNyqNLP4qyjKqaadabJGnVNXjyik44XqpTnu4flnhN09bN65vAECy8iBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743368908; c=relaxed/simple;
	bh=qbZ9CLVTvFBXb1/aDJNUu0h82il0cJdAPvAUCS+PUB8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oMB8SitOe2T7aRnjPXE3efwzTvq9b1E2ImVF9bn5FNSx2KRZTtJJxQctdW6/gUrmOcwsTsf6tBngF+IcTW1pYef/rZ7Pe95tfSSlsCSf495ZkSLRZqy2om9pqTNgGRg/o074Mwl8/xbri/PrTRjAJz78BqhtbBVgdl4NszdXdQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iGMEBb8M; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso28697615e9.2;
        Sun, 30 Mar 2025 14:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743368905; x=1743973705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JgZl3iQ4HtNNUBIsgM1/CPu8w0Lc9rfs3qjDG6SyzfU=;
        b=iGMEBb8MXiTMtwYeKe3MCVWeoQgoH/3cV+iv7++ouftPapGsGXd3B5ijv3ur8PXeXt
         VDmzVdrk8hw8tnVt8oktz3h6g+UTwtJNLSdXQvzciCMilTpZbN1OjBy1ULVH4S/8rtAL
         1NEaBz+HMm0ksGDfUaqKyiFfQnteCMU2c8C6PH/gfSrQUxec0EZb21yfFnz9UMi7eryo
         ORzRoEjvuxUVjix5dv/0XWPMNT/szujhWWXFr0YHQAdvXqYeRdSZFhNt6+/ziNgS3a7+
         TeMmLtP2u12QWcPVFQAFf0jySPsvcrO4JTjhWRvePR7bkubehicyTHQOepBuU9zANj29
         Qh5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743368905; x=1743973705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JgZl3iQ4HtNNUBIsgM1/CPu8w0Lc9rfs3qjDG6SyzfU=;
        b=GbRvdchKTBRXelGVp6bFCCJNNONX3TvTBp231Beg4ryuvu1IoVCw+nWt5CWKFH2IOf
         k31g3z/ovgsgn3ar0lxm0pYg2/hFIJhJYC7UcH2eDurabqQqi+IMQRRcHQc16LzJXrdm
         J0Q2AJAGWi7xN/3QIZIODXW/Ah7RIqY0IFpJLMiruf891y2Wthru9mTRNP9z/mMxk0T0
         Xyg3aEQkqjH2sYjH+RqZA9uUkYhSqnCt1F5uRbq49UG/yZbJ3MBe23v2BUzizCXQNW0+
         KoDED0wUw5+gcLznRxcRcGWeGBYXB+Ph10HLxheRAGpHgmUr7x9b5nmPESq46U3mhqWC
         VCjA==
X-Forwarded-Encrypted: i=1; AJvYcCUP5MoEXVkRhtVorDqZgOft2Cm4OrVQOiTk9S15HYAw6E+1XN10FLSJMgPFC4UrHlmBZoCHTPcx2w+w5twjKU9hqis=@vger.kernel.org, AJvYcCVBzbBWqPMKauy9vCVC/lstU/WglGjdpXjjND/iSRZIwedX0k+6k1F9LYQB8Tdj181oW8GYuQwcXM6UII0=@vger.kernel.org, AJvYcCWAstA8NfxmQjTAzLUADN5EOkNO3yMzoZndMO6HLKXf6zPRS7ukMNbsx0Tk0sV6cxHYERI0P9RDFqp1yg91@vger.kernel.org, AJvYcCWM9oocAGU7ZIuT2xBM0kGfRF3S2kSuTuO04DpdzZULGYRp1J9TVC3MVS1vqhGofZ/qUb3bhgn/ozo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwX6/fo5x+e6JpJ4eb9aWICNto7nGXzFm0TWnVkeiaT9n7v9QUZ
	zwP91pP19ctdq3ZfGS0tixh8EjRtmJ0aURDWmcfEcZGJrgeCJ/Pm
X-Gm-Gg: ASbGncuh6lOy4MPnp2fnANU4PTc6T8Zop3/m98AGmKYQDodPU06XjaFsA8iYanI6J32
	zdAh/wYXrCql64Swr0pP4jVSoEsseHschYYJCUB4PphqEGBCVEBLYdF4FGdl4PYq18RPo4brWLk
	c+FlCkYaYVCttZJg7D4NRYvwDU2A3hgn1shxC5CAqMh+zsa9BU36xCUeFqEl2px1aAacAQgopJV
	cqUAmyPGZDqI3dpVOjEoVrYfueqMD+OF54iet1dJO7a+a9I1ouV0yNyvx8q7S/qfy5kCHjC6sTK
	uKdPvmPBZgdMK2Na6XqkQJZXtsgJPHc2+OMuhcmKyTkQknbBCNKVc9OIKpI1AOV4/+Do6hVoh5e
	U4zx+
X-Google-Smtp-Source: AGHT+IGfc1wGjPBYFHmkc3HGfL66Sv3eKWUxliHexa2q/W6z22Xc42Ggk4YJj7B2hkhXT+skl0n8kA==
X-Received: by 2002:a05:600c:1e85:b0:43b:cc3c:60bc with SMTP id 5b1f17b1804b1-43db61fee40mr64885255e9.15.1743368904564;
        Sun, 30 Mar 2025 14:08:24 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:8249:9390:e853:c628])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d91429c36sm69778175e9.0.2025.03.30.14.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 14:08:23 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 16/17] drm: renesas: rz-du: mipi_dsi: Add support for LPCLK handling
Date: Sun, 30 Mar 2025 22:07:12 +0100
Message-ID: <20250330210717.46080-17-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250330210717.46080-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250330210717.46080-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Introduce the `RZ_MIPI_DSI_HASLPCLK` feature flag in
`rzg2l_mipi_dsi_hw_info` to indicate the need for LPCLK configuration.

On the RZ/V2H(P) SoC, the LPCLK clock rate influences the required
DPHY register configuration, whereas on the RZ/G2L SoC, this clock
is not present. To accommodate this difference, add an `lpclk`
clock handle in `rzg2l_mipi_dsi` and update the probe function to
conditionally acquire LPCLK if the SoC supports it.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 2ca725a2ccaf..26ec0f5d065a 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -31,6 +31,7 @@
 struct rzg2l_mipi_dsi;
 
 #define RZ_MIPI_DSI_16BPP	BIT(0)
+#define RZ_MIPI_DSI_HASLPCLK	BIT(1)
 
 struct rzg2l_mipi_dsi_hw_info {
 	int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, unsigned long long hsfreq_mhz);
@@ -63,6 +64,7 @@ struct rzg2l_mipi_dsi {
 	struct drm_bridge *next_bridge;
 
 	struct clk *vclk;
+	struct clk *lpclk;
 
 	enum mipi_dsi_pixel_format format;
 	unsigned int num_data_lanes;
@@ -792,6 +794,12 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 	if (IS_ERR(dsi->vclk))
 		return PTR_ERR(dsi->vclk);
 
+	if (dsi->info->features & RZ_MIPI_DSI_HASLPCLK) {
+		dsi->lpclk = devm_clk_get(dsi->dev, "lpclk");
+		if (IS_ERR(dsi->lpclk))
+			return PTR_ERR(dsi->lpclk);
+	}
+
 	if (dsi->info->has_dphy_rstc) {
 		dsi->rstc = devm_reset_control_get_exclusive(dsi->dev, "rst");
 		if (IS_ERR(dsi->rstc))
-- 
2.49.0


