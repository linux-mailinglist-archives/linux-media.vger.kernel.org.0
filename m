Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FA28578D7F
	for <lists+linux-media@lfdr.de>; Tue, 19 Jul 2022 00:28:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234876AbiGRW2i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Jul 2022 18:28:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229647AbiGRW2h (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Jul 2022 18:28:37 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 031A4286D3
        for <linux-media@vger.kernel.org>; Mon, 18 Jul 2022 15:28:36 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 811C26EE;
        Tue, 19 Jul 2022 00:28:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1658183314;
        bh=ByqLgWboA6agr5LlPG85e14WyGIxZ/eAm6lHr7jgkN8=;
        h=From:To:Cc:Subject:Date:From;
        b=i02yaZNy1yUQws3HOCe+6D5Fe2zGfW5n9j0secOkmVtMdryiOvXSpsThFGRGLiHJX
         RnewgfSrbEHJ8hcPDbvGgiWLN2ODEPDBMpjGbymmaQu66+eecJJ+G0YfcfgIBL3oEk
         JqaAp4qQI399kEqMeUO++AqpIS8ues+OeDiiYjpc=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] media: uvcvideo: Use indexed loops in uvc_ctrl_init_ctrl()
Date:   Tue, 19 Jul 2022 01:27:57 +0300
Message-Id: <20220718222757.8203-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As shown by the bug introduced in commit 86f7ef773156 ("media: uvcvideo:
Add support for per-device control mapping overrides"), the loop style
used by uvc_ctrl_init_ctrl() is error-prone. Rewrite the loops to use
indices instead.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
This patch depends on https://lore.kernel.org/linux-media/20220718121219.16079-1-laurent.pinchart@ideasonboard.com
---
 drivers/media/usb/uvc/uvc_ctrl.c | 34 ++++++++++++++++++--------------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 8c208db9600b..5c33b0b7ef9a 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -2411,10 +2411,9 @@ static void uvc_ctrl_prune_entity(struct uvc_device *dev,
 static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
 			       struct uvc_control *ctrl)
 {
-	const struct uvc_control_info *info = uvc_ctrls;
-	const struct uvc_control_info *iend = info + ARRAY_SIZE(uvc_ctrls);
-	const struct uvc_control_mapping *mapping;
-	const struct uvc_control_mapping *mend;
+	const struct uvc_control_mapping *mappings;
+	unsigned int num_mappings;
+	unsigned int i;
 
 	/*
 	 * XU controls initialization requires querying the device for control
@@ -2425,7 +2424,9 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
 	if (UVC_ENTITY_TYPE(ctrl->entity) == UVC_VC_EXTENSION_UNIT)
 		return;
 
-	for (; info < iend; ++info) {
+	for (i = 0; i < ARRAY_SIZE(uvc_ctrls); ++i) {
+		const struct uvc_control_info *info = &uvc_ctrls[i];
+
 		if (uvc_entity_match_guid(ctrl->entity, info->entity) &&
 		    ctrl->index == info->index) {
 			uvc_ctrl_add_info(chain->dev, ctrl, info);
@@ -2452,9 +2453,11 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
 	 */
 	if (chain->dev->info->mappings) {
 		bool custom = false;
-		unsigned int i;
 
-		for (i = 0; (mapping = chain->dev->info->mappings[i]); ++i) {
+		for (i = 0; chain->dev->info->mappings[i]; ++i) {
+			const struct uvc_control_mapping *mapping =
+				chain->dev->info->mappings[i];
+
 			if (uvc_entity_match_guid(ctrl->entity, mapping->entity) &&
 			    ctrl->info.selector == mapping->selector) {
 				__uvc_ctrl_add_mapping(chain, ctrl, mapping);
@@ -2467,10 +2470,9 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
 	}
 
 	/* Process common mappings next. */
-	mapping = uvc_ctrl_mappings;
-	mend = mapping + ARRAY_SIZE(uvc_ctrl_mappings);
+	for (i = 0; i < ARRAY_SIZE(uvc_ctrl_mappings); ++i) {
+		const struct uvc_control_mapping *mapping = &uvc_ctrl_mappings[i];
 
-	for (; mapping < mend; ++mapping) {
 		if (uvc_entity_match_guid(ctrl->entity, mapping->entity) &&
 		    ctrl->info.selector == mapping->selector)
 			__uvc_ctrl_add_mapping(chain, ctrl, mapping);
@@ -2478,14 +2480,16 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
 
 	/* Finally process version-specific mappings. */
 	if (chain->dev->uvc_version < 0x0150) {
-		mapping = uvc_ctrl_mappings_uvc11;
-		mend = mapping + ARRAY_SIZE(uvc_ctrl_mappings_uvc11);
+		mappings = uvc_ctrl_mappings_uvc11;
+		num_mappings = ARRAY_SIZE(uvc_ctrl_mappings_uvc11);
 	} else {
-		mapping = uvc_ctrl_mappings_uvc15;
-		mend = mapping + ARRAY_SIZE(uvc_ctrl_mappings_uvc15);
+		mappings = uvc_ctrl_mappings_uvc15;
+		num_mappings = ARRAY_SIZE(uvc_ctrl_mappings_uvc15);
 	}
 
-	for (; mapping < mend; ++mapping) {
+	for (i = 0; i < num_mappings; ++i) {
+		const struct uvc_control_mapping *mapping = &mappings[i];
+
 		if (uvc_entity_match_guid(ctrl->entity, mapping->entity) &&
 		    ctrl->info.selector == mapping->selector)
 			__uvc_ctrl_add_mapping(chain, ctrl, mapping);
-- 
Regards,

Laurent Pinchart

