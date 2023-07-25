Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6485D7610FB
	for <lists+linux-media@lfdr.de>; Tue, 25 Jul 2023 12:35:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233672AbjGYKfG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jul 2023 06:35:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233605AbjGYKfF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jul 2023 06:35:05 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90EF412E
        for <linux-media@vger.kernel.org>; Tue, 25 Jul 2023 03:35:03 -0700 (PDT)
Received: from [127.0.0.1] (unknown [62.91.23.180])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 3F6EA862E8;
        Tue, 25 Jul 2023 12:35:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1690281301;
        bh=2K+0ddjHKCBo9DDCZ2NMtYtYKtZ0D6DTt4htnm/vMu8=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=xdrjEj8G+oWay4qM7jEZuTydfx1oNgS949bv16ePTV+r/fV5vgYDLpprG32VcVP57
         1EqQM3dJmlnw7N+u4LIwTphyWsl5GmZNCmzRxwPwXY7BW1Y56nr2CtmAYkOkjahvw1
         WzdprsSCn3p5Q8Pd4TsH66YM1h04Wg3PuU9KokcGe7NyKzFRMGKs4/OczDErJV3QCr
         UT1cpMvd+EfHrc+FpRbysyulVlWMWnJwA7ybvAHOy8wEaq4LMBGSrvsvYmrAof21jd
         +eRvHMpjVpI3iwozMf/7745dTF1N1rCC9+Buxxu1ZbOsLebYoKjnRuEXXx3WRH9lxg
         GRkvvwUOA1UIw==
Message-ID: <24b03db9-237e-117b-b059-e719e1727177@denx.de>
Date:   Tue, 25 Jul 2023 12:35:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] media: ov5640: Enable MIPI interface in
 ov5640_set_power_mipi()
Content-Language: en-US
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
References: <20230724222210.162785-1-marex@denx.de>
 <c5oh3axckaqfenwm3cq5tictl5ra2hda5dmf65gsrjfxuj7crk@dgdlnph5fxvp>
 <47c49ef5-c77b-cd76-62e7-0d488d667636@denx.de>
 <sopwu4d3sx2wjuixp4fvts5urc3lqcfywoz7fgnp5jq77qhucp@ur4gn6g2vwds>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <sopwu4d3sx2wjuixp4fvts5urc3lqcfywoz7fgnp5jq77qhucp@ur4gn6g2vwds>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 7/25/23 12:04, Jacopo Mondi wrote:
> Hi Marek

Hi,

> On Tue, Jul 25, 2023 at 11:41:18AM +0200, Marek Vasut wrote:
>> On 7/25/23 11:04, Jacopo Mondi wrote:
>>> Hi Marek
>>
>> Hi,
>>
>>> On Tue, Jul 25, 2023 at 12:22:10AM +0200, Marek Vasut wrote:
>>>> Set OV5640_REG_IO_MIPI_CTRL00 bit 2 to 1 instead of 0, since 1 means
>>>> MIPI CSI2 interface, while 0 means CPI parallel interface.
>>>>
>>>> In the ov5640_set_power_mipi() the interface should obviously be set
>>>> to MIPI CSI2 since this functions is used to power up the sensor when
>>>> operated in MIPI CSI2 mode. The sensor should not be in CPI mode in
>>>> that case.
>>>
>>> Does this actually help fixing your 'first frame corrupted issue' ?
>>
>> Yes it does.
>>
>>> I think the logic here was to power up the interface here  in
>>> ov5640_set_power_mipi() with the CSI-2 interface disabled to enter
>>> LP-11 mode (something some receivers like the imx6 one are
>>> particularly sensible to).
>>
>> Per OV5640 datasheet.
>>
>> Register 0x300e bit 2 selects sensor interface mode between MIPI CSI2 and
>> CPI (parallel), it has nothing to do with LP modes .
>>
>> Register 0x3019 bits [6:4] control LP00/LP11 mode on CSI2 lines.
>>
>>> Then at stream time the CSI-2 interface is actually enabled in
>>> ov5640_set_stream_mipi() just before streaming is started.
>>>
>>> Also the register documentation is very confusing and as reported in
>>> ov5640_set_stream_mipi() it is also probably wrong (at least in the
>>> datasheet version I have).
>>>
>>> I would be particularly cautious in touching this sequence as it has
>>> been validated to work with multiple receivers. Of course if it
>>> actually fixes an issue for you it should be taken in, but ideally, as
>>> this sensor is still used in a large number of evaluation boards, it
>>> should be validated by other consumers of this driver (st, imx,
>>> microchip and rensas to name a few).
>>
>> That's quite a tall order which effectively makes it impossible to change or
>> fix anything in this driver.
> 
> Really? Asking other people which use this driver to test a patch before
> merging it to make sure it doesn't break their setup makes "impossibile to
> change of fix anything" ?
> 
> And it's not an order of any sort, but there are a lot of users of
> this driver and multiple times fixing a thing on one side breaks
> things for others, I'm just trying to coordinate between multiple
> developers.

I'm afraid my expression of skepticism to the expected amount of testing 
has been misinterpreted, and so was the message you were trying to 
convey, i.e. communication breakdown.

So let me rephrase.

If the expectation is that every change to this driver has to be tested 
by all aforementioned parties, then it will be very hard to get changes 
in, based on my previous experience.

Maybe let's stop this part of the thread here, and focus on the upper part?
