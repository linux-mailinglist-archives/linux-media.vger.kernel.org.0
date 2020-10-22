Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE556295E51
	for <lists+linux-media@lfdr.de>; Thu, 22 Oct 2020 14:24:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2898096AbgJVMY1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Oct 2020 08:24:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2898094AbgJVMY1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Oct 2020 08:24:27 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3873DC0613CE;
        Thu, 22 Oct 2020 05:24:27 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id c20so1032181pfr.8;
        Thu, 22 Oct 2020 05:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mU3eh4Lg22I3mBOuJIBbGT5xYfezVnGHYrxPpP/Dozs=;
        b=QbGzbjxlT72axsH1qC0qivAZ2Gbr+68FTgArAwE8Vdgp/HLrXroD5yoYhoEj9F7jXp
         DFnDOelbRQKAYm3jJpPWCiIPvg7RMB2LJFU89a+9IfUUG4lRWBhjgNJvXNpSDWwKDPPX
         NAUqNoQDwSyY0lyzU9FXqYIh1EB56QfbWHXWxlkogILc3ajA45KP4OsvgnBr5t0JcoBZ
         InKpKZRDKfn4rCHTuHQD99E3dls/ZrUo93uBFbdoN07v7Ty2LBWIt4YbAy8uj94kv5Hc
         3Hi3IfbpI1BcYJomhojmLsCvvo/sa1i9jjc4kPpKqWT/stwZAw9Oef0Lv0dM4Avnfbk2
         Cm/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mU3eh4Lg22I3mBOuJIBbGT5xYfezVnGHYrxPpP/Dozs=;
        b=VTyAcZ3Prgzj/h9qy4s6yviCVbSJXKEtIlM4z0ft2l5vaQTe6JQsghs+ZXMTb2zFkq
         iKrIFMA/ypa5JrGpbQiAOf00HG3g5OTogMmFRd6j7qkSUBZjZUhBCfUxPDdeJ2+Wez60
         T9k8s5v/LwOX1Fg1uzwasyLjGqOQxB/hAXG2JZ0JfNgca6YabNaNzzIm340px4yRzVqD
         hjoMdRbLskYtnEyCkA38ibOmQwNjwrpWPanmDkvZAqG3ggRQqgH6Xul/5OsW/14bGTW0
         DMSbCjp7Lm/usLiGuHXAHvUpVG3QEYo8D9ipbIbpSTC41n5IX1zaYSNS3qPtjAakIcSf
         34uA==
X-Gm-Message-State: AOAM5318M6ieAClacgTLMKBJCSvntqiyWycwziKzad6UAUxUDM/wcjCU
        WfkMenr1UObowwH9EbRLlCU=
X-Google-Smtp-Source: ABdhPJxJ8dx7pupAUvCFFxYmob0+Rspz7lUxS7uOgRkpDhGiBNPy+5Vr+5o7l5ERw9a5begnl+xRIw==
X-Received: by 2002:a05:6a00:2d5:b029:13c:1611:653b with SMTP id b21-20020a056a0002d5b029013c1611653bmr2291991pft.13.1603369466581;
        Thu, 22 Oct 2020 05:24:26 -0700 (PDT)
Received: from localhost.localdomain ([240d:1a:8f0:6c00:89cb:88d1:b6b2:3345])
        by smtp.gmail.com with ESMTPSA id e196sm2211922pfh.128.2020.10.22.05.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2020 05:24:25 -0700 (PDT)
From:   Alexandre Courbot <gnurou@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alexandre Courbot <gnurou@gmail.com>
Subject: [PATCH] media: v4l2-mem2mem: always call poll_wait() on queues
Date:   Thu, 22 Oct 2020 21:24:21 +0900
Message-Id: <20201022122421.133976-1-gnurou@gmail.com>
X-Mailer: git-send-email 2.29.0
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
I seem to be hitting all the polling corner cases recently! ^_^; This
time I was wondering why epoll_wait() never returned after I received
the first resolution change event from the vicodec stateful decoder.
This is why - please take a look!

 drivers/media/v4l2-core/v4l2-mem2mem.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
index b221b4e438a1..65476ef2879f 100644
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
@@ -922,9 +919,14 @@ __poll_t v4l2_m2m_poll(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
 		       struct poll_table_struct *wait)
 {
 	struct video_device *vfd = video_devdata(file);
+	struct vb2_queue *src_q = v4l2_m2m_get_src_vq(m2m_ctx);
+	struct vb2_queue *dst_q = v4l2_m2m_get_dst_vq(m2m_ctx);
 	__poll_t req_events = poll_requested_events(wait);
 	__poll_t rc = 0;
 
+	poll_wait(file, &src_q->done_wq, wait);
+	poll_wait(file, &dst_q->done_wq, wait);
+
 	if (req_events & (EPOLLOUT | EPOLLWRNORM | EPOLLIN | EPOLLRDNORM))
 		rc = v4l2_m2m_poll_for_data(file, m2m_ctx, wait);
 
-- 
2.29.0

