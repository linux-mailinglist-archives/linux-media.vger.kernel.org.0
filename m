Return-Path: <linux-media+bounces-10982-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EB28BE232
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 14:33:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2BDE28AF2D
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 12:33:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB55115AAD7;
	Tue,  7 May 2024 12:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CBsLlqM/"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C047471B4F;
	Tue,  7 May 2024 12:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715085184; cv=none; b=Ow728MQk4lB1Ter7m/gago9tMVreo8j6pQE0wwolUnZ3Yhs7u3GI2ThzpagkUjUny5opClVMW6hYu2KEEA3sSfa1yJX7yW25az6Z1jsE/AYm14QJ3Mmb0SnYZvqK0N6ws7EJUrDA8ZQr7tXHb81neQs76f28/dY17hyIsG3p/SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715085184; c=relaxed/simple;
	bh=FBgLVaePL2Gdtw0fbAtikW2CKQEyxpnSzxRsSk2iIoY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PoqtQMd9vBpspCMwej7mnNwQXKhCshctpNgBHChyw9pQERei8IV48yddwH7XxzDFUsInjR/MS+6yO5PxfTvdPQXniQwP+nbWE9vSpt354YA0/SgAWwCve2Ot22c2EOgpkE+MQ6FaTn1hOpOp6g4B52fdyyQbs9CGww8kOhvONCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CBsLlqM/; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715085183; x=1746621183;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FBgLVaePL2Gdtw0fbAtikW2CKQEyxpnSzxRsSk2iIoY=;
  b=CBsLlqM/ruHcJAmbZ9WS2O9HRx3+7kEmnWiqf5Ttv+0hmupKMEAMwaP9
   /PBfrtvm/gT14zAmq6jjVK0KG0TnB6bKX1ML99AwSuevUbJBsLupmd60P
   1vyj9a7OX2iXBRd51dyGQmhLXSHScPG9xnRR0yoYySKYVeZaJtCmmXuI7
   uGHXvC+T8xnOefrVL/hzXVHnNzHngQFf8TK0GSzxCW5TWA6X4b8Ex5cWP
   LPqiZ8301u7orgL5yWXNHSJ86nM6U85mapM9q+k0b8MooPM6wb/TcPm2N
   tjPE1kATVhOCf6F5ZtTBFar6hm9UgKVMa2taK10vQ/iA4WgZ6ne92UCWk
   w==;
X-CSE-ConnectionGUID: BETuSzTcSdmXkKgwfuG/gQ==
X-CSE-MsgGUID: +9GwvLSLQca2YOqtVZxMNA==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="22269060"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; 
   d="scan'208";a="22269060"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2024 05:33:02 -0700
X-CSE-ConnectionGUID: T/GBuz95SmWNcz1x0kGWnw==
X-CSE-MsgGUID: aM6kxJLXRCGcvtIaxDiuSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; 
   d="scan'208";a="51702787"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2024 05:32:59 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id CD016120574;
	Tue,  7 May 2024 15:32:56 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1s4K08-003uYs-2O;
	Tue, 07 May 2024 15:32:56 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kent@punajuuri.localdomain,
	Overstreet@punajuuri.localdomain,
	kent.overstreet@linux.dev,
	Suren Baghdasaryan <surenb@google.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: [PATCH v2 1/1] media: intel/ipu6: explicitly include vmalloc.h
Date: Tue,  7 May 2024 15:32:46 +0300
Message-Id: <20240507123246.932398-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240506104953.49666125@canb.auug.org.au>
References: <20240506104953.49666125@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stephen Rothwell <sfr@canb.auug.org.au>

linux/vmalloc.h needs to be included explicitly nowadays. Do it.

Fixes: 9163d83573e4 ("media: intel/ipu6: add IPU6 DMA mapping API and MMU table")
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
since v1:

- Rework the commit message a little.

 drivers/media/pci/intel/ipu6/ipu6-mmu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-mmu.c b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
index 98a4bf9ca267..c3a20507d6db 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-mmu.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
@@ -22,6 +22,7 @@
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/types.h>
+#include <linux/vmalloc.h>
 
 #include "ipu6.h"
 #include "ipu6-dma.h"
-- 
2.39.2


