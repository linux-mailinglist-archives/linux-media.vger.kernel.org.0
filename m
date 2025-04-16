Return-Path: <linux-media+bounces-30321-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F673A8B768
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 13:09:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 85F07189ED85
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 11:09:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1662D24169E;
	Wed, 16 Apr 2025 11:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z515C419"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9CD3238179
	for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 11:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744801679; cv=none; b=uq8seTSsPgFNSnmQX6pMNbxqhXNwGu+gQlOQY0mXlXI56dj/KxevwPtxZt1lhEeFndHVYceHzoxtQbOpJQFc1kvLXHW1lbxp7gdkWVBgVVZs8Am4F2LpP2wZCSQNStAhLEXs+0o/bnLwx0xWQFfDCdpP+HqL/NDbh5KfeiN5b6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744801679; c=relaxed/simple;
	bh=PgBHfqwjPWjxXqgNl9JxQSBiBEuDTyKbJgrMsIvxSA4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SswMEm0lB/qHYO2QG6HDxpb0rXw6IYm3UydCketpB1ZIfRYwS5IJHhKD7TdMFiyrK6CXB18MGAniTTE5VEP120T4V7i9K3uDFxx7YcKGYNXwXq8386C9IiUdbjeQcTrgO7xREW6eChlN8XQyzRSoqdiJqJs70VMXbS04s7JzdIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z515C419; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744801676;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+ICtvPrm4Z+eNfHe3WDJwHaa3KQJJtYZVIANRAdT0i0=;
	b=Z515C419oQJ0YaIR0mUPHzbOH/zi+aOXTJTz6gCvV1ZtlAkrds03JUBubwG3wvFii7B67l
	9gCwkF8Z26KUz/Py+UBctmh1kj6teUnXp+MND5CHVpGdBKezFf1ZDaeHV9SNhtGXngj7cJ
	I0XYRHWXxpqeTz7DaAmqyvBProGRePw=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-363-QXLjMr6rPG6cKUd-xV9hvg-1; Wed, 16 Apr 2025 07:06:28 -0400
X-MC-Unique: QXLjMr6rPG6cKUd-xV9hvg-1
X-Mimecast-MFC-AGG-ID: QXLjMr6rPG6cKUd-xV9hvg_1744801588
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ac3db5469fbso596936466b.0
        for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 04:06:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744801587; x=1745406387;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+ICtvPrm4Z+eNfHe3WDJwHaa3KQJJtYZVIANRAdT0i0=;
        b=odQOMDO3QOf2Ae7ew4ewLOvqcSH0O7mnmlxyv+qxBBCttT3IfLDwoxLbPd3qRc5e6C
         nzBByk1gXY20AKwCfVQIIOLWsx5EGrugUY2fY1vUSa/JgU9qu+4cfsdcKVGkgy2PFB+J
         on5x8fvAmdeS2xf8eh9cGzZAOTnypBZ9pX/4fz8FTPlJ6ZzC4QiG274rSONRZCwzKFeD
         TEZY8D6TLX+vRXTPyGcvpsVFbpUVaNXft4xOePo+snVf6X86I60dI4WoKdkKpN7rzNBf
         dtW49vr0qHbjAnMs3Zh8A3k8NpqCdNUKaHX0RRfteR3BQgLGq3Bkk9bA+ZCVOTN+Lauf
         ozeg==
X-Forwarded-Encrypted: i=1; AJvYcCXD08v0juq4UNuK9q5kbgZs3jcs7ihxC5BnVlao+8LASurNCENRhqijAHYJVGqaVIuWrk/3V+XbIkXlZg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc1FZFMGT/MW1NAFiJtKBllvnKJE8UG6TjIuowKBB8+tQ4EA2X
	jsMkLZBsEk+BbmxiF3F+WyjsOblQca+9Bd1kNxwAt5nra8j47CYMnq73r4EKLzYrRFBEGMaYihf
	yba2h2+klAOT/om/UsY3qHze0BM1R5hTnyjAd+A6d5eSVq5fT2vhhEzq2IOOC
X-Gm-Gg: ASbGncvR79gSuIc41hYEpAy0YskKC+QUVR4KfdJ3lYAMTvVeHfz1JXTuqTmV5HdVlqw
	EP7e2HA5KYDHtbSZcsUhumM62GEvVVdAyFVPEz/boIuXZAyT1A3L4t18/uX6qqVdeOTFErfaywU
	0zvi+Jv+8qZIGkQ16Dkt9/0nkXs7qiYMIrvH6SqEog2e8g/9UcE1sJ6K2Q5c+tZNhRTU0rJ5QT4
	+vIerChbI7+i1GN7tsY8V88fTfqUQQrtFdpYIu+XWIboMqLBerBgr3Fm+g62JPVPqKqZNdgeXF0
	/DOO8+uSROL9yFptKwKGBXEbs3Y74LepdKtTnkE1QeUFjuGN++EF49MFVbg6KXweaV+mlfSiWVB
	66a6JgjCO1ahQok/6SGMTtQuAoAmNgOUAYZBRvqLaIVgZ+SMA1xjkNYxcO5hmpw==
X-Received: by 2002:a17:907:9495:b0:ac6:b639:5a1c with SMTP id a640c23a62f3a-acb4295ef50mr128431566b.22.1744801587529;
        Wed, 16 Apr 2025 04:06:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDoA8nzEZcTIq2jQTVVOvwP/uVf4iahJU3ebbXBX/F5D0KOMNh9b8oADhsz31b3PddVNCXzQ==
X-Received: by 2002:a17:907:9495:b0:ac6:b639:5a1c with SMTP id a640c23a62f3a-acb4295ef50mr128429166b.22.1744801587124;
        Wed, 16 Apr 2025 04:06:27 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3d128c9esm106609066b.108.2025.04.16.04.06.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 04:06:26 -0700 (PDT)
Message-ID: <cb7b67c0-e68c-408c-a0aa-c6a862590c52@redhat.com>
Date: Wed, 16 Apr 2025 13:06:25 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/9] platform/x86: int3472: Add handshake pin support
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Dan Scally <djrscally@gmail.com>,
 Alan Stern <stern@rowland.harvard.edu>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Hao Yao <hao.yao@intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>, Duane <duanek@chorus.net>,
 platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
References: <20250402202510.432888-1-hdegoede@redhat.com>
 <20250402202510.432888-9-hdegoede@redhat.com>
 <CAHp75VcJcPAEi2dhVnOL6Um78VEwT9DsvC+h20ZHZ0kdoPH--Q@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VcJcPAEi2dhVnOL6Um78VEwT9DsvC+h20ZHZ0kdoPH--Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andy,

Thank you for all the reviews.

On 2-Apr-25 10:56 PM, Andy Shevchenko wrote:
> On Wed, Apr 2, 2025 at 11:25 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> New Intel Meteor Lake based laptops with IPU6 cameras have a new type 0x12
>> pin defined in the INT3472 sensor companion device which describes
>> the sensor's GPIOs.
>>
>> This pin is primarily used on designs with a Lattice FPGA chip which is
>> capable of running the sensor independently of the main CPU for features
>> like presence detection. This pin needs to be driven high to make the FPGA
>> run the power-on sequence of the sensor. After driving the pin high
> 
> high,
> 
> (note comma) ?
> 
>> the FPGA "firmware" needs 25ms to comlpete the power-on sequence.
> 
> complete
> 
>> Add support for this modelling the handshake pin as a GPIO driven "dvdd"
>> regulator with a 25 ms enable time. This model was chosen because:
>>
>> 1. Sensor chips don't have a handshake pin, so we need to abstract this
>>    in some way which does not require modification to the sensor drivers,
>>    sensor drivers using the bulk-regulator API to get avdd + vddio + dvdd
>>    is normal. So this will work to get the right value set to the handshake
>>    pin without requiring sensor driver modifications.
>>
>> 2. Sensors typically wait only a small time for the sensor to power-on
>>    after de-asserting reset. Not the 25ms the Lattice chip requires.
>>    Using the regulator framework's enable_time allows hiding the need for
>>    this delay from the sensor drivers.
> 
> ...
> 
>>                         if (ret)
>>                                 err_msg = "Failed to map regulator to sensor\n";
>>
>> +                       break;
>> +               case INT3472_GPIO_TYPE_HANDSHAKE:
>> +                       /* Setups using a handshake pin need 25 ms enable delay */
>> +                       ret = skl_int3472_register_regulator(int3472, gpio,
>> +                                                            25 * USEC_PER_MSEC,
>> +                                                            con_id, NULL);
>> +                       if (ret)
>> +                               err_msg = "Failed to map regulator to sensor\n";
> 
> A copy and paste mistake? Yes, I know that they are both represented
> as regulators, but don't we want a bit of uniqueness in the messages?

I actually did this on purpose to allow the compiler to use a single string
for these saving some space. The difference of which case we hit should be clear
from the earlier printed (dbg) message printed above the switch-case.

As for all your other remarks I agree and I'll fix them for v3.

Regards,

Hans





