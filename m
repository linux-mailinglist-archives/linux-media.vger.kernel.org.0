Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C358C5B0CFD
	for <lists+linux-media@lfdr.de>; Wed,  7 Sep 2022 21:16:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229926AbiIGTQM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Sep 2022 15:16:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229842AbiIGTQK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Sep 2022 15:16:10 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1092BFE93
        for <linux-media@vger.kernel.org>; Wed,  7 Sep 2022 12:16:09 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 247D781E;
        Wed,  7 Sep 2022 21:16:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1662578168;
        bh=DMEyij57pBiJGUTLs2s8+MqbDmXotXG9eTnDXge7iP0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XQGqc5NtCsdVzisKCX9ZCamOxeVIT6ESQodTrEImhpZlvE45gWYWS3qiCOMIoaiMv
         yIxwN8bHJolWuiLm3OWji1HUgoS2SVQnC6uJWN/D5L6fk4OUiU9+gK4rMxIRXvU/wl
         8E7SX0yXc351lxZUw5xvvCTIq15rzJJD2ozCLb4I=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>, kernel@pengutronix.de,
        linux-imx@nxp.com
Subject: [PATCH 3/3] media: imx: imx7-media-csi: Clear BIT_MIPI_DOUBLE_CMPNT for <16b formats
Date:   Wed,  7 Sep 2022 22:15:47 +0300
Message-Id: <20220907191547.19255-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220907191547.19255-1-laurent.pinchart@ideasonboard.com>
References: <20220907191547.19255-1-laurent.pinchart@ideasonboard.com>
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

Commit 9babbbaaeb87 ("media: imx: imx7-media-csi: Use dual sampling for
YUV 1X16") set BIT_MIPI_DOUBLE_CMPNT in the CR18 register for 16-bit YUV
formats in imx7_csi_configure(). The CR18 register is always updated
with read-modify-write cycles, so if a 16-bit YUV format is selected,
the bit will stay set forever, even if the format is changed. Fix it by
clearing the bit at the beginning of the imx7_csi_configure() function.

While at it, swap two of the bits being cleared to match the MSB to LSB
order. This doesn't cause any functional change.

Fixes: 9babbbaaeb87 ("media: imx: imx7-media-csi: Use dual sampling for YUV 1X16")
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 03986445c0da..21d6e56ffcd4 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -522,9 +522,9 @@ static void imx7_csi_configure(struct imx7_csi *csi)
 	cr18 = imx7_csi_reg_read(csi, CSI_CSICR18);
 
 	cr18 &= ~(BIT_CSI_HW_ENABLE | BIT_MIPI_DATA_FORMAT_MASK |
-		  BIT_DATA_FROM_MIPI | BIT_BASEADDR_CHG_ERR_EN |
-		  BIT_BASEADDR_SWITCH_EN | BIT_BASEADDR_SWITCH_SEL |
-		  BIT_DEINTERLACE_EN);
+		  BIT_DATA_FROM_MIPI | BIT_MIPI_DOUBLE_CMPNT |
+		  BIT_BASEADDR_CHG_ERR_EN | BIT_BASEADDR_SWITCH_SEL |
+		  BIT_BASEADDR_SWITCH_EN | BIT_DEINTERLACE_EN);
 
 	if (out_pix->field == V4L2_FIELD_INTERLACED) {
 		cr18 |= BIT_DEINTERLACE_EN;
-- 
Regards,

Laurent Pinchart

