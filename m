Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 494AB731345
	for <lists+linux-media@lfdr.de>; Thu, 15 Jun 2023 11:12:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245504AbjFOJML (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Jun 2023 05:12:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245563AbjFOJMH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Jun 2023 05:12:07 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CA012683
        for <linux-media@vger.kernel.org>; Thu, 15 Jun 2023 02:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686820285;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3tR9dTAVJON9WjlpsNwz36ogssIzptMu2ktCE2N4uao=;
        b=YkRN8HgTtayUTZlJIKbe6N4hPp2ayTlhWgMMkxQYm6zdYIiLvErc/91YnjmQJHYXhHLRfY
        dObAvn0lVmorKzy6+/J3S8rqRvg/D/d9on92WOPmJLmqYByKX1dZpZWfFDLKLnJN72W3WQ
        zFSiX7HcAXyrizeljWB12oZS4YeTX+8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-306-BqG6mMXeOZyOCyuX__mKPA-1; Thu, 15 Jun 2023 05:11:24 -0400
X-MC-Unique: BqG6mMXeOZyOCyuX__mKPA-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-94a34d3e5ebso131972466b.3
        for <linux-media@vger.kernel.org>; Thu, 15 Jun 2023 02:11:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686820283; x=1689412283;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3tR9dTAVJON9WjlpsNwz36ogssIzptMu2ktCE2N4uao=;
        b=Y+MRa24xORQ7eStNOIaQbIEQA2hoinIy8I0LUrnw12JRJUlJAVyqWhu4ycUHf6p77S
         RySz4R+gPV7d1sn/iL8ut45mxHBLaIcdM7tlgjYIsJVZY8vsT1re0Z/zhHwQhYhVCjYe
         WGECDY2OAELZlfPfDsq6Rf0QZrHhrNTZlU6uk1MR29mkIbIXjn1OPKCSv6n5w93eD9Qf
         dLbc33Pq2ZTeZfrqVpE8H3bo6lccwC68ECnHkj6MA9t+/rDlte2aLKdWM6u70c983ukq
         7qogZM4jWOl7OSLPVQFtktJlizHKBm8gmUHWqDGLQRi3XohYjWDEWNdGKBe9sbGAHxfv
         wMiA==
X-Gm-Message-State: AC+VfDzGylBV4+90LU6+ndcxrx4/Me4NlzSgU+Zrg+V3g5FUnDkyTUjT
        oJEJREVOgNub20YGw560MtvJR9ZyLPlcwknApUdns2l7yXS0FxQlDuqQg8N4IrhIF+5L4mSYiKD
        AK1LbOSKTP6mqgSPmeGIRQTQ=
X-Received: by 2002:a17:907:3605:b0:973:daa0:315 with SMTP id bk5-20020a170907360500b00973daa00315mr16427010ejc.1.1686820282894;
        Thu, 15 Jun 2023 02:11:22 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ45HEhCG6qZFLJqUVL7T9uZ+Niy4+xAr/njLm32/es761IFlqGD/33rzsLsemzkRno12nF6lw==
X-Received: by 2002:a17:907:3605:b0:973:daa0:315 with SMTP id bk5-20020a170907360500b00973daa00315mr16426993ejc.1.1686820282537;
        Thu, 15 Jun 2023 02:11:22 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id f13-20020a170906494d00b0097461fecc91sm9031776ejt.81.2023.06.15.02.11.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jun 2023 02:11:21 -0700 (PDT)
Message-ID: <b8e5f3f7-d82d-390b-ac63-824a42c3f6cd@redhat.com>
Date:   Thu, 15 Jun 2023 11:11:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 1/5] media: Add MIPI CCI register access helper
 functions
Content-Language: en-US, nl
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        linux-media@vger.kernel.org
References: <20230614192343.57280-1-hdegoede@redhat.com>
 <20230614192343.57280-2-hdegoede@redhat.com>
 <ZIolnOxs29H8EUmC@kekkonen.localdomain>
 <20230614213429.GA28757@pendragon.ideasonboard.com>
 <ZIo1kHgYMK84iMj7@kekkonen.localdomain>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZIo1kHgYMK84iMj7@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On 6/14/23 23:48, Sakari Ailus wrote:
> Hi Laurent,
> 
> On Thu, Jun 15, 2023 at 12:34:29AM +0300, Laurent Pinchart wrote:
>> Hello,
>>
>> On Wed, Jun 14, 2023 at 08:39:56PM +0000, Sakari Ailus wrote:
>>> On Wed, Jun 14, 2023 at 09:23:39PM +0200, Hans de Goede wrote:
>>>> The CSI2 specification specifies a standard method to access camera sensor
>>>> registers called "Camera Control Interface (CCI)".
>>>>
>>>> This uses either 8 or 16 bit (big-endian wire order) register addresses
>>>> and supports 8, 16, 24 or 32 bit (big-endian wire order) register widths.
>>>>
>>>> Currently a lot of Linux camera sensor drivers all have their own custom
>>>> helpers for this, often copy and pasted from other drivers.
>>>>
>>>> Add a set of generic helpers for this so that all sensor drivers can
>>>> switch to a single common implementation.
>>>>
>>>> These helpers take an extra optional "int *err" function parameter,
>>>> this can be used to chain a bunch of register accesses together with
>>>> only a single error check at the end, rather then needing to error
>>>> check each individual register access. The first failing call will
>>>> set the contents of err to a non 0 value and all other calls will
>>>> then become no-ops.
>>>>
>>>> Link: https://lore.kernel.org/linux-media/59aefa7f-7bf9-6736-6040-39551329cd0a@redhat.com/
>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>> ---
>>>> Changes in v2:
>>>> - Drop cci_reg_type enum
>>>> - Make having an encoded reg-width mandatory rather then using 0 to encode
>>>>   8 bit width making reg-addresses without an encoded width default to
>>>>   a width of 8
>>>> - Add support for 64 bit wide registers
>>
>> I'm in two minds about this. This means that the read and write
>> functions take a u64 argument, which will be less efficient on 32-bit
>> platforms. I think it would be possible, with some macro magic, to
>> accept different argument sizes, but maybe that's a micro-optimization
>> that would actually result in worse code. 
>>
>> 64-bit support could be useful, but as far as I can tell, it's not used
>> in this series, so maybe we could leave this for later ?
> 
> I prefer to have it now, I just told Tommaso working on the Alvium driver
> to use this, and he needs 64-bit access. :-)
> 
> You could also easily have 32-bit and 64-bit variant of the functions, with
> C11 _Generic(). Introducing it now would be easier than later.

I took a quick look at C11 _Generic() and that looks at the type
of "things" so in this case it would look at type of the val argument.

Problem is that that can still be e.g. an int when doing a
read/write from a 64 bit registers.

So we would then need to handle the 64 bit width case in the 32
bit versions of the functions too.

And likewise I can see someone passing a long on a 64 bit
arch while doing a cci_write() to a non 64 bit register.

So this would basically mean copy and pasting cci_read()
+ cci_write() 2x with the only difference being one
variant taking a 32 bit val argument and the other a
64 bit val argument.

This seems like premature optimization to me.

As mentioned in my reply to Laurent if we want to
optimize things we really should look at avoiding
unnecessary i2c transfers, or packing multiple
writes into a single i2c transfer for writes to
subsequent registers. That is where significant
speedups can be made.

Regards,

Hans

