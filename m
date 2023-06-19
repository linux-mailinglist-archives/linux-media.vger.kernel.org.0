Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B77FC734E7F
	for <lists+linux-media@lfdr.de>; Mon, 19 Jun 2023 10:49:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229966AbjFSItT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Jun 2023 04:49:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231425AbjFSIsk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Jun 2023 04:48:40 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E1E510C8
        for <linux-media@vger.kernel.org>; Mon, 19 Jun 2023 01:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687164382;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GdI2gIZCnXRd2sUF7yFmf6oX9I4hMvQtc6OaCzBzULI=;
        b=RVuKuLSwrcHOIxezjZfWty7yTooIjK7MDXjAlT2cx6ogJg+/DSCaXBOe06UkP6XxRysT6k
        GgIATxCkLgMRNV8Od399mRIyBj/LuzZXOwIvplGsFSeRVyjKzY0J9vmJzeA+3B8QB5j22d
        pLxDYuZp2c2XdkgMmMkZlDHapRc6X70=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-288-MN-lpF2BNF2SArEy_PuEwg-1; Mon, 19 Jun 2023 04:46:21 -0400
X-MC-Unique: MN-lpF2BNF2SArEy_PuEwg-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-98277fac2a1so228974266b.3
        for <linux-media@vger.kernel.org>; Mon, 19 Jun 2023 01:46:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687164380; x=1689756380;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GdI2gIZCnXRd2sUF7yFmf6oX9I4hMvQtc6OaCzBzULI=;
        b=TP8FuzeOuiyEbOmXnYIXIRFpnAsVoF1YOUFHRsUFkkZo8TiOFiS3/m4a7aBnaupu3w
         RxHNBGVGULhUVfHuXpSJlWJe8800a+M69tS5tW65nmdFioDusT0jaKD3axHzzdNFMof6
         F+xyPzFsD139bng1M8z3qby5vCAe3+pTuTD+tPowPKRJ2FWsTKE6OAWhhyo4rwjB/tiq
         b7WjKjbCdc0qKtF7XfCAcgxkvVSSzqqVEwPMT34zEPYw3wyt1daK6MEkBtjvG3G2kL3o
         F1+9GgYpe6pXPgre96CdUiJWmnuXCETEJyhxii14WpQZiUNeNptCa0qJjJZqRZI9Uh4M
         L/Gw==
X-Gm-Message-State: AC+VfDxbqmL+k+wPqM+8qhYtPV5NJOEJV33xwmOAcsJattA0f3kEQ6HR
        M+baK5NrnJqMD33/A6hjooBpFik91EwcHejcxpeHYblz0rvTk2ZtIokcDJXpfpnBU2Z+Msxjq49
        x9lBSkqDwnRwjTbqqD67Qh+M=
X-Received: by 2002:a17:907:36c5:b0:978:acec:36b1 with SMTP id bj5-20020a17090736c500b00978acec36b1mr8516997ejc.17.1687164380085;
        Mon, 19 Jun 2023 01:46:20 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4cuOZpTfEGqHkEhfXIlKmFkur2X2N/A+QRPciHRoU5xzjMzJI7VMrjkU/3vlQ13YpSsfmEKQ==
X-Received: by 2002:a17:907:36c5:b0:978:acec:36b1 with SMTP id bj5-20020a17090736c500b00978acec36b1mr8516986ejc.17.1687164379769;
        Mon, 19 Jun 2023 01:46:19 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id j14-20020a170906410e00b009883a3edcfcsm2540487ejk.171.2023.06.19.01.46.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jun 2023 01:46:19 -0700 (PDT)
Message-ID: <140a97fa-8974-e2e1-e2f5-4f46cb0ec24f@redhat.com>
Date:   Mon, 19 Jun 2023 10:46:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 1/5] media: Add MIPI CCI register access helper
 functions
To:     Tommaso Merciai <tomm.merciai@gmail.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        linux-media@vger.kernel.org
References: <ZIo1kHgYMK84iMj7@kekkonen.localdomain>
 <b8e5f3f7-d82d-390b-ac63-824a42c3f6cd@redhat.com>
 <20230615092100.GE741@pendragon.ideasonboard.com>
 <ZIriVxMVVxG2dsUO@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <71aa3c7e-5bb2-afe6-a9a5-390307a8b3f9@redhat.com>
 <ZIr1YVf15ZBJvguX@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <ZIr8CFZzq0MttUf+@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <3b79c522-4bba-fd38-e087-8a506ae14a23@redhat.com>
 <ZIs5L1owIKEkg6aW@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <73420627-f49a-eaf2-8544-02af15cfd6db@redhat.com>
 <ZJAOIN3hQcjkOlqs@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
Content-Language: en-US
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZJAOIN3hQcjkOlqs@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
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

Hi,

On 6/19/23 10:13, Tommaso Merciai wrote:
> Hi Hans, Laurent,
> 
> On Fri, Jun 16, 2023 at 06:54:54PM +0200, Hans de Goede wrote:
>> Hi Tommaso,
>>
>> On 6/15/23 18:15, Tommaso Merciai wrote:
>>> Hi Hans,
>>>
>>> On Thu, Jun 15, 2023 at 02:00:46PM +0200, Hans de Goede wrote:
>>>> Hi,
>>>>
>>>> On 6/15/23 13:54, Tommaso Merciai wrote:
>>>>> On Thu, Jun 15, 2023 at 01:26:25PM +0200, Tommaso Merciai wrote:
>>>>>> Hi Hans,
>>>>>>
>>>>>> On Thu, Jun 15, 2023 at 01:10:40PM +0200, Hans de Goede wrote:
>>>>>>> Hi Tommaso,
>>>>>>>
>>>>>>> On 6/15/23 12:05, Tommaso Merciai wrote:
>>>>>>>> Hi Hans, Laurent, Sakari,
>>>>>>>>
>>>>>>>> Can I cherry-pick this patch and use these new functions also
>>>>>>>> for cci regs of the alvium driver?
>>>>>>>
>>>>>>> Yes that sounds like a good plan.
>>>>>>>
>>>>>>>> Are on going to be merge?
>>>>>>>
>>>>>>> Yes this will hopefully get merged upstream soon.
>>>>>>
>>>>>> Thanks for the info!
>>>>>>
>>>>>> I want to ask you your opinion about this:
>>>>>>
>>>>>> Into alvium driver actually I'm using the following defines
>>>>>> manipulations:
>>>>>>
>>>>>> #define REG_BCRM_REG_ADDR_R				REG_BCRM_CCI_16BIT(0x0014)
>>>>>>
>>>>>> #define REG_BCRM_FEATURE_INQUIRY_R			REG_BCRM_V4L2_64BIT(0x0008)
>>>>>> #define REG_BCRM_DEVICE_FIRMWARE_VERSION_R		REG_BCRM_V4L2_64BIT(0x0010)
>>>>>>
>>>>>> My plan is to use your cci API for cci register in this way defines
>>>>>> became like:
>>>>>>
>>>>>> #define REG_BCRM_REG_ADDR_R				CCI_REG16(0x0014)
>>>>>>
>>>>>> And leave v4l2 regs are it are right now:
>>>>>>
>>>>>> #define REG_BCRM_FEATURE_INQUIRY_R			REG_BCRM_V4L2_64BIT(0x0008)
>>>>>> #define REG_BCRM_DEVICE_FIRMWARE_VERSION_R		REG_BCRM_V4L2_64BIT(0x0010)
>>>>>>
>>>>>> What do you think about?
>>>>>
>>>>> Or maybe is worth don't use v4l2 bit for v4l2 regs, I think is implicit
>>>>> that what regs that are not CCI are v4l2, then we return wit the
>>>>> following defines:
>>>>>
>>>>>
>>>>>
>>>>> #define REG_BCRM_REG_ADDR_R                           CCI_REG16(0x0014)
>>>>> ^CCI regs
>>>>>
>>>>> #define REG_BCRM_FEATURE_INQUIRY_R                    0x0008 
>>>>> #define REG_BCRM_DEVICE_FIRMWARE_VERSION_R            0x0010
>>>>> ^v4l2 regs
>>>>
>>>> I'm not sure what you mean with "V4L2" registers ? I guess you mean
>>>> registers which cannot be accessed through the CCI helper functions,
>>>> but starting with v2 this is no longer true. There now is a CCI_REG64()
>>>> so you can simply use that.
>>>
>>> I'm playing a bit with v3 of your cci api :)
>>>
>>> My problem is the following, bcrm regs are not real regs but are offset
>>> from bcrm address (this is not fixed, it depends on the camera).
>>>
>>> Then the workflow is:
>>>
>>>  - read bcrm_address (base address)
>>>  - then sum this to the offset (regs)
>>>
>>> Myabe this clarify:
>>>
>>> static int alvium_read(struct alvium_dev *alvium, u32 reg, u64 *val)
>>> {
>>> 	int ret;
>>>
>>> 	if (reg & REG_BCRM_V4L2)
>>> 		reg += alvium->bcrm_addr;
>>>
>>> 	cci_read(alvium->regmap, reg, val, &ret);
>>> 	if (ret)
>>> 		return ret;
>>>
>>> 	return 0;
>>> }
>>>
>>> int alvium_write(struct alvium_dev *alvium, u32 reg, u64 val)
>>> {
>>> 	int ret;
>>>
>>> 	if (reg & REG_BCRM_V4L2)
>>> 		reg += alvium->bcrm_addr;
>>>
>>> 	cci_write(alvium->regmap, reg, val, &ret);
>>> 	if (ret)
>>> 		return ret;
>>>
>>> 	return 0;
>>> }
>>>
>>> Where for example:
>>>
>>> #define REG_BCRM_V4L2		BIT(31)
>>> #define REG_BCRM_V4L2_64BIT(n)	(REG_BCRM_V4L2 | CCI_REG64(n))
>>>
>>> #define REG_BCRM_WRITE_HANDSHAKE_RW REG_BCRM_V4L2_8BIT(0x0418)
>>>
>>>
>>> But I'm not sure that I'm in the right direction. 
>>>
>>> In real I need first to get the real address then sum the bcrm_address
>>> if this is a bcrm regs(offset) then re-incapsule the address into the
>>> right CCI_REG# defines.
>>
>> Ah I see, so you have a set of windowed registers where
>> the base address of these registers may change.
> 
> Yep, right :)
> 
>>
>> What I don't understand though is why you use V4L2 in the
>> name of the #defines for this? Does the datasheet actually
>> name them like this ? V4L2 stands for video4linux version 2,
>> so unless these registers are somehow Linux specific using
>> V4L2 in the #define names is a bit weird IMHO.
> 
> These registers are offered from the alvium fw for v4l2 API.
> We had a previous discussion with Laurent about this.

Ah, ok that explains. Then the V4L2 in the register #defines makes
sense and I'm fine with it.

Regards,

Hans

