Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7560D614BBC
	for <lists+linux-media@lfdr.de>; Tue,  1 Nov 2022 14:29:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229691AbiKAN3A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Nov 2022 09:29:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229817AbiKAN2y (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Nov 2022 09:28:54 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D746F5AD
        for <linux-media@vger.kernel.org>; Tue,  1 Nov 2022 06:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667309277;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TuQrcuKYSmxbYTgmez/0o7iIQmKrnxkqsQehv9iqJF8=;
        b=aU22Geq+2GHoLLghJZE1+XedJtmCm+IaRPnbEA66StQPq1h/wCXZ3YVTyrS/rWIlAOuP9H
        1gZUrwGUsrP9i+L8vbYDFFGBiyt6ahjbH01bfEc12kQ5ArKF1u7Ee8JEaUn2F/qSLNrZSl
        cdqZYF4dtIerD72VUztdN7vQJhNNA40=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-294-bJngfIKqO5-rH-BCJ3j3DQ-1; Tue, 01 Nov 2022 09:27:56 -0400
X-MC-Unique: bJngfIKqO5-rH-BCJ3j3DQ-1
Received: by mail-ej1-f71.google.com with SMTP id xh12-20020a170906da8c00b007413144e87fso7802255ejb.14
        for <linux-media@vger.kernel.org>; Tue, 01 Nov 2022 06:27:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TuQrcuKYSmxbYTgmez/0o7iIQmKrnxkqsQehv9iqJF8=;
        b=HdLOLB/ZbRjBCt9/giZuZjcAwARK1zTHxXMjFqVLLH2ZoDUtwJHcONy5VqUH8OMzg8
         K5Ua1Iai7sqo3At5fw/M57KNvWpRcADUtpQmox8p2Ms0kVVtcJyGvI5v/KCmJC8YsJ5f
         49crnk2PyoqzHNdV0bqA9XMSx0820R5m8HfmDBHu8jbtuYSwRbQ6uYf1GZoCqAKFUwP1
         spwVIPA9KTnQdOgyuvDiDS71oj84FaQQKZj3JBsIX4dBJwoyw7uME0PZwzgKhPOng70l
         XwlX6hxpCi4NmXvli3iOAeS3NmpLNWnVxkyIskBlJa1px/lrIlD1LBHdcUCQ50VDdvbJ
         uv0w==
X-Gm-Message-State: ACrzQf2ZpYuavI0vRMHgTarLYu97hDEN3RQSvOE5g163Y+Rfpkkbol9n
        an7I76OpuGNNfYoh//qmXGtNKmN7T4x3wwZGRHpl++BD54/RiFXGwxtdHip11UHxS6tMpiOYt6R
        AieXMz/nXDb/hEl9ngDaZfNw=
X-Received: by 2002:a17:907:da5:b0:7ad:7e95:6513 with SMTP id go37-20020a1709070da500b007ad7e956513mr18872143ejc.442.1667309275379;
        Tue, 01 Nov 2022 06:27:55 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7G9zSldywDkzM/+VU8twoULILd9bDVUvHBmvJahcdwrQ9vJk2UsXR4+PeLwv2QQ+0RgvbxhQ==
X-Received: by 2002:a17:907:da5:b0:7ad:7e95:6513 with SMTP id go37-20020a1709070da500b007ad7e956513mr18872125ejc.442.1667309275190;
        Tue, 01 Nov 2022 06:27:55 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id v27-20020aa7cd5b000000b00458898fe90asm4554226edw.5.2022.11.01.06.27.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Nov 2022 06:27:54 -0700 (PDT)
Message-ID: <48a28601-a3eb-8735-6a15-34436dcbd73e@redhat.com>
Date:   Tue, 1 Nov 2022 14:27:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH AUTOSEL 6.0 15/34] media: atomisp-ov2680: Fix
 ov2680_set_fmt()
Content-Language: en-US, nl
To:     Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
References: <20221101112726.799368-1-sashal@kernel.org>
 <20221101112726.799368-15-sashal@kernel.org>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221101112726.799368-15-sashal@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sasha,

I have no specific objections against the backporting of this
and other atomisp related patches.

But in general the atomisp driver is not yet in a state where
it is ready to be used by normal users. Progress is being made
but atm I don't really expect normal users to have it enabled /
in active use.

As such I'm also not sure if there is much value in backporting
atomisp changes to the stable series.

I don't know if you have a way to opt out certain drivers /
file-paths from stable series backporting, but if you do
you may want to consider opting out everything under:

drivers/staging/media/atomisp/

As said above I don't think doing the backports offers
much (if any) value to end users and I assume it does take
you some time, so opting this path out might be better.

Also given the fragile state of atomisp support atm
it is hard to say for me if partially backporting some of
the changes won't break the driver.

Regards,

Hans




On 11/1/22 12:27, Sasha Levin wrote:
> From: Hans de Goede <hdegoede@redhat.com>
> 
> [ Upstream commit adea153b4f6537f367fe77abada263fde8a1f7b6 ]
> 
> On sets actually store the set (closest) format inside ov2680_device.dev,
> so that it also properly gets returned by get_fmt.
> 
> This fixes the following problem:
> 
> 1. App does an VIDIOC_SET_FMT 640x480, calling ov2680_set_fmt()
> 2. Internal buffers (atomisp_create_pipes_stream()) get allocated
>    at 640x480 size by atomisp_set_fmt()
> 3. ov2680_get_fmt() gets called later on and returns 1600x1200
>    since ov2680_device.dev was not updated. So things get configured
>    to stream at 1600x1200, but the internal buffers created during
>    atomisp_create_pipes_stream() do not get updated in size
> 4. streaming starts, internal buffers overflow and the entire
>    machine freezes eventually due to memory being corrupted
> 
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  drivers/staging/media/atomisp/i2c/atomisp-ov2680.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> index 4ba99c660681..ab52e35266bb 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> @@ -894,11 +894,7 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
>  	if (v_flag)
>  		ov2680_v_flip(sd, v_flag);
>  
> -	/*
> -	 * ret = startup(sd);
> -	 * if (ret)
> -	 * dev_err(&client->dev, "ov2680 startup err\n");
> -	 */
> +	dev->res = res;
>  err:
>  	mutex_unlock(&dev->input_lock);
>  	return ret;

