Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B9F177F113
	for <lists+linux-media@lfdr.de>; Thu, 17 Aug 2023 09:19:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348443AbjHQHTA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Aug 2023 03:19:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348435AbjHQHSg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Aug 2023 03:18:36 -0400
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5352AFE
        for <linux-media@vger.kernel.org>; Thu, 17 Aug 2023 00:18:35 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-58c8cbf0a0dso12518607b3.1
        for <linux-media@vger.kernel.org>; Thu, 17 Aug 2023 00:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692256714; x=1692861514;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rTRnIjidXZzOxggLvx5ufdrKSrxIHUdBeL28jk8Jg3Y=;
        b=XTGGTrCkNTwuZOtjZGxycpD47GUEIug+IQVTHcHllyf1aJOQ7+/tFdij2TVedxVI56
         hNYjGP6MdIPopypoocO21Ok1pdpBCpNSdpzhSsHaB31wE85kUc/tcZoo6hfi6mOmqDL0
         myU+kia0SSy6x/SXqYyl2UnULgzp1yrTSyzLeEsWzkRaggXo9CP4DianFfSqKjCIXGN2
         luLwcTvpPj8NU8/NmiCL0yn1FfkYuZfJIa/oRxt4zrY/UWdmcWSHAsmxoJZoAW7rZHhz
         JjsZciK9L3S/Tbz3/HWGMYo2f/Y3btOxiYWsLyE8Tg9pvNP50tqai5BKHGYlxzTMYGV5
         YS0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692256714; x=1692861514;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rTRnIjidXZzOxggLvx5ufdrKSrxIHUdBeL28jk8Jg3Y=;
        b=a7pcGbz3DsYUveMEg8gwzrDMu16AMLWGMSZ/Q1qvGLSj9nXC0SIt0uNyoTm1nQzvuA
         QMAH5Mr2Kydp90nPjT0nUoMHYwH5PwoknAvcKBOSNrkPVgvOWm6mCEGvSmw+wXWq8pZF
         Cz55LvzPSj+mnsrrNswDL2+8BrMCiqmCzIof5EoTAnS0p2hT9PHii4jicHPmorcS0lL6
         eywFKyLFB6888q1p/er1tYyQxXvIK6vmwXntr5LqhtwaoYqxY6afl2KxEzlIS2YZeHhT
         +Rfr8tab9mz+oxBbYHpQMo1DTK5YXFxWKScbdRSf5OYeTJLDtgq/wNieQfujs74bOtfA
         7rVg==
X-Gm-Message-State: AOJu0YwXSOMHoynmgDhDOPTokhGvASzxVmZEyo5a/ac9bnmbo/iQE5Q3
        81OFhoOOF9vbC37lbrQa+O3DHGQkCL4=
X-Google-Smtp-Source: AGHT+IHe3Jk1ca9EFUqajeso1bYfCszksn6VWMetyhdYY5c7VUOzSI1XaPx0cWZ9nt7DVl/uLJfeOOaIW/0=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:cb5f:f997:f2a2:88c6])
 (user=yunkec job=sendgmr) by 2002:a05:690c:2f08:b0:589:a533:405b with SMTP id
 ev8-20020a05690c2f0800b00589a533405bmr26951ywb.3.1692256714627; Thu, 17 Aug
 2023 00:18:34 -0700 (PDT)
Date:   Thu, 17 Aug 2023 16:17:35 +0900
In-Reply-To: <20230817071750.2830271-1-yunkec@google.com>
Mime-Version: 1.0
References: <20230817071750.2830271-1-yunkec@google.com>
X-Mailer: git-send-email 2.41.0.694.ge786442a9b-goog
Message-ID: <20230817071750.2830271-8-yunkec@google.com>
Subject: [PATCH v12 07/11] media: vivid: Add an rectangle control
From:   Yunke Cao <yunkec@google.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org, Yunke Cao <yunkec@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This control represents a generic read/write rectangle.
It supports V4L2_CTRL_WHICH_MIN/MAX_VAL.
---
 .../media/test-drivers/vivid/vivid-ctrls.c    | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/media/test-drivers/vivid/vivid-ctrls.c b/drivers/media/test-drivers/vivid/vivid-ctrls.c
index f2b20e25a7a4..27a1173c7734 100644
--- a/drivers/media/test-drivers/vivid/vivid-ctrls.c
+++ b/drivers/media/test-drivers/vivid/vivid-ctrls.c
@@ -38,6 +38,7 @@
 #define VIVID_CID_U8_PIXEL_ARRAY	(VIVID_CID_CUSTOM_BASE + 14)
 #define VIVID_CID_S32_ARRAY		(VIVID_CID_CUSTOM_BASE + 15)
 #define VIVID_CID_S64_ARRAY		(VIVID_CID_CUSTOM_BASE + 16)
+#define VIVID_CID_RECT			(VIVID_CID_CUSTOM_BASE + 17)
 
 #define VIVID_CID_VIVID_BASE		(0x00f00000 | 0xf000)
 #define VIVID_CID_VIVID_CLASS		(0x00f00000 | 1)
@@ -357,6 +358,38 @@ static const struct v4l2_ctrl_config vivid_ctrl_ro_int32 = {
 	.step = 1,
 };
 
+static const struct v4l2_rect rect_def = {
+	.top = 100,
+	.left = 200,
+	.width = 300,
+	.height = 400,
+};
+
+static const struct v4l2_rect rect_min = {
+	.top = 0,
+	.left = 0,
+	.width = 1,
+	.height = 1,
+};
+
+static const struct v4l2_rect rect_max = {
+	.top = 0,
+	.left = 0,
+	.width = 1000,
+	.height = 2000,
+};
+
+static const struct v4l2_ctrl_config vivid_ctrl_rect = {
+	.ops = &vivid_user_gen_ctrl_ops,
+	.id = VIVID_CID_RECT,
+	.name = "Rect",
+	.type = V4L2_CTRL_TYPE_RECT,
+	.flags = V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX,
+	.p_def.p_const = &rect_def,
+	.p_min.p_const = &rect_min,
+	.p_max.p_const = &rect_max,
+};
+
 /* Framebuffer Controls */
 
 static int vivid_fb_s_ctrl(struct v4l2_ctrl *ctrl)
@@ -1677,6 +1710,7 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
 	dev->int_menu = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_int_menu, NULL);
 	dev->ro_int32 = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_ro_int32, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_area, NULL);
+	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_rect, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u32_array, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u32_dyn_array, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u16_matrix, NULL);
-- 
2.41.0.694.ge786442a9b-goog

