Return-Path: <linux-media+bounces-16114-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5DD94E787
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 09:14:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BA1E51F23193
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 07:14:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF1C91547E2;
	Mon, 12 Aug 2024 07:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R56Zd5iG"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD82514C5BA;
	Mon, 12 Aug 2024 07:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723446854; cv=none; b=tczw5ZT99zaEdfS2l9xrA1oEl4EcPvN09x4XBmBAHpSLxnM6x9+wL6fBUkRbfBlWZGYauEstQHmieSvim3TqFMC8I+qpCB0BuPZNLpOev2YeQcn3Uet83Z5uhISDN1m+L8d9ESp2UNP1qjvQCArn5fPYJvD0sx8TeDyOkEJaI6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723446854; c=relaxed/simple;
	bh=2W/be8VISRZC7fVoJ9VGu3iMrIsNaD0YF4i34a1dFE4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Hi1jiEp482Y8fczYkru+oS53uT45E9M0clsiPrzeHgcB9Zv9Md52v8KcEGcC5NUFvM0loIA9M14dYhijbEQdfz82dS3/jBF+BVbin9VM/6l7vkgDHyaZwpp4pPfeuBmM3K/0inovoLjBYCXRHdPI4Nx7KT5B2UOB1VYLbasMIQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R56Zd5iG; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723446853; x=1754982853;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2W/be8VISRZC7fVoJ9VGu3iMrIsNaD0YF4i34a1dFE4=;
  b=R56Zd5iGKYcoDTzZpVbxZJRuAhRSHaMpGDDN01Na6WgPSaRoYAPmvlQZ
   hp1gmqFluhh4EgSio8eXNYSy0eViq1dCJVVZtI1/nRcdgSCj0PI7nxfSx
   OWGm8F0FXJ75cFLdtgPYzAYBFMqpA/tchRfDGGFrFFZnNVbUz8ls+SYqj
   F3k/pLWMgXCUgMAqF3i9p9nNTl8LM+NcK7daxTQVcmjceXMF6sFe8LzQT
   DClw8M4qlW6sWjY8xiy9fsyf2HuvMym+CdxLsX3I5fQsVCwq1jdzO2285
   RWUtZRlRu1z5bbCRpTIKQSMYYPGiw7YGyujqKBTzZzbFK/t6NsBil4tY4
   A==;
X-CSE-ConnectionGUID: BrTaaed6Sm6RLhOkk3hKHA==
X-CSE-MsgGUID: 4oz61V0CSPK3EtY/FlRQ3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="21711537"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="21711537"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 00:14:11 -0700
X-CSE-ConnectionGUID: OLEmc47wRB6veAq2mjcdLw==
X-CSE-MsgGUID: r/FxCR4NT760l1EVOg/r5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="57823793"
Received: from allen-box.sh.intel.com ([10.239.159.127])
  by fmviesa007.fm.intel.com with ESMTP; 12 Aug 2024 00:14:06 -0700
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
Subject: [PATCH 1/3] drm/nouveau/tegra: Use iommu_paging_domain_alloc()
Date: Mon, 12 Aug 2024 15:10:32 +0800
Message-Id: <20240812071034.9443-1-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
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
Link: https://lore.kernel.org/r/20240610085555.88197-7-baolu.lu@linux.intel.com
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


