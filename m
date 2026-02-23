Return-Path: <linux-media+bounces-53229-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLfqI6DLnGlHKQQAu9opvQ
	(envelope-from <linux-media+bounces-53229-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 22:50:24 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BABCD17DBC8
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 22:50:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C4AED304DC9F
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 21:50:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E55E73793C3;
	Mon, 23 Feb 2026 21:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="awluYM34"
X-Original-To: linux-media@vger.kernel.org
Received: from 013.lax.mailroute.net (013.lax.mailroute.net [199.89.1.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD45366DB0
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 21:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771883410; cv=none; b=Ru0U3aOd1hgxkgss8ldF1z/pcjdwQcSyC6JxkBOsN/YUmzcWL+2ARDTruTOZ8ufPg4oa4FGLLvYNXtfBpUmogQyEmyqzcX9R18d/MGj/S/i34c8Ss3AM0NklBqgnZClKnr6f/DfRMwo2jJVhXMrl3FDwRpqmiqtzqtRQzm6Z/r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771883410; c=relaxed/simple;
	bh=XWwBiVKtcMVXcZZ6S0kGAQc8RqaVG2VCyoOZbKIGyes=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KzNgGKIisCgvGKSlTA6vvqaszlaoqO2oKSeVF17PDuHsfkXmT6rl1SwDOaCwZJmaIThZYP4oypo+dsD1hpOZlJhWw0k4/ux0SaZwKhioYLRkTjmvkukrf/pYDT3jrNUAxRv0WIZTzL0jKNJbzEA+BRvFXpMb33bs6WmJdmDKCtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=awluYM34; arc=none smtp.client-ip=199.89.1.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4fKZJx0PH0zlfdvh;
	Mon, 23 Feb 2026 21:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:mime-version
	:references:in-reply-to:x-mailer:message-id:date:date:subject
	:subject:from:from:received:received; s=mr01; t=1771883407; x=
	1774475408; bh=LAGDjPtwo0arw4hE7/MUC/1SA4WpreoEY9yzowan97I=; b=a
	wluYM34wpoYGQK/o7Styvh/dcuTYQERKoIaoaliSt3ybaFfbseI8zAx0I8vanY/o
	32gmh3fptxRd1/WmTFWFhG0rFnXGjkPcPiQEx/4pbQf8vNTPSVLq0t14n0t73DRm
	jP8fO21c7uzbLrvByFVxCfs/1t9pbhXJef4YvO7HeL4otOg2ETlfUasIrkpA4/HY
	UXahcm1GbK8U2bjq9I3R5W1rYLTPVU2l3UjjG/2PYMK8YWckXcKLIisS9C1LUdy7
	wpQsjDT+fatHH/chekQfNzVO0EubeoIwGlZZJLsTmGWeUt3H01x1l+ZFWRughGvy
	AIXd9A7PoK6pWBtfN7QNA==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id gk9F68QEMZdQ; Mon, 23 Feb 2026 21:50:07 +0000 (UTC)
Received: from bvanassche.mtv.corp.google.com (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4fKZJt4Y5YzlfgPY;
	Mon, 23 Feb 2026 21:50:06 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Bart Van Assche <bvanassche@acm.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	linux-media@vger.kernel.org
Subject: [PATCH 05/62] dma-buf: Convert dma_buf_import_sync_file() to the early-return style
Date: Mon, 23 Feb 2026 13:48:53 -0800
Message-ID: <20260223214950.2153735-6-bvanassche@acm.org>
X-Mailer: git-send-email 2.53.0.371.g1d285c8824-goog
In-Reply-To: <20260223214950.2153735-1-bvanassche@acm.org>
References: <20260223214950.2153735-1-bvanassche@acm.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[acm.org,reject];
	R_DKIM_ALLOW(-0.20)[acm.org:s=mr01];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53229-lists,linux-media=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bvanassche@acm.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[acm.org:+];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,amd.com:email,linaro.org:email]
X-Rspamd-Queue-Id: BABCD17DBC8
X-Rspamd-Action: no action

Before making changes in dma_buf_import_sync_file(), convert it to
the early-return coding style. No functionality has been changed.

Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 drivers/dma-buf/dma-buf.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 11711874a325..1666133ac8b8 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -523,11 +523,13 @@ static long dma_buf_import_sync_file(struct dma_buf=
 *dmabuf,
 		dma_resv_lock(dmabuf->resv, NULL);
=20
 		ret =3D dma_resv_reserve_fences(dmabuf->resv, num_fences);
-		if (!ret) {
-			dma_fence_unwrap_for_each(f, &iter, fence)
-				dma_resv_add_fence(dmabuf->resv, f, usage);
-		}
+		if (ret)
+			goto unlock;
+
+		dma_fence_unwrap_for_each(f, &iter, fence)
+			dma_resv_add_fence(dmabuf->resv, f, usage);
=20
+unlock:
 		dma_resv_unlock(dmabuf->resv);
 	}
=20

