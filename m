Return-Path: <linux-media+bounces-48644-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F44CB6C73
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 18:42:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CAEFE303C2BA
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 17:41:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9016231E0E6;
	Thu, 11 Dec 2025 17:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="WzSrIkD6";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="Ct7rQxQT"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CCB231A06A;
	Thu, 11 Dec 2025 17:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765474508; cv=fail; b=DwTSRpLX+XcJ6G6MG58wAz6aae+PXAz1LAYecXDTEsZsZgPP1LLcLIeC3aPRLAayI/AUqwFkfv2HpTN3rSTMQ0wqaiBCElmHouZ8woj+EmAfVOiXo/GVKAtvJte74sUYQvo8tfeSITqJ10nEhTU4e8ZbZ7z88sQYKz2VI9EOMDU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765474508; c=relaxed/simple;
	bh=Jg4szwj3OUHm58mAJR4wvQMnYyFocX3cafGxJv1230E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=d0JEt3qM6LkDRzQGSMf+oAfRzs+bcQxcuGyqS7UWVGq7LQc9lPGdmb+aEmpMHwhUvur97eAprREHaA2ygQifGOrpxXkgk6GL1JLnhOa0RE7ltsDNoHH/3Tt67ahIm6ZN8uqeYOjnjV9ud0iF3RItOJrDvZ80v7bDZUBPV7bUr84=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=WzSrIkD6; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=Ct7rQxQT; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: b7366202d6b711f0b2bf0b349165d6e0-20251212
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=Jg4szwj3OUHm58mAJR4wvQMnYyFocX3cafGxJv1230E=;
	b=WzSrIkD6IuvvmMQVbGv9sIjCeJOBg5xZF4DaBx8NKSsSTQCdlbS15mbUjb/jG8l/J/K/E/FcjUHjhfxoUMSF/VaYUYK32R6IJEZ2p3CsjsqX7AkFtUcQEYC6nYlllmLZY+cc145Ze3zVdyc+7YGYjih0lBToYuynWjpY0GKFOZA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:9d594100-f5fc-4b32-a281-dfa79e6f0c3b,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:898556c6-8a73-4871-aac2-7b886d064f36,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil
	,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b7366202d6b711f0b2bf0b349165d6e0-20251212
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1892835624; Fri, 12 Dec 2025 01:34:58 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 12 Dec 2025 01:34:57 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Fri, 12 Dec 2025 01:34:57 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WwijInxGUUsFX29UhfibLK41iZIruITGilRi0dTIr2Atnik8pMCJfhUsbcO+MuzAmAHtNZQ1ifiMduU/a3I0w63Jk/3FpmQREyrDYNeDd5g0uUjBC5RQqUN1szp2vF5m1MVbrPJqdo732ZrYwMPaqZvslfNZvKIp2eOJul+hYH+Hc5ApnSvxn2j/isX/0P90Q6X9LKSMqNEPFUHulCTrus2azm9mHFpoT/9E+mxU7etRRYE7NdJnBLx6LP+YPb/Cn2KTWshwdXGrahHWHaPi/X4G1y7s0Fe+mCNF8OiqI4LnGzV6J0k0mNKwodCScsHPfqlCYY1pi/dBoAHciGRm0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jg4szwj3OUHm58mAJR4wvQMnYyFocX3cafGxJv1230E=;
 b=e94lr6v6bydrjy4QtBDYGdrS+CfrI3LC70PdYHtndud0ICPOHuVVM33pAt29Z4+GhqWlmu/hfr8PX4HKGMMJmOHfPTLPERxgh+gUyd0jRWzu86h3rIc3BOxPmsMxhqJ0t9wdomOCRyob1rbYhLEnjDoF2zCMlnfFFuWGDTk/clRuzissVEpNaznalofUxNYIXTw74Dv5R+c9Asayw5xy2MOjyWBn50Xmxqgq+ztqoggcnP5/ZXx7DWYbKMuac82TVTDxy0YsKUbCFM3OH+1o2ooOFAFMo6LUeHjzHz9xZ1raHmyZCiDeE8S+Whq62Pkm4h/XcjoXbT3Xal8VSwmMvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jg4szwj3OUHm58mAJR4wvQMnYyFocX3cafGxJv1230E=;
 b=Ct7rQxQTjeRCvekXw5xDgtzyVWB+JHZ0hO/B0deEmjh9x4SQsFUIMxCIWfKXO7N8BoiafwoZ08bnnOPlMBTCCSY/17aZ9jsqe30gwC70Q95o1Trj9DT3gvmtUlHozKibeTTZdKyoI3ht/pAVs4ZwwitSBtw1UOcY/Nmx6XefJjM=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by SEZPR03MB7122.apcprd03.prod.outlook.com (2603:1096:101:e5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Thu, 11 Dec
 2025 17:34:52 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%7]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 17:34:52 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>, "robh@kernel.org"
	<robh@kernel.org>, "nicolas@ndufresne.ca" <nicolas@ndufresne.ca>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "jassisinghbrar@gmail.com"
	<jassisinghbrar@gmail.com>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	=?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
	=?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	=?utf-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
	<Xiandong.Wang@mediatek.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	=?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"fshao@chromium.org" <fshao@chromium.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	"wenst@chromium.org" <wenst@chromium.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>
Subject: Re: [PATCH v7 17/20] media: platform: mtk-mdp3: Use
 cmdq_pkt_jump_rel() without shift_pa
Thread-Topic: [PATCH v7 17/20] media: platform: mtk-mdp3: Use
 cmdq_pkt_jump_rel() without shift_pa
Thread-Index: AQHcaU8QO1fAIZT6dk6Lh2+lvC+tM7UctkqA
Date: Thu, 11 Dec 2025 17:34:52 +0000
Message-ID: <8270743bbea41ec9fe7d694908ec0c677ed7ba09.camel@mediatek.com>
References: <20250827114006.3310175-1-jason-jh.lin@mediatek.com>
	 <20250827114006.3310175-18-jason-jh.lin@mediatek.com>
	 <ae08e53e055a238cde639dc9d9c7263fa296af5f.camel@ndufresne.ca>
In-Reply-To: <ae08e53e055a238cde639dc9d9c7263fa296af5f.camel@ndufresne.ca>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|SEZPR03MB7122:EE_
x-ms-office365-filtering-correlation-id: 765a8243-eac6-4d3e-9d4f-08de38db977f
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?dWh0Y3NKcGp4bzVZRDVIazhIaTBYSnpsTHBxd010WStGWVpUQkg1TDZmMVBn?=
 =?utf-8?B?SEJiVUduMi9PNUV4d2w2VEh2eWI4a1dSMkZOUThyaFFGZEJOZTNUZ1Q3b3hB?=
 =?utf-8?B?VXRUTmtuRUdBbmxZaWJWMFJESEJ6dmc4WGxnT3FVbzJmajgzS0VpamM1Rksy?=
 =?utf-8?B?NG9uV2NDVURzV0tNRDVuOFZ2Y1RZMTNlVVZnQ0xOb0xEN21CYlVYQ3VmZUVC?=
 =?utf-8?B?MVIycGJTK01OdnhBWERCQThrYVV6a25lQm1yNzNENUVQVURzRFdFaTdmK21R?=
 =?utf-8?B?VTFqNGh0aTc2TkhYM3JlblZZaWRNazdub0JLT3dqN3l0ZU1rbW9aNTVWVURa?=
 =?utf-8?B?QnpTSXVlQXRNZlhXYVhoZmhSaGQxZUxQaVArb3ZhMDZ5dTlja1JsK3E1OFV6?=
 =?utf-8?B?YXZiTlRSVDNucUZIb1NkYU91S1RHTDFldnllSitRY3ZkajVLaU54eThGbU5j?=
 =?utf-8?B?dGthZTJuUjdTQzJCMHBjYmQ2MlNkRkszNnBHbE9FSzJIRDVRVEJDLzhMWnF3?=
 =?utf-8?B?a2ZGQmVYbGJRaFVkbzNFbVhBc3g0dHFEUXFPRmc3bzg3UHhuV1F1RTJ0Vkhm?=
 =?utf-8?B?R1ZMNmxJU1p0ODd4b0tWanZNZW44NE9pbzZqZ2I1cWZBZWJGWitRUERoYWts?=
 =?utf-8?B?ZXhGQ29uRUVPdWhBbVdpTUxFRVdXYWhDakhmN3RQck9OVWZLWGNUS2RHQk9q?=
 =?utf-8?B?M2xQQVZYK21ySzJXbkRoVStMMlpCVlAyaDVGVHhJaXRTQWx5NEpYNyttVnB5?=
 =?utf-8?B?eEExaHA4Q3lRL29rRDl4YjFJRW9NZVpxOVg0a0FpUHV5dnB3SW1pVlhnNHl4?=
 =?utf-8?B?SWUyVDM2T0QyK3Z2NnQ5OEhTQUdwL3lsbURKandBZHpLMVdtMGZvdVdtK0VT?=
 =?utf-8?B?RFMweTVXSzU3bTBQbE9VbjRPTFBqNXFEaThvd2ZVNDIrazJiK2NhamJnNlJP?=
 =?utf-8?B?TEVWUUVtZlZZTllXMTdXNFhRdkd2dXkrRzFBVi9nMHMyT1YySTNYUUJrVy8w?=
 =?utf-8?B?M1EvTis1SzhiRHcwWThCQ2kzeXpRNXVlSUVaOHRyZ2RaTFZEcjNCSU9qMFlM?=
 =?utf-8?B?K2NuUm1PRk5wS0VrZTJPR0xPN1NQbGd2ZVV3OUFlWGJlaEx6UmNYU3lWbEc5?=
 =?utf-8?B?cFNTTlNhbWs4SUhiWTJCVldtYlc5ZE1OcUU2MG0renA4cm5jTEhSTDVZMnpQ?=
 =?utf-8?B?ZFBEbUdqOEgwb1RzZ3lsMTFDTkhEbFdsUkpGRCtNSFp4TWtraUdqT2dwU1Nt?=
 =?utf-8?B?UlRvaGdFZ28rdzRHWmRvWHFhZzdWZ2FvSklHUTV2bXE4RVlxeW1uOU5YcHJX?=
 =?utf-8?B?TWtBTzZPb3BJWkxTRDF4amJVcUN3TnRhZGpaaVBJY0FId25FT3p6STU1TW5z?=
 =?utf-8?B?QWZIRXhnbmdOcVgrVEIvTmJlYThtRTErd2VPQ3EyOVRDQmN6UW0vRWxTMmtk?=
 =?utf-8?B?SEtqcWJ0cE5NVzg5U2ZmamthVXJtRjRMOG9rRWZ4V2JZWlZxVlJlZkZYUlpv?=
 =?utf-8?B?cW0vRFdhQnNYZUFPSnB0QUdFWkZ2TGNHNEE4L3lpeVBjbXJuWmxkbkpvVk53?=
 =?utf-8?B?eFBLMUo1RnBTdWI0NmQ0aGRtcWxXMG5KdU5NcUpaajVNZlFFOTFSdFJmOGJP?=
 =?utf-8?B?NFVOSFBQclV0NkdscElXTUZzcGVKWEpSMm1ld3NXdWhZOEI0UHo2bndUTlVp?=
 =?utf-8?B?Mk00SmcrVGdydFRpeFdjRnBVbjd5dlJNbm8rRStTQmhYSyt1YVYyekI1Nnow?=
 =?utf-8?B?UFRoRi94TW1TWTNVdlIzRm9mN3VJdWxiYWNsUmVhZ2RQNHBzRS82LzBmVHBR?=
 =?utf-8?B?Y3JoWDFvNXRLeXFudXM3N0hZMzdLVm1MUzYwNFpSSkpMVFoweU9kd0NObmZo?=
 =?utf-8?B?Tm5FNGh1VVRQa05JSEIvVm13NGV4VnoyWDlOVks0M0dBNnFhU1gwZ1BOdXpy?=
 =?utf-8?B?Q1VKcGFoV1dOa2xkQTgwaEwybTFQeFdSQktJSkpTeStlN2MxM0lTWXkxYnUw?=
 =?utf-8?B?dDcrMzVENURWM1Evd055aDFSUGU3azhDWkJlV2tiYWJYM1RrRkJHUGZpV1ZD?=
 =?utf-8?B?KzY3emZxeFF4WFFMWXFWRGVzSXcySHl2aGVOUT09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7682.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QkRMMXk1NTNyYmxvUXBxRVpLRjJjOUR3UVJ3bCtDd3RvaTNzSUlqSUpjODBZ?=
 =?utf-8?B?dEVnbnpBbkt3WXhGM1RPa1BrUGdSaXZodTlNNGN1eEVhZ1hyT2ZRR21CcHht?=
 =?utf-8?B?VkcxZ2pibk5YTngyL0xqQi9SZ3lzL1dNNjQ4SS9IWEIxYUNRNXcwZWt5RmFq?=
 =?utf-8?B?aG9LUXZaczN1VFBQWm9hQVhnMGc4ZlBYTDJrMmlQZVVXdzBIcHRJWG8xTGlQ?=
 =?utf-8?B?SFYrRUVoM09XYXpXbmNBcUZpRVcwRjI1ZU5PVlVXMHNLTU9TQlkvQkppSkFm?=
 =?utf-8?B?Qlo3Zk94MFRJM0xEY0p2SjIzQU9qNksvTDRvYXhweW8ydEdlMWJPc2hQczZk?=
 =?utf-8?B?RnpsTG9IdTRoSURvRnFRYS96bGdHaHM5VmJsN3VJVlRCVGNCTGN5SEdrQjhV?=
 =?utf-8?B?MFRjaVhWSU80M3J5b3AvVjdKQzdPSWhlUnk3ZnlVMjVDYjlGK0lvMGlPRnc5?=
 =?utf-8?B?UUlSUTBxMEZySWNHVnp3RGk3cGdYNXZ5RGVLRUIzRjNvZ3RnVlV4cGJPOCtm?=
 =?utf-8?B?VFRIMnVsMFhvREU2ZG1OVG9OanFpbnN2VXZiZ00vdER2TWtMUVRuMy9xUHYy?=
 =?utf-8?B?c1VTckFhUXR1cU5XUFMvbHRnVVRjb29qQVFUcXV1TG9QOEJJM0Njb0RKWjdh?=
 =?utf-8?B?ZzRwN1lBV1JvZW4rRE9MaE9BZnl4K3c4TWdvRlJYcGIvSHlCRWMzUE40L3hS?=
 =?utf-8?B?WlBONUtvVGRNRlgxMnlaS0Z6QW9paW5PUDFTVm9DVUJhWmNWbklQWFB5ai9R?=
 =?utf-8?B?VVN4UjJKTUJLWkY4QmNSQUczV3JGQ0xiU2hPRzBqUjRaVzFCQURxV1pCU0hN?=
 =?utf-8?B?Vzd6Q1ZrYWg4amhZaGFsbUZ5Q0MrUTVTNnVpOFZOOGlTRnJHU3BGMkhGamIw?=
 =?utf-8?B?QkN2ZldqRzFhVXFmOEtqWW9rN2RBalVKelRRU1daK1o4ck9uYlgwWnBEdWwx?=
 =?utf-8?B?ZVFUWEZwSUxuWlV5blRaQkEzZ0M0UFJLRmExUlY0WUd1Tk9PT2F4WklldUFo?=
 =?utf-8?B?QmQxZy9JSGVjVEIwNG9hSVFxTlp6MW9PNzBRTkhaS2ZWZXgxbGFodVR5amJu?=
 =?utf-8?B?UlgzbzFPYVNBZHE2VkJzMlllWWk4ZVhyN3JnSU1uRmtmT01MWFd1WEsxS3JD?=
 =?utf-8?B?V3QzR1VxMUwyRnlsYk15V2NDMldXdWxVUitFVFgxa2JsMmdpNXpzZkEzZkhD?=
 =?utf-8?B?aDlvRnhIUVM3TVowUFN5dHk1REUzMGxNR3pzb201cVVONk91Y0c3TE5xem1F?=
 =?utf-8?B?VTEvWGgyZ0dtbzdxQ3Y2V0VvLzNKYmxvekZNYW1hemozVmQvck9DcloxeHR1?=
 =?utf-8?B?NzlyTlQvYVQ5RzVrSEoyRStRQVptNE1SeEg3cXIxVEtvZzRpNXhGRGQyeEFU?=
 =?utf-8?B?cXJDZzFBUVo2dXJ0TElSNjVlZmlNS0hQUnRvYUlsQUZsU0JsZmtUN2F0aDNk?=
 =?utf-8?B?OWk2TE5lZUlxMFNBYitHZlN1MFJBN21EWUlVcnVHNG9pQkd6dXhjYjBLS0Mx?=
 =?utf-8?B?cDNpL2Nwa1pnbWJtZkx2YXgwRlFBRGgrSUpHMzRtazZYZlc4Z2dZcWlWZWUw?=
 =?utf-8?B?WEJGRVVIQncxbjNKdk5ScHc1aVNwSDNZbmRUVlBka1dLVDZ2WDRNUUNSdVdj?=
 =?utf-8?B?ZWhhbnY0aWFIaWFvZlBldGpLVCsvN3ZBSklhbWFpU3pUOENXUHcxVUp2c01X?=
 =?utf-8?B?SndsNXlOT3VQQkdaNXEyVzdKODlGRFhyT095Z1g2VGVoWXRtTmw4MzkwMkt6?=
 =?utf-8?B?Vkt4c2czYkJjRHNOMkdLSXZ2VHRoK1hBTVd6VlBUOTdjbjlPOVMwZGlBMm1H?=
 =?utf-8?B?dmw3SnQ3NDh3b0tTL1ZFbHhpZlpsQm5DV3NFbmV2VHo4cWxjb2RTd0w3ZVBY?=
 =?utf-8?B?U2lGbjJwSWNsL0hQbTlidmNPN1ZGOExVdGZnbG85K2VzWHZBQjl4ZWIrZkda?=
 =?utf-8?B?ZXRYajhqQm00TTZiYllGZlpoQWFwUG4zT0ZHaUxkeEtKSk5NY0xqZU9KbTlm?=
 =?utf-8?B?NU8vZzB1aGxWWXU2WG1Rem5FaEFHdTFOeXB1dHk2WGRxYS9hUVE0WnpNRGdK?=
 =?utf-8?B?emZMRGRLY2ttK3BmZnlrTG5uQWM4MFNVUmxvczI5YjZEZTBpMEpwWElJRHRq?=
 =?utf-8?B?ckpsZ0ZmV0o5WVpjSVVOQnB5azFlY3dmL1VRSTBqd0VtU0ZmeHFjZEhUaWk1?=
 =?utf-8?B?ZlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FC45EB6C2DE20D4B87DAB04646798B45@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 765a8243-eac6-4d3e-9d4f-08de38db977f
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2025 17:34:52.3787
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FXemmb/LbknNcxLa/6xFrY2kXhRSn8ie9gBhE5jvC6iYLMVBJHZY+WASnM3ooNQR8GEg2BwLoHW0ROXfdSZEOZz9I/PklFDeWgXBGGBBNVs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7122

SGkgTmljb2xhcywNCg0KT24gVHVlLCAyMDI1LTEyLTA5IGF0IDE2OjAxIC0wNTAwLCBOaWNvbGFz
IER1ZnJlc25lIHdyb3RlOg0KPiBIaSwNCj4gDQo+IExlIG1lcmNyZWRpIDI3IGFvw7t0IDIwMjUg
w6AgMTk6MzcgKzA4MDAsIEphc29uLUpIIExpbiBhIMOpY3JpdMKgOg0KPiA+IFdpdGggdGhlIHJl
bW92YWwgb2YgdGhlIHNoaWZ0X3BhIHBhcmFtZXRlciwNCj4gPiBjbWRxX3BrdF9qdW1wX3JlbF90
ZW1wKCkNCj4gPiBjYW4gYmUgcmVwbGFjZWQgYnkgdGhlIG5ldyBjbWRxX3BrdF9qdW1wX3JlbCgp
IHdpdGhvdXQgc2hpZnRfcGEuDQo+ID4gDQo+ID4gVGhlbiwgcmVtb3ZlIHRoZSBjbWRxX3NoaWZ0
X3BhIHZhcmlhYmxlIGluIHRoZSBtZHBfZGV2IHN0cnVjdHVyZQ0KPiA+IGZvcg0KPiA+IGVhY2gg
bWJveCBjbGllbnQuDQo+ID4gDQo+ID4gRml4ZXM6IGFkZTE3NjUzNDExMiAoInNvYzogbWVkaWF0
ZWs6IGNtZHE6IEFkZCBwYXJhbWV0ZXIgc2hpZnRfcGENCj4gPiB0byBjbWRxX3BrdF9qdW1wKCki
KQ0KPiA+IFNpZ25lZC1vZmYtYnk6IEphc29uLUpIIExpbiA8amFzb24tamgubGluQG1lZGlhdGVr
LmNvbT4NCj4gPiAtLS0NCj4gPiDCoGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvbWRw
My9tdGstbWRwMy1jbWRxLmMgfCAyICstDQo+ID4gwqBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL21l
ZGlhdGVrL21kcDMvbXRrLW1kcDMtY29yZS5jIHwgMiAtLQ0KPiA+IMKgZHJpdmVycy9tZWRpYS9w
bGF0Zm9ybS9tZWRpYXRlay9tZHAzL210ay1tZHAzLWNvcmUuaCB8IDEgLQ0KPiA+IMKgMyBmaWxl
cyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNCBkZWxldGlvbnMoLSkNCj4gPiANCj4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9tZHAzL210ay1tZHAzLWNt
ZHEuYw0KPiA+IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9tZHAzL210ay1tZHAz
LWNtZHEuYw0KPiA+IGluZGV4IDc1NzVlYzM3NjM2Ny4uYzM1ZmUwZTNhNGQ1IDEwMDY0NA0KPiA+
IC0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvbWRwMy9tdGstbWRwMy1jbWRx
LmMNCj4gPiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL21kcDMvbXRrLW1k
cDMtY21kcS5jDQo+ID4gQEAgLTYzOCw3ICs2MzgsNyBAQCBzdGF0aWMgc3RydWN0IG1kcF9jbWRx
X2NtZA0KPiA+ICptZHBfY21kcV9wcmVwYXJlKHN0cnVjdCBtZHBfZGV2ICptZHAsDQo+ID4gwqAJ
CWdvdG8gZXJyX2ZyZWVfcGF0aDsNCj4gPiDCoAl9DQo+ID4gwqAJY21kcV9wa3RfZW9jKCZjbWQt
PnBrdCk7DQo+ID4gLQljbWRxX3BrdF9qdW1wX3JlbF90ZW1wKCZjbWQtPnBrdCwgQ01EUV9JTlNU
X1NJWkUsIG1kcC0NCj4gPiA+Y21kcV9zaGlmdF9wYVtwcF9pZHhdKTsNCj4gPiArCWNtZHFfcGt0
X2p1bXBfcmVsKCZjbWQtPnBrdCwgQ01EUV9JTlNUX1NJWkUpOw0KPiANCj4gVGhhdCBlZmZlY3Rp
dmVseSByZXZlcnQgYW5vdGhlciBwYXRjaCB0aGF0IGlzIHBlbmRpbmcsIGFuZCByZW1vdmUgdGhl
DQo+IHVzZSBvZiB0aGUNCj4gbmV3IGNtZHFfcGt0X2p1bXBfcmVsX3RlbXAoKS4gSSBkb24ndCBm
b2xsb3cgd2hhdCBpcyBkb2luZyBvbiBoZXJlLCBJDQo+IHRoaW5rIHNvbWUNCj4gY29udGV4dCBt
dXN0IGJlIGxvc3QuDQo+IA0KDQpQbGVhc2UgZm9yZ2V0IGFib3V0IHRoaXMgcGF0Y2guIEkgc2Vw
YXJhdGVkIHRoaXMgc2VyaWVzIHRvIDUgZGlmZmVyZW50DQpzZXJpZXMuDQoNClBsZWFzZSByZWZl
ciB0byBzZXJpZXMgYXBwbGljYXRpb24gb3JkZXI6DQoxLiBbRml4ZXNdIFJlZmluZSBETUEgYWRk
cmVzcyBoYW5kbGluZyBmb3IgdGhlIGNvbW1hbmQgYnVmZmVyDQpodHRwczovL2xvcmUua2VybmVs
Lm9yZy9hbGwvMjAyNTEwMjIxNzE4NDcuMzc5NDcwLTEtamFzb24tamgubGluQG1lZGlhdGVrLmNv
bS8NCjIuIFtTZXJpZXMgMS80XSBBZGQgR0NFIHN1cHBvcnQgZm9yIE1UODE5NiBhbmQgdXBkYXRl
IENNRFEgQVBJcw0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjUxMDMxMTU1ODM4LjE2
NTA4MzMtMS1qYXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tLw0KMy4gW1NlcmllcyAyLzRdIE1pZ3Jh
dGUgc3Vic3lzdGVtcyB0byBuZXcgQ01EUSBBUElzDQpodHRwczovL2xvcmUua2VybmVsLm9yZy9h
bGwvMjAyNTEwMzExNjAzMDkuMTY1NDc2MS0xLWphc29uLWpoLmxpbkBtZWRpYXRlay5jb20vDQo0
LiBbU2VyaWVzIDMvNF0gUmVtb3ZlIHNoaWZ0X3BhIGZyb20gQ01EUSBqdW1wIGZ1bmN0aW9ucw0K
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjUxMDMxMTYwNzEyLjE2NTc4MTAtMS1qYXNv
bi1qaC5saW5AbWVkaWF0ZWsuY29tLw0KNS4gW1NlcmllcyA0LzRdIFJlbW92ZSBkZXByZWNhdGVk
IENNRFEgQVBJcyANCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI1MTAzMTE2MDk1NS4x
NjU5NTI0LTEtamFzb24tamgubGluQG1lZGlhdGVrLmNvbS8NCg0KVGhhbmtzIQ0KDQpSZWdhcmRz
LA0KSmFzb24tSkggTGluDQoNCj4gTmljb2xhcw0K

