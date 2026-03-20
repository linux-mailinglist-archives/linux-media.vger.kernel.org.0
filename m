Return-Path: <linux-media+bounces-56512-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LtEAiQwvWmI7QIAu9opvQ
	(envelope-from <linux-media+bounces-56512-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 12:31:48 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF762D99CE
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 12:31:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B06A83000FD3
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 11:31:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60ECA3AC0DC;
	Fri, 20 Mar 2026 11:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MWFmlISx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A883AA4F1
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 11:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774006265; cv=none; b=ITvKsigPvnTPjMhbBDSyoXOV8cAW0TLtPVhuAyzCDFnF4uGH8mAB+UZJwlQL1R/wSk/6NBQmVfiHhSO3J5o0EG0KcEGnvIazTdeRLsN6gT6EqeMwoeohyd7BZ9o6vyrzUOQY8HVtqk2+SvFElkQt0hAztmCIvU6rOOrRkunxzEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774006265; c=relaxed/simple;
	bh=1tOeyqZYtOVZMgL6rtfBgjI0Fs7mG95dZldD/yZ0cZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E+r7xTqJ9EHUWx0a2frOltNw36+oXfm0oYp9NCXHqRMVF0yajyJSz9q2lH0Th0JS/AUtxEaqtlyJ28VMkdzdv/A50PuN/f9Iugz/ii8nnklKUmMOdc4gRuJO2b6iL+Npy2coMuMn2QkcryNsRXv0CAVC7R+EItOnHQ2HK52dHa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MWFmlISx; arc=none smtp.client-ip=209.85.216.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f67.google.com with SMTP id 98e67ed59e1d1-35b9fb3f57eso878048a91.2
        for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 04:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774006259; x=1774611059; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jEVxMvU1gGa8q35I1aiel0gWVBZz6xlYQzbFkoU47LE=;
        b=MWFmlISxhOJHPszS9t4aMT+L0p+970mJnJ9piTFnCxkzBicsTK+9ASL38MIWo/2MIZ
         sw8Pj0G7Dv0gC6ekr9NS953JYqwiqMoUmwVa1+l/szkMbjw1I0gZg7DAokVmkdCgzvfn
         MiMdO38D1UhD6BfgF8P4cI7kopUHJaPQ1/s5XIMuxBjlW2bYxmf7b/kGhVNjTK1vplFx
         5xeDXLIo96yA+M2v0u/8ILqU1Uz2adPOW7urbL7z/KbkxO1pKRfrUoMgCsioFe0fmUtU
         GOaBR/j8aB5Kr/8OeTEzTcA+OmR+Qu1zTZJCMEj/iYZk/35v6XiPMpKSGMpqi9uOf/yN
         tGXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774006259; x=1774611059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jEVxMvU1gGa8q35I1aiel0gWVBZz6xlYQzbFkoU47LE=;
        b=B0xdpvXEYfTed6Mu2+Aei/biomtZGJBFKhBQNqsBmt24F9tNN/rXzuWQp6W/2la9eS
         4D5A/5jlR3bkvoYJuGqtadXMSDtFNyQNzAR84BLfJf3+z95ebVryWIXUgJ3/pRSZtfk1
         fHTJsXX/VaQ6JHgxK3X8T+y1muXGdhRuStXEmR49jMcYmu4zCiOWRVmdAOPyA1zdfT++
         zQ8kTs/6RQ7UCBnMorZ/b22hnQTTtvormuzXpOmawcngA4lkx9yxkRppG1u/WrizS5Hh
         at7ZRD56/H+v73qpaTCDB1V8eVl1/oUydHC7Wcr+OHlNzBPcmWPoQJVPJXM1UjnXZKT0
         3lAA==
X-Gm-Message-State: AOJu0YwIk9FWih0zjhjw6NSHZ2sZa77F+iSinHgzV4X7I5mfz2sHGuEr
	E2ZwLEWNYs7P5HMBUmJfKsD9srgLnc6DTS2Ew1jHLJzmtC3Fd1Q8xfT+
X-Gm-Gg: ATEYQzyx36+QbNxuO9B7WH56ZebKsk6SIpFcgm8IhA+y/zoX937KlemptgbU2VVM5vI
	FWVwbVr8TKQ91/SzSpfWu5wg8BitRz9Ys/WnqVWwdCrKKTGs6UsdPGEebGRWb0DVPmPmcZSYd5a
	XrLY6dCwIIc0G1ehiQD4F2La3MX9s5YcCx6YVWh90jBNe0OawlTdSj6qG6ubErjSejxPDArH7Ww
	NlpNyeP6KNTU+pY1uEzz4JX9qOy4AH/ehrUxUK2ahNVQjV8RUJqNYeHfNannt/WgIm8x5wU5top
	43SW59v0xh9esO3NTYYQHI+UAU07Nh6p37hcRW1fqiAdED70+JnkMs0dLGLfLPl2/QPBBa3cvIP
	xtl5eCXZDG+QFntF207FuL8s3Mx85P9FPlvMpsJm+QaCGh6uJmBzGGcGf2xZGnG5wGu5L8E2uSC
	Net3hlVmI2u4riSg3m3EzDh5irrSICbzotZkeKs9NcL1geNZWJAFhO2Uq6D2MoxKfXr5BOo9I07
	rK5K7Jdq79lWkE4cEXtki627fZSNFCx38A=
X-Received: by 2002:a17:90b:5584:b0:359:fd50:e733 with SMTP id 98e67ed59e1d1-35bd2d34ae3mr1942896a91.31.1774006259038;
        Fri, 20 Mar 2026 04:30:59 -0700 (PDT)
Received: from CN4GKQDX76.bytedance.net ([61.213.176.57])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bd356d29esm1052261a91.4.2026.03.20.04.30.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Mar 2026 04:30:58 -0700 (PDT)
From: Zile Xiong <xiongzile99@gmail.com>
To: Tomasz Figa <tfiga@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Zile Xiong <xiongzile99@gmail.com>
Subject: [PATCH v3] media: vb2: use ssize_t for vb2_read/vb2_write
Date: Fri, 20 Mar 2026 19:30:52 +0800
Message-ID: <20260320113052.46989-1-xiongzile99@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260320081545.4624-1-xiongzile99@gmail.com>
References: <20260320081545.4624-1-xiongzile99@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56512-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiongzile99@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.961];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: BEF762D99CE
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
Cc: stable@vger.kernel.org
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Zile Xiong <xiongzile99@gmail.com>
---
v3:
- add Cc: stable@vger.kernel.org
- fix function argument alignment

v2:
- add Fixes tag
- clarify type consistency with vb2_fop_read/write
---
 drivers/media/common/videobuf2/videobuf2-core.c | 13 +++++++------
 include/media/videobuf2-core.h                  |  8 ++++----
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index adf668b213c2..d5c3d4d939aa 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -2990,8 +2990,9 @@ static int __vb2_cleanup_fileio(struct vb2_queue *q)
  * @nonblock:	mode selector (1 means blocking calls, 0 means nonblocking)
  * @read:	access mode selector (1 means read, 0 means write)
  */
-static size_t __vb2_perform_fileio(struct vb2_queue *q, char __user *data, size_t count,
-		loff_t *ppos, int nonblock, int read)
+static ssize_t __vb2_perform_fileio(struct vb2_queue *q, char __user *data,
+				    size_t count, loff_t *ppos,
+				    int nonblock, int read)
 {
 	struct vb2_fileio_data *fileio;
 	struct vb2_fileio_buf *buf;
@@ -3154,15 +3155,15 @@ static size_t __vb2_perform_fileio(struct vb2_queue *q, char __user *data, size_
 	return ret;
 }
 
-size_t vb2_read(struct vb2_queue *q, char __user *data, size_t count,
-		loff_t *ppos, int nonblocking)
+ssize_t vb2_read(struct vb2_queue *q, char __user *data, size_t count,
+		 loff_t *ppos, int nonblocking)
 {
 	return __vb2_perform_fileio(q, data, count, ppos, nonblocking, 1);
 }
 EXPORT_SYMBOL_GPL(vb2_read);
 
-size_t vb2_write(struct vb2_queue *q, const char __user *data, size_t count,
-		loff_t *ppos, int nonblocking)
+ssize_t vb2_write(struct vb2_queue *q, const char __user *data, size_t count,
+		  loff_t *ppos, int nonblocking)
 {
 	return __vb2_perform_fileio(q, (char __user *) data, count,
 							ppos, nonblocking, 0);
diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index 4424d481d7f7..4b4f4c15c53a 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -1093,8 +1093,8 @@ __poll_t vb2_core_poll(struct vb2_queue *q, struct file *file,
  * @ppos:	file handle position tracking pointer
  * @nonblock:	mode selector (1 means blocking calls, 0 means nonblocking)
  */
-size_t vb2_read(struct vb2_queue *q, char __user *data, size_t count,
-		loff_t *ppos, int nonblock);
+ssize_t vb2_read(struct vb2_queue *q, char __user *data, size_t count,
+		 loff_t *ppos, int nonblock);
 /**
  * vb2_write() - implements write() syscall logic.
  * @q:		pointer to &struct vb2_queue with videobuf2 queue.
@@ -1103,8 +1103,8 @@ size_t vb2_read(struct vb2_queue *q, char __user *data, size_t count,
  * @ppos:	file handle position tracking pointer
  * @nonblock:	mode selector (1 means blocking calls, 0 means nonblocking)
  */
-size_t vb2_write(struct vb2_queue *q, const char __user *data, size_t count,
-		loff_t *ppos, int nonblock);
+ssize_t vb2_write(struct vb2_queue *q, const char __user *data, size_t count,
+		  loff_t *ppos, int nonblock);
 
 /**
  * typedef vb2_thread_fnc - callback function for use with vb2_thread.
-- 
2.39.5


