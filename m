Return-Path: <linux-media+bounces-61484-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJQTMhu0BGowNQIAu9opvQ
	(envelope-from <linux-media+bounces-61484-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 19:25:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 298A8537FFC
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 19:25:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4EDF832F1C39
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 16:59:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A04874DC52D;
	Wed, 13 May 2026 16:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="F13wnAN7"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E1214DB561;
	Wed, 13 May 2026 16:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778691551; cv=none; b=b/9jBm8xHyiJ8IDaoy5QT+iy7e+lsF0+P1qOzSvbARUsP0+fPLErnfNsw13+wZ8QZyx+NWBhjLQv0FKaI5FEXqSRgfwU6IDWYBPqQBDQPr706/oK18fc33fW8Kz5P8nZFD02V2kx0blHVE6gPvpk0pcdy2Jgz/aJipf2cRgw6Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778691551; c=relaxed/simple;
	bh=5JKcUdxXHvhQCI1LQwFg7UllUAKuTCGb8JFxelc+z4Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r9ie+SInteNzDyvtU/++OpBEIfvh43POjuXaM7JIdtzXhiWq/y/ifUEL4V35I62/A9/pyfxtwF+k79Em/1k4xdspiMwHHr5yH40QhfpRgX+LLnE1CkQcVg6/xPDl31uhxwkX0A/Xlqf/2MPNgzETrb+zU8pO6M+Ou5t7WQ5SMBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=F13wnAN7; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778691544;
	bh=5JKcUdxXHvhQCI1LQwFg7UllUAKuTCGb8JFxelc+z4Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=F13wnAN72bQ34z/ls0txawzH+G/Wb1Djs5EMfFi96/xIi2XYvKgjKVjqVs7zRkJZR
	 Xl7gPyTiTxPZGEizMPugx6u55UuG+WJYh6bruOivIVD3nZ6IxELerzqOEzhgUohHFM
	 7HoZiAFmx5ZGsJf2gaWVAuztoqRBm5SN2vLHjKIszAtK2K5u1zfprTuOeCT3oGr63a
	 MTAYgspn5KCCTqfHgB/Z2EHaq6rW6Kn92cn+7F0MmwA6+zwVymQOyAkxASWpRb9rm1
	 74k+ngppkOIwj44+XXi0ifUWYoh1ij13sxaVOPh/iYxs2fJcXEZ1fTTtroF1Zj4YiL
	 Ivj90abjzz8Vw==
Received: from [192.168.1.38] (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8631317E38C6;
	Wed, 13 May 2026 18:59:03 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
Date: Wed, 13 May 2026 18:58:54 +0200
Subject: [PATCH 6/6] drm/panthor: Add a new guard for our custom
 resume_and_get() PM helper
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-panthor-guard-refactor-v1-6-f2d8c15a97ce@collabora.com>
References: <20260513-panthor-guard-refactor-v1-0-f2d8c15a97ce@collabora.com>
In-Reply-To: <20260513-panthor-guard-refactor-v1-0-f2d8c15a97ce@collabora.com>
To: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 Boris Brezillon <boris.brezillon@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778691539; l=4385;
 i=boris.brezillon@collabora.com; s=20260429; h=from:subject:message-id;
 bh=5JKcUdxXHvhQCI1LQwFg7UllUAKuTCGb8JFxelc+z4Y=;
 b=/j4GD7bj6f01mPZjfZbWJzs8fGUcCv15qaDHQz1LMWFkC6+dttkTiBgbsj9qf1GPiwcmVgTz9
 Xsw0wzKTQlNCxJmFMZSmwdxR1WYZ9+kVEd4XWlnUgAspldj2fY9BP+W
X-Developer-Key: i=boris.brezillon@collabora.com; a=ed25519;
 pk=eN+ORdOgQY7d5U+0kA8h5bf67XdD8bhKbjD/TCHexSY=
X-Rspamd-Queue-Id: 298A8537FFC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61484-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,amd.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,collabora.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collabora.com:email,collabora.com:mid,collabora.com:dkim]
X-Rspamd-Action: no action

Overload the already existing pm_runtime_active_auto_try_enabled guard
with our custom guard that force the state to suspened (and thus clear
the runtime_error) in case the resume fails.

Once done, we can replace the existing places where manual
panthor_device_resume_and_get()+pm_runtime_put_autosuspend() were
done by guards.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_device.h | 10 +++++++---
 drivers/gpu/drm/panthor/panthor_drv.c    |  4 ++--
 drivers/gpu/drm/panthor/panthor_sched.c  | 11 ++++-------
 3 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index 1aaf06df875b..51527d2e2f77 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -407,9 +407,10 @@ int panthor_device_mmap_io(struct panthor_device *ptdev,
 int panthor_device_resume(struct device *dev);
 int panthor_device_suspend(struct device *dev);
 
-static inline int panthor_device_resume_and_get(struct panthor_device *ptdev)
+static inline int panthor_device_resume_and_get(struct device *dev)
 {
-	int ret = pm_runtime_resume_and_get(ptdev->base.dev);
+	struct panthor_device *ptdev = dev_get_drvdata(dev);
+	int ret = pm_runtime_resume_and_get(dev);
 
 	/* If the resume failed, we need to clear the runtime_error, which
 	 * can done by forcing the RPM state to suspended. If multiple
@@ -424,11 +425,14 @@ static inline int panthor_device_resume_and_get(struct panthor_device *ptdev)
 	 * something we can live with.
 	 */
 	if (ret && atomic_cmpxchg(&ptdev->pm.recovery_needed, 1, 0) == 1)
-		pm_runtime_set_suspended(ptdev->base.dev);
+		pm_runtime_set_suspended(dev);
 
 	return ret;
 }
 
+DEFINE_GUARD_COND(pm_runtime_active_auto, _try_enabled_or_suspend,
+		  panthor_device_resume_and_get(_T), _RET == 0)
+
 enum drm_panthor_exception_type {
 	DRM_PANTHOR_EXCEPTION_OK = 0x00,
 	DRM_PANTHOR_EXCEPTION_TERMINATED = 0x04,
diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 789ddc0ff7ef..f2d60ff00896 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -824,7 +824,8 @@ static int panthor_query_timestamp_info(struct panthor_device *ptdev,
 		(flags & DRM_PANTHOR_TIMESTAMP_DURATION) ||
 		(timestamp_types >= 2);
 
-	ret = panthor_device_resume_and_get(ptdev);
+	ACQUIRE(pm_runtime_active_auto_try_enabled_or_suspend, pm_guard)(ptdev->base.dev);
+	ret = ACQUIRE_ERR(pm_runtime_active_auto_try_enabled_or_suspend, &pm_guard);
 	if (ret)
 		return ret;
 
@@ -894,7 +895,6 @@ static int panthor_query_timestamp_info(struct panthor_device *ptdev,
 		arg->cpu_timestamp_nsec = 0;
 	}
 
-	pm_runtime_put(ptdev->base.dev);
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 9aa9941d2309..9afa38e87fc9 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -2630,13 +2630,12 @@ static void tick_work(struct work_struct *work)
 	if (ACQUIRE_ERR(drm_dev_access, &dev_guard))
 		return;
 
-	ret = panthor_device_resume_and_get(ptdev);
+	ACQUIRE(pm_runtime_active_auto_try_enabled_or_suspend, pm_guard)(ptdev->base.dev);
+	ret = ACQUIRE_ERR(pm_runtime_active_auto_try_enabled_or_suspend, &pm_guard);
 	if (drm_WARN_ON(&ptdev->base, ret))
 		return;
 
 	tick(sched);
-	pm_runtime_mark_last_busy(ptdev->base.dev);
-	pm_runtime_put_autosuspend(ptdev->base.dev);
 }
 
 static int panthor_queue_eval_syncwait(struct panthor_group *group, u8 queue_idx)
@@ -3359,7 +3358,8 @@ queue_run_job(struct drm_sched_job *sched_job)
 		return dma_fence_get(job->done_fence);
 	}
 
-	ret = panthor_device_resume_and_get(ptdev);
+	ACQUIRE(pm_runtime_active_auto_try_enabled_or_suspend, pm_guard)(ptdev->base.dev);
+	ret = ACQUIRE_ERR(pm_runtime_active_auto_try_enabled_or_suspend, &pm_guard);
 	if (drm_WARN_ON(&ptdev->base, ret))
 		return ERR_PTR(ret);
 
@@ -3367,9 +3367,6 @@ queue_run_job(struct drm_sched_job *sched_job)
 		done_fence = queue_run_job_locked(job);
 	}
 
-	pm_runtime_mark_last_busy(ptdev->base.dev);
-	pm_runtime_put_autosuspend(ptdev->base.dev);
-
 	return done_fence;
 }
 

-- 
2.54.0


