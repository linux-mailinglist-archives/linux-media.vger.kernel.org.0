Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63F307DE3C4
	for <lists+linux-media@lfdr.de>; Wed,  1 Nov 2023 16:37:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233951AbjKAP3J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Nov 2023 11:29:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233321AbjKAP3I (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Nov 2023 11:29:08 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFE3710F
        for <linux-media@vger.kernel.org>; Wed,  1 Nov 2023 08:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1698852494;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lB8efkoIu7naw2pUqaZxoOIfRsGPmnYRF6F6A/RzB70=;
        b=b8VwCwRLsRTRTuyY9WbqcqMleLVyfGlPEzDOz3+Y7l1rOjpFngOUpvAu28Dci0aLiTP/wo
        dJHXA0ASgAeP/vVj/BzK1XaPZH2tdxU1hlDAvrfrtQJzIJ4tTk+/NwVA0RNFzvUp5w4iWp
        9Z5j+o/piQOK9t2dmv+BB7ga2PAdjMg=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-225-eHKcJWLrO7K9vC77rWY6lw-1; Wed, 01 Nov 2023 11:28:13 -0400
X-MC-Unique: eHKcJWLrO7K9vC77rWY6lw-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-543298e3cc8so2642929a12.3
        for <linux-media@vger.kernel.org>; Wed, 01 Nov 2023 08:28:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698852492; x=1699457292;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lB8efkoIu7naw2pUqaZxoOIfRsGPmnYRF6F6A/RzB70=;
        b=PFM6TTz3WmER8ybqc0sTMwFiCNgdUhnglyJGXIOoiN6yvuGg+dIlez76BVQ0rTAbw6
         q0Cut/eqNpUW7IkTM4Q76ziiK6364Rn+wovkRmA89RjeHkgS0O7Tl28vkOZIqI0WMkLY
         FWWfbBPj7uuCfO1xwjB0aEOnnxnwDJy2fk5xb1fGqRxEN/6Jx8VS5xKc4i4u26HqYwf6
         M1sV8jI8q5HMQuA+dSsJvpm2JTa9F+YbrHZyWChGIEpFO1NAzVMMgRYKdUTexoaHB8xv
         yfSSxU6fAacr9dhMeU9Q6wZvMVyoxbnLxXavzbRdSWDUhsQRK35pwi+3keyYJUmLcEBm
         XjIQ==
X-Gm-Message-State: AOJu0YxIg/UZ3OA7x3qUJLVbnefwJiWzL9rqEvkB+ysIYXPkNv+8QR7y
        xKSn/qCSAxGn/QnBhL2MKYEqWNo3d+f9d7NPG6unDUvid0619VAe+6/4N6GMtTATlI6hRqYKx33
        58gOO1hTMufQ5R9fL8wMHDaY=
X-Received: by 2002:a17:907:720b:b0:9b2:fa55:5794 with SMTP id dr11-20020a170907720b00b009b2fa555794mr1900809ejc.58.1698852492369;
        Wed, 01 Nov 2023 08:28:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnOZGW38VZx/jzAFVLdEwLJYNI03pfozbb/pEn2Qgpna5qp33Y1EtJWEmMJBR2+xoGafH2cg==
X-Received: by 2002:a17:907:720b:b0:9b2:fa55:5794 with SMTP id dr11-20020a170907720b00b009b2fa555794mr1900799ejc.58.1698852491980;
        Wed, 01 Nov 2023 08:28:11 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id gw7-20020a170906f14700b009a1a653770bsm54232ejb.87.2023.11.01.08.28.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Nov 2023 08:28:11 -0700 (PDT)
Message-ID: <3c254be6-00cb-0130-9f84-7e2c31df3037@redhat.com>
Date:   Wed, 1 Nov 2023 16:28:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC] regmap_range_cfg usage with v4l2-cci
Content-Language: en-US, nl
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Sebastian Reichel <sre@kernel.org>,
        "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>
References: <20231030173637.GA2977515@gnbcxd0016.gnb.st.com>
 <962d6d0c-2263-fe59-011c-09068a6a4cef@redhat.com>
 <20231031170530.GA2989927@gnbcxd0016.gnb.st.com>
 <1d3f2440-6572-4311-893e-952562e51e30@redhat.com>
 <20231101124133.GK12764@pendragon.ideasonboard.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231101124133.GK12764@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 11/1/23 13:41, Laurent Pinchart wrote:
> Hello,
> 
> On Tue, Oct 31, 2023 at 06:26:58PM +0100, Hans de Goede wrote:
>> On 10/31/23 18:05, Alain Volmat wrote:
>>> On Tue, Oct 31, 2023 at 10:53:16AM +0100, Hans de Goede wrote:
>>>> <resend with Alain added to the To: for some reason reply-to-all did not add Alain>
>>>
>>> No pb, I also received it via the mailing-list ;-)
>>>
>>>> Hi Alain,
>>>>
>>>> On 10/30/23 18:36, Alain Volmat wrote:
>>>>> Hi,
>>>>>
>>>>> Goal of this email is to get first comments prior to posting a patch.
>>>>>
>>>>> Could we consider enhancements within the v4l2-cci in order to also
>>>>> allow regmap_range_cfg usage for paged register access ?
>>>>
>>>> Yes definitely.
>>>>
>>>> Extending v4l2-cci for other use cases was already briefly discussed
>>>> between Kieran (Cc-ed) and me:
>>>>
>>>> The CCI part of the MIPI CSI spec says that multi-byte registers are
>>>> always in big endian format, but some of the Sony IMX sensors actually
>>>> use little-endian format for multi-byte registers.
>>>>
>>>> The main reason why we need v4l2-cci and cannot use regmap directly is
>>>> because of the variable register width in CCI, where as regmap only
>>>> supports a single width. v4l2 cci uses 8 bits width in the underlying
>>>> regmap-config and then takes care of multy-byte registers by e.g.
>>>> reading multiple bytes and calling e.g. get_unaligned_be16() on
>>>> the read bytes.
>>>>
>>>> For the IMX scenario the plan is to add the notion of v4l2-cci
>>>> flags by adding this to include/media/v4l2-cci.h :
>>>>
>>>> struct v4l2_cci {
>>>> 	struct regmap *map;
>>>> 	long flags;
>>>> }
>>>>
>>>> And then change the prototype for devm_cci_regmap_init_i2c() to:
>>>>
>>>> struct v4l2_cci *devm_cci_regmap_init_i2c(struct i2c_client *client,
>>>>                                           int reg_addr_bits, long flags);
>>>>
>>>> And have devm_cci_regmap_init_i2c():
>>>> 1. devm_kmalloc() a struct v4l2_cci
>>>> 2. store the regmap there
>>>> 3. copy over flags from the function argument
>>>>
>>>> Combined with modifying all the other functions to take
>>>> "struct v4l2_cci *cci" as first argument instead of
>>>> "struct regmap *map".
>>>>
>>>> This change will require all existing sensor drivers using
>>>> v4l2-cci to be converted for the "struct regmap *map" ->
>>>> "struct v4l2_cci *cci" change, this all needs to be done
>>>> in one single commit adding the new struct + flags argument
>>>> to avoid breaking the compilation.
>>>>
>>>> Then once we have this a second patch can add:
>>>>
>>>> /* devm_cci_regmap_init_i2c() flags argument defines */
>>>> #define V4L2_CCI_DATA_LE	BIT(0)
>>>>
>>>> to include/media/v4l2-cci.h and make v4l2-cci.h honor
>>>> this flag solving the IMX scenario.
>>>
>>> I understand that in case of IMX sensors, ALL the multi-registers
>>> value are encoded in little-endian right ?
>>
>> Yes I believe so, Laurent, Kieran ?
>>
>>> In case of the GalaxyCore
>>> GC2145, most of the registers (page 0 / 1 and 2) are correctly
>>> encoded in big-endian, however page 3 (MIPI configuration) are
>>> 2 or 3 registers in little-endian.  So far maybe this is minor
>>> case, but the approach of having the endianness part of the v4l2_cci
>>> struct wouldn't allow to address such case ?
>>>
>>> Originally I thought we could have CCI_REG macros for little endian
>>> as well, such as CCI_REG16_LE etc etc since we anyway still have spare
>>> space I guess on top of the width part.  Drawback is that in drivers
>>> for IMX we would end-up with longer macros CCI_REG16_LE(...) instead
>>> of CCI_REG16(...).
>>
>> Hmm, that (CCI_REG16_LE etc) is an interesting proposal, that
>> would avoid the need to add a struct with flags and if I understand
>> things correctly then you would also not need any extra data
>> on top of the regmap, right ?
>>
>> I did not take the mixed endian case for data registers into
>> account yet. Since that apparently is a thing I think that
>> your CCI_REG16_LE etc proposal is better then adding a struct
>> with flags.
>>
>> Laurent, Kieran what do you think ?
>>
>>> Or maybe as you proposed we can have the "default" encoding described
>>> in the flags variable and have a CCI_REG16_REV or any other naming
>>> just to indicate that for THAT precise register the endianess is not
>>> the default one.
>>
>> If we are going to deal with mixed endianess with a flag encoded
>> in the high bits of the register then I greatly favor just
>> putting the encoding in the high bits and not having
>> a default endianness + a flag for reverse endianess, that
>> just feels wrong and the code to implement this will also
>> be less then ideal.
> 
> I'm in two minds about that. It's annoying to have to mark every single
> register with _LE, but at the same time, these are CCI helpers, so
> making life more difficult for LE sensors could be considered
> reasonable. Except, of course, that it will make life more difficult for
> us, not for the sensor vendors. We need a way to share the pain, but
> that's another discussion.
> 
> We could also consider that the few GC2145 registers that use a
> different endianness should be handled as 8-bit registers by CCI, and
> managed by the gc2145 driver. If this situation is very rare, it may not
> be worth it trying to handle it in v4l2-cci if it makes life more
> complicated for everybody.

I actually like this approach, it allows for mixed endianness for
the data registers and it means we don't need to have a struct v4l2_cci
to store a global (whole sensor) endianness lfag.

I don't think adding CCI_REGXX_LE() macro usage in drivers which
have LE data registers is too much of a hassle. This is a one
time thing and it is only 3 extra chars per register definition.

Regards,

Hans



