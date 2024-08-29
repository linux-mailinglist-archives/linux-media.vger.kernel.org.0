Return-Path: <linux-media+bounces-17103-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0257A963DF3
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 10:03:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A078A1F256AE
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 08:03:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EE7418A6A1;
	Thu, 29 Aug 2024 08:02:40 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95AA41898EF;
	Thu, 29 Aug 2024 08:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724918559; cv=none; b=SvdNfZycqzxwf8bXukB/OZe3bz5Q5Z5D0pP+eNpJGLb09YsHs5ox0XK3CA6btenmAfEnTTiYiAaGm75s7PnL6TeoZsuygzfYYt4bvOKSYZZcDmOOJ3Sx6ynlxYdEWaukYm5TQL19TUWYqhZcsBCHWeaqeMuctLMmTpCmCxisN4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724918559; c=relaxed/simple;
	bh=l9YzcTluWnyeo4Za02PGyrMtdfupQo7HUxXCCZfea3k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J/XPBKd3PSgs0mxkotxnNuvmZbLN128f6gbtgKtds170C/ukGjQqNGb6zNRj6pGfprWp2otlSChpEGCjT+N4pNsPqGsyBQ8HXKbeWFQh2cMELDWnkx/tM22LWRIqrgrbPinGIxYxeVoEWviFF1+qvK9GYQ8yuQ+iRRPK7M4a/A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4WvYcF6t54zfbVg;
	Thu, 29 Aug 2024 16:00:29 +0800 (CST)
Received: from dggpemm500020.china.huawei.com (unknown [7.185.36.49])
	by mail.maildlp.com (Postfix) with ESMTPS id 4977E18010A;
	Thu, 29 Aug 2024 16:02:34 +0800 (CST)
Received: from huawei.com (10.67.174.77) by dggpemm500020.china.huawei.com
 (7.185.36.49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 29 Aug
 2024 16:02:33 +0800
From: Liao Chen <liaochen4@huawei.com>
To: <linux-tegra@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <hverkuil-cisco@xs4all.nl>, <mchehab@kernel.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <jacopo@jmondi.org>,
	<sakari.ailus@linux.intel.com>, <laurent.pinchart@ideasonboard.com>,
	<biju.das.jz@bp.renesas.com>, <tomi.valkeinen@ideasonboard.com>,
	<liaochen4@huawei.com>
Subject: [PATCH -next 2/3] media: platform: rzg2l-cru: rzg2l-csi2: enable module autoloading
Date: Thu, 29 Aug 2024 07:54:16 +0000
Message-ID: <20240829075417.526459-3-liaochen4@huawei.com>
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
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index e68fcdaea207..c7fdee347ac8 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -865,6 +865,7 @@ static const struct of_device_id rzg2l_csi2_of_table[] = {
 	{ .compatible = "renesas,rzg2l-csi2", },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, rzg2l_csi2_of_table);
 
 static struct platform_driver rzg2l_csi2_pdrv = {
 	.remove_new = rzg2l_csi2_remove,
-- 
2.34.1


