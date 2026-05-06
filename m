Return-Path: <linux-media+bounces-60537-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFZKOWH9+mnjUwMAu9opvQ
	(envelope-from <linux-media+bounces-60537-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 10:35:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 495134D7ED9
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 10:35:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F1FE301495A
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 08:35:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B126C3DE420;
	Wed,  6 May 2026 08:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gxCOpBnl"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E0A2D3A60;
	Wed,  6 May 2026 08:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778056531; cv=none; b=P6y7kK+HfjH9awUsRe+Y3ZgJM3DXXXR8YFXqPucnHoslRG8/ivRU15rH2jcNgV8u0DNNWEh+XkOel6xXXJoCbAZM/jp8mhFCF5AAEEywikAw2Q5C8VazXNWB/SykoP3YWPmuJ2Dnd5gk/FVpMqp+tYcXb0YZGMF7+I5KIuAR74U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778056531; c=relaxed/simple;
	bh=szPcxoy/83OTNBNMK8t4PDn2kzBAPSJI4fRHixbIZng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tura0UPFSLQZOj6eKulszT4tztvHynL7+4bOh/N5GnjJZLHg9UDFNgMUVnX0UX9UzVYKyo5WHe9MB5s9RWE2ggPuImTNkcYAoFREbrnTu2VHh5+hGWIm2gso/J8ltOpD7SCmRzFfusfLb2iOwBrU17lYLFNPfThJ7xwzrqJv5gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gxCOpBnl; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CF566BE;
	Wed,  6 May 2026 10:35:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778056524;
	bh=szPcxoy/83OTNBNMK8t4PDn2kzBAPSJI4fRHixbIZng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gxCOpBnlR8fRtZdIrNzJQRyfbBuj5v+cb28K1OU7Mpem2KxXyC9INM7xEBUFfMlNV
	 +e7Rbe65Ay7r55SqAHcguWKd7Qb0taaih+19F+6ZdEtqoLU+/zQobhTsrtOBDjuxaJ
	 cLH2gtyDhUWA/V0dOqfEHEcKlu5qHCbSBTtgUquM=
Date: Wed, 6 May 2026 10:35:25 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Antoine Bouyer <antoine.bouyer@nxp.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Daniel Scally <dan.scally@ideasonboard.com>, 
	Keke Li <keke.li@amlogic.com>, Jai Luthra <jai.luthra@ideasonboard.com>, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, Ricardo Ribalda <ribalda@chromium.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] media: v4l2-isp: Rename v4l2_isp_params_buffer_size
Message-ID: <afr7sCGUTJqixAC-@zed>
References: <20260505-extensible-stats-v1-0-e16f326b8dad@ideasonboard.com>
 <20260505-extensible-stats-v1-3-e16f326b8dad@ideasonboard.com>
 <b8c24929-449b-4394-afe3-d3517c64427e@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b8c24929-449b-4394-afe3-d3517c64427e@nxp.com>
X-Rspamd-Queue-Id: 495134D7ED9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60537-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email]

Hello Antoine

On Wed, May 06, 2026 at 10:11:31AM +0200, Antoine Bouyer wrote:
> On 5/5/26 4:12 PM, Jacopo Mondi wrote:
> >
> >
> > Rename v4l2_isp_params_buffer_size() to v4l2_isp_buffer_size() to
> > support statistics.
> >
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > ---
> >   .../media/platform/arm/mali-c55/mali-c55-params.c  | 12 ++++++------
>
> Hi Jacopo
>
> Is it ok to meld driver and include changes and remove all occurrences of
> v4l2_isp_params_buffer_size ? Of course it prevents build errors, but what
> if pending changes are already using this macro ?

This is an internal header, we don't keep compatibility for internal
kAPI symbols.

If you're referring to your in-review patches which use the now
renamed 'v4l2_isp_params_buffer_size' symbol, I'm sorry but we'll
have to synchronize here, there's no way around it.

>  >   include/media/v4l2-isp.h                           | 22
> +++++++++++++---------
> >   2 files changed, 19 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-params.c b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> > index de0e9d898db7..dc483f0322d6 100644
> > --- a/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> > +++ b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> > @@ -487,7 +487,7 @@ static int mali_c55_params_g_fmt_meta_out(struct file *file, void *fh,
> >   {
> >          static const struct v4l2_meta_format mfmt = {
> >                  .dataformat = V4L2_META_FMT_MALI_C55_PARAMS,
> > -               .buffersize = v4l2_isp_params_buffer_size(MALI_C55_PARAMS_MAX_SIZE),
> > +               .buffersize = v4l2_isp_buffer_size(MALI_C55_PARAMS_MAX_SIZE),
> >          };
> >
> >          f->fmt.meta = mfmt;
> > @@ -540,13 +540,13 @@ mali_c55_params_queue_setup(struct vb2_queue *q, unsigned int *num_buffers,
> >          if (*num_planes && *num_planes > 1)
> >                  return -EINVAL;
> >
> > -       if (sizes[0] && sizes[0] < v4l2_isp_params_buffer_size(MALI_C55_PARAMS_MAX_SIZE))
> > +       if (sizes[0] && sizes[0] < v4l2_isp_buffer_size(MALI_C55_PARAMS_MAX_SIZE))
> >                  return -EINVAL;
> >
> >          *num_planes = 1;
> >
> >          if (!sizes[0])
> > -               sizes[0] = v4l2_isp_params_buffer_size(MALI_C55_PARAMS_MAX_SIZE);
> > +               sizes[0] = v4l2_isp_buffer_size(MALI_C55_PARAMS_MAX_SIZE);
> >
> >          return 0;
> >   }
> > @@ -556,7 +556,7 @@ static int mali_c55_params_buf_init(struct vb2_buffer *vb)
> >          struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> >          struct mali_c55_params_buf *buf = to_mali_c55_params_buf(vbuf);
> >
> > -       buf->config = kvmalloc(v4l2_isp_params_buffer_size(MALI_C55_PARAMS_MAX_SIZE),
> > +       buf->config = kvmalloc(v4l2_isp_buffer_size(MALI_C55_PARAMS_MAX_SIZE),
> >                                 GFP_KERNEL);
> >          if (!buf->config)
> >                  return -ENOMEM;
> > @@ -583,7 +583,7 @@ static int mali_c55_params_buf_prepare(struct vb2_buffer *vb)
> >          int ret;
> >
> >          ret = v4l2_isp_params_validate_buffer_size(mali_c55->dev, vb,
> > -                       v4l2_isp_params_buffer_size(MALI_C55_PARAMS_MAX_SIZE));
> > +                       v4l2_isp_buffer_size(MALI_C55_PARAMS_MAX_SIZE));
> >          if (ret)
> >                  return ret;
> >
> > @@ -593,7 +593,7 @@ static int mali_c55_params_buf_prepare(struct vb2_buffer *vb)
> >           * changed to the buffer content whilst the driver processes it.
> >           */
> >
> > -       memcpy(buf->config, config, v4l2_isp_params_buffer_size(MALI_C55_PARAMS_MAX_SIZE));
> > +       memcpy(buf->config, config, v4l2_isp_buffer_size(MALI_C55_PARAMS_MAX_SIZE));
> >
> >          return v4l2_isp_params_validate_buffer(mali_c55->dev, vb, buf->config,
> >                                                 mali_c55_params_block_types_info,
> > diff --git a/include/media/v4l2-isp.h b/include/media/v4l2-isp.h
> > index f3a6d0edcb24..d70ed6b431e7 100644
> > --- a/include/media/v4l2-isp.h
> > +++ b/include/media/v4l2-isp.h
> > @@ -15,17 +15,21 @@ struct device;
> >   struct vb2_buffer;
> >
> >   /**
> > - * v4l2_isp_params_buffer_size - Calculate size of v4l2_isp_params_buffer
> > - * @max_params_size: The total size of the ISP configuration blocks
> > + * v4l2_isp_buffer_size - Calculate size of v4l2_isp_buffer
> > + * @max_size: The total size of the ISP configuration or statistics blocks
> > + *
> > + * Users of v4l2-isp will have differing sized data arrays for parameters and
> > + * statistics, depending on their specific blocks. Drivers need to be able to
> > + * calculate the appropriate size of the buffer to accommodate all ISP blocks
> > + * supported by the platform. This macro provides a convenient tool for the
> > + * calculation.
> > + *
> > + * The intended users of this function are drivers initializing the size
> > + * of their metadata (parameters and statistics) buffers.
> >    *
> > - * Users of the v4l2 extensible parameters will have differing sized data arrays
> > - * depending on their specific parameter buffers. Drivers and userspace will
> > - * need to be able to calculate the appropriate size of the struct to
> > - * accommodate all ISP configuration blocks provided by the platform.
> > - * This macro provides a convenient tool for the calculation.
> >    */
> > -#define v4l2_isp_params_buffer_size(max_params_size) \
> > -       (offsetof(struct v4l2_isp_params_buffer, data) + (max_params_size))
> > +#define v4l2_isp_buffer_size(max_size)                 \
> > +       (offsetof(struct v4l2_isp_buffer, data) + (max_size))
>
> Shouldn't we keep v4l2_isp_params_buffer_size for compatibility ?

I don't think so, no. This is internal stuff, not exposed to
userspace. We should port all existing users to the new symbol, don't
we ?

>
> BR
> Antoine

Thanks!

>
> >
> >   /**
> >    * v4l2_isp_params_validate_buffer_size - Validate a V4L2 ISP buffer sizes
> >
> > --
> > 2.53.0
> >
>
>

