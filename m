Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 573174D24C0
	for <lists+linux-media@lfdr.de>; Wed,  9 Mar 2022 00:19:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229651AbiCHXUP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Mar 2022 18:20:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbiCHXUO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Mar 2022 18:20:14 -0500
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60061.outbound.protection.outlook.com [40.107.6.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BBA49EB97;
        Tue,  8 Mar 2022 15:19:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Luv93+2QVzl5rR7Jgm6EXHY6G8hG25bDrx4Cq25eYW/F4E6WzhwmwO55M3OOiVYt/n2IBj+rmsTjlu7L0EPVEUY+Af8pw8ILAAYafrssa7S4S5OfcHs8ROpeZJOihzZpbB7spUJFooQbnClg0n+9YswXsTA02ObcgMR1bxwhc2X9PRMxB3vBGJn2PP7GhXmFka18nJSGsvwq7sbm73wYX5AobBhECOA/l+kCLlf82i6NRnPZO1Y2aSB4VSH1TveZ32Rb9pRzQVPJRUsLODAJDW78lZI4fKp8lUMPQlRQ+LRVVF4L5jfXFzYSCpZ7a801A9Ju5ATIvQ8Fq5E08oiW/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QKmEyumqZwPDYsG7ig/Eqv+l+TYj8LAk13BJK43Qf0M=;
 b=YQSggduPWS1eejFHEcfFTbND09ZmfuJGvzTYLFVHYqTr+u1WdqG/wfZtZ5fEIVuwICVCAbZT8n6GUlyA5gu/GJt5/Z5/H/oWI0Dri6AsWj1XuUEUZ2k4dWYHkDGR5W4xVGG1c2emQzDSl6bXjq7IFn8HqbzoklXO3tZKMV5ZuBGkzCDakf8gWeRdiBSOHsyfuwI9onTP6fEHQk7l92XyAwSBHPxPDCmgXuVTNoiDsW1DgRvRHMsv7iLFmFrMj1s7TUiuwRPezPEKRuAnOXHWWPx3/O+ReXYtetdrYmvgA2hQql/5Rtgu1QUfJvkZh5buA75vqqf6QXPuP85cmVc1Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QKmEyumqZwPDYsG7ig/Eqv+l+TYj8LAk13BJK43Qf0M=;
 b=AqgopQrmNfJoYM/jum/p99zDdAgPa9dnlhHBH2VVOPqMbiOq3BXsY0eT4tQkaaI8WOw9jQ4TVSgbr70c0nol13huklHK6ar88zb+gSOzgr2fqmDfIG0gXD/rMNix0z7iTgUioH9uYjaZDwN4IxQanq7p7l1reJOGPi+LEVcMvQQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by AM6PR04MB6680.eurprd04.prod.outlook.com (2603:10a6:20b:f8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Tue, 8 Mar
 2022 23:16:15 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::a037:bc8:44b:5965]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::a037:bc8:44b:5965%3]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 23:16:15 +0000
Message-ID: <d4d170c3-b4df-47ee-28b1-09a4c8ebc5f6@oss.nxp.com>
Date:   Wed, 9 Mar 2022 00:16:13 +0100
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
From:   "Xavier Roumegue (OSS)" <xavier.roumegue@oss.nxp.com>
In-Reply-To: <5a43a326a270051df1f7b8402d07b443b02331b6.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR2P264CA0045.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::33) To PAXPR04MB8703.eurprd04.prod.outlook.com
 (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f19d851e-8117-4072-c350-08da0159a4a0
X-MS-TrafficTypeDiagnostic: AM6PR04MB6680:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB6680D6CD81BDD2E65C2769F7BA099@AM6PR04MB6680.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3QMfw1dD8MPiX88ws/oxQ/tLYFqBEWLudRGjDvK/Qp54ABWptQq78yoc5IXbkd1f4LCaeRWEvtXGFkJJo9ZJYR7qMNmXr8xhxJM6DGCE+XtWmzJdYNtZo0/HcoBP7fMWjma0WU9gt71I5f+xsERZD5uDd0/MXKMbPaeX5LYZ/gOiBN6BFA4b1d7nFOkfB7dh6Xe+NoaKw29xbBsRliXkXTC3Qf7mirqXnsyXi5T1Y0arW0wn4cVmkHwY9lliUMbIxpqQgeQLmnVe5BkQq9Bc+QgID+VeuyR+qWqRXnEeqxIYonF6NbB6mhsFhzkZ+0dmG+xtdmhkRb779pyLm3i4ylUTNgqFurU58Vl0ZuR8FbAiEf9aTZpk+tfN7gsoxxLwpxOUg8GWLu6X094AAcJuuj3Y3bRj2bOt036V6pWAfoND655nohw/sY0PFJtVWdDcwbOifJUouRN/zhmsRKfi0Q8PR9EbfFWr0J030kUpLQitzKq0GXR2DMtvtEuVGtKIMJwRG1Tuc2AokokqJlak3iC3x8ifjwA29xVHrZqNISunCoeQaNSLQkWk0N4iMCBa0Va7AOALmhL3jRVrWUEjOgGbdkl320YYmjRSAUeAJzd/+UYn5C8G/LzCxdAH/6w4BdS3GhHbQCMWzPWOIv+cFLdEkSEARo5M4c6HLhqUEalzSVRAc461apqD1Sjy5x2c+o6AOJyO2q5dwYI794FVYGmGzmIQJrXNKNN62OiulbANFxv4ou5lyAFnoddEeC04xLrUdPlUX8nR6kclSD2g1E+gCpT4q8/6mfEJnQoSma6wrpgp6r95wW0mLg8fIKqR
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(53546011)(186003)(31696002)(2906002)(86362001)(52116002)(66476007)(2616005)(4326008)(8676002)(38100700002)(5660300002)(66556008)(66946007)(6506007)(6512007)(966005)(31686004)(6486002)(316002)(508600001)(66574015)(83380400001)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2J5bHM0M0x3NmFsZG15S0Z5eEx0bEFlZmhEbU80Tk1RZmpydThVSnkrNGl5?=
 =?utf-8?B?YlFHb2pnRkZWZngwU0cvVUI4N000NWNOdzAvOHdYajl1NkdjMThmaGFOUHk1?=
 =?utf-8?B?ajUxRTN2dFBCblNMV2ZSVEs5NGMwN3hJWFpvaWJwcWpHOWN0NVFqZyt6YUF3?=
 =?utf-8?B?TWpzVkRITWo2a0MrS1ZMMjJrdjFXKy9jVXJZeDgyTEE1QVYrQmNxTHdBNy8w?=
 =?utf-8?B?WVY4b2FRQzhiNlpkT3QweVF0L29zMlBxSmhKVmxBT2lIbWphV1lNYi9yaXVQ?=
 =?utf-8?B?RWQ0VHpEZ0VoVUVrUXR5eUdDM2tSWGlDRk9mcS9SN094dkY4YzgzNERvM29o?=
 =?utf-8?B?OFRObWxFU2hIZ3NJTXRvSEFURHc1Wk9NZFBYU2pKUEl0WU5ScW1lakJRcmh4?=
 =?utf-8?B?cU1sVjJFalhlQWN1b1UzMFRsaFljYmczcGJUZTBvNkNFd2NyMk9Nc3JzN1FX?=
 =?utf-8?B?Y0prT3lMMWZ6OVN5blN3UzViRElJQ1R5eC84MjVFTm5tUmIzZEFORi85Y2sw?=
 =?utf-8?B?SjA1MEFNZzFBUktFdnUrbzdoNElNVWJpSTJZWGR0dkdDME1vS1lKejh4RXJ6?=
 =?utf-8?B?Z0krRnBoUDAwOE9nWDErRzZVZ3JmU0dnREdFUGxaUTROd203WGFYdmE4QU9Y?=
 =?utf-8?B?NzJ4VVJlUWtKUUZFL0RTZkE2enQ0ZmkvNkdyT3Y2cEpzakFDYlRiZ3hZSzZW?=
 =?utf-8?B?TkJxcTNERzZNVzBMR01Oajg4N2ZoMDg1blI0ZHdEdjFUT0U4YXozZFZFZk9L?=
 =?utf-8?B?N2l5ZVBFZ0FxeXh6V3lkRXVsOXpUcWFLcHQ2NWYzU2x6SldPZEFQYkhFKzl2?=
 =?utf-8?B?ak5YWS9Ja0pEUnMvTWx4Q3dDT205RWNkNGViTzI1Mm5iL2E2bWRSdFFPQjVQ?=
 =?utf-8?B?YmVYQkcra09XOVkrMHF0YkNBWjE5Wk0vTzQ0cEN1YnhSZVJyZDVBSDBIRlBY?=
 =?utf-8?B?NmFEU3J4NlJVOVFZa2hmcXRIeERHNWlWM3VDSHcrS1h3dTNmV1dFSUpMUmEy?=
 =?utf-8?B?RkVsOURSMnF6VWE1NzNhTjVWcHUzaDJjRkNzWGprV2ZnckdhRkRJQ0dTaVpH?=
 =?utf-8?B?SFJob1M4T2lWZXplbFdqaG9wcHprK1RkYUk1Nlg4cTgxU0dtRk5WRGNLMDFK?=
 =?utf-8?B?L0c1ditVeVVBYS9wd3JieVpyQ1grdlJhSHV0ZWdvVWxCaDRBTVB2ZjgzYlFU?=
 =?utf-8?B?WmEyQTBoK1lpWmVlZjBVMnhaRkUwRGhtSFFNUXZ5N2pmVXdlNWhxTFZBeFJv?=
 =?utf-8?B?SjA3K2tCdTVQM2ZjTFY5TmVvV01KRXU1NW9uL3dFcW82a0ZMMjMrenhaWGw5?=
 =?utf-8?B?NWEvRmZUQXF4SCtSbWxKMndGNy95N2hVb1A4L0xBK1BocEt6bkJLMHloL1p6?=
 =?utf-8?B?Yk9rTDJwTHEyTVJ0MFZXMDBmOUZxVC9RM2RxUE4wVm1oYjFxNTVQZjd1Zmk4?=
 =?utf-8?B?QU4xTlp5a2pwTnlTdWZJWXp2eC8xVVUzNlJuZ0F0aXZWbEpNUXQ4emZJMU1l?=
 =?utf-8?B?ZXk1RGh5Y1BsaXI1WXJIUXNpSmtOVlVnU01WMmRubi94eEY3QkRRSm4xc1NT?=
 =?utf-8?B?UmM3YlFGU2UxM1dFYUIrS0RVQmQyQXc3TzhoTlptZ0FaZFF1cG96eXZ2bHk1?=
 =?utf-8?B?dVhmZkxWUDFPRHpjME5WeWVqWmJscDFUemhuS2tpRS9FRTFlRFM2T3piSVVr?=
 =?utf-8?B?SkhWZ05TZ0c4YUd0VmlvUnNTeGh4WHhiRWVsTnd3M1BUend2MmZPRDlVbTNs?=
 =?utf-8?B?TVpoeVN2RDRXbjFNNERoR0lSUDdpcG1YeVFWS1cvVGJOVXN0ZGg1N3llSmdy?=
 =?utf-8?B?ZHI5b0FDbUhwQWMyNU9PZnB2ODBrYXA1Y2VWUHBWYWRwN3UrU2d5R2lNbUJR?=
 =?utf-8?B?OHcwUnRhUmFTVHpTYUFwdmhzK0VwSm4za0FDaXJ5K2pmL2E0aDFFdjUySmVx?=
 =?utf-8?B?T3ZVeEhwWGZwV2dYRGp0OFZrMGRIejU3bnhmNVEyNTF6aTFJbDc4YlpTTnpk?=
 =?utf-8?B?cVlBeVdpbVRSeXp5azU1bTJOcTBuYjlRUkZUZGVVZ2RwMkVEMDc3RjBaSjFX?=
 =?utf-8?B?SXM2dy9MdU1yQ1UrZk51b0NqcThWc0pnR3pGbVdrSUhPSVNXVlBVZU1mL1dK?=
 =?utf-8?B?UjRMNmNTT1hObldhODhDVjg3R0s2cFhwMklRWVlVUmRQQzg4NEM1QXVaT2Yx?=
 =?utf-8?B?YjNzM0xoc0lDMlhiTWpnY0xibEdNSXVsL2FRMThDWElnZlJtZDJidlM3MXpw?=
 =?utf-8?Q?wwOTZ4atycOZKgQSpa1YaejxMCahG/g/KL0U5g3q6Q=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f19d851e-8117-4072-c350-08da0159a4a0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 23:16:15.6437
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oCf8a6MGkexWQJLDe45pggUxXztZonWIIE9ybi1eEN0uoeK5vTJNWM+RYuVpAv5nTdXJwWy80oUuWxbhQubDmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6680
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,LONG_TERM_PRICE,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 3/8/22 21:28, Nicolas Dufresne wrote:
> Le mardi 08 mars 2022 à 20:42 +0100, Xavier Roumegue (OSS) a écrit :
>> Hello Nicolas,
>>
>> On 3/8/22 20:15, Nicolas Dufresne wrote:
>>> Le mardi 08 mars 2022 à 19:48 +0100, Xavier Roumegue a écrit :
>>>> The DW100 driver gets the dewarping mapping as a binary blob from the
>>>> userspace application through a custom control.
>>>> The blob format is hardware specific so create a dedicated control for
>>>> this purpose.
>>>>
>>>> Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
>>>> ---
>>>>    Documentation/userspace-api/media/drivers/dw100.rst |  7 +++++++
>>>>    include/uapi/linux/dw100.h                          | 11 +++++++++++
>>>>    2 files changed, 18 insertions(+)
>>>>    create mode 100644 include/uapi/linux/dw100.h
>>>>
>>>> diff --git a/Documentation/userspace-api/media/drivers/dw100.rst b/Documentation/userspace-api/media/drivers/dw100.rst
>>>> index 20aeae63a94f..3abad05849ad 100644
>>>> --- a/Documentation/userspace-api/media/drivers/dw100.rst
>>>> +++ b/Documentation/userspace-api/media/drivers/dw100.rst
>>>> @@ -20,4 +20,11 @@ match the expected size inherited from the destination image resolution.
>>>>    More details on the DW100 hardware operations can be found in
>>>>    *chapter 13.15 DeWarp* of IMX8MP_ reference manuel.
>>>>    
>>>> +The Vivante DW100 m2m driver implements the following driver-specific control:
>>>> +
>>>> +``V4L2_CID_DW100_MAPPING (integer)``
>>>> +    Specifies to DW100 driver its dewarping map (aka LUT) blob as described in
>>>> +    *chapter 13.15.2.3 Dewarping Remap* of IMX8MP_ reference manual as an U32
>>>> +    dynamic array.
>>>> +
>>>>    .. _IMX8MP: https://www.nxp.com/webapp/Download?colCode=IMX8MPIEC
>>>
>>> This point to a document names "i.MX 8M Plus Applications Processor Datasheet
>>> for Industrial Products" which does not contain that reference.
>> My bad.. Wrong link. :)
>> Will repost with correct link.
> 
> Thanks. What I wanted to check is if it actually made sense to expose the
> synthetized HW LUT. But for this, one need to share the parameters / algo needed
> to generate them.
There is no special dewarping algorithm which strictly depends on the 
dw100 IP, or optimized for the IP capabilities.

  This way we can compare against other popular dewarp
> algorithms / API and see if they have something in common.
The dw100 hw lut description is rather close to a how you implement 
dewarping with openGL taking benefit of the shader pipeline stage.
The main differences with OpenGL implementation are:
- Fixed vertices coordinates (16x16) vs any
- Limited resolution on input (texture) coordinates (UQ12.4) vs float

Standard routines from OpenCV such as initUndistortRectifyMap()
https://docs.opencv.org/4.5.5/d9/d0c/group__calib3d.html#ga7dfb72c9cf9780a347fbe3d1c47e5d5a
can be used to generate the binary blob, with an additional decimation 
processing stage to satisfy the 16x16 macro block vertices grid and the 
fixed point format.

> 
> The issue I see with this control is relate to the message it gives. When adding
> controls for the prosperity, we want these control to actually be usable. This
> is possible if the documentation makes its usage obvious, or if there is Open
> Source userland to support that.
So yes, most famous vision opensource project such OpenCV can be used to 
generate the blob.
> 
> None of this is met, so as a side effect, this looks like NXP sneaking in
> private blob control into a publicly maintained Open Source project.
I then disagree with this statement considering my previous comments.

I plan to release publicly some programming examples on how to generate 
the dewarping map only using openCV library routines and aligned with 
lenses calibration state of the art method.
A dedicated openCV module taking benefit of the DW100 will be published 
as well.

A long term target is to add its support in libcamera, combined with all 
media components (CSI, ISP, ISI) pulled from upstream kernel tree.

  This isn't
> truly aligned with how V4L2 controls are meant to be. Doing trivial lut
> synthesis in the kernel could be fine though.
I am not sure what you meant with this comment.

As part of this patch series, an identity map is generated in the driver 
which should be enough for anyone familiar with dewarping process.
If you meant to generate the remapping table from the lens calibration 
data, I don't think this is a reasonable option considering the 
NP-completeness of the problem.

If this is the idea of binary blob (despite its public format 
description) which hurts you, the map can be exposed to the kernel in a 
more human readable format such Image_in(xin, yin) -> Image_out(xout, 
yout) in UQ1.31 format but will add extra processing at runtime for 
something which has to be done anyway offline, and memory overhead. But 
I don't think we can end with a generic v4l2 control considering the 
hardware restrictions (vertices position, limited fixed point 
resolution, etc..).

Adding a generic dewarping API to V4L2 is possible but this was not the 
scope of this patchset, and anyway missing data on any existing public 
dewarp hardware implementation supported by the kernel is somehow a 
blocker for this.

> 
>>>
>>>> diff --git a/include/uapi/linux/dw100.h b/include/uapi/linux/dw100.h
>>>> new file mode 100644
>>>> index 000000000000..0ef926c61cf0
>>>> --- /dev/null
>>>> +++ b/include/uapi/linux/dw100.h
>>>> @@ -0,0 +1,11 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
>>>> +/* Copyright 2022 NXP */
>>>> +
>>>> +#ifndef __UAPI_DW100_H__
>>>> +#define __UAPI_DW100_H__
>>>> +
>>>> +#include <linux/v4l2-controls.h>
>>>> +
>>>> +#define V4L2_CID_DW100_MAPPING		(V4L2_CID_USER_DW100_BASE + 1)
>>>> +
>>>> +#endif
>>>
> 
