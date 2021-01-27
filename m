Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D0E530607E
	for <lists+linux-media@lfdr.de>; Wed, 27 Jan 2021 17:05:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237006AbhA0QD2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Jan 2021 11:03:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343886AbhA0QA5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Jan 2021 11:00:57 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09C66C0613D6
        for <linux-media@vger.kernel.org>; Wed, 27 Jan 2021 08:00:17 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id f1so3365884lfu.3
        for <linux-media@vger.kernel.org>; Wed, 27 Jan 2021 08:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=89ENyxVTVQpg6FhhefrK7LWVaWoZCkIPm9hvVzAWlbo=;
        b=pL15Gic/Bn0DS7MvCD8zvUv1thf4krOG+SkkiRJDkXpklErXq0tezW9j+OxXxykl7p
         jRl/TiZmAP9LMwNRvZGKlSdbFcXCanDAH7eM7GNf2WImG07Zngo+FjMIisgWAs4rQcHq
         Q0Iu2vg971R7ny3k/ESrjs2Xo8lWH0JwejgmXpIyMElmV7XeEAqD9jV0Q/ztR4xE4xoe
         r2cOj+FBqbvdHRcR6V90dmnMfqAt0uYUFIy/KEHeMh3zavf+4dhy3UfMV2jKCqRoun2S
         yCkUi2tJX6mSHLCfsWceubADnBA+gZAJ+KpJmf7v7HXDBIIU++aubESXPM3OL1aUdzye
         JbIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=89ENyxVTVQpg6FhhefrK7LWVaWoZCkIPm9hvVzAWlbo=;
        b=uJz073lSKm4ykoqUYGFKgjEeI9lPdeYy72WUaSE20uZDQ+sWzgSv7osnPECfHaJoRJ
         ENlKx5SC+7yVfoLouE629JkRhjpJSwApBDlniotwf4GxFdILE0oHGAa639NakthYhzhj
         HOSgInDqSpbMEgG08ASa4qSwznqKl2eB8r63f/E1zlO0IhXkw5kUjofJAbYswvYMxdQJ
         WcOEDz80GWUqx+GsAvdd2D7Z1EhZFsKRsWDXkb2sY1zRvkaz3TfU/eezSMTQxBektN8G
         pcLYZLn7+s4El0KEMwwNFtS5GpfxvieI43ZZO0gpIgZb8ZxQ52yM1lJrR6HLN7x5VsoF
         qYQA==
X-Gm-Message-State: AOAM533RntcA5nIhndbbZCeH44JEOSYj5aBliScu+ucgd4t/bT/eu7Cw
        z8Hb5TUdxF34j38Aor/V7OwYdg==
X-Google-Smtp-Source: ABdhPJxtjgq6C8kgqcuB+L2KpXXMxoxZBnEq1N/eTAR0ABl6xIG3lgI9qIgGjkPQU11mQqXuAnUAcA==
X-Received: by 2002:ac2:455b:: with SMTP id j27mr5544740lfm.384.1611763215266;
        Wed, 27 Jan 2021 08:00:15 -0800 (PST)
Received: from [192.168.118.216] ([85.249.43.69])
        by smtp.gmail.com with ESMTPSA id x36sm572346lfu.129.2021.01.27.08.00.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jan 2021 08:00:14 -0800 (PST)
Subject: Re: [PATCH] media: i2c: imx219: Implement V4L2_CID_LINK_FREQ control
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Peter Griffin <peter.griffin@linaro.org>
References: <20210126074934.26980-1-andrey.konovalov@linaro.org>
 <CAPY8ntBmVoe_dMKhd7imcQYRcdJLn4PG3rXzZvGBRVbeCjiL0A@mail.gmail.com>
 <4c72313b-1b4a-0c7a-a553-144b17763aaa@linaro.org>
 <CAPY8ntBsbaxaLHrHnoJNUgUBZ7Lg-HnNtdyaMB0qLeRZW=x2Pw@mail.gmail.com>
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
Message-ID: <681dd0c8-48d1-4561-e6a9-f40f55232ec1@linaro.org>
Date:   Wed, 27 Jan 2021 19:00:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAPY8ntBsbaxaLHrHnoJNUgUBZ7Lg-HnNtdyaMB0qLeRZW=x2Pw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi David,

On 27.01.2021 18:25, Dave Stevenson wrote:
> Hi Andrey
> 
> On Tue, 26 Jan 2021 at 15:55, Andrey Konovalov
> <andrey.konovalov@linaro.org> wrote:
>>
>> Hi Dave,
>>
>> On 26.01.2021 16:01, Dave Stevenson wrote:
>>> Hi Andrey
>>>
>>> On Tue, 26 Jan 2021 at 07:50, Andrey Konovalov
>>> <andrey.konovalov@linaro.org> wrote:
>>>>
>>>> This control is needed for imx219 driver, as the link frequency
>>>> is independent from the pixel rate in this case, and can't be
>>>> calculated from the pixel rate.
>>>>
>>>> Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
>>>> ---
>>>>    drivers/media/i2c/imx219.c | 15 ++++++++++++++-
>>>>    1 file changed, 14 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
>>>> index 92a8d52776b8..6e3382b85a90 100644
>>>> --- a/drivers/media/i2c/imx219.c
>>>> +++ b/drivers/media/i2c/imx219.c
>>>> @@ -390,6 +390,10 @@ static const struct imx219_reg raw10_framefmt_regs[] = {
>>>>           {0x0309, 0x0a},
>>>>    };
>>>>
>>>> +static const s64 imx219_link_freq_menu[] = {
>>>> +       IMX219_DEFAULT_LINK_FREQ,
>>>
>>> Link frequency is one of the parameters that is largely irrelevant on
>>> the Pi, so I've partially ignored it.
>>
>> I faced a problem with the imx219 8-bit modes not working with the camss driver
>> (drivers/media/platform/qcom/camss), as based on the link frequency calculated
>> from the pixel rate the driver sets the csiphy clock to 100MHz which is too low
>> for the actual link frequency (4 * 100MHz < 456MHz), and the captured image
>> becomes garbage.
>>
>>> Is the link frequency really the same for all modes? Even 8 bit vs 10
>>> bit readout?
>>
>> Yes, this is exactly the case.
>>
>>> The pixel rate is constant at 182.4Mpix/s for all modes.
>>
>> Right.
>>
>>> Switching to 8 bit changes register 0x0309 (op_pix_clk_div) from 10 to 8.
>>> Figure 43 "Clock System Block Diagram" in the datasheet I have says
>>> this reduces the divider to the FIFO between the pipeline and MIPI. As
>>> we haven't changed PLL2 or Pre-div2 I'd expect the link frequency to
>>> stay the same,
>>
>> That's true.
>>
>>> but that leaves me confused over that FIFO clock as
>>> it'll go UP in frequency. I can't quite see how that works, but it
>>> clearly does.
>>
>> Yes, the FIFO makes it possible for the different write and read rates to work.
>> There are few words regarding this in the datasheet, but this isn't enough
>> to fully understand how it works:
>> "If, Pix Rate of PLL1 domain < Data Rate of PLL2 domain, data is always
>> correctly output from the sensor" (page 81)
>>
>> If I read the datasheet right, for 10-bit modes the both rates are the same
>> (91.2 MHz). In the 8-bit modes the "Data Rate" increases to 114 MHz while
>> the "Pix Rate" remains at 91.2 MHz.
> 
> There looks to be some magic in there. Without knowing the details of
> the size of the FIFO and when it triggers the output stage to start
> sending data, it's hard to say exactly what is going on.
> I'm guessing that it has to be large enough to take a whole line, and
> triggers when the line is complete. The CSI2 bus can then run at the
> frequency defined, independent of pixel rate or bit depth.
> 
>>> Both 8 and 10 bit modes do read out at the same frame / pixel rate,
>>> therefore that bit is correct, but that leaves me puzzling over link
>>> frequency. I have no information on how big that FIFO is, or how it's
>>> clocked on input and output.
>>>
>>> Simplest option is that as I need to go into the office in the next
>>> day or so I'll pop into the lab and measure it in each mode.
>>
>> That would be nice!
>> In my home "office" I only have a small piece of hardware which claims
>> to be able to deal with 2 signals up to 72MHz each, which is not enough
>> for such kind of measurements.
> 
> My home "office" is likewise compromised, but the work office is still
> available and has suitable equipment :-)
> 
> I can't be that precise as I'm not bothering to get differential
> probes out and the like, but it does appear that the clock lane is
> running at the same speed for both 8 and 10 bit.
> I measured (cursors off the scope, measured over 4 cycles) 2.21ns for
> 8 bit, and 2.18ns for 10 bit, corresponding to 452 and 458MHz
> respectively. Those are well within the experimental error of my setup
> to be the 456MHz defined in the driver.

I expected that, but having this confirmed experimentally is so great!

> Based on that I'm happy.
> 
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Thanks,
Andrey

>>> Otherwise I have no issues with the implementation of the patch.
>>>
>>>     Dave
>>
>> Thanks,
>> Andrey
>>
>>>> +};
>>>> +
>>>>    static const char * const imx219_test_pattern_menu[] = {
>>>>           "Disabled",
>>>>           "Color Bars",
>>>> @@ -547,6 +551,7 @@ struct imx219 {
>>>>           struct v4l2_ctrl_handler ctrl_handler;
>>>>           /* V4L2 Controls */
>>>>           struct v4l2_ctrl *pixel_rate;
>>>> +       struct v4l2_ctrl *link_freq;
>>>>           struct v4l2_ctrl *exposure;
>>>>           struct v4l2_ctrl *vflip;
>>>>           struct v4l2_ctrl *hflip;
>>>> @@ -1269,7 +1274,7 @@ static int imx219_init_controls(struct imx219 *imx219)
>>>>           int i, ret;
>>>>
>>>>           ctrl_hdlr = &imx219->ctrl_handler;
>>>> -       ret = v4l2_ctrl_handler_init(ctrl_hdlr, 11);
>>>> +       ret = v4l2_ctrl_handler_init(ctrl_hdlr, 12);
>>>>           if (ret)
>>>>                   return ret;
>>>>
>>>> @@ -1283,6 +1288,14 @@ static int imx219_init_controls(struct imx219 *imx219)
>>>>                                                  IMX219_PIXEL_RATE, 1,
>>>>                                                  IMX219_PIXEL_RATE);
>>>>
>>>> +       imx219->link_freq =
>>>> +               v4l2_ctrl_new_int_menu(ctrl_hdlr, &imx219_ctrl_ops,
>>>> +                                      V4L2_CID_LINK_FREQ,
>>>> +                                      ARRAY_SIZE(imx219_link_freq_menu) - 1, 0,
>>>> +                                      imx219_link_freq_menu);
>>>> +       if (imx219->link_freq)
>>>> +               imx219->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>>>> +
>>>>           /* Initial vblank/hblank/exposure parameters based on current mode */
>>>>           imx219->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops,
>>>>                                              V4L2_CID_VBLANK, IMX219_VBLANK_MIN,
>>>> --
>>>> 2.17.1
>>>>
