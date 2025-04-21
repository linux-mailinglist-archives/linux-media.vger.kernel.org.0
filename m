Return-Path: <linux-media+bounces-30570-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 79778A94CB9
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 09:01:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3745B188DDB4
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 07:01:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDB78259CBC;
	Mon, 21 Apr 2025 07:01:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2102.outbound.protection.partner.outlook.cn [139.219.146.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B59312B63;
	Mon, 21 Apr 2025 07:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745218893; cv=fail; b=qRkT/83/bZNf46sZ0YCT/XS76ItPrinxJyRbDQmYuHJE8lgE9GfofxsVZ4Vp9c4US7fqVcMN2gDuoA+eoP7VTrzUmUg+8PeRxMLmVRRolADirOEe7NXVsMQU49kxeE45GMlmLO77WcbIMU09xn3VRhFi0HDvgbgjvyubbeM5P0o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745218893; c=relaxed/simple;
	bh=ta/BaFVrhbQqLy1mdUNJW69NqnU+Ck6Z4hU2JqaIK1I=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GsbnuKebq1xXgrZPQRRK4CVsdCGS9BIpGez2kyPozYucE3UJF7tPmcSTJGAgp46qcz/QiVNFL00LmTiKjikAFqBQQ4JHGZzjT980GKNkXJqs/Wop93LE/q4Tffc2FhEd3a0ZpOxGlxdiB2ucspUVhcXUg4M7QJgGIQXVY23SZJU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ct+AwXoMzUcQICSDOQiDXq7cwybGINvGYfQSyi6frAjICvHkewdyieajxTXTQgD0jAdVW7WR1ebrwR7Uc61gqRTAw2kCwSay14XujMuPL6Vs3GPVBWuZnI/lytFUi1/il3UpMfQhdLeNDleMo/X1aHCmX/izfGoMKuQvZzkiy7Llx9bnCrnsUbbZkMYo/cuUHjF/C9rdH0j04ShalYSvYPJEMeS0PTKA/wMD7aAQluK1477QE/7N5Ecj4oNipII6Oq4pp5x+d5aFBzoL77kKiAoMZMtLqciqo9vaBj/z6sbBIqVYMC1IFZxB6XGaYbJ24LaaDAX70AqMAvg/xTtY4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ta/BaFVrhbQqLy1mdUNJW69NqnU+Ck6Z4hU2JqaIK1I=;
 b=mtyBzz2bbYkcXglwSwdU3vFnxmTFgFbCgv3Md/k643t5OrU7+HulFCAPceHNcICkSq9b3eo5GVf5r9iOmCak4DGNTGGzXxlOoOTqVXI0TuflW0gDQxADIkObibnsWAJ7Ls0MiT9Ev5qj73WofReZXhemYFQaSLWiEA4cM684f99fqgmn00Ps2Lo5NyvopbzDjH89cOaUKLt3wkkTWtrQGg9W4Penzw09GIdckbgx8r27ArQtv2+gX0EZ+8c7bI/NQcgnOhsUU3tUuUjGCkU7Q9gU2qPfgaITzfsvX3kLEX/2Ii5XFNXuE7uTX/eFqjTZ+rZm9rp5BTmlSYTbbl3bxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9) by ZQ0PR01MB0949.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 07:01:17 +0000
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 ([fe80::64c5:50d8:4f2c:59aa]) by
 ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn ([fe80::64c5:50d8:4f2c:59aa%5])
 with mapi id 15.20.8655.033; Mon, 21 Apr 2025 07:01:17 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Rishikesh Donadkar <r-donadkar@ti.com>, "jai.luthra@linux.dev"
	<jai.luthra@linux.dev>, "mripard@kernel.org" <mripard@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "devarsht@ti.com"
	<devarsht@ti.com>, "y-abhilashchandra@ti.com" <y-abhilashchandra@ti.com>,
	"mchehab@kernel.org" <mchehab@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "vaishnav.a@ti.com"
	<vaishnav.a@ti.com>, "s-jain1@ti.com" <s-jain1@ti.com>, "vigneshr@ti.com"
	<vigneshr@ti.com>, "sakari.ailus@linux.intel.com"
	<sakari.ailus@linux.intel.com>, "hverkuil-cisco@xs4all.nl"
	<hverkuil-cisco@xs4all.nl>, "tomi.valkeinen@ideasonboard.com"
	<tomi.valkeinen@ideasonboard.com>, "jai.luthra@ideasonboard.com"
	<jai.luthra@ideasonboard.com>, Jack Zhu <jack.zhu@starfivetech.com>,
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>
Subject:
 =?gb2312?B?u9i4tDogW1BBVENIIHYzIDA5LzEzXSBtZWRpYTogY2FkZW5jZTogY3NpMnJ4?=
 =?gb2312?Q?:_Use_new_enable_stream_APIs?=
Thread-Topic: [PATCH v3 09/13] media: cadence: csi2rx: Use new enable stream
 APIs
Thread-Index: AQHbr2XujRYPpfcXpkW/0j4v4HO2I7Ott3Jg
Date: Mon, 21 Apr 2025 07:01:17 +0000
Message-ID:
 <ZQ0PR01MB1302BDC09B8071290B80DF47F2B82@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
References: <20250417065554.437541-1-r-donadkar@ti.com>
 <20250417065554.437541-10-r-donadkar@ti.com>
In-Reply-To: <20250417065554.437541-10-r-donadkar@ti.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ0PR01MB1302:EE_|ZQ0PR01MB0949:EE_
x-ms-office365-filtering-correlation-id: 064cde9b-b7f5-42a1-d456-08dd80a25035
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|41320700013|1800799024|7416014|38070700018;
x-microsoft-antispam-message-info:
 oGEGuZVf7EwxmUo2N0kTayfno2grpuKusT3ayU5pc/M31zwT/JX3Go3/YWIFT3uaFetc2GTF83IoP4SnDktN5Q49dGALXpV415dI0ivB59tJejd5Z1/6fPAzFsPe+qOyEeRH6OFpCSK243w3rg0jlBzbTHexeg0rUmKqQhqSomBuIl3MlQ+d2lFeahcxBk7G7XNGCzGmkOq4196MUxkay7yP2CXGve9mg4gTvuDoF1F4XPgisMXaYm6jTE2ioXmiZycl7hE+vLwvLxpOf+AA7lCmJrbDcLJvavGmI6wKtmkjMOBw3/b+bNkMriDcAr693DmfsURmAOj6rAUGyX5ybu3vDCKNxGNq2MWWK8uFO/ipYZ1RB0ReD+OxuNDijT9y9QjKPexZcsw11bfvG5bevId2nclvH/7M4MPzkAqUxbEV3OY3jOoJoGW4fK9Gdp8xjdPQYvXswp++G/YuxSlU+tvossjSWnIlAT9jDT/l13tG/14gwHckyKk8LFZfIxVo+CcadwhDOr2dXoYfet2ccDzwUMPwa7x+HJdt0DmU6FxMIjgQ2VDJGUdeoq9sGEaZxnuwxeQJJ5qZyM/HQ4PHog==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(41320700013)(1800799024)(7416014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?bnFFeEdvV3I5Q0FuMXczNGsxbnpma0cwUzR2ZjFuanFsQjhZVldUeEllQ0lC?=
 =?gb2312?B?WjMyek8vM2ZNcVpkWi81a0NXTDBOUVF4SGdUMWhEamd6K0gra2drS1NUQzN2?=
 =?gb2312?B?WDdXUCtFZ0d4OFcrQkR1UjJQU0Z6V2crMjkwRTZGZ1RaOGFMOXVsWFRCSWZB?=
 =?gb2312?B?NVQrajNXT292S3BFS29mM0Npa2Jzc3hmMERZb3l6S2hmY01Fb0cycEc5ZE5S?=
 =?gb2312?B?Vnp0S2h5QnVGdGtaK0h4MWhjRG5jdzJsYTRLblF6KzhoVFN6VGdOVFdQSUQ1?=
 =?gb2312?B?TzdJMkhkTWhqOEkxN3NvSGJ1Ym9DQ2RNUS9BZzNWeGg2NFBnV1M2NTJKYUth?=
 =?gb2312?B?QWRYSCtDL09Tcnh6ZzNFc2U1VWFMQ2ZuSWUvKzhqd28yS2VYMC9iYmFLeWFQ?=
 =?gb2312?B?emNLMzk5bWdpUkVWT08xWmRSUG11eks0ckxRanV3eUt0d2FLTTIvcVFydHNG?=
 =?gb2312?B?b1VxUi9saXJOck5RM3Q1MUM1MXM1S0RtaTY4NTEyS1RWOElHSG9hUU1vbFQw?=
 =?gb2312?B?SURENzJ3bXJSYVo1MjZ2YlJjY3RQMEY1dFdqRW1aVVJTam9vNWxPZjhUYnJ2?=
 =?gb2312?B?N2pNS1JpaDNxOXRkTUUvKzRCTzRZb09DeGE5YXg0ZGJpajZoMkkyZG0zVnFj?=
 =?gb2312?B?Yk10MTZ1MUFkV0ordVhhYUVtWVk5QmM4TUViT1lvbWFydzdETzRNVHNNUm9X?=
 =?gb2312?B?dmtxdUVkNUduay9KVXluSCtOanBucHVUcXNOVU53YlVlMjVKdjRzRzAvTVFI?=
 =?gb2312?B?RWhTTy9sZTU4Wk80R2hDcDVTS0V3ZHo0b3VRN3FVdjdYNXNPdTJRblY0azQx?=
 =?gb2312?B?MEJYRzhjRFY0UDlWSlVoUzZzTUVlYUZFSGJ2OWlLa1NNaFAycXZCbXJXM2E0?=
 =?gb2312?B?QTJicEI0NTBFcjJ6SVo1b1lSSEN5eW1TUytJQ3ovV2syZnFtZ2FYaU5MZWlt?=
 =?gb2312?B?WEZMTFVnQm9xOTBxbG5FdDdDK3VRWWx5L2dnNTJPSzI5RVpDV1hTcTNuNEVY?=
 =?gb2312?B?QisyUk9selB3T0dod2YxUUtSMVNTSVVFQ2dnRzRUUVlSRnJ1QnNUWVdrTDZZ?=
 =?gb2312?B?Mm5kTE9BeTkzNTRwdVlERm43dG9OQ0FUckcrVnU3RUhUQndjbVBkUXJrQnpQ?=
 =?gb2312?B?TTZQcTdzanQza3lOYm1keExvWGorZFFmb05TMEEzUy9uM3VyNEorRnBMekJq?=
 =?gb2312?B?V2MwVVhJUlBqYmlWK0JvZmlOVWtYUnZOWGtjbU1ENGlvUEl1WVJuVTRvc2dl?=
 =?gb2312?B?TnFNRk0yRkRrSnF2OGk3TnB5V2VrVU51NFZQQTdQUWREUjhzbHVBTWV3Z085?=
 =?gb2312?B?U2I3RThOYTR2WWFHTDRHWm43YUsrSWEwWU1HS3NWZHFrZmhROTlPWUVhVTBv?=
 =?gb2312?B?WWNEOGtQVVVhbzVyeHhLTDM5aW1ZYXBUcnFqOS9hU1dYWWVTS1Nra3hkWE5P?=
 =?gb2312?B?TDZkU0FTZWJFUktJbmZheEhlNVAvcWVXd3lGa2lyV0V2VGpSenN0STZUa2g3?=
 =?gb2312?B?TDRSOTNHRXE3Z3Q4OHNFdTBzL21iQ1JjazBvNERwSEUyL3ZQZlJWa0pHdGxF?=
 =?gb2312?B?UEwzU0k5VkNuUGhwWmZQY2k3UWt2VmQ2cndlMnhmcFpPdnhOZG9TYmhmZHJa?=
 =?gb2312?B?b2RSc0tCUmxYSFVVcFNhQTZyR1EvbG50L1orTktRNncwRXlIYmVHRUhDNG15?=
 =?gb2312?B?N05UeDBacDllREFFSVRFU3lJSE9NcitEdkFvWXcvWUx5MnNYV1RjbUVBTGZU?=
 =?gb2312?B?R3Y0VGsxckM1OVJZdVk4S1BrWEs1SGlYV24wSWJweTZWQ0h5ZjJYNXlQMU5k?=
 =?gb2312?B?WGZEWE1jeTlSRGpBK3J5Tm5DdThDYUdWZkRNeUp0KzdvLzlPNlJkc3QrNEg3?=
 =?gb2312?B?OE9XM3BQYUszVWQ2cTFVQXdBWDVzeGRiRWczM1ZodmpCSmF4bnhjWVNCaWZk?=
 =?gb2312?B?bHA4WjZPWXNPcWZMRCtLc0dlaThRT1p1TjlzbC9WRG5SQ2NiTmJXVjJ3ZnRk?=
 =?gb2312?B?bTE4SkNPcVVCeHEyaDJmVmd1d0xoOVluRDhMWVZPTEtoMkF5Vnc0dlg0WDRa?=
 =?gb2312?B?d1p0R0lmbnNjOGlRNGdyeTlsMGJRcG1aQUZMakpScTFQYzBpbVM5Z0NIK04z?=
 =?gb2312?B?MVBuZHFrOFV4Q0FzekZJdFBCZkYvQTB3cFF2WkZRcklBS2JMZk1qVzQzc3li?=
 =?gb2312?B?Znc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 064cde9b-b7f5-42a1-d456-08dd80a25035
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2025 07:01:17.5013
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p/RGH7Pu1M9665HiU8LJqvu415XJ21kx0ZALh7YFYT28RDxfU9KjyjnVjMlyaMDIw6118D6lwzKXPAACqQg/HZTSItIwkAIHNCU8lbfxnwah4Tjqdg0Ctz2KfMZ4Ltqe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB0949

PiBGcm9tOiBKYWkgTHV0aHJhIDxqLWx1dGhyYUB0aS5jb20+DQo+IA0KPiBUaGUgZW5hYmxlX3N0
cmVhbXMoKSBBUEkgaW4gdjRsMiBzdXBwb3J0cyBwYXNzaW5nIGEgYml0bWFzayB0byBlbmFibGUg
ZWFjaA0KPiBwYWQvc3RyZWFtIGNvbWJpbmF0aW9uIGluZGl2aWR1YWxseSBvbiBhbnkgbWVkaWEg
c3ViZGV2IGluc3RlYWQgb2YgZG9pbmcNCj4gc19zdHJlYW0oMSkgdG8gc3RhcnQgYWxsIHN0cmVh
bXMgb24gdGhlIHN1YmRldiBhdCBvbmNlLg0KPiANCj4gVGhpcyBBUEkgaXMgaW1wbGVtZW50ZWQg
YnkgZHM5MHViOTYwIGRyaXZlciAoRlBETGluayBkZXNlcikgYW5kIHRodXMgdGhlDQo+IGNhbGxl
ciAoY2Rucy1jc2kyeCkgaXMgcmVxdWlyZWQgdG8gdXNlIGl0LiBGb3Igbm93IHdlIG9ubHkgZW5h
YmxlIHN0cmVhbTAuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKYWkgTHV0aHJhIDxqLWx1dGhyYUB0
aS5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IFJpc2hpa2VzaCBEb25hZGthciA8ci1kb25hZGthckB0
aS5jb20+DQoNClJldmlld2VkLWJ5OiBDaGFuZ2h1YW5nIExpYW5nIDxjaGFuZ2h1YW5nLmxpYW5n
QHN0YXJmaXZldGVjaC5jb20+DQoNCkJlc3QgUmVnYXJkcywNCkNoYW5naHVhbmcNCg0KDQo=

