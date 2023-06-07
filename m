Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2C5B72654D
	for <lists+linux-media@lfdr.de>; Wed,  7 Jun 2023 17:58:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240677AbjFGP64 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jun 2023 11:58:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239734AbjFGP6z (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jun 2023 11:58:55 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5B1C1FF5
        for <linux-media@vger.kernel.org>; Wed,  7 Jun 2023 08:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686153487;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=InQRV/UDcMPA7otxf13GdxTv8bM3QIGpaYiyErYOeNM=;
        b=h8cDzg4cvdP0CUILLaPoHHpErP910Va+wjyCIq1nTh+oNZHhD69zoIf30rtwnQmnwBUslV
        Y+3g3e5qamc9W2WvYPqkCFmZz+m2HPw5O8UZFhh7EbjYgBSlHEKWI4qMK4uN/IFog6yhIf
        I1cEloBUIOJWsCdtI+px4chwrT7B6+Q=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-267-zRSlnjyoMMa_TzhJmQGE7w-1; Wed, 07 Jun 2023 11:58:06 -0400
X-MC-Unique: zRSlnjyoMMa_TzhJmQGE7w-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-977cf886f17so337291266b.2
        for <linux-media@vger.kernel.org>; Wed, 07 Jun 2023 08:58:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686153485; x=1688745485;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=InQRV/UDcMPA7otxf13GdxTv8bM3QIGpaYiyErYOeNM=;
        b=S+MQTT6D3LgZHX3JGx1DVHtCExN27deJyHzZDUAs5nsFS4besvxNWqzRF92CcEjVZD
         QbEcXNY3kkFh9/9Gi5eQngQ8JVFFm+PdfZj6N5hYreDVAoSTzQsC5qhnd9H3onTY4v7l
         J071yLLHh/92XeQ5DSMmO5EOiqB8aqIlM8KhRPkRW2917yoy0o06LCmn/I+i80jONjxs
         RVCzQiiLO4Vzu5p45O68Nt1/QfRg9o93U7rM51JFQ4ZDd0SHk6tuXD9xM/g7t8sK6J6o
         I7UrmCZGZrJKwp9znfCRXiOlEbQmAW1uC1oDw+Tdjv2ydKX9QyIH3jhGwvdj6lMraFVq
         mILw==
X-Gm-Message-State: AC+VfDzId4UWN+BMoh3M5N/mTLK2sAU8WnyXTM1JVrDoEO1gF8EhIv9X
        vYLFKIdyxaNj2SO7tYTp1VT+5o3/VbpP8/JaH0dCHBt/DgLTJqiC9InApNLhoX6n5FPTdREfp/E
        iaUfwLCVTebWEJ3qD5F1NB8M=
X-Received: by 2002:a17:907:7288:b0:978:780e:4520 with SMTP id dt8-20020a170907728800b00978780e4520mr3637415ejc.20.1686153485514;
        Wed, 07 Jun 2023 08:58:05 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6isiO1Z6a113/ZSJgvPhZs/OB7YGqUoPkEZ9MyH8udfRPR+eopHBg1xbq6zTtZYAvNYpjh6Q==
X-Received: by 2002:a17:907:7288:b0:978:780e:4520 with SMTP id dt8-20020a170907728800b00978780e4520mr3637402ejc.20.1686153485188;
        Wed, 07 Jun 2023 08:58:05 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id z21-20020a170906815500b0096ace7ae086sm7131662ejw.174.2023.06.07.08.58.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 08:58:04 -0700 (PDT)
Message-ID: <2f367370-1dcd-5246-4016-dfb06019eda6@redhat.com>
Date:   Wed, 7 Jun 2023 17:58:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/3] media: Add MIPI CCI register access helper functions
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org
References: <20230606165808.70751-1-hdegoede@redhat.com>
 <20230606165808.70751-2-hdegoede@redhat.com>
 <CAHp75Vd6TPfZhPEDUdAj0Y7G8fQDPKQhmcY_tDWmN7VHBpXL0w@mail.gmail.com>
 <0760b8ba-0091-5270-5e46-9787a910bd6f@redhat.com>
 <ZIBxhg1LVL8+zBCE@kekkonen.localdomain>
 <CAHp75VeZe-aeusoeYgDh=6kGfxNUDexLvvwMdLTKe-k1_vtAwA@mail.gmail.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VeZe-aeusoeYgDh=6kGfxNUDexLvvwMdLTKe-k1_vtAwA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 6/7/23 17:40, Andy Shevchenko wrote:
> On Wed, Jun 7, 2023 at 3:01 PM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
>> On Wed, Jun 07, 2023 at 10:40:34AM +0200, Hans de Goede wrote:
>>> On 6/6/23 22:43, Andy Shevchenko wrote:
>>>> On Tue, Jun 6, 2023 at 7:58 PM Hans de Goede <hdegoede@redhat.com> wrote:
> 
> ...
> 
>>>>> +int cci_read(struct regmap *map, u32 reg, u32 *val, int *err)
>>>>> +{
>>>>> +       int i, len, ret;
>>>>> +       u8 buf[4];
> 
>>>>> +       *val = 0;
>>>>> +       for (i = 0; i < len; i++) {
>>>>> +               *val <<= 8;
>>>>> +               *val |= buf[i];
>>>>> +       }
>>>>
>>>> I really prefer to see put_unaligned() here depending on the length.
>>>> Note, that on some CPUs it might be one assembly instruction or even
>>>> none, depending on how the result is going to be used.
>>>
>>> Ok, so you mean changing it to something like this:
>>>
>>>       switch (len)
>>>       case 1:
>>>               *val = buf[0];
>>>               break;
>>>       case 2:
>>>               *val = get_unaligned_be16(buf);
>>>               break;
>>>       case 3:
>>>               *val = __get_unaligned_be24(buf);
> 
> __without double underscore prefix

include/asm-generic/unaligned.h

defines __get_unaligned_be24() and not get_unaligned_be24(), I guess because 24bit is not a standard register width.



> 
>>>               break;
>>>       case 4:
>>>               *val = get_unaligned_be32(buf);
>>>               break;
>>>       }
>>
>> I think the loop looks nicer but I'm fine with this as well.
>>
>>> ?
> 
> But the loop hides what's going on there. And I believe code
> generation would be worse with a loop.
> Also note, that in case of switch-case we don't write to the pointed
> memory several times, which I think is also the win.

I understand, unless someone objects I'll move to the switch-case
approach for v2.

Regards,

Hans



> 
>>>>> +       return 0;
>>>>> +}
> 
> ...
> 
>>>>> +int cci_write(struct regmap *map, u32 reg, u32 val, int *err)
>>>>> +{
>>>>> +       int i, len, ret;
>>>>> +       u8 buf[4];
>>>>> +
>>>>> +       if (err && *err)
>>>>> +               return *err;
>>>>> +
>>>>> +       /* Set len to register width in bytes */
>>>>> +       len = ((reg & CCI_REG_WIDTH_MASK) >> CCI_REG_WIDTH_SHIFT) + 1;
>>>>> +       reg &= CCI_REG_ADDR_MASK;
>>>>> +
>>>>> +       for (i = 0; i < len; i++) {
>>>>> +               buf[len - i - 1] = val & 0xff;
>>>>> +               val >>= 8;
>>>>> +       }
> 
> Similar way here.
> 
>>>>> +
>>>>> +       ret = regmap_bulk_write(map, reg, buf, len);
>>>>> +       if (ret) {
>>>>> +               dev_err(regmap_get_device(map), "Error writing reg 0x%4x: %d\n", reg, ret);
>>>>> +               if (err)
>>>>> +                       *err = ret;
>>>>> +       }
>>>>> +
>>>>> +       return ret;
>>>>> +}
> 

