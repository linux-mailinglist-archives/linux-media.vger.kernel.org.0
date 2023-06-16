Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E674C7336EA
	for <lists+linux-media@lfdr.de>; Fri, 16 Jun 2023 18:58:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345964AbjFPQ6o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Jun 2023 12:58:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346064AbjFPQ6E (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Jun 2023 12:58:04 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 039EA421E
        for <linux-media@vger.kernel.org>; Fri, 16 Jun 2023 09:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686934506;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3WRPlLxbUh9HGYRKH9lcmWn+FVbFD4z0nptiyR3ssAk=;
        b=Z99pCq7gv3KMzGTWC8ZFoEvFGExirRK2RnKgcmrizX3dYQba3hipY7cbcrdy3SEBvOD755
        VHSyCcyxRR9kwcx71hZnlJZ06pKOY1kF4Je63EGzGwYntgSyi4TD0mGCn/pl/SCf5quAdT
        fNgBlOCZCk4QzmqyZFxhVIgQvwljf7Q=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-425-CzsgognFOxuBMa8OSWvilQ-1; Fri, 16 Jun 2023 12:55:05 -0400
X-MC-Unique: CzsgognFOxuBMa8OSWvilQ-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-4edc7406cb5so797978e87.3
        for <linux-media@vger.kernel.org>; Fri, 16 Jun 2023 09:55:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686934504; x=1689526504;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3WRPlLxbUh9HGYRKH9lcmWn+FVbFD4z0nptiyR3ssAk=;
        b=R6oKmLvU65+OwesIPXYroZbdyyNPaLKCwnoN8fVFXxnCoorxDUeWzNVwJPBQMNoFYv
         vQGxt3qcu/NwfDLi2AKyFIjLvRVbUwkSfzqPeGGSqRNngpe9bCg2k79zjYIwpZrgXjPx
         +p8fUMQGd9QC8UbkdcRjoPghrEmaS9nxygPLVZo+wek/TEDRFF188myPOGQPpBen4gyM
         pebu9qsMv7jbs0JPDkmkREmP7chlvbctW2nNaTM0tQ6u0Tfuw8PfJ24bkDvp9Cs1twnq
         PvM/ss9aFNrx8prtRIOgSAJSEPOgtb73hG5m3nFf7Apv62O1vYbj843n0Iiowjfj+qou
         RjfQ==
X-Gm-Message-State: AC+VfDz76wimlz7kXBWyDGrU0Y5+PsTI/Ab3lRXi8erCtpcRgqWgNgkj
        tj3uz053B30PzRFsVN3hW7yICgvbjQ3d23pKfaRRNKs/Fja+vD3wXxccxqKIlXGmc9qHvQRNxxs
        otaDNwiWFKIvM3TrCMQk73P8=
X-Received: by 2002:a19:7018:0:b0:4f7:6470:b4eb with SMTP id h24-20020a197018000000b004f76470b4ebmr1834889lfc.0.1686934503873;
        Fri, 16 Jun 2023 09:55:03 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5I5ceQQQeWTHmTG5vV2Bvsxackrk/DK4aU6IK62cdod8k2KfeCcsF56wAOcPUWIQCNSI6oVw==
X-Received: by 2002:a19:7018:0:b0:4f7:6470:b4eb with SMTP id h24-20020a197018000000b004f76470b4ebmr1834878lfc.0.1686934503495;
        Fri, 16 Jun 2023 09:55:03 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id d10-20020a056402078a00b0051a38fdd75fsm776409edy.19.2023.06.16.09.55.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jun 2023 09:55:02 -0700 (PDT)
Message-ID: <73420627-f49a-eaf2-8544-02af15cfd6db@redhat.com>
Date:   Fri, 16 Jun 2023 18:54:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 1/5] media: Add MIPI CCI register access helper
 functions
Content-Language: en-US, nl
To:     Tommaso Merciai <tomm.merciai@gmail.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        linux-media@vger.kernel.org
References: <ZIolnOxs29H8EUmC@kekkonen.localdomain>
 <20230614213429.GA28757@pendragon.ideasonboard.com>
 <ZIo1kHgYMK84iMj7@kekkonen.localdomain>
 <b8e5f3f7-d82d-390b-ac63-824a42c3f6cd@redhat.com>
 <20230615092100.GE741@pendragon.ideasonboard.com>
 <ZIriVxMVVxG2dsUO@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <71aa3c7e-5bb2-afe6-a9a5-390307a8b3f9@redhat.com>
 <ZIr1YVf15ZBJvguX@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <ZIr8CFZzq0MttUf+@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <3b79c522-4bba-fd38-e087-8a506ae14a23@redhat.com>
 <ZIs5L1owIKEkg6aW@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZIs5L1owIKEkg6aW@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tommaso,

On 6/15/23 18:15, Tommaso Merciai wrote:
> Hi Hans,
> 
> On Thu, Jun 15, 2023 at 02:00:46PM +0200, Hans de Goede wrote:
>> Hi,
>>
>> On 6/15/23 13:54, Tommaso Merciai wrote:
>>> On Thu, Jun 15, 2023 at 01:26:25PM +0200, Tommaso Merciai wrote:
>>>> Hi Hans,
>>>>
>>>> On Thu, Jun 15, 2023 at 01:10:40PM +0200, Hans de Goede wrote:
>>>>> Hi Tommaso,
>>>>>
>>>>> On 6/15/23 12:05, Tommaso Merciai wrote:
>>>>>> Hi Hans, Laurent, Sakari,
>>>>>>
>>>>>> Can I cherry-pick this patch and use these new functions also
>>>>>> for cci regs of the alvium driver?
>>>>>
>>>>> Yes that sounds like a good plan.
>>>>>
>>>>>> Are on going to be merge?
>>>>>
>>>>> Yes this will hopefully get merged upstream soon.
>>>>
>>>> Thanks for the info!
>>>>
>>>> I want to ask you your opinion about this:
>>>>
>>>> Into alvium driver actually I'm using the following defines
>>>> manipulations:
>>>>
>>>> #define REG_BCRM_REG_ADDR_R				REG_BCRM_CCI_16BIT(0x0014)
>>>>
>>>> #define REG_BCRM_FEATURE_INQUIRY_R			REG_BCRM_V4L2_64BIT(0x0008)
>>>> #define REG_BCRM_DEVICE_FIRMWARE_VERSION_R		REG_BCRM_V4L2_64BIT(0x0010)
>>>>
>>>> My plan is to use your cci API for cci register in this way defines
>>>> became like:
>>>>
>>>> #define REG_BCRM_REG_ADDR_R				CCI_REG16(0x0014)
>>>>
>>>> And leave v4l2 regs are it are right now:
>>>>
>>>> #define REG_BCRM_FEATURE_INQUIRY_R			REG_BCRM_V4L2_64BIT(0x0008)
>>>> #define REG_BCRM_DEVICE_FIRMWARE_VERSION_R		REG_BCRM_V4L2_64BIT(0x0010)
>>>>
>>>> What do you think about?
>>>
>>> Or maybe is worth don't use v4l2 bit for v4l2 regs, I think is implicit
>>> that what regs that are not CCI are v4l2, then we return wit the
>>> following defines:
>>>
>>>
>>>
>>> #define REG_BCRM_REG_ADDR_R                           CCI_REG16(0x0014)
>>> ^CCI regs
>>>
>>> #define REG_BCRM_FEATURE_INQUIRY_R                    0x0008 
>>> #define REG_BCRM_DEVICE_FIRMWARE_VERSION_R            0x0010
>>> ^v4l2 regs
>>
>> I'm not sure what you mean with "V4L2" registers ? I guess you mean
>> registers which cannot be accessed through the CCI helper functions,
>> but starting with v2 this is no longer true. There now is a CCI_REG64()
>> so you can simply use that.
> 
> I'm playing a bit with v3 of your cci api :)
> 
> My problem is the following, bcrm regs are not real regs but are offset
> from bcrm address (this is not fixed, it depends on the camera).
> 
> Then the workflow is:
> 
>  - read bcrm_address (base address)
>  - then sum this to the offset (regs)
> 
> Myabe this clarify:
> 
> static int alvium_read(struct alvium_dev *alvium, u32 reg, u64 *val)
> {
> 	int ret;
> 
> 	if (reg & REG_BCRM_V4L2)
> 		reg += alvium->bcrm_addr;
> 
> 	cci_read(alvium->regmap, reg, val, &ret);
> 	if (ret)
> 		return ret;
> 
> 	return 0;
> }
> 
> int alvium_write(struct alvium_dev *alvium, u32 reg, u64 val)
> {
> 	int ret;
> 
> 	if (reg & REG_BCRM_V4L2)
> 		reg += alvium->bcrm_addr;
> 
> 	cci_write(alvium->regmap, reg, val, &ret);
> 	if (ret)
> 		return ret;
> 
> 	return 0;
> }
> 
> Where for example:
> 
> #define REG_BCRM_V4L2		BIT(31)
> #define REG_BCRM_V4L2_64BIT(n)	(REG_BCRM_V4L2 | CCI_REG64(n))
> 
> #define REG_BCRM_WRITE_HANDSHAKE_RW REG_BCRM_V4L2_8BIT(0x0418)
> 
> 
> But I'm not sure that I'm in the right direction. 
> 
> In real I need first to get the real address then sum the bcrm_address
> if this is a bcrm regs(offset) then re-incapsule the address into the
> right CCI_REG# defines.

Ah I see, so you have a set of windowed registers where
the base address of these registers may change.

What I don't understand though is why you use V4L2 in the
name of the #defines for this? Does the datasheet actually
name them like this ? V4L2 stands for video4linux version 2,
so unless these registers are somehow Linux specific using
V4L2 in the #define names is a bit weird IMHO.

Regards,

Hans

