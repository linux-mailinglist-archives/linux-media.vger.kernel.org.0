Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAD82746FF2
	for <lists+linux-media@lfdr.de>; Tue,  4 Jul 2023 13:33:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230246AbjGDLd2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jul 2023 07:33:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230218AbjGDLd0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jul 2023 07:33:26 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2817101
        for <linux-media@vger.kernel.org>; Tue,  4 Jul 2023 04:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688470359;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rMrx2S5654y7gkVcKTs6NJwlGeYQqwpx8hC3Zv8RSgI=;
        b=K2PPCWlTqfHa0CGarFc/+zsJWeTMARjM1LgZ5Fs/aozWkatS5imNA3I6/dYiaHrpVbfwf6
        lFKs176z5R/Dlnxep8YrLsmBPoIpE2w0EcIoLcNyRc62hIhSGTgeBHD+gjRmJ4DbwIFirv
        7r4UNuePy+QW1Rw66fgsf63ED6T7hGE=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-G6Q5U32cO1WO0pGpg0IiDA-1; Tue, 04 Jul 2023 07:32:37 -0400
X-MC-Unique: G6Q5U32cO1WO0pGpg0IiDA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-98df34aa83aso626509666b.1
        for <linux-media@vger.kernel.org>; Tue, 04 Jul 2023 04:32:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688470356; x=1691062356;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rMrx2S5654y7gkVcKTs6NJwlGeYQqwpx8hC3Zv8RSgI=;
        b=XBIhi/HvxAgTxD/vK8eHBuV5yZN/qjCx6O8/Iynik8h4I+zchdccdigEsNh55WgWsq
         KeUR7B3Kj8zhAOVbDhZ/Or0kpsVT/4ZWiGoCMS/cormddJahp11whfWRt94Y1yCRFNoP
         q0uwEZFZT6DCeZ8KV93fkbDhOhSpr+zGKsfEWKGMAjIqvCyxJZcZWuQujuNwhO3YnBIH
         ojnm3nnU+mxn6RZSTGJSkQQAjGpT56TtDyx4vDGUXuGQ11O82uEnflWwKGDSVt9LA0Vf
         r88+YXeL1h1d5izmU5suL3ZLiTsGw9WFO4Fe9g9ysl3CL3OdvaCnTBOpAtRphHg0Yab4
         d84A==
X-Gm-Message-State: AC+VfDxmmrzwC4/ngx07flPK2UoSqvyhHt5zjO1dTELoXGQhuPC12VBH
        hM0WJ76BTXM6jW1py1/aw0dhKJvVkbGFGHWXWL9Jb9zT2Fv0KHCDt1zc9un0lAkex6eIDpbv78y
        +X3MLenvF3h9k969cB/MB3I8=
X-Received: by 2002:a17:907:9704:b0:988:b204:66b0 with SMTP id jg4-20020a170907970400b00988b20466b0mr16332369ejc.33.1688470356777;
        Tue, 04 Jul 2023 04:32:36 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4BWEd6+BWXKz0pSeRXQnu8z1mkqtHW/hTYGRbqFRlRCfil5G3rB+OoIsQziJCHiwk8pCqi8g==
X-Received: by 2002:a17:907:9704:b0:988:b204:66b0 with SMTP id jg4-20020a170907970400b00988b20466b0mr16332359ejc.33.1688470356490;
        Tue, 04 Jul 2023 04:32:36 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id d14-20020a170906370e00b00992e265a22dsm5915281ejc.136.2023.07.04.04.32.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 04:32:35 -0700 (PDT)
Message-ID: <5b2d0bfd-c074-c511-d583-56bad00787c1@redhat.com>
Date:   Tue, 4 Jul 2023 13:32:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 28/29] media: ov2680: Add link-freq and pixel-rate
 controls
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Dan Scally <dan.scally@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
References: <20230627131830.54601-1-hdegoede@redhat.com>
 <20230627131830.54601-29-hdegoede@redhat.com>
 <6f3d903c-acdc-983c-216b-45792a71d603@ideasonboard.com>
 <750f6763-d08a-efe1-f75e-b8c3a10b7c46@redhat.com>
 <CAPY8ntA4NexYVDuuw6-vqLJ33zz7jx+qN9bzx6c3wVGgF51ZfQ@mail.gmail.com>
 <04b22ece-84e0-22de-071b-55d77628c091@redhat.com>
In-Reply-To: <04b22ece-84e0-22de-071b-55d77628c091@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

p.s.

On 7/4/23 13:29, Hans de Goede wrote:
> Hi Dave,
> 
> On 7/4/23 13:23, Dave Stevenson wrote:
>> Hi Hans and Dan
>>
>> On Tue, 4 Jul 2023 at 10:45, Hans de Goede <hdegoede@redhat.com> wrote:
>>>
>>> Hi Dan,
>>>
>>> On 7/4/23 11:22, Dan Scally wrote:
>>>> Morning Hans
>>>>
>>>> On 27/06/2023 15:18, Hans de Goede wrote:
>>>>> Add read-only link-freq and pixel-rate controls. This is necessary for
>>>>> the sensor to work with the ipu3-cio2 driver and for libcamera.
>>>>>
>>>>> Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
>>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>>> ---
>>>>>   drivers/media/i2c/ov2680.c | 23 +++++++++++++++++++++++
>>>>>   1 file changed, 23 insertions(+)
>>>>>
>>>>> diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
>>>>> index 8bc542df1890..95d3152ddd22 100644
>>>>> --- a/drivers/media/i2c/ov2680.c
>>>>> +++ b/drivers/media/i2c/ov2680.c
>>>>> @@ -75,6 +75,12 @@
>>>>>   #define OV2680_MIN_CROP_WIDTH            2
>>>>>   #define OV2680_MIN_CROP_HEIGHT            2
>>>>>   +/* Fixed pre-div of 1/2 */
>>>>> +#define OV2680_PLL_PREDIV0            2
>>>>> +
>>>>> +/* Pre-div configurable through reg 0x3080, left at its default of 0x02 : 1/2 */
>>>>> +#define OV2680_PLL_PREDIV            2
>>>>> +
>>>>>   /* 66MHz pixel clock: 66MHz / 1704 * 1294 = 30fps */
>>>>>   #define OV2680_PIXELS_PER_LINE            1704
>>>>>   #define OV2680_LINES_PER_FRAME            1294
>>>>> @@ -118,6 +124,8 @@ struct ov2680_ctrls {
>>>>>       struct v4l2_ctrl *hflip;
>>>>>       struct v4l2_ctrl *vflip;
>>>>>       struct v4l2_ctrl *test_pattern;
>>>>> +    struct v4l2_ctrl *link_freq;
>>>>> +    struct v4l2_ctrl *pixel_rate;
>>>>>   };
>>>>>     struct ov2680_mode {
>>>>> @@ -145,6 +153,8 @@ struct ov2680_dev {
>>>>>       struct clk            *xvclk;
>>>>>       u32                xvclk_freq;
>>>>>       u8                pll_mult;
>>>>> +    s64                link_freq[1];
>>>>> +    s64                pixel_rate;
>>>>>       struct regulator_bulk_data    supplies[OV2680_NUM_SUPPLIES];
>>>>>         struct gpio_desc        *pwdn_gpio;
>>>>> @@ -906,6 +916,12 @@ static int ov2680_v4l2_register(struct ov2680_dev *sensor)
>>>>>       ctrls->gain = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_GAIN,
>>>>>                       0, 1023, 1, 250);
>>>>>   +    ctrls->link_freq = v4l2_ctrl_new_int_menu(hdl, NULL, V4L2_CID_LINK_FREQ,
>>>>> +                          0, 0, sensor->link_freq);
>>>>> +    ctrls->pixel_rate = v4l2_ctrl_new_std(hdl, NULL, V4L2_CID_PIXEL_RATE,
>>>>> +                          0, sensor->pixel_rate,
>>>>> +                          1, sensor->pixel_rate);
>>>>> +
>>>>>       if (hdl->error) {
>>>>>           ret = hdl->error;
>>>>>           goto cleanup_entity;
>>>>> @@ -913,6 +929,7 @@ static int ov2680_v4l2_register(struct ov2680_dev *sensor)
>>>>>         ctrls->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
>>>>>       ctrls->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
>>>>> +    ctrls->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>>>>>         sensor->sd.ctrl_handler = hdl;
>>>>>   @@ -1030,6 +1047,12 @@ static int ov2680_parse_dt(struct ov2680_dev *sensor)
>>>>>         sensor->pll_mult = ov2680_pll_multipliers[i];
>>>>>   +    sensor->link_freq[0] = sensor->xvclk_freq / OV2680_PLL_PREDIV0 /
>>>>> +                   OV2680_PLL_PREDIV * sensor->pll_mult;
>>>>> +
>>>>> +    /* CSI-2 is double data rate, bus-format is 10 bpp */
>>>>> +    sensor->pixel_rate = sensor->link_freq[0] * 2 / 10;
>>>>
>>>>
>>>> I'm a little unsure on this one. My understanding is that the link frequency really ought to come from the endpoint properties (which in our case would be set by the ipu-bridge; though it doesn't for this sensor at the moment because I didn't understand it properly back then) because it's a platform specific thing. What the value should be, I have been determining by reading the PLL settings for the sensor whilst the laptop's running Windows. So whilst this is probably technically fine in supporting the link frequency that the driver already expects to configure for whatever platform this was originally designed for, my guess would be that the Miix expects a different link frequency and ideally we'd support that instead. For example see these commits for the ov7251:
>>>
>>> The datasheet is clear that the ov2680 is intended to be used with
>>> a fixed pixelclock of 66 MHz:
>>>
>>> "2.2 architecture
>>>
>>> The OV2680 sensor core generates streaming pixel data at a constant
>>> frame rate to a pixel clock of 66 MHz."
>>>
>>> and the ov2680 always operates in single lane mode. So there really is
>>> not much to configure here.
>>>
>>> Also the datasheet only contains a rudimentary description of the PLL,
>>> which is not really enough to write a function to configure the PLL for
>>> arbitrary link-frequencies.
>>
>> Working from an OV2680 datasheet I've found on the internet [1] I'll
>> agree with you that the pixel clock is intended only ever to be 66MHz.
>>
>> With the FIFO at the front of the "image output interface" in fig 2-1,
>> and the dividers shown in fig 2-8, the link frequencies could differ
>> from one fixed ratio from the pixel clock.
>> Not being able to produce fully arbitrary link frequencies is totally
>> acceptable in a driver, so there's no obligation to understand or
>> control those dividers.
>>
>>> The adjustment to make the sensor work with a 19.2MHz xvclk instead
>>> of the default 24 MHz comes from the atomisp code. How to make other
>>> adjustments would pretty much be guess work.
>>>
>>> I guess we could add code to check the link-frequencies and check
>>> that there is only 1 and it matches the expected 330 MHz then the driver
>>> still honors the link-frequencies property while at the same time
>>> sticking with the fixed setup the sensor is intended to be used with.
>>>
>>> Would adding a link-frequency check like that work for you ?
>>
>> This is the approach taken in other drivers - see imx214 and imx219
>> for 2 examples (I've not gone looking for more).
>>
>>> And if yes what should the link-frequency control return then,
>>> the actual achieved frequency (this would be better IMHO) or
>>> the one from the property ?
>>
>> You've checked that the link-frequency matches the expected 330MHz, so
>> isn't the actual achieved frequency the same as the one configured?
>> I'm confused by your statement.
> 
> On x86 devices the ov2680 is used with a 19.2 MHz clock from
> the PMC rather then with a 24 MHz clk.
> 
> This results in a link-frequency of: 331.2 MHz instead of 330
> MHz (and a matching pixel-clk of 66.24 MHz instead of 66 MHz).
> 
> So my question is do we make the link-frequency control
> return 331.2 MHz or 330 MHz when a 19.2 MHz xvclk is used ?
> 
> 330 MHz is what will be requested in the link-frequency
> device property. 331.2 MHz will be what is actually used.
> 
> (the 24MHz xvclk scenario results in an exact link-freq of
> 330MHz)

I just realized that since both the xvclk frequency and the
link-frequency property will both come from the same ACPI
glue we could fix this be actually putting  331.2 MHz
in the property and making the driver accept this as valid
when a 19.2 MHz xvclk is used.

That would make the property and the actually achieved
link-frequency be in sync again. So this is probably the
best way to handle this.

Does this solution work for everyone ?

Regards,
 
Hans





>> I'm assuming that it's the ipu3-cio that needs link-frequency, as
>> AFAIK libcamera doesn't.
>>
>>   Dave
>>
>> [1] http://www.datasheet.es/PDF/1045403/OV2680-pdf.html
>>
>>> Regards,
>>>
>>> Hans
>>>
>>>
>>
> 

