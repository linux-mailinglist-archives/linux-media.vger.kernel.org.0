Return-Path: <linux-media+bounces-38962-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A27FFB1C42E
	for <lists+linux-media@lfdr.de>; Wed,  6 Aug 2025 12:24:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6DEC3A46A0
	for <lists+linux-media@lfdr.de>; Wed,  6 Aug 2025 10:24:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEB2928B3F9;
	Wed,  6 Aug 2025 10:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JrWPG7JK"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30AD123FC4C;
	Wed,  6 Aug 2025 10:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754475847; cv=none; b=XkwRRFRgZt4HPki0UTArTS8dLh9L823eepoEvGYlVA15oIcIkg0LVa+QAX9jRKy94bdMD/HIQ+HGuQUi69WqaNYei0uuVEgFCHMABJUr7dS/wql/wPuOcPNsL2IbL4AyV5cw+IrYNNXFkmstFUdVrkoJZN+b+Bpih1Yr5ng903E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754475847; c=relaxed/simple;
	bh=l70ptxZLQqmas0XfEsGv6By1cn6ZG33TtWo6AIwUVzY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=a5DNFNG4YvwatJvJI72jUJbrarB1GPvwARQt3KK6TrI4o+LkADy4RRLo19LMC25g9civvXukMVyIuqEZ7Q026i3hR2Icx2ZMa0Gf7pwIH4hmBE7GBkzaO2D4wRM3uQS2xQyb8c82pg9sr5dIfG85zK4uek/HamfdkZmZ1Pej/20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JrWPG7JK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 554E6C4CEE7;
	Wed,  6 Aug 2025 10:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754475846;
	bh=l70ptxZLQqmas0XfEsGv6By1cn6ZG33TtWo6AIwUVzY=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=JrWPG7JKmLOWiqyPyPHBEwdNSOhBgbgwZKlr53ch1KYUqMW5NJhgqWGt37Bfpu5kz
	 qlK/s7XBDhAWY0ePEoJGylQwPvPthAY1cgG03gzQ0xnpLyNfYH9Ltn6bRO9o6VKIgv
	 8mL/VP5WkpU6/u8BHdtm+iCND03lhAl9fYMzEq00cNwYjcE4kn4g2K7GUjcU1SxcIh
	 oRJMiMZbiPrzXULl22miQXDKokgCLeq9OBsipp+PpQccKHMl2ra3uH+9Je0d/Du/UB
	 W2HdU2A3sG91p4NrtXbhl0f8Q5lRZPdIG4rgH0nDKYqpAltVKIDHkj/Whd+ALlZqaM
	 XT3W88x3kCbog==
Message-ID: <5840e9b2-4940-4343-9f55-58ad3dfb7075@kernel.org>
Date: Wed, 6 Aug 2025 12:23:44 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH 11/65] media: Replace file->private_data access with
 custom functions
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Devarsh Thakkar
 <devarsht@ti.com>, Benoit Parrot <bparrot@ti.com>,
 Hans Verkuil <hverkuil@kernel.org>, Mike Isely <isely@pobox.com>,
 Hans de Goede <hansg@kernel.org>,
 Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
 Christian Gromm <christian.gromm@microchip.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alex Shi
 <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
 Dongliang Mu <dzm91@hust.edu.cn>, Jonathan Corbet <corbet@lwn.net>,
 Tomasz Figa <tfiga@chromium.org>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Andy Walls <awalls@md.metrocast.net>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Bin Liu <bin.liu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Dmitry Osipenko <digetx@gmail.com>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Mirela Rabulea <mirela.rabulea@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Michal Simek <michal.simek@amd.com>, Ming Qian <ming.qian@nxp.com>,
 Zhou Peng <eagle.zhou@nxp.com>, Xavier Roumegue
 <xavier.roumegue@oss.nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
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
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 =?UTF-8?Q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>,
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
 Steve Longerbeam <slongerbeam@gmail.com>, Maxime Ripard
 <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Corentin Labbe <clabbe@baylibre.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, imx@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-usb@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mjpeg-users@lists.sourceforge.net
References: <20250802-media-private-data-v1-0-eb140ddd6a9d@ideasonboard.com>
 <20250802-media-private-data-v1-11-eb140ddd6a9d@ideasonboard.com>
 <49e753f4-f626-49ae-bf23-d2aecfcc6282@kernel.org>
 <20250806094822.GA24768@pendragon.ideasonboard.com>
Content-Language: en-US, nl
In-Reply-To: <20250806094822.GA24768@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/08/2025 11:48, Laurent Pinchart wrote:
> Hi Hans,
> 
> On Wed, Aug 06, 2025 at 10:16:37AM +0200, Hans Verkuil wrote:
>> On 02/08/2025 11:22, Jacopo Mondi wrote:
>>> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>>
>>> Accessing file->private_data manually to retrieve the v4l2_fh pointer is
>>> error-prone, as the field is a void * and will happily cast implicitly
>>> to any pointer type.
>>>
>>> Replace all remaining locations that read the v4l2_fh pointer directly
>>> from file->private_data and cast it to driver-specific file handle
>>> structures with driver-specific functions that use file_to_v4l2_fh() and
>>> perform the same cast.
>>>
>>> No functional change is intended, this only paves the way to remove
>>> direct accesses to file->private_data and make V4L2 drivers safer.
>>> Other accesses to the field will be addressed separately.
>>>
>>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>>> ---
>>>  drivers/media/pci/ivtv/ivtv-driver.h               |  5 ++++
>>>  drivers/media/pci/ivtv/ivtv-fileops.c              | 10 +++----
>>>  drivers/media/pci/ivtv/ivtv-ioctl.c                |  8 +++---
>>>  drivers/media/platform/allegro-dvt/allegro-core.c  |  7 ++++-
>>>  drivers/media/platform/amlogic/meson-ge2d/ge2d.c   |  8 ++++--
>>>  .../media/platform/chips-media/coda/coda-common.c  |  7 ++++-
>>>  .../platform/chips-media/wave5/wave5-helper.c      |  2 +-
>>>  .../media/platform/chips-media/wave5/wave5-vpu.h   |  5 ++++
>>>  drivers/media/platform/m2m-deinterlace.c           |  7 ++++-
>>>  .../media/platform/mediatek/jpeg/mtk_jpeg_core.c   |  7 ++++-
>>>  drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c  |  7 ++++-
>>>  .../media/platform/mediatek/mdp3/mtk-mdp3-m2m.c    |  7 ++++-
>>>  .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c   |  2 +-
>>>  .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h   |  5 ++++
>>>  .../mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c   |  2 +-
>>>  .../mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h   |  5 ++++
>>>  drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c     |  7 ++++-
>>>  drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c |  7 ++++-
>>>  drivers/media/platform/nxp/mx2_emmaprp.c           |  7 ++++-
>>>  drivers/media/platform/renesas/rcar_fdp1.c         |  7 ++++-
>>>  drivers/media/platform/renesas/rcar_jpu.c          |  7 ++++-
>>>  drivers/media/platform/rockchip/rga/rga.c          |  3 +--
>>>  drivers/media/platform/rockchip/rga/rga.h          |  5 ++++
>>>  drivers/media/platform/rockchip/rkvdec/rkvdec.c    |  2 +-
>>>  drivers/media/platform/rockchip/rkvdec/rkvdec.h    |  5 ++++
>>>  .../media/platform/samsung/exynos-gsc/gsc-core.h   |  6 +++++
>>>  .../media/platform/samsung/exynos-gsc/gsc-m2m.c    |  6 ++---
>>>  .../media/platform/samsung/exynos4-is/fimc-core.h  |  5 ++++
>>>  .../media/platform/samsung/exynos4-is/fimc-m2m.c   |  2 +-
>>>  drivers/media/platform/samsung/s5p-g2d/g2d.c       |  7 +++--
>>>  .../media/platform/samsung/s5p-jpeg/jpeg-core.c    |  9 +++++--
>>>  drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c   |  6 ++---
>>>  .../platform/samsung/s5p-mfc/s5p_mfc_common.h      |  6 +++++
>>>  drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c   |  7 ++++-
>>>  drivers/media/platform/st/sti/delta/delta-v4l2.c   | 26 +++++++++++-------
>>>  drivers/media/platform/st/sti/hva/hva-v4l2.c       | 31 ++++++++++++----------
>>>  drivers/media/platform/st/sti/hva/hva.h            |  2 --
>>>  drivers/media/platform/st/stm32/dma2d/dma2d.c      |  7 +++--
>>>  drivers/media/platform/sunxi/sun8i-di/sun8i-di.c   |  3 +--
>>>  .../platform/sunxi/sun8i-rotate/sun8i_rotate.c     |  3 +--
>>>  drivers/media/platform/ti/omap3isp/ispvideo.c      |  4 +--
>>>  drivers/media/platform/ti/omap3isp/ispvideo.h      |  6 +++++
>>>  drivers/media/platform/verisilicon/hantro.h        |  5 ++++
>>>  drivers/media/platform/verisilicon/hantro_drv.c    |  3 +--
>>>  drivers/staging/media/imx/imx-media-csc-scaler.c   |  7 ++++-
>>>  drivers/staging/media/meson/vdec/vdec.c            | 24 ++++++-----------
>>>  drivers/staging/media/meson/vdec/vdec.h            |  5 ++++
>>>  drivers/staging/media/sunxi/cedrus/cedrus.c        |  3 +--
>>>  drivers/staging/media/sunxi/cedrus/cedrus.h        |  5 ++++
>>>  drivers/staging/media/sunxi/cedrus/cedrus_video.c  |  5 ----
>>>  50 files changed, 237 insertions(+), 100 deletions(-)
>>>
>>> diff --git a/drivers/media/pci/ivtv/ivtv-driver.h b/drivers/media/pci/ivtv/ivtv-driver.h
>>> index a6ffa99e16bc64a5b7d3e48c1ab32b49a7989242..cad548b28e360ecfe2bcb9fcb5d12cd8823c3727 100644
>>> --- a/drivers/media/pci/ivtv/ivtv-driver.h
>>> +++ b/drivers/media/pci/ivtv/ivtv-driver.h
>>> @@ -388,6 +388,11 @@ static inline struct ivtv_open_id *fh2id(struct v4l2_fh *fh)
>>>  	return container_of(fh, struct ivtv_open_id, fh);
>>>  }
>>>  
>>> +static inline struct ivtv_open_id *file2id(struct file *filp)
>>> +{
>>> +	return container_of(file_to_v4l2_fh(filp), struct ivtv_open_id, fh);
>>
>> Why not write:
>>
>> 	return fh2id(file_to_v4l2_fh(filp));
>>
>> Same for all other drivers that do this. I prefer to have the contained_of()
>> in just one place.
> 
> Because fh2id gets removed in "[PATCH 57/65] media: ivtv: Access v4l2_fh
> from file". I can use it in this patch and drop it later, would you
> prefer that ?

Based on the irc discussion some drivers need both, so yes, I prefer that the
file2foo inline calls the fh2foo inline.

Regards,

	Hans

> 
>>> +}
>>> +
>>>  struct yuv_frame_info
>>>  {
>>>  	u32 update;
>>
>> <snip>
>>
>>> diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
>>> index 1f134e08923a528cc676f825da68951c97ac2f25..74977f3ae4844022c04de877f31b4fc6aaac0749 100644
>>> --- a/drivers/media/platform/allegro-dvt/allegro-core.c
>>> +++ b/drivers/media/platform/allegro-dvt/allegro-core.c
>>> @@ -302,6 +302,11 @@ struct allegro_channel {
>>>  	unsigned int error;
>>>  };
>>>  
>>> +static inline struct allegro_channel *file_to_channel(struct file *filp)
>>> +{
>>> +	return container_of(file_to_v4l2_fh(filp), struct allegro_channel, fh);
>>> +}
>>> +
>>>  static inline int
>>>  allegro_channel_get_i_frame_qp(struct allegro_channel *channel)
>>>  {
>>> @@ -3229,7 +3234,7 @@ static int allegro_open(struct file *file)
>>>  
>>>  static int allegro_release(struct file *file)
>>>  {
>>> -	struct allegro_channel *channel = fh_to_channel(file->private_data);
>>> +	struct allegro_channel *channel = file_to_channel(file);
>>
>> So a file_to_channel inline function was added, but it is used in just one
>> place.
>>
>> I would prefer to just drop the inline function and instead write:
>>
>> 	struct allegro_channel *channel = fh_to_channel(file_to_v4l2_fh(file));
>>
>> If this is needed in two or more places, then the extra inline makes sense,
>> but it is a fairly common pattern that it is only needed in the release function.
>>
>> Adding a new inline just for that seems overkill to me.
> 
> file_to_channel() gets used in more places in "[PATCH 29/65] media:
> allegro: Access v4l2_fh from file", where fh_to_channel() is dropped.
> I'd rather keep it in this patch instead of having to modify the
> allegro_release() function in patch 29/65.
> 
>>>  
>>>  	v4l2_m2m_ctx_release(channel->fh.m2m_ctx);
>>>  
> 


