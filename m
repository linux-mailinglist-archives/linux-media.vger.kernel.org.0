Return-Path: <linux-media+bounces-19683-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A19499F0D8
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 17:17:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 948E91C21CAC
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 15:17:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36E2E1CBA1D;
	Tue, 15 Oct 2024 15:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V3qsI9Mz"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E4A28377
	for <linux-media@vger.kernel.org>; Tue, 15 Oct 2024 15:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729005450; cv=none; b=gHKYUdZV090E1LLGTmhBCN+3ZLeh5jRcmiLXFSDDRdDp2I/qFa5d13DHOCqAapjGmMHfDCJAFcZKBmsF9EoulgWm7V6Mj99MXCaFhjI0aMW+wjHET/3WF0/cSqRM6Wr1PGJRP7llt7sjVbwFKTbMYeXr7BNCW9ROsE+XR8yvCis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729005450; c=relaxed/simple;
	bh=OGOjRL5baFnBgNFWdCRsXkwfP2OmtnrjUD/VuhVVRCM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JEwdJFeKqJO1FMjOYdndcdmVPKew0PNBNrwYI8QA0ydbLEXwSvz/jxCvnYjWERFZfH1sQf7GkW5Conxp5dHZk4LhuUhqqO1/PcbYLhW+Cqha3iTDCVzcFyQKRnpvNR2X3EtAlByst1uNDJgEGu80nsEMlpZ7jS7M3axfZSobkg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V3qsI9Mz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6F0CC4CEC6;
	Tue, 15 Oct 2024 15:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729005450;
	bh=OGOjRL5baFnBgNFWdCRsXkwfP2OmtnrjUD/VuhVVRCM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=V3qsI9Mz4npe7eysCB9+KhfdJTq3bJ7YuRFxPGnP3YwPdj6gzp6tZUUg+VxSMmNae
	 JJrKZY+sDXq6biSYAJQYEyCs7/xMlUOkFhktlRf9jAjoi2ZFHuCkZS9X8DzgFZrQB0
	 UJ0qC3BT9Wy8/bTHuvN4rkmfNVGY8oNnrPI2tWzfyr+Umwgtke1cZBSxyy+JvfIxej
	 zDYyeQQ7G5Yqlymk30wQSTzJU4vI+QvhcteTQQ5jNXogZ8M6oAU0MvFSK3hbmhTmJG
	 jwlnnbkGcz/rZoOoh8VUvIiUt7t837BVY683qYiRzefmuOmrsrKhCwbl7kjAQXofzc
	 8yuK0AQD6qvCw==
Message-ID: <0436cb3f-0179-4d4c-a4ff-d77a11f1aa1a@kernel.org>
Date: Tue, 15 Oct 2024 09:17:25 -0600
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] media: test-drivers: drop
 vb2_ops_wait_prepare/finish
To: Hans Verkuil <hverkuil@xs4all.nl>, Tomasz Figa <tfiga@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Andy Walls <awalls@md.metrocast.net>, Yong Zhi <yong.zhi@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>, Dan Scally <djrscally@gmail.com>,
 Tianshu Qiu <tian.shu.qiu@intel.com>,
 Martin Tuma <martin.tuma@digiteqautomotive.com>,
 Bluecherry Maintainers <maintainers@bluecherrydvr.com>,
 Andrey Utkin <andrey_utkin@fastmail.com>, Ismael Luceno
 <ismael@iodev.co.uk>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Corentin Labbe <clabbe@baylibre.com>, Michael Krufky <mkrufky@linuxtv.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Matt Ranostay <matt@ranostay.sg>, Michael Tretter
 <m.tretter@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ming Qian <ming.qian@nxp.com>, Zhou Peng <eagle.zhou@nxp.com>,
 Eddie James <eajames@linux.ibm.com>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Nas Chung <nas.chung@chipsnmedia.com>,
 Jackson Lee <jackson.lee@chipsnmedia.com>, Devarsh Thakkar
 <devarsht@ti.com>, Bin Liu <bin.liu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Houlong Wei <houlong.wei@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Joseph Liu <kwliu@nuvoton.com>,
 Marvin Lin <kflin@nuvoton.com>, Dmitry Osipenko <digetx@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
 Mirela Rabulea <mirela.rabulea@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Rui Miguel Silva <rmfrfs@gmail.com>, Martin Kepplinger <martink@posteo.de>,
 Purism Kernel Team <kernel@puri.sm>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
 Jacob Chen <jacob-chen@iotwrt.com>, Heiko Stuebner <heiko@sntech.de>,
 Dafna Hirschfeld <dafna@fastmail.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 =?UTF-8?Q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>,
 Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Alain Volmat <alain.volmat@foss.st.com>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Yong Deng <yong.deng@magewell.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Benoit Parrot <bparrot@ti.com>, Jai Luthra <jai.luthra@linux.dev>,
 Michal Simek <michal.simek@amd.com>, Andy Shevchenko <andy@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Steve Longerbeam <slongerbeam@gmail.com>,
 Jack Zhu <jack.zhu@starfivetech.com>,
 Changhuang Liang <changhuang.liang@starfivetech.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: linux-media@vger.kernel.org, shuah <shuah@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20241014-vb2-wait-v1-0-8c3ee25c618c@xs4all.nl>
 <20241014-vb2-wait-v1-2-8c3ee25c618c@xs4all.nl>
Content-Language: en-US
From: Shuah <shuah@kernel.org>
In-Reply-To: <20241014-vb2-wait-v1-2-8c3ee25c618c@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/14/24 09:06, Hans Verkuil wrote:
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
> ---
>   drivers/media/test-drivers/vicodec/vicodec-core.c  | 2 --
>   drivers/media/test-drivers/vim2m.c                 | 2 --
>   drivers/media/test-drivers/vimc/vimc-capture.c     | 6 ------
>   drivers/media/test-drivers/visl/visl-video.c       | 2 --
>   drivers/media/test-drivers/vivid/vivid-meta-cap.c  | 2 --
>   drivers/media/test-drivers/vivid/vivid-meta-out.c  | 2 --
>   drivers/media/test-drivers/vivid/vivid-sdr-cap.c   | 2 --
>   drivers/media/test-drivers/vivid/vivid-touch-cap.c | 2 --
>   drivers/media/test-drivers/vivid/vivid-vbi-cap.c   | 2 --
>   drivers/media/test-drivers/vivid/vivid-vbi-out.c   | 2 --
>   drivers/media/test-drivers/vivid/vivid-vid-cap.c   | 2 --
>   drivers/media/test-drivers/vivid/vivid-vid-out.c   | 2 --
>   12 files changed, 28 deletions(-)
> 

For vimc driver:

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah


