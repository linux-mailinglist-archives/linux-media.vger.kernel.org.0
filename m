Return-Path: <linux-media+bounces-9006-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 515AD89F0C7
	for <lists+linux-media@lfdr.de>; Wed, 10 Apr 2024 13:29:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6D406B22587
	for <lists+linux-media@lfdr.de>; Wed, 10 Apr 2024 11:29:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 320EB1598F7;
	Wed, 10 Apr 2024 11:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q/xP2JZN"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90BA159598
	for <linux-media@vger.kernel.org>; Wed, 10 Apr 2024 11:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712748431; cv=none; b=q5UuspzZffzBatRlHMZQxSTabceHPZF+uXl2DqdVVWGCGzmcRruU/tc+e4WFCK+zCW6cFyCVgfIQhaXey4K1vD8/Uljq25c15qy2ncgcVafiO6JkyA9ZpOJ0166F6mTnXstwGRY05K2Lb1y4/fGB6L/wo9xZJL5qXwtMFTBYEXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712748431; c=relaxed/simple;
	bh=aflIJg4br+vqUoTui1R6UmyDFOgYbkABOcW68JE0M5Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I5BlxYLSYe9jLDsqanu7oYqkc7BLRXUOQVD1BeN/g6yJGAYoKhpDNLd18s1tLaNdX5AjAmxyb51hfBx1OM53xyuVk6gbn4G3Pgfm0SNVyoD9Vm2Ml3wL8Ej5F6iAoeCserubjGpXE+AeXthnKbNnUsfn5TXt8Dk2B4T3/4FDnSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q/xP2JZN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712748428;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ir4O7EpzFTrHZeiZ74sDk4WKiIszgsIfHhKvr0OhXOU=;
	b=Q/xP2JZNW34uTEBrimGefLFKCap9VWflrpcl/hsw+jo8yfl/697d++13nYdj0HFLlZBdNn
	WYbVHWNFfLUucQA+31qji+mtfPFJRDIm7kc0BW+IX84P7PYdJTDXTDM0S25KbT+C5JiHG3
	nlLIURpNL5Ut4zESc/C9yMV5JvWe1wI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-225--TDZopTHMoG_aCXnmz3R3Q-1; Wed, 10 Apr 2024 07:27:06 -0400
X-MC-Unique: -TDZopTHMoG_aCXnmz3R3Q-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a5198c1a6f4so319272366b.3
        for <linux-media@vger.kernel.org>; Wed, 10 Apr 2024 04:27:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712748425; x=1713353225;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ir4O7EpzFTrHZeiZ74sDk4WKiIszgsIfHhKvr0OhXOU=;
        b=i17UhROeFKh5WFO/1n22iMvocUeyLmqL8uSMC5rhjZsqcM3whXAGUKZVjue0Y3058N
         Robv7fg1WkXd36UnQK/yggM2kGOQQb5PtcElI5Fzj6ZHSM3ykUBZv0sQ1DwHiyDHismJ
         wlbhfVdwzMVJWqzK9mV75U8X1C/32PTU3JYaqQlsjXb11EsyVKEHYjVk2y0q+sY2a6ap
         O1XINMWpu8PuXzN8vqqr+8ey1YoXRpNYcok7+/8DW6zF2igGjQhU1w/4aQtIYVe6jqMl
         hZ1Fukwr3uyR36LtP505sspyzqrae0jvuo1iip0PAqoNpejJitMsnbX62cNBWLGYM0bQ
         ZEIQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6bteDO5RyPdvcpJQ1EznGF+GuCHiK1VkWGb9WVxANEyomkx5oighE0JcawUR9zVYG3d0m32G8uunIiDDRXFoMQuWUhkLvErKNyrs=
X-Gm-Message-State: AOJu0YyNJJ+unePv5+HEeDcDQiLgy2CxvYpO/4x3RQ/zEtXV37xM28eC
	1iaj5ZL226ZwTWNpjs+g59Pa4zgnk9ax00uVucQ6URFx+WhrG++0+4s8JE1MWMqwUk5hGMofc/E
	Z5dXj0Z9taN53iNapcXASjt4fAEJ0/BAmbllETwCk98QwN9VJF83zxl2lm5d4
X-Received: by 2002:a17:906:a291:b0:a51:99e1:1f1a with SMTP id i17-20020a170906a29100b00a5199e11f1amr1462892ejz.64.1712748425155;
        Wed, 10 Apr 2024 04:27:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGS7HPzHpNh7UqtfGkfXj8KTrtvHILpnkDRXEf/+5iEVFgSv+Yr7cm4cxT+qYFrDRopZy84Rw==
X-Received: by 2002:a17:906:a291:b0:a51:99e1:1f1a with SMTP id i17-20020a170906a29100b00a5199e11f1amr1462883ejz.64.1712748424813;
        Wed, 10 Apr 2024 04:27:04 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id qb2-20020a1709077e8200b00a51c5c76023sm4847777ejc.194.2024.04.10.04.27.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 04:27:04 -0700 (PDT)
Message-ID: <1ad989d8-08e7-43c0-9b35-98e54e4a3de2@redhat.com>
Date: Wed, 10 Apr 2024 13:27:03 +0200
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
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <170818429397.1206667.7109669506551567157@ping.linuxembedded.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

Sorry for being very slow with replying to this.

On 2/17/24 4:38 PM, Kieran Bingham wrote:
> Quoting Hans de Goede (2024-02-16 22:32:33)
>> There is no reason to send OV2680_END_MARGIN extra columns on top of
>> the mode width and the same for sending extra lines over the mode height.
>>
>> This sending of extra lines/columns was inherited from the atomisp
>> ov2680 driver, it is unclear why this was done and this complicates
>> adding V4L2_CID_VBLANK support, so remove it.
> 
> Was this some niave way of adding some HBLANK to let the AtomISP keep up
> with processing each line?

The total amount of pixels per line and of lines per frame are fixed:

#define OV2680_PIXELS_PER_LINE                 1704
#define OV2680_LINES_PER_FRAME                 1294

This patch only changes the h_end and v_end registers which
before AFAIK configure when to stop sending actual pixel
data (and move over to sending blanking data). So this was
actually requesting for more pixels to be send then there are.

> Or is it an optical black region? or padding? (I hit issues around that
> on the IMX283 lately).

AFAICT (from the datasheet) there is no optical black region, so
this really just seemed some weirdness in the original Android
kernel driver where this is derived from.

The datasheet says:

"2.4 pixel array addresses
The addressable pixel array of the OV2680 sensor is 1616 x 1216. The addressed region of the pixel array is controlled
by the horizontal_start, vertical_start, horizontal_end and vertical_end registers. The start and end addresses are limited
to even and odd numbers, respectively, to ensure that there is always an even number of pixels read out in x and y."

> Is this a sensor you have and can visually check?

Yes this is a sensor which I have, not sure what you mean with
visually check. The atomisp driver does not allow getting the full
resolution as the ISP needs some padding. So the max I can get
is 1600x1200. I think the original Android code just added
the 16 extra pixels needed by the ISP to h_end and v_end
twice. Starting with the extra 16 pixels which are actually
there on the sensor and then adding an extra 16 which are
fully made up by the driver author and somehow this still
works (I guess the sensor just sends all 0 data for these).


> 
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/media/i2c/ov2680.c | 9 ++-------
>>  1 file changed, 2 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
>> index 39d321e2b7f9..5b04c6c0554a 100644
>> --- a/drivers/media/i2c/ov2680.c
>> +++ b/drivers/media/i2c/ov2680.c
>> @@ -86,9 +86,6 @@
>>  #define OV2680_PIXELS_PER_LINE                 1704
>>  #define OV2680_LINES_PER_FRAME                 1294
>>  
>> -/* If possible send 16 extra rows / lines to the ISP as padding */
>> -#define OV2680_END_MARGIN                      16
>> -
>>  /* Max exposure time is VTS - 8 */
>>  #define OV2680_INTEGRATION_TIME_MARGIN         8
>>  
>> @@ -359,11 +356,9 @@ static void ov2680_calc_mode(struct ov2680_dev *sensor)
>>         sensor->mode.v_start = (sensor->mode.crop.top +
>>                                 (sensor->mode.crop.height - height) / 2) & ~1;
>>         sensor->mode.h_end =
>> -               min(sensor->mode.h_start + width + OV2680_END_MARGIN - 1,
>> -                   OV2680_NATIVE_WIDTH - 1);
>> +               min(sensor->mode.h_start + width - 1, OV2680_NATIVE_WIDTH - 1);
>>         sensor->mode.v_end =
>> -               min(sensor->mode.v_start + height + OV2680_END_MARGIN - 1,
>> -                   OV2680_NATIVE_HEIGHT - 1);
>> +               min(sensor->mode.v_start + height - 1, OV2680_NATIVE_HEIGHT - 1);
>>         sensor->mode.h_output_size = orig_width;
>>         sensor->mode.v_output_size = orig_height;
>>         sensor->mode.hts = OV2680_PIXELS_PER_LINE;
> 
> Especially as seeing hts = OV2680_PIXELS_PER_LINE it does sound like the
> margin is superfluous.

Right.

Regards,

Hans



