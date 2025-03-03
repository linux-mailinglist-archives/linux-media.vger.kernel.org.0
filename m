Return-Path: <linux-media+bounces-27336-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1CBA4C3B3
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 15:44:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E63863A7941
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 14:42:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 090FB213E61;
	Mon,  3 Mar 2025 14:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g+rqzaxa"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E760353365
	for <linux-media@vger.kernel.org>; Mon,  3 Mar 2025 14:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741012954; cv=none; b=ZDywtyH98QhzeSTxt/xRpyO+apsDpmtvt5EYvOhjAs4Z7cBGU0g36VhYYHlQB5rJWWbaQDoKpuUJQ74c4riu3dHTSzap0g08qHJ+uGziwtKT6T6Exd8C2iuXDXw39G0r2XEXJ2J7qg5G7b5bvZ3NS1lhibGxE2UXgmrZHQv0ZPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741012954; c=relaxed/simple;
	bh=ZTyfGZXWIcBxfTMJAaH9bSkoaURGlhqbEorrWHDOuNI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tpMzzm98jESUc4+T6jpxM68b9J9aoUe1qxKhCTU4r/nERY5ddbTxXIWkKIWbcW9xwl/Mhfj9qQeViiatq1cN8BIrHqrs71ftzyUcb5fAbViTNHdb0KQw6rmefatuRNMsMmCI9EnrTqN4j3/SkJ26STUURSmnoYN4DP47cwbgbGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g+rqzaxa; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741012951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fEfF1MW0qkcpRK3ia9ugAr2LLeu9A931qY1MeuqBiiA=;
	b=g+rqzaxaX6z6AO11KEBGCHvMZm7YKib2bELtkiQtmZ/Bm7JYJ4kj7GwTTFRCZA5VNkW4jP
	D+qas1hRAYiuh78t6mtgK4bG/brO1R21IjFMv15RoZmwk4bRPiHzT6KQVveA6VNleMCFVL
	yqmhP0AG4+BbyEKZoL8xkVfym+mbECU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-345-UiFDyhQsMIuplQ8sj2OJnQ-1; Mon, 03 Mar 2025 09:42:26 -0500
X-MC-Unique: UiFDyhQsMIuplQ8sj2OJnQ-1
X-Mimecast-MFC-AGG-ID: UiFDyhQsMIuplQ8sj2OJnQ_1741012945
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5e4c5225b64so4335113a12.2
        for <linux-media@vger.kernel.org>; Mon, 03 Mar 2025 06:42:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741012945; x=1741617745;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fEfF1MW0qkcpRK3ia9ugAr2LLeu9A931qY1MeuqBiiA=;
        b=R6Gxa+h9Am+Mo99Ai33/CJ5/A3qark4ZEn/cJUF6X3xPXQjION0GkaOHL9H5r0Lfcb
         VPvKg8qGcnwfA7TU3R/0QMvUfN3uhhvt/7Yrk8PYjueMEIlf/JIhhT6Iyz643Q10xFPb
         sA7DAahfxuFX7wJoty2CqywytdrqhZ3X+54ybgN6FuKBjBR1p9QSwll8kS3+o0PjLcB5
         qEnQQ/Cq96GEMBx0BcVR8+cUQoamNvqVCiUW/+tZvY9DIWpE6PUYjD8aMEZjS1Wl+056
         qshZ0Um/eL/V+NIYPtReAbXRNuLtFHN7kHvvDh2NsdGsQgZ170LqAj6f5KlqJS/Sn+1i
         0iFQ==
X-Gm-Message-State: AOJu0YzeG3MbY2QpC9DcJgN5E4P+3heUBVJQWPmw+C+xGLTjL8xHN86b
	GOap4OMYGeaXsern9H+QP3gMHdiEmdBj8Mzw9/AId6CvciS+HMwxyxzBxFofuWjFgr6hoN7sJrS
	/W3835ZXRt//fBRAnb5BVbc2sLrw3sme4wFMWVhdaQvYK2oOfel9x4+7IrSB6
X-Gm-Gg: ASbGncv9dW1HgV9V1XBWOTi66+nRnuzWvDZdwsgTdhxgkgk8wYGBEFP92VNPXOM05+R
	N/XjatuKamLuQ6C0tV52j00dZNCtlzCeCBdWt/xlX+P6q+IHvH1h38iBxj6NR7Eseb3Ovc5Y5sC
	T2WJwHEnnrUSQpCvvhdXFvnn8pHIV//8XlXkiA18RMzLIIVotfm7cpCxSPAJfBjWfwW9EatM0GD
	U0H1LrOtzp5Kum2t47+Np+88cqfMRFDHs0KbYopiTPEgQ6sQN86Ib6+Ao49FZYkXlABNKvlpejc
	4FlyER3HVGH61mE+diU=
X-Received: by 2002:a05:6402:1d49:b0:5e4:9726:7779 with SMTP id 4fb4d7f45d1cf-5e4d6aca16amr13035759a12.2.1741012944662;
        Mon, 03 Mar 2025 06:42:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE3qq/rh3zRJKlvQz3UjeYwOEwrZ3UItCTwtP6Pp9xgjIYkSO4ge+XIYy3c1OhWO9ecYtX1sA==
X-Received: by 2002:a05:6402:1d49:b0:5e4:9726:7779 with SMTP id 4fb4d7f45d1cf-5e4d6aca16amr13035735a12.2.1741012944295;
        Mon, 03 Mar 2025 06:42:24 -0800 (PST)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3b6cfc4sm6927183a12.18.2025.03.03.06.42.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 06:42:23 -0800 (PST)
Message-ID: <ec2c7bec-2519-4716-8e9e-ff86b41ebb20@redhat.com>
Date: Mon, 3 Mar 2025 15:42:22 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] media: uvcvideo: Do not turn on the camera for
 some ioctls
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
References: <20250226-uvc-granpower-ng-v4-0-3ec9be906048@chromium.org>
 <20250226-uvc-granpower-ng-v4-5-3ec9be906048@chromium.org>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250226-uvc-granpower-ng-v4-5-3ec9be906048@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ricardo,

On 26-Feb-25 15:23, Ricardo Ribalda wrote:
> There are some ioctls that do not need to turn on the camera. Do not
> call uvc_pm_get in those cases.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/media/usb/uvc/uvc_v4l2.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 6af93e00b304..de8d26164996 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -1450,6 +1450,26 @@ static long uvc_v4l2_video_ioctl2(struct file *file,
>  {
>  	struct uvc_fh *handle = file->private_data;
>  
> +	/* The following IOCTLs do not need to turn on the camera. */
> +	switch (cmd) {
> +	case VIDIOC_CREATE_BUFS:
> +	case VIDIOC_DQBUF:
> +	case VIDIOC_ENUM_FMT:
> +	case VIDIOC_ENUM_FRAMEINTERVALS:
> +	case VIDIOC_ENUM_FRAMESIZES:
> +	case VIDIOC_ENUMINPUT:
> +	case VIDIOC_EXPBUF:
> +	case VIDIOC_G_FMT:
> +	case VIDIOC_G_PARM:
> +	case VIDIOC_G_SELECTION:
> +	case VIDIOC_QBUF:
> +	case VIDIOC_QUERYCAP:
> +	case VIDIOC_REQBUFS:
> +	case VIDIOC_SUBSCRIBE_EVENT:
> +	case VIDIOC_UNSUBSCRIBE_EVENT:
> +		return video_ioctl2(file, cmd, arg);
> +	}
> +
>  	guard(uvc_pm)(handle->stream->dev);
>  
>  	return video_ioctl2(file, cmd, arg);
> 


