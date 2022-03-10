Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B6F94D54BA
	for <lists+linux-media@lfdr.de>; Thu, 10 Mar 2022 23:42:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242589AbiCJWn1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Mar 2022 17:43:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231160AbiCJWn0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Mar 2022 17:43:26 -0500
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60068.outbound.protection.outlook.com [40.107.6.68])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BEC4187E21;
        Thu, 10 Mar 2022 14:42:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fsdJX5BsHdMN8zS/gwqzejOatemZptKThzhtLZmEn24kKU47DyIwk+YZPfyRDl1a0IGx/Re5fKbKCIO2pPtc/Pd9bbqJITRF+t+9FcUjPmmWjRGiggKEme+Y0gj2PdKW1UrbTRJzFVeP3KdJueSWISYm1CNBUYiOWgRpQCDC7t3mDNWV+wMEnSNpnZ3yMxs5j7kdYZ2Ogs/uu9RbMfh/Wx3p6jml6Idiq/Llyjl3gjjUuLSZVAC4CxwTDaExBOqCZ+vKkKXFxBFLnBeA4/zmQ4PSvlpktCOgngZtStbASIyzvh9r3ojI1OvOf7FoHkwGQ91j6BospUt+fsNXZwPrfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/DfYJQuiriFEFWF2p/XvDL7ZfALXS6XYAUa2u+g0FpM=;
 b=jJITuKZN+EPAs0fExsgKldeJS+pqfI2hCGc4p0uwqFtjdweliaqYzkf4YVoqyTc4ZAMq0PH6CbliakRnL2ZGSU8FgOCU+HV3dCANUfafzxcOxyyS2O16IA+bkO6WADZFSHaratszevq5eBQldiJysj6nvklkxHiZzLMthcvLwOEWkTuC0hPSGF3iU78XzjLcxQtuiq5/ZZ1mVatG9HVgjpMahrYoodupI+srUgyyBSl7MwvLSj55X4aTV+BXdzlT8FaF22dSLd/5Ze53Wc0lNDWOKMWz0Vg5BPY86hN9K/J8aJb1geDugHftlp/Df2DlUjSmf96Z+Isd13StBEeNJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/DfYJQuiriFEFWF2p/XvDL7ZfALXS6XYAUa2u+g0FpM=;
 b=UhGXwrd6MFZApU3ropEXx4IgHmk3aT23qzlx/SEKDeegJe5an4llMjyZl7Gyd8YM8NbBfb8NmQjDPygLILoI7ZLjMkFjeFPGdn2tmfHMZGKU8lGn4soJ6p6wP4VnSe1d1qzVtjb5AJJIS/X8PdH45+5Re6nB0x3XdKjJ5dj1oM8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by DU0PR04MB9441.eurprd04.prod.outlook.com (2603:10a6:10:359::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.26; Thu, 10 Mar
 2022 22:42:20 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::a037:bc8:44b:5965]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::a037:bc8:44b:5965%3]) with mapi id 15.20.5061.022; Thu, 10 Mar 2022
 22:42:20 +0000
Message-ID: <d2620de6-9a73-1a0c-d3f3-7dfd8c84d261@oss.nxp.com>
Date:   Thu, 10 Mar 2022 23:42:18 +0100
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
 <d48e2863-0098-41bf-3bc5-2fdf14aa8a11@oss.nxp.com>
 <2adbb0c29d3951edd953c4738affb40d32cf1d3d.camel@ndufresne.ca>
From:   "Xavier Roumegue (OSS)" <xavier.roumegue@oss.nxp.com>
In-Reply-To: <2adbb0c29d3951edd953c4738affb40d32cf1d3d.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR3P189CA0018.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:52::23) To PAXPR04MB8703.eurprd04.prod.outlook.com
 (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c4de6d1a-f107-4183-7533-08da02e73c6f
X-MS-TrafficTypeDiagnostic: DU0PR04MB9441:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <DU0PR04MB9441E003BB2D433B37E16747BA0B9@DU0PR04MB9441.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oeO2hgUQTlZHmQ5IDnC2Xp/Sf3MilfYN47m+R+cDk+C9bFNeMsIxAq3HoZAHMM8ToOSE0kHhH9Wtvz6EA3n1H8KIH8yCSpo2nrL2E/BlgLUXM+vx2M4CmnjDMjFWf3CeZj4dqc8m/uhM4BcqZRyjX/uM7tegjm3Y+KCusDTtjrEyocDOvF1DSLxLgSNNZOqzm0o8ObcNyvp3u1xsyS50dAPjS9RuTAiE1HWvRaj9tt8mY9Z7R8b9V6EiTMoeR2rKHz7IZSlU1mmvsUMTXnte+ptd4pLpVUFTfyLZZK/Ko0TatHH/yrZ0g0iRtlo0DJ67Rsb9ByZ9pZd1mHl9/gZq3xRxWrcO09YLdJcLLpjbAltQtO7cWFIidSOsR2kZfHrthPY7TlnFgubfQ1E6Qeb5dgCDlKZTjXyfUWifFR6Zs0wQWZ0zdGgM7kdoHvqNUTl51ta/Fun2RuDVgVjjTzWH1uXXRHToVxdiCrdZ4w0+kS6ldZbTm+MnMamvptAPI8bJwFvjPPtNp48aqRCCcg2uLlu8OSL6TWDPiNfmjkD+g4KcnKdbAdbY4Aa4GNg5/kk6atGyyMKfOL1Uzjer4d9WwORJgwJBtX0sDBfVMdZMeGZD9eVMEY34vrSL6H9B9Cpbfqc/A2YjLteasIXmWlahsJ+PBKTN3ApLrWFmerzhyLVk+z22t36XKE/kYwsr/WI9V42x5iPnZqivssdn/7TzFnrQce2CicNS35FE+2HlIH2IAaHlA00iNxcTdgiBlJj3rkFGKdwb/AJWkjspFbivdgVWfOOmbmyUm4b+Ku9GBdqoSe2dUvaXuUs1GAjPGb/e
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2616005)(83380400001)(5660300002)(2906002)(30864003)(31686004)(31696002)(4326008)(52116002)(53546011)(6506007)(6512007)(8936002)(38100700002)(66574015)(186003)(316002)(66476007)(66556008)(8676002)(6486002)(86362001)(66946007)(508600001)(966005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NU9OaWpBK2x3a2k0MjNiVmdtcHBNTXhpWmp3N2QzZUJpNm9UUVBDdlA5VjZV?=
 =?utf-8?B?dGZEaUdlaVpnMnVVUUZ0djBGdTYveFFrazljbGR6YXlNQWFsSGRpcmFsanUz?=
 =?utf-8?B?OVQyL3FoY21yTVpycVZZcHdrM1FZaW9XSGJVM3FObzRHWS9zendIQlIxS21u?=
 =?utf-8?B?cmc1eHYwTnA3N2FuZExHMU9ONHRHUWpYZkszMUFxa2ZZYlJNd08rSU8rYWZn?=
 =?utf-8?B?N3JBbTB0U0Y3cWl1K1ovejdPRnJNTmhoNFVwSy9VRXR6NG8wWXVvRnl1V1Qv?=
 =?utf-8?B?ZVk1c25zSDlOV0h5WklnMnVwdUtUOU9VTE5DOUJVQUpyWFE5YkhKMWVIRk9V?=
 =?utf-8?B?Q3ppaWZ2RE9JMi96VmlvN1Nwa0dPcG5JU1ZzeS83WDNWU3B4UzVLYzJka1ZP?=
 =?utf-8?B?aUZUa2krR3NnNkc0OEl5SWRGcnRrTk1tOWViZ0hKc2dCWUN1N3R1NEtWTDNU?=
 =?utf-8?B?TXNsbGhoYnAvc0UyZHRacjkvOEYrYXpHdEZmcFpRSVVza1gzMmhLKzFScTVX?=
 =?utf-8?B?SDI5VjUrazdreS8zejk3MTlNNTQwdllPUE40clNHTmd4dHAwRlh4SUNtdko2?=
 =?utf-8?B?YnpZeXRDcHBCRFg3U0UzcFZvOEhPZkU1b1puMW81aDMrMkhWemw4TTUvTmkz?=
 =?utf-8?B?dkoxVHpEMFpXZi9HSHJJczRNQVpEWk5wSVVmWis3eHFsMGFoZTVpbGF2Z3VM?=
 =?utf-8?B?ZlZOUStEb0tudUY2NDlEWG1NNFlSbnlqWkRkUEFnaTByS0JNSEFNQjV6UFh4?=
 =?utf-8?B?aDMxT1d6ZDVUYmxiZ3hKM0hNUEM2UE90c3dZRXMwUDBUR0NCWWNENEcxTGww?=
 =?utf-8?B?Y3ZkQ29ZVmlKdERtL0k5VU9USkJsY2ZoSEV5cUJ1Qmt0R0dKZzdFQ2I2TVpq?=
 =?utf-8?B?ZW5GUXIzRVhHMW5KM1lEYXlXLzFQMGo5S3F4OFlTTDM3QnJYYkZaV1RPK055?=
 =?utf-8?B?TzF0aHZGV3NueWJaSTlpMzZzOTErNFBZZTdSOTdDTjlRTUpBODJIeGk0WGR0?=
 =?utf-8?B?OEQxSS9GaWRLRlY0TUJBdmdmc3RNdEo2b0drTzF2cTJhY0tuWERUekhWbWhB?=
 =?utf-8?B?MEJyc3RUZktOZTN3NytBclFMenR1NURqYVMrVHRNaHJ0UEFKcjNKQXJKZzJh?=
 =?utf-8?B?dElxMXhpSWk0bXBBWWFBendEM2k3dElVUzA5MVdrc1ZGLzBlSWlIQTJYSTho?=
 =?utf-8?B?VE9kZ2JNaTRCa21LL0piWkkxRXlBVjI2dVduTW5DUGF1ZDV6QVBtZG51RXBP?=
 =?utf-8?B?MW55WCtPOTdTNTM3eHZScUtsMFhGRnpGLzRUczQvMDdUVVZFdTdZbVM0NW10?=
 =?utf-8?B?Ky9PZ1FmYTVHT2tSMDlHT2RCbnYyZVIyZkFLVDZLVzEzN3psY3NYUXEzN1NT?=
 =?utf-8?B?Tk40aFV5em9ZSzFpWUlpZDdYMk9TY1l2dExBazdpWEFkakszZW1nZ2dIb1NQ?=
 =?utf-8?B?SEphOGlGZm9tczJ1eXZzY0xUMWVPOVZWRW14bHJpUzArM1IrT2I0VnVUWFJO?=
 =?utf-8?B?YmlDeFVYck93Ty9TN1hZcEVrSGVJWE5YRFlDMVZWQldROEZNRjQ5OVZYMEth?=
 =?utf-8?B?Sk1mM3J1NkZzY0RjUkQzMTgxejBzbUxqMlN2OXNjejVXN1NzY3RVNHVXSnBw?=
 =?utf-8?B?b0hhVFRkY0pJWE4zRktMcEwveHl3K1VmWm9CM25FRXhWM1EzL2dPVFJTUG53?=
 =?utf-8?B?bmprYi85TkFSWURoQXRNc0RDSk83eXl2cXZ0NzhIb05FS3dTeFVvckk3b096?=
 =?utf-8?B?OEtIOGFYS3RBUzJOWDQrT0ZCVlh2VFNielJ0NDdxajNwekZVZm5XMG9RaktD?=
 =?utf-8?B?djB6ZitjamNNMWRSZmxzR3ZhN2pKM0diaU9wRUFLNC9YUUZEL2tCOFI1a05t?=
 =?utf-8?B?VytuTEpjQlFJTjBDT2pqVjk2d3VMTTVROHFuVE1jUlhtdmU4cXpJall6KzJS?=
 =?utf-8?B?MDdoVU16bGV2eW1YcmpvQ1dZekorMEdzMFh0cFlCc0I0L2NCN3RzREIwVVll?=
 =?utf-8?B?QXVmL3ZkYmtyMnFGQTF4Z2xFbFBBUFZqVGlUMVk3YWR0bTVCaTVCb2xRb0tG?=
 =?utf-8?B?TXFSSUk4RzZYMWlkM2huV2FiSGlPNDN4eGZ2Wi9PSEkySEoyZm0weGk0WUVY?=
 =?utf-8?B?WEFmbHNFV3hVOEV3bnY4dGdRUUl4aXJQVlQ5UnRrbDlxZDNGMXN1NXBxOGpG?=
 =?utf-8?B?WW1vRllqVHJRYlBLWEdWMDgvMGNiN3pGSlhtU0x1dmh0SVN5VFhIR0tCV2xD?=
 =?utf-8?Q?DIhShiu6QTEPCj6TNahtTMgAdr5xrTdJTVQfb/GIu0=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4de6d1a-f107-4183-7533-08da02e73c6f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 22:42:20.3015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SaAZvq7B11XdOeDYtTr9sp0mfmC84fgrj4rN0UoaXvyqYPnqAbKTiZQL0GOVOrvvTSlh4GZTN5k0FZ3c//Ui3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9441
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,LONG_TERM_PRICE,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 3/10/22 22:52, Nicolas Dufresne wrote:
> Le jeudi 10 mars 2022 à 13:20 +0100, Xavier Roumegue (OSS) a écrit :
>>
>> On 3/9/22 21:08, Nicolas Dufresne wrote:
>>> Le mercredi 09 mars 2022 à 00:16 +0100, Xavier Roumegue (OSS) a écrit :
>>>>
>>>> On 3/8/22 21:28, Nicolas Dufresne wrote:
>>>>> Le mardi 08 mars 2022 à 20:42 +0100, Xavier Roumegue (OSS) a écrit :
>>>>>> Hello Nicolas,
>>>>>>
>>>>>> On 3/8/22 20:15, Nicolas Dufresne wrote:
>>>>>>> Le mardi 08 mars 2022 à 19:48 +0100, Xavier Roumegue a écrit :
>>>>>>>> The DW100 driver gets the dewarping mapping as a binary blob from the
>>>>>>>> userspace application through a custom control.
>>>>>>>> The blob format is hardware specific so create a dedicated control for
>>>>>>>> this purpose.
>>>>>>>>
>>>>>>>> Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
>>>>>>>> ---
>>>>>>>>      Documentation/userspace-api/media/drivers/dw100.rst |  7 +++++++
>>>>>>>>      include/uapi/linux/dw100.h                          | 11 +++++++++++
>>>>>>>>      2 files changed, 18 insertions(+)
>>>>>>>>      create mode 100644 include/uapi/linux/dw100.h
>>>>>>>>
>>>>>>>> diff --git a/Documentation/userspace-api/media/drivers/dw100.rst b/Documentation/userspace-api/media/drivers/dw100.rst
>>>>>>>> index 20aeae63a94f..3abad05849ad 100644
>>>>>>>> --- a/Documentation/userspace-api/media/drivers/dw100.rst
>>>>>>>> +++ b/Documentation/userspace-api/media/drivers/dw100.rst
>>>>>>>> @@ -20,4 +20,11 @@ match the expected size inherited from the destination image resolution.
>>>>>>>>      More details on the DW100 hardware operations can be found in
>>>>>>>>      *chapter 13.15 DeWarp* of IMX8MP_ reference manuel.
>>>>>>>>      
>>>>>>>> +The Vivante DW100 m2m driver implements the following driver-specific control:
>>>>>>>> +
>>>>>>>> +``V4L2_CID_DW100_MAPPING (integer)``
>>>>>>>> +    Specifies to DW100 driver its dewarping map (aka LUT) blob as described in
>>>>>>>> +    *chapter 13.15.2.3 Dewarping Remap* of IMX8MP_ reference manual as an U32
>>>>>>>> +    dynamic array.
>>>>>>>> +
>>>>>>>>      .. _IMX8MP: https://www.nxp.com/webapp/Download?colCode=IMX8MPIEC
>>>>>>>
>>>>>>> This point to a document names "i.MX 8M Plus Applications Processor Datasheet
>>>>>>> for Industrial Products" which does not contain that reference.
>>>>>> My bad.. Wrong link. :)
>>>>>> Will repost with correct link.
>>>>>
>>>>> Thanks. What I wanted to check is if it actually made sense to expose the
>>>>> synthetized HW LUT. But for this, one need to share the parameters / algo needed
>>>>> to generate them.
>>>> There is no special dewarping algorithm which strictly depends on the
>>>> dw100 IP, or optimized for the IP capabilities.
>>>>
>>>>     This way we can compare against other popular dewarp
>>>>> algorithms / API and see if they have something in common.
>>>> The dw100 hw lut description is rather close to a how you implement
>>>> dewarping with openGL taking benefit of the shader pipeline stage.
>>>> The main differences with OpenGL implementation are:
>>>> - Fixed vertices coordinates (16x16) vs any
>>>> - Limited resolution on input (texture) coordinates (UQ12.4) vs float
>>>>
>>>> Standard routines from OpenCV such as initUndistortRectifyMap()
>>>> https://docs.opencv.org/4.5.5/d9/d0c/group__calib3d.html#ga7dfb72c9cf9780a347fbe3d1c47e5d5a
>>>> can be used to generate the binary blob, with an additional decimation
>>>> processing stage to satisfy the 16x16 macro block vertices grid and the
>>>> fixed point format.
>>>>
>>>>>
>>>>> The issue I see with this control is relate to the message it gives. When adding
>>>>> controls for the prosperity, we want these control to actually be usable. This
>>>>> is possible if the documentation makes its usage obvious, or if there is Open
>>>>> Source userland to support that.
>>>> So yes, most famous vision opensource project such OpenCV can be used to
>>>> generate the blob.
>>>>>
>>>>> None of this is met, so as a side effect, this looks like NXP sneaking in
>>>>> private blob control into a publicly maintained Open Source project.
>>>> I then disagree with this statement considering my previous comments.
>>>>
>>>> I plan to release publicly some programming examples on how to generate
>>>> the dewarping map only using openCV library routines and aligned with
>>>> lenses calibration state of the art method.
>>>> A dedicated openCV module taking benefit of the DW100 will be published
>>>> as well.
>>>>
>>>> A long term target is to add its support in libcamera, combined with all
>>>> media components (CSI, ISP, ISI) pulled from upstream kernel tree.
>>>>
>>>>     This isn't
>>>>> truly aligned with how V4L2 controls are meant to be. Doing trivial lut
>>>>> synthesis in the kernel could be fine though.
>>>> I am not sure what you meant with this comment.
>>>>
>>>> As part of this patch series, an identity map is generated in the driver
>>>> which should be enough for anyone familiar with dewarping process.
>>>> If you meant to generate the remapping table from the lens calibration
>>>> data, I don't think this is a reasonable option considering the
>>>> NP-completeness of the problem.
>>>>
>>>> If this is the idea of binary blob (despite its public format
>>>> description) which hurts you, the map can be exposed to the kernel in a
>>>> more human readable format such Image_in(xin, yin) -> Image_out(xout,
>>>> yout) in UQ1.31 format but will add extra processing at runtime for
>>>> something which has to be done anyway offline, and memory overhead. But
>>>> I don't think we can end with a generic v4l2 control considering the
>>>> hardware restrictions (vertices position, limited fixed point
>>>> resolution, etc..).
>>>
>>> Please avoid implication that I would be *hurt* by your patchset. Your
>>> imagination will make you read my comment as saying something it is not. My
>>> comment are strictly scoped within the information you have provided with the
>>> patchset to justify adding a vendor control in contrast to providing controls
>>> that would be reused by another driver later. I'm not into lense or anything, I
>>> strictly review the userland APIs that you submitted with care on documentation
>>> and usability.
>>>
>>> Try and ignore everything you know and the inner of this hardware design, and
>>> perhaps about dewarping technique and you may endup with a different read of
>>> your patchset. My impression while reading it is that I would not be able to use
>>> it due to lack of example. And if NXP website would stop hosting the
>>> documentation, this would make it just impossible. Time have showed that vendor
>>> controls are rarely the solution and should only be added with great care and
>>> good documentation. For a first driver supporting a technology like this one, it
>>> could be acceptable, assuming it is documented in a future proof way.
>> I fully understand uapi changes have to be handle with care, and that
>> was the reason I was initially willing to use a private custom control
>> (as few drivers are doing), without being aware of the current policy
>> with this regards.
>>
>> I was willing to share the details of the hardware specification through
>> NXP website such as one could get all public details available on the
>> IP, and I was (wrongly) thinking the code was talking by itself to give
>> indication on its format (finally pretty simple). Again, I understand
>> one could be mistrustful with documentation hosted out of kernel tree
>> for the reasons you mentioned, even though the risk is pretty small as
>> NXP (as most of the vendors) has some long term maintenance legal
>> contracts to fulfill.
>>
>>>
>>> All the information and the rationale you are adding in this reply can be added
>>> in the next submission. What I think you should strictly address:
>>>
>>> - The LUT format and meaning should be documented directly in the Linux Kernel
>>> documentation. Having to register an account with NXP in order to download the
>>> documentation is not acceptable and not future safe.
>> Will do, and will provide a short script example to generate the LUT.
>>> - You forgot to provide the output of v4l2-compliance, I didn't mention yet, but
>>> that would have come of course.
>> The v4l2-compliance report is actually in the cover letter of the patchset.
>>>
>>> The rest are just nice to have, though generally wanted.
>>>
>>> - The name of the control could be made more descriptive. The lut is mapping
>>> what in one word ? And that word could be added to the name.
>> I am running out of imagination for figuring out the good word to use.
>> The LUT is mapping "input pixels coordinates" to "output pixels
>> coordinates".
>> Using OpenGL semantic, this maps textures coordinates to vertices
>> coordinates. Any naming suggestions are welcome.
> 
> I just read the 2 paragraph of doc in the 7K pages TRM, and indeed this is
> simple. The table is relocating/remapping vertex (tiles) not pixels. Is my
> reading correct ?
Yes, you are correct. The table is describing quadrilateral pixel areas 
to tiles remapping.
> 
> So it's basically an array of 32bit X/Y coordinate. Each coordinate are 16 bit
> fixed point, with 12bit for the rational, 4bit fractionnal (convient considering
> we have 16 x 16 vertex, as it got a step of 1/16). And the size of the control
> will vary depending on the resolution of the incoming stream. Basically rounded
> up form of width/16 x height/16 * 32bit. Right and bottom most tile are just
> missing pixels if the image size is not aligned, at least that was my reading of
> the doc.
Strictly speaking, the control size depends on the destination image 
resolution, check dw100_create_mapping() in patch 8 for more details.

But you definitely got the idea.

> 
> The coordinate points to the middle of the tile/vertex, and relocate with
> interpolation toward the specified coordinate. Basically stretching the image in
> that direction.
Yeap, as a GPU shader core does while dealing with a texture unit.
> 
> Some naming ideas:
> 
> - DW100_DEWARPING_MAP
> 
> Just the doc wording, no detail.
> 
> - DW100_DEWARPING_GRID_MAP
> 
> Another wording used in the doc.
> 
> - DW100_DEWARPING_16x16_VERTEX_MAP
> 
> A little more detail, still using mostly doc wording.
> 
> - DW100_DEWARPING_16x16_TILE_MAP
> 
> Using tile ? I simply use the term tile before because of my background, but
> vextex might speak better to folks used to do this in vertex shaders ?
You are right to introduce the tile wording in the discussion, as the 
vertices position in the destination image are deduced from those 16x16 
tiles. But this is likely more accurate to use vertex.
> 
> - DW100_DEWARPING_16x16_GRID_MAP
> 
> That basically avoid both tiles and vertex, grid is also a wording used in the
> doc.
> 
> Just some ideas. I kept the DW100 since its likely going to be classified as
> vendor. I would not make it private though.
Many thanks for those suggestions, I might have a slight preference for 
DW100_DEWARPING_16x16_VERTEX_MAP.
> 
>>
>>> - The patchset could mention userland code that uses it, which show that this is
>>> actually tested*
>>
>> Will do.
>> Custom control was tested with a gst pipelone using a (hacky)
>> gstv4l2transform element and a opencv script using custom module which
>> will be shared publicly.
>>
>>
>>
>>> - There is other feature you mention, unrelated to the dewarp feature. You
>>> haven't said with what userland these have been tested. M2M scaling, csc and
>>> crop are generic should just work with existing userland. You could use
>>> GStreamer as an example.
>> v4l2-ctl and gst pipeline using (vanilla) gstv4l2transform have been
>> used for testing.
>>
>> Unfortunately, I had to apply oneliner patches on v4l2-ctl to get the
>> cropping working to prevent the use of read_write_padded_frame() for
>> FWHT cases which is applying a sw cropping/compose if I got it right,
>> which seems incorrect for generic m2m.
>>
>> https://git.linuxtv.org/v4l-utils.git/tree/utils/v4l2-ctl/v4l2-ctl-streaming.cpp#n1112
>>
>> https://git.linuxtv.org/v4l-utils.git/tree/utils/v4l2-ctl/v4l2-ctl-streaming.cpp#n1372
>>
>> I will open a thread on v4l2-utils to discuss this.
>>
>>
>>>
>>> * You'll find this funny, or perhaps even insulting at first, but you'd be
>>> surprise how much code (specially from ARM SoC vendors) that get sent every year
>>> that don't even compile or have never been tested after being up-ported from an
>>> older tree. And that is only scratching the surface of the problem we have to
>>> deal with. Notably drivers were only 1 pixel format out of let's say 10 have
>>> been tested that comes with broken stride and memory buffer size calculation
>>> causing much larger troubles in the system.
>> This certainly does not ensure the driver to be bug-free, but I swear I
>> tested all in/out pixel format combinations and driver compilation is
>> W=12 warnings free :)
>>>
>>>>
>>>> Adding a generic dewarping API to V4L2 is possible but this was not the
>>>> scope of this patchset, and anyway missing data on any existing public
>>>> dewarp hardware implementation supported by the kernel is somehow a
>>>> blocker for this.
>>>
>>> I was asking to share about your research that made you opt-out any kind of non-
>>> vendor control for this feature. From your original submission, it would have
>>> been ill advised for me to assume anything. Note that programming interface for
>>> a V4L2 driver does not need to be based on other hardware vendor interface. I'm
>>> not in this industry, but there could have been an industry standard for
>>> expressing lense correction, produce through a a calibration process. The one
>>> thing I've been assuming is that you are in the industry and would be able to
>>> share a bit on that.
>> I am looking on dewarp stuff for 3 months but I can share for sure my
>> undersanding whatever it worths.
>> The optical system can be mathematically described using a set of
>> matrices and lenses distorsion parameters which are estimated during
>> your calibration stage.
>>
>> https://docs.opencv.org/4.5.5/dc/dbb/tutorial_py_calibration.html
>>
>> Then it's a matter of resolving a non linear system (ouch) to get the
>> remapping lut correcting the distorsion. OpenCV computes a 1:1 pixel
>> (re)mapping.
>>
>> This is obviously impossible to perform those software computation in
>> the kernel.
>> One could imagine that some hw dewarpers might have implemented mapping
>> lut computation in hardware, and if so, the control api could have been
>> inherited from those calibration parameters. I have no idea if such
>> hardware exists.
>>
>> Another alternative is to consider the remapping LUT as an input which
>> seems more reasonable applying divide and conquer concepts.
>> I would rather go for such option if a generic v4l2 interface should be
>> designed and combined with a library. And this would likely help to get
>> synergies with openGL implementation from the application standpoint.
>>
>> The driver would have to expose its mapping capabilities (mainly
>> vertices coordinates constraints (x:y mapping) and float resolution).
>> But this might worth waiting a bit to check the availability trend on
>> such capable hardware.
>>
>>
>>
>>>
>>>>
>>>>>
>>>>>>>
>>>>>>>> diff --git a/include/uapi/linux/dw100.h b/include/uapi/linux/dw100.h
>>>>>>>> new file mode 100644
>>>>>>>> index 000000000000..0ef926c61cf0
>>>>>>>> --- /dev/null
>>>>>>>> +++ b/include/uapi/linux/dw100.h
>>>>>>>> @@ -0,0 +1,11 @@
>>>>>>>> +/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
>>>>>>>> +/* Copyright 2022 NXP */
>>>>>>>> +
>>>>>>>> +#ifndef __UAPI_DW100_H__
>>>>>>>> +#define __UAPI_DW100_H__
>>>>>>>> +
>>>>>>>> +#include <linux/v4l2-controls.h>
>>>>>>>> +
>>>>>>>> +#define V4L2_CID_DW100_MAPPING		(V4L2_CID_USER_DW100_BASE + 1)
>>>>>>>> +
>>>>>>>> +#endif
>>>>>>>
>>>>>
>>>
> 
