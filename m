Return-Path: <linux-media+bounces-44351-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F42BD7D36
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 09:14:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80313189D2CC
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 07:14:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DC7B30E0DC;
	Tue, 14 Oct 2025 07:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z4SBI9A/"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4E230DEB2
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 07:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760426042; cv=none; b=GZ9gYU02tnAgqID9deBX88t94d/wwdbWNj3YylO/wxe3DFj6RSGhNdTMsMGPYMby3k1Lh8Q1+kgHhiqVXw/G9VYIP5FHb21HPjAxVjFxESWgE/GXHgKbcIppa2ORVTJ4+KnOz5fHb0z08DYkyUFTkLkdi5NGSqGX7/+s+xChzV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760426042; c=relaxed/simple;
	bh=yIboQlk5tTaUI55jQ3YOqfrmnwFIGE4cxawB+2dEVu4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IQ1/fCdw+5jfO+7V1G3CkeS1FhNlOK7QkaBQ3baqbM36wtOfsLIfJQAluBc03UGvFVvPNoupIZZB9wjiceY69B5a9Y1nAgI9LhAR9bqjZnlWCe9guy1UIXqGBYDHa0nZkP/f9tasd1m1iQH2M0yl7jcOUCMpFM74W6Wr89MiKYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z4SBI9A/; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760426041; x=1791962041;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yIboQlk5tTaUI55jQ3YOqfrmnwFIGE4cxawB+2dEVu4=;
  b=Z4SBI9A/d6cOSjr05E5zIQDsbTC4dhrzqZpwnMqJcw2Oj2Ojsx2G/Df0
   7BPmpbFs5AdboxsYAMZl8eK6nfUwP2tfueIGffCYZvuwPO7NxgyRi7jep
   dO8JNq+0twbobHTtf262ICdRSxR1VljqqNy3Ka5z/tP3seDFfS364a+pf
   kz8nS/cYt2uAl/PhOqHofgKxyQo9WxY8BRejw6mWvkLNCxt4buc1KshxR
   Ok234p3KdUmHI+GIz95Ncma2r8/vuRFE5tWYxrahI4vH2iw6X6DtWEa1O
   vekXJi1wKO/g/JklJqNaizEpDGU8UWJRxnDa5Lu2NjtM9kzfaoXTPBX0i
   w==;
X-CSE-ConnectionGUID: S8F+HzWdS3mEG3jqgsmtiA==
X-CSE-MsgGUID: 05p1qpxLRly019LPKyPf6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="73257131"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; 
   d="scan'208";a="73257131"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 00:13:57 -0700
X-CSE-ConnectionGUID: Qj9972weSA2T1fz3qDmX2A==
X-CSE-MsgGUID: HUAh1kp1Sk2NRbxj6t2KWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; 
   d="scan'208";a="181369866"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 00:13:57 -0700
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
Subject: [RFC 5/8] drm/xe/dma_buf: Add support for IOV interconnect
Date: Tue, 14 Oct 2025 00:08:55 -0700
Message-ID: <20251014071243.811884-6-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251014071243.811884-1-vivek.kasireddy@intel.com>
References: <20251014071243.811884-1-vivek.kasireddy@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Provide an op for supports_interconnects() to indicate to the
dma-buf core and to the exporter that Xe supports interconnects.
Note that Xe would support IOV interconnect only if the buffer
is located in LMEM region.

Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/gpu/drm/xe/xe_dma_buf.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index a7d67725c3ee..2d63dd86a249 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -13,6 +13,7 @@
 #include <drm/drm_prime.h>
 #include <drm/ttm/ttm_tt.h>
 
+#include "regs/xe_bars.h"
 #include "tests/xe_test.h"
 #include "xe_bo.h"
 #include "xe_device.h"
@@ -274,9 +275,25 @@ static void xe_dma_buf_move_notify(struct dma_buf_attachment *attach)
 	XE_WARN_ON(xe_bo_evict(bo, exec));
 }
 
+static bool
+xe_dma_buf_supports_interconnects(struct dma_buf_attachment *attach,
+				  const struct dma_buf_interconnect_match *exp,
+				  unsigned int exp_ics)
+{
+	struct pci_dev *pdev = to_pci_dev(attach->dev);
+	unsigned int bar = LMEM_BAR;
+	const struct dma_buf_interconnect_match supports_ics[] = {
+		CREATE_IOV_INTERCONNECT(pdev, bar),
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


