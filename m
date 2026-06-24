Return-Path: <linux-media+bounces-65554-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8b0HLNrOO2r7dQgAu9opvQ
	(envelope-from <linux-media+bounces-65554-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 14:34:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4A56BE2B2
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 14:34:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ITYwrN7y;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65554-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65554-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 31D5B3072568
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 12:29:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B01303AC0D4;
	Wed, 24 Jun 2026 12:29:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20F73672AC
	for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 12:29:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782304169; cv=none; b=asrKdE3mbVrxD3Wc2QDRhDwf9h9kXcAgajnT9OEFZbrB6TllXHMtYmHi17W+0mvCMYZyA4lDPMqP3Iy4tDPoE8zVQLWv5A2iegCadJiZ+Biv6g6Mt9FrnZovTtPprS4H1+EnSdZTyUet2uYZkzSAOR+0mEUjHa0zXhm5x6tJWY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782304169; c=relaxed/simple;
	bh=Fr8pFlDPb+EL5z5OWtwOxvgtipp4gg1YXRaW6QmaqW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JC4OqQNWNMcXmL8zFGKSfU48dw9sckW0CG8iTeSCZL0OGFzjoo3rYu+D4CthaMuciIZOFqo/QYyxyDUD+VAiFHIi1xLX0g9scQvLnZftgn6v/Im7Ia9EpCvkQZm7ClegIx0rZmwZ77GK1a0nw0LLGnsGWcpchuYc5l5LJdpA8EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ITYwrN7y; arc=none smtp.client-ip=209.85.128.48
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490b64c8311so12335705e9.3
        for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 05:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782304166; x=1782908966; darn=vger.kernel.org;
        h=content-transfer-encoding:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CTDR2FGDDMlL0SKna41UWrjV6rjHoFlolha4zevYi4s=;
        b=ITYwrN7yY9s4zV+jgUuR3Cf6L1eOq+b1KRtKZj+LWuQkg/Z/7TD2R5cdzxGvs1yszr
         Uu2xqZWGqL2S0MFOpFOglQKzdyDIHseW0lmhslfpahYji/D7kT2qZbBfyurfsDycBeRY
         EQ6VyEBNUTRlFCaaTG7vGHX8JdS3osvA4Z+Tns83IQkZdPn3RdaziQ+h4gOWf2C1ae1S
         4Jc10lJlM/BeNXmr8pjfn44BmBVLAi0kXgxymHLIRDqXympQFkoUVmvcv2FXeKMqLorw
         hTpcp+IFry8So5bXdmLraDXxzXgWz+zxqSZSXn0v8gahjPV9Fmp/Gp4FhuCIMVYy04Kp
         aCZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782304166; x=1782908966;
        h=content-transfer-encoding:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CTDR2FGDDMlL0SKna41UWrjV6rjHoFlolha4zevYi4s=;
        b=smug+cJveiPvVsiyQDMxf/ZQQW2En5/F6JebccvyKIDDa9oM5Ago2Sj1u+YrU1OSmA
         Nq6NAC1h6NLt5Fau++UqD9Dwjxbl0Laycj0v7G8JILK06FWbyvKd1+AixygdoO2eCQDr
         XEn4ZPrDeFv5HuTw7RgfS5SDpFZ6w81ZOUij9/1U1hmp3aCh+RgpsH/zZuAxsEbFLT0B
         jfP1OyYLUJ+kN7NkUq+Z942JtC5iUo7EL7d9SXVNgAzu4mHbJybEqkNTyZDI6B7hBze4
         GR9Y9SWxXjbkGbe+n0QeOkGDmT2OiFbu+0SwTNAkx29UKFJp4UXtBRfl6InbPzXWUDes
         R2Rw==
X-Forwarded-Encrypted: i=1; AFNElJ9Ejl0QIt+e7uBY5WTZWkwf/XwRpv6uthEi/YAQwpBh0tvPLg1f6th72rzFhZfZp2TNuj78bj5xSirZUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIOZ/QHK0fIcNS3OdU/JxObd8UHY9juCtUBfcdKROwkRd9lwek
	ndA23E8P1VS9gB1uea80GYS9sjttiQMw1+P4RdzD0pZ+fdu1cOg4+t0I
X-Gm-Gg: AfdE7cn5EgNEcI0tEDCkHXJTKwBbFNHaCLUgFTzCL5f6/+/sb0G/1BMYpri93ZWrETg
	xe3dosn3VFPQPY0b0cPImmdlsvUGzRkuP4hje3bFUKWiJwiK9JxH8kSt+xYYp4mWm5q2ZI7GhT2
	UIUSUDttvkY3jXaeyz76THmn3mw7S1bwl2dnv+s8eLgYAi02Ut5PrFB0fuWdw49vLk8XTZw/jtk
	t7u74JZESHXC7mvk48v+weGEq+4pQ5252zGiPOYOduiKBy86j5F9GxN4bLIWmNaix55zG7zuwkv
	y7Sdzj9BE/U4BI59NHeo7VEb/tu7ycm67EwQTtOx6DkMawESAHsz8ketWHUx9tveLyMCV4Rc8bh
	BnH/eXhbitcXDtV6fZUu7hlUq6X7lz5Ycep30qG4AC+v7mSZkG/JvoumO4fVLnjCKNhroYnCI04
	aPUNnI1+j4TgFbm5kcQC+l+fFwTeOPmP/N0v2N
X-Received: by 2002:a05:600c:ac8:b0:490:b7e6:bd1d with SMTP id 5b1f17b1804b1-4926084d209mr36077205e9.16.1782304166289;
        Wed, 24 Jun 2026 05:29:26 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:157e:3500:2be7:1a89:41c5:9239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c9787dddbsm3896530f8f.3.2026.06.24.05.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 05:29:25 -0700 (PDT)
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
Subject: [PATCH 07/10] dma-buf: remove dma_fence_is_signaled_locked()
Date: Wed, 24 Jun 2026 13:13:31 +0200
Message-ID: <20260624122917.2483-8-christian.koenig@amd.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65554-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:replyto,amd.com:email,amd.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4B4A56BE2B2

Finally remove one of the biggest trouble makers in the dma_fence
handling.

The signaled callback is now consistently called without holding the
dma_fence lock.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 include/linux/dma-fence.h | 36 ------------------------------------
 1 file changed, 36 deletions(-)

diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 803e10ca76e3..ad69acbea218 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -493,40 +493,6 @@ dma_fence_test_signaled_flag(struct dma_fence *fence)
 	return test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags);
 }
 
-/**
- * dma_fence_is_signaled_locked - Return an indication if the fence
- *                                is signaled yet.
- * @fence: the fence to check
- *
- * Returns true if the fence was already signaled, false if not. Since this
- * function doesn't enable signaling, it is not guaranteed to ever return
- * true if dma_fence_add_callback(), dma_fence_wait() or
- * dma_fence_enable_sw_signaling() haven't been called before.
- *
- * This function requires &dma_fence.lock to be held.
- *
- * See also dma_fence_is_signaled().
- */
-static inline bool
-dma_fence_is_signaled_locked(struct dma_fence *fence)
-{
-	const struct dma_fence_ops *ops;
-
-	if (dma_fence_test_signaled_flag(fence))
-		return true;
-
-	rcu_read_lock();
-	ops = rcu_dereference(fence->ops);
-	if (ops && ops->signaled && ops->signaled(fence)) {
-		rcu_read_unlock();
-		dma_fence_signal_locked(fence);
-		return true;
-	}
-	rcu_read_unlock();
-
-	return false;
-}
-
 /**
  * dma_fence_is_signaled - Return an indication if the fence is signaled yet.
  * @fence: the fence to check
@@ -540,8 +506,6 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
  * operation is complete, it makes it possible to prevent issues from
  * wraparound between time of issue and time of use by checking the return
  * value of this function before calling hardware-specific wait instructions.
- *
- * See also dma_fence_is_signaled_locked().
  */
 static inline bool
 dma_fence_is_signaled(struct dma_fence *fence)
-- 
2.43.0


