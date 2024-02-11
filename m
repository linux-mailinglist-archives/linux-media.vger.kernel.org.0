Return-Path: <linux-media+bounces-4951-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F08EF850A3D
	for <lists+linux-media@lfdr.de>; Sun, 11 Feb 2024 17:14:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F2EE1C21F55
	for <lists+linux-media@lfdr.de>; Sun, 11 Feb 2024 16:14:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9D605C5E8;
	Sun, 11 Feb 2024 16:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="WzZ2F/of"
X-Original-To: linux-media@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2062.outbound.protection.outlook.com [40.107.113.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED282AE74;
	Sun, 11 Feb 2024 16:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707668039; cv=fail; b=VWX5p4KiNUF1mKMV0joSdxw0fBsJ3yhed9eR0qYBlff3Q0rhkENF33XhQ4Pu8mVoufJBD1HNT+/VfjQuyhw3mHj7TMhihxIJo4tPFEQ7X1jw0FH7Jjr45l4j1sRFERpLMuwupQ45SW52slIXYXvREoInmZ6p0WGG4yPbsp9xA/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707668039; c=relaxed/simple;
	bh=0kwCy1nV1Gront+Z5SLTaWueLeBRc6c48tVXyWbuzII=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GPUlhmfkHLJ4042X1/C4KY1fkXTz68/njfaXRRicEayqQAsGPuQiTPqsEDyC3DdO9M28Ia4Z71VQ+gEbwz1csv7zltwUz6DfLieKrCBLj91RJh5tHxLKf3KuBwTGHE4Z8BpWu4WAg5BVVkFUbYe9OILQzLvW68JoRgvegjVx90Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=WzZ2F/of; arc=fail smtp.client-ip=40.107.113.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fbKsh3oS2nlQCpowb0XaIfaBXb6YeDFN5wgcdM8l+UCZ130tzi91xKnOyZCSY0x9aPlKFEM62n3pFy6IoJtu4TZ+sgzhLUtLyRa1Nmn676EuYJvkG+U2ULjxIvXtUqrRYLzecx+aIS9VXiEZsV3eV/SpxYuGECvSAITTINbjhdsCrprIQwXb8gQQOlHAeX3ioeem3Swvm1q6L2GHFq34MkmArZgPTaznJHSq5uPy/27z/FmxHKQh/Qpt4d17zs+dpZOOlZM1kdLruLnqwQTk8Yg3/zOhCVKriyihuNn6tSOF+0e+fbz8zIaLpOb/zfZRI+ZWMLJoDi9BqmL33r9sZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0kwCy1nV1Gront+Z5SLTaWueLeBRc6c48tVXyWbuzII=;
 b=XCmXC5mSYTCCv7pf7EYb0mPuMhZ4FsdKlyLg1IoqrpK7wUcn7zBIOwUzQ1Gh5ly6dntSlYJAEnrgnm1HdPTYDvUzaYumUZFpePC31W9yLptdiGzKwhbltMWBf9r3qsJM4zt/uk2tSHyjsqTVdDhfUVFVti8yOiq2Fm7KgWGKBWuwPab9ZVz/wsuoufFjZR8HrjlYrKGiVGKHANMyBG1IXhtPE/lPp+/gUYG3JVmye9fZoCd7Hd3V+rMHj6BsXxcW012hkWneGLYpM/7IFDgx256dISuTr+2jhTB8QT/Msb1+yz1aom2d+DHc5qI6ShDvpMi6FomOR7N66wzmcEvKWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0kwCy1nV1Gront+Z5SLTaWueLeBRc6c48tVXyWbuzII=;
 b=WzZ2F/of9eqItpKt9Kad2DC5M/mMohgkfOzHptz4c+Iwjy+HiSkL1Qwlnbv6gPS60TQB9PDbnXzFLMygq+a3XVVRppjorbzxpUOtqdcbz/uPP1nk+dQPCFFIqanH+3IJzUZ/r6gp1jza958wzR+yCGO/nf3nxwkp7L1b9rDoAlc=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by OS3PR01MB9947.jpnprd01.prod.outlook.com
 (2603:1096:604:1e6::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.37; Sun, 11 Feb
 2024 16:13:52 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6719:535a:7217:9f0]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6719:535a:7217:9f0%3]) with mapi id 15.20.7270.033; Sun, 11 Feb 2024
 16:13:47 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: Geert Uytterhoeven <geert@linux-m68k.org>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, Jacopo Mondi
	<jacopo.mondi@ideasonboard.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Prabhakar Mahadev
 Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>
Subject: RE: [PATCH v2 5/5] arm64: dts: renesas:
 r9a07g043u11-smarc-cru-csi-ov5645: Reduce I2C frequency
Thread-Topic: [PATCH v2 5/5] arm64: dts: renesas:
 r9a07g043u11-smarc-cru-csi-ov5645: Reduce I2C frequency
Thread-Index:
 AQHaUFwCasVyX+Z+l0SMEVmNhiL9xrDsHTmAgAAe0VCABi7lcIAPvXqQgAANIoCAAzPR8A==
Date: Sun, 11 Feb 2024 16:13:46 +0000
Message-ID:
 <TYCPR01MB11269102490F2707ADEEA9FF686492@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20240126133116.121981-1-biju.das.jz@bp.renesas.com>
 <20240126133116.121981-6-biju.das.jz@bp.renesas.com>
 <CAMuHMdUa+wd36-ErDRgb91KpRbryNYzA2Mmhvzjx0-_47=zfdg@mail.gmail.com>
 <TYCPR01MB11269FEE3A8C6D695CBBACEE086792@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <TYCPR01MB11269379C39A0242C9F87A40E867D2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <TYCPR01MB112693439518B0DA3E7E11693864B2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <ZcZCGZn0xHMHVVD1@kekkonen.localdomain>
In-Reply-To: <ZcZCGZn0xHMHVVD1@kekkonen.localdomain>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|OS3PR01MB9947:EE_
x-ms-office365-filtering-correlation-id: 88b54101-ab05-45d1-0ba8-08dc2b1c6d2e
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 fuy7g/cvgTCGJv6CWEBu/k2hjGHJGXTvQHZEBiS6SOO+z7FWsGdZryBk/EtEQATIQsY5h+JMDYT2s8PhtXKcdbRjvHNQ7EAjN4qMrt9cibRymhkNLrfcifQpHfptQFNJ4iAQNxGz58TXG2Qcav+sh+87lSvanpZXu4unEG+Q3NZzKxSTpYDO99wbLgUOjZR0ogw0kGNOPGvRyabxG+x1i3ZsaR5StsQxRWCJJAfFkLGpK3UVjyfpgupo5Al1guy4l8Q4V0BPSyMOAblDByMiBbEVLS5Es9yw83rP+93fo1IQqKUjTQMC223m4HI5fEiw/4XHRD+KuysvWzlC5l0smwM9BYe4YgpVvW3MlA45M4VfJ5NE5a28SSlKNX0ExeuOOfJqBQ8ejdQ37Wn8bsXBZ/8wkpBMn7fyeTsUMyRlRPM0jFrNqAl3Qz7KtlNElKvcBeQtZe4TJVI7n20iC+pdV0F7ZOFjrJDDO4C/47e41v5/1V33rQBVaGjZ4iqvW9O8oR8RXs+lASefyRt/IQWLrOpbVbBdv+tG9u/xZdEWG4ipk45eXpHlZGGbiKjiICisZ7KPBstHpjn8wlaSJ/rgj2XwVp87saaddTq7OYhoo3xGe9OSQqNfzuC9Nktc2YCU
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(346002)(396003)(376002)(136003)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(52536014)(5660300002)(8676002)(76116006)(64756008)(7416002)(66946007)(66556008)(66476007)(66446008)(6916009)(4326008)(2906002)(33656002)(122000001)(86362001)(38100700002)(83380400001)(38070700009)(478600001)(55236004)(54906003)(9686003)(7696005)(6506007)(316002)(53546011)(8936002)(26005)(41300700001)(71200400001)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?c2FUVHAxMTNWYVQxYXVRUFA4N1VtYzhUZ1pmeUNpaE80dFp0WlBKbHhTMzlT?=
 =?utf-8?B?R05QUitJT1IxYWNMYnJwOCtMbWdUMmpqaGVPME5mR1Vac1JaM2cxeVAzVE1M?=
 =?utf-8?B?ZTM0UGs4MFhoOEwrRmF1eDZxRktuQXVlY1loZngwQzMxM0I2K3hWYVR2UWNH?=
 =?utf-8?B?VHBPb1BNS2xaOWM4SW9ES2E4MzZHREhmV2VWeHkyR1g3MHplU0RINCtTc1V2?=
 =?utf-8?B?WlZlbk9IZ2o3bjdjVk5LVGkxZXFQZmQ3VUhlQ0wrT0xGdXJlSTJPQk1HbmNs?=
 =?utf-8?B?SU1xcnhKcWw4M3NyTlpkMGtQMFBZLzRSSDNqYmJybWwzL3VLelRxM0NSVDNo?=
 =?utf-8?B?T2lBUkZrcFdwVlNqdFhaeGg3dTAvaDkreStYSlJRSUJuZEk5QVhrOWxTOU91?=
 =?utf-8?B?T1ZET0NuRWF6ZHBVZUIxSzZiVnhJNDE2R2Flak9za2JvWFZGRWdrNlRoTXRZ?=
 =?utf-8?B?S3IyTTI0b1RCYmJBNzkxQ0FNQm1XYmZpOFgzMVprUEd1bXBGY1hDRjJydkhu?=
 =?utf-8?B?UjZlTzlycTJOVENzWjJuYkJZRjRkdXpIZkFHQi91cFM4Y1QwREVtSFZDK2Vl?=
 =?utf-8?B?MkxiUUJtbGxxYnhnSlBGREZ2L0FZbFNtMzVXMThTd29MRDNBWDlnWmFzWDVW?=
 =?utf-8?B?aTBJck1iTTQxMm5oRnVmVnVFTEJuV3JLcUpGNTgrL2hEaGhaU244QVR1eWJ5?=
 =?utf-8?B?dmtuT0NGZWZJNStxdGVkcWVUNm5uK2JyYUlmT3JVdU1IaUU1cS8xakFjMWxM?=
 =?utf-8?B?R0dYcTNjNG9QdldkbkZCZHhPVEtOSm5vZTdaZDBUb0VSSUxtdUFMSHFyYlU3?=
 =?utf-8?B?a0ZEWnp4TzNIM0dZekN6a0JIOEdNem1vNEQvakF2SGQ5VVpsN2ZLSzREb1RR?=
 =?utf-8?B?cm8zRkFSVmFxdmw1VW16VnZFaFl6UmtkN1g3dTBqcmVEQ0s5aGpPbnRJcGJH?=
 =?utf-8?B?dUpmeDVyK0hUNWw0Q3ZOMFhrRUlPekxGbXNBNkEzdHczQmhkYVBDUitKTStI?=
 =?utf-8?B?ZjJkeTkwbTcyMEwwMm1jandsTU1IVlhJRVBIN3cxY1FxZXVGUlFMMGRPY1hF?=
 =?utf-8?B?MzZiSFd6L2VQNnliL2s2QWFMWjc1UVJhdHUzNW5oTG41TWFBa3F1eGRtUEZH?=
 =?utf-8?B?Wm1nT0VHd2tMcysxZlhwTG43aittekN3dUtzTkV6ZXZickFzejJEV29FZks3?=
 =?utf-8?B?YnlWaTlFaTk1alg1R3pjb1RFZlNVZXJCeDJ2bi9xQ3lzVTR1a3RsT2I1Nlhh?=
 =?utf-8?B?RnpBenV2Q3RXVWIwb3EvL2tleURNTFdzSi8zNWdlNk1PMUVoQnV0Y1VsNXp4?=
 =?utf-8?B?UjVFc3dUYkYvRmcrejJKWnRqb1pRRGVNRlBMcmxWNS9KK2M5b2FQRWRiajNT?=
 =?utf-8?B?UGZRMi9TUk9VQVQxeFJDTEtjejlTdncxRytRY09SRlVScWFjK3kwNzZJZXdv?=
 =?utf-8?B?L0hhZHcxbVpGYnJCU25uUGJkd3pQeHZXemw0TTdiUytnWVJEN2hwUmJuSHR1?=
 =?utf-8?B?M0haL2FXUWFoY0pkWmNuTzUvZTBXQTRTeGZCYXNremZYVXFzQUwybWkyVzQ0?=
 =?utf-8?B?VkpHNThSR0g2VUsyVTA1QWlRc0NKdXZXNTJ6VDFPTG5FZkxhQ1FWaTNnL3lW?=
 =?utf-8?B?cC90d2k3QmZZaVJQYzdGWmVvdXlnWUgzZWxScS9qZHU0dmNzdUtzL29TbUJr?=
 =?utf-8?B?WmhScVVGY3FEWWZ1YXJiSnoyOFJ0V2h5cG85UjZxazZ1dkhUOUViVzAwN3Nr?=
 =?utf-8?B?cTExeXFyV0JUekw4MXNsaUpZR1FLc0tRZUtRV2NTR3JUSnJ3Q1Zaclk3b2Vy?=
 =?utf-8?B?bWZaR2crVGxNN2JmT3EyK01VQUhELzc3TUhkOHR6WHFENDFvTEE4S2NGaFBR?=
 =?utf-8?B?dU5JSm1RRDRkcTFlODcyVlNHRk9oS1RhakQ1aitlUVUxQk5XSEtuUDJGMDBy?=
 =?utf-8?B?bXdwaWlhRDBXUDMwN2N3UXNsYlVaNWtWbzVYeW0yUXRGTWFOeVMyd3JMdEJI?=
 =?utf-8?B?c3ZFSjlWdWZUNkc3OVR4a3ppb24xdWE1TkhVWTN0ZnlhQzQ1cDJEdlFkeWhP?=
 =?utf-8?B?bDJkbWZKRi9WazEvbzkyNXdqV0J0R3h3dU5nck9ocU41aXJ5VHdmTy9zQnIx?=
 =?utf-8?B?cGswMWNkNTNpMzhVVm91aXlqdE1rQVVZMzZiclhGUnpMeCtlK2NnckdmdDZR?=
 =?utf-8?B?T3c9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 88b54101-ab05-45d1-0ba8-08dc2b1c6d2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2024 16:13:46.9980
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hepqxNOvRteuM7nRCFQpJXJKclgYco6wnWbMMouhhJ5Tqt69lxfssEr7aayaD6jZgJIFIYYD6wHaTYwLarc5iL3H8uwSq8vNy+TD8cEhsTM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9947

SGkgU2FrYXJpIEFpbHVzLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206
IFNha2FyaSBBaWx1cyA8c2FrYXJpLmFpbHVzQGxpbnV4LmludGVsLmNvbT4NCj4gU2VudDogRnJp
ZGF5LCBGZWJydWFyeSA5LCAyMDI0IDM6MTggUE0NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiA1
LzVdIGFybTY0OiBkdHM6IHJlbmVzYXM6IHI5YTA3ZzA0M3UxMS1zbWFyYy1jcnUtDQo+IGNzaS1v
djU2NDU6IFJlZHVjZSBJMkMgZnJlcXVlbmN5DQo+IA0KPiBIaSBmb2xrcywNCj4gDQo+IE9uIEZy
aSwgRmViIDA5LCAyMDI0IGF0IDAyOjM2OjIyUE0gKzAwMDAsIEJpanUgRGFzIHdyb3RlOg0KPiA+
IEhpIEdlZXJ0LA0KPiA+DQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4g
RnJvbTogQmlqdSBEYXMNCj4gPiA+IFNlbnQ6IFR1ZXNkYXksIEphbnVhcnkgMzAsIDIwMjQgMjox
NSBQTQ0KPiA+ID4gU3ViamVjdDogUkU6IFtQQVRDSCB2MiA1LzVdIGFybTY0OiBkdHM6IHJlbmVz
YXM6DQo+ID4gPiByOWEwN2cwNDN1MTEtc21hcmMtY3J1LQ0KPiA+ID4gY3NpLW92NTY0NTogUmVk
dWNlIEkyQyBmcmVxdWVuY3kNCj4gPiA+DQo+ID4gPiBIaSBHZWVydCwNCj4gPiA+DQo+ID4gPiA+
IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiA+IEZyb206IEJpanUgRGFzDQo+ID4g
PiA+IFNlbnQ6IEZyaWRheSwgSmFudWFyeSAyNiwgMjAyNCAzOjU3IFBNDQo+ID4gPiA+IFN1Ympl
Y3Q6IFJFOiBbUEFUQ0ggdjIgNS81XSBhcm02NDogZHRzOiByZW5lc2FzOg0KPiA+ID4gPiByOWEw
N2cwNDN1MTEtc21hcmMtY3J1LQ0KPiA+ID4gPiBjc2ktb3Y1NjQ1OiBSZWR1Y2UgSTJDIGZyZXF1
ZW5jeQ0KPiA+ID4gPg0KPiA+ID4gPiBIaSBHZWVydCwNCj4gPiA+ID4NCj4gPiA+ID4gVGhhbmtz
IGZvciB0aGUgZmVlZGJhY2suDQo+ID4gPiA+DQo+ID4gPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCj4gPiA+ID4gPiBGcm9tOiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4
LW02OGsub3JnPg0KPiA+ID4gPiA+IFNlbnQ6IEZyaWRheSwgSmFudWFyeSAyNiwgMjAyNCAxOjUz
IFBNDQo+ID4gPiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiA1LzVdIGFybTY0OiBkdHM6IHJl
bmVzYXM6DQo+ID4gPiA+ID4gcjlhMDdnMDQzdTExLXNtYXJjLWNydS0NCj4gPiA+ID4gPiBjc2kt
b3Y1NjQ1OiBSZWR1Y2UgSTJDIGZyZXF1ZW5jeQ0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gSGkgQmlq
dSwNCj4gPiA+ID4gPg0KPiA+ID4gPiA+IE9uIEZyaSwgSmFuIDI2LCAyMDI0IGF0IDI6MzHigK9Q
TSBCaWp1IERhcw0KPiA+ID4gPiA+IDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiA+
ID4gPiB3cm90ZToNCj4gPiA+ID4gPiA+IFJlZHVjZSBpMmMgZnJlcSBmcm9tIDQwMC0+MTAwIGtI
eiBvbiBSWi9HMlVMIFNNQVJDIEVWSyBhcyB0aGUNCj4gPiA+ID4gPiA+IGNhcHR1cmVkIGltYWdl
IGlzIG5vdCBwcm9wZXIgd2l0aCB0aGUgc2Vuc29yIGNvbmZpZ3VyYXRpb24gb3Zlcg0KPiBJMkMu
DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUu
ZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gVGhhbmtzIGZvciB5
b3VyIHBhdGNoIQ0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiAtLS0NCj4gPiA+ID4gPiA+IGEvYXJj
aC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I5YTA3ZzA0M3UxMS1zbWFyYy1jcnUtY3NpLW92NTY0
DQo+ID4gPiA+ID4gPiA1LmR0DQo+ID4gPiA+ID4gPiBzbw0KPiA+ID4gPiA+ID4gKysrIGIvYXJj
aC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I5YTA3ZzA0M3UxMS1zbWFyYy1jcnUtY3NpLQ0KPiBv
djU2NDUuDQo+ID4gPiA+ID4gPiArKysgZHQNCj4gPiA+ID4gPiA+ICsrKyBzbw0KPiA+ID4gPiA+
ID4gQEAgLTE5LDMgKzE5LDcgQEAgJm92NTY0NSB7DQo+ID4gPiA+ID4gPiAgICAgICAgIGVuYWJs
ZS1ncGlvcyA9IDwmcGluY3RybCBSWkcyTF9HUElPKDQsIDQpDQo+IEdQSU9fQUNUSVZFX0hJR0g+
Ow0KPiA+ID4gPiA+ID4gICAgICAgICByZXNldC1ncGlvcyA9IDwmcGluY3RybCBSWkcyTF9HUElP
KDAsIDEpDQo+ID4gPiA+ID4gPiBHUElPX0FDVElWRV9MT1c+OyB9Ow0KPiA+ID4gPiA+ID4gKw0K
PiA+ID4gPiA+ID4gKyZpMmMwIHsNCj4gPiA+ID4gPiA+ICsgICAgICAgY2xvY2stZnJlcXVlbmN5
ID0gPDEwMDAwMD47IH07DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBJcyB0aGlzIGEgbGltaXRhdGlv
biBvZiBvbmUgb2YgdGhlIEkyQyBkZXZpY2VzIG9uIHRoZSBidXMsIG9yIGENCj4gPiA+ID4gPiBQ
Q0IgZGVzaWduIGlzc3VlPw0KPiA+ID4gPg0KPiA+ID4gPiBDdXJyZW50bHkgdmVyc2EzIGNsb2Nr
IGdlbmVyYXRvciBjb25uZWN0ZWQgdG8gdGhlIHNhbWUgYnVzIGFuZCBpdA0KPiA+ID4gPiB3b3Jr
cyBvayB3aXRoIDQwMGtIeiBjbG9jay4gTWF5YmUgaXQgaXMgc3RyZXNzZWQgbm90IHRoYXQgbXVj
aA0KPiA+ID4gPiBjb21wYXJlZCB0byBPVjU2NDUgc2Vuc29yIGNvbmZpZ3VyYXRpb24uDQo+ID4g
PiA+DQo+ID4gPiA+IEF0IHRoZSBtb21lbnQgd2l0aCA0MDBrSHogSTJDIGJ1cyBjbG9jaywgQ2Ft
ZXJhIGNhcHR1cmUgaXMgbm90DQo+ID4gPiA+IHdvcmtpbmcgcHJvcGVybHkgb24gUlovRzJVTCwg
YnV0IHdpdGggc2FtZSBidXMgZnJlcXVlbmN5IHRoZSBzYW1lDQo+ID4gPiA+IHdvcmtzIGZpbmUg
b24gUlove0cyTCxHMkxDLFYyTH0uDQo+ID4gPiA+IFRoZXJlIG1heSBiZSBzb21lIGhhcmR3YXJl
IGRpZmZlcmVuY2VzIHdoaWNoIGlzIGNhdXNpbmcgdGhpcyBpc3N1ZS4NCj4gPiA+ID4NCj4gPiA+
ID4gPg0KPiA+ID4gPiA+IERvZXNuJ3QgdGhpcyBuZWVkIGEgRml4ZXMgdGFnPw0KPiA+ID4gPg0K
PiA+ID4gPiBJIGNhbiBjcmVhdGUgYSBuZXcgcGF0Y2ggdXBkYXRpbmcgYnVzIGZyZXF1ZW5jeSBh
cyAxMDBrSHogYW5kIGFkZA0KPiA+ID4gPiBmaXhlcyB0YWcuDQo+ID4gPiA+IEFmdGVyIHRoaXMg
SSB3aWxsIGRyb3AgdGhpcyBwYXRjaCBhcyBpdCBubyBsb25nZXIgbmVlZGVkLg0KPiA+ID4gPg0K
PiA+ID4gPiBQbGVhc2UgbGV0IG1lIGtub3cuDQo+ID4gPg0KPiA+ID4gKyBtZWRpYQ0KPiA+ID4N
Cj4gPiA+IEFkZGluZyBhIGRlbGF5IGFmdGVyIFNvZnR3YXJlIHJlc2V0IG1ha2VzIGl0IHRvIHdv
cmsgYXQgNDAwa0h6IHdpdGgNCj4gPiA+IFJaL0cyVUwgU01BUkMgRVZLLg0KPiA+ID4NCj4gPiA+
IFNvIG5vdCBzdXJlIHdlIG5lZWQgdG8gYWRkIGRlbGF5IGFmdGVyIHNvZnR3YXJlIHJlc2V0Pw0K
PiA+ID4NCj4gPiA+IE5vdyBhZnRlciBPVjU2NDUgZ3BpbyByZXNldCwgdGhlbiB0aGVyZSBpcyAy
MG1zZWMgZGVsYXkgYW5kIHRoZW4NCj4gPiA+IGFnYWluIHdlIGFyZSBpc3N1aW5nIHNvZnR3YXJl
IHJlc2V0IGFuZCB0aGVyZSBpcyBubyBkZWxheSBhZnRlciB0aGlzDQo+ID4gPiBmb3IgdGhpcyBz
b2Z0d2FyZSByZXNldC4NCj4gPiA+DQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9p
MmMvb3Y1NjQ1LmMgYi9kcml2ZXJzL21lZGlhL2kyYy9vdjU2NDUuYw0KPiA+ID4gaW5kZXggYTI2
YWMxMWM5ODlkLi5kNjdhNWUyM2ZlNWEgMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJzL21lZGlh
L2kyYy9vdjU2NDUuYw0KPiA+ID4gKysrIGIvZHJpdmVycy9tZWRpYS9pMmMvb3Y1NjQ1LmMNCj4g
PiA+IEBAIC02MjIsMTEgKzYyMiwxOSBAQCBzdGF0aWMgaW50IG92NTY0NV9zZXRfcmVnaXN0ZXJf
YXJyYXkoc3RydWN0DQo+ID4gPiBvdjU2NDUgKm92NTY0NSwgIHsNCj4gPiA+ICAgICAgICAgdW5z
aWduZWQgaW50IGk7DQo+ID4gPiAgICAgICAgIGludCByZXQ7DQo+ID4gPg0KPiA+ID4gICAgICAg
ICBmb3IgKGkgPSAwOyBpIDwgbnVtX3NldHRpbmdzOyArK2ksICsrc2V0dGluZ3MpIHsNCj4gPiA+
ICAgICAgICAgICAgICAgICByZXQgPSBvdjU2NDVfd3JpdGVfcmVnKG92NTY0NSwgc2V0dGluZ3Mt
PnJlZywNCj4gPiA+IHNldHRpbmdzLQ0KPiA+ID4gPnZhbCk7DQo+ID4gPiAgICAgICAgICAgICAg
ICAgaWYgKHJldCA8IDApDQo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gcmV0
Ow0KPiA+ID4gKw0KPiA+ID4gKyAgICAgICAgICAgICAgIGlmIChzZXR0aW5ncy0+cmVnID09IE9W
NTY0NV9TWVNURU1fQ1RSTDApDQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICBmc2xlZXAo
MTAwMCk7DQo+ID4gPg0KPiA+DQo+ID4gVGhpcyBpc3N1ZSBzZWVuIG9uIFJaL0cyTCBTTUFSQyBF
VksgYXMgd2VsbC4gTXkgdGVzdGluZyBvbiBHMkwgZmFtaWx5DQo+ID4gc2hvd3Mgd2UgbmVlZCB0
byBhZGQgZGVsYXkgdG8gbWFrZSBPVjU2NDUgdG8gd29yayBANDAwa0haLg0KPiANCj4gVHlwaWNh
bGx5IHRoZXJlJ3MgYSBkZWxheSBiZWZvcmUgdGhlIGNoaXAgaXMgYWNjZXNzaWJsZSBvdmVyIEnC
skMgYWZ0ZXINCj4gcmVzZXR0aW5nIGl0LiBJdCdzIGEgYml0IG9wZW4gd2hldGhlciB0aGlzIG9u
ZSBuZWVkcyBpdCwgdmVyeSBwcm9iYWJseSBpdA0KPiBkb2VzLiBJdCdkIGJlIG5pY2VyIG5vbmV0
aGVsZXNzIHRvIGRvIHRoaXMgb3V0c2lkZSB0aGUgcmVnaXN0ZXIgbGlzdCBhbmQNCj4gaW5zdGVh
ZCB1c2UgYSBzZXBhcmF0ZSBvdjU2NDVfd3JpdGVfcmVnKCkgY2FsbC4NCg0KT0suDQo+IA0KPiBQ
cm9iYWJseSB0aGUgZmlyc3Qgd3JpdGUgaXMgcmVkdW5kYW50LiBUaGUgc2Vjb25kIHdyaXRlIHJl
c2V0cyB0aGUgZGV2aWNlLg0KPiAweDgwIHNob3VsZCBiZSBzdWZmaWNpZW50IHZhbHVlIGZvciB0
aGF0Lg0KDQpXaWxsIHRlc3QgYW5kIHNlbmQgcGF0Y2ggZm9yIGl0Lg0KDQpDaGVlcnMsDQpCaWp1
DQo=

