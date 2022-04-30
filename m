Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C98C515B91
	for <lists+linux-media@lfdr.de>; Sat, 30 Apr 2022 10:50:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235750AbiD3IyG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 Apr 2022 04:54:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235259AbiD3Ix6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 Apr 2022 04:53:58 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3856626D
        for <linux-media@vger.kernel.org>; Sat, 30 Apr 2022 01:50:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6135560AE4
        for <linux-media@vger.kernel.org>; Sat, 30 Apr 2022 08:50:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C8CBC385AA;
        Sat, 30 Apr 2022 08:50:35 +0000 (UTC)
Message-ID: <ba4bca14-488f-94ea-48d9-e7343103c5aa@xs4all.nl>
Date:   Sat, 30 Apr 2022 10:50:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Eugen Hristev <eugen.hristev@microchip.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [RFC PATCHv2] vb2: add support for (un)prepare_streaming queue ops
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

Add support for two new (un)prepare_streaming queue ops that are called
when the user calls VIDIOC_STREAMON and STREAMOFF (or closes the fh).

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
This has only been compile tested. Eugen, can you try this with the
atmel-isc series?

The kerneldoc documentation in core.h can be better, but that's why this
is an RFC :-)

Changes since v1: fixed 'unbalanced' assignment in __vb2_queue_free,
replacing a ';' with '||'.
---
diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index b203c1e26353..7fd38fc4b9e2 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -544,6 +544,7 @@ static int __vb2_queue_free(struct vb2_queue *q, unsigned int buffers)
 	 */
 	if (q->num_buffers) {
 		bool unbalanced = q->cnt_start_streaming != q->cnt_stop_streaming ||
+				  q->cnt_prepare_streaming != q->cnt_unprepare_streaming ||
 				  q->cnt_wait_prepare != q->cnt_wait_finish;
 
 		if (unbalanced || debug) {
@@ -552,14 +553,18 @@ static int __vb2_queue_free(struct vb2_queue *q, unsigned int buffers)
 			pr_info("     setup: %u start_streaming: %u stop_streaming: %u\n",
 				q->cnt_queue_setup, q->cnt_start_streaming,
 				q->cnt_stop_streaming);
+			pr_info("     prepare_streaming: %u unprepare_streaming: %u\n",
+				q->cnt_prepare_streaming, q->cnt_unprepare_streaming);
 			pr_info("     wait_prepare: %u wait_finish: %u\n",
 				q->cnt_wait_prepare, q->cnt_wait_finish);
 		}
 		q->cnt_queue_setup = 0;
 		q->cnt_wait_prepare = 0;
 		q->cnt_wait_finish = 0;
+		q->cnt_prepare_streaming = 0;
 		q->cnt_start_streaming = 0;
 		q->cnt_stop_streaming = 0;
+		q->cnt_unprepare_streaming = 0;
 	}
 	for (buffer = 0; buffer < q->num_buffers; ++buffer) {
 		struct vb2_buffer *vb = q->bufs[buffer];
@@ -1991,6 +1996,9 @@ static void __vb2_queue_cancel(struct vb2_queue *q)
 	if (q->start_streaming_called)
 		call_void_qop(q, stop_streaming, q);
 
+	if (q->streaming)
+		call_void_qop(q, unprepare_streaming, q);
+
 	/*
 	 * If you see this warning, then the driver isn't cleaning up properly
 	 * in stop_streaming(). See the stop_streaming() documentation in
@@ -2102,6 +2110,10 @@ int vb2_core_streamon(struct vb2_queue *q, unsigned int type)
 		return -EINVAL;
 	}
 
+	ret = call_qop(q, prepare_streaming, q);
+	if (ret)
+		return ret;
+
 	/*
 	 * Tell driver to start streaming provided sufficient buffers
 	 * are available.
@@ -2109,16 +2121,20 @@ int vb2_core_streamon(struct vb2_queue *q, unsigned int type)
 	if (q->queued_count >= q->min_buffers_needed) {
 		ret = v4l_vb2q_enable_media_source(q);
 		if (ret)
-			return ret;
+			goto unprepare;
 		ret = vb2_start_streaming(q);
 		if (ret)
-			return ret;
+			goto unprepare;
 	}
 
 	q->streaming = 1;
 
 	dprintk(q, 3, "successful\n");
 	return 0;
+
+unprepare:
+	call_void_qop(q, unprepare_streaming, q);
+	return ret;
 }
 EXPORT_SYMBOL_GPL(vb2_core_streamon);
 
diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index 5468b633b9d2..623146476157 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -386,6 +386,9 @@ struct vb2_buffer {
  *			the buffer contents will be ignored anyway.
  * @buf_cleanup:	called once before the buffer is freed; drivers may
  *			perform any additional cleanup; optional.
+ * @prepare_streaming:	called once to prepare for 'streaming' state; this is
+ *			where validation can be done to verify everything is
+ *			okay to start streaming later. Optional.
  * @start_streaming:	called once to enter 'streaming' state; the driver may
  *			receive buffers with @buf_queue callback
  *			before @start_streaming is called; the driver gets the
@@ -405,6 +408,7 @@ struct vb2_buffer {
  *			callback by calling vb2_buffer_done() with either
  *			%VB2_BUF_STATE_DONE or %VB2_BUF_STATE_ERROR; may use
  *			vb2_wait_for_all_buffers() function
+ * @unprepare_streaming:called as counterpart to @prepare_streaming. Optional.
  * @buf_queue:		passes buffer vb to the driver; driver may start
  *			hardware operation on this buffer; driver should give
  *			the buffer back by calling vb2_buffer_done() function;
@@ -432,8 +436,10 @@ struct vb2_ops {
 	void (*buf_finish)(struct vb2_buffer *vb);
 	void (*buf_cleanup)(struct vb2_buffer *vb);
 
+	int (*prepare_streaming)(struct vb2_queue *q);
 	int (*start_streaming)(struct vb2_queue *q, unsigned int count);
 	void (*stop_streaming)(struct vb2_queue *q);
+	void (*unprepare_streaming)(struct vb2_queue *q);
 
 	void (*buf_queue)(struct vb2_buffer *vb);
 
@@ -641,8 +647,10 @@ struct vb2_queue {
 	u32				cnt_queue_setup;
 	u32				cnt_wait_prepare;
 	u32				cnt_wait_finish;
+	u32				cnt_prepare_streaming;
 	u32				cnt_start_streaming;
 	u32				cnt_stop_streaming;
+	u32				cnt_unprepare_streaming;
 #endif
 };
 
