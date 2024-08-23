Return-Path: <linux-media+bounces-16635-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7384C95C877
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 10:54:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D711EB265FB
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 08:54:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1804F149C46;
	Fri, 23 Aug 2024 08:54:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030207346D;
	Fri, 23 Aug 2024 08:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724403284; cv=none; b=Di1lQUtx1dj1j3a8hjzwyI6dlRlgPD7gLkR4ENTFyPYECUgITd6qsj9e79jagZBH3jlTHohh5i/xUcZ9C/IdE+K6IW5W7kEDQQSLhd9WCKrV1RPzU+ymuoqGqd6k5MyUNf2+j66Mw2eiR8GHnRPDUN4XtsHH1rtZD/aw+kJQwac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724403284; c=relaxed/simple;
	bh=kC65XDyJ34GE5Z24BZY5nN3OqIHPFWmedXixQgqMwf4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dJ7nDC1BiUJDuLLYYLFUGoWn/AKzdRxFojcAqvvsA2+oQi4eCkYki8ft8OugsSjh0zzZ3cE7c5nKSgYpocCCVUjBVC8XB2tOufCaIZS7FFRogmwVY+Y03KvjksCWLwySksna5sITQ1vcCU4hoehp6bg01lO3z+KUCgimATTIxGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Wqv5R4B2pz1j70g;
	Fri, 23 Aug 2024 16:54:35 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 2C9E014013B;
	Fri, 23 Aug 2024 16:54:40 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 23 Aug
 2024 16:54:39 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <s.nawrocki@samsung.com>, <mchehab@kernel.org>, <krzk@kernel.org>,
	<alim.akhtar@samsung.com>, <linux-media@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <jic23@kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next 0/3] media: Use for_each_child_of_node_scoped()
Date: Fri, 23 Aug 2024 17:02:14 +0800
Message-ID: <20240823090217.436622-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemh500013.china.huawei.com (7.202.181.146)

Use for_each_child_of_node_scoped() to simplify code.

Jinjie Ruan (3):
  media: samsung: exynos4-is: Use
    for_each_available_child_of_node_scoped()
  media: c8sectpfe: Use for_each_child_of_node_scoped()
  media: xilinx-vipp: Use for_each_child_of_node_scoped()

 .../platform/samsung/exynos4-is/media-dev.c   | 27 +++++----------
 .../st/sti/c8sectpfe/c8sectpfe-core.c         | 34 +++++++------------
 drivers/media/platform/xilinx/xilinx-vipp.c   |  7 ++--
 3 files changed, 22 insertions(+), 46 deletions(-)

-- 
2.34.1


