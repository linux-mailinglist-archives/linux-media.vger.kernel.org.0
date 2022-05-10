Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4E2E5214AB
	for <lists+linux-media@lfdr.de>; Tue, 10 May 2022 14:00:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241497AbiEJMEE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 May 2022 08:04:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241490AbiEJMEB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 May 2022 08:04:01 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01670165AB
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 05:00:05 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E154021CB;
        Tue, 10 May 2022 13:59:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1652183984;
        bh=aeX1orNGzBDkwKiTIbU/NLaLk/IOSa8sRNi19vKUMfA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=eDS2Xq0pU+YBTWQ1lMRWVyOQGYYlRTvi1gcswx3rkRsdnRxgMf4Bm6zAf74Kt8kE2
         45lrtDgvej0hg8m2rXvxTbWjNSMhrYdgtnXdSgGNhIwgR7MjURgrkuooujmTGhNCSE
         CTJP8fRWsczN/mpHV9G9Ljpe77mzN+x2Xh25fuJ8=
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
Subject: [PATCH 40/50] staging: media: imx: imx7-media-csi: Simplify default mbus code in try_fmt
Date:   Tue, 10 May 2022 14:58:49 +0300
Message-Id: <20220510115859.19777-41-laurent.pinchart@ideasonboard.com>
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

When trying a format on the subdev sink pad, if the requested media bus
code isn't supported, fallback to the default with a simpler logic.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index f2e85e9851e4..f3b9ce03318f 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -1972,11 +1972,10 @@ static int imx7_csi_try_fmt(struct imx7_csi *csi,
 		*cc = imx7_csi_find_mbus_format(sdformat->format.code,
 						IMX7_CSI_PIXFMT_SEL_ANY);
 		if (!*cc) {
-			imx7_csi_enum_mbus_formats(&code, 0,
-						   IMX7_CSI_PIXFMT_SEL_YUV_RGB);
+			code = IMX7_CSI_DEF_MBUS_CODE;
 			*cc = imx7_csi_find_mbus_format(code,
-							IMX7_CSI_PIXFMT_SEL_YUV_RGB);
-			sdformat->format.code = (*cc)->codes[0];
+							IMX7_CSI_PIXFMT_SEL_ANY);
+			sdformat->format.code = code;
 		}
 
 		if (sdformat->format.field != V4L2_FIELD_INTERLACED)
-- 
Regards,

Laurent Pinchart

