Return-Path: <linux-media+bounces-62348-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIv6IiD4DWry4wUAu9opvQ
	(envelope-from <linux-media+bounces-62348-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 20:06:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3129C5954B7
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 20:06:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 780793049971
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 17:41:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A500A3F0A83;
	Wed, 20 May 2026 17:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZL8/nn9I"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CF13E123F;
	Wed, 20 May 2026 17:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779298891; cv=none; b=cMz0eUfaFyThlquA2OhtixBiHi0N9vXBLC21FmBJiIdVmoAIUavTQg3CEZBg3xpRlQYshEj4nRiM2Px5MvhyCndXocLnUtvbeT2p7Bhxs/LjxDcyLebSy6fuJ4aeXZyMz6QloZZah7T2D1fZMQMO03c28a99NEwfZSPCMd5KnCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779298891; c=relaxed/simple;
	bh=iTxehStzlB1GozKYMCfNJeZ67nC8BTcSqdK5qvQx330=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=odX8XKNFOZg0QHxwJl9rbkPqsezgpb22k7UXyJ7F1S7RCrbuZyIlIdQ1tUCNnufzfen9p11SqrQON4pgWv9ylosErBMvjHCy2C++eKLB76Si2MF9pPqVS0YiD7Ut5QhpqC0CqinY/EXIUvzLITpM76gTzJYly6283mWoQP1zsRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZL8/nn9I; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (unknown [IPv6:2a01:cb1d:8f2:800:42d6:38fa:3bdf:70df])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4142642B;
	Wed, 20 May 2026 19:41:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1779298874;
	bh=iTxehStzlB1GozKYMCfNJeZ67nC8BTcSqdK5qvQx330=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZL8/nn9I+dEVKV+TvrU0ZHScVI4DiFx5+tExY2OgzDi+5DYB8ozCjW4c8O9WM/AeW
	 m4jyPNsizBE19NFwzuudLRPG+GKWYyWCaimyvmSzH65E3VyCa0HH8hQvj12dCuo7+q
	 05LuqYpvTeqX2mRugW2qRi7/yovvPXR+5DUEL3uo=
Date: Wed, 20 May 2026 19:41:26 +0200
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
Subject: Re: [PATCH v3 1/2] media: nxp: imx8-isi: Fix potential out-of-bounds
 issues
Message-ID: <20260520174126.GA12108@killaraus.ideasonboard.com>
References: <20260323-isi-v3-0-8df53b24e622@oss.nxp.com>
 <20260323-isi-v3-1-8df53b24e622@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260323-isi-v3-1-8df53b24e622@oss.nxp.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,pengutronix.de,gmail.com,phytec.de,jmondi.org,nxp.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-62348-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,nxp.com:email,ideasonboard.com:email,ideasonboard.com:dkim,killaraus.ideasonboard.com:mid]
X-Rspamd-Queue-Id: 3129C5954B7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 04:33:30PM +0800, Guoniu Zhou wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
> 
> The maximum downscaling factor supported by ISI can be up to 16. Add
> minimum value constraint before applying the setting to hardware.
> Otherwise, the process will not respond even when Ctrl+C is executed.
> 
> Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
> Cc: stable@vger.kernel.org
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
> Changes in v3:
> - Replace CLAMP_DOWNSCALE_16 macro with inline function
> - Adjust downscale threshold from 0x4000 to 0x2000
> - Clarify downscaling limit in comment
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h | 16 ++++++++++++++++
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c   |  2 +-
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c  | 11 ++++++++---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c | 13 ++++++++-----
>  4 files changed, 33 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> index 3cbd35305af0..822466445b72 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> @@ -11,6 +11,7 @@
>  #define __MXC_ISI_CORE_H__
>  
>  #include <linux/list.h>
> +#include <linux/math.h>
>  #include <linux/mutex.h>
>  #include <linux/spinlock.h>
>  #include <linux/types.h>
> @@ -413,4 +414,19 @@ static inline void mxc_isi_debug_cleanup(struct mxc_isi_dev *isi)
>  }
>  #endif
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
> +static inline unsigned int
> +mxc_isi_clamp_downscale_16(unsigned int val, unsigned int max_val)
> +{
> +	return clamp(val, max(1U, DIV_ROUND_UP(max_val, 16)), max_val);
> +}
> +
>  #endif /* __MXC_ISI_CORE_H__ */
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> index 9225a7ac1c3e..37e59d687ed7 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> @@ -11,7 +11,7 @@
>  #include "imx8-isi-core.h"
>  #include "imx8-isi-regs.h"
>  
> -#define	ISI_DOWNSCALE_THRESHOLD		0x4000
> +#define	ISI_DOWNSCALE_THRESHOLD		0x2000

This should be split to a separate patch as it's a separate fix.

>  static inline u32 mxc_isi_read(struct mxc_isi_pipe *pipe, u32 reg)
>  {
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> index a39ad7a1ab18..a0e2061f4344 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> @@ -508,10 +508,15 @@ __mxc_isi_m2m_try_fmt_vid(struct mxc_isi_m2m_ctx *ctx,
>  			  struct v4l2_pix_format_mplane *pix,
>  			  const enum mxc_isi_video_type type)
>  {
> +	const struct v4l2_pix_format_mplane *format =
> +		&ctx->queues.out.format;

This can go in the 'if' below.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I'll take this patch without the ISI_DOWNSCALE_THRESHOLD change in my
tree, and will send a separate patch for ISI_DOWNSCALE_THRESHOLD.

> +
>  	if (type == MXC_ISI_VIDEO_M2M_CAP) {
> -		/* Downscaling only  */
> -		pix->width = min(pix->width, ctx->queues.out.format.width);
> -		pix->height = min(pix->height, ctx->queues.out.format.height);
> +		/* Downscaling only, by up to 16. */
> +		pix->width = mxc_isi_clamp_downscale_16(pix->width,
> +							format->width);
> +		pix->height = mxc_isi_clamp_downscale_16(pix->height,
> +							 format->height);
>  	}
>  
>  	return mxc_isi_format_try(ctx->m2m->pipe, pix, type);
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> index a41c51dd9ce0..b290821d03d2 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> @@ -641,16 +641,19 @@ static int mxc_isi_pipe_set_selection(struct v4l2_subdev *sd,
>  			/* Composing is supported on the sink only. */
>  			return -EINVAL;
>  
> -		/* The sink crop is bound by the sink format downscaling only). */
> +		/*
> +		 * The ISI supports downscaling only, with a factor up to 16.
> +		 * Clamp the compose rectangle size accordingly.
> +		 */
>  		format = mxc_isi_pipe_get_pad_format(pipe, state,
>  						     MXC_ISI_PIPE_PAD_SINK);
>  
>  		sel->r.left = 0;
>  		sel->r.top = 0;
> -		sel->r.width = clamp(sel->r.width, MXC_ISI_MIN_WIDTH,
> -				     format->width);
> -		sel->r.height = clamp(sel->r.height, MXC_ISI_MIN_HEIGHT,
> -				      format->height);
> +		sel->r.width = mxc_isi_clamp_downscale_16(sel->r.width,
> +							  format->width);
> +		sel->r.height = mxc_isi_clamp_downscale_16(sel->r.height,
> +							   format->height);
>  
>  		rect = mxc_isi_pipe_get_pad_compose(pipe, state,
>  						    MXC_ISI_PIPE_PAD_SINK);
> 

-- 
Regards,

Laurent Pinchart

