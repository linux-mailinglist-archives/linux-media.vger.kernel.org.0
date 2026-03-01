Return-Path: <linux-media+bounces-53987-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0HqbHt6fo2noIgUAu9opvQ
	(envelope-from <linux-media+bounces-53987-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 03:09:34 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 861EE1CD212
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 03:09:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 61C8E30699EE
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 01:59:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A71992F39B4;
	Sun,  1 Mar 2026 01:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mp2Jkl8p"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C17B29D270;
	Sun,  1 Mar 2026 01:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772330361; cv=none; b=RERkq1pt9zGy0royEYz20hPb+0JptuH3hbCq1mN9FZYKX8+cvPRw1xqt2IcU53cLdgWGRD24PLzLp2fsMZkbq+3/JTOzWnc5GbDI5HMJg4DTGVIIcECRw+5b5blHEpS51QaxjWa6Y+Is4Yr+fEaKTY5gzuGCannhVeG5YUUhCsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772330361; c=relaxed/simple;
	bh=Xi/NihH8UFixspuJm5jyfnV3azpeFhqBiprmcA4TYBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u672opciT8r7ECMQd6b44xfFfTzlnq6nvTdMIZGvSuGS3iC2GOqQUq8eXH49zBy797Bqm0+BZueNhAEZ3X75cXZi5fWrvUNkrZk3qKfhb3v9eXNcQIAFwqLyt3kn2REJ1bVNNTzQd30VrDHw4q8bLFzZe/LWGZvQx7I6HkPscx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mp2Jkl8p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCE5DC19421;
	Sun,  1 Mar 2026 01:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772330360;
	bh=Xi/NihH8UFixspuJm5jyfnV3azpeFhqBiprmcA4TYBQ=;
	h=From:To:Cc:Subject:Date:From;
	b=mp2Jkl8pICtOap+5o7IIH5G2dnl1V0uMvDupvTsB5MtUNBLf+bofGgMKPK/eyspam
	 o8fCcWOS1b8okOFgNvH79joAsHWGiAyz88dlgErDcNYbTFRAGXKeBkF5uRzrdagHam
	 GCNvjF4+rBhWzNdVdteP5oJ6hfHdeZhe9806DUFJHik24KYt/1YxTFrsZAMVxwfJyj
	 FNM+H8eeHov5L4ndsYXg9ypWzcDsMCt+Q2JU8FlJnpyCMdSCabfH43MxWuAG3DGz0t
	 Q37hwDydjTuBVlSq2K3+y+rn7SmcC5OyBVDM29VL9jjpuhsHwPxJgrR7RT/C7NlTli
	 q0gesJYKY5l6w==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	irui.wang@mediatek.com
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: FAILED: Patch "media: mediatek: encoder: Fix uninitialized scalar variable issue" failed to apply to 5.10-stable tree
Date: Sat, 28 Feb 2026 20:59:18 -0500
Message-ID: <20260301015918.1724995-1-sashal@kernel.org>
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
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53987-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mediatek.com:email,collabora.com:email]
X-Rspamd-Queue-Id: 861EE1CD212
X-Rspamd-Action: no action

The patch below does not apply to the 5.10-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 88e935de7cf8795d7a6a51385db87ecb361a7050 Mon Sep 17 00:00:00 2001
From: Irui Wang <irui.wang@mediatek.com>
Date: Sun, 7 Sep 2025 17:35:56 +0800
Subject: [PATCH] media: mediatek: encoder: Fix uninitialized scalar variable
 issue

UNINIT checker finds some instances of variables that are used
without being initialized, for example using the uninitialized
value enc_result.is_key_frm can result in unpredictable behavior,
so initialize these variables after declaring.

Fixes: 4e855a6efa54 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video Encoder Driver")
Cc: stable@vger.kernel.org
Signed-off-by: Irui Wang <irui.wang@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 .../media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
index 6faf3f659e751..b3a0a1d8b7a8e 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
@@ -850,7 +850,7 @@ static void vb2ops_venc_buf_queue(struct vb2_buffer *vb)
 static int vb2ops_venc_start_streaming(struct vb2_queue *q, unsigned int count)
 {
 	struct mtk_vcodec_enc_ctx *ctx = vb2_get_drv_priv(q);
-	struct venc_enc_param param;
+	struct venc_enc_param param = { };
 	int ret;
 	int i;
 
@@ -1004,7 +1004,7 @@ static int mtk_venc_encode_header(void *priv)
 	int ret;
 	struct vb2_v4l2_buffer *src_buf, *dst_buf;
 	struct mtk_vcodec_mem bs_buf;
-	struct venc_done_result enc_result;
+	struct venc_done_result enc_result = { };
 
 	dst_buf = v4l2_m2m_dst_buf_remove(ctx->m2m_ctx);
 	if (!dst_buf) {
@@ -1125,7 +1125,7 @@ static void mtk_venc_worker(struct work_struct *work)
 	struct vb2_v4l2_buffer *src_buf, *dst_buf;
 	struct venc_frm_buf frm_buf;
 	struct mtk_vcodec_mem bs_buf;
-	struct venc_done_result enc_result;
+	struct venc_done_result enc_result = { };
 	int ret, i;
 
 	/* check dst_buf, dst_buf may be removed in device_run
-- 
2.51.0





