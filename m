Return-Path: <linux-media+bounces-47511-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E8847C75468
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 17:14:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id EE6832B599
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 16:14:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D440352FB4;
	Thu, 20 Nov 2025 16:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i/udynMr"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85F63570A5
	for <linux-media@vger.kernel.org>; Thu, 20 Nov 2025 16:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763655290; cv=none; b=Fye6xMyVYWVpmCYG0mjxgCfWF+1p+bNbyGWrMDE/KOoz4pll52ZmvjScsZOSfQ3L3J12SSFQ7JaqXS4oIPSF71V4S7ug2xmGYRIvdGX3SIq4cLZVYo6WsYUiZEj7CYwqV3A7oRpnfh4UKBaT/x+tbNKZZtBsv57AyGTAKEonb/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763655290; c=relaxed/simple;
	bh=8FQ3Hx/P7dpdV17EIj8i93hlmzauTJyPVO0chUYXFTc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kz+cpSiYiKgN5sttxIcWapRkdELHO+kfiO3pmnCLSAi01AvCt+mJPoMu6kiepAfvjFvsSg3Fw8I8GeVqYe9NytJiy2l+Rm7duWExofvg5xg8ELtcGOjpP40j2kUZk4o5ek8/jXh5fOoMA6bHkQQJ/vTGQ1jltyAVvBGsy6gMgs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i/udynMr; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763655288; x=1795191288;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8FQ3Hx/P7dpdV17EIj8i93hlmzauTJyPVO0chUYXFTc=;
  b=i/udynMrazYiV76xzXKBLQkdw+XXGXxxERv1xBmBQDHsKz6YxCSsw4SG
   X/iAYAPlWHMXKQaFpWqynMtIMsTv08XlSfZXY7uHmRmNoi2hQgkShqFzd
   D4gzemu1+eMzjVQb5RDJIU5YbzpvXElFt2TxORmJjrDwhF1YVuUS2hKlV
   PGnSZ1AoSejQBK6p4LtF9NconUJiQi2NRmz7f4oPmmphEm1gpJDFeDbCb
   1uRNUzJkbGacKP5vHG5aWW+is1NOMnApILJL3bqXOxSVsOu6VwDgy8NJ6
   TWDohBuJIkw5BZogbGWp3fhm+/EQjqJtALG3dHpmxYOjv4m684ruLJ68q
   A==;
X-CSE-ConnectionGUID: jyVKSAL9S1GwVy21G7np6g==
X-CSE-MsgGUID: akzwYxfFSL2GGGWXWoZrcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="83353092"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="83353092"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 08:14:46 -0800
X-CSE-ConnectionGUID: 6kyUDZjeRrCVQr+kF9Zn2A==
X-CSE-MsgGUID: h8yGTxHUTLyjCrItzSWwxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="191529642"
Received: from carterle-desk.ger.corp.intel.com (HELO mkuoppal-desk.intel.com) ([10.245.246.16])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 08:14:43 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Stuart Summers <stuart.summers@intel.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH] drm/xe: Fix memory leak when handling pagefault vma
Date: Thu, 20 Nov 2025 18:14:35 +0200
Message-ID: <20251120161435.3674556-1-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When the pagefault handling code was moved to a new file, an extra
drm_exec_init() was added to the VMA path. This call is unnecessary because
xe_validation_ctx_init() already performs a drm_exec_init(), resulting in a
memory leak reported by kmemleak.

Remove the redundant drm_exec_init() from the VMA pagefault handling code.

Fixes: fb544b844508 ("drm/xe: Implement xe_pagefault_queue_work")
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: intel-xe@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_pagefault.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index fe3e40145012..afb06598b6e1 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -102,7 +102,6 @@ static int xe_pagefault_handle_vma(struct xe_gt *gt, struct xe_vma *vma,
 
 	/* Lock VM and BOs dma-resv */
 	xe_validation_ctx_init(&ctx, &vm->xe->val, &exec, (struct xe_val_flags) {});
-	drm_exec_init(&exec, 0, 0);
 	drm_exec_until_all_locked(&exec) {
 		err = xe_pagefault_begin(&exec, vma, tile->mem.vram,
 					 needs_vram == 1);
-- 
2.43.0


