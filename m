Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 068A067769E
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 09:45:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230230AbjAWIpz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 03:45:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230122AbjAWIpz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 03:45:55 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CDAC18A9A
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 00:45:54 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 33BD3B80BA1
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 08:45:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A481C433EF;
        Mon, 23 Jan 2023 08:45:51 +0000 (UTC)
Message-ID: <c12cfcc5-1d46-7b5f-4a27-f4cd52a1b885@xs4all.nl>
Date:   Mon, 23 Jan 2023 09:45:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH for v6.2] media: videobuf2: set q->streaming later
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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

Commit a10b21532574 ("media: vb2: add (un)prepare_streaming queue ops") moved
up the q->streaming = 1 assignment to before the call to vb2_start_streaming().

This does make sense since q->streaming indicates that VIDIOC_STREAMON is called,
and the call to start_streaming happens either at that time or later if
q->min_buffers_needed > 0. So q->streaming should be 1 before start_streaming
is called.

However, it turned out that some drivers use vb2_is_streaming() in buf_queue,
and if q->min_buffers_needed == 0, then that will now return true instead of
false.

So for the time being revert to the original behavior.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Fixes: a10b21532574 ("media: vb2: add (un)prepare_streaming queue ops")
---
diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index fc3758a5bc1c..53e495223ea0 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -2149,8 +2149,6 @@ int vb2_core_streamon(struct vb2_queue *q, unsigned int type)
 	if (ret)
 		return ret;

-	q->streaming = 1;
-
 	/*
 	 * Tell driver to start streaming provided sufficient buffers
 	 * are available.
@@ -2161,12 +2159,13 @@ int vb2_core_streamon(struct vb2_queue *q, unsigned int type)
 			goto unprepare;
 	}

+	q->streaming = 1;
+
 	dprintk(q, 3, "successful\n");
 	return 0;

 unprepare:
 	call_void_qop(q, unprepare_streaming, q);
-	q->streaming = 0;
 	return ret;
 }
 EXPORT_SYMBOL_GPL(vb2_core_streamon);
