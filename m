Return-Path: <linux-media+bounces-37021-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FAEAFB5A3
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 16:15:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BBB067A2D15
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 14:13:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C5D72BE05E;
	Mon,  7 Jul 2025 14:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FNbEY+CT"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7FF2BE022;
	Mon,  7 Jul 2025 14:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751897691; cv=none; b=r7nZJ21pKfiNPN6YrpGAJUQP45EZQRjUj9QdpQ0fvToIKZNDfYUI4xAoNr3l732+GwyN2XguG8fgaND6Q3tnHfprLE0TZhrMwKGwcs53lmC/sG1isH+5/3gUZpdKnlnJwU0xFuf5NZzEtj4jIg4KYj+3XUlH8qBYmTf0ouZfvvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751897691; c=relaxed/simple;
	bh=paKdTQVSLgww6rtrLny/d+gU3M/Xfeh/Wq28MOMUzW0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LvAGiP//QYEKRSFZeerXIz2x/Z595HAEGi0DzRRhLU3RI2yLIIjFMXLLL7HCp3NULv86J4ho5VLLZsirbAP2AiXxHvTQkIyhH5/P8fNYQkfcqLBynXZeX/TjRDTLJ+7+z/sdx1WzuHaGtCO9uzvKIV5FQBWsYsysrvLZvsLDALs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FNbEY+CT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B6A5C4CEE3;
	Mon,  7 Jul 2025 14:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751897690;
	bh=paKdTQVSLgww6rtrLny/d+gU3M/Xfeh/Wq28MOMUzW0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FNbEY+CTReGb0P8T+OPfEcXoJqYki85sozGKjJMinqmv+OBGSS7RvofOY7Eh5VSeQ
	 RLKczXOsa8CDgw+jijBbfhlQ8PT7NTTpkxFmBF8Yf9HHLJYan4csiN9l2iOx5PUXkY
	 BMn8ymU+3vqKmjXFhgUAI070VacH1WknMxqGSwKh5uxerjCOEFBfDAnKQwJ0eUxFfY
	 EuiN4u4/WjP93pDBePAR3zcdujosFvcXeeqwq/uWjyro+iiFHyanbWolc7mTRqhgrT
	 wPJBVK+EmaFaRc1h/nfdT4jGu2U3+BDYMv2oFMlnlMwEpX20XiDIYyxrn+rqy7QXWn
	 QZqOq2NUBt10A==
Message-ID: <d063964c-5ca9-4602-8338-05c46c2d2775@kernel.org>
Date: Mon, 7 Jul 2025 16:14:46 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] staging: media: atomisp: unify initialization flag
 usage in HMM
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>, mchehab@kernel.org,
 sakari.ailus@linux.intel.org, andy@kernel.org, gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel-mentees@lists.linux.dev,
 skhan@linuxfoundation.org, dan.carpenter@linaro.org
References: <20250707140923.58935-1-abdelrahmanfekry375@gmail.com>
 <20250707140923.58935-3-abdelrahmanfekry375@gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250707140923.58935-3-abdelrahmanfekry375@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Abdelrahman,

On 7-Jul-25 16:09, Abdelrahman Fekry wrote:
> Previously, the initialization state of the `hmm_bo_device` was tracked
> in two places: a global `hmm_initialized` boolean in `hmm.c`, and a local
> integer `flag` in the `hmm_bo_device` struct. This was redundant and could
> lead to inconsistent state checks.
> 
> - Removes the global `hmm_initialized` variable and all checks against it.
> - Replaces the `int flag` in `struct hmm_bo_device` with a strongly-typed 
>  `enum hmm_bo_device_init_flag flag` (values: UNINITED = 0, INITED = 1).
> - Initializes `flag` to `HMM_BO_DEVICE_UNINITED` at declaration to 
>   ensure a well-defined starting state.
> - Removes a redundant `hmm_init()` call inside `__hmm_alloc()` since its
>   always called after hmm_init()
> 
> This change improves type safety, consistency, and readability when
> handling the HMM initialization state.
> 
> Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
> ---
>  .../staging/media/atomisp/include/hmm/hmm_bo.h   |  9 +++++++--
>  drivers/staging/media/atomisp/pci/hmm/hmm.c      | 16 ++++------------
>  2 files changed, 11 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h b/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
> index e09ac29ac43d..155f9d89b365 100644
> --- a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
> +++ b/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
> @@ -58,7 +58,10 @@
>  #define	ISP_VM_SIZE	(0x7FFFFFFF)	/* 2G address space */
>  #define	ISP_PTR_NULL	NULL
>  
> -#define	HMM_BO_DEVICE_INITED	0x1
> +enum hmm_bo_device_init_flag {
> +	HMM_BO_DEVICE_INITED	= 0x1,
> +	HMM_BO_DEVICE_UNINITED	= 0x2,
> +};
>  
>  enum hmm_bo_type {
>  	HMM_BO_PRIVATE,
> @@ -86,7 +89,9 @@ struct hmm_bo_device {
>  
>  	/* list lock is used to protect the entire_bo_list */
>  	spinlock_t	list_lock;
> -	int flag;
> +
> +	/* flag to indicate whether the bo device is inited or not */
> +	enum hmm_bo_device_init_flag flag;

Please just replace this with a "bool initialized"; data
member taking `true` and `false as values instead of
introducing a new type for this.

>  
>  	/* linked list for entire buffer object */
>  	struct list_head entire_bo_list;
> diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
> index c2ee9d2ec0d5..767a3a24f8e5 100644
> --- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
> +++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
> @@ -24,9 +24,10 @@
>  #include "mmu/isp_mmu.h"
>  #include "mmu/sh_mmu_mrfld.h"
>  
> -struct hmm_bo_device bo_device;
> +struct hmm_bo_device bo_device = {
> +	.flag = HMM_BO_DEVICE_UNINITED,
> +};
>  static ia_css_ptr dummy_ptr = mmgr_EXCEPTION;
> -static bool hmm_initialized;
>  
>  int hmm_init(void)
>  {
> @@ -38,8 +39,6 @@ int hmm_init(void)
>  		dev_err(atomisp_dev, "hmm_bo_device_init failed.\n");
>  		return ret;
>  
> -	hmm_initialized = true;
> -
>  	/*
>  	 * As hmm use NULL to indicate invalid ISP virtual address,
>  	 * and ISP_VM_START is defined to 0 too, so we allocate
> @@ -62,7 +61,7 @@ void hmm_cleanup(void)
>  	dummy_ptr = 0;
>  
>  	hmm_bo_device_exit(&bo_device);
> -	hmm_initialized = false;
> +	bo_device.flag = HMM_BO_DEVICE_UNINITED;

This clearing of the flag / setting `initialized = false` belongs inside bo_exit()
not here.


>  }
>  
>  static ia_css_ptr __hmm_alloc(size_t bytes, enum hmm_bo_type type,
> @@ -72,13 +71,6 @@ static ia_css_ptr __hmm_alloc(size_t bytes, enum hmm_bo_type type,
>  	struct hmm_buffer_object *bo;
>  	int ret;
>  
> -	/*
> -	 * Check if we are initialized. In the ideal world we wouldn't need
> -	 * this but we can tackle it once the driver is a lot cleaner
> -	 */
> -
> -	if (!hmm_initialized)
> -		hmm_init();
>  	/* Get page number from size */
>  	pgnr = size_to_pgnr_ceil(bytes);
>  


Regards,

Hans



