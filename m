Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38B6C7DF481
	for <lists+linux-media@lfdr.de>; Thu,  2 Nov 2023 15:04:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376700AbjKBOEL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Nov 2023 10:04:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376579AbjKBOEL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Nov 2023 10:04:11 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27BF683
        for <linux-media@vger.kernel.org>; Thu,  2 Nov 2023 07:04:08 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8746BC433C8
        for <linux-media@vger.kernel.org>; Thu,  2 Nov 2023 14:04:07 +0000 (UTC)
Message-ID: <a6242ba9-9ee5-4bd6-92da-10fdd40513e6@xs4all.nl>
Date:   Thu, 2 Nov 2023 15:04:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] media: ivtv: don't call s_stream(0) if not streaming
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Recently a WARN_ON was added in v4l2-subdev.c to warn if s_stream was called
unnecessarily. The ivtv driver hits this once when it is loaded for the first
time. Add a bool to avoid this warning.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/pci/ivtv/ivtv-driver.h b/drivers/media/pci/ivtv/ivtv-driver.h
index ce3a7ca51736..e9871d648db7 100644
--- a/drivers/media/pci/ivtv/ivtv-driver.h
+++ b/drivers/media/pci/ivtv/ivtv-driver.h
@@ -619,6 +619,7 @@ struct ivtv {
 	u32 hw_flags;			/* hardware description of the board */
 	v4l2_std_id tuner_std;		/* the norm of the card's tuner (fixed) */
 	struct v4l2_subdev *sd_video;	/* controlling video decoder subdev */
+	bool sd_video_is_streaming;
 	struct v4l2_subdev *sd_audio;	/* controlling audio subdev */
 	struct v4l2_subdev *sd_muxer;	/* controlling audio muxer subdev */
 	resource_size_t base_addr;      /* PCI resource base address */
diff --git a/drivers/media/pci/ivtv/ivtv-streams.c b/drivers/media/pci/ivtv/ivtv-streams.c
index 13d7d55e6594..af9e6235c74d 100644
--- a/drivers/media/pci/ivtv/ivtv-streams.c
+++ b/drivers/media/pci/ivtv/ivtv-streams.c
@@ -623,10 +623,12 @@ int ivtv_start_v4l2_encode_stream(struct ivtv_stream *s)
 		/* Avoid tinny audio problem - ensure audio clocks are going */
 		v4l2_subdev_call(itv->sd_audio, audio, s_stream, 1);
 		/* Avoid unpredictable PCI bus hang - disable video clocks */
-		v4l2_subdev_call(itv->sd_video, video, s_stream, 0);
+		if (itv->sd_video_is_streaming)
+			v4l2_subdev_call(itv->sd_video, video, s_stream, 0);
 		ivtv_msleep_timeout(300, 0);
 		ivtv_vapi(itv, CX2341X_ENC_INITIALIZE_INPUT, 0);
 		v4l2_subdev_call(itv->sd_video, video, s_stream, 1);
+		itv->sd_video_is_streaming = true;
 	}

 	/* begin_capture */
