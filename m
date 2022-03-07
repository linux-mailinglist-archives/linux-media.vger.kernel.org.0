Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0613D4D05EA
	for <lists+linux-media@lfdr.de>; Mon,  7 Mar 2022 19:04:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244631AbiCGSE6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Mar 2022 13:04:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244634AbiCGSE4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Mar 2022 13:04:56 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6B7C6A077
        for <linux-media@vger.kernel.org>; Mon,  7 Mar 2022 10:04:01 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2E7998C1;
        Mon,  7 Mar 2022 19:03:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646676239;
        bh=FywkCnbeGfaq8C6jT2TKfA9ehjBzl2m9zXERf0QGWc4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=W74Oe6wDRZtK5zky29t3VV5IQ1YGMYT4nRwfa1Hf+P02fGlaywezzC8WnCN67cwKJ
         ITYwPov583whk5eBig6HVzEbsYHJovrGsa9mIarTTqAFowFXIu8Sn37CkF1Wu7LVob
         zxxV/lk/MmqDPQMEjZTjpziBphY+uN+EmDpLXfO4=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH 2/3] media: v4l2-tpg: Add support for the new YUVA and YUVX formats
Date:   Mon,  7 Mar 2022 20:03:41 +0200
Message-Id: <20220307180342.10666-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220307180342.10666-1-laurent.pinchart@ideasonboard.com>
References: <20220307180342.10666-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Extend the TPG to support generating the newly added YUVA and YUVX pixel
formats.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/common/v4l2-tpg/v4l2-tpg-core.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c b/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c
index 7607b516a7c4..763347919d81 100644
--- a/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c
+++ b/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c
@@ -266,6 +266,8 @@ bool tpg_s_fourcc(struct tpg_data *tpg, u32 fourcc)
 	case V4L2_PIX_FMT_XYUV32:
 	case V4L2_PIX_FMT_VUYA32:
 	case V4L2_PIX_FMT_VUYX32:
+	case V4L2_PIX_FMT_YUV32A:
+	case V4L2_PIX_FMT_YUV32X:
 		tpg->color_enc = TGP_COLOR_ENC_YCBCR;
 		break;
 	case V4L2_PIX_FMT_YUV420M:
@@ -412,6 +414,8 @@ bool tpg_s_fourcc(struct tpg_data *tpg, u32 fourcc)
 	case V4L2_PIX_FMT_XYUV32:
 	case V4L2_PIX_FMT_VUYA32:
 	case V4L2_PIX_FMT_VUYX32:
+	case V4L2_PIX_FMT_YUVA32:
+	case V4L2_PIX_FMT_YUVX32:
 	case V4L2_PIX_FMT_HSV32:
 		tpg->twopixelsize[0] = 2 * 4;
 		break;
@@ -1376,9 +1380,11 @@ static void gen_twopix(struct tpg_data *tpg,
 		buf[0][offset + 3] = b_v;
 		break;
 	case V4L2_PIX_FMT_RGBX32:
+	case V4L2_PIX_FMT_YUVX32:
 		alpha = 0;
 		fallthrough;
 	case V4L2_PIX_FMT_RGBA32:
+	case V4L2_PIX_FMT_YUVA32:
 		buf[0][offset] = r_y_h;
 		buf[0][offset + 1] = g_u_s;
 		buf[0][offset + 2] = b_v;
-- 
Regards,

Laurent Pinchart

