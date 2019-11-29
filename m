Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13D4510D6AE
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2019 15:11:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727030AbfK2OKr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 Nov 2019 09:10:47 -0500
Received: from esa2.microchip.iphmx.com ([68.232.149.84]:58848 "EHLO
        esa2.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726824AbfK2OKo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 Nov 2019 09:10:44 -0500
Received-SPF: Pass (esa2.microchip.iphmx.com: domain of
  Eugen.Hristev@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="Eugen.Hristev@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
  include:servers.mcsv.net include:mktomail.com
  include:spf.protection.outlook.com ~all"
Received-SPF: None (esa2.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa2.microchip.iphmx.com; spf=Pass smtp.mailfrom=Eugen.Hristev@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: B2BnvbwiPbawwQAY88RSZVPw1jQHE9YA+LWmLXp+AJjkGXLeRzS5ly5eTiwnr2/8vcINnFJuan
 zkuiTG7YVcadn+j4lgbLzaC6bI5owOtj0u7/WzRNS05lbaRfrTMRqy4ZVUyZ2/uAJJVtOAC0mC
 sqmXb1EIzBT90qgeUme1qi9pjpwNycXn7dAOHd/mygneDS+ohEr4H4dycVXux1OSPzIhAj/+Vd
 +BTNcKt5jil19mKakiBEmCdDXsKDxDgqIswUv52qRzPhAoDyvpqENw3Wi2F96Jgoji3C/23fXi
 uig=
X-IronPort-AV: E=Sophos;i="5.69,257,1571727600"; 
   d="scan'208";a="58274490"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 29 Nov 2019 07:10:43 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 29 Nov 2019 07:10:43 -0700
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Fri, 29 Nov 2019 07:10:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F8bFgeaLeIRrojD6kIVv2DfrdrdHRfVJIELOV0jcAY7LVfqsYYDOdP8YjzYQ0exHPZxBpm9sjI+JHA8PDsSPrK4ncX8R7vTeZnkpF8jdHEmFIjv1vk4APw9BMeBrVPzDKIMC3ggIWmck0PFpdpgI1gUN2AgSgPeQOAGrDcIheQkYS7uD55uYk90v5NZv4RgsJiQ+ZU4YzD5mA8FA6icuPYZdnWJvDJ0xi2v8+XxMqSP3z4YfkPW2GZTtzszLQFmsJuXJiZx/iXjuhDiut2i8/OMKa0UOWyCUvJhk1xxtVrzW10fmxrSeVlG68rcmFdAa4TjeYN2FCYLXE2vMyxH69w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ywMW/j7IZg2yhNiCNf36pMDe8UFOhyciUrOhY4Y32L8=;
 b=idZTatw7bsEDc6bFDhBiuP9Bp/Zxq2XFss8itDa+lU0ZQLdm+mIKZ7skn210Qo0bYb+YaH667wrqK+sGd6bWML9wSBDE5PK/03I6VdSaqNgXp4wTQYOr6RA1Nsh6PEl+aSo2FOEHqM/u9LwrCY0cdfb+93oILAxgHfkACoL9EsQogYqQb9QDa84rYDI9G8gZdAzZMpLpPnuiAmK8DEwTRjpVszt0O80JWpmD3YW6bphR61aJ/aYWErNY3P/ZTj1jp4ka3mG9/DtPmEFwHTABTS1vwWTrqhUhny10zWbaWPRghE6JwA6ownrghODltrbTCFVW0mWNgfVApuQVNNSILQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ywMW/j7IZg2yhNiCNf36pMDe8UFOhyciUrOhY4Y32L8=;
 b=QnFyvvSG7RqfyRIYFp3rahoozuM9OY83ueOAU+ilRI1Rqhvi2aM54glh01uq7xYNn8kHr4mujySAPX2Z9USSEMp1OYxwMgYVSvaFFp+6iUgjR5GHQsBydIRSxikv1tVESxfEY3WOHBtDjcMlpuaPoalOOet40sVtuIJV12O4ar8=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB1916.namprd11.prod.outlook.com (10.175.87.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.19; Fri, 29 Nov 2019 14:10:42 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::9039:e0e8:9032:20c1]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::9039:e0e8:9032:20c1%12]) with mapi id 15.20.2495.014; Fri, 29 Nov
 2019 14:10:42 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <hverkuil@xs4all.nl>, <linux-media@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     <Eugen.Hristev@microchip.com>
Subject: [PATCH 2/3] media: atmel: atmel-isi: properly initialize pad_cfg
Thread-Topic: [PATCH 2/3] media: atmel: atmel-isi: properly initialize pad_cfg
Thread-Index: AQHVpr7IrYfUxuYI0kG+YYqSznzXOg==
Date:   Fri, 29 Nov 2019 14:10:42 +0000
Message-ID: <1575036609-11381-2-git-send-email-eugen.hristev@microchip.com>
References: <1575036609-11381-1-git-send-email-eugen.hristev@microchip.com>
In-Reply-To: <1575036609-11381-1-git-send-email-eugen.hristev@microchip.com>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR07CA0017.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::30) To DM5PR11MB1242.namprd11.prod.outlook.com
 (2603:10b6:3:14::8)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f2cd441e-cecb-48a3-ec74-08d774d5eb0f
x-ms-traffictypediagnostic: DM5PR11MB1916:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB1916E2396FB7A002060AF9ADE8460@DM5PR11MB1916.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2582;
x-forefront-prvs: 0236114672
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(366004)(346002)(396003)(39860400002)(376002)(199004)(189003)(66446008)(102836004)(6506007)(36756003)(71190400001)(76176011)(386003)(316002)(99286004)(71200400001)(66946007)(6512007)(110136005)(66476007)(66556008)(4744005)(64756008)(3846002)(5660300002)(6116002)(107886003)(14454004)(52116002)(186003)(14444005)(256004)(26005)(66066001)(478600001)(50226002)(2201001)(6436002)(2906002)(11346002)(2501003)(8936002)(305945005)(2616005)(81156014)(81166006)(446003)(86362001)(6486002)(8676002)(4326008)(7736002)(25786009);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB1916;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dR+VQAk9Jxx8JXRTYxef4T0CgixrsQCQF0J+9wbn9VWy4x4JM7xiYXpZ5UGEBqH21b73TtX/3sIOE+zi+A9NRNEcOv+ZiRaj1XmilyBQL3NsThoQhZe6cbWR6cX7jZDrODvms6NMxRkPrQqY3PRVIdA1pJE6yQm4iwXiJMgAAFQpVabIC1896xSsgwChnpCv7EXSKZUCXYHqQdcdPu7p63HodGbMMqD7yY6EKIWn25YDVFcALbwDXE0v5J17YClLASXnJhY9p1H23HA36kZvEFMnhBf12CwQUqhHIHlMOeNHJIPdo2LLXXgPHuSQYiWS//D9sSXW8C4yDVrcqtc4z3SgHUcIguKOlGAaE9GE1PdKpIhyjXAa4eb6S1W9fGI0ESdDM5ixXdQeFGTJQrOiqVlz5LMLtXiIk+KyXTYJG8wShFD4eQm/oPy5xLDL31u5
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f2cd441e-cecb-48a3-ec74-08d774d5eb0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2019 14:10:42.1287
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 291QD5EHafCodJtMGJnP4C25/WRnVGqoowODuLQlaOgdw9q4bgwvEZKECNriehSYjebhhouvWRRbrPTnonbWmB9Utvmsvtin8gBzEFHyj94=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1916
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Eugen Hristev <eugen.hristev@microchip.com>

In try_fmt, properly initialize the pad_cfg variable to zeros.
This can be used by various calls from the subdev, so it's better
to have it initialized.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 drivers/media/platform/atmel/atmel-isi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/atmel/atmel-isi.c b/drivers/media/platf=
orm/atmel/atmel-isi.c
index 35c1f1a..59d4c9f 100644
--- a/drivers/media/platform/atmel/atmel-isi.c
+++ b/drivers/media/platform/atmel/atmel-isi.c
@@ -560,7 +560,7 @@ static int isi_try_fmt(struct atmel_isi *isi, struct v4=
l2_format *f,
 {
 	const struct isi_format *isi_fmt;
 	struct v4l2_pix_format *pixfmt =3D &f->fmt.pix;
-	struct v4l2_subdev_pad_config pad_cfg;
+	struct v4l2_subdev_pad_config pad_cfg =3D {0};
 	struct v4l2_subdev_format format =3D {
 		.which =3D V4L2_SUBDEV_FORMAT_TRY,
 	};
--=20
2.7.4

