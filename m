Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E12B50FE0B
	for <lists+linux-media@lfdr.de>; Tue, 26 Apr 2022 14:59:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350400AbiDZNBi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Apr 2022 09:01:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350334AbiDZNBT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Apr 2022 09:01:19 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7E5517D4A1;
        Tue, 26 Apr 2022 05:58:11 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: nicolas)
        with ESMTPSA id 91AFA1F43982
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1650977890;
        bh=vuftnHCEWwJdNLAqyrxNwOkREV8boF39Sd5EZvT7GwM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dtPFBWG6icCFN7/tfl63OERpTPpFK1cwwNlfKMgDXOOU9TLmeK1S/ki6qAOudgkTV
         vQ2HDDwuRi9QvOTEoVjdKTyyvMlLCTzWETNVUfZB5rozmycH1v6s9SXzgsLJti/+Vd
         AK4+rkEH7j8lmAzHwSOxR0PIN8tPMNKJ25ammNbGrlEOgwO/0nj7vB5jFMqXRPQyLM
         VgeWaOv2r6UjnNc0fMvCugMQWzlhhP1RGoBWRE/4MzM41pieC0mg0DnwNP4Fbb4Znw
         SmfWBxVj7f1jycI4SblMk54J7k8C+qRbZQhhRnlpASecDA42/sGOlYVt4djFaJ9J/L
         5sNqDy13qx5eg==
From:   Nicolas Dufresne <nicolas.dufresne@collabora.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     nicolas@ndufresne.ca, linux-media@vger.kernel.org,
        Sebastian Fricke <sebastian.fricke@collabora.com>,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-staging@lists.linux.dev
Subject: [PATCH v4 06/24] media: h264: Increase reference lists size to 32
Date:   Tue, 26 Apr 2022 08:57:32 -0400
Message-Id: <20220426125751.108293-7-nicolas.dufresne@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426125751.108293-1-nicolas.dufresne@collabora.com>
References: <20220426125751.108293-1-nicolas.dufresne@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is to accommodate support for field decoding, which splits the top
and the bottom references into the reference list.

Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Reviewed-by: Sebastian Fricke <sebastian.fricke@collabora.com>
Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 drivers/media/v4l2-core/v4l2-h264.c        | 6 +++---
 drivers/staging/media/hantro/hantro_hw.h   | 6 +++---
 drivers/staging/media/rkvdec/rkvdec-h264.c | 6 +++---
 include/media/v4l2-h264.h                  | 8 ++++----
 4 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-h264.c b/drivers/media/v4l2-core/v4l2-h264.c
index afbfcf78efe4..4b46b36526c0 100644
--- a/drivers/media/v4l2-core/v4l2-h264.c
+++ b/drivers/media/v4l2-core/v4l2-h264.c
@@ -212,7 +212,7 @@ static int v4l2_h264_b1_ref_list_cmp(const void *ptra, const void *ptrb,
  * v4l2_h264_build_p_ref_list() - Build the P reference list
  *
  * @builder: reference list builder context
- * @reflist: 16 sized array used to store the P reference list. Each entry
+ * @reflist: 32 sized array used to store the P reference list. Each entry
  *	     is a v4l2_h264_reference structure
  *
  * This functions builds the P reference lists. This procedure is describe in
@@ -235,9 +235,9 @@ EXPORT_SYMBOL_GPL(v4l2_h264_build_p_ref_list);
  * v4l2_h264_build_b_ref_lists() - Build the B0/B1 reference lists
  *
  * @builder: reference list builder context
- * @b0_reflist: 16 sized array used to store the B0 reference list. Each entry
+ * @b0_reflist: 32 sized array used to store the B0 reference list. Each entry
  *		is a v4l2_h264_reference structure
- * @b1_reflist: 16 sized array used to store the B1 reference list. Each entry
+ * @b1_reflist: 32 sized array used to store the B1 reference list. Each entry
  *		is a v4l2_h264_reference structure
  *
  * This functions builds the B0/B1 reference lists. This procedure is described
diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
index 2bc6b8f088f5..292aaaabaf24 100644
--- a/drivers/staging/media/hantro/hantro_hw.h
+++ b/drivers/staging/media/hantro/hantro_hw.h
@@ -69,9 +69,9 @@ struct hantro_h264_dec_ctrls {
  * @b1:		B1 reflist
  */
 struct hantro_h264_dec_reflists {
-	struct v4l2_h264_reference p[HANTRO_H264_DPB_SIZE];
-	struct v4l2_h264_reference b0[HANTRO_H264_DPB_SIZE];
-	struct v4l2_h264_reference b1[HANTRO_H264_DPB_SIZE];
+	struct v4l2_h264_reference p[V4L2_H264_REF_LIST_LEN];
+	struct v4l2_h264_reference b0[V4L2_H264_REF_LIST_LEN];
+	struct v4l2_h264_reference b1[V4L2_H264_REF_LIST_LEN];
 };
 
 /**
diff --git a/drivers/staging/media/rkvdec/rkvdec-h264.c b/drivers/staging/media/rkvdec/rkvdec-h264.c
index 3c7f3d87fab4..dff89732ddd0 100644
--- a/drivers/staging/media/rkvdec/rkvdec-h264.c
+++ b/drivers/staging/media/rkvdec/rkvdec-h264.c
@@ -100,9 +100,9 @@ struct rkvdec_h264_priv_tbl {
 #define RKVDEC_H264_DPB_SIZE 16
 
 struct rkvdec_h264_reflists {
-	struct v4l2_h264_reference p[RKVDEC_H264_DPB_SIZE];
-	struct v4l2_h264_reference b0[RKVDEC_H264_DPB_SIZE];
-	struct v4l2_h264_reference b1[RKVDEC_H264_DPB_SIZE];
+	struct v4l2_h264_reference p[V4L2_H264_REF_LIST_LEN];
+	struct v4l2_h264_reference b0[V4L2_H264_REF_LIST_LEN];
+	struct v4l2_h264_reference b1[V4L2_H264_REF_LIST_LEN];
 	u8 num_valid;
 };
 
diff --git a/include/media/v4l2-h264.h b/include/media/v4l2-h264.h
index ef9a894e3c32..e282fb16ac58 100644
--- a/include/media/v4l2-h264.h
+++ b/include/media/v4l2-h264.h
@@ -37,7 +37,7 @@ struct v4l2_h264_reflist_builder {
 		u16 longterm : 1;
 	} refs[V4L2_H264_NUM_DPB_ENTRIES];
 	s32 cur_pic_order_count;
-	struct v4l2_h264_reference unordered_reflist[V4L2_H264_NUM_DPB_ENTRIES];
+	struct v4l2_h264_reference unordered_reflist[V4L2_H264_REF_LIST_LEN];
 	u8 num_valid;
 };
 
@@ -51,9 +51,9 @@ v4l2_h264_init_reflist_builder(struct v4l2_h264_reflist_builder *b,
  * v4l2_h264_build_b_ref_lists() - Build the B0/B1 reference lists
  *
  * @builder: reference list builder context
- * @b0_reflist: 16 sized array used to store the B0 reference list. Each entry
+ * @b0_reflist: 32 sized array used to store the B0 reference list. Each entry
  *		is a v4l2_h264_reference structure
- * @b1_reflist: 16 sized array used to store the B1 reference list. Each entry
+ * @b1_reflist: 32 sized array used to store the B1 reference list. Each entry
  *		is a v4l2_h264_reference structure
  *
  * This functions builds the B0/B1 reference lists. This procedure is described
@@ -70,7 +70,7 @@ v4l2_h264_build_b_ref_lists(const struct v4l2_h264_reflist_builder *builder,
  * v4l2_h264_build_p_ref_list() - Build the P reference list
  *
  * @builder: reference list builder context
- * @reflist: 16 sized array used to store the P reference list. Each entry
+ * @reflist: 32 sized array used to store the P reference list. Each entry
  *	     is a v4l2_h264_reference structure
  *
  * This functions builds the P reference lists. This procedure is describe in
-- 
2.34.1

