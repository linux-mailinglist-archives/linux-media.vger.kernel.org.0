Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 177B463AA57
	for <lists+linux-media@lfdr.de>; Mon, 28 Nov 2022 15:03:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231256AbiK1ODm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Nov 2022 09:03:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232256AbiK1ODh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Nov 2022 09:03:37 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4427DB4BA
        for <linux-media@vger.kernel.org>; Mon, 28 Nov 2022 06:03:36 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DEC0461010
        for <linux-media@vger.kernel.org>; Mon, 28 Nov 2022 14:03:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB5ABC433D6;
        Mon, 28 Nov 2022 14:03:34 +0000 (UTC)
Message-ID: <0098f4fd-afe2-38ae-0b91-497d86a024f5@xs4all.nl>
Date:   Mon, 28 Nov 2022 15:03:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Content-Language: en-US
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] media: sun6i-csi: clarify return value, fix uninited variable
 and add missing static
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
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

This fixes three smatch warnings:

drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c:629:15: warning: 'enabled' may be used uninitialized [-Wmaybe-uninitialized]
drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c:439 sun6i_csi_bridge_s_stream() warn: missing error code 'ret'
drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c:682 sun6i_csi_bridge_notifier_bound() error: uninitialized symbol 'enabled'.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
index 86d20c1c35ed..ebfc870d2af5 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
@@ -415,8 +415,7 @@ static int sun6i_csi_bridge_s_stream(struct v4l2_subdev *subdev, int on)
 	struct sun6i_csi_bridge_source *source;
 	struct v4l2_subdev *source_subdev;
 	struct media_pad *remote_pad;
-	/* Initialize to 0 to use both in disable label (ret != 0) and off. */
-	int ret = 0;
+	int ret;

 	/* Source */

@@ -436,6 +435,7 @@ static int sun6i_csi_bridge_s_stream(struct v4l2_subdev *subdev, int on)

 	if (!on) {
 		v4l2_subdev_call(source_subdev, video, s_stream, 0);
+		ret = 0;
 		goto disable;
 	}

@@ -587,7 +587,7 @@ static const struct v4l2_subdev_pad_ops sun6i_csi_bridge_pad_ops = {
 	.set_fmt	= sun6i_csi_bridge_set_fmt,
 };

-const struct v4l2_subdev_ops sun6i_csi_bridge_subdev_ops = {
+static const struct v4l2_subdev_ops sun6i_csi_bridge_subdev_ops = {
 	.video	= &sun6i_csi_bridge_video_ops,
 	.pad	= &sun6i_csi_bridge_pad_ops,
 };
@@ -652,7 +652,7 @@ sun6i_csi_bridge_notifier_bound(struct v4l2_async_notifier *notifier,
 			     async_subdev);
 	struct sun6i_csi_bridge *bridge = &csi_dev->bridge;
 	struct sun6i_csi_bridge_source *source = bridge_async_subdev->source;
-	bool enabled;
+	bool enabled = false;
 	int ret;

 	switch (source->endpoint.base.port) {
