Return-Path: <linux-media+bounces-38807-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55215B18F50
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 18:05:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F25917AF9E
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 16:05:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08DA324DD0C;
	Sat,  2 Aug 2025 16:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b="V2U4lWFe"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0CE2222B4;
	Sat,  2 Aug 2025 16:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754150689; cv=pass; b=sxMag2MbruIOnkLM3n/jKjQ6RQ/o1pJAmQ+kw6HTaITvkKRJZlR92F0RamDjLPkjCVKg3aGX2Tzm5+8boB6w7HP8hE26bvmn4J3DHkDTYDcrarzdRutp8jMbI/gSqfwV69k4mbHE6mo8bQgOP7Kf95T3bVwRsFMSfNN+fsvNL/c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754150689; c=relaxed/simple;
	bh=Vdg8jHA+16KK4kio/H2ZmPEJzKRxTHixv3V9j/VFf7M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UTsU+4Z8kpiOGtRwXXPLw7vU9vnfpQnimtK/SzOWzz6RQIa8illbVnbGKFllnnsBE6GMm2773m3HM5DEvaylJwFa/ZtvYdnYFAwueOT6hH+vhQZZPqkqul99TsewBn1hgy7xUeqOIdKAX6oXTGTFb/po1phy0l3BUsWxCbTFmxQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b=V2U4lWFe; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1754150560; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WQqpUkXPtrxzpxaZ2hYfl+XOPYKxR/yR0rcNvg04LRAV+Tsf44cBMfyRI8vwmTxp6gChLAQiPjGtlwy/K9/JX//NPyH7DHB8Ls9uEYjsC0dr6CE5dX7KPtJg9DFRaUhNEv2SbmQChbOmcjGtuyBrJWCXYi6NE//Lt6k/YcpSEVQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1754150560; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=xtf+dEyzkoelWC2Fx1wwuEkZQXXlAY749DZ4vNup7Cw=; 
	b=hHHrzU5f++KJzrykhl5qlTExwl012A/zJUgHdgegKkwmNfKI8D3LZOgAROYses2JC1f6mU8skpwAGlagDmezWPJTkb+oc3sAmcoyg1tGLWs3PFHZAsPvG7EG9Z1xxAZTqJneL5PWuQ0spEMdUg74OA81m7ClHn9VORnJf/lBfuU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1754150560;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=xtf+dEyzkoelWC2Fx1wwuEkZQXXlAY749DZ4vNup7Cw=;
	b=V2U4lWFeUsKW1XUdY48JG6pxgTjVc/FBs9bOk6qZ6M6qlPk/usIQI2rIzHjaum91
	Wvxe2kb/Bg9+AdRIIIXAhwCMTefshntu3rhhapqWQg1gEagHTxztLAzLCKJfhTyRN02
	lQWJkogElFkvVK07iEt7bkp3i5NJH/xmkBJnBsA8=
Received: by mx.zohomail.com with SMTPS id 1754150557071593.1499218812709;
	Sat, 2 Aug 2025 09:02:37 -0700 (PDT)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Devarsh Thakkar <devarsht@ti.com>, Benoit Parrot <bparrot@ti.com>,
 Hans Verkuil <hverkuil@kernel.org>, Mike Isely <isely@pobox.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans de Goede <hansg@kernel.org>,
 Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
 Christian Gromm <christian.gromm@microchip.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>,
 Jonathan Corbet <corbet@lwn.net>, Tomasz Figa <tfiga@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Andy Walls <awalls@md.metrocast.net>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Bin Liu <bin.liu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Dmitry Osipenko <digetx@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Mirela Rabulea <mirela.rabulea@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
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
 Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 =?UTF-8?B?xYF1a2Fzeg==?= Stelmach <l.stelmach@samsung.com>,
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
 Steve Longerbeam <slongerbeam@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Paul Kocialkowski <paulk@sys-base.io>,
 Niklas =?UTF-8?B?U8O2ZGVybHVuZA==?= <niklas.soderlund@ragnatech.se>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Corentin Labbe <clabbe@baylibre.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, imx@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-usb@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 mjpeg-users@lists.sourceforge.net,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH 44/65] media: rockchip: rkvdec: Access v4l2_fh from file
Date: Sat, 02 Aug 2025 12:02:27 -0400
Message-ID: <12713603.O9o76ZdvQC@trenzalore>
In-Reply-To: <20250802-media-private-data-v1-44-eb140ddd6a9d@ideasonboard.com>
References:
 <20250802-media-private-data-v1-0-eb140ddd6a9d@ideasonboard.com>
 <20250802-media-private-data-v1-44-eb140ddd6a9d@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-ZohoMailClient: External

Hi Jacopo,

Thanks for the cleanup !

On Saturday, 2 August 2025 05:23:06 EDT Jacopo Mondi wrote:
> The v4l2_fh associated with an open file handle is now guaranteed
> to be available in file->private_data, initialised by v4l2_fh_add().
> 
> Access the v4l2_fh, and from there the driver-specific structure,
> from the file * in all ioctl handlers.
> 
> While at it, remove the now unused fh_to_rkvdec_ctx() macro.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Reviewed-by: Detlev Casanova <detlev.casanova@collabora.com>

> ---
>  drivers/media/platform/rockchip/rkvdec/rkvdec.c | 14 +++++++-------
>  drivers/media/platform/rockchip/rkvdec/rkvdec.h |  5 -----
>  2 files changed, 7 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> b/drivers/media/platform/rockchip/rkvdec/rkvdec.c index
> 481c2488f9ac64e70869ed21e5053cfbc4ed6e0e..9fa80ab3c62b7753e6c992aefd106ee99
> ed375e4 100644 --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -354,7 +354,7 @@ static int rkvdec_try_capture_fmt(struct file *file,
> void *priv, struct v4l2_format *f)
>  {
>  	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
> -	struct rkvdec_ctx *ctx = fh_to_rkvdec_ctx(priv);
> +	struct rkvdec_ctx *ctx = file_to_rkvdec_ctx(file);
>  	const struct rkvdec_coded_fmt_desc *coded_desc;
> 
>  	/*
> @@ -387,7 +387,7 @@ static int rkvdec_try_output_fmt(struct file *file, void
> *priv, struct v4l2_format *f)
>  {
>  	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
> -	struct rkvdec_ctx *ctx = fh_to_rkvdec_ctx(priv);
> +	struct rkvdec_ctx *ctx = file_to_rkvdec_ctx(file);
>  	const struct rkvdec_coded_fmt_desc *desc;
> 
>  	desc = rkvdec_find_coded_fmt_desc(pix_mp->pixelformat);
> @@ -418,7 +418,7 @@ static int rkvdec_try_output_fmt(struct file *file, void
> *priv, static int rkvdec_s_capture_fmt(struct file *file, void *priv,
>  				struct v4l2_format *f)
>  {
> -	struct rkvdec_ctx *ctx = fh_to_rkvdec_ctx(priv);
> +	struct rkvdec_ctx *ctx = file_to_rkvdec_ctx(file);
>  	struct vb2_queue *vq;
>  	int ret;
> 
> @@ -439,7 +439,7 @@ static int rkvdec_s_capture_fmt(struct file *file, void
> *priv, static int rkvdec_s_output_fmt(struct file *file, void *priv,
>  			       struct v4l2_format *f)
>  {
> -	struct rkvdec_ctx *ctx = fh_to_rkvdec_ctx(priv);
> +	struct rkvdec_ctx *ctx = file_to_rkvdec_ctx(file);
>  	struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
>  	const struct rkvdec_coded_fmt_desc *desc;
>  	struct v4l2_format *cap_fmt;
> @@ -504,7 +504,7 @@ static int rkvdec_s_output_fmt(struct file *file, void
> *priv, static int rkvdec_g_output_fmt(struct file *file, void *priv,
>  			       struct v4l2_format *f)
>  {
> -	struct rkvdec_ctx *ctx = fh_to_rkvdec_ctx(priv);
> +	struct rkvdec_ctx *ctx = file_to_rkvdec_ctx(file);
> 
>  	*f = ctx->coded_fmt;
>  	return 0;
> @@ -513,7 +513,7 @@ static int rkvdec_g_output_fmt(struct file *file, void
> *priv, static int rkvdec_g_capture_fmt(struct file *file, void *priv,
>  				struct v4l2_format *f)
>  {
> -	struct rkvdec_ctx *ctx = fh_to_rkvdec_ctx(priv);
> +	struct rkvdec_ctx *ctx = file_to_rkvdec_ctx(file);
> 
>  	*f = ctx->decoded_fmt;
>  	return 0;
> @@ -532,7 +532,7 @@ static int rkvdec_enum_output_fmt(struct file *file,
> void *priv, static int rkvdec_enum_capture_fmt(struct file *file, void
> *priv, struct v4l2_fmtdesc *f)
>  {
> -	struct rkvdec_ctx *ctx = fh_to_rkvdec_ctx(priv);
> +	struct rkvdec_ctx *ctx = file_to_rkvdec_ctx(file);
>  	u32 fourcc;
> 
>  	fourcc = rkvdec_enum_decoded_fmt(ctx, f->index, ctx->image_fmt);
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> b/drivers/media/platform/rockchip/rkvdec/rkvdec.h index
> 35effe9467845fdfc4ffea432211d1d2e75a08b0..481aaa4bffe975fa106fb22e78bef90ad
> e86a6cf 100644 --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> @@ -124,11 +124,6 @@ struct rkvdec_ctx {
>  	void *priv;
>  };
> 
> -static inline struct rkvdec_ctx *fh_to_rkvdec_ctx(struct v4l2_fh *fh)
> -{
> -	return container_of(fh, struct rkvdec_ctx, fh);
> -}
> -
>  static inline struct rkvdec_ctx *file_to_rkvdec_ctx(struct file *filp)
>  {
>  	return container_of(file_to_v4l2_fh(filp), struct rkvdec_ctx, fh);





