Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18552EACFB
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2019 11:00:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727308AbfJaKAw convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Thu, 31 Oct 2019 06:00:52 -0400
Received: from mail-oln040092070081.outbound.protection.outlook.com ([40.92.70.81]:8049
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726193AbfJaKAv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 31 Oct 2019 06:00:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GWOxlO4/+Mbizs4P8UzIqumWD0VcC5VRQDWUrZb0Cv6sYyBwW1X+bEPvIduWIAUX0dlcRjRv4dJoniEJqM0gArkpF+nOMhsBhib0S6uF02QAWn3vlPSeJv85DhasFYj1O5XbY7TYc9vpsqWlhO/kB0QIbEBmKSjaLY89ePu/6W0g/BssZNd4+28m77ss4jtPOyyCrXmKL0JbtKhRkh+jvLtO1EVCXiVjQwF6ZhHu6KT4Joyf9qUQtXOi11kzOPs/gkuC7PNA1yvjDeZs4tewzivV+ZdPIOnNSOOLru9UZ3c58m2O2H1VXive1ypTCYg/+M/Q0IS01CyzVE2VmR63IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yV7PjQS33NG6xY3akHoWKSgsRCn1WY650AP6XfmQcUQ=;
 b=hSf/74ZaLn0gl1SFPpYoYeuvG0fbukdkO+v0V8ReiUeClB8XD+nHmVKi2CjKT/L90ZQdbQoIyKkY7NBwWHAL64I976o5P6QqzHAL7pAfnCHDkL+nXwx98KVIWVTu8Q6ODNWX6OQYCeUWGlc8ehOtHsj14RRnYxeK+t5/p5wsBuzZhH3an99y/RLyct8N3ygOjtJvkpqrpQGhEhM67N3bLwF7kifP5tPpyC6TMeUiYBj1dn1UqBiirmsh6/ULMQSZimQsmcwo5TduQTfCFermtPO3rPShJIrrgZEIVYDs9YYTZ9ZXddT2LLdIrXy9HRT3lv5xfFAF6tB45QwSWJPOdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from AM5EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (10.152.16.58) by AM5EUR03HT034.eop-EUR03.prod.protection.outlook.com
 (10.152.17.171) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2387.20; Thu, 31 Oct
 2019 10:00:48 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com (10.152.16.51) by
 AM5EUR03FT004.mail.protection.outlook.com (10.152.16.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.20 via Frontend Transport; Thu, 31 Oct 2019 10:00:48 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::b1cf:db6f:95fc:84cc]) by HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::b1cf:db6f:95fc:84cc%7]) with mapi id 15.20.2387.025; Thu, 31 Oct 2019
 10:00:48 +0000
From:   Jonas Karlman <jonas@kwiboo.se>
To:     Boris Brezillon <boris.brezillon@collabora.com>
CC:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Tomasz Figa <tfiga@chromium.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 06/10] media: hantro: Use capture buffer width and
 height for H264 decoding
Thread-Topic: [PATCH v2 06/10] media: hantro: Use capture buffer width and
 height for H264 decoding
Thread-Index: AQHVjfeo82jSI9YHWUmKxjQOPPg3vKd0fRcAgAALGYA=
Date:   Thu, 31 Oct 2019 10:00:48 +0000
Message-ID: <HE1PR06MB4011EADF6F3255CA0B7D9B19AC630@HE1PR06MB4011.eurprd06.prod.outlook.com>
References: <HE1PR06MB401108289F09802C261374F8AC610@HE1PR06MB4011.eurprd06.prod.outlook.com>
 <20191029012430.24566-1-jonas@kwiboo.se>
 <HE1PR06MB4011544CF7A6F36EF1CA47EEAC610@HE1PR06MB4011.eurprd06.prod.outlook.com>
 <20191031102102.63afd4e5@collabora.com>
In-Reply-To: <20191031102102.63afd4e5@collabora.com>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR05CA0224.eurprd05.prod.outlook.com
 (2603:10a6:3:fa::24) To HE1PR06MB4011.eurprd06.prod.outlook.com
 (2603:10a6:7:9c::32)
x-incomingtopheadermarker: OriginalChecksum:24617FB651047B4E392F61BC87FE903A39B75A1DEF098597FA5388A482C69E55;UpperCasedChecksum:BC8E3D5E36BAC2749337C6EC26DE2A95D8020DB6F7A8679867AFFEC46F3E38E1;SizeAsReceived:7718;Count:48
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn:  [3ZyUk+a8D+/zyzsJSdc005GWd6YxWab4]
x-microsoft-original-message-id: <ce553d92-9289-30c1-95ed-f138161cb90d@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 48
x-eopattributedmessage: 0
x-ms-traffictypediagnostic: AM5EUR03HT034:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RP7CLCLxkBR4xGn1tJTwrJunTo8jgdE003TbAQGXZR/5cs4XRPonXh2DsTKK8UL21jnJ/BbxmUryLDP8JwSC5mwxYBZClJTLDVvIpX0msx0JvRRoi8l+pIxBGQ08izdspX7nEoDe9uhpIVd/4TQtq4lb1/8utKS0aq+Mr2y983jv4OgbMtnL7/R99094e4mJ
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <409742BC9D7619438DF91852F6556F86@eurprd06.prod.outlook.com>
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 447ba2c4-6ff6-42cb-5a3f-08d75de933dd
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2019 10:00:48.3107
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5EUR03HT034
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2019-10-31 10:21, Boris Brezillon wrote:
> On Tue, 29 Oct 2019 01:24:50 +0000
> Jonas Karlman <jonas@kwiboo.se> wrote:
>
>> Calculations for motion vector buffer offset is based on width and height
>> from the configured capture format, lets use the same values for macroblock
>> width and height hw regs.
>>
>> Fixes: dea0a82f3d22 ("media: hantro: Add support for H264 decoding on G1")
>> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
>> ---
>> Changes in v2:
>>   - new patch split from "media: hantro: Fix H264 motion vector buffer offset"
>> ---
>>  drivers/staging/media/hantro/hantro_g1_h264_dec.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/staging/media/hantro/hantro_g1_h264_dec.c b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
>> index 71bf162eaf73..eeed11366135 100644
>> --- a/drivers/staging/media/hantro/hantro_g1_h264_dec.c
>> +++ b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
>> @@ -51,8 +51,8 @@ static void set_params(struct hantro_ctx *ctx)
>>  	vdpu_write_relaxed(vpu, reg, G1_REG_DEC_CTRL0);
>>  
>>  	/* Decoder control register 1. */
>> -	reg = G1_REG_DEC_CTRL1_PIC_MB_WIDTH(sps->pic_width_in_mbs_minus1 + 1) |
>> -	      G1_REG_DEC_CTRL1_PIC_MB_HEIGHT_P(sps->pic_height_in_map_units_minus1 + 1) |
>> +	reg = G1_REG_DEC_CTRL1_PIC_MB_WIDTH(MB_WIDTH(ctx->dst_fmt.width)) |
>> +	      G1_REG_DEC_CTRL1_PIC_MB_HEIGHT_P(MB_HEIGHT(ctx->dst_fmt.height)) |
> I'm just curious, do they differ in practice? Also not sure what's been
> decided for the "G1 post-proc", but if the dst/capture format res set
> by the user is the scaled res (PP can scale IIRC), then you probably
> shouldn't use those values here.

You are correct, I wanted to use the same source for both size and offsets, looking at this again
both here and where is it used for offsets this probably need to change.

Do you think we can use src_fmt.width/height for size and offsets? It looks like that is what cedrus is using.

Regards,
Jonas

>
>>  	      G1_REG_DEC_CTRL1_REF_FRAMES(sps->max_num_ref_frames);
>>  	vdpu_write_relaxed(vpu, reg, G1_REG_DEC_CTRL1);
>>  
>>
