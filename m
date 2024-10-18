Return-Path: <linux-media+bounces-19813-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A28529A33B0
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 06:14:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 514741C21F84
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 04:14:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 079C016DEA9;
	Fri, 18 Oct 2024 04:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="em4fbnJH"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662DF20E31C
	for <linux-media@vger.kernel.org>; Fri, 18 Oct 2024 04:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729224869; cv=none; b=FGyhfli3CJ61294g4M0TIRlTaZ/Jsd6UHmUSGj/460lHQPduHodMQ9xM1QgJrRga9n0MJAZlZdhHOz61m/Wiaz3KPUhS2Pt6aAj77Vy35/Y2SR4BEDg+/Cc3rPBS9Egu2l/zK2nPc3HhUH7cr6AxDjxBf8Bp1Zlyz21z/AQrmVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729224869; c=relaxed/simple;
	bh=Jl6DjAAGFcrwb6awcc4A5zUZF2UJ7AtYBzoQg+9Q6lI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HR0Kof61a/Zy6oagRlONjHcTP/OOBYmjjztjT98IvgMvJPGIODWkc9kF7czxygCdnwtHBxLLi2tKjB9F0IpbzopCvBsf/RdQT/ie3C48wzHRPCFF+3W96cPtcqpMGDlrfF4iQV3FtWSl10t8crXHz4o5EaaqpQiYGKYDZLb2gkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=em4fbnJH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CC84C4CEC3;
	Fri, 18 Oct 2024 04:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729224868;
	bh=Jl6DjAAGFcrwb6awcc4A5zUZF2UJ7AtYBzoQg+9Q6lI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=em4fbnJHUErUZk7r+JVypHFpmM/vGNmqN/uA13nU1QGTYSgb2a2dnxvmHlRCTst3/
	 9pC/qvFqdCIjBv05mQsqgfZMzrjjf1UkmXCWlDmSJNc2/odX9QLJ+3V4/ZiNyF6cAW
	 VUOY2XVgwOnhjQem6shf+TyingO+eRQuc2ZBhcl4gq4eoognvp75zPMOBKDw2PfMTX
	 SPDto9dLzJLuf/FNtGzZYcrQ8kji/zKBuZKwxhTZQWvUnJneF/TTfsm03gVd/rnNDo
	 MwXKL4xNDsIpPPI4/4Lq/0aQ+CfkNC4dB1Ad5i8s7Vr6FHrtUQqxQSXWzrhagAUOTv
	 MArAhOZVSNRIQ==
Date: Fri, 18 Oct 2024 06:14:03 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
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
 Niklas =?UTF-8?B?U8O2ZGVybHVuZA==?= <niklas.soderlund@ragnatech.se>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Kieran Bingham
 <kieran.bingham+renesas@ideasonboard.com>, Mikhail Ulyanov
 <mikhail.ulyanov@cogentembedded.com>, Jacob Chen <jacob-chen@iotwrt.com>,
 Heiko Stuebner <heiko@sntech.de>, Dafna Hirschfeld <dafna@fastmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 =?UTF-8?B?xYF1a2Fzeg==?= Stelmach <l.stelmach@samsung.com>, Andrzej
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
 <skomatineni@nvidia.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 linux-media@vger.kernel.org
Subject: Re: [PATCHv2 01/10] media: videobuf2-core: update vb2_thread if
 wait_finish/prepare are NULL
Message-ID: <20241018061403.318ce951@foz.lan>
In-Reply-To: <8ec79f05-b4a4-4a60-b10f-9ce2dd55bde2@xs4all.nl>
References: <20241014-vb2-wait-v1-0-8c3ee25c618c@xs4all.nl>
	<20241014-vb2-wait-v1-1-8c3ee25c618c@xs4all.nl>
	<8ec79f05-b4a4-4a60-b10f-9ce2dd55bde2@xs4all.nl>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Thu, 17 Oct 2024 17:09:23 +0200
Hans Verkuil <hverkuil@xs4all.nl> escreveu:

> The vb2_thread is used for DVB support. This will queue and dequeue buffers
> automatically.
> 
> It calls wait_finish/prepare around vb2_core_dqbuf() and vb2_core_qbuf(),
> but that assumes all drivers have these ops set. But that will change
> due to commit 88785982a19d ("media: vb2: use lock if wait_prepare/finish
> are NULL").
> 
> So instead just check if the callback is available, and if not, use
> q->lock, just as __vb2_wait_for_done_vb() does.
> 
> Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>

LGTM.

Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

> ---
> I'm just updating this patch, not the others in this series.
> 
> Changes since v1:
> - move the locking code inside the 'if (!threadio->stop)'
> - do the same for vb2_core_qbuf()
> ---
>  .../media/common/videobuf2/videobuf2-core.c   | 26 ++++++++++++++-----
>  1 file changed, 20 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index d064e0664851..d2275c878ea9 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -3218,10 +3218,17 @@ static int vb2_thread(void *data)
>  				continue;
>  			prequeue--;
>  		} else {
> -			call_void_qop(q, wait_finish, q);
> -			if (!threadio->stop)
> +			if (!threadio->stop) {
> +				if (q->ops->wait_finish)
> +					call_void_qop(q, wait_finish, q);
> +				else if (q->lock)
> +					mutex_lock(q->lock);
>  				ret = vb2_core_dqbuf(q, &index, NULL, 0);
> -			call_void_qop(q, wait_prepare, q);
> +				if (q->ops->wait_prepare)
> +					call_void_qop(q, wait_prepare, q);
> +				else if (q->lock)
> +					mutex_unlock(q->lock);
> +			}
>  			dprintk(q, 5, "file io: vb2_dqbuf result: %d\n", ret);
>  			if (!ret)
>  				vb = vb2_get_buffer(q, index);
> @@ -3233,12 +3240,19 @@ static int vb2_thread(void *data)
>  		if (vb->state != VB2_BUF_STATE_ERROR)
>  			if (threadio->fnc(vb, threadio->priv))
>  				break;
> -		call_void_qop(q, wait_finish, q);
>  		if (copy_timestamp)
>  			vb->timestamp = ktime_get_ns();
> -		if (!threadio->stop)
> +		if (!threadio->stop) {
> +			if (q->ops->wait_finish)
> +				call_void_qop(q, wait_finish, q);
> +			else if (q->lock)
> +				mutex_lock(q->lock);
>  			ret = vb2_core_qbuf(q, vb, NULL, NULL);
> -		call_void_qop(q, wait_prepare, q);
> +			if (q->ops->wait_prepare)
> +				call_void_qop(q, wait_prepare, q);
> +			else if (q->lock)
> +				mutex_unlock(q->lock);
> +		}
>  		if (ret || threadio->stop)
>  			break;
>  	}



Thanks,
Mauro

