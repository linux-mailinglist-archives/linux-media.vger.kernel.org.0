Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72985746DE7
	for <lists+linux-media@lfdr.de>; Tue,  4 Jul 2023 11:45:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229915AbjGDJpJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jul 2023 05:45:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229708AbjGDJpH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jul 2023 05:45:07 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD56410CB
        for <linux-media@vger.kernel.org>; Tue,  4 Jul 2023 02:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688463849;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/jnEWvPmkzgcHp/9t9BtLR6H1izews82K6lp3hL8Zhw=;
        b=aPGJazy0UZ2ZrKAXMJp1uUXozQKhcmCi5aNxy4PoKYyDjh5f9N8vWvlfsbGMkcX9lpP5kG
        r104LAHFuUysV0Ek/j01mbQ8GbreZoDYTlYGvftefDXqDkxTcT0wWztdhgSt3zfw63WcKH
        +OogqjvIS8VRpTHzE8ZHVauqrDqbibI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-E_dvWuzcP1mfAcKJ1eHEeQ-1; Tue, 04 Jul 2023 05:44:08 -0400
X-MC-Unique: E_dvWuzcP1mfAcKJ1eHEeQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-988e344bed9so455394766b.0
        for <linux-media@vger.kernel.org>; Tue, 04 Jul 2023 02:44:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688463847; x=1691055847;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/jnEWvPmkzgcHp/9t9BtLR6H1izews82K6lp3hL8Zhw=;
        b=TtKLCwgjSAgxxyy+8l0t7gU7D5Wu/D6hK/WWF9VWMNixlGZEBMy9/tLlHrFVQnAccC
         1sOLrGffbKxwUhxgUa9m4LKfVGUL40YsoQ1kA2jzeyl1DxR3TlPIUzJnGVbUtrmdnAGZ
         qKFsFVYhfwo2r5swdJYP1Iqt89lo0YgFApgyKXa+MViKic8mqa74+FNAN4em9CndOuKC
         RmVlP0dABg2kVo7srnzGu3rnpRDt+SaGVmbFlyQK6FigCuSdTEXDvu9cCVCgGYwvyfUr
         loZOiReRx4NveIfdjzUlE+Vvcl2w6m+bCQqDB+zcPCujZD9+9WSITPbYhlCn5rDTkjuf
         PSkA==
X-Gm-Message-State: ABy/qLbbYMUQc3JgItQYnnVBQRJB8yvV0cAxCEFS9BFoTem4IZqF6H95
        ICJuA+IyV45n/TSXMjde1NTHXIGhYHwg/tP5/3E3Be55CTUn3aXVKrrI66KT9kgeuVXy03VtotT
        yRyrCIQkyyV8ISzIgDUfLch7XjHo5zV8=
X-Received: by 2002:a17:906:f884:b0:98d:f4a7:71cf with SMTP id lg4-20020a170906f88400b0098df4a771cfmr9887539ejb.62.1688463846973;
        Tue, 04 Jul 2023 02:44:06 -0700 (PDT)
X-Google-Smtp-Source: APBJJlE/WXmQT2yXFTfWnXDZZgCTBKraWBgJGCbl2V2hgDrAqjjSs8IIb8JhR4p0vDnkuKOnE+XehQ==
X-Received: by 2002:a17:906:f884:b0:98d:f4a7:71cf with SMTP id lg4-20020a170906f88400b0098df4a771cfmr9887522ejb.62.1688463846694;
        Tue, 04 Jul 2023 02:44:06 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id kt19-20020a170906aad300b00989828a42e8sm13013715ejb.154.2023.07.04.02.44.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 02:44:06 -0700 (PDT)
Message-ID: <750f6763-d08a-efe1-f75e-b8c3a10b7c46@redhat.com>
Date:   Tue, 4 Jul 2023 11:44:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 28/29] media: ov2680: Add link-freq and pixel-rate
 controls
Content-Language: en-US, nl
To:     Dan Scally <dan.scally@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
References: <20230627131830.54601-1-hdegoede@redhat.com>
 <20230627131830.54601-29-hdegoede@redhat.com>
 <6f3d903c-acdc-983c-216b-45792a71d603@ideasonboard.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <6f3d903c-acdc-983c-216b-45792a71d603@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dan,

On 7/4/23 11:22, Dan Scally wrote:
> Morning Hans
> 
> On 27/06/2023 15:18, Hans de Goede wrote:
>> Add read-only link-freq and pixel-rate controls. This is necessary for
>> the sensor to work with the ipu3-cio2 driver and for libcamera.
>>
>> Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>   drivers/media/i2c/ov2680.c | 23 +++++++++++++++++++++++
>>   1 file changed, 23 insertions(+)
>>
>> diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
>> index 8bc542df1890..95d3152ddd22 100644
>> --- a/drivers/media/i2c/ov2680.c
>> +++ b/drivers/media/i2c/ov2680.c
>> @@ -75,6 +75,12 @@
>>   #define OV2680_MIN_CROP_WIDTH            2
>>   #define OV2680_MIN_CROP_HEIGHT            2
>>   +/* Fixed pre-div of 1/2 */
>> +#define OV2680_PLL_PREDIV0            2
>> +
>> +/* Pre-div configurable through reg 0x3080, left at its default of 0x02 : 1/2 */
>> +#define OV2680_PLL_PREDIV            2
>> +
>>   /* 66MHz pixel clock: 66MHz / 1704 * 1294 = 30fps */
>>   #define OV2680_PIXELS_PER_LINE            1704
>>   #define OV2680_LINES_PER_FRAME            1294
>> @@ -118,6 +124,8 @@ struct ov2680_ctrls {
>>       struct v4l2_ctrl *hflip;
>>       struct v4l2_ctrl *vflip;
>>       struct v4l2_ctrl *test_pattern;
>> +    struct v4l2_ctrl *link_freq;
>> +    struct v4l2_ctrl *pixel_rate;
>>   };
>>     struct ov2680_mode {
>> @@ -145,6 +153,8 @@ struct ov2680_dev {
>>       struct clk            *xvclk;
>>       u32                xvclk_freq;
>>       u8                pll_mult;
>> +    s64                link_freq[1];
>> +    s64                pixel_rate;
>>       struct regulator_bulk_data    supplies[OV2680_NUM_SUPPLIES];
>>         struct gpio_desc        *pwdn_gpio;
>> @@ -906,6 +916,12 @@ static int ov2680_v4l2_register(struct ov2680_dev *sensor)
>>       ctrls->gain = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_GAIN,
>>                       0, 1023, 1, 250);
>>   +    ctrls->link_freq = v4l2_ctrl_new_int_menu(hdl, NULL, V4L2_CID_LINK_FREQ,
>> +                          0, 0, sensor->link_freq);
>> +    ctrls->pixel_rate = v4l2_ctrl_new_std(hdl, NULL, V4L2_CID_PIXEL_RATE,
>> +                          0, sensor->pixel_rate,
>> +                          1, sensor->pixel_rate);
>> +
>>       if (hdl->error) {
>>           ret = hdl->error;
>>           goto cleanup_entity;
>> @@ -913,6 +929,7 @@ static int ov2680_v4l2_register(struct ov2680_dev *sensor)
>>         ctrls->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
>>       ctrls->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
>> +    ctrls->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>>         sensor->sd.ctrl_handler = hdl;
>>   @@ -1030,6 +1047,12 @@ static int ov2680_parse_dt(struct ov2680_dev *sensor)
>>         sensor->pll_mult = ov2680_pll_multipliers[i];
>>   +    sensor->link_freq[0] = sensor->xvclk_freq / OV2680_PLL_PREDIV0 /
>> +                   OV2680_PLL_PREDIV * sensor->pll_mult;
>> +
>> +    /* CSI-2 is double data rate, bus-format is 10 bpp */
>> +    sensor->pixel_rate = sensor->link_freq[0] * 2 / 10;
> 
> 
> I'm a little unsure on this one. My understanding is that the link frequency really ought to come from the endpoint properties (which in our case would be set by the ipu-bridge; though it doesn't for this sensor at the moment because I didn't understand it properly back then) because it's a platform specific thing. What the value should be, I have been determining by reading the PLL settings for the sensor whilst the laptop's running Windows. So whilst this is probably technically fine in supporting the link frequency that the driver already expects to configure for whatever platform this was originally designed for, my guess would be that the Miix expects a different link frequency and ideally we'd support that instead. For example see these commits for the ov7251:

The datasheet is clear that the ov2680 is intended to be used with
a fixed pixelclock of 66 MHz:

"2.2 architecture

The OV2680 sensor core generates streaming pixel data at a constant
frame rate to a pixel clock of 66 MHz."

and the ov2680 always operates in single lane mode. So there really is
not much to configure here.

Also the datasheet only contains a rudimentary description of the PLL,
which is not really enough to write a function to configure the PLL for
arbitrary link-frequencies.

The adjustment to make the sensor work with a 19.2MHz xvclk instead
of the default 24 MHz comes from the atomisp code. How to make other
adjustments would pretty much be guess work.

I guess we could add code to check the link-frequencies and check
that there is only 1 and it matches the expected 330 MHz then the driver
still honors the link-frequencies property while at the same time
sticking with the fixed setup the sensor is intended to be used with.

Would adding a link-frequency check like that work for you ?

And if yes what should the link-frequency control return then,
the actual achieved frequency (this would be better IMHO) or
the one from the property ?

Regards,

Hans


