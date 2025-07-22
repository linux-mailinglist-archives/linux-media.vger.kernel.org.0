Return-Path: <linux-media+bounces-38202-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE5DB0D429
	for <lists+linux-media@lfdr.de>; Tue, 22 Jul 2025 10:11:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D464177988
	for <lists+linux-media@lfdr.de>; Tue, 22 Jul 2025 08:11:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9094428CF41;
	Tue, 22 Jul 2025 08:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="dmkhvA92";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="GBthiRz0"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16259289E29;
	Tue, 22 Jul 2025 08:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753171897; cv=fail; b=tHT/IDYj/xZ6pLAYCQ5Du3yNhK98xQitgGeErmVeIlcIqwZCQX216u5WF0E2tOzWaofciZvv8HPUeSeVABYrozkj3IOM8eUTVSS++Yb0dGfgf1+KySNPQXqyuzMTGcCsenUXgjPakJf8ykUsfmu49xmDhh/nxnDP6De5Z9o6F8w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753171897; c=relaxed/simple;
	bh=597qd/W8rYhsiQuBgxMj9W+0p1CNOYW6KF3U+vvAu6k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fmwYNd1a/nFsU1vCv2JSPsoZJDatDaeBE+JusKpaalVQiN92XAnQcR+cyVNXKJKSMAIWK87+dQC3MUFUZT8dqrJRAM2KcczZOoMvmyY+xqQ7iT8cUjz6n/CZwu3vEEHKd4dQQmoSeY+ZQC+caawbtd5TTTQ35Wf4y4JkOtsvs74=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=dmkhvA92; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=GBthiRz0; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 783b8a4066d311f0b33aeb1e7f16c2b6-20250722
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=597qd/W8rYhsiQuBgxMj9W+0p1CNOYW6KF3U+vvAu6k=;
	b=dmkhvA92HR+GF4TOGLjgt+0ql+Rz42Cbf1W4iFPChpIaaap+qoPOyQD8gx8OyUyqUY2lnLBcoZhskq68Z0no8gingcPfJSWCz+XMdyhHFx5ZOJy/A45souWFgdVrTyk7taxJh8u9N8Bz++pt+Z3H0YUJJqPckbu1Ycv1DS1Yzo4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:69313e20-27e8-4e2c-a3d7-af829ea830df,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:8de21e50-93b9-417a-b51d-915a29f1620f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 783b8a4066d311f0b33aeb1e7f16c2b6-20250722
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 593870398; Tue, 22 Jul 2025 16:11:28 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 22 Jul 2025 16:11:27 +0800
Received: from TYDPR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 22 Jul 2025 16:11:27 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VaPBfh52bYCoDTfUQIrKcVbkRP/45LgzbXdXhg2q5rqHrnSg5RqcI2FQ8iZk3MSQ4l4Xa2qHpCskq2sbXmRDsQIABs+Wqln9DctvsDzkvua3e8RnoTCb/RcO7O46M6U1p4sflf0zeJxfyNLl9Pm4FWPjxj44DQtcSQO6vLW6Ki1o1WLepWFDPSFZFXXe3FqQf9w9o7ng4oey2raed8bN4CVEKhlvwsMmBKpVnve0LdnGhLHmNnOcyp8MP8hlJFxqFDD/rFzsZ4aTMZJCEWYx4nXR1Yhmq6R7zOYtfJGoo0HQan91bNss2ZiL2FUBwKy7gOOu7t3oAi8YYR/QHxAqeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=597qd/W8rYhsiQuBgxMj9W+0p1CNOYW6KF3U+vvAu6k=;
 b=GFWEaCEZqh4hpOAxzH8NJjEJQap3ovGNlyJypk4gVqpVCuXtd11rxoNd4myGyUifG56BRSRZ3qYzDAD7FX8pXmZnEyZlg+Xa0PH4hqAPVp9lijgALimqTh0uABzCe2BBdGgWRas4U8bwFXVAugOCCdDo2eApWtXdOchKmu4nRAAakqWWO0ZKZbxV+D/hGNwgwWPxLSEO754jlRDEHs3CuH4pgbMFpcfnTx+Y2l76ofMTXSaSZumHhasgkp3t1yjdHn3mhPmBMfOHauOdmGqsyeI2GzwKn+P05Jl+WlltIhAwGK3s51UlhGdzvXzwH9zmChJoQNM0UeY2OHILOxbkvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=597qd/W8rYhsiQuBgxMj9W+0p1CNOYW6KF3U+vvAu6k=;
 b=GBthiRz0HSbDVNeSlWUiAbMBNrhSnpVuP72G33ailrZc/krLDWtjzqHkbfKF5WGqUG1wyeXFA5mosJDQvAXgdA53lyeYy1x6uyFl8jICbSpb1y2FHRlNwyGl/sRttfFpjYcq7s2NUEfuz4n9T2w89fUi2CUOA62+KXWCQu6L0Sg=
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com (2603:1096:301:b9::5)
 by SI2PR03MB6613.apcprd03.prod.outlook.com (2603:1096:4:1e4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 08:11:21 +0000
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::a013:f3b3:a461:8ece]) by PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::a013:f3b3:a461:8ece%4]) with mapi id 15.20.8943.029; Tue, 22 Jul 2025
 08:11:20 +0000
From: =?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>
To: "krzk@kernel.org" <krzk@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?R2VvcmdlIFN1biAo5a2Z5p6XKQ==?= <George.Sun@mediatek.com>,
	=?utf-8?B?VGlmZmFueSBMaW4gKOael+aFp+ePiik=?= <tiffany.lin@mediatek.com>,
	"andrzejtp2010@gmail.com" <andrzejtp2010@gmail.com>, "nhebert@chromium.org"
	<nhebert@chromium.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, "nicolas.dufresne@collabora.com"
	<nicolas.dufresne@collabora.com>,
	=?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	=?utf-8?B?SXJ1aSBXYW5nICjnjovnkZ4p?= <Irui.Wang@mediatek.com>,
	"robh@kernel.org" <robh@kernel.org>, "sebastian.fricke@collabora.com"
	<sebastian.fricke@collabora.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "christophe.jaillet@wanadoo.fr"
	<christophe.jaillet@wanadoo.fr>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"arnd@arndb.de" <arnd@arndb.de>,
	=?utf-8?B?QW5kcmV3LUNUIENoZW4gKOmZs+aZuui/qik=?=
	<Andrew-CT.Chen@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "neil.armstrong@linaro.org"
	<neil.armstrong@linaro.org>
Subject: Re: [PATCH v1 1/8] dt-bindings: media: mediatek: decoder: Add MT8189
 mediatek,vcodec-decoder
Thread-Topic: [PATCH v1 1/8] dt-bindings: media: mediatek: decoder: Add MT8189
 mediatek,vcodec-decoder
Thread-Index: AQHb+i35Rb1+PyxwU0+YrzDkXGi9WrQ9v06AgAAMvoA=
Date: Tue, 22 Jul 2025 08:11:20 +0000
Message-ID: <7e148282f683f8e0e00a1ad29ada8319ee9e24f4.camel@mediatek.com>
References: <20250721105520.5625-1-kyrie.wu@mediatek.com>
	 <20250721105520.5625-2-kyrie.wu@mediatek.com>
	 <20250722-sly-sparkling-kangaroo-6ab9ed@kuoka>
In-Reply-To: <20250722-sly-sparkling-kangaroo-6ab9ed@kuoka>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR03MB6186:EE_|SI2PR03MB6613:EE_
x-ms-office365-filtering-correlation-id: 56909a65-62f9-4734-00f6-08ddc8f75754
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?QWFXUXI1Vmh4R3p4Z2FPNlR6QWZ6YXRBTzBtR29sc2tub3htamJjTlhYRmJK?=
 =?utf-8?B?Zmh1MmJSNVVTZkdsOHdST1VQeHFLZGIrYy85VkhOdnZraU9EYjA5dktMdGVW?=
 =?utf-8?B?VXhpQzVyb2pvbm9mTWFOMFUvUjFZb3ZFaVpnQUV6bDFQaExSZmlndmFNWHk5?=
 =?utf-8?B?VFdzMWxwYlNJQlBjajF4dUxGcGQ4alhkZTAyUzdtOG9BOFFKRWlFTEJYb3g4?=
 =?utf-8?B?SXltOWhKUzJSeXRLdXlPOHJWQktVcnpmQlZvWGc5TzIxeFB3NUdnRjJsZHhR?=
 =?utf-8?B?L0t5Zng3TDRQOUlUakp3ZXltTEZxU2dld0JUY1dkQkEvV1NFUGZvYTZWYWRH?=
 =?utf-8?B?bjIrSWJIUlQ2SW1vMEs3b3FxYjVNQmd3Y0pDZm1LUGhyc2pJbXNWUEttYkVz?=
 =?utf-8?B?MGVkZnNucEZLZHJjNDE2bGxPQjRtbjB6T0FLUnlvbC85em9oUVUySHNJQTdz?=
 =?utf-8?B?TFVDMFFiZEp4MHdkRTBWZnRrWnVQZXB0b0tRK0ZyRGt5VllZZFEyT0hPaW1T?=
 =?utf-8?B?cStTY2NrWG11dmk1WGVYTXNPRkpOZXN4dWcySEU5TjRwWTY5TGFoZklGYVlX?=
 =?utf-8?B?ZlJnemw5bUJyMkpPSUJPcVh4WG5scGI2YUJDd1VUWHFmQ1kwT1ZPMVYrbjBj?=
 =?utf-8?B?S2JNaFVBL1RiemN2SFhHbC9wb1J4bngzemRYQ1pMQkMvcUJtM0Y1a3F5TjNa?=
 =?utf-8?B?a2h4WTJsdzR6Z2c0bEllSjQ1SitISWM2U2t0VU9NV2NnMU83RkwrY3UzNmlM?=
 =?utf-8?B?VjFhbVlJQ0FveFcrTThiNHhOQUFpSW1tNkI4K1pJekF0UXNuN2I0MHZ0VFRI?=
 =?utf-8?B?UGVFbjJYTDhvVnYwZXpHbEZHU1BrYzFFRUo5cG5NVC9HaERxeUs0NXNoenJv?=
 =?utf-8?B?YS8xSTJ0M3FvQWJYSngyRElZMnk1M2NaVWlCbVcyZ21PL3ZvTEszYWJIc1o2?=
 =?utf-8?B?NGthS2M2WGZvZklkdG1CejVYRHZ5YWpwcmhqbi8wRVBwZDRFSlQxSU1BTkQv?=
 =?utf-8?B?UWVZVGdYd3h4U0hIYlc5ZFNMMEtkQzN1YlJWazRXZWcrakppKzR6OG9GNXJF?=
 =?utf-8?B?WndNVUdRaHRkYVhvTGNaV0hQZGNacFVaNjRGNUN3NVFMcDhBSWVaUGlKL0ZS?=
 =?utf-8?B?VDNVUUdsbUpUWkROUWhXWWNHOGM3R2NXOHVHYTZBWDR3M3pFMTRBd0RLT2c5?=
 =?utf-8?B?MjVZU21sRlphWS9JY2g3Vkw0bGxoNGMxcWNJbmR3N0p1RnVOYUFCRWRZSUtm?=
 =?utf-8?B?bWdhazV6SkRTSWtNSkVhWGJvbHFNaVZoN1JVOTZiV3ZjaE94bHF5VmJkR21x?=
 =?utf-8?B?UWNIRHdmV1I0TFR4bjBnY0tDNGYwMVVyS2V5Z2hMdEdLY29DRnZZTnh4dWM0?=
 =?utf-8?B?dDY5dlFMNTRzYnY5Yk9IakkzSUE5RTU1TEdaUm8wSEdhQW52MGo0U2FvQm1S?=
 =?utf-8?B?TllDb1N2bytMODdoaU9Ic3BaSWxUM2Era3NVanZZVDJ0VXFCUTdSZW9BY0JO?=
 =?utf-8?B?Y3dnTVV4VkhpVFk2d2tSL2ZhMFpOTjJxVTRqbU9kblZ2TWh4VTliZTB2VDNi?=
 =?utf-8?B?NjF2MmxkckVCL2F1aDYxT2hQUDYraWk4WFAvbjEvZDA5WTk0TzF2OEg4YXNC?=
 =?utf-8?B?Ym5yMWhaRjF3R2cvMHZiYkJYZnRHNHlSZThZMnFYdnFPR0ExRE9kc0gwSHRn?=
 =?utf-8?B?R1N1TVRvVEhIWElyQjd2SGJRZjdrOG5IMTVWRW5iL0NkL0ZZR3hidCt3djRL?=
 =?utf-8?B?d0pSVFlWOUhDb2JVU1FDeC9XT1hrQkpwWDFWQnh1dkdJUENidHlnVENkRTBr?=
 =?utf-8?B?M3VDQmJid3VCK0tzRWE0U29qdDVJa0ZuVUFzRTJOdE1JMmF4TlZRRytKMnUw?=
 =?utf-8?B?L240WGhBcXdnQ0RJMWM5NlVrRTJxNjBSZVFjUXlHSWk1cVhYeEhaVVVEUFVW?=
 =?utf-8?Q?BjSur76z61o=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB6186.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RVJkeXMvMjRwZG5CaW1YTytRWDJEOEp6NEFXWUUzK3RsUk5lR1F3VjFrS0RR?=
 =?utf-8?B?ZER2YjFMZkdzdEtoYnNjMlVJUk94T3o3elBWN28rTkZyQXJQdWx1ZjkyL0VI?=
 =?utf-8?B?YlV3MGY2M3Jac0lxOHoxQkJidzUxRmo5ZFV2bkhJUEpqWHVKYzU5ckZPbDhN?=
 =?utf-8?B?bzlsMnltL3ZyUXZqTlZUZ2JaV3B5SWx3ayt2QjN1ZVdWSCtUNm03NUlmbTVD?=
 =?utf-8?B?WWhVYllXRnE2REtjWDlYUmwyOXMzTXRvZ2VIMG94b2xzc2dZUmFiQWt5N1Ru?=
 =?utf-8?B?WVVBTmpDc3dvcFBZZVhzM05wSi9Md2xlZXFMNFhONjkxdTVUaWhVMUtyR1R3?=
 =?utf-8?B?RHQrU3lHZm1KMUdmVjFWQ2s2TzFvV3I2NkxvNFZ6eU5IMHIzRTR4WS9DVXp3?=
 =?utf-8?B?S0FlVndLZUdkVSs5dWhVZjZNalpOMm5wRmh0aFhnZWh0NkJESlJINEgwd09N?=
 =?utf-8?B?VnBlZjQyOHBHU2tFS0FrYTR4OVVGVzhteGpRZ0dFQnE1Zmg3MDN5TzhqU05G?=
 =?utf-8?B?Z2d5Zm5TWG1WZ3J0dkZYdHhXVVNnazlPWW1FeHhWVFNGcDFnRWVYK2VsZGZQ?=
 =?utf-8?B?ZXZSa2RiaENQVjVSRWVwcUhjYmwwekxrT2cxeURocXNPbHVoSjVPTXlNNXp0?=
 =?utf-8?B?dUJnUE04TGY0a0xlNHlnY0ErSDBMMkZwTkNpYnJVczUyakpibXlqUDU2V0l6?=
 =?utf-8?B?U3hvcCtKejMxZkFDRmRPUGxEMVgwc2lIS0hDbmpWRzZoWkNJaUlYWG42RDA3?=
 =?utf-8?B?YlNjZFFsMjFYMkVnUDZ6dEo3TnQ5UzV1UWNHR0tOdmNJaVNkU1psU2twQWJB?=
 =?utf-8?B?cmFKdDdWeCtVUHVXeVE0YW1vbzlpdytWZUJJK2UyU0VyaFB5b3BVOGNWMndP?=
 =?utf-8?B?d0pXd2VURXdmeEhzRjZSNXlOUm1La0t4YTNPcnUwR2FuVDd5bk5WQzNxYlht?=
 =?utf-8?B?KzVaclF3T2ZqYjlqVlN0NXNGUWRzcUpjVDBIMHlVYVpVWFBEaGJkWGtleE5P?=
 =?utf-8?B?UVYzaXkvMTJqL2FhNm1uZGt4cHJzWk1HRnZDbFJrUmlNQVVnVjRXQnJGY1U3?=
 =?utf-8?B?TjFmLzVuMjhaZ25YUGx4K2R0dWdNblpTQ3JKcnRheEMzb1ZiYnhYbmQzU0xw?=
 =?utf-8?B?QzNSNUlhZ1hDOHR6WVdBN1V3SGJQbnNUd2p4UHlycVpnY1duSzRxYy8yT2lB?=
 =?utf-8?B?anBCV3lYdm9PbjZyS1hyNHZoclpxd0NZWmgyZ0t0WGw3LzhxK0VCaWQvcjR5?=
 =?utf-8?B?c0M3TTRnRDNJaUZ2L0RoTWdScDhGZG1XcmVMVjRwMk0yQWU4YlZHM2Vtd0Na?=
 =?utf-8?B?REFHL29iSEVMNVp3UTR1QUxJYnRBV09PQVR4V1hWTkIzckhOa2tnVjZ4NFFK?=
 =?utf-8?B?VlpmdHRoK1FTdnVhc3hMZUkwNU4zZnJsYTRTZGpST2w0elpWbFdqU0hGUTZv?=
 =?utf-8?B?eHZDTXloZ2czU3c1Y0RzaHVINzlERzhyeUZ5SGtQVVQwUW0zY2pBN3IrWnI4?=
 =?utf-8?B?Nk1qRVU5elFienhYVnVWYXE3NUZIZFEvY3E0S1NySWwzOGVQekJXTlFlaGQr?=
 =?utf-8?B?OWkrSFovU0NGYUQyS0ZaUHduRTlWTXFUTDBqVnFra3VibGxHa1NDT0tmVUlp?=
 =?utf-8?B?Q0lYS3R1RDdCcHNrSlNwQmQwWG5JVDIyMlp3S0x2MUxBdCtZOUFhT0QvaXYz?=
 =?utf-8?B?QjRJNUd6a3c2ekNvWkJVSkg5LzlGS01QN2FuSGFDcS9LQzVoTjBoU3JvZzNa?=
 =?utf-8?B?YytQMmcrSUxOd0RmcUEwTnJvM3oxcmNWSWxKZlV5dzh4WEk3OFNsRVcwVmNr?=
 =?utf-8?B?Wkp3amYwMm9EbUw0endTTUFyTWtHaWlOZ0s1ZEk5aVlzNHJ0TDRPNStjTTlS?=
 =?utf-8?B?a2ZuNCtCNnY1VzFMWURUQU9LZ2s4YTd4MDM4T0djYThoeUh2T2lDWXJxbHNq?=
 =?utf-8?B?aDgwMFh3MWZkL09Qc2IyVzZXOFFpbUFjQ2svTHJVZGlwcjJ2eE9VQTRCa0c5?=
 =?utf-8?B?YXRpcWZPWjhBYnVQNDFTRGFrY05Ya0Z5RDBGUnQyRXY2clpuV2NOU0M4Nng5?=
 =?utf-8?B?TmthZUpUNmlxdmZFeHhSbllPcEUyQ0tuUlFGaGZ1emo0eDdOTENyREg5Slpr?=
 =?utf-8?Q?gFuI1R0gp5ksTalywAIo1OJOx?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4EB0F976252CA8459D5BDABC75BF9338@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB6186.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56909a65-62f9-4734-00f6-08ddc8f75754
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2025 08:11:20.3878
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PLExmsxXjrohLy1767+RVIzcjJBhoTH3xUUo21VE9GxmnZFojvYV3gt+cjlWKl1xTOMwHfgoHY43ibYqBHTVxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB6613

T24gVHVlLCAyMDI1LTA3LTIyIGF0IDA5OjI1ICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiANCj4gDQo+IE9uIE1vbiwgSnVsIDIxLCAyMDI1IGF0IDA2OjU1OjEzUE0g
KzA4MDAsIEt5cmllIFd1IHdyb3RlOg0KPiA+IEFkZCBjb21wYXRpYmxlIGZvciB2aWRlbyBkZWNv
ZGVyIG9uIE1UODE4OSBwbGF0Zm9ybSwgd2hpY2ggaXMgYQ0KPiA+IHB1cmUgc2luZ2xlIGNvcmUg
YXJjaGl0ZWN0dXJlLg0KPiANCj4gTG9va3MgY29tcGF0aWJsZSB3aXRoIGV4aXN0aW5nIG9uZXMg
YW5kIG5vdGhpbmcgaW4gY29tbWl0IG1zZw0KPiBleHBsYWlucw0KPiB3aHkgaXQgd2FzIG5vdCBt
YWRlIGNvbXBhdGlibGUuIERlc2NyaWJlIHRoZSBoYXJkd2FyZSwgc2F5IHNvbWV0aGluZw0KPiB1
c2VmdWwgdG8gYXZvaWQgc3VjaCBxdWVzdGlvbnMuDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEty
enlzenRvZg0KPiANCkRlYXIgS3J6eXN6dG9mLA0KDQpUaGVyZSBhcmUgdHdvIHJlYXNvbnMgZm9y
IGFkZGluZyBhIG5ldyBjb21wYXRpYmxlIHN0cmluZyB0byBNVDgxODk6DQpPbiB0aGUgb25lIGhh
bmQsIE1UODE4OSBpcyBhIHB1cmUgc2luZ2xlLWNvcmUgaGFyZHdhcmUgY2hpcCwgc28gdGhlDQpv
Zl9kZXZpY2VfaWQgZGF0YSBpcyBkaWZmZXJlbnQ7DQpPbiB0aGUgb3RoZXIgaGFuZCwgdGhlIGNv
cnJlY3QgY2hpcCBuYW1lIGNhbiBiZSBzZXQgdGhyb3VnaCB0aGUNCmNvbXBhdGlibGUgc3RyaW5n
czsNClRoZSBhYm92ZSB0d28gcmVhc29ucyBhcmUgcmVmbGVjdGVkIGluIHRoZSBmb2xsb3dpbmcg
cGF0Y2g6DQoNCmh0dHBzOi8vcGF0Y2h3b3JrLmxpbnV4dHYub3JnL3Byb2plY3QvbGludXgtbWVk
aWEvcGF0Y2gvMjAyNTA3MjExMDU1MjAuNTYyNS0zLWt5cmllLnd1QG1lZGlhdGVrLmNvbS8NCg0K
VGhhbmtzLg0KDQpSZWdhcmRzLA0KS3lyaWUuDQo=

