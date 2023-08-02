Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDFDA76D072
	for <lists+linux-media@lfdr.de>; Wed,  2 Aug 2023 16:46:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234437AbjHBOq4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Aug 2023 10:46:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234384AbjHBOqy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Aug 2023 10:46:54 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFC5726AD
        for <linux-media@vger.kernel.org>; Wed,  2 Aug 2023 07:46:51 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id D317D867F0;
        Wed,  2 Aug 2023 16:46:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1690987609;
        bh=pcJqspZzDNcjMoanaeRTWhx5vjh6MDRW2PvtqD/rOf8=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=QS8/DxtxKIijyE7/+EBkpetjFEpwM7k+wBqc7eO6UJJTud86K1bhheB2bZRp/Smxf
         OntgL8SOeMkQ9wKiBij3FPCo5+POp8KO2KAKFTCLdJ8poAOgeZjJPLRwb7hzH0Ug+9
         /GJWL2qYdgqOGQJqTJ293mn+4+D+Ep3SXN/V5ycqG7AAMgRGHPyZ9ly2eXAyPgPI5Y
         6OWgKrUbXWUtfA1rqMvqw2cMkixKY00WNKbTHbOS9DuqdAtq5W6hL8uvqzSjrrIIjR
         1ggE6WoXEkmYe87HcksrHgvAlo6xz0nANHGrCkPTD9hISqSyQM7640k+rrvLpSjePX
         LaoeD8gYxO/qA==
Message-ID: <363a7a51-d55b-3a63-dd35-441ede0acc4f@denx.de>
Date:   Wed, 2 Aug 2023 16:46:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH] media: ov5640: Enable MIPI interface in
 ov5640_set_power_mipi()
Content-Language: en-US
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Jai Luthra <j-luthra@ti.com>,
        Hugues FRUCHET <hugues.fruchet@foss.st.com>,
        Marcel Ziswiler <marcel@ziswiler.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Francesco Dolcini <francesco@dolcini.it>,
        Aishwarya Kothari <aishwarya.kothari@toradex.com>
References: <20230724222210.162785-1-marex@denx.de>
 <c5oh3axckaqfenwm3cq5tictl5ra2hda5dmf65gsrjfxuj7crk@dgdlnph5fxvp>
 <47c49ef5-c77b-cd76-62e7-0d488d667636@denx.de>
 <sopwu4d3sx2wjuixp4fvts5urc3lqcfywoz7fgnp5jq77qhucp@ur4gn6g2vwds>
 <24b03db9-237e-117b-b059-e719e1727177@denx.de>
 <4kekhixn3gvz3lpsdlnvvhjam3zt6mscpywtczxem4zzothwwi@nabn5dojksmc>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <4kekhixn3gvz3lpsdlnvvhjam3zt6mscpywtczxem4zzothwwi@nabn5dojksmc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/2/23 15:13, Jacopo Mondi wrote:
> Hi Marek

Hi,

> On Tue, Jul 25, 2023 at 12:35:00PM +0200, Marek Vasut wrote:
>> On 7/25/23 12:04, Jacopo Mondi wrote:
>>> Hi Marek
>>
>> Hi,
>>
>>> On Tue, Jul 25, 2023 at 11:41:18AM +0200, Marek Vasut wrote:
>>>> On 7/25/23 11:04, Jacopo Mondi wrote:
>>>>> Hi Marek
>>>>
>>>> Hi,
>>>>
>>>>> On Tue, Jul 25, 2023 at 12:22:10AM +0200, Marek Vasut wrote:
>>>>>> Set OV5640_REG_IO_MIPI_CTRL00 bit 2 to 1 instead of 0, since 1 means
>>>>>> MIPI CSI2 interface, while 0 means CPI parallel interface.
>>>>>>
>>>>>> In the ov5640_set_power_mipi() the interface should obviously be set
>>>>>> to MIPI CSI2 since this functions is used to power up the sensor when
>>>>>> operated in MIPI CSI2 mode. The sensor should not be in CPI mode in
>>>>>> that case.
>>>>>
>>>>> Does this actually help fixing your 'first frame corrupted issue' ?
>>>>
>>>> Yes it does.
>>>>
> 
> Do you think it's worth mentioning it in the commit message ?

Done in V2

>>>>> I think the logic here was to power up the interface here  in
>>>>> ov5640_set_power_mipi() with the CSI-2 interface disabled to enter
>>>>> LP-11 mode (something some receivers like the imx6 one are
>>>>> particularly sensible to).
>>>>
>>>> Per OV5640 datasheet.
>>>>
>>>> Register 0x300e bit 2 selects sensor interface mode between MIPI CSI2 and
>>>> CPI (parallel), it has nothing to do with LP modes .
>>>>
>>>> Register 0x3019 bits [6:4] control LP00/LP11 mode on CSI2 lines.
>>>>
>>>>> Then at stream time the CSI-2 interface is actually enabled in
>>>>> ov5640_set_stream_mipi() just before streaming is started.
>>>>>
>>>>> Also the register documentation is very confusing and as reported in
>>>>> ov5640_set_stream_mipi() it is also probably wrong (at least in the
>>>>> datasheet version I have).
>>>>>
>>>>> I would be particularly cautious in touching this sequence as it has
>>>>> been validated to work with multiple receivers. Of course if it
>>>>> actually fixes an issue for you it should be taken in, but ideally, as
>>>>> this sensor is still used in a large number of evaluation boards, it
>>>>> should be validated by other consumers of this driver (st, imx,
>>>>> microchip and rensas to name a few).
> 
> Ok, I've been able to test on i.MX6Q which I was concerned for because
> of its sensitivness to LP-11 detection.
> 
> Let alone that imx6 with ov5640 is broken on mainline because of
> unrelated reasons [1] I've been able to confirm that the sensor still
> works on this platform
> 
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> [Test on imx6q]
> Tested-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> 
> Can you confirm you have tested with iMX8MP as well ?

I tested this great sensor on MN/MP/STM32MP15xx

[...]
