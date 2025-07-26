Return-Path: <linux-media+bounces-38502-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70082B12A72
	for <lists+linux-media@lfdr.de>; Sat, 26 Jul 2025 14:25:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A2C2540441
	for <lists+linux-media@lfdr.de>; Sat, 26 Jul 2025 12:25:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81C9824502C;
	Sat, 26 Jul 2025 12:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I4dXwOHn"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D258B1401B;
	Sat, 26 Jul 2025 12:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753532697; cv=none; b=cEJ9tXj+y3X14JapPQsh+6YIulCoeUyomThMiQzAZJdKkNgYIxDyvUH0uQp9qbWQ0H8qA2fn00K3vBFzBR4Zy97OIfHZHX6vdAg5ngg36AX/0XZlU2tH20BIHwIBWkpRUPNJxkq7H+PI5R6hJ7Ay41BfhwFvrmHCCEAc7/A01UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753532697; c=relaxed/simple;
	bh=Q9pEJcfekPUcRknoRen3DDDH4rZm+F68Z4P+bPSeIfQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FWeRa5GbHPeE1QXtQsErueyiqoCCSyc/urCavm+c3OdtxGffdqWlV8C0rdEH7cREvvNAXrWqnhJZYGqSRb+DsqnfdyVZzbtKjBe3v2Zh4s60TDlyn2i02o1hGoC6DC3He/N8wf2vhOfWUtq6t0H1AOhvxLoJFDLgXUvpRpJkMAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I4dXwOHn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF1E5C4CEED;
	Sat, 26 Jul 2025 12:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753532696;
	bh=Q9pEJcfekPUcRknoRen3DDDH4rZm+F68Z4P+bPSeIfQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=I4dXwOHnRQWjHsJ+SYTfUaiY82KVajXotoujJmsV/uFacibOC2t0bUwA+D7kG2y9Y
	 zhTyAy1ojM9unojFjq6Res0zwM+N1/1ZZEQiKC+ECVy7z5NDLirytIRWBPHT9mxiAm
	 K8NgPO/zr7mHoLv94p+zhbHEFk+LUEeSb/fM9JLd+GBXKaXw+kUnSAKZoayURITwWb
	 RyBnhXxVcPgO9SBNnzfngQ0HC3Q+crrQkGMewjujJeHr/pm4D73QJJ9maNLsOl6CJW
	 SUVVCX5TA1sKzCnLXkgUCnP7ttazW7vYoz3e+KKhXLS6bBqV/OsWFChaWJ5wuxiPJU
	 mkcnaniU7eV1g==
Message-ID: <0b284755-1ae7-4f5f-8338-836dfcb1db59@kernel.org>
Date: Sat, 26 Jul 2025 14:24:51 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: media: atomisp: Fix stack buffer overflow in
 gmin_get_var_int()
To: Kees Cook <kees@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: zepta <z3ptaa@gmail.com>, Ard Biesheuvel <ardb@kernel.org>,
 Andy Shevchenko <andy@kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>,
 Thomas Andreatta <thomasandreatta2000@gmail.com>,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20250724080756.work.741-kees@kernel.org>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250724080756.work.741-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Kees,

On 24-Jul-25 10:08 AM, Kees Cook wrote:
> When gmin_get_config_var() calls efi.get_variable() and the EFI variable
> is larger than the expected buffer size, two behaviors combine to create
> a stack buffer overflow:
> 
> 1. gmin_get_config_var() does not return the proper error code when
>    efi.get_variable() fails. It returns the stale 'ret' value from
>    earlier operations instead of indicating the EFI failure.
> 
> 2. When efi.get_variable() returns EFI_BUFFER_TOO_SMALL, it updates
>    *out_len to the required buffer size but writes no data to the output
>    buffer. However, due to bug #1, gmin_get_var_int() believes the call
>    succeeded.
> 
> The caller gmin_get_var_int() then performs:
> - Allocates val[CFG_VAR_NAME_MAX + 1] (65 bytes) on stack
> - Calls gmin_get_config_var(dev, is_gmin, var, val, &len) with len=64
> - If EFI variable is >64 bytes, efi.get_variable() sets len=required_size
> - Due to bug #1, thinks call succeeded with len=required_size
> - Executes val[len] = 0, writing past end of 65-byte stack buffer
> 
> This creates a stack buffer overflow when EFI variables are larger than
> 64 bytes. Since EFI variables can be controlled by firmware or system
> configuration, this could potentially be exploited for code execution.
> 
> Fix the bug by returning proper error codes from gmin_get_config_var()
> based on EFI status instead of stale 'ret' value.
> 
> The gmin_get_var_int() function is called during device initialization
> for camera sensor configuration on Intel Bay Trail and Cherry Trail
> platforms using the atomisp camera stack.
> 
> Reported-by: zepta <z3ptaa@gmail.com>
> Closes: https://lore.kernel.org/all/CAPBS6KoQyM7FMdPwOuXteXsOe44X4H3F8Fw+y_qWq6E+OdmxQA@mail.gmail.com
> Fixes: 38d4f74bc148 ("media: atomisp_gmin_platform: stop abusing efivar API")
> Signed-off-by: Kees Cook <kees@kernel.org>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hansg@kernel.org>

I've already send an atomisp pull-request for 6.17 out
and this is already in media-committers/next now and
the media subsystem is typically not good in merging
fixes just before the merge window.

Kees, the file touched here is unchanged in
media-committers/next vs Linus' latest master, can you
send this fix to Linus yourself ?

Regards,

Hans








> ---
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Andy Shevchenko <andy@kernel.org>
> Cc: Hans de Goede <hansg@kernel.org>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: <linux-media@vger.kernel.org>
> Cc: <linux-staging@lists.linux.dev>
> 
> Note that as an exercise this fix and the commit log body (I wrote the
> tags) was entirely written by an LLM (and reviewed by me), though I really
> had to help it focus on where to be looking. Here were my prompts:
> 
> Is there a buffer overflow problem associated with gmin_get_config_var()'s
> use of efi.get_variable()?
> 
> What does efi.get_variable() do to out_len if it fails?
> 
> Does the function return an error when efi.get_variable fails?
> 
> What would the caller do when it sees a success but when efi.get_variable
> changed out_len?
> 
> Propose fixes and write a commit message with all of the details you
> just gave me about reachability, impact, etc.
> 
> Since the EFI_SUCCESS test ends with "return 0" you don't need an explicit
> "else" block for the error path code.
> ---
>  .../staging/media/atomisp/pci/atomisp_gmin_platform.c    | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> index 5f59519ac8e2..964cc3bcc0ac 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> @@ -1272,14 +1272,15 @@ static int gmin_get_config_var(struct device *maindev,
>  	if (efi_rt_services_supported(EFI_RT_SUPPORTED_GET_VARIABLE))
>  		status = efi.get_variable(var16, &GMIN_CFG_VAR_EFI_GUID, NULL,
>  					  (unsigned long *)out_len, out);
> -	if (status == EFI_SUCCESS)
> +	if (status == EFI_SUCCESS) {
>  		dev_info(maindev, "found EFI entry for '%s'\n", var8);
> -	else if (is_gmin)
> +		return 0;
> +	}
> +	if (is_gmin)
>  		dev_info(maindev, "Failed to find EFI gmin variable %s\n", var8);
>  	else
>  		dev_info(maindev, "Failed to find EFI variable %s\n", var8);
> -
> -	return ret;
> +	return -ENOENT;
>  }
>  
>  int gmin_get_var_int(struct device *dev, bool is_gmin, const char *var, int def)


