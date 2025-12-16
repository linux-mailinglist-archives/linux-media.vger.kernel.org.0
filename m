Return-Path: <linux-media+bounces-48906-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 33186CC40C5
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 16:49:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0DAE9308CFAC
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 15:45:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF5B33559DA;
	Tue, 16 Dec 2025 15:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="X/LqkaL9"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B40535504E;
	Tue, 16 Dec 2025 15:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765898373; cv=none; b=JSurgUewi5Yw6sp8mSUt2ywgjI+rgCKb4kYbuaOx/kjRypAyP/3wAMjQ3GWqjxlY54UK/PAK/Tyv4hvNcMsYKTZFaQw+g+XPH3LCkaDagUNGXOEirYVIGfjFmbfeunkg78sCoe9oQLMa2vueoG31ypGX3wOoONxqQ7cWKaoAy3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765898373; c=relaxed/simple;
	bh=Iff4ud66u5yMU9jO70xyyuEbjXflyaiIAtTzW1C/x5c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SprTVnr92Orajp03YDRGPYbhLq2odMgCIHMSMKoCZ4rqhucWigFgAfwjeyNwUose+Chej8uYPvzPs0FlQ02NU+MmlEfXbow0TuO0IqHtteZLztTCQfYKgf/Fd6eZ6nHSTcNpmKwCorbnk+aAC9Ju+QZJffnsfuN7fXO3uHJxNY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=X/LqkaL9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4FCE416A1;
	Tue, 16 Dec 2025 16:19:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1765898348;
	bh=Iff4ud66u5yMU9jO70xyyuEbjXflyaiIAtTzW1C/x5c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=X/LqkaL9etm11VBvglSuzW+lXJn8K6N65VIrPinPSvDa3UaaYzDeqytu7O50OyQO7
	 +onNgAee3UDKyQF8TfkXopSFkwoVkvLP3ximJHHFHcKemGZhQCtdYyAEqtZnMElsh2
	 N5e9hoRQV/Qeab0j526m4DiWqKQsTgIHAPjZ4WvQ=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Tue, 16 Dec 2025 17:18:29 +0200
Subject: [PATCH v4 12/15] media: rcar-isp: Call get_frame_desc to find out
 VC & DT
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-rcar-streams-v4-12-f28b4831cc67@ideasonboard.com>
References: <20251216-rcar-streams-v4-0-f28b4831cc67@ideasonboard.com>
In-Reply-To: <20251216-rcar-streams-v4-0-f28b4831cc67@ideasonboard.com>
To: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4963;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=Iff4ud66u5yMU9jO70xyyuEbjXflyaiIAtTzW1C/x5c=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpQXhnRlBDL0n92fTnfACD9/Y4EbijjZDhgVQIu
 ur7sZUI8auJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaUF4ZwAKCRD6PaqMvJYe
 9ankD/9nAMciVIxG8eU+6QZ6QGgkXC+Ftd0mOGYh+lBxZG89eGcR9uwZYmD1J6dM8qLNpPBorsL
 rLmku+qneH/7QLC0B94bexZr1gko4+6mCwOEcuUbwVwbhg6yI07Hnt/izhG6BDYlbRnmlCwCJVA
 j1wpXEePajQMNnQDDAZTG6ulqClmqdGJBn9OzCaWj4Ke/9B3i/Kv0EBe2ubyOffLOnS/mRSf0W4
 EPzjYrOS8axO11p5gMLTa4tJ8itEB7txNWeteL4s9gGm97GHMPyS6bqnfQSBFjVQIGl1sqiwr9v
 C+soN+GdVU6NDyOgdd6t90O+Br3fP0O9xQ34eoxsBJBhGAqvla4rDPYjHMJmTdWxgUP7hlC+CZ5
 8jPW5D90th/ePM2+WI5J+aHCEeeyTCi898MpH5Rxuu7cYOZoGKp93thx7eU5lKLYsgkrbS+mgAI
 xizyq7jYz9MK7NZsBTP41EmpS6cb/ipq3NxXRZZQT3EuAaxAH+MfoFhSrO2+L67rVN37Sa5IRuX
 +hino28JgvN4OXMG/HJWdK+LofYC1YHcCy/cKNlQ6a1/Ow3EzbbsXh/j8XtPHdQPnMxL7wwAFGG
 bV9r+aEbffY9lNEwik54e/136jaIyf9nIq0gcCjX9bu7qQq68FhXgIX8zb/S5ir1hOx4rCJW6Mr
 CNtw1GvSOZBubSA==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Call get_frame_desc to find out VC & DT, instead of hardcoding the VC
routing and deducing the DT based on the mbus format.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-isp/csisp.c | 110 ++++++++++++++++--------
 1 file changed, 74 insertions(+), 36 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-isp/csisp.c b/drivers/media/platform/renesas/rcar-isp/csisp.c
index 8ac45516aa39..18d63731b6c0 100644
--- a/drivers/media/platform/renesas/rcar-isp/csisp.c
+++ b/drivers/media/platform/renesas/rcar-isp/csisp.c
@@ -42,6 +42,9 @@
 #define ISPCS_DT_CODE03_EN0				BIT(7)
 #define ISPCS_DT_CODE03_DT0(dt)				((dt) & 0x3f)
 
+/* ISP has 12 channels, of which channels 4 to 11 are connected to VINs */
+#define ISPCS_NUM_CHANNELS	12
+
 struct rcar_isp_format {
 	u32 code;
 	unsigned int datatype;
@@ -225,31 +228,82 @@ static void risp_power_off(struct rcar_isp *isp)
 	pm_runtime_put(isp->dev);
 }
 
-static int risp_start(struct rcar_isp *isp, struct v4l2_subdev_state *state)
+static int risp_configure_routing(struct rcar_isp *isp,
+				  struct v4l2_subdev_state *state)
 {
-	const struct v4l2_subdev_route *route;
-	const struct v4l2_mbus_framefmt *fmt;
-	const struct rcar_isp_format *format;
-	unsigned int vc;
-	u32 sel_csi = 0;
+	struct v4l2_mbus_frame_desc source_fd;
+	struct v4l2_subdev_route *route;
 	int ret;
 
-	if (state->routing.num_routes != 1)
-		return -EINVAL;
+	ret = v4l2_subdev_call(isp->remote, pad, get_frame_desc,
+			       isp->remote_pad, &source_fd);
+	if (ret)
+		return ret;
+
+	/* Clear the channel registers */
+	for (unsigned int ch = 0; ch < ISPCS_NUM_CHANNELS; ++ch) {
+		risp_write_cs(isp, ISPCS_FILTER_ID_CH_REG(ch), 0);
+		risp_write_cs(isp, ISPCS_DT_CODE03_CH_REG(ch), 0);
+	}
 
-	route = &state->routing.routes[0];
+	for_each_active_route(&state->routing, route) {
+		struct v4l2_mbus_frame_desc_entry *source_entry = NULL;
+		const struct rcar_isp_format *format;
+		const struct v4l2_mbus_framefmt *fmt;
+		unsigned int i;
+		u8 vc, dt, ch;
+		u32 v;
+
+		for (i = 0; i < source_fd.num_entries; i++) {
+			if (source_fd.entry[i].stream == route->sink_stream) {
+				source_entry = &source_fd.entry[i];
+				break;
+			}
+		}
+
+		if (!source_entry) {
+			dev_err(isp->dev,
+				"Failed to find source frame desc entry for stream\n");
+			return -EPIPE;
+		}
+
+		vc = source_entry->bus.csi2.vc;
+		dt = source_entry->bus.csi2.dt;
+		/* Channels 4 - 11 go to VIN */
+		ch = route->source_pad - 1 + 4;
+
+		fmt = v4l2_subdev_state_get_format(state, route->sink_pad,
+						   route->sink_stream);
+		if (!fmt)
+			return -EINVAL;
+
+		format = risp_code_to_fmt(fmt->code);
+		if (!format) {
+			dev_err(isp->dev, "Unsupported bus format\n");
+			return -EINVAL;
+		}
+
+		/* VC Filtering */
+		risp_write_cs(isp, ISPCS_FILTER_ID_CH_REG(ch), BIT(vc));
 
-	fmt = v4l2_subdev_state_get_format(state, route->sink_pad,
-					   route->sink_stream);
-	if (!fmt)
-		return -EINVAL;
+		/* DT Filtering */
+		risp_write_cs(isp, ISPCS_DT_CODE03_CH_REG(ch),
+			   ISPCS_DT_CODE03_EN0 | ISPCS_DT_CODE03_DT0(dt));
 
-	format = risp_code_to_fmt(fmt->code);
-	if (!format) {
-		dev_err(isp->dev, "Unsupported bus format\n");
-		return -EINVAL;
+		/* Proc mode */
+		v = risp_read_cs(isp, ISPPROCMODE_DT_REG(dt));
+		v |= ISPPROCMODE_DT_PROC_MODE_VCn(vc, format->procmode);
+		risp_write_cs(isp, ISPPROCMODE_DT_REG(dt), v);
 	}
 
+	return 0;
+}
+
+static int risp_start(struct rcar_isp *isp, struct v4l2_subdev_state *state)
+{
+	u32 sel_csi = 0;
+	int ret;
+
 	ret = risp_power_on(isp);
 	if (ret) {
 		dev_err(isp->dev, "Failed to power on ISP\n");
@@ -263,25 +317,9 @@ static int risp_start(struct rcar_isp *isp, struct v4l2_subdev_state *state)
 	risp_write_cs(isp, ISPINPUTSEL0_REG,
 		      risp_read_cs(isp, ISPINPUTSEL0_REG) | sel_csi);
 
-	/* Configure Channel Selector. */
-	for (vc = 0; vc < 4; vc++) {
-		u8 ch = vc + 4;
-		u8 dt = format->datatype;
-
-		risp_write_cs(isp, ISPCS_FILTER_ID_CH_REG(ch), BIT(vc));
-		risp_write_cs(isp, ISPCS_DT_CODE03_CH_REG(ch),
-			      ISPCS_DT_CODE03_EN3 | ISPCS_DT_CODE03_DT3(dt) |
-			      ISPCS_DT_CODE03_EN2 | ISPCS_DT_CODE03_DT2(dt) |
-			      ISPCS_DT_CODE03_EN1 | ISPCS_DT_CODE03_DT1(dt) |
-			      ISPCS_DT_CODE03_EN0 | ISPCS_DT_CODE03_DT0(dt));
-	}
-
-	/* Setup processing method. */
-	risp_write_cs(isp, ISPPROCMODE_DT_REG(format->datatype),
-		      ISPPROCMODE_DT_PROC_MODE_VCn(3, format->procmode) |
-		      ISPPROCMODE_DT_PROC_MODE_VCn(2, format->procmode) |
-		      ISPPROCMODE_DT_PROC_MODE_VCn(1, format->procmode) |
-		      ISPPROCMODE_DT_PROC_MODE_VCn(0, format->procmode));
+	ret = risp_configure_routing(isp, state);
+	if (ret)
+		return ret;
 
 	/* Start ISP. */
 	risp_write_cs(isp, ISPSTART_REG, ISPSTART_START);

-- 
2.43.0


