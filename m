Return-Path: <linux-media+bounces-50631-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5272BD1BE65
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 02:19:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 86A1A300B8AE
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 01:19:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2719267714;
	Wed, 14 Jan 2026 01:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hbl5O9X/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891B0261393
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 01:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768353566; cv=none; b=krheuQk+7sU0zgN1k/zdzuYIThxV9ChrDb/iZIA79oALSpfbSpRuDePLz/3I20gQmxHkzRuz3FETrY5Vw268aFgWhFngviFMvqWze07k8lQjR5LSrfzcQNVfBGqNfk8gGLjdGpzHHChSUTTGmHW4xITIctewYbXqPvJphBaPEgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768353566; c=relaxed/simple;
	bh=N1p38W0iVbak8+3zdvplZlrUgU+ik0XxFV04WIfsPNw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=CY0pKGg9dwn97g74ofd0GpqrG8LpU7EKsACaEKai7vLiMWLAFGtpIynO35Zcss0LxtKkLNEDLUpN38cXVWp/Ut2QEd/AiapxHX0Z6EKUct7fI3p8HKlXhLeIe+gSM96ywU2eNTAGKgH05DFVXaH1XGeL/vcky7FXSkYLu7Iabhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hbl5O9X/; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-29efd139227so56138505ad.1
        for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 17:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768353564; x=1768958364; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=dlOXF98nQWsAI+xBrlydKqrONWGhVbP1fEx5oYHqnV4=;
        b=Hbl5O9X/dJ+HddP8qyhJ15K+EM122ob2br/cCwQnKOrG8w6W3Q46rFEOx+3MWo4k/g
         MWDYniUt1MW8jYxQwrRLFph0NF9DV+DcEFTMnIsvT73ha4wP5vi7bPK7/K2crhpT42Rv
         Xl9Xy7LGoRCwqNzowC3f9VNdltKd0ic3+O2WZQk4AKzMqPQj5aj5ukahKBB3uw87kwLO
         9CzA2enH7suvCyqluP0NZKsjM99nNIRB8kwIP6Payq/FDC5kZstCSb2wVsLFBl9rOqGa
         JfOWIsTInLlLNwjGEQvn4a1vMPWHHbB5GSSVCZRX8y83w/EUIF9hTYWYEGJ6MTPhV4vA
         7yqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768353564; x=1768958364;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dlOXF98nQWsAI+xBrlydKqrONWGhVbP1fEx5oYHqnV4=;
        b=G/MoR+VadTNb6Tj+KiLvRGr24cSWd2Q96RxgxAZI+RocYalV++Hkj8wEYme5kVjuQI
         mk1VfFOxP/iKeVA7EWYnrkP1p29/6sO/tWBESu22N6mlXNWz2O3XHS0p20nw6XNYYd4f
         W6KbkKcRItor5LA+5OI/HALWb7DagdWdsc6GekstoY3ssmKrkpuUGfBttaA971MLaxSw
         eWC7oUIuo2n/pzQ47z1Dzk3uMYXLCZ0rxv2j7EyFd8tthtXXlplZ/BPFY3TUd90Beouz
         n7CXy15B99gCa0/MFtP+hgBM4UMZnM2DYdPkpgH38h6FFE0bPyI+LH1yUepLNyQPd0do
         0yAw==
X-Forwarded-Encrypted: i=1; AJvYcCXMhJTRq5iM222v4e3ssMDTp/nLt0A7qzKjw130UNJ3NSwxyW11Cd7lZbZD+MikqrXOYqXY0KFv/1nIFA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/Ge1/yEMnX5GHhvea8dL6zakUAR0gDv1+w2hlpOU2BJlR/rD1
	E4sjTzKyp10JB/DmczOKtEBFgIuvF/6C7e7iNQIvpgZ3XczYdvIt5/1M
X-Gm-Gg: AY/fxX5H7KC0zfSTB50QJNpWsv2VkxBl6IdRj+fBY7iJZ+vhYRHtdfMvtVWcGHUlOID
	erbodTYx6vsmuQsZfH/0DhlIrjMZgKqKZKIbGUegRoDzYzXmWuRJCGIOPOGva6JK4aB2R8vAdDt
	+t/B8FJf/Pt+NwdLxCV71tX4SQtSPtRe4cGqKmJqPELhKKwEfo3Kp6cnD0p+GgpEuTi3T48NVxP
	tr2nEW8yyhOWW9EbNLPR+vzJai4gFf1t/Fp+Ab+34GMQYD4KLF1AbddFj5htoAJpwSOT6n/Z/un
	oG0LQBI3Bvkf9OV8viS3YmtRYKc0MyCf9i72lECXdKfI2L6dnjPS5TeZMA3uGNsIylE8c4+JHRN
	aYlsvE6KfO1vPAWJ2JaH/ErYd5BUlXeE5TrwXl+7ceTjjtlN3WbngIDInXD8fB35TBE3y6U2Zhs
	E0d8cp
X-Received: by 2002:a17:902:c410:b0:29e:a615:f508 with SMTP id d9443c01a7336-2a599e23086mr9306655ad.28.1768353563768;
        Tue, 13 Jan 2026 17:19:23 -0800 (PST)
Received: from localhost ([2001:67c:1562:8007::aac:4468])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cb2e26sm208067015ad.48.2026.01.13.17.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 17:19:23 -0800 (PST)
Sender: AceLan Kao <acelan@gmail.com>
From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dma-buf: set SB_I_NOEXEC and SB_I_NODEV on dmabuf filesystem
Date: Wed, 14 Jan 2026 09:19:16 +0800
Message-ID: <20260114011917.241196-1-acelan.kao@canonical.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The VFS now warns if an inode flagged with S_ANON_INODE is located on a
filesystem that does not have SB_I_NOEXEC set. dmabuf inodes are
created using alloc_anon_inode(), which sets S_ANON_INODE.

This triggers a warning in path_noexec() when a dmabuf is mmapped, for
example by GStreamer's v4l2src element.

[   60.061328] WARNING: CPU: 2 PID: 2803 at fs/exec.c:125 path_noexec+0xa0/0xd0
...
[   60.061637]  do_mmap+0x2b5/0x680

The warning was introduced by commit 1e7ab6f67824 ("anon_inode: rework
assertions") which added enforcement that anonymous inodes must be on
filesystems with SB_I_NOEXEC set.

Fix this by setting SB_I_NOEXEC and SB_I_NODEV on the dmabuf filesystem
context, following the same pattern as commit ce7419b6cf23d ("anon_inode:
raise SB_I_NODEV and SB_I_NOEXEC") and commit 98f99394a104c ("secretmem:
use SB_I_NOEXEC").

Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
---
 drivers/dma-buf/dma-buf.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index a4d8f2ff94e46..dea79aaab10ce 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -221,6 +221,8 @@ static int dma_buf_fs_init_context(struct fs_context *fc)
 	if (!ctx)
 		return -ENOMEM;
 	ctx->dops = &dma_buf_dentry_ops;
+	fc->s_iflags |= SB_I_NOEXEC;
+	fc->s_iflags |= SB_I_NODEV;
 	return 0;
 }
 
-- 
2.51.0


