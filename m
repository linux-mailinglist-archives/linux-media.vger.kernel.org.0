Return-Path: <linux-media+bounces-16117-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB1794E7B0
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 09:24:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EACAC1C219C7
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 07:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B68DB15854C;
	Mon, 12 Aug 2024 07:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gQtN6a5g"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2AA05FBB7;
	Mon, 12 Aug 2024 07:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723447483; cv=none; b=WLu2EXvnMp3vUgQY4jIyHdJs0ASdk3cG5yP6DjtZca80UDqW1qsIYhSzuHKT8WY3yMEChVmD/H43ZpPGsdnORRxceaKIfvDr6bNBqgrE6UHUctlV/AJ2eq7t0WxOoPpGLCjbv73zQJQ9mtUz/L38f1APXm5HLz4lBFdO1JThzFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723447483; c=relaxed/simple;
	bh=Nxe5+R4C9sbMphvd/xbGCajCmYTCQpi3ZSS8JEnsuAI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=URfjlvgEay4MMb8ixgrikkOJezlU4pFT9OS9KDIHMQtC2GIp/r2d0YoZOODO/SpvBo3YNmvrxIB2HwcFHDy96a1Ybbe+mIq2FhfBMK7JjBHl2L0xKinP3Y8noLA4j5Rqz6XJlttT6GgGB2jPHs9Lq16sZQJNKOc6j+6Lt7738j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gQtN6a5g; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723447481; x=1754983481;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Nxe5+R4C9sbMphvd/xbGCajCmYTCQpi3ZSS8JEnsuAI=;
  b=gQtN6a5gcUrvHH7hZV4xMNh2yYLEPzWIvBrWmsmmDWyeQM9CcI4oLNNh
   EUy1Vx7Ynl4mcGtLt0hcBnq45aAaaI9NOfqAz9ap3DBNk9cmFRnuNFeAT
   U8/iPWo3Ov43T0EfKHeO2102Ks/vcC42FaUf16ZzDfrMDqL3qq/mLaKtS
   aMO56TF/hGN9l+Qww8vMHTxfWvhl/q5LGMTYDUvNxb9O6aSbojmfaqOz0
   Ki+0WRQU01c4BF/nEBlFDQMijmVgRpOgSzqrFlESvVkwcFTe7lIadeHd8
   I8aehE9yCZF1Qi8lcduxkThMCSsUWdQhSJLS/U0YcusO5mdKyhRyUhqXf
   w==;
X-CSE-ConnectionGUID: LN0ynw7LSgqGXUxaMPhq+A==
X-CSE-MsgGUID: TcAFAWzeQ6qNo55VMf8sMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="32691580"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="32691580"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 00:24:40 -0700
X-CSE-ConnectionGUID: NDAypZJySrCq1DeB69dwKQ==
X-CSE-MsgGUID: yqQutkRQTxKtBPosJ8D5Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="62829617"
Received: from allen-box.sh.intel.com ([10.239.159.127])
  by fmviesa004.fm.intel.com with ESMTP; 12 Aug 2024 00:24:35 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Dmitry Osipenko <digetx@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Kevin Tian <kevin.tian@intel.com>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH 1/2] media: nvidia: tegra: Use iommu_paging_domain_alloc()
Date: Mon, 12 Aug 2024 15:21:04 +0800
Message-Id: <20240812072105.9578-1-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An iommu domain is allocated in tegra_vde_iommu_init() and is attached to
vde->dev. Use iommu_paging_domain_alloc() to make it explicit.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Link: https://lore.kernel.org/r/20240610085555.88197-9-baolu.lu@linux.intel.com
---
 drivers/media/platform/nvidia/tegra-vde/iommu.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/nvidia/tegra-vde/iommu.c b/drivers/media/platform/nvidia/tegra-vde/iommu.c
index 5521ed3e465f..b1d9d841d944 100644
--- a/drivers/media/platform/nvidia/tegra-vde/iommu.c
+++ b/drivers/media/platform/nvidia/tegra-vde/iommu.c
@@ -78,9 +78,10 @@ int tegra_vde_iommu_init(struct tegra_vde *vde)
 		arm_iommu_release_mapping(mapping);
 	}
 #endif
-	vde->domain = iommu_domain_alloc(&platform_bus_type);
-	if (!vde->domain) {
-		err = -ENOMEM;
+	vde->domain = iommu_paging_domain_alloc(dev);
+	if (IS_ERR(vde->domain)) {
+		err = PTR_ERR(vde->domain);
+		vde->domain = NULL;
 		goto put_group;
 	}
 
-- 
2.34.1


