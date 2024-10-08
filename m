Return-Path: <linux-media+bounces-19197-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A8452993CFE
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 04:39:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 720252842EC
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 02:39:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25F0724B26;
	Tue,  8 Oct 2024 02:38:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E74125A9;
	Tue,  8 Oct 2024 02:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728355131; cv=none; b=TCfj5u6e8aWWkW82ztL4zqHaOUkUquCpwwzl+wvgladrCQlfzKBBjgMrWcOc+TFDUbPPsFLmlrMcYFNhTRqrwOOWZnzWeBhJEbWeM2TgEIv9/76BumX+7aG9KEeaq96HvuSFO5UO3gjMkQQQjbL1fFGSKRbYoPvtvNuPGUs4Jx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728355131; c=relaxed/simple;
	bh=33NDn5HKvWpO4YWbXTc+k2X/+8dmKtm4SEhcYCXP6L8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=YiIVOUzvR40/pICjkHr7/caz1LzsNvUNd9DR1PZneiXKral3Wucsd0kdAT6yp6DL95FWBMlTQTaUjFrd1Zp7ur6fzlolloN/qGMKepUpJzDCkSafZEZrxasmQDPuxm/JmhO3fpiboTHHka86xfNUOqJGKOA1kgsp/OtGQ3UOWac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4XN0Zg5Qbyz1ymkG;
	Tue,  8 Oct 2024 10:38:51 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 8E1F51A0190;
	Tue,  8 Oct 2024 10:38:47 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemh500013.china.huawei.com (7.202.181.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 8 Oct 2024 10:38:46 +0800
Message-ID: <5438c7fa-311a-67fd-a7f0-df298fbc2a30@huawei.com>
Date: Tue, 8 Oct 2024 10:38:46 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 0/3] media: Fix pm_runtime_set_suspended() with runtime pm
 enabled
Content-Language: en-US
To: <sakari.ailus@linux.intel.com>, <mchehab@kernel.org>, <ming.qian@nxp.com>,
	<eagle.zhou@nxp.com>, <stanimir.k.varbanov@gmail.com>,
	<quic_vgarodia@quicinc.com>, <bryan.odonoghue@linaro.org>,
	<hans.verkuil@cisco.com>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
References: <20240923035115.3008900-1-ruanjinjie@huawei.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20240923035115.3008900-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemh500013.china.huawei.com (7.202.181.146)

Ping.

On 2024/9/23 11:51, Jinjie Ruan wrote:
> Fix pm_runtime_set_suspended() with runtime pm enabled.
> 
> Jinjie Ruan (3):
>   media: i2c: dw9768: Fix pm_runtime_set_suspended() with runtime pm
>     enabled
>   media: amphion: Fix pm_runtime_set_suspended() with runtime pm enabled
>   media: venus: Fix pm_runtime_set_suspended() with runtime pm enabled
> 
>  drivers/media/i2c/dw9768.c               | 6 +++---
>  drivers/media/platform/amphion/vpu_drv.c | 2 +-
>  drivers/media/platform/qcom/venus/core.c | 2 +-
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 

