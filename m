Return-Path: <linux-media+bounces-47188-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E60EC627B6
	for <lists+linux-media@lfdr.de>; Mon, 17 Nov 2025 07:12:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5DC73A507C
	for <lists+linux-media@lfdr.de>; Mon, 17 Nov 2025 06:12:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87EF2313E31;
	Mon, 17 Nov 2025 06:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="LwVu9oqa";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="UURjJSMs"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6219928695;
	Mon, 17 Nov 2025 06:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763359954; cv=fail; b=sVSyimcGQavcWyi8NNLSDcBBx+Qwlh9dto2eX8QeBfutJrflMIKj41pq/k60uSQ38izeg90GkZ+kgGM8SnX9iDv+FQ/ZpobV3au3LKx+p4wHAZkBPcF0U0tF6Pp+i0FYcQsO5MbdhTsxwRd2geB/2D9AVdpGQHdGkz99xdkx84I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763359954; c=relaxed/simple;
	bh=VdP5t+PHMZ6/vdIULsnY6gBmm9nBz7nTAc81e5KCw/Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IzVC9NtAJixt8QbX8eDQ4rrmvrCepdiR4kYI1g4JCwrQyhMFKU8wfTSy2CyAKmG2KlvqdsHMzvMzCiefQ/LGJ6gdzWZAcJ7aDgM4WP61LWoLb7w+zueYS94uHw24mM1R0SJ062xzDA1BDawirG5Y7cAoN+w/eaFYM03mAZLTa9o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=LwVu9oqa; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=UURjJSMs; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 61a9b652c37c11f08ac0a938fc7cd336-20251117
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=VdP5t+PHMZ6/vdIULsnY6gBmm9nBz7nTAc81e5KCw/Q=;
	b=LwVu9oqaMrHzG+/S+at3VmRMcxnFEUrDrIYGaGw1jAKf7RDhURgNLML9v4tgGInwmGFzxR98Y2tCian9Mr2N9kmSSG5lhEa7BypvkFIO4CtTnXFW0EGFR/8L50TwK9Qu0+RZKzm+UmUjw27xT6lrmrAfMLdVvckU+S9uHZXya9g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:c3678c75-6b87-4273-b110-36d99c4af351,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:c3888392-7fd3-4c6a-836a-51b0a70fa8fb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil
	,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 61a9b652c37c11f08ac0a938fc7cd336-20251117
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1649068631; Mon, 17 Nov 2025 14:12:23 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 17 Nov 2025 14:12:21 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Mon, 17 Nov 2025 14:12:21 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X4YnQMNN7m5BSridSBW42TRUl1FEhyGQJkYqzClaJAOQgzlkAgYnwNPxwyrLx4KS2aokYJHUgSWe80tY9x/Uyp3HRbQ0O4SGr2PAe5MRHE0hUCvVm0l3RyLyg9qTfXeNVgx5RGq8tnA+a2SGUE/uCd5+gcl195jItI8aalL4yYAg096uiaJicZo5VfpPjmKq1yrtZBvxwvfBTbnf+5LNlFMn8rOLAnoQoQrb9FB5IrdHRDUnDcCCDz93UytBxbmLY0lhAiYWf+fxdMxsuw8AafQC0hnwLnXmmuc3sZUkER4T+29bZiDZDRtYcfQcuVV3CNxJgx8DWiPzSxoRahS+Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VdP5t+PHMZ6/vdIULsnY6gBmm9nBz7nTAc81e5KCw/Q=;
 b=hXhqiVqPvjGeg3/Rx2T3JTjMIWUv1zn/DHS+FhRRabzG1QkhYUhAmXvZYhNYZJJmJ2RTQXvQ7qUkB9+S97yTTue3SU1YUGkJMAmQmpzG1qAsnOHyK+QwK11c+f6qBpkwZZ6HYZloGo6MfthKvZK25zWcK417DP+KzmKhCCFMRu+yZRuLdKwzU/iqirXmKJLNHBYbYqBs9I30puonww3P6L9Hmi4txPyQwipT3DAF+FkE4a5w2kmjwUCFJ9Lh+1lB3NgARUg2/Oj2BYatV2z513ymzs/dpE9Xdn+asHzqKtPzbtzEBRFtKqAoeDyIas9VAoVvndaShqyhUG+iZgAjQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VdP5t+PHMZ6/vdIULsnY6gBmm9nBz7nTAc81e5KCw/Q=;
 b=UURjJSMsFoOomjNG/oJCM5TmLshK84AT6pE0mDdDbjkIsDOtXBHrXopvv54L+B9N6V/9xipzzlL/9cjKH7WOlLGlsXuYLllc/vbBVDguuxroQgmpBHW0xxudYHhrGrehO1RxOVuPH1kDgNW6+ivFnuNOBGnKXOCdbU+N8j78zk0=
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com (2603:1096:301:b9::5)
 by SEZPR03MB7589.apcprd03.prod.outlook.com (2603:1096:101:128::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Mon, 17 Nov
 2025 06:12:17 +0000
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::a013:f3b3:a461:8ece]) by PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::a013:f3b3:a461:8ece%4]) with mapi id 15.20.9320.018; Mon, 17 Nov 2025
 06:12:17 +0000
From: =?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?R2VvcmdlIFN1biAo5a2Z5p6XKQ==?= <George.Sun@mediatek.com>,
	=?utf-8?B?VGlmZmFueSBMaW4gKOael+aFp+ePiik=?= <tiffany.lin@mediatek.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"nhebert@chromium.org" <nhebert@chromium.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "nicolas.dufresne@collabora.com"
	<nicolas.dufresne@collabora.com>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
	=?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>,
	=?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	=?utf-8?B?SXJ1aSBXYW5nICjnjovnkZ4p?= <Irui.Wang@mediatek.com>,
	"robh@kernel.org" <robh@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	=?utf-8?B?WWlsb25nIFpob3UgKOWRqOaYk+m+mSk=?= <Yilong.Zhou@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "arnd@arndb.de" <arnd@arndb.de>,
	=?utf-8?B?QW5kcmV3LUNUIENoZW4gKOmZs+aZuui/qik=?=
	<Andrew-CT.Chen@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: "andrzejtp2010@gmail.com" <andrzejtp2010@gmail.com>,
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 0/8] Enable video decoder & encoder for MT8189
Thread-Topic: [PATCH v5 0/8] Enable video decoder & encoder for MT8189
Thread-Index: AQHcTuR6XWfoGtR1akKwtxmAbZGRRLTlso0AgAWEHACAAL9xAIAKflsA
Date: Mon, 17 Nov 2025 06:12:17 +0000
Message-ID: <db76de4c1fd5e6b8abfe8f8176c250ad27f164f8.camel@mediatek.com>
References: <20251106061323.2193-1-kyrie.wu@mediatek.com>
	 <c49b979fd911f2587bbfed129b07065f1cd2a2db.camel@collabora.com>
	 <09eb315e50aeaf865b093880aaaa5f2c9c0feba9.camel@mediatek.com>
	 <f4fee7587d8e3e58bab39f1b3202b67f0f5c3e04.camel@collabora.com>
In-Reply-To: <f4fee7587d8e3e58bab39f1b3202b67f0f5c3e04.camel@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR03MB6186:EE_|SEZPR03MB7589:EE_
x-ms-office365-filtering-correlation-id: 0ecfaffe-5fea-4700-0b92-08de25a04274
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|921020|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?eHRQZXNSSWJGYVlaQklJd1lhd2wyNXZ2YmtWTVFoazF6TlFmc0VLZUZnRHlH?=
 =?utf-8?B?NmlpazNXK1E3UGdyd2JYekl0eTJSU1M0MHhSQUF5MGNQL0xFNjN1eUdHOWxV?=
 =?utf-8?B?NmZEZGNlMEdiaWdzQk9KUVJaVXUzbGhGaTFTZEUxVFhqcmdqRlFtcjNWUmVl?=
 =?utf-8?B?SWQrOUxXdSsrRXNvdUxQRk9mL25SOUt1VmlwYzI4SHpoTXlBMXNzTVNxSEx6?=
 =?utf-8?B?dHo0M2dzM3BVSzQvRU1PaWRXNDFCK3BXMk5GUm1WOENmS1NBbnlLSkJ1Q1FU?=
 =?utf-8?B?blFyUWZ3VlpQU0tUdDB6SDhkT0hBWW5ERkNZRTM4Y0N4TFNKTHhmWTFWU1hI?=
 =?utf-8?B?V2RVekwydDB0VW1ZeEVkSkxzODlpeGNtazRQa3l3RTcyQVY1cUc2TEp3UU51?=
 =?utf-8?B?djA2dmZKeEQ0YmRSTUJtazN6MlhSVXFVbnpXQ1o3RmdZUU55a3Q1RXI1R0Rw?=
 =?utf-8?B?N01IcHlsL0FTNzFhMitrVkJ2cHBTL25vbVhEbmZnaEYzSEtsQkQ5RlV6NUFj?=
 =?utf-8?B?cVZhTW9BNTNtRlArK2VuSEdEeFhRUnR1V0lhMWZVSW1qVWVMT09FYm9vdjZR?=
 =?utf-8?B?MXNPdnd6ZEx0aUk0K2RtUFk4N2tGbDg4L2VHbTJhV2ZYWEJONUZkR3VGNU9T?=
 =?utf-8?B?Qk1pdXZ6MWNORng0eEgyN1VvZVhGL0ZVRm1xQ21uVXFXRktHaEQ0Q0RkUER5?=
 =?utf-8?B?VGo5Q3BvK1phTHNEbEgvWGNUSHJxUHFTTEV3akM5ZlF0ZjBheFJ0MFo2em9E?=
 =?utf-8?B?c1Q0NW94eFFMNDR6dWIwdkpMNEEzN0ZYSkhyaW9pRFBsOHZGaGZnQUpxQzdR?=
 =?utf-8?B?ZXdmSll5N2pWY1p2NmNqY21rSk9yeGpoVVBMWTdSMldJbnA0VkM4SXFwT3ZX?=
 =?utf-8?B?bWsvQi9IUEVGM2l4dE5ERWtvb2tNNHFTSERadTBaVGJCaWJGNHplYlR5NXNJ?=
 =?utf-8?B?SHltbjMzWjRtaFp4Ymw5blFpUUQ4TXp5WnBxR3lwMVhGQjY1WTdlb2h0S3pv?=
 =?utf-8?B?SklCbUs5U3NjcFlGRW9XYXlORnRXbFpkejRrc0JDdmFZdXQ4QW1abmJCNzFM?=
 =?utf-8?B?TTJNcHZTUGNlYVdjbzdyUDZsaHk3VDl1NXkvV0UzM0s2WStJWm14UUFYRGY2?=
 =?utf-8?B?b0xjazdES2krSTFrY3dIUFdIRlhuR3Z0TURGODBYM1BiQ2NiSDJiVWowbS9X?=
 =?utf-8?B?OUt0TmhOdzVjUjZRQTFqZ0wrNUdjcEl3eVFIZTVvRElZd2V1YzhWb0kvVjBm?=
 =?utf-8?B?eUFkeXEySUJZSDd4S3NlV1JVbDdQNXFSck5XK2JYRDFNTVk2OTdMQXFvWFlw?=
 =?utf-8?B?Q2NKMmZUaE1TZmFEL1JmK3k3d3F0TURUSkN3cjJpZGxqU3pmckM2a0U4cndi?=
 =?utf-8?B?YnMzNGtXS08rQ1Zaa0k3ejhCbnBBL0dvWkZaamZZM0ZLL1ltVXBnbHFIR0hR?=
 =?utf-8?B?SFhQNmVPa3VNTUNxQTlXcnl1L3kwVzNBT1Fhb2MvMTR1Y2pTdG44QjBrbWd1?=
 =?utf-8?B?elZUK2xKUDdsSVpyMS9pTUROMW40TnpkdWhLZFB3ejFWVW9VeW9WMUhXR2pj?=
 =?utf-8?B?U3pnOWVNZkQ0Ymd4WktPdUQ2bHNIMVlXRlU5ZE1KRWNxTGc2ZHJuK3FxeVM0?=
 =?utf-8?B?NUpiL1NkQjF0dmQzdVlNcVlUalJtdmxaa3RTdUtLbVJCeTgvemxFaVJsNkZX?=
 =?utf-8?B?QndtempEQ3lldXMyb25FaHo4UTVjL21vdHd1VGRBWTh1YWxTVThkcnFESkt3?=
 =?utf-8?B?clZIMzAzMlc1OGIvSndJYmo1RlBwN2t0djZtb2xGUHFnQ3ZwMFAzM0RoWWVF?=
 =?utf-8?B?UWtKaXhzWGdxZmFnME1LNndjRGFkMHdMaDM1V1hnY2h6MmV0cDlSbUlta2FC?=
 =?utf-8?B?NFN4S0lmN1N4MlJyUlBoTER1ZGJlSFFuT3k3cjF6TTgyNU5qSGlTUytBc1U3?=
 =?utf-8?B?WWJ0T2lYS3pKY25yc21haklGU3VPVVFvVFBjZ0JGWmJudVozWC9nbkVubWhm?=
 =?utf-8?B?TlF4d3FpY25HNGowbHJyWVVXbk51My9iVUtLVEw3clhnQ2lSbWkrUDc1bTQ3?=
 =?utf-8?B?cmxmSUx5R3pHVjdHd3E1RDQ0TW4ycG1aZUZCdk9Sa0NkME5aQmRMSTY0eVJS?=
 =?utf-8?Q?XzeM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB6186.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aVVYb0wrL2RyK0ZCaC84eXB4NzVqSENMUWQ3aHFGb2k0WVVlU3VQcGJKekxI?=
 =?utf-8?B?NVFxaG1VS3lvWVpLMnlqVG5tM1E5bTJRZ0t2d0JjNDIwR3MvNk1TY2dNVUVG?=
 =?utf-8?B?QXI0bmpOTGN0aUd0L3VUYUF2SFFCVWZLMTNXVzl0TlA5OXVqSHkxR0FNVEg5?=
 =?utf-8?B?dHlNRGxickhOUHZEWDZ4aHg3cVkvRXpKTFY4NXpQTnFxczRSblZUQmw2d3U2?=
 =?utf-8?B?V2dQZnEwSnNjeFM2K29UWU5uU2gwRDd4K1gyWmRSWTZWK3ZES1NXYzBFRXVN?=
 =?utf-8?B?RXlCZW43MXFPSndFZVVWM2ZvQWtlOElYelVUVWpzaHpyWWlQY3BBaGlsUGpT?=
 =?utf-8?B?aWsvcTdXd2xiM2NKSHY1R0tCYW5nRytFTHBwajhmeldMa1VjQWF0NWYzVWUx?=
 =?utf-8?B?RHdNU3pEbWp6ODhvNFl0Rlc2NHhuT05mLzhMQVBXYTVJTERuS3hyZXF4QjIz?=
 =?utf-8?B?eFduS29ZdEd1VDB1bFVxbm44VXg0a094bEcyTC82T1JJMVFVK0ZQQTBYdUlS?=
 =?utf-8?B?Y2ZQaEN2TWdrekZWeXlvZnVwZ3BDYXhtZktjN3d1TEpWaXczMXdzNEVJZlcz?=
 =?utf-8?B?aU9oOEZkdmtubDN0QzZqaHZ5MVdKaW9Vb1IvTHpERnYrbVhQaUczcjUwQmNz?=
 =?utf-8?B?T2hBN2ZTMFVUWWlzSG5kNlhrUkNzL3ZML3UvYjg2dFNhMFVEYUkzUjc3SDBY?=
 =?utf-8?B?QW9acWhyTjhCY0NWaVBtMXFvb25Wbzk5ZzQxTi9mOEY2RHJGYXhlRUZMb2p5?=
 =?utf-8?B?Mm9zemJhQlJ2a0Rtd0xxNVF1Ym9ycDFyM0MyemxzTmdvUTdVSjFSZTBkN2pl?=
 =?utf-8?B?c1dIdDF2OWhtSDhSWXAyajZnRDV5dDVBVDJpYzA3ZEVWc1RZTFBQbVAvaG5L?=
 =?utf-8?B?UFVNSnk5WjdQN3R3OVdMK21rcFBjZTFKdStoQ1NJanlWNm5lbWNDTnlacGR5?=
 =?utf-8?B?TVoxQVFMZTlRRUdmeTVPZm5kQmEvelZXTDU3SVFLcjVtZjIvRW1WM3BnQ1Q0?=
 =?utf-8?B?QXJaQ2k0SUZDalA5N09Ca0k1NU9GWERHT09GNWlPZEpjWkUwR1djemFnUW9Y?=
 =?utf-8?B?eUxzL1l1NXdwc01xWE5oT3c3Uklad2RQaVhUZmlYS0ZybjN1elVUbDlyL1Ba?=
 =?utf-8?B?T09JS2NMNExlWjZOdkRJTWZlMS9YdkU2QlpqVUtCUTFQYUhlSVZ5UGluZmNV?=
 =?utf-8?B?R3h5cm5ISzBTOE5NSVZERVMzRTRNbFp3SEV2SlVKOXdSSC8wVHV2dmp5N1hE?=
 =?utf-8?B?Vkd0emxmdk9NOHRCODZqVFJpQklrZzVpQ3lab2ZaOXZoRXMvZHdpa3k1Z0dh?=
 =?utf-8?B?bDhYc2txSy90eDlueHYyMWpBK0VZb2xaRTU2ZDlMM3RRaTBRaGdZYXdKV3Yr?=
 =?utf-8?B?UUMvRktVSW0zdmQ2V1MzYXBFTWJzZjUyY3BrMFdtMER3c1ZzbFI4YmVLTHJ1?=
 =?utf-8?B?MFlZOTMxRFBvUCt6bDdpWWpiNnkvd2tXUzcwMkZGSE1aYWwzWWV0MkRGOGlZ?=
 =?utf-8?B?NmgxRFFLb3NaU2Ezd0pQUWIxV0tTUjV6NzR2R1kxYVRjclcvZEVITWtjMVZH?=
 =?utf-8?B?dXlFSDZsUS9rNGlTY0o1RnoyS2UxSk44d0E2RUkwSXhmLzJsTUhjQTFHVkMr?=
 =?utf-8?B?c3VNeXRLZEZNUVBoQ2lmN2RsZGE2K0laTXJpN0YrQjBhdGU4cTUreDI4VHQ1?=
 =?utf-8?B?eUZSOFZrZElPVjVWejFDOCsyS0JEaklCbUtiUVR1aUtXVG0rZHV5L3N5ak04?=
 =?utf-8?B?a0FwY0FnUE14Uys1Z0FRQXlUWTVwV1d3NC93UEhhcm0vd09UL0RKWmlFL0xn?=
 =?utf-8?B?RHBQSU1QWUZ4NG9lVHdHYlJXQklEZFpEUUR4K2pWVTNwR2Jvd0x0MjRYb3Ey?=
 =?utf-8?B?WTFaZ1d0UHZRWEVPWnpUKzl2UStrMDdjRVVycU1XR1JhL2JrWTlaYVlITWNP?=
 =?utf-8?B?T3pIeVV1S1BsRkpMbDkzV2w0Uk9CeXAwUDhicE0xRmV2SHBEUWJhdG1tVlVN?=
 =?utf-8?B?Z21FcVBBTFNZbmpvQW5UQ1NuRGcvVU1rMHZ1T2EwclhIcDhkU0twbll6TWs1?=
 =?utf-8?B?aWNQakRtNUxiWWdEeFE0bDhNaGxrcUx5TlAvRitaeDhvRkdPR2NEL1VSb0kr?=
 =?utf-8?Q?z5bJ8zEJyrL0Arhuj7T55aKF4?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4C77495CEC23FC469B74AC59F4C14126@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB6186.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ecfaffe-5fea-4700-0b92-08de25a04274
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2025 06:12:17.2936
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zHbW4RJG6tKXtTbrFWrOv+MogRnlMRl+GhXCDRKZwQYeopWaueOs39Fk1fzROztEEahE4YYGad/DMBckWkArwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7589

T24gTW9uLCAyMDI1LTExLTEwIGF0IDA4OjU3IC0wNTAwLCBOaWNvbGFzIER1ZnJlc25lIHdyb3Rl
Og0KPiBMZSBsdW5kaSAxMCBub3ZlbWJyZSAyMDI1IMOgIDAyOjMyICswMDAwLCBLeXJpZSBXdSAo
5ZC05pmXKSBhIMOpY3JpdCA6DQo+ID4gDQo+ID4gT24gVGh1LCAyMDI1LTExLTA2IGF0IDA5OjE4
IC0wNTAwLCBOaWNvbGFzIER1ZnJlc25lIHdyb3RlOg0KPiA+ID4gSGksDQo+ID4gPiANCj4gPiA+
IExlIGpldWRpIDA2IG5vdmVtYnJlIDIwMjUgw6AgMTQ6MTMgKzA4MDAsIEt5cmllIFd1IGEgw6lj
cml0IDoNCj4gPiA+ID4gVGhpcyBzZXJpZXMgaGF2ZSB0aGUgZm9sbG93IGNoYW5naW5nOg0KPiA+
ID4gPiBGaXJzdGx5IGFkZCBtdDgxODkgdmlkZW8gZGVjb2RlciBjb21wYXRpYmxlLCBwcm9maWxl
IGFuZCBsZXZlbA0KPiA+ID4gPiB0bw0KPiA+ID4gPiBzdXBwb3J0DQo+ID4gPiA+IE1UODE4OSBr
ZXJuZWwgZHJpdmVyLg0KPiA+ID4gPiBTZWNvbmRseSBmaXggc29tZSBidWdzLCBpbmNsdWRpbmcg
dnAgNEsgcHJvZmlsZTIgYW5kIG1lZGlhDQo+ID4gPiA+IGRldmljZQ0KPiA+ID4gPiBub2RlDQo+
ID4gPiA+IG51bWJlciBidWcuDQo+ID4gPiA+IExhc3RseSwgYWRkIG10ODE4OSB2aWRlbyBlbmNv
ZGVyIGNvbXBhdGlibGUuDQo+ID4gPiA+IA0KPiA+ID4gPiBUaGlzIHNlcmllcyBoYXMgYmVlbiB0
ZXN0ZWQgd2l0aCBNVDgxODkgdGFzdCB0ZXN0Lg0KPiA+ID4gPiBFbmNvZGluZyBhbmQgZGVjb2Rp
bmcgd29ya2VkIGZvciB0aGlzIGNoaXAuDQo+ID4gPiA+IA0KPiA+ID4gPiBQYXRjaGVzIDEtMiBB
ZGQgZGVjb2RlciBjb21wYXRpYmxlLg0KPiA+ID4gPiBQYXRjaGVzIDMgQWRkIHByb2ZpbGUgYW5k
IGxldmVsIHN1cHBvcnRpbmcuDQo+ID4gPiA+IFBhdGNoZXMgNCBBZGQgY29yZS1vbmx5IFZQOSBk
ZWNvZGluZyBzdXBwb3J0aW5nLg0KPiA+ID4gPiBQYXRjaGVzIDUtNiBmaXggc29tZSBidWdzLg0K
PiA+ID4gPiBQYXRjaGVzIDctOCBBZGRzIGVuY29kZXIgY29tcGF0aWJsZS4NCj4gPiA+ID4gDQo+
ID4gPiA+IC0tLQ0KPiA+ID4gPiBIMjY0IHRlc3QgcmVzdWx0czoNCj4gPiA+ID4gLi9mbHVzdGVy
LnB5IHJ1biAtZCBHU3RyZWFtZXItSC4yNjQtVjRMMlNMLUdzdDEuMCAtajIgLXQgOTANCj4gPiA+
ID4gICAgIEpWVC1BVkNfVjFSYW4gOTYvMTM1IHRlc3RzIHN1Y2Nlc3NmdWxseQ0KPiA+ID4gPiAN
Cj4gPiA+ID4gVlA5IHRlc3QgcmVzdWx0czoNCj4gPiA+ID4gLi9mbHVzdGVyLnB5IHJ1biAtZCBH
U3RyZWFtZXItVlA5LVY0TDJTTC1Hc3QxLjAgLWoyIC10IDkwDQo+ID4gPiA+IFZQOS1URVNULVZF
Q1RPUlNSYW4gMjc2LzMwNSB0ZXN0cyBzdWNjZXNzZnVsbHkNCj4gPiA+ID4gDQo+ID4gPiA+IHY0
bDItY29tcGxpYW5jZSB0ZXN0IHJlc3VsdHM6DQo+ID4gPiA+IENvbXBsaWFuY2UgdGVzdCBmb3Ig
bXRrLXZjb2RlYy1lbmMgZGV2aWNlIC9kZXYvdmlkZW8yOg0KPiA+ID4gPiBUb3RhbCBmb3IgbXRr
LXZjb2RlYy1lbmMgZGV2aWNlIC9kZXYvdmlkZW8yOiA0NywgU3VjY2VlZGVkOiA0NiwNCj4gPiA+
ID4gRmFpbGVkOiAxLCBXYXJuaW5nczogMA0KPiA+ID4gDQo+ID4gPiBUaGVyZSBpcyBvbmUgZmFp
bCwgY2FuIHlvdSBleHBsYWluIGl0ID8NCj4gPiA+IA0KPiA+ID4gTmljb2xhcw0KPiA+IA0KPiA+
IERlYXIgTmljb2xhcywNCj4gPiANCj4gPiBUaGUgZmFpbHVyZSBpcyBjYXVzZWQgYnkgc3Vic2Ny
aWJlZCBldmVudC9kcWV2ZW50LiBPdXIgZW5jb2Rlcg0KPiA+IGRyaXZlcg0KPiA+IGRpZG4ndCBy
ZWdpc3RlciB0aG9zZSBhcGlzLCB3aGljaCBjYXVzZWQgdGhpcyBmYWlsdXJlLg0KPiA+IEhlcmUg
aXMgdGhlIGZhaWwgbG9nLCB3aGljaCBpcyBzYW1lZCBhcyBNVDgxOTY6DQo+ID4gDQo+ID4gDQpo
dHRwczovL3BhdGNod29yay5saW51eHR2Lm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlhL2NvdmVyLzIw
MjUwNTI4MDYzNjMzLjE0MDU0LTEtaXJ1aS53YW5nQG1lZGlhdGVrLmNvbS8NCj4gPiANCj4gPiBD
b250cm9sIGlvY3RsczoNCj4gPiAgICAgICAgIHRlc3QgVklESU9DX1FVRVJZX0VYVF9DVFJML1FV
RVJZTUVOVTogT0sNCj4gPiAgICAgICAgIHRlc3QgVklESU9DX1FVRVJZQ1RSTDogT0sNCj4gPiAg
ICAgICAgIHRlc3QgVklESU9DX0cvU19DVFJMOiBPSw0KPiA+ICAgICAgICAgdGVzdCBWSURJT0Nf
Ry9TL1RSWV9FWFRfQ1RSTFM6IE9LDQo+ID4gICAgICAgICAgICAgICAgIGZhaWw6IHY0bDItdGVz
dC1jb250cm9scy5jcHAoMTE3MSk6IG5vZGUtDQo+ID4gPmNvZGVjX21hc2sgJg0KPiA+IFNUQVRF
RlVMX0VOQ09ERVINCj4gPiAgICAgICAgIHRlc3QgVklESU9DXyhVTilTVUJTQ1JJQkVfRVZFTlQv
RFFFVkVOVDogRkFJTA0KPiA+ICAgICAgICAgdGVzdCBWSURJT0NfRy9TX0pQRUdDT01QOiBPSyAo
Tm90IFN1cHBvcnRlZCkNCj4gPiAgICAgICAgIFN0YW5kYXJkIENvbnRyb2xzOiAxNiBQcml2YXRl
IENvbnRyb2xzOiAwDQo+IA0KPiANCj4gVGhlIHNwZWMgc2F5czoNCj4gICAgDQo+ICAgIA0KPiAg
ICBGb3IgYmFja3dhcmRzIGNvbXBhdGliaWxpdHksIHRoZSBlbmNvZGVyIHdpbGwgc2lnbmFsIGEN
Cj4gVjRMMl9FVkVOVF9FT1MgZXZlbnQgd2hlbg0KPiAgICB0aGUgbGFzdCBmcmFtZSBoYXMgYmVl
biBlbmNvZGVkIGFuZCBhbGwgZnJhbWVzIGFyZSByZWFkeSB0byBiZQ0KPiBkZXF1ZXVlZC4gDQo+
IA0KPiBJbiBwcmFjdGljZSwgd2UgdGVzdCBmb3IgdGhhdCBvbiBldmVyeSBtMm0sIHNlZSB0aGUg
dGVzdCBjb2RlOg0KPiANCj4gDQo+IAlpZiAobm9kZS0+aXNfbTJtKSB7DQo+IAkJbm9kZV9tMm1f
Y2FwLT5nX2ZtdChmbXRfcSwgbTJtX3EuZ190eXBlKCkpOw0KPiAJCWlmIChub2RlX20ybV9jYXAt
DQo+ID5idWZ0eXBlX3BpeGZtdHNbbTJtX3EuZ190eXBlKCldW2ZtdF9xLmdfcGl4ZWxmb3JtYXQo
KV0gJg0KPiAJCQlWNEwyX0ZNVF9GTEFHX0NPTVBSRVNTRUQpDQo+IAkJCXZhbGlkX291dHB1dF9m
bGFncyA9IFY0TDJfQlVGX0ZMQUdfVElNRUNPREUgfA0KPiBWNEwyX0JVRl9GTEFHX1RTVEFNUF9T
UkNfTUFTSzsNCj4gDQo+IAkJc3RydWN0IHY0bDJfZXZlbnRfc3Vic2NyaXB0aW9uIHN1YiA9IHsg
MCB9Ow0KPiANCj4gCQlzdWIudHlwZSA9IFY0TDJfRVZFTlRfRU9TOw0KPiAJCWlmIChub2RlLT5j
b2RlY19tYXNrICYgKFNUQVRFRlVMX0VOQ09ERVIgfA0KPiBTVEFURUZVTF9ERUNPREVSKSkNCj4g
CQkJZG9pb2N0bChub2RlLCBWSURJT0NfU1VCU0NSSUJFX0VWRU5ULCAmc3ViKTsNCj4gCX0NCj4g
DQo+IHBsZWFzZSBmaXgsDQo+IE5pY29sYXMNCj4gDQo+ID4gDQo+ID4gVGhhbmtzLg0KPiA+IA0K
PiA+IFJlZ2FyZHMsDQo+ID4gS3lyaWUuDQo+ID4gDQpEZWFyIE5pY29sYXMsDQoNClRoYW5rcyBm
b3IgaW50cm9kdWN0aW9uIGZvciB0aGlzLCBhbmQgSSB3aWxsIHNlbmQgYSBuZXcgcGF0Y2ggdG8g
Zml4DQppdC4gQnV0IEkgdGhpbmsgdGhlIHBhdGNoIGlzIGRpZmZlcmVudCB3aXRoIHRoaXMgc2Vy
aWVzLCBJcyBpdCANCmFwcHJvcHJpYXRlIHRvIHNlbmQgYSBzaW5nbGUgcGF0Y2gsIGV4Y2x1ZGlu
ZyBpdCBmcm9tIHRoaXMgc2VyaWVzPw0KDQpUaGFua3MuDQoNClJlZ2FyZHMsDQpLeXJpZS4NCg0K
PiA+ID4gDQo+ID4gPiA+IENvbXBsaWFuY2UgdGVzdCBmb3IgbXRrLXZjb2RlYy1kZWMgZGV2aWNl
IC9kZXYvdmlkZW8zOg0KPiA+ID4gPiBUb3RhbCBmb3IgbXRrLXZjb2RlYy1kZWMgZGV2aWNlIC9k
ZXYvdmlkZW8zOiA0OCwgU3VjY2VlZGVkOiA0OCwNCj4gPiA+ID4gRmFpbGVkOiAwLCBXYXJuaW5n
czogMA0KPiA+ID4gPiANCj4gPiA+ID4gc2NwIHVwc3RyZWFtIGxpbms6DQo+ID4gPiA+IA0KPiA+
IA0KPiA+IA0KaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlh
dGVrL3BhdGNoLzIwMjUwODExMDE1OTIyLjMyNjgwLTEtaHVheXUuem9uZ0BtZWRpYXRlay5jb20v
DQo+ID4gPiA+IGR0c2kgdXBzdHJlYW0gbGluazoNCj4gPiA+ID4gDQo+ID4gDQo+ID4gDQpodHRw
czovL2xvcmUua2VybmVsLm9yZy9saW51eC1tZWRpYXRlay8yMDI1MTAzMDEzNDU0MS43ODQwMTEt
MTItamguaHN1QG1lZGlhdGVrLmNvbS9ULyNtODQ3ZTM1ZGUwYTViMThmYWMwY2EwNjI0YTg1NTlk
ODQ5NjRhZDVjNw0KPiA+ID4gPiANCj4gPiA+ID4gQ2hhbmdlcyBjb21wYXJlZCB3aXRoIHY0Og0K
PiA+ID4gPiAtLXVwZGF0ZSBIMjY0ICYgdnA5IGZsdXN0ZXIgdGVzdCByZXN1bHRzDQo+ID4gPiA+
IC0tdXBkYXRlIHZwOSBzaW5nbGUgY29yZSBkZWNvZGVyIHByb2Igc2l6ZSBzZXR0aW5nIGFuZCBj
b21taXQNCj4gPiA+ID4gbWVzc2FnZXMNCj4gPiA+ID4gDQo+ID4gPiA+IENoYW5nZXMgY29tcGFy
ZWQgd2l0aCB2MzoNCj4gPiA+ID4gLS1hZGQgcmV2aWV3ZXIgdG8gY29tbWl0IG1lc3NhZ2VzDQo+
ID4gPiA+IC0tUmViYXNlZCBvbiB0b3Agb2YgdGhlIGxhdGVzdCBtZWRpYSB0cmVlDQo+ID4gPiA+
IA0KPiA+ID4gPiBDaGFuZ2VzIGNvbXBhcmVkIHdpdGggdjI6DQo+ID4gPiA+IC0tYWRkIEgyNjQg
Zmx1c3RlciB0ZXN0IHJlc3VsdHMNCj4gPiA+ID4gLS1yZW9yZGVyIGNvbXBhdGlibGUgc3RyaW5n
IGZvciBkdC1iaW5kaW5ncw0KPiA+ID4gPiANCj4gPiA+ID4gQ2hhbmdlcyBjb21wYXJlZCB3aXRo
IHYxOg0KPiA+ID4gPiAtLWFkZCB2NGwyLWNvbXBsaWFuY2UgdGVzdCByZXN1bHRzDQo+ID4gPiA+
IC0tYWRkIHNjcCB1cHN0cmVhbSBsaW5rDQo+ID4gPiA+IC0tYWRkIEhXIGRpZmZlcmVuY2UgZGlz
Y3JpcHRpb25zIGZvciBkdC1iaW5kaW5ncyBjb21taXQNCj4gPiA+ID4gbWVzc2FnZXMNCj4gPiA+
ID4gDQo+ID4gPiA+IFRoaXMgc2VyaWVzIHBhdGNoZXMgZGVwZW5kZW50IG9uOg0KPiA+ID4gPiBb
MV0NCj4gPiA+ID4gDQo+ID4gDQo+ID4gDQpodHRwczovL3BhdGNod29yay5saW51eHR2Lm9yZy9w
cm9qZWN0L2xpbnV4LW1lZGlhL2NvdmVyLzIwMjUwNTEwMDc1MzU3LjExNzYxLTEteXVuZmVpLmRv
bmdAbWVkaWF0ZWsuY29tLw0KPiA+ID4gPiBbMl0NCj4gPiA+ID4gDQo+ID4gDQo+ID4gDQpodHRw
czovL3BhdGNod29yay5saW51eHR2Lm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlhL2NvdmVyLzIwMjUw
ODE0MDg1NjQyLjE3MzQzLTEta3lyaWUud3VAbWVkaWF0ZWsuY29tLw0KPiA+ID4gPiANCj4gPiA+
ID4gS3lyaWUgV3UgKDgpOg0KPiA+ID4gPiAgIGR0LWJpbmRpbmdzOiBtZWRpYTogbWVkaWF0ZWs6
IGRlY29kZXI6IEFkZCBNVDgxODkNCj4gPiA+ID4gICAgIG1lZGlhdGVrLHZjb2RlYy1kZWNvZGVy
DQo+ID4gPiA+ICAgbWVkaWE6IG1lZGlhdGVrOiB2Y29kZWM6IGFkZCBkZWNvZGVyIGNvbXBhdGli
bGUgdG8gc3VwcG9ydA0KPiA+ID4gPiBNVDgxODkNCj4gPiA+ID4gICBtZWRpYTogbWVkaWF0ZWs6
IHZjb2RlYzogYWRkIHByb2ZpbGUgYW5kIGxldmVsIHN1cHBvcnRpbmcgZm9yDQo+ID4gPiA+IE1U
ODE4OQ0KPiA+ID4gPiAgIG1lZGlhOiBtZWRpYXRlazogdmNvZGVjOiBBZGQgc2luZ2xlIGNvcmUg
VlA5IGRlY29kaW5nIHN1cHBvcnQNCj4gPiA+ID4gZm9yDQo+ID4gPiA+ICAgICBNVDgxODkNCj4g
PiA+ID4gICBtZWRpYTogbWVkaWF0ZWs6IHZjb2RlYzogZml4IHZwOSA0MDk2eDIxNzYgZmFpbCBm
b3IgcHJvZmlsZTINCj4gPiA+ID4gICBtZWRpYTogbWVkaWF0ZWs6IHZjb2RlYzogZml4IG1lZGlh
IGRldmljZSBub2RlIG51bWJlcg0KPiA+ID4gPiAgIGR0LWJpbmRpbmdzOiBtZWRpYTogQWRkIE1U
ODE4OSBtZWRpYXRlayx2Y29kZWMtZW5jb2Rlcg0KPiA+ID4gPiAgIG1lZGlhOiBtZWRpYXRlazog
ZW5jb2RlcjogQWRkIE1UODE4OSBlbmNvZGVyIGNvbXBhdGlibGUgZGF0YQ0KPiA+ID4gPiANCj4g
PiA+ID4gIC4uLi9tZWRpYS9tZWRpYXRlayx2Y29kZWMtZW5jb2Rlci55YW1sICAgICAgICB8ICAy
ICsNCj4gPiA+ID4gIC4uLi9tZWRpYS9tZWRpYXRlayx2Y29kZWMtc3ViZGV2LWRlY29kZXIueWFt
bCB8ICA1ICstDQo+ID4gPiA+ICAuLi4vdmNvZGVjL2RlY29kZXIvbXRrX3Zjb2RlY19kZWNfZHJ2
LmMgICAgICAgfCAgOSArKystDQo+ID4gPiA+ICAuLi4vdmNvZGVjL2RlY29kZXIvbXRrX3Zjb2Rl
Y19kZWNfZHJ2LmggICAgICAgfCAgMSArDQo+ID4gPiA+ICAuLi4vdmNvZGVjL2RlY29kZXIvbXRr
X3Zjb2RlY19kZWNfc3RhdGVsZXNzLmMgfCAgNCArKw0KPiA+ID4gPiAgLi4uL3Zjb2RlYy9kZWNv
ZGVyL3ZkZWMvdmRlY192cDlfcmVxX2xhdF9pZi5jIHwgNDgNCj4gPiA+ID4gKysrKysrKysrKysr
KystDQo+ID4gPiA+IC0tLS0NCj4gPiA+ID4gIC4uLi92Y29kZWMvZW5jb2Rlci9tdGtfdmNvZGVj
X2VuY19kcnYuYyAgICAgICB8IDE0ICsrKysrKw0KPiA+ID4gPiAgNyBmaWxlcyBjaGFuZ2VkLCA2
OCBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkNCj4gPiANCj4gPiAqKioqKioqKioqKioq
IE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UNCj4gPiAgKioqKioqKioqKioqKioqKioq
KioNCj4gPiBUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1tYWlsIG1lc3NhZ2Ug
KGluY2x1ZGluZyBhbnkgDQo+ID4gYXR0YWNobWVudHMpIG1heSBiZSBjb25maWRlbnRpYWwsIHBy
b3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvcg0KPiA+IG90aGVyd2lzZQ0KPiA+IGV4ZW1wdCBmcm9t
IGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSAN
Cj4gPiBjb252ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVz
ZSwNCj4gPiBkaXNzZW1pbmF0aW9uLCANCj4gPiBkaXN0cmlidXRpb24sIHByaW50aW5nLCByZXRh
aW5pbmcgb3IgY29weWluZyBvZiB0aGlzIGUtbWFpbA0KPiA+IChpbmNsdWRpbmcgaXRzIA0KPiA+
IGF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJlY2lwaWVudChzKSBpcyBzdHJpY3RseSBwcm9o
aWJpdGVkIGFuZA0KPiA+IG1heSANCj4gPiBiZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBub3QgYW4g
aW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLA0KPiA+IG9yIGJlbGlldmUNCj4gPiAg
DQo+ID4gdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNl
IG5vdGlmeSB0aGUNCj4gPiBzZW5kZXIgDQo+ID4gaW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRv
IHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGllcw0KPiA+IG9mIA0KPiA+IHRo
aXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBh
bmQgZG8NCj4gPiBub3QNCj4gPiBkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0
byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo=

