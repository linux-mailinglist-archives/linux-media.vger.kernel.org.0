Return-Path: <linux-media+bounces-48907-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D432CC3F48
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 16:32:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D8B6730B4C5A
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 15:28:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 416643563C5;
	Tue, 16 Dec 2025 15:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lVDYTEQq"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C742350D42;
	Tue, 16 Dec 2025 15:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765898373; cv=none; b=X6WZv2SVsmMnCvYEN5MvIzs+ckrz4Kffz4x7xVBPFAOcBdPZ+Y55K90CjtCLMR+Qnv5tExHTfns1X2X5M/2OQsYQRzRMKFLr8ZpHXDOLLcS2uW38Yf66y1nOlIvdnJDP0FcCea+1hCpkIrWS8pLgC20zeeqyW48C7V4qQmcg+7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765898373; c=relaxed/simple;
	bh=nvIzLSbZyKpJWhP1c6rVu/jXt148ekDke77qvQG6ysg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GGWXa2zvc7MB+f6WYrswnCYqhURNqfg+bGwtrwyod16igBX0AX/vtLC4TLtlG47+9JulvTyC53z2WTUsGMWo3fGPoGM4Zx3MMuF91ExrYx3N87f9SNcBC3B+rHe0uizfE/z+DwjcgWDIqmw2HFkad61YJTFK6+d9cRgqvGok3rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lVDYTEQq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 095CC177A;
	Tue, 16 Dec 2025 16:19:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1765898349;
	bh=nvIzLSbZyKpJWhP1c6rVu/jXt148ekDke77qvQG6ysg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lVDYTEQqL0bcym9UYi7ccrd7Piiu/Lks6LJ+3m+oyudZbty2M0FLA2Vnzyeav2Ve7
	 2pCvMoHn8lYhZxBKJyhhQTj6Y4ydAnf8BAsxh4qxplPC3oDk1i9QUomJRhKl9fvmAN
	 IoBY9Vfb2X4SH3gpIb/PUSJ4MDsgGV4HvrL+PwMc=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Tue, 16 Dec 2025 17:18:30 +0200
Subject: [PATCH v4 13/15] media: rcar-csi2: Call get_frame_desc to find out
 VC & DT (Gen3)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-rcar-streams-v4-13-f28b4831cc67@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5032;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=nvIzLSbZyKpJWhP1c6rVu/jXt148ekDke77qvQG6ysg=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpQXhnJ7ISHw/kPdc2MFFXCsOVbJdUuMsR/Ykvl
 lzUIgG6f3uJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaUF4ZwAKCRD6PaqMvJYe
 9QSAD/9J5wgcCoYEOM+05zG6zWOFiLUg/TBC0y1CV6hbOZJF5XWZN5/GvN8bVF/RO0AZWYroZKF
 5FgPzNtecsj/Vnwuc4oewLL5VmDzmUUTX3GbiJJu6JlZxmSEMKa7OVR7i7hYemwixSvGFKOjGv2
 F3D4G5zWfebvzXdy29kEI2DAYtbXClkPXFZD/qwRrJurkR0/AmuDDkCgGgZMcxtK1MxX4+IaqML
 zoqTA02DeiPZj+DUVvOfBa09ZE96+iDEe7IH7PMpbv6cyZDOfUX5RoDf6cd4Ur2GrWeOiWyv0w1
 GLteBEP9T+4ZV9CtO8V+hgCtxLZCkY0/EZL26wSnZgaydF8F2y75kBfVoH85Rw6MVlLQ6555KeZ
 TThdvNuYQjeDLsMYKsmLtRq+UjI6N6INUud8LMd0SLHvaUzbvxHxBzjJ3k334XZ4IqYj8LHwK5D
 WB8vq7pBE1Jr45pG9Fy+gWWrtmmAdbBemJElmW8o1FV7ny5ABYufuZ5kjXa1mmLcRh7XQrOHM/I
 rGR9u14kd0cxH4zAg+6oEBBIjm+4uLsN4TNX5lDslTGkgmvbmTbsYSJiUy7Q4+uCjgPLS39NLPJ
 /wlo3tSw5CS/RoXB3XVmXIwW0oLPvX4bUBbq/cbCZfTavKCNNtOIkx0fOQMQg7osvxtGJTPkLKR
 Ctib1swqiUEqEOg==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Call get_frame_desc to find out VC & DT, for Gen3 platforms, instead of
hardcoding the VC routing and deducing the DT based on the mbus format.

If the source subdevice doesn't implement .get_frame_desc, we use a
fallback case where we assume there's a single stream with VC = 0 and DT
based on the mbus format.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-csi2.c | 115 +++++++++++++++++++----------
 1 file changed, 75 insertions(+), 40 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index b8baf7c65e90..93f25fb3b82e 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -1069,62 +1069,97 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv,
 static int rcsi2_start_receiver_gen3(struct rcar_csi2 *priv,
 				     struct v4l2_subdev_state *state)
 {
-	const struct v4l2_subdev_route *route;
-	const struct rcar_csi2_format *format;
-	u32 phycnt, vcdt = 0, vcdt2 = 0, fld = 0;
-	const struct v4l2_mbus_framefmt *fmt;
+	u32 phycnt, vcdt = 0, vcdt2 = 0;
+	u32 fld = FLD_DET_SEL(1);
+	struct v4l2_mbus_frame_desc source_fd;
+	struct v4l2_subdev_route *route;
 	unsigned int lanes;
-	unsigned int i;
 	int mbps, ret;
+	u8 ch = 0;
 
-	/* Use the format on the sink pad to compute the receiver config. */
+	ret = v4l2_subdev_call(priv->remote, pad, get_frame_desc,
+			       priv->remote_pad, &source_fd);
+	if (ret && ret != -ENOIOCTLCMD)
+		return ret;
 
-	if (state->routing.num_routes != 1)
-		return -EINVAL;
+	if (ret == -ENOIOCTLCMD) {
+		/* Create a fallback source_fd */
+		struct v4l2_mbus_frame_desc *fd = &source_fd;
+		const struct v4l2_subdev_route *route;
+		const struct rcar_csi2_format *format;
+		struct v4l2_mbus_framefmt *fmt;
 
-	route = &state->routing.routes[0];
+		if (state->routing.num_routes != 1)
+			return -EINVAL;
 
-	fmt = v4l2_subdev_state_get_format(state, route->sink_pad,
-					   route->sink_stream);
-	if (!fmt)
-		return -EINVAL;
+		route = &state->routing.routes[0];
 
-	dev_dbg(priv->dev, "Input size (%ux%u%c)\n",
-		fmt->width, fmt->height,
-		fmt->field == V4L2_FIELD_NONE ? 'p' : 'i');
+		fmt = v4l2_subdev_state_get_format(state, route->sink_pad,
+						   route->sink_stream);
+		if (!fmt)
+			return -EINVAL;
 
-	/* Code is validated in set_fmt. */
-	format = rcsi2_code_to_fmt(fmt->code);
-	if (!format)
-		return -EINVAL;
+		format = rcsi2_code_to_fmt(fmt->code);
+		if (!format)
+			return -EINVAL;
 
-	/*
-	 * Enable all supported CSI-2 channels with virtual channel and
-	 * data type matching.
-	 *
-	 * NOTE: It's not possible to get individual datatype for each
-	 *       source virtual channel. Once this is possible in V4L2
-	 *       it should be used here.
-	 */
-	for (i = 0; i < priv->info->num_channels; i++) {
+		memset(fd, 0, sizeof(*fd));
+
+		fd->num_entries = 1;
+		fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
+		fd->entry[0].stream = 0;
+		fd->entry[0].pixelcode = fmt->code;
+		fd->entry[0].bus.csi2.vc = 0;
+		fd->entry[0].bus.csi2.dt = format->datatype;
+	}
+
+	for_each_active_route(&state->routing, route) {
+		const struct v4l2_mbus_frame_desc_entry *source_entry = NULL;
+		const struct v4l2_mbus_framefmt *fmt;
+		const struct rcar_csi2_format *format;
+		unsigned int i;
 		u32 vcdt_part;
 
-		if (priv->channel_vc[i] < 0)
-			continue;
+		for (i = 0; i < source_fd.num_entries; i++) {
+			if (source_fd.entry[i].stream == route->sink_stream) {
+				source_entry = &source_fd.entry[i];
+				break;
+			}
+		}
 
-		vcdt_part = VCDT_SEL_VC(priv->channel_vc[i]) | VCDT_VCDTN_EN |
-			VCDT_SEL_DTN_ON | VCDT_SEL_DT(format->datatype);
+		if (!source_entry) {
+			dev_err(priv->dev,
+				"Failed to find stream from source frame desc\n");
+			return -EPIPE;
+		}
+
+		vcdt_part = VCDT_SEL_VC(source_entry->bus.csi2.vc) |
+			    VCDT_VCDTN_EN | VCDT_SEL_DTN_ON |
+			    VCDT_SEL_DT(source_entry->bus.csi2.dt);
 
 		/* Store in correct reg and offset. */
-		if (i < 2)
-			vcdt |= vcdt_part << ((i % 2) * 16);
+		if (ch < 2)
+			vcdt |= vcdt_part << ((ch % 2) * 16);
 		else
-			vcdt2 |= vcdt_part << ((i % 2) * 16);
-	}
+			vcdt2 |= vcdt_part << ((ch % 2) * 16);
+
+		fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK,
+						   route->sink_stream);
+		if (!fmt)
+			return -EINVAL;
 
-	if (fmt->field == V4L2_FIELD_ALTERNATE)
-		fld = FLD_DET_SEL(1) | FLD_FLD_EN(3) | FLD_FLD_EN(2) |
-		      FLD_FLD_EN(1) | FLD_FLD_EN(0);
+		dev_dbg(priv->dev, "Input size (%ux%u%c)\n",
+			fmt->width, fmt->height,
+			fmt->field == V4L2_FIELD_NONE ? 'p' : 'i');
+
+		/* Code is validated in set_fmt. */
+		format = rcsi2_code_to_fmt(fmt->code);
+
+		if (fmt->field == V4L2_FIELD_ALTERNATE)
+			fld |= FLD_FLD_EN(ch);
+
+		ch++;
+	}
 
 	/*
 	 * Get the number of active data lanes inspecting the remote mbus

-- 
2.43.0


