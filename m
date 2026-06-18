Return-Path: <linux-media+bounces-65211-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mverNdn6M2pqKAYAu9opvQ
	(envelope-from <linux-media+bounces-65211-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 16:04:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8376A0C97
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 16:04:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=aDkDEu1v;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65211-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65211-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7771F30148CF
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 14:03:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FABA3FAE15;
	Thu, 18 Jun 2026 14:03:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E3D3B6346
	for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 14:03:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781791431; cv=none; b=SM0cGDg4/yeCUzgMjS2WV6KLxyr0j7QMX0nGB7OPFEEV9wAYjwMD9GZ40R3PbrSywN9Vb4b/XyvptXGJ3g2TpDv39HcLF3TSLB77wiwl0PjGLL8OKdBDmwU9UfOUGpK8VDWVMknmLZs2/BTfZCFCNDl322vRwILbOBOjYUnr48g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781791431; c=relaxed/simple;
	bh=qhEuDvxbvFGKiILbgKF1Dlzmaqyw2vxAjNs3wRQ+fVs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=SxuoAygWKr3oo8cI07j0W6hjdFBUxQk3VXjik0oUZgB+3uqfIHRjVt/CV/DPmVnN8ZN/VImQg3Sn8g6nEJ17p2L6NXMAAygQWj+XU4nDKh69MgR/MY5TbsOHhCvbz/lIe39Yq1jbFlfDp6ADMAGuOtkaQ5zfqNGSoSzLodOGFiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aDkDEu1v; arc=none smtp.client-ip=209.85.218.53
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-bec4639953dso157707166b.1
        for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 07:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781791429; x=1782396229; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=38plZ0uTNBbwKeBUJYWbAXFzzu4qCG2nojxXWDV02QY=;
        b=aDkDEu1vsfwKr1BczLlSaQqwkHs+7emE0uJ2bu7peZaFyT3sqob70xCri+qpu2MnN2
         pEQ3cAmzewiXcpZAt0mHqR5hXgn3mX+pDOnmUo7FRP1iluahGWcxwtQARka4M0GnxYBg
         Tw6tmBfVr5zanno89M2cDZqrng7wpWxcDaef7e3XpQZWM6vaGBpqklcHpTfzb+69zZ7f
         Fq16hJtGfz3PZXe8hr0yNy978MDBc7ugDZk3fB85GiMUbR5XklkOyu9UMMLmp4ro05AX
         z8J/9gZG1iwSQCSF4T5HhyGpGrqYiXHkEL1/T4ydkpirJur3qwYXQbsrNrrHcVl3yb0T
         uZXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781791429; x=1782396229;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=38plZ0uTNBbwKeBUJYWbAXFzzu4qCG2nojxXWDV02QY=;
        b=sv8OW4pSiECynjyheRky1tlKJa6A2COoABRytRNCWRE+Iyb3z3k4EzlCVlaxD1zOGB
         xznMeX1d56feAxuI36k5ZUgUn9BhfhrEEyCj2O1oBstCmlndI/JQOucRXf5HStAhsXNf
         noI2VMgzV5GLmmO4VmtCRc6pwarcfRwj9FK6au2OANvz3jTvKyFHKDiqFuKqExPX0JAM
         wAt7MUfIIvYRZBcNuzYscQftQkDtOvWNVHtrPGTWQP86hI4tUdd/jwfve1AQR3iBBPFK
         KrT/oLTIq+ZOaU71saBbZ8LBSWZ23bTQW+hUATyo1rGUJoV0Vpic9KOLiGx9JNg/8bvT
         0WCw==
X-Forwarded-Encrypted: i=1; AFNElJ8g1e/80Q5ilgep2+b0LB881QkUDlh6+oI/wa8Kbchn33uEhvDxI21go3bLZrWvih27MNHxGnCl/U42og==@vger.kernel.org
X-Gm-Message-State: AOJu0YxrMdoOz34FGxwVUoAxWsrEY82VDbNQd883P0LchnJ5U0QJTcIo
	Ku2ZIWTNyEDxqhTFDZCYA5RtobshV7jZWxRle8HLx3aeNcph3a7RHI1VjCYhGBqTEGg=
X-Gm-Gg: AfdE7ckJr9EAjV4gKOpJCgZK1HBorzZQyf1NjNEqMLbxCG5LbfF1cMfzDVR2quCtvdL
	nf2z/u6RYwdqeDH/k2jAbnU1u2Ii51bxuY9qCbyfT2gjpkmYx2eFVD/JWXEH+fcDgqZ+4/SJ0Lq
	orRIos2GZz4Ppxsj8MQxfKJ0BSyG7VN/WN4YmZONW7ONCItZUzI5KmoRfAz7WJxvfy0X4pm9uiY
	kGOiLl35vY9mcAsgvTguLNNIPNnW3J5gFvHCL9ziqiMu+DsEJXx2/A6kZ4Qm6EMfhxN2YfcgXmr
	Dt7yWmqRwWBF8cnpLyWLw2iFMKzWMb5lUejBKbwdr8tVQF9oheALmSSmYKq0CEuavpy4rVv4b4E
	eMpX8m68LIymuvK4r2R8qRjrq448jIVvfXgsoyMTUKlFymB7hRTPP5wUjxBOpzgsF8Hh33c2lrt
	/jJ3BXItDfDOL5L1BOrzx1RrPRiVho7dp6qMnUgsD91RyBxAuEYccJ3df0URn93kNQoDr/8/61b
	qdx/z8=
X-Received: by 2002:a17:907:970f:b0:c05:8586:da12 with SMTP id a640c23a62f3a-c07c81d1871mr124087466b.50.1781791428476;
        Thu, 18 Jun 2026 07:03:48 -0700 (PDT)
Received: from puffmais2.c.googlers.com (181.179.204.35.bc.googleusercontent.com. [35.204.179.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb9014501sm973334366b.60.2026.06.18.07.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 07:03:47 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 18 Jun 2026 15:03:45 +0100
Subject: [PATCH] drm/drm_crtc: fix race with dma_fence_signal() in
 ::get_driver_name()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260618-linux-drm_crtc_fix2-v1-1-c03e77b36f34@linaro.org>
X-B4-Tracking: v=1; b=H4sIAMD6M2oC/x2M7QpAQBAAX0X725Xb85VXkXSdxRZHe0jJu7v8n
 KmZBwIJU4AmeUDo4sCbj6DTBNxs/USKh8iAGZZZqWu1sD9vNcjaOzlcP/KNCo2tnClym2uEWO5
 C0f/XtnvfD1Lv8uZlAAAA
X-Change-ID: 20260618-linux-drm_crtc_fix2-23a7c354a412
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN_FAIL(0.00)[1.2.3.5.c.f.2.1.0.0.0.0.0.0.0.0.5.7.0.0.1.0.0.e.5.1.c.3.0.0.6.2.asn6.rspamd.com:query timed out];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:tvrtko.ursulin@igalia.com,m:boris.brezillon@collabora.com,m:phasta@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:peter.griffin@linaro.org,m:tudor.ambarus@linaro.org,m:jyescas@google.com,m:kernel-team@android.com,m:andre.draszik@linaro.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andre.draszik@linaro.org,linux-media@vger.kernel.org];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,igalia.com,collabora.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65211-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[linux-media@vger.kernel.org:query timed out];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andre.draszik@linaro.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2E8376A0C97

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

Note that the adjacent drm_crtc_fence_get_timeline_name() has the same
problem and is fixed by this patch as well.

Fixes: 541c8f2468b9 ("dma-buf: detach fence ops on signal v3")
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/gpu/drm/drm_crtc.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index 63ead8ba6756..31c8636e7467 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -73,6 +73,9 @@
  * &drm_mode_config_funcs.atomic_check.
  */
 
+#define fence_to_crtc(f) container_of((f)->extern_lock, \
+				      struct drm_crtc, fence_lock)
+
 /**
  * drm_crtc_from_index - find the registered CRTC at an index
  * @dev: DRM device
@@ -154,14 +157,6 @@ static void drm_crtc_crc_fini(struct drm_crtc *crtc)
 #endif
 }
 
-static const struct dma_fence_ops drm_crtc_fence_ops;
-
-static struct drm_crtc *fence_to_crtc(struct dma_fence *fence)
-{
-	BUG_ON(rcu_access_pointer(fence->ops) != &drm_crtc_fence_ops);
-	return container_of(fence->extern_lock, struct drm_crtc, fence_lock);
-}
-
 static const char *drm_crtc_fence_get_driver_name(struct dma_fence *fence)
 {
 	struct drm_crtc *crtc = fence_to_crtc(fence);

---
base-commit: e2cae00c05d196491c318196792297f2dfbaa02c
change-id: 20260618-linux-drm_crtc_fix2-23a7c354a412

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


