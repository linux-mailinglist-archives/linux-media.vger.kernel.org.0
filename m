Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E4637A0C63
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 20:17:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240986AbjINSRJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 14:17:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240905AbjINSRH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 14:17:07 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA9261FD5
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 11:17:03 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BC1212B62;
        Thu, 14 Sep 2023 20:15:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694715330;
        bh=orjNskgfVh2K6sL7WTQp/fyaXoUzq3W+8KeyYEqx8F0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bjpyiAne6Muq/7lLSoAaNIKmx2voJoZllxJybItgf6piM3C2T2dzEJRvUdEBiLVyh
         6mu5CNuRgdavBUeHRKrxRjo6jarSnWdKvSIDBTUx8HE/Yx31+ZJE/6sz4WPYu0o+Vg
         QMrLqCTmKwkwz643AL+k8bd1xqAjiEDFK6+WfHQY=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH 08/57] media: i2c: imx319: Drop check for reentrant .s_stream()
Date:   Thu, 14 Sep 2023 21:16:15 +0300
Message-ID: <20230914181704.4811-9-laurent.pinchart@ideasonboard.com>
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
 drivers/media/i2c/imx319.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/media/i2c/imx319.c b/drivers/media/i2c/imx319.c
index 52ebb096e107..935bcbacd62e 100644
--- a/drivers/media/i2c/imx319.c
+++ b/drivers/media/i2c/imx319.c
@@ -2166,10 +2166,6 @@ static int imx319_set_stream(struct v4l2_subdev *sd, int enable)
 	int ret = 0;
 
 	mutex_lock(&imx319->mutex);
-	if (imx319->streaming == enable) {
-		mutex_unlock(&imx319->mutex);
-		return 0;
-	}
 
 	if (enable) {
 		ret = pm_runtime_resume_and_get(&client->dev);
-- 
Regards,

Laurent Pinchart

