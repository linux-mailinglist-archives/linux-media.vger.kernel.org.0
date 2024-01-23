Return-Path: <linux-media+bounces-4104-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A618397E6
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 19:39:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D7881C26D0B
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 18:39:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E3BD81AD3;
	Tue, 23 Jan 2024 18:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="cZsq2jtm"
X-Original-To: linux-media@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2108.outbound.protection.outlook.com [40.107.114.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04EF7FBC5;
	Tue, 23 Jan 2024 18:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706035146; cv=fail; b=o32+Y+QcRnk5s9ubwJCWLYA64jR7+VRMa/Zeh2VYgWzqpa8FOD9LK0JFMiRLwsObX9Pk4PzjWSbTYhTmla14StaYS0PIvgR0JaOUo88glhgvzYihErB6uMbA15KakjE1aAqJX6XJR7yjZg1MYmIODSxAoAaSDeVqso2BScAktJc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706035146; c=relaxed/simple;
	bh=11IbNrngoYXsLfY8xVrTYrAT7bHVKPgARZOThc/anhk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=T7kr+EGvPXSyjJ4AA9FvtD5STMuwORZYb7M2o/ab2CqeuTEyrYwLy5YJ0YkOAyV20jLuyGux3/MHEse3W7vsWCpO9qtV1PrFGqq39WHHItqGY9mvzUkmQvGKjv/hZ2LCNVK5Ix5fGJ6QB0uBKpni4NwArGMRDjZVqmnm0kWk62I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=cZsq2jtm; arc=fail smtp.client-ip=40.107.114.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WWf8ZRsr6H9PxLVSV+frTFputrSbrzClR7uUE58GyprZ79oL+fdIzle2CewbStRfnIQJXY+NSSaZD3ughS6GxGyE1aWCWdkI4qErchBdvbdJMZIsn/Eiv+vAVRKKefOCvyOmYeVIwCT3Xp8FeGuhq1z+OQiE9m8I8o5Q2eoS1I+WmFErBgVydU8+ob12i82gPn3RHxuOv8qdoceHg2or33u0MGoOndvZ4JhhJvsjzRtR+KYQZkkXSNgQHEAjpaB9SGlObQjv+Fy9Ujy0WeXkPB1FuddTg1ytKct9qHC+GtWElAh8rJIgvEXup4QsTSYGp7oId6CeOYczC8+PYnjQsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=11IbNrngoYXsLfY8xVrTYrAT7bHVKPgARZOThc/anhk=;
 b=AMMbderUojs++CqbdE6PPg9cQ/XNtZSgzdFTLo9zaA/AqjVILaQeHSc36Hfwn9jBWluIUR+bOvNL8bfgRHWTtZGsye3yvUyZO2hGV8fiv6b/z9x1X2yVAQ9ph+iWGZwvXl5MrsSxYKySA6b9jfaLdSyDkGAi/pbItB7Dp79+4H/2lYyxwRGvF2KcDuTREF0qmD7SRZImPyx9ndK+4qRh4vNMyRcJbHlg1PHo2f326cOlftHSJmYy2sFYSJDcEsR3PL0t72nf+owvk3mniTUCrj/BSL+sCLCuDgrYrfd1CdiNzrx0kbUyCV9CoSJNkSFNXSi2KG32CwUWqmCeezF4Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=11IbNrngoYXsLfY8xVrTYrAT7bHVKPgARZOThc/anhk=;
 b=cZsq2jtmh1LEt6zNrlvCh7Ln4qEpZX/80K+6UBT8Emqehw4FGa0EepPoOmJNVwmF2tuu+0VECbLbjTcFzA48gnMKxLp4I1oRgNp2SNqODQpvLPjbSKsnlltiYeVpyV9VXVGPLBuMR45x0QBA4JCLc0/gZCafbfW1aarvD9RoRwU=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by OSRPR01MB11632.jpnprd01.prod.outlook.com
 (2603:1096:604:22f::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Tue, 23 Jan
 2024 18:39:01 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::8d12:a02a:9fdc:9c78]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::8d12:a02a:9fdc:9c78%5]) with mapi id 15.20.7228.022; Tue, 23 Jan 2024
 18:39:01 +0000
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
Subject: RE: [PATCH 3/4] media: platform: rzg2l-cru: rzg2l-video: Fix image
 processing initialization
Thread-Topic: [PATCH 3/4] media: platform: rzg2l-cru: rzg2l-video: Fix image
 processing initialization
Thread-Index: AQHaTfOD7q2ol1AvckCmsVr4+FX0GbDnhwIAgAAzu+A=
Date: Tue, 23 Jan 2024 18:39:00 +0000
Message-ID:
 <TYCPR01MB112699F65E782F3C02AF793C486742@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20240123115821.292787-1-biju.das.jz@bp.renesas.com>
 <20240123115821.292787-4-biju.das.jz@bp.renesas.com>
 <20240123153304.GS10679@pendragon.ideasonboard.com>
In-Reply-To: <20240123153304.GS10679@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|OSRPR01MB11632:EE_
x-ms-office365-filtering-correlation-id: 90a50473-fc37-4a84-0738-08dc1c429123
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 6ECzy5GCl1LP8yHZOlJcuG+R0vHpfBZJR9Ik4ErXBR6vmQJDWKVk8Ps0K0j/MKIw+WQrV1t6/oscYkvepcSXoQ7n7dU4rdrMJukRbYVKUltkzZN6pwsNb3EPcvjSyMCAy4lRJN5gE4voS6VHerkdXP40O9zQPnYRnho85fdQHFjVJJZakYtD57PJT3fCd4E0VcyxG02gMJHwVMIQt7CLTBCDZIUL+g5pNUahQa3mH4LuChlrOOpb7PMP/hmkXVFUXphhsmBXydw46j++dVG7s7CoLsICjXnKlZpBz18V+cwU3dm8XpqAudcV+TU3lIClWuRBxH+GJuIvL+WXsqjk5apON+FStb0IMXcNyh5hUqS8N1mxu6Sc3aD07Qx6QTywto8caskGvxd8gevG39aB3Ltfvwb4J5UVFlUH2QchyU7krwzx3bUuq3RjfbAmkm5s0h/5vxb4SJe3HpYe7oEpokbM+JpQor7cYWwNpfthKoiB8iHAW4swvUMLOyLEyv8/rWNvWcmYSGtk3tW4BRrqEocwEfIguv4D4PRYYmgOrk1gNsl6oFw67U5igOekdmyDteSltCtpG+v380rDbT2l1ttQTU+5uM5NrKpGvIYP2DEmwjLl3G08I7rsnVASFB4T
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(346002)(39860400002)(376002)(366004)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(316002)(6916009)(64756008)(66446008)(66476007)(54906003)(9686003)(122000001)(76116006)(66946007)(66556008)(478600001)(38100700002)(71200400001)(7696005)(6506007)(53546011)(55016003)(8676002)(8936002)(4326008)(7416002)(52536014)(5660300002)(83380400001)(26005)(2906002)(86362001)(33656002)(41300700001)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?L3R3ak1waTZneU9lSXN0d0V5NTFSMG5EMHI1aXZRWkIwUDlOSWovNnkvRFMw?=
 =?utf-8?B?OXZoQ3pLb0h2bUJOUmU3QlYrNjcyRG51ZGI1c1NvZTNxU2U4MVoxRnZSUDBn?=
 =?utf-8?B?dTNnQ3NOazV1SzVJRHJrWC9wRkV3U2lKVDNhbXlmbEMzak50QVZRY3UwNUIr?=
 =?utf-8?B?dnNLNFBtZHJObk5VYUxyS0w5OWlBY09mRVp0a0swbDJiT2k4c21mcU8xbmNK?=
 =?utf-8?B?cHozUkh3UENtVUtCc0F0YURJUzJwb3FpWlFrQVp6cDE1aTdXVHV3OFNlWHli?=
 =?utf-8?B?bVA2WnZnQytjNktLOSs1NnZQOW9Zamo3VHZxOVhxWEFiS00rMG1xZXRVQ0ph?=
 =?utf-8?B?dFZPY0Y3YXExSzFmSGFIRFBUMGVpUlN0cWJBbk92cmw0V1ROdk5mYWhoc2tm?=
 =?utf-8?B?eHh2S1VoM3l4Z3Jydk9HVHNObUl4eVJhRXNhRmluY1NiTGdNMC8zdXV1dkdm?=
 =?utf-8?B?VTBWNC9IdVJEWmtTUmFiKzk3cFI3TGV6dXpDalZKNGxqU1J1VkgyN0J5VFNE?=
 =?utf-8?B?eWI3SGpiNVRFeDloQUUzZDNWS0JJb3IxOW1hKzNIZmVGL1E5emFFQzhldUlM?=
 =?utf-8?B?ZlJaODhUQlVhMlhyT3BEdWtwai8vQ2xrd1RJZmd2MTJIRmY3b2t5elNUcDB1?=
 =?utf-8?B?aVEvdEdVZ01ndnBwWmpQTkJlSW80ZlM0VzJabHVGam1tNTJvVVduSVJ4ajY2?=
 =?utf-8?B?bGFpUVNXWE1seWxRd09FQWNPUUxzNDl1dTE1RExzSWxzVGpLUkpMSWdTS0Y5?=
 =?utf-8?B?MjNBOW9QaEpaUEtnVGNKYkdhMFdDSkkxU3ZSOWJmTDlGTS9xYTJKVSs2S3R3?=
 =?utf-8?B?WDZpWTkzVVlCeTJkcVJDejlNZmU4NGp0eG5Sam9kQVVBcFhGS0ttaktZWDBT?=
 =?utf-8?B?b01zQ0pGL1VoZDEvcVBvVVhXYmpKbFFsZit3TFJURG5xSzJUWk9EdndQSEZH?=
 =?utf-8?B?eVZiK1NZUnJjYWNoa0RGeHg5NlVkeU1NcGV3Qlo5QVFzZGphbERuNDUyN1k1?=
 =?utf-8?B?UE9FT1R5d0NPa3pnaFNtelB4aTFwb0hKS0FVcUxRQW0zOU44Z0xCTktTTGxr?=
 =?utf-8?B?K3ZLMEx0ZXF2Vnltb0tqVlVhYVhZdkJqbEdIVUYxNnQ2SDlNN0t1Y3dLNEVT?=
 =?utf-8?B?MDR5RCtoMmNjVlhBVjhEbVA0OHZuZk1LTWRwK0oyMVdWQVVocnYzUHJ2YWdi?=
 =?utf-8?B?dEczczVxWklBbzBud0QzSVpjbThPcUlVQ2NVUVRDZTkyL0I2Z2p6V0t0VURZ?=
 =?utf-8?B?Vm1tQ08ybHRnWFE5SVFuMjlVYTJqb1dEa3lLRGJ5TkFRYXpNUzFOMG1hTmtL?=
 =?utf-8?B?bm95RXMvQkhsbWVRSjFIRXlqdmNTdTN6RlZrVDdFdmxCUG0wSFF3My93dUhB?=
 =?utf-8?B?TTdmNDZMUEVQa2ZmTXR4VTRRam52U3hWZUFRc3QvNHl4R2FQVnNNVXNzTzBk?=
 =?utf-8?B?SWxSL1A3RWdibUpDb296K1BmMUhtRTREK0JGaXpGcitrSzZuVUZZNXUvTXdt?=
 =?utf-8?B?UFRCaURJSmNYa2J4ZmZGdHhFM1MxbkpUSnc2UEZCRHdoRGNoTWRaaWtKZEth?=
 =?utf-8?B?b3EzQ1hLemdSeHdJT0JyVUFxSHlJT3BaS1RtbHE1ODVVay9ITVRySHM2YkZl?=
 =?utf-8?B?OEcranNUTEVqSWlYZjlTck94bEUvVjBoelZBRTI1ZGFKZWF3ZVk5blltazJv?=
 =?utf-8?B?Y1ZnazdTRGxZNk1SRzlnTVNudFIvRzFMYXNobFcxa2tjQks4Q3gvbU1RdlA2?=
 =?utf-8?B?cDVKdEhlRVBnOHJIZmpPUW04Mm9MdkIzV3lOTHE3d1dOZExITWhIak40Nkt2?=
 =?utf-8?B?TkkxZ1NaZURFL0o0U3ZGZ2tqNUdIb2RPY3d0ZExvQVI4ZVhSOU5GYTJ1VkRz?=
 =?utf-8?B?LzdoT2Q2WEFpcjBsOGMyb2pRRnlZanZ5ZUF1WmZWOURwdGlyMEoySlFuNWdM?=
 =?utf-8?B?bkljdEZORXhuNDBQRUlmOExqTm9KU2ZOTlhyeVBxaUtPOUwvTWVpOFpWVVd3?=
 =?utf-8?B?aytyUEFuQlNCazI4VHZ6akhkQXYvWS9hM25QMk04TmtWaDJldnNjV3pkcGFG?=
 =?utf-8?B?Q2pPUXFIL2JteVNHWndlbWZiVGpVT29oU1JiYVpBbFAzTG1lY2xPRm85SjVQ?=
 =?utf-8?B?Rll2ODR0ajcvbGd4OGRGYjNUb3FvUGQ4T0JLYms1RUx3aFI2d2RIb2ZzWkdm?=
 =?utf-8?B?VWc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 90a50473-fc37-4a84-0738-08dc1c429123
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2024 18:39:00.7613
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9iE3RPYs81yfrOpjSiqvt6gmV5aSBByj4j/O5ElbPplKEOWIdWtP/wsYlD8zRyQi9jIE4gJqAo1ZiSd0Y/VExM6gxNv4Jn/vmKeJqslZiRw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11632

SGkgTGF1cmVudCBQaW5jaGFydCwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVu
dC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBKYW51YXJ5IDIz
LCAyMDI0IDM6MzMgUE0NCj4gU3ViamVjdDogUmU6IFtQQVRDSCAzLzRdIG1lZGlhOiBwbGF0Zm9y
bTogcnpnMmwtY3J1OiByemcybC12aWRlbzogRml4DQo+IGltYWdlIHByb2Nlc3NpbmcgaW5pdGlh
bGl6YXRpb24NCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4N
Cj4gDQo+IE9uIFR1ZSwgSmFuIDIzLCAyMDI0IGF0IDExOjU4OjIwQU0gKzAwMDAsIEJpanUgRGFz
IHdyb3RlOg0KPiA+IEFzIHBlciBzZWN0aW9uIDM1LjMuMSBTdGFydGluZyBSZWNlcHRpb24gZm9y
IHRoZSBNSVBJIENTSS0yIElucHV0IG9uDQo+ID4gdGhlIGxhdGVzdCBoYXJkd2FyZSBtYW51YWwo
UjAxVUgwOTE0RUowMTQwIFJldi4xLjQwKSBpdCBpcyBtZW50aW9uZWQNCj4gPiB0aGF0DQo+IA0K
PiBzL21hbnVhbC9tYW51YWwgLw0KDQpPSywgd2lsbCBmaXggdGhpcyBpbiBuZXh0IHZlcnNpb24u
DQoNCkNoZWVycywNCkJpanUNCg0KPiANCj4gPiBpbml0aWFsaXplIHRoZSBBWEkgbWFzdGVyIGZp
cnN0IGFuZCB0aGVuIGluaXRpYWxpemUgdGhlIGltYWdlDQo+IHByb2Nlc3NpbmcuDQo+ID4gRml4
IHRoZSBzdGFydCBwcm9jZWR1cmUgYXMgcGVyIHRoZSBoYXJkd2FyZSBtYW51YWwuDQo+ID4NCj4g
PiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+
IA0KPiBSZXZpZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydCtyZW5l
c2FzQGlkZWFzb25ib2FyZC5jb20+DQo+IA0KPiA+IC0tLQ0KPiA+ICAuLi4vbWVkaWEvcGxhdGZv
cm0vcmVuZXNhcy9yemcybC1jcnUvcnpnMmwtdmlkZW8uYyB8IDE0DQo+ID4gKysrKysrKy0tLS0t
LS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkN
Cj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3JlbmVzYXMvcnpn
MmwtY3J1L3J6ZzJsLXZpZGVvLmMNCj4gPiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vcmVuZXNh
cy9yemcybC1jcnUvcnpnMmwtdmlkZW8uYw0KPiA+IGluZGV4IGQwZmZhOTBiYzY1Ni4uYTdkNmZl
ODMxZDU0IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vcmVuZXNhcy9y
emcybC1jcnUvcnpnMmwtdmlkZW8uYw0KPiA+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0v
cmVuZXNhcy9yemcybC1jcnUvcnpnMmwtdmlkZW8uYw0KPiA+IEBAIC00MzAsMTMgKzQzMCw2IEBA
IGludCByemcybF9jcnVfc3RhcnRfaW1hZ2VfcHJvY2Vzc2luZyhzdHJ1Y3QNCj4gPiByemcybF9j
cnVfZGV2ICpjcnUpDQo+ID4NCj4gPiAgCXNwaW5fbG9ja19pcnFzYXZlKCZjcnUtPnFsb2NrLCBm
bGFncyk7DQo+ID4NCj4gPiAtCS8qIEluaXRpYWxpemUgaW1hZ2UgY29udmVydCAqLw0KPiA+IC0J
cmV0ID0gcnpnMmxfY3J1X2luaXRpYWxpemVfaW1hZ2VfY29udihjcnUsIGZtdCk7DQo+ID4gLQlp
ZiAocmV0KSB7DQo+ID4gLQkJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmY3J1LT5xbG9jaywgZmxh
Z3MpOw0KPiA+IC0JCXJldHVybiByZXQ7DQo+ID4gLQl9DQo+ID4gLQ0KPiA+ICAJLyogU2VsZWN0
IGEgdmlkZW8gaW5wdXQgKi8NCj4gPiAgCXJ6ZzJsX2NydV93cml0ZShjcnUsIENSVW5DVFJMLCBD
UlVuQ1RSTF9WSU5TRUwoMCkpOw0KPiA+DQo+ID4gQEAgLTQ1MCw2ICs0NDMsMTMgQEAgaW50IHJ6
ZzJsX2NydV9zdGFydF9pbWFnZV9wcm9jZXNzaW5nKHN0cnVjdA0KPiByemcybF9jcnVfZGV2ICpj
cnUpDQo+ID4gIAkvKiBJbml0aWFsaXplIHRoZSBBWEkgbWFzdGVyICovDQo+ID4gIAlyemcybF9j
cnVfaW5pdGlhbGl6ZV9heGkoY3J1KTsNCj4gPg0KPiA+ICsJLyogSW5pdGlhbGl6ZSBpbWFnZSBj
b252ZXJ0ICovDQo+ID4gKwlyZXQgPSByemcybF9jcnVfaW5pdGlhbGl6ZV9pbWFnZV9jb252KGNy
dSwgZm10KTsNCj4gPiArCWlmIChyZXQpIHsNCj4gPiArCQlzcGluX3VubG9ja19pcnFyZXN0b3Jl
KCZjcnUtPnFsb2NrLCBmbGFncyk7DQo+ID4gKwkJcmV0dXJuIHJldDsNCj4gPiArCX0NCj4gPiAr
DQo+ID4gIAkvKiBFbmFibGUgaW50ZXJydXB0ICovDQo+ID4gIAlyemcybF9jcnVfd3JpdGUoY3J1
LCBDUlVuSUUsIENSVW5JRV9FRkUpOw0KPiA+DQo+IA0KPiAtLQ0KPiBSZWdhcmRzLA0KPiANCj4g
TGF1cmVudCBQaW5jaGFydA0K

