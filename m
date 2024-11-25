Return-Path: <linux-media+bounces-22003-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B5C9D8967
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 16:34:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 11A93B2C858
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 14:24:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E42218B47C;
	Mon, 25 Nov 2024 14:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RWul6A7Z"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B156184520
	for <linux-media@vger.kernel.org>; Mon, 25 Nov 2024 14:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732544668; cv=none; b=XoYufwRzYIKORnLNk1HU22fsLNXsPjfVAwTQDhsuhaWInKVhwncPKmWU5KyVrnZRFEVUr93QE15QQfrubv9IKt7PjxofxsEcAlWKpExP5DpV/JcgJbDp/5MZA7Vw4JlyqTULFJkhevAP+DAIfK6bm4uHpoBl3pfAxM5hfQkFY30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732544668; c=relaxed/simple;
	bh=PAApblf5/yOuk9I4BzfC+hcjl0lxlkL+IWpwS5snJeE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rmRY72Vcx0lQE3ptg1YsqgMp9x0h2FRs2SHUypEuYodGKq74ovpVuE2sSiD9OYOl4Lj8jJ2TtPHkSmLuNk5WKNybFZHLHhFrdBcEwoJZlxwgg8wvJPqIpKHOuGGCrMYvALzlEgs3IM64R6W5c3iiwuI0z6Dri30LAFAfjXIYdLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RWul6A7Z; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732544666;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OAej4OPlBRSwRD5hkCmUtBDLkFXG4Wh3poAJBOLJFhM=;
	b=RWul6A7ZYPPS8a2sxq+lD/MpD4oDa82ZEkOV+ptOGHhLYQd/5+eeBu+KOn42yKvDsIjd66
	ES0vimhSfPzr9jPI10mpPmt9tolwuhlEn+9Uy401L9mXlSw7HoLTweMGLo4BibkWh8R/hX
	t8ZDjAd1HY9D3q8LwJNdryT08nDVRhw=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596--1_L4MKwNf6GbebctiAw_Q-1; Mon, 25 Nov 2024 09:24:24 -0500
X-MC-Unique: -1_L4MKwNf6GbebctiAw_Q-1
X-Mimecast-MFC-AGG-ID: -1_L4MKwNf6GbebctiAw_Q
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-aa529e707f4so181398066b.0
        for <linux-media@vger.kernel.org>; Mon, 25 Nov 2024 06:24:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732544663; x=1733149463;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OAej4OPlBRSwRD5hkCmUtBDLkFXG4Wh3poAJBOLJFhM=;
        b=v0FlSbf3HrZZFTgCUz1sn0gMZfov6QKK8Wf7w51EW2Qv8GepZJjW7MoBxpHWX1QOEs
         WbXA3i3rStbhVRE5RjvLQt7ggi/a04lGWK3UbDjYBcMFzVEXtdjksorFxVfIeVUVY3AU
         PnD43KC87I2HURIj5/v9+ICWNcuQe1vxibW9cTS0YAaeKdsS4GdkOnmacxPaRfZNL/wU
         kCwqkHFDi8yFlBRwqi9vF5idB+9qWUpI+eyb/1/kLJ6DklirS4Xl2Qppofbvx/gjxJok
         BPmRU7ZS6ADiNB7YMuR6Yzmmz+LtP6H5Kx/oHsGdIzEO5J3NtiKK7ihKI9KnqjZaaK4G
         0E0g==
X-Gm-Message-State: AOJu0YzjMVnaMCfblS66SHvimBSw6ZLBcZPHtoqj68mHBY5v77PSvJRv
	0F9lEtUhdWEcYGMuROi2EyzG/DMbkArXWswUCQr3Uds1V+En9EeZR/16x4MItRUYx/3ojLVP0hy
	OWscFIinVrDm56033wZpHxFfmHS8QDs43Eqp8is9R0TPZL2EDncVvgLBhwwB5
X-Gm-Gg: ASbGncuGaNHGq3N/Os1laUiliJHe31If8o5NmqF4BTdY8nrN9qG2SJCHxZLEXZtvyDf
	srtWAWgxixL2iB9lI4GCvNfrRftHX13NIvtiHUpqAdl2m1KVyuyD8Um6nP9xGoO5DoQQpH5M+eE
	F8E4aK2L/C4q87qm7LyD5g4p8vS4QvAC/kyGLqhAIlJLy+ShcexPQ77WBolk8p+p9hVevfh5CFl
	xh9gWmv/OGZr4jPHsEdqoNHWer1EtH/X7x/VhNP+CS0C4VPAeuawLdBdkrTwCfQFdKM0N3Qg2TC
	oq/VKGKYXws7eyksnXiZTrwhkXHD7EqDxe3w1hGpOOrf4RJDF6t4INdSqurk3BxpukLYiJx7qUx
	rYMmIJw+0GzQMwEFV4sKW8+MD
X-Received: by 2002:a17:906:3194:b0:aa5:274b:60ee with SMTP id a640c23a62f3a-aa5274b69famr1018207666b.39.1732544663472;
        Mon, 25 Nov 2024 06:24:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHoGDD47dfwy9wZFvAqX4WMcfksgKqNJCU6tx7BOnVPBVTlVWMX5EUDMfzlOkKD2trMBOUnQw==
X-Received: by 2002:a17:906:3194:b0:aa5:274b:60ee with SMTP id a640c23a62f3a-aa5274b69famr1018205166b.39.1732544663087;
        Mon, 25 Nov 2024 06:24:23 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa537b4eae7sm302808966b.99.2024.11.25.06.24.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 06:24:22 -0800 (PST)
Message-ID: <a321900c-2be7-4fe8-b693-4a185f1d5aa4@redhat.com>
Date: Mon, 25 Nov 2024 15:24:22 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] media: uvcvideo: Support partial control reads and
 minor changes
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>, stable@vger.kernel.org
References: <20241120-uvc-readless-v4-0-4672dbef3d46@chromium.org>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241120-uvc-readless-v4-0-4672dbef3d46@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ricardo,

On 20-Nov-24 4:26 PM, Ricardo Ribalda wrote:
> Some cameras do not return all the bytes requested from a control
> if it can fit in less bytes. Eg: returning 0xab instead of 0x00ab.
> Support these devices.
> 
> Also, now that we are at it, improve uvc_query_ctrl() logging.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Thank you for your patches, I have pushed both patches to:

https://gitlab.freedesktop.org/linux-media/users/uvc/-/commits/next/

now.

Regards,

Hans



> ---
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
>  drivers/media/usb/uvc/uvc_video.c | 22 +++++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
> ---
> base-commit: 9852d85ec9d492ebef56dc5f229416c925758edc
> change-id: 20241008-uvc-readless-23f9b8cad0b3
> 
> Best regards,


