Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A0747A0C61
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 20:17:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240956AbjINSRG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 14:17:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240936AbjINSRE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 14:17:04 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B12D21FF9
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 11:17:00 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CB8182F6C;
        Thu, 14 Sep 2023 20:15:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694715327;
        bh=+w9HrF4+sfSacLxfeK8lK4BF1o8pBAbrVW0OYAYazwg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=sxzJzNcgEw6lWHlT3B/ra93Ln8v0JlR2bzdpC5anApq8HCo1BDvEbZERy5Nz/7iMU
         QR82G3M/V/QCnCba71vfjM5XJ2ndIOCBH/ciJA37Zm2R3HwSs0ZNqqxcvOXgq08Hs9
         2wpaXlmFaMv4M8QyCobxtkqsH75Q6C404aA7JMbU=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 06/57] media: i2c: imx219: Drop check for reentrant .s_stream()
Date:   Thu, 14 Sep 2023 21:16:13 +0300
Message-ID: <20230914181704.4811-7-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230914181704.4811-1-laurent.pinchart@ideasonboard.com>
References: <20230914181704.4811-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The subdev .s_stream() operation shall not be called to start streaming
on an already started subdev, or stop streaming on a stopped subdev.
Remove the check that guards against that condition.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx219.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index a1136fdfbed2..5715bbbc0820 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -979,9 +979,6 @@ static int imx219_set_stream(struct v4l2_subdev *sd, int enable)
 
 	state = v4l2_subdev_lock_and_get_active_state(sd);
 
-	if (imx219->streaming == enable)
-		goto unlock;
-
 	if (enable) {
 		/*
 		 * Apply default & customized values
-- 
Regards,

Laurent Pinchart

