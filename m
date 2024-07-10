Return-Path: <linux-media+bounces-14856-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A4D92D29C
	for <lists+linux-media@lfdr.de>; Wed, 10 Jul 2024 15:20:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9BDEA1C21894
	for <lists+linux-media@lfdr.de>; Wed, 10 Jul 2024 13:20:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F678192B71;
	Wed, 10 Jul 2024 13:20:02 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2094.outbound.protection.partner.outlook.cn [139.219.17.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA64818560A;
	Wed, 10 Jul 2024 13:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720617602; cv=fail; b=dt9BGk4Hyz23MqnwtO+RAA5II2Un18oGc1mH3XWi8YQWpq619wyen73YKygTW5icdtWvdYq8axuFrHIWAywd1+3o43Jya7u14/aiDd0tquPJgESSkxnSFd1fesuARAt1p/g3KGc089YO2ZB3HHx38QY9zwIDoxZxtVidJJmW6U4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720617602; c=relaxed/simple;
	bh=zZOkhTSS4Az48aT1oSlFjbBwtMjKBRY3xbxuoUVRA7E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Pn0FCB95+aVsOJ+QvmJ8b0eh/QhBGRGk7WiHaqPD/3hJMPFwJIYDcTG9534BDgwYP/goM3JCY7jCT/+U1FQ1t5b70eh/5IADQ6ORynV55yENVv1euLqGfBpgH9t0yVwogR4WZ4bilyzW+j7GelurwYaSPZPb1crvoULYOmuw/4s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SHEACoYwAnnCaUbh304SJpBfxTabgrs0vNcqTIngEWQBPFAOj9zwK4Ntka0ZtqEYxX/Le/riXoTMz6Nx5iDR/R4BMP5MSMHR74FXt5Idq1XaRT2/KPb8PFfnLdVM2bBXwVeNIvyQa6J/Yy4MBeRDoobolh5x1CYBoAgtwrohwNY59TFOSMlh+QM5VYqKbU03nKbT8bnXANu1na32l7To5635x1AbtnnRSq7I54AqNhi52la+jGJjOuiUenuU8CU05QfMzX+rAwyT8iF4xzNXZjfJwthlFhUZ2gEB/p5NDiX23RHLN8tzsYO+tlmbfEszvrB/065bBeoJt8aCF3Bduw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zZOkhTSS4Az48aT1oSlFjbBwtMjKBRY3xbxuoUVRA7E=;
 b=DoPnDwNXk0B8a1OOB8cOxhK4+Ajx+Gu3QsKjD1zQIfLC9jhTtR8KKE0e1+mDuYw2CXfYuz/2wpwBETRdikGVecp4uFvwqfpV2CiH4lxN9mNCqEdGMxbRxFXnR0q/9mqVj+NCD7Ga8W7GOhT2a9BnblfhW21mV8f3M53pH7d1ykzZSVubVY2ZxJSDEypgXK4QMCqtxwgntBF4ZpqMD6zN+m9ciI2zKqBHGl2Va3dYCXVXe8bclxVHZXFtIg+k6PYhzaDc0BX+QVOvO7NIx9biRzD8RHV4PgLdlOE58ByYKkQjco7SzaAmCbvljj2KS1gs952x6kZ/kzAyviKhhdy0qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9) by ZQ0PR01MB1064.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:d::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.38; Wed, 10 Jul
 2024 13:04:27 +0000
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 ([fe80::64c5:50d8:4f2c:59aa]) by
 ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn ([fe80::64c5:50d8:4f2c:59aa%6])
 with mapi id 15.20.7741.033; Wed, 10 Jul 2024 13:04:27 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, Jean-Michel Hautbois
	<jeanmichel.hautbois@ideasonboard.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Tomi Valkeinen
	<tomi.valkeinen+renesas@ideasonboard.com>, Mingjia Zhang
	<mingjia.zhang@mediatek.com>, Jack Zhu <jack.zhu@starfivetech.com>, Keith
 Zhao <keith.zhao@starfivetech.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-staging@lists.linux.dev"
	<linux-staging@lists.linux.dev>
Subject:
 =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggdjUgMDQvMTRdIHN0YWdpbmc6IG1lZGlhOiBzdGFy?=
 =?utf-8?B?Zml2ZTogQWRkIGEgcGFyYW1zIHNpbmsgcGFkIGFuZCBhIHNjZCBzb3VyY2Ug?=
 =?utf-8?Q?pad_for_ISP?=
Thread-Topic: [PATCH v5 04/14] staging: media: starfive: Add a params sink pad
 and a scd source pad for ISP
Thread-Index: AQHa0dtkcNKKzXoXiUypx3sthnB42bHvuaWAgAA0quA=
Date: Wed, 10 Jul 2024 13:04:27 +0000
Message-ID:
 <ZQ0PR01MB13024823EE94D8A5705FC728F2A42@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
References: <20240709083824.430473-1-changhuang.liang@starfivetech.com>
 <20240709083824.430473-5-changhuang.liang@starfivetech.com>
 <ku5lhlocshwrc6yxbofr7dtqgrpdijaop4c265njyjnu42rpi5@o36mnwborhjo>
In-Reply-To: <ku5lhlocshwrc6yxbofr7dtqgrpdijaop4c265njyjnu42rpi5@o36mnwborhjo>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ0PR01MB1302:EE_|ZQ0PR01MB1064:EE_
x-ms-office365-filtering-correlation-id: b10794e9-c71b-459a-7058-08dca0e0d42b
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|366016|41320700013|1800799024|38070700018;
x-microsoft-antispam-message-info:
 HAQaRSLLmHaNFdcNjUgE6cDBmgUIL5gp/aH5CKMU9YptBO/dDpMNYMFMXi16wjBJPOCv9ziKvJd6Liaza0PkqsSbaP41rmM/Rm+uGU515C+zTZQJ2aQ9YnT0hYvtmB9NtE6CYnNkFHtirea8As1zRAB82LNbcrv7lGZwnWU6LHn4AWmstOATcKF9MICWZLbhuabTToC/AcPitgYpZ5SMGHGYN1lIWo5X1yH91JE5XnIDjEMBuZ68opc8WgmtejJUTF/TM4Pl4onOOHRJ4THfuMUsfiQ1k2jIeOceGmRiARhC5HYnoQGyHaKjRvyVG8Khb4x8h53Gd8h5zB9fZQ7ax5Flyiwyu/5PM2g67eBBIMIteOZgJm2vs9TINh2AoTxEabsMJaMKiv40qDDIQ/WWHNOasD9FwYuCZa7bT093SK4NP7q+5e+ehy/+/uz9sC0v1g/JDWvSkoc3YxFkz2YzXLblsNTAn4s7OPzWCULf+gTyFwf15YuFHyPBwhFh593IyAIn2bBzWNfiabs9HBIdF4OVTy3R4egCvNbcudDnS7JL0ElrvgqeR6hhCcddpCh573+AZXZ03UJYuLsKHrv7Iz8GDBHDpJ1qTfyPC0wUUmqead8EFOruIXQU81xn64XI
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(41320700013)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Y0dtWVNBSnB5U2tXSURSYjQ0YW1KUFFTRjBHMnltSGpJckZZbnhDUElic1ha?=
 =?utf-8?B?VTRjQmkyc0dQMXhxQmhQeThBSjh6aGdVZDdNMVR2OUU3eGtFb0JYYlJCT1ZU?=
 =?utf-8?B?VnhMaGNORkxpbE45QTh6Mm45dllsTTFuZ2FZOEMxdWJnUXZnbU40UUQrejFF?=
 =?utf-8?B?TllldGVZQnd4OVJ5b3J6anlCTTlXckVPYVB3eUJmdHZqeFh4VWgwdjZmd1hY?=
 =?utf-8?B?WlhZZktMR1djNTZYT3BKNXh0WnB1d0Y1S0V3WHRmeHE0R1hhSEVSZFByaGs5?=
 =?utf-8?B?MVBaMnQvdG1DRURxdzdpWmk3M1VwMXZzcEs0L2llSExRU2lyZzVCSk0xM3ox?=
 =?utf-8?B?MkhGYVBRYUQyWExNenBoSklYbGZ3S3VEUmlVWHhKbDFnR0pBNjROc1crcnh3?=
 =?utf-8?B?b1Y4aVlMRXkybUxZQnptbm0vdWRKbEN2djV2d243K2lqNDcyaG5yNUpWTy92?=
 =?utf-8?B?UkVOeWRCcWtjdXFlZm0zU2pkRjMzNXFiTXpUdnpjL1dPVlJtZHpMdHhBQWpQ?=
 =?utf-8?B?bjkxNEJIR24vc2d4R2hKVkhZKzd4RWJIVWg0OFBEK0x3aVpwZE9LK0Nsdm41?=
 =?utf-8?B?Y2NEQXRBWitxVXoyVWFuZW5BR09jakxOZjJvQTJSaCtFV1RHcnJ5N0prM2Ur?=
 =?utf-8?B?OFNjTWwxUnBoSG8wQVNpR01qTmg5QThlb0xEbFFmK2xKQlZBOUpmMlFjLzNW?=
 =?utf-8?B?aEEvRzJrdEJrMlMza1FhY0l2RlA5RkZXWm1lbTdXcmtwaDNGTnk1OUZZd0cx?=
 =?utf-8?B?OVhqY1M3SXN3SlIyakVPVEVNK3I5amoxZW9oc3lvYW1iM1htWFlVUVdDZ2o2?=
 =?utf-8?B?Q3FxMUY4eUNGR0VlM3pxN2pwWkxQdjl0cjVseDVCQnNzUXowU1IyaUtIVTI1?=
 =?utf-8?B?aUVGVjVPbUM5VFVMV1BqckV2ZjRqRnpCcUQvTHZiS0pOMTU3dWpDaTVwdGJY?=
 =?utf-8?B?V3ZVWXRoUjR4NEFmVFV0aURWQzUxUEd4V2lDdjNFdnpBU3gyditnV0JYSXJE?=
 =?utf-8?B?OTNqV0ZCRG14anlqbVdQbTJJYm1xNU1OVzFaaXh6KzlmNEZvNVVKbDFsNlhP?=
 =?utf-8?B?L3FIeUhodHdHeWtERjdEeEFLQVdHYzdVV3dWUmpzaXJTMnZVNXdXNTJUOTk1?=
 =?utf-8?B?OHJkOUlwZmRwT0tYNXlMblRkZmpRNllhSVY3T2E0dndoeFF0QVhPbXByQmZF?=
 =?utf-8?B?U08xYWJhS0FmR3RGWGRobWxqUlBmWWRyRCtKVDNDZENacTZpYzVsYnFmUm11?=
 =?utf-8?B?MGt1dFczeUFmcGdIZDdGdXhDenJ0Y3ovSWo1WklicVRucGthOGZ1RHJlYUV6?=
 =?utf-8?B?MHMxZlN6a2VhTlZhWnRkcEtWRmo2Q01yODlIanZ1RkpRQ0d6cisyUHU1bEps?=
 =?utf-8?B?dXhBWE0xZXg3UFA0VkZGVHQ2eldrbG9nYWtJNUtIelBxdVJXSmlzSVMrVUFF?=
 =?utf-8?B?VDV6aGlSZlBIM2djV1c0NkNVRUR2RXROZ0hka09jT2V2Z0lYSFppRjU1em5H?=
 =?utf-8?B?ZzdBNjYzdjFyMHpaUE1Za1d1QjZ2WlZ6MHBlNGtsK1cwMUhqbllxeEY2bG91?=
 =?utf-8?B?Vm04MGJvTVdiWXlCYk9jOUZqWGQ4VklXNmdXQmhOVGFoS0ZHTnNNaVEzcFdE?=
 =?utf-8?B?TitGWjlWRVpQOVBPdy9zTmZoMkJGcEdoRCswaGFyL08zT2JqdFNkQnc1TU1Q?=
 =?utf-8?B?YUFCYmRHTzZLczdYN3BkTXRhMm96bU00azhsQjZKVUhvSFN5aFpmOVpMQklw?=
 =?utf-8?B?Vy9tN0FoSHp2c1gzb2FUcHlVcE1QZDd2ZktoYnlPei91dTlCZXRNU2ZjRUNu?=
 =?utf-8?B?TDU1dzh2UDMwWnowOGg4YXlNZVE4VXhmU0RwSlI3UmJMVDBsSzhnREJha0NG?=
 =?utf-8?B?ZmdGemwzbkR0OU5aYTZWSU56V1ZFVUdoN2lIM3ZrbzJYSnIwOXZnYjN2UXVO?=
 =?utf-8?B?ODZaZVd6ZU1nU0hSNkJFM1FpNFUybHN1d1JVbXMrcVVHcFBjZmtlM3QrRmZs?=
 =?utf-8?B?SnJnWFRFTEFQZWpDcVo4blR0WXgvbks2clU4ZXh3WGZjWGlrNGptdC84K2xR?=
 =?utf-8?B?NGFIc1N0WmpBcGgrUFdYT0tGOWkwQ2ZxU2IyL1Jyd2RuSmx3STI1NTFheUs0?=
 =?utf-8?B?TW1EN1BOZGVqeE8vMHg4WWNWUlA2bHJSUmYwYnYwTU9TbExud3pncUxLVWF1?=
 =?utf-8?B?SEE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b10794e9-c71b-459a-7058-08dca0e0d42b
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2024 13:04:27.2048
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sJT+U1KdQMVZU2f6ReT/t29CxGV9mNGcY/7XEft1kzXRTjouGxfhXJ6yQzrbhZB2TOD6sbWnT0Nvu5OTj+bP4XN9r+gAXy09f/2JYKgJ9AFCVYSBdXyIc5C92Yb8RHNd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1064

SGksIEphY29wbw0KDQpUaGFua3MgZm9yIHlvdXIgY29tbWVudHMuDQoNClsuLi5dDQoNCj4gPiBA
QCAtMTUxLDYgKzE3MSw5IEBAIHN0YXRpYyBpbnQgaXNwX3NldF9mb3JtYXQoc3RydWN0IHY0bDJf
c3ViZGV2ICpzZCwNCj4gPiAgCWlzcF90cnlfZm9ybWF0KGlzcF9kZXYsIHN0YXRlLCBmbXQtPnBh
ZCwgJmZtdC0+Zm9ybWF0KTsNCj4gPiAgCSpmb3JtYXQgPSBmbXQtPmZvcm1hdDsNCj4gPg0KPiA+
ICsJaWYgKGZtdC0+cGFkID09IFNURl9JU1BfUEFEX1NSQ19TQ0QgfHwgZm10LT5wYWQgPT0NCj4g
PiArU1RGX0lTUF9QQURfU0lOS19QQVJBTVMpDQo+IA0KPiBuaXQ6IGNhbiBlYXNpbHkgYmUgbWFk
ZSA8IDgwIGNvbHMgKGFnYWluLCBub3QgbWFuZGF0b3J5IGluIExpbnV4IGJ1dCBlbmZvcmNlZA0K
PiBpbiB2NGwgYWNjb3JkaW5nIHRvDQo+IERvY3VtZW50YXRpb24vZHJpdmVyLWFwaS9tZWRpYS9t
YWludGFpbmVyLWVudHJ5LXByb2ZpbGUucnN0KQ0KPiANCg0KSSB3aWxsIGFkZCAtLW1heC1saW5l
LWxlbmd0aD04MCB0byBjaGVjayBwYXRjaHMgYWdhaW4uDQoNCj4gPiArCQlyZXR1cm4gMDsNCj4g
PiArDQo+ID4gIAlpc3BfZGV2LT5jdXJyZW50X2ZtdCA9DQo+IHN0Zl9nX2ZtdF9ieV9tY29kZSgm
aXNwX2Rldi0+Zm9ybWF0c1tmbXQtPnBhZF0sDQo+ID4gIAkJCQkJCSAgZm10LT5mb3JtYXQuY29k
ZSk7DQo+ID4NCj4gPiBAQCAtMjAyLDYgKzIyNSw5IEBAIHN0YXRpYyBpbnQgaXNwX2dldF9zZWxl
Y3Rpb24oc3RydWN0IHY0bDJfc3ViZGV2ICpzZCwNCj4gPiAgCXN0cnVjdCB2NGwyX3N1YmRldl9m
b3JtYXQgZm10ID0geyAwIH07DQo+ID4gIAlzdHJ1Y3QgdjRsMl9yZWN0ICpyZWN0Ow0KPiA+DQo+
ID4gKwlpZiAoc2VsLT5wYWQgPT0gU1RGX0lTUF9QQURfU1JDX1NDRCB8fCBzZWwtPnBhZCA9PQ0K
PiBTVEZfSVNQX1BBRF9TSU5LX1BBUkFNUykNCj4gPiArCQlyZXR1cm4gLUVJTlZBTDsNCj4gPiAr
DQo+ID4gIAlzd2l0Y2ggKHNlbC0+dGFyZ2V0KSB7DQo+ID4gIAljYXNlIFY0TDJfU0VMX1RHVF9D
Uk9QX0JPVU5EUzoNCj4gPiAgCQlpZiAoc2VsLT5wYWQgPT0gU1RGX0lTUF9QQURfU0lOSykgeyBA
QCAtMjM5LDYgKzI2NSw5IEBAIHN0YXRpYw0KPiBpbnQNCj4gPiBpc3Bfc2V0X3NlbGVjdGlvbihz
dHJ1Y3QgdjRsMl9zdWJkZXYgKnNkLA0KPiA+ICAJc3RydWN0IHN0Zl9pc3BfZGV2ICppc3BfZGV2
ID0gdjRsMl9nZXRfc3ViZGV2ZGF0YShzZCk7DQo+ID4gIAlzdHJ1Y3QgdjRsMl9yZWN0ICpyZWN0
Ow0KPiA+DQo+ID4gKwlpZiAoc2VsLT5wYWQgPT0gU1RGX0lTUF9QQURfU1JDX1NDRCB8fCBzZWwt
PnBhZCA9PQ0KPiBTVEZfSVNQX1BBRF9TSU5LX1BBUkFNUykNCj4gPiArCQlyZXR1cm4gLUVJTlZB
TDsNCj4gPiArDQo+ID4gIAlpZiAoc2VsLT50YXJnZXQgIT0gVjRMMl9TRUxfVEdUX0NST1ApDQo+
ID4gIAkJcmV0dXJuIC1FSU5WQUw7DQo+ID4NCj4gPiBAQCAtMjk2LDggKzMyNSwzOCBAQCBzdGF0
aWMgaW50IGlzcF9pbml0X2Zvcm1hdHMoc3RydWN0IHY0bDJfc3ViZGV2ICpzZCwNCj4gPiAgCQkJ
LmhlaWdodCA9IDEwODANCj4gPiAgCQl9DQo+ID4gIAl9Ow0KPiA+ICsJc3RydWN0IHY0bDJfc3Vi
ZGV2X2Zvcm1hdCBmb3JtYXRfcGFyYW1zID0gew0KPiA+ICsJCS5wYWQgPSBTVEZfSVNQX1BBRF9T
SU5LX1BBUkFNUywNCj4gPiArCQkud2hpY2ggPSBWNEwyX1NVQkRFVl9GT1JNQVRfQUNUSVZFLA0K
PiA+ICsJCS5mb3JtYXQgPSB7DQo+ID4gKwkJCS5jb2RlID0gTUVESUFfQlVTX0ZNVF9NRVRBREFU
QV9GSVhFRCwNCj4gPiArCQkJLndpZHRoID0gMSwNCj4gPiArCQkJLmhlaWdodCA9IDENCj4gPiAr
CQl9DQo+ID4gKwl9Ow0KPiA+ICsJc3RydWN0IHY0bDJfc3ViZGV2X2Zvcm1hdCBmb3JtYXRfc2Nk
ID0gew0KPiA+ICsJCS5wYWQgPSBTVEZfSVNQX1BBRF9TUkNfU0NELA0KPiA+ICsJCS53aGljaCA9
IFY0TDJfU1VCREVWX0ZPUk1BVF9BQ1RJVkUsDQo+ID4gKwkJLmZvcm1hdCA9IHsNCj4gPiArCQkJ
LmNvZGUgPSBNRURJQV9CVVNfRk1UX01FVEFEQVRBX0ZJWEVELA0KPiA+ICsJCQkud2lkdGggPSAx
LA0KPiA+ICsJCQkuaGVpZ2h0ID0gMQ0KPiA+ICsJCX0NCj4gPiArCX07DQo+ID4gKwlpbnQgcmV0
Ow0KPiA+ICsNCj4gPiArCS8qIEluaXQgZm9yIFNURl9JU1BfUEFEX1NJTksgYW5kIFNURl9JU1Bf
UEFEX1NSQyBwYWQgKi8NCj4gDQo+IERvZXMgdGhpcyBpbml0aWFsaXplIHRoZSBmb3JtYXQgb24g
U1RGX0lTUF9QQURfU1JDIGZvciByZWFsID8NCj4gDQoNClllcywgaXQgd2lsbCBpbml0aWFsaXpl
IHRoZSBQQURfU0lOSyBhbmQgUEFORF9TUkMgZm9ybWF0cyBieSBpc3Bfc2V0X3NlbGVjdGlvbi4N
Cg0KPiBBbnl3YXksIHdhcyB0aGVyZSBhbHJlYWR5IHNvDQo+IFJldmlld2VkLWJ5OiBKYWNvcG8g
TW9uZGkgPGphY29wby5tb25kaUBpZGVhc29uYm9hcmQuY29tPg0KPiANCj4gVGhhbmtzDQo+ICAg
ag0KPiANCg0K

