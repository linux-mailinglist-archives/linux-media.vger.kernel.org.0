Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A748A7A0C6E
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 20:17:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241031AbjINSRY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 14:17:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241224AbjINSRX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 14:17:23 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5EAA1FF9
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 11:17:19 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D93FA2B62;
        Thu, 14 Sep 2023 20:15:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694715346;
        bh=rsrns4SSE7xgvtZZssKBNx0wF05+EB7MbaCpZr/7a+c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=T260aCaCs4on1rqF+MxrxucypfQa1gvDCo87PGF2qHDGDyJIzGQ20wn/DcRAaBabV
         sBnoMAFXqH5PVknNgVEL4src98paWBbu0zDnsIJWXREhlFa8qn/LJrWDv98DnVLpf8
         UQMMcBkL+QgtTPX5cgxj5EyZgWTFtgSXNbjMDEoE=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>, Arec Kao <arec.kao@intel.com>
Subject: [PATCH 19/57] media: i2c: ov13b10: Drop check for reentrant .s_stream()
Date:   Thu, 14 Sep 2023 21:16:26 +0300
Message-ID: <20230914181704.4811-20-laurent.pinchart@ideasonboard.com>
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
 drivers/media/i2c/ov13b10.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/media/i2c/ov13b10.c b/drivers/media/i2c/ov13b10.c
index dbc642c5995b..d191683a0826 100644
--- a/drivers/media/i2c/ov13b10.c
+++ b/drivers/media/i2c/ov13b10.c
@@ -1161,10 +1161,6 @@ static int ov13b10_set_stream(struct v4l2_subdev *sd, int enable)
 	int ret = 0;
 
 	mutex_lock(&ov13b->mutex);
-	if (ov13b->streaming == enable) {
-		mutex_unlock(&ov13b->mutex);
-		return 0;
-	}
 
 	if (enable) {
 		ret = pm_runtime_resume_and_get(&client->dev);
-- 
Regards,

Laurent Pinchart

