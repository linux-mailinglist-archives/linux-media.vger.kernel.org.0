Return-Path: <linux-media+bounces-29009-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DAC1A75C9E
	for <lists+linux-media@lfdr.de>; Sun, 30 Mar 2025 23:12:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 169091882F1E
	for <lists+linux-media@lfdr.de>; Sun, 30 Mar 2025 21:12:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0265C1EB1AE;
	Sun, 30 Mar 2025 21:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LobWlovC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDA91E9B35;
	Sun, 30 Mar 2025 21:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743368906; cv=none; b=jhyE3IFuW4GBldUJHCA4dUOCi6nmRvrr5KMBj/GPAGDubtArKzCzdLWk+BS1xwcqIDlb/ZyrJE4akHplG3Ee1kVBBQm9nGT84HK53Qixr80Qioun2LJVAeFgen2R6v0eS26AgBDLtIJTPFRJQEgZuvAOddzyVbOt66SxmUF1ic4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743368906; c=relaxed/simple;
	bh=vXBOHZRFep3xvb3C3XtWMgbDQa/LoryqVYq5e3iFgS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uXpOilmOobAR5dEF0lPWNAqaxOjJAJ/hNzS3SUaOd/qw/8aDi0MJX1r81X3WYVQonRIir+OJLkaqebSIWtNB6knTyYWwtq64aqELp8K/oGYzbN+yyb8AJQmmRoyfv3V4xafM80Kng/lvOC5GU2MgeeqK0kHwqlbgr41/Xj0U1Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LobWlovC; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4394345e4d5so23722005e9.0;
        Sun, 30 Mar 2025 14:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743368903; x=1743973703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bNCfB9MBRvn1VCqAeA8M2J66qxPwT+h+pcoszvMMa9s=;
        b=LobWlovCpLSvVEqy0jLYMw+dpWg46jzcdpG5ejKUNwGG1m0X6Pgxgpf8MW6EvJFOXP
         TLGR59lx7Xdn4QN8Rz4NeZT9JY1JglLYHfdo/SCVOuxteTqrElHmr1JcGCIBQjTIOPAp
         psnQ+g/4y5ghYHKy5U1RPa6xfUdmdPuLhqizfMcCM4HTdN5+BPRn1a1FbKmMMz5q7e+6
         sa7nlE81lvqSwsb7OywJFLl9Tio/4yzz96e6akLblJ5aDVFNsI3HaMjEoocejI2w7L8t
         PiqQZ2n4wrxzw5MpNq+TCruIC2VwCOiMorbpOqPPoR50KlTrpWl5kfcXD1M9XbIZX2z4
         JbXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743368903; x=1743973703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bNCfB9MBRvn1VCqAeA8M2J66qxPwT+h+pcoszvMMa9s=;
        b=f6sSo9KL7ETCieC7960ZHwzCjx2ZEwTaNFJQ1PjC9/1yd6JZcotreYc6+tvsWZcgZq
         jbZB2Px/R3QlAbhLA1wCIIu2BiES6rqpEB5SVX1O7kmIIisFchR4ZNnGyqMEceIx6rqL
         4gD2czGct9WlEyw8sOyMdvpak1s9IuLsG1Rx9TmIqGFBHc7T46kPoDCGNdt3Ok25MD01
         yfnW3gz3bC13RgvPhR2ThYDYzDfV82FS3675NuweEwu8WO0SIONY5UPKnN3yITuRtFZC
         5H7cUeltPRphJ9RIR++JM66qIcOrYE6wfL39TLkk5P39zI7PVYjWwJ6vUpKrw9QkpBha
         d0Zg==
X-Forwarded-Encrypted: i=1; AJvYcCUB1RHlXh5EGJd6zd6K4OE9iGsSS7PNBbWlP4riMfmhjk+E9xb5h0iEtDVRnmrXbBkArmXg5+xlBD4mjFnZ@vger.kernel.org, AJvYcCUUrrg1TjXFC+q6GE/UyMkzW9ONWadUMAHU8RqFifmVo0hLTHYmKDkMy68Xi+fjm8SqVna/eE98uj2zYjQ=@vger.kernel.org, AJvYcCWJH4ahqmhGaLc5rT1xu49I3bRBvuTGybjZm+UobVjnHxn7Oo6yVBKmS1g/ZYl/TqqaY+lkSmlMDTwFZLciPzN3yPw=@vger.kernel.org, AJvYcCXcjiLgJVB88J3Mk6AZ89fmrX7AuSO0Oc1UApU8yC8/T0WIXMHdZt68xUaDUfhv3VPRKVZMFT3v2kg=@vger.kernel.org
X-Gm-Message-State: AOJu0YznV58TEfAr2rbITmtugKu5k5ukKFQ7HbaZdx883TSHWJfMpuPL
	rtJUlOLR+uwb4N85tBU+0JIMm5LRQ3tOXAbmaF/eL61GavM2ONfg
X-Gm-Gg: ASbGncvhtTf3dPSVrzy5NC3VYlz7KCef9w/DfhGiUu1D7xNNqRD2NPFy1Au6D8RYksQ
	j4gMXInCKPHWwBLFctgmVZtlkrzimHkzvX7cVSKuXCP0UA3hCFfHWFieZylH0BIjOrVLNd781JV
	LfsoBpojvhvYmJfvMpGnHnRH4dtCp2Uo3VJjycWe+GZM6mwYVG3NCu26t8u3WIJpb6WJNcizswD
	jRgusRG/v4Gk5O5p9l/at/yTK0TtVPr/CEGVeFDfYle7VcDWuO6qwvbm0R69Wo2UZFsFsOncK6O
	dsJjvqtghiEutzAdxam5r99ZMf2AzG4+TrLZStKqB4maBO3J05YHyADV3eDigtivNHSEVw==
X-Google-Smtp-Source: AGHT+IFAftaSJAKbqIoRETwZffEYb/7LjzE+RcmIpRe67qnXhh+L7GMuoWgTM3zGhePgjIT5PU+QJQ==
X-Received: by 2002:a05:600c:1d8d:b0:43c:ea40:ae4a with SMTP id 5b1f17b1804b1-43dbc6f99dcmr64056755e9.31.1743368902764;
        Sun, 30 Mar 2025 14:08:22 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:8249:9390:e853:c628])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d91429c36sm69778175e9.0.2025.03.30.14.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 14:08:21 -0700 (PDT)
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
Subject: [PATCH 15/17] drm: renesas: rz-du: mipi_dsi: Add function pointers for configuring VCLK and mode validation
Date: Sun, 30 Mar 2025 22:07:11 +0100
Message-ID: <20250330210717.46080-16-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Introduce `dphy_conf_clks` and `dphy_mode_clk_check` callbacks in
`rzg2l_mipi_dsi_hw_info` to configure the VCLK and validate
supported display modes.

On the RZ/V2H(P) SoC, the DSI PLL dividers need to be as accurate as
possible. To ensure compatibility with both RZ/G2L and RZ/V2H(P) SoCs,
function pointers are introduced.

Modify `rzg2l_mipi_dsi_startup()` to use `dphy_conf_clks` for clock
configuration and `rzg2l_mipi_dsi_bridge_mode_valid()` to invoke
`dphy_mode_clk_check` for mode validation.

This change ensures proper operation across different SoC variants
by allowing fine-grained control over clock configuration and mode
validation.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 59 +++++++++++++------
 1 file changed, 42 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 143bb01e6f50..2ca725a2ccaf 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -36,6 +36,10 @@ struct rzg2l_mipi_dsi_hw_info {
 	int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, unsigned long long hsfreq_mhz);
 	void (*dphy_late_init)(struct rzg2l_mipi_dsi *dsi);
 	void (*dphy_exit)(struct rzg2l_mipi_dsi *dsi);
+	int (*dphy_conf_clks)(struct rzg2l_mipi_dsi *dsi, unsigned long mode_freq,
+			      unsigned long long *hsfreq_mhz);
+	unsigned int (*dphy_mode_clk_check)(struct rzg2l_mipi_dsi *dsi,
+					    unsigned long mode_freq);
 	u32 phy_reg_offset;
 	u32 link_reg_offset;
 	unsigned long max_dclk;
@@ -276,12 +280,36 @@ static void rzg2l_mipi_dsi_dphy_exit(struct rzg2l_mipi_dsi *dsi)
 	reset_control_assert(dsi->rstc);
 }
 
+static int rzg2l_dphy_conf_clks(struct rzg2l_mipi_dsi *dsi, unsigned long mode_freq,
+				unsigned long long *hsfreq_mhz)
+{
+	unsigned long vclk_rate;
+	unsigned int bpp;
+
+	clk_set_rate(dsi->vclk, mode_freq * KILO);
+	/*
+	 * Relationship between hsclk and vclk must follow
+	 * vclk * bpp = hsclk * 8 * lanes
+	 * where vclk: video clock (Hz)
+	 *       bpp: video pixel bit depth
+	 *       hsclk: DSI HS Byte clock frequency (Hz)
+	 *       lanes: number of data lanes
+	 *
+	 * hsclk(bit) = hsclk(byte) * 8 = hsfreq
+	 */
+	bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
+	vclk_rate = clk_get_rate(dsi->vclk);
+	*hsfreq_mhz = DIV_ROUND_CLOSEST_ULL(vclk_rate * bpp * KILO * 1ULL,
+					    dsi->lanes);
+
+	return 0;
+}
+
 static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 				  const struct drm_display_mode *mode)
 {
-	unsigned long hsfreq, vclk_rate;
 	unsigned long long hsfreq_mhz;
-	unsigned int bpp;
+	unsigned long hsfreq;
 	u32 txsetr;
 	u32 clstptsetr;
 	u32 lptrnstsetr;
@@ -295,21 +323,9 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	if (ret < 0)
 		return ret;
 
-	clk_set_rate(dsi->vclk, mode->clock * KILO);
-
-	/*
-	 * Relationship between hsclk and vclk must follow
-	 * vclk * bpp = hsclk * 8 * lanes
-	 * where vclk: video clock (Hz)
-	 *       bpp: video pixel bit depth
-	 *       hsclk: DSI HS Byte clock frequency (Hz)
-	 *       lanes: number of data lanes
-	 *
-	 * hsclk(bit) = hsclk(byte) * 8 = hsfreq
-	 */
-	bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
-	vclk_rate = clk_get_rate(dsi->vclk);
-	hsfreq_mhz = DIV_ROUND_CLOSEST_ULL(vclk_rate * bpp * KILO * 1ULL, dsi->lanes);
+	ret = dsi->info->dphy_conf_clks(dsi, mode->clock, &hsfreq_mhz);
+	if (ret < 0)
+		goto err_phy;
 
 	ret = dsi->info->dphy_init(dsi, hsfreq_mhz);
 	if (ret < 0)
@@ -617,6 +633,14 @@ rzg2l_mipi_dsi_bridge_mode_valid(struct drm_bridge *bridge,
 	if (mode->clock < dsi->info->min_dclk)
 		return MODE_CLOCK_LOW;
 
+	if (dsi->info->dphy_mode_clk_check) {
+		enum drm_mode_status status;
+
+		status = dsi->info->dphy_mode_clk_check(dsi, mode->clock);
+		if (status != MODE_OK)
+			return status;
+	}
+
 	return MODE_OK;
 }
 
@@ -839,6 +863,7 @@ static void rzg2l_mipi_dsi_remove(struct platform_device *pdev)
 static const struct rzg2l_mipi_dsi_hw_info rzg2l_mipi_dsi_info = {
 	.dphy_init = rzg2l_mipi_dsi_dphy_init,
 	.dphy_exit = rzg2l_mipi_dsi_dphy_exit,
+	.dphy_conf_clks = rzg2l_dphy_conf_clks,
 	.has_dphy_rstc = true,
 	.link_reg_offset = 0x10000,
 	.max_dclk = 148500,
-- 
2.49.0


