Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BF0923B267
	for <lists+linux-media@lfdr.de>; Tue,  4 Aug 2020 03:42:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729524AbgHDBmA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Aug 2020 21:42:00 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:48072 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729412AbgHDBmA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 3 Aug 2020 21:42:00 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 1E7E65B8571CDFA4E6EB;
        Tue,  4 Aug 2020 09:41:57 +0800 (CST)
Received: from localhost (10.174.179.108) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.487.0; Tue, 4 Aug 2020
 09:41:50 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <digetx@gmail.com>, <mchehab@kernel.org>,
        <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <hverkuil-cisco@xs4all.nl>
CC:     <linux-media@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <devel@driverdev.osuosl.org>, <linux-kernel@vger.kernel.org>,
        YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH v2 -next] media: staging: tegra-vde: Mark tegra_vde_runtime_suspend/resume as __maybe_unused
Date:   Tue, 4 Aug 2020 09:41:37 +0800
Message-ID: <20200804014137.45444-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
In-Reply-To: <20200803115901.44068-1-yuehaibing@huawei.com>
References: <20200803115901.44068-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.179.108]
X-CFilter-Loop: Reflected
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If CONFIG_PM is not set, gcc warns:

drivers/staging/media/tegra-vde/vde.c:916:12:
 warning: 'tegra_vde_runtime_suspend' defined but not used [-Wunused-function]

Make it __maybe_unused to fix this.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
v2: both suspend and resume functions marked
---
 drivers/staging/media/tegra-vde/vde.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/tegra-vde/vde.c b/drivers/staging/media/tegra-vde/vde.c
index a3c24d96d5b9..28845b5bafaf 100644
--- a/drivers/staging/media/tegra-vde/vde.c
+++ b/drivers/staging/media/tegra-vde/vde.c
@@ -913,7 +913,7 @@ static irqreturn_t tegra_vde_isr(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static int tegra_vde_runtime_suspend(struct device *dev)
+static __maybe_unused int tegra_vde_runtime_suspend(struct device *dev)
 {
 	struct tegra_vde *vde = dev_get_drvdata(dev);
 	int err;
@@ -929,7 +929,7 @@ static int tegra_vde_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int tegra_vde_runtime_resume(struct device *dev)
+static __maybe_unused int tegra_vde_runtime_resume(struct device *dev)
 {
 	struct tegra_vde *vde = dev_get_drvdata(dev);
 	int err;
-- 
2.17.1


