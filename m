Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6ADDD7A0C66
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 20:17:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241056AbjINSRN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 14:17:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240918AbjINSRM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 14:17:12 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AB0A1FFB
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 11:17:08 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 10C4787E0;
        Thu, 14 Sep 2023 20:15:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694715334;
        bh=Kd6IQSxFfMi1daX38YW4lZfPBrCgDpNEVa8SnoYw6N8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nF65WyVahXEQlhd07SEhtEuMh1i+gdm3V8/uF8u3fwFkmRmv8fICxoyP18qC4ZUiR
         6+cgFVf4IJoQw1udBuhUyq9hSQiEiyzOqniuzFZjupjPdp8d9v9SPPzvYzljaIqsOa
         WnsJphI37XZkG8eFDZYnB8ri2juVzZdzdDtICL1Y=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Tianshu Qiu <tian.shu.qiu@intel.com>
Subject: [PATCH 11/57] media: i2c: imx355: Drop check for reentrant .s_stream()
Date:   Thu, 14 Sep 2023 21:16:18 +0300
Message-ID: <20230914181704.4811-12-laurent.pinchart@ideasonboard.com>
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
 drivers/media/i2c/imx355.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 9c79ae8dc842..43c09941704e 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -1436,10 +1436,6 @@ static int imx355_set_stream(struct v4l2_subdev *sd, int enable)
 	int ret = 0;
 
 	mutex_lock(&imx355->mutex);
-	if (imx355->streaming == enable) {
-		mutex_unlock(&imx355->mutex);
-		return 0;
-	}
 
 	if (enable) {
 		ret = pm_runtime_resume_and_get(&client->dev);
-- 
Regards,

Laurent Pinchart

