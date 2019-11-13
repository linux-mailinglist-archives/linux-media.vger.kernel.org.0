Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B0E8FB306
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2019 15:59:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727884AbfKMO7W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Nov 2019 09:59:22 -0500
Received: from mail-eopbgr00071.outbound.protection.outlook.com ([40.107.0.71]:62822
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726251AbfKMO7W (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Nov 2019 09:59:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KKaxpPiVkRSu8+mRQQ30zNvQDhnVW+z5UDOfk8FrrD0f30lBQL9Adg4FUWnCMN+upMpTaqvBFUU1n8AFk5R6JF3ZkrqUPrj/Oz/Pn3m1/5mH9IlRiFtaZtkv+Y3R/CLFKYhqd94QUhCHSqqtgZ2E8UCTzKLQ9ojqkexpEcqlvzFE5Qv4Ejum6K6sJlgCuyQY0u3FI+PZpXA47HDLAqFhRy6pDeSCOEByaEuQYaeMk98pANthO/7jiKDY6VVlJMaoKBNnY6p2hnplCk65x8VHeGKgPWa/cV6wcfblO7zs+vYltCIOy+srKMmEUTmrx2oxmZZ1Wg+BT+W+ZlBbAMQIig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ta5couTE4b7hBK1YOwypwYIHRTqYSwJtihLmm/O9l0E=;
 b=nHobaN+xADPLEd7h/7xLK+iMcRFucVkZ1LdpPRYjKWETa//ERXV2of2F8Xl+c40Xn10XE90+pdp3PDG0k+kQeg69A8deYQ2E0hyIu2HCLo84KzIHJmt1z2RvHjfuT0gfG2rvknI583pSFi/woEY3uCD7E8BTT8xAIu0HLhFAmA3b0QMX4zl84VWJ2alR7d8ABNaHw/MOpeAUN+1IVONPT1es/zC3X8TiATevQpHXsvMKWMuoxOoUER2n3yrugi1IwCqGKSM9z27CZXPrP1qXbPefguGPiyEfjXT4XCtNpVp7g3Ie2qmoHhNyoxI1VDiwSViAEJwXzZkFMwCWv+JA5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ta5couTE4b7hBK1YOwypwYIHRTqYSwJtihLmm/O9l0E=;
 b=XCnzxz1dYuYVPiTRPq3gR6BERM+QRHIpK4f38cRhuVc8T9S0HUNZiGkWYEStO9us5Q1b82B/TvAzete4Uf/M0eHEC7t3q7bSVxSoV9lgS5xCoL3ew3/Bg0ePvHDT36I86bFMcjeP8O77BUZT+1wKibuWIOzTv5Ook04KRtKNILU=
Received: from VI1PR0402MB3918.eurprd04.prod.outlook.com (52.134.16.148) by
 VI1PR0402MB2768.eurprd04.prod.outlook.com (10.175.24.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.25; Wed, 13 Nov 2019 14:59:17 +0000
Received: from VI1PR0402MB3918.eurprd04.prod.outlook.com
 ([fe80::8997:3705:3f41:1d1b]) by VI1PR0402MB3918.eurprd04.prod.outlook.com
 ([fe80::8997:3705:3f41:1d1b%7]) with mapi id 15.20.2430.028; Wed, 13 Nov 2019
 14:59:17 +0000
From:   Mirela Rabulea <mirela.rabulea@nxp.com>
To:     "ezequiel@collabora.com" <ezequiel@collabora.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
CC:     dl-linux-imx <linux-imx@nxp.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "laurent.pinchart+renesas@ideasonboard.com" 
        <laurent.pinchart+renesas@ideasonboard.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Laurentiu Palcu <laurentiu.palcu@nxp.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "paul.kocialkowski@bootlin.com" <paul.kocialkowski@bootlin.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Robert Chiras <robert.chiras@nxp.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "niklas.soderlund+renesas@ragnatech.se" 
        <niklas.soderlund+renesas@ragnatech.se>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        "dafna.hirschfeld@collabora.com" <dafna.hirschfeld@collabora.com>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
Subject: Re: [EXT] Re: [PATCH 4/5] media: imx-jpeg: Add V4L2 driver for i.MX8
 JPEG Encoder/Decoder
Thread-Topic: [EXT] Re: [PATCH 4/5] media: imx-jpeg: Add V4L2 driver for i.MX8
 JPEG Encoder/Decoder
Thread-Index: AQHVlLXUJKJQ4nqFd0+df7BWHNBYIqeJLAWAgAAQZQA=
Date:   Wed, 13 Nov 2019 14:59:17 +0000
Message-ID: <1573657156.16477.47.camel@nxp.com>
References: <1573053633-21437-1-git-send-email-mirela.rabulea@nxp.com>
         <1573053633-21437-5-git-send-email-mirela.rabulea@nxp.com>
         <58ed179388b6f9d6caddd91dc03e411ca714157d.camel@collabora.com>
In-Reply-To: <58ed179388b6f9d6caddd91dc03e411ca714157d.camel@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.18.5.2-0ubuntu3.2 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=mirela.rabulea@nxp.com; 
x-originating-ip: [92.121.36.198]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 84cf8734-278c-4413-16c7-08d7684a0e6f
x-ms-traffictypediagnostic: VI1PR0402MB2768:|VI1PR0402MB2768:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR0402MB2768A7E64DB0954021C4CA878F760@VI1PR0402MB2768.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0220D4B98D
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(396003)(366004)(346002)(136003)(376002)(199004)(189003)(305945005)(7736002)(7416002)(486006)(64756008)(81166006)(71200400001)(71190400001)(91956017)(5660300002)(316002)(36756003)(54906003)(66946007)(2616005)(81156014)(99286004)(446003)(8676002)(476003)(2501003)(66476007)(186003)(256004)(14444005)(66446008)(66556008)(14454004)(76116006)(110136005)(76176011)(102836004)(26005)(6506007)(44832011)(11346002)(66066001)(6512007)(6486002)(103116003)(2906002)(2201001)(6246003)(6116002)(3846002)(478600001)(4001150100001)(8936002)(50226002)(25786009)(6436002)(86362001)(229853002)(4326008)(99106002);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR0402MB2768;H:VI1PR0402MB3918.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +V1qNwJ+4kdRRsYaB3csFqnUz1OS7Hha4xbx5ERp+WPYEAkuzX95EvoLuF0z3drnGwnM7b5vq0RLECQJIs+UDIgEw/37Fo4YeI+eZwK1AczZ9TlTMYrACWEkgCdMXaJKwevZl9zUcrrMixQdiz/8MckL7K0/Cspo51M7v8Y8XYLhTzy5FSwD/TMrVvSpZyMFIEpw2DfspSz2sbFxBMff7LphJlimbrpYHIuEc4e/F+6TMduQGjxZY3r/COuBiijFe2+hE+/p+o6xNupLm5qaTEKUm5LhAFtraQppsHav1L06fI79aWh0uLkeTB+MWfqeJZo4zjZM17vztSFIuBAn/NcmMRwYEdnvszixUb/yHKhXGESpLE//KIfv51Rebe+YPt/umpzvnTmiZbum4YdrEHjfGr7LT+67ATzBByFLXUyHmgtzQyBy1P1MYgIHTAwT
Content-Type: text/plain; charset="utf-8"
Content-ID: <573912F2CC39B8428C4335951F2C3F16@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84cf8734-278c-4413-16c7-08d7684a0e6f
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2019 14:59:17.3425
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5kmn+kb+MEUceJsTiK87OiV2xyCU1T6JHKktadjNCX7KTfy8x25Ph6ulnT3FGwJ2zjlHwN4v/sVrSSl7RYIpuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2768
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgRXplcXVpZWwsDQpPbiBNaSwgMjAxOS0xMS0xMyBhdCAxMTowMCAtMDMwMCwgRXplcXVpZWwg
R2FyY2lhIHdyb3RlOg0KPiArICogZGVmYXVsdCBjb25maWd1cmF0aW9uIHN0cmVhbSwgNjR4NjQg
eXV2NDIyDQo+ID4gKyAqIHNwbGl0IGJ5IEpQRUcgbWFya2VyLCBzbyBpdCdzIGVhc2llciB0byBt
b2RpZnkgJiB1c2UNCj4gPiArICovDQo+ID4gK3N0YXRpYyBjb25zdCB1bnNpZ25lZCBjaGFyIGpw
ZWdfc29pW10gPSB7MHhGRiwgMHhEOH07DQo+ID4gK3N0YXRpYyBjb25zdCB1bnNpZ25lZCBjaGFy
IGpwZWdfYXBwMFtdID0gezB4RkYsIDB4RTAsDQo+IEkgdGhpbmsgaXQncyB0aW1lIHRvIHJlLWNv
bnNpZGVyIGNyZWF0aW5nIHNvbWUgY29tbW9uIGNvZGUNCj4gZm9yIGRyaXZlcnMgdGhhdCBkZWFs
IHdpdGggSlBFRyBwYXJzaW5nLiBJIGRvbid0IGtub3cNCj4gZXhhY3RseSBob3cgdGhpcyBzaG91
bGQgYmUgZG9uZSwgYnV0IGl0J3Mgd29ydGggYSB0cnkuDQo+IA0KPiBIYXZpbmcgYmVlbiB0aGVy
ZSwgaXQgbWlnaHQgc291bmQgdW5mYWlyIHRvIHJlcXVlc3QgeW91IHRvDQo+IHRha2Ugc3VjaCBh
Y3Rpb24uIEhvd2V2ZXIsIHNvbWVvbmUgaGFzIHRvIGRvIHRoZXNlIGtpbmRzDQo+IG9mIGNsZWFu
dXBzIGFuZCBpbXByb3ZlbWVudHMsIHNvb25lciBvciBsYXRlciwgaWYgd2Ugd2FudA0KPiB0byBr
ZWVwIGEgY2xlYW4gY29kZWJhc2UuDQo+IA0KPiBIb3BlIHRoaXMgbWFrZXMgc2Vuc2UuDQoNCkkg
YWdyZWUsIGl0IG1ha2VzIHNlbnNlLCBhdCBsZWFzdCB0aGUganBlZyBwYXJzaW5nIGlzIHNvbWVo
b3cgY29tbW9uDQpiZXR3ZWVuIHRoZXNlIGRyaXZlcnMuIEknbSB3aWxsaW5nIHRvIGNvbnRyaWJ1
dGUgdG8gdGhpcywgYnV0IEkgY2Fubm90DQptYWtlIGEgcHJvbWlzZSB3aGVuLCBhbmQgdGhpcyBp
cyBzb21ldGhpbmcgdGhhdCByZXF1aXJlcyBjb2xsYWJvcmF0aW9uDQp3aXRoIG90aGVyIGNvbnRy
aWJ1dG9ycyB3aG8gaGF2ZSB0aGUgbWVhbnMgdG8gdmFsaWRhdGUgY2hhbmdlcyBvbiBhbGwNCnRo
ZSBoYXJkd2FyZSBhZmZlY3RlZC4NCg0KUmVnYXJkcywNCk1pcmVsYQ==
