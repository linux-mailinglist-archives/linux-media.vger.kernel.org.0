Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DE2774837C
	for <lists+linux-media@lfdr.de>; Wed,  5 Jul 2023 13:51:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231445AbjGELv0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jul 2023 07:51:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230255AbjGELvY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Jul 2023 07:51:24 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89F591736
        for <linux-media@vger.kernel.org>; Wed,  5 Jul 2023 04:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688557831;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QtvxqSe6aDAotEuGkpbuzSYO9yTCiZIRv/+eS5oFhlQ=;
        b=Edjm14zlOQ3aq9kis1nt2HW+t7BnDEi6mX7LdjKQgB4mebN6IM+KkR0aIri4JyP+pPnCRG
        jwByxXXeBtV7Sa3cvdjfBDaTtfvUob1kH4frnz9k9N8590h128KMirATdPSvecw6juOSd6
        pPGGdRON87dcj5E+tfWZb4vSgzN5N7I=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-25-k-HrqGTcOJatr0jyQhs9zw-1; Wed, 05 Jul 2023 07:50:30 -0400
X-MC-Unique: k-HrqGTcOJatr0jyQhs9zw-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-51e10990adfso1625650a12.0
        for <linux-media@vger.kernel.org>; Wed, 05 Jul 2023 04:50:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688557829; x=1691149829;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QtvxqSe6aDAotEuGkpbuzSYO9yTCiZIRv/+eS5oFhlQ=;
        b=ISw/JHMER51M7HzRuBYJGV/h9lYnJgok6OiUQ1h9gIa4Z8upgLYT+7CIOPRTYf+jgA
         7MXnh/aJejZBkrWXILpGjRWHPIs0Jc+mn6pV/EN05Rx4SEU2xqXJaHpvDQd2le9mWWRg
         RKp1LVEthsEAHZDTahM8pNvDRxQgXNsDYV8wQ+h++1dxgLCWsq5QAwNt5B6hoB78Z65n
         8aqcwtcto1joDSkKVg50IVieDbfAl+A8+sEHilNQfEimXSH63G7iKxQ62m2ntG+kxo7a
         xsnO4W+K18ntRhirdRQJ8v0Hh48ug6fp854BoYEjYfDIwjY2X0h+LNHFxzPtF20ijYFE
         NlsQ==
X-Gm-Message-State: ABy/qLZE5+wk6KJHybrQOVxmjuO6QFquWAxAr7DhlBtUuC4o95HxNuvV
        SugexIp+kjz1G7Itm9YdB4GnSuQ2o4IYtXt1iOAlgYXs4fr3IsRO8zJupkGyKGOE5TiocVIqFIR
        X3/1sLc2DwsVarywIiTzamUEgJQzsJqk=
X-Received: by 2002:a05:6402:5170:b0:51d:f37b:1b5c with SMTP id d16-20020a056402517000b0051df37b1b5cmr9751978ede.23.1688557829069;
        Wed, 05 Jul 2023 04:50:29 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEpQdQoGDACE0+A5K/TLthj2XR9P2jEBur/09R5Kp+Uk8i7rUbmqLPwaEV1bERjWbfYzkmhCQ==
X-Received: by 2002:a05:6402:5170:b0:51d:f37b:1b5c with SMTP id d16-20020a056402517000b0051df37b1b5cmr9751973ede.23.1688557828792;
        Wed, 05 Jul 2023 04:50:28 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id d10-20020a056402078a00b0051de38eb925sm7598145edy.93.2023.07.05.04.50.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jul 2023 04:50:28 -0700 (PDT)
Message-ID: <b1130616-404c-ddac-22e3-517a4440782a@redhat.com>
Date:   Wed, 5 Jul 2023 13:50:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 12/15] media: ipu-bridge: Add GalaxyCore GC0310 to
 ipu_supported_sensors[]
Content-Language: en-US, nl
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Hao Yao <hao.yao@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
        linux-media@vger.kernel.org
References: <20230630110643.209761-1-hdegoede@redhat.com>
 <20230630110643.209761-13-hdegoede@redhat.com>
 <ZKP5KIXBVaLWetVH@kekkonen.localdomain>
 <80024c5b-d35b-96ac-ff5b-1e013c3ef113@redhat.com>
 <ZKVWSzKrddTNe048@kekkonen.localdomain>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZKVWSzKrddTNe048@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 7/5/23 13:38, Sakari Ailus wrote:
> Hi Hans,
> 
> On Tue, Jul 04, 2023 at 12:59:53PM +0200, Hans de Goede wrote:
>> Hi Sakari,
>>
>> On 7/4/23 12:49, Sakari Ailus wrote:
>>> Hi Hans,
>>>
>>> On Fri, Jun 30, 2023 at 01:06:40PM +0200, Hans de Goede wrote:
>>>> The GalaxyCore GC0310 is used together with the atomisp no various
>>>> devices, add it to ipu_supported_sensors[].
>>>>
>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>> ---
>>>>  drivers/media/pci/intel/ipu-bridge.c | 2 ++
>>>>  1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
>>>> index eb7c56e8ef9f..07a34f20af8e 100644
>>>> --- a/drivers/media/pci/intel/ipu-bridge.c
>>>> +++ b/drivers/media/pci/intel/ipu-bridge.c
>>>> @@ -36,6 +36,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
>>>>  	IPU_SENSOR_CONFIG("INT3537", 1, 437000000),
>>>>  	/* Omnivision ov13b10 */
>>>>  	IPU_SENSOR_CONFIG("OVTIDB10", 1, 560000000),
>>>> +	/* GalaxyCore GC0310 */
>>>> +	IPU_SENSOR_CONFIG("INT0310", 0),
>>>
>>>
>>> Where is this HID from? A DSDT somewhere??
>>
>> This is used in many atomisp DSDTs on many atomisp devices,
>> see below for a quick grep to my no disk "database" of DSDTs.
>>
>> This is also already used by the existing gc0310 driver for
>> atomisp:
>>
>> https://git.linuxtv.org/media_stage.git/tree/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
>>
>> Note with the latest media_stage.git branch, which has
>> my "[GIT PULL] media: atomisp: Changes for 6.5-1" merged:
>>
>> https://lore.kernel.org/linux-media/4177be8a-7a77-c452-7b98-91d5e5af8e8b@redhat.com/
>>
>> The gc0310 driver is now a fully standard v4l2 driver no longer using any
>> atomisp-isms / custom API. As such I have a patch pending to move
>> it to drivers/media/i2c :
>>
>> https://lore.kernel.org/linux-media/20230525190100.130010-6-hdegoede@redhat.com/
>>
>> that patch is waiting for you to ack (or merge) it. Note if you chose to merge this
>> yourself, this should be applied on top of the latest media_stage/master
>> not on top of 6.4-rc1 .
> 
> Ack, thanks for the info.

Does this count as your Acked-by for the patch to mv gc0310.c to
drivers/media/i2c in my next media-atomisp pull-req ?

or ... ?

> This seems to be from a different range than the
> newer ones with INT34 prefix. Must be an older allocation I guess.

Right.

Regards,

Hans


