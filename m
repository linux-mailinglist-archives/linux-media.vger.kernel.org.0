Return-Path: <linux-media+bounces-30439-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6D5A919E4
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 12:56:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E726443D8A
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 10:56:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA72A22DFBF;
	Thu, 17 Apr 2025 10:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZpDpRsaz"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8EC1DE3C8
	for <linux-media@vger.kernel.org>; Thu, 17 Apr 2025 10:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744887401; cv=none; b=nSGG7XkDLTs7SaoO7prXSZj5eIXgImLvvMB9X4aEoseKrUxpSYNN3qxssBIJmyDaTea+vXcQuxhGzO/CrLPhSwOaON6OhNGRiLJNgRL2FCOeykFq1ui+wbUAd5hDU+/kqRpFc7F8weIskNBjqQynmS/G0bshko3vairNebgQU0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744887401; c=relaxed/simple;
	bh=OCmUAMA/YPG4/piPLikliDWqIc+OBinUCTsW1Z00VPs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iMCWBofId0w2327yHS6Egs+kFI74hhN3/FDxb0CnFO6tNleiRpZh0PRj7ROJgkh1ci8nxU7TrzwchrrSEGpqXb+bCDJNhPLFp+uhPTZQpmV39dBdMshirgZ3p5kkWebWlyPuoU6qeCe7oEJL9EefaPi/uIb6fTDA93vk1ZFSjNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZpDpRsaz; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744887397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OL4LXzPm34hXOvIhRoRU6GuEFCM/KQvC81H1MT67IUk=;
	b=ZpDpRsaz1bL/fEvIXDm2go+bQ9Ur8BlJkBypJ+waYX/GVBAz/yh7dHRw9I5HnytNf3HS9Y
	oh8tsMe9izDUHlqWo7dGY4vI14kpBHkWKpgepbb59WWpKDd2GUrcXcKY8wdNCIj5ZYSvU7
	o44A0I0+rFUhdKOtQKCoFNkZmSXG+nE=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-M2sUqIGbNoqL2arURCqspQ-1; Thu, 17 Apr 2025 06:56:35 -0400
X-MC-Unique: M2sUqIGbNoqL2arURCqspQ-1
X-Mimecast-MFC-AGG-ID: M2sUqIGbNoqL2arURCqspQ_1744887395
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-ab397fff5a3so64528666b.1
        for <linux-media@vger.kernel.org>; Thu, 17 Apr 2025 03:56:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744887394; x=1745492194;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OL4LXzPm34hXOvIhRoRU6GuEFCM/KQvC81H1MT67IUk=;
        b=sHCgf4MRy9kOQhZZhwH8O0dZIT0HTvctZRzDwDPFLt7ICnOIlzkYuSi9RCSRyKu1bW
         6zjXIfKD3Prl9hk9VYpzI6dluIAoSBSaLLMHWzoypbPWd9jDqFmAhpfKlrQX5rFDPLhm
         kXBBAervWe+i1bDTFOZcDCk1IbYo3YOwlY/1/4twvnCNE3bHCmifWaJLeEAPkV8/Gh/T
         nA593IA9wgvPXGhulWDIoz70RwCNpSPk7eGfVicbougqO7dm9ilA3r4knoPARO3ohYkI
         OK8hAeGu9ddVT8FGrF1DKJt1xtrcn7XXTNCBqsBT70slVdyLOaU2fnK0aML1a5NlEUth
         Dp6w==
X-Forwarded-Encrypted: i=1; AJvYcCXzBkh/4iP/9DuUkseTQwIIXYZlKDe6fn9VGRmNGB9+buF/0LGSVxYTY4oGoEibBVBL7LG/46zMAtCR1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXeCGXWHO4h41/6+Stfl+bLEohmJIif9liX8EGs/ngvOZU1j1E
	Xeg/jOxEN0BW3R7O04tNC51/ve9mbln2xr0Z+SPKCva9QiZZ5roYq30zcn9Sbc/KrDCsB4wkHJ4
	lBZaA4yevqs5dbSRS+MQBfL4V1/dkMukutS1J3nbDP4rh1Teuar81hhmMBVaD
X-Gm-Gg: ASbGncv3/tpL6Qmd+k2OUntFz+6wY2Wj+FaePqOJOB9nHHEzNuILd1lPpnunXboD8C+
	PlzfKWmqsImvsuUdsFs3zA4gO0GjyoDg6RBxOpubyqixSEMuve7jOFLnxoQeTlpzrVdKwzLkCyV
	IijW+5WnKBq8UA1FTsjynVZFzShdHBS5FRb4JWHX49RmZ53PJSgDpA2C/HNDSqU0lSWZgirA/w9
	ezH3OrxvccuRr11Hu8welPrN3WBHe6tIvBGn2ImSEWMTgHuadWtXbZsIbhQRdcn4IwhvKZf9zsu
	c0bkUQ5fIgb3EDfjHkcYtrfJSu/4DIeX/jgq9yQBPrYGqtKo09HNm80c99jwW/Qhn5Ll6zNtjUq
	LyCH8v7s+j73yMA2OaGeeDk9W/xj6sMy8p2GmCsLKZqOMT4smrGkfGt2oTlErqg==
X-Received: by 2002:a17:906:c14a:b0:abf:48df:bf07 with SMTP id a640c23a62f3a-acb5a0f3217mr166983366b.15.1744887394563;
        Thu, 17 Apr 2025 03:56:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmXTLIs/C0jJL0/J6bYVdeeI9w2VhQAAKyxIIwhTpF7usa+7Gx9STkCC5W2ZRIwAo0FesEkQ==
X-Received: by 2002:a17:906:c14a:b0:abf:48df:bf07 with SMTP id a640c23a62f3a-acb5a0f3217mr166981566b.15.1744887394189;
        Thu, 17 Apr 2025 03:56:34 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3d1ab3ecsm271784266b.131.2025.04.17.03.56.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 03:56:33 -0700 (PDT)
Message-ID: <b019b2c4-0c2e-4ba2-bfa3-83fab7fd415f@redhat.com>
Date: Thu, 17 Apr 2025 12:56:32 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/9] platform/x86: int3472: Add handshake pin support
To: Andy Shevchenko <andy@kernel.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Dan Scally <djrscally@gmail.com>, Alan Stern <stern@rowland.harvard.edu>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Hao Yao <hao.yao@intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>, Duane <duanek@chorus.net>,
 platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
References: <20250416124037.90508-1-hdegoede@redhat.com>
 <20250416124037.90508-9-hdegoede@redhat.com>
 <Z__z_G21Ro2jGDkP@smile.fi.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Z__z_G21Ro2jGDkP@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andy,

On 16-Apr-25 8:16 PM, Andy Shevchenko wrote:
> On Wed, Apr 16, 2025 at 02:40:36PM +0200, Hans de Goede wrote:
>> New Intel Meteor Lake based laptops with IPU6 cameras have a new type 0x12
>> pin defined in the INT3472 sensor companion device which describes
>> the sensor's GPIOs.
>>
>> This pin is primarily used on designs with a Lattice FPGA chip which is
>> capable of running the sensor independently of the main CPU for features
>> like presence detection. This pin needs to be driven high to make the FPGA
>> run the power-on sequence of the sensor. After driving the pin high,
>> the FPGA "firmware" needs 25ms to complete the power-on sequence.
>>
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
>>  			if (ret)
>>  				err_msg = "Failed to map regulator to sensor\n";
>>  
>> +			break;
> 
>> +			if (ret)
>> +				err_msg = "Failed to map regulator to sensor\n";
>> +
>>  			break;
> 
> As discussed this might be changed to have the same format string with supplied
> name as a parameter.

That does not work well, since this just stores a string to pass to
dev_err_probe() later.

So instead I've just gone with 2 unique errors for v4.

> 
> Reviewed-by: Andy Shevchenko <andy@kernel.org>

Thank you.

Regards,

Hans




