Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2F0630F932
	for <lists+linux-media@lfdr.de>; Thu,  4 Feb 2021 18:11:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238266AbhBDRLP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Feb 2021 12:11:15 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:57475 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237438AbhBDRJe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Feb 2021 12:09:34 -0500
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1l7i7e-0001Xe-DE; Thu, 04 Feb 2021 17:08:50 +0000
From:   Colin King <colin.king@canonical.com>
To:     Jean-Christophe Trotin <jean-christophe.trotin@st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][V2] media: platform: sti: make a const arrays static, makes object smaller
Date:   Thu,  4 Feb 2021 17:08:50 +0000
Message-Id: <20210204170850.106821-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the const arrays on the stack but instead it
static. Makes the object code smaller by 8 bytes:

Before:
   text	   data	    bss	    dec	    hex	filename
  12504	   4568	      0	  17072	   42b0	media/platform/sti/hva/hva-h264.o

After:
   text	   data	    bss	    dec	    hex	filename
  12272	   4792	      0	  17064	   42a8	media/platform/sti/hva/hva-h264.o

(gcc version 10.2.0)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---

V2: fix commit message, pluralize arrays and remove array bame bws

---
 drivers/media/platform/sti/hva/hva-h264.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/sti/hva/hva-h264.c b/drivers/media/platform/sti/hva/hva-h264.c
index c34f7cf5aed2..98cb00d2d868 100644
--- a/drivers/media/platform/sti/hva/hva-h264.c
+++ b/drivers/media/platform/sti/hva/hva-h264.c
@@ -428,8 +428,10 @@ static int hva_h264_fill_slice_header(struct hva_ctx *pctx,
 	 */
 	struct device *dev = ctx_to_dev(pctx);
 	int  cabac = V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC;
-	const unsigned char slice_header[] = { 0x00, 0x00, 0x00, 0x01,
-					       0x41, 0x34, 0x07, 0x00};
+	static const unsigned char slice_header[] = {
+		0x00, 0x00, 0x00, 0x01,
+		0x41, 0x34, 0x07, 0x00
+	};
 	int idr_pic_id = frame_num % 2;
 	enum hva_picture_coding_type type;
 	u32 frame_order = frame_num % ctrls->gop_size;
@@ -488,7 +490,7 @@ static int hva_h264_fill_data_nal(struct hva_ctx *pctx,
 				  unsigned int stream_size, unsigned int *size)
 {
 	struct device *dev = ctx_to_dev(pctx);
-	const u8 start[] = { 0x00, 0x00, 0x00, 0x01 };
+	static const u8 start[] = { 0x00, 0x00, 0x00, 0x01 };
 
 	dev_dbg(dev, "%s   %s stuffing bytes %d\n", pctx->name, __func__,
 		stuffing_bytes);
@@ -521,7 +523,7 @@ static int hva_h264_fill_sei_nal(struct hva_ctx *pctx,
 				 u8 *addr, u32 *size)
 {
 	struct device *dev = ctx_to_dev(pctx);
-	const u8 start[] = { 0x00, 0x00, 0x00, 0x01 };
+	static const u8 start[] = { 0x00, 0x00, 0x00, 0x01 };
 	struct hva_h264_stereo_video_sei info;
 	u8 offset = 7;
 	u8 msg = 0;
-- 
2.29.2

