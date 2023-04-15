Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B6886E3232
	for <lists+linux-media@lfdr.de>; Sat, 15 Apr 2023 17:56:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229961AbjDOP4v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Apr 2023 11:56:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229764AbjDOP4u (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Apr 2023 11:56:50 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3FB549FF
        for <linux-media@vger.kernel.org>; Sat, 15 Apr 2023 08:56:48 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id ECED09C;
        Sat, 15 Apr 2023 17:56:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1681574203;
        bh=Zq29F8fmebdAV0lOV0/Euey42c1n8IFjZyVSuNPjG8s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DKv6YtkgVvqfLMx9d8fdW27KmyHXE4eMeu7MUpq8SP5A0Py3wOuOrzNACnmUXckyM
         86gu0hfpTy65nVy/YleYgGtiF7I0jhZa4BETNhBZrl7UdSk4WdLJafxyUh+b37c3lj
         hOF3P1xGy6IrWYyIGrBKoHSm5V2SPwrTjzstgny0=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-imx@nxp.com, kernel@pengutronix.de,
        Adam Ford <aford173@gmail.com>
Subject: [PATCH v5 5/5] media: nxp: imx8-isi: Remove 300ms sleep after enabling channel
Date:   Sat, 15 Apr 2023 18:56:30 +0300
Message-Id: <20230415155630.7492-6-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230415155630.7492-1-laurent.pinchart@ideasonboard.com>
References: <20230415155630.7492-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

The current implementation of the mxc_isi_channel_enable() function has
a hard 300ms sleep. This was copied from the NXP BSP, which has since
dropped the sleep in a commit that implied the delay was meant to wait
for the sensor to be "stable". As the sensor is started after the ISI,
the delay won't affect sensor operation. Drop it.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
index be12d0d2f42f..db538f3d88ec 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
@@ -515,8 +515,6 @@ void mxc_isi_channel_enable(struct mxc_isi_pipe *pipe)
 	mxc_isi_write(pipe, CHNL_CTRL, val);
 
 	mutex_unlock(&pipe->lock);
-
-	msleep(300);
 }
 
 void mxc_isi_channel_disable(struct mxc_isi_pipe *pipe)
-- 
Regards,

Laurent Pinchart

