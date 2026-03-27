Return-Path: <linux-media+bounces-57294-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OCt4Gnm8xmnoNwUAu9opvQ
	(envelope-from <linux-media+bounces-57294-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 18:20:57 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5E434838B
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 18:20:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 72B3B30EE3DD
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 17:11:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEC293E4C7B;
	Fri, 27 Mar 2026 17:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QHWxbcOt"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41A73C3C1E;
	Fri, 27 Mar 2026 17:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774631449; cv=none; b=oEUb2+tF6gg1u9/4Ndbx2iLWNjiTJiWsO8p5OfMIeg+vgM8REI6uClJlX9CKyluJuofCCAaKfPK70Q5m4ogvdPZ25MwYn0qfMkEvRbCDPTQWM2MIcbcE11rCwUEXY7yI0H7oqC28PIMZGMjfaIg5flM681i7Us02fF9YSaXYBnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774631449; c=relaxed/simple;
	bh=qYNVJErGbpDMrNMDY0tRycGjHWbALYmvbRwfv/gRKvs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cieK1pyIe5c0AQ9hwpazHCvjKRutAg41F4NT3bCTfwuwf7ZWJu8ieyMCmO4Z3djtAqwraKVyDFbYT5m1KOPe8B3C+V8SS2qvchemLySE3iLvsIKUY6GayJA5nixLxXppFnR1pPF1XnFq3fWTpwxY72ArMP867hg1BneDVG9Degw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QHWxbcOt; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [100.93.44.16] (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4B44C3040;
	Fri, 27 Mar 2026 18:09:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774631359;
	bh=qYNVJErGbpDMrNMDY0tRycGjHWbALYmvbRwfv/gRKvs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QHWxbcOtHniFytO7Wv6i2m18FzT5C/zCrepBGDMECZr/8kmx5x0LfgtGLIcb71HMl
	 bIysu1JKZ5pfprJEzzq830cwzvlsmAR5M5aVeucepkh/KvlrjMOacKYGgaabHsufbW
	 Ukg5GP/Q8Waj5j3T7dg+Mptgh/pWrMdfKy4hOeGg=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Fri, 27 Mar 2026 18:10:10 +0100
Subject: [PATCH 05/14] media: rzg2l-cru: Remove locking from start/stop
 routines
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-b4-cru-rework-v1-5-3b7d0430f538@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2479;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=rDJiPzdHrlyY1cOGAeuzTJ0dhKGoLcCuHePAhuQK1sE=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBpxroJMlRhPcgp8xIoRJhQw9zKxd7KeaN/szIVM
 SoGTJ0qPuOJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaca6CQAKCRByNAaPFqFW
 PAgCEACbZdq/cT0GhFCHMNgl9sKfILIQsuNlVTMF7wxWW07MhMeGl+pAvlQh4cUECl16g7QSfjB
 0UD+xmAMsHUazy0vMVej2y20RyF7ataIi8NRT6UdpGfu3svaIaTZX1M1wYflCXP/TVj6mnTXB/c
 n6fZHBFlxviVV9Wz9n7EmKhwaNQURqakPnNEUJqkhacB2xnHeXr9dYfAvBgendtMnUNriCbMH/N
 xX4HrGeRoFMq5umC4AonaFiv/x89EWUaqToes7nvwKgX8reamPDD1K+hSXsFu3YS+1fFzBtQwCF
 bCYbORPgvM4FBoA6NdDY5b3mertSF2ayp+tYBUr3dQScrlV8EqAtM7XTIsftrjMk7pkj/VKsozD
 ORCmnhuAqrieUiGJjbQDlBxUf3HuIB2P2UudOKlkHeKtkCxgq57PYerNppNQpDaCkKC/3E2jrIH
 DY8uJsJUWIM+038xdH6ifnFyjJVIwv6P8lavfk29SV9Zpo0H9WDGxVWyICcyV2o1PVtXtIB13/q
 xYYOK3efn+mMBUVnBWtr6ulmWTrvx6w9QOPFuot5hKhVFj78h9Cf4s72P/l6UZfA0RJc8DxNAah
 3lp3h0844mbqv5qiV4vBV+N5t9pLDudp3Sq2i29cJs1IPvVik2kxAPdhSo0AMjLOHqhVxFcvOTR
 zf5u1C2IK0M/GKQ==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57294-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid]
X-Rspamd-Queue-Id: 0E5E434838B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>

The start/stop streaming routines do not need to lock the whole function
body against possible concurrent accesses to the CRU buffers or hardware
registers.

The stop function starts by disabling interrupts, and only this portion
needs to be protected not to race against a possible IRQ.

Once interrupts are disabled, nothing in the video device driver can race
and once the peripheral has been disabled we can release all pending
buffers.

Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index b041c72837c6..43b1d35fb963 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -341,23 +341,19 @@ bool rzg2l_fifo_empty(struct rzg2l_cru_dev *cru)
 void rzg2l_cru_stop_image_processing(struct rzg2l_cru_dev *cru)
 {
 	unsigned int retries = 0;
-	unsigned long flags;
 	u32 icnms;
 
-	spin_lock_irqsave(&cru->qlock, flags);
-
-	/* Disable and clear the interrupt */
-	cru->info->disable_interrupts(cru);
+	scoped_guard(spinlock_irq, &cru->qlock) {
+		/* Disable and clear the interrupt */
+		cru->info->disable_interrupts(cru);
+	}
 
 	/* Stop the operation of image conversion */
 	rzg2l_cru_write(cru, ICnEN, 0);
 
 	/* Wait for streaming to stop */
-	while ((rzg2l_cru_read(cru, ICnMS) & ICnMS_IA) && retries++ < RZG2L_RETRIES) {
-		spin_unlock_irqrestore(&cru->qlock, flags);
+	while ((rzg2l_cru_read(cru, ICnMS) & ICnMS_IA) && retries++ < RZG2L_RETRIES)
 		msleep(RZG2L_TIMEOUT_MS);
-		spin_lock_irqsave(&cru->qlock, flags);
-	}
 
 	icnms = rzg2l_cru_read(cru, ICnMS) & ICnMS_IA;
 	if (icnms)
@@ -401,8 +397,6 @@ void rzg2l_cru_stop_image_processing(struct rzg2l_cru_dev *cru)
 
 	/* Resets the image processing module */
 	rzg2l_cru_write(cru, CRUnRST, 0);
-
-	spin_unlock_irqrestore(&cru->qlock, flags);
 }
 
 static int rzg2l_cru_get_virtual_channel(struct rzg2l_cru_dev *cru)
@@ -470,8 +464,6 @@ int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
 	csi_vc = ret;
 	cru->svc_channel = csi_vc;
 
-	guard(spinlock_irqsave)(&cru->qlock);
-
 	/* Select a video input */
 	rzg2l_cru_write(cru, CRUnCTRL, CRUnCTRL_VINSEL(0));
 

-- 
2.53.0


