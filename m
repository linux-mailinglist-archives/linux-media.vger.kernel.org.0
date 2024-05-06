Return-Path: <linux-media+bounces-10881-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C79598BCFA2
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 16:04:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 545E91F22821
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 14:04:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08CBA81AA7;
	Mon,  6 May 2024 14:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hdazetS1"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB2881721
	for <linux-media@vger.kernel.org>; Mon,  6 May 2024 14:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715004233; cv=none; b=kTA1G+jTa0phWGKMEI9S+O85iAgXMQzscnUzokMNCIVG6R4MZJCduPhVNqxLLEFFBcS7K9iJJuDMD5AUCKN7I2fXg/TY949i5N+TjaQLMooUTdtotGXSSbnppsBOV4G4OBzSAPMz85XkVTewYIc80nNDLXIFHiz2XvO/1S84mUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715004233; c=relaxed/simple;
	bh=QdBWMUSn7gZXmXCHj2RcAdJODiJKBW/D4uMUKrPsQ9E=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=icnQrtTz8ReAfL0Mvp8geLptmagQY/ek9/zhXfZNnPKIgspRihurAOJpUz42K41VQ0IvLCI94bMPrXdaNoHXBLz0oU0yo2RKXEfXm/6SgGkavJ/jMoSBW7dHX1elJKbdjXAr88/WZC0K0U+2RhwGMPlvxOtYNvmnr5ZR+muAHEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hdazetS1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715004216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oa4YbBmlzkI63abCw2z4fEd9n5o3yLiXeNXHymLCUuE=;
	b=hdazetS1rh6Zk14lxWk+K3D7bTBbAyDxuxvav+EeuWJhbvBJeddS+KnjOKA65zFrsoMVUY
	+iRCSSI+1pEejgdHdJy1N2HzNGI2sv83gq5rjAyl+O9ttcTtfTDI4PraM8HTGsvgzg+2Tn
	qpfIc01/+e87uxRWJ8uKLPpGt+P/xcs=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-696-0I0r0MRkNdSAowhmkqHb3Q-1; Mon, 06 May 2024 10:01:52 -0400
X-MC-Unique: 0I0r0MRkNdSAowhmkqHb3Q-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-572ad77d634so666913a12.1
        for <linux-media@vger.kernel.org>; Mon, 06 May 2024 07:01:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715004104; x=1715608904;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oa4YbBmlzkI63abCw2z4fEd9n5o3yLiXeNXHymLCUuE=;
        b=EKnvvBmwZpGPx7UdYvmw3D3Ntcyx9ZfF+rzUJjgGyPZUqZUsZ60XUQXVEx5WThElz+
         hr9hLtocJt5laRjwIW7vdYVXjGcXlSuNljztXiBruFqwUeyfJlQuKdzE6HCl4PRl18fd
         7b6EowHi2qeqc1JWLp5UVR48qqg06yWJ8QgMqp1u42bFL/LOIETDJSVxMYxmruwP5tQA
         zF0qV66u1Csd4S/Yol91HGZIzhh5x/slLkihxnWGswCc9mpegZD3Kprcpblk80ULptP0
         348cVjMP3dUjuP6OePBGmOIPTAYrJwJXSYg72Vchkwsy6LZupErLX8NE6/9zV90Z1agT
         ab7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXFtEqF1sEylI8WXMx/XmSkwFJq5YtYxKfFcebDESMMFnn7VUfROz4up7rVymZ7EQK5W3PxfHc8Z/G46yif5IVGZFr4VC9mzNWkmzo=
X-Gm-Message-State: AOJu0YyDy9GgmZY6kn9GyWnbtsvs164WQQDEwiYrK25arCc+v5QCvUqt
	FXQ8/q8W7VN3p5FAmckm3TSJ5GD83YlZoXJgQeIXIGng0N8eBagmfG0xwtu6sCwe/orxF+FGovX
	ZiplrdSQQ/vX24Q2j27NAhmgXn8r+Pgp/wiun77hANBcrM7SPonHXFtQKb+BB
X-Received: by 2002:a50:9513:0:b0:570:5b70:3407 with SMTP id u19-20020a509513000000b005705b703407mr8444047eda.10.1715004104181;
        Mon, 06 May 2024 07:01:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqtTHezMetmGx7QkF/7UHxNmAFJAxewY94xyi4UnLpcMz8eE3WVuF2BLvBhkQkOqr8E1iw4Q==
X-Received: by 2002:a50:9513:0:b0:570:5b70:3407 with SMTP id u19-20020a509513000000b005705b703407mr8444031eda.10.1715004103794;
        Mon, 06 May 2024 07:01:43 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id z5-20020aa7c645000000b00572b0a44e42sm5224207edr.26.2024.05.06.07.01.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 May 2024 07:01:43 -0700 (PDT)
Message-ID: <cbe5a743-d8be-4b0e-99c4-e804fbadc099@redhat.com>
Date: Mon, 6 May 2024 16:01:42 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Safety of opening up /dev/dma_heap/* to physically present users
 (udev uaccess tag) ?
To: Maxime Ripard <mripard@redhat.com>, Sumit Semwal
 <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Lennart Poettering <mzxreary@0pointer.de>,
 Robert Mader <robert.mader@collabora.com>,
 Sebastien Bacher <sebastien.bacher@canonical.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linaro-mm-sig@lists.linaro.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Milan Zamazal <mzamazal@redhat.com>,
 Andrey Konovalov <andrey.konovalov.ynk@gmail.com>
References: <bb372250-e8b8-4458-bc99-dd8365b06991@redhat.com>
 <20240506-dazzling-nippy-rhino-eabccd@houat>
 <ZjjdUBYYKXJ1EPr5@phenom.ffwll.local>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZjjdUBYYKXJ1EPr5@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Sima,

On 5/6/24 3:38 PM, Daniel Vetter wrote:
> On Mon, May 06, 2024 at 02:05:12PM +0200, Maxime Ripard wrote:
>> Hi,
>>
>> On Mon, May 06, 2024 at 01:49:17PM GMT, Hans de Goede wrote:
>>> Hi dma-buf maintainers, et.al.,
>>>
>>> Various people have been working on making complex/MIPI cameras work OOTB
>>> with mainline Linux kernels and an opensource userspace stack.
>>>
>>> The generic solution adds a software ISP (for Debayering and 3A) to
>>> libcamera. Libcamera's API guarantees that buffers handed to applications
>>> using it are dma-bufs so that these can be passed to e.g. a video encoder.
>>>
>>> In order to meet this API guarantee the libcamera software ISP allocates
>>> dma-bufs from userspace through one of the /dev/dma_heap/* heaps. For
>>> the Fedora COPR repo for the PoC of this:
>>> https://hansdegoede.dreamwidth.org/28153.html
>>
>> For the record, we're also considering using them for ARM KMS devices,
>> so it would be better if the solution wasn't only considering v4l2
>> devices.
>>
>>> I have added a simple udev rule to give physically present users access
>>> to the dma_heap-s:
>>>
>>> KERNEL=="system", SUBSYSTEM=="dma_heap", TAG+="uaccess"
>>>
>>> (and on Rasperry Pi devices any users in the video group get access)
>>>
>>> This was just a quick fix for the PoC. Now that we are ready to move out
>>> of the PoC phase and start actually integrating this into distributions
>>> the question becomes if this is an acceptable solution; or if we need some
>>> other way to deal with this ?
>>>
>>> Specifically the question is if this will have any negative security
>>> implications? I can certainly see this being used to do some sort of
>>> denial of service attack on the system (1). This is especially true for
>>> the cma heap which generally speaking is a limited resource.
>>
>> There's plenty of other ways to exhaust CMA, like allocating too much
>> KMS or v4l2 buffers. I'm not sure we should consider dma-heaps
>> differently than those if it's part of our threat model.
> 
> So generally for an arm soc where your display needs cma, your render node
> doesn't. And user applications only have access to the later, while only
> the compositor gets a kms fd through logind. At least in drm aside from
> vc4 there's really no render driver that just gives you access to cma and
> allows you to exhaust that, you need to be a compositor with drm master
> access to the display.
> 
> Which means we're mostly protected against bad applications, and that's
> not a threat the "user physically sits in front of the machine accounts
> for", and which giving cma access to everyone would open up. And with
> flathub/snaps/... this is very much an issue.

I agree that bad applications are an issue, but not for the flathub / snaps
case. Flatpacks / snaps run sandboxed and don't have access to a full /dev
so those should not be able to open /dev/dma_heap/* independent of
the ACLs on /dev/dma_heap/*. The plan is for cameras using the
libcamera software ISP to always be accessed through pipewire and
the camera portal, so in this case pipewere is taking the place of
the compositor in your kms vs render node example.

So this reduces the problem to bad apps packaged by regular distributions
and if any of those misbehave the distros should fix that.

So I think that for the denial of service side allowing physical
present users (but not sandboxed apps running as those users) to
access /dev/dma_heap/* should be ok.

My bigger worry is if dma_heap (u)dma-bufs can be abused in other
ways then causing a denial of service.

I guess that the answer there is that causing other security issues
should not be possible ?

Regards,

Hans


