Return-Path: <linux-media+bounces-26387-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A9BA3C0C4
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 14:57:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C286A1761B8
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 13:53:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BA201FE47E;
	Wed, 19 Feb 2025 13:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DnbKb9aG"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F751FDE19;
	Wed, 19 Feb 2025 13:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739973013; cv=none; b=DzeisYwPTVqPnRO8srHXXQipnTPiQ6PFysLI+2g+y1uOgk0ZLjkYcuSJxuQbh4cf/XML8MqMequ0GUHRkUsSQiBSho4SHan7nBH0ZN1oUwejXmlJysn4tpc9PzascoxvvjKxGdhym29CdWqJrsbx9G1aKhSkWPH2N1bULjoVVpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739973013; c=relaxed/simple;
	bh=HdwDoEf2d8eMZPBqZKxvlleSLILLadwCx8/Rw6rD3G0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OtsPybCdAPCm76wnDOnsanEUpbWFIkwCjnZowgCWd0KOnU+bPpvNeJrj4a6V7U+Ac/qdWBl0fUupItSdFo8pet1AC7d9cgXECIBrRVmt4it+ACkLv9JJMTQ0uRnVG86gBtwvM2BH4qxblmzzWD0yjvCHk90bJIWCWcnEcmy+W7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DnbKb9aG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 298AD75A;
	Wed, 19 Feb 2025 14:48:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739972912;
	bh=HdwDoEf2d8eMZPBqZKxvlleSLILLadwCx8/Rw6rD3G0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DnbKb9aGOltM1jDd65cxktvgY8hgnvNRQLU7ejMeAnmdzvbnJGVR5lgwsmoZRTN/U
	 EoAKnKCulxJz4gta6j2bg5Rn43TRphJj8LQtfqYk8B9Q7qcjvLoUgoUch6Dhta9fHc
	 mDYOpvM78ZW7C3vRKXUPtw2k7cDTfKsh3qY6DKl8=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Wed, 19 Feb 2025 15:49:10 +0200
Subject: [PATCH 16/18] media: rcar-csi2: Call get_frame_desc to find out VC
 & DT (Gen3)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250219-rcar-streams-v1-16-f1b93e370aab@ideasonboard.com>
References: <20250219-rcar-streams-v1-0-f1b93e370aab@ideasonboard.com>
In-Reply-To: <20250219-rcar-streams-v1-0-f1b93e370aab@ideasonboard.com>
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
X-Mailer: b4 0.15-dev-42535
X-Developer-Signature: v=1; a=openpgp-sha256; l=5089;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=HdwDoEf2d8eMZPBqZKxvlleSLILLadwCx8/Rw6rD3G0=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnteF1ptw/vtQUH4p8ZlH7GcG1JvXVLeMTcMQce
 xPmMHD/XO+JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ7XhdQAKCRD6PaqMvJYe
 9R/pEACedTK4i7QQZlbVCO8EhKeEis1ZrSOwALf5PLUQiKLBfYSBnhBM9XIVsSF+PN/yeppGj6V
 uSGYJXSC57xCj//w5x5pbvPX9tYaggw7h1fIp3Wq5NTwF+Ry9uBAqX2+ywETKabRmi43nsDDvlC
 /k1o2S5KwsCe43mg3BXCT50EjqSh5QW0slApBmgs2LW3UcEFF87vWUuEV45EXh92h/H/tWQGUe/
 tJGLbI6H/HQAKOzZse41QgOA1bgG5oLk2PvmYeVjg8Z+8mDaqjiSXrDQaxYG4x64NSRALYV3D/F
 NLFhi6e8IudLZOGOv9N6fjGI4mKh4U5gBGI/dqKNiEt/nan7W/QfflQcAtT1WzXUFK3BM9oq4Qk
 1zbn/NfpdEw3681ha55vxw8JVRQ1O6q5SdrFtz2uEBxKuWfs62/7R/Ihfke0kz6hyPiBJFAq6BX
 tkicxhJucUF4FGT4BgzbvY0XMNmyAtQqCeIjsFHwT0jqldXTC7J05+X6ll3kkAH/zCURtmNFbQ8
 ewB8GLZuVMk9iuWBOs4S1l3+/kW3D4JFm6Dz1JAVRIzKzVmeYIA7bVjY2mTuRA9zuJIPMgHWf52
 f3yKNuhjD2DdjZMebPcks2JSjTn1UW4sjZcZvMDLARLo9EubHFY4hqiTtk7T7nTU7UkmK7ggBGn
 LPnci++Cn1HSfLw==
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
index 3608437b72cd..627b116a96c4 100644
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
@@ -1062,52 +1059,94 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv,
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


