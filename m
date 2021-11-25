Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C504B45DE27
	for <lists+linux-media@lfdr.de>; Thu, 25 Nov 2021 16:58:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356163AbhKYQCI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Nov 2021 11:02:08 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:40662 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356050AbhKYQAH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Nov 2021 11:00:07 -0500
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:2581:f820:804e:edb9])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 6FCA01F464B6;
        Thu, 25 Nov 2021 15:56:54 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
        t=1637855814; bh=4vWm+CgWUYVTIwW8jRbzMQ334Q4l221ziXqjjXFTpnY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DH+04tmWzVFQ3xniQ2lowtJL3TfBB2f/4eaT+dYSi+oE5LbzHtoRcQ7ls3XQL0a84
         qFzbOrkHllUmZUwJeUdHNH5M9kICXFUDqTPZAyJVA56t51IPPOnRnIxQ+7TynI0/CX
         C6fsjKnql43iMPh/YAUwStPJjXBVLi/b09Usphxfg6S+pkq+WKOnah78AXZlsl+CDp
         yAhaVCEPurYrhfkAX1LZj3LH7gk/tnUNSWGtZUUyyJzs1vi3LIqWIshcRnMztox4As
         xHk3CiKEH61ueZXH/hLuq7VOlIRGr845FBYT5OvP4eyjKx5nd0Jxo9UhxvGDDdYH0R
         MrK8nNE/J3v8w==
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     mchehab@kernel.org, ezequiel@vanguardiasur.com.ar,
        p.zabel@pengutronix.de, gregkh@linuxfoundation.org,
        hverkuil-cisco@xs4all.nl
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-staging@lists.linux.dev, kernel@collabora.com,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v3 2/4] media: hevc: Embedded indexes in RPS
Date:   Thu, 25 Nov 2021 16:56:48 +0100
Message-Id: <20211125155650.630977-3-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211125155650.630977-1-benjamin.gaignard@collabora.com>
References: <20211125155650.630977-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Reference Picture Set lists provide indexes of short and long term
reference in DBP array.
Fix Hantro to not do a look up in DBP entries.
Make documentation more clear about it.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 .../media/v4l/ext-ctrls-codec.rst             |  6 ++---
 .../staging/media/hantro/hantro_g2_hevc_dec.c | 25 +++++--------------
 2 files changed, 9 insertions(+), 22 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index 38da33e61c3d..b12ad5b3eaba 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -3381,15 +3381,15 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
     * - __u8
       - ``poc_st_curr_before[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
       - PocStCurrBefore as described in section 8.3.2 "Decoding process for reference
-        picture set.
+        picture set": provides the index of the short term before references in DPB array.
     * - __u8
       - ``poc_st_curr_after[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
       - PocStCurrAfter as described in section 8.3.2 "Decoding process for reference
-        picture set.
+        picture set": provides the index of the short term after references in DPB array.
     * - __u8
       - ``poc_lt_curr[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
       - PocLtCurr as described in section 8.3.2 "Decoding process for reference
-        picture set.
+        picture set": provides the index of the long term references in DPB array.
     * - __u64
       - ``flags``
       - See :ref:`Decode Parameters Flags <hevc_decode_params_flags>`
diff --git a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c b/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
index 367d0bf7b6e9..b35f36109a6f 100644
--- a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
+++ b/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
@@ -255,24 +255,11 @@ static void set_params(struct hantro_ctx *ctx)
 	hantro_reg_write(vpu, &g2_apf_threshold, 8);
 }
 
-static int find_ref_pic_index(const struct v4l2_hevc_dpb_entry *dpb, int pic_order_cnt)
-{
-	int i;
-
-	for (i = 0; i < V4L2_HEVC_DPB_ENTRIES_NUM_MAX; i++) {
-		if (dpb[i].pic_order_cnt[0] == pic_order_cnt)
-			return i;
-	}
-
-	return 0x0;
-}
-
 static void set_ref_pic_list(struct hantro_ctx *ctx)
 {
 	const struct hantro_hevc_dec_ctrls *ctrls = &ctx->hevc_dec.ctrls;
 	struct hantro_dev *vpu = ctx->dev;
 	const struct v4l2_ctrl_hevc_decode_params *decode_params = ctrls->decode_params;
-	const struct v4l2_hevc_dpb_entry *dpb = decode_params->dpb;
 	u32 list0[V4L2_HEVC_DPB_ENTRIES_NUM_MAX] = {};
 	u32 list1[V4L2_HEVC_DPB_ENTRIES_NUM_MAX] = {};
 	static const struct hantro_reg ref_pic_regs0[] = {
@@ -316,11 +303,11 @@ static void set_ref_pic_list(struct hantro_ctx *ctx)
 	/* List 0 contains: short term before, short term after and long term */
 	j = 0;
 	for (i = 0; i < decode_params->num_poc_st_curr_before && j < ARRAY_SIZE(list0); i++)
-		list0[j++] = find_ref_pic_index(dpb, decode_params->poc_st_curr_before[i]);
+		list0[j++] = decode_params->poc_st_curr_before[i];
 	for (i = 0; i < decode_params->num_poc_st_curr_after && j < ARRAY_SIZE(list0); i++)
-		list0[j++] = find_ref_pic_index(dpb, decode_params->poc_st_curr_after[i]);
+		list0[j++] = decode_params->poc_st_curr_after[i];
 	for (i = 0; i < decode_params->num_poc_lt_curr && j < ARRAY_SIZE(list0); i++)
-		list0[j++] = find_ref_pic_index(dpb, decode_params->poc_lt_curr[i]);
+		list0[j++] = decode_params->poc_lt_curr[i];
 
 	/* Fill the list, copying over and over */
 	i = 0;
@@ -329,11 +316,11 @@ static void set_ref_pic_list(struct hantro_ctx *ctx)
 
 	j = 0;
 	for (i = 0; i < decode_params->num_poc_st_curr_after && j < ARRAY_SIZE(list1); i++)
-		list1[j++] = find_ref_pic_index(dpb, decode_params->poc_st_curr_after[i]);
+		list1[j++] = decode_params->poc_st_curr_after[i];
 	for (i = 0; i < decode_params->num_poc_st_curr_before && j < ARRAY_SIZE(list1); i++)
-		list1[j++] = find_ref_pic_index(dpb, decode_params->poc_st_curr_before[i]);
+		list1[j++] = decode_params->poc_st_curr_before[i];
 	for (i = 0; i < decode_params->num_poc_lt_curr && j < ARRAY_SIZE(list1); i++)
-		list1[j++] = find_ref_pic_index(dpb, decode_params->poc_lt_curr[i]);
+		list1[j++] = decode_params->poc_lt_curr[i];
 
 	i = 0;
 	while (j < ARRAY_SIZE(list1))
-- 
2.30.2

