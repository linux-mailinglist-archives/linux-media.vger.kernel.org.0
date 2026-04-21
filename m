Return-Path: <linux-media+bounces-59193-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KD4tF04T52nL3QEAu9opvQ
	(envelope-from <linux-media+bounces-59193-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 08:03:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7B7436AE9
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 08:03:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A6E6E3008463
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 06:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7156636494E;
	Tue, 21 Apr 2026 06:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cse.ust.hk header.i=@cse.ust.hk header.b="SOAEmXPh"
X-Original-To: linux-media@vger.kernel.org
Received: from cse.ust.hk (cssvr7.cse.ust.hk [143.89.41.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A15337C93F;
	Tue, 21 Apr 2026 06:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=143.89.41.157
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776751425; cv=pass; b=CLRNX8qHCYEUHMUHOxE6Tr++a9ZG0j1QzoWOs+JN2q8ur2chWi1Zye4w11yUnjaBW8m+FhMlCfA/48XEZzbFXg2sKNQUwMfGquqe5y+1UlBbmE5WpdivMZzqRoReOW8IZRFVIHyjKAlo3HjuLE5aHm39YHaZki+MGFzSiIF4LNg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776751425; c=relaxed/simple;
	bh=Zy+PE3qHayQoLBGzFejbEcVxq7q9OxjzTgwTqeVJr2s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U+xvVCwOFptX4bLIGjvrde5qiWj0uYJQYKpXcIF2xL8xBgbWMWPlJRs2P2EoXczxYEyUAtogK2ZtTD7fPkmEd478kAPQ80cOhb848IjF5mR5I97nkK+YDnMm2ejhX4Kps+O9Fju+TuFdNxeqv8sBpfEDvKSv+x0/gTtHHdpVdKg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cse.ust.hk; spf=pass smtp.mailfrom=cse.ust.hk; dkim=pass (1024-bit key) header.d=cse.ust.hk header.i=@cse.ust.hk header.b=SOAEmXPh; arc=pass smtp.client-ip=143.89.41.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cse.ust.hk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cse.ust.hk
ARC-Seal: i=1; d=cse.ust.hk; s=arccse; a=rsa-sha256; cv=none; t=1776751399;
	b=fTDAYRAa7Lp+gP0sNS02mkkmH72E4bQ1AiLiTaD3+svVx1ixPXB38d41MeP9WpVzgDQZ
	 Pbm6W7XJ1rATzYpjxwRSDOxLfxh0kaDciB5750kVYkL+MftGCZh76rxMfCl8ifv+6wF7U
	 /H/VwvPy6tTkvYsfC5ZIG1PgNuPmvebDyc=
ARC-Message-Signature: i=1; d=cse.ust.hk; s=arccse; a=rsa-sha256;
	c=relaxed/relaxed; t=1776751399;
	h=DKIM-Signature:Date:From:To:Subject:Message-ID:MIME-Version;
	bh=RGI+f7AdZsB1ig8+/2ozk/wO9J8FfrHbiusP46m8O/Q=;
	b=zmiQ0ps7GXtOlgkcp0NEf1PlgMSEjbYslZw7tkf1roLfKxFrLOU9SUddvFE+FLjTXEtg
	 F6ZAqARfW3Ry2zg68GyvXqNOdkETx9IOQG5h1Z3X0/gsZjBdEbjjFhKl6saE2yyTuDUSl
	 B28Dfyx/SIZUbBYjrCCrgPeYvCBqzcTQGo=
ARC-Authentication-Results: i=1; cse.ust.hk; arc=none smtp.remote-ip=143.89.191.45
Received: from chcpu16 (191host045.mobilenet.cse.ust.hk [143.89.191.45])
	(authenticated bits=0)
	by cse.ust.hk (8.18.1/8.12.5) with ESMTPSA id 63L63Cbx890973
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 21 Apr 2026 14:03:19 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cse.ust.hk;
	s=cseusthk; t=1776751399;
	bh=RGI+f7AdZsB1ig8+/2ozk/wO9J8FfrHbiusP46m8O/Q=;
	h=Date:From:To:Cc:Subject:From;
	b=SOAEmXPhvP+RpYV0ejFPtRbECV0JVXmmWTA19vewZm1HaqBrQX7KJMpwUxVMloWMR
	 x/5BBEui3ANrO7V3R/FOVTo6roqT61vdbC2fzhRv/O0HyQDcb5V6Tu3HprrYRHh0Sv
	 szZ3RrrKGSGlq2+CaU2687WKxa70hXGvPV3wEjxw=
Date: Tue, 21 Apr 2026 14:03:07 +0800
From: Shuhao Fu <sfual@cse.ust.hk>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] media: rzg2l-cru: serialize state transitions with qlock
Message-ID: <20260421060307.GA2522920@chcpu16>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Env-From: sfual
X-Spamd-Result: default: False [-0.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[cse.ust.hk:?];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59193-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_DNSFAIL(0.00)[cse.ust.hk : SPF/DKIM temp error,none];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sfual@cse.ust.hk,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.592];
	R_DKIM_TEMPFAIL(0.00)[cse.ust.hk:s=cseusthk];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: EB7B7436AE9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

struct rzg2l_cru_dev.state is documented as protected by qlock, and the
IRQ path already reads and updates it under that lock. However,
rzg2l_cru_stop_streaming() writes STOPPING and
rzg2l_cru_start_streaming_vq() writes STARTING without taking qlock.

That lets process-context stream control race with rzg2l_cru_irq().
If the IRQ handler misses a concurrent STOPPING update, it can continue
normal frame completion and slot refill after streamoff has begun. A
similar race around STARTING can make the IRQ path observe the wrong
phase during startup synchronization.

Fix both state transitions by serializing the writes with qlock, while
still keeping rzg2l_cru_set_stream() outside the locked region.

Fixes: 07fc05bd0a79 ("media: platform: Add Renesas RZ/G2L CRU driver")
Signed-off-by: Shuhao Fu <sfual@cse.ust.hk>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 162e2ace693184..434754fd155a8e 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -560,7 +560,11 @@ pipe_line_stop:
 
 static void rzg2l_cru_stop_streaming(struct rzg2l_cru_dev *cru)
 {
+	unsigned long flags;
+
+	spin_lock_irqsave(&cru->qlock, flags);
 	cru->state = RZG2L_CRU_DMA_STOPPING;
+	spin_unlock_irqrestore(&cru->qlock, flags);
 
 	rzg2l_cru_set_stream(cru, 0);
 }
@@ -749,6 +753,7 @@ irqreturn_t rzg3e_cru_irq(int irq, void *data)
 static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count)
 {
 	struct rzg2l_cru_dev *cru = vb2_get_drv_priv(vq);
+	unsigned long flags;
 	int ret;
 
 	ret = pm_runtime_resume_and_get(cru->dev);
@@ -791,7 +796,9 @@ static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count
 		goto out;
 	}
 
+	spin_lock_irqsave(&cru->qlock, flags);
 	cru->state = RZG2L_CRU_DMA_STARTING;
+	spin_unlock_irqrestore(&cru->qlock, flags);
 	dev_dbg(cru->dev, "Starting to capture\n");
 	return 0;
 
-- 
2.25.1

