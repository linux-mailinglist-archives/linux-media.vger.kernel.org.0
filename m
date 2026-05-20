Return-Path: <linux-media+bounces-62313-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +M7uNYzUDWrW3wUAu9opvQ
	(envelope-from <linux-media+bounces-62313-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 17:34:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C17590FA4
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 17:34:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 355CE321BAC7
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 15:18:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 945C13F0757;
	Wed, 20 May 2026 15:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LKuYyJPi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561683EFFAD
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 15:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779290271; cv=none; b=ck3IxQ7di9cTR8UWYT8CTfdJInPUkxMEZbNWT1Fy5XOxideEQf5ntxXpqMg8nR2LEuOH+C+e4Kw7r3wEU+2DfUMCtOray+z8LUY8nwIkObZiYqIIaE2L7A3aYpT982OYw/pHPQ6QB+3A/vJzg5dZOYelKP7e0LwxUf7YtUbw6Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779290271; c=relaxed/simple;
	bh=A8s9eIZWewOU5QRyqXcZfjU7uq75uKfqUxvVF4rbh0M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mhNsu0dcA4ZDc3ysSx2upzDxpQH4mFq+psIEnubpZT9PjxTJpIzRFO4ABklEAJcyhMq+bOb4TeFfZCP05X+WWNE7GrgpIHi239jGDcGogGGiG+LnWp3iCyMCdbOOmy0eW5YpwI8GJBymACZMDyckXk1wtCCRQQQncNcZjpC2aTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LKuYyJPi; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a995ab70d1so7414143e87.3
        for <linux-media@vger.kernel.org>; Wed, 20 May 2026 08:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779290267; x=1779895067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ircF4PWSycvWSmAyVL8auld82Bsa3FQOWa7WNmN+a+A=;
        b=LKuYyJPibVy1pd2DqY5maDDKR37U2namfeN4N/X5ftrIzZcRWfb2bw9S+9VQsPbBVh
         Lud0zSzXpzrVvxshW+bxP9rVSpjRFdY9CKcS7Fc3ZXXvHZGpPP61aAxU2W5ew12Urpx7
         hQ8mJ77dfdi2hkufbZZzRcIkUn84yJLjzmj1UQP7KPdaQT1KOBQuZpIKDwrt8MIuPjmU
         l9UhhnLY1XmfBjZUTwNgerO3Sv5HRQccQsELgTDcJrWdxPDKm9RNFW/L3HTDYJbZNqGa
         IBPdMWlp10VWlsO3N3ZrSD0wo8+SK5REHIxViBn5SU7ojlG4Fue7QzgtxPmAOcahYZFV
         2bNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779290267; x=1779895067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ircF4PWSycvWSmAyVL8auld82Bsa3FQOWa7WNmN+a+A=;
        b=Q+Pzz56G6dwIM7yoQjxy1/6oz0jmgMyZW4yl+xrEj7BvmdATu6OSrxiOw1bbJyz8C/
         mSDs9G5aWMsVumPNWXix+Fk8NP4TMSV243k2SJEqtfuXt/GkNcyaQA4fMyKtRo+4Fnfc
         jQwfdnwSar/p7Kud4QB8I5q6pG93lOTS7IPt3MBFgejcRBrbuAolhBSioPe4z6QiLXTO
         kf9n3oBRSw9z290CiiceJkwAgQTFSmMI508fQJsD3rSu2TkU9Ku/vsb46lKzHhviHHxp
         Q3e8bKFe2dxeGtzvrxWuX2bq/zXqI0EkjHoxSh2FvKJpVuVWyiVek5FOYkuGk1bVL+Ls
         YhHw==
X-Forwarded-Encrypted: i=1; AFNElJ8Ca3IBjuTC0sDDczsmpgSFIJLjQHBQmrn94j2hssKVMR0sXLHKo1Hota6Jjc6KdgA4ppOK7MfmoaJQng==@vger.kernel.org
X-Gm-Message-State: AOJu0Yws/1+pQ0vVrmCdkC7llFTwXHuuVxBj6qu+hucuSV75kCn51uWa
	YrVVH+jy2lg6Kb8PCsnqLkFdPvNQaP6gm8L31T3X7UvxTxOxToHcqdLr
X-Gm-Gg: Acq92OEtdY0/Yl7O+pZZqaVEpID7h4MvWSE0RJXmn2DYf7Vq43YS57a0hAZXLaDKpxz
	GUueF2Dz87+Ek5Rh50kbgPKoUgps0qTuoiXwjcQD5EgNR7XrLFxcmwydsvNQP0X/EtTnGO1TWvP
	KMH7K8zObI+CBOEW22wBcDxj99ladLemsq8nINcMfxiJd5PakV+zwSRM3UE86DO8mVClUd4FjIS
	qd5yd6S/LczSJY4wUyE7mSzBX6FdbMRLhk4hvwXmhcSgxVX0cx9ym/9k+auEewaMWov+wKrcpN7
	eYYwI1rhTJMHgFKo2z6mDIklvOGa5VqZGMrMSrVnMyo9rxdJQf/LIda1HJSI8sexoi9sV8XTN9U
	qn2gcT0rBfLLU3D3wlUR2y3ztJpLukhEkprdllPd/qUViSDipw+qH8tVTINd67MCg0DorlsX1PB
	1Xl0Xn8HEu+67v5s2CDRc+5o6jLNhAvBJK
X-Received: by 2002:a05:6512:1252:b0:5a4:1672:59d0 with SMTP id 2adb3069b0e04-5aa0e7278f0mr9211402e87.19.1779290267082;
        Wed, 20 May 2026 08:17:47 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c8b2sm5022470e87.17.2026.05.20.08.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 08:17:46 -0700 (PDT)
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
Subject: [PATCH v3 0/2] drm/amdgpu: fix recursive ww_mutex in devcoredump IB dump
Date: Wed, 20 May 2026 20:17:38 +0500
Message-ID: <20260520151741.50575-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260429143743.50743-1-mikhail.v.gavrilov@gmail.com>
References: <20260429143743.50743-1-mikhail.v.gavrilov@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-62313-lists,linux-media=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,linaro.org,vger.kernel.org,lists.linaro.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: D1C17590FA4
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
 
v1 fixed this with a snapshot helper that collected BO references under
the root reservation and reserved them one by one afterwards. Christian
pointed out that drm_exec already solves exactly this — lock everything
in one ww ticket — and suggested teaching amdgpu_vm_lock_by_pasid()
to take a drm_exec context. This v3 follows that approach.
 
Because amdgpu_vm_lock_by_pasid() has a second caller in the page-fault
path, the series is split so each patch builds and works on its own:
 
  1/2  Convert amdgpu_vm_lock_by_pasid() to take a drm_exec context and
       lock the root PD via amdgpu_vm_lock_pd(). Updates the existing
       caller, amdgpu_vm_handle_fault(). Pure refactor, no functional
       change to the page-fault path.
 
  2/2  Use the new signature in amdgpu_devcoredump_format(): lock the
       root PD and every IB BO together in one drm_exec ticket. The
       per-IB amdgpu_bo_reserve() nesting is gone, along with a BO
       refcount leak on the old reserve-failure path. This is the
       actual bug fix and carries the Fixes: tag.
 
Tested on Linux 7.1-rc4 + this series, Radeon RX 7900 XTX (gfx1100),
KASAN + PROVE_LOCKING enabled, using a small libdrm_amdgpu reproducer
that submits a GFX IB chained at GPU VA 0 and waits for the hang. Before
the series the splat fires on every TDR; after it the dmesg is clean
across repeated timeouts and the devcoredump output is unchanged.
 
v1: https://lore.kernel.org/amd-gfx/20260429143743.50743-1-mikhail.v.gavrilov@gmail.com/
v2: https://lore.kernel.org/amd-gfx/20260519161541.19994-1-mikhail.v.gavrilov@gmail.com/
 
Changes since v2:
- Reworked along the lines Christian suggested: instead of a private
  snapshot helper and a separate drm_exec pass, amdgpu_vm_lock_by_pasid()
  now takes a drm_exec context directly (patch 1), and the devcoredump
  code locks the root PD and all IB BOs in a single ticket (patch 2).
- Dropped the amdgpu_devcoredump_ib_ref struct and the three
  collect/lock/release helpers from v2 entirely.
 
Changes since v1:
- Switched from per-IB amdgpu_bo_reserve() to drm_exec.
- Dropped the Cc: stable tag: the regression only landed in 7.1-rc1, so
  the fix reaches 7.1 via drm-fixes without a stable backport.

Mikhail Gavrilov (2):
  drm/amdgpu: convert amdgpu_vm_lock_by_pasid() to drm_exec
  drm/amdgpu: fix recursive ww_mutex acquire in
    amdgpu_devcoredump_format

 .../gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c  | 103 ++++++++++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        |  72 ++++++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h        |   3 +-
 3 files changed, 122 insertions(+), 56 deletions(-)

-- 
2.54.0


