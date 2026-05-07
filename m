Return-Path: <linux-media+bounces-60758-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNs5IiZR/GlOOAAAu9opvQ
	(envelope-from <linux-media+bounces-60758-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 10:45:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC21D4E50C5
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 10:45:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0CA3C3037883
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 08:38:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C8AD389DE3;
	Thu,  7 May 2026 08:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oKycNdg5"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13DE387364;
	Thu,  7 May 2026 08:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778143051; cv=none; b=ZNpy12PUl8oLL2Wv+8QSYa94wAJYe2SZf+YpnGDvMHDbDvHmhR7xUYGsejfxUdWZdFdO9xOXlQgzS1lA0FSVSF4P4jmHiQMNK2jIw5ABsTYTY63kZNHRCl7cTwVy+nC2NO64r6RQjdgUrSOOsxm7DZTQmN1TWaR2oE+v+znXbOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778143051; c=relaxed/simple;
	bh=yRFEhZivggtsy1WIFd6s2+6wukdiSm1BWUEOTkcdLww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=srP6WFqPJj+9hTOd6Urp2f+8DoktR11kV9h/RGSmneuzPCzb2XePsls/OCTBh7UriUNrGLPcxKu82afEhJ1PgpQyhDcXAbDpzSHw6dOTInqHpINZY/POV4AkRcx9h9thjCdy1zhKJRPPaV/+u4fAcEkAhz+732RNESwzxxI6vRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oKycNdg5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 57D9E664;
	Thu,  7 May 2026 10:37:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778143035;
	bh=yRFEhZivggtsy1WIFd6s2+6wukdiSm1BWUEOTkcdLww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oKycNdg59d7OwdoyMEAlp+6nNCTsV+oTKqmePm/AglampNq+MeTusQ8o2Qh2JiLrH
	 iplD8fALtVKRbIXEOsWsS1zi44JawHQy32wTmkRWPyHwqWisAcKlVxnRrRs7J37S1q
	 j7M7LegsLVeuWMI0blp6aZuSObq0z0jTSHTDGpFM=
Date: Thu, 7 May 2026 11:37:17 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Xiaolei Wang <xiaolei.wang@windriver.com>
Cc: mchehab@kernel.org, Frank.li@nxp.com, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, aisheng.dong@nxp.com,
	jacopo@jmondi.org, guoniu.zhou@nxp.com, s.riedmueller@phytec.de,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v3 3/4] media: nxp: imx8-isi: Fix missing
 v4l2_subdev_cleanup() in pipe init error path
Message-ID: <20260507083717.GH1778786@killaraus.ideasonboard.com>
References: <20260507041318.491594-1-xiaolei.wang@windriver.com>
 <20260507041318.491594-4-xiaolei.wang@windriver.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260507041318.491594-4-xiaolei.wang@windriver.com>
X-Rspamd-Queue-Id: DC21D4E50C5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,nxp.com,pengutronix.de,gmail.com,jmondi.org,phytec.de,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-60758-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email,ideasonboard.com:dkim,killaraus.ideasonboard.com:mid]
X-Rspamd-Action: no action

On Thu, May 07, 2026 at 12:13:17PM +0800, Xiaolei Wang wrote:
> After v4l2_subdev_init_finalize() succeeds in mxc_isi_pipe_init(), if
> platform_get_irq() or devm_request_irq() fails, the error path jumps to
> a label that only calls media_entity_cleanup() and mutex_destroy(),
> missing the v4l2_subdev_cleanup() call needed to free the subdev active
> state allocated by v4l2_subdev_init_finalize().
> 
> Add an error_subdev label that calls v4l2_subdev_cleanup() before
> falling through to the existing error cleanup.
> 
> Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> index cb50af2270f6..a59b9456b590 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> @@ -796,18 +796,20 @@ int mxc_isi_pipe_init(struct mxc_isi_dev *isi, unsigned int id)
>  	irq = platform_get_irq(to_platform_device(isi->dev), id);
>  	if (irq < 0) {
>  		ret = irq;
> -		goto error;
> +		goto error_subdev;
>  	}
>  
>  	ret = devm_request_irq(isi->dev, irq, mxc_isi_pipe_irq_handler,
>  			       0, dev_name(isi->dev), pipe);
>  	if (ret < 0) {
>  		dev_err(isi->dev, "failed to request IRQ (%d)\n", ret);
> -		goto error;
> +		goto error_subdev;
>  	}
>  
>  	return 0;
>  
> +error_subdev:
> +	v4l2_subdev_cleanup(sd);
>  error:
>  	media_entity_cleanup(&sd->entity);
>  	mutex_destroy(&pipe->lock);

-- 
Regards,

Laurent Pinchart

