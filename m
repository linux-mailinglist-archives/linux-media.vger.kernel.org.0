Return-Path: <linux-media+bounces-57295-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIEBMM68xmnoNwUAu9opvQ
	(envelope-from <linux-media+bounces-57295-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 18:22:22 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3973483EC
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 18:22:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 562223015467
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 17:11:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2A113793C3;
	Fri, 27 Mar 2026 17:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="O9fLSfv6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD1E3783C1;
	Fri, 27 Mar 2026 17:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774631450; cv=none; b=qzS2RB00/w3doef8F2edU5KVz3x6dzmj+NMm2gBaaURJISaYMPE99yEsHKUWQF1bUt+t6lpxWJawXPxXuFxW1JoU8cWZ0TxP2dXpfDcgwNtx2dU4kbjRi9dr4NiewqUQ+XGklP8H07tPyirXQR7xVI//bdQzPVS2iM49OYi8+4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774631450; c=relaxed/simple;
	bh=MQiAPF1tif77KMDMhwXiTjAr/WzA0OTXN4b2NjGMcMo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LSFCgbsAbBS/iwKT7/VRVw5SDDjJ6v78QtrSvZVOkHQ/WiyVL6LE/ekOL1D6l10dAD1MPPIEsgvQvcfEAswuYXM9UlnunCD3Ijm8vmYtNlwffT/0sxnBpRg5CjrYvuwlMkjE8QVgycu2M5zToPi7C7v2jWAMoAM6a9qoLsg7LRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=O9fLSfv6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [100.93.44.16] (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DDED6304F;
	Fri, 27 Mar 2026 18:09:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774631360;
	bh=MQiAPF1tif77KMDMhwXiTjAr/WzA0OTXN4b2NjGMcMo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=O9fLSfv61KFKskYmk9Wvnm3kfaeN8wzeKz++vh6E2dOCDVIs8P+SB1mzIPcjD6/e8
	 3w816CyYdTP6JWhKUpCJ1vzCsrMK+ofogXq/c+LYr6RgLKrydDOCO6echakneiS2nu
	 77SV2IUt7E9fJPwYw0gInUShLuwz+RQGtEUx/ONo=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Fri, 27 Mar 2026 18:10:11 +0100
Subject: [PATCH 06/14] media: rzg2l-cru: Do not use irqsave when not needed
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-b4-cru-rework-v1-6-3b7d0430f538@ideasonboard.com>
References: <20260327-b4-cru-rework-v1-0-3b7d0430f538@ideasonboard.com>
In-Reply-To: <20260327-b4-cru-rework-v1-0-3b7d0430f538@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Biju Das <biju.das.jz@bp.renesas.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, 
 =?utf-8?q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1328;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=bF40rZD3TQUHYDp7/ut1kp/JjJgaqy4ZgCBLyzy2Fgw=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBpxroJz/+q75G02YrIYat6AXa6xwPNfcBVeeM2R
 TIrTbv71u2JAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaca6CQAKCRByNAaPFqFW
 PGwLD/wKDFYM2658ug8Cs3QWkR5cjIgm6H8qbVc4yidppiKxTDqLp9sy4p64zq10+D1aVu47ltd
 uey3PzUpu9xlML0Z0SqZbjqKhO1kzVEza3qYxvLdtPA5+c9yK5wM6RRflP1dorPTSXKRJYXYkeo
 5xFGn5AOjQODSaTxvYchgtiFW0ULNI5Y+yalWmvB3+f0mxWopLif7Q8PR8Aa7SfvJ57/EE1FODp
 ChmwE8agEi/EsORrB2oIEIcZ+smyOk2S0sHd7ua5AJhxMwJ22IP+cwIKrfxVzdNzRczXzLoFBPb
 GGmgBOyWeBgj9HGFMTChtqy3+P9cRrIJ4U8POS35+gpG+oO7TJT1BpM9cZ/rEGtNcBAHNW1hGTK
 3eiwug7+w7B/hy+7rbln+cS9blUT9Zp91du0WAVve0hTKvly9cCj1OvR4q5fUlCsQ16eaKj9SH2
 Y/pLjXdhihQK4IuwcMoCZ0mWI8woka60zCiy14UwruMR3mFQX9ndIbrs6w+BdYue4Oh0e3ULuUk
 MCeTYRhdADwNG7MiXx/eahUTanCfKLUeiuOgvHThC1CaIWnpQ68c2GDnfCH885fON9NThGAZscN
 9FAexQT4XCRi/PnKi5C9/aeSufY3Kv+q9fGzADTp8IYUwArIPkhLjeqWzbBcosHnq3E3/j9PFkT
 5yFCAgu1z7+vZAg==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57295-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,protonmail.com,bp.renesas.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas,cisco];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid]
X-Rspamd-Queue-Id: 1F3973483EC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>

The return_unused_buffers() and rzg2l_cru_buffer_queue() functions
are never called from an interrupt context, hence they do not need to
use the irqsave version of the spinlock primitives.

Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 43b1d35fb963..2e94788c3a13 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -113,7 +113,7 @@ static void return_unused_buffers(struct rzg2l_cru_dev *cru,
 	struct rzg2l_cru_buffer *buf, *node;
 	unsigned int i;
 
-	guard(spinlock_irqsave)(&cru->qlock);
+	guard(spinlock_irq)(&cru->qlock);
 
 	for (i = 0; i < cru->num_buf; i++) {
 		if (cru->queue_buf[i]) {
@@ -166,7 +166,7 @@ static void rzg2l_cru_buffer_queue(struct vb2_buffer *vb)
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
 	struct rzg2l_cru_dev *cru = vb2_get_drv_priv(vb->vb2_queue);
 
-	guard(spinlock_irqsave)(&cru->qlock);
+	guard(spinlock_irq)(&cru->qlock);
 	list_add_tail(to_buf_list(vbuf), &cru->buf_list);
 }
 

-- 
2.53.0


