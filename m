Return-Path: <linux-media+bounces-40500-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 228DFB2E94A
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 02:10:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 00FD55E2F3C
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 00:10:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23C9313790B;
	Thu, 21 Aug 2025 00:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qk10QNx6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2FF190685;
	Thu, 21 Aug 2025 00:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755735019; cv=none; b=fRbylujEybi0rQN9tDOYDAGKFxM5Bij+JOsZfWfhwgRT0L5DJa6SxaJMve+Odp5eTU5Fga2reeHjVORqjUW8JBJzwRzeYPF5TiKbDHXdnHHeNh0wuIZG5YvmKndziMlmtbcTiyhTJGrr2UbgoPAUQ8Kx/ZMYvkD+p7byUrp/Usw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755735019; c=relaxed/simple;
	bh=dlt6AjDaT2fYF+9jmbGqOjVEdkRE7ZJy/0FFTLITsx4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I1RYPNw8WSo0Z0d7mr0M1TwTMfGosuHQSDEfIDNoozqw84ZFYSCnx/18MSOYQ9t0Y5dnGbGPtc7NTwNsWUlpMErQcPsY9psKCXEoGcU9YMFwhZ+Yx75Nq9UqxyNMBiSS9C6qbY6KQT78ud+CjYw+lyWLmFqZp4TUIrPj87Q14xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qk10QNx6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 0E81A1026;
	Thu, 21 Aug 2025 02:09:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755734956;
	bh=dlt6AjDaT2fYF+9jmbGqOjVEdkRE7ZJy/0FFTLITsx4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qk10QNx6DPDaVSZuejBY+d5vNUbBB+QHLGmK7TgD1rwLzEL/EontISrxtXoysano8
	 XLs5yMh1sDTsw0z/zIAUcU6ZXVnZMXYP3JSFKrNe1L08p/LwDjebrl3SqJpENrgj8f
	 G3FUb64PR/SkbKeOqF+NpEp0GfBOkA2AK8zV0PwA=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Isaac Scott <isaac.scott@ideasonboard.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 04/12] media: imx-mipi-csis: Shorten name of subdev state variables
Date: Thu, 21 Aug 2025 03:09:36 +0300
Message-ID: <20250821000944.27849-5-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250821000944.27849-1-laurent.pinchart@ideasonboard.com>
References: <20250821000944.27849-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename subdev state parameters passed to subdev operations from sd_state
to state. This standardizes the naming of the subdev state variables
through the driver, and helps shortening lines.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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


