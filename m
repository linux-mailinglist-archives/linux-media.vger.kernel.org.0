Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96D1F5214B4
	for <lists+linux-media@lfdr.de>; Tue, 10 May 2022 14:00:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241407AbiEJMDf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 May 2022 08:03:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241415AbiEJMDc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 May 2022 08:03:32 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DB9D52E73
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 04:59:35 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 253DE1838;
        Tue, 10 May 2022 13:59:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1652183964;
        bh=2nqqOrgtxjxD2pNMktw8yQmUenswVmx0ziFCRdrpaxQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=D8YuGBgnhA3VLZPbsY8Nag6Z8U1FygrbvhfhjAPtR8A28Q/FpIE2mTG5Ui37JWefQ
         OPf34frcDHMab5E/ZicrA0KJpsMrm6O4/0AEguFt8RGfmN0cfRuvCJVj4UQWXKaX2I
         Az+IbKO4fUsSCK/1OUJgy0WAGf/AXgVu+ItiBO/U=
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
Subject: [PATCH 17/50] staging: media: imx: imx7-media-csi: Don't set subdev group id
Date:   Tue, 10 May 2022 14:58:26 +0300
Message-Id: <20220510115859.19777-18-laurent.pinchart@ideasonboard.com>
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

The subdev group id isn't used by any of the remaining helpers used by
this driver, don't set it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 80d666416d47..bd1bdc09e701 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -1749,13 +1749,6 @@ static int imx7_csi_notify_bound(struct v4l2_async_notifier *notifier,
 	struct imx7_csi *csi = imx7_csi_notifier_to_dev(notifier);
 	struct media_pad *sink = &csi->sd.entity.pads[IMX7_CSI_PAD_SINK];
 
-	/*
-	 * If the subdev is a video mux, it must be one of the CSI
-	 * muxes. Mark it as such via its group id.
-	 */
-	if (sd->entity.function == MEDIA_ENT_F_VID_MUX)
-		sd->grp_id = IMX_MEDIA_GRP_ID_CSI_MUX;
-
 	csi->src_sd = sd;
 
 	return v4l2_create_fwnode_links_to_pad(sd, sink, MEDIA_LNK_FL_ENABLED |
-- 
Regards,

Laurent Pinchart

