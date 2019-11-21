Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6822B104CF1
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2019 08:55:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726408AbfKUHze (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Nov 2019 02:55:34 -0500
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:55521 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725842AbfKUHze (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Nov 2019 02:55:34 -0500
Received-SPF: Pass (esa3.microchip.iphmx.com: domain of
  Eugen.Hristev@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="Eugen.Hristev@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
  include:servers.mcsv.net include:mktomail.com
  include:spf.protection.outlook.com ~all"
Received-SPF: None (esa3.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa3.microchip.iphmx.com; spf=Pass smtp.mailfrom=Eugen.Hristev@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: TfCNXPVaF7fa7sXPXAkl/q9vIJxAQnaVcIMGwowZs8QQpcCPCo7Vfxoq7tUQ0htI20hwo1UpuG
 BoMaysnOP0pursU5eZGUNN1nKN9NG1BSW/saCg1bS5jxP0KCG56Dssd/f80xA7rjDWCWkfN7YZ
 HEYsAIXA+LwGT7t+1BW1ALUwjXgizJ/nw0UT58G84Ym1xfqb4Djo9+rii6N0mRG29rmURy8d8X
 Q1erai4h2PfeBaix3V+AbaPKqKqbaQFo+SD1su4kRhPlkMzyLt62kW+y/3kdc4q9odlhCKnmVP
 0iA=
X-IronPort-AV: E=Sophos;i="5.69,224,1571727600"; 
   d="scan'208";a="57881438"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 21 Nov 2019 00:55:33 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 21 Nov 2019 00:55:28 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Thu, 21 Nov 2019 00:55:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jAKVhJwm5i8UVFCGG2BRt5TWFUCRjqcYwFU1ZCgqUXUWzD4G0MNhdKG0STwvoHMCYaRYp16mkg/iCPs3oUyJ6bSrNzS4+r5W+o97jfY+6n31PNO3tV89BindnO6pkkAg3AOdiCrC/vRB09tpizMkQccsI8RX9iTVuMoKnR3LpwuQt3kqPbMObNsBjt4tMRy+yPzJj6r1OyYgSW5LCRpVK2vqE7gghf4YjexFT5a/xJMCNU8SyAofuWTUrOZWP5cHTnUYd2W8zzVDH4OOaDkH/1lJ816oPClBJeQPTmEn2EVDzcrTG1zIaW/qWKG/LOYOIRAcqfH2bJyjB191DOsMKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bs0JXeYvVrIRzqNaXF08cpPxwH1fAeTplHZZTF43ET4=;
 b=DPGj9mN30BlD/wwEYNLl7dNL7O2IRE3rHojXQLNDRKZFcDLudbYQYrm2kWhEKycZRBUdXmvPTWBWx20TV6UKJpqpEl+HW9/GnETbUJwcl14GR/m7Y4ZfR6vcG+5FQXBpPakSyV8Ikf70rHMZnRCm6ULXeqPZ7Vf4P6XjTLkdj6ddzX8fZ7ehRbATgYTE3f12PeR027k1Ql2dRx2OQRsJBZbZU6Xq5+m5TpgTq/cWIu+roNTtAMlOuua803Yhfh21JlxaThZCQK5JsYv7w36ohELI9fjcsE7NGhEIsl+0EZZTGldDxbrbR1tESeZXkzIglgZTt2DlJsiZAy3wWfazPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bs0JXeYvVrIRzqNaXF08cpPxwH1fAeTplHZZTF43ET4=;
 b=pWIbuPwhQsJ6ZC8SjaGF4fIYtt0ZObjiKkSgCDm/u1D3p7AKQ1ptfmxe0WdxGNw6pj/Nufn/CPh5iGssy0tD4rovuLcZ8XD6G4/xZFhzuUa1SxQzSj/Tu6XsDgeb4cc6vxqg2uopWanUcWEDOXJS53z0YXTulDVFJVv01C1ElVk=
Received: from MWHPR11MB1248.namprd11.prod.outlook.com (10.169.235.138) by
 MWHPR11MB1919.namprd11.prod.outlook.com (10.175.49.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.16; Thu, 21 Nov 2019 07:55:25 +0000
Received: from MWHPR11MB1248.namprd11.prod.outlook.com
 ([fe80::b01a:3146:a1e7:3cc4]) by MWHPR11MB1248.namprd11.prod.outlook.com
 ([fe80::b01a:3146:a1e7:3cc4%6]) with mapi id 15.20.2474.015; Thu, 21 Nov 2019
 07:55:25 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <laurent.pinchart@ideasonboard.com>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <sakari.ailus@iki.fi>
CC:     <Eugen.Hristev@microchip.com>
Subject: [PATCH] media: i2c: mt9v032: fix enum mbus codes and frame sizes
Thread-Topic: [PATCH] media: i2c: mt9v032: fix enum mbus codes and frame sizes
Thread-Index: AQHVoEEIRehTgudjkU6QVeLIzYbGUQ==
Date:   Thu, 21 Nov 2019 07:55:24 +0000
Message-ID: <1574322901-7097-1-git-send-email-eugen.hristev@microchip.com>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR0102CA0022.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:14::35) To MWHPR11MB1248.namprd11.prod.outlook.com
 (2603:10b6:300:27::10)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8f74fcb8-b917-44c1-6955-08d76e582a82
x-ms-traffictypediagnostic: MWHPR11MB1919:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB19199411F39F1DDF7B46DC1CE84E0@MWHPR11MB1919.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0228DDDDD7
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39840400004)(346002)(136003)(366004)(396003)(376002)(189003)(199004)(316002)(256004)(14444005)(102836004)(81156014)(81166006)(2906002)(86362001)(25786009)(2616005)(66476007)(66556008)(186003)(26005)(14454004)(8936002)(305945005)(8676002)(99286004)(50226002)(66946007)(7736002)(107886003)(6512007)(478600001)(5660300002)(64756008)(66066001)(66446008)(52116002)(2501003)(36756003)(110136005)(71190400001)(71200400001)(3846002)(2201001)(6116002)(6486002)(4326008)(386003)(6436002)(6506007);DIR:OUT;SFP:1101;SCL:1;SRVR:MWHPR11MB1919;H:MWHPR11MB1248.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mM7fTbDv1jCquiToqgjl1wVqIiO6Zi+yF2Cin0JRyPQR8n42UeZk8WL8DZhT0cOCnlP+TfwWGFVewH0OdNSucSoZM21yzuFQLaAOm4yNmgXuYlHHxVawWmg72MM4CTpFu3qQZH6hJwzyRAinE9+74BSVwg9jcutC3wpQAbhBpp+xgmkJmVIoy+nwf9xOTFaCy5pctBnOeE7kp0zrV4cBsdoEpbQ7h6SokvcdS4q2+54FQLcS8Bd8FYjXRm0GNZiN67abwyMeGjEVcOdwHIXItogRK7HMKipyk7XIALuhb3ZPboPCwZUSD+XZ6ujdWsB0cHxzhFq4E76ygMKBF/qBAuyOpbHRnaSn6kJeBfzHYKEAt6glWloMVpnNoPIlt3YpUdtbKJU1ZtzGeYxM4DJs3sZ6YZiShxrymivQko0U7faFUJPjPQFZb28ELU3ah7BJ
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f74fcb8-b917-44c1-6955-08d76e582a82
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2019 07:55:24.9230
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rHP3imKOQvy0bDgwbkrB1s0EPgygCWFxZizxcLIeO3kJ1khQtulZvyj0TBYNXSiUQgoJ/kSx9R6ePrr9lrDK2VpCjyQg4nYmLYNWjguDYRQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1919
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Eugen Hristev <eugen.hristev@microchip.com>

This driver supports both the mt9v032 (color) and the mt9v022 (mono) sensor=
s.
Depending on which sensor is used, the format from the sensor is different.
The format.code inside the dev struct holds this information.
The enum mbus and enum frame sizes need to take into account both type of
sensors, not just the color one.
To solve this, use the format.code in these functions instead of the
hardcoded bayer color format (which is only used for mt9v032).

Suggested-by: Wenyou Yang <wenyou.yang@microchip.com>
Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 drivers/media/i2c/mt9v032.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/mt9v032.c b/drivers/media/i2c/mt9v032.c
index 4b9b98c..5bd3ae82 100644
--- a/drivers/media/i2c/mt9v032.c
+++ b/drivers/media/i2c/mt9v032.c
@@ -428,10 +428,12 @@ static int mt9v032_enum_mbus_code(struct v4l2_subdev =
*subdev,
 				  struct v4l2_subdev_pad_config *cfg,
 				  struct v4l2_subdev_mbus_code_enum *code)
 {
+	struct mt9v032 *mt9v032 =3D to_mt9v032(subdev);
+
 	if (code->index > 0)
 		return -EINVAL;
=20
-	code->code =3D MEDIA_BUS_FMT_SGRBG10_1X10;
+	code->code =3D mt9v032->format.code;
 	return 0;
 }
=20
@@ -439,7 +441,11 @@ static int mt9v032_enum_frame_size(struct v4l2_subdev =
*subdev,
 				   struct v4l2_subdev_pad_config *cfg,
 				   struct v4l2_subdev_frame_size_enum *fse)
 {
-	if (fse->index >=3D 3 || fse->code !=3D MEDIA_BUS_FMT_SGRBG10_1X10)
+	struct mt9v032 *mt9v032 =3D to_mt9v032(subdev);
+
+	if (fse->index >=3D 3)
+		return -EINVAL;
+	if (mt9v032->format.code !=3D fse->code)
 		return -EINVAL;
=20
 	fse->min_width =3D MT9V032_WINDOW_WIDTH_DEF / (1 << fse->index);
--=20
2.7.4

