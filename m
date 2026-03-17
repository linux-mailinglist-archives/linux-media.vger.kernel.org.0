Return-Path: <linux-media+bounces-56094-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJwyBc5ruWmvEQIAu9opvQ
	(envelope-from <linux-media+bounces-56094-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 15:57:18 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 656EF2AC7F3
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 15:57:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A695831A6772
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 14:48:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 128643E867C;
	Tue, 17 Mar 2026 14:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cqIJIr5j"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3AF3E866E
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 14:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773758910; cv=none; b=ONtuy7J/qXdpIu+LlByxliYMtEeprVJ/JacOs2FlRBxS8S4XmrgnwUvDtcs7S1IgOIo59xN3LCTmjQU/n61BS8v7aNkEOA840uRnLvtrs1GNWyWIOhUuCAsaP35LcNngna55JiGes9ts5nrq3aRjxztyxuwET+n2ycexHh9P2bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773758910; c=relaxed/simple;
	bh=MRhEDQicPgZPuglhA5HDwObVU5ZCl1vpXpTFM1yKskU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ijvgYa1nuieysCJo8l98CubPVKCR+P+lKw/TkKOBOjfi5pPKzhPWnsaYHEeCvL7cgm47y9MK6ZTXrJiKeXyQbc+VpFLwI4lnjuzvyL7suwHYKudcVkWP4f9xXOgT+aVm+pgRNZOXFNDVfssx9r1T5wejNvE3Av5aVWJoYaNEBmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cqIJIr5j; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-439c6fc2910so4429875f8f.0
        for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 07:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773758907; x=1774363707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M8gYAozgCWDOAMG74D+3BY6ig21lwzb2NHNogEZp2oE=;
        b=cqIJIr5jYIdsrVbglXDXTSao9GGnnG5UpdybkyAR1E6LU19OqxPSl6rFBRmGV7P9mt
         U+Z9jA93gPybXj5qts5Kbw79IQnLX+C/acY0GusyfkChThI3Ph2k8gWCy00ch5KgmG17
         i5FWiuukZtb7kASzMBGLhDfU2JT5Jodq9cht11qBxhNwOw063BSXN4sfLELReGnI7eOS
         2eC5WUx4UBGTOFiWVLXReOm/2a3rbvl+rz2w7l+oibKF5XH9R/4Q+jfd/2txhD7j+18E
         SeO6a0t8yq8Ah/d1y+Ngr9XXgDRTuQUer7N6Edt6ENBY0FYW1w1Kiub27cXaeeBOvays
         gf9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773758907; x=1774363707;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M8gYAozgCWDOAMG74D+3BY6ig21lwzb2NHNogEZp2oE=;
        b=X0mVQEDX48MZRgUfsi3zpuFV4YYe4LUWWUewK58LsofHR5YaF5lSD6oiya1BIee8bJ
         2/ix3RycOw8nmTTk4ptU5zKqcXEyQuLxjArl/DzTYjniAUWh9EqPlgc8a3gmv96TjCGr
         0/Q00LhFHPoZhxwUC3rOTKCCeopxVC+PHzBhXDoNlgxetXPWLdhAmFVzRAShgGRqQav7
         yVqRaR1ptddZaSgHRYSpXmhrGr59sOXx7sk+kPifKEgGcNRdID7lUE7CYAHrGwGRORbF
         v5Lfr7Ijx/AL70wHStZdn132kskudGRPUON/gUo1R9/TIDvY+JUlrfTGdHtlWU1wIzzN
         6wFw==
X-Forwarded-Encrypted: i=1; AJvYcCV0NOqVgZMK/d7vLQn9Om8rol0WbaQcOKfxTiiboeMmNedCD3fSIlx87AQwpEDqXPxDj44n0BrXZEIPig==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVwer58n2ie2LbMn124rJIR0UwWI/kkyExFyjDvIQfLvGK9Rfj
	6s7FFCLVA+fspcz5Vtdz1/mhuqga6ULnT2IqYiWwUJ2GfO7PzYHRUkoK
X-Gm-Gg: ATEYQzx8jClYXC82bykPp7tngAgQ+SGWnNLLg5vQM3m5+vj1hq7KLkGc9FjwkK7vL49
	AT0aWDktXx/i217EpT8+QKOVZcGnS1uCBLZuu/F8XgRCgfRoCgw7TULoVVP8ifssoYni/aVTuIM
	qt9lyyZppb7EFzYImNphosWXJAuYoRmWXArffUXQhTDQk/lCm6DD60xFmfPxMX5jT03RAEBemvZ
	yNDFu1ZBzSUONPGOaevvOaj5qaQvoGyzzL4Exy4pS3ykT3YRxXb0YOS0YOPNcrcmT0mzpOulRxg
	acmouUDnJ3rjhduM04lwFJae9ydkQ9kSDc2hZsSL89psGL2fqOk7f6zAuVLFUYL0SiQbkLJnHBK
	bMQjmp40lbKEG1BDQsBBO3/nLJbPPkVFDTlvwP8hXhWF3r/o3vYNhjx4Oygpq+rHhsrn60p2i5k
	2oAh+WdyQv0EHWkE7z7utb+aMY3obI51RQYH/i9vOzWHgPXQ==
X-Received: by 2002:a05:6000:2601:b0:43b:48e3:fbee with SMTP id ffacd0b85a97d-43b48e3fc39mr8977145f8f.37.1773758907211;
        Tue, 17 Mar 2026 07:48:27 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1570:2300:d8a4:3e2d:eba7:95e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe2186e3sm57302132f8f.26.2026.03.17.07.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 07:48:26 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To: phasta@mailbox.org,
	aliceryhl@google.com,
	boris.brezillon@collabora.com,
	gary@garyguo.net,
	lossin@kernel.org,
	daniel.almeida@collabora.com,
	joelagnelf@nvidia.com,
	sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH] dma-buf/dma_fence: be more defensive in dma_fence_release
Date: Tue, 17 Mar 2026 15:48:25 +0100
Message-ID: <20260317144825.2318-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56094-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckoenigleichtzumerken@gmail.com,linux-media@vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,amd.com:email,amd.com:mid]
X-Rspamd-Queue-Id: 656EF2AC7F3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In case of a refcounting bug dma_fence_release() can be called before the
fence was even signaled.

Previously the dma_fence framework then force signaled the fence to make
sure to unblock waiters, but that can potentially lead to random memory
corruption when the DMA operation continues. So be more defensive here and
pick the lesser evil.

Instead of force signaling the fence set an error code on the fence,
re-initialize the refcount to something large and taint the kernel.

This will leak memory and eventually can cause a deadlock when the fence
is never signaled, but at least we won't run into an use after free or
random memory corruption.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 1826ba73094c..8bf07685a053 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -593,14 +593,24 @@ void dma_fence_release(struct kref *kref)
 		/*
 		 * Failed to signal before release, likely a refcounting issue.
 		 *
-		 * This should never happen, but if it does make sure that we
-		 * don't leave chains dangling. We set the error flag first
-		 * so that the callbacks know this signal is due to an error.
+		 * This should never happen, but if try to be defensive and take
+		 * the lesser evil. Initialize the refcount to something large,
+		 * but not so large that it can overflow.
+		 *
+		 * That will leak memory and could deadlock if the fence never
+		 * signals, but at least it doesn't cause an use after free or
+		 * random memory corruption.
+		 *
+		 * Also taint the kernel to note that it is rather unreliable to
+		 * continue.
 		 */
 		dma_fence_lock_irqsave(fence, flags);
 		fence->error = -EDEADLK;
-		dma_fence_signal_locked(fence);
+		refcount_set(&fence->refcount.refcount, INT_MAX);
 		dma_fence_unlock_irqrestore(fence, flags);
+		rcu_read_unlock();
+		add_taint(TAINT_SOFTLOCKUP, LOCKDEP_STILL_OK);
+		return;
 	}
 
 	ops = rcu_dereference(fence->ops);
-- 
2.43.0


