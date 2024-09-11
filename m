Return-Path: <linux-media+bounces-18143-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B45FF974876
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2024 05:09:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5DFA61F2678C
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2024 03:09:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F188A39FD9;
	Wed, 11 Sep 2024 03:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qkc5suz4"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443B13BBC1;
	Wed, 11 Sep 2024 03:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726024131; cv=none; b=hJMOcxHegayJVKWAQmnLCrSs5dV8uaU2xljkjebwtGOEjW+HGw/8kX6rIw2yWLcz50/8MS048opqP2MnIuBjhOKPPsNkKixu/D5beGuT94yn2TjDhwFFW5ngdMFxtxhaTuCPTk8IZyEVaAWvYlwY37xr43PLG9PAjSOmt9ii1mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726024131; c=relaxed/simple;
	bh=HEMopyFpUu8HJoyo6/3G/2qXbBjpHn1icDfAGuvUUL8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mTQQs2IANhDdrRI4tnAkmEHnz/GL+7HURzCeRNYGIDyWadwPAGGC7KBCdf5EgQFbOpf9ldcUREzj4S0SV9AnrMTNP3aWYn2+J9SMKxyUzi0l2WA9VkzCzmm1E7Nyx4rFc+DZZSmBFFcEiQ/qVQT8HVYSkPQtFoKdGWI9mkM/cwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qkc5suz4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27DB3C4CEC3;
	Wed, 11 Sep 2024 03:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726024130;
	bh=HEMopyFpUu8HJoyo6/3G/2qXbBjpHn1icDfAGuvUUL8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qkc5suz42b+1q4lA5Sqr8EwF3Ml5GipTiZT9ykooM+Qp6DW2VLa1KT4ftQQlZdoYh
	 eicfVfZC4fP1MFHxQ6yFV03y6qrOy0JmuZSyISJI4NmA3EzoH6SD0yj/4kQnMeXbRc
	 urCd2KR9gdyU5JTSNuXDoKxkI8ej6MyEX6AaLfbV9AkXGM9ndJsOh1IzCNLhk+Vk9R
	 i6Pu1aB9D97WUkhiBfwOAKdMCw939M2g5HIhImKk3TqNLyhqbWo1apohvoVdp3skWL
	 eTI5CAYdElaDC5EhA9lhWnY9oRhZADU123CiIcWp2PsKB3JSFPH6wd+HVV82ufZ7R5
	 BXLMgs+IdLr+g==
Date: Tue, 10 Sep 2024 20:08:48 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Li Zetao <lizetao1@huawei.com>
Cc: <mchehab@kernel.org>, <florian.fainelli@broadcom.com>, <andrew@lunn.ch>,
 <olteanv@gmail.com>, <davem@davemloft.net>, <edumazet@google.com>,
 <pabeni@redhat.com>, <wens@csie.org>, <jernej.skrabec@gmail.com>,
 <samuel@sholland.org>, <heiko@sntech.de>, <yisen.zhuang@huawei.com>,
 <salil.mehta@huawei.com>, <hauke@hauke-m.de>,
 <alexandre.torgue@foss.st.com>, <joabreu@synopsys.com>,
 <mcoquelin.stm32@gmail.com>, <wellslutw@gmail.com>,
 <radhey.shyam.pandey@amd.com>, <michal.simek@amd.com>,
 <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
 <ruanjinjie@huawei.com>, <hverkuil-cisco@xs4all.nl>,
 <u.kleine-koenig@pengutronix.de>, <jacky_chou@aspeedtech.com>,
 <jacob.e.keller@intel.com>, <linux-media@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
 <linux-rockchip@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <platform-driver-x86@vger.kernel.org>
Subject: Re: [PATCH net-next v2 00/10] net: Convert using
 devm_clk_get_enabled()/devm_clk_get_optional_enabled()
Message-ID: <20240910200848.0b028720@kernel.org>
In-Reply-To: <20240907031926.3591353-1-lizetao1@huawei.com>
References: <20240907031926.3591353-1-lizetao1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 7 Sep 2024 11:19:16 +0800 Li Zetao wrote:
> v1 -> v2:
>   1) Patch 5 optimizes the check and adds commit information for easier
>   inspection.
>   2) It is no longer necessary to use clk, so delete the clk member of
>   the spl2sw_common structure.
>   3) Remove patches 11 and 12, they should be sent to wireless-next
>   individually

In addition to Christophe's suggestions the patches didn't get ingested
correctly into patchwork, due to the quick repost of:
https://lore.kernel.org/all/20240907031009.3591057-1-lizetao1@huawei.com/
without bumping the patch version...
-- 
pw-bot: cr

