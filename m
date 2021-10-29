Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D4F543FB3A
	for <lists+linux-media@lfdr.de>; Fri, 29 Oct 2021 13:09:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231867AbhJ2LLl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 Oct 2021 07:11:41 -0400
Received: from mail-eopbgr70101.outbound.protection.outlook.com ([40.107.7.101]:36482
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231815AbhJ2LLk (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 Oct 2021 07:11:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WD1McM9RpBwWn+tJYBxcyH7TUec9PdMUD6v/+KY2vA7mDEQxIWaruTMriWikWLB4walH7d4aIOrGHVEotrnyKaNT3N1m9RWTAET686EddXKsjhm4YG1kamJt3J8h59cKhJ3ko9Ko4OcViXCdK/3VSbPTQa9nH8nKyAABfK99D/dkwlK7U0OxTwleFwqysACXM5U4AfFZyz3/ohUCkI1rfY+SkOkVqxd1L2NXlww9dEqBNGXtbAXGYsWIckTD2q6HdRjkDuAt4AaZ4xQEYHxN+d6oFAMxkBDuqp3QufwFYjRawZV8reUXU9ZFMkrj39x6nJZtA8QruKfcA0vW6rhGSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q8Klbc9IW6+EBmGIXy+303/t8OdFzagZcwdjZn+fduc=;
 b=CQwupPk51/Bn0wzUZe85Bzxd2FYVLG2ozkcJfWmkHN4HobuPY2XnzXYXtxXagvKJwpJU8LoYn3WuEy/wE7zS2H+ZgUqj0Q3J1hty85v/B0Yc6kYWYJ3oW17fcCAd3Hd8PRt9noj7cDITpTtmp6acTKKTDZsnVa92RQmaK49zXyrfI6XMMyPv9CeVvIp0VrV4EhTru03jw7iEouswLFNKnyLnYE6mOgGSh0M41yjlhWnYXV2bIN0p7YZYtZoPUuuWBFDxjs82EAEPbjN7o5LoFdIuJSB+pODXSOPEzHkyCDBCR18zX2SpVbUGvAR+xClRz23RVghHiIIvRdosk/qwLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q8Klbc9IW6+EBmGIXy+303/t8OdFzagZcwdjZn+fduc=;
 b=GvVSLFdHZqD7Kcr2E/mydQ+uRwO4n++f9vT17ujwSm6i8guLv14CxcxhpIpI5ILZvZnsP18UK3/BWU1iibxEuSNKH01LGn6Zk1wKa192T3JnJ+XfcpRN8Plr5aF1pBcSBGj/w4qmFvzbmb+GTTRwxzdNg06eH8gGJXLN1BFqW6k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:157::14)
 by AM0PR10MB2676.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:12c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Fri, 29 Oct
 2021 11:09:08 +0000
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::96d:7b11:1f16:a316]) by AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::96d:7b11:1f16:a316%4]) with mapi id 15.20.4649.015; Fri, 29 Oct 2021
 11:09:08 +0000
Message-ID: <b63738b2-9e3a-0d21-a845-ca3be8b00892@kontron.de>
Date:   Fri, 29 Oct 2021 13:09:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [RFC V2 0/5] arm64: dts: imx8mm: Enable CSI and OV5640 Camera
Content-Language: en-US
To:     Adam Ford <aford173@gmail.com>, Fabio Estevam <festevam@gmail.com>
Cc:     "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-media <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        cstevens@beaconembedded.com,
        Adam Ford-BE <aford@beaconembedded.com>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
References: <20211023203457.1217821-1-aford173@gmail.com>
 <CAOMZO5BwPTWBhqzHgbzbC_UyzOX7LMGxX83H0FaJ-05ddOpqYQ@mail.gmail.com>
 <CAHCN7x+Bj==zd8_VRquv51RYiG9t_CRrB6=3fugaHvQS8PVS+g@mail.gmail.com>
From:   Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <CAHCN7x+Bj==zd8_VRquv51RYiG9t_CRrB6=3fugaHvQS8PVS+g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0325.eurprd06.prod.outlook.com
 (2603:10a6:20b:45b::14) To AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:157::14)
MIME-Version: 1.0
Received: from [192.168.10.35] (46.142.71.102) by AS9PR06CA0325.eurprd06.prod.outlook.com (2603:10a6:20b:45b::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14 via Frontend Transport; Fri, 29 Oct 2021 11:09:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 64761047-8b8a-42cf-7be7-08d99acc8753
X-MS-TrafficTypeDiagnostic: AM0PR10MB2676:
X-Microsoft-Antispam-PRVS: <AM0PR10MB2676D64272365D676BD14F49E9879@AM0PR10MB2676.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Mo2M6D9p3G6BNk/tbmti6yEP9D1WgA2AmsjHJCRLlTBgStdrXA8H6+rkHHTC9U5NC4im79xRUYdhu7ye/b2+5q/3mj3b+BcrBWaXNZiExoXPp5Ezh7oMM3c/HXjjMO1LOXCqPgxtxMQTtXetlyjRWbHH81AhYS5CIvoC38/hyLYLdOzm71VKjxMYECEvkGBBaYph/VIZDWJGwL4TROgtajoroA7gcn5Ll6UDYKYW0ogwTcjTZIGmIR16iSHvy8L3yCVWvMZ4llHjjdtG86T93Pw7oo1LHU3kX+6dFKRsW1Kq/DonlSCovkuhAQcHyCJ5YwdueU7r3GmTXMj+SZUuzONjYTvm4ePmAEnVwKw/LaBtHqDHj/lK4TVrqQAge1vNPdjZCDccUFeEohhlZekNDweJ2bHiI8uCBHYsYTGGV1y9Hk6gp/LgSv1IBRF1tvHl0l7F2i/hZIQGjwEahnTw5ov25TE7s4R1S5/RJfn889puI2D5cojAJfDpIXyhEGnGmNDWwZBDzS7rVto/Yo2lkPOPmU2wmVQECroHVcT5e4LZupRi0NgTyjmsqMJZi4RTg3KCE9gNU11c2+KWOUmbrgjPd1mVHQuVjLter78hQ3Ymi8JKrpz6ZkkqfVAS/zPxzS7Wuh7XXMhNc8j4GxFl4If/TSMimtGamVxv70wnirORTeOGewHIlDDOZcX3zsoJRjcTW3Y7gfBlRIKfmfXW+GRGC3m9zaILzczG0Pw3ImoQ+DhIz9Q7X6rJNhyAnPdl22NYL7HqTpdZI+6uHcpmCguIk74pQ6rLJVcJUxYnWrvl03Ig5P3ZGLuCOnnUkNh+Rs9IKXWkMcDzPjGaYckfHZ1pMlplXMzZBwNN7PFK1LQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(8936002)(86362001)(38100700002)(5660300002)(16576012)(186003)(36756003)(966005)(66946007)(26005)(53546011)(54906003)(66556008)(66476007)(956004)(45080400002)(2616005)(44832011)(7416002)(83380400001)(316002)(6666004)(6486002)(8676002)(2906002)(31686004)(4326008)(31696002)(110136005)(32563001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWxKSjdkY2hKRGx6dDZLREw1R2QvZjZXclI4VDlnajVPRFk5emNENEhTVzYv?=
 =?utf-8?B?dnBLaFBwMnlEVTBqT0hTZnJhWUtyaThjUjdWSTEvZlQ2QmhpSHY3TFNSTUpU?=
 =?utf-8?B?U1dLRDRwcHdIN0s1VnRuME0raUUySGk3NGRHUm5jUFZTckxJMktyRmg0MkZW?=
 =?utf-8?B?QlZ5MWJmZ2VmZ2lKL3dIbkY0MXdkcTdZQzdVaDRDazhzTHIwYnc4dmZUekR2?=
 =?utf-8?B?WmsyWDNoVlhYYUFQRjNNUVRLY2cxM0ZQM09sMTlEQS9wTmtvZXpJYVVVYW9T?=
 =?utf-8?B?VDY1MkhIck1SRElXVThNWDFwanZCTDJvL0wyUFhyS2dEZE1iTmhlSGpmaVRZ?=
 =?utf-8?B?ZHNUb2pySTZYTnppWHBFREJxb1UrQ3NKMWgxNTh1VUt5Tm9HZFhJRk9TWis1?=
 =?utf-8?B?Q2ZZakh1azdtTUE1WndwTnNwV1BxdllOaW9yemxaVFNvQktMZkFqV2FOTlNz?=
 =?utf-8?B?cDh0bGxNZjVQeXQ3N1FmNkZDZitSVXVIVWxYK1BibU1yQUlVZjR4Z3EyY3ps?=
 =?utf-8?B?U1pmNEZxRzBKRGMxN3V4a3pYUVhPcC9IUjNWUzFWSTVLRDZZVFo3YVVLbklm?=
 =?utf-8?B?bTBiWlBUSHJmNVY4M2dNKytxY3dxMUdpSWtsL2V4Y2hBSlhHRlUyeWprYmlr?=
 =?utf-8?B?S0U0MzVaSzQ3MWtnU1lhMEduMDh4OVJXSHBEK2FUYklSejF3ODByaGV4NmFM?=
 =?utf-8?B?YngrVzkrNnJCZDhBMWQ2U3lKdjBXNTFmRHpLOUovcEF6VjM4bFYrWm1tMERn?=
 =?utf-8?B?Ky81SUdnVmFpWWk0VGV3WWNTbVJGR1R3K3JnYWViSHJGalFkNjZEMUNwN2hC?=
 =?utf-8?B?QzY4d2xCNzFMVytVK01McUlaektaZzU4OXp4dWRXdmx5Njk1d1d5Z01HVkFW?=
 =?utf-8?B?VlNidCs2dVpmUWJNbXcrWGkvbXlka1o0Z1p0Vk1GSVByUy9kaExTSThwaCtU?=
 =?utf-8?B?OTIxNVNyazZaSTRiSnQ3dWRpemllWnFHa0lJLzYxMFoxZ0Y0V3J3eG9oUzVU?=
 =?utf-8?B?SmZicENQOWY1R0MzSG1QSTRlYU1oL05lN1JyTWNoZkg4RnZqaVVWazUyOHNr?=
 =?utf-8?B?TVR1bWFMakdlRXBFbTUrRmZ5cWxXY0Jaai9mWi9oQXYzbVFHU3phazBhcXZi?=
 =?utf-8?B?aFpxNVJUVDF5VzQ4TWY5dlNkQUNwQk5zNVo1aHB2eUo5RkhXaDFZWXV2d1o3?=
 =?utf-8?B?VmZhVit3ZjZLNlRQemRmL2lQditpUDAyQklBQVRvTjJRdGxYbWtKb1hidFpx?=
 =?utf-8?B?aXdtL09PQUxaaU1VbUFRbCthNVM2K0tYelIzcGpQcGgvbFNEMkZKR1RoMElU?=
 =?utf-8?B?U0RwZGFxMXpEaEJLdVluSzI3K1duR2JsVkRZSGtlN2E5OW9YbTNtTmdBNVNO?=
 =?utf-8?B?amNxejhOWEJWZGNXYzNGN2llNTZicGthUm1KRk1rRDJldmpRdUNad29INUNY?=
 =?utf-8?B?YUF1RHRxaUw0WFA2VmZnKzZBbHpLQzA1ZnlLMTNESWxGeWxLOHpzQTRnTUpK?=
 =?utf-8?B?ZUZCTFFNRCtFeXlocXBKVmhyZVBCNkxHV0hYNnh6RmJmb21QOUhPYld2T1M0?=
 =?utf-8?B?T2VJRG1iOWdWdzI4VFlteE1qYWhHWkh0TWIxT1ozeWJ0cGVqR2gvOXNnRUpJ?=
 =?utf-8?B?T2d0Q2htV1Mxd3Bxc3VxZldlbmJTRVUxSDJkQ3VNZGxLL1BSV0Q1RjVwcFB2?=
 =?utf-8?B?TE5JUnhwM0RhcjJsNEdTSTNqWExBejdPMFp2Y0dJTktzV1granQ3VHRhOW1q?=
 =?utf-8?B?RGtoR1FPNjlnL3Z3dVlKQTNkMG85MzhKbW5JT1M0dlloVk1HMUxBWnZTdHMv?=
 =?utf-8?B?NS9MQ2oxQys4aVdGMW9Eb1FWbDRlbWxGYnhZKzEzbU5GMGhJeDV2RisxZ3oz?=
 =?utf-8?B?VzFWZlh3WnlJV2JUZDV2QmZ6MU1laVQyOXRPZTVJYlU3dU9DcjZuV2pQQmFL?=
 =?utf-8?B?ZS9LRlJGRXFUVEVPUkkxNTRHZjAzSE5LWmNudldCMnpVMXpSeE84MkxLTG5M?=
 =?utf-8?B?NnZHdlB1bUV3ZXlGNThYVDNUemcxZ3N4eEo3N1pNb2drQ051Z0RqeHowcFI5?=
 =?utf-8?B?Z1AvMDN2K1VpY1dRQ0NRMDJDU3lneFB6dk0yQjZYUlJTMGdvVXEyZTVZSGVX?=
 =?utf-8?B?eTVvZDJKYzJTOW55cGdlcEFkdFpFSTVFTkp0WVdkelo5Z1JweXVyNXlqWXda?=
 =?utf-8?B?NTdJMHRSTFBCVTJsNDdEaldhR2d4R2tuMlNvMEhJeHJxN1pKSzJjNS9vaE44?=
 =?utf-8?Q?VYV0S2iTstWoYM0yseRZ3kZuvojfaeRNfxUdm4uyCs=3D?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 64761047-8b8a-42cf-7be7-08d99acc8753
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2021 11:09:08.6115
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xwCiKG5l63Cm+9bvGZ0uHt83F+3BZfFoVAw1kGwgDs78y8bvpVXy+BrXNYa+iC+ezjMBeLqFutNnB2SNuPEw0exkaJi0iQvxvGUjzyUbchc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB2676
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 28.10.21 02:39, Adam Ford wrote:
> On Sun, Oct 24, 2021 at 7:16 AM Fabio Estevam <festevam@gmail.com> wrote:
>>
>> Hi Adam,
>>
>> [Adding Frieder on Cc]
>>
>> On Sat, Oct 23, 2021 at 5:35 PM Adam Ford <aford173@gmail.com> wrote:
>>>
>>> The imx8mm appears to have both a CSI bridge and mipi-csi-2 drivers.  With
>>> those enabled, both the imx8mm-evk and imx8mm-beacon boards should be able
>>> use an OV5640 camera.
>>>
>>> The mipi-csi2 driver sets the clock frequency to 333MHz, so the clock parent
>>> of the CSI1 must be reparented to a faster clock.  On the custom NXP kernel,
>>> they use IMX8MM_SYS_PLL2_1000M, so that is done in the device tree to match.
>>>
>>> With the CSI and mipi_csi2 drivers pointing to an OV5640 camera, the media
>>> pipeline can be configured with the following:
>>>
>>>     media-ctl --links "'ov5640 1-003c':0->'imx7-mipi-csis.0':0[1]"
>>>
>>> The camera and various nodes in the pipeline can be configured for UYVY:
>>>     media-ctl -v -V "'ov5640 1-003c':0 [fmt:UYVY8_1X16/640x480 field:none]"
>>>     media-ctl -v -V "'csi':0 [fmt:UYVY8_1X16/640x480 field:none]"
>>>
>>> With that, the media pipeline looks like:
>>>
>>>
>>> Media controller API version 5.15.0
>>>
>>> Media device information
>>> ------------------------
>>> driver          imx7-csi
>>> model           imx-media
>>> serial
>>> bus info        platform:32e20000.csi
>>> hw revision     0x0
>>> driver version  5.15.0
>>>
>>> Device topology
>>> - entity 1: csi (2 pads, 2 links)
>>>             type V4L2 subdev subtype Unknown flags 0
>>>             device node name /dev/v4l-subdev0
>>>         pad0: Sink
>>>                 [fmt:UYVY8_1X16/640x480 field:none colorspace:srgb xfer:srgb ycbcr:601 quantization:lim-range]
>>>                 <- "imx7-mipi-csis.0":1 [ENABLED,IMMUTABLE]
>>>         pad1: Source
>>>                 [fmt:UYVY8_1X16/640x480 field:none colorspace:srgb xfer:srgb ycbcr:601 quantization:lim-range]
>>>                 -> "csi capture":0 [ENABLED,IMMUTABLE]
>>>
>>> - entity 4: csi capture (1 pad, 1 link)
>>>             type Node subtype V4L flags 0
>>>             device node name /dev/video0
>>>         pad0: Sink
>>>                 <- "csi":1 [ENABLED,IMMUTABLE]
>>>
>>> - entity 10: imx7-mipi-csis.0 (2 pads, 2 links)
>>>              type V4L2 subdev subtype Unknown flags 0
>>>              device node name /dev/v4l-subdev1
>>>         pad0: Sink
>>>                 [fmt:UYVY8_1X16/640x480 field:none colorspace:smpte170m xfer:709 ycbcr:601 quantization:lim-range]
>>>                 <- "ov5640 1-003c":0 [ENABLED]
>>>         pad1: Source
>>>                 [fmt:UYVY8_1X16/640x480 field:none colorspace:smpte170m xfer:709 ycbcr:601 quantization:lim-range]
>>>                 -> "csi":0 [ENABLED,IMMUTABLE]
>>>
>>> - entity 15: ov5640 1-003c (1 pad, 1 link)
>>>              type V4L2 subdev subtype Sensor flags 0
>>>              device node name /dev/v4l-subdev2
>>>         pad0: Source
>>>                 [fmt:UYVY8_1X16/640x480@1/30 field:none colorspace:srgb xfer:srgb ycbcr:601 quantization:full-range]
>>>                 -> "imx7-mipi-csis.0":0 [ENABLED]
>>>
>>> When configured, gstreamer can be used to capture 1 frame and store it to a file.
>>>
>>> gst-launch-1.0 -v v4l2src num-buffers=1 ! video/x-raw,format=UYVY,width=640,height=480,framerate=60/1 ! filesink location=test
>>>
>>> Unfortunately, the video capture never appears to happen.  No errors occur, not
>>> interrupts are recorded and no errors are recorded.
>>>
>>> gst-launch-1.0 -v v4l2src num-buffers=1 ! video/x-raw,format=UYVY,width=640,height=480,framerate=60/1 ! filesink location=test
>>> Setting pipeline to PAUSED ...
>>> Pipeline is live and does not need PREROLL ...
>>> Pipeline is PREROLLED ...
>>> Setting pipeline to [  114.819632] v4l2_get_link_freq: Link frequency estimated using pixel rate: result might be inaccurate
>>> PLAYING ...
>>> New clock: GstSystem[  114.829203] v4l2_get_link_freq: Consider implementing support for V4L2_CID_LINK_FREQ in the transmitter driver
>>> Clock
>>> /GstPipeline:pipeline0/GstV4l2Src:v4l2src0.GstPad:src: caps = video/x-raw, format=(string)UYVY, width=(int)640, height=(int)480, framerate=(fraction)60/1, interlace-mode=(string)progressive, colorimetry=(string)bt709
>>> /GstPipeline:pipeline0/GstCapsFilter:capsfilter0.GstPad:src: caps = video/x-raw, format=(string)UYVY, width=(int)640, height=(int)480, framerate=(fraction)60/1, interlace-mode=(string)progressive, colorimetry=(string)bt709
>>> /GstPipeline:pipeline0/GstFileSink:filesink0.GstPad:sink: caps = video/x-raw, format=(string)UYVY, width=(int)640, height=(int)480, framerate=(fraction)60/1, interlace-mode=(string)progressive, colorimetry=(string)bt709
>>> /GstPipeline:pipeline0/GstCapsFilter:capsfilter0.GstPad:sink: caps = video/x-raw, format=(string)UYVY, width=(int)640, height=(int)480, framerate=(fraction)60/1, interlace-mode=(string)progressive, colorimetry=(string)bt709
>>>
>>>
>>> If anyone has any insight as to what might be wrong, I'd like feedback.
>>> I posted a device tree that I beleive goes with the newer imx8mm-evk, but
>>> I do not have this hardware, so I cannot test it.
>>
>> It seems that Frieder on Cc managed to get camera capture to work on
>> i.MX8MM here:
>> https://eur04.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kontron-electronics.de%2Fsw%2Fmisc%2Flinux%2F-%2Fcommits%2Fv5.10-mx8mm-csi&amp;data=04%7C01%7Cfrieder.schrempf%40kontron.de%7Cfe4f7347385f4185b1c608d999ab75b5%7C8c9d3c973fd941c8a2b1646f3942daf1%7C0%7C0%7C637709783979195945%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=PbGqhzb2mbUA2SD44%2BosK8rNkK12m1LRd6W4tvkawno%3D&amp;reserved=0
>>
>> Hopefully, this can help to figure out what is missing in mainline to
>> get camera capture to work on i.MX8M.
>>
>> I don't have access to an OV5640 camera to connect to the imx8mm-evk
>> board to try your series.
> 
> Fabio,
> 
> Thanks for the heads up on that repo.  I was able to use that repo and
> get still images to capture on an OV5640, but I noticed a fair amount
> of differences between that repo and what's found in linux-next.
> 
> Laurent,
> 
> I haven't exhausted the patch differences, but I found at least a few
> that appear to be missiing upstream, and I am curious to know if/what
> your opinion is on whether or not they're needed, since the patches on
> Frieder's repo appear to come from you.
> [1] - media: imx: imx7-media-csi: Add i.MX8MM identification
> [2] - media: imx: imx7_mipi_csis: Don't set reserved CLK_CTRL field on i.MX8MM
> [3] - media: imx: imx7_mipi_csis: Set dual pixel mode for RAW formats
> 
> media: imx: imx7_mipi_csis: Set dual pixel mode for RAW formats
> 
> Maybe these don't need to be applied, but they are 'some' of the
> differences that I see between this 5.10 branch and linux-next .  I
> know there are more, but
> 
> 
> [1] - https://eur04.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kontron-electronics.de%2Fsw%2Fmisc%2Flinux%2F-%2Fcommit%2F8ac7ec6db0c260a871038721886dbdb6660ed84c&amp;data=04%7C01%7Cfrieder.schrempf%40kontron.de%7Cfe4f7347385f4185b1c608d999ab75b5%7C8c9d3c973fd941c8a2b1646f3942daf1%7C0%7C0%7C637709783979195945%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=j1iuXWljDd8wA5M44KwLCb%2F21tpdOnKZuJazl25bXbQ%3D&amp;reserved=0
> [2] - https://eur04.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kontron-electronics.de%2Fsw%2Fmisc%2Flinux%2F-%2Fcommit%2F0b5727c8eba8c370f7db5eace0243f78992a4dbb&amp;data=04%7C01%7Cfrieder.schrempf%40kontron.de%7Cfe4f7347385f4185b1c608d999ab75b5%7C8c9d3c973fd941c8a2b1646f3942daf1%7C0%7C0%7C637709783979205943%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=buWbZF0tYfVmibQgBbKJM1PF%2Fw7%2BVO9jhXRCI1zf7TI%3D&amp;reserved=0
> [3] - https://eur04.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kontron-electronics.de%2Fsw%2Fmisc%2Flinux%2F-%2Fcommit%2F14befa6bc146b10092a6ac5d0ed4d42c87c6cf27&amp;data=04%7C01%7Cfrieder.schrempf%40kontron.de%7Cfe4f7347385f4185b1c608d999ab75b5%7C8c9d3c973fd941c8a2b1646f3942daf1%7C0%7C0%7C637709783979205943%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=60iLhs0G0FtQegNp9XtVxAhvZEcltdAGGMNAm2l1cSs%3D&amp;reserved=0
> 
> Frieder et al,
> 
> Have you (or anyone) tried CSI cameras on anything newer than 5.10?  I
> am curious to see if a regression popped in somewhere, but git bisect
> will make this difficult since there is a fair amount of variation
> between this custom repo and the upstream.

No, I haven't done anything with CSI on a more recent kernel. And I only
used CSI with the tree above and the ADV7280M bridge. I don't have any
hardware with a sensor/camera.

In case you haven't seen this already, here is a thread with some notes
about my testing results:
https://patchwork.kernel.org/project/linux-media/cover/20210215042741.28850-1-laurent.pinchart@ideasonboard.com/.
