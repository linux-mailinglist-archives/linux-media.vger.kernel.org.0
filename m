Return-Path: <linux-media+bounces-38898-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 91862B1AF7E
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 09:42:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 31AFD189D7CE
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 07:42:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67F1623AE66;
	Tue,  5 Aug 2025 07:42:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413FF23A562
	for <linux-media@vger.kernel.org>; Tue,  5 Aug 2025 07:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754379729; cv=none; b=e1s7Ykd86lkR1lQtRlowTQ1LCFb6qRMRryuqbpozaHP05sQd08FRHld2iheBC+vz87z3yrXUpiIwDNabDFiS4o0YP7n/ah++WIDL4YTW7ufRw5B9lAKmhLMPKQOcX3ATk6figws6uJtS3WqwUtSUoH3GEHXL2zJQm9YahEzOEm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754379729; c=relaxed/simple;
	bh=1qW0jic5qgSouRAJ0K8gWbRDvMtLz1uULmdexDci+H4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y3Ju6jzrIFaYIvabnHYP7FHy/HovSZDSVB2RqhXxFywyJjn1iRnjfOCamzIKSDdZ6uLm5+mOPz5SjknuDSrVPUkbCMtwlbn2r2iZ9Vt9YAiNz0kbtbX3WdoitLtDau4VsePMUY+ALT61qew5r3gXRsqVCQXLjZfUFtLOSWnREtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mtr@pengutronix.de>)
	id 1ujCHA-0005yv-K9; Tue, 05 Aug 2025 09:40:00 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mtr@pengutronix.de>)
	id 1ujCGr-00C0Ka-13;
	Tue, 05 Aug 2025 09:39:41 +0200
Received: from mtr by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mtr@pengutronix.de>)
	id 1ujCGr-00A7fC-02;
	Tue, 05 Aug 2025 09:39:41 +0200
Date: Tue, 5 Aug 2025 09:39:40 +0200
From: Michael Tretter <m.tretter@pengutronix.de>
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
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Bin Liu <bin.liu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
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
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
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
	Paul Kocialkowski <paulk@sys-base.io>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Corentin Labbe <clabbe@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev, linux-usb@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	mjpeg-users@lists.sourceforge.net
Subject: Re: [PATCH 29/65] media: allegro: Access v4l2_fh from file
Message-ID: <aJG1PC0poVY-QZRb@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
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
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Bin Liu <bin.liu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
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
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
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
	Paul Kocialkowski <paulk@sys-base.io>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Corentin Labbe <clabbe@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev, linux-usb@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	mjpeg-users@lists.sourceforge.net
References: <20250802-media-private-data-v1-0-eb140ddd6a9d@ideasonboard.com>
 <20250802-media-private-data-v1-29-eb140ddd6a9d@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250802-media-private-data-v1-29-eb140ddd6a9d@ideasonboard.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

Hi Jacopo,

On Sat, 02 Aug 2025 11:22:51 +0200, Jacopo Mondi wrote:
> The v4l2_fh associated with an open file handle is now guaranteed
> to be available in file->private_data, initialised by v4l2_fh_add().
> 
> Access the v4l2_fh, and from there the driver-specific structure,
> from the file * in all ioctl handlers.
> 
> While at it remove the only left user of fh_to_channel() and remove
> the macro completely.

Thanks for the cleanup!

Minor suggestion below, but even without it

> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Reviewed-by: Michael Tretter <m.tretter@pengutronix.de>

> ---
>  drivers/media/platform/allegro-dvt/allegro-core.c | 18 ++++++++----------
>  1 file changed, 8 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
> index 5e3b1f5d7206d84b8ccb9ea3b3f3f1fe75becf99..81c6afcf2d06f9e39015e49d355346238c5033d8 100644
> --- a/drivers/media/platform/allegro-dvt/allegro-core.c
> +++ b/drivers/media/platform/allegro-dvt/allegro-core.c
> @@ -197,8 +197,6 @@ static const struct regmap_config allegro_sram_config = {
>  	.cache_type = REGCACHE_NONE,
>  };
>  
> -#define fh_to_channel(__fh) container_of(__fh, struct allegro_channel, fh)
> -
>  struct allegro_channel {
>  	struct allegro_dev *dev;
>  	struct v4l2_fh fh;
> @@ -3284,7 +3282,7 @@ static int allegro_enum_fmt_vid(struct file *file, void *fh,
>  static int allegro_g_fmt_vid_cap(struct file *file, void *fh,
>  				 struct v4l2_format *f)
>  {
> -	struct allegro_channel *channel = fh_to_channel(fh);
> +	struct allegro_channel *channel = file_to_channel(file);
>  
>  	f->fmt.pix.field = V4L2_FIELD_NONE;
>  	f->fmt.pix.width = channel->width;
> @@ -3326,7 +3324,7 @@ static int allegro_try_fmt_vid_cap(struct file *file, void *fh,
>  static int allegro_s_fmt_vid_cap(struct file *file, void *fh,
>  				 struct v4l2_format *f)
>  {
> -	struct allegro_channel *channel = fh_to_channel(fh);
> +	struct allegro_channel *channel = file_to_channel(file);
>  	struct vb2_queue *vq;
>  	int err;
>  
> @@ -3350,7 +3348,7 @@ static int allegro_s_fmt_vid_cap(struct file *file, void *fh,
>  static int allegro_g_fmt_vid_out(struct file *file, void *fh,
>  				 struct v4l2_format *f)
>  {
> -	struct allegro_channel *channel = fh_to_channel(fh);
> +	struct allegro_channel *channel = file_to_channel(file);
>  
>  	f->fmt.pix.field = V4L2_FIELD_NONE;
>  
> @@ -3397,7 +3395,7 @@ static int allegro_try_fmt_vid_out(struct file *file, void *fh,
>  static int allegro_s_fmt_vid_out(struct file *file, void *fh,
>  				 struct v4l2_format *f)
>  {
> -	struct allegro_channel *channel = fh_to_channel(fh);
> +	struct allegro_channel *channel = file_to_channel(file);
>  	int err;
>  
>  	err = allegro_try_fmt_vid_out(file, fh, f);
> @@ -3438,7 +3436,7 @@ static int allegro_channel_cmd_start(struct allegro_channel *channel)
>  static int allegro_encoder_cmd(struct file *file, void *fh,
>  			       struct v4l2_encoder_cmd *cmd)
>  {
> -	struct allegro_channel *channel = fh_to_channel(fh);
> +	struct allegro_channel *channel = file_to_channel(file);
>  	int err;
>  
>  	err = v4l2_m2m_ioctl_try_encoder_cmd(file, fh, cmd);
> @@ -3488,7 +3486,7 @@ static int allegro_ioctl_streamon(struct file *file, void *priv,
>  				  enum v4l2_buf_type type)
>  {
>  	struct v4l2_fh *fh = file_to_v4l2_fh(file);
> -	struct allegro_channel *channel = fh_to_channel(fh);
> +	struct allegro_channel *channel = file_to_channel(file);

You could remove the local fh entirely, if you change

	return v4l2_m2m_streamon(file, fh->m2m_ctx, type);

to

	return v4l2_m2m_streamon(file, channel->fh.m2m_ctx, type);

in the allegro_ioctl_streamon() function.

Michael

>  	int err;
>  
>  	if (type == V4L2_BUF_TYPE_VIDEO_CAPTURE) {
> @@ -3503,7 +3501,7 @@ static int allegro_ioctl_streamon(struct file *file, void *priv,
>  static int allegro_g_parm(struct file *file, void *fh,
>  			  struct v4l2_streamparm *a)
>  {
> -	struct allegro_channel *channel = fh_to_channel(fh);
> +	struct allegro_channel *channel = file_to_channel(file);
>  	struct v4l2_fract *timeperframe;
>  
>  	if (a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
> @@ -3520,7 +3518,7 @@ static int allegro_g_parm(struct file *file, void *fh,
>  static int allegro_s_parm(struct file *file, void *fh,
>  			  struct v4l2_streamparm *a)
>  {
> -	struct allegro_channel *channel = fh_to_channel(fh);
> +	struct allegro_channel *channel = file_to_channel(file);
>  	struct v4l2_fract *timeperframe;
>  	int div;
>  
> 
> -- 
> 2.49.0
> 
> 

