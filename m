Return-Path: <linux-media+bounces-3333-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E9582712A
	for <lists+linux-media@lfdr.de>; Mon,  8 Jan 2024 15:24:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 624D61F223C4
	for <lists+linux-media@lfdr.de>; Mon,  8 Jan 2024 14:24:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9222646450;
	Mon,  8 Jan 2024 14:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X7QlXZl0"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6350405C7
	for <linux-media@vger.kernel.org>; Mon,  8 Jan 2024 14:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704723843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h+j/g0WNmi+8bzdvbYn8Jywjv5WoaXcFLuhYwob2Lpg=;
	b=X7QlXZl02ui0S2FfYerJL62pUlZvlaieCw87iIes2PwXF4QPJBVnt6zqZP6uqPe5nQyQjY
	k1AnaZbgpnqph9lHEjV6BB+uCGWbYD1oHk19XETUu8hGYbBYJgqZvPCqmvoOyOLb/k4CJ7
	/D62tIUENlJvzlbih/GQM3LJMqw3v90=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-loZB7tKZPmiL1k6tlWk82w-1; Mon, 08 Jan 2024 09:24:02 -0500
X-MC-Unique: loZB7tKZPmiL1k6tlWk82w-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a2336591d48so85403566b.3
        for <linux-media@vger.kernel.org>; Mon, 08 Jan 2024 06:24:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704723841; x=1705328641;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h+j/g0WNmi+8bzdvbYn8Jywjv5WoaXcFLuhYwob2Lpg=;
        b=BbRshZn7OOf0cBLP60lgkCw6PlkBoiI3CkGjhC/SXGdXzJg0gBmLcJ3Eusn/PI+a30
         Ac8hubET40DiCJlwyGN9vTT8W8Bs6XdtJr7etxYJWamJDjnXoaFh6lh3y04OW7gH3XWo
         HQcsge5T2HzkLGAggcVkmjgci5LQ5y0aBFtCyc720v01gE1eJZOjRuhBHBH7tigptSP5
         8ULaqbaR6BdyfboEAZc1u0KePJfG23G5QzBhLvVWlt92Ans9blr18UH9qSf0lw9yYhRA
         AJCWdYO/dfAtdpw6n4jaJaKQhaUqoLWFBjewWjQLMz+OxlDLAzCVnZCInfTzTHclTCYA
         LEig==
X-Gm-Message-State: AOJu0YwKN/001IV9C3f4rWhOQh6B01DhyrZUsCSjKF8JwRt66EmLJWHs
	ub8xJVeMSGUw6vjqDOhg6Dkw0ICQJL0BePcm0ly72DL0gx+DyWBIFy55xXDiZOGp/xnCl3lbS4j
	cI/4iYCBBEhmLniaNCJR2Y036Y+kcyeDhe3XSohE=
X-Received: by 2002:a17:906:2a0e:b0:a27:c8da:a0f9 with SMTP id j14-20020a1709062a0e00b00a27c8daa0f9mr1378560eje.153.1704723840667;
        Mon, 08 Jan 2024 06:24:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFn7OGpqxNri/6QBVEcV109wAMPhe4lGohbNmlCi6tDu10DZdrpFmqpmiDW5U3Vw81uCcKzaA==
X-Received: by 2002:a17:906:2a0e:b0:a27:c8da:a0f9 with SMTP id j14-20020a1709062a0e00b00a27c8daa0f9mr1378550eje.153.1704723840503;
        Mon, 08 Jan 2024 06:24:00 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id g21-20020a17090613d500b00a289d772555sm3949670ejc.66.2024.01.08.06.23.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jan 2024 06:23:59 -0800 (PST)
Message-ID: <445d7cbf-8d68-4b55-a252-7187973d63c4@redhat.com>
Date: Mon, 8 Jan 2024 15:23:59 +0100
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
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <2d3a85fe-dfb9-52e1-fe1b-e0b9a5ac14ab@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Bingbu,

On 1/8/24 05:07, Bingbu Cao wrote:
> Hans,
> 
> On 11/8/23 7:59 PM, Hans de Goede wrote:
>> Hi Bingbu,
>>
>> On 10/24/23 13:29, bingbu.cao@intel.com wrote:
>>> From: Bingbu Cao <bingbu.cao@intel.com>
>>>
>>> This patch series adds a driver for Intel IPU6 input system.
>>> IPU6 is the sixth generation of Imaging Processing Unit, it is a PCI
>>> device which can be found in some Intel Client Platforms. User can use
>>> IPU6 to capture images from MIPI camera sensors.
>>>
>>> IPU6 has its own firmware which exposes ABIs to driver, and communicates
>>> with CSE to do firmware authentication. IPU6 has its MMU hardware, so
>>> the driver sets up a page table to allow IPU6 DMA to access the system
>>> memory.
>>>
>>> IPU6 input system driver uses MC and V4L2 sub-device APIs besides V4L2.
>>
>> I have been testing this on a TigerLake system, a Dell Latitude 9420
>> with ov01a1s and the packed 10 bit bayer pixel fmt: V4L2_PIX_FMT_SGRBG10P,
>> which libcamera together with (WIP) software debayer support picks
>> by default does not work. There are many many CSI errors in dmesg
>> and only the first 10 or so lines of the image show.
>>
>> Disabling the packed format by removing it from ipu6_isys_pfmts[],
>> making libcamera pick the unpacked (every 10 bits per pixel data
>> stored in a 16 bit word in output buffer) fixes this.
>>
>> Are the packed bayer formats supposed to work on Tiger Lake, or
>> is this a known issue which Intel's own userspace stack avoids
>> by always picking the unpacked format ?
> 
> I just tested the packed bayer on my device (ov01a10) and did not
> observe the problems like yours, could you share the isys kernel log?

Was this on a device with a Tiger Lake CPU / plain ipu6 (not ipu6ep) ?

Regards,

Hans


