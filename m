Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DABA0FB0DC
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2019 13:53:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727064AbfKMMxF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Nov 2019 07:53:05 -0500
Received: from mail-eopbgr30061.outbound.protection.outlook.com ([40.107.3.61]:30958
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726185AbfKMMxF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Nov 2019 07:53:05 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l+2qpdBmlSIWNb0/sqxvJjPF3bWWp1jJ7/B+j+DWNyukC4eUoiNX0vJ3YSE5VvbvcaD1OVAIR9/0q8j88gRWWdZRQMJHk3QvxLpRSZmKUU1fWSXvdPYEf6ViCK6Znk6qyo6gS9SGWQEjqrsKuXrd34JKaKhiW12gzmFXra6F8u/wFNLbYHgv4JTtpHiIyTnjzLbE7PH4dTAXKxNUTa7fw47cAiqiK4YWNz79DinrEDnch/CImnEv+LLgpVYVmaW4MeE3oyHt+JXuHSQpd88bsWhvxgtsTAILWXxTeztCXUOcF9sSncue5ut9BSKjvTarOgjk1wcW7v2J45ylftyQzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v51jS1YbWoU2bWpd7iOpJZoCSZ9pXOl6bHwY/TGI6hU=;
 b=MTuNnb/GP+waP3xYsmie/C9hLSfTgwxK2NtK0tdpVl9BfedvJggF30Iq6v/HHyCw7He/+g2sbU03KJirGCsWVaz2IVbYyKYOZSPUA/vgOnBYDZAkYNjQ6fHMdI6zLj6DIOUohCQFadW+yRCi7XINrK6vHPV8U6hubi9M8qo4TpWtmtyARlYWpt+jsKZch2kyZ7rBGC3Jb5ZgOBUXAD/iskXGddGpsSX1bF16gg5kJWU0D6oYRT77ezfmC+cRANCsVepXspTtUeCuad7qVgtxgKddnKFtmlU+9sWo+q1MSlaWag8z+qyJubrK5VE0Z+zPqU+8rub+OUZYjn6H5AAJJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v51jS1YbWoU2bWpd7iOpJZoCSZ9pXOl6bHwY/TGI6hU=;
 b=Fu4JZWt6zTA12fV3XU01fhZcNPQxMvxwy6TamPjTPSUM9oVktuRQpwNikwMjsZDMuBASTOjmEGmhPJvUZVNihXmkzMG7BF8pN7S5QU4DBCb7jhcQ3xicU2p3GF5sAyWH8PweXYQTVGSSJiMrjmyPPv5+Un7qe0a2B43v4TiTG7I=
Received: from VI1PR0402MB3918.eurprd04.prod.outlook.com (52.134.16.148) by
 VI1PR0402MB3773.eurprd04.prod.outlook.com (52.134.14.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.25; Wed, 13 Nov 2019 12:52:53 +0000
Received: from VI1PR0402MB3918.eurprd04.prod.outlook.com
 ([fe80::8997:3705:3f41:1d1b]) by VI1PR0402MB3918.eurprd04.prod.outlook.com
 ([fe80::8997:3705:3f41:1d1b%7]) with mapi id 15.20.2430.028; Wed, 13 Nov 2019
 12:52:52 +0000
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
Subject: Re: [EXT] Re: [PATCH 0/5] Add V4L2 driver for i.MX8 JPEG
 Encoder/Decoder
Thread-Topic: [EXT] Re: [PATCH 0/5] Add V4L2 driver for i.MX8 JPEG
 Encoder/Decoder
Thread-Index: AQHVlLXLzR/BR8Qmu0iHDS94ZPyJ2qeHv+UAgAFZNAA=
Date:   Wed, 13 Nov 2019 12:52:52 +0000
Message-ID: <1573649572.16477.40.camel@nxp.com>
References: <1573053633-21437-1-git-send-email-mirela.rabulea@nxp.com>
         <b84f3c8c3913de6d897ad91576afe0df913c7d98.camel@collabora.com>
In-Reply-To: <b84f3c8c3913de6d897ad91576afe0df913c7d98.camel@collabora.com>
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
x-ms-office365-filtering-correlation-id: a20b57b0-8713-42d8-db24-08d7683865b0
x-ms-traffictypediagnostic: VI1PR0402MB3773:|VI1PR0402MB3773:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR0402MB3773FED84A1CB6D19F987BE38F760@VI1PR0402MB3773.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0220D4B98D
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(346002)(39860400002)(376002)(396003)(136003)(189003)(199004)(76176011)(2201001)(64756008)(14454004)(66476007)(66446008)(66556008)(86362001)(5660300002)(102836004)(256004)(7416002)(478600001)(305945005)(36756003)(91956017)(2501003)(7736002)(4001150100001)(6506007)(76116006)(66946007)(486006)(316002)(66066001)(6116002)(81156014)(54906003)(6246003)(71190400001)(71200400001)(6486002)(229853002)(8936002)(25786009)(99286004)(6436002)(50226002)(11346002)(81166006)(26005)(3846002)(186003)(103116003)(4744005)(44832011)(476003)(4326008)(2616005)(2906002)(6512007)(446003)(110136005)(8676002)(99106002);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR0402MB3773;H:VI1PR0402MB3918.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5HslXcSKew54QwzzIe58FOnCwubDVTXGzSer0CgQK7M+Qae01sRKG8cabtuiWqQWTu0dsWXzC9Chytn7kRNzy0LpiWU68ZGjh38YSRVSZnqh0W8ouuTMlNC12a8GAc9owZ83/dYAVEZ5aS7W/FkUuSGxslFN1zs9ByPfk2IN8HrjjOe35G2Gl3k7Jpog8LsOJ8owUPqCKy3PyCbpT5f3nqkX68I5xQTG4B6IndjC68/NhmRA0h9oKdKDouzbezipTNwrEUEyxhdlMpynADOXnckdSxOwBLDg2aXyU4V7A667D3p57Q5Pit8PearMVy2beWIZWbAoYwPQlMcwS8QZZYCNpFTWKQxNZGvO7wnYlEm7dPMXXmayII3RcC+ib495SzRbJHSUJoG9k6dyu2z7jTV8+hRQj7/WXtQZjw9JTab3Ug7sO0wphh2641oRYFh5
Content-Type: text/plain; charset="utf-8"
Content-ID: <5CB67F455DDFD44CA512C82CC196E5C5@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a20b57b0-8713-42d8-db24-08d7683865b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2019 12:52:52.8161
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OhR1pdayjNdO7KJ2VuPzkkGo2zkT9lJLURCjyHEj294q7+gz9ZpwhlbPguepaqvjStFPmDb+PN2Yr/O6DMynBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3773
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGnCoEV6ZXF1aWVsLA0KDQpPbiBNYSwgMjAxOS0xMS0xMiBhdCAxMzoxNyAtMDMwMCwgRXplcXVp
ZWwgR2FyY2lhIHdyb3RlOg0KPiBUaGlzIHBhdGNoIHNldCBhZGRzIHRoZSBWNEwyIGRyaXZlciBm
b3IgaS5NWDhRWFAvUU0gSlBFRw0KPiA+IGVuY29kZXIvZGVjb2Rlcg0KPiA+IGFuZCBpdCdzIGRl
cGVuZGVuY2llcy4NCj4gPiBUaGUgZHJpdmVyIHdhcyB0ZXN0ZWQgb24gaS5NWDhRWFAsIHVzaW5n
IGEgdW5pdCB0ZXN0IGFwcGxpY2F0aW9uDQo+ID4gYW5kDQo+IFdoYXQncyB0aGUgcmVsYXRpb3No
aXAgYmV0d2VlbiB0aGlzIGhhcmR3YXJlIGFuZCB0aGUgSlBFRyBoYXJkd2FyZQ0KPiBzdXBwb3J0
IHRoYXQNCj4gaXMgYXZhaWxhYmxlIG9uIGkuTVggOE0/DQoNCklmIHlvdSBhcmUgcmVmZXJyaW5n
IHRvIHRoZSBWUFUsIHRoZSByZWxhdGlvbiBpcyBub25lLCBpdCdzIGEgZGlmZmVyZW50DQpJUC4g
VGhlIFZQVSBpcyBhbHNvIGNhcGFibGUgb2YgTUpQRUcgZGVjb2RpbmcsIGJ1dCBubyBlbmNvZGlu
Zy4NCg0KVGhlIElQcyBmb3Igd2hpY2ggdGhpcyBkcml2ZXIgaXMgd3JpdHRlbiBhcmUgdGhlIEpQ
RUdFTkMgYW5kIEpQRUdERUMsDQphbmQgaXQncyBwcmVzZW50IG9ubHkgb24gOFFNICYgOFFYUCAo
d2hpY2ggYWxzbyBoYXZlIHRoZSBWUFUpLg0KDQpSZWdhcmRzLA0KTWlyZWxh
