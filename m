Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1707570E84
	for <lists+linux-media@lfdr.de>; Tue, 12 Jul 2022 02:03:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230201AbiGLADb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jul 2022 20:03:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230232AbiGLADa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jul 2022 20:03:30 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 027772CE14
        for <linux-media@vger.kernel.org>; Mon, 11 Jul 2022 17:03:30 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6CB7588F;
        Tue, 12 Jul 2022 02:03:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657584204;
        bh=2s3Rc2/pT70aanp4Lvh/NnwWhS7zcmo7veEUPzD6QyA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jp8GJE4SfoSjEVxtuUjkwcJYaxD+nHS685gQdpqpDhQOyGhrdFblsT6Q3KI2IL4R9
         lbGdCBgZ2w38yvOro3BlaZye602mLAzSioUJIXDbUVpvIcdMXRawRQ6a5q+LjaEHTL
         Fqq2KTL9dOdH0lXWutjHfUs3QFqV54xPRDNLuZNs=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-imx@nxp.com, kernel@pengutronix.de
Subject: [PATCH v2 2/7] media: v4l2-tpg: Add support for the new YUVA and YUVX formats
Date:   Tue, 12 Jul 2022 03:02:46 +0300
Message-Id: <20220712000251.13607-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220712000251.13607-1-laurent.pinchart@ideasonboard.com>
References: <20220712000251.13607-1-laurent.pinchart@ideasonboard.com>
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
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/common/v4l2-tpg/v4l2-tpg-core.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c b/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c
index 7607b516a7c4..29d24f8d7c28 100644
--- a/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c
+++ b/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c
@@ -266,6 +266,8 @@ bool tpg_s_fourcc(struct tpg_data *tpg, u32 fourcc)
 	case V4L2_PIX_FMT_XYUV32:
 	case V4L2_PIX_FMT_VUYA32:
 	case V4L2_PIX_FMT_VUYX32:
+	case V4L2_PIX_FMT_YUVA32:
+	case V4L2_PIX_FMT_YUVX32:
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

