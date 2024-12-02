Return-Path: <linux-media+bounces-22454-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CA31D9E0A9D
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 19:05:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D05F7B38A9C
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 14:53:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 035C620DD4C;
	Mon,  2 Dec 2024 14:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Yw4Ai/Iv"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19A320899D
	for <linux-media@vger.kernel.org>; Mon,  2 Dec 2024 14:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733150764; cv=none; b=Ap/nwrl8trnx1YYGzNWL0PSTNZcuCwyOKNZjvdibhHd1LEcvFE4axcSV3uvmMHwlhLXNrWcwGxk5imf9AgkDI9qlBVoQbJql3tnyrbBfv/1n4oNu3mbhANnEs2emeSOqua1aPS59f5LlFRaXY5Nf7mvOVNGJTbZP+d6CtSkE3MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733150764; c=relaxed/simple;
	bh=XEG1RcerCs7zfuWQTNGzh5BC5VO3k1qcRF/ckT5aKsE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nmExi6FmChIhNxSnp7JKQvP8b84QCrR7PmSoIRgzAEic/zlLeakAe46ahUEVJrUbT71h39X5LAwRIEiMfCHnw+HZSvkaHpikY4H//5I78T2MAYY3oHL+6Jjhqiq40cM4Q9/7mRWBuaeYzu09Okl2EcVGN0V9510L3bBO7QiDZO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Yw4Ai/Iv; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733150761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H/n54QHe1NzMvOrCOYdJyhQRev16QpKhheU+kQiQcBU=;
	b=Yw4Ai/IvWwVRqRX+NxzENVg1UvEaSTLh+KZoVyL04hpYU/P7En6D4dAAs7fIyHAzhu8yVH
	mEtdSbtGsRtUHRYoFae7XAg7UhssDq/9JC0y94BGH+p1WtM9Jwm1+J+RgGrgT5slGXVOYH
	JLnUwc5BidPJRjawgUS2QnCyaNonGdE=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-528-yW1683hDNHuEa-Pmen60xw-1; Mon, 02 Dec 2024 09:46:00 -0500
X-MC-Unique: yW1683hDNHuEa-Pmen60xw-1
X-Mimecast-MFC-AGG-ID: yW1683hDNHuEa-Pmen60xw
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-aa529e35844so518077766b.0
        for <linux-media@vger.kernel.org>; Mon, 02 Dec 2024 06:46:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733150759; x=1733755559;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H/n54QHe1NzMvOrCOYdJyhQRev16QpKhheU+kQiQcBU=;
        b=hD/DiP61vE9sEl6fH/JJ6UjIoUNIbShm0wt2fzd5RLD9bAJ02STggNXEsxn2QD3tsS
         w7fn5Jgcs7cH0W6gX101OiGcjCII7PbwqDyJBG/aXStBSKvtddCO3TdVhdBFF9d1FQA9
         uKH3CZ77V9M/duI/RWQ7oquk1RsFQfGq+XRBCq9UTn3h5a+oLOcuDdYDBFV+OSul0+UE
         Orhz8iMviiblN7j3f4+J839WZF89KZvYBbPcFfBEKsVwzY2bdXsbV1tyu5Xp+5H1jo0s
         hfVr/cYyQ9uJY70TiITo6yYk/ko9xXTa7Av3wb8OSe8cxmSo2f7vXJtkzJvuXRNdwS4b
         7NYw==
X-Forwarded-Encrypted: i=1; AJvYcCUDbRbz8HD/xFAM9aCEBVokn0FOkDQaOeIgZs75yMA6o2B1dWzc5odr5ujVEzYaq1HpyJbRNQTDn9ISdA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzcTCeouJM287a6tzyJW6ifEFSghfsa0x67JVu5iIN9/CRYQNdg
	Zg2EjCgA6E8HJ9nIu2abH6e5PO3AR70W0VYA76pSFNgRENdEOHPQj0U1TbPWLQVgGWiM5Y1rhN+
	6ZAXOLS8f02qkF6vSNLJW/QIIC8DUXXgWGptApsGmUeE0u0B4a+MUGZtf8pwKngKXCvWR
X-Gm-Gg: ASbGncuvILJgfBEyRSDR/owW1t5VStYL8d8gzlLa2343Tsu85mKIflCDVYkyWMK0NJs
	0omW3B0ZcLbHUS6IUOPLI7RxrEVciIkWZjlSbyalJwFxku6NvOQfIVBi4BoSihVJ6v83rvxni5X
	GxfjMvLlHoQkABpsVD9Qv3S9N4JpLeJF6K+ikobPMWaSOpeqehDda0G7MpPbl3qLGwmqkl94czd
	3xT1mBi/VrjJMEVzCb0gTKdPp6UoE13AKu2sN5PMYdmeTHfZGzNpA==
X-Received: by 2002:a17:906:3188:b0:aa5:1cdf:7bfd with SMTP id a640c23a62f3a-aa5945058bbmr2041913766b.7.1733150758896;
        Mon, 02 Dec 2024 06:45:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF8HqwPhXUO9252fmA3AzlzqGEYvuYGwKNOG5zyj1I7gJ6jPWtLqvor8xH6GhcSZADZyL1TlA==
X-Received: by 2002:a17:906:3188:b0:aa5:1cdf:7bfd with SMTP id a640c23a62f3a-aa5945058bbmr2041908566b.7.1733150758467;
        Mon, 02 Dec 2024 06:45:58 -0800 (PST)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa59990a777sm515948666b.154.2024.12.02.06.45.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 06:45:57 -0800 (PST)
Message-ID: <67f78128-dcc0-4253-a6f7-5905ca375b06@redhat.com>
Date: Mon, 2 Dec 2024 15:45:57 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] media: uvcvideo: Flush the control cache when we
 get an event
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241202-uvc-fix-async-v5-0-6658c1fe312b@chromium.org>
 <20241202-uvc-fix-async-v5-5-6658c1fe312b@chromium.org>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241202-uvc-fix-async-v5-5-6658c1fe312b@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 2-Dec-24 3:24 PM, Ricardo Ribalda wrote:
> Asynchronous controls trigger an event when they have completed their
> operation.
> 
> This can make that the control cached value does not match the value in
> the device.
> 
> Let's flush the cache to be on the safe side.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index e90bf2aeb5e4..75d534072f50 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1672,6 +1672,9 @@ bool uvc_ctrl_status_event_async(struct urb *urb, struct uvc_video_chain *chain,
>  	struct uvc_device *dev = chain->dev;
>  	struct uvc_ctrl_work *w = &dev->async_ctrl;
>  
> +	/* Flush the control cache, the data might have changed. */
> +	ctrl->loaded = 0;
> +
>  	if (list_empty(&ctrl->info.mappings))
>  		return false;
>  
>


Thank you for the patch.

I'm not familiar enough with UVC yet to really have an opinion on this one,
so I'll defer reviewing this one to Laurent.

Regards,

Hans




