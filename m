Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 975AE1F0956
	for <lists+linux-media@lfdr.de>; Sun,  7 Jun 2020 04:28:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728920AbgFGC17 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 6 Jun 2020 22:27:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728887AbgFGC17 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 6 Jun 2020 22:27:59 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02E99C08C5C2
        for <linux-media@vger.kernel.org>; Sat,  6 Jun 2020 19:21:11 -0700 (PDT)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 653AF2C9
        for <linux-media@vger.kernel.org>; Sun,  7 Jun 2020 04:21:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1591496469;
        bh=mlyMuDZw3FoQvMOO4Wxgy9OvKT47GC0pbtdKjU1jmg4=;
        h=From:To:Subject:Date:From;
        b=b94yVX9euhvlYXcL4E8D41kd1EvHkE8fMWolkRDqRP139R2pFhdtJzZe0FF7Jf5Wj
         SgVfuwSr0kBaTe/CRpo+lqVntwl3b82S7XthQcMVeYUfvz1Iq5dRjESE6UTpU6hZty
         t4Cwvvu0rPSVkuAZ4M7KrPRnv1ONUBguawa6qSJ0=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH] media: uvcvideo: Set media controller entity functions
Date:   Sun,  7 Jun 2020 05:20:47 +0300
Message-Id: <20200607022047.29111-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The media controller core prints a warning when an entity is registered
without a function being set. This affect the uvcvideo driver, as the
warning was added without first addressing the issue in existing
drivers. The problem is harmless, but unnecessarily worries users. Fix
it by mapping UVC entity types to MC entity functions as accurately as
possible using the existing functions.

Fixes: b50bde4e476d ("[media] v4l2-subdev: use MEDIA_ENT_T_UNKNOWN for new subdevs")
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/usb/uvc/uvc_entity.c | 35 ++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_entity.c b/drivers/media/usb/uvc/uvc_entity.c
index b4499cddeffe..ca3a9c2eec27 100644
--- a/drivers/media/usb/uvc/uvc_entity.c
+++ b/drivers/media/usb/uvc/uvc_entity.c
@@ -73,10 +73,45 @@ static int uvc_mc_init_entity(struct uvc_video_chain *chain,
 	int ret;
 
 	if (UVC_ENTITY_TYPE(entity) != UVC_TT_STREAMING) {
+		u32 function;
+
 		v4l2_subdev_init(&entity->subdev, &uvc_subdev_ops);
 		strscpy(entity->subdev.name, entity->name,
 			sizeof(entity->subdev.name));
 
+		switch (UVC_ENTITY_TYPE(entity)) {
+		case UVC_VC_SELECTOR_UNIT:
+			function = MEDIA_ENT_F_VID_MUX;
+			break;
+		case UVC_VC_PROCESSING_UNIT:
+		case UVC_VC_EXTENSION_UNIT:
+			/* For lack of a better option. */
+			function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
+			break;
+		case UVC_COMPOSITE_CONNECTOR:
+		case UVC_COMPONENT_CONNECTOR:
+			function = MEDIA_ENT_F_CONN_COMPOSITE;
+			break;
+		case UVC_SVIDEO_CONNECTOR:
+			function = MEDIA_ENT_F_CONN_SVIDEO;
+			break;
+		case UVC_ITT_CAMERA:
+			function = MEDIA_ENT_F_CAM_SENSOR;
+			break;
+		case UVC_TT_VENDOR_SPECIFIC:
+		case UVC_ITT_VENDOR_SPECIFIC:
+		case UVC_ITT_MEDIA_TRANSPORT_INPUT:
+		case UVC_OTT_VENDOR_SPECIFIC:
+		case UVC_OTT_DISPLAY:
+		case UVC_OTT_MEDIA_TRANSPORT_OUTPUT:
+		case UVC_EXTERNAL_VENDOR_SPECIFIC:
+		default:
+			function = MEDIA_ENT_F_V4L2_SUBDEV_UNKNOWN;
+			break;
+		}
+
+		entity->subdev.entity.function = function;
+
 		ret = media_entity_pads_init(&entity->subdev.entity,
 					entity->num_pads, entity->pads);
 
-- 
Regards,

Laurent Pinchart

