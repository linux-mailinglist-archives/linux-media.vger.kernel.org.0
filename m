Return-Path: <linux-media+bounces-65314-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Au9fDizkNmoDGAcAu9opvQ
	(envelope-from <linux-media+bounces-65314-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 20 Jun 2026 21:04:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C84986A98B8
	for <lists+linux-media@lfdr.de>; Sat, 20 Jun 2026 21:04:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=wanadoo.fr header.s=t20230301 header.b=Ew2OekyL;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65314-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65314-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=wanadoo.fr;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A72063019073
	for <lists+linux-media@lfdr.de>; Sat, 20 Jun 2026 19:04:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEBED369D40;
	Sat, 20 Jun 2026 19:04:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-76.smtpout.orange.fr [80.12.242.76])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF43323507B;
	Sat, 20 Jun 2026 19:03:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781982241; cv=none; b=USXC1tHHs6bKKALTrpNdK72NM1Pekf3KBv6qMNk8cXSFasTKBNn4GvZIX+sV+c9v6XRNrzzoAzMb0NQEH4K/oDwoY5wW4SMlv9gFfwP4ZB76DH+A6wb+1LFffJJY71li2CtZEg9RNq/yRO3ylKY5Ivg1g6bjkI52CfM16kHxZvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781982241; c=relaxed/simple;
	bh=FI6bw++Kc7axxgvlIih929lfgrsE4naItQl/pu1oNzw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FnMDfi+PmqItxmSA6Mm1JxVqGC4ApHBtF7bDCwSnK5p0QNw5k0vKxSdfTfzBBWtHZOPUaEXVLzrR47P/+Zu8xS9z0mcL0XKvklYnrMqbpU8Ude4iQHmWEuZEVpksNoDNZWtDOVGxQOT3TAzLgw1KJDgogeH40qqFBTUp+ACUFt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=Ew2OekyL; arc=none smtp.client-ip=80.12.242.76
Received: from fedora.home ([10.65.86.64])
	by smtp.orange.fr with ESMTP
	id b0yywSlMgHZYzb0yywfRHs; Sat, 20 Jun 2026 21:03:56 +0200
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPSA
	id b0yqwzd9alGVGb0yqw9nCW; Sat, 20 Jun 2026 21:03:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1781982229;
	bh=Tnzf/9MYbLhRoMLq6dvHjdTcKxmYKFVyOTlXu1yZe5k=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Ew2OekyL8uTsQBxLeGyJ/LlvqL1cjFH8Bow26ldviiQkX9Q/ZNjmn07ByMPeELrTT
	 UsCIdcryBYHQBcS0LwgFgaNwybqnw9aMrMvW98+GLVP0SbSWqG3csVG/QMiT48Bf8+
	 E5hJHgcYSufOO9UoOUgB9saZhP3165/TSEOhavNJzRX3o+/cQ4CSH8lOPbAXiXT7de
	 w8weFMji3UvE4PxqFZsxfZrpKuMuDLboveiAzElEUzH8vuntXjAXDXg/jsRlZxewK5
	 U3K0/L/g8V29TtU0QLVt3F40H5qaRTvG5mXVt4mkotb3FauiMePD+EkSx/xYQBQxM3
	 EDzzek7axzvbw==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 20 Jun 2026 21:03:49 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Felix Kuehling <Felix.Kuehling@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Xiaogang Chen <xiaogang.chen@amd.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH] drm/amdkfd: Fix an error handling path in amdgpu_amdkfd_get_dmabuf_info()
Date: Sat, 20 Jun 2026 21:03:45 +0200
Message-ID: <44cbc1d12fc00121d40ce793074bc5e1d497c932.1781982199.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[wanadoo.fr,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[wanadoo.fr:s=t20230301];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[wanadoo.fr];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,wanadoo.fr,lists.freedesktop.org,lists.linaro.org];
	TAGGED_FROM(0.00)[bounces-65314-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:Felix.Kuehling@amd.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:xiaogang.chen@amd.com,m:linux-kernel@vger.kernel.org,m:kernel-janitors@vger.kernel.org,m:christophe.jaillet@wanadoo.fr,m:amd-gfx@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[christophe.jaillet@wanadoo.fr,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christophe.jaillet@wanadoo.fr,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[wanadoo.fr:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C84986A98B8

If the memory allocation fails, the reference on 'dma_buf' still needs to
be released, as already done in the other error handling path.

Fixes: f54ce9e8cbd3 ("drm/amdkfd: Let driver decide buffer size at AMDKFD_IOC_GET_DMABUF_INFO ioctl")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
index c693c508df1a..e1afdad07c43 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
@@ -603,8 +603,10 @@ int amdgpu_amdkfd_get_dmabuf_info(struct amdgpu_device *adev, int dma_buf_fd,
 		if (*metadata_size <= buffer_size) {
 			*metadata_buffer = kzalloc(*metadata_size, GFP_KERNEL);
 
-			if (!*metadata_buffer)
-				return -ENOMEM;
+			if (!*metadata_buffer) {
+				r = -ENOMEM;
+				goto out_put;
+			}
 
 			r = amdgpu_bo_get_metadata(bo, *metadata_buffer, *metadata_size,
 						   NULL, &metadata_flags);
-- 
2.54.0


