Return-Path: <linux-media+bounces-6616-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E77874C28
	for <lists+linux-media@lfdr.de>; Thu,  7 Mar 2024 11:19:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F2AF6B21CCD
	for <lists+linux-media@lfdr.de>; Thu,  7 Mar 2024 10:19:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2E1B8526A;
	Thu,  7 Mar 2024 10:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PWxo4p+v"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416A284FD3
	for <linux-media@vger.kernel.org>; Thu,  7 Mar 2024 10:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709806754; cv=none; b=i0/beYtEhM/E6Sm8FR/Hw7Euk4KMgl/caCZIJOSXWAukx3PACnxi0efJsA2gA3Z0zCgHDr9OqhfcRxlgtOIdJfS7H+WV+gWzFCnnZ9kldlPLUu5OsZqgIYTRXng7c7Od+IJplv+Q4huRptT7RzhshecSS0LL5LyZ9HEPR6jvvqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709806754; c=relaxed/simple;
	bh=JWn24y+2/RbKkNxa/CZtipc3VA0z2QHy1wcgFklfuYA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UlluXTxz1URvMBZpFC/6t/toLzJh3Whnu/1YawT8Ytxe7J+6E0d0cYtGN1p4Z7an4Eu7RyoYJA0aMCeUt/JAcq+kxMzNfJL0/XTpigJRy+SzoX5HBDNWGk5OFkT7RLt5cWn4sYlEz/iwsuLxOG+Bb9VqrXEwp+DwtBhDNcRlZrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PWxo4p+v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C573FC433F1;
	Thu,  7 Mar 2024 10:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709806753;
	bh=JWn24y+2/RbKkNxa/CZtipc3VA0z2QHy1wcgFklfuYA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PWxo4p+v8JE4fYBZXhrlj8lXitP9biH4CKibdnS2Pth5RSv9eTCcVD9hEWTvEruO5
	 EcjAE2J9U712NBr8RpJalUftLU5ABesAwUEMb7umf6MZcdWvm4RIW3qeSgzlHDwiS4
	 jS/ibAzJbcQSGBVw7XO8SS/VthvrC9qx+0rL/mjkE2qfUiz2O/z/fVmEhbLv8kT0xz
	 yVJDTRZJ6aKLfIAknERMeRtVrqqcsyZFqt34FXAMJd6T/3dyHGO4Vn7uy/oaJLogn+
	 jGSg0UY1rSEAqbFB+EzZox+Mp0zXIDaBqNKrkCMEXfqMC0jRNfFjgSm4rO7swHeVcz
	 NAL5bQbKdYqoA==
Message-ID: <96ae72a4-9f24-4082-b374-44ec7c036e9c@kernel.org>
Date: Thu, 7 Mar 2024 11:19:08 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 05/13] staging: vchiq_arm: Add 36-bit address support
To: Maarten Vanraes <maarten@rmail.be>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 linux-media@vger.kernel.org
Cc: Kieran Bingham <kbingham@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Umang Jain <umang.jain@ideasonboard.com>, Phil Elwell <phil@raspberrypi.com>
References: <20240303152635.2762696-1-maarten@rmail.be>
 <20240303152635.2762696-6-maarten@rmail.be>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240303152635.2762696-6-maarten@rmail.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/03/2024 16:10, Maarten Vanraes wrote:
> From: Phil Elwell <phil@raspberrypi.com>
> 
> Conditional on a new compatible string, change the pagelist encoding
> such that the top 24 bits are the pfn, leaving 8 bits for run length
> (-1), giving a 36-bit address range.
> 
> Manage the split between addresses for the VPU and addresses for the
> 40-bit DMA controller with a dedicated DMA device pointer that on non-
> BCM2711 platforms is the same as the main VCHIQ device. This allows
> the VCHIQ node to stay in the usual place in the DT.
> 
> Signed-off-by: Phil Elwell <phil@raspberrypi.com>
> Signed-off-by: Maarten Vanraes <maarten@rmail.be>
> ---


>  
>  	/* Partial cache lines (fragments) require special measures */
> @@ -413,7 +461,7 @@ free_pagelist(struct vchiq_instance *instance, struct vchiq_pagelist_info *pagel
>  	 * NOTE: dma_unmap_sg must be called before the
>  	 * cpu can touch any of the data/pages.
>  	 */
> -	dma_unmap_sg(instance->state->dev, pagelistinfo->scatterlist,
> +	dma_unmap_sg(g_dma_dev, pagelistinfo->scatterlist,
>  		     pagelistinfo->num_pages, pagelistinfo->dma_dir);
>  	pagelistinfo->scatterlist_mapped = 0;
>  
> @@ -468,6 +516,7 @@ free_pagelist(struct vchiq_instance *instance, struct vchiq_pagelist_info *pagel
>  static int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state *state)
>  {
>  	struct device *dev = &pdev->dev;
> +	struct device *dma_dev = NULL;
>  	struct vchiq_drvdata *drvdata = platform_get_drvdata(pdev);
>  	struct rpi_firmware *fw = drvdata->fw;
>  	struct vchiq_slot_zero *vchiq_slot_zero;
> @@ -489,6 +538,24 @@ static int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state
>  	g_cache_line_size = drvdata->cache_line_size;
>  	g_fragments_size = 2 * g_cache_line_size;
>  
> +	if (drvdata->use_36bit_addrs) {
> +		struct device_node *dma_node =
> +			of_find_compatible_node(NULL, NULL, "brcm,bcm2711-dma");

Why do you look up nodes by compatible instead of phandle? That's
fragile. Makes relationship undocumented, probing not ordered and is
completely non-portable between different devices.

You have basically here deferred probe issue.

Best regards,
Krzysztof


