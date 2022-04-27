Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BB05512230
	for <lists+linux-media@lfdr.de>; Wed, 27 Apr 2022 21:09:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232870AbiD0TNI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Apr 2022 15:13:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232613AbiD0TM7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Apr 2022 15:12:59 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 231886A072
        for <linux-media@vger.kernel.org>; Wed, 27 Apr 2022 12:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651086211;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qYOHS/bPUJa4xiruFIceJnkSB0OrO92/ZTjfoRYGEjg=;
        b=OIgYJ1U1bYdimuZHZoXiuwsKgRTtzHhRjIhNJgIUmpUJbO00jz6WR8ePnAIMffBoiZUcob
        rL9CC8zAF6EOWa6not21as6C+Csl/ArZD4RsdwRyRVR20tjZp/ZB88xchVvjl2X3DESEZT
        7DsU8twoIclahWUg3aoHcxu054IbnPg=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-115-ZcRoWMdpNm2VnCq90SVHyw-1; Wed, 27 Apr 2022 15:03:26 -0400
X-MC-Unique: ZcRoWMdpNm2VnCq90SVHyw-1
Received: by mail-qt1-f199.google.com with SMTP id cf23-20020a05622a401700b002f35b28fd73so1742913qtb.12
        for <linux-media@vger.kernel.org>; Wed, 27 Apr 2022 12:03:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=qYOHS/bPUJa4xiruFIceJnkSB0OrO92/ZTjfoRYGEjg=;
        b=SsNRBwffBpwi7TxLKubGviRIP8aEQSln2w4bU7M0fsckVkcGZ/LUji4+NEwKBxHPkE
         HgqraIFL37K2ivla08TqFx79yZ4cBhFK5GwPNYb7UF63RlxNIdhZt+L1F/VcsCZ20nj8
         ZMceIXXEcPZybElhNyMgQUP0HjB8cU5/XAXPvP6/jfVSfHyBaldOgtCUGEojSRLWVpW1
         BBahJ0kMUWRWxb9tBalN5LFbzW1gSShq30dvM5yfJfi+VQOkoHpoI14p4vH+FknUyknH
         CyZGfGU5SrJ4y3IPmFuwC3pPjeVJDSTn3xyUvPHYqyB0wcei4lqn01Alz3tx6N6efTnE
         H9jQ==
X-Gm-Message-State: AOAM531g+sC0qrTjrSR0ZPfM06W/0cEgYwgEKdym+1W91Ze6myZxXtFG
        7J8n/ufz9yWT32p7IoKuDxwg6MqWugVyqBxa9hLMj7V4HAyiN8SekcaKMv5XZJfGzXB9SNKPEkY
        i24hCcdkJ0CSzBP3buBYFHhQ=
X-Received: by 2002:a0c:b381:0:b0:443:e12c:141c with SMTP id t1-20020a0cb381000000b00443e12c141cmr20804859qve.117.1651086206328;
        Wed, 27 Apr 2022 12:03:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNgvifKSloUMCmReQvhR7oDL2bBXw6vlPEcnZTb01sGXkZ0OpuL/VhMRP7lXR2+vix3+dglw==
X-Received: by 2002:a0c:b381:0:b0:443:e12c:141c with SMTP id t1-20020a0cb381000000b00443e12c141cmr20804837qve.117.1651086206122;
        Wed, 27 Apr 2022 12:03:26 -0700 (PDT)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id i123-20020a378681000000b0069c73915781sm8489085qkd.120.2022.04.27.12.03.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Apr 2022 12:03:25 -0700 (PDT)
Subject: Re: [PATCH] media: stkwebcam: move stk_camera_read_reg() scratch
 buffer to struct stk_camera
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>, mchehab@kernel.org,
        cai.huoqing@linux.dev, paskripkin@gmail.com, xose.vazquez@gmail.com
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220312173049.1410977-1-trix@redhat.com>
 <8cab70e2-cd3f-da75-9e6a-1d63e33e6e24@xs4all.nl>
From:   Tom Rix <trix@redhat.com>
Message-ID: <f4b83fc9-f4b8-f9d5-43d6-61decc497e07@redhat.com>
Date:   Wed, 27 Apr 2022 12:03:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <8cab70e2-cd3f-da75-9e6a-1d63e33e6e24@xs4all.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 4/26/22 10:38 PM, Hans Verkuil wrote:
> Hi Tom,
>
> On 12/03/2022 18:30, trix@redhat.com wrote:
>> From: Tom Rix <trix@redhat.com>
>>
>> In stk_camera_read_reg() a single byte buffer is alloc-ed and
>> freed on every function call.  Since the size is known,
>> move the buffer to the struct stk_camera where it will be alloc-ed
>> and freed once.
> I read the replies to this patch, but I am not certain if you still want
> this patch to be merged, or will make a v2. I have no problem applying this
> patch as-is, but I just want to have confirmation that there won't be a v2.

Merged as-is is fine.

Thanks

Tom


>
> Regards,
>
> 	Hans
>
>> Signed-off-by: Tom Rix <trix@redhat.com>
>> ---
>>   drivers/media/usb/stkwebcam/stk-webcam.c | 11 ++---------
>>   drivers/media/usb/stkwebcam/stk-webcam.h |  2 ++
>>   2 files changed, 4 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/media/usb/stkwebcam/stk-webcam.c b/drivers/media/usb/stkwebcam/stk-webcam.c
>> index 5b822214ccc5c..787edb3d47c23 100644
>> --- a/drivers/media/usb/stkwebcam/stk-webcam.c
>> +++ b/drivers/media/usb/stkwebcam/stk-webcam.c
>> @@ -150,25 +150,18 @@ int stk_camera_write_reg(struct stk_camera *dev, u16 index, u8 value)
>>   int stk_camera_read_reg(struct stk_camera *dev, u16 index, u8 *value)
>>   {
>>   	struct usb_device *udev = dev->udev;
>> -	unsigned char *buf;
>>   	int ret;
>>   
>> -	buf = kmalloc(sizeof(u8), GFP_KERNEL);
>> -	if (!buf)
>> -		return -ENOMEM;
>> -
>>   	ret = usb_control_msg(udev, usb_rcvctrlpipe(udev, 0),
>>   			0x00,
>>   			USB_DIR_IN | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
>>   			0x00,
>>   			index,
>> -			buf,
>> +			&dev->read_reg_scratch,
>>   			sizeof(u8),
>>   			500);
>>   	if (ret >= 0)
>> -		*value = *buf;
>> -
>> -	kfree(buf);
>> +		*value = dev->read_reg_scratch;
>>   
>>   	if (ret < 0)
>>   		return ret;
>> diff --git a/drivers/media/usb/stkwebcam/stk-webcam.h b/drivers/media/usb/stkwebcam/stk-webcam.h
>> index 14519e5308b18..136decffe9ced 100644
>> --- a/drivers/media/usb/stkwebcam/stk-webcam.h
>> +++ b/drivers/media/usb/stkwebcam/stk-webcam.h
>> @@ -105,6 +105,8 @@ struct stk_camera {
>>   	struct list_head sio_avail;
>>   	struct list_head sio_full;
>>   	unsigned sequence;
>> +
>> +	u8 read_reg_scratch;
>>   };
>>   
>>   #define vdev_to_camera(d) container_of(d, struct stk_camera, vdev)

