Return-Path: <linux-media+bounces-61011-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YP0FEBIYAGr+CwEAu9opvQ
	(envelope-from <linux-media+bounces-61011-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 10 May 2026 07:30:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4A6502A5E
	for <lists+linux-media@lfdr.de>; Sun, 10 May 2026 07:30:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 900E3301AF73
	for <lists+linux-media@lfdr.de>; Sun, 10 May 2026 05:30:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24C5A347BD7;
	Sun, 10 May 2026 05:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IxAJt+7p"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A0C345CCA
	for <linux-media@vger.kernel.org>; Sun, 10 May 2026 05:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778391038; cv=none; b=kK2i9Ol8GWPtqrterhKNF+RiDX9xGz94l/IY1QQuoOVUmC0jt/1K3Gf/i+ZSIEOAHyNDwV7aHkHixcBLxBTw7EjPYN3lWIFZQuLMGtw5WYJVnOvuLWd3f8ErNfz+wMDqV1SjWjGycJDuxeL5GPxSVDKTLtjBw6Szvy5FNKy4ckY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778391038; c=relaxed/simple;
	bh=KIsmtJOEOeNGwnrSKy5ZyFdD72rmOYFJWN7TY1z7kXc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QkX5AAUJyiRBZRJFF5oj5tjOttMzG77ocsoHvKibubI1+73ibkb1Zuy5EryStk+BuAw3+n9RFVRAfZSmB996jGo7DGjM+xb9p+/85ftrDnd8OwSoxqX2s9cba08i0GnuEjccpq70LCnTvSa9Q31n6Emohxe2kOCTIacFG38RDLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IxAJt+7p; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c822652f82aso2308213a12.3
        for <linux-media@vger.kernel.org>; Sat, 09 May 2026 22:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778391036; x=1778995836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HiZtT3KiED6Ar39Wsw4WFRof7QOLYq294txhwcfCtho=;
        b=IxAJt+7pBEqEolb9NCnmrTX6rY9fJzjk5TWD8lp3P+WNgSEPT4mzKw4UqWuFRO3Q/h
         J9neWTfm2xu0hanQLqPxSg0cf43/bK3O4tWcsL/ytJH/3fZlv2pr6C6l+0jIIfwNGxCf
         l6m24HVF8bs5uWUBlgmiSk4FlnmLj9xWOnjvLQ3sRo2RBcmox/yV0akOWgpFhf2ehK2H
         uOoigVQGqbBn+DlHCA7B3DTkmm2oGyQFmHUm4xLfj8Iebzsh+aPp0Iw37NzShXb+oA15
         ufJf1KaojOSefboMw4196aZB+jULTcgjZwmAwWr1YwEzAQ0rhnjUTYtbHReHJ37CdHeV
         Fl0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778391036; x=1778995836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HiZtT3KiED6Ar39Wsw4WFRof7QOLYq294txhwcfCtho=;
        b=SNO63C12Ol8Fh0LXSxTZGSwvRxXDAakUQwok36tatTGgYMGv9sI/G+jhhFQKj0X2dj
         Z7BDNfl418qqh5StLLoSkV1MGGwcwE90cmTHOfDF4Tztonx8fo0SyATw6yde/EUnc/At
         IzDFldmQNKbws6e2Hlzvjk2r8pta2HorMzRfzG27PWx6dmANZ6Phakt68Pe50MopqdON
         FCE3/RG+zjup04HuDTW80dmmKHN0ymmhdOp8KTZNb8EkLeHHvjwZEEFeqz7MvAIpcz/D
         g/F2mJgPusLVyggfPqmRELGs9gfRMC1A1RNOUWQqVmisVUuqnacpiR7qo44yEPsvXVdh
         vVeg==
X-Forwarded-Encrypted: i=1; AFNElJ8kryAzG7qSmFw/zUj5T+Tv4VkuUw9MJC/LdxSpUY1E0LcLyWxWtZs6HegL19K3HfmT3lJb1axKxFAA7A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8B0THAmCaTPPbwUk6HTGQnpTR8DIxLjk9MsrPCIPh8YMJsySq
	7TFGFOBFsVNNqSEgkiHfz78n80LPvrlA11k95pMnlNGXRFxLMTuqfng7
X-Gm-Gg: Acq92OFPWUvqj2QK8B2AA4NUnFRs6KrZ674/W1De9UfAA3sfU8b9vI6ruk8z6KaPExx
	nJZ0uSZn9HvGJ2j3kdqFOfPb+lTfFDxyWP63JbhbE3l3Cq6Ns6jLPcw0EIK91woRJidXqRfW/1U
	jl9h+ynrApQOTB2pHWesVgxxi308WO9AryZOWSv3VPZsnadEwY6Xm9h8mk3ACGAlipTNnNp8pBe
	5zVhUWHqtJr3R9ki9BDqRS9kfG6Mdhoiry13S5XFaU//cPMKs3AjKF+SoNOkA92Gl4KD8YNLar5
	XwmkyR7hqTBablDJ+UswF4JLYUUbUErsNNS87wC+livPZAqMKBMmE/cwNUqHYiWbOVEV25J3NzH
	uZhhhDM114Xln3Jqsk7cbso5h7KfvjJ+i+Vwdgt0XUo/4hs/trVolk6rPx9aJrYRpiu6KCck3Qh
	sYNTVRXK4MeZVvr8vDHOgz+g4MGlB+p+Jf/4NqwCOjy5Xpd7qNCQt9ys5c2mIDqH9y2big+izim
	2vz7UI=
X-Received: by 2002:a17:903:388c:b0:2ba:307:4584 with SMTP id d9443c01a7336-2bc7aa40967mr50895195ad.32.1778391036502;
        Sat, 09 May 2026 22:30:36 -0700 (PDT)
Received: from deepanshu-kernel-hacker.. ([2405:201:682f:383f:5d23:3a35:10d1:5ed6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1ebea72sm67859095ad.77.2026.05.09.22.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 22:30:36 -0700 (PDT)
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
Subject: [PATCH] drm/virtio: check virtio_gpu_array_lock_resv() return in cursor update
Date: Sun, 10 May 2026 11:00:25 +0530
Message-ID: <20260510053025.100224-1-kartikey406@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 9F4A6502A5E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,lists.linux.dev,vger.kernel.org,lists.linaro.org,gmail.com,syzkaller.appspotmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-61011-lists,linux-media=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.906];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,syzkaller.appspot.com:url,appspotmail.com:email]
X-Rspamd-Action: no action

virtio_gpu_cursor_plane_update() calls virtio_gpu_array_lock_resv()
but ignores its return value. The function can fail in two ways:

  - dma_resv_lock_interruptible() returns -ERESTARTSYS when a signal
    is delivered while waiting for the reservation lock.
  - dma_resv_reserve_fences() returns -ENOMEM if it fails to allocate
    a fence slot; in this case lock_resv unlocks before returning.

In both cases the resv lock is not held on return. The cursor path
proceeds to queue a fenced transfer command. The queue path then
walks the object array and calls dma_resv_add_fence() on the cursor
BO's reservation. dma_resv_add_fence() requires the resv lock to be
held; with lockdep enabled the missing lock trips
dma_resv_assert_held():

  WARNING: drivers/dma-buf/dma-resv.c:296 at dma_resv_add_fence+0x71e/0x840
  Call Trace:
   virtio_gpu_array_add_fence+0xcd/0x140
   virtio_gpu_queue_ctrl_sgs
   virtio_gpu_queue_fenced_ctrl_buffer+0x578/0xfb0
   virtio_gpu_cursor_plane_update+0x411/0xbc0
   drm_atomic_helper_commit_planes+0x497/0xf10
   ...
   drm_mode_cursor_ioctl+0xd4/0x110
   drm_ioctl+0x5e6/0xc60
   __x64_sys_ioctl+0x18e/0x210

Beyond the WARN, mutating the dma_resv fence list without the lock
races with concurrent readers/writers and can corrupt the list.

Check the return value of virtio_gpu_array_lock_resv(). On failure,
drop the references taken by virtio_gpu_array_add_obj() with
virtio_gpu_array_put_free() (which does not unlock, matching the
not-locked state) and return without queueing the command. A
skipped cursor frame is harmless; the WARN and the underlying race
are not.

The bug was reported by syzbot, triggered via fault injection
(fail_nth) on the DRM_IOCTL_MODE_CURSOR path, which forces the
-ENOMEM branch in dma_resv_reserve_fences().

Reported-by: syzbot+72bd3dd3a5d5f39a0271@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=72bd3dd3a5d5f39a0271
Fixes: 5cfd31c5b3a3 ("drm/virtio: fix virtio_gpu_cursor_plane_update().")
Cc: stable@vger.kernel.org
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 drivers/gpu/drm/virtio/virtgpu_plane.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index a126d1b25f46..ca379b08b9ec 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -459,7 +459,10 @@ static void virtio_gpu_cursor_plane_update(struct drm_plane *plane,
 		if (!objs)
 			return;
 		virtio_gpu_array_add_obj(objs, vgfb->base.obj[0]);
-		virtio_gpu_array_lock_resv(objs);
+		if (virtio_gpu_array_lock_resv(objs)) {
+			virtio_gpu_array_put_free(objs);
+			return;
+		}
 		virtio_gpu_cmd_transfer_to_host_2d
 			(vgdev, 0,
 			 plane->state->crtc_w,
-- 
2.43.0


