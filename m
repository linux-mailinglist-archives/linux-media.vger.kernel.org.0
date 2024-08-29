Return-Path: <linux-media+bounces-17136-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 15AF79645A0
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 15:00:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF88D1F2668D
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 13:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F73D1A3BDD;
	Thu, 29 Aug 2024 13:00:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21059474;
	Thu, 29 Aug 2024 13:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724936425; cv=none; b=tnVqOLT9kfsurMp1+5dPdfpF6pCjatUsmargDo53XvLETuT09oqobb9JraN+62i0dVq8getRigu75GmYR8ZSzCCZYEUQXY4VQ4gMWzZRJCE8+QkjKyyvu8mYYMOhpRGLRJOgizQQSh0fx9G8bsYXvHPPIneLiS6J3S0wkhvkvwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724936425; c=relaxed/simple;
	bh=v2uX9VQQznerOWwXP1oDdxYI+qCOJQJftPXGm0R8W98=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VGfuLNxXUMCZwt0SNRMBAhCQp7mdnl6DgV3JxVCDbUkKkAcbD690bvokmCK3Q5SkiifCSp51B13NH/XkE72p0iW6uR2i1L2D6VaUQk/EVtReVBLDs1M5/zt/YRZ4KYa6n6klDqT9c7XTUlx5Z5iWV2/lKZW+D2D2Q6HgvMevtbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4WvhFz638Jz1j7gs;
	Thu, 29 Aug 2024 21:00:07 +0800 (CST)
Received: from dggpemm500020.china.huawei.com (unknown [7.185.36.49])
	by mail.maildlp.com (Postfix) with ESMTPS id 5ADCE1A0188;
	Thu, 29 Aug 2024 21:00:20 +0800 (CST)
Received: from huawei.com (10.67.174.77) by dggpemm500020.china.huawei.com
 (7.185.36.49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 29 Aug
 2024 21:00:20 +0800
From: Liao Chen <liaochen4@huawei.com>
To: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <sakari.ailus@linux.intel.com>, <jacopo@jmondi.org>, <mchehab@kernel.org>,
	<laurent.pinchart@ideasonboard.com>, <biju.das.jz@bp.renesas.com>
Subject: [PATCH -next 0/2] media: i2c: mt9v111: workaround 
Date: Thu, 29 Aug 2024 12:52:01 +0000
Message-ID: <20240829125203.539977-1-liaochen4@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500020.china.huawei.com (7.185.36.49)

Hi all, 

This patchset enables module autoloading feature of mt9v111 module and 
cleans the code up.

Liao Chen (2):
  media: i2c: mt9v111: Add missing MODULE_DEVICE_TABLE
  media: i2c: mt9v111: drop redundant comma

 drivers/media/i2c/mt9v111.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
2.34.1


