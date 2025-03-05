Return-Path: <linux-media+bounces-27560-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 49794A4F8EE
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 09:37:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 46D0D188F306
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 08:37:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 450311FC0F1;
	Wed,  5 Mar 2025 08:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="gtltMzF0";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="BeSpzZzq"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5FD2E3385;
	Wed,  5 Mar 2025 08:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741163831; cv=fail; b=d7/GSt4gHXtHQmgJHDQSpFxfbcsw8kXvS81EUbWxxlJuvofgYaT11EHelzGdp8rhPLRafRsjkaBwjItqpoVueF0ez5oJiZWU0jt7rCd+HGViQ97O38Zto6/nhLih1S6Uni930n4SSUSZCYsts8AmjG9GIj5xdKwW43cr3EkKijQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741163831; c=relaxed/simple;
	bh=981IlxFXPtJFqHnX7HDnrIufdlDkOjUNdZIoNs85RcQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=t2E3OdtHQmLkzAPZe27heMkHmqAJo/wNnNoNeOQm8eEnoCUaKRSkKp6NVM8owlaZYkkjH4KKii6T9JbynmV5L3TczL22BbUHtBNNQNXJ8WuMQhtWRbpIqBb1s0LGqMHYChd5S6d+nPtT7Np0CvBfmUxxcxJ3b/Z7FXs3F1Gafds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=gtltMzF0; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=BeSpzZzq; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 03535bfcf99d11efaae1fd9735fae912-20250305
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=981IlxFXPtJFqHnX7HDnrIufdlDkOjUNdZIoNs85RcQ=;
	b=gtltMzF0v9ER05mYcbBQdHSK6A/C7DnuOkm9YI4fyOjBJ7iSyZ8sreDsHMDyZvy90CHtBX2LNVSMGB/GHZ2IQzgrG3rMNJ8lqoRf1+bfxGQ3UTyVZdHJCdu+Dgh2Ycs5npRbYT05WCwPDIY3VbYsmkuF7NS7YaODFv/1gWyVcew=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:b1ef1890-412d-4780-a026-5715b61a0251,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:0f42b649-a527-43d8-8af6-bc8b32d9f5e9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-UUID: 03535bfcf99d11efaae1fd9735fae912-20250305
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1470527301; Wed, 05 Mar 2025 16:37:03 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Wed, 5 Mar 2025 16:37:02 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Wed, 5 Mar 2025 16:37:02 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lGg2aX0mehVY75w3RNivN1/INNoHEgK/7Ja0Rlu+rQ7td9ciV2mzdXF22IneUteCGguhs3I5MlOZm4jXH2SVAwyHZSmLBliqy7evYw3m6+LuYwkPrkVssTTSm4yTEh1nELH7of3f5WMCKReT9m27KBoR7oO7DaJFqHpoucP61auZoSVPNjTup9/FFYbF5f01SHoLmRCTolmE+ZlgUp0Xv5M4/+MrZPbY/cFAN4H+Z/aEoD7IadCcntHP4hhUssYUcO1KDMtvvwRfzTsG7uiogWbpCB0OoZNYda7EQC/0vde+OCiAEDXVFj5uSRSrgMVpw5HLSoQlhRzxsAW5goKehg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=981IlxFXPtJFqHnX7HDnrIufdlDkOjUNdZIoNs85RcQ=;
 b=OmAG+FWXgUYFflMrYvK8bdoOIjDBvPgIG9Rsdwgp/xPy/x9Scvbty5Fqn/K5kaETpxGhWw8Syg7So/c9Yfcx+Vplf+a1NbjytNg7ThozMHf1ZWGmDkQFVXYMeEuwEIDQ/ObKk5Rb2C9H7d/vZgQH8j0LCdht+0myWoTfzbpQN/oxadqK3Ehcf9VAsCIq8D97lQgqd8iIyusfDXPTovrXHv1dJcwu/Q9WaD4iRWTRsLuW2eWhv0rf78gyA+WHsK8n9ItU3bFI8W845ChoQpaIHAiwVKfElmf/TCdRGWeYJbE+vhcl4nGi0Rd9kPV5p+fHqGRtFygL7OEyHV75N14+2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=981IlxFXPtJFqHnX7HDnrIufdlDkOjUNdZIoNs85RcQ=;
 b=BeSpzZzq8965oOb7Njjg2z4wYT5l765J/tdqsFZKEVIDn305UQIAJMkSJ/XFvKVDl2Bc6i8JZ9kVuhbTQE8YjF6Yo+CHPp8SzOqeCwyIiZoaRuKbxueLuzusRbELDrBSl1VRuH4AQHHJfGL8uh1xxim7QcECw2vtfye/AUg246c=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by TYZPR03MB6920.apcprd03.prod.outlook.com (2603:1096:400:28d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Wed, 5 Mar
 2025 08:36:59 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%3]) with mapi id 15.20.8511.017; Wed, 5 Mar 2025
 08:36:58 +0000
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
Subject: Re: [PATCH v4 3/8] mailbox: mtk-cmdq: Add driver data to support for
 MT8196
Thread-Topic: [PATCH v4 3/8] mailbox: mtk-cmdq: Add driver data to support for
 MT8196
Thread-Index: AQHbgcg2iEEFnb0qD02RDglBS18jJrNizUQAgAGCroA=
Date: Wed, 5 Mar 2025 08:36:58 +0000
Message-ID: <5aa04ff5fa567468f32921d4014bbae696c6470f.camel@mediatek.com>
References: <20250218054405.2017918-1-jason-jh.lin@mediatek.com>
	 <20250218054405.2017918-4-jason-jh.lin@mediatek.com>
	 <652e435c-563b-496a-a4c3-c2e2b665abcf@collabora.com>
In-Reply-To: <652e435c-563b-496a-a4c3-c2e2b665abcf@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|TYZPR03MB6920:EE_
x-ms-office365-filtering-correlation-id: 66b28a45-068f-44d8-4997-08dd5bc0e48c
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?TDlWTjl2TUcvdGdscDFwUlJ1STN5bkN2NngzN2U4WnF5czEzSXh1NllqaU4r?=
 =?utf-8?B?Vkw1L3RxK1FRNUJESzQ0RHkwcEFsRFJFZEhPVDlwcTBnd0h0enp4em5PcmtI?=
 =?utf-8?B?Y0c5QmJDcGhJdmpCZEJqNVNQc2dCcUs0b2lOc3NXeSs5UUlWSlFUK3ZkWVVF?=
 =?utf-8?B?MzZUdkIyMTliUFZPenBGcm1WMGsxNG9PYUhHaVptaGFrK0JaUFcwWFE4bGZY?=
 =?utf-8?B?cFBkMGdGVGRhSFgrYUlubXRGK2NGaWpPMWcvc0VDS0lZUlhsMjVJblJFalhU?=
 =?utf-8?B?aXJaMktPLy92dTVVUHBvSlVsdXhjQlVoS0JQUzlUN3NuMVF3OTZwN1VGUWxs?=
 =?utf-8?B?WTQrRlQ5Y25YbncxVFh3bHdOWXJlcVBhZC9taHV1T1BoTWZlRldhWDhteHMx?=
 =?utf-8?B?M2x0cE5SVTFUcnJNVjV3QW8rWnYzNDZNQmFndmx5UmJCbjVSYVMzandzL29N?=
 =?utf-8?B?em84ZFZnQUZqcE5kV0NLUVg3M29EVFM4eTdpaXJJT01KaHkycm1jZXQwRk5F?=
 =?utf-8?B?SDNpZDVOKzd3L01CbUllbEkvSlNadU1hRGxmYVVKdTV4S0hZQXZKUEpWc09N?=
 =?utf-8?B?cTUvOTVWMGR2WWFJTm1sazhWYkxENnRlUlRVeGZYMVVPeWhyNU9Ea3Q0c3Bh?=
 =?utf-8?B?WUJlVlllQjFyL2xNYmJpQkVvclVYUUVNSEt5ZGxGU2RpdW1kUjFXS3VLVWdI?=
 =?utf-8?B?blZQOElHYUlnMFg3YUpDZE9hakJRL1RuOFlnK1dueEdUbGhJdXMrdERkSGdN?=
 =?utf-8?B?NVhuZ3V0ZGpCbjFkVkd5Smp0Q2c5TjZHRzR1SWJsVTJ0TXZYSEtFL0NmOW9v?=
 =?utf-8?B?V1JhbGVBK0tJcTlDSmxHUEw1Mld3dThtaXV4cytKSW90YzNUOTI5QVdpWXlS?=
 =?utf-8?B?V0Zsclo0ZHQzb3JtZGpxOXNWSExXd2srVkNqSHFYb0JiLy9BcWJoRXdOUHpG?=
 =?utf-8?B?YXZEdWIvMEdsUGplaUhsTTNxZXhNaXVFK2Fqb29jWllZc2tUL1M1d0xWVzQ1?=
 =?utf-8?B?QXlZU20vbm4rK1hHY1h2OS9vQ3FDMGxPeXZXQ0w0bjIybzNzcjZvZHJwL3hP?=
 =?utf-8?B?Q1RVN1JZZ251MTJBNzdzaExPazQ2RGphcnpLK3VsZGRwUVpVT3ova3h2S1gy?=
 =?utf-8?B?QUF0dnRyVXk1b0RiTVJ2V0ZZUE5RbUx6NGp6TEFMRVRXaW1DenI4dTJEOEd3?=
 =?utf-8?B?QVI0UE15RG92Y1ZreVlNRC9tNWJPQmhmMmdGUG9RNUxnVzBwWTVieGFMRFBj?=
 =?utf-8?B?SDhkb0J4WkZhc3ptYTJzQTRiczBVUTN4bU42cHJJSjQ2c1JZRk12MGlKRHR4?=
 =?utf-8?B?MUNtRXZsTllkOGcrVTg0aGJkUUxaMEg5N1RsWERPYXdRTXArSUNnN1ExRFNU?=
 =?utf-8?B?TW9OM0g4cDFMaFR3YkNJMkdEcW1ER1g3Sm5lSzJxYWloSno4amF6RVoxdGFG?=
 =?utf-8?B?RHI1bWZJdFhLT1JpM2JLaHJvSnVjWUkyL2ZxZUpuNXdQSXlqSllkUG9qRS9y?=
 =?utf-8?B?TzRhRTBXeHI3REs4Uk1oWjhkSUl6bnQyRHVacE90L0pROHQ5M2ppdHlTU1o4?=
 =?utf-8?B?SE9MT3E4M2lUMXR6MWtkVDFSeVdwc2NqVFdTSWdsWnFxQ0FwUGVraFBSZjI4?=
 =?utf-8?B?UC9GNXFvVkR1Z1dzenpDYnpYMWhIVUtaQVZDTFBqMkZ0Ry9Xc25YTGNwRExE?=
 =?utf-8?B?c2pMWTBKYnhuTVhneUZlVUZTMzJ0UnVISjRZTzNWVnYxeDFaRGRmZXpxV04v?=
 =?utf-8?B?N2JnR1NYbmlDTEN5ZTJNaHlUTjY1NlAwM0RDNFh5THIzL0E1b29oNWppU1Vx?=
 =?utf-8?B?MGsreTlSYjdYUFEzMCtTaTFzQUJXMUpwR2pobFJFdkFtc09jbjVnd0I3TW14?=
 =?utf-8?B?Y1IwT2xCVjl6ZGN1OXpaMWxFeWlFb1QrTEJVbXZoR3BqK3c9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7682.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SFJQN25VSmVoYlNGSEkzSnpxNHZjVUlPZ3VySDdmVWZ4K0d1VGx4azd0MEI5?=
 =?utf-8?B?UVplRTJ4WTlNWmkvMytvQW5KQnZ3cVduS2VEUHFkNDdnSW5IU2xkUVdkTWI2?=
 =?utf-8?B?NnJzaEpMcGM1V1A4by9kNUJpUkFwTlJBQXV1RzltVDdmakdXOGNBNTdmT2Vl?=
 =?utf-8?B?NlUzZzVWU0ZMaThCNUp4c3F6eDU1RWtYZUJwcnFoZGNpSTBoS2JOS2NBMHZK?=
 =?utf-8?B?ZnhhbG5NVkFURHR3K3ZjUlhZV1ZPVSt4RlE5YWxTZEZxWExhVzRiMHpGZ1dW?=
 =?utf-8?B?K2d3S0xjU0pEZEJKbjlqNnltb0lXYmNOK3htVDdFTzBtTVRqbjc1R0d6UVVQ?=
 =?utf-8?B?Rk5WMFZZeTR4ZENLUS84OHZjUDU3RjhhYncvMStIczIrWlpCMkdaWWlyVVMz?=
 =?utf-8?B?UGlqeU9lak1LM2piRWcxQytHR1E0aEJlWDd5b1ZHdWE0U2tLYTB1QVhpYW5I?=
 =?utf-8?B?ZFFTKytUamtsWmhIUGFTOTEwT00vREdaT3A3L1dUL1ZVS3d6VUNSeXUxaTVM?=
 =?utf-8?B?SWNNQmpNbG9FSlkxenRlSWcxYkRVdWMwaHRIWjVhdUg1MEZnLzFjdVBUYXhG?=
 =?utf-8?B?VGFSZ2Qxbllsa1lyajFaV2JDVU15RUkrYWpKVFJtelhnTUZrRStFem82R0tU?=
 =?utf-8?B?dDVNWGtnQmdodGdDb0U2Tk9YWHkzYXp5Ync2dGQvTWNVUEE5b1I3RlV2TENQ?=
 =?utf-8?B?elp6REJMbTVlNVFqWEFVcm1Qd2VWSlZ1YnJ1c2F1UGxza2JFRWFWaFhoMHdL?=
 =?utf-8?B?eVJCM2RRR3h4b215TmNwRHdodk5oQW1pM255dVN5SFZBelNzWUVCK2R4eGJT?=
 =?utf-8?B?dmtuZXNwb3RhU3lvQ2UrNE1wR2dPS2ZLUW4wS2ZYS1kxRE03QTlMUHV6NlFq?=
 =?utf-8?B?QlFuZjRNRWlscG5CbFV6SFc3d1NGTmVNZGJ4ZFBib0p0WEVPTXNubE8wQ3BO?=
 =?utf-8?B?NHk3NmNVbXgzTWpPRGZFeXdvRDdETTZpUmlFVitrRHUvYlB1RFB3bm42VTZr?=
 =?utf-8?B?bVRmOGUyc3BPUkc3Uy9IV2xvK3hVNEFOaXk0aGpzVXBoanZYMEpOa0Z4eEJW?=
 =?utf-8?B?eC9yOFZDTU5hUUNEODJpM3AvUWtTR3RLSkZXR3V6aExyUHJaWVhIMy9UczdP?=
 =?utf-8?B?djMzdkNqT3FOdDluNzhhanJXQk0wL05LS21pczV6Yjc0bDhDZm9DUlNQMGht?=
 =?utf-8?B?UmFhNTVsVy9MOUlHbmdTSWk2QWI2eTdZQmlhQnN0emN6Rjc2b20rM0pNRmZh?=
 =?utf-8?B?TFNSYVNJSDdkL3dGQXZCZmlKQzJRVTdoS3hOT1VRUnNxV2JDTFoxdnU1cTdM?=
 =?utf-8?B?RGZIWFdQMG9SMU1pNU1mODVYRHpBOEZPRWpOWVc1ZjdIMjdzd0R3QjZKbEo3?=
 =?utf-8?B?U0xaT1JYWFM3ejdmdWZaYjB4SnNFdTFBNkZqTCtkdDhhVjJsMW5kMFZlWGFW?=
 =?utf-8?B?aWlYTjNzOG45eDlUTnFyZzh3b21HRUZrcUpLWS9DODVvd2F5VDhDV1JuSks3?=
 =?utf-8?B?UUIrUkxVSVUzWkJmNWxsb2FWOUo5ZTJMZThpSk1nbXpZbi9jWjJ5eFhpN0dq?=
 =?utf-8?B?YUhmUDFYSjh2ZlBjYTF6aXRtRUtocU5yeXJOdWVHcy9zMnhqc0tSTERLTmpu?=
 =?utf-8?B?M1ZDZWVicXJncjZmZG1TbUF6MzFBa1ZYOTdGMG1GbmdselkzZXBLWU1qSC9B?=
 =?utf-8?B?NWI4dDRCeVlhMXY4bTlMVUdnbC9nOHpwblp3WlpGTzROUFp1Z1JDVnZHQTJ2?=
 =?utf-8?B?WkU5RWRmU1RSTFFDSncvc3hkb1BVTm82VklsOHYyNnByVll2R1NOemJUWEQw?=
 =?utf-8?B?SFQra2pzRUE5M2VTMnpCclljd3VrQ0FGSVJnMU5VK29QQ1BuYjF1c0V5SlU2?=
 =?utf-8?B?aTRPZkg1UHZ5WDVKalBESVczVm5mWXc2K3NId1F1WHlLMVJRSVZUM0tQZTFw?=
 =?utf-8?B?YzUvZ0swZUpNRVNkbk9URmw3RWJJWVVLZ1lZVmRwMDMyUVJDRm9wcUU5WUdT?=
 =?utf-8?B?ZVg5UFo5dXp3azRTTjlOMkx3L0xvQ0VlM2IvYm9SVzR4aGViamNFeXRTbE9G?=
 =?utf-8?B?emVnQzdWK3NyNm1Zb05rTHVZS0tDZnZXYVdBVzI5N2QyNmpIaFZhdlZ5Rk9Z?=
 =?utf-8?B?SE90NVRyZW01bUh1ZmxhdEJITjNsYXZZeTVzZWs2Y3IvdFBHSGVlQnhSL045?=
 =?utf-8?B?Wmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0115E628C5BF834891D815A16D4180DF@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66b28a45-068f-44d8-4997-08dd5bc0e48c
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2025 08:36:58.2416
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 33pZKSSdxVkYxSm4HdMXBR+wimmVU7xPw4w3PEDDagttdvchKwQNpmOUz59HjdZeUzWWPBTImtowt8MRb4mdHhoLxgR3BOXw7i9evu8J8lM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB6920

SGkgQW5nZWxvLA0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXdzLg0KDQpPbiBUdWUsIDIwMjUtMDMt
MDQgYXQgMTA6MzIgKzAxMDAsIEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIHdyb3RlOg0KPiAN
Cj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0
YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUgY29u
dGVudC4NCj4gDQo+IA0KPiBJbCAxOC8wMi8yNSAwNjo0MSwgSmFzb24tSkggTGluIGhhIHNjcml0
dG86DQo+ID4gTVQ4MTk2IGhhcyAzIG5ldyBoYXJkd2FyZSBjb25maWd1cmF0aW9uIGNvbXBhcmVk
IHdpdGggdGhlIHByZXZpb3VzDQo+ID4gU29DLA0KPiA+IHdoaWNoIGNvcnJlc3BvbmQgdG8gdGhl
IDMgbmV3IGRyaXZlciBkYXRhOg0KPiA+IA0KPiA+IDEuIG1taW5mcmFfb2Zmc2V0OiBGb3IgR0NF
IGRhdGEgcGxhbmUgY29udHJvbA0KPiA+IMKgwqDCoCBTaW5jZSBHQ0UgaGFzIGJlZW4gbW92ZWQg
aW50byBtbWluZnJhLCBHQ0UgbmVlZHMgdG8gYXBwZW5kIHRoZQ0KPiA+IMKgwqDCoCBtbWluZnJh
IG9mZnNldCB0byB0aGUgRFJBTSBhZGRyZXNzIHdoZW4gYWNjZXNzaW5nIHRoZSBEUkFNLg0KPiA+
IA0KPiA+IDIuIGdjZV92bTogRm9yIEdDRSBoYXJkd2FyZSB2aXJ0dWFsaXphdGlvbg0KPiA+IMKg
wqDCoCBDdXJyZW50bHksIHRoZSBmaXJzdCB2ZXJzaW9uIG9mIHRoZSBtdDgxOTYgbWFpbGJveCBj
b250cm9sbGVyDQo+ID4gb25seQ0KPiA+IMKgwqDCoCByZXF1aXJlcyBzZXR0aW5nIHRoZSBWTS1y
ZWxhdGVkIHJlZ2lzdGVycyB0byBlbmFibGUgdGhlDQo+ID4gcGVybWlzc2lvbnMNCj4gPiDCoMKg
wqAgb2YgYSBob3N0IFZNLg0KPiANCj4gSSB0aGluayB0aGF0IHRoZSBHQ0UgVk0gY2hhbmdlcyBz
aG91bGQgZ28gdG8gYSBkaWZmZXJlbnQgY29tbWl0LCBhcw0KPiB0aGF0DQo+IGxvb2tzIGxpa2Ug
YmVpbmcgc29tZXRoaW5nIG5vdCBjcml0aWNhbCBmb3IgYmFzaWMgZnVuY3Rpb25hbGl0eSBvZg0K
PiB0aGUNCj4gTU1JTkZSQSBHQ0UuDQo+IA0KPiBJIHJlYWxseSBsaWtlIHNlZWluZyBzdXBwb3J0
IGZvciB0aGF0LCBidXQgcGxlYXNlIHNwbGl0IHRoZSBiYXNpYw0KPiBzdHVmZg0KPiBmcm9tIHRo
ZSBleHRyYSBmdW5jdGlvbmFsaXR5IDotKQ0KPiANCg0KVGhlIFZNIGNvbmZpZ3VyYXRpb24gaXMg
dGhlIGJhc2ljIGNvbmZpZ3VyYXRpb24gZm9yIE1UODE5Niwgc28gSSBwdXQgaXQNCnRvZ2V0aGVy
IHdpdGggb3RoZXIgY29uZmlndXJhdGlvbnMgaW4gb25lIHBhdGNoLg0KQnV0IEkgY2FuIHVuZGVy
c3RhbmQgeW91IHdhbnQgdGhlIG5ldyBmdW5jdGlvbiBhcyBhIGluZGVwZW5kZW50IHBhdGNoLg0K
U28gSSB3aWxsIHNwbGl0IHRoZSBWTSByZWxhdGVkIHBhcnQsIG1taW5mcmFfb2Zmc2V0IHBhcnQg
YW5kIGRtYV9tYXNrDQpwYXJ0IHRvIDMgc2luZ2xlIHBhdGhlcy4gVGhlbiBhZGQgdGhlbSBhcyBh
IGRyaXZlciBkYXRhIGZvciBNVDgxOTYgaW4NCnRoaXMgcGF0Y2guDQoNCj4gPiANCj4gPiAzLiBk
bWFfbWFza19iaXQ6IEZvciBkbWEgYWRkcmVzcyBiaXQgY29udHJvbA0KPiA+IMKgwqDCoCBJbiBv
cmRlciB0byBhdm9pZCB0aGUgaGFyZHdhcmUgbGltaXRhdGlvbnMgb2YgTVQ4MTk2IGFjY2Vzc2lu
Zw0KPiA+IERSQU0sDQo+ID4gwqDCoMKgIEdDRSBuZWVkcyB0byBjb25maWd1cmUgdGhlIERNQSBh
ZGRyZXNzIHRvIGJlIGxlc3MgdGhhbiAzNSBiaXRzLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6
IEphc29uLUpIIExpbiA8amFzb24tamgubGluQG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiDC
oCBkcml2ZXJzL21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5jwqDCoMKgwqDCoMKgIHwgOTANCj4g
PiArKysrKysrKysrKysrKysrKysrKystLS0NCj4gPiDCoCBpbmNsdWRlL2xpbnV4L21haWxib3gv
bXRrLWNtZHEtbWFpbGJveC5oIHzCoCAyICsNCj4gPiDCoCAyIGZpbGVzIGNoYW5nZWQsIDg0IGlu
c2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbWFpbGJveC9tdGstY21kcS1tYWlsYm94LmMNCj4gPiBiL2RyaXZlcnMvbWFpbGJveC9tdGst
Y21kcS1tYWlsYm94LmMNCj4gPiBpbmRleCBkMTg2ODY1YjhkY2UuLjBhYmUxMGE3ZmVmOSAxMDA2
NDQNCj4gPiAtLS0gYS9kcml2ZXJzL21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5jDQo+ID4gKysr
IGIvZHJpdmVycy9tYWlsYm94L210ay1jbWRxLW1haWxib3guYw0KPiA+IEBAIC00Myw2ICs0Mywx
NyBAQA0KPiA+IMKgICNkZWZpbmUgR0NFX0NUUkxfQllfU1fCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEdFTk1BU0soMiwgMCkNCj4gPiDC
oCAjZGVmaW5lIEdDRV9ERFJfRU7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBHRU5NQVNLKDE4LCAxNikNCj4gPiANCj4gPiArI2RlZmluZSBHQ0VfVk1f
SURfTUFQMMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDB4NTAx
OA0KPiA+ICsjZGVmaW5lIEdDRV9WTV9NQVAwX0FMTF9IT1NUwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgR0VOTUFTSygyOSwgMCkNCj4gPiArI2RlZmluZSBHQ0VfVk1fSURfTUFQMcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDB4NTAxYw0KPiA+ICsj
ZGVmaW5lIEdDRV9WTV9NQVAxX0FMTF9IT1NUwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgR0VOTUFTSygyOSwgMCkNCj4gPiArI2RlZmluZSBHQ0VfVk1fSURfTUFQMsKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDB4NTAyMA0KPiA+ICsjZGVmaW5lIEdD
RV9WTV9NQVAyX0FMTF9IT1NUwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgR0VOTUFT
SygyOSwgMCkNCj4gPiArI2RlZmluZSBHQ0VfVk1fSURfTUFQM8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDB4NTAyNA0KPiA+ICsjZGVmaW5lIEdDRV9WTV9NQVAz
X0FMTF9IT1NUwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgR0VOTUFTSyg1LCAwKQ0K
PiA+ICsjZGVmaW5lIEdDRV9WTV9DUFJfR1NJWkXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMHg1
MGM0DQo+ID4gKyNkZWZpbmUgR0NFX1ZNX0NQUl9HU0laRV9IU09UwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBHRU5NQVNLKDMsIDApDQo+IA0KPiB0eXBvOiBH
U0laRV9IT1NULi4uLg0KPiANCg0KVGhhbmtzLCBJJ2xsIGZpeCBpdC4NCg0KPiAuLi5idXQgYWxz
bywgaWYgeW91IGNvdWxkIGFkZCBzb21lIGJyaWVmIGRlc2NyaXB0aW9uIG9mIHdoYXQgdGhlDQo+
IFZNSURzIGFyZSB1c2VkIGZvcg0KPiBhbmQgd2hhdCB0aGUgR1NJWkUgaXMuLi4gdGhhdCdkIGJl
IHZlcnkgbXVjaCBhcHByZWNpYXRlZCBmcm9tIHdob2V2ZXINCj4gaXMgcmVhZGluZw0KPiB0aGlz
Lg0KPiANClZNSURfTUFQIGNvbmZpZ3VyYXRpb24gaXMgaW4gdGhlIHByZXZpb3VzIHJlcGx5IG1h
aWwgZm9yIENLLg0KQ1BSX0dTSVpFIGlzIHRoZSBzZXR0aW5nIGZvciBhbGxvY2F0aW5nIHRoZSBD
UFIgU1JBTSBzaXplIHRvIGVhY2ggVk0uDQoNCj4gVGhlIEdDRSBzdHVmZiBpc24ndCBldmVuIHBy
b3Blcmx5IGRlc2NyaWJlZCBpbiBkYXRhc2hlZXRzIC0gSSBkbw0KPiAocHJvYmFibHkhKQ0KPiB1
bmRlcnN0YW5kIHdoYXQgdGhvc2UgYXJlIGZvciwgYnV0IGFza2luZyBwZW9wbGUgdG8gZ2V0IHll
YXJzIG9mDQo+IGV4cGVyaWVuY2Ugb24NCj4gTWVkaWFUZWsgdG8gdW5kZXJzdGFuZCB3aGF0J3Mg
Z29pbmcgb24gd291bGQgYmUgYSBiaXQgcnVkZSwgd291bGRuJ3QNCj4gaXQ/IDotRA0KPiANCg0K
SSBhZ3JlZSB3aXRoIHlvdSA6LSkNCkknbGwgcHV0IHRoZW0gaW4gdGhlIFZNIHBhdGNoIGFuZCBh
ZGQgc29tZSBicmllZiBkZXNjcmlwdGlvbiBmb3IgdGhlbS4NCg0KPiA+ICsNCj4gPiDCoCAjZGVm
aW5lIENNRFFfVEhSX0FDVElWRV9TTE9UX0NZQ0xFUyAweDMyMDANCj4gPiDCoCAjZGVmaW5lIENN
RFFfVEhSX0VOQUJMRUTCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDB4MQ0KPiA+IMKgICNkZWZpbmUg
Q01EUV9USFJfRElTQUJMRUTCoMKgwqDCoMKgwqDCoMKgwqDCoCAweDANCj4gPiBAQCAtODcsMTEg
Kzk4LDI0IEBAIHN0cnVjdCBjbWRxIHsNCj4gPiDCoCBzdHJ1Y3QgZ2NlX3BsYXQgew0KPiA+IMKg
wqDCoMKgwqAgdTMyIHRocmVhZF9ucjsNCj4gPiDCoMKgwqDCoMKgIHU4IHNoaWZ0Ow0KPiA+ICvC
oMKgwqDCoCBkbWFfYWRkcl90IG1taW5mcmFfb2Zmc2V0Ow0KPiANCj4gSXQgbG9va3MgbGlrZSB0
aGlzIGlzIGV4YWN0bHkgdGhlIERSQU0ncyBpb3N0YXJ0Li4uIGF0IGxlYXN0LCBJIGNhbg0KPiBz
ZWUgdGhhdCBpbiB0aGUNCj4gZG93bnN0cmVhbSBkZXZpY2V0cmVlIHRoYXQncyB3aGVyZSBpdCBz
dGFydHMuDQo+IA0KPiDCoMKgwqDCoMKgwqDCoCBtZW1vcnk6IG1lbW9yeUA4MDAwMDAwMCB7DQo+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkZXZpY2VfdHlwZSA9ICJtZW1vcnkiOw0K
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVnID0gPDAgMHg4MDAwMDAwMCAwIDB4
NDAwMDAwMDA+Ow0KPiDCoMKgwqDCoMKgwqDCoCB9Ow0KPiANCj4gSXQgZG9lc24ndCByZWFsbHkg
bG9vayBsaWtlIGJlaW5nIGEgY29pbmNpZGVuY2UsIGJ1dCwgZm9yIHRoZSBzYWtlIG9mDQo+IGFz
a2luZzoNCj4gaXMgdGhpcyBqdXN0IGEgY29pbmNpZGVuY2U/IDotKQ0KPiANCg0KQXMgdGhlIGNv
bmZpcm1hdGlvbiB3aXRoIHRoZSBoYXJkd2FyZSBkZXNpZ25lciBpbiBwcmV2aW91cyByZXBseSBt
YWlsDQpmb3IgQ0s6DQpodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgt
bWVkaWF0ZWsvcGF0Y2gvMjAyNTAyMTgwNTQ0MDUuMjAxNzkxOC00LWphc29uLWpoLmxpbkBtZWRp
YXRlay5jb20vIzI2MjU4NDYzDQoNClNpbmNlIHRoZSBNTUlORlJBIHJlbWFwIHN1YnRyYWN0aW5n
IDJHIGlzIGRvbmUgaW4gdGhlIGhhcmR3YXJlIGNpcmN1aXQNCmFuZCBjYW5ub3QgYmUgY29uZmln
dXJlZCBieSBzb2Z0d2FyZSwgdGhlIGFkZHJlc3MgKzJHIGFkanVzdG1lbnQgaXMNCm5lY2Vzc2Fy
eSB0byBpbXBsZW1lbnQgaW4gdGhlIENNRFEgZHJpdmVyLg0KDQpTbyB0aGF0IG1pZ2h0IG5vdCBi
ZSBhIGNvaW5jaWRlbmNlLg0KQnV0IGV2ZW4gaWYgRFJBTSBzdGFydCBhZGRyZXNzIGNoYW5nZXMs
IHRoaXMgbW1pbmZyYV9vZmZzZXQgaXMgc3RpbGwNCnN1YnRyYWN0aW5nIDJHLCBzbyBJIHRoaW5r
IGl0IGlzIGEgYmV0dGVyIGNob2ljZSB0byBkZWZpbmUgaXQgYXMgdGhlDQpkcml2ZXIgZGF0YSBm
b3IgTVQ4MTk2Lg0KDQo+ID4gwqDCoMKgwqDCoCBib29sIGNvbnRyb2xfYnlfc3c7DQo+ID4gwqDC
oMKgwqDCoCBib29sIHN3X2Rkcl9lbjsNCj4gPiArwqDCoMKgwqAgYm9vbCBnY2Vfdm07DQo+ID4g
K8KgwqDCoMKgIHUzMiBkbWFfbWFza19iaXQ7DQo+ID4gwqDCoMKgwqDCoCB1MzIgZ2NlX251bTsN
Cj4gPiDCoCB9Ow0KPiA+IA0KPiA+ICtzdGF0aWMgaW5saW5lIHUzMiBjbWRxX3JlZ19zaGlmdF9h
ZGRyKGRtYV9hZGRyX3QgYWRkciwgY29uc3QNCj4gPiBzdHJ1Y3QgZ2NlX3BsYXQgKnBkYXRhKQ0K
PiA+ICt7DQo+ID4gK8KgwqDCoMKgIHJldHVybiAoKGFkZHIgKyBwZGF0YS0+bW1pbmZyYV9vZmZz
ZXQpID4+IHBkYXRhLT5zaGlmdCk7DQo+ID4gK30NCj4gPiArDQo+ID4gK3N0YXRpYyBpbmxpbmUg
dTMyIGNtZHFfcmVnX3JldmVydF9hZGRyKGRtYV9hZGRyX3QgYWRkciwgY29uc3QNCj4gPiBzdHJ1
Y3QgZ2NlX3BsYXQgKnBkYXRhKQ0KPiA+ICt7DQo+ID4gK8KgwqDCoMKgIHJldHVybiAoKGFkZHIg
PDwgcGRhdGEtPnNoaWZ0KSAtIHBkYXRhLT5tbWluZnJhX29mZnNldCk7DQo+ID4gK30NCj4gDQo+
IEknbSBub3Qgc3VyZSB0aGF0IHlvdSByZWFsbHkgbmVlZCB0aG9zZSB0d28gZnVuY3Rpb25zLi4u
IHByb2JhYmx5DQo+IGl0J3Mgc2ltcGx5DQo+IGNsZWFuZXIgYW5kIGVhc2llciB0byBqdXN0IHdy
aXRlIHRoYXQgc2luZ2xlIGxpbmUgZXZlcnkgdGltZS4uLiBhbmQNCj4gSSdtDQo+IHNheWluZyB0
aGF0IGVzcGVjaWFsbHkgZm9yIGhvdyB5b3UncmUgdXNpbmcgdGhvc2UgZnVuY3Rpb25zLCB3aXRo
DQo+IHNvbWUgcmVhZGwoKQ0KPiBwYXNzZWQgZGlyZWN0bHkgYXMgcGFyYW0sIGRlY3JlYXNpbmcg
aHVtYW4gcmVhZGFiaWxpdHkgYnkgImEgd2hvbGUNCj4gbG90IiA6LSkNCj4gDQoNClRoZSByZWFz
b24gd2h5IEkgdXNlIEFQSSB3cmFwcGVyIGluc3RlYWQgb2Ygd3JpdGluZyBpdCBkaXJlY3RseSBp
bg0KcmVhZGwoKSBpcyB0byBhdm9pZCBtaXNzaW5nIHRoZSBzaGlmdCBvciBtbWluZnJhX29mZnNl
dCBjb252ZXJzaW9uIGluDQpzb21lIHBsYWNlcy4NClRoaXMgcHJvYmxlbSBpcyBub3QgZWFzeSB0
byBkZWJ1ZywgYW5kIEkgaGF2ZSBlbmNvdW50ZXJlZCBpdCBhdCBsZWFzdA0KdHdpY2UuLi4NCg0K
SSB0aGluayB0aGUgYWR2YW50YWdlIG9mIHVzaW5nIGZ1bmN0aW9uIGlzIHRoYXQgaXQgY2FuIGJl
IHVuaWZvcm1seQ0KbW9kaWZpZWQgdG8gYWxsIHBsYWNlcyB0aGF0IG5lZWQgdG8gaGFuZGxlIERS
QU0gYWRkcmVzcyBjb252ZXJzaW9uLg0KV2hhdCBkbyB5b3UgdGhpbms/IDotKQ0KDQo+ID4gKw0K
PiA+IMKgIHN0YXRpYyB2b2lkIGNtZHFfc3dfZGRyX2VuYWJsZShzdHJ1Y3QgY21kcSAqY21kcSwg
Ym9vbCBlbmFibGUpDQo+ID4gwqAgew0KPiA+IMKgwqDCoMKgwqAgV0FSTl9PTihjbGtfYnVsa19l
bmFibGUoY21kcS0+cGRhdGEtPmdjZV9udW0sIGNtZHEtPmNsb2NrcykpOw0KPiA+IEBAIC0xMTIs
NiArMTM2LDMwIEBAIHU4IGNtZHFfZ2V0X3NoaWZ0X3BhKHN0cnVjdCBtYm94X2NoYW4gKmNoYW4p
DQo+ID4gwqAgfQ0KPiA+IMKgIEVYUE9SVF9TWU1CT0woY21kcV9nZXRfc2hpZnRfcGEpOw0KPiA+
IA0KPiA+ICtkbWFfYWRkcl90IGNtZHFfZ2V0X29mZnNldF9wYShzdHJ1Y3QgbWJveF9jaGFuICpj
aGFuKQ0KPiA+ICt7DQo+ID4gK8KgwqDCoMKgIHN0cnVjdCBjbWRxICpjbWRxID0gY29udGFpbmVy
X29mKGNoYW4tPm1ib3gsIHN0cnVjdCBjbWRxLA0KPiA+IG1ib3gpOw0KPiA+ICsNCj4gPiArwqDC
oMKgwqAgcmV0dXJuIGNtZHEtPnBkYXRhLT5tbWluZnJhX29mZnNldDsNCj4gPiArfQ0KPiA+ICtF
WFBPUlRfU1lNQk9MKGNtZHFfZ2V0X29mZnNldF9wYSk7DQo+IA0KPiBJIHRoaW5rIEkgcmVtZW1i
ZXIgdGhpcyBnZXRfb2Zmc2V0X3BhIGZyb20gdGhlIG9sZCB0aW1lcywgdGhlbiBDSw0KPiByZW1v
dmVkIGl0IChhbmQgSQ0KPiB3YXMgcmVhbGx5IGhhcHB5IGFib3V0IHRoYXQgZGlzYXBwZWFyaW5n
KSwgb3IgYW0gSSBjb25mdXNpbmcgdGhpcw0KPiB3aXRoIHNvbWV0aGluZw0KPiBlbHNlPw0KPiAN
Cj4gKG9mIGNvdXJzZSwgdGhpcyB3YXNuJ3QgdXNlZCBmb3IgbW1pbmZyYSwgYnV0IGZvciBzb21l
dGhpbmcgZWxzZSEpDQo+IA0KDQpJIGNhbid0IGZpbmQgYW55IHJlbW92ZSBoaXN0b3J5IGluIG10
ay1jbWRxLW1haWxib3guYy4NCg0KTWF5YmUgeW91IG1lYW4gdGhlIHBhdGNoIGluIHRoaXMgc2Vy
aWVzPw0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzE3MTIxMzkzODA0OS4xMjM2OTguMTU1
NzM3Nzk4Mzc3MDM2MDI1OTEuYjQtdHlAY29sbGFib3JhLmNvbS8NCg0KPiA+ICsNCj4gPiArYm9v
bCBjbWRxX2FkZHJfbmVlZF9vZmZzZXQoc3RydWN0IG1ib3hfY2hhbiAqY2hhbiwgZG1hX2FkZHJf
dA0KPiA+IGFkZHIpDQo+ID4gK3sNCj4gPiArwqDCoMKgwqAgc3RydWN0IGNtZHEgKmNtZHEgPSBj
b250YWluZXJfb2YoY2hhbi0+bWJveCwgc3RydWN0IGNtZHEsDQo+ID4gbWJveCk7DQo+ID4gKw0K
PiA+ICvCoMKgwqDCoCBpZiAoY21kcS0+cGRhdGEtPm1taW5mcmFfb2Zmc2V0ID09IDApDQo+ID4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gZmFsc2U7DQo+ID4gKw0KPiA+ICvCoMKg
wqDCoCAvKg0KPiA+ICvCoMKgwqDCoMKgICogbW1pbmZyYSB3aWxsIHJlY29nbml6ZSB0aGUgYWRk
ciB0aGF0IGdyZWF0ZXIgdGhhbiB0aGUNCj4gPiBtbWluZnJhX29mZnNldA0KPiA+ICvCoMKgwqDC
oMKgICogYXMgYSB0cmFuc2FjdGlvbiB0byBEUkFNLg0KPiA+ICvCoMKgwqDCoMKgICogU28gdGhl
IGNhbGxlciBuZWVkcyB0byBhcHBlbmQgbW1pbmZyYV9vZmZzZXQgZm9yIHRoZSB0cnVlDQo+ID4g
Y2FzZS4NCj4gPiArwqDCoMKgwqDCoCAqLw0KPiA+ICvCoMKgwqDCoCByZXR1cm4gKGFkZHIgPj0g
Y21kcS0+cGRhdGEtPm1taW5mcmFfb2Zmc2V0KTsNCj4gDQo+IA0KPiAvKioNCj4gwqAgKiBjbWRx
X2lzX21taW5mcmFfZ2NlKCkgLSBCcmllZiBkZXNjcmlwdGlvbg0KPiDCoCAqIEBhcmdzLi4uLi4N
Cj4gwqAgKg0KPiDCoCAqIFRoZSBNTUlORlJBIEdDRSB3aWxsIHJlY29nbml6ZSBhbiBhZGRyZXNz
IGdyZWF0ZXIgdGhhbiBEUkFNDQo+IGlvc3RhcnQgYXMgYQ0KPiDCoCAqIERSQU0gdHJhbnNhY3Rp
b24gaW5zdGVhZCBvZiAuLi4ueHl6DQo+IMKgICoNCj4gwqAgKiBJbiBvcmRlciBmb3IgY2FsbGVy
cyB0byBwZXJmb3JtICh4eXopIHRyYW5zYWN0aW9ucyB0aHJvdWdoIHRoZQ0KPiBDTURRLCB0aG9z
ZQ0KPiDCoCAqIG5lZWQgdG8ga25vdyBpZiB0aGV5IGFyZSB1c2luZyBhIEdDRSBsb2NhdGVkIGlu
IE1NSU5GUkEuDQo+IMKgICovDQo+IGJvb2wgY21kcV9pc19tbWluZnJhX2djZSguLi4pDQo+IHsN
Cj4gwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGNtZHEtPnBkYXRhLT5tbWluZnJhX29mZnNldCAmJg0K
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIChhZGRyID49IGNtZHEtPnBkYXRhLT5tbWlu
ZnJhX29mZnNldCkNCj4gDQo+ID4gK30NCj4gPiArRVhQT1JUX1NZTUJPTChjbWRxX2FkZHJfbmVl
ZF9vZmZzZXQpOw0KPiA+ICsNCj4gDQoNCk9LLCBJJ2xsIG1vZGlmeSB0aGUgQVBJIGxpa2UgdGhp
cy4NCg0KPiAuLi5idXQgdGhlbiwgaXMgdGhlcmUgcmVhbGx5IG5vIHdheSBvZiBqdXN0IGhhbmRs
aW5nIHRoZSBHQ0UgYmVpbmcgaW4NCj4gTU1JTkZSQQ0KPiB0cmFuc3BhcmVudGx5IGZyb20gdGhl
IGNhbGxlcnM/IERvIHRoZSBjYWxsZXJzIHJlYWxseSAqbmVlZCogdG8ga25vdw0KPiB0aGF0IHRo
ZXkncmUNCj4gdXNpbmcgYSBuZXcgR0NFPyENCj4gDQoNClNpbmNlIHRoZSBhZGRyZXNzIHN1YnRy
YWN0aW5nIGlzIGRvbmUgaW4gTU1JTkZSQSBoYXJkd2FyZSwgSSB0aGluayBHQ0UNCnVzZXJzIHJl
YWxseSBuZWVkIHRvIGhhbmRsZSBpdCBpbiBkcml2ZXIuDQoNCj4gQW5vdGhlciB3YXkgb2Ygc2F5
aW5nOiBjYW4ndCB3ZSBqdXN0IGhhbmRsZSB0aGUgYWRkcmVzcyB0cmFuc2xhdGlvbg0KPiBpbiBo
ZXJlIGluc3RlYWQNCj4gb2YgaW5zdHJ1Y3RpbmcgZWFjaCBhbmQgZXZlcnkgZHJpdmVyIGFib3V0
IGhvdyB0byBjb21tdW5pY2F0ZSB3aXRoDQo+IHRoZSBuZXcgR0NFPyENCj4gDQoNClRoZSBEUkFN
IGFkZHJlc3MgbWF5IG5vdCBvbmx5IGJlIHRoZSBjb21tYW5kIGJ1ZmZlciB0byBHQ0UsIGJ1dCBh
bHNvDQp0aGUgd29ya2luZyBidWZmZXIgcHJvdmlkZWQgYnkgQ01EUSB1c2VycyBhbmQgYmVpbmcg
YSBwYXJ0IG9mIEdDRQ0KaW5zdHJ1Y3Rpb24sIHNvIHdlIG5lZWQgdG8gaGFuZGxlIHRoZSBhZGRy
ZXNzIHRyYW5zbGF0aW9uIGluIENNRFENCmhlbHBlciBkcml2ZXIgZm9yIHRoZSBpbnN0cnVjdGlv
biBnZW5lcmF0aW9uLg0KRS5nLiBJU1AgZHJpdmVycyBtYXkgdXNlIEdDRSB0byB3cml0ZSBhIGhh
cmR3YXJlIHNldHRpbmdzIHRvIGEgRFJBTSBhcw0KYmFja3VwIGJ1ZmZlci4gVGhlIEdDRSB3cml0
ZSBpbnN0cnVjdGlvbiB3aWxsIGJlOg0KV1JJVEUgdGhlIHZhbHVlIG9mIElTUCByZWdpc3RlciB0
byBEUkFNIGFkZHJlc3MgKyBtbWluZnJhX29mZnNldC4NCg0KQnV0IG1vc3Qgb2YgdGhlIENNRFEg
dXNlcnMgb25seSBuZWVkIHRvIHVzZSBHQ0UgdG8gd3JpdGUgaGFyZHdhcmUNCnJlZ2lzdGVyLCBz
byBJIG9ubHkga2VlcCB0aGUgdHJhbnNsYXRpb24gaW4gY21kcV9wa3RfbWVtX21vdmUoKSwNCmNt
ZHFfcGt0X3BvbGxfYWRkcigpIGFuZCBjbWRxX3BrdF9qdW1wX2FicygpIGF0IHRoZSBsYXRlc3Qg
c2VyaWVzLg0KDQpSZWdhcmRzLA0KSmFzb24tSkggbGluDQoNCj4gDQo+IENoZWVycywNCj4gQW5n
ZWxvDQoNCg==

