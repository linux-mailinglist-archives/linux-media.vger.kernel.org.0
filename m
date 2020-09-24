Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D23D6276C77
	for <lists+linux-media@lfdr.de>; Thu, 24 Sep 2020 10:53:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727334AbgIXIx0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Sep 2020 04:53:26 -0400
Received: from mail-eopbgr1400130.outbound.protection.outlook.com ([40.107.140.130]:17223
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726064AbgIXIxZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Sep 2020 04:53:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GXFbs0Xg6T1qpd7Dm8gBw/9WG7YaWi7zgVC7dtFQKD6mubTz77MVgTYKbbQ0cpWcy655S3kQYdrduC8gmVm1plVxnuBzVBeYfn6pfhEJqAL7cEC/j/49LeRuTmfS9fB2p/4BfjNXotOyZF2YYkVXG8XOYZ24otuW1oJCR2Vir/qK5RvY+XNvYIqHoDibOhRMyJStyflqYyZ2F6nN5/Dt0uc9bUzOHxmyekzWGvZ7TrPa9e6qCjTJ9rQlcXdzYHdLSoNlfO0jEBaUL1v275hi9t9Lu4uZVFs1DCv/17X1ybN2y2QYGSHW8Qtjv2pC6LIfziWC0Mtk08DouON1G8rNYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n/g0pJ44KRjiZbX/mlEUZmnvbzJL2NqmTwTW8YdLuVo=;
 b=dguk9eWMSvwJ/186wcDq1PSOfo6tmcNFw9kRQkSbb0KC4G8ESjzCl9w5pDa/pP6ExghunlcSHckMRZJMK6jPsK1Rwq9G7d5bws+jSvGat0OgpQgqduyTDfSvFC50zK5MQylZmoVba9ihWV5E3TAWB6OVXMo3iDrDjhoNtHQp2UwL9rf7uNs8S1hyTFeOpFDTlWVWQUybJlL8MhJkcIQ6PZ7/896+gXUiAGVsMgL+LD0B+3VTAjqlTEOyJ88cSP97+fE2vJGc9kl7sv0fEUiHzmUM37XEU5FOip2AJha1d9tKMLp/9rZfaWPo6LcmA18yDrDjtXNdB34L3RB6DuwhQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n/g0pJ44KRjiZbX/mlEUZmnvbzJL2NqmTwTW8YdLuVo=;
 b=ajYZlU6bTQTa2Fcr3Vc9UEZxOvTRqrEkbNYoTKHcRChb8TQILonBUSGkYmgS5BmyCi6xtdz04eH16EH03a7IzKo8SaawhvUkTtMLGLb4OPD9CcVTTfor1VlcQ5kpz5J3klA1ri4ikvBdMmneQXPGBTGU4MBbNndWUOtLPmdkxYM=
Received: from OSAPR01MB2740.jpnprd01.prod.outlook.com (2603:1096:603:3a::20)
 by OS0PR01MB5444.jpnprd01.prod.outlook.com (2603:1096:604:ab::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Thu, 24 Sep
 2020 08:53:20 +0000
Received: from OSAPR01MB2740.jpnprd01.prod.outlook.com
 ([fe80::8c77:606f:d812:ecd2]) by OSAPR01MB2740.jpnprd01.prod.outlook.com
 ([fe80::8c77:606f:d812:ecd2%7]) with mapi id 15.20.3391.027; Thu, 24 Sep 2020
 08:53:20 +0000
From:   Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ramesh Shanmugasundaram <rashanmu@gmail.com>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2 1/3] MAINTAINERS: Add Fabrizio Castro to Renesas DRIF
Thread-Topic: [PATCH v2 1/3] MAINTAINERS: Add Fabrizio Castro to Renesas DRIF
Thread-Index: AQHWjBiHy+ROOZ2dJUWZN261/MzZcqlxaGMAgAUFP4CAARWcsA==
Date:   Thu, 24 Sep 2020 08:53:20 +0000
Message-ID: <OSAPR01MB274066033709C64B603B8353C2390@OSAPR01MB2740.jpnprd01.prod.outlook.com>
References: <20200916105949.24858-1-fabrizio.castro.jz@renesas.com>
 <20200916105949.24858-2-fabrizio.castro.jz@renesas.com>
 <CAJWpUEd5_fTUtT_9tuwpgvp=ECmh-NGcU2FH49jmyaJNxKCqmA@mail.gmail.com>
 <20200923160219.GE3980@pendragon.ideasonboard.com>
In-Reply-To: <20200923160219.GE3980@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ideasonboard.com; dkim=none (message not signed)
 header.d=none;ideasonboard.com; dmarc=none action=none
 header.from=renesas.com;
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 4b0de8e9-1b84-4061-6065-08d8606749ca
x-ms-traffictypediagnostic: OS0PR01MB5444:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OS0PR01MB5444A12F680DCEBC45B1842DC2390@OS0PR01MB5444.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uk69S4oCbj9ds95lCnv6DNto4ZJ0kWdjMJY9DMJfT2X0Sa+tWS5ZjsBUTuhxaOqDyzIPDFq8HeGdlrN1dcmlI0dosmNdxDSajYBiX4MYz5i3LODTbKqDF+MB/33EwaZCKNheFZgbFUMNEnF52wl9mdu5Ucc6rC73txK+VxgLNk276RPJHonBPHpEYSrsEXyBXcZcpSt++AMUoXlvztP/TFVtIrHrtE72zxiljAqUncRykcztTZQUkUUaySVjoIfuOfRw28SvZveusI3IDcd9qwRGyQHgwDIapgtQY+W7g/GW9Uwd3RsIxNHi+roZBSvm
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB2740.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(39860400002)(396003)(366004)(55016002)(107886003)(33656002)(2906002)(110136005)(9686003)(71200400001)(316002)(52536014)(26005)(66446008)(8676002)(54906003)(7696005)(5660300002)(186003)(66556008)(8936002)(6506007)(86362001)(76116006)(66946007)(4326008)(478600001)(64756008)(66476007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: ccjQoEjK+x0BKDPL7KRpnwRaQGZWUVQWKsvxAMx7DTGO6xPJZPFq06AQWH0MrAS1MHYykAOrMXoYOlsWXiFgOTMg4czb61wS/Z0feWIbfz/6anPM5i1QMPweSlCsCqpys+p9WOrMOU0HhyPYyDsnePrzbR8VRNtHxQbU0CC+Che88BdRDs2COL9nBE3z/vduHCubwNintBAQr2qONjpLEeJCaSIb6ispVBzZZ+I2oxAdZ6mVBe3InSURGrPZaB6RHHb/MeTc2cAQ6+aQR0U8MT++83VLYWhVpm9h9gocJ53MOl7KNobyDLGn4sv4FojyF2kBRnVvWT9d3ompKEgCVio9/wYEc7rsuOHXwLbC3z1n34qz59QcyFArwJDaSdTlf+puUcY6KAvUrtkgNd1mHJcXRzKY5LyrS9GelxiPfI6MYcxDpuKEz9TL9t1d0Ly3siT0LHCjKX8XkMi6/OCq370CIZwvvKsrwT9vuxEcNXRWNPlKKTOL0WxVfqov1y/laGPDixPNyR+idLJ/ZShM7JA/jVb/F3qwcH5WBZgQf7n0SvAiUvzc1WK/svg5y4GedBHgP5wUP1+7TLyaVmsagaOEyogzlJSq62FQIg7wPqmoUamrH79NUt/Bc6ttHY93diNzPjPaYAKX+bRiqF4RrQ==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB2740.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b0de8e9-1b84-4061-6065-08d8606749ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2020 08:53:20.6664
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NttxbeKY9Om72A2UW7mWXGwsKbRF18/w/97YY7vD0oEYDlH3mwjNfLkb/03eBF2JM3by2qBS77DgFC6fKSrwRohEI9ehEQyhMrw4tUDZQgQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5444
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgTGF1cmVudCwNCg0KPiBGcm9tOiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0
QGlkZWFzb25ib2FyZC5jb20+DQo+IFNlbnQ6IDIzIFNlcHRlbWJlciAyMDIwIDE3OjAyDQo+IERS
SUYNCj4NCj4gT24gU3VuLCBTZXAgMjAsIDIwMjAgYXQgMTI6MjI6MTRQTSArMDEwMCwgUmFtZXNo
IFNoYW5tdWdhc3VuZGFyYW0NCj4gd3JvdGU6DQo+ID4gSGkgRmFicml6aW8sDQo+ID4NCj4gPiA+
DQo+ID4gPiBSZW5lc2FzIGFyZSBleHBhbmRpbmcgdGhlaXIgRFJJRiBzdXBwb3J0IGFuZCBvZmZl
cmluZywNCj4gPiA+IEknbGwgYmUgdGhlIGludGVybmFsIG1haW50YWluZXIgZm9yIERSSUYuDQo+
ID4gPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogRmFicml6aW8gQ2FzdHJvIDxmYWJyaXppby5jYXN0
cm8uanpAcmVuZXNhcy5jb20+DQo+ID4gPiBSZXZpZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8
bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPg0KPiA+DQo+ID4gVGhhbmsgeW91IGZv
ciB2b2x1bnRlZXJpbmcgOi0pLg0KPiA+DQo+ID4gUmV2aWV3ZWQtYnk6IFJhbWVzaCBTaGFubXVn
YXN1bmRhcmFtIDxyYXNoYW5tdUBnbWFpbC5jb20+DQo+ID4NCj4gPiBQbGVhc2UgZmVlbCBmcmVl
IHRvIHRha2UgbXkgbmFtZSBvZmYgdGhlIG1haW50YWluZXJzIGxpc3QgYXMgSSBhbSBub3QNCj4g
PiBzcGVuZGluZyB0aW1lIG9uIHRoaXMgdG9waWMgZm9yIGEgd2hpbGUgbm93Lg0KPg0KPiBGYWJy
aXppbywgd291bGQgeW91IGxpa2UgdG8gc2VuZCBhIHYyIHRoYXQgcmVtb3ZlcyBSYW1lc2ggZnJv
bSB0aGUNCj4gbWFpbnRhaW5lcnMgbGlzdCBmb3IgRFJJRiA/DQoNClllcywgSSB3aWxsIHJlbW92
ZSBSYW1lc2ggZnJvbSB0aGUgbWFpbnRhaW5lcnMgbGlzdCBmb3IgRFJJRiB3aXRoIHRoZSBuZXh0
DQp2ZXJzaW9uIG9mIHRoZSBzZXJpZXMuIEkgYW0gd2FpdGluZyBmb3IgYSBmaW5hbCBmZWVkYmFj
ayBvbiB0aGUgc2Vjb25kDQpwYXRjaCBvZiB0aGUgc2VyaWVzIGJlZm9yZSBzZW5kaW5nIG91dCB2
My4NCg0KVGhhbmtzLA0KRmFiDQoNCj4NCj4gPiA+IC0tLQ0KPiA+ID4gdjEtPnYyOg0KPiA+ID4g
KiBObyBjaGFuZ2UNCj4gPiA+DQo+ID4gPiAgTUFJTlRBSU5FUlMgfCAxICsNCj4gPiA+ICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4gPiA+DQo+ID4gPiBkaWZmIC0tZ2l0IGEvTUFJ
TlRBSU5FUlMgYi9NQUlOVEFJTkVSUw0KPiA+ID4gaW5kZXggMjU3NWY0NDkxMzlhLi5kOWViYWYw
YzE3OWIgMTAwNjQ0DQo+ID4gPiAtLS0gYS9NQUlOVEFJTkVSUw0KPiA+ID4gKysrIGIvTUFJTlRB
SU5FUlMNCj4gPiA+IEBAIC0xMDkwOSw2ICsxMDkwOSw3IEBAIEY6ICAgICAgaW5jbHVkZS9tZWRp
YS9kcnYtaW50Zi9yZW5lc2FzLWNldS5oDQo+ID4gPg0KPiA+ID4gIE1FRElBIERSSVZFUlMgRk9S
IFJFTkVTQVMgLSBEUklGDQo+ID4gPiAgTTogICAgIFJhbWVzaCBTaGFubXVnYXN1bmRhcmFtIDxy
YXNoYW5tdUBnbWFpbC5jb20+DQo+ID4gPiArTTogICAgIEZhYnJpemlvIENhc3RybyA8ZmFicml6
aW8uY2FzdHJvLmp6QHJlbmVzYXMuY29tPg0KPiA+ID4gIEw6ICAgICBsaW51eC1tZWRpYUB2Z2Vy
Lmtlcm5lbC5vcmcNCj4gPiA+ICBMOiAgICAgbGludXgtcmVuZXNhcy1zb2NAdmdlci5rZXJuZWwu
b3JnDQo+ID4gPiAgUzogICAgIFN1cHBvcnRlZA0KPg0KPiAtLQ0KPiBSZWdhcmRzLA0KPg0KPiBM
YXVyZW50IFBpbmNoYXJ0DQoNCg0KUmVuZXNhcyBFbGVjdHJvbmljcyBFdXJvcGUgR21iSCwgR2Vz
Y2hhZWZ0c2Z1ZWhyZXIvUHJlc2lkZW50OiBDYXJzdGVuIEphdWNoLCBTaXR6IGRlciBHZXNlbGxz
Y2hhZnQvUmVnaXN0ZXJlZCBvZmZpY2U6IER1ZXNzZWxkb3JmLCBBcmNhZGlhc3RyYXNzZSAxMCwg
NDA0NzIgRHVlc3NlbGRvcmYsIEdlcm1hbnksIEhhbmRlbHNyZWdpc3Rlci9Db21tZXJjaWFsIFJl
Z2lzdGVyOiBEdWVzc2VsZG9yZiwgSFJCIDM3MDggVVN0LUlETnIuL1RheCBpZGVudGlmaWNhdGlv
biBuby46IERFIDExOTM1MzQwNiBXRUVFLVJlZy4tTnIuL1dFRUUgcmVnLiBuby46IERFIDE0OTc4
NjQ3DQo=
