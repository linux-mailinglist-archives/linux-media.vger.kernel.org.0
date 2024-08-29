Return-Path: <linux-media+bounces-17104-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F619963DF6
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 10:03:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A45C2B2463A
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 08:03:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E266218B49D;
	Thu, 29 Aug 2024 08:02:44 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31B91487D1;
	Thu, 29 Aug 2024 08:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724918564; cv=none; b=oTtm6y2TlHW8LORZnkNvkpzXJNcMkBsLi6hxv+gt8MNauR7zHtsp//kf5yGkbkvFoB7jQ1uIlOWHsQvHXxZD0wSCzPpoFj6X1v7Zmk84hfmyej3amaRFlMbXtKR27o399frXDJ10HejGogCX0FGjKgLH13FGGh6I3nF5waroE/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724918564; c=relaxed/simple;
	bh=cWFIuH5rYthdO3LtjXj0qg58ABE6Da3pWc/Eug8vFeI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sXsOfKlQfJ4ZRxoX31K6oEf9hsIY28AUGsHJWNOf8T8FctencSnfL84tcveEkpdjRZ98JCKdSdr+Uc20CSlRXknQG+x5ZGeFj3HSnbvSx4BAipcxFLaWzCmzXub+Ii3XBH016O3TV99tAWyBPZNnLCEgKoZ9+cGpik8GmSzWQ4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4WvYfQ1JRkz1j7hK;
	Thu, 29 Aug 2024 16:02:22 +0800 (CST)
Received: from dggpemm500020.china.huawei.com (unknown [7.185.36.49])
	by mail.maildlp.com (Postfix) with ESMTPS id 761271400FD;
	Thu, 29 Aug 2024 16:02:34 +0800 (CST)
Received: from huawei.com (10.67.174.77) by dggpemm500020.china.huawei.com
 (7.185.36.49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 29 Aug
 2024 16:02:34 +0800
From: Liao Chen <liaochen4@huawei.com>
To: <linux-tegra@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <hverkuil-cisco@xs4all.nl>, <mchehab@kernel.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <jacopo@jmondi.org>,
	<sakari.ailus@linux.intel.com>, <laurent.pinchart@ideasonboard.com>,
	<biju.das.jz@bp.renesas.com>, <tomi.valkeinen@ideasonboard.com>,
	<liaochen4@huawei.com>
Subject: [PATCH -next 3/3] media: tegra_cec: enable module autoloading
Date: Thu, 29 Aug 2024 07:54:17 +0000
Message-ID: <20240829075417.526459-4-liaochen4@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240829075417.526459-1-liaochen4@huawei.com>
References: <20240829075417.526459-1-liaochen4@huawei.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500020.china.huawei.com (7.185.36.49)

Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded
based on the alias from of_device_id table.

Signed-off-by: Liao Chen <liaochen4@huawei.com>
---
 drivers/media/cec/platform/tegra/tegra_cec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/cec/platform/tegra/tegra_cec.c b/drivers/media/cec/platform/tegra/tegra_cec.c
index 7c1022cee1e8..a199a4158942 100644
--- a/drivers/media/cec/platform/tegra/tegra_cec.c
+++ b/drivers/media/cec/platform/tegra/tegra_cec.c
@@ -458,6 +458,7 @@ static const struct of_device_id tegra_cec_of_match[] = {
 	{ .compatible = "nvidia,tegra210-cec", },
 	{},
 };
+MODULE_DEVICE_TABLE(of, tegra_cec_of_match);
 
 static struct platform_driver tegra_cec_driver = {
 	.driver = {
-- 
2.34.1


