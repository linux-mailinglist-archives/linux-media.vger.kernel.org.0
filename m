Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17F5BE7DDD
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2019 02:23:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728247AbfJ2BXb convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 28 Oct 2019 21:23:31 -0400
Received: from mail-oln040092066067.outbound.protection.outlook.com ([40.92.66.67]:11566
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727778AbfJ2BXb (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Oct 2019 21:23:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NMVTeyvHZIsImwo02/6U7jPctBg7+o7I2druAlh5bBHDoroCdiKbhmuO88Y4x5C70rNQBRx0nO7bb3BnyQbQhFXKgwb0Pzu2Nc8xlxlK4ach5PLsRMicIUAHyH6V2fk3Qb7tTUTt9U/clZwekKIMg2j0+6mmB1iKdoofqF88eS5mLrbvT2pO7nOlLPAkXgtFElt4lZdtvhEjFPj+TO0uDWkxsfqXG+IcJK2snSlnw8DZEU6FEP3LUHZJ63dToaJPhJtfNDZTyH8K2uBe0ekcOLAVK53EJjWHNQq/ujCTEsFEg62zxJWQ3imMRjCbW1pWIeMZGqUze/TzNXqMwZB2qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XffVFpPPDP2pJl7bG9Wy1nJEOsKX05N0vzN1DhypToc=;
 b=F2dEm4jRklRr3YAgKNhG7YTvMU5eEDM9U9TkazOVDh+ZYXwQOtWlOWCMsqJ2SFyGtkFSTg1bpGTL0zqVuXBvfVSMfC7beZrwankX53EZgl/Kl3oByn2fhpNtlmEpBCKBN1Nki9OWb3W5bUP1Sd5JgiuLSDctUyDFxgywsd7092BffTRciQQGpHAN97nVkWZAq/51+in11eQU7Z2+mEUBRdQJby29msDJMHRlfEeLqkSsnT7vE475tUcoLhByFMtM/Z6Ht/fxiy3kisz6GD0wNm8WnqkQwW0zOQdl8A4IKm1PWfgH1KcvDcjw+s2UbpCKHA1EkyRDADjxAhDLQYku5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from VE1EUR01FT039.eop-EUR01.prod.protection.outlook.com
 (10.152.2.55) by VE1EUR01HT015.eop-EUR01.prod.protection.outlook.com
 (10.152.3.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2387.20; Tue, 29 Oct
 2019 01:23:27 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com (10.152.2.56) by
 VE1EUR01FT039.mail.protection.outlook.com (10.152.3.35) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.20 via Frontend Transport; Tue, 29 Oct 2019 01:23:27 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::b1cf:db6f:95fc:84cc]) by HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::b1cf:db6f:95fc:84cc%7]) with mapi id 15.20.2387.025; Tue, 29 Oct 2019
 01:23:27 +0000
From:   Jonas Karlman <jonas@kwiboo.se>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>
CC:     Jonas Karlman <jonas@kwiboo.se>, Hans Verkuil <hverkuil@xs4all.nl>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH RFC v2 00/10] media: hantro: H264 fixes and improvements
Thread-Topic: [PATCH RFC v2 00/10] media: hantro: H264 fixes and improvements
Thread-Index: AQHVjfd3nRnQyPYxpEuxItiFYWopyg==
Date:   Tue, 29 Oct 2019 01:23:27 +0000
Message-ID: <HE1PR06MB401108289F09802C261374F8AC610@HE1PR06MB4011.eurprd06.prod.outlook.com>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR0501CA0035.eurprd05.prod.outlook.com
 (2603:10a6:3:1a::45) To HE1PR06MB4011.eurprd06.prod.outlook.com
 (2603:10a6:7:9c::32)
x-incomingtopheadermarker: OriginalChecksum:F4C6F7AF2937385D03B06DE8B0B745ACB4A64062428A536BAECA0EA3C379A823;UpperCasedChecksum:467EA6084040EAE1ECD16B1EEA826757C1741316BDEA50DB7BF7E536C379149B;SizeAsReceived:7429;Count:47
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-tmn:  [7U6dGqpatfCYk6ddu1BXzS0LeN19pAEl]
x-microsoft-original-message-id: <20191029012316.24511-1-jonas@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 47
x-eopattributedmessage: 0
x-ms-traffictypediagnostic: VE1EUR01HT015:
x-ms-exchange-purlcount: 2
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Nt/qO/2YEIMwU1pRMyjS/91pFpXjuNdWgufsuyM8oGLN7EmX6LeUtcwWUvl0Fapt914b+bCNqsBzTB0czA4/WpI41KNM4zeab3RjPB9n43wbdEnCv8/aJ2SwZE1et8+KmYsajFplLp+eNdHCUEBfXjFQHh5etGHT0vcyeOupuN9v/RuKX4jZu0RtB5Lvr+b2SZMswRKVy8eXOfAn/b0kXF63mOBvWH2yK13gOcqzRAE=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: e6621a09-de0c-40af-ce09-08d75c0e999b
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2019 01:23:27.6354
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1EUR01HT015
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series contains fixes and improvements for the hantro H264 decoder.

Patch 1-3 is updated patches from the "media: hantro: Collected fixes for v5.4"
series.

Patch 4-8 fixes issues and limitations observed when preparing support
for field encoded content.

Patch 9 introduce new DPB entry flags that is used to signal how a reference
frame is referenced. This information is needed to correctly build a
reference list for field encoded content.

Patch 10 adds bits to handle field encoded content, this is a rough patch
and should be reworked with proper code style and formatting.
Please get back with feedback on how to improve this.

The following samples from [1] are now playable with this series
- H264_1080i-25-interlace_Kaesescheibchen.mkv
- H264_10_1080i_50_AC3-Astra19.2_ProSieben_HD.ts
- big_buck_bunny_1080p_H264_AAC_25fps_7200K.mp4
- h264_tivo_sample.ts

This series has been tested using ffmpeg v4l2 request hwaccel at [2]

[1] http://kwiboo.libreelec.tv/test/samples/
[2] https://github.com/Kwiboo/FFmpeg/compare/4.0.4-Leia-18.4...v4l2-request-hwaccel-4.0.4-hantro

Changes in v2:
  - scaling list changes split to its own series
  - address feedback from Philipp and Ezequiel

Regards,
Jonas

Francois Buergisser (2):
  media: hantro: Fix motion vectors usage condition
  media: hantro: Fix picture order count table enable

Jonas Karlman (8):
  media: hantro: Fix H264 max frmsize supported on RK3288
  media: hantro: Fix H264 motion vector buffer offset
  media: hantro: Reduce H264 extra space for motion vectors
  media: hantro: Use capture buffer width and height for H264 decoding
  media: hantro: Remove now unused H264 pic_size
  media: hantro: Set H264 FIELDPIC_FLAG_E flag correctly
  media: uapi: h264: Add DPB entry field reference flags
  media: hantro: Fix H264 decoding of field encoded content

 .../media/uapi/v4l/ext-ctrls-codec.rst        |  12 ++
 .../staging/media/hantro/hantro_g1_h264_dec.c |  62 ++++-----
 drivers/staging/media/hantro/hantro_h264.c    | 126 +++++++++++-------
 drivers/staging/media/hantro/hantro_hw.h      |   5 +-
 drivers/staging/media/hantro/hantro_v4l2.c    |   6 +-
 drivers/staging/media/hantro/rk3288_vpu_hw.c  |   4 +-
 include/media/h264-ctrls.h                    |   4 +
 7 files changed, 135 insertions(+), 84 deletions(-)

-- 
2.17.1

