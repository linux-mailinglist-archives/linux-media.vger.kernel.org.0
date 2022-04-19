Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A33D5507C63
	for <lists+linux-media@lfdr.de>; Wed, 20 Apr 2022 00:05:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241143AbiDSWH6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Apr 2022 18:07:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358174AbiDSWHj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Apr 2022 18:07:39 -0400
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99C10646E;
        Tue, 19 Apr 2022 15:04:53 -0700 (PDT)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-e5ca5c580fso94133fac.3;
        Tue, 19 Apr 2022 15:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=shPrjvmBfJV/T7WWmKj3PU6VNSBfGA7D1G2TTbMSQOc=;
        b=m3iE7QfTea8SuwCU7MTne66RpoI5fhfi5oyRB5gGp6Uh86MOH045Jeg1wbDqeMx2jc
         QaWaCTGkMMAxpBM2eL92IehXCdHi3rjgedbPl/qLyoxmAEPGY9VKkCFENE/K9n8qK2O5
         0eG+IBzGNZ7gtGDM4p+5Gp03rflGTJljRMqAQy8ASgpra/SONXHQtq4e7NNagLMMGGN+
         P4zF/qVvfv5npn9iajA5WnBt1NsrCbDo0UA7xu9KmZC9LGgI4s8QW3JQclen9s3AZ4fm
         8EngOFPF6ObNxwY3+3v0+F9Z1W7ZSe6ReMw5R+2PmczunGkS3nFmcIftcor1wGp5tJJI
         X/Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=shPrjvmBfJV/T7WWmKj3PU6VNSBfGA7D1G2TTbMSQOc=;
        b=g37m0WM+I7VpoEwwM/bMCcVl6m5Qrqpue5ucVIFbjvPaUs1ytr/NvDqF8zb4QFiBwE
         k3LDwQKa/eDaLuh/NQv9cTd3FgpF0abizK9t3jGKRhfF6HEV/rXPKx6HMN12cWf830lW
         RstEN11vl6rL8UYmPEEpK+1TI5mYo391sBt/mSwiF0uHY6T8Z1isOtBoQ94Mq87YnSOb
         qM6JvPRDMltdZsw2RGlz5eo+BD3KNqe4pTs19i9nNCeadk4ebLfVCrcBlVnlZRz0Kh0+
         bLNzCNhb6rYO1cthXBIaPMOl/+T+92j0tMJbnjRYCYuayncGAUI1VebX5kKVSh32HLPD
         HOTA==
X-Gm-Message-State: AOAM533jsbBkMUPuRYWLiOdkBnsh7a2Vly9HXvkHqdA0AhJYCrYvEbVT
        c76CIuQibb0rIXlgQSdmKl4=
X-Google-Smtp-Source: ABdhPJw3jzGkKA3AeBbTriftNoKzUnHQIIKUyTSeFWX8QG4GRuzMycOIcIHT9nYTA9VjLH50IUw3dg==
X-Received: by 2002:a05:6870:6006:b0:e5:e6f1:5f2a with SMTP id t6-20020a056870600600b000e5e6f15f2amr317932oaa.160.1650405892044;
        Tue, 19 Apr 2022 15:04:52 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t12-20020a9d66cc000000b0060448197f6fsm5146374otm.9.2022.04.19.15.04.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Apr 2022 15:04:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <1c700e5b-5bf2-f0eb-78f3-12290fd88234@roeck-us.net>
Date:   Tue, 19 Apr 2022 15:04:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 2/5] media: v4l: ctrls: Add a control for temperature
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        linux-media@vger.kernel.org, alain.volmat@foss.st.com,
        hugues.fruchet@foss.st.com, sylvain.petinot@foss.st.com,
        dave.stevenson@raspberrypi.com, sakari.ailus@linux.intel.com,
        kieran.bingham@ideasonboard.com, linux-hwmon@vger.kernel.org,
        Ricardo Ribalda <ribalda@chromium.org>
References: <20220415111845.27130-1-benjamin.mugnier@foss.st.com>
 <20220415111845.27130-3-benjamin.mugnier@foss.st.com>
 <d4c868d5ef05f338bdc2237d9b9304077d268c8b.camel@ndufresne.ca>
 <3a4fad80-b16a-3780-a0f7-41dd6c80689e@roeck-us.net>
 <Yl8jF1KLzP6YO6t+@pendragon.ideasonboard.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <Yl8jF1KLzP6YO6t+@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 4/19/22 14:01, Laurent Pinchart wrote:
> On Tue, Apr 19, 2022 at 12:28:06PM -0700, Guenter Roeck wrote:
>> On 4/19/22 11:24, Nicolas Dufresne wrote:
>>> Hi,
>>>
>>> adding linux-hwmon in CC for a wider feedback.
>>>
>>> Le vendredi 15 avril 2022 à 13:18 +0200, Benjamin Mugnier a écrit :
>>>> Add V4L2_CID_TEMPERATURE control to get temperature from sensor in
>>>> celsius as a volatile and read-only control, and its documentation.
>>>> Useful to monitor thermals from v4l controls for sensors that support
>>>> this.
>>>
>>> Any justification to expose a temperature sensor outside of the dedicated kernel
>>> API hwmon ? I know if may makes it harder to use, as the sensor isn't bound to
>>> the camera driver, and also the sensor may not work if the camera is not
>>> streaming. But in the end, the API in hwmon does not look that complex, and is
>>> perhaps more precise ?
>>>
>>> All in all, I think we need a strong justification to implement a custom
>>> thermometer interface, something described here and documented with care to
>>> prevent abuse. I would also see opinion from folks outside of the linux-media,
>>> hence why I have CCed hwmon mailing list.
>>
>> All I can say is that this seems to be odd and a bit outside the scope of
>> v4l2. I would have expected the vgxy61 driver to register a hwmon device
>> instead.
> 
> I don't have a definitive opinion yet, but as Nicolas raised the issue
> by pushing towards hwmon, I'll offer counter-arguments for the sake of
> it :-)
> 
> The temperature sensor in the imaging sensor is used to measure the die
> temperature, in order to tune the noise and spectral response model of
> the imaging sensor. It's thus not a generic-purpose temperature sensor.
> If the feature were to be exposed through hwmon, userspace would need to
> associate an hwmon device to the imaging sensor V4L2 subdev (we have a
> way to do so through the MC API, it doesn't support hwmon at this point,
> but I suppose it could be added). There are also various constraints
> that tie the temperature reading to the imaging side, it could be that
> the temperature would only be readable while capturing frames. That's
> probably possible to handle too but returning an error from the
> temperature read.
> 
> Code-wise, both the driver and userspace would be more complex, for very
> little practical gain (I don't dispute a theorical gain).
> 

All I can say is - not my subsystem, not my call to make. If you say this
is special and is better handled in V4L2, I'll take you by your word.

Guenter
