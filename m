Return-Path: <linux-media+bounces-26102-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E61DBA33796
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2025 06:54:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E45A07A464F
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2025 05:53:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BECA5207663;
	Thu, 13 Feb 2025 05:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ZOyehAaG";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="jZnwJg6/"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11DBE204F85;
	Thu, 13 Feb 2025 05:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739426061; cv=fail; b=VciMDDy/PR2BCbmGzHtkmM/K8MLCrU14yqjMf0Kmx/i0LV3iTyg9ZwnssmZ738FfwZoyUFI20hudfZWnilMhHLS7AJgw7RAK71IO29Mi+vW8mF+ufuvSBU2I8bUf2vt5ICxOp9hWaO7DjblwOU48iuTx5D0dT3UuHkXgtTnrvYw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739426061; c=relaxed/simple;
	bh=fIecFQhX9GIx+U4GG/bMzRFHNuXCKjLGMrH5amco2x8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pf7ttR59AOJJxyWFmcH/Xz0s8KApaEOEZ1lGZ5fmrC2TadXEWjmHWh96SfDZ0+Yxt7iTz7R/fGX1DlhhR9ZGBgcuvMl8APxxmEh+IJYLi47RxDi2Yc9WJGVSDJyOhHkU8PsRmb9qs78+1GeGpnVSGnl74hnUAKmJ8tiT9PhA+UQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=ZOyehAaG; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=jZnwJg6/; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: f13ec1aae9ce11efb8f9918b5fc74e19-20250213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=fIecFQhX9GIx+U4GG/bMzRFHNuXCKjLGMrH5amco2x8=;
	b=ZOyehAaGjyflWuIAvImuaII7yDM52uTStUx/iHIOSiZmpQq88U+G5gjzZnMQKkj83V1TdrzVxog852ntrnGrF6lj3lKcoMAxjEj6PH1+kmfWdW7f2f7OH39eiIei07h7w34lO1ozTytw0+BI5ebpqRUYr0z9IFanybptUA9DvIw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:796e9f72-6e20-4450-bc7d-f6656c101a47,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:f8d24c8f-637d-4112-88e4-c7792fee6ae2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: f13ec1aae9ce11efb8f9918b5fc74e19-20250213
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 57421034; Thu, 13 Feb 2025 13:54:09 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Thu, 13 Feb 2025 13:54:07 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Thu, 13 Feb 2025 13:54:07 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R7PZhLUrkzEAwSf1gOUBjdQvSA7QRA0fc2MD9Ota1WJ0o0q+6GCqFEk47wxHRsE2ym0Q4w6LTTx8RvdarK3Aw/OjyU4oiP9f2+UAiWuV2THL2rALnNjsMHNwm4+AOvXKqgbjhJzcvmnW7IZIV4GEsBSjW0TX6hx5ioHX/LOY0VPLeewHke+awwkc/9Ijvh+hwwRdgJmPWKRo1PKqHtyjPYDfgkqbTuDoJn3TCZ7tmfG75AkQOlAXXpP/TR4UtYxBd5nSm1yYmV0QcNwHE0DV6c8VhFWFtPsDaBOEzYQxo/SF1Cm+YDaBy8i7s91C4ih7rOBskN/HOvkR/hj+cOmi9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fIecFQhX9GIx+U4GG/bMzRFHNuXCKjLGMrH5amco2x8=;
 b=eguPdPdBMLjONVamLc4EEEG8gf/73G+MwmhwRJghtez/UoCM8XFySeWppSv6rtknvlocMBF8vTIdyxBX7iJkR1nF2DWqv1wp4LYY4gKvpUUzqTYYVsSUySV6348PDCSnkcr76JhVcSuRgDDCnAvn0Q8IdfU6FMN2eWJyc8GHf/9H6tMt7bhMhRbR8ntTpCXWd5tW80YR0szWjcjepFBp2jOO5tT9gIjtls7U3wrvf8SVHG+OGp51tSc/WgSTUm/TXOVm4IsuehsVpvYKAQVVVu2eKmH8hF+S9O84ll3VP/DDarQl0MUyi7ZnD9aWX23JMeDG+UuBf+Cn7wVZKH1NCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fIecFQhX9GIx+U4GG/bMzRFHNuXCKjLGMrH5amco2x8=;
 b=jZnwJg6/CNWMfouylmb1qsU7wa2hQrToy8PCv+si7JxiL+dhJYui5qYvawf26rOB1NQe0A5azEvbrAIPShKz0agLxEnSjf4kTsx/2gMGP+/RIMdnscG7mKh82cgt1qX+lC+qKBYOhOFWrZ3vYxPMQGh70g6xkCrNdEyMlu7W5TE=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYSPR03MB7387.apcprd03.prod.outlook.com (2603:1096:400:414::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Thu, 13 Feb
 2025 05:54:05 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8422.015; Thu, 13 Feb 2025
 05:54:04 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
	Julien Stephan <jstephan@baylibre.com>,
	=?utf-8?B?QW5keSBIc2llaCAo6Kyd5pm655qTKQ==?= <Andy.Hsieh@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"paul.elder@ideasonboard.com" <paul.elder@ideasonboard.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"fsylvestre@baylibre.com" <fsylvestre@baylibre.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "pnguyen@baylibre.com"
	<pnguyen@baylibre.com>
Subject: Re: [PATCH v8 4/5] media: platform: mediatek: isp: add mediatek
 ISP3.0 camsv
Thread-Topic: [PATCH v8 4/5] media: platform: mediatek: isp: add mediatek
 ISP3.0 camsv
Thread-Index: AQHbbNbRmiLpkwz5zku5kreqYRJ/h7NE3bCA
Date: Thu, 13 Feb 2025 05:54:03 +0000
Message-ID: <6f03d303ae9eca95248bf784a40f95f09593e205.camel@mediatek.com>
References: <20250122-add-mtk-isp-3-0-support-v8-0-a3d3731eef45@baylibre.com>
	 <20250122-add-mtk-isp-3-0-support-v8-4-a3d3731eef45@baylibre.com>
In-Reply-To: <20250122-add-mtk-isp-3-0-support-v8-4-a3d3731eef45@baylibre.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYSPR03MB7387:EE_
x-ms-office365-filtering-correlation-id: c8b258cd-4c5d-4369-d179-08dd4bf2d25f
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?V2RETVRBUmZkaWVCeWV1RndDWU5xbitRcTIvWjhCRVJ6QU1VVTVSK0tQVHRh?=
 =?utf-8?B?amt1c2RLK0pkWjhwOVJ3VTY2M0R3UFl4L29xK21VQWZOVGF6a0JuQ3dxVmp3?=
 =?utf-8?B?NnFteE5JcWVZSEZNR0RrOStEUlNhZmVMeXhoZ0IyTGtGTk5UUVdtbmZaeFM1?=
 =?utf-8?B?NHZaUVVVcnBhU2NGazBXNTUwYi91SWYwY2xwR2pSUURZRHJ2dE1sdlREbkRK?=
 =?utf-8?B?cHoxRXdJR0ZyRXdZZnZRWW40TENuR1NLdHlIeXJaSDBaalAyeGNWYXFoaloz?=
 =?utf-8?B?Zm1xbDA2Wmo1cWVSbE9HNTk0VlRURVFNaElFTm8xc1ZIMDJURENCWExxa2xZ?=
 =?utf-8?B?ZzR3ckI0SnFlSUNrSzZRdjVHRFNTZW9jZlo5OUFGMmRaVWhwczFGMUt2aWpy?=
 =?utf-8?B?cEFrT2xvd0FkTkZGTXl6VWcxQWdDaE9QbEwvaVVRTDJRZDk4cHFzL3YvM0xn?=
 =?utf-8?B?d1hVTFlvcmZhbnhoN25QNlIybTJsMUlCQ2w1Q3RRQVRpNjk2bGJ0Vjl2N1RY?=
 =?utf-8?B?aURmYVR2T0V0Ti9kUjh1NjJic05QTW05dVRmNHIxTWpNdlBBbTFjb1JuMEkv?=
 =?utf-8?B?eC9ITndpdThDYXhYTWxJWTBFOTBaS0lmUlc1QktjV2dvZlJ1L2RFNmNJQXZN?=
 =?utf-8?B?ZDY4NmVnd0tLNjgzYmo2Q25SL0wrd1p1RXkxbFN5dE90OXUwdXYzSENYbVZi?=
 =?utf-8?B?TkJua0VLL1BoYTVSajhObkdqYmpiT0lUQXc3VHgwSFBuVGZ4QzZ2MnFsOHZC?=
 =?utf-8?B?QkR1amUxNVVkdlJjdWdhdmVKRFQ2VmNEbU5LZnNqc2Z0NGpRd25uQWlrWFFH?=
 =?utf-8?B?WUgzSmdGQm9Cc0hWUHlXNFN4dEVHbEVLdGRxSzUwaTlicWF2OFNjTlA2YWNh?=
 =?utf-8?B?eUc2amduNGF1QzIwb09LT2RrazlWc0xRenNuWDdmQjY3aWRaQXpJYS9rbHJX?=
 =?utf-8?B?OHRmRUZxU0JKUTBXdGphYkRBVlhqb3BIM0d2b2NKT2NSRnkybE9FdkNoNVFm?=
 =?utf-8?B?eDNMaS81U05MKytSUVlPb0UxbC9pakhJbTQ2V1IyNGxWbjUzUzBnUkZmM3F4?=
 =?utf-8?B?UUFXUmpxRTl4eUV0VktVbDFzcG1JRHpEeGJ1b29heXRPaWcrbzZyeGMza282?=
 =?utf-8?B?bEpnV1N1QnZRTytZSkNpRUN2dlJtVEV2bVRKTGg0Tk1RSklzWXh3cEJoOVI3?=
 =?utf-8?B?WjlRS2pqUE91S3VydDY0TFdONVh1ZG9CL2QwSi9HYWdrcFMxTlF1S2V5ak1r?=
 =?utf-8?B?bno5WmI5MitoMm9yOHZFUnlON3hiRFJLd2Jvb1NWRWNCQzdTaVFTNWJDQjVo?=
 =?utf-8?B?UmthZW5ZOWhGWDNRamxldGw4aTh3djlTOC94cW1ubENxL252eHpMdndLT21E?=
 =?utf-8?B?OFdxVElMQVBBcG4vZWNLNWtnVEh0RWNTak1BVmR4ekNaWTRDbUF1REsrVzhP?=
 =?utf-8?B?SWVycmw3alRha2h3bHRmVllZYmN6MDk1VW5lbjFMMXRtQ1NWWitIQWM4N0h2?=
 =?utf-8?B?TkFWVnNDR3FkK3RsRnhnRFc4UlorWUZXaythQ0lUY2dvRStXZXE1elNyQi9m?=
 =?utf-8?B?bll4ZEpub2pQY2FmQ3dUZzIyMUVoSjVkWHNjdHJ0SVdiNDVNMkE4aUZUckNU?=
 =?utf-8?B?ZDJFOFpjLzhHZlVuN2MrU1JnRi9DaThySXhGNmZEMW1teENTSTdPcXo5a09s?=
 =?utf-8?B?clBVY1MwMXliZ3FjVHc0ckU0V2NaWnBGNkh3bFF4Q0NGWXZkK1ord21hMFlV?=
 =?utf-8?B?V1o5L0d0TXYxV2UrN3BJSUVCS09pbDVLd0doRFB1ZWhHLzR3YUwxYThvNk9o?=
 =?utf-8?B?RmsvcitBWGZvYzR0OVFVS0EyTHBnK2V1b1hpRk53WDVIYlFHTWpSRXpvMUFl?=
 =?utf-8?B?Q3U4TUVVSXNWYXluYjcyaFlHTW9LZXVKR1F0UTdjYUtZWjkvSDZqN094Wjhz?=
 =?utf-8?Q?m8Vw4Am2YO3L6vLi1nqewxM5aK4PtIIL?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZTRjd0QvdmU1STBJSVFPellOaWExYWdueFhEckFWazRZaXArcWpGa0lQOWRp?=
 =?utf-8?B?NWxjdlo4bVdyQ25ZNTRqL1VFWWowam9jRStja1JXWUZoUHBQaDNWWWt3M1Fv?=
 =?utf-8?B?OUtlc1QxQ1dhcFAwZk1SQ0hkTHpaNDk2Mlptd0pQQTJEb0JaOW1zRjVwaDkr?=
 =?utf-8?B?M3RkeDZkK3lZVTF2Z2dTY0paZkNEVnk0K3gzR01pL2xxb0htbGIxa0pNOGZN?=
 =?utf-8?B?SUl1KzdidWJhTVplVlVmSFRuTzRkNDR3T2VxdS9VbVNXYVRCaHgzLzVPM1hW?=
 =?utf-8?B?TFY4VTl6SEZaTG5YWUlhZUtOT05VUEVncnZrbzN2VzVwRUx3SHUrc3k3ODZ4?=
 =?utf-8?B?NkFMNVNTUEJMSnBodkgwOGV6bDFZK21yaFBLTHk3dzJIaGpGRFZLYVkvN1JY?=
 =?utf-8?B?KzdINmQ5SkxsS3dMbGRnZ0ZhNEhGZWFNMERDMnJqemw2dU03Y201UlZrN28r?=
 =?utf-8?B?QmltNGVsK1cxNmJJUDNDZi9Fak9ZNG1kWmducGxkSDhLWnk3K2R4ODB3WW1N?=
 =?utf-8?B?dFRKRU91eXdIdWVPc1ZEdTVTVTJkS3U5K2U2YjVuYlIzWXl4WWdLUTVUdGV0?=
 =?utf-8?B?K3Vyc2ZzSGVJbFZFUGQ0MnRiUW0vWWZVYlVPUzNCeGExeTFCRmJoUjUyTi9C?=
 =?utf-8?B?ZmxKelBjYWlMVkplWDRNakNzbTZBRUlHVHppSmNwUndwZHVCOURURHFZTHZB?=
 =?utf-8?B?dTRJdDRLcmNIZ2tOb3FqYmpxWllFZTdRWlNYaE9ZYk9MVzM1RmNQSkJWdmh1?=
 =?utf-8?B?VTJRVHBMSitqcXdsZDJzZGV6TWlibkRCSVo4cEcrb1VvSFZxenhwQk5uS3dK?=
 =?utf-8?B?LzJqZGY4Mld2cnJwTlg5ZitNRzVnTUFMZGoyZEozMjNiNWlNenRIdkxiVzF2?=
 =?utf-8?B?VlF6RjNORmxFb2FSUDRwQ0xtUzZFNzhZMkF4cHErR05IMVY1a1EwZjJERXVS?=
 =?utf-8?B?SVpVSTBPNS9iTmhqRFRrZjJRMy91V01HSUM0OUxkWXg4bUR3OFNDYWZXMngz?=
 =?utf-8?B?ZXR6MlR0YmtYZWpBcnZlbHN4SzZhcWl4TTZtOXVqeCs2ZFltTE54N3JsM0hn?=
 =?utf-8?B?RWtzQWZPUWJuanBYZVJYYnpvQWFKYUV4NFFWYUszdncySlVqL0FCNy9sVUhp?=
 =?utf-8?B?ZHJvZG84RVRsdDhaeG81R0NwdVppbGpualZ6c2ZnMXRxekZxcmpnR1MxREc0?=
 =?utf-8?B?a0dFNmNscjRJeXVjUUxqT2cxdDd6NVpIQWVZT1IrNUoxTGNyeTU0WnlTUVlE?=
 =?utf-8?B?TWd0RGpDNTlGdE11Y0UzVUxHNUQ4U1gveVNmYXVWYm85RG5jK3hMZklScjlm?=
 =?utf-8?B?UWpWdmo3NzZBN1ZTTlFNYjFJMXFwMUxlM0RNaG83M0hScENnVzg5dHI5VUhJ?=
 =?utf-8?B?VzVrNWZJeTcrV0tPQnpFcVUxWGg1Rm5vRGJtM0NDQSsyRGVJNit1VDNYS0tr?=
 =?utf-8?B?d3hYZytKZ3I4RStHNmFYV1BqcGcvczhLY1NkNEQ5bDNPOU9xVVFlRVpEZkZ0?=
 =?utf-8?B?UXc0ZUZiMDMvS1d6RSt1cjhFeGdRb3pwVUZ4ME1HVlk0SXZIYU1CWHBnK3ds?=
 =?utf-8?B?aVFqbE1yQkFDZHl2bStQTURXNHBldFp2OVVFdHhLdVZZSG9oYis5WXkvUlhC?=
 =?utf-8?B?Y1B4N1JRTUphZ2hSUUJoalovS2t4Y3NURDNBTDRwdW45QlFEbGYrVkQvS2ND?=
 =?utf-8?B?L3RZWFd4THBhdXRvck1kZTJoWjkraXc3cUYvTVNsVDdpMU10U0duM2NUeXlI?=
 =?utf-8?B?dkp2U3MvQXU2ZWczNUpycUdqOXpuTDJKQXRUVVd0Sk1rMmVKV1NySjZMUnZJ?=
 =?utf-8?B?OHN1QVY4ZFdRYnhHVXpwVmM3b3VlczJ6eVExM1VnME8yY00vY3RqV1Uzdks3?=
 =?utf-8?B?bWJpVThZclBKOUpaakpiTklJSWErNEVxVUZ2UU5BWlZvd0Irak1aZXRmQzR6?=
 =?utf-8?B?S09vQjRHTC9HTGpJN005dFpaMDZDR051ZE1TQWpyUm4wYVdmdyticGJjY1E4?=
 =?utf-8?B?dmh4U0hrUGkrNFNBVm51aU13VlpjT3ZhcnVicWdoY2RBY0JvYzFkNTU4TDZN?=
 =?utf-8?B?VS9aaFVHdmFZeFB6Z1pMVE1OTEEyeE1Mdnp3Zkh4UUUrc1BVdGZPSDFoWk0w?=
 =?utf-8?Q?TVYC9BNV0izv6JQD2SThvWbxf?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E399D0577FC84D44AB710DB8DF9CD69F@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8b258cd-4c5d-4369-d179-08dd4bf2d25f
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2025 05:54:03.9584
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b3POpsV72bT++Ch1oLGYkzJD0l52d9iqIl+4dfgHq/yRSM9RmR5EhA0PaNpn3yKavRxo19BSTp96Vc0GTuCdmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7387

SGksIEp1bGllbjoNCg0KT24gV2VkLCAyMDI1LTAxLTIyIGF0IDE0OjU5ICswMTAwLCBKdWxpZW4g
U3RlcGhhbiB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxp
bmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRl
ciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBGcm9tOiBQaGktYmFuZyBOZ3V5ZW4gPHBuZ3V5
ZW5AYmF5bGlicmUuY29tPg0KPiANCj4gVGhpcyBkcml2ZXIgcHJvdmlkZXMgYSBwYXRoIHRvIGJ5
cGFzcyB0aGUgU29DIElTUCBzbyB0aGF0IGltYWdlIGRhdGENCj4gY29taW5nIGZyb20gdGhlIFNF
TklORiBjYW4gZ28gZGlyZWN0bHkgaW50byBtZW1vcnkgd2l0aG91dCBhbnkgaW1hZ2UNCj4gcHJv
Y2Vzc2luZy4gVGhpcyBhbGxvd3MgdGhlIHVzZSBvZiBhbiBleHRlcm5hbCBJU1AuDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBQaGktYmFuZyBOZ3V5ZW4gPHBuZ3V5ZW5AYmF5bGlicmUuY29tPg0KPiBT
aWduZWQtb2ZmLWJ5OiBGbG9yaWFuIFN5bHZlc3RyZSA8ZnN5bHZlc3RyZUBiYXlsaWJyZS5jb20+
DQo+IFtQYXVsIEVsZGVyIGZpeCBpcnEgbG9ja2luZ10NCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBF
bGRlciA8cGF1bC5lbGRlckBpZGVhc29uYm9hcmQuY29tPg0KPiBDby1kZXZlbG9wZWQtYnk6IExh
dXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4NCj4gU2ln
bmVkLW9mZi1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9h
cmQuY29tPg0KPiBDby1kZXZlbG9wZWQtYnk6IEp1bGllbiBTdGVwaGFuIDxqc3RlcGhhbkBiYXls
aWJyZS5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBTdGVwaGFuIDxqc3RlcGhhbkBiYXls
aWJyZS5jb20+DQo+IC0tLQ0KDQpbc25pcF0NCg0KPiArDQo+ICsvKg0KPiArICogQ2Ftc3YgbW9k
dWxlIGlzIGFibGUgdG8gaGFuZGxlIHVuZGVycnJ1bnMgdXNpbmcgdGhlIEZCQw0KPiArICoNCj4g
KyAqICAgICAtIEZCQ19GQl9OVU06IHRoZSBudW1iZXIgb2YgdXNlcnNwYWNlIGJ1ZmZlcnMgYXZh
aWxhYmxlIChmaWZvIGRlcHRoKQ0KPiArICogICAgIC0gUkNOVF9JTkM6IHVzZXIgd3JpdGVzIDEg
d2hlbiBidWZmZXIgaXMgcXVldWVkL3VucXVldWVkDQo+ICsgKiAgICAgLSBGQkNfQ05UOiBkZWNy
ZWFzZWQgYXQgU09GIGluZGljYXRpbmcgdGhhdCB0aGUgbnVtYmVyIG9mIGJ1ZmZlcnMgZmlsbGVk
DQo+ICsgKiAgICAgICBieSB3cml0ZS1ETUEgZGVjcmVhc2VzLiBJbmNyZWFzZWQgd2hlbiB3cml0
ZS1kbWEgZG9uZSBpbmRpY2F0aW5nIHRoYXQNCj4gKyAqICAgICAgIHRoZSBudW1iZXIgb2YgYnVm
ZmVycyBmaWxsZWQgYnkgd3JpdGUtRE1BIGluY3JlYXNlcw0KPiArICogICAgIC0gUkNOVDogaW5j
cmVhc2VkIGF0IHRoZSBlbmQgb2YgZW5xdWV1ZSBpbmRpY2F0aW5nIHRoYXQgdGhlIHNvZnR3YXJl
DQo+ICsgKiAgICAgICBtb3ZlcyB0byB0aGUgbmV4dCBidWZmZXIgZm9yIHJlYWRpbmcNCj4gKyAq
ICAgICAtIFdDTlQ6IGluY3JlYXNlZCB0byBpbmRpY2F0ZSB0aGF0IHdyaXRlLWRtYSB3cml0ZXMg
dG8gdGhlIG5leHQgYnVmZmVyDQo+ICsgKiAgICAgRHJvcCBjb25kaXRpb246IEZCQ19DTlQgPT0g
RkJDX05VTQ0KDQpUaGUgZGVzY3JpcHRpb24gbW9yZSBjb25mdXNlIG1lLg0KQmVsb3cgaXMgd2hh
dCBJIGd1ZXNzOg0KDQpSQ05UX0lOVDogVGhpcyBpcyB1c2VkIHRvIGluY3JlYXNlIDEgb2YgUkNO
VA0KUkNOVDogUmVhZCBwb2ludGVyIHdoaWNoIHBvaW50IHRvIHRoZSBsYXN0IHNvZnR3YXJlIHBy
ZXBhcmVkIGJ1ZmZlciBjb3VudA0KV0NOVDogV3JpdGUgcG9pbnRlciB3aGljaCBwb2ludCB0byB0
aGUgaGFyZHdhcmUgbGFzdCB3cml0ZSBidWZmZXIgY291bnQNCkRyb3AgY29uZGl0aW9uOiBXQ05U
ID09IFJDTlQNCg0KTXkgZ3Vlc3MgaXMgdG90YWxseSBkaWZmZXJlbnQgd2l0aCB5b3VyIGRlc2Ny
aXB0aW9uLg0KU28gbGV0IG1lIGFzayBxdWVzdGlvbiBhYm91dCB5b3VyIGRlc2NyaXB0aW9uLg0K
DQpSQ05UX0lOQzogdXNlciB3cml0ZXMgMSB3aGVuIGJ1ZmZlciBpcyBxdWV1ZWQvdW5xdWV1ZWQN
Cj0+DQpEZXNjcmliZSB3aGF0IGl0IGFjdHVhbGx5IGRvLCBkb2VzIGl0IGluY3JlYXNlIGFueSBj
b3VudGVyPyBXaGljaCBjb3VudGVyPyBGQkNfQ05UIG9yIFJDTlQ/DQpGcm9tIHRoZSBuYW1pbmcs
IEkgZ3Vlc3MgdGhpcyBpbmNyZWFzZSBSQ05UIGJ5IDEuDQoNCg0KLSBGQkNfQ05UOiBkZWNyZWFz
ZWQgYXQgU09GIGluZGljYXRpbmcgdGhhdCB0aGUgbnVtYmVyIG9mIGJ1ZmZlcnMgZmlsbGVkDQog
ICAgICAgYnkgd3JpdGUtRE1BIGRlY3JlYXNlcy4gSW5jcmVhc2VkIHdoZW4gd3JpdGUtZG1hIGRv
bmUgaW5kaWNhdGluZyB0aGF0DQogICAgICAgdGhlIG51bWJlciBvZiBidWZmZXJzIGZpbGxlZCBi
eSB3cml0ZS1ETUEgaW5jcmVhc2VzDQo9Pg0KRkJDX0NOVCBkZWNyZWFzZSB3aGVuIFNPRiwgYW5k
IGluY3JlYXNlIHdoZW4gd3JpdGUtZG1hIGRvbmUuDQpJZiBGQkNfQ05UIGlzIDUgaW5pdGlhbGx5
LCBpdCB3b3VsZCBjaGFuZ2UgdG8gNCwgNSwgNCwgNSwgNCwgNSBwZXJpb2RpY2FsbHkuDQpXaGVu
IFNPRiwgaXQgY2hhbmdlIHRvIDQuIFdoZW4gZnJhbWUgZG9uZSwgaXQgY2hhbmdlIHRvIDUuDQpJ
dCBzZWVtcyB0aGF0IHRoaXMgY291bnRlciBjb3VsZCBub3QgYmUgdXNlZCB0byBjb250cm9sIGRy
b3Agb3Igbm90IGJlY2F1c2Ugc29mdHdhcmUgY291bGQgbm90IGNvbnRyb2wgaXQuDQoNCkRyb3Ag
Y29uZGl0aW9uOiBGQkNfQ05UID09IEZCQ19OVU0NCj0+DQpJZiBSQ05UX0lOQyBpcyB0byBpbmNy
ZWFzZSBGQkNfQ05ULCBGQkNfQ05UIHdvdWxkIGZpbmFsbHkgYmUgbGFyZ2VyIHRoZW4gRkJDX05V
TSwgdGhpcyBpcyB3ZWlyZC4NCklmIFJDTlRfSU5UIGlzIHRvIGluY3JlYXNlIFJDTlQsIGFuZCBz
b3Rmd2FyZSBjb3VsZCBub3QgY29udHJvbCBGQkNfQ05UIGFuZCBGQkNfTlVNLCBob3cgaGFyZHdh
cmUgd291bGQgZHJvcCBjb3JyZWN0bHk/DQoNClJlZ2FyZHMsDQpDSw0KDQo+ICsgKi8NCj4gKw0K
PiArdm9pZCBtdGtfY2Ftc3ZfZmJjX2luaXQoc3RydWN0IG10a19jYW1fZGV2ICpjYW1fZGV2LA0K
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgbnVtX2J1ZmZl
cnMpDQo+ICt7DQo+ICsgICAgICAgdW5zaWduZWQgaW50IGZiY192YWw7DQo+ICsNCj4gKyAgICAg
ICBpZiAocG1fcnVudGltZV9yZXN1bWVfYW5kX2dldChjYW1fZGV2LT5kZXYpIDwgMCkgew0KPiAr
ICAgICAgICAgICAgICAgZGV2X2VycihjYW1fZGV2LT5kZXYsICJmYWlsZWQgdG8gZ2V0IHBtX3J1
bnRpbWVcbiIpOw0KPiArICAgICAgICAgICAgICAgcmV0dXJuOw0KPiArICAgICAgIH0NCj4gKw0K
PiArICAgICAgIGZiY192YWwgPSBtdGtfY2Ftc3ZfcmVhZChjYW1fZGV2LCBDQU1TVl9JTUdPX0ZC
Qyk7DQo+ICsgICAgICAgZmJjX3ZhbCAmPSB+Q0FNU1ZfSU1HT19GQkNfRkJfTlVNOw0KPiArICAg
ICAgIGZiY192YWwgfD0gQ0FNU1ZfSU1HT19GQkNfRU47DQo+ICsgICAgICAgZmJjX3ZhbCB8PSBG
SUVMRF9QUkVQKENBTVNWX0lNR09fRkJDX0ZCX05VTSwgbnVtX2J1ZmZlcnMpOw0KPiArICAgICAg
IG10a19jYW1zdl93cml0ZShjYW1fZGV2LCBDQU1TVl9JTUdPX0ZCQywgZmJjX3ZhbCk7DQo+ICsN
Cj4gKyAgICAgICBwbV9ydW50aW1lX21hcmtfbGFzdF9idXN5KGNhbV9kZXYtPmRldik7DQo+ICsg
ICAgICAgcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQoY2FtX2Rldi0+ZGV2KTsNCj4gK30NCj4g
Kw0KPiANCg0K

