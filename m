Return-Path: <linux-media+bounces-51927-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFKTATKJf2mptAIAu9opvQ
	(envelope-from <linux-media+bounces-51927-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Feb 2026 18:11:14 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A06C6A31
	for <lists+linux-media@lfdr.de>; Sun, 01 Feb 2026 18:11:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AD7ED300915C
	for <lists+linux-media@lfdr.de>; Sun,  1 Feb 2026 17:10:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 804E6278753;
	Sun,  1 Feb 2026 17:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jIaHm2jB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2820258CD9
	for <linux-media@vger.kernel.org>; Sun,  1 Feb 2026 17:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769965856; cv=none; b=Ul0HUIks0d7iWzH0507xrCTYYVnzwKikEyndXukVVbnAMpfFeT2/B6FLzWIPv3CBC3T6hpBIS+ckdoA/MEpJo1x/xFtJ47/NWB1pss/T3eve5hQacipOLTbaReaPCzLv2O0KnGRtbFJzN1ljLUpkuom9Ys5rK44HKlwfI1VTbWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769965856; c=relaxed/simple;
	bh=IqXOmJBjm/ca3HDEihX+rtcdfBaG3yEMxjxvhM8LOIs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=pGWfH48cwNbrnn72Vd7Lx7djzgaqV2O484eL+EBW1P9QQvfBLLwiImxOpPkItwpwGn+1b1hdDbAxaZKwjbEfbFTn7UIv+fy2LxQadsn4yyFxcl1Q3VwmgQxcBLWL/riTByrCeAy0IEi2vYbPy1Z0lBai7FgJKiQllEkadUGPJWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jIaHm2jB; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-81e8b1bdf0cso2204944b3a.3
        for <linux-media@vger.kernel.org>; Sun, 01 Feb 2026 09:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769965854; x=1770570654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u54ua+qu21FHBsf3zLWVG9pnVP6xgcSXcYQSK/iMf0g=;
        b=jIaHm2jB99L0jaqdNmi4tZA2GNTfDtVc5uiz+E+jDxtmTQiB67gj0YkROFbDP1wuo0
         vaslkbCDmvq2mgLdCgF+WTIR5l8dFOw8eXlbVrKqcyCd1ncCcGfst9MK2Z1nqbO3SRgW
         64vQ1mhowu1MgmFEgvdZHm8pYsCrVLauDVQ0U3KeqDRWL+G+77Wn1Tz66KlTqPm8vvXM
         Vljf3msOuylWYNwJFfha/QP7ZhiEcGMWS+9eNhryI58fV3fU3wQBpIta310oxmNBEqV9
         auoaPvbNL+UuIa6iSmc2DjAz5R5YF/fw01pIRFrKBrUlgHcldrz5mVYb4VBAbAMg7lkN
         f8wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769965854; x=1770570654;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u54ua+qu21FHBsf3zLWVG9pnVP6xgcSXcYQSK/iMf0g=;
        b=iSY87lCfFjyStHfdYDAUkUTft99J90BffEppBdetvNVkeO+71oYP+o+1CR9YDgbnHE
         7S8CZWOO0Em1S6qdLFAxxjip8DMGhb9Fx8VnZUg8pEQkAg9pmJCVVKl31Pc7PA5U3XWS
         YN1EnaHnzUt/BIQtXfw8gFVQ/fqQIBj71VM61DOGSh09Mv+xKWs6JKX1rJHTVyiDKeWV
         5TEFkVgJM1/Jg0fKqbI+ihMEqKSQfebeXowRbuRwcWKQimZtqeXTR4TRA10+Z3QQjHJK
         3A0BsqBJO8lptS51wcj+TjONIM3BzUO3P5ByyU27QfXt1kmNBnGRaaJGFcZKE8CQw/K3
         lS+w==
X-Forwarded-Encrypted: i=1; AJvYcCXiXZOBpj4eTUetQppuW7sLtBNqHpgIjx6GVnpyK3aKooLB58tKXd5TJytGwONNQaggaGGaXU3V+CeWIA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0lfLr5kyZzDNj/RLE+u8YzF4yTNk+1KuFVX2cTaHnmefrpoq7
	wWVWd3lOrhiLQ7p6pLZmIrHju3ABZiO6gKU3pgQFgjT+2JNfpi0sm+56
X-Gm-Gg: AZuq6aKB4XfdI9wRRI+ZvHpF6xvGf8J+vZUQVXstUFSiFfA6YF6b3vEHcx2m2HRJHB8
	AjWoFdYSXUXQY4sH+M/lacl76sGxkEE/8YTGoL5Mdim6Wi2srHs/jU+l2rzvrYRb6pJb6iV4maE
	hiRU5weedy/xge/cBedjXwmYmTA+0Ir5A2ocTatsLeFb62ntbAhFIRB5HNOuc3Eq56q0r9ZNY0s
	QM2fXUUBBmjHkhgylJ8F9pPjyW7/XvPU5T4mHhcgK1hN+UxUcilG2/gGhC+zf5Axuz/nfj2M0n4
	+blgozYibp3vqv+u0OBFeoQ6gdW6CFbHMeXy7EnDtGlY05TRI6G0hVFb2YzQ3f3BT5hgkpG75Sa
	nhhjiUdrHKHiY+abmzoBHmuTFoGKH+5RtuKKx09t+7/+UsuJ0H5XlJKCml2WQelQBBzBFqa760r
	otWawaXilm26Itoeah
X-Received: by 2002:a05:6a20:6a05:b0:38d:fe2a:4b0a with SMTP id adf61e73a8af0-392e006f5b3mr9449061637.33.1769965854039;
        Sun, 01 Feb 2026 09:10:54 -0800 (PST)
Received: from pop-os.. ([2601:647:6802:dbc0:eb8e:fb38:51dd:c774])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c642add5199sm11579118a12.31.2026.02.01.09.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 09:10:53 -0800 (PST)
From: Cong Wang <xiyou.wangcong@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: linux-fsdevel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Cong Wang <cwang@multikernel.io>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH] dma-buf: add SB_I_NOEXEC flag to dmabuf pseudo-filesystem
Date: Sun,  1 Feb 2026 09:09:52 -0800
Message-Id: <20260201170953.19800-1-xiyou.wangcong@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-51927-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiyouwangcong@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[multikernel.io:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,amd.com:email]
X-Rspamd-Queue-Id: 51A06C6A31
X-Rspamd-Action: no action

From: Cong Wang <cwang@multikernel.io>

The dmabuf filesystem uses alloc_anon_inode() to create anonymous inodes
but does not set the SB_I_NOEXEC flag on its superblock. This triggers a
VFS warning in path_noexec() when userspace mmaps a dma-buf:

  WARNING: CPU: 6 PID: 5660 at fs/exec.c:118 path_noexec+0x47/0x50

The warning exists to catch anonymous inode filesystems that forget to
set SB_I_NOEXEC, as anonymous files should not be executable. All other
pseudo-filesystems that use alloc_anon_inode() properly set this flag:

  - fs/anon_inodes.c: sets SB_I_NOEXEC
  - fs/aio.c: sets SB_I_NOEXEC
  - mm/secretmem.c: sets SB_I_NOEXEC

Add the missing SB_I_NOEXEC flag to dma_buf_fs_init_context() to fix the
warning and maintain consistency with other anonymous inode filesystems.

This was triggered when testing DAXFS (https://github.com/multikernel/daxfs)
and was 100% reproducible with CONFIG_DEBUG_VFS=y.

Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Signed-off-by: Cong Wang <cwang@multikernel.io>
---
 drivers/dma-buf/dma-buf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index edaa9e4ee4ae..e2e1f77aca80 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -192,6 +192,7 @@ static int dma_buf_fs_init_context(struct fs_context *fc)
 	ctx = init_pseudo(fc, DMA_BUF_MAGIC);
 	if (!ctx)
 		return -ENOMEM;
+	fc->s_iflags |= SB_I_NOEXEC;
 	ctx->dops = &dma_buf_dentry_ops;
 	return 0;
 }
-- 
2.34.1


