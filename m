Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B367E4D4ED6
	for <lists+linux-media@lfdr.de>; Thu, 10 Mar 2022 17:20:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242087AbiCJQUq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Mar 2022 11:20:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242260AbiCJQUj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Mar 2022 11:20:39 -0500
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80087.outbound.protection.outlook.com [40.107.8.87])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 847DA191400;
        Thu, 10 Mar 2022 08:18:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a7k4T1VXmv5LUS1j3nax0UxN+qaOqT9m73dRaf8t6IHuauD+jDeutig8fmrtZ1PlvrWvlQ/4UcPE6NJp0fovhigHjTzJNaluN9fW4CsLMYN/vRpYOCaXFIE8wD4UG3vBmTjJyAOPoNl34Tpn3mhriB4jRHAUKfP2gQQzSc3ugpB78/s69ppF0WdyLKeWZojQD+lyydc9faq1yZZ+WoRA9jPECYBp4IjWqnQ+yzyAnHPKNbHUy3WP6s+lAi7lnvs6oGg17WGOxJUgXJWvQxnYtHQQ+HDWuNj/jtuXdOI4GZzcSeptOPaTE1G8ke+euHL9V/wH97VsZWeteh3iBiMSQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YthHlYbEq2x4Hmi4Qol/lLvDmVH3bGFYRaByqeEABHg=;
 b=f3JJ1o+yR0p29AM98BYeigQ7wNZ0yu4TQyVSHtVe81wTZFPeO5LfBA+4n8AJuv+nyYiKqSYh+jfKPgc4cAdkksRYuSBIERRE2eqRaYvJdl3ziMH3bQZ4gHk8NExJ03N2q/E6HHUIMFT8om5O/AzSuyqNkQDQdkZmsquI4o28Fl/fjdBSuC14dnQJEY9GQgAz6/XdsgV+Yqis6BNeCiy0+amZkkqCP27eFQntirOC9ACAquU0PmEfTt6XckB0c4QwT2E8vWnTGSPpmCM0J9vcmzXhw0DQCQ1ZkIQSBwjyRicJ+1A2nzj+MjmnNp/tSlB6/YvgBL7mztpe1hEEqjhAIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YthHlYbEq2x4Hmi4Qol/lLvDmVH3bGFYRaByqeEABHg=;
 b=j3ek4UOgirYQdfBmudagcVdnQPQH+UhKZ3tveXYQviMm3L8hgwD0NbDQUYgVVAZpzS9/dvtSi+JzWq4q7QH9oZvUqqIOG5OBMBGBJIxaBcbawnIkDP//jBMZ1bUh5pt/R6J31hDZzbq+IzCTUB1RP5kcQR/nCj9QCl93L5s1HHA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by HE1PR0402MB3531.eurprd04.prod.outlook.com (2603:10a6:7:83::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 10 Mar
 2022 16:18:38 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::a037:bc8:44b:5965]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::a037:bc8:44b:5965%3]) with mapi id 15.20.5061.022; Thu, 10 Mar 2022
 16:18:36 +0000
Message-ID: <a041cf2f-896b-5231-8d36-da2e27f3fc50@oss.nxp.com>
Date:   Thu, 10 Mar 2022 17:18:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: (EXT) [PATCH v3 8/9] media: dw100: Add i.MX8MP dw100 dewarper
 driver
Content-Language: en-US
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca, linux-arm-kernel@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20220308201038.48386-1-xavier.roumegue@oss.nxp.com>
 <20220308201038.48386-9-xavier.roumegue@oss.nxp.com>
 <10066981.nUPlyArG6x@steina-w>
From:   "Xavier Roumegue (OSS)" <xavier.roumegue@oss.nxp.com>
In-Reply-To: <10066981.nUPlyArG6x@steina-w>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR3PR09CA0019.eurprd09.prod.outlook.com
 (2603:10a6:102:b7::24) To PAXPR04MB8703.eurprd04.prod.outlook.com
 (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c305a497-1680-4a6e-aab2-08da02b1a11d
X-MS-TrafficTypeDiagnostic: HE1PR0402MB3531:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <HE1PR0402MB3531CDE0369F17762C805D58BA0B9@HE1PR0402MB3531.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HODUzRTzIOEHG6Ubzd8opuzwZCd0mGtDtjVFTVeF1zMD2mouuDE6jZWtjSvsfNMt3gxWruenfoDaI6+qbqJLnTM+xYbKqu7yeVnRGLsMCRwJ8/mJQEpONTSkTQNYm/jWt7McwU39pfWWaJmJICucLcL37h+hs07omUVIqsa+NVSf4rXyb1W3LGvxC2yEbeWl7Afo2sEF9jFLYeM1rB8Srrc/EpByMOFc41N7SFon7wn1ADppRk5OB/QAxnOKwGDouWmhsUyYSpXUkfsetRPXUIzJcYoLngqo6HtT/bMHtb4wyuBNyE1Hvn4hLwX6oQ1LLFmtCuUAZUjBj36aPo6nU0kJxM+whun6gzUw6jSJZyiXJ+5RrffBsw99Mhyl/aKGV3US+EMlry3SFka4L1JxGgv1tdlK4uSJSZALrvsCEAQBXL6E74oGaCFEMZd0hNzn5+cJm5Ui/+l8kFcd6xo4m6ZkrXdQ0x6nUy3yoS7mpc632hDAj6ZeAQtfsvsoVF/+0ma3QR9KV44GRu39LYuLxHzZqh6KHZXNCCFzUbMF0Qsz1OF9dh5TSYxa1X62OjJKnBXsBqiLiH3NNW7tdYua/JfFbo/fQHAP730jNfckInsRrmA2ly+2n35ZFnlHOWLbTr1clxgJ83yX2FWGCU4Rkf0wdmLdTfsjTaOiJtm05Aizbxjz6IW3zoKozRmk7H59DLYf+DzrKi9ilQe8wPxWFCvdzKTTLiUPvHJKjJ9WGe4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66556008)(5660300002)(8676002)(2906002)(38100700002)(4326008)(66476007)(53546011)(52116002)(8936002)(6506007)(83380400001)(66946007)(7416002)(31696002)(6512007)(86362001)(2616005)(186003)(6486002)(498600001)(31686004)(6916009)(66574015)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TitaN0lZY0tUcWNtUzdkR0lDZTY4SmZ5d3g5K0I4RjVTOEJYNUx3M1ZCa3Vu?=
 =?utf-8?B?YjA4L21aa2R1dHB2MlF5NlA0MnhVTnUrQ1VJZ2xRam1sd2R1blhxT0FwZEZt?=
 =?utf-8?B?UG95ekloeDhkT0hTREZGaWg5cnpxQ1dzU2twTVdhZ2hWTGxmTUNWRFdjTjJs?=
 =?utf-8?B?Zk90V2pvclJtU29oK0p5VUZld05NODRRYTI1emswRStXQnhEL0Jkb3BvckpN?=
 =?utf-8?B?QUtMRTFzREpwc1VnQjhEU1FEcThjUjVPVWNCWTdlbEpYd29oR3JHUWlBRXBz?=
 =?utf-8?B?OU1GQjRwc2RjdXlhMVhrajl1VklQZ2FMR0RRZ0xRL0pyUVNqOHU1djRuV202?=
 =?utf-8?B?TCtseDZXa1VIWUZKdUpxM1V1ZWhHd05RS2FCc09ETFRxQkxoOEh2QTJhUHdS?=
 =?utf-8?B?NTlGeVBrcHhFdk41bk9HdmJidzExdmJDeG9IeHJXMmFhSVlyTHdrdkR6U1RD?=
 =?utf-8?B?WGd3cmVuTjBRUDdLbE9pZ0RNYm8rRHZZVUgrNDJzMHd2V0FPRFh1Uk9hMWpI?=
 =?utf-8?B?RWN0K1RZQVFPNkk5a2VXNDVCM01DcW8zRTFLSVpMSE13eUxnVnhWcnVGNnJK?=
 =?utf-8?B?VTR5K1hDYkhzZTdIMzZveTZjaUxpTzJTbGFTVkppaDFRcWhpY1hnWUVCSWxl?=
 =?utf-8?B?aWNNSWl1aGtveDhHMy9iNU0yS0ZLSnNwYVR4WnhxMGp6ZzdlNXJUNHRidFND?=
 =?utf-8?B?aHJxYzRkNC9QK3BrYm1UKzlITWEyTDBUaHZNYVBSbmdXL1VqSzY0T29nSEJr?=
 =?utf-8?B?bXUzcXlaa2svanFSSnlvNUZOOFJENFNMMXVYNWlBV1UrR2U3b29BVm9jSTdl?=
 =?utf-8?B?NDhoaWtVdVNKejVQdWtxZlpIZGlFVHVvMWRSOC9CS1EzZC9EUGFCV3VJVFNu?=
 =?utf-8?B?SDR2T3VHOXFqMHRxSW92UVhmSU92bmpYZ3ZHQTl4Mjh0MFNXeUtMSC9FdzRh?=
 =?utf-8?B?bUlyMHNHMzBEeFlIZ2lkeURFT0s3UGpyZDl3M2tTTDJOUHYrQlVYbWJCY1F4?=
 =?utf-8?B?dlhGTEN2K2t1Ri92QzRCUmFIZHpmdkdZSkgxWkFIczJSNmZUaHNxZVJ4TW0z?=
 =?utf-8?B?UU9CYnRJQTVNWHhOaFJnZ2dkOHJGM2pEeGxEdEtCWm1HeG9oNXE1SmYzaHRv?=
 =?utf-8?B?cXQ1NGkybDYzMHBiWk9TcmttTzBtN3JqSUdQOTVoRnlQczhKV2RnWjE0Y2ZG?=
 =?utf-8?B?RlFURGpYVGJZMXlGWXRpSlVpTTVmU2hOQStsWC9yMmNhSkozZDJsODl5MEFx?=
 =?utf-8?B?UG5mRlAvTnJNSTlHNGxqU0pLVDlZUWFqeW54ZVBibDRmLzkxRmwrYjNOVm9K?=
 =?utf-8?B?RnAzdGpPRDZqc1VNN1kzUjJZN3RjRmlHMGlnT2c0VGkvWGRySDJrVWlFL2li?=
 =?utf-8?B?UU1GbEtTbHBOY3ArZzc4ckJpL1NHcEV0bTB5bWFRRDBXelc3WXZqNTBZTVJx?=
 =?utf-8?B?b2IzY29heHpNQnpJWGJLZWdvWUs2a3BxZWE5SEJ3bFpRTEEwTHhwOFF0dmYw?=
 =?utf-8?B?UUhndC9WYmtUZEM5R3VqTjhEb2YwQVR3T2hjT2ZpWkJiY2tqeGkxVUt1bzkw?=
 =?utf-8?B?VWEvaTdBSCs5MExBckNSdlFlU1NrL21GRWxMQVRtQk9KV1dEMjBMY0t1Ujc3?=
 =?utf-8?B?eXdFRUZyTUI1Si9oWHpRK3dYeFMvKzRkYnFCamFuaHgvbUlyWmhVaVJSdFpP?=
 =?utf-8?B?WktKS2tXUmNKS0tpcGFvWEl3YjFpYkljbVBqdHV6bjM1V2I3TjdnNDJTRmNW?=
 =?utf-8?B?QWExaXAvYzRZWW1jc2pJREo0dE5HNC8yQ1Q5d3dJNWptbFk0T3dxYzVHUldt?=
 =?utf-8?B?N1FKaTJZbWVYQTE1blpiSm1GWlVhajMyWFZBSXVUN3I2dGFEWVdXUHRKN1Vk?=
 =?utf-8?B?b1hXdlNiaWJDSWJxd3M4Rm8zbG5uVlRHMnBTZUU1cWpGU3BZUTJ6dzBGUFVR?=
 =?utf-8?B?UVNNL0VWbURTaTZvUlNDOW5MdXhDWUdXVlFEaExxSmZXVkRxdkVMNE5kZDZk?=
 =?utf-8?B?SCtEOXAvblM3elcyQzJmbzZ4YlpXQXhuaHVDdjJ5dW51MlB3RUYxTysvbFMr?=
 =?utf-8?B?V014Ynh6KzZZSE9IT0I3TEhKM3FFcTVBUkc2UmhOZXMydnRsaVpsdzU4a2p1?=
 =?utf-8?B?RExEWFJpazVibUJPVmNSUjVJN3VCVG92QmRVMXlRdlRyVU5iWE4xTmNTdjVm?=
 =?utf-8?B?QUxPRlJDOHM1U01TZ0NvK2g1eWJJVUFTRmNmc3h1Yk12Y0xTNkYwS0Q3eitR?=
 =?utf-8?Q?45LlLIY0vd/2k6j/bM+3wKK4Yk1rEm8HXVuO2xekbI=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c305a497-1680-4a6e-aab2-08da02b1a11d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 16:18:36.4701
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QqCatnQAQcqfitGAZhUT0/ceEGDg1Nz3bhMa9+ZRXMG5BGNkMRd8aYhFGODB1ws3BUBNMsARHzguQR28mFnFrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB3531
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Alexander,

On 3/10/22 08:21, Alexander Stein wrote:
> Hello Xavier,
> 
> thanks for trying to mainline this hardware support.
> 
> Am Dienstag, 8. März 2022, 21:10:37 CET schrieb Xavier Roumegue:
>> Add a V4L2 mem-to-mem driver for the Vivante DW100 Dewarp Processor IP
>> core found on i.MX8MP SoC.
>>
>> The processor core applies a programmable geometrical transformation on
>> input image to correct distorsion introduced by lenses.
>> The transformation function is exposed as a grid map with 16x16 pixel
>> macroblocks indexed using X, Y vertex coordinates.
>>
>> The dewarping map can be set from application through dedicated a v4l2
>> control. If not set or invalid, the driver computes an identity map
>> prior to start the processing engine.
>>
>> The driver supports scaling, cropping and pixel format conversion.
>>
>> Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
>> ---
>> [snip]
>> diff --git a/drivers/media/platform/dw100/dw100.c
>> b/drivers/media/platform/dw100/dw100.c new file mode 100644
>> index 000000000000..7e1fcdfe5b91
>> --- /dev/null
>> +++ b/drivers/media/platform/dw100/dw100.c
>> @@ -0,0 +1,1744 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * DW100 Hardware dewarper
>> + *
>> + * Copyright 2022 NXP
>> + * Author: Xavier Roumegue (xavier.roumegue@oss.nxp.com)
>> + *
>> + */
>> [snip]
>> +static const struct v4l2_ctrl_config ctrl_custom_lut = {
>> +	.id = V4L2_CID_DW100_MAPPING,
>> +	.name = "Look-Up Table",
>> +	.type = V4L2_CTRL_TYPE_U32,
>> +	.min = 0x00000000,
>> +	.max = 0xFFFFFFFF,
>> +	.step = 1,
>> +	.def = 0,
>> +	.dims = { DW100_MAX_LUT_NELEMS },
>> +	.flags = V4L2_CTRL_FLAG_DYNAMIC_ARRAY,
>> +};
> 
> I know right now there is only one control, but you are reserving 16 controls
> in PATCH 5/9. So for me it seems sensible to make this an array already, so
> that additional controls can be added here easily.
Good point, will implement it in the next series.
Note that 16 is likely too much. I might decrease it.

> 
>> [snip]
>> +	hdl = &ctx->hdl;
>> +	v4l2_ctrl_handler_init(hdl, 1);
>> +	v4l2_ctrl_new_custom(hdl, &ctrl_custom_lut, NULL);
> 
> IMHO this won't need any further changes if an array is already being used.
> I'm eager to try it once you can provide an example how to use it.

I will provide as part of the driver documentation a simple python 
script example how to generate a LUT.

Releasing examples through NXP github will take few days, but you can 
have a try without a user specified LUT, using the identiy map computed 
by the driver.

#! /usr/bin/env bash

SRC_FMT=NV12
SINK_FMT=NV16

SW=640
SH=480
DW=320
DH=240


gst-launch-1.0 \
     -v videotestsrc pattern=18  num-buffers=1000 !\
     video/x-raw,format=NV16,width=${SW},height=${SH} !\
     v4l2convert !\
     video/x-raw,format=NV12,width=${DW},height=${DH} !\
     waylandsink window-width=${DW} window-height=${DH}

Regards,
Xavier
