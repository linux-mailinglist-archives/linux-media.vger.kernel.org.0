Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECFC7E7DF7
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2019 02:26:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729066AbfJ2B0F convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 28 Oct 2019 21:26:05 -0400
Received: from mail-oln040092064077.outbound.protection.outlook.com ([40.92.64.77]:42990
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728979AbfJ2B0F (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Oct 2019 21:26:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AqbOzpH1h+PvhGKeFvprSpjkxqQP6DWWEoYfW4aI4F6MSc7odprOz0Ng9+V66XZoQiPCCqDbNVkMPCEvjbHk7Lg6PFGrG3dwZjbmnRMfwDo7y0I9AKGdL8pzmuknHWu651sEBgP+9cURj2o7ZdfpfXf/4tA62eSJeu9wW12yK9yQscFwVFJE0Imkf0tYyqzxrn9YKyBnh7L8bdQrjRsM8LlCFMQgnFHTLO7jpXP5V55/WXHgb+WnMFIKtNObUXHJckoVmFO+bsH+xL1Zal1baynGbyIJDjr4JsbOC7r01n/p/zclt5qhcLx4jKXxGRvoKeXRt+jsUIkn2FgOBg/T/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hHGX8RgeauXbve47lWHiyQG8got3fHNXmgVNxQYCx1g=;
 b=Ojpu3C5Mm4mn6kf5JBx1U2LhH+MnrCbn5R1nDe0oDGePLGoofrBj1biD+M0A9nRCIbFB1VtUkTHN2JEEHvMlmOS7x6YzfwqPYWZ8QlyQgiHMVXdP0s0nCrwh6hSknAEhus8zmZBy2c0M1rIFy9XKjj5ZLF5iLx0lbMVSgH/MamwWcua1MB5EcxlC4xemfzUTk1mfzlClHoGDnNOAuq5hlPEYSgl0Kuh5u9Wu5YH3NeKZaEv12c+BI8nFT5pof1t0dl3h1wTHRyl3C2kzGtpXB+STJvTtf8RcsPKdXukjC3+TOcsFybWNcS4xBN6pd6W6ni7nS9Rvrhub9zzkaAWyaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from VE1EUR01FT039.eop-EUR01.prod.protection.outlook.com
 (10.152.2.54) by VE1EUR01HT021.eop-EUR01.prod.protection.outlook.com
 (10.152.2.189) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2387.20; Tue, 29 Oct
 2019 01:26:01 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com (10.152.2.56) by
 VE1EUR01FT039.mail.protection.outlook.com (10.152.3.35) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.20 via Frontend Transport; Tue, 29 Oct 2019 01:26:01 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::b1cf:db6f:95fc:84cc]) by HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::b1cf:db6f:95fc:84cc%7]) with mapi id 15.20.2387.025; Tue, 29 Oct 2019
 01:26:01 +0000
From:   Jonas Karlman <jonas@kwiboo.se>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>
CC:     Jonas Karlman <jonas@kwiboo.se>, Hans Verkuil <hverkuil@xs4all.nl>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [RFC v2 09/10] media: uapi: h264: Add DPB entry field reference flags
Thread-Topic: [RFC v2 09/10] media: uapi: h264: Add DPB entry field reference
 flags
Thread-Index: AQHVjffSYHfHedHWTUmVsr71xfoXjw==
Date:   Tue, 29 Oct 2019 01:26:01 +0000
Message-ID: <HE1PR06MB401142C1E45B302094AD1149AC610@HE1PR06MB4011.eurprd06.prod.outlook.com>
References: <HE1PR06MB401108289F09802C261374F8AC610@HE1PR06MB4011.eurprd06.prod.outlook.com>
 <20191029012550.24628-1-jonas@kwiboo.se>
In-Reply-To: <20191029012550.24628-1-jonas@kwiboo.se>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR05CA0354.eurprd05.prod.outlook.com
 (2603:10a6:7:92::49) To HE1PR06MB4011.eurprd06.prod.outlook.com
 (2603:10a6:7:9c::32)
x-incomingtopheadermarker: OriginalChecksum:0A53B216CA40B2ABDA9206D7CE1F8A4EAAE1059BB37C4B90FAA2E88DE3BAAEC9;UpperCasedChecksum:31A878709745E1D56F1D1D0B717C400512AF1A1B455C357C9EFE871A159496DA;SizeAsReceived:7617;Count:49
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-tmn:  [qMxT/Iz+QnvHfnBGgYNpXhLidTmhNWAi]
x-microsoft-original-message-id: <20191029012550.24628-2-jonas@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 49
x-eopattributedmessage: 0
x-ms-traffictypediagnostic: VE1EUR01HT021:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xT/aiPdMRcFaKdW42HlFCdXOl4PLbX2q/RJdbW+lv55N51w2h7mAqz6mNRk/4zv5fqBwhxS41Nf8aEGglj2U29rf7WsuGFICx61+AeGzoVplGuxCxEuWySgnGYjeSZMAkv6KLsLEzuSDJlcaojJa9IHZaBbW2Ws/NxSgNRuYvshBnjY+HmzN6pJPhlqQDtk8
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a59a0c7-bd84-46bd-e5a9-08d75c0ef53a
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2019 01:26:01.3577
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1EUR01HT021
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add DPB entry flags to help indicate when a reference frame is a field picture
and how the DPB entry is referenced, top or bottom field or full frame.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 Documentation/media/uapi/v4l/ext-ctrls-codec.rst | 12 ++++++++++++
 include/media/h264-ctrls.h                       |  4 ++++
 2 files changed, 16 insertions(+)

diff --git a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
index 28313c0f4e7c..d472a54d1c4d 100644
--- a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
+++ b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
@@ -2028,6 +2028,18 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
     * - ``V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM``
       - 0x00000004
       - The DPB entry is a long term reference frame
+    * - ``V4L2_H264_DPB_ENTRY_FLAG_FIELD_PICTURE``
+      - 0x00000008
+      - The DPB entry is a field picture
+    * - ``V4L2_H264_DPB_ENTRY_FLAG_REF_TOP``
+      - 0x00000010
+      - The DPB entry is a top field reference
+    * - ``V4L2_H264_DPB_ENTRY_FLAG_REF_BOTTOM``
+      - 0x00000020
+      - The DPB entry is a bottom field reference
+    * - ``V4L2_H264_DPB_ENTRY_FLAG_REF_FRAME``
+      - 0x00000030
+      - The DPB entry is a reference frame
 
 ``V4L2_CID_MPEG_VIDEO_H264_DECODE_MODE (enum)``
     Specifies the decoding mode to use. Currently exposes slice-based and
diff --git a/include/media/h264-ctrls.h b/include/media/h264-ctrls.h
index e877bf1d537c..76020ebd1e6c 100644
--- a/include/media/h264-ctrls.h
+++ b/include/media/h264-ctrls.h
@@ -185,6 +185,10 @@ struct v4l2_ctrl_h264_slice_params {
 #define V4L2_H264_DPB_ENTRY_FLAG_VALID		0x01
 #define V4L2_H264_DPB_ENTRY_FLAG_ACTIVE		0x02
 #define V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM	0x04
+#define V4L2_H264_DPB_ENTRY_FLAG_FIELD_PICTURE	0x08
+#define V4L2_H264_DPB_ENTRY_FLAG_REF_TOP	0x10
+#define V4L2_H264_DPB_ENTRY_FLAG_REF_BOTTOM	0x20
+#define V4L2_H264_DPB_ENTRY_FLAG_REF_FRAME	0x30
 
 struct v4l2_h264_dpb_entry {
 	__u64 reference_ts;
-- 
2.17.1

