Return-Path: <linux-media+bounces-67037-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XzUfHupwTmo1MwIAu9opvQ
	(envelope-from <linux-media+bounces-67037-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 17:46:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E33977283B6
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 17:46:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=XJLbtqUp;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67037-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67037-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7421E311D95F
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 15:22:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D48A3F12F4;
	Wed,  8 Jul 2026 15:22:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7703B4E9E
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 15:22:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783524132; cv=none; b=q5yGcISqcizhY3tvLCKAxwp5YSLY3HxvtDZ7h14BnoLU99amqAcgbx8oPZG0rivn8vU1amN5X5ZP3aiLWLgBg2/DYV3k+qqUBLT1gaxX8j1MkHnupExsj6u0QMymFFo+o03KGApUatZm1/TG1ziWsS0qA0jmDceHZvlaEavrK2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783524132; c=relaxed/simple;
	bh=bGVUl9LVTT9Wx6pQ9UJrrfOQFpCDoJ4+ZM4JCH35+PA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D4FKTp8+l5c8Ogoj5psEthLO/fPp9Xfntz/sQTydzSb3BJitA6Q+yVyqe3WrZkE6ZkkAJl/lBrL9yj10M3Zk1tB2g7ld11rcPdYQwi3gPagWt5JG3UZjg6leGOaM++dFuUyTQd791fWAjDsgnzq5REn9o0RgG36dlijoAm1tm9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XJLbtqUp; arc=none smtp.client-ip=209.85.208.44
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-698a9f11776so1400802a12.1
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 08:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783524129; x=1784128929; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LyC+FmbJe8AFV/pEnbxlDl/WDcANmupwyXjJcuF3JBk=;
        b=XJLbtqUpL9sdERLWs9igzjRxLyRtt8YO0t1h/PcbpQ63yIf3ZBuTNrzkzvwoByBw6x
         BPaqQEXMtsz8Hg+d4b081gZsyxDCgZiJJ065uwvMQj6CcfQTSYM7uHkWNCfi3N2I75Xw
         efbJgPBStv7avTeReCcMPR0t2LAqgXKLwUQZj5NiFk+962wDWtlQgl/g1X0VLh8Pbs7A
         NZevFfF9uNsFS0AMj+6/1D0q8ohPwZNFfQqFlPzxvu/sxz1yLyR4tcg32ikhwGLEPsSd
         ZEMbcTYfNjK+05WprpzNIuyMFA8Aco/7vDf4USnSDbBvOtfGMBPKD8u5Nw9Mcc1aTz7c
         NhQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783524129; x=1784128929;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LyC+FmbJe8AFV/pEnbxlDl/WDcANmupwyXjJcuF3JBk=;
        b=qkpFQOJzumbeDxJv2r+WaHc5RwcCMgkuyRG0BIo5RSExYU6ApFxWMjtTGPZVTmOJiG
         HTWdeC8n6TJFb7IBDQog5dOTulMITXaxlyRgHsjVtpnRybcMceQjRiwFsyPVtQl9fimd
         1wRnVter1SldUp1XDvxYnO6p7AC70vCB9IhEccf9JP7MqE+NIQuLCbkgxZpWc+6oSizO
         jMNbeJWChvHvOovmXkfFNLvEPTyBfM5sCWkiJUsSc4xzVXVCB/X46EqDjQcD15jC00AE
         B6YNTGRqp1Mj1AWDEzTnwaBWBMmJHMi9Ml7FTlmajnAQHOR8qFD7b/jmgDk1IZs7Qx3f
         icvA==
X-Forwarded-Encrypted: i=1; AHgh+Rq+CWvxgiOJaASWq87JlBF1VeFNTcS+Va5B+oUN4esWkggZdKKD4WmrObltts8Ucleva2b5JdhK0zQiaw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2kZHnAKRdxjhENK0f55g3k7dDxFiwOkiplC2TVZ0ItX2ALhaI
	ZELCered1ysWrel8n0MCuPMZlVpOs9xu3RwxJ4zWE5MdvdO3pkuGsNRKdo6xlo8VsRM=
X-Gm-Gg: AfdE7cnNXZiexNDqF+iiw3cT31XqeCktL5udacUIYNSaYGYuZXzW7wUDAzI6PCBva4O
	9xwQGI0p9tD7gRx3to/gW4aRdFwg0XxBjwi3ManQ/403nWO3A5uRUO5whHFtWVLblXEbe9SWRF/
	qX0hHC7vbOuret8wyRr91wz9BXNkUjFYGc6VkgnGPs7UOlsyJsrpUs2+R6b192IU7iI0Eq+Bkqp
	LVqD1qsHYjBgHTXBU4FA7DXUWYucqH4zDq0QrAc+GjBdJJrdEYVn46vfUpbBpn7NNH81DkaT9+e
	MhfX2+uFB62KMBLytt3vcrPGzTr0DA5XkDN/rXzw1KxHEzsu7dSvJh1v59qhTscEGmuQ8LKKrIW
	+b48jsUJT/zRpLwJX138tdJf7vAoL7crOhAeAlw5Gf97+S3YQSpFCJ4wRNahqGzLUo6ULLr2xZ2
	tcUwmcCEpJ3eBjmBoD+A9+NZ5+QXfMpLRWF8g/X02c0rrMxr7E9feJ04lT+p8sbABcnoDBCbjdZ
	4XrMIw=
X-Received: by 2002:a17:906:f58f:b0:c12:a992:a6d6 with SMTP id a640c23a62f3a-c15ce000110mr142620966b.23.1783524129106;
        Wed, 08 Jul 2026 08:22:09 -0700 (PDT)
Received: from puffmais2.c.googlers.com (181.179.204.35.bc.googleusercontent.com. [35.204.179.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15beb53b86sm213932966b.25.2026.07.08.08.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 08:22:08 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 08 Jul 2026 16:22:06 +0100
Subject: [PATCH v2 2/2] drm/drm_crtc: fix race with dma_fence_signal() in
 ::get_driver_name()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260708-linux-drm_crtc_fix2-v2-2-cf72be75d75a@linaro.org>
References: <20260708-linux-drm_crtc_fix2-v2-0-cf72be75d75a@linaro.org>
In-Reply-To: <20260708-linux-drm_crtc_fix2-v2-0-cf72be75d75a@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Philipp Stanner <phasta@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67037-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:tvrtko.ursulin@igalia.com,m:boris.brezillon@collabora.com,m:phasta@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:peter.griffin@linaro.org,m:tudor.ambarus@linaro.org,m:jyescas@google.com,m:kernel-team@android.com,m:andre.draszik@linaro.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[andre.draszik@linaro.org,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,igalia.com,collabora.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andre.draszik@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:from_mime,linaro.org:email,linaro.org:mid,linaro.org:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E33977283B6

Since commit 541c8f2468b9 ("dma-buf: detach fence ops on signal v3"),
I'm seeing the BUG_ON() triggering in drm_crtc's fence_to_crtc() via
drm_crtc_fence_get_driver_name() regularly:

    Call trace:
     panic+0x58/0x5c
     die+0x160/0x178
     bug_brk_handler+0x70/0xa4
     call_el1_break_hook+0x3c/0x1a0
     do_el1_brk64+0x24/0x74
     el1_brk64+0x34/0x54
     el1h_64_sync_handler+0x80/0xfc
     el1h_64_sync+0x84/0x88
     drm_crtc_fence_get_driver_name+0x60/0x68 (P)
     sync_file_get_name+0x184/0x45c
     sync_file_ioctl+0x404/0xf70
     __arm64_sys_ioctl+0x124/0x1dc

This looks to be caused by a code flow similar to the following:

+++ snip +++
thread A                             thread B

                                     ioctl(SYNC_IOC_FILE_INFO)
                                     sync_file_ioctl()
                                     sync_file_get_name()
dma_fence_signal_timestamp_locked()  dma_fence_driver_name()
                                       ops = rcu_dereference(fence->ops)
                                       if (!dma_fence_test_signaled_flag())
                                         ops->get_driver_name(fence) i.e.
                                         drm_crtc_fence_get_driver_name()
test_and_set_bit(SIGNALED)
RCU_INIT_POINTER(fence->ops, NULL)
                                     drm_crtc_fence_get_driver_name()
                                       BUG_ON(rcu_access_pointer(fence->ops)
                                              != &drm_crtc_fence_ops)
+++ snap +++

I see two ways to resolve this:
a) simply drop the BUG_ON(). It can not work anymore since above
   commit, as it is racy now.
b) pass the original 'ops' pointer obtained in dma_fence_driver_name()
   to all callees.

This patch implements option a), as because:
* I don't see much benefit in passing the extra pointer just for this
  BUG_ON() to work.
* Requiring the dma_fence_ops in those callbacks is an implementation
  detail of the drm_crtc driver, and therefore upper layers shouldn't
  have to care about that.
* The existence of the BUG_ON() doesn't appear to be consistent with
  implementations of ::get_driver_name() or ::get_timeline_name() in
  the majority of other DRM drivers in the first place. Those that do
  have a similar BUG_ON() (i915, xe) probably also need an update
  similar to this patch here but I'm not in a position to test those.
* Using BUG() and friends to take down the system is an unacceptable
  way to handle a failure as evidenced by many threads on LKML and also
  in the kernel coding style. Here, the check was presumably added for
  detecting when something passes an invalid pointer, but that does not
  happen - and if it could, gracefully handling that situation would be
  more appropriate.

Note that the adjacent drm_crtc_fence_get_timeline_name() has the same
problem and is fixed by this patch as well.

Fixes: 541c8f2468b9 ("dma-buf: detach fence ops on signal v3")
Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v2:
- don't turn fence_to_crtc() into macro
- update commit message to include reference to unacceptable use of BUG
---
 drivers/gpu/drm/drm_crtc.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index d55f1377ec36..36ae50ddf525 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -154,11 +154,8 @@ static void drm_crtc_crc_fini(struct drm_crtc *crtc)
 #endif
 }
 
-static const struct dma_fence_ops drm_crtc_fence_ops;
-
 static struct drm_crtc *fence_to_crtc(struct dma_fence *fence)
 {
-	BUG_ON(rcu_access_pointer(fence->ops) != &drm_crtc_fence_ops);
 	return container_of(fence->extern_lock, struct drm_crtc, fence_lock);
 }
 

-- 
2.55.0.795.g602f6c329a-goog


