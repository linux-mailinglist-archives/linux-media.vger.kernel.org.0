Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AADC9542837
	for <lists+linux-media@lfdr.de>; Wed,  8 Jun 2022 09:48:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232400AbiFHHpP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jun 2022 03:45:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237968AbiFHHGV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Jun 2022 03:06:21 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97276A7764
        for <linux-media@vger.kernel.org>; Tue,  7 Jun 2022 23:50:15 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 77807A58;
        Wed,  8 Jun 2022 08:50:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1654671013;
        bh=PTsv2vSCPMKQqQydSOdrfMNySrHf+nsMpLYmGiyqUaQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Q40H9Qb8PDTBHzUQXnkpi9cK7qDwrXSVaQ1J1MwEk03KG/25WsVTn233/BGwprEPP
         JMkoVvnptO7kHP+m5XcpOVwrj2bgsjWHSEeURTCNrVFQzOf64g+DszRtwUPqZHQVTv
         heT8pll008BbucLCuwR65f0yKSnOcVYfUnRtI4u0=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Yunke Cao <yunkec@google.com>
Subject: [RFC PATCH v4 1/7] media: uvcvideo: Add missing value for power_line_frequency
Date:   Wed,  8 Jun 2022 09:49:59 +0300
Message-Id: <20220608065005.23014-2-laurent.pinchart@ideasonboard.com>
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

UVC 1.5 class defines 4 values for this control on:
4.2.2.3.6 Power Line Frequency Control

Add the missing value when the UVC version is 1.5.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v3:

- Create version-specific control mapping arrays
---
 drivers/media/usb/uvc/uvc_ctrl.c | 56 +++++++++++++++++++++++++-------
 1 file changed, 45 insertions(+), 11 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 0e78233fc8a0..a709ebbb4d69 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -366,6 +366,7 @@ static const struct uvc_menu_info power_line_frequency_controls[] = {
 	{ 0, "Disabled" },
 	{ 1, "50 Hz" },
 	{ 2, "60 Hz" },
+	{ 3, "Auto" },
 };
 
 static const struct uvc_menu_info exposure_auto_controls[] = {
@@ -504,17 +505,6 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
 		.data_type	= UVC_CTRL_DATA_TYPE_UNSIGNED,
 	},
-	{
-		.id		= V4L2_CID_POWER_LINE_FREQUENCY,
-		.entity		= UVC_GUID_UVC_PROCESSING,
-		.selector	= UVC_PU_POWER_LINE_FREQUENCY_CONTROL,
-		.size		= 2,
-		.offset		= 0,
-		.v4l2_type	= V4L2_CTRL_TYPE_MENU,
-		.data_type	= UVC_CTRL_DATA_TYPE_ENUM,
-		.menu_info	= power_line_frequency_controls,
-		.menu_count	= ARRAY_SIZE(power_line_frequency_controls),
-	},
 	{
 		.id		= V4L2_CID_HUE_AUTO,
 		.entity		= UVC_GUID_UVC_PROCESSING,
@@ -730,6 +720,34 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 	},
 };
 
+static const struct uvc_control_mapping uvc_ctrl_mappings_uvc11[] = {
+	{
+		.id		= V4L2_CID_POWER_LINE_FREQUENCY,
+		.entity		= UVC_GUID_UVC_PROCESSING,
+		.selector	= UVC_PU_POWER_LINE_FREQUENCY_CONTROL,
+		.size		= 2,
+		.offset		= 0,
+		.v4l2_type	= V4L2_CTRL_TYPE_MENU,
+		.data_type	= UVC_CTRL_DATA_TYPE_ENUM,
+		.menu_info	= power_line_frequency_controls,
+		.menu_count	= ARRAY_SIZE(power_line_frequency_controls) - 1,
+	},
+};
+
+static const struct uvc_control_mapping uvc_ctrl_mappings_uvc15[] = {
+	{
+		.id		= V4L2_CID_POWER_LINE_FREQUENCY,
+		.entity		= UVC_GUID_UVC_PROCESSING,
+		.selector	= UVC_PU_POWER_LINE_FREQUENCY_CONTROL,
+		.size		= 2,
+		.offset		= 0,
+		.v4l2_type	= V4L2_CTRL_TYPE_MENU,
+		.data_type	= UVC_CTRL_DATA_TYPE_ENUM,
+		.menu_info	= power_line_frequency_controls,
+		.menu_count	= ARRAY_SIZE(power_line_frequency_controls),
+	},
+};
+
 /* ------------------------------------------------------------------------
  * Utility functions
  */
@@ -2415,6 +2433,22 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
 	if (!ctrl->initialized)
 		return;
 
+	/* Process common mappings first. */
+	for (; mapping < mend; ++mapping) {
+		if (uvc_entity_match_guid(ctrl->entity, mapping->entity) &&
+		    ctrl->info.selector == mapping->selector)
+			__uvc_ctrl_add_mapping(chain, ctrl, mapping);
+	}
+
+	/* And then version-specific mappings. */
+	if (chain->dev->uvc_version < 0x0150) {
+		mapping = uvc_ctrl_mappings_uvc11;
+		mend = mapping + ARRAY_SIZE(uvc_ctrl_mappings_uvc11);
+	} else {
+		mapping = uvc_ctrl_mappings_uvc15;
+		mend = mapping + ARRAY_SIZE(uvc_ctrl_mappings_uvc15);
+	}
+
 	for (; mapping < mend; ++mapping) {
 		if (uvc_entity_match_guid(ctrl->entity, mapping->entity) &&
 		    ctrl->info.selector == mapping->selector)
-- 
Regards,

Laurent Pinchart

