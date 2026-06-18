Return-Path: <linux-media+bounces-65186-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9ro3AAjeM2rtHQYAu9opvQ
	(envelope-from <linux-media+bounces-65186-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 14:01:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDD369FDFE
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 14:01:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=Qi+breEo;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65186-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65186-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8C75F304EA25
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 12:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50D913C5DD4;
	Thu, 18 Jun 2026 12:00:55 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE2B379C45
	for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 12:00:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781784054; cv=none; b=tt+2ucYyFwVOcOQq0NnuXsBFDrgh/OKI6noAbI6jeBTUd3hWRZiC10ZWFQo/Ms8jKQEkwMk4pFW2pHFUnWwsEv3twFRp0p3oB9s5t+tUzsg+Q3JzuqSnLbvOM9N04ltBXroq0RCh9TXfQfR+O2qFom+MGoKC9vTtxuPoF+T22zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781784054; c=relaxed/simple;
	bh=3YOhz77h8AMLNNNeRgTMfPv3eIs7NkDdZEhdXJIfzD0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=OLR1kWBSuxYMHWF/iDA5nP9T+K8xWwPM+Gq46vDkNs3m7K0hccVNtpjDJ9NJf6qhRaEQsJu19JYDGVM4YhlBaZZ2PF4k/WSLKR8EDEghtCFxJLNXpfyHoeKtVOrbaXiy6m36UNNG+xG9yycKjNKIsjYVOqtfnwur0ytjZSLnHPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qi+breEo; arc=none smtp.client-ip=209.85.208.48
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-68bfcf11050so1388257a12.0
        for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 05:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781784052; x=1782388852; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W9ZVu+TQxqykUMzB+TkWY3eQThy4ReD8LVPOwN/E+6k=;
        b=Qi+breEoAi90N6K+nQ7FfXyf6YJrINK0IZhgzhU79IYaNVD2dI8kipQx/kOVnLo5iP
         ozSBMZ4AyxRtUe26zkovSHtDnU/s7NQ/bPI7+8hKMv8ZHOyEhRcs/SGbAI0F+nNSlIZX
         2ZluhklhjrTLgUAOpj8D/AzVPiEO0+Gls8eO74e55HbtgeCm8jmrKtmCaB9osEJFwGO+
         2LWGbdzUAejsFQGNmKiWDlEQJSCcYRpeXiDdjNkGUk5fqWzHEqSHmoDlJLOaLeEhQ9j8
         iN/QTJs5eKDJylhdraX0TmcotdjVT9MZmk/jqyX1Em/ni0bZ+H57Ve5RUoTOYdoD91w4
         z2MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781784052; x=1782388852;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W9ZVu+TQxqykUMzB+TkWY3eQThy4ReD8LVPOwN/E+6k=;
        b=fBhiQiZ6zp+jyjMcfvKTkjsXNXzS6IqGj2k7+Q68GInwyohh8LxBZxQYNNEoO62cmG
         EsabJPlbzJrvyoKuBjdFCKK/HQoFT3TsCxxe3vONTOF72PKWLJZzr/dAN1Sb1lAHHTly
         toSx7ngShNJBm+q2cC+U4DhfRDmuAaZsM1Nu3Cd77PfNshWvs0KW9+qCi3kJdvW29WTx
         g1z2XFvm94PyshMs/X4GKL1lCoNd+IkvgCquZ5txLBjOY1JDT7dukNb/nEoIiKsormfs
         CLEzBWRB8Jbc5zoGagHQx99mytoTMQ4EUu+2fAVOjzuq3whJ6FgT4zDsYkdvCjZjK//f
         LpeA==
X-Gm-Message-State: AOJu0YyLaZf/dCBxMydsOz0FbzEs/B9NTcsuetIKnPt1ofmN7Vsqay+X
	V3SwnFQHOSFLTsblf4aW2FzIBJNNufuYDiFZ8dsusySSc6Ka5pSIIr/umLaifRA558M=
X-Gm-Gg: AfdE7ckX10RiRtmWq9176ch06BNXVuEqFu0dC8eX1Lx1I35SbzqRxoYzJ0K9LUSnL9y
	YRMZeX4uRv9/sP4FWwJ3w1uBXkCQpLtGZry0oQD2ElC3uAzmrjq5u13fFQye2frUyyYwzdGdDn5
	3fK4K4ikzs9wqThIeYo3ui3LGgzdZHsYuSIQiTsCZqQsNs3xFNDI0W5BvVCnRJ0vVwAiBqou1gd
	kZFS5BJOYGzSdjdZ6a3cZxCSn2Z7CEt5OOYqVKApW0HnfHew1Nd4Y/R+xnXQvxejb/W1HSfq2zs
	5z+I9Ug707tVsBWUkIOb0vI5gJdvyv44my6pyOZVTOMRE4S+VYN4o0HKKGPWDT+2e9Sbzg1/q0j
	vH3AX6E/xDcB7mG5evrVFV/SQZ10+387zvXn9/C45XYnfUSnFuj8KgMVIdL5MTVOiragU4nOb2Y
	f7LCBUuh0mIeRENSWrWqLVPVznuvmV6/WEDAqK2e+H57GrvpuhiSDj4Xpodi6V595l4Y99xuLIL
	J+0Z6M=
X-Received: by 2002:a17:907:94cb:b0:bef:8141:668c with SMTP id a640c23a62f3a-c07c4a063e6mr96074166b.6.1781784051445;
        Thu, 18 Jun 2026 05:00:51 -0700 (PDT)
Received: from puffmais2.c.googlers.com (181.179.204.35.bc.googleusercontent.com. [35.204.179.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb4420966sm954924566b.9.2026.06.18.05.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 05:00:49 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 18 Jun 2026 13:00:39 +0100
Subject: [PATCH] dma-fence: use correct callback in
 dma_fence_timeline_name()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260618-linux-drm_crtc_fix-v1-1-801f29c9853d@linaro.org>
X-B4-Tracking: v=1; b=H4sIAOfdM2oC/x2MWwqAMAzAriL9tuAGm4+riMiYVQs6pVMRxLs7/
 EwgeSCSMEVosgeELo68hQQqz8DPLkyEPCQGXWhbWFXhwuG8cZC193L4fuQbtS2tMU75qh4hhbt
 Q0v+07d73Azf7nLhkAAAA
X-Change-ID: 20260618-linux-drm_crtc_fix-267655a1c89f
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, 
 kernel-team@android.com, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65186-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:tvrtko.ursulin@igalia.com,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:peter.griffin@linaro.org,m:tudor.ambarus@linaro.org,m:jyescas@google.com,m:kernel-team@android.com,m:andre.draszik@linaro.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[andre.draszik@linaro.org,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	RSPAMD_URIBL_FAIL(0.00)[linaro.org:query timed out,vger.kernel.org:query timed out];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RSPAMD_EMAILBL_FAIL(0.00)[andre.draszik.linaro.org:query timed out];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andre.draszik@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8FDD369FDFE

dma_fence_timeline_name() is a wrapper around
dma_fence_ops::get_timeline_name(). Since the blamed commit below, it
calls an incorrect callback.

Update it to restore functionality by calling the intended callback.

Fixes: 62918542b7bf ("dma-fence: Fix sparse warnings due __rcu annotations")
Signed-off-by: André Draszik <andre.draszik@linaro.org>
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

---
base-commit: e2cae00c05d196491c318196792297f2dfbaa02c
change-id: 20260618-linux-drm_crtc_fix-267655a1c89f

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


