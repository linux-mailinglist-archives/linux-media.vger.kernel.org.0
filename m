Return-Path: <linux-media+bounces-16449-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 678F795630B
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2024 07:11:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 879D71C21559
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2024 05:11:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8230214A4D4;
	Mon, 19 Aug 2024 05:11:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2138.outbound.protection.partner.outlook.cn [139.219.17.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FEDB149C57;
	Mon, 19 Aug 2024 05:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724044293; cv=fail; b=DAV3yTRtEaCBTgSot2Ugo1LXg1fnhGGtkDJevcIRrCcdzNBQl0uncsIC/CrBWoSF5W2X3wryN2ZyXRFoTYVPAKgdTUYm4GaivZLqGMBlOlhtgDesOkgJWxvauG3hZcirgEhXuE6C2/C10Z6uHP7TB1uFWVawFCNr/EjeCygDH8I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724044293; c=relaxed/simple;
	bh=ZffH+grZEcj3UWCAIP5tbiWP3VPt7ZGta60wiXKx3wc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hYpehknsHhc2GFAPYgemGfbm+tKL2iZOePZdEQhRCX5L8pi3a0zXz1EngXhOyarSigX21YF83yBBA7oqXqAUXJS2/xCD92HM+gc9axdzP/L9DSLKBmTs94hu4FKklnLa8URT1btW5xaphJ7sv2uSDPfmXij/3QsthsiDCf3rCtE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A6OftBXSNRQQduVfHp88tFAB4/wrToCQdp09Y3N5aeQxs99NSuOD8Eg52Behi9LOaF7NqSX/bg0UGD+TOGVZ8WeX7S5wTi7SmHmuzkGjrCUvJequPMdhIzmzgUpNH2kMzALuBncLHamCz6R1ZMZoUzbADUBnSRKVdX6acKGFDpy/gMHqVdf12vWV2dNJCbmhJeeHJftX4lV9qH/FzwzenI6JtQMFQBlE+iciAXXNuawP7p2cdKqRbN3zCO6nxKw8jfYKyHJvdOmwEellrXRjUAJdrupi2cZpshO74KMBBfBQ5E3EnmcvP5s0ExY6KpUZDr+S2o2TayhW1+z8iH0smg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZffH+grZEcj3UWCAIP5tbiWP3VPt7ZGta60wiXKx3wc=;
 b=I/Aeex1r3q1cjQkCmSgcqCDow36fINoSGxjaWQ8qT+gYFbFdIJI5EClRC39UYyMAIrAK1nvIAj3Aj6D92OGe0PZmT8pyxSpR+CWunvuBqtTMUzCt5KST61Wj3Z6sJk0ovq5/S31AGR9j0GSq92cGgCGI5Te3nmJqaB0FDNUEdycufe7bgtJ+Z1qyBl16qxe+6KxtELjy+RXbPLu6j4bfAkP1KXYehGJD1uaRf34uUmJ7ZaydaZP0hncctemeakWbtKtbaya5W5XDc4Sw0O7qMTrRql7nffgzAX6dlgEGWIBsZVj1UPfPJQXGANpvwIOB+7roxk8/JN2/2Ocj8l3Nkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9) by ZQ0PR01MB1286.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.22; Mon, 19 Aug
 2024 01:37:30 +0000
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 ([fe80::64c5:50d8:4f2c:59aa]) by
 ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn ([fe80::64c5:50d8:4f2c:59aa%3])
 with mapi id 15.20.7875.019; Mon, 19 Aug 2024 01:37:30 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Jack
 Zhu <jack.zhu@starfivetech.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-staging@lists.linux.dev"
	<linux-staging@lists.linux.dev>
Subject:
 =?utf-8?B?5Zue5aSNOiDlm57lpI06IOWbnuWkjTog5Zue5aSNOiBbUEFUQ0hdIHN0YWdp?=
 =?utf-8?B?bmc6IG1lZGlhOiBzdGFyZml2ZTogQWRkIG11bHRpcGxlIHJlc29sdXRpb24g?=
 =?utf-8?Q?support?=
Thread-Topic:
 =?utf-8?B?5Zue5aSNOiDlm57lpI06IOWbnuWkjTogW1BBVENIXSBzdGFnaW5nOiBtZWRp?=
 =?utf-8?Q?a:_starfive:_Add_multiple_resolution_support?=
Thread-Index:
 AQHakjJgnQOCOrefE0y1na0O5Q3CHLIfYLwAgAAkcMCAABXlAIAEdWGwgAARb4CAABoVkIAKON+AgAAVSIA=
Date: Mon, 19 Aug 2024 01:37:30 +0000
Message-ID:
 <ZQ0PR01MB1302CE9D6EC726D3FBE8D6EDF28C2@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
References: <20240419081955.5140-1-changhuang.liang@starfivetech.com>
 <20240809095738.GG5833@pendragon.ideasonboard.com>
 <ZQ0PR01MB1302CAAE59FA0358E7FE6BD0F2BA2@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
 <20240809132624.GB1435@pendragon.ideasonboard.com>
 <ZQ0PR01MB13029DA731711FAA57BD13A4F2852@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
 <20240812103357.GB18729@pendragon.ideasonboard.com>
 <ZQ0PR01MB130236FA891A04350CBC4245F2852@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
 <20240819001327.GK29465@pendragon.ideasonboard.com>
In-Reply-To: <20240819001327.GK29465@pendragon.ideasonboard.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ0PR01MB1302:EE_|ZQ0PR01MB1286:EE_
x-ms-office365-filtering-correlation-id: 6eb4762b-bb95-4485-eacd-08dcbfef7d73
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|41320700013|38070700018;
x-microsoft-antispam-message-info:
 yRZP9IeqBKEJWsPEoO8l1OtDmtKuc5resDxRVOXGr+PntukxRygJbCQ7u+yz6YpNtwRNIPXIiHAH4Z02cSnwmu1gsurFxaBPPG4Ygm6CbXwfgPodIeJ+2MeXWuieCuSBzfF87Rc5wU8b9DodAX8wi04j4UKSxOP7uRKuAmESP05Lq0eUC2UlilkzQaFYZHdc5MDYtKpoQ3EQlTjNQSDhoN1FTiahdvIyCBJDOfQofDCHWegxsypm9kU4S91VI1OQagCEPjeDstaGkzP5jb98Z4fCB9fiiTn/3OxmXLeXowt295nivNscbO5uvMUrVC2PG8iLWQhcvaxlP1Zaif/tjxdRCoXVyVJxmtlMMic7ZLfBmeFNKYJfA6WnE7qxYwB9ENByqsVXfQ/OThWSkJ66BO0+B2JbzKTAQm+Ejj3rsqosJb2FNkqVr1L6Oa2tVmaUizG9NRq6Sq/0t50NQpR67+6POchYA+c7LCUrnqPPhUt/NI/mZE0ofDGXzgokXcc2lBjWtO8KUC2VArY1BOVT3A7SJD+k1U1m//iZ0RztH6QK5SdmvbEl42JkY3eKq19hhIwIa2VpSIms8TzPmlsQGzA1c008VIpSa2rC0vJlQfF9aj6Plb7SyGiIqIU7mPSJ
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(41320700013)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RkU0Qnpub2IyR3FMUm5WZ1gvSVRGM1d0TjZ3RElUUWl5QkdtSFdVSkQzZy9x?=
 =?utf-8?B?KzRpbkpxeUhIdzZiMStrejdHYkl6cnV1UlJ0MkxrdncxbUxScUpmNFlabFQ4?=
 =?utf-8?B?ZkFEdFh6TC9GVHMyWCthbEtld1Jkd2ZoOXE3UXNwK3hGRW1XeGowYmRDbXo2?=
 =?utf-8?B?bTIyZDBBR3hvTVd4R3hxZ0orejRrZTRXY2dRWjRVOU0zN21iUGp4V2R6V0Vz?=
 =?utf-8?B?bnhYZ050R1pPeUsvTHFrRGFJNnpjVXpQc2pSZ3lmQTBnRGZOUkRGaXpiOWdR?=
 =?utf-8?B?M2NzbmFHMU5naG82aHBmeWZTblFIYTgrQUNvM2NJK0FJbGcxUis4RGhoTFE2?=
 =?utf-8?B?dTJ5NFZITzVNNXFWaU95K1hWOCtrLytxSEcvdzNpY244VEFKT3dMZTIxMmJm?=
 =?utf-8?B?TUY5eGRaNnNPclRHc0c5UWw5R1YxQ2tRalBEWkRuZkdmcStJOEE3VWlOWnF2?=
 =?utf-8?B?MFhuMkdlVnZrMTNDMDhBSEc1dXlEV0NwOWR1cnc0WmkxZXU0MUVNRVc0WWZF?=
 =?utf-8?B?YldBVWNibDAwNUVhOUJPTDFpRGE4TDEzRVAxQlp5M0hSQlR2VXRJUFNCdWls?=
 =?utf-8?B?Yjcva1BnZzNsSWRhc0ZHL1RFU3JJOHRsbENDSVd3dHBoSFYwbjBnOUJodVhP?=
 =?utf-8?B?aitUZUF3T2VGamlKcXJCN3NNclFFLzYzRWcvdHdtRkVSYWRoUlhmeVlQbnJL?=
 =?utf-8?B?RFhBdDFDbzJuSmRqNDFHdTVkemdNTGpYczRybUVnUUw4NjlXcWtUYXZNRlVk?=
 =?utf-8?B?ZDdrbGc2c0JFYlJBOWNyWnVmakUzaExtRlA3ZFpTSERXOEhmejdLZDZsaldq?=
 =?utf-8?B?UDZXREZvY2xJNHF1RzZIcmQ4VnVrNm5tSHQwUS9la1hIMC94MElYOXhQZ1Zy?=
 =?utf-8?B?cllnMFIvenlhQ3pFd0lBQXJyRUZGN0J5UEtsazVicVJkTW45akpTMmF2YldK?=
 =?utf-8?B?eWRSMGZOQlgwNERjb1FtOW5lVWhkMWs5U2NTWFREb3VPUnd3SzQvRlhYcEM1?=
 =?utf-8?B?MWwvcGUxOVgzeDJPemRlY3lrT3l0d2JmeXlYMS9NNmJ4WEsxK0oxWTIyODNm?=
 =?utf-8?B?bXRxTGNvMEc2Mndxa05PaXFZdTJKWjJLN2RxYk92eVZjeGkzV3pYM1R2SXRN?=
 =?utf-8?B?bk5DeEU1d0lSV2ZxQ3VIcDNKOGJqcmJCalhvNEkybi9LZXlLaWxVb0psbWJr?=
 =?utf-8?B?ZjM4ZkpMaFhydGh0VTlUY3Y0Ukk0OStneHFKS1ZwZzRMZ2hJSVFxbjRWNm84?=
 =?utf-8?B?ZGhjcjgyWkIzazhEaVhxK2xCdVF1MjRLdjBTTGk3YWVwRHpHZVk2MmRZSFdF?=
 =?utf-8?B?L3JmaUJuMFE2MlZDSGNXRkhlbVdNdHdUVElKSTRjZjRmSUNvakZpNVIwc0N5?=
 =?utf-8?B?d0dKbmRJdFJBNnRmNURKUTNFSkpRUUp6SzBuMCt6N01WWXp6UWZadlRlb0hh?=
 =?utf-8?B?NGszWDg1dDl1cVUzS3liOFN2WlBTTDdjRnpBSlR0VHp5N3E5TzhIN1g1Si9G?=
 =?utf-8?B?dDIvVnBKQWxqZS9CNTE4NzBDaVVsV2hGUzJNdFN2L1I3cm50NEFFU2ZzN1By?=
 =?utf-8?B?UUZNbEF1K3hVUit6dXVibzY5bnhlZEFYMzY2S1pJMFFTenhpWlBhNFV4dGdu?=
 =?utf-8?B?ZU4ydUwybndQd2NHMklmSmZzTm51R25Ia0E3VzVnb1JlV3BQcE8yOXlwY1BK?=
 =?utf-8?B?djF2cmxGanZ3VVlONU4zcVJnY3orbFI2WHRxNmZRYUNpaExpMENuZ0E5bTU4?=
 =?utf-8?B?SlBydlQzTXpBR0MwSHM2NEtrNHRnMnBoU01yWnZ6dEUvY0tuZ2szakVqYXg2?=
 =?utf-8?B?d1k4cHoxRUxXSHdLaEkvMTRJZ2xBdUdsazRYMXVXazNoaXllTUZWYmhlcTdw?=
 =?utf-8?B?RUdIQzFyTmpHSjFrQ3BTMmZmOVVjRlBwbmFaNnJhbGl4dURVeEVYa2VjZ0pI?=
 =?utf-8?B?TVFGU2NNV1d0WUZkNVBrQi9JOG9vek1LZmpqOVFqS1NmcktkYURoZXF0dDkz?=
 =?utf-8?B?NFo3a2xXNFpRdWZINTdHS0l1NXd3RVcrS1ExVzVpK09FV21sK3NNOERWaUhn?=
 =?utf-8?B?WGpLRHNWeTlqS0lKVjlWYzFUT28yZnFMZjBMYmtwc2tLSlZkcDlXZmFjNEpn?=
 =?utf-8?B?QUN3Y1BZcmh4enRoMythbkc2Tk8zeG5oRStpMm1LL01vYUZ2NWRzalpLU2lM?=
 =?utf-8?B?dVE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eb4762b-bb95-4485-eacd-08dcbfef7d73
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2024 01:37:30.2086
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5jvnGw7DR6axp56e33+RPForc5a6Smxtn593mJ2ZMgdq1viLlAuzonSTRvmAV4EEbnQ1g3x25UNu8zLWqajM6Il258rg9dy/ovM2NY9122dTMuBfUSZfEZUJ/wFMcKV1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1286

SGksIExhbnJlbnQNCg0KPiANCj4gT24gTW9uLCBBdWcgMTIsIDIwMjQgYXQgMTI6MTM6MDNQTSAr
MDAwMCwgQ2hhbmdodWFuZyBMaWFuZyB3cm90ZToNCj4gPiA+IE9uIE1vbiwgQXVnIDEyLCAyMDI0
IGF0IDA5OjQzOjQ3QU0gKzAwMDAsIENoYW5naHVhbmcgTGlhbmcgd3JvdGU6DQo+ID4gPiA+ID4g
T24gRnJpLCBBdWcgMDksIDIwMjQgYXQgMTI6MTI6MDFQTSArMDAwMCwgQ2hhbmdodWFuZyBMaWFu
ZyB3cm90ZToNCj4gPiA+ID4gPiA+ID4gT24gRnJpLCBBcHIgMTksIDIwMjQgYXQgMDE6MTk6NTVB
TSAtMDcwMCwgQ2hhbmdodWFuZyBMaWFuZw0KPiB3cm90ZToNCj4gPiA+ID4gPiA+ID4gPiBBZGQg
bXVsdGlwbGUgcmVzb2x1dGlvbiBzdXBwb3J0IGZvciB2aWRlbyAiY2FwdHVyZV9yYXciIGRldmlj
ZS4NCj4gPiA+ID4gPiA+ID4gPiBPdGhlcndpc2UgaXQgd2lsbCBjYXB0dXJlIHRoZSB3cm9uZyBp
bWFnZSBkYXRhIGlmIHRoZSB3aWR0aCBpcyBub3QNCj4gMTkyMC4NCj4gPiA+ID4gPiA+ID4gPg0K
PiA+ID4gPiA+ID4gPiA+IEZpeGVzOiBlMDgwZjMzOWM4MGEgKCJtZWRpYTogc3RhZ2luZzogbWVk
aWE6IHN0YXJmaXZlOiBjYW1zczoNCj4gPiA+ID4gPiA+ID4gPiBBZGQgY2FwdHVyZSBkcml2ZXIi
KQ0KPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQ2hhbmdo
dWFuZyBMaWFuZw0KPiA+ID4gPiA+ID4gPiA+IDxjaGFuZ2h1YW5nLmxpYW5nQHN0YXJmaXZldGVj
aC5jb20+DQo+ID4gPiA+ID4gPiA+ID4gLS0tDQo+ID4gPiA+ID4gPiA+ID4gIGRyaXZlcnMvc3Rh
Z2luZy9tZWRpYS9zdGFyZml2ZS9jYW1zcy9zdGYtY2FwdHVyZS5jIHwgNQ0KPiA+ID4gPiA+ID4g
PiA+ICsrKystDQo+ID4gPiA+ID4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkNCj4gPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+IGRpZmYg
LS1naXQNCj4gPiA+ID4gPiA+ID4gPiBhL2RyaXZlcnMvc3RhZ2luZy9tZWRpYS9zdGFyZml2ZS9j
YW1zcy9zdGYtY2FwdHVyZS5jDQo+ID4gPiA+ID4gPiA+ID4gYi9kcml2ZXJzL3N0YWdpbmcvbWVk
aWEvc3RhcmZpdmUvY2Ftc3Mvc3RmLWNhcHR1cmUuYw0KPiA+ID4gPiA+ID4gPiA+IGluZGV4IGVj
NTE2OWU3YjM5MS4uOWU4NTNmZjI1OTZhIDEwMDY0NA0KPiA+ID4gPiA+ID4gPiA+IC0tLSBhL2Ry
aXZlcnMvc3RhZ2luZy9tZWRpYS9zdGFyZml2ZS9jYW1zcy9zdGYtY2FwdHVyZS5jDQo+ID4gPiA+
ID4gPiA+ID4gKysrIGIvZHJpdmVycy9zdGFnaW5nL21lZGlhL3N0YXJmaXZlL2NhbXNzL3N0Zi1j
YXB0dXJlLmMNCj4gPiA+ID4gPiA+ID4gPiBAQCAtMTc3LDkgKzE3NywxMiBAQCBzdGF0aWMgdm9p
ZCBzdGZfY2hhbm5lbF9zZXQoc3RydWN0DQo+ID4gPiA+ID4gPiA+ID4gc3RmY2Ftc3NfdmlkZW8N
Cj4gPiA+ID4gPiA+ID4gPiAqdmlkZW8pICB7DQo+ID4gPiA+ID4gPiA+ID4gIAlzdHJ1Y3Qgc3Rm
X2NhcHR1cmUgKmNhcCA9IHRvX3N0Zl9jYXB0dXJlKHZpZGVvKTsNCj4gPiA+ID4gPiA+ID4gPiAg
CXN0cnVjdCBzdGZjYW1zcyAqc3RmY2Ftc3MgPSBjYXAtPnZpZGVvLnN0ZmNhbXNzOw0KPiA+ID4g
PiA+ID4gPiA+ICsJc3RydWN0IHY0bDJfcGl4X2Zvcm1hdCAqcGl4Ow0KPiA+ID4gPiA+ID4gPg0K
PiA+ID4gPiA+ID4gPiBUaGlzIHZhcmlhYmxlIGNhbiBiZSBjb25zdCBhcyB5b3UgZG9uJ3QgbW9k
aWZ5IHRoZSBmb3JtYXQuDQo+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gIAl1MzIgdmFs
Ow0KPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gIAlpZiAoY2FwLT50eXBlID09IFNU
Rl9DQVBUVVJFX1JBVykgew0KPiA+ID4gPiA+ID4gPiA+ICsJCXBpeCA9ICZ2aWRlby0+YWN0aXZl
X2ZtdC5mbXQucGl4Ow0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiBBbmQgaXQgY2FuIGJl
IGRlY2xhcmVkIGFuZCBpbml0aWFsaXplZCBoZXJlOg0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+
ID4gPiAJCWNvbnN0IHN0cnVjdCB2NGwyX3BpeF9mb3JtYXQgKnBpeCA9DQo+ID4gPiA+ID4gPiA+
ICZ2aWRlby0+YWN0aXZlX2ZtdC5mbXQucGl4Ow0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4g
PiA+ICsNCj4gPiA+ID4gPiA+ID4gPiAgCQl2YWwgPSBzdGZfc3lzY29uX3JlZ19yZWFkKHN0ZmNh
bXNzLA0KPiBWSU5fQ0hBTk5FTF9TRUxfRU4pOw0KPiA+ID4gPiA+ID4gPiA+ICAJCXZhbCAmPSB+
VTBfVklOX0NIQU5ORUxfU0VMX01BU0s7DQo+ID4gPiA+ID4gPiA+ID4gIAkJdmFsIHw9IENIQU5O
RUwoMCk7DQo+ID4gPiA+ID4gPiA+ID4gQEAgLTE5Myw3ICsxOTYsNyBAQCBzdGF0aWMgdm9pZCBz
dGZfY2hhbm5lbF9zZXQoc3RydWN0DQo+IHN0ZmNhbXNzX3ZpZGVvICp2aWRlbykNCj4gPiA+ID4g
PiA+ID4gPiAgCQl2YWwgfD0gUElYRUxfSEVJR0hfQklUX1NFTCgwKTsNCj4gPiA+ID4gPiA+ID4g
Pg0KPiA+ID4gPiA+ID4gPiA+ICAJCXZhbCAmPSB+VTBfVklOX1BJWF9DTlRfRU5EX01BU0s7DQo+
ID4gPiA+ID4gPiA+ID4gLQkJdmFsIHw9IFBJWF9DTlRfRU5EKElNQUdFX01BWF9XSURUSCAvIDQg
LSAxKTsNCj4gPiA+ID4gPiA+ID4gPiArCQl2YWwgfD0gUElYX0NOVF9FTkQocGl4LT53aWR0aCAv
IDQgLSAxKTsNCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gSXMgdGhlcmUgbm8gbmVlZCB0
byBjb25zaWRlciB0aGUgaW1hZ2UgaGVpZ2h0IGFzIHdlbGwgPyBIb3cNCj4gPiA+ID4gPiA+ID4g
ZG9lcyB0aGUgZHJpdmVyIHByZXZlbnQgYnVmZmVyIG92ZXJmbG93cyBpZiB0aGUgc2Vuc29yIHNl
bmRzIG1vcmUNCj4gZGF0YSB0aGFuIGV4cGVjdGVkID8NCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4g
PiBPdXIgaGFyZHdhcmUgd2lsbCBjb25maXJtIGEgZnJhbWUgb2YgZGF0YSB0aHJvdWdoIHZibGFu
aw0KPiA+ID4gPiA+ID4gc2lnbmFsLCBzbyB0aGVyZSBpcyBubyBpbWFnZSBoZWlnaHQgY29uZmln
dXJhdGlvbi4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFdoYXQgaGFwcGVucyBpZiB0aGUgc3lzdGVt
IGV4cGVjdHMsIGZvciBpbnN0YW5jZSwgYSAxOTIweDEwODANCj4gPiA+ID4gPiBSQVc4IGltYWdl
LCBhbmQgYWxsb2NhdGVzIGEgYnVmZmVyIG9mIG9mIDE5MjB4MTA4MCBieXRlcywgYnV0DQo+ID4g
PiA+ID4gdGhlIHNlbnNvciBvdXRwdXRzIG1vcmUgbGluZXMgPyBEb2VzIHRoZSBjYW1lcmEgaGFy
ZHdhcmUgaW4gdGhlDQo+ID4gPiA+ID4gU29DIG9mZmVyIGFuIG9wdGlvbiB0byBwcmV2ZW50IGJ1
ZmZlciBvdmVycnVucyA/DQo+ID4gPiA+DQo+ID4gPiA+IFRoZSBoYXJkd2FyZSBjYW4gY29uZmly
bSB0aGUgaW1hZ2UgaGVpZ2h0IGJ5IHVzaW5nIHRoZSBWU1lOQyBzaWduYWwuDQo+ID4gPiA+DQo+
ID4gPiA+IEltYWdlIHdpbGwgdHJhbnNmZXIgd2hlbiBWU1lOQyBpcyBoaWdoLg0KPiA+ID4gPg0K
PiA+ID4gPiBWU1lOQyB0aW1lID0gKHdpZHRoICsgaF9ibGFuaykgKiBoZWlnaHQ7DQo+ID4gPg0K
PiA+ID4gV2hhdCBJJ20gdHJ5aW5nIHRvIHVuZGVyc3RhbmQgaXMgd2hhdCBoYXBwZW5zIGlmIHRo
ZSBJU1AgaXMNCj4gPiA+IGNvbmZpZ3VyZWQgZm9yDQo+ID4gPiAxMDgwIGxpbmVzLCBidXQgdGhl
IGNhbWVyYSBzZW5zb3Igc2VuZHMgbW9yZSB0aGFuIDEwODAgbGluZXMgKHRoZQ0KPiA+ID4gVlNZ
TkMgc2lnbmFsIGlzIGFjdGl2ZSBmb3IgbW9yZSB0aGFuIDEwODAgbGluZXMpLiBXaGVyZSBpbiB0
aGUNCj4gPiA+IGRyaXZlciBpcyB0aGUgaGFyZHdhcmUgY29uZmlndXJlIHdpdGggdGhlIDEwODAg
bGluZXMgbGltaXQgdG8gYXZvaWQgYnVmZmVyDQo+IG92ZXJmbG93cyA/DQo+ID4NCj4gPiBJZiBp
cyAiY2FwdHVyZV9yYXciIHZpZGVvIGRldmljZSwgbm8gaW1hZ2UgaGVpZ2h0IGNhbiBiZSBjb25m
aWd1cmVkLg0KPiANCj4gSW4gdGhhdCBjYXNlIHdoYXQgaGFwcGVucyBpZiB0aGUgY2FtZXJhIHNl
bnNvciBzZW5kcyBtb3JlIGxpbmVzIHRoYW4NCj4gZXhwZWN0ZWQgPyBXaWxsIHRoZSByYXcgdmlk
ZW8gZGV2aWNlIHdyaXRlIHBhc3QgdGhlIGVuZCBvZiB0aGUgYnVmZmVyID8NCg0KWWVzLCB0aGUg
YnVmZmVyIHdpbGwgb3ZlcmZsb3dzLCBzbyB3ZSB3aWxsIHVzZSB0aGUgc29mdHdhcmUgcmVzdHJp
Y3Rpb25zLg0KSW1wbGVtZW50IC5saW5rX3ZhbGlkYXRlIGhvb2tzIGZvciB0aGUgQ1NJMlJYIHN1
YmRldiBhbmQgImNhcHR1cmVfcmF3IiB2aWRlbyBkZXZpY2UuDQoNCj4gSWYgc28sIGlzIHRoZXJl
IGEgd2F5IHRvIGd1YXJkIGFnYWluc3QgdGhhdCA/DQo+IA0KPiA+IElmIGlzICJjYXB0dXJlX3l1
diIgdmlkZW8gZGV2aWNlLCBpdCB3aWxsIGJlIHNldCBieSBzdGZfaXNwX2NvbmZpZ19jcm9wLg0K
PiANCj4gVGhhbmsgeW91LCB0aGF0J3MgdGhlIGluZm9ybWF0aW9uIEkgd2FzIGxvb2tpbmcgZm9y
Lg0KPiANCg0KUmVnYXJkcywNCkNoYW5naHVhbmcNCg==

