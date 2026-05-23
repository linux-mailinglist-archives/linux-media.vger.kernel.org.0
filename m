Return-Path: <linux-media+bounces-62677-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKRzGKjuEWpfsAYAu9opvQ
	(envelope-from <linux-media+bounces-62677-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 23 May 2026 20:15:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F055C04EA
	for <lists+linux-media@lfdr.de>; Sat, 23 May 2026 20:15:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 803C2301AB8A
	for <lists+linux-media@lfdr.de>; Sat, 23 May 2026 18:14:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 400323090C1;
	Sat, 23 May 2026 18:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QEC7+VqS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54661324B32
	for <linux-media@vger.kernel.org>; Sat, 23 May 2026 18:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779560092; cv=none; b=qmGHNkyKj/bAXjoIL9UzzscfIimmV1VUQ4FwPXB/rSBYdNeTkI7LJlwMEHHTkMsIOdenTxQbypvrOQaYF0crHkLjU4teCKoRR0yrL+dVQJg+ZZyrLHx+43/mamALEASBdadeCBCiQ0TaoidAQeTifwqYMUD7BJJ4a+NUKjkaYfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779560092; c=relaxed/simple;
	bh=mm5xjnozPR6r5jkIAcvDPU4KbucjiTawPGqvlrw3/Kc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hr/+HxXnMFT2AyHfVqzUkZGDzJ0DHK6KgW+kx7YDh1O0SX4XjMuN8zy2dgX8eFTZT7igT8MJrMKGjy/v1U2DPMxCuilr132QRtSMj0RGbuYtY9mHnwXndB6NA0JrOPvESA6/QewT+LxYndQ1iFvj1z075gOh8pgqestj9bLfuMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QEC7+VqS; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-44a044cb827so6253797f8f.0
        for <linux-media@vger.kernel.org>; Sat, 23 May 2026 11:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779560090; x=1780164890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PKrZA3SQ6hneCPeQUwipbEL8KL38eo+epb8OIzHcMbI=;
        b=QEC7+VqSx6/ImnjTGUnEN0N1GUTdFsb6mosbHAA+8PQBS00xAjx5p/j9mNjP+9NtYt
         8y1w/oQ0qylmGsQ3yiL/YByhN8BRu7bkNpy7pnHDsJpef3auF/RTSsL+OYPn+3pOqN7y
         KhsHN4oy4IpMR0T5eSmcsLRIhQTkb7+Eh6PV/Rqkwtu6kS3UDCIDLQ4jrkAL9+LrUE3Y
         5rjZz+4jwYs/evwwdk8ZjfanEw+wpsasi3KfEAHVnQhVd+qBAiLpgVMC3TByh892G4JL
         PPE7CO70JMj6Dg/ZMxsXfn2G1tY18cLCp0glkhIS9pDZqRewfbrzgFt8+r9gKP6LV262
         fpPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779560090; x=1780164890;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PKrZA3SQ6hneCPeQUwipbEL8KL38eo+epb8OIzHcMbI=;
        b=gqXDfrHmAijJG9cWL1RR+/8jWZs7F/ybXN4hpw/h7XBTK3qQTf1WBAfzycRThvViLb
         z7/v6C/zAzwYglsyMdVEBFB8IKIkw6pinEq2H61o+zElANz2dYJZI1Y15tlih936b0vZ
         2XDJYDKr83YmRbCyEzVzpL4h7ISJxSi0HkafUz3xBKnRujN8Ht4e3pCRsDHRA1rE6klV
         DKUFU6Do0S1QxY1d7rQxf8uxIwFINryg1mQRTcmbmga2RUaofQ7evUsfNmiw7y8xTuKO
         v80YA/3HS096kTvIJ8KNpUSXyGwYYafyYQGdDe1kGmjw5GJNNyRDvz8Rknhas0yOy1X4
         sg/A==
X-Forwarded-Encrypted: i=1; AFNElJ/UmytipLFVfCR6tngjykYnGW5/X8P6fX+KudEvzymDr+oSENVz6DQWFFnR/2xiXI5huNxJX7MuXv8AAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWpa5ahTW3qquvQWcUP+gzJXxpvhwxLRw4GeJrLIYBTjWHvhcC
	UXv0MtBAC3nrmQkHAPKXxL4Szo3CDxd5OELL/Mpc0EIs2LeXrDoXdHPG
X-Gm-Gg: Acq92OHyeqGyYIKbd6I5Y4PMhKs/DG8L3aNCAxoeGDqla0LtzH0Rj5fpLbL9WAbX55U
	Lxq5qp8q8kSWwmY3jzIXOJ/5NNnmsDTWwYRsAT0pJIayzYQ2Pqm1gi0lVOvknMeFCqDuXDfyWYB
	36wv23CDszHMCFaASRvBG/agIoGwUgNqJrmyDOja/w17BD4PEnRoTN+102/7XyuoSkoYKiM4e8W
	n+1SNYriXtn8nR8d0N+aZg08lkLs0z04LIVL4zCpK24U32StsMM8Xfqlx+vaKtwGCO2aj5JG5nC
	R8HtsNdtC0Qdl5S/73MvGYhOA4Rsa77lKZHoJZilMq8vaCmy+fLDT/uwi4tXsV2qMfbHSixHX9F
	GjM9jNH/G21komqsu6Vvamf/qSw4V7uopXNMGua6wYe/mxOliCCKQiRh/0iAc6xS3CjDaF3qTYo
	5DXM6xxhnEWDr/h/M0yj+cn3wv55bBtzE5sTmjl3c6pBqRymn8ISAGtAy5PK3CBIDCzbcUHZoQb
	7yg65yqCOE=
X-Received: by 2002:a05:6000:41fa:b0:45a:c0e1:37b with SMTP id ffacd0b85a97d-45eb389fdedmr13444344f8f.32.1779560089580;
        Sat, 23 May 2026 11:14:49 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d4850dsm13042447f8f.17.2026.05.23.11.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 11:14:49 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: gaoxiang17@xiaomi.com,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	syzbot+7f4987d0afb97dd090cb@syzkaller.appspotmail.com,
	David Carlier <devnexen@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] dma-buf: fix UAF in dma_buf_fd() tracepoint
Date: Sat, 23 May 2026 19:14:46 +0100
Message-ID: <20260523181446.69525-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[xiaomi.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,syzkaller.appspotmail.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62677-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnexen@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,7f4987d0afb97dd090cb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[syzkaller.appspot.com:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,appspotmail.com:email]
X-Rspamd-Queue-Id: B3F055C04EA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Once FD_ADD() returns, the fd is live in the file descriptor table
and a thread sharing that table can close() it before DMA_BUF_TRACE()
runs. The close drops the last reference, __fput() frees the dma_buf,
and the tracepoint then dereferences dmabuf to take dmabuf->name_lock
-- slab-use-after-free.

Split FD_ADD() back into get_unused_fd_flags() + fd_install() and
emit the tracepoint between them. While the fdtable slot is reserved
with a NULL file pointer, a racing close() returns -EBADF without
entering __fput(), so the dma_buf stays alive across the trace. Same
approach as commit 2d76319c4cbb ("dma-buf: fix UAF in dma_buf_put()
tracepoint").

This undoes the FD_ADD() conversion done in commit 34dfce523c90
("dma: convert dma_buf_fd() to FD_ADD()"); FD_ADD() has no place to
hook the tracepoint safely.

Reported-by: syzbot+7f4987d0afb97dd090cb@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=7f4987d0afb97dd090cb
Fixes: 281a22631423 ("dma-buf: add some tracepoints to debug.")
Cc: stable@vger.kernel.org # 7.0.x
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 drivers/dma-buf/dma-buf.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 71f37544a5c6..d504c636dc29 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -792,9 +792,13 @@ int dma_buf_fd(struct dma_buf *dmabuf, int flags)
 	if (!dmabuf || !dmabuf->file)
 		return -EINVAL;
 
-	fd = FD_ADD(flags, dmabuf->file);
+	fd = get_unused_fd_flags(flags);
+	if (fd < 0)
+		return fd;
+
 	DMA_BUF_TRACE(trace_dma_buf_fd, dmabuf, fd);
 
+	fd_install(fd, dmabuf->file);
 	return fd;
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_fd, "DMA_BUF");
-- 
2.53.0


