Return-Path: <linux-media+bounces-27647-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 48927A504E6
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 17:32:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0044C188818E
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 16:28:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ECA02517AE;
	Wed,  5 Mar 2025 16:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="FKVFn9KK";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="feZCTUfB"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B8A251792;
	Wed,  5 Mar 2025 16:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741192027; cv=fail; b=KrbbrBiSsgY5u+9+zOnjF1kJAMjaDa+cjsCfC3vizcuKFyY3GYDi4vrRyqpHFcwaflogvRndqqieWlgn1/2WQ1bjpc45SnVzw+sJSeLuPqsiylYBEDeF+yGRmchtbGUzJquxaEQCTv0E7RK5/U0Tw0s+hEAKkPYgjqg4xLThTxE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741192027; c=relaxed/simple;
	bh=jZ6ZgNkyf8Fz4Uxswl0NWuZOyjKzbR142JHEUCMMsDg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RgMaIXFvX6O8vR3U+5fFI4D8HSWrQoczr8l0tpqs2WyV3IVQXXw4T66WKwMRR0Agtc24yCJenlRERpKKPTPoxyyYR3XJLEQ1DeG40fXutOt8IQgwVQm9IFVo4KTb3XD3zmGrCLnq6C9UCOdbbWI2qhztljcunztJk+g4EJZa2H0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=FKVFn9KK; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=feZCTUfB; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: a994a2f0f9de11efaae1fd9735fae912-20250306
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=jZ6ZgNkyf8Fz4Uxswl0NWuZOyjKzbR142JHEUCMMsDg=;
	b=FKVFn9KKlu/YO7NFJtXLwqGUrrmLhp3wxfe+kAEzucfOuO3r6xnNa6Ye5cV4brIeUzPUkMo7Flgy17JMi65V/n+Y42JqbSqf1pSr+0dnNkDNoROx3pLvNTqt3AWvyDIsL+bOh666Lqp7U1s4/tmfgg0UrzlDORfP/hM6ip2sot4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:bf2e89bd-2254-4fa8-a130-f00800e8a2f9,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:93430fce-23b9-4c94-add0-e827a7999e28,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: a994a2f0f9de11efaae1fd9735fae912-20250306
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1295688247; Thu, 06 Mar 2025 00:26:59 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Thu, 6 Mar 2025 00:26:59 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Thu, 6 Mar 2025 00:26:58 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OwzDbdCgKYcoMgmqqPbfgvNIHN6z8/+1dLkBTujYJLWfTcYv4LhD+0TjKE+XMo/+xdXIvT77ygZNl0I4xgyKea1Nn45PCh9l2XkDpssUE4svxcAFeOehWJy7qu3KkZgGtcHg4Zl3A7Hv8IOdWtBJivSPxraR5HU0G1UiofuY/5Y61fPMe9pIKJVFICQEUS+FQnEYsoVZ5QxIHTRabSm1gskWfPw5LB3pmfOr1ZcDmu2qUBBcrvdQgWvdfLbj15vXeuLew42ItUeddyJZsai5IZK8WqoVtpyv9Tj/ZR69LpvPYOgBFbBW3oOLQUrEho132zqLkmnmw8HapnBBLDyx4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jZ6ZgNkyf8Fz4Uxswl0NWuZOyjKzbR142JHEUCMMsDg=;
 b=qRPyyd+mqkb9uSgaGPCt9/7dzZQfYRsZp+OdT4jEBRq0H4Aq4wRb7gAENeiT7XkfKtKQdr8MPl+bN8lMP2ifbnmvySotHBJo3lEbBny1VE4aNGu4zJ2IuJWqElOt/uCJNsja9YI1t+9/mS//mc3A3RJFfH4P9hm55ZVroa8QfuKOCp0F/A6LpY+V5HDNjccRJ6MfbwC7KLM3ZhtVyR78uzafF1GCuUfRT6LHMASYuYlwZNS1RsYranKCVjtjsHDaTWhXICnazF09ERitWeaIYNqvpqeWjRowyve6cbPyz4SpJlfJ+GdAbOB152bobgt+oOVidxRsvU3nQuu6I+AnDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jZ6ZgNkyf8Fz4Uxswl0NWuZOyjKzbR142JHEUCMMsDg=;
 b=feZCTUfBEjmOXTYftp4IbIqpMKyloHy5S+JNmil0Xtu9GwIWiVbXixtkeeBU0I6/eHDp9sFV3eqb/gK+Rx5YgqI6xd493xHLqECO+7DESxoyvpZRRpkKM4Iau3XILCtjt/O/RdjYu1DnPMPeuqxbLOJ7FXL5PfDTcPPbxs5hBUw=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by KL1PR03MB7972.apcprd03.prod.outlook.com (2603:1096:820:f9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Wed, 5 Mar
 2025 16:26:55 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%3]) with mapi id 15.20.8511.017; Wed, 5 Mar 2025
 16:26:55 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
	"jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	=?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
	=?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	=?utf-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
	<Xiandong.Wang@mediatek.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"fshao@chromium.org" <fshao@chromium.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	=?utf-8?B?WGF2aWVyIENoYW5nICjlvLXnjbvmlocp?= <Xavier.Chang@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "treapking@chromium.org"
	<treapking@chromium.org>
Subject: Re: [PATCH v4 5/8] soc: mediatek: mtk-cmdq: Add mminfra_offset
 compatibility for DRAM address
Thread-Topic: [PATCH v4 5/8] soc: mediatek: mtk-cmdq: Add mminfra_offset
 compatibility for DRAM address
Thread-Index: AQHbgcg4qSKnRJgQykSVLFqFZDeyS7NiznuAgAIExAA=
Date: Wed, 5 Mar 2025 16:26:55 +0000
Message-ID: <524d152b9e9261981b0ee3aa2ff43376a26be294.camel@mediatek.com>
References: <20250218054405.2017918-1-jason-jh.lin@mediatek.com>
	 <20250218054405.2017918-6-jason-jh.lin@mediatek.com>
	 <c1395546-9cfe-4da9-b87a-e5cc392910f6@collabora.com>
In-Reply-To: <c1395546-9cfe-4da9-b87a-e5cc392910f6@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|KL1PR03MB7972:EE_
x-ms-office365-filtering-correlation-id: 806a17e0-9cd9-4702-8ede-08dd5c028b48
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?VW5KRTRHTzJ3TFY2dC80WVdQa1JqRm9RSDhWUWFsT1BzRXNaajNjUDFRVmRq?=
 =?utf-8?B?MWVFeGJhUGZicFprWlBoVzVSMzVVWlhsRnkwcXY2L3RmTDFHWktIN0wwU2Nx?=
 =?utf-8?B?cVAvM0R4S1ZacGk2Skw0bXYyY3NRUm94SVEvWUh5TFZIVWRBN1VEb1Y0dGJ6?=
 =?utf-8?B?V2g0UjB5cmRheXVVQTFPUFRwSlBpb1RNaFJsVjFoMDBJUEVOUE5STlZ1amJ0?=
 =?utf-8?B?bW1GajhFaXhIVG96WnFKbVgwUHhtcWtLMzJtQ2w2dFRJQXBxcmI2RmMwZE1J?=
 =?utf-8?B?L3NRYUtVbVBQVms4aHRTM0tRQXJWek9JN1ErR2g3bFcyUW5YME5SQXRKQlVS?=
 =?utf-8?B?SjFYNVZlR0llRlFRKzU2ZDlQZjlMMW54YlJZU0U0WXZ3MWtjNlYzUkRoYmpW?=
 =?utf-8?B?eU1sVGpKSHJsOXZidks3WldnWjhmNU9tQ1RUTTBMQlFxaG5RanJBR2pGcGQ3?=
 =?utf-8?B?bDFnVlRpcEhzYW93MThCb2Qvem95SFowbmlwVDJ5OVBLVE0veG9ORGYrcVNk?=
 =?utf-8?B?TXVPd2lEbUIrZ0lOL094U3hVUUZWc1JQM01vZDBTM0dXQ1ZWSGxzbWl3Wmpi?=
 =?utf-8?B?RmFYdjllNUIvV1JGc3NXa21PbVBjWmxBMk9GNll2aUZHU3ZrTXE0S2ZFM0ZJ?=
 =?utf-8?B?QnVKWXBSUmVNeTdGbVp1MzJaMWJVNzF6bXJjajNkL0lLa1VJN0lMaFMxRm92?=
 =?utf-8?B?WUNQaXowWmY5ME94cjAzczZPSE9ENkU4TUF0eWJPOGIyVWUwM0dvWklGZkFq?=
 =?utf-8?B?ZmpaWVFOTjhQbVV3dnJYaFhTaTdmcDR6SEtETDhmTU9wQ1YvOVEyQm14Y3RE?=
 =?utf-8?B?V0FubEdHczBKQ1dXZ1drWmxPSzBJeDQ1MTRJY0JkZ3F5NjlIQVhLUDdCSWRy?=
 =?utf-8?B?NnR4c2RZbTlIblpBL0ZJUU1PKzFDc3ZYanNtbGtKdm5rc1VVZU1ESk1SQk0r?=
 =?utf-8?B?UVZhT25JTC9GVEZOK3NkMTBJYlRoYjczNEpmRFZtSkl0eXI2YmExbjcvSGhm?=
 =?utf-8?B?TmlycHhSNlRVcHkzb0VlZlZPSWdOY2lCUWdONUNWald0dmdKSzNvcDh0SWFu?=
 =?utf-8?B?VW1BV2I2REplMll6ek1TVGtpc0tES0ZsVG9nUks0OHM3Y2UybFpnb1diY0Zo?=
 =?utf-8?B?aUVKaWhHOXR6eldDYnhjTUFNVEVtd1VGY2ZTMi9FKzY3enRFbndsL2RFNDd3?=
 =?utf-8?B?dXpMYlc1eWNENkMzOFp3MEdOdmZYRjVvcVF3cEI2WXExbXNvc0Q1S0c3Wkdn?=
 =?utf-8?B?YzJwZEFpSG0rTjJjeTBkOGFMVWdSMG1jYzlJWjVPS2h4WUczdkMwUjZ1NEt2?=
 =?utf-8?B?NTBISGZGdFdOYVJ2TElIcGtkNnh1cWJITXFUall6aTJpbDI3SXZvR0lDZWc2?=
 =?utf-8?B?VVJEMXdaRGFKVm9pbTNHdmF6T09WWndMZTE1d2w3WlVuRldDNWxWSFBrY2VR?=
 =?utf-8?B?K2tia0hFaDRiOXJDby8rcWVNVFh4dnUrYXgvUW01UklOTUR0LzMyWDlwN2NL?=
 =?utf-8?B?OG11U2R1clBYNXpWV1NVNEZjelN2UnVpRE50OFZRMWt4NEdva1ZOZUhrMUFO?=
 =?utf-8?B?QnF3Vk1tSGtYbE14dnlCTG5vTUY1V3FRbFltYmlmSE8ySUdBZmFQS2RBQTBB?=
 =?utf-8?B?MGlzZGMxaFgwNTNsYnovMXRYM0FhdHhKSVpUYndOM0ZLNG9tY0ZoUzlOaldD?=
 =?utf-8?B?K0dEZWo5b01HOUZITHZiTml1T3psbjhNOWdrNHc5YjBWNUVVMitDOE9wcTdl?=
 =?utf-8?B?akdsanZ6ZTl5SEZDTkc5WkVrY2htOUtMT0M0cXJnYzdjRmNYRC90T0pKZit4?=
 =?utf-8?B?dDY1TXUwOU1VZHcrWHhheWtUTTV4dGZmK2V0T1o1WWtvSGFHUXh4MENseUpM?=
 =?utf-8?B?cm1HMTcwOWwwMEFxdTg3YmtvdURzN0R6ZVRDQTVuYmgrcDhZbjhUVEZQd3N2?=
 =?utf-8?Q?fq2RE3jzjryN8SSHtRJwZIfs8r9CCwY0?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7682.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WG0yNCtzM052YzdxdkJJVDdMY2ZzbVBZblZHSExMY0MvSHZ0MzRUamo4MXB5?=
 =?utf-8?B?NzY3Uy9Ndnp4VXpuY0RNQm9pQTdFMGh4MTlIUEpXLzduemhwVnppbUd4YUdC?=
 =?utf-8?B?M2FtWFlzUXlXZ1hkNFgyakZlcXdOTm5nWlh2WFROSCs3U1lIYU53enVXNTJD?=
 =?utf-8?B?dXBZVGZCQ3hMWG5UMXMrQkJBbnY5QmNKaTRsZ2RNNjExbHRMSTBWUzFLODly?=
 =?utf-8?B?NXgxQmVwVG5yU0Z4WVJ6b0tFYjN5cmxyVVlzSGhpL3dNaGdZTEo5RVFHT2k4?=
 =?utf-8?B?UVBvL2NaWnJ6VzVOR3hDUW9aYjI4KzJrRTNhTkloWXJEd2J2ZHJVWW5MQzJ6?=
 =?utf-8?B?L2N2T3EwOVh4NXh4aG9IcGdwMmxyL0NlQlowSUpXN1FHSlpjZzc0elBQSHFj?=
 =?utf-8?B?aUh6UVQ5ZU83cGs0Sk5Gb1NJb002K3NFY0tKajlhVGM2eHYyRURRdWFSek1p?=
 =?utf-8?B?T0Vha2ZDVWEwT1ZPUS9TMm9XVWx1VkxrVjFNTExnOTUvWGpRZlNqSXlYT2tT?=
 =?utf-8?B?Y0U5MDdLTUdQMUpxQTh1S3NnV1A2R2l5ZzJqR0c5cVZLSWU0eFA3QnpNWG5R?=
 =?utf-8?B?eU9aQWZZcVBiUDVwcUtWZDgzZ1dQdzNKeWVTRHI3blFCd2xjYy9ZV2JyVnNX?=
 =?utf-8?B?bjcxTW9STDZWeC9PVWJ5Yk1NYUdlWjFzN3gzQ0ZqYTVCbmpTNzd6a0E0RmRt?=
 =?utf-8?B?aFlhNzRkeEFpRFg2SVlvL09mV0dzcU1LTENBSnZrYTFOR0RwL0IvN0RTd0tS?=
 =?utf-8?B?bGtqV1M3MTBLUmZjVVk2SDZPRzQwQ3lJU2Zad016Vy9SWDhuYWo4VnA2VUlz?=
 =?utf-8?B?T1Fsc2cxTnRPN0hFV2pxQkplVUNsWEIvSzgzNkhlVmVGNTE2TDlybmVJOTVJ?=
 =?utf-8?B?L0gzbUtBWVYrOVMzWlV2UzExV2l2ZFpGU2NHcng1ZzlLcFdwMk5nbWxRZ1BJ?=
 =?utf-8?B?bDZnVmRHWmpCRG8yOFpJUmNBcTNvZjlGNjdWVDc3UXVzdkowL3NEWElCZnor?=
 =?utf-8?B?RXlzRWthK010bGNvc0ZvMTFjdzhhdzNWbkZKaGtKakkyRWhiYmZWeWZ1c1dr?=
 =?utf-8?B?bmhURGNidVVGY0JabDJLS0JiVmtMQlFvSjUrSElrQTI3Ylc3djFOTEZYd3Zx?=
 =?utf-8?B?bW5RWlpMTFMzditXTGQ1VUgzY0Q1bjZkWEhlWnBlMGdCa09OV200QlNGaCti?=
 =?utf-8?B?WkYrNmtlWGoxSzBackVESnp2aXRIOHd0S2ZwSGo3SVlzT2I3bVR5Y2t6TFYv?=
 =?utf-8?B?Zk9BZytqQ1JzbzZWYldCN1YxcGl1bXdONzZMNWNSS01sTmZFNTBPQjRaVjVt?=
 =?utf-8?B?WVo1eE0wUVpoR3FjVG9UbGMyRHdwbTRUWXo1K2pGL3NiditpL2x1VEZkZDg0?=
 =?utf-8?B?T0lqS29hbE1ubkRteXBBM2lFVVhGK1lhbmNWN0U5K1VRZDJWTXZwbGRPNmhp?=
 =?utf-8?B?T2lZYzVTL2YzTU9WK253Vk5HRFNXcCtCYUNISmlJVkhWN3lWWGd3M1ZkcEFC?=
 =?utf-8?B?b1FoMnhBaVMyUllHbGsxaVR4UjU0NFgvcWNzS0hLWkxoNW95ZCtUOXphNmZK?=
 =?utf-8?B?QU5LL0czOGZndG01bVVhSlJIeTJVT04rNzVMRFVxa3A1alZnY2dORTNWSXdV?=
 =?utf-8?B?VDZjY3dnS0p0UHdzWkVpVWRrUlFqVW9JelVnbmJCNDhYdHNTM0xCa0RjWW12?=
 =?utf-8?B?TGpoT2lDb1kvQ2FYWUlESDQ4aXVDRWt1YTkzTGU4aWFOOXRzK05lU3RkT0tr?=
 =?utf-8?B?MzAyak1qTkJNbzFMSllEUDZpMzB1VlJPbWc4MGgvQTN2YzIrREVZeno4OVF5?=
 =?utf-8?B?dXV6OGUvMk00VnRtdmNGNDBPZ04zTGQrVmJGRmE0dDdlTTBiSGlpUGVBU3RZ?=
 =?utf-8?B?Vk5LMnAxSnMvcDJFTGp2ZzYzcjFxWTdZOEFDTUdhcGhxek9RWkxmS3B1bnpa?=
 =?utf-8?B?T0hVbEJaOTNxejgrQktxZTBTZHZzZmIveWNGSWZpY1YzYSswZ1NDcVpkZ1Nx?=
 =?utf-8?B?MTMvSjY1UFlvTGdsU0N5MFhnbmZRUTJGRlhybzhveFpKc3RCbis0WUNZQms5?=
 =?utf-8?B?c2NJWWYyZUgzVjJRVWFZaEdZVndtLzdVZ3pQNEJBZjdNbWhrSHZOTTBFWG1a?=
 =?utf-8?B?K1RKZ1gxb0pGVEY0WEoyYms5UUNCMTM0NDFLdkZERVNMcUJjaUpweDBDTFBQ?=
 =?utf-8?B?dkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9B5911E7B3E34947A68996418DA59C5A@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 806a17e0-9cd9-4702-8ede-08dd5c028b48
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2025 16:26:55.2692
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TAooIvjqZMZzSXe5mcJxn5/gF4R7HilzU35uI7tsW0ZMSyHKg5T1KDAaAJx9NwAHLh1V3pvfJAXmhnSVtxJsLmNgTwWXAv7nNIONe2+u4bI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7972

T24gVHVlLCAyMDI1LTAzLTA0IGF0IDEwOjM3ICswMTAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBs
aW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBz
ZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+IA0KPiANCj4gSWwgMTgvMDIvMjUgMDY6NDEsIEphc29u
LUpIIExpbiBoYSBzY3JpdHRvOg0KPiA+IFNpbmNlIEdDRSBoYXMgYmVlbiBtb3ZlZCB0byBtbWlu
ZnJhIGluIE1UODE5NiwgYWxsIHRyYW5zYWN0aW9ucw0KPiA+IGZyb20NCj4gPiBtbWluZnJhIHRv
IERSQU0gd2lsbCBoYXZlIHRoZWlyIGFkZHJlc3NlcyBhZGp1c3RlZCBieSBzdWJ0cmFjdGluZyBh
DQo+ID4gbW1pbmZyYSBvZmZzZXQuDQo+ID4gVGhpcyBpbmZvcm1hdGlvbiBzaG91bGQgYmUgaGFu
ZGxlZCBpbnNpZGUgdGhlIENNRFEgZHJpdmVyLCBhbGxvd2luZw0KPiA+IENNRFEgdXNlcnMgdG8g
Y2FsbCBDTURRIEFQSXMgYXMgdXN1YWwuDQo+ID4gDQo+ID4gVGhlcmVmb3JlLCBDTURRIGRyaXZl
ciBuZWVkcyB0byB1c2UgdGhlIG1ib3ggQVBJIHRvIGdldCB0aGUNCj4gPiBtbWluZnJhX29mZnNl
dCB2YWx1ZSBvZiB0aGUgU29DLCBhbmQgdGhlbiBhZGQgaXQgdG8gdGhlIERSQU0NCj4gPiBhZGRy
ZXNzDQo+ID4gd2hlbiBnZW5lcmF0aW5nIGluc3RydWN0aW9ucyB0byBlbnN1cmUgR0NFIGFjY2Vz
c2VzIHRoZSBjb3JyZWN0DQo+ID4gRFJBTQ0KPiA+IGFkZHJlc3MuDQo+ID4gDQo+ID4gU2lnbmVk
LW9mZi1ieTogSmFzb24tSkggTGluIDxqYXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tPg0KPiA+IC0t
LQ0KPiA+IMKgIGRyaXZlcnMvc29jL21lZGlhdGVrL210ay1jbWRxLWhlbHBlci5jIHwgMzUNCj4g
PiArKysrKysrKysrKysrKysrKysrKysrKystLQ0KPiA+IMKgIDEgZmlsZSBjaGFuZ2VkLCAzMyBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL3NvYy9tZWRpYXRlay9tdGstY21kcS1oZWxwZXIuYw0KPiA+IGIvZHJpdmVycy9zb2MvbWVk
aWF0ZWsvbXRrLWNtZHEtaGVscGVyLmMNCj4gPiBpbmRleCBhYTk4NTMxMDBkNzguLmYyODUzYTc0
YWYwMSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstY21kcS1oZWxw
ZXIuYw0KPiA+ICsrKyBiL2RyaXZlcnMvc29jL21lZGlhdGVrL210ay1jbWRxLWhlbHBlci5jDQo+
ID4gQEAgLTMxNCwxMCArMzE0LDIyIEBAIEVYUE9SVF9TWU1CT0woY21kcV9wa3Rfd3JpdGVfc19t
YXNrX3ZhbHVlKTsNCj4gPiANCj4gPiDCoCBpbnQgY21kcV9wa3RfbWVtX21vdmUoc3RydWN0IGNt
ZHFfcGt0ICpwa3QsIGRtYV9hZGRyX3Qgc3JjX2FkZHIsDQo+ID4gZG1hX2FkZHJfdCBkc3RfYWRk
cikNCj4gPiDCoCB7DQo+ID4gK8KgwqDCoMKgIHN0cnVjdCBjbWRxX2NsaWVudCAqY2wgPSAoc3Ry
dWN0IGNtZHFfY2xpZW50ICopcGt0LT5jbDsNCj4gPiDCoMKgwqDCoMKgIGNvbnN0IHUxNiBoaWdo
X2FkZHJfcmVnX2lkeMKgID0gQ01EUV9USFJfU1BSX0lEWDA7DQo+ID4gwqDCoMKgwqDCoCBjb25z
dCB1MTYgdmFsdWVfcmVnX2lkeCA9IENNRFFfVEhSX1NQUl9JRFgxOw0KPiA+IMKgwqDCoMKgwqAg
aW50IHJldDsNCj4gPiANCj4gPiArwqDCoMKgwqAgaWYgKCFjbCkgew0KPiA+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgcHJfZXJyKCIlcyAlZDogcGt0LT5jbCBpcyBOVUxMIVxuIiwgX19mdW5j
X18sDQo+ID4gX19MSU5FX18pOw0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJu
IC1FSU5WQUw7DQo+ID4gK8KgwqDCoMKgIH0NCj4gPiArDQo+ID4gK8KgwqDCoMKgIGlmIChjbWRx
X2FkZHJfbmVlZF9vZmZzZXQoY2wtPmNoYW4sIHNyY19hZGRyKSkNCj4gPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHNyY19hZGRyICs9IGNtZHFfZ2V0X29mZnNldF9wYShjbC0+Y2hhbik7DQo+
IA0KPiBJZiB0aGUgb2Zmc2V0IGlzIGp1c3QgRFJBTSBJT1NUQVJULCB5b3UgY291bGQgbWFuYWdl
IHRoYXQgZGlmZmVyZW50bHkNCj4gaW4gdGhlIGNtZHENCj4gaGVscGVyIGFzIHdlbGwgYXMgdGhl
IGNtZHEgbWFpbGJveC4uLiA6LSkNCj4gDQoNClRoZSBvZmZzZXRfcGEgaXMgbm90IERSQU0gSU9T
VEFSVCwgaXQgaXMgdGhlIE1NSU5GUkEgc3VidHJhY3RpbmcNCm9mZnNldC4NCg0KQ01EUSBoZWxw
ZXIgaXMgdXNlZCB0byBnZW5lcmF0ZSB0aGUgaW5zdHJ1Y3Rpb24gdG8gdGhlIGNvbW1hbmQgYnVm
ZmVyLg0KU2luY2UgdGhpcyBvZmZzZXRfcGEgaXMgYWRkZWQgZm9yIHRoZSBQQSBwdXQgaW50byB0
aGUgaW5zdHJ1Y3Rpb24sIEkNCnRoaW5rIGFkZGluZyB0aGUgb2Zmc2V0X3BhIGhlcmUgaXMgbW9y
ZSBzdWl0YWJsZSB0aGFuIENNRFEgbWFpbGJveC4NCkRvZXMgdGhhdCBtYWtlIHNlbnNlPyA6LSkN
Cg0KUmVnYXJkcywNCkphc29uLUpIIExpbg0KDQo+ID4gKw0KPiA+ICvCoMKgwqDCoCBpZiAoY21k
cV9hZGRyX25lZWRfb2Zmc2V0KGNsLT5jaGFuLCBkc3RfYWRkcikpDQo+ID4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBkc3RfYWRkciArPSBjbWRxX2dldF9vZmZzZXRfcGEoY2wtPmNoYW4pOw0K
PiA+ICsNCj4gQ2hlZXJzLA0KPiBBbmdlbG8NCg0K

