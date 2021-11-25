Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3570945DE29
	for <lists+linux-media@lfdr.de>; Thu, 25 Nov 2021 16:59:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356235AbhKYQCL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Nov 2021 11:02:11 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:40646 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356146AbhKYQAH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Nov 2021 11:00:07 -0500
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:2581:f820:804e:edb9])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D84CA1F464B2;
        Thu, 25 Nov 2021 15:56:53 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
        t=1637855814; bh=St+Qi/gbAqI6/HahjqQs1pVmdRgaz376XjXxEdS2kcw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YqAZFCSMSiXcY4uWU1Fs8GRZHBqngunm3D9loX2EjD2ceHg99n7Cb/XIHcwAz3TW6
         bBou46B2ediPGR8pjcQ//21SIIIsSWOC5vnKJ2Emtx4ZTf7JyB2k/V0uYOfIKi9UFV
         DZw/H+ubf8dR0r1JIYzPea0nso8X+f6HTAUZ5G3BO0rWwJYHOpr/nzyso+6/00ubpk
         dg7cyxxJRLfmsUe0dV8Ja7V6vdPzm3m41uyHQmSv+kv4JBF12L41yx0VdgRcy0QK71
         XUM3diPQiKgCaKOwbCAEUr4a9GnjpqFCG9VgCQT75+wIc/G/efF7pdg7CowiKCHoNC
         cw6XK9J3yqrNw==
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     mchehab@kernel.org, ezequiel@vanguardiasur.com.ar,
        p.zabel@pengutronix.de, gregkh@linuxfoundation.org,
        hverkuil-cisco@xs4all.nl
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-staging@lists.linux.dev, kernel@collabora.com,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v3 1/4] media: hevc: Remove RPS named flags
Date:   Thu, 25 Nov 2021 16:56:47 +0100
Message-Id: <20211125155650.630977-2-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211125155650.630977-1-benjamin.gaignard@collabora.com>
References: <20211125155650.630977-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Marking a picture as long-term reference is valid for DPB but not for RPS.
Change flag name to match with it description in HEVC spec chapiter
"8.3.2 Decoding process for reference picture set".
Remove the other unused RPS flags.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 8 +++-----
 drivers/staging/media/hantro/hantro_g2_hevc_dec.c         | 2 +-
 drivers/staging/media/sunxi/cedrus/cedrus_h265.c          | 2 +-
 include/media/hevc-ctrls.h                                | 6 ++----
 4 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index e141f0e4eec9..38da33e61c3d 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -3166,11 +3166,9 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
 	:c:func:`v4l2_timeval_to_ns()` function to convert the struct
 	:c:type:`timeval` in struct :c:type:`v4l2_buffer` to a __u64.
     * - __u8
-      - ``rps``
-      - The reference set for the reference frame
-        (V4L2_HEVC_DPB_ENTRY_RPS_ST_CURR_BEFORE,
-        V4L2_HEVC_DPB_ENTRY_RPS_ST_CURR_AFTER or
-        V4L2_HEVC_DPB_ENTRY_RPS_LT_CURR)
+      - ``flags``
+      - Long term flag for the reference frame
+        (V4L2_HEVC_DPB_ENTRY_LONG_TERM_REFERENCE)
     * - __u8
       - ``field_pic``
       - Whether the reference is a field picture or a frame.
diff --git a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c b/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
index f62608b0b408..367d0bf7b6e9 100644
--- a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
+++ b/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
@@ -431,7 +431,7 @@ static int set_ref(struct hantro_ctx *ctx)
 		chroma_addr = luma_addr + cr_offset;
 		mv_addr = luma_addr + mv_offset;
 
-		if (dpb[i].rps == V4L2_HEVC_DPB_ENTRY_RPS_LT_CURR)
+		if (dpb[i].flags == V4L2_HEVC_DPB_ENTRY_LONG_TERM_REFERENCE)
 			dpb_longterm_e |= BIT(V4L2_HEVC_DPB_ENTRIES_NUM_MAX - 1 - i);
 
 		hantro_write_addr(vpu, G2_REF_LUMA_ADDR(i), luma_addr);
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
index 8829a7bab07e..fa0d08220b5a 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
@@ -169,7 +169,7 @@ static void cedrus_h265_ref_pic_list_write(struct cedrus_dev *dev,
 		unsigned int index = list[i];
 		u8 value = list[i];
 
-		if (dpb[index].rps == V4L2_HEVC_DPB_ENTRY_RPS_LT_CURR)
+		if (dpb[index].flags == V4L2_HEVC_DPB_ENTRY_LONG_TERM_REFERENCE)
 			value |= VE_DEC_H265_SRAM_REF_PIC_LIST_LT_REF;
 
 		/* Each SRAM word gathers up to 4 references. */
diff --git a/include/media/hevc-ctrls.h b/include/media/hevc-ctrls.h
index ef63bc205756..01ccda48d8c5 100644
--- a/include/media/hevc-ctrls.h
+++ b/include/media/hevc-ctrls.h
@@ -127,15 +127,13 @@ struct v4l2_ctrl_hevc_pps {
 	__u64	flags;
 };
 
-#define V4L2_HEVC_DPB_ENTRY_RPS_ST_CURR_BEFORE	0x01
-#define V4L2_HEVC_DPB_ENTRY_RPS_ST_CURR_AFTER	0x02
-#define V4L2_HEVC_DPB_ENTRY_RPS_LT_CURR		0x03
+#define V4L2_HEVC_DPB_ENTRY_LONG_TERM_REFERENCE	0x01
 
 #define V4L2_HEVC_DPB_ENTRIES_NUM_MAX		16
 
 struct v4l2_hevc_dpb_entry {
 	__u64	timestamp;
-	__u8	rps;
+	__u8	flags;
 	__u8	field_pic;
 	__u16	pic_order_cnt[2];
 	__u8	padding[2];
-- 
2.30.2

