Return-Path: <linux-media+bounces-10983-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE2D8BE243
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 14:36:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A05E11F26390
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 12:36:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8E5C15B979;
	Tue,  7 May 2024 12:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AoR2YtoX"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6A615B0F0;
	Tue,  7 May 2024 12:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715085350; cv=none; b=DDV3q23foA1pH9v8Tg+7apTEnv7ran2jWJDfSljHhdRgsXmDGWEr1VT1Ir+9B26lBilnAd0lMAHq3AzpKSMLTXBKfD3ABjnmjvEXrAr+qdTRZ09CPWng7Em4oC8oxXKbikAc5XNXMrDXCwwqAbBkJ8PUw28qoVJo+KrkColoa9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715085350; c=relaxed/simple;
	bh=X4FmVbKa6yjE4CaSOREJV6y9jOcP4uNK45DQ+d3IE3s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GFl3UT/WgJJZ2md9FwBA75a51uSGPvtU89F+Y6nkLspTmwswYVT7Hn/89LeMuwcCdbBmy3h/oYY7gnfaZ2F2n00+E4/V6T8Vc3Me+5iaf8ODhhQS4ey/uTVu0axi/hSxmhe+X4FMPKf6gkA2XweiAavZ6C7kKF5nWGgG4Gw9+Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AoR2YtoX; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715085347; x=1746621347;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=X4FmVbKa6yjE4CaSOREJV6y9jOcP4uNK45DQ+d3IE3s=;
  b=AoR2YtoXo2EMLsQukvihQLlRQBS0Rj020rF2HEG4NAS4jI8hTo0k3kxM
   Jx+SKd/o2t3miThBpcSSM7S6aQu0kH6whvo9hnPP4zMrwKFQyeqmOXMqM
   rmsAj8o/mPzxuD++SWk0oLCOZa7Pbe29QTEqEpml6HHyQrzxEXzGtKBF3
   903AuwEN4P8y5Qh7YTSGCpkxSh9pP8icF9fG0iEAZf3U/csmj31ul7VJf
   N/Rj5tjNn5rJqcWIN8ji/GlCwVxKzfus4wlUlFLVFR0Jz0cveHmPGhQTe
   pEq8C/BXrIcldqO3VGGObEuS4slsV0spxceqDq2brbmXOXwD/FTitbVao
   Q==;
X-CSE-ConnectionGUID: KcPfTmHWRIKddOv0HWW1Og==
X-CSE-MsgGUID: QDjQFDHvRFyIqunb93f+dQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="36257816"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; 
   d="scan'208";a="36257816"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2024 05:35:44 -0700
X-CSE-ConnectionGUID: F+OnXcdQTIqEejs8wz+T4A==
X-CSE-MsgGUID: ERHFetrTTmC+8FKUz1P69g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; 
   d="scan'208";a="28587041"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2024 05:35:41 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id AFC35120574;
	Tue,  7 May 2024 15:35:38 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1s4K2k-003uZF-29;
	Tue, 07 May 2024 15:35:38 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Suren Baghdasaryan <surenb@google.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: [RESEND PATCH v2 1/1] media: intel/ipu6: explicitly include vmalloc.h
Date: Tue,  7 May 2024 15:35:28 +0300
Message-Id: <20240507123528.932421-1-sakari.ailus@linux.intel.com>
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
Fixed Kent's e-mail address.

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


