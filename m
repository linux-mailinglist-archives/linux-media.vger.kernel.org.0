Return-Path: <linux-media+bounces-51903-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EN0DMnVEfmnbWgIAu9opvQ
	(envelope-from <linux-media+bounces-51903-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 31 Jan 2026 19:05:41 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 01308C3791
	for <lists+linux-media@lfdr.de>; Sat, 31 Jan 2026 19:05:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EC32F301840C
	for <lists+linux-media@lfdr.de>; Sat, 31 Jan 2026 18:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26FDC366041;
	Sat, 31 Jan 2026 18:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="d6nBI8Oe"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6952472A5
	for <linux-media@vger.kernel.org>; Sat, 31 Jan 2026 18:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769882737; cv=none; b=uYmzPIKMhzQbE7QDLXKUdN3Jh1PFniFJXxR+IsUftjarUu6Y82sPCvKiy/iC5Z++ljRRfhGPkRoHYdVa+oWQYEfnw1pNdNac/Y211HTELmxtgJfXjZYp1Oh+WObeK8I6wA1sVP8IUI0lMsak3ni463VyKIcLlgxoqB4MKYwVz3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769882737; c=relaxed/simple;
	bh=51ZB6k7L3Ne4LO71UbbPI07n68oUTiM+MZ/SD5usLXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cd9KpkZpNUIzdWj6kKVzi3WiWLHKdpUHVQybuv5+CXtpAiX2OheJDg9Gclun6QwaS2d0vr5WaPjL+FJbVPuRmcMztx7ji28TsX6kFh9KM1t1chiKYqDfc8rQcY5Q+ylmEaqnVzntROAgKbH9kX+JWrgx6oa6e4QBfE0Rda/ILvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=d6nBI8Oe; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id A754356D;
	Sat, 31 Jan 2026 19:04:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1769882692;
	bh=51ZB6k7L3Ne4LO71UbbPI07n68oUTiM+MZ/SD5usLXg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d6nBI8Oe8O1noPUyi1VBGcQRxXfOr3oQckVG3niEjFnUvrmM9DK7ZPpYvJcpJVTp4
	 HPcJyjHprxJPxNeePnJUv8XPg2k7qYFwCxSj6Zp7PIFrjuk4s+stVhCrfIc91p5lri
	 DefasP0lYD+dkQTTeslo9jlaPhu34Fh47bGTF57c=
Date: Sat, 31 Jan 2026 20:05:29 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Darshan Rathod <darshanrathod475@gmail.com>,
	Jai Luthra <jai.luthra@linux.dev>
Subject: Re: [PATCH] media: remove unnecessary module_init/exit functions
Message-ID: <20260131180529.GT3374091@killaraus>
References: <20260131020057.46029-1-enelsonmoore@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260131020057.46029-1-enelsonmoore@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-51903-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,linux.dev];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:email,ideasonboard.com:dkim]
X-Rspamd-Queue-Id: 01308C3791
X-Rspamd-Action: no action

Hi Ethan,

Thank you for the patch.

On Fri, Jan 30, 2026 at 06:00:47PM -0800, Ethan Nelson-Moore wrote:
> Three media drivers have unnecessary module_init and module_exit
> functions that are empty or just print a message. Remove them. Note
> that if a module_init function exists, a module_exit function must also
> exist; otherwise, the module cannot be unloaded.

How did you identify those, was it scripted or manual ? 

> Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>

The patch looks good,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I would also be nice to replace the module init/exit functions that
register/unregister PCI or USB drivers with the corresponding helper
macros (module_pci_driver, module_usb_driver, module_platform_driver,
...), as we have quite a few drivers that still open-code that. In a
separate patch of course.

> ---
>  drivers/media/common/b2c2/flexcop.c         | 14 --------------
>  drivers/media/common/saa7146/saa7146_fops.c | 13 -------------
>  drivers/media/usb/gspca/gspca.c             | 13 -------------
>  3 files changed, 40 deletions(-)
> 
> diff --git a/drivers/media/common/b2c2/flexcop.c b/drivers/media/common/b2c2/flexcop.c
> index 8506de48ba45..1572831be5b8 100644
> --- a/drivers/media/common/b2c2/flexcop.c
> +++ b/drivers/media/common/b2c2/flexcop.c
> @@ -292,20 +292,6 @@ void flexcop_device_exit(struct flexcop_device *fc)
>  }
>  EXPORT_SYMBOL(flexcop_device_exit);
>  
> -static int flexcop_module_init(void)
> -{
> -	info(DRIVER_NAME " loaded successfully");
> -	return 0;
> -}
> -
> -static void flexcop_module_cleanup(void)
> -{
> -	info(DRIVER_NAME " unloaded successfully");
> -}
> -
> -module_init(flexcop_module_init);
> -module_exit(flexcop_module_cleanup);
> -
>  MODULE_AUTHOR(DRIVER_AUTHOR);
>  MODULE_DESCRIPTION(DRIVER_NAME);
>  MODULE_LICENSE("GPL");
> diff --git a/drivers/media/common/saa7146/saa7146_fops.c b/drivers/media/common/saa7146/saa7146_fops.c
> index a9e3bad76d54..c0166684eff8 100644
> --- a/drivers/media/common/saa7146/saa7146_fops.c
> +++ b/drivers/media/common/saa7146/saa7146_fops.c
> @@ -417,19 +417,6 @@ int saa7146_unregister_device(struct video_device *vfd, struct saa7146_dev *dev)
>  }
>  EXPORT_SYMBOL_GPL(saa7146_unregister_device);
>  
> -static int __init saa7146_vv_init_module(void)
> -{
> -	return 0;
> -}
> -
> -
> -static void __exit saa7146_vv_cleanup_module(void)
> -{
> -}
> -
> -module_init(saa7146_vv_init_module);
> -module_exit(saa7146_vv_cleanup_module);
> -
>  MODULE_AUTHOR("Michael Hunold <michael@mihu.de>");
>  MODULE_DESCRIPTION("video4linux driver for saa7146-based hardware");
>  MODULE_LICENSE("GPL");
> diff --git a/drivers/media/usb/gspca/gspca.c b/drivers/media/usb/gspca/gspca.c
> index 3fc15d16df8e..f3d3f441c851 100644
> --- a/drivers/media/usb/gspca/gspca.c
> +++ b/drivers/media/usb/gspca/gspca.c
> @@ -1701,19 +1701,6 @@ int gspca_resume(struct usb_interface *intf)
>  EXPORT_SYMBOL(gspca_resume);
>  #endif
>  
> -/* -- module insert / remove -- */
> -static int __init gspca_init(void)
> -{
> -	pr_info("v" GSPCA_VERSION " registered\n");
> -	return 0;
> -}
> -static void __exit gspca_exit(void)
> -{
> -}
> -
> -module_init(gspca_init);
> -module_exit(gspca_exit);
> -
>  module_param_named(debug, gspca_debug, int, 0644);
>  MODULE_PARM_DESC(debug,
>  		"1:probe 2:config 3:stream 4:frame 5:packet 6:usbi 7:usbo");

-- 
Regards,

Laurent Pinchart

