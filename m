Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 413D530432A
	for <lists+linux-media@lfdr.de>; Tue, 26 Jan 2021 16:56:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404056AbhAZP4r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jan 2021 10:56:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404024AbhAZP40 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Jan 2021 10:56:26 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B42E0C061D7F
        for <linux-media@vger.kernel.org>; Tue, 26 Jan 2021 07:55:45 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id t12so4768776ljc.6
        for <linux-media@vger.kernel.org>; Tue, 26 Jan 2021 07:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1qbmsERETvvhmGcrikQHaWP/ykH+HxLm8R4w+ova73M=;
        b=bjS7vGEOTjywoQGHoQ/5v81uMWTKMT+tReITGMTMwdMkp/2jAVJsFULLopIbWpJAcT
         Z1nmq6BNImxs7UhzeY8DppHWy5cKw3Mh2LetNztovAth6Y0ywRbJQCZPc/czRHqcTYzY
         sI5ZGp7RBv4MsWX3Yrl6QF8EKH1hnVG4M1sHgFFg+GYFixlADm8/fQ/V9po7YP/t1K1c
         ue72cHiKFQ74Pl7SI8APNE/5xqsXheIKiJMdvHsbn2src4NJ8aGdhyV1nqUu3BJAXm/d
         Q1tPvwZmEkQnaEwEoq1sxqf/G9bsmJ4gtv/AvL966DCYV/GuUVld5L5tz9cSMg/8hd7N
         YoqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1qbmsERETvvhmGcrikQHaWP/ykH+HxLm8R4w+ova73M=;
        b=ppviMy4WHcnmk3OFSvxPXDmhantt3fZzKuLrbz6lKpGGX7n4rjPC2ySQ0GBCFR+Pps
         ED90TMplAWl1MmRfgj/W0dkZOkobqJFEcoeayoMz0h47063vGA5GvmikgsaWrFFD3NmM
         4o7y4vHe9cgXQDUw64FjNC2sRKoa2lf91deVflxeObmLUX8WPBgchaXAmAdH8Qm3ygGq
         xx5ct/E1bRfYjcWzf+C4zIyJ5i1fZHe+wsYi/RiuiNAmsb88/sYLOqp7sNPHET/mEcvf
         h7zgYrHoRU9So9yKFWFG4qweCLOWK82jARljuNaHI9TYbmp6kR0lqQVdghLRjJyh1fMT
         4zyw==
X-Gm-Message-State: AOAM531ym5B9OTavpJWkaIFjCWcKeazZjHGplMC35Pt+SYrbL5EptGj5
        mXu5cCyYVIw2xopx453ubDvS3A==
X-Google-Smtp-Source: ABdhPJxmxfWWfClFxwpfrcM7WVP0LljcTC4+s4EiVqOiKTXtYoECMMgt/0KEPp+mtfHMEeCHoaY9cA==
X-Received: by 2002:a2e:9d8e:: with SMTP id c14mr3355503ljj.477.1611676544197;
        Tue, 26 Jan 2021 07:55:44 -0800 (PST)
Received: from [192.168.118.216] ([85.249.43.69])
        by smtp.gmail.com with ESMTPSA id z1sm2481481lfc.303.2021.01.26.07.55.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jan 2021 07:55:43 -0800 (PST)
Subject: Re: [PATCH] media: i2c: imx219: Implement V4L2_CID_LINK_FREQ control
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Peter Griffin <peter.griffin@linaro.org>
References: <20210126074934.26980-1-andrey.konovalov@linaro.org>
 <CAPY8ntBmVoe_dMKhd7imcQYRcdJLn4PG3rXzZvGBRVbeCjiL0A@mail.gmail.com>
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
Message-ID: <4c72313b-1b4a-0c7a-a553-144b17763aaa@linaro.org>
Date:   Tue, 26 Jan 2021 18:55:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAPY8ntBmVoe_dMKhd7imcQYRcdJLn4PG3rXzZvGBRVbeCjiL0A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

On 26.01.2021 16:01, Dave Stevenson wrote:
> Hi Andrey
> 
> On Tue, 26 Jan 2021 at 07:50, Andrey Konovalov
> <andrey.konovalov@linaro.org> wrote:
>>
>> This control is needed for imx219 driver, as the link frequency
>> is independent from the pixel rate in this case, and can't be
>> calculated from the pixel rate.
>>
>> Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
>> ---
>>   drivers/media/i2c/imx219.c | 15 ++++++++++++++-
>>   1 file changed, 14 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
>> index 92a8d52776b8..6e3382b85a90 100644
>> --- a/drivers/media/i2c/imx219.c
>> +++ b/drivers/media/i2c/imx219.c
>> @@ -390,6 +390,10 @@ static const struct imx219_reg raw10_framefmt_regs[] = {
>>          {0x0309, 0x0a},
>>   };
>>
>> +static const s64 imx219_link_freq_menu[] = {
>> +       IMX219_DEFAULT_LINK_FREQ,
> 
> Link frequency is one of the parameters that is largely irrelevant on
> the Pi, so I've partially ignored it.

I faced a problem with the imx219 8-bit modes not working with the camss driver
(drivers/media/platform/qcom/camss), as based on the link frequency calculated
from the pixel rate the driver sets the csiphy clock to 100MHz which is too low
for the actual link frequency (4 * 100MHz < 456MHz), and the captured image
becomes garbage.

> Is the link frequency really the same for all modes? Even 8 bit vs 10
> bit readout?

Yes, this is exactly the case.

> The pixel rate is constant at 182.4Mpix/s for all modes.

Right.

> Switching to 8 bit changes register 0x0309 (op_pix_clk_div) from 10 to 8.
> Figure 43 "Clock System Block Diagram" in the datasheet I have says
> this reduces the divider to the FIFO between the pipeline and MIPI. As
> we haven't changed PLL2 or Pre-div2 I'd expect the link frequency to
> stay the same,

That's true.

> but that leaves me confused over that FIFO clock as
> it'll go UP in frequency. I can't quite see how that works, but it
> clearly does.

Yes, the FIFO makes it possible for the different write and read rates to work.
There are few words regarding this in the datasheet, but this isn't enough
to fully understand how it works:
"If, Pix Rate of PLL1 domain < Data Rate of PLL2 domain, data is always
correctly output from the sensor" (page 81)

If I read the datasheet right, for 10-bit modes the both rates are the same
(91.2 MHz). In the 8-bit modes the "Data Rate" increases to 114 MHz while
the "Pix Rate" remains at 91.2 MHz.

> Both 8 and 10 bit modes do read out at the same frame / pixel rate,
> therefore that bit is correct, but that leaves me puzzling over link
> frequency. I have no information on how big that FIFO is, or how it's
> clocked on input and output.
> 
> Simplest option is that as I need to go into the office in the next
> day or so I'll pop into the lab and measure it in each mode.

That would be nice!
In my home "office" I only have a small piece of hardware which claims
to be able to deal with 2 signals up to 72MHz each, which is not enough
for such kind of measurements.

> Otherwise I have no issues with the implementation of the patch.
> 
>    Dave

Thanks,
Andrey

>> +};
>> +
>>   static const char * const imx219_test_pattern_menu[] = {
>>          "Disabled",
>>          "Color Bars",
>> @@ -547,6 +551,7 @@ struct imx219 {
>>          struct v4l2_ctrl_handler ctrl_handler;
>>          /* V4L2 Controls */
>>          struct v4l2_ctrl *pixel_rate;
>> +       struct v4l2_ctrl *link_freq;
>>          struct v4l2_ctrl *exposure;
>>          struct v4l2_ctrl *vflip;
>>          struct v4l2_ctrl *hflip;
>> @@ -1269,7 +1274,7 @@ static int imx219_init_controls(struct imx219 *imx219)
>>          int i, ret;
>>
>>          ctrl_hdlr = &imx219->ctrl_handler;
>> -       ret = v4l2_ctrl_handler_init(ctrl_hdlr, 11);
>> +       ret = v4l2_ctrl_handler_init(ctrl_hdlr, 12);
>>          if (ret)
>>                  return ret;
>>
>> @@ -1283,6 +1288,14 @@ static int imx219_init_controls(struct imx219 *imx219)
>>                                                 IMX219_PIXEL_RATE, 1,
>>                                                 IMX219_PIXEL_RATE);
>>
>> +       imx219->link_freq =
>> +               v4l2_ctrl_new_int_menu(ctrl_hdlr, &imx219_ctrl_ops,
>> +                                      V4L2_CID_LINK_FREQ,
>> +                                      ARRAY_SIZE(imx219_link_freq_menu) - 1, 0,
>> +                                      imx219_link_freq_menu);
>> +       if (imx219->link_freq)
>> +               imx219->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>> +
>>          /* Initial vblank/hblank/exposure parameters based on current mode */
>>          imx219->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops,
>>                                             V4L2_CID_VBLANK, IMX219_VBLANK_MIN,
>> --
>> 2.17.1
>>
