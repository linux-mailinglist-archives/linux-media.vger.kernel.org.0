Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8E72251B84
	for <lists+linux-media@lfdr.de>; Tue, 25 Aug 2020 16:56:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726876AbgHYO4j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Aug 2020 10:56:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726432AbgHYO4g (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Aug 2020 10:56:36 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36A67C061574;
        Tue, 25 Aug 2020 07:56:36 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id 31so4744720pgy.13;
        Tue, 25 Aug 2020 07:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9yMCaHmp4cULKelwr7/rTvnBSzzp/IipT4lI1Ln6q1k=;
        b=dqL5kMEC/wDFo3y/zE+V/5Y51Yg/4tszU8++qZUw2ew3CsDuPNFgbMALqbJDLIXy7a
         9TH/syC+BPT6fw7GtSKBvsSs24Q8BJaMLdU0EtuTfY8QA1s7E8wd0vPep8mk3/eeBknG
         98k615oKqkAXzX8w0NfZQkNqtuk3nvS1uWt6002+iSSH2qNHDkqw9DP9rDbhTdFhJrXm
         rpSjQw0zBji0NNLcWUfJjFsK7dIKRSgPLH1S2IGQg238lKdUhZSeSiHYMIxbKHfeAspZ
         a5+omodntiYdYb9F81XV7AdN6GYel4LuWLk+fERIBu/PMoaBwCP9F87zdcVi/GyY1eoz
         /Pyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9yMCaHmp4cULKelwr7/rTvnBSzzp/IipT4lI1Ln6q1k=;
        b=EPh6dtWIXyifhB66NAZp6V3mac3PC9ytcjVLeMEQpS9pIUMmlDLrW0yq33vWpm6TZ4
         JlNE7EhEJ46R5wuhVjKr0xeB2kV6YBhG27kbtfV67eHbNQPZtLk86nnRelWXi2jbpeXN
         Sc9YJw7LLY1+YSM2t3qPOvMZ7BZds8aSYKiK+hqAISS7j2H41hOAxlhLXCliQNN4MD28
         AsLCvQny62yIKpicv+tRE8A4zugwQjT7RgsLGy04GS68DW4KDEM5SIKhsvQBJL3XMrxn
         vIe/wqUSeFKuKYX6FUrFolih8WvExkqqkQzc9Jc/LQeBF71gskRPkT3B9obU2n61UjKw
         BqAA==
X-Gm-Message-State: AOAM5326LZWCOeXfS2Qo2C8f/mZoxsZ1xevhsN5ypwrs/qwnnOes6WgH
        LTqyzvW2Syt8bDqo5XK1hV0=
X-Google-Smtp-Source: ABdhPJwjCHgfAJe+ekjC1coErXMHlFieyDe++k53CpP+8spe9Mralb6S0UNz2c8Vf+/PlkySuEPz+g==
X-Received: by 2002:a17:902:ab92:: with SMTP id f18mr8072361plr.12.1598367395660;
        Tue, 25 Aug 2020 07:56:35 -0700 (PDT)
Received: from localhost.localdomain ([240d:1a:8f0:6c00:89cb:88d1:b6b2:3345])
        by smtp.gmail.com with ESMTPSA id a1sm4469959pgc.54.2020.08.25.07.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2020 07:56:34 -0700 (PDT)
From:   Alexandre Courbot <gnurou@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alexandre Courbot <gnurou@gmail.com>
Subject: [PATCH 1/2] media: v4l2-mem2mem: consider OUTPUT queue first when polling
Date:   Tue, 25 Aug 2020 23:55:55 +0900
Message-Id: <20200825145556.637323-2-gnurou@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200825145556.637323-1-gnurou@gmail.com>
References: <20200825145556.637323-1-gnurou@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If poll() is called on a m2m device with the EPOLLOUT event after the
last buffer of the CAPTURE queue is dequeued, any buffer available on
OUTPUT queue will never be signaled because v4l2_m2m_poll_for_data()
starts by checking whether dst_q->last_buffer_dequeued is set and
returns EPOLLIN in this case, without looking at the state of the OUTPUT
queue.

Fix this by checking the state of the OUTPUT queue before considering
that early-return case.

This also has the side-effect of bringing the two blocks of code dealing
with the CAPTURE queue next to one another, and saves us one spin
lock/unlock cycle, for what it's worth.

Signed-off-by: Alexandre Courbot <gnurou@gmail.com>
---
 drivers/media/v4l2-core/v4l2-mem2mem.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
index 95a8f2dc5341d..0d0192119af20 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
@@ -862,6 +862,15 @@ static __poll_t v4l2_m2m_poll_for_data(struct file *file,
 	     list_empty(&dst_q->queued_list)))
 		return EPOLLERR;
 
+	spin_lock_irqsave(&src_q->done_lock, flags);
+	if (!list_empty(&src_q->done_list))
+		src_vb = list_first_entry(&src_q->done_list, struct vb2_buffer,
+						done_entry);
+	if (src_vb && (src_vb->state == VB2_BUF_STATE_DONE
+			|| src_vb->state == VB2_BUF_STATE_ERROR))
+		rc |= EPOLLOUT | EPOLLWRNORM;
+	spin_unlock_irqrestore(&src_q->done_lock, flags);
+
 	spin_lock_irqsave(&dst_q->done_lock, flags);
 	if (list_empty(&dst_q->done_list)) {
 		/*
@@ -870,21 +879,11 @@ static __poll_t v4l2_m2m_poll_for_data(struct file *file,
 		 */
 		if (dst_q->last_buffer_dequeued) {
 			spin_unlock_irqrestore(&dst_q->done_lock, flags);
-			return EPOLLIN | EPOLLRDNORM;
+			rc |= EPOLLIN | EPOLLRDNORM;
+			return rc;
 		}
 	}
-	spin_unlock_irqrestore(&dst_q->done_lock, flags);
 
-	spin_lock_irqsave(&src_q->done_lock, flags);
-	if (!list_empty(&src_q->done_list))
-		src_vb = list_first_entry(&src_q->done_list, struct vb2_buffer,
-						done_entry);
-	if (src_vb && (src_vb->state == VB2_BUF_STATE_DONE
-			|| src_vb->state == VB2_BUF_STATE_ERROR))
-		rc |= EPOLLOUT | EPOLLWRNORM;
-	spin_unlock_irqrestore(&src_q->done_lock, flags);
-
-	spin_lock_irqsave(&dst_q->done_lock, flags);
 	if (!list_empty(&dst_q->done_list))
 		dst_vb = list_first_entry(&dst_q->done_list, struct vb2_buffer,
 						done_entry);
-- 
2.28.0

