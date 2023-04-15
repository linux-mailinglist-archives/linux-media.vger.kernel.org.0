Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90FA06E3231
	for <lists+linux-media@lfdr.de>; Sat, 15 Apr 2023 17:56:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229908AbjDOP4q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Apr 2023 11:56:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229628AbjDOP4p (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Apr 2023 11:56:45 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 594E849DA
        for <linux-media@vger.kernel.org>; Sat, 15 Apr 2023 08:56:44 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0CE409C;
        Sat, 15 Apr 2023 17:56:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1681574198;
        bh=IlWi5SEUo7iCD12lgSQjz95qNBufDk8LM8cJFm1iZFs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JOQUrmgsPUHDaSwu+8WcYMxvQ4bl6YqNJP5KP4SifKdFYCm5qNSumWPsUNEY/9th/
         sh1mi4vTWy+eB37KOjOhzY1dNan+Hxi96Jk6uB70/OYf8OLxTEWNDEOiTx9kFYsWSN
         Tswri70ZGz8BrsLJCIDuY7xlzrv3DLyV33j5KAQ8=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-imx@nxp.com, kernel@pengutronix.de,
        Adam Ford <aford173@gmail.com>
Subject: [PATCH v5 4/5] media: nxp: imx8-isi: Replace udelay() with fsleep()
Date:   Sat, 15 Apr 2023 18:56:29 +0300
Message-Id: <20230415155630.7492-5-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230415155630.7492-1-laurent.pinchart@ideasonboard.com>
References: <20230415155630.7492-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The ISI driver uses udelay() to wait for 300µs in a context where it can
sleep. Use fsleep() instead.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
index eddc7fc36337..be12d0d2f42f 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
@@ -86,7 +86,8 @@ void mxc_isi_channel_m2m_start(struct mxc_isi_pipe *pipe)
 	val = mxc_isi_read(pipe, CHNL_MEM_RD_CTRL);
 	val &= ~CHNL_MEM_RD_CTRL_READ_MEM;
 	mxc_isi_write(pipe, CHNL_MEM_RD_CTRL, val);
-	udelay(300);
+
+	fsleep(300);
 
 	val |= CHNL_MEM_RD_CTRL_READ_MEM;
 	mxc_isi_write(pipe, CHNL_MEM_RD_CTRL, val);
-- 
Regards,

Laurent Pinchart

