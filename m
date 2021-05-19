Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98F4C388822
	for <lists+linux-media@lfdr.de>; Wed, 19 May 2021 09:27:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236042AbhESH2e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 May 2021 03:28:34 -0400
Received: from mail-am6eur05on2053.outbound.protection.outlook.com ([40.107.22.53]:21601
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230292AbhESH2d (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 May 2021 03:28:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GCbiuVL9Kc5WVdE0NPyEVVHTLDqG9mFRgrrNj3NdPEYOOCf8E1B2qtsMdefdrl70wyCtLlkrLkzY9Ig/jLJQU1kfm/obrUAZaj6WiRfSyv7JaKdnwh9bephyc73WldWPg/biUE9bZ1MMzIGFoqmEmpHx02dLA39FWCsTpyzOo8cNacSk98Z9qaF3R8UlkLAPxKliWPTOTfQIzFMJZk0qhc092Bq+6xrKE9CTyB3Av+9Q5tAnx+u696md4tZcSRZsATUsUILmz6ZYhzqYzI69nbpHln8tEiv2yYAx5hmkutf4cEycHzJchLDL/kntcoRM3rSr76eCnUpufXYgM/DqUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fEFQh60d7vy8XrM3MKXbYAoSk25gyhi7Qk9GPWUVwAQ=;
 b=MXizyh9B6VBfTikSZHaPVh7R/Nlnw5EsdJHh6/yOIiIILYUlzswTQsbBvKJaeZ6udS2cvHi4E5Pnn6gdf1tRYUtXzWDJi8Y/BrQgkaEocnhbn9fLlRvm66T1DTuLAWZsKx60a86pNJa8sTYTnx1TaB2W1I7O6wz7w97wNixR3AgHIT8r2cq5qCw7sIMla3Y1XbY8hKNc0pDcrsVLm+bGYt6uOCwZL1uln6daiw30ojlZqrlasQH1+X3DuYjvaqY0eb9UV1eh0u+7CC5ycVgoxO41LLsbtxmtN7zxcSEXwOnA7l4DLtHDnMyDrfCAvDXU2WbtE9vewzV/WRCRzg2eDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fEFQh60d7vy8XrM3MKXbYAoSk25gyhi7Qk9GPWUVwAQ=;
 b=K37//juePJMAEqfK6sleCYXX/PfH95jtxPaGWsILFzkoeLSFMtlnP6LI+w48B6TytI/XUMejzM2KIOOfN51zzu47nQXxgOAdWf+F+kXLpSCGxsnlvidNFKtAI4isF0HMU9UhI0KwoE2CVFX0Kt/BI2eynycvG1v3GOnBJCa6bJc=
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AM6PR04MB4904.eurprd04.prod.outlook.com (2603:10a6:20b:c::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Wed, 19 May
 2021 07:27:10 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::b10a:ad0:a6f5:db9b]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::b10a:ad0:a6f5:db9b%2]) with mapi id 15.20.4129.033; Wed, 19 May 2021
 07:27:10 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     "Mirela Rabulea (OSS)" <mirela.rabulea@oss.nxp.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "G.n. Zhou" <guoniu.zhou@nxp.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
CC:     Peng Fan <peng.fan@nxp.com>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "paul.kocialkowski@bootlin.com" <paul.kocialkowski@bootlin.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Robert Chiras <robert.chiras@nxp.com>,
        Laurentiu Palcu <laurentiu.palcu@nxp.com>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "ezequiel@collabora.com" <ezequiel@collabora.com>,
        Mirela Rabulea <mirela.rabulea@nxp.com>
Subject: RE: [PATCH v12] arm64: dts: imx8qxp: Add jpeg encoder/decoder nodes
Thread-Topic: [PATCH v12] arm64: dts: imx8qxp: Add jpeg encoder/decoder nodes
Thread-Index: AQHXTHvEa1jI4Zr9Z06VAnnUB6D4wKrqZv0g
Date:   Wed, 19 May 2021 07:27:10 +0000
Message-ID: <AM6PR04MB4966902A56A6D9B1B16BE3C6802B9@AM6PR04MB4966.eurprd04.prod.outlook.com>
References: <20210519065355.27615-1-mirela.rabulea@oss.nxp.com>
In-Reply-To: <20210519065355.27615-1-mirela.rabulea@oss.nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: oss.nxp.com; dkim=none (message not signed)
 header.d=none;oss.nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e12964bc-46cb-4d32-9044-08d91a9783e4
x-ms-traffictypediagnostic: AM6PR04MB4904:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB4904F606BE44BC24EAB97498802B9@AM6PR04MB4904.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: i4Ee6wMyFyFE086Rm2bX+2qg/n+1FRkd2+TAeHGfRWyW52t6WMioq/l0bsqEKah8jbBhw+mMYeojAN9dz59vzvs0XjXGfTPdJj0mmzTTEiKWqsI7bR9+NbOkKwRM4A1bdvGWwxoYWBv8MGIfXpXOggcrZgdHHyyuNSFPlqFYua6n96CB1rQj8Kmrl7vnjAjYWoVqMdZ2eby7m1/htgy8ATQeurmmuGRkhRZMyuehZMqkfP5AlTZXfdh3YTV+JQBKeeYYiDAXe9p7ZzAT5QlXa8GYJkhOTcuvW/SpY9vvP988w1s/Gm9ZCdTyqBlseihKBEOcRaK/ejkStdTkXS4ibj4BzBDGkr3UCrNaOOI+Wd0VoY151EEaSxKgOYVUsrw8c14iCx0jvQX4K//X12H70DWk8bJO4TDSdpWGChWUeQRTSMT8kZ+xI4XrrFZUrr547CiERSrLr+NypMxTh199k3HSjyki8E11UG4fyHtzyDNVhW/Jc4WU35zmhvw5qn3vqYidBdIwzKtnWEJJUdD9c7AscJXgZXkzLVPgTD0GGdDCuTf5zlqqx0zI+KqMaV1sBs5jxiplYryv1h3FNsS9WygutqdBzNbHoM88n0qAWOpQjKemBbvDoQ+Kv0A1bDx/ejgUyqrPnWQk23uWpAezWQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(136003)(366004)(376002)(346002)(86362001)(186003)(2906002)(478600001)(44832011)(7696005)(110136005)(54906003)(316002)(83380400001)(4326008)(26005)(66476007)(52536014)(66556008)(8936002)(64756008)(66446008)(7416002)(8676002)(38100700002)(122000001)(71200400001)(5660300002)(66946007)(9686003)(76116006)(55016002)(6506007)(33656002)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?bVptbVJPbWZlcENkQ2JvWlpDNEp1ZnhXNU9XZ2I3N2FWbndhRDRyZzBoNXAy?=
 =?utf-8?B?V1o2N0FHS3FyRTYvMTQ3cE13K0FoSERQRkExK21KbVlHbk9rc3dkOVpXV05U?=
 =?utf-8?B?aTE3cWVMeHRVR2pRV0pQOVFOK0lRRmRlQ3FyMks1Vlh0eU1UaG9kQzV6cm44?=
 =?utf-8?B?ejdLNUUvTEdxbjE3R1UrQzJQaVVYOEk3emhlakY4RjdiUnkzdjVYcVozaVRK?=
 =?utf-8?B?dEFhTkt6OGdsMDlKNTNSNExQMlZFL3dLUkRYMnJYVnNWTitLbElVVyt6YXg1?=
 =?utf-8?B?S01VRGg1TGNMemlaeld6YlplRE5Cd2Y3VTI2SkVZUkF3bXNsZk1DWXNQQlgy?=
 =?utf-8?B?SW1HVGJkL3pUU1dwaWNDVkRJcDNlNUttczBhSHhPRXcvemV2Yko2S2RqamZS?=
 =?utf-8?B?bmhTMWxWL2w5RktBODNkTlJpS3NiODBSaS9NSVNMMjhWVnlOSGtoYlZlL0tk?=
 =?utf-8?B?cHFld0xHUGpQZ3pUcTdNd3RsSXRuMVhxRGdrWHRaODN6d0N6KzdOOHJGKzRz?=
 =?utf-8?B?Q1JPMjUreFQyM0M4Qnl5c3FRanpxcDhBVW11YlFwRHk1VHBmR1VMeVk2R3Rv?=
 =?utf-8?B?Y01VMzR6QlZkNjIzSEp3TW9ZUE9NcDQwMVNkeER5M3Z5T21ac3d1SDlwNUxi?=
 =?utf-8?B?ajNVSXVwTUFNZXk0VXp1ZEJiSGZ4M1B1ZXN5a0o0N2svN1ZzQVdOcTNNbGw2?=
 =?utf-8?B?cjFLK0JsY3RkMDloeS9mNzVkazFUdU14WExtMXF6d3FvWS96bVkvRW8wZEJU?=
 =?utf-8?B?THphU3VVdkFmMCtKalVQaTlpU3ZDWnFUenN6QkpWRW1kV1MzVVZXeHk3M1RD?=
 =?utf-8?B?SVZ4U3VkQXdlL2EwemZtdlBvM09KYXBBaUxjdFp4NUZiekQ1elZDdUVtSXlZ?=
 =?utf-8?B?QXZPRGhCMUNrRDgwWjMyd0w5S1Fna0JpM0J2ZzZhV0Z1VFBDaVJDSlhCR1NT?=
 =?utf-8?B?bFlXcC93VlVFRkVMMWpMYnJhaTc3UXFyLzA0Z3NnaGJtZElHM3VoMmZ0RnRz?=
 =?utf-8?B?UFJLczBFWGl4M3BEN0xKUXRINElZOW9Hck4wVlpQLzhoY1cwaHR6T2JXY0xL?=
 =?utf-8?B?ZngxM1o3UnVpVy9pUzAwS0pEbkdEOGdzR2dUWGFaZTQ1YVFRMDd5UGEyQVdk?=
 =?utf-8?B?eUpIV0R5K205aElabFA1eWVZendhbldwWE5YdTJmVnk1bzlSajRjcHNFbFIv?=
 =?utf-8?B?YnZhT3IvbDg5dzJPUE1iZitKcWhwcmJxNUdxOCtiUis4NXA2K3Z2blZkd0E2?=
 =?utf-8?B?dk9GNGU4Q1dOczdJRURCYUdpU3pRN2U2YmtPYVNzM2x1NWtZNHh0WU1SWUdD?=
 =?utf-8?B?NVhiUEhDaHB5d2RwVmZIbkxtZkhYNmNzSWNRYzlJbFNqWGtsdnJGcG02Sm95?=
 =?utf-8?B?bjVwS0VMZllmdDlBOXU1YUdqQ2E4VFA5eDRzSzBFZ0p1QzMzZGovYXJ3U2hQ?=
 =?utf-8?B?clN4RVA5c1BUM0thaFoyT2tJamQ2VmdXUk16eGNiM3hta1FyOTk1b2NhRWN5?=
 =?utf-8?B?N1FDVzUvT2dLRCtYY1B6WXpONTlITllKb2tDMGJ6MVZJNFdVVUE0dFkyS3k0?=
 =?utf-8?B?bzJOU3Jzb0U5aDh3cndpOVZxWm5ySE5yVkRpaUNRSUdEZ05lYVkxbVFNNExV?=
 =?utf-8?B?UTZrNEVTTTB1L0dDb3lLYk5rVVQ1VEFCaENiQmFXYnFtcFRsTEVlZmRhKzhj?=
 =?utf-8?B?a2NPVXpOUHpmUFFaOHFPcW1NWU9BaEUrQ2RRYzN6VjRLcFNGKzdKVlh1WHVj?=
 =?utf-8?Q?IYDW9IJ1sjygYN7T9kux9NGMj9NVem8YpUShpml?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4966.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e12964bc-46cb-4d32-9044-08d91a9783e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2021 07:27:10.3315
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OGJRtDDHesZkH4Gp+t+p7s8L8/rMgFuMHRJg2GXcIx+/HurxopmMvbnu09QP7m/V6Fzley9QSgm4Wsdzm1vg+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4904
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

PiBGcm9tOiBNaXJlbGEgUmFidWxlYSAoT1NTKSA8bWlyZWxhLnJhYnVsZWFAb3NzLm54cC5jb20+
DQo+IFNlbnQ6IFdlZG5lc2RheSwgTWF5IDE5LCAyMDIxIDI6NTQgUE0NCj4gDQo+IEFkZCBkdHMg
Zm9yIGltYWdpbmcgc3Vic3l0ZW0sIGluY2x1ZGUganBlZyBub2RlcyBoZXJlLg0KPiBUZXN0ZWQg
b24gaW14OHF4cCBvbmx5LCBzaG91bGQgd29yayBvbiBpbXg4cW0sIGJ1dCBpdCB3YXMgbm90IHRl
c3RlZC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1pcmVsYSBSYWJ1bGVhIDxtaXJlbGEucmFidWxl
YUBueHAuY29tPg0KPiAtLS0NCj4gQ2hhbmdlcyBpbiB2MTI6DQo+ICAgQWRyZXNzIGZlZWRiYWNr
IGZyb20gU2hhd24gR3VvOg0KPiAgIC0gc29ydCBub2RlcyBiYXNlZCBvbiB1bml0IGFkZHJlc3MN
Cj4gICBBZHJlc3MgZmVlZGJhY2sgZnJvbSBBaXNoZW5nIERvbmc6DQo+ICAgLSBVc2UgY2xvY2sg
aW5kaWNlcyBmb3IgTFBDRyBjbG9ja3MgaW4gY29uc3VtZXIgbm9kZXMgKGpwZWdkZWMvanBlZ2Vu
YykNCj4gDQo+ICAuLi4vYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDgtc3MtaW1nLmR0c2kg
fCA4MiArKysrKysrKysrKysrKysrKysrDQo+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2Fs
ZS9pbXg4cXhwLmR0c2kgICAgfCAgMSArDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDgzIGluc2VydGlv
bnMoKykNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2Fs
ZS9pbXg4LXNzLWltZy5kdHNpDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0
cy9mcmVlc2NhbGUvaW14OC1zcy1pbWcuZHRzaQ0KPiBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJl
ZXNjYWxlL2lteDgtc3MtaW1nLmR0c2kNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXgg
MDAwMDAwMDAwMDAwLi4yZWU3ODk5MzBjYmMNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9hcmNo
L2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4LXNzLWltZy5kdHNpDQo+IEBAIC0wLDAgKzEs
ODIgQEANCj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wKw0KPiArLyoNCj4g
KyAqIENvcHlyaWdodCAyMDE5LTIwMjEgTlhQDQo+ICsgKiBaaG91IEd1b25pdSA8Z3Vvbml1Lnpo
b3VAbnhwLmNvbT4NCj4gKyAqLw0KPiAraW1nX3N1YnN5czogYnVzQDU4MDAwMDAwIHsNCj4gKwlj
b21wYXRpYmxlID0gInNpbXBsZS1idXMiOw0KPiArCSNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KPiAr
CSNzaXplLWNlbGxzID0gPDE+Ow0KPiArCXJhbmdlcyA9IDwweDU4MDAwMDAwIDB4MCAweDU4MDAw
MDAwIDB4MTAwMDAwMD47DQo+ICsNCj4gKwlpbWdfaXBnX2NsazogY2xvY2staW1nLWlwZyB7DQo+
ICsJCWNvbXBhdGlibGUgPSAiZml4ZWQtY2xvY2siOw0KPiArCQkjY2xvY2stY2VsbHMgPSA8MD47
DQo+ICsJCWNsb2NrLWZyZXF1ZW5jeSA9IDwyMDAwMDAwMDA+Ow0KPiArCQljbG9jay1vdXRwdXQt
bmFtZXMgPSAiaW1nX2lwZ19jbGsiOw0KPiArCX07DQo+ICsNCj4gKwlqcGVnZGVjOiBqcGVnZGVj
QDU4NDAwMDAwIHsNCj4gKwkJY29tcGF0aWJsZSA9ICJueHAsaW14OHF4cC1qcGdkZWMiOw0KDQpD
b3VsZCB5b3UgcHV0IG5vbi1scGNnIG5vZGVzIGNvbXBhdGlibGUgc3RyaW5nIGludG8gc29jLXNz
LXh4LmR0c2k/DQplLmcuDQppbXg4cXhwLXNzLWltZy5kdHNpDQoNCkJUVywgeW91IG1heSBhbHNv
IHdhbnQgdG8gYWRkIGlteDhxbS1zcy1pbWcuZHRzaSBmb3IgTVg4UU0uDQoNCk90aGVyd2lzZSwg
SSdtIGZpbmUgd2l0aCB0aGlzIHBhdGNoLg0KDQo+ICsJCXJlZyA9IDwweDU4NDAwMDAwIDB4MDAw
NTAwMDAgPjsNCj4gKwkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDMwOSBJUlFfVFlQRV9MRVZFTF9I
SUdIPiwNCj4gKwkJCSAgICAgPEdJQ19TUEkgMzEwIElSUV9UWVBFX0xFVkVMX0hJR0g+LA0KPiAr
CQkJICAgICA8R0lDX1NQSSAzMTEgSVJRX1RZUEVfTEVWRUxfSElHSD4sDQo+ICsJCQkgICAgIDxH
SUNfU1BJIDMxMiBJUlFfVFlQRV9MRVZFTF9ISUdIPjsNCj4gKwkJY2xvY2tzID0gPCZpbWdfanBl
Z19kZWNfbHBjZyBJTVhfTFBDR19DTEtfMD4sDQo+ICsJCQkgPCZpbWdfanBlZ19kZWNfbHBjZyBJ
TVhfTFBDR19DTEtfND47DQo+ICsJCWNsb2NrLW5hbWVzID0gInBlciIsICJpcGciOw0KPiArCQlh
c3NpZ25lZC1jbG9ja3MgPSA8JmltZ19qcGVnX2RlY19scGNnIElNWF9MUENHX0NMS18wPiwNCj4g
KwkJCQkgIDwmaW1nX2pwZWdfZGVjX2xwY2cgSU1YX0xQQ0dfQ0xLXzQ+Ow0KPiArCQlhc3NpZ25l
ZC1jbG9jay1yYXRlcyA9IDwyMDAwMDAwMDA+LCA8MjAwMDAwMDAwPjsNCj4gKwkJcG93ZXItZG9t
YWlucyA9IDwmcGQgSU1YX1NDX1JfTUpQRUdfREVDX01QPiwNCj4gKwkJCQk8JnBkIElNWF9TQ19S
X01KUEVHX0RFQ19TMD4sDQo+ICsJCQkJPCZwZCBJTVhfU0NfUl9NSlBFR19ERUNfUzE+LA0KPiAr
CQkJCTwmcGQgSU1YX1NDX1JfTUpQRUdfREVDX1MyPiwNCj4gKwkJCQk8JnBkIElNWF9TQ19SX01K
UEVHX0RFQ19TMz47DQo+ICsJfTsNCj4gKw0KPiArCWpwZWdlbmM6IGpwZWdlbmNANTg0NTAwMDAg
ew0KPiArCQljb21wYXRpYmxlID0gIm54cCxpbXg4cXhwLWpwZ2VuYyI7DQoNCkRpdHRvDQoNCj4g
KwkJcmVnID0gPDB4NTg0NTAwMDAgMHgwMDA1MDAwMCA+Ow0KPiArCQlpbnRlcnJ1cHRzID0gPEdJ
Q19TUEkgMzA1IElSUV9UWVBFX0xFVkVMX0hJR0g+LA0KPiArCQkJICAgICA8R0lDX1NQSSAzMDYg
SVJRX1RZUEVfTEVWRUxfSElHSD4sDQo+ICsJCQkgICAgIDxHSUNfU1BJIDMwNyBJUlFfVFlQRV9M
RVZFTF9ISUdIPiwNCj4gKwkJCSAgICAgPEdJQ19TUEkgMzA4IElSUV9UWVBFX0xFVkVMX0hJR0g+
Ow0KPiArCQljbG9ja3MgPSA8JmltZ19qcGVnX2VuY19scGNnIElNWF9MUENHX0NMS18wPiwNCj4g
KwkJCSA8JmltZ19qcGVnX2VuY19scGNnIElNWF9MUENHX0NMS180PjsNCj4gKwkJY2xvY2stbmFt
ZXMgPSAicGVyIiwgImlwZyI7DQo+ICsJCWFzc2lnbmVkLWNsb2NrcyA9IDwmaW1nX2pwZWdfZW5j
X2xwY2cgSU1YX0xQQ0dfQ0xLXzA+LA0KPiArCQkJCSAgPCZpbWdfanBlZ19lbmNfbHBjZyBJTVhf
TFBDR19DTEtfND47DQo+ICsJCWFzc2lnbmVkLWNsb2NrLXJhdGVzID0gPDIwMDAwMDAwMD4sIDwy
MDAwMDAwMDA+Ow0KPiArCQlwb3dlci1kb21haW5zID0gPCZwZCBJTVhfU0NfUl9NSlBFR19FTkNf
TVA+LA0KPiArCQkJCTwmcGQgSU1YX1NDX1JfTUpQRUdfRU5DX1MwPiwNCj4gKwkJCQk8JnBkIElN
WF9TQ19SX01KUEVHX0VOQ19TMT4sDQo+ICsJCQkJPCZwZCBJTVhfU0NfUl9NSlBFR19FTkNfUzI+
LA0KPiArCQkJCTwmcGQgSU1YX1NDX1JfTUpQRUdfRU5DX1MzPjsNCj4gKwl9Ow0KPiArDQo+ICsJ
aW1nX2pwZWdfZGVjX2xwY2c6IGNsb2NrLWNvbnRyb2xsZXJANTg1ZDAwMDAgew0KPiArCQljb21w
YXRpYmxlID0gImZzbCxpbXg4cXhwLWxwY2ciOw0KPiArCQlyZWcgPSA8MHg1ODVkMDAwMCAweDEw
MDAwPjsNCj4gKwkJI2Nsb2NrLWNlbGxzID0gPDE+Ow0KPiArCQljbG9ja3MgPSA8JmltZ19pcGdf
Y2xrPiwgPCZpbWdfaXBnX2Nsaz47DQo+ICsJCWNsb2NrLWluZGljZXMgPSA8SU1YX0xQQ0dfQ0xL
XzA+LA0KPiArCQkJCTxJTVhfTFBDR19DTEtfND47DQo+ICsJCWNsb2NrLW91dHB1dC1uYW1lcyA9
ICJpbWdfanBlZ19kZWNfbHBjZ19jbGsiLA0KPiArCQkJCSAgICAgImltZ19qcGVnX2RlY19scGNn
X2lwZ19jbGsiOw0KPiArCQlwb3dlci1kb21haW5zID0gPCZwZCBJTVhfU0NfUl9NSlBFR19ERUNf
TVA+Ow0KPiArCX07DQo+ICsNCj4gKwlpbWdfanBlZ19lbmNfbHBjZzogY2xvY2stY29udHJvbGxl
ckA1ODVmMDAwMCB7DQo+ICsJCWNvbXBhdGlibGUgPSAiZnNsLGlteDhxeHAtbHBjZyI7DQo+ICsJ
CXJlZyA9IDwweDU4NWYwMDAwIDB4MTAwMDA+Ow0KPiArCQkjY2xvY2stY2VsbHMgPSA8MT47DQo+
ICsJCWNsb2NrcyA9IDwmaW1nX2lwZ19jbGs+LCA8JmltZ19pcGdfY2xrPjsNCj4gKwkJY2xvY2st
aW5kaWNlcyA9IDxJTVhfTFBDR19DTEtfMD4sDQo+ICsJCQkJPElNWF9MUENHX0NMS180PjsNCj4g
KwkJY2xvY2stb3V0cHV0LW5hbWVzID0gImltZ19qcGVnX2VuY19scGNnX2NsayIsDQo+ICsJCQkJ
ICAgICAiaW1nX2pwZWdfZW5jX2xwY2dfaXBnX2NsayI7DQo+ICsJCXBvd2VyLWRvbWFpbnMgPSA8
JnBkIElNWF9TQ19SX01KUEVHX0VOQ19NUD47DQo+ICsJfTsNCj4gK307DQo+IGRpZmYgLS1naXQg
YS9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4cXhwLmR0c2kNCj4gYi9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4cXhwLmR0c2kNCj4gaW5kZXggMWU2YjQ5OTUwOTFl
Li4yZDk1ODkzMDliZDAgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNj
YWxlL2lteDhxeHAuZHRzaQ0KPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9p
bXg4cXhwLmR0c2kNCj4gQEAgLTI1OCw2ICsyNTgsNyBAQA0KPiAgCX07DQo+IA0KPiAgCS8qIHNv
cnRlZCBpbiByZWdpc3RlciBhZGRyZXNzICovDQo+ICsJI2luY2x1ZGUgImlteDgtc3MtaW1nLmR0
c2kiDQo+ICAJI2luY2x1ZGUgImlteDgtc3MtYWRtYS5kdHNpIg0KPiAgCSNpbmNsdWRlICJpbXg4
LXNzLWNvbm4uZHRzaSINCj4gIAkjaW5jbHVkZSAiaW14OC1zcy1kZHIuZHRzaSINCj4gLS0NCj4g
Mi4xNy4xDQoNCg==
