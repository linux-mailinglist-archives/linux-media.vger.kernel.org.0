Return-Path: <linux-media+bounces-33680-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E53F3AC90AF
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 15:54:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 99D1D7ACF91
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 13:53:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F3FF235050;
	Fri, 30 May 2025 13:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="k0tXJZ0d"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0D3233733;
	Fri, 30 May 2025 13:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748613114; cv=none; b=NHEdhif1hsljRlRvi8WgKoILAUzCv5rzWpQzQ2gV2zQ0T+Z6I52bmBro8qK2S3MXn4+sfxHaij7CZ35fngcxCDkkU8oCf1k88/DB/U/f12+4ehJzsD2WlpJ4bIxystcvScjPj8K28K9zRAZcZNKnUxufsjuQ2/oi9pBAtDzhxEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748613114; c=relaxed/simple;
	bh=aqbmhsHX5IxfR08kY9FbOyMcyYBn9kBKkZQk0J+/pcA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h4YTeVR2fYwDQT8Yr8EHq8M8kI+1gpIYDP0BxooET17EceAz3MgmAKYdHTrAzjsNKD5UQJP+LGdaMDlpv96PFvEIWf12v5mGNiqkoyFVEbe+ZBfz2Q/s5qGxdOYzhNXVxizKPd9UtiBmlLoZAyxKj6Xie9hdX0A7Od2a/fNWxzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=k0tXJZ0d; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 934881A44;
	Fri, 30 May 2025 15:51:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748613071;
	bh=aqbmhsHX5IxfR08kY9FbOyMcyYBn9kBKkZQk0J+/pcA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=k0tXJZ0dD+sBvbO6CpVA5RZj8ttI9TsGju4Z4M1sgCTWNcIhoE0N5D66yMf4SDkfT
	 EhxZ7piEfKRlCdMEkRTmcWYi/LYheHbT/0/KHmBQZC4exSbX8+S9ZkzdsIKoKkL5GT
	 E6+7ah0VmJP+G+lI0CccCqK6ySBbD8KXwIiZ3z9M=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Fri, 30 May 2025 16:50:42 +0300
Subject: [PATCH v3 13/15] media: rcar-csi2: Call get_frame_desc to find out
 VC & DT (Gen3)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250530-rcar-streams-v3-13-026655df7138@ideasonboard.com>
References: <20250530-rcar-streams-v3-0-026655df7138@ideasonboard.com>
In-Reply-To: <20250530-rcar-streams-v3-0-026655df7138@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5089;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=aqbmhsHX5IxfR08kY9FbOyMcyYBn9kBKkZQk0J+/pcA=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBoObffxSvRzTfUkBMUYZQ8MaKDQJpjwoAY9Iopj
 a+q1TFvpiGJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaDm33wAKCRD6PaqMvJYe
 9fOPEACY2UthGrvNKuGj2uTtLMQao35gejtwJv+Vn6NYZCnoI8gy0zrCblBdppHu/Jqx8/uVG2f
 /KeDotlWaghhsgy78oHIDBOTnjH0ZvlBX9eup9W9TBQGxpN/XCUGWJQsurqQxSX52TEGMZG8v3O
 CnU0p3qgQncWLYfCv1RdvoYIHNcSZlUBI1n36yRK5NefoL4r1/SwTvCISbiQdaOT7sDiLuoYrYk
 Konfbwt4FsEjd0S+4BJnF2T7DtVb4TOR7yhoJcXujl32M8ZMMZ472jW7YxJm/6WLIB2qiO90pzB
 9ZELITYamuCahLfsVqFl6iV15Th+KajsWJLabMLCqxdU0oJyHSmrectpF46nNjZQWQ9KzQR96hb
 RInUFeEvrXUa+GxwxYRvVsSSVXFrgS76hAVsWAwIfqFKL9KdkTsdC0uoVvGuAv92fixRktW0ZvQ
 BcmukUm+SGenqwfwXnaGq410Ipk/MJuk2lZm7D9o5znw/0zXh90soyeF/aXTAtqwFRchvTiywhZ
 1MENuOAw/A8fSWUtS4Ae0iUQV56fsNu52M7bmviWHX8A+LR3vB2JtyEz2+5039moPBV7zkrq5s+
 umNXc+aA31h95jBFPK7Lxfrxx4x03tGIUD25UdSWa6AwOKKG1jv+oqYGF+HwpH/uPepOfVwCkg7
 +Dz4rIxAOw8B7Rg==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Call get_frame_desc to find out VC & DT, for Gen3 platforms, instead of
hardcoding the VC routing and deducing the DT based on the mbus format.

If the source subdevice doesn't implement .get_frame_desc, we use a
fallback case where we assume there's a single stream with VC = 0 and DT
based on the mbus format.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-csi2.c | 113 +++++++++++++++++++----------
 1 file changed, 76 insertions(+), 37 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index b9f83aae725a..8f708196ef49 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -71,10 +71,7 @@ struct rcar_csi2;
 #define FLD_REG				0x1c
 #define FLD_FLD_NUM(n)			(((n) & 0xff) << 16)
 #define FLD_DET_SEL(n)			(((n) & 0x3) << 4)
-#define FLD_FLD_EN4			BIT(3)
-#define FLD_FLD_EN3			BIT(2)
-#define FLD_FLD_EN2			BIT(1)
-#define FLD_FLD_EN			BIT(0)
+#define FLD_FLD_EN(ch)			BIT(ch)
 
 /* Automatic Standby Control */
 #define ASTBY_REG			0x20
@@ -1066,52 +1063,94 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv,
 static int rcsi2_start_receiver_gen3(struct rcar_csi2 *priv,
 				     struct v4l2_subdev_state *state)
 {
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
-	fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK, 0);
+	ret = v4l2_subdev_call(priv->remote, pad, get_frame_desc,
+			       priv->remote_pad, &source_fd);
+	if (ret && ret != -ENOIOCTLCMD) {
+		return ret;
+	} else if (ret == -ENOIOCTLCMD) {
+		/* Create a fallback source_fd */
+		struct v4l2_mbus_frame_desc *fd = &source_fd;
+		const struct rcar_csi2_format *format;
+		struct v4l2_mbus_framefmt *fmt;
 
-	dev_dbg(priv->dev, "Input size (%ux%u%c)\n",
-		fmt->width, fmt->height,
-		fmt->field == V4L2_FIELD_NONE ? 'p' : 'i');
+		fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK, 0);
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
+		struct v4l2_mbus_frame_desc_entry *source_entry = NULL;
+		const struct v4l2_mbus_framefmt *fmt;
+		const struct rcar_csi2_format *format;
+		unsigned int i;
+		u8 vc, dt;
 		u32 vcdt_part;
 
-		if (priv->channel_vc[i] < 0)
-			continue;
+		for (i = 0; i < source_fd.num_entries; i++) {
+			if (source_fd.entry[i].stream == route->sink_stream) {
+				source_entry = &source_fd.entry[i];
+				break;
+			}
+		}
+
+		if (!source_entry) {
+			dev_err(priv->dev,
+				"Failed to find stream from source frame desc\n");
+			return -EPIPE;
+		}
 
-		vcdt_part = VCDT_SEL_VC(priv->channel_vc[i]) | VCDT_VCDTN_EN |
-			VCDT_SEL_DTN_ON | VCDT_SEL_DT(format->datatype);
+		vc = source_entry->bus.csi2.vc;
+		dt = source_entry->bus.csi2.dt;
+
+		vcdt_part = VCDT_SEL_VC(vc) | VCDT_VCDTN_EN |
+			VCDT_SEL_DTN_ON | VCDT_SEL_DT(dt);
 
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
+
+		dev_dbg(priv->dev, "Input size (%ux%u%c)\n",
+			fmt->width, fmt->height,
+			fmt->field == V4L2_FIELD_NONE ? 'p' : 'i');
 
-	if (fmt->field == V4L2_FIELD_ALTERNATE)
-		fld = FLD_DET_SEL(1) | FLD_FLD_EN4 | FLD_FLD_EN3 | FLD_FLD_EN2
-			| FLD_FLD_EN;
+		/* Code is validated in set_fmt. */
+		format = rcsi2_code_to_fmt(fmt->code);
+		if (!format)
+			return -EINVAL;
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


