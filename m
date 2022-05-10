Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D98552148C
	for <lists+linux-media@lfdr.de>; Tue, 10 May 2022 14:00:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241443AbiEJMDk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 May 2022 08:03:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241425AbiEJMDi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 May 2022 08:03:38 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E91E46673
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 04:59:41 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 52AD018C1;
        Tue, 10 May 2022 13:59:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1652183969;
        bh=wREWnlZORWJLC+76NQD4bNVhlmjZ7u0qButDdbEp29U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ji+tbR7X7ocw+GLi9TtlJ/WwdWok2ENdvdB9ZcFN6V6B+2zPf8JMgwqvYCBWG6x5M
         K1pkfgWH6n3u+wp4FjjSmrL2JjtQmIVJ0BI17ftxmwBmjLobeiyPPjIkeRef3Wmo/e
         5DITVHPILoEHTV9odqxQnRwz/OKwBO6RO6h+6wvg=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>,
        kernel@pengutronix.de
Subject: [PATCH 22/50] staging: media: imx: imx7-media-csi: Inline imx_media_pipeline_pad()
Date:   Tue, 10 May 2022 14:58:31 +0300
Message-Id: <20220510115859.19777-23-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220510115859.19777-1-laurent.pinchart@ideasonboard.com>
References: <20220510115859.19777-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Inline the imx_media_pipeline_pad() helper, dropping all the code unused
by the imx7-media-csi driver.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 7e932884fd02..e1b494183ebc 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -1605,7 +1605,8 @@ static int imx7_csi_pad_link_validate(struct v4l2_subdev *sd,
 	struct imx7_csi *csi = v4l2_get_subdevdata(sd);
 	struct imx_media_video_dev *vdev = &csi->vdev;
 	const struct v4l2_pix_format *out_pix = &vdev->fmt;
-	struct media_pad *pad;
+	struct media_pad *pad = NULL;
+	unsigned int i;
 	int ret;
 
 	if (!csi->src_sd)
@@ -1627,7 +1628,17 @@ static int imx7_csi_pad_link_validate(struct v4l2_subdev *sd,
 
 	case MEDIA_ENT_F_VID_MUX:
 		/* The input is the mux, check its input. */
-		pad = imx_media_pipeline_pad(&csi->src_sd->entity, 0, 0, true);
+		for (i = 0; i < csi->src_sd->entity.num_pads; i++) {
+			struct media_pad *spad = &csi->src_sd->entity.pads[i];
+
+			if (!(spad->flags & MEDIA_PAD_FL_SINK))
+				continue;
+
+			pad = media_entity_remote_pad(spad);
+			if (pad)
+				break;
+		}
+
 		if (!pad)
 			return -ENODEV;
 
-- 
Regards,

Laurent Pinchart

