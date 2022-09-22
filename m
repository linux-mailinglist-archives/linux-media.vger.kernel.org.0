Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B1855E702E
	for <lists+linux-media@lfdr.de>; Fri, 23 Sep 2022 01:19:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231207AbiIVXTK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Sep 2022 19:19:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231191AbiIVXTJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Sep 2022 19:19:09 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE3DD113B69;
        Thu, 22 Sep 2022 16:19:07 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id r7so17868913wrm.2;
        Thu, 22 Sep 2022 16:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=8uhPqOrfjysnBUjv9rcl6zI7kqDh5LY+B9Rn4U3xa1Y=;
        b=guFLIKpbF8vNRR2J3mbkUGVdUlCOXoCrQ53OfhXaBo3bonRV1WziHOENaLxggwtgrX
         K+BL+BgqohSPYRIu/VZ5S6Fy5UzokIqIKUBZJsuygz1v53Zkw5k64OnupiGcZKu12X44
         vljWpPPTJGVSs9Ts1zwOnalV9pbC9SsckvQR2DJfl9cl9Xur4OHocAh+owuFMaaX+J+x
         4tV5XyC6qm7anwlbKfDMj5Cb18UQEFbhIogiI9LVXlEq4GqmBFMx8F9Mng++Z8o/Nu5/
         Sl2BcUP3pdKwMLyq0eTDV491frwOebEscDTkoR6fnc9D/GEmJxOa7QXNsxHb7Iajyern
         rBOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=8uhPqOrfjysnBUjv9rcl6zI7kqDh5LY+B9Rn4U3xa1Y=;
        b=6I0WaMuV9IlXQNB4xZnmugXm2WJ0uAJoGMal+GROmLMqfBk65+9h02jzDq0zUtzj5t
         FMW/NdI/108qa3GPUky5KzO8TjXfMQYEYzBavfQ6zzmsA+cXJR08sZo+GtVYSw4ueO0I
         at0eWGN/SGXaC9OeVEyVIUFLbTcVUBw1FAvl89DpBXkj3t8vA6Xr/iv/SHSvAzZnDSyq
         QV4OYTvmNE85iFNKuDMDLecTaANeNOiUGv2neLpH5s5VoyVQZRx6RHHMKBOmNg7yQFs5
         fEUb05mFI9Ren4geIhF6ffrqDKOrmTTHIZbcKvH9ZEIXY4KZbmSMaHR66+I+0mbRS5RN
         82bg==
X-Gm-Message-State: ACrzQf3NmkJv7q15PrCWjlA4HRfnsuFvPr61pTcQO0Og2S8suglDd/lG
        R6eCTtZkwjCQCfsPwNXEt8A=
X-Google-Smtp-Source: AMsMyM400WKsar20IojFGGqtrLbE7AKT9tpsOvVH6y6YSMD4V9IHd8mxORyRRIn+3CO09XmuHtH3Qw==
X-Received: by 2002:a05:6000:114b:b0:228:ab76:fa00 with SMTP id d11-20020a056000114b00b00228ab76fa00mr3304082wrx.628.1663888746364;
        Thu, 22 Sep 2022 16:19:06 -0700 (PDT)
Received: from [192.168.0.30] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id bv4-20020a0560001f0400b00228d6bc8450sm6080018wrb.108.2022.09.22.16.19.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 16:19:05 -0700 (PDT)
Message-ID: <5764c9f8-c335-9c73-07fb-f44def8a0be8@gmail.com>
Date:   Fri, 23 Sep 2022 00:19:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] media: v4l2-async: Use endpoints in
 __v4l2_async_nf_add_fwnode_remote()
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@iki.fi>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org,
        'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
References: <20220321145134.29820-1-laurent.pinchart@ideasonboard.com>
 <CGME20220922140658eucas1p29f9d609e795ed064e51694c0e7be80d3@eucas1p2.samsung.com>
 <083edac1-8a8f-d842-e496-b657b4e4014e@samsung.com>
 <YyzmPWQ7vtigUxBI@valkosipuli.retiisi.eu>
From:   Daniel Scally <djrscally@gmail.com>
In-Reply-To: <YyzmPWQ7vtigUxBI@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all

On 22/09/2022 23:48, Sakari Ailus wrote:
> Hi, Marek!
>
> Good to hear from you! And it's so nice you're testing the Samsung Exynos
> drivers! :-)
>
> On Thu, Sep 22, 2022 at 04:06:58PM +0200, Marek Szyprowski wrote:
>> Hi Laurent,
>>
>> On 21.03.2022 15:51, Laurent Pinchart wrote:
>>> From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>>>
>>> Matching on device fwnode handles is deprecated in favour of endpoint
>>> fwnode handles. Switch the __v4l2_async_nf_add_fwnode_remote() function
>>> to use the latter. The match code handles backward compatibility by
>>> falling by to the device fwnode handle, so this shouldn't introduce any
>>> regression.
>>>
>>> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>> I love the last sentence of the patch description. :)
>>
>> Unfortunately, recently I found that this patch breaks Exynos4 IS (FIMC)
>> driver operation on Trats2 board (exynos4412-trats2.dts). After merging
>> this patch I see the following errors related to the camera sensors:
>>
>> [   16.038705] S5C73M3: S5C73M3 SPI probed successfully
>> [   16.097399] S5C73M3: Sensor type: CML0801-M017, FW version: GDFD01
>> [   16.106842] S5C73M3 0-003c: Consider updating driver S5C73M3 to match
>> on endpoints
>> [   16.298323] S5C73M3: probe of 0-003c failed with error -22
>> [   16.343173] S5K6A3 15-0010: Consider updating driver S5K6A3 to match
>> on endpoints
>> [   16.434968] S5K6A3: probe of 15-0010 failed with error -22
> Have you checked what exactly caused the probe to fail? Laurent's patch
> changes how matching works but if that fails, the result should be a bunch
> of waiting async sub-devices and notifier(s), not a failure on probe.


Might be some other effects too...I can't test it but in 
subdev_notifier_bound() in 
drivers/media/platform/samsung/exynos4-is/media-dev.c there's the 
following check:


     /* Find platform data for this sensor subdev */
     for (i = 0; i < ARRAY_SIZE(fmd->sensor); i++)
         if (fmd->sensor[i].asd &&
             fmd->sensor[i].asd->match.fwnode ==
             of_fwnode_handle(subdev->dev->of_node))
             si = &fmd->sensor[i];

     if (si == NULL)
         return -EINVAL;


And I think following that patch of Laurent's asd->match.fwnode will 
never be the dev->of_node anymore, because it's now the endpoint that's 
assigned as asd->match.fwnode rather than that of the device. That will 
return -EINVAL for the notifier's .bound() callback...I'm not sure if 
that would cause the whole probe to fail, but thought it might be worth 
mentioning :)

>
>> I'm a bit puzzled, because I don't see anything related to endpoint
>> matching in the sensor drivers. Instead I only found that
>> v4l2_async_nf_add_fwnode_remote() function (which is modified by this
>> patch) is called from the
>> drivers/media/platform/samsung/exynos4-is/media-dev.c code. Do you have
>> any idea what is broken after this change? Could you help fixing this issue?
> You can assign the endpoint node to subdev->fwnode instead of the device
> fwnode. No regular sensor driver appears to be doing that though.
>
