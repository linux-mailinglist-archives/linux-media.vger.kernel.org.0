Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 739A43A2A62
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 13:36:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230454AbhFJLiW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 07:38:22 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:54541 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230445AbhFJLiT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 07:38:19 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id rIytl7kZmhqltrIz0lXjSd; Thu, 10 Jun 2021 13:36:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1623324982; bh=nt6/rlvoce2bs6rZFQsnraLSutdQvSgUSKhsY4/5Bbg=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=YmTGkg0xIiUiRELEtjjlARKg0hml8W9v885YqTrghZWvY7Z5MHFgFHQkuUJzYwiOR
         cmjdOOOoEetVK7a1YRmZPtohZgIQEKqofRSQkCw06++tZVu6j+e1Jyxc87kHJckz3A
         QVaS2mx0Pq+7ajW3iR1qa/BhdcScFp6X4HERGMhkL/R4F2s5Dp/1LP5jqNqFMXPJl2
         bY14av9Qf2VPlc35WxaowqGcZB/vy3d/T+RVv4LKdjvWav+NQKmupmuDBz1TZCm0jn
         GlAv7jVvgqkRq9RcI77B4OOgfsyq+iqC2uQulepAeMJOPaQBtgNmY/cVK5zfMuIg3n
         lBBBDwBNCoEGw==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        John Cox <jc@kynesim.co.uk>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [RFC PATCHv2 03/11] vivid: add dynamic array test control
Date:   Thu, 10 Jun 2021 13:36:07 +0200
Message-Id: <20210610113615.785359-4-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210610113615.785359-1-hverkuil-cisco@xs4all.nl>
References: <20210610113615.785359-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfL67mIwxSRhD34VSJodCH9A3alac2VdiNzpBW7MemM9D+r2a4vZHE7vLYSbKG/UrxtW4XaRiiG2sl7y64uIrRz7etzcmbatOpE99gMZFnwoR9IcvGuB8
 aOxK/k5nSXDuuBtdUmHHliqGFKPLK4aSaQGbFLU46X3CFa7veoXGlpstC0NCdFRYjNQez+XNAJPJdI30pnHL2S3d7Vt+TJz0q00cNUT0s8u7ZjbsRi45AVV8
 bOWVmpFy9nRl4al5RzoyEGwgnuoSKodABh93te/GMfGAIoqO6jrYImOGO4jkPRhdgPdm7OeVK3O6XCKbK1ZpQI2UtKQI7jm1Bt/L/RysoB2syQm/YFoWLCP+
 HcCDYnexFsFNGtv0DTUa9UMiZ3xUJyD53UJjA/uv5JUO1rC+x3OB7XtOqVHWrnKQqylaQzrZ
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a dynamic array test control to help test support for this
feature.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/test-drivers/vivid/vivid-ctrls.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/media/test-drivers/vivid/vivid-ctrls.c b/drivers/media/test-drivers/vivid/vivid-ctrls.c
index 8dc50fe22972..e9272eab1451 100644
--- a/drivers/media/test-drivers/vivid/vivid-ctrls.c
+++ b/drivers/media/test-drivers/vivid/vivid-ctrls.c
@@ -34,6 +34,7 @@
 #define VIVID_CID_U8_4D_ARRAY		(VIVID_CID_CUSTOM_BASE + 10)
 #define VIVID_CID_AREA			(VIVID_CID_CUSTOM_BASE + 11)
 #define VIVID_CID_RO_INTEGER		(VIVID_CID_CUSTOM_BASE + 12)
+#define VIVID_CID_U32_DYN_ARRAY		(VIVID_CID_CUSTOM_BASE + 13)
 
 #define VIVID_CID_VIVID_BASE		(0x00f00000 | 0xf000)
 #define VIVID_CID_VIVID_CLASS		(0x00f00000 | 1)
@@ -189,6 +190,19 @@ static const struct v4l2_ctrl_config vivid_ctrl_u32_array = {
 	.dims = { 1 },
 };
 
+static const struct v4l2_ctrl_config vivid_ctrl_u32_dyn_array = {
+	.ops = &vivid_user_gen_ctrl_ops,
+	.id = VIVID_CID_U32_DYN_ARRAY,
+	.name = "U32 Dynamic Array",
+	.type = V4L2_CTRL_TYPE_U32,
+	.flags = V4L2_CTRL_FLAG_DYNAMIC_ARRAY,
+	.def = 50,
+	.min = 10,
+	.max = 90,
+	.step = 1,
+	.dims = { 100 },
+};
+
 static const struct v4l2_ctrl_config vivid_ctrl_u16_matrix = {
 	.ops = &vivid_user_gen_ctrl_ops,
 	.id = VIVID_CID_U16_MATRIX,
@@ -1616,6 +1630,7 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
 	dev->ro_int32 = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_ro_int32, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_area, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u32_array, NULL);
+	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u32_dyn_array, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u16_matrix, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u8_4d_array, NULL);
 
-- 
2.30.2

