Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00FF927DEAB
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 05:00:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729893AbgI3DAF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Sep 2020 23:00:05 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:17439 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729446AbgI3DAE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Sep 2020 23:00:04 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f73f4810003>; Tue, 29 Sep 2020 19:59:13 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 30 Sep
 2020 03:00:03 +0000
Received: from skomatineni-linux.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Wed, 30 Sep 2020 03:00:03 +0000
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <hverkuil@xs4all.nl>
CC:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>
Subject: [PATCH v1 2/2] media: tegra-video: Allow building driver with COMPILE_TEST
Date:   Tue, 29 Sep 2020 20:02:38 -0700
Message-ID: <1601434958-29305-3-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601434958-29305-1-git-send-email-skomatineni@nvidia.com>
References: <1601434958-29305-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1601434753; bh=RD5IGLamIRzBFGWZGbcF8S5HN/ZOzfAoz/rvE33ZEiI=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:X-NVConfidentiality:MIME-Version:Content-Type;
        b=WIWKKm0s6GXpJRZe/4Qvza4W+59HdSWQhxqc/0bXuQ3D5ZCjh6R5KL9hvHy5kmsK8
         zyXdAKffuBFPnTSDtD7j/BAcoEWa3lv0K8a/4hOAWjzq3h9AEKXJY89JAHdyjDJhsS
         YPkiytclfN4h/DNLGs9HjgaVctAyx8xGcxUkWIvNlyFzTJT9Fqmq81yBdpdm1vGoOZ
         qeSEkEqpHXo+uHG8MwW7rhnu0PwB+u14+uO8JOwc2WGjS8h7CufCOxdj+F6wMYfdVe
         2hd2KoapNOKiaCbaB0qaPYuC+muoigzzsuXDOprEf80vqtGw32jbNswbwPCJ6th0D9
         oAnq4ky6+Hv8Q==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds COMPILE_TEST option to Kconfig to allow building
it with COMPILE_TEST option.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/staging/media/tegra-video/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-video/Kconfig b/drivers/staging/media/tegra-video/Kconfig
index 1f35da4..3e03ddd 100644
--- a/drivers/staging/media/tegra-video/Kconfig
+++ b/drivers/staging/media/tegra-video/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config VIDEO_TEGRA
 	tristate "NVIDIA Tegra VI driver"
-	depends on TEGRA_HOST1X
+	depends on TEGRA_HOST1X || COMPILE_TEST
 	depends on VIDEO_V4L2
 	select MEDIA_CONTROLLER
 	select VIDEOBUF2_DMA_CONTIG
-- 
2.7.4

