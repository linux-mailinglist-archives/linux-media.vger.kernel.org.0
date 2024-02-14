Return-Path: <linux-media+bounces-5159-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 15701854D01
	for <lists+linux-media@lfdr.de>; Wed, 14 Feb 2024 16:38:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87613281EAA
	for <lists+linux-media@lfdr.de>; Wed, 14 Feb 2024 15:38:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 567675D8F4;
	Wed, 14 Feb 2024 15:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="mjdLoQmZ"
X-Original-To: linux-media@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2047.outbound.protection.outlook.com [40.107.113.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7BBE5C913;
	Wed, 14 Feb 2024 15:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707925088; cv=fail; b=CLGGm47mzyLbRRMYaSWo/mpeNMMfRQftBPxY1SkyIN5uNvWqhXc9pW4uA3NJPUJpyLqsfDwQNCT4S6qrxECScnJU0t3iaGbSyMF0SvZ3ogs+NMpCejqmtqGU51vwwWZHldRkpMihHGxNaocTWZfXaxa4s8y9XxHpyJ6DWipgChY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707925088; c=relaxed/simple;
	bh=dkdmby1nuPgo5ShvSQT52lI8tuvZ/cbQEPsz4IS5w4c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DY5+I+S+S7BnEh7WOUy6eG0qWOp5NGf07YPZSg4DvrEayWP/qWO7OFzkuGhclQT7XvCHoMz4g9wgedu328soj8oz2iy5FiWoBTmQCAGCY1WSGM7ICSiZf1ShBJ0Euq4+BGIhMgUWuYl0ctVsI/SHG9FGet2DzaXnZ0otQelD1pc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=mjdLoQmZ; arc=fail smtp.client-ip=40.107.113.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RprRfRPFgkEk8DAWi/juQa2G7LUM0eN9mkMgJO7vlADYfojw/WyXGjVseLJvsuCpmToV2XKxRbVYtGnfzO5ggZlxPQp/rnxg85T59GEYfw2w5cn7hUDQ00s14SoiAlw7tIb5fvnwQ/tROksMYOl1XjynEs/9CZWETjOn66mTvQXIMKf92y3UU+mH2N/Ss6q7Vuu4i5EdaguXoYnYYDnUgPkRo/3Z93ME0EnbxiZc58BNpmDl1Qqs09pPVHGy4aK7IuLSTxTOOaFtnKys4DD/qtnQY5dr0X+w8SoUfpYTjCB+UvDAnlWEAKnIyscxheJ0Sj0ehsyo31Lje2scv22njQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dkdmby1nuPgo5ShvSQT52lI8tuvZ/cbQEPsz4IS5w4c=;
 b=Ni5QqFttPsTdB+IZs3uAbxUS7DKWBwEhGqhQpL+Ct2a+01ovu5ILJkTqskBXaZLR0k/DfBSbtrG21SHRiofs4o71D9LMvt310JcQXllEWgHjOQ7Rkgn4TKvmwK4cscqFLovZhHa3Ix+cB1s+siboSqKKbdL1KJLMsQY4H2x3k1pq9V6+z5LPYwS5+FbQsQTyELUBUG+RLOPWF9OajrqGhWZIP9pXiX5pO16g/M1Aot8WddC2pQ/zhnDQKg9eOCSULT4vfNbWq9xnkRtCfHiqo4Jizlyft5R8s4gMLXTIqyInVZSfb5al0io/VD4KHCXNEvCC4Al9174WSDLzr8ocuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dkdmby1nuPgo5ShvSQT52lI8tuvZ/cbQEPsz4IS5w4c=;
 b=mjdLoQmZyotXZP8vJscCdwXkRMZm62HlVDJqzJHRT62C4JrDp7jxf4DhPMVW9BUMSPtLmoRdRsRCNgbMRfYLIRz2mDmuSzwlhBiqHVpog/P4hNSgfHagFIXGp3wjVtGeaVqkvh4nMwGsxvdXsV5wM0q1nDkDcfUad1uYBy0J3iE=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TYVPR01MB11130.jpnprd01.prod.outlook.com
 (2603:1096:400:36c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.29; Wed, 14 Feb
 2024 15:38:01 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6719:535a:7217:9f0]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6719:535a:7217:9f0%3]) with mapi id 15.20.7292.026; Wed, 14 Feb 2024
 15:38:00 +0000
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
Subject: RE: [PATCH v3 5/5] media: platform: rzg2l-cru: rzg2l-video: Fix start
 reception procedure
Thread-Topic: [PATCH v3 5/5] media: platform: rzg2l-cru: rzg2l-video: Fix
 start reception procedure
Thread-Index: AQHaXqhJ1TEkrhR2fUOdcjU8jxS4KbEJ7nkAgAALWCA=
Date: Wed, 14 Feb 2024 15:38:00 +0000
Message-ID:
 <TYCPR01MB112695FE08A3E5307F3D4D2F0864E2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20240213181233.242316-1-biju.das.jz@bp.renesas.com>
 <20240213181233.242316-6-biju.das.jz@bp.renesas.com>
 <20240214145548.GB7120@pendragon.ideasonboard.com>
In-Reply-To: <20240214145548.GB7120@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TYVPR01MB11130:EE_
x-ms-office365-filtering-correlation-id: 63941a64-4914-4fd1-024e-08dc2d72ed29
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 nV9+Fs6frr6wTKl3w9py/djOYgFq9ixoei9q/RReugn/1ATRzgkApSdFkDsy8HFZdAgXJthXgI3gvavu55+nubYmyhYS4eTkt/RZqQ2yPYV0QwE/V9iui+QLvJSVav7u5AJstBzb8+KUVVU1fjxB8t38aCNQf1rSJoi9xyJWU4VJlpVaDjVYXkM3iUtKML9/kzQXiYUq6HixXqc2cEAhAZeCSTtm6XP9oPMSFBV4isHF4sBUvw5snyP4DgtbRh/EgpAlevSg6HVVwaIAWmeYeY5Hj7LGpoaJ4+l9pfsVyJDxGGW9sy+IehCgkBLLcz+073OSRjH58BbN/NrO0wTS7OkuYJG3trBDfeVAHId34Bh+PJqNNp36P6VRuGFZZM8BlsCVmD8KnRA8WjRDRYLf2TkZ8AgxinrpkkR6weYyIVIRVisKmR/RT3vTlqC84he0B2SheRhRlS+3h/8ZuWjPvQ6HOLEPdgQVjj7ErkjFTmh8qWItaMtW0+cN7B9zzRrbI779vka8pbKr6OzFpoSdJAh00w5tw5jHEPSoy4hPpATIOq+Lbc6frmPZXPHeT9f+zg1pAeSg6IKPf/UiiNbmtw14H1saoLE80ojGq8VD2HLtb9Zwt88UXqYoKQDLV1wo
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(39860400002)(346002)(376002)(396003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(26005)(83380400001)(122000001)(38100700002)(6916009)(8676002)(4326008)(7416002)(5660300002)(8936002)(66556008)(66476007)(66446008)(64756008)(52536014)(76116006)(66946007)(2906002)(7696005)(9686003)(6506007)(53546011)(478600001)(41300700001)(54906003)(316002)(71200400001)(38070700009)(86362001)(33656002)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bm9JVTlJV0gydWh6TFlsLzE2ejJBMGxiRCtFY2xTTW9TdmdlUG1mV2l1cGJM?=
 =?utf-8?B?b28xdmVhcHJubHhBNDdwQlBEajVjY2lIQ0VrYnZrWTRhcWxOWFdERjZJR2NC?=
 =?utf-8?B?WmZkRzhpWVQxWEZmOUZqZDlRK2w4RTVydjBuY1F3K3Z5T01DNUgrM0J0bk5y?=
 =?utf-8?B?VitEa1Z4czFCdWtEL1hJclo5YUhLSW1icEU2Y0ttVERxcHdtaEdPSTZrZDEv?=
 =?utf-8?B?SklTUlZIY0prc3BjSjhoK3V4bFJwVGRzRkZab2h4STRsbExMYlJLTzV2c3dn?=
 =?utf-8?B?eUhDSk1hYVpTNHR0VHA3ajg5dGVINTZHM3p6ZWswRGZaKzNGNDYwWW1vQWRU?=
 =?utf-8?B?MnpqMXZoM2hnVUpwa1c2STQwKy9JYjVTYVRNeTF6a21YdXZGaDBVWE9oOXVF?=
 =?utf-8?B?bmhNZ3RwZGhVYVZITlp0RisyMWxvdTVPN01XSXcwZUptdjhJL3VWNzc3QmJK?=
 =?utf-8?B?d09wQU1weE9oL0FhajA4VnB5MnFFUGpnNDAxUmtIenlWUE9Xb09pTjMzeVVE?=
 =?utf-8?B?TGJ3ZnJvekV1d2lnT0swdDlodUU0WjNlUUdOUk9PVTQ3b3NxNEhXTWV6ZkxD?=
 =?utf-8?B?OFdWNXpwdFMwUXdmcTdNYWpTbU45VGJySG5ZTDZma3ZLbGZuUWVrZXlOcFEy?=
 =?utf-8?B?MjlJcjVrTG4wTDkxY2IxK3VpbG93Rk5rUXVqdit2bVlrR2lFeWxTallPTEVo?=
 =?utf-8?B?cVZiQ1czMTI5UU1MRUlWVHBXTGxzVkpraVY5b0hVZXVMZDliNGpRNGE3ck1l?=
 =?utf-8?B?ZmVranppc01RSU1ZbnJBTG5udG9ER2lIVVlMOHp0Kzljb1RvUlBNazVDaVl5?=
 =?utf-8?B?d1UwS2NZemZwWERHemdnQUU5YzZIdEdnT3MzazRTWWtzY3Y1R2EyWk9aaUNr?=
 =?utf-8?B?ZVFPTXRxa3QyVHBJemFNdmlTdFdObjRGTm9BaFQ5UHlaVVZRcVp1dTIraHlk?=
 =?utf-8?B?LzAxbEdJbmFXa2JtN2REYU5CZ2JlWTFucFd3bUhRcnlpakVjYzNkYTg1RzJQ?=
 =?utf-8?B?U090MGtGcndyMmw3bVh3clV2QkJrN2V5M2pnNVdKZW1td0pBWStkQk04VU5J?=
 =?utf-8?B?Z2s0U2pBbThBdnBmOXNvSUcwcDAxSFFzalNaRWR1K1lzazBBSjhMcGpzY2xB?=
 =?utf-8?B?UjFEL2R3cUs3T1d4UlF4eXgvRmJZMytPeE1FR08xZTl1QnhCb0krbm5OT1lQ?=
 =?utf-8?B?QWpKVmI0YkpMemtnOWxoUHlrS0tIT2hmS0MrSllHclIzdHJCZlc0TW0relZD?=
 =?utf-8?B?R2tKTUgrcE9DK0d5eUJmTnFhc1VqZzFTUzlsRDh5TnpVdUpKemU3YVJZNkIr?=
 =?utf-8?B?RmErUExsUlJQZmlsTUZTREpDOE02UEc0bFdRWmlHckRQQmZmbmhmNDVLb05Q?=
 =?utf-8?B?Yzc1V3g1NU9oUE11cGpRaWhrZnRhSkdDdmMwTWhtcVI5RlFHTjAyWm8wRzhs?=
 =?utf-8?B?c0x2QzRNOHd6amtLVjMxdk1nL3RMREl6MXNPeGlxT21hTUFISXFuSThGdHBE?=
 =?utf-8?B?eHRnN0J0N05tN3kvNmlXd005MlMxMWc4czdybXIybE5CNDl2TmtYMFo0WTIw?=
 =?utf-8?B?U29PZkl3V09GWS94aHBmZjRFa1RMcWRrY25tZzRKaGhPUWRYL3JRUHNKazVX?=
 =?utf-8?B?SEtSdTVkeEk0T2NEcFBteDFEKzRmQ0lmZkFOOFQyNzZvdG16bnpaT3JpMFdD?=
 =?utf-8?B?aXFGV0pmQlJhTk15QjlBRW53dUFPaVNheDlvbjFJKzNLb0dpd3hQNWl1TDVI?=
 =?utf-8?B?SlhmWXJJTnphM1p4NFFiOUJyU1JFT3p0MzdSUWRQVTUvVThqVUZzQytFSVpE?=
 =?utf-8?B?VjJaWStMSFB4VjJ0OHBIa1kxQ2Rkays1ZGxkNFY2eUN6OFcyWjV3SW8wVDY3?=
 =?utf-8?B?dklHL1MwSGtVWmpCUzlFMk1yME9JblIwNXEweVRYbnFrenVsV2FabmI5NGha?=
 =?utf-8?B?Y0MyaXpiakVMSE5Zb3ZCYkZwVFptZ0JMQ1ZHMGY4YzVkdmRQdnIzbXBLbm4x?=
 =?utf-8?B?NjFWSStCdzFQOG1IL213VzlNK0ZIZm1zYjM3NmtsclVWaTkzTit5ck1PdnVl?=
 =?utf-8?B?S01IZS9DcXlCbTF1SWsvTU9VSmE1bmxZZHpTUVh5UWVjZDRDS1ZOaktSL1Fy?=
 =?utf-8?B?U2NyR0ZHMVpWOVU2NmNHZnY5NnpjMiswZFNkYWRVUWxVYnlwVDNYMjg1MGpr?=
 =?utf-8?B?TlE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 63941a64-4914-4fd1-024e-08dc2d72ed29
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2024 15:38:00.7571
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yffkx7UpViG6/542U71u9p88mFugTa7liYWV3BuXXfR9IKq29Z9EdNXkvUsgSCbQvzFlEvCSSTdqOH8hgXF/i8AoULNtNhV2L0qAIolPvMo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB11130

SGkgTGF1cmVudCwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFy
dEBpZGVhc29uYm9hcmQuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIEZlYnJ1YXJ5IDE0LCAyMDI0
IDI6NTYgUE0NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyA1LzVdIG1lZGlhOiBwbGF0Zm9ybTog
cnpnMmwtY3J1OiByemcybC12aWRlbzogRml4DQo+IHN0YXJ0IHJlY2VwdGlvbiBwcm9jZWR1cmUN
Cj4gDQo+IEhpIEJpanUsDQo+IA0KPiBUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4NCj4gDQo+IE9u
IFR1ZSwgRmViIDEzLCAyMDI0IGF0IDA2OjEyOjMzUE0gKzAwMDAsIEJpanUgRGFzIHdyb3RlOg0K
PiA+IEFzIHBlciBzZWN0aW9uIDM1LjMuMSBTdGFydGluZyBSZWNlcHRpb24gZm9yIHRoZSBNSVBJ
IENTSS0yIElucHV0IG9uDQo+ID4gdGhlIGxhdGVzdCBoYXJkd2FyZSBtYW51YWwgKFIwMVVIMDkx
NEVKMDE0NSBSZXYuMS40NSkgd2UgbmVlZCB0bw0KPiA+IHN1cHBseSBhbGwgdGhlIGNsb2NrcyBh
bmQgdGhlbiByZWxlYXNlIHRoZSBDUlUgcmVzZXRzLiBDdXJyZW50bHkgd2UNCj4gPiBhcmUgcmVs
ZWFzaW5nIHRoZSByZXNldHMgYW5kIHRoZW4gc3VwcGx5aW5nIHRoZSBjbG9ja3MuIFNvLCBmaXgg
dGhlDQo+ID4gc3RhcnQgcmVjZXB0aW9uIHByb2NlZHVyZS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYt
Ynk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiAtLS0NCj4gPiB2
MzoNCj4gPiAgKiBOZXcgcGF0Y2guDQo+ID4gLS0tDQo+ID4gIC4uLi9wbGF0Zm9ybS9yZW5lc2Fz
L3J6ZzJsLWNydS9yemcybC12aWRlby5jICB8IDU5DQo+ID4gKysrKysrKysrLS0tLS0tLS0tLQ0K
PiA+ICAxIGZpbGUgY2hhbmdlZCwgMjggaW5zZXJ0aW9ucygrKSwgMzEgZGVsZXRpb25zKC0pDQo+
ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9yZW5lc2FzL3J6ZzJs
LWNydS9yemcybC12aWRlby5jDQo+ID4gYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3JlbmVzYXMv
cnpnMmwtY3J1L3J6ZzJsLXZpZGVvLmMNCj4gPiBpbmRleCBkMTVhOWJmY2M5OGIuLmIxNmI4YWY2
ZThmOCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3JlbmVzYXMvcnpn
MmwtY3J1L3J6ZzJsLXZpZGVvLmMNCj4gPiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3Jl
bmVzYXMvcnpnMmwtY3J1L3J6ZzJsLXZpZGVvLmMNCj4gPiBAQCAtNDg5LDM5ICs0ODksMjQgQEAg
c3RhdGljIGludCByemcybF9jcnVfc2V0X3N0cmVhbShzdHJ1Y3QNCj4gPiByemcybF9jcnVfZGV2
ICpjcnUsIGludCBvbikNCj4gPg0KPiA+ICAJCXZpZGVvX2RldmljZV9waXBlbGluZV9zdG9wKCZj
cnUtPnZkZXYpOw0KPiA+DQo+ID4gLQkJcG1fcnVudGltZV9wdXRfc3luYyhjcnUtPmRldik7DQo+
ID4gLQkJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGNydS0+dmNsayk7DQo+ID4gLQ0KPiA+ICAJCXJl
dHVybiBzdHJlYW1fb2ZmX3JldDsNCj4gPiAgCX0NCj4gPg0KPiA+IC0JcmV0ID0gcG1fcnVudGlt
ZV9yZXN1bWVfYW5kX2dldChjcnUtPmRldik7DQo+ID4gLQlpZiAocmV0KQ0KPiA+IC0JCXJldHVy
biByZXQ7DQo+ID4gLQ0KPiA+IC0JcmV0ID0gY2xrX3ByZXBhcmVfZW5hYmxlKGNydS0+dmNsayk7
DQo+ID4gLQlpZiAocmV0KQ0KPiA+IC0JCWdvdG8gZXJyX3BtX3B1dDsNCj4gPiAtDQo+ID4gIAly
ZXQgPSByemcybF9jcnVfbWNfdmFsaWRhdGVfZm9ybWF0KGNydSwgc2QsIHBhZCk7DQo+ID4gIAlp
ZiAocmV0KQ0KPiA+IC0JCWdvdG8gZXJyX3ZjbGtfZGlzYWJsZTsNCj4gPiArCQlyZXR1cm4gcmV0
Ow0KPiA+DQo+ID4gIAlwaXBlID0gbWVkaWFfZW50aXR5X3BpcGVsaW5lKCZzZC0+ZW50aXR5KSA/
IDogJmNydS0+dmRldi5waXBlOw0KPiA+ICAJcmV0ID0gdmlkZW9fZGV2aWNlX3BpcGVsaW5lX3N0
YXJ0KCZjcnUtPnZkZXYsIHBpcGUpOw0KPiA+ICAJaWYgKHJldCkNCj4gPiAtCQlnb3RvIGVycl92
Y2xrX2Rpc2FibGU7DQo+ID4gKwkJcmV0dXJuIHJldDsNCj4gPg0KPiA+ICAJcmV0ID0gdjRsMl9z
dWJkZXZfY2FsbChzZCwgdmlkZW8sIHByZV9zdHJlYW1vbiwgMCk7DQo+ID4gLQlpZiAocmV0ID09
IC1FTk9JT0NUTENNRCkNCj4gPiAtCQlyZXQgPSAwOw0KPiA+IC0JaWYgKHJldCkNCj4gPiArCWlm
IChyZXQgJiYgcmV0ICE9IC1FTk9JT0NUTENNRCkNCj4gPiAgCQlnb3RvIHBpcGVfbGluZV9zdG9w
Ow0KPiA+DQo+ID4gIAlyZXQgPSB2NGwyX3N1YmRldl9jYWxsKHNkLCB2aWRlbywgc19zdHJlYW0s
IDEpOw0KPiA+IC0JaWYgKHJldCA9PSAtRU5PSU9DVExDTUQpDQo+ID4gLQkJcmV0ID0gMDsNCj4g
PiAtCWlmIChyZXQpDQo+ID4gKwlpZiAocmV0ICYmIHJldCAhPSAtRU5PSU9DVExDTUQpDQo+ID4g
IAkJZ290byBlcnJfc19zdHJlYW07DQo+ID4NCj4gPiAgCXJldHVybiAwOw0KPiA+IEBAIC01MzIs
MTIgKzUxNyw2IEBAIHN0YXRpYyBpbnQgcnpnMmxfY3J1X3NldF9zdHJlYW0oc3RydWN0DQo+ID4g
cnpnMmxfY3J1X2RldiAqY3J1LCBpbnQgb24pDQo+ID4gIHBpcGVfbGluZV9zdG9wOg0KPiA+ICAJ
dmlkZW9fZGV2aWNlX3BpcGVsaW5lX3N0b3AoJmNydS0+dmRldik7DQo+ID4NCj4gPiAtZXJyX3Zj
bGtfZGlzYWJsZToNCj4gPiAtCWNsa19kaXNhYmxlX3VucHJlcGFyZShjcnUtPnZjbGspOw0KPiA+
IC0NCj4gPiAtZXJyX3BtX3B1dDoNCj4gPiAtCXBtX3J1bnRpbWVfcHV0X3N5bmMoY3J1LT5kZXYp
Ow0KPiA+IC0NCj4gPiAgCXJldHVybiByZXQ7DQo+ID4gIH0NCj4gPg0KPiA+IEBAIC02MzYsMjUg
KzYxNSwzMyBAQCBzdGF0aWMgaW50IHJ6ZzJsX2NydV9zdGFydF9zdHJlYW1pbmdfdnEoc3RydWN0
DQo+IHZiMl9xdWV1ZSAqdnEsIHVuc2lnbmVkIGludCBjb3VudA0KPiA+ICAJc3RydWN0IHJ6ZzJs
X2NydV9kZXYgKmNydSA9IHZiMl9nZXRfZHJ2X3ByaXYodnEpOw0KPiA+ICAJaW50IHJldDsNCj4g
Pg0KPiA+ICsJcmV0ID0gcG1fcnVudGltZV9yZXN1bWVfYW5kX2dldChjcnUtPmRldik7DQo+ID4g
KwlpZiAocmV0KQ0KPiA+ICsJCXJldHVybiByZXQ7DQo+ID4gKw0KPiA+ICsJcmV0ID0gY2xrX3By
ZXBhcmVfZW5hYmxlKGNydS0+dmNsayk7DQo+ID4gKwlpZiAocmV0KQ0KPiA+ICsJCWdvdG8gZXJy
X3BtX3B1dDsNCj4gPiArDQo+ID4gIAkvKiBSZWxlYXNlIHJlc2V0IHN0YXRlICovDQo+ID4gIAly
ZXQgPSByZXNldF9jb250cm9sX2RlYXNzZXJ0KGNydS0+YXJlc2V0bik7DQo+ID4gIAlpZiAocmV0
KSB7DQo+ID4gIAkJZGV2X2VycihjcnUtPmRldiwgImZhaWxlZCB0byBkZWFzc2VydCBhcmVzZXRu
XG4iKTsNCj4gPiAtCQlyZXR1cm4gcmV0Ow0KPiA+ICsJCWdvdG8gZXJyX3ZjbGtfZGlzYWJsZTsN
Cj4gPiAgCX0NCj4gPg0KPiA+ICAJcmV0ID0gcmVzZXRfY29udHJvbF9kZWFzc2VydChjcnUtPnBy
ZXNldG4pOw0KPiA+ICAJaWYgKHJldCkgew0KPiA+ICAJCXJlc2V0X2NvbnRyb2xfYXNzZXJ0KGNy
dS0+YXJlc2V0bik7DQo+ID4gIAkJZGV2X2VycihjcnUtPmRldiwgImZhaWxlZCB0byBkZWFzc2Vy
dCBwcmVzZXRuXG4iKTsNCj4gPiAtCQlyZXR1cm4gcmV0Ow0KPiA+ICsJCWdvdG8gYXNzZXJ0X2Fy
ZXNldG47DQo+ID4gIAl9DQo+ID4NCj4gPiAgCXJldCA9IHJlcXVlc3RfaXJxKGNydS0+aW1hZ2Vf
Y29udl9pcnEsIHJ6ZzJsX2NydV9pcnEsDQo+ID4gIAkJCSAgSVJRRl9TSEFSRUQsIEtCVUlMRF9N
T0ROQU1FLCBjcnUpOw0KPiANCj4gUmVxdWVzdGluZyB0aGUgSVJRIGV2ZXJ5IHRpbWUgdGhlIGRl
dmljZSBpcyBzdGFydGVkIHNlZW1zIHN0cmFuZ2UuDQo+IFRoYXQncyBub3QgcmVsYXRlZCB0byB0
aGlzIHBhdGNoLCBidXQgeW91IG1heSB3YW50IHRvIGFkZHJlc3MgaXQgaW4gYQ0KPiBzZXBhcmF0
ZSBzZXJpZXMuDQoNCkFncmVlZC4gV2lsbCBzZW5kIGEgc2VwYXJhdGUgcGF0Y2guDQoNCkNoZWVy
cywNCkJpanUNCg0K

