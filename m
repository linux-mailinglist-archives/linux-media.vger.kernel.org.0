Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 327BE7A0C8E
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 20:18:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241570AbjINSSF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 14:18:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241555AbjINSSD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 14:18:03 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C843F1FD5
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 11:17:59 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D89A18816;
        Thu, 14 Sep 2023 20:16:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694715386;
        bh=qslNILaKOnRvbCsTd1TwATChMiIMLXXmJ8G9J7lOJNE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VDXHEMPyUs9rc/IScXYLtW+x3T+PUfTc/O25aytL3DdVHNXXFZYiSO4b9zX/aQlXT
         sVb+06SLK6UyJ4h+YczWCELQsT/W3JvYwYEd0g/vJSLNgcz1+22Qm61K46KK2ZkLIy
         FwtpBLCE5RFVA2xNRd4j18kGwNoKMqF6jD09JL+c=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH 48/57] media: i2c: ov02a10: Drop system suspend and resume handlers
Date:   Thu, 14 Sep 2023 21:16:55 +0300
Message-ID: <20230914181704.4811-49-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230914181704.4811-1-laurent.pinchart@ideasonboard.com>
References: <20230914181704.4811-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Stopping streaming on a camera pipeline at system suspend time, and
restarting it at system resume time, requires coordinated action between
the bridge driver and the camera sensor driver. This is handled by the
bridge driver calling the sensor's .s_stream() handler at system suspend
and resume time. There is thus no need for the sensor to independently
implement system sleep PM operations. Drop them.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ov02a10.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/i2c/ov02a10.c b/drivers/media/i2c/ov02a10.c
index 741d977a76f3..848e47a464ac 100644
--- a/drivers/media/i2c/ov02a10.c
+++ b/drivers/media/i2c/ov02a10.c
@@ -570,8 +570,6 @@ static int ov02a10_s_stream(struct v4l2_subdev *sd, int on)
 }
 
 static const struct dev_pm_ops ov02a10_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
 	SET_RUNTIME_PM_OPS(ov02a10_power_off, ov02a10_power_on, NULL)
 };
 
-- 
Regards,

Laurent Pinchart

