Return-Path: <linux-media+bounces-5160-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E29B3854D10
	for <lists+linux-media@lfdr.de>; Wed, 14 Feb 2024 16:39:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 54880B215F5
	for <lists+linux-media@lfdr.de>; Wed, 14 Feb 2024 15:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09B225D490;
	Wed, 14 Feb 2024 15:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="sW+JPB8M"
X-Original-To: linux-media@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2086.outbound.protection.outlook.com [40.107.113.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A545CDC7;
	Wed, 14 Feb 2024 15:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707925156; cv=fail; b=YRCA4wNUisDcDT5Zn1J/l12YOTS1LJQJ9ukRnUzmirPOUt9dIWI9CIyQyRWdC8b05MMUTpSnjzYH+U/bbTK9ezQv/+E22iZtX1Jbsfo7TuNL6/a7UywJwD34JzjHLYK/wxQjZN2CBL/ISaPi9akOBYoKWaYifRaEqr4Yvo4kJQw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707925156; c=relaxed/simple;
	bh=ocI8zjG1kkKrK6qq0zPpPmYkEraFiwJcmYbKLr1lbkY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kbbc6Lj6JWoTht60wIBhEouAFxIInIq0+OWGi7sk2sLleon5S3jspeGytPtYmgNTN5jzrVx9ibqgFW/h9Dx7YIsWzPqE5610r4BhHOxSEfcoBZ7FuLC+VoIzUmK+A0zaSzTSIJSIgBCdRucLE8W0qjQtYpdFGOgQ/KgzN+kN3Aw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=sW+JPB8M; arc=fail smtp.client-ip=40.107.113.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZlSLb8sZY61WnUghQ0YMBPZmsGmYZrmcLA9+nx3dzVxlhu31qXPuDGTIf1EeMncaeb8MmLVANZFToa+gQQIyxAAFWRD82E88AU4kD326EhEPaOqamOjzjZghb4czEWHas21tR7Imf65lgi6ggcXYEm/KaPf8tF1C54nAnLVtQgCEIGesFROYE5rK23fvLgmK6ZBfRyUiSPYrRhNBObZHmPhZlJkTeLqgLtBYFTmNfb7B5SRSu3WX9E2cGVp6wNJKjsBltz+Z0n9tE/CQtXF5qG0R01JTfRfh0cugTWCHrUgrBGCHhiYS9cjRcYm44q2j94mcC2XkkEoT0b5kE4uMfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ocI8zjG1kkKrK6qq0zPpPmYkEraFiwJcmYbKLr1lbkY=;
 b=M3qBC8tIN1nDMfklGFGwpQQ4cF1xPrmd9fJCpyBQWmPAIeBZRfOLP2zHWUmLRxTiih6IPSeG7Eykc0BBbEj+7C3u0mi5Gaag4kX9sHnX5GmupLFRwIDG9hGWXDbtXCdL6yShygK6Y15vppbB/M0025RnEG2S0DDxyo5q0fpAEmEVKfjTvYPpLbR+uI6TfheLJt9T/dShBKeoznRMHnePZ/5kdG48TOWvdg91QFqf4fe4bOQ2iHIxhKhFIHOvWyOfHKtwjlY2G4xeisfGckYeLZbu+qjzdW2bkOQTNmXNKDHj0fUifsgwkTInjaqmGog3BZKKWieqdWx15WwP6zIoGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ocI8zjG1kkKrK6qq0zPpPmYkEraFiwJcmYbKLr1lbkY=;
 b=sW+JPB8MmBQW9vMCkjMIh2wYUzyOOsdbXPoo5871wMQwIT1Lkm2AHACwHxHSM53/+KVVcUjSC7OM0FPNtyXeJqZ4OrNIWTGmSx00cyMCXdklgUzfx/DTyC7RzJKA4ilg8UndGmqaMUjRSxssqiWpAWDjmiKkraflbK8c1HDeXr4=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TYVPR01MB11130.jpnprd01.prod.outlook.com
 (2603:1096:400:36c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.29; Wed, 14 Feb
 2024 15:39:10 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6719:535a:7217:9f0]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6719:535a:7217:9f0%3]) with mapi id 15.20.7292.026; Wed, 14 Feb 2024
 15:39:10 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, Sakari Ailus <sakari.ailus@linux.intel.com>,
	=?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@pengutronix.de>, Rob
 Herring <robh@kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	biju.das.au <biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 4/5] media: platform: rzg2l-cru: rzg2l-csi2:
 Restructure vclk handling
Thread-Topic: [PATCH v3 4/5] media: platform: rzg2l-cru: rzg2l-csi2:
 Restructure vclk handling
Thread-Index: AQHaXqhGELyMU+ISgk2KveoubLN5J7EJ7MUAgAANhhA=
Date: Wed, 14 Feb 2024 15:39:10 +0000
Message-ID:
 <TYCPR01MB11269F3CBE522B61195E319D0864E2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20240213181233.242316-1-biju.das.jz@bp.renesas.com>
 <20240213181233.242316-5-biju.das.jz@bp.renesas.com>
 <20240214144942.GA7120@pendragon.ideasonboard.com>
In-Reply-To: <20240214144942.GA7120@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TYVPR01MB11130:EE_
x-ms-office365-filtering-correlation-id: ecf92749-faec-496b-a574-08dc2d7316f5
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 5SyxBAK5lEy/WxvRrSxlxf3+YkfPZN07MIAT6VItHoNLki4BYNoIb5h0VOreUuxEN/ANBigMlZ7QP5WMY2NvNWuKIcPYm6xeqltdC05X160V49V944aFD9XPgbIh96GJbY3YMo1IZzCC7yqv1CTA6ZAgiu7r2E3slcSo4i8q3+rv40QuQm97b/N6pqtEK2lKCdfrv6bq5gGo20E0JKdSGMS5n8AYTP+A71uMyTNCCYRzsN7Y6dqacmd98aUKe3juK1WlTUI8DS8L0+aD/CJKufyJ0PbKqRTM8i1JhYJbiEhGSiSCKqBDC3lajfiLZhH3wEz5j6YiOd4IzVogjS+0OPBxWgGgUk2TQCJxpFRVbV1ekGlH+cKB3TSX0nKDB7S+Obrmyy0254mKrbstFZWRjSgwXmSqcQWZc939wA9KuS9hEb8FSnzd+qmOJgGFE1AFve1B99zkjYy7Ufei9k5devurL5ot/ovSozXM2gj/UwuJvUBL2rrRIvLQXBZbIrnythBGBBu6VJ90nJocMbolZNCq004sMVHf83GGTlvQloTIiiXe9/GssGbSit6VPn9me7xWxRWKLch/iNFm6TPZN1wIR8BcYZFVbT29TKM2TGKk0XyRpYu0ELqgvFOQrDE7
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(39860400002)(346002)(376002)(396003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(26005)(83380400001)(122000001)(38100700002)(6916009)(8676002)(4326008)(7416002)(5660300002)(8936002)(66556008)(66476007)(66446008)(64756008)(52536014)(76116006)(66946007)(2906002)(7696005)(9686003)(6506007)(53546011)(478600001)(41300700001)(54906003)(316002)(71200400001)(38070700009)(86362001)(33656002)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?a201b1JtTmF6MThhVjFCSEVQeDlSVmtvclVwVE5KamVISThjUjlncUovYllT?=
 =?utf-8?B?UFhRQ0orY09sb0premp3R3lkMnFzeTlZd1dUaGtvU1ZXdXBrd2dxQ1JpQ252?=
 =?utf-8?B?RHdLZFBBMzhDLzNuTGw3UWhyQ2JqNjFMOG9DRGo0NXpsa01GbU5NUU8xZ0Rx?=
 =?utf-8?B?aS9hSTdlSlB3R3VDZU9tMjltK25vYmhiT2E2TWwxRlNRdndpMjhoTVAzdG9D?=
 =?utf-8?B?TGF6S1BEblEvSFE5Z1FySGwxaklQbTAvZ244RHVGb2QrVXIzQ3RPSWJBWnRE?=
 =?utf-8?B?c3NNRUg1cSt6M01uZ1pXV3h2OFdBellmNkw5aTE0V1lGNmJsREFjRlU0UHo0?=
 =?utf-8?B?b2daTTJFVG12Y3VGdkVxSEJDZis2QWs3dHNVV3VUWDdSbExlS21SNXgvQ1Bm?=
 =?utf-8?B?QWc2R3puMm5obXI1Tmc0YkdIRmdEV2dONy9DK1BrWFdDMDlyOE5WcTFHalZy?=
 =?utf-8?B?V0hLR0xCVk0ySEFHSXg3ek5ML0d4REJkTHZxKys3b2ZER3lxL1V5bnA5Y0ZX?=
 =?utf-8?B?SjllUVBhU0F6UnRzVitESUpDWUVNQVZvNXh1TS9nc2JKeUVlWXRudDcyc3RJ?=
 =?utf-8?B?cHlJS3VaamVYbUxMZ2tOZGo1WkcrMXlpeDh0dGQ4MmFvM3MrbjRZSE4rVm9R?=
 =?utf-8?B?Q3Yvb0JISE9WZmRUQWExK0VrVHJsd1pvSWpYLzV5U1Q4c2J6MDlFbnVRa0Iw?=
 =?utf-8?B?dkJlOTZZcnJGVEVBazRHWGpTdXVuYVVXc21ZaEZqTStQT1FmQysvL2lGNnNo?=
 =?utf-8?B?ZGN0cDZpSDNUczhuRW1yT0JhUGxTZFZCcUU5OEtrdlNtT09qSzhCQkRraFpq?=
 =?utf-8?B?K2JCbXBraHVzckV3R0dCclpSNkJpUEMwS0x5bHJ4NDNwM0tUeHpRckJacWhk?=
 =?utf-8?B?OVhHdkE2ZEtEOFhoNDBVckhmSisrN3VXaUwvbmVOZG5vaXd4VzRQVndFNmN0?=
 =?utf-8?B?WUNsL0ozcnJJNXczTDlodFpOT2E4L3VRWW9YMzBNTHl0MWs1ZkhXMkE3RnJW?=
 =?utf-8?B?dURwcjBZS1RGWnJRakxXZVRFWjBzaGp4anRZdUF4MDlWL1N0ZEExczV6OUNr?=
 =?utf-8?B?ak52eW9DSnA5TTFYd3hJZ2xWNkZHQUZEU0NMbmVNOGt1Uk9LUzZrdVpXM242?=
 =?utf-8?B?T2xnTkpzRUhYdUh6ZUNqdGp3M2tvM2x1d2xndWJ5T1BLN3krN0c5MVBya1dP?=
 =?utf-8?B?Q3FxNXdzRmNNeUZaQklFMzlldDBZRndFYjlkUUVsdnNweFhoVkpiTERrelho?=
 =?utf-8?B?R050bFJKMVZHNHFveWtBclVyTyszbHNvOVV3S3hWekR5QUdLSU0yc09SemJx?=
 =?utf-8?B?TDFUaXRkUDh0a1ZRTHIyRjFmKzdWUEpNLzlDc1RoeHF4UllZYXorNDJwZTdX?=
 =?utf-8?B?YWJGNnFMRW9hZWlHUTVWcTg1WHFhVUc1ZSt5OWdYMExGTnZzOTN5c2JFNWwr?=
 =?utf-8?B?VjFlYWY1TXc0a01FaVlkQWNwQTZNVlcyMHZCVi90dmR1Mmg5U2x4VzdSSWFq?=
 =?utf-8?B?dGZoRThXKzNVVXNKb3BxNmhlOVJncmJOVGRzdkxSZVZTcWJ2a3QzVjFGMmdw?=
 =?utf-8?B?TlRWWkI2MExnOFVBZkdHcmx1QWhRa0o1cnprNVV4OWxpNThIcG5UQlh4YkNH?=
 =?utf-8?B?T2cwaU9kekxwM09SNHBKVkVWK1piUEJWUlkwOHM5Z3pYWGVQQk95K2xkeUdr?=
 =?utf-8?B?NDJEU0cwOGptSityOWlKbVE3enhpbHh6R1Q0d0t5SE9XVitwWWorcU5vam1E?=
 =?utf-8?B?dHcxWjRhVUZhbGRSRmdISXYvK2J6SW0vdTJlc3YwUVpyZEkrN1AzbytvUkhN?=
 =?utf-8?B?Nkc2OXJwRmZKMGZhamNhTGdpWS9MaFZRa0VPbVpCQjV5OU94K1c2ZG54VnZu?=
 =?utf-8?B?cmxZSVhCb0pRWnpucTFpL2MzSDcvRHRvWTJXbjFzN3l6dXoxWFV4Y3M4N0dw?=
 =?utf-8?B?TVcxQ2VNVjFQd001cGtVVjJxZERPb2RHZmpWSE56MGFEdXVZZWFWd0doQW9o?=
 =?utf-8?B?NkZGMFhLWnRwS05pUUV6eTF1K3NCTEpHZ0NDd1NSM3VDUzhOVHJJaUFrSVMw?=
 =?utf-8?B?L00rc1o1aEtScnRFNENrZzc2TS9Sc28rUUJsdDcxWDZxbVZEcjRsQkd4RTN0?=
 =?utf-8?B?TWtDbVIrUjhEUW01MkZUUFBjUytWcjBkTk9Rc0RNNUxGU3JvcGI4OXk5ajU0?=
 =?utf-8?B?UUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecf92749-faec-496b-a574-08dc2d7316f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2024 15:39:10.9015
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: soFoEYMDawSVXLCpwi3Mu/TCY64+/Sv3J3m9pzii2pXApBc7BNdmxgBALGqIc3WwfK5RVGby7Plot89Ep+Et5TC+dYKA9vMpQ+BBdX4W64w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB11130

SGkgTGF1cmVudCwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMYXVy
ZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+DQo+IFNlbnQ6
IFdlZG5lc2RheSwgRmVicnVhcnkgMTQsIDIwMjQgMjo1MCBQTQ0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIHYzIDQvNV0gbWVkaWE6IHBsYXRmb3JtOiByemcybC1jcnU6IHJ6ZzJsLWNzaTI6DQo+IFJl
c3RydWN0dXJlIHZjbGsgaGFuZGxpbmcNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBUaGFuayB5b3Ug
Zm9yIHRoZSBwYXRjaC4NCj4gDQo+IE9uIFR1ZSwgRmViIDEzLCAyMDI0IGF0IDA2OjEyOjMyUE0g
KzAwMDAsIEJpanUgRGFzIHdyb3RlOg0KPiA+IEFzIHBlciBzZWN0aW9uIDM1LjMuMSBTdGFydGlu
ZyBSZWNlcHRpb24gZm9yIHRoZSBNSVBJIENTSS0yIElucHV0IG9uDQo+ID4gdGhlIGxhdGVzdCBo
YXJkd2FyZSBtYW51YWwgKFIwMVVIMDkxNEVKMDE0NSBSZXYuMS40NSkgd2UgbmVlZCB0bw0KPiA+
IGRpc2FibGUgdGhlIHZjbGsgYmVmb3JlIGVuYWJsaW5nIHRoZSBMSU5LIHJlY2VwdGlvbiBhbmQg
ZW5hYmxlIHRoZQ0KPiA+IHZjbGsgYWZ0ZXIgZW5hYmxpbmcgdGhlIGxpbmsgUmVjZXB0aW9uLiBT
byByZXN0cnVjdHVyZSB2Y2xrIGhhbmRsaW5nIGFzDQo+IHBlciB0aGUgSFcgbWFudWFsLg0KPiA+
DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29t
Pg0KPiA+IC0tLQ0KPiA+IHYyLT52MzoNCj4gPiAgKiBVcGRhdGVkIGNvbW1pdCBoZWFkZXIgYW5k
IGRlc2NyaXB0aW9uDQo+ID4gICogU3BsaXQgdGhlIHBhdGNoIGludG8gMi4gUmVzdHJ1Y3R1cmlu
ZyBvZiB2Y2xrIGZvciBsaW5rIHJlY2VwdGlvbiBpcw0KPiA+ICAgIGhhbmRsZWQgaGVyZSBhbmQg
Zml4aW5nIHN0YXJ0IHJlY2VwdGlvbiBwcm9jZWR1cmUgaXMgaGFuZGxlZA0KPiA+ICAgIGluIHRo
ZSBuZXh0IHBhdGNoLg0KPiA+IHYxLT52MjoNCj4gPiAgKiBEcm9wcGVkIGNsay1wcm92aWRlci5o
IGFuZCBfX2Nsa19pc19lbmFibGVkKCkgYXMgY29uc3VtZXIgY2xrIHNob3VsZA0KPiA+ICAgIG5v
dCB1c2UgaXQuIFBsYW4gdG8gc2VuZCBSRkMgZm9yIGNsa19kaXNhYmxlX3VucHJlcGFyZV9zeW5j
KCkgaW4gY2NmLg0KPiA+IC0tLQ0KPiA+ICAuLi4vcGxhdGZvcm0vcmVuZXNhcy9yemcybC1jcnUv
cnpnMmwtY3J1LmggICAgfCAgMyAtLQ0KPiA+ICAuLi4vcGxhdGZvcm0vcmVuZXNhcy9yemcybC1j
cnUvcnpnMmwtY3NpMi5jICAgfCAyOCArKysrKysrKysrKy0tLS0tLS0tDQo+ID4gIC4uLi9wbGF0
Zm9ybS9yZW5lc2FzL3J6ZzJsLWNydS9yemcybC1pcC5jICAgICB8IDE1ICsrLS0tLS0tLS0NCj4g
PiAgLi4uL3BsYXRmb3JtL3JlbmVzYXMvcnpnMmwtY3J1L3J6ZzJsLXZpZGVvLmMgIHwgMTAgLS0t
LS0tLQ0KPiA+ICA0IGZpbGVzIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDM3IGRlbGV0aW9u
cygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vcmVuZXNh
cy9yemcybC1jcnUvcnpnMmwtY3J1LmgNCj4gPiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vcmVu
ZXNhcy9yemcybC1jcnUvcnpnMmwtY3J1LmgNCj4gPiBpbmRleCA4MTE2MDNmMThhZjAuLmE1YTk5
YjAwNDMyMiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3JlbmVzYXMv
cnpnMmwtY3J1L3J6ZzJsLWNydS5oDQo+ID4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9y
ZW5lc2FzL3J6ZzJsLWNydS9yemcybC1jcnUuaA0KPiA+IEBAIC0xMzMsOSArMTMzLDYgQEAgc3Ry
dWN0IHJ6ZzJsX2NydV9kZXYgew0KPiA+ICAJc3RydWN0IHY0bDJfcGl4X2Zvcm1hdCBmb3JtYXQ7
DQo+ID4gIH07DQo+ID4NCj4gPiAtdm9pZCByemcybF9jcnVfdmNsa191bnByZXBhcmUoc3RydWN0
IHJ6ZzJsX2NydV9kZXYgKmNydSk7IC1pbnQNCj4gPiByemcybF9jcnVfdmNsa19wcmVwYXJlKHN0
cnVjdCByemcybF9jcnVfZGV2ICpjcnUpOw0KPiA+IC0NCj4gPiAgaW50IHJ6ZzJsX2NydV9zdGFy
dF9pbWFnZV9wcm9jZXNzaW5nKHN0cnVjdCByemcybF9jcnVfZGV2ICpjcnUpOw0KPiA+IHZvaWQg
cnpnMmxfY3J1X3N0b3BfaW1hZ2VfcHJvY2Vzc2luZyhzdHJ1Y3QgcnpnMmxfY3J1X2RldiAqY3J1
KTsNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3JlbmVzYXMv
cnpnMmwtY3J1L3J6ZzJsLWNzaTIuYw0KPiA+IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9yZW5l
c2FzL3J6ZzJsLWNydS9yemcybC1jc2kyLmMNCj4gPiBpbmRleCBlMDBkOTM3OWRkMmMuLmU2OGZj
ZGFlYTIwNyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3JlbmVzYXMv
cnpnMmwtY3J1L3J6ZzJsLWNzaTIuYw0KPiA+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0v
cmVuZXNhcy9yemcybC1jcnUvcnpnMmwtY3NpMi5jDQo+ID4gQEAgLTEwOCw2ICsxMDgsNyBAQCBz
dHJ1Y3QgcnpnMmxfY3NpMiB7DQo+ID4gIAlzdHJ1Y3QgcmVzZXRfY29udHJvbCAqcHJlc2V0bjsN
Cj4gPiAgCXN0cnVjdCByZXNldF9jb250cm9sICpjbW5fcnN0YjsNCj4gPiAgCXN0cnVjdCBjbGsg
KnN5c2NsazsNCj4gPiArCXN0cnVjdCBjbGsgKnZjbGs7DQo+ID4gIAl1bnNpZ25lZCBsb25nIHZj
bGtfcmF0ZTsNCj4gPg0KPiA+ICAJc3RydWN0IHY0bDJfc3ViZGV2IHN1YmRldjsNCj4gPiBAQCAt
MzYxLDcgKzM2Miw3IEBAIHN0YXRpYyBpbnQgcnpnMmxfY3NpMl9kcGh5X3NldHRpbmcoc3RydWN0
DQo+IHY0bDJfc3ViZGV2ICpzZCwgYm9vbCBvbikNCj4gPiAgCXJldHVybiByemcybF9jc2kyX2Rw
aHlfZGlzYWJsZShjc2kyKTsgIH0NCj4gPg0KPiA+IC1zdGF0aWMgdm9pZCByemcybF9jc2kyX21p
cGlfbGlua19lbmFibGUoc3RydWN0IHJ6ZzJsX2NzaTIgKmNzaTIpDQo+ID4gK3N0YXRpYyBpbnQg
cnpnMmxfY3NpMl9taXBpX2xpbmtfZW5hYmxlKHN0cnVjdCByemcybF9jc2kyICpjc2kyKQ0KPiA+
ICB7DQo+ID4gIAl1bnNpZ25lZCBsb25nIHZjbGtfcmF0ZSA9IGNzaTItPnZjbGtfcmF0ZSAvIEha
X1BFUl9NSFo7DQo+ID4gIAl1MzIgZnJyc2t3LCBmcnJjbGssIGZycnNrd19jb2VmZiwgZnJyY2xr
X2NvZWZmOyBAQCAtMzg2LDExICszODcsMTUNCj4gPiBAQCBzdGF0aWMgdm9pZCByemcybF9jc2ky
X21pcGlfbGlua19lbmFibGUoc3RydWN0IHJ6ZzJsX2NzaTIgKmNzaTIpDQo+ID4gIAlyemcybF9j
c2kyX3dyaXRlKGNzaTIsIENTSTJuRFRFTCwgMHhmNzc4ZmYwZik7DQo+ID4gIAlyemcybF9jc2ky
X3dyaXRlKGNzaTIsIENTSTJuRFRFSCwgMHgwMGZmZmYxZik7DQo+ID4NCj4gPiArCWNsa19kaXNh
YmxlX3VucHJlcGFyZShjc2kyLT52Y2xrKTsNCj4gPiArDQo+ID4gIAkvKiBFbmFibGUgTElOSyBy
ZWNlcHRpb24gKi8NCj4gPiAgCXJ6ZzJsX2NzaTJfd3JpdGUoY3NpMiwgQ1NJMm5NQ1QzLCBDU0ky
bk1DVDNfUlhFTik7DQo+ID4gKw0KPiA+ICsJcmV0dXJuIGNsa19wcmVwYXJlX2VuYWJsZShjc2ky
LT52Y2xrKTsNCj4gPiAgfQ0KPiA+DQo+ID4gLXN0YXRpYyB2b2lkIHJ6ZzJsX2NzaTJfbWlwaV9s
aW5rX2Rpc2FibGUoc3RydWN0IHJ6ZzJsX2NzaTIgKmNzaTIpDQo+ID4gK3N0YXRpYyBpbnQgcnpn
MmxfY3NpMl9taXBpX2xpbmtfZGlzYWJsZShzdHJ1Y3QgcnpnMmxfY3NpMiAqY3NpMikNCj4gPiAg
ew0KPiA+ICAJdW5zaWduZWQgaW50IHRpbWVvdXQgPSBWU1JTVFNfUkVUUklFUzsNCj4gPg0KPiA+
IEBAIC00MDksMTggKzQxNCwyMSBAQCBzdGF0aWMgdm9pZCByemcybF9jc2kyX21pcGlfbGlua19k
aXNhYmxlKHN0cnVjdA0KPiA+IHJ6ZzJsX2NzaTIgKmNzaTIpDQo+ID4NCj4gPiAgCWlmICghdGlt
ZW91dCkNCj4gPiAgCQlkZXZfZXJyKGNzaTItPmRldiwgIkNsZWFyaW5nIENTSTJuUlRTVC5WU1JT
VFMgdGltZWQgb3V0XG4iKTsNCj4gPiArDQo+ID4gKwlyZXR1cm4gMDsNCj4gPiAgfQ0KPiA+DQo+
ID4gIHN0YXRpYyBpbnQgcnpnMmxfY3NpMl9taXBpX2xpbmtfc2V0dGluZyhzdHJ1Y3QgdjRsMl9z
dWJkZXYgKnNkLCBib29sDQo+ID4gb24pICB7DQo+ID4gIAlzdHJ1Y3QgcnpnMmxfY3NpMiAqY3Np
MiA9IHNkX3RvX2NzaTIoc2QpOw0KPiA+ICsJaW50IHJldDsNCj4gPg0KPiA+ICAJaWYgKG9uKQ0K
PiA+IC0JCXJ6ZzJsX2NzaTJfbWlwaV9saW5rX2VuYWJsZShjc2kyKTsNCj4gPiArCQlyZXQgPSBy
emcybF9jc2kyX21pcGlfbGlua19lbmFibGUoY3NpMik7DQo+ID4gIAllbHNlDQo+ID4gLQkJcnpn
MmxfY3NpMl9taXBpX2xpbmtfZGlzYWJsZShjc2kyKTsNCj4gPiArCQlyZXQgPSByemcybF9jc2ky
X21pcGlfbGlua19kaXNhYmxlKGNzaTIpOw0KPiA+DQo+ID4gLQlyZXR1cm4gMDsNCj4gPiArCXJl
dHVybiByZXQ7DQo+ID4gIH0NCj4gPg0KPiA+ICBzdGF0aWMgaW50IHJ6ZzJsX2NzaTJfc19zdHJl
YW0oc3RydWN0IHY0bDJfc3ViZGV2ICpzZCwgaW50IGVuYWJsZSkgQEANCj4gPiAtNzMxLDcgKzcz
OSw2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbWVkaWFfZW50aXR5X29wZXJhdGlvbnMNCj4gPiBy
emcybF9jc2kyX2VudGl0eV9vcHMgPSB7ICBzdGF0aWMgaW50IHJ6ZzJsX2NzaTJfcHJvYmUoc3Ry
dWN0DQo+ID4gcGxhdGZvcm1fZGV2aWNlICpwZGV2KSAgew0KPiA+ICAJc3RydWN0IHJ6ZzJsX2Nz
aTIgKmNzaTI7DQo+ID4gLQlzdHJ1Y3QgY2xrICp2Y2xrOw0KPiA+ICAJaW50IHJldDsNCj4gPg0K
PiA+ICAJY3NpMiA9IGRldm1fa3phbGxvYygmcGRldi0+ZGV2LCBzaXplb2YoKmNzaTIpLCBHRlBf
S0VSTkVMKTsgQEANCj4gPiAtNzU3LDEyICs3NjQsMTEgQEAgc3RhdGljIGludCByemcybF9jc2ky
X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UNCj4gKnBkZXYpDQo+ID4gIAkJcmV0dXJuIGRl
dl9lcnJfcHJvYmUoJnBkZXYtPmRldiwgUFRSX0VSUihjc2kyLT5zeXNjbGspLA0KPiA+ICAJCQkJ
ICAgICAiRmFpbGVkIHRvIGdldCBzeXN0ZW0gY2xrXG4iKTsNCj4gPg0KPiA+IC0JdmNsayA9IGNs
a19nZXQoJnBkZXYtPmRldiwgInZpZGVvIik7DQo+ID4gLQlpZiAoSVNfRVJSKHZjbGspKQ0KPiA+
IC0JCXJldHVybiBkZXZfZXJyX3Byb2JlKCZwZGV2LT5kZXYsIFBUUl9FUlIodmNsayksDQo+ID4g
Kwljc2kyLT52Y2xrID0gZGV2bV9jbGtfZ2V0KCZwZGV2LT5kZXYsICJ2aWRlbyIpOw0KPiA+ICsJ
aWYgKElTX0VSUihjc2kyLT52Y2xrKSkNCj4gPiArCQlyZXR1cm4gZGV2X2Vycl9wcm9iZSgmcGRl
di0+ZGV2LCBQVFJfRVJSKGNzaTItPnZjbGspLA0KPiA+ICAJCQkJICAgICAiRmFpbGVkIHRvIGdl
dCB2aWRlbyBjbG9ja1xuIik7DQo+ID4gLQljc2kyLT52Y2xrX3JhdGUgPSBjbGtfZ2V0X3JhdGUo
dmNsayk7DQo+ID4gLQljbGtfcHV0KHZjbGspOw0KPiA+ICsJY3NpMi0+dmNsa19yYXRlID0gY2xr
X2dldF9yYXRlKGNzaTItPnZjbGspOw0KPiA+DQo+ID4gIAljc2kyLT5kZXYgPSAmcGRldi0+ZGV2
Ow0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vcmVuZXNhcy9y
emcybC1jcnUvcnpnMmwtaXAuYw0KPiA+IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9yZW5lc2Fz
L3J6ZzJsLWNydS9yemcybC1pcC5jDQo+ID4gaW5kZXggODQ2NmI0ZTU1OTA5Li4yZDIyYzM3MzU4
OGIgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9yZW5lc2FzL3J6ZzJs
LWNydS9yemcybC1pcC5jDQo+ID4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9yZW5lc2Fz
L3J6ZzJsLWNydS9yemcybC1pcC5jDQo+ID4gQEAgLTgwLDIwICs4MCw5IEBAIHN0YXRpYyBpbnQg
cnpnMmxfY3J1X2lwX3Nfc3RyZWFtKHN0cnVjdCB2NGwyX3N1YmRldg0KPiAqc2QsIGludCBlbmFi
bGUpDQo+ID4gIAkJCXJldHVybiByZXQ7DQo+ID4gIAkJfQ0KPiA+DQo+ID4gLQkJcnpnMmxfY3J1
X3ZjbGtfdW5wcmVwYXJlKGNydSk7DQo+ID4gLQ0KPiA+ICAJCXJldCA9IHY0bDJfc3ViZGV2X2Nh
bGwoY3J1LT5pcC5yZW1vdGUsIHZpZGVvLCBzX3N0cmVhbSwNCj4gZW5hYmxlKTsNCj4gPiAtCQlp
ZiAocmV0ID09IC1FTk9JT0NUTENNRCkNCj4gPiAtCQkJcmV0ID0gMDsNCj4gPiAtCQlpZiAoIXJl
dCkgew0KPiA+IC0JCQlyZXQgPSByemcybF9jcnVfdmNsa19wcmVwYXJlKGNydSk7DQo+ID4gLQkJ
CWlmICghcmV0KQ0KPiA+IC0JCQkJcmV0dXJuIDA7DQo+ID4gLQkJfSBlbHNlIHsNCj4gPiAtCQkJ
LyogZW5hYmxlIGJhY2sgdmNsayBzbyB0aGF0IHNfc3RyZWFtIGluIGVycm9yIHBhdGgNCj4gZGlz
YWJsZXMgaXQgKi8NCj4gPiAtCQkJaWYgKHJ6ZzJsX2NydV92Y2xrX3ByZXBhcmUoY3J1KSkNCj4g
PiAtCQkJCWRldl9lcnIoY3J1LT5kZXYsICJGYWlsZWQgdG8gZW5hYmxlIHZjbGtcbiIpOw0KPiA+
IC0JCX0NCj4gPiArCQlpZiAoIXJldCB8fCAocmV0ID09IC1FTk9JT0NUTENNRCkpDQo+IA0KPiBO
byBuZWVkIGZvciB0aGUgaW5uZXIgcGFyZW50aGVzZXMuDQo+IA0KPiBJIGNhbiBmaXggdGhpcyB3
aGVuIGFwcGx5aW5nLCBubyBuZWVkIHRvIHNlbmQgYSB2NCBqdXN0IGZvciB0aGlzLg0KDQpUaGFu
ayB5b3UsDQpCaWp1DQo=

