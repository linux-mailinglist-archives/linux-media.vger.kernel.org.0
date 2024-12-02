Return-Path: <linux-media+bounces-22459-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F5E9E05B8
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 15:58:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7CFD28E615
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 14:58:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B09E20966C;
	Mon,  2 Dec 2024 14:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Hyvaxmg8"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20BA20B1F7
	for <linux-media@vger.kernel.org>; Mon,  2 Dec 2024 14:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733151284; cv=none; b=W+9Ak5sAAvHrGNIdANAdXdkObGUn0SOjRTWMsqmWD+Sluanj0Yd/kVjh5of6VbSxGgkgxvlA4Bpp1EdNmmHszQNIClvU76sdxM8jBOkTRfffO74CHJ6ksO+4ro38tuNyRQw0OXV8Ab7EVKA01QzkZDRLBeD9+0qCtmCA6+BX8kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733151284; c=relaxed/simple;
	bh=YkotplpWgvyOXrU9knIdvnssVPPUv+zNS5lUYYpij08=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pydy9MSrAWAEPiphw7T1GyCe5Yt8tzf8wRBo7gtuWsgsynVnR3xLLpGZ+3eMYqYesBqMRaPx4Kx5izPnRwpHO40b5r19rxbYUEGuhF6F0v8ovOHfjZmtJuvT0jiupdaKvs3cHlfb35hOyA0cH8QO6nbp4MI3bXAw57cSkVDNfhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Hyvaxmg8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733151281;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MetsKcKHKPlrQ9kSF4BsZc6nqtrjJYVyYpKo+i2OZqc=;
	b=Hyvaxmg8flojwhBmdtK7qNFpdNesOOBQtVOPjriN3+X5acJiaoi0I/UBzeIAGdJqnjbCBg
	Gjj1CH8gle+AfB0N1d0ORTKVWmm/Cygw/wgevs5DdlbtrBFzc7XLgVXRUvUWbTPov+RswF
	1i2J+zx+YwLv7N1A8negtEsoxW7fLrY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-295-DirFjrLoPTaw0egCfViGlQ-1; Mon, 02 Dec 2024 09:54:40 -0500
X-MC-Unique: DirFjrLoPTaw0egCfViGlQ-1
X-Mimecast-MFC-AGG-ID: DirFjrLoPTaw0egCfViGlQ
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5d0bcd51932so2804499a12.3
        for <linux-media@vger.kernel.org>; Mon, 02 Dec 2024 06:54:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733151279; x=1733756079;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MetsKcKHKPlrQ9kSF4BsZc6nqtrjJYVyYpKo+i2OZqc=;
        b=fX+NzkDLBQBnnDRwNyXn17gKIEi0Ts+O7n/c8j+9hpotNXeU1QFe/wXiCGZXMsCGK4
         vLrKtGq0+QHiDZeXD19PrWt3T9l1loVh6nS5lZrNH4FgHfbTgc6ZMdiGmxhl/WkrAlI/
         igf3D9x67rx08rporK3+0xF0rAYW/8AOtKZtyFcnoUKoTSUO7tOJXQLp9rPNjq/S6dVP
         ccDeNIQOURHk0/caLsyuSJ66buXTcGqKVqamckbwr4BOHdUIVy6wcTd1uWAor3A7R+ec
         XSt2anoiz0mkvABFw6zM00QbxjRoLARN+5asLdWPlA3eDGHKSMKB2YlYWWxPWq9UKcMa
         xA9Q==
X-Gm-Message-State: AOJu0Yw2DxYigi66ynfQx5B2GnMaNVweNk/UEL58SP1Xqv8ltB4ST2Fh
	YraXA+kPR9zMmiMuhG+MVYSP/oEV8om7FXsCkqNDQpWxuVIxf3YAtbHCLfWJVSyYUv2TS8kjtOI
	JV97SnrVFAVHRVTFQVBu6zMRpRaIGJQWglPI5tOByZ3AEi3tzT0PQADpBtwAf
X-Gm-Gg: ASbGnctepaB2W2L+EYzuCnCNBgozNQtAlXu1tu3rFKHTTMNv7GsF8PaA7tErR8QvWQy
	MKshj6/MUeFL90ekHdOTSPuIuriMGRai6EO4TCmt/m25s3+fGwNCVFe8dD8DcZlSkDvdMLyHMig
	79mcOt+VqfUK8kXAHek/Vpaagvv332mmmH85l9PYZwfbWP3cKqPyWtyxZBjnmT6nrF+AIvmgYIk
	kdsvlwwrOOatICHkF6XERIh+sgjy+rouxA26hig8ausCn3JbSxxwg==
X-Received: by 2002:a17:906:3143:b0:aa5:11fa:626d with SMTP id a640c23a62f3a-aa580ee013dmr2564964266b.3.1733151279416;
        Mon, 02 Dec 2024 06:54:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IErVqjQc7dxU3TLbgy9NhmIynnHt4bXAbwnBykBPSLMWV+p8ar+3Kk4B/qStLwDd3H5TbcjSg==
X-Received: by 2002:a17:906:3143:b0:aa5:11fa:626d with SMTP id a640c23a62f3a-aa580ee013dmr2564960266b.3.1733151279019;
        Mon, 02 Dec 2024 06:54:39 -0800 (PST)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5996dc902sm514802966b.50.2024.12.02.06.54.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 06:54:38 -0800 (PST)
Message-ID: <f6045267-6398-494e-8058-0d451b84c7c9@redhat.com>
Date: Mon, 2 Dec 2024 15:54:37 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/2] media: uvcvideo: Support partial control reads and
 minor changes
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>, stable@vger.kernel.org
References: <20241128-uvc-readless-v5-0-cf16ed282af8@chromium.org>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241128-uvc-readless-v5-0-cf16ed282af8@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 28-Nov-24 9:53 PM, Ricardo Ribalda wrote:
> Some cameras do not return all the bytes requested from a control
> if it can fit in less bytes. Eg: returning 0xab instead of 0x00ab.
> Support these devices.
> 
> Also, now that we are at it, improve uvc_query_ctrl() logging.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Thank you for the new version, I've replaced the 2 patches in:
https://gitlab.freedesktop.org/linux-media/users/uvc/-/commits/next/

with this new version.

Regards,

Hans

 
> ---
> Changes in v5:
> - Improve comment.
> - Link to v4: https://lore.kernel.org/r/20241120-uvc-readless-v4-0-4672dbef3d46@chromium.org
> 
> Changes in v4:
> - Improve comment.
> - Keep old likely(ret == size)
> - Link to v3: https://lore.kernel.org/r/20241118-uvc-readless-v3-0-d97c1a3084d0@chromium.org
> 
> Changes in v3:
> - Improve documentation.
> - Do not change return sequence.
> - Use dev_ratelimit and dev_warn_once
> - Link to v2: https://lore.kernel.org/r/20241008-uvc-readless-v2-0-04d9d51aee56@chromium.org
> 
> Changes in v2:
> - Rewrite error handling (Thanks Sakari)
> - Discard 2/3. It is not needed after rewriting the error handling.
> - Link to v1: https://lore.kernel.org/r/20241008-uvc-readless-v1-0-042ac4581f44@chromium.org
> 
> ---
> Ricardo Ribalda (2):
>       media: uvcvideo: Support partial control reads
>       media: uvcvideo: Add more logging to uvc_query_ctrl()
> 
>  drivers/media/usb/uvc/uvc_video.c | 27 ++++++++++++++++++++++++++-
>  1 file changed, 26 insertions(+), 1 deletion(-)
> ---
> base-commit: 9852d85ec9d492ebef56dc5f229416c925758edc
> change-id: 20241008-uvc-readless-23f9b8cad0b3
> 
> Best regards,


