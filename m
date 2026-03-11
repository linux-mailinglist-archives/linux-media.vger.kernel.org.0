Return-Path: <linux-media+bounces-55385-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8M8yF9ZlsWnsugIAu9opvQ
	(envelope-from <linux-media+bounces-55385-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 13:53:42 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B1257263E3D
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 13:53:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 98A1231C8B9C
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 12:50:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE81E19E992;
	Wed, 11 Mar 2026 12:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EHrIy0CR"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7BC5242D72;
	Wed, 11 Mar 2026 12:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773233454; cv=none; b=aYDWzZBQgDdZsr1S8gdKxlgwEQ51ouE/9ENnDXRcnuClXgTmjRaJVB2P0p+JApSSr7z3Jn/0P642kzKAxDYNBEAmOPsSHpX4e7fMxneNLCvXMtxTvuw8NK9P3pPPeM3Eb/mkYO+KBpsyU9Xfo0T8PV2Yly3xPMfJ2SnVu3GDWFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773233454; c=relaxed/simple;
	bh=3hhQtJuyqLfFjdpmAoRFR4RP69ILCV1ozU6Cm359k30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bmPTbQCAnd3NEhj+8gq9K1Jyq/JWSp8lJgXe4AU7BsVhrdVrN0jUT1HJf76m1KdmwNe/op6qjnTBgiX5uSl46aW+xrwMZxHuvHIHKJwSSZk1zQQb6MmU7Dz5rWTYdD0iNNVULSbTkWMTCiwXw1YOzD4k3pjFuIMmydE81eyf2HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=EHrIy0CR; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (static.170.20.224.46.clients.your-server.de [46.224.20.170])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7DFB42D9;
	Wed, 11 Mar 2026 13:49:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773233382;
	bh=3hhQtJuyqLfFjdpmAoRFR4RP69ILCV1ozU6Cm359k30=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EHrIy0CR45EZlV1l5rTU+qJAHjLkLLzxBHX1/7bdAfKSMdurCcsSdm8exKTB5Cg7g
	 4T8bf5ab/el19dB+y+0N2VZtjdjoQlWvn+2qTg4rClIbcRw9AFOPKUSn9pFIMQtvtE
	 sYM8cBikFR0glniq+jgSZhqJUueoZYOqy8WeAGQI=
Date: Wed, 11 Mar 2026 13:50:46 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Alexi Birlinger <alexi.birlinger@nxp.com>, Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: [PATCH 1/2] media: nxp: imx8-isi: Reduce minimum queued buffers
 from 2 to 1
Message-ID: <abFeguTCJQmoCLPK@zed>
References: <20260311-isi_min_buffers-v1-0-c9299d6e8ae6@nxp.com>
 <20260311-isi_min_buffers-v1-1-c9299d6e8ae6@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260311-isi_min_buffers-v1-1-c9299d6e8ae6@nxp.com>
X-Rspamd-Queue-Id: B1257263E3D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55385-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,kernel.org,nxp.com,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,nxp.com:email,ideasonboard.com:dkim]
X-Rspamd-Action: no action

Hello Guoniu

On Wed, Mar 11, 2026 at 04:02:58PM +0800, Guoniu Zhou wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
>
> Fix a hang issue when capturing a single frame with applications like cam
> in libcamera. It would hang waiting for the driver to complete the buffer,
> but streaming never starts because min_queued_buffers was set to 2.
>
> The ISI module uses a ping-pong buffer mechanism that requires two buffers
> to be programmed at all times. However, when fewer than 2 user buffers are
> available, the driver use internal discard buffers to fill the remaining
> slot(s). Reduce minimum queued buffers from 2 to 1 allows streaming to

Does it mean the ISI can use internal buffer discard for both buffer
slots ? Can we make min_queued_buffers == 0 ?

> start with a single buffer providing more flexibility for applications.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> index 13682bf6e9f8895bb9eb1f92d5f74b0d5968544e..2405baf21594cd18cf2b349234313c5e103b7802 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> @@ -1410,7 +1410,7 @@ int mxc_isi_video_register(struct mxc_isi_pipe *pipe,
>  	q->mem_ops = &vb2_dma_contig_memops;
>  	q->buf_struct_size = sizeof(struct mxc_isi_buffer);
>  	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> -	q->min_queued_buffers = 2;
> +	q->min_queued_buffers = 1;
>  	q->lock = &video->lock;
>  	q->dev = pipe->isi->dev;
>
>
> --
> 2.34.1
>
>

