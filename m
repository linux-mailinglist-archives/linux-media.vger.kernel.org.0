Return-Path: <linux-media+bounces-56481-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qO34NOADvWkO5gIAu9opvQ
	(envelope-from <linux-media+bounces-56481-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 09:22:56 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DF82D7259
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 09:22:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 84BA13040A96
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 08:16:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBF50371895;
	Fri, 20 Mar 2026 08:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bnt56wvu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723AC371862
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 08:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773994560; cv=none; b=ZrJ1yYe3UuhJ00duhlBW9VaKvjeoHVo2Pb66WGRJzkXTlCb8xcWawgSKoIrTSu21GefX3bAdhjW4xd54vZ7nkJYI91y73Xhvcc/HlvJZbkObB5A+dXxUvSkdqRgpBjYt4LfOP2Mm2JINckbSRw+7i1HcEi5u7F9AcB+s/l+E3v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773994560; c=relaxed/simple;
	bh=Ht8Ca3bvCpwea0dISBMHeU5SIbAdHxxBCs6iEdJ+oc4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZyOlc3HK+nvWNS/BsSVUKUa9euSwyBNTIwH8LvuGdr36p+8ZgMvskdGVyEVeGFAQMb4B2HmVjvQnB5lvdCNSWfLiu+KZ/bDhOz2tk/FJ7Ad9zftmmQXIR8/80d4REacDPzpgUL2lihCSWJqUBmen5dn/6frXixUsiTgkcPhbDek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bnt56wvu; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-82a67ce6969so1294673b3a.1
        for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 01:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773994558; x=1774599358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FymbYBabUVFHOjTwlZbzKKh/jGsvG1YlqLzH42ljfg0=;
        b=bnt56wvuTBcnu6k3vyGuaXrqAWVzKc0ys4RtMOuGtBNIE7xFL+I8JuKRUsO7trLfed
         3BfY4zaYDn+1UtLK+GNcYTvul/m5Fx2qwOqNfm3I4RhHI2MeB6SGJ24JKO2uR9nWHfvd
         Afn/UNymi60LQatnRIXaMd8/cyGVnzCXyl22OcDrrszWuvjaZR8gdgskSXYM1J9eG4fJ
         3ZpOcrRfMPRLYyrYu2zyDaEir0rVReWSbc0lsHGZXOWBMtzj+EJTFGiujvoVV9aHMo1j
         Iz1hyI5gS+ZscmdAPV+foniAJVGWXtKFpU6sHDdBwLUgLOsPSKwGBmh7ZYL08eUZNk4h
         fREA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773994558; x=1774599358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FymbYBabUVFHOjTwlZbzKKh/jGsvG1YlqLzH42ljfg0=;
        b=IKmJvCv51aJAxHbfvZKJMkyeYPIdFAwJrg9pZiaIIX3oTTuIhhuWvlo87Kmr5Ejawb
         IYF3Qvwhh6JMAkTIsP/jCy0KRz/PkgwxeQ1hB/qzgtEaB6o4bnYT1ZwYIDCum67HMs1a
         LWqkY7/OYYMDqhUsLdg6zDoaYxc+CKrLPLxwcOrxSatdupHGtw0peqqe6NNWZdatlGUB
         pScS937+O2dsET4McchPJ37qGQD4JRavpkHGxmlfkDBK2e8udR9oz3fK8Y70RcGATm7T
         0s0k5YkR0x3Yspou2En6PR8Nu4FbDaz7hbuT4dGx+fAIU7uFHoFzHywbGCGb3PDmMOsR
         MLDw==
X-Gm-Message-State: AOJu0YxmuM/5aRYCnMUynmqSZWeGm4+glhXmgNcMAMjf5QQjTAfQJpSv
	MVvWfAMtxVZoZNE2XQUGgYpmLlAZL1N1uMo5oiChpHup47ImnT2B4vHF+gqa+fgX4OrJdcXs
X-Gm-Gg: ATEYQzx1zxOrUu9ed2lQAnh/CUQij/6MtujRU/JybCQsnjIVRdLmoU0SUR8arlguNXY
	tT2ZwMnidlUepY0cgWT9AsVHjTF996zaWwlS8F6BpCJ4iKOG2ooIdDp/uxDqsfK7FAY1iv4sHoE
	l87RobTgg4O8/EqLAL9JZYpUWTGXRSLoFmu5MsLh2/4/rfUfz/La/8jl/SZI6Y9dqPPkdYEvYQC
	uMfAUD1oc3jZXM2O93/OvZ6mAGt0nx6DCslM71wmA5WQyUhuF0l/t8jvu4Opsn863nUPOZ2K/uV
	9bf8+TqYiRXTUwEO+gXH6Ww1+7b9hIqzWjoSPndjijI8eEUh8idV8YV1llhcKG3oFgo8H5r+jUg
	C8eZLVkOUj9jP2F9i4+Jj7fzN9RFmcM4Mi6NZFMjgyuP7ZoRxBUK5CZMe7FM4Ghs65IQBGFgm8L
	U9iE2xiIcWCi6GATeCgg4lMbNh3nGDYgn/twocbHoaT4i96AZToChE5wajefpxY/Y1T5PqqsQHa
	cgzi2HixOLU7XQqh9p0aZo66WjkR045PVz10CP3
X-Received: by 2002:a05:6a00:2309:b0:82a:79b8:2049 with SMTP id d2e1a72fcca58-82a8c2389c7mr2018173b3a.25.1773994557680;
        Fri, 20 Mar 2026 01:15:57 -0700 (PDT)
Received: from CN4GKQDX76.bytedance.net ([61.213.176.57])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b03bbebb2sm1524048b3a.14.2026.03.20.01.15.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Mar 2026 01:15:56 -0700 (PDT)
From: Zile Xiong <xiongzile99@gmail.com>
To: Tomasz Figa <tfiga@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zile Xiong <xiongzile99@gmail.com>
Subject: [PATCH v2] media: vb2: use ssize_t for vb2_read/vb2_write
Date: Fri, 20 Mar 2026 16:15:45 +0800
Message-ID: <20260320081545.4624-1-xiongzile99@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260320065445.75351-1-xiongzile99@gmail.com>
References: <20260320065445.75351-1-xiongzile99@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-56481-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiongzile99@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.951];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,samsung.com:email]
X-Rspamd-Queue-Id: D6DF82D7259
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

vb2_read() and vb2_write() return size_t, but propagate
negative errno values from __vb2_perform_fileio() via
implicit signed/unsigned conversions in callers
(e.g. vb2_fop_read()), which is not obvious.

vb2_fop_read() and vb2_fop_write() already return ssize_t, so
using size_t for vb2_read(), vb2_write(), and
__vb2_perform_fileio() is inconsistent.

Switch these helpers to ssize_t so they can return either a byte
count or a negative error code.

Fixes: b25748fe6126 ("[media] v4l: videobuf2: add read() and write() emulator")
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Zile Xiong <xiongzile99@gmail.com>

v2:
- add Fixes tag (suggested by Marek Szyprowski)
---
 drivers/media/common/videobuf2/videobuf2-core.c | 6 +++---
 include/media/videobuf2-core.h                  | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index adf668b213c2..8a2b8156e9da 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -2990,7 +2990,7 @@ static int __vb2_cleanup_fileio(struct vb2_queue *q)
  * @nonblock:	mode selector (1 means blocking calls, 0 means nonblocking)
  * @read:	access mode selector (1 means read, 0 means write)
  */
-static size_t __vb2_perform_fileio(struct vb2_queue *q, char __user *data, size_t count,
+static ssize_t __vb2_perform_fileio(struct vb2_queue *q, char __user *data, size_t count,
 		loff_t *ppos, int nonblock, int read)
 {
 	struct vb2_fileio_data *fileio;
@@ -3154,14 +3154,14 @@ static size_t __vb2_perform_fileio(struct vb2_queue *q, char __user *data, size_
 	return ret;
 }
 
-size_t vb2_read(struct vb2_queue *q, char __user *data, size_t count,
+ssize_t vb2_read(struct vb2_queue *q, char __user *data, size_t count,
 		loff_t *ppos, int nonblocking)
 {
 	return __vb2_perform_fileio(q, data, count, ppos, nonblocking, 1);
 }
 EXPORT_SYMBOL_GPL(vb2_read);
 
-size_t vb2_write(struct vb2_queue *q, const char __user *data, size_t count,
+ssize_t vb2_write(struct vb2_queue *q, const char __user *data, size_t count,
 		loff_t *ppos, int nonblocking)
 {
 	return __vb2_perform_fileio(q, (char __user *) data, count,
diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index 4424d481d7f7..bf20bcb1d366 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -1093,7 +1093,7 @@ __poll_t vb2_core_poll(struct vb2_queue *q, struct file *file,
  * @ppos:	file handle position tracking pointer
  * @nonblock:	mode selector (1 means blocking calls, 0 means nonblocking)
  */
-size_t vb2_read(struct vb2_queue *q, char __user *data, size_t count,
+ssize_t vb2_read(struct vb2_queue *q, char __user *data, size_t count,
 		loff_t *ppos, int nonblock);
 /**
  * vb2_write() - implements write() syscall logic.
@@ -1103,7 +1103,7 @@ size_t vb2_read(struct vb2_queue *q, char __user *data, size_t count,
  * @ppos:	file handle position tracking pointer
  * @nonblock:	mode selector (1 means blocking calls, 0 means nonblocking)
  */
-size_t vb2_write(struct vb2_queue *q, const char __user *data, size_t count,
+ssize_t vb2_write(struct vb2_queue *q, const char __user *data, size_t count,
 		loff_t *ppos, int nonblock);
 
 /**
-- 
2.39.5


