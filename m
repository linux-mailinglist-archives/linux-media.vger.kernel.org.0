Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D189793A0A
	for <lists+linux-media@lfdr.de>; Wed,  6 Sep 2023 12:38:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237711AbjIFKiD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Sep 2023 06:38:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230053AbjIFKiC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Sep 2023 06:38:02 -0400
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2139.outbound.protection.outlook.com [40.107.255.139])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD44CCF2;
        Wed,  6 Sep 2023 03:37:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VI4aPFal3DUzBX2jdxqY63uP1OM34Znq6QOgFhFRzeTi6XFb4U9gwaIdzONFxQE5sbqbG/3+hOERRPDnfqPNr8TF07q5vbCJTb2tONaH1p++BYGa6HVM4h3F2gIYIxVoDocCRz3Zwsgkl1BuhgGgH2nRS4aiYH/NWRUVIbhMY4GkAbI+uvmJ0Jm5GN4f3ijr0FrpCsk88ugdj08JIHQT2pOQ+CIDqLoelfTJyB3/ijiAYn8k+W159jbqVbTEHm3c753DDlBbfEmGN2vrtj+XomABEuvUHn38XvRjujd8a+C3skLsnL35vP9RBNZ/2EIkFUGX7XsX+gpuWEQQ/2/TRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OTYf+hxJV8raGQHE+pyWeYlqTu26hT5MIuFEZV9IUcQ=;
 b=Gv6gnZw5w6ZBQhNWyzXRfcCsReoHJFqzPNwGOiBO0/UKCXbJ223a0K7y31zEI6nIn/l7ahjk+P/kS9PFp9FmHxz1RUM7Eqfm9epUtX3WPT2qTwC+exkHvbQUIpb5f7ZhqCgsCg0YTSwjC7/zrDof4xBz3iiFp4GfWB42DBH8a/r5lRVdYe0NKDd1Vl6GSfUtEgUXTWpwbA/tj1nen9VeCM+rV1gpx/n4+gkU1XJqB6+yoyY3MeFw5YNTZ5+ldY3xm/iLQ+Q57b8nbLM+wy2b/ljc614phIeLjQRVwzncZAMbZ1uVxLeZAi9DBoRhC1z0cmiVzvC2WgQ37/HmgA+RBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OTYf+hxJV8raGQHE+pyWeYlqTu26hT5MIuFEZV9IUcQ=;
 b=ULGeuiEdqJRXtlIfuF5DIpAVOYkesTF+Fccawx218TIdWCmDcCQU4QX9TVBNJNVKi0C3KClsMiOhplzaYbQCpJIJhlXnJMFFvKpBV7HxAqi5dgb3XvsXYuOYSm7za7BeY/nB8P39T/EI4nhH5Mqnw13MfAFKrYjeZMCH44maBbQidO6x6VGXXefQtV82lRTwu+8v3MF1qilgHCRWbTkUZ/2yqDfXkgyMRJbLmOj5TTCb6ulvjcRxeYXc5b33V/LFerJ8yAFpr9kThIhG/UniH/+U7n8/P6OIXLrY+fioU1t4JlogqCFxv0v8c9npQKmlUAlLA/Go0D2NguRVJyU+hw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TY0PR03MB7240.apcprd03.prod.outlook.com (2603:1096:400:276::8)
 by SEZPR03MB7328.apcprd03.prod.outlook.com (2603:1096:101:123::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 10:37:45 +0000
Received: from TY0PR03MB7240.apcprd03.prod.outlook.com
 ([fe80::1cb:e12:c7a6:487d]) by TY0PR03MB7240.apcprd03.prod.outlook.com
 ([fe80::1cb:e12:c7a6:487d%7]) with mapi id 15.20.6745.030; Wed, 6 Sep 2023
 10:37:45 +0000
Message-ID: <448f6dab-4cfe-c840-8c70-adfa217cc7f3@amlogic.com>
Date:   Wed, 6 Sep 2023 18:37:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 1/3] media: rc: meson-ir: support rc driver type
 RC_DRIVER_SCANCODE
To:     Sean Young <sean@mess.org>
Cc:     Neil Armstrong <neil.armstrong@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Qianggui.Song@amlogic.com, Yonghui.Yu@amlogic.com,
        kelvin.zhang@amlogic.com
References: <20230825115310.39993-1-zelong.dong@amlogic.com>
 <20230825115310.39993-2-zelong.dong@amlogic.com>
 <ZO2gvMl2IS70ve3T@gofer.mess.org>
 <b6e9fc91-0c99-5635-235b-76bc6db55f75@amlogic.com>
 <ZPGahNKlq/31MXbh@gofer.mess.org>
From:   Zelong Dong <Zelong.Dong@amlogic.com>
In-Reply-To: <ZPGahNKlq/31MXbh@gofer.mess.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TY1PR01CA0200.jpnprd01.prod.outlook.com (2603:1096:403::30)
 To TY0PR03MB7240.apcprd03.prod.outlook.com (2603:1096:400:276::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY0PR03MB7240:EE_|SEZPR03MB7328:EE_
X-MS-Office365-Filtering-Correlation-Id: 06043cc9-30ed-477d-f5d5-08dbaec54e42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a/iz1bUad+hDe/AH0KkOTm35cc3Y6P2dnbtXV6r7JzRX8r2daacNAsfAjpDDJ5GnTBSOTUhOBr8HmCXbPhTRrQiW1VglypgNRsWJ20OqL+FQ6J1+Yd5hra7gqzimXVIbfx0nFU8AcVZdiw+mD5VBkgRoTbDBxx03c5e/5B/ltyTf3opoBiOV1Dik8LE1sAR1k6yeD3JBBnSFQB+X/B9ScJ1UAGfbZH7YpXfUOIGN+G0XCaVqdRYUt8qlrS25o0AoAtxJpHsECnPsoTnrmK/mbVVG9L8QCqo8FCNWhmA71l7v8gStOCqKYGJlBe8seBrqqKfgAIwA4ESGauqLjJlUsbN1RDoFbcjRPLe77UZ3dJ856Sv5Ww8OC49WwrAtUHH1T43OgnLP3O1s0vdt7pPD0zPLTc97o1rlMpIfdECBYFyELIE+Ad33RDjhd8WGSiGQtMJlCM78AdqDt58PQuCMJRQvP6a9/nSDhHjApUKPqbk//ge9njgaC42oT1QimZ3lnaNCFx4XQ7wyzoZG2YFhu7iXjV4aTRTEMROZoNB8yyeaV7P0umjac/4Rqtb7WRcQBcbwSb3MMihJzAdzF79plOeW1POMfAcwGQK52bwjpmqgAhTc0Bs1w4rWwzayGPCz6PSvyGRtFrbGCoEOHPwnNrhj9qwLDoSAw6sMYd0bB8qnhqiAfrK7RpyhKLMQQ5WnXqSKQ44gNYQbNOzqTbxLJg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY0PR03MB7240.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(346002)(376002)(366004)(136003)(396003)(451199024)(186009)(1800799009)(6486002)(6506007)(6666004)(6512007)(107886003)(478600001)(83380400001)(2906002)(2616005)(26005)(7416002)(66476007)(54906003)(6916009)(41300700001)(66556008)(66946007)(316002)(5660300002)(4326008)(8676002)(8936002)(36756003)(86362001)(31696002)(38100700002)(31686004)(66899024)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0VtbXhNeUtBbS8zbDN4ZUdZTStXU2F2cDdMVnlmRnRtc1FFdWFLVjdWT082?=
 =?utf-8?B?WVZOQlJwOE1MbEZwSWJQbEFnaUE1R0xQbHN3WE4rQ2VFSS9VdHJxQkhrdmFs?=
 =?utf-8?B?cS9PUlpWSHlWTUEzclJtb1FPWU5qV1l3YWt4UXZtYzc5UldhaWVCdHViNmZG?=
 =?utf-8?B?aEJLV054ZzRrS1JYK2lKQjdvcENBYmZtMUJxUzZlaCtKaXFLSEFyM1JLU2hp?=
 =?utf-8?B?TWdNRElBTC9kTkhqcFV3UlZJTDhLWkFMNEFiejVKT1RMV2t3eGIxZEVoNzIw?=
 =?utf-8?B?aXRFYzJrUGZyNUVWMUo1RHpKaGtEZHpOOHBwaW5YUy9qb0VGWWFUdERMU08z?=
 =?utf-8?B?eklqK2QwY0QxL2JuRzdueC9Oa01MN3BudVpmVlA1TVlqOGU1cFNpRTd5Wlhv?=
 =?utf-8?B?S3g0Q0lpZ0NWVjJ3ZVpHbkNYck93NytKRUI0SkRWZUJKaDZwQVF2ZlUvdFBX?=
 =?utf-8?B?QWZYL2Era3NqSHppckRHdnlUWW9iQitvTDJSN25OWUcvbFdEVWozL052VE50?=
 =?utf-8?B?VUdZbFBmOHpJRzRvVFZ5cHRnYVJucForbzBVOGFUYmtPM1hWTGp3S0JaOTV3?=
 =?utf-8?B?OG1nV3l1dm1yRE9HRFl4UlNTcjlSNEo0VjArSlp4SXYxRlNxS0FiM3NWNklM?=
 =?utf-8?B?ajI3VUIxeHNsWDVjc1M5b1pHN0NOeUd1OTBoVUcyT3p5QlNmWEZ2RTArYVF4?=
 =?utf-8?B?UkI3RHFqbERyRWp6aUp2RHZtbjRaeTdEUlp1aUxGU0FPeEhMbmswNUg3VTZh?=
 =?utf-8?B?UUc5dXpMU3k3cjVXVVBsclZtZkFMQy9pMzFLVndJdk1raEVoR0s5OCtQMENn?=
 =?utf-8?B?YVF2ajZRVWQ2MnVHaHc4T3I5aGwwK2hDMWpLR1ljSmJsd055L29lb3o2dURv?=
 =?utf-8?B?dDJ6TE9oZFY5T3JZaXhTaGMrRjZ0cy9MZmRQejlCNVY5bGFiL21wc05JSkkv?=
 =?utf-8?B?WWZoc2w5TXF0czlDV2t3SjlCSzJMYjBhWTZOTDIyTlhSK1BlZjVwQ0o4ZjFz?=
 =?utf-8?B?ME1WbmN6K1hBTXNrYnZOL0JDWkZ2RHIrTCtTRk94aG5ubWJoNkxwZldQYTlE?=
 =?utf-8?B?U3NzSTVoOXBqbkJYTVZ5Mlp6c2lVTnljaWp5NllXWWlZdmo0bm42Skp4RytV?=
 =?utf-8?B?aURuTFc3cXQxbFEzcW5ORTh0dE9keVUraWZGdnFNeFVmT1ZwMTVlcUNBVEg3?=
 =?utf-8?B?SFY2MGZrNnZRMFh1OGMvR21kd2NGK2wrUmtac251c3Z1MDZFM0dzU0JleDFy?=
 =?utf-8?B?TnZEWmNGZ2RBeTgyUVdia051WmFQWVowakQ5Y29NdlVvNzFUcEZkWkNtN3BG?=
 =?utf-8?B?Y3Z6Qzh2VGNHRHZ5V1gvRW9Ddmk5TlNMcnpxeEQ1NGNZZ1hPTWhocjkzVWNH?=
 =?utf-8?B?d25YUEtaUmM4MFpISnpGZk9BRXMza0lVRmRmS1EzWmJOaEZ2WWFNSU1COXUr?=
 =?utf-8?B?V1VweG0vbElpMTFWak5QdUd4VWhaeVJZUzhQK2lrZkxzRysrRC9mOHJkcUIz?=
 =?utf-8?B?R3FQVTdHYkVWcm9MaGlKZEZsMnNwMGNtOFBocDF6UU0zSkhtYVZkaEV5T3Ru?=
 =?utf-8?B?TVkvQWNMNnVjaDN6Qnh5NHNoTWkxVkpCQWlnaldKU2Z3dEc0NlFIRHhDRzJl?=
 =?utf-8?B?a2MwVTdqOGxsallrVEpjRXpXTjNjd2dDNnFUMng0cHRzMjEwTG9aYmFwN1NG?=
 =?utf-8?B?R2wwREZwRlBwb294Tld0VlJsTVMydmo0MGlPakRGQitGK0Y3aHEvUmhIYkh2?=
 =?utf-8?B?dXdFV1pWOFk5Wm9ic0dUaVlYMndYMHBEMUd1UG1Jc0twdjh2bEhFazQxTmh5?=
 =?utf-8?B?T2JKSnM2MksxSzkzLzdYSzlPNG15YU1hVTI5dHorc050eGRJNnJMYXMweW9T?=
 =?utf-8?B?WjZZSUZORzU2bkdyNXpWbWR6RDdQOWZIS2NMemhtRkdNRVRiOG9BdGMya1Zn?=
 =?utf-8?B?VG5UNTIrZlZud1gzUDdzaWdqOHBKdExmNE9wYWdWUUwybkNSTjFvSkhCQSt3?=
 =?utf-8?B?NjJxeEx0ZUl4YXFJYm9TQnpyTkVpQkhQd0NiajE0cUUzNHVrb1M5REdvSVl2?=
 =?utf-8?B?NjlWLzBzd1lFMTZ3a0l2UWxvdGlmNFBxZjg3R0NCMXpsYUtuTUwwY1MrbG10?=
 =?utf-8?B?c0pWZ3liTURlVC9ua3htM1h2NWdBamN0V1pVWDBmM096a0RMZy9SV3NMZWVP?=
 =?utf-8?B?UFE9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06043cc9-30ed-477d-f5d5-08dbaec54e42
X-MS-Exchange-CrossTenant-AuthSource: TY0PR03MB7240.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 10:37:45.0969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OJn38tD7iJBMlBe5dd3MMNkBlklnclbog4JfkPUuG525AYS5fDYlRrcNfjFitkWxR9gwKXLDxDBqO9S8hIzbXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7328
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

在 2023/9/1 16:02, Sean Young 写道:
> On Thu, Aug 31, 2023 at 08:13:22PM +0800, Zelong Dong wrote:
>> 在 2023/8/29 15:39, Sean Young 写道:
>>> On Fri, Aug 25, 2023 at 07:53:08PM +0800, zelong dong wrote:
>>>> From: Zelong Dong<zelong.dong@amlogic.com>
>>>>
>>>> Meson IR Controller supports hardware decoder in Meson-S4 and later
>>>> SoC. So far, protocol NEC could be decoded by hardware decoder.
>>> On Meson-S4, only the hardware decoder for NEC can be used using this
>>> driver. Does the Meson-S4 hardware support software decoding? If
>>> software decoding could be used, then any protocol could be supported,
>>> not just NEC.
>>>
>>> Also, out of interest, is there are documentation available for this
>>> hardware?
>>>
>>> Thanks,
>>>
>>> Sean
>>>
>> Yes, IR driver still supports SW decoding on Meson-S4. The decode mode could
>> be changed by 'support_hw_decoder'.
> 
> This requires changing the source code, it cannot be done at runtime.
> 
>> If IR Controller works in SW decoding, driver will be registered by
>> RC_DRIVER_IR_RAW and allows all protocol.
>> Otherwise, driver will be registered by RC_DRIVER_SCANCODE and only allows
>> NEC.
>>
>> 489         if (ir->rc->driver_type == RC_DRIVER_IR_RAW) {
>> 490                 ir->rc->allowed_protocols = RC_PROTO_BIT_ALL_IR_DECODER;
>> 491                 ir->rc->rx_resolution = MESON_RAW_TRATE;
>> 492                 ir->rc->min_timeout = 1;
>> 493                 ir->rc->timeout = IR_DEFAULT_TIMEOUT;
>> 494                 ir->rc->max_timeout = 10 * IR_DEFAULT_TIMEOUT;
>> 495         } else if (ir->rc->driver_type == RC_DRIVER_SCANCODE) {
>> 496                 ir->rc->allowed_protocols = RC_PROTO_BIT_NEC;
>> 497                 ir->rc->change_protocol = meson_ir_hw_decoder_init;
>> 498         }
> 
> There are other drivers too which can do hardware decoding and software
> decoding. Ideally we should have a mechanism to switch between them at
> runtime, but as-is rc-core does not provide for this.
Anything else I should update for this patchset?
> 
>> Do you get Meson-S4 datasheet? Please refer to chapter 13.5 Infrared Remote.
> 
> I did not get it, unfortunately. Any help would be appreciated, thanks.
Sorry, this document is not public and I don't have permission to share 
with you. Perhaps you could apply to xiaohong.zou@amlogic.com for 
Meson-S4 datasheet.
> 
> Other than that, the driver does look fine. Nothing to hold up merging for.
> I'll apply it when I can.
> 
> Thanks,
> 
> Sean

