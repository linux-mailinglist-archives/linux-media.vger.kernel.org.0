Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 351A7F21BC
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2019 23:33:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727486AbfKFWdC convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 6 Nov 2019 17:33:02 -0500
Received: from mail-oln040092065044.outbound.protection.outlook.com ([40.92.65.44]:19331
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726779AbfKFWdC (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 Nov 2019 17:33:02 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mjj0g0396qlVgkcNeh75O9csoYyZO4C+Mr3KnHNDfrnVJV6bFAvZkFv/HCtZ2VTczK2TUmWzJ1dfqnMJjgoR/36nMLAyrCeNw+MV+DOEMfwCEF8Lqxjxr4d9imtAB7g0UxSZZQZj04DL9whAfk5sxvh7wFzvqHWGS+ZACPKHvR8KN1r+0aqD8hvjp32aeCbhnZZ+B0UFIrWvBiwBLMU6Ek7zIVltAqVrGsbrrDsvl2yGQKKNs7kOGPzswbZUlAE229X8TQoP722Tt8Kk3qrU4cp/lm39elYjXZT26ZcEyVOqSLNHQ4HG29Mf33ar7ymVVIQHXDu3+2sJ3XmTSffQyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aO6k3RBW2sabLGZm4x6odKZDg6tpq4XIzVaOa5K5Wss=;
 b=giBIbhkNRNXf6np0b5/RfqFdC/9hC8QBfDBF6DxYyAW4aH2IPQsV0/s4tAzFNN3K+UO5AIEwQGPvac3WTidaOYp/TL/KOJo4peHZ3RQ4RvUKemIepN2+FuEz3csNxdqOHuPSP/lsIQeA20NrfJMR04EXahfKD+925M3sO9Es2wk8ZNomt8aqXOOmEs5ja+PJxkZaEUGJ5K1Ry2tDzaxQ8fMpDvCLf6+ILpgzOvhule/yK2YxrB63ppN4evv4hm/HXjTWUdJSQ7D+1eVnAwnJg/nWvOeyZfdbYd7pKEGSk919S3vjoGI7Coav6L9rRCH+Le/F9hWBoby0A6qx359VZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from HE1EUR01FT023.eop-EUR01.prod.protection.outlook.com
 (10.152.0.60) by HE1EUR01HT233.eop-EUR01.prod.protection.outlook.com
 (10.152.1.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2387.20; Wed, 6 Nov
 2019 22:32:57 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com (10.152.0.53) by
 HE1EUR01FT023.mail.protection.outlook.com (10.152.0.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.20 via Frontend Transport; Wed, 6 Nov 2019 22:32:57 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::b1cf:db6f:95fc:84cc]) by HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::b1cf:db6f:95fc:84cc%7]) with mapi id 15.20.2408.028; Wed, 6 Nov 2019
 22:32:57 +0000
From:   Jonas Karlman <jonas@kwiboo.se>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>
CC:     Jonas Karlman <jonas@kwiboo.se>, Hans Verkuil <hverkuil@xs4all.nl>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 0/5] media: hantro: H264 fixes and improvements
Thread-Topic: [PATCH v3 0/5] media: hantro: H264 fixes and improvements
Thread-Index: AQHVlPIjcNg+c5zBWEa0uMP5FF5CZw==
Date:   Wed, 6 Nov 2019 22:32:57 +0000
Message-ID: <HE1PR06MB4011EDD5F2686A05BC35F61CAC790@HE1PR06MB4011.eurprd06.prod.outlook.com>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR1001CA0019.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:3:f7::29) To HE1PR06MB4011.eurprd06.prod.outlook.com
 (2603:10a6:7:9c::32)
x-incomingtopheadermarker: OriginalChecksum:479639FC6A782B5B851172BE79E4A015265747C4C782BC270E972D9DFEF6C32F;UpperCasedChecksum:A5CD3A1CA7467DE3573FBB5C2030E196637CE85CF9C20196E7FEB0AF760EFC3C;SizeAsReceived:7397;Count:47
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-tmn:  [LA7Zft4GsaIijvwbisNNtjgwlOvwLT42]
x-microsoft-original-message-id: <20191106223240.2120-1-jonas@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 47
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 99ffc57c-3b3f-4486-3fe3-08d763094565
x-ms-traffictypediagnostic: HE1EUR01HT233:
x-ms-exchange-purlcount: 2
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Bladcb1+6qpTbc7xZ6itwg590OWRzlmoIcn7e4HX2ckZ/JAPHTGZCV48V2tuPGgFxZ3ujpYxNbCv6GEuTYaQkcLv9iflFYUxgGVgozHvmVRFijhI6n1+HdHUS18YuFdTLb6WPcdYvnBbeC9vTOpHHfYK4Ufirp80TqHXirKQ7PfSKDt2mPYmO0aWa8ZuutdvSTY1a/r465GfXH5ryM+AghBODCDUvHpJZBEfA8wUYNE=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 99ffc57c-3b3f-4486-3fe3-08d763094565
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2019 22:32:57.2480
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1EUR01HT233
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series contains fixes and improvements for the hantro H264 decoder.

Patch 1 and 5 fixes the motion vector buffer offset calculation for field encoded
and monochrome content and makes it possible to decode a sample from [1].

Patch 2 removes overallocation for the motion vector buffer,
only half of the extra size is needed.

Patch 3 changes to use the same source for width and height as is used for
motion vector buffer offset calculation.

The RFC patches that added bits to handle field encoded content have
been dropped and will be resent in a separate series.

The following sample from [1] is now playable with this series
- H264_1080i-25-interlace_Kaesescheibchen.mkv

This series has been tested using ffmpeg v4l2 request hwaccel at [2]

[1] http://kwiboo.libreelec.tv/test/samples/
[2] https://github.com/Kwiboo/FFmpeg/compare/4.0.4-Leia-18.4...v4l2-request-hwaccel-4.0.4-hantro

Changes in v3:
  - rebased on for-v5.5q
  - drop RFC patches
  - src_fmt instead of dst_fmt is used for width/height
  - address feedback from Boris

Changes in v2:
  - scaling list changes split to its own series
  - address feedback from Philipp and Ezequiel

Regards,
Jonas

Jonas Karlman (5):
  media: hantro: Fix H264 motion vector buffer offset
  media: hantro: Reduce H264 extra space for motion vectors
  media: hantro: Use output buffer width and height for H264 decoding
  media: hantro: Remove now unused H264 pic_size
  media: hantro: Set H264 FIELDPIC_FLAG_E flag correctly

 .../staging/media/hantro/hantro_g1_h264_dec.c | 37 +++++++++++++------
 drivers/staging/media/hantro/hantro_h264.c    |  5 ---
 drivers/staging/media/hantro/hantro_hw.h      |  3 --
 drivers/staging/media/hantro/hantro_v4l2.c    | 20 +++++++++-
 4 files changed, 43 insertions(+), 22 deletions(-)

-- 
2.17.1

