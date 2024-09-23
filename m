Return-Path: <linux-media+bounces-18440-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B2497E506
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2024 05:41:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A9EA1F21694
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2024 03:41:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F046DDBE;
	Mon, 23 Sep 2024 03:41:22 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB41F139D;
	Mon, 23 Sep 2024 03:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727062881; cv=none; b=pvP26DIPpMLmUNRuh4fhmvVctu3txpe3cwjUhuuzKcEKVuSskjTgsiTgudthIaNicwxdFois0ONeUSmxC3FjXFwunKklHzJVqXTu1Nyqh5pH5L72KNVmpizs7mr8xcQLbyu6mPo7647PVqaEJZYYBvgKtL1b3m4HOSZ0NoMGWC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727062881; c=relaxed/simple;
	bh=S70C6o0uCWnkHIRojnfTzx6x1zyNOFbxQLqCPLkxhGQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FHeW61k3Mf5bd2jD4kIaR6/QWjKuYd7DcvsyVLKW7/0AP7BS1WcfATEDRlDmIXtvOoChDiRrTecfpjt5tgXyG63EGy4ysHlwlAzjTZuJHTEcHZVuv6kCgTQJRwf7JIHi6aKoIWcOw800JkKhQTPa8ILPENlH27OMSo/fbDTWmLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4XBpbF03Zrz1HJsS;
	Mon, 23 Sep 2024 11:37:29 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id F061D1A0188;
	Mon, 23 Sep 2024 11:41:16 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 23 Sep
 2024 11:41:16 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <sakari.ailus@linux.intel.com>, <mchehab@kernel.org>, <ming.qian@nxp.com>,
	<eagle.zhou@nxp.com>, <stanimir.k.varbanov@gmail.com>,
	<quic_vgarodia@quicinc.com>, <bryan.odonoghue@linaro.org>,
	<hans.verkuil@cisco.com>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH 0/3] media: Fix pm_runtime_set_suspended() with runtime pm enabled
Date: Mon, 23 Sep 2024 11:51:12 +0800
Message-ID: <20240923035115.3008900-1-ruanjinjie@huawei.com>
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
 kwepemh500013.china.huawei.com (7.202.181.146)

Fix pm_runtime_set_suspended() with runtime pm enabled.

Jinjie Ruan (3):
  media: i2c: dw9768: Fix pm_runtime_set_suspended() with runtime pm
    enabled
  media: amphion: Fix pm_runtime_set_suspended() with runtime pm enabled
  media: venus: Fix pm_runtime_set_suspended() with runtime pm enabled

 drivers/media/i2c/dw9768.c               | 6 +++---
 drivers/media/platform/amphion/vpu_drv.c | 2 +-
 drivers/media/platform/qcom/venus/core.c | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.34.1


