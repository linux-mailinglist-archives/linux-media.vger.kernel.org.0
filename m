Return-Path: <linux-media+bounces-26315-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5FEA3A723
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 20:14:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6572F1897A49
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 19:13:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5603926F47E;
	Tue, 18 Feb 2025 19:10:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2103.outbound.protection.partner.outlook.cn [139.219.146.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E291E520D;
	Tue, 18 Feb 2025 19:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739905824; cv=fail; b=VD9/MhIVkm3XH7ayV/4wW3GVhRjENzN7W+fBI4VLCNR7gFyyjEkUAnZuRdMgt6MiXRMsX7BQGKbhPqHW2WcIYbt3TGBpcV9NiHAG8KiHre/b3nzjUQGYdW6dUNTlBp14Tfor1JU2TzCYr+j54ih263M8H8/V4st3pG+7dfW6BJ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739905824; c=relaxed/simple;
	bh=aQLegHkFySJBifj5iiknYqoVxnQXPI+PPn9BQReboYg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mFTYw5kEbK2j2sSQOZyc+d+1oY+GUXqLb+mNjW7+2hLR3QbburdgvDNvWmEqpfknDewaKOF1uhUvvQvcKx6PKRAQcbBvlCtGVQtaFsQRF1SF1zFiQOsQ8h5Oirl3TXcWiaoeU3ntdBtHmxfqNdDHX8EGOO1VtRUWWK84y8LvU8s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eL3VjyFgNErapw2SczmG1gVBrXIbqNoxlTgoVDEH+Pvg6FiyqLxUom68u+B1dWMghszZE4CCgVyzRnxG0zfFrBS4afRP+NXMyYhbafH4ZNk0PEqppi4WVFT2Mk8aFIcjuBP8VwTQiY5FsQXHlHQal0/9Veoz+7EtSH3FFjSS7ftUGhf1mSJPrUqISGeheA/LxUgbet1Nm5cBgkteKplZoIZW78BtTxhMtAyhuWvZ9FxMFzDPH5xKG+TLOju0uznLY/VECIEEWGc5PlLY1RdW6IIJzLfpjaKfFdMmUl76iFyAZ7xCiDzIGfqjY4T1rOO2rx9ljrtl2XfHHe5+INQNDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aQLegHkFySJBifj5iiknYqoVxnQXPI+PPn9BQReboYg=;
 b=m0ItbE+cX9kqWkkIH1N4GuZTsSdYszbWuy4MVFu2mGVqb4iE7ZPvGqSj9t7Iv8GrROftxrjJmTxen/wi3Kn/X73kEdUiwJ4MHeBNABd7NMQTvdg+oAcWurYcdsR0JsVV0hyTjLR6Hzw+U0//dw0gUgIgYi4f13PqqOOaVA2IOlFWTE9Ro0OA4yFP5GJ7YZvNMZhgaRwtrJqSlYpdPp6mIei3mj2a2Yzjd19MOMeGhHnnZiQ4anhUWXpoAPUEtnCohviSCxD3H92s2CtwSHHIluuvDtbdZXQyPuA/wUtuwNoqLPbpgz3jP9Jo7grxj2d3UPIGXFQJlaHkoI/ZEU5FPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9) by ZQ0PR01MB0981.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.8; Tue, 18 Feb
 2025 09:35:50 +0000
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 ([fe80::64c5:50d8:4f2c:59aa]) by
 ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn ([fe80::64c5:50d8:4f2c:59aa%3])
 with mapi id 15.20.8445.007; Tue, 18 Feb 2025 09:35:50 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Jai Luthra <jai.luthra@linux.dev>, Yemike Abhilash Chandra
	<y-abhilashchandra@ti.com>, "mripard@kernel.org" <mripard@kernel.org>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"mchehab@kernel.org" <mchehab@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "devarsht@ti.com"
	<devarsht@ti.com>, "vaishnav.a@ti.com" <vaishnav.a@ti.com>,
	"r-donadkar@ti.com" <r-donadkar@ti.com>, "u-kumar1@ti.com" <u-kumar1@ti.com>
Subject:
 =?gb2312?B?u9i4tDogW1BBVENIIHYyIDEvMl0gZHQtYmluZGluZ3M6IG1lZGlhOiBjZG5z?=
 =?gb2312?B?LGNzaTJyeC55YW1sOiBBZGQgb3B0aW9uYWwgaW50ZXJydXB0cyBmb3IgY2Ru?=
 =?gb2312?Q?s-csi2rx?=
Thread-Topic: [PATCH v2 1/2] dt-bindings: media: cdns,csi2rx.yaml: Add
 optional interrupts for cdns-csi2rx
Thread-Index: AQHbgd+gTxBJdZtND0WvUscTrn+5nrNMy3zg
Date: Tue, 18 Feb 2025 09:35:50 +0000
Message-ID:
 <ZQ0PR01MB13022FE965643879D8794733F2FAA@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
References: <20250217130013.2802293-1-y-abhilashchandra@ti.com>
 <20250217130013.2802293-2-y-abhilashchandra@ti.com>
 <m6ijg5colbev6lyhiobblecb4wlvwezpccibnso26gd3dadrfh@twgul4eel6hg>
In-Reply-To: <m6ijg5colbev6lyhiobblecb4wlvwezpccibnso26gd3dadrfh@twgul4eel6hg>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ0PR01MB1302:EE_|ZQ0PR01MB0981:EE_
x-ms-office365-filtering-correlation-id: db48366c-4762-40d1-2a2e-08dd4fffa1a7
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|41320700013|1800799024|7416014|38070700018;
x-microsoft-antispam-message-info:
 46HjOoTfraJdG2lDjViLZPwhbIFZnM1+fznVOlR4nNZZl+Lfh5v8NeG73fHKE5tIuJxiVNUbQjMQFzPVZ9wc6sb67l/MV1yZWDSnh6+G5bijutQs62I74vsA8asOXGCAphzoqPmvNVoEdc1q1vV7XKYeTeIltHn3w8Y/OmrAgc6kLqf9cwoxn/93cUjvLTVt36LFf6yRXtFp9laICdjogF37u8dqB+MsU5qRCPazqtMBp3Vatx2bgw9D8HewNg5KriZDeJdDFKmFUDZybfELhgC5p5Q2UKV99PdorQZIMCl8GWjPXZbRYSfy9mo/8FYcdqR/bsljMVwR1Ha0l3Zv5gCsL9CJ/0blEg93+6oGMXUHH11xzUib4azY1zq/9QWdxvdDJusEcvCT/p0ZCo36JkX7jtMYxYns6smxYsIYAezZaQy08NgWJr35XJhOcOEcCwglgwS89czwohPIW5479L8cb9ccaF3TY+YeMeC32g0IaivOZ0DeLy850vosUTLMigIsfMKuT1aNl3EwjBsc1eWx5olg1W1pwpWIUkxmC1MltFOauP3wowfBsfzMShpjvjRO0knCJep1yrVBOz/XhO4FQz/x6fIYjIaKFEEXtaw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(41320700013)(1800799024)(7416014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?Zjdoa1VXMldZcG9PblN2aDY5b0FWWG4yVUNxaldHRUlPMDczMlVjVDJKY3N6?=
 =?gb2312?B?L1JOR25ZSnJ4U2hZTnFPR2VCNFBST3F5OFc4dXNMTjlWQW9oVndwUFEzeWRq?=
 =?gb2312?B?L2N0YnVCT2gyejlQVzR5am9yM1N4dU9YMTJQWktoNFVldjIvcGRQT2kzeXYv?=
 =?gb2312?B?ckhXQlF3MGlERm4xZWFyK0crZmE0aHlIQ2I2YUljUWRJakg0NmtkdGtrOFEx?=
 =?gb2312?B?WCtZMDNSMXprcVJmczZ5eWw3OEVPZGVyTGtyV1ErcmhDZHZMRytkTHhsWkV4?=
 =?gb2312?B?U3pmRDBSbXVyK2RLM29CbC9Oc2FZR0tQWVZub012RkI1WS9CeENwM3oyYnky?=
 =?gb2312?B?YUNLdGRNc2tUanhyRmVYYnNXSWNDeXhCVWlNYzRicm5oVGxHU2lDSkwvMVpt?=
 =?gb2312?B?eWF6MklmTnE0bjhxWm9pY2w5eFU4V2xNMHRZZ0Vzd2VMVHZCUzVQdVRyaEtB?=
 =?gb2312?B?U20vNnlxRnQxT0l5cDRvWGZqeElSMERhMDZxbUxwa0MrN2V2SlNRaks3a2FE?=
 =?gb2312?B?VmtYNCtNaXA0M2xyRmZyZHR3anY0T3lhNXNCcWtveVJ2NS9RV2ZVLzVKcHRp?=
 =?gb2312?B?K3I5RHdqVlQzQy93bjdZL1M4VzNmYndPYlF5aHdJbCtuNDY5QWozaUptYUdM?=
 =?gb2312?B?Zm5hMEgxRldKT0ltNGxsMVgzenh4Rk56WnJnYk5LSmVLZmdRaklJejE3dEhJ?=
 =?gb2312?B?bitTeUFJNUxOS3kxa3R1SjJKWjdDTDd0TWNvcDVjVjRXbFMrUUliZWM5YnFP?=
 =?gb2312?B?UlU0bVBQMTVRN0JyRitURE5UOXZHQUovUDVDcUhaWXJIaXgwMFpsbWpMNmhl?=
 =?gb2312?B?MU90ei9DcGZHNFB4ZEZvRytPeEVibElrb0ZFajZ2VS81UFd2RmpVcDI5cDdr?=
 =?gb2312?B?eFF4QjdRaGFhNWFIczh3bXBOOHVVa3IwNWVqOFdFQ2RDaU0xdEpuVnNJQ0J5?=
 =?gb2312?B?OEZyOUcvQkhXV21pWmNZZHZocC9lMGNzOUNJNUNWYUZNQzV2bC9qUjZIbWxR?=
 =?gb2312?B?NUkzdzVjMU9zbnd0bys5R0YyQjRwSXpIOXpHZWRPbDRYSGh2ZGtaWCsrWldR?=
 =?gb2312?B?cDZZR2pTN3JCdDF3UlFDOHV0TlY4RkZUWUFiVVdFWngvSys1cC9VQzNrQzYy?=
 =?gb2312?B?aWFLaFMwWlV0QUZhMnIxRjNXeUdEQWRRTmZpbWJQM3k3UTc0bjV0b040SWM0?=
 =?gb2312?B?YUJLR0liSXpVbzh3bm9wQ3lxZGpOQkNPK00wYkF4Q3FwcUtlT2FrWW5Nc3dN?=
 =?gb2312?B?cVRlQm9GMmRvOTVmSUppYmlqNFJRUlkzV0l0U2JWZm1LR09zVEZ4Vkhvd1pm?=
 =?gb2312?B?U1cvSmRTN01ZVzVaTjdObUZXcVZ3aktQNzljd2RwaTV5UW5BeGtib2svMWxz?=
 =?gb2312?B?NTdwWUJIU0J0SkxBK2o2WnRMOTV5LzhXNjgrS21rZFV5VGpnejdvaE51azBB?=
 =?gb2312?B?b2E5RXRNb29EYTVHZ1pkaHJ6Tk5NSk52K3F5RU42ajI4Rm1kWiswUXJLWHNu?=
 =?gb2312?B?b21qUHMveDZUR0RoZm1TTnlRaTloOElNb2Q2amo1ZFk0aHV6cjU3NnNRRHlD?=
 =?gb2312?B?S2pvQS9IY01CQ3hCZGpFajhBbDZaMVZJRmlDSVpSVjFNdy9wejM1dkZ6cnVh?=
 =?gb2312?B?ZlBQYlYvQUNHbExUelZaVGJEeTZoWFRuZm1kQjdhWVZtcnl5RVRhWHprYVp5?=
 =?gb2312?B?NU5LcDRSbVd3UWV0YmxscEZUaHJ2UDY0MnEzNDRGOUhZVERCZFJkMkExWE1h?=
 =?gb2312?B?THVrZURNdzdDMGdPNlVHdTdyaWhoU3FHc2FCdHFWRkd4TWNpMGUxdEJ5WU9v?=
 =?gb2312?B?TXNTOS96Y3hSK3BBUEJpdktVeXJGQ0F4WkxCS3JIRHIzWWRUZFhKZFpEU0JE?=
 =?gb2312?B?K3U5c0lCYnR4bG12VGp5c29GKzV0VUMwcHY5MnlqWXNxaVBQbUxBMWVGZldE?=
 =?gb2312?B?WTBDS3MvRUN3NXZadTN4NjY1SlBVZy8zc2ZPNUs3VEFIMWZ6RDN4L2xyN1Ro?=
 =?gb2312?B?dWc4bzEvTUJlSThIWDRpUU8rck1Bd01VTnhjZEc5KzZiazdPL2hPbXFjSlpz?=
 =?gb2312?B?SjZCL3g4RWpXNElHa1dXc1c5REh6a3NEOWNPZ3dxY2NDMHVYZ3U1QkNoQ0w1?=
 =?gb2312?B?cC9kLzJiT1BZK0tJK0JCOWkxb0tsd3U3ZnBvOC9Gc3ZqMnFOQ0t2U0Q0TGJX?=
 =?gb2312?B?dGc9PQ==?=
Content-Type: text/plain; charset="gb2312"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: db48366c-4762-40d1-2a2e-08dd4fffa1a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2025 09:35:50.3628
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g2VCX5VYa2QJ6eIRrEYczDbZrhzqMrA0kNDu5QNrKHhzP+kAxeBQt5LuKheI2W49L7GBJbVfOFS92IGYZ8dVx4AiYIsWCfhEy6dTAlLpmQAbDcarekv+8pWvAUASjNZe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB0981

SGkgSmFpLCBBYmhpbGFzaA0KDQo+IEhpIEFiaGlsYXNoLA0KPiANCj4gT24gTW9uLCBGZWIgMTcs
IDIwMjUgYXQgMDY6MzA6MTJQTSArMDUzMCwgWWVtaWtlIEFiaGlsYXNoIENoYW5kcmEgd3JvdGU6
DQo+ID4gVGhlIENhZGVuY2UgQ1NJMlJYIElQIGV4cG9zZXMgMyBpbnRlcnJ1cHRzIFswXSAxMi43
IGNhbWVyYSBzdWJzeXN0ZW0uDQo+ID4gRW5hYmxpbmcgdGhlc2UgaW50ZXJydXB0cyB3aWxsIHBy
b3ZpZGUgYWRkaXRpb25hbCBpbmZvcm1hdGlvbiBhYm91dCBhDQo+ID4gQ1NJIHBhY2tldCBvciBh
biBpbmRpdmlkdWFsIGZyYW1lLiBTbywgYWRkIHN1cHBvcnQgZm9yIG9wdGlvbmFsDQo+ID4gaW50
ZXJydXB0cyBhbmQgaW50ZXJydXB0LW5hbWVzIHByb3BlcnRpZXMuDQo+ID4NCj4gPiBbMF06IGh0
dHA6Ly93d3cudGkuY29tL2xpdC9wZGYvc3BydWlsMQ0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTog
WWVtaWtlIEFiaGlsYXNoIENoYW5kcmEgPHktYWJoaWxhc2hjaGFuZHJhQHRpLmNvbT4NCj4gPiAt
LS0NCj4gPg0KPiA+IENoYW5nZXMgaW4gdjI6DQo+ID4gLSBBZGRyZXNzIEtyenlzenRvZidzIHJl
dmlldyBjb21tZW50IHRvIHJlbW92ZSBmbGV4aWJpbGl0eSB3aGlsZSBhZGRpbmcNCj4gPiAgIGlu
dGVycnVwdHMuDQo+ID4NCj4gPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvY2Rucyxj
c2kycngueWFtbCAgICAgICAgIHwgMTANCj4gKysrKysrKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgMTAgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9jZG5zLGNzaTJyeC55YW1sDQo+ID4gYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvY2Rucyxjc2kycngueWFtbA0KPiA+IGlu
ZGV4IDIwMDhhNDdjMDU4MC4uZjMzNTQyOWNiZGU5IDEwMDY0NA0KPiA+IC0tLSBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9jZG5zLGNzaTJyeC55YW1sDQo+ID4gKysr
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL2NkbnMsY3NpMnJ4Lnlh
bWwNCj4gPiBAQCAtMjQsNiArMjQsMTYgQEAgcHJvcGVydGllczoNCj4gPiAgICByZWc6DQo+ID4g
ICAgICBtYXhJdGVtczogMQ0KPiA+DQo+ID4gKyAgaW50ZXJydXB0czoNCj4gPiArICAgIG1pbkl0
ZW1zOiAzDQo+ID4gKyAgICBtYXhJdGVtczogMw0KPiA+ICsNCj4gPiArICBpbnRlcnJ1cHQtbmFt
ZXM6DQo+ID4gKyAgICBpdGVtczoNCj4gPiArICAgICAgLSBjb25zdDogaW5mbw0KPiA+ICsgICAg
ICAtIGNvbnN0OiBlcnJvcg0KPiA+ICsgICAgICAtIGNvbnN0OiBtb25pdG9yDQo+ID4gKw0KPiAN
Cj4gSG93IG1hbnkgaW50ZXJydXB0IGxpbmVzIGFyZSBhY3R1YWxseSBleHBvc2VkIGJ5IHRoZSBD
YWRlbmNlIElQPw0KDQpJIG9ubHkgc2VlIHRoYXQgdGhlIENhZGVuY2UgSVAgZXhwb3NlcyB0d28g
aW50ZXJydXB0IGxpbmVzOiBpcnEgYW5kIGVycl9pcnEuIElmIHRoZXJlIGFyZSBhbnkgbWlzdGFr
ZXMsIA0KcGxlYXNlIGhlbHAgY29ycmVjdCB0aGVtLg0KDQo+IEl0IGlzIG5vdCBjbGVhciB0byBt
ZSBmcm9tIHRoZSBUUk0gWzBdLiBGcm9tIHRoZSAiVGFibGUgMTItMTUyNC4gQ1NJX1JYX0lGDQo+
IEhhcmR3YXJlIFJlcXVlc3RzIiBpdCBsb29rcyBsaWtlIHRoZXJlIGFyZSB0aHJlZSBzZXBhcmF0
ZSBpbnRlcnJ1cHQgbGluZXMNCj4gQ1NJX0VSUl9JUlEsIENTSV9JUlEgYW5kIENTSV9MRVZFTCwg
d2hpY2ggYXJlIHJvdXRlZCB0byB0aGUgQXJtIGNvcmUvR0lDLg0KPiBBbmQgZm91ciBsaW5lcyBm
b3IgdGhlIEFTRiBzdWJtb2R1bGUgKD8pIHRoYXQgYXJlIG5vdCByb3V0ZWQgdG8gR0lDLg0KPiAN
Cj4gVGhpcyBkb2VzIG5vdCBtYXRjaCB3aXRoIHRoZSBlcnJvciwgaW5mbyBhbmQgbW9uaXRvciBs
aW5lIG5hbWVzIG1lbnRpb25lZA0KPiBoZXJlLg0KPiANCj4gSW4gbXkgdW5kZXJzdGFuZGluZyB3
aGljaCBpbnRlcnJ1cHQgbGluZXMgYXJlIGFjdHVhbGx5IGludGVncmF0ZWQgd2lsbCB2YXJ5DQo+
IGZyb20gU29DIHRvIFNvQywgc28gcGxlYXNlIGNoZWNrIHdoYXQgYXJlIHRoZSBhY3R1YWwgaW50
ZXJydXB0IGxpbmUgbmFtZXMNCj4gZXhwb3NlZCBieSB0aGUgQ2FkZW5jZSBJUC4gTWF5YmUgTWF4
aW1lIGtub3dzIG1vcmUuDQo+IA0KPiBCdXQgSSBkb24ndCB0aGluayBpdCBpcyBjb3JyZWN0IHRv
IG1ha2UgYWxsIDMgbWFuZGF0b3J5IHRvZ2V0aGVyLCBhcyBzb21lDQo+IHZlbmRvcnMgbWF5IG9u
bHkgaW50ZWdyYXRlIHRoZSBlcnJvciBpbnRlcnJ1cHQgaWdub3JpbmcgdGhlIHJlc3QuDQoNCkFn
cmVlZC4NCg0KQmVzdCBSZWdhcmRzLA0KQ2hhbmdodWFuZw0K

