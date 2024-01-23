Return-Path: <linux-media+bounces-4103-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D73EE8397E2
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 19:39:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 659E01F256BF
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 18:39:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E29D885C53;
	Tue, 23 Jan 2024 18:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="dSHKJ3Ue"
X-Original-To: linux-media@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2129.outbound.protection.outlook.com [40.107.114.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE5682D62;
	Tue, 23 Jan 2024 18:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706035086; cv=fail; b=gUljJ5JdRn6SZSdaSzuNT7AqEIPGq1C0joJRogVfgRfUJJ1Pt4LAu+FgVj6BpVy+KW+keohVT16HqjlgZhw42QA+Ov6hzPY7P7EZ7Q2AJQr22Vzbkvt9oMp3BCakOn6KAyb+J7KNqwudkC6BgSMuyvJ4rejrFmNb/KsB/BRMd28=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706035086; c=relaxed/simple;
	bh=OjBPSVJjX1J4Bz2lRx+ysBLGzoQN2zG9dIpaHbdn3C0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=s9l8IRB0n26wOTPjVhiaFgKJD8H5TJk8DFSFsv3/HiUwC+W7CpxgJLYyKTQxvFUuftKAkepeho8LdPuWR2IcjJK/oljVqKM/5QFLBxdgEWd4xpYDCs2Qprg+k/fA+zSwEZIoL5POKvWZAWidaZ4NxcjTuM1QcLCk3o+zkXu3+3E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=dSHKJ3Ue; arc=fail smtp.client-ip=40.107.114.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jIFyLhaYuJpyC4YVD5xT7pLtd86hVYAJsz9cpuayvTyCzMPq9NHHPOvFfzKgeSMs2HkocfiCsT33Xp/M8xapUAZ/hoB4OnWMmc10qTV1PbeQ78V/Fwim/siPgpTm8AqL/VmvNpHGbFJQxPZglu4H4HgPZQVJnXmhGAqduRx2A31v85B9xYWjlJWS/6H+aki6a/Qe4xY/JE5/JBx9mW9pTPs97mStUU3IswrGr+47ZVgnaapQFl4IMQMtQxYzlv0dHb3lmtRLGG7gZMjOA/7lTI5Xj0u/57X8Pq/iMcmswD0Xw6toedRtAcUgePvMLqq50wRrQpWLFymLux5r2VprRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OjBPSVJjX1J4Bz2lRx+ysBLGzoQN2zG9dIpaHbdn3C0=;
 b=TmWDj9GvWP7HKpUoyuGAiOuAyxe/QvWEF1lPCqWby1QeD6C9M9Os26eT6G0nsIhuHIQ5KQ4xM9ZBe6K7QBo0tuzZSpL1WF2xaZqpSwKc560N89aWMl5mkCXVpQKQEIJ7V1C/yDXO6Aok1ph3vEuPgvfcwnUoZ/reoGV59TnU4l8GLO/TCH2z8BA98wKmWE/fPCjTaZP6tsIFSC3ETdTO4wnyCq69LGf53bQpJhEKSIqQRb5TAWfi9IaZDyJ1rvOaGsU9FU/4HAr7oR1Mt8GmFbYlIr8Ylz68sNJVF85ns0hfO7O5x/M60ZGm0MHAcQ5tsD1YeqL9+6izqUjisCdPlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OjBPSVJjX1J4Bz2lRx+ysBLGzoQN2zG9dIpaHbdn3C0=;
 b=dSHKJ3UeIvESZ3fTGbwsGzgQ8NwdHRUcsoUZ5ca/X37JjQY39AARWMJo3of0iPT4BV7j3Ep6iy1AKg8wer2yxeXdVTC5Cr6gYTXLfnOaaniNNA58yIJ6FLBCl6e4s5AcZipkwN7FsniN/cAW9rZBo+cxL/K9rTsZTujfjr3zKtQ=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by OSRPR01MB11632.jpnprd01.prod.outlook.com
 (2603:1096:604:22f::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Tue, 23 Jan
 2024 18:38:00 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::8d12:a02a:9fdc:9c78]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::8d12:a02a:9fdc:9c78%5]) with mapi id 15.20.7228.022; Tue, 23 Jan 2024
 18:38:00 +0000
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
Thread-Index: AQHaTfOA+CDDUBiedU2T9TzSU4YdT7DnhkMAgAAz7cA=
Date: Tue, 23 Jan 2024 18:38:00 +0000
Message-ID:
 <TYCPR01MB11269CDDA833B19000893C90B86742@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20240123115821.292787-1-biju.das.jz@bp.renesas.com>
 <20240123115821.292787-3-biju.das.jz@bp.renesas.com>
 <20240123153024.GQ10679@pendragon.ideasonboard.com>
In-Reply-To: <20240123153024.GQ10679@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|OSRPR01MB11632:EE_
x-ms-office365-filtering-correlation-id: 76bb3944-9979-4ae7-f321-08dc1c426d17
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 nD77nGYxoufPyNZjg3Z0Rhj4slM9yS0kr5r0d3aDZhb4GTaCWNd6v8X6bVFqOoOF8M6PqcQJU6sGDToePFbHvBZ0/nfrYjWi+Vt0Z6qhQ5K7r49wHvC2hx/YqYcXY3K1uV/R5u7wBYUQDPm8qTbMM50WoJ2WaQVlls7FFCbomrAqs4/uxGLjef7SDKR/Y1FHNQyLZD+O4vuQVyZFyMpzFZOQOHVwg6Qzb7+2LhiaedTrs1zWaAOovja0J0oFh1+UxYmTeuhK6MYZOrvOR/vGDKx2cyXKzfHJZPyQuXebXjKz2kU3AZy3iIzsnD2oIbbRR2avYkLm0odpxCLgk14HGVQ7xVfESD6u3RZy9377IHfR4o3Ffo8RNp/bRBtPI/nTohnjqTD9TZZ0lFOSOPFzsn05s3pLXUzvpyfKt2Nl3qGI/vH+m/GSagAxC47xFn1Ypn6ZdKosAkP8jbqZHoiib1XqNhxEGawjMjs26AvlpzkbDVjycXiiE+tGIsfU4Vqr8n5I6nsJWaP2qgZWdusGUdgMerZnGRMNByZCHilucLAQQopcSy+tXRZXjpgLbdR3hK9aHWlKcF0QXqwbNPFizTWrpcZ3OrX669/adaiWucxqan9/U8/s3e/m9aXFhz1O
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(346002)(39860400002)(376002)(366004)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(316002)(6916009)(64756008)(66446008)(66476007)(54906003)(9686003)(122000001)(76116006)(66946007)(66556008)(478600001)(38100700002)(71200400001)(7696005)(6506007)(53546011)(55016003)(8676002)(8936002)(4326008)(7416002)(52536014)(5660300002)(83380400001)(26005)(2906002)(86362001)(33656002)(41300700001)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eGhNeHQyNjJjMDVtdHVMQnhjN0NOOVVxeTYyMlFTZGQrQ0RwRmI4VVN0L3po?=
 =?utf-8?B?V3lHTytWSzZmWFZ0b3FxaTU3bXZQRUcwTzZ1b3ZPR2wwN1hLNWhHMnNFUVF0?=
 =?utf-8?B?ZlRXTUVobjliYVpqUFZnQUg0MHFiNzVNU0k1NWNjMEM0ajhSU3IzOEpDR2hL?=
 =?utf-8?B?TUJzaFA4cjFRV2pFdFdSa1NIYmFpcjBYWWhNemVXaDAzZzRQT1d0djVkUnVE?=
 =?utf-8?B?MlhFMnFoTjNRMC9vTTVmS3BnRy9oVFFJKzhFRmU4QVpYd3F5dXpsVmg2T0tk?=
 =?utf-8?B?a0g2WFRBQkVIVG12d1p5REVxNkE1SFgwbjcvLzU5dEVseERxR2ZCdDFqaE5x?=
 =?utf-8?B?ZE5xL3B6K1o2TUZGQUhxenBZRFdTd1FGZHBtN2NHZG5KeXFUR25BNUw0RmVt?=
 =?utf-8?B?OFdxbGlDKytsc0J3TndZT0ljT0VzaUdYZmdOTjFvSHBzVlhqV1RtYXgydkhI?=
 =?utf-8?B?djBaRVhrbVhFN2RMY0RLWGRDeEFwbHRyVW5YU1VjV3R0bEhndHhxVThpQ0l3?=
 =?utf-8?B?ZnNEZ3gxbG1ZWFNlWndzNE01SmFlVS9zVzU1djZ4TzdRTUE1cjBKcHg5eXV0?=
 =?utf-8?B?QW1JdGR0aThFQzhxL3g5Q0FSaEpLSlJGVWNjWWtlQmJZRDVwWlhXWGVnM0tV?=
 =?utf-8?B?ekIzOXAraUtSRktRL2lGb29EK0hqOUtWeGM0bHJGZkpqVU1rUFRETEc3MmdW?=
 =?utf-8?B?S3o2QlRsRjZKS29iNDF0VkRmbjU5M0VUdm5KWU5ORWFsUTVsRUdOdmF5RDds?=
 =?utf-8?B?cnhGa2pKdVFQSTkxeURoWllVTjJMaW8vMU1TQVlzakRDQ3ZaN2RPV2ZqZmFa?=
 =?utf-8?B?SSszSTVGbnJ5aUV2Q2kwWDdDMFRNT2g3RGw2UGI3ZkRVWDBuUE9QVlhNbkZ5?=
 =?utf-8?B?OEErL0FXQklOREVrajd0QTZjZ3Zya0xPYjFSSU9DQ1JCdjIyK1dsTkVUYzBj?=
 =?utf-8?B?OTR5V1VFOUlpSmRIUTRXSmpPNnU0Y081K3FtNEptdHBKbHpRU2JkVGJTalM1?=
 =?utf-8?B?YUJ5VEp2TTVpcFg4dVl2QUdPS2w5MDU1Y0UvWnZWenI4NVdvVDVETHpwYXow?=
 =?utf-8?B?NUF4eXJMMzZkaDBpSXgzc0ZRR3pFS3VsZ3VWODI1ZFJnYU55dTdQbWJQK1pN?=
 =?utf-8?B?YS9uaUJPWGoyUG02S1JmZDBtaU5jdTNVbnVnMGZ2eGdMLzdBUDkzendFekxS?=
 =?utf-8?B?NEhaS3JPREFMM3FGYkFPbFc1d29ySGIraG5XODFvN3pBVXMxU05JQUV6TFhi?=
 =?utf-8?B?WU9NL1hlK3RDNFRWY3IwL0JhZmdTR3ZIRHdqNjI0eUVGekhvVVNxbER0VXh4?=
 =?utf-8?B?Qk9qOUVVbHFkakM1M0FuTkV1REhoTnlwWjhGZGJZZS9NMmh2N0paRTNXbmF6?=
 =?utf-8?B?akh2RHV2TldXRkl1K09Cc0pFYURYMnhUbFFNSHhwK2tHaUhvdnFnVmJ6dEZj?=
 =?utf-8?B?RTRQbzNsSThZRm9CVTIwRk1BUS9abjZPSEdvb0VxWjU2ZTlUV1l3RUcrRFJu?=
 =?utf-8?B?azVIVG1jQWZySnVUajBkb29vaGR2ZEIzRWpaMVdwdEJsZHBkajF5WUZpd09H?=
 =?utf-8?B?Sjd3VkU0K2VEWGNoN2VZZzVMa0RUL3FSZUlMcEtRQUtJa3RpYnNQZnlJOTlK?=
 =?utf-8?B?b3EvYm9Tc0dUY3JkSkcrV0xPTEQ5NldOaWwvVlZHb0cxNFNWYm5GOFJwN1Vq?=
 =?utf-8?B?aW9RSjJDMVlwYmU0MjZRU2VxaWJ0TFhxOHZKT09FSzY0WDlNQ056aE91aitB?=
 =?utf-8?B?ODdQZ2NUMkt1OStkbC9OdzhvRFpsbitQM1N3SngvUktWYllKcUpIZ3FjVFZh?=
 =?utf-8?B?MmYyc2ZnM0xiQW8vaDVwL3NlUWhxYnhVV2hMQlgzNXhVOUp2Yk9lQjIrK3U2?=
 =?utf-8?B?a3RmUWozaFVTM0R4aHhteXNWQ2g3VGVsdDZ3Nk5uY1k1QVFFdXU0c0ZySXFo?=
 =?utf-8?B?V1J2ZXd0ZVRoQm1kQVlYUlcvTVRudFZIS0VPQzA4bjhORGtoOU1iWFlRYXcw?=
 =?utf-8?B?Um5VUGJzY0RPUXFGcjhMLzBSSWJ3M1NpQUo5NiszN1RIbXVpV0NyMDViemVE?=
 =?utf-8?B?c29tandIZkp4TCtiVXpjbjlWK0RIS01aYnN5MXk1eitpbnR6MFhGZTJmOHBv?=
 =?utf-8?B?NEZtWDVvK0ZwRy9XWkIwSlo5emo5MlRUckpERW9rZnFVT2dRNzVWWjU3Y2JM?=
 =?utf-8?B?U0E9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 76bb3944-9979-4ae7-f321-08dc1c426d17
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2024 18:38:00.3421
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eJb1j2PujSS/EKDa7rHNmH4mkif80lYA0CLxltup3GPLVc8sZcXKz1rIjFQPdPTozsVnB2/xLAniJrBmKWgvwznbduqw2/o8AMFzM1CR4yo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11632

SGkgTGF1cmVudCBQaW5jaGFydCwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVu
dC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBKYW51YXJ5IDIz
LCAyMDI0IDM6MzAgUE0NCj4gU3ViamVjdDogUmU6IFtQQVRDSCAyLzRdIG1lZGlhOiBwbGF0Zm9y
bTogcnpnMmwtY3J1OiByemcybC1pcDogQWRkIGRlbGF5DQo+IGFmdGVyIEQtUEhZIHJlc2V0DQo+
IA0KPiBIaSBCaWp1LA0KPiANCj4gVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guDQo+IA0KPiBPbiBU
dWUsIEphbiAyMywgMjAyNCBhdCAxMTo1ODoxOUFNICswMDAwLCBCaWp1IERhcyB3cm90ZToNCj4g
PiBBcyBwZXIgc2VjdGlvbiAzNS4zLjEgU3RhcnRpbmcgUmVjZXB0aW9uIGZvciB0aGUgTUlQSSBD
U0ktMiBJbnB1dCBvbg0KPiA+IHRoZSBsYXRlc3QgaGFyZHdhcmUgbWFudWFsKFIwMVVIMDkxNEVK
MDE0MCBSZXYuMS40MCkgaXQgaXMgbWVudGlvbmVkDQo+ID4gdGhhdCBhZnRlciBEUEhZIHJlc2V0
LCB3ZSBuZWVkIHRvIHdhaXQgZm9yIDEgbXNlYyBvciBtb3JlIGJlZm9yZSBzdGFydA0KPiA+IHJl
Y2VpdmluZyBkYXRhIGZyb20gdGhlIHNlbnNvci4gU28gYWRkIGEgZGVsYXkgYWZ0ZXIgcHJlX3N0
cmVhbW9uKCkuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpA
YnAucmVuZXNhcy5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vcmVu
ZXNhcy9yemcybC1jcnUvcnpnMmwtaXAuYyB8IDMgKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRm
b3JtL3JlbmVzYXMvcnpnMmwtY3J1L3J6ZzJsLWlwLmMNCj4gPiBiL2RyaXZlcnMvbWVkaWEvcGxh
dGZvcm0vcmVuZXNhcy9yemcybC1jcnUvcnpnMmwtaXAuYw0KPiA+IGluZGV4IDlmMzUxYTA1ODkz
ZS4uNTQ2OGRjMTc5ZGU3IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0v
cmVuZXNhcy9yemcybC1jcnUvcnpnMmwtaXAuYw0KPiA+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxh
dGZvcm0vcmVuZXNhcy9yemcybC1jcnUvcnpnMmwtaXAuYw0KPiA+IEBAIC01LDYgKzUsNyBAQA0K
PiA+ICAgKiBDb3B5cmlnaHQgKEMpIDIwMjIgUmVuZXNhcyBFbGVjdHJvbmljcyBDb3JwLg0KPiA+
ICAgKi8NCj4gPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvZGVsYXkuaD4NCj4gPiAgI2luY2x1ZGUg
InJ6ZzJsLWNydS5oIg0KPiA+DQo+ID4gIHN0cnVjdCByemcybF9jcnVfaXBfZm9ybWF0IHsNCj4g
PiBAQCAtNzEsNiArNzIsOCBAQCBzdGF0aWMgaW50IHJ6ZzJsX2NydV9pcF9zX3N0cmVhbShzdHJ1
Y3QgdjRsMl9zdWJkZXYNCj4gKnNkLCBpbnQgZW5hYmxlKQ0KPiA+ICAJCWlmIChyZXQpDQo+ID4g
IAkJCXJldHVybiByZXQ7DQo+ID4NCj4gPiArCQl1c2xlZXBfcmFuZ2UoMTAwMCwgMjAwMCk7DQo+
ID4gKw0KPiANCj4gV2hhdCB3b3VsZCB5b3UgdGhpbmsgb2YgdXNpbmcNCj4gDQo+IAkJZnNsZWVw
KDEwMDApOw0KPiANCj4gaW5zdGVhZCA/DQoNCkVzc2VudGlhbGx5IGl0IGlzIHNhbWUgYnkgbG9v
a2luZyBhdCB0aGUgY29kZVsxXS4NCk9LIHdpbGwgdXNlIGZzbGVlcCgpDQoNCg0KWzFdDQpzdGF0
aWMgaW5saW5lIHZvaWQgZnNsZWVwKHVuc2lnbmVkIGxvbmcgdXNlY3MpDQp7DQoJaWYgKHVzZWNz
IDw9IDEwKQ0KCQl1ZGVsYXkodXNlY3MpOw0KCWVsc2UgaWYgKHVzZWNzIDw9IDIwMDAwKQ0KCQl1
c2xlZXBfcmFuZ2UodXNlY3MsIDIgKiB1c2Vjcyk7DQoJZWxzZQ0KCQltc2xlZXAoRElWX1JPVU5E
X1VQKHVzZWNzLCAxMDAwKSk7DQp9DQoNCkNoZWVycywNCkJpanUNCg0KPiANCj4gV2l0aCBvciB3
aXRob3V0IHRoYXQsDQo+IA0KPiBSZXZpZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVu
dC5waW5jaGFydCtyZW5lc2FzQGlkZWFzb25ib2FyZC5jb20+DQo+IA0KPiA+ICAJCXJldCA9IHJ6
ZzJsX2NydV9zdGFydF9pbWFnZV9wcm9jZXNzaW5nKGNydSk7DQo+ID4gIAkJaWYgKHJldCkgew0K
PiA+ICAJCQl2NGwyX3N1YmRldl9jYWxsKGNydS0+aXAucmVtb3RlLCB2aWRlbywgcG9zdF9zdHJl
YW1vZmYpOw0KPiANCj4gLS0NCj4gUmVnYXJkcywNCj4gDQo+IExhdXJlbnQgUGluY2hhcnQNCg==

