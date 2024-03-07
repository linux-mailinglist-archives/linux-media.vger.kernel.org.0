Return-Path: <linux-media+bounces-6617-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E6A874C4F
	for <lists+linux-media@lfdr.de>; Thu,  7 Mar 2024 11:23:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 788101C20E53
	for <lists+linux-media@lfdr.de>; Thu,  7 Mar 2024 10:23:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1207685269;
	Thu,  7 Mar 2024 10:23:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail.rmail.be (mail.rmail.be [85.234.218.189])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 275101C6BE
	for <linux-media@vger.kernel.org>; Thu,  7 Mar 2024 10:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.234.218.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709807003; cv=none; b=g5DvVs0cCAZaoqZz59xve6ZQaO+1vkp2Y+R+WFUAoDG7c+NmBedfjC6fy62kW5QgJje5+wwrlqYqDkOThHEzXbgQ52klmGrr/2QufZifDLP9ylYVZFymQkItpbSpQzp8quFJh4NTpHMScK0PCjFgP7/aQ6XX85V3DzmFSgKxd60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709807003; c=relaxed/simple;
	bh=neVVAQWxiwkgUBHOqAuVY+3XDpWMJWF2fUI9SkQMgqg=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=L3vN8Xrx0CgC1iZnretepTAqNWDwDAC0md6qBwfla9c2lUGfcOjlOUzJrNFYazh8D+e/ncUSyW0DpKq2WLr/A7uR1njKktTuH548Rw7DMijPe0h29j6tKJF5KTiSPFSLeKrmWIrhxS7fUePkLuXe39hTf/8jBLImFXAVh7i9c9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rmail.be; spf=pass smtp.mailfrom=rmail.be; arc=none smtp.client-ip=85.234.218.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rmail.be
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rmail.be
Received: from mail.rmail.be (domotica.rmail.be [10.238.9.4])
	by mail.rmail.be (Postfix) with ESMTP id 4B2A74CC22;
	Thu,  7 Mar 2024 11:23:13 +0100 (CET)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 07 Mar 2024 11:23:13 +0100
From: Maarten <maarten@rmail.be>
To: Krzysztof Kozlowski <krzk@kernel.org>, Raspberry Pi Kernel Maintenance
 <kernel-list@raspberrypi.com>, linux-media@vger.kernel.org
Cc: Kieran Bingham <kbingham@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Umang Jain
 <umang.jain@ideasonboard.com>, Phil Elwell <phil@raspberrypi.com>
Subject: Re: [RFC PATCH 05/13] staging: vchiq_arm: Add 36-bit address support
In-Reply-To: <96ae72a4-9f24-4082-b374-44ec7c036e9c@kernel.org>
References: <20240303152635.2762696-1-maarten@rmail.be>
 <20240303152635.2762696-6-maarten@rmail.be>
 <96ae72a4-9f24-4082-b374-44ec7c036e9c@kernel.org>
Message-ID: <be14e28fe6ec078f953baccb2d5fc93c@rmail.be>
X-Sender: maarten@rmail.be
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Krzysztof Kozlowski schreef op 2024-03-07 11:19:
> On 03/03/2024 16:10, Maarten Vanraes wrote:
>> From: Phil Elwell <phil@raspberrypi.com>
>> 
>> Conditional on a new compatible string, change the pagelist encoding
>> such that the top 24 bits are the pfn, leaving 8 bits for run length
>> (-1), giving a 36-bit address range.
>> 
>> Manage the split between addresses for the VPU and addresses for the
>> 40-bit DMA controller with a dedicated DMA device pointer that on non-
>> BCM2711 platforms is the same as the main VCHIQ device. This allows
>> the VCHIQ node to stay in the usual place in the DT.
>> 
>> Signed-off-by: Phil Elwell <phil@raspberrypi.com>
>> Signed-off-by: Maarten Vanraes <maarten@rmail.be>
>> ---
> 
> 
>> 
>>  	/* Partial cache lines (fragments) require special measures */
>> @@ -413,7 +461,7 @@ free_pagelist(struct vchiq_instance *instance, 
>> struct vchiq_pagelist_info *pagel
>>  	 * NOTE: dma_unmap_sg must be called before the
>>  	 * cpu can touch any of the data/pages.
>>  	 */
>> -	dma_unmap_sg(instance->state->dev, pagelistinfo->scatterlist,
>> +	dma_unmap_sg(g_dma_dev, pagelistinfo->scatterlist,
>>  		     pagelistinfo->num_pages, pagelistinfo->dma_dir);
>>  	pagelistinfo->scatterlist_mapped = 0;
>> 
>> @@ -468,6 +516,7 @@ free_pagelist(struct vchiq_instance *instance, 
>> struct vchiq_pagelist_info *pagel
>>  static int vchiq_platform_init(struct platform_device *pdev, struct 
>> vchiq_state *state)
>>  {
>>  	struct device *dev = &pdev->dev;
>> +	struct device *dma_dev = NULL;
>>  	struct vchiq_drvdata *drvdata = platform_get_drvdata(pdev);
>>  	struct rpi_firmware *fw = drvdata->fw;
>>  	struct vchiq_slot_zero *vchiq_slot_zero;
>> @@ -489,6 +538,24 @@ static int vchiq_platform_init(struct 
>> platform_device *pdev, struct vchiq_state
>>  	g_cache_line_size = drvdata->cache_line_size;
>>  	g_fragments_size = 2 * g_cache_line_size;
>> 
>> +	if (drvdata->use_36bit_addrs) {
>> +		struct device_node *dma_node =
>> +			of_find_compatible_node(NULL, NULL, "brcm,bcm2711-dma");
> 
> Why do you look up nodes by compatible instead of phandle? That's
> fragile. Makes relationship undocumented, probing not ordered and is
> completely non-portable between different devices.
> 
> You have basically here deferred probe issue.
> 
> Best regards,
> Krzysztof

ack

Maarten

