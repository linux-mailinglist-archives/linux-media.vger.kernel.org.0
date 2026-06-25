Return-Path: <linux-media+bounces-65646-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Hvo4E2o3PWoJzQgAu9opvQ
	(envelope-from <linux-media+bounces-65646-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 16:12:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0466C676F
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 16:12:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=eKFMUv7k;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65646-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-65646-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3A4BE300682C
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 14:12:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B106E30FF1D;
	Thu, 25 Jun 2026 14:12:46 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFDB2EEE65
	for <linux-media@vger.kernel.org>; Thu, 25 Jun 2026 14:12:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782396766; cv=none; b=EjhOk+fRZyfIzK+G5o374bUxrhpkHO7DpSV767GfQDNDxaXnzR9vor1dpho7+zqOERvzLRvvouoDiQCNhktVzrwfvduRYA4yMaEgoN6t4cDJu/VI0z1vQOutlq3n1PDHCijyJWsRy9NuRCpZxvtE00v/2ErgOFxcB/gt/SwcugA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782396766; c=relaxed/simple;
	bh=Vrr1iG9Zqz34yHCA8PwngRTn8hJ+90K2+6Om0XiEXdA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Qxmw4Sg9K8PBYxuZsqlcoEkL0BTJZOM74uKBwm5chvwNeg1YjL9+1LwvzKWdpxagucHxNicDoLHKMCBiz6zqSfT+tZycTb2FLY+Cz/rCZDjVmud1AXcxhsIM9wtfHnx2huPTYL4Cy7lxOGvR3oBMhYZQ+nYycAtBqQHK8EeCACk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eKFMUv7k; arc=none smtp.client-ip=209.85.210.174
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-845b6d9bf39so381124b3a.1
        for <linux-media@vger.kernel.org>; Thu, 25 Jun 2026 07:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782396764; x=1783001564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1agOcM108mYien5bPYKqYcmwOSbFBw2SAS45aRrQL3c=;
        b=eKFMUv7kj6dHWgGk7CTrHH2m/MNFoh+0gZZbTtfWC3rrJ0BRzFKWPsYvSmxR2tLRKG
         TgVnuB6hNEbhdcUV3mo3QTrn6NnwnL+FGeoCPzFPvWPqHhj9fGgNHaep0zYZwjm1nVVj
         veBQjgiLj18y4nC1+gaBbGPEezuTcD5XDVVsKe6Qm+ESNauVEwyrXVZxvAu1UZhNplNA
         X0HGdaIgfrqD79SOLrp+MmuykptBIFrvSjlfYcPLpLcPgcHVi90RaMHP5kzgBdh9BR1z
         Ra/Nuqu1q5hLFYgrcgBw70ZCtVkqDe8ll1Tyy4HERWbDhEat4QgTtxRlrL9FJU96m0rU
         HL9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782396764; x=1783001564;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1agOcM108mYien5bPYKqYcmwOSbFBw2SAS45aRrQL3c=;
        b=mZdUoI19qWM0kyJj55XiPoUDnpOa1Zr5EpT2NLEbqoLHW5B1GzHpmmqArn3c1YAKg8
         7TXHC6tThgAaq4UL0FpSt7Mh/g+Lhnu0lCwTRD3BZpDNScgDB/ueySuwo4FSjGT+EAaW
         AEBaQ8uavigxGudzaEGdgtDcBMtIp2yx9VDJWrQ31jl3l9lNn+YzPPvm9JO8rDpbKon5
         9GWLjAQFoMATrOvbCJxPrGTzR5kcl1Kgc8B1jkrVMuMX7cxddODhYLQVgALpJEmJw1qV
         B+WdKDcUHvy54B+vjKK6yewPN7Jb6z/CU64PDrCJbgZfEjufzjxyDnJKl8FQIM1z+HzH
         8IPg==
X-Forwarded-Encrypted: i=1; AFNElJ8DFahha4+1HPRW7IeGcTbYkCzANzavvQwIe4uvLoT4ciAcA71p6cB6wPxenO/e2wrH7qoQY98ydof/vg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnSf/jTt8g01RfiBIh5BHo0sbTu4tLPDFyM6qbKKVSMNFUpO0y
	jG9PnTlwyQk1eTxFnIRiwdy+HHGbWeO8YQkyNSK5fQk13fpI07UekUnZ
X-Gm-Gg: AfdE7cmAXXfCrI0lZislfnmxGWuC1QPIo/DrLnY7Nxcp9GE878REhmSoMWJrWHURr+6
	peu96FBiw0W1+OKDUEcBSU0hBzop1WL4Jpf8+/AaySBbbUhjLH1xSHAJmyejkUjBa32+kJuxIT8
	ObgLrSoahqGdLwLwKv4hmrEvvJsDxgN9FfFcXlXUDWuMjTg/yz1d3B4lb8+8HW3JCYWx8DPcA5X
	rj+/7s3Y9NaeXh/iSxVc7xUzy54s1DWA4whVmbPnMxDH+jtNUJp0F8IJ6tgixDWRhTZ3FGOBDgo
	hZ8LljVQuZ3po2+dxrcI/q0OOCyfiHuHpBoNIo/seGyMP6oBqvt2F91LHO0F33xSmthlAcRBZyA
	c7IQQki6EdPKmi9dp7SnLM2YiQOGVAfWKHVPWuRqF/7L2DkmO1rwZRmSdmQySPmptl9WXH7yB9z
	p9CiGNN6R7uuy5fxF4quFZ5kQczy8U
X-Received: by 2002:a05:6a00:10c7:b0:83f:250d:5a5 with SMTP id d2e1a72fcca58-845b44eb213mr2676677b3a.16.1782396764267;
        Thu, 25 Jun 2026 07:12:44 -0700 (PDT)
Received: from localhost.localdomain ([117.133.183.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a40d23d7sm4838015b3a.30.2026.06.25.07.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 07:12:43 -0700 (PDT)
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
Subject: [PATCH] dma-fence: Fix dma_fence_timeline_name() to call get_timeline_name()
Date: Thu, 25 Jun 2026 22:12:27 +0800
Message-Id: <20260625141227.38931-1-shoubaineng@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[ursulin.net,kernel.org,arm.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-65646-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:tursulin@ursulin.net,m:phasta@kernel.org,m:akash.goel@arm.com,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:shoubaineng@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[shoubaineng@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2D0466C676F

dma_fence_timeline_name() incorrectly invokes ops->get_driver_name()
instead of ops->get_timeline_name(), so every caller receives the
driver name where the timeline name was expected.

This is a copy-paste regression that has resurfaced twice. It was
originally introduced by commit 62918542b7bf ("dma-fence: Fix sparse
warnings due __rcu annotations") when adding the __rcu casts, fixed
by commit 033559473dd3 ("dma-fence: Fix safe access wrapper to call
timeline name method"), and then accidentally reintroduced by commit
e58b4dea9054 ("dma-buf/dma-fence: Add dma_fence_test_signaled_flag()")
when both wrappers were refactored to use the new helper.

Signed-off-by: Baineng Shou <shoubaineng@gmail.com>
---
 drivers/dma-buf/dma-fence.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index b3bfa6943a8e..5292d714419b 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -1202,7 +1202,7 @@ const char __rcu *dma_fence_timeline_name(struct dma_fence *fence)
 	/* RCU protection is required for safe access to returned string */
 	ops = rcu_dereference(fence->ops);
 	if (!dma_fence_test_signaled_flag(fence))
-		return (const char __rcu *)ops->get_driver_name(fence);
+		return (const char __rcu *)ops->get_timeline_name(fence);
 	else
 		return (const char __rcu *)"signaled-timeline";
 }
-- 
2.34.1


