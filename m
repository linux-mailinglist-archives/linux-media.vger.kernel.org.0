Return-Path: <linux-media+bounces-65472-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ev4AAy2MOmp0/gcAu9opvQ
	(envelope-from <linux-media+bounces-65472-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 15:37:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E0C6B7809
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 15:37:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=igm0Ou51;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65472-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65472-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4A16330A70EB
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 13:35:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E75E837BE95;
	Tue, 23 Jun 2026 13:35:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741F62D46B3;
	Tue, 23 Jun 2026 13:35:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782221717; cv=none; b=SFt37GOL45hMdVZw/zY30d9B5bLIdfSbtiqdj15vrwMXjI1fNQALP49u/S6yg6BYfBtLWne+q6nuorNdyicUU9lra68VqS6tIg1wkBJ7+ixLHejZ41gPjh2tTjwqmr4TWQVwnogVk4x2PGQhLCsXlonobN0MGVYAgZKSyOWPyfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782221717; c=relaxed/simple;
	bh=IDr6oRKb7Nqz7KTpc4Vr1ihOJQ5BGo5o0zLwDCFL4TY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VNXC7vAVcP/HqLNnEFVAzsfOHwQ+tKhmkDNAqYBq/a4aourSWJKvvsXAqXiVdEbo8Ofzgw1hJk7u6iPvyXiuC/rtP9ujV8Aq/RJyqiG+uTFsguDQ7Np+AkzxvBJ8AY+8iChbGRq7vZQ+FWuZpBEAIL2UF4jlhOKBLY+oah/sC1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=igm0Ou51; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 782B21F000E9;
	Tue, 23 Jun 2026 13:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782221716;
	bh=e2L7pUS6THPTgQRuS5kLnP/Z6QEsPEFFQSf/IKODmiY=;
	h=From:To:Cc:Subject:Date;
	b=igm0Ou51B3RVhCU9xzhsZ5mrxW98fjLsXtdFu+r9tuLhjwEZ5VwdM89Wl5zQZ5vac
	 HUvyFmAMlXJDcE0O18a2AqyN8gNcWhrdHGyhQ60FJaySzU07fc5H61gblDiv6KknFs
	 dSefAkLlHxcVnk3PDugrBif9JD4UenmnkzPiK/5EHeZPTOUZE9tSGj4m1x70OrBbMH
	 fvim/X7C81iYRSy4n2XVoBKO0f7miRX3pT6HO/fsq9ENh1Tv7org/glyjO/osvMC/E
	 rwXsj/BPzwLP+sLRV7RrQE40urz+n7KfB2o6KgYxkt5Jw03IW9WTY5FdGA7RGNYXyF
	 dnJB/E0yZTPSw==
From: Philipp Stanner <phasta@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Tvrtko Ursulin <tursulin@igallia.net>
Cc: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	Philipp Stanner <phasta@kernel.org>
Subject: [PATCH] dma-buf/dma-fence: Set better string for dma_fence_driver_name()
Date: Tue, 23 Jun 2026 15:34:58 +0200
Message-ID: <20260623133457.1029880-2-phasta@kernel.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:tursulin@igallia.net,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:phasta@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-65472-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[phasta@kernel.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 65E0C6B7809

dma_fence_driver_name() reports that a driver whose fence is already
signaled is a "detached-driver". This is incorrect, the driver might
still be loaded and running.

Rename that string to something more descriptive.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
Just compile-tested.
---
 drivers/dma-buf/dma-fence.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index c7ea1e75d38a..9c3dfa7b0066 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -1173,7 +1173,7 @@ const char __rcu *dma_fence_driver_name(struct dma_fence *fence)
 	if (!dma_fence_test_signaled_flag(fence))
 		return (const char __rcu *)ops->get_driver_name(fence);
 	else
-		return (const char __rcu *)"detached-driver";
+		return (const char __rcu *)"driver-whose-fence-is-signaled";
 }
 EXPORT_SYMBOL(dma_fence_driver_name);
 
-- 
2.54.0


