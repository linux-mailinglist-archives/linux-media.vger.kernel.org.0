Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54A8A108A11
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2019 09:32:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727052AbfKYIc4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Nov 2019 03:32:56 -0500
Received: from esa1.microchip.iphmx.com ([68.232.147.91]:17045 "EHLO
        esa1.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727047AbfKYIcz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Nov 2019 03:32:55 -0500
Received-SPF: Pass (esa1.microchip.iphmx.com: domain of
  Eugen.Hristev@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="Eugen.Hristev@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
  include:servers.mcsv.net include:mktomail.com
  include:spf.protection.outlook.com ~all"
Received-SPF: None (esa1.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa1.microchip.iphmx.com; spf=Pass smtp.mailfrom=Eugen.Hristev@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: 5x4y3u3sX/XuWfSBk8Y1NBjEBG7S5BaJJq6XB9SdTWa7upytfLZxDzPKdmEH2mwVbhAGZg47RL
 ULuD+GwPZNeIF23ZGu6A1BZ5WOuG5WObRWnF7cCqRf7Ck9QiFi8iMAYjb9I4k6Vzw26Ev4NmYG
 VjZw9dZcSg+790/7aDJWpEW0oE1yUSmo3qHMB8iNO5mhVUi0cOaOQE63REHlRMHcJmFMAamwj4
 P5jPrb7abc0aVE9XXQW7FdyFLt6tr41ZR+YMofMq7FvhoGAD89PsbPxCvlUYAEctBOz/Npbg56
 Jww=
X-IronPort-AV: E=Sophos;i="5.69,241,1571727600"; 
   d="scan'208";a="59582554"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 25 Nov 2019 01:32:54 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 25 Nov 2019 01:32:54 -0700
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 25 Nov 2019 01:32:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P4cVq01jrd9SYlvtFITUDwq+A/0z4WywamYIRd5iTyWUw5DrW/QP7jFGHyGN30sJkj20bxSCOo3LWnv7Wzon3uWB3aBoGLWK5WNTDDCh85hoWUlVsJtIy+j3LwdMsHZzXHBtadLhoNCRaSsDWjMnQXPtP+ihBISZbFlyQNrG/BhJRQ/DR7jWJ8Uu2/LN4SHkECjhrE0ZB/gUCjzTlvIdr6AhGGJYwpyJKh2+uX3Ux/ar2ijSBclnzQJ98hrr1Hwq6DFUhTi1oGhcsyVSXSgV+tCWTPxf/dyEBjf0vgFUCjfUN/JMkELQlisGdZd0G7TUp9vK9dUVt5Ud7d1G8XUkww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ODnUOcqY0KalriTcExTCa9U7N8wvQUUlGpEuL53z34=;
 b=KsTlz7Y3PtpycZk37SYKr1TgG9otj03xAWT6uZE5hYlHCmdo58Gc7QWYivOz2nmB7yqXmFlc4qWaOOu55tbzUilTiRT/DS0Dsokugja8OzXCwcCZGjuxC2NU0BjLshZQZ/9sZKKtn8AfdDzcVWrvEDqftzDyv57ca9mNY7Sfm3KWfWMQwvL4TrbT8Yw8NIvq4+ZdgzwJ4VdfCLbClZ1+5trRBAvuKEpQZTePIbzEx5ERqmyv6Zc5yUAEXUwZTsvc90pA75acHDLHZedgcOuzHeXJQdpWsOWX5p/U4thlgMk52El9URs9NLYcqC80MHvkTAaHpDJG1lCLWM1X2FmJBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ODnUOcqY0KalriTcExTCa9U7N8wvQUUlGpEuL53z34=;
 b=dDJWumwV0MP6jCZE7AsKGGODEAiII24r/o4biihomD+mvVfRSwMtzufYnJWbc4Sw9NPvA47KS70RFvyNRq+mGZFFOWgDhxsFx2UNNUpJFdLtSV0ziSg6778gLZx44DDGArMTmjcWU59TOwrUxVLb5mWEEd/aPNPp6spt5m2vnjo=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB1418.namprd11.prod.outlook.com (10.168.102.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17; Mon, 25 Nov 2019 08:32:53 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::9039:e0e8:9032:20c1]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::9039:e0e8:9032:20c1%12]) with mapi id 15.20.2474.023; Mon, 25 Nov
 2019 08:32:53 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <hverkuil@xs4all.nl>
CC:     <Eugen.Hristev@microchip.com>
Subject: [PATCH 4/5] media: atmel: atmel-isc-base: fix enum calls default
 format
Thread-Topic: [PATCH 4/5] media: atmel: atmel-isc-base: fix enum calls default
 format
Thread-Index: AQHVo2rtyZwWiP6YTkSg0h1tviYJpw==
Date:   Mon, 25 Nov 2019 08:32:53 +0000
Message-ID: <1574670712-31992-5-git-send-email-eugen.hristev@microchip.com>
References: <1574670712-31992-1-git-send-email-eugen.hristev@microchip.com>
In-Reply-To: <1574670712-31992-1-git-send-email-eugen.hristev@microchip.com>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM4PR07CA0029.eurprd07.prod.outlook.com
 (2603:10a6:205:1::42) To DM5PR11MB1242.namprd11.prod.outlook.com
 (2603:10b6:3:14::8)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 136d7c3d-b6bc-45aa-e4b0-08d77182105d
x-ms-traffictypediagnostic: DM5PR11MB1418:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB14186E78C65FF89CE2F73FF0E84A0@DM5PR11MB1418.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2449;
x-forefront-prvs: 0232B30BBC
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39860400002)(346002)(376002)(396003)(366004)(136003)(189003)(199004)(305945005)(2201001)(66476007)(66556008)(76176011)(64756008)(66446008)(26005)(81156014)(81166006)(4326008)(3846002)(50226002)(5660300002)(25786009)(86362001)(8676002)(6116002)(2501003)(52116002)(66946007)(6436002)(66066001)(256004)(6486002)(446003)(14454004)(2906002)(386003)(71200400001)(102836004)(6512007)(2616005)(11346002)(6506007)(478600001)(71190400001)(36756003)(110136005)(107886003)(99286004)(186003)(7736002)(8936002)(316002)(461764006);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB1418;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: driQ8bkwk581uJ0o1b9kFRi0qqeSqDZL/ynCQezw62J1zJcnluSmpcSO93ybZq4hxp90IPzTZV4KWm9f77sHBT+4b35kgkbzHsYjdMP5whWeB5munwn9Qcj8j5x8OPMMMMJLidj1McpEgloV6J2/YXCaMcbUfbVi2hatFfTKFQ9zBXpi4pktbVKQ+/UC4SjMkp+tES1Tv7dVkP3MTet7YNU7Dihs+rT+tngq/GIoPZGuCrwmdSFz2j2e8EapqO2mzoRFWhd6EQhvtZO/C6XpZt6NMl1CKRn2tjg5mJ8O5RX4K1bwQitTAMH/7+mpZccRqyEpxCSovZ73WclVI6S3PIXA2+GWa8OvYeXNc2pQjiIERBk0jGJakUXkkvx7krUYWFEh2q8qq74acD4TVIDjjAJISR+8X/kPYLyfgCNtT8jVVkSYtLq1eGJnh57qIa9Q
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 136d7c3d-b6bc-45aa-e4b0-08d77182105d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2019 08:32:53.3079
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v3g9Ql0WAe63YWp0+wOotNZF1JvmqLvgf8w/EgyCUdc7FtujhcFI5KWVLkSEU7mxXUCgnEEsjn/8jkG5vVctZkV44ChXjATIzQOZL3Cdq84=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1418
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Eugen Hristev <eugen.hristev@microchip.com>

With some sensors, the mbus code must match the one that sensor supports.
In this case we should initialize the mbus_code of the fse/fie before
calling the subdev, and not after.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 drivers/media/platform/atmel/atmel-isc-base.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/atmel/atmel-isc-base.c b/drivers/media/=
platform/atmel/atmel-isc-base.c
index 7c73bcd..1bb1dd5 100644
--- a/drivers/media/platform/atmel/atmel-isc-base.c
+++ b/drivers/media/platform/atmel/atmel-isc-base.c
@@ -1461,6 +1461,7 @@ static int isc_enum_framesizes(struct file *file, voi=
d *fh,
 {
 	struct isc_device *isc =3D video_drvdata(file);
 	struct v4l2_subdev_frame_size_enum fse =3D {
+		.code =3D isc->config.sd_format->mbus_code,
 		.index =3D fsize->index,
 		.which =3D V4L2_SUBDEV_FORMAT_ACTIVE,
 	};
@@ -1483,8 +1484,6 @@ static int isc_enum_framesizes(struct file *file, voi=
d *fh,
 	if (ret)
 		return ret;
=20
-	fse.code =3D isc->config.sd_format->mbus_code;
-
 	fsize->type =3D V4L2_FRMSIZE_TYPE_DISCRETE;
 	fsize->discrete.width =3D fse.max_width;
 	fsize->discrete.height =3D fse.max_height;
@@ -1497,6 +1496,7 @@ static int isc_enum_frameintervals(struct file *file,=
 void *fh,
 {
 	struct isc_device *isc =3D video_drvdata(file);
 	struct v4l2_subdev_frame_interval_enum fie =3D {
+		.code =3D isc->config.sd_format->mbus_code,
 		.index =3D fival->index,
 		.width =3D fival->width,
 		.height =3D fival->height,
@@ -1521,7 +1521,6 @@ static int isc_enum_frameintervals(struct file *file,=
 void *fh,
 	if (ret)
 		return ret;
=20
-	fie.code =3D isc->config.sd_format->mbus_code;
 	fival->type =3D V4L2_FRMIVAL_TYPE_DISCRETE;
 	fival->discrete =3D fie.interval;
=20
--=20
2.7.4

