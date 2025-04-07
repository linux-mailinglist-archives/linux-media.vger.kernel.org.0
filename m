Return-Path: <linux-media+bounces-29497-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 147CAA7DC94
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 13:41:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A4663A7132
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 11:41:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E562A23ED71;
	Mon,  7 Apr 2025 11:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aCtiMOu+"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B380623372D
	for <linux-media@vger.kernel.org>; Mon,  7 Apr 2025 11:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744026106; cv=none; b=Hvy5w16U/f8fvSfxp0kzt2hs7F2uaXFpVjolxtHcLOtQ6Cd3a+EtqmBiHxkGPtJQYY46K/iwK/cwEKwvbl85h5hr9pr24ZGX1J0socrwPtHu+vjZ0VVO6DHOAsy4gnHkG/gmjSlxzIUsj72KwWWLcXAq80w51kgt9XWFjaHI46s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744026106; c=relaxed/simple;
	bh=T1Gc1WsYyy+thC5pufNRIsi57oTBLKU11v4occxYB9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iCxjRFOoJHIqRuABSaPehZRMKY1yskW5HlHvnQFyBX1ESghv4rEjwBWgRHSjrFlIs1Rigq7+UFcb90PTfYLra2wgs2+dNAaasWeJn0cp4dr/0w7Y9xkBnBJr6dtPl4IEPLfm3lwo1IUncOJX82LT3rSJBCwrkVRd6+ohcqpk9Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aCtiMOu+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744026103;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/18Tl/tFX6iSKG+VYUdH9MARKh6n7GdxvTDO5NcIXq0=;
	b=aCtiMOu+SaqNrndLEKAH2BnYfM7J+hlItx2RQwkADbUzPVZHUOUtXYy4uVQ6c5X3IA7U/L
	o8v0e2P4dNeH2myG76yriKLqkFemWUmWhMCxlNDBsojC8hAlmFZIMKVMpIFX3kiJWFS7/c
	9nUXRP/pd7bt6XV420M2AEzxConGFVM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-118-vRhuUnV7MZ68XYsQHFf8PA-1; Mon, 07 Apr 2025 07:41:42 -0400
X-MC-Unique: vRhuUnV7MZ68XYsQHFf8PA-1
X-Mimecast-MFC-AGG-ID: vRhuUnV7MZ68XYsQHFf8PA_1744026101
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3912a0439afso1822035f8f.3
        for <linux-media@vger.kernel.org>; Mon, 07 Apr 2025 04:41:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744026101; x=1744630901;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/18Tl/tFX6iSKG+VYUdH9MARKh6n7GdxvTDO5NcIXq0=;
        b=Ogr1lcxpaKimo7td2gaE3kSKaG+8r0NUIdKPe/SkO1kzHUF6NaDubEW+wrubPZJnNg
         hw5gj3u/OwASbUJuDmdLBZhMe+1wVqZArWCaRMm/rXEbvuLlcogXf9GodOP7hrm1NGYW
         190i5VsxaE2kfJAWDbUyiXNA1tCrSOFbtFOTE8ZHhGDuGZGX2U1uXUkPBWGuVQt900Sx
         GNKFzX/zDeYRdQSLcN3f7gUsb+6LjQ8X07YLd4dt7vYoJqvE8PR83aNT3AgaP5FOXy2q
         llFl8nceXht8lTIqJXks5OuoLB/dT6NmBKHzE77MYxurqEDTgQjDe8RW3G8/xx6RRPeY
         N8lw==
X-Gm-Message-State: AOJu0Yx9E2iWELZwnrh1tqBlcyt/cA82wboagQqvBFPNRXr1TID6w43r
	cWB5eGsFZn8rUxVarAlilhkjOr1chOOUpKR7sUUXk7yqKn+CumdHTlLlSQlXn48uhgSR9ms1WZ6
	4Sc0q4mkpY21Fi6AojkuQZM16klpZ2i9nxy+SuReSAtu8LySVGqgELpuU4HlJ
X-Gm-Gg: ASbGnct9TxEd10QGnGGymyp/ncQT6/Yx53TH3ysMjwfhtQaPW63aig/4Y+WtzzXysdD
	nXj0iroC1FbCVuNzCx2pVxhbObI9rFV8F9aeeCzQZjh/+HQoRdWCjG8SYhWwTMY2241VnJQ5bYF
	lCgw6KuMB90Zq5QLC7VTvbYqkCn6iOiXNVIvmlSt2ehV9adIzpkp8K6TpfLNpqbAS5aIOqHCXrG
	L4lreEXhS+obeBQiua2HH/UyaEVuZb1lfDrc+6/jlOA1JeqVuV67WOuISIn2sAi1UA6xU6VJ3K8
	r71GWvVBMImmj7gH2j8=
X-Received: by 2002:a5d:6da9:0:b0:391:2f2f:818 with SMTP id ffacd0b85a97d-39d6fc00b4dmr6938037f8f.9.1744026100973;
        Mon, 07 Apr 2025 04:41:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5I8mCiAb1eBIzaa69eqs7IXjcg7TUnCrCJ0nVq8RtXubncMnApUfmUN9ILHJhvMKIwwyQQQ==
X-Received: by 2002:a5d:6da9:0:b0:391:2f2f:818 with SMTP id ffacd0b85a97d-39d6fc00b4dmr6938012f8f.9.1744026100616;
        Mon, 07 Apr 2025 04:41:40 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1795630sm133704795e9.29.2025.04.07.04.41.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 04:41:40 -0700 (PDT)
Message-ID: <14319e01-e7b8-4ab6-bc27-a2b02b755c10@redhat.com>
Date: Mon, 7 Apr 2025 13:41:39 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/5] media: uvcvideo: Implement Granular Power Saving
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
References: <20250327-uvc-granpower-ng-v6-0-35a2357ff348@chromium.org>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250327-uvc-granpower-ng-v6-0-35a2357ff348@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ricardo,

On 27-Mar-25 22:05, Ricardo Ribalda wrote:
> Right now we power-up the device when a user open() the device and we
> power it off when the last user close() the first video node.
> 
> This behaviour affects the power consumption of the device is multiple
> use cases, such as:
> - Polling the privacy gpio
> - udev probing the device
> 
> This patchset introduces a more granular power saving behaviour where
> the camera is only awaken when needed. It is compatible with
> asynchronous controls.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
> Changes in v6:
> - Improve error handling
> - Use __free instead of guards()
> - Rename uvc_v4l2_unlocked_ioctl
> - Link to v5: https://lore.kernel.org/r/20250303-uvc-granpower-ng-v5-0-a3dfbe29fe91@chromium.org

Thank you for the new version.

I've pushed 6.15-rc1 + the entire v6 series merged on top to:
https://gitlab.freedesktop.org/linux-media/users/uvc/ -next now.

Regards,

Hans




> Changes in v5:
> - Improve "media: uvcvideo: Make power management granular" commit
>   message.
> - Link to v4: https://lore.kernel.org/r/20250226-uvc-granpower-ng-v4-0-3ec9be906048@chromium.org
> 
> Changes in v4:
> - CodeStyle
> - Create uvc_pm_ functions
> - Link to v3: https://lore.kernel.org/r/20250206-uvc-granpower-ng-v3-0-32d0d7b0c5d8@chromium.org
> 
> Changes in v3:
> - Fix build error on sh4.
> - Link to v2: https://lore.kernel.org/r/20250203-uvc-granpower-ng-v2-0-bef4b55e7b67@chromium.org
> 
> Changes in v2:
> - Add missing semicolon.
> - Rebase on top of media-committers/next
> - Link to v1: https://lore.kernel.org/r/20241126-uvc-granpower-ng-v1-0-6312bf26549c@chromium.org
> 
> ---
> Ricardo Ribalda (5):
>       media: uvcvideo: Keep streaming state in the file handle
>       media: uvcvideo: Create uvc_pm_(get|put) functions
>       media: uvcvideo: Increase/decrease the PM counter per IOCTL
>       media: uvcvideo: Make power management granular
>       media: uvcvideo: Do not turn on the camera for some ioctls
> 
>  drivers/media/usb/uvc/uvc_ctrl.c |  37 +++++++++----
>  drivers/media/usb/uvc/uvc_v4l2.c | 115 +++++++++++++++++++++++++++++++--------
>  drivers/media/usb/uvc/uvcvideo.h |   5 ++
>  3 files changed, 123 insertions(+), 34 deletions(-)
> ---
> base-commit: f2151613e040973c868d28c8b00885dfab69eb75
> change-id: 20241126-uvc-granpower-ng-069185a6d474
> 
> Best regards,


