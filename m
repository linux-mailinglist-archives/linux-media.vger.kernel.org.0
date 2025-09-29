Return-Path: <linux-media+bounces-43333-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD008BA8DE5
	for <lists+linux-media@lfdr.de>; Mon, 29 Sep 2025 12:20:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 687DA3B0E7D
	for <lists+linux-media@lfdr.de>; Mon, 29 Sep 2025 10:20:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A74422FB989;
	Mon, 29 Sep 2025 10:20:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D5B22FB62B;
	Mon, 29 Sep 2025 10:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759141243; cv=none; b=s3ZZ7zXH5gim7ZGzZp0ahukBGav0V5pXJU+CP2U8u6ONChWd89IP3tCru12NhfzHm1Kz78Ap3RZ+QQQxRfyFvN5XyQPtDIYf/yeMR3cW67qjBHNuP2yk98UZkYn5hPn30mqRZIvlqORh2EjZgzdN2IouSGSS4t6phOTM19Q5NJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759141243; c=relaxed/simple;
	bh=iQbslAWaCshqu1eHy2Ws5vifw8ykJDXAYtKPCCCm718=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i9uXF70twz7FCchd1AxbD5tKtFLg1S5kNFFiMauXMhAkw6nrOrRHbbR0y2IhEJbqFitpXq6GrCPn3ZLPeJdJ7lOwb7R3/AiIATenn9QH1oWJKGOvtb9Q5ceQfOsVKxedHUbBapaqvapJqrz1xOEyogHoZUwBZAr4e3l0gJClCKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 86C82150C;
	Mon, 29 Sep 2025 03:20:32 -0700 (PDT)
Received: from [10.57.34.17] (unknown [10.57.34.17])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C364E3F66E;
	Mon, 29 Sep 2025 03:20:37 -0700 (PDT)
Message-ID: <aec0f40a-8346-4194-8b18-1022fe3366bb@arm.com>
Date: Mon, 29 Sep 2025 11:20:34 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/3] Introduce iommu-map-masked for platform devices
To: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>, joro@8bytes.org,
 will@kernel.org, saravanak@google.com, conor+dt@kernel.org, robh@kernel.org,
 mchehab@kernel.org, bod@kernel.org, krzk+dt@kernel.org,
 abhinav.kumar@linux.dev, vikash.garodia@oss.qualcomm.com,
 dikshita.agarwal@oss.qualcomm.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev
References: <20250928171718.436440-1-charan.kalla@oss.qualcomm.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250928171718.436440-1-charan.kalla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025-09-28 6:17 pm, Charan Teja Kalla wrote:
> This series introduces a new iommu property called iommu-map-masked(may
> be there is a better name), which is used to represent the IOMMU
> specifier pairs for each function of a __multi-functional platform
> device__, where each function can emit unique master id(s) that can be
> associated with individual translation context.
> 
> Currently, the iommu configuration - at least for arm architecture-
> requires all the functions of a platform device will be represented
> under single dt node thus endup in using only a single translation
> context.
> 
> A simple solution to associate individual translation context for each
> function of a device can be through creating per function child nodes in
> the device tree, but dt is only to just represent the soc layout to
> linux kernel.
> 
> Supporting such cases requires a new iommu property called,
> iommu-map-masked(taking cue from iommu-map for pci devices) and syntax
> is:
>     iommu-map-masked = <FUNCTION_ID1 &iommu ID1 MASK1>,
> 		      <FUNCTION_ID2 &iommu ID2 MASK2>;
> NOTE: As an RFC, it is considered that this property always expects 4
> cells.
> 
> During the probe phase of the driver for a multi-functional device
> behind an IOMMU, a child device is instantiated for each FUNCTION_ID.
> The call to of_dma_configure_id() on each child sets up the IOMMU
> configuration, ensuring that each function of the device is associated
> with a distinct translation context.
> 
> This property can also be used in association with 'iommus=' when dt
> bindings requires the presence of 'iommus=', example[2]. For these
> cases, representation will be(on arm64):
>     iommus = <&iommu sid mask>; //for default function.
>     iommu-map-masked = <FUNCTION_ID &iommu sid mask>;//additional
> function.
> 
> USECASE [1]:
> -----------
> Video IP, 32bit, have 2 hardware sub blocks(or can be called as
> functions) called as pixel and nonpixel blocks, that does decode and
> encode of the video stream. These sub blocks are __configured__ to
> generate different stream IDs.

So please clarify why you can't:

a) Describe the sub-blocks as individual child nodes each with their own 
distinct "iommus" property

or:

b) Use standard "iommu-map" which already supports mapping a masked 
input ID to an arbitrary IOMMU specifier

Thanks,
Robin.

> With the classical approach of representing all sids with iommus= end up
> in using a single translation context limited to the 4GB. There are
> video usecases which needs larger IOVA space, like higher concurrent
> video sessions(eg: 32 session and 192MB per session) where 4GB of IOVA
> is not sufficient.
> 
> For this case, it can be considered as iommus= property can be
> associated with pixel functionality and iommu-map-masked= is with
> non-pixel or viceversa.
> 
> [1] https://lore.kernel.org/all/20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com/
> 
> Charan Teja Kalla (3):
>    dtbindings: add binding for iommu-map-masked property
>    of: create a wrapper for of_map_id()
>    of: implment the 'iommu-map-masked' to represent multi-functional
>      devices
> 
>   .../bindings/media/qcom,sm8550-iris.yaml      | 31 ++++++++++-
>   drivers/iommu/of_iommu.c                      | 44 +++++++++++++++
>   drivers/of/base.c                             | 55 ++++++++++++++++---
>   include/linux/of.h                            | 15 +++++
>   4 files changed, 133 insertions(+), 12 deletions(-)
> 


