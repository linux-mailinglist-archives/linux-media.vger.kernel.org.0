Return-Path: <linux-media+bounces-20765-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3423F9BAD9A
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 09:04:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9E281F22452
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 08:04:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2914D1A0BEE;
	Mon,  4 Nov 2024 08:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="qusQ5jEv";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="KPk5dsUG"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E7517C234;
	Mon,  4 Nov 2024 08:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730707456; cv=fail; b=gO4iwU585YArKU8xvIUyQc1810HNq7aP3dGdtV3pZLlESuKl16BAn4zmcUcDWRIAyR3XDzPViGjavjRSrQ2pASbjIragSDtk67b0jB2eJS0dYN0obZ1CFZ2fJXY2gaV1LPY5GIhfZAAmWFGcPE7Uu3ekgvDHe5uQDSUiLasDBD8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730707456; c=relaxed/simple;
	bh=h/ai7aQ7fWJRMIw2LogJAAYPCdWu5M0ZmPIfS2mwfHU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MY43wnvNPWp+x5FG1QIUbBxYSFj/dxcv48LSBd4qlC2m71fROE/ROuuA4ORgKwBZ/WXf1fRDe02aF32Dz6Rtfu+D1xrnqpwciNEq0+F7VU4DR0Q5UL8angBPQEA/BG6wj+SDQPAhaPdQH6tPYuNsfj6DlPZaiM2fACzk3dzd744=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=qusQ5jEv; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=KPk5dsUG; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 5d14099e9a8311efb88477ffae1fc7a5-20241104
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=h/ai7aQ7fWJRMIw2LogJAAYPCdWu5M0ZmPIfS2mwfHU=;
	b=qusQ5jEvEovA05zwBcF5tVfZ+wx0UPKw6U2Rs8azr3NPhVBl4PfumW2LxLw+vgJ7MnzAo6DewVY4UMcr31GSZGgmwtyskpGnSYltPFnvv2D72rzV5QMFVZQuj8ldRjBsKhc67B6jXlqRg/SFV0xMaAftKhhuDPrLrLWUAV7OVIc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:38af7e3c-c4ca-4a10-82c4-93f3fc639191,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:0ffca548-ca13-40ea-8070-fa012edab362,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 5d14099e9a8311efb88477ffae1fc7a5-20241104
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1898491940; Mon, 04 Nov 2024 16:04:06 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 4 Nov 2024 16:04:05 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 4 Nov 2024 16:04:05 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I5oHIQDKzDDzzzGPEUtLu4No0r0fx+i3l3TsVKQxTQoIPHipm1eskkL2YdVsqLnUAWFNkVquiUtezHSXTIdCQLDBeVfxxqUb1MvQTyfVdOekzqLA4lh9vDwDpIQ+2ZnVqF8lVwA8teA2I6j/7hTF9xCr8vzPaK08V0CiQXHWzYN87VN1VLDzGPmhF1ioLTrn33s1wsqERIsECHMTCHwcg7wflpcRHFKTc2m3rsaBcN2xcVmjDjdpRS5ekS9KlBHP6etNbmJbSSUTBaL3xdF1NIjLMYmJ/BksxzYE10S8oZcQ9q5Zso5pqLTgt7n677Vj7mr621vW9/1/B/w228wFIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h/ai7aQ7fWJRMIw2LogJAAYPCdWu5M0ZmPIfS2mwfHU=;
 b=tASjt87I+EosspXN7L3CNxpnVqtgFOMpd2hv99eOYyYMMXXUvwuu8nMbN+nBbWl/UVWjgnOx7iQu/szKof5udBHX/VIBi/WswbGNQcfjcV9K16LepDg/LT+OZx9bqr05p5gSemA6UhmwpawLEqHgqdDJo7R/1WZJl0ItTdsh1tio1pQzYde8Lo11rVim1+BkVslEjPjbQVV0FqQ5nOjWwHXN4y0IvKuC2V84VrUfT5RZ4uAlRS343eItSWuUO810bqpLaLCUZClAk1nhUeQtkbxcIteln1U6ZEpzK2ZRlGV2RMQ8dDg3nu2MSSAuewN83KkclAC9sKcmNFRDqUyuYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h/ai7aQ7fWJRMIw2LogJAAYPCdWu5M0ZmPIfS2mwfHU=;
 b=KPk5dsUGsrEdxrQFRtR0/vO5hnRZ7Y9REKlyAkM095htcE8ZFr7ZgHN7ikse9/RoUDUSBIm19MAhwU9sA9hlISlKow8zoSw1M74kF7FeUATomdm6eHDZuFXzjqsovHudSLQCfsIOlB/u50xxLvi89bHPbvxtfa/QJBp86+H9cjs=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB7081.apcprd03.prod.outlook.com (2603:1096:400:33b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.29; Mon, 4 Nov
 2024 08:04:02 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 08:04:02 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
	"christian.koenig@amd.com" <christian.koenig@amd.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?utf-8?B?U2h1LWhzaWFuZyBZYW5nICjmpYroiJLnv5Qp?=
	<Shu-hsiang.Yang@mediatek.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"yunkec@chromium.org" <yunkec@chromium.org>, "linaro-mm-sig@lists.linaro.org"
	<linaro-mm-sig@lists.linaro.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, =?utf-8?B?WWF5YSBDaGFuZyAo5by16ZuF5riFKQ==?=
	<Yaya.Chang@mediatek.com>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	=?utf-8?B?VGVkZHkgQ2hlbiAo6Zmz5Lm+5YWDKQ==?= <Teddy.Chen@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "hidenorik@chromium.org"
	<hidenorik@chromium.org>, =?utf-8?B?U2h1bi1ZaSBXYW5nICjnjovpoIblhIQp?=
	<Shun-Yi.Wang@mediatek.com>
Subject: Re: [PATCH v1 04/10] media: platform: mediatek: add isp_7x cam-raw
 unit
Thread-Topic: [PATCH v1 04/10] media: platform: mediatek: add isp_7x cam-raw
 unit
Thread-Index: AQHbGj2G8utVn4Ab5UaBggOzyqwWS7Km67yA
Date: Mon, 4 Nov 2024 08:04:02 +0000
Message-ID: <e6336feb9043f1cf35949fb0c93aa18fc05415cd.camel@mediatek.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
	 <20241009111551.27052-5-Shu-hsiang.Yang@mediatek.com>
In-Reply-To: <20241009111551.27052-5-Shu-hsiang.Yang@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB7081:EE_
x-ms-office365-filtering-correlation-id: 2cd506b0-89e2-4659-fd31-08dcfca73ef9
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?K3FEM3RnQk1KRnhpV05YSklFajJjdlN2ZVFoYy82dkVnUDhsdHdDN0Q4N1Z1?=
 =?utf-8?B?c2tBQytGZ1JOTlN0N3h4NGZFZEY0NWNwOUtEa1VzQUxDcVZLVU9qbUhkRzZI?=
 =?utf-8?B?VEhwYUg3M0NPbFZZdXhNc3lmekdrY0cxaFBFRi9pcUFuMzJTdS9RUVROcVVH?=
 =?utf-8?B?djU0NHpaWGNreE1Ed1dST0FEUG5BR0FnV0RJZHk4cVNlVERvUU1zUlQrNDlO?=
 =?utf-8?B?eXorSjQ2WXBBM2lnUzd4T0J0MU1tYjl4bjA4S241bDRLRkxJSHhITTc5RWxp?=
 =?utf-8?B?UmRHZjdsQVk1UG5lUDJ6MHQ4K21SRHFPa1duUDhrZzJIc3g3cTIvTDJHQWRO?=
 =?utf-8?B?Vllmalc5UDhDSHFlaU5hNkxnR2NCMVQzRm15dGtKVmt5MEp3VWtabnlEUjlo?=
 =?utf-8?B?QmdEclpvTlZZbXhEbXF6SFBkc2hLWHU2b2pmZitFT1duUEVBVVBxMC9YN25h?=
 =?utf-8?B?Yjh4Z3hvUzkyb3NNT2U0cmtGdElXbnFMUU05YnJkWUgvSTBnMmVoUmtNMXhD?=
 =?utf-8?B?RkEzSUdQaDlBNGsxdHQ2RUpJQWJia0IxdWo1V3JHSDUxRVZjdWtvS3ErVnFH?=
 =?utf-8?B?dDNxOXlXWDlmTEhlSnVXK2tUTnFPOFB4MUM5WWZNNm9LZkRJaGd4S2taRFUz?=
 =?utf-8?B?R0o4M0FGdWVBOVBuNUR0VWMyR2pKK2M0K0tJWm42Z0o3S09HZ3g2L0psayt2?=
 =?utf-8?B?RmpjZWJvQmQ3QUthVzk2cWVnenlqT3VvZlVXaDJBTkFQaW5hTWVPWmVyR1Az?=
 =?utf-8?B?RXVxbVBZUFJQeDNoU0RWdWtjT3NPNUd1Z0tvcS80c2NwRnFDTWNKb29tOGVu?=
 =?utf-8?B?b1cxQnpucWRiU1d0aHliVnhxSXVxSEtGR085eWtmb2JSR2d4dzg5QnpkUGhl?=
 =?utf-8?B?NVcwRzgvcnZySUJWT0h2T2RBM2RGM2t2V0lKWEp5aThEZUdFUVlmc0dORUht?=
 =?utf-8?B?TzdFZFRsUXMvQXpsT0tnU3BLUzB4aXBhQ0trTTFveHN0NUtXcGorYXZsQWtR?=
 =?utf-8?B?eU9kK1NzVXdCMDI2OUI4MEhVM21qQkpteUI3LzRFWVNyTWMvSy9WNVZxNVFv?=
 =?utf-8?B?Qm96cnpicDJTMlV1a0NaLzQ2Skp2R05iNnVXdm04MTlmeWZ1VUZyV1FKRlU3?=
 =?utf-8?B?ZXBEUG9DelBMK0pkZVdvRnFFajBIWnZkVlRoUXZKZy8xTHh6VG5oRERoOWxE?=
 =?utf-8?B?UXpjVm1kUGxZOXc4SlVtcCtyRm5SWjdYQlR4dWZkL3ZReE4xTExBcjZETmMr?=
 =?utf-8?B?UUlZNkRFZUtQSVBHL2pSV1VBYkROdmpYZEdWQ0NwNElGMWZZRVluZ0k4ZzYw?=
 =?utf-8?B?T3pjbjBRZHd4ZmlWdTdicS9HanVnZ0NNd1BrMUpyRzBVSGI3Nm9wZG1tRWhu?=
 =?utf-8?B?eStFRW9YallTU0tYYTgyOHAwblZQNUw5YWdsdTU5NTFLTzNHaldPTnhBQnA1?=
 =?utf-8?B?MkxlSVFvWFFQVjhFMmJWOG5KNlpncDJ6cC9jZHFzS09mY05HVEZOL2NicldD?=
 =?utf-8?B?eDcrOWJDaDV0WFp2SktHNVBudUtBMzFFTTR2R3h1QkZjMUlHcCt2M05VT0Ew?=
 =?utf-8?B?NzVmdUNtU3lmUXdyNTJaazV3VVFBMGNnOG8wT3hMeVVUaHlZZ1ZUdGdHMEZq?=
 =?utf-8?B?VXpzZTJFRlJNaHc0YnpaNkR5cXN0NklPVDlneG9kdmw5VlpxZHJhcVd3eHFS?=
 =?utf-8?B?YWZ4QkhDQTk4NWdpanY0ZGp6bUx1cjYrOTRGREFYSnBnSSs0djlHQWRGTFd6?=
 =?utf-8?B?aElNV2U5YmpnMnJOd1ppUzdVVm5VZDhFUVZCVmJiQk9yT0tWbjltMlpFQjRT?=
 =?utf-8?B?SCtBUEdmV2Fud3YyNmlpemFndlNrSjl0VXUwRG1mQUZYb281Tm53c0tFMzZH?=
 =?utf-8?Q?VwzRHnfcvvjtY?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z0Vob1gxRVBhL2xRVXR6UVN0dFh3UTcrOU93OGY0YnhPNnlDblJaV1RBQnpI?=
 =?utf-8?B?dFhvVVdmTDd6Q01lMDhad2Y3SjRLVUhaZm9zaFdZN2xSUjllTjZ6dlIxLzVG?=
 =?utf-8?B?Rm9hRmNIdEkycm1Wd3gyMUxJaWErMXBqTkMrY1MxdkF1V2V1NFQwa2pZZWRU?=
 =?utf-8?B?RkNCdGdJcTl4eCtsQVJVVzNJOXovQlV6Q2FrUHQ3M2g3aWVaVnowUHFmUjFR?=
 =?utf-8?B?eGFpUmpPQXJhNHhGRnRpRzhzeUVnTElUSnJISzhwcFFMMkpKWkxWSGF5NTFh?=
 =?utf-8?B?R3lqNmoyWnlvZWpTYmdNaDQ1OHE1Q1gwaGtmY3ZLUFNjVDdWbVJSeXdxYWI1?=
 =?utf-8?B?MG9HTDEvVEdIM1ZwbnNCYjkrUUNrQ3QzRGt3Rk5Na0M1ODl6KyswOU1JemdV?=
 =?utf-8?B?bGVWVzhlQWp0bENaUFJibW5BcEl1TnFBR2dyaVNHK0VOblg5RXNqRFpZV3k5?=
 =?utf-8?B?MVVyL1h0VnVLc2UwMXVNeGg1WjhuTzY1YnpqbWp6TTl4N21YRXEzVXprYnp6?=
 =?utf-8?B?cUVkMkEwZlZYZ3NsaE55RUxLbVJFdzJXN2lSS2RDT3hSZjlpQk1kOXkzUTNS?=
 =?utf-8?B?NU81Rm5QMzdkdkU4RnhaWUc1YUQrS3ozSEozV0RadHVPTWgzTHdZSEtvZ3I0?=
 =?utf-8?B?akFKOTBOVjNjQnVNMk8wbFE1RGVpWHJVUlhESFlUSkdFdjVRZ1M5dHJRcTRM?=
 =?utf-8?B?dE1ncmhDUXNNM3c2OXR5M3drVGlKNHlJT1FEc09pcHBwbnFuMkpaZ0NsUCsx?=
 =?utf-8?B?a2FZaForRWxlQTEwazJjTXJNZ1dXek14cjk1Q3QxQVlzNVFWUHBZaE9wRGpy?=
 =?utf-8?B?NDdmMWZBamN2MWZGbytQR21GQTIxQkVMdmdqQW84b2d6T2FEVk9zUWQxR3lD?=
 =?utf-8?B?S2diOERPTW1xK09ySk5FVENuTGNSYUYzZDJ0S1dvU2Y2VHF1ZURzUmxxY0s0?=
 =?utf-8?B?WHZmYXZYais0MHpiaEZHZk4rZUNUMjRDVkpFWHEzTnY2a0RrZEdCZnFnOVF1?=
 =?utf-8?B?VnpKRUp5OEhvdnV4eTgvR205azZQUHZITGVDbzEya2tEdFk5ZjRjRXozZkZY?=
 =?utf-8?B?eXZ6dm80VVhBS3pBaGdmTlFsL2hUSktRRGQvL0V5RlNsRE12RFZiVEs4am5B?=
 =?utf-8?B?RzUwTWFUOTQvdHpJRmxoK0dOYnZkVHhQR2tiMkFudU45b0VpVXBRY1NVenJ0?=
 =?utf-8?B?TmdDd1NldkdjclcvM2Jpb1M0QkNvZXBrK1duSTdQamw3dUxsRGlTclJkTEQ0?=
 =?utf-8?B?OG0yZi85NWp2WEhNVEpJZUtOZ2NabGQzbjVITzlLRTZndDhNVFgxMDBTSloy?=
 =?utf-8?B?Q0dJeXhtMGxEMkE5U1JDclpvMkgvcFFEdmYyZUpjYUprZlNPNDR0bkVaV2ZW?=
 =?utf-8?B?TkJWR0x4V1lvang2SGNqVlZVS1p3Q0F3QWRpNGQvbW5EQmdRN0FyQTZuQks4?=
 =?utf-8?B?N1FZZEY2d1QwM1Q0UVE2b2xrT0dPc0JScDlWd3ZRbit5bXFSRWhSZm1BY2hW?=
 =?utf-8?B?R2VqSERLWHArbURCcnU3Wnd5NmtmS0pZWFB5Q1h3bldjdWVOSm9UTDFyL0Z4?=
 =?utf-8?B?a2FLdUpVZnlxT0VuQzVCNXhLdHpsSFhhT3I1aWU2K1VEZVNhZU13dW5vS1Vk?=
 =?utf-8?B?KzlsTFVmVkJiVy9SUnE1RUFCUktnUTRId0hUZHdIdzlOZFVidnNrbUQyU2pl?=
 =?utf-8?B?SjQ0cDIwaVIyN3ZKcEV4dWh0c0dNTG9IR0dLdjNvTVNyaGJCTWtCUFhJNEhl?=
 =?utf-8?B?MUdhbDArSVRnRThXdFROVVNmVkZMcXJEdC9HdlorWDVraURld0swd1llRVo4?=
 =?utf-8?B?Z01BdUdmdHZDQ2dTb0FWbjN0YWdXRjErcSs1MTZuOUZaWjZwaXpwM0crOEIv?=
 =?utf-8?B?NTJqKzV5aXl3MXdIY0l1YlVDZmZHMC9kVmVSckZla2s0dlZxV2hVTkszNXlZ?=
 =?utf-8?B?OFFEelRMcnRSa2t5ZEpWb1haUmM0bzVXeTFIQVlLdzdoTlN6Zy9FNXRjcTc4?=
 =?utf-8?B?RmtvRzZaNjYxWXBwUWh2SHZlMVlEYWlYaTdNT3dYTllwREd4N3hMRGFkNjdn?=
 =?utf-8?B?NXVhN05tMmJySXBHK0dQU1pENkh3RzUwMU1CSnFVQ3RFdnBUL2lDYjZPWTdi?=
 =?utf-8?Q?zcGSBLLYm8fjNx3Sx690C02lo?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D6AB5FD8400DAE42AE6AB692D52FE359@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cd506b0-89e2-4659-fd31-08dcfca73ef9
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2024 08:04:02.5685
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FvaYlw7UbyekhiEImu69/wA9jPcxBH4BO3PgS8hfKhuoyNtBZojWFzaXONg87CTWXYwDmfMExsDIapgR4ilshg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7081

SGksIFNodS1oc2lhbmc6DQoNCk9uIFdlZCwgMjAyNC0xMC0wOSBhdCAxOToxNSArMDgwMCwgU2h1
LWhzaWFuZyBZYW5nIHdyb3RlOg0KPiBJbnRyb2R1Y2VzIHRoZSBJU1AgcGlwZWxpbmUgZHJpdmVy
IGZvciB0aGUgTWVkaWFUZWsgSVNQIHJhdyBhbmQgeXV2DQo+IG1vZHVsZXMuIEtleSBmdW5jdGlv
bmFsaXRpZXMgaW5jbHVkZSBkYXRhIHByb2Nlc3NpbmcsIFY0TDIgaW50ZWdyYXRpb24sDQo+IHJl
c291cmNlIG1hbmFnZW1lbnQsIGRlYnVnIHN1cHBvcnQsIGFuZCB2YXJpb3VzIGNvbnRyb2wgb3Bl
cmF0aW9ucy4NCj4gQWRkaXRpb25hbGx5LCBJUlEgaGFuZGxpbmcsIHBsYXRmb3JtIGRldmljZSBt
YW5hZ2VtZW50LCBhbmQgTWVkaWFUZWsNCj4gSVNQIERNQSBmb3JtYXQgc3VwcG9ydCBhcmUgYWxz
byBpbmNsdWRlZC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFNodS1oc2lhbmcgWWFuZyA8U2h1LWhz
aWFuZy5ZYW5nQG1lZGlhdGVrLmNvbT4NCj4gLS0tDQoNCltzbmlwXQ0KDQo+ICtzdGF0aWMgYm9v
bCBtdGtfcmF3X2ZtdF9nZXRfcmVzKHN0cnVjdCB2NGwyX3N1YmRldiAqc2QsDQo+ICsJCQkJc3Ry
dWN0IHY0bDJfc3ViZGV2X2Zvcm1hdCAqZm10LA0KPiArCQkJCXN0cnVjdCBtdGtfY2FtX3Jlc291
cmNlICpyZXMpDQo+ICt7DQo+ICsJdm9pZCAqdXNlcl9wdHI7DQo+ICsJdTY0IGFkZHI7DQo+ICsN
Cj4gKwlhZGRyID0gKCh1NjQpZm10LT5yZXNlcnZlZFsxXSA8PCAzMikgfCBmbXQtPnJlc2VydmVk
WzJdOw0KDQpUaGUgY2FsbHN0YWNrIHRvIHRoaXMgZnVuY3Rpb24gaXM6DQoNCnN1YmRldl9kb19p
b2N0bCgpIC0+IG10a19yYXdfc2V0X2ZtdCgpIC0+IG10a19yYXdfdHJ5X3BhZF9mbXQoKSAtPiBt
dGtfcmF3X3NldF9zcmNfcGFkX2ZtdCgpIC0+IG10a19yYXdfZm10X2dldF9yZXMoKQ0KDQpJbiBz
dWJkZXZfZG9faW9jdGwoKSBbMV0sIGZtdC0+cmVzZXJ2ZWRbXSB3b3VsZCBiZSBjbGVhcmVkIHRv
IHplcm8uDQpJIGRvbid0IGtub3cgd2h5IHlvdSBjb3VsZCBnZXQgYSBub24temVybyBhZGRyIHZh
bHVlPw0KDQpbMV0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9n
aXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdjRsMi1z
dWJkZXYuYz9oPXY2LjEyLXJjNiNuNzUzDQoNClJlZ2FyZHMsDQpDSw0KDQo+ICsJdXNlcl9wdHIg
PSAodm9pZCAqKWFkZHI7DQo+ICsJaWYgKCF1c2VyX3B0cikgew0KPiArCQlkZXZfaW5mbyhzZC0+
djRsMl9kZXYtPmRldiwgIiVzOiBtdGtfY2FtX3Jlc291cmNlIGlzIG51bGxcbiIsDQo+ICsJCQkg
X19mdW5jX18pOw0KPiArCQlyZXR1cm4gZmFsc2U7DQo+ICsJfQ0KPiArDQo+ICsJaWYgKGNvcHlf
ZnJvbV91c2VyKHJlcywgKHZvaWQgX191c2VyICopdXNlcl9wdHIsIHNpemVvZigqcmVzKSkpIHsN
Cj4gKwkJZGV2X2luZm8oc2QtPnY0bDJfZGV2LT5kZXYsDQo+ICsJCQkgIiVzOiBjb3B5X2Zyb21f
dXNlciBmYWlsZWRtIHVzZXJfcHRyOiVwXG4iLA0KPiArCQkJIF9fZnVuY19fLCB1c2VyX3B0cik7
DQo+ICsJCXJldHVybiBmYWxzZTsNCj4gKwl9DQo+ICsNCj4gKwlkZXZfZGJnKHNkLT52NGwyX2Rl
di0+ZGV2LA0KPiArCQkiJXM6c2Vuc29yOiVkLyVkLyVsbGQvJWQvJWQsIHJhdzolbGxkLyVkLyVk
LyVkLyVkLyVkLyVkLyVkLyVsbGRcbiIsDQo+ICsJCV9fZnVuY19fLA0KPiArCQlyZXMtPnNlbnNv
cl9yZXMuaGJsYW5rLCByZXMtPnNlbnNvcl9yZXMudmJsYW5rLA0KPiArCQlyZXMtPnNlbnNvcl9y
ZXMucGl4ZWxfcmF0ZSwgcmVzLT5zZW5zb3JfcmVzLmludGVydmFsLmRlbm9taW5hdG9yLA0KPiAr
CQlyZXMtPnNlbnNvcl9yZXMuaW50ZXJ2YWwubnVtZXJhdG9yLA0KPiArCQlyZXMtPnJhd19yZXMu
ZmVhdHVyZSwgcmVzLT5yYXdfcmVzLmJpbiwgcmVzLT5yYXdfcmVzLnBhdGhfc2VsLA0KPiArCQly
ZXMtPnJhd19yZXMucmF3X21heCwgcmVzLT5yYXdfcmVzLnJhd19taW4sIHJlcy0+cmF3X3Jlcy5y
YXdfdXNlZCwNCj4gKwkJcmVzLT5yYXdfcmVzLnN0cmF0ZWd5LCByZXMtPnJhd19yZXMucGl4ZWxf
bW9kZSwNCj4gKwkJcmVzLT5yYXdfcmVzLnRocm91Z2hwdXQpOw0KPiArDQo+ICsJcmV0dXJuIHJl
czsNCj4gK30NCj4gKw0KDQo=

