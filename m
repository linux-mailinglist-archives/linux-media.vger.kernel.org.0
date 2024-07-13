Return-Path: <linux-media+bounces-14992-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC509306A1
	for <lists+linux-media@lfdr.de>; Sat, 13 Jul 2024 19:10:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D15DA1C22B78
	for <lists+linux-media@lfdr.de>; Sat, 13 Jul 2024 17:10:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 366F713C9AF;
	Sat, 13 Jul 2024 17:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="dNPUGXhF"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-21.smtpout.orange.fr [80.12.242.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051F113B2AC;
	Sat, 13 Jul 2024 17:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720890604; cv=none; b=lyNV9rA7mczUtBL/TyxxO8rnFK5ZZ9dOJDgyXAgynZkYPJQHemL8SSfXFYGCSlj2AQH2utlKiIsbzxdg87kJGzCg4l4Nddh1RsWNESEaWvILfORpudbrfRa7Ix4w95p/3BW1O+sPT1CyNtEhmhEpc2LPE3SXWNjozzfkg+p1RCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720890604; c=relaxed/simple;
	bh=C2lNemA5dYx0FUsiuNvgvejDSIQjYAYQUEEQ8tLbxz0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KcdU4MhdZVGTgDl+sfR1msuu9HFWw95AUWdqA6EeLnmV8X6xHXs1qZSq4jD3oSgkoTT8FYAqevHaN0h4kC5Na1kjPDWRqC/mRIk0/s5YsPRNkdk9Sn6xlj4MbyXzLv5cPp/JTY7JsCBWgd9w9nEhZz3QIDWNXw/fK8tRlJlEUYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=dNPUGXhF; arc=none smtp.client-ip=80.12.242.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id SauhsgQxjqvisSauhsE1rF; Sat, 13 Jul 2024 13:27:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1720870060;
	bh=PDwTxGCe+tbryrWNO+5MDjX4lRzsTsMGx8e5EPmnsf4=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=dNPUGXhFKQJBkKjNzoUDCKgfDG8FZdbdi1ni8lSeqjOstOdUxXjaJNuBaaBKJqQ6B
	 ksijwVSQnxpi370BhrtwTILPG2xeUAbmfE/n3n12fp6JF++VLPEXSccM3GrDn9Jfna
	 ohgY19gqpdpV4vSpy/q+E1hPHsNsS0Om1SefTCGgiVi+a9kBztUx2VXgOh3kI3NtAQ
	 nNZOzCLHt/Q3ew2MlupdPgBQyIvU+fFebFh941JCRvAOl4JmApywCnZ9oa5FoXmLPp
	 5wBHcfoC8k9k7+KdBZpcHfK1uMdZhaJ8fZv7Bcyww7IHLs3MPSfBCTqzvcJPiEfyie
	 DGGwFJ/iQamUA==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Sat, 13 Jul 2024 13:27:40 +0200
X-ME-IP: 90.11.132.44
Message-ID: <a9137e59-80de-4314-8658-cf7e8105322d@wanadoo.fr>
Date: Sat, 13 Jul 2024 13:27:38 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MEDIA: USB: UVC: Corrected Errors in Macro Definitions
To: aditya-chari25 <adi25charis@gmail.com>,
 laurent.pinchart@ideasonboard.com, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240713110858.307085-1-adi25charis@gmail.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20240713110858.307085-1-adi25charis@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 13/07/2024 à 13:08, aditya-chari25 a écrit :
> macro definitions had errors since they weren't enclosed in parenthesis
> hence I rectified those errors

Hi,

The driver does *not* compile anymore with this patch.

Can you elaborate on what you are trying to fix and if your chnage is at 
least compile-tested?

CJ

> 
> Signed-off-by: aditya-chari25 <adi25charis@gmail.com>
> ---
>   drivers/media/usb/uvc/uvc_driver.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 8fe24c98087e..6e14b9dc3886 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -2424,9 +2424,9 @@ static const struct uvc_device_info uvc_quirk_force_y8 = {
>   	.quirks = UVC_QUIRK_FORCE_Y8,
>   };
>   
> -#define UVC_INFO_QUIRK(q) (kernel_ulong_t)&(struct uvc_device_info){.quirks = q}
> -#define UVC_INFO_META(m) (kernel_ulong_t)&(struct uvc_device_info) \
> -	{.meta_format = m}
> +#define UVC_INFO_QUIRK(q) {(kernel_ulong_t)&(struct uvc_device_info){.quirks = q}}
> +#define UVC_INFO_META(m) {(kernel_ulong_t)&(struct uvc_device_info) \
> +	{.meta_format = m}}
>   
>   /*
>    * The Logitech cameras listed below have their interface class set to


