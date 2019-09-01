Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E17BDA4953
	for <lists+linux-media@lfdr.de>; Sun,  1 Sep 2019 14:43:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728639AbfIAMmn convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Sun, 1 Sep 2019 08:42:43 -0400
Received: from mail-oln040092066099.outbound.protection.outlook.com ([40.92.66.99]:25667
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728552AbfIAMmm (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 1 Sep 2019 08:42:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jnkDoGbOiLE2qYg5gXIeThcVZohkw3lGTvhz1PSyyGjGEFFnI1WbuSQ2zVJNtTHt25Yf7jua2mdnUe1Kxil2VPX9rT7HfgWr3uSAW3I4TJKuIBeDDdvviCavTQhOb5GaDGDgE3HO6Ta9TkNcp1lD6+3YxK/G5pYfPp4bu+4Jguv0dM+fZFxkQJQyuTCUQ+9K4N8bOOvLj0/EsHnAWmHzxq5TBkAiyZrGWtaO4p0uOHMDk3cbAWjCJ9gc9a3rvuHiSYulElpL6QeTpTqeGTcu6CgRUTQ5cO7sy4C/eMpDLlJzIKl97jmCFP7quVdvVcIdaGG4oPw4ZAwT4fSQ+Od9AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ITTUGBEC6vuk6g7mp7xWMIQ1rcw343w+qmGi/CSXN4=;
 b=A/Um0Sx3rT7R+NH/jMMDQ9i4at92DHAYtc+CULvek6i1W0VYU905Dv10N46TJx126Cj9GewHfxABY0x/kOt+t7Uw2TCsnbNaBF479p454SgnoI5CWywj1d1U4mJ2uH32VI96sGfa1LO1djzfG3YHcuMSFX7wzs43H3httFk25otCt/2Mr22eZbzIyDJhEYLwuCZB5krjwK5hzRN0q4gp5V5zqL8kALfA2khscFgF6wb75iKb7OxCqKXRihG7H1bxyvOYuiqS2Iurdq7u0xDnMi66xKZ8N15XlExN+UY23+hW26+IqvPi5RpOab19QPImS6nm5WU0XgaJxTp1NQEmCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from HE1EUR01FT057.eop-EUR01.prod.protection.outlook.com
 (10.152.0.60) by HE1EUR01HT143.eop-EUR01.prod.protection.outlook.com
 (10.152.1.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2220.16; Sun, 1 Sep
 2019 12:42:36 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com (10.152.0.52) by
 HE1EUR01FT057.mail.protection.outlook.com (10.152.0.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.16 via Frontend Transport; Sun, 1 Sep 2019 12:42:36 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::a0ba:e766:2a23:2088]) by HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::a0ba:e766:2a23:2088%3]) with mapi id 15.20.2199.021; Sun, 1 Sep 2019
 12:42:36 +0000
From:   Jonas Karlman <jonas@kwiboo.se>
To:     Ezequiel Garcia <ezequiel@collabora.com>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-rockchip@lists.infradead.org" 
        <linux-rockchip@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH RFC 00/12] media: hantro: H264 fixes and improvements
Thread-Topic: [PATCH RFC 00/12] media: hantro: H264 fixes and improvements
Thread-Index: AQHVYMK7ybJvfQx/EkSu6izc1mlMgw==
Date:   Sun, 1 Sep 2019 12:42:35 +0000
Message-ID: <HE1PR06MB40117D0EE96E6FA638A04B78ACBF0@HE1PR06MB4011.eurprd06.prod.outlook.com>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR0401CA0044.eurprd04.prod.outlook.com
 (2603:10a6:3:19::12) To HE1PR06MB4011.eurprd06.prod.outlook.com
 (2603:10a6:7:9c::32)
x-incomingtopheadermarker: OriginalChecksum:606DA59343B34EFEF8CB182B89E40F4A881915CACA35D383DD78BD24CA3E6686;UpperCasedChecksum:C161D1087CE68C10B779ECF33C07EB2BEA2C8B74F490B7E2BE85456961E50778;SizeAsReceived:7824;Count:48
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-tmn:  [g+/LAtbl95M1BjUcmQx3COL8wA0E5cH9]
x-microsoft-original-message-id: <20190901124220.23568-1-jonas@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 48
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(5050001)(7020095)(20181119158)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031322404)(2017031323274)(2017031324274)(1601125500)(1603101475)(1603102475)(1701031045);SRVR:HE1EUR01HT143;
x-ms-traffictypediagnostic: HE1EUR01HT143:
x-ms-exchange-purlcount: 4
x-microsoft-antispam-message-info: MVD3DMTecQzPPjiEoJEGD+paIuZ71esNAB4okw3gkb4Yj8A+OYvxD4dhUpp6NUX/vAYs7VpYcdcn7WNGdmpGUrnbUcVkeIxRQLZTV+MeelGO2pOz798vs5iJhKmecvAyAA1ocg4wytYSfqN5LeHXHsNy0jcHBi/85t8/An+SqxS0D5kdJvgslNDfqLNvnT6X
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 2db92e7f-9b8f-4b2b-834b-08d72ed9dd74
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2019 12:42:35.8942
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1EUR01HT143
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series contains fixes and improvements for the hantro H264 decoder.

Patch 1-6 fixes issues and limitations observed when preparing support
for field encoded content.

Patch 7 introduce new DPB entry flags that is used to signal how a reference
frame is referenced. This information is needed to correctly build a
reference list for field encoded content.

Patch 8 adds bits to handle field encoded content, this is a rough patch
and should be reworked with proper code style and formatting.
Please get back with feedback on how to improve this.

The following samples from [1] are now playable with patch 1-8
- H264_1080i-25-interlace_Kaesescheibchen.mkv
- H264_10_1080i_50_AC3-Astra19.2_ProSieben_HD.ts
- big_buck_bunny_1080p_H264_AAC_25fps_7200K.mp4
- h264_tivo_sample.ts

The rest of the patches refactors G1 H264 code to more closely match
the code generated by my rockchip-vpu-regtool at [2] and then adds
support for H264 decoding on RK3399/RK3328 using the VPU2 block.
This code is early work and needs proper code style and formatting,
I just wanted to share the early work and get some initial feedback.

This series has been tested using ffmpeg v4l2 request hwaccel at [3] [4]

[1] http://kwiboo.libreelec.tv/test/samples/
[2] https://github.com/Kwiboo/rockchip-vpu-regtool
[3] https://github.com/Kwiboo/FFmpeg/commits/v4l2-request-hwaccel-4.0.4
[4] https://github.com/Kwiboo/FFmpeg/compare/4.0.4-Leia-18.4...45df99d31062e068073cf899dce559e334c9127f

Regards,
Jonas

Jonas Karlman (12):
  media: hantro: Fix H264 max frmsize supported on RK3288
  media: hantro: Do not reorder H264 scaling list
  media: hantro: Fix H264 motion vector buffer offset
  media: hantro: Reduce H264 extra space for motion vectors
  media: hantro: Remove now unused H264 pic_size
  media: hantro: Set H264 FIELDPIC_FLAG_E flag correctly
  media: uapi: h264: Add DPB entry field reference flags
  media: hantro: Fix H264 decoding of field encoded content
  media: hantro: Refactor G1 H264 code
  media: hantro: Add support for H264 decoding on RK3399
  media: hantro: Enable H264 decoding on RK3399
  media: hantro: Enable H264 decoding on RK3328

 .../media/uapi/v4l/ext-ctrls-codec.rst        |  12 +
 drivers/staging/media/hantro/Makefile         |   1 +
 .../staging/media/hantro/hantro_g1_h264_dec.c | 685 +++++++++++-------
 drivers/staging/media/hantro/hantro_h264.c    | 209 +++---
 drivers/staging/media/hantro/hantro_hw.h      |  10 +-
 drivers/staging/media/hantro/hantro_v4l2.c    |   6 +-
 drivers/staging/media/hantro/rk3288_vpu_hw.c  |   4 +-
 drivers/staging/media/hantro/rk3399_vpu_hw.c  |  24 +-
 .../media/hantro/rk3399_vpu_hw_h264_dec.c     | 486 +++++++++++++
 include/media/h264-ctrls.h                    |   4 +
 10 files changed, 1091 insertions(+), 350 deletions(-)
 create mode 100644 drivers/staging/media/hantro/rk3399_vpu_hw_h264_dec.c

-- 
2.17.1

