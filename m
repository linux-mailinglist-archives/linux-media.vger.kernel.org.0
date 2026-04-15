Return-Path: <linux-media+bounces-58794-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MP3zLglO32mFRQAAu9opvQ
	(envelope-from <linux-media+bounces-58794-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 10:36:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 280C74020DE
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 10:36:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5E26630C4EA0
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 08:32:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFFB13CAE68;
	Wed, 15 Apr 2026 08:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="OeulM41R"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBEFE395D87
	for <linux-media@vger.kernel.org>; Wed, 15 Apr 2026 08:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776241939; cv=none; b=WtQ4dp8QozA13im74K+oezqIIAUCJ/ND4hQSs9kIwy/LH1yNma+8gnaOuaMNwK/O0vv5Tv1pt7Ap3zP3ywl4tvUGogc+DDkzp/4ZWAmyUf++Gj1dqiK8aB57sU9+89vK2DDQm+Oy1IiDmjMzBVNeT/nm+opu7GscXGr1Hz4mtsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776241939; c=relaxed/simple;
	bh=x66kQfrFrYjoIpaFR755Xxz2TSD2Vc1x7T5NXfjKNy0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NQIdDtKL8JkRwbAQtxTC5ecS4ocyvWm89vAQe0cJVcUPtcvuVBD5gw/WxInAgeMK24Ss7JLJT9nJUZSvZNEhcaa24Ir3KEIq63S8Uy/ETUVYS/V9G5l95ZWoqbDN0462lqJ4B2TTVVWT9QUf71DOzTgtBSRwpAB5rsMeveVBkaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=OeulM41R; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=uccK1UlL2q32e1lqqlAUKrHuRToJr+1oqiB2D8KJ9Yg=; b=OeulM41Rf9CI3FDF8rLSWIjC+9
	eMmpb/EjpJ6DkFSDG9BtOlSAoq3VHNB/aTadHr6u59crhbgjXtVufe5GLiSZjxeu6e6DOpOZEW+Eo
	QJl7ZpxN+ARQQTDmYMtEHHxz/vAQnLJpSV5dMGCISTc/r37Cr4vDpIvxxhch2Ipb9sRGsfffladBR
	LDR35MpKb0oJnvbEQ/jqCkkaJEuRujqh4nnZyqQphZ5xCKbBvDmuNwDPfzTuCspmdG2LFUyuJgTns
	LgOz0IJbkkN/G9xSlkR867pGVbvsSJMbs0cjwv3n+ExDIJHFHgVzLvo7uFA5WdazaAOVQjQ1fetL+
	NwLs7G8A==;
Received: from [90.240.106.137] (helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wCvfO-00GHZP-5K; Wed, 15 Apr 2026 10:32:10 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 1/2] dma-fence: Silence sparse warning in dma_fence_describe
Date: Wed, 15 Apr 2026 09:32:06 +0100
Message-ID: <20260415083207.40513-1-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.64 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58794-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tvrtko.ursulin@igalia.com,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	NEURAL_HAM(-0.00)[-0.910];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: 280C74020DE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Sparse complains about assigning a string to a __rcu annotated local
variable:

drivers/dma-buf/dma-fence.c:1040:38: warning: incorrect type in initializer (different address spaces)
drivers/dma-buf/dma-fence.c:1040:38:    expected char const [noderef] __rcu *timeline
drivers/dma-buf/dma-fence.c:1040:38:    got char *
drivers/dma-buf/dma-fence.c:1041:36: warning: incorrect type in initializer (different address spaces)
drivers/dma-buf/dma-fence.c:1041:36:    expected char const [noderef] __rcu *driver
drivers/dma-buf/dma-fence.c:1041:36:    got char *

It is harmless but lets silence it.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Fixes: ac364014fd81 ("dma-buf: cleanup dma_fence_describe v3")
Cc: Christian König <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linaro-mm-sig@lists.linaro.org
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 1826ba73094c..a2aa82f4eedd 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -1037,8 +1037,8 @@ EXPORT_SYMBOL(dma_fence_set_deadline);
  */
 void dma_fence_describe(struct dma_fence *fence, struct seq_file *seq)
 {
-	const char __rcu *timeline = "";
-	const char __rcu *driver = "";
+	const char __rcu *timeline = (const char __rcu *)"";
+	const char __rcu *driver = (const char __rcu *)"";
 	const char *signaled = "";
 
 	rcu_read_lock();
-- 
2.52.0


