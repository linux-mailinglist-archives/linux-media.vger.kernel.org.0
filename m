Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5600C5FFD75
	for <lists+linux-media@lfdr.de>; Sun, 16 Oct 2022 08:15:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229739AbiJPGP4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Oct 2022 02:15:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229600AbiJPGPy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Oct 2022 02:15:54 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1877B36DD3
        for <linux-media@vger.kernel.org>; Sat, 15 Oct 2022 23:15:54 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 224CF987;
        Sun, 16 Oct 2022 08:15:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1665900952;
        bh=LllqCoqFfQqVNyBPCvOG9ktBZpUQHAHCKoItxeNKK9U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JWwdk9HQrJFVRNt3MR6xgrD5rCpYwX3ygMw3GYr5XIoZzyIaSG3+t45Bro80Aflh0
         dQWFALLt/qt8HOjsaqkSzsUsb7G4BfhvHShpvEI/cN4OCDCMVOhgQlJe/KzieIKW/T
         /e0ADGAduM6D2MrhQNjmoxLwy5iT5t6CgmfoGEh4=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 02/20] media: i2c: imx290: Use device lock for the control handler
Date:   Sun, 16 Oct 2022 09:15:05 +0300
Message-Id: <20221016061523.30127-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221016061523.30127-1-laurent.pinchart@ideasonboard.com>
References: <20221016061523.30127-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The link frequency and pixel rate controls are set without holding the
control handler lock, resulting in kernel warnings. As the value of
those controls depend on the format, the simplest fix is to use the
device lock for the control handler.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/media/i2c/imx290.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 99f2a50d39a4..d97a5fb1d501 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -1043,6 +1043,7 @@ static int imx290_probe(struct i2c_client *client)
 	imx290_entity_init_cfg(&imx290->sd, NULL);
 
 	v4l2_ctrl_handler_init(&imx290->ctrls, 4);
+	imx290->ctrls.lock = &imx290->lock;
 
 	v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
 			  V4L2_CID_GAIN, 0, 72, 1, 0);
-- 
Regards,

Laurent Pinchart

