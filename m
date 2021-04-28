Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E501636D54B
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 12:01:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238455AbhD1KCa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 06:02:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238907AbhD1KCO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 06:02:14 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADF86C061574
        for <linux-media@vger.kernel.org>; Wed, 28 Apr 2021 03:01:26 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id y4so58020231lfl.10
        for <linux-media@vger.kernel.org>; Wed, 28 Apr 2021 03:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Ka9NAxXXzGbCNAcFyj0ukavT61m7oSG5yhYVApS86+c=;
        b=XEt6YWVCB1C0VgJmrh7IBj1DlvY5QrmveMnW23nEbeCuFaEFypmL1N+El827mktq6x
         UkvInYKSXiQh0QzGCee5RAfzn5VM8OMSYqRloC1DmY/x2eoh8RfEdUnwtETzM6J+yzv3
         OM5xWIv+eTJHrdTBkotTp/rHF/ibqTPL9whDHiwelZFa+E2bO01QP6hicop/ZDeGjxNd
         wCC3djswLQbEfVzLB/MKgH5L8xQj7XDGMPMf/zJkPB7INZYhd7fuv+JsM1G6gtn3Is1L
         I23y6ThJIuTjmGyD/TwzRgg/WLHgfr7IPP1d73qYLk7xhWjcHTbQSFCaTfkZz/tZ3exh
         L+LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ka9NAxXXzGbCNAcFyj0ukavT61m7oSG5yhYVApS86+c=;
        b=NpKZnHuyzNVX8FWh1q8lTlsNzS289JE4nhPLpjBcx0T66Qc0KhwkuSeGBL4Zc7BNGz
         OJoRryURNaTJ6DNnToHBlAQtezEe5MUQFGFXcj4+VYkQWc8eixCSiGK7SgmGlikkd7rc
         uAB5/UBLxQt9LPuMOBlD4jIjGHjoLlUpof91vlkSgJbkj1OnyOREnedlylAWb0CnDs7s
         yDXjcTrqrxyCa1Dw4P6gxgJL2Rs68FOnIPZCvl/9hB5yvaScUKyWViVAE90Cpj3sfoQI
         kXuCKv4GBlh3shNy1/U0qUbWLUiviMwqUUfU7+ox3MdY/G3OFMXky+A2KYu0404pUT1H
         aIFQ==
X-Gm-Message-State: AOAM531qTKIWpcdgMnbREAUpjl3rZe6l9WWnhEsOrp/Rfh6w4ttdL43n
        A+11FzHTs8tY2H35X4CKpLG1og==
X-Google-Smtp-Source: ABdhPJwpMxoi9z5YJ9GnE2st+iNsBkP9Tuj7lOSH77wKMptq9XcstY+6UvHNpzZhRPM/bBiRWtk9bQ==
X-Received: by 2002:a19:c501:: with SMTP id w1mr20000769lfe.125.1619604084740;
        Wed, 28 Apr 2021 03:01:24 -0700 (PDT)
Received: from [192.168.88.254] ([85.249.46.153])
        by smtp.gmail.com with ESMTPSA id o139sm590589lfa.129.2021.04.28.03.01.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Apr 2021 03:01:23 -0700 (PDT)
Subject: Re: FW: [PATCH v3 1/2] ov8856: Add support for 2 data lanes
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
To:     "Yeh, Andy" <andy.yeh@intel.com>,
        "Tu, ShawnX" <shawnx.tu@intel.com>
Cc:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "Lai, Jim" <jim.lai@intel.com>,
        "Cao, Bingbu" <bingbu.cao@intel.com>,
        "senozhatsky@google.com" <senozhatsky@google.com>,
        "tfiga@google.com" <tfiga@google.com>
References: <20210331091244.2142-1-shawnx.tu@intel.com>
 <0a2753b5-922e-05ef-ac90-a0d783945663@linaro.org>
 <adf4038084d84aaa877c5b78e3487c05@intel.com>
 <130a6164-4d0a-9821-9338-019af1bb976e@linaro.org>
 <ddfa0466a78a4a96b830e8e5170554e8@intel.com>
 <1217e44f-82af-36d5-da2d-ce7d17538c3f@linaro.org>
 <MWHPR11MB0046D9CABF87DD82BB1DBCB787409@MWHPR11MB0046.namprd11.prod.outlook.com>
 <7adbe864-464b-7710-ebfb-b6e1dc415060@linaro.org>
Message-ID: <4c95307e-dfc0-4980-b270-15dedcf543ae@linaro.org>
Date:   Wed, 28 Apr 2021 13:01:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <7adbe864-464b-7710-ebfb-b6e1dc415060@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 28.04.2021 12:41, Andrey Konovalov wrote:
> Hi Andy,
> 
> On 28.04.2021 10:45, Yeh, Andy wrote:
>> Dear Andrey and all,
>>
>> Any further review? Or we can start the staging process?
> 
> I've got replies to my questions from Shawn (thanks, Shawn), and
> don't have further questions.
> For me it still looks like the driver has too many register tables
> (e.g. the 3264x2448 and the 1632x1224 tables seem to workaround some
> issue in either ov8856 or camss driver, and resolving that issue
> should probably let us to drop these tables).
> But as for the current patchset, I don't mind merging the last version
> of it (v4).

That said, if it helps, my "Acked-by:" can be added to "[PATCH v4 1/2] ov8856:
Add support for 2 data lanes". (Just I am not the maintainer, so "Acked-by:"
from me wouldn't add a lot of value AFAIK).

Thanks,
Andrey

> Thanks,
> Andrey
> 
>> Regards, Andy
>>
>>> -----Original Message-----
>>> From: Andrey Konovalov <andrey.konovalov@linaro.org>
>>> Sent: Friday, April 16, 2021 2:47 PM
>>> To: Tu, ShawnX <shawnx.tu@intel.com>; linux-media@vger.kernel.org
>>> Cc: sakari.ailus@linux.intel.com; Yeh, Andy <andy.yeh@intel.com>; Lai, Jim
>>> <jim.lai@intel.com>; Cao, Bingbu <bingbu.cao@intel.com>;
>>> senozhatsky@google.com; tfiga@google.com
>>> Subject: Re: FW: [PATCH v3 1/2] ov8856: Add support for 2 data lanes
>>>
>>> Hi Shawn,
>>>
>>> On 15.04.2021 13:26, Tu, ShawnX wrote:
>>>> Hi Andrey,
>>>>
>>>> Thanks for your comment.
>>>>
>>>> For Vsync output case, it would enable the feature in 2 lane mode.
>>>> I will update the registers in next patch and thanks for your advice.
>>>
>>> Sounds good.
>>>
>>> Thanks,
>>> Andrey
>>>
>>>> For some camera sensor registers not documented case,
>>>> it's limited to have more instructions by vendor confidential in business model.
>>>> OV vendor released the register table based on sensor performance & stability,
>>>> and it should write these all registers to sensor in case.
>>>>
>>>> Thanks,
>>>> Shawn
>>>> -----Original Message-----
>>>> From: Andrey Konovalov <andrey.konovalov@linaro.org>
>>>> Sent: Friday, April 9, 2021 9:20 PM
>>>> To: Tu, ShawnX <shawnx.tu@intel.com>; linux-media@vger.kernel.org
>>>> Cc: sakari.ailus@linux.intel.com; Yeh, Andy <andy.yeh@intel.com>; Lai, Jim
>>> <jim.lai@intel.com>; Cao, Bingbu <bingbu.cao@intel.com>;
>>> senozhatsky@google.com; tfiga@google.com
>>>> Subject: Re: FW: [PATCH v3 1/2] ov8856: Add support for 2 data lanes
>>>>
>>>> Hi Shawn,
>>>>
>>>> On 09.04.2021 11:24, Tu, ShawnX wrote:
>>>>> Hi Andrey,
>>>>>
>>>>> Thanks for the review.
>>>>>
>>>>>>> Oops.. It turned out that I replied to the previous version of this patch:
>>>>>>> https://lore.kernel.org/linux-media/dcc96c87-db10-821a-dcaa-
>>> 2d9004b1d5c5@linaro.org/
>>>>>>> Sorry for that.
>>>>>>> But my concern still holds: the two new lane_2_mode_*x*[] tables mostly
>>> duplicate
>>>>>>> the lane_4_mode_*x*[] ones, and to switch between 2 and 4 lanes the
>>> driver needs
>>>>>>> to change 4 registers at most. So the number of lanes related values could
>>> be put
>>>>>>> into separate small tables similar to the mipi_data_rate_lane_N[] ones (or
>>> maybe
>>>>>>> added to those).
>>>>>
>>>>> For 2 lanes register table, it used the recommended regs from OV vendor
>>> provided.
>>>>
>>>> I wonder what these recommendations really are.
>>>> E.g. the lane_2_mode_*x*[] tables disable VSYNC output, while the
>>> lane_4_mode_*x*[]
>>>> tables configure VSYNC pin as GPIO output and set it to "1". Would OV really
>>> recommend
>>>> to enable VSYNC output for 4-lane modes, and to disable it (configure VSYNC as
>>> input)
>>>> for the 2-lane ones?
>>>> If you have the OV recommended set of the register values for the 4-lane
>>> modes, it
>>>> would be interesting to compare them to the values in the 4-lane mode tables
>>> in the
>>>> current ov8856 driver.
>>>>
>>>> On the other side. Let's suppose that if VSYNC output is enabled, but controlling
>>>> it as GPIO is disabled, then the sensor cotrolls it automatically (my docs aren't
>>>> quite clear in that part). If someday someone is to add the VSYNC output
>>> feature
>>>> to the driver, would the solution be to double the number of the mode tables
>>> (one
>>>> set of tables with the feature enabled, and the other one with it disabled)?
>>>>
>>>> Quite some camera sensor registers are not documented in the datasheets (the
>>> confidential
>>>> ones included), and for these registers there is no other option than to use the
>>> set
>>>> of values given by a vendor. And when there is more than one set of these
>>> values, in
>>>> the ideal case there would be instructions of when to use each of the sets (does
>>> it
>>>> depend on e.g. some timing parameter; or e.g. there are different lots of the
>>> sensor
>>>> chips, and they can be distinguished by a value written at factory to some OTP
>>> memory
>>>> location). But placing as much as possible into the register values tables
>>> without a
>>>> strong reason to do so does'n seem a good approach to me.
>>>>
>>>> Thanks,
>>>> Andrey
>>>>
>>>>> In my thought, it’s easy to update/maintain on standalone registers in
>>> separate lane arrays.
>>>>> It would prefer to use current design.
>>>>>
>>>>> @ Sakari, if you have any advice on patch V3, please share it.
>>>>>
>>>>> static const struct ov8856_lane_cfg lane_cfg_4 = {
>>>>> ...
>>>>>         {
>>>>>             .width = 3280,
>>>>>             .height = 2464,
>>>>>             .hts = 1928,
>>>>>             .vts_def = 2488,
>>>>>             .vts_min = 2488,
>>>>>             .reg_list = {
>>>>>                 .num_of_regs =
>>>>>                  ARRAY_SIZE(lane_4_mode_3280x2464),
>>>>>                 .regs = lane_4_mode_3280x2464,
>>>>>             },
>>>>>             .link_freq_index = 0,
>>>>>             .data_lanes = 4,
>>>>>         },
>>>>> ...
>>>>> }
>>>>>
>>>>> Thanks,
>>>>> Shawn
>>>>> -----Original Message-----
>>>>> From: Andrey Konovalov <andrey.konovalov@linaro.org>
>>>>> Sent: Tuesday, April 6, 2021 9:13 PM
>>>>> To: Tu, ShawnX <shawnx.tu@intel.com>; linux-media@vger.kernel.org
>>>>> Cc: sakari.ailus@linux.intel.com; Yeh, Andy <andy.yeh@intel.com>; Lai, Jim
>>> <jim.lai@intel.com>; Cao, Bingbu <bingbu.cao@intel.com>;
>>> senozhatsky@google.com; tfiga@google.com
>>>>> Subject: Re: [PATCH v3 1/2] ov8856: Add support for 2 data lanes
>>>>>
>>>>> Oops.. It turned out that I replied to the previous version of this patch:
>>>>> https://lore.kernel.org/linux-media/dcc96c87-db10-821a-dcaa-
>>> 2d9004b1d5c5@linaro.org/
>>>>> Sorry for that.
>>>>> But my concern still holds: the two new lane_2_mode_*x*[] tables mostly
>>> duplicate
>>>>> the lane_4_mode_*x*[] ones, and to switch between 2 and 4 lanes the driver
>>> needs
>>>>> to change 4 registers at most. So the number of lanes related values could be
>>> put
>>>>> into separate small tables similar to the mipi_data_rate_lane_N[] ones (or
>>> maybe
>>>>> added to those).
>>>>>
>>>>> On 31.03.2021 12:12, Shawnx Tu wrote:
>>>>>> From: Shawn Tu <shawnx.tu@intel.com>
>>>>>>
>>>>>> The OV8856 sensor can output frames with 2/4 CSI2 data lanes.
>>>>>> This commit adds support for 2 lane mode in addition to the 4 lane
>>>>>> and also configuring the data lane settings in the driver based on
>>>>>> system configuration.
>>>>>>
>>>>>> - Fix Bayer order output in 1640x1232 binning registers
>>>>> - that's a nice addition to the driver.
>>>>>
>>>>> Thanks,
>>>>> Andrey
>>>>>
>>>>>> - supported data lanes
>>>>>>       + 3280x2464 on 2 & 4 lanes
>>>>>>       + 1640x1232 on 2 & 4 lanes
>>>>>>       + 3264x2448 on 4 lanes
>>>>>>       + 1632x1224 on 4 lanes
>>>>>>
>>>>>> Signed-off-by: Shawn Tu <shawnx.tu@intel.com>
>>>>>> ---
>>>>>>      drivers/media/i2c/ov8856.c | 2329 ++++++++++++++++++++++--------------
>>>>>>      1 file changed, 1428 insertions(+), 901 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
>>>>>> index b337f729d5e3..502cc703f2a1 100644
>>>>>> --- a/drivers/media/i2c/ov8856.c
>>>>>> +++ b/drivers/media/i2c/ov8856.c
>>>>>> @@ -18,8 +18,6 @@
>>>>>>      #define OV8856_REG_VALUE_16BIT        2
>>>>>>      #define OV8856_REG_VALUE_24BIT        3
>>>>>>
>>>>>> -#define OV8856_LINK_FREQ_360MHZ        360000000ULL
>>>>>> -#define OV8856_LINK_FREQ_180MHZ        180000000ULL
>>>>>>      #define OV8856_SCLK            144000000ULL
>>>>>>      #define OV8856_XVCLK_19_2        19200000
>>>>>>      #define OV8856_DATA_LANES        4
>>>>>> @@ -78,6 +76,10 @@
>>>>>>      #define OV8856_TEST_PATTERN_ENABLE    BIT(7)
>>>>>>      #define OV8856_TEST_PATTERN_BAR_SHIFT    2
>>>>>>
>>>>>> +#define NUM_REGS                7
>>>>>> +#define NUM_MODE_REGS                187
>>>>>> +#define NUM_MODE_REGS_2                200
>>>>>> +
>>>>>>      #define to_ov8856(_sd)            container_of(_sd, struct ov8856,
>>> sd)
>>>>>>
>>>>>>      static const char * const ov8856_supply_names[] = {
>>>>>> @@ -86,11 +88,6 @@ static const char * const ov8856_supply_names[] = {
>>>>>>          "dvdd",        /* Digital core power */
>>>>>>      };
>>>>>>
>>>>>> -enum {
>>>>>> -    OV8856_LINK_FREQ_720MBPS,
>>>>>> -    OV8856_LINK_FREQ_360MBPS,
>>>>>> -};
>>>>>> -
>>>>>>      struct ov8856_reg {
>>>>>>          u16 address;
>>>>>>          u8 val;
>>>>>> @@ -126,891 +123,1240 @@ struct ov8856_mode {
>>>>>>
>>>>>>          /* Sensor register settings for this resolution */
>>>>>>          const struct ov8856_reg_list reg_list;
>>>>>> +
>>>>>> +    /* Number of data lanes */
>>>>>> +    u8 data_lanes;
>>>>>>      };
>>>>>>
>>>>>> -static const struct ov8856_reg mipi_data_rate_720mbps[] = {
>>>>>> -    {0x0103, 0x01},
>>>>>> -    {0x0100, 0x00},
>>>>>> -    {0x0302, 0x4b},
>>>>>> -    {0x0303, 0x01},
>>>>>> -    {0x030b, 0x02},
>>>>>> -    {0x030d, 0x4b},
>>>>>> -    {0x031e, 0x0c},
>>>>>> +struct ov8856_mipi_data_rates {
>>>>>> +    const struct ov8856_reg regs_0[NUM_REGS];
>>>>>> +    const struct ov8856_reg regs_1[NUM_REGS];
>>>>>>      };
>>>>>>
>>>>>> -static const struct ov8856_reg mipi_data_rate_360mbps[] = {
>>>>>> -    {0x0103, 0x01},
>>>>>> -    {0x0100, 0x00},
>>>>>> -    {0x0302, 0x4b},
>>>>>> -    {0x0303, 0x03},
>>>>>> -    {0x030b, 0x02},
>>>>>> -    {0x030d, 0x4b},
>>>>>> -    {0x031e, 0x0c},
>>>>>> +static const struct ov8856_mipi_data_rates mipi_data_rate_lane_2 = {
>>>>>> +    //mipi_data_rate_1440mbps
>>>>>> +    {
>>>>>> +        {0x0103, 0x01},
>>>>>> +        {0x0100, 0x00},
>>>>>> +        {0x0302, 0x43},
>>>>>> +        {0x0303, 0x00},
>>>>>> +        {0x030b, 0x02},
>>>>>> +        {0x030d, 0x4b},
>>>>>> +        {0x031e, 0x0c}
>>>>>> +    },
>>>>>> +    //mipi_data_rate_720mbps
>>>>>> +    {
>>>>>> +        {0x0103, 0x01},
>>>>>> +        {0x0100, 0x00},
>>>>>> +        {0x0302, 0x4b},
>>>>>> +        {0x0303, 0x01},
>>>>>> +        {0x030b, 0x02},
>>>>>> +        {0x030d, 0x4b},
>>>>>> +        {0x031e, 0x0c}
>>>>>> +    }
>>>>>>      };
>>>>>>
>>>>>> -static const struct ov8856_reg mode_3280x2464_regs[] = {
>>>>>> -    {0x3000, 0x20},
>>>>>> -    {0x3003, 0x08},
>>>>>> -    {0x300e, 0x20},
>>>>>> -    {0x3010, 0x00},
>>>>>> -    {0x3015, 0x84},
>>>>>> -    {0x3018, 0x72},
>>>>>> -    {0x3021, 0x23},
>>>>>> -    {0x3033, 0x24},
>>>>>> -    {0x3500, 0x00},
>>>>>> -    {0x3501, 0x9a},
>>>>>> -    {0x3502, 0x20},
>>>>>> -    {0x3503, 0x08},
>>>>>> -    {0x3505, 0x83},
>>>>>> -    {0x3508, 0x01},
>>>>>> -    {0x3509, 0x80},
>>>>>> -    {0x350c, 0x00},
>>>>>> -    {0x350d, 0x80},
>>>>>> -    {0x350e, 0x04},
>>>>>> -    {0x350f, 0x00},
>>>>>> -    {0x3510, 0x00},
>>>>>> -    {0x3511, 0x02},
>>>>>> -    {0x3512, 0x00},
>>>>>> -    {0x3600, 0x72},
>>>>>> -    {0x3601, 0x40},
>>>>>> -    {0x3602, 0x30},
>>>>>> -    {0x3610, 0xc5},
>>>>>> -    {0x3611, 0x58},
>>>>>> -    {0x3612, 0x5c},
>>>>>> -    {0x3613, 0xca},
>>>>>> -    {0x3614, 0x20},
>>>>>> -    {0x3628, 0xff},
>>>>>> -    {0x3629, 0xff},
>>>>>> -    {0x362a, 0xff},
>>>>>> -    {0x3633, 0x10},
>>>>>> -    {0x3634, 0x10},
>>>>>> -    {0x3635, 0x10},
>>>>>> -    {0x3636, 0x10},
>>>>>> -    {0x3663, 0x08},
>>>>>> -    {0x3669, 0x34},
>>>>>> -    {0x366e, 0x10},
>>>>>> -    {0x3706, 0x86},
>>>>>> -    {0x370b, 0x7e},
>>>>>> -    {0x3714, 0x23},
>>>>>> -    {0x3730, 0x12},
>>>>>> -    {0x3733, 0x10},
>>>>>> -    {0x3764, 0x00},
>>>>>> -    {0x3765, 0x00},
>>>>>> -    {0x3769, 0x62},
>>>>>> -    {0x376a, 0x2a},
>>>>>> -    {0x376b, 0x30},
>>>>>> -    {0x3780, 0x00},
>>>>>> -    {0x3781, 0x24},
>>>>>> -    {0x3782, 0x00},
>>>>>> -    {0x3783, 0x23},
>>>>>> -    {0x3798, 0x2f},
>>>>>> -    {0x37a1, 0x60},
>>>>>> -    {0x37a8, 0x6a},
>>>>>> -    {0x37ab, 0x3f},
>>>>>> -    {0x37c2, 0x04},
>>>>>> -    {0x37c3, 0xf1},
>>>>>> -    {0x37c9, 0x80},
>>>>>> -    {0x37cb, 0x16},
>>>>>> -    {0x37cc, 0x16},
>>>>>> -    {0x37cd, 0x16},
>>>>>> -    {0x37ce, 0x16},
>>>>>> -    {0x3800, 0x00},
>>>>>> -    {0x3801, 0x00},
>>>>>> -    {0x3802, 0x00},
>>>>>> -    {0x3803, 0x06},
>>>>>> -    {0x3804, 0x0c},
>>>>>> -    {0x3805, 0xdf},
>>>>>> -    {0x3806, 0x09},
>>>>>> -    {0x3807, 0xa7},
>>>>>> -    {0x3808, 0x0c},
>>>>>> -    {0x3809, 0xd0},
>>>>>> -    {0x380a, 0x09},
>>>>>> -    {0x380b, 0xa0},
>>>>>> -    {0x380c, 0x07},
>>>>>> -    {0x380d, 0x88},
>>>>>> -    {0x380e, 0x09},
>>>>>> -    {0x380f, 0xb8},
>>>>>> -    {0x3810, 0x00},
>>>>>> -    {0x3811, 0x00},
>>>>>> -    {0x3812, 0x00},
>>>>>> -    {0x3813, 0x01},
>>>>>> -    {0x3814, 0x01},
>>>>>> -    {0x3815, 0x01},
>>>>>> -    {0x3816, 0x00},
>>>>>> -    {0x3817, 0x00},
>>>>>> -    {0x3818, 0x00},
>>>>>> -    {0x3819, 0x10},
>>>>>> -    {0x3820, 0x80},
>>>>>> -    {0x3821, 0x46},
>>>>>> -    {0x382a, 0x01},
>>>>>> -    {0x382b, 0x01},
>>>>>> -    {0x3830, 0x06},
>>>>>> -    {0x3836, 0x02},
>>>>>> -    {0x3862, 0x04},
>>>>>> -    {0x3863, 0x08},
>>>>>> -    {0x3cc0, 0x33},
>>>>>> -    {0x3d85, 0x17},
>>>>>> -    {0x3d8c, 0x73},
>>>>>> -    {0x3d8d, 0xde},
>>>>>> -    {0x4001, 0xe0},
>>>>>> -    {0x4003, 0x40},
>>>>>> -    {0x4008, 0x00},
>>>>>> -    {0x4009, 0x0b},
>>>>>> -    {0x400a, 0x00},
>>>>>> -    {0x400b, 0x84},
>>>>>> -    {0x400f, 0x80},
>>>>>> -    {0x4010, 0xf0},
>>>>>> -    {0x4011, 0xff},
>>>>>> -    {0x4012, 0x02},
>>>>>> -    {0x4013, 0x01},
>>>>>> -    {0x4014, 0x01},
>>>>>> -    {0x4015, 0x01},
>>>>>> -    {0x4042, 0x00},
>>>>>> -    {0x4043, 0x80},
>>>>>> -    {0x4044, 0x00},
>>>>>> -    {0x4045, 0x80},
>>>>>> -    {0x4046, 0x00},
>>>>>> -    {0x4047, 0x80},
>>>>>> -    {0x4048, 0x00},
>>>>>> -    {0x4049, 0x80},
>>>>>> -    {0x4041, 0x03},
>>>>>> -    {0x404c, 0x20},
>>>>>> -    {0x404d, 0x00},
>>>>>> -    {0x404e, 0x20},
>>>>>> -    {0x4203, 0x80},
>>>>>> -    {0x4307, 0x30},
>>>>>> -    {0x4317, 0x00},
>>>>>> -    {0x4503, 0x08},
>>>>>> -    {0x4601, 0x80},
>>>>>> -    {0x4800, 0x44},
>>>>>> -    {0x4816, 0x53},
>>>>>> -    {0x481b, 0x58},
>>>>>> -    {0x481f, 0x27},
>>>>>> -    {0x4837, 0x16},
>>>>>> -    {0x483c, 0x0f},
>>>>>> -    {0x484b, 0x05},
>>>>>> -    {0x5000, 0x57},
>>>>>> -    {0x5001, 0x0a},
>>>>>> -    {0x5004, 0x04},
>>>>>> -    {0x502e, 0x03},
>>>>>> -    {0x5030, 0x41},
>>>>>> -    {0x5780, 0x14},
>>>>>> -    {0x5781, 0x0f},
>>>>>> -    {0x5782, 0x44},
>>>>>> -    {0x5783, 0x02},
>>>>>> -    {0x5784, 0x01},
>>>>>> -    {0x5785, 0x01},
>>>>>> -    {0x5786, 0x00},
>>>>>> -    {0x5787, 0x04},
>>>>>> -    {0x5788, 0x02},
>>>>>> -    {0x5789, 0x0f},
>>>>>> -    {0x578a, 0xfd},
>>>>>> -    {0x578b, 0xf5},
>>>>>> -    {0x578c, 0xf5},
>>>>>> -    {0x578d, 0x03},
>>>>>> -    {0x578e, 0x08},
>>>>>> -    {0x578f, 0x0c},
>>>>>> -    {0x5790, 0x08},
>>>>>> -    {0x5791, 0x04},
>>>>>> -    {0x5792, 0x00},
>>>>>> -    {0x5793, 0x52},
>>>>>> -    {0x5794, 0xa3},
>>>>>> -    {0x5795, 0x02},
>>>>>> -    {0x5796, 0x20},
>>>>>> -    {0x5797, 0x20},
>>>>>> -    {0x5798, 0xd5},
>>>>>> -    {0x5799, 0xd5},
>>>>>> -    {0x579a, 0x00},
>>>>>> -    {0x579b, 0x50},
>>>>>> -    {0x579c, 0x00},
>>>>>> -    {0x579d, 0x2c},
>>>>>> -    {0x579e, 0x0c},
>>>>>> -    {0x579f, 0x40},
>>>>>> -    {0x57a0, 0x09},
>>>>>> -    {0x57a1, 0x40},
>>>>>> -    {0x59f8, 0x3d},
>>>>>> -    {0x5a08, 0x02},
>>>>>> -    {0x5b00, 0x02},
>>>>>> -    {0x5b01, 0x10},
>>>>>> -    {0x5b02, 0x03},
>>>>>> -    {0x5b03, 0xcf},
>>>>>> -    {0x5b05, 0x6c},
>>>>>> -    {0x5e00, 0x00}
>>>>>> +static const struct ov8856_mipi_data_rates mipi_data_rate_lane_4 = {
>>>>>> +    //mipi_data_rate_720mbps
>>>>>> +    {
>>>>>> +        {0x0103, 0x01},
>>>>>> +        {0x0100, 0x00},
>>>>>> +        {0x0302, 0x4b},
>>>>>> +        {0x0303, 0x01},
>>>>>> +        {0x030b, 0x02},
>>>>>> +        {0x030d, 0x4b},
>>>>>> +        {0x031e, 0x0c}
>>>>>> +    },
>>>>>> +    //mipi_data_rate_360mbps
>>>>>> +    {
>>>>>> +        {0x0103, 0x01},
>>>>>> +        {0x0100, 0x00},
>>>>>> +        {0x0302, 0x4b},
>>>>>> +        {0x0303, 0x03},
>>>>>> +        {0x030b, 0x02},
>>>>>> +        {0x030d, 0x4b},
>>>>>> +        {0x031e, 0x0c}
>>>>>> +    }
>>>>>>      };
>>>>>>
>>>>>> -static const struct ov8856_reg mode_3264x2448_regs[] = {
>>>>>> -    {0x0103, 0x01},
>>>>>> -    {0x0302, 0x3c},
>>>>>> -    {0x0303, 0x01},
>>>>>> -    {0x031e, 0x0c},
>>>>>> -    {0x3000, 0x20},
>>>>>> -    {0x3003, 0x08},
>>>>>> -    {0x300e, 0x20},
>>>>>> -    {0x3010, 0x00},
>>>>>> -    {0x3015, 0x84},
>>>>>> -    {0x3018, 0x72},
>>>>>> -    {0x3021, 0x23},
>>>>>> -    {0x3033, 0x24},
>>>>>> -    {0x3500, 0x00},
>>>>>> -    {0x3501, 0x9a},
>>>>>> -    {0x3502, 0x20},
>>>>>> -    {0x3503, 0x08},
>>>>>> -    {0x3505, 0x83},
>>>>>> -    {0x3508, 0x01},
>>>>>> -    {0x3509, 0x80},
>>>>>> -    {0x350c, 0x00},
>>>>>> -    {0x350d, 0x80},
>>>>>> -    {0x350e, 0x04},
>>>>>> -    {0x350f, 0x00},
>>>>>> -    {0x3510, 0x00},
>>>>>> -    {0x3511, 0x02},
>>>>>> -    {0x3512, 0x00},
>>>>>> -    {0x3600, 0x72},
>>>>>> -    {0x3601, 0x40},
>>>>>> -    {0x3602, 0x30},
>>>>>> -    {0x3610, 0xc5},
>>>>>> -    {0x3611, 0x58},
>>>>>> -    {0x3612, 0x5c},
>>>>>> -    {0x3613, 0xca},
>>>>>> -    {0x3614, 0x60},
>>>>>> -    {0x3628, 0xff},
>>>>>> -    {0x3629, 0xff},
>>>>>> -    {0x362a, 0xff},
>>>>>> -    {0x3633, 0x10},
>>>>>> -    {0x3634, 0x10},
>>>>>> -    {0x3635, 0x10},
>>>>>> -    {0x3636, 0x10},
>>>>>> -    {0x3663, 0x08},
>>>>>> -    {0x3669, 0x34},
>>>>>> -    {0x366d, 0x00},
>>>>>> -    {0x366e, 0x10},
>>>>>> -    {0x3706, 0x86},
>>>>>> -    {0x370b, 0x7e},
>>>>>> -    {0x3714, 0x23},
>>>>>> -    {0x3730, 0x12},
>>>>>> -    {0x3733, 0x10},
>>>>>> -    {0x3764, 0x00},
>>>>>> -    {0x3765, 0x00},
>>>>>> -    {0x3769, 0x62},
>>>>>> -    {0x376a, 0x2a},
>>>>>> -    {0x376b, 0x30},
>>>>>> -    {0x3780, 0x00},
>>>>>> -    {0x3781, 0x24},
>>>>>> -    {0x3782, 0x00},
>>>>>> -    {0x3783, 0x23},
>>>>>> -    {0x3798, 0x2f},
>>>>>> -    {0x37a1, 0x60},
>>>>>> -    {0x37a8, 0x6a},
>>>>>> -    {0x37ab, 0x3f},
>>>>>> -    {0x37c2, 0x04},
>>>>>> -    {0x37c3, 0xf1},
>>>>>> -    {0x37c9, 0x80},
>>>>>> -    {0x37cb, 0x16},
>>>>>> -    {0x37cc, 0x16},
>>>>>> -    {0x37cd, 0x16},
>>>>>> -    {0x37ce, 0x16},
>>>>>> -    {0x3800, 0x00},
>>>>>> -    {0x3801, 0x00},
>>>>>> -    {0x3802, 0x00},
>>>>>> -    {0x3803, 0x0c},
>>>>>> -    {0x3804, 0x0c},
>>>>>> -    {0x3805, 0xdf},
>>>>>> -    {0x3806, 0x09},
>>>>>> -    {0x3807, 0xa3},
>>>>>> -    {0x3808, 0x0c},
>>>>>> -    {0x3809, 0xc0},
>>>>>> -    {0x380a, 0x09},
>>>>>> -    {0x380b, 0x90},
>>>>>> -    {0x380c, 0x07},
>>>>>> -    {0x380d, 0x8c},
>>>>>> -    {0x380e, 0x09},
>>>>>> -    {0x380f, 0xb2},
>>>>>> -    {0x3810, 0x00},
>>>>>> -    {0x3811, 0x04},
>>>>>> -    {0x3812, 0x00},
>>>>>> -    {0x3813, 0x01},
>>>>>> -    {0x3814, 0x01},
>>>>>> -    {0x3815, 0x01},
>>>>>> -    {0x3816, 0x00},
>>>>>> -    {0x3817, 0x00},
>>>>>> -    {0x3818, 0x00},
>>>>>> -    {0x3819, 0x10},
>>>>>> -    {0x3820, 0x80},
>>>>>> -    {0x3821, 0x46},
>>>>>> -    {0x382a, 0x01},
>>>>>> -    {0x382b, 0x01},
>>>>>> -    {0x3830, 0x06},
>>>>>> -    {0x3836, 0x02},
>>>>>> -    {0x3862, 0x04},
>>>>>> -    {0x3863, 0x08},
>>>>>> -    {0x3cc0, 0x33},
>>>>>> -    {0x3d85, 0x17},
>>>>>> -    {0x3d8c, 0x73},
>>>>>> -    {0x3d8d, 0xde},
>>>>>> -    {0x4001, 0xe0},
>>>>>> -    {0x4003, 0x40},
>>>>>> -    {0x4008, 0x00},
>>>>>> -    {0x4009, 0x0b},
>>>>>> -    {0x400a, 0x00},
>>>>>> -    {0x400b, 0x84},
>>>>>> -    {0x400f, 0x80},
>>>>>> -    {0x4010, 0xf0},
>>>>>> -    {0x4011, 0xff},
>>>>>> -    {0x4012, 0x02},
>>>>>> -    {0x4013, 0x01},
>>>>>> -    {0x4014, 0x01},
>>>>>> -    {0x4015, 0x01},
>>>>>> -    {0x4042, 0x00},
>>>>>> -    {0x4043, 0x80},
>>>>>> -    {0x4044, 0x00},
>>>>>> -    {0x4045, 0x80},
>>>>>> -    {0x4046, 0x00},
>>>>>> -    {0x4047, 0x80},
>>>>>> -    {0x4048, 0x00},
>>>>>> -    {0x4049, 0x80},
>>>>>> -    {0x4041, 0x03},
>>>>>> -    {0x404c, 0x20},
>>>>>> -    {0x404d, 0x00},
>>>>>> -    {0x404e, 0x20},
>>>>>> -    {0x4203, 0x80},
>>>>>> -    {0x4307, 0x30},
>>>>>> -    {0x4317, 0x00},
>>>>>> -    {0x4502, 0x50},
>>>>>> -    {0x4503, 0x08},
>>>>>> -    {0x4601, 0x80},
>>>>>> -    {0x4800, 0x44},
>>>>>> -    {0x4816, 0x53},
>>>>>> -    {0x481b, 0x50},
>>>>>> -    {0x481f, 0x27},
>>>>>> -    {0x4823, 0x3c},
>>>>>> -    {0x482b, 0x00},
>>>>>> -    {0x4831, 0x66},
>>>>>> -    {0x4837, 0x16},
>>>>>> -    {0x483c, 0x0f},
>>>>>> -    {0x484b, 0x05},
>>>>>> -    {0x5000, 0x77},
>>>>>> -    {0x5001, 0x0a},
>>>>>> -    {0x5003, 0xc8},
>>>>>> -    {0x5004, 0x04},
>>>>>> -    {0x5006, 0x00},
>>>>>> -    {0x5007, 0x00},
>>>>>> -    {0x502e, 0x03},
>>>>>> -    {0x5030, 0x41},
>>>>>> -    {0x5780, 0x14},
>>>>>> -    {0x5781, 0x0f},
>>>>>> -    {0x5782, 0x44},
>>>>>> -    {0x5783, 0x02},
>>>>>> -    {0x5784, 0x01},
>>>>>> -    {0x5785, 0x01},
>>>>>> -    {0x5786, 0x00},
>>>>>> -    {0x5787, 0x04},
>>>>>> -    {0x5788, 0x02},
>>>>>> -    {0x5789, 0x0f},
>>>>>> -    {0x578a, 0xfd},
>>>>>> -    {0x578b, 0xf5},
>>>>>> -    {0x578c, 0xf5},
>>>>>> -    {0x578d, 0x03},
>>>>>> -    {0x578e, 0x08},
>>>>>> -    {0x578f, 0x0c},
>>>>>> -    {0x5790, 0x08},
>>>>>> -    {0x5791, 0x04},
>>>>>> -    {0x5792, 0x00},
>>>>>> -    {0x5793, 0x52},
>>>>>> -    {0x5794, 0xa3},
>>>>>> -    {0x5795, 0x02},
>>>>>> -    {0x5796, 0x20},
>>>>>> -    {0x5797, 0x20},
>>>>>> -    {0x5798, 0xd5},
>>>>>> -    {0x5799, 0xd5},
>>>>>> -    {0x579a, 0x00},
>>>>>> -    {0x579b, 0x50},
>>>>>> -    {0x579c, 0x00},
>>>>>> -    {0x579d, 0x2c},
>>>>>> -    {0x579e, 0x0c},
>>>>>> -    {0x579f, 0x40},
>>>>>> -    {0x57a0, 0x09},
>>>>>> -    {0x57a1, 0x40},
>>>>>> -    {0x59f8, 0x3d},
>>>>>> -    {0x5a08, 0x02},
>>>>>> -    {0x5b00, 0x02},
>>>>>> -    {0x5b01, 0x10},
>>>>>> -    {0x5b02, 0x03},
>>>>>> -    {0x5b03, 0xcf},
>>>>>> -    {0x5b05, 0x6c},
>>>>>> -    {0x5e00, 0x00},
>>>>>> -    {0x5e10, 0xfc}
>>>>>> +static const struct ov8856_reg lane_2_mode_3280x2464[] = {
>>>>>> +    /* 3280x2464 resolution */
>>>>>> +        {0x3000, 0x00},
>>>>>> +        {0x300e, 0x00},
>>>>>> +        {0x3010, 0x00},
>>>>>> +        {0x3015, 0x84},
>>>>>> +        {0x3018, 0x32},
>>>>>> +        {0x3021, 0x23},
>>>>>> +        {0x3033, 0x24},
>>>>>> +        {0x3500, 0x00},
>>>>>> +        {0x3501, 0x9a},
>>>>>> +        {0x3502, 0x20},
>>>>>> +        {0x3503, 0x08},
>>>>>> +        {0x3505, 0x83},
>>>>>> +        {0x3508, 0x01},
>>>>>> +        {0x3509, 0x80},
>>>>>> +        {0x350c, 0x00},
>>>>>> +        {0x350d, 0x80},
>>>>>> +        {0x350e, 0x04},
>>>>>> +        {0x350f, 0x00},
>>>>>> +        {0x3510, 0x00},
>>>>>> +        {0x3511, 0x02},
>>>>>> +        {0x3512, 0x00},
>>>>>> +        {0x3600, 0x72},
>>>>>> +        {0x3601, 0x40},
>>>>>> +        {0x3602, 0x30},
>>>>>> +        {0x3610, 0xc5},
>>>>>> +        {0x3611, 0x58},
>>>>>> +        {0x3612, 0x5c},
>>>>>> +        {0x3613, 0xca},
>>>>>> +        {0x3614, 0x50},
>>>>>> +        {0x3628, 0xff},
>>>>>> +        {0x3629, 0xff},
>>>>>> +        {0x362a, 0xff},
>>>>>> +        {0x3633, 0x10},
>>>>>> +        {0x3634, 0x10},
>>>>>> +        {0x3635, 0x10},
>>>>>> +        {0x3636, 0x10},
>>>>>> +        {0x3663, 0x08},
>>>>>> +        {0x3669, 0x34},
>>>>>> +        {0x366e, 0x10},
>>>>>> +        {0x3706, 0x86},
>>>>>> +        {0x370b, 0x7e},
>>>>>> +        {0x3714, 0x23},
>>>>>> +        {0x3730, 0x12},
>>>>>> +        {0x3733, 0x10},
>>>>>> +        {0x3764, 0x00},
>>>>>> +        {0x3765, 0x00},
>>>>>> +        {0x3769, 0x62},
>>>>>> +        {0x376a, 0x2a},
>>>>>> +        {0x376b, 0x30},
>>>>>> +        {0x3780, 0x00},
>>>>>> +        {0x3781, 0x24},
>>>>>> +        {0x3782, 0x00},
>>>>>> +        {0x3783, 0x23},
>>>>>> +        {0x3798, 0x2f},
>>>>>> +        {0x37a1, 0x60},
>>>>>> +        {0x37a8, 0x6a},
>>>>>> +        {0x37ab, 0x3f},
>>>>>> +        {0x37c2, 0x04},
>>>>>> +        {0x37c3, 0xf1},
>>>>>> +        {0x37c9, 0x80},
>>>>>> +        {0x37cb, 0x16},
>>>>>> +        {0x37cc, 0x16},
>>>>>> +        {0x37cd, 0x16},
>>>>>> +        {0x37ce, 0x16},
>>>>>> +        {0x3800, 0x00},
>>>>>> +        {0x3801, 0x00},
>>>>>> +        {0x3802, 0x00},
>>>>>> +        {0x3803, 0x06},
>>>>>> +        {0x3804, 0x0c},
>>>>>> +        {0x3805, 0xdf},
>>>>>> +        {0x3806, 0x09},
>>>>>> +        {0x3807, 0xa7},
>>>>>> +        {0x3808, 0x0c},
>>>>>> +        {0x3809, 0xd0},
>>>>>> +        {0x380a, 0x09},
>>>>>> +        {0x380b, 0xa0},
>>>>>> +        {0x380c, 0x07},
>>>>>> +        {0x380d, 0x88},
>>>>>> +        {0x380e, 0x09},
>>>>>> +        {0x380f, 0xb8},
>>>>>> +        {0x3810, 0x00},
>>>>>> +        {0x3811, 0x00},
>>>>>> +        {0x3812, 0x00},
>>>>>> +        {0x3813, 0x01},
>>>>>> +        {0x3814, 0x01},
>>>>>> +        {0x3815, 0x01},
>>>>>> +        {0x3816, 0x00},
>>>>>> +        {0x3817, 0x00},
>>>>>> +        {0x3818, 0x00},
>>>>>> +        {0x3819, 0x00},
>>>>>> +        {0x3820, 0x80},
>>>>>> +        {0x3821, 0x46},
>>>>>> +        {0x382a, 0x01},
>>>>>> +        {0x382b, 0x01},
>>>>>> +        {0x3830, 0x06},
>>>>>> +        {0x3836, 0x02},
>>>>>> +        {0x3837, 0x10},
>>>>>> +        {0x3862, 0x04},
>>>>>> +        {0x3863, 0x08},
>>>>>> +        {0x3cc0, 0x33},
>>>>>> +        {0x3d85, 0x14},
>>>>>> +        {0x3d8c, 0x73},
>>>>>> +        {0x3d8d, 0xde},
>>>>>> +        {0x4001, 0xe0},
>>>>>> +        {0x4003, 0x40},
>>>>>> +        {0x4008, 0x00},
>>>>>> +        {0x4009, 0x0b},
>>>>>> +        {0x400a, 0x00},
>>>>>> +        {0x400b, 0x84},
>>>>>> +        {0x400f, 0x80},
>>>>>> +        {0x4010, 0xf0},
>>>>>> +        {0x4011, 0xff},
>>>>>> +        {0x4012, 0x02},
>>>>>> +        {0x4013, 0x01},
>>>>>> +        {0x4014, 0x01},
>>>>>> +        {0x4015, 0x01},
>>>>>> +        {0x4042, 0x00},
>>>>>> +        {0x4043, 0x80},
>>>>>> +        {0x4044, 0x00},
>>>>>> +        {0x4045, 0x80},
>>>>>> +        {0x4046, 0x00},
>>>>>> +        {0x4047, 0x80},
>>>>>> +        {0x4048, 0x00},
>>>>>> +        {0x4049, 0x80},
>>>>>> +        {0x4041, 0x03},
>>>>>> +        {0x404c, 0x20},
>>>>>> +        {0x404d, 0x00},
>>>>>> +        {0x404e, 0x20},
>>>>>> +        {0x4203, 0x80},
>>>>>> +        {0x4307, 0x30},
>>>>>> +        {0x4317, 0x00},
>>>>>> +        {0x4503, 0x08},
>>>>>> +        {0x4601, 0x80},
>>>>>> +        {0x4800, 0x44},
>>>>>> +        {0x4816, 0x53},
>>>>>> +        {0x481b, 0x58},
>>>>>> +        {0x481f, 0x27},
>>>>>> +        {0x4837, 0x0c},
>>>>>> +        {0x483c, 0x0f},
>>>>>> +        {0x484b, 0x05},
>>>>>> +        {0x5000, 0x57},
>>>>>> +        {0x5001, 0x0a},
>>>>>> +        {0x5004, 0x04},
>>>>>> +        {0x502e, 0x03},
>>>>>> +        {0x5030, 0x41},
>>>>>> +        {0x5795, 0x02},
>>>>>> +        {0x5796, 0x20},
>>>>>> +        {0x5797, 0x20},
>>>>>> +        {0x5798, 0xd5},
>>>>>> +        {0x5799, 0xd5},
>>>>>> +        {0x579a, 0x00},
>>>>>> +        {0x579b, 0x50},
>>>>>> +        {0x579c, 0x00},
>>>>>> +        {0x579d, 0x2c},
>>>>>> +        {0x579e, 0x0c},
>>>>>> +        {0x579f, 0x40},
>>>>>> +        {0x57a0, 0x09},
>>>>>> +        {0x57a1, 0x40},
>>>>>> +        {0x5780, 0x14},
>>>>>> +        {0x5781, 0x0f},
>>>>>> +        {0x5782, 0x44},
>>>>>> +        {0x5783, 0x02},
>>>>>> +        {0x5784, 0x01},
>>>>>> +        {0x5785, 0x01},
>>>>>> +        {0x5786, 0x00},
>>>>>> +        {0x5787, 0x04},
>>>>>> +        {0x5788, 0x02},
>>>>>> +        {0x5789, 0x0f},
>>>>>> +        {0x578a, 0xfd},
>>>>>> +        {0x578b, 0xf5},
>>>>>> +        {0x578c, 0xf5},
>>>>>> +        {0x578d, 0x03},
>>>>>> +        {0x578e, 0x08},
>>>>>> +        {0x578f, 0x0c},
>>>>>> +        {0x5790, 0x08},
>>>>>> +        {0x5791, 0x04},
>>>>>> +        {0x5792, 0x00},
>>>>>> +        {0x5793, 0x52},
>>>>>> +        {0x5794, 0xa3},
>>>>>> +        {0x59f8, 0x3d},
>>>>>> +        {0x5a08, 0x02},
>>>>>> +        {0x5b00, 0x02},
>>>>>> +        {0x5b01, 0x10},
>>>>>> +        {0x5b02, 0x03},
>>>>>> +        {0x5b03, 0xcf},
>>>>>> +        {0x5b05, 0x6c},
>>>>>> +        {0x5e00, 0x00}
>>>>>>      };
>>>>>>
>>>>>> -static const struct ov8856_reg mode_1640x1232_regs[] = {
>>>>>> -    {0x3000, 0x20},
>>>>>> -    {0x3003, 0x08},
>>>>>> -    {0x300e, 0x20},
>>>>>> -    {0x3010, 0x00},
>>>>>> -    {0x3015, 0x84},
>>>>>> -    {0x3018, 0x72},
>>>>>> -    {0x3021, 0x23},
>>>>>> -    {0x3033, 0x24},
>>>>>> -    {0x3500, 0x00},
>>>>>> -    {0x3501, 0x4c},
>>>>>> -    {0x3502, 0xe0},
>>>>>> -    {0x3503, 0x08},
>>>>>> -    {0x3505, 0x83},
>>>>>> -    {0x3508, 0x01},
>>>>>> -    {0x3509, 0x80},
>>>>>> -    {0x350c, 0x00},
>>>>>> -    {0x350d, 0x80},
>>>>>> -    {0x350e, 0x04},
>>>>>> -    {0x350f, 0x00},
>>>>>> -    {0x3510, 0x00},
>>>>>> -    {0x3511, 0x02},
>>>>>> -    {0x3512, 0x00},
>>>>>> -    {0x3600, 0x72},
>>>>>> -    {0x3601, 0x40},
>>>>>> -    {0x3602, 0x30},
>>>>>> -    {0x3610, 0xc5},
>>>>>> -    {0x3611, 0x58},
>>>>>> -    {0x3612, 0x5c},
>>>>>> -    {0x3613, 0xca},
>>>>>> -    {0x3614, 0x20},
>>>>>> -    {0x3628, 0xff},
>>>>>> -    {0x3629, 0xff},
>>>>>> -    {0x362a, 0xff},
>>>>>> -    {0x3633, 0x10},
>>>>>> -    {0x3634, 0x10},
>>>>>> -    {0x3635, 0x10},
>>>>>> -    {0x3636, 0x10},
>>>>>> -    {0x3663, 0x08},
>>>>>> -    {0x3669, 0x34},
>>>>>> -    {0x366e, 0x08},
>>>>>> -    {0x3706, 0x86},
>>>>>> -    {0x370b, 0x7e},
>>>>>> -    {0x3714, 0x27},
>>>>>> -    {0x3730, 0x12},
>>>>>> -    {0x3733, 0x10},
>>>>>> -    {0x3764, 0x00},
>>>>>> -    {0x3765, 0x00},
>>>>>> -    {0x3769, 0x62},
>>>>>> -    {0x376a, 0x2a},
>>>>>> -    {0x376b, 0x30},
>>>>>> -    {0x3780, 0x00},
>>>>>> -    {0x3781, 0x24},
>>>>>> -    {0x3782, 0x00},
>>>>>> -    {0x3783, 0x23},
>>>>>> -    {0x3798, 0x2f},
>>>>>> -    {0x37a1, 0x60},
>>>>>> -    {0x37a8, 0x6a},
>>>>>> -    {0x37ab, 0x3f},
>>>>>> -    {0x37c2, 0x14},
>>>>>> -    {0x37c3, 0xf1},
>>>>>> -    {0x37c9, 0x80},
>>>>>> -    {0x37cb, 0x16},
>>>>>> -    {0x37cc, 0x16},
>>>>>> -    {0x37cd, 0x16},
>>>>>> -    {0x37ce, 0x16},
>>>>>> -    {0x3800, 0x00},
>>>>>> -    {0x3801, 0x00},
>>>>>> -    {0x3802, 0x00},
>>>>>> -    {0x3803, 0x06},
>>>>>> -    {0x3804, 0x0c},
>>>>>> -    {0x3805, 0xdf},
>>>>>> -    {0x3806, 0x09},
>>>>>> -    {0x3807, 0xa7},
>>>>>> -    {0x3808, 0x06},
>>>>>> -    {0x3809, 0x68},
>>>>>> -    {0x380a, 0x04},
>>>>>> -    {0x380b, 0xd0},
>>>>>> -    {0x380c, 0x0e},
>>>>>> -    {0x380d, 0xec},
>>>>>> -    {0x380e, 0x04},
>>>>>> -    {0x380f, 0xe8},
>>>>>> -    {0x3810, 0x00},
>>>>>> -    {0x3811, 0x00},
>>>>>> -    {0x3812, 0x00},
>>>>>> -    {0x3813, 0x01},
>>>>>> -    {0x3814, 0x03},
>>>>>> -    {0x3815, 0x01},
>>>>>> -    {0x3816, 0x00},
>>>>>> -    {0x3817, 0x00},
>>>>>> -    {0x3818, 0x00},
>>>>>> -    {0x3819, 0x10},
>>>>>> -    {0x3820, 0x90},
>>>>>> -    {0x3821, 0x67},
>>>>>> -    {0x382a, 0x03},
>>>>>> -    {0x382b, 0x01},
>>>>>> -    {0x3830, 0x06},
>>>>>> -    {0x3836, 0x02},
>>>>>> -    {0x3862, 0x04},
>>>>>> -    {0x3863, 0x08},
>>>>>> -    {0x3cc0, 0x33},
>>>>>> -    {0x3d85, 0x17},
>>>>>> -    {0x3d8c, 0x73},
>>>>>> -    {0x3d8d, 0xde},
>>>>>> -    {0x4001, 0xe0},
>>>>>> -    {0x4003, 0x40},
>>>>>> -    {0x4008, 0x00},
>>>>>> -    {0x4009, 0x05},
>>>>>> -    {0x400a, 0x00},
>>>>>> -    {0x400b, 0x84},
>>>>>> -    {0x400f, 0x80},
>>>>>> -    {0x4010, 0xf0},
>>>>>> -    {0x4011, 0xff},
>>>>>> -    {0x4012, 0x02},
>>>>>> -    {0x4013, 0x01},
>>>>>> -    {0x4014, 0x01},
>>>>>> -    {0x4015, 0x01},
>>>>>> -    {0x4042, 0x00},
>>>>>> -    {0x4043, 0x80},
>>>>>> -    {0x4044, 0x00},
>>>>>> -    {0x4045, 0x80},
>>>>>> -    {0x4046, 0x00},
>>>>>> -    {0x4047, 0x80},
>>>>>> -    {0x4048, 0x00},
>>>>>> -    {0x4049, 0x80},
>>>>>> -    {0x4041, 0x03},
>>>>>> -    {0x404c, 0x20},
>>>>>> -    {0x404d, 0x00},
>>>>>> -    {0x404e, 0x20},
>>>>>> -    {0x4203, 0x80},
>>>>>> -    {0x4307, 0x30},
>>>>>> -    {0x4317, 0x00},
>>>>>> -    {0x4503, 0x08},
>>>>>> -    {0x4601, 0x80},
>>>>>> -    {0x4800, 0x44},
>>>>>> -    {0x4816, 0x53},
>>>>>> -    {0x481b, 0x58},
>>>>>> -    {0x481f, 0x27},
>>>>>> -    {0x4837, 0x16},
>>>>>> -    {0x483c, 0x0f},
>>>>>> -    {0x484b, 0x05},
>>>>>> -    {0x5000, 0x57},
>>>>>> -    {0x5001, 0x0a},
>>>>>> -    {0x5004, 0x04},
>>>>>> -    {0x502e, 0x03},
>>>>>> -    {0x5030, 0x41},
>>>>>> -    {0x5780, 0x14},
>>>>>> -    {0x5781, 0x0f},
>>>>>> -    {0x5782, 0x44},
>>>>>> -    {0x5783, 0x02},
>>>>>> -    {0x5784, 0x01},
>>>>>> -    {0x5785, 0x01},
>>>>>> -    {0x5786, 0x00},
>>>>>> -    {0x5787, 0x04},
>>>>>> -    {0x5788, 0x02},
>>>>>> -    {0x5789, 0x0f},
>>>>>> -    {0x578a, 0xfd},
>>>>>> -    {0x578b, 0xf5},
>>>>>> -    {0x578c, 0xf5},
>>>>>> -    {0x578d, 0x03},
>>>>>> -    {0x578e, 0x08},
>>>>>> -    {0x578f, 0x0c},
>>>>>> -    {0x5790, 0x08},
>>>>>> -    {0x5791, 0x04},
>>>>>> -    {0x5792, 0x00},
>>>>>> -    {0x5793, 0x52},
>>>>>> -    {0x5794, 0xa3},
>>>>>> -    {0x5795, 0x00},
>>>>>> -    {0x5796, 0x10},
>>>>>> -    {0x5797, 0x10},
>>>>>> -    {0x5798, 0x73},
>>>>>> -    {0x5799, 0x73},
>>>>>> -    {0x579a, 0x00},
>>>>>> -    {0x579b, 0x28},
>>>>>> -    {0x579c, 0x00},
>>>>>> -    {0x579d, 0x16},
>>>>>> -    {0x579e, 0x06},
>>>>>> -    {0x579f, 0x20},
>>>>>> -    {0x57a0, 0x04},
>>>>>> -    {0x57a1, 0xa0},
>>>>>> -    {0x59f8, 0x3d},
>>>>>> -    {0x5a08, 0x02},
>>>>>> -    {0x5b00, 0x02},
>>>>>> -    {0x5b01, 0x10},
>>>>>> -    {0x5b02, 0x03},
>>>>>> -    {0x5b03, 0xcf},
>>>>>> -    {0x5b05, 0x6c},
>>>>>> -    {0x5e00, 0x00}
>>>>>> +static const struct ov8856_reg lane_2_mode_1640x1232[] = {
>>>>>> +    /* 1640x1232 resolution */
>>>>>> +        {0x3000, 0x00},
>>>>>> +        {0x300e, 0x00},
>>>>>> +        {0x3010, 0x00},
>>>>>> +        {0x3015, 0x84},
>>>>>> +        {0x3018, 0x32},
>>>>>> +        {0x3021, 0x23},
>>>>>> +        {0x3033, 0x24},
>>>>>> +        {0x3500, 0x00},
>>>>>> +        {0x3501, 0x4c},
>>>>>> +        {0x3502, 0xe0},
>>>>>> +        {0x3503, 0x08},
>>>>>> +        {0x3505, 0x83},
>>>>>> +        {0x3508, 0x01},
>>>>>> +        {0x3509, 0x80},
>>>>>> +        {0x350c, 0x00},
>>>>>> +        {0x350d, 0x80},
>>>>>> +        {0x350e, 0x04},
>>>>>> +        {0x350f, 0x00},
>>>>>> +        {0x3510, 0x00},
>>>>>> +        {0x3511, 0x02},
>>>>>> +        {0x3512, 0x00},
>>>>>> +        {0x3600, 0x72},
>>>>>> +        {0x3601, 0x40},
>>>>>> +        {0x3602, 0x30},
>>>>>> +        {0x3610, 0xc5},
>>>>>> +        {0x3611, 0x58},
>>>>>> +        {0x3612, 0x5c},
>>>>>> +        {0x3613, 0xca},
>>>>>> +        {0x3614, 0x50},
>>>>>> +        {0x3628, 0xff},
>>>>>> +        {0x3629, 0xff},
>>>>>> +        {0x362a, 0xff},
>>>>>> +        {0x3633, 0x10},
>>>>>> +        {0x3634, 0x10},
>>>>>> +        {0x3635, 0x10},
>>>>>> +        {0x3636, 0x10},
>>>>>> +        {0x3663, 0x08},
>>>>>> +        {0x3669, 0x34},
>>>>>> +        {0x366e, 0x08},
>>>>>> +        {0x3706, 0x86},
>>>>>> +        {0x370b, 0x7e},
>>>>>> +        {0x3714, 0x27},
>>>>>> +        {0x3730, 0x12},
>>>>>> +        {0x3733, 0x10},
>>>>>> +        {0x3764, 0x00},
>>>>>> +        {0x3765, 0x00},
>>>>>> +        {0x3769, 0x62},
>>>>>> +        {0x376a, 0x2a},
>>>>>> +        {0x376b, 0x30},
>>>>>> +        {0x3780, 0x00},
>>>>>> +        {0x3781, 0x24},
>>>>>> +        {0x3782, 0x00},
>>>>>> +        {0x3783, 0x23},
>>>>>> +        {0x3798, 0x2f},
>>>>>> +        {0x37a1, 0x60},
>>>>>> +        {0x37a8, 0x6a},
>>>>>> +        {0x37ab, 0x3f},
>>>>>> +        {0x37c2, 0x14},
>>>>>> +        {0x37c3, 0xf1},
>>>>>> +        {0x37c9, 0x80},
>>>>>> +        {0x37cb, 0x16},
>>>>>> +        {0x37cc, 0x16},
>>>>>> +        {0x37cd, 0x16},
>>>>>> +        {0x37ce, 0x16},
>>>>>> +        {0x3800, 0x00},
>>>>>> +        {0x3801, 0x00},
>>>>>> +        {0x3802, 0x00},
>>>>>> +        {0x3803, 0x00},
>>>>>> +        {0x3804, 0x0c},
>>>>>> +        {0x3805, 0xdf},
>>>>>> +        {0x3806, 0x09},
>>>>>> +        {0x3807, 0xaf},
>>>>>> +        {0x3808, 0x06},
>>>>>> +        {0x3809, 0x68},
>>>>>> +        {0x380a, 0x04},
>>>>>> +        {0x380b, 0xd0},
>>>>>> +        {0x380c, 0x0c},
>>>>>> +        {0x380d, 0x60},
>>>>>> +        {0x380e, 0x05},
>>>>>> +        {0x380f, 0xea},
>>>>>> +        {0x3810, 0x00},
>>>>>> +        {0x3811, 0x04},
>>>>>> +        {0x3812, 0x00},
>>>>>> +        {0x3813, 0x05},
>>>>>> +        {0x3814, 0x03},
>>>>>> +        {0x3815, 0x01},
>>>>>> +        {0x3816, 0x00},
>>>>>> +        {0x3817, 0x00},
>>>>>> +        {0x3818, 0x00},
>>>>>> +        {0x3819, 0x00},
>>>>>> +        {0x3820, 0x90},
>>>>>> +        {0x3821, 0x67},
>>>>>> +        {0x382a, 0x03},
>>>>>> +        {0x382b, 0x01},
>>>>>> +        {0x3830, 0x06},
>>>>>> +        {0x3836, 0x02},
>>>>>> +        {0x3837, 0x10},
>>>>>> +        {0x3862, 0x04},
>>>>>> +        {0x3863, 0x08},
>>>>>> +        {0x3cc0, 0x33},
>>>>>> +        {0x3d85, 0x14},
>>>>>> +        {0x3d8c, 0x73},
>>>>>> +        {0x3d8d, 0xde},
>>>>>> +        {0x4001, 0xe0},
>>>>>> +        {0x4003, 0x40},
>>>>>> +        {0x4008, 0x00},
>>>>>> +        {0x4009, 0x05},
>>>>>> +        {0x400a, 0x00},
>>>>>> +        {0x400b, 0x84},
>>>>>> +        {0x400f, 0x80},
>>>>>> +        {0x4010, 0xf0},
>>>>>> +        {0x4011, 0xff},
>>>>>> +        {0x4012, 0x02},
>>>>>> +        {0x4013, 0x01},
>>>>>> +        {0x4014, 0x01},
>>>>>> +        {0x4015, 0x01},
>>>>>> +        {0x4042, 0x00},
>>>>>> +        {0x4043, 0x80},
>>>>>> +        {0x4044, 0x00},
>>>>>> +        {0x4045, 0x80},
>>>>>> +        {0x4046, 0x00},
>>>>>> +        {0x4047, 0x80},
>>>>>> +        {0x4048, 0x00},
>>>>>> +        {0x4049, 0x80},
>>>>>> +        {0x4041, 0x03},
>>>>>> +        {0x404c, 0x20},
>>>>>> +        {0x404d, 0x00},
>>>>>> +        {0x404e, 0x20},
>>>>>> +        {0x4203, 0x80},
>>>>>> +        {0x4307, 0x30},
>>>>>> +        {0x4317, 0x00},
>>>>>> +        {0x4503, 0x08},
>>>>>> +        {0x4601, 0x80},
>>>>>> +        {0x4800, 0x44},
>>>>>> +        {0x4816, 0x53},
>>>>>> +        {0x481b, 0x58},
>>>>>> +        {0x481f, 0x27},
>>>>>> +        {0x4837, 0x16},
>>>>>> +        {0x483c, 0x0f},
>>>>>> +        {0x484b, 0x05},
>>>>>> +        {0x5000, 0x57},
>>>>>> +        {0x5001, 0x0a},
>>>>>> +        {0x5004, 0x04},
>>>>>> +        {0x502e, 0x03},
>>>>>> +        {0x5030, 0x41},
>>>>>> +        {0x5795, 0x00},
>>>>>> +        {0x5796, 0x10},
>>>>>> +        {0x5797, 0x10},
>>>>>> +        {0x5798, 0x73},
>>>>>> +        {0x5799, 0x73},
>>>>>> +        {0x579a, 0x00},
>>>>>> +        {0x579b, 0x28},
>>>>>> +        {0x579c, 0x00},
>>>>>> +        {0x579d, 0x16},
>>>>>> +        {0x579e, 0x06},
>>>>>> +        {0x579f, 0x20},
>>>>>> +        {0x57a0, 0x04},
>>>>>> +        {0x57a1, 0xa0},
>>>>>> +        {0x5780, 0x14},
>>>>>> +        {0x5781, 0x0f},
>>>>>> +        {0x5782, 0x44},
>>>>>> +        {0x5783, 0x02},
>>>>>> +        {0x5784, 0x01},
>>>>>> +        {0x5785, 0x01},
>>>>>> +        {0x5786, 0x00},
>>>>>> +        {0x5787, 0x04},
>>>>>> +        {0x5788, 0x02},
>>>>>> +        {0x5789, 0x0f},
>>>>>> +        {0x578a, 0xfd},
>>>>>> +        {0x578b, 0xf5},
>>>>>> +        {0x578c, 0xf5},
>>>>>> +        {0x578d, 0x03},
>>>>>> +        {0x578e, 0x08},
>>>>>> +        {0x578f, 0x0c},
>>>>>> +        {0x5790, 0x08},
>>>>>> +        {0x5791, 0x04},
>>>>>> +        {0x5792, 0x00},
>>>>>> +        {0x5793, 0x52},
>>>>>> +        {0x5794, 0xa3},
>>>>>> +        {0x59f8, 0x3d},
>>>>>> +        {0x5a08, 0x02},
>>>>>> +        {0x5b00, 0x02},
>>>>>> +        {0x5b01, 0x10},
>>>>>> +        {0x5b02, 0x03},
>>>>>> +        {0x5b03, 0xcf},
>>>>>> +        {0x5b05, 0x6c},
>>>>>> +        {0x5e00, 0x00}
>>>>>>      };
>>>>>>
>>>>>> -static const struct ov8856_reg mode_1632x1224_regs[] = {
>>>>>> -    {0x0103, 0x01},
>>>>>> -    {0x0302, 0x3c},
>>>>>> -    {0x0303, 0x01},
>>>>>> -    {0x031e, 0x0c},
>>>>>> -    {0x3000, 0x20},
>>>>>> -    {0x3003, 0x08},
>>>>>> -    {0x300e, 0x20},
>>>>>> -    {0x3010, 0x00},
>>>>>> -    {0x3015, 0x84},
>>>>>> -    {0x3018, 0x72},
>>>>>> -    {0x3021, 0x23},
>>>>>> -    {0x3033, 0x24},
>>>>>> -    {0x3500, 0x00},
>>>>>> -    {0x3501, 0x4c},
>>>>>> -    {0x3502, 0xe0},
>>>>>> -    {0x3503, 0x08},
>>>>>> -    {0x3505, 0x83},
>>>>>> -    {0x3508, 0x01},
>>>>>> -    {0x3509, 0x80},
>>>>>> -    {0x350c, 0x00},
>>>>>> -    {0x350d, 0x80},
>>>>>> -    {0x350e, 0x04},
>>>>>> -    {0x350f, 0x00},
>>>>>> -    {0x3510, 0x00},
>>>>>> -    {0x3511, 0x02},
>>>>>> -    {0x3512, 0x00},
>>>>>> -    {0x3600, 0x72},
>>>>>> -    {0x3601, 0x40},
>>>>>> -    {0x3602, 0x30},
>>>>>> -    {0x3610, 0xc5},
>>>>>> -    {0x3611, 0x58},
>>>>>> -    {0x3612, 0x5c},
>>>>>> -    {0x3613, 0xca},
>>>>>> -    {0x3614, 0x60},
>>>>>> -    {0x3628, 0xff},
>>>>>> -    {0x3629, 0xff},
>>>>>> -    {0x362a, 0xff},
>>>>>> -    {0x3633, 0x10},
>>>>>> -    {0x3634, 0x10},
>>>>>> -    {0x3635, 0x10},
>>>>>> -    {0x3636, 0x10},
>>>>>> -    {0x3663, 0x08},
>>>>>> -    {0x3669, 0x34},
>>>>>> -    {0x366d, 0x00},
>>>>>> -    {0x366e, 0x08},
>>>>>> -    {0x3706, 0x86},
>>>>>> -    {0x370b, 0x7e},
>>>>>> -    {0x3714, 0x27},
>>>>>> -    {0x3730, 0x12},
>>>>>> -    {0x3733, 0x10},
>>>>>> -    {0x3764, 0x00},
>>>>>> -    {0x3765, 0x00},
>>>>>> -    {0x3769, 0x62},
>>>>>> -    {0x376a, 0x2a},
>>>>>> -    {0x376b, 0x30},
>>>>>> -    {0x3780, 0x00},
>>>>>> -    {0x3781, 0x24},
>>>>>> -    {0x3782, 0x00},
>>>>>> -    {0x3783, 0x23},
>>>>>> -    {0x3798, 0x2f},
>>>>>> -    {0x37a1, 0x60},
>>>>>> -    {0x37a8, 0x6a},
>>>>>> -    {0x37ab, 0x3f},
>>>>>> -    {0x37c2, 0x14},
>>>>>> -    {0x37c3, 0xf1},
>>>>>> -    {0x37c9, 0x80},
>>>>>> -    {0x37cb, 0x16},
>>>>>> -    {0x37cc, 0x16},
>>>>>> -    {0x37cd, 0x16},
>>>>>> -    {0x37ce, 0x16},
>>>>>> -    {0x3800, 0x00},
>>>>>> -    {0x3801, 0x00},
>>>>>> -    {0x3802, 0x00},
>>>>>> -    {0x3803, 0x0c},
>>>>>> -    {0x3804, 0x0c},
>>>>>> -    {0x3805, 0xdf},
>>>>>> -    {0x3806, 0x09},
>>>>>> -    {0x3807, 0xa3},
>>>>>> -    {0x3808, 0x06},
>>>>>> -    {0x3809, 0x60},
>>>>>> -    {0x380a, 0x04},
>>>>>> -    {0x380b, 0xc8},
>>>>>> -    {0x380c, 0x07},
>>>>>> -    {0x380d, 0x8c},
>>>>>> -    {0x380e, 0x09},
>>>>>> -    {0x380f, 0xb2},
>>>>>> -    {0x3810, 0x00},
>>>>>> -    {0x3811, 0x02},
>>>>>> -    {0x3812, 0x00},
>>>>>> -    {0x3813, 0x01},
>>>>>> -    {0x3814, 0x03},
>>>>>> -    {0x3815, 0x01},
>>>>>> -    {0x3816, 0x00},
>>>>>> -    {0x3817, 0x00},
>>>>>> -    {0x3818, 0x00},
>>>>>> -    {0x3819, 0x10},
>>>>>> -    {0x3820, 0x80},
>>>>>> -    {0x3821, 0x47},
>>>>>> -    {0x382a, 0x03},
>>>>>> -    {0x382b, 0x01},
>>>>>> -    {0x3830, 0x06},
>>>>>> -    {0x3836, 0x02},
>>>>>> -    {0x3862, 0x04},
>>>>>> -    {0x3863, 0x08},
>>>>>> -    {0x3cc0, 0x33},
>>>>>> -    {0x3d85, 0x17},
>>>>>> -    {0x3d8c, 0x73},
>>>>>> -    {0x3d8d, 0xde},
>>>>>> -    {0x4001, 0xe0},
>>>>>> -    {0x4003, 0x40},
>>>>>> -    {0x4008, 0x00},
>>>>>> -    {0x4009, 0x05},
>>>>>> -    {0x400a, 0x00},
>>>>>> -    {0x400b, 0x84},
>>>>>> -    {0x400f, 0x80},
>>>>>> -    {0x4010, 0xf0},
>>>>>> -    {0x4011, 0xff},
>>>>>> -    {0x4012, 0x02},
>>>>>> -    {0x4013, 0x01},
>>>>>> -    {0x4014, 0x01},
>>>>>> -    {0x4015, 0x01},
>>>>>> -    {0x4042, 0x00},
>>>>>> -    {0x4043, 0x80},
>>>>>> -    {0x4044, 0x00},
>>>>>> -    {0x4045, 0x80},
>>>>>> -    {0x4046, 0x00},
>>>>>> -    {0x4047, 0x80},
>>>>>> -    {0x4048, 0x00},
>>>>>> -    {0x4049, 0x80},
>>>>>> -    {0x4041, 0x03},
>>>>>> -    {0x404c, 0x20},
>>>>>> -    {0x404d, 0x00},
>>>>>> -    {0x404e, 0x20},
>>>>>> -    {0x4203, 0x80},
>>>>>> -    {0x4307, 0x30},
>>>>>> -    {0x4317, 0x00},
>>>>>> -    {0x4502, 0x50},
>>>>>> -    {0x4503, 0x08},
>>>>>> -    {0x4601, 0x80},
>>>>>> -    {0x4800, 0x44},
>>>>>> -    {0x4816, 0x53},
>>>>>> -    {0x481b, 0x50},
>>>>>> -    {0x481f, 0x27},
>>>>>> -    {0x4823, 0x3c},
>>>>>> -    {0x482b, 0x00},
>>>>>> -    {0x4831, 0x66},
>>>>>> -    {0x4837, 0x16},
>>>>>> -    {0x483c, 0x0f},
>>>>>> -    {0x484b, 0x05},
>>>>>> -    {0x5000, 0x77},
>>>>>> -    {0x5001, 0x0a},
>>>>>> -    {0x5003, 0xc8},
>>>>>> -    {0x5004, 0x04},
>>>>>> -    {0x5006, 0x00},
>>>>>> -    {0x5007, 0x00},
>>>>>> -    {0x502e, 0x03},
>>>>>> -    {0x5030, 0x41},
>>>>>> -    {0x5795, 0x00},
>>>>>> -    {0x5796, 0x10},
>>>>>> -    {0x5797, 0x10},
>>>>>> -    {0x5798, 0x73},
>>>>>> -    {0x5799, 0x73},
>>>>>> -    {0x579a, 0x00},
>>>>>> -    {0x579b, 0x28},
>>>>>> -    {0x579c, 0x00},
>>>>>> -    {0x579d, 0x16},
>>>>>> -    {0x579e, 0x06},
>>>>>> -    {0x579f, 0x20},
>>>>>> -    {0x57a0, 0x04},
>>>>>> -    {0x57a1, 0xa0},
>>>>>> -    {0x5780, 0x14},
>>>>>> -    {0x5781, 0x0f},
>>>>>> -    {0x5782, 0x44},
>>>>>> -    {0x5783, 0x02},
>>>>>> -    {0x5784, 0x01},
>>>>>> -    {0x5785, 0x01},
>>>>>> -    {0x5786, 0x00},
>>>>>> -    {0x5787, 0x04},
>>>>>> -    {0x5788, 0x02},
>>>>>> -    {0x5789, 0x0f},
>>>>>> -    {0x578a, 0xfd},
>>>>>> -    {0x578b, 0xf5},
>>>>>> -    {0x578c, 0xf5},
>>>>>> -    {0x578d, 0x03},
>>>>>> -    {0x578e, 0x08},
>>>>>> -    {0x578f, 0x0c},
>>>>>> -    {0x5790, 0x08},
>>>>>> -    {0x5791, 0x04},
>>>>>> -    {0x5792, 0x00},
>>>>>> -    {0x5793, 0x52},
>>>>>> -    {0x5794, 0xa3},
>>>>>> -    {0x59f8, 0x3d},
>>>>>> -    {0x5a08, 0x02},
>>>>>> -    {0x5b00, 0x02},
>>>>>> -    {0x5b01, 0x10},
>>>>>> -    {0x5b02, 0x03},
>>>>>> -    {0x5b03, 0xcf},
>>>>>> -    {0x5b05, 0x6c},
>>>>>> -    {0x5e00, 0x00},
>>>>>> -    {0x5e10, 0xfc}
>>>>>> +static const struct ov8856_reg lane_4_mode_3280x2464[] = {
>>>>>> +    /* 3280x2464 resolution */
>>>>>> +        {0x3000, 0x20},
>>>>>> +        {0x3003, 0x08},
>>>>>> +        {0x300e, 0x20},
>>>>>> +        {0x3010, 0x00},
>>>>>> +        {0x3015, 0x84},
>>>>>> +        {0x3018, 0x72},
>>>>>> +        {0x3021, 0x23},
>>>>>> +        {0x3033, 0x24},
>>>>>> +        {0x3500, 0x00},
>>>>>> +        {0x3501, 0x9a},
>>>>>> +        {0x3502, 0x20},
>>>>>> +        {0x3503, 0x08},
>>>>>> +        {0x3505, 0x83},
>>>>>> +        {0x3508, 0x01},
>>>>>> +        {0x3509, 0x80},
>>>>>> +        {0x350c, 0x00},
>>>>>> +        {0x350d, 0x80},
>>>>>> +        {0x350e, 0x04},
>>>>>> +        {0x350f, 0x00},
>>>>>> +        {0x3510, 0x00},
>>>>>> +        {0x3511, 0x02},
>>>>>> +        {0x3512, 0x00},
>>>>>> +        {0x3600, 0x72},
>>>>>> +        {0x3601, 0x40},
>>>>>> +        {0x3602, 0x30},
>>>>>> +        {0x3610, 0xc5},
>>>>>> +        {0x3611, 0x58},
>>>>>> +        {0x3612, 0x5c},
>>>>>> +        {0x3613, 0xca},
>>>>>> +        {0x3614, 0x20},
>>>>>> +        {0x3628, 0xff},
>>>>>> +        {0x3629, 0xff},
>>>>>> +        {0x362a, 0xff},
>>>>>> +        {0x3633, 0x10},
>>>>>> +        {0x3634, 0x10},
>>>>>> +        {0x3635, 0x10},
>>>>>> +        {0x3636, 0x10},
>>>>>> +        {0x3663, 0x08},
>>>>>> +        {0x3669, 0x34},
>>>>>> +        {0x366e, 0x10},
>>>>>> +        {0x3706, 0x86},
>>>>>> +        {0x370b, 0x7e},
>>>>>> +        {0x3714, 0x23},
>>>>>> +        {0x3730, 0x12},
>>>>>> +        {0x3733, 0x10},
>>>>>> +        {0x3764, 0x00},
>>>>>> +        {0x3765, 0x00},
>>>>>> +        {0x3769, 0x62},
>>>>>> +        {0x376a, 0x2a},
>>>>>> +        {0x376b, 0x30},
>>>>>> +        {0x3780, 0x00},
>>>>>> +        {0x3781, 0x24},
>>>>>> +        {0x3782, 0x00},
>>>>>> +        {0x3783, 0x23},
>>>>>> +        {0x3798, 0x2f},
>>>>>> +        {0x37a1, 0x60},
>>>>>> +        {0x37a8, 0x6a},
>>>>>> +        {0x37ab, 0x3f},
>>>>>> +        {0x37c2, 0x04},
>>>>>> +        {0x37c3, 0xf1},
>>>>>> +        {0x37c9, 0x80},
>>>>>> +        {0x37cb, 0x16},
>>>>>> +        {0x37cc, 0x16},
>>>>>> +        {0x37cd, 0x16},
>>>>>> +        {0x37ce, 0x16},
>>>>>> +        {0x3800, 0x00},
>>>>>> +        {0x3801, 0x00},
>>>>>> +        {0x3802, 0x00},
>>>>>> +        {0x3803, 0x06},
>>>>>> +        {0x3804, 0x0c},
>>>>>> +        {0x3805, 0xdf},
>>>>>> +        {0x3806, 0x09},
>>>>>> +        {0x3807, 0xa7},
>>>>>> +        {0x3808, 0x0c},
>>>>>> +        {0x3809, 0xd0},
>>>>>> +        {0x380a, 0x09},
>>>>>> +        {0x380b, 0xa0},
>>>>>> +        {0x380c, 0x07},
>>>>>> +        {0x380d, 0x88},
>>>>>> +        {0x380e, 0x09},
>>>>>> +        {0x380f, 0xb8},
>>>>>> +        {0x3810, 0x00},
>>>>>> +        {0x3811, 0x00},
>>>>>> +        {0x3812, 0x00},
>>>>>> +        {0x3813, 0x01},
>>>>>> +        {0x3814, 0x01},
>>>>>> +        {0x3815, 0x01},
>>>>>> +        {0x3816, 0x00},
>>>>>> +        {0x3817, 0x00},
>>>>>> +        {0x3818, 0x00},
>>>>>> +        {0x3819, 0x10},
>>>>>> +        {0x3820, 0x80},
>>>>>> +        {0x3821, 0x46},
>>>>>> +        {0x382a, 0x01},
>>>>>> +        {0x382b, 0x01},
>>>>>> +        {0x3830, 0x06},
>>>>>> +        {0x3836, 0x02},
>>>>>> +        {0x3862, 0x04},
>>>>>> +        {0x3863, 0x08},
>>>>>> +        {0x3cc0, 0x33},
>>>>>> +        {0x3d85, 0x17},
>>>>>> +        {0x3d8c, 0x73},
>>>>>> +        {0x3d8d, 0xde},
>>>>>> +        {0x4001, 0xe0},
>>>>>> +        {0x4003, 0x40},
>>>>>> +        {0x4008, 0x00},
>>>>>> +        {0x4009, 0x0b},
>>>>>> +        {0x400a, 0x00},
>>>>>> +        {0x400b, 0x84},
>>>>>> +        {0x400f, 0x80},
>>>>>> +        {0x4010, 0xf0},
>>>>>> +        {0x4011, 0xff},
>>>>>> +        {0x4012, 0x02},
>>>>>> +        {0x4013, 0x01},
>>>>>> +        {0x4014, 0x01},
>>>>>> +        {0x4015, 0x01},
>>>>>> +        {0x4042, 0x00},
>>>>>> +        {0x4043, 0x80},
>>>>>> +        {0x4044, 0x00},
>>>>>> +        {0x4045, 0x80},
>>>>>> +        {0x4046, 0x00},
>>>>>> +        {0x4047, 0x80},
>>>>>> +        {0x4048, 0x00},
>>>>>> +        {0x4049, 0x80},
>>>>>> +        {0x4041, 0x03},
>>>>>> +        {0x404c, 0x20},
>>>>>> +        {0x404d, 0x00},
>>>>>> +        {0x404e, 0x20},
>>>>>> +        {0x4203, 0x80},
>>>>>> +        {0x4307, 0x30},
>>>>>> +        {0x4317, 0x00},
>>>>>> +        {0x4503, 0x08},
>>>>>> +        {0x4601, 0x80},
>>>>>> +        {0x4800, 0x44},
>>>>>> +        {0x4816, 0x53},
>>>>>> +        {0x481b, 0x58},
>>>>>> +        {0x481f, 0x27},
>>>>>> +        {0x4837, 0x16},
>>>>>> +        {0x483c, 0x0f},
>>>>>> +        {0x484b, 0x05},
>>>>>> +        {0x5000, 0x57},
>>>>>> +        {0x5001, 0x0a},
>>>>>> +        {0x5004, 0x04},
>>>>>> +        {0x502e, 0x03},
>>>>>> +        {0x5030, 0x41},
>>>>>> +        {0x5780, 0x14},
>>>>>> +        {0x5781, 0x0f},
>>>>>> +        {0x5782, 0x44},
>>>>>> +        {0x5783, 0x02},
>>>>>> +        {0x5784, 0x01},
>>>>>> +        {0x5785, 0x01},
>>>>>> +        {0x5786, 0x00},
>>>>>> +        {0x5787, 0x04},
>>>>>> +        {0x5788, 0x02},
>>>>>> +        {0x5789, 0x0f},
>>>>>> +        {0x578a, 0xfd},
>>>>>> +        {0x578b, 0xf5},
>>>>>> +        {0x578c, 0xf5},
>>>>>> +        {0x578d, 0x03},
>>>>>> +        {0x578e, 0x08},
>>>>>> +        {0x578f, 0x0c},
>>>>>> +        {0x5790, 0x08},
>>>>>> +        {0x5791, 0x04},
>>>>>> +        {0x5792, 0x00},
>>>>>> +        {0x5793, 0x52},
>>>>>> +        {0x5794, 0xa3},
>>>>>> +        {0x5795, 0x02},
>>>>>> +        {0x5796, 0x20},
>>>>>> +        {0x5797, 0x20},
>>>>>> +        {0x5798, 0xd5},
>>>>>> +        {0x5799, 0xd5},
>>>>>> +        {0x579a, 0x00},
>>>>>> +        {0x579b, 0x50},
>>>>>> +        {0x579c, 0x00},
>>>>>> +        {0x579d, 0x2c},
>>>>>> +        {0x579e, 0x0c},
>>>>>> +        {0x579f, 0x40},
>>>>>> +        {0x57a0, 0x09},
>>>>>> +        {0x57a1, 0x40},
>>>>>> +        {0x59f8, 0x3d},
>>>>>> +        {0x5a08, 0x02},
>>>>>> +        {0x5b00, 0x02},
>>>>>> +        {0x5b01, 0x10},
>>>>>> +        {0x5b02, 0x03},
>>>>>> +        {0x5b03, 0xcf},
>>>>>> +        {0x5b05, 0x6c},
>>>>>> +        {0x5e00, 0x00}
>>>>>>      };
>>>>>>
>>>>>> -static const char * const ov8856_test_pattern_menu[] = {
>>>>>> -    "Disabled",
>>>>>> -    "Standard Color Bar",
>>>>>> -    "Top-Bottom Darker Color Bar",
>>>>>> -    "Right-Left Darker Color Bar",
>>>>>> -    "Bottom-Top Darker Color Bar"
>>>>>> +static const struct ov8856_reg lane_4_mode_1640x1232[] = {
>>>>>> +    /* 1640x1232 resolution */
>>>>>> +        {0x3000, 0x20},
>>>>>> +        {0x3003, 0x08},
>>>>>> +        {0x300e, 0x20},
>>>>>> +        {0x3010, 0x00},
>>>>>> +        {0x3015, 0x84},
>>>>>> +        {0x3018, 0x72},
>>>>>> +        {0x3021, 0x23},
>>>>>> +        {0x3033, 0x24},
>>>>>> +        {0x3500, 0x00},
>>>>>> +        {0x3501, 0x4c},
>>>>>> +        {0x3502, 0xe0},
>>>>>> +        {0x3503, 0x08},
>>>>>> +        {0x3505, 0x83},
>>>>>> +        {0x3508, 0x01},
>>>>>> +        {0x3509, 0x80},
>>>>>> +        {0x350c, 0x00},
>>>>>> +        {0x350d, 0x80},
>>>>>> +        {0x350e, 0x04},
>>>>>> +        {0x350f, 0x00},
>>>>>> +        {0x3510, 0x00},
>>>>>> +        {0x3511, 0x02},
>>>>>> +        {0x3512, 0x00},
>>>>>> +        {0x3600, 0x72},
>>>>>> +        {0x3601, 0x40},
>>>>>> +        {0x3602, 0x30},
>>>>>> +        {0x3610, 0xc5},
>>>>>> +        {0x3611, 0x58},
>>>>>> +        {0x3612, 0x5c},
>>>>>> +        {0x3613, 0xca},
>>>>>> +        {0x3614, 0x20},
>>>>>> +        {0x3628, 0xff},
>>>>>> +        {0x3629, 0xff},
>>>>>> +        {0x362a, 0xff},
>>>>>> +        {0x3633, 0x10},
>>>>>> +        {0x3634, 0x10},
>>>>>> +        {0x3635, 0x10},
>>>>>> +        {0x3636, 0x10},
>>>>>> +        {0x3663, 0x08},
>>>>>> +        {0x3669, 0x34},
>>>>>> +        {0x366e, 0x08},
>>>>>> +        {0x3706, 0x86},
>>>>>> +        {0x370b, 0x7e},
>>>>>> +        {0x3714, 0x27},
>>>>>> +        {0x3730, 0x12},
>>>>>> +        {0x3733, 0x10},
>>>>>> +        {0x3764, 0x00},
>>>>>> +        {0x3765, 0x00},
>>>>>> +        {0x3769, 0x62},
>>>>>> +        {0x376a, 0x2a},
>>>>>> +        {0x376b, 0x30},
>>>>>> +        {0x3780, 0x00},
>>>>>> +        {0x3781, 0x24},
>>>>>> +        {0x3782, 0x00},
>>>>>> +        {0x3783, 0x23},
>>>>>> +        {0x3798, 0x2f},
>>>>>> +        {0x37a1, 0x60},
>>>>>> +        {0x37a8, 0x6a},
>>>>>> +        {0x37ab, 0x3f},
>>>>>> +        {0x37c2, 0x14},
>>>>>> +        {0x37c3, 0xf1},
>>>>>> +        {0x37c9, 0x80},
>>>>>> +        {0x37cb, 0x16},
>>>>>> +        {0x37cc, 0x16},
>>>>>> +        {0x37cd, 0x16},
>>>>>> +        {0x37ce, 0x16},
>>>>>> +        {0x3800, 0x00},
>>>>>> +        {0x3801, 0x00},
>>>>>> +        {0x3802, 0x00},
>>>>>> +        {0x3803, 0x00},
>>>>>> +        {0x3804, 0x0c},
>>>>>> +        {0x3805, 0xdf},
>>>>>> +        {0x3806, 0x09},
>>>>>> +        {0x3807, 0xaf},
>>>>>> +        {0x3808, 0x06},
>>>>>> +        {0x3809, 0x68},
>>>>>> +        {0x380a, 0x04},
>>>>>> +        {0x380b, 0xd0},
>>>>>> +        {0x380c, 0x0e},
>>>>>> +        {0x380d, 0xec},
>>>>>> +        {0x380e, 0x04},
>>>>>> +        {0x380f, 0xe8},
>>>>>> +        {0x3810, 0x00},
>>>>>> +        {0x3811, 0x04},
>>>>>> +        {0x3812, 0x00},
>>>>>> +        {0x3813, 0x05},
>>>>>> +        {0x3814, 0x03},
>>>>>> +        {0x3815, 0x01},
>>>>>> +        {0x3816, 0x00},
>>>>>> +        {0x3817, 0x00},
>>>>>> +        {0x3818, 0x00},
>>>>>> +        {0x3819, 0x10},
>>>>>> +        {0x3820, 0x90},
>>>>>> +        {0x3821, 0x67},
>>>>>> +        {0x382a, 0x03},
>>>>>> +        {0x382b, 0x01},
>>>>>> +        {0x3830, 0x06},
>>>>>> +        {0x3836, 0x02},
>>>>>> +        {0x3862, 0x04},
>>>>>> +        {0x3863, 0x08},
>>>>>> +        {0x3cc0, 0x33},
>>>>>> +        {0x3d85, 0x17},
>>>>>> +        {0x3d8c, 0x73},
>>>>>> +        {0x3d8d, 0xde},
>>>>>> +        {0x4001, 0xe0},
>>>>>> +        {0x4003, 0x40},
>>>>>> +        {0x4008, 0x00},
>>>>>> +        {0x4009, 0x05},
>>>>>> +        {0x400a, 0x00},
>>>>>> +        {0x400b, 0x84},
>>>>>> +        {0x400f, 0x80},
>>>>>> +        {0x4010, 0xf0},
>>>>>> +        {0x4011, 0xff},
>>>>>> +        {0x4012, 0x02},
>>>>>> +        {0x4013, 0x01},
>>>>>> +        {0x4014, 0x01},
>>>>>> +        {0x4015, 0x01},
>>>>>> +        {0x4042, 0x00},
>>>>>> +        {0x4043, 0x80},
>>>>>> +        {0x4044, 0x00},
>>>>>> +        {0x4045, 0x80},
>>>>>> +        {0x4046, 0x00},
>>>>>> +        {0x4047, 0x80},
>>>>>> +        {0x4048, 0x00},
>>>>>> +        {0x4049, 0x80},
>>>>>> +        {0x4041, 0x03},
>>>>>> +        {0x404c, 0x20},
>>>>>> +        {0x404d, 0x00},
>>>>>> +        {0x404e, 0x20},
>>>>>> +        {0x4203, 0x80},
>>>>>> +        {0x4307, 0x30},
>>>>>> +        {0x4317, 0x00},
>>>>>> +        {0x4503, 0x08},
>>>>>> +        {0x4601, 0x80},
>>>>>> +        {0x4800, 0x44},
>>>>>> +        {0x4816, 0x53},
>>>>>> +        {0x481b, 0x58},
>>>>>> +        {0x481f, 0x27},
>>>>>> +        {0x4837, 0x16},
>>>>>> +        {0x483c, 0x0f},
>>>>>> +        {0x484b, 0x05},
>>>>>> +        {0x5000, 0x57},
>>>>>> +        {0x5001, 0x0a},
>>>>>> +        {0x5004, 0x04},
>>>>>> +        {0x502e, 0x03},
>>>>>> +        {0x5030, 0x41},
>>>>>> +        {0x5780, 0x14},
>>>>>> +        {0x5781, 0x0f},
>>>>>> +        {0x5782, 0x44},
>>>>>> +        {0x5783, 0x02},
>>>>>> +        {0x5784, 0x01},
>>>>>> +        {0x5785, 0x01},
>>>>>> +        {0x5786, 0x00},
>>>>>> +        {0x5787, 0x04},
>>>>>> +        {0x5788, 0x02},
>>>>>> +        {0x5789, 0x0f},
>>>>>> +        {0x578a, 0xfd},
>>>>>> +        {0x578b, 0xf5},
>>>>>> +        {0x578c, 0xf5},
>>>>>> +        {0x578d, 0x03},
>>>>>> +        {0x578e, 0x08},
>>>>>> +        {0x578f, 0x0c},
>>>>>> +        {0x5790, 0x08},
>>>>>> +        {0x5791, 0x04},
>>>>>> +        {0x5792, 0x00},
>>>>>> +        {0x5793, 0x52},
>>>>>> +        {0x5794, 0xa3},
>>>>>> +        {0x5795, 0x00},
>>>>>> +        {0x5796, 0x10},
>>>>>> +        {0x5797, 0x10},
>>>>>> +        {0x5798, 0x73},
>>>>>> +        {0x5799, 0x73},
>>>>>> +        {0x579a, 0x00},
>>>>>> +        {0x579b, 0x28},
>>>>>> +        {0x579c, 0x00},
>>>>>> +        {0x579d, 0x16},
>>>>>> +        {0x579e, 0x06},
>>>>>> +        {0x579f, 0x20},
>>>>>> +        {0x57a0, 0x04},
>>>>>> +        {0x57a1, 0xa0},
>>>>>> +        {0x59f8, 0x3d},
>>>>>> +        {0x5a08, 0x02},
>>>>>> +        {0x5b00, 0x02},
>>>>>> +        {0x5b01, 0x10},
>>>>>> +        {0x5b02, 0x03},
>>>>>> +        {0x5b03, 0xcf},
>>>>>> +        {0x5b05, 0x6c},
>>>>>> +        {0x5e00, 0x00}
>>>>>>      };
>>>>>>
>>>>>> -static const s64 link_freq_menu_items[] = {
>>>>>> -    OV8856_LINK_FREQ_360MHZ,
>>>>>> -    OV8856_LINK_FREQ_180MHZ
>>>>>> +static const struct ov8856_reg lane_4_mode_3264x2448[] = {
>>>>>> +    /* 3264x2448 resolution */
>>>>>> +        {0x0103, 0x01},
>>>>>> +        {0x0302, 0x3c},
>>>>>> +        {0x0303, 0x01},
>>>>>> +        {0x031e, 0x0c},
>>>>>> +        {0x3000, 0x20},
>>>>>> +        {0x3003, 0x08},
>>>>>> +        {0x300e, 0x20},
>>>>>> +        {0x3010, 0x00},
>>>>>> +        {0x3015, 0x84},
>>>>>> +        {0x3018, 0x72},
>>>>>> +        {0x3021, 0x23},
>>>>>> +        {0x3033, 0x24},
>>>>>> +        {0x3500, 0x00},
>>>>>> +        {0x3501, 0x9a},
>>>>>> +        {0x3502, 0x20},
>>>>>> +        {0x3503, 0x08},
>>>>>> +        {0x3505, 0x83},
>>>>>> +        {0x3508, 0x01},
>>>>>> +        {0x3509, 0x80},
>>>>>> +        {0x350c, 0x00},
>>>>>> +        {0x350d, 0x80},
>>>>>> +        {0x350e, 0x04},
>>>>>> +        {0x350f, 0x00},
>>>>>> +        {0x3510, 0x00},
>>>>>> +        {0x3511, 0x02},
>>>>>> +        {0x3512, 0x00},
>>>>>> +        {0x3600, 0x72},
>>>>>> +        {0x3601, 0x40},
>>>>>> +        {0x3602, 0x30},
>>>>>> +        {0x3610, 0xc5},
>>>>>> +        {0x3611, 0x58},
>>>>>> +        {0x3612, 0x5c},
>>>>>> +        {0x3613, 0xca},
>>>>>> +        {0x3614, 0x60},
>>>>>> +        {0x3628, 0xff},
>>>>>> +        {0x3629, 0xff},
>>>>>> +        {0x362a, 0xff},
>>>>>> +        {0x3633, 0x10},
>>>>>> +        {0x3634, 0x10},
>>>>>> +        {0x3635, 0x10},
>>>>>> +        {0x3636, 0x10},
>>>>>> +        {0x3663, 0x08},
>>>>>> +        {0x3669, 0x34},
>>>>>> +        {0x366d, 0x00},
>>>>>> +        {0x366e, 0x10},
>>>>>> +        {0x3706, 0x86},
>>>>>> +        {0x370b, 0x7e},
>>>>>> +        {0x3714, 0x23},
>>>>>> +        {0x3730, 0x12},
>>>>>> +        {0x3733, 0x10},
>>>>>> +        {0x3764, 0x00},
>>>>>> +        {0x3765, 0x00},
>>>>>> +        {0x3769, 0x62},
>>>>>> +        {0x376a, 0x2a},
>>>>>> +        {0x376b, 0x30},
>>>>>> +        {0x3780, 0x00},
>>>>>> +        {0x3781, 0x24},
>>>>>> +        {0x3782, 0x00},
>>>>>> +        {0x3783, 0x23},
>>>>>> +        {0x3798, 0x2f},
>>>>>> +        {0x37a1, 0x60},
>>>>>> +        {0x37a8, 0x6a},
>>>>>> +        {0x37ab, 0x3f},
>>>>>> +        {0x37c2, 0x04},
>>>>>> +        {0x37c3, 0xf1},
>>>>>> +        {0x37c9, 0x80},
>>>>>> +        {0x37cb, 0x16},
>>>>>> +        {0x37cc, 0x16},
>>>>>> +        {0x37cd, 0x16},
>>>>>> +        {0x37ce, 0x16},
>>>>>> +        {0x3800, 0x00},
>>>>>> +        {0x3801, 0x00},
>>>>>> +        {0x3802, 0x00},
>>>>>> +        {0x3803, 0x0c},
>>>>>> +        {0x3804, 0x0c},
>>>>>> +        {0x3805, 0xdf},
>>>>>> +        {0x3806, 0x09},
>>>>>> +        {0x3807, 0xa3},
>>>>>> +        {0x3808, 0x0c},
>>>>>> +        {0x3809, 0xc0},
>>>>>> +        {0x380a, 0x09},
>>>>>> +        {0x380b, 0x90},
>>>>>> +        {0x380c, 0x07},
>>>>>> +        {0x380d, 0x8c},
>>>>>> +        {0x380e, 0x09},
>>>>>> +        {0x380f, 0xb2},
>>>>>> +        {0x3810, 0x00},
>>>>>> +        {0x3811, 0x04},
>>>>>> +        {0x3812, 0x00},
>>>>>> +        {0x3813, 0x01},
>>>>>> +        {0x3814, 0x01},
>>>>>> +        {0x3815, 0x01},
>>>>>> +        {0x3816, 0x00},
>>>>>> +        {0x3817, 0x00},
>>>>>> +        {0x3818, 0x00},
>>>>>> +        {0x3819, 0x10},
>>>>>> +        {0x3820, 0x80},
>>>>>> +        {0x3821, 0x46},
>>>>>> +        {0x382a, 0x01},
>>>>>> +        {0x382b, 0x01},
>>>>>> +        {0x3830, 0x06},
>>>>>> +        {0x3836, 0x02},
>>>>>> +        {0x3862, 0x04},
>>>>>> +        {0x3863, 0x08},
>>>>>> +        {0x3cc0, 0x33},
>>>>>> +        {0x3d85, 0x17},
>>>>>> +        {0x3d8c, 0x73},
>>>>>> +        {0x3d8d, 0xde},
>>>>>> +        {0x4001, 0xe0},
>>>>>> +        {0x4003, 0x40},
>>>>>> +        {0x4008, 0x00},
>>>>>> +        {0x4009, 0x0b},
>>>>>> +        {0x400a, 0x00},
>>>>>> +        {0x400b, 0x84},
>>>>>> +        {0x400f, 0x80},
>>>>>> +        {0x4010, 0xf0},
>>>>>> +        {0x4011, 0xff},
>>>>>> +        {0x4012, 0x02},
>>>>>> +        {0x4013, 0x01},
>>>>>> +        {0x4014, 0x01},
>>>>>> +        {0x4015, 0x01},
>>>>>> +        {0x4042, 0x00},
>>>>>> +        {0x4043, 0x80},
>>>>>> +        {0x4044, 0x00},
>>>>>> +        {0x4045, 0x80},
>>>>>> +        {0x4046, 0x00},
>>>>>> +        {0x4047, 0x80},
>>>>>> +        {0x4048, 0x00},
>>>>>> +        {0x4049, 0x80},
>>>>>> +        {0x4041, 0x03},
>>>>>> +        {0x404c, 0x20},
>>>>>> +        {0x404d, 0x00},
>>>>>> +        {0x404e, 0x20},
>>>>>> +        {0x4203, 0x80},
>>>>>> +        {0x4307, 0x30},
>>>>>> +        {0x4317, 0x00},
>>>>>> +        {0x4502, 0x50},
>>>>>> +        {0x4503, 0x08},
>>>>>> +        {0x4601, 0x80},
>>>>>> +        {0x4800, 0x44},
>>>>>> +        {0x4816, 0x53},
>>>>>> +        {0x481b, 0x50},
>>>>>> +        {0x481f, 0x27},
>>>>>> +        {0x4823, 0x3c},
>>>>>> +        {0x482b, 0x00},
>>>>>> +        {0x4831, 0x66},
>>>>>> +        {0x4837, 0x16},
>>>>>> +        {0x483c, 0x0f},
>>>>>> +        {0x484b, 0x05},
>>>>>> +        {0x5000, 0x77},
>>>>>> +        {0x5001, 0x0a},
>>>>>> +        {0x5003, 0xc8},
>>>>>> +        {0x5004, 0x04},
>>>>>> +        {0x5006, 0x00},
>>>>>> +        {0x5007, 0x00},
>>>>>> +        {0x502e, 0x03},
>>>>>> +        {0x5030, 0x41},
>>>>>> +        {0x5780, 0x14},
>>>>>> +        {0x5781, 0x0f},
>>>>>> +        {0x5782, 0x44},
>>>>>> +        {0x5783, 0x02},
>>>>>> +        {0x5784, 0x01},
>>>>>> +        {0x5785, 0x01},
>>>>>> +        {0x5786, 0x00},
>>>>>> +        {0x5787, 0x04},
>>>>>> +        {0x5788, 0x02},
>>>>>> +        {0x5789, 0x0f},
>>>>>> +        {0x578a, 0xfd},
>>>>>> +        {0x578b, 0xf5},
>>>>>> +        {0x578c, 0xf5},
>>>>>> +        {0x578d, 0x03},
>>>>>> +        {0x578e, 0x08},
>>>>>> +        {0x578f, 0x0c},
>>>>>> +        {0x5790, 0x08},
>>>>>> +        {0x5791, 0x04},
>>>>>> +        {0x5792, 0x00},
>>>>>> +        {0x5793, 0x52},
>>>>>> +        {0x5794, 0xa3},
>>>>>> +        {0x5795, 0x02},
>>>>>> +        {0x5796, 0x20},
>>>>>> +        {0x5797, 0x20},
>>>>>> +        {0x5798, 0xd5},
>>>>>> +        {0x5799, 0xd5},
>>>>>> +        {0x579a, 0x00},
>>>>>> +        {0x579b, 0x50},
>>>>>> +        {0x579c, 0x00},
>>>>>> +        {0x579d, 0x2c},
>>>>>> +        {0x579e, 0x0c},
>>>>>> +        {0x579f, 0x40},
>>>>>> +        {0x57a0, 0x09},
>>>>>> +        {0x57a1, 0x40},
>>>>>> +        {0x59f8, 0x3d},
>>>>>> +        {0x5a08, 0x02},
>>>>>> +        {0x5b00, 0x02},
>>>>>> +        {0x5b01, 0x10},
>>>>>> +        {0x5b02, 0x03},
>>>>>> +        {0x5b03, 0xcf},
>>>>>> +        {0x5b05, 0x6c},
>>>>>> +        {0x5e00, 0x00},
>>>>>> +        {0x5e10, 0xfc}
>>>>>>      };
>>>>>>
>>>>>> -static const struct ov8856_link_freq_config link_freq_configs[] = {
>>>>>> -    [OV8856_LINK_FREQ_720MBPS] = {
>>>>>> -        .reg_list = {
>>>>>> -            .num_of_regs = ARRAY_SIZE(mipi_data_rate_720mbps),
>>>>>> -            .regs = mipi_data_rate_720mbps,
>>>>>> -        }
>>>>>> -    },
>>>>>> -    [OV8856_LINK_FREQ_360MBPS] = {
>>>>>> -        .reg_list = {
>>>>>> -            .num_of_regs = ARRAY_SIZE(mipi_data_rate_360mbps),
>>>>>> -            .regs = mipi_data_rate_360mbps,
>>>>>> -        }
>>>>>> -    }
>>>>>> +static const struct ov8856_reg lane_4_mode_1632x1224[] = {
>>>>>> +    /* 1632x1224 resolution */
>>>>>> +        {0x0103, 0x01},
>>>>>> +        {0x0302, 0x3c},
>>>>>> +        {0x0303, 0x01},
>>>>>> +        {0x031e, 0x0c},
>>>>>> +        {0x3000, 0x20},
>>>>>> +        {0x3003, 0x08},
>>>>>> +        {0x300e, 0x20},
>>>>>> +        {0x3010, 0x00},
>>>>>> +        {0x3015, 0x84},
>>>>>> +        {0x3018, 0x72},
>>>>>> +        {0x3021, 0x23},
>>>>>> +        {0x3033, 0x24},
>>>>>> +        {0x3500, 0x00},
>>>>>> +        {0x3501, 0x4c},
>>>>>> +        {0x3502, 0xe0},
>>>>>> +        {0x3503, 0x08},
>>>>>> +        {0x3505, 0x83},
>>>>>> +        {0x3508, 0x01},
>>>>>> +        {0x3509, 0x80},
>>>>>> +        {0x350c, 0x00},
>>>>>> +        {0x350d, 0x80},
>>>>>> +        {0x350e, 0x04},
>>>>>> +        {0x350f, 0x00},
>>>>>> +        {0x3510, 0x00},
>>>>>> +        {0x3511, 0x02},
>>>>>> +        {0x3512, 0x00},
>>>>>> +        {0x3600, 0x72},
>>>>>> +        {0x3601, 0x40},
>>>>>> +        {0x3602, 0x30},
>>>>>> +        {0x3610, 0xc5},
>>>>>> +        {0x3611, 0x58},
>>>>>> +        {0x3612, 0x5c},
>>>>>> +        {0x3613, 0xca},
>>>>>> +        {0x3614, 0x60},
>>>>>> +        {0x3628, 0xff},
>>>>>> +        {0x3629, 0xff},
>>>>>> +        {0x362a, 0xff},
>>>>>> +        {0x3633, 0x10},
>>>>>> +        {0x3634, 0x10},
>>>>>> +        {0x3635, 0x10},
>>>>>> +        {0x3636, 0x10},
>>>>>> +        {0x3663, 0x08},
>>>>>> +        {0x3669, 0x34},
>>>>>> +        {0x366d, 0x00},
>>>>>> +        {0x366e, 0x08},
>>>>>> +        {0x3706, 0x86},
>>>>>> +        {0x370b, 0x7e},
>>>>>> +        {0x3714, 0x27},
>>>>>> +        {0x3730, 0x12},
>>>>>> +        {0x3733, 0x10},
>>>>>> +        {0x3764, 0x00},
>>>>>> +        {0x3765, 0x00},
>>>>>> +        {0x3769, 0x62},
>>>>>> +        {0x376a, 0x2a},
>>>>>> +        {0x376b, 0x30},
>>>>>> +        {0x3780, 0x00},
>>>>>> +        {0x3781, 0x24},
>>>>>> +        {0x3782, 0x00},
>>>>>> +        {0x3783, 0x23},
>>>>>> +        {0x3798, 0x2f},
>>>>>> +        {0x37a1, 0x60},
>>>>>> +        {0x37a8, 0x6a},
>>>>>> +        {0x37ab, 0x3f},
>>>>>> +        {0x37c2, 0x14},
>>>>>> +        {0x37c3, 0xf1},
>>>>>> +        {0x37c9, 0x80},
>>>>>> +        {0x37cb, 0x16},
>>>>>> +        {0x37cc, 0x16},
>>>>>> +        {0x37cd, 0x16},
>>>>>> +        {0x37ce, 0x16},
>>>>>> +        {0x3800, 0x00},
>>>>>> +        {0x3801, 0x00},
>>>>>> +        {0x3802, 0x00},
>>>>>> +        {0x3803, 0x0c},
>>>>>> +        {0x3804, 0x0c},
>>>>>> +        {0x3805, 0xdf},
>>>>>> +        {0x3806, 0x09},
>>>>>> +        {0x3807, 0xa3},
>>>>>> +        {0x3808, 0x06},
>>>>>> +        {0x3809, 0x60},
>>>>>> +        {0x380a, 0x04},
>>>>>> +        {0x380b, 0xc8},
>>>>>> +        {0x380c, 0x07},
>>>>>> +        {0x380d, 0x8c},
>>>>>> +        {0x380e, 0x09},
>>>>>> +        {0x380f, 0xb2},
>>>>>> +        {0x3810, 0x00},
>>>>>> +        {0x3811, 0x02},
>>>>>> +        {0x3812, 0x00},
>>>>>> +        {0x3813, 0x01},
>>>>>> +        {0x3814, 0x03},
>>>>>> +        {0x3815, 0x01},
>>>>>> +        {0x3816, 0x00},
>>>>>> +        {0x3817, 0x00},
>>>>>> +        {0x3818, 0x00},
>>>>>> +        {0x3819, 0x10},
>>>>>> +        {0x3820, 0x80},
>>>>>> +        {0x3821, 0x47},
>>>>>> +        {0x382a, 0x03},
>>>>>> +        {0x382b, 0x01},
>>>>>> +        {0x3830, 0x06},
>>>>>> +        {0x3836, 0x02},
>>>>>> +        {0x3862, 0x04},
>>>>>> +        {0x3863, 0x08},
>>>>>> +        {0x3cc0, 0x33},
>>>>>> +        {0x3d85, 0x17},
>>>>>> +        {0x3d8c, 0x73},
>>>>>> +        {0x3d8d, 0xde},
>>>>>> +        {0x4001, 0xe0},
>>>>>> +        {0x4003, 0x40},
>>>>>> +        {0x4008, 0x00},
>>>>>> +        {0x4009, 0x05},
>>>>>> +        {0x400a, 0x00},
>>>>>> +        {0x400b, 0x84},
>>>>>> +        {0x400f, 0x80},
>>>>>> +        {0x4010, 0xf0},
>>>>>> +        {0x4011, 0xff},
>>>>>> +        {0x4012, 0x02},
>>>>>> +        {0x4013, 0x01},
>>>>>> +        {0x4014, 0x01},
>>>>>> +        {0x4015, 0x01},
>>>>>> +        {0x4042, 0x00},
>>>>>> +        {0x4043, 0x80},
>>>>>> +        {0x4044, 0x00},
>>>>>> +        {0x4045, 0x80},
>>>>>> +        {0x4046, 0x00},
>>>>>> +        {0x4047, 0x80},
>>>>>> +        {0x4048, 0x00},
>>>>>> +        {0x4049, 0x80},
>>>>>> +        {0x4041, 0x03},
>>>>>> +        {0x404c, 0x20},
>>>>>> +        {0x404d, 0x00},
>>>>>> +        {0x404e, 0x20},
>>>>>> +        {0x4203, 0x80},
>>>>>> +        {0x4307, 0x30},
>>>>>> +        {0x4317, 0x00},
>>>>>> +        {0x4502, 0x50},
>>>>>> +        {0x4503, 0x08},
>>>>>> +        {0x4601, 0x80},
>>>>>> +        {0x4800, 0x44},
>>>>>> +        {0x4816, 0x53},
>>>>>> +        {0x481b, 0x50},
>>>>>> +        {0x481f, 0x27},
>>>>>> +        {0x4823, 0x3c},
>>>>>> +        {0x482b, 0x00},
>>>>>> +        {0x4831, 0x66},
>>>>>> +        {0x4837, 0x16},
>>>>>> +        {0x483c, 0x0f},
>>>>>> +        {0x484b, 0x05},
>>>>>> +        {0x5000, 0x77},
>>>>>> +        {0x5001, 0x0a},
>>>>>> +        {0x5003, 0xc8},
>>>>>> +        {0x5004, 0x04},
>>>>>> +        {0x5006, 0x00},
>>>>>> +        {0x5007, 0x00},
>>>>>> +        {0x502e, 0x03},
>>>>>> +        {0x5030, 0x41},
>>>>>> +        {0x5795, 0x00},
>>>>>> +        {0x5796, 0x10},
>>>>>> +        {0x5797, 0x10},
>>>>>> +        {0x5798, 0x73},
>>>>>> +        {0x5799, 0x73},
>>>>>> +        {0x579a, 0x00},
>>>>>> +        {0x579b, 0x28},
>>>>>> +        {0x579c, 0x00},
>>>>>> +        {0x579d, 0x16},
>>>>>> +        {0x579e, 0x06},
>>>>>> +        {0x579f, 0x20},
>>>>>> +        {0x57a0, 0x04},
>>>>>> +        {0x57a1, 0xa0},
>>>>>> +        {0x5780, 0x14},
>>>>>> +        {0x5781, 0x0f},
>>>>>> +        {0x5782, 0x44},
>>>>>> +        {0x5783, 0x02},
>>>>>> +        {0x5784, 0x01},
>>>>>> +        {0x5785, 0x01},
>>>>>> +        {0x5786, 0x00},
>>>>>> +        {0x5787, 0x04},
>>>>>> +        {0x5788, 0x02},
>>>>>> +        {0x5789, 0x0f},
>>>>>> +        {0x578a, 0xfd},
>>>>>> +        {0x578b, 0xf5},
>>>>>> +        {0x578c, 0xf5},
>>>>>> +        {0x578d, 0x03},
>>>>>> +        {0x578e, 0x08},
>>>>>> +        {0x578f, 0x0c},
>>>>>> +        {0x5790, 0x08},
>>>>>> +        {0x5791, 0x04},
>>>>>> +        {0x5792, 0x00},
>>>>>> +        {0x5793, 0x52},
>>>>>> +        {0x5794, 0xa3},
>>>>>> +        {0x59f8, 0x3d},
>>>>>> +        {0x5a08, 0x02},
>>>>>> +        {0x5b00, 0x02},
>>>>>> +        {0x5b01, 0x10},
>>>>>> +        {0x5b02, 0x03},
>>>>>> +        {0x5b03, 0xcf},
>>>>>> +        {0x5b05, 0x6c},
>>>>>> +        {0x5e00, 0x00},
>>>>>> +        {0x5e10, 0xfc}
>>>>>>      };
>>>>>>
>>>>>> -static const struct ov8856_mode supported_modes[] = {
>>>>>> -    {
>>>>>> -        .width = 3280,
>>>>>> -        .height = 2464,
>>>>>> -        .hts = 1928,
>>>>>> -        .vts_def = 2488,
>>>>>> -        .vts_min = 2488,
>>>>>> -        .reg_list = {
>>>>>> -            .num_of_regs = ARRAY_SIZE(mode_3280x2464_regs),
>>>>>> -            .regs = mode_3280x2464_regs,
>>>>>> -        },
>>>>>> -        .link_freq_index = OV8856_LINK_FREQ_720MBPS,
>>>>>> -    },
>>>>>> -    {
>>>>>> -        .width = 3264,
>>>>>> -        .height = 2448,
>>>>>> -        .hts = 1932,
>>>>>> -        .vts_def = 2482,
>>>>>> -        .vts_min = 2482,
>>>>>> -        .reg_list = {
>>>>>> -            .num_of_regs = ARRAY_SIZE(mode_3264x2448_regs),
>>>>>> -            .regs = mode_3264x2448_regs,
>>>>>> -        },
>>>>>> -        .link_freq_index = OV8856_LINK_FREQ_720MBPS,
>>>>>> -    },
>>>>>> -    {
>>>>>> -        .width = 1640,
>>>>>> -        .height = 1232,
>>>>>> -        .hts = 3820,
>>>>>> -        .vts_def = 1256,
>>>>>> -        .vts_min = 1256,
>>>>>> -        .reg_list = {
>>>>>> -            .num_of_regs = ARRAY_SIZE(mode_1640x1232_regs),
>>>>>> -            .regs = mode_1640x1232_regs,
>>>>>> -        },
>>>>>> -        .link_freq_index = OV8856_LINK_FREQ_360MBPS,
>>>>>> -    },
>>>>>> -    {
>>>>>> -        .width = 1632,
>>>>>> -        .height = 1224,
>>>>>> -        .hts = 1932,
>>>>>> -        .vts_def = 2482,
>>>>>> -        .vts_min = 2482,
>>>>>> -        .reg_list = {
>>>>>> -            .num_of_regs = ARRAY_SIZE(mode_1632x1224_regs),
>>>>>> -            .regs = mode_1632x1224_regs,
>>>>>> -        },
>>>>>> -        .link_freq_index = OV8856_LINK_FREQ_360MBPS,
>>>>>> -    }
>>>>>> +static const char * const ov8856_test_pattern_menu[] = {
>>>>>> +    "Disabled",
>>>>>> +    "Standard Color Bar",
>>>>>> +    "Top-Bottom Darker Color Bar",
>>>>>> +    "Right-Left Darker Color Bar",
>>>>>> +    "Bottom-Top Darker Color Bar"
>>>>>>      };
>>>>>>
>>>>>>      struct ov8856 {
>>>>>> @@ -1037,20 +1383,173 @@ struct ov8856 {
>>>>>>
>>>>>>          /* Streaming on/off */
>>>>>>          bool streaming;
>>>>>> +
>>>>>> +    /* lanes index */
>>>>>> +    u8 nlanes;
>>>>>> +
>>>>>> +    const struct ov8856_lane_cfg *priv_lane;
>>>>>> +    u8 modes_size;
>>>>>> +};
>>>>>> +
>>>>>> +struct ov8856_lane_cfg {
>>>>>> +    const s64 link_freq_menu_items[2];
>>>>>> +    const struct ov8856_link_freq_config link_freq_configs[2];
>>>>>> +    const struct ov8856_mode supported_modes[4];
>>>>>> +};
>>>>>> +
>>>>>> +static const struct ov8856_lane_cfg lane_cfg_2 = {
>>>>>> +    {
>>>>>> +        720000000,
>>>>>> +        360000000,
>>>>>> +    },
>>>>>> +    {{
>>>>>> +        .reg_list = {
>>>>>> +            .num_of_regs =
>>>>>> +            ARRAY_SIZE(mipi_data_rate_lane_2.regs_0),
>>>>>> +            .regs = mipi_data_rate_lane_2.regs_0,
>>>>>> +        }
>>>>>> +    },
>>>>>> +    {
>>>>>> +        .reg_list = {
>>>>>> +            .num_of_regs =
>>>>>> +            ARRAY_SIZE(mipi_data_rate_lane_2.regs_1),
>>>>>> +            .regs = mipi_data_rate_lane_2.regs_1,
>>>>>> +        }
>>>>>> +    }},
>>>>>> +    {{
>>>>>> +        .width = 3280,
>>>>>> +        .height = 2464,
>>>>>> +        .hts = 1928,
>>>>>> +        .vts_def = 2488,
>>>>>> +        .vts_min = 2488,
>>>>>> +        .reg_list = {
>>>>>> +            .num_of_regs =
>>>>>> +            ARRAY_SIZE(lane_2_mode_3280x2464),
>>>>>> +            .regs = lane_2_mode_3280x2464,
>>>>>> +        },
>>>>>> +        .link_freq_index = 0,
>>>>>> +        .data_lanes = 2,
>>>>>> +    },
>>>>>> +    {
>>>>>> +        .width = 1640,
>>>>>> +        .height = 1232,
>>>>>> +        .hts = 3168,
>>>>>> +        .vts_def = 1514,
>>>>>> +        .vts_min = 1514,
>>>>>> +        .reg_list = {
>>>>>> +            .num_of_regs =
>>>>>> +            ARRAY_SIZE(lane_2_mode_1640x1232),
>>>>>> +            .regs = lane_2_mode_1640x1232,
>>>>>> +        },
>>>>>> +        .link_freq_index = 1,
>>>>>> +        .data_lanes = 2,
>>>>>> +    }}
>>>>>>      };
>>>>>>
>>>>>> -static u64 to_pixel_rate(u32 f_index)
>>>>>> +static const struct ov8856_lane_cfg lane_cfg_4 = {
>>>>>> +        {
>>>>>> +            360000000,
>>>>>> +            180000000,
>>>>>> +        },
>>>>>> +        {{
>>>>>> +            .reg_list = {
>>>>>> +                .num_of_regs =
>>>>>> +                 ARRAY_SIZE(mipi_data_rate_lane_4.regs_0),
>>>>>> +                .regs = mipi_data_rate_lane_4.regs_0,
>>>>>> +            }
>>>>>> +        },
>>>>>> +        {
>>>>>> +            .reg_list = {
>>>>>> +                .num_of_regs =
>>>>>> +                 ARRAY_SIZE(mipi_data_rate_lane_4.regs_1),
>>>>>> +                .regs = mipi_data_rate_lane_4.regs_1,
>>>>>> +            }
>>>>>> +        }},
>>>>>> +        {{
>>>>>> +            .width = 3280,
>>>>>> +            .height = 2464,
>>>>>> +            .hts = 1928,
>>>>>> +            .vts_def = 2488,
>>>>>> +            .vts_min = 2488,
>>>>>> +            .reg_list = {
>>>>>> +                .num_of_regs =
>>>>>> +                 ARRAY_SIZE(lane_4_mode_3280x2464),
>>>>>> +                .regs = lane_4_mode_3280x2464,
>>>>>> +            },
>>>>>> +            .link_freq_index = 0,
>>>>>> +            .data_lanes = 4,
>>>>>> +        },
>>>>>> +        {
>>>>>> +            .width = 1640,
>>>>>> +            .height = 1232,
>>>>>> +            .hts = 3820,
>>>>>> +            .vts_def = 1256,
>>>>>> +            .vts_min = 1256,
>>>>>> +            .reg_list = {
>>>>>> +                .num_of_regs =
>>>>>> +                 ARRAY_SIZE(lane_4_mode_1640x1232),
>>>>>> +                .regs = lane_4_mode_1640x1232,
>>>>>> +            },
>>>>>> +            .link_freq_index = 1,
>>>>>> +            .data_lanes = 4,
>>>>>> +        },
>>>>>> +        {
>>>>>> +            .width = 3264,
>>>>>> +            .height = 2448,
>>>>>> +            .hts = 1932,
>>>>>> +            .vts_def = 2482,
>>>>>> +            .vts_min = 2482,
>>>>>> +            .reg_list = {
>>>>>> +                .num_of_regs =
>>>>>> +                 ARRAY_SIZE(lane_4_mode_3264x2448),
>>>>>> +                .regs = lane_4_mode_3264x2448,
>>>>>> +            },
>>>>>> +            .link_freq_index = 0,
>>>>>> +            .data_lanes = 4,
>>>>>> +        },
>>>>>> +        {
>>>>>> +            .width = 1632,
>>>>>> +            .height = 1224,
>>>>>> +            .hts = 1932,
>>>>>> +            .vts_def = 2482,
>>>>>> +            .vts_min = 2482,
>>>>>> +            .reg_list = {
>>>>>> +                .num_of_regs =
>>>>>> +                 ARRAY_SIZE(lane_4_mode_1632x1224),
>>>>>> +                .regs = lane_4_mode_1632x1224,
>>>>>> +            },
>>>>>> +            .link_freq_index = 1,
>>>>>> +            .data_lanes = 4,
>>>>>> +        }}
>>>>>> +};
>>>>>> +
>>>>>> +static unsigned int ov8856_modes_num(const struct ov8856 *ov8856)
>>>>>>      {
>>>>>> -    u64 pixel_rate = link_freq_menu_items[f_index] * 2 *
>>> OV8856_DATA_LANES;
>>>>>> +    unsigned int i, count = 0;
>>>>>> +
>>>>>> +    for (i = 0; i < ARRAY_SIZE(ov8856->priv_lane->supported_modes); i++) {
>>>>>> +        if (ov8856->priv_lane->supported_modes[i].width == 0)
>>>>>> +            break;
>>>>>> +        count++;
>>>>>> +    }
>>>>>> +
>>>>>> +    return count;
>>>>>> +}
>>>>>> +
>>>>>> +static u64 to_rate(const s64 *link_freq_menu_items,
>>>>>> +           u32 f_index, u8 nlanes)
>>>>>> +{
>>>>>> +    u64 pixel_rate = link_freq_menu_items[f_index] * 2 * nlanes;
>>>>>>
>>>>>>          do_div(pixel_rate, OV8856_RGB_DEPTH);
>>>>>>
>>>>>>          return pixel_rate;
>>>>>>      }
>>>>>>
>>>>>> -static u64 to_pixels_per_line(u32 hts, u32 f_index)
>>>>>> +static u64 to_pixels_per_line(const s64 *link_freq_menu_items, u32 hts,
>>>>>> +                  u32 f_index, u8 nlanes)
>>>>>>      {
>>>>>> -    u64 ppl = hts * to_pixel_rate(f_index);
>>>>>> +    u64 ppl = hts * to_rate(link_freq_menu_items, f_index, nlanes);
>>>>>>
>>>>>>          do_div(ppl, OV8856_SCLK);
>>>>>>
>>>>>> @@ -1229,23 +1728,32 @@ static int ov8856_init_controls(struct ov8856
>>> *ov8856)
>>>>>>          ctrl_hdlr->lock = &ov8856->mutex;
>>>>>>          ov8856->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr,
>>> &ov8856_ctrl_ops,
>>>>>>                             V4L2_CID_LINK_FREQ,
>>>>>> -                       ARRAY_SIZE(link_freq_menu_items) -
>>> 1,
>>>>>> -                       0, link_freq_menu_items);
>>>>>> +                       ARRAY_SIZE
>>>>>> +                       (ov8856->priv_lane-
>>>> link_freq_menu_items)
>>>>>> +                       - 1,
>>>>>> +                       0, ov8856->priv_lane-
>>>> link_freq_menu_items);
>>>>>>          if (ov8856->link_freq)
>>>>>>              ov8856->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>>>>>>
>>>>>>          ov8856->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &ov8856_ctrl_ops,
>>>>>>                             V4L2_CID_PIXEL_RATE, 0,
>>>>>> -
>>> to_pixel_rate(OV8856_LINK_FREQ_720MBPS),
>>>>>> -                       1,
>>>>>> -
>>> to_pixel_rate(OV8856_LINK_FREQ_720MBPS));
>>>>>> +                       to_rate(ov8856->priv_lane-
>>>> link_freq_menu_items,
>>>>>> +                           0,
>>>>>> +                           ov8856->cur_mode->data_lanes), 1,
>>>>>> +                       to_rate(ov8856->priv_lane-
>>>> link_freq_menu_items,
>>>>>> +                           0,
>>>>>> +                           ov8856->cur_mode->data_lanes));
>>>>>>          ov8856->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &ov8856_ctrl_ops,
>>>>>>                    V4L2_CID_VBLANK,
>>>>>>                    ov8856->cur_mode->vts_min - ov8856->cur_mode-
>>>> height,
>>>>>>                    OV8856_VTS_MAX - ov8856->cur_mode->height, 1,
>>>>>> -              ov8856->cur_mode->vts_def - ov8856->cur_mode-
>>>> height);
>>>>>> -    h_blank = to_pixels_per_line(ov8856->cur_mode->hts,
>>>>>> -          ov8856->cur_mode->link_freq_index) - ov8856->cur_mode-
>>>> width;
>>>>>> +              ov8856->cur_mode->vts_def -
>>>>>> +              ov8856->cur_mode->height);
>>>>>> +    h_blank = to_pixels_per_line(ov8856->priv_lane->link_freq_menu_items,
>>>>>> +                     ov8856->cur_mode->hts,
>>>>>> +                     ov8856->cur_mode->link_freq_index,
>>>>>> +                     ov8856->cur_mode->data_lanes) -
>>>>>> +                     ov8856->cur_mode->width;
>>>>>>          ov8856->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &ov8856_ctrl_ops,
>>>>>>                             V4L2_CID_HBLANK, h_blank, h_blank,
>>> 1,
>>>>>>                             h_blank);
>>>>>> @@ -1292,7 +1800,8 @@ static int ov8856_start_streaming(struct ov8856
>>> *ov8856)
>>>>>>          int link_freq_index, ret;
>>>>>>
>>>>>>          link_freq_index = ov8856->cur_mode->link_freq_index;
>>>>>> -    reg_list = &link_freq_configs[link_freq_index].reg_list;
>>>>>> +    reg_list = &ov8856->priv_lane-
>>>> link_freq_configs[link_freq_index].reg_list;
>>>>>> +
>>>>>>          ret = ov8856_write_reg_list(ov8856, reg_list);
>>>>>>          if (ret) {
>>>>>>              dev_err(&client->dev, "failed to set plls");
>>>>>> @@ -1462,9 +1971,9 @@ static int ov8856_set_format(struct v4l2_subdev
>>> *sd,
>>>>>>          const struct ov8856_mode *mode;
>>>>>>          s32 vblank_def, h_blank;
>>>>>>
>>>>>> -    mode = v4l2_find_nearest_size(supported_modes,
>>>>>> -                      ARRAY_SIZE(supported_modes), width,
>>>>>> -                      height, fmt->format.width,
>>>>>> +    mode = v4l2_find_nearest_size(ov8856->priv_lane->supported_modes,
>>>>>> +                      ov8856->modes_size,
>>>>>> +                      width, height, fmt->format.width,
>>>>>>                            fmt->format.height);
>>>>>>
>>>>>>          mutex_lock(&ov8856->mutex);
>>>>>> @@ -1475,7 +1984,9 @@ static int ov8856_set_format(struct v4l2_subdev
>>> *sd,
>>>>>>              ov8856->cur_mode = mode;
>>>>>>              __v4l2_ctrl_s_ctrl(ov8856->link_freq, mode->link_freq_index);
>>>>>>              __v4l2_ctrl_s_ctrl_int64(ov8856->pixel_rate,
>>>>>> -                     to_pixel_rate(mode->link_freq_index));
>>>>>> +                     to_rate(ov8856->priv_lane-
>>>> link_freq_menu_items,
>>>>>> +                         mode->link_freq_index,
>>>>>> +                         ov8856->cur_mode-
>>>> data_lanes));
>>>>>>
>>>>>>              /* Update limits and set FPS to default */
>>>>>>              vblank_def = mode->vts_def - mode->height;
>>>>>> @@ -1484,8 +1995,11 @@ static int ov8856_set_format(struct v4l2_subdev
>>> *sd,
>>>>>>                           OV8856_VTS_MAX - mode->height, 1,
>>>>>>                           vblank_def);
>>>>>>              __v4l2_ctrl_s_ctrl(ov8856->vblank, vblank_def);
>>>>>> -        h_blank = to_pixels_per_line(mode->hts, mode->link_freq_index)
>>> -
>>>>>> -              mode->width;
>>>>>> +        h_blank = to_pixels_per_line(ov8856->priv_lane-
>>>> link_freq_menu_items,
>>>>>> +                         mode->hts,
>>>>>> +                         mode->link_freq_index,
>>>>>> +                         ov8856->cur_mode->data_lanes)
>>>>>> +                         - mode->width;
>>>>>>              __v4l2_ctrl_modify_range(ov8856->hblank, h_blank, h_blank, 1,
>>>>>>                           h_blank);
>>>>>>          }
>>>>>> @@ -1530,15 +2044,17 @@ static int ov8856_enum_frame_size(struct
>>> v4l2_subdev *sd,
>>>>>>                        struct v4l2_subdev_pad_config *cfg,
>>>>>>                        struct v4l2_subdev_frame_size_enum *fse)
>>>>>>      {
>>>>>> -    if (fse->index >= ARRAY_SIZE(supported_modes))
>>>>>> +    struct ov8856 *ov8856 = to_ov8856(sd);
>>>>>> +
>>>>>> +    if (fse->index >= ov8856->modes_size)
>>>>>>              return -EINVAL;
>>>>>>
>>>>>>          if (fse->code != MEDIA_BUS_FMT_SGRBG10_1X10)
>>>>>>              return -EINVAL;
>>>>>>
>>>>>> -    fse->min_width = supported_modes[fse->index].width;
>>>>>> +    fse->min_width = ov8856->priv_lane->supported_modes[fse-
>>>> index].width;
>>>>>>          fse->max_width = fse->min_width;
>>>>>> -    fse->min_height = supported_modes[fse->index].height;
>>>>>> +    fse->min_height = ov8856->priv_lane->supported_modes[fse-
>>>> index].height;
>>>>>>          fse->max_height = fse->min_height;
>>>>>>
>>>>>>          return 0;
>>>>>> @@ -1549,7 +2065,7 @@ static int ov8856_open(struct v4l2_subdev *sd,
>>> struct v4l2_subdev_fh *fh)
>>>>>>          struct ov8856 *ov8856 = to_ov8856(sd);
>>>>>>
>>>>>>          mutex_lock(&ov8856->mutex);
>>>>>> -    ov8856_update_pad_format(&supported_modes[0],
>>>>>> +    ov8856_update_pad_format(&ov8856->priv_lane->supported_modes[0],
>>>>>>                       v4l2_subdev_get_try_format(sd, fh->pad, 0));
>>>>>>          mutex_unlock(&ov8856->mutex);
>>>>>>
>>>>>> @@ -1696,29 +2212,40 @@ static int ov8856_get_hwcfg(struct ov8856
>>> *ov8856, struct device *dev)
>>>>>>          if (ret)
>>>>>>              return ret;
>>>>>>
>>>>>> -    if (bus_cfg.bus.mipi_csi2.num_data_lanes != OV8856_DATA_LANES) {
>>>>>> +    /* Get number of data lanes */
>>>>>> +    if (bus_cfg.bus.mipi_csi2.num_data_lanes != 2 &&
>>>>>> +        bus_cfg.bus.mipi_csi2.num_data_lanes != 4) {
>>>>>>              dev_err(dev, "number of CSI2 data lanes %d is not supported",
>>>>>>                  bus_cfg.bus.mipi_csi2.num_data_lanes);
>>>>>>              ret = -EINVAL;
>>>>>>              goto check_hwcfg_error;
>>>>>>          }
>>>>>>
>>>>>> +    dev_dbg(dev, "Using %u data lanes\n", ov8856->cur_mode->data_lanes);
>>>>>> +
>>>>>> +    if (bus_cfg.bus.mipi_csi2.num_data_lanes == 2)
>>>>>> +        ov8856->priv_lane = &lane_cfg_2;
>>>>>> +    else
>>>>>> +        ov8856->priv_lane = &lane_cfg_4;
>>>>>> +
>>>>>> +    ov8856->modes_size = ov8856_modes_num(ov8856);
>>>>>> +
>>>>>>          if (!bus_cfg.nr_of_link_frequencies) {
>>>>>>              dev_err(dev, "no link frequencies defined");
>>>>>>              ret = -EINVAL;
>>>>>>              goto check_hwcfg_error;
>>>>>>          }
>>>>>>
>>>>>> -    for (i = 0; i < ARRAY_SIZE(link_freq_menu_items); i++) {
>>>>>> +    for (i = 0; i < ARRAY_SIZE(ov8856->priv_lane->link_freq_menu_items);
>>> i++) {
>>>>>>              for (j = 0; j < bus_cfg.nr_of_link_frequencies; j++) {
>>>>>> -            if (link_freq_menu_items[i] ==
>>>>>> -                bus_cfg.link_frequencies[j])
>>>>>> +            if (ov8856->priv_lane->link_freq_menu_items[i] ==
>>>>>> +                bus_cfg.link_frequencies[j])
>>>>>>                      break;
>>>>>>              }
>>>>>>
>>>>>>              if (j == bus_cfg.nr_of_link_frequencies) {
>>>>>>                  dev_err(dev, "no link frequency %lld supported",
>>>>>> -                link_freq_menu_items[i]);
>>>>>> +                ov8856->priv_lane->link_freq_menu_items[i]);
>>>>>>                  ret = -EINVAL;
>>>>>>                  goto check_hwcfg_error;
>>>>>>              }
>>>>>> @@ -1777,7 +2304,7 @@ static int ov8856_probe(struct i2c_client *client)
>>>>>>          }
>>>>>>
>>>>>>          mutex_init(&ov8856->mutex);
>>>>>> -    ov8856->cur_mode = &supported_modes[0];
>>>>>> +    ov8856->cur_mode = &ov8856->priv_lane->supported_modes[0];
>>>>>>          ret = ov8856_init_controls(ov8856);
>>>>>>          if (ret) {
>>>>>>              dev_err(&client->dev, "failed to init controls: %d", ret);
>>>>>>
