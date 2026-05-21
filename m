Return-Path: <linux-media+bounces-62529-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCH4NQArD2q3HQYAu9opvQ
	(envelope-from <linux-media+bounces-62529-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 17:55:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9B65A8BB7
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 17:55:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6CC17307F2F7
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 15:09:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7780E31F9BB;
	Thu, 21 May 2026 15:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W+WWTYxG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045E13043B2
	for <linux-media@vger.kernel.org>; Thu, 21 May 2026 15:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779376130; cv=none; b=EGHO2Cq/UIdYH4xWcbFtyfqRAf0AKkaeRUaZW7dQhwuLCY8RXaL+uaZF42IFee1JElMVhJLd8dYy/V9UT+ecL/e+NvmRstzTNkA758sxbGsE5zr93coegh/xfUxhnKb4EJSMx5UYFP/4vNzhvB9+t8wKbXr8IrBUETSyIFbUdcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779376130; c=relaxed/simple;
	bh=AqerENhdAVb1dK1V71iWIYNJydIUcNCZTL4O4bhZuBU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZLAYHxE4NHyY2pg37ISJ550KJbfowZoZwrI/yMYGmoj1OEOdPEgnlneqojN6whogSUROAjPR0rJuaGUtRwA6CIgfFuaUeeOUsO6lp4BnwfiplyzpBSJ6ya9D7/pJe4n5dHuPZwqwky9Y1cut/rWgP0c3PgR+IEp6wnCwKWxuJZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W+WWTYxG; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aa2691db86so3753915e87.3
        for <linux-media@vger.kernel.org>; Thu, 21 May 2026 08:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779376127; x=1779980927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mR8YNzhzHv5g5ezNdxi/IR56+HrSSzrEa6IF1DOutaU=;
        b=W+WWTYxG5smONszWmxMinWPHLyt74AOuCQb5JcWNmGZ/vcCpwYlwY8wodCZUVAgUdX
         pgs7cg3cTcJe5FIxt1Ezj6ezAu41TvmbmYX5Xeezq5eBIcI9bS0+uRbO70LAsh+ljdkk
         r3egPc6DcFrw4WPkVSU4/i9wA6Y6aYAMWhI/+9cDUULAKL8RuVWN6mticJD/cI/rh65a
         MVl25cvpf3BzjXHmKnblGkyg/OqWiViLYoRAC8yJFOWcj3pauTmfOFDPgG1iFV1Vo9dE
         iM0YQxZcsPukTanaVP01JNarav7GafHnKuqH6S3hprUkK6mtwgrebKVDK7Mh1Te5R1yT
         tU+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779376127; x=1779980927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mR8YNzhzHv5g5ezNdxi/IR56+HrSSzrEa6IF1DOutaU=;
        b=AdqCwotuPpnhjVs4Mw7oQnz2+vyABGtNMBAKUPDrdClA7JJOVWdiohgjga79MpX9Gq
         M433GOXGOhWiHBjBnDRrP2PNpQOk+1iYbJoGfmaJoElKg33CO1ZgKFHEA2sJueLm9TIP
         MKg3v2K5mEtHB8Grpcxax2SiDymdqYl/J2EwECiaHVrM3d9Q8hHAD+5KWTm5oxOc+hGj
         gzBYJ/jnfDTWT4R6WFI4j846rSFKhSiCFcbNFksUsMkuZEfD2RAkGUYvYxA4GPhLd2Nj
         9BmcqIkl9LljD2GUCNQtbEUHiv7v8lnZEI7DVkcQB2vyXj95JU5k9lxPuoRb5AF7+v0R
         aLFA==
X-Forwarded-Encrypted: i=1; AFNElJ8LD/Hje00d/GbwVcHQ5iIKJYf2fHybFNh343/NuYRrZuV92YvWnUD2tLtLd4F1zfZ8mvVrv1MxdiIOfw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhnMHVI08ZdqqImij32H0viU6HeSk3osDwYWRwElp0yRDCST2m
	6bgHzkV15LBolvqRX8ibrOC6fZJw7Mh21hoqYeJsfRwgs6DaeEdZ9OHE
X-Gm-Gg: Acq92OH8lHbS4ucKmvg5eW/tXyiUIuMd7xyhRgZTIzkxkriFhwna9KmGOxLtcthmV+k
	nFbddIK/IDB4NA+6cNj6gvxRh01uruvV15ZPzri3lurR4iEmRNk1gyzKqVAfUdedY+YZrwZnnid
	SXR1OtpT7APixpL2uKR/h8B128D6e6TeUkQEoBOT6t2/8Rx65fFkYvYG1mOLd+Eq+YWRCNMa+kc
	I0loKTeFimpifUViRlYsJ/ndFuZvMlqq/m4GAr5mqjueUtuh9FMW+t873J7GxsmLJJk7e7qwo+7
	OV/SdGEV1TOp4vYMsPbFCisd022mHbtIOiKKk0TZAaefbeMkKWlxWtBKn9jDaePO1ETHGkENioF
	Ng3/Iyyv3kiebmnsCBvKrkQ4IVG07qIfF75Q8hkskmICUH/8Bv74uEHpmyAR+IBrEXS7OYjS/G7
	VjIUR7rZQ+L7QTIvIZI0YkzQNOlmU6cRf0kE8Hs2iinN4=
X-Received: by 2002:a19:7001:0:b0:5aa:265f:acd0 with SMTP id 2adb3069b0e04-5aa2bc90bacmr751255e87.39.1779376126773;
        Thu, 21 May 2026 08:08:46 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa2f120c6esm335686e87.19.2026.05.21.08.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 08:08:46 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Subject: [PATCH v5 0/2] drm/amdgpu: fix recursive ww_mutex in devcoredump IB dump
Date: Thu, 21 May 2026 20:08:38 +0500
Message-ID: <20260521150841.20625-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260521104335.28978-1-mikhail.v.gavrilov@gmail.com>
References: <20260521104335.28978-1-mikhail.v.gavrilov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62529-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,linaro.org,vger.kernel.org,lists.linaro.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mikhailvgavrilov@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: AC9B65A8BB7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series fixes a lockdep "possible recursive locking" splat in
amdgpu_devcoredump_format() that fires on every GPU timeout once a job
with a PASID context is involved. With amdgpu.gpu_recovery=0 the timeout
handler refires every ~2 s, so the splat repeats until it drowns the
kernel ring buffer. It is also a real self-deadlock for IB BOs that
share their dma_resv with the root PD (the always-valid case).
 
The root cause: amdgpu_devcoredump_format() holds the VM root PD's
reservation and then reserves each IB BO on top of it, nesting two
reservation_ww_class_mutex acquires without a ww_acquire_ctx.
 
The fix teaches amdgpu_vm_lock_by_pasid() to lock the root PD in a
drm_exec context, so the devcoredump path can lock the root PD and all
the IB BOs together in one ww ticket. Because amdgpu_vm_lock_by_pasid()
has a second caller in the page-fault path, the series is split so each
patch builds and works on its own:
 
  1/2  Convert amdgpu_vm_lock_by_pasid() to take a drm_exec context and
       lock the root PD with drm_exec_lock_obj(). The drm_exec context
       holds the root BO reference, so the root output parameter is
       dropped. Updates the existing caller, amdgpu_vm_handle_fault().
       Pure refactor, no functional change to the page-fault path.
 
  2/2  Use the new signature in amdgpu_devcoredump_format(): lock the
       root PD and every IB BO together in one drm_exec ticket. The
       per-IB amdgpu_bo_reserve() nesting is gone, along with a BO
       refcount leak on the old reserve-failure path. This is the
       actual bug fix and carries the Fixes: tag.
 
Tested on Linux 7.1-rc4 + this series, Radeon RX 7900 XTX (gfx1100),
KASAN + PROVE_LOCKING enabled, using a small libdrm_amdgpu reproducer
that submits a GFX IB chained at GPU VA 0 and waits for the hang. Before
the series the splat fires on every TDR; after it the dmesg is clean
across repeated timeouts and the devcoredump IB dump is produced
correctly.
 
v1: https://lore.kernel.org/amd-gfx/20260429143743.50743-1-mikhail.v.gavrilov@gmail.com/
v2: https://lore.kernel.org/amd-gfx/20260519161541.19994-1-mikhail.v.gavrilov@gmail.com/
v3: https://lore.kernel.org/amd-gfx/20260520151741.50575-1-mikhail.v.gavrilov@gmail.com/
v4: https://lore.kernel.org/amd-gfx/20260521104335.28978-1-mikhail.v.gavrilov@gmail.com/
 
Changes since v4:
- Pass nr=1 to drm_exec_init() in amdgpu_vm_handle_fault(), since
  exactly one object (the root PD) is locked there (Christian).
- Picked up Christian's Reviewed-by on patch 1.
 
Changes since v3:
- Lock the root PD with drm_exec_lock_obj() instead of
  amdgpu_vm_lock_pd(): the latter dereferences the VM pointer, which is
  not yet re-validated at that point (Christian).
- Drop the root output parameter of amdgpu_vm_lock_by_pasid() entirely;
  the drm_exec context already holds a reference on the locked root BO,
  so the extra reference and the parameter are unnecessary (Christian).
- Unlock the root BO with drm_exec_unlock_obj() on the VM-recheck-failed
  path (Christian).
- amdgpu_vm_handle_fault() and amdgpu_devcoredump_format() updated for
  the simplified signature; both lose their root variable.
- Drops the v3 kernel-doc "*root" reference, which also resolves the
  docutils "Inline emphasis start-string without end-string" warning
  the kernel test robot reported against v3.
 
Changes since v2:
- Reworked along the lines Christian suggested: amdgpu_vm_lock_by_pasid()
  takes a drm_exec context directly (patch 1), and the devcoredump code
  locks the root PD and all IB BOs in a single ticket (patch 2). The
  amdgpu_devcoredump_ib_ref struct and the three collect/lock/release
  helpers from v2 are gone.
 
Changes since v1:
- Switched from per-IB amdgpu_bo_reserve() to drm_exec.
- Dropped the Cc: stable tag: the regression only landed in 7.1-rc1, so
  the fix reaches 7.1 via drm-fixes without a stable backport.

Mikhail Gavrilov (2):
  drm/amdgpu: convert amdgpu_vm_lock_by_pasid() to drm_exec
  drm/amdgpu: fix recursive ww_mutex acquire in
    amdgpu_devcoredump_format

 .../gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c  | 105 ++++++++++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        |  91 +++++++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h        |   2 +-
 3 files changed, 129 insertions(+), 69 deletions(-)

-- 
2.54.0


