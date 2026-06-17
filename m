Return-Path: <linux-media+bounces-65081-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TEBFCdozMmrfwgUAu9opvQ
	(envelope-from <linux-media+bounces-65081-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 07:42:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CF5696A50
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 07:42:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=g7dbKKiM;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65081-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-65081-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 92263300CD9C
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 05:42:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C84E13A2551;
	Wed, 17 Jun 2026 05:42:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47679398911
	for <linux-media@vger.kernel.org>; Wed, 17 Jun 2026 05:42:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781674957; cv=none; b=TwuootBNngYQOiMai0jsVGqfF5dCGEV8iikg9cyNzLVaDHgAB7cN+chZX8MqElXYmCPtakH9HYlQWBS1s0HEL5vudbEbm8/IcPgH1lfL3B7J6FtQEiFE6l/5dkJF7oFIqieGtXJOj5Y07zFdeElxK4qV9nafn1Qtcc5Jjg3wJvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781674957; c=relaxed/simple;
	bh=toAL4P8koR03lBmINjh2gkwx/rIuLX1XR+YviHkTR5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j4fWgTp0GIB4ir5U4rhENrq0rhQMMR1whB005oCVYira1NpSo4gPsqLAjqHW8f2DWY2UHYoXie3fjsAxSpzX27jVIsfOIGdpxDL7McRXWRG9eotQh+Vsfss0srjX62Gzs/QosFt/N6M+2Rc8oVsbS7sJRbLhVBXH94YcL/Lt1m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g7dbKKiM; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96CA31F000E9;
	Wed, 17 Jun 2026 05:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781674955;
	bh=6SD8Z1YCPnIWrorGtt/GdWugpHUxmHgG9hu8SzdQDRA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=g7dbKKiMs/xXQKNyEZU7kahPAKBsbvtl3hEgPXItmP4XpghPn2DmUiY8yAz/GK/Uk
	 2GhaWh2txbn9X9Lj0pQpSvFrVHZ/dNdi7NDJA/kX/qgGNx3/e9y6XWEkB3ZiRF5slw
	 kwYFQNIqM1gSQ+gyjeuqsz7BRCvEu1WtHcoLNNVZYUaVTw7jzcD7bwMiFog1THu9y+
	 tgbdT6rPcfdixnvTp/VxZRgCGKL08oJVMIbEP3O0jfzKLM2paQbIuS+XD/NwVwr3R2
	 VTYV2rMGOdrxPSsOHYWdIBPmgBfJdjqc1Dp3tn3aZN7Ow3aC8OvfP691UiJTwwXMcv
	 IETu+/cU7OMbw==
Date: Wed, 17 Jun 2026 07:42:29 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Biren Pandya <birenpandya@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Steve Longerbeam <slongerbeam@gmail.com>
Subject: Re: [PATCH v2 2/3] media: i2c: imx290: Drop manual
 fwnode_handle_put() via scope-based cleanup
Message-ID: <u254qskadeyu7ek4qwc27eke26uzppfi7juoon3vjjkmkfflxr@v4xa5k4cp5nc>
References: <20260616081517.44685-1-birenpandya@gmail.com>
 <20260616081517.44685-3-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260616081517.44685-3-birenpandya@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:birenpandya@gmail.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:dave.stevenson@raspberrypi.com,m:slongerbeam@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mani@kernel.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-65081-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,vger.kernel.org,raspberrypi.com,gmail.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,linaro.org:email,v4xa5k4cp5nc:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C5CF5696A50

On Tue, Jun 16, 2026 at 01:45:16PM +0530, Biren Pandya wrote:
> Utilize the __free(fwnode_handle) scoped guard macro from
> <linux/cleanup.h> to automate the lifecycle management of the endpoint
> fwnode in imx290_parse_dt().
> 
> This safely ties the release of the fwnode_handle to its compiler
> scope, allowing us to drop the manual fwnode_handle_put() call and
> removing the risk of missed puts if new early returns are added in
> the future.
> 
> Signed-off-by: Biren Pandya <birenpandya@gmail.com>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> ---
>  drivers/media/i2c/imx290.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index 21cbc81cb2ed..5c369c7ee21f 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -8,6 +8,7 @@
>   * Author: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>   */
>  
> +#include <linux/cleanup.h>
>  #include <linux/clk.h>
>  #include <linux/delay.h>
>  #include <linux/gpio/consumer.h>
> @@ -1514,7 +1515,7 @@ static int imx290_parse_dt(struct imx290 *imx290)
>  	struct v4l2_fwnode_endpoint ep = {
>  		.bus_type = V4L2_MBUS_CSI2_DPHY
>  	};
> -	struct fwnode_handle *endpoint;
> +	struct fwnode_handle *endpoint __free(fwnode_handle) = NULL;
>  	int ret;
>  	s64 fq;
>  
> @@ -1527,7 +1528,6 @@ static int imx290_parse_dt(struct imx290 *imx290)
>  	}
>  
>  	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &ep);
> -	fwnode_handle_put(endpoint);
>  	if (ret == -ENXIO) {
>  		dev_err(imx290->dev, "Unsupported bus type, should be CSI2\n");
>  		goto done;
> -- 
> 2.50.1 (Apple Git-155)
> 

-- 
மணிவண்ணன் சதாசிவம்

