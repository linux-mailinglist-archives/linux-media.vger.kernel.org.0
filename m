Return-Path: <linux-media+bounces-29439-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBD6A7CF0C
	for <lists+linux-media@lfdr.de>; Sun,  6 Apr 2025 18:59:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CEC03188CB3E
	for <lists+linux-media@lfdr.de>; Sun,  6 Apr 2025 16:59:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DAF1188006;
	Sun,  6 Apr 2025 16:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZQA4zdTM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFCC14A0B7;
	Sun,  6 Apr 2025 16:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743958757; cv=none; b=afrCiryYCnQGWSGwSOT1sMj/Umde7NbbA1nUb1cg2h8j9MuxVnl1YcPwMmC94sgxZAgcmQQOQkB9ecC3NLEiCTy19iI+T61CIaTvDX8TbJN6HKOFHJ6NNA5xhSqybbJoME2GHH8GlnzqgqzS7Oe1RyjOpwrO5CQtRxLz5tcdTLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743958757; c=relaxed/simple;
	bh=Z66dMnQi3a5PvQ6TbtZelRlImqy3TB1NuaLrN44CY4w=;
	h=From:To:Cc:Subject:Date:Message-Id; b=r3DMuxUqQfwfMLvpLsQkYynDkKg1Y7WThdur+PXRwDhMGu/Ga7BnKKk+v/LljrtD1Ni2NY9VLdT+fKvkl2bwvRcZK3cyPMDWieHhhxeZBvbdntm9JIM0YIo90HHUbd1oVMfbwVnSl03vzL8u9Vo7SbXLTLk5mlvq6o0Nk7AKuSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZQA4zdTM; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-30185d00446so2853289a91.0;
        Sun, 06 Apr 2025 09:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743958755; x=1744563555; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=30Vo1WxI24wWL4NWbZE3a+oXaFHqvfDXuinNvvbo2Ks=;
        b=ZQA4zdTMn7pzQCyMrLoZACkewCvBuX+2qieQ89kW2pUH9R+vFu8ltTCvH5WmwGnFCe
         fat0ieCH8vez9OWxAx/n+aSVxkONDI1YcaLERQXO87DegeGwPBdinRSnxGJOZgCjFjpK
         R6PXKVRp0fkFiaVP4SgIlvnDn27wWXockK+DB3XPiWf1aIQUonVYNdAodkA24xvIuoRX
         Y1kKzHy88lNUTKHX5y1yi6EN37S3zw6Oa8Hfe25/6pj9alfdi8q68eVXNNJioMbqwmrA
         SkKQ6uBAj86ewVmlNxwDp2ccH3NIyxN8BZLMdZZ0P/Q35dggrvJfrmpCstpG88tnuyC8
         hX3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743958755; x=1744563555;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=30Vo1WxI24wWL4NWbZE3a+oXaFHqvfDXuinNvvbo2Ks=;
        b=Nj3fzQ9R7aSddnornelmOtmTL1ImR2PWc96M/yJEayPaHjJ8nFHQy4MAuz/SFh8P/P
         x/DYCanEzttHTzg1yf9DiIjZHcMTsufbGcAosgDBov3AKyRywYIOKhuDdBRq+IJVCGHx
         zT8l/+c7D3Da9vj8kqVJsM4UUbR7VaWLHn9woUYYWsnrh6DVAVnVe7eSi4UjqN2i63Hy
         71x7fKH7KaDnHrUvvxKQQgRN4FSjt/zqhjxjDghD0dzWiARawkAak2bT1OCusTKoo8Yv
         WCI9YpglPJWE1t2VCjJYofKZXLubVJ0dO+ikZnXa7Z2nFi3LtstgPGYMkgfRdALAWPvR
         bLBA==
X-Forwarded-Encrypted: i=1; AJvYcCVxplzHahe14Wx9SlqKp1Zf4eT5rOe65FZHCnFwWmafGjRip+GlsIdQRxsK8pRtOqnsDX/5UAEneZ9Msgo=@vger.kernel.org, AJvYcCXSjPtgA6M8Z2fXdctzOyXxM0SGqdBBr9RhgGkvEV1Sum3rDfq8Y9ENkMy3ab/d85WugefWWvEJPNkwHbA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGRob+xQiQI1cMExlzPnKGIsTTtd6P1YDK4iQeal7K8qAeQvFk
	TTXOMZzwZl6Mo7w9rm/ef3nbn8CHrdaPbqGsocYpvEkJxMRLeVdw
X-Gm-Gg: ASbGncvS73J9UigvhALtTS33nRwBzQGCiZZyMw5sV5aX2baerK5v8PH4+IEa41vPWeG
	AFbLXrBbay/mSgA7bgOJgXAQJR0gcDSnn+BshWVHi/ru2Qy0VKmkVWZR4wPv8MG8L9bHuDjhild
	0ZXczXZCaxD7reY8zFTWtjEZzzSbNUNTEWvPz4maBXWadb9fuFrYPdTt5gaaZJtbJY/ILeyznWD
	7VTBEYfZo1r5uSvu8AQOjqHH9PxsJOJjikpcYjzCNyRgwxVy+1TXvbnnw65FDSbGGqBGz9z3WKs
	btiCeS3vxUMo9JPhZedbW7kJtBqfajX6hbrPgnD+rLgAJpnWeAG3/mBiZuAJcUuWrORKYPhClZa
	nAenuwcNh
X-Google-Smtp-Source: AGHT+IEvrkncT+9f+FxbviphbN7Mwh5q+NsDoN4TkzX1YpjmY/QxkehPDbu+b7BMIKj4+p2xPlKcCQ==
X-Received: by 2002:a17:90a:d64e:b0:2fa:2268:1af4 with SMTP id 98e67ed59e1d1-3057a5c7bb9mr18921822a91.7.1743958755236;
        Sun, 06 Apr 2025 09:59:15 -0700 (PDT)
Received: from localhost.localdomain ([221.214.202.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785c01dasm65817195ad.83.2025.04.06.09.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 09:59:14 -0700 (PDT)
From: Penglei Jiang <superman.xpt@gmail.com>
To: mchehab@kernel.org
Cc: standback@126.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Penglei Jiang <superman.xpt@gmail.com>
Subject: [PATCH] media: dmxdev: fix repeated initialization of ringbuffer in dvb_dvr_open()
Date: Sun,  6 Apr 2025 09:58:02 -0700
Message-Id: <20250406165802.100305-1-superman.xpt@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

The dvb_dvr_open() function has an issue where it repeatedly
initializes the data and queue fields of the dvb_ringbuffer.
We should not reinitialize the queue field in the open function,
and if the data field is not empty, the initialization process
should be skipped.

Reported-by: syzbot+4e21d5f67b886a692b55@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/67917ed8.050a0220.15cac.02eb.GAE@google.com
Tested-by: Jianzhou Zhao <xnxc22xnxc22@qq.com>
Signed-off-by: Penglei Jiang <superman.xpt@gmail.com>
---
 drivers/media/dvb-core/dmxdev.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/media/dvb-core/dmxdev.c b/drivers/media/dvb-core/dmxdev.c
index 6063782e937a..82fd060430cd 100644
--- a/drivers/media/dvb-core/dmxdev.c
+++ b/drivers/media/dvb-core/dmxdev.c
@@ -113,6 +113,17 @@ static struct dmx_frontend *get_fe(struct dmx_demux *demux, int type)
 	return NULL;
 }
 
+static void dvb_ringbuffer_init_noqueue(struct dvb_ringbuffer *ringbuffer,
+		void *data, size_t len)
+{
+	ringbuffer->pread = 0;
+	ringbuffer->pwrite = 0;
+	ringbuffer->data = data;
+	ringbuffer->size = len;
+	ringbuffer->error = 0;
+	spin_lock_init(&(ringbuffer->lock));
+}
+
 static int dvb_dvr_open(struct inode *inode, struct file *file)
 {
 	struct dvb_device *dvbdev = file->private_data;
@@ -156,7 +167,7 @@ static int dvb_dvr_open(struct inode *inode, struct file *file)
 		}
 	}
 
-	if (need_ringbuffer) {
+	if (need_ringbuffer && !dmxdev->dvr_buffer.data) {
 		void *mem;
 
 		if (!dvbdev->readers) {
@@ -168,7 +179,8 @@ static int dvb_dvr_open(struct inode *inode, struct file *file)
 			mutex_unlock(&dmxdev->mutex);
 			return -ENOMEM;
 		}
-		dvb_ringbuffer_init(&dmxdev->dvr_buffer, mem, DVR_BUFFER_SIZE);
+		dvb_ringbuffer_init_noqueue(
+			&dmxdev->dvr_buffer, mem, DVR_BUFFER_SIZE);
 		if (dmxdev->may_do_mmap)
 			dvb_vb2_init(&dmxdev->dvr_vb2_ctx, "dvr",
 				     file->f_flags & O_NONBLOCK);
-- 
2.17.1


