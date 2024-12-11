Return-Path: <linux-media+bounces-23152-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A13A9EC3B2
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 04:48:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA9FD285ED9
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 03:48:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39FAF211273;
	Wed, 11 Dec 2024 03:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="T8COcB+a";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="UjjfMj7Y"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BB211CAF;
	Wed, 11 Dec 2024 03:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733888802; cv=fail; b=saoOa+kXtvUnpudPHx4qXIOn0TxXZQnPMXA5rvdGAuAh23jL3mloF4YPjYGK7P+LAr1XarJ2Maoq8jwZqCj3o03aHYBNORgX1axVUfFLHsk35cVy60ZYTaxp4OqiIQGSy76xogdJCEqrKE4/R4boKxkBiTvdabLj99PPywPw2bw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733888802; c=relaxed/simple;
	bh=hW8ujvq9nyEJdauGKaQ6t0KcWmDqxSa7gXQ8ChnhsvY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bDS4xnDJ7QdCBtByqPAsb09QhonoAdcXy2hiWq4sPgFnqtqTh5TXsmwXI30sJsaXGeAEETspX4uuKdgjPgYKPbus5Fi5ABk2/I/PuSy0OocvrSZnhONpcI+gh19bwRf3nZz1t6UL/KQayehoMYRmtBF7vXyvoVbARh+As66/rlI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=T8COcB+a; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=UjjfMj7Y; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 82dbe14ab77211ef99858b75a2457dd9-20241211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=hW8ujvq9nyEJdauGKaQ6t0KcWmDqxSa7gXQ8ChnhsvY=;
	b=T8COcB+aAEar58R+NC4wJdAUIoZlSom9ibQt1Nbycx8NC5DiTCTsg5ShTIuaFKAz2+2LT5k53NRLctDLSBU1HGNlic8zvotSwZpV1m34wgw2P3Lk+gTjUD72o1iZu3eEVerKDPqrgp0TIxDBVcjf0F2BRKdsZLaP4+gIlnxqStw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:26767554-1036-45e7-9c54-4067afd57397,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:551f5208-686e-4b1e-a5b6-b56fe99a6d8f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 82dbe14ab77211ef99858b75a2457dd9-20241211
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2036756887; Wed, 11 Dec 2024 11:46:32 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 11 Dec 2024 11:46:31 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 11 Dec 2024 11:46:31 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HvDr1eTI7jeKVDsPjV+NThUyHFMlvc1oHNR8RLYcYd80inRa5rzBKEDbGOQ1nKEG5ayoWFa3bl/L57VsUg++yAA+xGQXB5IknA4LZT2bUUbdT/XLg3r5xegRKLBSPPBfno47NFJzlpNnnUreL1qqZW/HTSDAcXC0Zz8hAnWHkkv1wGK/LoXDV1emoCP7LDtzWPuJSyxO87CCN1lViJ9AvLF93UPP1AqOy4UQ9MEXPDhOreI+9KSis9qS24IXxmlXu0v++vbU02hK3M3fukAEI57UvW7cPCFch4+iMVt8rYJCICTppnX4EI9WRAPHu48S4Bz1/fdwVBYDLcwDdUjslQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hW8ujvq9nyEJdauGKaQ6t0KcWmDqxSa7gXQ8ChnhsvY=;
 b=u169NJVO9Okpbq5jbTvhkxhi+Ri1fg2rvZ1ACgJwK737W3h4Ohe29y9eiWrxGpAxUzHIGXbOE7+S5DqiRjUhwgyb4TfW3g5fWn0e7v5pIeQVa6lHDB/N4AzW556TFGi5eUvsfA37Af9fiz3i29P7wWI0ue361wN5qX8zc1mTHFXa8hI8+UFd2kWSGvtTTLwiy+YqBhGJvP2844zGhFmXf1t5uA8nSLLBpeVuFq9C1PQf4/Vzakvva3hrXCQU8nhZR26KouT/6cJgSm7sG18TeORuGzQVcaWWT61I/Hf8M3r5c7e+6AOyiaRho2NGRKqIl5D8PIEff8aml64DUD+CbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hW8ujvq9nyEJdauGKaQ6t0KcWmDqxSa7gXQ8ChnhsvY=;
 b=UjjfMj7YxOLr7DqVC2jbAFjAD8r0yuyiDRFXIve7hbug5F5FCOjtz6fGJTtS16HwsGRRhh8tTB35Sqh4OoVQX2Sq8+KwAjkik+A3UiVygNbjdrx3zG7Im0dSMijtMnViRiI6Q3c2NJUMRqs8zM4fyFDWpYVfJGjV6TKzGGfuvOI=
Received: from SEYPR03MB6626.apcprd03.prod.outlook.com (2603:1096:101:83::7)
 by SEZPR03MB6913.apcprd03.prod.outlook.com (2603:1096:101:a4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.12; Wed, 11 Dec
 2024 03:46:26 +0000
Received: from SEYPR03MB6626.apcprd03.prod.outlook.com
 ([fe80::9fa0:ee98:d5ed:beba]) by SEYPR03MB6626.apcprd03.prod.outlook.com
 ([fe80::9fa0:ee98:d5ed:beba%5]) with mapi id 15.20.8230.010; Wed, 11 Dec 2024
 03:46:26 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>, "robh@kernel.org"
	<robh@kernel.org>, =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?=
	<Jason-JH.Lin@mediatek.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	"simona@ffwll.ch" <simona@ffwll.ch>, =?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?=
	<Moudy.Ho@mediatek.com>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "airlied@gmail.com" <airlied@gmail.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	=?utf-8?B?WGF2aWVyIENoYW5nICjlvLXnjbvmlocp?= <Xavier.Chang@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: Re: [PATCH v2 7/8] drm/mediatek: Add programming flow for unsupported
 subsys ID hardware
Thread-Topic: [PATCH v2 7/8] drm/mediatek: Add programming flow for
 unsupported subsys ID hardware
Thread-Index: AQHbS3w6tqpwRTdGjUKWb1hyrDVA0LLgZ4iA
Date: Wed, 11 Dec 2024 03:46:26 +0000
Message-ID: <761ef6ecfe8298f945e6627aff29f864fcf7b9c0.camel@mediatek.com>
References: <20241211032256.28494-1-jason-jh.lin@mediatek.com>
	 <20241211032256.28494-8-jason-jh.lin@mediatek.com>
In-Reply-To: <20241211032256.28494-8-jason-jh.lin@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB6626:EE_|SEZPR03MB6913:EE_
x-ms-office365-filtering-correlation-id: 9a24499d-e251-4d6e-d6e3-08dd19966378
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?eURLOFIyOEhoZWE4MDc1V3FXdFY0WG0yTmw2a1ZuZHJlcCtRK01JR3BaQ3dD?=
 =?utf-8?B?VEQ1R2pwa1JuZ044OERxN01OUXYrZ0pCSk5vYi8xOVQ0REpHWjBmUTNqT3FX?=
 =?utf-8?B?NlRYcnZudTJGbUxDUS9yZ2dPSGI1V2IvV3BoTjN2ZzF2czZzNkRXTG9xTnpI?=
 =?utf-8?B?ek1ncTc4d0NxTmRUZ29sc1RxeFdQQnNpVmxSZkx6QkVFek9QZ1U1NGwxV0pn?=
 =?utf-8?B?Y0RNSjVPLzk2YUV1b2RFWVdmZytIV0VTdFZ3ODVmemlkN01qMGU5a0xVdytS?=
 =?utf-8?B?cnBBVHhGMkNqeGJ3a0J1SmFybHZ6UmZjNE1FOVlsYUxtRCtkMWVRLzhOZlQ3?=
 =?utf-8?B?a3NscXQwR0VsZHRqN0I5RXp5NHdEYXkwMDVabVBLOUdtN0RTSGtxNXRtR3p0?=
 =?utf-8?B?dEcwdFp2QjRYcDYyTXI1WkZTZUhhc0MzZmtXazBjSnJTdUoxd1I0WFN4c045?=
 =?utf-8?B?TW9Za1E3N0piNUJET0xxaEp0VXZrSWwyVVk3aGxuNXVTVGdiM2V3V3pGMzNX?=
 =?utf-8?B?ZEZTS09DTlJnNWdtaEo3R2RNKzVSNjJZNTdzS3pqWTFpZzRXS3crSmJGdVpL?=
 =?utf-8?B?WnB0bVhZNGw3KzFMZ0dpKzBQS1hFbUl5MzlCYjRSN3JKd29TdWwrQU1pcTBX?=
 =?utf-8?B?U0d0ODZDcXV4c2FTQnlZZlF4bDZmZmdOS0NTTHFCMHBCN04zUkhBbzFmdDZl?=
 =?utf-8?B?eEI0SWlYYzdZY1ZzMW9PYlVLRUNnQ0xRSFBDWVZJOFBncmdKWC84SUROZGVS?=
 =?utf-8?B?bVZEUDhERDVXaXFZV3ZTU3d6cDU2cUtIUnNuOFdKdHE4enh2NDVpS0U2d0lM?=
 =?utf-8?B?VmYwb2l3SnhQQnhXS1RTZlpMZW5oRzFNUEdYVmk5NDhMMlZvcUxkTFJEa2Rz?=
 =?utf-8?B?SzM4cXdibmhpR0FOVjhZQ1JFVlNQS2pROWZNQnBlTlcxZWJkZnk3OGlZMTVE?=
 =?utf-8?B?aVVqZmZubEZTTmRjVWh5bENkVENoT3NqcGI1bG9PUnB3QmxEekdOOVV2UzVS?=
 =?utf-8?B?ckJTZnNsbGdHeFBaTnFNK3JXVWd2eGV5dm8vZzkwVE44VlB1czE5czFIVXd2?=
 =?utf-8?B?b0dZMUJjV0xLMnRnaE0wdEgvM0xNelVZamIzNm1JWlBXRFI4L0lrVURZQkl6?=
 =?utf-8?B?TUhmczZ1dVI0SjNVelNoR0ZQR1ZZdWFWK2wrd1pqUjVuREo3b1ZMbEJBSmtJ?=
 =?utf-8?B?N21kb2x4Nld3VE1CY3Iwcko2eTFVaCsrZWM1YWc5ZExIc2ZkOUlIWlA4T09t?=
 =?utf-8?B?bnRqUnFpL3dSMTlPU2s4bHNPNnhyR2p1OGRIQ2RvR09ZN1RQNEU3TFQzdnRK?=
 =?utf-8?B?R3lkOVRkRmZ0R1l1UVhpMlhjUGovQWwrT0RoWHoySWJYWkJ6emYvVHVWdUxM?=
 =?utf-8?B?SDRpengrY2JVOGh4aGdxNVZHQ0czZzNpamFsVnRNZGFCUkpCS0lTOHpDU3RX?=
 =?utf-8?B?N2Fhb0o4Z21pYUZGNlBuekt2QlBIMWdRQTE2eldzRTFrZVFqV2hsRVl6dlZK?=
 =?utf-8?B?VDhQMlVvZmVoaXdGMUg4YVpGaTJmUmFYR0xDRkQvNlhiZVVISmV6U2JDNFAy?=
 =?utf-8?B?Z2F2SElIb1VSWHpEd0RXcC81UmFmeUdVVmFUMFZwdVkreGNCVFBSSG5lSXU3?=
 =?utf-8?B?VGkxRk42UTZ3QXIxMXB2MW4yRVJEMFhsU0FiMnJIMmFyTytPbVJGcGlna0VX?=
 =?utf-8?B?WU9odURTOW5CeHdGV3lGRVFOVGR6K3JaNzAxK0ZwbkpLVGhYNlpKclJhaC9s?=
 =?utf-8?B?SThmeVBGWm15dDUxZmRGWWtZZllKakl6dXYwaHQ0cU1vTGFNbVg1aXNXZ1hq?=
 =?utf-8?B?VUdrVU5INGRUYXkxdThlOTBvdnRLbGNQRDJiQjgrTjVIRU92ZHgvL09EQU9h?=
 =?utf-8?B?SFFyY0V3eDhNNjQvTkpjcDV5WWxDU0dRR2M3Zy9YTXBwL3c9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB6626.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NFIrdng1Ym93Nk1Ya2RpR0NvSEMrRTBEazNtMU81UEJHSW9uN3pmeG5PQ3BK?=
 =?utf-8?B?TDVKSUtwMW4wK3NhdnFHdTJMdExqcWJxSXRKbDM3Mkp5OXFqcW9RYXRmWTZV?=
 =?utf-8?B?MXJGZFNUQy9wWDhwZVUvOWJBRU9xQUJTaGJTRFlTY3N6N1VqMUFCKysyTnFn?=
 =?utf-8?B?aHFtckM4MFIvbmoySUxmMmIyaVhOWU4xQ2tzdGp2dDhRVWNlT2ZSUHlZcEFu?=
 =?utf-8?B?UzZ6T3hqblRZNjVZVndmaGEzc1hLZk56SVBCdm9oVEthZk9LVmNabEdNS3Q5?=
 =?utf-8?B?S2l4anVPYkVuMDg5K2NRYnBpZGRYUGYyTzRheHNoR2dweTZ2aE1FZUlLRFpP?=
 =?utf-8?B?RWpybmZodU5CUVdabSthWWZzU0IwVDgycVVCNCs1NXBDdGtBOGQwTUpNYVNX?=
 =?utf-8?B?WFduYW1ndWVwQXBCblNzSGlBWkx2WThrRkVoSTRMdjM4ODdxSnRhUVZDNFhL?=
 =?utf-8?B?QmZxQVQvTU84c3hDOWVRNmZSRTlKbUFYeGlsK3pCZXdBWG5OZnJVRGtsNUIz?=
 =?utf-8?B?TEZhbG80Y3VGai9wb01XNHhwMnhRK0p0K0thdERFU0hqUFNhbGJIL1NqQU80?=
 =?utf-8?B?TVNGNHExS1lZb2xONWdSN2NuVDk3QWxMMEIrT3FoMGc1ZlpURVVsYnVYc211?=
 =?utf-8?B?L0lIVFlyV3FGNjQ2WkhORldwRXkyaGN4bFBnUDNMWDNIODRkNDdONmZkN1Qv?=
 =?utf-8?B?ZDNzcDdHSVJJVHc2MEFiNkZIRmViS0FCMGJ2aSttMlM3YXNsanhZU0xkMW1Y?=
 =?utf-8?B?Nk01NmxCcm50Y0ZtL3JsVmlBYUphQVRPbGJDbnFMWWhuZzV1OGxpYXgzbEg1?=
 =?utf-8?B?Q1o5QkJrU010REVRRFFCUHFFbG5IZThXMkxraVlZUytaWHZBRWJqVlArUWIr?=
 =?utf-8?B?V1JpSG9lbWdxT3B0eDZHN0NLdkxORkxSVHZyK1hQUFYzSm9PU1FDWmlidjhO?=
 =?utf-8?B?Zk5MczRGNVZRNmtKMVY0SXhoOEQvbGNlOXprV25LL29RNGNwbDlsOEtTc1Fr?=
 =?utf-8?B?bTY1bHQrN2ZwNWdSejZnZlh1QXdxNk5GUGxWSlpKQktXNkhJQXoyYjFnTDR1?=
 =?utf-8?B?R3FwOExIa285QlRzK3ROYloyNFgvTTQvUlBweWE0aVZrOWpEVEloQnlMUkha?=
 =?utf-8?B?bmN0VGZ1OVhMREdCR1B0TmpLc1JvNTRwdDlkOFFHYmIyY2dmdWh4VlQ4VWtG?=
 =?utf-8?B?bkJxUTkxM0dlMDRPa3hNZHM4ZFRBZDNVTHdpbVBtSlQxYjJqcEppK2pmc1A3?=
 =?utf-8?B?QXBnQVNEdXRIeTFMOFl3U2FIUEV3S1crazhmOUJma0NxaGpVYmxvUlhoOXh0?=
 =?utf-8?B?Rkxwa3o0UGRZbWtxWnU4dnErUE1mQUZyMUlLeUxGZUxQblNlRWxhdEIzN0J1?=
 =?utf-8?B?Y3NGY0xuL3NuRC8yVkF1VHZGZGpwSlZUdWJOVERYTGsyamhnNkpFeFJvY3R1?=
 =?utf-8?B?WFpHTFkvc05teE1MUFRld21rdmRveFc5YUhOdHFicVFzQ1grZUZ5Zk9CSlZ6?=
 =?utf-8?B?cnkxNXh1dklvSEdHNlphbVQrblQyenphR042dzB5WW9lVWJnZXNlTU5aLzFi?=
 =?utf-8?B?UHo3bHdMUWRMNE4zZzdtclhsZ2VPZ2ZEdlNaKzBNVkFVSW1BRnJER2pKbWNK?=
 =?utf-8?B?SVM5S294c2hCTmt5WGlKbXc0VUt4ZzJRNlZRU3NFenJNRGRrQ1JWY21VWlRL?=
 =?utf-8?B?ekpiOTFkTGQ5THoxMU1RYUNyVytsL1hCMzYrTGFMcmtsY0huVWNRemt6eGVO?=
 =?utf-8?B?bmZQN0tmcXUxelNlYkVWeFIxOVU3Q3ZkUG53d2NQaUpJL2EwOTZoejlVZjdj?=
 =?utf-8?B?TzBMOUhnd2RwdTVCdytSOUNES1N2Rk92MXVvOTZpaDEzU1lQWXV5WXlGclZN?=
 =?utf-8?B?QkNXWDlxM3FCOWI5NlRQRUtMemovNjFXaVF6bmxmN0xEZmVDd1lweHNsQitq?=
 =?utf-8?B?cXZpc2xObVVIa09xVGl4enhqbkRub09FdUxGUjRuTGV0VzloaTl2YUNWaVVU?=
 =?utf-8?B?SzdwZkJWZ3pRMDZOOFpSZ3lTeGV3aktIRThTcW1hRHRWVjZCWVFhcWhNbmZX?=
 =?utf-8?B?VzFFaXpkdlptaitvTWc3ZjFkdjA3QUhBRzJkOXcxM2FjVmVmMEhvWUdSWDdw?=
 =?utf-8?B?N2tyYlVUQ210R2lmTXhodFR5bDFHZG0zUzBidkszaTRhOTdGQkgyWWt4OURO?=
 =?utf-8?B?bnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1781F569F93BA04FBB2EF565A93DD657@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB6626.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a24499d-e251-4d6e-d6e3-08dd19966378
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2024 03:46:26.0624
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uZ9jIX99wE55sJZx4W78o3OykerdR1KvyY5thD1B0dhR3v5+IsP5nN8e6hu2syM3A+MQmDRVlqoSG3e2IfCHGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB6913

SGksIEphc29uOg0KDQpPbiBXZWQsIDIwMjQtMTItMTEgYXQgMTE6MjIgKzA4MDAsIEphc29uLUpI
LkxpbiB3cm90ZToNCj4gVG8gc3VwcG9ydCBoYXJkd2FyZSB3aXRob3V0IHN1YnN5cyBJRHMgb24g
bmV3IFNvQ3MsIGFkZCBhIHByb2dyYW1taW5nDQo+IGZsb3cgdGhhdCBjaGVja3Mgd2hldGhlciB0
aGUgc3Vic3lzIElEIGlzIHZhbGlkLiBJZiB0aGUgc3Vic3lzIElEIGlzDQo+IGludmFsaWQsIHRo
ZSBmbG93IHdpbGwgY2FsbCAyIGFsdGVybmF0aXZlIENNRFEgQVBJczoNCj4gY21kcV9wa3RfYXNz
aWduKCkgYW5kIGNtZHFfcGt0X3dyaXRlX3NfdmFsdWUoKSB0byBhY2hpZXZlIHRoZSBzYW1lDQo+
IGZ1bmN0aW9uYWxpdHkuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKYXNvbi1KSC5MaW4gPGphc29u
LWpoLmxpbkBtZWRpYXRlay5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kZHBfY29tcC5jIHwgMzQgKysrKysrKysrKysrKysrKysrKystLS0tLQ0KPiAgMSBmaWxl
IGNoYW5nZWQsIDI4IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kZHBfY29tcC5jIGIvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kZHBfY29tcC5jDQo+IGluZGV4IGVkYzY0MTc2MzllNi4uMDc5
MmM4OTU1MjZmIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rk
cF9jb21wLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kZHBfY29tcC5j
DQo+IEBAIC02NiwxNCArNjYsMzggQEAgc3RydWN0IG10a19kZHBfY29tcF9kZXYgew0KPiAgCXN0
cnVjdCBjbWRxX2NsaWVudF9yZWcgY21kcV9yZWc7DQo+ICB9Ow0KPiAgDQo+ICsjaWYgSVNfUkVB
Q0hBQkxFKENPTkZJR19NVEtfQ01EUSkNCj4gK3N0YXRpYyB2b2lkIG10a19kZHBfd3JpdGVfY21k
cV9wa3Qoc3RydWN0IGNtZHFfcGt0ICpjbWRxX3BrdCwgc3RydWN0IGNtZHFfY2xpZW50X3JlZyAq
Y21kcV9yZWcsDQo+ICsJCQkJICAgdW5zaWduZWQgaW50IG9mZnNldCwgdW5zaWduZWQgaW50IHZh
bHVlLCB1bnNpZ25lZCBpbnQgbWFzaykNCg0KRHJvcCB0aGlzIGZ1bmN0aW9uLg0KDQo+ICt7DQo+
ICsJc3RydWN0IGNtZHFfY2xpZW50ICpjbCA9IChzdHJ1Y3QgY21kcV9jbGllbnQgKiljbWRxX3Br
dC0+Y2w7DQo+ICsNCj4gKwlvZmZzZXQgKz0gY21kcV9yZWctPm9mZnNldDsNCj4gKw0KPiArCWlm
IChjbWRxX3N1YnN5c19pc192YWxpZChjbC0+Y2hhbiwgY21kcV9yZWctPnN1YnN5cykpIHsNCj4g
KwkJaWYgKG1hc2sgPT0gR0VOTUFTSygzMSwgMCkpDQo+ICsJCQljbWRxX3BrdF93cml0ZShjbWRx
X3BrdCwgY21kcV9yZWctPnN1YnN5cywgb2Zmc2V0LCB2YWx1ZSk7DQo+ICsJCWVsc2UNCj4gKwkJ
CWNtZHFfcGt0X3dyaXRlX21hc2soY21kcV9wa3QsIGNtZHFfcmVnLT5zdWJzeXMsIG9mZnNldCwg
dmFsdWUsIG1hc2spOw0KPiArCX0gZWxzZSB7DQo+ICsJCS8qIG9ubHkgTU1JTyBhY2Nlc3MsIG5v
IG5lZWQgdG8gY2hlY2sgbW1pbmZyb19vZmZzZXQgKi8NCj4gKwkJY21kcV9wa3RfYXNzaWduKGNt
ZHFfcGt0LCAwLCBDTURRX0FERFJfSElHSChjbWRxX3JlZy0+cGFfYmFzZSkpOw0KPiArCQlpZiAo
bWFzayA9PSBHRU5NQVNLKDMxLCAwKSkNCj4gKwkJCWNtZHFfcGt0X3dyaXRlX3NfdmFsdWUoY21k
cV9wa3QsIDAsIENNRFFfQUREUl9MT1cob2Zmc2V0KSwgdmFsdWUpOw0KPiArCQllbHNlDQo+ICsJ
CQljbWRxX3BrdF93cml0ZV9zX21hc2tfdmFsdWUoY21kcV9wa3QsIDAsIENNRFFfQUREUl9MT1co
b2Zmc2V0KSwNCj4gKwkJCQkJCSAgICB2YWx1ZSwgbWFzayk7DQo+ICsJfQ0KPiArfQ0KPiArI2Vu
ZGlmDQo+ICsNCj4gIHZvaWQgbXRrX2RkcF93cml0ZShzdHJ1Y3QgY21kcV9wa3QgKmNtZHFfcGt0
LCB1bnNpZ25lZCBpbnQgdmFsdWUsDQo+ICAJCSAgIHN0cnVjdCBjbWRxX2NsaWVudF9yZWcgKmNt
ZHFfcmVnLCB2b2lkIF9faW9tZW0gKnJlZ3MsDQo+ICAJCSAgIHVuc2lnbmVkIGludCBvZmZzZXQp
DQo+ICB7DQo+ICAjaWYgSVNfUkVBQ0hBQkxFKENPTkZJR19NVEtfQ01EUSkNCj4gIAlpZiAoY21k
cV9wa3QpDQo+IC0JCWNtZHFfcGt0X3dyaXRlKGNtZHFfcGt0LCBjbWRxX3JlZy0+c3Vic3lzLA0K
PiAtCQkJICAgICAgIGNtZHFfcmVnLT5vZmZzZXQgKyBvZmZzZXQsIHZhbHVlKTsNCj4gKwkJbXRr
X2RkcF93cml0ZV9jbWRxX3BrdChjbWRxX3BrdCwgY21kcV9yZWcsIG9mZnNldCwgdmFsdWUsIEdF
Tk1BU0soMzEsIDApKTsNCg0KLyogb25seSBNTUlPIGFjY2Vzcywgbm8gbmVlZCB0byBjaGVjayBt
bWluZnJvX29mZnNldCAqLw0KY21kcV9wa3RfYXNzaWduKGNtZHFfcGt0LCBDTURRX1hYWFJFR18w
LCBDTURRX0FERFJfSElHSChjbWRxX3JlZy0+cGFfYmFzZSkpOw0KY21kcV9wa3Rfd3JpdGVfc192
YWx1ZShjbWRxX3BrdCwgQ01EUV9YWFhSRUdfMCwgQ01EUV9BRERSX0xPVyhvZmZzZXQpLCB2YWx1
ZSk7DQoNCj4gIAllbHNlDQo+ICAjZW5kaWYNCj4gIAkJd3JpdGVsKHZhbHVlLCByZWdzICsgb2Zm
c2V0KTsNCj4gQEAgLTg1LDggKzEwOSw3IEBAIHZvaWQgbXRrX2RkcF93cml0ZV9yZWxheGVkKHN0
cnVjdCBjbWRxX3BrdCAqY21kcV9wa3QsIHVuc2lnbmVkIGludCB2YWx1ZSwNCj4gIHsNCj4gICNp
ZiBJU19SRUFDSEFCTEUoQ09ORklHX01US19DTURRKQ0KPiAgCWlmIChjbWRxX3BrdCkNCj4gLQkJ
Y21kcV9wa3Rfd3JpdGUoY21kcV9wa3QsIGNtZHFfcmVnLT5zdWJzeXMsDQo+IC0JCQkgICAgICAg
Y21kcV9yZWctPm9mZnNldCArIG9mZnNldCwgdmFsdWUpOw0KPiArCQltdGtfZGRwX3dyaXRlX2Nt
ZHFfcGt0KGNtZHFfcGt0LCBjbWRxX3JlZywgb2Zmc2V0LCB2YWx1ZSwgR0VOTUFTSygzMSwgMCkp
Ow0KDQovKiBvbmx5IE1NSU8gYWNjZXNzLCBubyBuZWVkIHRvIGNoZWNrIG1taW5mcm9fb2Zmc2V0
ICovDQpjbWRxX3BrdF9hc3NpZ24oY21kcV9wa3QsIENNRFFfWFhYUkVHXzAsIENNRFFfQUREUl9I
SUdIKGNtZHFfcmVnLT5wYV9iYXNlKSk7DQpjbWRxX3BrdF93cml0ZV9zX3ZhbHVlKGNtZHFfcGt0
LCBDTURRX1hYWFJFR18wLCBDTURRX0FERFJfTE9XKG9mZnNldCksIHZhbHVlKTsNCg0KPiAgCWVs
c2UNCj4gICNlbmRpZg0KPiAgCQl3cml0ZWxfcmVsYXhlZCh2YWx1ZSwgcmVncyArIG9mZnNldCk7
DQo+IEBAIC05OCw4ICsxMjEsNyBAQCB2b2lkIG10a19kZHBfd3JpdGVfbWFzayhzdHJ1Y3QgY21k
cV9wa3QgKmNtZHFfcGt0LCB1bnNpZ25lZCBpbnQgdmFsdWUsDQo+ICB7DQo+ICAjaWYgSVNfUkVB
Q0hBQkxFKENPTkZJR19NVEtfQ01EUSkNCj4gIAlpZiAoY21kcV9wa3QpIHsNCj4gLQkJY21kcV9w
a3Rfd3JpdGVfbWFzayhjbWRxX3BrdCwgY21kcV9yZWctPnN1YnN5cywNCj4gLQkJCQkgICAgY21k
cV9yZWctPm9mZnNldCArIG9mZnNldCwgdmFsdWUsIG1hc2spOw0KPiArCQltdGtfZGRwX3dyaXRl
X2NtZHFfcGt0KGNtZHFfcGt0LCBjbWRxX3JlZywgb2Zmc2V0LCB2YWx1ZSwgbWFzayk7DQoNCi8q
IG9ubHkgTU1JTyBhY2Nlc3MsIG5vIG5lZWQgdG8gY2hlY2sgbW1pbmZyb19vZmZzZXQgKi8NCmNt
ZHFfcGt0X2Fzc2lnbihjbWRxX3BrdCwgQ01EUV9YWFhSRUdfMCwgQ01EUV9BRERSX0hJR0goY21k
cV9yZWctPnBhX2Jhc2UpKTsNCmNtZHFfcGt0X3dyaXRlX3NfbWFza192YWx1ZShjbWRxX3BrdCwg
Q01EUV9YWFhSRUdfMCwgQ01EUV9BRERSX0xPVyhvZmZzZXQpLA0KCQkJICAgIHZhbHVlLCBtYXNr
KTsNCg0KQ01EUV9YWFhSRUdfMCBpcyBkZWZpbmVkIGluIGNtZHEgaGVhZGVyIGZpbGUuDQoNClJl
Z2FyZHMsDQpDSw0KDQo+ICAJfSBlbHNlIHsNCj4gICNlbmRpZg0KPiAgCQl1MzIgdG1wID0gcmVh
ZGwocmVncyArIG9mZnNldCk7DQoNCg==

