Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89BB5691ECC
	for <lists+linux-media@lfdr.de>; Fri, 10 Feb 2023 13:02:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231673AbjBJMCp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Feb 2023 07:02:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231540AbjBJMCo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Feb 2023 07:02:44 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AB063595
        for <linux-media@vger.kernel.org>; Fri, 10 Feb 2023 04:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676030508;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xLqg7zGpbg7c0CojGNhQfZYPBNbn/bNKHuOTRhAV03E=;
        b=DGQaPNHwhlbpmjQDbMGltQYp052UALmFRNCssTXb8x6e10neaG6cNlD23lekFffSA6TUqg
        iKe0nkmPshu4Fa8d222/BYqHwQX7n7yx4IVNXh3N39rzTf81HT5QLzkpqfsBUPsYjgiRdK
        NFRvUBzd3dUamhUY1R17rqO3chAcHxg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-633-Iy-IXihVN_OGX_02UvUkqA-1; Fri, 10 Feb 2023 07:01:46 -0500
X-MC-Unique: Iy-IXihVN_OGX_02UvUkqA-1
Received: by mail-ed1-f71.google.com with SMTP id q6-20020a056402518600b004ab0e2d02e5so3388845edd.3
        for <linux-media@vger.kernel.org>; Fri, 10 Feb 2023 04:01:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xLqg7zGpbg7c0CojGNhQfZYPBNbn/bNKHuOTRhAV03E=;
        b=6EISNXQGU8DWtxJH8SQEJ+fLHnKOHnbB8QZuS8crGlRs4SZzWGDQkTjan9vS0hvuL6
         EAfjpTlx4QIeV77w3EL54Nsow3BORPkw8k55eYFA6lyGoaO0Y4ztxFeHEiVxa6PI7/AY
         sYYivxOeQyXc73+bgIGpKkAhMrFPyNwADPCrAyXoL33GyTW3FTEuSBl8D+gRbmD8F1Pv
         Q259r22Yi7z4vr6+qEOcxoendVI0c+ggKli9L7yLOXBAiAMbkwUYvmtnF8GU9D/gmBYa
         Zf9sa5HVNMey+4hvg7a25kuXSoI6DPNiIX8waCSK37a2lPDjq0+lkNeki5YDQH5/KaoV
         O2AA==
X-Gm-Message-State: AO0yUKUSFH/6Nbm7Hi1gqK3UC2zz0r8SRBLE9/L9uk91Nxh6fGYzaFrq
        gCbLWn4b/6Vt7sXq4goyCX8I2CN0brtytnpcnPniBx0n5nlukAhD+GALeCQXm526fRx7oda2qtA
        u641SoERcrl6wsvY1JJj9lCg=
X-Received: by 2002:a50:a6cf:0:b0:4ab:26a0:9a35 with SMTP id f15-20020a50a6cf000000b004ab26a09a35mr2814155edc.39.1676030505299;
        Fri, 10 Feb 2023 04:01:45 -0800 (PST)
X-Google-Smtp-Source: AK7set8o5uzlUXFrxz8Rh4G0jYSDIbj+N39v2CLOSwOxpn0JauM//xtu/jxLJiowWdfvWt72nuj/WQ==
X-Received: by 2002:a50:a6cf:0:b0:4ab:26a0:9a35 with SMTP id f15-20020a50a6cf000000b004ab26a09a35mr2814141edc.39.1676030505080;
        Fri, 10 Feb 2023 04:01:45 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id q21-20020a50aa95000000b0049622a61f8fsm2117683edc.30.2023.02.10.04.01.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 04:01:44 -0800 (PST)
Message-ID: <e958e97b-2cf7-bf97-d79e-dc05bc61190c@redhat.com>
Date:   Fri, 10 Feb 2023 13:01:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 28/57] media: Add ovxxxx_16bit_addr_reg_helpers.h
Content-Language: en-US, nl
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Andy Shevchenko <andy@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-29-hdegoede@redhat.com>
 <Y+Nw32EZUZtq3esL@pendragon.ideasonboard.com>
 <026272d3-88d7-a67f-4942-5cba6c3eab86@redhat.com>
 <Y+UbIAVQZ5U0/U5U@pendragon.ideasonboard.com>
 <Y+YamxehIUdF5aU7@kekkonen.localdomain>
 <Y+Ycf4SpMaUfdR5m@pendragon.ideasonboard.com>
 <Y+Yg217HSEi4c+mP@kekkonen.localdomain> <Y+YiNyC7TeOEn/Hi@smile.fi.intel.com>
 <974597c0-1614-97d5-d933-e52bb1a062ab@redhat.com>
 <Y+Yr8dOcDptuUe4D@pendragon.ideasonboard.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y+Yr8dOcDptuUe4D@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 2/10/23 12:35, Laurent Pinchart wrote:
> On Fri, Feb 10, 2023 at 12:19:30PM +0100, Hans de Goede wrote:
>> Hi,
>>
>> On 2/10/23 11:53, Andy Shevchenko wrote:
>>> On Fri, Feb 10, 2023 at 12:47:55PM +0200, Sakari Ailus wrote:
>>>> On Fri, Feb 10, 2023 at 12:29:19PM +0200, Laurent Pinchart wrote:
>>>>> On Fri, Feb 10, 2023 at 12:21:15PM +0200, Sakari Ailus wrote:
>>>>>> On Thu, Feb 09, 2023 at 06:11:12PM +0200, Laurent Pinchart wrote:
>>>
>>> ...
>>>
>>>>>> I took a look at this some time ago, too, and current regmap API is a poor
>>>>>> fit for CCI devices. CCI works on top of e.g. both I²C and I3C so something
>>>>>> on top of regmap is a better approach indeed.
>>>>>
>>>>> I'm confused, is regmap a poor fit, or a better approach ?
>>>>
>>>> I'm proposing having something on top of regmap, but not changing regmap
>>>> itself.
>>>
>>> I don't understand why we can't change regmap? regmap has a facility called
>>> regmap bus which we can provide specifically for these types of devices. What's
>>> wrong to see it done?
>>
>> It is fairly easy to layer the few 16 and 24 bit register accesses over
>> a standard regmap with 16 bit reg-address and 8 bit reg-data width using
>> regmap_bulk_write() to still do the write in e.g. a single i2c-transfer.
> 
> I think we could also use regmap_raw_write().
> 
>> So if we want regmap for underlying physical layer independence, e.g.
>> spi / i2c / i3c. we can just use standard regmap with a 
>> cci_write_reg helper on top.
> 
> Agreed. We can start experimenting with this, and if somebody has use
> cases outside of the camera sensor drivers space, we could later move
> those helpers to regmap.
> 
>> I think that would be the most KISS solution here. One thing to also keep
>> in mind is the amount of work necessary to convert existing sensor drivers.
>> Also keeping in mind that it is not just the in tree sensor drivers, but
>> also all out of tree sensor drivers which I have seen use similar constructs.
> 
> If this was the only issue to handle when porting drivers to mainline
> and upstreaming them, I'd be happy :-)

True :) The amount of churn on the stating atomisp sensor drivers which
(the few which I have been working on so far) is quite big and that is just
inching them closer to being mainline ready.

>> Requiring drivers to have a list / array of structs of all used register
>> addresses + specifying the width per register address is not going to scale
>> very poorly wrt converting all the code out there and I'm afraid that
>> letting regmap somehow deal with the register-width issue is going to
>> require something like this.
> 
> Did you mean "not going to scale very well" ? I'm not sure to understand
> what you mean here.

Yes my bad I meant to write "not going to scale very well".

I think that having to pass these kinda long lists of registers with
regmap already when you want to use caching (and need to specify volatile
registers which cannot be cached) is a bit of a pain of using regmap (*)

Regards,

Hans


*) Not that I have a better solution for e.g. the volatile registers thing,
it just causes a lot of what feels like boilerplate code

