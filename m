Return-Path: <linux-media+bounces-33385-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB98AC4012
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 15:12:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 650603B4020
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 13:12:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43B47204C1A;
	Mon, 26 May 2025 13:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YYocesTB"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01AAC1EC014
	for <linux-media@vger.kernel.org>; Mon, 26 May 2025 13:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748265138; cv=none; b=Yr7yXEl8rCNNQVkOoJCP+E8Jn9IRE/63btRiwagn0ZvUO0KnjhwcpqC8mKSVmnGMvS/S+jM7YuI/nJWFmWzJNAloImA93Ogs7sxFwBmVmWkSbvaK3fI138q0if7hIvXl12wdP/l36SI8sqqEpTDdD4P+NQpzbb3+we80Zin9Z/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748265138; c=relaxed/simple;
	bh=44bXjYgEx472ZLSVxB8lwvgofdNnAFTyYjXw5ZsM7p4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CtIjc8b/4i6NUaF0p3Tkrc0oII20roCZiCobKjnLE27oJztNdgo30BgJdeu1jAbwBuqS9JY9npTaLz39l3xp9t62yyjC0ES7nRDf4Sczk2ugVk2y45vCufk6ioMGITLih2ih0emsP0thLkLWrb0TCspVbofEaERv88hFTBj8ZZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YYocesTB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748265133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xq9c/4s+1JsjImWn/4Dy2VS9W8X+CykJQ3FUvjdqC4o=;
	b=YYocesTBN/Lhwx3X/HQPJ5AVkocVgqHnma8VozFZCs3JWMiQn591837Jk0AYSiQLjVmKle
	jdAQHoxVw6scTynAiomkcI7uQXRqE4mjdVtSMoIKtcVTpFEa96uIgEH3BwxpSO8J0ShTj+
	ljD80FT0IRwdhqWDC2GL9or0//YlFig=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-661-8YEW3X8KMBKKFmknBeOxGA-1; Mon, 26 May 2025 09:12:07 -0400
X-MC-Unique: 8YEW3X8KMBKKFmknBeOxGA-1
X-Mimecast-MFC-AGG-ID: 8YEW3X8KMBKKFmknBeOxGA_1748265126
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ad86c281f42so135494366b.3
        for <linux-media@vger.kernel.org>; Mon, 26 May 2025 06:12:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748265126; x=1748869926;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xq9c/4s+1JsjImWn/4Dy2VS9W8X+CykJQ3FUvjdqC4o=;
        b=MxBXlKa7Da5enxDq4YJJtG2KNIG6JdXaBLBuoJeMQe9xj5ECVSH7g5AsW6zcn6rcT5
         +AQgWnQwxWNLiL9s9tUV1v3Il7H5yg+3QNFScPWIE/S1VfQGkPlExWo1h66PWaBeoB4N
         vga3R9xiXGLD1W+zxr/LXSue1POOAtGZVPOdIqkaBns18ZuUeKoLIs3iC9vlvP5XU1RK
         4C1RRJIBQKlSPezRqpNFncIqKaP9mdOk/IK7V3Q8fNs01zzTLG2B5ht8Pa0edFMfJz1i
         c10P3Oj1Nj6MBR59Xs3MFs+1R6xbYPpCoeUfWCWr2ZUOuu2DD+0TBaGT+QGpZ1QOC2Js
         hddA==
X-Gm-Message-State: AOJu0YwH35yjR8W1lXeVsFnU94XEajvhZr0ri1y/t4ZyQ4uLUKQtH0qu
	psa1TNZA6pr43TAT6JZdK9gYR/IUXH3+w3PcPA06vzDUg0CxFbA6pa2aQfdpMII3qHIUOmuJ/Ll
	QH7kx3Mju7U/66se4/LjmBu+GnA9EIdHEUUEhq7XPu1Ql3EExzPJNCabIvCAdj3l/AHA0C9c8
X-Gm-Gg: ASbGncslie7bf6DuDWKbSYyp2T6WS3wZbBZICkPmloiPzBTTzvEwDgRdv8pmyDoZlRi
	XvM/sazvxCvVrlouMtAYno5H8UvVBtaHaOZLXgI4gfZmKutBaT41mWYu6UJ+kEVUZIDLH/JL9UE
	mGzTZwglx76lznvB4zO/Kle/i5hrgrTBD8Ea21/XQb4NFas8yWHqtIZixFgi5JW4/pEOwjLDzEP
	9Xd/7aMWRo/mV95maestE1KgMCIe6p+kCbGvSH7/bB4zur6B0o/Bl4tRSjhPdWPT1ovs6IDdLOm
	74IaAsJA6QeKII8=
X-Received: by 2002:a17:907:c26:b0:ad2:43b6:dd6d with SMTP id a640c23a62f3a-ad85b051c94mr849212166b.12.1748265125725;
        Mon, 26 May 2025 06:12:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTalOSdIadkbqa2qSmFa/eDGnX0/I30Frc7K2IlJnfyDCKJR+uuIozDsv6EgrW7jIXkRBXUA==
X-Received: by 2002:a17:907:c26:b0:ad2:43b6:dd6d with SMTP id a640c23a62f3a-ad85b051c94mr849207766b.12.1748265125351;
        Mon, 26 May 2025 06:12:05 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d04b073sm1662864566b.27.2025.05.26.06.12.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 06:12:04 -0700 (PDT)
Message-ID: <7ff90036-a890-40d5-9305-72c0debb3594@redhat.com>
Date: Mon, 26 May 2025 15:12:04 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] media: uvcvideo: Do not mark valid metadata as
 invalid
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20250404-uvc-meta-v5-0-f79974fc2d20@chromium.org>
 <20250404-uvc-meta-v5-1-f79974fc2d20@chromium.org>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250404-uvc-meta-v5-1-f79974fc2d20@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4-Apr-25 08:37, Ricardo Ribalda wrote:
> Currently, the driver performs a length check of the metadata buffer
> before the actual metadata size is known and before the metadata is
> decided to be copied. This results in valid metadata buffers being
> incorrectly marked as invalid.
> 
> Move the length check to occur after the metadata size is determined and
> is decided to be copied.
> 
> Cc: stable@vger.kernel.org
> Fixes: 088ead255245 ("media: uvcvideo: Add a metadata device node")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hansg@kernel.org>

Regards,

Hans



> ---
>  drivers/media/usb/uvc/uvc_video.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index e3567aeb0007c1f0a766f331e4e744359e95a863..b113297dac61f1b2eecd72c36ea61ef2c1e7d28a 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -1433,12 +1433,6 @@ static void uvc_video_decode_meta(struct uvc_streaming *stream,
>  	if (!meta_buf || length == 2)
>  		return;
>  
> -	if (meta_buf->length - meta_buf->bytesused <
> -	    length + sizeof(meta->ns) + sizeof(meta->sof)) {
> -		meta_buf->error = 1;
> -		return;
> -	}
> -
>  	has_pts = mem[1] & UVC_STREAM_PTS;
>  	has_scr = mem[1] & UVC_STREAM_SCR;
>  
> @@ -1459,6 +1453,12 @@ static void uvc_video_decode_meta(struct uvc_streaming *stream,
>  				  !memcmp(scr, stream->clock.last_scr, 6)))
>  		return;
>  
> +	if (meta_buf->length - meta_buf->bytesused <
> +	    length + sizeof(meta->ns) + sizeof(meta->sof)) {
> +		meta_buf->error = 1;
> +		return;
> +	}
> +
>  	meta = (struct uvc_meta_buf *)((u8 *)meta_buf->mem + meta_buf->bytesused);
>  	local_irq_save(flags);
>  	time = uvc_video_get_time();
> 


