Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7AB8F54F594
	for <lists+linux-media@lfdr.de>; Fri, 17 Jun 2022 12:37:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381847AbiFQKhB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jun 2022 06:37:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381804AbiFQKgz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jun 2022 06:36:55 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C8D46AA7E
        for <linux-media@vger.kernel.org>; Fri, 17 Jun 2022 03:36:54 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id fd6so2876323edb.5
        for <linux-media@vger.kernel.org>; Fri, 17 Jun 2022 03:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WEnoe5l63wIa1jNma1QDgL58B8nnhb1HJqhp7b+Nz/Q=;
        b=fQh7eRXYbacxV0yL0hzxmropfe+B+joaDyx/Oa05t/HHbaMKwwGJDsUAvXJiv2gGu+
         wyjOrYisi7WMSLb+GImWL/2ylIIH6JyM4GrOrghF1hyjZiDleDb177u0oiRVWx7AoRYg
         ahxkBj2zA/z93UWHz0I6KmOB33VquaZtkSXkk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WEnoe5l63wIa1jNma1QDgL58B8nnhb1HJqhp7b+Nz/Q=;
        b=FWeNQIk2pSA5JWrGBYcflTU9JUxn1wDHqoneDrEJgsHo0ZqEVokz7CSN29/LfbKf3B
         dC9r2rHWfpQKuVUXIk9sZ3wDlk7HeYzm27y1JOE0aWPPLtaCDO4FasuIk2skjDBEk+Si
         aUuTTS+n4PheRUzD/0fcuhNMK0F9zWn4w9jYyUjHC1yP8ZgjNv8RWFywKRm9lp1MSXi2
         tptPvJ8B7Ao65PhFLKoVxDKDJ1FOlwKpjcQOcr30j8hJf36T6zWC+9IiCrIf0SGHyXEw
         t4psZ6PdCkx1+RJJWjsG0/U/Zakgzoyvvb/MxONfDyEYD5LSd9MP8un464dDmKbIV5VE
         FNAA==
X-Gm-Message-State: AJIora8KTNDHa7XGhepIK5/65tm8iAelgDghZOIN5p3Xhgjrrx7tx0Sm
        Zmv4BTvQ5dyq365Ma2oSjatrSw==
X-Google-Smtp-Source: AGRyM1thSlqusxo29lNjU+hskFWVRWRmhDl2DnbCA1Ubk1QGFGm2binC3Pbwn6GpBe4bdEDS6NbIgQ==
X-Received: by 2002:a05:6402:1d48:b0:42d:d1a2:7c6d with SMTP id dz8-20020a0564021d4800b0042dd1a27c6dmr11588861edb.43.1655462212604;
        Fri, 17 Jun 2022 03:36:52 -0700 (PDT)
Received: from alco.corp.google.com ([2620:0:1059:10:a86e:90:fb4:466e])
        by smtp.gmail.com with ESMTPSA id z19-20020a056402275300b004319b12371asm3704340edd.47.2022.06.17.03.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 03:36:52 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org, senozhatsky@chromium.org, yunkec@google.com
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v7 2/8] media: uvcvideo: Add support for per-device control mapping overrides
Date:   Fri, 17 Jun 2022 12:36:39 +0200
Message-Id: <20220617103645.71560-3-ribalda@chromium.org>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
In-Reply-To: <20220617103645.71560-1-ribalda@chromium.org>
References: <20220617103645.71560-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Some devices do not implement all their controls in a way that complies
with the UVC specification. This is for instance the case for several
devices that do not support the disabled mode for the power line
frequency control. Add a mechanism to allow per-device control mapping
overrides to avoid errors when accessing non-compliant controls.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 35 ++++++++++++++++++++++++++------
 drivers/media/usb/uvc/uvcvideo.h |  1 +
 2 files changed, 30 insertions(+), 6 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index a709ebbb4d69..092decfdaa62 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -2403,9 +2403,8 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
 {
 	const struct uvc_control_info *info = uvc_ctrls;
 	const struct uvc_control_info *iend = info + ARRAY_SIZE(uvc_ctrls);
-	const struct uvc_control_mapping *mapping = uvc_ctrl_mappings;
-	const struct uvc_control_mapping *mend =
-		mapping + ARRAY_SIZE(uvc_ctrl_mappings);
+	const struct uvc_control_mapping *mapping;
+	const struct uvc_control_mapping *mend;
 
 	/* XU controls initialization requires querying the device for control
 	 * information. As some buggy UVC devices will crash when queried
@@ -2433,14 +2432,38 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
 	if (!ctrl->initialized)
 		return;
 
-	/* Process common mappings first. */
-	for (; mapping < mend; ++mapping) {
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
+	mend = mapping + ARRAY_SIZE(uvc_ctrl_mappings);
+	for (mapping = uvc_ctrl_mappings; mapping < mend; ++mapping) {
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
2.36.1.476.g0c4daa206d-goog

