Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB8694EE1EA
	for <lists+linux-media@lfdr.de>; Thu, 31 Mar 2022 21:39:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240854AbiCaTkE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 31 Mar 2022 15:40:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240849AbiCaTjm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 31 Mar 2022 15:39:42 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C87123D477;
        Thu, 31 Mar 2022 12:37:48 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: nicolas)
        with ESMTPSA id 9836A1F47251
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1648755467;
        bh=es6kMBJ8LPORvT6E2TfIJklYinEGihlPlvjF8xMQCJ0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TA6pAi7lKPceVbWIaTog0bZFid73sxywGren5s6+Ipi3zjAXuKeU6llQVM1RN3On5
         wxSyqnwjG96YXCYcltX8rn/TvazKhwz/G0opT8mlr5J5iZLVjacQZXJCtl6+brHQm4
         mzYH4OVfhtR/tCwekS4OYkF7ISyp2HKObw0QU4hbY3jfQkE7W5XYHxdl5lAFdzcicU
         nzhm0W5/4W/PQ/hgYNvNtrTiZCO55L0QxcA0QW3aiN87bwl44tYx6M7OBI/SsvYPbS
         9Ph6q+2Rc/EeEosf+57vAC/Xx2BNCXjqNojJPoExoK+YNsFq9U0MuXKto4FtgzuFEF
         KQ0UuuSrAX77A==
From:   Nicolas Dufresne <nicolas.dufresne@collabora.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     kernel@collabora.com,
        Sebastian Fricke <sebastian.fricke@collabora.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 08/23] media: h264: Store all fields into the unordered list
Date:   Thu, 31 Mar 2022 15:37:10 -0400
Message-Id: <20220331193726.289559-9-nicolas.dufresne@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220331193726.289559-1-nicolas.dufresne@collabora.com>
References: <20220331193726.289559-1-nicolas.dufresne@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When the current picture is a field, store each field into the
unordered_list and preserve both top and bottom picture order
count.

Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Reviewed-by: Sebastian Fricke <sebastian.fricke@collabora.com>
---
 drivers/media/v4l2-core/v4l2-h264.c | 65 +++++++++++++++++++++--------
 include/media/v4l2-h264.h           |  6 ++-
 2 files changed, 51 insertions(+), 20 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-h264.c b/drivers/media/v4l2-core/v4l2-h264.c
index 58f18bb0afb6..38d8dbda0045 100644
--- a/drivers/media/v4l2-core/v4l2-h264.c
+++ b/drivers/media/v4l2-core/v4l2-h264.c
@@ -47,8 +47,6 @@ v4l2_h264_init_reflist_builder(struct v4l2_h264_reflist_builder *b,
 	}
 
 	for (i = 0; i < V4L2_H264_NUM_DPB_ENTRIES; i++) {
-		u32 pic_order_count;
-
 		if (!(dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE))
 			continue;
 
@@ -59,8 +57,6 @@ v4l2_h264_init_reflist_builder(struct v4l2_h264_reflist_builder *b,
 		/*
 		 * Handle frame_num wraparound as described in section
 		 * '8.2.4.1 Decoding process for picture numbers' of the spec.
-		 * TODO: This logic will have to be adjusted when we start
-		 * supporting interlaced content.
 		 * For long term references, frame_num is set to
 		 * long_term_frame_idx which requires no wrapping.
 		 */
@@ -70,17 +66,33 @@ v4l2_h264_init_reflist_builder(struct v4l2_h264_reflist_builder *b,
 		else
 			b->refs[i].frame_num = dpb[i].frame_num;
 
-		if (dpb[i].fields == V4L2_H264_FRAME_REF)
-			pic_order_count = min(dpb[i].top_field_order_cnt,
-					      dpb[i].bottom_field_order_cnt);
-		else if (dpb[i].fields & V4L2_H264_BOTTOM_FIELD_REF)
-			pic_order_count = dpb[i].bottom_field_order_cnt;
-		else
-			pic_order_count = dpb[i].top_field_order_cnt;
+		b->refs[i].top_field_order_cnt = dpb[i].top_field_order_cnt;
+		b->refs[i].bottom_field_order_cnt = dpb[i].bottom_field_order_cnt;
+
+		if (b->cur_pic_fields == V4L2_H264_FRAME_REF) {
+			u8 fields = V4L2_H264_FRAME_REF;
+
+			b->unordered_reflist[b->num_valid].index = i;
+			b->unordered_reflist[b->num_valid].fields = fields;
+			b->num_valid++;
+			continue;
+		}
+
+		if (dpb[i].fields & V4L2_H264_TOP_FIELD_REF) {
+			u8 fields = V4L2_H264_TOP_FIELD_REF;
+
+			b->unordered_reflist[b->num_valid].index = i;
+			b->unordered_reflist[b->num_valid].fields = fields;
+			b->num_valid++;
+		}
 
-		b->refs[i].pic_order_count = pic_order_count;
-		b->unordered_reflist[b->num_valid].index = i;
-		b->num_valid++;
+		if (dpb[i].fields & V4L2_H264_BOTTOM_FIELD_REF) {
+			u8 fields = V4L2_H264_BOTTOM_FIELD_REF;
+
+			b->unordered_reflist[b->num_valid].index = i;
+			b->unordered_reflist[b->num_valid].fields = fields;
+			b->num_valid++;
+		}
 	}
 
 	for (i = b->num_valid; i < ARRAY_SIZE(b->unordered_reflist); i++)
@@ -88,6 +100,23 @@ v4l2_h264_init_reflist_builder(struct v4l2_h264_reflist_builder *b,
 }
 EXPORT_SYMBOL_GPL(v4l2_h264_init_reflist_builder);
 
+static s32 v4l2_h264_get_poc(const struct v4l2_h264_reflist_builder *b,
+			     const struct v4l2_h264_reference *ref)
+{
+	switch (ref->fields) {
+	case V4L2_H264_FRAME_REF:
+		return min(b->refs[ref->index].top_field_order_cnt,
+				b->refs[ref->index].bottom_field_order_cnt);
+	case V4L2_H264_TOP_FIELD_REF:
+		return b->refs[ref->index].top_field_order_cnt;
+	case V4L2_H264_BOTTOM_FIELD_REF:
+		return b->refs[ref->index].bottom_field_order_cnt;
+	}
+
+	/* not reached */
+	return 0;
+}
+
 static int v4l2_h264_p_ref_list_cmp(const void *ptra, const void *ptrb,
 				    const void *data)
 {
@@ -150,8 +179,8 @@ static int v4l2_h264_b0_ref_list_cmp(const void *ptra, const void *ptrb,
 		       builder->refs[idxb].pic_num ?
 		       -1 : 1;
 
-	poca = builder->refs[idxa].pic_order_count;
-	pocb = builder->refs[idxb].pic_order_count;
+	poca = v4l2_h264_get_poc(builder, ptra);
+	pocb = v4l2_h264_get_poc(builder, ptrb);
 
 	/*
 	 * Short term pics with POC < cur POC first in POC descending order
@@ -195,8 +224,8 @@ static int v4l2_h264_b1_ref_list_cmp(const void *ptra, const void *ptrb,
 		       builder->refs[idxb].pic_num ?
 		       -1 : 1;
 
-	poca = builder->refs[idxa].pic_order_count;
-	pocb = builder->refs[idxb].pic_order_count;
+	poca = v4l2_h264_get_poc(builder, ptra);
+	pocb = v4l2_h264_get_poc(builder, ptrb);
 
 	/*
 	 * Short term pics with POC > cur POC first in POC ascending order
diff --git a/include/media/v4l2-h264.h b/include/media/v4l2-h264.h
index e165a54c68fa..4cef717b3f18 100644
--- a/include/media/v4l2-h264.h
+++ b/include/media/v4l2-h264.h
@@ -15,7 +15,8 @@
 /**
  * struct v4l2_h264_reflist_builder - Reference list builder object
  *
- * @refs.pic_order_count: reference picture order count
+ * @refs.top_field_order_cnt: top field order count
+ * @refs.bottom_field_order_cnt: bottom field order count
  * @refs.frame_num: reference frame number
  * @refs.pic_num: reference picture number
  * @refs.longterm: set to true for a long term reference
@@ -32,7 +33,8 @@
  */
 struct v4l2_h264_reflist_builder {
 	struct {
-		s32 pic_order_count;
+		s32 top_field_order_cnt;
+		s32 bottom_field_order_cnt;
 		int frame_num;
 		u32 pic_num;
 		u16 longterm : 1;
-- 
2.34.1

