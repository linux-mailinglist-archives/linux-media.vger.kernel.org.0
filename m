Return-Path: <linux-media+bounces-40694-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA22B30A51
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 02:28:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8DA492A4714
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 00:28:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 079BC140E5F;
	Fri, 22 Aug 2025 00:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lmVofQjl"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40446FBF;
	Fri, 22 Aug 2025 00:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755822489; cv=none; b=ONhfqvpZGIiPhhVchMOfMtHGCh76uStAUDkvcKVhbl+6cUw4Mn9JcT2aYNolY/ycXZmX9y0turzrw/Sr8DvpbuUVkRIrjhlAVDS1EYDfg/Sqbe+mEKzGO5XhVYzH/J2wkyxOpUm9ZvEjNYWpnQRvqDZuRLq5YIIZsXZD4Erngds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755822489; c=relaxed/simple;
	bh=YoV9+i/MtGnwkLtaVKn2vEwNBz3kbWJgjgwWtrTpX7w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=flOEggRCmBkfRnOoAblSz0fvYimBGXh3/72yYNo1l4C/uPPbWlBXwLscJUg51fC90a7gRaMUFbBi1r54Rea3jbrZFhIQqyJBN8uTAJJw2kbt71MJqifP10svLwGWDuf28uNpsPBeZXlVC/BuHq2n/j5Fd19fd3c2tUcRRVaSYg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lmVofQjl; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id CA5B7C75;
	Fri, 22 Aug 2025 02:27:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755822425;
	bh=YoV9+i/MtGnwkLtaVKn2vEwNBz3kbWJgjgwWtrTpX7w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lmVofQjldVwrmGpmKLa317MtNR5+7WuYpERuYvdTNpEeE4lqjhtHXn/BPFmQokXb0
	 t2yBakrWiOC9UOklyScbD5RsJdPX3W9kGSSu7R0dCZ/a0U9F9isre8TWg2A+sDqNzi
	 iZODXOb/Fx+Pt8Pdsl5Ap8cnsp2BRE2jOlg5SCwg=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Inbaraj E <inbaraj.e@samsung.com>,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Martin Kepplinger <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Purism Kernel Team <kernel@puri.sm>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 04/13] media: imx-mipi-csis: Shorten name of subdev state variables
Date: Fri, 22 Aug 2025 03:27:24 +0300
Message-ID: <20250822002734.23516-5-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250822002734.23516-1-laurent.pinchart@ideasonboard.com>
References: <20250822002734.23516-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename sd_state to state to standardize the naming of the subdev state
variables and help shortening lines.

No functional change is intended.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index 0f0863011230..894d12fef519 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -996,7 +996,7 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
 }
 
 static int mipi_csis_enum_mbus_code(struct v4l2_subdev *sd,
-				    struct v4l2_subdev_state *sd_state,
+				    struct v4l2_subdev_state *state,
 				    struct v4l2_subdev_mbus_code_enum *code)
 {
 	/*
@@ -1009,7 +1009,7 @@ static int mipi_csis_enum_mbus_code(struct v4l2_subdev *sd,
 		if (code->index > 0)
 			return -EINVAL;
 
-		fmt = v4l2_subdev_state_get_format(sd_state, code->pad);
+		fmt = v4l2_subdev_state_get_format(state, code->pad);
 		code->code = fmt->code;
 		return 0;
 	}
@@ -1026,7 +1026,7 @@ static int mipi_csis_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int mipi_csis_set_fmt(struct v4l2_subdev *sd,
-			     struct v4l2_subdev_state *sd_state,
+			     struct v4l2_subdev_state *state,
 			     struct v4l2_subdev_format *sdformat)
 {
 	const struct csis_pix_format *csis_fmt;
@@ -1038,7 +1038,7 @@ static int mipi_csis_set_fmt(struct v4l2_subdev *sd,
 	 * modified.
 	 */
 	if (sdformat->pad == CSIS_PAD_SOURCE)
-		return v4l2_subdev_get_fmt(sd, sd_state, sdformat);
+		return v4l2_subdev_get_fmt(sd, state, sdformat);
 
 	if (sdformat->pad != CSIS_PAD_SINK)
 		return -EINVAL;
@@ -1076,7 +1076,7 @@ static int mipi_csis_set_fmt(struct v4l2_subdev *sd,
 			      &sdformat->format.height, 1,
 			      CSIS_MAX_PIX_HEIGHT, 0, 0);
 
-	fmt = v4l2_subdev_state_get_format(sd_state, sdformat->pad);
+	fmt = v4l2_subdev_state_get_format(state, sdformat->pad);
 
 	fmt->code = csis_fmt->code;
 	fmt->width = sdformat->format.width;
@@ -1090,7 +1090,7 @@ static int mipi_csis_set_fmt(struct v4l2_subdev *sd,
 	sdformat->format = *fmt;
 
 	/* Propagate the format from sink to source. */
-	fmt = v4l2_subdev_state_get_format(sd_state, CSIS_PAD_SOURCE);
+	fmt = v4l2_subdev_state_get_format(state, CSIS_PAD_SOURCE);
 	*fmt = sdformat->format;
 
 	/* The format on the source pad might change due to unpacking. */
@@ -1130,7 +1130,7 @@ static int mipi_csis_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 }
 
 static int mipi_csis_init_state(struct v4l2_subdev *sd,
-				struct v4l2_subdev_state *sd_state)
+				struct v4l2_subdev_state *state)
 {
 	struct v4l2_subdev_format fmt = {
 		.pad = CSIS_PAD_SINK,
@@ -1147,7 +1147,7 @@ static int mipi_csis_init_state(struct v4l2_subdev *sd,
 		V4L2_MAP_QUANTIZATION_DEFAULT(false, fmt.format.colorspace,
 					      fmt.format.ycbcr_enc);
 
-	return mipi_csis_set_fmt(sd, sd_state, &fmt);
+	return mipi_csis_set_fmt(sd, state, &fmt);
 }
 
 static int mipi_csis_log_status(struct v4l2_subdev *sd)
-- 
Regards,

Laurent Pinchart


