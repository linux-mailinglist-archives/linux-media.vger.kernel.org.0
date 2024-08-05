Return-Path: <linux-media+bounces-15769-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 413BE9477E3
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2024 11:03:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6321A1C215CC
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2024 09:03:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99AEE15572C;
	Mon,  5 Aug 2024 09:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t8AMAtkm"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E6C15382F;
	Mon,  5 Aug 2024 09:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722848492; cv=none; b=MJmRkSezzV32SV2IVTAj/+NxuzFZV638oeW09XkQA6ypDXLCokQGUPIRNINSFWawaurH0W9RettT8vmYN5+kVGuW0yPrZ4GfEnhdZ5Z94Zo6xLSrEdwYkeWQ6EPzZsv866ah81JrgoktwItydqKqeFrg4VMEeA1UEyjN9XAfj1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722848492; c=relaxed/simple;
	bh=upkncduFkC4Euzkb9y5BNQGpiwxYwB8eqenSGFYkhRo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=twhYj2EGhAw3xG/uyXcYsmRSgm+srBLWeLlgf6ueh+BhJGrWsU4k1+XFezIVHub2cMUCcb3Mh1zq29KMhsNRHe7/3gywwKJG4qFLWnQBbPp3VuwouDc1jfarWfMHxOm6HY3H7Ro+yCMnOCEZ2KVNF6WpYSuceVvwNjTCPqc2GNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t8AMAtkm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FB91C32782;
	Mon,  5 Aug 2024 09:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722848491;
	bh=upkncduFkC4Euzkb9y5BNQGpiwxYwB8eqenSGFYkhRo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=t8AMAtkmDiPVQpU0eV7GqIGNEr9CSliYdcNBBMKVqZ1qa4YB1mC4XV59KOMMMDe3Y
	 98ptqE3UytN+oo122I5VKKwZ+bNLLKFyI1Guhj5I1aJN3F8CfbPgg+zWzUbKZ22A3r
	 T8TXZOv1VLcCMNhIqilbDKwUL8SpjiG2gpHUIdFUAJM9nl1GBHESXndkgdmc7bSsnz
	 32zwgtiOemvi71EAX4/Tn05cLb7jrPsne9fyPh9+Mm+Jm7IUNffBgCsRqSUQsCiDgu
	 n77tLxp3+cKkAKWn3z9e3inNL8cqdxpDXY0pHW5wSDuvVrUM4E5iLJdGkDgOss+WeS
	 1AoeSPDR9mHvg==
Date: Mon, 5 Aug 2024 11:01:26 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: siano: Simplify smscore_load_firmware_from_file
Message-ID: <20240805110116.177686b0@foz.lan>
In-Reply-To: <20240805-siano-v1-1-6da2bc740267@chromium.org>
References: <20240805-siano-v1-1-6da2bc740267@chromium.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Mon, 05 Aug 2024 07:59:43 +0000
Ricardo Ribalda <ribalda@chromium.org> escreveu:

> The function is never called with a loadfirmware_handler, so we can
> remove some dead code.
> 
> We can also use this as a excuse to remove some unused type definitions.
> 
> This fixes the following smatch warning:
> drivers/media/common/siano/smscoreapi.c:1172 smscore_load_firmware_from_file() error: we previously assumed 'loadfirmware_handler' could be null (see line 1150)
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
LGTM.



> ---
> Originally reported by Hans.

Please add a reported-by field.

> ---
>  drivers/media/common/siano/smscoreapi.c | 15 +++++----------
>  drivers/media/common/siano/smscoreapi.h |  4 ----
>  2 files changed, 5 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/common/siano/smscoreapi.c b/drivers/media/common/siano/smscoreapi.c
> index b6f1eb5dbbdf..3732367e0c62 100644
> --- a/drivers/media/common/siano/smscoreapi.c
> +++ b/drivers/media/common/siano/smscoreapi.c
> @@ -1132,8 +1132,7 @@ static char *smscore_get_fw_filename(struct smscore_device_t *coredev,
>   * return: 0 on success, <0 on error.
>   */
>  static int smscore_load_firmware_from_file(struct smscore_device_t *coredev,
> -					   int mode,
> -					   loadfirmware_t loadfirmware_handler)
> +					   int mode)
>  {
>  	int rc = -ENOENT;
>  	u8 *fw_buf;
> @@ -1147,8 +1146,7 @@ static int smscore_load_firmware_from_file(struct smscore_device_t *coredev,
>  	}
>  	pr_debug("Firmware name: %s\n", fw_filename);
>  
> -	if (!loadfirmware_handler &&
> -	    !(coredev->device_flags & SMS_DEVICE_FAMILY2))
> +	if (!(coredev->device_flags & SMS_DEVICE_FAMILY2))
>  		return -EINVAL;
>  
>  	rc = request_firmware(&fw, fw_filename, coredev->device);
> @@ -1166,10 +1164,8 @@ static int smscore_load_firmware_from_file(struct smscore_device_t *coredev,
>  		memcpy(fw_buf, fw->data, fw->size);
>  		fw_buf_size = fw->size;
>  
> -		rc = (coredev->device_flags & SMS_DEVICE_FAMILY2) ?
> -			smscore_load_firmware_family2(coredev, fw_buf, fw_buf_size)
> -			: loadfirmware_handler(coredev->context, fw_buf,
> -			fw_buf_size);
> +		rc = smscore_load_firmware_family2(coredev, fw_buf,
> +						   fw_buf_size);
>  	}
>  
>  	kfree(fw_buf);
> @@ -1353,8 +1349,7 @@ int smscore_set_device_mode(struct smscore_device_t *coredev, int mode)
>  		}
>  
>  		if (!(coredev->modes_supported & (1 << mode))) {
> -			rc = smscore_load_firmware_from_file(coredev,
> -							     mode, NULL);
> +			rc = smscore_load_firmware_from_file(coredev, mode);
>  			if (rc >= 0)
>  				pr_debug("firmware download success\n");
>  		} else {
> diff --git a/drivers/media/common/siano/smscoreapi.h b/drivers/media/common/siano/smscoreapi.h
> index 82d9f8a64d99..3c15082ce0e3 100644
> --- a/drivers/media/common/siano/smscoreapi.h
> +++ b/drivers/media/common/siano/smscoreapi.h
> @@ -97,7 +97,6 @@ typedef int (*hotplug_t)(struct smscore_device_t *coredev,
>  typedef int (*setmode_t)(void *context, int mode);
>  typedef void (*detectmode_t)(void *context, int *mode);
>  typedef int (*sendrequest_t)(void *context, void *buffer, size_t size);
> -typedef int (*loadfirmware_t)(void *context, void *buffer, size_t size);
>  typedef int (*preload_t)(void *context);
>  typedef int (*postload_t)(void *context);
>  
> @@ -1102,9 +1101,6 @@ extern int smscore_register_device(struct smsdevice_params_t *params,
>  extern void smscore_unregister_device(struct smscore_device_t *coredev);
>  
>  extern int smscore_start_device(struct smscore_device_t *coredev);
> -extern int smscore_load_firmware(struct smscore_device_t *coredev,
> -				 char *filename,
> -				 loadfirmware_t loadfirmware_handler);
>  
>  extern int smscore_set_device_mode(struct smscore_device_t *coredev, int mode);
>  extern int smscore_get_device_mode(struct smscore_device_t *coredev);
> 
> ---
> base-commit: 2c25dcc2361949bc7da730d22de36c019c6bf1e3
> change-id: 20240805-siano-c4c6a1106a39
> 
> Best regards,



Thanks,
Mauro

