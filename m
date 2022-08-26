Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 923505A2907
	for <lists+linux-media@lfdr.de>; Fri, 26 Aug 2022 16:04:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344420AbiHZODi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Aug 2022 10:03:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235677AbiHZODg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Aug 2022 10:03:36 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF132C0B4A
        for <linux-media@vger.kernel.org>; Fri, 26 Aug 2022 07:03:34 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7E88C61DAB
        for <linux-media@vger.kernel.org>; Fri, 26 Aug 2022 14:03:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75E67C433D6;
        Fri, 26 Aug 2022 14:03:33 +0000 (UTC)
Message-ID: <6c02f890-84e7-a39c-9365-7c5fdc1fef5a@xs4all.nl>
Date:   Fri, 26 Aug 2022 16:03:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Content-Language: en-US
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] media: v4l2-ctrls-core.c: fix incorrect init if from_idx > 0
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The v4l2_ctrl_type_op_init mixed up the meaning of the 'elems' argument:
in a for-loop it was the total number of elements, but in memset it
was the number of elements to be cleared. This is the same as long as
from_idx == 0, but when it is non-0, then it will cause a memory overrun
in the memset case.

Rename the 'elems' argument to 'tot_elems' and use that in the for loops.
Add a new 'elems' variable that is the number of elements to clear. Since
that's what memset expects, no changes are needed there.

Also add a check to see if there is anything to initialize at all, and
just return if there is nothing to be done.

Fixes: b19b54e9ccd8 (media: v4l2-ctrls: optimize type_ops for arrays)
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index 5d1a89884b28..01f00093f259 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -178,13 +178,17 @@ static void std_init_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 }
 
 void v4l2_ctrl_type_op_init(const struct v4l2_ctrl *ctrl, u32 from_idx,
-			    u32 elems, union v4l2_ctrl_ptr ptr)
+			    u32 tot_elems, union v4l2_ctrl_ptr ptr)
 {
 	unsigned int i;
+	u32 elems = tot_elems - from_idx;
+
+	if (from_idx >= tot_elems)
+		return;
 
 	switch (ctrl->type) {
 	case V4L2_CTRL_TYPE_STRING:
-		for (i = from_idx; i < elems; i++) {
+		for (i = from_idx; i < tot_elems; i++) {
 			unsigned int offset = i * ctrl->elem_size;
 
 			memset(ptr.p_char + offset, ' ', ctrl->minimum);
@@ -193,7 +197,7 @@ void v4l2_ctrl_type_op_init(const struct v4l2_ctrl *ctrl, u32 from_idx,
 		break;
 	case V4L2_CTRL_TYPE_INTEGER64:
 		if (ctrl->default_value) {
-			for (i = from_idx; i < elems; i++)
+			for (i = from_idx; i < tot_elems; i++)
 				ptr.p_s64[i] = ctrl->default_value;
 		} else {
 			memset(ptr.p_s64 + from_idx, 0, elems * sizeof(s64));
@@ -205,7 +209,7 @@ void v4l2_ctrl_type_op_init(const struct v4l2_ctrl *ctrl, u32 from_idx,
 	case V4L2_CTRL_TYPE_BITMASK:
 	case V4L2_CTRL_TYPE_BOOLEAN:
 		if (ctrl->default_value) {
-			for (i = from_idx; i < elems; i++)
+			for (i = from_idx; i < tot_elems; i++)
 				ptr.p_s32[i] = ctrl->default_value;
 		} else {
 			memset(ptr.p_s32 + from_idx, 0, elems * sizeof(s32));
@@ -220,7 +224,7 @@ void v4l2_ctrl_type_op_init(const struct v4l2_ctrl *ctrl, u32 from_idx,
 		break;
 	case V4L2_CTRL_TYPE_U16:
 		if (ctrl->default_value) {
-			for (i = from_idx; i < elems; i++)
+			for (i = from_idx; i < tot_elems; i++)
 				ptr.p_u16[i] = ctrl->default_value;
 		} else {
 			memset(ptr.p_u16 + from_idx, 0, elems * sizeof(u16));
@@ -228,14 +232,14 @@ void v4l2_ctrl_type_op_init(const struct v4l2_ctrl *ctrl, u32 from_idx,
 		break;
 	case V4L2_CTRL_TYPE_U32:
 		if (ctrl->default_value) {
-			for (i = from_idx; i < elems; i++)
+			for (i = from_idx; i < tot_elems; i++)
 				ptr.p_u32[i] = ctrl->default_value;
 		} else {
 			memset(ptr.p_u32 + from_idx, 0, elems * sizeof(u32));
 		}
 		break;
 	default:
-		for (i = from_idx; i < elems; i++)
+		for (i = from_idx; i < tot_elems; i++)
 			std_init_compound(ctrl, i, ptr);
 		break;
 	}
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index b2acb64d55aa..b76a0714d425 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -131,7 +131,7 @@ struct v4l2_ctrl_type_ops {
 	bool (*equal)(const struct v4l2_ctrl *ctrl, u32 elems,
 		      union v4l2_ctrl_ptr ptr1,
 		      union v4l2_ctrl_ptr ptr2);
-	void (*init)(const struct v4l2_ctrl *ctrl, u32 from_idx, u32 elems,
+	void (*init)(const struct v4l2_ctrl *ctrl, u32 from_idx, u32 tot_elems,
 		     union v4l2_ctrl_ptr ptr);
 	void (*log)(const struct v4l2_ctrl *ctrl);
 	int (*validate)(const struct v4l2_ctrl *ctrl, u32 elems,
