Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA3E47935F8
	for <lists+linux-media@lfdr.de>; Wed,  6 Sep 2023 09:12:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230423AbjIFHNB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Sep 2023 03:13:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230350AbjIFHM7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Sep 2023 03:12:59 -0400
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2114.outbound.protection.outlook.com [40.107.215.114])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D49883;
        Wed,  6 Sep 2023 00:12:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hz6zOix2QLo9ZeVqbU4uKOeMZ1lQwxqpVZbewYgk5YkoE4yZPGv1OTAA6icBg2ro6aJE7Vir9X3oqVRAURpI56LXlld9l3OH24025Sv7pe6uyu03THiz7aR8Np7mLVJ3X6p5pVo7A0ToVdIx2qMNfBVyRqs/VPMAeH/rNoLIF5r0q5rGHyg1hLI0mnk2A4yDYHLWxHBXNlu2KC0lcBRdZdUlcwUXuBqhOH6hjW/l72BOMhObrxnOO72OVQE2qoT4Tg/zhy2vi4z5qHuTvuD0p3rYdlsFTpNm+0H1DBqcN3Z/jsjKW402L+80WFGHjCBttmLKNeOUR5omOOaJ4jiOig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oic67TH2Kv+h4kJDab7LgSDHig84lLq+B43RsjNVmE4=;
 b=Zb7iW9tOLiJBXKYaSVMqKzGnqEQWRBOb/ZtW9p4LkEWiaQqKmS0B8AtH3bj07mzcoiif0lhokiH+MJjIFdjBDyWJ6itey61WHKPov58jdUNFngxWCZHQMlvkK41byjQcpewCMU0JQ6OQgstjSyo2+3rzvNC8iM5nxRFqHvgcoZLes4jR7Oc7EF9x6c321WawHD7ivwTyjufFxYuAIcoP9LSJ2V0MuX/yy7xnSjpGHosU8O4GxETtAOmlQ07MnWoen2Eps0pN3quo3+keZoB2rtY8U+fORDdj//okKL+o0EqsbImVweCXNwhBSZblxZc91PM9tDHwrkVtkST2qdNu/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oic67TH2Kv+h4kJDab7LgSDHig84lLq+B43RsjNVmE4=;
 b=ygfIdUgxZzQqzxeaB76NzX3t3swUV3S1IBEKRelrAzrbuoSzPhWSvf1CPaSYipSYCBfmsspp+o6hS/d5t73ef9JaOmFmT3xRWMJ5Ub3UK2PdT/zRhExIaCT1Udm9up9e/+FrVk6PQVzlJpbk+O5J1VKs/BJwdM4NZkN7xPHq2w5I6dVgJnalfiz6ilmWDzkWOSZtcfPfS2+kYeDtgixpreGTRlB037bXmBPE0GNzXQsBwk8Qryqc56c08Otsf+4kpuPdmoVmYV7WA/Zzmz0S6QvZ6Fle9ODqnsQOKwrQ2aKtGjJPOsSfLEF4waIMtruirEad/qw56tDxxlSojsEkpg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TY0PR03MB7240.apcprd03.prod.outlook.com (2603:1096:400:276::8)
 by SI2PR03MB5738.apcprd03.prod.outlook.com (2603:1096:4:138::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 07:12:03 +0000
Received: from TY0PR03MB7240.apcprd03.prod.outlook.com
 ([fe80::1cb:e12:c7a6:487d]) by TY0PR03MB7240.apcprd03.prod.outlook.com
 ([fe80::1cb:e12:c7a6:487d%7]) with mapi id 15.20.6745.030; Wed, 6 Sep 2023
 07:12:03 +0000
Message-ID: <646b1955-c89f-a6f5-acd1-a3c68953b0c6@amlogic.com>
Date:   Wed, 6 Sep 2023 15:11:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 1/3] media: rc: meson-ir: support rc driver type
 RC_DRIVER_SCANCODE
To:     neil.armstrong@linaro.org, Sean Young <sean@mess.org>,
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
References: <20230825115310.39993-1-zelong.dong@amlogic.com>
 <20230825115310.39993-2-zelong.dong@amlogic.com>
 <fcdb1fb2-784d-4235-aa47-9e489395c028@linaro.org>
From:   Zelong Dong <Zelong.Dong@amlogic.com>
In-Reply-To: <fcdb1fb2-784d-4235-aa47-9e489395c028@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYWPR01CA0043.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::17) To TY0PR03MB7240.apcprd03.prod.outlook.com
 (2603:1096:400:276::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY0PR03MB7240:EE_|SI2PR03MB5738:EE_
X-MS-Office365-Filtering-Correlation-Id: 89ed81b6-a246-472c-ff3f-08dbaea891d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZrOuj/tLWlYTGgEI+dF028NnedM3MTsOx8iurmjgHJ8vkc7WSth+g8ZB6JJql2WubCQlEUxdEblyMzotAyw7GO0n5dkQa15Zn1C5ktrS3+4BEdytE5rv/me3NzDWFSgo9QjORgqBMZKj4Q/UXE2M54t8ulPxkIsyMObVtj2yXZVn9K6JDJa3vDWTY1+UqQzkEs/5Ry1SvntHtSK3J/tpxlKO55dhrnK+Xg8u9mdziSdG904FBQV4RRim9JvK+05Npk7+F+L4p4dsCsi+fM5VEg8t6L8lJJCYvsKFxfn/uoEihUiWy6OMXOlmnnZidBYw9A4t2x7yIY8z9Aq9l/658SL5BXZnI+0XyM5SK2N3zUWfNiPowiqeBLooCt+mF6TNOiE4QgFPFxajQijbb/fy0ubDTen0fWOibtHeRHyCQEz5VyN7+GSiea19sqPXc6wLmgnVKsVBw/DFuBmvv2K2xOcUobEnV/nSNeW3OZa2hvkhpaOajT/BrAwxE9V6q9bcUVcnirJONIz48lxWdan3L5QFumjak2yZBa4bsTQctoJklLoLfxSUyQOGNtS8gWR3HkHBXc4RgcX8VFcSVIljS6GdVrzQ4n93ccpEuW0XQwmA7we1MQTbscfCkOEeWjTp2dXFdQGL1newlMtrSR/aXnikco6Tadf4JDF4qdsAJJW9zbrrPL87H1Lte8dnyhrSVi5v5ZbtxslyIFjLORguLw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY0PR03MB7240.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(136003)(396003)(366004)(346002)(376002)(451199024)(186009)(1800799009)(8676002)(66476007)(66556008)(110136005)(66946007)(4326008)(107886003)(316002)(8936002)(2616005)(6486002)(53546011)(6506007)(6512007)(41300700001)(7416002)(5660300002)(83380400001)(26005)(6666004)(478600001)(31686004)(2906002)(31696002)(86362001)(36756003)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUs0dDlXRkphdVF6MGROM3hFdzNUWXNKYTdubjQ2TG9Uc2QwWi9xZEtKOUhh?=
 =?utf-8?B?ODVRZVRGWE1kcFNBRkQva2RJMWhCN1N2VkpoVEhvSE1MV21xUEZDTnp0Ym5K?=
 =?utf-8?B?RHBPRlRlV1MyMUcveVA3L0pPbXFCN3FvejdPSkVPY2h4VHZnSmhpTTI5WUsy?=
 =?utf-8?B?cERaSXZZOHZzOFJ6bDNYVE92NlE1ZmFneFpVblZDdjQ4UWJkNjhnSHp2NWFO?=
 =?utf-8?B?ZG1MVGlwSEVBL01hMXZYamxJOVlSVVM4OFR3aGlCQk9SWG0yUUs5QkVpVmFv?=
 =?utf-8?B?Q3hubk9mYTh0Z09wNzh4elpQTTR2ZjUwTHpibWZRT2pGV1BvZHB5b0p6cXhX?=
 =?utf-8?B?TEdVWGtvV3hRQjdSQllaUytmUjU1bUJQZXVHcGZCR2F0QnY4bE9wV3M5WHEx?=
 =?utf-8?B?bzBMMjBzc1VSa1Rzb2FWN0IzQjNwT3h0bzgxSkxWQnFrc29HV0xNMHBnaWJm?=
 =?utf-8?B?T2p6RXlLOHFEOUlVZnE2TVFnNzRMTzJHZ3NudjBVUXE2UnNvOW1kSS9qUlZn?=
 =?utf-8?B?MWtUNEpyRXVKSU9ncERtTGVMdkZIZks5UXg4b2FHdmU3Ti9nbms1V1o1amhT?=
 =?utf-8?B?TElibERNUVcxL3pOQjFDY0E3YXJMc3NrVityVTZkbnQvNVBUVUpFUzIremg1?=
 =?utf-8?B?UGFFVXlZNVorVnI4eWVITUZDR1d1QlVVazljTmdBeUJFUWNvOUwwSDRXV2Zo?=
 =?utf-8?B?TmR5b1dRT1lIWHBsbUJ6VkpNL0g2SUx5S3ZjNGpaM2VPQnZoNEJTUTU0anNF?=
 =?utf-8?B?QlZCaTlNTTlTV1hDSzcraFM4TUhmbzE5bWNnaTFEeVM1RmtQVDM5djlZazM1?=
 =?utf-8?B?UmhWbDZWY1ZFaDRYQ3BWNzZtbGVLUFFuVGdSOUtPVHV1b0Raa0hjRmxGYTlj?=
 =?utf-8?B?aS9sbHl3cDNEdXQzazVCUHNwcDQrWEZieXY1SVNQZ09JL0ljZVg4bkNEQURq?=
 =?utf-8?B?ajBONFhIZU5MK21ZWWE0OENpdFJRNUZCNlJsNnJXQzlxWlYzWUI4M2tEbTNI?=
 =?utf-8?B?RzUxcEV1MEtIcHhRZ1hUTCtRZm0yK1VadWpyYkRKdXY3VlRGVnBpdFk0NUpn?=
 =?utf-8?B?SnpXelg3dDBSK1NoVFdwclkrS1FJOXFYQzdWenovMis4WUlXcjBPWnRtU1pa?=
 =?utf-8?B?NkFuSk5wMXR6TGNuVXNURVZYdG9MZ05LSDNnU3lYTUFnRGFrMVhkQWZyWUYw?=
 =?utf-8?B?S0VuT0FwTm9NeFJtUTRCbXBZNUE5WGlPZ1RRQzVLeS9BOTFObG8zbk1tcGw0?=
 =?utf-8?B?ZFBNcUNMdjlxUHRZNDE3YUkxaUdDYTVZMVdvNm95SVJsL2I4blhHYjNwYmV1?=
 =?utf-8?B?Z0RJQXRuVFg3WHM3Um9iS0Zia3ZwMkd3WmlGdnJMa3BlR2ZlSmhxVXNBRnhJ?=
 =?utf-8?B?ZFZxQkczcDcvUlpvZFd6Y2pTeTVmbHdReXRCNXUrWUo0VGhwM2dWaHY0a0RH?=
 =?utf-8?B?ZHoyTWdOS2ptQTRKVTFyKzhrYm15SlZBUUJldUhXM3psRVQ2eEhMUzhYa2gx?=
 =?utf-8?B?bHRTdWRkam1WOXlYcFhuTkNZRkFaU1JqSnc3VFEzY0pNbkJtVjE2MFhwcEQ2?=
 =?utf-8?B?QXdSTDBqUXg1SjhrUHY3V3FNL3JzQ3ZYc3VDS3FyY1dDVnRLQlk0TC9ON3A2?=
 =?utf-8?B?OE9NNjBWNXFzMzBtVjBZa1RMcXFSa3Y4SjNnNjkybDRPSUhiNk8rY3A3NS9H?=
 =?utf-8?B?K2I3SklmSXUxZTFidytGSHNpTWFPbFViS2k3ZjI4d1k5MXJLM05SVFh5SHdS?=
 =?utf-8?B?NlNuTnJjNWpFY3BJcDd5Q2pGaFFQY1JkRkNIRW1iNEwxRU1yOXlsUnluZkl1?=
 =?utf-8?B?eDVESzNRN29GdjZoSlZBNnZ5eEhNMUFWNVlkK3FsUHdocWozemh5ZzVyOUs5?=
 =?utf-8?B?N1g2VEVZUXJuTm83Um44eFIxeGs5TXU3dEI0SzFRdFhneDducUhqU3pRRVZY?=
 =?utf-8?B?N0lwTDB0UVExSTcvUkRDU2NxaHpLczZFaEFrTlJ0R0txMzF0Tjc5Mk5yZHd0?=
 =?utf-8?B?NFd3L3BJN2JGbU1Pdm8yZXlZcHJIWCtGb0k4SUlHTUEyelNHZWJyMWJFVkZF?=
 =?utf-8?B?dmsxb3hCNFI0ZURLTlRRZnBXamNjYVZvQmJQRjhvQmhFRlMyak9pTzBUejBB?=
 =?utf-8?B?cEZkamp4SVc0T3M0alkzZEhmNVN5dlRHelpFY0Y0SjZYU2w3NjhwZTNxanFm?=
 =?utf-8?B?MXc9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89ed81b6-a246-472c-ff3f-08dbaea891d7
X-MS-Exchange-CrossTenant-AuthSource: TY0PR03MB7240.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 07:12:02.8834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EmNJNW4kgRFCiKfm5cIqoFxA5WeAx3Y1JgggIbcUL+oZ5SluZJGafG+Fu+lEalB9mMqkOxrO5VZc7ItL2BlTfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB5738
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URI_HEX
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



在 2023/8/25 20:19, Neil Armstrong 写道:
> On 25/08/2023 13:53, zelong dong wrote:
>> From: Zelong Dong <zelong.dong@amlogic.com>
>>
>> Meson IR Controller supports hardware decoder in Meson-S4 and later
>> SoC. So far, protocol NEC could be decoded by hardware decoder.
>>
>> Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
>> ---
>>   drivers/media/rc/meson-ir.c | 522 +++++++++++++++++++++++++++++++-----
>>   1 file changed, 451 insertions(+), 71 deletions(-)
>>
> 
> <snip>
> 
> It looks pretty good now, so far I'm ok with it:
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> 
> I think some test reports would be needed to be sure it doesn't regress 
> existing HW.
> 
> Thanks,
> Neil

Sorry for my late reply, I spent a long time looking for development boards.
I searched Meson-IR DT Node from all the Amlogic DT, only 4 DTSI as follow:
arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
arch/arm64/boot/dts/amlogic/meson-axg.dtsi
arch/arm64/boot/dts/amlogic/meson-gx.dtsi
arch/arm/boot/dts/amlogic/meson.dtsi

So I planned to sample the boards to test:
arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dts
arch/arm/boot/dts/amlogic/meson8b-odroidc1.dts

Unfortunately, meson-gxl-s905x-p212 & meson8b-odroidc1 are too old to be 
find.
there are only 2 boards I got, meson-g12a-u200 & meson-axg-s400, and 
they worked.

[    0.943097] IR NEC protocol handler initialized
[    0.943146] IR RC5(x/sz) protocol handler initialized
[    0.947029] IR RC6 protocol handler initialized
[    0.951508] IR RCMM protocol handler initialized
[    0.956080] IR XMP protocol handler initialized
[    0.961266] Registered IR keymap rc-empty
[    0.964674] rc rc0: meson-ir as 
/devices/platform/soc/ff800000.bus/ff808000.ir/rc/rc0
[    0.972437] input: meson-ir as 
/devices/platform/soc/ff800000.bus/ff808000.ir/rc/rc0/input0
[    0.980983] rc rc0: sw decoder init
[    0.984089] meson-ir ff808000.ir: receiver initialized

# cd /sys/devices/platform/soc/ff800000.bus/ff808000.ir/rc/rc0/
# cat protocols
rc-5 nec rc-6 rc-5-sz xmp rc-mm
# echo nec > protocols
# hexdump /dev/input/event0
0000000 0069 0000 3180 0005 0004 0004 011b 0000
0000010 0069 0000 3180 0005 0000 0000 0000 0000
0000020 0069 0000 fc80 0005 0004 0004 011b 0000
0000030 0069 0000 fc80 0005 0000 0000 0000 0000
0000040 0069 0000 92db 0007 0004 0004 011b 0000
0000050 0069 0000 92db 0007 0000 0000 0000 0000
0000060 0069 0000 388b 0009 0004 0004 011b 0000
0000070 0069 0000 388b 0009 0000 0000 0000 0000
0000080 0069 0000 de72 000a 0004 0004 011b 0000
0000090 0069 0000 de72 000a 0000 0000 0000 0000
