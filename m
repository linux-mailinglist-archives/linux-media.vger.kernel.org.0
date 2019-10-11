Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB454D3B01
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2019 10:25:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726535AbfJKIZX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Oct 2019 04:25:23 -0400
Received: from mail-eopbgr820084.outbound.protection.outlook.com ([40.107.82.84]:50048
        "EHLO NAM01-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726371AbfJKIZX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Oct 2019 04:25:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BId0CcoYsKNsV59/rWEY9p1enioYCvJl3XxFBq/Qg0+yU4d+uFf0k8wnA9VXRgqIotVSOV9AXiuMLxqT9fS/swrvdstMuWzAmTjYVPHrjoXVKHflW4NyHXAfJ7QcB2fVZERLXLxRPv1UlWi05KV1IPtpFrjSPxtQq3393x11hUQVPq8Nduf0ABsyHuyT8YAinPbnW4R9t9H3Mo6o41pyQ4n9jBGnxtOeUBa/g93gbDkR8Zk/sjh0uJo0it9cmECPp+GqX968nUEc/L4q7CEu4vOp49lLSPKkAaYn2vkOuO7dQb+aaCn5nEpVJ8m3suMYWEpX+Ch8onlyF78xOXcKmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JKgpnSmtEvSI1LL51Vm08CCa21KjNn1fljiRdAD9Nck=;
 b=Stjcut8QoZdt8Bh1CoXXJ+zj5R8OQBVazTWbf4gGP+cgEM/sVd+JwUlqq7F5xn/VKwaWK81cSR2KZjaZN2FtiEE3MZDQje7FGRCcYJY2cPEdmlSoLJdJDMLN4lRLjBlWIk2XCjpkofC284uiyeDqzALk/AKEr6q/o9bwYagKp1vYKDNT7rIuB7t0BCzA2mktr9i/mVUUEJg7FFbwAfQvFtOmczKnZTIWNNhj90EO8R/7wz84fTQseriuVPyfzBrfgol8Rfnjm6bI8Fg9AYAg4j9cCrlRpS5vrYECQ7n2Tbz5Kl4wLOFgOxxAkU0XTbNq61IfBKmtUnZ9PCFBPeMysA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JKgpnSmtEvSI1LL51Vm08CCa21KjNn1fljiRdAD9Nck=;
 b=RfRm0GmeIRU9Lypqy7lHFn96crXwSdRmm1Sn7LDbLjw1Za2FE/bxqa5mJtoqBt5ZpTW0G01jA7ezqiugS7Fdo8Gwn7f0ziVwZE6tc6zRha/IMJQdiDsykeoF2r+hy6aWptGlKKV4HW+/czVj8ug7qrw56JUD7AosEv6X6W286e4=
Received: from DM6PR03MB4778.namprd03.prod.outlook.com (20.179.105.26) by
 DM6PR03MB5226.namprd03.prod.outlook.com (10.186.140.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.17; Fri, 11 Oct 2019 08:25:20 +0000
Received: from DM6PR03MB4778.namprd03.prod.outlook.com
 ([fe80::6563:173:4df7:3edd]) by DM6PR03MB4778.namprd03.prod.outlook.com
 ([fe80::6563:173:4df7:3edd%5]) with mapi id 15.20.2347.021; Fri, 11 Oct 2019
 08:25:20 +0000
From:   Jisheng Zhang <Jisheng.Zhang@synaptics.com>
To:     Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Benson Gui <Benson.Gui@synaptics.com>
Subject: [PATCH v2] media: rc-map: Sort rc map name MACROs
Thread-Topic: [PATCH v2] media: rc-map: Sort rc map name MACROs
Thread-Index: AQHVgA1rFpwgYEyRJUaXihMNnRz54w==
Date:   Fri, 11 Oct 2019 08:25:20 +0000
Message-ID: <20191011161256.36ef75c3@xhacker.debian>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [124.74.246.114]
x-clientproxiedby: TYCPR01CA0026.jpnprd01.prod.outlook.com
 (2603:1096:405:1::14) To DM6PR03MB4778.namprd03.prod.outlook.com
 (2603:10b6:5:184::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Jisheng.Zhang@synaptics.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e39ffd13-1f7a-4e8a-516f-08d74e248dc9
x-ms-traffictypediagnostic: DM6PR03MB5226:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR03MB52262F11860508F53EAAC93CED970@DM6PR03MB5226.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:411;
x-forefront-prvs: 0187F3EA14
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(396003)(39860400002)(376002)(136003)(366004)(199004)(189003)(9686003)(5660300002)(476003)(305945005)(1076003)(2906002)(102836004)(7736002)(26005)(486006)(186003)(6116002)(3846002)(54906003)(316002)(6512007)(110136005)(6436002)(6486002)(86362001)(66066001)(99286004)(52116002)(64756008)(107886003)(6506007)(386003)(478600001)(14454004)(4326008)(25786009)(50226002)(8936002)(8676002)(81156014)(81166006)(71200400001)(71190400001)(66946007)(256004)(66446008)(66476007)(66556008)(39210200001);DIR:OUT;SFP:1101;SCL:1;SRVR:DM6PR03MB5226;H:DM6PR03MB4778.namprd03.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: synaptics.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iagRm/0TWZJmQZNTSkF4IQ3jH/oeQBzrCAmPBK+ig1zhj8QoJW+6Vyb6NqTW8Of0UTWdhQcmhuSqD6EZG2JMOAm1WT9waJy1F0bcfGUVyooA+6sQ4GEtKDkGs0m1UxsGvxafSkrMpNOXnERrSYd7wFrdPz1RqlX35SWGkJ+p18GW+fVio1Y9RXUtm7en3C0GORDlKFvZBJjfRHAm8poMvrHXnr+dY7lvUUwIG0HRiq8HF1E4I38XcdVvnU9M3q3uXFtuGt9akKQE/dDtLSa0aUshFFxu+dSZGZrY0TpqN/jzAQ4fpqSzH7NYFZRn/eHySB2ycduzy736KY6ytQ3nh/kY40SmGA/KaKppGjT0/LAMiVmyQvGCzV5+ODJTEQ9N9RlaaUdp68kdr38XjTYWkBw/qi3tScmFU/wolUusIhk=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9A8425213FFDD145B2B5F52F0AA66B9F@namprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e39ffd13-1f7a-4e8a-516f-08d74e248dc9
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2019 08:25:20.2173
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xjHUPFdFrYtMemeXcb5vPidKYAmgPwf1XOT5753AV1H3yAzJdHXtytfjgo44xInQbUV/0W/hG1VRjpmd8OkvdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5226
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Some MACROS such as RC_MAP_SU3000 and RC_MAP_HAUPPAUGE are not
alphabetically sorted. Sort names alphabetically.

Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
---
Since v1:
 - make RC_MAP_X96MAX and RC_MAP_PIXELVIEW sorted as well.

 include/media/rc-map.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/media/rc-map.h b/include/media/rc-map.h
index afd2ab31bdf2..21fdc42805d2 100644
--- a/include/media/rc-map.h
+++ b/include/media/rc-map.h
@@ -201,6 +201,7 @@ struct rc_map *rc_map_get(const char *name);
 #define RC_MAP_GEEKBOX                   "rc-geekbox"
 #define RC_MAP_GENIUS_TVGO_A11MCE        "rc-genius-tvgo-a11mce"
 #define RC_MAP_GOTVIEW7135               "rc-gotview7135"
+#define RC_MAP_HAUPPAUGE                 "rc-hauppauge"
 #define RC_MAP_HAUPPAUGE_NEW             "rc-hauppauge"
 #define RC_MAP_HISI_POPLAR               "rc-hisi-poplar"
 #define RC_MAP_HISI_TV_DEMO              "rc-hisi-tv-demo"
@@ -234,21 +235,21 @@ struct rc_map *rc_map_get(const char *name);
 #define RC_MAP_PINNACLE_COLOR            "rc-pinnacle-color"
 #define RC_MAP_PINNACLE_GREY             "rc-pinnacle-grey"
 #define RC_MAP_PINNACLE_PCTV_HD          "rc-pinnacle-pctv-hd"
-#define RC_MAP_PIXELVIEW_NEW             "rc-pixelview-new"
 #define RC_MAP_PIXELVIEW                 "rc-pixelview"
-#define RC_MAP_PIXELVIEW_002T		 "rc-pixelview-002t"
+#define RC_MAP_PIXELVIEW_002T            "rc-pixelview-002t"
 #define RC_MAP_PIXELVIEW_MK12            "rc-pixelview-mk12"
+#define RC_MAP_PIXELVIEW_NEW             "rc-pixelview-new"
 #define RC_MAP_POWERCOLOR_REAL_ANGEL     "rc-powercolor-real-angel"
 #define RC_MAP_PROTEUS_2309              "rc-proteus-2309"
 #define RC_MAP_PURPLETV                  "rc-purpletv"
 #define RC_MAP_PV951                     "rc-pv951"
-#define RC_MAP_HAUPPAUGE                 "rc-hauppauge"
 #define RC_MAP_RC5_TV                    "rc-rc5-tv"
 #define RC_MAP_RC6_MCE                   "rc-rc6-mce"
 #define RC_MAP_REAL_AUDIO_220_32_KEYS    "rc-real-audio-220-32-keys"
 #define RC_MAP_REDDO                     "rc-reddo"
 #define RC_MAP_SNAPSTREAM_FIREFLY        "rc-snapstream-firefly"
 #define RC_MAP_STREAMZAP                 "rc-streamzap"
+#define RC_MAP_SU3000                    "rc-su3000"
 #define RC_MAP_TANGO                     "rc-tango"
 #define RC_MAP_TANIX_TX3MINI             "rc-tanix-tx3mini"
 #define RC_MAP_TANIX_TX5MAX              "rc-tanix-tx5max"
@@ -275,9 +276,8 @@ struct rc_map *rc_map_get(const char *name);
 #define RC_MAP_WETEK_PLAY2               "rc-wetek-play2"
 #define RC_MAP_WINFAST                   "rc-winfast"
 #define RC_MAP_WINFAST_USBII_DELUXE      "rc-winfast-usbii-deluxe"
-#define RC_MAP_SU3000                    "rc-su3000"
-#define RC_MAP_XBOX_DVD                  "rc-xbox-dvd"
 #define RC_MAP_X96MAX                    "rc-x96max"
+#define RC_MAP_XBOX_DVD                  "rc-xbox-dvd"
 #define RC_MAP_ZX_IRDEC                  "rc-zx-irdec"
=20
 /*
--=20
2.23.0

