Return-Path: <linux-media+bounces-53883-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIJsMoaUo2l7HQUAu9opvQ
	(envelope-from <linux-media+bounces-53883-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 02:21:10 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E34311CA3E2
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 02:21:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7AB0F300BEBB
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 01:19:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ECAE2727FC;
	Sun,  1 Mar 2026 01:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UdlqT0+A"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71A626E710;
	Sun,  1 Mar 2026 01:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772327988; cv=none; b=gO7qDUWlZJHnpy/wcsebE3neWEdHLR99jd4OA0Vxlj7wZ9HlCx2KsFaGPNfVlThv3IRPEYeXN2AZR73RKkz0ombwtsSYU6ILzpk8p31Ea/l1ISTZXshZ7VCNHyJDd/KCIL8YCDQScAjohpU8NXcIDFp+M6PVJ5xI76QGaawArGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772327988; c=relaxed/simple;
	bh=0EHtsUJ7B9Kbf14IzzXshDhLqQ/Y+xSCSPk1gUgAn5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Uq5DSFk7XLYtaztUPAC4/fjfoBd05Q+rn7BV2mEy0PKbF1UbXL8ZmE4z7yNQauNcvNdzZetZrPgR5tMEyFKwz52Qo3OO8HrSPm/xXkFjYgJYQMWfFHcSPEXmUxR00PIsWRvF5r4Tk2fTjR2E1wLmWflyJw5DbVaqL2G9Q2vjyyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UdlqT0+A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CFC6C2BC86;
	Sun,  1 Mar 2026 01:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772327987;
	bh=0EHtsUJ7B9Kbf14IzzXshDhLqQ/Y+xSCSPk1gUgAn5Y=;
	h=From:To:Cc:Subject:Date:From;
	b=UdlqT0+A71TzYVNj7nrpe9vhbpbl3Cnek7SGR7ML2YN6USgklHgG5zdun4TGMn4fu
	 mzspMHT1ChEO6A9lWGm7x8j+MbRQ/ZWWOG/bbU5EwPTUqSZVcufqVzAhD1vzMYgSix
	 meOF5eqt2g8Q0uxJsMKlz84+ad38HPWzfk0Ei3UkyBJr0PRH2D1IQhODLwTF+nYdxy
	 K08HUbaSh4iqbSZy22fovO9IkRYndU0bo7uMOhjneZ59o71idbFHOQo5jn4EcSWNBg
	 FaggLuDfbig36Z5UZSlMD34W1Mr2aCZ5/SwfcBLyuTHPVMCC5SW4LncFsJIqmx4yM6
	 VQIfbeiA8+WVg==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	ming.qian@oss.nxp.com
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Frank Li <Frank.Li@nxp.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org
Subject: FAILED: Patch "media: amphion: Drop min_queued_buffers assignment" failed to apply to 6.12-stable tree
Date: Sat, 28 Feb 2026 20:19:45 -0500
Message-ID: <20260301011946.1675013-1-sashal@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-53883-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,collabora.com:email]
X-Rspamd-Queue-Id: E34311CA3E2
X-Rspamd-Action: no action

The patch below does not apply to the 6.12-stable tree.
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





