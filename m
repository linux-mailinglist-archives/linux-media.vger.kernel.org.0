Return-Path: <linux-media+bounces-56389-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGiLEelrvGnwyQIAu9opvQ
	(envelope-from <linux-media+bounces-56389-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 22:34:33 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F58B2D2B5B
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 22:34:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2F6A930B917F
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 21:33:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03AC740244D;
	Thu, 19 Mar 2026 21:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GX38tiwL"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7657B3AE184;
	Thu, 19 Mar 2026 21:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773956034; cv=none; b=HLGjza568t/i7GC6qZuXdehfXgWpl26yfynljwHsWQgJ5KO+zJ7PSa8m2SzRvJPNTocjnsF992Qz55luMLYXpzZ0eozQ42y3igJADuESG+C/oC3C7Ux9JPOQY53HftQAGgL0K802xI6S+hoEYIxD4Jcffa2/dJDO+C681U8NVYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773956034; c=relaxed/simple;
	bh=tzCaIgA8T0NJiMqXwAsDS9LpmbMwGbINnJroJi2ZhHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qz5Ac1Ng/UNzx95PKHWfRl4CqVnAIaJL5tbKK02/ihhenm5wYHbNKnToFkVT52aRtc7h6D65b/WJq5uCIT/36IWF6lhxtwdgC9BOLgRYrleK7SI1CEQktZQQCEqQUTR4diJ4AbM+s2ndevt8FQgTIAvXZAE/EXt5p5CkhVRH8Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GX38tiwL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 79E34838;
	Thu, 19 Mar 2026 22:32:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773955956;
	bh=tzCaIgA8T0NJiMqXwAsDS9LpmbMwGbINnJroJi2ZhHo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GX38tiwLN6DSYm9GEXrKsPN7SjL9S+iDBJ8NS20B32cwZtCaXMktaDfnTxMwW0BbQ
	 sEra/ZAhbLpKZyUhUf3svvp0bWPV/4iNWnlp3Vb/o4m40wDXjGDSs9TNA8ASzeZhNu
	 MjZNAs8s2LVufrMuon8q10FM+vsb9DPuoI00AEgQ=
Date: Thu, 19 Mar 2026 23:33:48 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Riedmueller <s.riedmueller@phytec.de>,
	Jacopo Mondi <jacopo@jmondi.org>, Christian Hemp <c.hemp@phytec.de>,
	Frank Li <frank.li@nxp.com>, Dong Aisheng <aisheng.dong@nxp.com>,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Guoniu Zhou <guoniu.zhou@nxp.com>, stable@vger.kernel.org
Subject: Re: [PATCH RESEND v2] media: nxp: imx8-isi: Fix potential
 out-of-bounds issues
Message-ID: <20260319213348.GA950375@killaraus.ideasonboard.com>
References: <20260228-isi-v2-1-f6f9208c6844@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260228-isi-v2-1-f6f9208c6844@nxp.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56389-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,pengutronix.de,gmail.com,phytec.de,jmondi.org,nxp.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.982];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,killaraus.ideasonboard.com:mid,nxp.com:email]
X-Rspamd-Queue-Id: 1F58B2D2B5B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello Guoniu,

Thank you for the patch.

On Sat, Feb 28, 2026 at 05:35:53PM +0800, Guoniu Zhou wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
> 
> The maximum downscaling factor supported by ISI can be up to 16. Add
> minimum value constraint before applying the setting to hardware.
> Otherwise, the process will not respond even when Ctrl+C is executed.

Could you share how you can trigger this from userspace ? I'd like to
test it and see where the absence of response comes from.

> Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
> Cc: stable@vger.kernel.org
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
> Changes in v2:
> - Fix possible side-effects caused by 'max_val' in CLAMP_DOWNSCALE_16 macro.
> - Add space line between two paragraph in comment.
> - Link to v1: https://lore.kernel.org/r/20260122-isi-v1-1-c3ec6e264f13@nxp.com
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h | 16 ++++++++++++++++
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c  |  6 +++---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c |  6 ++----
>  3 files changed, 21 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> index 3cbd35305af0f8026c4f76b5eb5d0864f8e36dc3..84e134f4d5fb26be652ac3e6aecd459bb2a0d1c6 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> @@ -59,6 +59,22 @@ struct v4l2_m2m_dev;
>  #define MXC_ISI_M2M			"mxc-isi-m2m"
>  #define MXC_MAX_PLANES			3
>  
> +/*
> + * ISI scaling engine works in two parts: it performs pre-decimation of
> + * the image followed by bilinear filtering to achieve the desired
> + * downscaling factor.
> + *
> + * The decimation filter provides a maximum downscaling factor of 8, and
> + * the subsequent bilinear filter provides a maximum downscaling factor
> + * of 2. Combined, the maximum scaling factor can be up to 16.
> + */
> +#define CLAMP_DOWNSCALE_16(val, max_val)			\

Let's add a MXC_ISI_ prefix.

> +({								\
> +	typeof(max_val) __max_val = (max_val);			\
> +								\
> +	clamp((val), max(1U, __max_val >> 4), __max_val);	\

I think you should round the division up here:

	clamp((val), max(1U, (__max_val + 15) / 16, __max_val);	\

Let's assume the input size (max_val) is 1000. Without rounding up, the
output size will be clamped to 1000 / 16 = 62. This leads to a
downscaling factor slightly above 16.

> +})

Any reason not to make this an inline function instead of a macro ?

> +
>  struct mxc_isi_dev;
>  struct mxc_isi_m2m_ctx;
>  
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> index f425ac7868547da401e86ce5a9b70a9890e72541..8860d89713667d06abc94e6024526fabac46feb7 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> @@ -509,9 +509,9 @@ __mxc_isi_m2m_try_fmt_vid(struct mxc_isi_m2m_ctx *ctx,
>  			  const enum mxc_isi_video_type type)
>  {
>  	if (type == MXC_ISI_VIDEO_M2M_CAP) {
> -		/* Downscaling only  */
> -		pix->width = min(pix->width, ctx->queues.out.format.width);
> -		pix->height = min(pix->height, ctx->queues.out.format.height);
> +		/* Downscaling one-sixteenth only  */

There are two spaces after "only".

> +		pix->width = CLAMP_DOWNSCALE_16(pix->width, ctx->queues.out.format.width);
> +		pix->height = CLAMP_DOWNSCALE_16(pix->height, ctx->queues.out.format.height);

To keep lines shorter, you can write

		const struct v4l2_pix_format_mplane *format =
			&ctx->queues.out.format;

		/* Downscaling only, by up to 16. */
		pix->width = CLAMP_DOWNSCALE_16(pix->width, format->width);
		pix->height = CLAMP_DOWNSCALE_16(pix->height, format->height);

>  	}
>  
>  	return mxc_isi_format_try(ctx->m2m->pipe, pix, type);
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> index a41c51dd9ce0f2eeb779e9aa2461593b0d635f41..c3ffc8a38d1269c0a4e6493b4d75690f01cc87bb 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> @@ -647,10 +647,8 @@ static int mxc_isi_pipe_set_selection(struct v4l2_subdev *sd,
>  

There's a comment above that states

		/* The sink crop is bound by the sink format downscaling only). */

That's not right, let's fix it:

		/*
		 * The ISI supports downscaling only, with a factor up to 16.
		 * Clamp the compose rectangle size accordingly.
		 */

Reading the driver code to check how rounding is done when programming
the hardware, I noticed that we clamp the bilinear scaling ratio to
ISI_DOWNSCALE_THRESHOLD, defined as 0x4000:

	return min_t(u32, from * 0x1000 / (to * *dec), ISI_DOWNSCALE_THRESHOLD);

The ratio is documented to be a Q2.12 value, so 0x4000 is x1.0. The code
seems wrong to me, what do you think ?

>  		sel->r.left = 0;
>  		sel->r.top = 0;
> -		sel->r.width = clamp(sel->r.width, MXC_ISI_MIN_WIDTH,
> -				     format->width);
> -		sel->r.height = clamp(sel->r.height, MXC_ISI_MIN_HEIGHT,
> -				      format->height);
> +		sel->r.width = CLAMP_DOWNSCALE_16(sel->r.width, format->width);
> +		sel->r.height = CLAMP_DOWNSCALE_16(sel->r.height, format->height);
>  
>  		rect = mxc_isi_pipe_get_pad_compose(pipe, state,
>  						    MXC_ISI_PIPE_PAD_SINK);
> 
> ---
> base-commit: eb4ee870747c3a77a9c3c84d84efb64bd481013a
> change-id: 20260122-isi-74f87fbb9a6f

-- 
Regards,

Laurent Pinchart

