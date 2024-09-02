Return-Path: <linux-media+bounces-17310-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4953B967D8F
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 03:51:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 005421F21FA8
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 01:51:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A6802D638;
	Mon,  2 Sep 2024 01:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hf2Qp0ic"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3FB20B0F;
	Mon,  2 Sep 2024 01:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725241870; cv=none; b=VfyCJ+pwpKN6Fgw0XL3aJSnnRZpJ7dADbIQfdzi0y+VSCz692xWMH6WII8vnmVq4dycRf1AwMt6jAinIOwM6admv5NkxV3n+5hDK2OBD+9VRAOVdxSxtQn4rPyANGYPxME1mFm8HI/dMI++ZiQ6J7TtxSPemWKDAJS9073B5kXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725241870; c=relaxed/simple;
	bh=GbpYXxZBS+r4Y0EiK3BFmXVZKaFfLeJ2IAlI0t0Upno=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PpeJvWZUdvtJoFbW1qRot+L5mnF53m/d+tY9gas29eQAz1l8cTrqIJGyBfMypt8Nv4fawTeW0dbnXlTQV90mvijnb+vL0j0EUuA7IuKhzBeYWKIEPC6P7y1KBnUvWYf77NBmwL6a4q2+q/MyvhyBpKIBBaZTLHgF3F7BPCXJzIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hf2Qp0ic; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725241868; x=1756777868;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GbpYXxZBS+r4Y0EiK3BFmXVZKaFfLeJ2IAlI0t0Upno=;
  b=hf2Qp0ichCOfBGXIdRA6b50c934tMWiBcJzp0/le5HlfxQGVbw/mS2Gc
   267fb3n374cvunbd3uUrryv5oB5OOJfRnwpZMCvIhgcpqk8rX0xVmLH4F
   xbyNzgkbwQgm0Q7wx+fA1H8LTnOY0VuiPbDZOS0+A/jEyP4SvCN5Gd2m5
   M1u0VN+M/X7+aQU70aIsDAciH4e2ojXC99ft9MvBwQtoGswvrwy9+a7/s
   JmNp1lkNLK88lcbxQBznoPtX6fML9iy4EKDbxeTm9OblCKxv40+dw+APL
   PNbIfYrWq7fv1t1nPXnLWd+Y8sTW2z77NRI6yIoo56RHhzuhx0tmfPYaZ
   w==;
X-CSE-ConnectionGUID: ugvfHC2qQAGe3Vc4HgaVkw==
X-CSE-MsgGUID: z2F8aLdkRHeb3+uiAA7KDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="41307666"
X-IronPort-AV: E=Sophos;i="6.10,194,1719903600"; 
   d="scan'208";a="41307666"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2024 18:51:08 -0700
X-CSE-ConnectionGUID: ZzqqnVAJSDev//9APFczuA==
X-CSE-MsgGUID: afJR3rigT1S94bedyrPJ5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,194,1719903600"; 
   d="scan'208";a="64817644"
Received: from allen-box.sh.intel.com ([10.239.159.127])
  by orviesa006.jf.intel.com with ESMTP; 01 Sep 2024 18:51:01 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Karol Herbst <kherbst@redhat.com>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@redhat.com>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sandy Huang <hjc@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Kevin Tian <kevin.tian@intel.com>
Cc: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-media@vger.kernel.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Lu Baolu <baolu.lu@linux.intel.com>
Subject: [PATCH v2 1/3] drm/nouveau/tegra: Use iommu_paging_domain_alloc()
Date: Mon,  2 Sep 2024 09:46:58 +0800
Message-Id: <20240902014700.66095-2-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240902014700.66095-1-baolu.lu@linux.intel.com>
References: <20240902014700.66095-1-baolu.lu@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In nvkm_device_tegra_probe_iommu(), a paging domain is allocated for @dev
and attached to it on success. Use iommu_paging_domain_alloc() to make it
explicit.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
index 87caa4a72921..763c4c2925f9 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
@@ -120,8 +120,8 @@ nvkm_device_tegra_probe_iommu(struct nvkm_device_tegra *tdev)
 	mutex_init(&tdev->iommu.mutex);
 
 	if (device_iommu_mapped(dev)) {
-		tdev->iommu.domain = iommu_domain_alloc(&platform_bus_type);
-		if (!tdev->iommu.domain)
+		tdev->iommu.domain = iommu_paging_domain_alloc(dev);
+		if (IS_ERR(tdev->iommu.domain))
 			goto error;
 
 		/*
-- 
2.34.1


