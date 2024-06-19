Return-Path: <linux-media+bounces-13762-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A04690F9BE
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 01:25:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B618A1F238A8
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 23:25:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB13215B15C;
	Wed, 19 Jun 2024 23:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OuWxmMqY"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A1F762C1
	for <linux-media@vger.kernel.org>; Wed, 19 Jun 2024 23:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718839498; cv=none; b=NCMmiaKqipZP1T4Tst4nrqHdATXT2xZoyl/T0Bu+nDsqS9nyMwJnHiBIwa0zWsxScosPwvSJ9sFw+LjACRh3HMQajo7XzpatLn9wjEs6XjSBp0QzTGitvzfzUUXM2p36J4QcDN12LenGORvRhnX412ScgtHjhvoT2g4qkoKbC1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718839498; c=relaxed/simple;
	bh=hOZq0MsRJzwxCzPT8CTrS7U4UH5KCg6abdAycpr1YRc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=blYkuno6NC3xqtXWTa2gEjk1RyuD/aY0xMWkIXdtVWUIk90XMhmF9mLmbBnzy7s1XaRQ1BuZdUkXCZW3hcL5+4vV9Q9GvsYhNNO3M6t8eo6HYkD0BDKAK31hhkmgBDfggYLnlLL1zsecCzG61nbiLghiAmxAFhyDXDGQw3STa4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OuWxmMqY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 52EFD8E1;
	Thu, 20 Jun 2024 01:24:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718839475;
	bh=hOZq0MsRJzwxCzPT8CTrS7U4UH5KCg6abdAycpr1YRc=;
	h=From:To:Cc:Subject:Date:From;
	b=OuWxmMqYRk8tENZ/2VPDy/xwLD2UvmLzNuUd4jeyLwMwP91PycW9IVbzkhJZNXSUQ
	 zik/OZS3kLaXnQxdPvt3IR9XLYyfOy2hAnA+LqML4K5/X8oz0sVE5hgf6pmCGq9M2O
	 Q1TrW0enE05CUNfo7qPjXKyTDc2TUQUobofvAGtE=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	imx@lists.linux.dev,
	Purism Kernel Team <kernel@puri.sm>
Subject: [PATCH] media: imx-mipi-csis: Use v4l2_subdev_enable_streams()
Date: Thu, 20 Jun 2024 02:24:31 +0300
Message-ID: <20240619232431.5708-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To support sources that implement the .enable_streams() and
.disable_streams() operations, replace the manual calls to the subdev
.s_stream() operation with the v4l2_subdev_enable_streams() and
v4l2_subdev_disable_streams() helpers. The helpers fall back to
.s_stream() if the source doesn't implement the new operations, so
backward compatibility is preserved.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index f49b06978f14..b9729a8883d6 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -320,7 +320,11 @@ struct mipi_csis_device {
 	struct v4l2_subdev sd;
 	struct media_pad pads[CSIS_PADS_NUM];
 	struct v4l2_async_notifier notifier;
-	struct v4l2_subdev *src_sd;
+
+	struct {
+		struct v4l2_subdev *sd;
+		const struct media_pad *pad;
+	} source;
 
 	struct v4l2_mbus_config_mipi_csi2 bus;
 	u32 clk_frequency;
@@ -597,7 +601,7 @@ static int mipi_csis_calculate_params(struct mipi_csis_device *csis,
 	u32 lane_rate;
 
 	/* Calculate the line rate from the pixel rate. */
-	link_freq = v4l2_get_link_freq(csis->src_sd->ctrl_handler,
+	link_freq = v4l2_get_link_freq(csis->source.sd->ctrl_handler,
 				       csis_fmt->width,
 				       csis->bus.num_data_lanes * 2);
 	if (link_freq < 0) {
@@ -958,7 +962,8 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
 	int ret;
 
 	if (!enable) {
-		v4l2_subdev_call(csis->src_sd, video, s_stream, 0);
+		v4l2_subdev_disable_streams(csis->source.sd,
+					    csis->source.pad->index, BIT(0));
 
 		mipi_csis_stop_stream(csis);
 		if (csis->debug.enable)
@@ -986,7 +991,8 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
 
 	mipi_csis_start_stream(csis, format, csis_fmt);
 
-	ret = v4l2_subdev_call(csis->src_sd, video, s_stream, 1);
+	ret = v4l2_subdev_enable_streams(csis->source.sd,
+					 csis->source.pad->index, BIT(0));
 	if (ret < 0)
 		goto err_stop;
 
@@ -1233,12 +1239,14 @@ static int mipi_csis_link_setup(struct media_entity *entity,
 	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
 
 	if (flags & MEDIA_LNK_FL_ENABLED) {
-		if (csis->src_sd)
+		if (csis->source.sd)
 			return -EBUSY;
 
-		csis->src_sd = remote_sd;
+		csis->source.sd = remote_sd;
+		csis->source.pad = remote_pad;
 	} else {
-		csis->src_sd = NULL;
+		csis->source.sd = NULL;
+		csis->source.pad = NULL;
 	}
 
 	return 0;

base-commit: 6ba59ff4227927d3a8530fc2973b80e94b54d58f
-- 
Regards,

Laurent Pinchart


