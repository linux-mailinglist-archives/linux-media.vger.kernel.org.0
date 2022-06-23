Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4D0D557390
	for <lists+linux-media@lfdr.de>; Thu, 23 Jun 2022 09:07:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229683AbiFWHHT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Jun 2022 03:07:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230042AbiFWHHE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Jun 2022 03:07:04 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2085.outbound.protection.outlook.com [40.107.20.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 458AA457AF;
        Thu, 23 Jun 2022 00:06:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y5rULwT1IdwwnhvepYnR4pYct/YzhZBD+yVK/Av9MFMwM0zR9EBO4+e2X7L/TCr2phYnkscCZgND3FhFGPTvf/PoYe86mbIR2s8JB6KwIH6khGkiG6PKA6dcjUjb3f90dC3sVVCNyATU6kaEwIKi2Nus6y2weAsCj6eE5EkvwAijWSi4A/GQ/TNBRasLCTNGyflBzu/xNsFVdeo7AMAhQOGUyF3MRwiEKBtjAw8YUiLJhKfFSHx7ESkLnlAZWxaAiIiPMbL2lqzd9PInWJhFbLUaItqjY2l1ts8mmzZZOcMW53xtqL26nikIt6TaxljgJGFF7tW+I7RWevPDvbsBaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=btp3N/1Xyp4/Hd+ttWTHP+XlQjvMBYgVeKcLI7Mx3ic=;
 b=QiBhYCJ2btvyfGDGnNeFG9oHxiGqyYiiCPb3T3vYW+HVe90mdChZP0qn2Z3s1khC+PeoCmv0lGd8Ys3FJ660SHvDQAozQXlz9B01LaGrT0ewSbK70D+17875O3e5rxQsQT6oQAUaHQU4xL+WoaCiixCkizqaufI4Q1W6Yu09b7WXD3sLb3Zr0Ti3wDWyAXe8O8HHZIOi4JSIzFTdkHh6Gx+1E0obebJquAH8ifdRUPc5T74i7x/Rryxlw880ycSSgGbGL52vshPSTG3wRavcRW3uAnvkvHRqQNszZHatNCLlpxQDExQmIhW4FPxSRlo+GS3BYq86p5J/LPRo6qqH6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=btp3N/1Xyp4/Hd+ttWTHP+XlQjvMBYgVeKcLI7Mx3ic=;
 b=hFlCtcnCkFPA9f5mOlngzv+0Q1/xd2CyA4Y55T9tIl3rTXOirw4DxSUNHIAMYfHhhvb+dFe8RlwQY0XWkSaNPz460zV72x8WUXHCDoVvIQUmfHdExIkrUv8mZsxuA6L30mNoFRGXfuOxXY6hNiPNx4p4m155q0hdJ4CA6jGaGO4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by AM0PR04MB4932.eurprd04.prod.outlook.com (2603:10a6:208:c5::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Thu, 23 Jun
 2022 07:06:54 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::9127:3fe0:f694:9485]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::9127:3fe0:f694:9485%5]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 07:06:54 +0000
Message-ID: <12c4eb80-cfa3-a7d2-21fc-de77ddcf5798@oss.nxp.com>
Date:   Thu, 23 Jun 2022 09:06:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v5 8/9] media: dw100: Add i.MX8MP dw100 dewarper driver
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, tomi.valkeinen@ideasonboard.com,
        robh+dt@kernel.org, nicolas@ndufresne.ca,
        alexander.stein@ew.tq-group.com, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220503093925.876640-1-xavier.roumegue@oss.nxp.com>
 <20220503093925.876640-9-xavier.roumegue@oss.nxp.com>
 <YqkRiwH8iLXnbuqZ@pendragon.ideasonboard.com>
From:   "Xavier Roumegue (OSS)" <xavier.roumegue@oss.nxp.com>
In-Reply-To: <YqkRiwH8iLXnbuqZ@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P251CA0026.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:102:b5::30) To PAXPR04MB8703.eurprd04.prod.outlook.com
 (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e233ddd9-e0ee-4ad4-8d2b-08da54e6f40c
X-MS-TrafficTypeDiagnostic: AM0PR04MB4932:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB49326019AE61089903DCAF2BBAB59@AM0PR04MB4932.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YHxPgBjuUKC+StOTX9cgo4j8hVNy+nQ3w1n+m34J8SMNDj6sgZEsK+cVC7VjNcq5wAuTRmlaH8CKZKCoNSABIYpp7KT2wCMgs1w9npe1hf5TdKZPVrFWttxLf/yIOMPX9IzAbNif48kDbwZ1zta/eU3TiA00VWYhlHmT9j75lpTfqejqw4Eb3jDZMJzwlKE1mloFBKMkibciQUgD2kNFDwVMyKciPMwzELgGC9boIJc13nkHQ1IgLMl8XvjEI8DlzCvyrz7ux4dxKSqrpy57PeuS/71gV5ZJ5JY1PtKbMHlzL8IzvUV9sCE8fg42ZZavFO6rd7ix4DRLabhg3oEIrEeHIQysCHV2+7SnVh2qF2utLLn0ux5AcXpYmPm9qQUfBbDiUY7LQ9lFEnv46wmDU8ieIq0A29B8JPa85/hQH7Hkf3tMQr49DcS+HeoQbnS/NEi73nKDRfBleSYJTCBvY9q3ML86MbvzNT2DiA9bjaa66YTWaHphfNKkuSHzTjZ0jWdWLrYvJAl7+v2Qn7jSq/e+pQw1scXrFgagKVNTl5hOBW9SUbZj/G5z+k/Vgvw3yQn6whHWyZJ3r5L1TCt9PO8opSlyF7Aj8BY8/Qnc2QVPTpf2CpM8HQoIVsDLDVdoBjXtT1JUMKP5vWJ3ZgW1TC0iwC+iKI8mlGlaaxpueHxr1Ig33Yv7xWEWyys8jPhD9vAJt4P8a8yrhYVrmjHHz98MFAdT5284wLBw3xFFKAP0Y8GY79EnUEZKAQTQdS8lrh4/CMCDbJo9IJ4qtzjwaea3Ib2bOzJ4EHO5DoJ0/TzfuZ7/Lq3fvu+A1E0iSPSKoTo/R2h0s8Z6nX8ZS5m0TA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(136003)(376002)(346002)(396003)(39860400002)(41300700001)(2616005)(186003)(6666004)(7416002)(4326008)(316002)(66946007)(8676002)(31686004)(66556008)(6916009)(66476007)(83380400001)(30864003)(86362001)(31696002)(53546011)(52116002)(6506007)(5660300002)(6512007)(478600001)(6486002)(38100700002)(2906002)(966005)(8936002)(43740500002)(45980500001)(559001)(579004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHFQYmZLNGE4OUxFS3B3RVJvbWpsbHlnbWE5OHpiS0hWRy9wN25kamlYSVla?=
 =?utf-8?B?ZHBRTGZIU0dLZDV5eG9MZFR3WHBDTnh5TURzWEpZYkRqRlhOUWVGVHBxVy9t?=
 =?utf-8?B?dzNCS3dtRnBUZWUyM1FHZ08zdmt6NHJ4VjhYM0dTaVo2ZENWQTVOUjZ6bjFZ?=
 =?utf-8?B?VnljcjhuYnRSTklvUDJOOGNsZ0xsMTMxbTZrWjJsSWtqS2xGTjh2TG43bzhX?=
 =?utf-8?B?TVpRdUVhbFkrMXZub0QwdHlQUlFJTEk4ZEVTd0cxcEtrU2RqaG9ubSttUGxG?=
 =?utf-8?B?OXRGb1Y2c0VOa3hoMFhESXFsWHRURFJsN2s4Z1R4WUVrRHBNYVFEWFV3eTdj?=
 =?utf-8?B?VzYxUHJtbnU5OEpGSWxndWNUVlltemR6ZVpOejlMR1hZMXh6dkhzdTdjVjFB?=
 =?utf-8?B?WW4vcGNhZjVpQUw1eGdNbHJMUk5JUGhNeU9xRVd4dWwrNHBMMVd4VENMUjNU?=
 =?utf-8?B?dS9SZGtacHB1T3FnOVdXR203RkhudWxLTjZOc1JFWS9JM29hTzl2RFpZUnRM?=
 =?utf-8?B?bVR4SjFuTmxoOFhydEhPSVQ1bkRiSG5Ya0xMeHQwbUZ3dXg1UUJqVTA0UldT?=
 =?utf-8?B?S0x5VDV0emhIc1BNQzM5RUFxdCtDSTNPRFEycGpobXo2WExGSkE5VVBFUWRn?=
 =?utf-8?B?TFBxRjk5MzYxZUIvWnMzeWQxUDB1OTczcW9YZzlHSjZmR0NMSlJpT3FKSEFn?=
 =?utf-8?B?VkoySEROWGRKNmdwM3NrU3pjN2V3Uk9SemtYeno3Tkg4K1VnRlBMRDRJbjZa?=
 =?utf-8?B?NjNPcWFSaWNuUmxKTW9oNUZtRXIwUzVJbEhvRVRIVVcxWGJpUXRzVWVMb1ND?=
 =?utf-8?B?dzFHTlZEN1dSdUw2RXFqZjc0R1I1RGU1TlJlQ1BxbjVQaDFJdnpTWEZCcGhI?=
 =?utf-8?B?bXZkN0gzdC9vdWtLb2hGclRlQS93eVBjUGFWZnJLNVZEVjRKNk5xSHprL3pN?=
 =?utf-8?B?QTJKb2Yxc09ORE16TFVrcnczYk1xYkx3MnM4akswcE5iaEp0RmNrclpQMTFr?=
 =?utf-8?B?b0ZtbVBQakljZUlzT1NKRVEraTkxZTRDNFhMdmoxSkJ2ZVVCVVdZVDlaLzY4?=
 =?utf-8?B?dmxNc01oSkRYU3pUeDNyY3h6dHRlVVdrSEdlcmJubEZUUWwwdWhIZkdFbStl?=
 =?utf-8?B?R3pHZFZVLzJ0V1RWSE0xRk1GQTZ3cnkxVzUyZm00T0lwUW9ob1lEZUI0SGpI?=
 =?utf-8?B?MmJmaUpBbUNRODVyWVRtVzAwZFZ0ZTYzMUFVVU84T1poT0hxMDVTYlNYdHpw?=
 =?utf-8?B?eFlESkdSZ3BDV3JLUmxrdndTV3Fia0dlb2kvQWFXUGlPdW9Bc3FUdG9leGM4?=
 =?utf-8?B?eE1DbmZZVFhVRWE5Vkl5WDREcHQ5Y1kybnlWT2s5djE4SC9ySFc2VFdSK29D?=
 =?utf-8?B?RW0zQ2hSYmJPVTBqVU9DODQzajJXS3MzS1k3Yy8xQmdCNzV5K0oxS21IbXVJ?=
 =?utf-8?B?eGc0ZGhEM3JHQmd6NUcwTGt6RXpVSlYvbjNqVG1PN3AzTUM1ZDNTM1A2MXFy?=
 =?utf-8?B?TEVNWHpnQ1VnenlTRTU0N2xmQThDTVIwM1l5UzZlT0NNM1FtcXFpWFN0dmNj?=
 =?utf-8?B?dy84MFFNdW9ZTEEzVmZuN2RvYVFBY1RmMVpUdWw3VDgwUXl1c0I2K0VQT2xw?=
 =?utf-8?B?MFRoODNoRnd3SzFxdk1ERGtCREM4aTFhWkh5U1ZuYzhMMHM4WGVZdVlXZ1lC?=
 =?utf-8?B?QWtHZFJBd3QxUThEYzRaQzJNWjVWblpNY1pMWFhMdzg2aWdVWlRyT2RsSWMx?=
 =?utf-8?B?NHpqNlpEUkpaZ2pOT3ptRkNEeUliTWExd2JUaWowZVFtb1dCa0pOOW9sOHY2?=
 =?utf-8?B?cytzMGNsMC9EQnpsbDhHUFhMUm1kMmxxMk5PWm9mLzdvOG5YWGFrR3ByZUFx?=
 =?utf-8?B?UHIyZ3Z2WGZiSXV3bUVobGtlanlCOWFlQzF2RngyYU9jdk95S3hzVHVkaTNp?=
 =?utf-8?B?bWxDWHVVL0drcVFXRkNxa3VmYW5McS8zNUhaRWFKeGtjYTRSaU5wWFZuZytI?=
 =?utf-8?B?N3B0bWIwOXU5VDBWQWRrbmlYWW1NeEd0UFVrU1J2L01HOHZCc2lLSUVHUGwr?=
 =?utf-8?B?aGQ5dUZwamNUQlRsRmNmd2h1SEJYNDJmMGs1cjBmTFZlTE9KWUNHZUY0T2ZU?=
 =?utf-8?B?MXk1OEhGVEhqRm9XSytGR3YxMmZOUHBpMTNySlJKNnhBVW0wckx2ZWw1VTlT?=
 =?utf-8?B?clpEOGc2YkJHVmxoRE9iUzZqc3BMOFNBMWZDUnovYlVXcWhmaTJRZ0ZPNGdp?=
 =?utf-8?B?NmtvQ2xSMnFFSHhNdmNMSDFtQ3ovVCtZY2pNNWZyUlhncVREWHVxTHQvOVJI?=
 =?utf-8?B?bG5TeWRiS0xRc0JYcFBlV2hUWFpxVUVxVEI2TkdmT1A3akF0M0o0QkpBN3lT?=
 =?utf-8?Q?lB7sT+l6xcJNPtPAzpoayKwl4V6jPu80IDzZdcFEnfHa/?=
X-MS-Exchange-AntiSpam-MessageData-1: r/NDiKJdSB2tmyz+p6o0AvPZCnJW43FomJ4=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e233ddd9-e0ee-4ad4-8d2b-08da54e6f40c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 07:06:54.3953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VXv5WG0Nqh180LhjgReZYHMmTvjkP6dWFIbIsRkYHoKBlRuDscus7RAQvnLDnNCPDlETZobSc6NsNyv8n4MKTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4932
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,PDS_OTHER_BAD_TLD,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,


On 6/15/22 00:54, Laurent Pinchart wrote:
> Hi Xavier,
> 
> Thank you for the patch.
> 
> On Tue, May 03, 2022 at 11:39:24AM +0200, Xavier Roumegue wrote:
>> Add a V4L2 mem-to-mem driver for the Vivante DW100 Dewarp Processor IP
>> core found on i.MX8MP SoC.
>>
>> The processor core applies a programmable geometrical transformation on
>> input image to correct distorsion introduced by lenses.
> 
> s/input image/input images/
> 
>> The transformation function is exposed as a grid map with 16x16 pixel
>> macroblocks indexed using X, Y vertex coordinates.
>>
>> The dewarping map can be set from application through dedicated a v4l2
> 
> s/dedicated a v4l2/a dedicated V4L2/
> 
>> control. If not set or invalid, the driver computes an identity map
>> prior to start the processing engine.
> 
> s/start/starting/
> 
>>
>> The driver supports scaling, cropping and pixel format conversion.
>>
>> Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
>> ---
>>   drivers/media/platform/nxp/Kconfig            |    1 +
>>   drivers/media/platform/nxp/Makefile           |    1 +
>>   drivers/media/platform/nxp/dw100/Kconfig      |   16 +
>>   drivers/media/platform/nxp/dw100/Makefile     |    3 +
>>   drivers/media/platform/nxp/dw100/dw100.c      | 1782 +++++++++++++++++
>>   drivers/media/platform/nxp/dw100/dw100_regs.h |  118 ++
>>   6 files changed, 1921 insertions(+)
>>   create mode 100644 drivers/media/platform/nxp/dw100/Kconfig
>>   create mode 100644 drivers/media/platform/nxp/dw100/Makefile
>>   create mode 100644 drivers/media/platform/nxp/dw100/dw100.c
>>   create mode 100644 drivers/media/platform/nxp/dw100/dw100_regs.h
>>
>> diff --git a/drivers/media/platform/nxp/Kconfig b/drivers/media/platform/nxp/Kconfig
>> index a0810df751dc..e5085e5e585b 100644
>> --- a/drivers/media/platform/nxp/Kconfig
>> +++ b/drivers/media/platform/nxp/Kconfig
>> @@ -52,4 +52,5 @@ config VIDEO_MX2_EMMAPRP
>>   	    memory to memory. Operations include resizing and format
>>   	    conversion.
>>   
>> +source "drivers/media/platform/nxp/dw100/Kconfig"
>>   source "drivers/media/platform/nxp/imx-jpeg/Kconfig"
>> diff --git a/drivers/media/platform/nxp/Makefile b/drivers/media/platform/nxp/Makefile
>> index efc38c6578ce..22ba28ac6d63 100644
>> --- a/drivers/media/platform/nxp/Makefile
>> +++ b/drivers/media/platform/nxp/Makefile
>> @@ -1,5 +1,6 @@
>>   # SPDX-License-Identifier: GPL-2.0-only
>>   
>> +obj-y += dw100/
>>   obj-y += imx-jpeg/
>>   
>>   obj-$(CONFIG_VIDEO_IMX_MIPI_CSIS) += imx-mipi-csis.o
>> diff --git a/drivers/media/platform/nxp/dw100/Kconfig b/drivers/media/platform/nxp/dw100/Kconfig
>> new file mode 100644
>> index 000000000000..86ccac6fd120
>> --- /dev/null
>> +++ b/drivers/media/platform/nxp/dw100/Kconfig
>> @@ -0,0 +1,16 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +
>> +config VIDEO_DW100
>> +	tristate "NXP i.MX DW100 dewarper"
>> +	depends on V4L_MEM2MEM_DRIVERS
>> +	depends on VIDEO_DEV
>> +	depends on ARCH_MXC || COMPILE_TEST
>> +	select VIDEOBUF2_DMA_CONTIG
>> +	select V4L2_MEM2MEM_DEV
>> +	help
>> +	  DW100 is a memory-to-memory engine performing geometrical
>> +	  transformation on source image through a programmable dewarping map.
> 
> s/source image/source images/
> 
>> +
>> +	  To compile this driver as a module, choose M here: the module
>> +	  will be called dw100.
>> +
>> diff --git a/drivers/media/platform/nxp/dw100/Makefile b/drivers/media/platform/nxp/dw100/Makefile
>> new file mode 100644
>> index 000000000000..49db80589e9a
>> --- /dev/null
>> +++ b/drivers/media/platform/nxp/dw100/Makefile
>> @@ -0,0 +1,3 @@
>> +# SPDX-License-Identifier: GPL-2.0+
>> +
>> +obj-$(CONFIG_VIDEO_DW100) += dw100.o
>> diff --git a/drivers/media/platform/nxp/dw100/dw100.c b/drivers/media/platform/nxp/dw100/dw100.c
>> new file mode 100644
>> index 000000000000..869ca12e0bcd
>> --- /dev/null
>> +++ b/drivers/media/platform/nxp/dw100/dw100.c
>> @@ -0,0 +1,1782 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * DW100 Hardware dewarper
>> + *
>> + * Copyright 2022 NXP
>> + * Author: Xavier Roumegue (xavier.roumegue@oss.nxp.com)
>> + *
>> + */
>> +
>> +#include <linux/clk.h>
>> +#include <linux/debugfs.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/minmax.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/pm_runtime.h>
>> +
>> +#include <media/v4l2-ctrls.h>
>> +#include <media/v4l2-device.h>
>> +#include <media/v4l2-event.h>
>> +#include <media/v4l2-ioctl.h>
>> +#include <media/v4l2-mem2mem.h>
>> +#include <media/videobuf2-dma-contig.h>
>> +
>> +#include <uapi/linux/dw100.h>
>> +
>> +#include "dw100_regs.h"
>> +
>> +#define DRV_NAME "dw100"
>> +
>> +#define MIN_W 176
>> +#define MIN_H 144
>> +#define MAX_W 4096
>> +#define MAX_H 3072
>> +#define ALIGN_W 3
>> +#define ALIGN_H 3
> 
> Please add a DW100_ prefix to these macros to avoid possible future
> namespace clashes.
> 
>> +
>> +#define DW100_BLOCK_SIZE 16
>> +
>> +#define DW100_MIN_LUT_NELEMS		(((MIN_W / DW100_BLOCK_SIZE) + 1) \
>> +					 * ((MIN_H / DW100_BLOCK_SIZE) + 1))
>> +
>> +#define DW100_MAX_LUT_NELEMS		(((MAX_W / DW100_BLOCK_SIZE) + 1) \
>> +					 * ((MAX_H / DW100_BLOCK_SIZE) + 1))
>> +
>> +/*
>> + * 16 controls have been reserved for this driver for future extension, but
>> + * let's limit the related driver allocation to the effective number of controls
>> + * in use.
>> + */
>> +#define DW100_MAX_CTRLS 1
>> +#define DW100_CTRL_DEWARPING_MAP 0
> 
> Aligning all macros could make this more readable.
> 
>> +
>> +static unsigned int debug;
>> +module_param(debug, uint, 0644);
>> +MODULE_PARM_DESC(debug, "Activate debug info");
>> +
>> +#define dprintk(lvl, dev, fmt, arg...) \
>> +	v4l2_dbg(lvl, debug, &(dev)->v4l2_dev, "%s: " fmt, __func__, ## arg)
> 
> I'd just use dev_dbg() and drop the debug module parameter. Up to you.
> 
>> +
>> +enum {
>> +	V4L2_M2M_SRC = 0,
>> +	V4L2_M2M_DST = 1,
>> +};
>> +
>> +enum {
>> +	V4L2_M2M_CAPTURE = 1,
> 
> BIT(0)
> 
>> +	V4L2_M2M_OUTPUT = 2,
> 
> and BIT(1) to emphesize they're bitflags.
> 
>> +};
> 
> Those names are also too generic, a DW100_ prefix would fix that. I'd
> name the first two DW100_QUEUE_SRC and DW100_QUEUE_DST, and the last two
> DW100_FMT_CAPTURE and DW100_FMT_OUTPUT.
> 
>> +
>> +static struct dw100_fmt {
> 
> static const
> 
>> +	u32 fourcc;
>> +	int depth;
>> +	u32 types;
>> +	u32 reg_format;
>> +	bool reg_swap_uv;
>> +} formats[] = {
>> +	{
>> +		.fourcc = V4L2_PIX_FMT_NV16,
>> +		.depth = 16,
>> +		.types = V4L2_M2M_OUTPUT | V4L2_M2M_CAPTURE,
>> +		.reg_format = DW100_DEWARP_CTRL_FORMAT_YUV422_SP,
>> +		.reg_swap_uv = false,
>> +	}, {
>> +		.fourcc = V4L2_PIX_FMT_NV61,
>> +		.depth = 16,
>> +		.types = V4L2_M2M_CAPTURE,
>> +		.reg_format = DW100_DEWARP_CTRL_FORMAT_YUV422_SP,
>> +		.reg_swap_uv = true,
>> +	}, {
>> +		.fourcc = V4L2_PIX_FMT_YUYV,
>> +		.depth = 16,
>> +		.types = V4L2_M2M_OUTPUT | V4L2_M2M_CAPTURE,
>> +		.reg_format = DW100_DEWARP_CTRL_FORMAT_YUV422_PACKED,
>> +		.reg_swap_uv = false,
>> +	}, {
>> +		.fourcc = V4L2_PIX_FMT_UYVY,
>> +		.depth = 16,
>> +		.types = V4L2_M2M_OUTPUT | V4L2_M2M_CAPTURE,
>> +		.reg_format = DW100_DEWARP_CTRL_FORMAT_YUV422_PACKED,
>> +		.reg_swap_uv = true,
>> +	}, {
>> +		.fourcc = V4L2_PIX_FMT_NV12,
>> +		.depth = 12,
>> +		.types = V4L2_M2M_OUTPUT | V4L2_M2M_CAPTURE,
>> +		.reg_format = DW100_DEWARP_CTRL_FORMAT_YUV420_SP,
>> +		.reg_swap_uv = false,
>> +	}, {
>> +		.fourcc = V4L2_PIX_FMT_NV21,
>> +		.depth = 12,
>> +		.types = V4L2_M2M_OUTPUT | V4L2_M2M_CAPTURE,
>> +		.reg_format = DW100_DEWARP_CTRL_FORMAT_YUV420_SP,
>> +		.reg_swap_uv = true,
>> +	},
>> +};
>> +
>> +static inline int to_dw100_fmt_type(enum v4l2_buf_type type)
>> +{
>> +	if (V4L2_TYPE_IS_OUTPUT(type))
>> +		return V4L2_M2M_OUTPUT;
>> +	else
>> +		return V4L2_M2M_CAPTURE;
>> +}
>> +
>> +#define NUM_FORMATS ARRAY_SIZE(formats)
> 
> I'd drop the macro and use ARRAY_SIZE(formats) directly in the two
> locations where NUM_FORMATS is used. Same for NUM_CTRLS.
> 
>> +
>> +static struct dw100_fmt *find_pixel_format(u32 pixel_format, int fmt_type)
> 
> static const struct
> 
> dw100_ prefix for the function name. Same below where applicable.
> 
>> +{
>> +	struct dw100_fmt *fmt;
> 
> const
> 
> (and where applicable as indicated by the compiler in the rest of the
> code)
> 
> It's often a good practice to move declaration of variables to the scope
> they're used in.
> 
>> +	unsigned int k;
> 
> Any reason not to use the customary "i" variable ?
> 
>> +
>> +	for (k = 0; k < NUM_FORMATS; k++) {
>> +		fmt = &formats[k];
>> +		if (fmt->fourcc == pixel_format && fmt->types & fmt_type)
>> +			return fmt;
>> +	}
>> +
>> +	return NULL;
>> +}
>> +
>> +static struct dw100_fmt *find_format(struct v4l2_format *f)
>> +{
>> +	return find_pixel_format(f->fmt.pix.pixelformat,
>> +			      to_dw100_fmt_type(f->type));
>> +}
>> +
>> +static inline u32 dw100_bytesperline(struct dw100_fmt *fmt, u32 width)
> 
> You can drop the inline and let the compiler decide.
> 
>> +{
>> +	switch (fmt->reg_format) {
>> +	case DW100_DEWARP_CTRL_FORMAT_YUV422_SP:
>> +	case DW100_DEWARP_CTRL_FORMAT_YUV420_SP:
>> +		return width;
>> +	case DW100_DEWARP_CTRL_FORMAT_YUV422_PACKED:
>> +	default:
>> +		return (fmt->depth * width) >> 3;
>> +	}
>> +}
>> +
>> +static inline u32 dw100_sizeimage(struct dw100_fmt *fmt, u32 width, u32 height)
>> +{
>> +	return (fmt->depth * width * height) >> 3;
>> +}
>> +
>> +struct dw100_device {
>> +	struct platform_device *pdev;
>> +	struct v4l2_m2m_dev	*m2m_dev;
>> +	struct v4l2_device	v4l2_dev;
>> +	struct video_device	vfd;
>> +#ifdef CONFIG_MEDIA_CONTROLLER
>> +	struct media_device	mdev;
>> +#endif
>> +	struct mutex		vfd_mutex;
>> +	spinlock_t		irqlock;
>> +	void __iomem		*mmio;
>> +	struct clk_bulk_data	*clks;
>> +	int			num_clks;
>> +	struct dentry		*debugfs_root;
>> +};
> 
> Could you please move all structure definitions before the functions ?
> 
>> +
>> +static int dw100_dump_regs(struct dw100_device *dw_dev)
>> +{
>> +#define __DECLARE_REG(x) { #x, x }
>> +	int i;
>> +	struct reg_desc {
>> +		const char * const name;
>> +		unsigned int addr;
>> +	} dw100_regs[] = {
>> +		__DECLARE_REG(DW100_DEWARP_ID),
>> +		__DECLARE_REG(DW100_DEWARP_CTRL),
>> +		__DECLARE_REG(DW100_MAP_LUT_ADDR),
>> +		__DECLARE_REG(DW100_MAP_LUT_SIZE),
>> +		__DECLARE_REG(DW100_MAP_LUT_ADDR2),
>> +		__DECLARE_REG(DW100_MAP_LUT_SIZE2),
>> +		__DECLARE_REG(DW100_SRC_IMG_Y_BASE),
>> +		__DECLARE_REG(DW100_SRC_IMG_UV_BASE),
>> +		__DECLARE_REG(DW100_SRC_IMG_SIZE),
>> +		__DECLARE_REG(DW100_SRC_IMG_STRIDE),
>> +		__DECLARE_REG(DW100_DST_IMG_Y_BASE),
>> +		__DECLARE_REG(DW100_DST_IMG_UV_BASE),
>> +		__DECLARE_REG(DW100_DST_IMG_SIZE),
>> +		__DECLARE_REG(DW100_DST_IMG_STRIDE),
>> +		__DECLARE_REG(DW100_DST_IMG_Y_SIZE1),
>> +		__DECLARE_REG(DW100_DST_IMG_UV_SIZE1),
>> +		__DECLARE_REG(DW100_SRC_IMG_Y_BASE2),
>> +		__DECLARE_REG(DW100_SRC_IMG_UV_BASE2),
>> +		__DECLARE_REG(DW100_SRC_IMG_SIZE2),
>> +		__DECLARE_REG(DW100_SRC_IMG_STRIDE2),
>> +		__DECLARE_REG(DW100_DST_IMG_Y_BASE2),
>> +		__DECLARE_REG(DW100_DST_IMG_UV_BASE2),
>> +		__DECLARE_REG(DW100_DST_IMG_SIZE2),
>> +		__DECLARE_REG(DW100_DST_IMG_STRIDE2),
>> +		__DECLARE_REG(DW100_DST_IMG_Y_SIZE2),
>> +		__DECLARE_REG(DW100_DST_IMG_UV_SIZE2),
>> +		__DECLARE_REG(DW100_SWAP_CONTROL),
>> +		__DECLARE_REG(DW100_VERTICAL_SPLIT_LINE),
>> +		__DECLARE_REG(DW100_HORIZON_SPLIT_LINE),
>> +		__DECLARE_REG(DW100_SCALE_FACTOR),
>> +		__DECLARE_REG(DW100_ROI_START),
>> +		__DECLARE_REG(DW100_BOUNDARY_PIXEL),
>> +		__DECLARE_REG(DW100_INTERRUPT_STATUS),
>> +		__DECLARE_REG(DW100_BUS_CTRL),
>> +		__DECLARE_REG(DW100_BUS_CTRL1),
>> +		__DECLARE_REG(DW100_BUS_TIME_OUT_CYCLE),
>> +	};
>> +
>> +	for (i = 0; i < ARRAY_SIZE(dw100_regs); i++) {
>> +		dev_info(&dw_dev->pdev->dev, "%s: %#x\n",
>> +			 dw100_regs[i].name,
>> +			 readl(dw_dev->mmio + dw100_regs[i].addr));
> 
> readl()/writel() wrappers would be nice, something along the lines of
> 
> static inline u32 dw100_read(struct dw100_device *dw_dev, u32 reg)
> {
> 	return readl(dw_dev->mmio + reg);
> }
> 
> static inline void dw100_write(struct dw100_device *dw_dev, u32 reg, u32 val)
> {
> 	write(val, dw_dev->mmio + reg);
> }
> 
>> +	}
> 
> As this is read through debugfs, I recommend using the seq_file API to
> dump the registers to the debugfs file instead of the kernel log.
> 
>> +
>> +	return 0;
>> +}
>> +
>> +struct dw100_q_data {
>> +	unsigned int		width;
>> +	unsigned int		height;
>> +	unsigned int		bytesperline;
>> +	unsigned int		sizeimage;
>> +	unsigned int		sequence;
>> +	struct dw100_fmt	*fmt;
>> +	struct v4l2_rect	crop;
>> +};
>> +
>> +struct dw100_ctx {
>> +	struct v4l2_fh			fh;
>> +	struct dw100_device		*dw_dev;
>> +	struct v4l2_ctrl_handler	hdl;
>> +	struct v4l2_ctrl		*ctrls[DW100_MAX_CTRLS];
>> +
>> +	/* Look Up Table for pixel remapping */
>> +	unsigned int			*map;
>> +	dma_addr_t			map_dma;
>> +	size_t				map_size;
>> +	unsigned int			map_width;
>> +	unsigned int			map_height;
>> +
>> +	/* Related colorspace properties propagated from input to output */
>> +	enum v4l2_colorspace	colorspace;
>> +	enum v4l2_xfer_func	xfer_func;
>> +	enum v4l2_ycbcr_encoding ycbcr_enc;
>> +	enum v4l2_quantization	quant;
>> +
>> +	/* Source and destination queue data */
>> +	struct dw100_q_data   q_data[2];
>> +};
>> +
>> +static inline struct dw100_ctx *file2ctx(struct file *file)
>> +{
>> +	return container_of(file->private_data, struct dw100_ctx, fh);
>> +}
>> +
>> +static struct dw100_q_data *get_q_data(struct dw100_ctx *ctx,
>> +				       enum v4l2_buf_type type)
>> +{
>> +	if (type == V4L2_BUF_TYPE_VIDEO_OUTPUT)
>> +		return &ctx->q_data[V4L2_M2M_SRC];
>> +	else
>> +		return &ctx->q_data[V4L2_M2M_DST];
>> +}
>> +
>> +static u32 dw100_get_n_vertices_from_length(u32 length)
>> +{
>> +	return DIV_ROUND_UP(length, DW100_BLOCK_SIZE) + 1;
>> +}
>> +
>> +static u16 dw_map_convert_to_UQ12_4(u32 a)
> 
> s/dw_/dw100_/ (and where applicable below)
> s/UQ/uq/
> 
>> +{
>> +	return (u16)((a & 0xfff) << 4);
>> +}
>> +
>> +static u32 dw_map_format_coordinates(u16 xq, u16 yq)
>> +{
>> +	return (u32)((yq << 16) | xq);
>> +}
>> +
>> +static u32 *dw100_get_user_map(struct dw100_ctx *ctx)
>> +{
>> +	struct v4l2_ctrl *ctrl = ctx->ctrls[DW100_CTRL_DEWARPING_MAP];
>> +
> 
> No need for a blank line.
> 
>> +	size_t user_map_size;
>> +
>> +	if (!ctrl) {
>> +		v4l2_err(&ctx->dw_dev->v4l2_dev, "Mapping control not found !");
>> +		return NULL;
>> +	}
> 
> I don't think this can ever happen.
> 
>> +
>> +	if (ctrl->elems < DW100_MIN_LUT_NELEMS ||
>> +	    ctrl->elems > DW100_MAX_LUT_NELEMS)
>> +		return NULL;
>> +
>> +	user_map_size = ctrl->elems * ctrl->elem_size;
>> +
>> +	if ((ctrl->elems * ctrl->elem_size) == ctx->map_size)
> 
> 	if (user_map_size == ctx->map_size)
> 
>> +		return ctrl->p_cur.p_u32;
>> +
>> +	v4l2_warn(&ctx->dw_dev->v4l2_dev,
>> +		  "Skipping invalid user map (%zu != %zu)\n",
>> +		  user_map_size,
>> +		  ctx->map_size);
> 
> The last two lines hold in a single line.
> 
> This should be a dev_dbg(), to avoid flooding the kernel log with
> userspace-triggered messages.
> 
> I'd also write
> 
> 	if (user_map_size != ctx->map_size) {
> 		dev_dbg(...);
> 		return NULL;
> 	}
> 
> 	return ctrl->p_cur.p_u32;
> 
> to match the pattern of the previous error check.
> 
>> +
>> +	return NULL;
>> +}
>> +
>> +/*
>> + * Create an identity map if not set by the application
> 
> This comment is a bit misleading, I initially thought the function's
> purpose was to create an identity mapping. You can write
> 
>    * Create the dewarp map from the V4L2 control. If the control hasn't been set
>    * by the application, generate an identity mapping.
> 
>> + *
>> + * A 16 pixels cell size grid is mapped on the destination image.
>> + * The last cells width/height might be lesser than 16 if the destination image
>> + * width/height is not divisible by 16. This dewarping grid map specifies the
>> + * source image pixel location (x, y) on each grid intersection point.
>> + * Bilinear interpolation is used to compute inner cell points locations.
>> + *
>> + * The coordinates are saved in UQ12.4 fixed point format.
>> + *
> 
> Extra blank line.
> 
>> + */
>> +static int dw100_create_mapping(struct dw100_ctx *ctx)
>> +{
>> +	u32 sw, sh, dw, dh, mw, mh, i, j;
>> +	u16 qx, qy, qdx, qdy, qsh, qsw;
>> +	bool is_user_map = false;
>> +	u32 *user_map;
>> +
>> +	sw = ctx->q_data[V4L2_M2M_SRC].width;
>> +	dw = ctx->q_data[V4L2_M2M_DST].width;
>> +	sh = ctx->q_data[V4L2_M2M_SRC].height;
>> +	dh = ctx->q_data[V4L2_M2M_DST].height;
>> +
>> +	mw = dw100_get_n_vertices_from_length(dw);
>> +	mh = dw100_get_n_vertices_from_length(dh);
>> +
>> +	qdx = dw_map_convert_to_UQ12_4(sw) / (mw - 1);
>> +	qdy = dw_map_convert_to_UQ12_4(sh) / (mh - 1);
> 
> These two lines can be moved just before the for loop as you don't need
> those variables when the user has supplied a mapping. You can then write
> them
> 
> 	qdx = qsw / (mw - 1);
> 	qdy = qsh / (mh - 1);
> 
>> +	qsh = dw_map_convert_to_UQ12_4(sh);
>> +	qsw = dw_map_convert_to_UQ12_4(sw);
> 
> Swap the last two lines.
> 
>> +
>> +	if (ctx->map)
>> +		dma_free_coherent(&ctx->dw_dev->pdev->dev,
>> +				  ctx->map_size,
>> +				  ctx->map,
>> +				  ctx->map_dma);
> 
> This holds on two liens.
> 
>> +
>> +	ctx->map_width = mw;
>> +	ctx->map_height = mh;
>> +	ctx->map_size = mh * mw * sizeof(u32);
>> +
>> +	ctx->map = dma_alloc_coherent(&ctx->dw_dev->pdev->dev,
>> +				      ctx->map_size,
>> +				      &ctx->map_dma,
>> +				      GFP_KERNEL);
> 
> Same here.
> 
>> +
>> +	if (!ctx->map)
>> +		return -ENOMEM;
>> +
>> +	user_map = dw100_get_user_map(ctx);
>> +	if (user_map) {
>> +		is_user_map = true;
>> +		memcpy(ctx->map, user_map, ctx->map_size);
>> +		goto out;
>> +	}
>> +
>> +	for (i = 0, qy = 0, qx = 0; i < mh; i++, qy += qdy, qx = 0) {
>> +		if (qy > qsh)
>> +			qy = qsh;
> 
> Can this happen ?
I think so. The frame resolution is aligned on 8 pixels whereas the 
mapping block resolution is 16 pixels. Hence clamping is required.
> 
>> +		for (j = 0; j < mw; j++, qx += qdx) {
> 
> 		for (j = 0, qx = 0; j < mw; j++, qx += qdx) {
> 
> and drop qw handling from the outer loop.
> 
>> +			if (qx > qsw)
>> +				qx = qsw;
>> +			ctx->map[i * mw + j] = dw_map_format_coordinates(qx, qy);
> 
> This could be made a bit more efficient by declaring a
> 
> 	u32 *map;
> 
> variable, setting it to
> 
> 	map = ctx->map;
> 
> just before the loop, and writing
> 
> 		*map++ = dw_map_format_coordinates(qx, qy);
> 
> here.
> 
>> +		}
>> +	}
>> +out:
>> +	dprintk(1, ctx->dw_dev,
>> +		"%dx%d %s mapping created (d:%pa-c:%p) for stream %dx%d->%dx%d\n",
> 
> %u instead of %d for unsigned integers.
> 
>> +			mw, mh, is_user_map ? "user" : "identity",
>> +			&ctx->map_dma, ctx->map, sw, sh, dw, dh);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct v4l2_ctrl_config controls[] = {
>> +	[DW100_CTRL_DEWARPING_MAP] = {
>> +		.id = V4L2_CID_DW100_DEWARPING_16x16_VERTEX_MAP,
>> +		.name = "Look-Up Table",
>> +		.type = V4L2_CTRL_TYPE_U32,
>> +		.min = 0x00000000,
>> +		.max = 0xffffffff,
>> +		.step = 1,
>> +		.def = 0,
>> +		.dims = { DW100_MAX_LUT_NELEMS },
>> +		.flags = V4L2_CTRL_FLAG_DYNAMIC_ARRAY,
>> +	},
>> +};
>> +
>> +#define NUM_CTRLS ARRAY_SIZE(controls)
>> +
>> +static int dw100_queue_setup(struct vb2_queue *vq,
>> +			     unsigned int *nbuffers, unsigned int *nplanes,
>> +			     unsigned int sizes[], struct device *alloc_devs[])
>> +{
>> +	struct dw100_ctx *ctx = vb2_get_drv_priv(vq);
>> +	struct dw100_q_data *q_data;
>> +	unsigned int size, count = *nbuffers;
>> +
>> +	q_data = get_q_data(ctx, vq->type);
>> +
>> +	size = q_data->sizeimage;
>> +
>> +	*nbuffers = count;
>> +
>> +	if (*nplanes)
>> +		return sizes[0] < size ? -EINVAL : 0;
>> +
>> +	*nplanes = 1;
>> +	sizes[0] = size;
>> +
>> +	dprintk(1, ctx->dw_dev, "Queue %p: get %d buffer(s) of size %d each.\n",
>> +		vq, count, size);
> 
> I think I'd drop this message, or have you found it useful to debug
> application issues ?
> 
>> +
>> +	return 0;
>> +}
>> +
>> +static int dw100_buf_prepare(struct vb2_buffer *vb)
>> +{
>> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
>> +	struct dw100_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
>> +	struct dw100_device *dw_dev = ctx->dw_dev;
>> +	struct dw100_q_data *q_data;
>> +
>> +	dprintk(1, dw_dev, "Queue %p: Preparing buffer %p, type: %d\n",
>> +		vb->vb2_queue, vb, vb->vb2_queue->type);
> 
> Same here.
> 
>> +
>> +	q_data = get_q_data(ctx, vb->vb2_queue->type);
>> +	if (V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type)) {
>> +		if (vbuf->field == V4L2_FIELD_ANY)
> 
> This can't happen,
> https://linuxtv.org/downloads/v4l-dvb-apis/userspace-api/v4l/field-order.html#c.v4l2_field
> states "struct v4l2_buffer field can never be V4L2_FIELD_ANY".
> 
>> +			vbuf->field = V4L2_FIELD_NONE;
>> +		if (vbuf->field != V4L2_FIELD_NONE) {
>> +			v4l2_err(&dw_dev->v4l2_dev, "%x field isn't supported\n",
>> +				 vbuf->field);
> 
> dev_dbg()
> 
>> +			return -EINVAL;
>> +		}
>> +	}
>> +
>> +	if (vb2_plane_size(vb, 0) < q_data->sizeimage) {
>> +		v4l2_err(&dw_dev->v4l2_dev,
>> +			 "%s data will not fit into plane (%lu < %lu)\n",
>> +			 __func__, vb2_plane_size(vb, 0),
>> +			 (long)q_data->sizeimage);
> 
> dev_dbg()
> 
>> +		return -EINVAL;
>> +	}
>> +
>> +	vb2_set_plane_payload(vb, 0, q_data->sizeimage);
>> +
>> +	return 0;
>> +}
>> +
>> +static void dw100_buf_queue(struct vb2_buffer *vb)
>> +{
>> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
>> +	struct dw100_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
>> +
>> +	dprintk(2, ctx->dw_dev, "Queue %p: Queuing buffer %p.\n",
>> +		vb->vb2_queue, vb);
>> +	v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, vbuf);
>> +}
>> +
>> +static int dw100_start_streaming(struct vb2_queue *q, unsigned int count)
>> +{
>> +	struct dw100_ctx *ctx = vb2_get_drv_priv(q);
>> +	struct dw100_q_data *q_data = get_q_data(ctx, q->type);
>> +
>> +	dprintk(1, ctx->dw_dev, "Queue %p: Start Streaming.\n", q);
>> +
>> +	q_data->sequence = 0;
>> +
>> +	return pm_runtime_resume_and_get(&ctx->dw_dev->pdev->dev);
>> +}
>> +
>> +static void dw100_stop_streaming(struct vb2_queue *q)
>> +{
>> +	struct dw100_ctx *ctx = vb2_get_drv_priv(q);
>> +	struct vb2_v4l2_buffer *vbuf;
>> +	unsigned long flags;
>> +
>> +	dprintk(1, ctx->dw_dev, "Queue %p: Stop Streaming.\n", q);
>> +	for (;;) {
>> +		if (V4L2_TYPE_IS_OUTPUT(q->type))
>> +			vbuf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
>> +		else
>> +			vbuf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
>> +		if (!vbuf)
>> +			break;
>> +		spin_lock_irqsave(&ctx->dw_dev->irqlock, flags);
> 
> I don't think you need the lock here, as this can't race with the IRQ,
> can it ?
> 
>> +		v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
>> +		spin_unlock_irqrestore(&ctx->dw_dev->irqlock, flags);
>> +	}
>> +
>> +	pm_runtime_put_sync(&ctx->dw_dev->pdev->dev);
>> +
>> +	if (ctx->map) {
>> +		dma_free_coherent(&ctx->dw_dev->pdev->dev,
>> +				  ctx->map_size,
>> +				  ctx->map,
>> +				  ctx->map_dma);
>> +		ctx->map = NULL;
> 
> There's a mismatch between start and stop, could we create the mapping
> in dw100_start_streaming() instead of dw100_start() ?
> 
>> +	}
>> +}
>> +
>> +static const struct vb2_ops dw100_qops = {
>> +	.queue_setup	 = dw100_queue_setup,
>> +	.buf_prepare	 = dw100_buf_prepare,
>> +	.buf_queue	 = dw100_buf_queue,
>> +	.start_streaming = dw100_start_streaming,
>> +	.stop_streaming  = dw100_stop_streaming,
>> +	.wait_prepare	 = vb2_ops_wait_prepare,
>> +	.wait_finish	 = vb2_ops_wait_finish,
>> +};
>> +
>> +static int dw100_m2m_queue_init(void *priv, struct vb2_queue *src_vq,
>> +				struct vb2_queue *dst_vq)
>> +{
>> +	struct dw100_ctx *ctx = priv;
>> +	int ret;
>> +
>> +	src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
>> +	src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
>> +	src_vq->drv_priv = ctx;
>> +	src_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
>> +	src_vq->ops = &dw100_qops;
>> +	src_vq->mem_ops = &vb2_dma_contig_memops;
>> +	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
>> +	src_vq->lock = &ctx->dw_dev->vfd_mutex;
> 
> This will serialize queue operations across all contexts. Wouldn't it be
> better to have a per-context lock ?
> 
>> +	src_vq->dev = ctx->dw_dev->v4l2_dev.dev;
>> +
>> +	ret = vb2_queue_init(src_vq);
>> +	if (ret)
>> +		return ret;
>> +
>> +	dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
>> +	dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
>> +	dst_vq->drv_priv = ctx;
>> +	dst_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
>> +	dst_vq->ops = &dw100_qops;
>> +	dst_vq->mem_ops = &vb2_dma_contig_memops;
>> +	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
>> +	dst_vq->lock = &ctx->dw_dev->vfd_mutex;
>> +	dst_vq->dev = ctx->dw_dev->v4l2_dev.dev;
>> +
>> +	return vb2_queue_init(dst_vq);
>> +}
>> +
>> +static int dw100_open(struct file *file)
>> +{
>> +	struct dw100_device *dw_dev = video_drvdata(file);
>> +	struct dw100_ctx *ctx;
>> +	struct v4l2_ctrl_handler *hdl;
>> +	int ret = 0, i;
>> +
>> +	if (mutex_lock_interruptible(&dw_dev->vfd_mutex))
>> +		return -ERESTARTSYS;
>> +
>> +	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
>> +	if (!ctx) {
>> +		ret = -ENOMEM;
>> +		goto open_unlock;
>> +	}
> 
> This can be moved before the mutex_lock call (with a return -ENOMEM
> instead of the goto).
> 
> Actually I don't think you need the lock at all in this function.
> 
>> +
>> +	v4l2_fh_init(&ctx->fh, video_devdata(file));
>> +	file->private_data = &ctx->fh;
>> +	ctx->dw_dev = dw_dev;
>> +
>> +	hdl = &ctx->hdl;
>> +	v4l2_ctrl_handler_init(hdl, NUM_CTRLS);
>> +	for (i = 0; i < NUM_CTRLS; i++) {
>> +		ctx->ctrls[i] = v4l2_ctrl_new_custom(hdl, &controls[i], NULL);
>> +		if (hdl->error) {
>> +			v4l2_err(&ctx->dw_dev->v4l2_dev,
>> +				 "Adding control (%d) failed\n", i);
>> +			ret = hdl->error;
>> +			v4l2_ctrl_handler_free(hdl);
>> +			v4l2_fh_exit(&ctx->fh);
>> +			kfree(ctx);
>> +			goto open_unlock;
>> +		}
>> +	}
>> +	ctx->fh.ctrl_handler = hdl;
>> +
>> +	ctx->q_data[V4L2_M2M_SRC].fmt = &formats[0];
>> +	ctx->q_data[V4L2_M2M_SRC].width = 640;
>> +	ctx->q_data[V4L2_M2M_SRC].height = 480;
>> +	ctx->q_data[V4L2_M2M_SRC].bytesperline =
>> +		dw100_bytesperline(&formats[0], 640);
>> +	ctx->q_data[V4L2_M2M_SRC].sizeimage =
>> +		dw100_sizeimage(&formats[0], 640, 480);
>> +
>> +	ctx->q_data[V4L2_M2M_SRC].crop.top = 0;
>> +	ctx->q_data[V4L2_M2M_SRC].crop.left = 0;
>> +	ctx->q_data[V4L2_M2M_SRC].crop.width = 640;
>> +	ctx->q_data[V4L2_M2M_SRC].crop.height = 480;
>> +
>> +	ctx->q_data[V4L2_M2M_DST] = ctx->q_data[V4L2_M2M_SRC];
>> +
>> +	ctx->colorspace = V4L2_COLORSPACE_REC709;
>> +	ctx->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(ctx->colorspace);
>> +	ctx->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(ctx->colorspace);
>> +	ctx->quant = V4L2_MAP_QUANTIZATION_DEFAULT(false,
>> +						   ctx->colorspace,
>> +						   ctx->ycbcr_enc);
>> +
>> +	ctx->fh.m2m_ctx = v4l2_m2m_ctx_init(dw_dev->m2m_dev,
>> +					    ctx, &dw100_m2m_queue_init);
>> +
>> +	if (IS_ERR(ctx->fh.m2m_ctx)) {
>> +		ret = PTR_ERR(ctx->fh.m2m_ctx);
>> +
>> +		v4l2_ctrl_handler_free(hdl);
>> +		v4l2_fh_exit(&ctx->fh);
>> +		kfree(ctx);
>> +		goto open_unlock;
>> +	}
>> +
>> +	v4l2_fh_add(&ctx->fh);
>> +
>> +	dprintk(1, dw_dev, "M2M instance created: %p", ctx->fh.m2m_ctx);
> 
> I'd drop this message too.
> 
>> +
>> +open_unlock:
>> +	mutex_unlock(&dw_dev->vfd_mutex);
>> +	return ret;
>> +}
>> +
>> +static int dw100_release(struct file *file)
>> +{
>> +	struct dw100_device *dw_dev = video_drvdata(file);
>> +	struct dw100_ctx *ctx = file2ctx(file);
>> +
>> +	dprintk(1, dw_dev, "Releasing M2M instance: %p", ctx->fh.m2m_ctx);
>> +
>> +	v4l2_fh_del(&ctx->fh);
>> +	v4l2_fh_exit(&ctx->fh);
>> +	v4l2_ctrl_handler_free(&ctx->hdl);
>> +
>> +	mutex_lock(&dw_dev->vfd_mutex);
>> +	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
>> +	mutex_unlock(&dw_dev->vfd_mutex);
>> +
>> +	if (ctx->map)
>> +		dma_free_coherent(&ctx->dw_dev->pdev->dev,
>> +				  ctx->map_size,
>> +				  ctx->map,
>> +				  ctx->map_dma);
> 
> Can this happen, doesn't the M2M framework guarantee that streaming is
> stopped, which then guarantees that the .stop_streaming() handler has
> freed the mapping ?
> 
>> +
>> +	kfree(ctx);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct v4l2_file_operations dw100_fops = {
>> +	.owner		= THIS_MODULE,
>> +	.open		= dw100_open,
>> +	.release	= dw100_release,
>> +	.poll		= v4l2_m2m_fop_poll,
>> +	.unlocked_ioctl	= video_ioctl2,
>> +	.mmap		= v4l2_m2m_fop_mmap,
>> +};
>> +
>> +static int dw100_querycap(struct file *file, void *priv,
>> +			  struct v4l2_capability *cap)
>> +{
>> +	strscpy(cap->driver, DRV_NAME, sizeof(cap->driver));
>> +	strscpy(cap->card, "DW100 dewarper", sizeof(cap->card));
>> +	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s", DRV_NAME);
> 
> Not needed anymore, the core handles it in v4l_querycap() (and the value
> here is incorrect, it should use the device name, not hardcode the
> driver name).
> 
>> +
>> +	return 0;
>> +}
>> +
>> +static int dw100_enum_fmt(struct v4l2_fmtdesc *f)
>> +{
>> +	int i, num = 0;
>> +
>> +	for (i = 0; i < NUM_FORMATS; i++) {
>> +		if (formats[i].types & to_dw100_fmt_type(f->type)) {
>> +			if (num == f->index) {
>> +				f->pixelformat = formats[i].fourcc;
>> +				return 0;
>> +			}
>> +			++num;
>> +		}
>> +	}
>> +
>> +	return -EINVAL;
>> +}
>> +
>> +static int dw100_enum_fmt_vid_cap(struct file *file, void *priv,
>> +				  struct v4l2_fmtdesc *f)
>> +{
>> +	return dw100_enum_fmt(f);
>> +}
>> +
>> +static int dw100_enum_fmt_vid_out(struct file *file, void *priv,
>> +				  struct v4l2_fmtdesc *f)
>> +{
>> +	return dw100_enum_fmt(f);
>> +}
> 
> You can merge those three functions into a single one.
> 
>> +
>> +static int dw100_enum_framesizes(struct file *file, void *priv,
>> +				 struct v4l2_frmsizeenum *fsize)
>> +{
>> +	struct dw100_fmt *fmt;
>> +
>> +	if (fsize->index)
>> +		return -EINVAL;
>> +
>> +	fmt = find_pixel_format(fsize->pixel_format,
>> +				V4L2_M2M_OUTPUT | V4L2_M2M_CAPTURE);
> 
> I think you should restrict the format type based on fsize->type.
> 
>> +	if (!fmt)
>> +		return -EINVAL;
>> +
>> +	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
>> +	fsize->stepwise.min_width = MIN_W;
>> +	fsize->stepwise.min_height = MIN_H;
>> +	fsize->stepwise.max_width = MAX_W;
>> +	fsize->stepwise.max_height = MAX_H;
>> +	fsize->stepwise.step_width = (1UL << ALIGN_W);
>> +	fsize->stepwise.step_height = (1UL << ALIGN_H);
> 
> No need for the parentheses.
> 
>> +
>> +	return 0;
>> +}
>> +
>> +static int dw100_g_fmt(struct dw100_ctx *ctx, struct v4l2_format *f)
>> +{
>> +	struct vb2_queue *vq;
>> +	struct dw100_q_data *q_data;
>> +
>> +	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
>> +	if (!vq)
>> +		return -EINVAL;
>> +
>> +	q_data = get_q_data(ctx, f->type);
>> +
>> +	f->fmt.pix.width	= q_data->width;
>> +	f->fmt.pix.height	= q_data->height;
>> +	f->fmt.pix.field	= V4L2_FIELD_NONE;
>> +	f->fmt.pix.pixelformat	= q_data->fmt->fourcc;
>> +	f->fmt.pix.bytesperline	= q_data->bytesperline;
>> +	f->fmt.pix.sizeimage	= q_data->sizeimage;
>> +	f->fmt.pix.colorspace	= ctx->colorspace;
>> +	f->fmt.pix.xfer_func	= ctx->xfer_func;
>> +	f->fmt.pix.ycbcr_enc	= ctx->ycbcr_enc;
>> +	f->fmt.pix.quantization	= ctx->quant;
>> +
>> +	return 0;
>> +}
>> +
>> +static int dw100_g_fmt_vid_out(struct file *file, void *priv,
>> +			       struct v4l2_format *f)
>> +{
>> +	return dw100_g_fmt(file2ctx(file), f);
>> +}
>> +
>> +static int dw100_g_fmt_vid_cap(struct file *file, void *priv,
>> +			       struct v4l2_format *f)
>> +{
>> +	return dw100_g_fmt(file2ctx(file), f);
>> +}
> 
> You can also merge those three functions into a single one.
> 
>> +
>> +static int dw100_try_fmt(struct v4l2_format *f, struct dw100_fmt *fmt)
>> +{
>> +	v4l_bound_align_image(&f->fmt.pix.width, MIN_W, MAX_W, ALIGN_W,
>> +			      &f->fmt.pix.height, MIN_H, MAX_H, ALIGN_H, 0);
>> +
>> +	f->fmt.pix.bytesperline = dw100_bytesperline(fmt, f->fmt.pix.width);
>> +	f->fmt.pix.sizeimage = dw100_sizeimage(fmt, f->fmt.pix.width,
>> +					       f->fmt.pix.height);
> 
> No need to support a custom line stride ?
> 
>> +	f->fmt.pix.field = V4L2_FIELD_NONE;
>> +
>> +	return 0;
>> +}
>> +
>> +static int dw100_s_fmt(struct dw100_ctx *ctx, struct v4l2_format *f)
>> +{
>> +	struct dw100_q_data *q_data;
>> +	struct vb2_queue *vq;
>> +
>> +	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
>> +	if (!vq)
>> +		return -EINVAL;
>> +
>> +	q_data = get_q_data(ctx, f->type);
>> +	if (!q_data)
>> +		return -EINVAL;
>> +
>> +	if (vb2_is_busy(vq)) {
>> +		v4l2_err(&ctx->dw_dev->v4l2_dev, "%s queue busy\n", __func__);
>> +		return -EBUSY;
>> +	}
>> +
>> +	q_data->fmt		= find_format(f);
>> +	q_data->width		= f->fmt.pix.width;
>> +	q_data->height		= f->fmt.pix.height;
>> +	q_data->bytesperline	= f->fmt.pix.bytesperline;
>> +	q_data->sizeimage	= f->fmt.pix.sizeimage;
> 
> It could be easier to store an instance of v4l2_pix_format in
> dw100_q_data.
> 
>> +
>> +	q_data->crop.top = 0;
>> +	q_data->crop.left = 0;
>> +	q_data->crop.width = f->fmt.pix.width;
>> +	q_data->crop.height = f->fmt.pix.height;
>> +
>> +	dprintk(1, ctx->dw_dev,
>> +		"Setting format for type %d, wxh: %dx%d, fmt: %d\n",
>> +		f->type, q_data->width, q_data->height, q_data->fmt->fourcc);
>> +
>> +	return 0;
>> +}
>> +
>> +static int dw100_try_fmt_vid_cap(struct file *file, void *priv,
>> +				 struct v4l2_format *f)
>> +{
>> +	struct dw100_fmt *fmt;
>> +	struct dw100_ctx *ctx = file2ctx(file);
>> +
>> +	if (f->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
>> +		return -EINVAL;
>> +
>> +	fmt = find_format(f);
>> +	if (!fmt) {
>> +		f->fmt.pix.pixelformat = formats[0].fourcc;
>> +		fmt = find_format(f);
>> +	}
>> +
>> +	f->fmt.pix.colorspace = ctx->colorspace;
>> +	f->fmt.pix.xfer_func = ctx->xfer_func;
>> +	f->fmt.pix.ycbcr_enc = ctx->ycbcr_enc;
>> +	f->fmt.pix.quantization = ctx->quant;
>> +
>> +	return dw100_try_fmt(f, fmt);
>> +}
>> +
>> +static int dw100_s_fmt_vid_cap(struct file *file, void *priv,
>> +			       struct v4l2_format *f)
>> +{
>> +	struct dw100_ctx *ctx = file2ctx(file);
>> +	int ret;
>> +
>> +	ret = dw100_try_fmt_vid_cap(file, priv, f);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = dw100_s_fmt(ctx, f);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return 0;
>> +}
>> +
>> +static int dw100_try_fmt_vid_out(struct file *file, void *priv,
>> +				 struct v4l2_format *f)
>> +{
>> +	struct dw100_fmt *fmt;
>> +
>> +	if (f->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
>> +		return -EINVAL;
>> +
>> +	fmt = find_format(f);
>> +	if (!fmt) {
>> +		f->fmt.pix.pixelformat = formats[0].fourcc;
>> +		fmt = find_format(f);
>> +	}
>> +
>> +	if (!f->fmt.pix.colorspace)
>> +		f->fmt.pix.colorspace = V4L2_COLORSPACE_REC709;
>> +
>> +	return dw100_try_fmt(f, fmt);
>> +}
>> +
>> +static int dw100_s_fmt_vid_out(struct file *file, void *priv,
>> +			       struct v4l2_format *f)
>> +{
>> +	struct dw100_ctx *ctx = file2ctx(file);
>> +	int ret;
>> +
>> +	ret = dw100_try_fmt_vid_out(file, priv, f);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = dw100_s_fmt(ctx, f);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ctx->colorspace = f->fmt.pix.colorspace;
>> +	ctx->xfer_func = f->fmt.pix.xfer_func;
>> +	ctx->ycbcr_enc = f->fmt.pix.ycbcr_enc;
>> +	ctx->quant = f->fmt.pix.quantization;
>> +
>> +	return 0;
>> +}
>> +
>> +static int dw100_g_selection(struct file *file, void *fh,
>> +			     struct v4l2_selection *sel)
>> +{
>> +	struct dw100_ctx *ctx = file2ctx(file);
>> +	struct dw100_q_data *src_q_data, *dst_q_data;
>> +
>> +	if (sel->type != V4L2_BUF_TYPE_VIDEO_OUTPUT &&
>> +	    sel->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
>> +		return -EINVAL;
>> +
>> +	src_q_data = get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT);
>> +	dst_q_data = get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
>> +
>> +	switch (sel->target) {
>> +	case V4L2_SEL_TGT_CROP_DEFAULT:
>> +	case V4L2_SEL_TGT_CROP_BOUNDS:
>> +		sel->r.top = 0;
>> +		sel->r.left = 0;
>> +		sel->r.width = src_q_data->width;
>> +		sel->r.height = src_q_data->height;
>> +		break;
>> +	case V4L2_SEL_TGT_CROP:
>> +		sel->r.top = src_q_data->crop.top;
>> +		sel->r.left = src_q_data->crop.left;
>> +		sel->r.width = src_q_data->crop.width;
>> +		sel->r.height = src_q_data->crop.height;
>> +		break;
>> +	case V4L2_SEL_TGT_COMPOSE_DEFAULT:
>> +	case V4L2_SEL_TGT_COMPOSE_BOUNDS:
>> +	case V4L2_SEL_TGT_COMPOSE:
>> +		sel->r.top = 0;
>> +		sel->r.left = 0;
>> +		sel->r.width = dst_q_data->width;
>> +		sel->r.height = dst_q_data->height;
>> +		break;
> 
> As far as I understand the driver doesn't support composition, maybe you
> could just return -EINVAL ?
> 
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	dprintk(1, ctx->dw_dev,
>> +		"<<< Buffer Type: %d Target: %d Rect: %dx%d@%d.%d\n",
>> +		sel->type, sel->target,
>> +		sel->r.width, sel->r.height, sel->r.left, sel->r.top);
>> +
>> +	return 0;
>> +}
>> +
>> +static	int dw100_s_selection(struct file *file, void *fh,
> 
> Replace tab with space.
> 
>> +			      struct v4l2_selection *sel)
>> +{
>> +	struct dw100_ctx *ctx = file2ctx(file);
>> +	struct dw100_q_data *src_q_data, *dst_q_data;
>> +	u32 qscalex, qscaley, qscale;
>> +	int x, y, w, h;
>> +
>> +	if (sel->type != V4L2_BUF_TYPE_VIDEO_OUTPUT &&
>> +	    sel->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
>> +		return -EINVAL;
>> +
>> +	src_q_data = get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT);
>> +	dst_q_data = get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
>> +
>> +	dprintk(1, ctx->dw_dev,
>> +		">>> Buffer Type: %d Target: %d Rect: %dx%d@%d.%d\n",
>> +		sel->type, sel->target,
>> +		sel->r.width, sel->r.height, sel->r.left, sel->r.top);
>> +
>> +	if (sel->r.top < 0 || sel->r.left < 0)
>> +		return -EINVAL;
> 
> Clamp the top and left values to the supported range, .s_selection()
> must adjust unsupported values, not return an error.
> 
>> +
>> +	switch (sel->target) {
>> +	case V4L2_SEL_TGT_CROP:
>> +		/* UQ16.16 for float operations */
>> +		if ((sel->r.left + sel->r.width > src_q_data->width) ||
>> +		    (sel->r.top + sel->r.height > src_q_data->height))
>> +			return -EINVAL;
> 
> Same.
> 
>> +		qscalex = (sel->r.width << 16) / src_q_data->width;
>> +		qscaley = (sel->r.height << 16) / src_q_data->height;
>> +		y = sel->r.top;
>> +		x = sel->r.left;
>> +		if (qscalex == qscaley) {
>> +			qscale = qscalex;
>> +		} else {
>> +			switch (sel->flags) {
>> +			case 0:
>> +				qscale = (qscalex + qscaley) / 2;
>> +				break;
>> +			case V4L2_SEL_FLAG_GE:
>> +				qscale = max(qscaley, qscalex);
>> +				break;
>> +			case V4L2_SEL_FLAG_LE:
>> +				qscale = min(qscaley, qscalex);
>> +				break;
>> +			case V4L2_SEL_FLAG_LE | V4L2_SEL_FLAG_GE:
>> +				return -ERANGE;
>> +			default:
>> +				return -EINVAL;
>> +			}
>> +		}
>> +
>> +		w = (u32)((((u64)src_q_data->width << 16) * qscale) >> 32);
>> +		h = (u32)((((u64)src_q_data->height << 16) * qscale) >> 32);
>> +		x = x + (sel->r.width  - w) / 2;
>> +		y = y + (sel->r.height  - h) / 2;
>> +		x = min(src_q_data->width - w, (unsigned int)max(0, x));
>> +		y = min(src_q_data->height - h, (unsigned int)max(0, y));
>> +
>> +		sel->r.top = y;
>> +		sel->r.left = x;
>> +		sel->r.width = w;
>> +		sel->r.height = h;
>> +
>> +		src_q_data->crop.top = sel->r.top;
>> +		src_q_data->crop.left = sel->r.left;
>> +		src_q_data->crop.width = sel->r.width;
>> +		src_q_data->crop.height = sel->r.height;
>> +		break;
>> +	case V4L2_SEL_TGT_COMPOSE:
>> +		if ((sel->r.left + sel->r.width > dst_q_data->width) ||
>> +		    (sel->r.top + sel->r.height > dst_q_data->height))
>> +			return -EINVAL;
>> +		sel->r.top = 0;
>> +		sel->r.left = 0;
>> +		sel->r.width = dst_q_data->width;
>> +		sel->r.height = dst_q_data->height;
>> +		break;
>> +	case V4L2_SEL_TGT_CROP_DEFAULT:
>> +	case V4L2_SEL_TGT_CROP_BOUNDS:
>> +	case V4L2_SEL_TGT_COMPOSE_DEFAULT:
>> +	case V4L2_SEL_TGT_COMPOSE_BOUNDS:
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	dprintk(1, ctx->dw_dev,
>> +		"<<< Buffer Type: %d Target: %d Rect: %dx%d@%d.%d\n",
>> +		sel->type, sel->target,
>> +		sel->r.width, sel->r.height, sel->r.left, sel->r.top);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct v4l2_ioctl_ops dw100_ioctl_ops = {
>> +	.vidioc_querycap	= dw100_querycap,
>> +
>> +	.vidioc_enum_fmt_vid_cap = dw100_enum_fmt_vid_cap,
>> +	.vidioc_enum_framesizes = dw100_enum_framesizes,
>> +	.vidioc_g_fmt_vid_cap	= dw100_g_fmt_vid_cap,
>> +	.vidioc_try_fmt_vid_cap	= dw100_try_fmt_vid_cap,
>> +	.vidioc_s_fmt_vid_cap	= dw100_s_fmt_vid_cap,
>> +
>> +	.vidioc_enum_fmt_vid_out = dw100_enum_fmt_vid_out,
>> +	.vidioc_g_fmt_vid_out	= dw100_g_fmt_vid_out,
>> +	.vidioc_try_fmt_vid_out	= dw100_try_fmt_vid_out,
>> +	.vidioc_s_fmt_vid_out	= dw100_s_fmt_vid_out,
>> +
>> +	.vidioc_g_selection	= dw100_g_selection,
>> +	.vidioc_s_selection	= dw100_s_selection,
>> +	.vidioc_reqbufs		= v4l2_m2m_ioctl_reqbufs,
>> +	.vidioc_querybuf	= v4l2_m2m_ioctl_querybuf,
>> +	.vidioc_qbuf		= v4l2_m2m_ioctl_qbuf,
>> +	.vidioc_dqbuf		= v4l2_m2m_ioctl_dqbuf,
>> +	.vidioc_prepare_buf	= v4l2_m2m_ioctl_prepare_buf,
>> +	.vidioc_create_bufs	= v4l2_m2m_ioctl_create_bufs,
>> +	.vidioc_expbuf		= v4l2_m2m_ioctl_expbuf,
>> +
>> +	.vidioc_streamon	= v4l2_m2m_ioctl_streamon,
>> +	.vidioc_streamoff	= v4l2_m2m_ioctl_streamoff,
>> +
>> +	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
>> +	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
>> +};
>> +
>> +static void dw100_job_finish(struct dw100_device *dw_dev, bool with_error)
>> +{
>> +	struct dw100_ctx *curr_ctx;
>> +	struct vb2_v4l2_buffer *src_vb, *dst_vb;
>> +	unsigned long flags;
>> +	enum vb2_buffer_state buf_state;
>> +
>> +	curr_ctx = v4l2_m2m_get_curr_priv(dw_dev->m2m_dev);
>> +
>> +	if (!curr_ctx) {
>> +		v4l2_err(&dw_dev->v4l2_dev,
>> +			 "Instance released before the end of transaction\n");
>> +		return;
>> +	}
>> +
>> +	src_vb = v4l2_m2m_src_buf_remove(curr_ctx->fh.m2m_ctx);
>> +	dst_vb = v4l2_m2m_dst_buf_remove(curr_ctx->fh.m2m_ctx);
>> +
>> +	if (likely(!with_error))
>> +		buf_state = VB2_BUF_STATE_DONE;
>> +	else
>> +		buf_state = VB2_BUF_STATE_ERROR;
>> +
>> +	spin_lock_irqsave(&dw_dev->irqlock, flags);
>> +	v4l2_m2m_buf_done(src_vb, buf_state);
>> +	v4l2_m2m_buf_done(dst_vb, buf_state);
>> +	spin_unlock_irqrestore(&dw_dev->irqlock, flags);
> 
> And the lock could be droppped from here if it's dropped from
> dw100_stop_streaming().
> 
>> +
>> +	dprintk(2, dw_dev, "Finishing transaction with%s error(s)\n",
>> +		with_error ? "" : "out");
>> +
>> +	v4l2_m2m_job_finish(dw_dev->m2m_dev, curr_ctx->fh.m2m_ctx);
>> +}
>> +
>> +static void dw100_hw_reset(struct dw100_device *dw_dev)
>> +{
>> +	u32 val;
>> +
>> +	val = readl(dw_dev->mmio + DW100_DEWARP_CTRL);
>> +	val |= DW100_DEWARP_CTRL_ENABLE;
>> +	val |= DW100_DEWARP_CTRL_SOFT_RESET;
>> +	writel(val, dw_dev->mmio + DW100_DEWARP_CTRL);
>> +	val &= ~DW100_DEWARP_CTRL_SOFT_RESET;
>> +	writel(val, dw_dev->mmio + DW100_DEWARP_CTRL);
>> +}
>> +
>> +static void _dw100_hw_set_master_bus_enable(struct dw100_device *dw_dev,
>> +					    unsigned int enable)
>> +{
>> +	u32 val;
>> +	void __iomem *addr = dw_dev->mmio + DW100_BUS_CTRL;
>> +
>> +	dprintk(3, dw_dev, "%sable master bus\n", enable ? "En" : "Dis");
>> +
>> +	val = readl(addr);
>> +
>> +	if (enable)
>> +		val |= DW100_BUS_CTRL_AXI_MASTER_ENABLE;
>> +	else
>> +		val &= ~DW100_BUS_CTRL_AXI_MASTER_ENABLE;
>> +
>> +	writel(val, addr);
>> +}
>> +
>> +static void dw100_hw_master_bus_enable(struct dw100_device *dw_dev)
>> +{
>> +	_dw100_hw_set_master_bus_enable(dw_dev, 1);
>> +}
>> +
>> +static void dw100_hw_master_bus_disable(struct dw100_device *dw_dev)
>> +{
>> +	_dw100_hw_set_master_bus_enable(dw_dev, 0);
>> +}
>> +
>> +static void dw100_hw_dewarp_start(struct dw100_device *dw_dev)
>> +{
>> +	u32 val;
>> +	void __iomem *addr = dw_dev->mmio + DW100_DEWARP_CTRL;
>> +
>> +	val = readl(addr);
>> +
>> +	dprintk(3, dw_dev, "Starting Hardware CTRL:%x\n", val);
>> +	writel(val | DW100_DEWARP_CTRL_START, addr);
>> +	writel(val, addr);
>> +}
>> +
>> +static void dw100_hw_init_ctrl(struct dw100_device *dw_dev)
>> +{
>> +	u32 val;
>> +	void __iomem *addr = dw_dev->mmio + DW100_DEWARP_CTRL;
>> +	/*
>> +	 * Input format YUV422_SP
>> +	 * Output format YUV422_SP
>> +	 * No hardware handshake (SW)
>> +	 * No automatic double src buffering (Single)
>> +	 * No automatic double dst buffering (Single)
>> +	 * No Black Line
>> +	 * Prefetch image pixel traversal
>> +	 */
>> +
>> +	val = DW100_DEWARP_CTRL_ENABLE
>> +		/* Valid only for auto prefetch mode*/
>> +		| DW100_DEWARP_CTRL_PREFETCH_THRESHOLD(32);
> 
> Align | below the =.
> 
>> +
>> +	/*
>> +	 * Calculation mode required to support any scaling factor,
>> +	 * but x4 slower than traversal mode.
>> +	 *
>> +	 * DW100_DEWARP_CTRL_PREFETCH_MODE_TRAVERSAL
>> +	 * DW100_DEWARP_CTRL_PREFETCH_MODE_CALCULATION
>> +	 * DW100_DEWARP_CTRL_PREFETCH_MODE_AUTO
>> +	 *
>> +	 * TODO: Find heuristics requiring calculation mode
>> +	 *
> 
> Extra blank line.
> 
>> +	 */
>> +	val |= DW100_DEWARP_CTRL_PREFETCH_MODE_CALCULATION;
>> +
>> +	writel(val, addr);
>> +}
>> +
>> +static void dw100_hw_set_pixel_boundary(struct dw100_device *dw_dev)
>> +{
>> +	u32 val;
>> +	void __iomem *addr = dw_dev->mmio + DW100_BOUNDARY_PIXEL;
>> +
>> +	val = DW100_BOUNDARY_PIXEL_V(128)
>> +		| DW100_BOUNDARY_PIXEL_U(128)
>> +		| DW100_BOUNDARY_PIXEL_Y(0);
>> +
>> +	writel(val, addr);
>> +}
>> +
>> +static void dw100_hw_set_scale(struct dw100_device *dw_dev, u8 scale)
>> +{
>> +	void __iomem *addr = dw_dev->mmio + DW100_SCALE_FACTOR;
>> +
>> +	dprintk(1, dw_dev, "Setting scale factor to %d\n", scale);
>> +
>> +	writel(scale, addr);
>> +}
>> +
>> +static void dw100_hw_set_roi(struct dw100_device *dw_dev, u32 x, u32 y)
>> +{
>> +	u32 val;
>> +	void __iomem *addr = dw_dev->mmio + DW100_ROI_START;
>> +
>> +	dprintk(1, dw_dev, "Setting ROI region to %d.%d\n", x, y);
>> +
>> +	val = DW100_ROI_START_X(x) | DW100_ROI_START_Y(y);
>> +
>> +	writel(val, addr);
>> +}
>> +
>> +static void dw100_hw_set_src_crop(struct dw100_device *dw_dev,
>> +				  struct dw100_q_data *src_q_data,
>> +				  struct dw100_q_data *dst_q_data)
> 
> const
> 
>> +{
>> +	struct v4l2_rect *rect = &src_q_data->crop;
>> +	u32 src_scale, qscale, left_scale, top_scale;
>> +
>> +	/* HW Scale is UQ1.7 encoded */
>> +	src_scale = (rect->width << 7) / src_q_data->width;
>> +	dw100_hw_set_scale(dw_dev, src_scale);
>> +
>> +	qscale = (dst_q_data->width << 7)  / src_q_data->width;
>> +
>> +	left_scale = (((rect->left << 7) * qscale) >> 14);
>> +	top_scale = (((rect->top << 7) * qscale) >> 14);
> 
> No need for the outer parentheses.
> 
>> +
>> +	dw100_hw_set_roi(dw_dev, left_scale, top_scale);
>> +}
>> +
>> +static void dw100_hw_set_source(struct dw100_device *dw_dev,
>> +				struct dw100_q_data *q_data,
>> +				dma_addr_t addr)
>> +{
>> +	u32 width, height, stride, fourcc, val;
>> +	struct dw100_fmt *fmt = q_data->fmt;
>> +
>> +	width =  q_data->width;
>> +	height = q_data->height;
>> +	stride = q_data->bytesperline;
>> +	fourcc = q_data->fmt->fourcc;
>> +
>> +	dprintk(3, dw_dev, "Set HW source registers for %dx%d - stride %d, pixfmt: %x, dma:%pa\n",
>> +		width, height, stride, fourcc, &addr);
>> +
>> +	/* Pixel Format */
>> +	val = readl(dw_dev->mmio + DW100_DEWARP_CTRL);
>> +
>> +	val &= ~DW100_DEWARP_CTRL_INPUT_FORMAT_MASK;
>> +	val |= DW100_DEWARP_CTRL_INPUT_FORMAT(fmt->reg_format);
>> +
>> +	writel(val, dw_dev->mmio + DW100_DEWARP_CTRL);
>> +
>> +	/* Swap */
>> +	val = readl(dw_dev->mmio + DW100_SWAP_CONTROL);
>> +
>> +	val &= ~DW100_SWAP_CONTROL_SRC_MASK;
>> +	/*
>> +	 * Data swapping is performed only on Y plane for source image.
>> +	 */
>> +	if (fmt->reg_swap_uv &&
>> +	    fmt->reg_format == DW100_DEWARP_CTRL_FORMAT_YUV422_PACKED)
>> +		val |= DW100_SWAP_CONTROL_SRC(DW100_SWAP_CONTROL_Y
>> +					      (DW100_SWAP_CONTROL_BYTE));
>> +
>> +	writel(val, dw_dev->mmio + DW100_SWAP_CONTROL);
>> +
>> +	/* Image resolution */
>> +	writel(DW100_IMG_SIZE_WIDTH(width) | DW100_IMG_SIZE_HEIGHT(height),
>> +	       dw_dev->mmio + DW100_SRC_IMG_SIZE);
>> +
>> +	writel(stride, dw_dev->mmio + DW100_SRC_IMG_STRIDE);
>> +
>> +	/* Buffers */
>> +	writel(DW100_IMG_Y_BASE(addr), dw_dev->mmio + DW100_SRC_IMG_Y_BASE);
>> +	writel(DW100_IMG_UV_BASE((addr + (stride * height))),
>> +	       dw_dev->mmio + DW100_SRC_IMG_UV_BASE);
> 
> As the hardware supports non-contiguous planes, we should use the mplane
> API already, even if we support the single planar formats only for now.
> 
>> +}
>> +
>> +static void dw100_hw_set_destination(struct dw100_device *dw_dev,
>> +				     struct dw100_q_data *q_data,
>> +				     struct dw100_fmt *ifmt,
>> +				     dma_addr_t addr)
>> +{
>> +	u32 width, height, stride, fourcc, val;
>> +	struct dw100_fmt *fmt = q_data->fmt;
>> +
>> +	width =  q_data->width;
>> +	height = q_data->height;
>> +	stride = q_data->bytesperline;
>> +	fourcc = q_data->fmt->fourcc;
>> +
>> +	dprintk(3, dw_dev, "Set HW source registers for %dx%d - stride %d, pixfmt: %x, dma:%pa\n",
>> +		width, height, stride, fourcc, &addr);
>> +
>> +	/* Pixel Format */
>> +	val = readl(dw_dev->mmio + DW100_DEWARP_CTRL);
>> +
>> +	val &= ~DW100_DEWARP_CTRL_OUTPUT_FORMAT_MASK;
>> +	val |= DW100_DEWARP_CTRL_OUTPUT_FORMAT(fmt->reg_format);
>> +
>> +	writel(val, dw_dev->mmio + DW100_DEWARP_CTRL);
>> +
>> +	/* Swap */
>> +	val = readl(dw_dev->mmio + DW100_SWAP_CONTROL);
>> +
>> +	val &= ~DW100_SWAP_CONTROL_DST_MASK;
>> +
>> +	/*
>> +	 * Avoid to swap twice
>> +	 */
>> +	if (fmt->reg_swap_uv ^
>> +	    (ifmt->reg_swap_uv && ifmt->reg_format !=
>> +	     DW100_DEWARP_CTRL_FORMAT_YUV422_PACKED)) {
>> +		if (fmt->reg_format == DW100_DEWARP_CTRL_FORMAT_YUV422_PACKED)
>> +			val |= DW100_SWAP_CONTROL_DST(DW100_SWAP_CONTROL_Y
>> +						      (DW100_SWAP_CONTROL_BYTE));
>> +		else
>> +			val |= DW100_SWAP_CONTROL_DST(DW100_SWAP_CONTROL_UV
>> +						      (DW100_SWAP_CONTROL_BYTE));
>> +	}
>> +
>> +	writel(val, dw_dev->mmio + DW100_SWAP_CONTROL);
>> +
>> +	/* Image resolution */
>> +	writel(DW100_IMG_SIZE_WIDTH(width) | DW100_IMG_SIZE_HEIGHT(height),
>> +	       dw_dev->mmio + DW100_DST_IMG_SIZE);
>> +	writel(stride, dw_dev->mmio + DW100_DST_IMG_STRIDE);
>> +
>> +	val = ALIGN(stride * height, 16);
>> +	writel(DW100_IMG_Y_BASE(addr), dw_dev->mmio + DW100_DST_IMG_Y_BASE);
>> +	writel(DW100_IMG_UV_BASE(addr + val),
>> +	       dw_dev->mmio + DW100_DST_IMG_UV_BASE);
>> +	writel(DW100_DST_IMG_Y_SIZE(val), dw_dev->mmio + DW100_DST_IMG_Y_SIZE1);
>> +
>> +	if (fmt->reg_format == DW100_DEWARP_CTRL_FORMAT_YUV420_SP)
>> +		val /= 2;
>> +
>> +	writel(DW100_DST_IMG_UV_SIZE(val),
>> +	       dw_dev->mmio + DW100_DST_IMG_UV_SIZE1);
>> +}
>> +
>> +static void dw100_hw_set_mapping(struct dw100_device *dw_dev, dma_addr_t addr,
>> +				 u32 width, u32 height)
>> +{
>> +	dprintk(1, dw_dev, "Set HW mapping registers for %dx%d addr:%pa", width,
>> +		height, &addr);
>> +
>> +	writel(DW100_MAP_LUT_ADDR_ADDR(addr), dw_dev->mmio + DW100_MAP_LUT_ADDR);
>> +	writel(DW100_MAP_LUT_SIZE_WIDTH(width)
>> +		| DW100_MAP_LUT_SIZE_HEIGHT(height),
>> +			dw_dev->mmio + DW100_MAP_LUT_SIZE);
>> +}
>> +
>> +static void dw100_hw_clear_irq(struct dw100_device *dw_dev, unsigned int irq)
>> +{
>> +	writel(DW100_INTERRUPT_STATUS_INT_CLEAR(irq),
>> +	       dw_dev->mmio + DW100_INTERRUPT_STATUS);
>> +}
>> +
>> +static void dw100_hw_enable_irq(struct dw100_device *dw_dev)
>> +{
>> +	writel(DW100_INTERRUPT_STATUS_INT_ENABLE_MASK,
>> +	       dw_dev->mmio + DW100_INTERRUPT_STATUS);
>> +}
>> +
>> +static void dw100_hw_disable_irq(struct dw100_device *dw_dev)
>> +{
>> +	writel(0, dw_dev->mmio + DW100_INTERRUPT_STATUS);
>> +}
>> +
>> +static bool dw100_hw_is_frame_running(struct dw100_device *dw_dev)
>> +{
>> +	bool is_running = readl(dw_dev->mmio + DW100_INTERRUPT_STATUS)
>> +				& DW100_INTERRUPT_STATUS_FRAME_BUSY;
>> +
>> +	return is_running;
>> +}
>> +
>> +static u32 dw_hw_get_pending_irqs(struct dw100_device *dw_dev)
>> +{
>> +	u32 val;
>> +
>> +	val = readl(dw_dev->mmio + DW100_INTERRUPT_STATUS);
>> +
>> +	return DW100_INTERRUPT_STATUS_INT_STATUS(val);
>> +}
>> +
>> +static irqreturn_t dw100_irq_handler(int irq, void *dev_id)
>> +{
>> +	struct dw100_device *dw_dev = dev_id;
>> +	u32 pending_irqs, err_irqs, frame_done_irq;
>> +	bool with_error = true;
>> +
>> +	pending_irqs = dw_hw_get_pending_irqs(dw_dev);
>> +	frame_done_irq = pending_irqs & DW100_INTERRUPT_STATUS_INT_FRAME_DONE;
>> +	err_irqs = DW100_INTERRUPT_STATUS_INT_ERR_STATUS(pending_irqs);
>> +
>> +	if (frame_done_irq) {
>> +		dprintk(3, dw_dev, "Frame done interrupt\n");
>> +		with_error = false;
>> +		err_irqs &= ~DW100_INTERRUPT_STATUS_INT_ERR_STATUS
>> +			(DW100_INTERRUPT_STATUS_INT_ERR_FRAME_DONE);
>> +	}
>> +
>> +	if (err_irqs)
>> +		v4l2_err(&dw_dev->v4l2_dev, "Interrupt error: %#x\n", err_irqs);
>> +
>> +	dw100_hw_disable_irq(dw_dev);
>> +	dw100_hw_master_bus_disable(dw_dev);
>> +	dw100_hw_clear_irq(dw_dev, pending_irqs |
>> +			   DW100_INTERRUPT_STATUS_INT_ERR_TIME_OUT);
>> +
>> +	dw100_job_finish(dw_dev, with_error);
>> +
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static void dw100_start(struct dw100_ctx *ctx, struct vb2_v4l2_buffer *in_vb,
>> +			struct vb2_v4l2_buffer *out_vb)
>> +{
>> +	struct dw100_device *dw_dev = ctx->dw_dev;
>> +	dma_addr_t p_in, p_out;
>> +
>> +	p_in = vb2_dma_contig_plane_dma_addr(&in_vb->vb2_buf, 0);
>> +	p_out = vb2_dma_contig_plane_dma_addr(&out_vb->vb2_buf, 0);
>> +	if (!p_in || !p_out) {
>> +		v4l2_err(&dw_dev->v4l2_dev,
>> +			 "Acquiring DMA addresses of buffers failed\n");
>> +		return;
>> +	}
>> +
>> +	out_vb->sequence =
>> +		get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE)->sequence++;
>> +	in_vb->sequence =
>> +		get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT)->sequence++;
>> +
>> +	dprintk(1, ctx->dw_dev,
>> +		"Starting queues %p->%p buffers d:%pa->d:%pa, sequence %d->%d\n",
>> +		v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT),
>> +		v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE),
>> +		&p_in, &p_out, in_vb->sequence, out_vb->sequence);
>> +
>> +	out_vb->vb2_buf.timestamp = in_vb->vb2_buf.timestamp;
>> +	out_vb->field = in_vb->field;
>> +	if (in_vb->flags & V4L2_BUF_FLAG_TIMECODE)
>> +		out_vb->timecode = in_vb->timecode;
>> +	out_vb->flags = in_vb->flags &
>> +		(V4L2_BUF_FLAG_TIMECODE |
>> +		 V4L2_BUF_FLAG_KEYFRAME |
>> +		 V4L2_BUF_FLAG_PFRAME |
>> +		 V4L2_BUF_FLAG_BFRAME |
>> +		 V4L2_BUF_FLAG_TIMESTAMP_MASK |
>> +		 V4L2_BUF_FLAG_TSTAMP_SRC_MASK);
> 
> v4l2_m2m_buf_copy_metadata() will handle this for you. I think you can
> call it here, or in dw100_job_finish().
> 
>> +
>> +	/* Now, let's deal with hardware ... */
>> +	dw100_hw_master_bus_disable(dw_dev);
>> +	if (!ctx->map)
>> +		dw100_create_mapping(ctx);
>> +
>> +	dw100_hw_init_ctrl(dw_dev);
>> +	dw100_hw_set_pixel_boundary(dw_dev);
>> +	dw100_hw_set_src_crop(dw_dev, &ctx->q_data[V4L2_M2M_SRC],
>> +			      &ctx->q_data[V4L2_M2M_DST]);
>> +	dw100_hw_set_source(dw_dev, &ctx->q_data[V4L2_M2M_SRC], p_in);
>> +	dw100_hw_set_destination(dw_dev, &ctx->q_data[V4L2_M2M_DST],
>> +				 ctx->q_data[V4L2_M2M_SRC].fmt, p_out);
>> +	dw100_hw_set_mapping(dw_dev, ctx->map_dma,
>> +			     ctx->map_width, ctx->map_height);
>> +	dw100_hw_enable_irq(dw_dev);
>> +	dw100_hw_dewarp_start(dw_dev);
>> +
>> +	/* Enable Bus */
>> +	dw100_hw_master_bus_enable(dw_dev);
>> +}
>> +
>> +static void dw100_device_run(void *priv)
>> +{
>> +	struct dw100_ctx *ctx = priv;
>> +	struct vb2_v4l2_buffer *src_buf, *dst_buf;
>> +
>> +	src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
>> +	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
>> +
>> +	dw100_start(ctx, src_buf, dst_buf);
>> +}
>> +
>> +static int dw100_job_ready(void *priv)
>> +{
>> +	struct dw100_ctx *ctx = priv;
>> +
>> +	if (v4l2_m2m_num_src_bufs_ready(ctx->fh.m2m_ctx) < 1 ||
>> +	    v4l2_m2m_num_dst_bufs_ready(ctx->fh.m2m_ctx) < 1) {
>> +		dprintk(1, ctx->dw_dev, "Not enough buffers available\n");
>> +		return 0;
>> +	}
>> +
>> +	if (dw100_hw_is_frame_running(ctx->dw_dev)) {
>> +		dprintk(1, ctx->dw_dev, "HW still running a frame\n");
>> +		return 0;
>> +	}
>> +
>> +	return 1;
>> +}
> 
> As far as I understand you could drop this function, as the default
> implementation when not provided is to assume that one source buffer and
> one destination buffer are all that is required.
> 
>> +
>> +static const struct v4l2_m2m_ops dw100_m2m_ops = {
>> +	.device_run	= dw100_device_run,
>> +	.job_ready	= dw100_job_ready,
>> +};
>> +
>> +#ifdef CONFIG_MEDIA_CONTROLLER
>> +static const struct media_device_ops dw100_media_ops = {
>> +	.req_validate = vb2_request_validate,
>> +	.req_queue = v4l2_m2m_request_queue,
>> +};
> 
> Do we need the request API ? I think you can drop this.
> 
>> +#endif
>> +
>> +static struct video_device *dw100_init_video_device(struct dw100_device *dw_dev)
>> +{
>> +	struct video_device *vfd = &dw_dev->vfd;
>> +
>> +	vfd->vfl_dir = VFL_DIR_M2M;
>> +	vfd->fops = &dw100_fops;
>> +	vfd->device_caps = V4L2_CAP_VIDEO_M2M | V4L2_CAP_STREAMING;
>> +	vfd->ioctl_ops = &dw100_ioctl_ops;
>> +	vfd->minor = -1;
>> +	vfd->release = video_device_release_empty;
>> +	vfd->v4l2_dev = &dw_dev->v4l2_dev;
>> +	vfd->lock = &dw_dev->vfd_mutex;
>> +
>> +	strscpy(vfd->name, DRV_NAME, sizeof(vfd->name));
>> +	mutex_init(vfd->lock);
> 
> Missing corresponding mutex_destroy().
> 
>> +	video_set_drvdata(vfd, dw_dev);
>> +
>> +	return vfd;
>> +}
>> +
>> +static int dw100_dump_regs_show(struct seq_file *m, void *private)
>> +{
>> +	struct dw100_device *dw_dev = m->private;
>> +	int ret;
>> +
>> +	ret = pm_runtime_resume_and_get(&dw_dev->pdev->dev);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	ret = dw100_dump_regs(dw_dev);
> 
> I'd inline the function here as there's a single caller.
> 
>> +
>> +	pm_runtime_put_sync(&dw_dev->pdev->dev);
>> +
>> +	return ret;
>> +}
>> +DEFINE_SHOW_ATTRIBUTE(dw100_dump_regs);
>> +
>> +static void dw100_debugfs_init(struct dw100_device *dw_dev)
>> +{
>> +	dw_dev->debugfs_root =
>> +		debugfs_create_dir(dev_name(&dw_dev->pdev->dev), NULL);
>> +
>> +	debugfs_create_file("dump_regs", 0600, dw_dev->debugfs_root, dw_dev,
>> +			    &dw100_dump_regs_fops);
>> +}
>> +
>> +static void dw100_debugfs_exit(struct dw100_device *dw_dev)
>> +{
>> +	debugfs_remove_recursive(dw_dev->debugfs_root);
>> +}
>> +
>> +static int dw100_probe(struct platform_device *pdev)
>> +{
>> +	struct dw100_device *dw_dev;
>> +	struct video_device *vfd;
>> +	struct resource *res;
>> +	int ret = 0;
> 
> No need to initialize ret to 0.
> 
>> +	int irq;
>> +
>> +	dw_dev = devm_kzalloc(&pdev->dev, sizeof(*dw_dev), GFP_KERNEL);
>> +	if (!dw_dev)
>> +		return -ENOMEM;
>> +	dw_dev->pdev = pdev;
>> +
>> +	ret = devm_clk_bulk_get_all(&pdev->dev, &dw_dev->clks);
>> +	if (ret < 0) {
>> +		dev_err(&pdev->dev, "Unable to get clocks: %d\n", ret);
>> +		return ret;
>> +	}
>> +	dw_dev->num_clks = ret;
>> +
>> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +	dw_dev->mmio = devm_ioremap_resource(&pdev->dev, res);
>> +	if (IS_ERR(dw_dev->mmio))
>> +		return PTR_ERR(dw_dev->mmio);
>> +
>> +	irq = platform_get_irq(pdev, 0);
>> +	if (irq < 0)
>> +		return irq;
>> +
>> +	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL, dw100_irq_handler,
> 
> Why do we need a threaded IRQ handler ?
> 
>> +					IRQF_ONESHOT, dev_name(&pdev->dev),
>> +					dw_dev);
>> +	if (ret < 0) {
>> +		dev_err(&pdev->dev, "Failed to request irq: %d\n", ret);
>> +		return ret;
>> +	}
> 
> I'm always a bit worried when requesting an IRQ before we ensure the
> device won't generate an interrupt.
> 
>> +
>> +	platform_set_drvdata(pdev, dw_dev);
>> +
>> +	pm_runtime_enable(&pdev->dev);
>> +	ret = pm_runtime_resume_and_get(&pdev->dev);
>> +	if (ret < 0) {
>> +		dev_err(&pdev->dev, "Unable to enable clks: %d\n", ret);
>> +		goto err_clk;
>> +	}
>> +
>> +	dw100_hw_reset(dw_dev);
>> +
>> +	pm_runtime_put_sync(&pdev->dev);
> 
> I wonder if the device should be reset every time runtime PM resumes.
> The dw100_hw_reset() call could move to a runtime PM resume handler, and
> this could then be dropped.
> 
>> +
>> +	spin_lock_init(&dw_dev->irqlock);
>> +
>> +	ret = v4l2_device_register(&pdev->dev, &dw_dev->v4l2_dev);
>> +	if (ret)
>> +		goto err_clk;
>> +
>> +	vfd = dw100_init_video_device(dw_dev);
>> +
>> +	dw_dev->m2m_dev = v4l2_m2m_init(&dw100_m2m_ops);
>> +	if (IS_ERR(dw_dev->m2m_dev)) {
>> +		v4l2_err(&dw_dev->v4l2_dev, "Failed to init mem2mem device\n");
>> +		ret = PTR_ERR(dw_dev->m2m_dev);
>> +		goto err_v4l2;
>> +	}
>> +
>> +#ifdef CONFIG_MEDIA_CONTROLLER
> 
> Let's make this unconditional as the MC API is needed by libcamera to
> enumerate media devices.
> 
>> +	dw_dev->mdev.dev = &pdev->dev;
>> +	strscpy(dw_dev->mdev.model, "dw100", sizeof(dw_dev->mdev.model));
>> +	strscpy(dw_dev->mdev.bus_info, "platform:dw100",
>> +		sizeof(dw_dev->mdev.bus_info));
> 
> No needed anymore either, it's handled by the core.
> 
>> +	media_device_init(&dw_dev->mdev);
>> +	dw_dev->mdev.ops = &dw100_media_ops;
>> +	dw_dev->v4l2_dev.mdev = &dw_dev->mdev;
>> +#endif
>> +
>> +	ret = video_register_device(vfd, VFL_TYPE_VIDEO, -1);
>> +	if (ret) {
>> +		v4l2_err(&dw_dev->v4l2_dev, "Failed to register video device\n");
>> +		goto err_m2m;
>> +	}
>> +
>> +#ifdef CONFIG_MEDIA_CONTROLLER
>> +	ret = v4l2_m2m_register_media_controller(dw_dev->m2m_dev, vfd,
>> +						 MEDIA_ENT_F_PROC_VIDEO_SCALER);
>> +	if (ret) {
>> +		v4l2_err(&dw_dev->v4l2_dev, "Failed to init mem2mem media controller\n");
> 
> I'd use dev_err() (and dev_info(), ...) through the driver.
> 
>> +		goto error_v4l2;
>> +	}
>> +
>> +	ret = media_device_register(&dw_dev->mdev);
>> +	if (ret) {
>> +		v4l2_err(&dw_dev->v4l2_dev, "Failed to register mem2mem media device\n");
>> +		goto error_m2m_mc;
>> +	}
>> +#endif
>> +
>> +	dw100_debugfs_init(dw_dev);
>> +
>> +	v4l2_info(&dw_dev->v4l2_dev,
>> +		  "dw100 v4l2 m2m registered as /dev/video%d\n", vfd->num);
>> +
>> +	return 0;
> 
> A blank line would be nice.
> 
>> +#ifdef CONFIG_MEDIA_CONTROLLER
>> +error_m2m_mc:
>> +	v4l2_m2m_unregister_media_controller(dw_dev->m2m_dev);
>> +error_v4l2:
>> +	video_unregister_device(vfd);
>> +#endif
>> +err_m2m:
>> +	v4l2_m2m_release(dw_dev->m2m_dev);
>> +err_v4l2:
>> +	v4l2_device_unregister(&dw_dev->v4l2_dev);
>> +err_clk:
>> +	pm_runtime_disable(&pdev->dev);
>> +
>> +	return ret;
>> +}
>> +
>> +static int dw100_remove(struct platform_device *pdev)
>> +{
>> +	struct dw100_device *dw_dev = platform_get_drvdata(pdev);
>> +
>> +	dw100_debugfs_exit(dw_dev);
>> +
>> +	pm_runtime_disable(&pdev->dev);
>> +
>> +#ifdef CONFIG_MEDIA_CONTROLLER
>> +	media_device_unregister(&dw_dev->mdev);
>> +	v4l2_m2m_unregister_media_controller(dw_dev->m2m_dev);
>> +	media_device_cleanup(&dw_dev->mdev);
>> +#endif
>> +
>> +	video_unregister_device(&dw_dev->vfd);
>> +	v4l2_m2m_release(dw_dev->m2m_dev);
>> +	v4l2_device_unregister(&dw_dev->v4l2_dev);
>> +
>> +	return 0;
>> +}
>> +
>> +static int __maybe_unused dw100_runtime_suspend(struct device *dev)
>> +{
>> +	struct dw100_device *dw_dev = dev_get_drvdata(dev);
>> +
>> +	clk_bulk_disable_unprepare(dw_dev->num_clks, dw_dev->clks);
>> +
>> +	return 0;
>> +}
>> +
>> +static int __maybe_unused dw100_runtime_resume(struct device *dev)
>> +{
>> +	struct dw100_device *dw_dev = dev_get_drvdata(dev);
>> +
>> +	return clk_bulk_prepare_enable(dw_dev->num_clks, dw_dev->clks);
>> +}
>> +
>> +static const struct dev_pm_ops dw100_pm = {
>> +	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
>> +				pm_runtime_force_resume)
>> +	SET_RUNTIME_PM_OPS(dw100_runtime_suspend,
>> +			   dw100_runtime_resume, NULL)
>> +};
>> +
>> +static const struct of_device_id dw100_dt_ids[] = {
>> +	{ .compatible = "nxp,imx8mp-dw100", .data = NULL },
>> +	{ },
>> +};
>> +MODULE_DEVICE_TABLE(of, dw100_dt_ids);
>> +
>> +static struct platform_driver dw100_driver = {
>> +	.probe		= dw100_probe,
>> +	.remove		= dw100_remove,
>> +	.driver		= {
>> +		.name	= DRV_NAME,
>> +		.pm = &dw100_pm,
>> +		.of_match_table = dw100_dt_ids,
>> +	},
>> +};
>> +
>> +module_platform_driver(dw100_driver);
>> +
>> +MODULE_DESCRIPTION("DW100 Hardware dewarper");
>> +MODULE_AUTHOR("Xavier Roumegue <Xavier.Roumegue@oss.nxp.com>");
>> +MODULE_LICENSE("GPL");
>> diff --git a/drivers/media/platform/nxp/dw100/dw100_regs.h b/drivers/media/platform/nxp/dw100/dw100_regs.h
>> new file mode 100644
>> index 000000000000..c540f6c638db
>> --- /dev/null
>> +++ b/drivers/media/platform/nxp/dw100/dw100_regs.h
>> @@ -0,0 +1,118 @@
>> +/* SPDX-License-Identifier: GPL-2.0+ */
>> +/*
>> + * DW100 Hardware dewarper
>> + *
>> + * Copyright 2022 NXP
>> + * Author: Xavier Roumegue (xavier.roumegue@oss.nxp.com)
>> + *
> 
> Extra blank line.
> 
>> + */
>> +
>> +#ifndef _DW100_REGS_H_
>> +#define _DW100_REGS_H_
>> +
>> +/* AHB register offset */
>> +#define DW100_DEWARP_ID			0x00
>> +#define DW100_DEWARP_CTRL		0x04
>> +#define DW100_DEWARP_CTRL_ENABLE			BIT(0)
>> +#define DW100_DEWARP_CTRL_START				BIT(1)
>> +#define DW100_DEWARP_CTRL_SOFT_RESET			BIT(2)
>> +#define DW100_DEWARP_CTRL_FORMAT_YUV422_SP		(0UL)
> 
> No need for parentheses. Same below where applicable.
> 
>> +#define DW100_DEWARP_CTRL_FORMAT_YUV422_PACKED		(1UL)
>> +#define DW100_DEWARP_CTRL_FORMAT_YUV420_SP		(2UL)
>> +#define DW100_DEWARP_CTRL_INPUT_FORMAT_MASK		GENMASK(5, 4)
>> +#define DW100_DEWARP_CTRL_INPUT_FORMAT(x)		((x) << 4)
>> +#define DW100_DEWARP_CTRL_OUTPUT_FORMAT(x)		((x) << 6)
>> +#define DW100_DEWARP_CTRL_OUTPUT_FORMAT_MASK		GENMASK(7, 6)
>> +#define DW100_DEWARP_CTRL_SRC_AUTO_SHADOW		BIT(8)
>> +#define DW100_DEWARP_CTRL_HW_HANDSHAKE			BIT(9)
>> +#define DW100_DEWARP_CTRL_DST_AUTO_SHADOW		BIT(10)
>> +#define DW100_DEWARP_CTRL_SPLIT_LINE			BIT(11)
>> +#define DW100_DEWARP_CTRL_PREFETCH_MODE_MASK		GENMASK(17, 16)
>> +#define DW100_DEWARP_CTRL_PREFETCH_MODE_TRAVERSAL	(0UL << 16)
>> +#define DW100_DEWARP_CTRL_PREFETCH_MODE_CALCULATION	(1UL << 16)
>> +#define DW100_DEWARP_CTRL_PREFETCH_MODE_AUTO		(2UL << 16)
>> +#define DW100_DEWARP_CTRL_PREFETCH_THRESHOLD_MASK	GENMASK(24, 18)
>> +#define DW100_DEWARP_CTRL_PREFETCH_THRESHOLD(x)		((x) << 18)
>> +
>> +#define DW100_MAP_LUT_ADDR		0x08
>> +#define DW100_MAP_LUT_ADDR_ADDR(addr)	(((addr) >> 4) & GENMASK(29, 0))
>> +#define DW100_MAP_LUT_SIZE		0x0C
> 
> I usually ask for lower-case hex constants as that's what is often done
> in V4L2, but maybe it's too much nit-picking :-)
> 
>> +#define DW100_MAP_LUT_SIZE_WIDTH(w)	(((w) & GENMASK(10, 0)) << 0)
>> +#define DW100_MAP_LUT_SIZE_HEIGHT(h)	(((h) & GENMASK(10, 0)) << 16)
>> +#define DW100_SRC_IMG_Y_BASE		0x10
>> +#define DW100_IMG_Y_BASE(base)		(((base) >> 4) & GENMASK(29, 0))
>> +#define DW100_SRC_IMG_UV_BASE		0x14
>> +#define DW100_IMG_UV_BASE(base)		(((base) >> 4) & GENMASK(29, 0))
>> +#define DW100_SRC_IMG_SIZE		0x18
>> +#define DW100_IMG_SIZE_WIDTH(w)		(((w) & GENMASK(12, 0)) << 0)
>> +#define DW100_IMG_SIZE_HEIGHT(h)	(((h) & GENMASK(12, 0)) << 16)
>> +
>> +#define DW100_SRC_IMG_STRIDE		0x1C
>> +#define DW100_MAP_LUT_ADDR2		0x20
>> +#define DW100_MAP_LUT_SIZE2		0x24
>> +#define DW100_SRC_IMG_Y_BASE2		0x28
>> +#define DW100_SRC_IMG_UV_BASE2		0x2C
>> +#define DW100_SRC_IMG_SIZE2		0x30
>> +#define DW100_SRC_IMG_STRIDE2		0x34
>> +#define DW100_DST_IMG_Y_BASE		0x38
>> +#define DW100_DST_IMG_UV_BASE		0x3C
>> +#define DW100_DST_IMG_SIZE		0x40
>> +#define DW100_DST_IMG_STRIDE		0x44
>> +#define DW100_DST_IMG_Y_BASE2		0x48
>> +#define DW100_DST_IMG_UV_BASE2		0x4C
>> +#define DW100_DST_IMG_SIZE2		0x50
>> +#define DW100_DST_IMG_STRIDE2		0x54
>> +#define DW100_SWAP_CONTROL		0x58
>> +#define DW100_SWAP_CONTROL_BYTE		BIT(0)
>> +#define DW100_SWAP_CONTROL_SHORT	BIT(1)
>> +#define DW100_SWAP_CONTROL_WORD		BIT(2)
>> +#define DW100_SWAP_CONTROL_LONG		BIT(3)
>> +#define DW100_SWAP_CONTROL_Y(x)		(((x) & GENMASK(3, 0)) << 0)
>> +#define DW100_SWAP_CONTROL_UV(x)	(((x) & GENMASK(3, 0)) << 4)
>> +#define DW100_SWAP_CONTROL_SRC(x)	(((x) & GENMASK(7, 0)) << 0)
>> +#define DW100_SWAP_CONTROL_DST(x)	(((x) & GENMASK(7, 0)) << 8)
>> +#define DW100_SWAP_CONTROL_SRC2(x)	(((x) & GENMASK(7, 0)) << 16)
>> +#define DW100_SWAP_CONTROL_DST2(x)	(((x) & GENMASK(7, 0)) << 24)
>> +#define DW100_SWAP_CONTROL_SRC_MASK	GENMASK(7, 0)
>> +#define DW100_SWAP_CONTROL_DST_MASK	GENMASK(15, 8)
>> +#define DW100_SWAP_CONTROL_SRC2_MASK	GENMASK(23, 16)
>> +#define DW100_SWAP_CONTROL_DST2_MASK	GENMASK(31, 24)
>> +#define DW100_VERTICAL_SPLIT_LINE	0x5C
>> +#define DW100_HORIZON_SPLIT_LINE	0x60
>> +#define DW100_SCALE_FACTOR		0x64
>> +#define DW100_ROI_START			0x68
>> +#define DW100_ROI_START_X(x)		(((x) & GENMASK(12, 0)) << 0)
>> +#define DW100_ROI_START_Y(y)		(((y) & GENMASK(12, 0)) << 16)
>> +#define DW100_BOUNDARY_PIXEL		0x6C
>> +#define DW100_BOUNDARY_PIXEL_V(v)	(((v) & GENMASK(7, 0)) << 0)
>> +#define DW100_BOUNDARY_PIXEL_U(u)	(((u) & GENMASK(7, 0)) << 8)
>> +#define DW100_BOUNDARY_PIXEL_Y(y)	(((y) & GENMASK(7, 0)) << 16)
>> +
>> +#define DW100_INTERRUPT_STATUS		0x70
>> +#define DW100_INTERRUPT_STATUS_INT_FRAME_DONE		BIT(0)
>> +#define DW100_INTERRUPT_STATUS_INT_ERR_TIME_OUT		BIT(1)
>> +#define DW100_INTERRUPT_STATUS_INT_ERR_AXI_RESP		BIT(2)
>> +#define DW100_INTERRUPT_STATUS_INT_ERR_X		BIT(3)
>> +#define DW100_INTERRUPT_STATUS_INT_ERR_MB_FETCH		BIT(4)
>> +#define DW100_INTERRUPT_STATUS_INT_ERR_FRAME2		BIT(5)
>> +#define DW100_INTERRUPT_STATUS_INT_ERR_FRAME3		BIT(6)
>> +#define DW100_INTERRUPT_STATUS_INT_ERR_FRAME_DONE	BIT(7)
>> +#define DW100_INTERRUPT_STATUS_INT_ERR_STATUS(x)	(((x) >> 1) & 0x7f)
>> +#define DW100_INTERRUPT_STATUS_INT_STATUS(x)		((x) & 0xff)
>> +
>> +#define DW100_INTERRUPT_STATUS_INT_ENABLE_MASK		GENMASK(15, 8)
>> +#define DW100_INTERRUPT_STATUS_INT_ENABLE(x)		(((x) & GENMASK(7, 0)) << 8)
>> +#define DW100_INTERRUPT_STATUS_FRAME_BUSY		BIT(16)
>> +#define DW100_INTERRUPT_STATUS_INT_CLEAR(x)		(((x) & GENMASK(7, 0)) << 24)
>> +#define DW100_BUS_CTRL			0x74
>> +#define DW100_BUS_CTRL_AXI_MASTER_ENABLE	BIT(31)
>> +#define DW100_BUS_CTRL1			0x78
>> +#define DW100_BUS_TIME_OUT_CYCLE	0x7C
>> +#define DW100_DST_IMG_Y_SIZE1		0x80
>> +#define DW100_DST_IMG_Y_SIZE(sz)	(((sz) >> 4) & GENMASK(29, 0))
>> +#define DW100_DST_IMG_UV_SIZE(sz)	(((sz) >> 4) & GENMASK(29, 0))
>> +#define DW100_DST_IMG_UV_SIZE1		0x84
>> +#define DW100_DST_IMG_Y_SIZE2		0x88
>> +#define DW100_DST_IMG_UV_SIZE2		0x8C
>> +
>> +#endif /* _DW100_REGS_H_ */
> 

Regards,
  Xavier
