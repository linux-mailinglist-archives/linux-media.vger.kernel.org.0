Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CBD13D375C
	for <lists+linux-media@lfdr.de>; Fri, 23 Jul 2021 11:07:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234102AbhGWI1J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Jul 2021 04:27:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229949AbhGWI1J (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Jul 2021 04:27:09 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B7ECC061575;
        Fri, 23 Jul 2021 02:07:42 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id j2so1520834wrx.9;
        Fri, 23 Jul 2021 02:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=CCnPRl7EA4l7yZ6RHN/fMr7qCw/Z8yXuJPIxUAId/f4=;
        b=pAhiGSfu2WJ97zNxvnOhgg0CHnrt07JGTfhMP71TVz1pqS0z4AsCXMK8yKJ76CSeLu
         eU50bkXWxy/0BdT7sQE3SXbWRTJ7lj9zQyJFSwfDws8K4gwa2MR9djR+7+R67p9mP2dH
         q51UASJr303nhLgO3K9VYZui8pVv2zWcdz7qMabrZxTA3o9XQHRj8KofgALwxFZ9ZMts
         17yO3RGqyCDsV+533d2jqbWutulzGtv6ND+KkFe7tQgonqbFZ1BnrTGy3fnjP7zTjS/S
         kMk7UDCSqcjkpl/Ng0QzRzMTaLKuvixUC6KfWAmGV/stmmcXrpqCg6cYWdyIuwGMvqxs
         M1OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=CCnPRl7EA4l7yZ6RHN/fMr7qCw/Z8yXuJPIxUAId/f4=;
        b=HxP52Ul6MpP1Iahf192G1kL+1dBrvk5Zy17rrcEq7LFKUM6V+wnmSoLdldgSrcEr/c
         /dSZIW8SoKgKW7FuvmmaqIvfQIA3Gp1Ldx0EyaDQkerwi+kXG+B62NT6o83IDHqGsV2o
         82QHCCtvsgBPPH70FMfx9zrW+vTUrE4pn0jKJa8HxSmPpH0YxWSub0WfpKF/qQFFjig5
         VcBSLM1u8sFa0VnT5OrCfV6OLWU2SIKywY+WyFWErZjgXogtzRMpfGEoTlsnhgIUvKZR
         uj/2bMYKvAe6QDQONzP7BgeFQziscK9pKCOy2zBdVpGeBe1xkqiOmnwSlK9MREAPDIKH
         T+kQ==
X-Gm-Message-State: AOAM532JbEBAb8kY3SzYTmf5aGtFS7R2j3eBuH12NPAz6GpBwRRzTzq8
        cpfKedFsTc9ey49mxmwF0Xk=
X-Google-Smtp-Source: ABdhPJz7Pz4Q0k39uTPgQR/7w4zdoRG3w/szNEHQ0qwRJR23mbbOrujH4wEOutuWEzrrHWfbWBkgfg==
X-Received: by 2002:adf:9cc7:: with SMTP id h7mr4120914wre.186.1627031261144;
        Fri, 23 Jul 2021 02:07:41 -0700 (PDT)
Received: from [192.168.1.211] ([2.29.20.106])
        by smtp.gmail.com with ESMTPSA id x18sm31623301wrw.19.2021.07.23.02.07.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jul 2021 02:07:40 -0700 (PDT)
Subject: Re: [PATCH 12/13] media: i2c: Remove unused macros from ov8865
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Yang Li <yang.lee@linux.alibaba.com>,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Colin Ian King <colin.king@canonical.com>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>
References: <20210722203407.3588046-1-djrscally@gmail.com>
 <20210722203407.3588046-13-djrscally@gmail.com>
 <CAHp75Vcmo8rD=WpECbKfpByBr1pAL+7gV2eycZ=3M+YDWUzOFw@mail.gmail.com>
 <YPp3FU0Tr9oGGcqc@aptenodytes>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <e4e95d14-16ab-4e18-db4c-c466ab87d52c@gmail.com>
Date:   Fri, 23 Jul 2021 10:07:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YPp3FU0Tr9oGGcqc@aptenodytes>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 23/07/2021 09:00, Paul Kocialkowski wrote:
> Hi,
>
> On Fri 23 Jul 21, 01:19, Andy Shevchenko wrote:
>> On Thursday, July 22, 2021, Daniel Scally <djrscally@gmail.com> wrote:
>>
>>> There are a number of macros defined in this driver that aren't actually
>>> used within it. There's a lot of macros defined in total, so removing the
>>> unused ones helps make it a bit less busy.
>>>
>>> Signed-off-by: Daniel Scally <djrscally@gmail.com>
>>> ---
>>>
>>> I wavered about including this, because it might be helpful for someone
>>> adding
>>> support for other features in the future to have these already defined,
>>> but in
>>> the end I thought it slightly better to be less busy.
>> Exactly! I would leave the registers and bitfield definitions untouched as
>> they play role of documentation. Of course even if you remove them, they
>> will be in the history, but a) harder to access; b) adding new feature may
>> introduce slightly different names for the same things.
> I agree that it's better to keep them around. for the same reasons.
>
> Cheers,
>
> Paul


Okedokey, will drop this one then - thanks both

>
>>>  drivers/media/i2c/ov8865.c | 137 +------------------------------------
>>>  1 file changed, 1 insertion(+), 136 deletions(-)
>>>
>>> diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
>>> index dca4db3039bb..9b38f2e16906 100644
>>> --- a/drivers/media/i2c/ov8865.c
>>> +++ b/drivers/media/i2c/ov8865.c
>>> @@ -46,8 +46,6 @@
>>>  #define OV8865_PLL_CTRL6_REG                   0x306
>>>  #define OV8865_PLL_CTRL6_SYS_DIV(v)            (((v) - 1) & BIT(0))
>>>
>>> -#define OV8865_PLL_CTRL8_REG                   0x308
>>> -#define OV8865_PLL_CTRL9_REG                   0x309
>>>  #define OV8865_PLL_CTRLA_REG                   0x30a
>>>  #define OV8865_PLL_CTRLA_PRE_DIV_HALF(v)       (((v) - 1) & BIT(0))
>>>  #define OV8865_PLL_CTRLB_REG                   0x30b
>>> @@ -60,41 +58,21 @@
>>>  #define OV8865_PLL_CTRLE_SYS_DIV(v)            ((v) & GENMASK(2, 0))
>>>  #define OV8865_PLL_CTRLF_REG                   0x30f
>>>  #define OV8865_PLL_CTRLF_SYS_PRE_DIV(v)                (((v) - 1) &
>>> GENMASK(3, 0))
>>> -#define OV8865_PLL_CTRL10_REG                  0x310
>>> -#define OV8865_PLL_CTRL11_REG                  0x311
>>>  #define OV8865_PLL_CTRL12_REG                  0x312
>>>  #define OV8865_PLL_CTRL12_PRE_DIV_HALF(v)      ((((v) - 1) << 4) &
>>> BIT(4))
>>>  #define OV8865_PLL_CTRL12_DAC_DIV(v)           (((v) - 1) & GENMASK(3, 0))
>>>
>>> -#define OV8865_PLL_CTRL1B_REG                  0x31b
>>> -#define OV8865_PLL_CTRL1C_REG                  0x31c
>>> -
>>>  #define OV8865_PLL_CTRL1E_REG                  0x31e
>>>  #define OV8865_PLL_CTRL1E_PLL1_NO_LAT          BIT(3)
>>>
>>> -#define OV8865_PAD_OEN0_REG                    0x3000
>>> -
>>> -#define OV8865_PAD_OEN2_REG                    0x3002
>>> -
>>> -#define OV8865_CLK_RST5_REG                    0x3005
>>> -
>>>  #define OV8865_CHIP_ID_HH_REG                  0x300a
>>>  #define OV8865_CHIP_ID_HH_VALUE                        0x00
>>>  #define OV8865_CHIP_ID_H_REG                   0x300b
>>>  #define OV8865_CHIP_ID_H_VALUE                 0x88
>>>  #define OV8865_CHIP_ID_L_REG                   0x300c
>>>  #define OV8865_CHIP_ID_L_VALUE                 0x65
>>> -#define OV8865_PAD_OUT2_REG                    0x300d
>>> -
>>> -#define OV8865_PAD_SEL2_REG                    0x3010
>>> -#define OV8865_PAD_PK_REG                      0x3011
>>> -#define OV8865_PAD_PK_DRIVE_STRENGTH_1X                (0 << 5)
>>> -#define OV8865_PAD_PK_DRIVE_STRENGTH_2X                (1 << 5)
>>> -#define OV8865_PAD_PK_DRIVE_STRENGTH_3X                (2 << 5)
>>> -#define OV8865_PAD_PK_DRIVE_STRENGTH_4X                (3 << 5)
>>>
>>>  #define OV8865_PUMP_CLK_DIV_REG                        0x3015
>>> -#define OV8865_PUMP_CLK_DIV_PUMP_N(v)          (((v) << 4) & GENMASK(6,
>>> 4))
>>>  #define OV8865_PUMP_CLK_DIV_PUMP_P(v)          ((v) & GENMASK(2, 0))
>>>
>>>  #define OV8865_MIPI_SC_CTRL0_REG               0x3018
>>> @@ -102,21 +80,12 @@
>>>                                                  GENMASK(7, 5))
>>>  #define OV8865_MIPI_SC_CTRL0_MIPI_EN           BIT(4)
>>>  #define OV8865_MIPI_SC_CTRL0_UNKNOWN           BIT(1)
>>> -#define OV8865_MIPI_SC_CTRL0_LANES_PD_MIPI     BIT(0)
>>> -#define OV8865_MIPI_SC_CTRL1_REG               0x3019
>>> -#define OV8865_CLK_RST0_REG                    0x301a
>>> -#define OV8865_CLK_RST1_REG                    0x301b
>>> -#define OV8865_CLK_RST2_REG                    0x301c
>>> -#define OV8865_CLK_RST3_REG                    0x301d
>>> -#define OV8865_CLK_RST4_REG                    0x301e
>>>
>>>  #define OV8865_PCLK_SEL_REG                    0x3020
>>>  #define OV8865_PCLK_SEL_PCLK_DIV_MASK          BIT(3)
>>>  #define OV8865_PCLK_SEL_PCLK_DIV(v)            ((((v) - 1) << 3) & BIT(3))
>>>
>>> -#define OV8865_MISC_CTRL_REG                   0x3021
>>>  #define OV8865_MIPI_SC_CTRL2_REG               0x3022
>>> -#define OV8865_MIPI_SC_CTRL2_CLK_LANES_PD_MIPI BIT(1)
>>>  #define OV8865_MIPI_SC_CTRL2_PD_MIPI_RST_SYNC  BIT(0)
>>>
>>>  #define OV8865_MIPI_BIT_SEL_REG                        0x3031
>>> @@ -125,7 +94,6 @@
>>>  #define OV8865_CLK_SEL0_PLL1_SYS_SEL(v)                (((v) << 7) &
>>> BIT(7))
>>>  #define OV8865_CLK_SEL1_REG                    0x3033
>>>  #define OV8865_CLK_SEL1_MIPI_EOF               BIT(5)
>>> -#define OV8865_CLK_SEL1_UNKNOWN                        BIT(2)
>>>  #define OV8865_CLK_SEL1_PLL_SCLK_SEL_MASK      BIT(1)
>>>  #define OV8865_CLK_SEL1_PLL_SCLK_SEL(v)                (((v) << 1) &
>>> BIT(1))
>>>
>>> @@ -142,7 +110,6 @@
>>>  #define OV8865_EXPOSURE_CTRL_H(v)              (((v) & GENMASK(15, 8)) >>
>>> 8)
>>>  #define OV8865_EXPOSURE_CTRL_L_REG             0x3502
>>>  #define OV8865_EXPOSURE_CTRL_L(v)              ((v) & GENMASK(7, 0))
>>> -#define OV8865_EXPOSURE_GAIN_MANUAL_REG                0x3503
>>>
>>>  #define OV8865_GAIN_CTRL_H_REG                 0x3508
>>>  #define OV8865_GAIN_CTRL_H(v)                  (((v) & GENMASK(12, 8)) >>
>>> 8)
>>> @@ -197,18 +164,6 @@
>>>  #define OV8865_INC_X_ODD(v)                    ((v) & GENMASK(4, 0))
>>>  #define OV8865_INC_X_EVEN_REG                  0x3815
>>>  #define OV8865_INC_X_EVEN(v)                   ((v) & GENMASK(4, 0))
>>> -#define OV8865_VSYNC_START_H_REG               0x3816
>>> -#define OV8865_VSYNC_START_H(v)                        (((v) &
>>> GENMASK(15, 8)) >> 8)
>>> -#define OV8865_VSYNC_START_L_REG               0x3817
>>> -#define OV8865_VSYNC_START_L(v)                        ((v) & GENMASK(7,
>>> 0))
>>> -#define OV8865_VSYNC_END_H_REG                 0x3818
>>> -#define OV8865_VSYNC_END_H(v)                  (((v) & GENMASK(15, 8)) >>
>>> 8)
>>> -#define OV8865_VSYNC_END_L_REG                 0x3819
>>> -#define OV8865_VSYNC_END_L(v)                  ((v) & GENMASK(7, 0))
>>> -#define OV8865_HSYNC_FIRST_H_REG               0x381a
>>> -#define OV8865_HSYNC_FIRST_H(v)                        (((v) &
>>> GENMASK(15, 8)) >> 8)
>>> -#define OV8865_HSYNC_FIRST_L_REG               0x381b
>>> -#define OV8865_HSYNC_FIRST_L(v)                        ((v) & GENMASK(7,
>>> 0))
>>>
>>>  #define OV8865_FORMAT1_REG                     0x3820
>>>  #define OV8865_FORMAT1_FLIP_VERT_ISP_EN                BIT(2)
>>> @@ -240,10 +195,6 @@
>>>  #define OV8865_AUTO_SIZE_CTRL_CROP_END_X_REG   BIT(2)
>>>  #define OV8865_AUTO_SIZE_CTRL_CROP_START_Y_REG BIT(1)
>>>  #define OV8865_AUTO_SIZE_CTRL_CROP_START_X_REG BIT(0)
>>> -#define OV8865_AUTO_SIZE_X_OFFSET_H_REG                0x3842
>>> -#define OV8865_AUTO_SIZE_X_OFFSET_L_REG                0x3843
>>> -#define OV8865_AUTO_SIZE_Y_OFFSET_H_REG                0x3844
>>> -#define OV8865_AUTO_SIZE_Y_OFFSET_L_REG                0x3845
>>>  #define OV8865_AUTO_SIZE_BOUNDARIES_REG                0x3846
>>>  #define OV8865_AUTO_SIZE_BOUNDARIES_Y(v)       (((v) << 4) & GENMASK(7,
>>> 4))
>>>  #define OV8865_AUTO_SIZE_BOUNDARIES_X(v)       ((v) & GENMASK(3, 0))
>>> @@ -259,30 +210,10 @@
>>>  #define OV8865_BLC_CTRL0_TRIG_FORMAT_EN                BIT(6)
>>>  #define OV8865_BLC_CTRL0_TRIG_GAIN_EN          BIT(5)
>>>  #define OV8865_BLC_CTRL0_TRIG_EXPOSURE_EN      BIT(4)
>>> -#define OV8865_BLC_CTRL0_TRIG_MANUAL_EN                BIT(3)
>>> -#define OV8865_BLC_CTRL0_FREEZE_EN             BIT(2)
>>> -#define OV8865_BLC_CTRL0_ALWAYS_EN             BIT(1)
>>>  #define OV8865_BLC_CTRL0_FILTER_EN             BIT(0)
>>>  #define OV8865_BLC_CTRL1_REG                   0x4001
>>> -#define OV8865_BLC_CTRL1_DITHER_EN             BIT(7)
>>> -#define OV8865_BLC_CTRL1_ZERO_LINE_DIFF_EN     BIT(6)
>>> -#define OV8865_BLC_CTRL1_COL_SHIFT_256         (0 << 4)
>>>  #define OV8865_BLC_CTRL1_COL_SHIFT_128         (1 << 4)
>>> -#define OV8865_BLC_CTRL1_COL_SHIFT_64          (2 << 4)
>>> -#define OV8865_BLC_CTRL1_COL_SHIFT_32          (3 << 4)
>>>  #define OV8865_BLC_CTRL1_OFFSET_LIMIT_EN       BIT(2)
>>> -#define OV8865_BLC_CTRL1_COLUMN_CANCEL_EN      BIT(1)
>>> -#define OV8865_BLC_CTRL2_REG                   0x4002
>>> -#define OV8865_BLC_CTRL3_REG                   0x4003
>>> -#define OV8865_BLC_CTRL4_REG                   0x4004
>>> -#define OV8865_BLC_CTRL5_REG                   0x4005
>>> -#define OV8865_BLC_CTRL6_REG                   0x4006
>>> -#define OV8865_BLC_CTRL7_REG                   0x4007
>>> -#define OV8865_BLC_CTRL8_REG                   0x4008
>>> -#define OV8865_BLC_CTRL9_REG                   0x4009
>>> -#define OV8865_BLC_CTRLA_REG                   0x400a
>>> -#define OV8865_BLC_CTRLB_REG                   0x400b
>>> -#define OV8865_BLC_CTRLC_REG                   0x400c
>>>  #define OV8865_BLC_CTRLD_REG                   0x400d
>>>  #define OV8865_BLC_CTRLD_OFFSET_TRIGGER(v)     ((v) & GENMASK(7, 0))
>>>
>>> @@ -337,66 +268,8 @@
>>>
>>>  /* MIPI */
>>>
>>> -#define OV8865_MIPI_CTRL0_REG                  0x4800
>>> -#define OV8865_MIPI_CTRL1_REG                  0x4801
>>> -#define OV8865_MIPI_CTRL2_REG                  0x4802
>>> -#define OV8865_MIPI_CTRL3_REG                  0x4803
>>> -#define OV8865_MIPI_CTRL4_REG                  0x4804
>>> -#define OV8865_MIPI_CTRL5_REG                  0x4805
>>> -#define OV8865_MIPI_CTRL6_REG                  0x4806
>>> -#define OV8865_MIPI_CTRL7_REG                  0x4807
>>> -#define OV8865_MIPI_CTRL8_REG                  0x4808
>>> -
>>> -#define OV8865_MIPI_FCNT_MAX_H_REG             0x4810
>>> -#define OV8865_MIPI_FCNT_MAX_L_REG             0x4811
>>> -
>>> -#define OV8865_MIPI_CTRL13_REG                 0x4813
>>> -#define OV8865_MIPI_CTRL14_REG                 0x4814
>>> -#define OV8865_MIPI_CTRL15_REG                 0x4815
>>> -#define OV8865_MIPI_EMBEDDED_DT_REG            0x4816
>>> -
>>> -#define OV8865_MIPI_HS_ZERO_MIN_H_REG          0x4818
>>> -#define OV8865_MIPI_HS_ZERO_MIN_L_REG          0x4819
>>> -#define OV8865_MIPI_HS_TRAIL_MIN_H_REG         0x481a
>>> -#define OV8865_MIPI_HS_TRAIL_MIN_L_REG         0x481b
>>> -#define OV8865_MIPI_CLK_ZERO_MIN_H_REG         0x481c
>>> -#define OV8865_MIPI_CLK_ZERO_MIN_L_REG         0x481d
>>> -#define OV8865_MIPI_CLK_PREPARE_MAX_REG                0x481e
>>> -#define OV8865_MIPI_CLK_PREPARE_MIN_REG                0x481f
>>> -#define OV8865_MIPI_CLK_POST_MIN_H_REG         0x4820
>>> -#define OV8865_MIPI_CLK_POST_MIN_L_REG         0x4821
>>> -#define OV8865_MIPI_CLK_TRAIL_MIN_H_REG                0x4822
>>> -#define OV8865_MIPI_CLK_TRAIL_MIN_L_REG                0x4823
>>> -#define OV8865_MIPI_LPX_P_MIN_H_REG            0x4824
>>> -#define OV8865_MIPI_LPX_P_MIN_L_REG            0x4825
>>> -#define OV8865_MIPI_HS_PREPARE_MIN_REG         0x4826
>>> -#define OV8865_MIPI_HS_PREPARE_MAX_REG         0x4827
>>> -#define OV8865_MIPI_HS_EXIT_MIN_H_REG          0x4828
>>> -#define OV8865_MIPI_HS_EXIT_MIN_L_REG          0x4829
>>> -#define OV8865_MIPI_UI_HS_ZERO_MIN_REG         0x482a
>>> -#define OV8865_MIPI_UI_HS_TRAIL_MIN_REG                0x482b
>>> -#define OV8865_MIPI_UI_CLK_ZERO_MIN_REG                0x482c
>>> -#define OV8865_MIPI_UI_CLK_PREPARE_REG         0x482d
>>> -#define OV8865_MIPI_UI_CLK_POST_MIN_REG                0x482e
>>> -#define OV8865_MIPI_UI_CLK_TRAIL_MIN_REG       0x482f
>>> -#define OV8865_MIPI_UI_LPX_P_MIN_REG           0x4830
>>> -#define OV8865_MIPI_UI_HS_PREPARE_REG          0x4831
>>> -#define OV8865_MIPI_UI_HS_EXIT_MIN_REG         0x4832
>>> -#define OV8865_MIPI_PKT_START_SIZE_REG         0x4833
>>> -
>>>  #define OV8865_MIPI_PCLK_PERIOD_REG            0x4837
>>> -#define OV8865_MIPI_LP_GPIO0_REG               0x4838
>>> -#define OV8865_MIPI_LP_GPIO1_REG               0x4839
>>> -
>>> -#define OV8865_MIPI_CTRL3C_REG                 0x483c
>>> -#define OV8865_MIPI_LP_GPIO4_REG               0x483d
>>> -
>>> -#define OV8865_MIPI_CTRL4A_REG                 0x484a
>>> -#define OV8865_MIPI_CTRL4B_REG                 0x484b
>>> -#define OV8865_MIPI_CTRL4C_REG                 0x484c
>>> -#define OV8865_MIPI_LANE_TEST_PATTERN_REG      0x484d
>>> -#define OV8865_MIPI_FRAME_END_DELAY_REG                0x484e
>>> -#define OV8865_MIPI_CLOCK_TEST_PATTERN_REG     0x484f
>>> +
>>>  #define OV8865_MIPI_LANE_SEL01_REG             0x4850
>>>  #define OV8865_MIPI_LANE_SEL01_LANE0(v)                (((v) << 0) &
>>> GENMASK(2, 0))
>>>  #define OV8865_MIPI_LANE_SEL01_LANE1(v)                (((v) << 4) &
>>> GENMASK(6, 4))
>>> @@ -407,7 +280,6 @@
>>>  /* ISP */
>>>
>>>  #define OV8865_ISP_CTRL0_REG                   0x5000
>>> -#define OV8865_ISP_CTRL0_LENC_EN               BIT(7)
>>>  #define OV8865_ISP_CTRL0_WHITE_BALANCE_EN      BIT(4)
>>>  #define OV8865_ISP_CTRL0_DPC_BLACK_EN          BIT(2)
>>>  #define OV8865_ISP_CTRL0_DPC_WHITE_EN          BIT(1)
>>> @@ -416,17 +288,11 @@
>>>  #define OV8865_ISP_CTRL2_REG                   0x5002
>>>  #define OV8865_ISP_CTRL2_DEBUG                 BIT(3)
>>>  #define OV8865_ISP_CTRL2_VARIOPIXEL_EN         BIT(2)
>>> -#define OV8865_ISP_CTRL2_VSYNC_LATCH_EN                BIT(0)
>>> -#define OV8865_ISP_CTRL3_REG                   0x5003
>>>
>>>  #define OV8865_ISP_GAIN_RED_H_REG              0x5018
>>>  #define OV8865_ISP_GAIN_RED_H(v)               (((v) & GENMASK(13, 6)) >>
>>> 6)
>>>  #define OV8865_ISP_GAIN_RED_L_REG              0x5019
>>>  #define OV8865_ISP_GAIN_RED_L(v)               ((v) & GENMASK(5, 0))
>>> -#define OV8865_ISP_GAIN_GREEN_H_REG            0x501a
>>> -#define OV8865_ISP_GAIN_GREEN_H(v)             (((v) & GENMASK(13, 6)) >>
>>> 6)
>>> -#define OV8865_ISP_GAIN_GREEN_L_REG            0x501b
>>> -#define OV8865_ISP_GAIN_GREEN_L(v)             ((v) & GENMASK(5, 0))
>>>  #define OV8865_ISP_GAIN_BLUE_H_REG             0x501c
>>>  #define OV8865_ISP_GAIN_BLUE_H(v)              (((v) & GENMASK(13, 6)) >>
>>> 6)
>>>  #define OV8865_ISP_GAIN_BLUE_L_REG             0x501d
>>> @@ -434,7 +300,6 @@
>>>
>>>  /* VarioPixel */
>>>
>>> -#define OV8865_VAP_CTRL0_REG                   0x5900
>>>  #define OV8865_VAP_CTRL1_REG                   0x5901
>>>  #define OV8865_VAP_CTRL1_HSUB_COEF(v)          ((((v) - 1) << 2) & \
>>>                                                  GENMASK(3, 2))
>>> --
>>> 2.25.1
>>>
>>>
>> -- 
>> With Best Regards,
>> Andy Shevchenko
