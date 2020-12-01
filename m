Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2926A2CA304
	for <lists+linux-media@lfdr.de>; Tue,  1 Dec 2020 13:46:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387480AbgLAMpf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Dec 2020 07:45:35 -0500
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:40633 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728790AbgLAMpe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 1 Dec 2020 07:45:34 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id k51SkssSADuFjk51Xk2RYb; Tue, 01 Dec 2020 13:44:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1606826691; bh=yaK72aXZCzXgohnr5ja0NWya+CJblYdNgX23+aCm0kA=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=jyFRDw85teQ02+eQhrcheM7Q3508qHfUQuWDoX8M3Q/elteg97motY82WX46EPYkq
         s3V54YNrm4uoxX+UwSysZVHMA/c/aOlKrPAMFAeltHKHHETmyGnVa00MLiNUgx/VYN
         cPb7D9MYLLfzRNW2kFPdVKgrRlAOAGKZxdzMU9U49JkAiW/yR3z0KzdTN9VxWB1+yN
         23U67SWl/6Jbygg/rPVXtL9eoYV9HGhOZIFnAuhQEiQqPHsLs/i7SBApYSIgcUDM4v
         YgHUlqAV1XUi7fBi0VyWWzDs6mmH1o2DKvnX3H7zXv/Z7SYIA/Nw+vYzR+Jjh28Qe5
         ekbIeuHlVl7wQ==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Alexandre Courbot <gnurou@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCHv3 3/7] media: v4l2-mem2mem: always call poll_wait() on queues
Date:   Tue,  1 Dec 2020 13:44:42 +0100
Message-Id: <20201201124446.448595-4-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201201124446.448595-1-hverkuil-cisco@xs4all.nl>
References: <20201201124446.448595-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfEbbHtBtxZMg25ky9HguRnroC3luigL0X3xjmVl4YcEzAC4cF8zkGuoLHem70fyJetudArdmqSFaOjSG3F1c3boTMJIp10+2Z3Tv1K3d+QorJtFvji5A
 3rvHhZZTNh/UBzA0H62Vwq3RpvnXjrmfRFH6izGW5hR6qwAzJVmeDdkaMDdBDRrKH730cfzU7uh5GTd05hyx4yUwSZzQKnNw7SMBcI9a1bvAAMfoiL3OgdVy
 KOEVOj1M54FOx7LzFy3nZlkf9z1CftOh0jhDkTcDBu/jME171E/b8ZAOGza0/MVu
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Alexandre Courbot <gnurou@gmail.com>

do_poll()/do_select() seem to set the _qproc member of poll_table to
NULL the first time they are called on a given table, making subsequent
calls of poll_wait() on that table no-ops. This is a problem for mem2mem
which calls poll_wait() on the V4L2 queues' waitqueues only when a
queue-related event is requested, which may not necessarily be the case
during the first poll.

For instance, a stateful decoder is typically only interested in
EPOLLPRI events when it starts, and will switch to listening to both
EPOLLPRI and EPOLLIN after receiving the initial resolution change event
and configuring the CAPTURE queue. However by the time that switch
happens and v4l2_m2m_poll_for_data() is called for the first time,
poll_wait() has become a no-op and the V4L2 queues waitqueues thus
cannot be registered.

Fix this by moving the registration to v4l2_m2m_poll() and do it whether
or not one of the queue-related events are requested.

Signed-off-by: Alexandre Courbot <gnurou@gmail.com>
---
 drivers/media/v4l2-core/v4l2-mem2mem.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
index b221b4e438a1..e7f4bf5bc8dd 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
@@ -887,9 +887,6 @@ static __poll_t v4l2_m2m_poll_for_data(struct file *file,
 	src_q = v4l2_m2m_get_src_vq(m2m_ctx);
 	dst_q = v4l2_m2m_get_dst_vq(m2m_ctx);
 
-	poll_wait(file, &src_q->done_wq, wait);
-	poll_wait(file, &dst_q->done_wq, wait);
-
 	/*
 	 * There has to be at least one buffer queued on each queued_list, which
 	 * means either in driver already or waiting for driver to claim it
@@ -922,9 +919,21 @@ __poll_t v4l2_m2m_poll(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
 		       struct poll_table_struct *wait)
 {
 	struct video_device *vfd = video_devdata(file);
+	struct vb2_queue *src_q = v4l2_m2m_get_src_vq(m2m_ctx);
+	struct vb2_queue *dst_q = v4l2_m2m_get_dst_vq(m2m_ctx);
 	__poll_t req_events = poll_requested_events(wait);
 	__poll_t rc = 0;
 
+	/*
+	 * poll_wait() MUST be called on the first invocation on all the
+	 * potential queues of interest, even if we are not interested in their
+	 * events during this first call. Failure to do so will result in
+	 * queue's events to be ignored because the poll_table won't be capable
+	 * of adding new wait queues thereafter.
+	 */
+	poll_wait(file, &src_q->done_wq, wait);
+	poll_wait(file, &dst_q->done_wq, wait);
+
 	if (req_events & (EPOLLOUT | EPOLLWRNORM | EPOLLIN | EPOLLRDNORM))
 		rc = v4l2_m2m_poll_for_data(file, m2m_ctx, wait);
 
-- 
2.29.2

