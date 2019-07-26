Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1B4476F17
	for <lists+linux-media@lfdr.de>; Fri, 26 Jul 2019 18:30:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728881AbfGZQaT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jul 2019 12:30:19 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:52057 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727514AbfGZQaT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jul 2019 12:30:19 -0400
Received: by mail-wm1-f68.google.com with SMTP id 207so48525576wma.1
        for <linux-media@vger.kernel.org>; Fri, 26 Jul 2019 09:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynetics-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=A1xGWhunFs7udvZnu/J66Ito5ieEmAW94HlL5VXwoLc=;
        b=iVkgTvaFSgouJ0kgwXtCGrSU5ntW2hFr1jI6o21GK6Pj0r00qjY7TIaaKhrLPMoWjU
         iJ+M306xmAsJCGrX5cg6cUoGZqV6Ytb4emEP7Qnv4ih/UNLvCwZZ++QkBtjL4fTBE0Cj
         GhPd/Qn7ygq0m/9czr1rQmSW/BInRlU3fIA6Aiie+SFgPi2IM3wUc0WEG6FlciD8Tl6f
         gPXQlX/0qiR8HWHFan7vS64wCrKBnbn/orpkrXb352Kn2Iuye8lc18Vy7/V4Pe8k/Otg
         QgmF9xKJrpGGkkX1YrwOQQUObtscHYWMn4yJWB0r708Rra9e4r9rdSABgWKZj/U3S3Mh
         EGqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=A1xGWhunFs7udvZnu/J66Ito5ieEmAW94HlL5VXwoLc=;
        b=W9TstgcjCyY73fy8lN8OcXuZFhkVm7ky5e5+I00C6sp9VSpJFpSZpCfV94kE58Vr/g
         cU/sKXL/P2CxC+TRtECdED3bK99Xx68HBnXw8M4FPWZerUylTRDYLCISy1JBhvXwuE97
         m8Y8EOjVTX+gbPEuBG6t/0/AR1hrzAIcMEI8djLRXff4VbYO+vBq9MhxRUX3SOsvmLJa
         KADNs4SbDHmaEnfRbdIDJieQ7hoUnW4geFpEiyjhDHQDK6r4WCSvsRQ4oegz7vmh0rXe
         /S2fKhTBaQgqsqq0ns6vGtoY9ypkoA/QE9Ltuy8kynCBcls0GdDgyhRtAn0+HmppHOi3
         g8xQ==
X-Gm-Message-State: APjAAAUU6UxpcbhnGlzlKGxI2nLMXmaUleKkqQzx8rujF8rhj0scQsuP
        9o8F3JISb2g8hbT9o0PuAXY=
X-Google-Smtp-Source: APXvYqww1nkzgNeF2yULEXPW+SdVB2szZFndzfwBeMto9qIhgxx+GVGSLsNKK3i6dzF3FTO35ix7Ww==
X-Received: by 2002:a1c:63c4:: with SMTP id x187mr81332470wmb.4.1564158616535;
        Fri, 26 Jul 2019 09:30:16 -0700 (PDT)
Received: from [192.168.197.233] (217-133-17-98.static.clienti.tiscali.it. [217.133.17.98])
        by smtp.gmail.com with ESMTPSA id y12sm48613711wrm.79.2019.07.26.09.30.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Jul 2019 09:30:15 -0700 (PDT)
Subject: Re: Issues with ov5640 camera on i.MX6Q
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Fabio Estevam <festevam@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        loic.poulain@linaro.org, linux-media <linux-media@vger.kernel.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        sam@elite-embedded.com
References: <890e6dbe-2d8e-d674-b17e-2421a38e7acd@kynetics.com>
 <CAOMZO5B3GV8fPLAdsxx2F+dyH68xPn6MN5rehEvwDvjJmirZrg@mail.gmail.com>
 <9785bc82-b741-b60c-ccd7-efdd2b507c6f@kynetics.com>
 <20190724144955.ek6dmlcjjqc3wo2d@uno.localdomain>
From:   Laura Nao <laura.nao@kynetics.com>
Message-ID: <46343866-4913-2b2e-f93a-649bbc6f6092@kynetics.com>
Date:   Fri, 26 Jul 2019 18:30:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190724144955.ek6dmlcjjqc3wo2d@uno.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On 7/24/19 4:49 PM, Jacopo Mondi wrote:
> Hi Laura,
>     thanks for addressing this issue.
> 
> On Mon, Jul 22, 2019 at 05:50:35PM +0200, Laura Nao wrote:
>> Thanks Fabio!
>>
>> I tried tweaking the PLL configuration in the driver and did some further
>> tests on 5.2 kernel.
>>
>> I was finally able to capture RAW frames that match the test pattern for
>> 1280x720 and 1920x1080 resolutions. The 2592x1944 frame is still not
>> perfectly aligned, but it looks much closer to the test pattern.
>>
>> I uploaded the images here:
>>
>> https://imgur.com/a/ywHokMf
>>
>> The changes I made in the driver are below. Not sure these changes make much
>> sense, but they seem to fix 1280x720 and 1920x1080 frames.
>>
> 
> So, this has finally happened :)
> 
> When ~1 year ago we addressed dynamic clock computation for this
> driver the only cases that were tested where the DVP interface by
> Maxime and the CSI-2 one on my side but only for formats with 16bpp
> and 2 data lanes, so I'm not surprised by the fact 8-bit raw fails
> with the current implementation.[1]
> 
> [1] https://patchwork.kernel.org/patch/10680571/
> 
> The driver has clearly commented that once we were to support more
> formats some changes would be required. In example, just before the
> ov5640_set_mipi_pclk() function a FIXME comment reports:
> 
>   * FIXME: this have been tested with 16bpp and 2 lanes setup only.
>   * MIPI_DIV is fixed to value 2, but it -might- be changed according to the
>   * above formula for setups with 1 lane or image formats with different bpp.
>   *
>   * FIXME: this deviates from the sensor manual documentation which is quite
>   * thin on the MIPI clock tree generation part.
> 
> I tried to extensively comment there PLL calculation procedure I
> deduced from the not-so-clear documentation for the sensor, and I
> must admit everytime I look at it again, it is still a pain :)
> 
> While your below fixes are not consumable by mainline, I would be glad
> to help integrating calculation of the PLL in case of raw8 (and
> possibly other formats).
> 
> I suggest to go through the iteration of the above linked series from
> Maxime, as they contain somewhat interesting discussions on both the
> PLL architecture and links to some useful documentation. I will find
> some time to study all of this again in the next days and try to help
> if necessary.
> 
> In the meantime let me cc Maxime (even if he mostly worked on the
> parallel interface support) and Sam, who gave some very interesting
> insights on the PLL architecture.
> 
> Thanks for your work, and please keep me and Maxime CC-ed, as the PLL
> calculation part and CSI-2 support has been quite a big effort, and I
> would like to help having it succesfully working with most use cases!
> 
> Thanks
>     j
> 
>> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
>> index 759d60c6..cfa678e 100644
>> --- a/drivers/media/i2c/ov5640.c
>> +++ b/drivers/media/i2c/ov5640.c
>> @@ -795,13 +795,13 @@ static int ov5640_mod_reg(struct ov5640_dev *sensor,
>> u16 reg,
>>    * FIXME: to be re-calcualted for 1 data lanes setups
>>    */
>>   #define OV5640_MIPI_DIV_PCLK	2
>> -#define OV5640_MIPI_DIV_SCLK	1
>> +#define OV5640_MIPI_DIV_SCLK	2
>>
>>   /*
>>    * This is supposed to be ranging from 1 to 2, but the value is always
>>    * set to 2 in the vendor kernels.
>>    */
>> -#define OV5640_PLL_ROOT_DIV			2
>> +#define OV5640_PLL_ROOT_DIV			1
>>   #define OV5640_PLL_CTRL3_PLL_ROOT_DIV_2		BIT(4)
>>
>>   /*
>> @@ -836,8 +836,8 @@ static unsigned long ov5640_compute_sys_clk(struct
>> ov5640_dev *sensor,
>>   	unsigned long sysclk = sensor->xclk_freq / pll_prediv * pll_mult;
>>
>>   	/* PLL1 output cannot exceed 1GHz. */
>> -	if (sysclk / 1000000 > 1000)
>> -		return 0;
>> +	// if (sysclk / 1000000 > 1000)
>> +	// 	return 0;
>>
>>   	return sysclk / sysdiv;
>>   }
>> @@ -1818,7 +1824,7 @@ static int ov5640_set_mode(struct ov5640_dev *sensor)
>>   	 * All the formats we support have 16 bits per pixel, seems to require
>>   	 * the same rate than YUV, so we can just use 16 bpp all the time.
>>   	 */
>> -	rate = mode->vtot * mode->htot * 16;
>> +	rate = mode->vtot * mode->htot * 8;
>>   	rate *= ov5640_framerates[sensor->current_fr];
>>   	if (sensor->ep.bus_type == V4L2_MBUS_CSI2_DPHY) {
>>   		rate = rate / sensor->ep.bus.mipi_csi2.num_data_lanes;
>>
>> Thanks,
>>
>> Best,
>>
>> Laura
>>
>> On 7/22/19 2:45 PM, Fabio Estevam wrote:
>>> [Adding Steve and Philipp]
>>>
>>> On Thu, Jul 18, 2019 at 10:06 AM Laura Nao <laura.nao@kynetics.com> wrote:
>>>>
>>>> Hello Loic,
>>>>
>>>> I'm having some issues with RAW8 mode on the OV5640 camera and I'd like
>>>> to kindly ask for your advice, as I saw that you added support for RAW
>>>> mode in the mainline kernel driver.
>>>>
>>>> I'm trying to capture some raw images on a i.MX6Q based board. I
>>>> configured the pipeline as follows:
>>>>
>>>> media-ctl -l "'ov5640 1-003c':0 -> 'imx6-mipi-csi2':0[1]"
>>>> media-ctl -l "'imx6-mipi-csi2':2 -> 'ipu1_csi1':0[1]"
>>>> media-ctl -l "'ipu1_csi1':2 -> 'ipu1_csi1 capture':0[1]"
>>>> media-ctl -V "'ov5640 1-003c':0 [fmt:SBGGR8_1X8/2592x1944 field:none]"
>>>> media-ctl -V "'imx6-mipi-csi2':2 [fmt:SBGGR8_1X8/2592x1944 field:none]"
>>>>
>>>> I'm capturing the frame using v4l-utils:
>>>>
>>>> v4l2-ctl -d /dev/video5 --verbose --set-fmt
>>>> video=width=2592,height=1944,pixelformat=BA81 --stream-mmap
>>>> --stream-count=1 --stream-to=bggr_2592x1944.raw
>>>>
>>>> The images I'm obtaining are completely garbled. I tried both 5.2
>>>> mainline and 5.1.18 kernels.
>>>>
>>>> I'm able to correctly capture YUV frames in all resolutions with the
>>>> same driver (with the pipeline configured to go through the
>>>> ipu1_ic_prpenc node first).
>>>>
>>>> Do you have any insight on what might be causing these issues? Is the
>>>> PLL configuration supposed to be changed when RAW8 format is selected?
>>>>
>>>> Thanks for your help,
>>>>
>>>> Best regards,
>>>>
>>>> Laura

Thanks for your reply!

I will go through the discussion you linked a study a bit more your 
(impressive!) previous work for the PLL calculation.

I managed to find a register configuration that works for raw8 2592x1944 
format on the vendor driver 
(https://source.codeaurora.org/external/imx/linux-imx/tree/drivers/media/platform/mxc/capture/ov5640_mipi_v2.c?h=imx_4.14.98_2.0.0_ga), 
hopefully this information will be useful to extract the correct PLL 
calculation for mainline driver as well. I changed the SCLK DIV register 
(0x3035) from 0x11 (default value in vendor driver) to 0x12. Resulting 
2592x1944 raw8 image perfectly matches the test pattern. I didn't try 
other resolutions yet. The configuration that works on vendor driver is 
the following:

- PLL_CTRL1 (0x3035) = 0x12
- PLL_CTRL2 (0x3036) = 0x54
- PLL_CTRL3 (0x3037) = 0x13

This matches the dividers/multipliers obtained in mainline driver from 
the ov5640_calc_sys_clk function when OV5640_MIPI_DIV_SCLK is set to 
0x2. However, something is still missing in mainline driver and 
resulting image is the same as my previous post.

I will try to compare the other register values, to see if I can find 
what makes it work in the vendor driver.

I'll be happy to do some further tests and study a bit more. I'll keep 
you posted if I find out anything useful.

Thanks a lot for the support,

Best,

Laura
