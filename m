Return-Path: <linux-media+bounces-21634-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8818C9D3C96
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 14:35:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 175B3B231C9
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 13:35:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 729431A76D1;
	Wed, 20 Nov 2024 13:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HutQNdb/"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0438F17F7
	for <linux-media@vger.kernel.org>; Wed, 20 Nov 2024 13:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732109719; cv=none; b=PXMAOqAVC+ChIbcsrHmWde+ggbG0agAaiOqGYYSqjmxS9lcaKYZVYfjKqQwDRDrqF+CQGDc9MZNlhswakEzW92hn5irYSZh2dX5wgmOImMBWePWYYv4Vxfwt0Cdw3+lNwnsnwtOiJ++GKlcR+wO+dpKkfmAt6oSMSVVOmMwbS6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732109719; c=relaxed/simple;
	bh=e8FOrIY3cxf0W7OzTn+6xazKzrkSDvIqGfy8WUggbqw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jQhJhhH1Fubj6i+LbA3AM7pmyzaNizWlAzloALqJ+XBOgpD9dFUwezqiVkQgLrpBotnZZnMYn7vYCJMydLo7KIts2HJpsoyTYTbsg5BKqezysEldqTXnQgMm3dteLlb936Up1qwZ91tXbtOR4cq4MBuJeeRwLPkjaIXYF5ZUbmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HutQNdb/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732109716;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+2vuM+CMH+yKfOybEW/urA/Wxu3mQQTGIWZA/ooePvs=;
	b=HutQNdb/MklXX+3468hYRdtaZApAzttLb8VdsRP9+2yhqGtPqAUHo/yio0vGXMs7j9QUVg
	ZCZmZYm5N/cTlTEgra4HhIvxUkudzh5x5jLuTSJXunLq3ejjO48NNX1SSy8jupt1kkuxY3
	OuWJhkoTyvqPv/tCoFJ7ZmEsBqnnz9s=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-673-E9KI7YDrMIOPcLz0dpbgoQ-1; Wed, 20 Nov 2024 08:35:15 -0500
X-MC-Unique: E9KI7YDrMIOPcLz0dpbgoQ-1
X-Mimecast-MFC-AGG-ID: E9KI7YDrMIOPcLz0dpbgoQ
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-539f067414fso1411116e87.2
        for <linux-media@vger.kernel.org>; Wed, 20 Nov 2024 05:35:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732109714; x=1732714514;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+2vuM+CMH+yKfOybEW/urA/Wxu3mQQTGIWZA/ooePvs=;
        b=p0gRDF7n2yokuy0lEvrUd2v49LGEw+zRQp0SwpzW91s21Az4xWn4sR5AYVnZBXafMT
         bv027chnfK9e/wkQgwnVFsP1fJ9/WmidUKfxByyXId7KAunsfrOW91N+0cOuVphLzmVD
         0YwoYkS7qejJVyODGQus8NhYkns1bjbJ492UWbc2aA+97nd5lET4Y7JnMJSp5QWT28Xn
         TbfaHbA2GbjboB0wbcGX6EWAdvFEb4eyp/kNK7timFsyX1So/qq52tZcBiPRLRP015nz
         cQyd542G/xvcj/cv+6xJuf35Vi0GlACdKcV4IxBupKa/5lTBRQKqZPAs+6XA090hrolt
         zyZA==
X-Gm-Message-State: AOJu0YwiT8L2akV2FO7jld0aYBkp43qJuZsiqItZ4hvvC7dKcqDTf7cu
	0yY/ZXrgakSt1pns7qBMh2EBRjo+ss1s1ZpVHVCmmnJkntulVsYEd8BD+Lc3ft3+xau47Tj/34z
	yfS0huBibgDr4PRQ+dnJOuKcQwFykDn1SvtwF3lAiHsNqysj/Huce45xD5H4p
X-Received: by 2002:a05:651c:154e:b0:2fa:dc24:a346 with SMTP id 38308e7fff4ca-2ff8db983dfmr16247791fa.21.1732109714006;
        Wed, 20 Nov 2024 05:35:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEM5a1z+R3MCpAN7r90XeLbA5BmVoikjwMqI/J8xiQ/7XIgwC9eSLkmbqa8PDhJOeGQeKJnmQ==
X-Received: by 2002:a05:651c:154e:b0:2fa:dc24:a346 with SMTP id 38308e7fff4ca-2ff8db983dfmr16247621fa.21.1732109713608;
        Wed, 20 Nov 2024 05:35:13 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cff44eff15sm810931a12.35.2024.11.20.05.35.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Nov 2024 05:35:13 -0800 (PST)
Message-ID: <fe5a0e29-fa36-4daa-be62-9186c47e02ba@redhat.com>
Date: Wed, 20 Nov 2024 14:35:12 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] media: uvcvideo: Support partial control reads
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>, stable@vger.kernel.org
References: <20241118-uvc-readless-v3-0-d97c1a3084d0@chromium.org>
 <20241118-uvc-readless-v3-1-d97c1a3084d0@chromium.org>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241118-uvc-readless-v3-1-d97c1a3084d0@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 18-Nov-24 6:16 PM, Ricardo Ribalda wrote:
> Some cameras, like the ELMO MX-P3, do not return all the bytes
> requested from a control if it can fit in less bytes.
> Eg: Returning 0xab instead of 0x00ab.
> usb 3-9: Failed to query (GET_DEF) UVC control 3 on unit 2: 1 (exp. 2).
> 
> Extend the returned value from the camera and return it.
> 
> Cc: stable@vger.kernel.org
> Fixes: a763b9fb58be ("media: uvcvideo: Do not return positive errors in uvc_query_ctrl()")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/media/usb/uvc/uvc_video.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index cd9c29532fb0..e165850397a0 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -76,8 +76,22 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
>  
>  	ret = __uvc_query_ctrl(dev, query, unit, intfnum, cs, data, size,
>  				UVC_CTRL_CONTROL_TIMEOUT);
> -	if (likely(ret == size))
> +	if (ret > 0) {
> +		if (size == ret)
> +			return 0;
> +
> +		/*
> +		 * In UVC the data is represented in little-endian by default.
> +		 * Some devices return shorter control packages that expected
> +		 * if the return value can fit in less bytes.
> +		 * Zero all the bytes that the device have not written.
> +		 */
> +		memset(data + ret, 0, size - ret);
> +		dev_warn_once(&dev->udev->dev,
> +			      "UVC non compliance: %s control %u on unit %u returned %d bytes when we expected %u.\n",
> +			      uvc_query_name(query), cs, unit, ret, size);
>  		return 0;
> +	}
>  
>  	if (ret != -EPIPE) {
>  		dev_err(&dev->udev->dev,
> 


