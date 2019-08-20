Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1088095D8E
	for <lists+linux-media@lfdr.de>; Tue, 20 Aug 2019 13:39:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729574AbfHTLhu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Aug 2019 07:37:50 -0400
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:11421 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729421AbfHTLht (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Aug 2019 07:37:49 -0400
Received-SPF: Pass (esa3.microchip.iphmx.com: domain of
  Eugen.Hristev@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="Eugen.Hristev@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa3.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa3.microchip.iphmx.com; spf=Pass smtp.mailfrom=Eugen.Hristev@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: 8sKL/FGgKzumXMl0jW1v8uel1LeQUtZSXTnLEYAi8fAWvJYVdPz2iV4TGdFN52jEolQW/V7sW6
 Q4JyKP+GZvx1joUvp0ZyasoyrXM7IAKiU7vwOnH0j9pVKKG4g5dL02cHjpb0xQF65ufi9K84n7
 YOX5rSPdp4u9KU+6z+PS9vgHjX9UZgin90NLuT0LMJWQ/VTfaMjajHfOJp3QPkPG+T2Gf/U1eP
 Slgqhvnf9fznx1JfOwG8i+/KHVyntBxiIr+nmnLaa9mC7wn//TZFy24eBIvxCWbsDI5nW8SWUh
 br8=
X-IronPort-AV: E=Sophos;i="5.64,408,1559545200"; 
   d="scan'208";a="45902954"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 20 Aug 2019 04:37:47 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 20 Aug 2019 04:37:47 -0700
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 20 Aug 2019 04:37:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GLqld7jTuREuMIULK7pNc8WfxPDE6LwP80dJEKkEFtQeNxLSiZEAZffC/l+cef5RxAy/ngZykaD5cdvHNq9n8fu4BvYOxo5ztrogPyYk0qYayBsyjSSuNY/BO3c/dmZWO5iOadtI5Th9AES0gQ6huUg0YOlYGCis5IVjEOiiJndcdP+i1ICvNkLsrmzw6jqbr1voYnV5y753hcFJmBgvWqeH1oy/jhZZJw/lwVu/ZB0pCZTAeUSdn6RvOdvgcy/MB4F1WLW/DTx4xVA9fm6+9Ry7p7sTw7PQitF4saVQBvd8uAFhw4E+MWviPHDzS5GWNbbTsEcoGz4mjEx4aFjNvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TaOrdYzh7WtX0uWCmQc+CzyIWLxq6H3d91Vrj6tveQk=;
 b=U4Pd4J1f2mSdi/pSOxkQGnLwjPVfl1k/9nGfG0gv0aApAt9pptY8bQp1YzczhYa1B0U0T19Z6NrDwacgxBgYFCCTbPhP69V1+03QUIZbiImAkeYOLJY0VKRbsWwmb0UFLuiipzKcdnkoopHGgWLrgNhXH7yTxqHD2eQpqBxCTNl2NAStgzUD8CnM40qFyKrs5MZOjNiow3CJ6IVrUm5VvHrnynK8SCFCMJv2nUvNH/ylJlUrDxLnBpsGcTOg+zP5gRCfqxfnTUJ8AyGaEZFzUY8RvjAaDOh77QvL9JBF8eTIz9ltqFvkzvSzykc7HMYD6r1LUDhXN2l9/wMRu7DLkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TaOrdYzh7WtX0uWCmQc+CzyIWLxq6H3d91Vrj6tveQk=;
 b=SJ1JHjXTLIQfsvGogBThSlYZrGfhDpOYsI4i5P7APAGD5KCUAu/Qe1ygVHQ3aEQbSi4Mp3RsZQdUA4mTsPfzJt9FEqKFbwmbdxDkmDSrcHRNwPfIAHeW+lwRZXLcKM4M/n382vBZ/MimP++9snXpLcXS5Xcgz9A2P2Cu7qBTG0s=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB1258.namprd11.prod.outlook.com (10.168.108.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Tue, 20 Aug 2019 11:37:46 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::c457:dc57:6e6f:f4f3]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::c457:dc57:6e6f:f4f3%10]) with mapi id 15.20.2178.018; Tue, 20 Aug
 2019 11:37:46 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <linux-media@vger.kernel.org>, <hverkuil@xs4all.nl>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     <Nicolas.Ferre@microchip.com>, <Eugen.Hristev@microchip.com>,
        <alexandre.kroupski@ingenico.com>
Subject: [PATCH] media: atmel: atmel-isi: fix timeout value for stop streaming
Thread-Topic: [PATCH] media: atmel: atmel-isi: fix timeout value for stop
 streaming
Thread-Index: AQHVV0uvEFgDMaOaUkG282eNQvL4aQ==
Date:   Tue, 20 Aug 2019 11:37:45 +0000
Message-ID: <1566300739-3351-1-git-send-email-eugen.hristev@microchip.com>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1P194CA0053.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:803:3c::42) To DM5PR11MB1242.namprd11.prod.outlook.com
 (2603:10b6:3:14::8)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1a67e29a-2e21-4603-92d5-08d72562d1fe
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DM5PR11MB1258;
x-ms-traffictypediagnostic: DM5PR11MB1258:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB125815AF017BCAA6E66ED88DE8AB0@DM5PR11MB1258.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 013568035E
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(366004)(376002)(346002)(39860400002)(396003)(199004)(189003)(2501003)(486006)(26005)(25786009)(6436002)(305945005)(186003)(86362001)(7736002)(2201001)(256004)(6486002)(2616005)(53936002)(14444005)(3846002)(6116002)(478600001)(81156014)(476003)(316002)(52116002)(8676002)(81166006)(99286004)(54906003)(2906002)(6512007)(71190400001)(110136005)(71200400001)(4326008)(102836004)(8936002)(66556008)(66476007)(66446008)(14454004)(66946007)(50226002)(36756003)(66066001)(5660300002)(64756008)(6506007)(386003);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB1258;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: kHSEubVE6o5P1IlGzWYl7nk/SUwY0hJ/mZ3KDhg/2p7xr33cCAnVu064vmkdedhDqegaUZlWEKtVcc4GwUZkDPYlO/CUZxl7E13Tsf6miG/60KapH6hyoOCT02kVfBp7jfTHKX4ceA4WSBQj0QGGE2IdUjZpXp/l74NThPKoMO7RyPbSDbvXfworrKiSWf8PeNIykNVc6Bao6PUB/DYpO0ziTinCkyAOK6RYacuVZ83HUEPcKUa+cI7q5QSOsFeleed/xsSSkRP6y7MMajetEr00Oljc8kLVhQlmS3mqwjbbx1R6JDXQYIqBrO1VlU/bn/2N5ZRXqykBdk6Ojsa+YZ49vSmp2/HxgkPzd+Z/Q5y1vElhNynTwjh44H1tZN6KiJqrAfADska8eVo11OhEilfKjUulmdyV2+L8jE+6FKk=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a67e29a-2e21-4603-92d5-08d72562d1fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2019 11:37:45.9877
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P8olKa8mpzPJbOo0qfcmUJWmGSI1UoR5XgVLIdlFQQVpks9AJR7qCzEKbWp2f59Yf5X0rb1QuCvsqMGsvg/13hyMsj4zG2RgmvgcLyvEC6U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1258
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Alexandre Kroupski <alexandre.kroupski@ingenico.com>

In case of sensor malfunction, stop streaming timeout takes much longer
than expected.
This is due to conversion of time to jiffies: milliseconds multiplied
with HZ (ticks/second) gives out a value of jiffies with 10^3 greater.
We need to also divide by 10^3 to obtain the right jiffies value.
In other words FRAME_INTERVAL_MILLI_SEC must be in seconds in order to mult=
iply
by HZ and get the right jiffies value to add to the current jiffies for the
timeout expire time.

Fixes: 195ebc43bf76 ("[media] V4L: at91: add Atmel Image Sensor Interface (=
ISI) support")
Signed-off-by: Alexandre Kroupski <alexandre.kroupski@ingenico.com>
Reviewed-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 drivers/media/platform/atmel/atmel-isi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/atmel/atmel-isi.c b/drivers/media/platf=
orm/atmel/atmel-isi.c
index d7d94c1..428f117 100644
--- a/drivers/media/platform/atmel/atmel-isi.c
+++ b/drivers/media/platform/atmel/atmel-isi.c
@@ -493,7 +493,7 @@ static void stop_streaming(struct vb2_queue *vq)
 	spin_unlock_irq(&isi->irqlock);
=20
 	if (!isi->enable_preview_path) {
-		timeout =3D jiffies + FRAME_INTERVAL_MILLI_SEC * HZ;
+		timeout =3D jiffies + (FRAME_INTERVAL_MILLI_SEC * HZ) / 1000;
 		/* Wait until the end of the current frame. */
 		while ((isi_readl(isi, ISI_STATUS) & ISI_CTRL_CDC) &&
 				time_before(jiffies, timeout))
--=20
2.7.4

