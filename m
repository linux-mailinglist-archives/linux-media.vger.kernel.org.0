Return-Path: <linux-media+bounces-22452-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B0A9E0690
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 16:15:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C2E4E1709F6
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 14:52:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7C95208986;
	Mon,  2 Dec 2024 14:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VvCOiUIg"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8583B208975
	for <linux-media@vger.kernel.org>; Mon,  2 Dec 2024 14:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733150694; cv=none; b=AiTGjoJ1hy7AO9aQ48e/xVWZ0yJnpMZQUPZnz5JfeorJAmHRx0bdsO+yHI9ocR64RZF2ZEOrKHAi0WC2+NWYFnWzxJcGsfnypnA2UhCOBrmRcjbMdlfbN88pYJ6x+rz8ds0vEDY2P3jPMu2X8LTjmfsfNnvnLDQOJ1O07UeT5X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733150694; c=relaxed/simple;
	bh=P6WMno8wkJc6FpiCbZ3RKjUDqJawl4a3n5Y+JpdjnQU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rl65Q0eh+PvnyfEufTz4hIDcdMDzFwJPnoFiuLNPQRrPOR6Rk/HDjWjfAWK6coSqK9dLsmon3rld8pTowbSJcmU2P38qUjaWgrgIt9wUDTmKHRM3i1akwbXx+tBNt8JlNj8yCmT5u6ywr44mTrLOQ3//c7pu5FKrZF0N39NSC/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VvCOiUIg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733150691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BYLdp2sXBF6M9dc560NKGF40r2p0eqAZE6J+ajfFVJ8=;
	b=VvCOiUIgeOky9FmweFYtjWwqS85XNQSrdxUfuKRQgqHyX17FQV+ey0u9fpJ+tSSvDMHiWF
	EspZ78F0zlayRIOTQyRetkSJN0+Th+iE81fTxMiA27vxgekZiSKLcNwk/bWaVrLpr63aFN
	J6yPvp5Mg/jkN2zNI3KcbinVRR6slhY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-134-NXqf5MoNOpatuTaRpBHS5w-1; Mon, 02 Dec 2024 09:44:50 -0500
X-MC-Unique: NXqf5MoNOpatuTaRpBHS5w-1
X-Mimecast-MFC-AGG-ID: NXqf5MoNOpatuTaRpBHS5w
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5d0e755edbeso1357632a12.0
        for <linux-media@vger.kernel.org>; Mon, 02 Dec 2024 06:44:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733150689; x=1733755489;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BYLdp2sXBF6M9dc560NKGF40r2p0eqAZE6J+ajfFVJ8=;
        b=tsHnU4klAXbdZ080H9UH6uvEM6tzU0pV2HdgfeJxRAk/eCJU3NDcfcJ/wPqTAa/1+u
         4H9lQTdZ4cyO0JFplBXK4zwz3nNlS0J/74zwbt5S7+5ukiKrSrY15ee6og+HkE818VRa
         mV52fxIw8gsUXmYfuFl6aHbrUL5zlGVLuSuTYne9c3Mi3VMpl8sE7Oy4g5J5asLoWTCJ
         uhmeZHFLoFMi2FFjmR5NQg5/nL45gIzwN/i/6Hjf1PkUE7zIZhTGSm8XtC90Khc0GMgk
         JSb1fWOntKYhLNpdeeBaziSSkqrJTOtjzZXdkIy1ToVmlLrggftl6s0iqv2gk3Cr4lEK
         G41g==
X-Forwarded-Encrypted: i=1; AJvYcCWzt7gcrGudgfNd4eILfYoX9VSEG2OvJ9DdPwm7QgRzKaInv59rNq82MEwAV3dPM6XC1lbgd87umpe9fQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxcHFjtYEpJhJAiOooKLYRn7cfiyCcuMIHaEFvp1agImPpWz2Qk
	4hHWqQhkDMoHDuI4mgVWGaHqEqVeF+ZaL5tn7pV5KIWhUylbPHbcgwKTwu+cNqIRThDoVra6ZHG
	E5Bh555bNKEVny6RnofMgjpSCi3BJ5isvwOPP9M3F7TPOiOs8ImD1w9uHFz/9
X-Gm-Gg: ASbGncspwtOalJlcXlNxyrK2CvWq4Qpo1IogmNtZdi54Q5vf/gue0GLp8n8yTJWeC8j
	fV8VULfd/mErOlqlEggilrZ6K8d54ey4HCnpGEVIyRcy/UKx6II4w/g3U7ymY0ZA4OlTE9Rw0z+
	SDsZdbae2RZWxZ47pg+tEbsvQpfKiQDaE/drqrPJZab8uaKc2B1FQJVsf/7iCmT3ShBq9Um2pni
	aVt3Ca1vT6PbHgC253O5EWzV5i2+KOlUy2ZMTD0zOU2VWwR+zExaA==
X-Received: by 2002:a05:6402:35d5:b0:5d0:b51c:8483 with SMTP id 4fb4d7f45d1cf-5d0b51c8732mr13566947a12.16.1733150686580;
        Mon, 02 Dec 2024 06:44:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHgjSPpPOWOYT+FbBn1eUx9lLaAIfbqlbSYEUIqBPBGycl8xuUlXajgumOG7/U9Szq5WSRwow==
X-Received: by 2002:a05:6402:35d5:b0:5d0:b51c:8483 with SMTP id 4fb4d7f45d1cf-5d0b51c8732mr13566786a12.16.1733150684566;
        Mon, 02 Dec 2024 06:44:44 -0800 (PST)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d0b8aeeaf7sm3798271a12.30.2024.12.02.06.44.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 06:44:43 -0800 (PST)
Message-ID: <34084caa-13a4-40c3-aa81-ba17513add45@redhat.com>
Date: Mon, 2 Dec 2024 15:44:43 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] media: uvcvideo: Annotate lock requirements for
 uvc_ctrl_set
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241202-uvc-fix-async-v5-0-6658c1fe312b@chromium.org>
 <20241202-uvc-fix-async-v5-3-6658c1fe312b@chromium.org>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241202-uvc-fix-async-v5-3-6658c1fe312b@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 2-Dec-24 3:24 PM, Ricardo Ribalda wrote:
> Make it explicit that the function is always called with ctrl_mutex
> being held.
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index af1e38f5c6e9..576e3854be91 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1980,6 +1980,8 @@ int uvc_ctrl_set(struct uvc_fh *handle,
>  	s32 max;
>  	int ret;
>  
> +	lockdep_assert_held(&chain->ctrl_mutex);
> +
>  	if (__uvc_query_v4l2_class(chain, xctrl->id, 0) >= 0)
>  		return -EACCES;
>  
> 


