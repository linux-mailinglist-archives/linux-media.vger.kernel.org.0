Return-Path: <linux-media+bounces-4102-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 07ED38397C1
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 19:34:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D6661C235D6
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 18:34:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C816811FE;
	Tue, 23 Jan 2024 18:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="DNk8mkJr"
X-Original-To: linux-media@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2100.outbound.protection.outlook.com [40.107.113.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60395CAF;
	Tue, 23 Jan 2024 18:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706034844; cv=fail; b=sZA7C7RbfPQ6dIE92mPv2JIPMALhE3Ujc2VHoMKN7Bb605Z3QJUn2E6fNF0xpcRyqjurvh/zGnw+nsBydKCNnU9rf+QOh33HIWeki+WT48HRKYxTlIQwghM11WPm6Fx6mbYXCGsMIuOJHu6H8/U2JyuBvgpcOy79Em8p1EWclBQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706034844; c=relaxed/simple;
	bh=7llFPvOgROONKXWEI8obqmCAvYWwHz7Gx1PtBKqnno8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MrZamDF1s5t5NkV9knL63jgg8MrT7npzI9R2+1p8/S8Y6lWuQ0Vn2wCnlAUOWIZLK/nad307V3uF/uErjdOv/fhNloyunUupvFslwxQtOzeZaZDy22E/w8oSkRlsLN9sovWSeVsujLZkjPBU0ej5QMnAqqS839qHqsgosKlAg5o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=DNk8mkJr; arc=fail smtp.client-ip=40.107.113.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lEoDs2rGBwMZBxOxJtSJvMqUJ8nNqQo3KvVjJZEBZBOd9jS3K5VnmxdqyDQiTfYTracDFXVnudihmjM5gSI9vJAIePhN+1fGDPBMM/PfbTKVz/s6uwomJcwxvOF20GNRC8kuhUZIwc2t9Yq3fNs/dxb4xnJoIEtttG6PaX7nJlhlPApLZlA7EOBdxIMbtmE7Wf/NXf6yPHCuNcQKO/9ZzT0wICJY6mkg3t2xH+FRCE3RfT5107AFTasT6Cd8diXEfeoMF/TvX+ap5DZBHRAvuliDmisXsOxQckfmr0gWr6IyNccx0lNFbvNGDn8eLaJ5Z7+m/2rcoidCvCUEtHXqXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7llFPvOgROONKXWEI8obqmCAvYWwHz7Gx1PtBKqnno8=;
 b=Uvqnrl9YhZTJA2X0C22CkfMvMH37BajpXForyPuW34Bz2ZT0fiR1IHv8D44S193APNPirOhUohwbku5Bh+d0weLM/2/SbtQhHMHzWNsbU3J+A0sw0BEcrQtInJaxGXWZXCCpg3BCjOSWx0pSV8gSevuuChZMRFQBay70eOFqtW8bV7N/cujCjR/pPMfP44bLmANoZ53ro+MBo/I2Z4316lWOliLjuW+fdVNCwjkUwNESzeJmaHUV5U8SNZ8Wxfm1n2wDAs16iaFZsO7qdNVZ17XcDlein7WA26q9wji2uuwovrFjeYwCv1v0qOE9jos4LxkeMIYuyYqF0QUmh/IOXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7llFPvOgROONKXWEI8obqmCAvYWwHz7Gx1PtBKqnno8=;
 b=DNk8mkJrKp/gWuwrITsBh6JwIVvImAqSH7UHWhzEoq5G5E2xuncdK4p9MXVHDVd+glFZ2KNZcuPnVLpkuZJ3twhn01PEyIomgV8YS5/EOh9qcRgIrHBwkeWHfScUmK6WzbV42DVMMLs2h0bPQ3gPHeoXksTbpyfAC3Za/XaYjXU=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by OS3PR01MB6119.jpnprd01.prod.outlook.com
 (2603:1096:604:d0::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Tue, 23 Jan
 2024 18:33:58 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::8d12:a02a:9fdc:9c78]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::8d12:a02a:9fdc:9c78%5]) with mapi id 15.20.7228.022; Tue, 23 Jan 2024
 18:33:57 +0000
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
Subject: RE: [PATCH 1/4] media: platform: rzg2l-cru: rzg2l-csi2: Switch to
 RUNTIME_PM_OPS()
Thread-Topic: [PATCH 1/4] media: platform: rzg2l-cru: rzg2l-csi2: Switch to
 RUNTIME_PM_OPS()
Thread-Index: AQHaTfN9Uij8sadCTkmiU8hxdWoHD7DnheYAgAAqlgA=
Date: Tue, 23 Jan 2024 18:33:57 +0000
Message-ID:
 <TYCPR01MB11269085947ED450E817D54BB86742@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20240123115821.292787-1-biju.das.jz@bp.renesas.com>
 <20240123115821.292787-2-biju.das.jz@bp.renesas.com>
 <20240123152906.GP10679@pendragon.ideasonboard.com>
In-Reply-To: <20240123152906.GP10679@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|OS3PR01MB6119:EE_
x-ms-office365-filtering-correlation-id: f1926ce3-4ad6-4c8f-f623-08dc1c41dc90
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 /hY2IzZxdePTYr9qaJfP/VrAHQasRHvSDN0NZLJWshrP3bSIazHF+H9Xq2bVNWWeOiSi9TXbQO/R7UVDeWj60VDnSbKilSNVGQVEJGCEcgDapfQANZSf7lmRuUdiJ96DvXOFwe9uoe33g7bWVg60tNIfolDwRun02yl8qQKN85Tzea8RYXQvNooSpJXVy84FPoUwo/7SDyjSBKnB/ABAvy3SG3TNBSGanIV2L89cS/ewFmtfk2IaxEV8JiMSRJsldeIZyJbla/1Ll0Ysi037O7Vp2GXT7Q4psacTz2S9Hm5HYWml58DCsQrZkldByN4/GSWVlWPLOXzFDy1v3ktgFxbqbPrWOJ0NJI7S74n20f3QkHHlqBk9YT2MGGoIcalk0YsrNZ3ToqKxu1cpgAyj93SHMUoStx0j0rzf0aVrgOLOu4I5XPIH0CNxcqvUJjVCjztuqpuJB8hNGQIMnC8ExAgUfezTojHOhKjq5L/JZY/ORESEmz81oaVd8kPjEeAYglv7Imd1Ee8OG1xb6ZHy/1swuEcpMqM3zylrQvmNhMGI7Gc4/s7zKOzJL1x2iuCeYVqLj+nKh9EdvSSG6knissuEA21MggXQvB8Bbecetp6NWRmaFVLibIuasHzZL1AyPzQBTlR9ybLXod81HwzABg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(346002)(366004)(376002)(39860400002)(230173577357003)(230273577357003)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(41300700001)(122000001)(38100700002)(38070700009)(86362001)(33656002)(316002)(6916009)(66556008)(966005)(66476007)(76116006)(66946007)(54906003)(64756008)(66446008)(5660300002)(2906002)(7416002)(4326008)(8936002)(8676002)(52536014)(71200400001)(83380400001)(26005)(478600001)(7696005)(6506007)(9686003)(53546011)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aTFkamFYTG95TWFVcWxuOUtUMFY5dGswMnI0TkNNNFFWTVJKeFIvdkRVU2dG?=
 =?utf-8?B?UXVQZ3lyaFByWXp1MFc3eXJxZ3dsUHNjQk5yaEJ6YkRKVW8zVWExaVRXbTFY?=
 =?utf-8?B?SkxiTU1Lc3BZb0V3RTdWTjlVc1haQ2Q0UzE4M3ltY3B5OTRZMkJ3Q3RyZ3JM?=
 =?utf-8?B?N29zNkJvcFlIajd0eDJObXRjb1IyM3NUVkxmbWhsT1JzKys2ZmFQR0Rvb3pu?=
 =?utf-8?B?YnFyV2ZiWHZTSlh1UTNCdko4T2I1UHNuZURnejREdTFROFA2bGdCUDBjZ1Jw?=
 =?utf-8?B?b2xKVWQzbXFQQWF3VnBsN2dMczcrcjhHUGtqaUI2ZGRIZndLNHJ6ZE5oRHhm?=
 =?utf-8?B?RWFLblp5ZE9NWjlDNVFVdkNRMkNPamZTU3Y4U3lXdVpaNHhYZmVMV0pKMTVx?=
 =?utf-8?B?M255dGF2R2QxZmRGSXB0Sk5TTWVNVTg2b2c3MThPakl6ODR4b1VrN0V3dTFr?=
 =?utf-8?B?ZzNUVW1DQUpPeXAxejg3dDJtNHVVWEhybEZqcGtQRFZMM1ZnMWt5anBneTdZ?=
 =?utf-8?B?VjJITFhUMTBXay83b2JZQlBnSVN5M0tmM2swczJ3S0xxVWh5K09Oa1lBYmxZ?=
 =?utf-8?B?NC9vMlVCM0RUd2xsdmk5NTU3SEJaQjR5MjlXRkZ1clp6RFJrbGExdGhkZFY3?=
 =?utf-8?B?Q0NMMy9FWVo3eXFFcWNJNXFHTk41VHA4WjhiODQ5TVM0TVpaTjhmSHFZZGNr?=
 =?utf-8?B?ZDNTVXhmQnZhbzI5cEVZZzdKUzBUcEhBQ05MdDFCWFJ3VDVjdVJyaEFMeWVq?=
 =?utf-8?B?NGhmQlZOTVFSK2xVNEl5L242UWV1U1pCMHVqalZBV2JQNnIrUnNVQThwelY3?=
 =?utf-8?B?WmIwelE3RndRZGZ6NU1jWWlaVHVSNGxnWWp1cDIyd21vZkN2dDgxSXR3aWZx?=
 =?utf-8?B?bFd5S3EvMHoxUlJ6SVRPRzJhTGMrS24zZnN0bkJUa0hHZFJXcTEwL2NTZUpX?=
 =?utf-8?B?N1IrdzVxWmFBcm1pak4xUkFqMU5xYWpQUkVHRXU5bkE4aUVZb0gwYXB1ZTV2?=
 =?utf-8?B?cHJheXY4ZXhvOFNHY2VhWjA1cHlBeU9WWG84UFlBU3Q1dkFnRkdLMGI2c3BF?=
 =?utf-8?B?ZzdJQllDV3h0REJWVjFqd1hpRG1LNlRjSDVEK2crcmtkb0hCMDR4SGxhbThv?=
 =?utf-8?B?ZUttUVlGTWt6a215M1BnZyswR2FXN1FKWWRYQjNnQXVObHdpdnJxbmtVMHBP?=
 =?utf-8?B?amZHZFI1Y25KVlViZ3UwbFp5dkprSUc3enFXU1JEbHRDcS9TMlhncjRqTmhL?=
 =?utf-8?B?SENRVFVWeVFEbUhSVjRpRTFEUGlFVE82MG5wVVdBb0F3R1RUbjhlSzYyNVl1?=
 =?utf-8?B?L2xucVpnVTZZZ21LNWY0bTAxYndYMy9PYWVWK2t2eERIbnlEK3BIMHd5QjMz?=
 =?utf-8?B?dlpuVXRDc243VlYwektWenlVbHF5NjFSUkdINDhpUk1BYjJra3V0dHU1VEFV?=
 =?utf-8?B?SDFlSHdJcWFVVlJwblMrRzU2Y0l6UGVwS0pyTGFIeEtsaThlR3ZhT2JSUjZY?=
 =?utf-8?B?UnVyc2VnazdWSzVYcTY1eFd2cUNGVkQxNGd3ZUhBa1gwUlFnY0o4alFXa1JC?=
 =?utf-8?B?aVhMaVVlcXJYR1d2cy9tSUlYN0hENnFBZStteUdxbEc5RzRzZVdha3pGRmQy?=
 =?utf-8?B?TldrdkJsWEEwWjdpcTcremxPcXAvd3RuZlcrUkpvcG40T1AvMmVZQ0NNSThO?=
 =?utf-8?B?N0g4SVdDZTAxa1U2R1haVW5zaSt1bVdQaUMzQ3JLMzFpdzVUSTFJVDl4VFlt?=
 =?utf-8?B?eTY1UHpycUxjL3Y3aHovRmZiN3RneTRPQTZxc3ZYSFZUbDhaa1Q3R3JBWG5p?=
 =?utf-8?B?a3BqczVUdWxSU2tKVGJMMTZ5RkgvRTJ1YmhaaUtyTUpmUy85eTMvNlAxMHI5?=
 =?utf-8?B?K29td0N0VHc5WGs0dXZvMVVBbHVaRjVJL3NHQmhCZ1hsVHE5NzdwTGRmK1dq?=
 =?utf-8?B?T29kN25SK2ZiWVNJR1hFTGdzbkwyRDR4SVd4NVZ3QmloOXlMZUhNanRheFh4?=
 =?utf-8?B?S3BSUVlXVnJsenJLWGJKdG1vSzliUDRCa1NXYTYrZ1BidzFKRDlQNlFVUjkr?=
 =?utf-8?B?RFAxamV4QUdWUUllVzJJcTlJWmNwL3ZXbGZ6ckMwOWlEekZoakJBQXUzVito?=
 =?utf-8?B?eUJQSWMxb05NdWZCK3V5UkVXSGI4VmcxYkFKYkVEVGFtVVlZMkk0dEVsV2Iz?=
 =?utf-8?B?eVE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f1926ce3-4ad6-4c8f-f623-08dc1c41dc90
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2024 18:33:57.8590
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g1om4U9tHN+NWzEpSJfI9P+AEpaCi8u7Ccn36RudKVTAn4ty3p4R8iShAT4w8LH3CSFrmD2N9Y6COgsgk3L5s6Xt3Cr7oX8ZkkD9xGr5V60=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6119

SGkgTGF1cmVudCBQaW5jaGFydCwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVu
dC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBKYW51YXJ5IDIz
LCAyMDI0IDM6MjkgUE0NCj4gU3ViamVjdDogUmU6IFtQQVRDSCAxLzRdIG1lZGlhOiBwbGF0Zm9y
bTogcnpnMmwtY3J1OiByemcybC1jc2kyOiBTd2l0Y2ggdG8NCj4gUlVOVElNRV9QTV9PUFMoKQ0K
PiANCj4gSGkgQmlqdSwNCj4gDQo+IFRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLg0KPiANCj4gT24g
VHVlLCBKYW4gMjMsIDIwMjQgYXQgMTE6NTg6MThBTSArMDAwMCwgQmlqdSBEYXMgd3JvdGU6DQo+
ID4gU0VUX1JVTlRJTUVfUE1fT1BTKCkgYXJlIGRlcHJlY2F0ZWQNCj4gDQo+IE5vdCB0aGF0IEkg
cGFydGljdWxhcmx5IGNhcmUgYWJvdXQgU0VUX1JVTlRJTUVfUE1fT1BTLCBidXQgSSdtIG5vdCBh
d2FyZQ0KPiBvZiBpdCBiZWluZyBkZXByZWNhdGVkLiBIYXMgdGhhdCBiZWVuIGFubm91bmNlZCBz
b21ld2hlcmUgPw0KDQpJIHdhcyB1bmRlciB0aGUgaW1wcmVzc2lvbiBmcm9tIFsxXSwgdGhpcyBp
cyBuZXcgc3R5bGUgYW5kIG9sZCBzdHlsZSBnb2luZyB0byBiZSBkZXByZWNhdGVkLg0KDQpJZiBp
dCBpcyBub3QgdGhlIGNhc2UsIEkgd291bGQgbGlrZSB0byBkcm9wIHRoaXMgcGF0Y2guDQoNClsx
XSBodHRwczovL3d3dy5zcGluaWNzLm5ldC9saXN0cy9zdGFibGUvbXNnNjkxNDE2Lmh0bWwNCg0K
PiANCj4gPiBhbmQgcmVxdWlyZSBfX21heWJlX3VudXNlZA0KPiA+IHByb3RlY3Rpb24gYWdhaW5z
dCB1bnVzZWQgZnVuY3Rpb24gd2FybmluZ3MuIFRoZSB1c2FnZSBvZiBwbV9wdHIoKSBhbmQNCj4g
PiBSVU5USU1FX1BNX09QUygpIGFsbG93cyB0aGUgY29tcGlsZXIgdG8gc2VlIHRoZSBmdW5jdGlv
bnMsIHRodXMNCj4gPiBzdXBwcmVzc2luZyB0aGUgd2FybmluZy4gVGh1cyBkcm9wIHRoZSBfX21h
eWJlX3VudXNlZCBtYXJraW5ncy4NCj4gDQo+IEhhdmUgeW91IHRyaWVkIHRvIGNvbXBpbGUgdGhp
cyB3aXRoIENPTkZJR19QTSBkaXNhYmxlZCwgYW5kIGNvbmZpcm1lZCB0aGUNCj4gY29tcGlsZXIg
ZG9lc24ndCBnZW5lcmF0ZSBhbnkgd2FybmluZyA/DQoNCkkgYW0gbm90IGFibGUgdG8gY29tcGls
ZSB3aXRoIENPTkZJR19QTSBkaXNhYmxlZCBhcyBpdCBpcyB0aHJvd2luZyBlcnJvcnMgaW4gcG93
ZXIgbWFuYWdlbWVudCBjb2RlLg0KDQprZXJuZWwvcG93ZXIvc3VzcGVuZC5jOiBJbiBmdW5jdGlv
biDigJhzdXNwZW5kX3ByZXBhcmXigJk6DQprZXJuZWwvcG93ZXIvc3VzcGVuZC5jOjM2MDoxMDog
ZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uIOKAmHBtX25vdGlmaWVyX2Nh
bGxfY2hhaW5fcm9idXN04oCZOyBkaWQgeW91IG1lYW4g4oCYcmF3X25vdGlmaWVyX2NhbGxfY2hh
aW5fcm9idXN04oCZPyBbLVdlcnJvcj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0NCiAg
MzYwIHwgIGVycm9yID0gcG1fbm90aWZpZXJfY2FsbF9jaGFpbl9yb2J1c3QoUE1fU1VTUEVORF9Q
UkVQQVJFLCBQTV9QT1NUX1NVU1BFTkQpOw0KICAgICAgfCAgICAgICAgICBefn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fg0KICAgICAgfCAgICAgICAgICByYXdfbm90aWZpZXJfY2FsbF9jaGFp
bl9yb2J1c3QNCmtlcm5lbC9wb3dlci9oaWJlcm5hdGUuYzozMjU6MjogZXJyb3I6IGltcGxpY2l0
IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uIOKAmHNhdmVfcHJvY2Vzc29yX3N0YXRl4oCZIFstV2Vy
cm9yPWltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQ0KICAzMjUgfCAgc2F2ZV9wcm9jZXNz
b3Jfc3RhdGUoKTsNCiAgICAgIHwgIF5+fn5+fn5+fn5+fn5+fn5+fn5+DQprZXJuZWwvcG93ZXIv
c3VzcGVuZC5jOjM3MjoyOiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24g
4oCYcG1fbm90aWZpZXJfY2FsbF9jaGFpbuKAmTsgZGlkIHlvdSBtZWFuIOKAmHJhd19ub3RpZmll
cl9jYWxsX2NoYWlu4oCZPyBbLVdlcnJvcj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0N
CiAgMzcyIHwgIHBtX25vdGlmaWVyX2NhbGxfY2hhaW4oUE1fUE9TVF9TVVNQRU5EKTsNCiAgICAg
IHwgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn4NCiAgICAgIHwgIHJhd19ub3RpZmllcl9jYWxsX2No
YWluDQogIENDICAgICAgaW9fdXJpbmcvdGltZW91dC5vDQprZXJuZWwvcG93ZXIvc3VzcGVuZC5j
OiBJbiBmdW5jdGlvbiDigJhzdXNwZW5kX2VudGVy4oCZOg0Ka2VybmVsL3Bvd2VyL3N1c3BlbmQu
Yzo0MDU6MTA6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiDigJhkcG1f
c3VzcGVuZF9sYXRl4oCZOyBkaWQgeW91IG1lYW4g4oCYZHBtX3N1c3BlbmRfc3RhcnTigJk/IFst
V2Vycm9yPWltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQ0KICA0MDUgfCAgZXJyb3IgPSBk
cG1fc3VzcGVuZF9sYXRlKFBNU0dfU1VTUEVORCk7DQogICAgICB8ICAgICAgICAgIF5+fn5+fn5+
fn5+fn5+fn4NCiAgICAgIHwgICAgICAgICAgZHBtX3N1c3BlbmRfc3RhcnQgDQoNCj4gDQo+ID4g
U2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+
IC0tLQ0KPiA+ICBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL3JlbmVzYXMvcnpnMmwtY3J1L3J6ZzJs
LWNzaTIuYyB8IDggKysrKy0tLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KSwgNCBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3Bs
YXRmb3JtL3JlbmVzYXMvcnpnMmwtY3J1L3J6ZzJsLWNzaTIuYw0KPiA+IGIvZHJpdmVycy9tZWRp
YS9wbGF0Zm9ybS9yZW5lc2FzL3J6ZzJsLWNydS9yemcybC1jc2kyLmMNCj4gPiBpbmRleCBkMjBm
NGVmZjkzYTQuLmM0NjA5ZGE5YmYxYSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL21lZGlhL3Bs
YXRmb3JtL3JlbmVzYXMvcnpnMmwtY3J1L3J6ZzJsLWNzaTIuYw0KPiA+ICsrKyBiL2RyaXZlcnMv
bWVkaWEvcGxhdGZvcm0vcmVuZXNhcy9yemcybC1jcnUvcnpnMmwtY3NpMi5jDQo+ID4gQEAgLTgz
NCw3ICs4MzQsNyBAQCBzdGF0aWMgdm9pZCByemcybF9jc2kyX3JlbW92ZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlDQo+ICpwZGV2KQ0KPiA+ICAJcG1fcnVudGltZV9kaXNhYmxlKCZwZGV2LT5kZXYp
Ow0KPiA+ICB9DQo+ID4NCj4gPiAtc3RhdGljIGludCBfX21heWJlX3VudXNlZCByemcybF9jc2ky
X3BtX3J1bnRpbWVfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlDQo+ID4gKmRldikNCj4gPiArc3RhdGlj
IGludCByemcybF9jc2kyX3BtX3J1bnRpbWVfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+
ID4gIHsNCj4gPiAgCXN0cnVjdCByemcybF9jc2kyICpjc2kyID0gZGV2X2dldF9kcnZkYXRhKGRl
dik7DQo+ID4NCj4gPiBAQCAtODQzLDcgKzg0Myw3IEBAIHN0YXRpYyBpbnQgX19tYXliZV91bnVz
ZWQNCj4gcnpnMmxfY3NpMl9wbV9ydW50aW1lX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQ0K
PiA+ICAJcmV0dXJuIDA7DQo+ID4gIH0NCj4gPg0KPiA+IC1zdGF0aWMgaW50IF9fbWF5YmVfdW51
c2VkIHJ6ZzJsX2NzaTJfcG1fcnVudGltZV9yZXN1bWUoc3RydWN0IGRldmljZQ0KPiA+ICpkZXYp
DQo+ID4gK3N0YXRpYyBpbnQgcnpnMmxfY3NpMl9wbV9ydW50aW1lX3Jlc3VtZShzdHJ1Y3QgZGV2
aWNlICpkZXYpDQo+ID4gIHsNCj4gPiAgCXN0cnVjdCByemcybF9jc2kyICpjc2kyID0gZGV2X2dl
dF9kcnZkYXRhKGRldik7DQo+ID4NCj4gPiBAQCAtODUxLDcgKzg1MSw3IEBAIHN0YXRpYyBpbnQg
X19tYXliZV91bnVzZWQNCj4gPiByemcybF9jc2kyX3BtX3J1bnRpbWVfcmVzdW1lKHN0cnVjdCBk
ZXZpY2UgKmRldikgIH0NCj4gPg0KPiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGRldl9wbV9vcHMg
cnpnMmxfY3NpMl9wbV9vcHMgPSB7DQo+ID4gLQlTRVRfUlVOVElNRV9QTV9PUFMocnpnMmxfY3Np
Ml9wbV9ydW50aW1lX3N1c3BlbmQsDQo+IHJ6ZzJsX2NzaTJfcG1fcnVudGltZV9yZXN1bWUsIE5V
TEwpDQo+ID4gKwlSVU5USU1FX1BNX09QUyhyemcybF9jc2kyX3BtX3J1bnRpbWVfc3VzcGVuZCwN
Cj4gPiArcnpnMmxfY3NpMl9wbV9ydW50aW1lX3Jlc3VtZSwgTlVMTCkNCj4gDQo+IFdoaWxlIGF0
IGl0LCBJIHdvdWxkIHdyYXAgdGhlIGxpbmUgdG8NCj4gDQo+IAlSVU5USU1FX1BNX09QUyhyemcy
bF9jc2kyX3BtX3J1bnRpbWVfc3VzcGVuZCwNCj4gCQkgICAgICAgcnpnMmxfY3NpMl9wbV9ydW50
aW1lX3Jlc3VtZSwgTlVMTCkNCj4gDQo+IFVwIHRvIHlvdS4NCg0KSWYgaXQgaXMgbm90IGEgcmVx
dWlyZW1lbnQgdG8gbW92ZSB0byB1c2UgdGhlIG1vZGVybiBwbV9vcHMvcG1fc2xlZXBfb3BzDQp0
aGVuIGFzIHNhaWQgaW4gdGhlIGFib3ZlIEkgd291bGQgbGlrZSB0byBkcm9wIHRoaXMgcGF0Y2gu
DQoNCkNoZWVycywNCkJpanUNCg0KPiANCj4gPiAgfTsNCj4gPg0KPiA+ICBzdGF0aWMgY29uc3Qg
c3RydWN0IG9mX2RldmljZV9pZCByemcybF9jc2kyX29mX3RhYmxlW10gPSB7IEBAIC04NjUsNw0K
PiA+ICs4NjUsNyBAQCBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciByemcybF9jc2kyX3Bk
cnYgPSB7DQo+ID4gIAkuZHJpdmVyCT0gew0KPiA+ICAJCS5uYW1lID0gInJ6ZzJsLWNzaTIiLA0K
PiA+ICAJCS5vZl9tYXRjaF90YWJsZSA9IHJ6ZzJsX2NzaTJfb2ZfdGFibGUsDQo+ID4gLQkJLnBt
ID0gJnJ6ZzJsX2NzaTJfcG1fb3BzLA0KPiA+ICsJCS5wbSA9IHBtX3B0cigmcnpnMmxfY3NpMl9w
bV9vcHMpLA0KPiA+ICAJfSwNCj4gPiAgfTsNCj4gPg0KPiANCj4gLS0NCj4gUmVnYXJkcywNCj4g
DQo+IExhdXJlbnQgUGluY2hhcnQNCg==

