Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AAB8783E95
	for <lists+linux-media@lfdr.de>; Tue, 22 Aug 2023 13:12:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234408AbjHVLMB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Aug 2023 07:12:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232180AbjHVLLu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Aug 2023 07:11:50 -0400
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2093.outbound.protection.outlook.com [40.107.117.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 883F61BE;
        Tue, 22 Aug 2023 04:11:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D270us5kAcQyZ1Yo7DiCdwpAVy9cJT++ueKLW0QV/oNZehy54YQpxSzL4NxuY7LlAmjxW43kr+1F7dPzRTsAmKUab9QCHDbTMpRPB/PzK/3wHJEjDbir5fKShpzNhlxpPMneAxPQPCF3rOWHSYHQiL3BEyMG+zVtgiKQCp9Je6lEn4vaxRriXlqmkp7WI++v7aProvLeRTPGRaOG3tJLqh5O2NlL3gJsdzad7wXyHppqikK0M6MbiFkal65Nzqmj6BlGwzlIqmjNvt/In3ib5SZ9MKyS+loizVoY3PbLmDHvNfApo9r838rYQ+gK1nqUfblV/ESVJ3wHPDdRQbxaTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LELjkLFNz6w08IJjv0Nu/GpO464g1w3jTPQeAmUlpZg=;
 b=fJjJN92O4mo9bfRP99vzY37KMeEJ8odz31cDSZ1iRyDIqDwm9VbywkVaXrL5z0HhHU4zC4xgTjSoJ1gFRRkyJGqp3vlqY5t/DaQByInKhC5CxXU2v3vCKKeQk4Tt+tYr+eH5bDqCeC5xbe0I4noYsz9rtouwyGyhL4a4NXYfiiY2t0XSu1QOMI9c3GgQCXZUBjP5vrgTefNuvzD0mzC1sKLKC8jOd5pjG0EjCeSBzMw0iB74k+rG9+ogyERO1obLSsLJJ7wx8rbkG7tYBVI3po9qGktPuJNV/lRwtJtypCHt/osMfK54V6fYFONaR6erVthdYQSja53eS5PK2e0NaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LELjkLFNz6w08IJjv0Nu/GpO464g1w3jTPQeAmUlpZg=;
 b=gA14kxW7vPz4KQIHmfEPKdx8Kk/0Bbq/vd26TTNpZuOwpEDAemWoXfo4DB6kRrDt9002F3wAkfpXBCJhvm98ApNTf2fBilH72wTY7IroLvHzedqeC+L+QkaM9pEaiTvKUE2U+xNZUcipYVH6fXuLt81ugzb8U/m3SpSzxWGtQ4XnMV8IdcdRKdoUnkwC0cxFC0qPL3qlMDdvoh8fTYd0cFTMEa+8GjkiZZujBdaS895/Mv9TLfCUqnU2xv0oARui1iUTVuJjEgwX3f5G5nc/IbhLV0ysJabCrD818GtPf7WHKMc/iMM0daaj2zN7Q7/YS9oxXIJmIbZM2jYFogB2JQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TY0PR03MB7240.apcprd03.prod.outlook.com (2603:1096:400:276::8)
 by SEYPR03MB7795.apcprd03.prod.outlook.com (2603:1096:101:16a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Tue, 22 Aug
 2023 11:11:29 +0000
Received: from TY0PR03MB7240.apcprd03.prod.outlook.com
 ([fe80::1cb:e12:c7a6:487d]) by TY0PR03MB7240.apcprd03.prod.outlook.com
 ([fe80::1cb:e12:c7a6:487d%6]) with mapi id 15.20.6699.020; Tue, 22 Aug 2023
 11:11:27 +0000
Message-ID: <9dc78ceb-3852-e5e8-0b8e-b95f9bec4557@amlogic.com>
Date:   Tue, 22 Aug 2023 19:11:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 2/3] dt-bindings: media: Add compatible for Meson-S4 IR
 Controller
To:     neil.armstrong@linaro.org, Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        devicetree@vger.kernel.org
References: <20230302063402.42708-1-zelong.dong@amlogic.com>
 <20230302063402.42708-3-zelong.dong@amlogic.com>
 <80fe197a-3f15-d1b8-ed99-adeb4a8c24d2@linaro.org>
From:   Zelong Dong <Zelong.Dong@amlogic.com>
In-Reply-To: <80fe197a-3f15-d1b8-ed99-adeb4a8c24d2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR01CA0009.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::18) To TY0PR03MB7240.apcprd03.prod.outlook.com
 (2603:1096:400:276::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY0PR03MB7240:EE_|SEYPR03MB7795:EE_
X-MS-Office365-Filtering-Correlation-Id: 0181b47e-e892-4b05-1158-08dba300876f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QQ5r9szoYMFxclHR8go7+YKaNkFTwy7SxR1UQH6lVJ7edZRM7zz68LFZdxRWqcAdL/DGp82S46kMpzf+s28V8VKt8ulDTjy4FGtxC2TT5pyIGQN7Lu9jtJdt0Hm1z8Wp/j2rD2kCl3BYo0hA42icnHcZHwCWhvqZm271ZvkgJdVhUAfPAm0FiQiZgAr/Xi6lZiJ9/U4UAddJ2bdhoVj0HDaGAr0NZ+lB0Rc/QpMMa0wdnZ5fEa7IqNHa9/5BicnBxXExG9UmexuhsDE2rUW1NvXB6PrZOmnWJY7dZURj+RrL9RwuQyaPWHfYrHuzWttNitJTcDGpVmN5rWqmxUFrxH4CV5/705amtqpe4zZfUaQR7XB2SsIRMV6+Q8tObswUXgN5OHYdlY4Mx7VHchDMztwEoIfh4qFN6WApQSPzmZ6rdfQ05bVFvmQyCN0L1eugxAMvHTLgElLPya7jgW+7+Ibwnjap/PSeYc7w8F7K7M/jOm37C7ddMw/8qzKKqY6hsDcaQavBs5PLQCS3jQA1qCb/NeIPq0ipgpGwIXxaXHI0aC33gqiQ2teZ40G2J0fNvsSkF/OmFsaqHKP+YfduCim9KVLht8pg4HGv2pJcCBK4eVtbFL5LGUggXqmsDR5ybSUmV5XNu7AaVTnXljUXjNJjw0dedMP0NMbMD6/wEuz9pzt35vatuCf6ts0UbQ8q/0hBBntGldGzDQFogPPOzA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY0PR03MB7240.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(376002)(136003)(366004)(39850400004)(186009)(1800799009)(451199024)(2906002)(38100700002)(7416002)(53546011)(66946007)(66556008)(66476007)(6506007)(316002)(6486002)(110136005)(6666004)(41300700001)(6512007)(478600001)(36756003)(12101799020)(966005)(31696002)(86362001)(31686004)(26005)(5660300002)(2616005)(8676002)(8936002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmtjMG9seHY0bGJubDVzbG1ZbjVvMG95dzgzaGpJUStLaXNla3FkK3VTd3dS?=
 =?utf-8?B?aW1zS2lxSks5b3FMbnFwTnBIQjU3M05INnNENnQxaWl0ck51NzlNWDNqRWR0?=
 =?utf-8?B?L2lnZVdzeUVlYlYwR29YQUlRSEhnZUNBSm0xTVNaN3RlRTJ3L3BMcVFveUMx?=
 =?utf-8?B?SkxVL25GWnRYWitSdmJUNCtMSmNlZENIZ0xuVnhTcGpZcUc2N09NREtHbktM?=
 =?utf-8?B?OHB5MGJLSVJ5bGE3Skd2YlZNZUl4SXdSQnZhSjZ5VHYwd2YyQm56VTBXWVpR?=
 =?utf-8?B?Qzd4emY2V3NPREJQbjc4TmVGMm1rR29jSW9GUmlPOE5FbjlwL2VyU2xJZFVk?=
 =?utf-8?B?S3hKNTEwSytIWWhrajM3RjhjaXZkUXpLajZreEJDS2dGa00welZqdEIwdUpl?=
 =?utf-8?B?QVpjbWdGZ2hyTmg2MGo2dDI0Rjg3ZHA5RlVWMHlUYWdyL0dDTVR5UUFWYjU3?=
 =?utf-8?B?MUtVcmpFZ0U4Z2xHYVR5aGhkeFBkNG1zRUN0QlhPZmZLc3owV2JSamRzbFM4?=
 =?utf-8?B?cFVhK2FwYXo1M0g0NGJ6ejFHaE9nTUxhQ1BTL0xqd3hmL3N3T1JDYjMvYmY5?=
 =?utf-8?B?bFRuWFg5aEFWWS8vbnU3QVljYXN3czAyMXk5QzZRUVVJbU5WdFN3TE9SN1Yy?=
 =?utf-8?B?anVTN2xCeHJsem55RmxGWTlUUmlVMnVZL3hHTXJKOWxEWWdKcTRVM00yOVY2?=
 =?utf-8?B?YVBMa1hzNHg2eGlHdnJTbXpzL1FOZ05RWlFtZ3hPYnFkSDNrVWcvbjVNNWJ5?=
 =?utf-8?B?T1hNMWcxTkNKeFVRR3hadWxsVnRxdWFJSjdNdGFCalZkTWZXTk9vemxROWtX?=
 =?utf-8?B?ZGxTQTZPS0lscnRseDJ6cmVucndXekR3VVVRSVlHaDBnQWNkRWY5QVFYcDNo?=
 =?utf-8?B?MnlUVkJHK2s1SDM4d2xkYlF5ZVpxRklBRW5QKzBYeW1CRDQwcVFncjB4aEVj?=
 =?utf-8?B?eFdlOU5YalV5YlJvTzlXVTNLbWRla2UybUllUjlIeWRKdUdRV3NZcEJTbWE4?=
 =?utf-8?B?VFdzSjl4SFBoTVgxY2pZZEgyRlFkYlRiN2MxV0NLR25kUWRhRDdCbERHRTM4?=
 =?utf-8?B?L0NBaTFSN0lJRTYrSmpFenpsYjlCMVVZTW5tYkNyaFRNenRwN0VnZXEwS1J2?=
 =?utf-8?B?bGhJMjVKL0ZabHIxa05tVTRuMlV2S3hrdFduMC8rRHNMc3RiR0U5VDNvNGF6?=
 =?utf-8?B?eWtaTDMyaTJnMktiU3Z3WXQrTlBCVzdjeUtqNGhNNHdPbEorSi9HaTE5NlVN?=
 =?utf-8?B?cHJJOVFNS2JYRGRuNXpCTTBmdng2Rmp1SW4zU1dVOHZ2TSsyRWl2OFFGaFdY?=
 =?utf-8?B?anBQb2JIb0pycWdiUFNHMGlmNmZMeXY2YlpLaVNEYnV0elpsUEFVcnhFVXJG?=
 =?utf-8?B?OCtWN01iZDVWWlAwQkl1bWk5dUUxUitQM2tNTFRhRUJYQ1dSM1Jza0E0VnBa?=
 =?utf-8?B?Si9KMFBUU1BzS3RVOG8zQ1ZpZTJOUEFsRDhtakdEWGhxb0xQanI2dHZYSThK?=
 =?utf-8?B?VDlGUytHemFiSlcrdURPb25SSUFzbis3UDZLSlpEdWhIWUFGQ0ZJaDdZZnI4?=
 =?utf-8?B?RUlGNkZ0VnZtOWoxV3d5L0FYdURhOGdmeDk4MW0ydDd0blZSbWUrbGVZd2ty?=
 =?utf-8?B?cUp3MDZIbEZVTzRrMzMzL09FaTVnRWhpVTZteEF4ZVVPZmFZSEt5d29EVVNr?=
 =?utf-8?B?UnNHTEpPemZ0SG5Tb1VCY3NLd3lLd3RPdW9TMlhoQjc5VXdiZHpWL1RDMm5V?=
 =?utf-8?B?ZCs3aGlNdkRqZ2VhK1hpYlB1c0oxVU1CdXBYK3ZneElIbDgxcGJnN3p4N2NR?=
 =?utf-8?B?NVl2Ukk2L0d1RWk2NlhPRUY1WllFbGhiSERKak40SDFEbC9zUXFET3JrTjZN?=
 =?utf-8?B?NlU5YVVwN1gvNDJNTGFzR2dzd092U3UyZEp4OVpCdldLQWRzb1VvOVZ1K1dX?=
 =?utf-8?B?aEdhSUs1WSs0dkhoUUlScTdOL1NiZEc2dEJ3QkNSV0VCeDJsQno3eUxCSXJ4?=
 =?utf-8?B?QTBhdzU1MTM1Z3BlcTlvWkdOSW05SDJIUFRPWiszTTYrckZibW1pc1BGeU9x?=
 =?utf-8?B?VXFKV1hYV0dQL1ZPSVQxWnRiVEZCSXhYaGlRTXVIUmZTNDlqa3o0c3hSZGlE?=
 =?utf-8?B?Y2RDZE03UmhnVHVVY0VvRlV0Q2YxRWU2a0JEV0Z0dk9WczB0cDMyektKbUNo?=
 =?utf-8?B?OHc9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0181b47e-e892-4b05-1158-08dba300876f
X-MS-Exchange-CrossTenant-AuthSource: TY0PR03MB7240.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 11:11:27.5824
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rZXNrexSg6hxaebujybdjNzoMAGijspU4i6IywhIcQZBAcEf3Dihi9e/7qexTaZmHZYMU4zHP0emtxlGu3ajQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7795
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



在 2023/3/2 17:24, Neil Armstrong 写道:
> On 02/03/2023 07:34, zelong dong wrote:
>> From: Zelong Dong <zelong.dong@amlogic.com>
>>
>> Add new compatible for Amlogic's Meson-S4 IR Controller
>>
>> Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
>> ---
>>   Documentation/devicetree/bindings/media/meson-ir.txt | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/meson-ir.txt 
>> b/Documentation/devicetree/bindings/media/meson-ir.txt
>> index efd9d29a8f10..2a6662edd04d 100644
>> --- a/Documentation/devicetree/bindings/media/meson-ir.txt
>> +++ b/Documentation/devicetree/bindings/media/meson-ir.txt
>> @@ -5,11 +5,14 @@ Required properties:
>>             - "amlogic,meson6-ir"
>>             - "amlogic,meson8b-ir"
>>             - "amlogic,meson-gxbb-ir"
>> +          - "amlogic,meson-s4-ir"
>>    - reg        : physical base address and length of the device 
>> registers
>>    - interrupts    : a single specifier for the interrupt from the device
>>   Optional properties:
>>    - linux,rc-map-name:    see rc.txt file in the same directory.
>> + - amlogic,ir-support-hw-decode: enable hardware IR Decoder, and 
>> register
>> +                 rc driver as type RC_DRIVER_SCANCODE
> 
> AFAIK this is a software parameter since the HW is capable of decoding,
> if you want to make the HW decoding a runtime option, please use another 
> way.

Part 1 patch for HW IR Decoder was queued, now I'm preparing part 2.
I add a new property "amlogic,ir-support-hw-decode" because I think rc 
driver don't support change the driver type (enum rc_driver_type) 
dynamically, it need to declare the type in DTS.
Am I right?
> 
>>   Example:
> 
> Please base changes on top of 
> https://lore.kernel.org/all/20221117-b4-amlogic-bindings-convert-v3-4-e28dd31e3bed@linaro.org/
> 
> Thanks,
> Neil
> 
