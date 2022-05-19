Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2D1A52D80E
	for <lists+linux-media@lfdr.de>; Thu, 19 May 2022 17:43:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241234AbiESPnG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 May 2022 11:43:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241278AbiESPlZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 May 2022 11:41:25 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 170FC15A16
        for <linux-media@vger.kernel.org>; Thu, 19 May 2022 08:41:22 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id j4so3058649edq.6
        for <linux-media@vger.kernel.org>; Thu, 19 May 2022 08:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wlb2Hq57cQCaH90i8eGoJb/hICvEaLc50mIgKW3RSts=;
        b=XsB3rzoGpy+j1lxV4G47cVbNuJJJ1GvzpvGh1Oul38LRrWG6oP7Q3YOrEyvSZ0oztI
         +JutTDhWWOU8KA/gF9hus+5wh9yVfjzFrWBUConTgvUDGrawqZ0FUSc7tml2ftQwEON+
         l1R8xIie3/lAhkuW9hszpDc396BP9JnBYpHms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wlb2Hq57cQCaH90i8eGoJb/hICvEaLc50mIgKW3RSts=;
        b=oIIAv2tl5qFiCb6TbBrNX10osuwVQC4xugq0rhWlDX9iK5r7/en6F6VdDHiFmE7+dc
         uyajrfNg47siHz/as5+vNb0pUIms/hj2Js1hyRbVq7XNDlfCkQmnfMfWa5PiCxwkhDK0
         GUgX3oG2fG4MYyT4n0C1zbJu7ISgrbjWLQm5zR0XoLxjaLrdwHWMwWkMdEFb1dwCtp1Q
         NUTCmvsMVuyW7BH0iEiFwkvyFbBSBRY2SJ6mt1H4D2MLB2TEuAOfTG8XjyyKVqZu+6JT
         8nCL2ZrpQ4c6DIZPKu6afLnB6P/Yu5cfPkk2f80xoTJtEs0F/aqIcvcqWOaITEYjHJi0
         8OFA==
X-Gm-Message-State: AOAM5316otph2uYuEtC/1nV/1NZwc7Er6oI+6m7dGm39Z3toCQl2IE3u
        vF1i8YII2hvVSvLReCZwVcKtyg==
X-Google-Smtp-Source: ABdhPJzV6rBThmyy00Wwrwwt777AW6j/O4D+nISxdC0vcNuisvDN/SR9Y7tWFHjmBf6bbmGdDjXptg==
X-Received: by 2002:aa7:d817:0:b0:42a:fc10:7f89 with SMTP id v23-20020aa7d817000000b0042afc107f89mr4151537edq.417.1652974880708;
        Thu, 19 May 2022 08:41:20 -0700 (PDT)
Received: from alco.corp.google.com ([100.104.168.197])
        by smtp.gmail.com with ESMTPSA id k24-20020a056402049800b0042aae307407sm2990092edv.21.2022.05.19.08.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 May 2022 08:41:20 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Yunke Cao <yunkec@google.com>
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 2/4] media: uvcvideo: Add UVC_QUIRK_LIMITED_POWERLINE
Date:   Thu, 19 May 2022 17:40:57 +0200
Message-Id: <20220519154100.333091-3-ribalda@chromium.org>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
In-Reply-To: <20220519154100.333091-1-ribalda@chromium.org>
References: <20220519154100.333091-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a quirk for devices that only support a limited set of Power Line
frequencies.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 27 +++++++++++++++++++++++++++
 drivers/media/usb/uvc/uvcvideo.h |  1 +
 2 files changed, 28 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 13cad4aa7573..ffa103789ef9 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -369,6 +369,11 @@ static const struct uvc_menu_info power_line_frequency_controls[] = {
 	{ 3, "Auto" },
 };
 
+static const struct uvc_menu_info power_line_frequency_controls_limited[] = {
+	{ 1, "50 Hz" },
+	{ 2, "60 Hz" },
+};
+
 static const struct uvc_menu_info exposure_auto_controls[] = {
 	{ 2, "Auto Mode" },
 	{ 1, "Manual Mode" },
@@ -731,6 +736,19 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 	},
 };
 
+static const
+struct uvc_control_mapping power_line_mapping_limited = {
+	.id		= V4L2_CID_POWER_LINE_FREQUENCY,
+	.entity		= UVC_GUID_UVC_PROCESSING,
+	.selector	= UVC_PU_POWER_LINE_FREQUENCY_CONTROL,
+	.size		= 2,
+	.offset		= 0,
+	.v4l2_type	= V4L2_CTRL_TYPE_MENU,
+	.data_type	= UVC_CTRL_DATA_TYPE_ENUM,
+	.menu_info	= power_line_frequency_controls_limited,
+	.menu_count	= ARRAY_SIZE(power_line_frequency_controls_limited),
+};
+
 /* ------------------------------------------------------------------------
  * Utility functions
  */
@@ -2406,6 +2424,15 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
 	if (!ctrl->initialized)
 		return;
 
+	if (chain->dev->quirks & UVC_QUIRK_LIMITED_POWERLINE &&
+	    ctrl->info.selector == power_line_mapping_limited.selector &&
+	    uvc_entity_match_guid(ctrl->entity,
+				  power_line_mapping_limited.entity)) {
+		__uvc_ctrl_add_mapping(chain, ctrl,
+				       &power_line_mapping_limited);
+		return;
+	}
+
 	for (; mapping < mend; ++mapping) {
 		if (uvc_entity_match_guid(ctrl->entity, mapping->entity) &&
 		    ctrl->info.selector == mapping->selector)
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 143230b3275b..06779eb4f5fa 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -209,6 +209,7 @@
 #define UVC_QUIRK_RESTORE_CTRLS_ON_INIT	0x00000400
 #define UVC_QUIRK_FORCE_Y8		0x00000800
 #define UVC_QUIRK_FORCE_BPP		0x00001000
+#define UVC_QUIRK_LIMITED_POWERLINE     0x00002000
 
 /* Format flags */
 #define UVC_FMT_FLAG_COMPRESSED		0x00000001
-- 
2.36.1.124.g0e6072fb45-goog

