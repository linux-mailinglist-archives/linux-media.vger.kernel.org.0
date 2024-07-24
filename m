Return-Path: <linux-media+bounces-15299-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BC093AAFC
	for <lists+linux-media@lfdr.de>; Wed, 24 Jul 2024 04:15:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E0972843D5
	for <lists+linux-media@lfdr.de>; Wed, 24 Jul 2024 02:15:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9285C17758;
	Wed, 24 Jul 2024 02:15:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2104.outbound.protection.partner.outlook.cn [139.219.146.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080BA134B1;
	Wed, 24 Jul 2024 02:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721787301; cv=fail; b=X/08H7dcTNLKLDsMylqSwY7ZSsjwVvAamqvT90xHqAHj6hSk8fcicwM33g0z+uNNZ4ZN7juvqKN8o8a291NajK0N/bE8oqj8A3djOgov1A6yHjePHiXIUSueJtqU/o6xPhD2StT1yu1DsZOtBonMn/eOtvkU/KPKMrMw66ymBkE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721787301; c=relaxed/simple;
	bh=Rl5G4iNOCdlflQct9F5vK/rrROao2MqKsT/Cy1Q93aI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MPWCuvJQZnnmhpmElQHzxTikKmW9mp2obCIl8YJ9smJUTjNLmR4PwxZGk+pITrPAyEJ1HLwdHST+2qz7Ihn+M8+Z1EUYdeQO4HugBpYMXg8DH/j/GIbgkb8pZDHNKIGf1Xc/EHT0uQu70rQ2jvjg9m+EUmx7omu2ekkGdrDTQys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lwKqaQm3ljRIzoWRxVX/TPWjmbyHp/sqswfUJXuuHOLDpdGXxqTug1RDv/iPlAB9dPnN0/a2dh7ARe9cbxpPtVaHBrbhy66lKGy5oxyLk8rvPMabD5FlPAE+P2dkmbe5vbV9IAuSCCI7sl02W5uGG2yIR/G0UNR0xWpq0UF6UEKaduetPepprkvnMylLcambnEmwpSvbfVV06VBaUBkdlfTbhkkjWTT9y7npKSr4TjRWTdNuY6U1CsrK2vb0TKa+m+2CggYWsyRV1pwCiWUXQVTBGrJLBE+GY+OquT7OBcMzIcAtbagKU/H5un60gv8OmBz5kAP9NwressZ56l+6ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rl5G4iNOCdlflQct9F5vK/rrROao2MqKsT/Cy1Q93aI=;
 b=m80T1FTPzCTWE1wjfwXVkV2wxruVTeDEpqOn+U5jDTkM/jBv/saApXMjQ0na3E+kpP7pdvXTSw9y/vEGKGrlXIx1cHjJ1pGXkIwLLxan09/Yt2jDKhVlV2pptkQOpBl+ZGWnDiu4/nJvKtNROl0nNKcTJRxKBbwKGoLV7YWxhCgz79xXBs9GbTbRARmb0aV2NEQHKXbhyqOtoUR+hJ3VPwZGb/XmOeN4Y8fP6sitmKsWIxhqeWqG9ZQ3bRHXEPBu5uOZkChqbWG8gRAW4xgrEkPxToF+OUhzkc+7Nuvn8ovivepAikSPCVpBaBXdXghuVlc95mHzcs71FRW5ecaRWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9) by ZQ0PR01MB1304.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:19::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.46; Wed, 24 Jul
 2024 01:40:20 +0000
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 ([fe80::64c5:50d8:4f2c:59aa]) by
 ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn ([fe80::64c5:50d8:4f2c:59aa%6])
 with mapi id 15.20.7762.032; Wed, 24 Jul 2024 01:40:20 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, Jean-Michel Hautbois
	<jeanmichel.hautbois@ideasonboard.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Tomi Valkeinen
	<tomi.valkeinen+renesas@ideasonboard.com>, Mingjia Zhang
	<mingjia.zhang@mediatek.com>, Jack Zhu <jack.zhu@starfivetech.com>, Keith
 Zhao <keith.zhao@starfivetech.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-staging@lists.linux.dev"
	<linux-staging@lists.linux.dev>
Subject:
 =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggdjUgMTQvMTRdIGFkbWluLWd1aWRlOiBtZWRpYTog?=
 =?utf-8?Q?Update_documents_for_StarFive_Camera_Subsystem?=
Thread-Topic: [PATCH v5 14/14] admin-guide: media: Update documents for
 StarFive Camera Subsystem
Thread-Index: AQHa0dtrMgPnMgyopEOp9OddO6OpMrIC6vWAgAJFzaA=
Date: Wed, 24 Jul 2024 01:40:19 +0000
Message-ID:
 <ZQ0PR01MB1302D6D18B2EE5B8BA4828E8F2AA2@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
References: <20240709083824.430473-1-changhuang.liang@starfivetech.com>
 <20240709083824.430473-15-changhuang.liang@starfivetech.com>
 <20240722145631.GM13497@pendragon.ideasonboard.com>
In-Reply-To: <20240722145631.GM13497@pendragon.ideasonboard.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ0PR01MB1302:EE_|ZQ0PR01MB1304:EE_
x-ms-office365-filtering-correlation-id: 82ff1c45-16a4-45a4-19b8-08dcab8193e5
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|41320700013|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 /DlHtqFePXBNhPE0+c0a8aHnzOPeUvIz3NMCrh2NMnvaUZS8vDkXZq1/Wuk3UG7Mdy7fmbMgSR0we1qbBu4xz9OqHZTq6/sq9RvdUbh8TbnvKrr7TtWwS3sA6OXt3JbKHj+7cc3nHesg1aofYzYREQxcZfQdXJR8Jai47tic8p4J0E8EBCsAQgYJUy79S2E46JDp8m/4olQdZYUkPbJV8CxhDQp6Nv49Qpbm83pLPHfCkp7jtDvPu0KQyDPA/6clH0IRPMU9j7vOL4qpuhKFkEA0Yvd4BzbzrORwonpwEt0uqMAsA9yaZ7UsVejR0ArpBK4xKvfyJ9ihDkTR5I7tdA9HT++9rHgZr00UTuQYNDGNlnnhdTTqyIVthwBSA7wbB6Vpl5qTGhbZhDPvpaaFQnpN3qR74JZE3T8oZKHVgnTIUTZG299erJd9NuZHNSJBEnTbFSQ7Z3Z4l8iNas7sst09TogLTqJgFc2ymAvCKKExGJtQgcZd6mk4LTw06LnLpRAgBFlx1AwtEWBXSz5LB0S8WSMcypfqtemfB92KDuvR7c7ZFwhq0rCQlwz/PMJDmGKui6/nHDYjRFrEwbIWR/cNSCvOZUtdg3nm4WFlMr2oKWV0bONDkORIb8AqzZ35
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(41320700013)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Rk4vcHJtQnc1Q0NtUnFxZVRrRHBQS2RFSGJxa3ZMaW9CenZ5aWJlUHduMlB4?=
 =?utf-8?B?MUZBOUtnRHVkbjJlM0xDY2UvT2lvaVhPVmgzcnloSTg1YlJFeWJ1NVFMVlVC?=
 =?utf-8?B?VG5Sc0h0d3Q3ODQ1SkNSaUtHeGMyaFVXbE5UV1hTbVRkTDgraHg2OVAzekEv?=
 =?utf-8?B?eEgvZDZ3REFIK0g3eDlPb1c2amI4M29OcUVXVTB5Z3doeTJqNHB0bHBWN0Ji?=
 =?utf-8?B?UWo4b2x6YzZjZGdtZFRTa1RmWFkvaXRtdXh2VU5YVkF2MzM1MVRHK3pieDBt?=
 =?utf-8?B?dC9KQmgwTHpqeW1ZRGVtQ3FwbGd6RFZGNGZGL08zLzJ5QjNTNDNQRVVGMEg5?=
 =?utf-8?B?empxVUdUbllBdTIybysvZjVVRXdCRlU0SnV2KzVSdlFUbjB0TG5TVDJ4dzJG?=
 =?utf-8?B?Z3FQcnErTjk2MUh1WkIvM3ljbzV5dWJkd1FqQUFrczVZV3BPTlhMM0F4bStu?=
 =?utf-8?B?RE5CMjY3MGI5V3pDTVlETWh3OUFHemJ0TktRNXVpallHb1lGU1B1bnBKTGZU?=
 =?utf-8?B?TS9QdlFPTVZlU3ExZlZDaXB5Nmd5UlNJejBGVFVNVEQ3NlZrV0FSeGlXUzEz?=
 =?utf-8?B?MUdleGRHMU5qRXFHa1YySTlVL052dm1ocVVjbHJIOEljSWpmenFOWjhpNXFp?=
 =?utf-8?B?Ny9PT1RTaGttdDJVd1VoemRrL1I0N0Fjc2hpNVJENUJzOHZaTENGSTNLK0FJ?=
 =?utf-8?B?ZGR6Vzk3NzljMWdmM1VoOWVvblgzMkN5ZEdrNVQ0VXAzNldWWVVYV0xydEgr?=
 =?utf-8?B?d1JPckwrYTVaeFVxNjVPZDNCek1uYlBxQzVyN1NVbmVaN0JhYnAwZXJ0bU9a?=
 =?utf-8?B?NU9TcU13NkxWTlEwWWkxMlAxVzJSdm9vc0dHVERBei9CalFMN0FjNldxRWM2?=
 =?utf-8?B?NzVMMk9HRXYyOEtHc09KaXYxWWJpdFNBSG13b3VPckFEUzlNWk9MUmlJS2VN?=
 =?utf-8?B?TGxRazdWZG03c1pEY29aUzZXU1ZZMWNKQ01pN3kwZ0laUjFoeUxRanFxNnpy?=
 =?utf-8?B?S3RJaVlFU3h6ODRldWkwaUxVeGlRSS9TTFpldkt4eUdaVC9ZVmtHZVZTNGVZ?=
 =?utf-8?B?RUVLeDNzM04yQ09sNUJ6cGxCSitNb3RQMU1qNDhCeE9KdC84SGh6anhpcnpJ?=
 =?utf-8?B?WUM5a3F5Q1dHQjc2YWJQY3I2S2Z5OFlPb212d0VsRGw0YnFlbS9yRU5zS0Rp?=
 =?utf-8?B?TnlLUWZHYkFqQ3dpa1pQWjdHZkp5WjY3REwycE5WZ2tHNlpqcVhDZVk5Q3lJ?=
 =?utf-8?B?VlU0L3ZkMGFpQmZoQ0xBL3lza0p2REdmbG5HMS83VGxpaStnNEJEVThnMkRu?=
 =?utf-8?B?bFM3VW5GUzBQTm5sa240SHdOUnF4dnRsKzdWNEpZOEczR0NSangrSGpVUzNK?=
 =?utf-8?B?VXlUWTRkVUdhbXBQVHZWc2xaZi9DUGorbW4zemZBZmJockg1dFJiMWt3VWZG?=
 =?utf-8?B?Mll1L3UydmJlbm9mYUNONFRZL0ViUVlwK2dGSldraFBrZ0laS0c1TXNpZWl5?=
 =?utf-8?B?QkhHTGV2alJjbmhXNFhzYkhNd3RzUHVINENib29kWFY5VjQzMXVYbzRITmpP?=
 =?utf-8?B?dWwreitRMEpYb2poMVhqL2lyYWVxQ1JXMEMvbkVPWTV6NzJzOFRCeEFNRGdi?=
 =?utf-8?B?MmVUaC9EdGVQRFU2a0Fydnd6Ti9QbFl0VXd5MldFSExXNTZ1WkpjMFJrY2xh?=
 =?utf-8?B?RVpOa0o1M1d1dFVFNHdtUG9WUkNIWlVaV0hCWkhZOUFQVGNxaUpibU9uM0w4?=
 =?utf-8?B?YnBveDkrUkI4YmxmZnFsN2xPWmJDY09IY1FJQ2orMGF0YWZaRnpQZUpTWnB3?=
 =?utf-8?B?eVJDdHBJMlRjUjNqMTlmdHN3OXZNZzFkZk1va1BKN0Z5dmlTd2hkY1RwS3NN?=
 =?utf-8?B?M2hQV2JXQjJMWWlpTFYyRGdXUDZVa0RockpWako2UW9GT1o5MFZSdDh6OEtF?=
 =?utf-8?B?WEFiby96TmlWVVRNZ3Z0aXZnQU9ySzlRVzNsNGRmWnhydzVjVUxROVlqd1lL?=
 =?utf-8?B?L1JiVDRISStRRmtLY3plODZtcmIwVTMrS1ZFRE5kQUNIcDZyMDIvYzh3d1ow?=
 =?utf-8?B?WWNxZGhXanJicWlGcFoyNnpTckIzbVNqRlJ6NlhNZE9NdFFuYS9GbWYxOHo1?=
 =?utf-8?B?cmt5Zkd0anFmVVZZZVJ1QThZeHc0SVFLb2lGNDFjS2IvTFVhL0VRL0pvSWtj?=
 =?utf-8?B?SlE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 82ff1c45-16a4-45a4-19b8-08dcab8193e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2024 01:40:20.0098
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sNv0NQBQZqekhtzMHC/Nd75eNNy1w+Lc2kQxGVO7hL7SppIflfEIPPPJPpissIsRyUwCIoXsmtlCu3v7Njkeg1ubvdsw6U1xn/zJjYrpd/LOV+GIcu5hChpnWSmIMYQA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1304

SGksIExhdXJlbnQNCg0KVGhhbmtzIGZvciB5b3VyIGNvbW1lbnRzLg0KDQo+IEhpIENoYW5naHVh
bmcsDQo+IA0KPiBUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4NCj4gDQo+IE9uIFR1ZSwgSnVsIDA5
LCAyMDI0IGF0IDAxOjM4OjI0QU0gLTA3MDAsIENoYW5naHVhbmcgTGlhbmcgd3JvdGU6DQo+ID4g
QWRkIElTUCBvdXRwdXQgcGFyYW1ldGVycyBhbmQgM0Egc3RhdGlzdGlzYyBjb2xsZWN0aW9uIGRh
dGEgdmlkZW8NCj4gPiBkZXZpY2UgZm9yIGRvY3VtZW50cy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYt
Ynk6IENoYW5naHVhbmcgTGlhbmcgPGNoYW5naHVhbmcubGlhbmdAc3RhcmZpdmV0ZWNoLmNvbT4N
Cj4gPiAtLS0NCj4gPiAgLi4uL2FkbWluLWd1aWRlL21lZGlhL3N0YXJmaXZlX2NhbXNzLnJzdCAg
ICAgIHwgMTEgKysrKysrKy0tLQ0KPiA+ICAuLi4vbWVkaWEvc3RhcmZpdmVfY2Ftc3NfZ3JhcGgu
ZG90ICAgICAgICAgICAgfCAyMg0KPiArKysrKysrKysrKy0tLS0tLS0tDQo+ID4gIDIgZmlsZXMg
Y2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9tZWRpYS9zdGFyZml2ZV9jYW1zcy5y
c3QNCj4gPiBiL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvbWVkaWEvc3RhcmZpdmVfY2Ftc3Mu
cnN0DQo+ID4gaW5kZXggY2E0MmU5NDQ3YzQ3Li4wMjBmMTk2OWU2N2YgMTAwNjQ0DQo+ID4gLS0t
IGEvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9tZWRpYS9zdGFyZml2ZV9jYW1zcy5yc3QNCj4g
PiArKysgYi9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL21lZGlhL3N0YXJmaXZlX2NhbXNzLnJz
dA0KPiA+IEBAIC01OCwxNSArNTgsMjAgQEAgVGhlIG1lZGlhIGNvbnRyb2xsZXIgcGlwZWxpbmUg
Z3JhcGggaXMgYXMgZm9sbG93czoNCj4gPiAgICAgIDphbHQ6ICAgc3RhcmZpdmVfY2Ftc3NfZ3Jh
cGguZG90DQo+ID4gICAgICA6YWxpZ246IGNlbnRlcg0KPiA+DQo+ID4gLVRoZSBkcml2ZXIgaGFz
IDIgdmlkZW8gZGV2aWNlczoNCj4gPiArVGhlIGRyaXZlciBoYXMgNCB2aWRlbyBkZXZpY2VzOg0K
PiA+DQo+ID4gKy0gb3V0cHV0X3BhcmFtczogVGhlIG1ldGEgb3V0cHV0IGRldmljZSwgdHJhbnNt
aXR0aW5nIHRoZSBwYXJhbWV0ZXJzDQo+ID4gK3RvIElTUA0KPiA+ICsgIG1vZHVsZS4NCj4gPiAg
LSBjYXB0dXJlX3JhdzogVGhlIGNhcHR1cmUgZGV2aWNlLCBjYXB0dXJpbmcgaW1hZ2UgZGF0YSBk
aXJlY3RseSBmcm9tIGENCj4gc2Vuc29yLg0KPiA+ICAtIGNhcHR1cmVfeXV2OiBUaGUgY2FwdHVy
ZSBkZXZpY2UsIGNhcHR1cmluZyBZVVYgZnJhbWUgZGF0YSBwcm9jZXNzZWQNCj4gPiBieSB0aGUN
Cj4gPiAtICBJU1AgbW9kdWxlDQo+ID4gKyAgSVNQIG1vZHVsZS4NCj4gPiArLSBjYXB0dXJlX3Nj
ZDogVGhlIG1ldGEgY2FwdHVyZSBkZXZpY2UsIGNhcHR1cmluZyAzQSBzdGF0aXN0aWNzDQo+ID4g
K2NvbGxlY3Rpb24gZGF0YQ0KPiANCj4gUmVuYW1pbmcgInNjZCIgdG8gInN0YXRzIiAoaGVyZSBh
bmQgdGhyb3VnaCB0aGUgd2hvbGUgc2VyaWVzKSB3b3VsZCBtYWtlDQo+IHRoZSBjb2RlIGFuZCBk
b2N1bWVudGF0aW9uIGVhc2llciB0byB1bmRlcnN0YW5kIGZvciB0aGlyZCBwYXJ0aWVzLCBhcyBp
dCdzIG5vdA0KPiBpbW1lZGlhdGVseSBjbGVhciB3aGF0ICJzY2QiIG1lYW5zLiBJIHdvbid0IGlu
c2lzdCB0b28gbXVjaCBpZiB0aGlzIHdvdWxkDQo+IGNhdXNlIGxvdHMgb2YgaXNzdWVzLg0KPiAN
Cg0KQWdyZWVkLCBJIHdpbGwgY2hhbmdlIHRoaXMuIA0KDQpSZWdhcmRzLA0KQ2hhbmdodWFuZw0K

