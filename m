Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDE384D46B4
	for <lists+linux-media@lfdr.de>; Thu, 10 Mar 2022 13:20:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241947AbiCJMVk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Mar 2022 07:21:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233962AbiCJMVj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Mar 2022 07:21:39 -0500
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70079.outbound.protection.outlook.com [40.107.7.79])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A65F13C386;
        Thu, 10 Mar 2022 04:20:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VIiVbwqB+zUcSDjZyh4VsIg6ZWES+cC6rtk5xzVwH0jSsgpBu3PeqBlaMzU0PCi0Q/LySKmpcn9O/DqbqDZ9IcnONTKgwLls0SqlIHPaA6nM6j/0Qntv46dIPfPImOWsVs0s25W6+GPO6rbPzOSOJ+4edqpSBzyrPMwxDrJI+ZRIK1VcqLmeoAFF7QFvj+uJWOAvYMEwDOmwUtTvbiXns3bTOcNdeLet0qxf7+cwl85wW33pCz/jtMwl2k/YmIKVUiJkFWlJBXWROa/qpeiT+7VgmiN+mGhlPHBXnNnbf8RO50Kb4Ehs5XIiVY0dsiKr9yz7M5Hgy14r8qRPHQ/beA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ljr8whbkhvvdsiuckFtwyt1BnmTh040wCG848ti1I9Q=;
 b=fsVb/Yd6/X8ULaZuaQrl5etZGT/6u/ugLGwOwMVYIKHQIlgtfCF1EXMPux+X48/Z7MP7ot1jA8cYGFvxvtEsDDdTObHCNy7TOa7gyF9g9bn+dDjd6tbT/iMUnfWJ9XSghKPZO1hCGRYHHSfRubzE30MTioaiaCpRckQc6QAevP4nNa9FKtEGqZxZUJVGBiHC+T/r/zJD6QUEVDBLXUpRw18Qt38EdzTMDe0VQlH1rgsD+ZRZsc3s8btMQFqqC4O5qCqO1XKw4EFIEuTnf+kFsS+K0oCc0mkh2QrpC3e1DS/rsDlCNrbh0kMh9tQgqr9l9aEUfZ+nB7bt71Cv/6olpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ljr8whbkhvvdsiuckFtwyt1BnmTh040wCG848ti1I9Q=;
 b=erFPgL4n47B5xdhzt6K3d/sxhrIRBa9Sdo0ev7FBbSJ6C9N64+7b24Eqk90YcspYFJrh2l0LGAU2VhPL8JRAZfrUtnAR9pZ3+lTKQwmXYLOPnzWT7/hWxVEqSla42q3/FdopYsIV4fVJfGDbhgZOUP/A/HG677qy902UtrJZ0wk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by HE1PR0402MB2940.eurprd04.prod.outlook.com (2603:10a6:3:d8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 10 Mar
 2022 12:20:32 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::a037:bc8:44b:5965]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::a037:bc8:44b:5965%3]) with mapi id 15.20.5061.022; Thu, 10 Mar 2022
 12:20:32 +0000
Message-ID: <d48e2863-0098-41bf-3bc5-2fdf14aa8a11@oss.nxp.com>
Date:   Thu, 10 Mar 2022 13:20:29 +0100
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
 <986c4b3c-e346-e5b5-7fc9-497d8a4fc89f@oss.nxp.com>
 <5a43a326a270051df1f7b8402d07b443b02331b6.camel@ndufresne.ca>
 <d4d170c3-b4df-47ee-28b1-09a4c8ebc5f6@oss.nxp.com>
 <8d7db603e85b2bf1f1d7d581028e7d9f578ec643.camel@ndufresne.ca>
From:   "Xavier Roumegue (OSS)" <xavier.roumegue@oss.nxp.com>
In-Reply-To: <8d7db603e85b2bf1f1d7d581028e7d9f578ec643.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR3P191CA0019.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:54::24) To PAXPR04MB8703.eurprd04.prod.outlook.com
 (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bca144cd-bcb5-4050-53a9-08da02905eb8
X-MS-TrafficTypeDiagnostic: HE1PR0402MB2940:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <HE1PR0402MB2940221C36FB3DA1E2D856B7BA0B9@HE1PR0402MB2940.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HjWY3kG+MoX9xDGFtlb8OwSrq/rD0fklHHBWGKm1qyzU8cYSd3rx810jET3DY0WluF5jmCCQqORUL+MYBmNHC8U3Z7wgAPIqNxnbPfJ2AGyi4ZJw8PlOiljQPiI35iaRuPYPviRyQF6cpliFcHj3jcuuYdoPKjq44rDVN2u9Enmy7E3RbKtS7SHUT74mWaaBPfp3iViULiRg2ARddD4N/NrlfsOScVR4GmllF+Ff23yORU4fS85aQq8ShHZgqMgOztODXfLlAN2+B5LR2vl9BbWzrxqsmRSKBnJNAG49e5ROF6CWeEPLjgdPvCl2Y0cnM4mquvNB8N+QmcFmZcPrpxmosPUdfVoJK4O4btEkmDqGhw9w/aQMOsOtg1yaCfjhihEFDqwDmaXYzetuJv+YjGq7wxAnvELY2jJmdQ3NzIONYL+QGFyZFCsVNUWS4F0edQwWJVPVO/lGIAMsTHPrpZvBAtLdCiErNJEm6WKAHEJOKs4ABxe/9gfeHylq372Vb+l/BZeIM1pf9GGVQUC3fySZFuIuJLpM5C366VZOjNlejPekkW5BSrLl1kNsVRTYTwJ0IbF7PQFyA4DLW3k7VXYqIckimY64OlBKD450syM5kxHm9q//e6KjQZj2etSRFGbTcn85yjyCuWAa9fj2NMW/OHgxwF7+O0L8g98iL2Dcxv5+2ot2KMWgib483eSDzx1xCXiP+S4k69ZLXugBqfjQAz+yB8FrGVpHDnjHaccPhO9cQ2g0NB8eLtPZ3j98KHIy89zrEbsGJ9iTleHHiRponYkga0/bSFB2bH3UijuDRWlxulJKQ73919xgvBcr
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(966005)(8676002)(66574015)(2616005)(38100700002)(83380400001)(186003)(2906002)(498600001)(31686004)(6486002)(66476007)(30864003)(66556008)(66946007)(52116002)(6506007)(53546011)(8936002)(31696002)(4326008)(6666004)(6512007)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dlJQUHgxS3FyRkdEVCsxcCtXVnM2TUNoVXFqR2ltQkJLRnBlYUJTU0dxdXIz?=
 =?utf-8?B?NFR0d0RERlJTd2xRT1Yvd3pWakE1VTBBNGJ0OHdtZCtpR3VyaE9QY0JSa2Vu?=
 =?utf-8?B?dHgvbUJZVi92WVBvSTRwTEc2YWxqelAwbmh0T1ljWmNTdGNodXRlMEJjYWsx?=
 =?utf-8?B?ME1FQzBGaTV5SnNpUUMwcjJNLzYwc01IU1NmYzNVQjF0T21qWktDMXZndi9O?=
 =?utf-8?B?STdnaXlTeEVtVDQ4cmtPTW9rYWwwNFdnNGZqVjRhZnoxRmJpU2RDU2gxWnkz?=
 =?utf-8?B?T1hqbnJCY0tmSnFhTEsyQlA0RUFGUGh3d21LVE9LWUlTYnZVdkFyZUZOWTUw?=
 =?utf-8?B?aXN4SElPZWNHMjdhWUQrS0k0NXZFKzJKMkNVWnZqS0M1NXp3U0JmVjVnb1I0?=
 =?utf-8?B?VmhycFhhRFlMZVNycmVwQk1qNDFFQmNKTlovOVpvb0hZU2EwNjN0UDdnYWll?=
 =?utf-8?B?d3Z4TG8xVHdZbHh4dzJOVXNmY0UrWE1sallabkZjYlJsaFNSdGhNZHJHTXlQ?=
 =?utf-8?B?M2djVGpLSnVjY0Y2Zkl1a0JuQ0JiZGs0MGlCZ3hKV0dwbGM4MGMrcDdyeVpo?=
 =?utf-8?B?bytway9yVXdFK0t4UFVIcUkzNkx6RUIxZHhFTVRBamFtQnNteE9rbTVDK3Ex?=
 =?utf-8?B?aWRkZXZUellVelBQUTVKaEUzTG9qRERMbkp6Q1doV2JkYzllSWtrd0F4MzFF?=
 =?utf-8?B?UHFwYm5UUWFzOHo2S1dTUEc2Ulhvb0N3WU9Bd3crVEl2WldhdnBJd2xENGQ4?=
 =?utf-8?B?cU5RN2hQaVNRcE1keDdESWFrQm1wcFNLMVI5czVWTVRsbVhuaEwyeWtJMG5M?=
 =?utf-8?B?VW16TjJrZHZBQ0t0MTI0T1QycjlYV2YwVFpBVVZUdUxsbkVsNEdLZDRHZjFF?=
 =?utf-8?B?MmhhdzFCOWFTL0MvTHFHWkp1bllRLytHNkI5L0E0R044bC8zUHM3SHV4QWNY?=
 =?utf-8?B?cnhDS1BjcFlQWXNuQ1E4elV0aTNEQmJ0K243bTdZUTl5REwwSjJoMUhnTmlL?=
 =?utf-8?B?NHZoTXUwVXVXSXVYY1FMYVRMUWozZzdhR0RIK3JVVk9mZFNaQTF6c0ZIWmZK?=
 =?utf-8?B?S0FDWnRKeGtsdFUvOG9zcEV1NUEyZkJ0Sm9aL3VzYjBqcWJqc3llM1FMaHRP?=
 =?utf-8?B?QkN1Y2FMWDBDeU5Fd3owVnVmZk5mNXErbkg1WmpVK0FXanMrYlZrOGJvUU9r?=
 =?utf-8?B?OFB4VzFGdHU0Y0tLL1V6dnVZWnBQNDBhRTVJSlUvMXYwdzIwVTMzZUVQUkxJ?=
 =?utf-8?B?dXNqa0Naa3g2SnVWUjF6Nk1zU01LN1VqK1R1SVFSQ0N3WklLQzZKOFE1d1A4?=
 =?utf-8?B?MllwVWx6V1h2Q0FyZjJSL1ErbDNEVjB4SzhqUVh1Y24zSDlwYlR5cnZLS2pp?=
 =?utf-8?B?SWl3MENqei9rRVlONE9ub1pnbFN2MlArNUFsbDNoa0o1dDEvMHdDcjV6MjlS?=
 =?utf-8?B?RlNObko1SjljZWtISFB0M3RNUnh5VzkvMTBrNkxrRndxU3g0aEVlbmQyc0I3?=
 =?utf-8?B?bjB2eUl5VVRZSkUwU2FqZXU2TFZIaFRWN2JEbGNvNlhQT3hERlprZzhPQUxT?=
 =?utf-8?B?NnBPaUNOY2RJWGpDTFNaaWtIQVJTdG44ZXhrU3M5YU4vZjZlZ2ZnSzYzL3l5?=
 =?utf-8?B?N1pzYklNLzNXN0JZM2xrdFNLTG5OdzBRYnlYWkloMnlLS0dPelRuRW5BTWVI?=
 =?utf-8?B?R2tZekRyc2lGa3VKV1p1Z2pwS0FDZTJRZ1c2dlM0Y1BZSmlsRFZHcWluaDdj?=
 =?utf-8?B?ZEliSjNCdUhKa0tGUFBQN1lvU1grWmVtaGYvelVtNUw3NGY5cFJuWmZ5WCty?=
 =?utf-8?B?eTZhdzNLUXlJcVVBekVxK3NqS1U3ZjZBMncvbkhsOXdxMUc4cldGK0h1NExN?=
 =?utf-8?B?a29yQ29udklQUDh2ZmRScE1LT3hxeTdqNmZKdkF1SUZVUWpFVlBJSGhnRzdy?=
 =?utf-8?B?a3YyN3VqbkVLTk0wb3dhRUdLOCsvTGxmK1FGMTdFNzVVTHZsdWFqTk1oSnRp?=
 =?utf-8?B?aU40OFZkckVnTXVoT09ZRjNxdWdzN1o4U2l5bnoweUNLWDFBQS8wRENuRW04?=
 =?utf-8?B?dy9wVEdMMHg1SStOaGlVNGZVMTBpRStmSHZIVTNMRlJUcGoyUEFTQjBudkxS?=
 =?utf-8?B?cSsrMHdlUW1wVWZkeTN1TmpZSUMwMUZWVlh3NzUxVWNjSGMwZzZQMDc5VUEw?=
 =?utf-8?B?VW0yVzZUbnh3dVZDblpzNnNvcUN5L1g5d1VrR2U1VkNNdTN1M1RMKzhoblpH?=
 =?utf-8?Q?ke5JXv5JrvEUyqKLPGySHT0YwIga4uhLftF5Bk6pj8=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bca144cd-bcb5-4050-53a9-08da02905eb8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 12:20:31.9967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t8S5vo1MP0NyRpurqs9dLSW7TC2/5BEe6z7CQEmxGD9xnnAO76GfX6Nxp3olHXSbvYwmvOFLiXROmwYJTzhrvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB2940
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,LONG_TERM_PRICE,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 3/9/22 21:08, Nicolas Dufresne wrote:
> Le mercredi 09 mars 2022 à 00:16 +0100, Xavier Roumegue (OSS) a écrit :
>>
>> On 3/8/22 21:28, Nicolas Dufresne wrote:
>>> Le mardi 08 mars 2022 à 20:42 +0100, Xavier Roumegue (OSS) a écrit :
>>>> Hello Nicolas,
>>>>
>>>> On 3/8/22 20:15, Nicolas Dufresne wrote:
>>>>> Le mardi 08 mars 2022 à 19:48 +0100, Xavier Roumegue a écrit :
>>>>>> The DW100 driver gets the dewarping mapping as a binary blob from the
>>>>>> userspace application through a custom control.
>>>>>> The blob format is hardware specific so create a dedicated control for
>>>>>> this purpose.
>>>>>>
>>>>>> Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
>>>>>> ---
>>>>>>     Documentation/userspace-api/media/drivers/dw100.rst |  7 +++++++
>>>>>>     include/uapi/linux/dw100.h                          | 11 +++++++++++
>>>>>>     2 files changed, 18 insertions(+)
>>>>>>     create mode 100644 include/uapi/linux/dw100.h
>>>>>>
>>>>>> diff --git a/Documentation/userspace-api/media/drivers/dw100.rst b/Documentation/userspace-api/media/drivers/dw100.rst
>>>>>> index 20aeae63a94f..3abad05849ad 100644
>>>>>> --- a/Documentation/userspace-api/media/drivers/dw100.rst
>>>>>> +++ b/Documentation/userspace-api/media/drivers/dw100.rst
>>>>>> @@ -20,4 +20,11 @@ match the expected size inherited from the destination image resolution.
>>>>>>     More details on the DW100 hardware operations can be found in
>>>>>>     *chapter 13.15 DeWarp* of IMX8MP_ reference manuel.
>>>>>>     
>>>>>> +The Vivante DW100 m2m driver implements the following driver-specific control:
>>>>>> +
>>>>>> +``V4L2_CID_DW100_MAPPING (integer)``
>>>>>> +    Specifies to DW100 driver its dewarping map (aka LUT) blob as described in
>>>>>> +    *chapter 13.15.2.3 Dewarping Remap* of IMX8MP_ reference manual as an U32
>>>>>> +    dynamic array.
>>>>>> +
>>>>>>     .. _IMX8MP: https://www.nxp.com/webapp/Download?colCode=IMX8MPIEC
>>>>>
>>>>> This point to a document names "i.MX 8M Plus Applications Processor Datasheet
>>>>> for Industrial Products" which does not contain that reference.
>>>> My bad.. Wrong link. :)
>>>> Will repost with correct link.
>>>
>>> Thanks. What I wanted to check is if it actually made sense to expose the
>>> synthetized HW LUT. But for this, one need to share the parameters / algo needed
>>> to generate them.
>> There is no special dewarping algorithm which strictly depends on the
>> dw100 IP, or optimized for the IP capabilities.
>>
>>    This way we can compare against other popular dewarp
>>> algorithms / API and see if they have something in common.
>> The dw100 hw lut description is rather close to a how you implement
>> dewarping with openGL taking benefit of the shader pipeline stage.
>> The main differences with OpenGL implementation are:
>> - Fixed vertices coordinates (16x16) vs any
>> - Limited resolution on input (texture) coordinates (UQ12.4) vs float
>>
>> Standard routines from OpenCV such as initUndistortRectifyMap()
>> https://docs.opencv.org/4.5.5/d9/d0c/group__calib3d.html#ga7dfb72c9cf9780a347fbe3d1c47e5d5a
>> can be used to generate the binary blob, with an additional decimation
>> processing stage to satisfy the 16x16 macro block vertices grid and the
>> fixed point format.
>>
>>>
>>> The issue I see with this control is relate to the message it gives. When adding
>>> controls for the prosperity, we want these control to actually be usable. This
>>> is possible if the documentation makes its usage obvious, or if there is Open
>>> Source userland to support that.
>> So yes, most famous vision opensource project such OpenCV can be used to
>> generate the blob.
>>>
>>> None of this is met, so as a side effect, this looks like NXP sneaking in
>>> private blob control into a publicly maintained Open Source project.
>> I then disagree with this statement considering my previous comments.
>>
>> I plan to release publicly some programming examples on how to generate
>> the dewarping map only using openCV library routines and aligned with
>> lenses calibration state of the art method.
>> A dedicated openCV module taking benefit of the DW100 will be published
>> as well.
>>
>> A long term target is to add its support in libcamera, combined with all
>> media components (CSI, ISP, ISI) pulled from upstream kernel tree.
>>
>>    This isn't
>>> truly aligned with how V4L2 controls are meant to be. Doing trivial lut
>>> synthesis in the kernel could be fine though.
>> I am not sure what you meant with this comment.
>>
>> As part of this patch series, an identity map is generated in the driver
>> which should be enough for anyone familiar with dewarping process.
>> If you meant to generate the remapping table from the lens calibration
>> data, I don't think this is a reasonable option considering the
>> NP-completeness of the problem.
>>
>> If this is the idea of binary blob (despite its public format
>> description) which hurts you, the map can be exposed to the kernel in a
>> more human readable format such Image_in(xin, yin) -> Image_out(xout,
>> yout) in UQ1.31 format but will add extra processing at runtime for
>> something which has to be done anyway offline, and memory overhead. But
>> I don't think we can end with a generic v4l2 control considering the
>> hardware restrictions (vertices position, limited fixed point
>> resolution, etc..).
> 
> Please avoid implication that I would be *hurt* by your patchset. Your
> imagination will make you read my comment as saying something it is not. My
> comment are strictly scoped within the information you have provided with the
> patchset to justify adding a vendor control in contrast to providing controls
> that would be reused by another driver later. I'm not into lense or anything, I
> strictly review the userland APIs that you submitted with care on documentation
> and usability.
> 
> Try and ignore everything you know and the inner of this hardware design, and
> perhaps about dewarping technique and you may endup with a different read of
> your patchset. My impression while reading it is that I would not be able to use
> it due to lack of example. And if NXP website would stop hosting the
> documentation, this would make it just impossible. Time have showed that vendor
> controls are rarely the solution and should only be added with great care and
> good documentation. For a first driver supporting a technology like this one, it
> could be acceptable, assuming it is documented in a future proof way.
I fully understand uapi changes have to be handle with care, and that 
was the reason I was initially willing to use a private custom control 
(as few drivers are doing), without being aware of the current policy 
with this regards.

I was willing to share the details of the hardware specification through 
NXP website such as one could get all public details available on the 
IP, and I was (wrongly) thinking the code was talking by itself to give 
indication on its format (finally pretty simple). Again, I understand 
one could be mistrustful with documentation hosted out of kernel tree 
for the reasons you mentioned, even though the risk is pretty small as 
NXP (as most of the vendors) has some long term maintenance legal 
contracts to fulfill.

> 
> All the information and the rationale you are adding in this reply can be added
> in the next submission. What I think you should strictly address:
> 
> - The LUT format and meaning should be documented directly in the Linux Kernel
> documentation. Having to register an account with NXP in order to download the
> documentation is not acceptable and not future safe.
Will do, and will provide a short script example to generate the LUT.
> - You forgot to provide the output of v4l2-compliance, I didn't mention yet, but
> that would have come of course.
The v4l2-compliance report is actually in the cover letter of the patchset.
> 
> The rest are just nice to have, though generally wanted.
> 
> - The name of the control could be made more descriptive. The lut is mapping
> what in one word ? And that word could be added to the name.
I am running out of imagination for figuring out the good word to use.
The LUT is mapping "input pixels coordinates" to "output pixels 
coordinates".
Using OpenGL semantic, this maps textures coordinates to vertices 
coordinates. Any naming suggestions are welcome.

> - The patchset could mention userland code that uses it, which show that this is
> actually tested*

Will do.
Custom control was tested with a gst pipelone using a (hacky) 
gstv4l2transform element and a opencv script using custom module which 
will be shared publicly.



> - There is other feature you mention, unrelated to the dewarp feature. You
> haven't said with what userland these have been tested. M2M scaling, csc and
> crop are generic should just work with existing userland. You could use
> GStreamer as an example.
v4l2-ctl and gst pipeline using (vanilla) gstv4l2transform have been 
used for testing.

Unfortunately, I had to apply oneliner patches on v4l2-ctl to get the 
cropping working to prevent the use of read_write_padded_frame() for 
FWHT cases which is applying a sw cropping/compose if I got it right, 
which seems incorrect for generic m2m.

https://git.linuxtv.org/v4l-utils.git/tree/utils/v4l2-ctl/v4l2-ctl-streaming.cpp#n1112

https://git.linuxtv.org/v4l-utils.git/tree/utils/v4l2-ctl/v4l2-ctl-streaming.cpp#n1372

I will open a thread on v4l2-utils to discuss this.


> 
> * You'll find this funny, or perhaps even insulting at first, but you'd be
> surprise how much code (specially from ARM SoC vendors) that get sent every year
> that don't even compile or have never been tested after being up-ported from an
> older tree. And that is only scratching the surface of the problem we have to
> deal with. Notably drivers were only 1 pixel format out of let's say 10 have
> been tested that comes with broken stride and memory buffer size calculation
> causing much larger troubles in the system.
This certainly does not ensure the driver to be bug-free, but I swear I 
tested all in/out pixel format combinations and driver compilation is 
W=12 warnings free :)
> 
>>
>> Adding a generic dewarping API to V4L2 is possible but this was not the
>> scope of this patchset, and anyway missing data on any existing public
>> dewarp hardware implementation supported by the kernel is somehow a
>> blocker for this.
> 
> I was asking to share about your research that made you opt-out any kind of non-
> vendor control for this feature. From your original submission, it would have
> been ill advised for me to assume anything. Note that programming interface for
> a V4L2 driver does not need to be based on other hardware vendor interface. I'm
> not in this industry, but there could have been an industry standard for
> expressing lense correction, produce through a a calibration process. The one
> thing I've been assuming is that you are in the industry and would be able to
> share a bit on that.
I am looking on dewarp stuff for 3 months but I can share for sure my 
undersanding whatever it worths.
The optical system can be mathematically described using a set of 
matrices and lenses distorsion parameters which are estimated during 
your calibration stage.

https://docs.opencv.org/4.5.5/dc/dbb/tutorial_py_calibration.html

Then it's a matter of resolving a non linear system (ouch) to get the 
remapping lut correcting the distorsion. OpenCV computes a 1:1 pixel 
(re)mapping.

This is obviously impossible to perform those software computation in 
the kernel.
One could imagine that some hw dewarpers might have implemented mapping 
lut computation in hardware, and if so, the control api could have been 
inherited from those calibration parameters. I have no idea if such 
hardware exists.

Another alternative is to consider the remapping LUT as an input which 
seems more reasonable applying divide and conquer concepts.
I would rather go for such option if a generic v4l2 interface should be 
designed and combined with a library. And this would likely help to get 
synergies with openGL implementation from the application standpoint.

The driver would have to expose its mapping capabilities (mainly 
vertices coordinates constraints (x:y mapping) and float resolution).
But this might worth waiting a bit to check the availability trend on 
such capable hardware.



> 
>>
>>>
>>>>>
>>>>>> diff --git a/include/uapi/linux/dw100.h b/include/uapi/linux/dw100.h
>>>>>> new file mode 100644
>>>>>> index 000000000000..0ef926c61cf0
>>>>>> --- /dev/null
>>>>>> +++ b/include/uapi/linux/dw100.h
>>>>>> @@ -0,0 +1,11 @@
>>>>>> +/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
>>>>>> +/* Copyright 2022 NXP */
>>>>>> +
>>>>>> +#ifndef __UAPI_DW100_H__
>>>>>> +#define __UAPI_DW100_H__
>>>>>> +
>>>>>> +#include <linux/v4l2-controls.h>
>>>>>> +
>>>>>> +#define V4L2_CID_DW100_MAPPING		(V4L2_CID_USER_DW100_BASE + 1)
>>>>>> +
>>>>>> +#endif
>>>>>
>>>
> 
