Return-Path: <linux-media+bounces-28915-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C37CAA7443C
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 08:14:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 59A53189362E
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 07:15:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCAC4211462;
	Fri, 28 Mar 2025 07:14:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2103.outbound.protection.partner.outlook.cn [139.219.146.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47A16FBF;
	Fri, 28 Mar 2025 07:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743146083; cv=fail; b=Ek+IEojDSfVfp7/259JWpiMJ+tHRZR1uHA+7afCDGZmhLjEo5+vl+4JVtrw2aJS3psFKg4ytYecM0zCO7+BG/viO8Xi6h7phcvFZr7ASgYOjMIqAkTmMD4D32NbgBmDntSKDstbqILaEmpt5gaS3RT7dOeoBMGOBd76PBt9+E4w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743146083; c=relaxed/simple;
	bh=tbShpSIaIH5paln3kbLWLY6inp6r1jqHaVdB4AGfZIA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=un7PAAymIomeMgwLau1rybRL4Xnj/V9w6aRz//0tCRCf3ZFZqT98JsYMVTfplCW9RlziYibex7uDzwMoORkhDOS0+QLHCPf/xdtO+k5CK2lakGbVu7oitcJ7/jFwATY3INsmXrNHZSR4DX7N92fQ5SnddQLBqr/r2xVYkl8KlPk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZwE1kxwMAg4zCxWdZvincPhcjzKP6kAHoCkA8px1/ePTJ4ZGWvqMIT4ijNwXQGboMb1/972dPj8CpvHwgwJILd9Z145PXqJ0lAUQQoZmChBM358RKln73vadBGtaUV4FjDYLO73z0RcqwJylIs46MevvvXHvdeiI0IdVA2RaTZa6pMF1nAJNjuiyq6eZMKwknpT62V2dzyf/CyQj7WYhjU48kwyveBeMXc6ERRTVVmByyIB2hfBsN8vvYVNFHI7SAOUKQD6st7Hgu8cTXHI+qKJvSG1MkxuwtjvhvRvclWixGZC0L9LI9lL/9hLPPCuxM+dyt4MamxykFRGfwHXLQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tbShpSIaIH5paln3kbLWLY6inp6r1jqHaVdB4AGfZIA=;
 b=Bohh/yeafaBM/cMmwZU8HN8XXa9/DjGxgm1PBZEB+7KkRCL7UzUEIQ/hPkrGnj0zAO0uHDXWyU3TU357Te+wWPiMi4Z8J6w+WGB3PIoTdSrRiVhI2lpECwX5AHUXh5r6mKEUPRTQT6Q2HQfKKl5nFCpfzFx/HFbA6tOeGTUzYks8y5y5+T8uVGwDR9DjXBhAYkTv6gM15OZgpValsMaQnNg5nLSSdy+hgFr1SUo6UMRmmqD9pCf8uW1Mbpy1ypdqq4rPgA8ZxgkbI3K5VvEfAzmxmooLUqa20BByc1+onuX7jU9zumRq29wXo3hCv9wGnuBL7w6acIyLaBw2nd0tJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9) by ZQ0PR01MB1269.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:18::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.46; Fri, 28 Mar
 2025 02:39:25 +0000
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 ([fe80::64c5:50d8:4f2c:59aa]) by
 ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn ([fe80::64c5:50d8:4f2c:59aa%4])
 with mapi id 15.20.8534.043; Fri, 28 Mar 2025 02:39:25 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>, Jai Luthra
	<jai.luthra@linux.dev>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans
 Verkuil <hverkuil@xs4all.nl>, Tomi Valkeinen
	<tomi.valkeinen@ideasonboard.com>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Maxime Ripard <mripard@kernel.org>
CC: Devarsh Thakkar <devarsht@ti.com>, Rishikesh Donadkar <r-donadkar@ti.com>,
	Vaishnav Achath <vaishnav.a@ti.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject:
 =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggNC82XSBtZWRpYTogY2FkZW5jZTogY3NpMnJ4OiBJ?=
 =?utf-8?B?bXBsZW1lbnQgZ2V0X2Z3bm9kZV9wYWQgb3A=?=
Thread-Topic: [PATCH 4/6] media: cadence: csi2rx: Implement get_fwnode_pad op
Thread-Index: AQHbnLScX+cPyWpF/EWlu/SFX1xgVLOH2yOw
Date: Fri, 28 Mar 2025 02:39:25 +0000
Message-ID:
 <ZQ0PR01MB1302CD93030792DFC1E1BBA5F2A02@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
References: <20250324-probe_fixes-v1-0-5cd5b9e1cfac@ideasonboard.com>
 <20250324-probe_fixes-v1-4-5cd5b9e1cfac@ideasonboard.com>
In-Reply-To: <20250324-probe_fixes-v1-4-5cd5b9e1cfac@ideasonboard.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ0PR01MB1302:EE_|ZQ0PR01MB1269:EE_
x-ms-office365-filtering-correlation-id: e1c087e1-ab20-4d0f-c7a6-08dd6da1c148
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|366016|41320700013|38070700018;
x-microsoft-antispam-message-info:
 EyCX1fI3W2NIt0miDOO4poo19ruEm/eqzlQcCa2DxGp+U5iXG7eaAEuF17QW5YB/g+wAP6J1tIeRMQo1HBE/kLA5JGUqwEpYTUegnMMwAao0Sbg0q/Aa7sJm9KTxSmzpuOvnnJU4lAIBDDSytyyoI0J4JAVLfcjGVMgmuvSei1UicZMvDf2hc9JYYN9aLexIx7RQ6/YRSYO+4blO/Z62zOF+kNxHoilNnVVK0KcKPIwj7tx4z6U7xc8bjYd10CcOQrymatZe6oJlQ/s0Tm3MLA6XKrQSxJnw+ock/APRxYNQvjzkt24P6fcWj6yn1s41jzUAc5/p4b7AbprtzTY/wPvinsfdLZNlC9CHxB2W1rs/hMF6W44uo2Kzl4xcor0HfIfqo9CJpNRhPUQEJgH5BR0EtVIpweYMS8TIGwkjAy0WFNBoAWbRBODdnH1shCTA+HCO3wqtZds6sItxH9RpgWk2RnPXzhZ8C7IPS30QrGUHIgFP/BLMhM9AxzEHr5o8Uv+T+6o2mwtssA2DePlhJDyPl+EUNJKPiqDbdabeixa+pAImHdMVTa3OLpEpAAJMk2XD/+sClXCFREK/o2PZsA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(41320700013)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UHhpL3BGZG9wK1VSbUJOYUJTeUFBNUtBTmdHTUlLbHYvMzhuU0NnUHFtem9q?=
 =?utf-8?B?WGNwRHhxdnlzUFBHM1ZjVlpibWZkTGg3TE1LbnM5VUdtVDJnVE5Kb3M0TmhC?=
 =?utf-8?B?aDdUMUFjVVFEeURnTkRMdWNSZGlLbnJWa05oZUxMYVZiWUdHeStUc29wSVJx?=
 =?utf-8?B?VTRUNk1GWENKbERhL2dyUUUyR2UwWTdGNnZrNkV2Rm1tRDVGZHUzeG9YWDIv?=
 =?utf-8?B?ekY3ZzljUVMzUTFDWjRKSGdjZmlnZkZaSll2NkVyWTNacE54MUY5anYxbG9h?=
 =?utf-8?B?aU4rLzhiREhPL2lqR3pFMUdMcXdhR2pkTHRCUEovaXdlbUJ6NzdEaWVQbEd3?=
 =?utf-8?B?cVZTMHRTaGlRWFhkRjhrK2ZsMDlMZVRoaEZ6K0ZhNjZJdWVzUWlHckp3c2Iw?=
 =?utf-8?B?UU5rUjZpVDZsM045WElQVEVGZkwzcFZrUlQyODNCclJjTVNpL3NrbGlFU1Vx?=
 =?utf-8?B?RWxjbHBCYXBXc3cyQ2JOQ0lUSDBmQ3JMeVA2QnloS2ZkbW9QenBrVXQ1UDFz?=
 =?utf-8?B?QS9RTWpPRWxiY2FNd293UmhlRnRNREwvdngwNzhFRHZ1Sk9vbFFtUGRkMnJP?=
 =?utf-8?B?dUthUFVPLytzL0JPbFRhVDFZWFppeTFWWC9OcDlLckRadDEyeWVSVGppKzZU?=
 =?utf-8?B?amJnY3ltUUN2eWZrdTRtQUxUQnNvSXBvcS9NODZSSlAyek5XVGFZaUViU2E5?=
 =?utf-8?B?aDR6QXRFVlhJeWtsRWwzUnc5dVFuRVN4bU5JNlhUUW9hc2lpRFE4RE1BWXA3?=
 =?utf-8?B?Y3hHQ3Izck04ckw1RldVVHlPMVB0ajh0MUEyQmpEMmJQS1ArRlpjcHRFZFBS?=
 =?utf-8?B?U1VNbDdsMStuS0tUN1ZNZFRlVkN5Zm03ZU5RczdOSnZIVUdPeHZZa2Nrczhz?=
 =?utf-8?B?Q2NnR1k2ei9JaUxFRDR5emp5MWtOVCtrblF6VWZQd3JWc3NLM0JRYmo3Ulpt?=
 =?utf-8?B?YzU3VE1Vdlc1Y0o3bHlXbm5RTEtUOVF2YUZ1NE4ySS9xVGhmc29HR1Y2RTYy?=
 =?utf-8?B?REtsUGw4WTUzR3I4UTR4NFdQUlhwU1pBWGM3YnpYcitOZW4yWTZMUWFjS2R5?=
 =?utf-8?B?KzErdHBHYkNuQzNPd1lsQ1ErMjBZSGtxaUJ5WDlzaFRMeGI1UVlWSjRwU1k5?=
 =?utf-8?B?SVdaM0N0L1hIaVczTkRncG4zM042ay9qcEFBbDJ5STFuL2F5VDg1V1FCVE9W?=
 =?utf-8?B?b1FuR1FHcFRJcjgzekIrUEdnM0dVbERHb042RUlaS1Yvc1VVTTVxV0VVUXFZ?=
 =?utf-8?B?Ym9mejZ4VDV4SEFFbUlyU1Z2d25aa1A4YUpCVzdEcXJNcWlhanh3K3pBTXZ5?=
 =?utf-8?B?ejEwcGN3aGU3VjBVN3JXWXZnYkxnbERUbHphTEhHQSsrZkpRVnFPSmZzeE1o?=
 =?utf-8?B?TEhoWGpGbnRNSnFnV1FudWY5elorVXRhb09iRDc5TzkxYkRaU0k3cFFRL1Fm?=
 =?utf-8?B?ZUZrKzBwREtVa2wvSnFxVlU2cXpuenVHb0xHMlNJbVdPbGZUL09aN2FFZ212?=
 =?utf-8?B?aFJLWnhEajBrOHlaR1FjWDVUcVFIS1hKMTNXVFhpSUlENnFVa2RQNW9DS09M?=
 =?utf-8?B?Y1B3dTMwb0p4di9Wd3pRb01kK0FoVGdjS0Eycml6L2w2bVh0aDNpOWVnRFFv?=
 =?utf-8?B?cDU1b2hKV2hKalRreVVhTGFQNm82SXFvWk9GcFF6N0RhTjVOTU1UL2hPeVhG?=
 =?utf-8?B?M2tFQVUwYWNNRko3eEl1RTA0ZjVxbmlWclkrVjQwOTlFbGZMQnRwTlRVZTVh?=
 =?utf-8?B?TG1YaUJZR2hvd3pGejh3QXh1NmxjQ1F1OVBXVTQycHY1UTB3dGpmMGs5aldk?=
 =?utf-8?B?Qy8rcENpTGMrMjU4Z3JVNWFsckhHemlObFJkVjlrK1Y2QTZqNWNqT3VTNE1J?=
 =?utf-8?B?dmxPTDhpT0w3TzJuVVFIam1BalMzMndwdUlmeHBwUUx3NGtVTGNuOUU4SGtj?=
 =?utf-8?B?OHphM0I2bHhHRE1Hd2ZRVmN1ZElzMUI1bVlFbTE2MWwrUnkzQWxOMll0VjB5?=
 =?utf-8?B?RmZiWEVHSWU1YWhMQytveEVaTm9GRlU5cjZlaHI1bEY1MFEwSzlVRGxmeURa?=
 =?utf-8?B?U1B6YjB1cEF2M2Y5VGNCTEtrSXZydFFxQlNKb210a3pFNlVTbkNIMkcvL3ZD?=
 =?utf-8?B?aURDMkJaTitRelFncEkzekNZbkQyYTVCUitOckFCcHZnbzQxYTQ5c1kvTWM4?=
 =?utf-8?B?Nmc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e1c087e1-ab20-4d0f-c7a6-08dd6da1c148
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2025 02:39:25.6310
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tnVn5UM/oqah06e693/T38LsQTHQSbwH5CKzB4L3hTLdKAkgjT9qTLtTXPC0GA+0O2ORaYCut4mMh5bVoIuZRic7oFSLjV0mJ7mRm5HFAMPaMAdZMyEFobG19V6HrBUw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1269

DQo+IFVzZSB2NGwyX3N1YmRldl9nZXRfZndub2RlX3BhZF8xX3RvXzEoKSBhcyB0aGUgZ2V0X2Z3
bm9kZV9wYWQNCj4gb3BlcmF0aW9uLg0KPiBDYWRlbmNlIENTSTJSWCBtYXBzIHBvcnQgbnVtYmVy
cyBhbmQgcGFkIGluZGljZXMgMToxLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSmFpIEx1dGhyYSA8
amFpLmx1dGhyYUBpZGVhc29uYm9hcmQuY29tPg0KDQpSZXZpZXdlZC1ieTogQ2hhbmdodWFuZyBM
aWFuZyA8Y2hhbmdodWFuZy5saWFuZ0BzdGFyZml2ZXRlY2guY29tPg0KDQo+IC0tLQ0KPiAgZHJp
dmVycy9tZWRpYS9wbGF0Zm9ybS9jYWRlbmNlL2NkbnMtY3NpMnJ4LmMgfCAxICsNCj4gIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVk
aWEvcGxhdGZvcm0vY2FkZW5jZS9jZG5zLWNzaTJyeC5jDQo+IGIvZHJpdmVycy9tZWRpYS9wbGF0
Zm9ybS9jYWRlbmNlL2NkbnMtY3NpMnJ4LmMNCj4gaW5kZXgNCj4gNGQ2NGRmODI5ZTc1ODViNmUz
MDU2NTFmM2ZmOWJkZDAwODUwOGVjNS4uYjQ4OTk2NzU2M2NkZTk2YWMxMDljNDQNCj4gYTY2NWIz
MGU1NzMxMjU3MjEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vY2FkZW5j
ZS9jZG5zLWNzaTJyeC5jDQo+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vY2FkZW5jZS9j
ZG5zLWNzaTJyeC5jDQo+IEBAIC00NzcsNiArNDc3LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB2
NGwyX3N1YmRldl9pbnRlcm5hbF9vcHMNCj4gY3NpMnJ4X2ludGVybmFsX29wcyA9IHsNCj4gDQo+
ICBzdGF0aWMgY29uc3Qgc3RydWN0IG1lZGlhX2VudGl0eV9vcGVyYXRpb25zIGNzaTJyeF9tZWRp
YV9vcHMgPSB7DQo+ICAJLmxpbmtfdmFsaWRhdGUgPSB2NGwyX3N1YmRldl9saW5rX3ZhbGlkYXRl
LA0KPiArCS5nZXRfZndub2RlX3BhZCA9IHY0bDJfc3ViZGV2X2dldF9md25vZGVfcGFkXzFfdG9f
MSwNCj4gIH07DQo+IA0KPiAgc3RhdGljIGludCBjc2kycnhfYXN5bmNfYm91bmQoc3RydWN0IHY0
bDJfYXN5bmNfbm90aWZpZXIgKm5vdGlmaWVyLA0KPiANCj4gLS0NCj4gMi40OC4xDQoNCg0KQmVz
dCBSZWdhcmRzDQpDaGFuZ2h1YW5nDQo=

