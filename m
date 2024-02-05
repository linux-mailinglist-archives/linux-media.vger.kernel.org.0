Return-Path: <linux-media+bounces-4712-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A7814849D98
	for <lists+linux-media@lfdr.de>; Mon,  5 Feb 2024 16:00:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C4591F24994
	for <lists+linux-media@lfdr.de>; Mon,  5 Feb 2024 15:00:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 222AD2C859;
	Mon,  5 Feb 2024 14:58:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0CD52C842
	for <linux-media@vger.kernel.org>; Mon,  5 Feb 2024 14:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707145128; cv=none; b=FLY5iOoqVOJ7t/v0GYrcWWFfmcuHE4FFIRLlSiROrcZMk5Hr1PeDQQpsxbE7ZpARIZmcBO2VBoxKSdbm16SIAnOBFt0P+76dReMIAV7aokyaAiDb4j2HEPADeMbbsntxTq+ym058q/ryWVuGyAtHuZMSh+jYpI1b8Pvvlwq44lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707145128; c=relaxed/simple;
	bh=SOtnKThXKI1544SFX36otHpMOdMfZrKE5Je9gyIRQKU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f8ZSYMZ5dpz1a9BZCnkBlUq5qsktubTBqF03/EcokV9mdXigZIURvyWObVu5muRYEHZVxQ4/XM+r/z0FpiF7+GheC34Vw2bLXJCLkU6Q497KLfoBP4ZT9vYIkHlfY+H8PemgBcugKacSLQs+bXIlf9EgvM6gpK9XXghQH7u2YgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FCFFC433F1;
	Mon,  5 Feb 2024 14:58:47 +0000 (UTC)
Message-ID: <3a6fe3d1-8b1d-411e-83c9-9611ce4aea67@xs4all.nl>
Date: Mon, 5 Feb 2024 15:58:45 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 21/29] media: ipu3-cio2: Request IRQ earlier
Content-Language: en-US, nl
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com
References: <20231220103713.113386-1-sakari.ailus@linux.intel.com>
 <20231220103713.113386-22-sakari.ailus@linux.intel.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20231220103713.113386-22-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/12/2023 11:37, Sakari Ailus wrote:
> Call devm_request_irq() before registering the async notifier, as otherwise
> it would be possible to use the device before the interrupts could be
> deliveted to the driver.

deliveted -> delivered

Isn't this a regular fix? Ditto for the previous patch (20/29).

I'd just queue this up in the next PR.

Regards,

	Hans

> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/pci/intel/ipu3/ipu3-cio2.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> index da82d09b46ab..3222ec5b8345 100644
> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> @@ -1789,11 +1789,6 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
>  
>  	v4l2_async_nf_init(&cio2->notifier, &cio2->v4l2_dev);
>  
> -	/* Register notifier for subdevices we care */
> -	r = cio2_parse_firmware(cio2);
> -	if (r)
> -		goto fail_clean_notifier;
> -
>  	r = devm_request_irq(dev, pci_dev->irq, cio2_irq, IRQF_SHARED,
>  			     CIO2_NAME, cio2);
>  	if (r) {
> @@ -1801,6 +1796,11 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
>  		goto fail_clean_notifier;
>  	}
>  
> +	/* Register notifier for subdevices we care */
> +	r = cio2_parse_firmware(cio2);
> +	if (r)
> +		goto fail_clean_notifier;
> +
>  	pm_runtime_put_noidle(dev);
>  	pm_runtime_allow(dev);
>  


