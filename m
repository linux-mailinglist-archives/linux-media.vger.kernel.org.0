Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A38263D41B
	for <lists+linux-media@lfdr.de>; Wed, 30 Nov 2022 12:15:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233824AbiK3LPU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Nov 2022 06:15:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229805AbiK3LPS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Nov 2022 06:15:18 -0500
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.184])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36DF828E14
        for <linux-media@vger.kernel.org>; Wed, 30 Nov 2022 03:15:16 -0800 (PST)
X-KPN-MessageId: 492bb0b2-70a0-11ed-bd66-005056994fde
Received: from smtp.kpnmail.nl (unknown [10.31.155.6])
        by ewsoutbound.so.kpn.org (Halon) with ESMTPS
        id 492bb0b2-70a0-11ed-bd66-005056994fde;
        Wed, 30 Nov 2022 12:15:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=xs4all.nl; s=xs4all01;
        h=content-type:subject:from:to:mime-version:date:message-id;
        bh=q45LQM3PdG5WoNHX8NK6af2ejgpVZ/Klg8aNlOluThI=;
        b=kpbNTVrMHdKicddMfvs7IRcJQUYs600nNBIk3WGxCKvX4Sm/WWy8WY3jFMFmtxQ30osAB6Ozf7XnU
         X7GTY/z8gNHaoCtL3Wp83Z0A/aQV9FQaIAQHZacwfDd6GNh/zb8wlIaQcDdiN5FTNr/Qewgs0ScKHv
         3MdX759e0bTvUX9DwPKK55xrn9qSyoZ++c0ozluRV7VMhIIPWR2froakoXKtgiRGhyhiLlZJICJj4I
         v7huv1Y8zO1gkV+jNlVbRV8B6eQqJTsZmHqUc2c5eXPIaadqOq4uwgLP9o6AMcHulnF9oIZOKnPGgx
         ns+ru2JTIF7IZo2dEbqM9/XjQ4ind/g==
X-KPN-MID: 33|gT1f0TgzsPhkY5HSztCviiSOVgyAxVg3FpaN23is8p/xudLIid+TVOYemGd1HUB
 KPxdBCi9dUWIRxUt1Jqb3V9KpH0RFIAj4IqFaWi+nezg=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|foGTW+jVeF9MTu6Wybq2wwR8soqx5IjkOaOoUjJ7U2r/X6ULlyzhzVCI70+Q+yn
 M8AVI6TZsf4Bh5296cZ4aOw==
X-Originating-IP: 173.38.220.49
Received: from [10.47.77.219] (unknown [173.38.220.49])
        by smtp.xs4all.nl (Halon) with ESMTPSA
        id 42966873-70a0-11ed-ad2a-00505699772e;
        Wed, 30 Nov 2022 12:15:14 +0100 (CET)
Message-ID: <9e574d2c-e49f-6ad7-be5f-072cba18ae2b@xs4all.nl>
Date:   Wed, 30 Nov 2022 12:15:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] media: videobuf2-core: drop obsolete sanity check in
 __vb2_queue_free()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The sanity check in __vb2_queue_free() is obsolete ever since commit
f035eb4e976e ("[media] videobuf2: fix lockdep warning"). Remove it and
let __vb2_queue_free() return void.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 .../media/common/videobuf2/videobuf2-core.c   | 25 +++----------------
 1 file changed, 3 insertions(+), 22 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 2cb2a3b544a1..afe074ad604d 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -502,27 +502,11 @@ static void __vb2_free_mem(struct vb2_queue *q, unsigned int buffers)
  * related information, if no buffers are left return the queue to an
  * uninitialized state. Might be called even if the queue has already been freed.
  */
-static int __vb2_queue_free(struct vb2_queue *q, unsigned int buffers)
+static void __vb2_queue_free(struct vb2_queue *q, unsigned int buffers)
 {
 	unsigned int buffer;

-	/*
-	 * Sanity check: when preparing a buffer the queue lock is released for
-	 * a short while (see __buf_prepare for the details), which would allow
-	 * a race with a reqbufs which can call this function. Removing the
-	 * buffers from underneath __buf_prepare is obviously a bad idea, so we
-	 * check if any of the buffers is in the state PREPARING, and if so we
-	 * just return -EAGAIN.
-	 */
-	for (buffer = q->num_buffers - buffers; buffer < q->num_buffers;
-	     ++buffer) {
-		if (q->bufs[buffer] == NULL)
-			continue;
-		if (q->bufs[buffer]->state == VB2_BUF_STATE_PREPARING) {
-			dprintk(q, 1, "preparing buffers, cannot free\n");
-			return -EAGAIN;
-		}
-	}
+	lockdep_assert_held(&q->mmap_lock);

 	/* Call driver-provided cleanup function for each buffer, if provided */
 	for (buffer = q->num_buffers - buffers; buffer < q->num_buffers;
@@ -616,7 +600,6 @@ static int __vb2_queue_free(struct vb2_queue *q, unsigned int buffers)
 		q->memory = VB2_MEMORY_UNKNOWN;
 		INIT_LIST_HEAD(&q->queued_list);
 	}
-	return 0;
 }

 bool vb2_buffer_in_use(struct vb2_queue *q, struct vb2_buffer *vb)
@@ -798,10 +781,8 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
 		 * queued without ever calling STREAMON.
 		 */
 		__vb2_queue_cancel(q);
-		ret = __vb2_queue_free(q, q->num_buffers);
+		__vb2_queue_free(q, q->num_buffers);
 		mutex_unlock(&q->mmap_lock);
-		if (ret)
-			return ret;

 		/*
 		 * In case of REQBUFS(0) return immediately without calling
-- 
2.35.1

