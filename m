Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2299FD66D
	for <lists+linux-media@lfdr.de>; Fri, 15 Nov 2019 07:27:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727100AbfKOG07 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Fri, 15 Nov 2019 01:26:59 -0500
Received: from mail-oln040092064096.outbound.protection.outlook.com ([40.92.64.96]:13285
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727032AbfKOG07 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Nov 2019 01:26:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ff859bazUDYQWSQDIFNDx/hiDVKBxl3HHm8GzK6nEm8Qroac10vTvzKZcbEbocjQiMNbUVK45cOdcPOqtoE78VQ/E2xghwO6Qh1btRsW3ICcuNQ7aGUv/6VBoy7Nw31lZJbe7rGyPP6F7rd1A4gX/eBsqFA7YnciN2Hu+bE6SxX1lXo/zWODw2xnX+qUZH8y/f111KP59S+kV+p1CzGXLzHOxTTIsk6U//+iVr3GxAFVR0cMf/buP0KUWpNz5pWOB+w45I8iemrzL3VcxZCyN9I6oON2PxraLqlGnTHEWQsd6tBfjCLd01m5ft96EZKxwy6bvylPHplsPKy1R3dI/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=frcb7C0RDKMbAf7g8aEqsSgzK/UKgtgv+EFb7xHl9II=;
 b=XFYPwFMQOqm8A7AHkc8GGZZqrDOld9lNy/FZBX9N5Lyo16VKvSyMqKanoBudsacML7kHk+wXtjxwVL/TvlLIl15vSNc9oSQ7rQTsJjFnIKuOFOWwYTYuC1Ia4Emjqr80UflkOTl1LZnpAl6cuHIMjKmfMHPpuCU/rOO/Y+ToPEeq2K3IpVRjjPDl4FEAB9X2peFRNLQVDp9CxoEWChkTeVeikHsQOeNYHThV352XORjUqeZYJuR9aT8WawonjKVlrkibtzwO8n0+nFRCPlzeyhyizwSbnU7hs+RrQ4Ez4Zi6iadNYE6zbfDojDRqLgYws+CsHpUk1t51UgfA8MLp4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from VE1EUR01FT021.eop-EUR01.prod.protection.outlook.com
 (10.152.2.55) by VE1EUR01HT005.eop-EUR01.prod.protection.outlook.com
 (10.152.2.92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.23; Fri, 15 Nov
 2019 06:26:54 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com (10.152.2.57) by
 VE1EUR01FT021.mail.protection.outlook.com (10.152.2.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.23 via Frontend Transport; Fri, 15 Nov 2019 06:26:54 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::a1a9:f639:5cc7:341a]) by HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::a1a9:f639:5cc7:341a%7]) with mapi id 15.20.2451.027; Fri, 15 Nov 2019
 06:26:54 +0000
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
Thread-Index: AQHVjffSYHfHedHWTUmVsr71xfoXj6d0jdMAgBdRlIA=
Date:   Fri, 15 Nov 2019 06:26:54 +0000
Message-ID: <HE1PR06MB401159909AF49930BDD02658AC700@HE1PR06MB4011.eurprd06.prod.outlook.com>
References: <HE1PR06MB401108289F09802C261374F8AC610@HE1PR06MB4011.eurprd06.prod.outlook.com>
 <20191029012550.24628-1-jonas@kwiboo.se>
 <HE1PR06MB401142C1E45B302094AD1149AC610@HE1PR06MB4011.eurprd06.prod.outlook.com>
 <20191031112056.3442d6ac@collabora.com>
In-Reply-To: <20191031112056.3442d6ac@collabora.com>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR01CA0030.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:69::43) To HE1PR06MB4011.eurprd06.prod.outlook.com
 (2603:10a6:7:9c::32)
x-incomingtopheadermarker: OriginalChecksum:B4DEB051BD9E022A1C2CF71FCE8D33CE3D7A5051E14E74E7BC4B2EB8B554653F;UpperCasedChecksum:9D6CD12D0B5A28FFD96AF77A22641DDD4FA7825D6670E4E651196CE2EE5EFC18;SizeAsReceived:7791;Count:49
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn:  [bgyRkYW7HjqrXO/dff1CaLgYWmP9Bshw]
x-microsoft-original-message-id: <736cb94d-3d57-ec99-ff47-004bfb0dae1b@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 49
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: c916cf51-8e17-4c04-9be8-08d76994ced4
x-ms-traffictypediagnostic: VE1EUR01HT005:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OEDM4qPz/bMdSjvPjl5wVAZvorBm4AosjBi3nhFgKLTWWKz7kTU4UNovEMoThVhyAQMlPjEsjIdJFlEsoaxF+aAZJ1jz1ASCTl87YCG7VSljeHoh6YbogaIp+S9gb8V6k2v4RPjElpfDiuhE7GQu37dt5baCZ0qC06oYZ2p4OCSSD8kgAOZvlR+5tBDe/SlO
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <A6AADD59F80B4E438D18D2659C3057C7@eurprd06.prod.outlook.com>
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: c916cf51-8e17-4c04-9be8-08d76994ced4
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2019 06:26:54.5679
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1EUR01HT005
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2019-10-31 11:20, Boris Brezillon wrote:
> On Tue, 29 Oct 2019 01:26:01 +0000
> Jonas Karlman <jonas@kwiboo.se> wrote:
>
>> Add DPB entry flags to help indicate when a reference frame is a field picture
>> and how the DPB entry is referenced, top or bottom field or full frame.
>>
>> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
>> ---
>>  Documentation/media/uapi/v4l/ext-ctrls-codec.rst | 12 ++++++++++++
>>  include/media/h264-ctrls.h                       |  4 ++++
>>  2 files changed, 16 insertions(+)
>>
>> diff --git a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
>> index 28313c0f4e7c..d472a54d1c4d 100644
>> --- a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
>> +++ b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
>> @@ -2028,6 +2028,18 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>>      * - ``V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM``
>>        - 0x00000004
>>        - The DPB entry is a long term reference frame
>> +    * - ``V4L2_H264_DPB_ENTRY_FLAG_FIELD_PICTURE``
>> +      - 0x00000008
>> +      - The DPB entry is a field picture
>> +    * - ``V4L2_H264_DPB_ENTRY_FLAG_REF_TOP``
>> +      - 0x00000010
>> +      - The DPB entry is a top field reference
>> +    * - ``V4L2_H264_DPB_ENTRY_FLAG_REF_BOTTOM``
>> +      - 0x00000020
>> +      - The DPB entry is a bottom field reference
>> +    * - ``V4L2_H264_DPB_ENTRY_FLAG_REF_FRAME``
>> +      - 0x00000030
>> +      - The DPB entry is a reference frame
>>  
>>  ``V4L2_CID_MPEG_VIDEO_H264_DECODE_MODE (enum)``
>>      Specifies the decoding mode to use. Currently exposes slice-based and
>> diff --git a/include/media/h264-ctrls.h b/include/media/h264-ctrls.h
>> index e877bf1d537c..76020ebd1e6c 100644
>> --- a/include/media/h264-ctrls.h
>> +++ b/include/media/h264-ctrls.h
>> @@ -185,6 +185,10 @@ struct v4l2_ctrl_h264_slice_params {
>>  #define V4L2_H264_DPB_ENTRY_FLAG_VALID		0x01
>>  #define V4L2_H264_DPB_ENTRY_FLAG_ACTIVE		0x02
>>  #define V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM	0x04
>> +#define V4L2_H264_DPB_ENTRY_FLAG_FIELD_PICTURE	0x08
>> +#define V4L2_H264_DPB_ENTRY_FLAG_REF_TOP	0x10
>> +#define V4L2_H264_DPB_ENTRY_FLAG_REF_BOTTOM	0x20
>> +#define V4L2_H264_DPB_ENTRY_FLAG_REF_FRAME	0x30
> I don't remember all the details, but do we really need 3 flags?
> Maybe I'm wrong, but it looks like the following combination doesn't
> make sense:
>
> - FIELD_PICTURE + REF_FRAME: if it's a full frame ref it should
>   contain both top and bottom fields right, so it's no longer a
>   FIELD_PICTURE, is it?
>
> Can't we just have 2 flags?
>
> FIELD_PICTURE		0x08
> FIELD_REF_TOP		0x10 (meaning that FIELD_REF_BOTTOM is
> 			      0x00)
>
> and then have the following combinations:
>
> top field ref => FIELD_PICTURE | FIELD_REF_TOP
> bottom field ref => FIELD_PICTURE
> full frame ref => 0x0

I am not sure and will need to look closer at spec and what ffmpeg is doing.
These flags was mostly inspired by the information ffmpeg stores in
H264Picture->reference and H264Picture->field_picture.

I also believe that the new FLAG_REF_TOP/BOTTOM may make FLAG_ACTIVE obsolete.

active => flags & FLAG_REF_FRAME

Hopefully I will have some time to rework and respin this at the end of next week.

Regards,
Jonas

>
>>  
>>  struct v4l2_h264_dpb_entry {
>>  	__u64 reference_ts;

