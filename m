Return-Path: <linux-media+bounces-57182-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJswFfqtxWlrAwUAu9opvQ
	(envelope-from <linux-media+bounces-57182-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 23:06:50 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D619333C362
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 23:06:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3CBFF3038411
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 22:06:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E4F933D4EE;
	Thu, 26 Mar 2026 22:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Q7orTpjp"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276D5332EAC
	for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 22:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774562787; cv=none; b=IpYlmHaEG0jnzUApFahREtkdFjeW3VOn0uOhnOLANTvqlOMjzDiFBvFevoNM/J6sYWJU4yO1YJG2zuZ7MI88rBjxNZ531d36NzRChsY8s3/0I+0yD/0KuRkvq6APualGVbIs1NgfHVkNTulyxm9EiaocD/DETU5XE2WkYtFvPF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774562787; c=relaxed/simple;
	bh=pG0RTOpimdu3SPyFIJ60C1JXcLfLT5bSW14EI2irnJY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lFJQeoVMkdeXw+SZYuBqirT71qgVXFwJFgQ28mg7gBRrvUhzosbjt4HiWgTRHIUbGYygP1N+WRNFPL3HZBJWRjdBU9kXLdDfm23lc1X70P8VP3cnn6U3I0+Y7NLXBOGjxQgKpXtzMFcoq+ARzmhVzrbTiu+ZCxvHuYu1FjDBVl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Q7orTpjp; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 06E3AC59;
	Thu, 26 Mar 2026 23:05:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774562702;
	bh=pG0RTOpimdu3SPyFIJ60C1JXcLfLT5bSW14EI2irnJY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Q7orTpjpCBri2l78IVGN8CsTsBwV/lA+koooSOUyhuEgXJpUBlpllOI1AM/UD0W8E
	 TTvVtuZqifgX8UdGtI97W76fE591eS9GMBJ5ybI7crMZReDK7kxCB2gwcDBO7ZbiVK
	 lgXWacdHciqg8jJ1fabQvJUid4nfv+7/XMOczY5M=
Message-ID: <8c8b08e2-15ee-4d55-ae67-7d51feae03ff@ideasonboard.com>
Date: Thu, 26 Mar 2026 22:06:18 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: mali-c55: fix resource leaks in probe and remove
To: David Carlier <devnexen@gmail.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nayden Kanchev <nayden.kanchev@arm.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org
References: <20260326190052.11780-1-devnexen@gmail.com>
 <20260326203339.35852-1-devnexen@gmail.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20260326203339.35852-1-devnexen@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57182-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,ideasonboard.com,kernel.org,arm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.scally@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid]
X-Rspamd-Queue-Id: D619333C362
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi David - thanks for the patch

On 26/03/2026 20:33, David Carlier wrote:
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
> Additionally, pm_runtime_enable() called during probe was never undone
> in mali_c55_remove(), leaving the device's runtime PM state enabled
> after the driver is unbound. The probe error path had a related issue:
> when mali_c55_media_frameworks_init() failed, the goto target jumped
> directly to err_free_context_registers, skipping pm_runtime_disable()
> despite pm_runtime having already been enabled earlier in the function.
> 
> Fix these issues by:
>   - Adding an err_release_mem label at the end of the error chain so all
>     post-init failure paths release the reserved memory association.
>   - Splitting pm_runtime_disable() into its own err_runtime_disable label
>     so the media frameworks init failure correctly unwinds it.
>   - Adding of_reserved_mem_device_release() and pm_runtime_disable() to
>     mali_c55_remove(), with the teardown order mirroring probe in
>     reverse.
> 
> Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
> Signed-off-by: David Carlier <devnexen@gmail.com>

This all looks good to me - thank you for catching the problems

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

> ---
>   .../media/platform/arm/mali-c55/mali-c55-core.c  | 16 +++++++++++-----
>   1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> index c1a562cd214e..de895b69d786 100644
> --- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> @@ -806,8 +806,10 @@ static int mali_c55_probe(struct platform_device *pdev)
>   	vb2_dma_contig_set_max_seg_size(dev, UINT_MAX);
>   
>   	ret = __mali_c55_power_on(mali_c55);
> -	if (ret)
> -		return dev_err_probe(dev, ret, "failed to power on\n");
> +	if (ret) {
> +		dev_err_probe(dev, ret, "failed to power on\n");
> +		goto err_release_mem;
> +	}
>   
>   	ret = mali_c55_check_hwcfg(mali_c55);
>   	if (ret)
> @@ -826,7 +828,7 @@ static int mali_c55_probe(struct platform_device *pdev)
>   
>   	ret = mali_c55_media_frameworks_init(mali_c55);
>   	if (ret)
> -		goto err_free_context_registers;
> +		goto err_runtime_disable;
>   
>   	pm_runtime_idle(&pdev->dev);
>   
> @@ -841,11 +843,13 @@ static int mali_c55_probe(struct platform_device *pdev)
>   
>   err_deinit_media_frameworks:
>   	mali_c55_media_frameworks_deinit(mali_c55);
> +err_runtime_disable:
>   	pm_runtime_disable(&pdev->dev);
> -err_free_context_registers:
>   	kfree(mali_c55->context.registers);
>   err_power_off:
>   	__mali_c55_power_off(mali_c55);
> +err_release_mem:
> +	of_reserved_mem_device_release(dev);
>   
>   	return ret;
>   }
> @@ -854,8 +858,10 @@ static void mali_c55_remove(struct platform_device *pdev)
>   {
>   	struct mali_c55 *mali_c55 = platform_get_drvdata(pdev);
>   
> -	kfree(mali_c55->context.registers);
>   	mali_c55_media_frameworks_deinit(mali_c55);
> +	pm_runtime_disable(&pdev->dev);
> +	kfree(mali_c55->context.registers);
> +	of_reserved_mem_device_release(&pdev->dev);
>   }
>   
>   static const struct of_device_id mali_c55_of_match[] = {


