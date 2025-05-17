Return-Path: <linux-media+bounces-32682-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C7AABA9EB
	for <lists+linux-media@lfdr.de>; Sat, 17 May 2025 13:52:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5AE7E4A4D98
	for <lists+linux-media@lfdr.de>; Sat, 17 May 2025 11:52:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 804421FBE9E;
	Sat, 17 May 2025 11:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NKYPUYtm"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E1B1EB5C2
	for <linux-media@vger.kernel.org>; Sat, 17 May 2025 11:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747482728; cv=none; b=qG0V/oVltQAGA2l3tKO03rBCYu/U0xwBmTXN0x09lqZjU3Pq0b04xf3xIbW3lBh+/6nQ9KNa7OcoHTvj7sf5lV/iZzVBpPpXoY1BoR6FSVIAi6etS42HJRBh7hcHqKpJgp+x3ZLvHfFOsefTjNSyiNTQvuRuiCEJ9RBiPpeX5rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747482728; c=relaxed/simple;
	bh=m5hZn2lBKz1PWAaWSHBVZ7i7dyeqEjyGUoYURXdR9uM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=awsiBhneD2hhe2bKh4CDZ+uCkIgLkoYcTpcZyslHgVY8ezd6w77MUuEnbJmIQDSweVyNplOLAYz+hhS99UHkbiQUQQtidGoE0wWx24KTIPrApT4vuvlOIQJMSYfIpZggh/NdQ2anGvO6uQA79cgxjRagyS9VTxQqE4uqHXYlORk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NKYPUYtm; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747482725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WI7rWNSKhgDqBhYOHrrkdZ0TEF2u5UshAdR0shZptPU=;
	b=NKYPUYtmgo1aXQe0o5Lad5yT+SQjMfg4AZtrIPqyxZDZ/3B3naH2B9r6opSd6ZZHBsaGcb
	qjhbvskVbJhvuvJhXjxlUy0zBzisQ2l9J9N/HcWiDkS05Z6M3+EUXlO4LfjlgCfVNz+NKp
	OU1y1SPMKOpUA4Fye/+U5KxqYpkQYAM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-bskJJdcCMqu1CbQocgmAJQ-1; Sat, 17 May 2025 07:52:03 -0400
X-MC-Unique: bskJJdcCMqu1CbQocgmAJQ-1
X-Mimecast-MFC-AGG-ID: bskJJdcCMqu1CbQocgmAJQ_1747482722
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a364d2d0efso329659f8f.3
        for <linux-media@vger.kernel.org>; Sat, 17 May 2025 04:52:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747482722; x=1748087522;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WI7rWNSKhgDqBhYOHrrkdZ0TEF2u5UshAdR0shZptPU=;
        b=FKZJZmEGaRRdQEXBidmZ10SmnxNolZdVVSy49so3oA0WMlD486sG8fW0Z2GXv33VEp
         CWlp12sdRBTpO3smmTOov4fZBsZI74ypa0yz/UtVaLO7wnzb070gAHkLTNoWQoezkSr9
         Tyh1cwR9/vz+IOy1zcHUdTL4J2rzz/3ZYqcj4dVh3tVYaRo3CznxuYqpQhq3R5tJW6HC
         l8xknG7KEcLb0NfGWjHYMulZbS8d05r00nD/uMqnN1L5KHtlq9QpjeG5edHBu9tcritq
         +JASnzq+XqqpfqpncVmDF/CpAUxtPcztJoBWGgZNueu+g/2RBa711QtA6CzRBtK0NLjx
         lOtA==
X-Forwarded-Encrypted: i=1; AJvYcCX7dSjvsAwmkjtEU+KX4MRWbInx8Yjo5xy5SJJ7aTLAPIihRVvcPZGJC6F++rFUCRiTCOM/9Pny1gzMwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVNgUoZFNnYyQP4Fw9e9m3LOZAP+yGhdXk7zFZ42oR412Vt9/i
	/tDpHcAavu115yovHx/zVS3WJF13jysaGXg66Mq8+rqb5x1yvKZAMH+hybqanuMStJi5JI+bbSn
	y7RN8WzK4DjcWF8bp1JcJgmZdF0TV9jJwxhFA+EVQE2C5XxV9uu1mLyOa+CBLGlUw
X-Gm-Gg: ASbGncsDHtAKrJNLVsjN5r2peC+PJe9Jjsivc2oKyh2MKjhatcZ7Z1gsMGu2pkYJB2E
	yqBzKaVSXnHT5fKKLpQLbJPnKkmeeh9o7+i8GO9zlN0CbhxT9SMuVrrVFoMA3k6qZ8NdNWhAaDu
	19raV1QypSlLz6GHaKDgbsD4JunRt0CVYFNpr4pcKuwiysI3CtMnnAekMHS1QBO8nI8d7DHRWbA
	Dws5U8Vw55PvKMFr/tuhISOI2zA15AEiVjQLFy/qU5yExayvuU2EcVpkL9DiGrP158FyKcEXIFJ
	WYbbfiLX7cCYHA==
X-Received: by 2002:a05:6000:2dc2:b0:3a0:b65b:78ef with SMTP id ffacd0b85a97d-3a35c845c04mr6604833f8f.52.1747482722502;
        Sat, 17 May 2025 04:52:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEEManXnYpBgRjM8l6x5mvWBUQhw2KLN6YmgUA9pVhlJcvB3dgeZ4KHw08Pb6yV0/tksn56dg==
X-Received: by 2002:a05:6000:2dc2:b0:3a0:b65b:78ef with SMTP id ffacd0b85a97d-3a35c845c04mr6604823f8f.52.1747482722165;
        Sat, 17 May 2025 04:52:02 -0700 (PDT)
Received: from [10.124.0.73] ([89.207.171.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca5a5b4sm5922936f8f.21.2025.05.17.04.51.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 May 2025 04:52:01 -0700 (PDT)
Message-ID: <6d1bd031-cdea-441e-98a3-b1f16dc55d4b@redhat.com>
Date: Sat, 17 May 2025 13:51:57 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11] media: uvcvideo: Fix bandwidth issue for Alcor
 camera.
To: chenchangcheng <ccc194101@163.com>, laurent.pinchart@ideasonboard.com,
 ribalda@chromium.org
Cc: mchehab@kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, chenchangcheng <chenchangcheng@kylinos.cn>
References: <20250515111406.1470687-1-ccc194101@163.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250515111406.1470687-1-ccc194101@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi chenchangcheng,

On 15-May-25 13:14, chenchangcheng wrote:
> From: chenchangcheng <chenchangcheng@kylinos.cn>
> 
> Some broken device return wrong dwMaxPayloadTransferSize fields
> as follows:
>     [  218.632537] [pid:20427,cpu6,guvcview,8]uvcvideo: Device requested 2752512 B/frame bandwidth.
>     [  218.632598] [pid:20427,cpu6,guvcview,9]uvcvideo: No fast enough alt setting for requested bandwidth.
> 
> When dwMaxPayloadTransferSize is greater than maxpsize,
> it will prevent the camera from starting.
> So use the bandwidth of maxpsize.
> 
> Signed-off-by: chenchangcheng <chenchangcheng@kylinos.cn>

Thank you for your patch. Laurent has merged this into the uvc/next branch now, see:

https://gitlab.freedesktop.org/linux-media/users/uvc/-/commits/next/

Regards,

Hans



> ---
>  drivers/media/usb/uvc/uvc_video.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index e3567aeb0007..11769a1832d2 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -262,6 +262,15 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
>  
>  		ctrl->dwMaxPayloadTransferSize = bandwidth;
>  	}
> +
> +	if (stream->intf->num_altsetting > 1 &&
> +	    ctrl->dwMaxPayloadTransferSize > stream->maxpsize) {
> +		dev_warn_ratelimited(&stream->intf->dev,
> +				     "UVC non compliance: the max payload transmission size (%u) exceeds the size of the ep max packet (%u). Using the max size.\n",
> +				     ctrl->dwMaxPayloadTransferSize,
> +				     stream->maxpsize);
> +		ctrl->dwMaxPayloadTransferSize = stream->maxpsize;
> +	}
>  }
>  
>  static size_t uvc_video_ctrl_size(struct uvc_streaming *stream)
> 
> base-commit: 9f35e33144ae5377d6a8de86dd3bd4d995c6ac65


