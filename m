Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BE5E543279
	for <lists+linux-media@lfdr.de>; Wed,  8 Jun 2022 16:25:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241225AbiFHOZo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jun 2022 10:25:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241366AbiFHOZl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Jun 2022 10:25:41 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C7B810D5E7
        for <linux-media@vger.kernel.org>; Wed,  8 Jun 2022 07:25:39 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id v14so2347235wra.5
        for <linux-media@vger.kernel.org>; Wed, 08 Jun 2022 07:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=pAzotkayrPfifnELjI7up7pZW4ty8QpI9bAYjnJ3DJA=;
        b=AtQm5R+cHC7C4IVjpxwiEYnrpW3HnoghqPO5egNxtajXkzq+05zw/3EvVx88hirng/
         gVPQQkEUCgpIVWNwJAGfdRmYZX7LESZGYhtXlYJvp9wEG1tPHLrExTL/t4MNOtfKnDtq
         Y24pPRpvV2l3dYZQ/kVTeDxdv2SYx88bHwFRrdYwXwF0Z8GTeO+Wk4UgpXyXb1Xp+/wK
         u8J5m5cPn4kt8JVL+4KIwdcwHxGMHiCDMKQO5I7p7MUGHjpA+Sfxl6fi6BC9iqtYu+qD
         utT/TFb0bWoBQ3M/KeqPK7mXNJTxiYYliVfNO1UkVxlayeaZsfZXZi8KyObVYM9xwlU0
         Kb1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=pAzotkayrPfifnELjI7up7pZW4ty8QpI9bAYjnJ3DJA=;
        b=NOn9xh3RE/Qy8BkwIb+O1YyFwQMbSf6Qiprq+4DakZUOggcCUXnDEtxHYGYhQOWw9j
         eNrds8R8+ukEQW2HVC1dV8AIGr8826d+gpPVzaVidPrNpHGb+FIUFBMVBravAK2/auIi
         nTCa4pEmh9bWfyVlgRqtar9GjZor9vfcVKNLBUbsChtBObvqiy1XdkAuMGxZRHgcCJjQ
         upCwc4PZGYg/oDg1JLrpm4awvl/mgjDGXMlxsf1fT23cE2ZBh1m8RJuW1xrBXYoyOupE
         9CHvvHSv2H8VXFjS5/6xB5rrhjR0zoaNuldMsl5xw+UB4wShUOsj5t7YGC8sDIU5Iq89
         2gMw==
X-Gm-Message-State: AOAM532EmTxRfki9e7wN4xMA1wUflzcV/Yh6+POovjVasRdeomQz+JMv
        lFRMT1ENhjehp7jgYkLoWjNHKo9HiuQ=
X-Google-Smtp-Source: ABdhPJz1MZa24Md8FAPv7aCsYSjFMzNm8JMj/XzLOOesxzqt6Tlr0+Fiq0OuBJTyA5mWxdYV/3MAfg==
X-Received: by 2002:adf:ffc7:0:b0:210:2bba:f431 with SMTP id x7-20020adfffc7000000b002102bbaf431mr34100825wrs.495.1654698337491;
        Wed, 08 Jun 2022 07:25:37 -0700 (PDT)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id h1-20020adffd41000000b002103aebe8absm21538093wrs.93.2022.06.08.07.25.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jun 2022 07:25:37 -0700 (PDT)
Message-ID: <c328e7e6-8d22-2480-38f0-f05528c548dc@gmail.com>
Date:   Wed, 8 Jun 2022 15:25:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] media: rkisp1: Don't create data links for non-sensor
 subdevs
Content-Language: en-US
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        dafna@fastmail.com, heiko@sntech.de, foss+kernel@0leil.net
References: <20220606225149.2941160-1-djrscally@gmail.com>
 <20220607164125.oabtqz6kh5bo6k6v@uno.localdomain>
From:   Daniel Scally <djrscally@gmail.com>
In-Reply-To: <20220607164125.oabtqz6kh5bo6k6v@uno.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo

On 07/06/2022 17:41, Jacopo Mondi wrote:
> Hi Dan
>
> On Mon, Jun 06, 2022 at 11:51:49PM +0100, Daniel Scally wrote:
>> With the introduction of ancillary links, not all subdevs linked to
>> the ISP's v4l2_dev necessarily represent sensors / bridges. Check the
>> function for the subdevs and skip any that represent lens or flash
>> controllers before creating data links.
>>
>> Signed-off-by: Daniel Scally <djrscally@gmail.com>
>> ---
>>
>> This should fix the issues that have been noticed, but perhaps a new flag like
>> MEDIA_ENT_FL_HAS_SOURCE or something would be a better way to denote subdevs
>> that need data links?
>>
> I agree this a bit fragile...
>
> I noticed ancillary links are only created for subdev notifiers,
> which have a populated 'sd' and consequentially an entity. Could an
> helper that walks the links of the notifier's subdev links and checks
> if the subdev at hand is already linked, help ? Maybe with an optional
> set of link flags to match on ?


Or maybe just check if the subdev's notifier is the same as the rkisp1's
notifier? Like:


if(sd->notifier!= &rkisp1->notifier)
continue
That's a bit less clunky than both other solutions I think
>
>
>>  drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
>> index 3f5cfa7eb937..e90f0216cb06 100644
>> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
>> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
>> @@ -134,6 +134,10 @@ static int rkisp1_create_links(struct rkisp1_device *rkisp1)
>>  		    sd == &rkisp1->resizer_devs[RKISP1_SELFPATH].sd)
>>  			continue;
>>
>> +		if (sd->entity.function == MEDIA_ENT_F_LENS ||
>> +		    sd->entity.function == MEDIA_ENT_F_FLASH)
>> +			continue;
>> +
>>  		ret = media_entity_get_fwnode_pad(&sd->entity, sd->fwnode,
>>  						  MEDIA_PAD_FL_SOURCE);
>>  		if (ret < 0) {
>> --
>> 2.25.1
>>
