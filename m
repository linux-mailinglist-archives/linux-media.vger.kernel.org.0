Return-Path: <linux-media+bounces-32579-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C48D2AB83CD
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 12:28:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6DF29E3D2A
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 10:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2CC52980A0;
	Thu, 15 May 2025 10:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gi3ADBPP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE1D297B7E
	for <linux-media@vger.kernel.org>; Thu, 15 May 2025 10:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747304895; cv=none; b=m77wlzLf7IClhbm1d/BMxI6rMTjnmsREMhZFK+v9/U/NIOJa8RA+2LsGCldxjpEU1jopA9ZlBQ8W7jFM5kBHxMg1BcUZ6JJBkpjIfKrloB8HxUYdKHucr6ktscxE5LMFP++onfEONEHmEzRG1mrH9Lwd9m5Bq1+VE4hCYfoeQto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747304895; c=relaxed/simple;
	bh=EIFevpq8dX2LCKDK/xf+KDxBAnXQGcmwAOSKqeA/Jd4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vFem1W/f2chHIkQEihmvLCOLK1XsgjEdycx9ujnwldZqcWyf3JjdGBIbJVgdReN9wDT0HKS6ffIyAMGIR/HZSdJdgccvczYeusqHdR3TWy9p0X3r4RAxUdiccF6TGARUbIYpIgkBa3XCXNGnaypFYJOleOCo4JcctCz53x5tq8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Gi3ADBPP; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so14483985e9.1
        for <linux-media@vger.kernel.org>; Thu, 15 May 2025 03:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747304891; x=1747909691; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MQTqLhwSh6OrSw6IMwMRJicwoshkXtNcbJJGGNRVuwk=;
        b=Gi3ADBPPF+lArrWWDlTe4YuzySYER6B9M4ShoG782OfWOUjlxVDqI/Rk1algbMzmAQ
         +5te/NvdXz6FA64AWQ4sAQ/nHPb3DDjtm8TlUJcVYQ0qe9UeMAEOswyQg/azufMkJcUE
         sivmOmDBNbwZ7Lo6PP9MRQ2rdDcEcOyOtc4pW3CJihO1zOGUklvmH8DNfMHKaGKHKWoB
         +ZqkkHFDf4wPvP1QH2yQyJ420jSCFM80TydhaxzCq6kTRKZ/QjrLNXFwZQHcQJqLNmJh
         GxcGHSFnSZlREJ5J5k3wcImNqNv1fs9jpp3IPfykf13PetMyY0kz+LyvHADlPrgbEMMO
         2Y+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747304891; x=1747909691;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MQTqLhwSh6OrSw6IMwMRJicwoshkXtNcbJJGGNRVuwk=;
        b=EtvcUf16HAx4pF0NJv29feEgCtDMWTVnPgtZEIjO446N+r3R6ktRonedqNQJ4HhzxK
         mE4D2ZuRHtM8I31EBYIKZWg5BwRK5r7zUs59mqcdoieMZXUgP3Q4z9kjBI237lKIaom7
         u1sHx0vDLYMu0+oswlnM2lS70CILJymg7shuzQw4MWgcYkZgfZnfxZiXhJpaEv3y4awT
         MgimhAKAXTli3NuWOHDHMLRk0nflmEIscfOh703lz69pPNWdzsoW/ODOStvm8oMvC+kV
         ku31E370YggXZa+3hOLLnqxkhbWWzVD6lGe+Bs7pESFTxaFC8Qa+n2P652hEGowehDpV
         JTLw==
X-Gm-Message-State: AOJu0YxeXgVgyChu9eFJDbEj8OXPJ9Vcd3MBfAkFHMVYCSVI8l5Q7w4C
	q5Xc5+Rzj1cOFsqCNEdgmSV5+basBKIYAGVTcHnITAyCjd0zRhZIwCAtlLG1Nss=
X-Gm-Gg: ASbGncu6qPhum8hOP7x86+75wtmrMYXAUiToMesdlxHuNCOY/Xmu3mncWJeC/y8PGqD
	C2457lFag7MFaBGsrBI9Oy4WIlM+doqG51VDRdLslS+xsAP/jLA2Y/4E50O21zDSOkiL0MjKn8j
	3tXWC8o7VGDswpnpDE0eNvlxD7r8fn3LLakdla/ObIXfBKvWpdvpsUhYuETr//CLVyYAbbE/gPR
	Tw/Ygzca28qvSflqpAeZiXmEpmEGdgWwquK6DHlJywOBGJ8W9qbR+65xUG65THMzSc5V9uPukh/
	TxXgCDtxdDyOfr0jUfjy2RCBQjKHVb7GWpGwWjBZVU+RfWV2K5dWs/A6P6tX0XZMwl+Uf4DQGUy
	DvjXl+m2gx6vf
X-Google-Smtp-Source: AGHT+IEh7cg2n36jj5VIXhPzC8UEK/fTT2ZipIObmkwaXnivvrusqpAVwTZKtw4gHs6NHaDDzCATbA==
X-Received: by 2002:a05:600c:6814:b0:439:4b23:9e8e with SMTP id 5b1f17b1804b1-442f84c7cafmr28791025e9.3.1747304891594;
        Thu, 15 May 2025 03:28:11 -0700 (PDT)
Received: from [10.61.1.70] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f396c052sm64742195e9.29.2025.05.15.03.28.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 03:28:11 -0700 (PDT)
Message-ID: <b0c48989-4ce7-4338-b4bb-565ea8b6cd82@linaro.org>
Date: Thu, 15 May 2025 11:28:10 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] media: venus: fix TOCTOU vulnerability when
 reading packets from shared memory
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Vedang Nagar <quic_vnagar@quicinc.com>
References: <20250514-venus-fixes-v3-0-32298566011f@quicinc.com>
 <20250514-venus-fixes-v3-1-32298566011f@quicinc.com>
 <ad92cf06-636a-417a-b03b-0d90c9243446@linaro.org>
 <0c50c24a-35fa-acfb-a807-b4ed5394506b@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <0c50c24a-35fa-acfb-a807-b4ed5394506b@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/05/2025 10:56, Vikash Garodia wrote:
> memcpy(hfi_dev->pkt_buf, rd_ptr from shared queue, dwords..)
> 
> pkt_hdr = (struct hfi_pkt_hdr *) (hfi_dev->pkt_buf);
> 
> if ((pkt_hdr->size >> 2) != dwords)
>      return -EINVAL;

Yeah it would be better wrt the commit log.

But does it really give additional data-confidence - I don't believe it 
does.

=> The firmware can update the pkt header after our 
subsequent-to-memcpy() check.

Again this is a data-lifetime expectation question.

You validate the received data against a maximum size reading to a 
buffer you know the size of - and do it once.

The firmware might corrupt that data in-between but that is not 
catastrophic for the APSS which has a buffer of a known size containing 
potential bad data.

Fine - and additional check after the mempcy() only imparts 
verisimilitude - only validates our data at the time of the check.

my-linear-uninterrupted-context:

memcpy();

if(*rd_ptr >> 2 > len) <- doesn't branch
     return -EBAD

if(*rd_ptr >> 2 > len) <- does branch firmware went nuts
     return -EBAD

Superficially you might say this addresses the problem

if (*rd_ptr > MAX)
     return -EBAD;

memcpy();

if (*rd_ptr > MAX)
     return -EBAD;

But what if the "malicious" firmware only updated the data in the 
packet, not the length - or another field we are not checking ?

As I say if this can happen


if (*rd_ptr > MAX)
     return -EBAD;

memcpy();

if (*rd_ptr > MAX)  // good
     return -EBAD;


if (*rd_ptr > MAX) //bad
     return -EBAD;

then this can happen

if (*rd_ptr > MAX)
     return -EBAD;

memcpy();

if (*rd_ptr > MAX) // good
     return -EBAD;


if (*rd_ptr > MAX) //good
     return -EBAD;

if (*rd_ptr > MAX) //bad
     return -EBAD;

We need to have a crisp and clear definition of the data-lifetime. Since 
we don't have a checksum element in the header the only check that makes 
sense is to validate the buffer size

data_len = *ptr_val >> 2;
if (data_len > max)
     return BAD;

Using the data_len in memcpy if the *ptr_val can change is _NOT_ TOCTOU

This is TOCTOU

if (*ptr_val > max)
     return EBAD;

memcpy(dst, src, *ptr_val);

Because I validated the content of the pointer and then I relied on the 
data that pointer pointed to, which might have changed.

TBH I think the entire premise of this patch is bogus.

---
bod

