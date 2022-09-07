Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAF105B0CFB
	for <lists+linux-media@lfdr.de>; Wed,  7 Sep 2022 21:16:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229821AbiIGTQI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Sep 2022 15:16:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229781AbiIGTQH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Sep 2022 15:16:07 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 768BCBFEA1
        for <linux-media@vger.kernel.org>; Wed,  7 Sep 2022 12:16:06 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BAD0381E;
        Wed,  7 Sep 2022 21:16:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1662578165;
        bh=uJiuKhXxm/KoPu0EcCEDfZTxnvLkmb+UhggSP6gJ0Q8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JE5WCaQvE2LVhPXInVtwx+Pq31/8sS8vOwxrExHxOd8Gm/f2UBBg1mAKr9sLlaGWp
         c2uEAAjjpjM7pmLAwjW9D3jw71ELbc902HBe5M/R6uvMWYFFYRBt5IHfSMNptT/+KP
         n418H2E/Mzbq9Dg0quUC9V7ldyIkqY3Q/iyM5Ftk=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>, kernel@pengutronix.de,
        linux-imx@nxp.com
Subject: [PATCH 1/3] media: imx: imx7-media-csi: Move variable to loop scope
Date:   Wed,  7 Sep 2022 22:15:45 +0300
Message-Id: <20220907191547.19255-2-laurent.pinchart@ideasonboard.com>
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

The phys variable is only used as a local loop variable in
imx7_csi_setup_vb2_buf(), with each entry in the array being used in the
corresponding iteration of the loop only. Move it to loop scope,
simplifying the array to a single variable.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 336f746ae324..1aef2cf41745 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -399,21 +399,22 @@ static void imx7_csi_setup_vb2_buf(struct imx7_csi *csi)
 {
 	struct imx7_csi_vb2_buffer *buf;
 	struct vb2_buffer *vb2_buf;
-	dma_addr_t phys[2];
 	int i;
 
 	for (i = 0; i < 2; i++) {
+		dma_addr_t phys;
+
 		buf = imx7_csi_video_next_buf(csi);
 		if (buf) {
 			csi->active_vb2_buf[i] = buf;
 			vb2_buf = &buf->vbuf.vb2_buf;
-			phys[i] = vb2_dma_contig_plane_dma_addr(vb2_buf, 0);
+			phys = vb2_dma_contig_plane_dma_addr(vb2_buf, 0);
 		} else {
 			csi->active_vb2_buf[i] = NULL;
-			phys[i] = csi->underrun_buf.phys;
+			phys = csi->underrun_buf.phys;
 		}
 
-		imx7_csi_update_buf(csi, phys[i], i);
+		imx7_csi_update_buf(csi, phys, i);
 	}
 }
 
-- 
Regards,

Laurent Pinchart

