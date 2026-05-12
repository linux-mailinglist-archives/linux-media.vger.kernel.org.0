Return-Path: <linux-media+bounces-61197-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0KfNCnCLAmrbuAEAu9opvQ
	(envelope-from <linux-media+bounces-61197-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 04:07:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A78518AE0
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 04:07:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E81A4301E1F7
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 02:07:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18FF03033FF;
	Tue, 12 May 2026 02:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="npTUGAS6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D13C2DB7A9
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 02:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778551654; cv=none; b=QSaasuEolYs4F7FTQ7LGsZOfYWK9T+YVgl3QWnl3nBzr1jiUt+fL4RyfGDr8brxWdVwxRYWWfy0YIRswGbvGA9t+AZJZvLmkvRMr4uSGnBJwyRMNUxsMAqIToBOzfqtqiCPs8SvkEtpEgYmO6FT5YyaZ0emYhxQpPYlRNhuUv3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778551654; c=relaxed/simple;
	bh=/hyU8HQWFXy/zCsuWFPRPpPFHAKfFRaB5wW/ZNRXdFw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a154zafOJjhVxuIl3v7bNx1mSxFHm+ySt3LonStKlyvmebaD7KegeHbmwgLjkxzgtnMsnsg+gk7vcg7uidCBpp24TKeEgOk41VvJctg2qac6aaw7NPORv6WgxtkS/qVJ3qKVVeLwJlCFkZiciQsnE0xdS0b6rN+TkrWkfRZ7s6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=npTUGAS6; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-836ed29d1e5so2125835b3a.2
        for <linux-media@vger.kernel.org>; Mon, 11 May 2026 19:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778551652; x=1779156452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/QiKU/+m/deMkZnUgiMPX7icRFO8sAPHl3F/zxCh9ig=;
        b=npTUGAS6k4OG4KFa/o8ggsWWJBuAlwXAFKzTPN+dnwMlQDfXm2BUg8lN1EFtzTkhNu
         52G9s84ddSkWnpN7Mx2hWrOirDNUwQ/7x179bFE83TAOv765XFjzm02HvkNQCFPcoFVf
         qLPPbr5etSPAHhkRqTyaGOCEi4ZGUcETTiJ9Pib8hWOkVlCgOGtqIu1AkAKkMGMXFZ/i
         vO5eAjGIhaLYpzejEx/3d7YTFQTglXSlPGWLhY0oQsgyClXQu8BLTbfggxY6pgclVqZr
         Nnt//p0KrB1MhWS7N9aYhdw453JKCDVfP/xu5ErYUse4+JFumeB5N1lmlWYPO1dcO9U/
         g7aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778551652; x=1779156452;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/QiKU/+m/deMkZnUgiMPX7icRFO8sAPHl3F/zxCh9ig=;
        b=J5OGKva68bjTm98uQFy3g0vHnVJ6PkSSQDXs+nIzBqAhSq/JQ4i1qyYG7c1QUio/AQ
         s45NwHUUjzrkTsLxJR/GDpkMiWnXbyVzzwi0J5bhZjwcUJ8u4xTQpHgWo+h4VI8x+oHP
         +w/hRsW3Fin5Jr/MXDuFuIuhQr7tk5S1UWxrPgnlA5c5CyiypQUS0SV4rKYwauYeQEr3
         Sgzd2TDm4m7YViHZ4V+vr5hynr21oKAEkyRrvMvNYkN5qx0Usu11V3tftunZ7nlWdbtX
         nLHRJMcCC2NTQU8D9d6KugwXwCEyZit3fgfCaUdZ9c6ZmhIiSDTMNc+c1JaHrsx/zMoB
         9w8A==
X-Forwarded-Encrypted: i=1; AFNElJ+XA2R3V3bMhN97OEHJlMXPSdS/EpQNw/AztISihCIV7hl1kCi3JGtRsOb14cHJ0PYVnC4P1bPhppdJSw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ4hn2GJOF1eZROPThXsDCk79O6SqqjGf5BTVoylxxTW/gbob5
	Ex9UGSIvGbJ2uTvayAP5FYMN0K12YqaopD5Czf8WU8V3SODBKesUA9Bq
X-Gm-Gg: Acq92OFiRXPCfRADxjlzaptMwnM1LA6uXGA7sfk3Z12DBu1oAHscE0uJNZYl26yxdMw
	qODMJ9VMrdN43Pq70EobK7uxLqDwgnEXai8m1167mUxFgaXiAWvoDqCpy3M7b6Vf6JZ08w8k0cD
	wkcR2MznPBKx0m+93jGQ3B/T/Vl6LhiZYO88ilR4ORDOuoOD4ZsTjsFeoAFvr7Ki2TIOC6K9Ji+
	MCDwpnhiQao0dINoURmeP6d32mUWJ2hjJFMEoojpcGSw6KSfRQYm/f/rX0W/Ri/UnSRx7dnF6/B
	WgYNbX8Huwsg5t0/JsWH8AYSyxtQP3qZWqezFjuO6/lPelVye33ImzUZCaT4kudvqWAef2BvjOK
	F4NBkZ5TYCq3R+SsjrafcGOVFNHoJQMOUMkpMRT/e6a4OrKOov3g/Xqx8WHMylZgZPtc6Tqkyn9
	/fvJY3XiQLe1OOU527YSi4ldxXZsXHRT0s2DbvbEQj1FLp03y+EjioNY8QIOVO7VXznp3Gvy32t
	dUWdfA=
X-Received: by 2002:a05:6a00:ad8a:b0:82a:17b8:1474 with SMTP id d2e1a72fcca58-83eeb9f0e34mr977275b3a.1.1778551652212;
        Mon, 11 May 2026 19:07:32 -0700 (PDT)
Received: from deepanshu-kernel-hacker.. ([2405:201:682f:383f:b0ab:8219:937d:e207])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83967dbf7d2sm28966425b3a.49.2026.05.11.19.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 19:07:31 -0700 (PDT)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: airlied@redhat.com,
	kraxel@redhat.com,
	dmitry.osipenko@collabora.com,
	gurchetansingh@chromium.org,
	olvaffe@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	simona@ffwll.ch,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com
Cc: dri-devel@lists.freedesktop.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	syzbot+72bd3dd3a5d5f39a0271@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH v2] drm/virtio: move cursor resv lock acquisition to prepare_fb
Date: Tue, 12 May 2026 07:37:18 +0530
Message-ID: <20260512020718.108044-1-kartikey406@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C3A78518AE0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,lists.linux.dev,vger.kernel.org,lists.linaro.org,gmail.com,syzkaller.appspotmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-61197-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[redhat.com,collabora.com,chromium.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,linaro.org,amd.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kartikey406@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,72bd3dd3a5d5f39a0271];
	NEURAL_HAM(-0.00)[-0.965];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,appspotmail.com:email,syzkaller.appspot.com:url]
X-Rspamd-Action: no action

virtio_gpu_cursor_plane_update() allocates a virtio_gpu_object_array,
locks its dma_resv, and queues a fenced transfer to the host. The
lock acquisition can fail in two ways:

  - dma_resv_lock_interruptible() returns -EINTR when a signal is
    delivered while waiting for the reservation lock.
  - dma_resv_reserve_fences() returns -ENOMEM if it fails to allocate
    a fence slot; in this case lock_resv unlocks before returning.

The return value was ignored, so the cursor path could proceed with
the resv lock not held. The queue path then walks the object array
and calls dma_resv_add_fence(), which requires the lock; with lockdep
enabled this trips dma_resv_assert_held():

  WARNING: drivers/dma-buf/dma-resv.c:296 at dma_resv_add_fence+0x71e/0x840
  Call Trace:
   virtio_gpu_array_add_fence
   virtio_gpu_queue_ctrl_sgs
   virtio_gpu_queue_fenced_ctrl_buffer
   virtio_gpu_cursor_plane_update
   drm_atomic_helper_commit_planes
   drm_atomic_helper_commit_tail
   commit_tail
   drm_atomic_helper_commit
   drm_atomic_commit
   drm_atomic_helper_update_plane
   __setplane_atomic
   drm_mode_cursor_universal
   drm_mode_cursor_common
   drm_mode_cursor_ioctl
   drm_ioctl
   __x64_sys_ioctl

Beyond the WARN, mutating the dma_resv fence list without the lock
races with concurrent readers/writers and can corrupt the list.

The DRM atomic helpers do not allow .atomic_update to fail: by the
time it runs, the commit has been signed off to userspace and there
is no clean rollback path. Move the fallible work -- objs allocation,
dma_resv locking, and fence slot reservation -- into
virtio_gpu_plane_prepare_fb, which is the designated callback for
resource acquisition and may return errors that the framework
handles by rolling back the commit. Stash the prepared object array
on virtio_gpu_plane_state so the update step can consume it.

Make virtio_gpu_plane_cleanup_fb release the objs if the commit was
rolled back before update ran (i.e., objs not consumed). The queue
path already unlocks the resv after attaching the fence (vq.c:411)
and frees the array via put_free_delayed after host completion
(vq.c:271), so the update step only needs to clear vgplane_st->objs
to transfer ownership.

Simplify virtio_gpu_cursor_plane_update to a no-fail queue submission
that hands the prepared, locked objs to the queue path.

The bug was reported by syzbot, triggered via fault injection
(fail_nth) on the DRM_IOCTL_MODE_CURSOR path, which forces the
-ENOMEM branch in dma_resv_reserve_fences().

Reported-by: syzbot+72bd3dd3a5d5f39a0271@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=72bd3dd3a5d5f39a0271
Fixes: 5cfd31c5b3a3 ("drm/virtio: fix virtio_gpu_cursor_plane_update().")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/all/20260510053025.100224-1-kartikey406@gmail.com/T/ [v1]
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
v2: Move resv lock acquisition from .atomic_update (which must not
    fail) to .prepare_fb (which may), per maintainer review of v1.
    The previous approach of silently skipping the cursor update on
    lock failure violated the atomic-commit contract with userspace.
---
 drivers/gpu/drm/virtio/virtgpu_drv.h   |  1 +
 drivers/gpu/drm/virtio/virtgpu_plane.c | 38 ++++++++++++++++++++------
 2 files changed, 30 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index f17660a71a3e..e51f959dce46 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -198,6 +198,7 @@ struct virtio_gpu_framebuffer {
 struct virtio_gpu_plane_state {
 	struct drm_plane_state base;
 	struct virtio_gpu_fence *fence;
+	struct virtio_gpu_object_array *objs;
 };
 #define to_virtio_gpu_plane_state(x) \
 	container_of(x, struct virtio_gpu_plane_state, base)
diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index a126d1b25f46..b0511ace89e6 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -381,6 +381,23 @@ static int virtio_gpu_plane_prepare_fb(struct drm_plane *plane,
 			goto err_fence;
 	}
 
+	if (plane->type == DRM_PLANE_TYPE_CURSOR && bo->dumb) {
+		struct virtio_gpu_object_array *objs;
+
+		objs = virtio_gpu_array_alloc(1);
+		if (!objs) {
+			ret = -ENOMEM;
+			goto err_fence;
+		}
+		virtio_gpu_array_add_obj(objs, vgfb->base.obj[0]);
+		ret = virtio_gpu_array_lock_resv(objs);
+		if (ret) {
+			virtio_gpu_array_put_free(objs);
+			goto err_fence;
+		}
+		vgplane_st->objs = objs;
+	}
+
 	return 0;
 
 err_fence:
@@ -417,6 +434,12 @@ static void virtio_gpu_plane_cleanup_fb(struct drm_plane *plane,
 		vgplane_st->fence = NULL;
 	}
 
+	if (vgplane_st->objs) {
+		virtio_gpu_array_unlock_resv(vgplane_st->objs);
+		virtio_gpu_array_put_free(vgplane_st->objs);
+		vgplane_st->objs = NULL;
+	}
+
 	obj = state->fb->obj[0];
 	if (drm_gem_is_imported(obj))
 		virtio_gpu_cleanup_imported_obj(obj);
@@ -452,21 +475,18 @@ static void virtio_gpu_cursor_plane_update(struct drm_plane *plane,
 	}
 
 	if (bo && bo->dumb && (plane->state->fb != old_state->fb)) {
-		/* new cursor -- update & wait */
-		struct virtio_gpu_object_array *objs;
-
-		objs = virtio_gpu_array_alloc(1);
-		if (!objs)
-			return;
-		virtio_gpu_array_add_obj(objs, vgfb->base.obj[0]);
-		virtio_gpu_array_lock_resv(objs);
+		/* objs and fence were prepared in virtio_gpu_plane_prepare_fb;
+		 * the resv is already locked. The queue path takes ownership
+		 * of objs and unlocks the resv after attaching the fence.
+		 */
 		virtio_gpu_cmd_transfer_to_host_2d
 			(vgdev, 0,
 			 plane->state->crtc_w,
 			 plane->state->crtc_h,
-			 0, 0, objs, vgplane_st->fence);
+			 0, 0, vgplane_st->objs, vgplane_st->fence);
 		virtio_gpu_notify(vgdev);
 		dma_fence_wait(&vgplane_st->fence->f, true);
+		vgplane_st->objs = NULL;
 	}
 
 	if (plane->state->fb != old_state->fb) {
-- 
2.43.0


