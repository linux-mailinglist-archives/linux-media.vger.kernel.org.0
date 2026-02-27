Return-Path: <linux-media+bounces-53742-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6EEYHXrMoWnbwQQAu9opvQ
	(envelope-from <linux-media+bounces-53742-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 17:55:22 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3991BB127
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 17:55:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2A07E30300EB
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 16:55:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21BF334DCF2;
	Fri, 27 Feb 2026 16:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="zSbqK00j"
X-Original-To: linux-media@vger.kernel.org
Received: from 013.lax.mailroute.net (013.lax.mailroute.net [199.89.1.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5512434DB4E
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 16:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772211317; cv=none; b=HV3GDW0knDcOvXmE/0NEzKyJK93w3YKmUFbm+Bfq3yIzMiw7XOgZYinwupzDNgTfO0GC8twTU05CbQBUxxMTsbycHNlkrZA+sH9xnNQKmK2+ZHuhOfn3knWO40d1x6NjG9xX3/1ia8IevyrRE68x2XAen8iudyIlDSzz2Qw0NeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772211317; c=relaxed/simple;
	bh=V/IkXMAFxGrtdixiDQKYs4xwGDNoU1GSSWwo9XNIYZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fDs1HVNOIKHt7eYXchPfvlYoOT1RnMs39cXR6zcrPRzeUSxHTW/QebNzO3j/A1d4RRU9hVdRx3y0EKoLPUBTZItPsRHUaAYa/Lus37O+9JPVl6hwsC+Dbb66gY0+h3Tyg60g22WUk/b6wSS1hRlLsk0zasbIFMT1OCW6B7AOwQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=zSbqK00j; arc=none smtp.client-ip=199.89.1.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4fMvZq5lJSzlgr46;
	Fri, 27 Feb 2026 16:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:x-mailer:message-id:date
	:date:subject:subject:from:from:received:received; s=mr01; t=
	1772211313; x=1774803314; bh=++fxS/eCeGRNwXE9C4CvwpVvEFH5kogdsJ1
	nvCNrotY=; b=zSbqK00jagc/DjJCVEN/A5t5PBXZuMratNHuugq5YY9d5g2Rb8J
	n+Q7U7ZNOPR7h3gX8gr3BP9Daxh7nJ5pT+MKwOePa+2izEypvAH+mB6hkeIlqzAX
	VuSz/RB68+8xchKleD3hswcqxx4X8l9W0qu6KEGdl0bA8LIr6Y2J6qhEzGH4Q0I5
	ciVBxLNkKFB30jLuJzwoNjLMWVj9O9lOkpTLn0dcJZJiXWgw7JSqT9i0ifgynRuY
	f+WlV16AmaUDYaBSF+J8pd33yjkBewqXZKQex3k+idsSKLLrO1eQ9yAUS8ZwnAjc
	zYiXt39UJdI+RIE94WLhcwCqxufb/3/Cowg==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id IxumsdYBREna; Fri, 27 Feb 2026 16:55:13 +0000 (UTC)
Received: from bvanassche.mtv.corp.google.com (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4fMvZm0sZNzlfvpH;
	Fri, 27 Feb 2026 16:55:11 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
	linux-media@vger.kernel.org,
	Marco Elver <elver@google.com>,
	Bart Van Assche <bvanassche@acm.org>
Subject: [PATCH v2] dma-buf: Suppress a thread-safety complaint
Date: Fri, 27 Feb 2026 08:55:01 -0800
Message-ID: <20260227165501.2062829-1-bvanassche@acm.org>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[acm.org,reject];
	R_DKIM_ALLOW(-0.20)[acm.org:s=mr01];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-53742-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[acm.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bvanassche@acm.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8C3991BB127
X-Rspamd-Action: no action

Handle all possible dma_resv_lock() return values. This patch prepares
for enabling compile-time thread-safety analysis. This will cause the
compiler to check whether all dma_resv_lock() return values are handled.

Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---

Changes compared to v1:
 - Removed dead code.
 - Removed the return value changes.
 - Added a comment and a WARN_ON() statement.

 drivers/dma-buf/dma-resv.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index bea3e9858aca..ce9e6c04897f 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -790,8 +790,11 @@ static int __init dma_resv_lockdep(void)
 	mmap_read_lock(mm);
 	ww_acquire_init(&ctx, &reservation_ww_class);
 	ret =3D dma_resv_lock(&obj, &ctx);
-	if (ret =3D=3D -EDEADLK)
+	if (ret) {
+		/* Only EDEADLK from the error injection is possible here */
+		WARN_ON(ret !=3D -EDEADLK);
 		dma_resv_lock_slow(&obj, &ctx);
+	}
 	fs_reclaim_acquire(GFP_KERNEL);
 	/* for unmap_mapping_range on trylocked buffer objects in shrinkers */
 	i_mmap_lock_write(&mapping);

