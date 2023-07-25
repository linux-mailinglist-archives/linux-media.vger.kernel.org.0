Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2C0B760F8F
	for <lists+linux-media@lfdr.de>; Tue, 25 Jul 2023 11:41:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232295AbjGYJlo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jul 2023 05:41:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232923AbjGYJlm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jul 2023 05:41:42 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C14C173E
        for <linux-media@vger.kernel.org>; Tue, 25 Jul 2023 02:41:23 -0700 (PDT)
Received: from [127.0.0.1] (unknown [62.91.23.180])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 5955A8678A;
        Tue, 25 Jul 2023 11:41:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1690278079;
        bh=LuK4FNZTlA0qnhJ8g2hfc0WrOPtXhSIb0q1latjntO0=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=TpOXGgpoIAKAlLQtqLldRRJfm6JT3gYaNPYaPQQwqrgSRK4iHFxykg3rMIxfGrm/F
         UsDQqFYeOmoFKAs4J0f7kv57as6qsd0BKFYH+7Gd7hAqY6C62vc4Kgx+cVzVI4J5hW
         kXjufgmrvVsuytzUlRnU8+hD+PV/Bu8YDz5bpHTurZ0nwu5OhFJkPUbxOD2T60euPL
         P/8dzCLLsxJWEaWOBYcbc2KhgxME78x6/VZBDqGSMY99XxOgEvOPM+APVhcU+y0A8t
         40JK1WKT8MVmm9SNrskT6FqqlTH9iyqSTIHHbfTPX1w6X1gC+OzlZxcfrFBmBaFvBn
         xCILiySyvXEsQ==
Message-ID: <47c49ef5-c77b-cd76-62e7-0d488d667636@denx.de>
Date:   Tue, 25 Jul 2023 11:41:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] media: ov5640: Enable MIPI interface in
 ov5640_set_power_mipi()
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
References: <20230724222210.162785-1-marex@denx.de>
 <c5oh3axckaqfenwm3cq5tictl5ra2hda5dmf65gsrjfxuj7crk@dgdlnph5fxvp>
Content-Language: en-US
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <c5oh3axckaqfenwm3cq5tictl5ra2hda5dmf65gsrjfxuj7crk@dgdlnph5fxvp>
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

On 7/25/23 11:04, Jacopo Mondi wrote:
> Hi Marek

Hi,

> On Tue, Jul 25, 2023 at 12:22:10AM +0200, Marek Vasut wrote:
>> Set OV5640_REG_IO_MIPI_CTRL00 bit 2 to 1 instead of 0, since 1 means
>> MIPI CSI2 interface, while 0 means CPI parallel interface.
>>
>> In the ov5640_set_power_mipi() the interface should obviously be set
>> to MIPI CSI2 since this functions is used to power up the sensor when
>> operated in MIPI CSI2 mode. The sensor should not be in CPI mode in
>> that case.
> 
> Does this actually help fixing your 'first frame corrupted issue' ?

Yes it does.

> I think the logic here was to power up the interface here  in
> ov5640_set_power_mipi() with the CSI-2 interface disabled to enter
> LP-11 mode (something some receivers like the imx6 one are
> particularly sensible to).

Per OV5640 datasheet.

Register 0x300e bit 2 selects sensor interface mode between MIPI CSI2 
and CPI (parallel), it has nothing to do with LP modes .

Register 0x3019 bits [6:4] control LP00/LP11 mode on CSI2 lines.

> Then at stream time the CSI-2 interface is actually enabled in
> ov5640_set_stream_mipi() just before streaming is started.
> 
> Also the register documentation is very confusing and as reported in
> ov5640_set_stream_mipi() it is also probably wrong (at least in the
> datasheet version I have).
> 
> I would be particularly cautious in touching this sequence as it has
> been validated to work with multiple receivers. Of course if it
> actually fixes an issue for you it should be taken in, but ideally, as
> this sensor is still used in a large number of evaluation boards, it
> should be validated by other consumers of this driver (st, imx,
> microchip and rensas to name a few).

That's quite a tall order which effectively makes it impossible to 
change or fix anything in this driver.
