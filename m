Return-Path: <linux-media+bounces-44352-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1E0BD7D3C
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 09:14:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8EC11189D3C8
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 07:14:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E8D030DEB0;
	Tue, 14 Oct 2025 07:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e6deUxwb"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5945130DEBD
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 07:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760426043; cv=none; b=lP7+dpRURHEr4I7G5+F2Em1lRCYobsm7O3kzYzrhXiIKQClqDNc1UEvOvNl8gXtQpY3Pg5ae+e9jYbdUQ3qgXTYr1uBU9kX/3q9LhNkLK32aZvZ8Um2qHVJTFPwL6FU7q/vComZ9mZ5A8UC8TE3r5CFT9jLZP7DDHt6vzPibAAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760426043; c=relaxed/simple;
	bh=5ieEvSJqbDmNfjTwrrLAWK98z4h+TuffhyYkWmricG8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fJt+t4szT+ewRTMAJ7gabpwVoQhqbCYYd7Gg2RO8rX90j7TDmqx2rHUYFXJAND3Jw8dSoIk0krOBljYKW3/v/0vM0JCY80DZ0ICrLS46G5ni2nIEX2pO6L4Osm4BcD/z2H8Fyb3tkEI9tMpFr2aqXEGlg1jyYShxKg6eqexni2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e6deUxwb; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760426041; x=1791962041;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5ieEvSJqbDmNfjTwrrLAWK98z4h+TuffhyYkWmricG8=;
  b=e6deUxwbg5nBpCj38PfPxKN+66ACuI7txDUMvPXYZEGLqzW25M+nVedN
   0JhM4TQOP7fcPQMDWBg8dvX/XG4bzWFcx/PVT3POmCmPbY4h4ZB+z/0yh
   LreQbycQ05KqJI7WiuTUXIVHpEjy4+XDfr4U2TU6tu7e6kj4ujAwOO4dz
   lqbBuUUxLEBM6RT3FdF22Xs/XQFSc4bfBGTo3xXgv3opua4HzJUx2sTwr
   OrFNPiFhm7fBJ62t/f1IHVH7NFq3FT9L+VxLLb5clhX4UyFegrJRIMzvE
   GLeU/BYd5N4glrSVw8orsn6h11indctwq8YCDBXqo1mExNIXfN6WI7sf3
   g==;
X-CSE-ConnectionGUID: g7s2kq9/QC62t0JGv9RtdA==
X-CSE-MsgGUID: WLLBCE7fT5WgydowYzIOtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="73257142"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; 
   d="scan'208";a="73257142"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 00:13:58 -0700
X-CSE-ConnectionGUID: xnweO6cwRoGzNDVsuvCsww==
X-CSE-MsgGUID: lSI1OuOZTWyCtTPEuj01Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; 
   d="scan'208";a="181369859"
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
Subject: [RFC 3/8] dma-buf: Add support for IOV interconnect
Date: Tue, 14 Oct 2025 00:08:53 -0700
Message-ID: <20251014071243.811884-4-vivek.kasireddy@intel.com>
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
 include/linux/dma-buf-interconnect.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/linux/dma-buf-interconnect.h b/include/linux/dma-buf-interconnect.h
index a72f65ed4806..b569dcab86ce 100644
--- a/include/linux/dma-buf-interconnect.h
+++ b/include/linux/dma-buf-interconnect.h
@@ -3,8 +3,17 @@
 #ifndef __DMA_BUF_INTERCONNECT_H__
 #define __DMA_BUF_INTERCONNECT_H__
 
+#include <linux/pci.h>
 #include <linux/xarray.h>
 
+#define CREATE_IOV_INTERCONNECT(pdev, bar) {		\
+	&(const struct dma_buf_iov_interconnect) {	\
+		.base.type = DMA_BUF_INTERCONNECT_IOV,	\
+		.pdev = (pdev),				\
+		.bar = (bar),				\
+	}.base						\
+}
+
 struct dma_buf_attachment;
 
 struct dma_buf_ranges {
@@ -14,6 +23,7 @@ struct dma_buf_ranges {
 
 enum dma_buf_interconnect_type {
 	DMA_BUF_INTERCONNECT_NONE = 0,
+	DMA_BUF_INTERCONNECT_IOV,
 };
 
 struct dma_buf_interconnect {
@@ -24,6 +34,12 @@ struct dma_buf_interconnect_match {
 	const struct dma_buf_interconnect *interconnect;
 };
 
+struct dma_buf_iov_interconnect {
+	struct dma_buf_interconnect base;
+	struct pci_dev *pdev;
+	unsigned int bar;
+};
+
 struct dma_buf_interconnect_ops {
 	int (*map_interconnect)(struct dma_buf_attachment *attach,
 				struct dma_buf_ranges *ranges);
-- 
2.50.1


