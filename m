Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEC755446EB
	for <lists+linux-media@lfdr.de>; Thu,  9 Jun 2022 11:09:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233795AbiFIJI7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Jun 2022 05:08:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233741AbiFIJI5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Jun 2022 05:08:57 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61D6D15A34
        for <linux-media@vger.kernel.org>; Thu,  9 Jun 2022 02:08:56 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 04D7C80A;
        Thu,  9 Jun 2022 11:08:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1654765734;
        bh=xP7kPhL1tKqx2ZWOqLikCxiGqfHd1jbQ0I4d/gDyJko=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SZzYifeZoHgfAITtD7BPTzbdD34Sb893qfNIv0g0dvGZYEaQZ1G2B0gyoq3HDi4mw
         wJ8EgUhPA70aqXrDlSBnJDD3AnKnHl9ByydiYTPYntThtOnR02EpzlAvEKvSURWZrn
         K9vdwSz0tAZKxkSeViW/oqIBVcWWjrQRr7C5z/ds=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Yunke Cao <yunkec@google.com>
Subject: [PATCH v5 2/7] media: uvcvideo: Add support for per-device control mapping overrides
Date:   Thu,  9 Jun 2022 12:08:38 +0300
Message-Id: <20220609090843.16423-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220609090843.16423-1-laurent.pinchart@ideasonboard.com>
References: <20220609090843.16423-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
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
index 95fdd41ab20b..e4826a846861 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -2444,14 +2444,37 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
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
index d2eb107347ea..24c911aeebce 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -668,6 +668,7 @@ struct uvc_device_info {
 	u32	quirks;
 	u32	meta_format;
 	u16	uvc_version;
+	const struct uvc_control_mapping **mappings;
 };
 
 struct uvc_device {
-- 
Regards,

Laurent Pinchart

