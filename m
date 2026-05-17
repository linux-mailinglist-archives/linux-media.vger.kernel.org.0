Return-Path: <linux-media+bounces-61851-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPY5CxfACWpSoAQAu9opvQ
	(envelope-from <linux-media+bounces-61851-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 15:18:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FFB5612C7
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 15:18:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE3E13006784
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 13:18:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 993223AA4E9;
	Sun, 17 May 2026 13:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Az8aK6NP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2407D39EF0B
	for <linux-media@vger.kernel.org>; Sun, 17 May 2026 13:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779023885; cv=none; b=mSHWxw4gZ0Pt+ZPLfURzE9H4rDIjewbT1nRNGGH3iXn8ll8CHo49ugPHiwzh6OekkDmhZQwGVs4LjqPSMfGGAekcpVIZkdIbqUmt8qFMeJJD7VsZEc7+Lsk/v4iRqeM6xQtRQv7qn90rfpQoAfMSHztvGzt+KwX/VRlInh2hYOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779023885; c=relaxed/simple;
	bh=URAzz3jUC0fboRRexiwSS6WBQwgbA2/OyQ9s8WriWgM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Tt7FobppgBk1IG8WnPKzJCeqcu88OP6+Pxadldh/4I7V9hjmFMwJE5PGZbXNt+3rT+hk0+ahYbVYrig4O6ocht+PVqYOl/EkOllVtQNcsYPWRDUVc+Qlje99sfcd6fPfybRHqKpnHhic0BduEw+xURHgcEfHf8+4frR1xEaf8Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Az8aK6NP; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8ca12973e15so24050416d6.1
        for <linux-media@vger.kernel.org>; Sun, 17 May 2026 06:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779023880; x=1779628680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8qmzV4OG/gwgrFg2WjVRa5yFfeYJiaj+u8zvgWP2oxA=;
        b=Az8aK6NPwCB4GB/Vx5cuwyH/7iLQWsrE8TlzuY++njwXZowvT3Hnn07Amv5h6Ff9KF
         QZjheF/h36b1lVtqkm7rSYyUZlasoePNkSeVeGrg1z2IzpYDzHk5UT95kpg8PDNbztKH
         3US31vgLjYEP9YHjXV+KN5K7a2Uz68dVqRCcuur8+25baw8rF4ldQ4PouMe8rLy1jKgG
         l9VIPdyuVbISHVfJTYIhKQju9payttJ9HswUXfdlTU61OHwyAOLudNNBx2vEXspc8hrE
         edKo5S3+9ZCHypAjTJ8LuS6UT8iRDM9Ikd3lB+cl7KPzJ7xzvWjm3GnPiqfOJaKHPGH3
         h+bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779023880; x=1779628680;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8qmzV4OG/gwgrFg2WjVRa5yFfeYJiaj+u8zvgWP2oxA=;
        b=eS3WCeP+Q/d2/8+AYzgJ2iu09EDkru1G55y0wOwgO98wvUHYdB/ZkG1foR2aOQPyDh
         e+OoRa/lMael/NI+Kjpd8XQZYiSXQr0eKW3lkOYt1R3o8b12M/3nYcPVaJM+Ch5ma9nV
         8lZfa7THaXE9LcXto0XsuOiBn/JRVDtDa2LX9yDx2NmVc75lPdDEkC/mxvlsaKNR6C+F
         jO7vRQBD4U37r8Yt+rShrENo66zXwlk2ciJzNSVtIQ9tZVExyHGQ+wWMCZ2PywJdwgVX
         gvuM6vtyuf/JgRypLdwAul3Xcs44t4yKvKb5v/1n1S45XyJbNsbsfmHcSg8I8dV0m39w
         YpGw==
X-Forwarded-Encrypted: i=1; AFNElJ+SzTwA02qaalV9k/dsCtJycTTN/Q0fhzB0K98vW2LqT9er51l8wj9ora0kLVkYTRSVYZ0CE3fPdcX5Kw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2CnShQYxqGXS5NbZ/QapQnXTjuevtgefhI4UyAMnGnWcSNlN9
	uoGMjpayH8ocnn7Ud5+apEF64/IEVy67F2JIuYF9O4+1hi6luQlw73I3
X-Gm-Gg: Acq92OFc9IznM5uxhD36lFmFvm8wfkdjVR7DU2NO7nFTMk4d6BPR5N9tL4e0jGowCZ+
	qk23hW2BbXBfaJIdkruc4ebd93M6AWoUvScc285NzWVj+ayYiiffU7fLfp3cUTRotiEaWbtnsj+
	CHBXPJjPYjjuKQvIr6itum4mRUazh5bvYBDSTiiZb7+CnqOc5To41Ct8Z8TSyY4Tg4T4GWqJ+d3
	6IlPn8p/7nWND5zOQ5J2N6KSlTkiK0GLAPCklKEJuhh+9XXWkCXgsUjoZNHyq16nS0LYJovGsFb
	1o/WAaoftqT7w006kMh+t6kQ8U+pHX5tRH+j3MtHEkjitj+nyy2oQV9/sfZUY/rNCRKd2Bs2xoS
	ujU9kjWeL60y6/7yqcqVVxxYdCVYIG4zBJHZnntwbWg4qhzqtfyh9gkOymqfFAatIUk/o7N6U3R
	fFgON85TEiAMt6V9/HwM5gY7i/hNyZIpvZVsAC0MRRh4+IQkdQC4MvV1GgjKgHe5aBwVwEuD3hy
	NwyYM/MvrU9voRpVFkM5oiMGDn36Ty5w+gh3Zk5KSY=
X-Received: by 2002:ad4:4211:0:b0:8bd:6baa:6a0c with SMTP id 6a1803df08f44-8ca0f611b62mr138164296d6.11.1779023879979;
        Sun, 17 May 2026 06:17:59 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ca3619c703sm22268846d6.33.2026.05.17.06.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 06:17:59 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
	Christian Koenig <christian.koenig@amd.com>,
	David Francis <David.Francis@amd.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Cc: Ziyi Guo <n7l8m4@u.northwestern.edu>
Subject: [PATCH] drm/amdgpu: fix lock leak on ENOMEM in AMDGPU_GEM_OP_GET_MAPPING_INFO
Date: Sun, 17 May 2026 09:17:42 -0400
Message-ID: <20260517131742.3435209-1-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 85FFB5612C7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61851-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[amd.com,linaro.org,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,lists.linaro.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michaelbommarito@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

The AMDGPU_GEM_OP_GET_MAPPING_INFO branch of amdgpu_gem_op_ioctl()
holds three cleanup-tracked resources before calling kvcalloc():
the drm_gem_object reference from drm_gem_object_lookup(), the
drm_exec lock on the looked-up GEM via drm_exec_lock_obj(), and
the drm_exec lock on the per-process VM root page directory via
amdgpu_vm_lock_pd().  All three are released by the out_exec
label that every other error path in this function jumps to.
The kvcalloc() failure path returns -ENOMEM directly, skipping
out_exec and leaking all three.

The leaked per-process VM root PD dma_resv lock is the
load-bearing leak: any subsequent operation on the same VM
(further GEM ops, command-submission, eviction, TTM shrinker
callbacks) blocks on the held lock.  DRM_IOCTL_AMDGPU_GEM_OP is
DRM_AUTH | DRM_RENDER_ALLOW, so this is an unprivileged-local
denial of service against the caller's GPU context, reachable
by any process with /dev/dri/renderD* access.

Route the failure through out_exec so drm_exec_fini() and
drm_gem_object_put() run.

Reproduced on stock 7.0.0-10, Ryzen 7 5700U / Radeon Vega
(Lucienne): the failing ioctl returns -ENOMEM and a second
GET_MAPPING_INFO on the same fd then blocks in
drm_exec_lock_obj() on the leaked dma_resv.  SIGKILL on the
caller does not reap the task; the fd-release path during
process exit goes through amdgpu_gem_object_close() ->
drm_exec_prepare_obj() on the same lock, leaving the task in D
state until the box is rebooted.  The patched kernel was not
rebuilt and re-tested on this hardware; the fix is mechanical.
Tested on a single Lucienne / Vega box only.

Ziyi Guo posted an independent INT_MAX-bound check for
args->num_entries in the same branch [1]; the two patches are
complementary and can land in either order.

Fixes: 4d82724f7f2b ("drm/amdgpu: Add mapping info option for GEM_OP ioctl")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/all/20260208000255.4073363-1-n7l8m4@u.northwestern.edu/ # [1]
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
Assisted-by: Claude:claude-opus-4-7
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index 9ef80bca4102..8224fb499fdf 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -1091,8 +1091,10 @@ int amdgpu_gem_op_ioctl(struct drm_device *dev, void *data,
 		 * be retried.
 		 */
 		vm_entries = kvcalloc(args->num_entries, sizeof(*vm_entries), GFP_KERNEL);
-		if (!vm_entries)
-			return -ENOMEM;
+		if (!vm_entries) {
+			r = -ENOMEM;
+			goto out_exec;
+		}
 
 		amdgpu_vm_bo_va_for_each_valid_mapping(bo_va, mapping) {
 			if (num_mappings < args->num_entries) {
-- 
2.53.0


