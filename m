Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E47049723F
	for <lists+linux-media@lfdr.de>; Sun, 23 Jan 2022 15:47:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233630AbiAWOru (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 23 Jan 2022 09:47:50 -0500
Received: from mail-os0jpn01on2106.outbound.protection.outlook.com ([40.107.113.106]:13291
        "EHLO JPN01-OS0-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233563AbiAWOru (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 23 Jan 2022 09:47:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zvk5DivUUGl+UiLhslliJajThVYKAKmsY55R/j7wNodFUJoUTqOIt6c4vsWe+8EoA1ENUhCdHHkIwHwIQYV2TfWjeHQ3exDzrIG/m8s6vNRLSAgiRt/pnR4AoN8SAoLNK9SfVENv45S9NGmVgXSLJK42/7WfhGLrusu85o68m7q+OaMFs+cxE3tb+SIGdnBgZdf/xqN+dq6lWX5MIULfa1iffHsCY0l6wWzgy4BPA1MXoKITtCXuIc56AvED29MxoYeSVSVJ78wFWidN+UvcFuQTJlKmx4sTx/KQGZFlrw89KFH7IUlPdRlXVYKeZl4DmCU0Rwg2ja/r4cbJNxZvBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zki73G100Va722x6QbRpvTAN/j9iL8LPpjdJ0/V+9kc=;
 b=DyaRD4ekTiLaiXhsOywZ6iSDq+hoL6CYaN0Baa7SeQEXZsUN9FfzZ7igofqop+RRdUt2KdZJhf8zkfHno5z9OotslzMVXbNaYsMEFkzJA/thvSzPDFkcu9VMzLyA2HSguso3EU7qCv002uyP6NwycoLn/4wnAl9/bLt2De9A5LrFcCZUMS+MaCRdF3uSkEY7Wk5G4n3S/ByTVGbnFMZCuKE5e3wk7eGJRpcBSmeTEo+hDXbreEboSpjzpT7nfqfl0yWhHDID9x565jNXUL/q9ma1zXhQ6T7AG99PdTExQZHCoZVb0tJGkECfRQIIeP7xhZQHF1V3iIk13gJ6aueXQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zki73G100Va722x6QbRpvTAN/j9iL8LPpjdJ0/V+9kc=;
 b=tqTtnwXMxNDH9DEWQZRVxs+FXn8Q1YbTNkMcAT0h5fOSXPajeLwP6nMO/DQKi90FeW6vl3JtvlS3TvEikXSxiqQ8WlRo67u1a729ivZauO9a9/PVQ+81yqgb0MzQEnnnKNfcuhFTw+0wtAk/7Hiq8f/JPwkt4iPoQxgHfsaxckg=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYAPR01MB4269.jpnprd01.prod.outlook.com (2603:1096:404:c3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.11; Sun, 23 Jan
 2022 14:47:47 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3847:4115:3fbe:619]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3847:4115:3fbe:619%7]) with mapi id 15.20.4909.017; Sun, 23 Jan 2022
 14:47:46 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Rob Herring <robh@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [RFC 19/28] media: dt-bindings: media: renesas,vsp1: Document
 RZ/{G2L,V2L} VSPD bindings
Thread-Topic: [RFC 19/28] media: dt-bindings: media: renesas,vsp1: Document
 RZ/{G2L,V2L} VSPD bindings
Thread-Index: AQHYB9xts4jxdkHKi0iBE9shTZbblKxuR7AAgACswuCAANgVAIAA8prg
Date:   Sun, 23 Jan 2022 14:47:46 +0000
Message-ID: <OS0PR01MB592280D48163382C5CFC7E64865D9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220112174612.10773-1-biju.das.jz@bp.renesas.com>
 <20220112174612.10773-20-biju.das.jz@bp.renesas.com>
 <YetXnJf85MMlJjAW@robh.at.kernel.org>
 <OS0PR01MB5922E4E0E015D3EE42A97F36865C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <Yeydyu+jg9cNObhN@pendragon.ideasonboard.com>
In-Reply-To: <Yeydyu+jg9cNObhN@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2d9ddce2-d7cc-49ea-e33e-08d9de7f5217
x-ms-traffictypediagnostic: TYAPR01MB4269:EE_
x-microsoft-antispam-prvs: <TYAPR01MB4269EDB3AE03073D4722B9A9865D9@TYAPR01MB4269.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:317;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dQPLZYf34L8iOllwMDyc5hCFgm9mGcJa6T11RmItyAh3gU0cWCZI+KsbgSKEZTSAlNjTKHNHsb/dEAo3ThMzHgv4VozCuufTG9+I3Bc5BodOQI+AoWyE0/nBSb4r9/Fiv6eh9vQ7QtOiKoMS81anSee9ccQbWQ+SV7ezJEKmwzINS9cAVFhwiSxfxUfG0X4uitqQkt5WmmLeoKGbwbbVPURpK1CXUapcZJeQrC2JJ3bFq35wfWiNW8fqBz8y4e1JlT3D2pUyFM/WPvuWaEOroaHL086G0F7bXpyrwsjHbNjAd1Pl0f4C+ghkyVzCc6i00G8Aob0B8ySEIN6SbqjfjuqQiZsJeuOME2EqKKIou9R8i5TNOG+JGzS/ugFrWmmuxHKres28hJmhEGzigZ9ZEQDZn+gSzr1wlqY5OfcGeaD+umj1UHiTw0sCwPTXgt3hS1/+NJ1f1XpSdImChDhTXIpgUjpF8k5wA75hukxmMksb8ULBZ9GTguF9oQntuIttm/o7I4VRt168NIcX6aPaU1IB+XrHB7cj+8naZns5XJyyZluiJljFRdB1vhNGrGOZqtxg3qQ0k8rdxLX7qoBgb9w+9Bnho7fsQk/s0E9ejTFNSpQeEWe5/vewAmF1iSfmaNHNwdP0oq7VsEE+u2H1dfqK2Z9S06Ob0AzcSGSwkxHgnMduwUrqStUBehdE+fRoxWlb4aYu8dHr49Ndh4Y1GQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38100700002)(122000001)(52536014)(6916009)(33656002)(54906003)(4326008)(2906002)(5660300002)(55016003)(8676002)(316002)(86362001)(66946007)(508600001)(66476007)(26005)(8936002)(9686003)(107886003)(66446008)(64756008)(186003)(66556008)(83380400001)(6506007)(7696005)(76116006)(71200400001)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cHM4Lzg2ZklTYjllTHJILy9LVFNheVdCekJSZ2ExMDliVGppVWduZXlJU0pR?=
 =?utf-8?B?VDJjcnlJSHMxNHQxS2hDMUZNdy9sTkp6RnFNaFRxbFdkbnVUQ3Y2Uk94MzhM?=
 =?utf-8?B?M3dWbE5LSnVRbjd4UHdmNVBmWGh1VXRqQVRaUUJOSHlPVTFlVjJUc1lJbmRu?=
 =?utf-8?B?N0dXWG01YXFPcG1WQmtoU2szeld2SmVDV2ZKUk5ob2NON3lHM2treUYyeWtM?=
 =?utf-8?B?Yk1kSFFOSzZKOHpCUUI5MjJjU2hXS0xXTHFqbXVLRW45cnAvRXIyL0w2SXh1?=
 =?utf-8?B?Umo2VWtrcHpUNzhZS0I2VUp1V0RuRnJWMnNMQ0VqVSs2clpHRTQrWEg4K1lH?=
 =?utf-8?B?bklLQ0g4WlRoTVBocEhNQmhFZ1hJa05VcTBsL2xOR05QMWc4MjduOXRNYmlE?=
 =?utf-8?B?SzRqallpZng0UDM1dEtnbWNrS1hxRjJiV2FKS2xGRU9zVzRWOFFkSXlaVXFx?=
 =?utf-8?B?aTBEQVRhUC9TNEhJdlpIa2NjeEtMQjBIQ3ZUaUFQbzB1d3ZqLzg0NERVOWc3?=
 =?utf-8?B?L1Ywd2JTMERtTDZ4cDJTWUxzSHB0WWNQVUN0bzhNNWdOTHZIbVJaeXF1K3RY?=
 =?utf-8?B?MEhJWDIwUjNQSWdEcnc1QVBLVXFqeGk4b3Q5VzdEUER2em90SkVYRDZPK0oy?=
 =?utf-8?B?b2hXRG1sbHE3SFdNTlllaHptc0YvcHBnZHgrckVLLzRTemY4K2xlK2FiN3JP?=
 =?utf-8?B?UmxDMU9lc0lKdms2WitFVFlMM28yWkNoTHNIdi9NQXJmN3NWU0pmMGFtOUYw?=
 =?utf-8?B?TXhrZFA5eEtDRWZKeldlMXJvUVJVR1dUM1F0Y0wzdUdFSElVSWU5YXdJMXor?=
 =?utf-8?B?RU1mbm9XdkNwa1JUN2plQlMzNERKS0dlb1pCb3BQQ0VnTFhmZHNud29TVVN0?=
 =?utf-8?B?dXFuZXpiY1NvTE9FNlJJdVovOFNoV0FKV3J4WDlKTkdURnpKaHJhcVZSWGh2?=
 =?utf-8?B?KzVFMnpSR2RTb253eXhvYTg5dERNY1gxTkVsWGpBbGtLVnZGbGw1czlsNG15?=
 =?utf-8?B?YUVRZnF3OFlYR0Z1TEtqQlN1Sm9zUFJlbFNYT2EvRVg0cHNVOVFaUEdxZmlR?=
 =?utf-8?B?U3MrTFNTM3RxaUFvMDgvc1haSzRoYnRYUHErR0pQbmVHM3UzYnlMNEZFRG5j?=
 =?utf-8?B?bkZXK1RWMU05MXJ5VHp6dHF6RW1LV3RQWVVua2FyZHZuTHFwbG5jaVBTeUkr?=
 =?utf-8?B?K3c4TDVSQ0dZeTVHbGhicjJvSmxyVUVhOE9hZWN3SkYvQmNvSkpaaDNJY2NS?=
 =?utf-8?B?RnJDTm9RYTR3dG1wVXQvOE5yWTZuRU9IY2VkcnozWWdlOVdTUHdTMnZYMkFR?=
 =?utf-8?B?MFlUK2R6ejNYRDJheTZTWUlkVHNJUzNHb1JOUm5mK1d5SGp2b2c4dS9yWk4y?=
 =?utf-8?B?OEJSa1B0NDlhVFRxeFdBeW9UbDFMS1ExWEwraWIvM3ovN1MrNGd4YTU0QS80?=
 =?utf-8?B?c1FrZXc4Qld4ZTBQeExSZm1saGxkWEpzL3NnVjFuLzdPTEZucTNvNC9pNEo2?=
 =?utf-8?B?WDZ5WjlrUmJZOWg2LzlsNTJkSElIT1BlUDhMNzArSTJuTFNOT1NTSDUzajFH?=
 =?utf-8?B?YUY1ODRiWmMyL2RZVkc5Y3J1VHdKQ2NFOWd3VStrZ0R1ZEszU1BJblludXV5?=
 =?utf-8?B?RUE0cEJHNExxMkl2dnl5WGJ0RlR2VFNEQXVWcUVEQjQvMm0va09FaDFJSDlC?=
 =?utf-8?B?UnZERkUvN0VJdUNlcnNXeEJyRVV0QUl4S05rK3ZCeWFteVh4cEVPaWlWUlBr?=
 =?utf-8?B?Q2JQcHpycEdWckZicG83emFseHN1RVdXQitoWUZtUk1GM2JPQ0dBclZUbWJO?=
 =?utf-8?B?YUlndTcra21NNDBFc2Z4c0RPUkdzTEhjMWxJS3Mwd0FPNUx2MUYzN3k0blQw?=
 =?utf-8?B?Q2tJWlQrLzV0TGRSN0lUSGlncHF4dThxdzhJUC9EcXhaMmF3UHBsMTVNUFhD?=
 =?utf-8?B?T2xPaEpXWGJITTVkeWF6TnpJZjlGYUJHa0l4NGlzWnBjd0hVN0x4SEFPQkdU?=
 =?utf-8?B?V0hyMW1QekpwOWlxbll3aExBZUlscWZ2UGl6WGk5aWZVRkZ6ZGZhd3FiVWdP?=
 =?utf-8?B?VDUyVTBETkRBYS9pbEQwNGk5UEpUMmxvM05WVDBoZEhHQVFZNllRczI5VVd3?=
 =?utf-8?B?SzFKZGJzVjZ3MGdVVkRESFErQWNtQy9aVHRhOVlYVWpYekM4QUVYY011VmZv?=
 =?utf-8?B?alMvTmo0WXE0SnBJYVRmU29FcUlyNUhONDJrdWJQeEllVHFhZ3Z5MjFGRVlm?=
 =?utf-8?B?aHdIbkxTSFZLUFZUKzViVC9acEFBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d9ddce2-d7cc-49ea-e33e-08d9de7f5217
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2022 14:47:46.8677
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /5ZOOrTOPsQYvLmUXmKPpbsfH20KK3RMr4hKyUDO8bCw5fKuCCEthnaCczsw/N7Vn5n6pTXpivZTAPJRtdZfVqXy7bmnxnmycRsrMgIEi04=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4269
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgTGF1cmVudCwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gU3ViamVjdDogUmU6
IFtSRkMgMTkvMjhdIG1lZGlhOiBkdC1iaW5kaW5nczogbWVkaWE6IHJlbmVzYXMsdnNwMTogRG9j
dW1lbnQNCj4gUlove0cyTCxWMkx9IFZTUEQgYmluZGluZ3MNCj4gDQo+IEhpIEJpanUsDQo+IA0K
PiBPbiBTYXQsIEphbiAyMiwgMjAyMiBhdCAxMToyMzozMkFNICswMDAwLCBCaWp1IERhcyB3cm90
ZToNCj4gPiA+IFN1YmplY3Q6IFJlOiBbUkZDIDE5LzI4XSBtZWRpYTogZHQtYmluZGluZ3M6IG1l
ZGlhOiByZW5lc2FzLHZzcDE6DQo+ID4gPiBEb2N1bWVudCBSWi97RzJMLFYyTH0gVlNQRCBiaW5k
aW5ncw0KPiA+ID4NCj4gPiA+IE9uIFdlZCwgSmFuIDEyLCAyMDIyIGF0IDA1OjQ2OjAzUE0gKzAw
MDAsIEJpanUgRGFzIHdyb3RlOg0KPiA+ID4gPiBEb2N1bWVudCBWU1BEIGZvdW5kIGluIFJaL0cy
TCBhbmQgUlovVjJMIGZhbWlseSBTb0Mncy4NCj4gPiA+ID4NCj4gPiA+ID4gU2lnbmVkLW9mZi1i
eTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gPiAtLS0NCj4g
PiA+ID4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9yZW5lc2FzLHZz
cDEueWFtbCB8IDQNCj4gPiA+ID4gKysrLQ0KPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+ID4gPg0KPiA+ID4gPiBkaWZmIC0tZ2l0DQo+
ID4gPiA+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL3JlbmVzYXMs
dnNwMS55YW1sDQo+ID4gPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21l
ZGlhL3JlbmVzYXMsdnNwMS55YW1sDQo+ID4gPiA+IGluZGV4IDk5MGU5YzFkYmM0My4uYjI3ZWUy
M2QyYjI5IDEwMDY0NA0KPiA+ID4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbWVkaWEvcmVuZXNhcyx2c3AxLnlhbWwNCj4gPiA+ID4gKysrIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL3JlbmVzYXMsdnNwMS55YW1sDQo+ID4gPiA+IEBA
IC0xOSw2ICsxOSw3IEBAIHByb3BlcnRpZXM6DQo+ID4gPiA+ICAgICAgZW51bToNCj4gPiA+ID4g
ICAgICAgIC0gcmVuZXNhcyx2c3AxICMgUi1DYXIgR2VuMiBhbmQgUlovRzENCj4gPiA+ID4gICAg
ICAgIC0gcmVuZXNhcyx2c3AyICMgUi1DYXIgR2VuMyBhbmQgUlovRzINCj4gPiA+ID4gKyAgICAg
IC0gcmVuZXNhcyx2c3AyLXI5YTA3ZzA0NCAjIFJaL0cyTCBhbmQgUlovVjJMDQo+IA0KPiBUaGUg
Y29tbWl0IG1lc3NhZ2Ugc2hvdWxkIGV4cGxhaW4gd2h5IGEgbmV3IGRldmljZS1zcGVjaWZpYyBj
b21wYXRpYmxlDQo+IHZhbHVlIGlzIG5lZWRlZC4NCg0KT0suIFdpbGwgYWRkIHRoaXMgaW4gbmV4
dCB2ZXJzaW9uLg0KDQpCYXNpY2FsbHkgSXQgZG9lcyBub3QgaGF2ZSB2ZXJzaW9uIHJlZ2lzdGVy
IGNvbXBhcmVkIHRvIG90aGVyIFNvQydzIHN1cHBvcnRlZCBieQ0KdGhpcyBkcml2ZXIuIA0KDQo+
IA0KPiA+ID4gPg0KPiA+ID4gPiAgICByZWc6DQo+ID4gPiA+ICAgICAgbWF4SXRlbXM6IDENCj4g
PiA+ID4gQEAgLTI3LDcgKzI4LDggQEAgcHJvcGVydGllczoNCj4gPiA+ID4gICAgICBtYXhJdGVt
czogMQ0KPiA+ID4gPg0KPiA+ID4gPiAgICBjbG9ja3M6DQo+ID4gPiA+IC0gICAgbWF4SXRlbXM6
IDENCj4gPiA+ID4gKyAgICBtaW5JdGVtczogMQ0KPiA+ID4gPiArICAgIG1heEl0ZW1zOiAzDQo+
ID4gPg0KPiA+ID4gWW91IGhhdmUgdG8gZGVmaW5lIHdoYXQgZWFjaCBvbmUgaXMgb25jZSB5b3Ug
aGF2ZSBtb3JlIHRoYW4gMS4NCj4gPg0KPiA+IEFncmVlZCwgV2lsbCBkZWZpbmUgZWFjaCBjbG9j
a3MuDQo+IA0KPiBUaGlzIHNob3VsZCBhbHNvIGJlIGNvbmRpdGlvbmVkIGJ5IHRoZSBjb21wYXRp
YmxlIHN0cmluZywgdG8gaGF2ZSBtYXhJdGVtcw0KPiBzZXQgdG8gMSBmb3IgcmVuZXNhcyx2c3Ax
IGFuZCByZW5lc2FzLHZzcDIsIGFuZCAzIGZvciByZW5lc2FzLHZzcDItDQo+IHI5YTA3ZzA0NC4N
Cg0KQWdyZWVkLg0KDQpSZWdhcmRzLA0KQmlqdQ0KPiANCj4gPiA+ID4gICAgcG93ZXItZG9tYWlu
czoNCj4gPiA+ID4gICAgICBtYXhJdGVtczogMQ0KPiANCj4gLS0NCj4gUmVnYXJkcywNCj4gDQo+
IExhdXJlbnQgUGluY2hhcnQNCg==
