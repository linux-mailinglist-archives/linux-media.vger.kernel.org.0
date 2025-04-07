Return-Path: <linux-media+bounces-29476-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F1DA7D972
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 11:22:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 541B81796DE
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 09:19:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA7DA22FAF4;
	Mon,  7 Apr 2025 09:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dMw6WtrZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9AA3233D9D;
	Mon,  7 Apr 2025 09:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744017389; cv=none; b=CqjPGHMQ/jDfsdoa8yoDmufuMCFzNAK7vEmbuHf6lvCDjH1VjnJXpRLyRmtFmgVBJ1omM7tAWA0WsEdI93av5FUCDXpeASzc+Vjh+tyUZLNiiYAJ6bhyUjRtWwwvi9EYIbheUUHBK24MHMWy3xn9z9FKIN3FweoBbuZ3Npo/BTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744017389; c=relaxed/simple;
	bh=gbLuga0FZZjtAkly5hHxlMYBYHJSgtjehSgZ3utF1WI=;
	h=From:To:Cc:Subject:Date:Message-Id; b=JaHReuK4YAflkC0AR8t7UeRTt3n9LynvzWcjO0qEJ4zSQKJv0rES7U32wATm0MwGhiMDuOT4mDU641TnWSEvKRMmNq9WugA/N2xCohv4AFlIxZ9FUHg5aY6e/nGxVbHBK7NsK0FhSXN9qrJSFNotIjo+MqxxhJL4BVA5LT8xZAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dMw6WtrZ; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-739be717eddso3027869b3a.2;
        Mon, 07 Apr 2025 02:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744017387; x=1744622187; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=swIVk5it6iZCkC8fcrmNeka/zWqDw9s3RoTa6zlBv7A=;
        b=dMw6WtrZvcYn5iGgszGc46mVO6z6fm0HWRHMuE+ssjVt6b/jlYWU3Uf8uTfpmp6+Qd
         75Qw+SplRljWWjOA2mYLt5ugLoGHuQp+qOraHiuFVQxoUSzb02jfVciV6Vlw9T+/E5Wv
         rP8tmZn1Ed6c1ShX3lMWR1Wfr+IlcMdOjFWWXWKQzoAPh1pecyiE98MoXiH+A9YctvxZ
         zhPkI+JS+6Y304Vj2/xCMN6rKnAVRHee/z+gqy82UWXtaOTRNfQmzie6H8rNaYY+TBv2
         SsfjKSw2VyIMf70SUHdwykAbgb512e1FBOaKvYVpHHoEWj6ozCE+1stVwJjLUbHWJ5+p
         WL8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744017387; x=1744622187;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=swIVk5it6iZCkC8fcrmNeka/zWqDw9s3RoTa6zlBv7A=;
        b=KxeDjI6GRQ05AsYbT2CIixTAeKWEdKAtShf9E3KOsSPDcsNsN/aKxdkji1L3Sp463P
         LjdNlicfBhiUaAf2i9YlVprTVtSn/ZSXYZZSje8P7i4jqBGIMJKxG+h0TLacwOlPyn3K
         ZRcqoTZch8+nIOqM6CpHBpDVLDroZliATwi3W1GikbTaJwkVYsZ/9MHAdZoQr+ifsy0y
         96bvXXIE5+1H8GmxRiCjBYu1x0JvxynS+eDM+/kLrI71K0U+DtRuypwb4Ff0pfYWQeiH
         2CKLnkTKF++V2PW43QjWlkklIWhpk/NtbclPTeDbT3VxEyuA8gk8zacXMTwqNR/Y1El3
         xxFg==
X-Forwarded-Encrypted: i=1; AJvYcCVMbaNmf/LS1h1vw/kLlOxPrY38UkAzPtXjdDZzqltdUPI+yg5guqCvBBzVOD3Q/FIofOVBWp8aQDWOfYc=@vger.kernel.org, AJvYcCWddj8FcVjdLoDiOtM/zzDKL4u7PrlVMuX88ch+DPcXpXJHG1L1rx9FiHfAjjvuk9pObsAIdxAZbMZ5Aos=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywil7r54J8Xqp3QGrJ0ZhHmSIHo0Up19zv60jM+bVpubcHij2OP
	ueu/UBaS/FEZpikqDJMq50xuJUK4vwpLD6ZY9x3IAx6Chim1EQjzE9iH3XRN3We4FQ==
X-Gm-Gg: ASbGncstrzLmCMA54MqizE3UJRMG7VWzHKYC/DWE3DZvtbg+VN36MgjsHSNU1NoAsia
	UC7HMqtnnOL5OelQm3c712Qu3sRMqAdfXz2GyEym4Rqx0Pf1lfQYDie+wneatZgzmbTAdqKf4Sd
	Bcp84rJuHRi6HaiCjl6ExWd2rj1EXHjwE7XEpPoU5k0fTie73JxJex1yec+EywF/0m12rL2aMdM
	nlrabSDiwN2raP/RWYW8ICUiR61uuhTb6XOGq6I0VNXuTOD/an9UmM1m+iqFSuT+IyOhr81ZQik
	ckzrKtGpI6BSHT7bVzIYYl7B5lZh6FRMl6648GZpYlDi0T6NqvTm/yK9l8knBIs9YZsArA==
X-Google-Smtp-Source: AGHT+IFlx2ii5NiEnBqPjdw7ftGPLVJqpiW1dr6kGdy4CZFhYl2QpRqsJYLGkW8nuzF5zNmBZNNMCQ==
X-Received: by 2002:a05:6a20:12d1:b0:1f5:5aac:f345 with SMTP id adf61e73a8af0-20113d54fa9mr12705388637.36.1744017386965;
        Mon, 07 Apr 2025 02:16:26 -0700 (PDT)
Received: from ubuntu.localdomain ([112.249.157.217])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc41a84bsm6837183a12.63.2025.04.07.02.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 02:16:26 -0700 (PDT)
From: Penglei Jiang <superman.xpt@gmail.com>
To: mchehab@kernel.org
Cc: standback@126.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+4e21d5f67b886a692b55@syzkaller.appspotmail.com,
	Penglei Jiang <superman.xpt@gmail.com>
Subject: [PATCH v2] media: dmxdev: fix repeated initialization of ringbuffer in dvb_dvr_open()
Date: Mon,  7 Apr 2025 02:16:19 -0700
Message-Id: <20250407091619.11250-1-superman.xpt@gmail.com>
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

Fixes: 34731df288a5f ("V4L/DVB (3501): Dmxdev: use dvb_ringbuffer")
Reported-by: syzbot+4e21d5f67b886a692b55@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/67917ed8.050a0220.15cac.02eb.GAE@google.com
Tested-by: Jianzhou Zhao <xnxc22xnxc22@qq.com>
Signed-off-by: Penglei Jiang <superman.xpt@gmail.com>
---
 drivers/media/dvb-core/dmxdev.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/media/dvb-core/dmxdev.c b/drivers/media/dvb-core/dmxdev.c
index 6063782e937a..55e73c96152a 100644
--- a/drivers/media/dvb-core/dmxdev.c
+++ b/drivers/media/dvb-core/dmxdev.c
@@ -113,6 +113,17 @@ static struct dmx_frontend *get_fe(struct dmx_demux *demux, int type)
 	return NULL;
 }
 
+static void dvb_ringbuffer_init_noqueue(struct dvb_ringbuffer *ringbuffer,
+				void *data, size_t len)
+{
+	ringbuffer->pread = 0;
+	ringbuffer->pwrite = 0;
+	ringbuffer->data = data;
+	ringbuffer->size = len;
+	ringbuffer->error = 0;
+	spin_lock_init(&ringbuffer->lock);
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
+		dvb_ringbuffer_init_noqueue(&dmxdev->dvr_buffer, mem,
+					DVR_BUFFER_SIZE);
 		if (dmxdev->may_do_mmap)
 			dvb_vb2_init(&dmxdev->dvr_vb2_ctx, "dvr",
 				     file->f_flags & O_NONBLOCK);
-- 
2.17.1


