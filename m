Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2708521484
	for <lists+linux-media@lfdr.de>; Tue, 10 May 2022 14:00:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241381AbiEJMDX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 May 2022 08:03:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241375AbiEJMDW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 May 2022 08:03:22 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71EC552E73
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 04:59:25 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E04A0BA9;
        Tue, 10 May 2022 13:59:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1652183958;
        bh=d+7BkkERKznRknT/kY5nL7k0K2j0jSnisRVTDGKQ6Co=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UMEMNQSmaDynk7910TrgmtlEBn6UPfMUVrZDV3qs7zlzRKmsHzUBDEmN1Sm6eLFR4
         +bOIf+Mh9Q9+Mu334nCCDUv3w3om+alTsdhvGo1CQmclRqHG5A5q1cYKZ11Bl6eMGL
         g3Ps7VYfizoPrhQ3fWar3NkWx/VpYfMjECdAYepA=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>,
        kernel@pengutronix.de, Paul Elder <paul.elder@ideasonboard.com>
Subject: [PATCH 10/50] staging: media: imx: imx7-media-csi: Remove imx_media_of_add_csi
Date:   Tue, 10 May 2022 14:58:19 +0300
Message-Id: <20220510115859.19777-11-laurent.pinchart@ideasonboard.com>
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

From: Paul Elder <paul.elder@ideasonboard.com>

imx_media_of_add_csi() from imx-media-of.c validates that the fwnode for
the CSI bridge is enabled, and adds the fwnode to the async notifier of
the imxmd. The former is redundant, as if the CSI bridge driver probes,
clearly it is enabled in the DT. The latter is not needed as the imxmd
notifier isn't used anymore. The call is thus not needed and can be
dropped. This removes the dependency of imx7-media-csi.c on
imx-media-of.c.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index d85b5ab204df..e7dcb602afae 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -1203,12 +1203,6 @@ static int imx7_csi_media_init(struct imx7_csi *csi)
 	if (IS_ERR(imxmd))
 		return PTR_ERR(imxmd);
 
-	ret = imx_media_of_add_csi(imxmd, csi->dev->of_node);
-	if (ret < 0 && ret != -ENODEV && ret != -EEXIST) {
-		imx7_csi_media_cleanup(csi);
-		return ret;
-	}
-
 	csi->imxmd = imxmd;
 
 	v4l2_subdev_init(&csi->sd, &imx7_csi_subdev_ops);
-- 
Regards,

Laurent Pinchart

