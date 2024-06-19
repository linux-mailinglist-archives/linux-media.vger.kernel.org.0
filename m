Return-Path: <linux-media+bounces-13627-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E71690E094
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 02:18:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF5C11F2371C
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 00:18:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A58616112;
	Wed, 19 Jun 2024 00:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fmwate3B"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A522C4C74;
	Wed, 19 Jun 2024 00:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718756277; cv=none; b=coSKWLAr5689wmH3tFF89f3gX5x4TEGDYt+lIMynWDOX01gZW4xwjmN8g8ANJ4Jui5ijR3Znyt08xh8SJoJGfZp3TgRVtEoErwqbwtDVJcUd1cWIqyp4v7HO73c9dRdrL5npHvg6J1VQhSBmTIJfiT5YeQe6N8+Mj72ZFEfemRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718756277; c=relaxed/simple;
	bh=3EHKAm5luTWyI9OakZf/ykjJznjxCu7xJltYMth2htI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g+JD9p0lzJNIMHQY7ORYBSH72tb4sgG+b8HrXjLSmSBrhPBKDhJyCMOAvTR44JEnFpJ+uAnMH+SwioDWEiJ9UE0KEeX7iY/rRIuYS+YyiCU349q1+SbPWUyztJ1WJM5UiZx3Z5oq6CyC7F2d2XyI0MWoGS+9PAW4UCmA16J5L+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fmwate3B; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7929E1011;
	Wed, 19 Jun 2024 02:17:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718756253;
	bh=3EHKAm5luTWyI9OakZf/ykjJznjxCu7xJltYMth2htI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fmwate3BbRylOcFeVPnAVElgOVd8AwWJoD8eb+fOS0YCauEiD/HXX456siXHs2ePX
	 P5/HDFiBuvrLd7gTI/+/rXUhjRDTkQOW1an5R5sVh6AlptZIiZFXjOCQYBeDOLOOu3
	 d91UsdpYYVTW66OI25y0JWp79I5Yu/DdzxEPgkCo=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v2 05/19] media: renesas: vsp1: Drop custom .get_fmt() handler for histogram
Date: Wed, 19 Jun 2024 03:17:08 +0300
Message-ID: <20240619001722.9749-6-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240619001722.9749-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20240619001722.9749-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

The histogram module is the only one that has a custom .get_fmt()
handler, to handle the special case of the output format being fixed.
This can equally well be handled in the .set_fmt() handler instead.
Beside avoiding special cases and using the same .get_fmt() handler in
all modules, it ensures that the correct format is stored in the active
state for the source pad, including when .set_fmt() is called from
vsp1_entity_init_state(). Both are needed to later switch to the V4L2
subdev active state API.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
 .../media/platform/renesas/vsp1/vsp1_histo.c  | 29 +++++++------------
 1 file changed, 10 insertions(+), 19 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_histo.c b/drivers/media/platform/renesas/vsp1/vsp1_histo.c
index 85d2fc538327..9c2d4c91bfad 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_histo.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_histo.c
@@ -352,30 +352,21 @@ static int histo_set_selection(struct v4l2_subdev *subdev,
 	return ret;
 }
 
-static int histo_get_format(struct v4l2_subdev *subdev,
-			    struct v4l2_subdev_state *sd_state,
-			    struct v4l2_subdev_format *fmt)
-{
-	if (fmt->pad == HISTO_PAD_SOURCE) {
-		fmt->format.code = MEDIA_BUS_FMT_FIXED;
-		fmt->format.width = 0;
-		fmt->format.height = 0;
-		fmt->format.field = V4L2_FIELD_NONE;
-		fmt->format.colorspace = V4L2_COLORSPACE_RAW;
-		return 0;
-	}
-
-	return vsp1_subdev_get_pad_format(subdev, sd_state, fmt);
-}
-
 static int histo_set_format(struct v4l2_subdev *subdev,
 			    struct v4l2_subdev_state *sd_state,
 			    struct v4l2_subdev_format *fmt)
 {
 	struct vsp1_histogram *histo = subdev_to_histo(subdev);
 
-	if (fmt->pad != HISTO_PAD_SINK)
-		return histo_get_format(subdev, sd_state, fmt);
+	if (fmt->pad == HISTO_PAD_SOURCE) {
+		fmt->format.code = MEDIA_BUS_FMT_FIXED;
+		fmt->format.width = 0;
+		fmt->format.height = 0;
+		fmt->format.field = V4L2_FIELD_NONE;
+		fmt->format.colorspace = V4L2_COLORSPACE_RAW;
+
+		return 0;
+	}
 
 	return vsp1_subdev_set_pad_format(subdev, sd_state, fmt,
 					  histo->formats, histo->num_formats,
@@ -386,7 +377,7 @@ static int histo_set_format(struct v4l2_subdev *subdev,
 static const struct v4l2_subdev_pad_ops histo_pad_ops = {
 	.enum_mbus_code = histo_enum_mbus_code,
 	.enum_frame_size = histo_enum_frame_size,
-	.get_fmt = histo_get_format,
+	.get_fmt = vsp1_subdev_get_pad_format,
 	.set_fmt = histo_set_format,
 	.get_selection = histo_get_selection,
 	.set_selection = histo_set_selection,
-- 
Regards,

Laurent Pinchart


