Return-Path: <linux-media+bounces-64330-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id khp7DRxuKGqIEQMAu9opvQ
	(envelope-from <linux-media+bounces-64330-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 21:48:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAF0663E19
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 21:48:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b="F7RmH0/L";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64330-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-64330-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3CF363004F0D
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2026 19:39:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75665374A14;
	Tue,  9 Jun 2026 19:39:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51019374A04;
	Tue,  9 Jun 2026 19:39:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781033974; cv=none; b=gj4FiZN31hbXnSnxM7VVV4lAg8AXZ2pEWlLwOlZfsLcWYxZBxpd/VMidPgv0+cq8fOix01cNV6diUdU4lZ2fIUbiXNxKcSQV8doT9/5qIhygQ+IYk8R+roSEebTRneAfEjYGhlJSfnrl1a5nXl0H5b6w7ySU22mOUs/dJUYlhIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781033974; c=relaxed/simple;
	bh=57RZdRkZIFyD25VaAF3kemxhABhLiGaYTI7Ckv/IEBk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pg41B6MTbfcJfFfT/mcvXUr2z163Y6DtrdQtBgXgnEwc0PmFcJHFypkLhrDY8zIsFq7Ky/B8U7ft+PXAMsmwUE97fLQXzKrPxWSSpal4pfzJvIU5HJxdI7AS0Jruxs2ZmimJswGc2fRBPjfUDubOS1g9ArG70Q6ULIxHdl6qy7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=F7RmH0/L; arc=none smtp.client-ip=213.167.242.64
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 365118CB;
	Tue,  9 Jun 2026 21:39:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781033942;
	bh=57RZdRkZIFyD25VaAF3kemxhABhLiGaYTI7Ckv/IEBk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F7RmH0/Lf4EOwZsOkln5Hl9Gjlx9vz+GWA8dXbVfXG6+ST0CwKh5houiOmd+0upq0
	 PTQVbL3mi90pl/MVS8Zc3+enQebZ6kBWyqVs9kWGo17efdkNgjT7k/E8XU8x9roSm5
	 5fZevTgQAtFm22K7EO0eswesQobqR6CjXfHEUlNI=
Date: Tue, 9 Jun 2026 22:39:29 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Eugen Hristev <ehristev@kernel.org>
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Naushir Patuck <naush@raspberrypi.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
	linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: bcm2835-unicam: Fix asc leaked in error/remove
 path
Message-ID: <20260609193929.GC1132670@killaraus.ideasonboard.com>
References: <20260609-bcmpiclean-v1-1-23bdeb19caf6@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260609-bcmpiclean-v1-1-23bdeb19caf6@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ehristev@kernel.org,m:kernel-list@raspberrypi.com,m:mchehab@kernel.org,m:florian.fainelli@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:rjui@broadcom.com,m:sbranden@broadcom.com,m:hverkuil@kernel.org,m:naush@raspberrypi.com,m:sakari.ailus@linux.intel.com,m:dave.stevenson@raspberrypi.com,m:jeanmichel.hautbois@yoseli.org,m:linux-media@vger.kernel.org,m:linux-rpi-kernel@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-64330-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:from_mime,killaraus.ideasonboard.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DBAF0663E19

On Tue, Jun 09, 2026 at 08:05:23PM +0300, Eugen Hristev wrote:
> v4l2_async_nf_add_fwnode_remote() allocates the asc, which is freed when
> v4l2_async_nf_cleanup() is called.
> 
> Call v4l2_async_nf_cleanup() properly in the driver paths.
> 
> Discovered with kmemleak after rmmod:
> 
> unreferenced object 0xffff000084526b80 (size 64):
>   comm "modprobe", pid 185, jiffies 4295013512
>   hex dump (first 32 bytes):
>     01 00 00 00 00 00 00 00 e8 0d ff bf 00 00 ff ff  ................
>     40 83 bc 84 00 00 ff ff 60 83 bc 84 00 00 ff ff  @.......`.......
>   backtrace (crc ac584083):
>     [<00000000ffb081a7>] kmemleak_alloc+0x38/0x44
>     [<00000000d2fd9301>] __kmalloc+0x1b0/0x250
>     [<000000004dd5354d>] __v4l2_async_nf_add_fwnode+0x28/0x9c
>     [<0000000067587657>] __v4l2_async_nf_add_fwnode_remote+0x3c/0x64
> 
> Fixes: 392cd78d495f ("media: bcm2835-unicam: Add support for CCP2/CSI2 camera interface")
> Signed-off-by: Eugen Hristev <ehristev@kernel.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/broadcom/bcm2835-unicam.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
> index 8d28ba0b59a3..1508843ae58c 100644
> --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
> +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> @@ -2613,6 +2613,7 @@ static int unicam_async_nf_init(struct unicam_device *unicam)
>  	return 0;
>  
>  error:
> +	v4l2_async_nf_cleanup(&unicam->notifier);
>  	fwnode_handle_put(ep_handle);
>  	return ret;
>  }
> @@ -2745,6 +2746,7 @@ static void unicam_remove(struct platform_device *pdev)
>  	v4l2_device_unregister(&unicam->v4l2_dev);
>  	media_device_unregister(&unicam->mdev);
>  	v4l2_async_nf_unregister(&unicam->notifier);
> +	v4l2_async_nf_cleanup(&unicam->notifier);
>  
>  	unicam_subdev_cleanup(unicam);
>  
> 
> ---
> base-commit: a87737435cfa134f9cdcc696ba3080759d04cf72
> change-id: 20260609-bcmpiclean-69a8ee3192b0

-- 
Regards,

Laurent Pinchart

