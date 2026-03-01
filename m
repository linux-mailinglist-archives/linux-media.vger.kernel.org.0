Return-Path: <linux-media+bounces-53921-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDIRDq+Zo2ksIAUAu9opvQ
	(envelope-from <linux-media+bounces-53921-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 02:43:11 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D39D61CB734
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 02:43:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7277831001E8
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 01:31:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79AAF2C158A;
	Sun,  1 Mar 2026 01:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WCA1GRzp"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44861E0B86;
	Sun,  1 Mar 2026 01:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772328689; cv=none; b=UyShHGVQVDA5TA5/uSeUgDwyev/PmcjxsofeYMO7889jjuVUzqkBH7i8UCLoln1SxhPAwVWBmXn21+jxAHMSqQ+TeXq3G9mryYPyN5k7LaSF9qW/1IgOLZUu+S5YgcdIZpADkR4E7/ItaX9YDDtDqitMTwJCGvCyB5oLfdhvCr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772328689; c=relaxed/simple;
	bh=hOq9DF73EaRoSaQnQxW1XVUiM+hetj/iEW7ALXEtLgg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kb1exmpa2ArUg7iI5jyK/EPpRCB9lrIaDUvIecVbzIljTo6ec936yc5lwYxwiI5ixs0Beu0hAZ3J3g5zIvTY8ODq2BWjedgxvTQPcP8I6vjjt2ejeIoXV/Cs/fhQjmbNI3ibLn90gK+pZgRJWT55WNJ1KvodAh5eS8+/Cw02kSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WCA1GRzp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30279C19421;
	Sun,  1 Mar 2026 01:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328688;
	bh=hOq9DF73EaRoSaQnQxW1XVUiM+hetj/iEW7ALXEtLgg=;
	h=From:To:Cc:Subject:Date:From;
	b=WCA1GRzpqoqUZnj1bM7xxQXOJpvgI6lCBWSIP6//LNfFq3X+KMT9K/wVD1VQyhjrO
	 bKGia1niLzHNVOkE4xyH+AurshPgLDQVgy0sZ6596kKMZT7NHbVvg+g1uDCGSGrvWi
	 Jsz1k4mNgRvw4TpnHCSlMxqA9+IScfURVc3jkmnCX8NBpdtpCMEUQQsbx2Ct+bPqGZ
	 uhrVqhjRQ2Wf9nlNuwr4vFbbjG1JxCmPfCbFa1mDvMHLk7CgWBk9D+7+4wM31QPE/S
	 mYNdpEH2eKsD3p4YlXaDj9wvrvgINp7Ll6bTpBm35UOR1OgG+Tcj8UzbkZ7KhX2n0P
	 adoOfeYRbyPow==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	ming.qian@oss.nxp.com
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Frank Li <Frank.Li@nxp.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org
Subject: FAILED: Patch "media: amphion: Drop min_queued_buffers assignment" failed to apply to 6.6-stable tree
Date: Sat, 28 Feb 2026 20:31:26 -0500
Message-ID: <20260301013127.1689959-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-53921-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,nxp.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D39D61CB734
X-Rspamd-Action: no action

The patch below does not apply to the 6.6-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 5633ec763a2a18cef6c5ac9250e4f4b8786e7999 Mon Sep 17 00:00:00 2001
From: Ming Qian <ming.qian@oss.nxp.com>
Date: Tue, 23 Dec 2025 14:27:52 +0800
Subject: [PATCH] media: amphion: Drop min_queued_buffers assignment

The min_queued_buffers field controls when start_streaming() is called
by the vb2 core (it delays the callback until at least N buffers are
queued). Setting it to 1 affects the timing of start_streaming(), which
breaks the seek flow in decoder scenarios and causes test failures.

The current driver implementation does not rely on this minimum buffer
requirement and handles streaming start correctly with the default
value of 0, so remove these assignments.

Fixes: 3cd084519c6f ("media: amphion: add vpu v4l2 m2m support")
Cc: stable@vger.kernel.org
Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/platform/amphion/vpu_v4l2.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/platform/amphion/vpu_v4l2.c b/drivers/media/platform/amphion/vpu_v4l2.c
index 121165a7184fc..64fc88d89cccd 100644
--- a/drivers/media/platform/amphion/vpu_v4l2.c
+++ b/drivers/media/platform/amphion/vpu_v4l2.c
@@ -669,7 +669,6 @@ static int vpu_m2m_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_q
 		src_vq->mem_ops = &vb2_vmalloc_memops;
 	src_vq->drv_priv = inst;
 	src_vq->buf_struct_size = sizeof(struct vpu_vb2_buffer);
-	src_vq->min_queued_buffers = 1;
 	src_vq->dev = inst->vpu->dev;
 	src_vq->lock = &inst->lock;
 	ret = vb2_queue_init(src_vq);
@@ -686,7 +685,6 @@ static int vpu_m2m_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_q
 		dst_vq->mem_ops = &vb2_vmalloc_memops;
 	dst_vq->drv_priv = inst;
 	dst_vq->buf_struct_size = sizeof(struct vpu_vb2_buffer);
-	dst_vq->min_queued_buffers = 1;
 	dst_vq->dev = inst->vpu->dev;
 	dst_vq->lock = &inst->lock;
 	ret = vb2_queue_init(dst_vq);
-- 
2.51.0





