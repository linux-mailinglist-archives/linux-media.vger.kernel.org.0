Return-Path: <linux-media+bounces-57460-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WP5ML0AGyGlggQUAu9opvQ
	(envelope-from <linux-media+bounces-57460-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 17:48:00 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B9534F35F
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 17:48:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC19C301E94E
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 16:47:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B8DE376472;
	Sat, 28 Mar 2026 16:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="U8cF6+2j"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F0139FCE;
	Sat, 28 Mar 2026 16:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774716470; cv=none; b=fHk43bOeZSIgpYoG92A5NUqyqOLvnnqffiFFJAvXikaK7uMZWCE+3dOnMnp1OjiRfwV/aqZntS1ZrOPCUkE2ZcASvMlC9Qqs+Kdq4dxoeL43xiBSVvoJZhlsTE1UL5WEn9oJsZTCDhZswBarDwU5XNa+32/VvHJq1aB5XD2DPvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774716470; c=relaxed/simple;
	bh=9cn0r8AApmFF8sTBlbXGdNqC8zPE9f4xN9pEdLKt1WY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hg9AYXbh6rT7ShKacIY3a7mUpzMz79mkJeYmvk+G5V2CIv2oTQEk48w3GMgPb1qzE0hI2YOyUJ8mfDt6LlhLlOxtzq2YmDdfkv0bq0NEZGo9VuSEWOvXvEryMrP9qti6GIBZs4SQ3QYI3iBf+zKQE8Vclr8YnMhGYn6GOA7Qhr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=U8cF6+2j; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C32DF3DA;
	Sat, 28 Mar 2026 17:46:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774716386;
	bh=9cn0r8AApmFF8sTBlbXGdNqC8zPE9f4xN9pEdLKt1WY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U8cF6+2jROJNuGGYdfCV8kWTETk/JEupIaTHWhpnkVpR8xTT1HZbGYiyYWArlfaZa
	 TE2lN1pmjh6f9LaXYYaM/pLcKKSqvKgLJfVaLAgSMTft4Njv8ibm/QqsPrwYALyctU
	 QPNj791n6rJeflZY7G2sxQqv+sGAtR64Z7XpVuSk=
Date: Sat, 28 Mar 2026 17:47:44 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: David Carlier <devnexen@gmail.com>
Cc: dan.scally@ideasonboard.com, jacopo.mondi@ideasonboard.com, 
	mchehab@kernel.org, nayden.kanchev@arm.com, hverkuil+cisco@kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] media: mali-c55: add missing
 of_reserved_mem_device_release()
Message-ID: <acgGB8K8ostsDhlZ@zed>
References: <20260328151452.148901-1-devnexen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260328151452.148901-1-devnexen@gmail.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57460-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email]
X-Rspamd-Queue-Id: 23B9534F35F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi David

On Sat, Mar 28, 2026 at 03:14:50PM +0000, David Carlier wrote:
> mali_c55_probe() calls of_reserved_mem_device_init() to associate
> reserved memory regions with the device. This function allocates a
> struct rmem_assigned_device and adds it to a global linked list, which
> must be explicitly released via of_reserved_mem_device_release() — there
> is no devm variant of this API.
>
> However, neither the probe error paths nor mali_c55_remove() called
> of_reserved_mem_device_release(). Any probe failure after the
> of_reserved_mem_device_init() call, as well as every normal device
> removal, leaked the reserved memory association on the global list.
>
> Fix this by adding an err_release_mem label at the end of the probe
> error chain and calling of_reserved_mem_device_release() in
> mali_c55_remove(). The remove teardown order is also corrected to call
> mali_c55_media_frameworks_deinit() before kfree(), mirroring the probe
> init order in reverse.
>
> Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
> Signed-off-by: David Carlier <devnexen@gmail.com>

Seems like you forgot my tag here:
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
   j

> ---
>  drivers/media/platform/arm/mali-c55/mali-c55-core.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> index c1a562cd214e..5cb59c70ffc9 100644
> --- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> @@ -806,8 +806,10 @@ static int mali_c55_probe(struct platform_device *pdev)
>  	vb2_dma_contig_set_max_seg_size(dev, UINT_MAX);
>
>  	ret = __mali_c55_power_on(mali_c55);
> -	if (ret)
> -		return dev_err_probe(dev, ret, "failed to power on\n");
> +	if (ret) {
> +		dev_err_probe(dev, ret, "failed to power on\n");
> +		goto err_release_mem;
> +	}
>
>  	ret = mali_c55_check_hwcfg(mali_c55);
>  	if (ret)
> @@ -846,6 +848,8 @@ static int mali_c55_probe(struct platform_device *pdev)
>  	kfree(mali_c55->context.registers);
>  err_power_off:
>  	__mali_c55_power_off(mali_c55);
> +err_release_mem:
> +	of_reserved_mem_device_release(dev);
>
>  	return ret;
>  }
> @@ -854,8 +858,9 @@ static void mali_c55_remove(struct platform_device *pdev)
>  {
>  	struct mali_c55 *mali_c55 = platform_get_drvdata(pdev);
>
> -	kfree(mali_c55->context.registers);
>  	mali_c55_media_frameworks_deinit(mali_c55);
> +	kfree(mali_c55->context.registers);
> +	of_reserved_mem_device_release(&pdev->dev);
>  }
>
>  static const struct of_device_id mali_c55_of_match[] = {
> --
> 2.53.0
>

