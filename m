Return-Path: <linux-media+bounces-55661-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJUbFJzys2nYdgAAu9opvQ
	(envelope-from <linux-media+bounces-55661-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 12:18:52 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A455F2821D8
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 12:18:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C106B30BA355
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 11:14:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18EE938B128;
	Fri, 13 Mar 2026 11:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PakPyhtg"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1993538655A;
	Fri, 13 Mar 2026 11:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773400463; cv=none; b=NDZO4+V+wC58XUVJrs6a4brtRsgqs+yWtj3GGrwwfHuyPQ0nRku/GMPMTYn13G9ghhG+b/80A8XCsJmFb9J+W2u8q/97o3fMUBd+pp5Nc6Q42OodAD8pwn6lb9D5rWPM+fJUnxGYqMU2U8375JTljUkjQPSlUlQg2cy45i59rZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773400463; c=relaxed/simple;
	bh=P3uc4qnZHOzWKLHJudBY2BQ1MWjlXY7iFwr9QoH8j+A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hCzraDeFqlXwwY9Va6q4m0t9Wv4Ym+n2Udnpuxk1PsdDzW5JZR85XGscMWW7wbucjvqSppBJY01GXxuMFCcsK/RF6OjOgX2dwcqQen31g1qM2soHGdWe4YP01kN5PfQVuFf/mnkPUZgv0KFEGIl4nYVvQAO3REqRrsx7i1nvq4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PakPyhtg; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.224.131] (unknown [37.159.92.229])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 88B4E1356;
	Fri, 13 Mar 2026 12:13:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773400389;
	bh=P3uc4qnZHOzWKLHJudBY2BQ1MWjlXY7iFwr9QoH8j+A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PakPyhtgKVXNfmCkHarcs3kbNl5WUaQwnbm2wkAK2fTrT7CR6fevcWb4eFC2qEZJP
	 dgPt57gh417HsO2vhgbCV9WcjiAQxHgwq1CYc8BpZZUe8unYWBxK8QGbVOEUd9DdWU
	 /YvdI6djLM7+J7vXoZHltFqL4pI+8ZLzLNnC4uk0=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Fri, 13 Mar 2026 12:14:02 +0100
Subject: [PATCH 6/7] media: rzv2h-ivc: Avoid double job scheduling
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-mali-ivc-fixes-v7-0-v1-6-cb0714cd1279@ideasonboard.com>
References: <20260313-mali-ivc-fixes-v7-0-v1-0-cb0714cd1279@ideasonboard.com>
In-Reply-To: <20260313-mali-ivc-fixes-v7-0-v1-0-cb0714cd1279@ideasonboard.com>
To: Daniel Scally <dan.scally@ideasonboard.com>, 
 =?utf-8?q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2950;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=sfEMevA0cXM3xUNs6qpK+yeWyMARLiV0CQVjh5pXC+E=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBps/GB5pPOblfljFPN7rugR/tOQbvAHqCAUInmJ
 YlSq/aJlQ2JAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCabPxgQAKCRByNAaPFqFW
 PLbTEACuGP0di4covh8CNHddpTrXSPwYr8owQdoJ1CtaErzSGiBT7acGh1/PK+3lNpXZ8kmqhdd
 Q3oR/YOi/zK2BStdwzUdevXO5VPn/uLlLx10UanKfQRJE76wI8Z6LcyUYPi+XxgjwBlBcnvbanD
 TN/CzxP0rtY8RYb2EjPnH3p3cqQp4T/V6atgxSmfkkow4W5g3eNtGoTo6C8eiC1yq1DrICUKeKM
 V7O/e1vyW6Gd1LTVRoXinUDoEdiR4IXcX8xrFitRrIcPKL564llPJdXS8cWE7soYBWXk12nX7zS
 PtyTJ3tzMkhBz9/TMvmCz6DtXEcECiyP1XC1qoWHTk+WGzEQiPpawhAKf1nouA6EK5nnjYfPphz
 llwaVGGDnpDL2LlZgO/2tJie5pjrrMpHx5wT9DpMXkgPe1oCGrr20iF/QzzQh3E7Iz6JMExB1a3
 YJ6YD8n+kFgFMAQtecz0m2T9olIasRTKXHfBDsELgdQ25JDaNL91jNiF2OZsNKejU4/thpIpRq2
 8h9jlgc5/co+OX+m/B+Y5FExOZZVH5zTR4Na5+A9chnhX2cf2zfFEPZv7M0W09nHWU3jQQ8OlON
 wfiQ3pvlX6OGvk/QaZj4hKtsy57XxcC+m85lqedjH5ewQtYjfed5RILocpZimvDz0Mwjd4UyfPR
 UE8A7tUYNxWRPjw==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55661-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[buffers.work:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid]
X-Rspamd-Queue-Id: A455F2821D8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>

The scheduling of a new buffer transfer in the IVC driver is triggered
by two occurrences of the "frame completed" interrupt.

The first interrupt occurrence identifies when all image data have been
transferred to the ISP, the second occurrence identifies when the
post-transfer VBLANK has completed and a new buffer can be transferred.

Under heavy system load conditions the actual execution of the workqueue
item might be delayed and two items might happen to run concurrently,
leading to a new frame transfer being triggered while the previous one
has not yet finished.

This error condition is only visible because the driver maintains a
status variable that counts the number of interrupts since the last
transfer, and warns in case an IRQ happens before the counter has been
reset.

To ensure sequential execution of the worqueue items and avoid a double
buffer transfer to run concurrently, protect the whole function body
with the spinlock that so far was solely used to reset the counter and
inspect the interrupt counter variable at the beginning of the buffer
transfer function.
and return

As soon as the ongoing transfer completes, the workqueue item will be
re-scheduled and will consume the pending buffer.

Cc: stable@vger.kernel.org
Fixes: f0b3984d821b ("media: platform: Add Renesas Input Video Control block driver")
Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
index a22aee0fe1cf..3580a57738a6 100644
--- a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
+++ b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
@@ -149,6 +149,11 @@ static void rzv2h_ivc_transfer_buffer(struct work_struct *work)
 					     buffers.work);
 	struct rzv2h_ivc_buf *buf;
 
+	guard(spinlock_irqsave)(&ivc->spinlock);
+
+	if (ivc->vvalid_ifp)
+		return;
+
 	/* Setup buffers */
 	scoped_guard(spinlock_irqsave, &ivc->buffers.lock) {
 		buf = list_first_entry_or_null(&ivc->buffers.queue,
@@ -163,9 +168,7 @@ static void rzv2h_ivc_transfer_buffer(struct work_struct *work)
 	buf->addr = vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, 0);
 	rzv2h_ivc_write(ivc, RZV2H_IVC_REG_AXIRX_SADDL_P0, buf->addr);
 
-	scoped_guard(spinlock_irqsave, &ivc->spinlock) {
-		ivc->vvalid_ifp = 2;
-	}
+	ivc->vvalid_ifp = 2;
 	rzv2h_ivc_write(ivc, RZV2H_IVC_REG_FM_FRCON, 0x1);
 }
 
@@ -200,7 +203,7 @@ static void rzv2h_ivc_buf_queue(struct vb2_buffer *vb)
 	}
 
 	scoped_guard(spinlock_irq, &ivc->spinlock) {
-		if (vb2_is_streaming(vb->vb2_queue) && !ivc->vvalid_ifp)
+		if (vb2_is_streaming(vb->vb2_queue))
 			queue_work(ivc->buffers.async_wq, &ivc->buffers.work);
 	}
 }

-- 
2.53.0


