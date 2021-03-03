Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73DC035173E
	for <lists+linux-media@lfdr.de>; Thu,  1 Apr 2021 19:41:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355639AbhCDAcO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Mar 2021 19:32:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243240AbhCCSJl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Mar 2021 13:09:41 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 773CBC061761
        for <linux-media@vger.kernel.org>; Wed,  3 Mar 2021 10:08:59 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id t9so724521ljt.8
        for <linux-media@vger.kernel.org>; Wed, 03 Mar 2021 10:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=rajw6Rc14+kU1U/M5vuMXcyz2slrUjYDEUD7gAw/A7Y=;
        b=wreU8Pqrg6IthBMBO/NrKTNm6ncKPxUvJadDselrtmsC8ITvSa8AuXWhAgGoU2U5iK
         twfCqHOO3VkzBCKTTsZC51ZKdTG2sMWzneNLK+GXUvh6fxgHFQssuUgs1CWNLFCmL1bW
         tOBoohgUqGANK8FsAWk4Gxmg+RK3wNf7/YvxXYq0Xm0zRgya9KPYlcs1935d1K4D2ZEs
         cuNDPvpBY6dv9WEnXgfp4HCj7LCX5aPE9CLyLREckzwwnyrpXwY2BzMvRmSg1jrwIAZW
         hvLDTAN17vuvCZe/tde3u+jNOZMHsfbD4XvLC46BKMyhKiqfs1k/liBgH0TBU1zSveBQ
         TXyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=rajw6Rc14+kU1U/M5vuMXcyz2slrUjYDEUD7gAw/A7Y=;
        b=JCwg05ogL0h3Kbd64XxAGNzl8mIrOYDE41knNRWl3bCSCdEmSbfY3m2Yvi/WmgnOdv
         St2UwN2X07m9I53Mp4bgCMr9jkeO6iPbkprADS+nYYT40gMcmYiaCgjlKNGdveWiXQDL
         MRbDlJ+58aQCXnUOPCScVRuIBTK6ZviZpdbv+h4li8oX+b60Pur7pG0Y9FV9q87iI1y/
         1L9NWJl+S3A9tO98fL25zO8CwzrIVScjydypd0UsOWFaaT/EyZYlptLNkbAPzG8ZSo+y
         d7pp6b5XSeh0V2jQXMqRtdU1zdIIHy5g3la00CP2v8k0G4Tks+y4+mmX6l/zY9IecWGa
         gyew==
X-Gm-Message-State: AOAM5315ArowSwdXQa13cgZOX1kfJ3ARbTlRGHO/w0AMMPaWWRCWtStP
        qCUacU9yTj7dMPcLMBcw+h2bTQ==
X-Google-Smtp-Source: ABdhPJxjekwmLVJEyZm4XcmULgzqSWlDhf10XGc910LCQLhzx8O2MmWVf1OGHO+jNgTU4NEAnjQBJQ==
X-Received: by 2002:a2e:b5a5:: with SMTP id f5mr93837ljn.336.1614794937981;
        Wed, 03 Mar 2021 10:08:57 -0800 (PST)
Received: from localhost.localdomain ([85.249.43.69])
        by smtp.googlemail.com with ESMTPSA id j15sm2220990lfm.138.2021.03.03.10.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 10:08:56 -0800 (PST)
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
To:     sakari.ailus@linux.intel.com, linux-media@vger.kernel.org,
        laurent.pinchart@ideasonboard.com
Cc:     mchehab@kernel.org, niklas.soderlund@ragnatech.se, bparrot@ti.com,
        mickael.guene@st.com,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [RFC PATCH 3/4] media: st-mipid02: use v4l2_get_link_freq() instead of the custom code
Date:   Wed,  3 Mar 2021 21:08:16 +0300
Message-Id: <20210303180817.12285-4-andrey.konovalov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210303180817.12285-1-andrey.konovalov@linaro.org>
References: <20210303180817.12285-1-andrey.konovalov@linaro.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

v4l2_get_link_freq() uses the same approach as the one implemented
in the current driver with mipid02_get_link_freq_from_cid_link_freq()
and mipid02_get_link_freq_from_cid_pixel_rate().

Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
---
 drivers/media/i2c/st-mipid02.c | 58 ++++++----------------------------
 1 file changed, 10 insertions(+), 48 deletions(-)

diff --git a/drivers/media/i2c/st-mipid02.c b/drivers/media/i2c/st-mipid02.c
index 7f07ef56fbbd..38bb18c48ac7 100644
--- a/drivers/media/i2c/st-mipid02.c
+++ b/drivers/media/i2c/st-mipid02.c
@@ -343,41 +343,6 @@ static int mipid02_detect(struct mipid02_dev *bridge)
 	return mipid02_read_reg(bridge, MIPID02_CLK_LANE_WR_REG1, &reg);
 }
 
-static u32 mipid02_get_link_freq_from_cid_link_freq(struct mipid02_dev *bridge,
-						    struct v4l2_subdev *subdev)
-{
-	struct v4l2_querymenu qm = {.id = V4L2_CID_LINK_FREQ, };
-	struct v4l2_ctrl *ctrl;
-	int ret;
-
-	ctrl = v4l2_ctrl_find(subdev->ctrl_handler, V4L2_CID_LINK_FREQ);
-	if (!ctrl)
-		return 0;
-	qm.index = v4l2_ctrl_g_ctrl(ctrl);
-
-	ret = v4l2_querymenu(subdev->ctrl_handler, &qm);
-	if (ret)
-		return 0;
-
-	return qm.value;
-}
-
-static u32 mipid02_get_link_freq_from_cid_pixel_rate(struct mipid02_dev *bridge,
-						     struct v4l2_subdev *subdev)
-{
-	struct v4l2_fwnode_endpoint *ep = &bridge->rx;
-	struct v4l2_ctrl *ctrl;
-	u32 pixel_clock;
-	u32 bpp = bpp_from_code(bridge->fmt.code);
-
-	ctrl = v4l2_ctrl_find(subdev->ctrl_handler, V4L2_CID_PIXEL_RATE);
-	if (!ctrl)
-		return 0;
-	pixel_clock = v4l2_ctrl_g_ctrl_int64(ctrl);
-
-	return pixel_clock * bpp / (2 * ep->bus.mipi_csi2.num_data_lanes);
-}
-
 /*
  * We need to know link frequency to setup clk_lane_reg1 timings. Link frequency
  * will be computed using connected device V4L2_CID_PIXEL_RATE, bit per pixel
@@ -386,21 +351,18 @@ static u32 mipid02_get_link_freq_from_cid_pixel_rate(struct mipid02_dev *bridge,
 static int mipid02_configure_from_rx_speed(struct mipid02_dev *bridge)
 {
 	struct i2c_client *client = bridge->i2c_client;
-	struct v4l2_subdev *subdev = bridge->s_subdev;
-	u32 link_freq;
-
-	link_freq = mipid02_get_link_freq_from_cid_link_freq(bridge, subdev);
-	if (!link_freq) {
-		link_freq = mipid02_get_link_freq_from_cid_pixel_rate(bridge,
-								      subdev);
-		if (!link_freq) {
-			dev_err(&client->dev, "Failed to get link frequency");
-			return -EINVAL;
-		}
+	s64 freq;
+
+	freq = v4l2_get_link_freq(bridge->s_subdev->ctrl_handler,
+				  bpp_from_code(bridge->fmt.code),
+				  2 * bridge->rx.bus.mipi_csi2.num_data_lanes);
+	if (freq < 0) {
+		dev_err(&client->dev, "Failed to get link frequency");
+		return -EINVAL;
 	}
 
-	dev_dbg(&client->dev, "detect link_freq = %d Hz", link_freq);
-	bridge->r.clk_lane_reg1 |= (2000000000 / link_freq) << 2;
+	dev_dbg(&client->dev, "detect link_freq = %lld Hz", freq);
+	bridge->r.clk_lane_reg1 |= (2000000000 / (u32)freq) << 2;
 
 	return 0;
 }
-- 
2.17.1

