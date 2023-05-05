Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4D6C6F7D99
	for <lists+linux-media@lfdr.de>; Fri,  5 May 2023 09:16:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230486AbjEEHQx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 May 2023 03:16:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230317AbjEEHQw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 May 2023 03:16:52 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5F281609B
        for <linux-media@vger.kernel.org>; Fri,  5 May 2023 00:16:50 -0700 (PDT)
Received: from uno.LocalDomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7B2247FC;
        Fri,  5 May 2023 09:16:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1683271005;
        bh=Z0DLyAQeWXzkOj8s0UWteNNulJvyxlF5ckKLl8Mnk20=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CpF3RXTHan0MOZUuYCVVmf7+GkH8wadxm5dOu49v0DSjI2g2vdUIFeqlvVvqDQAJO
         ZLhkosdya+apvm3GUH3PCL0Vbif47iz/VlmqwnG01RYvzj42mDVqyTWMdHIKnDbn5v
         ZFMs0jq1IwwMMS2sSG+CsTKKgL2ey6YRGmBqEebE=
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     "Guoniu . zhou" <guoniu.zhou@nxp.com>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        slongerbeam@gmail.com, linux-media@vger.kernel.org,
        mchehab@kernel.org
Subject: [PATCH 1/2] media: ov5640: Remove unused 'framerate' parameter
Date:   Fri,  5 May 2023 09:16:18 +0200
Message-Id: <20230505071619.63229-2-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230505071619.63229-1-jacopo.mondi@ideasonboard.com>
References: <20230505071619.63229-1-jacopo.mondi@ideasonboard.com>
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

The 'current framerate' parameter passed to ov5640_try_fmt_internal() is
unsued. Drop it.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/i2c/ov5640.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 1536649b9e90..9bba3b0f8981 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -2815,7 +2815,6 @@ static int ov5640_get_fmt(struct v4l2_subdev *sd,
 
 static int ov5640_try_fmt_internal(struct v4l2_subdev *sd,
 				   struct v4l2_mbus_framefmt *fmt,
-				   enum ov5640_frame_rate fr,
 				   const struct ov5640_mode_info **new_mode)
 {
 	struct ov5640_dev *sensor = to_ov5640_dev(sd);
@@ -2975,8 +2974,7 @@ static int ov5640_set_fmt(struct v4l2_subdev *sd,
 		goto out;
 	}
 
-	ret = ov5640_try_fmt_internal(sd, mbus_fmt,
-				      sensor->current_fr, &new_mode);
+	ret = ov5640_try_fmt_internal(sd, mbus_fmt, &new_mode);
 	if (ret)
 		goto out;
 
-- 
2.40.1

