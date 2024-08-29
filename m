Return-Path: <linux-media+bounces-17101-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 191C7963DEF
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 10:02:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 81118B219D1
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 08:02:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 176CB18A6C6;
	Thu, 29 Aug 2024 08:02:39 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A5218786F;
	Thu, 29 Aug 2024 08:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724918558; cv=none; b=iGNnQterjYQzSQ+J41TAQnmYcliIO+7lLq7HYpQJbQ9OWlFSS6M37CTU/SRGhhnGr1MQngFhxIaNHS0SDnzQG/YmtHXU0Ezrv8FUeCQNSLTcKfcfOxsKeO/i+Q2thGGO7n56Dj9RjapX+3NwAIyHaqcPUgQ5sJuPTrlHqBVMxoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724918558; c=relaxed/simple;
	bh=+dW0RGrcHQu40IW2Rr5sxlbtdGgsFjyLfiHuimLwnhA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ONrX4Q7yypNxwCXnPJ6Q0lWWJiEisy734Y9FQLNf0MfCgr8m0Rrkngmxce/JGILK59G+2Lob3Xd3/WETJeXMbGntTEbojBVLp8CkIic1t1AXVq8ns/1cCsECUF1Rp6crB9duWckf3XurLKQyXmcPfm6IxZSm/vL5q7T6dzcJIkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4WvYcF3bbQzfbFP;
	Thu, 29 Aug 2024 16:00:29 +0800 (CST)
Received: from dggpemm500020.china.huawei.com (unknown [7.185.36.49])
	by mail.maildlp.com (Postfix) with ESMTPS id CDF0614011A;
	Thu, 29 Aug 2024 16:02:33 +0800 (CST)
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
Subject: [PATCH -next 0/3] media: enable module autoloading
Date: Thu, 29 Aug 2024 07:54:14 +0000
Message-ID: <20240829075417.526459-1-liaochen4@huawei.com>
X-Mailer: git-send-email 2.34.1
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

Hi all,

This patchset aims to enable autoloading of some media modules.
By registering MDT, the kernel is allowed to automatically bind 
modules to devices that match the specified compatible strings.

Liao Chen (3):
  media: v4l2-subdev: enable module autoloading
  media: platform: rzg2l-cru: rzg2l-csi2: enable module autoloading
  media: tegra_cec: enable module autoloading

 drivers/media/cec/platform/tegra/tegra_cec.c          | 1 +
 drivers/media/i2c/mt9v111.c                           | 1 +
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c | 1 +
 3 files changed, 3 insertions(+)

-- 
2.34.1


