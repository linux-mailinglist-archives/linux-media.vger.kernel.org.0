Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96C0E510B6C
	for <lists+linux-media@lfdr.de>; Tue, 26 Apr 2022 23:35:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355521AbiDZViL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Apr 2022 17:38:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346480AbiDZViK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Apr 2022 17:38:10 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2080.outbound.protection.outlook.com [40.107.22.80])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CF9F240;
        Tue, 26 Apr 2022 14:35:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ny6Qrc72YlB9qJDlYvIjoqP32eWIfym0SvRZXuta9soOdIBgzOBgVX4VwGZvCcCKC/homU5hjDfWC0gfGYUsuFLJN4fEtc9wq/zB3Tv+5VWrpq3nHHPTyzPFCh88iEd44toZEbcSlKrLqjffZjJ5huMH1dmSTueaTFVm2yeSe0/rzEBJlofwm5dmhG7XzGluFFPwrvkRuode/mGDGaenU7XmZ5nVXz61RWA161lhqIXhqrpBk25OcYhPJzsy7cnbk6dbN9hEeN/oi802t2sloz5wStsG59UifKVHl9Ag5yrvej2xGTbzh5so2sKPFgEASN5KnFQtYnT4OfvvcNEb9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G8PB+TTCC9gJ/KxsW4KqCOd6BD76h40N5QfFQaubtew=;
 b=QPjq546XyBAHiemFNB7qO3+IbrupNl1tNUh0T1PwiLjxCAbdJiR73XRZOPfcQ0rkmPOKSnHEOPvHiHhafHCTVDJA8CZ8rebZk+2cqPc9vlFyVsF/H+O/x/b1p23l8SWw4tXd3aHIuX+gzEZInkDhlNjexRnhJAKIsV3yL2IApDlHECcGPGVa8WQKfzhQu8ec5jSL33lTTxJ4Bp5r34+L0A18Oec17EBy0xn7v8mDLFrAyNKnWB73ZU77cWVx9NPbqwSTxasmUiw/v8wMLwdOAW42ZafYsID3kxBlhXN074c+FEGAwbHgFEflyKN2nHyydpJjcGLNje/UGzpuCEIYUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G8PB+TTCC9gJ/KxsW4KqCOd6BD76h40N5QfFQaubtew=;
 b=WN4fs77UnAWkR93hRwcvRTRXsQl4byLhY1wILgjU3a9bCE/uF3GCNlpv0XXO7u/3503pB/zbIhZvrRjDUzoSvtqAJrbYiPUHMgpARlSZH752SXbWTtF9fwdM5SMcDgSBCQRVKE3Snjay4eH/476HWq/L4swQt2i0/XGFEPhcik0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by AS8PR04MB7573.eurprd04.prod.outlook.com (2603:10a6:20b:29e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Tue, 26 Apr
 2022 21:34:56 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::45a8:8093:26f8:37d2]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::45a8:8093:26f8:37d2%9]) with mapi id 15.20.5206.012; Tue, 26 Apr 2022
 21:34:56 +0000
Message-ID: <b3fb75bc-301c-823a-4779-964bce95d051@oss.nxp.com>
Date:   Tue, 26 Apr 2022 23:34:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v4 6/9] media: uapi: Add a control for DW100 driver
Content-Language: en-US
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>, mchehab@kernel.org,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca, alexander.stein@ew.tq-group.com
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20220328141309.177611-1-xavier.roumegue@oss.nxp.com>
 <20220328141309.177611-7-xavier.roumegue@oss.nxp.com>
 <dba106ac-cee1-2493-13c7-ad9aef556a49@xs4all.nl>
From:   "Xavier Roumegue (OSS)" <xavier.roumegue@oss.nxp.com>
In-Reply-To: <dba106ac-cee1-2493-13c7-ad9aef556a49@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PAZP264CA0001.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:21::6) To PAXPR04MB8703.eurprd04.prod.outlook.com
 (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a36e833c-4df5-4074-659f-08da27cc9bca
X-MS-TrafficTypeDiagnostic: AS8PR04MB7573:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <AS8PR04MB7573F66EEE76D2A465782AEFBAFB9@AS8PR04MB7573.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rjWvAhqXIYT8d512QstwlkOZe3Qgni3Kt6HxHg9xUh+JQzP3h7kFPMxIL27anAZ9mw1P6KC2bsS5smzlqlEzhVbL/tWZvGy7sMEsI3lUdP4AJzLwZ5tMPN/Aml/Ly2ZQi43ZuZFUQx5capYtm3rZXmQzsp4C0zxngrjiW8KPmjm/XdSocG1cm/MAkEwYpzryJYMuXrJhSmJ8KimtZCQMZVCccbINjwTIjvBVo1SH4ibFmpttEwkRy0ItlEhXDC7//nLlWIOsTcyBTPCJo8znzAMX+IaUKJEfbQgW9sJTbkn+Xwwdxq9dmPxuSIDPMPUIkRtK8eDxwFmS0mSi34FkGwIrI6IjD1Vdp50ikJDKAQAGym69F1VXdI1WK+lrP91mEfxXRDOYShCAuctd6vQwwV0ej+QpHgxMpcrE2W6rBeTvZT5B0Nem+DA35kc8pCf/+t/KLlgL+HgeLvT/RX2idz18cP2bYpGZKorza3Whd2OlUGWHdYciBhCYil0ySSIxYBq21/R/82l12K2qfPC5bexqMwMbddxc3yy2e4aE3EdK3S+pExeG6+RTvR3Uyn+rmvKnxJr52sapD6KznJQ9fxLywYgdotD9lzQO33GMLqhOsIGTlhw5m9ZQBkj1fv81UFpToT7fG5RduOduDzD/jiOQzFrgDAmA/qT4aSJLhYU96WQY8z2zSqBwpXVZLrtY7ffFJEoI+VFcGpTEpVpe7pIAoMVFjjtymjQ7eSpZ1eTKZHYK/d2PaDVbsKIPIbowMs42268X4Q805I/koYsxT9jtLHxiHLggn6wuVcYP7NDKNHdM73wo40CfKgCGYPTA
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(83380400001)(6512007)(31686004)(8936002)(86362001)(5660300002)(6506007)(52116002)(966005)(186003)(2616005)(53546011)(7416002)(2906002)(38100700002)(508600001)(31696002)(6486002)(4326008)(8676002)(66476007)(66556008)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDlTcVl5bnNmMXNSRHhWNUpLYkR2YURsTXRNSTRkQy9lTUU2Rjc0c3ZpemFD?=
 =?utf-8?B?T09vamRaa2d4d3ZQVE9HbDVZekdIOWtmTjQ4OWxrTEMwQ29PMnNoZ2hZaU5T?=
 =?utf-8?B?UkRueXF3cDlFUG1sd0hVaFRpaGFUYW03eXdjWVFqSEJsWk9JdTdCeFJaUHFH?=
 =?utf-8?B?RVNyZ1U2dW9IbzhiZkJqcWp6akxjdmUrQjJSeUE2aTNjNC94eTFqMFQxQVdV?=
 =?utf-8?B?amNHcGtGcndFSHNvbjVyUm1NdDV2NFFPbGw0VHViQWYrSnFoOVlUUllHMkpB?=
 =?utf-8?B?Y3pNVTQ5dHZtVWxNUVdKOFd0UWFlOEROTXlIa3hyQ0p1eDZsQjU5TnA4bk5Y?=
 =?utf-8?B?N3huWHlIaVViZ2NjSDFXOVRscFNRNjduM21xTHZwTXFSQTVhaFgrYW9EazMy?=
 =?utf-8?B?VTRsMytNQVBiV0JKbWxOVCtUaEthL21abEZRbnNQbHRaSmYzKzh5TXlMMkla?=
 =?utf-8?B?dFhRYlFGb3MwWTBLQWQvT25Wam1iblZldWZWNGNSa2NVWHlvMGg3NEVhYTY4?=
 =?utf-8?B?cS9UTy9ZTlc1TFpuRzVCVVE5a2xka0ZFZ0JtR1c0ZFpRSlV4STZlNG5TVmNJ?=
 =?utf-8?B?STBpRlN6UmJISTg4SkM2ZXIrNGR6Q0YrU01DR2kyL2ZLRkNRRHJQWTZNOCsy?=
 =?utf-8?B?TzZOUVRmV1kvbkNKNkhLSllPOW5LVDNvS2dmbTVVODJ6YzdBdUN5MndPWlg1?=
 =?utf-8?B?VFVuTjFYVnlyUWtFUUVrK01TUHQ5aEt3TmhBMEtRdGVycndMbTZrUHZyYmxo?=
 =?utf-8?B?R1A4c285dUZBdzg2SnU1bVlkc1QzSU9yeDAvQWw4azIwY0VZdWdwbklDa1RM?=
 =?utf-8?B?SXpCUk1DclBXVkhGUVVTKzdaQVdiUzZ6V2Q5aFpLVTN6M3JxTXVhcUZUT1Iy?=
 =?utf-8?B?R1NjcHA2anlmOUxEdEtxdTN6N1hXOXQvQ1Fad0xEdlJPdzQ1QVJRd3B3QUMz?=
 =?utf-8?B?RkE5akptQ3lOMGpVSWd2bzl6NDhyVWI4aVVCam10N0VSd2FUYWdlb0VDVDZm?=
 =?utf-8?B?QUw5ZC9IdkI0TTFMYTdWSWlqZEJlaGs2bHpXbjFwRDViTks2c2RaUFJiVTJ3?=
 =?utf-8?B?Slhnd3VhNDVkY1p2YnplSVVJUkJuVGVkMXU0bjRhY0ZSd3U3KzFzS21jbW50?=
 =?utf-8?B?OXZjaHVIR3NSQWpvYjJMT2VxdXZub3U4YTdmU1poVFE1VU1DMjBjK0FidVVB?=
 =?utf-8?B?cDlLSlpycWZtYzBpWjZQREFxMDA2L3l0NGhrdUVvZG9NMnlVOTFNZzBqY2xr?=
 =?utf-8?B?RUZmUHZ3SU9jeHAyUDU4OEpmeHVoaGJHRkFqNEtLRXE5TmVhaXEwQ2UzZnhQ?=
 =?utf-8?B?Vld0VnZVZHgvQUNUZXhGOExXTWU4SWszaFVLSmlNSVAxNTlzRk5GSFNMMTlK?=
 =?utf-8?B?cFh0djhLWmdTUEoyY2JpZ0FZb25sTC9hZjlDZTB2UFMrWDRlSW45OW1YQ1FK?=
 =?utf-8?B?UkxWdjVrd3VVd3MyZlFoMXg3c09HaTNvQStUOXFhZkRIT2RTanJhR2J4aW5E?=
 =?utf-8?B?TTBKZ3pYZTl4VkdrR0lvaXhydWwwMjQwN1ZIQ2llRzFnWjNKS0JlemdrNkE4?=
 =?utf-8?B?T1pBK1JJc21XbGZQby94RklRNnRFbnFQR3NDeHg0ZmlWWDlrenF3NVN4L3hF?=
 =?utf-8?B?NjIyOWE1Z3hySTRGVkxMUVVRM1RORHlnZnRtZGxCaDNCRmNmRWFQbU5SekFW?=
 =?utf-8?B?c2xpbnhFdUl6a0lDT0ZIaWZkUE1TWUo2Mjl5OG1INFhscjNJaEY5amRRSlZU?=
 =?utf-8?B?MjdEaDFWOE5mVjQrOGVlVThIckgwK2l0KzRRTEdKcSthbUw0WE4wU1d6ME9P?=
 =?utf-8?B?Z2xKNzlHWmkwb0RJaTFNTEd4Nk96MzIzb0JvbTdjSU50ZUJuanp0QU5EWVV4?=
 =?utf-8?B?TituR1FxNTllN3NUZDF4Wm04YnVaZEs4MFNVRUxDMmdZVm9TNGF5cHpLVlRL?=
 =?utf-8?B?RGVUR3FGdUlIMnFsTzE1bDVadFZZMkRLU1FTREI2d2lCUVBWZmdtdGlIRkds?=
 =?utf-8?B?UjE3S0xHZHA0eWpULzl2SEpBQ3JNVERpckFnVVpnS1JhS3NJck5uZVZZcTNo?=
 =?utf-8?B?dHF4Y0xtblJmZVV4YXBZU00wbVZ2SERpV3FCQjRNb3hETld0VjlleFRrYno5?=
 =?utf-8?B?T21MbTdjZjZHeVRGRGlSdEhUOXdXRmVHV1FzOGRJTVUvbU53anJueGRwRXdT?=
 =?utf-8?B?WUFBZ282UDB0d284cWh5RFoyTE1kVG8zTWhIcjF0aXF3ejRvZklWVEVTeHZJ?=
 =?utf-8?B?eHJRUWI4TkcyZVNGaDR4cWRIcHlQUTR2SkY5ZEFqV3lUeEVGZDBxVUtOQ0tN?=
 =?utf-8?B?Q0dWZk5JdjBOenJ1c1JBN2FBNjdkbE1YQWZIaVF1NDl2b2VWQzZmdVRTVitp?=
 =?utf-8?Q?gdcUIlnpB4EFY0yPEwx1cungt9x29MxBYp40mdIsj6ZkX?=
X-MS-Exchange-AntiSpam-MessageData-1: cznxQeQeB7uMECPhwYaKX5o+mWJ0Wo+ngHY=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a36e833c-4df5-4074-659f-08da27cc9bca
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 21:34:56.8140
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aTE3BYREvHm8Aiz5TIqVJjWtMwocMVopwb31mIp2d1x+5+vuAZFmLQhN5cgy1ncIg18CE4zwBprYpD7YFsjwkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7573
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Hans,

On 4/25/22 08:57, Hans Verkuil wrote:
> On 28/03/2022 16:13, Xavier Roumegue wrote:
>> The DW100 driver gets the dewarping mapping as a binary blob from the
>> userspace application through a custom control.
>> The blob format is hardware specific so create a dedicated control for
>> this purpose.
>>
>> Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
>> ---
>>   Documentation/userspace-api/media/drivers/dw100.rst | 12 ++++++++++++
>>   include/uapi/linux/dw100.h                          | 11 +++++++++++
>>   2 files changed, 23 insertions(+)
>>   create mode 100644 include/uapi/linux/dw100.h
>>
>> diff --git a/Documentation/userspace-api/media/drivers/dw100.rst b/Documentation/userspace-api/media/drivers/dw100.rst
>> index 4cd55c75628e..f6d684cadf26 100644
>> --- a/Documentation/userspace-api/media/drivers/dw100.rst
>> +++ b/Documentation/userspace-api/media/drivers/dw100.rst
>> @@ -20,4 +20,16 @@ match the expected size inherited from the destination image resolution.
>>   More details on the DW100 hardware operations can be found in
>>   *chapter 13.15 DeWarp* of IMX8MP_ reference manuel.
>>   
>> +The Vivante DW100 m2m driver implements the following driver-specific control:
>> +
>> +``V4L2_CID_DW100_DEWARPING_16x16_VERTEX_MAP (integer)``
> 
> (integer) -> (__u32 array)
> 
> But should this be a __u32 array at all? Wouldn't a __u16 array make more sense?
This is indeed debatable. But the array is describing vertices positions 
on a 2D dimension space, and thus its size is always even.
More importantly, the array must follow the format imposed by the 
hardware which expects __u16 pairs packed in a __u32.
Lastly, the lut (map) register size unit is __u32.

Hence, IMHO, using __u32 might make more sense to highlight its hardware 
dependency.


> 
>> +    Specifies to DW100 driver its dewarping map (aka LUT) blob as described in
>> +    *chapter 13.15.2.3 Dewarping Remap* of IMX8MP_ reference manual as an U32
>> +    dynamic array. The image is divided into many small 16x16 blocks. If the
>> +    width of the image is not divisible by 16, the size of the rightmost block
>> +    is the remainder.
> 
> Isn't the same true for the height?
Yes, will update accordingly.
> 
> The dewarping map only saves the vertex coordinates of the
>> +    block. The dewarping grid map is comprised of vertex coordinates for x and y.
>> +    Each x, y coordinate register uses 16 bits (UQ12.4) to record the coordinate
> 
> As mentioned before, UQ12.4 is not necessarily a standard notation. 'unsigned 12.4
> fixed point' is better, but you also need to specify exactly where the bits are
> stored inside the __u16. I.e.: 'the integer part is stored in the 12 most significant
> bits, and the fractional part is stored in the 4 least significant bits of the __u16.'
> 
>> +    address, with the Y coordinate in the upper bits and X in the lower bits.
> 
> And with a __u16 array this becomes: 'The array contains pairs of X, Y coordinates.'
> Or something along those lines.
> 
>> +
>>   .. _IMX8MP: https://www.nxp.com/webapp/Download?colCode=IMX8MPRM
>> diff --git a/include/uapi/linux/dw100.h b/include/uapi/linux/dw100.h
>> new file mode 100644
>> index 000000000000..7fdcf2bf42e5
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
> 
> Add a comment referring to the Documentation/userspace-api/media/drivers/dw100.rst
> documentation so users of this control know where to find the associated
> documentation.
> 
>> +#define V4L2_CID_DW100_DEWARPING_16x16_VERTEX_MAP (V4L2_CID_USER_DW100_BASE + 1)
>> +
>> +#endif
> 
> Regards,
> 
> 	Hans
Regards,
  Xavier
