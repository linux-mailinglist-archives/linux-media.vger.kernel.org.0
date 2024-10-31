Return-Path: <linux-media+bounces-20618-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D009B72AC
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2024 03:58:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ACB172862E0
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2024 02:58:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA97112CDBF;
	Thu, 31 Oct 2024 02:58:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com [45.249.212.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2526E77112;
	Thu, 31 Oct 2024 02:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730343504; cv=none; b=au8PEfLfCUsAboTnBcROI3QsK+RJKoNFZA/z0NMRYRJY+AWL5bSUl5+1nrqv8L3ewBWnT9BIJFcFx5N+ySaS3MNx7HWylfcDSyRxwfYz0D6YT1wDVYX8JFsX7Tjwn5C1OcQGi/NO9lV3eSl4QUoiOkn6vnMpym93aK6u4DaZFOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730343504; c=relaxed/simple;
	bh=0fwWPorxaFWzsOmK7UK8zkWC9QYzifxF8yRESwfoIlQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Ea7Y7jZJZRl1hhdpAHZCVlYQbNiAH3woYcFvMMdtH5W5g6RsYg5k4KNVWF/jOpM+h8nk4PDmbIJYObDmckXIVypRtLlzEyAXUZQauNA9qxQaoWwjIHl+EUirquHOipr9QBRbA+o9kEp22wY3kL6NnlX8VOgGy503Meq3yDaOnTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4Xf7w72MQxz4f3jXT;
	Thu, 31 Oct 2024 10:57:59 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 103161A06D7;
	Thu, 31 Oct 2024 10:58:17 +0800 (CST)
Received: from [10.67.109.79] (unknown [10.67.109.79])
	by APP4 (Coremail) with SMTP id gCh0CgA3X4NI8iJnlQazAQ--.15701S2;
	Thu, 31 Oct 2024 10:58:16 +0800 (CST)
Message-ID: <261937bc-af3d-4328-b0f9-990e00620ed4@huaweicloud.com>
Date: Thu, 31 Oct 2024 10:58:16 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] media: Fix pm_runtime_set_suspended() with runtime pm
 enabled
To: Jinjie Ruan <ruanjinjie@huawei.com>, sakari.ailus@linux.intel.com,
 mchehab@kernel.org, ming.qian@nxp.com, eagle.zhou@nxp.com,
 stanimir.k.varbanov@gmail.com, quic_vgarodia@quicinc.com,
 bryan.odonoghue@linaro.org, hans.verkuil@cisco.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20240923035115.3008900-1-ruanjinjie@huawei.com>
Content-Language: en-US
From: Chen Ridong <chenridong@huaweicloud.com>
In-Reply-To: <20240923035115.3008900-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:gCh0CgA3X4NI8iJnlQazAQ--.15701S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYV7kC6x804xWl14x267AKxVW8JVW5JwAF
	c2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII
	0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xv
	wVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4
	x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG
	64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r
	1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kI
	c2xKxwCF04k20xvY0x0EwIxGrwCF54CYxVCY1x0262kKe7AKxVWUtVW8ZwCFx2IqxVCFs4
	IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1r
	MI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJV
	WUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j
	6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYx
	BIdaVFxhVjvjDU0xZFpf9x07UQzVbUUUUU=
X-CM-SenderInfo: hfkh02xlgr0w46kxt4xhlfz01xgou0bp/



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

LGTM.

Thanks,
Ridong


