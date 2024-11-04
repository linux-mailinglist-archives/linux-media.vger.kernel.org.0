Return-Path: <linux-media+bounces-20815-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B3ABF9BBE3E
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 20:49:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E56A31C21BB9
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 19:49:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 575BE1CC899;
	Mon,  4 Nov 2024 19:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VIoOlnM2"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7081C57B2
	for <linux-media@vger.kernel.org>; Mon,  4 Nov 2024 19:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730749787; cv=none; b=cTWMWanYNQjhTalJrosMJ5Iwbtzedm1xp1tBiWaFFZf45NF6QJmiMa+ymhyNNR+yd5A5USxbcAu7rJlZ3WwpxHnDbWTAyCw+72z5F+ToHy4W/oRzMNk57YVSW3/2K1PT45n+oHvJG4NXSbMqxme3Ea/nSYszqPP7QNZBxvbHmes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730749787; c=relaxed/simple;
	bh=2xMoHUccuex6BD+I8AymLe/T4uB6caedJhQ5qfc8nnw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sjhXaxGdl05RoRcf2I8IALnrURoalNe8NYZiBsYk6T8CVTdDFrYpiNQgnxK1i+Q5Gj1uRLEfe/N05P7PhhYG0lwjEqJyc43LqAyuDHIvnkJRG0+c0gKr2qNUbostQapZHk/52pC4mlpw8NII2S55/+CLOeb2bE3oRUNIPOvJJ5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VIoOlnM2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730749784;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wsp1eWoS7ZQtj52VyYazYToI3Y/fHxU4U+KgaiVrrUI=;
	b=VIoOlnM2sIWIl06XAmmps+67ZrGqtZGRprVMMn65nALrJJTdrLYSkY5xhW2dSvH9Q7279m
	TjvcR01dV0wcr33uH9THzlR1nzO0vWKE0tHATJ7lZT/kxI8B+cvK5iVphM9SZeNpybiCHI
	C1OFakW48iubYBUPHyyMgMcFWBEKIYQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-ON1SNr3zML2P-1UYNdfNrQ-1; Mon, 04 Nov 2024 14:49:43 -0500
X-MC-Unique: ON1SNr3zML2P-1UYNdfNrQ-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4315cefda02so34103565e9.0
        for <linux-media@vger.kernel.org>; Mon, 04 Nov 2024 11:49:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730749782; x=1731354582;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wsp1eWoS7ZQtj52VyYazYToI3Y/fHxU4U+KgaiVrrUI=;
        b=Nc5buQXeR7iTbrdiKxRxFQKEs05TP1OrdFQm5ZfRmKaRj6+xzfBfmO8QivaI667cDW
         6Z8uYBW5SiauEx4lFOrMalOpxdZMP5iosmtimZlCSJZfEmVsvdGbLMIQgZ/68BWpvNM+
         I5TXo3r5hnItCtmblITtzJ4GblhBy8h6XpMCgATG2rbRJSgU3N00P49yQe9x2BCKJWx6
         16MS/CkvuGjCEAqRzHyMLVEjaZGRD51vseBswD2GnrlXDOVLDN7+rtVaCJJRcXIS9qcR
         snIt/0zRqxLOvOD/uD69FeGBUoi0t7MEOK0fvmzBFFMiwl7++6dzNXqtt3Aj2PAapzET
         y7ww==
X-Gm-Message-State: AOJu0Yx7IamNTuGPR4GFFNmaM0DIpQ20xuEx2i2UzltMFePy+Y+wKnqW
	ZsGxqk58DBs1fs1odu09iNOGSyVtZaHSnskwwwYA/h7jIV3RYcCnlmHVqDX7pFN6WV9i2VCkgFN
	6QQYvio6x72PJ92b8HzPV2IiPkzeIlvvXQFLTSsaBQ8td1aNNPQXucOHJemz0
X-Received: by 2002:a5d:59a4:0:b0:37e:f8a1:596e with SMTP id ffacd0b85a97d-381be7ad255mr15692812f8f.11.1730749781743;
        Mon, 04 Nov 2024 11:49:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEDgg4PHScqVGBaJ7EJ5o9t4vXsJ51fSJ+T/4s2+ayRGMAhT7chW8k6bV+sFlMT4mqaNk7ozQ==
X-Received: by 2002:a5d:59a4:0:b0:37e:f8a1:596e with SMTP id ffacd0b85a97d-381be7ad255mr15692792f8f.11.1730749781370;
        Mon, 04 Nov 2024 11:49:41 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb16d684asm23733566b.63.2024.11.04.11.49.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 11:49:40 -0800 (PST)
Message-ID: <85ad5ab4-924e-4431-84d1-4646b1e8cb83@redhat.com>
Date: Mon, 4 Nov 2024 20:49:40 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: UVC: Privacy gpio as subdevice
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, Yunke Cao <yunkec@chromium.org>
References: <CANiDSCuPfmV-0KLrdnvVojvtLR=OsFUzLNhnqM1m_ytvzjoNOw@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CANiDSCuPfmV-0KLrdnvVojvtLR=OsFUzLNhnqM1m_ytvzjoNOw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ricardo,

On 30-Oct-24 2:03 PM, Ricardo Ribalda wrote:
> Hi Hans (de Goede, but others are welcome as well :) )
> 
> Some notebooks have a button to disable the camera (not to be mistaken
> with the mechanical cover). This is a standard GPIO linked to the
> camera via the ACPI table.
> 
> 4 years ago we added support for this button in UVC via the Privacy control.
> This has two issues:
> - If the camera has its own privacy control, it will be masked
> - We need to power-up the camera to read the privacy control gpio.
> 
> We tried to fix the power-up issues implementing "granular power
> saving" but it has been more complicated than anticipated....
> 
> Last year, we proposed a patchset to implement the privacy gpio as a
> subdevice https://lore.kernel.org/linux-media/20230111-uvc_privacy_subdev-v1-0-f859ac9a01e3@chromium.org/
> 
> I think it is a pretty clean solution and makes sense to use a
> subdevice for something that is a sub device of the camera :).
> 
> Before moving forward, Laurent and I would like to hear your opinion.

Moving the GPIO handling + privacy ctrl to a subdev which can be kept
open without powering on the camera sounds like a good plan to me.

I have taken a quick look at the implementation from last year:
https://lore.kernel.org/linux-media/20230111-uvc_privacy_subdev-v1-0-f859ac9a01e3@chromium.org/

and that looks fine to me.

I am aware that you have posted a new version:
https://patchwork.linuxtv.org/project/linux-media/list/?series=13893

but I have not looked at that version yet and I don't know if / when
I will have time to help with reviewing that version.

Regards,

Hans



