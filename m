Return-Path: <linux-media+bounces-38806-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AE4B18EAF
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 15:27:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4BB93B0F26
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 13:27:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44DA623E356;
	Sat,  2 Aug 2025 13:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="qqNUWLHW";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="CLzPCjtS"
X-Original-To: linux-media@vger.kernel.org
Received: from flow-a5-smtp.messagingengine.com (flow-a5-smtp.messagingengine.com [103.168.172.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA31239562;
	Sat,  2 Aug 2025 13:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754141217; cv=none; b=IG0vgVIyuoW40jat9TEhLXVW51lb5uRGKPjDkU2zjfa69cAeQU58WNnn6xuHrBrRfAyVto901jZ05gA1rSPHlAIhUfh7BqwCpNP/qvNzVXtOKPbPsroP/VF7ZiZjYKcsWqz5QKTeqh4bSdnO8XuTivGIuY9WqKTb34HC7/EdWxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754141217; c=relaxed/simple;
	bh=RQcvlDgE9AaqghHzjivBTwci6wnSL8fk15KJ90oMijI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ecBA5JpXZKFsKSto4Wd7cZc9hg+ufJs+QXZp/+45TVRt1SxBSjdL5zRa7J3r1XsqAuRsWkcOGiooOxb4LX6lTMu15l6cGAG9ealaotRlvot2QvlsQf3alEjlzLc4B2pSmHQG4ZeCzwcSqdTHWULmqwwXntiK/KirVsiiRJM2s4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=qqNUWLHW; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=CLzPCjtS; arc=none smtp.client-ip=103.168.172.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailflow.phl.internal (Postfix) with ESMTP id A87BC1380608;
	Sat,  2 Aug 2025 09:26:52 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Sat, 02 Aug 2025 09:26:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1754141212;
	 x=1754148412; bh=bmI1hYqjksR+DRa8JSQk6MVH64W5+sLipA6UwCtocJY=; b=
	qqNUWLHW5NkgMWC7l9Ppuzcw0TRZVKBalVrpuNL2tWkSX16V+CaL/WD3GPRevH/3
	cOaqYuZWVehBMlqwkuJTQ3+7ee7mvoCmm57l/9y3kSLOhYi/j9UZL0baYRp5JOQM
	j4yp2XwkBPHkkHrQr9G2kPmFqob1bo+ge9yICVt/dsRrLU+xuJA6h9g8SW4qJPa0
	AHQH8Vz64gEdgI7kQ+1DTmePAvNbJQJxnWkGkDSZF/paCkDAzfIwxTUg+JfaHIca
	2uCTiijQTVgzLiuE6qwTC/es2iaY0ak3Q1yInsTplxnRcKjgCrvxpj+WvGFL/Gkm
	HIx11r/lg4cei6lIenYP+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1754141212; x=
	1754148412; bh=bmI1hYqjksR+DRa8JSQk6MVH64W5+sLipA6UwCtocJY=; b=C
	LzPCjtSlWjEpgC9nck7IIN+a6VWM2T9KzMBiWo4CFmbf/c8EsbwRuyBR6zo43jFD
	hvyIbMP0zgOcLL+h4kub0bXZEqehHtgFY6sV9cwlFjffv+lGsEsKcJttU2+8fn3b
	kRALXojkwbX6H2IOxV2soFJHVIcKk6LuRbHAbjPhMXvWGeT7KA2Mau0LJLy4HAji
	lfgiUMmK9spCDs/oe1YGLozfqCHtXvx0XyirO7dloL77Fyd05IG6lp0ZwH1pUgeh
	FNabC3mgBC+9qZ25Drxy58dz8xR3lKKGectSGWS0hTtARs2FRFJmAX2nfNB3fKxO
	c360wFl1nKo7iNibIdOnQ==
X-ME-Sender: <xms:FhKOaIqzIVCCzZqyPT8S-Kuyp75Ghz90bD-sNWC1Ynb1xWuDhB2fgA>
    <xme:FhKOaAAM51hB_nYlCo1hgXLgPrXfAQsJTzEzSK29ONCez_BVzRWEnZ7YYfmVPVSd4
    mYWvtLYdmS8g_-J1io>
X-ME-Received: <xmr:FhKOaKNy3dovqvqjcZlMlmNulu_odOhDUh_OuI4TialffSqjpk1dXSXjcgxfsuv77hx6_icSG8wxq9Qphv3aDtPfT18v805RrQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddutdeiieelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrg
    htvggthhdrshgvqeenucggtffrrghtthgvrhhnpeevteegtddvvdfhtdekgefhfeefheet
    heekkeegfeejudeiudeuleegtdehkeekteenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhn
    rghtvggthhdrshgvpdhnsggprhgtphhtthhopedutdehpdhmohguvgepshhmthhpohhuth
    dprhgtphhtthhopehjrggtohhpohdrmhhonhguihesihguvggrshhonhgsohgrrhgurdgt
    ohhmpdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    epuggvvhgrrhhshhhtsehtihdrtghomhdprhgtphhtthhopegsphgrrhhrohhtsehtihdr
    tghomhdprhgtphhtthhopehhvhgvrhhkuhhilheskhgvrhhnvghlrdhorhhgpdhrtghpth
    htohepihhsvghlhiesphhosghogidrtghomhdprhgtphhtthhopehlrghurhgvnhhtrdhp
    ihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohephhgrnh
    hsgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgrrhhthhhisggrnhdrvhgvvghr
    rghsohhorhgrnhesmhhitghrohgthhhiphdrtghomh
X-ME-Proxy: <xmx:FhKOaHAoXiF7NV692VGvUlBtEKV8Ppc7HpktTEwZStXxvUIyFnrhjw>
    <xmx:FhKOaIXbJEGFB6MyMI6SEvkY_tAqtZmQdwpF1CyYAg0cU-whIhajXA>
    <xmx:FhKOaOXdPk75wbqe7BRIpcNiWjQWCtbKZe7Hw0Dw9yRuHK1wn0wJ9A>
    <xmx:FhKOaA4w1OKh4y5m73fZ4TocrIIXqTtdAsWzkrmS8EjZZidpBDEFUw>
    <xmx:HBKOaGfprgDP-C4pCZ_BqeXWMGw4oENfGJWvHSy-BbRaGSp473jMOr6M>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 2 Aug 2025 09:26:45 -0400 (EDT)
Date: Sat, 2 Aug 2025 15:26:43 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Devarsh Thakkar <devarsht@ti.com>, Benoit Parrot <bparrot@ti.com>,
	Hans Verkuil <hverkuil@kernel.org>, Mike Isely <isely@pobox.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Dongliang Mu <dzm91@hust.edu.cn>, Jonathan Corbet <corbet@lwn.net>,
	Tomasz Figa <tfiga@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Andy Walls <awalls@md.metrocast.net>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Bin Liu <bin.liu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Michal Simek <michal.simek@amd.com>, Ming Qian <ming.qian@nxp.com>,
	Zhou Peng <eagle.zhou@nxp.com>,
	Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,	Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Nas Chung <nas.chung@chipsnmedia.com>,
	Jackson Lee <jackson.lee@chipsnmedia.com>,
	Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
	Jacob Chen <jacob-chen@iotwrt.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Heiko Stuebner <heiko@sntech.de>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	=?utf-8?Q?=C5=81ukasz?= Stelmach <l.stelmach@samsung.com>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Fabien Dessenne <fabien.dessenne@foss.st.com>,
	Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,	Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Corentin Labbe <clabbe@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,	linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org,	imx@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org,	linux-arm-msm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org,	linux-sunxi@lists.linux.dev,
 linux-usb@vger.kernel.org,	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	mjpeg-users@lists.sourceforge.net
Subject: Re: [PATCH 17/65] media: rcar-vin: Do not set file->private_data
Message-ID: <20250802132643.GA1848717@ragnatech.se>
References: <20250802-media-private-data-v1-0-eb140ddd6a9d@ideasonboard.com>
 <20250802-media-private-data-v1-17-eb140ddd6a9d@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250802-media-private-data-v1-17-eb140ddd6a9d@ideasonboard.com>

Hi Jacopo,

Thanks for your effort tidying things up!

On 2025-08-02 11:22:39 +0200, Jacopo Mondi wrote:
> The R-Car VIN driver sets file->private_data to the driver-specific
> structure, but the following call to v4l2_fh_open() overwrites it
> with a pointer to the just allocated v4l2_fh.
> 
> Remove the mis-leading assignment in the driver.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
> index 62eddf3a35fc91434cb2e584a01819380a7a6dd8..079dbaf016c25139e2ac82be63d8fce0d11fd208 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
> @@ -588,8 +588,6 @@ static int rvin_open(struct file *file)
>  	if (ret)
>  		goto err_pm;
>  
> -	file->private_data = vin;
> -
>  	ret = v4l2_fh_open(file);
>  	if (ret)
>  		goto err_unlock;
> 
> -- 
> 2.49.0
> 

-- 
Kind Regards,
Niklas Söderlund

