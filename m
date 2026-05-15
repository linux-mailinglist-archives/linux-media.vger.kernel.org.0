Return-Path: <linux-media+bounces-61637-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6N7qB2beBmp4ogIAu9opvQ
	(envelope-from <linux-media+bounces-61637-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 10:50:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B3A54BBC1
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 10:50:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 13ADA303642A
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 08:42:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB55E3FBEB1;
	Fri, 15 May 2026 08:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hIxoi3v0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A55421EFD
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 08:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778834444; cv=none; b=jcpBbHTLOCusTVzVBF/i3CA+sIIUG+EXHqM0G3SbEtLRoqNrrX0bE3y+lVe4GvI7cDlK6nG5FuB+V5ZNTVZ7B97D4tdrsl6XSlOCBAwOwJhtNqGAOYsAC/Iq8Y5WhVrc7mXVQUyLAhfOvj0qp/bVEYY7TLa4Ev0pBBBNVH2pcrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778834444; c=relaxed/simple;
	bh=bMjgEAA1AihAMMTwD1pxLHmMxEIVCiAxGqmaIQ/5jHA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e8JmyHsx1hEtyyj87spEpxHjz4WjfiWyvUCoJK4TyQn71N2abVucSRP70M0kaKk68paU2IFTCacwZUOJAtRoh2lx6gS6isR1+0P0rkDYhgUIPDscsH52LXJYe+pPWjOKIVGpRgw+VOgXdbfj+fMiJ62N51HIEVE//oVuFtNRdHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hIxoi3v0; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-368763a1bdfso3788112a91.2
        for <linux-media@vger.kernel.org>; Fri, 15 May 2026 01:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778834442; x=1779439242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BcNd3ITFWzMqmrli28Wy6nyBCrJ36rIyJ26nJuqd1AM=;
        b=hIxoi3v06tCCvrj4Y5gfes8QrUX17ZVk3XzUo9S3xnShclLaLuJSVaaLLkQm9a6MMH
         24WVS6BJzXggjBJvm2HMLVWH2xAi5Z/eGKB8bhZgxyF8toyGoz9zujUFKJyg0ZecrIPS
         Hly/MNkpUhJjUfAIdwMRhQD+/NXLdimAc6cg3BU4lB21ozT9kULL273mKR8AMh17cTRz
         iSSJDggNIQJMacAKaYY8uU85BWC8D6RfZJRVQn/yGw6WsGca/qx6skJ5rHLbaH+tD636
         hwfWyyPyRhGuyQZMTkjXi3AqqOQFaWKV30T0FC3SOi0QDzqnrXxeEIFdyE7vIuempjUX
         zJCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778834442; x=1779439242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BcNd3ITFWzMqmrli28Wy6nyBCrJ36rIyJ26nJuqd1AM=;
        b=rQtnGmI3vdaf+DIxN5zz2ctlpedfZWiiNFv6jdAxg/0SvplkzCB86HEzNqKy/ntMsc
         hRVKut+teR0UZF+uqpghYgxFiL9J8+KKxcU4KVIDvwvt4aawEwv5ZG7GToO7k3TXaZCI
         1Nw32+d2vOkslVkKeDnsc3hqaM3IMP2B8O+GUfsV9PrzRn6L5+Bp+jEyvoAMdbcZt9Jc
         43fTeM8m1vp6Myd8Pb0IHxNfu/usifptdPpciUIssUG/jYjLio7tMVAR21/z7lCsChh1
         lBc/EOjlaSd5xvei3+Qb6Zn3gwZGVTr52ATht3Rd90j4lyCnSWXBBUrBGlIG1tQo9jfD
         /CjA==
X-Forwarded-Encrypted: i=1; AFNElJ94LBTuCgnziONDegszgqGtcJV0CWf3qyyxYPmtiX9TWTnYWEl7jGW2f5QuVo1iXYWAFKZPCkZ9VDFnwg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUEG1wb2OGCDXZaVmkdxvYzADls4OEONFFnhELDA6pcfvDDAzU
	XDKoHhg05LVPrGHH4HrloyPv89R9kSPOczioynuCsHnm+c1mzqB0EUjj
X-Gm-Gg: Acq92OFZFG2Q3lG7cZyi1tji5j83z79EtOelqQLQKv1VGQzTnMQvZg4DFzwiEw1qiuY
	Ka/QzodVVGv+SjfVMlDgKOPqij4uVEgsdCP4w0ce5ucpkIGuUnrwgmV5Y64PmRxetsq9RCe4wep
	HjkSVI6bk5bR/bpz+GMnNZ1olyqx2PmkvDvjJJd8LbatfhPybaJTqORBmT+6lm2eFihfNIjl7bc
	VM7tfuWZ05HZuanmDKCjyzZrTDlqLs0RTuZa4GCA8gOPjZ1YiLxvcnImG7ZOaPE9Lr4+Z1qreWp
	GI/nocqiNIlpw99VFnlo53IW9BqV3omSmay+rQ480UpDUZpP3QMuI5tXMDV+XmcmvND0/YMNJXY
	ehb/yzV9Wxb2QoyTQ+WuAndSSF1v6GYvkwyQYR/yXfOd1Nb3CsNpRdhORrgq7kFevWAGLT5AypP
	F/USOn1t+GRmF6Uks8VRIt0Zc7jF8j52+dZ6qdLnp+SaJkj5HGFimJBhHZMTVZCj0l0Y+6RuVZZ
	+a7lpg=
X-Received: by 2002:a17:90b:134b:b0:368:78da:803 with SMTP id 98e67ed59e1d1-36951a01748mr3017625a91.12.1778834441878;
        Fri, 15 May 2026 01:40:41 -0700 (PDT)
Received: from deepanshu-kernel-hacker.. ([2405:201:682f:383f:ad23:b1a5:6537:1208])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36956535742sm637091a91.3.2026.05.15.01.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 01:40:41 -0700 (PDT)
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
Subject: [PATCH v3] drm/virtio: use uninterruptible resv lock for plane updates
Date: Fri, 15 May 2026 14:10:30 +0530
Message-ID: <20260515084030.21986-1-kartikey406@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 16B3A54BBC1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,lists.linux.dev,vger.kernel.org,lists.linaro.org,gmail.com,syzkaller.appspotmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-61637-lists,linux-media=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,appspotmail.com:email,syzkaller.appspot.com:url]
X-Rspamd-Action: no action

virtio_gpu_cursor_plane_update() and virtio_gpu_resource_flush() lock
the framebuffer BO's dma_resv via virtio_gpu_array_lock_resv() and
ignore its return value. The function can fail with -EINTR from
dma_resv_lock_interruptible() (signal during lock wait) or with
-ENOMEM from dma_resv_reserve_fences() (fence slot allocation),
leaving the resv lock not held. The queue path then walks the object
array and calls dma_resv_add_fence(), which requires the lock held;
with lockdep enabled this trips dma_resv_assert_held():

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

Both call sites run inside the .atomic_update plane callback, which
DRM atomic helpers do not allow to fail (by the time it runs, the
commit has been signed off to userspace and there is no clean
rollback path). Moving the lock acquisition to .prepare_fb (v2) was
rejected because the broader lock scope deadlocks against other
BO locking paths in the same atomic commit.

Introduce virtio_gpu_array_lock_resv_uninterruptible() that uses
dma_resv_lock() instead of dma_resv_lock_interruptible() on the
nents==1 path. This eliminates the -EINTR failure mode -- the
realistic syzbot trigger -- without extending the lock hold across
the commit. Use it from both virtio_gpu_cursor_plane_update() and
virtio_gpu_resource_flush(); check the return value to handle the
remaining -ENOMEM case by freeing the objs and skipping the plane
update for that frame. The framebuffer BOs touched here are not
shared with other contexts and lock contention is expected to be
brief, so the loss of signal-interruptibility is acceptable.

Other callers of virtio_gpu_array_lock_resv() (the ioctl paths)
continue to use the interruptible variant.

The bug was reported by syzbot, triggered via fault injection
(fail_nth) on the DRM_IOCTL_MODE_CURSOR path, which forces the
-ENOMEM branch in dma_resv_reserve_fences().

Reported-by: syzbot+72bd3dd3a5d5f39a0271@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=72bd3dd3a5d5f39a0271
Fixes: 5cfd31c5b3a3 ("drm/virtio: fix virtio_gpu_cursor_plane_update().")
Cc: stable@vger.kernel.org
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
v3: Per maintainer feedback on v2 (lockup caused by the broader
    lock scope in prepare_fb conflicting with other BO locking in
    the same atomic commit): drop the prepare_fb/cleanup_fb
    approach, introduce an uninterruptible variant of
    virtio_gpu_array_lock_resv(), and use it in both
    virtio_gpu_cursor_plane_update() and virtio_gpu_resource_flush().
v2: Move resv lock acquisition from .atomic_update (which must not
    fail) to .prepare_fb (which may), per maintainer review of v1.
    The previous approach of silently skipping the cursor update on
    lock failure violated the atomic-commit contract with userspace.
---
 drivers/gpu/drm/virtio/virtgpu_drv.h   |  1 +
 drivers/gpu/drm/virtio/virtgpu_gem.c   | 24 ++++++++++++++++++++++++
 drivers/gpu/drm/virtio/virtgpu_plane.c | 10 ++++++++--
 3 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index f17660a71a3e..43a7eb568e15 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -317,6 +317,7 @@ virtio_gpu_array_from_handles(struct drm_file *drm_file, u32 *handles, u32 nents
 void virtio_gpu_array_add_obj(struct virtio_gpu_object_array *objs,
 			      struct drm_gem_object *obj);
 int virtio_gpu_array_lock_resv(struct virtio_gpu_object_array *objs);
+int virtio_gpu_array_lock_resv_uninterruptible(struct virtio_gpu_object_array *objs);
 void virtio_gpu_array_unlock_resv(struct virtio_gpu_object_array *objs);
 void virtio_gpu_array_add_fence(struct virtio_gpu_object_array *objs,
 				struct dma_fence *fence);
diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/virtgpu_gem.c
index f22dc5c21cd4..08c4b7ef8d44 100644
--- a/drivers/gpu/drm/virtio/virtgpu_gem.c
+++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
@@ -238,6 +238,30 @@ int virtio_gpu_array_lock_resv(struct virtio_gpu_object_array *objs)
 	return ret;
 }
 
+int virtio_gpu_array_lock_resv_uninterruptible(struct virtio_gpu_object_array *objs)
+{
+	unsigned int i;
+	int ret = 0;
+
+	if (objs->nents == 1) {
+		dma_resv_lock(objs->objs[0]->resv, NULL);
+	} else {
+		ret = drm_gem_lock_reservations(objs->objs, objs->nents,
+						&objs->ticket);
+		if (ret)
+			return ret;
+	}
+
+	for (i = 0; i < objs->nents; ++i) {
+		ret = dma_resv_reserve_fences(objs->objs[i]->resv, 1);
+		if (ret) {
+			virtio_gpu_array_unlock_resv(objs);
+			return ret;
+		}
+	}
+	return 0;
+}
+
 void virtio_gpu_array_unlock_resv(struct virtio_gpu_object_array *objs)
 {
 	if (objs->nents == 1) {
diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index a126d1b25f46..ef118cb4f0fa 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -215,7 +215,10 @@ static void virtio_gpu_resource_flush(struct drm_plane *plane,
 		if (!objs)
 			return;
 		virtio_gpu_array_add_obj(objs, vgfb->base.obj[0]);
-		virtio_gpu_array_lock_resv(objs);
+		if (virtio_gpu_array_lock_resv_uninterruptible(objs)) {
+			virtio_gpu_array_put_free(objs);
+			return;
+		}
 		virtio_gpu_cmd_resource_flush(vgdev, bo->hw_res_handle, x, y,
 					      width, height, objs,
 					      vgplane_st->fence);
@@ -459,7 +462,10 @@ static void virtio_gpu_cursor_plane_update(struct drm_plane *plane,
 		if (!objs)
 			return;
 		virtio_gpu_array_add_obj(objs, vgfb->base.obj[0]);
-		virtio_gpu_array_lock_resv(objs);
+		if (virtio_gpu_array_lock_resv_uninterruptible(objs)) {
+			virtio_gpu_array_put_free(objs);
+			return;
+		}
 		virtio_gpu_cmd_transfer_to_host_2d
 			(vgdev, 0,
 			 plane->state->crtc_w,
-- 
2.43.0


