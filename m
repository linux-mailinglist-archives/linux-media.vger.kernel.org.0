Return-Path: <linux-media+bounces-65836-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id J3h8AArjQWr4vQkAu9opvQ
	(envelope-from <linux-media+bounces-65836-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 05:14:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC616D5A05
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 05:14:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=GNJWt5VI;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65836-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65836-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C886C30156F0
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 03:14:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FE5237C936;
	Mon, 29 Jun 2026 03:14:00 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3591F35CBCB
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 03:13:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782702840; cv=none; b=K8euN/YRvDdvQCX5Fhre/g/xkzmqxe5tQN2dhUUkYl5e4j7olUGAHn3DzvWv7fCIw+f8IrIA+8KyMQKuOmLXi73uS9ITAt+E0U9YdDRCOLHx4x5+tAxJc3uNp+cZBwv+oOQIiACZ5tEeDk5gNUQBpsvc9gjrnvN2vaFyoOB720s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782702840; c=relaxed/simple;
	bh=cA0miXNy764U+mxajh7wNC0vJ/SclL1zAKmOx2jfnzc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TMzN53WsXEu9SfoMnh/BX9XYMuBw5qT/vQTM4X4UR4ZkzyCLYAOeV5pgVKQkQVnnGaJxtsSEiqvKbgps585byR2JHHNoCj3LXMz8PcoKcPcZ8XIME3Y/5DtJw7un7IgwBoKTr14cWKj9bUjjnusjHNdy6aSxM+Z6Ku9PmpAZGkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GNJWt5VI; arc=none smtp.client-ip=209.85.210.178
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-846970f0acaso687652b3a.3
        for <linux-media@vger.kernel.org>; Sun, 28 Jun 2026 20:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782702837; x=1783307637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vIf1UjIu4HobsLfku1GIoLJNf/dF/mUSSo+eQGmmVZs=;
        b=GNJWt5VIKwOe+cRCpZeLVoIsl3fmdrJIUxFPB3YTe+zb6EmBuHz2n7gn1J7+bGxKqN
         /QbyIEWleI+NiiGvt9/KdCR5LbrgO8nO1T1Krl6wT0bbB8C5u15rztC1wm0SWVN4Htdt
         u/fjo/KmpCaY5Ge9PL0Zi3fo3hv+Q2mL6aAMQ5sYwVqP4xUopEQFXwNuqsXNtje3Szka
         K8PwhwO1IIMV47fO7T0mUELXIA2asnUM0ywy2XC+CQj4LF+Sbic5Pl6ipaiF+J4j4KHn
         5r2qClTSMyexeUiKxDswr3FoyMBEvYQagkRBB3V21BkElLEwB4r5rmt1Janh0IqisvTD
         4gRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782702837; x=1783307637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vIf1UjIu4HobsLfku1GIoLJNf/dF/mUSSo+eQGmmVZs=;
        b=TaxAew+5NeqMHw/gYL06TL8gbXCuEZQLgAcyckoSdpVbo7WMcKmt2qumYVfIWcdq2B
         DheLCFv65/5akVZ51zsC//qyEJV2VHPfdeAS09XdbJGsLp0rl0g8dHC2YDVg7JoxEMnS
         rmJO4V15j3Tey1oXTNV2sgVZ2rOYLDyy309EIL26RGIFHEd5jkIoNWtwwNL3t5V7BWeU
         mjqyYs+0+1yoWq6vB/GrSvo2jrnul82RJ7xvYqXvZ61pLJYDw3R/rY5sCNVkqyi67wlM
         GYxzo1H2x4gZkIdy+tPA9EDj2ezwlGHoZ5yRgUhz/zAJtzzalGBobhgcCiJDGZrlwKBV
         SeHw==
X-Forwarded-Encrypted: i=1; AHgh+RoOy/Oautcak1yLIZ3jyRjuyOWx6DHnUw+pi9r5j0q2I0r3nWWbeKtRyl7Sr88XACJdDzJBtyLgl7Lhag==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJSnE/I5Tj+Zcz80cEo8EnGLQ/y40bOIeYoyjWM+a61CXDdW1d
	Sx4Rhq5BXOM9B66vn+VE52Ok5djZkWU0gELuCB09SW0kequI1Dnc7DPD
X-Gm-Gg: AfdE7cnr3xrZ4qgx34JAohz/gKK0wevx2AwA8X3ulN4qvOhQdTSJ3f6Z2MqRnlOOVA2
	ouGwWKLdA+JfR4D6wV9XQpVlP772C2K4DBXWXT5TzmvrIS/no59B6d5shxADNYHoVJVev2akE0c
	SFed9unCFO5fkD7hjrGnHV45GblbuynlsztQnZvytGffYdU0c8oKyYbsvQsJVXCuvhDRF1aeLMQ
	wMZzNmf3zZnO8cuvesK/bcIG47GRXu0LcMeL9SGmLSE+XJFrGQgc6tuiWBbOuE2JTmsvyHFl/MB
	IafoGdzQ9xlKfdp0C9CADS9cTHbmPZxhhdqJVDIpaSTABiDe+v+kuKcDD6AO49B+pknq9rGnKEa
	ZbfFqjcOIscF8bHTmsOC4XZAMFj4tSYgUm6+tnG+eTSP9131smfo5HCMjr3nfAqe/xu+kbJyVGx
	gJ70VN8GSGTO6AlNSsyWji2giIx40W
X-Received: by 2002:a05:6a00:94f1:b0:847:88eb:1e00 with SMTP id d2e1a72fcca58-84788eb24femr987190b3a.49.1782702837428;
        Sun, 28 Jun 2026 20:13:57 -0700 (PDT)
Received: from localhost.localdomain ([117.133.183.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a4121fdbsm10761359b3a.51.2026.06.28.20.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 20:13:57 -0700 (PDT)
From: Baineng Shou <shoubaineng@gmail.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
	Philipp Stanner <phasta@kernel.org>,
	Akash Goel <akash.goel@arm.com>,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Baineng Shou <shoubaineng@gmail.com>
Subject: [PATCH] dma-fence: Make dma_fence_dedup_array() robust against 0-count input
Date: Mon, 29 Jun 2026 11:13:46 +0800
Message-Id: <20260629031346.3875683-1-shoubaineng@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[ursulin.net,kernel.org,arm.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-65836-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:tursulin@ursulin.net,m:phasta@kernel.org,m:akash.goel@arm.com,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:shoubaineng@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[shoubaineng@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shoubaineng@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6CC616D5A05

dma_fence_dedup_array() returns 1 when called with num_fences == 0:
the for-loop body never executes, j stays at 0, and the final
`return ++j` yields 1. This contradicts both the kernel-doc ("Return:
Number of unique fences remaining in the array") and the natural
expectation that 0 input gives 0 output.

All in-tree callers currently filter num_fences == 0 before invoking
this helper (__dma_fence_unwrap_merge() bails out via the
`if (count == 0 || count == 1)` fast path; amdgpu_userq_wait_*()
cannot reach the dedup call with a zero local count because the
amdgpu_userq_wait_add_fence() helper guarantees num_fences stays in
[0, wait_info->num_fences], and wait_info->num_fences > 0 is enforced
at the ioctl entry).

However, dma_fence_dedup_array() is EXPORT_SYMBOL_GPL, so any future
caller that forgets to pre-filter the zero case will get a misleading
return value of 1. Depending on how that caller uses the result, it
could dereference an uninitialized fence slot in the array, since the
caller's array may have been allocated but not yet populated.

Make the contract match the documentation by returning 0 early. This
also skips an unnecessary sort() call on an empty array.

Signed-off-by: Baineng Shou <shoubaineng@gmail.com>
---
 drivers/dma-buf/dma-fence-unwrap.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/dma-buf/dma-fence-unwrap.c b/drivers/dma-buf/dma-fence-unwrap.c
index 53bb40e70b27..364cbf79ad73 100644
--- a/drivers/dma-buf/dma-fence-unwrap.c
+++ b/drivers/dma-buf/dma-fence-unwrap.c
@@ -97,6 +97,9 @@ int dma_fence_dedup_array(struct dma_fence **fences, int num_fences)
 {
 	int i, j;
 
+	if (!num_fences)
+		return 0;
+
 	sort(fences, num_fences, sizeof(*fences), fence_cmp, NULL);
 
 	/*
-- 
2.34.1


