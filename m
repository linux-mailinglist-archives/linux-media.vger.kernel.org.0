Return-Path: <linux-media+bounces-19627-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C89999D719
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 21:16:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A08361C223B1
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 19:16:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A2AE1C8781;
	Mon, 14 Oct 2024 19:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="I+k+lY2l"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD891C3035
	for <linux-media@vger.kernel.org>; Mon, 14 Oct 2024 19:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728933367; cv=none; b=RjZFSVnu45P5SHXD9KYXKXI5p4OdHDcpUh2KxmGC9rxiHPb6QwGZyio1tyma9mAEIZySYVZOL1gjj2JAge1MIYIWA9acEnaTWHuKLPUPGTLAcJ88Dd5Z5oXL/UkS5rBMqwib8WD7xJziawGpR4O0ODiR/d8KhyGYQNFVeZYqY7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728933367; c=relaxed/simple;
	bh=RPC/enoRRSqTqaIrtgiz80mzLCmCJp6RRHWN5vftacw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fNr4vgQYqutuh8trw5dt8vcc8IjdlCsQKsI7sAduD6vgSl7baI6CN+327s/IfCXSVuWBfanKoGsqlTQu3jPSm998nEimG/Y4d3muI9zm8V0jmPAmscVa1m1AxfjyoVhAI8fmvHQ0xrwhiw1VPPiMgt44jJIzZ+kltGLyPwOUIDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=I+k+lY2l; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [23.233.251.139])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2D26A8BE;
	Mon, 14 Oct 2024 21:14:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1728933256;
	bh=RPC/enoRRSqTqaIrtgiz80mzLCmCJp6RRHWN5vftacw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I+k+lY2lgPdYZYPvx/0ts/hHEDrnrkqxwS54Gk0bERhhoGsPsKl9B/cZRvjLpDMEl
	 X/dOakJANx9eI1g8frwJWzVms/7X5ug8/5fyAb89Ead4Kq64YMDrXs82G+SNz0f2J2
	 8c8cdXErfec2d8ilDUs0KVvYpLmtn5UGbcIk1H4s=
Date: Mon, 14 Oct 2024 22:15:49 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Tomasz Figa <tfiga@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Andy Walls <awalls@md.metrocast.net>, Yong Zhi <yong.zhi@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>, Dan Scally <djrscally@gmail.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Martin Tuma <martin.tuma@digiteqautomotive.com>,
	Bluecherry Maintainers <maintainers@bluecherrydvr.com>,
	Andrey Utkin <andrey_utkin@fastmail.com>,
	Ismael Luceno <ismael@iodev.co.uk>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Corentin Labbe <clabbe@baylibre.com>,
	Michael Krufky <mkrufky@linuxtv.org>,
	Matt Ranostay <matt@ranostay.sg>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
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
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nas Chung <nas.chung@chipsnmedia.com>,
	Jackson Lee <jackson.lee@chipsnmedia.com>,
	Devarsh Thakkar <devarsht@ti.com>, Bin Liu <bin.liu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
	Jacob Chen <jacob-chen@iotwrt.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Dafna Hirschfeld <dafna@fastmail.com>,
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
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Yong Deng <yong.deng@magewell.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Benoit Parrot <bparrot@ti.com>, Jai Luthra <jai.luthra@linux.dev>,
	Michal Simek <michal.simek@amd.com>,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Jack Zhu <jack.zhu@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH 01/10] media: videobuf2-core: update vb2_thread if
 wait_finish/prepare are NULL
Message-ID: <20241014191549.GB5522@pendragon.ideasonboard.com>
References: <20241014-vb2-wait-v1-0-8c3ee25c618c@xs4all.nl>
 <20241014-vb2-wait-v1-1-8c3ee25c618c@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241014-vb2-wait-v1-1-8c3ee25c618c@xs4all.nl>

Hi Hans,

Thank you for the patch.

On Mon, Oct 14, 2024 at 05:06:28PM +0200, Hans Verkuil wrote:
> For read/write support the vb2_thread is used. This will queue and
> dequeue buffers automatically to provide the read() or write() feature.
> 
> It calls wait_finish/prepare around vb2_core_dqbuf() and vb2_core_qbuf(),
> but that assumes all drivers have these ops set. But that will change
> due to commit 88785982a19d ("media: vb2: use lock if wait_prepare/finish
> are NULL").
> 
> So instead check if the callback is available, and if not, use q->lock,
> just as __vb2_wait_for_done_vb() does.
> 
> It was also used around vb2_core_qbuf(), but VIDIOC_QBUF doesn't
> need this since it doesn't do a blocking wait, so just drop the
> wait_finish/prepare callbacks around vb2_core_qbuf().
> 
> Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
> ---
>  drivers/media/common/videobuf2/videobuf2-core.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index d064e0664851b26b2da71e0a374c49a2d2c5e217..e9c1d9e3222323be50b3039eb463384a3d558239 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -3218,10 +3218,16 @@ static int vb2_thread(void *data)
>  				continue;
>  			prequeue--;
>  		} else {
> -			call_void_qop(q, wait_finish, q);
> +			if (q->ops->wait_finish)
> +				call_void_qop(q, wait_finish, q);
> +			else if (q->lock)
> +				mutex_lock(q->lock);

I would still prefer moving vb2_ops_wait_prepare() and
vb2_ops_wait_finish() to videobuf2-core.c and calling the functions
here, instead of locking the mutex directly. I think it would make the
code more readable. I won't block the patch for this, but I think it
would be better.

Also, should we check at queue init time that drivers either set a queue
lock or provide the .wait_prepare() and .wait_finish() operations ?

>  			if (!threadio->stop)
>  				ret = vb2_core_dqbuf(q, &index, NULL, 0);
> -			call_void_qop(q, wait_prepare, q);
> +			if (q->ops->wait_prepare)
> +				call_void_qop(q, wait_prepare, q);
> +			else if (q->lock)
> +				mutex_unlock(q->lock);
>  			dprintk(q, 5, "file io: vb2_dqbuf result: %d\n", ret);
>  			if (!ret)
>  				vb = vb2_get_buffer(q, index);
> @@ -3233,12 +3239,10 @@ static int vb2_thread(void *data)
>  		if (vb->state != VB2_BUF_STATE_ERROR)
>  			if (threadio->fnc(vb, threadio->priv))
>  				break;
> -		call_void_qop(q, wait_finish, q);
>  		if (copy_timestamp)
>  			vb->timestamp = ktime_get_ns();
>  		if (!threadio->stop)
>  			ret = vb2_core_qbuf(q, vb, NULL, NULL);
> -		call_void_qop(q, wait_prepare, q);
>  		if (ret || threadio->stop)
>  			break;
>  	}
> 

-- 
Regards,

Laurent Pinchart

