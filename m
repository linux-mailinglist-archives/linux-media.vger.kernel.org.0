Return-Path: <linux-media+bounces-9348-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF598A4E3D
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 13:59:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D14DD1C20FBB
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 11:59:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59AC16773D;
	Mon, 15 Apr 2024 11:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KbvPLlLe"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1745DF05
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 11:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713182342; cv=none; b=TiaUkuZu2XBnrPr4RIaLe2pLIi+uszk76SKzorUXN7iplgyNHLdOHRq4VczpUYnnyLDXK2utAyOPIt1JIq0mF3+CZs7zuCW1F6OG5TDO9oR8tottY7Xu2kuZfxjLNQV/hR5O7r6hvQxz/PcX9WmfHAjB3pX93ZVmKRXkaoXim9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713182342; c=relaxed/simple;
	bh=BkQE2GWFwH+fj030MxgjdKvDGJuBCDrXnz9MlupUoh0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EB+UGduSOtlPET4Uwhi0gGZPjNNwVSjPG4VvmkI6WgSKFI2zRadNI495Q6+FTwCgmXleqhWcJQJ6RI5OP/I5wMGGKGWqAUypEQryoBJPXps4onnd6XqC45Xbb2Z6xq7R1SnBpoVV48gzl4z4i/Xr5RRHNKrLAVKF1+n9UY24ots=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KbvPLlLe; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713182340;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qQBje/20Mx7YNdFf2xvgtVp/nzjWRARM0TM+KHX257c=;
	b=KbvPLlLewRD9F1kB0p23/YkPufrC+K/UXcqnMPJ16KW/BIDEh7Si+nGqyghEXQnqS9cRGA
	Or1UwygdQ4o3/j/n+/cweEZAd8Vz+JKyCMUAGhugVd34YWsrV3nkh1OvU02yewivAElnT7
	BKLYH1Iy6mS7Qn4O08J085zGDhU38wU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-68-EikdaTTAM3Wt771-uClvNQ-1; Mon, 15 Apr 2024 07:58:55 -0400
X-MC-Unique: EikdaTTAM3Wt771-uClvNQ-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-57021520cddso614550a12.0
        for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 04:58:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713182334; x=1713787134;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qQBje/20Mx7YNdFf2xvgtVp/nzjWRARM0TM+KHX257c=;
        b=ICegMaT5JHf3nKUQztmMSBh/fJSOwecJbqLgNsSxsW8wNIX/kmYGmQsRuG44Vjsggb
         UqDctw2RF46DvIuDp1taCn+B9rNDwc3PCPAYFWI7k3s8qmeDLhWMsK0jEbe4jLMJpD5Z
         ErjlwFiaUDQdOs3Ala1B2dFK0W3HVPB6Ghqy7n6PIZ7d4qbN4R+TMW7YZB0pB6WaN88v
         pw7a9krxOdji8KWAkVDhwbRoTqMjEj4SBKzHlz3DjjHPYmLnr8zmDj6nV8vhsvJIxIjt
         /9iySF3PeKOY4lMl2+ZutY8bQsnBKPh+pfwSHk4nQ5kRpo9klcYApESTSFoi4aTiIYtk
         XPag==
X-Forwarded-Encrypted: i=1; AJvYcCVl9Dk/yqNldVmTvrIPALlKlvO9PT1ZiVZlC3ZojfswBn4rTLEcoigW5I0M3DVCYBD3FlG725loO4YK9BKcQDcNtjiGNkIdlOTccRY=
X-Gm-Message-State: AOJu0YzlMHRpumPyvkcnkEdkCgjB8k8nbo3AtzwFpQKTJXNTmcUjj1Q+
	07SXBOlukj5UOGpqef9QLRfBLv1B8rRuX0adZ6GRUO6nOTjZbUKzHDDTfpyEGbkRXYV/PB7OpIc
	A4I+phfSDHOAibmOI64b4I94sqrrKPQINg648GnK0etVN3EUE7ElII283JKrs
X-Received: by 2002:a50:9f08:0:b0:56c:2f3a:13a7 with SMTP id b8-20020a509f08000000b0056c2f3a13a7mr6343402edf.25.1713182334654;
        Mon, 15 Apr 2024 04:58:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHi06gRIhYQPVh25+bTmpG4gwJsbMViMtjKgdazT0Ucxl1iZDuALTYhPkJf2XMK6o999OUijg==
X-Received: by 2002:a50:9f08:0:b0:56c:2f3a:13a7 with SMTP id b8-20020a509f08000000b0056c2f3a13a7mr6343393edf.25.1713182334364;
        Mon, 15 Apr 2024 04:58:54 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a15-20020a50ff0f000000b0056fc72bb490sm4708689edu.61.2024.04.15.04.58.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Apr 2024 04:58:54 -0700 (PDT)
Message-ID: <36e8c9cc-c9d1-494b-9da8-db8bdd1c43c4@redhat.com>
Date: Mon, 15 Apr 2024 13:58:53 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH resend 5/5] media: ov2680: Add camera orientation and
 sensor rotation controls
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kate Hsuan <hpa@redhat.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, linux-media@vger.kernel.org
References: <20240415093704.208175-1-hdegoede@redhat.com>
 <20240415093704.208175-6-hdegoede@redhat.com>
 <Zh0RLfbfckkKLdrD@kekkonen.localdomain>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Zh0RLfbfckkKLdrD@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Sakari,

On 4/15/24 1:36 PM, Sakari Ailus wrote:
> Hi Hans,
> 
> On Mon, Apr 15, 2024 at 11:37:04AM +0200, Hans de Goede wrote:
>> Add camera orientation and sensor rotation controls using
>> the v4l2_fwnode_device_parse() and v4l2_ctrl_new_fwnode_properties()
>> helpers.
>>
>> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/media/i2c/ov2680.c | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
>> index 14a5ac2bbf8b..840e6b63ad19 100644
>> --- a/drivers/media/i2c/ov2680.c
>> +++ b/drivers/media/i2c/ov2680.c
>> @@ -946,6 +946,7 @@ static int ov2680_v4l2_register(struct ov2680_dev *sensor)
>>  	const struct v4l2_ctrl_ops *ops = &ov2680_ctrl_ops;
>>  	struct ov2680_ctrls *ctrls = &sensor->ctrls;
>>  	struct v4l2_ctrl_handler *hdl = &ctrls->handler;
>> +	struct v4l2_fwnode_device_properties props;
>>  	int def, max, ret = 0;
>>  
>>  	v4l2_i2c_subdev_init(&sensor->sd, client, &ov2680_subdev_ops);
>> @@ -1000,6 +1001,14 @@ static int ov2680_v4l2_register(struct ov2680_dev *sensor)
>>  		goto cleanup_entity;
>>  	}
>>  
>> +	ret = v4l2_fwnode_device_parse(sensor->dev, &props);
>> +	if (ret)
>> +		goto cleanup_entity;
>> +
>> +	ret = v4l2_ctrl_new_fwnode_properties(hdl, ops, &props);
>> +	if (ret)
>> +		goto cleanup_entity;
> 
> As discussed with Umang recently, you can postpone
> v4l2_ctrl_new_fwnode_properties() error check until the control handler. Up
> to you.

So you mean move this up to above the 

        if (hdl->error) {
                ret = hdl->error;
                goto cleanup_entity;
        }

check and then drop error handling for the v4l2_ctrl_new_fwnode_properties()
call since any errors there will set hdl->error, right ?

That sounds like a nice cleanup. I'll do that for v2.

Regards,

Hans



> 
>> +
>>  	ctrls->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
>>  	ctrls->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
>>  	ctrls->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> 


