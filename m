Return-Path: <linux-media+bounces-20678-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A0F9B8E07
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2024 10:41:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 46322B21D4C
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2024 09:41:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A70D15ADA1;
	Fri,  1 Nov 2024 09:41:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616C21B95B;
	Fri,  1 Nov 2024 09:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730454097; cv=none; b=pzBOuylkECjrHmSvvkV3GxJyPAj2gNLFCEj4ZXKIOtAC4bgHK2kEth269jsM+hmHsvD3pYJ04ta1BRbg6eriSl2PUhbQqvh1O5jvilrIxwK80IsMZbMUG1jx5+9LiRmGRAJEgMqIvVHLlDZYhBE43mpSyEruSwANoLfnjAY7lg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730454097; c=relaxed/simple;
	bh=3AK8du1wLJFlfzzBKRrLnyMGOoJFeRLiKZVVFpNx1Gk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PFcMMTjngauJe2BtLu8yfRv1rcMcyO50K7ykzUxgo8AfRJcAuA2gpwAP+G9mHB4Yk02t9gsHlaA/URIyhFOjGKxIZ8lf+UJxVmr/ySLrXu2vD65XZfVSXN7MNQACATYD5W/OBnZxO6cuYhnWFEheg3rnQLl6tmOitBvR9AjtFg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Xfwp56msXz20rNV;
	Fri,  1 Nov 2024 17:40:29 +0800 (CST)
Received: from kwepemg200008.china.huawei.com (unknown [7.202.181.35])
	by mail.maildlp.com (Postfix) with ESMTPS id 62BA81A0191;
	Fri,  1 Nov 2024 17:41:31 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemg200008.china.huawei.com
 (7.202.181.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 1 Nov
 2024 17:41:30 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <sakari.ailus@linux.intel.com>, <mchehab@kernel.org>, <ming.qian@nxp.com>,
	<eagle.zhou@nxp.com>, <stanimir.k.varbanov@gmail.com>,
	<quic_vgarodia@quicinc.com>, <bryan.odonoghue@linaro.org>,
	<shijie.qin@nxp.com>, <hverkuil-cisco@xs4all.nl>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-msm@vger.kernel.org>
CC: <chenridong@huawei.com>, <ruanjinjie@huawei.com>
Subject: [PATCH v2 0/3] media: Fix pm_runtime_set_suspended() with runtime pm enabled
Date: Fri, 1 Nov 2024 17:40:47 +0800
Message-ID: <20241101094050.2421038-1-ruanjinjie@huawei.com>
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
 kwepemg200008.china.huawei.com (7.202.181.35)

Fix a few pm_runtime_set_suspended() with runtime
pm enabled issues.

Changes in v2:
- !pm_runtime_enabled() check -> !IS_ENABLED(CONFIG_PM) as Sakari suggested.
- Add suggested-by.
- Add fix tag.
- Add Cc stable.

Jinjie Ruan (3):
  media: i2c: dw9768: Fix pm_runtime_set_suspended() with runtime pm
    enabled
  media: amphion: Fix pm_runtime_set_suspended() with runtime pm enabled
  media: venus: Fix pm_runtime_set_suspended() with runtime pm enabled

 drivers/media/i2c/dw9768.c               | 10 +++++-----
 drivers/media/platform/amphion/vpu_drv.c |  2 +-
 drivers/media/platform/qcom/venus/core.c |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

-- 
2.34.1


