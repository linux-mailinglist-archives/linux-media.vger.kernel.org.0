Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A995C7BF0CD
	for <lists+linux-media@lfdr.de>; Tue, 10 Oct 2023 04:22:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1441874AbjJJCWV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Oct 2023 22:22:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1441858AbjJJCWU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Oct 2023 22:22:20 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D431AC
        for <linux-media@vger.kernel.org>; Mon,  9 Oct 2023 19:22:19 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-d9a3942461aso1238381276.2
        for <linux-media@vger.kernel.org>; Mon, 09 Oct 2023 19:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696904538; x=1697509338; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BXmOiZc6/F3SrKmz3fzk+VtI2xRK7l1Yq3byerEozcM=;
        b=SFvsWPM9sK+nq2273C7Bhk48ma3e2zKj6N2IA+MOZdhAe3Pqi1eTl7pSvDdJABhnvE
         9jr5sOqsJ+p/0sJib0ftyuh1Owa7EH0TlCh2AnqsXA06aWKbgmbipcbDW74Lerdbm72Z
         MRtAowAu1xi6CvSlHs31/4jyDtCU82W7RtBKGvZZDvsSi+ZvdVPN9RF6btQKnVvMVPga
         mmBNPmcPR7P2lOeRH5SW5PrngkdaIwXu511snocbvwPPsED/B5flavNoO2y2xGNrrzCU
         LV88fAs3H97QmKg8dRvgUQzfeHR7d73HdtoDS5uOa3/2WxxUisf2+IZVSGPwxiuaETvZ
         Y2VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696904538; x=1697509338;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BXmOiZc6/F3SrKmz3fzk+VtI2xRK7l1Yq3byerEozcM=;
        b=Couw1pMEkElggDB6gNwCBE0xzZJ7s/RM3ohLNepBwGcHYFgkDjwh/MQkjhLVBzn7fn
         jbAM+M/Jv34FJqwY1+tDKWkYe/dYx2gnvYWkKTTlFCu6ddCDwX+dKnEDUPcUrr++QRP1
         nT4GoJ3zPiPRF1GifCev72fy7L9VANX1oSFHtti95vO1LWklJdr69aw/S99Gd+9llhgD
         gzgdpAkURgWyIStsKxKhVb4tnInY7R7a5oZhq2PNJRY3rOGBUJF3ZXIFR9JfZSG4lGyT
         OIJSeaJKYUydFKBHru8VaV36YFYzi1+1vsXE/IW+D8/+T2xehaUD4JQOv3F9gUD77eEa
         VoQA==
X-Gm-Message-State: AOJu0YzuwWt+r9FQWBa4glSE+ZzL5rQQT9lcnBzmzljIMB2wb4GVbKoa
        A+VcPmz9hfewEIuk9GXa5EMzpa23eCQ=
X-Google-Smtp-Source: AGHT+IFxb1XhzJjqvppb7Ml+IBfm28JtviA/mID6CzJaDYUVL8z8aiOjW/G3XixjQSP3OF7NbwIYnzUF+Mw=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:7303:2d54:5b83:e60b])
 (user=yunkec job=sendgmr) by 2002:a25:4f55:0:b0:d0c:c83b:94ed with SMTP id
 d82-20020a254f55000000b00d0cc83b94edmr233836ybb.10.1696904538316; Mon, 09 Oct
 2023 19:22:18 -0700 (PDT)
Date:   Tue, 10 Oct 2023 11:21:30 +0900
In-Reply-To: <20231010022136.1504015-1-yunkec@google.com>
Mime-Version: 1.0
References: <20231010022136.1504015-1-yunkec@google.com>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
Message-ID: <20231010022136.1504015-8-yunkec@google.com>
Subject: [PATCH v13 07/11] media: vivid: Add an rectangle control
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
2.42.0.609.gbb76f46606-goog

