Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37CE611E0CD
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2019 10:33:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726170AbfLMJdX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Dec 2019 04:33:23 -0500
Received: from esa4.microchip.iphmx.com ([68.232.154.123]:9955 "EHLO
        esa4.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725770AbfLMJdX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Dec 2019 04:33:23 -0500
Received-SPF: Pass (esa4.microchip.iphmx.com: domain of
  Eugen.Hristev@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="Eugen.Hristev@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
  include:servers.mcsv.net include:mktomail.com
  include:spf.protection.outlook.com ~all"
Received-SPF: None (esa4.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa4.microchip.iphmx.com; spf=Pass smtp.mailfrom=Eugen.Hristev@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: 2esgwzcydvnN0CZF2mCDkfWt9iqqDzs0zjwP+hCxWQGONAN6ejjd/se1tCtf1U+Cgfq1K1vjR+
 OeiLRP67T/qhYTbpi31Ptz3VPm/d5sGJISSZCGqw0Gfp0qo6mPOYmDqWUM4kxZWh2UK3RM9xP7
 pg6eQCqS7wBhEhmi6KGJmD10wPYr6Xuct+i6WwmpG9ii8tyXVUdFTon3cjoX/h0/XntrGa/GkB
 pUitKKD2Mo3N91O31GFaPLrM1p2E90xGDbV5OCKKCrlP+RjF/UZLwelgIDlbngVXmph0euFAN9
 1P4=
X-IronPort-AV: E=Sophos;i="5.69,309,1571727600"; 
   d="scan'208";a="58427354"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Dec 2019 02:33:21 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 13 Dec 2019 02:33:21 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 13 Dec 2019 02:33:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AbbEoyA2wT0W4HlLo+1WuOlLx6UT6BBNjJrGhCOGsWrJRXVQiBouWIhemVJnlk6y1SxDPMGzdyh/OOa9JsL4BhAsNjinQP14xUxHnDMC/GabXOLyLu5CH2J3LVaYCUbKZadGk1BkeB4mGvCd7NZEsQoAequbDxydM6dINQBfH080HjEEmuq8ZKD5HIOV3hG2A4+zyhnaXdYkiGZPbAvvAZcUw+1pLTRSMnfu+0GN1HBBnkB213xygByD1ty0C+M7BdJE2OfkvDLQ/6252je+QD+iU9tWj/5YfnOimz0i8lPPrzqM13BvhJoK2ETraYtMTZNrax1wd0Pa2oKEFJ4MWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NWL4xaqa8Aebz8U6PVDisRBSXu4HS8gm2jSOJzYM9qg=;
 b=QKQIpXo7HJ2HPZCMbANz8XT2+c1AFfjZaYOhQTlhQpzvDqT9AG0/susctJdgL6b8b7EaA+U/s2hyfSn9U13OL/t5DUicrUpaAFZF0Dp+MKfTj0o5Ug53vOJP1xPIeAM4GCzXfaijSoDHPoFMtGjylvptgx/jzc0H0RWLL+NXINUAEwEFEgwpaituMmNdzDcKWxjLsFOhYuh4xu9ohXMnclbPs8VnyFUHEnc9ejKc8jvrLTpvm04g5rCsC7NR2I5xaMf/zUpWAbAWn943mXUEdmRwKDNSRZIAaYLaJeGu9riiK0YVb7r6cVzmRUXxrhrReekUZXF2ntOF+m2ji+G7lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NWL4xaqa8Aebz8U6PVDisRBSXu4HS8gm2jSOJzYM9qg=;
 b=l6EwV27PP/2BuSgvgwxsD19YpBxGOYtapevPbSrU/K8gZW4DwKawI4XWIhCx8hl/WXQWMry3s9AqMFzIjkJyW6nLfd9fBiHe7SBMi0P4dUfpq3wYpZljEbZhnxh5xMExe2jKb9fu6lBlVSRCizXQ8GWiC8Dn2c5o40OTIFyRdcQ=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB2027.namprd11.prod.outlook.com (10.168.103.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.18; Fri, 13 Dec 2019 09:33:18 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::9039:e0e8:9032:20c1]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::9039:e0e8:9032:20c1%12]) with mapi id 15.20.2516.018; Fri, 13 Dec
 2019 09:33:18 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <hverkuil@xs4all.nl>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC:     <Eugen.Hristev@microchip.com>
Subject: [PATCH v3 2/2] MAINTAINERS: add atmel-isc-media.h file to ATMEL ISC
 driver
Thread-Topic: [PATCH v3 2/2] MAINTAINERS: add atmel-isc-media.h file to ATMEL
 ISC driver
Thread-Index: AQHVsZha/YyQOScMkU6LIr0rB25YYA==
Date:   Fri, 13 Dec 2019 09:33:18 +0000
Message-ID: <1576229557-27001-2-git-send-email-eugen.hristev@microchip.com>
References: <1576229557-27001-1-git-send-email-eugen.hristev@microchip.com>
In-Reply-To: <1576229557-27001-1-git-send-email-eugen.hristev@microchip.com>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.7.4
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7dd1e5d2-5c32-4b2e-2133-08d77faf7ce8
x-ms-traffictypediagnostic: DM5PR11MB2027:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB20271CB777351861A4DFC8CCE8540@DM5PR11MB2027.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:361;
x-forefront-prvs: 0250B840C1
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(346002)(376002)(136003)(396003)(39860400002)(189003)(199004)(76116006)(91956017)(4744005)(478600001)(8676002)(6506007)(5660300002)(71200400001)(2616005)(66446008)(66946007)(66476007)(66556008)(64756008)(110136005)(2906002)(6512007)(316002)(4326008)(86362001)(107886003)(26005)(36756003)(186003)(81156014)(81166006)(6486002)(8936002);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB2027;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 01i2FiP4EPlFajWwEiZA4Oby1NmOZavRzM6qDF/1I64LTSMIVwhKQvRxhtSou49HFMDdymbLbkBNnkxwNmyS2IKZJvB66cbNCCZlm9zb6jFuon0jFQRqBhR6zFdpEbfdZ92QdeSL3YGksOCKdACwi3lprg4XySL1xZ90fmvnMpa4XHwof1+FIfgPKeb/BMNdzQs/9Oin7E0eP6mYJ/KZIhX6OKl+/lD4UV1BRR/9rX/Y7tVes5sKYnT45YYmjGTU0m/Xq/BNtTB2iKQpY193XB3xRHkd/l43vN9YbTwDyYtexVc0l0y4F0QchUyl3taB3ma1O6pd1FJ25JpwJIYq27TIGG1qIyjkJdeLuxdSKLBC8RytlqpsFIcgG5jY2isDRE/k7qVMKPiMJJjKuCAbJ7EfdPycx+lta9JLp0bkVAJWgGBIDFKucqz8tvtY28vv
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dd1e5d2-5c32-4b2e-2133-08d77faf7ce8
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2019 09:33:18.7206
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0oweiliZTKe7327CNlPszXxH7C/q4z4zp0hiGxWIYfiFBBLMTKd8TwE54hIH7y27VksXmElnvgQZ4TqCGR+VprCf94iv9RvTLzF6zN936tw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB2027
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Eugen Hristev <eugen.hristev@microchip.com>

Add new file include/linux/atmel-isc-media.h to ATMEL ISC entry.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 02d5278..66c2195 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10825,6 +10825,7 @@ F:	drivers/media/platform/atmel/atmel-isc.h
 F:	drivers/media/platform/atmel/atmel-isc-base.c
 F:	drivers/media/platform/atmel/atmel-isc-regs.h
 F:	Documentation/devicetree/bindings/media/atmel-isc.txt
+F:	include/linux/atmel-isc-media.h
=20
 MICROCHIP ISI DRIVER
 M:	Eugen Hristev <eugen.hristev@microchip.com>
--=20
2.7.4
