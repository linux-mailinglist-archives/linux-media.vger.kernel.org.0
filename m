Return-Path: <linux-media+bounces-4108-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2AE839900
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 20:03:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E43302890FF
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 19:03:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DE1F8614A;
	Tue, 23 Jan 2024 18:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="GFXCe4gR"
X-Original-To: linux-media@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2138.outbound.protection.outlook.com [40.107.114.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F8286122;
	Tue, 23 Jan 2024 18:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706036213; cv=fail; b=F6NMz3ruNlIcO2ANu8ZAILTUkeF37b3OXiJXDpSKiHqKPBR6VZPkYQEcU8mY451lijTQH+npVNcaTc/BS8rkWL4zEM6PGBPXp0/1BiMaowNaTN9+uyNB5ODm95Ldb4evHL1yAZm8eNTDtgKbzRcAGTyuG5rEcGjAi9EHZ+h3cS0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706036213; c=relaxed/simple;
	bh=1OP7RnuyzxipXLyIB0eINQauwlREWl1M1Z36IrdNa9g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=X3OSRfxxn2eNC/cdaG0Fm9vcdTyWzx/I6BZXs4dbl+D+sSVp9E9BCgz8sL89ptpMsDPXfgTTIuP81i0a190GPcRM5lliVt6/Mvgkmf1ecouuRylOcVEJ78B+hiMtzyORF7YvYWsCKo3638XAtIR/RU/LhsDsE1olb309zqGJ9pI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=GFXCe4gR; arc=fail smtp.client-ip=40.107.114.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zfkouy+VP2rIABL2pS+gucjINPdeJZgH8pFwdORof63Z+Zpgo1vM9Tsf0Ocaq9zJhXnSJqXCuXiA/TWcxMs6ImiS2iF8a7rGKgWneB8b1/GyChgaE8lR3dW2tifHkmLl/kuhuCKMDHoyIm4P17i/mw742K9vIPsJyZfeP1F+ZpwWdXKEeObwKZdMs6YKDyBMFcaG/ghctkxQGmeilVIUl8rnn2ZE2DMOCPtCUerT530AXKfRROzcwdkU0jmAAWvmM4y2vZ5r3lnFl7uqYBIa5nyImNWyjanhS4o2ntqIySAb8E5niCKZVG7+HeZPjKN+u3U11/asiTUAxOMb6rufIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1OP7RnuyzxipXLyIB0eINQauwlREWl1M1Z36IrdNa9g=;
 b=GzGN4mxLJRzRLFFO/QRc+adVU705FYaWSUKClgXhOPUkd2/D6O45kxl4iFE6MavIUOC55zlB/LCjXbY/LQ2SmWqpYkPUsn0nzBYC0Q4ZUZyNIz5/Jmte8iJ1AOHcmQliDPLiYf/320E6WRe9KBvY9EnJYdB5G608xllEWLWa3Tx6Ssg896jaF8W+8kwh4I+xF222431L1Vve2owKhXXNMBK9im5BkWXR27QHYnLWgXQtyNvFhyovu70JicfMg2MeGi6Fe1NSmH8V5yt21wDtdlWKdTts/eL/xOliDlSkm6DIpw0zkVbrdzwvACh9G7UY0tWW+S6STJyYiz//kwr+pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1OP7RnuyzxipXLyIB0eINQauwlREWl1M1Z36IrdNa9g=;
 b=GFXCe4gR+YCxUraAqXAeKR9PtwqJPv9C04QBOo720XdLbxoeKvSsgCqG506UY09rlUlG6KTzO4aWpjm5zDkIQoMvpCtslmjxMCL8B+4cWbx9LJRNwdOeEYTXGUNL30gMqbwLwbfTTg+TjUDDbSrt/1FDkIC21FYx3SXJLpLXPsA=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TYWPR01MB11184.jpnprd01.prod.outlook.com
 (2603:1096:400:3f0::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Tue, 23 Jan
 2024 18:56:47 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::8d12:a02a:9fdc:9c78]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::8d12:a02a:9fdc:9c78%5]) with mapi id 15.20.7228.022; Tue, 23 Jan 2024
 18:56:47 +0000
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
Subject: RE: [PATCH 2/4] media: platform: rzg2l-cru: rzg2l-ip: Add delay after
 D-PHY reset
Thread-Topic: [PATCH 2/4] media: platform: rzg2l-cru: rzg2l-ip: Add delay
 after D-PHY reset
Thread-Index: AQHaTfOA+CDDUBiedU2T9TzSU4YdT7DnhkMAgAAz7cCAAAKqgIAAAsvg
Date: Tue, 23 Jan 2024 18:56:47 +0000
Message-ID:
 <TYCPR01MB1126989030E0DEA41A930A81586742@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20240123115821.292787-1-biju.das.jz@bp.renesas.com>
 <20240123115821.292787-3-biju.das.jz@bp.renesas.com>
 <20240123153024.GQ10679@pendragon.ideasonboard.com>
 <TYCPR01MB11269CDDA833B19000893C90B86742@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <20240123184547.GE14927@pendragon.ideasonboard.com>
In-Reply-To: <20240123184547.GE14927@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TYWPR01MB11184:EE_
x-ms-office365-filtering-correlation-id: 875d409c-0b6b-4873-781d-08dc1c450cd6
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 jOr6DsWUaHXpK3a7vdIqKr9Jvv/s59WKK4lCNYMjMoAwxFKXQZQbIhD0tNr9i33vCMGeyuz7Pns/D06Ubq6W5lCU99ZSfGucy1KeJldF41GR0kqQlvBzCCUFndnVKyhJ3oR9FDwtY5aFgTVpXrSuA6jMJTu1SEntksHbO29ANoT1laj3mYIDgF2KoN8OVy/5BNZ/GvFHHwPFs5zpHf4sCiaI8MdWPnIYkTiwZb1p8POPIu4ajlPkadxQFz7A46Jo/iM0ZyMOpxVyYslJDbK41dlkdf2Weg0SfMBJGhRZocKDTFdEV6DXefmjrkQpxYqjnhZtEAzo42X/lXYOxy69UXuI7Np76BgPeOB7/lM3VlLF9P4OiOQZVcpIiLVOXeBjsfDKnZzpiqjxxOlQWx/6ehTJnBnNCsvIxamZ5SqRRJQWXxS/BeFcu0ph/HQfSmm62gmIbAoQMSV563lQrbMZYphJNEGGTa40h+erEz6CfmFr4Mp6vPNYfi+49QE9unQOllzMC54glNQS8H2YdRVTY/wge2OxgN+xmVwh6r/vMCh64SDSWlclK0YN61fIG+6QuYvgFwHRJr+MO+UQVGt5l0bcWJX3xW/g72WpHVPPEvfXxRAJOgIdKToHuLChvHIO
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(366004)(136003)(396003)(346002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(7696005)(55016003)(9686003)(6506007)(53546011)(76116006)(66946007)(83380400001)(316002)(71200400001)(8936002)(66446008)(8676002)(54906003)(66556008)(66476007)(64756008)(6916009)(122000001)(5660300002)(7416002)(38100700002)(4326008)(52536014)(26005)(33656002)(38070700009)(41300700001)(478600001)(86362001)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VkNMTEFQb0xpcmw1ZUlYeG1IYnUwZ05lekRzcUJaY2l5Z0cwcWhYNHc0TlBR?=
 =?utf-8?B?bkRGTTlRdlh3TzVkWFUvY0pORk41NXNlR0hsQkRXeEFoZUh5RzVvbFhITDdp?=
 =?utf-8?B?K0dXRmNaa1NHOGg3UmZmcFJ4eFBWK2tmcG01NDB4dWdBWlJOeTVTRnlzQWlL?=
 =?utf-8?B?cGt4MmVsemZub0ZCYkRrUzNBV0p4TWxtbUFDWng3VTVMMkdpVzZxM1ZLV0Fh?=
 =?utf-8?B?dzVxKzVVM1FnOGhTS0hDOGNHQVNHNitURW00U01Lb3NQUm1meERrbGNWMFlK?=
 =?utf-8?B?YkZRQ2tGNEFvOXQ2WG1JT3VVOVNEWHpRRkgvcWlVOC9QS0RYWDVLNktGcnND?=
 =?utf-8?B?dWk2N2Ntci84amJURFQwL25EMVg1dmQ1WmRYMDQxMWJhNFhXeDNZa01XdmZJ?=
 =?utf-8?B?ZGpLVTJrelFFWHA4S2NNS0dCckJaWkIxd1dRaHBUa0RuL1R0WjlTaTk5MW1i?=
 =?utf-8?B?WFZaTCtBVlhrK25FZGIzOHJjOHFYU2NPQzBqU1lpV1JlZlVMWFdQbFFpN3VP?=
 =?utf-8?B?SEp4RXoyWmcyeGlzM3dzMEV1MTMzWnV3M2VQZWdsTy8zZGY2dmk0Mk81dk5n?=
 =?utf-8?B?NFRsR0Z4dWNvN3Y4QVpvTEIvWEErMUV2VTFEbVJDS1VQQ3RacUJzYjFMN2Zm?=
 =?utf-8?B?a09qdlE5ZDVvZnFNbWJOSDUwYk1SeWhUZkZwZW1TQkQ1cDZFcENEa2Y3TTk4?=
 =?utf-8?B?R3BEKzJua1VxNjFkNFQ0UGxwSUNnUzBkNU5EekxsZWdkNnJ5Q0x2UjhmS1pX?=
 =?utf-8?B?ejExS2ZNRS9sM203U0xiRmxNNEZZQ05kMCtJd3BPU21Qbk55UW5EWFZRT3RZ?=
 =?utf-8?B?OFFITWthaGZ3eFE4akx3RnNncUVEK1FFMjVTR1VWLzI5dE1QTHh6cVdNcVVC?=
 =?utf-8?B?WkJHRUVTZDIzMDJmQUhFRCtmNll3MHhpNDM4Y2x3MjY4bENIaTgxY3U1N0Rx?=
 =?utf-8?B?anBlVFVLSEUycENvK3B1eUdaQ3RFWHBRWHJ2OGZ3aFZFdi9WQ0ZHa2J1YUx2?=
 =?utf-8?B?U1d1cG85c3FiMkVmMVVNU3Q0N0NiRlB0WERmQXBSb21LNjM1KzVlMitwWnlk?=
 =?utf-8?B?RS9yaWJwbDBhWWUxeHpZMGQrSU4xK1U4SUg0TElzRW5JUCt0aUkzWFZ1TXQr?=
 =?utf-8?B?MVA0MmhOMmdsM2dmT1BvRHNObTRnNnFFMU1rODZ5dHNsWS9YcXlkb1NpNklr?=
 =?utf-8?B?U1JacU1vNjJGcGxSL1JKYnN0M0ptNDczM01VeUJGY0FjV29BQUFyUWpFdG5B?=
 =?utf-8?B?TmsxTHBBZFBrbWtoVWhYM0YxeGlyQnNLTVBES1Ziei9EUWUyREEydFpaRlNP?=
 =?utf-8?B?WDJxcExENEhJVEtnWjB6NmZ0YnJmb29vL0tERlFHS0VERkVmVi9VNytsN2s2?=
 =?utf-8?B?Q2VuVjFDMXplU2ZQTzVxYkdya3M5c2h1Zlc5Y3RPdlUwQ1g4cHgreUt5a0I1?=
 =?utf-8?B?L1RnaENsVHVTdWwrK2JvRHJTSlloUlZGQWdrNjcydHVnZXFGTmNMNkM0TnNF?=
 =?utf-8?B?OHJuVGNDR21VM1lZbmJUdGxENlUzNXlwVnhiRXVrU20vVDBSMi8yU3RGamlM?=
 =?utf-8?B?U2xqM1RqUFFjTitmVUlIamdlb1lvZkU2SUF6U1ZyaXR5aVNURWJtdFZmZi9y?=
 =?utf-8?B?VEl4SDlWZDBHVk1mNzFrSW1JZnYxRXg5MDFDZy85d3I1ODRodXl4MWlYNjFU?=
 =?utf-8?B?REkzM3BCMmxxK2dlMFBxeHdlSnRPaVJQaVJRdnZMN3U4ZzBjWFM2Y0k2Sk1Z?=
 =?utf-8?B?ZGhuMW85eFJDZFMvNkZOU2tPUUtqc0VZV2I3QnQ4KzFzMDd2eUc2SmFYU05P?=
 =?utf-8?B?eC9OSEJReHFVbzRVOXhKLzZLdGZnODBMN0NsaXRlUndTaURoV1VSeHJYT3Zz?=
 =?utf-8?B?OHRlc1hoaVJtck1aSzNaZ091bG9aQU1DNmk3SGl0MkRTYXc2K2xVZnJacklr?=
 =?utf-8?B?OHA4Z2ZZSVRmS1d3TTlTQTlJWEl5VUwvZWRPb05jWktuRENwbFpUTVRYcHBN?=
 =?utf-8?B?Q25vTGFWZEw5WGFiVStFa2lrM2pEZ0x6czExWTVaV2UzRGRJNGNTc282Z1Fv?=
 =?utf-8?B?UVNxcDM3L01BOG5PRXhvZEg2YWF6c01GbjF2Z3MraGVwN1VGcXh5OGtNWWg4?=
 =?utf-8?B?eXo1WnpLeWQwamZld29oTmNYYTRYQzZUWklLVWIwUnVnVktMZFRRK1BsQVdq?=
 =?utf-8?B?cFE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 875d409c-0b6b-4873-781d-08dc1c450cd6
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2024 18:56:47.3408
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aB7BMSpprjoxhIeHeBzzYzbaIi47wDQ4pz86PMCoVtf2t3wOEgKBEl/aVJQdtbksszVJzQ+EgGIUmrsqr9AqToH5Un1WrfJzEu/oBweGxMA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11184

SGkgTGF1cmVudCBQaW5jaGFydCwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBG
cm9tOiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+
DQo+IFNlbnQ6IFR1ZXNkYXksIEphbnVhcnkgMjMsIDIwMjQgNjo0NiBQTQ0KPiBTdWJqZWN0OiBS
ZTogW1BBVENIIDIvNF0gbWVkaWE6IHBsYXRmb3JtOiByemcybC1jcnU6IHJ6ZzJsLWlwOiBBZGQg
ZGVsYXkNCj4gYWZ0ZXIgRC1QSFkgcmVzZXQNCj4gDQo+IE9uIFR1ZSwgSmFuIDIzLCAyMDI0IGF0
IDA2OjM4OjAwUE0gKzAwMDAsIEJpanUgRGFzIHdyb3RlOg0KPiA+IEhpIExhdXJlbnQgUGluY2hh
cnQsDQo+ID4NCj4gPiBUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCj4gPg0KPiA+ID4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206IExhdXJlbnQgUGluY2hhcnQgPGxhdXJl
bnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4NCj4gPiA+IFNlbnQ6IFR1ZXNkYXksIEphbnVh
cnkgMjMsIDIwMjQgMzozMCBQTQ0KPiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSCAyLzRdIG1lZGlh
OiBwbGF0Zm9ybTogcnpnMmwtY3J1OiByemcybC1pcDogQWRkDQo+ID4gPiBkZWxheSBhZnRlciBE
LVBIWSByZXNldA0KPiA+ID4NCj4gPiA+IEhpIEJpanUsDQo+ID4gPg0KPiA+ID4gVGhhbmsgeW91
IGZvciB0aGUgcGF0Y2guDQo+ID4gPg0KPiA+ID4gT24gVHVlLCBKYW4gMjMsIDIwMjQgYXQgMTE6
NTg6MTlBTSArMDAwMCwgQmlqdSBEYXMgd3JvdGU6DQo+ID4gPiA+IEFzIHBlciBzZWN0aW9uIDM1
LjMuMSBTdGFydGluZyBSZWNlcHRpb24gZm9yIHRoZSBNSVBJIENTSS0yIElucHV0DQo+ID4gPiA+
IG9uIHRoZSBsYXRlc3QgaGFyZHdhcmUgbWFudWFsKFIwMVVIMDkxNEVKMDE0MCBSZXYuMS40MCkg
aXQgaXMNCj4gPiA+ID4gbWVudGlvbmVkIHRoYXQgYWZ0ZXIgRFBIWSByZXNldCwgd2UgbmVlZCB0
byB3YWl0IGZvciAxIG1zZWMgb3INCj4gPiA+ID4gbW9yZSBiZWZvcmUgc3RhcnQgcmVjZWl2aW5n
IGRhdGEgZnJvbSB0aGUgc2Vuc29yLiBTbyBhZGQgYSBkZWxheQ0KPiBhZnRlciBwcmVfc3RyZWFt
b24oKS4NCj4gPiA+ID4NCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFz
Lmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gPiAtLS0NCj4gPiA+ID4gIGRyaXZlcnMvbWVkaWEv
cGxhdGZvcm0vcmVuZXNhcy9yemcybC1jcnUvcnpnMmwtaXAuYyB8IDMgKysrDQo+ID4gPiA+ICAx
IGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspDQo+ID4gPiA+DQo+ID4gPiA+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3JlbmVzYXMvcnpnMmwtY3J1L3J6ZzJsLWlwLmMN
Cj4gPiA+ID4gYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3JlbmVzYXMvcnpnMmwtY3J1L3J6ZzJs
LWlwLmMNCj4gPiA+ID4gaW5kZXggOWYzNTFhMDU4OTNlLi41NDY4ZGMxNzlkZTcgMTAwNjQ0DQo+
ID4gPiA+IC0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vcmVuZXNhcy9yemcybC1jcnUvcnpn
MmwtaXAuYw0KPiA+ID4gPiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3JlbmVzYXMvcnpn
MmwtY3J1L3J6ZzJsLWlwLmMNCj4gPiA+ID4gQEAgLTUsNiArNSw3IEBADQo+ID4gPiA+ICAgKiBD
b3B5cmlnaHQgKEMpIDIwMjIgUmVuZXNhcyBFbGVjdHJvbmljcyBDb3JwLg0KPiA+ID4gPiAgICov
DQo+ID4gPiA+DQo+ID4gPiA+ICsjaW5jbHVkZSA8bGludXgvZGVsYXkuaD4NCj4gPiA+ID4gICNp
bmNsdWRlICJyemcybC1jcnUuaCINCj4gPiA+ID4NCj4gPiA+ID4gIHN0cnVjdCByemcybF9jcnVf
aXBfZm9ybWF0IHsNCj4gPiA+ID4gQEAgLTcxLDYgKzcyLDggQEAgc3RhdGljIGludCByemcybF9j
cnVfaXBfc19zdHJlYW0oc3RydWN0DQo+ID4gPiA+IHY0bDJfc3ViZGV2DQo+ID4gPiAqc2QsIGlu
dCBlbmFibGUpDQo+ID4gPiA+ICAJCWlmIChyZXQpDQo+ID4gPiA+ICAJCQlyZXR1cm4gcmV0Ow0K
PiA+ID4gPg0KPiA+ID4gPiArCQl1c2xlZXBfcmFuZ2UoMTAwMCwgMjAwMCk7DQo+ID4gPiA+ICsN
Cj4gPiA+DQo+ID4gPiBXaGF0IHdvdWxkIHlvdSB0aGluayBvZiB1c2luZw0KPiA+ID4NCj4gPiA+
IAkJZnNsZWVwKDEwMDApOw0KPiA+ID4NCj4gPiA+IGluc3RlYWQgPw0KPiA+DQo+ID4gRXNzZW50
aWFsbHkgaXQgaXMgc2FtZSBieSBsb29raW5nIGF0IHRoZSBjb2RlWzFdLg0KPiA+IE9LIHdpbGwg
dXNlIGZzbGVlcCgpDQo+IA0KPiBZZXMsIGl0IHdpbGwgcmVzdWx0IGluIHRoZSBzYW1lIGRlbGF5
LiBmc2xlZXAoKSBpcyByZWNvbW1lbmRlZCBhcyB0aGUNCj4gZGVmYXVsdCBzbGVlcCBmdW5jdGlv
biB1bmxlc3MgdGhlcmUncyBhIHNwZWNpZmljIG5lZWQgdG8gZG8gc29tZXRoaW5nDQo+IGRpZmZl
cmVudC4NCg0KT0suIFRoYW5rcyBmb3IgdGhlIGV4cGxhbmF0aW9uLg0KDQpDaGVlcnMsDQpCaWp1
DQoNCj4gDQo+ID4gWzFdDQo+ID4gc3RhdGljIGlubGluZSB2b2lkIGZzbGVlcCh1bnNpZ25lZCBs
b25nIHVzZWNzKSB7DQo+ID4gCWlmICh1c2VjcyA8PSAxMCkNCj4gPiAJCXVkZWxheSh1c2Vjcyk7
DQo+ID4gCWVsc2UgaWYgKHVzZWNzIDw9IDIwMDAwKQ0KPiA+IAkJdXNsZWVwX3JhbmdlKHVzZWNz
LCAyICogdXNlY3MpOw0KPiA+IAllbHNlDQo+ID4gCQltc2xlZXAoRElWX1JPVU5EX1VQKHVzZWNz
LCAxMDAwKSk7DQo+ID4gfQ0KPiA+DQo+ID4gPiBXaXRoIG9yIHdpdGhvdXQgdGhhdCwNCj4gPiA+
DQo+ID4gPiBSZXZpZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydA0KPiA+ID4gPGxhdXJlbnQucGlu
Y2hhcnQrcmVuZXNhc0BpZGVhc29uYm9hcmQuY29tPg0KPiA+ID4NCj4gPiA+ID4gIAkJcmV0ID0g
cnpnMmxfY3J1X3N0YXJ0X2ltYWdlX3Byb2Nlc3NpbmcoY3J1KTsNCj4gPiA+ID4gIAkJaWYgKHJl
dCkgew0KPiA+ID4gPiAgCQkJdjRsMl9zdWJkZXZfY2FsbChjcnUtPmlwLnJlbW90ZSwgdmlkZW8s
DQo+IHBvc3Rfc3RyZWFtb2ZmKTsNCj4gDQo+IC0tDQo+IFJlZ2FyZHMsDQo+IA0KPiBMYXVyZW50
IFBpbmNoYXJ0DQo=

