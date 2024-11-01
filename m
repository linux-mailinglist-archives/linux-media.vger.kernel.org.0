Return-Path: <linux-media+bounces-20665-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A429B8C4E
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2024 08:48:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B515E28550D
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2024 07:48:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD824156887;
	Fri,  1 Nov 2024 07:47:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF7A155342;
	Fri,  1 Nov 2024 07:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730447254; cv=none; b=jP2QsI3VnkgclngMTSEC4QdL1haquRw9bMvyPHSwos1o3Q2lFJ/k5AdTTFtiwZIy/cyRSVopVzL3hM7KnQ9VYlTBPl1iveS8uavAKl2AvtIh7IwsT4cLESxPu/HBv7WRYNu1osbRVkgmjf4pqiZda7DtFlknheGHEm0LYCcU2uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730447254; c=relaxed/simple;
	bh=SaqJVCFsipWJ+cHrwfqY+ErSxsR8oOSI7oFTlTavA9A=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DjI5fymQ7tCtpauGxxYFb66vwG2uIMbzXdAECCOT/PNFIygwVJV3jL2VyukNPNyXqsWUN26kQwy9Vl3qJ6IhDef/K/f0K+mBLtFjwJ7+I8LWw/X3HhSxPizSg5NrvIbZaaDPknTxsNBI7u00o0yHBRaBmjSNkXMFQlD9q+3lMkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4XftHs6tfTz1yp2V;
	Fri,  1 Nov 2024 15:47:37 +0800 (CST)
Received: from kwepemf500004.china.huawei.com (unknown [7.202.181.242])
	by mail.maildlp.com (Postfix) with ESMTPS id D8DF214011B;
	Fri,  1 Nov 2024 15:47:28 +0800 (CST)
Received: from lihuafei.huawei.com (10.90.53.74) by
 kwepemf500004.china.huawei.com (7.202.181.242) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 1 Nov 2024 15:47:28 +0800
From: Li Huafei <lihuafei1@huawei.com>
To: <mchehab@kernel.org>
CC: <andy@kernel.org>, <hdegoede@redhat.com>, <sakari.ailus@linux.intel.com>,
	<gregkh@linuxfoundation.org>, <linux-media@vger.kernel.org>,
	<linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<lihuafei1@huawei.com>
Subject: [PATCH] media: atomisp: Add check for rgby_data memory allocation failure
Date: Fri, 1 Nov 2024 23:48:23 +0800
Message-ID: <20241101154823.3067891-1-lihuafei1@huawei.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemf500004.china.huawei.com (7.202.181.242)

In ia_css_3a_statistics_allocate(), there is no check on the allocation
result of the rgby_data memory. If rgby_data is not successfully
allocated, it may trigger the assert(host_stats->rgby_data) assertion in
ia_css_s3a_hmem_decode(). Adding a check to fix this potential issue.

Fixes: ad85094b293e ("Revert "media: staging: atomisp: Remove driver"")
Signed-off-by: Li Huafei <lihuafei1@huawei.com>
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


