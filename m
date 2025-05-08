Return-Path: <linux-media+bounces-32037-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97227AAFC46
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 16:01:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DEEB01C22C85
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 14:01:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6151822A4F1;
	Thu,  8 May 2025 14:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gIm+i1sA"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FDE22D9F7
	for <linux-media@vger.kernel.org>; Thu,  8 May 2025 14:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746712855; cv=none; b=HyP0xVxetQr1bz1ApvgguXlN8IQBv9mS+d6G4PBH6+njks8znyMST8Zv5M75+mq8aROTKM6zVp/8hR94cq32kpWW/NwwNZz3LQLkeABNSUf5XRd3mG90IuNooGjHzAUgPVwjsnmx8rVE7zVPYAf2LABUoSnsVURaMbUF5Yz4ecE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746712855; c=relaxed/simple;
	bh=YRoyK3BALEABx2JcCF10SK+pnBjrZ9BRPIqjbg5H2Nw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YEb2s4cIcyQJIICCOXdPmyL18ZcOMFiKMWKjxIUfVhvEv/g0YvEjcSs9bFZKH1pQJllaacKsJqEHk3cdSWOUaAJH9l2asUzuJx0PLkI5CBpR1GLirtOYTGjkSXWdpRfXtin7MoIYannkKEt3jpKTMHnYOKpLzZjObh8zj8eGLwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gIm+i1sA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746712853;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6TnCo9X9rFkd8dZfcQN25Ythz1cGmJDR0tW3PaauvIE=;
	b=gIm+i1sA9ZMQ8IWffTRwkLgIxAwkIXERxrw0mFFzC79BhnhWDztavJbnr4NtADs4Gc5u8W
	BRTxtLnHABEoa99I/i1duxDVNSe9PtOLBWaMR0CkK7lLHVtdmbIIKQlVdh8wYt50tI4Oax
	LuZlGaFOfPRDUR9s8wJsnvhcm6yjvjk=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-529-jxUEkzlyMp65kyXwk36z9A-1; Thu, 08 May 2025 10:00:52 -0400
X-MC-Unique: jxUEkzlyMp65kyXwk36z9A-1
X-Mimecast-MFC-AGG-ID: jxUEkzlyMp65kyXwk36z9A_1746712851
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5fbf5bed97dso1053468a12.1
        for <linux-media@vger.kernel.org>; Thu, 08 May 2025 07:00:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746712851; x=1747317651;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6TnCo9X9rFkd8dZfcQN25Ythz1cGmJDR0tW3PaauvIE=;
        b=tCjmYFTlSg6iYXgfR8MfuOifesiNmmvK/jjPFOwLDnF49PFwz0scrycHaQu7wOyZAH
         NFO073qsKFOJXMxagH+k8hTBGKyIWVZenAalSU7fRO8cg8KcFkSgc3J9H6LQNSuT1A7j
         8T4IJEvdyMI++eKFiP568TSOj5LRmBnq0tKD6jeNEKWYOV8xXe08Gfe0yUQVcAqsYVGa
         R6DY7b4H0txBm9Mo40Fc9aH39LE0SCwM9J65Uh61GhBTa0m3Lpa/pVBk8hYXjvA0wBPa
         KVApinoED2KsNliMAVB7pPV1fczZpoF8tChbbzXcvPB7cgzqlQkEMzCShIpvaCXDqhNO
         vj5A==
X-Forwarded-Encrypted: i=1; AJvYcCV7leI9+MS5Wipzoz1o5FU4JiQox9CL4uwkr3YEqbSsslk8I0ANMY7jvku3wtLQZByIlyheOmrnSwYmFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCPr8Sr9xv/K1BXrpYBwPKedSJfpcSEDy7R+GbnCgO1kz8h7ui
	b/6OndPSM7tDt0MrSoQlcVkAYQl+o0P7fbe67+jKvuYQ4txBqna7G/csn1kg78t8PJ8ZhQ9w14j
	7GzIP1UNidaHA7xgGaPLUjvgFxxI8jz0SUGNYajajKllRVN8HFDjopkkOhwv7
X-Gm-Gg: ASbGncvCRvcfvTR0BpqQm8ckExW2bKKBI5C4pJqCQHwh3yl9r2FQgQhGNu6/nIUk6PN
	Fj3fOe1jmzabxieZCpHZjnChjEuQNS+7THHy0aslqxicDxlMy1l5NZUJ8/SqX2/m541VfpvMew6
	kuqjEtJWu6rdJUREgxekfk1Vky+0OyN43pExDaIS5KTN5SKgtwoj0DqI3QbSdyYV9B8w3IIjFi8
	/BckQBQP5dkwlBxiXvqewc7Fa5/2AW8gyonSaShVuWIjpYFWiQLxT9sf0MPAAs6hvxixHqK4bHE
	VvDNjvpWYSijZjM45Tu9KaKfeClA/Eybj2nYQZBCYE/lbpw2D8Q9T1jwYN/s0VdtPfBNL4JhD01
	f1+hPWZEe20qhUl9n9iH9pu5QMkiVr6GLlIG1cpBRxMP9oaev/AOfoScuqZ/UKQ==
X-Received: by 2002:a17:907:1b0d:b0:ac1:dfab:d38e with SMTP id a640c23a62f3a-ad1e8ca918fmr792000366b.15.1746712850875;
        Thu, 08 May 2025 07:00:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGs4kUttzZ/fXfN85MKSO8+LoixBy/tJ7xib42w1vjltEhwA+sdD5VBLF+aPCStQURh6GIMiA==
X-Received: by 2002:a17:907:1b0d:b0:ac1:dfab:d38e with SMTP id a640c23a62f3a-ad1e8ca918fmr791984266b.15.1746712849050;
        Thu, 08 May 2025 07:00:49 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891a19e6sm1081594466b.46.2025.05.08.07.00.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 07:00:48 -0700 (PDT)
Message-ID: <dc3b07a9-cb0f-4f84-9e4b-c6e62ffc73df@redhat.com>
Date: Thu, 8 May 2025 16:00:47 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] platform/x86: int3472: Allow re-using sensor GPIO
 mapping in atomisp
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 platform-driver-x86@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20250507184737.154747-1-hdegoede@redhat.com>
 <CAHp75Vcb-fcQHWqVDh=KUwhwvSP6KqUN8FsAMvDuwF2iD7=J1A@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Vcb-fcQHWqVDh=KUwhwvSP6KqUN8FsAMvDuwF2iD7=J1A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andy,

On 8-May-25 10:36 AM, Andy Shevchenko wrote:
> On Wed, May 7, 2025 at 9:52 PM Hans de Goede <hdegoede@redhat.com> wrote:
> 
>> This patch series does some small refactoring of the int3472 code to allow
>> re-using the sensor GPIO mapping code in the atomisp driver and then the
>> final patch in the series moves the atomisp driver over.
>>
>> About merging this, maybe the int3472 patches can be merged in time for
>> the 6.16 merge window and then the atomisp patch can be merged after
>> 6.16-rc1 is released, otherwise an immutable pdx86 branch with the first
>> 5 patches will be necessary.
> 
> Overall I'm pretty much liking this series, but one comment against
> the last patch (see there) and one question here. Can you isolate GPIO
> mapping code in a separate file, please? This will help to generalise
> this code outside of two mentioned drivers (I might need it in the
> future for something else, not related to cameras at all).

If you want to re-use this elsewhere then splitting it out
further sounds like a good plan.

But which bits do you need? Do you actually need the full code calling
the special DSM and then adding either GPIO-lookups, or gpio controlled
regulators / clks / LEDs ?

Because atm the int3472/discrete.c + other c files linked into the .ko
does all of that and for the atomisp2 case we actually want all of
that (although for now GPIO -> clk and LED is unused there).

Anyway I think it would be best for you (Andy) to come up with
a proposal / RFC patch series to split out what you need. I'm certainly
open to that and happy to review such a series.

Regards,

Hans



