Return-Path: <linux-media+bounces-3705-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DEC82D9D4
	for <lists+linux-media@lfdr.de>; Mon, 15 Jan 2024 14:15:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B9BC3282454
	for <lists+linux-media@lfdr.de>; Mon, 15 Jan 2024 13:15:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2459E17753;
	Mon, 15 Jan 2024 13:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZZBHtDvm"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82DA1775B
	for <linux-media@vger.kernel.org>; Mon, 15 Jan 2024 13:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705324411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3lBk+ITzmoqesP6AiHGBLUszdA/y/H+B4Xp6H9TjJnU=;
	b=ZZBHtDvmmaTt4xY8hojVvnh4ofDSiqt5Qqp8CDrGGG+q5skgGUL4vXYCGTCveC2/MSmPZK
	PrrO3UmOxNcqb/2a5V/AWMETjxe3LaR5x/7/78XfZSiO0hRI9uLqZUExjNK3KfxAVI8x7m
	WGpho66+zcgLMEOTZSaFCQGD2kx9y2M=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-496-6uvvPy4GPOKUINNWd5fwUw-1; Mon, 15 Jan 2024 08:13:25 -0500
X-MC-Unique: 6uvvPy4GPOKUINNWd5fwUw-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a2b047e8f9fso352928466b.1
        for <linux-media@vger.kernel.org>; Mon, 15 Jan 2024 05:13:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705324404; x=1705929204;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3lBk+ITzmoqesP6AiHGBLUszdA/y/H+B4Xp6H9TjJnU=;
        b=kTWN1/cPQOJGflK41EN9sPkaA9dU3pHcIFU/lVuT/xEM/CUcH6Z4IXWkUYrfzQeLBi
         vsT+BoYyq+BBgoLtUSITC7HhB0W4070U3vxzLn/e30fauD0I3ovBcig8yFBeRdKqyW1Y
         fLxykLSr4cssWXYarbz+I434drBjxXDeLgJ+Q8g+d1timFBE4IWeG7PdphxlguFP/R8+
         l+fuAp61zQkvYdbequUJpe9FBd6MRUMgJH/HOGLlqWXyC0IcFpxXzc1pEusgi+CBtCjg
         Pg/PU8scWYIDg68lJi2es34N++RURetIlm2xQ7cpmwfA4rTx3iRRUBwDMhZ+Dqo8/rxj
         rh2g==
X-Gm-Message-State: AOJu0Yw7yXIaHOhW4NG0BFhiIyCfDO6qmAF53P5OTnWaVYsUwJpFpH3i
	HurbrbnnXUP6+ZqT6krYykCsK98NMdn9rOXXixaU4HmfBvV4Ju962cxHGcGKStTfJJcVUP4uevr
	SZKsbJaedFy8tP11sVXeCxg41OahuPWc=
X-Received: by 2002:a17:906:260d:b0:a2c:72e4:efb1 with SMTP id h13-20020a170906260d00b00a2c72e4efb1mr2334664ejc.139.1705324404223;
        Mon, 15 Jan 2024 05:13:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFK+bh7g3TTDqFUaWLhIJ6jY8dbjrCIQ332xPcya53dKtvuCmSd7SHw9vpOusNX3OJCStQOHw==
X-Received: by 2002:a17:906:260d:b0:a2c:72e4:efb1 with SMTP id h13-20020a170906260d00b00a2c72e4efb1mr2334658ejc.139.1705324403882;
        Mon, 15 Jan 2024 05:13:23 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id vs5-20020a170907a58500b00a2cbbebedc1sm4181291ejc.53.2024.01.15.05.13.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jan 2024 05:13:23 -0800 (PST)
Message-ID: <66b2d608-b08b-4d9c-b147-7c0d8a6910bc@redhat.com>
Date: Mon, 15 Jan 2024 14:13:20 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/15] Intel IPU6 and IPU6 input system drivers
Content-Language: en-US
To: Bingbu Cao <bingbu.cao@linux.intel.com>, Hans de Goede <hans@hansg.org>,
 bingbu.cao@intel.com, linux-media@vger.kernel.org,
 sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com
Cc: andriy.shevchenko@linux.intel.com, ilpo.jarvinen@linux.intel.com,
 andreaskleist@gmail.com, claus.stovgaard@gmail.com, tfiga@chromium.org,
 senozhatsky@chromium.org, tomi.valkeinen@ideasonboard.com,
 tian.shu.qiu@intel.com, hongju.wang@intel.com
References: <20231024112924.3934228-1-bingbu.cao@intel.com>
 <e1b060be-793f-4482-b0dc-670984bbbd84@hansg.org>
 <2d3a85fe-dfb9-52e1-fe1b-e0b9a5ac14ab@linux.intel.com>
 <445d7cbf-8d68-4b55-a252-7187973d63c4@redhat.com>
 <d554d5e2-d586-1bf8-b11c-bcd32fa01ab4@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <d554d5e2-d586-1bf8-b11c-bcd32fa01ab4@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Bingbu,

On 1/9/24 04:51, Bingbu Cao wrote:
> 
> Hans,
> 
> On 1/8/24 10:23 PM, Hans de Goede wrote:
>> Hi Bingbu,
>>
>> On 1/8/24 05:07, Bingbu Cao wrote:
>>> Hans,
>>>
>>> On 11/8/23 7:59 PM, Hans de Goede wrote:
>>>> Hi Bingbu,
>>>>
>>>> On 10/24/23 13:29, bingbu.cao@intel.com wrote:
>>>>> From: Bingbu Cao <bingbu.cao@intel.com>
>>>>>
>>>>> This patch series adds a driver for Intel IPU6 input system.
>>>>> IPU6 is the sixth generation of Imaging Processing Unit, it is a PCI
>>>>> device which can be found in some Intel Client Platforms. User can use
>>>>> IPU6 to capture images from MIPI camera sensors.
>>>>>
>>>>> IPU6 has its own firmware which exposes ABIs to driver, and communicates
>>>>> with CSE to do firmware authentication. IPU6 has its MMU hardware, so
>>>>> the driver sets up a page table to allow IPU6 DMA to access the system
>>>>> memory.
>>>>>
>>>>> IPU6 input system driver uses MC and V4L2 sub-device APIs besides V4L2.
>>>>
>>>> I have been testing this on a TigerLake system, a Dell Latitude 9420
>>>> with ov01a1s and the packed 10 bit bayer pixel fmt: V4L2_PIX_FMT_SGRBG10P,
>>>> which libcamera together with (WIP) software debayer support picks
>>>> by default does not work. There are many many CSI errors in dmesg
>>>> and only the first 10 or so lines of the image show.
>>>>
>>>> Disabling the packed format by removing it from ipu6_isys_pfmts[],
>>>> making libcamera pick the unpacked (every 10 bits per pixel data
>>>> stored in a 16 bit word in output buffer) fixes this.
>>>>
>>>> Are the packed bayer formats supposed to work on Tiger Lake, or
>>>> is this a known issue which Intel's own userspace stack avoids
>>>> by always picking the unpacked format ?
>>>
>>> I just tested the packed bayer on my device (ov01a10) and did not
>>> observe the problems like yours, could you share the isys kernel log?
>>
>> Was this on a device with a Tiger Lake CPU / plain ipu6 (not ipu6ep) ?
> 
> Sorry, it's ipu6ep.
> 
> I have no TigerLake so far.
> The difference between ipu6 and ipu6ep is the MIPI CSI-2 D-PHY. But it
> should not have no impact on the packed format.
> 
> Could you share the debug log on TigerLake?

I don't have access to the machine atm, but I should get it back
in 2 weeks from now. I'll email you debug logs then.

Regards,

Hans


