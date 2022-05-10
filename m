Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74FF55214B1
	for <lists+linux-media@lfdr.de>; Tue, 10 May 2022 14:00:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241475AbiEJMDv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 May 2022 08:03:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241477AbiEJMDu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 May 2022 08:03:50 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 706B353B52
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 04:59:53 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 310FF1A49;
        Tue, 10 May 2022 13:59:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1652183977;
        bh=uk7QSLv2qM0UlTKkUT4qWhdMuv+9FNoxBd4UtAMVX14=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ooWVWNX4AZouZLaGEJvdu9lAWJSs2gn6SYef0e52FVY33QHFIVoMuG+UmPAX8vLVg
         X9VCgYd8e1uw/7CC6ar6nl/L+iJIrfk3yrK9Hm0c3MYOs1NBBHSx7wsM9Yi+E8UBs1
         gzMD8TdsTMX3PwoOH3CkKfMIN5CvMLK4P708X2+M=
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
Subject: [PATCH 32/50] staging: media: imx: imx7-media-csi: Drop error message on alloc failure
Date:   Tue, 10 May 2022 14:58:41 +0300
Message-Id: <20220510115859.19777-33-laurent.pinchart@ideasonboard.com>
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

The kernel memory allocators already complain loudly to the log when
allocation fails. There's no need for an additional message.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 2106a72ebe85..e5dc9525fa52 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -442,10 +442,8 @@ static int imx7_csi_alloc_dma_buf(struct imx7_csi *csi,
 	buf->len = PAGE_ALIGN(size);
 	buf->virt = dma_alloc_coherent(csi->dev, buf->len, &buf->phys,
 				       GFP_DMA | GFP_KERNEL);
-	if (!buf->virt) {
-		dev_err(csi->dev, "%s: failed\n", __func__);
+	if (!buf->virt)
 		return -ENOMEM;
-	}
 
 	return 0;
 }
-- 
Regards,

Laurent Pinchart

