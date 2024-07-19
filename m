Return-Path: <linux-media+bounces-15127-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8864E937268
	for <lists+linux-media@lfdr.de>; Fri, 19 Jul 2024 04:10:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 074F01F21F84
	for <lists+linux-media@lfdr.de>; Fri, 19 Jul 2024 02:10:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2C44DF42;
	Fri, 19 Jul 2024 02:08:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2108.outbound.protection.partner.outlook.cn [139.219.146.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175CC257D;
	Fri, 19 Jul 2024 02:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721354910; cv=fail; b=ubhljvVOCQLv5u00gnxBQZxCHns5/DtmlKcI4NcRZQELWe6ESl6gVE62H2pGTZKbpH5cFtDyQe/QI1D9+SdQn6aleW73Zmwz5e17aHmaXCQ89L/RkNDGcaohDW/RAMD55kqZtvH/4jb07jc3QNDJn+gYt0ujPs99ujwiNtw/DX0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721354910; c=relaxed/simple;
	bh=DkYwrW2BYw1MBNMhDRD9Vsog2ssgT/gJoWNWBpWr1H4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=i4VHCH7SHw0Iq0Y0Zvrg8rXTmpFVtxCEAfhYDgRQoodA4Ut7UwBuCF1IAFmEOkTnzM++5x7iZbEviENjeE4SfTwQU6xWioM7QMBe27a0ON50DU1CL20z+KtVln+xBaKNxRVolmurPyv9S7toXp2feedk6K3Dd6fNSM2llQs4BXY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gJSwI6rWa5EovNPb4GmQPEfOLGQe1HsrJ1p4j40ek+EjnllxD+gsoOOQmRI77LxmP0ePjOAxwt3HmBA2AiVcttkKvc9wC2t/G+RKA4EUXf8TmsHAqUjNTAKqnEj6drmrstoGLSv5Hl5rQt25lhjpXyR+MA0caYd8HwO9OXXzMI+CargFtHH/F1XT1tjRMSr/AlinprXps2zp3Yh0Ap2QtWiYmN80sjAud6RVkC6tiiksbilJn/KCYNqjqZTVuYS1Q0PjaKo/ZRXwaun8Iw1z/vmROTcYj0dDVBijzOnX1ToBR3ozZvt+mk7mjx4LeFhJ0wzC6vMHiF5Kgf/4dfzkLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DkYwrW2BYw1MBNMhDRD9Vsog2ssgT/gJoWNWBpWr1H4=;
 b=iavrtVXau0WsA98wzd6KVzw5rKBsw6wkCKAfLiYM5Zf6ZYi8yLiGHJPHhd2RYDmpcVYuMHDUp5V58Y7tZf4l/9wznhlXuAsjLaSLOhdsMMGUCMH0PEWybqgLXV673jM+Ow+T1/IZFMY1XbygyMx9uAhdpyNBdxbjwr5nU3omIMTInYLMgUHOBVoil2QUJpGffysgKgZPh1q1srQoO1J0oVPBaEp+EAKZP3+FFr3NJ1fvVMRU6+JAteFrnEAG7F0UF2RWD9JlRGweX/1gPawFj/MPq5yY0Lpkbh/jcvAvv0jA1IdInoQeQR+pOQ6I4ZTIC2EnGUbxRONzmC33GaAF0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9) by ZQ0PR01MB0981.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.35; Fri, 19 Jul
 2024 02:08:21 +0000
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 ([fe80::64c5:50d8:4f2c:59aa]) by
 ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn ([fe80::64c5:50d8:4f2c:59aa%6])
 with mapi id 15.20.7762.032; Fri, 19 Jul 2024 02:08:20 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime Ripard
	<mripard@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans
 Verkuil <hverkuil-cisco@xs4all.nl>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, Tomi Valkeinen
	<tomi.valkeinen+renesas@ideasonboard.com>, Jack Zhu
	<jack.zhu@starfivetech.com>, Keith Zhao <keith.zhao@starfivetech.com>,
	Jayshri Pawar <jpawar@cadence.com>, Jai Luthra <j-luthra@ti.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>
Subject:
 =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggdjIgNS81XSBzdGFnaW5nOiBtZWRpYTogc3RhcmZp?=
 =?utf-8?Q?ve:_Add_system_PM_support?=
Thread-Topic: [PATCH v2 5/5] staging: media: starfive: Add system PM support
Thread-Index: AQHa2MKZbrZfMyANlEOl190GEqX0o7H8k6oAgACvhLA=
Date: Fri, 19 Jul 2024 02:08:20 +0000
Message-ID:
 <ZQ0PR01MB13020F080F8D1B024D211971F2AD2@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
References: <20240718032834.53876-1-changhuang.liang@starfivetech.com>
 <20240718032834.53876-6-changhuang.liang@starfivetech.com>
 <ecqbazcjtzat7yxwh7uuerjrrh3umpwutiwha2zo5njmwnj25g@ocpntbuecb3z>
In-Reply-To: <ecqbazcjtzat7yxwh7uuerjrrh3umpwutiwha2zo5njmwnj25g@ocpntbuecb3z>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ0PR01MB1302:EE_|ZQ0PR01MB0981:EE_
x-ms-office365-filtering-correlation-id: 76021a25-3d7b-4bbd-7b66-08dca797a9be
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|41320700013|366016|38070700018;
x-microsoft-antispam-message-info:
 iL+6lejir4ZwLesz89BdMDbQqoNrEgxEbdnp3IBPMzx5RSiaS+OoYzRCw9R/tfW7DbgAWfby9iH9ZTK2N9ZRR20gXiBy0tcwpLGmUU8rKJ6FoJ87VTf5M62Gt/p6P28UWcySJWUEhPyLIIE6ihqhaVxMktY/N6P8IeziDAa+R5GAAyNyEp5dyaBoZh8vdPcsfjaoNLO0D1ChiJOBnAGiylYbhllDMfpoWjj0zkkdT0dhacKqDLvIjduXdXI333vv+37xcsycFZErOOvS3Od9CYcaN92heYYB7JrHLrkG8Lmj762J/Ul3rGZBCskLXDfxmkAx+5u+OdNBIkCXt039xKedwXOwpcXMzvo3Yye1OAc7EvmQMVIUmT7OaB097nkfec1ZETwkaeF9x+FAseFVNU87GkhinuxQvlM+Aj+rWf3sgVcOsbhJheyVaxF0DgtltmZs0gojsf44EbJg7eD5n6ybv41m1cBvGwzBatmt1SndtNJVIByqHSK0nJSQSXrMO41oV9w9NZtqA7/a4MTeUHOHNMKuWPVhsrhf4OiGKwKE2CsOZ/mBj7Tk7LfgOWDakjnE6BTaz6gkPLmKBO288A+TkBe29RJO1ysHbO8Sm85eWXI+Ks9Gcap8ZqhgI5wQ
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(41320700013)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Wk5GaHF4M05heVZwNjNYaHFZYno0QXVpYllXeFFPOWNtQW1QSXowbk5VUm5t?=
 =?utf-8?B?eTE3eksyN1JoZ2sxWWo1cFppRWtoTm8rWEhESUZ1NEQ0bEJTWjBqY2ZIVVVr?=
 =?utf-8?B?bVM4dTBJL0lDZUhTVjdVNkdmU0ZZOXlUaXh5Mnk0ZGdQOWMxeXJWRDU0ZW03?=
 =?utf-8?B?TTM5NFY5TTRjKy91SFM2WEhrY2x5TktZbU4raURibEp6UFJUanJ3VUp5b2th?=
 =?utf-8?B?VC9Pd0xnTmNBTlZUT29sNFBWQ2FKV3g3NlptSE9aOWN0SjNvdGlpdExEYVMr?=
 =?utf-8?B?RUdQSm1MeERUTmNuVUdFWnhmZ045Y0JkVVJxNlhodllHdHY2bVpTWG05QzBk?=
 =?utf-8?B?RGtmdkhiRXpHUlZ4WGtoWHRpVHJ0NW1ic1ZOekpEd21KdkUxRlIveDZhWHFF?=
 =?utf-8?B?MHZsSzI3bXozODhtSUxKYmJzcmRxRHNUWC9OVnhZa3J0K1k3d09qTWFUS0lU?=
 =?utf-8?B?clRtekFxcCtET0N2K0VUNXRVY3ZYdFZ3RW5vNmcxYVFjQ2FKZDMvbGVpRUFi?=
 =?utf-8?B?N0cvWGNId0JpYjNGTlFSOUlMUzM3YS9wdUVDQlB2aTNmVC9TZnBsZ0gzNlRU?=
 =?utf-8?B?S0VvRW4zbjU2djlScHhDMHFHL2hDbkJSMWZkUFVNa0N4OG1oMytpTk42SkpM?=
 =?utf-8?B?MFlHUG9qeTJtdy9HZUFydjBUTWRuNkhGNE1ZYlE2SDd6cFl4bjRLMDFBenk3?=
 =?utf-8?B?Z1UraW5lZmY3VlN3eVBKbnMrQVRQTmlyM01lMGhEeDFlTXJ1ZmtFWEx5TFRM?=
 =?utf-8?B?RUVHWUdNU3IrSHBBYUhjdkJ0dXVxd05vcnZQbmRpakd3bk42dS9iS2RWb3R4?=
 =?utf-8?B?eExpYndyUE1Qc0o1aXo1NTYzeHF0T2lqSWJKMDBtMDJYckVGd0R6a2tYd3pt?=
 =?utf-8?B?WmxjWTZCazY1M2tpWE5pVEgvY1lveW9uelNObmVvdTBLNnNOcUdJR1pxNFBo?=
 =?utf-8?B?cStUdEFLdWthK1FZZnZaVXo3UE1neUc2NWNOT0lOTWh3eFJtZE5zOWwyV2Vl?=
 =?utf-8?B?SEJORDI3TG14Y211NWNOcFZsbDI4Z3FVNjNyTkplSHJ6cndjaUlFOUhLUUF5?=
 =?utf-8?B?aVVLS0JkSFltbWttcGNlam1xTUwvamNyK1B1ZWtUMEhiRXB1Qi9DY0IyL2xM?=
 =?utf-8?B?ZDI2dkZRZTRxekNWeDZ4ZGtscmthTitwWC8yUDMyOXVXeVZtYnlLdzlkMXNE?=
 =?utf-8?B?ZWJpZzNXRDBQMThLK0hxL3MrWm9QSEYvTzZWdzk3blpoUjB2SFVYaWZxVGpw?=
 =?utf-8?B?NlFmMDAwaTFFTk9wdGFWajZHZzRUbGRLa2ZXNW9lWDBkRXVkL3dZcW5Zcmxy?=
 =?utf-8?B?RGxJTGZNUkhrTXllcXpkT3Z2emtLUkpwRWdSbCt5Um5jYVpvQ3BTaFhkc0hv?=
 =?utf-8?B?M29xMzdaUUNUeHhFSEt4L1JPL0FuZU5oN0t4Nkw2U21aN0JyYmRpWHJwZWJB?=
 =?utf-8?B?RUN5c3pxMU9XRFZSWkV3NTFtcHZtajNWQWZMdDgwcURmanFqUWgvWFFJMlpr?=
 =?utf-8?B?TmYwMHhTem9qeFNwWlVrbWtuVVozamhrZ1Y2SFViTUVKTWFKUUJjSmVpUHJK?=
 =?utf-8?B?VnI2Qi91UFZFZjlRWWN6VnpTNjgyQ081amV4VFlRSXRZcEhVT04yaUJoR2oy?=
 =?utf-8?B?cDk1YTVXZGV0T0VmM1NSYTZTblF1bFhzeS9aQjNxbUN6K3U3bDV1VGtlZXZl?=
 =?utf-8?B?K29UZ21OMXlmWEFjMjRIWmdicStsaVhXMGxoQWVPR3JPUlRCZ1VqMGNNVCtV?=
 =?utf-8?B?SXB6MDBhczlBQnZTZXJIU0ovNFhId1RCem82YlBnYVY4NmorRVBpNzVTdUNi?=
 =?utf-8?B?R0hadmsrU3pESGd0ODB6Nm5xeTVvUFdicGQ1cWtqekFXSlZWbjl4SG9pZG9U?=
 =?utf-8?B?TnlDM29RMUFVMGc3WGNLTmxFUGdiVFRNZ2ZidjZaYW1ZOXF1ZUpLREtDYURR?=
 =?utf-8?B?aEVhanhTUWNsSjFRTkVYdTBhdDUrVDN4dzFwN05VRVFraHVqSWVmME1kL2Vy?=
 =?utf-8?B?TngwZVlnTklDbU13OGxYbFFTS0xKemFtdGlReHFqY0U1UDlRWHJFWS9scU5F?=
 =?utf-8?B?d2Q1NDVOdVZ3Z0dDQnZ5VExTYUdiL0REeGEvdE83NHlTZWxzdSsrZWFMK0tI?=
 =?utf-8?B?MVFwQ2xPakhCWjFkVkgyTlU4M1VmUGc1N1E5RFVSTCs2N241ZkE3QnpRZHFK?=
 =?utf-8?B?bUE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 76021a25-3d7b-4bbd-7b66-08dca797a9be
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2024 02:08:20.8880
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y9oIJ+oKwVqIIpvDgr/G985lgMOUDvFC6NsGp7Aa2tvYld83CmizzAQ4vWkhT+rphZlvR7M2/7BzEHUby+LyDoHl3e6Z4QY7rursff/oFjQWlb0cjYUwOzN0ii8SbJvX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB0981

SGkgSmFjb3BvLA0KDQpUaGFua3MgZm9yIHlvdXIgY29tbWVudHMuDQoNCj4gDQo+IEhpIENoYW5n
aHVhbmcNCj4gDQo+IE9uIFdlZCwgSnVsIDE3LCAyMDI0IGF0IDA4OjI4OjM0UE0gR01ULCBDaGFu
Z2h1YW5nIExpYW5nIHdyb3RlOg0KPiA+IFRoaXMgcGF0Y2ggaW1wbGVtZW50cyBzeXN0ZW0gc3Vz
cGVuZCBhbmQgc3lzdGVtIHJlc3VtZSBvcGVyYXRpb24gZm9yDQo+ID4gU3RhckZpdmUgQ2FtZXJh
IFN1YnN5c3RlbS4gSXQgc3VwcG9ydHMgaGliZXJuYXRpb24gZHVyaW5nIHN0cmVhbWluZw0KPiA+
IGFuZCByZXN0YXJ0cyBzdHJlYW1pbmcgYXQgc3lzdGVtIHJlc3VtZSB0aW1lLg0KPiA+DQo+ID4g
U2lnbmVkLW9mZi1ieTogQ2hhbmdodWFuZyBMaWFuZyA8Y2hhbmdodWFuZy5saWFuZ0BzdGFyZml2
ZXRlY2guY29tPg0KPiA+IC0tLQ0KPiA+ICAuLi4vc3RhZ2luZy9tZWRpYS9zdGFyZml2ZS9jYW1z
cy9zdGYtY2Ftc3MuYyAgfCA0OQ0KPiA+ICsrKysrKysrKysrKysrKysrKysNCj4gPiAgMSBmaWxl
IGNoYW5nZWQsIDQ5IGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L3N0YWdpbmcvbWVkaWEvc3RhcmZpdmUvY2Ftc3Mvc3RmLWNhbXNzLmMNCj4gPiBiL2RyaXZlcnMv
c3RhZ2luZy9tZWRpYS9zdGFyZml2ZS9jYW1zcy9zdGYtY2Ftc3MuYw0KPiA+IGluZGV4IGZlY2Qz
ZTY3YzdhMS4uOGRjZDM1YWVmNjlkIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvc3RhZ2luZy9t
ZWRpYS9zdGFyZml2ZS9jYW1zcy9zdGYtY2Ftc3MuYw0KPiA+ICsrKyBiL2RyaXZlcnMvc3RhZ2lu
Zy9tZWRpYS9zdGFyZml2ZS9jYW1zcy9zdGYtY2Ftc3MuYw0KPiA+IEBAIC00MTYsMTAgKzQxNiw1
OSBAQCBzdGF0aWMgaW50IF9fbWF5YmVfdW51c2VkDQo+IHN0ZmNhbXNzX3J1bnRpbWVfcmVzdW1l
KHN0cnVjdCBkZXZpY2UgKmRldikNCj4gPiAgCXJldHVybiAwOw0KPiA+ICB9DQo+ID4NCj4gPiAr
c3RhdGljIGludCBfX21heWJlX3VudXNlZCBzdGZjYW1zc19zdXNwZW5kKHN0cnVjdCBkZXZpY2Ug
KmRldikgew0KPiA+ICsJc3RydWN0IHN0ZmNhbXNzICpzdGZjYW1zcyA9IGRldl9nZXRfZHJ2ZGF0
YShkZXYpOw0KPiA+ICsJc3RydWN0IHN0ZmNhbXNzX3ZpZGVvICp2aWRlbzsNCj4gDQo+IENhbiBi
ZSBkZWNsYXJlZCBpbnNpZGUgdGhlIGZvciBsb29wDQo+IA0KPiA+ICsJdW5zaWduZWQgaW50IGk7
DQo+ID4gKw0KPiA+ICsJZm9yIChpID0gMDsgaSA8IFNURl9DQVBUVVJFX05VTTsgKytpKSB7DQo+
IA0KPiBMaWtld2lzZSwgaWYgeW91IGxpa2UgaXQsIHlvdSBjYW4NCj4gDQo+ICAgICAgICAgZm9y
ICh1bnNpZ25lZCBpbnQgaS4uLg0KPiANCj4gPiArCQl2aWRlbyA9ICZzdGZjYW1zcy0+Y2FwdHVy
ZXNbaV0udmlkZW87DQo+ID4gKwkJaWYgKHZpZGVvLT52YjJfcS5zdHJlYW1pbmcpIHsNCj4gPiAr
CQkJdmlkZW8tPm9wcy0+c3RvcF9zdHJlYW1pbmcodmlkZW8pOw0KPiA+ICsJCQl2aWRlby0+b3Bz
LT5mbHVzaF9idWZmZXJzKHZpZGVvLCBWQjJfQlVGX1NUQVRFX0VSUk9SKTsNCj4gPiArCQl9DQo+
ID4gKwl9DQo+ID4gKw0KPiA+ICsJcmV0dXJuIHBtX3J1bnRpbWVfZm9yY2Vfc3VzcGVuZChkZXYp
OyB9DQo+ID4gKw0KPiA+ICtzdGF0aWMgaW50IF9fbWF5YmVfdW51c2VkIHN0ZmNhbXNzX3Jlc3Vt
ZShzdHJ1Y3QgZGV2aWNlICpkZXYpIHsNCj4gPiArCXN0cnVjdCBzdGZjYW1zcyAqc3RmY2Ftc3Mg
PSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsNCj4gPiArCXN0cnVjdCBzdGZfaXNwX2RldiAqaXNwX2Rl
diA9ICZzdGZjYW1zcy0+aXNwX2RldjsNCj4gPiArCXN0cnVjdCB2NGwyX3N1YmRldl9zdGF0ZSAq
c2Rfc3RhdGU7DQo+ID4gKwlzdHJ1Y3Qgc3RmY2Ftc3NfdmlkZW8gKnZpZGVvOw0KPiA+ICsJdW5z
aWduZWQgaW50IGk7DQo+IA0KPiBzYW1lIGhlcmUNCj4gDQo+ID4gKwlpbnQgcmV0Ow0KPiA+ICsN
Cj4gPiArCXJldCA9IHBtX3J1bnRpbWVfZm9yY2VfcmVzdW1lKGRldik7DQo+ID4gKwlpZiAocmV0
IDwgMCkgew0KPiA+ICsJCWRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIHJlc3VtZVxuIik7DQo+ID4g
KwkJcmV0dXJuIHJldDsNCj4gPiArCX0NCj4gPiArDQo+ID4gKwlzZF9zdGF0ZSA9IHY0bDJfc3Vi
ZGV2X2xvY2tfYW5kX2dldF9hY3RpdmVfc3RhdGUoJmlzcF9kZXYtPnN1YmRldik7DQo+ID4gKw0K
PiA+ICsJaWYgKGlzcF9kZXYtPnN0cmVhbWluZykNCj4gPiArCQlzdGZfaXNwX3N0cmVhbV9vbihp
c3BfZGV2LCBzZF9zdGF0ZSk7DQo+IA0KPiBJIHdhcyB3b25kZXJpbmcgaWYgeW91IHNob3VsZG4n
dCBwcm9wYWdhdGUgc3RhcnRfc3RyZWFtaW5nIGFsb25nIHRoZSB3aG9sZQ0KPiBwaXBsaW5lLCBi
dXQgSSBwcmVzdW1lIHRoZSBjb25uZWN0ZWQgc3ViZGV2cyBoYXZlIHRvIGhhbmRsZSByZXN1bWlu
Zw0KPiBzdHJlYW1pbmcgYWZ0ZXIgYSBzeXN0ZW0gcmVzdW1lIHRoZW1zZWx2ZXMgPw0KPiANCg0K
Q3VycmVudGx5IG91ciBDYW1lcmEgc3Vic3lzdGVtIGNvbnRhaW5zIElTUCBzdWJkZXYgLCBjYXB0
dXJlX3JhdyB2aWRlbyBkZXZpY2UsIGFuZCBjYXB0dXJlX3l1dg0KdmlkZW8gZGV2aWNlLiBTbyB5
b3UgY2FuIHNlZSBvbmx5IG9uZSBzeXN0ZW0gUE0gaG9vayBjYW4gYmUgdXNlZCBieSB0aGVtLg0K
DQo+IA0KPiA+ICsNCj4gPiArCXY0bDJfc3ViZGV2X3VubG9ja19zdGF0ZShzZF9zdGF0ZSk7DQo+
ID4gKw0KPiA+ICsJZm9yIChpID0gMDsgaSA8IFNURl9DQVBUVVJFX05VTTsgKytpKSB7DQo+ID4g
KwkJdmlkZW8gPSAmc3RmY2Ftc3MtPmNhcHR1cmVzW2ldLnZpZGVvOw0KPiA+ICsJCWlmICh2aWRl
by0+dmIyX3Euc3RyZWFtaW5nKQ0KPiA+ICsJCQl2aWRlby0+b3BzLT5zdGFydF9zdHJlYW1pbmco
dmlkZW8pOw0KPiANCj4gWW91IGNhbiB1c2UgdmIyX2lzX3N0cmVhbWluZygpIG1heWJlLg0KPiBJ
ZiB0aGUgcXVldWUgaXMgc3RyZWFtaW5nLCBkbyB5b3UgbmVlZCB0byBrZWVwIGEgJ3N0cmVhbWlu
ZycgZmxhZyBmb3IgdGhlIGlzcCA/DQo+IFByb2JhYmx5IHllcywgYXMgdGhlIElTUCBzdWJkZXYg
aXMgdXNlZCBieSBzZXZlcmFsIHZpZGVvIG5vZGVzID8NCj4gDQoNCkkgc2V0IHRoZSAic3RyZWFt
aW5nIiBmbGFnIGluIFBBVENIIDQsIHNvIGl0IGRvZXMgbm90IGFmZmVjdCB0aGF0IGV2ZW4gaWYg
c2V2ZXJhbCB2aWRlbyANCm5vZGVzIHVzZSBpdC4NCg0KUmVnYXJkcywNCkNoYW5naHVhbmcNCg==

