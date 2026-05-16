Return-Path: <linux-media+bounces-61791-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BR1CQ9QCGoMjAMAu9opvQ
	(envelope-from <linux-media+bounces-61791-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 13:07:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D4555B509
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 13:07:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D26F8301BA43
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 11:07:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E9363D567B;
	Sat, 16 May 2026 11:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LfOoZtxt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEFC53D567E
	for <linux-media@vger.kernel.org>; Sat, 16 May 2026 11:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778929613; cv=none; b=DXoT2oi6g5hPnDL4+6YASaIrmSydpbfU1ZFP+rLbhTYb4Kk17hudeMsIMe5bdlYPB+vpuAokcahBMX702QdK8ci7VwsGAG25+sx+m3WgQB+6CYnLIgLpTlsDnNT39a6K/btISDOjwEqwyd2UCE1tiRMhwMJ723hl+6DgOCAXQAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778929613; c=relaxed/simple;
	bh=NwwauNPJiO1PfXNWR0Tt78KBCxqLRi4CSj0dLIMDu4c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cjV5bbjzf2RFMYRh6cy7LVKXTNr1e8jKBfRALXpM58zpraX8/hbKR6MUO1ngpUWt+9sMTJS6w6eMjDRI0fAxQFn1n0RepeZoBTo1BYPFbSdO5aaPFb6/qxAjBEDOmy9zWT4DZhsfkFfRVpI8e6Ucb9klySYJkMg8CJQpIF+Yq1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LfOoZtxt; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so7680555e9.0
        for <linux-media@vger.kernel.org>; Sat, 16 May 2026 04:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778929608; x=1779534408; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iLr2U6KkG2Uu+VOL8E6/tXdIBWCkFd/7X9q/HfFlgP8=;
        b=LfOoZtxtPM/FPmrOmUdQgwCcwUTSPJN9NDqbq45pssSl7LLRPTv9kBv+20UbiURiDu
         fx5oJJ6GIpbkVURbsGj3w5R9GzGFw9wSA19/OSEcpBneWzQSbovrGCkWTv498DmQqXRT
         bZ8xwZ3QCFB5iNOzklGUq0pIDQdSaycyvXcRis4AEYKGLij/1lGkuI15xkiHv5VHx0bV
         JHCS6y7cOnvhjSIahri3Qd6RKa5rQGBmhCGwfKiBdSPKTtb47WjrbNLn+fMDUlrwYOJ4
         pSUzpvJ1/zop8wtXghhba1YBA2uCALUQR3lLDzy4qE3S+XbYvF9PeC9NSmLyvq0Ks/QK
         cMYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778929608; x=1779534408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iLr2U6KkG2Uu+VOL8E6/tXdIBWCkFd/7X9q/HfFlgP8=;
        b=sBAj3rMDwOVyBeXGc0D8VFKJdknTc9cllvAFya6Uj9YtF4TUn/nQPGx/J78/gK+qH4
         5hRJCctmXqW1xtbpka4Xa2Q4L8GRRuAflAzkIS2tw5oamJ5Z0V3+BwDfELbgjvLxESV7
         iDb1jfcKozX2GjNFPPkydj3BaLHTVKWZK0IXk2LRYHGK7hgMdotq7Hfwuu0hb6+qd9IN
         SBmgIos6fsk11DLPppflKm/uvrkVDB/XMRvT9mm+zjIQ4j9HX4k7ax4vArY+vXIPRwrh
         q/wqnl5sndtFmo45pRlY31LXfsmlMpwJ99MGz+4asfXiZoT5hIec66pD9divHz6s5eHc
         XrZg==
X-Forwarded-Encrypted: i=1; AFNElJ8K+FuwtwozXJOBp0/y3OjByf87D9NKX8Li6DCET/YX7GXFzYdap2O4BCVAxnKNNIc0AGkbDYZQrmM85A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQWzsPNCFXYbXcQArJNcAg5LIT/iIK57utjVZqLEapxxFxoAl1
	gV7Bvxip1LnuC8djec0jsvyXMwi9TXH9K5vBg0TLO1YQQTTJlt3QCEgwTDlMoINw
X-Gm-Gg: Acq92OFf7ev5xK8TSrdMyAShtTxeDe6eyvE6BECfbB6ZzEotIOrqFvgbWbMJS2B8fA+
	+hbgp1qRCkZBfEOnnhiuYPSFbzGgqdZXcodU7LCcLmtvyJVWE+YYxMAmQgYljv6bIj6EwP8sj2w
	PqEiNM7j6ZVFxdiPoQMPHjks6iS+z/bV03+YhPJzYgRnuh32x7bIpiSuyCACXePGHnr8+7ZfkQl
	QW1VwcmQZQ0PglYY+YuQctXxI1g8l/MRWjuNE85bmbfaCB/v/sDkSAtAUILuY0sJ4x63D4lxC77
	zrIpO2A50VSG8F5SdnMEi22lyK8zU7G5GoxORA9GPTVHcbpNuDw+4TCb4v44ahL058JAABpoLIV
	MEH0k0+RQZpkbIBN8ryHzCYDiVT+hXGTZGB6qgr8JCmAYFWrmsNa0nIM3DYixRfF7VSqLlodpmg
	/ZMuFIH9JXYKMMjSzMWd0LvcGdHMLtT2IPzimyoqUXbxwyPJTFgF9a7v4KlZnQ5fdMjiC9swGJy
	JZ/ABA=
X-Received: by 2002:a05:600c:13ca:b0:48f:eb8b:9988 with SMTP id 5b1f17b1804b1-48feb8b9a84mr53458715e9.23.1778929608240;
        Sat, 16 May 2026 04:06:48 -0700 (PDT)
Received: from [10.13.0.20] (ip87-106-117-14.pbiaas.com. [87.106.117.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feb00e5easm36399545e9.13.2026.05.16.04.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 04:06:47 -0700 (PDT)
From: Julian Orth <ju.orth@gmail.com>
Date: Sat, 16 May 2026 13:06:06 +0200
Subject: [PATCH 03/12] drm/syncobj: make drm_syncobj_array_wait_timeout
 public
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260516-jorth-syncobj-v1-3-88ede9d98a81@gmail.com>
References: <20260516-jorth-syncobj-v1-0-88ede9d98a81@gmail.com>
In-Reply-To: <20260516-jorth-syncobj-v1-0-88ede9d98a81@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 linux-doc@vger.kernel.org, wayland-devel@lists.freedesktop.org, 
 ju.orth@gmail.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778929602; l=2220;
 i=ju.orth@gmail.com; s=20251120; h=from:subject:message-id;
 bh=NwwauNPJiO1PfXNWR0Tt78KBCxqLRi4CSj0dLIMDu4c=;
 b=L70W+WfFJyxFbr6yV3GcY0+dLZ8/RrrjQI0perIlwa2ryxcj58Yc3uwASbkpuihDpL+gB9Dvu
 iClDpDWu5qLAvShl4cuWM8lV4UGkRD1RQm8k8xpOhVcZK9uExSKR7MT
X-Developer-Key: i=ju.orth@gmail.com; a=ed25519;
 pk=uM2SS4lelkuIoYHc7v9N9bgBZ3hS632zJS2xjRJLPLI=
X-Rspamd-Queue-Id: B1D4555B509
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61791-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,lwn.net,linuxfoundation.org,arndb.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,lists.linaro.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[juorth@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

For use by the upcoming misc/syncobj module.

Signed-off-by: Julian Orth <ju.orth@gmail.com>
---
 drivers/gpu/drm/drm_syncobj.c | 15 ++++++++-------
 include/drm/drm_syncobj.h     |  5 +++++
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 8df438fe0807..648afd1f4fdd 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -1069,13 +1069,13 @@ static void syncobj_wait_syncobj_func(struct drm_syncobj *syncobj,
 	list_del_init(&wait->node);
 }
 
-static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
-						  void __user *user_points,
-						  uint32_t count,
-						  uint32_t flags,
-						  signed long timeout,
-						  uint32_t *idx,
-						  ktime_t *deadline)
+signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
+					   void __user *user_points,
+					   uint32_t count,
+					   uint32_t flags,
+					   signed long timeout,
+					   uint32_t *idx,
+					   ktime_t *deadline)
 {
 	struct syncobj_wait_entry *entries;
 	struct dma_fence *fence;
@@ -1229,6 +1229,7 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
 
 	return timeout;
 }
+EXPORT_SYMBOL(drm_syncobj_array_wait_timeout);
 
 /**
  * drm_timeout_abs_to_jiffies - calculate jiffies timeout from absolute value
diff --git a/include/drm/drm_syncobj.h b/include/drm/drm_syncobj.h
index 580a967ae364..7677fd995be0 100644
--- a/include/drm/drm_syncobj.h
+++ b/include/drm/drm_syncobj.h
@@ -129,6 +129,11 @@ int drm_syncobj_fence_lookup(struct drm_syncobj *syncobj, u64 point,
 int drm_syncobj_find_fence(struct drm_file *file_private,
 			   u32 handle, u64 point, u64 flags,
 			   struct dma_fence **fence);
+signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
+					   void __user *user_points,
+					   uint32_t count, uint32_t flags,
+					   signed long timeout, uint32_t *idx,
+					   ktime_t *deadline);
 void drm_syncobj_free(struct kref *kref);
 int drm_syncobj_create(struct drm_syncobj **out_syncobj, uint32_t flags,
 		       struct dma_fence *fence);

-- 
2.54.0


