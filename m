Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 805BDD2A82
	for <lists+linux-media@lfdr.de>; Thu, 10 Oct 2019 15:12:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388064AbfJJNL6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Oct 2019 09:11:58 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:38285 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388051AbfJJNL5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Oct 2019 09:11:57 -0400
Received: from marune.fritz.box ([IPv6:2001:983:e9a7:1:bc04:8998:8ec1:1871])
        by smtp-cloud8.xs4all.net with ESMTPA
        id IYESijV5zop0AIYEViU37u; Thu, 10 Oct 2019 15:11:55 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@siol.net>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        mripard@kernel.org, tfiga@chromium.org, jonas@kwiboo.se,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv3 7/8] media: cedrus: h264: Support multiple slices per frame
Date:   Thu, 10 Oct 2019 15:11:51 +0200
Message-Id: <20191010131152.68984-8-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191010131152.68984-1-hverkuil-cisco@xs4all.nl>
References: <20191010131152.68984-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfNehpzSLnwlvZCmgg+1Ed3QLNwLhTgLyDEARzq26bl01ROW8oYfQHHZ8iaPuJ+C4VvD8UsQDPTP2OcGQcAjep1uSm2rhnnnyWj7aCfT41PisMe6yi5zC
 jFpxptS8fR0CFoPZ752VdOautT6W1W6gW5bwyjrecdsx7WAoJs0JFx8GHQMJOgE36du63az8K4GLmowr0/tPp3YW+O1TaJAsyvKpt7Cn8o9JS0Q3lOTj8VK4
 hqBn6LE51yvKPcDe0aXTkwU512mAtM8u5hnIS7X5+Wp9H1SE8spYhqmcjYp1J2v75kw5nWM3w0Q57JKq+sNaO6O3D0PxiNKJK11380XoGPDlGN6sVidhpaeV
 biFASR6JUdRJnsFaP8eXo0AS2bhQiXamfkDsHiM9Kg19fMnPVKeqr1CrdrE6yiEdM4Rax9Rr9m6xz9ccjsot0k25uQxeT2PmNgN1yDST68yCXZe9myZvysxN
 Wdm3BtkEK2M7RygO
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jernej Skrabec <jernej.skrabec@siol.net>

With recent changes, support for decoding multi-slice frames can be
easily added now.

Signal VPU if current slice is first in frame or not and add information
about first macroblock coordinates.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/staging/media/sunxi/cedrus/cedrus_h264.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
index d6a782703c9b..3ffb5494cff6 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
@@ -301,6 +301,8 @@ static void cedrus_set_params(struct cedrus_ctx *ctx,
 	dma_addr_t src_buf_addr;
 	u32 offset = slice->header_bit_size;
 	u32 len = (slice->size * 8) - offset;
+	unsigned int pic_width_in_mbs;
+	bool mbaff_pic;
 	u32 reg;
 
 	cedrus_write(dev, VE_H264_VLD_LEN, len);
@@ -370,12 +372,20 @@ static void cedrus_set_params(struct cedrus_ctx *ctx,
 		reg |= VE_H264_SPS_DIRECT_8X8_INFERENCE;
 	cedrus_write(dev, VE_H264_SPS, reg);
 
+	mbaff_pic = !(slice->flags & V4L2_H264_SLICE_FLAG_FIELD_PIC) &&
+		    (sps->flags & V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD);
+	pic_width_in_mbs = sps->pic_width_in_mbs_minus1 + 1;
+
 	// slice parameters
 	reg = 0;
+	reg |= ((slice->first_mb_in_slice % pic_width_in_mbs) & 0xff) << 24;
+	reg |= (((slice->first_mb_in_slice / pic_width_in_mbs) *
+		 (mbaff_pic + 1)) & 0xff) << 16;
 	reg |= decode->nal_ref_idc ? BIT(12) : 0;
 	reg |= (slice->slice_type & 0xf) << 8;
 	reg |= slice->cabac_init_idc & 0x3;
-	reg |= VE_H264_SHS_FIRST_SLICE_IN_PIC;
+	if (run->first_slice)
+		reg |= VE_H264_SHS_FIRST_SLICE_IN_PIC;
 	if (slice->flags & V4L2_H264_SLICE_FLAG_FIELD_PIC)
 		reg |= VE_H264_SHS_FIELD_PIC;
 	if (slice->flags & V4L2_H264_SLICE_FLAG_BOTTOM_FIELD)
-- 
2.23.0

