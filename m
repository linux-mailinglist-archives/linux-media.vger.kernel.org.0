Return-Path: <linux-media+bounces-58867-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oODfF8qw4GkRkwAAu9opvQ
	(envelope-from <linux-media+bounces-58867-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 11:50:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBEA40C9C2
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 11:50:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 394133025F6E
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 09:49:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A596E39D6DB;
	Thu, 16 Apr 2026 09:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="eND+6zrf"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6881E1C84D7;
	Thu, 16 Apr 2026 09:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776332978; cv=none; b=P4vXNwDGcjc9F0XGtexQZIfa8BZGiKPRoKYqaDc9OnXlvJ4x/L1sAgBk6/VY0wFk07zcWYFVgnbZvgv/OeZLgsZN78WoKYzFSR8cWQVDJlhkGeUOvWFz5TeOd/pGDg/ymCB8TFvgZlhGBVuADxxTeELoECOuKgBOTkpjkniFxf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776332978; c=relaxed/simple;
	bh=2zhrsZf7OGQMuO61W8Xnuwl+yxu/Rn7KYdAqbIGaJwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KuJj1yfDjKnKxT9DsqbqbwqSH+WQgg7NzanM/w1nRDz6B39Ydl86igJfCokgRjxyge8QLf+AsPUJ1F4QWzQ3At/RtjBmhIkG6JfJtuDrRRzpJBzQu/M1pHRc2pkXtzK+kEA2Q8cW9aknWRZ5ScVy2GdgbbIhps0NmU31+aHrL7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=eND+6zrf; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 1A74EC71;
	Thu, 16 Apr 2026 11:48:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776332880;
	bh=2zhrsZf7OGQMuO61W8Xnuwl+yxu/Rn7KYdAqbIGaJwI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eND+6zrf1BwVWaZA4dT+diGeKoU7x8DkDfcQGmPNvwncySfbj99HoNFWKsRW6jmGS
	 ygCXuWL4G7DqbCAJx2vfrv3STAwe1AYKil8ksMAAFsPab4Qc0WekeYnysy35ltaI3J
	 DX8emg0LvcbK+qny+1mG9M0jHtmonI7acfQS6i80=
Date: Thu, 16 Apr 2026 12:49:32 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Matthew Majewski <mattwmajewski@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kees Cook <kees@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] media: vim2m: fix reference leak on failed device
 registration
Message-ID: <20260416094932.GA1768243@killaraus.ideasonboard.com>
References: <20260415151449.3387235-1-lgs201920130244@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260415151449.3387235-1-lgs201920130244@gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58867-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,pengutronix.de,linux.intel.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BFBEA40C9C2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 15, 2026 at 11:14:49PM +0800, Guangshuo Li wrote:
> When platform_device_register() fails in vim2m_init(), the embedded
> struct device in vim2m_pdev has already been initialized by
> device_initialize(), but the failure path returns the error without
> dropping the device reference for the current platform device:
> 
>   vim2m_init()
>     -> platform_device_register(&vim2m_pdev)
>        -> device_initialize(&vim2m_pdev.dev)
>        -> setup_pdev_dma_masks(&vim2m_pdev)
>        -> platform_device_add(&vim2m_pdev)
> 
> This leads to a reference leak when platform_device_register() fails.
> Fix this by calling platform_device_put() before returning the error.

Functions that don't clean after themselves on failure are not a very
good practice. It indeed seems that platform_device_register() will
leave a dangling kref. Most callers don't seem to be aware of this
though, even platform_add_devices() doesn't call platform_device_put() !
This makes me think that this patch just works around the problem. A
better solution is needed. Have you investigated if
platform_device_register() can drop the reference on failure ? What
problems would that cause ?

> The issue was identified by a static analysis tool I developed and
> confirmed by manual review.
> 
> Fixes: 1f923a42033ad ("[media] mem2mem_testdev: rename to vim2m")

Quote unlikely.

> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
>  drivers/media/test-drivers/vim2m.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/test-drivers/vim2m.c b/drivers/media/test-drivers/vim2m.c
> index bb2dd11eef0e..80dc7edcbb5e 100644
> --- a/drivers/media/test-drivers/vim2m.c
> +++ b/drivers/media/test-drivers/vim2m.c
> @@ -1601,8 +1601,10 @@ static int __init vim2m_init(void)
>  	int ret;
>  
>  	ret = platform_device_register(&vim2m_pdev);
> -	if (ret)
> +	if (ret) {
> +		platform_device_put(&vim2m_pdev);
>  		return ret;
> +	}
>  
>  	ret = platform_driver_register(&vim2m_pdrv);
>  	if (ret)

-- 
Regards,

Laurent Pinchart

