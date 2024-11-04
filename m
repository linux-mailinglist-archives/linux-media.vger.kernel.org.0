Return-Path: <linux-media+bounces-20759-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB1C9BACD6
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 07:50:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 31EF31F22341
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 06:50:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12FD218D63C;
	Mon,  4 Nov 2024 06:50:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697FE158D80;
	Mon,  4 Nov 2024 06:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730703007; cv=none; b=kKHXDumpNFPGT1DP3FfIVwYCorCMmLIAsyIie8SNvfXPOmPaU9a8twFPbY4EjSPwIToJHOq85F3Z9JMx2Zp2U82ajyrrkERbmTWiORMPpvauwfmLrN0TZAOtjLG/LWhp9KIcIEnM8pB0Ge6EgJYwXLsoj0MG0SEGxs9nZViptoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730703007; c=relaxed/simple;
	bh=CSMlutpBpwaIYCs2IDEquG2do+CIX7HDvp/bSm2fivs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YtoaSk9ymZhpeaUEpRd6Py5mllLVUaZQqlMhZPxkCWXEmHkz2x5tdpPbYpKiijWhdOVvgml3Zk8MarfmefEFmapMg3sTgyyOmGPZpHz8v6S9af9/vqkUat1/7VxhhKlBi9BYQ4PtYpUfYJKZdKIdGj5gqVXaalzb1tA+TVUUhE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Xhhrf5Q6NzQsXr;
	Mon,  4 Nov 2024 14:48:50 +0800 (CST)
Received: from kwepemf500004.china.huawei.com (unknown [7.202.181.242])
	by mail.maildlp.com (Postfix) with ESMTPS id 8AD2818007C;
	Mon,  4 Nov 2024 14:49:55 +0800 (CST)
Received: from lihuafei.huawei.com (10.90.53.74) by
 kwepemf500004.china.huawei.com (7.202.181.242) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 4 Nov 2024 14:49:54 +0800
From: Li Huafei <lihuafei1@huawei.com>
To: <mchehab@kernel.org>, <alan@linux.intel.com>
CC: <andy@kernel.org>, <hdegoede@redhat.com>, <sakari.ailus@linux.intel.com>,
	<gregkh@linuxfoundation.org>, <linux-media@vger.kernel.org>,
	<linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<lihuafei1@huawei.com>
Subject: [PATCH v2] media: atomisp: Add check for rgby_data memory allocation failure
Date: Mon, 4 Nov 2024 22:50:51 +0800
Message-ID: <20241104145051.3088231-1-lihuafei1@huawei.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemf500004.china.huawei.com (7.202.181.242)

In ia_css_3a_statistics_allocate(), there is no check on the allocation
result of the rgby_data memory. If rgby_data is not successfully
allocated, it may trigger the assert(host_stats->rgby_data) assertion in
ia_css_s3a_hmem_decode(). Adding a check to fix this potential issue.

Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
Signed-off-by: Li Huafei <lihuafei1@huawei.com>
---
Changes in v2:
 - Corrects the "Fixes" tag.
---
 drivers/staging/media/atomisp/pci/sh_css_params.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
index 232744973ab8..b1feb6f6ebe8 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -4181,6 +4181,8 @@ ia_css_3a_statistics_allocate(const struct ia_css_3a_grid_info *grid)
 		goto err;
 	/* No weighted histogram, no structure, treat the histogram data as a byte dump in a byte array */
 	me->rgby_data = kvmalloc(sizeof_hmem(HMEM0_ID), GFP_KERNEL);
+	if (!me->rgby_data)
+		goto err;
 
 	IA_CSS_LEAVE("return=%p", me);
 	return me;
-- 
2.25.1


