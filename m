Return-Path: <linux-media+bounces-62452-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Lx2C+fhDmqKCwYAu9opvQ
	(envelope-from <linux-media+bounces-62452-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 12:43:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E09295A3814
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 12:43:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C1569300B448
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 10:43:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B59073A6B86;
	Thu, 21 May 2026 10:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Phr0CCnC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877D737F8A1
	for <linux-media@vger.kernel.org>; Thu, 21 May 2026 10:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779360225; cv=none; b=mi7C7W3GaDyPAeqzpB4qsrOUXB+x2wsxZO+wRHcPI/KT/ml41As9sZgYixU+7CvrH3giAfZJvaM8tnovqpJ5ULWIK16SJkME6GVKAq+R1Vfr6TY0vPZcP64eEtqp9Xb716FJ6NitiOr0bsGhYmO0kVareY9Qo+mxgifrfm5R2IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779360225; c=relaxed/simple;
	bh=C8h6cW0KfHk9tKmw4KDbEe36vorCimxRnFUO/tEuMJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GrPV5r/T3ymfcgSNBkbfN9UP5ubCq/nVzi6KNLNL2lmnj58wEYJ/xepG3/rV1tLSHXRafgYNWV/6oAEuo9IqpvCnHfB/JudYW8xltNLBbn4O/yFf5Ds66BfD5Txh8cQhXGD3APyDiQe3OXikGK/d6kM4DtTGMS6+Nt6cyYZ3pKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Phr0CCnC; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-38ea6a5a0b3so48925901fa.3
        for <linux-media@vger.kernel.org>; Thu, 21 May 2026 03:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779360222; x=1779965022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IotSskqgPt1trYIpm3eRWveVqEambqTQS5bkqN0X6AA=;
        b=Phr0CCnC8/6+2UEQ421puoOI6f6TTXemKoKLq/o1+sKjqAbBCrSPRExWCsrMjKdD74
         Vls3vju910hKWPNFshAfOxLWwZfRNo7//jAtY3/ktS3/6DKwcCKBkixBGHtl5deSjfvg
         0HJj6MjpQbc08hSXLPXyFmL/kc3rQKZTWt10PcIW/BtfUsBPkc8qxU3D+ReIFdSX83p7
         LowEyepDnHjOtZMShu4HVH8DQoVo2jt92KTE8mS28E3B/dsNT2DSkSEnNbY0LxiGVPKY
         1P1Hx/V7qprlKrswP8159cBJMsRTfxXdGOI/lN8tDTZO5wbl5KIEbF3e3Yl8uLtob4CX
         F7+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779360222; x=1779965022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IotSskqgPt1trYIpm3eRWveVqEambqTQS5bkqN0X6AA=;
        b=VYccxNByGVCDQ8UTaGPdGOBKvENLPkUAXEoz1LoaJqCvntHOwJq5UhQom5lZaCFeIv
         p3fiRfEFeHiN1P5zMNFoW6i2YU5NzgFceJzOxIZ3YPWtfcDWAJK+hmqcSxa6xfp3gcwK
         6X2/mZjIOTOWkcqoxOEMsWMhFw8Oqf2xcYTr4eZ86tTpjNEx/37Du96W3pEIDNTqcMSL
         Ls1RTDv17XdK78uHuplB630m7OpcdLKxPCB9jTSA+lYdO2Q/211j4h1cf38+Zyx5Rv78
         xLjUH6HBqOUmWhw9Tpd1Mk1ntBY9oxcljKLP5jciUqbhsOoCypiaWsH4hQY2lO7hD0di
         CWAw==
X-Forwarded-Encrypted: i=1; AFNElJ+MjvP+ED7uGYKEFSL+BHL6r7JXwqeTh5Wd20Gh5Dyv2FnMOlnlC5ffFbnE4zRSHYtkM0tN/XIaLGvYBg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOP4ESCZO83mDR2tywGaQLepayOO7OpVBtSWRTVVGcafc8QkpQ
	4ANpOy1sR9QrFx8DHFpMhgPSwM52Dks2/KhFqlWA05fjONOHAKzfn5vB
X-Gm-Gg: Acq92OEdxoU2HZfOcCa7OvdOEFIU9nDJOGfCjLECjUpRcFkhKGw5YvoypATS7ONmFYY
	opFpnb4IVo+Q+Wds/5FV51kzIEDgwbX7u7WGXV/+E282EqL7MM9+Zfr0MEg+mNElcpD30U1WdAo
	hFDJSfBsjc7MvNJdABr0e7ONyMASu4kXgbIboYNHOPHAerECUsV4OMokSaFrwuR0ZgaBRI1tJG3
	nbehcPKCq6upYjY+YXj76duMImoZw3kTw8P8kel1CciiHBRSjIwo5mdSmO+WtkgMyrv45Yny+I2
	3n2DQG4vGdb0Z093z5C1J66Av007f0vStZCwwB3V5ujCR3FBdWtvZ/+1OUu1mFDO+JWITPfymmN
	fGr/EMXydO29tN3PzitxH7uILYFu+9/PXhSYOd+SXzB6Jn+yGBV1dbgw/NW25sQFxHM6gbRfUnA
	KFcKMZcGp2Ka8th9i+ySx+B2O99o2FfBmmT8Jcj9OnAQwb
X-Received: by 2002:a2e:be89:0:b0:394:2b8a:2348 with SMTP id 38308e7fff4ca-395ca644e5amr9678271fa.20.1779360221305;
        Thu, 21 May 2026 03:43:41 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395d0b49073sm1595611fa.31.2026.05.21.03.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 03:43:40 -0700 (PDT)
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
Subject: [PATCH v4 0/2] drm/amdgpu: fix recursive ww_mutex in devcoredump IB dump
Date: Thu, 21 May 2026 15:43:31 +0500
Message-ID: <20260521104335.28978-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260520151741.50575-1-mikhail.v.gavrilov@gmail.com>
References: <20260520151741.50575-1-mikhail.v.gavrilov@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62452-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: E09295A3814
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
across repeated timeouts and the devcoredump output is unchanged.
 
v1: https://lore.kernel.org/amd-gfx/20260429143743.50743-1-mikhail.v.gavrilov@gmail.com/
v2: https://lore.kernel.org/amd-gfx/20260519161541.19994-1-mikhail.v.gavrilov@gmail.com/
v3: https://lore.kernel.org/amd-gfx/20260520151741.50575-1-mikhail.v.gavrilov@gmail.com/
 
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


