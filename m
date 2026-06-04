Return-Path: <linux-media+bounces-63848-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id G8i1AOD4IWqXRAEAu9opvQ
	(envelope-from <linux-media+bounces-63848-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 00:14:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5190B643C17
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 00:14:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=jlgdexGO;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63848-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63848-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4714D308797C
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 22:09:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3D073126DA;
	Thu,  4 Jun 2026 22:09:56 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B5730D3FF;
	Thu,  4 Jun 2026 22:09:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780610996; cv=none; b=hXOTVX+DR6FXvrvZQOLZpwJ1DuW96uMRTHS035+eiaABZjLzcr91wI8YiYzIXILm3d8noc227NRfjrN03sX6zltzSfYRmU4MJKeTTtKxrEVpOQ14urZQWKfgapxh3CahZSKQw7QBKimjfAehpQHwGYW9v6etPqy0mqc7MvKGxaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780610996; c=relaxed/simple;
	bh=HnZvMnPeYvHbbi52e5Ekr16XEYQBZeZYO77xkwkyH4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SiUuIL+i8uJAKgZoc5Tqf84hs0X3l6k2nphpXF/9j5YHq2dqqwjNV0tXrabgf/uDhRk6JRjbh16kZ9j3ExoDBKzDyEkORtXMRGDvUdhAkL5dXk/n0CR55kzH7WpNGRLvUPpY0GzhnWud6EU34974y2xIsEBL9CEESkzLYt5iM5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jlgdexGO; arc=none smtp.client-ip=213.167.242.64
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 67CD5524;
	Fri,  5 Jun 2026 00:09:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780610959;
	bh=HnZvMnPeYvHbbi52e5Ekr16XEYQBZeZYO77xkwkyH4k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jlgdexGOIVdviyGyizSzkwowO21Z5t14pPEHwsn8obPLZdX9TkFTgZIgYsk2X0SDA
	 m4KtAhhfWrQkw9bx1u5ukeiTUD47KNBa1dal6DwcKlTG0AnELHm9DJtp+dE+2wgHU9
	 f4Lg7TOW+gI8bTD/HuTjmRBvhAZEYotY/g4Cni0c=
Date: Fri, 5 Jun 2026 01:09:42 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mirela Rabulea <mirela.rabulea@nxp.com>
Cc: sakari.ailus@linux.intel.com, mchehab@kernel.org, Frank.Li@nxp.com,
	laurentiu.palcu@nxp.com, robert.chiras@nxp.com, guoniu.zhou@nxp.com,
	robby.cai@nxp.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v2] media: v4l2-fwnode: Fix subdev owner overwritten in
 v4l2_async_register_subdev_sensor()
Message-ID: <20260604220942.GA3112137@killaraus.ideasonboard.com>
References: <20260522143120.690330-1-mirela.rabulea@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260522143120.690330-1-mirela.rabulea@nxp.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TAGGED_FROM(0.00)[bounces-63848-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mirela.rabulea@nxp.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:Frank.Li@nxp.com,m:laurentiu.palcu@nxp.com,m:robert.chiras@nxp.com,m:guoniu.zhou@nxp.com,m:robby.cai@nxp.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,s:lists@lfdr.de];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5190B643C17

Hi Mirela,

Thank you for the patch.

On Fri, May 22, 2026 at 05:31:20PM +0300, Mirela Rabulea wrote:
> The v4l2 helper v4l2_async_register_subdev_sensor() calls
> v4l2_async_register_subdev(), which is a macro that expands to
> __v4l2_async_register_subdev(sd,THIS_MODULE). Since the macro is expanded
> inside v4l2-fwnode.c, THIS_MODULE resolves to the v4l2-fwnode module
> rather than the sensor driver module that originally set sd->owner. When
> v4l2-fwnode is built-in, THIS_MODULE evaluates to NULL, which then
> overwrites the sensor driver's owner with NULL.
> 
> This causes the problem that the sensor module's reference count is never
> incremented during async registration, so the module can be removed while
> the subdevice is still in use by a notifier (e.g., a CSI-2 receiver
> bridge driver).
> 
> Fix this by renaming v4l2_async_register_subdev_sensor() to
> __v4l2_async_register_subdev_sensor() with an added explicit module
> argument and introducing a wrapper macro:
>     #define v4l2_async_register_subdev_sensor(sd) \
>         __v4l2_async_register_subdev_sensor(sd, THIS_MODULE)
> 
> This ensures the sensor driver module is properly referenced even when
> the sensor driver does not init the owner field before calling
> v4l2_async_register_subdev_sensor() and prevents premature module removal.
> 
> Fixes: aef69d54755d ("media: v4l: fwnode: Add a convenience function for registering sensors")
> Suggested-by: Frank Li <Frank.Li@nxp.com>
> Link: https://lore.kernel.org/linux-media/20240315073125.275501-2-sakari.ailus@linux.intel.com/
> Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> 
> Changes in v2:
> 	Do not rely on sd->owner set by v4l2_i2c_subdev_init(), introduce v4l2_async_register_subdev_sensor wrapper macro	
> 	Added Suggested-by: Frank Li <Frank.Li@nxp.com>
> 	Added Link: to Sakari's similar commit for v4l2_async_register_subdev macro
> 
> The v1 patch is also valid, as from what I see, all sensor drivers that use
> v4l2_async_register_subdev_sensor also use v4l2_i2c_subdev_init(), which
> sets sd->owner
> 
> 
>  drivers/media/v4l2-core/v4l2-fwnode.c | 6 +++---
>  include/media/v4l2-async.h            | 4 +++-
>  2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
> index 77f3298821b5..62a3a452f788 100644
> --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> @@ -1256,7 +1256,7 @@ v4l2_async_nf_parse_fwnode_sensor(struct device *dev,
>  	return 0;
>  }
>  
> -int v4l2_async_register_subdev_sensor(struct v4l2_subdev *sd)
> +int __v4l2_async_register_subdev_sensor(struct v4l2_subdev *sd, struct module *module)
>  {
>  	struct v4l2_async_notifier *notifier;
>  	int ret;
> @@ -1282,7 +1282,7 @@ int v4l2_async_register_subdev_sensor(struct v4l2_subdev *sd)
>  	if (ret < 0)
>  		goto out_cleanup;
>  
> -	ret = v4l2_async_register_subdev(sd);
> +	ret = __v4l2_async_register_subdev(sd, module);
>  	if (ret < 0)
>  		goto out_unregister;
>  
> @@ -1300,7 +1300,7 @@ int v4l2_async_register_subdev_sensor(struct v4l2_subdev *sd)
>  
>  	return ret;
>  }
> -EXPORT_SYMBOL_GPL(v4l2_async_register_subdev_sensor);
> +EXPORT_SYMBOL_GPL(__v4l2_async_register_subdev_sensor);
>  
>  MODULE_DESCRIPTION("V4L2 fwnode binding parsing library");
>  MODULE_LICENSE("GPL");
> diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
> index f26c323e9c96..54a2d9620ed5 100644
> --- a/include/media/v4l2-async.h
> +++ b/include/media/v4l2-async.h
> @@ -333,8 +333,10 @@ int __v4l2_async_register_subdev(struct v4l2_subdev *sd, struct module *module);
>   * An error is returned if the module is no longer loaded on any attempts
>   * to register it.
>   */
> +#define v4l2_async_register_subdev_sensor(sd) \
> +	__v4l2_async_register_subdev_sensor(sd, THIS_MODULE)
>  int __must_check
> -v4l2_async_register_subdev_sensor(struct v4l2_subdev *sd);
> +__v4l2_async_register_subdev_sensor(struct v4l2_subdev *sd, struct module *module);
>  
>  /**
>   * v4l2_async_unregister_subdev - unregisters a sub-device to the asynchronous

-- 
Regards,

Laurent Pinchart

