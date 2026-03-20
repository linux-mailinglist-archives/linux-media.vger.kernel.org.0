Return-Path: <linux-media+bounces-56475-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJRwBV3vvGme4gIAu9opvQ
	(envelope-from <linux-media+bounces-56475-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 07:55:25 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFA72D65D0
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 07:55:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C3362307838A
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 06:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FCEA358363;
	Fri, 20 Mar 2026 06:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TFDQjIhW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8569F2FC89C
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 06:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773989706; cv=none; b=HN3EDrzwplpd9hK4SWUYqg1Xg+n+h9hhtF9w4jCTULcviILu8V0L1ePlmZHJ+CZvPPRrF3XmVoHyZ+XVNv009gGq3rf9Oobgq3FlDP8LvcBTF9mK03jpeCarzPVMlR2tNhJk3EUDqjaqlXmFj6fI56fZ0/OV1O0Ygu2BwlVH1Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773989706; c=relaxed/simple;
	bh=uXLfWBJDoPAqsAKPllt+3NeX9xk1Fg8r36x1efbvFUA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KoUasR8gnJBuULH7KkFTAjYTIUde5cEhHdtXQDza+/4amM3DZTzgwB5/mQYIl38rcqZJe3peQIEtwrR3bz4/lvPMy2U8djiQC4r7dUhNQwa/XC2FULs18cNLzZMCKPGumzhGsUituuABSlIoGMzEYZgiTrlXt/fOVmqp1izRdPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TFDQjIhW; arc=none smtp.client-ip=209.85.216.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f67.google.com with SMTP id 98e67ed59e1d1-359fea895b5so1195063a91.0
        for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 23:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773989705; x=1774594505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JE3e8Ok253WLuIQMkkF5cVdS7DBSHkCSg6Us16Jdk5o=;
        b=TFDQjIhW3yXKtQ1VVaT9EXzNYfkuPwlJL2vkmspHJbHnLzedZH6pDL+ChAjAJxMtyM
         9lkzz5I19clCnlaE1FvfduZre6kK2ypvUcsijyECXYnb1bHBgsVOJYO0X6UUuEUKAenc
         jUyi3DGc34RgbYo6+vCObxdc8dXYpk+v3G2e7duQDKOYXCisGkdPJRa/xDXbFrnI67iu
         EgT/PLRP8noM/k/HgNmP4g9fQMeFFWcGZDZwzyGmaJ/+KW0GZysTONyCB6V+/IuiXW21
         e5BvJccYMIRaWhhxV21/3FvolbfppUPs907GcdckUqZdNW65piqZSEkBPxtwfIiuyFFj
         3NHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773989705; x=1774594505;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JE3e8Ok253WLuIQMkkF5cVdS7DBSHkCSg6Us16Jdk5o=;
        b=iYYlwEhj4aBV50n0fjaood71INlRluPw1jo7Yn9YRzcwsrGHpjkucttgmEq2hrepNu
         aBAy/ayAfwPoIMjZsT0t4VLTnNLCHc2p5ZqBA2qAuH1PZ8tr4SzV5WhqOsyWXZr1XNKQ
         2cFLLK3UUYnYpJSQJBIbD59ltyNoKblkl9frgnJU07cM9tVfbF469zgjPdYgv2Q0ui+z
         HZMHXdGhwnFlCdTa6ru17q3+CmT5yXisM3YoiAHp5wcPb3qR5BF1W7Y3MR99+Qu922O1
         rqFgoxQDi7PgY5pFLYcTAp17u/ldl5G8C1cbFU1w368U1v/zr6lQ8L5Q39KJQX5JjIa5
         ORUw==
X-Gm-Message-State: AOJu0Yw8Jr6jKqPGgXI3qVpHaKkOutlWt4zranRLTjgmz6TS+QmQTff+
	34TdP3/rE10/IDHfXORFgP5BNKDxtMhVR1Kf5bM25qdm51T0AJ5aQbiqbtpvPbIKIHyzHDzn
X-Gm-Gg: ATEYQzyxlwuT1XSCbNx9p0IaOBvmayHr0OMCpf6a5G4/QB/1YUnHGo2ggri43prEqpz
	YQXOx1eEWWLaZ7sDl1FmoF4GqCfu7ENcOVp4N98x7L7gpdGjgN69x/NTh380O5WZ1vltzSOu+gu
	wf4RpaquttvnC56B+t0eOAY76Z9Gv59kcrvH1BCCIwBr4VbbSYX8Zz+VU/82OAecSkp0P8ADwb4
	XGX4e+kMM+B75utLyx5lCD0y5ptwUe/zZ5uBScbYKlsF7EJoqNoB+TMbmwonH41spkNR9QI0x4O
	cUAsBCUIwCvp62QRjcLPpNtN8Zi9IwOvQd9OYU6jVWx25015P96RJn2E0akiWMylvNmuwGUCGfz
	qpTiHB1huOzFD/K6KCrd15opW6OZ210BIhrRauHO/RIJDkTYcj5AeJQclc4oha8p91TWzqlzS3b
	a02KRJzqMrXZNEh6z6wDMGJZT5uuDwlbOb7jBkMikFiriFiUChEEDK77YHqBvwmWW5eBLCmrqao
	0JncsmGHv7cQvNPop30MARJOcleYd3xOe4faIcA
X-Received: by 2002:a17:90b:3952:b0:35b:a7be:ae68 with SMTP id 98e67ed59e1d1-35bd2d34560mr1430310a91.30.1773989704739;
        Thu, 19 Mar 2026 23:55:04 -0700 (PDT)
Received: from CN4GKQDX76.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bc60eca2dsm4518420a91.11.2026.03.19.23.55.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Mar 2026 23:55:04 -0700 (PDT)
From: Zile Xiong <xiongzile99@gmail.com>
To: Tomasz Figa <tfiga@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zile Xiong <xiongzile99@gmail.com>
Subject: [RFC PATCH] media: vb2: use ssize_t for vb2_read/vb2_write
Date: Fri, 20 Mar 2026 14:54:45 +0800
Message-ID: <20260320065445.75351-1-xiongzile99@gmail.com>
X-Mailer: git-send-email 2.52.0
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-56475-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiongzile99@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.901];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8EFA72D65D0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

vb2_read() and vb2_write() return size_t, but propagate
negative errno values from __vb2_perform_fileio().

This relies on implicit signed/unsigned conversions in callers
(e.g. vb2_fop_read()) to recover error codes:

    __vb2_perform_fileio() -> -EINVAL
    vb2_read()             -> (size_t)-EINVAL
    vb2_fop_read()         -> -EINVAL

This relies on implicit conversions that are not obvious.

These helpers are exported (EXPORT_SYMBOL_GPL) and part of the
vb2 API, so changing their return type may affect existing users.

However, they conceptually follow read/write semantics, where
ssize_t is typically used to return either a byte count or a
negative error code.

Switch vb2_read() and vb2_write() to ssize_t, and update
__vb2_perform_fileio() accordingly.

This is an RFC to gather feedback.

Signed-off-by: Zile Xiong <xiongzile99@gmail.com>
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


