Return-Path: <linux-media+bounces-15005-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3A9930C6C
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2024 03:52:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5CE461C20D40
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2024 01:52:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CFAF5223;
	Mon, 15 Jul 2024 01:52:42 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2109.outbound.protection.partner.outlook.cn [139.219.17.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB69256D;
	Mon, 15 Jul 2024 01:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721008362; cv=fail; b=G9nbm+ZNfWPnqfCHIDkCHyollg43vvcwhhX7Lfvd79m2llsuNuIREQ3NOCrz7Sfdh+Z6eNUJ/LGDZKjXGpqj96i8I/emRsZg7G/VqYvYGprP3fDyC6ImC0fFgalE+REqEXjyHBS6eKYqncSXQvP0F31twXUN9LGB0EA1uqjl3YU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721008362; c=relaxed/simple;
	bh=QvKclbm1HMtFWlt3U1qZrfqf7I9qKEAMjBFaHNgJNd8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=I1xqKCMYBXgXnQBlW96ADsqd1jZ6kiTjoUTYsvuT8/xTpydPTuXU51qtUHT6c97PO4Wa7mKQemC/1Lj+SYuOq5imBdBe2wUD9n4CPEbLpV0Lmko3pz9PIQufhfGzJmlee2TLEsJn497L5cw1I1kqOqMnNFLYMt7TcN6c20rx2pQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VWfmt1fpq8IjWEshIudvP5X4D+yigtRkE2wxnR5e0+uMdQa/fzz534q7K+DgsaGQSq752JYs9Si16qkYWFUTOfZK1fQexXrjHKAcWqqcajcxA75hLR+khzrCQSIYcK0pCsBnJGAJchW3re6/d8sfxzbDpVWNEAVjYM0ptXDSmTjazfM2wzL3H7eMmDjJ3xZF6hbGbnyHgsxcwJKkju9hCn0A9LXUPPTH2WYTey4MJ7WNpLfR5OodfU/mQ+YdEwQK6H1wg1cP1rt7h/U2Abcboug/heoRKUzpzx7R+lQc74tFQP+eHd4dq3hmnPl/f1zMHs1Y6zKkyUhoUr7vAk8kFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QvKclbm1HMtFWlt3U1qZrfqf7I9qKEAMjBFaHNgJNd8=;
 b=f5m+3ZU62AgHkZOJO8EIU44GHdrc7vENf0a7jVe/afNVRaLsChNnaOdeY3vN97zleDwNKpOoqn8wwee7eaBl77ODIHLs/Sw805gAi1dffbdjaKYpr1NIYe9BMw0MGqBDc/a5OrC4HhzQjszVCjnrlK/M7cZ8dfFSXXECQcGUfi+nPxV1sizbNNM7WB5b1tYHwcssMtYrXuUOEKfyoF51CYHp7PTB2Jvd8cpJki4Md+yIg5Q5+ozohBvhhOH1is2QB4RgI5hvOOUYdVqcW/CqerAhD39NzvhbAmGe0bdhKbQSqAb6Z1QNwQg8VpsH4ObPl2X4U5Y3KoC7oS7PC5zPuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9) by ZQ0PR01MB1109.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.29; Mon, 15 Jul
 2024 01:52:29 +0000
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 ([fe80::64c5:50d8:4f2c:59aa]) by
 ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn ([fe80::64c5:50d8:4f2c:59aa%6])
 with mapi id 15.20.7741.044; Mon, 15 Jul 2024 01:52:29 +0000
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
 =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggdjUgMDgvMTRdIHN0YWdpbmc6IG1lZGlhOiBzdGFy?=
 =?utf-8?Q?five:_Add_for_StarFive_ISP_3A_SC?=
Thread-Topic: [PATCH v5 08/14] staging: media: starfive: Add for StarFive ISP
 3A SC
Thread-Index: AQHa0dtmioQnCKEIuk25yDdxPISYvbHzTt0AgAPANsA=
Date: Mon, 15 Jul 2024 01:52:29 +0000
Message-ID:
 <ZQ0PR01MB1302C63F9D88A3FE38244A77F2A12@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
References: <20240709083824.430473-1-changhuang.liang@starfivetech.com>
 <20240709083824.430473-9-changhuang.liang@starfivetech.com>
 <tia5sdwf7qyie42s7tll2tnghpdlmdhmtwodmgopsowumyse7h@ec6h4v5fnumr>
In-Reply-To: <tia5sdwf7qyie42s7tll2tnghpdlmdhmtwodmgopsowumyse7h@ec6h4v5fnumr>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ0PR01MB1302:EE_|ZQ0PR01MB1109:EE_
x-ms-office365-filtering-correlation-id: 896f7be6-db87-4700-8199-08dca470c8ec
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|41320700013|7416014|38070700018;
x-microsoft-antispam-message-info:
 bS9IO6PeBJiZ6ncur7Sr4ZmDvvyCmA3L0XhRhO3g26mVNUMRAxvzQNRHHRBG7Ck+164A/vEAuDRMKZrxFHjPnEywzcFT7RIVhXtQSs63qazOrRkD6e25A78gbZ+MOkHpjBNyIiG0GWJWHyxjdvzf+aoJ37fFJqHeZ5Iov5jvGXI0/J76fUzptosQuqTsMb6TCOYllLUszAJqiStmAszTK0j6sXNq5wsiViTkxPiIWA2oF3SYJlGXfVcvNEiws46DoI2Bp/O6NtDcC+Qk5oLKWAcN2/VE4yzqbTKxGRLUbZaaA64df+mmTiYMTY17D71SELUDXYGyjzmDdwozRaJ3/Sikoltj0yhRtGE5l4GYMmxvOA11B0pAtgXg6sdfCmTBodWakkNewrVPTBi+4fFWVZqGGS8pN5VGs6wB0ajw0jCy/imyht37Q7CjPtaX2rgU+54IzfmsuQAGhejeikaZPNUob0G9FkZisYCcWgxjkh1j48Rf4+dEIRIWDF2rdmhLwLaGsRxGLlXAV4FbQw4rxbe47tC3PvgkQSeuZcJ3o0/JIGBY/OAq0ZFsWxV3p+EsXhK8s5tIwmJEgDHVSQMmLI59Jw3vf0dtMkTa6FARR5FDzI5cgJzb8BRKO6rnFeE/
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(41320700013)(7416014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eS9JMDdFUTE0OXF1U2dJeHd3dlkwMmFpN3ZLSFJIbERzSUZNQ3NXZU10N0tr?=
 =?utf-8?B?MjFqaFA4TVdRZlk5Sklmak82ajRUSVRVWjBIRjRuT2MxRSs2bUtRUmljdEhK?=
 =?utf-8?B?cUpQejJCTHVHMlhydFA3UHg4R3B4dFg2b1l3Zm4wN1gyZWlMR3RNTEprbWJi?=
 =?utf-8?B?Sk1SbE1SV3FwbzhqRi9jTzlzSFVZWHN4TWFJZm85VXhPTm1SRnRJUlh2Q1NP?=
 =?utf-8?B?dll2Z1ZOOW5zVTZLbkJ2QmtnNkR6MStYNkxYeHpjakh2MjBNRGpBK0RJMlU3?=
 =?utf-8?B?U3RrRnFkeDd4cDFkVkRzbllSQUVjYXQ0eFZROGNWcUtYeEhhL204UE9udkFJ?=
 =?utf-8?B?bjVZdHNkNmw2NHIxbVFTZ29PRUZPRmVWZnlvTVRrK3R4VjIvSnkzQlludHpl?=
 =?utf-8?B?a0UvNkJVUEJIdm5lVndJejl2TElnWkU1cHJkV1NTV3I4Y0ZJeTVFTG41SVg0?=
 =?utf-8?B?ZnlrdXcvU2crTUJXVUkzNDcvQlpreW1UeVlGM2E5d01kRDZEaXc1TGd0M0w3?=
 =?utf-8?B?MjNVaWE0Nk1MdTlVc1JVOWJoajhNeUdyT3g4dTJYcTA4eWJvcGZ6S1BuTUE5?=
 =?utf-8?B?dkRyTWlxMFZBaU4wR1Z1cW1VZFNxL2pnQWZ2WFNDNklTVllhcWNGNWNUdjd1?=
 =?utf-8?B?WmptbTQ0K0ZWT2s4Lzl5UUo1TndaRytyeGVpN1UxWTBtcUZlVktCNTYvNUtv?=
 =?utf-8?B?R20waG0ram1EOGVLNW82Z3ArTGtXRFdYMnc1KzlBalNucmNFc09Yd0dMMzVx?=
 =?utf-8?B?TitpdTVhNXBTWHNIOFlvMWttYm02NlZHTFZQUllJQmNEN2ZKSDFSTlNZdUZo?=
 =?utf-8?B?Y0kvU0hubXAwTFYzQW1FNXJhVy9UczgvNzhBZWw2ZXM4OWh1ZmN5OUo3THp4?=
 =?utf-8?B?QVdBSVB2YnBSWkRGbWR4UjdRMEE4bldLNDlQNnYyTkVuNHZrYXdDM08yTEN3?=
 =?utf-8?B?Z01DaFJEWEoyS3dvcDBkZ0I0eCtKcjZabU5QWWJPNU1TQmtlZnhiL0JFNzhV?=
 =?utf-8?B?RHkzQlhoZjNWandtVU9XcEozMS83OWM4eUxRNnFUZjA1bHNlSFp2M0JmVVNK?=
 =?utf-8?B?OVlkYWJLSVpDak1hMm0zSDNwK0UyaUQ3UTgvM05YUFZ3bkRMNGNZcHlmRHRP?=
 =?utf-8?B?WkJhRU5ERVVzdWJTc3BHa1RNbm0xME5HV3FzbTRBMnNzV2Y1cjMwV3RpQm16?=
 =?utf-8?B?UXJ0U0t0ZytleG1uZ3p5MVRVaUFHdG5KQ0NRVTdueFU4b2J5TkJGODh5U1o0?=
 =?utf-8?B?L1o4R0RtNFZhdjR4UG9RaFA5NUp3ejFGVEZYZXZKbStQWW14aDZ2MGY0RUtT?=
 =?utf-8?B?eGN4c2x5Sm5YLzJOL003ZlpaVGxUeVBBWWw0ekQrZFpnZVErKy9jcEdYUkVN?=
 =?utf-8?B?RzByT3ZhS0QxdDlnZTVnTzFFQUJzWU9UdUZ4NGRmNTFpcXpOWFNWMkhVUTky?=
 =?utf-8?B?WUN3cWF6THdEYjJSTm5ma0hPMEpTMjNxMisxY3ZUUWtIaHVQaUFhWU1LZFYx?=
 =?utf-8?B?L20vdzJIb2tGRHNoQWJvOG5QM3hhbEE0bGxBNDJQYndocDJ1VXlVS0R0WENs?=
 =?utf-8?B?U3ZXK2twS2U4SE5PZ2ZJYXRNZlkybXVmWTZYeFJmSEVSVlRjWmt4R05Gemhx?=
 =?utf-8?B?YzVpcnJNdkU2OUFHaXFOcmk1RmFyVUhWYU15WDIvcU44c25hdTVXTzh6Kzc0?=
 =?utf-8?B?UEJnYzZpL25PN294bG0rUy9HQmZrSWVkOGFpdWtBbGJDTWtaTzg1ay91TU5F?=
 =?utf-8?B?RHRINTlnclpTazcyWW9maG9panBPMnRiSS9yWjMrRUIwTXRNOFJpak1LWE9E?=
 =?utf-8?B?MHdQTFN3dE9NeHNLMmxDS3JJekxjZmh1Mzc1NHIvSm9hK3UwR0FxWWs5cFpV?=
 =?utf-8?B?dURibEl6KzlDc05TSDFrN01RcmJOZjZoZTFEWHNsT000ZFUrbHBuYXRCQXdk?=
 =?utf-8?B?MEFMWGE0V2YwOElkdWNyMHFhYzVYSmxCS1NzN1MxVUZqMWtMRnk1NkkvVE9p?=
 =?utf-8?B?QVhpT1JYMlI5cVZ2bVloYm8yOEdDWlFhRzVHd0VNTjRlZXFOczREamY3NzMz?=
 =?utf-8?B?Z014clY4bTZBOUtJV1k1dEZMR2NHSzlUajVNNHRVTVhCdVdxSHEzaHQySEc1?=
 =?utf-8?B?SmFoRWgxNUxmd0pYNHBlbjdmdS9TZVoxMHRKL2MwQ0lSK2tmUitVaFFuNTZZ?=
 =?utf-8?B?OVE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 896f7be6-db87-4700-8199-08dca470c8ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2024 01:52:29.3417
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0XncptUUEIbAPpzL2ez5rIxi4R9mOvMd43/RErDNDNbud14M50ln5r6PXAQp1nPqyAH4kKElHqUdGbAyyNBHDv3fGcp+LHDwlfClp6tCXeuY77wTjR7sm3mX4GJDyVWs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1109

SGkgSmFjb3BvDQoNCj4gDQo+IEhpIENoYW5naHVhbmcNCj4gDQo+IFNvcnJ5LCBJIG1pc3NlZCB0
aGlzOiB0aGUgc3ViamVjdA0KPiANCj4gICAgIHN0YWdpbmc6IG1lZGlhOiBzdGFyZml2ZTogQWRk
IGZvciBTdGFyRml2ZSBJU1AgM0EgU0MNCj4gDQo+IFNlZW1zIHRvIGJlIG1pc3NpbmcgYSB3b3Jk
Lg0KPiANCj4gICAgIHN0YWdpbmc6IG1lZGlhOiBzdGFyZml2ZTogQWRkIHN0YXRzIGZvciBTdGFy
Rml2ZSBJU1AgM0ENCj4gDQo+IG1heWJlID8NCj4gDQoNClllcywgdGhhbmsgeW91IGZvciB5b3Vy
IHJlbWluZGVyLg0KDQpSZWdhcmRzLA0KQ2hhbmdodWFuZw0K

