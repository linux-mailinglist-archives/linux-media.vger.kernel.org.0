Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04BD6748442
	for <lists+linux-media@lfdr.de>; Wed,  5 Jul 2023 14:34:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230049AbjGEMek (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jul 2023 08:34:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229697AbjGEMei (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Jul 2023 08:34:38 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BDC31980
        for <linux-media@vger.kernel.org>; Wed,  5 Jul 2023 05:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688560414;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nwP4/XQYZKB38nBDvpUGz0zdUu7jJxOrniFBXV4e7xE=;
        b=bCHPNTT9tSrH33QaoP1Um3CwD3TMhbzMTi+DAQR4pL7nuKgMsCK39dtfiURIoIUK7x2lyi
        Ypf329lryHSDY50a0dGD0FYNs5YoVDaUiSa/JDcS27cftECadoP+GvtHXykH2f2e1/RmLz
        TRJQKqh33lEoHlfoPFUfN20tMgBPYNU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-53-C2uULCDeM5GwrJQl-rCGaw-1; Wed, 05 Jul 2023 08:33:33 -0400
X-MC-Unique: C2uULCDeM5GwrJQl-rCGaw-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-94f7a2b21fdso545090766b.2
        for <linux-media@vger.kernel.org>; Wed, 05 Jul 2023 05:33:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688560412; x=1691152412;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nwP4/XQYZKB38nBDvpUGz0zdUu7jJxOrniFBXV4e7xE=;
        b=jIUghQ92aPi47VHYSB0A4cxHZ3/ie8iMyAj1YQ7q1mRiDsib92RCqW+Xk/wn7u7UcQ
         dTK+lniKKbKI//VlyLpMb4BUGt3UoW0ngd5N0ZbclbpWTD7z52Rjmh7QrCOW1RF3J+su
         pxdv+FnZS0OsDWOmpg0qeZDyLId5nKWCy+j2vzE6N3dA6BF8jkCPCQX7p4voMZ3s2/LS
         k/LA5yqLLNN9VdW4XFFASwqHPZj49DogIixD0Zg2RLPrSJ8j5hfw2UbO0c/lMQXbnSWk
         isCLsiWCDrBN9Xxmn9YOvNle8I3ggqwmnA9R8ktJpP7+X9TWd5FCXCxAr26Gn0bmF5kX
         OMCA==
X-Gm-Message-State: ABy/qLbFaiayhZ41MSDCWQRCWODe55Obhw2OT8d4cAveYK6oV8DQkVgv
        x0TwiZbKNFBRkXQMZPGwhFQhKNDw/8QKXuQYh2pjNq1k5538t1lKRzdpE72n2AwHETn3lIlBsI4
        K5ZhAYgBFCeBGv5a2mSSeh38=
X-Received: by 2002:a17:906:480d:b0:974:1c98:d2d9 with SMTP id w13-20020a170906480d00b009741c98d2d9mr13078144ejq.3.1688560412231;
        Wed, 05 Jul 2023 05:33:32 -0700 (PDT)
X-Google-Smtp-Source: APBJJlE5G0jbOsGu0d59aiQOOdCJqOEVrJM4SAwGqSYqr8zLepaWJZvEWg6m8DGz/Q/VmZLGP2U8vw==
X-Received: by 2002:a17:906:480d:b0:974:1c98:d2d9 with SMTP id w13-20020a170906480d00b009741c98d2d9mr13078135ejq.3.1688560411961;
        Wed, 05 Jul 2023 05:33:31 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id y27-20020a1709063a9b00b00992a9bd70dasm8679137ejd.10.2023.07.05.05.33.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jul 2023 05:33:31 -0700 (PDT)
Message-ID: <69cb4b64-ace5-029c-a368-16f3c1e59f1f@redhat.com>
Date:   Wed, 5 Jul 2023 14:33:30 +0200
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
 <b1130616-404c-ddac-22e3-517a4440782a@redhat.com>
 <ZKVdq+SWLnhWAYE6@kekkonen.localdomain>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZKVdq+SWLnhWAYE6@kekkonen.localdomain>
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

On 7/5/23 14:10, Sakari Ailus wrote:
> Hi Hans,
> 
> On Wed, Jul 05, 2023 at 01:50:27PM +0200, Hans de Goede wrote:
>> Hi,
>>
>> On 7/5/23 13:38, Sakari Ailus wrote:
>>> Hi Hans,
>>>
>>> On Tue, Jul 04, 2023 at 12:59:53PM +0200, Hans de Goede wrote:
>>>> Hi Sakari,
>>>>
>>>> On 7/4/23 12:49, Sakari Ailus wrote:
>>>>> Hi Hans,
>>>>>
>>>>> On Fri, Jun 30, 2023 at 01:06:40PM +0200, Hans de Goede wrote:
>>>>>> The GalaxyCore GC0310 is used together with the atomisp no various
>>>>>> devices, add it to ipu_supported_sensors[].
>>>>>>
>>>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>>>> ---
>>>>>>  drivers/media/pci/intel/ipu-bridge.c | 2 ++
>>>>>>  1 file changed, 2 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
>>>>>> index eb7c56e8ef9f..07a34f20af8e 100644
>>>>>> --- a/drivers/media/pci/intel/ipu-bridge.c
>>>>>> +++ b/drivers/media/pci/intel/ipu-bridge.c
>>>>>> @@ -36,6 +36,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
>>>>>>  	IPU_SENSOR_CONFIG("INT3537", 1, 437000000),
>>>>>>  	/* Omnivision ov13b10 */
>>>>>>  	IPU_SENSOR_CONFIG("OVTIDB10", 1, 560000000),
>>>>>> +	/* GalaxyCore GC0310 */
>>>>>> +	IPU_SENSOR_CONFIG("INT0310", 0),
>>>>>
>>>>>
>>>>> Where is this HID from? A DSDT somewhere??
>>>>
>>>> This is used in many atomisp DSDTs on many atomisp devices,
>>>> see below for a quick grep to my no disk "database" of DSDTs.
>>>>
>>>> This is also already used by the existing gc0310 driver for
>>>> atomisp:
>>>>
>>>> https://git.linuxtv.org/media_stage.git/tree/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
>>>>
>>>> Note with the latest media_stage.git branch, which has
>>>> my "[GIT PULL] media: atomisp: Changes for 6.5-1" merged:
>>>>
>>>> https://lore.kernel.org/linux-media/4177be8a-7a77-c452-7b98-91d5e5af8e8b@redhat.com/
>>>>
>>>> The gc0310 driver is now a fully standard v4l2 driver no longer using any
>>>> atomisp-isms / custom API. As such I have a patch pending to move
>>>> it to drivers/media/i2c :
>>>>
>>>> https://lore.kernel.org/linux-media/20230525190100.130010-6-hdegoede@redhat.com/
>>>>
>>>> that patch is waiting for you to ack (or merge) it. Note if you chose to merge this
>>>> yourself, this should be applied on top of the latest media_stage/master
>>>> not on top of 6.4-rc1 .
>>>
>>> Ack, thanks for the info.
>>
>> Does this count as your Acked-by for the patch to mv gc0310.c to
>> drivers/media/i2c in my next media-atomisp pull-req ?
>>
>> or ... ?
> 
> Can I take the set once others think it's good? I have Wentong's patch that
> goes on top.

Yes you can and I'm expecting you to take this set, the question about if
your "Ack" as your Acked-by is about:

https://lore.kernel.org/linux-media/20230525190100.130010-6-hdegoede@redhat.com/

which is not part of the set.

I hope this helps clarify our little mis-communication which we seem to
be heaving here.

Regards,

Hans


