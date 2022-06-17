Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE02F54F592
	for <lists+linux-media@lfdr.de>; Fri, 17 Jun 2022 12:37:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381785AbiFQKgy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jun 2022 06:36:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381645AbiFQKgx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jun 2022 06:36:53 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A652A6AA6A
        for <linux-media@vger.kernel.org>; Fri, 17 Jun 2022 03:36:52 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id x5so5645969edi.2
        for <linux-media@vger.kernel.org>; Fri, 17 Jun 2022 03:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OWXOrfm/9NlVmpLfpsXcZqYVwwJxQb+7BpdjaEQ5k6g=;
        b=VqpmmgwB9gpg08sRLNNq2XcQRtywaBLgHK4xMwR5pdGmiUfO8h1ZjX81chGhBPMRRh
         s9oMNg02+R4kYGfMALJvOdjWx3sdjoK/HlijaShqMOoWkLPFQwhRZPyXLEgU1+Y7hFs+
         I2jvD46HvfucBjlrObdmcagqCZgqpbTYFytOk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OWXOrfm/9NlVmpLfpsXcZqYVwwJxQb+7BpdjaEQ5k6g=;
        b=RwMZmNgUph+0bBeGP1ssObjaEWUVNRNwc0s2gaA0mo6Iz+GGxTW0uB+fFl85jF++JI
         p79T26HZAWhkF9iwWyaIdy3AknCnkHXnc1BnDBBkNCFGcm58f5T0Q02tNaB57B22mjQl
         aoT9WXDu1xzZtw0j1Ql9m5K6oadYmHlKyLJ3hDK5uQF73Oopo3XtWotkFwqWbKeVC4uH
         j0DN9mikIx2LE73knm/76HP5A04c3NdCfUBLG4wt8ceUAxdUn/JVDfQRmx0Q+cN8xWBR
         ZfAbRBcvcUzBsm7cwl3Yr42I0YY7Mg4aF84RKcuDJk9oWZFWPx9Ssz+2BVwTP+3+gSPP
         ZKNw==
X-Gm-Message-State: AJIora885obmYGXEFMjLF2rhAcfh94KUEzAed8w3tjtZNW/uT20WrOHZ
        5OhtvPXjYFyTSEBqRLYeWu83rw==
X-Google-Smtp-Source: AGRyM1ugty0Nho2bar2Wp/1XABcrz9d35ycrmhM+jIzMUJOtoI7y+V1R+HFR5gBIoKBCL7NGVMSBYQ==
X-Received: by 2002:a05:6402:274a:b0:42d:dcd1:c847 with SMTP id z10-20020a056402274a00b0042ddcd1c847mr11590035edd.169.1655462211289;
        Fri, 17 Jun 2022 03:36:51 -0700 (PDT)
Received: from alco.corp.google.com ([2620:0:1059:10:a86e:90:fb4:466e])
        by smtp.gmail.com with ESMTPSA id z19-20020a056402275300b004319b12371asm3704340edd.47.2022.06.17.03.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 03:36:50 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org, senozhatsky@chromium.org, yunkec@google.com
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v7 1/8] media: uvcvideo: Add missing value for power_line_frequency
Date:   Fri, 17 Jun 2022 12:36:38 +0200
Message-Id: <20220617103645.71560-2-ribalda@chromium.org>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
In-Reply-To: <20220617103645.71560-1-ribalda@chromium.org>
References: <20220617103645.71560-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

UVC 1.5 class defines 4 values for this control on:
4.2.2.3.6 Power Line Frequency Control

Add the missing value when the UVC version is 1.5.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
2.36.1.476.g0c4daa206d-goog

