Return-Path: <linux-media+bounces-33391-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88785AC4033
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 15:21:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E2E0E17288D
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 13:21:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2E2420409A;
	Mon, 26 May 2025 13:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dts+8Fxi"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45590C2C9
	for <linux-media@vger.kernel.org>; Mon, 26 May 2025 13:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748265705; cv=none; b=cN9mMNva3+SrKfFB/Wq9HmgE7F6NL3ki4+BfpSZk4CoCfIMaCFe1+qS/L59FiFeymneEAdAHRmKC8vCcroru/crZ3R48KKGZtJnZUbIIKwfc+aYKJvBp5BRnGR7CSRM+UKnztBODz2s7XLoxpoBht/G4rpFF+2jfaB3iKBaPGa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748265705; c=relaxed/simple;
	bh=dMVFJSgTq8Jl8+oMoAoLUzJ4wYIzRrFgNDspYVegFcw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZQSwob/AyI264xLw8ntOqjRhuEkBIgvlnUuE5iQN9856KPNjp8blA8iKsLsxikNPVI9Nh4aw8T9vKnJKTv3Cwq5omFgrPnzsFFnDRgKm0e0yKSl64zhAKfGeX9apkiX5MRgDB6pJ5rcgQLHI2sOml118PaHmiRWCo4uLTDmq+q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dts+8Fxi; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748265702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e+U6AvG4mqTA6HeLDMPefzAqkAK/pe7N2MgT3F8Vb04=;
	b=dts+8Fxi6hUlRIHKzV+TuiaHcSfE2k/0iH3TLwBihASP2/fLEXliEVYg3mA6ayEiN6OCYd
	LQA+dSBJ9RRvv6ZW4BY6wZYAItPL5B8UOnEpnXzIxeZoWDcYleE+uMI/zII5J15GzwUhga
	XfQQRIJTSuBF09dIDS9n0Omf1wzFNyU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-ZEfyR10QOWO8bXDuXMBh4Q-1; Mon, 26 May 2025 09:21:41 -0400
X-MC-Unique: ZEfyR10QOWO8bXDuXMBh4Q-1
X-Mimecast-MFC-AGG-ID: ZEfyR10QOWO8bXDuXMBh4Q_1748265700
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-60494ee0d67so957229a12.2
        for <linux-media@vger.kernel.org>; Mon, 26 May 2025 06:21:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748265699; x=1748870499;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e+U6AvG4mqTA6HeLDMPefzAqkAK/pe7N2MgT3F8Vb04=;
        b=EhgKhcK64J2enIMC7zSA85c3DdKktpZEOdCl6ABq+WyaN08WlPg+pDJlE1qjHzwNjz
         F9X2uKT/OKWLbd3t7l+JKFzQvx/J1fdBgCRyaU7UkllTSgzhEzWSGeRezpVMeUU5eNOF
         yQVPaNXfzhOOjuU0c5jsnbqszNe5pZCS43kVHMh5kuybpNB3MauO85YYUDaGEtd6mdzQ
         hSynVVDSEC0PiIpLAlItASe6bhxbYLcXcZkSq0rIbn5z4kzgOtCrEl34gN3tAh1N0zx9
         Re51N9z0tcFnhelY782P+Fbobgd7f+bza/9f+plpuhRYCKcEDLrrVNvZ9lc15bznn0t4
         KLyA==
X-Gm-Message-State: AOJu0Yx8qtKT2/O7iI1HRQRiEELtckao4XFrh2o1kyi+oRx+n49SVIwd
	CQvU2lDt3YgkOdDW+LA/s1zmZ3/55RIXMHs4PmQxbZM3q2plVLCrK//1xjV5HVkhZUrtIwCrwDh
	37P8HSqfWZrIieg06i7qwXqMfD68WdwMFdxUYjQUDyFMtiMnszDCVi98Zx2+EIH91XyGJGBHY
X-Gm-Gg: ASbGnctpTcdyqD4e/hN7jcqO2EfuBp8yW4o8PUJ4EMylvW5CpHUFbXIOxVVyImXgz11
	veqoNSohDp3IgRhguIKtPo3qxY3AEF5Qw2Du9RxAlzuq4RAvA3VLqtzdZeZu4iNeqQPJzK7FbRT
	IVbKLACa/In9x+dGuxsnMSVoV1b0T8sn96yOBxFXNN5pvlcRRR/gQ8vMeuyz8rHSIElqtmZU6xT
	5onTZEN9PcGREayAlCOwOty0cAQJ6ZDkPPD5chW+EudfWl/5AWDYxYNsexKR2ZoYODrC9z+Aws4
	X48jQKoDDiD+S1E=
X-Received: by 2002:a17:906:4a8d:b0:ad5:c462:3f60 with SMTP id a640c23a62f3a-ad85b1844f9mr604695066b.16.1748265699371;
        Mon, 26 May 2025 06:21:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERL/nfhdZ5rD+ue9cJCOb/Exbr9jaPUwtWcnctwrwXHum0txKunLk7ok0Hfc8NLUDMh0IFKw==
X-Received: by 2002:a17:906:4a8d:b0:ad5:c462:3f60 with SMTP id a640c23a62f3a-ad85b1844f9mr604692466b.16.1748265698944;
        Mon, 26 May 2025 06:21:38 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d441fb5sm1695934766b.108.2025.05.26.06.21.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 06:21:38 -0700 (PDT)
Message-ID: <8fe337d5-c399-4546-b784-33e651ab608d@redhat.com>
Date: Mon, 26 May 2025 15:21:37 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: uvcvideo: Populate all errors in uvc_probe()
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250523-uvc-followup-v2-1-487541656e83@chromium.org>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250523-uvc-followup-v2-1-487541656e83@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 23-May-25 16:28, Ricardo Ribalda wrote:
> Now we are replacing most of the error codes with -ENODEV.
> Instead, Populate the error code from the functions called by
> uvc_probe().
> 
> Take this opportunity to replace a generic error code from
> uvc_scan_device() into something more meaningful.
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hansg@kernel.org>

I have merged this into:

https://gitlab.freedesktop.org/linux-media/users/uvc/-/commits/next/

now.

Regards,

Hans




> ---
> CodeStyle and refactor patches after the last uvc Pull Request.
> ---
> Changes in v2:
> - Patches 1-3 will be handled by Laurent: https://lore.kernel.org/linux-media/20250523125840.GG12514@pendragon.ideasonboard.com/
> - Properly propagate ret value. Sorry about that :)
> - Link to v1: https://lore.kernel.org/r/20250509-uvc-followup-v1-0-73bcde30d2b5@chromium.org
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index da24a655ab68cc0957762f2b67387677c22224d1..04552da114354128b0cc8fb25e1cc645498ac323 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -1866,7 +1866,7 @@ static int uvc_scan_device(struct uvc_device *dev)
>  
>  	if (list_empty(&dev->chains)) {
>  		dev_info(&dev->udev->dev, "No valid video chain found.\n");
> -		return -1;
> +		return -ENODEV;
>  	}
>  
>  	/* Add GPIO entity to the first chain. */
> @@ -2239,7 +2239,6 @@ static int uvc_probe(struct usb_interface *intf,
>  	/* Parse the Video Class control descriptor. */
>  	ret = uvc_parse_control(dev);
>  	if (ret < 0) {
> -		ret = -ENODEV;
>  		uvc_dbg(dev, PROBE, "Unable to parse UVC descriptors\n");
>  		goto error;
>  	}
> @@ -2275,22 +2274,19 @@ static int uvc_probe(struct usb_interface *intf,
>  		goto error;
>  
>  	/* Scan the device for video chains. */
> -	if (uvc_scan_device(dev) < 0) {
> -		ret = -ENODEV;
> +	ret = uvc_scan_device(dev);
> +	if (ret < 0)
>  		goto error;
> -	}
>  
>  	/* Initialize controls. */
> -	if (uvc_ctrl_init_device(dev) < 0) {
> -		ret = -ENODEV;
> +	ret = uvc_ctrl_init_device(dev);
> +	if (ret < 0)
>  		goto error;
> -	}
>  
>  	/* Register video device nodes. */
> -	if (uvc_register_chains(dev) < 0) {
> -		ret = -ENODEV;
> +	ret = uvc_register_chains(dev);
> +	if (ret < 0)
>  		goto error;
> -	}
>  
>  #ifdef CONFIG_MEDIA_CONTROLLER
>  	/* Register the media device node */
> 
> ---
> base-commit: 5e1ff2314797bf53636468a97719a8222deca9ae
> change-id: 20250509-uvc-followup-d97ff563df95
> 
> Best regards,


