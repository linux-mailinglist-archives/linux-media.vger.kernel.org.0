Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6C082C0EA7
	for <lists+linux-media@lfdr.de>; Mon, 23 Nov 2020 16:20:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389477AbgKWPTA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Nov 2020 10:19:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389472AbgKWPTA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Nov 2020 10:19:00 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0997AC0613CF;
        Mon, 23 Nov 2020 07:19:00 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id m9so14543645pgb.4;
        Mon, 23 Nov 2020 07:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KvAGWa51N1ldPtAHuumksuzzvbgBB+vz4HpNyK5XNq8=;
        b=pttiWk7G0OsNNoNv8H1HMCAtiHeFVHSupx1sVGn0yYKliUtOanYK43BTM8uhfU8Yoa
         bqjFxDC4XuX2bTORpq7EqNbhYvzlMwysVjqzi8huxyofGc6dFOfOh92+pHO6hv32cLk1
         9fJb0aGhbzLdUb6dXLW9xk2+oodCxxi3Aj1LSKNK0LUDsgNASYr8kcrY2e6UusPIv+XZ
         jcuW6eDcOrlrDOKb8fH2AFktWr/HAuD+XbUypAxPZ4ajvwSTjsYKmmE5qPOHMg+iP/hk
         iiLoGQRF+n265YM6nqDaB3ZQr0dHizcDLW2kZoZV+FjB55e6o2thyzpMUy3KDGQzFdDg
         mBLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KvAGWa51N1ldPtAHuumksuzzvbgBB+vz4HpNyK5XNq8=;
        b=ZePOa6BHXyZ9Ic9xhmoj9qxOj/b7g2KZf4UhgFagFY2OIreDmAgXa4adfUP/hwjGd2
         sCgYCgH0lWm/EfrZv59fFamOEkl8WbvKYEEAe57CkCr2m5zIokuw5xbNbTdT8YfI8mAf
         zLH+DNqM2kDFxorxpcBGGQS9lUoRkNnD0ZosoSLamo8lYThac86u2EFNQtTztKT3XzsO
         73U1V1AgMgiojJqrVzNkyrDIit6DWnrqAMrO8wfuH30xVqViwnn844LNFyPBzEc81Dol
         z76rwuWOcknS39L6QsbkwdUk8fsegXk+GuDyPTpl9WAwyg80L2p+jXUFD/gn3+ua5LZL
         6vnA==
X-Gm-Message-State: AOAM532psLS7GOF6TZl+2nKqGprY/XuJPs6p6wnXGI132lTNUT1axzl1
        sZG8u+Nu+fH98gPhTlOmA04=
X-Google-Smtp-Source: ABdhPJynR4MTzhD1DiVAdK4Yfghxd85RNfiZ1fk4IMivBLcmVO/ErCOnF8baIY/OINebwOPGjLxVew==
X-Received: by 2002:a63:4e24:: with SMTP id c36mr27514825pgb.171.1606144739596;
        Mon, 23 Nov 2020 07:18:59 -0800 (PST)
Received: from localhost.localdomain ([240d:1a:8f0:6c00:89cb:88d1:b6b2:3345])
        by smtp.gmail.com with ESMTPSA id r130sm5038399pfc.41.2020.11.23.07.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 07:18:58 -0800 (PST)
From:   Alexandre Courbot <gnurou@gmail.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alexandre Courbot <gnurou@gmail.com>
Subject: [PATCH v2 2/2] media: v4l2-mem2mem: always call poll_wait() on queues
Date:   Tue, 24 Nov 2020 00:18:43 +0900
Message-Id: <20201123151843.798205-3-gnurou@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201123151843.798205-1-gnurou@gmail.com>
References: <20201123151843.798205-1-gnurou@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

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

