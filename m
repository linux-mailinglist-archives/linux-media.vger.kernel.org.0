Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D8987BC636
	for <lists+linux-media@lfdr.de>; Sat,  7 Oct 2023 10:50:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234150AbjJGIuw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 7 Oct 2023 04:50:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232558AbjJGIuv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 7 Oct 2023 04:50:51 -0400
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2124.outbound.protection.outlook.com [40.107.255.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FCCF9C;
        Sat,  7 Oct 2023 01:50:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YhoOp+U2juWFIXWyuohzmJnwgtrE9cGRW9FRoXt+MMYMN61/bUsyotekZGrLyetjGw/VgshIdDPmk++Yv1wdbGogNgnKjtofjyFdW8Wn/UKtRsqmQw0QmL9y7zJqT2ycViIhvIIW4Hj61b5crk49Jao9ZFxmZ5dGglpsCP6T2tRO8n2Z/UYCX7l/uRmV9ELx3Eb2V15a4QQwiayqXrXyuwXnVImGIfppIWsob8AG+WTJlBnFPCRHlgsXx8xI47JVesZIHSRO71b+q48lM/AP93epaNwDAn4ouwWEvBo+NcYkNax5JTAdJEkArO0zz65OFm5IUIGWYbWAk/KTWxtT5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b3NPKRvL5XrbZMFfHqGayKKpFfsRFh2JMv//rQSgt7I=;
 b=UEqt0Cy81ZbB4jkLqVRngFWTAr9k9YueEBTCT5OU0KwBm38Wv3cOtnqEcLfKfS4CHv9DNoQQYrm/KnYmgwXwL9mLZ5aqkAlKvjjfFQrV9LE4DrPiif/skogHq/ASIPLsLL4OwJ43hl/lfkGSw69WvwiBAxGZZxDA01J0ZGRTgDo12MBrOnXh6m/o5OLvN9lHlMK96zFD9gjTlVj6jzf4NeTlX4WcqBnUQRj1miB0He1o1fAyc7TYSBHo8hNbN8ZHE5l+fQ3VpbWFmoaa0VQty9tCDtM+R9CdsCifiqzRKd5f4NXPerWFfvtVBP01Gc6YvyVCPB6m4WiuLxNB3ZRbcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b3NPKRvL5XrbZMFfHqGayKKpFfsRFh2JMv//rQSgt7I=;
 b=q0I5g56ttR/grSrY+xHysSHz1uxVB2/h2HANQP9Ctirq/UC/R4zePzECum5iQRzuNfrOSavw03XgjQqtGqKWGDS5aIIeyL18wqSzDtQMNljDeNcrgtA8CoosmoAj8XEnRatR+R/AaVcaU0XENsMHNaQeLvm+el2OrKg9+v+WAEm1jg4xr8wAhBoFttVpG/rq/+Y/gGQ3FHtzt/m7Ll/HRSNk58VJy1G+0vZ4RnXacnoTrgjRTUoPefYqZsWaZrH5TzAN7rvGyKqR8nM0WpkAooFLIc9mR5niCCWrdeubyo5POwycfvBtAwXulPX5/kz3SVfFhE0vEtNnCHYJU8RImQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TY0PR03MB7240.apcprd03.prod.outlook.com (2603:1096:400:276::8)
 by TYZPR03MB6528.apcprd03.prod.outlook.com (2603:1096:400:1f9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.41; Sat, 7 Oct
 2023 08:50:46 +0000
Received: from TY0PR03MB7240.apcprd03.prod.outlook.com
 ([fe80::a9e2:98bb:65ec:c17f]) by TY0PR03MB7240.apcprd03.prod.outlook.com
 ([fe80::a9e2:98bb:65ec:c17f%7]) with mapi id 15.20.6838.033; Sat, 7 Oct 2023
 08:50:44 +0000
Message-ID: <3c9f0383-5269-3309-346c-bcf1ef5eb064@amlogic.com>
Date:   Sat, 7 Oct 2023 16:50:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] arm64: dts: amlogic: Fix IR Controller register area for
 Meson-GX/AXG/G12 series SoCs
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Qianggui.Song@amlogic.com, Yonghui.Yu@amlogic.com,
        kelvin.zhang@amlogic.com
References: <20230922080546.26442-1-zelong.dong@amlogic.com>
 <5a8422d7-99a0-7c3b-d0ee-ec3f800ceb6b@linaro.org>
From:   Zelong Dong <Zelong.Dong@amlogic.com>
In-Reply-To: <5a8422d7-99a0-7c3b-d0ee-ec3f800ceb6b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCP301CA0013.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::16) To TY0PR03MB7240.apcprd03.prod.outlook.com
 (2603:1096:400:276::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY0PR03MB7240:EE_|TYZPR03MB6528:EE_
X-MS-Office365-Filtering-Correlation-Id: 94c9531b-d653-4b2e-b772-08dbc7127d84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Wa65QohN6Hql+vNKp68q63spAnvNAUmDKcCY3fAlk6crXkXzNjOfQyeAERnVv3+DVgT3uvWhnuq4iCFW/WqInwKYYndMIZV7jSthvgpW+WdbzzFee2l4OUtGWVCJR0OHNm0M3+RxfSQ8qg46G/KtQS22GctQMbaW2+Z8zv7dTz/De6tpNcpqPfOA1zqrCCL/+z5J5VuVRQ8q/JhbveHRgvN6U+yZx3KUaBxB2tocxci/uvdVCzDMcNs2zKtJ2LMQ7GSyzuiWaimiR9AacqGP2aFh7Wx9GrRqLu3lqHTy5JTPmVgOrkf0F3kpyAM22qQaaaxnxaydhatsG4qZMtOOg60eysg4pG+K8yW86woHF0eMvYRlRSNnbEP/liqm+zkLUUse6OoeNlnhBFPPBmS2Su+VnIGg30lnBJVq1Rvg5zbJ7Yi6/uXDmYFCUutmYcdXrjkRRsJzg9NdIt5SYArJ/Oyp+IRZgudLHhZZzPtoEhM33dr4H3oeO/zq8uqn/1vWezwxgipPJhnXflAWiWA56sFXMexTqNQSaSeABFSJYQJto9j37ZvNqDsfrdBkmPL6VqTqzzxIgnevaNsZdvg0KsmZLw9lNC9T0dbL0RuehSNQXYCUCzjqwnNDEU/vxlNBFXlHMeDrjroELpZ8oDfj5TgebaTYbA+DMqn29Edzlr5u1fbAXZz47vk/FQnxutOV
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY0PR03MB7240.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(6029001)(346002)(136003)(366004)(39840400004)(396003)(376002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(316002)(110136005)(66476007)(66556008)(66946007)(5660300002)(38100700002)(36756003)(2906002)(31696002)(86362001)(7416002)(8936002)(8676002)(41300700001)(4326008)(6666004)(31686004)(478600001)(966005)(6512007)(6506007)(2616005)(83380400001)(26005)(66574015)(6486002)(107886003)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2pvTldGeUIzUi80c2laeTBqZEcyTEsvdWp6MjR1aG9MbmkybTlhTTdvR2hZ?=
 =?utf-8?B?UW0wZVo0dXY5dzFmamU2akd3MEpxTVlBczE5anpZQStmZTVDRDNPYzhweVJR?=
 =?utf-8?B?akphSUdhOExVaFJueG1vdXF6SmdsRWgxQkU2dTl2NkZDbGFMUUk2aGViNlBT?=
 =?utf-8?B?RTVCdkNEaE1NRTFVSVAzYUFLb3hlUmZRclkvcjU5WFNPeUgzaUVxeFVmVHRz?=
 =?utf-8?B?eHo5SDdWd3R1RHcrTGMwQ0prS3BDaFR5N3R1WU5lNDMyUEFZTERuVUIwY0sy?=
 =?utf-8?B?eDVoemZtWUxSeVdJdkFJWmo3MnAraVIyUEJ6d0FURkd1eEZCOHZnVXN6SlMw?=
 =?utf-8?B?VWovVSt5YVV5REFDSXlISXZ5SVYxQWRFbHJDamZiNVpXRm5zMUNmMGVYanhr?=
 =?utf-8?B?WmZJRXBQdWFTZjFaU0ZpdllqZGJNMkNuWVhqMTBEWmpldXdQK1lIVHBoRlk1?=
 =?utf-8?B?TWNWSmJOSUpRUUNHSzFXTEljN1dKRzFJQ0RHc0Mra0xsSG0vaVVYOFFhVXVt?=
 =?utf-8?B?MVVNOHhwSDV5RmhWbHh3NDFXRU52WnBxUWxhbVBiRUJWVHpjM2hTSHk2NGN5?=
 =?utf-8?B?UzBiOXRJYTFMb1pBalozUUVadUdiMW5DWVlVcDZHZWQ1UWY3cFl3bk84aGZo?=
 =?utf-8?B?OUVVUXBBMDF5K2NNMjVrdDNGNFBIUmhRR0ZXMjR6aGZOQXpWNm1CazhWejVL?=
 =?utf-8?B?eCtpd21ZUERXUDBrRTkzeVpHLzl4T0xtREdLWDhmaUpaRGtqOEpFTm4vczJK?=
 =?utf-8?B?MFk3clBEM2RKV1VjblNuY1hCUndkZ0xhWHFCNGdIb09CQ3J2U3ZnaDNGbExO?=
 =?utf-8?B?UmI0TlIzbyt5R2wvTXN3Y21NZW9FVUxSUnhGbTFEbjdmMGJQZ0tSdVY0N3Vm?=
 =?utf-8?B?SVdGbVp4ZGRqM0RFZjdJZWVsamdyYUNjdEVKTU1Lb3E2NnZEa1VuVVhkZjRy?=
 =?utf-8?B?MlFmM000V21xdzhFRnJBQVJwOUJjcXpxa1Foa2RwK1puZlRBQXdhVFJ2UHZi?=
 =?utf-8?B?c3VieVAzWnppcSsvOThTaTdJeDZjdDhIakZlNWZxaW03blYyTklVSlhya1Bx?=
 =?utf-8?B?OU45a0pWRzdmWGFiR2xLekc2aFJ5SDV2RlFWYURXVHdkbk10Y2FqWTBPRThJ?=
 =?utf-8?B?TnlFd0RWTHVFMDBQSGtRUEJuYk51b1AvS2c4dysxVVpjb3VrclNRUzc5V2F3?=
 =?utf-8?B?WW93aFQrcGl2S1QybnFSNlZPeTBKU0ZSdHJTVnB1QlVDTEJyaDBZLzVLVHFY?=
 =?utf-8?B?cFF2Szl3ejhFRkU2NnRrOU12WDNOUHBOU3lxTFRRWnM0VDE5VWdXTCtidzZ2?=
 =?utf-8?B?T01SWGVMNjgrdnRRcjYxekdQU201LzdlUDREVHB3QkFmdmxKcWVvR1Fpcllp?=
 =?utf-8?B?RlpEeU5MWG9tOHJKNnppdWhncy9IaUxtVmxlNkVDRzNUdnVCMnFZZVBrbWFj?=
 =?utf-8?B?c0ZYaHZYcW9YNFhPVU9yQXlDUU82WG1McmR4c2IrdWRyR2kyYlNUWklVbTlL?=
 =?utf-8?B?bnhEREFITUFPOC8zNkpnOTNwdkR3M3JkNXBXekt6c25uSnlxMzlxUDgwMi91?=
 =?utf-8?B?SVZmVElyc0taQ0dpUjVtVXBpQnNXcmRTU0RpSHhXWko0VmJyL1pwaFJ0M2Mz?=
 =?utf-8?B?bldTZnN0Y2lWOFdjUURJZG5SWjh2SmJkY1NrcU9QTUl4NkRMd1FtUm1hK0h4?=
 =?utf-8?B?ZzhENnR4K3B3QmQ3dnFGUC9KNkhqM2U3NExTTnJoNk1iODNrcUp1bEhkQ3Ax?=
 =?utf-8?B?MURsVGFsVkJtOWU1YXhxbmdPUVZHWWRFOUZwRjlwY1pTR0x4L2h2RXVERHdI?=
 =?utf-8?B?UFQ1ZjVld3RXRmYrSWdXSkRid3gxM09Hc0RFekVKdGRCRDVNdzNlWkIwTFRo?=
 =?utf-8?B?TXY0eC9JYUV5TG1oT0p0VDd6dEFRNGlQakFGVEllT2FuR0d6SVhIY1RSZ1Rr?=
 =?utf-8?B?NWczNDJUUHBYb2ZFRmRZL1hZNVdRUGRaS3IzaWxadFFWSzJyQVFnRXRsd3I5?=
 =?utf-8?B?MEpyRDRvRVczanRtVm52dnN6bTNpYUtKUVZ0bGp2YUVHNG8xU0RrZzIrVHZy?=
 =?utf-8?B?MTBJc2hrUkZGV3ZOMW1BODhFc0FNeVZDWWVzaWhQdHZkQU9kanpHYWg4TWJ0?=
 =?utf-8?B?SUplMHVZU21MVkxaV3RpZjVydW9ScFFvYlU3VHNDRFdOcTRtVW5WamhxY1I5?=
 =?utf-8?B?MGc9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94c9531b-d653-4b2e-b772-08dbc7127d84
X-MS-Exchange-CrossTenant-AuthSource: TY0PR03MB7240.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2023 08:50:43.5359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3+75q4ggW160y66dm/EFCw6qATaIixasLE1FoYaFnQrWrrY9CwIMqM7NMVmuLBPoZUUPkYbD5lNh4GiT+w/Z6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB6528
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

在 2023/9/29 12:00, Neil Armstrong 写道:
> Hi,
> 
> Le 22/09/2023 à 10:05, zelong dong a écrit :
>> From: Zelong Dong <zelong.dong@amlogic.com>
>>
>> Amloic Meson-6 SoC only has one IR Controller, since then, there are 2 IR
>> Controllers in every SoCs, one is Legacy IR Controller (same as 
>> Meson-6's one),
>> the new one is Multi-Format IR Controller (abbreviated "MF-IR",
>> which supports more than one IR Protocol). MF-IR was updated several 
>> times,
>> so different SoCs could be got different register sizes.
>>
>> There are all IR Controller register areas from upstream's SoCs:
>>                     Legacy IR          MF-IR
>> Meson-6               | <0xc8100480 0x20> |     NULL     |
>> Meson-8/8B/8M2           | <0xc8100480 0x20> | <0xc8100580 0x30> |
>> Meson-GXBB             | <0xc8100480 0x20> | <0xc8100580 0x44> |
>> Meson-GXM/GXL            | <0xc8100480 0x20> | <0xc8100580 0x54> |
>> Meson-AXG/G12A/G12B/SM1           | <0xff808000 0x20> | <0xff808040 0x58> |
>>
>> About Meson-IR driver, MF-IR was supported from Meson-8, which was 
>> distinguished
>> by compatible string (of_device_is_compatible(node, 
>> "amlogic,meson6-ir")),
>> and only one register (macro 'IR_DEC_REG2') was added because 
>> controller worked
>> in raw decoder mode, later registers are unused, so we recommend that 
>> register
>> size should be 0x24 if MF-IR is in use.
>>
>> There are 2 ways to fix.
>>
>> MF-IR is in use:
>>    Meson-8/8B/8M2/GXBB/GXM/GXL: <0xc8100580 0x24>
>>    Meson-AXG/G12A/G12B/SM1:     <0xff808040 0x24>
>>
>> Legacy IR is in use:
>>    Meson-8/8B/8M2/GXBB/GXM/GXL: <0xc8100480 0x20>
>>    Meson-AXG/G12A/G12B/SM1:     <0xff808000 0x20>
> 
> This is slighly confusing, so you mean since Meson-8 there's 2 IR 
> controllers
> which have the same register mapping, and both works with the 
> "amlogic,meson6-ir" compatible ?

They are not the same register mapping but similar.
Compatible "amlogic,meson6-ir" only works with legacy IR, other 
compatibles work with MF-IR.
Please refer to 
https://lore.kernel.org/all/20160820095424.636-5-martin.blumenstingl@googlemail.com/

> 
> So why should we switch to the MF-IR address ? what does it exactly 
> change ?

In raw decoder mode, it's not necessarily to switch to MF-IR, you could 
use "amlogic,meson6-ir" with legacy IR register area.
This patch is for fix the wrong relation between compatible and register 
area. If compatible is "amlogic,meson-gxbb-ir", the register should be 
from MF-IR.

> 
> If we want to be clean:
> - both should be added, legacy IR with current address + reg size change
> - a new compatible should be added for the MF IR, with 
> "amlogic,meson6-ir" as fallback to take in account they are compatible
> - a new node should be added for the MR IR
> - DTs should be switch to the MF IR label instead of the legacy IR
> 
> With this we would be able to take advantage of the MR IF 
> functionalities while keeping driver functionnal
> with old DTs and new DTs with old kernels.

Legacy IR and MF-IR share the same IRQ number, so I recommend that chose 
one to use. Do they both need to be added?
In a word, this patch is not for new function, just fix the wrong 
register addr.
> 
> Thanks,
> Neil
> 
>>
>> Fixes: 2bfe8412c5388a ("arm64: dts: meson-g12a: Add IR nodes")
>> Fixes: 7bd46a79aad549 ("ARM64: dts: meson-axg: enable IR controller")
>> Fixes: c58d77855f0069 ("ARM64: dts: meson-gxbb: Add Infrared Remote 
>> Controller decoder")
>> Link: 
>> https://lore.kernel.org/all/20160820095424.636-5-martin.blumenstingl@googlemail.com/
>> Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
>> ---
>>   arch/arm64/boot/dts/amlogic/meson-axg.dtsi        | 4 ++--
>>   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 4 ++--
>>   arch/arm64/boot/dts/amlogic/meson-gx.dtsi         | 2 +-
>>   3 files changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi 
>> b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
>> index 768d0ed78dbe..dd8c58e74322 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
>> @@ -1705,9 +1705,9 @@ pwm_AO_ab: pwm@7000 {
>>                               status = "disabled";
>>                       };
>>
>> -                     ir: ir@8000 {
>> +                     ir: ir@8040 {
>>                               compatible = "amlogic,meson-gxbb-ir";
>> -                             reg = <0x0 0x8000 0x0 0x20>;
>> +                             reg = <0x0 0x8040 0x0 0x24>;
>>                               interrupts = <GIC_SPI 196 
>> IRQ_TYPE_EDGE_RISING>;
>>                               status = "disabled";
>>                       };
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi 
>> b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
>> index ff68b911b729..e12cea5fa889 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
>> @@ -2084,9 +2084,9 @@ pwm_AO_ab: pwm@7000 {
>>                               status = "disabled";
>>                       };
>>
>> -                     ir: ir@8000 {
>> +                     ir: ir@8040 {
>>                               compatible = "amlogic,meson-gxbb-ir";
>> -                             reg = <0x0 0x8000 0x0 0x20>;
>> +                             reg = <0x0 0x8040 0x0 0x24>;
>>                               interrupts = <GIC_SPI 196 
>> IRQ_TYPE_EDGE_RISING>;
>>                               status = "disabled";
>>                       };
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi 
>> b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
>> index 2673f0dbafe7..0c04e34a0923 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
>> @@ -506,7 +506,7 @@ pwm_AO_ab: pwm@550 {
>>
>>                       ir: ir@580 {
>>                               compatible = "amlogic,meson-gx-ir", 
>> "amlogic,meson-gxbb-ir";
>> -                             reg = <0x0 0x00580 0x0 0x40>;
>> +                             reg = <0x0 0x00580 0x0 0x24>;
>>                               interrupts = <GIC_SPI 196 
>> IRQ_TYPE_EDGE_RISING>;
>>                               status = "disabled";
>>                       };
> 
