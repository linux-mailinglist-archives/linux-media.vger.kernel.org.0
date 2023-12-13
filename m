Return-Path: <linux-media+bounces-2235-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DEDF80EBF2
	for <lists+linux-media@lfdr.de>; Tue, 12 Dec 2023 13:36:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA2E3281399
	for <lists+linux-media@lfdr.de>; Tue, 12 Dec 2023 12:36:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C32DC5EE97;
	Tue, 12 Dec 2023 12:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WY2T7F/A"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EE7794;
	Tue, 12 Dec 2023 04:36:40 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2c9c18e7990so77614791fa.2;
        Tue, 12 Dec 2023 04:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702384598; x=1702989398; darn=vger.kernel.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=y0U8C03jENiQyug4wgXGlQLyI17m/495KhTqWQqHckw=;
        b=WY2T7F/Af31Rr/oMCGCEJiXucHIIJ6sbZ/+TEHQ1GiDfPlJH3fDyAWcjBOluG1D8+s
         7rZJ8/PTHtMniLXkn0j9XInQHrZlNym4CmosjAkDj1JGygTAVdhWe1rLN/ieiVKQj5ZN
         LqrEl+l295qZzI3gLpEHjD/+Hc6Kh+Jt362A3ZsSdvm9sxg/qzv3CNUaDnSMfjj7QFpj
         rS+CyVZWaLdG67ZXzJ1Z7W8AEEiaS6t7lzQpB+Xsjxl+oAeNWyu4xjw5RgwZrEhY2Btt
         Ds5RcarBftFwwMm8SS806vK9yaYJ7m4ARx8K9VchvSSlctKnQMXM1hUXt1s8ZJ0sRw+l
         QQ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702384598; x=1702989398;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y0U8C03jENiQyug4wgXGlQLyI17m/495KhTqWQqHckw=;
        b=BAFuU2K48gJvOte+B3++uwwzo5ggm40i4MWjq6m94qksHNCsQwRr692Xvywuo7UyP/
         B/8VRNDoosMYKIMHVKCCHiMWQzUmIDPdxFt1l80amiJz2SLSxS3gFNK4X+Vw/6BFUg91
         4mH930Z+Tq9CLcdEtSEQkhDtzrcfJKHia73AGu+S07+MliC0ZYgtQ0GwbK06cDb2FTbi
         7bpzo/XQ3pU0JKqGZbjoQe1L5YDu4OBbu6E0BJOPUxFhH92Kb7W9umEEZ64LJVnaAd/7
         bdTps6n9bkAJ17da4iKi7bkzZCTINKZAdHQfnEU01ydJbnuBy0GYLa+C2zksalXswdZh
         qLYw==
X-Gm-Message-State: AOJu0YyckohB5htIEdo5ARma81u3xH3SxvG2aaXAmqHpAlpAgl2EiRCm
	JxXLsbdwIr63S6An+ASi0Bw=
X-Google-Smtp-Source: AGHT+IH3JJecfYt4Cf1zcoOxxLx4u6YaWopcQ/hN9uWzz8MiNeGJgswKjX0exxoVI2z0dXoX5VM+ew==
X-Received: by 2002:a2e:8648:0:b0:2ca:dc7:658e with SMTP id i8-20020a2e8648000000b002ca0dc7658emr2550358ljj.49.1702384598267;
        Tue, 12 Dec 2023 04:36:38 -0800 (PST)
Received: from razdolb (95-24-149-38.broadband.corbina.ru. [95.24.149.38])
        by smtp.gmail.com with ESMTPSA id g8-20020a2eb5c8000000b002cc2141ca86sm661424ljn.93.2023.12.12.04.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 04:36:37 -0800 (PST)
References: <20231211175023.1680247-1-mike.rudenko@gmail.com>
 <20231211175023.1680247-9-mike.rudenko@gmail.com>
 <20231211181935.GG27535@pendragon.ideasonboard.com>
User-agent: mu4e 1.10.7; emacs 29.1
From: Mikhail Rudenko <mike.rudenko@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Jacopo Mondi <jacopo@jmondi.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
Subject: Re: [PATCH 08/19] media: i2c: ov4689: Enable runtime PM before
 registering sub-device
Date: Tue, 12 Dec 2023 15:32:31 +0300
In-reply-to: <20231211181935.GG27535@pendragon.ideasonboard.com>
Message-ID: <87plzbppgq.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


On 2023-12-11 at 20:19 +02, Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

> Hi Mikhail,
>
> Thank you for the patch.
>
> On Mon, Dec 11, 2023 at 08:50:11PM +0300, Mikhail Rudenko wrote:
>> As the sensor may be accessible right after its async sub-device is
>> registered, enable runtime PM before doing so.
>
> While at it, could you also switch to runtime PM autosuspend, possibly
> in a separate patch ? See for instance the imx290 driver.

I actually had a plan to do this in this series, but it had grown a
little bigger then expected and I had to drop a few non-essential
patches, including PM autosuspend. But if you suggest, I'll bring in
back in v2.

>> Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>
>> ---
>>  drivers/media/i2c/ov4689.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/media/i2c/ov4689.c b/drivers/media/i2c/ov4689.c
>> index 2eef64cd0070..ba33b0ced532 100644
>> --- a/drivers/media/i2c/ov4689.c
>> +++ b/drivers/media/i2c/ov4689.c
>> @@ -874,16 +874,16 @@ static int ov4689_probe(struct i2c_client *client)
>>  		goto err_clean_entity;
>>  	}
>>
>> +	pm_runtime_set_active(dev);
>> +	pm_runtime_enable(dev);
>> +	pm_runtime_idle(dev);
>> +
>>  	ret = v4l2_async_register_subdev_sensor(sd);
>>  	if (ret) {
>>  		dev_err(dev, "v4l2 async register subdev failed\n");
>>  		goto err_clean_subdev;
>
> Don't you need to disable runtime PM in the error path ?

Ack, will improve error in v2.

>>  	}
>>
>> -	pm_runtime_set_active(dev);
>> -	pm_runtime_enable(dev);
>> -	pm_runtime_idle(dev);
>> -
>>  	return 0;
>>
>>  err_clean_subdev:


--
Best regards,
Mikhail Rudenko

