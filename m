Return-Path: <linux-media+bounces-17848-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 589FD96FF83
	for <lists+linux-media@lfdr.de>; Sat,  7 Sep 2024 05:03:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E2371C22B33
	for <lists+linux-media@lfdr.de>; Sat,  7 Sep 2024 03:03:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B839D208D7;
	Sat,  7 Sep 2024 03:03:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7BF9A923;
	Sat,  7 Sep 2024 03:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725678221; cv=none; b=oVoyp6ToZoeBpcAqToUbHgGl9J2gmpcnBupoGRUNWKoATZDo4iaqusWNnAoeyd9eRWDAphWikqKjyIJtnOgmZkpoL0480hCYA+P30w+ye+0B0YzT/v4WwFHSy0JGK2j6CnebywXa0jQagsAIDh71cDK+LtbvafLpypJVfRwy/7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725678221; c=relaxed/simple;
	bh=Ri86vDXPV17DPmXk89ux55a6ITVEJ+H9P1fDPGMNhVQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=CGm3D2uufq4B/U+ao3Rx4gO42MipMDIAp24G4Sdqg4UlNK/xXupR4Pl1HmB/1DszPTCE7txjJyBY+SJLFYXA32Hbh0+cv9OIa2kCGTECJMKGUwEwfVuWcFAm6DXY3Xz8hg0gaFXj3OsgcNJad9a8XBU1nB+0lqfJqW6xSrC4hLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4X0yZN1N4LzyRGp;
	Sat,  7 Sep 2024 11:02:36 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id 622D714035E;
	Sat,  7 Sep 2024 11:03:37 +0800 (CST)
Received: from [10.67.111.176] (10.67.111.176) by
 kwepemd500012.china.huawei.com (7.221.188.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Sat, 7 Sep 2024 11:03:36 +0800
Message-ID: <33b03d5a-ec1e-4aa1-be17-3e67707ad6d2@huawei.com>
Date: Sat, 7 Sep 2024 11:03:35 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 00/10] net: Convert using
 devm_clk_get_enabled()/devm_clk_get_optional_enabled()
To: <mchehab@kernel.org>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <wens@csie.org>,
	<jernej.skrabec@gmail.com>, <samuel@sholland.org>, <heiko@sntech.de>,
	<yisen.zhuang@huawei.com>, <salil.mehta@huawei.com>, <hauke@hauke-m.de>,
	<alexandre.torgue@foss.st.com>, <joabreu@synopsys.com>,
	<mcoquelin.stm32@gmail.com>, <wellslutw@gmail.com>,
	<radhey.shyam.pandey@amd.com>, <michal.simek@amd.com>, <hdegoede@redhat.com>,
	<ilpo.jarvinen@linux.intel.com>, <ruanjinjie@huawei.com>,
	<hverkuil-cisco@xs4all.nl>, <u.kleine-koenig@pengutronix.de>,
	<jacky_chou@aspeedtech.com>, <jacob.e.keller@intel.com>
CC: <linux-media@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
	<linux-rockchip@lists.infradead.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<platform-driver-x86@vger.kernel.org>
References: <20240907031009.3591057-1-lizetao1@huawei.com>
From: Li Zetao <lizetao1@huawei.com>
In-Reply-To: <20240907031009.3591057-1-lizetao1@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggpeml500004.china.huawei.com (7.185.36.140) To
 kwepemd500012.china.huawei.com (7.221.188.25)

Sorry to bother you, I made a small mistake when I sent the patch. 
Please ignore the patchset.

在 2024/9/7 11:09, Li Zetao 写道:
> v1 -> v2:
>    1) Patch 5 optimizes the check and adds commit information for easier
>    inspection.
>    2) It is no longer necessary to use clk, so delete the clk member of
>    the spl2sw_common structure.
>    3) Remove patches 11 and 12, they should be sent to wireless-next
>    individually
> 
> v1:
> https://lore.kernel.org/all/20240831021334.1907921-1-lizetao1@huawei.com/
> 
> There are many examples[1][2] of clk resource leakage in LTS. The
> reason is that developers need to maintain the allocation and release
> of clk resources themselves, but this will increase the burden on
> developers. Using the API related to devm_clk_get_*_enable ensures
> that the life cycle of clk is consistent with that of the device,
> reducing the risk of unreleased resources like clk.
> 
> Several other developers are also working on converting to more
> secure interfaces, and this patch set is in principle the same as
> theirs.
> 
> [1]:
> https://lore.kernel.org/all/20240812160128.338041191@linuxfoundation.org/
> [2]:
> https://lore.kernel.org/all/20240812160135.992451065@linuxfoundation.org/
> 
> Li Zetao (10):
>    net: dsa: bcm_sf2: Convert using devm_clk_get_optional_enabled() in
>      bcm_sf2_sw_probe()
>    net: ethernet: Convert using devm_clk_get_enabled() in emac_probe()
>    net: ethernet: arc: Convert using devm_clk_get_enabled() in
>      emac_probe()
>    net: ethernet: ethoc: Convert using devm_clk_get_enabled() in
>      ethoc_probe()
>    net: ftgmac100: Convert using devm_clk_get_enabled() in
>      ftgmac100_setup_clk()
>    net: ethernet: hisilicon: Convert using devm_clk_get_enabled() in
>      hisi_femac_drv_probe()
>    net: lantiq_xrx200: Convert using devm_clk_get_enabled() in
>      xrx200_probe()
>    net: stmmac: dwmac-dwc-qos-eth: Convert using devm_clk_get_enabled()
>      in dwc_qos_probe()
>    net: ethernet: sunplus: Convert using devm_clk_get_enabled() in
>      spl2sw_probe()
>    net: xilinx: axienet: Convert using devm_clk_get_optional_enabled() in
>      axienet_probe()
> 
>   drivers/net/dsa/bcm_sf2.c                     | 28 ++----
>   drivers/net/ethernet/allwinner/sun4i-emac.c   | 13 +--
>   drivers/net/ethernet/arc/emac_rockchip.c      | 34 ++-----
>   drivers/net/ethernet/ethoc.c                  | 18 ++--
>   drivers/net/ethernet/faraday/ftgmac100.c      | 26 +----
>   drivers/net/ethernet/hisilicon/hisi_femac.c   | 17 +---
>   drivers/net/ethernet/lantiq_xrx200.c          | 17 +---
>   .../stmicro/stmmac/dwmac-dwc-qos-eth.c        | 98 ++++---------------
>   drivers/net/ethernet/sunplus/spl2sw_define.h  |  1 -
>   drivers/net/ethernet/sunplus/spl2sw_driver.c  | 25 ++---
>   .../net/ethernet/xilinx/xilinx_axienet_main.c | 15 +--
>   11 files changed, 62 insertions(+), 230 deletions(-)
> 

