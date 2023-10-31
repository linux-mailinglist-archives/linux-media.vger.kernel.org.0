Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44EC97DD5D6
	for <lists+linux-media@lfdr.de>; Tue, 31 Oct 2023 19:11:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376604AbjJaSLa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Oct 2023 14:11:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230455AbjJaSLa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Oct 2023 14:11:30 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACCFCC9
        for <linux-media@vger.kernel.org>; Tue, 31 Oct 2023 11:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1698775841;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4sBMoUz+xyLluogYPacXBkvwBGIXTGag4jbsi7EKlcM=;
        b=gBilud6bsfsOSgKtEwL9qc8hJHhqffgIkfxyjkv1l84Asy6fO2VhoCQXK1LgRBlinCO3Oz
        EkP7Uh5cNisfIEOvKK9Bgc6VZgzLkanmNj0WfJ2s/ypgjjthGUdFrrc4skiczCZnVxJphY
        Zmx7TnpAPbHWK1jprR6tW76Nc5ELumw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-zyA9q3eGNICl3Iu-VFdufg-1; Tue, 31 Oct 2023 14:10:40 -0400
X-MC-Unique: zyA9q3eGNICl3Iu-VFdufg-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-9ae0bf9c0b4so415346466b.0
        for <linux-media@vger.kernel.org>; Tue, 31 Oct 2023 11:10:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698775839; x=1699380639;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4sBMoUz+xyLluogYPacXBkvwBGIXTGag4jbsi7EKlcM=;
        b=T7jLBfZjj5WG9abP/HVxYuelWF9+re8LnP6+JembhDxdDGYnkUqULlCVcPRZDvvhvc
         iV/ddD7PEkmE84+2o1XpZIvhO1mS1gWs9+yeK2eZTSl/ncs8cAANziGlJ8OlocwBrq1w
         UIZKx9fPMGWr0ow0189mu7/1Vges66RkGZBE0bbZ7k5IdYLz1mqNbrVg1q8BxnsLVpjm
         duqzINh3Fb/ln6uTlltW2bQxIJIavPMy0200RXXYzYoJxu3vaTSotvjvVZhXKV8Y3zlD
         WXYW8pXrkvvds8AIjeofxrHXgH6bKzrlseEhKQN3/Y5TRfeNE8t4IAxtum8g8mZ1IW95
         i7ow==
X-Gm-Message-State: AOJu0Yzphpfxat6oQ6VNvRfF0JR59+5no9t+Am80E1RFSsx24MZQDAWJ
        sgUna/90dxvAAcJdDPpqe/fi5zVnGJXTLq1k7DuiIpt7e5tQTOrqlw1EKHLxhMbiq0E2w6s6Gic
        tMafwsJzdCwBt1SGGUxwQTy0=
X-Received: by 2002:a17:907:e92:b0:9be:2991:81f9 with SMTP id ho18-20020a1709070e9200b009be299181f9mr96341ejc.1.1698775839336;
        Tue, 31 Oct 2023 11:10:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFt6XmtaRZvyYzvC/wm9nu5FG9iMaMUEnMiL3zEUWVBU/Klch4UthqQBiDtdQZSQ86AufSgAw==
X-Received: by 2002:a17:907:e92:b0:9be:2991:81f9 with SMTP id ho18-20020a1709070e9200b009be299181f9mr96321ejc.1.1698775838868;
        Tue, 31 Oct 2023 11:10:38 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:6c4:9fb2:fbc:7029? (2001-1c00-2a07-3a01-06c4-9fb2-0fbc-7029.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:6c4:9fb2:fbc:7029])
        by smtp.gmail.com with ESMTPSA id a5-20020a1709062b0500b009adc5802d08sm1358124ejg.190.2023.10.31.11.10.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Oct 2023 11:10:38 -0700 (PDT)
Message-ID: <1e55769f-fa32-45e3-97e4-9bb0cf9f2c53@redhat.com>
Date:   Tue, 31 Oct 2023 19:10:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] regmap_range_cfg usage with v4l2-cci
Content-Language: en-US
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sebastian Reichel <sre@kernel.org>, linux-media@vger.kernel.org
References: <20231030173637.GA2977515@gnbcxd0016.gnb.st.com>
 <962d6d0c-2263-fe59-011c-09068a6a4cef@redhat.com>
 <20231031170530.GA2989927@gnbcxd0016.gnb.st.com>
 <1d3f2440-6572-4311-893e-952562e51e30@redhat.com>
 <169877562554.1476798.3907804152294865485@ping.linuxembedded.co.uk>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <169877562554.1476798.3907804152294865485@ping.linuxembedded.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 10/31/23 19:07, Kieran Bingham wrote:
> Quoting Hans de Goede (2023-10-31 17:26:58)
>> Hi,
>>
>> On 10/31/23 18:05, Alain Volmat wrote:
>>> Hi Hans,
>>>
>>> On Tue, Oct 31, 2023 at 10:53:16AM +0100, Hans de Goede wrote:
>>>> <resend with Alain added to the To: for some reason reply-to-all did not add Alain>
>>>
>>> No pb, I also received it via the mailing-list ;-)
>>>
>>>>
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
>>>>      struct regmap *map;
>>>>      long flags;
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
>>>> #define V4L2_CCI_DATA_LE     BIT(0)
>>>>
>>>> to include/media/v4l2-cci.h and make v4l2-cci.h honor
>>>> this flag solving the IMX scenario.
>>>
>>> I understand that in case of IMX sensors, ALL the multi-registers
>>> value are encoded in little-endian right ?
>>
>> Yes I believe so, Laurent, Kieran ?
> 
> I'm not 100% sure here, I think there are some IMX sensors with Little
> Endian - and some with Big Endian ... because all the same would be too
> easy.
> 
> I haven't seen a single device with mixed big and little endian yet
> though.
> 
> 
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
> 
> Especially given there are some devices with multiple encodings, I like
> this.
> 
> I think it can simplify things if we don't need a separate 
> struct v4l2_cci allocated too.

Ok, lets go with (CCI_REG16_LE etc) then for the IMX sensors
and for the mixed endianess in the GalaxyCore sensors

Regards,

Hans

