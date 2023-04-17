Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 033366E3F10
	for <lists+linux-media@lfdr.de>; Mon, 17 Apr 2023 07:39:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229741AbjDQFju (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Apr 2023 01:39:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbjDQFjt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Apr 2023 01:39:49 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 774AD107
        for <linux-media@vger.kernel.org>; Sun, 16 Apr 2023 22:39:48 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 26EA275B;
        Mon, 17 Apr 2023 07:39:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1681709982;
        bh=BZTKOKFrNJkEecKtw0hCir4UXljnbHWgZw2hBGRB5Gk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QbAU2hswk0BHj+C3BhbDG5ZiOiaMeGYgFyaTgZPgI/ccB02XO732LtxZvs1vmSiQx
         aHY50F9WuH9CkvjkdVXZXfYcKopG1ZCGCqv1fXKfgDHyKl4N7HEg431tgoMu2ZLRsY
         Cwv5LxmkdmNS1Z9xNrjc0wCZRao6r+5reVQS0glM=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-imx@nxp.com, kernel@pengutronix.de
Subject: [PATCH v1 2/2] media: nxp: imx8-isi: Use #ifdef to test CONFIG_ARCH_DMA_ADDR_T_64BIT
Date:   Mon, 17 Apr 2023 08:39:49 +0300
Message-Id: <20230417053949.7395-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417053949.7395-1-laurent.pinchart@ideasonboard.com>
References: <20230417053949.7395-1-laurent.pinchart@ideasonboard.com>
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

As the CONFIG_ARCH_DMA_ADDR_T_64BIT macro is not defined when the
corresponding kernel option is disabled, using #if will trigger a
compiler warning. Use #ifdef instead.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
index db538f3d88ec..1d59f4a0256b 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
@@ -30,7 +30,7 @@ static inline void mxc_isi_write(struct mxc_isi_pipe *pipe, u32 reg, u32 val)
 void mxc_isi_channel_set_inbuf(struct mxc_isi_pipe *pipe, dma_addr_t dma_addr)
 {
 	mxc_isi_write(pipe, CHNL_IN_BUF_ADDR, dma_addr);
-#if CONFIG_ARCH_DMA_ADDR_T_64BIT
+#ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
 	if (pipe->isi->pdata->has_36bit_dma)
 		mxc_isi_write(pipe, CHNL_IN_BUF_XTND_ADDR, dma_addr >> 32);
 #endif
@@ -48,7 +48,7 @@ void mxc_isi_channel_set_outbuf(struct mxc_isi_pipe *pipe,
 		mxc_isi_write(pipe, CHNL_OUT_BUF1_ADDR_Y, dma_addrs[0]);
 		mxc_isi_write(pipe, CHNL_OUT_BUF1_ADDR_U, dma_addrs[1]);
 		mxc_isi_write(pipe, CHNL_OUT_BUF1_ADDR_V, dma_addrs[2]);
-#if CONFIG_ARCH_DMA_ADDR_T_64BIT
+#ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
 		if (pipe->isi->pdata->has_36bit_dma) {
 			mxc_isi_write(pipe, CHNL_Y_BUF1_XTND_ADDR,
 				      dma_addrs[0] >> 32);
@@ -63,7 +63,7 @@ void mxc_isi_channel_set_outbuf(struct mxc_isi_pipe *pipe,
 		mxc_isi_write(pipe, CHNL_OUT_BUF2_ADDR_Y, dma_addrs[0]);
 		mxc_isi_write(pipe, CHNL_OUT_BUF2_ADDR_U, dma_addrs[1]);
 		mxc_isi_write(pipe, CHNL_OUT_BUF2_ADDR_V, dma_addrs[2]);
-#if CONFIG_ARCH_DMA_ADDR_T_64BIT
+#ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
 		if (pipe->isi->pdata->has_36bit_dma) {
 			mxc_isi_write(pipe, CHNL_Y_BUF2_XTND_ADDR,
 				      dma_addrs[0] >> 32);
-- 
Regards,

Laurent Pinchart

