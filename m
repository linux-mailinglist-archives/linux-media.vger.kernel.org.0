Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1D0727DEAD
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 05:00:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729872AbgI3DAF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Sep 2020 23:00:05 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:6412 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729584AbgI3DAE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Sep 2020 23:00:04 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f73f4a70001>; Tue, 29 Sep 2020 19:59:51 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 30 Sep
 2020 03:00:03 +0000
Received: from skomatineni-linux.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Wed, 30 Sep 2020 03:00:03 +0000
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <hverkuil@xs4all.nl>
CC:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>
Subject: [PATCH v1 1/2] gpu: host1x: Allow COMPILE_TEST to build host1x driver on all platforms
Date:   Tue, 29 Sep 2020 20:02:37 -0700
Message-ID: <1601434958-29305-2-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601434958-29305-1-git-send-email-skomatineni@nvidia.com>
References: <1601434958-29305-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1601434791; bh=2/xsJYI5lUFxri66cuO73ouMuuUJNA6BZNctYiOI3y4=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:X-NVConfidentiality:MIME-Version:Content-Type;
        b=eUxlYNhlygqYxU4DCR5PAB2gH+17v93A03yhI76YBQOTFXqQ85AVUhAwi6ekr9Roi
         bm55I/3NjL7TGLNDU1eBupQY9UAreW9j17GkXz4KaPcpocOUzT1x0Bib9LKY/YGOY8
         wH8STRidbvSIdNKFnE2V3u7D0V/vzkCfvlgFHdt7ChWT2YoH6csjkVlL0m2mncpq1x
         KkcMsW3sJcMh9EF1LVWV9FNbhAdcXiERo+UlxUoBbnjbVUin5B1uaBl3tmc4ODsIlL
         N87qhh4dGjCv0tegI+J20h4G7XbstSn9zkeSi4YdPL4N53GrPm5ap5teU+QtGVJZ3e
         vrlZhJbJy0H7A==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Tegra V4L2 driver has dependency on this host1x driver and currently
host1x driver is allowed to build with COMPILE_TEST only on ARM and
this also limits Tegra V4L2 driver building.

So, this patch allows building host1x driver with COMPILE_TEST on
all platforms.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/gpu/host1x/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/host1x/Kconfig b/drivers/gpu/host1x/Kconfig
index 6dab94a..977a0ac 100644
--- a/drivers/gpu/host1x/Kconfig
+++ b/drivers/gpu/host1x/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config TEGRA_HOST1X
 	tristate "NVIDIA Tegra host1x driver"
-	depends on ARCH_TEGRA || (ARM && COMPILE_TEST)
+	depends on ARCH_TEGRA || COMPILE_TEST
 	select IOMMU_IOVA
 	help
 	  Driver for the NVIDIA Tegra host1x hardware.
-- 
2.7.4

