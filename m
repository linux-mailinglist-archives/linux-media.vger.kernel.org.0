Return-Path: <linux-media+bounces-25204-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE60A1A521
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 14:37:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7764616A059
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 13:37:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD2A520F98E;
	Thu, 23 Jan 2025 13:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KiCEYRgE"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A9C320B
	for <linux-media@vger.kernel.org>; Thu, 23 Jan 2025 13:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737639433; cv=none; b=eoMjSr24YDU3NylW30uI1Hj8HVMAuok/ctjM7xEf1y3MwG0rpeE3b8wtuNVYSToIpM43p/++4TJ7HxhE4Jz8OCWKBMc1bsWSsTSOi2NpjpqXlXucMT+TPI408aFnlNUSlM9TWLsnCNnc78eq2qlQ6i4aOf0XjBnY7CvfSVueTpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737639433; c=relaxed/simple;
	bh=NOT055cwEg1QbuqgHvDilpED9o7SoWzt0s4LipQ9IqI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YGpjoyoPvCgpYGFzwnKVgPlvjEw+lYuzFE4dw1ZhFlVmPnFFKwkDzV5J6iaMiSZYka7yJHvmB1DGaq30h2uHTaPEH8dAZdVLr/HjOUtldMvG0YUOkbBlwdr6ewbJ0RLcJEfK7mW897RjO7svOig2Qvd35z3Wyr00jRejbsqIHXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KiCEYRgE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737639429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OQOul09Cztgd6QCo67y0M/CAweUIVpGf19UAkpGM7XA=;
	b=KiCEYRgEx3FyvTKZvOGzP8TucdiD8BIixatEBIRB30fArJJfbwRU6frOUUb77GzB1BX2jr
	tAt9dLTK3Q7Xde0o4OiL/pKh9KGZadvtuL9lMkrQsAUNSEfpgDcpb09A6fsIHPnxlWXlEi
	tTIURM762lj8JA8x+SGj/621upxq/cw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664-jBQpzED1MnC587swaidrxQ-1; Thu, 23 Jan 2025 08:37:08 -0500
X-MC-Unique: jBQpzED1MnC587swaidrxQ-1
X-Mimecast-MFC-AGG-ID: jBQpzED1MnC587swaidrxQ
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-38bf4913669so465028f8f.2
        for <linux-media@vger.kernel.org>; Thu, 23 Jan 2025 05:37:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737639426; x=1738244226;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OQOul09Cztgd6QCo67y0M/CAweUIVpGf19UAkpGM7XA=;
        b=C3qjpwZn9Qb8sqCV6sz8Nllr6TvwtsG9oAmf9DeF6D4BGT4bfu0QEiWgOwirDaDPSd
         Jh7vJJNA1PUkiM+gE5OaWKolcueF0Nc6nmt93pHFVl/rn1JP6FkCi3FfGIheQ4ZPM2KU
         blOdMQ6rR2PkS5RFicPIZDN5WcWgfqA0AIzsQKxzd+gF0Vtkp3jg/lT/R0G+s55+rjOB
         pNdAxiRGHC6/o2YUtVs6gYPhfQJm3uvl4wpZLu+mTZJYl6IWG3Ib1G3bqqrIT3xmP3BL
         NnZ0STMDGBB8CQToCpZhjRqIdQ6qt9t5EzoAh2nHcMU340I8N8/ppauvrFJQ6wLtE2kJ
         JoKw==
X-Forwarded-Encrypted: i=1; AJvYcCXPQU+Y4QP3RhDIAit9x4jdK2VcEpGhq610JqjBslZwSKC01Sm/ObdEK44OgHp8kznrzJmw2Jo/1eHD7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPNw2xOskIER4DAv6IImYgEPeRLRdsRf61aomGlkdfjYRjn82O
	NLnWp8Y9g8nKZlPIY7FVgnHpv9gP+9ClUQiaDIYQVYT6pwMuMXrU7NwLBappzO1uQJnIu7uKZR4
	XSJzVG/cfOrQGLQQqKc9nV4y1fZ4rfM754ydA4DnPztPbQ45JKqgHvRQ5aWC0
X-Gm-Gg: ASbGncvHhhzi4cmRRP+V40CwRGRietlaWmPFDJVkyLHlaElKSm1Egqf+MnR/hCBh8eV
	wq278PxjGQ0nML97zJjsx1s8Z3iT3cHXhmyip/eY3kzFMMlfiENkoE/qh5ykBTJgN1TMYmg9oVl
	GeRtEMie39nDF6SI3RnMQaxCfv5CRI03y16/OKPZt0kZviZkn6y9D5rF2QIEbUIW4lY3Yjp1rB/
	PfcwvKbmXHjeY3vT366UJMUWHflC6gKXjt48SrmHi46QuDHXggtwoqmcuj5VoueZHi2Q2zZJRa7
	o8t66JU2jbQNJo8jrFlR2HXJHP2+Rt5ThRG+JtqjUaVNwD88xOsF7+uvUvoRB9DxhrVkHzTcdob
	nKwn6voW6ng8BLnEfGRKbC4qO/rbJ1lK4u2A8rMw47tMDRlo=
X-Received: by 2002:a05:6000:1faa:b0:385:e013:39ec with SMTP id ffacd0b85a97d-38bf5656b93mr23373424f8f.8.1737639426557;
        Thu, 23 Jan 2025 05:37:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEXNPw/prl60ym9zrVU6V0PANh/AF90ItqKwWBFDMLateBji2TwIVkix0IJi3SHrOv29EnAOQ==
X-Received: by 2002:a05:6000:1faa:b0:385:e013:39ec with SMTP id ffacd0b85a97d-38bf5656b93mr23373399f8f.8.1737639426220;
        Thu, 23 Jan 2025 05:37:06 -0800 (PST)
Received: from ?IPV6:2001:1c00:2a07:3a01:f271:322f:26b0:6eb5? (2001-1c00-2a07-3a01-f271-322f-26b0-6eb5.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:f271:322f:26b0:6eb5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf322ac88sm19658204f8f.54.2025.01.23.05.37.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 05:37:05 -0800 (PST)
Message-ID: <17c7fb24-d12c-42c9-9ab1-dd8eac6ea9ac@redhat.com>
Date: Thu, 23 Jan 2025 14:37:04 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] platform/x86: int3472: Call "reset" GPIO "enable"
 for INT347E
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Daniel Scally <djrscally@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 hverkuil@xs4all.nl, linux-media@vger.kernel.org
References: <20250122104344.245128-1-sakari.ailus@linux.intel.com>
 <Z5Eh-mX-RiWw9giI@smile.fi.intel.com> <Z5IIkM1i1MV42uvh@kekkonen.localdomain>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Z5IIkM1i1MV42uvh@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Sakari,

On 23-Jan-25 10:14 AM, Sakari Ailus wrote:
> Hi Andy,
> 
> On Wed, Jan 22, 2025 at 06:51:06PM +0200, Andy Shevchenko wrote:
>> On Wed, Jan 22, 2025 at 12:43:44PM +0200, Sakari Ailus wrote:

....

>>> -	int3472_get_func_and_polarity(type, &func, &polarity);
>>> +	int3472_get_func_and_polarity(int3472->sensor, &type, &func,
>>> +				      &polarity);
>>
>> AFAIK, we don't have hard attachment to the 80-[character limit rule, please
>> use more room on the previous line.
> 
> There's no reason for the line to be above 80 characters.

I known that under drivers/media the consensus is to try and stick to
the 80 chars length limit. But under drivers/platform/x86 we have
embraced the new 100 chars limit and we prefer to use the full 100 chars
over unnecessarily splitting statements over 2 lines.

We are of the opinion that a single slightly longer line is easier
to read then a statement split over 2 lines, so please change this to:

	int3472_get_func_and_polarity(int3472->sensor, &type, &func, &polarity);

Regards,

Hans




