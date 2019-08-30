Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C589FA3114
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2019 09:33:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727850AbfH3HdN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Aug 2019 03:33:13 -0400
Received: from mail-eopbgr730044.outbound.protection.outlook.com ([40.107.73.44]:39232
        "EHLO NAM05-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726090AbfH3HdM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Aug 2019 03:33:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IgeYY11z9elLs8LGO1Yg8leYoGbIcDEgpbjIP8olqC0BhhSpCXdKFuH9JwqfASCZO32g7Dsg0sy6upypYELe2qicEqYWyulMdAlRnZXQqaLUnAJeYuRooW0q0GNqcl6EZTTJl1e4rKF+/bejXF4VPUuopJ8IgV8eh9U4GafYsSc2STCV2MHUR8j7IDKdQhoUJtzoYmdoT+pW0i8duoZgSTsQqdqn74f0nSjDp++qErCyzo80chl9OwFRpWbcbowfU7yWsTx99fyRt2fo597LB0q22HevmdyzhcIa6rI1p+K9aYDBLdiCc8hyEB2V1gqadxpoh6NoHD7pNCpl9pp48A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a4qepn83RcfoYsJmdKX4UFm7xEk7jtdzH5a7hShtLng=;
 b=RkmLkiqLEMpj077fLrvEjEpn8DH5hWby+eZZRwqMnqoUePsw04DMZ+lVH5JGT+GQZesaSVsyI+shpXmuJrPz3cNiLgIUKp5HOtqmwGf3ErwTR/F7krBvV5DiZ7zbNzZ6IteCJWfP3xhIip/X7aOTC3CSXFP7WICyritIK6Ug1cAdmEpqvM88lWilbRqgTeB65vEDcMEshR8gxl5tUEGHioxFofy4F93xZT4kQ7P2/HjI9AZqtf6s9BzkMgwf8Hu174Za3Hfqjs4gBDHOeFSe2iO1u7lAbFjfkXsGUDGcR4z83sfaJcdZYZwi0rymmwultupSVFsGZpnBatWrsn84eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a4qepn83RcfoYsJmdKX4UFm7xEk7jtdzH5a7hShtLng=;
 b=Jt5sn3Q8+PF962G/QfoncghZE81f+3VV8JVJxvsufJxHIXoB34Io1CVUmXDjKtX/tCT1qvVAo6aJAhJcqvuo2QvVVfJpzh5P4Vbgm9bYVL28CHQ1ofXg7qC+sJsg7NkcoyOqY6s4MQDLhiGNQnxDWGe1CyxJzeriTTE0bM9vFbI=
Received: from BYAPR03MB4773.namprd03.prod.outlook.com (20.179.92.152) by
 BYAPR03MB4871.namprd03.prod.outlook.com (20.179.93.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.18; Fri, 30 Aug 2019 07:33:09 +0000
Received: from BYAPR03MB4773.namprd03.prod.outlook.com
 ([fe80::391b:4d0f:a377:41c]) by BYAPR03MB4773.namprd03.prod.outlook.com
 ([fe80::391b:4d0f:a377:41c%4]) with mapi id 15.20.2220.013; Fri, 30 Aug 2019
 07:33:09 +0000
From:   Jisheng Zhang <Jisheng.Zhang@synaptics.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Benson Gui <Benson.Gui@synaptics.com>
Subject: [PATCH] media: rc-map: Sort rc map name MACROs
Thread-Topic: [PATCH] media: rc-map: Sort rc map name MACROs
Thread-Index: AQHVXwUr7nCzhAFWy0yQxn91HIokEQ==
Date:   Fri, 30 Aug 2019 07:33:08 +0000
Message-ID: <20190830152143.4ad42aeb@xhacker.debian>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [124.74.246.114]
x-clientproxiedby: TY2PR0101CA0029.apcprd01.prod.exchangelabs.com
 (2603:1096:404:8000::15) To BYAPR03MB4773.namprd03.prod.outlook.com
 (2603:10b6:a03:134::24)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Jisheng.Zhang@synaptics.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e8f7970e-5e88-4d8b-e281-08d72d1c4deb
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:BYAPR03MB4871;
x-ms-traffictypediagnostic: BYAPR03MB4871:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR03MB48712C0EE246D975633D9DCBEDBD0@BYAPR03MB4871.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:206;
x-forefront-prvs: 0145758B1D
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(366004)(346002)(376002)(136003)(39850400004)(189003)(199004)(81156014)(71200400001)(71190400001)(53936002)(256004)(6486002)(6436002)(107886003)(4326008)(6916009)(2906002)(386003)(52116002)(6506007)(102836004)(6512007)(486006)(9686003)(476003)(316002)(8676002)(50226002)(14454004)(81166006)(7736002)(66476007)(305945005)(66066001)(8936002)(1076003)(3846002)(6116002)(99286004)(64756008)(186003)(86362001)(478600001)(66556008)(66946007)(25786009)(5660300002)(66446008)(54906003)(26005)(39210200001);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR03MB4871;H:BYAPR03MB4773.namprd03.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: synaptics.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: byhAiTQiXjYXUaReU6X+PWz9iZ5jYBdC8SQbCj9Nw2ejvaEzfZfA6lNcp1v+rzanvSpKQWR1FRIdLpu13NMf2nYs8CHzzMXKk8eQjTlxvf3VOqgXuoJ+ENiCCxLzRmUvbVRQ6mK7pg0J5pm8DsEKj3iJvS9j/j+k3rUeyMY80M/WWqdkkXlDVjxPjAk3ao/oBOHdE/b5Ly6H/q8S4YAquDrm3SdtbaUdQVv0jbG4voLkevGLUKvNcIS+TizwhxyzGOgG17V4EhcBBJIxMXkdoLlctb7OT1B6ITJXqhy/gED2gL9X9o/9KKAAutIQ2JD7XHl6R2nXc7UYWSQwMV5J6ZgnPG9HNcu818unR0jRtg+lOR8Y+pe1ytbKCy/dp0Cw2DXwCzW+K+lYCNbNQli9YMm4nYit/NeTgN4Jqt5Dxtw=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <78AE431B2941D14FAC38ACC7358EBE39@namprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8f7970e-5e88-4d8b-e281-08d72d1c4deb
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2019 07:33:08.9821
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IBxLmL07WBwcatoLOKGQ5GBiKoOdqXO82lSwxLpnGAe4r11sC2ZYpjSUUy2uyCBU0dumkkMovL5u/tKxaifr0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4871
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Except RC_MAP_SU3000 and RC_MAP_HAUPPAUGE, others are alphabetically
sorted. Sort names alphabetically.

Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
---
 include/media/rc-map.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/media/rc-map.h b/include/media/rc-map.h
index bebd3c4c6338..af71b08be9f2 100644
--- a/include/media/rc-map.h
+++ b/include/media/rc-map.h
@@ -215,6 +215,7 @@ struct rc_map *rc_map_get(const char *name);
 #define RC_MAP_GENIUS_TVGO_A11MCE        "rc-genius-tvgo-a11mce"
 #define RC_MAP_GOTVIEW7135               "rc-gotview7135"
 #define RC_MAP_HAUPPAUGE_NEW             "rc-hauppauge"
+#define RC_MAP_HAUPPAUGE                 "rc-hauppauge"
 #define RC_MAP_HISI_POPLAR               "rc-hisi-poplar"
 #define RC_MAP_HISI_TV_DEMO              "rc-hisi-tv-demo"
 #define RC_MAP_IMON_MCE                  "rc-imon-mce"
@@ -253,13 +254,13 @@ struct rc_map *rc_map_get(const char *name);
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
 #define RC_MAP_TBS_NEC                   "rc-tbs-nec"
 #define RC_MAP_TECHNISAT_TS35            "rc-technisat-ts35"
@@ -282,7 +283,6 @@ struct rc_map *rc_map_get(const char *name);
 #define RC_MAP_VIDEOMATE_TV_PVR          "rc-videomate-tv-pvr"
 #define RC_MAP_WINFAST                   "rc-winfast"
 #define RC_MAP_WINFAST_USBII_DELUXE      "rc-winfast-usbii-deluxe"
-#define RC_MAP_SU3000                    "rc-su3000"
 #define RC_MAP_XBOX_DVD                  "rc-xbox-dvd"
 #define RC_MAP_ZX_IRDEC                  "rc-zx-irdec"
=20
--=20
2.23.0

