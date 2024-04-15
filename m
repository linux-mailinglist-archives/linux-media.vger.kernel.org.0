Return-Path: <linux-media+bounces-9314-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0538A4A82
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 10:38:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3EB361C21C46
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 08:38:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11E98381C2;
	Mon, 15 Apr 2024 08:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J8iEGB6q"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8623BBCA
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 08:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713170320; cv=none; b=HEnyZyyrjAXlet7tcx6uw+b27VdbWd+sU9GR0Hfj4QVbnsjvj/dxZnKwNSnNrSz2ML0j6qmbICEbmGzlzi4stexTaz2nWONhiEWx1BQn/q8inMf7N1/FNkEjicv1ZCAPWk5/u3xTUAM2Sje8PTqOUBaWI9UK+yN5tH68FlLyHxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713170320; c=relaxed/simple;
	bh=2jADGFDWXvgj8+SykrboeiCI3Ly4YIkwgtcGI+RBKTE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IUR2D2ALFf71tTS0uUmYRg5/r7YqZuTPjO0vNNeWDVDF5M6N8NVu1EL7/lxMiHZYJ9PRoWLH7xQ7Oqm6HQZaX4Vom6cXrnudzNljprbwX1b/aVYQ9FWQbf2bqiUHTWc/OQRn+5zDpDd8yMvJVQ+wwN9NgzDrpeLTwUlfyRQhoU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J8iEGB6q; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713170318;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WXAcfVpsvi1fW47nrsnx82Go5kTigQmwkAWlozZadqk=;
	b=J8iEGB6qWqbYJkPDSPDwk/AfJa5VJmuETFbhOkTZEM0zlRkzlWzQ2VBEKnsJPvA14wAkX9
	hm2kazoDemD9QOhmGMuuDmL6lIUb/itBJyG0v+OXd/fXHSRv4J394YPClMvI06UkyeIwWO
	PvW+9o1l8hQR6AYaQCTO1SWVn5P00CU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-561-walQSa7bN4uIxta-2sZr0Q-1; Mon, 15 Apr 2024 04:38:35 -0400
X-MC-Unique: walQSa7bN4uIxta-2sZr0Q-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5702c0e4e04so127850a12.2
        for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 01:38:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713170314; x=1713775114;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WXAcfVpsvi1fW47nrsnx82Go5kTigQmwkAWlozZadqk=;
        b=iklR9vSUe+DrrprJx9lc/6ejcD8Oz/7WOwNVZVbiJZdJ2LZ1pxkzSbgS+rPrhoF4uh
         uM7zh7lDoqMXVaUxvcNa1wntl6AyOJ7hv7yK37+JMMTalINRXgjsMU7AtYiZ64B2IeEz
         gN35RogM/FNUwXn7MINbHGfz0Jh/ecI7mgC4m4JXQ526nw4LNWsrOgg25n7CuBSzkKhO
         nq6MZeM4g2o2MeS3DnibmBwvERt1/LsFiZNP4WwWzEzEH8Ks+M3eRWs2pHkdW7S4LCB3
         SBteQks65c/FavywBDj8ZU9IqJUwxdFoWSNPZFfLfjDlOzH2/YZX4l00D+ZskYA/GEK8
         QMww==
X-Forwarded-Encrypted: i=1; AJvYcCUjeZJFsnK6AGUVTU1ufG+pe/NDf2qDUcygsPAXBLOTUw3dVrIkZ3bdX6dpEJ3GcLWgZ8n6inqwfd44nEOB768VI3EuSaIumNMvrbE=
X-Gm-Message-State: AOJu0YyF3aLb5weVN3JSCUgUBWoTr7xVSZvL8UtDQcP7ffUEWYhkS4aX
	2Oc9dnXUL8+De4HxR171ycwYxvUt0C1nUkXpX7QHyA/gKL4gS4KevzYSB4yN8JgVn5fUeFDDHmP
	7RJKD9CaQDx4oR9ofsspV02whfWKm3NEhS4uqhNHW41xetFAHlMhuGI/IRZeCaZi3iaJQbIQ=
X-Received: by 2002:a50:d604:0:b0:56e:2cfc:1d3d with SMTP id x4-20020a50d604000000b0056e2cfc1d3dmr5494498edi.16.1713170314116;
        Mon, 15 Apr 2024 01:38:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEer+Mtwpf5vPh7vfXXS+GoO8DGFy+5hr/ocfSh3MXHD1Jar7mwkvqlv2PB+Wn2C/ml2IPRfg==
X-Received: by 2002:a50:d604:0:b0:56e:2cfc:1d3d with SMTP id x4-20020a50d604000000b0056e2cfc1d3dmr5494488edi.16.1713170313775;
        Mon, 15 Apr 2024 01:38:33 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id x7-20020a056402414700b0056feb6315easm4369177eda.1.2024.04.15.01.38.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Apr 2024 01:38:33 -0700 (PDT)
Message-ID: <42d71d9c-0802-4bcf-b921-6326446c50ea@redhat.com>
Date: Mon, 15 Apr 2024 10:38:32 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] media: ov2680: Stop sending more data then requested
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Rui Miguel Silva <rmfrfs@gmail.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
References: <20240216223237.326523-1-hdegoede@redhat.com>
 <20240216223237.326523-2-hdegoede@redhat.com>
 <170818429397.1206667.7109669506551567157@ping.linuxembedded.co.uk>
 <1ad989d8-08e7-43c0-9b35-98e54e4a3de2@redhat.com>
 <171278425800.3085322.3202909682266232934@ping.linuxembedded.co.uk>
 <3fbce286-42a0-41ec-b031-4f32dc9f1678@redhat.com>
 <171313220834.3165863.14580351639874549754@ping.linuxembedded.co.uk>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <171313220834.3165863.14580351639874549754@ping.linuxembedded.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Kieran,

On 4/15/24 12:03 AM, Kieran Bingham wrote:
> Hi Hans,
> 
> Quoting Hans de Goede (2024-04-11 13:19:15)
>> Hi,
>>
>> On 4/10/24 11:24 PM, Kieran Bingham wrote:
>>> Quoting Hans de Goede (2024-04-10 12:27:03)
>>>> Hi,
>>>>
>>>> Sorry for being very slow with replying to this.
>>>>
>>>
>>> No worries,
>>>
>>>
>>>> On 2/17/24 4:38 PM, Kieran Bingham wrote:
>>>>> Quoting Hans de Goede (2024-02-16 22:32:33)
>>>>>> There is no reason to send OV2680_END_MARGIN extra columns on top of
>>>>>> the mode width and the same for sending extra lines over the mode height.
>>>>>>
>>>>>> This sending of extra lines/columns was inherited from the atomisp
>>>>>> ov2680 driver, it is unclear why this was done and this complicates
>>>>>> adding V4L2_CID_VBLANK support, so remove it.
>>>>>
>>>>> Was this some niave way of adding some HBLANK to let the AtomISP keep up
>>>>> with processing each line?
>>>>
>>>> The total amount of pixels per line and of lines per frame are fixed:
>>>>
>>>> #define OV2680_PIXELS_PER_LINE                 1704
>>>> #define OV2680_LINES_PER_FRAME                 1294
>>>>
>>>> This patch only changes the h_end and v_end registers which
>>>> before AFAIK configure when to stop sending actual pixel
>>>> data (and move over to sending blanking data). So this was
>>>> actually requesting for more pixels to be send then there are.
>>>>
>>>>> Or is it an optical black region? or padding? (I hit issues around that
>>>>> on the IMX283 lately).
>>>>
>>>> AFAICT (from the datasheet) there is no optical black region, so
>>>> this really just seemed some weirdness in the original Android
>>>> kernel driver where this is derived from.
>>>>
>>>> The datasheet says:
>>>>
>>>> "2.4 pixel array addresses
>>>> The addressable pixel array of the OV2680 sensor is 1616 x 1216. The addressed region of the pixel array is controlled
>>>> by the horizontal_start, vertical_start, horizontal_end and vertical_end registers. The start and end addresses are limited
>>>> to even and odd numbers, respectively, to ensure that there is always an even number of pixels read out in x and y."
>>>>
>>>>> Is this a sensor you have and can visually check?
>>>>
>>>> Yes this is a sensor which I have, not sure what you mean with
>>>> visually check. The atomisp driver does not allow getting the full
>>>
>>> Me neither at this point. I was probably worried about the impact of
>>> changing these values causing visible issues in the stride/line widths
>>> or such. But if you're testing and capturing images successfully I'm not
>>> worried now.
>>>
>>>
>>>> resolution as the ISP needs some padding. So the max I can get
>>>> is 1600x1200. I think the original Android code just added
>>>> the 16 extra pixels needed by the ISP to h_end and v_end
>>>> twice. Starting with the extra 16 pixels which are actually
>>>> there on the sensor and then adding an extra 16 which are
>>>> fully made up by the driver author and somehow this still
>>>> works (I guess the sensor just sends all 0 data for these).
>>>
>>> Or maybe that was the part to check visually ;-) But I guess it's not
>>> easy to capture the full raw images for these ?
>>
>> Besides a bunch of devices with the atomisp I also have 1 IPU3
>> based device with an ov2680 sensor. So I could capture full
>> raw resolution there. But unless I modify the driver full
>> raw resolution is 1616x1216 where as before this patch the driver
>> sets v_end to 1631 so more pixels then the full size, which is
>> the weirdness this patch corrects.
> 
> That sounds reasonable to me, thank you for all the explanations.
> 
> I don't object to this patch, but I don't have a way to test, nor
> further verify this one myself specifically.
> 
> But, the commit does reflect what the commit message states ... so I
> guess that's a ...
> 
> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

Thank you.

Since this patch set is quite old by now I'll go and prepare a
resend with all the collected tags soon.

Regards,

Hans



>>>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>>>> ---
>>>>>>  drivers/media/i2c/ov2680.c | 9 ++-------
>>>>>>  1 file changed, 2 insertions(+), 7 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
>>>>>> index 39d321e2b7f9..5b04c6c0554a 100644
>>>>>> --- a/drivers/media/i2c/ov2680.c
>>>>>> +++ b/drivers/media/i2c/ov2680.c
>>>>>> @@ -86,9 +86,6 @@
>>>>>>  #define OV2680_PIXELS_PER_LINE                 1704
>>>>>>  #define OV2680_LINES_PER_FRAME                 1294
>>>>>>  
>>>>>> -/* If possible send 16 extra rows / lines to the ISP as padding */
>>>>>> -#define OV2680_END_MARGIN                      16
>>>>>> -
>>>>>>  /* Max exposure time is VTS - 8 */
>>>>>>  #define OV2680_INTEGRATION_TIME_MARGIN         8
>>>>>>  
>>>>>> @@ -359,11 +356,9 @@ static void ov2680_calc_mode(struct ov2680_dev *sensor)
>>>>>>         sensor->mode.v_start = (sensor->mode.crop.top +
>>>>>>                                 (sensor->mode.crop.height - height) / 2) & ~1;
>>>>>>         sensor->mode.h_end =
>>>>>> -               min(sensor->mode.h_start + width + OV2680_END_MARGIN - 1,
>>>>>> -                   OV2680_NATIVE_WIDTH - 1);
>>>>>> +               min(sensor->mode.h_start + width - 1, OV2680_NATIVE_WIDTH - 1);
>>>>>>         sensor->mode.v_end =
>>>>>> -               min(sensor->mode.v_start + height + OV2680_END_MARGIN - 1,
>>>>>> -                   OV2680_NATIVE_HEIGHT - 1);
>>>>>> +               min(sensor->mode.v_start + height - 1, OV2680_NATIVE_HEIGHT - 1);
>>>>>>         sensor->mode.h_output_size = orig_width;
>>>>>>         sensor->mode.v_output_size = orig_height;
>>>>>>         sensor->mode.hts = OV2680_PIXELS_PER_LINE;
>>>>>
>>>>> Especially as seeing hts = OV2680_PIXELS_PER_LINE it does sound like the
>>>>> margin is superfluous.
>>>>
>>>> Right.
>>>>
>>>> Regards,
>>>>
>>>> Hans
>>>>
>>>>
>>>
>>
> 


