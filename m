Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8C155B0DB9
	for <lists+linux-media@lfdr.de>; Wed,  7 Sep 2022 22:04:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230002AbiIGUEy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Sep 2022 16:04:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230003AbiIGUEv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Sep 2022 16:04:51 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5BF419292
        for <linux-media@vger.kernel.org>; Wed,  7 Sep 2022 13:04:50 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C5963888;
        Wed,  7 Sep 2022 22:04:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1662581086;
        bh=QRqh6Zp3axo3I2zFhkRkPaNLa1ui2erN7CUSMECf9v4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SKDVJjZeKPLDa0cRDbBiYumKaAn5nMYVRPiEdsvYee8YEos6YXMKSLBerKlIY8i3b
         itYV7+9GjQIVVDsJIDu2a+t2lu4Ii29CAYlUDp4XaqtqjNOpKNR29Jvh558poSMvxM
         Y4RSYoCiKZk3+oP1nvy4eQQP2LE3DjKxV782vOVs=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>, kernel@pengutronix.de,
        linux-imx@nxp.com
Subject: [PATCH 4/6] staging: media: imx: Drop IMX_MEDIA_GRP_ID_CSI
Date:   Wed,  7 Sep 2022 23:04:22 +0300
Message-Id: <20220907200424.32136-5-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220907200424.32136-1-laurent.pinchart@ideasonboard.com>
References: <20220907200424.32136-1-laurent.pinchart@ideasonboard.com>
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

The IMX_MEDIA_GRP_ID_CSI group ID isn't used anymore. Drop it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx-media-dev-common.c | 1 -
 drivers/staging/media/imx/imx-media.h            | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-dev-common.c b/drivers/staging/media/imx/imx-media-dev-common.c
index 8f7ced3a9cca..991820a8500f 100644
--- a/drivers/staging/media/imx/imx-media-dev-common.c
+++ b/drivers/staging/media/imx/imx-media-dev-common.c
@@ -39,7 +39,6 @@ static void imx_media_create_csi2_links(struct imx_media_dev *imxmd)
 	list_for_each_entry(sd, &imxmd->v4l2_dev.subdevs, list) {
 		/* skip if not a CSI or a CSI mux */
 		if (!(sd->grp_id & IMX_MEDIA_GRP_ID_IPU_CSI) &&
-		    !(sd->grp_id & IMX_MEDIA_GRP_ID_CSI) &&
 		    !(sd->grp_id & IMX_MEDIA_GRP_ID_CSI_MUX))
 			continue;
 
diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/imx/imx-media.h
index f263fc3adbb9..5e794f291da6 100644
--- a/drivers/staging/media/imx/imx-media.h
+++ b/drivers/staging/media/imx/imx-media.h
@@ -299,7 +299,6 @@ void imx_media_csc_scaler_device_unregister(struct imx_media_video_dev *vdev);
 
 /* subdev group ids */
 #define IMX_MEDIA_GRP_ID_CSI2          BIT(8)
-#define IMX_MEDIA_GRP_ID_CSI           BIT(9)
 #define IMX_MEDIA_GRP_ID_IPU_CSI_BIT   10
 #define IMX_MEDIA_GRP_ID_IPU_CSI       (0x3 << IMX_MEDIA_GRP_ID_IPU_CSI_BIT)
 #define IMX_MEDIA_GRP_ID_IPU_CSI0      BIT(IMX_MEDIA_GRP_ID_IPU_CSI_BIT)
-- 
Regards,

Laurent Pinchart

