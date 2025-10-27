Return-Path: <linux-media+bounces-45613-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A1AC0BCA5
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 05:49:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08A193BB636
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 04:48:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E94EE2D46B3;
	Mon, 27 Oct 2025 04:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="huK8YFtT"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBC5243367
	for <linux-media@vger.kernel.org>; Mon, 27 Oct 2025 04:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761540521; cv=none; b=pXOGNaSDPYV29yIm1Y2M2tf/Kui7rIb+9R0ykQ7dzofmidx9F2Rg0REvvi259GcHWt6lrdTEMQgTcE/EiOTZUSE3Mx9BYKc7bpBqYJk/DuVDc0aCDV9b7I6t3tvoE8N1P3spo9aNjYi6M/l1Ism0Z2TMtr/N8zXhO4o4uyJksiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761540521; c=relaxed/simple;
	bh=lxFUsUvyr1966bGCJMZqZqmUE971d/cX9NW4srJNETE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m0CIs3xl/JemXd/pgSJmp4D44Flz4WPD1OBFfAtNqHZl9q5vUNC7s7oLpRGJm1kV7i3P/Iji+kd2Amqf4RP25HtM3NSaxHnKV822wbXEe5xRs2AkglQKuN6o3ZGWdnu9rhEPhrIke7BQwnVktoqQHOZUWjwfrCreWo2slDS4lu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=huK8YFtT; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761540520; x=1793076520;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lxFUsUvyr1966bGCJMZqZqmUE971d/cX9NW4srJNETE=;
  b=huK8YFtTQsq6/K9ShyoL6UWxpFzt3zyz7h4fV/OnOACTml/IB1TQyNvx
   t/sXfuH/+8/QMig/3JmKnQO9PlKFgRR4FqkvMpA3qvPvM8qdYLSPzaxNS
   x2YfkXUaFQihQ4j9dM+cFGOtL3yKWpTEM+R3u8jL+TtX8uU2oftaVHpzY
   7Dort6CPXQjbQBl56yhz3RNt7YfgziRHpmZ2ATtHIiH5Yb6em5SjTmtfx
   Rx5PFwoSJ6ol6hJbQmyMUat76FfozhJBxEutNbwdYGwkZjS6QPo3rFbra
   +3Hnhze7oc0QOAMM1c0h3OBd2H4RT78eV/iWJjJlMLIse+cdwr2fW1jEK
   w==;
X-CSE-ConnectionGUID: tL/e2YUTSdm/MmtBQjlEyg==
X-CSE-MsgGUID: WF0JbJLlQ2ujxAlDFh61hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63521068"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="63521068"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2025 21:48:37 -0700
X-CSE-ConnectionGUID: aRLkuwB+QhWyDXjLM6KugQ==
X-CSE-MsgGUID: Eu1wa7rlS/CvUy5lYRXnjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="188992982"
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
Subject: [RFC v2 3/8] dma-buf: Create and expose IOV interconnect to all exporters/importers
Date: Sun, 26 Oct 2025 21:44:15 -0700
Message-ID: <20251027044712.1676175-4-vivek.kasireddy@intel.com>
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

The IOV interconnect is a virtual interconnect between an SRIOV
physical function (PF) and its virtual functions (VFs). In order
for negotiation (or match) to succeed, the exporter is expected
to be a VF while the importer is expected to be the PF.

Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/dma-buf/dma-buf-interconnect.c | 3 +++
 include/linux/dma-buf-interconnect.h   | 7 +++++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/dma-buf/dma-buf-interconnect.c b/drivers/dma-buf/dma-buf-interconnect.c
index 12db77e6b9f1..492e4d3fe4c8 100644
--- a/drivers/dma-buf/dma-buf-interconnect.c
+++ b/drivers/dma-buf/dma-buf-interconnect.c
@@ -159,3 +159,6 @@ bool dma_buf_match_interconnects(struct dma_buf_attachment *attach,
 	return false;
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_match_interconnects, "DMA_BUF");
+
+CREATE_INTERCONNECT(iov)
+EXPORT_SYMBOL_NS_GPL(iov_interconnect, "DMA_BUF");
diff --git a/include/linux/dma-buf-interconnect.h b/include/linux/dma-buf-interconnect.h
index efe3ca1c354a..37dee1a26f24 100644
--- a/include/linux/dma-buf-interconnect.h
+++ b/include/linux/dma-buf-interconnect.h
@@ -20,6 +20,13 @@
 
 struct dma_buf_attachment;
 
+/**
+ * The iov interconnect instance would be created and exported out of
+ * dma-buf-interconnect.c as it is a global interconnect that is expected
+ * to be supported by different exporters and importers.
+ */
+extern const struct dma_buf_interconnect *iov_interconnect;
+
 /**
  * struct dma_buf_interconnect - holds info associated with an interconnect
  * @name: name of the interconnect.
-- 
2.50.1


