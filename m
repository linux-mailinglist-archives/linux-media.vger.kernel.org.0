Return-Path: <linux-media+bounces-14704-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7465092A408
	for <lists+linux-media@lfdr.de>; Mon,  8 Jul 2024 15:49:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BDF18B22865
	for <lists+linux-media@lfdr.de>; Mon,  8 Jul 2024 13:49:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9318613A272;
	Mon,  8 Jul 2024 13:49:00 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2113.outbound.protection.partner.outlook.cn [139.219.17.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1001B970;
	Mon,  8 Jul 2024 13:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.113
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720446540; cv=fail; b=WkdLUrfGXONiBPRea3qzli364ra9Nqx8pIi0XcdIxBn1JNl+HrQGhrnrlY8A40xKavkwMTROLYW9EWu107oiqLwFbbiENeDBeeN6N61kiajK/wka6ZNnKxW9AMP6ei1ot3NrPwZI5Fl51+YENGz6j2PU/iATM2Yvwj9NXSXZbjQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720446540; c=relaxed/simple;
	bh=CNZL79ofy5W0kA59sTYR4TZXiiTYej5YMVQ/r4C7h0I=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bwjcLDe80WFCh1JG2ucu3jOokVu+8TYViv0ACT5tkMw9tgpLbPhcMa02b3G7/yR8NObX9P02VuK7NdytIm9PnfYjxcyseGq3o19MpE4TxUlXF9jST3lHvK6CFsqD2p02P1NitWK8EmJ7a2I0sdfH4FeTiFN/cYJlH3c21XH9ErY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TlBVZ57bvEEQ/u/arbLzgFuzMGSo+P6G7e6AKXqoTFF2DlidunOTA6H/5b7isI4DI9cTtha0je7LlIZVwmAljZy3U4nV2upso9rapJ/mDD7U4rkdJZwOPqn0BZxlZSN9lqxf8YbJx7uOJMSVRPMKxoKDvH9spVVEG/UUYWozyYac2E4EtfzYgZrf4Mo8x9GPRVBgbtXiCcQ1KY/0VgRZlCiKr/YLKDHaxZ7SSgd6rvziutZM0hDVSpel6lWecFUIE84dXjWv7Vuk5hU6uCZIaGyzG9M75L+FxNnu1NXU6vK+2Iq9MpGlE9xyGYhn1w0cxe59Ignstbj1ZpG3exPTyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CNZL79ofy5W0kA59sTYR4TZXiiTYej5YMVQ/r4C7h0I=;
 b=HVWm4GqtLCNf+fUSc1+nO81xPgA0jonyuWVVoAKWAWuxansZ+G9lLfOkt+0dMRcAZ6wUfRmCMtKF3HYTBpU2ppzbAtjIxV0ii2R467z2DSraOEmTcie4HanzcdkGxycYaoJxYAHo6choO1VKvvX/DTTPEx6OCxilfpaXYv6PdZSpZ9SBWg1akat+4hdmUhu/PcR+fv5Vjg59W4NQFKA05cDSUdR/VrO7ngmJTETiFSv6Gc49hc5kq+gBBVgBxLkXREi+lEIY9uLh1cQLzCxNrog0bUhBS+LGR9tHSbkaVHzopoMipRWuchjAEMdp1UQMzo/JXc3jHVxq3DbEL+/fWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9) by ZQ0PR01MB0949.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.29; Mon, 8 Jul
 2024 13:14:03 +0000
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 ([fe80::64c5:50d8:4f2c:59aa]) by
 ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn ([fe80::64c5:50d8:4f2c:59aa%6])
 with mapi id 15.20.7741.033; Mon, 8 Jul 2024 13:14:03 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, Ming Qian <ming.qian@nxp.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Tomi Valkeinen
	<tomi.valkeinen+renesas@ideasonboard.com>, Mingjia Zhang
	<mingjia.zhang@mediatek.com>, Marvin Lin <milkfafa@gmail.com>
CC: Jack Zhu <jack.zhu@starfivetech.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-staging@lists.linux.dev"
	<linux-staging@lists.linux.dev>
Subject:
 =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggdjQgMDEvMTNdIG1lZGlhOiBzdGFyZml2ZTogQWRk?=
 =?utf-8?Q?_JH7110_ISP_module_definitions?=
Thread-Topic: [PATCH v4 01/13] media: starfive: Add JH7110 ISP module
 definitions
Thread-Index: AQHahOSTx7demjpW5k2Wo+tNur9vjrHQ+QgAgBxsdMA=
Date: Mon, 8 Jul 2024 13:14:03 +0000
Message-ID:
 <ZQ0PR01MB1302CAD4A6F9DB486793DD95F2DA2@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
References: <20240402100011.13480-1-changhuang.liang@starfivetech.com>
 <20240402100011.13480-2-changhuang.liang@starfivetech.com>
 <c401600b-263e-4798-9cb9-91a511c6adc5@xs4all.nl>
In-Reply-To: <c401600b-263e-4798-9cb9-91a511c6adc5@xs4all.nl>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ0PR01MB1302:EE_|ZQ0PR01MB0949:EE_
x-ms-office365-filtering-correlation-id: 80d427fd-85b5-4ed4-d232-08dc9f4fd6f6
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|41320700013|366016|7416014|921020|38070700018;
x-microsoft-antispam-message-info:
 xfRMDSvSkYpu0WyNQFpya8r7nbRowfLKPPCIyg0l1XiwUb/uCVzB+e2StBgmKMF4NVCjNrmCwYg3Q0ED9TJBBvJIHbf+pLqovztzOyS48962Nkca1dTi0dMOfBOP2yRXeuohAH0BO20l+FO/lMpZ31rMCdznMzvjeja8OejO+DMHQtBSceP4eaS84M8MwcVjtEpHWdB+mxYfUUzr7dtp+SXtD448TBaDyo3myu7CIhAt1al8dZUr/lqTxJflRsrTVG83Fw9mMjDb4BAvH67K0YrvnJsQgxNqgAvA0Ep/Uxpl/SStQ8ja29y1TitDpbczA5U5JR9tW4WQ5r3N/kFMx/+K8iLHMxgl41Xqi7fwvN1v3jFrxdeoqxcBs7yQPNEnTILYwm3agTck2kl9PqNWg7zELoK1ssfuqEd6XcYWT9xxRQUXZn2WU3cZ3AtpX1fnaKDDTpMiMmDRnaghiUioLolWQ343SeftKeU27E2uyWfxO+Z6XbrphjFLm20AlZSBlkcrN2Mfqy8/JJzGO2emiMbAmYIMsI4cyPCbXR/Pq887ZqdOfJt8J6sXYxhqSdOqEqnjevluuGSoxhDNf3XT/snL1EL28IgiksHY2/XZyL09PXyqKNJ9mPQPTqmu0lkdSEOlvxZ1qoPJEwBL65SzYg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(41320700013)(366016)(7416014)(921020)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RG95T2hSUXI5LzdkTnBLTzJCTEhWRDF6YWdSejRVd2RCYU84bWVaWmRubGJC?=
 =?utf-8?B?Y1ZvT3hkakRuNlVrQjQxQkNId3B0SHF5VlFEMHVuRFZhR3EyaE5YNUlBY1Nv?=
 =?utf-8?B?YnR5anNiU2F5WFFtVHlsbGw3Q1YrVGQ3NDdBSXMxUjZZc0NJTm5wKzdJN0V6?=
 =?utf-8?B?dS9jeFFHSmZVM3VRRk9COTZXQXl4Y3J1R1BYaFM4SHlibVJxSWRPNnJ0ZFFC?=
 =?utf-8?B?NzJlWlVRUU9TV2NNaUl5S2Frak5kemFQdjVmSGpvZm9PTDBJQlhrUGdpT0F5?=
 =?utf-8?B?UlBVcFA5cUdkZVlUU3g0TjBqaFBRcVRaNUljc2VZU1RuWnBsZ3NqcDhSck0y?=
 =?utf-8?B?dGxwdmhjWDJaMk84c0NpVksrTW1UbkF6ZW1pWVZ3UVZSYlNjRDBPRHdyWXYr?=
 =?utf-8?B?SDYvcTBJWjUra002RjFvdko4UGRpYld5L0NaUWJaVWZYckw0ZEJsYUhlMHor?=
 =?utf-8?B?WTR2T1pINllRREwvaU5VcEs5Vm1KNmJTYk8wQk56M2JyOHdCeDRVZVpVQS90?=
 =?utf-8?B?MFlqSUhJVHI4TE83L3FDL3UyaVg2c28rMjBqY05JaW1IMmlON21qMWNuaTVS?=
 =?utf-8?B?WnFjS0F4SEh1aDZxbG1rc2tPbU94WVdFMlN3WUdmRUhOMFpuaUl6QlFqeDQ2?=
 =?utf-8?B?b3NNU1cwNHVRMjlQaGE4ejE3VnM4U1I5RTVaRjhHbjVaSi9VZFh0QlZPQWo1?=
 =?utf-8?B?anFEbkNXNExKUVRJQkIvSUVib0JGR3hGSkFGYVgra25pUEpDWWVXbkFnTzRJ?=
 =?utf-8?B?b1pvaDRzKy8vNEM3TE9nT1luQ1RjbUJWR2FacXdyN1V3bzlPVTRTRzRzQnFY?=
 =?utf-8?B?eFA4aVlQRTh4NFQrMi9rYmtKeUUrVDY4WnZrWDRUZ3Zsd3F3dFYzOVpLSERB?=
 =?utf-8?B?MDZWc2pieXM5SXNBaXRYS2cyMFVRMFlhK1VENnlROU14UkZyR2h2TnRxaWRG?=
 =?utf-8?B?M2NwTXg2cEN5aTkrUGtZVFhUYWdtalFMNTE1V2wvcXlxLzFOMFhnWG1acm83?=
 =?utf-8?B?eEhOTDQ0eXdVMTQ2azhoUkUvQk92VXE0SnkvTkRDVkhVbVV6bWFnbUNuSXJq?=
 =?utf-8?B?amFTWk9HNkpkUTRhUG5YcHNSZmd4b3BnbjhkczFFSk96OWtRSlJRUTZoQlZm?=
 =?utf-8?B?eGtJQnAwbjBvQXczWE9pN3U2ZUVPNUYwUEFGbGNFNGJsL2cyTDlZcGJDREl1?=
 =?utf-8?B?bXNBSTR3WlM5dDdBZGxKSytNcjFXQ29pazhUL2k5TWRIVUdCa2Y1UDAra1Vq?=
 =?utf-8?B?akxZSnBCSVZrc1VhNlM1VlVuNnZrU3QyT2R6NWd6SnZwSTUyYWVMQjdwN253?=
 =?utf-8?B?aDk5eTFJRFpBUHJWRHRsSGtsZm4vNlFhSXpoMVFCcDVwLytuZ1d5OFMvRVBL?=
 =?utf-8?B?bDNRbVVyZEx4bGIvTytEdlFOOE1PUUtmZXRsSW9rekxrQnZ5blBMSFJzK2FF?=
 =?utf-8?B?QkQwQ25UT3NaWkxOYmdaZXAvLzNYNE5mclk1WE9tdFl6M3BVQmt5ak96Nnl4?=
 =?utf-8?B?T25QMStwenVUWXdZN2Mxek96aml1aHFGdEoyM2YydjIxM0JTWXVqUEQ4RHU5?=
 =?utf-8?B?bEhBTkNjdjRZa2NMcjc1ajRCckIzd1VURGZiOVFpM2wvTTU2bUpzcXBrUlBr?=
 =?utf-8?B?SENITk5YdzRpZHprZGZuWmN2NUtTc0o2ZDJvRVF3enZ6NUhnamRZd0xuWW5v?=
 =?utf-8?B?UVBheHFnUko4YVBOSUszVE1IVzZyeXhYYlpxWUtTd2QwMVNYSlN0Nzd6VklS?=
 =?utf-8?B?cXFCTUoySDJLd3J0UkFjT3UrMGl0Y2xvRGZ4ME95Q0U0dERVdGpqaG8vWlAz?=
 =?utf-8?B?Y1krZzZNSDRMMWlxeTNiVW1MbHpSR210by96eS9QU3J0R05NL2ZmRjZ2Ungx?=
 =?utf-8?B?MVNjQ1h4NmpsWXFuVEF0SnlrTkFDNEhxdEd0TkE2WEMrYnZwTjBXRzlSM0ZB?=
 =?utf-8?B?TWhnUExwUGpQSU40NThrVk5Ebm9nMGphZ3hRWUdwUnQ4aHF0V1BmaVF1OXJt?=
 =?utf-8?B?RE0yaGxqaFVabnZSSFBkdFQxMkRYSXRGMkFHWDlrYlZsQVVhUThHTkpqYllC?=
 =?utf-8?B?Q09mZHVvRmlnR3dzTmFtbUVmaytOTGJUVWZxcWNMenkxeWo3SGd5Z20zNUtm?=
 =?utf-8?B?eXBibCtKcUEwRjdXYlJlcWIyUktJU0NWYzl3bVlRYlRma1F0UjVvWHZYYVdC?=
 =?utf-8?B?T0E9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 80d427fd-85b5-4ed4-d232-08dc9f4fd6f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2024 13:14:03.7373
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u5AOhWUs9wRH5xKr6ymtJUgdvKgnyIxd1apW+VWkpVGtoLQ2Z05fDZWVfj6j5h1ba5QCYfgssqT3onaZUXwhPk532pNf385J2uLSb2/Zt+4JhibUx//TNFJuG/EOIGLv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB0949

SGkgSGFucywNCg0KVGhhbmtzIGZvciB5b3VyIGNvbW1lbnRzLiANCg0KPiANCj4gSGkgQ2hhbmdo
dWFuZywNCj4gDQo+IEhhdmUgeW91IGNoZWNrZWQgdGhhdCB0aGVzZSBzdHJ1Y3RzIGhhdmUgdGhl
IHNhbWUgbGF5b3V0IGZvciAzMiBhbmQgNjQNCj4gYXJjaGl0ZWN0dXJlcz8NCj4gcGFob2xlIGlz
IGEgdXNlZnVsIHRvb2wgZm9yIHRoYXQuDQo+IA0KPiBJLmUuLCBpZiB0aGUga2VybmVsIGlzIDY0
IGJpdCBidXQgdXNlcnNwYWNlIGlzIGNvbXBpbGVkIGZvciAzMiBiaXQsIHRoZW4gdGhlc2UNCj4g
c3RydWN0cyBzaG91bGQgc3RpbGwgaGF2ZSB0aGUgc2FtZSBsYXlvdXQuDQo+IA0KPiBJdCBwcm9i
YWJseSBpcyBmaW5lLCBjaGVja2luZyBpdCB3aXRoIHBhaG9sZSBpcyBhIGdvb2QgaWRlYS4NCj4g
DQoNCkkgdGVzdGVkIHRoZSAzMiBhbmQgNjQgYXJjaGl0ZWN0dXJlcyB1c2luZyBwYWhvbGUsIHRo
ZXkgaGF2ZSB0aGUgc2FtZSBsYXlvdXQuDQpUaGFua3MgZm9yIHBvaW50aW5nIG91dCB0aGUgc3Bl
bGxpbmcgZXJyb3IsIEkgd2lsbCBjaGVjayBhbGwgdGhlIHNwZWxsaW5nIGFuZCBmaXggdGhlbS4N
Cg0KUmVnYXJkcywNCkNoYW5naHVhbmcNCg==

