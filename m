Return-Path: <linux-media+bounces-21503-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3719D0B8D
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2024 10:24:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 16CBF1F22459
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2024 09:24:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 667A61917F0;
	Mon, 18 Nov 2024 09:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="jB6DAoY5";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="bAqMyUCR"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF93317C224;
	Mon, 18 Nov 2024 09:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731921826; cv=fail; b=QPN9ReOTQzonSBk93dcMrZD3tPftZJ6P7a6F0zdc5uaPTsTx8YbcZWBSrYQ38lTiuQMOYdmEs12A/4stTkPY/W44ZXAtkdjQWJ6HsXjvNVgMosKd7Pi761W88ISzz5YA5oBfl2AskNuMEoJ7NtSQ0kx46z9lI/Zb5bM6B3JRBM4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731921826; c=relaxed/simple;
	bh=CkgZ+uMyQNUHylKS+tftwrGjLM/c0CkVsRhKkTOgXXI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tbwI89SgAeF1UQy2ZUYKSky4fLAIU7cUXMtIxitrn8EflegEmRClgfERmEXR0tTU51Io5qclKzGkvmdTQq0P5kGIQplEfzNuPAAYZPz1OnN5P+W+tDKIKR0hgMeygaQRThJFuQXXJr3Blt5pINEhC3oE6YFQxp134QIPqjJqUDk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=jB6DAoY5; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=bAqMyUCR; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: ca6efefca58e11efbd192953cf12861f-20241118
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=CkgZ+uMyQNUHylKS+tftwrGjLM/c0CkVsRhKkTOgXXI=;
	b=jB6DAoY5C/W1sHHtonI3AnhixaIqEvf9lttOARcHrmiQhib3yE97yf0mp8rVOnkf5mk6CSDfa+eFvbRkbzMPTjwl57zePHmVVq/IK3tvlelGVIrogAaa6O+Bumut6DI0gA7MNTIeOZKwR7xbewaY2vb9QeGnNGuptDtCynPyG2o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44,REQID:a5496c00-b221-4930-84e5-e560fd1337f5,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:464815b,CLOUDID:06d23a4f-a2ae-4b53-acd4-c3dc8f449198,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ca6efefca58e11efbd192953cf12861f-20241118
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 139357620; Mon, 18 Nov 2024 17:23:37 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 18 Nov 2024 01:23:36 -0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 18 Nov 2024 17:23:35 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F/qBnVEwh1Nlq/oXgxO7Q0YYV2Zxpc3dwvWGn53Uq7GHe0zEt8QqTXeJlVVTV4SQDLnZfj+mlnz3u9CjwU7QaVkqwB84Xb/rDrkqmONdsobzjYPNqcZvjQWYK6XQvv7iXPjT19ry38v50ok/nIhGBMwixH7VFLgUpn/DwrVSVW2Ng8QavuOInpAR7uwppdI8k1jq04Y8rrmw8QwuM5EiV8LsqMRfFpTJjPwjKuHzAPdAC/Z5Ecc13AWNwsYvNcimiTsM+D5qfcXTgvlYEWosIIWazZrYGo74SCMccr+l0Mf7sg85Hagn1TWqho8Mx/cQOn4OSCm+ojxRrESumS3dHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CkgZ+uMyQNUHylKS+tftwrGjLM/c0CkVsRhKkTOgXXI=;
 b=g6Azk9uNFiWSLtcNJRqjrRrV115L9xQc0j1y3eLXeUnKwRabEP6b7jh2PDlwgAfA2YNR+CKnHIKQbYP0nNhyJ6/W6CmrChvaoqxbUwY7+VigAZ41HXTgm5CX0rPnya2HaQiZaPT/PDCfVvVy4yiJlMrLHb/6lyd3QVkpf08cNlQwmCYiza09oQ5V2ZIb2FMtLMI31UvSyLeC0o89aAArK50QWcHyqPJEQ7wKOf6ZtOpuRU6lI6NGfhDcatZ+jOEHGDba19OochLY9qQmawbHFjeEPJzHjhSliz1I21twv263uYwKT+C8K4vXBh3nLoXn5XX2/SxxTWhGxYwtswc2KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CkgZ+uMyQNUHylKS+tftwrGjLM/c0CkVsRhKkTOgXXI=;
 b=bAqMyUCR2R67cp1zHTpkpdHkS55TxVcIfpQ9CMYtAnCPpchqIdohw7Fw2J3TP3du7S+nMctH/rYmVZf4faCW6phHhsI+3PbAUQ2vbjCNqeep5lVR1UtrJ3mAyQ5hQ9ScaadlmCInlv9O9rquocQdtkpymTILy2pKDauMXNJUDyI=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by JH0PR03MB8333.apcprd03.prod.outlook.com (2603:1096:990:4c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Mon, 18 Nov
 2024 09:23:31 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8158.017; Mon, 18 Nov 2024
 09:23:29 +0000
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
Subject: Re: [PATCH v1 03/10] media: platform: mediatek: add isp_7x seninf
 unit
Thread-Topic: [PATCH v1 03/10] media: platform: mediatek: add isp_7x seninf
 unit
Thread-Index: AQHbGj1K7oS5BpZAxk+Yfu5zQIUxBLK9ApIA
Date: Mon, 18 Nov 2024 09:23:29 +0000
Message-ID: <4c142b6d0bb2514f59b333e6dcd30d5e4305b91d.camel@mediatek.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
	 <20241009111551.27052-4-Shu-hsiang.Yang@mediatek.com>
In-Reply-To: <20241009111551.27052-4-Shu-hsiang.Yang@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|JH0PR03MB8333:EE_
x-ms-office365-filtering-correlation-id: 5a8a1da6-a765-4d9b-4187-08dd07b2a9ff
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?UUJ5cklJS1gvRGFyY2dsZG9mRDNtcXZlZUNjR0FYNXhISTNBbGROZGttMnZU?=
 =?utf-8?B?SnpHZVRIMERkTi9XeFBqZStlY0MvMU5BK1FZb1NRN3NYWnA0YnhaN0pwOXcy?=
 =?utf-8?B?dTZpRHRDR3hlTG53dTBYdWlobEp2YStSZnBQK3p5TjY3OGg1TnBWMmJVRDc1?=
 =?utf-8?B?ZnhjL2c2SU85RndMNG9tTkhPMHNxU1lhdzZSazRIY2poRUwybkFzbEVjMElW?=
 =?utf-8?B?ek1KVEExeGh1bHpFdGppN2Jud0h1VW9SVXhXejNVSzMvT3R5aFgvTXVkQ1Jk?=
 =?utf-8?B?NnBVcEdpMUhYMWxpRk9SSmxHYjY3cy9mYm9lWEJtRm02YUJqRkNoN0ZvalN6?=
 =?utf-8?B?TUtNdEthR0pkazdHZzVvZnAycU9tOXIyR3ZNYUs1UXhSYXhxVmxNRGV2cldW?=
 =?utf-8?B?VHdQRG15THBrWTVqQnVpMkMyK1ZHZEVkOFgvU3pkNHRQc0YxWWpzMm0vaE96?=
 =?utf-8?B?dUJ5Y284UTRzRllqRkcrZjBaOGFQVVVDSmxXZ2RDcXB3aUJicEJqZHh4R0hY?=
 =?utf-8?B?SmZGM3dIaEdoa1Jtbzkxd2wrUlBHQWViOUc5K3BrTUgwd3M1VVF3NUYwb0JN?=
 =?utf-8?B?RHhPYytuOHRDNEZWNXFha2tRVEYxbHFQRkl2L1lySE42OCtjUmZUekM2emJw?=
 =?utf-8?B?NXhJVWE4d2xvQmV0OCs5b1pVd01zUHFnMVd2WWhNZ1BUUHdiQ20yOHFJcEdv?=
 =?utf-8?B?eHZjeGJXL004VVlDNVBRaG4vRnZySTBjenA4U1A0emR0eFJDa0hiVFptUG1W?=
 =?utf-8?B?TXo2OGVFVFFib2xwSmJ3WXRZVlowYld6Z1p1bGhFUXNEZ3lmZCtlOWIzOWRs?=
 =?utf-8?B?NlpnUmt0bFVlckFmcXA1bVM1MFdpQklSbndxUkQ3RkVuOW9jWWZhVS9Ld09D?=
 =?utf-8?B?ci9xaTd5NnRYSjZzejRSVUFsd25IMnY5UE81TTJYaHpjMFNRdHJSZXZtQ1ox?=
 =?utf-8?B?a2tiWnRhUC9jY3lwUXhvZVFoZC9aN21JKzB1UkwrTHBNTlFjM2xLZFRqa1pV?=
 =?utf-8?B?aXE5VmdyQUkwT3Rza0kyWG9SaVVsbldxNzZKa0Zmdk5LeTd1akJqc0YwajZs?=
 =?utf-8?B?WWhtVE5vd3JmMWJ5THUybWFSSEs1WFBvcURPb1dmWndiZkV3ZHRVQk9RNm1N?=
 =?utf-8?B?S0p1SnI3elFVYzkwSWZ3bWNkeElGU2RiSTcrM0g0ZmRMN2d0dDdsWXp5V1JT?=
 =?utf-8?B?QVNUbWhtQVFLbmZZK3NqK0dPd3V5Q2tFNVVGK1NQb09hVUY2SC9scjJHRzNh?=
 =?utf-8?B?NmtVSVBBVklybVBxOTVvRUlaTkVKa2R2QW54MFJvUVp0K0FVb3RnVHBuV3lL?=
 =?utf-8?B?aWNpNGxuMG1Tb2JBdmRaQ01TODdXZTJZZ3dUb1lnbDVhK2UwSURCZy8xZ2ZO?=
 =?utf-8?B?QTgreFgxazlkZSsvK0ZSbG1EakFveFVtbSs4dUtKQjZlc3FxOWFvbXJFaXZ6?=
 =?utf-8?B?YUlkd0RZbUg4VUJpUmhVc1QzbW5OTXV6TGxvUXJRRFlrSDlBckZ3blRqcm5G?=
 =?utf-8?B?eDQ0c2xiM2ExWGZZc2Ixb2JjSHU2ZHFhQ0xVeU5nbWJTUkN2emZsNjZOQWp0?=
 =?utf-8?B?eHBvbStEQld1anl2ZDl3WTg4eEJ3Yi9Uamd0Qi9LSzdCQ3BHMmlOcVpyYWRy?=
 =?utf-8?B?WmJTL1MwbVlCdFpLdzZFSCs0WDZFd1c3QktSaGQ2MFYySTl1R21LRU9RdzZl?=
 =?utf-8?B?NW9XTUZKTmJ3SWhVQ3lTY1lWQXI4SXNpSkZ1M3JsVWxENkMzSU92bksreVVB?=
 =?utf-8?B?dXlnMmRSOGdTanN4dmtvRnpPM3RtUEhoVENkUEdnRHpPS2d1MC9DQTM1ci80?=
 =?utf-8?Q?5S60P7KeNZe/9QpLGAf0sL3CrGE0I123vVids=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bWRCYTJRc2dHN3FsMkhkSDdGLzFEQmRQK2tWbnFlNy84ME54WmwwOFU3bTFB?=
 =?utf-8?B?MFFPaEdNbmZaRDAvaVRxK0dTanNhWXVvclZXbWsxOVN1bHRETVk4SlBNVUVC?=
 =?utf-8?B?cGlrSHpKa2FxTUxXTC9wbFJ4YTdIWk9mN21yWFBKV0N1MERwVEhXY1JsZDF4?=
 =?utf-8?B?cm9QK0o0a0k5dVJMWUpSdWZ1MHRwVlE5bkJXZWM1a0VlRjJseDZESmwyeHl3?=
 =?utf-8?B?Z0dIZjRqaUF1YTQvcWVFbGErNHpsRGNwRmw4bDR6LzFBZXh4b05vUXNxRmh3?=
 =?utf-8?B?RUpPcFZRVEFzS3VVZ0l0clpRMW9sU3Zzdys3ckQzR2liRmVub3JOQzdyVHJv?=
 =?utf-8?B?djFiQVl2M3RWWUtkTGRkYmVKWHAzSjFIdE5JNGVOYVpuUUFDWStVOWJ2eFZj?=
 =?utf-8?B?c1ZVdlUyVDBtdHdGYmlKUng3N1NlZHdiVFRrOGJ0WXlQd3FsRUNSNlVjWStF?=
 =?utf-8?B?bDJyczBFT0ZjQkM5aEF6RGtpcjcrcG1zcWNnUDVjY1ZaWlJYREc1L09DTklu?=
 =?utf-8?B?Q2J3N0VBN1E4Rm5WQ2UrSHN0L3pPRU51RVpPa3FEZnJsVWh3SkZSWE5jTFpH?=
 =?utf-8?B?SkoyT2J4bXlpZ01vZ0ZUa3pzd2xtNlA2bmcxMTE3ZG5YR0lMNm1PMFByRFhr?=
 =?utf-8?B?NjlyQlZoVjBkMFFYMHoxOGtacWNHeUtHc25VUS9HWGN1ZlVZK00yY0QzYlhr?=
 =?utf-8?B?MFNNQWJZM3luNGZSaktvL1hoY0lrYmlERTJlYUxDUWRvS0x3bEc5dFBuYVFR?=
 =?utf-8?B?ZEIxVmVVdGw1TnF0aFRtKzgyMmxRT00rVU8rTmFnaDZESzlrUElvU2c4OWVp?=
 =?utf-8?B?UDNsMDF1RDBOdlBsNnlqbHY1UXJPcFV0NklEOUd4ZUg4OGtmLzNiMVRwcFR3?=
 =?utf-8?B?OThZaVAxT0xVZitVZHBJbHRsaFhueVBoU3V6SjZBQm1lV3hXT0pOQmE2Wnh3?=
 =?utf-8?B?blQ2eFdYM0p0KzByeWNKTGJwc1VtOFJZbFliNTVQUExaNHU2UGJGS0R5dGds?=
 =?utf-8?B?YStqMFVJdWpQRmxiTGsvajJHYTg3czlZUnFUSVNGaGRaUkd3My9kclM0Q01o?=
 =?utf-8?B?YTRyVmw1UjlROG9GS1l6WGpzNkZlWEpVV0NxOVFmZkJDTFoyaUlQbUs3RDl1?=
 =?utf-8?B?cWlPZ2dSNU0vVWdTVVhlSm5vNHV5RCtHamNWeG1sK05ONXNkTjhBV2MrRHdq?=
 =?utf-8?B?R1RKSWZuR1dmWGpqZEhjS3UvaXh6clM3elZVRVl0aUQxamprR2xFMm5kZklK?=
 =?utf-8?B?RG9DL3BkVXFBZTRwMzErb1AzYVRDc3dUOWRkQ2hzMnZnTkdXckk4Tndqc1lk?=
 =?utf-8?B?bElTanl0dzIwYUlEOUJQZFg2TUZETm5FcnY3Nk9kWndWN0thZ1BQTkZNbk1Z?=
 =?utf-8?B?WHpLZU9UbVRxY0oreDB5K1g2enhMNFQyUDM5YUd3bHdJdEFlVEthRjYwSnE5?=
 =?utf-8?B?TVp0NzVJc1JPMUREM1NCMGxPTXBXQzlEdFUrZVBoVkM4VzhFczVneThxaWlB?=
 =?utf-8?B?czN1TTNGcTVldlE3UGlHQzVVcm1odHRvZ0tTV2FNc2pnTHJqSUxGM0RyOTZE?=
 =?utf-8?B?ZGViK1hCTVE1Y1liS2J3RnIzMTBRWmV3UHFXUXlzVnN2OEpMTjZlNkRmd2lj?=
 =?utf-8?B?bjE2Z0hGZW1zUmZTSE1xQ2NuRnRrRW1DSTQ2Z05CK1RzQlljenZodG83OGlE?=
 =?utf-8?B?eFNVNm0yL1ZlaHBVMG1iMkZsQTQ2akRVTGJjZmkzUGlZbFJFeEVhS0VIRnRz?=
 =?utf-8?B?RTd4ZEl6Z2pTNytwWGhVWWZmL0hxU2lMczExYXljTSt3bmRweHdzYjBnUmFT?=
 =?utf-8?B?V3d5Z0FUSEVydEdUSVJOL2J1cUZmN3FFNXZYWm0xS01TaVpaZzR5QnQ3SVpD?=
 =?utf-8?B?MmZ5OWJTM29DakdkYXU0bVpmNUFxaENXUmw5L215K2dEbFVob3UzZmF5QjBt?=
 =?utf-8?B?L3V2eUVuTlZQRVBmY3FyN244K0d1MExaaERSbFpQcmMzYzVkVTJaamhJVkRS?=
 =?utf-8?B?R1o4aXBvNE5IVFQ0dlJqNFN3VGRETGtFNUtvM0JSdjNPdDRSWGNQMEJxVTZM?=
 =?utf-8?B?QUpVYVdNSVhXQXZncUtYVkFPSjNOM0pzN0c0eWVSVlQ1T29NRVdlV0ZFcUpC?=
 =?utf-8?Q?R0ydvAv/8saNZAfzAuvxzK40Q?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3FC20159D1D7B44C9B441205C4890A3E@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a8a1da6-a765-4d9b-4187-08dd07b2a9ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2024 09:23:29.3820
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QTFxB3BqztR0Ot0D6bQPRf/WxQDUV+zY5OMcpHtc97oIrUwtFalfbO+KQUNdFb6wDlEqzDonsJgwuzBrvaOvBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB8333

SGksIFNodS1oc2lhbmc6DQoNCk9uIFdlZCwgMjAyNC0xMC0wOSBhdCAxOToxNSArMDgwMCwgU2h1
LWhzaWFuZyBZYW5nIHdyb3RlOg0KPiBJbnRyb2R1Y2VzIHRoZSBkcml2ZXIgb2YgdGhlIE1lZGlh
VGVrIFNlbnNvciBJbnRlcmZhY2UsDQo+IGZvY3VzaW5nIG9uIGludGVncmF0aW9uIHdpdGggdGhl
IE1lZGlhVGVrIElTUCBDQU1TWVMuIFRoZQ0KPiBzZW5pbmYgZGV2aWNlIGJyaWRnZXMgY2FtZXJh
IHNlbnNvcnMgYW5kIHRoZSBJU1Agc3lzdGVtLA0KPiBwcm92aWRpbmcgbWFuYWdlbWVudCBmb3Ig
c2Vuc29yIGRhdGEgcm91dGluZyBhbmQgcHJvY2Vzc2luZy4NCj4gS2V5IGZlYXR1cmVzIGluY2x1
ZGUgVjRMMiBmcmFtZXdvcmsgY29udHJvbCwgYW5kIGR5bmFtaWMNCj4gaGFuZGxpbmcgb2Ygc3Ry
ZWFtIGNvbmZpZ3VyYXRpb25zIGFuZCB2aXJ0dWFsIGNoYW5uZWxzLg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogU2h1LWhzaWFuZyBZYW5nIDxTaHUtaHNpYW5nLllhbmdAbWVkaWF0ZWsuY29tPg0KPiAt
LS0NCg0KW3NuaXBdDQoNCj4gK3N0cnVjdCBzZW5pbmZfdmMgew0KPiArCXU4IHZjOw0KPiArCXU4
IGR0Ow0KPiArCXU4IGZlYXR1cmU7DQo+ICsJdTggb3V0X3BhZDsNCj4gKwl1OCBwaXhlbF9tb2Rl
Ow0KPiArCXU4IGdyb3VwOw0KDQpncm91cCBpcyBhbHdheXMgemVybywgc28gZHJvcCB0aGlzLg0K
DQpSZWdhcmRzLA0KQ0sNCg0KPiArCXU4IG11eDsgLyogYWxsb2NhdGVkIHBlciBncm91cCAqLw0K
PiArCXU4IGNhbTsgLyogYXNzaWduZWQgYnkgY2FtIGRyaXZlciAqLw0KPiArCXU4IGVuYWJsZTsN
Cj4gKwl1MTYgZXhwX2hzaXplOw0KPiArCXUxNiBleHBfdnNpemU7DQo+ICt9Ow0KPiArDQoNCg==

