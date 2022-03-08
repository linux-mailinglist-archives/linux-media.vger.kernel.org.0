Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB2934D21C7
	for <lists+linux-media@lfdr.de>; Tue,  8 Mar 2022 20:43:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345733AbiCHToE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Mar 2022 14:44:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344473AbiCHToD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Mar 2022 14:44:03 -0500
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80041.outbound.protection.outlook.com [40.107.8.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE2433526C;
        Tue,  8 Mar 2022 11:43:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X7CgEQQlKQ5+MgWRgHGL7KF6nFamxjuEuQxygwl24RbKnCb/tD0BpKaWlCPuZf9qUr/0cjijeiybqBVk7tS+NJw/sqYfJ3+YD+xWQxT5JNe6sRWLQWv5efjW75SHKH2LoXFtjOVrdIe0FKeEr62w6BwAPd5G1DWBPCaF6tzjPZj9LgffIi5ow0/0dvG3uBbWNnjxF46nLCpfSSiHCtYXjE5ENlxhmJv6N51I4HVZKqO7mB5tNfg6Hu7j7svhEia/NHV+Rn41uo6PuqW88dRs2/DsfoMf15MsMqlk8Xv9khoZeVPHKsU3Tmbh5b0oB6cEwmPVLy3TwmF8Q+X2kYz2Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LgOS8FTorzwXHUcX+oyiHpUkt9t8duCA4b1pZaDPrMY=;
 b=LCK1CNf7LSJtPVme7/y3QaKkMOOGncyCdshGLBo86IqIYzQaZfkTmcsWEAsGzC5lJrP3K0pXkGFA2GsnhSTCue5wkxjRvvEWfVSmttNS07goXHjjI/EwWN+wRWHUM0P8NyECr7purxdlSrqo8orI49JBTCeY+ZWErQJPcJG2kwwM5Gr+wUVeoNEpKls/yr1yHTVjpW2QuPk4a3t8A09BiYR54rRcFCdVsPZFulO3LxOYZHoJ5FIxMZIlH4T4uXeHIgD/QGTPn/gQUH0Wzv/IAPpaCT8Th0UM1UieFqfYU+bwc0rACGy4MT2EoZ9CDKFOpXwrQeFx9OytqdUm4f5fWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LgOS8FTorzwXHUcX+oyiHpUkt9t8duCA4b1pZaDPrMY=;
 b=ZjbWq0Zp2Ohm7Tob7ghuC9u30AUTB0g2mayz5eAlYRKjGPRQefp7KN2Tatzw71YwWwCEpgsgmc2teyO8So6/Wv2c7H7bLVbTa68w078frTBoQToKnQiqK1TPi1ilLj9Ib6evlpoXHrF/HF/wSQs/fFw1DVhlVKiWjN1DHgL60kU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by VI1PR04MB4928.eurprd04.prod.outlook.com (2603:10a6:803:57::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Tue, 8 Mar
 2022 19:43:01 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::a037:bc8:44b:5965]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::a037:bc8:44b:5965%3]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 19:43:01 +0000
Message-ID: <986c4b3c-e346-e5b5-7fc9-497d8a4fc89f@oss.nxp.com>
Date:   Tue, 8 Mar 2022 20:42:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 6/9] media: uapi: Add a control for DW100 driver
Content-Language: en-US
To:     Nicolas Dufresne <nicolas@ndufresne.ca>, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, stanimir.varbanov@linaro.org,
        laurent.pinchart@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
        robh+dt@kernel.org
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20220308184829.38242-1-xavier.roumegue@oss.nxp.com>
 <20220308184829.38242-7-xavier.roumegue@oss.nxp.com>
 <1b2f72c783e7a83956acc788888c539bb83fe995.camel@ndufresne.ca>
From:   "Xavier Roumegue (OSS)" <xavier.roumegue@oss.nxp.com>
In-Reply-To: <1b2f72c783e7a83956acc788888c539bb83fe995.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR0P264CA0239.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1e::35) To PAXPR04MB8703.eurprd04.prod.outlook.com
 (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 60360074-fb2d-4f47-1331-08da013bdaec
X-MS-TrafficTypeDiagnostic: VI1PR04MB4928:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB4928A42A264B1914AE78628ABA099@VI1PR04MB4928.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eYMuNcOys006ouTmCECqeudelvNTL0YAExZWn0vSnVEFIfJtlDUpIUf+KQwMO2Y+iILxjXS4QooTrb14Ay91bQQpVasur5Ol8jzHp5h7y4tq3N33VzBM454omBqqyIt5XKuv8OLmBIMGwJmSHEWY7/a7IQZ5HJhWvql4+dpvgBADEl+cn0Mo15PHiWypaOzNKEmPG9gY/52RaVHeEl0RVeItr0RqnNWAHv0RisM9BANWxbQZ3Hx3wOMKMB2SKGB97JMLNyTwTk/kpFXxEEbpRDU7AYhFgSd5tcgF5OHBOFgOHtmZi98ii0aINqEDbX16K+Lfhwc871KQxmCEF/dY1jUjBnIjG2o7T0wSvysKADOQbn61ZzftncNIslMYIQtBb7f9b6bgRxQ0z8ZY6EBE+6bCyB6eQrPDiUUzB+9m70NpHwsj31vAOEtHZcclIvZEHYUeC8+7yBclc9RqxKnpFEt49lSNLrpPBiXCJ4A+tBmrJIsA1eHuLS28qv1icqER5Bw6MAysPdKH9OAPDMoy/7/Gwg2CzFD0XI3CgG80RwTpV71onuVRH1jsjJGX53/mxmFBGrCe6kUmhhabAb6rQLMECJm1XuY+wqZjkuu5SSTD+5Xd8IdKUQHENEdrUGBuX2YSwqpk5ywpajTE/+58sx83cbkcBm/WGaKfOwHTg2hJWYmCP57qEX1A1g5GFe5jPNT/k8btMBQbWFImufJGjyt+bMqrKy0jx8GmIVYkHi8LmAExl9rTZBCLA0Hi7CvOCqXAn22ZMT89LenMESCr7NWjGxwHb5VDmQHw5dPI9atePUtzXv5TzzYk5nP2yVBt
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8936002)(2906002)(316002)(186003)(6486002)(966005)(508600001)(31686004)(6506007)(52116002)(53546011)(2616005)(6512007)(38100700002)(83380400001)(31696002)(5660300002)(8676002)(66556008)(66946007)(4326008)(66476007)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YlB5UFRaS2l5V1BMTS8vdC9XaEpNcFJpRzlLVEdtRjFncHo2eXNUbUdVVE1o?=
 =?utf-8?B?dFRSYTJZQjFEZWxCRzlFeVhCaSszcnAvZTdCR3dxMFMybFRMVzdqWlM0d1Ix?=
 =?utf-8?B?UWdBcWFKbFNqZkdCM0tmNGFLRVZqTDVzS0NjaHhSbEJkL0JJSGRQWVAvdTJj?=
 =?utf-8?B?bVVBakVVTjVhOWNDc3orNTN4dEYvRkR3TkZoVGExQVJGdFJuSGxzc3JXZDlG?=
 =?utf-8?B?eHByWjJaUVg4YnE1YWd2bzBseWdXUGNSUFZ4d0xEQjRNUDBHNXpVbDRldmw4?=
 =?utf-8?B?QmRncXo1R0QxcW14a3JzR285NHRwZ2VaQTVYWUFrTGZXdzcveGRyN3JJUVk3?=
 =?utf-8?B?NitkckpGcmFvMlVQeDhGS2ZvYVhib2hERnF2U2pINWQxQnIyUTRIK1FrUEZL?=
 =?utf-8?B?S0tBemMxY2JwWTkrSmN5WlBpTE5sQTNiUHFINUpEZlZnczI3U0hHanVhOFR3?=
 =?utf-8?B?SnVrNEt6TE5ONEl3bXVsYmFueUthK1JyOUFuRzFhY3RxRzlNUE9HVkFCL1Vr?=
 =?utf-8?B?eWpBdFN6WlhoQ2dVbGpnRUdFdVQzRkwzbmlmSzlPV3hiaXI2VmpweWg1U0Fa?=
 =?utf-8?B?azI1OGRSanpnL1NPcXRZMWoxSlpPdkZ1TFpBVGMrTnQ2MkFjbFRkY0tJMDAv?=
 =?utf-8?B?WW51K2ptZlYvWGZualdzLzUvU29WN0lmcDlpS1RTRWlsYk1kdGtqRkM5Und1?=
 =?utf-8?B?K1YrSndHUlowcWZBa25ybXQ4RGhvODhVblNpek1DSG1ZcG1ySkd0cElDaFhp?=
 =?utf-8?B?NnhneE82TGxBK2FRSlhxTHoxNnVCcFNuelcwWk1hZWo2Qk8xZnBkYWNXNzFu?=
 =?utf-8?B?NFlJbDkvZUl1M0xJT0JOSjhPUDBBMDFiaWFDK0lUVUhOeFI5M2M4N1ZvRnNl?=
 =?utf-8?B?U0xvcVEyb3RCTGU2TUI4dTRLMHJzQkxLTW8vZ2pRMWVwOEdyejR4Tzd2ZHh6?=
 =?utf-8?B?cWhXOXdtUnZwQ2FEVVdiSjVQekp4cnpTTjZxUk4wd09qOEt0KzdyMlNUQ3Z6?=
 =?utf-8?B?VTVlcXlkQ2VXRUNjeTdwck9Zd0pqeUJTdVNyRkFUTVJlejhYQ2Q3S1pUVGYz?=
 =?utf-8?B?OUxhRjRPVkRIMWdRY0VFVnV0SVBybUw4cS94RE5BZlNnSkwzWHJmQmtjZlVW?=
 =?utf-8?B?TGNaN0tjYW43eWcvZmc0ZkRHYUs1L2J1ZElTYm9vSGZMU0dGZDdvVG5zZDZt?=
 =?utf-8?B?TGM2L3NVcW9oUms1RHY3a0IzenVPVGdCZ2lnWkNUSlhkTjhnd21vVEN6dlkr?=
 =?utf-8?B?aVU4dURCV2lDTGtuWS96OVE3OE5xWWJqSVhhd1dVSW5DNGtmRlFHRzcyVHJp?=
 =?utf-8?B?amIwdWQ3U2xYbGZ0MnNJeXVBdm5mZFAvZ2JyQStjT2ZQanR3VWp5UUh3L2h0?=
 =?utf-8?B?ZGRGSmNVeU91SXo0TUlZQ3BFRGpwYTdwRkRxS3MzV2NGSWE3NlFWNEZoVjhy?=
 =?utf-8?B?ZmVKd3FWWlZKTGNOL1hMTGczNlR5TXM3SXNQUHJHTENMaEpjQ3oxQ0l6ZHV5?=
 =?utf-8?B?Q3J5TlBaMFR1R0Vhby84SXp3K0M3OUt3ZDJaeDdaTFJyaGN6SnlqbW83ZVd1?=
 =?utf-8?B?TlpOWDBxTW9mdWVta2JzKzBmVEREaU9vUjNBMGM3Qk1nak9kcmxIandUSS8r?=
 =?utf-8?B?NFFiaVlNWDNWNWR2ZmZrMjdyU1pXVEdJSGY5eWFxZVhuVDhuVGtCWHpvUVdO?=
 =?utf-8?B?RVlSUFY2eUxiQW53VEVydWJYR2ZRVzFZeHdmZXlkZEpGS1RodGJreU1KMVJk?=
 =?utf-8?B?Q0syZGRXZC9la2twOFNiQWV5ekp5UUZaSEhYZDg2WlNNeEl4L2VOOVB6Viti?=
 =?utf-8?B?a0d2SmdrRExjVWpVQnZuUjJGRktDandnRk9MQnIxYXBzUk5zUklCS09USWhH?=
 =?utf-8?B?alJPVnlUTllaZlJXVlpaMllKTldUd1hUQlVqcEJ3YWVhVFdiVUZFNjkwd1dk?=
 =?utf-8?B?MTZmTnM2RHJ2blFucCtQeWNMYkVvemYyaGZzSFBrL0tyUjg4UTNFNDhtMlRM?=
 =?utf-8?B?MGl2RHdpcERkZnJCYlR6bHV2VkNwY1pWRVBCcExsYm16OFZtRFNuZkxjYUhx?=
 =?utf-8?B?RlRjVytDV1BLZVd6L1Z3ZmtsS3ordVA2VzV5bFF5R2c5bG1ZcE1EMnVDSXRM?=
 =?utf-8?B?MTZMVWg0Mk10VGlPSE1SdnZhMFJFVnRMSDFCTVEwK0F4eE9RSmZvczFaWjE1?=
 =?utf-8?B?OTFGZllQMjVIalFGVFRQNkRPTGFjSG13NW5SZGp2ZDRZN1FlbFFmL2dOWWsz?=
 =?utf-8?Q?P0zFaYIZPJiKYv335cNTRB7svTEKaJN2jXuCJ90R9w=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60360074-fb2d-4f47-1331-08da013bdaec
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 19:43:01.5511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H4sqf0rervZ+lkbNC1sgXcXjItxnnqZInRvDzc2mPJ7sY2DYUpe62z/tsdLwnO7vxkUSKvpJnh5S4jBab5s2Pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4928
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Nicolas,

On 3/8/22 20:15, Nicolas Dufresne wrote:
> Le mardi 08 mars 2022 à 19:48 +0100, Xavier Roumegue a écrit :
>> The DW100 driver gets the dewarping mapping as a binary blob from the
>> userspace application through a custom control.
>> The blob format is hardware specific so create a dedicated control for
>> this purpose.
>>
>> Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
>> ---
>>   Documentation/userspace-api/media/drivers/dw100.rst |  7 +++++++
>>   include/uapi/linux/dw100.h                          | 11 +++++++++++
>>   2 files changed, 18 insertions(+)
>>   create mode 100644 include/uapi/linux/dw100.h
>>
>> diff --git a/Documentation/userspace-api/media/drivers/dw100.rst b/Documentation/userspace-api/media/drivers/dw100.rst
>> index 20aeae63a94f..3abad05849ad 100644
>> --- a/Documentation/userspace-api/media/drivers/dw100.rst
>> +++ b/Documentation/userspace-api/media/drivers/dw100.rst
>> @@ -20,4 +20,11 @@ match the expected size inherited from the destination image resolution.
>>   More details on the DW100 hardware operations can be found in
>>   *chapter 13.15 DeWarp* of IMX8MP_ reference manuel.
>>   
>> +The Vivante DW100 m2m driver implements the following driver-specific control:
>> +
>> +``V4L2_CID_DW100_MAPPING (integer)``
>> +    Specifies to DW100 driver its dewarping map (aka LUT) blob as described in
>> +    *chapter 13.15.2.3 Dewarping Remap* of IMX8MP_ reference manual as an U32
>> +    dynamic array.
>> +
>>   .. _IMX8MP: https://www.nxp.com/webapp/Download?colCode=IMX8MPIEC
> 
> This point to a document names "i.MX 8M Plus Applications Processor Datasheet
> for Industrial Products" which does not contain that reference.
My bad.. Wrong link. :)
Will repost with correct link.
> 
>> diff --git a/include/uapi/linux/dw100.h b/include/uapi/linux/dw100.h
>> new file mode 100644
>> index 000000000000..0ef926c61cf0
>> --- /dev/null
>> +++ b/include/uapi/linux/dw100.h
>> @@ -0,0 +1,11 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
>> +/* Copyright 2022 NXP */
>> +
>> +#ifndef __UAPI_DW100_H__
>> +#define __UAPI_DW100_H__
>> +
>> +#include <linux/v4l2-controls.h>
>> +
>> +#define V4L2_CID_DW100_MAPPING		(V4L2_CID_USER_DW100_BASE + 1)
>> +
>> +#endif
> 
