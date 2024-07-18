Return-Path: <linux-media+bounces-15102-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1578D93468B
	for <lists+linux-media@lfdr.de>; Thu, 18 Jul 2024 05:00:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4093E1F22075
	for <lists+linux-media@lfdr.de>; Thu, 18 Jul 2024 03:00:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBEA32D058;
	Thu, 18 Jul 2024 02:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="r5rfkDWG";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="HWJ1LfQR"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FC41F60A;
	Thu, 18 Jul 2024 02:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721271594; cv=fail; b=ZS1VG7e990hSQC3Wff1j5VpgwvVjyaxUH5jn2krXo/T77H3vpIiYiXpM+pmSR/Wl6OxlqebFFP0Nh8YDZWh0kztNG9kyLPtMyEoccOesU6dP8ubDsgSbxit6/DHAiYfygLI2vEorfsfLPzBlgrbqPhQ1HzcrOjM0UqmeW26H9EQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721271594; c=relaxed/simple;
	bh=g/yphn+wGP9YnixBTajsk7wGt73YPvLl4udwdZPhTYU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XDj1/1rTBpgk+3kjmGb4LBYUDL/V6G9rHn7bRRdGjQeZxUagGERM8IDU2W7J/aptOUf71vxV1Rz0HgrjhstJzAihQsipmPUqw1rFv3yIbnFN8yF/XCkCMnPONWLiwtGpYZoBDWVCdavzcfc5F+mDolq7nfBUbFteyZl5DpNeJOk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=r5rfkDWG; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=HWJ1LfQR; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: c8ac2d6244b111ef87684b57767b52b1-20240718
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=g/yphn+wGP9YnixBTajsk7wGt73YPvLl4udwdZPhTYU=;
	b=r5rfkDWGWrhi61xueiDWhwQLsKJ8Fuqj2sXv1C1dB0NSu72qbXMeYDU0/CExSMwv8AiQ7jr7/+fk0mMNUAQ4rWyMs8e57WPEVnf5WssO9HhtGGNQqOziV5uDFWGHYS3DvnTkwAOSmu01xoyY7tW1JA8hI5j1Gr4A6k4zV9dA73I=;
X-CID-CACHE: Type:Local,Time:202407181054+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40,REQID:98696149-f5db-40be-bfc8-85d993350ef1,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:ba885a6,CLOUDID:c9247ad5-0d68-4615-a20f-01d7bd41f0bb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: c8ac2d6244b111ef87684b57767b52b1-20240718
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1880727562; Thu, 18 Jul 2024 10:59:43 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 17 Jul 2024 19:59:44 -0700
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 18 Jul 2024 10:59:44 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MFJJa4Q/d3Q6bg2KEjusU45MnKKVR3k7OjDy+Hk/lJRGB6M5nsWhCltDpEn4/+l/T80Awmhb93DSs39esgMfHmegDh6uVBvBt5CIs7HZe3tCoUY1vJwSlZXVPkjZ1eJHzSf109TqlWOeE4U9qNmGw19d/ymudmQOkR299rUccJDjgTXkrHK4VMatv+bBbFlfZSUMEaT4N6RU9llpXbRApRkd/OvfY4vGUn2Y+eVloPcWJo7uAA0pE8epwTybvuLKEwE+TQdXMb1aIZCP4AyeE4CawP/zuMHqiJo195FVmYqERghaskh8MGO3JCN0gX06zykNVDdcc1tCOwHUT5PuOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g/yphn+wGP9YnixBTajsk7wGt73YPvLl4udwdZPhTYU=;
 b=toao4Ek0sxvZaE6oIuGCE+dQ+kdGPFd6o7MNySB4EriacfpbKAwmQ8Yt0F5uK5XfI8/Ar2M2Voc0TXkKcu0LmujKkTieajIvOLRJ7CYV2G242O8bQsSreDKsRyoaqexRDR7RpL1wTExdVyFDlLERQYpGik7WqnMpnYw3S3rdjBP3WUmg35gGL2FKDC74R2+vbSNqve52A/zdJYjAowISF4CFq37JZARfRBMW6m+YodHu8tjXFZZMdAyr5L4rSbxwlPZnLEz/fDb0VCIoaGkZSIUnRzjffL1G8QDE7xud4KsJMEddn3Mi9XzOdXHlE5chFPSQ6nVFETvp5TdF4AhTCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g/yphn+wGP9YnixBTajsk7wGt73YPvLl4udwdZPhTYU=;
 b=HWJ1LfQR4YxwzWX4z98fluYqHUoDX5IJmjprKG7VTam8cAYf3FiugCmZa6CuZSpqTgI5zWIHdsDmgfEnPZvLoMvXbkTdMaWN6CwcQtiDDdekNIjl1MbMG3cWKXlB799SQlRjckvXNQX1siKu6XT7v6TGASCvKxOpYfTdjMiMjfA=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEZPR03MB7701.apcprd03.prod.outlook.com (2603:1096:101:128::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17; Thu, 18 Jul
 2024 02:59:42 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.7762.027; Thu, 18 Jul 2024
 02:59:42 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "mchehab@kernel.org" <mchehab@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	=?utf-8?B?QW5keSBIc2llaCAo6Kyd5pm655qTKQ==?= <Andy.Hsieh@mediatek.com>,
	"jstephan@baylibre.com" <jstephan@baylibre.com>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "laurent.pinchart@ideasonboard.com"
	<laurent.pinchart@ideasonboard.com>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"paul.elder@ideasonboard.com" <paul.elder@ideasonboard.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "fsylvestre@baylibre.com"
	<fsylvestre@baylibre.com>, "pnguyen@baylibre.com" <pnguyen@baylibre.com>
Subject: Re: [PATCH v5 4/5] media: platform: mediatek: isp_30: add mediatek
 ISP3.0 camsv
Thread-Topic: [PATCH v5 4/5] media: platform: mediatek: isp_30: add mediatek
 ISP3.0 camsv
Thread-Index: AQHazhdkyJtqWsdLFUSbwSAjf5xgNbH74OKA
Date: Thu, 18 Jul 2024 02:59:42 +0000
Message-ID: <b154de51c3606406728026dc9f7efc587d7c465e.camel@mediatek.com>
References: <20240704-add-mtk-isp-3-0-support-v5-0-bfccccc5ec21@baylibre.com>
	 <20240704-add-mtk-isp-3-0-support-v5-4-bfccccc5ec21@baylibre.com>
In-Reply-To: <20240704-add-mtk-isp-3-0-support-v5-4-bfccccc5ec21@baylibre.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEZPR03MB7701:EE_
x-ms-office365-filtering-correlation-id: 4aa40eb9-9ce1-4517-5844-08dca6d5abf1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?OHlWbzlkWGwzeGlpM3BGWFJMcWdsakZ6RWVoSDQvZEdVODdXM09YK3V1RWZG?=
 =?utf-8?B?ZUIvMFRMNFNaZXFiazZWbWpjWU5lcC9kVmZGbTFBQWdsVmlncG81L29vVHhW?=
 =?utf-8?B?eWsxNi9VVnovL2g2cUY1eENmeXlVRnlmM2srSVI5cDJ2UUN2UzZ4RnpXQ3Br?=
 =?utf-8?B?TEFwaHpHcDJOTlliQjJLdnJqRjUzYnYwVHc3dVBOblViZmJkbE9ldStPRXox?=
 =?utf-8?B?eTlHMVhVYzhFQi8vUnFHSm9RVXkwWEtvOE1raEtWMHNlZS90YjJPTHdSMVQ1?=
 =?utf-8?B?YjQ2WVZFRkxoYU5xMno0REx2WWYyZVBDN1JrVTF4K2V3V09JSTFyQ1BLMnBU?=
 =?utf-8?B?WGV0V3BHNldnUHFKYU84WFRxSEpIU3YxeXBFTjNuZ2ZsWU9JdTltUVdPb0U3?=
 =?utf-8?B?WDN4TkRSKzgwZEJPTGN1eTVtQi83VzYzbTU0dW5KN2NxWjVzeGxkYTRhMitQ?=
 =?utf-8?B?MmtjZDN5MG4rclAvcEM1WnZ2ZFBwUGlMbzVXeUk4VXRKQjAxb25CMHI5ZEpC?=
 =?utf-8?B?TENlS0xTVVFCMDc1V3EyeHhGbFVMZjlwOXBPdjJSY2haS1dzUUpycjIxQ3lx?=
 =?utf-8?B?MmJIY0w4MXZuSkkvM29UWkpRaTl5MlB6VGdSMnkwL0hYSHlLVGoxMFNvbGFU?=
 =?utf-8?B?K1R4NVBOMElDbG90MzFocVoxYVpHUUUvZCtwSG9iMXpKNlgwRDZONU0rT2Nw?=
 =?utf-8?B?NTk0anl2Rk41NmNHYi9YanJhSG8zUzNiZEhqTzhOYTlmZm1JdjBNbTJiSzUy?=
 =?utf-8?B?eDZ6aUEzSTZCeU92dXhFMnpKN2Rya3Y0NjJQaG1Rd0R1Y2Q3MWtmaVBPTGMy?=
 =?utf-8?B?bllkTEFMMThNWm5BR0diamFYZHFRUmNvTkQ4R3F5ajJFL3pydnBOeXY2NWhE?=
 =?utf-8?B?ZFY0QmMrYmpyNElkRnRLTnBkNHFaN01wdHNtcHpZMlhwaFlqWE5jTUZIVWQy?=
 =?utf-8?B?UllBTGxzSU42ajljZTZ2dWwySjVHOTBlUlQvY0dwUHYyVHVqbkY4VVdSNzZl?=
 =?utf-8?B?RGpjK2l1VmZFbGZPdGIyVWNmUVZIWis4bGt4ekNpbDJCZy83bWRhYllpbEwy?=
 =?utf-8?B?ajZYNGJyWTQzTUxRZUFpNmRPUG53YWJwYUZYbEY4T2lzRUxsc2tYYnk3VG1D?=
 =?utf-8?B?MWFNQnhCODJxRkEvTjJuYzI1bS9mQ0NyekhkVnlIS29WZW96SUFhRFBaMEI3?=
 =?utf-8?B?eXdOKzE2WkwwQ0l0cTE4OFEraDBlUVc3SWJPSU53VUl2dkpjd282VC9jZGRy?=
 =?utf-8?B?emptbVdpRHovUmJobkRodE14WmMvU2pTOE8zbkVTWWVnQVMyL1krZThSeDda?=
 =?utf-8?B?VUc5L0U0aS9lVVFCR0IrU1JhUjR0dEdlMlk3bi8yeTBQYXZyUTJ4RHVic2ZE?=
 =?utf-8?B?VEg2MzVWSWZmaTJRVzd3NWF5WDNScjYrUmJPeDJvWEpYNVJmYW5pYzJxNGE0?=
 =?utf-8?B?UDhiMmFtSXUydHczRWhSVU16dFFXUkhIeEM1SHlPb0FzQmpaVUUrWUFsZjNm?=
 =?utf-8?B?MTRDbjVQRENRR3JZOXU3Mmh6RldOZUkwYm5sYUlQTDM4a2VQbzFCbFp5eVo4?=
 =?utf-8?B?SE84YWFrTGFHZUJ5TG5welVtQTJMa2UxejlPN3RaSTZyYWVoWVVHQ0YvU3Ey?=
 =?utf-8?B?Vnd1QzM2VXM1bkcvbklYbVhmQ1orSWhWL3BPQ0pmU21zU0NmOG1FZVFONWJU?=
 =?utf-8?B?Y1pBRXQzL0thT21jZ1NnU3VrZjFXMVo2YkVtN1lpcVpQR2pneVpnNUVFaHJI?=
 =?utf-8?B?ZExMNlAxZUQ2Z0poQndPaXdVTTgyRUhKdTJyR3ZuOG4zdjlPVU44M0tHUytj?=
 =?utf-8?B?d0pVejJWbDF1MVdZRmt2T3FSUTM0TUhWYWhIWlhhd2J4b1JtRnJwV0hHcE9Y?=
 =?utf-8?B?dytxOU4zREZOVWVreDZpQzlIRWlobjNDL3lETU45V3lmcWc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b2tRcHJSNTExTW1Eb1NYNmF1aVoxRXdGQUlNeTNQUSswRTZsTnVHNGcrUVRM?=
 =?utf-8?B?anhQdUFMMW44ZHd2WHM5ZDluUjNOakRUdHg3WEFrVnU2ZmdrN1d0Z0N5azM2?=
 =?utf-8?B?b1d2WjRYMTFuazJsRmNFOXhGdDVqV2huWEFGUmxGZGRlZXFDWHBvZTVMN1Fn?=
 =?utf-8?B?enpncVZsZ3daNU9aTUI0L3UyWVJINlcxSDVReldDYlJ0NWlockh1aWw0ZVI1?=
 =?utf-8?B?V0QyK1NBRkpyUlhodmJKUWQzQi9oVWQwMHByVlVoc2dWV2VXSDNocDg1c01B?=
 =?utf-8?B?cHZNZTFhRmxzcTF1Vm12ZDFSMlAzdEhDQS92VXpXbEpZS1BsWWV5aHhvOERp?=
 =?utf-8?B?RGh4WWppZVVSZmZhVzBDdGdsRjQyWlpNQWFSbUJGUWx0TkR5Mk05b3dYcFA3?=
 =?utf-8?B?QzhMYVBBYnQyZmNoUHduRlBuY0ZlVnRSc1pFY1hPNjdGZXZuYkdqMjJkczd6?=
 =?utf-8?B?MTg1TE5sMFJGR3pUeHVjdEc3bXhjWURFa28zUy9SdWZaMy9OT1dRN1RaakpL?=
 =?utf-8?B?cG9oai8xZzNPQTBvM2lzRFVXWnZId0FtUGNmK1NPOGJNWGJMUUlYNjRkR2hj?=
 =?utf-8?B?eU9FYVEvREh1eFc0Y1RiK0lOU0I4SEtkS2dETFNRWHNUT2lua2s4RXh6UTVZ?=
 =?utf-8?B?RllrMUhNcjkyQzRqdlRmUVlFZDB0WEQ3eU9lRmNlNU94emlIWWNWUEVaTVpE?=
 =?utf-8?B?MnFPcVVWNjVGa2lIeXRQTXFKVGg1cHcxcGFweFdTeFM0TUU4NmV5eFF4Z3gr?=
 =?utf-8?B?VTJWN3p4NzhXMk10UldKZmNXSjY5Z3FML2dRNGJleGZvNzc1MnRoMUYvclVp?=
 =?utf-8?B?b0NraVpJVkc5SkNlSXlmN1grRFk2TVhNbWNqL2FxMWQ2WU9TVGdvdWhscHda?=
 =?utf-8?B?dFJnM1pHYkJJK0h5Tzk0eE9YYWtUUlFReVgrd1k5eDJ4ZldjY2s0UElWdnAv?=
 =?utf-8?B?TjM1c05sNjJpL2pSc2JOQ3lKeGhVN2pCRDlWTmtIU01URnF6UmZvdlBFZ3N0?=
 =?utf-8?B?OXdodWovb1J5dVRPL25WemNRL3BoMlpHVXZkK1ArSDJLZWFOKzFjbTNicnFI?=
 =?utf-8?B?bDdHazZuR3JKNEtUckFOT3pEbmdNNlRxV1JMSjBMaCtQbXMwbUVQU2dHdXlM?=
 =?utf-8?B?YXo4M1RZZDlSUGozc0wyNHZHL2k4UmtvbU5sUFpWZFlLTU9aM1pibU5DMmRX?=
 =?utf-8?B?bzVKaTVUZFBKZUY4Nzc3YnlLYjhqUk9RNHBQSG9XNjN1Lzg2Mm81bG5nWGs4?=
 =?utf-8?B?UW9kY3kzdVkwTmRuNmZEU3VNM2g1dFJkZ0kxMnB4Wm91Y3QyaVNVdlpINWha?=
 =?utf-8?B?T3hBTGF6RmQ3NTdiS2ZMSTArN3N2b3VYOE11Q3M4VmFPOTBCem9YQ3M2TDRm?=
 =?utf-8?B?OTl2Umw4eUEwa1JZYm5yeEJ3YmhwMkNaekhWelNseG5nejVnZW0rYjNkZDRj?=
 =?utf-8?B?QjJxS3pwL0tHTEI2VER6dVZjeG9jZjdYemZ0emVNdklFL01EckN2ZjQxeXN4?=
 =?utf-8?B?YzdOMkVkSWduQVk1enI2OHFmV1kvc2pMZ2Nya2VlQmlMY2FvV1F2UWNFb3RS?=
 =?utf-8?B?L0V4WENBM1NNOTVqazEzQWt0anhUUUtIOTU5aW5CZjVPcllXN0FTT1cwTHNK?=
 =?utf-8?B?akRiT3piT1lFelpyL0lBWE1NUm10dWtXRUJpc1dyWGI0STh6NVpuOEtvYmRJ?=
 =?utf-8?B?V2hFNUhHSTNPeXNwaFZnemNJZE4rZGFWeGhHcmxDZThRMjBXVUlzU0g1YkRJ?=
 =?utf-8?B?SE9sTEZWdmlXMFE4eWNKL2hVTUcwWGwxdm1XMEdEY2dvWEtqZ2RGMXdqenBT?=
 =?utf-8?B?THcrVGdhemVhREZXc2p1VTBLT3NUTTVyVFovTnpvaWtkN1c2L09Mck5WNzNu?=
 =?utf-8?B?aWh2U0xVT3FWb0krTTQ5dlptTzVZSVl0UHp2dmlmWXhYQ1NEb1k2S09BUDd1?=
 =?utf-8?B?b3BaeFFhNldlZEYxSTlBN2l4akhJc0prL05obDZiMEg4VmFyckdlOHp4RW1X?=
 =?utf-8?B?MzF1a3Q0UHhMMk5oZHN5dXVKeUlTeHNxVDFqYWdJOVNNVStPd250U1BUNW43?=
 =?utf-8?B?MWhTQTF5aGJ4WXVoOFhpZ2taVmVqTG1PQjIxdCtTbWVZOHdLOHl3ME81dXMx?=
 =?utf-8?Q?Qp3h/gWAxvdBfGj5wHjcVn3oL?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E3C9A00405502B4EB89C5C2788B702C9@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aa40eb9-9ce1-4517-5844-08dca6d5abf1
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2024 02:59:42.2679
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lq46sJJchTTJ+I/u52jhc+5OZaImCewk1/3tLMP5fzJbTNV0g42HE3r23I82kks3osuLSYry89U/fwJ8uJA3SQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7701

SGksIEp1bGllbjoNCg0KT24gVGh1LCAyMDI0LTA3LTA0IGF0IDE1OjM2ICswMjAwLCBKdWxpZW4g
U3RlcGhhbiB3cm90ZToNCj4gIAkgDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBj
bGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsIHlvdSBoYXZlIHZlcmlmaWVkIHRo
ZSBzZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+ICBGcm9tOiBQaGktYmFuZyBOZ3V5ZW4gPHBuZ3V5
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
aWJyZS5jb20+DQo+IC0tLQ0KDQpbc25pcF0NCg0KPiArDQo+ICtzdGF0aWMgdm9pZCBtdGtfY2Ft
X2Ntb3NfdmZfZW5hYmxlKHN0cnVjdCBtdGtfY2FtX2RldiAqY2FtX2RldiwNCj4gKyAgIGJvb2wg
ZW5hYmxlLCBib29sIHBha19lbikNCj4gK3sNCj4gK3N0cnVjdCBkZXZpY2UgKmRldiA9IGNhbV9k
ZXYtPmRldjsNCj4gK3Vuc2lnbmVkIGxvbmcgZmxhZ3M7DQo+ICsNCj4gK2lmIChwbV9ydW50aW1l
X2dldF9zeW5jKGRldikgPCAwKSB7DQo+ICtkZXZfZXJyKGRldiwgImZhaWxlZCB0byBnZXQgcG1f
cnVudGltZVxuIik7DQo+ICtnb3RvIG91dDsNCj4gK30NCj4gKw0KPiArc3Bpbl9sb2NrX2lycXNh
dmUoJmNhbV9kZXYtPmlycWxvY2ssIGZsYWdzKTsNCg0KVGhlIGNvbW1lbnQgb2YgY2FtX2Rldi0+
aXJxbG9jayBpcyAiUHJvdGVjdHMgdGhlIGJ1ZmZlciBsaXN0Ii4gV2h5IGRvDQp5b3UgcHJvdGVj
dCBod19lbmFibGUvaHdfZGlzYWJsZT8gQW5kIEkgdGhpbmsgdGhlIG5hbWluZyBvZiBpcnFsb2Nr
DQpzaG91bGQgYmUgY2hhbmdlZCB0byAnYnVmX2xpc3RfbG9jaycuDQoNClJlZ2FyZHMsDQpDSw0K
DQo+ICtpZiAoZW5hYmxlKQ0KPiArY2FtX2Rldi0+aHdfZnVuY3Rpb25zLT5tdGtfY2FtX2Ntb3Nf
dmZfaHdfZW5hYmxlKGNhbV9kZXYpOw0KPiArZWxzZQ0KPiArY2FtX2Rldi0+aHdfZnVuY3Rpb25z
LT5tdGtfY2FtX2Ntb3NfdmZfaHdfZGlzYWJsZShjYW1fZGV2KTsNCj4gK3NwaW5fdW5sb2NrX2ly
cXJlc3RvcmUoJmNhbV9kZXYtPmlycWxvY2ssIGZsYWdzKTsNCj4gKw0KPiArb3V0Og0KPiArcG1f
cnVudGltZV9wdXRfYXV0b3N1c3BlbmQoZGV2KTsNCj4gK30NCj4gKw0K

