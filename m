Return-Path: <linux-media+bounces-63005-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDFbGsc2GWogtAgAu9opvQ
	(envelope-from <linux-media+bounces-63005-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 08:48:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE765FE252
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 08:48:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C9F5B305D9AC
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 06:48:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 392E73AB498;
	Fri, 29 May 2026 06:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J1CzltVf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8AA3AB284
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 06:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780037302; cv=none; b=kdIIs3oWxhPaLfHF+qyOF1GN49sfF8lC7zBuAbS9swdOLcaaBxCJI4ZhYLVdhlWe32SdfukN9I+Ml5eXNxGIK8Aga5oLrT74LhQsNfpIJtmJP7XDxnC0CXjv4IM8IcgEym0oIvVmuYPGO+jprETEO1ekvreZY4zKENtxoVd0LAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780037302; c=relaxed/simple;
	bh=vxKwswKmvDwSygW/i91TX5sMpAhDAEGevnNHF02W6do=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z8hHaxFFmTKxwFj+6JhwKwl5/fK1byIawUSXHliRjh5C/qjan63WT0PLLkMbIjvfE5KVVjFLN9nWu27Tq4LUMTgKX9m5N9U78Z8h4TqV5N1ULOG9Hv+vVHIxZyBg2XSEOWnuA4mETaFQetlM0lHWm6xFRCx7y/80X39+yh9TF0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J1CzltVf; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a887ebb416so16997590e87.2
        for <linux-media@vger.kernel.org>; Thu, 28 May 2026 23:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780037300; x=1780642100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=doPRw5QapmDdqAPGgFbdNczGbZz+3rVnzTYKju4SbAA=;
        b=J1CzltVfqzVnQwZAXv7tXQQHeHwae2GJqoFPxPAVIIUew2ibUyPVSm2xLVHWA17kpN
         ZpTFMa4Msw6bxwJU8ddg80HsaWqGf8qQHfcUuVw/IR7JLWvYpefQ+lhiFrY24phw8YlX
         vXe8+Y9cVjrvtSr4BAmpkiOILRacyrzKA9rIATMAYSrLzdV3bN4UnIytBCKKEb+cDBJE
         nwhmruo+lE7UecIy3ZaTEMJGQJNsOhG1KGidpekx1fNx+aDzTNkSF9F+xtKQUFyZHbqf
         HteybHEQwaOTLq5+CwgWtFem4Nd600MhJN29bUgrPsA24U6UG4jezEcpN70jBEBRATQA
         37Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780037300; x=1780642100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=doPRw5QapmDdqAPGgFbdNczGbZz+3rVnzTYKju4SbAA=;
        b=stYWLst4vQghl18UzoL9zXw8fr4Qnc92A6RNbi9s8nVqJ/5ta/drDh3dT0UKQXwWdi
         c53qKIiZxQNoBrvKqVXR/gwzzYQwCfb2Mk8BCbtW4QQYKB3NSL5TmaIugCdfKL8QNQeO
         j/uFe9DJLhTdA2m4RA8zKll3C6WXYQvXr0aySVo7PF0SwtUc17OW32WAnDSCkKH+BI0z
         G0e1z6TcGnW5bfMH1LlN4JvZxyyETuSyIuM2UnOqFUdEWLq5zZXmKV2n5dfmxF6nRVyJ
         HzIWhqlA6UuibbcadBpZvDC8eYKcXiZiQCRPHbfyrURR+x4LcpEsWxElFCWx/S4AC9JD
         /ePw==
X-Forwarded-Encrypted: i=1; AFNElJ/+zc3nJaRwzDbMl9lr5x5iD6XvuBPLIMAeR0oJb6eEIRLxvTvX2+cuVQiE3wOsqf8mqvz2wVdxIeSXjg==@vger.kernel.org
X-Gm-Message-State: AOJu0YygPLoZvv9ucIRMzgYe/t+Y7/zYpn7oAcqJhO244CQB9vCcuZO+
	hG/7dtEYeZC9o6TGVue+rK38jYnYsuaBeYrzHkerHqeYIvSScdxJ1szD
X-Gm-Gg: Acq92OHDQKCumWWutruX8TBv4VDahsYvNh4bVORtq/Wxo9AiphVIiKnrnkauB9akmmI
	3DbTw3eV0RBq55/EHYolGGtR9dpGbWt8jp8eVwShTLkMTNffxChrJ9tDEbCfPkgUrzv/WuPUPcn
	wdcqDD+b3YNILj/YNsbKEE080Oi6Uz/iRqfMcvxYrd9i998dczMBjZwlz0BBwlbvBcr1ccC3fSU
	CAxCwtyMOlE8SoYhM9N7f7o+D+wQdKTLMHlazAVOKnAW6zuYf3T1x9xrxRxdkr+5MpLSc/ZJD6F
	azoamtTs+V5ZW/MFtZwxrfuiWHG+k6AcS5cg2oQgWPmp/54HAlW9oBiA8/2jLMjB+/nKf3Xha8H
	qlFcfgNbp9GDeJvz2uDSTg2yCtg3HXNYaJhHb70S53/qXFUG9d5SY+7BVnSJcNXobn2qMkQkFDn
	1JahphfYTM9C1sbKjLQCY3LWAjemI8uzwgzfffgQTLkI4=
X-Received: by 2002:a05:6512:3d1c:b0:5aa:2a30:217a with SMTP id 2adb3069b0e04-5aa594a573bmr325607e87.34.1780037299072;
        Thu, 28 May 2026 23:48:19 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa5b79f04dsm72147e87.83.2026.05.28.23.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 23:48:17 -0700 (PDT)
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
Subject: [PATCH v6 0/2] drm/amdgpu: fix recursive ww_mutex in devcoredump IB dump
Date: Fri, 29 May 2026 11:47:37 +0500
Message-ID: <20260529064740.25060-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260521150841.20625-1-mikhail.v.gavrilov@gmail.com>
References: <20260521150841.20625-1-mikhail.v.gavrilov@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63005-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: ECE765FE252
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
       (Reviewed-by Christian on v5.)
 
  2/2  Move the IB dumping into a separate helper that locks the root PD
       and every IB BO together in one drm_exec ticket. The per-IB
       amdgpu_bo_reserve() nesting is gone, along with a BO refcount
       leak on the old reserve-failure path. This is the actual bug fix
       and carries the Fixes: tag.
 
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
v5: https://lore.kernel.org/amd-gfx/20260521150841.20625-1-mikhail.v.gavrilov@gmail.com/
 
Changes since v5 (all in patch 2, per Christian's review):
- Trim the commit message: drop the reproducer paragraph, keep the
  problem description and the solution.
- Move the IB dumping out of amdgpu_devcoredump_format() into a separate
  amdgpu_devcoredump_print_ibs() helper.
- Use goto error handling inside drm_exec_until_all_locked() instead of
  break, and drop the now-superfluous `locked` variable. drm_exec_fini()
  is called once at the end of the helper, not in the locking path.
- Patch 1 is unchanged from v5 and keeps Christian's Reviewed-by.
 
A note on one review point I couldn't fully confirm before respinning
(asked on the v5 thread [1], no reply yet): in the locking loop, when
amdgpu_vm_bo_lookup_mapping() returns no mapping for an IB, this version
treats it as non-fatal -- there is simply nothing to lock for that IB,
so the loop continues, and the content loop still emits the
"IB #N <addr>" header without a body. goto-abort is reserved for real
errors (VM not found, drm_exec_lock_obj() failure). If a missing mapping
should instead abort the whole dump, I'll change it.
 
[1] https://lore.kernel.org/amd-gfx/CABXGCsPPY3qX7Ad-a7==nmA5R7aejCTCrmWYpn-9OQQU=1eMMA@mail.gmail.com/
 
Changes since v4:
- Pass nr=1 to drm_exec_init() in amdgpu_vm_handle_fault() (Christian).
- Picked up Christian's Reviewed-by on patch 1.
 
Changes since v3:
- Lock the root PD with drm_exec_lock_obj() instead of
  amdgpu_vm_lock_pd(); drop the root output parameter; unlock with
  drm_exec_unlock_obj() on the VM-recheck-failed path (Christian).
- Resolves the docutils warning the kernel test robot reported on v3.
 
Changes since v2:
- Reworked along the lines Christian suggested: amdgpu_vm_lock_by_pasid()
  takes a drm_exec context directly (patch 1), devcoredump locks the
  root PD and all IB BOs in one ticket (patch 2). The v2 helper struct
  and the three collect/lock/release helpers are gone.
 
Changes since v1:
- Switched from per-IB amdgpu_bo_reserve() to drm_exec.
- Dropped the Cc: stable tag: the regression only landed in 7.1-rc1, so
  the fix reaches 7.1 via drm-fixes without a stable backport.

Mikhail Gavrilov (2):
  drm/amdgpu: convert amdgpu_vm_lock_by_pasid() to drm_exec
  drm/amdgpu: fix recursive ww_mutex acquire in
    amdgpu_devcoredump_format

 .../gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c  | 215 ++++++++++--------
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        |  91 +++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h        |   2 +-
 3 files changed, 184 insertions(+), 124 deletions(-)

-- 
2.54.0


