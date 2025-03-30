Return-Path: <linux-media+bounces-29004-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C99DA75C82
	for <lists+linux-media@lfdr.de>; Sun, 30 Mar 2025 23:11:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB2931885F0A
	for <lists+linux-media@lfdr.de>; Sun, 30 Mar 2025 21:10:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA9FA1E5B9F;
	Sun, 30 Mar 2025 21:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vl7geLDJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3371E5718;
	Sun, 30 Mar 2025 21:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743368897; cv=none; b=qsPrsU5mqXZsiIvkd05IK8XEuIJyOm/Y4P5CXvcuYAG3AWs7a/QqSZZZO9/qbKi3hQtcEIARuReCxK9c17505t07X7DdmNRmUVY1Pkx2rPLCHKDPdO2nX8xDq7ySXngLflaLmIeVK/UF0bqqWc0bJjcrvGU07JGtox3liECUXsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743368897; c=relaxed/simple;
	bh=Yuu7EcI0Z8OztFCQ9CzecHKvzg4QvaUN18KPhtqSLQg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cdrsDxdJdoF9Xmx22BRiU3rh/zqT6zNuRUh4pqaXMMEc3Y2Ks0u9vhFWywyaqzHhAQfFU8QNDtFrB1Z2P33Mniv+02MYRezFLzitnEA3cPPwHKmKOOrWirNMmoDfwYMp2DmCJoftlLKy0vf6F/faYSlL84RoBAEk1yeEnW5q+ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vl7geLDJ; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-399744f74e9so2529605f8f.1;
        Sun, 30 Mar 2025 14:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743368894; x=1743973694; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FDRRpWKz/Tp2Qssm7SKBOmwPw0YztrDOdZ3gIrdbwAw=;
        b=Vl7geLDJzPWA2CE+yM5DRnDaiBzPjoXd/4P1jYLOTQCcrpEiWrtcJrx5USE05iuC9/
         +f0PxGNmieW8pDloqOLPfH8H2i76etctQHbvpMX0edZ9KdzKp0kDbn44R/sS+xFGuGN+
         6zJsIHJveO7j0fSwL+rrodEfed6LG/JsclXEAdCf4cJtik3dx+TfolSz3FjPNMC0Kvgz
         J7ipVs+iucs1q/TPeqjK7JUgaym9K3Byd3eaPlOb7uf9Ba18+7XFoALedRdK13NXSn1z
         HPoc9HTig/Ev6XzK4xFW5rR+ypKb8461T8QX+3cOA2LcE+uJMoIZBkD08dkYfmfvLZdi
         4u2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743368894; x=1743973694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FDRRpWKz/Tp2Qssm7SKBOmwPw0YztrDOdZ3gIrdbwAw=;
        b=r6CqT+bVkpI1ISelj4vUmXyn6xP3AXdQAFm2pO7phVc/AO9zA7mGFoBFJ4fjzzFk+L
         7Gr+sv8GAY42B1I1cG+GXrhjbDYRu4wO+ahs7gfWJ/SuF++faxXlA5KJCerzuNr3s4b/
         hJGH8lFgbfOYgcBxUeudzm6g6ar7Mzy4ZiLQWe43Wub8P0tBuJz4q/X3NxjTZ/x/XoKZ
         uU0LOuzBDXpo53oJnKdYqbrauTsbyzKvy24tZjyl/o5YU1wiQlfoQF5af52Hsoi54OwF
         LROTFrOvabuXD+fFuNgtIYy8kmgQ+wK4FYaN4ROPSoPMTQqqPAe3Xj50cZ8mvq03YXb9
         weWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwdNLqSR6yOmJVj/vnHM90JM5/TW6xP1MhsPfgp2NpOaGZBRFF+EVZg50RIXqpStGuOjufFCd7UusLxmA=@vger.kernel.org, AJvYcCW/x1YtcU28c+Inejgp3kPyIICM755KCWK1JSbCSq/sg/N7AIw8P9PCk1rvce/XmNL6bspxZnv0Jgc=@vger.kernel.org, AJvYcCW54/I77rGPvk5o4D1JuTiykAGzAQ5asu8Pv9yzGFl7slcGBtcS8jMJ9B6Q6zkHCVBDXF7W30dVtQl533q0hNw1oBc=@vger.kernel.org, AJvYcCX1p8Gwf1DppUTZecxjzD5wnqHPhWkhpu/Jvmn5xRQrqriugeyvg+DUYKJd0gAAypw9r5NEVNhXWe51GK//@vger.kernel.org
X-Gm-Message-State: AOJu0YyKvRVDo1YWuxPNueHQxKUj9abcuyPnG92HkmFJCIoht/O5qY7f
	1b7u4htz9Z2ij1ZwawSLH66NHIU0GMvUbtgGlvC18qjBcvH/GLT7
X-Gm-Gg: ASbGncsnNSXTea9Oi7jgUm0f2UPYBYskJFftMQk91CaLQEGKKm8BY0gTy6dW4ZmZP9F
	/zRxjIv6tMFyUYAh8zdXp56kAXStVfNPxy4swk6GoUbjxfHy0GfPYetWd7oZO1CUwJlqn2w+TUx
	kfIjpVDUvbR/9NVvr0J5SxBY3CkUA8cD3x5JEDwEYrWk9DkL3adpEIVZ40sPRfQjgH/pBocmggN
	je/SXKIBGIRKnHoYJqNehWJ93EEzqwQQdOAfcYNJjVEEFEuGIXjUF15GCt9czyVa88qIeeAdPDP
	cQS1X2dCH88qJYi8EeQanuuGnen8k1lK83mscTxqa8MRWaLdV8sNiOkYqCJlc331El/frQ==
X-Google-Smtp-Source: AGHT+IGAmb19RTswNLo6awQFTPPrZhGYowK/M/WktoMbi+P5JrRB9bYiaALFcRETjA+/vE6XZRBuDw==
X-Received: by 2002:a05:6000:40e1:b0:391:49f6:dad4 with SMTP id ffacd0b85a97d-39c12113977mr4586276f8f.41.1743368893643;
        Sun, 30 Mar 2025 14:08:13 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:8249:9390:e853:c628])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d91429c36sm69778175e9.0.2025.03.30.14.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 14:08:13 -0700 (PDT)
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
Subject: [PATCH 10/17] drm: renesas: rz-du: mipi_dsi: Use VCLK for HSFREQ calculation
Date: Sun, 30 Mar 2025 22:07:06 +0100
Message-ID: <20250330210717.46080-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Update the RZ/G2L MIPI DSI driver to calculate HSFREQ using the actual
VCLK rate instead of the mode clock. The relationship between HSCLK and
VCLK is:

    vclk * bpp <= hsclk * 8 * lanes

Retrieve the VCLK rate using `clk_get_rate(dsi->vclk)`, ensuring that
HSFREQ accurately reflects the clock rate set in hardware, leading to
better precision in data transmission.

Additionally, use `DIV_ROUND_CLOSEST_ULL` for a more precise division
when computing `hsfreq`. Also, update unit conversions to use correct
scaling factors for better clarity and correctness.

Since `clk_get_rate()` returns the clock rate in Hz, update the HSFREQ
threshold comparisons to use Hz instead of kHz to ensure correct behavior.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 27 ++++++++++---------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 746f82442c01..e0379f099659 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -8,6 +8,7 @@
 #include <linux/delay.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
+#include <linux/math.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_graph.h>
@@ -15,6 +16,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
+#include <linux/units.h>
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
@@ -199,7 +201,7 @@ static int rzg2l_mipi_dsi_dphy_init(struct rzg2l_mipi_dsi *dsi,
 	/* All DSI global operation timings are set with recommended setting */
 	for (i = 0; i < ARRAY_SIZE(rzg2l_mipi_dsi_global_timings); ++i) {
 		dphy_timings = &rzg2l_mipi_dsi_global_timings[i];
-		if (hsfreq <= dphy_timings->hsfreq_max)
+		if (hsfreq <= (dphy_timings->hsfreq_max * KILO))
 			break;
 	}
 
@@ -258,7 +260,7 @@ static void rzg2l_mipi_dsi_dphy_exit(struct rzg2l_mipi_dsi *dsi)
 static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 				  const struct drm_display_mode *mode)
 {
-	unsigned long hsfreq;
+	unsigned long hsfreq, vclk_rate;
 	unsigned int bpp;
 	u32 txsetr;
 	u32 clstptsetr;
@@ -269,6 +271,12 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	u32 golpbkt;
 	int ret;
 
+	ret = pm_runtime_resume_and_get(dsi->dev);
+	if (ret < 0)
+		return ret;
+
+	clk_set_rate(dsi->vclk, mode->clock * KILO);
+
 	/*
 	 * Relationship between hsclk and vclk must follow
 	 * vclk * bpp = hsclk * 8 * lanes
@@ -280,13 +288,8 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	 * hsclk(bit) = hsclk(byte) * 8 = hsfreq
 	 */
 	bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
-	hsfreq = (mode->clock * bpp) / dsi->lanes;
-
-	ret = pm_runtime_resume_and_get(dsi->dev);
-	if (ret < 0)
-		return ret;
-
-	clk_set_rate(dsi->vclk, mode->clock * 1000);
+	vclk_rate = clk_get_rate(dsi->vclk);
+	hsfreq = DIV_ROUND_CLOSEST_ULL(vclk_rate * bpp, dsi->lanes);
 
 	ret = rzg2l_mipi_dsi_dphy_init(dsi, hsfreq);
 	if (ret < 0)
@@ -304,12 +307,12 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	 * - data lanes: maximum 4 lanes
 	 * Therefore maximum hsclk will be 891 Mbps.
 	 */
-	if (hsfreq > 445500) {
+	if (hsfreq > 445500000) {
 		clkkpt = 12;
 		clkbfht = 15;
 		clkstpt = 48;
 		golpbkt = 75;
-	} else if (hsfreq > 250000) {
+	} else if (hsfreq > 250000000) {
 		clkkpt = 7;
 		clkbfht = 8;
 		clkstpt = 27;
@@ -754,7 +757,7 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 	 * mode->clock and format are not available. So initialize DPHY with
 	 * timing parameters for 80Mbps.
 	 */
-	ret = rzg2l_mipi_dsi_dphy_init(dsi, 80000);
+	ret = rzg2l_mipi_dsi_dphy_init(dsi, 80000000);
 	if (ret < 0)
 		goto err_phy;
 
-- 
2.49.0


