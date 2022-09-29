Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A59565EF19F
	for <lists+linux-media@lfdr.de>; Thu, 29 Sep 2022 11:16:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231949AbiI2JP3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Sep 2022 05:15:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235115AbiI2JPY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Sep 2022 05:15:24 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FAA87AC2F
        for <linux-media@vger.kernel.org>; Thu, 29 Sep 2022 02:15:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0295560B79
        for <linux-media@vger.kernel.org>; Thu, 29 Sep 2022 09:15:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5763C433C1;
        Thu, 29 Sep 2022 09:15:21 +0000 (UTC)
Message-ID: <96d36ae8-148b-04c0-df73-5ca0f1f1b043@xs4all.nl>
Date:   Thu, 29 Sep 2022 11:15:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Content-Language: en-US
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Cc:     Daniel Gomez <daniel@qtec.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] vivid: add INTEGER and INTEGER64 test control arrays
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add INTEGER and INTEGER64 control arrays to test support for such controls.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/test-drivers/vivid/vivid-ctrls.c b/drivers/media/test-drivers/vivid/vivid-ctrls.c
index 92b1a7598470..5337ae679e8f 100644
--- a/drivers/media/test-drivers/vivid/vivid-ctrls.c
+++ b/drivers/media/test-drivers/vivid/vivid-ctrls.c
@@ -36,6 +36,8 @@
 #define VIVID_CID_RO_INTEGER		(VIVID_CID_CUSTOM_BASE + 12)
 #define VIVID_CID_U32_DYN_ARRAY		(VIVID_CID_CUSTOM_BASE + 13)
 #define VIVID_CID_U8_PIXEL_ARRAY	(VIVID_CID_CUSTOM_BASE + 14)
+#define VIVID_CID_S32_ARRAY		(VIVID_CID_CUSTOM_BASE + 15)
+#define VIVID_CID_S64_ARRAY		(VIVID_CID_CUSTOM_BASE + 16)
 
 #define VIVID_CID_VIVID_BASE		(0x00f00000 | 0xf000)
 #define VIVID_CID_VIVID_CLASS		(0x00f00000 | 1)
@@ -241,6 +243,30 @@ static const struct v4l2_ctrl_config vivid_ctrl_u8_pixel_array = {
 	.dims = { 640 / PIXEL_ARRAY_DIV, 360 / PIXEL_ARRAY_DIV },
 };
 
+static const struct v4l2_ctrl_config vivid_ctrl_s32_array = {
+	.ops = &vivid_user_gen_ctrl_ops,
+	.id = VIVID_CID_S32_ARRAY,
+	.name = "S32 2 Element Array",
+	.type = V4L2_CTRL_TYPE_INTEGER,
+	.def = 2,
+	.min = -10,
+	.max = 10,
+	.step = 1,
+	.dims = { 2 },
+};
+
+static const struct v4l2_ctrl_config vivid_ctrl_s64_array = {
+	.ops = &vivid_user_gen_ctrl_ops,
+	.id = VIVID_CID_S64_ARRAY,
+	.name = "S64 5 Element Array",
+	.type = V4L2_CTRL_TYPE_INTEGER64,
+	.def = 4,
+	.min = -10,
+	.max = 10,
+	.step = 1,
+	.dims = { 5 },
+};
+
 static const char * const vivid_ctrl_menu_strings[] = {
 	"Menu Item 0 (Skipped)",
 	"Menu Item 1",
@@ -1656,6 +1682,8 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u16_matrix, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u8_4d_array, NULL);
 	dev->pixel_array = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u8_pixel_array, NULL);
+	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_s32_array, NULL);
+	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_s64_array, NULL);
 
 	if (dev->has_vid_cap) {
 		/* Image Processing Controls */
