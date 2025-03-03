Return-Path: <linux-media+bounces-27335-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A2EA4C38C
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 15:39:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82A4A3AA960
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 14:38:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F54321423F;
	Mon,  3 Mar 2025 14:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N7DpUzm6"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D67214227
	for <linux-media@vger.kernel.org>; Mon,  3 Mar 2025 14:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741012660; cv=none; b=rroOU+xlrpjkVfE747S17U6vIW0LaxzP7KUrf55rahp/EdHLBrphey0zlCCoTxHGrA5/7E6MLzlR449AvBCp5Djm6PuZtNIdCcsuS0HDi5Sh+v3O0w71WI3nRCVGjPPvGVzXZHtI6V7dfG150GNMdBDH6Do/bzc0V5k19fJ7Iyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741012660; c=relaxed/simple;
	bh=TfOXMpBObOpEU6afGJtTBzSD8HAl5um0orBw1XOeFsk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=av5a3E9JM7P9Dqw39yHguzRnjUzirDyv9i9msrTZQ2Xa19e879bJDCbxvWuJ1t1RZtPCF+IjKN7YqtpdkAdmz2CKO1KFI+Z8GQ4aCP/Hy9Z4SLQwJANT9P0yvxZ2SARKCWUCDMg2aNNw1bIX8++GMe5t6JKUnTBpuD+c+q4xWI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N7DpUzm6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741012658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9JeGJDQQ0J7/ssTaE+NatAO0lrGt6/z3dtpI/4Izuzo=;
	b=N7DpUzm6RAYDUObbVPyTb4kdlmgQFThvyHLeK+6gCuLSGyNxZ/7SO/TEhQZhwhw2jOARQo
	jlRbuUXyrteMIJSVt3NNBfK87xBaRkByKTk1swN8R9UpJroS2JWIcPufw344gAOYFfVj8J
	CUrUSQbbF7ND1pa/izOg9wDdxjnqdcI=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-FpS_LaDSO_G_YMyEmGrMkg-1; Mon, 03 Mar 2025 09:37:31 -0500
X-MC-Unique: FpS_LaDSO_G_YMyEmGrMkg-1
X-Mimecast-MFC-AGG-ID: FpS_LaDSO_G_YMyEmGrMkg_1741012650
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ab397fff5a3so586174066b.1
        for <linux-media@vger.kernel.org>; Mon, 03 Mar 2025 06:37:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741012650; x=1741617450;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9JeGJDQQ0J7/ssTaE+NatAO0lrGt6/z3dtpI/4Izuzo=;
        b=U/SDlhSC4v3cM5hySgzhTIjWNMa3Lr/i3WTA8GqzdVRLkX7irTlHjXfs3Jsbg/VMJK
         +jWBMfVsRkfEHcZXyScWiY1Xf5JZuC3ZihOGy6tTsnTn7CKAZugb7OJUeDGsa7SK+zph
         FNjHV6ZxMU2s6kE9f9FUjQOB73vQdSAADUsn85RfoW5kUj0Is4FJQ0XsJSas356vsa1V
         6AtRdcP3QYT6U8TvMypCv92fvIYLZtuP5jn27HQHMTTIJALdWoBn1lo0tISew8wSlhF/
         sNyohwgmZVZSraPonkOEHqW9Mgv7eSn9+foMTy0NEXrssB8Lq8OX5PsrgYBbOJIWs3ZU
         69ug==
X-Gm-Message-State: AOJu0YzSuhJy2lIrxMlxwOpcwqy96VLnU2MxhXsbsIH9WWdQsYevOU3t
	ExvNyja1Dw42st/EXsgBkfbHrHph1h3oOmJYv4JZOMcrP4/T/wHVQcW16+MdHEALSNB6OT9W8yd
	0LenPGs6EHYabx+Cn8ycwFhoHpSVbp8tMO+q7ejo2zn3u2lX9fW0LvEyNY8I3
X-Gm-Gg: ASbGnctOgbBCfnlO/rCdLjV0dfiDfHYnWks5CkGJALBbTpcB3xoGIShjA8CSSQyp4Za
	WMkntt78ebK8neCwt1iJdcr1yqJqfWML/WqVHtF4eeLdlvIzsJlST/mfh2Y6QrEKIF7hF3Dh8jn
	Tdt/+23HZPtuKenQTckfaECSUVUGie1khlzJDMtUKLtiBAQUTwV4BDB7nkMhn1paMbVNhFNiSU5
	4NqskDocOO6TuxF1V1cNs0wA08z9jc347GpI/aJcwgC51xCO3dxLGoSJC1b12VI0iquKSoqsMtU
	lIZrsiI6G+FD7c064aU=
X-Received: by 2002:a17:907:60cd:b0:abf:68b5:f78b with SMTP id a640c23a62f3a-abf68b61eabmr536239566b.24.1741012649878;
        Mon, 03 Mar 2025 06:37:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHa1u+zdvCoDiv3SXFker98na2A8agZhqfoWf/EbLSUWGYSaQKN28uCrbnmaQppxKND+Sj27A==
X-Received: by 2002:a17:907:60cd:b0:abf:68b5:f78b with SMTP id a640c23a62f3a-abf68b61eabmr536235966b.24.1741012649485;
        Mon, 03 Mar 2025 06:37:29 -0800 (PST)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac1e57faa1dsm63669066b.95.2025.03.03.06.37.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 06:37:28 -0800 (PST)
Message-ID: <f9246e9e-3905-4bb2-9799-90677f9521de@redhat.com>
Date: Mon, 3 Mar 2025 15:37:28 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] media: uvcvideo: Make power management granular
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
References: <20250226-uvc-granpower-ng-v4-0-3ec9be906048@chromium.org>
 <20250226-uvc-granpower-ng-v4-4-3ec9be906048@chromium.org>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250226-uvc-granpower-ng-v4-4-3ec9be906048@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 26-Feb-25 15:23, Ricardo Ribalda wrote:
> Now that every ioctl takes care of their power management we can remove
> the "global" power management.
> 
> Despite its size, this is a relatively big change. We hope that there
> are no size effects of it. If there are some specific devices that
> miss-behave, we can add a small quirk for them.
> 
> This patch introduces a behavioral change for the uvc "trigger" button.
> It will not work unless the camera is streaming. We consider that this
> the most common (if not the only) usecase and therefore we do not consider
> it a regression.

You may want to expand this part of the commit message a bit and make it
clear that before the "trigger" button would work as long as an open has
/dev/video# open and now it only works when the camera is actually
streaming.

I agree that in practice this is not an issue since apps only open
the /dev/video# node for a longer period at a time (vs short open
for query/probe) when they actually want to stream.

Otherwise the patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans




> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_v4l2.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 1c9ac72be58a..6af93e00b304 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -652,7 +652,6 @@ static int uvc_v4l2_open(struct file *file)
>  {
>  	struct uvc_streaming *stream;
>  	struct uvc_fh *handle;
> -	int ret = 0;
>  
>  	stream = video_drvdata(file);
>  	uvc_dbg(stream->dev, CALLS, "%s\n", __func__);
> @@ -662,12 +661,6 @@ static int uvc_v4l2_open(struct file *file)
>  	if (!handle)
>  		return -ENOMEM;
>  
> -	ret = uvc_pm_get(stream->dev);
> -	if (ret) {
> -		kfree(handle);
> -		return ret;
> -	}
> -
>  	v4l2_fh_init(&handle->vfh, &stream->vdev);
>  	v4l2_fh_add(&handle->vfh);
>  	handle->chain = stream->chain;
> @@ -701,7 +694,6 @@ static int uvc_v4l2_release(struct file *file)
>  	kfree(handle);
>  	file->private_data = NULL;
>  
> -	uvc_pm_put(stream->dev);
>  	return 0;
>  }
>  
> 


