Return-Path: <linux-media+bounces-4204-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B75B83D757
	for <lists+linux-media@lfdr.de>; Fri, 26 Jan 2024 11:07:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BBA681C242DF
	for <lists+linux-media@lfdr.de>; Fri, 26 Jan 2024 10:07:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACA538C17;
	Fri, 26 Jan 2024 09:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="aczBeiKz"
X-Original-To: linux-media@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2111.outbound.protection.outlook.com [40.107.113.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1030214274;
	Fri, 26 Jan 2024 09:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706261136; cv=fail; b=T/3nmqu19Zfcg+MZY5DroFqGqngUcwK75Z4eAMIHUBXMjpHtFbASG156mbxFgOP9Qz9elVyUmH0bqLVZCKmVu78//GN3KFg2Ouc1pTw61ONQ9X2d0g/UDMW8lYMfmDINHj5qHhSB/dW9+lcfTgD43zayNhNdY0RbT1uvshTElQA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706261136; c=relaxed/simple;
	bh=wpclpCCkV3oVDNZSE9lfcJfEXH2Fai2SH5rU40yzkA4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OiaablxsfP0U7BuKj7qfNIIfMwhgKkZ1qas/e5D0rTZdVQkbCQu9Vf13wXR1Sb5wLX4RQLKLDNzAsux0P7aXwsqBCt6z1kTL0tw6ZRX44mvrVjuIZmrVRjE87wyBerXQ3Kt08Kcj6zQ1Zo2c4Glmk9rGwJXCvYdWOlfx/QEpOcY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=aczBeiKz; arc=fail smtp.client-ip=40.107.113.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lc3/KGx16HESVpIcNn/5vFRcDQx7FAxcPPdQgqAKTDRgK7btE7jSjcs/51ucw620cJ7dIBq5zU1lx6Sl9QTMl8fKRTdWI5IRBkUN5m+WxGqeLNRQYp24P93l7RRVdjEP7755Ssk+mkG05GIkuWUZ+X3OjlDIN3eEQmykpp0SE8ZBfoXRNRCSoFfnZMC0Pu9fYDD6dvjs8KnifutlrMJVCeOHnI2UEZ2a5RhaiGQIeOITkP39IA1fuIos6+0feUIKEC1LOeRXqEtFMbDgex+fBzbwGSuaeOSeCMb3CBi87+kxDx6vrOSGc+xIRchdLT3GYGUymZUtn1ZTCHm9+jyMXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wpclpCCkV3oVDNZSE9lfcJfEXH2Fai2SH5rU40yzkA4=;
 b=jBoV3gvuud2NUWtogE9EfK0FNli4nT4zQcjurSbx7FfNWjJ7wC578QDbiaEaVmQuRQaYOWJgQLmzjCq/Z9D1IsUL26Cm6tb4zt0d/XxAyN1rNxRLE3WF3Bf8EeyEDvJhhkJw+JSWWnubAntULFiqqON3wfwCV5acYygNb4xxcI0n5tTUGF3rnSjhpiNwT9aDkCj2Jb0qHXYHmuhCDI+6LB/9q4WBdAcm3MTtfivfCP+qQ3ArO/BfJGtN35ngZOdorDF4IpLyLRmp8X0paVGIqmCEyeqwp05SxuBsSf3Nq51dD3boxFj2YTeDtjALKcDRcJsh2x44ySwHawnOx7n9Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wpclpCCkV3oVDNZSE9lfcJfEXH2Fai2SH5rU40yzkA4=;
 b=aczBeiKzJl+pQGhZXR2OIQ0V3LjKsl49WOVmQIapvVNLqYIqSbd8qUOv9JKpgPBRmAR1++odSIQu3EY4ufPjSNZLCHRHi1ZwPCsszaT9rLBSIktrrA7p5OGYO30vaTLGiLfrSkrflAZJVsqO88dO1CUsO2A/G7/p2z1IOOCdtKc=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TYWPR01MB9294.jpnprd01.prod.outlook.com
 (2603:1096:400:1a1::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.21; Fri, 26 Jan
 2024 09:25:24 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::8d12:a02a:9fdc:9c78]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::8d12:a02a:9fdc:9c78%5]) with mapi id 15.20.7249.013; Fri, 26 Jan 2024
 09:25:24 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sakari Ailus
	<sakari.ailus@linux.intel.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?=
	<u.kleine-koenig@pengutronix.de>, Rob Herring <robh@kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, biju.das.au <biju.das.au@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Stephen Boyd
	<sboyd@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: RE: [PATCH 4/4] media: platform: rzg2l-cru: rzg2l-video: Restructure
 clk handling
Thread-Topic: [PATCH 4/4] media: platform: rzg2l-cru: rzg2l-video: Restructure
 clk handling
Thread-Index:
 AQHaTfOGse1EYgJsOEas+jUOFEStH7DnUReAgAA2sQCAADNH8IAAOueAgAEHmBCAAHQAAIAADKZAgAJW2lA=
Date: Fri, 26 Jan 2024 09:25:24 +0000
Message-ID:
 <TYCPR01MB1126949F4495A556A80400B2186792@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20240123115821.292787-1-biju.das.jz@bp.renesas.com>
 <20240123115821.292787-5-biju.das.jz@bp.renesas.com>
 <Za-u9VO2OuY6vhT8@kekkonen.localdomain>
 <20240123153550.GT10679@pendragon.ideasonboard.com>
 <TYCPR01MB112691B281C74CAD8EB14433E86742@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <20240123221011.GA16581@pendragon.ideasonboard.com>
 <TYCPR01MB1126908A3DCEE35723E102993867B2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <cae77ff909448cd7eb88716696d24091.sboyd@kernel.org>
 <TYCPR01MB11269FA0CB3D50358412DA925867B2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TYCPR01MB11269FA0CB3D50358412DA925867B2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TYWPR01MB9294:EE_
x-ms-office365-filtering-correlation-id: 774729ec-9968-4fef-c9b7-08dc1e50ba16
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 pFovGVJ34ZqrF2tguHYXP1e0kovdGSx/BU94mdFtfOwnOlxIjCgwsEPVS2jKdC5ZJ0+8+3ipL+UGOhD5zFt3AJjtpEvpV5MLGRkfX54VmRBLgc0onTnOmhjYWeGF8AEmu3MnvH9WHzWSO4rSQ1jvDyfkHZU+PL6J2T0GqklwE1HcPZgJDJkU3W0N7PZ8wmy8YTUMN/ipEiov9boKxjDH2UmMZe5uzRPLVRrg8wegyVpmt+MrXtSmv4DqlQV+6Chuyg/rk5gQJ3NC0b1ZBeIHoRDhXRr22ILVpxUPp37A3z9ZlIEkU9Am6WE9iikKPx0MkLLPgCyd9PYYhkzntalD+AZNISnAoSfHdDIPx9u44a2GqVUa2fxQ7LRaV1srQFE3Q234adCeN0BP9MoI3f3+XBsxnyxPnJAZN8cUsqIFXI6rjKetbBcrQt72a57kkCpd4640XfOpwiD9GY2D7xiUBYiOloTOvzRWWhkdejQDLiTlJV/YKdr4TOb4DZZrNZg/t3guTHVkkJF+ZwQt6p0WS9FtqiJxWfeHG/S8WN9i3QIRO+sT469eaf4gDfMqA0DeoAa4werjawZuD9TDoXyTlJDEDefUmndlqZDt8jNPjNyLAZK2+EBD7hZ7Bje3Xu2j
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(396003)(366004)(376002)(39860400002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(55016003)(26005)(6506007)(86362001)(71200400001)(9686003)(53546011)(7696005)(122000001)(38100700002)(33656002)(38070700009)(41300700001)(52536014)(83380400001)(110136005)(478600001)(7416002)(8936002)(2906002)(66446008)(8676002)(66946007)(316002)(5660300002)(76116006)(66556008)(64756008)(4326008)(66476007)(54906003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dkFRNFRvZXRRS3FOQ1VZdDMwbWhlL2drQk4vbzk0N1VkK0R4SGtBbE01T0RS?=
 =?utf-8?B?RkdkUTlOWWY0aFkwL3JtWEZuL2h3U0ZnYXpSeklGTE5RNHBJUXAvVDZrQ1JG?=
 =?utf-8?B?eHVIN3IxNmpZZ2F4NTc4ZnNqNkdyT1NPcXhCaE1BZjdJMHpVdzlvVVBOMTAw?=
 =?utf-8?B?V2NKSWMxc2p2cWN3cmNZVVduNDJRUnZ1TXA5WExqS092emlybVVRL2hacUNJ?=
 =?utf-8?B?WlU4MHJnNjF1Q09ndlI0d1BtY2QrVFFCYUdtL3lHQm43SGxvdE0xNmV1TDNa?=
 =?utf-8?B?dngyVUJ4ZkNjR0F0OXNCcU1JUnJsZjk4bDdMVUF1QWZrOGYrZklBZ3VZYWdF?=
 =?utf-8?B?ZmtOdVJ5enFUczhLZXo0NmplTGcvZnE2L3d6aS9HWXpQWGJmbjhJdzBFdWpB?=
 =?utf-8?B?cWVwZjdpdVRFM3dkTTJUMHBjM2FmR3JsdmdPZ1MvRDhURVlhZEV4VkxjQWNn?=
 =?utf-8?B?SW9KT2tOMkF2dlVpVkRmTzhET3RVODFHV05vZitndEV5RDB1bUZLWTRZRldR?=
 =?utf-8?B?WVlCUmNqWGlxREIxZmtoTGtrVUJYQWZWT1VaUDJHRklJL2V0U3k4dzc2c0RH?=
 =?utf-8?B?WEcwWVlxTEVuN3RyY0c3blM4ME9DWVZMMlRSQkQ2ZWtXUGxGMzhpV0h3QW1R?=
 =?utf-8?B?aUp0Nmo1K2dEdzFkdUIzZ0NJNU1pdzB3cGtjOC9HZjNSbU8rRmx4QTFWaHpN?=
 =?utf-8?B?TDlXS1Y1cElHb0krcHpKS3JaUm42aDQxcWZrSEtId2djQ2tHQVl1QTJTSmdW?=
 =?utf-8?B?elpEM01YNitsQUdGSFdzdWdDZ2docHpOeU5BTkF5Z3Nwa05IQVFheHAzR2lG?=
 =?utf-8?B?UmNIUzMwQ1AzT2svS0dHajFoRmZQK1Q2SE9rTHJqK3E2N0xIdUltcHQ1SWh0?=
 =?utf-8?B?YStjVmhSQmlDS1F1UUU2dS85VHhHOVM5UWN6bnRNK2VMVmRscGpxQTlpQXBM?=
 =?utf-8?B?ekxXWWdzK1FNOGIrVlpKQUUwUElSdDFLU2JGVm93UXl2WXV0OXowaUZxSmFo?=
 =?utf-8?B?bCtRWWt6K2l2NmhNZ0dZVnVkeUdTdEk2Nk9tM2ZqQTlNT2tBWWt4a2hKWjM3?=
 =?utf-8?B?MWVBV2ROU1RSMDgvdjZCbERDY0VZc2l5Y2RVWmNiaFk3djg3TkFQbGh5QWxM?=
 =?utf-8?B?S2J1RUVtekNGcDJnb2FUWnlCR0JTMkdyc25qREJvZGhxQUVkcDNRY0k2OXZx?=
 =?utf-8?B?MjdmbncrU3ZMcy9tR29IbEE1THBBUHF5VkhiNmF5am5KUUsxd1pmZ205Zk80?=
 =?utf-8?B?aXZySlNOTXgydUtYY2xFVHMreFdUS2drV0NIYk9kQlVGam9nbVYzdFc5Q1Qx?=
 =?utf-8?B?bWUrL3hzbVgwSGpxcklOTWVma051WjduMWpWYUsvRFQ2MFpaQzZkM1RGek1l?=
 =?utf-8?B?VmFjSytQV2paSGpGL3FVZGhBS1VyQVZtSnMwdTVDVmJ4RnNtWHdCdzlxTlMz?=
 =?utf-8?B?OXk3SGIwNW1TdVRhZWtsQ3RjSW5pYjVRYmJIK2VENE9tUHVFNjJQd2k4SVZl?=
 =?utf-8?B?NnRha2Q5VDJLQ2NVdUVXdHJ0UDIxSWFwRzJVTmtmRG5vVld4UXYzbkoreTgx?=
 =?utf-8?B?UjZhdG5PSFpka1VoUG5YU2VqbmhiSk9JdlpSdHlaYXEvNzkwZXAzY1NYbTJ1?=
 =?utf-8?B?ZGV4QjBMTCszcnY0OWp3SnY3N1lrZUJRTTlhUjJzNVhLMU45SDhYN01UeStu?=
 =?utf-8?B?VEk5d08rWXZXWk0wVzJsVy9iTUt3bmlZTHlYTU5la083OWN6L3JOcTZRRWhU?=
 =?utf-8?B?bnF0cmJNZkliU2l5TndTRUhjakk5Qis5RDgramlOdnRWMzRwSUxhSFBYUStK?=
 =?utf-8?B?RE9vMjJsT01qT1VUQ1BuTzZMSjczTUc1NmNCYzdNYzlvRWhlUnl1eDB5eHNM?=
 =?utf-8?B?VWZ6YzQwRG1FdDVuUko3MElNaGVRZHFEUmtTZUxCanhrTEx0UG0wUkZaV1h4?=
 =?utf-8?B?YVdXMFAvdzEzMXQ3TnA3dk9ZQjNmL0w4UzVwd3ZPYmtPUUpzZVRDNllNWmFw?=
 =?utf-8?B?S0x6UzVNb1FISDdxUEtsRkVaZzVpTWF4bDBFVitENCs5Q293OHJSWGhhbXZE?=
 =?utf-8?B?S3RFcFJIL0NnRWZlUWJNRkJXcysvc241ZTIyVkZiNzB1alAyUzFoTnZCemVu?=
 =?utf-8?B?VmJaVllESHVrd2pLbm1wdlNrMENTWnhHMXFsSkdKWlJRQk9lbkdONjluTnow?=
 =?utf-8?B?cmc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 774729ec-9968-4fef-c9b7-08dc1e50ba16
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2024 09:25:24.7655
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UZ0Ogf2FfgL/kWlhH23s5/j5WJ4HZqGowHFEiGQ/rhKLiGLb4SjCSI7WsPpHir+F7pgKeNo+hfzsm9rFr5b1H6nOYBnuHQLKdp+Ow3pJKX0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9294

DQpIaSBMYXVyZW50IGFuZCBTYWthcmksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
Cj4gRnJvbTogQmlqdSBEYXMNCj4gU2VudDogV2VkbmVzZGF5LCBKYW51YXJ5IDI0LCAyMDI0IDk6
NTAgUE0NCj4gU3ViamVjdDogUkU6IFtQQVRDSCA0LzRdIG1lZGlhOiBwbGF0Zm9ybTogcnpnMmwt
Y3J1OiByemcybC12aWRlbzoNCj4gUmVzdHJ1Y3R1cmUgY2xrIGhhbmRsaW5nDQo+IA0KPiA+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogU3RlcGhlbiBCb3lkIDxzYm95ZEBr
ZXJuZWwub3JnPg0KPiA+IFNlbnQ6IFdlZG5lc2RheSwgSmFudWFyeSAyNCwgMjAyNCA4OjQ5IFBN
DQo+ID4gU3ViamVjdDogUkU6IFtQQVRDSCA0LzRdIG1lZGlhOiBwbGF0Zm9ybTogcnpnMmwtY3J1
OiByemcybC12aWRlbzoNCj4gPiBSZXN0cnVjdHVyZSBjbGsgaGFuZGxpbmcNCj4gPg0KPiA+IFF1
b3RpbmcgQmlqdSBEYXMgKDIwMjQtMDEtMjQgMDY6MDE6MzApDQo+ID4gPiA+ID4gPiA+ID4gQ1NJ
Mm5NQ1QwX1ZETE4oY3NpMi0+bGFuZXMpKTsgQEANCj4gPiA+ID4gPiA+ID4gPiAtMzg2LDExICsz
ODksNDAgQEAgc3RhdGljIHZvaWQNCj4gPiA+ID4gPiA+ID4gPiByemcybF9jc2kyX21pcGlfbGlu
a19lbmFibGUoc3RydWN0DQo+ID4gPiA+ID4gPiByemcybF9jc2kyICpjc2kyKQ0KPiA+ID4gPiA+
ID4gPiA+ICAgICAgIHJ6ZzJsX2NzaTJfd3JpdGUoY3NpMiwgQ1NJMm5EVEVMLCAweGY3NzhmZjBm
KTsNCj4gPiA+ID4gPiA+ID4gPiAgICAgICByemcybF9jc2kyX3dyaXRlKGNzaTIsIENTSTJuRFRF
SCwgMHgwMGZmZmYxZik7DQo+ID4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gPiArICAgICBj
bGtfZGlzYWJsZV91bnByZXBhcmUoY3NpMi0+dmNsayk7DQo+ID4gPiA+ID4gPiA+ID4gKyAgICAg
Zm9yIChjb3VudCA9IDA7IGNvdW50IDwgNTsgY291bnQrKykgew0KPiA+ID4gPiA+ID4gPiA+ICsg
ICAgICAgICAgICAgaWYgKCEoX19jbGtfaXNfZW5hYmxlZChjc2kyLT52Y2xrKSkpDQo+ID4NCj4g
PiBfX2Nsa19pc19lbmFibGVkKCkgaXMgYSBjbGsgcHJvdmlkZXIgQVBJLiBZb3Ugc2hvdWxkbid0
IGJlIHVzaW5nIGl0IGluDQo+ID4gY29uc3VtZXIgZHJpdmVycy4NCj4gDQo+IE9LLCBCYXNpY2Fs
bHkgYmVmb3JlIGVuYWJsaW5nIHRoZSBsaW5rIHJlY2VwdGlvbiwgdmNsayBtdXN0IGJlIGRpc2Fi
bGVkLg0KPiANCj4gQ3VycmVudGx5IHJ6ZzJsIGNsayBkcml2ZXIgaXMgdHVybmluZyBvZmYgdGhl
IGNsb2NrIGJ1dCBpdCBpcyBub3QgY2hlY2tpbmcNCj4gdGhlIHN0YXR1cyB0byBtYWtlIHN1cmUg
aXQgaXMgYWN0dWFsbHkgdHVybmVkIG9mZi4NCj4gDQo+IEkgZ3Vlc3MgY2hlY2tpbmcgdGhlIHN0
YXR1cyBpcyBub3QgbWFuZGF0b3J5IGZvciBjbG9jayBPRkYoZGlzYWJsZSkgZm9yDQo+IHBlcmZv
cm1hbmNlIHJlYXNvbnMuDQo+IA0KPiBTbyBzaGFsbCBJIGludHJvZHVjZSBjbGtfZGlzYWJsZV91
bnByZXBhcmVfc3luYygpIGFuZCAuZGlzYWJsZV9zeW5jKCkgZm9yDQo+IGRpc2FibGluZyBhbmQg
Y2hlY2tpbmcgdGhlIHN0YXR1cyB0byBtYWtlIHN1cmUgY2xvY2sgaXMgdHVybmVkIG9mZiBTbyB0
aGF0DQo+IEkgY2FuIGVuYWJsZSBsaW5rIHJlY2VwdGlvbiByZWxpYWJseT8/DQo+IA0KPiAuZGlz
YWJsZSgpLCBqdXN0IHR1cm4gb2ZmIHRoZSBjbG9jaywgYnV0IGl0IGRvZXNuJ3QgZ3VhcmFudGVl
IHRoYXQgaXQgaXMNCj4gYWN0dWFsbHkgdHVybmVkIG9mZi4NCj4gDQo+IHdoZXJlYXMgLmRpc2Fi
bGVfc3luYygpIGd1YXJhbnRlZXMgdGhhdCB0aGUgY2xrIGlzIGFjdHVhbGx5IHR1cm5lZCBvZmYu
DQo+IA0KPiA+DQo+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgIGJyZWFrOw0K
PiA+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgdXNsZWVwX3JhbmdlKDEwLCAyMCk7DQo+ID4g
PiA+ID4gPiA+ID4gKyAgICAgfQ0KPiA+ID4gPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiA+ID4gPiAr
ICAgICBpZiAoY291bnQgPT0gNSkgew0KPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgZGV2
X2Vycihjc2kyLT5kZXYsICJUaW1lb3V0LCBub3QgYWJsZSB0bw0KPiA+ID4gPiA+ID4gPiA+ICsg
dHVybiBPRkYNCj4gPiA+ID4gdmNsa1xuIik7DQo+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAg
ICByZXR1cm4gLUVUSU1FRE9VVDsNCj4gPiA+ID4gPiA+ID4gPiArICAgICB9DQo+ID4gPiA+ID4g
PiA+DQo+ID4gPiA+ID4gPiA+IEl0J2QgYmUgbmljZSB0byBoYXZlIGEgQ0NGIGZ1bmN0aW9uIHRv
IGRvIHRoaXMuIEVpdGhlciB3YXksDQo+ID4gPiA+ID4gPiA+IHlvdSBjYW4gdXNlIHJlYWRfcG9s
bF90aW1lb3V0KCkuDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gSSB3b3VsZCBoYXZlIHN3b3Ju
IHRoYXQgY2xrX2Rpc2FibGVfdW5wcmVwYXJlKCkgaXMNCj4gPiA+ID4gPiA+IHN5bmNocm9ub3Vz
LCBhbmQgd291bGQgaGF2ZSBzd29ybiBldmVuIHN0cm9uZ2VyIGZvcg0KPiBjbGtfcHJlcGFyZV9l
bmFibGUoKS4NCj4gPiA+ID4gPiA+IFdoYXQncyBnb2luZyBvbiBoZXJlLCBpcyB0aGVyZSByZWFs
bHkgYSBkZWxheSA/IEl0IHNvdW5kcyBsaWtlDQo+ID4gPiA+ID4gPiBhIGJ1ZyBpbiB0aGUNCj4g
PiA+ID4gY2xvY2sgZHJpdmVyLg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gQXQgdGhlIG1vbWVudCB3
ZSBhcmUgbm90IGNoZWNraW5nIGNsb2NrIHN0YXR1cyB3aGVuIHdlIHR1cm4gb2ZmDQo+ID4gPiA+
ID4gYSBjbG9jayBIb3dldmVyLCBmb3IgY2xvY2sgT04gd2UgYXJlIGNoZWNraW5nIHRoZSBzdGF0
dXMgd2hpbGUNCj4gPiA+ID4gPiB0dXJuaW5nIGl0DQo+ID4gPiA+IE9OLg0KPiA+ID4gPiA+IFdl
IG5lZWQgdG8gZml4IHRoZSBkcml2ZXIgZm9yIGNsa19kaXNhYmxlX3VucHJlcGFyZSgpLg0KPiA+
ID4gPg0KPiA+ID4gPiBEb2VzIHRoYXQgbWVhbiB0aGF0IHRoZSBjaGVjayBiZWxvdyBjbGtfcHJl
cGFyZV9lbmFibGUoKSBjb3VsZCBiZQ0KPiA+ID4gPiByZW1vdmVkIGFscmVhZHkgPw0KPiA+ID4N
Cj4gPiA+IFllcywgdGhhdCBpcyBjb3JyZWN0IEkgd2lsbCByZW1vdmUgaW4gdGhlIG5leHQgdmVy
c2lvbiBhcw0KPiA+ID4gY2xrX3ByZXBhcmVfZW5hYmxlKCkgaXMgc3luY2hyb25vdXMgYXMgaXQg
Y2hlY2tzIHRoZSBzdGF0dXMgdG8gbWFrZQ0KPiA+ID4gc3VyZQ0KPiA+IGl0IGlzIHR1cm5lZCBP
Ti4NCj4gPiA+DQo+ID4gPiA+DQo+ID4gPiA+IFJlZ2FyZGluZyBjbG9jayBkaXNhYmxlLCBpdCBp
c24ndCBjbGVhciBpZiB0aGUgQVBJIGd1YXJhbnRlZXMNCj4gPiA+ID4gc3luY2hyb25vdXMgY2Fs
bHMuIEknZCByZWNvbW1lbmQgYXNraW5nIHRoZSBjbG9jayBtYWludGFpbmVycy4gSWYNCj4gPiA+
ID4gaXQgZG9lc24ndCwgdGhlbiB0aGUgY2xvY2sgZHJpdmVyIGlzbid0IHdyb25nIChhbmQgbWF5
IGxlYWQgdG8NCj4gPiA+ID4gZmFzdGVyIG9wZXJhdGlvbiBpbiBtb3N0IGNhc2VzKSwgYnV0IEkg
dGhpbmsgc3luY2hyb25pemluZyB0aGUNCj4gPiA+ID4gY2xvY2sgZGlzYWJsZSBieSB3YWl0aW5n
IGZvciB0aGUgY2xvY2sgdG8gYmUgYWN0dWFsbHkgZGlzYWJsZWQNCj4gPiA+ID4gc2hvdWxkIGJl
DQo+ID4gaW1wbGVtZW50ZWQgYXMgYSBoZWxwZXIgaW4gQ0NGLg0KPiA+ID4NCj4gPiA+ICtjbGsu
DQo+ID4gPg0KPiA+ID4gSGkgU3RlcGhlbiBhbmQgYWxsLA0KPiA+ID4NCj4gPiA+IENhbiB5b3Ug
cGxlYXNlIHNoZWQgc29tZSBsaWdodCBvbiB0aGlzPw0KPiA+ID4NCj4gPg0KPiA+IGNsa19kaXNh
YmxlKCkgaXMgcmVmZXJlbmNlIGNvdW50ZWQuIFRoZSBjYWxsIHRvIGNsa19kaXNhYmxlKCkgbWF5
IGRvDQo+ID4gbm90aGluZyBiZXNpZGVzIGRlY3JlbWVudCBhIGNvdW50IGFuZCByZXR1cm4uIFBl
ciB0aGUgZG9jdW1lbnRhdGlvbiBpbg0KPiA+IGNsay5oIGl0IG1lYW5zIHRoYXQgdGhlIGNvbnN1
bWVyIGlzIG5vIGxvbmdlciB1c2luZyB0aGUgY2xrLiBUaGUgY2xrDQo+ID4gY291bGQgYmUgdHVy
bmVkIG9mZiBsYXRlciwgb3Igbm90IGF0IGFsbC4NCj4gPg0KPiA+IEl0IHNlZW1zIGxpa2UgdGhl
IGNsayBkcml2ZXIgaGFzIGEgYnVnLiBNYWtlIHRoZSBjbGsgZHJpdmVyDQo+ID4gc3luY2hyb25p
emUgdGhlIGRpc2FibGUgd2l0aCBlbmFibGUgcGxlYXNlLg0KPiANCj4gWW91IG1lYW4gbGlrZSBl
bmFibGUoKSwgd2Ugc2hvdWxkIGNoZWNrIHRoZSBjbG9jayBzdGF0dXMgZm9yIGRpc2FibGUoKSB0
bw0KPiBtYWtlIHN1cmUgaXQgaXMgdHVybmVkIG9mZj8/DQo+IA0KPiBPcg0KPiANCj4gSW50cm9k
dWNlIGEgbmV3IEFQSSAuZGlzYWJsZV9zeW5jKCkgZm9yIHRoaXMgc3BlY2lhbCBzeW5jaHJvbml6
YXRpb24NCj4gb3BlcmF0aW9uPz8NCg0KDQpJIGhhdmUgdGVzdGVkIFJaL0cye0wsTEMsVUx9IGFu
ZCBSWi9WMkwgU01BUkMgRVZLIHBsYXRmb3JtcyB3aXRoDQpqdXN0IGNsa19kaXNhYmxlX3VucHJl
cGFyZSgpIGFuZCB0aGUgY2xrX3ByZXBhcmVfZW5hYmxlKCkgdGhlIGNhcHR1cmUgd29ya3MgZmlu
ZQ0Kb24gdGhlc2UgcGxhdGZvcm1zLg0KDQpTbywgSSB3aWxsIHNlbmQgVjIgd2l0aCB0aGVzZSBj
aGFuZ2VzLiBQbGVhc2UgbGV0IG1lIGtub3cgaWYgeW91IHRoaW5rIG90aGVyd2lzZS4NCg0KQWxz
bywgSSBhbSBwbGFubmluZyB0byBzZW5kIGEgUkZDIGZvciB0aGUgQVBJIGNsa19kaXNhYmxlX3Vu
cHJlcGFyZV9zeW5jKCkNCmluIENDRiBmb3Igc2VwYXJhdGUgZGlzY3Vzc2lvbiB3aGljaCBndWFy
YW50ZWVzIHN5bmNocm9ub3VzIG9wZXJhdGlvbg0KZm9yIENsb2NrIE9GRi4NCg0KQ2hlZXJzLA0K
QmlqdQ0KDQo=

