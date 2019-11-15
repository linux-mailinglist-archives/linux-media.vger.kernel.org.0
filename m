Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0DC7FD7CC
	for <lists+linux-media@lfdr.de>; Fri, 15 Nov 2019 09:16:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726988AbfKOIQ1 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Fri, 15 Nov 2019 03:16:27 -0500
Received: from mail-oln040092070040.outbound.protection.outlook.com ([40.92.70.40]:36747
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725829AbfKOIQ1 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Nov 2019 03:16:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eRTELI7r/m3eohKJt0iCMPfOG2Mvo1lucsUdJz+GToZRR881iWNNLjLB+FnJVg63hyYzt+23H9VAewUCwCJQFigHG1gPDuAXi0g2dWPoNAzC4mVJ3LyCVKN36JCW21M9xgbtNxZZbf7SdBF4jRl5ZSlca2IzTJTr4eMSCbGsGfTPv76IsNQ7ea58VLVIoe1FUK52LDb/eD3TDWsOcrcyaSE+BjxH3O0yG+iQfn1DE+QW8+Pd+g5lBPT86ZN67QA8eOWp6pfJYfX4Yn3URBVfNnH1DYVMLKVrCKWuK7+xUxT4eTHxsim8N3cRI1JlldlwtDxy7XgdLCTRmqjpsUnnkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+E82gm9DS2wgN35DgM2Zpv6KtUd5ueVqPIeSl/1RJO8=;
 b=WqYK3SM7kYHUV/GlJrtmCuKM1jWPkNvfn/MvHd9s7SXQBck3CU+1QsUpwe0ItZmnWaUGzQvXH60mq3DnbSXTHefd7DS7ItmfntezIy38dz/OVoGd5G7lzMVEXF6wD4Qt979J3UUX8pRCwAl+ek5UvXD9vAyctG5k+JKB/v1mEj85Dlt5Qh4lBcNGkBt6ibf5OPMUcxAHqnvFMHlF59OOwt5HAiamY19l0ugOoR+vdhNGfAfZQGJ7YC0hbluiwmm1A0kje8b3GOB3P1LRDO5wPadf+Dv1GaghQMmvpszwR72tV4Og7uXQN/ItCWb9JvGkvybPGGG/ezLZFt5YKbzwUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DB5EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (10.152.20.58) by DB5EUR03HT038.eop-EUR03.prod.protection.outlook.com
 (10.152.21.220) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2451.23; Fri, 15 Nov
 2019 08:15:44 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com (10.152.20.57) by
 DB5EUR03FT054.mail.protection.outlook.com (10.152.20.248) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2451.23 via Frontend Transport; Fri, 15 Nov 2019 08:15:44 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::a1a9:f639:5cc7:341a]) by HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::a1a9:f639:5cc7:341a%7]) with mapi id 15.20.2451.027; Fri, 15 Nov 2019
 08:15:44 +0000
From:   Jonas Karlman <jonas@kwiboo.se>
To:     Boris Brezillon <boris.brezillon@collabora.com>
CC:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Tomasz Figa <tfiga@chromium.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [RFC v2 09/10] media: uapi: h264: Add DPB entry field reference
 flags
Thread-Topic: [RFC v2 09/10] media: uapi: h264: Add DPB entry field reference
 flags
Thread-Index: AQHVjffSYHfHedHWTUmVsr71xfoXj6d0jdMAgBdRlICAABYNAIAACFoA
Date:   Fri, 15 Nov 2019 08:15:43 +0000
Message-ID: <HE1PR06MB401140B28C855465E0784BA0AC700@HE1PR06MB4011.eurprd06.prod.outlook.com>
References: <HE1PR06MB401108289F09802C261374F8AC610@HE1PR06MB4011.eurprd06.prod.outlook.com>
 <20191029012550.24628-1-jonas@kwiboo.se>
 <HE1PR06MB401142C1E45B302094AD1149AC610@HE1PR06MB4011.eurprd06.prod.outlook.com>
 <20191031112056.3442d6ac@collabora.com>
 <HE1PR06MB401159909AF49930BDD02658AC700@HE1PR06MB4011.eurprd06.prod.outlook.com>
 <20191115084548.45ea5b8d@collabora.com>
In-Reply-To: <20191115084548.45ea5b8d@collabora.com>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: FRYP281CA0007.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::17)
 To HE1PR06MB4011.eurprd06.prod.outlook.com (2603:10a6:7:9c::32)
x-incomingtopheadermarker: OriginalChecksum:A69FEDB935310FFAA187E8184C4772A5A0443E30874FE953F7CC5BA032AFD443;UpperCasedChecksum:94CD761C5F8FD6FE14A119E31F3A2692157970905359D09DEECE92479A2CB817;SizeAsReceived:7908;Count:49
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn:  [tu8BTUuXxzw2k5Y+lheMxTxCrfqGrZHI]
x-microsoft-original-message-id: <4bd2e986-1488-5626-6e7e-5f98a1b331c0@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 49
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: cda60a12-e31f-4618-3a3c-08d769a4029d
x-ms-traffictypediagnostic: DB5EUR03HT038:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6DVXUr7YOK6AB06PD6ljtQo5ll96iklCEs2js+AYf1S+F0Zi1HtP7F7gLp7oQxwOdztu5UK8MvN3L1FayG1KPMxMv7fminOEhLLYc8/rgpTveZdG2BXlcJzWrwkTiTunyJm5p2Rkp5yRgfACAS5z7QxznIUwQ2TM4tDq0BC+B9HisV9dbiIgVBSx1T3PhoFt
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <313C5CA616C5E74D89B1BEB6343A934C@eurprd06.prod.outlook.com>
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: cda60a12-e31f-4618-3a3c-08d769a4029d
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2019 08:15:44.0063
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5EUR03HT038
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2019-11-15 08:45, Boris Brezillon wrote:
> On Fri, 15 Nov 2019 06:26:54 +0000
> Jonas Karlman <jonas@kwiboo.se> wrote:
>
>> On 2019-10-31 11:20, Boris Brezillon wrote:
>>> On Tue, 29 Oct 2019 01:26:01 +0000
>>> Jonas Karlman <jonas@kwiboo.se> wrote:
>>>  
>>>> Add DPB entry flags to help indicate when a reference frame is a field picture
>>>> and how the DPB entry is referenced, top or bottom field or full frame.
>>>>
>>>> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
>>>> ---
>>>>  Documentation/media/uapi/v4l/ext-ctrls-codec.rst | 12 ++++++++++++
>>>>  include/media/h264-ctrls.h                       |  4 ++++
>>>>  2 files changed, 16 insertions(+)
>>>>
>>>> diff --git a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
>>>> index 28313c0f4e7c..d472a54d1c4d 100644
>>>> --- a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
>>>> +++ b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
>>>> @@ -2028,6 +2028,18 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>>>>      * - ``V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM``
>>>>        - 0x00000004
>>>>        - The DPB entry is a long term reference frame
>>>> +    * - ``V4L2_H264_DPB_ENTRY_FLAG_FIELD_PICTURE``
>>>> +      - 0x00000008
>>>> +      - The DPB entry is a field picture
>>>> +    * - ``V4L2_H264_DPB_ENTRY_FLAG_REF_TOP``
>>>> +      - 0x00000010
>>>> +      - The DPB entry is a top field reference
>>>> +    * - ``V4L2_H264_DPB_ENTRY_FLAG_REF_BOTTOM``
>>>> +      - 0x00000020
>>>> +      - The DPB entry is a bottom field reference
>>>> +    * - ``V4L2_H264_DPB_ENTRY_FLAG_REF_FRAME``
>>>> +      - 0x00000030
>>>> +      - The DPB entry is a reference frame
>>>>  
>>>>  ``V4L2_CID_MPEG_VIDEO_H264_DECODE_MODE (enum)``
>>>>      Specifies the decoding mode to use. Currently exposes slice-based and
>>>> diff --git a/include/media/h264-ctrls.h b/include/media/h264-ctrls.h
>>>> index e877bf1d537c..76020ebd1e6c 100644
>>>> --- a/include/media/h264-ctrls.h
>>>> +++ b/include/media/h264-ctrls.h
>>>> @@ -185,6 +185,10 @@ struct v4l2_ctrl_h264_slice_params {
>>>>  #define V4L2_H264_DPB_ENTRY_FLAG_VALID		0x01
>>>>  #define V4L2_H264_DPB_ENTRY_FLAG_ACTIVE		0x02
>>>>  #define V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM	0x04
>>>> +#define V4L2_H264_DPB_ENTRY_FLAG_FIELD_PICTURE	0x08
>>>> +#define V4L2_H264_DPB_ENTRY_FLAG_REF_TOP	0x10
>>>> +#define V4L2_H264_DPB_ENTRY_FLAG_REF_BOTTOM	0x20
>>>> +#define V4L2_H264_DPB_ENTRY_FLAG_REF_FRAME	0x30  
>>> I don't remember all the details, but do we really need 3 flags?
>>> Maybe I'm wrong, but it looks like the following combination doesn't
>>> make sense:
>>>
>>> - FIELD_PICTURE + REF_FRAME: if it's a full frame ref it should
>>>   contain both top and bottom fields right, so it's no longer a
>>>   FIELD_PICTURE, is it?
>>>
>>> Can't we just have 2 flags?
>>>
>>> FIELD_PICTURE		0x08
>>> FIELD_REF_TOP		0x10 (meaning that FIELD_REF_BOTTOM is
>>> 			      0x00)
>>>
>>> and then have the following combinations:
>>>
>>> top field ref => FIELD_PICTURE | FIELD_REF_TOP
>>> bottom field ref => FIELD_PICTURE
>>> full frame ref => 0x0  
>> I am not sure and will need to look closer at spec and what ffmpeg is doing.
>> These flags was mostly inspired by the information ffmpeg stores in
>> H264Picture->reference and H264Picture->field_picture.
>>
>> I also believe that the new FLAG_REF_TOP/BOTTOM may make FLAG_ACTIVE obsolete.
>>
>> active => flags & FLAG_REF_FRAME
> Can't we keep the ACTIVE flag and drop the REF_FRAME one then? AFAIU,
> all we need to know in addition to what we already have is:
>
> * is the reference a full-frame or a field?
> * if it is a field, which one (top or bottom)?
>
> Hence my suggestion to keep only 2 flags.

I think we also need to know if the reference frame was a field or a full-frame picture
not just how it is referenced, I think there was an issue when I originally tried a similar
approach as you suggested, but it was too long time ago as I seem to have forgotten the details.

Will do more testing and see if I can refresh my memory.

Best regards,
Jonas
