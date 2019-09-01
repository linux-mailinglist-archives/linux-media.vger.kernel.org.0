Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FD51A4958
	for <lists+linux-media@lfdr.de>; Sun,  1 Sep 2019 14:45:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728941AbfIAMpt convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Sun, 1 Sep 2019 08:45:49 -0400
Received: from mail-oln040092065081.outbound.protection.outlook.com ([40.92.65.81]:31879
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728853AbfIAMpt (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 1 Sep 2019 08:45:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VTfltuUuuKKgHiAo+JIHxdlrQgfz+DYSBk6hud3c6qv0koso7mugSeZKPS39snKEqnjGwHDF0NMlpcnP2E/FpYXQM7I2Jd/bXaLW8knFx0YiwfYeYQebipI7lUSKdJQgd0eBt5DSi17TNp1iE5h882zgZSz9xHMRKRzUVCxljAgaBhy3MevOyaZSR3eeWOpWiCf1eqnIMGATGc1lWxXtGUy1aLUH6MogL0tP2aqW/e50ifeiy4s8TmwXs6ZrE1SUk2StilAXyKhXdYtv7xDoldFPeQ2h1OXkV6rKFf96bAwaQEyZaJ9GJ2QluT49mA13IwYoFHFhmDjHLj53ZBx+DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=thRAwOIy9xk91Hq/mewUM0LZexsqoFnkeXi/h6uA+Eo=;
 b=b34WWFPw0SNJlazZvgWctRsYjxGeFBOhF0cmwW+JErCjinu0DA/XQtYCdCKivesVkia+tqvdDa+gMsm2Z6wYezmasmQXi3cKBbSV+0ncETCHJth7tnLmLSDLSbhP7G5jN93Qwa3ZD7YXwQoHq+Kg/oWLvWC39IpEOfsBBEtYgS4b9cZBwVW7xFOkQL7Fmsut13lcUCc3suAuJTslzRT5oD1XzMxWbcJnrkqI51HSk1Hw6aTEK6g+jlqEfAfRwk42E1s+wUko4C0d/SsXvrQ+UHp1Q0FiC/Ww0B8xfXe+BH3/tfqPzjKME/QaNW7XDtVBIGOAnATD/otboguLW4j+uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from HE1EUR01FT057.eop-EUR01.prod.protection.outlook.com
 (10.152.0.55) by HE1EUR01HT021.eop-EUR01.prod.protection.outlook.com
 (10.152.0.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2220.16; Sun, 1 Sep
 2019 12:45:45 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com (10.152.0.52) by
 HE1EUR01FT057.mail.protection.outlook.com (10.152.0.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.16 via Frontend Transport; Sun, 1 Sep 2019 12:45:45 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::a0ba:e766:2a23:2088]) by HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::a0ba:e766:2a23:2088%3]) with mapi id 15.20.2199.021; Sun, 1 Sep 2019
 12:45:45 +0000
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
Subject: [PATCH 06/12] media: hantro: Set H264 FIELDPIC_FLAG_E flag correctly
Thread-Topic: [PATCH 06/12] media: hantro: Set H264 FIELDPIC_FLAG_E flag
 correctly
Thread-Index: AQHVYMMsvCjvoOyW3U6yRGSkSyG0lw==
Date:   Sun, 1 Sep 2019 12:45:45 +0000
Message-ID: <HE1PR06MB40119475B6B31F82297BC0E1ACBF0@HE1PR06MB4011.eurprd06.prod.outlook.com>
References: <HE1PR06MB40117D0EE96E6FA638A04B78ACBF0@HE1PR06MB4011.eurprd06.prod.outlook.com>
 <20190901124531.23645-1-jonas@kwiboo.se>
In-Reply-To: <20190901124531.23645-1-jonas@kwiboo.se>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR05CA0343.eurprd05.prod.outlook.com
 (2603:10a6:7:92::38) To HE1PR06MB4011.eurprd06.prod.outlook.com
 (2603:10a6:7:9c::32)
x-incomingtopheadermarker: OriginalChecksum:A0A8E5305A12CD36BFEBD027A8E03E128424E67FDEACDD106AF03D11AD1F1354;UpperCasedChecksum:EADCF05CD4599353510D720A50506B08D15FC6D2380094097560D385FA050190;SizeAsReceived:7892;Count:50
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-tmn:  [hVY02xUHs5Rlee8ZrbAGlT5HZEyZbq5Y]
x-microsoft-original-message-id: <20190901124531.23645-6-jonas@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 50
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(5050001)(7020095)(20181119110)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031322404)(2017031323274)(2017031324274)(1601125500)(1603101475)(1701031045);SRVR:HE1EUR01HT021;
x-ms-traffictypediagnostic: HE1EUR01HT021:
x-microsoft-antispam-message-info: i8DXRPjztV7SUkrlD3dp51OV7YHjgvPRCdLl3fo17QsG8lwcEIzZRKF5jHvUB8aQ9IKvSFc+5XsK0oLy2mFavJyw+N63VMc1Tgg90O2bv2ejxKLjyUmXTzyrnhG6JJAw95G/+58/lIJrfE/c3f5Ud15Sm29SEKKwtdV1G4WVOSMZZp92jSBYP6TbLOyHQHfE
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ae5a603-6fbf-4e0c-89a3-08d72eda4e86
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2019 12:45:45.4501
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1EUR01HT021
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The FIELDPIC_FLAG_E bit should be set when field_pic_flag exists in stream,
it is currently set based on field_pic_flag of current frame.
The PIC_FIELDMODE_E bit is correctly set based on the field_pic_flag.

Fix this by setting the FIELDPIC_FLAG_E bit when frame_mbs_only is not set.

Fixes: dea0a82f3d22 ("media: hantro: Add support for H264 decoding on G1")
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 drivers/staging/media/hantro/hantro_g1_h264_dec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/hantro/hantro_g1_h264_dec.c b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
index 159bd67e0a36..16f21d258f6a 100644
--- a/drivers/staging/media/hantro/hantro_g1_h264_dec.c
+++ b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
@@ -64,7 +64,7 @@ static void set_params(struct hantro_ctx *ctx)
 	/* always use the matrix sent from userspace */
 	reg |= G1_REG_DEC_CTRL2_TYPE1_QUANT_E;
 
-	if (slices[0].flags &  V4L2_H264_SLICE_FLAG_FIELD_PIC)
+	if (!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY))
 		reg |= G1_REG_DEC_CTRL2_FIELDPIC_FLAG_E;
 	vdpu_write_relaxed(vpu, reg, G1_REG_DEC_CTRL2);
 
-- 
2.17.1

