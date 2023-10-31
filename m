Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C51D77DD4A8
	for <lists+linux-media@lfdr.de>; Tue, 31 Oct 2023 18:27:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346813AbjJaR1z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Oct 2023 13:27:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345576AbjJaR1x (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Oct 2023 13:27:53 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E9D8B4
        for <linux-media@vger.kernel.org>; Tue, 31 Oct 2023 10:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1698773224;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=g10NuFE+G5kpCJKWfRWlZecNX3hiMZ49VLLJdBeT/wY=;
        b=EcMrZbN/qbffiKeFDMhiiSf1Ox/CcEuyzGLNn2iAAul6Ki0fNPQOHqX4MVy8nRftTUtZBT
        4QoLPyjHg/uWabyqq2uqGzVNB/KurGXIzsIsd1RHNiAAZoyG4l7j482/jl9HcGC+TAhK4g
        m2zPTOsjuJDQkTz5tk3XzeQUAVjqay0=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-45-67cy1uFzPvSIhUYtej05OQ-1; Tue, 31 Oct 2023 13:27:02 -0400
X-MC-Unique: 67cy1uFzPvSIhUYtej05OQ-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-9c75b999aaaso413456466b.2
        for <linux-media@vger.kernel.org>; Tue, 31 Oct 2023 10:27:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698773221; x=1699378021;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g10NuFE+G5kpCJKWfRWlZecNX3hiMZ49VLLJdBeT/wY=;
        b=GY1dm6mBWFHml07nK06sl6bm6X2G/yY24yWIjVqdOCyJffMGJrQGkVVpoudcQBVRwh
         EYU71PwIlwGJ7OxS4HmvLbPb0VK9X5aUheboW8kT1tdS7yByQwK2kd660qlSv882KGpe
         8pFZxuWjaY9EOX7r4IW/iOkMjTSfceET8ZThmNv8ZwJFz3nsNJTxq8MReu0c3al9Xq0+
         yScdPsgPyTjVKSssqw6fhlJoGXLQZQeluPOYufL8sAouycJDeT62VuU+bX7PDfMUqdqF
         GboEMIPtCW3DlFBOr78QgRNFra0EfklgIa6OtK0aMitx5IJvyLrfgTEapZBtkMCNPG34
         Zdpg==
X-Gm-Message-State: AOJu0YzwcB6qraW89TopR/ORvlucXVDb8CzLykU/lOAJpuLCtP7J2b1e
        Xe6PKpyds4zQmw87gkUM/bhQrilWCnh3y4E+B1uhCXV1ZPZVz0IqwN83U7KfTAv6WCKduLaucUs
        teb/iOqGt+Acbm7mx19SlAWUeORT/yhigG40nlnoCeTd3ST7mMkQ2vX8b9gBhso7bQF82wbZ8UX
        O/78qpqaI=
X-Received: by 2002:a17:907:7654:b0:9d2:414c:b92 with SMTP id kj20-20020a170907765400b009d2414c0b92mr6399132ejc.68.1698773220975;
        Tue, 31 Oct 2023 10:27:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKVQX15UxUS/WzP82PiUquyq9wSx0/hBDVZ1VaZj4Ozu/z9r2ol3tpZZrvh7GnqA3BVO4NYA==
X-Received: by 2002:a17:907:7654:b0:9d2:414c:b92 with SMTP id kj20-20020a170907765400b009d2414c0b92mr6399110ejc.68.1698773220530;
        Tue, 31 Oct 2023 10:27:00 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:6c4:9fb2:fbc:7029? (2001-1c00-2a07-3a01-06c4-9fb2-0fbc-7029.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:6c4:9fb2:fbc:7029])
        by smtp.gmail.com with ESMTPSA id m26-20020a1709062ada00b009bf7a4d591dsm1305670eje.32.2023.10.31.10.26.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Oct 2023 10:26:59 -0700 (PDT)
Message-ID: <1d3f2440-6572-4311-893e-952562e51e30@redhat.com>
Date:   Tue, 31 Oct 2023 18:26:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] regmap_range_cfg usage with v4l2-cci
Content-Language: en-US
To:     linux-media@vger.kernel.org, Sebastian Reichel <sre@kernel.org>,
        "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20231030173637.GA2977515@gnbcxd0016.gnb.st.com>
 <962d6d0c-2263-fe59-011c-09068a6a4cef@redhat.com>
 <20231031170530.GA2989927@gnbcxd0016.gnb.st.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231031170530.GA2989927@gnbcxd0016.gnb.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 10/31/23 18:05, Alain Volmat wrote:
> Hi Hans,
> 
> On Tue, Oct 31, 2023 at 10:53:16AM +0100, Hans de Goede wrote:
>> <resend with Alain added to the To: for some reason reply-to-all did not add Alain>
> 
> No pb, I also received it via the mailing-list ;-)
> 
>>
>> Hi Alain,
>>
>> On 10/30/23 18:36, Alain Volmat wrote:
>>> Hi,
>>>
>>> Goal of this email is to get first comments prior to posting a patch.
>>>
>>> Could we consider enhancements within the v4l2-cci in order to also
>>> allow regmap_range_cfg usage for paged register access ?
>>
>> Yes definitely.
>>
>> Extending v4l2-cci for other use cases was already briefly discussed
>> between Kieran (Cc-ed) and me:
>>
>> The CCI part of the MIPI CSI spec says that multi-byte registers are
>> always in big endian format, but some of the Sony IMX sensors actually
>> use little-endian format for multi-byte registers.
>>
>> The main reason why we need v4l2-cci and cannot use regmap directly is
>> because of the variable register width in CCI, where as regmap only
>> supports a single width. v4l2 cci uses 8 bits width in the underlying
>> regmap-config and then takes care of multy-byte registers by e.g.
>> reading multiple bytes and calling e.g. get_unaligned_be16() on
>> the read bytes.
>>
>> For the IMX scenario the plan is to add the notion of v4l2-cci
>> flags by adding this to include/media/v4l2-cci.h :
>>
>> struct v4l2_cci {
>> 	struct regmap *map;
>> 	long flags;
>> }
>>
>> And then change the prototype for devm_cci_regmap_init_i2c() to:
>>
>> struct v4l2_cci *devm_cci_regmap_init_i2c(struct i2c_client *client,
>>                                           int reg_addr_bits, long flags);
>>
>> And have devm_cci_regmap_init_i2c():
>> 1. devm_kmalloc() a struct v4l2_cci
>> 2. store the regmap there
>> 3. copy over flags from the function argument
>>
>> Combined with modifying all the other functions to take
>> "struct v4l2_cci *cci" as first argument instead of
>> "struct regmap *map".
>>
>> This change will require all existing sensor drivers using
>> v4l2-cci to be converted for the "struct regmap *map" ->
>> "struct v4l2_cci *cci" change, this all needs to be done
>> in one single commit adding the new struct + flags argument
>> to avoid breaking the compilation.
>>
>> Then once we have this a second patch can add:
>>
>> /* devm_cci_regmap_init_i2c() flags argument defines */
>> #define V4L2_CCI_DATA_LE	BIT(0)
>>
>> to include/media/v4l2-cci.h and make v4l2-cci.h honor
>> this flag solving the IMX scenario.
> 
> I understand that in case of IMX sensors, ALL the multi-registers
> value are encoded in little-endian right ?

Yes I believe so, Laurent, Kieran ?

> In case of the GalaxyCore
> GC2145, most of the registers (page 0 / 1 and 2) are correctly
> encoded in big-endian, however page 3 (MIPI configuration) are
> 2 or 3 registers in little-endian.  So far maybe this is minor
> case, but the approach of having the endianness part of the v4l2_cci
> struct wouldn't allow to address such case ?
> 
> Originally I thought we could have CCI_REG macros for little endian
> as well, such as CCI_REG16_LE etc etc since we anyway still have spare
> space I guess on top of the width part.  Drawback is that in drivers
> for IMX we would end-up with longer macros CCI_REG16_LE(...) instead
> of CCI_REG16(...).

Hmm, that (CCI_REG16_LE etc) is an interesting proposal, that
would avoid the need to add a struct with flags and if I understand
things correctly then you would also not need any extra data
on top of the regmap, right ?

I did not take the mixed endian case for data registers into
account yet. Since that apparently is a thing I think that
your CCI_REG16_LE etc proposal is better then adding a struct
with flags.

Laurent, Kieran what do you think ?

> Or maybe as you proposed we can have the "default" encoding described
> in the flags variable and have a CCI_REG16_REV or any other naming
> just to indicate that for THAT precise register the endianess is not
> the default one.

If we are going to deal with mixed endianess with a flag encoded
in the high bits of the register then I greatly favor just
putting the encoding in the high bits and not having
a default endianness + a flag for reverse endianess, that
just feels wrong and the code to implement this will also
be less then ideal.

> Are you aware of other sensors having "mixed" endianness registers ?

Nope this is all new to me. 

Regards,

Hans

