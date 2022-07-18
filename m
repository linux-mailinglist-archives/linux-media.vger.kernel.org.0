Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77F8A5786FE
	for <lists+linux-media@lfdr.de>; Mon, 18 Jul 2022 18:09:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233477AbiGRQI6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Jul 2022 12:08:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230427AbiGRQI5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Jul 2022 12:08:57 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 612ABBC09
        for <linux-media@vger.kernel.org>; Mon, 18 Jul 2022 09:08:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2059BB81678
        for <linux-media@vger.kernel.org>; Mon, 18 Jul 2022 16:08:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C8D2C341C0;
        Mon, 18 Jul 2022 16:08:53 +0000 (UTC)
Message-ID: <815bc07c-20ef-86ba-1492-54c77afc7a1f@xs4all.nl>
Date:   Mon, 18 Jul 2022 18:08:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] media: sunxi: sun6i_mipi_csi2.c/sun8i_a83t_mipi_csi2.c:
 clarify error handling
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Both sun6i_mipi_csi2.c and sun8i_a83t_mipi_csi2.c have the same issue:
the comment before the ret = 0 assignment is incorrect, drop it and
always assign the result of the v4l2_subdev_call(..., 0) to ret.

In the disable label check for !on and set ret to 0 in that case.

This fixes two smatch warnings:

drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c:193 sun6i_mipi_csi2_s_stream() warn: missing error code 'ret'
drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c:225 sun8i_a83t_mipi_csi2_s_stream() warn: missing error code 'ret'

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 .../media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c | 7 ++++---
 .../sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c      | 7 ++++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
index 31e12f1506cb..a4e3f9a6b2ff 100644
--- a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
+++ b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
@@ -182,14 +182,13 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_subdev *subdev, int on)
 	unsigned int lanes_count =
 		csi2_dev->bridge.endpoint.bus.mipi_csi2.num_data_lanes;
 	unsigned long pixel_rate;
-	/* Initialize to 0 to use both in disable label (ret != 0) and off. */
-	int ret = 0;
+	int ret;
 
 	if (!source_subdev)
 		return -ENODEV;
 
 	if (!on) {
-		v4l2_subdev_call(source_subdev, video, s_stream, 0);
+		ret = v4l2_subdev_call(source_subdev, video, s_stream, 0);
 		goto disable;
 	}
 
@@ -281,6 +280,8 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_subdev *subdev, int on)
 	return 0;
 
 disable:
+	if (!on)
+		ret = 0;
 	phy_power_off(dphy);
 	sun6i_mipi_csi2_disable(csi2_dev);
 
diff --git a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c
index c82ede3ca0ff..d052ee77ef0a 100644
--- a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c
+++ b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c
@@ -214,14 +214,13 @@ static int sun8i_a83t_mipi_csi2_s_stream(struct v4l2_subdev *subdev, int on)
 	unsigned int lanes_count =
 		csi2_dev->bridge.endpoint.bus.mipi_csi2.num_data_lanes;
 	unsigned long pixel_rate;
-	/* Initialize to 0 to use both in disable label (ret != 0) and off. */
-	int ret = 0;
+	int ret;
 
 	if (!source_subdev)
 		return -ENODEV;
 
 	if (!on) {
-		v4l2_subdev_call(source_subdev, video, s_stream, 0);
+		ret = v4l2_subdev_call(source_subdev, video, s_stream, 0);
 		goto disable;
 	}
 
@@ -313,6 +312,8 @@ static int sun8i_a83t_mipi_csi2_s_stream(struct v4l2_subdev *subdev, int on)
 	return 0;
 
 disable:
+	if (!on)
+		ret = 0;
 	phy_power_off(dphy);
 	sun8i_a83t_mipi_csi2_disable(csi2_dev);
 
-- 
2.35.1

