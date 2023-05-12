Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BFEB70078A
	for <lists+linux-media@lfdr.de>; Fri, 12 May 2023 14:20:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240607AbjELMUc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 May 2023 08:20:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240338AbjELMU3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 May 2023 08:20:29 -0400
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20711.outbound.protection.outlook.com [IPv6:2a01:111:f403:704b::711])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 164407DA2
        for <linux-media@vger.kernel.org>; Fri, 12 May 2023 05:19:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DlZlmy/BWizPSNW6ScfZXXslcHQ/9JTOkQ8mXVyUQ5+EAQ+WUN+2eGpDOpLvm/Lnwc44ZrJu0yxbL3pqZNjxnd/4RzQkrqdZLbSVNyRwAobQxyWLvlxh3GHVgE1fB74YreGsq4VPs0Ms12irAJVqidSMvSG5ZcVyQfwif1J2rMdIj1OUjNxAnvUIRyQbYRLlp/IP5A8mKq9qwuQudjOqX8lQBzQLT4aKQ+IiyNjCkNtvpYxLppIkKE03kO/iy3+nZyLEmaRUh7Y1J4BJRQx5oYpJHUG+ddNk3VilGmUTdnCJhPsv6AZyCX18OwX1/25xOvoZVoTGhrODtcSbAUQ1xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dzb96zEL4ql44vkE/KlUwmKutNA4cv6+cI8JIlKyRlc=;
 b=Czn3ylTokMIYeuF910MFCv+o6zVepLfk8XUZ+ZIgghLlVXcA+eOD3+eKcdXZxExfap4teOtrXoOsHn6ZCYkpNHcPbomanmVAy6G6qTYW2w2rQxh+eX05bXz82qbMykpG7kqZwKeoOINZd+qf1aJBetpcP5jF9FX9zGw0gOChEjkicKsy7kK/H2Bp15KbptpolpVfag6UDliYAb+S2HW+r1/2xH4AVOfVOIx5ZON7NXGxVk46GHjkCvJr6EqHJbDxP/9oBuz/pWDP5LGTELrHQx7ud5tbjFm9z8v73jXz4ZZE2KxF6tzYcMNgXTn3XA31orf2phH7+nsXuSpAl0Yx2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dzb96zEL4ql44vkE/KlUwmKutNA4cv6+cI8JIlKyRlc=;
 b=DWX4eNDpP73WG6NPKpS1gWdXU0ncViId0t7dpifOjf5hGhTRhBepYLCj4sH3HPx9YEqoiK6Ri6ZkLbaUA66565xg+Yuh/e3z3JOoyIsRBl+wgqAHe5yiuWP3CtLvGSiSZKwQk2V7MeA42QfN6r/vkDrOPsu0+189crySRwu9rNc5OGBeI86E5CJP1phh10IupykqkuzRKO4/OkXWGH7X3E40qTbXwEYGTNt9bH88EWsesoJh+U8PUJXqx5yLl5dM+5wRsXw7ch18W301qSsRj6zaP5OPmWRDNY4uaA2cvhGPxs3hZATHj4nUYjGOBff9izyemeiDqBNi9Y1cbYzbnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from SG2PR03MB5085.apcprd03.prod.outlook.com (2603:1096:4:ae::22) by
 SEYPR03MB7779.apcprd03.prod.outlook.com (2603:1096:101:139::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6387.21; Fri, 12 May 2023 12:19:35 +0000
Received: from SG2PR03MB5085.apcprd03.prod.outlook.com
 ([fe80::e773:48e1:2124:a436]) by SG2PR03MB5085.apcprd03.prod.outlook.com
 ([fe80::e773:48e1:2124:a436%4]) with mapi id 15.20.6363.033; Fri, 12 May 2023
 12:19:35 +0000
Message-ID: <712e2962-073a-b6c2-8f58-d1ceffdc77d2@amlogic.com>
Date:   Fri, 12 May 2023 20:19:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] media: rc: meson-ir: support MMIO regmaps to access
 registers
To:     neil.armstrong@linaro.org, Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        Qianggui.Song@amlogic.com, Yonghui.Yu@amlogic.com,
        kelvin.zhang@amlogic.com
References: <20230511034333.26800-1-zelong.dong@amlogic.com>
 <62dd9a2f-6417-746c-0c8b-7424bda9e151@linaro.org>
From:   Zelong Dong <Zelong.Dong@amlogic.com>
In-Reply-To: <62dd9a2f-6417-746c-0c8b-7424bda9e151@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TY2PR02CA0005.apcprd02.prod.outlook.com
 (2603:1096:404:56::17) To SG2PR03MB5085.apcprd03.prod.outlook.com
 (2603:1096:4:ae::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PR03MB5085:EE_|SEYPR03MB7779:EE_
X-MS-Office365-Filtering-Correlation-Id: e223a093-57dc-44d3-e98b-08db52e32575
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C9Q3ac7rwIDBaRwV2Aj1z8i8bYOs45fzNLiydGmCLnKKJv/7sTFRrtXH3E+df8qMUAIeHp1Qt2JBNF6lsqZtRxHb0z9cxX+4hvw1l4DGalucqWhYxkt0zXIkbksAPi1k3zrq8TeDmLwcM+/mB+yHg/XrM6leXu2NhTMOrQmIYYby8oEU+NW8rTMmV/k2uVhjJZSjv1RX+hTP3u8SyYBUfx4DUsocWhCLpd9Zaqcu8byfRoyarpOygFFkvpGqYcqF5J/sEDKT4BxyHZ8wnZ1fJlupoxn/SfN3qjJRnHbV++2vF6vzUQ1VRsWYTnBmMX8YRgBH1M/gjLkHFIlNyxQmHihOww6go6WW0zzK6c/IV2Z8cfgX+S4VhNFzLjrrT2zEaNX965UcozLjUZyY9Wv1rif3Yxshs2l2gQe1AZoyEuqZrXmFWa5B86uBsUREUnVndy85riuZxpTQn+6VPoGQy4d5yg5QdqAS8MRKPPDqe5lJIUKbl+9qcAQ1JXt3taAFHdteoiq6zidIB8W3BluJ0owDWnnsMCr2zEUc+kHInpTvRj3KZCBA7goPKJfGe9xbMLisWbD58qo+wmDi2WYJTD8jHTP47rI2IPqNthh0o6vlvV0KLb6lxpmsI/+XQIFaRoRTLMow/9klD5M5Kc/jrf4O6bNmwNyJ+u72E+3T0YclGz2G0V0bT+IPCs5r0Bjc
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR03MB5085.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39850400004)(136003)(396003)(366004)(376002)(451199021)(36756003)(8936002)(8676002)(41300700001)(316002)(5660300002)(6666004)(6486002)(2616005)(966005)(66476007)(66946007)(66556008)(38100700002)(31696002)(4326008)(31686004)(2906002)(110136005)(86362001)(478600001)(83380400001)(107886003)(26005)(6506007)(53546011)(6512007)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2Z5cjM5ZGxIZzZzRE1uTnkxY1habGNEZXVuRmI0Y3gydjlWSE8vbnN6bnpm?=
 =?utf-8?B?RzQxUXplM0FpQnVSYUdpQ3MyU3JEQS85c2QxeEJ3M29kQmRwNU9FS3dCRTJ6?=
 =?utf-8?B?b2pJZThZdXcxcW9DTnR1djV0UXZ6eWtVZldnN2k1UXBpL01Zb3FqeVRkb2lQ?=
 =?utf-8?B?SUtkRnZwcWdWays0Um93MUdURXp5RnB5Yjl5N1NEa0FwOU51dDI4NGxSb3JI?=
 =?utf-8?B?RENheXBnZmloSUVvT2lNV2FYK2RIMTJiK2hsNzB1UWJEdXcvYkdiN0JFOVBy?=
 =?utf-8?B?M3VacENncUNBZVpRQzhXNHF2Mzl0U2NMTCtSSkd0OEFFVUFnb0EySEdWeFRR?=
 =?utf-8?B?NXFJeTFzem5aN0dRNTZmQ1plWnRnT3R6RTl2d0VLTFNKK1M0UlBpSVVtSHZp?=
 =?utf-8?B?dUJKMFhSOFlnNmdTcy8zWU9TdVQ2SUJLaUFGYzc5d3lBSmQ0QWhmbFY0ZnI5?=
 =?utf-8?B?VlZ1RlpLdHRGall0b2tNZlpXazNqY3lKeWpiSGpxN3hPMk95eVoxQWNjRCtV?=
 =?utf-8?B?Mm96aHNGS3VEK1ZyTWFLa2pZOU9DUFA3cml1eENIcnpENlIrV2Q2Z2VuVi84?=
 =?utf-8?B?TFQ0OHdKSGlRaHBlbjFYYWJYcTBmKys0a1pGSjBLYjFvN3gzSEx1VExYK1Ur?=
 =?utf-8?B?U1B3VnBPVGxsNUNqWFVvRkZjYnMxdW96MitvRjdhSWJuckVheVlYZ01MZ2dB?=
 =?utf-8?B?T0pLQU1FRjJiS3hCcEFJbTFGUElQZmhUR3V1aW15b05NSTVXNy94dGR3TFE3?=
 =?utf-8?B?TEtocEg5aVFGelRpWEtkTFlvUHh4enkxbmY2cnFBdWNmR2tOSnhPYmJ5MHUw?=
 =?utf-8?B?TFQwWW82Nng5RXdVRWJhVUozTm4yNllVMjNRM1A2Z1UwSVZpdlhnUnBCZnp0?=
 =?utf-8?B?RlhyRzZUVWEwZHBJbzExa2g0OUhKYWZDYVB4eHpnNXY4Q1FNczFzMWxqaGI5?=
 =?utf-8?B?RXNmUmZkdmxkQ0g5Tnd3YVpNMUdTUHFuRnNxRi9Mc29QbmwrZE9sQWlxZ3Uz?=
 =?utf-8?B?ZGxWNUFLbElYV1RZaUcyN2ZJTjZheHZTL1poM09HejBDRFpPdjdVcm82REdN?=
 =?utf-8?B?WTk5YjF5dzU3bGNFRW05NlQ2SkpGN21PM2h2RmRYMmhsakxtaUE1b2xCY1VZ?=
 =?utf-8?B?QjhJZEZPQXJQOC9zMkYza3lFYmxxb1NxdWJPM1NpUDJ3MU93Sk05b3ZEVTVQ?=
 =?utf-8?B?UnFnaVRlcU16NVczb3A2Vnl4bDNtN3FWc1lOSUpzWXhBOXBJa0tEUE1jNWp3?=
 =?utf-8?B?TkM3eTBqLzIyeitZT2R6QUtveGhoRnNzb1NLVlk1TEFHQXBHWGFZeWV2Ni9I?=
 =?utf-8?B?T1ZlYWVoeEZYdTk5L2FRRnoyVHI4UndpL2NLdEdMQTBtWDdsUWJVMWNSZEZI?=
 =?utf-8?B?Sk9ZNDZsWFZ1VTVraDFXdnBtNFoxRXV0Ly9FMDU1MEQweTlwWDZaZVZHd0R1?=
 =?utf-8?B?VkRkbW10Z09NM2xDNE8rY25udHlvNzMzVm8vc2RVZ0hGazZ5czRabDlmc2xt?=
 =?utf-8?B?b0txdFJITHl6aWtFamR5T1lBUXRKTURiRWlTNm1lS0RXelR5cjE4MjBmdHVY?=
 =?utf-8?B?MVdPMER6SW0vYnNlbk0vc3lmZk5Kb1IranlsczI0WWxJQkdRdFhTUk5sMjZv?=
 =?utf-8?B?V1JPRXlzSEFQNis0N3pRdzNUbzBIWDVYdHN2L2JzTkMzY0NVeUUzQno4N2Nu?=
 =?utf-8?B?Z25KSTlYa1dGTzlGU3FqeE0vWGtJL28zc0Y0eDUrcWw5dHp4K1k1TmRJVk9M?=
 =?utf-8?B?RTRreURVQ0lhcHRpTytuMlhTajV2bm5zNks2UjJsZEhybVpQT0tJdVRYcCtG?=
 =?utf-8?B?RmI0UE1sa0lWVkN6MVR0amsvUEt0OE5GNENEWjJLZHF3ZDNSTUZURzJlMUZk?=
 =?utf-8?B?T3N1Z3ZwYjVkMVcyelVIKzVxd2JTbUx4dDI0MWRveXBWbzVxL25RVFU2TWdT?=
 =?utf-8?B?R0dTSFNvZHB2V2RLQ0lxQmhFVjl2N1RwNis2TGRBYnRhNGZXcDNtbzlHTWpu?=
 =?utf-8?B?QnZ4bysvMXJxZmwzb2JaZ2UyNmdRWnpxd0NFVkxWQWdUWXlnY0lBcEMvb3A1?=
 =?utf-8?B?NU1mWEM3U1lDc0t3cEpXNGpaOWcvaU5zaXVjY1loNkU5bStJQjdqQit4RzhD?=
 =?utf-8?Q?duPQa4elOr+ncn/bfb7GL4Znn?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e223a093-57dc-44d3-e98b-08db52e32575
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB5085.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2023 12:19:34.7443
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1DTyn2cqcwjeNO/NJKrVKHAVs4RhdIwxH97D+iz98FmsA1ifJej6MSH0DhSA+MNVMW2V2pPPkrJGcZJ3I6pPvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7779
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks for your review.

在 2023/5/11 16:31, Neil Armstrong 写道:
> [你通常不会收到来自 neil.armstrong@linaro.org 的电子邮件。请访问 
> https://aka.ms/LearnAboutSenderIdentification，以了解这一点为什么很重要]
> 
> [ EXTERNAL EMAIL ]
> 
> Hi,
> 
> Thanks for splitting the regmap conversion in a separate change.
> 
> On 11/05/2023 05:43, zelong dong wrote:
>> From: Zelong Dong <zelong.dong@amlogic.com>
>>
>> Supports MMIO regmaps to access controller registers in Meson IR driver.
>> And rename register macro for identify more clearly. >
>> Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
>> ---
>>   drivers/media/rc/meson-ir.c | 128 ++++++++++++++++++++----------------
>>   1 file changed, 70 insertions(+), 58 deletions(-)
>>
>> diff --git a/drivers/media/rc/meson-ir.c b/drivers/media/rc/meson-ir.c
>> index 4b769111f78e..045d78f0862c 100644
>> --- a/drivers/media/rc/meson-ir.c
>> +++ b/drivers/media/rc/meson-ir.c
>> @@ -14,6 +14,7 @@
>>   #include <linux/platform_device.h>
>>   #include <linux/spinlock.h>
>>   #include <linux/bitfield.h>
>> +#include <linux/regmap.h>
>>
>>   #include <media/rc-core.h>
>>
>> @@ -24,57 +25,50 @@
>>   #define IR_DEC_LDR_IDLE             0x04
>>   #define IR_DEC_LDR_REPEAT   0x08
>>   #define IR_DEC_BIT_0                0x0c
>> +
> 
> Please move the cleanup/renames to a separate patch
> 
>>   #define IR_DEC_REG0         0x10
>> -#define IR_DEC_FRAME         0x14
>> -#define IR_DEC_STATUS                0x18
>> -#define IR_DEC_REG1          0x1c
>> -/* only available on Meson 8b and newer */
>> -#define IR_DEC_REG2          0x20
>> +#define IR_DEC_REG0_BASE_TIME        GENMASK(11, 0)
>>
>> -#define REG0_RATE_MASK               GENMASK(11, 0)
>> +#define IR_DEC_FRAME         0x14
>>
>> -#define DECODE_MODE_NEC              0x0
>> -#define DECODE_MODE_RAW              0x2
>> +#define IR_DEC_STATUS                0x18
>> +#define IR_DEC_STATUS_PULSE  BIT(8)
>>
>> +#define IR_DEC_REG1          0x1c
>> +#define IR_DEC_REG1_TIME_IV  GENMASK(28, 16)
>> +#define IR_DEC_REG1_ENABLE   BIT(15)
>>   /* Meson 6b uses REG1 to configure the mode */
>> -#define REG1_MODE_MASK               GENMASK(8, 7)
>> -#define REG1_MODE_SHIFT              7
>> +#define IR_DEC_REG1_MODE     GENMASK(8, 7)
>> +#define IR_DEC_REG1_IRQSEL   GENMASK(3, 2)
>> +#define IR_DEC_REG1_RESET    BIT(0)
>>
>> +/* only available on Meson 8b and newer */
> 
> Same, please move new comments/cleanup/renames to a separate patch.

OK, and can I append more register macros?
These macros are unused in this patchset, but they should be used in 
next patchset about HW IR decoder.

> 
>> +#define IR_DEC_REG2          0x20
>>   /* Meson 8b / GXBB use REG2 to configure the mode */
>> -#define REG2_MODE_MASK               GENMASK(3, 0)
>> -#define REG2_MODE_SHIFT              0
>> -
>> -#define REG1_TIME_IV_MASK    GENMASK(28, 16)
>> -
>> -#define REG1_IRQSEL_MASK     GENMASK(3, 2)
>> -#define REG1_IRQSEL_NEC_MODE 0
>> -#define REG1_IRQSEL_RISE_FALL        1
>> -#define REG1_IRQSEL_FALL     2
>> -#define REG1_IRQSEL_RISE     3
>> +#define IR_DEC_REG2_MODE     GENMASK(3, 0)
>>
>> -#define REG1_RESET           BIT(0)
>> -#define REG1_ENABLE          BIT(15)
>> +#define DEC_MODE_NEC         0x0
>> +#define DEC_MODE_RAW         0x2
>>
>> -#define STATUS_IR_DEC_IN     BIT(8)
>> +#define IRQSEL_NEC_MODE              0
>> +#define IRQSEL_RISE_FALL     1
>> +#define IRQSEL_FALL          2
>> +#define IRQSEL_RISE          3
>>
>> -#define MESON_TRATE          10      /* us */
>> +#define MESON_RAW_TRATE              10      /* us */
>> +#define MESON_HW_TRATE               20      /* us */
>>
>>   struct meson_ir {
>> -     void __iomem    *reg;
>> +     struct regmap   *reg;
>>       struct rc_dev   *rc;
>>       spinlock_t      lock;
>>   };
>>
>> -static void meson_ir_set_mask(struct meson_ir *ir, unsigned int reg,
>> -                           u32 mask, u32 value)
>> -{
>> -     u32 data;
>> -
>> -     data = readl(ir->reg + reg);
>> -     data &= ~mask;
>> -     data |= (value & mask);
>> -     writel(data, ir->reg + reg);
>> -}
>> +static struct regmap_config meson_ir_regmap_config = {
>> +     .reg_bits = 32,
>> +     .val_bits = 32,
>> +     .reg_stride = 4,
>> +};
>>
>>   static irqreturn_t meson_ir_irq(int irqno, void *dev_id)
>>   {
>> @@ -84,12 +78,12 @@ static irqreturn_t meson_ir_irq(int irqno, void 
>> *dev_id)
>>
>>       spin_lock(&ir->lock);
>>
>> -     duration = readl_relaxed(ir->reg + IR_DEC_REG1);
>> -     duration = FIELD_GET(REG1_TIME_IV_MASK, duration);
>> -     rawir.duration = duration * MESON_TRATE;
>> +     regmap_read(ir->reg, IR_DEC_REG1, &duration);
>> +     duration = FIELD_GET(IR_DEC_REG1_TIME_IV, duration);
>> +     rawir.duration = duration * MESON_RAW_TRATE;
>>
>> -     status = readl_relaxed(ir->reg + IR_DEC_STATUS);
>> -     rawir.pulse = !!(status & STATUS_IR_DEC_IN);
>> +     regmap_read(ir->reg, IR_DEC_STATUS, &status);
>> +     rawir.pulse = !!(status & IR_DEC_STATUS_PULSE);
>>
>>       ir_raw_event_store_with_timeout(ir->rc, &rawir);
>>
>> @@ -102,6 +96,8 @@ static int meson_ir_probe(struct platform_device 
>> *pdev)
>>   {
>>       struct device *dev = &pdev->dev;
>>       struct device_node *node = dev->of_node;
>> +     struct resource *res;
>> +     void __iomem *res_start;
>>       const char *map_name;
>>       struct meson_ir *ir;
>>       int irq, ret;
>> @@ -110,7 +106,17 @@ static int meson_ir_probe(struct platform_device 
>> *pdev)
>>       if (!ir)
>>               return -ENOMEM;
>>
>> -     ir->reg = devm_platform_ioremap_resource(pdev, 0);
>> +     res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +     if (IS_ERR_OR_NULL(res)) {
>> +             dev_err(&pdev->dev, "get mem resource error, %ld\n",
>> +                     PTR_ERR(res));
>> +             return PTR_ERR(res);
>> +     }
>> +
>> +     res_start = devm_ioremap_resource(&pdev->dev, res);
> 
> Use devm_platform_ioremap_resource() instead

OK.

> 
>> +     meson_ir_regmap_config.max_register = resource_size(res) - 4;
>> +     ir->reg = devm_regmap_init_mmio(&pdev->dev, res_start,
>> +                                     &meson_ir_regmap_config);
>>       if (IS_ERR(ir->reg))
>>               return PTR_ERR(ir->reg);
>>
>> @@ -131,7 +137,7 @@ static int meson_ir_probe(struct platform_device 
>> *pdev)
>>       map_name = of_get_property(node, "linux,rc-map-name", NULL);
>>       ir->rc->map_name = map_name ? map_name : RC_MAP_EMPTY;
>>       ir->rc->allowed_protocols = RC_PROTO_BIT_ALL_IR_DECODER;
>> -     ir->rc->rx_resolution = MESON_TRATE;
>> +     ir->rc->rx_resolution = MESON_RAW_TRATE;
> 
> This should go in a separate patch with a Fixes tag

Why it need to be with a Fixes tag?
MESON_RAW_TRATE is same as MESON_TRATE, I rename it for distinguish HW 
and SW decoder timing resolution.
MESON_HW_TRATE is 0x13, which was used in the nether modification.

> 
>>       ir->rc->min_timeout = 1;
>>       ir->rc->timeout = IR_DEFAULT_TIMEOUT;
>>       ir->rc->max_timeout = 10 * IR_DEFAULT_TIMEOUT;
>> @@ -153,24 +159,28 @@ static int meson_ir_probe(struct platform_device 
>> *pdev)
>>       }
>>
>>       /* Reset the decoder */
>> -     meson_ir_set_mask(ir, IR_DEC_REG1, REG1_RESET, REG1_RESET);
>> -     meson_ir_set_mask(ir, IR_DEC_REG1, REG1_RESET, 0);
>> +     regmap_update_bits(ir->reg, IR_DEC_REG1, IR_DEC_REG1_RESET,
>> +                        IR_DEC_REG1_RESET);
>> +     regmap_update_bits(ir->reg, IR_DEC_REG1, IR_DEC_REG1_RESET, 0);
>>
>>       /* Set general operation mode (= raw/software decoding) */
>>       if (of_device_is_compatible(node, "amlogic,meson6-ir"))
>> -             meson_ir_set_mask(ir, IR_DEC_REG1, REG1_MODE_MASK,
>> -                               FIELD_PREP(REG1_MODE_MASK, 
>> DECODE_MODE_RAW));
>> +             regmap_update_bits(ir->reg, IR_DEC_REG1, IR_DEC_REG1_MODE,
>> +                                FIELD_PREP(IR_DEC_REG1_MODE, 
>> DEC_MODE_RAW));
>>       else
>> -             meson_ir_set_mask(ir, IR_DEC_REG2, REG2_MODE_MASK,
>> -                               FIELD_PREP(REG2_MODE_MASK, 
>> DECODE_MODE_RAW));
>> +             regmap_update_bits(ir->reg, IR_DEC_REG2, IR_DEC_REG2_MODE,
>> +                                FIELD_PREP(IR_DEC_REG2_MODE, 
>> DEC_MODE_RAW));
>>
>>       /* Set rate */
>> -     meson_ir_set_mask(ir, IR_DEC_REG0, REG0_RATE_MASK, MESON_TRATE - 
>> 1);
>> +     regmap_update_bits(ir->reg, IR_DEC_REG0, IR_DEC_REG0_BASE_TIME,
>> +                        FIELD_PREP(IR_DEC_REG0_BASE_TIME,
>> +                                   MESON_RAW_TRATE - 1));
>>       /* IRQ on rising and falling edges */
>> -     meson_ir_set_mask(ir, IR_DEC_REG1, REG1_IRQSEL_MASK,
>> -                       FIELD_PREP(REG1_IRQSEL_MASK, 
>> REG1_IRQSEL_RISE_FALL));
>> +     regmap_update_bits(ir->reg, IR_DEC_REG1, IR_DEC_REG1_IRQSEL,
>> +                        FIELD_PREP(IR_DEC_REG1_IRQSEL, 
>> IRQSEL_RISE_FALL));
>>       /* Enable the decoder */
>> -     meson_ir_set_mask(ir, IR_DEC_REG1, REG1_ENABLE, REG1_ENABLE);
>> +     regmap_update_bits(ir->reg, IR_DEC_REG1, IR_DEC_REG1_ENABLE,
>> +                        IR_DEC_REG1_ENABLE);
>>
>>       dev_info(dev, "receiver initialized\n");
>>
>> @@ -184,7 +194,7 @@ static int meson_ir_remove(struct platform_device 
>> *pdev)
>>
>>       /* Disable the decoder */
>>       spin_lock_irqsave(&ir->lock, flags);
>> -     meson_ir_set_mask(ir, IR_DEC_REG1, REG1_ENABLE, 0);
>> +     regmap_update_bits(ir->reg, IR_DEC_REG1, IR_DEC_REG1_ENABLE, 0);
>>       spin_unlock_irqrestore(&ir->lock, flags);
>>
>>       return 0;
>> @@ -204,14 +214,16 @@ static void meson_ir_shutdown(struct 
>> platform_device *pdev)
>>        * bootloader a chance to power the system back on
>>        */
>>       if (of_device_is_compatible(node, "amlogic,meson6-ir"))
>> -             meson_ir_set_mask(ir, IR_DEC_REG1, REG1_MODE_MASK,
>> -                               DECODE_MODE_NEC << REG1_MODE_SHIFT);
>> +             regmap_update_bits(ir->reg, IR_DEC_REG1, IR_DEC_REG1_MODE,
>> +                                FIELD_PREP(IR_DEC_REG1_MODE, 
>> DEC_MODE_NEC));
>>       else
>> -             meson_ir_set_mask(ir, IR_DEC_REG2, REG2_MODE_MASK,
>> -                               DECODE_MODE_NEC << REG2_MODE_SHIFT);
>> +             regmap_update_bits(ir->reg, IR_DEC_REG2, IR_DEC_REG2_MODE,
>> +                                FIELD_PREP(IR_DEC_REG2_MODE, 
>> DEC_MODE_NEC));
>>
>>       /* Set rate to default value */
>> -     meson_ir_set_mask(ir, IR_DEC_REG0, REG0_RATE_MASK, 0x13);
>> +     regmap_update_bits(ir->reg, IR_DEC_REG0, IR_DEC_REG0_BASE_TIME,
>> +                        FIELD_PREP(IR_DEC_REG0_BASE_TIME,
>> +                                   MESON_HW_TRATE - 1));
>>
>>       spin_unlock_irqrestore(&ir->lock, flags);
>>   }
> 
> Thanks,
> Neil
