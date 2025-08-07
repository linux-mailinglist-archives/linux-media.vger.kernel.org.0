Return-Path: <linux-media+bounces-39000-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A550DB1D343
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 09:27:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 26138564293
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 07:27:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6664923C38C;
	Thu,  7 Aug 2025 07:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HXv8m5DB"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8810F21FF38;
	Thu,  7 Aug 2025 07:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754551617; cv=none; b=uKTfcCQPKFla9ZuGJAy7Cx0KuJaskT0RfjjQf18kJhQ6ekKnK/pyq8ecveaVb8k4a7hN8BXVa29j0eJ0szYAk9DwSUiTL68GJcrsiVem5L+95wgRHuSpoMc2TG/r3tD82pkGdX4KW/cYX2x7jYkO5tjh47OlWfCzxIZ7U86aW1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754551617; c=relaxed/simple;
	bh=jA/fkFcaPP9T15v+HXVc4jZD411tvTX+kQQippvkz0w=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=iXklTPZflEyDjt7CJBiLhSXNvBx7H+OFfCj4A9JdKhK3oX9p1HVMycoHAsskI3jITSxqD0vEEVrGfQZ9FV0slEMsDcTgLBbHSRXbD68fXHNKrVqvgTv+2qrJ/6ZTDnVq4D1sSNDj51Sl7BmPlk1Z+B4mv6KT1MY4SJLlSktLHe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HXv8m5DB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B7BCC4CEEB;
	Thu,  7 Aug 2025 07:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754551617;
	bh=jA/fkFcaPP9T15v+HXVc4jZD411tvTX+kQQippvkz0w=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=HXv8m5DBlRsOYwxR14qxKj5v4vQuZyP9n5Q0BQR0d8nY8ke/z+IPeQRacCKsBCpZV
	 wmBXuI23d6QLiznV61pjiZWKULCv4POwFdPuWVKSxrnCAf7I4A/cJAIbDOIAyZUiWq
	 y9X3ouYnXFrMWo0ua30zcqhnCYgL1TNePL1Pml+3AcfHJYgwQtWLhZr3vT/TW6vKLK
	 bbxDXf1HqgqIJsWQ4ojwYl58GJnuJmDRY6iHo4pr4kTuxaNVOMrsp+tQ34+C8twXuH
	 CuW6xIQqumBTB7Yq347TsueV9Iau/w/P6wGQDsKF4+CRX8q5eqAM1RpvUhufib6rRl
	 BMfNpTuX5tQnw==
Message-ID: <5bda2b73-0538-41d1-b065-9b541a027475@kernel.org>
Date: Thu, 7 Aug 2025 09:26:34 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH 65/65] media: v4l2-ioctl: Stop passing fh pointer to ioctl
 handlers
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Devarsh Thakkar
 <devarsht@ti.com>, Benoit Parrot <bparrot@ti.com>,
 Hans Verkuil <hverkuil@kernel.org>, Mike Isely <isely@pobox.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, imx@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-usb@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mjpeg-users@lists.sourceforge.net
References: <20250802-media-private-data-v1-0-eb140ddd6a9d@ideasonboard.com>
 <20250802-media-private-data-v1-65-eb140ddd6a9d@ideasonboard.com>
Content-Language: en-US, nl
In-Reply-To: <20250802-media-private-data-v1-65-eb140ddd6a9d@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/08/2025 11:23, Jacopo Mondi wrote:
> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Now that all drivers access the v4l2_fh from the file structure, there
> is no need to pass it as an explicit argument to ioctl handlers. Set the
> argument to NULL in the w__video_do_ioctl(), and drop the name of the
> void *fh argument in the ioctl handler declarations to indicate it is
> not used.
> 
> The argument could be removed altogether with a mechanical change
> (probably using coccinelle), but there are plans to pass a new argument
> to the ioctl handlers in the near future. The tree-wide change to remove
> the argument, only to add another one soon after, would be too much
> churn.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  drivers/media/v4l2-core/v4l2-ioctl.c |   5 +-
>  include/media/v4l2-ioctl.h           | 236 +++++++++++++++++------------------
>  2 files changed, 120 insertions(+), 121 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 44c2f5ef3dae407d9786c5278d13efc982be2ff0..248a0b5b56ec7a09f2d4c61114f81aa5a9b8b041 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -3078,7 +3078,6 @@ static long __video_do_ioctl(struct file *file,
>  	bool write_only = false;
>  	struct v4l2_ioctl_info default_info;
>  	const struct v4l2_ioctl_info *info;
> -	void *fh = file_to_v4l2_fh(file);
>  	struct v4l2_fh *vfh = NULL;
>  	int dev_debug = vfd->dev_debug;
>  	long ret = -ENOTTY;
> @@ -3140,11 +3139,11 @@ static long __video_do_ioctl(struct file *file,
>  
>  	write_only = _IOC_DIR(cmd) == _IOC_WRITE;
>  	if (info != &default_info) {
> -		ret = info->func(ops, file, fh, arg);
> +		ret = info->func(ops, file, NULL, arg);
>  	} else if (!ops->vidioc_default) {
>  		ret = -ENOTTY;
>  	} else {
> -		ret = ops->vidioc_default(file, fh,
> +		ret = ops->vidioc_default(file, NULL,
>  			vfh ? v4l2_prio_check(vfd->prio, vfh->prio) >= 0 : 0,
>  			cmd, arg);
>  	}

drivers/media/v4l2-core/v4l2-compat-ioctl32.c also calls ops->vidioc_query_ext_ctrl
directly, but still passes the fh as second argument: that needs to be replaced by
a NULL pointer as well. That should be fixed in this patch as well.

Regarding v4l2-ioctl.c: I would like a follow-up patch that pushes the NULL pointer
down into each ioctl helper function. I.e. drop the 'void *fh' argument in the
struct v4l2_ioctl_info 'func' callback, and all callbacks like v4l_g_fmt() just
replace 'fh' by 'NULL' when they call the vidioc op.

Part of it is that the core functions currently suggest that the second argument is
a filehandle (since it's still named 'fh'), which is obviously wrong. And I also think
that the core framework shouldn't use a dummy second argument at all. I admit that
changing all vidioc callbacks in the whole subsystem to drop the second argument is
too much churn, but for this core file I think it is something that should be done.

Regards,

	Hans

> diff --git a/include/media/v4l2-ioctl.h b/include/media/v4l2-ioctl.h
> index 82695c3a300a73219f262fb556ed61a8f09d273e..223e2c7a3516fc96fb486ab64226163e52f775a6 100644
> --- a/include/media/v4l2-ioctl.h
> +++ b/include/media/v4l2-ioctl.h
> @@ -293,144 +293,144 @@ struct v4l2_ioctl_ops {
>  	/* ioctl callbacks */
>  
>  	/* VIDIOC_QUERYCAP handler */
> -	int (*vidioc_querycap)(struct file *file, void *fh,
> +	int (*vidioc_querycap)(struct file *file, void *,
>  			       struct v4l2_capability *cap);
>  
>  	/* VIDIOC_ENUM_FMT handlers */
> -	int (*vidioc_enum_fmt_vid_cap)(struct file *file, void *fh,
> +	int (*vidioc_enum_fmt_vid_cap)(struct file *file, void *,
>  				       struct v4l2_fmtdesc *f);
> -	int (*vidioc_enum_fmt_vid_overlay)(struct file *file, void *fh,
> +	int (*vidioc_enum_fmt_vid_overlay)(struct file *file, void *,
>  					   struct v4l2_fmtdesc *f);
> -	int (*vidioc_enum_fmt_vid_out)(struct file *file, void *fh,
> +	int (*vidioc_enum_fmt_vid_out)(struct file *file, void *,
>  				       struct v4l2_fmtdesc *f);
> -	int (*vidioc_enum_fmt_sdr_cap)(struct file *file, void *fh,
> +	int (*vidioc_enum_fmt_sdr_cap)(struct file *file, void *,
>  				       struct v4l2_fmtdesc *f);
> -	int (*vidioc_enum_fmt_sdr_out)(struct file *file, void *fh,
> +	int (*vidioc_enum_fmt_sdr_out)(struct file *file, void *,
>  				       struct v4l2_fmtdesc *f);
> -	int (*vidioc_enum_fmt_meta_cap)(struct file *file, void *fh,
> +	int (*vidioc_enum_fmt_meta_cap)(struct file *file, void *,
>  					struct v4l2_fmtdesc *f);
> -	int (*vidioc_enum_fmt_meta_out)(struct file *file, void *fh,
> +	int (*vidioc_enum_fmt_meta_out)(struct file *file, void *,
>  					struct v4l2_fmtdesc *f);
>  
>  	/* VIDIOC_G_FMT handlers */
> -	int (*vidioc_g_fmt_vid_cap)(struct file *file, void *fh,
> +	int (*vidioc_g_fmt_vid_cap)(struct file *file, void *,
>  				    struct v4l2_format *f);
> -	int (*vidioc_g_fmt_vid_overlay)(struct file *file, void *fh,
> +	int (*vidioc_g_fmt_vid_overlay)(struct file *file, void *,
>  					struct v4l2_format *f);
> -	int (*vidioc_g_fmt_vid_out)(struct file *file, void *fh,
> +	int (*vidioc_g_fmt_vid_out)(struct file *file, void *,
>  				    struct v4l2_format *f);
> -	int (*vidioc_g_fmt_vid_out_overlay)(struct file *file, void *fh,
> +	int (*vidioc_g_fmt_vid_out_overlay)(struct file *file, void *,
>  					    struct v4l2_format *f);
> -	int (*vidioc_g_fmt_vbi_cap)(struct file *file, void *fh,
> +	int (*vidioc_g_fmt_vbi_cap)(struct file *file, void *,
>  				    struct v4l2_format *f);
> -	int (*vidioc_g_fmt_vbi_out)(struct file *file, void *fh,
> +	int (*vidioc_g_fmt_vbi_out)(struct file *file, void *,
>  				    struct v4l2_format *f);
> -	int (*vidioc_g_fmt_sliced_vbi_cap)(struct file *file, void *fh,
> +	int (*vidioc_g_fmt_sliced_vbi_cap)(struct file *file, void *,
>  					   struct v4l2_format *f);
> -	int (*vidioc_g_fmt_sliced_vbi_out)(struct file *file, void *fh,
> +	int (*vidioc_g_fmt_sliced_vbi_out)(struct file *file, void *,
>  					   struct v4l2_format *f);
> -	int (*vidioc_g_fmt_vid_cap_mplane)(struct file *file, void *fh,
> +	int (*vidioc_g_fmt_vid_cap_mplane)(struct file *file, void *,
>  					   struct v4l2_format *f);
> -	int (*vidioc_g_fmt_vid_out_mplane)(struct file *file, void *fh,
> +	int (*vidioc_g_fmt_vid_out_mplane)(struct file *file, void *,
>  					   struct v4l2_format *f);
> -	int (*vidioc_g_fmt_sdr_cap)(struct file *file, void *fh,
> +	int (*vidioc_g_fmt_sdr_cap)(struct file *file, void *,
>  				    struct v4l2_format *f);
> -	int (*vidioc_g_fmt_sdr_out)(struct file *file, void *fh,
> +	int (*vidioc_g_fmt_sdr_out)(struct file *file, void *,
>  				    struct v4l2_format *f);
> -	int (*vidioc_g_fmt_meta_cap)(struct file *file, void *fh,
> +	int (*vidioc_g_fmt_meta_cap)(struct file *file, void *,
>  				     struct v4l2_format *f);
> -	int (*vidioc_g_fmt_meta_out)(struct file *file, void *fh,
> +	int (*vidioc_g_fmt_meta_out)(struct file *file, void *,
>  				     struct v4l2_format *f);
>  
>  	/* VIDIOC_S_FMT handlers */
> -	int (*vidioc_s_fmt_vid_cap)(struct file *file, void *fh,
> +	int (*vidioc_s_fmt_vid_cap)(struct file *file, void *,
>  				    struct v4l2_format *f);
> -	int (*vidioc_s_fmt_vid_overlay)(struct file *file, void *fh,
> +	int (*vidioc_s_fmt_vid_overlay)(struct file *file, void *,
>  					struct v4l2_format *f);
> -	int (*vidioc_s_fmt_vid_out)(struct file *file, void *fh,
> +	int (*vidioc_s_fmt_vid_out)(struct file *file, void *,
>  				    struct v4l2_format *f);
> -	int (*vidioc_s_fmt_vid_out_overlay)(struct file *file, void *fh,
> +	int (*vidioc_s_fmt_vid_out_overlay)(struct file *file, void *,
>  					    struct v4l2_format *f);
> -	int (*vidioc_s_fmt_vbi_cap)(struct file *file, void *fh,
> +	int (*vidioc_s_fmt_vbi_cap)(struct file *file, void *,
>  				    struct v4l2_format *f);
> -	int (*vidioc_s_fmt_vbi_out)(struct file *file, void *fh,
> +	int (*vidioc_s_fmt_vbi_out)(struct file *file, void *,
>  				    struct v4l2_format *f);
> -	int (*vidioc_s_fmt_sliced_vbi_cap)(struct file *file, void *fh,
> +	int (*vidioc_s_fmt_sliced_vbi_cap)(struct file *file, void *,
>  					   struct v4l2_format *f);
> -	int (*vidioc_s_fmt_sliced_vbi_out)(struct file *file, void *fh,
> +	int (*vidioc_s_fmt_sliced_vbi_out)(struct file *file, void *,
>  					   struct v4l2_format *f);
> -	int (*vidioc_s_fmt_vid_cap_mplane)(struct file *file, void *fh,
> +	int (*vidioc_s_fmt_vid_cap_mplane)(struct file *file, void *,
>  					   struct v4l2_format *f);
> -	int (*vidioc_s_fmt_vid_out_mplane)(struct file *file, void *fh,
> +	int (*vidioc_s_fmt_vid_out_mplane)(struct file *file, void *,
>  					   struct v4l2_format *f);
> -	int (*vidioc_s_fmt_sdr_cap)(struct file *file, void *fh,
> +	int (*vidioc_s_fmt_sdr_cap)(struct file *file, void *,
>  				    struct v4l2_format *f);
> -	int (*vidioc_s_fmt_sdr_out)(struct file *file, void *fh,
> +	int (*vidioc_s_fmt_sdr_out)(struct file *file, void *,
>  				    struct v4l2_format *f);
> -	int (*vidioc_s_fmt_meta_cap)(struct file *file, void *fh,
> +	int (*vidioc_s_fmt_meta_cap)(struct file *file, void *,
>  				     struct v4l2_format *f);
> -	int (*vidioc_s_fmt_meta_out)(struct file *file, void *fh,
> +	int (*vidioc_s_fmt_meta_out)(struct file *file, void *,
>  				     struct v4l2_format *f);
>  
>  	/* VIDIOC_TRY_FMT handlers */
> -	int (*vidioc_try_fmt_vid_cap)(struct file *file, void *fh,
> +	int (*vidioc_try_fmt_vid_cap)(struct file *file, void *,
>  				      struct v4l2_format *f);
> -	int (*vidioc_try_fmt_vid_overlay)(struct file *file, void *fh,
> +	int (*vidioc_try_fmt_vid_overlay)(struct file *file, void *,
>  					  struct v4l2_format *f);
> -	int (*vidioc_try_fmt_vid_out)(struct file *file, void *fh,
> +	int (*vidioc_try_fmt_vid_out)(struct file *file, void *,
>  				      struct v4l2_format *f);
> -	int (*vidioc_try_fmt_vid_out_overlay)(struct file *file, void *fh,
> +	int (*vidioc_try_fmt_vid_out_overlay)(struct file *file, void *,
>  					     struct v4l2_format *f);
> -	int (*vidioc_try_fmt_vbi_cap)(struct file *file, void *fh,
> +	int (*vidioc_try_fmt_vbi_cap)(struct file *file, void *,
>  				      struct v4l2_format *f);
> -	int (*vidioc_try_fmt_vbi_out)(struct file *file, void *fh,
> +	int (*vidioc_try_fmt_vbi_out)(struct file *file, void *,
>  				      struct v4l2_format *f);
> -	int (*vidioc_try_fmt_sliced_vbi_cap)(struct file *file, void *fh,
> +	int (*vidioc_try_fmt_sliced_vbi_cap)(struct file *file, void *,
>  					     struct v4l2_format *f);
> -	int (*vidioc_try_fmt_sliced_vbi_out)(struct file *file, void *fh,
> +	int (*vidioc_try_fmt_sliced_vbi_out)(struct file *file, void *,
>  					     struct v4l2_format *f);
> -	int (*vidioc_try_fmt_vid_cap_mplane)(struct file *file, void *fh,
> +	int (*vidioc_try_fmt_vid_cap_mplane)(struct file *file, void *,
>  					     struct v4l2_format *f);
> -	int (*vidioc_try_fmt_vid_out_mplane)(struct file *file, void *fh,
> +	int (*vidioc_try_fmt_vid_out_mplane)(struct file *file, void *,
>  					     struct v4l2_format *f);
> -	int (*vidioc_try_fmt_sdr_cap)(struct file *file, void *fh,
> +	int (*vidioc_try_fmt_sdr_cap)(struct file *file, void *,
>  				      struct v4l2_format *f);
> -	int (*vidioc_try_fmt_sdr_out)(struct file *file, void *fh,
> +	int (*vidioc_try_fmt_sdr_out)(struct file *file, void *,
>  				      struct v4l2_format *f);
> -	int (*vidioc_try_fmt_meta_cap)(struct file *file, void *fh,
> +	int (*vidioc_try_fmt_meta_cap)(struct file *file, void *,
>  				       struct v4l2_format *f);
> -	int (*vidioc_try_fmt_meta_out)(struct file *file, void *fh,
> +	int (*vidioc_try_fmt_meta_out)(struct file *file, void *,
>  				       struct v4l2_format *f);
>  
>  	/* Buffer handlers */
> -	int (*vidioc_reqbufs)(struct file *file, void *fh,
> +	int (*vidioc_reqbufs)(struct file *file, void *,
>  			      struct v4l2_requestbuffers *b);
> -	int (*vidioc_querybuf)(struct file *file, void *fh,
> +	int (*vidioc_querybuf)(struct file *file, void *,
>  			       struct v4l2_buffer *b);
> -	int (*vidioc_qbuf)(struct file *file, void *fh,
> +	int (*vidioc_qbuf)(struct file *file, void *,
>  			   struct v4l2_buffer *b);
> -	int (*vidioc_expbuf)(struct file *file, void *fh,
> +	int (*vidioc_expbuf)(struct file *file, void *,
>  			     struct v4l2_exportbuffer *e);
> -	int (*vidioc_dqbuf)(struct file *file, void *fh,
> +	int (*vidioc_dqbuf)(struct file *file, void *,
>  			    struct v4l2_buffer *b);
>  
> -	int (*vidioc_create_bufs)(struct file *file, void *fh,
> +	int (*vidioc_create_bufs)(struct file *file, void *,
>  				  struct v4l2_create_buffers *b);
> -	int (*vidioc_prepare_buf)(struct file *file, void *fh,
> +	int (*vidioc_prepare_buf)(struct file *file, void *,
>  				  struct v4l2_buffer *b);
> -	int (*vidioc_remove_bufs)(struct file *file, void *fh,
> +	int (*vidioc_remove_bufs)(struct file *file, void *,
>  				  struct v4l2_remove_buffers *d);
>  
> -	int (*vidioc_overlay)(struct file *file, void *fh, unsigned int i);
> -	int (*vidioc_g_fbuf)(struct file *file, void *fh,
> +	int (*vidioc_overlay)(struct file *file, void *, unsigned int i);
> +	int (*vidioc_g_fbuf)(struct file *file, void *,
>  			     struct v4l2_framebuffer *a);
> -	int (*vidioc_s_fbuf)(struct file *file, void *fh,
> +	int (*vidioc_s_fbuf)(struct file *file, void *,
>  			     const struct v4l2_framebuffer *a);
>  
>  		/* Stream on/off */
> -	int (*vidioc_streamon)(struct file *file, void *fh,
> +	int (*vidioc_streamon)(struct file *file, void *,
>  			       enum v4l2_buf_type i);
> -	int (*vidioc_streamoff)(struct file *file, void *fh,
> +	int (*vidioc_streamoff)(struct file *file, void *,
>  				enum v4l2_buf_type i);
>  
>  		/*
> @@ -438,135 +438,135 @@ struct v4l2_ioctl_ops {
>  		 *
>  		 * Note: ENUMSTD is handled by videodev.c
>  		 */
> -	int (*vidioc_g_std)(struct file *file, void *fh, v4l2_std_id *norm);
> -	int (*vidioc_s_std)(struct file *file, void *fh, v4l2_std_id norm);
> -	int (*vidioc_querystd)(struct file *file, void *fh, v4l2_std_id *a);
> +	int (*vidioc_g_std)(struct file *file, void *, v4l2_std_id *norm);
> +	int (*vidioc_s_std)(struct file *file, void *, v4l2_std_id norm);
> +	int (*vidioc_querystd)(struct file *file, void *, v4l2_std_id *a);
>  
>  		/* Input handling */
> -	int (*vidioc_enum_input)(struct file *file, void *fh,
> +	int (*vidioc_enum_input)(struct file *file, void *,
>  				 struct v4l2_input *inp);
> -	int (*vidioc_g_input)(struct file *file, void *fh, unsigned int *i);
> -	int (*vidioc_s_input)(struct file *file, void *fh, unsigned int i);
> +	int (*vidioc_g_input)(struct file *file, void *, unsigned int *i);
> +	int (*vidioc_s_input)(struct file *file, void *, unsigned int i);
>  
>  		/* Output handling */
> -	int (*vidioc_enum_output)(struct file *file, void *fh,
> +	int (*vidioc_enum_output)(struct file *file, void *,
>  				  struct v4l2_output *a);
> -	int (*vidioc_g_output)(struct file *file, void *fh, unsigned int *i);
> -	int (*vidioc_s_output)(struct file *file, void *fh, unsigned int i);
> +	int (*vidioc_g_output)(struct file *file, void *, unsigned int *i);
> +	int (*vidioc_s_output)(struct file *file, void *, unsigned int i);
>  
>  		/* Control handling */
> -	int (*vidioc_query_ext_ctrl)(struct file *file, void *fh,
> +	int (*vidioc_query_ext_ctrl)(struct file *file, void *,
>  				     struct v4l2_query_ext_ctrl *a);
> -	int (*vidioc_g_ext_ctrls)(struct file *file, void *fh,
> +	int (*vidioc_g_ext_ctrls)(struct file *file, void *,
>  				  struct v4l2_ext_controls *a);
> -	int (*vidioc_s_ext_ctrls)(struct file *file, void *fh,
> +	int (*vidioc_s_ext_ctrls)(struct file *file, void *,
>  				  struct v4l2_ext_controls *a);
> -	int (*vidioc_try_ext_ctrls)(struct file *file, void *fh,
> +	int (*vidioc_try_ext_ctrls)(struct file *file, void *,
>  				    struct v4l2_ext_controls *a);
> -	int (*vidioc_querymenu)(struct file *file, void *fh,
> +	int (*vidioc_querymenu)(struct file *file, void *,
>  				struct v4l2_querymenu *a);
>  
>  	/* Audio ioctls */
> -	int (*vidioc_enumaudio)(struct file *file, void *fh,
> +	int (*vidioc_enumaudio)(struct file *file, void *,
>  				struct v4l2_audio *a);
> -	int (*vidioc_g_audio)(struct file *file, void *fh,
> +	int (*vidioc_g_audio)(struct file *file, void *,
>  			      struct v4l2_audio *a);
> -	int (*vidioc_s_audio)(struct file *file, void *fh,
> +	int (*vidioc_s_audio)(struct file *file, void *,
>  			      const struct v4l2_audio *a);
>  
>  	/* Audio out ioctls */
> -	int (*vidioc_enumaudout)(struct file *file, void *fh,
> +	int (*vidioc_enumaudout)(struct file *file, void *,
>  				 struct v4l2_audioout *a);
> -	int (*vidioc_g_audout)(struct file *file, void *fh,
> +	int (*vidioc_g_audout)(struct file *file, void *,
>  			       struct v4l2_audioout *a);
> -	int (*vidioc_s_audout)(struct file *file, void *fh,
> +	int (*vidioc_s_audout)(struct file *file, void *,
>  			       const struct v4l2_audioout *a);
> -	int (*vidioc_g_modulator)(struct file *file, void *fh,
> +	int (*vidioc_g_modulator)(struct file *file, void *,
>  				  struct v4l2_modulator *a);
> -	int (*vidioc_s_modulator)(struct file *file, void *fh,
> +	int (*vidioc_s_modulator)(struct file *file, void *,
>  				  const struct v4l2_modulator *a);
>  	/* Crop ioctls */
> -	int (*vidioc_g_pixelaspect)(struct file *file, void *fh,
> +	int (*vidioc_g_pixelaspect)(struct file *file, void *,
>  				    int buf_type, struct v4l2_fract *aspect);
> -	int (*vidioc_g_selection)(struct file *file, void *fh,
> +	int (*vidioc_g_selection)(struct file *file, void *,
>  				  struct v4l2_selection *s);
> -	int (*vidioc_s_selection)(struct file *file, void *fh,
> +	int (*vidioc_s_selection)(struct file *file, void *,
>  				  struct v4l2_selection *s);
>  	/* Compression ioctls */
> -	int (*vidioc_g_jpegcomp)(struct file *file, void *fh,
> +	int (*vidioc_g_jpegcomp)(struct file *file, void *,
>  				 struct v4l2_jpegcompression *a);
> -	int (*vidioc_s_jpegcomp)(struct file *file, void *fh,
> +	int (*vidioc_s_jpegcomp)(struct file *file, void *,
>  				 const struct v4l2_jpegcompression *a);
> -	int (*vidioc_g_enc_index)(struct file *file, void *fh,
> +	int (*vidioc_g_enc_index)(struct file *file, void *,
>  				  struct v4l2_enc_idx *a);
> -	int (*vidioc_encoder_cmd)(struct file *file, void *fh,
> +	int (*vidioc_encoder_cmd)(struct file *file, void *,
>  				  struct v4l2_encoder_cmd *a);
> -	int (*vidioc_try_encoder_cmd)(struct file *file, void *fh,
> +	int (*vidioc_try_encoder_cmd)(struct file *file, void *,
>  				      struct v4l2_encoder_cmd *a);
> -	int (*vidioc_decoder_cmd)(struct file *file, void *fh,
> +	int (*vidioc_decoder_cmd)(struct file *file, void *,
>  				  struct v4l2_decoder_cmd *a);
> -	int (*vidioc_try_decoder_cmd)(struct file *file, void *fh,
> +	int (*vidioc_try_decoder_cmd)(struct file *file, void *,
>  				      struct v4l2_decoder_cmd *a);
>  
>  	/* Stream type-dependent parameter ioctls */
> -	int (*vidioc_g_parm)(struct file *file, void *fh,
> +	int (*vidioc_g_parm)(struct file *file, void *,
>  			     struct v4l2_streamparm *a);
> -	int (*vidioc_s_parm)(struct file *file, void *fh,
> +	int (*vidioc_s_parm)(struct file *file, void *,
>  			     struct v4l2_streamparm *a);
>  
>  	/* Tuner ioctls */
> -	int (*vidioc_g_tuner)(struct file *file, void *fh,
> +	int (*vidioc_g_tuner)(struct file *file, void *,
>  			      struct v4l2_tuner *a);
> -	int (*vidioc_s_tuner)(struct file *file, void *fh,
> +	int (*vidioc_s_tuner)(struct file *file, void *,
>  			      const struct v4l2_tuner *a);
> -	int (*vidioc_g_frequency)(struct file *file, void *fh,
> +	int (*vidioc_g_frequency)(struct file *file, void *,
>  				  struct v4l2_frequency *a);
> -	int (*vidioc_s_frequency)(struct file *file, void *fh,
> +	int (*vidioc_s_frequency)(struct file *file, void *,
>  				  const struct v4l2_frequency *a);
> -	int (*vidioc_enum_freq_bands)(struct file *file, void *fh,
> +	int (*vidioc_enum_freq_bands)(struct file *file, void *,
>  				      struct v4l2_frequency_band *band);
>  
>  	/* Sliced VBI cap */
> -	int (*vidioc_g_sliced_vbi_cap)(struct file *file, void *fh,
> +	int (*vidioc_g_sliced_vbi_cap)(struct file *file, void *,
>  				       struct v4l2_sliced_vbi_cap *a);
>  
>  	/* Log status ioctl */
> -	int (*vidioc_log_status)(struct file *file, void *fh);
> +	int (*vidioc_log_status)(struct file *file, void *);
>  
> -	int (*vidioc_s_hw_freq_seek)(struct file *file, void *fh,
> +	int (*vidioc_s_hw_freq_seek)(struct file *file, void *,
>  				     const struct v4l2_hw_freq_seek *a);
>  
>  	/* Debugging ioctls */
>  #ifdef CONFIG_VIDEO_ADV_DEBUG
> -	int (*vidioc_g_register)(struct file *file, void *fh,
> +	int (*vidioc_g_register)(struct file *file, void *,
>  				 struct v4l2_dbg_register *reg);
> -	int (*vidioc_s_register)(struct file *file, void *fh,
> +	int (*vidioc_s_register)(struct file *file, void *,
>  				 const struct v4l2_dbg_register *reg);
>  
> -	int (*vidioc_g_chip_info)(struct file *file, void *fh,
> +	int (*vidioc_g_chip_info)(struct file *file, void *,
>  				  struct v4l2_dbg_chip_info *chip);
>  #endif
>  
> -	int (*vidioc_enum_framesizes)(struct file *file, void *fh,
> +	int (*vidioc_enum_framesizes)(struct file *file, void *,
>  				      struct v4l2_frmsizeenum *fsize);
>  
> -	int (*vidioc_enum_frameintervals)(struct file *file, void *fh,
> +	int (*vidioc_enum_frameintervals)(struct file *file, void *,
>  					  struct v4l2_frmivalenum *fival);
>  
>  	/* DV Timings IOCTLs */
> -	int (*vidioc_s_dv_timings)(struct file *file, void *fh,
> +	int (*vidioc_s_dv_timings)(struct file *file, void *,
>  				   struct v4l2_dv_timings *timings);
> -	int (*vidioc_g_dv_timings)(struct file *file, void *fh,
> +	int (*vidioc_g_dv_timings)(struct file *file, void *,
>  				   struct v4l2_dv_timings *timings);
> -	int (*vidioc_query_dv_timings)(struct file *file, void *fh,
> +	int (*vidioc_query_dv_timings)(struct file *file, void *,
>  				       struct v4l2_dv_timings *timings);
> -	int (*vidioc_enum_dv_timings)(struct file *file, void *fh,
> +	int (*vidioc_enum_dv_timings)(struct file *file, void *,
>  				      struct v4l2_enum_dv_timings *timings);
> -	int (*vidioc_dv_timings_cap)(struct file *file, void *fh,
> +	int (*vidioc_dv_timings_cap)(struct file *file, void *,
>  				     struct v4l2_dv_timings_cap *cap);
> -	int (*vidioc_g_edid)(struct file *file, void *fh,
> +	int (*vidioc_g_edid)(struct file *file, void *,
>  			     struct v4l2_edid *edid);
> -	int (*vidioc_s_edid)(struct file *file, void *fh,
> +	int (*vidioc_s_edid)(struct file *file, void *,
>  			     struct v4l2_edid *edid);
>  
>  	int (*vidioc_subscribe_event)(struct v4l2_fh *fh,
> @@ -575,7 +575,7 @@ struct v4l2_ioctl_ops {
>  					const struct v4l2_event_subscription *sub);
>  
>  	/* For other private ioctls */
> -	long (*vidioc_default)(struct file *file, void *fh,
> +	long (*vidioc_default)(struct file *file, void *,
>  			       bool valid_prio, unsigned int cmd, void *arg);
>  };
>  
> 


