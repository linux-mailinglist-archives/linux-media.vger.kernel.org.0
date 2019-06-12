Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9073841EC6
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2019 10:15:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730387AbfFLIOj convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 12 Jun 2019 04:14:39 -0400
Received: from mail-oln040092070048.outbound.protection.outlook.com ([40.92.70.48]:16115
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726964AbfFLIOj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jun 2019 04:14:39 -0400
Received: from AM5EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (10.152.16.57) by AM5EUR03HT204.eop-EUR03.prod.protection.outlook.com
 (10.152.17.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1987.11; Wed, 12 Jun
 2019 08:14:35 +0000
Received: from VI1PR03MB4206.eurprd03.prod.outlook.com (10.152.16.58) by
 AM5EUR03FT043.mail.protection.outlook.com (10.152.17.43) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1987.11 via Frontend Transport; Wed, 12 Jun 2019 08:14:35 +0000
Received: from VI1PR03MB4206.eurprd03.prod.outlook.com
 ([fe80::fdae:4944:7c73:c26a]) by VI1PR03MB4206.eurprd03.prod.outlook.com
 ([fe80::fdae:4944:7c73:c26a%6]) with mapi id 15.20.1965.017; Wed, 12 Jun 2019
 08:14:35 +0000
From:   Jonas Karlman <jonas@kwiboo.se>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [PATCH v4 01/10] rockchip/vpu: rename from rockchip to hantro
Thread-Topic: [PATCH v4 01/10] rockchip/vpu: rename from rockchip to hantro
Thread-Index: AQHVIFRbGoCHsJf8IkGLeTHhG1rCtqaXrRCA
Date:   Wed, 12 Jun 2019 08:14:35 +0000
Message-ID: <VI1PR03MB4206D849E9815A7704D175DBACEC0@VI1PR03MB4206.eurprd03.prod.outlook.com>
References: <20190611125058.13470-1-p.zabel@pengutronix.de>
 <20190611125058.13470-2-p.zabel@pengutronix.de>
In-Reply-To: <20190611125058.13470-2-p.zabel@pengutronix.de>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR05CA0330.eurprd05.prod.outlook.com
 (2603:10a6:7:92::25) To VI1PR03MB4206.eurprd03.prod.outlook.com
 (2603:10a6:803:51::23)
x-incomingtopheadermarker: OriginalChecksum:F077A972336752237EA7D711791E507884C3CEB2DC857673B74F76420D506E2B;UpperCasedChecksum:815F9DBF105655533DBE57BAB14E8874D8EFD7380F44F790A6E9ED05F6488A20;SizeAsReceived:7805;Count:49
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn:  [jH4/czjv7aUOVPjARuTfuYSr8CGfbRmH]
x-microsoft-original-message-id: <188f6a9c-10bc-31a5-9211-eac76bbd6a0c@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 49
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(5050001)(7020095)(20181119110)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031322404)(2017031323274)(2017031324274)(1601125500)(1603101475)(1701031045);SRVR:AM5EUR03HT204;
x-ms-traffictypediagnostic: AM5EUR03HT204:
x-microsoft-antispam-message-info: Q/Ezrjg7q/mVcCNLQoGXsK2bZWKXerHJynuXrtRgl5M+bHCGvHvp2r9NBrzMFF4OyvVZsyFLlCv0DUv2GAqfOFSEdamQBEBDDmo0hShpxhsyPp3bUvjGQp7ws/egR+FcgVxsTY0hzWcNdZZ9aQ6XmD8LlUzPD/rhehXmtz9qIutTXeOWzbXpHqZamQim5J+G
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <F606E14485471A42A1448980D7AB16B7@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aff9dc2-68b0-4cb7-7fce-08d6ef0e0161
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2019 08:14:35.5888
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5EUR03HT204
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2019-06-11 14:50, Philipp Zabel wrote:
> Rename the driver and all relevant identifiers from Rockchip to Hantro,
> as other Hantro IP based VPU implementations can be supported by the
> same driver.
> The RK3288 decoder is Hantro G1 based, the encoder is Hantro H1.

The RK3288 has two VPU blocks that is described as a VPU combo in the datasheet,
VPU1 (the G1) and a HEVC decoder (not sharing the Hantro G2 hw regs).
Similarly the RK3399 has two VPU blocks, VPU2 based on G1 but with regs/fields re-ranged
and the RKVDPU (new generation of the HEVC block found in RK3288).

How can we expose these secondary blocks once rockchip vpu driver has transitioned
into a hantro driver? Should a new rockchip vpu driver be created for the HEVC/RKVDEC blocks?

Regards,
Jonas

>
> This patch just renames, no functional changes.
>
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
> Changes since v3 [1]:
>  - Split rk3288_vpu_regs.h into hantro_g1_regs.h and hantro_h1_regs.h,
>    rename VDPU register defines to G1 and VEPU register defines to H1.
>  - Make Rockchip support configurable.
>  - Keep staging/media Kconfig in alphabetic order.
>
[snip]
