Return-Path: <linux-media+bounces-17184-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E57A965471
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 03:09:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1CCE1C22C69
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 01:09:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C63726296;
	Fri, 30 Aug 2024 01:09:46 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4086A1D12EE
	for <linux-media@vger.kernel.org>; Fri, 30 Aug 2024 01:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724980185; cv=none; b=BXxtyAg4Qzcoj7GlOimq7OcNoukXu85Fjm1uu7c3GWzN92k119kn03X0JH7/TO1qYS8+V1WCI/IY324pEyEPA7DRdsPJmH2o8iNPYipH0pAUV2KNl+qR3eLCE+DiZfiNsnowH599T6ozKrZAex3Xz8fuaqoggpwp5lTRW/Q0vpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724980185; c=relaxed/simple;
	bh=qqfxa+abl1Qnne9mq27G2RZsQkTwE1GaZhwOOiO51Y0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BaGy9AzIfvB/7/fEOoXv95x+RSCD/Rr/G/W9VQhUo7hBAzguX2PmFlfaDE8/xlK0s2oqHgh3GqahyeS80d+46HBrj1BvpfXETxPdpzXCy+lVL8/xRosVKSeEJiuv7cWs88GMLpshv1OMiqfCpxMjrdNtl7SCq60kFinEnsNz6mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Ww0R76Qd5zyR6t;
	Fri, 30 Aug 2024 09:09:07 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id 018C8180105;
	Fri, 30 Aug 2024 09:09:40 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Fri, 30 Aug
 2024 09:09:39 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <hdegoede@redhat.com>, <mchehab@kernel.org>,
	<sakari.ailus@linux.intel.com>, <gregkh@linuxfoundation.org>,
	<topofeverest8848@gmail.com>, <hverkuil-cisco@xs4all.nl>,
	<andriy.shevchenko@linux.intel.com>
CC: <lizetao1@huawei.com>, <linux-media@vger.kernel.org>,
	<linux-staging@lists.linux.dev>
Subject: [PATCH -next 1/2] media: atomisp: use clamp() in ia_css_eed1_8_encode()
Date: Fri, 30 Aug 2024 09:17:51 +0800
Message-ID: <20240830011752.603433-2-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240830011752.603433-1-lizetao1@huawei.com>
References: <20240830011752.603433-1-lizetao1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemd500012.china.huawei.com (7.221.188.25)

When it needs to get a value within a certain interval, using clamp()
makes the code easier to understand than min(max()).

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 .../media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c
index e4fc90f88e24..55d102b479ac 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c
@@ -276,7 +276,7 @@ ia_css_eed1_8_encode(
 	for (i = 0; i < (IA_CSS_NUMBER_OF_DEW_ENHANCE_SEGMENTS - 1); i++) {
 		min_exp = max(min_exp, from->dew_enhance_seg_exp[i]);
 	}
-	to->e_dew_enh_asr = 13 - min(max(min_exp, 0), 13);
+	to->e_dew_enh_asr = 13 - clamp(min_exp, 0, 13);
 
 	to->dedgew_max = from->dedgew_max;
 }
-- 
2.34.1


