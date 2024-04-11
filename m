Return-Path: <linux-media+bounces-9104-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDDE8A1449
	for <lists+linux-media@lfdr.de>; Thu, 11 Apr 2024 14:19:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 563D11F21E92
	for <lists+linux-media@lfdr.de>; Thu, 11 Apr 2024 12:19:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D286114D282;
	Thu, 11 Apr 2024 12:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eQStDgt2"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A448A14C5A7
	for <linux-media@vger.kernel.org>; Thu, 11 Apr 2024 12:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712837963; cv=none; b=sqV9GwbwUNzWi2dP04zILKYHIZq/5zXJYHcnqrrYqWRAqIeMFFgGl8lQfsnXHPS36t0iA2qh4hi591aHTc1nEaIfcptNw72zMQg3Kt0ckgFIbRjrwIQ1rFRyqX7ivGjv1dfqOBekBIJaGrS41dVoD1Ie7oIWiocaBYfpiREn8SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712837963; c=relaxed/simple;
	bh=SJPIVRABhO0r9Q5Cqna8N44nOSK+BxiZ3MuFm7TPR/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mWgx6TBr90DDkosWxsbWuhlM4LuWT2bFsceQHC4QdHvWaRzJ8BpriQbpiWIYsRMtIJR4J0j/mLtEbbmkpv1CHwrq6UoiBG13Ukhk1vLvYMMFY2n3Tz4feT4X9DrVI0o/TLUV18vWMvpMUDEv4XiksBaqv8qGpCdvJEqtkrPNImU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eQStDgt2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712837959;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XEs/DQYTphVYms3otpi4FgjdX2S710P8m6BoIw53x68=;
	b=eQStDgt2R2iB5INFNxMaja5sKU2DaMWjAnmbSYP3aPY9EfjvFZixkN7qRFo5cos8Al37UE
	ztSKw8+2duHgfrkxM3PbEeJ6xM+zXPKKL/lriiFCVSA0o5wYyUMYePIbjcEqGE8VbCokq3
	XNqbvea711BVXSdOVOA6LK8nZ5hFuzo=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-689-t7OXFdh8PpC4i9T22juC2A-1; Thu, 11 Apr 2024 08:19:18 -0400
X-MC-Unique: t7OXFdh8PpC4i9T22juC2A-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a51fdbd06c8so203718166b.3
        for <linux-media@vger.kernel.org>; Thu, 11 Apr 2024 05:19:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712837957; x=1713442757;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XEs/DQYTphVYms3otpi4FgjdX2S710P8m6BoIw53x68=;
        b=t/Jfvv3Om7ykdVOctX0QE5+qLD1NiHks+NF/26r/PR6t+wqzg0R2wocZoWd7Sk03At
         50eSm+vObiGy4buExYjsbRpqWxmXmsnjktJ4Np5DhLZOtwPFdr8KR471piPgC14/EfDm
         HM8DoMnQgaVd5jvQbVpEfYzx8vYpD2Hzq6U/20PVwYIIsR0MZPFyAhJansMak7dqG2BJ
         vSWeUFIi6AT46EMgmANTe6Kseuc3bC4tBfjceP3k5zKOhzsHd/EhL5cNz8RXhQEQgi9n
         mTM06CpmopRTe//oAfbHXYLsYd9XDY5eO+J+8Fhyml+WKyDJK4vQU/ekdWdnNGexd2Bx
         zbXg==
X-Forwarded-Encrypted: i=1; AJvYcCVHovXauHRZ5Ls7th8AvjEighGiimEv3BCYqi/egOsQmoC67nH4sy+DcKW1qQu99O+L4w7O/kKFJRGy+annP4wK82vWjaKp6s9HXAo=
X-Gm-Message-State: AOJu0Yw2qA2xPXXXXm6qU/OMW3YbmaTsPGR243Qf9qUf774AwpYcd8kj
	Eh4T0J6Y+xJnaj4ArfXiQJDLe8ubwbv04hEBrERHkaNX6NIN+lZ8l8ZOip3AW6mHvjuT/w5yjRC
	IVxgFq5l349Fw4ldYaCONbuPxLhieGj+3zwRfaWO1ekxyk5BZ8iWPYjOHhCDY
X-Received: by 2002:a17:907:986:b0:a46:966b:ebfe with SMTP id bf6-20020a170907098600b00a46966bebfemr4428251ejc.46.1712837956929;
        Thu, 11 Apr 2024 05:19:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6ZHZh2ZrzYU8y8txDhD4KcpsEJgdc3c2z2p6XsGfmuFej8Wl1LiS2EDHRxREFQZttTwARlA==
X-Received: by 2002:a17:907:986:b0:a46:966b:ebfe with SMTP id bf6-20020a170907098600b00a46966bebfemr4428234ejc.46.1712837956473;
        Thu, 11 Apr 2024 05:19:16 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a8-20020a17090640c800b00a51a34eba63sm699949ejk.85.2024.04.11.05.19.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Apr 2024 05:19:16 -0700 (PDT)
Message-ID: <3fbce286-42a0-41ec-b031-4f32dc9f1678@redhat.com>
Date: Thu, 11 Apr 2024 14:19:15 +0200
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
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <171278425800.3085322.3202909682266232934@ping.linuxembedded.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4/10/24 11:24 PM, Kieran Bingham wrote:
> Quoting Hans de Goede (2024-04-10 12:27:03)
>> Hi,
>>
>> Sorry for being very slow with replying to this.
>>
> 
> No worries,
> 
> 
>> On 2/17/24 4:38 PM, Kieran Bingham wrote:
>>> Quoting Hans de Goede (2024-02-16 22:32:33)
>>>> There is no reason to send OV2680_END_MARGIN extra columns on top of
>>>> the mode width and the same for sending extra lines over the mode height.
>>>>
>>>> This sending of extra lines/columns was inherited from the atomisp
>>>> ov2680 driver, it is unclear why this was done and this complicates
>>>> adding V4L2_CID_VBLANK support, so remove it.
>>>
>>> Was this some niave way of adding some HBLANK to let the AtomISP keep up
>>> with processing each line?
>>
>> The total amount of pixels per line and of lines per frame are fixed:
>>
>> #define OV2680_PIXELS_PER_LINE                 1704
>> #define OV2680_LINES_PER_FRAME                 1294
>>
>> This patch only changes the h_end and v_end registers which
>> before AFAIK configure when to stop sending actual pixel
>> data (and move over to sending blanking data). So this was
>> actually requesting for more pixels to be send then there are.
>>
>>> Or is it an optical black region? or padding? (I hit issues around that
>>> on the IMX283 lately).
>>
>> AFAICT (from the datasheet) there is no optical black region, so
>> this really just seemed some weirdness in the original Android
>> kernel driver where this is derived from.
>>
>> The datasheet says:
>>
>> "2.4 pixel array addresses
>> The addressable pixel array of the OV2680 sensor is 1616 x 1216. The addressed region of the pixel array is controlled
>> by the horizontal_start, vertical_start, horizontal_end and vertical_end registers. The start and end addresses are limited
>> to even and odd numbers, respectively, to ensure that there is always an even number of pixels read out in x and y."
>>
>>> Is this a sensor you have and can visually check?
>>
>> Yes this is a sensor which I have, not sure what you mean with
>> visually check. The atomisp driver does not allow getting the full
> 
> Me neither at this point. I was probably worried about the impact of
> changing these values causing visible issues in the stride/line widths
> or such. But if you're testing and capturing images successfully I'm not
> worried now.
> 
> 
>> resolution as the ISP needs some padding. So the max I can get
>> is 1600x1200. I think the original Android code just added
>> the 16 extra pixels needed by the ISP to h_end and v_end
>> twice. Starting with the extra 16 pixels which are actually
>> there on the sensor and then adding an extra 16 which are
>> fully made up by the driver author and somehow this still
>> works (I guess the sensor just sends all 0 data for these).
> 
> Or maybe that was the part to check visually ;-) But I guess it's not
> easy to capture the full raw images for these ?

Besides a bunch of devices with the atomisp I also have 1 IPU3
based device with an ov2680 sensor. So I could capture full
raw resolution there. But unless I modify the driver full
raw resolution is 1616x1216 where as before this patch the driver
sets v_end to 1631 so more pixels then the full size, which is
the weirdness this patch corrects.

Regards,

Hans




> 
>>>
>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>> ---
>>>>  drivers/media/i2c/ov2680.c | 9 ++-------
>>>>  1 file changed, 2 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
>>>> index 39d321e2b7f9..5b04c6c0554a 100644
>>>> --- a/drivers/media/i2c/ov2680.c
>>>> +++ b/drivers/media/i2c/ov2680.c
>>>> @@ -86,9 +86,6 @@
>>>>  #define OV2680_PIXELS_PER_LINE                 1704
>>>>  #define OV2680_LINES_PER_FRAME                 1294
>>>>  
>>>> -/* If possible send 16 extra rows / lines to the ISP as padding */
>>>> -#define OV2680_END_MARGIN                      16
>>>> -
>>>>  /* Max exposure time is VTS - 8 */
>>>>  #define OV2680_INTEGRATION_TIME_MARGIN         8
>>>>  
>>>> @@ -359,11 +356,9 @@ static void ov2680_calc_mode(struct ov2680_dev *sensor)
>>>>         sensor->mode.v_start = (sensor->mode.crop.top +
>>>>                                 (sensor->mode.crop.height - height) / 2) & ~1;
>>>>         sensor->mode.h_end =
>>>> -               min(sensor->mode.h_start + width + OV2680_END_MARGIN - 1,
>>>> -                   OV2680_NATIVE_WIDTH - 1);
>>>> +               min(sensor->mode.h_start + width - 1, OV2680_NATIVE_WIDTH - 1);
>>>>         sensor->mode.v_end =
>>>> -               min(sensor->mode.v_start + height + OV2680_END_MARGIN - 1,
>>>> -                   OV2680_NATIVE_HEIGHT - 1);
>>>> +               min(sensor->mode.v_start + height - 1, OV2680_NATIVE_HEIGHT - 1);
>>>>         sensor->mode.h_output_size = orig_width;
>>>>         sensor->mode.v_output_size = orig_height;
>>>>         sensor->mode.hts = OV2680_PIXELS_PER_LINE;
>>>
>>> Especially as seeing hts = OV2680_PIXELS_PER_LINE it does sound like the
>>> margin is superfluous.
>>
>> Right.
>>
>> Regards,
>>
>> Hans
>>
>>
> 


