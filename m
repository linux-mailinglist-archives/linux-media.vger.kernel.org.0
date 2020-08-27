Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36B82254557
	for <lists+linux-media@lfdr.de>; Thu, 27 Aug 2020 14:50:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729236AbgH0MuT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Aug 2020 08:50:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729226AbgH0MuF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Aug 2020 08:50:05 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 636F6C061264;
        Thu, 27 Aug 2020 05:50:05 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id 31so3271091pgy.13;
        Thu, 27 Aug 2020 05:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iVn32/+h+GNmNnGq6KtcJdQuuDhMDx+GSH2Nqxq5Ye4=;
        b=GO2WK+lIUPKBfiaD+KHM4ryCclu5hEL1L4zER0rNcelUi4Jp2Y78WlacQCVbSt0OQo
         qnnLXN6uJskJw+aTo6NorhxcI/FZxNzqLZ3itv+riaMfjLIgUQ4Ee4dC4LCGjYXg4x04
         /N3wZ5XEj4mshoYoIH98rtgZQtCtYbNK0PCDc+7kHCDf2j30ZT+z2ihy+p/xWFGavcxJ
         Nqe4Ic+nuMv72BKEiYCCbQEaX/OmuD0Z2p41S5TCRjvf2IxbtkVGJMDdVaQBolCoNF/f
         hIqGmxWjPgIecgm87gg6zAkYe4t0u3NWguk81tbDwHYM+QwNw5S9i7FNxyP07ZrZdTtR
         wB3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iVn32/+h+GNmNnGq6KtcJdQuuDhMDx+GSH2Nqxq5Ye4=;
        b=B1FxUvlpXOZ9VxEnQtepQQGGwyeQlwExVrMvFs6476tQC/tCa4k9zXUu/hvzb58k/d
         htvLok2nfFZGRIXi246eB1YD8zxjUK5JRHcNn2FUjKlnrV+NTogLr4c0RFHweDxCuroM
         csWCjjiAfoaZsLMZMjPK86AA7mnBlaG9TOb82ZBbRQ3AuJgqF4b/k4hs4hmFjIPSCCOq
         eOyTaxioZXs/0uzVONlUzSvxNMvH2hP4iEebqdsIU9fd4nIfAHUj/Ed7k+/YtG7//kzz
         K88WuKwEd5mTtsk2rFPcXmQh945uz9sOB8QAtUVqAloZmzwavN9ZV4Kszislu9Vwv2s1
         DlTQ==
X-Gm-Message-State: AOAM530+z+tpAtZ2onUW78W0kZXm0XO6f9ihhTmSaVHHYV6JBZY7uRks
        fYWYzGis36lJDOWZ8Mldt9o=
X-Google-Smtp-Source: ABdhPJydRDtEc4n4v7dMkwEuLC2MUJVmJOEMp8QnJrq1Bg7Q38V6yCyaC5XstPdXR1gLlo+tJwBcoQ==
X-Received: by 2002:a62:4e09:: with SMTP id c9mr13204642pfb.223.1598532604887;
        Thu, 27 Aug 2020 05:50:04 -0700 (PDT)
Received: from localhost.localdomain ([240d:1a:8f0:6c00:89cb:88d1:b6b2:3345])
        by smtp.gmail.com with ESMTPSA id v18sm2947044pfu.15.2020.08.27.05.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 05:50:04 -0700 (PDT)
From:   Alexandre Courbot <gnurou@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alexandre Courbot <gnurou@gmail.com>
Subject: [PATCH v2 1/2] media: v4l2-mem2mem: always consider OUTPUT queue during poll
Date:   Thu, 27 Aug 2020 21:49:45 +0900
Message-Id: <20200827124946.328700-2-gnurou@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200827124946.328700-1-gnurou@gmail.com>
References: <20200827124946.328700-1-gnurou@gmail.com>
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

Fix this by not early returning so we keep checking the state of the
OUTPUT queue afterwards.

Signed-off-by: Alexandre Courbot <gnurou@gmail.com>
---
 drivers/media/v4l2-core/v4l2-mem2mem.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
index 95a8f2dc5341d..fe90c3c0e4128 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
@@ -868,10 +868,8 @@ static __poll_t v4l2_m2m_poll_for_data(struct file *file,
 		 * If the last buffer was dequeued from the capture queue,
 		 * return immediately. DQBUF will return -EPIPE.
 		 */
-		if (dst_q->last_buffer_dequeued) {
-			spin_unlock_irqrestore(&dst_q->done_lock, flags);
-			return EPOLLIN | EPOLLRDNORM;
-		}
+		if (dst_q->last_buffer_dequeued)
+			rc |= EPOLLIN | EPOLLRDNORM;
 	}
 	spin_unlock_irqrestore(&dst_q->done_lock, flags);
 
-- 
2.28.0

