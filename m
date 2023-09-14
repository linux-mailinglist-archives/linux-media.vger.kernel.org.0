Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 430DD7A0C6A
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 20:17:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241084AbjINSRT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 14:17:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241031AbjINSRS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 14:17:18 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C31A1FF9
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 11:17:14 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 22CD32F6C;
        Thu, 14 Sep 2023 20:15:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694715340;
        bh=yO49RATq3ScftGSoJUGjwyYMuBS4C7Gx7HFr+hbxs7M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Gt407EreqEuTpNod626MMGFc+5O5FWEgJbE7Xlf7p130pE4JvPEui4ekP4cwSYXhg
         s1OuuAVrgg7uTWQE2T8yCYnP+ST8msySvOA/B8EeaQLXaBT1nDzVhGTLadwcGW1uyI
         XWnOUq/Bj7nlqF9jvjIAeVe78qc8rJbcJj97HDBA=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH 15/57] media: i2c: ov01a10: Drop check for reentrant .s_stream()
Date:   Thu, 14 Sep 2023 21:16:22 +0300
Message-ID: <20230914181704.4811-16-laurent.pinchart@ideasonboard.com>
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
 drivers/media/i2c/ov01a10.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
index 2b9e1b3a3bf4..b43c1c96f47b 100644
--- a/drivers/media/i2c/ov01a10.c
+++ b/drivers/media/i2c/ov01a10.c
@@ -672,8 +672,6 @@ static int ov01a10_set_stream(struct v4l2_subdev *sd, int enable)
 	int ret = 0;
 
 	state = v4l2_subdev_lock_and_get_active_state(sd);
-	if (ov01a10->streaming == enable)
-		goto unlock;
 
 	if (enable) {
 		ret = pm_runtime_resume_and_get(&client->dev);
-- 
Regards,

Laurent Pinchart

