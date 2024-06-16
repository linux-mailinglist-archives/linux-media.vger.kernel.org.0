Return-Path: <linux-media+bounces-13344-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA7090A0C1
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 01:14:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 021FF281F26
	for <lists+linux-media@lfdr.de>; Sun, 16 Jun 2024 23:14:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2512874405;
	Sun, 16 Jun 2024 23:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gOi0T6hH"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B0F73479
	for <linux-media@vger.kernel.org>; Sun, 16 Jun 2024 23:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718579659; cv=none; b=ImcmUDJb1iDaVFu5TfrNKOS69AYA3Jq/y4z/r2G//iagenHFJ41acZrlxN4KxNS2T+oaiBobsQdfFN7egyVdpGkIGktU94lRubbBfw2McSP7Tb4zol0L4k6YBMP6U6f4FKETeIDTKe+vLwemuoZ5AokspyPrQhoTHhSFcqnR6Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718579659; c=relaxed/simple;
	bh=e7lZ0jaSt6dQe9MF0UwZ4AjoOev9rF4eYHgQt1y05KE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RAMG2NSbLZ8rlyYMHGxf2jaGeWergcFNuzBI/xtz1prZBx0d/Owt11E9gv5C/mlFLkujGMSb7/jsnlTQt+2H2ul88PG29eh9bS0pZEVWd6WR5TJvjasUmYkcTg2o5QVHYAyDZ/4jvI+2Lnyu2atgRo4E24o9dBqeVGnyhfEP+BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gOi0T6hH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3FC972D5;
	Mon, 17 Jun 2024 01:14:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718579640;
	bh=e7lZ0jaSt6dQe9MF0UwZ4AjoOev9rF4eYHgQt1y05KE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gOi0T6hHMrQo+EXfUXrEBEe4Hj7CupC+PrOf8koS4zZP2w1oko6+8VBQ7C/LfOGk3
	 yvv9JVYjSCe2OD1flNyZThkiD/CyzfI59hOMsu0JzbP4mBeMBMdJNSbxPaNDV8FJUL
	 FgOw0n++bz/nNMVRR3OFs/KZNzmZ6YbACpXS3c44=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Ricardo Ribalda <ribalda@chromium.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH v3 3/6] media: uvcvideo: Probe the PLF characteristics
Date: Mon, 17 Jun 2024 02:13:47 +0300
Message-ID: <20240616231350.6787-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240616231350.6787-1-laurent.pinchart@ideasonboard.com>
References: <20240616231350.6787-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ricardo Ribalda <ribalda@chromium.org>

The UVC 1.5 standard defines 4 values for the PLF control: Off, 50Hz,
60Hz and Auto. But it does not clearly define if all the values must be
implemented or not.

Instead of just using the UVC version to determine what the PLF control
can do, probe it.

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v2:

- Implement .filter_mapping() instead of .add_mapping()
---
 drivers/media/usb/uvc/uvc_ctrl.c | 49 ++++++++++++++++++++++++++++++--
 1 file changed, 46 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 2ef443233f50..92841c73fde8 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -498,10 +498,53 @@ static const struct uvc_control_mapping uvc_ctrl_power_line_mapping_uvc15 = {
 static const struct uvc_control_mapping *uvc_ctrl_filter_plf_mapping(
 	struct uvc_video_chain *chain, struct uvc_control *ctrl)
 {
+	const struct uvc_control_mapping *out_mapping =
+					&uvc_ctrl_power_line_mapping_uvc11;
+	u8 *buf __free(kfree) = NULL;
+	u8 init_val;
+	int ret;
+
+	buf = kmalloc(sizeof(*buf), GFP_KERNEL);
+	if (!buf)
+		return NULL;
+
+	/* Save the current PLF value, so we can restore it. */
+	ret = uvc_query_ctrl(chain->dev, UVC_GET_CUR, ctrl->entity->id,
+			     chain->dev->intfnum, ctrl->info.selector,
+			     buf, sizeof(*buf));
+	/* If we cannot read the control skip it. */
+	if (ret)
+		return NULL;
+	init_val = *buf;
+
+	/* If PLF value cannot be set to off, it is limited. */
+	*buf = V4L2_CID_POWER_LINE_FREQUENCY_DISABLED;
+	ret = uvc_query_ctrl(chain->dev, UVC_SET_CUR, ctrl->entity->id,
+			     chain->dev->intfnum, ctrl->info.selector,
+			     buf, sizeof(*buf));
+	if (ret)
+		return &uvc_ctrl_power_line_mapping_limited;
+
+	/* UVC 1.1 does not define auto, we can exit. */
 	if (chain->dev->uvc_version < 0x150)
-		return &uvc_ctrl_power_line_mapping_uvc11;
-	else
-		return &uvc_ctrl_power_line_mapping_uvc15;
+		goto end;
+
+	/* Check if the device supports auto. */
+	*buf = V4L2_CID_POWER_LINE_FREQUENCY_AUTO;
+	ret = uvc_query_ctrl(chain->dev, UVC_SET_CUR, ctrl->entity->id,
+			     chain->dev->intfnum, ctrl->info.selector,
+			     buf, sizeof(*buf));
+	if (!ret)
+		out_mapping = &uvc_ctrl_power_line_mapping_uvc15;
+
+end:
+	/* Restore initial value and add mapping. */
+	*buf = init_val;
+	uvc_query_ctrl(chain->dev, UVC_SET_CUR, ctrl->entity->id,
+		       chain->dev->intfnum, ctrl->info.selector,
+		       buf, sizeof(*buf));
+
+	return out_mapping;
 }
 
 static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
-- 
Regards,

Laurent Pinchart


