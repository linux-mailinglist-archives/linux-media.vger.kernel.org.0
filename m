Return-Path: <linux-media+bounces-39054-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3D2B1D8D6
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 15:18:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77F373A2126
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 13:18:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1FE725BEE5;
	Thu,  7 Aug 2025 13:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JrXszesK"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03371238C26;
	Thu,  7 Aug 2025 13:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754572724; cv=none; b=aDf086oprbcXKiFpp9n+rxgdGCU0Ckwu+D8E9LGTgAiIy1mwW7U7hX0omrWrQu3WfHtsU3K3ghGvNVh0b/yv7QE/sLVtJdG9G/3zIDBbNSMOdxiYgOik9ZsAuoWm8pcedjXJpuo1c+zpXS6JSPk7Ri3HZSxblExpn7sigy0khw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754572724; c=relaxed/simple;
	bh=jhZGuKs+VTL1EX9JQsLLNKW9dU7Cq1mi1XfmDpxGgmo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AGT/DfvD9gGdlmfcdAziBCe8fsiivrt5X0MW/T/lxJCcx7A/IV88SEBgX32Gbqs/OYaNMnY0+ZzTqgeQW1gQxMK1UUcUaCBGsDxPaOLeqYDVWvmOhSXvBVd/o6JOPDpcCyhjEPtkqvKrxTH4CqSUc0WxIyaNPVN9IfviZGG1Paw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JrXszesK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E7EEC4CEEB;
	Thu,  7 Aug 2025 13:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754572721;
	bh=jhZGuKs+VTL1EX9JQsLLNKW9dU7Cq1mi1XfmDpxGgmo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JrXszesK5tUM43V2eGqUN+jLW7uAsSpNpdAmHts3xnx9QnJBpsYabAVOkIMuN0hlu
	 vzSFO46kPooQ1U2SGy2fglffZP201jX0qjnxVu3is1h2rPaX0wgEZlqC1slHgg6arf
	 yfim2V/46ZQzB6iWcvcGW/VFgwkYTHHWrZeMvCx5Q571Hhw5KHIT3k0pRTF/MjEovO
	 ZwltMIlwKlapLaLNAQpAk4dMiYSWyUMDBcDlSWqJ56K+t555RJyDC/bTgOZ+V4Nys1
	 PFvalFsiCbVAcywS7w3AHHACq/81AbcrBbBOyU/09/Ie/BhylPBBz3NbkFZV04DH0t
	 fUmdplWqOQxWQ==
Message-ID: <8c24481d-dfdf-4923-9629-3f6b074c27da@kernel.org>
Date: Thu, 7 Aug 2025 15:18:19 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 58/65] media: zoran: Remove access to __fh
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
 <20250802-media-private-data-v1-58-eb140ddd6a9d@ideasonboard.com>
 <d8875dea-aa04-41fc-b1b4-519d06ed6cba@kernel.org>
 <20250807123157.GF11583@pendragon.ideasonboard.com>
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Content-Language: en-US
In-Reply-To: <20250807123157.GF11583@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/7/25 14:31, Laurent Pinchart wrote:
> On Thu, Aug 07, 2025 at 08:58:01AM +0200, Hans Verkuil wrote:
>> On 02/08/2025 11:23, Jacopo Mondi wrote:
>>> The __fh parameter is assigned to an unsued variable. Remove it
>>> and remove the unused struct zoran_fh type.
>>>
>>> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>>> ---
>>>  drivers/media/pci/zoran/zoran.h        | 6 ------
>>>  drivers/media/pci/zoran/zoran_driver.c | 3 +--
>>>  2 files changed, 1 insertion(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/media/pci/zoran/zoran.h b/drivers/media/pci/zoran/zoran.h
>>> index 1cd990468d3de9db8b14b72483972041c57bfee2..d05e222b392156bf1b3b4c83c6591db642c3c377 100644
>>> --- a/drivers/media/pci/zoran/zoran.h
>>> +++ b/drivers/media/pci/zoran/zoran.h
>>> @@ -154,12 +154,6 @@ struct zoran_jpg_settings {
>>>  
>>>  struct zoran;
>>>  
>>> -/* zoran_fh contains per-open() settings */
>>> -struct zoran_fh {
>>> -	struct v4l2_fh fh;
>>> -	struct zoran *zr;
>>> -};
>>> -
>>>  struct card_info {
>>>  	enum card_type type;
>>>  	char name[32];
>>> diff --git a/drivers/media/pci/zoran/zoran_driver.c b/drivers/media/pci/zoran/zoran_driver.c
>>> index f42f596d3e6295e31e3b33cd83c5f7243911bd30..ec7fc1da4cc02f5a344cb49bb9a783c41c758195 100644
>>> --- a/drivers/media/pci/zoran/zoran_driver.c
>>> +++ b/drivers/media/pci/zoran/zoran_driver.c
>>> @@ -511,12 +511,11 @@ static int zoran_s_fmt_vid_cap(struct file *file, void *__fh,
>>
>> This driver uses __fh as the name for the second argument of the ioctl
>> callbacks. Can you take this opportunity to rename it to either 'fh' or 'priv'?
> 
> It's a bit of yak shaving, but not too difficult so it will be addressed
> in the next version (Jacopo already wrote the patches, thanks).
> 
>> Generally it's not a good idea to prefix variables with __ for no good reason.
>>
>> Grepping for __fh also shows two other drivers:
>>
>> drivers/media/platform/chips-media/coda/coda-common.c:#define fh_to_ctx(__fh)   container_of(__fh, struct coda_ctx, fh)
>> drivers/media/platform/samsung/s5p-mfc/s5p_mfc_common.h:#define fh_to_ctx(__fh) container_of(__fh, struct s5p_mfc_ctx, fh)
>>
>> I think it is a good idea to rename __fh to fh there as well.
> 
> That can't be done, otherwise things like
> 
> #define fh_to_ctx(fh)	container_of(fh, struct coda_ctx, fh)
> 
> static inline struct coda_ctx *file_to_ctx(struct file *filp)
> {
> 	return fh_to_ctx(file_to_v4l2_fh(filp));
> }
> 
> will expand in the file_to_ctx() function to
> 
> 	return container_of(file_to_v4l2_fh(filp), struct coda_ctx, file_to_v4l2_fh(filp))

If the fh_to_ctx #define is changed to a static inline, then there is no problem.

That said, it is overkill.

Regards,

	Hans

> 
> We could rename the __fh argument to vfh or v4l2fh, but I think __fh is
> equally good there. It's just the macro argument name.
> 
>>>  			       struct v4l2_format *fmt)
>>>  {
>>>  	struct zoran *zr = video_drvdata(file);
>>> -	struct zoran_fh *fh = __fh;
>>>  	int i;
>>>  	int res = 0;
>>>  
>>>  	if (fmt->fmt.pix.pixelformat == V4L2_PIX_FMT_MJPEG)
>>> -		return zoran_s_fmt_vid_out(file, fh, fmt);
>>> +		return zoran_s_fmt_vid_out(file, __fh, fmt);
>>>  
>>>  	for (i = 0; i < NUM_FORMATS; i++)
>>>  		if (fmt->fmt.pix.pixelformat == zoran_formats[i].fourcc)
> 


