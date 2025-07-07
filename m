Return-Path: <linux-media+bounces-37020-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6CFAFB59B
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 16:12:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F22257A1AD7
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 14:11:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B4822BE04D;
	Mon,  7 Jul 2025 14:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OmzX1Gt2"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623861C5D77;
	Mon,  7 Jul 2025 14:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751897536; cv=none; b=A2/cOTsQk5kToGsHpNQ6qysIL6bVZjweqljmhyMA2bofzAg2bCEDpRhlfuCX9hjb8NfDfakFWHDejxUAhW7k1fIDw0/lZu5ZHJWjeSLFrowYcVBB4ul7cGNMXB4kf2BsAP3EKe1bWLRgQpPpS9DB3B8372pxPlT/frxO7OsXkE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751897536; c=relaxed/simple;
	bh=T0WJbHpOqLUlFI1oMUM4odBcnwnu1DCCo7VyyfHirro=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TQfLmPSgh8EGNErbaxHHNOw40x4khOC+uc2YBjmYqwsAIGYG69eY8moOf68KiuvKNA7gxlxc2YmvzC2xOvEPv7bLjhryYl28vQovHAhLjbdA0zLR5EGBObd0RwUpF+7yFWPaIMFpgJWH425wDUyosIMsZjZ+LQ0D1P48IDIxapI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OmzX1Gt2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E466C4CEE3;
	Mon,  7 Jul 2025 14:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751897535;
	bh=T0WJbHpOqLUlFI1oMUM4odBcnwnu1DCCo7VyyfHirro=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OmzX1Gt2OeZdka+OFO5++fWZzXq/VLVagi9xIMrkWJ/4rNTzG8J/BYeG6iKXOn1VA
	 KvD6OTSWJqkRy7d2AJvGTJtVMFcYqtBw5MmKPWAuBEea6pyIR9VJ/GImCR03YMTSJ9
	 LNHzrCtTzFz9vuvCHIPET4YZeH2cg3IchPVnfoMEXUI0Z/6+7Ud3ifAuOeeUQX/3yz
	 /WLNL4VLH0e+7ZfGbRTl3Pg+JXA+fkQuzeI87iVT5z78ZwZeqrG723+nQJVXInUXQl
	 HxBUKjiW+yVRG5J/Yw5X4ZfHz59uY4arrE6bW72hECd3jaIIKUNFQ8ERs7axxxaqZb
	 TxC1jKc0krLbQ==
Message-ID: <00673c30-8233-417a-9f8b-2ab91381fa4d@kernel.org>
Date: Mon, 7 Jul 2025 16:12:11 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] staging: media: atomisp: return early on
 hmm_bo_device_init() failure
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>, mchehab@kernel.org,
 sakari.ailus@linux.intel.org, andy@kernel.org, gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel-mentees@lists.linux.dev,
 skhan@linuxfoundation.org, dan.carpenter@linaro.org
References: <20250707140923.58935-1-abdelrahmanfekry375@gmail.com>
 <20250707140923.58935-2-abdelrahmanfekry375@gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250707140923.58935-2-abdelrahmanfekry375@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Abdelrahman,

On 7-Jul-25 16:09, Abdelrahman Fekry wrote:
> hmm_init() would continue execution even if hmm_bo_device_init() failed,
> potentially leading to bad behaviour when calling hmm_alloc().
> 
> - returns the error immediately if hmm_bo_device_init() fails.
> 
> Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
> ---
>  drivers/staging/media/atomisp/pci/hmm/hmm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
> index f998b57f90c4..c2ee9d2ec0d5 100644
> --- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
> +++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
> @@ -36,6 +36,7 @@ int hmm_init(void)
>  				 ISP_VM_START, ISP_VM_SIZE);
>  	if (ret)
>  		dev_err(atomisp_dev, "hmm_bo_device_init failed.\n");
> +		return ret;

You need to add { } here otherwise the "return ret;" will
always get executed since it is not part of the code block
guarded by the if (despite the indentation).

Regards,

Hans



>  
>  	hmm_initialized = true;
>  
> @@ -48,7 +49,7 @@ int hmm_init(void)
>  	 */
>  	dummy_ptr = hmm_alloc(1);
>  
> -	return ret;
> +	return 0;
>  }
>  
>  void hmm_cleanup(void)


