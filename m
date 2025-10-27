Return-Path: <linux-media+bounces-45615-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CDDC0BC9C
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 05:49:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 974CF4E55E0
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 04:48:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ACC92D6603;
	Mon, 27 Oct 2025 04:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CQ/e9nRo"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58AAF24C077
	for <linux-media@vger.kernel.org>; Mon, 27 Oct 2025 04:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761540523; cv=none; b=TXyKea+5SO8vp49yBGiB9SLASdSkM7rdr384NeHFbfl4r2L9Dryh6uVtAWQTdPpUSQq78Td8zaFaPRGxHFQCvgbkY4ll5rAozEEtuE0G8Ajf93hHkGr22JWngW+XuVseQ/lX1NOv7aO3sIo1V+L0IYy684iUKXbM53oiRiV5FXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761540523; c=relaxed/simple;
	bh=CvW8mMopgiskI6nzqkjC/nTU7/cwciLyHgd8H3wgFT4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y3yrCEA88ctONSA4WtVek8myXcFYtwYfMtjXdGPt4YECZ3BrfBoS7nTK7mmNCayLhRP6qnl4DUIPDZrd++gNoKwOAFXeydJp8zA7KelAlyQNAJxgozKhFcp/F42Yj3uYkwoEkRWyeXevEE8wyzDdzEJ86JHWIO6uPPW8yChcFSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CQ/e9nRo; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761540521; x=1793076521;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CvW8mMopgiskI6nzqkjC/nTU7/cwciLyHgd8H3wgFT4=;
  b=CQ/e9nRoZBers4QRMpoYyXlpFa24vir2Cc31NV08S85roKLl/SYzYNd/
   8hDq1qhSYEwd/Hbfg3Bp+41Ll/p49+FATzzywBFE1MEIej3j1WiYp1p3A
   0omKIBOFYMbtk5X8K95NQekhxRUBLY+tPvSrNDdHNi3eWTTvq+kKGlp5z
   8dRvSZapgkVkCl31WlVdiQmjmpwVhUFlpy1llhRMwalCIjQyPN6MBog0k
   jNCzLFpLFSu8SQ8gV34D977eFDN30kA8xmN2tF+fI0OFKhqo5n6Bqtntd
   eZoBVKJQ2XdJnhInvR63+gOuV929MbTWkc7aQJueWO9+V4vJQhxD3a/QO
   A==;
X-CSE-ConnectionGUID: e/64WfZQRcevlnIBnEzRtQ==
X-CSE-MsgGUID: zG8CE+EqRTKBH0VI5mwjuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63521070"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="63521070"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2025 21:48:37 -0700
X-CSE-ConnectionGUID: dfCdQDeUSoSv6/ji/OIq3Q==
X-CSE-MsgGUID: pIZwa8pPTX+bPw3NeLngRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="188992989"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2025 21:48:37 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Christian Koenig <christian.koenig@amd.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Simona Vetter <simona.vetter@ffwll.ch>
Subject: [RFC v2 5/8] drm/xe/dma_buf: Add support for IOV interconnect
Date: Sun, 26 Oct 2025 21:44:17 -0700
Message-ID: <20251027044712.1676175-6-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251027044712.1676175-1-vivek.kasireddy@intel.com>
References: <20251027044712.1676175-1-vivek.kasireddy@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Provide a callback for supports_interconnects() to indicate to
the dma-buf core and to the exporter that Xe supports interconnects.
Note that Xe would support IOV interconnect only if the buffer
is located in VRAM region.

Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/gpu/drm/xe/xe_dma_buf.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index a7d67725c3ee..4a1aa47efbc6 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -13,6 +13,7 @@
 #include <drm/drm_prime.h>
 #include <drm/ttm/ttm_tt.h>
 
+#include "regs/xe_bars.h"
 #include "tests/xe_test.h"
 #include "xe_bo.h"
 #include "xe_device.h"
@@ -274,9 +275,23 @@ static void xe_dma_buf_move_notify(struct dma_buf_attachment *attach)
 	XE_WARN_ON(xe_bo_evict(bo, exec));
 }
 
+static bool
+xe_dma_buf_supports_interconnects(struct dma_buf_attachment *attach,
+				  const struct dma_buf_interconnect_match *exp,
+				  unsigned int exp_ics)
+{
+	const struct dma_buf_interconnect_match supports_ics[] = {
+		MATCH_INTERCONNECT(iov_interconnect, attach->dev, LMEM_BAR),
+	};
+
+	return dma_buf_match_interconnects(attach, exp, exp_ics, supports_ics,
+					   ARRAY_SIZE(supports_ics));
+}
+
 static const struct dma_buf_attach_ops xe_dma_buf_attach_ops = {
 	.allow_peer2peer = true,
-	.move_notify = xe_dma_buf_move_notify
+	.move_notify = xe_dma_buf_move_notify,
+	.supports_interconnects = xe_dma_buf_supports_interconnects,
 };
 
 #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
-- 
2.50.1


