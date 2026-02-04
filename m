Return-Path: <linux-media+bounces-52145-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKxhCaCMgmnXWAMAu9opvQ
	(envelope-from <linux-media+bounces-52145-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 01:02:40 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C40DFE27
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 01:02:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C4425300BE9F
	for <lists+linux-media@lfdr.de>; Wed,  4 Feb 2026 00:02:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91A213EBF18;
	Wed,  4 Feb 2026 00:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hKT9Xvss"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAAAD18AE2
	for <linux-media@vger.kernel.org>; Wed,  4 Feb 2026 00:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770163353; cv=none; b=TtQ6BHh0wimzFGtfoidVLdTNR8CTUVFxZ+65FDR//RcPlyV4CZJwKuziEM/Mkp1dy0VdA3uYKnf28aTx7hOTECq7K45xoDLc2p8QbooCEUnnwDm1tt95MHYHHrRwiFWyG/O6nMvsM+0cUOiXW4XERZZuBWXfRT3EHlVgpQeLaLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770163353; c=relaxed/simple;
	bh=1v3R4MkyhyZgk10UZnaZ5JNbzWCg/QiBkqlMzcGEnFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qa90eQt119TMQEdBNDqwvbT+5LRftRz47skdie/87CNGnP8JZAJY5X6G7E94tr95ZrVxyiabhFENODKw2ZLBfk0tkoUv8pcmR3uj35M2UG9ywJ9hT4y4OanydDEHbCorA2lQz6+SZaAYbSRTW/M3+DMBMT2n0SsreZvBDPylmck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hKT9Xvss; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--ff4.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::ff4])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 852D73A4;
	Wed,  4 Feb 2026 01:01:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770163308;
	bh=1v3R4MkyhyZgk10UZnaZ5JNbzWCg/QiBkqlMzcGEnFA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hKT9XvssbYEn3VJj2AXuW6gj4fLrqgybVgu6vYp0oBjKZPkxKxr4zgtP4ePQxSpZa
	 Bhe5nUCxelhBlRNYagnduN9Bd3NEoGW/+baKzRgCiRHu02BPnz3J8CMC+LOLNoIhBy
	 ETfzJguts+WAobgsVhSuPgNbTXN296MmkHo29RY8=
Date: Wed, 4 Feb 2026 02:02:28 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Arash Golgol <arash.golgol@gmail.com>
Cc: linux-media@vger.kernel.org, paulk@sys-base.io, mchehab@kernel.org,
	wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] media: sun6i-mipi-csi2: Propagate format to source pad
 in TRY mode
Message-ID: <20260204000228.GA154910@killaraus>
References: <20260126102149.39563-1-arash.golgol@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260126102149.39563-1-arash.golgol@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52145-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,sys-base.io,kernel.org,gmail.com,sholland.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 44C40DFE27
X-Rspamd-Action: no action

Hello Arash,

Thank you for the patch.

On Mon, Jan 26, 2026 at 01:51:49PM +0330, Arash Golgol wrote:
> sun6i-mipi-csi2 does not support any format conversion. So the format
> on sink and source pad must always match. This limitation is handled for
> ACTIVE state via mbus_format member of bridge private structure.

It's not even handled correctly though, the sun6i_mipi_csi2_set_fmt()
function will accept setting the ACTIVE format on the source pad, when
it shouldn't. You also fix this in your patch. This should be explained
in the commit message.

> To enforce this limitation in TRY state, user space should only be able
> to set format on sink pad. The sink format must be propagated to source
> pad to ensure consistent behavior.
> 
> This also aligns the driver with userspace relying on media controller
> based format negotiation.
> 
> Signed-off-by: Arash Golgol <arash.golgol@gmail.com>
> ---
>  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
> index b06cb73015cd..6ee0f6685663 100644
> --- a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
> +++ b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
> @@ -369,15 +369,26 @@ static int sun6i_mipi_csi2_set_fmt(struct v4l2_subdev *subdev,
>  	struct v4l2_mbus_framefmt *mbus_format = &format->format;
>  	struct mutex *lock = &csi2_dev->bridge.lock;
>  
> +	/* The format on the source pad always matches the sink pad. */
> +	if (format->pad != SUN6I_MIPI_CSI2_PAD_SINK)
> +		return v4l2_subdev_get_fmt(subdev, state, format);
> +
>  	mutex_lock(lock);
>  
>  	sun6i_mipi_csi2_mbus_format_prepare(mbus_format);
>  
> -	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
> -		*v4l2_subdev_state_get_format(state, format->pad) =
> -			*mbus_format;
> -	else
> +	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
> +		struct v4l2_mbus_framefmt *fmt;
> +
> +		fmt = v4l2_subdev_state_get_format(state, format->pad);
> +		*fmt = *mbus_format;
> +
> +		/* Propagate the format to the source pad. */
> +		fmt = v4l2_subdev_state_get_format(state, SUN6I_MIPI_CSI2_PAD_SOURCE);
> +		*fmt = *mbus_format;
> +	} else {
>  		csi2_dev->bridge.mbus_format = *mbus_format;
> +	}

If you have a bit more time, could I ask you to take it one step further
and convert the driver to framework-managed V4L2 subdev active ? This
will simplify the implementation by dropping bridge.mbus_format.

You can find an example of the conversion in commit a2514b9a634a
("media: i2c: imx290: Use V4L2 subdev active state"). In a nutshell, you
need to

- Call v4l2_subdev_init_finalize() at probe time and
  v4l2_subdev_cleanup() at remove time
- Drop the mutex (locking is now handled by the framework)
- Use v4l2_subdev_get_fmt() as the .get_fmt() handler
- Drop bridge.mbus_format and always use v4l2_subdev_get_pad_format() on
  the state passed to the subdev functions (which will be the ACTIVE or
  TRY state depending on the .which argument passed by userspace)
- In .s_stream(), access the state with
  v4l2_subdev_lock_and_get_active_state() as it's the only subdev
  operation that doesn't get the state as a parameter

You can ignore the control handler changes in commit a2514b9a634a, and
you can leave subdev.state_lock NULL (the framework will then use an
internal lock).

>  
>  	mutex_unlock(lock);
>  

-- 
Regards,

Laurent Pinchart

