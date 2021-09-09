Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B00E8404384
	for <lists+linux-media@lfdr.de>; Thu,  9 Sep 2021 04:20:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236112AbhIICVc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Sep 2021 22:21:32 -0400
Received: from mail-db8eur05on2055.outbound.protection.outlook.com ([40.107.20.55]:46401
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1348278AbhIICVY (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 8 Sep 2021 22:21:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XDVrWBsxGB4U42F2/X+6uLr0m8fYFsx9FppF3Ade2VAQql2QCHzm+7kKoXXh57M4a7NnrVVTmIjXI4+HaeRZGR4Rqol5+H8U3GBZm80+CfIJqsVc2YrQBOBYJqec6jsbCG986LzgD0aWFeiaH/Qal29wAyXJV5FNiCGufgTIs5HNi+1EqhyFpDtiXyOBqCaFEb9N7EPylR6DU2LKa1I7GrgVD9aNKBhaYsb7wft7pHMQmXqcI8G74nBBI9P+Tfb4FL06L/81bb49+zTetexVl53YGl4V0EcbGI8Ac/KGVBw36gkaObX1t+2jzpa7/R/C1uUp4Jhhtu+E2bvI4s6NOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=bx22I14AJua32KhzC4MoK6v5GqDHovffrh5+TW6zd5c=;
 b=WwlAI6Ak81/sw7btHOCa0nokUId6IZrNX08tVESAiXVkl1FZX0wDKimF1lklonFyenPp7cP4F93xLjapO/eli+cKO5M8gdYruiNXQZydtIk6ndNJFnlHXcLV43jRkEmwCHQWDFWcNvwAyoLOsvNgL5UJW28Vt5SrzAJ7yGilSPqXgnnxmrq11KPNbGXQlVAGIs6/Y68VlzkU4dpw/wbNtlEKXoMT6pn++zngXjiB1ZzNZ24InRM3vqtcyw1vJ0Tvt1cpHGK5FSzP4eI00xIbIqjJEFlm6WfuRfWi4pADnzKm5TJuzVxgdArJ4K15Blyajn4WZ9sUCZ+DgBFdK++h5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bx22I14AJua32KhzC4MoK6v5GqDHovffrh5+TW6zd5c=;
 b=RCoBJUOzH/4OGoKo2MnLJ0IUbmVNbvgoc6/0IG4kw4DhMYGM6WsQ6qwwbVxxB3cl5rPGiF/Vw1/T7Wtcsr6W7fYronY5aoeGa3O+Gy1CrydJ+pdzEHZyMM4cdZ9UljERj36qFRcUHgDXHIn9pz44a8Le/H+49VFq3rNHR0/x2sI=
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AS8PR04MB7718.eurprd04.prod.outlook.com (2603:10a6:20b:29b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Thu, 9 Sep
 2021 02:20:13 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::998c:7f25:6d75:d5f4]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::998c:7f25:6d75:d5f4%7]) with mapi id 15.20.4478.027; Thu, 9 Sep 2021
 02:20:13 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
CC:     "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [EXT] Re: [PATCH v8 03/15] media:Add v4l2 buf flag codec data.
Thread-Topic: [EXT] Re: [PATCH v8 03/15] media:Add v4l2 buf flag codec data.
Thread-Index: AQHXo8Vx1xAjPIZlt0aRuKIpOS3g0quaH2sAgADPVaA=
Date:   Thu, 9 Sep 2021 02:20:12 +0000
Message-ID: <AM6PR04MB6341540B142F744B2E6F3379E7D59@AM6PR04MB6341.eurprd04.prod.outlook.com>
References: <cover.1631002447.git.ming.qian@nxp.com>
         <7ef1840137417c33f5ef7ca611c90fc274926851.1631002447.git.ming.qian@nxp.com>
 <79cdfe0af999f574642314289e1734df5e2032eb.camel@ndufresne.ca>
In-Reply-To: <79cdfe0af999f574642314289e1734df5e2032eb.camel@ndufresne.ca>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ndufresne.ca; dkim=none (message not signed)
 header.d=none;ndufresne.ca; dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 822ec65a-6f61-4732-44f9-08d973385aef
x-ms-traffictypediagnostic: AS8PR04MB7718:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AS8PR04MB77185024051079B7D4A44C1EE7D59@AS8PR04MB7718.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: i8peZLTVfeS27hXHmv5b3NLCbGlLKrcLB3UD/0p/zQkF2hdrZXijOgCNpO+Ivt5Vif3y8FpR6cJ7iebbFXcnX1k3Qg7GZjtR4nurN96mauX3TBUvtlRHk2OD6V0veWMvGQLKdTgU2Gn+6HJUBaFVg/sdCAapDqpvnOxmWMNw5zu1gLTO7MGQ7KoPAy75rDY+wNy9iWk2TYu+koSuKvuhEqkH/ay7x1Gad54eMaL4d15ymdVOJ+2Od7BvtUZU16+HWRTxQfl1clsM+0HZu+H2rJFPklO3kSw2G/glpKkdFDrqFjRpynNHjgeU+O/td5B3rqmHA7lCYZciD+48tyaYYmj9DsDkUcBlae2aDqQWVHAdMIbz50hLtvnQluY2wIA3CqLmLIcW10xjr0ZxzamRt3X7SNw5RIHLgWxadxfLNZ3tnQxknKdZwInpMvEflazwQ8bRVpvrPkMY3NfOqX4ubecoBMEA29utVVlOCcEimrByu7Xx5zGYoeiVqoJzjP6MB2lEuHSoHvpnyn/IKQKnpy0D7Mowt1UdtK2RWoAbrjtQUf7nb1tXyI0f6UaxBUzdREaxFsmvQIP3NPHySB9N2FXb7w5GGOPv7tE0MJvMCYOAf+eAqzqvlvwBK9i5JmO0EIWNtzelCd8pMmEnsEsigGS12plOW9gDsondlL51t19TVtgy5jbFrDGZI1iwwzKkO+yQwl4JLI680k3fPFSjLw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(366004)(376002)(136003)(39860400002)(33656002)(86362001)(64756008)(316002)(55016002)(186003)(7416002)(83380400001)(7696005)(110136005)(66446008)(8936002)(5660300002)(4326008)(66574015)(478600001)(66946007)(71200400001)(52536014)(38100700002)(44832011)(6506007)(76116006)(38070700005)(2906002)(53546011)(9686003)(26005)(122000001)(54906003)(66476007)(66556008)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OE5Ed0dVOE0xQmZZemZXVmM2d25lWkhYdHljVk9rWFVRdXdKYkFNOWQ3M2dC?=
 =?utf-8?B?RmVTeldXcUUrMDk4S2tOL3MvTjhuVW80MjVwcnNENDhhdHhzTmM1RjA0RUxF?=
 =?utf-8?B?NTZNZVhIOVVIalhkVnNKZndrbU92T0NrdFVSc01PYThsaFVCU0sxSGxJWndu?=
 =?utf-8?B?VW9DM08rTi84c2RLeGJnaWZMTm5ad2luLzhTMFNFb3UwSWNzcHljTzhVUFdP?=
 =?utf-8?B?UWQyNkExdUZiZXQ3TjJERmRVL0gxVTBxUHJFTEVmdGZUeXYvQ0t3S3hYWUox?=
 =?utf-8?B?Nk9vTDF3NUU0Zmdoa2J1VDFKY2lLdDN4M3ZzZGVuNU9oTWgvbi94eTVnRWlJ?=
 =?utf-8?B?bE1yR0hIYUx3dmRQb25WVU5QaTh0NnNDNS9JTml3YkJzaWpsS1pqcFRIRmFP?=
 =?utf-8?B?UW9IeTJVbnAxcHZpdGJITWt1SEZTam9PWXhVV2l0WG83RVZ0TjdTZ2hyQnZJ?=
 =?utf-8?B?SWYrYlR5cGcxSjdCWG5GNDJWbXdpWHNVTVc4NzJVbnlaSFY3Nm12YVgvOWE1?=
 =?utf-8?B?Ri9iQ0hGUkE2b0VnemgxRmxsSkNBc01XanBuRzNjVU9LajltNkdHaGF3SzFt?=
 =?utf-8?B?NG8xL0krWUhRRjBKV3hVa01DRG12NFhUSElMQUkwME5kQ0ZvYkNzSXQ4c1Y3?=
 =?utf-8?B?Z0R0U1RmME9HL01kMllFaGxTTmU3NFRKVVlvMkptUElINEVQQlFIV01lblBJ?=
 =?utf-8?B?VnFVVHNSck0zR2dKZDJ3SHY5clpvNldadk0xTFBZL25jdVNnS2lZQXZrRDFE?=
 =?utf-8?B?M2xUMlNmRFNYNkJBUXFIcWI4SkU5WERzdmpuVjdTcGkwc29qWGRnbmlwUlpH?=
 =?utf-8?B?MTR1ZGRRc2xadURzV3g4dUM5QmpsUEFIZm1FU0FpNUxkeCtESjFRZFVtSjhB?=
 =?utf-8?B?d2dJeWZiRU0wV2ZuR2Fpd3BQTXpkZlJoREUwM1RvNlowSTFuLzRHZTFqK00y?=
 =?utf-8?B?WEQwWSs0a2NRbHZ6OGJwaURrVDZkb3hDTlN2YXd3eUd3Tnd0Y0NqU0kyZk02?=
 =?utf-8?B?cDJaZjhZUkdrOUhoYjBvS29vcmRFcFc5VVZFY2JMbm5wRjVFK2RqdVBVb1pa?=
 =?utf-8?B?WXVhNTlBN29FNFRaVWZUU1NMajN5N0F0aTNuVUx2N3ltYS9lT1dQazdMcnlO?=
 =?utf-8?B?a0h1WHpSY2hja1ZQY3RsQ0hWMGo4elMxZnIxYjFxOGpQdUN3QWxZNkw0aG5a?=
 =?utf-8?B?VGdTcTV2SGYzTXJLMnhUK0x5UWtSbkhmNVdyVk9LN1dyeGFLQ3Y0R3kySVJ2?=
 =?utf-8?B?cUhUTHJDN3pkUkRqdEMya1ZKR1JMS1dlNzBSREdiVUNBYjZ2ekd1cWtPaHUx?=
 =?utf-8?B?aWpwbzhpNGxHTk5QOFliSkEvUGFxU0QyMGZjUWFtSWNHQldMSXFia1V0eFBn?=
 =?utf-8?B?L1p1WjVER3VVL1Q2RFdjcjY3VWtzdHo3RlYrWit1blozaXFZc2huakNRTlRJ?=
 =?utf-8?B?b0xnTUJ4Z2xJRmxqRHZabVBkTmZxcVlydmR5R1J2NVNKY1JBb3ZZdWRacWVa?=
 =?utf-8?B?ZEFtdE5VSjNoMHpjRlhhZm5xTVpSSnBwdlFFYTBxZ25vSmFWNnMzOGl5VlNP?=
 =?utf-8?B?WXd5NUR3ZDRKWTBFa2RLTWlUNExieXl3dUt0NTVhL1E1M2R2dVJ6TW52T0Vi?=
 =?utf-8?B?R1l1Tks3dnBiV0Nhaks4b1B4ZTg4aUhvZG0wb1lsU3hjNDc0TldQOXRrSGJP?=
 =?utf-8?B?UkVrOFF0QitqZ3ZhcmFGeFNXQVE1SnB1QlN4dnkveFp3YnhnTVBLd0l6UXNS?=
 =?utf-8?Q?2uG3HzM0tn0oa2ta58=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 822ec65a-6f61-4732-44f9-08d973385aef
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2021 02:20:12.9149
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KvC+9LMM9WXPY8X+B/P19XLlVf7Z31QCSC4YIQMNqnTqsOfzO+g+gkNycm2erzlQtFWraEZXcLmmjcGFaZpphQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7718
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBOaWNvbGFzIER1ZnJlc25lIFtt
YWlsdG86bmljb2xhc0BuZHVmcmVzbmUuY2FdDQo+IFNlbnQ6IFdlZG5lc2RheSwgU2VwdGVtYmVy
IDgsIDIwMjEgOToxNSBQTQ0KPiBUbzogTWluZyBRaWFuIDxtaW5nLnFpYW5AbnhwLmNvbT47IG1j
aGVoYWJAa2VybmVsLm9yZzsNCj4gc2hhd25ndW9Aa2VybmVsLm9yZzsgcm9iaCtkdEBrZXJuZWwu
b3JnOyBzLmhhdWVyQHBlbmd1dHJvbml4LmRlDQo+IENjOiBodmVya3VpbC1jaXNjb0B4czRhbGwu
bmw7IGtlcm5lbEBwZW5ndXRyb25peC5kZTsgZmVzdGV2YW1AZ21haWwuY29tOw0KPiBkbC1saW51
eC1pbXggPGxpbnV4LWlteEBueHAuY29tPjsgQWlzaGVuZyBEb25nIDxhaXNoZW5nLmRvbmdAbnhw
LmNvbT47DQo+IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIu
a2VybmVsLm9yZzsNCj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWFybS1rZXJu
ZWxAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPiBTdWJqZWN0OiBbRVhUXSBSZTogW1BBVENIIHY4IDAz
LzE1XSBtZWRpYTpBZGQgdjRsMiBidWYgZmxhZyBjb2RlYyBkYXRhLg0KPiANCj4gQ2F1dGlvbjog
RVhUIEVtYWlsDQo+IA0KPiBIaSBNaW5nLA0KPiANCj4gdGhhbmtzIGZvciB0aGUgcGF0Y2guIEkn
bSBkb2luZyBhIGZpcnN0IHBhc3MgcmV2aWV3IG9mIHRoZSBuZXcgQVBJcyB5b3UgYXJlDQo+IGlu
dHJvZHVjaW5nLg0KPiANCj4gTGUgbWFyZGkgMDcgc2VwdGVtYnJlIDIwMjEgw6AgMTc6NDkgKzA4
MDAsIE1pbmcgUWlhbiBhIMOpY3JpdCA6DQo+ID4gSW4gc29tZSBkZWNvaW5nIHNjZW5hcmlvcywg
YXBwbGljYXRpb24gbWF5IHF1ZXVlIGEgYnVmZmVyIHRoYXQgb25seQ0KPiA+IGNvbnRhaW5zIGNv
ZGVjIGNvbmZpZyBkYXRhLCBhbmQgdGhlIGRyaXZlciBuZWVkcyB0byBrbm93IHdoZXRoZXIgaXMg
aXQNCj4gPiBhIGZyYW1lIG9yIG5vdC4NCj4gPiBTbyB3ZSBhZGQgYSBidWYgZmxhZyB0byB0ZWxs
IHRoaXMgY2FzZS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IE1pbmcgUWlhbiA8bWluZy5xaWFu
QG54cC5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogU2hpamllIFFpbiA8c2hpamllLnFpbkBueHAu
Y29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFpob3UgUGVuZyA8ZWFnbGUuemhvdUBueHAuY29tPg0K
PiA+IC0tLQ0KPiA+ICBEb2N1bWVudGF0aW9uL3VzZXJzcGFjZS1hcGkvbWVkaWEvdjRsL2J1ZmZl
ci5yc3QgfCA3ICsrKysrKysNCj4gPiAgaW5jbHVkZS91YXBpL2xpbnV4L3ZpZGVvZGV2Mi5oICAg
ICAgICAgICAgICAgICAgIHwgMSArDQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25z
KCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi91c2Vyc3BhY2UtYXBpL21l
ZGlhL3Y0bC9idWZmZXIucnN0DQo+ID4gYi9Eb2N1bWVudGF0aW9uL3VzZXJzcGFjZS1hcGkvbWVk
aWEvdjRsL2J1ZmZlci5yc3QNCj4gPiBpbmRleCBlOTkxYmE3M2Q4NzMuLjExMDEzYmNmOGE0MSAx
MDA2NDQNCj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL3VzZXJzcGFjZS1hcGkvbWVkaWEvdjRsL2J1
ZmZlci5yc3QNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL3VzZXJzcGFjZS1hcGkvbWVkaWEvdjRs
L2J1ZmZlci5yc3QNCj4gPiBAQCAtNjA3LDYgKzYwNywxMyBAQCBCdWZmZXIgRmxhZ3MNCj4gPiAg
ICAgICB0aGUgZm9ybWF0LiBBbnkgc3Vic2VxdWVudCBjYWxsIHRvIHRoZQ0KPiA+ICAgICAgIDpy
ZWY6YFZJRElPQ19EUUJVRiA8VklESU9DX1FCVUY+YCBpb2N0bCB3aWxsIG5vdCBibG9jayBhbnlt
b3JlLA0KPiA+ICAgICAgIGJ1dCByZXR1cm4gYW4gYGBFUElQRWBgIGVycm9yIGNvZGUuDQo+ID4g
KyAgICAqIC4uIF9gVjRMMi1CVUYtRkxBRy1DT0RFQ0NPTkZJR2A6DQo+ID4gKw0KPiA+ICsgICAg
ICAtIGBgVjRMMl9CVUZfRkxBR19DT0RFQ0NPTkZJR2BgDQo+ID4gKyAgICAgIC0gMHgwMDIwMDAw
MA0KPiA+ICsgICAgICAtIFRoZSBidWZmZXIgb25seSBjb250YWlucyBjb2RlYyBjb25maWcgZGF0
YSwgZWcuIHNwcyBhbmQgcHBzLg0KPiA+ICsgICAgQXBwbGljYXRpb25zIGNhbiBzZXQgdGhpcyBi
aXQgd2hlbiBgYHR5cGVgYCByZWZlcnMgdG8gYW4gb3V0cHV0DQo+ID4gKyAgICBzdHJlYW0sIHRo
aXMgZmxhZyBpcyB1c3VhbGx5IHVzZWQgYnkgdjRsMiBkZWNvZGVyLg0KPiANCj4gQ3VycmVudGx5
LCB0aGUgYm90dG9tIGxpbmUgaXMgdGhhdCBhbGwgZGVjb2RlcnMgbmVlZHMgYSBmcmFtZSBvciBm
aWVsZA0KPiBhY2NvbXBhbmllZCB3aXRoIHRoZSBoZWFkZXJzIChvbmx5IEFubmV4IEIuIGJlaW5n
IGRlZmluZWQgYW5kIHN1cHBvcnRlZCBmb3INCj4gbm93KS4gRGVjb2RlcnMgY2FuIGJlIG1vcmUg
ZmxleGlibGUgKGFuZCBzb21lIGFyZSkuIFRoZSBkb2N1bWVudGF0aW9uIGhlcmUNCj4gaXMgbm90
IGNsZWFyIGVub3VnaCwgcmVtZW1iZXIgdGhhdCB3ZSBtdXN0IG5vdCBicmVhayBjb21wYXRpYmls
aXR5Lg0KPiANCj4gSSB0aGluayB5b3UgaGF2ZSB0byBjbGFyaWZ5IHRoZSBpbnRlbnRpb24uIFRo
aXMgZmxhZyBleGlzdCBpbiBPTVggYW5kIGhhdmUgYmVlbg0KPiBzb3VyY2Ugb2YgY29uZnVzaW9u
IGFuZCBpbnRlci1vcGVyYWJpbGl0eSBzaW5jZSB0aGUgc3RhcnQuDQo+IA0KPiAtIElmIHRoaXMg
ZmxhZyBpcyBlbnRpcmVseSBvcHRpb25hbCwgYW5kIGlzIGp1c3QgYW4gb3B0aW1pemF0aW9uLCB0
aGVuIGFkZGluZyBpdCB0aGlzDQo+IHdheSBpcyBmaW5lLCBidXQgdGhlIGRvY3VtZW50YXRpb24g
c2hvdWxkIGJlIHVwZGF0ZWQuDQo+IA0KPiAtIElmIHRoaXMgZmxhZyBpcyByZXF1aXJlZCBvbmx5
IHdoZW4gdGhlIGhlYWRlciBpcyBzcGxpdCwgdGhlbiB0aGlzIGZsYWcgbmVlZCB0byBiZQ0KPiBh
Y2NvbXBhbmllZCB3aXRoIGEgVjRMMl9CVUZfQ0FQX1NVUFBPUlRTX1NQTElUX0NPREVDQ09ORklH
IChvcg0KPiBzaW1pbGFyIG5hbWUsIHNob3J0ZXIgY291bGQgYmUgbmljZSkuIFRoaXMgaXMgc28g
dGhhdCB1c2Vyc3BhY2UgY2FuIGRldGVjdCBpZiB0aGF0DQo+IGZlYXR1cmUgaXMgc3VwcG9ydGVk
IG9yIG5vdC4NCj4gDQo+IC0gSWYgaGF2aW5nIHNwbGl0IGNvZGVjY29uZmlnIGlzIHN0cmljdGx5
IG5lZWRlZCBmb3IgeW91ciBkcml2ZXIsIHRoZW4gdGhpcyBmbGFnIGlzDQo+IG5vdCB0aGUgcHJv
cGVyIHNvbHV0aW9uLiBUaGUgb25seSBzb2x1dGlvbiBJJ2Qgc2VlIGZvciB0aGF0LCB3b3VsZCBi
ZSB0byB1c2UNCj4gc29tZXRoaW5nIGVsc2UgdGhlbiBWNEwyX1BJWF9GTVRfSDI2NCBzbyB0aGF0
IGV4aXN0aW5nIHVzZXJzcGFjZSBhcmUgbm90DQo+IHRyaWNrZWQgaW50byB0cnlpbmcgdG8gdXNl
IHlvdXIgZHJpdmVyIHRoZSB3cm9uZyB3YXkuIEkgdGhpbmsgc3VjaCBoZWFkZXIgY291bGQNCj4g
bWFrZSBzZW5zZSB3aXRoIEgyNjRfTk9fU0MgKHRob3VnaCBub3Qgc3VwZXIgY2xlYXIgd2hhdCB0
aGlzIGlzIGV4YWN0bHksIGl0J3MNCj4gbm90IHJlYWxseSB1c2VkKSwgb3IgYSBjbGVhcmVyIG5l
dyBmb3JtYXQgSDI2NF9BVkNDL0FWQ0MzDQoNCkhpIE5pY29sYXMsDQoNCiAgICBUaGlzIGZsYWcg
aXMgb3B0aW9uYWwsIGFuZCBpbiBmYWN0LCBvdXIgZHJpdmVyIGRvZXNuJ3Qgd2FudCB0byByZWNl
aXZlIGEgc3BsaXRlZCBoZWFkZXIsDQpJdCdzIGJlc3QgdGhhdCBldmVyeSBidWZmZXIgY29udGFp
bnMgYSBmcmFtZS4NCiAgICBCdXQgaW4gc29tZSBjYXNlLCB0aGUgY2xpZW50IG1heSBlbnF1ZXVl
IHNvbWUgYnVmZmVyIHRoYXQgb25seSBjb250YWlucyB0aGUgaGVhZGVyIGRhdGEgd2l0aG91dCBh
bnkgZnJhbWUgZGF0YS4NCkFuZCBvdXIgZHJpdmVyIG5lZWQgdG8ga25vdyB0aGlzIGNhc2UsIGZv
ciB0aGlzIHR5cGUgb2YgYnVmZmVyLCB3ZSBoYXZlIHR3byBjYXNlcyB0byBoYW5kbGUuDQogICAg
MS4gaWdub3JlIHRoZSB0aW1lc3RhbXAuDQoJMi4gdGhlIGFtcGhpb24gZGVjb2RlciBuZWVkcyBh
IHJpbmcgYnVmZmVyIGZvciBkZWNvZGluZywgZHJpdmVyIHdpbGwgY29weSB0aGUgY29kZWQgZGF0
YSB0byB0aGUgcmluZyBidWZmZXIsIGFuZCB1cGRhdGUgdGhlIHdyaXRlIHBvaW50ZXIsIHRoZW4g
cGFzcyBhIGZyYW1lIGNvdW50IHRvIGZpcm13YXJlLCBmaXJtd2FyZSB3aWxsIHVzZSB0aGUgZnJh
bWUgY291bnQgdG8gZGV0ZXJtaW5lIHdoZXRoZXIgc3RhcnRpbmcgZGVjb2RpbmcgYSBmcmFtZSBv
ciBub3QsIGlmIHRoZSBmcmFtZSBjb3VudCBpcyBpbmNvcnJlY3QsIGl0IG1heSBsZWQgdG8gdnB1
IGhhbmcuIFNvIGZvciB0aGlzIHR5cGUgb2YgYnVmZmVyLCB3ZSB3b24ndCBpbmNyZWFzZSB0aGUg
ZnJhbWUgY291bnQuDQoNCiAgICBUaGUgZmxhZyBpcyByZXF1aXJlZCBvbmx5IHdoZW4gdGhlIGhl
YWRlciBpcyBzcGxpdCwgSSBhZ3JlZSB3aXRoIHlvdSB0aGF0IGl0J3MgYmV0dGVyIHRvIGFkZCBh
IGNhcGFiaWxpdHkgZmxhZy4gQWN0dWFsbHkgb3VyIGRyaXZlciBkb2Vzbid0IHdhbnQgbWVldCB0
aGlzIGNhc2UsIGJ1dCB0aGlzIHNpdHVhdGlvbiBkb2VzIGV4aXN0IGluIHNvbWUgYXBwbGljYXRp
b25zLCBJIGFkZCB0aGlzIGZsYWcgdG8gaGVscCBoYW5kbGUgaXQuDQogICAgQ3VycmVudGx5IHdl
IG1lZXQgdGhpcyBjYXNlIGluIGFuZHJvaWQgcGxhdGZvcm0uDQoNCj4gDQo+ID4gICAgICAqIC4u
IF9gVjRMMi1CVUYtRkxBRy1SRVFVRVNULUZEYDoNCj4gPg0KPiA+ICAgICAgICAtIGBgVjRMMl9C
VUZfRkxBR19SRVFVRVNUX0ZEYGANCj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2xpbnV4
L3ZpZGVvZGV2Mi5oDQo+ID4gYi9pbmNsdWRlL3VhcGkvbGludXgvdmlkZW9kZXYyLmggaW5kZXgg
MTY3YzBlNDBlYzA2Li41YmIwNjgyYjRhMjMNCj4gPiAxMDA2NDQNCj4gPiAtLS0gYS9pbmNsdWRl
L3VhcGkvbGludXgvdmlkZW9kZXYyLmgNCj4gPiArKysgYi9pbmNsdWRlL3VhcGkvbGludXgvdmlk
ZW9kZXYyLmgNCj4gPiBAQCAtMTExOSw2ICsxMTE5LDcgQEAgc3RhdGljIGlubGluZSBfX3U2NCB2
NGwyX3RpbWV2YWxfdG9fbnMoY29uc3QNCj4gc3RydWN0IHRpbWV2YWwgKnR2KQ0KPiA+ICAjZGVm
aW5lIFY0TDJfQlVGX0ZMQUdfVFNUQU1QX1NSQ19TT0UgICAgICAgICAweDAwMDEwMDAwDQo+ID4g
IC8qIG1lbTJtZW0gZW5jb2Rlci9kZWNvZGVyICovDQo+ID4gICNkZWZpbmUgVjRMMl9CVUZfRkxB
R19MQVNUICAgICAgICAgICAgICAgICAgIDB4MDAxMDAwMDANCj4gPiArI2RlZmluZSBWNEwyX0JV
Rl9GTEFHX0NPREVDQ09ORklHICAgICAgICAgICAgMHgwMDIwMDAwMA0KPiA+ICAvKiByZXF1ZXN0
X2ZkIGlzIHZhbGlkICovDQo+ID4gICNkZWZpbmUgVjRMMl9CVUZfRkxBR19SRVFVRVNUX0ZEICAg
ICAgICAgICAgIDB4MDA4MDAwMDANCj4gPg0KPiANCg0K
