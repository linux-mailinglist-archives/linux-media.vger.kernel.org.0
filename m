Return-Path: <linux-media+bounces-19723-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 817659A0316
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 09:51:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A106288EB5
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 07:51:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 110A01CC8AB;
	Wed, 16 Oct 2024 07:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="b9++UP4Q"
X-Original-To: linux-media@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45211C7B7C
	for <linux-media@vger.kernel.org>; Wed, 16 Oct 2024 07:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729065078; cv=none; b=ixTncNuQkYkdptmf8SnuMBLHUesBUL69yercP56yp2E7BvjYgsSljNOzqE2vKoCzxJQY6szpF7hX9xzGJDtSAaom0n577loAz0duxJ0MSQYFBw7lQNEIULTScLQUoBHwE2nDeVHNarhNfJka3+cj1b5u8oO56WcuutLHQjUWfvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729065078; c=relaxed/simple;
	bh=1z3g25bMB7Gy6wU7Q3wXDM+vk/l6eix2Thl26VwssI8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H2MlE1BU4yYfXyDLabf4qShtJZ0lYuSRs81K4g2Xl1aRPWo/WY/WnlxzcGorqrZLlpXNdXUUAMwc9dTVAEMTzzALxReL532xaha+S0vWHM1qV3mKOZsZttw67qYzhAkJonbwNbzra+RsSdJZ1JqJn2lFPRSspx/1rc61hhx7BNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=b9++UP4Q; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 96369E0009;
	Wed, 16 Oct 2024 07:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729065073;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tm3papsLBSL8G1T47SfyAWFtAJxqHawmlLvsFptZoWY=;
	b=b9++UP4Q4ctv3W6tJMqPqH/62yAAVVmgt5faBQo5G97ba7wywv2B7ve/Aquj8Uw7NGqDJm
	o8b9r+mY2WmsiFSOPa4GsZ4dMWAAnWcqYHnU4nsETD/2n6G9cmysmxriabKwbmwo5STRmI
	EpbGFtUi+pjUZ+boAm8npJGf/G+JszrxYnA48VB3IKV49wp1rUVRypraql0i0sIjbLv1LX
	6rVMk1nnCkLPPBdIzVM3U22CsE1kAclNFdoaC7OEbBKy22KwaZLzvFGDvYUOlIyR9cKioC
	JWY4/EN3lj58sSVDWA4O+4jHm/lKd9Tcd9nGUv4f24WzlhkAYhB+JQIWbF4sUg==
Date: Wed, 16 Oct 2024 09:50:58 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Tomasz Figa <tfiga@chromium.org>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>, Kieran Bingham
 <kieran.bingham@ideasonboard.com>, Daniel Almeida
 <daniel.almeida@collabora.com>, Andy Walls <awalls@md.metrocast.net>, Yong
 Zhi <yong.zhi@intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>, Dan Scally <djrscally@gmail.com>,
 Tianshu Qiu <tian.shu.qiu@intel.com>, Martin Tuma
 <martin.tuma@digiteqautomotive.com>, Bluecherry Maintainers
 <maintainers@bluecherrydvr.com>, Andrey Utkin <andrey_utkin@fastmail.com>,
 Ismael Luceno <ismael@iodev.co.uk>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>, Corentin Labbe <clabbe@baylibre.com>,
 Michael Krufky <mkrufky@linuxtv.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Matt Ranostay <matt@ranostay.sg>,
 Michael Tretter <m.tretter@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin
 Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Ming Qian
 <ming.qian@nxp.com>, Zhou Peng <eagle.zhou@nxp.com>, Eddie James
 <eajames@linux.ibm.com>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@codeconstruct.com.au>, Eugen Hristev <eugen.hristev@collabora.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Florian
 Fainelli <florian.fainelli@broadcom.com>, Broadcom internal kernel review
 list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Nas Chung <nas.chung@chipsnmedia.com>, Jackson
 Lee <jackson.lee@chipsnmedia.com>, Devarsh Thakkar <devarsht@ti.com>, Bin
 Liu <bin.liu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>, Houlong Wei
 <houlong.wei@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>, Yunfei Dong
 <yunfei.dong@mediatek.com>, Joseph Liu <kwliu@nuvoton.com>, Marvin Lin
 <kflin@nuvoton.com>, Dmitry Osipenko <digetx@gmail.com>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Xavier
 Roumegue <xavier.roumegue@oss.nxp.com>, Mirela Rabulea
 <mirela.rabulea@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Rui Miguel
 Silva <rmfrfs@gmail.com>, Martin Kepplinger <martink@posteo.de>, Purism
 Kernel Team <kernel@puri.sm>, Robert Foss <rfoss@kernel.org>, Todor Tomov
 <todor.too@gmail.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Vikash Garodia
 <quic_vgarodia@quicinc.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Niklas =?UTF-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, Fabrizio
 Castro <fabrizio.castro.jz@renesas.com>, Kieran Bingham
 <kieran.bingham+renesas@ideasonboard.com>, Mikhail Ulyanov
 <mikhail.ulyanov@cogentembedded.com>, Jacob Chen <jacob-chen@iotwrt.com>,
 Heiko Stuebner <heiko@sntech.de>, Dafna Hirschfeld <dafna@fastmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 =?UTF-8?Q?=C5=81ukasz?= Stelmach <l.stelmach@samsung.com>, Andrzej
 Pietrasiewicz <andrzejtp2010@gmail.com>, Jacek Anaszewski
 <jacek.anaszewski@gmail.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>, Hugues Fruchet
 <hugues.fruchet@foss.st.com>, Jean-Christophe Trotin
 <jean-christophe.trotin@foss.st.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Alain Volmat <alain.volmat@foss.st.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Yong Deng <yong.deng@magewell.com>, Paul Kocialkowski
 <paul.kocialkowski@bootlin.com>, Benoit Parrot <bparrot@ti.com>, Jai Luthra
 <jai.luthra@linux.dev>, Michal Simek <michal.simek@amd.com>, Andy
 Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Steve Longerbeam
 <slongerbeam@gmail.com>, Jack Zhu <jack.zhu@starfivetech.com>, Changhuang
 Liang <changhuang.liang@starfivetech.com>, Sowjanya Komatineni
 <skomatineni@nvidia.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 09/10] staging: media: drop vb2_ops_wait_prepare/finish
Message-ID: <20241016095058.7bbfddc1@booty>
In-Reply-To: <20241014-vb2-wait-v1-9-8c3ee25c618c@xs4all.nl>
References: <20241014-vb2-wait-v1-0-8c3ee25c618c@xs4all.nl>
	<20241014-vb2-wait-v1-9-8c3ee25c618c@xs4all.nl>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com

Hello Hans,

On Mon, 14 Oct 2024 17:06:36 +0200
Hans Verkuil <hverkuil@xs4all.nl> wrote:

> Since commit 88785982a19d ("media: vb2: use lock if wait_prepare/finish
> are NULL") it is no longer needed to set the wait_prepare/finish
> vb2_ops callbacks as long as the lock field in vb2_queue is set.
> 
> Since the vb2_ops_wait_prepare/finish callbacks already rely on that field,
> we can safely drop these callbacks.
> 
> This simplifies the code and this is a step towards the goal of deleting
> these callbacks.
> 
> Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # drivers/staging/media/tegra-video/vi.c

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

