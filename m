Return-Path: <linux-media+bounces-65552-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UFgTF7fNO2qDdQgAu9opvQ
	(envelope-from <linux-media+bounces-65552-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 14:29:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 455DC6BE1A2
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 14:29:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=i0GJxN8+;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65552-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65552-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7ACE7301319C
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 12:29:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E4983AEF34;
	Wed, 24 Jun 2026 12:29:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8760B347516
	for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 12:29:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782304168; cv=none; b=qO4a1WSdz7N9I9EpuPzu004KVimSgqBVpAzkPVGvIayofIDSKYAuJYgDuW+DiT//yIDQoTkvdHXuwX/M27vp3RqRxX2zj5lzva6PdQKa/hSms+6Bi0cKuwST/+JxHptqxvFCOQRt0S/NwKgSmXnULu0W/gQRwFtAgblu6RIHq2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782304168; c=relaxed/simple;
	bh=KJKetM45hW9YvejIwZvUcamHVi4DJnD93eD1AXR5D20=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NJ+BOk44EGB92aX7+bNFPyqq2bB74pXU8jM4OdwA5+kIBD+9UsmCFyveO77dqyPmH1TXHHfm/i28KV3q3sug+moQ4kEUNeuHo9nS1osyBUQh3ZklhCcJql6+LTpUUkeIjilSV4Okxm2ivu8RCzclflXQb+4yibvfGuCI0yH+QUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i0GJxN8+; arc=none smtp.client-ip=209.85.221.48
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-46cbf263113so350194f8f.1
        for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 05:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782304162; x=1782908962; darn=vger.kernel.org;
        h=content-transfer-encoding:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XAJmFy8LAnGJsBUtLmdOHGEG0gZamE6rRydN5uBopPw=;
        b=i0GJxN8+DVFLP3lpOPy/odnfhPYDn2yYVvpd6pUvCgD3bAMDG/ekQKfvt8a41G0f7L
         g5QUkneOHNXlhfuG0wj3yK9Ig0jjmZxl1mbGCryT5OdQXFAdxxf2Sg8WPe20X2l/liNq
         p0DGkJ3juzk0t9tjOxc8QSXQLPqwFoXBfKH4B0QmLkzqizmvfdvj+wbbFbeMYvrILgvw
         tWVqh0ugw4a/Vu9EpmIBT2+CPAl4U3bEp8RucOjKoc1s0Lw3pEMx7ZxB+AAB8s7Lz1gn
         Vss/7pjjdA3nk0q+IOpbZc0ImDBlCF6LsstftQjabUqm5/DyHt9FMeUcO27NfBZFeVPH
         zTjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782304162; x=1782908962;
        h=content-transfer-encoding:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XAJmFy8LAnGJsBUtLmdOHGEG0gZamE6rRydN5uBopPw=;
        b=JL2Oqm9KTn7jMtMHs297wclSpVwbM9ePpuVigIQS5WrAziOMAnTx6zwq5g3FeYaHPu
         s9Bse2YDzdH0zJgll42XbBL/i9Rnc0lmN/9OrrXddke6kJsJrvH6o+xP6sXSm8UYpOXg
         uhmbjIORd2HK/baPcmrw/wFuRp6nZZsCvxFZoZnqKZrf6OKrtW9/YnaobXrAR7LVzDfc
         /zS1Uuq60i8cwwvKx5dp0p0//O4GxxGFEWHu0m3IIEO9uReZACtDhEzOhQZVKElXJrs0
         ftmNK8C0kvT5uRm7rTzYYXvcOLouSBtrR9ojWZaiRcCM+vymqBFpWZDwb3rs0EDLBmp0
         5lXA==
X-Forwarded-Encrypted: i=1; AHgh+RqBKjG8MX+CX+DXpg0XCMkgNlmmZs7DwYeewCfjJV5l+p3/Ksj+siPHbtyBiyKR+FvZgocpXJIY5tk/QQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTeWJoR1jPWNRDNoH1CdAwNXvaSI8ofGz5T1dgprJcLLjW8jK4
	qJCWlFQLZANuei+XC0LapCKqbam0nckA8ecdRR/8XU1R3H41/QUm730F
X-Gm-Gg: AfdE7ckZTve9Ht1eSmXuLHMxIxQkNgPbV0GvPTubOTF/twcySyRgThVCaDo4qOHHSsr
	yYVi5mfzgnY6AxjrLV1RMJNI1MPLcCvr675wYmSYg01njsEVEAAcMrp0zqKa2sapTG4Sp7UaHON
	u8LV1WEhjTO9Jan6HD9yC0J7/VCJatWLg7cL3amQ0JeHWBBuvOmeT4IR3OvqljV4+THzWO9leim
	9SIdHUPpbMJTEb1p5xB0rnI74saDjsdKVF35Zt9nArwNqwXlwpcv21Xum+8RcC0ioT/jSXI0HDz
	lYRWpB8HJoFWOsK/aomxudMyufZV3hvMbvi346DzrT1SM/5muh8J4dT7PEKAbNIr2yNdWNGvbGb
	8VRugvPZGrA0AympnnhJfamIECtcpMy9qCtBHlDbnv6BGfbTEZWFXwoP9wW+MIi0JbW8g2Y/FQU
	FoX59NTt/ssSHxcAW1sFBuAQuD1Q==
X-Received: by 2002:a05:6000:2587:b0:45d:41e0:467b with SMTP id ffacd0b85a97d-46c0951d92emr5308154f8f.3.1782304161896;
        Wed, 24 Jun 2026 05:29:21 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:157e:3500:2be7:1a89:41c5:9239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c9787dddbsm3896530f8f.3.2026.06.24.05.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 05:29:21 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To: phasta@kernel.org,
	simona@ffwll.ch,
	sumit.semwal@linaro.org,
	tvrtko.ursulin@igalia.com,
	dakr@kernel.org
Cc: dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 02/10] dma-buf: use dma_fence_test_signaled_flag()
Date: Wed, 24 Jun 2026 13:13:26 +0200
Message-ID: <20260624122917.2483-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260624122917.2483-1-christian.koenig@amd.com>
References: <20260624122917.2483-1-christian.koenig@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Reply-To: christian.koenig@amd.com
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65552-lists,linux-media=lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:tvrtko.ursulin@igalia.com,m:dakr@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ckoenigleichtzumerken@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	HAS_REPLYTO(0.00)[christian.koenig@amd.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckoenigleichtzumerken@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,amd.com:replyto,amd.com:email,amd.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 455DC6BE1A2

Instead of dma_fence_is_signaled_locked() use
dma_fence_test_signaled_flag().

The extra polling check seems unecessary for those use cases.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/sw_sync.c | 2 +-
 include/linux/dma-fence.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
index 8df20b0218a9..243991bc1506 100644
--- a/drivers/dma-buf/sw_sync.c
+++ b/drivers/dma-buf/sw_sync.c
@@ -262,7 +262,7 @@ static struct sync_pt *sync_pt_create(struct sync_timeline *obj,
 	INIT_LIST_HEAD(&pt->link);
 
 	spin_lock_irq(&obj->lock);
-	if (!dma_fence_is_signaled_locked(&pt->base)) {
+	if (!dma_fence_test_signaled_flag(&pt->base)) {
 		struct rb_node **p = &obj->pt_tree.rb_node;
 		struct rb_node *parent = NULL;
 
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 158cd609f103..803e10ca76e3 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -658,7 +658,7 @@ static inline struct dma_fence *dma_fence_later(struct dma_fence *f1,
  */
 static inline int dma_fence_get_status_locked(struct dma_fence *fence)
 {
-	if (dma_fence_is_signaled_locked(fence))
+	if (dma_fence_test_signaled_flag(fence))
 		return fence->error ?: 1;
 	else
 		return 0;
-- 
2.43.0


