Return-Path: <linux-media+bounces-28192-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1EFA60C5E
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 09:58:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 76348460E4F
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 08:58:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E0451DDC08;
	Fri, 14 Mar 2025 08:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VMwU24Yb"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F001DB924
	for <linux-media@vger.kernel.org>; Fri, 14 Mar 2025 08:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741942669; cv=none; b=EdDT8wwYFmx/JMLK9PbdyubwduPbIOZotQImVf+FHUBYMQw8ufrsk+oGjMTYOEZ2rIkXuV2dxsDX7mChYot5pBCoj2dlDyn46rhtVQ6egCkVqm8S6q1iPK0mC5ex3SLZi2F1V0Qar0LkGZhG+jAPCC+ChlpDLPvIBWvjwDCeug4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741942669; c=relaxed/simple;
	bh=/9HiRgLVAcf8p1ECna3uBG+12wfypO//4aB4JVSwgV4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m9IiDaeiovFg9TfYLAhR3TN0qtSvWe6p7ek/LspZ/BntxM80wmFYarCvj8SUTO9vaMhTI1alpD8l/+LxQlZxCiAXJiC6NZLLoGL+OeawMfYJa3xl1ObSklO/TJM/puR8oaBqSufDKLYAA1ngGCaQTh/qHMtCo3SeU8QRtsGc0h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VMwU24Yb; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741942666;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UvFH9Knj3hl7iOYYG4m34Elst94rHcidF3oA0/6g8Lk=;
	b=VMwU24YbRj2luFJn+zMruTifcrIEKam4pQ2qwEqq14X96sNscIdyoLiAnUn864L4pSJ5uV
	quaruacaVamFLlRP6ODhL3ZrLI4OhijNeHchdv6c6sGWSYHM/IlhVj8R4jQd1ZnZWyvVVk
	JLSCoO+Is5RUFW68bIQiGn5KJmR9xKI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-93-7gtPxakyNKem3uv7JR3aog-1; Fri, 14 Mar 2025 04:57:45 -0400
X-MC-Unique: 7gtPxakyNKem3uv7JR3aog-1
X-Mimecast-MFC-AGG-ID: 7gtPxakyNKem3uv7JR3aog_1741942664
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ac31adc55e4so136540866b.3
        for <linux-media@vger.kernel.org>; Fri, 14 Mar 2025 01:57:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741942663; x=1742547463;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UvFH9Knj3hl7iOYYG4m34Elst94rHcidF3oA0/6g8Lk=;
        b=quIQ9WJ+xR+FnCui8bxxUoZA+DVTiltoXbaqLFAr0djpiTovhQaA17VjdMi8DL3cYA
         Te75oDLyVyII+IjENPdvvei9zitpXNylfvQ1/YUzsswrotorOL5PbZMyFkEL6DmLFcn4
         kHs2iAGW9t7mGfyFnQpjkclxrHBhWtWGmHuwUvkaJt8fPHjYERqQ0rsOMOX87yMX8i+C
         i+UL+7NywkvewvJos8dcMlcmP/xj1LjUL8jnmmbdkgsVEgGL6wrhygLCrjmdTKgP7Ftb
         8SjBFHCOSu4252Fr8JIy3w9QfoAGnfTxz64/O2XdLsPpub7uAXYntVE/VGirsHag/456
         wBMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLpYyE7ePVW2MydP+gs6/WwXJI+pefDd4yZ9WSCmdRHYlERdA+hUwYLaYH2x04PzrFIU9exarvoqOyKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwuqSgMrm1As/nKRVFXLhkxO5TRdwVako9/HdTTpyhGQKc+2Hl
	AWa7HhnoO5QAnl1KSPjwgbW45LHnk+Pl3y0qN7cc7Os5HqN79j07F6Mla6F6skpUpSRVwYEFOxP
	KXuTOV+/HaDUTb7o0f4W5NVumRqwAsnnKSI5/LP3joM21yEeCHbOtlgp9E5Nh8Ee1Xd554d8=
X-Gm-Gg: ASbGncvkpsokCex6Z8lL3IUid8upyLd2B09zSwXL63gJUueqmhZ9ebHyFtDXTISkXbI
	cHIpRGtlBW1jFxZECLewyvURMGCo1MiZqHxvCD7TNurRY8Z2jEGlMq5WTX7IwSg6Bae7Op2/+nr
	9zppm8iZ8DZzwL2jesIyLcMoIbW33ZGdPA1DS7OtedhiJ88lMcdiL7255pnZ4j2Q1hN/9xoZOov
	Zu+wGzbPWQem/ah/N2PIsdKSAsxNH/8zOhPvSlrld0n4BWVzwGHoGEIaHhZnv5KQOwpeJzlgalV
	cxq2InS4jdg72oTXTA0JQNlhploypOW9xwMnx7+fDnfkeJQHZ9iHpWMcUMZuYH8oEcS+GlXV9bA
	uuyKa8Yx2UV2i0Vgbm169sMbBHVOcgvY1E7K0DUKz5ANP0hkKCK54eWJKaT9lCGcCqQ==
X-Received: by 2002:a17:907:2dac:b0:ac2:63a9:df0b with SMTP id a640c23a62f3a-ac330378652mr188498566b.35.1741942663122;
        Fri, 14 Mar 2025 01:57:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHREeEQWzAZbmBZyHJHEApsmhjnzU+MV8PtzV3nFcxh4ddMtyFRw54TeApFrTCGXMoWXZdgvQ==
X-Received: by 2002:a17:907:2dac:b0:ac2:63a9:df0b with SMTP id a640c23a62f3a-ac330378652mr188496666b.35.1741942662695;
        Fri, 14 Mar 2025 01:57:42 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314aa7d10sm193297566b.185.2025.03.14.01.57.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 01:57:42 -0700 (PDT)
Message-ID: <af1f02d3-7341-4b2c-b9ed-50a38f8ebee8@redhat.com>
Date: Fri, 14 Mar 2025 09:57:40 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/14] media: i2c: Add Omnivision OV02C10 sensor driver
To: Ingvar Hagelund <ingvar@redpill-linpro.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>
Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Joachim Reichel <joachim.reichel@posteo.de>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Hao Yao <hao.yao@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
References: <20250313184314.91410-1-hdegoede@redhat.com>
 <455e819b9fe70ee5958d220b8eca6f9c23baa889.camel@redpill-linpro.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <455e819b9fe70ee5958d220b8eca6f9c23baa889.camel@redpill-linpro.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Ingvar,

On 14-Mar-25 9:52 AM, Ingvar Hagelund wrote:
> to., 13.03.2025 kl. 19.43 +0100, skrev Hans de Goede:
>> Here is v8 of the patch to upstream the OV02C10 sensor driver
>> originally writen by Intel which Heimir has been working on
>> upstreaming.
>>
> 
> Many thanks to Heimir and Hans for this excellent work. This makes my
> workday easier. 
> 
>> (...)
>>
>> 1. I don't have hardware to test. I hope that others can test this
>> soon,
>>    if things don't work the idea is that people can apply my cleanups
>>    1 by 1 and then we will know which change has broken things.
> 
> Seems to work fine on my Dell XPS 13 9340. I have not found any
> glitches so far. Tested with on fedora 41 with qcam, cheese, obs, and
> firefox - tested with websites gum, jitsi, and webcamtests.com. All
> these work fine. webcamtests.com was even able to select highest
> resolution/zoom. Note that chromium does *not* work yet, at least not
> in Fedora.

Great thank you for testing. I was afraid that I would have broken
something it is good to hear that I did not break anything.

Sakari, do you want to take a look at the incremental patches in this
v8 to get an idea of what I changed after your last review and maybe
give feedback on specific changes, or shall I post a squashed v9
which might be easier for you to review ?

> I now use this as my daily camera, without any problems.
> 
> I only miss more controls available, for example adjusting colors and
> white balance. Some basic automatic adjustment seem to work, like when
> changing rooms or lightning, but when for example you sit by a window
> with sun on half your face, the image distorts, like getting over- or
> underexposed. Also, the colors seems a bit washed out compared to my
> usb cam (and to real life colors)

Yes we need to work on improving the image quality and things like
the autoexposure algorithm, note this is all work which needs to be
done on the libcamera / softisp side not on the kernel side.

> Switching to and fro between v7 and v8 without rebooting gave unstable
> and strange results, but I presume that is less important, or even
> expected.

This is expected the sensor and CSI receiver get linked together
once both have loaded, rmmod-ing the sensor driver after this linking
is done is not really supported.

Regards,

Hans




