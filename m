Return-Path: <linux-media+bounces-64885-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lqFrOrCsL2qcEQUAu9opvQ
	(envelope-from <linux-media+bounces-64885-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 09:41:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1CC68447C
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 09:41:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=mfPCEQbS;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64885-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64885-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8A197300FFB6
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 07:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EEBC3BED69;
	Mon, 15 Jun 2026 07:41:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484113002DC;
	Mon, 15 Jun 2026 07:41:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781509293; cv=none; b=u5MvTD0jTxHJm4G1gWI0HFrpD6uHgCOcWCpqbI9FDOrmiIZQC2Z/enW2l1dDu1NBmcbeSKhkI/c9xeu5/cq7iVfde61qetkrRI4yPnOE2kZMmjvB2c66Y/Fgq5XZCzyAKJT6LPlJmw0HehcdYR0JyVqP6qAwYnP8KTdaurY6dBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781509293; c=relaxed/simple;
	bh=NKTJH16xWvGidL00ofxeyNXkdXkIR7U3OcaQPJYQguc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bY+iQg1jDAIU+FIs1ugIOX31wANYXRjfNPu/COYik1j3dHzE3M81YIA++sohk29Qc1Z1eR2yteL6ZFmgk8CUNFI6bG8uGVf1a1thtlDeGgvIvLdaxUgN33okgJQCRD3XJ719pEdIkEMaEM0RIvfXU3UdbhOCFnV3/D1J+3lPqhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mfPCEQbS; arc=none smtp.client-ip=213.167.242.64
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B2F05591;
	Mon, 15 Jun 2026 09:40:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781509256;
	bh=NKTJH16xWvGidL00ofxeyNXkdXkIR7U3OcaQPJYQguc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mfPCEQbSEomeh3lwvN/RnZER1B3+gO3UMCBktPcfcKTGQq7p/ZxU9sFOfgngiKHVc
	 2taifzD2F1ICsktZvzhlOhxqtgF4XIFt3vPwG9N4dY6mnnuTHPRx+yCYCHX4qKsRYU
	 zjrFl2MhL2A9Umd+IIaAy8fJEODBkNmzF3y6bQRQ=
Date: Mon, 15 Jun 2026 10:41:27 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biren Pandya <birenpandya@gmail.com>
Cc: linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
	mchehab@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: mt9p031: fix endpoint parsing use-after-free
Message-ID: <20260615074127.GE1982714@killaraus.ideasonboard.com>
References: <20260613084849.57897-1-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260613084849.57897-1-birenpandya@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:birenpandya@gmail.com,m:linux-media@vger.kernel.org,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-64885-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,killaraus.ideasonboard.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5B1CC68447C

On Sat, Jun 13, 2026 at 02:18:49PM +0530, Biren Pandya wrote:
> The mt9p031_probe() function calls fwnode_handle_put(np) immediately
> after parsing the endpoint. However, it subsequently calls
> fwnode_property_read_u32() twice using the same 'np' handle, leading
> to a potential use-after-free.
> 
> Fix this by moving fwnode_handle_put(np) to the end of the endpoint
> property reading block, and adding it to the error path of
> v4l2_fwnode_endpoint_parse().
> 
> Signed-off-by: Biren Pandya <birenpandya@gmail.com>
> ---
>  drivers/media/i2c/mt9p031.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
> index ea5d43d..04c17cb 100644
> --- a/drivers/media/i2c/mt9p031.c
> +++ b/drivers/media/i2c/mt9p031.c
> @@ -1075,15 +1075,18 @@ static int mt9p031_parse_properties(struct mt9p031 *mt9p031, struct device *dev)
>  		return dev_err_probe(dev, -EINVAL, "endpoint node not found\n");
>  
>  	ret = v4l2_fwnode_endpoint_parse(np, &endpoint);
> -	fwnode_handle_put(np);
> -	if (ret)
> +	if (ret) {
> +		fwnode_handle_put(np);
>  		return dev_err_probe(dev, -EINVAL, "could not parse endpoint\n");
> +	}
>  
>  	fwnode_property_read_u32(np, "input-clock-frequency",
>  				 &mt9p031->ext_freq);
>  	fwnode_property_read_u32(np, "pixel-clock-frequency",
>  				 &mt9p031->target_freq);
>  
> +	fwnode_handle_put(np);
> +

This seems to be a candidate for __free().

>  	mt9p031->pixclk_pol = !!(endpoint.bus.parallel.flags &
>  				 V4L2_MBUS_PCLK_SAMPLE_RISING);
>  

-- 
Regards,

Laurent Pinchart

