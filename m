Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE990542825
	for <lists+linux-media@lfdr.de>; Wed,  8 Jun 2022 09:48:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233641AbiFHHpJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jun 2022 03:45:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237160AbiFHHGR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Jun 2022 03:06:17 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F145FD359
        for <linux-media@vger.kernel.org>; Tue,  7 Jun 2022 23:50:20 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 12468B91;
        Wed,  8 Jun 2022 08:50:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1654671014;
        bh=6uD8KrWxYsNhO6/A4RcpRZfGGdjuorBthV+vdtk7Bww=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=huZ6WlRTxfxaUisHq8bdSisHA/H6iQweaQ5UcJKLubFxvFXI/eeTmYt3rAr6DNWqG
         h9CxLd042Cz3apWH/R1JZUmykvuI8XpnNU0WTM12rOPbwjdon6WiUel4tlE9+iQ5AF
         0QDOC6e6EjA5kdaGvG1btJwUJY/j4KFTNzublBV4=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Yunke Cao <yunkec@google.com>
Subject: [RFC PATCH v4 2/7] media: uvcvideo: Add support for per-device control mapping overrides
Date:   Wed,  8 Jun 2022 09:50:00 +0300
Message-Id: <20220608065005.23014-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220608065005.23014-1-laurent.pinchart@ideasonboard.com>
References: <20220608065005.23014-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Ricardo Ribalda <ribalda@chromium.org>

Some devices do not implement all their controls in a way that complies
with the UVC specification. This is for instance the case for several
devices that do not support the disabled mode for the power line
frequency control. Add a mechanism to allow per-device control mapping
overrides to avoid errors when accessing non-compliant controls.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v3:

- Turn the power line quirk into a control mapping overrides array
---
 drivers/media/usb/uvc/uvc_ctrl.c | 27 +++++++++++++++++++++++++--
 drivers/media/usb/uvc/uvcvideo.h |  1 +
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index a709ebbb4d69..7ea352c0e97e 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -2433,14 +2433,37 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
 	if (!ctrl->initialized)
 		return;
 
-	/* Process common mappings first. */
+	/*
+	 * First check if the device provides a custom mapping for this control,
+	 * used to override standard mappings for non-conformant devices. Don't
+	 * process standard mappings if a custom mapping is found. This
+	 * mechanism doesn't support combining standard and custom mappings for
+	 * a single control.
+	 */
+	if (chain->dev->info->mappings) {
+		bool custom = false;
+		unsigned int i;
+
+		for (i = 0; (mapping = chain->dev->info->mappings[i]); ++i) {
+			if (uvc_entity_match_guid(ctrl->entity, mapping->entity) &&
+			    ctrl->info.selector == mapping->selector) {
+				__uvc_ctrl_add_mapping(chain, ctrl, mapping);
+				custom = true;
+			}
+		}
+
+		if (custom)
+			return;
+	}
+
+	/* Process common mappings next. */
 	for (; mapping < mend; ++mapping) {
 		if (uvc_entity_match_guid(ctrl->entity, mapping->entity) &&
 		    ctrl->info.selector == mapping->selector)
 			__uvc_ctrl_add_mapping(chain, ctrl, mapping);
 	}
 
-	/* And then version-specific mappings. */
+	/* Finally process version-specific mappings. */
 	if (chain->dev->uvc_version < 0x0150) {
 		mapping = uvc_ctrl_mappings_uvc11;
 		mend = mapping + ARRAY_SIZE(uvc_ctrl_mappings_uvc11);
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index c5b4febd2d94..fff5c5c99a3d 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -667,6 +667,7 @@ struct uvc_device_info {
 	u32	quirks;
 	u32	meta_format;
 	u16	uvc_version;
+	const struct uvc_control_mapping **mappings;
 };
 
 struct uvc_device {
-- 
Regards,

Laurent Pinchart

