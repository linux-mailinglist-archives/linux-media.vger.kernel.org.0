Return-Path: <linux-media+bounces-16230-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A4E950CE6
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2024 21:10:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 940A528635D
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2024 19:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 874A21A4F01;
	Tue, 13 Aug 2024 19:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GMyNboey"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D03E1BF53;
	Tue, 13 Aug 2024 19:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723576232; cv=none; b=m7MPIQqv8gD4hACjBbHf8yTPUrv5ubooDb96QMyaJA/df47qcR5YHm81jOcPeOReere4hFcccuhfSRpy3XbCx/3dc7qXBnWlgBXsunXrD8IPTY7EyNwrY6rtnCrznDWdbBTjbfLS3LAANJhGnDElWvz3qNYT0LH/97dSZpMvALQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723576232; c=relaxed/simple;
	bh=Qm3B2Hhc4OaK1N9fzYWgo2KUAS6wkxdD4HztZFceuqE=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=KOWrdz1iNS+k+np1nIJ4OfIEXc2+fHpIShFZzYmBMO1LspXingXRu/VnXfrnJ1ADFQzwH9jVSUGxHBohCaNWj9XJhKXilSNOn1Ns8T28/7L8u1NRqloi7gdCGd6CuSsuMSwXgyQxABgB6wkLwx9WRYBNUdNRwmDH20ARINRKN7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GMyNboey; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5314c6dbaa5so5370220e87.2;
        Tue, 13 Aug 2024 12:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723576228; x=1724181028; darn=vger.kernel.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=OkzwDDzzbIHGfrk6wY5kWXyOKgOKmTrl43fadu8lRSw=;
        b=GMyNboeytP244RJIgQT9HL4CI0SodfHmdRp0SmroihOeOvDUlw8z+p3uHE8/oW3fz4
         guEP2iZtgb6Yy9BEzlTZGpOxWSw31z/pAeJ4wLa/3DHWpqyjffnOrfHGOyzfuIHqHiYH
         QeWyXLW1068zEdDJw5aORLGyvSc67sgChStCh1NgTB3PwQTmV4fVUNaZMeEZqhIly0No
         9Y2KWIiCxhEXXMUgNAIx5Yz3hKCoECMQCQ7ajBk7gq/j2U3TAIyzbXpQOl6mkQxAtg6/
         BWfzre03EQjw3bJcfgRhcTdgn8UQFYIW2bFqtwovQ48F38Z3bWbasyrcGlEWtZC1MzGQ
         nArw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723576228; x=1724181028;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OkzwDDzzbIHGfrk6wY5kWXyOKgOKmTrl43fadu8lRSw=;
        b=GTzzCtiopRCU03RaF57quujGSGpMZq6KCVC2VD6rjyXLKm/vyAN55fjvXh4UHn8tNg
         yhaudBri3i2aT/mGs1EqoQFWeEicBCiVi7gesuNJGlzi4MOOSEt0KqB/zTpZ8MdDka3a
         ENRh4Wokqlc4TOPm5nTrBNIMX+0gTco2Fy2+Eoy7ei0OgR11ayfls/aiFDoChxLUtXcV
         6Fl9z18DxRTRch+l5emcNMmzgod+sNPUN+Lh8Vz+coyrDsnqHvYG0+6knbOVsAtO0t+I
         kkgaJ9I0EYFoKWI1T+wpd4XatOJb1KNQxLREuqq1keo2269KaaIE8o+pLK0pLoq22bhN
         pPzg==
X-Forwarded-Encrypted: i=1; AJvYcCXh9ojKXXr59RZsjerAXuBhG+yLGsIDmwEsyo/+b4eruivZDedQ7VGjwXk6/LO+4ww3WbGPZmxQcl7cukV1kWJ5EtKAAvqePgJzG3/QRe+oEUK0kkK8d0JWG+YvtuR8OdTvQWVdLHkdAkE=
X-Gm-Message-State: AOJu0YwBOBqLl+HI0jaONOLJ82rTW33IPOndFNcwH/H6x+pubW1Bb+cR
	D+JUxNmyGfq4wUPsfAfHepcvlKKWCr4tBVEapx+koh5MPXr7ruLa
X-Google-Smtp-Source: AGHT+IGD+fC8Jids0yhxZcgV/C5rV98qZZW5yx1diGOf+tUCKqtlPxHn5k3CAev2RAohYNibLjw9Xw==
X-Received: by 2002:a05:6512:1310:b0:52d:b226:9428 with SMTP id 2adb3069b0e04-532eda8e621mr273897e87.6.1723576227642;
        Tue, 13 Aug 2024 12:10:27 -0700 (PDT)
Received: from razdolb ([77.220.204.220])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53200ec33c0sm1078984e87.81.2024.08.13.12.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 12:10:27 -0700 (PDT)
References: <20240616202433.227895-5-mike.rudenko@gmail.com>
 <20240813124443.446703-1-changhuang.liang@starfivetech.com>
User-agent: mu4e 1.10.8; emacs 29.3.50
From: Mikhail Rudenko <mike.rudenko@gmail.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: christophe.jaillet@wanadoo.fr, dave.stevenson@raspberrypi.com,
 jacopo@jmondi.org, laurent.pinchart@ideasonboard.com,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 mchehab@kernel.org, sakari.ailus@linux.intel.com, tomm.merciai@gmail.com
Subject: Re: [PATCH 4/4] media: i2c: ov4689: Implement 2x2 binning
Date: Tue, 13 Aug 2024 21:48:37 +0300
In-reply-to: <20240813124443.446703-1-changhuang.liang@starfivetech.com>
Message-ID: <877cck2q8x.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


Hi, Changhuang

On 2024-08-13 at 05:44 -07, Changhuang Liang <changhuang.liang@starfivetech.com> wrote:

> Hi, Mikhail
>
> Thanks for your patch.
>
>>
>> Implement 2x2 binning support. Compute best binning mode (none or 2x2)
>> from pad crop and pad format in ov4689_set_fmt. Use output frame size
>> instead of analogue crop to compute control ranges and BLC anchors.
>>
>> Also move ov4689_hts_min and ov4689_update_ctrl_ranges, since they are
>> now also called from ov4689_set_fmt. Update frame timings to
>> accommodate the requirements of binning mode and avoid visual
>> artefacts. Additionally, report 2x2 binned mode in addition to
>> non-binned one in ov4689_enum_frame_sizes.
>>
>> Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>
>
> Tested-by: Changhuang Liang <changhuang.liang@starfivetech.com>
>

Thanks for testing! It's good to see that this code has now been
independently verified as it contains a few bits that were obtained
through reverse engineering/trial and error that I was never entirely
sure of. (Of course I did lots of testing to ensure that all possible
crop+binning modes work as expected, but when datasheet lacks required
information, one can never be fully sure.)

>> ---
>>  drivers/media/i2c/ov4689.c | 179 ++++++++++++++++++++++++-------------
>>  1 file changed, 117 insertions(+), 62 deletions(-)
>>
>> diff --git a/drivers/media/i2c/ov4689.c b/drivers/media/i2c/ov4689.c
>> index c4c7c462672a..1499fbe88b76 100644
>> --- a/drivers/media/i2c/ov4689.c
>> +++ b/drivers/media/i2c/ov4689.c
>> @@ -114,7 +114,7 @@
>>   * Minimum working vertical blanking value. Found experimentally at
>>   * minimum HTS values.
>>   */
>
> Regards,
> Changhuang


--
Best regards,
Mikhail Rudenko

