Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77F6F6922E0
	for <lists+linux-media@lfdr.de>; Fri, 10 Feb 2023 17:02:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232920AbjBJQCU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Feb 2023 11:02:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232904AbjBJQCI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Feb 2023 11:02:08 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CA3B20565
        for <linux-media@vger.kernel.org>; Fri, 10 Feb 2023 08:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676044878;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UgRvWSSS/HZdkVKd8F3x24TtSl4QFRTT0cLIERg7rLM=;
        b=eiQ9l6zoeElucO8v0PnUs85wCx45z7tOXv9rIvoR+bAm9zVAHQGllBCJpdnDkfi4/t5F56
        EjMuDmncXhQq+j62ItxJfbTw748RkENkvRHDqXkAAvdByL5kq4QzYWhwPe+r5zD41TDBLI
        BSoL1HHxuEwy2Xl62Sg40fVxWpuiymU=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-35-pcjL6MvEPca2MDPgwAyV3Q-1; Fri, 10 Feb 2023 11:01:17 -0500
X-MC-Unique: pcjL6MvEPca2MDPgwAyV3Q-1
Received: by mail-ej1-f72.google.com with SMTP id qa17-20020a170907869100b0088ea39742c8so3853019ejc.13
        for <linux-media@vger.kernel.org>; Fri, 10 Feb 2023 08:01:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UgRvWSSS/HZdkVKd8F3x24TtSl4QFRTT0cLIERg7rLM=;
        b=yLSqKCm/CQ0/DttMHqXvTHwWH16aUC4cIDXPaFXTPAYwXkanyXWQgMMQYH0jtbXdIB
         9Obf3d85ERBbUdPmZToOcUr3ZNm+/pRwZJZ9YOENsD8ed6W99seZsJBRxPk4EyC4Jpzd
         KvJBiZPXjAqTyn2AFUkpEAIEEFpOTQNJvTEIk+8tVZi4OHrzy6oY66cClWlkgRgeOlvT
         Mn4ULShtAHMGyuFQmovLxo23Kw4uSRGuHUg6pcJNe8xRkpoc+DXYECwmYFg9PCW+7x22
         5HbVeRkp9XKvesvBTOTLGJ10aAPSJCe8P/2Im79WjfmxpsMyAoa5a/ABIISzT+rPfdv0
         hD1g==
X-Gm-Message-State: AO0yUKWNw72WBpo879OFuZpM3wvEHZ7ctwlzWaji80VzfMT6xp9T4AJU
        qXJJ6vvrpSaNGc2SId8GOcl12w/O0zWH7zCcmrQNV3Jfh89ogK22VQmWduHU8UhLBIzB01Dvs51
        C5BXPB9GkbajY3bSd8qph3NLXSFV2
X-Received: by 2002:a50:d49e:0:b0:46d:35f6:5a9b with SMTP id s30-20020a50d49e000000b0046d35f65a9bmr16935499edi.24.1676044875289;
        Fri, 10 Feb 2023 08:01:15 -0800 (PST)
X-Google-Smtp-Source: AK7set8cFaea0cXGa98GMo9HtF2UFB/0Yqym/MBvtdHiJBmrfnEmKiA9+bVjbdVDhh8mFOtRVfzErw==
X-Received: by 2002:a50:d49e:0:b0:46d:35f6:5a9b with SMTP id s30-20020a50d49e000000b0046d35f65a9bmr16935484edi.24.1676044875136;
        Fri, 10 Feb 2023 08:01:15 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id z16-20020a5096d0000000b004aad0a9144fsm2419311eda.51.2023.02.10.08.01.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 08:01:14 -0800 (PST)
Message-ID: <975bcc79-6ac1-658d-582a-cbd4ec3434b8@redhat.com>
Date:   Fri, 10 Feb 2023 17:01:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 28/57] media: Add ovxxxx_16bit_addr_reg_helpers.h
Content-Language: en-US, nl
To:     Andy Shevchenko <andy@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
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
 <Y+YlELz9C61HQE0x@pendragon.ideasonboard.com>
 <Y+ZkVlzV7qY0K4gS@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y+ZkVlzV7qY0K4gS@smile.fi.intel.com>
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

Hi Andy,

On 2/10/23 16:35, Andy Shevchenko wrote:
> On Fri, Feb 10, 2023 at 01:05:52PM +0200, Laurent Pinchart wrote:
>> On Fri, Feb 10, 2023 at 12:53:43PM +0200, Andy Shevchenko wrote:
>>> On Fri, Feb 10, 2023 at 12:47:55PM +0200, Sakari Ailus wrote:
>>>> On Fri, Feb 10, 2023 at 12:29:19PM +0200, Laurent Pinchart wrote:
>>>>> On Fri, Feb 10, 2023 at 12:21:15PM +0200, Sakari Ailus wrote:
>>>>>> On Thu, Feb 09, 2023 at 06:11:12PM +0200, Laurent Pinchart wrote:
> 
> ...
> 
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
>> How would that work ?
> 
> If I'm not mistaken, you may introduce something like regmal CCI and then
> 
> 	regmap_init_cci();
> 
> 
> 	regmap_read()/regmap_write()
> 	regmap_update_bits()
> 	regmap_bulk_*()
> 
> at your service without changing a bit in the drivers (they will use plain
> regmap APIs instead of custom ones).

regmap_bus is for low-level busses like i2c, i3c, spi, etc.

We could "abuse" this to overwrite the standard regmap read/write helpers
with bus specific ones, but then we loose the actual bus abstraction
and we would need separate regmap-cci implementations for i2c/i3c/spi.

> Again, we can extend regmap to have something like
>
>	int (*reg_width)(regmap *, offset)
>
> callback added that will tell the regmap bus underneath what size to use.
>
> In the driver one will define the respective method to return these widths.

That won't work internal helpers to marshall raw-buffers with both reg-addr
+ reg value(s) to pass to the low-level (i2c/i3c/spi) drivers use an internal
regmap.format struct which gets filled with reg-width specific info once
from __regmap_init() what you are suggesting really requires major surgery
to the whole regmap core.

CCI really is an extra protocol layer on top of lower-level / more primitive
busses and it is best to have a helper library with a few helpers using
regmap underneath to abstract the raw bus accesses away. Note this helper
library can be quite thin and small though :)

Regards,

Hans

