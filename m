Return-Path: <linux-media+bounces-17312-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0669F967D97
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 03:52:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1BF141C21B6F
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 01:52:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0D9544384;
	Mon,  2 Sep 2024 01:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AyLh5Ijb"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E539843155;
	Mon,  2 Sep 2024 01:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725241883; cv=none; b=gxEln8fOPQZzJXGWg8MtYnSkCXZPoC1THPgYsUqxgGJjF1uKuFq3+RWRXvFVzVkT/SvpAqor23JYqy19K9Cmw3eb+w4nYhRXtpql4kq3uEJkVd2Ruu4QTI3A28ty4kHqjg4tQygpW6JkV9OCyg+0rIPSfSdF7Xy5V3WuI7sGXd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725241883; c=relaxed/simple;
	bh=eNOviPAyOZhMOAzv2QCrEMyisdMbFcDCq2iEBrdz3QQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gaFxIkaG7V/C5qbcDxpyWn/8WwTmYAzgkMuJZMcdVj04S9YqnID+TQks7JI6v+vOWbiTQnSZcT9VTplmaprMqbKGYX61tX10h5FSbQMjgJSTPSOJAAEhFdv03WcQbBCODpaVHJUSKbBhQKY0OcNZTSoCPIb8P+Kaf+orhAbynrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AyLh5Ijb; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725241882; x=1756777882;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eNOviPAyOZhMOAzv2QCrEMyisdMbFcDCq2iEBrdz3QQ=;
  b=AyLh5Ijb7GkRHzQ86SsD9TT/XumemhyIz3aEjEiZrVjhA0SQiC7IvJxY
   7XE/RAAeEQeJu/0POss1L6zUTh9hG+IPGLLgObU47j+t73wNhmZSA3l8b
   xirMS5jf6+Tqyj4GemKhQtwLEved+80mdCqmO5hJT/BRNqsw7v01eEIVl
   U3l+1oQt3kJKh3/kMG/uDIHGdjk9kvqFgxkxdUsP9RobJItoeNAJB6jSj
   2Fm2J5uHpfWi3VXh+0MkmE7OBD8G0SEWucSpOEtmeB8oAnJUrPjT4NFkn
   a6DZ4fwYbYmhUXU7SbzIzfOyCEw0F4cj9IasZfHzMO8B8qMqvPhLHT4Qd
   w==;
X-CSE-ConnectionGUID: uq+0KWoaR3GltarrjmqOLA==
X-CSE-MsgGUID: pKd8mdcDSNeW6OGTHjx9uQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="41307710"
X-IronPort-AV: E=Sophos;i="6.10,194,1719903600"; 
   d="scan'208";a="41307710"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2024 18:51:21 -0700
X-CSE-ConnectionGUID: 29OEIk5/RfmpO23cXnBNZA==
X-CSE-MsgGUID: ON9C07fzS3iCg+btlHUEUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,194,1719903600"; 
   d="scan'208";a="64817693"
Received: from allen-box.sh.intel.com ([10.239.159.127])
  by orviesa006.jf.intel.com with ESMTP; 01 Sep 2024 18:51:15 -0700
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
Subject: [PATCH v2 3/3] drm/tegra: Use iommu_paging_domain_alloc()
Date: Mon,  2 Sep 2024 09:47:00 +0800
Message-Id: <20240902014700.66095-4-baolu.lu@linux.intel.com>
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

Commit <17de3f5fdd35> ("iommu: Retire bus ops") removes iommu ops from
the bus structure. The iommu subsystem no longer relies on bus for
operations. So iommu_domain_alloc() interface is no longer relevant.

Replace iommu_domain_alloc() with iommu_paging_domain_alloc() which takes
the physical device from which the host1x_device virtual device was
instantiated. This physical device is a common parent to all physical
devices that are part of the virtual device.

Suggested-by: Thierry Reding <thierry.reding@gmail.com>
Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/gpu/drm/tegra/drm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 03d1c76aec2d..d79c76a287f2 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -1135,6 +1135,7 @@ static bool host1x_drm_wants_iommu(struct host1x_device *dev)
 
 static int host1x_drm_probe(struct host1x_device *dev)
 {
+	struct device *dma_dev = dev->dev.parent;
 	struct tegra_drm *tegra;
 	struct drm_device *drm;
 	int err;
@@ -1149,8 +1150,8 @@ static int host1x_drm_probe(struct host1x_device *dev)
 		goto put;
 	}
 
-	if (host1x_drm_wants_iommu(dev) && iommu_present(&platform_bus_type)) {
-		tegra->domain = iommu_domain_alloc(&platform_bus_type);
+	if (host1x_drm_wants_iommu(dev) && device_iommu_mapped(dma_dev)) {
+		tegra->domain = iommu_paging_domain_alloc(dma_dev);
 		if (!tegra->domain) {
 			err = -ENOMEM;
 			goto free;
-- 
2.34.1


