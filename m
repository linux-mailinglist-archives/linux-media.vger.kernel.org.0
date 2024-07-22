Return-Path: <linux-media+bounces-15211-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB05E938783
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 04:17:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 19E3A1C20C33
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 02:17:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F84E134B2;
	Mon, 22 Jul 2024 02:17:44 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2120.outbound.protection.partner.outlook.cn [139.219.146.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE14CA64;
	Mon, 22 Jul 2024 02:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721614663; cv=fail; b=JL1DAXJGgvKT8jcFUkfalRoLL2bPry7RKnZ1BFucuIlIFVuMR7yWRkHRwqAmVrDQbAzD5AWK2kqD8O/Tdrg9IZiYcRQArqwq0Qz4bOR3cNWQDVyX3LtqCoJeST4r+nu3msvtT450M4pgtbtYA9iVDPEv6wuq0grtWepyvBT5ejM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721614663; c=relaxed/simple;
	bh=iu8JE7zpbHQVCtRBDI5fc4tTvEy3MYgWYGHgETOT2AY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RnXIRMHljKH953vF0YFnuk2MyvAjD1qxAJju0eC9o8hlFHkjXSKyPobUjrsdZyWoHvJKqAAp9ofI4bEg8ajVfpN+G8NTrEpL8PRmj8hQ588PRj5o7N0PKkmTji1iPOHljXcmevkkbyrNByLemnYc1T2A86jdSHB0fEzJXgOj/Sg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MV7MQVnvDPuiioTMQnmsFbtlN+1MrPA+WU18zYZsRLfimKHca55h39ceT+oHRGqLx2yhLk/ZPXBbLsUjj4hGpf6uDSb1pPsu9dKtqOIRFEwvRf6HhVCuwmWtYZhUC+w2BmgjUxeoFVSFpfUFCc2xxkTlZZV1frhkalRNi+QjjEgYkkwEPdnIHpATF28d9ChZrWmARswkgkDPGKLsgRtyzi3NZcZe59m0+gBpeiLOasxO/fcAdZDwcvxtKwxX1sa60fOVsgDgiMe+BYO3Caez+bLgRcqLCEFw/15TOjZlE8g6Xba/58TguN+EYZIUy7n+kXeGs9qm3HKTrGSqCv+1rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iu8JE7zpbHQVCtRBDI5fc4tTvEy3MYgWYGHgETOT2AY=;
 b=mXyrotK8J1kMhVcb3Xt+4Rx44Ku+BWX66kzh2I42wWsTh+EdDDaRcPtGhTReaWARjtgD1dJg2lKCHKy+WzyfK9Fgrc/dDkbK+csjV56xWtsePsSNGbFGILUjRCmMDHlyxhQi4ZhOcj9SbRRK8BP1VPfluFL97ujLIKYRt3UHehSpn6NTB+gqG843O0g8l7R8543xCHujUlcew0Yqi+dE+6JFw9OdzKJKZIHA2LFFesdFzbnxXBDr2Zn8YjVDuOL8koGkTdQowQa1gU5hwhjvCE53+t6LRm4D4jAp8XfupF424S+LrNk56rZVIDtGwz1LYihR4kwbNzKd5SQIRkvEUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9) by ZQ0PR01MB1096.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:c::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.38; Mon, 22 Jul
 2024 02:17:29 +0000
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 ([fe80::64c5:50d8:4f2c:59aa]) by
 ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn ([fe80::64c5:50d8:4f2c:59aa%6])
 with mapi id 15.20.7762.032; Mon, 22 Jul 2024 02:17:29 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Maxime Ripard <mripard@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>
CC: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, Jack Zhu <jack.zhu@starfivetech.com>,
	Keith Zhao <keith.zhao@starfivetech.com>, Jayshri Pawar <jpawar@cadence.com>,
	Jai Luthra <j-luthra@ti.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-staging@lists.linux.dev"
	<linux-staging@lists.linux.dev>
Subject:
 =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggdjIgMi81XSBtZWRpYTogY2FkZW5jZTogY3NpMnJ4?=
 =?utf-8?Q?:_Add_system_PM_support?=
Thread-Topic: [PATCH v2 2/5] media: cadence: csi2rx: Add system PM support
Thread-Index: AQHa2MKXFrG9Yf+6k0Wh6db3BATHKrH921SAgAQq+fA=
Date: Mon, 22 Jul 2024 02:17:29 +0000
Message-ID:
 <ZQ0PR01MB13024828274542F14E89AD58F2A82@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
References: <20240718032834.53876-1-changhuang.liang@starfivetech.com>
 <20240718032834.53876-3-changhuang.liang@starfivetech.com>
 <26af0977-8e38-47d0-a521-c5b1e505d564@ideasonboard.com>
In-Reply-To: <26af0977-8e38-47d0-a521-c5b1e505d564@ideasonboard.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ0PR01MB1302:EE_|ZQ0PR01MB1096:EE_
x-ms-office365-filtering-correlation-id: 7dab8780-b57b-4cd7-5e7e-08dca9f46ff0
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|366016|41320700013|38070700018;
x-microsoft-antispam-message-info:
 NfMFEnd7xdPRrh1ZkB8QnNvNhQGlX/bVsoI8yCkP4dcTVQn96SM9dR7dRBBx3fJFEq/ChJ3jdNWAxq/nkAI5cJiqieRszWppMqRk8knNeozUmO0Vm0ALgLTqWIeLCsix0EH3r1zIYO1LKTjgl2yRgG3tKX6TDNSJyTqtbWILbwZfhxRITgoWXVJgP2kmRc5Tr+X3nYq+nqztb0uzTVtOVCVI0RsqkSQbdEv3cmKOXK62HPOf/H4LqyfzNMfvExeRJV8SeHLLS93lT6qb1+PiNeg2ht6aTCBNi5a5csTB5Z5arDb0evXwgqMwFP5vQJyQiFXLDsExzfPfyzAYXwC5wxEcVFd9ZVi7rdnivn2vAhruB8yx+ulTJZh8JrGOghDMuk91pzocj0dwyWOuMYTLehfG6GqWyepx9fnbzXuAhv6FZ1EesAutZePeVW9MPoFin0qX8GMl3t7zA5E7reTVO9FHYD85fTfNcBSO73oaTGuL8MEQ4pnzFb6RDtHE0m7RDwwKZzl7fCpa14MEXz9uFJGx+zPusDfDWTIZFLEXZeLRcIPB0ZSzNpRCzjm89i+vWzmn+qz2ialnHgsbWiwt57mIE8AY7fx8k62e5vPS7am70iqUaGUSS2ptVp1VEHbe
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(41320700013)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TGNqcWxUYWxpR0Z2SDBRamRoRGZCSU9LeUtrQTlnVkdVeXEzclR6R25yajRy?=
 =?utf-8?B?Zi9IZ2t6SjQramJRYURyR0FsRmtkdEx2VmljOVdFWFFUdDBtTi9TWE0yV0lv?=
 =?utf-8?B?UzlSUERjOXcyN3FDZlF1ZS9iRFliVkNSVkdCYTdyd3ZkTmdPbEg3TVU2c0p2?=
 =?utf-8?B?c2YxV2FnYTFMcVVSc3hQZzNJTVhia0J4Q2lCbURXNWJmd3lBZzVDZ1E0RC9v?=
 =?utf-8?B?TmlWTWMvcHk5QWdCZnlUTG4zYnUrTGsyNENCTjhuUk5aZzh6aE9tWG0wYzRh?=
 =?utf-8?B?a09tallDYnB5MndHZ2RweGxVTUM0QUZRRkRCS0xoc1ZsQTFGWkNZZ0F0Z1hk?=
 =?utf-8?B?bGM0Uk5qQk9kaXJOZE1hRGVWV2g2UnZHMEIzdUJCOTltWjV2NWZFMk1ZNFow?=
 =?utf-8?B?cGV2RW9yZEtFblVFams3TjBrSG5RUk5NdEc0ZWF4TVlKR1hOMzVtVDJCTDBV?=
 =?utf-8?B?YUQ2aVY3aFZSVGVXWFVERXlhWFI3L3ZCWlFmcnhWSVVDcC9jZndLbXYxdTV6?=
 =?utf-8?B?MEVWdUwwcHdaZEluY0hDLzh2S0p3WlJ4TnpRZWNWdkJ4VHRINWVQYnI2S1k2?=
 =?utf-8?B?aWhWcGNkSFlMRHlaK1dCN2dPZ0Q3UzdDa09FWE5SK2c0REN1Q3paU2s4ZitE?=
 =?utf-8?B?eTRCTXhCU2ltWE8zMmUxNXdsdko3cVhZWFNqMDlNSkE5eCtwWjcwcmxjY1lN?=
 =?utf-8?B?UnVDU3kzdmVFT1hsb3g2Ykt5ekp4YTRnV3hJOEhUalV2UFE0Tk1yUS83UVVu?=
 =?utf-8?B?cWNWeWw5Q3dYMTlnOUNyK0hpL2ZJTWdObTFpY1gvL0t2UmF6VWdhYWFjd2FH?=
 =?utf-8?B?amtQWDJHSjJLdHhUd3JkajFYUXFxd01VQUhFLzE1MXpIYTdkWDZVL29nUjVK?=
 =?utf-8?B?MTJGOUR2UzIvSUUzUDRqQS91S1puZzRPOFJ4ZURqd25VTTVBblFvZjVWTG9k?=
 =?utf-8?B?Mm1xVlpmQVdDVE9XOU0rTXRLdUJBUDJucEJWb2xjMXpNSkhpUktXOUwvZHB6?=
 =?utf-8?B?d1VHTHdZMW5LYWlTdlNjZ05wZDNta1oxS1paMnRLUzRNWFlwc2dRbCtESjM5?=
 =?utf-8?B?SGYyY2dyTlBSdmFQK3cyWnNJSVNOd1BiY1ZaZkxINjhoVlFOZzlhdjh2SFNG?=
 =?utf-8?B?UHc0MHF0bDhIN2pvYmI1TE5tRTlYb3doK2JCWVd1VGNDbWhxRkZlOTVBZDRh?=
 =?utf-8?B?L0FuVUFwVzB6VWR2ZjVRWEgxWVFUUTVFM2VJUmQvUU80M1dJNyt0ZC8yZ2t3?=
 =?utf-8?B?Z1lqYWhuMEtPWWVvbzk5L0dJemJmWG13Yll6bkhUUWgxdEdmWkRraFFOcWhv?=
 =?utf-8?B?dHJxVlNyaFZsYzRlSXpBQkJtYUdRQlpjLzU4TVZ0c3c4d3RDdUdxTXRFZFQw?=
 =?utf-8?B?bEVkWHdXbDloVjFXODVwd05qM0piSHJIVlpaZFVJVHI1T0E2T3dBTDFXNk5B?=
 =?utf-8?B?SEJhQkgwWVVYN3AwVVdSM1AwREpoWmZLdTZhdXMzZ0pFaVVYNVFwWmJnNmp0?=
 =?utf-8?B?clRJbGpxNVdCS2tPM3g5UytyVVNhci8vZnNxMHZCSGc1bytxM0NzQnJ4ZFk2?=
 =?utf-8?B?QUFsMzlDWXpVNldVNXpxSjlxU3Y4Qm9DcHN5a2Q0bnpZRFROOTc4cVlZUkhq?=
 =?utf-8?B?NXFaRU5xR0lZM3ppR21WT1BPcHdaOFBETFY1b1VxT0tlU1pBZEhCcGJrUi9B?=
 =?utf-8?B?NEtRL2hvNzRuNDVtTHJNMy83dGhXSjEvSDhxRGszcWNpSWhvSXRlbDBOYk9V?=
 =?utf-8?B?OGJHQ3daT0pxLzZKMUNvWnFPYkFaenU3Ritid2k0MlMwc015Y2NqVFo5T3J0?=
 =?utf-8?B?MGJnNmgveENLVDJ1OGRXcUZ2cXV3ZGRYcWh3Y1ZiMjBCa1EybGdIN2JmbXNX?=
 =?utf-8?B?RUg3Qm8vTnVBWWxEeGZQNjdySHlvZCtFUDNjNmxrUUM1cnoxNHI3TjZrWmdk?=
 =?utf-8?B?VFZYV2hxT1FqWHlIYjBSRTFHdGtqbE5Wd3N2anZBRFV4NEJiN1ZCbzc0ODRi?=
 =?utf-8?B?ZFRiM0ptSGpzeWVYYWh5bThGK21kMGpqL2FnaDBvUDVGOFFlV3FaWDU0c0d0?=
 =?utf-8?B?WHBrTy8rajR4djVDd3Z5anpqMDdpUEExb3d2MnphMVRMdExOdUtKSXAzVTVX?=
 =?utf-8?B?VzM0M24vdHExOVRucjg3eXpvTThhYmM2Z2V3clFFMDgydTJkbUtMejJLYll6?=
 =?utf-8?B?NkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dab8780-b57b-4cd7-5e7e-08dca9f46ff0
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2024 02:17:29.4722
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UdPH1Utd5X2Ux5dgz+DkTdx7b3YQ21HSCg9/BPCVcBq4WJnupK8OCdnp7eoYeCAxte0LHEi2jZrF/VbK4ipw2GKNv2dIsJViUfBs7fXwKOdMI7iGCR89SbL2DvgRp4hk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1096

SGksIFRvbWkNCg0KPiBIaSwNCj4gDQo+IE9uIDE4LzA3LzIwMjQgMDY6MjgsIENoYW5naHVhbmcg
TGlhbmcgd3JvdGU6DQo+ID4gQWRkIHN5c3RlbSBQTSBzdXBwb3J0IG1ha2UgaXQgc3RvcHBpbmcg
c3RyZWFtaW5nIGF0IHN5c3RlbSBzdXNwZW5kDQo+ID4gdGltZSwgYW5kIHJlc3RhcnRpbmcgc3Ry
ZWFtaW5nIGF0IHN5c3RlbSByZXN1bWUgdGltZS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IENo
YW5naHVhbmcgTGlhbmcgPGNoYW5naHVhbmcubGlhbmdAc3RhcmZpdmV0ZWNoLmNvbT4NCj4gPiAt
LS0NCj4gPiAgIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vY2FkZW5jZS9jZG5zLWNzaTJyeC5jIHwg
MzINCj4gKysrKysrKysrKysrKysrKysrKysNCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAzMiBpbnNl
cnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9j
YWRlbmNlL2NkbnMtY3NpMnJ4LmMNCj4gPiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vY2FkZW5j
ZS9jZG5zLWNzaTJyeC5jDQo+ID4gaW5kZXggOTgxODE5YWRiYjNhLi44MWU5MGIzMWU5ZjggMTAw
NjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9jYWRlbmNlL2NkbnMtY3NpMnJ4
LmMNCj4gPiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2NhZGVuY2UvY2Rucy1jc2kycngu
Yw0KPiA+IEBAIC03NzYsOCArNzc2LDQwIEBAIHN0YXRpYyBpbnQgY3NpMnJ4X3J1bnRpbWVfcmVz
dW1lKHN0cnVjdCBkZXZpY2UNCj4gKmRldikNCj4gPiAgIAlyZXR1cm4gcmV0Ow0KPiA+ICAgfQ0K
PiA+DQo+ID4gK3N0YXRpYyBpbnQgX19tYXliZV91bnVzZWQgY3NpMnJ4X3N1c3BlbmQoc3RydWN0
IGRldmljZSAqZGV2KSB7DQo+ID4gKwlzdHJ1Y3QgY3NpMnJ4X3ByaXYgKmNzaTJyeCA9IGRldl9n
ZXRfZHJ2ZGF0YShkZXYpOw0KPiA+ICsNCj4gPiArCW11dGV4X2xvY2soJmNzaTJyeC0+bG9jayk7
DQo+ID4gKwlpZiAoY3NpMnJ4LT5jb3VudCkNCj4gPiArCQljc2kycnhfc3RvcChjc2kycngpOw0K
PiA+ICsJbXV0ZXhfdW5sb2NrKCZjc2kycngtPmxvY2spOw0KPiA+ICsNCj4gPiArCXBtX3J1bnRp
bWVfZm9yY2Vfc3VzcGVuZChkZXYpOw0KPiA+ICsNCj4gPiArCXJldHVybiAwOw0KPiA+ICt9DQo+
ID4gKw0KPiA+ICtzdGF0aWMgaW50IF9fbWF5YmVfdW51c2VkIGNzaTJyeF9yZXN1bWUoc3RydWN0
IGRldmljZSAqZGV2KSB7DQo+ID4gKwlzdHJ1Y3QgY3NpMnJ4X3ByaXYgKmNzaTJyeCA9IGRldl9n
ZXRfZHJ2ZGF0YShkZXYpOw0KPiA+ICsJaW50IHJldDsNCj4gPiArDQo+ID4gKwlyZXQgPSBwbV9y
dW50aW1lX2ZvcmNlX3Jlc3VtZShkZXYpOw0KPiA+ICsJaWYgKHJldCA8IDApDQo+ID4gKwkJcmV0
dXJuIHJldDsNCj4gPiArDQo+ID4gKwltdXRleF9sb2NrKCZjc2kycngtPmxvY2spOw0KPiA+ICsJ
aWYgKGNzaTJyeC0+Y291bnQpDQo+ID4gKwkJY3NpMnJ4X3N0YXJ0KGNzaTJyeCk7DQo+ID4gKwlt
dXRleF91bmxvY2soJmNzaTJyeC0+bG9jayk7DQo+ID4gKw0KPiA+ICsJcmV0dXJuIDA7DQo+ID4g
K30NCj4gPiArDQo+ID4gICBzdGF0aWMgY29uc3Qgc3RydWN0IGRldl9wbV9vcHMgY3NpMnJ4X3Bt
X29wcyA9IHsNCj4gPiAgIAlTRVRfUlVOVElNRV9QTV9PUFMoY3NpMnJ4X3J1bnRpbWVfc3VzcGVu
ZCwNCj4gY3NpMnJ4X3J1bnRpbWVfcmVzdW1lLA0KPiA+IE5VTEwpDQo+ID4gKwlTRVRfU1lTVEVN
X1NMRUVQX1BNX09QUyhjc2kycnhfc3VzcGVuZCwgY3NpMnJ4X3Jlc3VtZSkNCj4gPiAgIH07DQo+
ID4NCj4gPiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGNzaTJyeF9vZl90YWJs
ZVtdID0gew0KPiANCj4gSWYgSSdtIG5vdCBtaXN0YWtlbiwgdGhpcyBpcyBhIHN1YmRldiBkcml2
ZXIsIGFuZCBpcyBzb21ld2hlcmUgaW4gdGhlIG1pZGRsZSBvZg0KPiB0aGUgcGlwZWxpbmUuIEFm
YWl1LCBvbmx5IHRoZSBkcml2ZXIgdGhhdCBoYW5kbGVzIHRoZSB2NGwyIHZpZGVvIGRldmljZXMg
c2hvdWxkDQo+IGhhdmUgc3lzdGVtIHN1c3BlbmQgaG9va3MuIFRoZSBqb2Igb2YgdGhhdCBkcml2
ZXIgaXMgdGhlbiB0byBkaXNhYmxlIG9yIGVuYWJsZQ0KPiB0aGUgcGlwZWxpbmUgdXNpbmcgdjRs
MiBmdW5jdGlvbnMsIGFuZCBmb3IgdGhlIHJlc3Qgb2YgdGhlIHBpcGVsaW5lIHN5c3RlbQ0KPiBz
dXNwZW5kIGxvb2tzIGp1c3QgbGlrZSBhIG5vcm1hbCBwaXBlbGluZSBkaXNhYmxlLg0KPiANCg0K
SSBzZWUgdGhhdCB0aGUgaW14MjE5IGhhcyBhIGNvbW1pdDogDQoNCmNvbW1pdCBiODA3NGRiMDc0
MjliODQ1YjgwNTQxNmQyNjFiNTAyZjgxNGE4MGZlDQpBdXRob3I6IExhdXJlbnQgUGluY2hhcnQg
PGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4NCkRhdGU6ICAgVGh1IFNlcCAxNCAy
MToxNjo0OSAyMDIzICswMzAwDQoNCiAgICBtZWRpYTogaTJjOiBpbXgyMTk6IERyb3Agc3lzdGVt
IHN1c3BlbmQgYW5kIHJlc3VtZSBoYW5kbGVycw0KDQogICAgU3RvcHBpbmcgc3RyZWFtaW5nIG9u
IGEgY2FtZXJhIHBpcGVsaW5lIGF0IHN5c3RlbSBzdXNwZW5kIHRpbWUsIGFuZA0KICAgIHJlc3Rh
cnRpbmcgaXQgYXQgc3lzdGVtIHJlc3VtZSB0aW1lLCByZXF1aXJlcyBjb29yZGluYXRlZCBhY3Rp
b24gYmV0d2Vlbg0KICAgIHRoZSBicmlkZ2UgZHJpdmVyIGFuZCB0aGUgY2FtZXJhIHNlbnNvciBk
cml2ZXIuIFRoaXMgaXMgaGFuZGxlZCBieSB0aGUNCiAgICBicmlkZ2UgZHJpdmVyIGNhbGxpbmcg
dGhlIHNlbnNvcidzIC5zX3N0cmVhbSgpIGhhbmRsZXIgYXQgc3lzdGVtIHN1c3BlbmQNCiAgICBh
bmQgcmVzdW1lIHRpbWUuIFRoZXJlIGlzIHRodXMgbm8gbmVlZCBmb3IgdGhlIHNlbnNvciB0byBp
bmRlcGVuZGVudGx5DQogICAgaW1wbGVtZW50IHN5c3RlbSBzbGVlcCBQTSBvcGVyYXRpb25zLiBE
cm9wIHRoZW0uDQoNCiAgICBUaGUgc3RyZWFtaW5nIGZpZWxkIG9mIHRoZSBkcml2ZXIncyBwcml2
YXRlIHN0cnVjdHVyZSBpcyBub3cgdW51c2VkLA0KICAgIGRyb3AgaXQgYXMgd2VsbC4NCg0KICAg
IFNpZ25lZC1vZmYtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNv
bmJvYXJkLmNvbT4NCiAgICBSZXZpZXdlZC1ieTogRGF2ZSBTdGV2ZW5zb24gPGRhdmUuc3RldmVu
c29uQHJhc3BiZXJyeXBpLmNvbT4NCiAgICBTaWduZWQtb2ZmLWJ5OiBTYWthcmkgQWlsdXMgPHNh
a2FyaS5haWx1c0BsaW51eC5pbnRlbC5jb20+DQogICAgU2lnbmVkLW9mZi1ieTogSGFucyBWZXJr
dWlsIDxodmVya3VpbC1jaXNjb0B4czRhbGwubmw+DQoNCkltcGxlbWVudCB0aGUgc3lzdGVtIFBN
IG9mIHNlbnNvciB1c2luZyBicmlkZ2UuIFRoaXMgY3NpMnJ4IGlzIGFsc28gYSBicmlkZ2UuIA0K
U28gSSBhZGQgc3lzdGVtIFBNIGluIHRoaXMgZHJpdmVyLiANCg0KUmFnYXJkcywNCkNoYW5naHVh
bmcNCg0K

