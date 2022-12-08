Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E095D6469EC
	for <lists+linux-media@lfdr.de>; Thu,  8 Dec 2022 08:52:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229606AbiLHHwN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Dec 2022 02:52:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbiLHHwL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Dec 2022 02:52:11 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 022A03E097
        for <linux-media@vger.kernel.org>; Wed,  7 Dec 2022 23:52:11 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A2FEDB812A9
        for <linux-media@vger.kernel.org>; Thu,  8 Dec 2022 07:52:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B4ECC433C1
        for <linux-media@vger.kernel.org>; Thu,  8 Dec 2022 07:52:08 +0000 (UTC)
Message-ID: <7fb9a20a-4b11-89e9-db4f-5973f429d702@xs4all.nl>
Date:   Thu, 8 Dec 2022 08:52:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] media: go7007: don't modify q->streaming
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

The streaming state is maintained by the vb2 core, so drivers
must never change it themselves.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/usb/go7007/go7007-v4l2.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/media/usb/go7007/go7007-v4l2.c b/drivers/media/usb/go7007/go7007-v4l2.c
index b2edc4deaca3..13256565b034 100644
--- a/drivers/media/usb/go7007/go7007-v4l2.c
+++ b/drivers/media/usb/go7007/go7007-v4l2.c
@@ -404,16 +404,13 @@ static int go7007_start_streaming(struct vb2_queue *q, unsigned int count)
 	go->next_seq = 0;
 	go->active_buf = NULL;
 	go->modet_event_status = 0;
-	q->streaming = 1;
 	if (go7007_start_encoder(go) < 0)
 		ret = -EIO;
 	else
 		ret = 0;
 	mutex_unlock(&go->hw_lock);
-	if (ret) {
-		q->streaming = 0;
+	if (ret)
 		return ret;
-	}
 	call_all(&go->v4l2_dev, video, s_stream, 1);
 	v4l2_ctrl_grab(go->mpeg_video_gop_size, true);
 	v4l2_ctrl_grab(go->mpeg_video_gop_closure, true);
@@ -430,7 +427,6 @@ static void go7007_stop_streaming(struct vb2_queue *q)
 	struct go7007 *go = vb2_get_drv_priv(q);
 	unsigned long flags;

-	q->streaming = 0;
 	go7007_stream_stop(go);
 	mutex_lock(&go->hw_lock);
 	go7007_reset_encoder(go);
-- 
2.35.1

