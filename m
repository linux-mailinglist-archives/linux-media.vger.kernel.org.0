Return-Path: <linux-media+bounces-28203-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B09C1A60E96
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 11:17:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E6AD616F8A1
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 10:17:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 413AD1F30CC;
	Fri, 14 Mar 2025 10:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="T7mW0qTY"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A611EB5E2
	for <linux-media@vger.kernel.org>; Fri, 14 Mar 2025 10:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741947449; cv=none; b=BV0mJ3F3WZAJxYY5QTeO19BvMho2I8n0rldHMx5wm+88XKnrctLNUROD442E2IS/RsbZRpNdgxdNUJKzCgyzocNlqTR9mxnsxoRDN8CFzv9P77jclB/3l+fQQlFBMpnYccsTOitKsypvmmF6boW0o8NstSVBFsvderzf2uFTWdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741947449; c=relaxed/simple;
	bh=WJShYi3uzBPxMfiwMPO/vlx2NCWYfJ4rw6I6GHEIf+0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YsU0cXOq3Omkl08pFJojPNQopsPQzG98U34EHYNcDQOtIQkXR7pm4ItPu5mABs8V0ZeQYgKDh//qXyK7/vqKNDnc0HQFuUfcgiG9QhNcpWJybOxVlDGjii9ut9D11FENTx6x8R+a1tNEH11feynmQj8hD1OLpNlIYHEQLuC+fXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=T7mW0qTY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741947446;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9qM81z47M1flzx04sZcwvtWCfIXzApqLmp6+RxbT5OE=;
	b=T7mW0qTY5Pj2FQhypmgNi/ztgNuxsfx55SV1b36ge9iW/iK+ddni6O5I48/RYjDEMC2KPl
	tdlSdMGOGNuObe/AhISHl76tloIGSVhrGSWiOKsNysFYfp6st0w5nNg1kxe7R5AuQCUCZZ
	VZwXGrlVvcMKEiwtStAyW+u9IcXX6lE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-NmykBEU4MteO5-C0LwPvrA-1; Fri, 14 Mar 2025 06:17:25 -0400
X-MC-Unique: NmykBEU4MteO5-C0LwPvrA-1
X-Mimecast-MFC-AGG-ID: NmykBEU4MteO5-C0LwPvrA_1741947445
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5e623fe6aa2so2114968a12.2
        for <linux-media@vger.kernel.org>; Fri, 14 Mar 2025 03:17:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741947444; x=1742552244;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9qM81z47M1flzx04sZcwvtWCfIXzApqLmp6+RxbT5OE=;
        b=tvNW7g77T4dq5gm58w0VvoulQz5Bhm3sRX2D8L1fNjCwAH/qADT8ZomWv28BW+H29v
         86MXwSvyxmJ3kz4X7aZIzIOqdUX2NRVYTUQ73INf14TWQcZNgvsVe7edavSh1Yi59IPY
         K5lpzIiWvreFacbp/0lPUJeaTkiv/gXio+d27YQVaVqCuaVgRnBJD9ZILvOefl+G03/Q
         eKgqsuttEcA1HRn2QMtjFGNDOBWpsuZwKlkM3vKkx7k/RIIiAPdqDHZgU5tWvR4R29Gr
         iOb3MvWj5/YfGofXmBBP0Qua/y5Cnwwh84XSo+3tEiwmKEraDSdceHlOwgbkMlidpU5I
         aaNw==
X-Forwarded-Encrypted: i=1; AJvYcCVAj3j9LoJgF/uJwtvH3pqDogYCSbRtcWaNjiLitmA23iYFUzDvCoy9G9+kdlImOqaCyHneHz2fLLZbBg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLeUOXPZ6G/xtUjYq2SENPiVZOdClmPEcQHjBbHzYOt3EeYJ48
	pfs8pvEOFW18hXlr3F+lpeSXka+vrxunsEWqyHwVy563FROPgmMg2YkmXGtengOqdYjNPdjpZ4B
	AvgqmDlFWYaTrOVX5q7oRpDNyycaDaWRzANRYWORnBx576GXYpqqdCDXkBXr1wKvbh81y0Xg=
X-Gm-Gg: ASbGncsyTn0dmAnoS41OEJyIMkPcvB7jyEaawgsT9Nn2U6oGoW0lMSDWZBxccHGjXva
	wRHiF7XVRWf9EsaXwxl4jCVW9vKXgi90ZLnFO1lOkzjISK5hEngPG9vALUk07mO/fBunEiK82bd
	QlXJ6or0xYN3GqTlt/g6E6qJ4/A5dLKCIU9opfgoMYn5BfsSdl/0gZ5aolh6JC3sbiMSlH9PAan
	PdRVDDmD2BdbvDPy/V63nBwkowSnp5vEdE99DkX5Lc5QWmCp/CMFw8yXB0lYgNEUbk1wvT398J2
	/X4Pa+m9/5NhA8XRoEijlF3TCHmMzK8HhBJCGj37RGiiujmvLKcLJfgCrUZlsbI04r2yYsxt7V2
	c3UBB6+e8kUNpr4thEUFCSK2RyDrxdPcR/Kw3fgnwcVn+EDDRZfspseTxkS78vHUgKg==
X-Received: by 2002:a05:6402:5106:b0:5e5:e78a:c502 with SMTP id 4fb4d7f45d1cf-5e8a13dd5d1mr1714619a12.31.1741947443919;
        Fri, 14 Mar 2025 03:17:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBTB6/MQONiUZkJOO0AN7O5eeW4QJkq/EZnNlzJ+VMXIAvpLY7o+hVoX11luBEvnZY8/UWHw==
X-Received: by 2002:a05:6402:5106:b0:5e5:e78a:c502 with SMTP id 4fb4d7f45d1cf-5e8a13dd5d1mr1714593a12.31.1741947443405;
        Fri, 14 Mar 2025 03:17:23 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e81692e655sm1769056a12.10.2025.03.14.03.17.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 03:17:22 -0700 (PDT)
Message-ID: <1750aabb-6627-445b-9652-37e34881e687@redhat.com>
Date: Fri, 14 Mar 2025 11:17:22 +0100
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
 <b9bfb5f8-9e69-4e61-ae7c-20bb4f2c8d2b@redhat.com>
 <66e2d951ecb236007ffecf6f2218084173f8eb24.camel@redpill-linpro.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <66e2d951ecb236007ffecf6f2218084173f8eb24.camel@redpill-linpro.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 14-Mar-25 11:01 AM, Ingvar Hagelund wrote:
> fr., 14.03.2025 kl. 10.43 +0100, skrev Hans de Goede:
>>
>> One more testing request, can you run qcam and
>> then see what it reports for FPS after letting it run for
>> a couple of seconds ?
>>
>> And then report the FPS back here ?
> 
> Sure
> 
> It stabilizes at 30 fps (wandering a bit between 30.00 and 30.02 fps).

Great, thank you. That means everything is working as
it should (I had some doubts about 1 of the timing related
register values used by the driver).

> Also, here is the output of cam -l and modinfo.
> 
> I observe that cam says 
> 
> Configuration file 'ov02c10.yaml' not found for IPA module 'simple',
> falling back to 'uncalibrated.yaml'
>
> Should this file exist, or will the driver downloaded from the settings
> from the device, making the configuration file superflous?

There is a bunch of low hanging fruit wrt image quality which we
need to address in libcamera which should help improve things
without needing per sensor calibration. But for the best quality
ideally we would have per sensor / camera module calibration
profiles for certain things. There still is a long road to go
before we will even start looking into that though.

Regards,

Hans




