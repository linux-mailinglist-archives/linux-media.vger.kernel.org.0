Return-Path: <linux-media+bounces-32032-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 210F5AAFB0F
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 15:15:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 688324636E2
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 13:15:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6C0B22B5B5;
	Thu,  8 May 2025 13:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bEXyIDv8"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564D16DCE1
	for <linux-media@vger.kernel.org>; Thu,  8 May 2025 13:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746710119; cv=none; b=Szi1zzkl3EYKMwh9iMWeCmxf8J1VNSoKanY7HUeyATzPrh0y6NlyGPJ+auqUl2vEOeUOvmkXhAWTvFNqw59Gyxbr/Xy3KHA22C2C7Cdrl46tBTPyHD6rvwaTgLS27p8RUC1vVkj1haD0H5ULM1wLqdaAsAt/GIdkiX/a9RnHNs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746710119; c=relaxed/simple;
	bh=XqkFp8Q62Hgx5/ilnKRShqtjfz/INRjKlnDTZZ+KQrY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EsNMZDuQ1yj5+yTSGURftTukBqsKd4X0H2BU3nMIsiqqNbU+ccqtVAOsrFQJzeTmFpTWMoJgXefvqRW1GxlbKxGe7ppegNdoDdb9io22jARazyupTdd3ZUoI7DUolWXWFB9jM2/5uCgrn3ymU1jxyopXub1bdHx6l0zpVnUfg54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bEXyIDv8; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746710116;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lmFi0BvbaWesUxsWSFddwtAKSlD+TyvgcmgSa8GUXko=;
	b=bEXyIDv84r/mnRG3AvuIX1J+XgMGZ9Yk5KVcoAfupghHN9gEWOpFZi4f/9HKLwueBPi4TR
	XiWPyz1O/0qRV3sc7eq3s0zjPogJYrXN63FExcQRZDiwiT3ctKPltVnaLr5j7EN88vWMOa
	G6q5Mv37TTt6yAwUQSmTJxITkPlOpQU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590-5wtGNIxTNYGODUucwovtrw-1; Thu, 08 May 2025 09:15:15 -0400
X-MC-Unique: 5wtGNIxTNYGODUucwovtrw-1
X-Mimecast-MFC-AGG-ID: 5wtGNIxTNYGODUucwovtrw_1746710114
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5f628f5f9e3so848908a12.1
        for <linux-media@vger.kernel.org>; Thu, 08 May 2025 06:15:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746710114; x=1747314914;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lmFi0BvbaWesUxsWSFddwtAKSlD+TyvgcmgSa8GUXko=;
        b=DdN4xQRCN8rzI5LaocN7U/uHnPhR3QOH3yFzBJaHet7IOBlXuhafSjEEVmv/oivmXZ
         Gvju2szladVVb9M4D7J0KhF9f4vUa0g6bbPoLr6JXYFP3r0vxzpkoTTB2ecF6eQCOPec
         pP8ouski8Agrzv7jhPEouPer2XZeJ3FsLSZ5OHAM1bU5vXHb1iHrZCzFUrAbCuorqcXH
         BnEiS7nSW5NAomUxdFz2iDFMNP/S6/WrbYHoGAxdI619uQtlfL8vopKR3uTcBP7mFt2C
         X2IcQSJs/0uOb2/ZGwXvNal4tOF5LjYh3RHIkI7bN1l7dUSCc/Q1jEpQUQpr2TWKGIz8
         zUOw==
X-Forwarded-Encrypted: i=1; AJvYcCWY0dEYtjuyyC4+XxKm/ZdUv6zJsCspAxKPmU/wkGKZj8Ep3suqYmOT0n4qztBJUzxie+fFtK67AC1eSw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+lh44LMzVmGrJBo1DO2C/Ma1Nl0FoJbluw1tOnPcHd8LKDjcg
	e3M4wj5IFuC1ATYoCTWgRNGmipGGwEITpGtF8Inn4gSkJRMTjaIBJ6iNOeVDsCVSc9ccm2ptKON
	w3xwVZJTx7uM6eRLg1eSBt1dGZJWv4706O4DxDOTKzZ94dBhKywf1g48gZ0GS
X-Gm-Gg: ASbGncuDAoAQ38/bbJ2l1kVGPwa6jMmhw44cBwiaqBiXgARxzLwQLyyPBhOhjpFUDrd
	0NOsYSru7+1r8fnt+5fX77zSOWXde+elUzWFLHG0WWvECnyegzNFSHmKXAkyVi19Swo+UxnmBfU
	YbVsPSRURsB3ZXFgAOhjUT2LiLDYOqtUv5COiVjXuX4ViX5jcPk1xG7S4GkBv/NPj1/l/0YqHrc
	vtf6yor5zScpWd36+fsHenoeHgMS0c4aJAhbve6vptTe5pT4MXRwKkTj/pPFQvsI/maZJnwZH+6
	3NxRGZ8HTvGPikHhZyBFnBuvnIdXEFE6ubVK338T77OAIGRNDSzZHmxWkJRHvbKYLgKH9zAJ3NK
	L7W0tUqhoFzJUx2BiiM49F4lE4is0Z9NNaevk6mFiMClrY5Vj2ag4LJKqXpzO2Q==
X-Received: by 2002:a05:6402:2691:b0:5e0:892f:89ae with SMTP id 4fb4d7f45d1cf-5fc34e585c8mr3040934a12.4.1746710113618;
        Thu, 08 May 2025 06:15:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnc4ngHaCx+piUSXWfkfvJF8SnlajfUx/OxaeFxdQDqKvgTaSsjOh3H40FUsWbK11MrUzc8Q==
X-Received: by 2002:a05:6402:2691:b0:5e0:892f:89ae with SMTP id 4fb4d7f45d1cf-5fc34e585c8mr3040901a12.4.1746710113072;
        Thu, 08 May 2025 06:15:13 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa77bea456sm11369201a12.65.2025.05.08.06.15.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 06:15:12 -0700 (PDT)
Message-ID: <fc8bd73d-6b07-430c-8b9d-1e0393118e8b@redhat.com>
Date: Thu, 8 May 2025 15:15:11 +0200
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
 <CAHp75VeRTO2vPqb44qNp+MZP3R9y5qv3X+EjOJCaeCR3thsr5w@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VeRTO2vPqb44qNp+MZP3R9y5qv3X+EjOJCaeCR3thsr5w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 8-May-25 10:37 AM, Andy Shevchenko wrote:
> On Thu, May 8, 2025 at 11:36 AM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
>> On Wed, May 7, 2025 at 9:52 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>>> This patch series does some small refactoring of the int3472 code to allow
>>> re-using the sensor GPIO mapping code in the atomisp driver and then the
>>> final patch in the series moves the atomisp driver over.
>>>
>>> About merging this, maybe the int3472 patches can be merged in time for
>>> the 6.16 merge window and then the atomisp patch can be merged after
>>> 6.16-rc1 is released, otherwise an immutable pdx86 branch with the first
>>> 5 patches will be necessary.
>>
>> Overall I'm pretty much liking this series, but one comment against
>> the last patch (see there) and one question here. Can you isolate GPIO
>> mapping code in a separate file, please? This will help to generalise
>> this code outside of two mentioned drivers (I might need it in the
>> future for something else, not related to cameras at all).
> 
> Ah, and formal
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
> for patches 1-5.

Andy, Sakari, Thank you both for your reviews of patches 1-5.

Ilpo, since patches 1-5 have 2 Reviewed-by-s now, can we maybe
still get those in before the 6.16 merge window ?

That would make merging patch 6/6 a bit easier, avoiding the need to
have an immutable branch for the int3472 bits patch 6/6 depends on.

Regards,

Hans



