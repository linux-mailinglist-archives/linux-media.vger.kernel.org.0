Return-Path: <linux-media+bounces-29007-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 718B9A75C90
	for <lists+linux-media@lfdr.de>; Sun, 30 Mar 2025 23:11:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CE53188AA01
	for <lists+linux-media@lfdr.de>; Sun, 30 Mar 2025 21:11:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C3B61E991B;
	Sun, 30 Mar 2025 21:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PW1cIpeg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B9F1DF244;
	Sun, 30 Mar 2025 21:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743368902; cv=none; b=TmFHn7sCptWcA6tpmbEne37F+OTOj+poI4he2fn2lw9svdjgskRj+hRo4EwKZ3kuZ7SMtoRrPdw2KFlKOysm4QcsMoH5W8uFbWFE2FcZw18LXfbOnm0WGLwPBTuCxB24CYFF48/2AhsA5ZxQ9SkdvrlNqJyOa3kJweSW/TrTU2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743368902; c=relaxed/simple;
	bh=0rvwfToYEVnAJefIAp/NDyLKZKuJeCDRniH2Xkb/HB8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oUPRSd7Comj7MGaDhsNmR+0o7RdBuyKcPCWQAZp2lT6F73b/UAC2QK0vtHvOnISNuwxhdz60hQ51lEGg2w3I2gSp4twfpZgUgx9aj6DqGmuOcEUGpimtHrswtT6UCAIaALc8MbEP3rd/Ck09lnHq2JAQRKB4RP8nwDYTAueIBLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PW1cIpeg; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so26082215e9.1;
        Sun, 30 Mar 2025 14:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743368899; x=1743973699; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MQcdmv+fTi7nHJU3UY4t3nOmHBOro6YDyKJYXuGtsNE=;
        b=PW1cIpegriQ9yIkJv8we1O1+uNVj1CZEFG1davI165i5f3K+ojqm0YTAsPYo2G2z66
         ya6DzP7sRGMJfnlL+ndv83dgAApGVyh/l/6vj8TilK73oRoMgm8shHc2863drVouBhsy
         TJvohOsleXaUxB9gPRTh43yNAXU0Jye3MFh7QLy9Yskn++gLsFnmr5AN/VNm55NxyX9Q
         EIk9IOemAF+nCGpYj61InJLPxjTaiP6BfvjKafiJs1ndqOxPedn3hXOIc1vRxNdd/MBw
         gQxGbJy9dqrtM+Otm5pmsE3vxs8Qwd25/B3jXDwlltR1ozxNLBcDHFQ+BwNDgN3yZviM
         PJJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743368899; x=1743973699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MQcdmv+fTi7nHJU3UY4t3nOmHBOro6YDyKJYXuGtsNE=;
        b=ABGxwvwjlrZ03G6gp1gkqldnPppe+B0XpDRP4aTyvRSzXv/7ufTZYi46pValxQlZDg
         XMRth1kE/kcwMP9BacAxTq8TEyMu2s8LbQs7VXrTHbbhjllSx9cgSw/XyGrrilgKJTl4
         8GQHzagaCtDzmLrz/DJfv1RXGseuIh75SCs33lb6NgisqeliD/koDuhZEazguKIEEkhW
         EcU7RvGurZUmLDUOXqyc8DZGCAU8xNRpQp7Jj3mSIpM3a0putLtkfu7+YJTaC5yOjGD8
         c8+g2bdAPwsetUxXl7MNbxrcK2RMisES+Q6RAaA+p6YCvLzRQDxKrBmt0+48/EztT2c7
         EZCA==
X-Forwarded-Encrypted: i=1; AJvYcCU0Zu0Kc8lFHknjPTwZq3bhZIPUvINA9AGs6cVs4a7z+xTLBdUrsd6WnxRItsbFiNY9CQ1/69kbENo=@vger.kernel.org, AJvYcCUXmN5iJT6yM8dpPQlsHPzhF+2AkqboRDw8dsytCWR2U9LELIVrF+DZw1lCAPW2q3OcEAKGFS8VjQP0Ow4=@vger.kernel.org, AJvYcCV0tf29uRO9ABuavXhpeQfTISsPU4uMPiTJjcAAyWr0VYT6hVWUPPwVmbjeXPuXPjcGUbhOpkaSPQHUJ4Ub9/+Nm2o=@vger.kernel.org, AJvYcCX/x9zM1JQzWslUbC297+bHBwThIMXFK066TykiKCrqZ9F+DKq+wBUGuQU6C3Opjoi+cU83yjdnlIyRem73@vger.kernel.org
X-Gm-Message-State: AOJu0YyXV+TsBJ9fYsM7q0BHFXJBXaV058c0DfjOlX9RnxuqZGVoS8eQ
	lKGjou1j2y2Y59zopC2aZckxmo/ZCmH3A66q4ELaA7F/G0eulN/tM59zRKgY
X-Gm-Gg: ASbGncugbrYHOUlCiUAdQNi8jUehXUXzv2u6ZsLrM8TQNAYmorPs9yCbXsCULJN4Q3H
	6rWTF3IB2l5uC36SjNKSEYLQE7vY9OWbiSxtritv1J5MmsL7wRI2XDx2rMHic1Z21fI2rU343v4
	La4PgvKtTkNebODQFRbF5EgvkDFygnNPmqiX7fKGSf4t+6BFLM7QIo3uDOjzjWaw2tiJ6evjVqS
	4TjlB8aLmb08K4zH7x3DFnf95KTQQIcruCaZv+2sgdEAcBMKqTOcoRvJtLBSKbJL9cycongqpPW
	j4Fdm8lcgNEcEsxhzFuF/2H5qMaJusAhz9/Yy0vhyrRb44WZbD0qVRT1S9iNJVJzTVPQttjSsG8
	fS4jd
X-Google-Smtp-Source: AGHT+IGnEK+D9yEO+Df22WAZgqb9VPVBVAcc76yaOaBtPARGH861k4cRc8dmMhREx9RoOnEoG6Co9A==
X-Received: by 2002:a05:600c:83cc:b0:43d:cc9:b09d with SMTP id 5b1f17b1804b1-43db62bc26fmr50846095e9.20.1743368898852;
        Sun, 30 Mar 2025 14:08:18 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:8249:9390:e853:c628])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d91429c36sm69778175e9.0.2025.03.30.14.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 14:08:18 -0700 (PDT)
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
Subject: [PATCH 13/17] drm: renesas: rz-du: mipi_dsi: Add feature flag for 16BPP support
Date: Sun, 30 Mar 2025 22:07:09 +0100
Message-ID: <20250330210717.46080-14-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Introduce the `RZ_MIPI_DSI_16BPP` feature flag in `rzg2l_mipi_dsi_hw_info`
to indicate support for 16BPP pixel formats. The RZ/V2H(P) SoC supports
16BPP, whereas this feature is missing on the RZ/G2L SoC.

Update the `mipi_dsi_host_attach()` function to check this flag before
allowing 16BPP formats. If the SoC does not support 16BPP, return an error
to prevent incorrect format selection.

This change enables finer-grained format support control for different
SoC variants.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 84c3384aa911..0ffef641e2bc 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -30,6 +30,8 @@
 
 struct rzg2l_mipi_dsi;
 
+#define RZ_MIPI_DSI_16BPP	BIT(0)
+
 struct rzg2l_mipi_dsi_hw_info {
 	int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, unsigned long long hsfreq_mhz);
 	void (*dphy_exit)(struct rzg2l_mipi_dsi *dsi);
@@ -38,6 +40,7 @@ struct rzg2l_mipi_dsi_hw_info {
 	unsigned long max_dclk;
 	unsigned long min_dclk;
 	bool has_dphy_rstc;
+	u8 features;
 };
 
 struct rzg2l_mipi_dsi {
@@ -642,8 +645,16 @@ static int rzg2l_mipi_dsi_host_attach(struct mipi_dsi_host *host,
 
 	switch (mipi_dsi_pixel_format_to_bpp(device->format)) {
 	case 24:
+		break;
 	case 18:
 		break;
+	case 16:
+		if (!(dsi->info->features & RZ_MIPI_DSI_16BPP)) {
+			dev_err(dsi->dev, "Unsupported format 0x%04x\n",
+				device->format);
+			return -EINVAL;
+		}
+		break;
 	default:
 		dev_err(dsi->dev, "Unsupported format 0x%04x\n", device->format);
 		return -EINVAL;
-- 
2.49.0


