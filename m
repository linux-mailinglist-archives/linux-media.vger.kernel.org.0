Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50F8F57C655
	for <lists+linux-media@lfdr.de>; Thu, 21 Jul 2022 10:35:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230238AbiGUIfq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jul 2022 04:35:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229780AbiGUIfq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jul 2022 04:35:46 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AA0912AA2
        for <linux-media@vger.kernel.org>; Thu, 21 Jul 2022 01:35:45 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D6BAD825;
        Thu, 21 Jul 2022 10:35:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1658392544;
        bh=P7/8qHL5e8tggiqH3qcEHZbeK25mbN/1qsV15yd37UA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hfrgcW13M9ux/rSO0LTDuQSisuBGylOJob6lULp+uT3mg4H21AKTvfbdVxNvQMEYi
         0ErAYK6dbiqYH4ciwA+H2dTuugtEIdEt9aD++4zl0sI8wj/p/YWk79HHZ2daU8r1b1
         SgbirTHPliRZ1KQ6JUk6HbhCyoboH8YC1FBBtx98=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH 01/19] media: i2c: imx290: Use device lock for the control handler
Date:   Thu, 21 Jul 2022 11:35:22 +0300
Message-Id: <20220721083540.1525-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220721083540.1525-1-laurent.pinchart@ideasonboard.com>
References: <20220721083540.1525-1-laurent.pinchart@ideasonboard.com>
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

