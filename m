Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C72279075F
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2019 20:00:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727286AbfHPSAm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Aug 2019 14:00:42 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:41303 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726900AbfHPSAm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Aug 2019 14:00:42 -0400
Received: by mail-pg1-f193.google.com with SMTP id x15so3300103pgg.8;
        Fri, 16 Aug 2019 11:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=wATUQ5AhTqVsNORBNhI3H9hrgxCh4ZvalSiVwIYDNT0=;
        b=WOyQ3WS/UO5ayKgN7fhfS2CGPYMqEaBxODLrYtdL5AZTCzK//pmkhLJjk22WwH2EgH
         gQ1lP/Gx8XdKY5FYQzXzHFU8AiQbLcIHi6gQf2p9/kaHkJCKGjuWVzhzLgt+KQLvBPOs
         omInQTPSACaKEaoX36Wby+FrsUAd9a3z9Ia6aRuIdNpn4/CFhV/KJvtdQURuqYlGtf1b
         +Jlg4iGbyePWwUg0yElh+c8T5cAI5LWhSWEiT0p1YGts5ltHEnbgEAEdvdCeSgV7MGsn
         ehboJZbJ7egDKE56CG8e2UZ3gYx32ye3qu0T9cu2yfKDd2Gsqp2WCrq4wNp5UYuxiRwp
         gJqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=wATUQ5AhTqVsNORBNhI3H9hrgxCh4ZvalSiVwIYDNT0=;
        b=ZQeU6mK6pN63NM3gmgWSrvkrb4y/PrVlLYc9fJak6DyA+FSV+/x9siB2Mytj23wJvX
         Dz34CVYPo8TNCvMJlgtdDTQOINl5dH9W4PUc7yToJ5QPxpskD4feybgECZRt0tdl5x9h
         EPEM756VDrt37Xul7+2cCzn/pyFGBekRGQ4JL0gGhexuNunJA8ekwG6e45ZpN/8WuUv4
         MOxM396J8wnN/LxLmrvN5NgIa92GNFwv0xe8f0L8uZ9DcFAbYdyD9epW9qcg+tWWxPmA
         WxUVD9b4gLqrKIGcbv5nvfY+XfIs2hHWIQ+F7Ad7Z0b7KoFRKo/D2yW8Wh57S8muw/Wo
         KW0Q==
X-Gm-Message-State: APjAAAVnrktObuDyVwPq92KgndhUy2obbopUaQ4mnQpbzFt8YFxzqmJq
        VYs3wC+8Q+m+YiL7YueOeEs=
X-Google-Smtp-Source: APXvYqzg9EbcnjeIhLdeH5kFtiTthmbzOmZ7YYmw/QcVioc8vm7RaE1mqcqla5aXgXAhOFrNJ8Mu/w==
X-Received: by 2002:aa7:9638:: with SMTP id r24mr11489219pfg.68.1565978441649;
        Fri, 16 Aug 2019 11:00:41 -0700 (PDT)
Received: from bharath12345-Inspiron-5559 ([103.110.42.34])
        by smtp.gmail.com with ESMTPSA id 185sm11019906pff.54.2019.08.16.11.00.40
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 16 Aug 2019 11:00:41 -0700 (PDT)
From:   Bharath Vedartham <linux.bhar@gmail.com>
To:     sumit.semwal@linaro.org
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
        Bharath Vedartham <linux.bhar@gmail.com>
Subject: [PATCH] dma-buf: Fix memory leak in dma_buf_set_name
Date:   Fri, 16 Aug 2019 23:30:22 +0530
Message-Id: <1565978422-9661-1-git-send-email-linux.bhar@gmail.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch fixes a memory leak bug reported by syzbot. Link to the
bug is given at [1].

A local variable name is used to hold the copied user buffer string
using strndup_user. strndup_user allocates memory using
kmalloc_track_caller in memdup_user. This kmalloc allocation needs to be
followed by a kfree.

This patch has been tested by a compile test.

[1] https://syzkaller.appspot.com/bug?id=ce692a3aa13e00e335e090be7846c6eb60ddff7a

Reported-by: syzbot+b2098bc44728a4efb3e9@syzkaller.appspotmail.com
Signed-off-by: Bharath Vedartham <linux.bhar@gmail.com>
---
 drivers/dma-buf/dma-buf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index f45bfb2..9798f6d 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -342,6 +342,7 @@ static long dma_buf_set_name(struct dma_buf *dmabuf, const char __user *buf)
 	}
 	kfree(dmabuf->name);
 	dmabuf->name = name;
+	kfree(name);
 
 out_unlock:
 	mutex_unlock(&dmabuf->lock);
-- 
2.7.4

