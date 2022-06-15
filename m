Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A98E54CC51
	for <lists+linux-media@lfdr.de>; Wed, 15 Jun 2022 17:14:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343626AbiFOPNP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 11:13:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242520AbiFOPNI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 11:13:08 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F40A1DEC7
        for <linux-media@vger.kernel.org>; Wed, 15 Jun 2022 08:13:03 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id v1so23814857ejg.13
        for <linux-media@vger.kernel.org>; Wed, 15 Jun 2022 08:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OWXOrfm/9NlVmpLfpsXcZqYVwwJxQb+7BpdjaEQ5k6g=;
        b=ILBT80z1mB8y3KmFDHu42InPyMxTsikDuFOoymGYG4+NI6AT9uYgeYqeMiDZwatAn+
         PI6lswksIKinPKFuB8pZ1+l/17POaRw4DP3g+x4ikG+iJKRiofwtME4fB1g5/+Xgqm6J
         EDofovu/rfj3dRCnrKMCL5QlyvEgBDV95n64I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OWXOrfm/9NlVmpLfpsXcZqYVwwJxQb+7BpdjaEQ5k6g=;
        b=tq5bSRNLHqxDIdZOmgC/n+rzDSPE5/oig1vsoPJSWy6XNlI1Z7hPCl5wFnfaAw50P1
         f61ddx7OXJBXAMkb9oRl0Iyti9VFFrgovryL2PbC9e3ZpsaY4CotoEzFsvjkMfbAZh25
         tklB8Jy0zcXTVJ4Gavz9wvwbxMmDqj1hNNQhpggObI9kUcaoYflMU0Sc3hr46cr+rCRK
         Stv5T1byLabibSY4FTCxbb3f6b4u+x3hP5MURF1NfgzaMUQcr/uVfcpo+8fm5cbniN1f
         9snOO0SPT78TNl76JJiPwjJEGXk1j31wXqKa8yhNAXApzuadN1NrKPCOj3SGAuOI2xJR
         ieQw==
X-Gm-Message-State: AJIora+GCxsUELfIikBmscMblXqa5qmgXv1aUHnCe+JTjDhaFRMLXylP
        WlQZjKHCC/zX+F8OunZsgQNlcA==
X-Google-Smtp-Source: AGRyM1vqLSOsRPEcy844ki1yzvDOJaFpB5hdo9SNFjWteElJ8mjE8VRODEQvn9hJSdFfrU56w0Qimw==
X-Received: by 2002:a17:907:6e13:b0:711:c722:4fc with SMTP id sd19-20020a1709076e1300b00711c72204fcmr251107ejc.253.1655305982591;
        Wed, 15 Jun 2022 08:13:02 -0700 (PDT)
Received: from alco.lan (80.71.134.83.ipv4.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id b25-20020aa7cd19000000b0042bd2012196sm9610264edw.85.2022.06.15.08.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 08:13:02 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org, senozhatsky@chromium.org, yunkec@google.com
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v6 1/8] media: uvcvideo: Add missing value for power_line_frequency
Date:   Wed, 15 Jun 2022 17:12:52 +0200
Message-Id: <20220615151259.77825-2-ribalda@chromium.org>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
In-Reply-To: <20220615151259.77825-1-ribalda@chromium.org>
References: <20220615151259.77825-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
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

