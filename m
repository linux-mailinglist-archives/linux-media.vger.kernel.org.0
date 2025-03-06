Return-Path: <linux-media+bounces-27697-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5260A548B5
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 12:05:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA7533A95AA
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 11:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 160DF2045BC;
	Thu,  6 Mar 2025 11:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="aIHN1S2g";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="Gg8/CaSH"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB6A2E339F;
	Thu,  6 Mar 2025 11:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741259136; cv=fail; b=MKXsfc3v+vJYFYtDr1Eu6DRY+mZFauf6BZOT+Op0GFNGoyyZ4JXWsU0EoYkepiXjspdTwXjcL5CZDTnZ2YarHw6m1yvwG9KHah9ObrE718oOz0yE14S4Mt8w/i9AgkRsQA62XZHIg/jSZjCW2j7QUx+CeGNHbd7Knmf08uL5MzI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741259136; c=relaxed/simple;
	bh=Y0Hk6kHPE/88Qf8nylLUrz+9Eqpbj/Mt4V8JRuBC0+s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iYlrmpyakVURFTKAW+L/Ky8XifzF1O36MbX5EhnO9RMl6BWP31mJf95HjfnYlvNHLwBRyAw0/1vAbORRNHfVpGUKrOCJcFrsMZc85YboGYawDbE4KOiHUnZ7rklSvzI/gE57CvoObSUxHNJ4eX33RCqou0wcM4vbAPsMmF1fGXg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=aIHN1S2g; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=Gg8/CaSH; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: e9280280fa7a11efaae1fd9735fae912-20250306
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=Y0Hk6kHPE/88Qf8nylLUrz+9Eqpbj/Mt4V8JRuBC0+s=;
	b=aIHN1S2gMSA2Hgw+W6xjXgPmcyRZ11lwirHUJ6X817lIoyfSOzj0TzYdBaFKmvssUOTB5znvJnj13nuEJF1sVWXffrK5+CYsqE1cmjL9+wlEH/dSGClgO4HERXFj1c2aNAby7kwSQORyUxEc1eZFBfu9zCNI+cn/E27tmtHo+GU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:485c7fd9-300c-4641-8d1f-189546bb675b,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:fff4ffc5-16da-468a-87f7-8ca8d6b3b9f7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: e9280280fa7a11efaae1fd9735fae912-20250306
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1252523970; Thu, 06 Mar 2025 19:05:27 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Thu, 6 Mar 2025 19:05:26 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Thu, 6 Mar 2025 19:05:26 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dDqDD5BF47M3E19ptKNBFOxjEaXO2rsLf89IRYXBr2T8XwTXMeh+eGbNybvimz6l9tprvhQxqWc/a36RGNa4gsfVdWEb2Yg06u79JRTnukt9tiWg4mYkYKKxKb9LBNbP3xrPUVkVoSSMWBD4dsd4m/CjwyJd9qQh0eusvKsPOa0CmkEp6AE2pKlqbPfOn8I51oeuNQeVPkt3r5f2MFQK0cxOwn3PftuGVJ73xSC+64eSqKFivvtLDqEjbee1UMcec2K29xTINm35+M0aMqKJgmO3l4fFBo+iuGetluytW1v+pJrVI3G66M2FQmIU5s+S9Rm5UlTC/wRES/qLFG6ogg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y0Hk6kHPE/88Qf8nylLUrz+9Eqpbj/Mt4V8JRuBC0+s=;
 b=W+wDdkXLMRHuG+uODriPJfPTytD5JesmfngBZ6gCAV1UUwiTa+vFmDBEZDBFI5+saxJS2r7DFTuTwaxt6I/hbBbiaQzrP1T4V7xldf2czFrNFLP29vcImv5eR/Wi4NkL8L+K7Rnl338GzFDMCMzFaptsTFczzJkTTA1oWknas4jgzZ/CUxL/Xe6wk0zoSBEcU7/8G2Rnlr/+uxovQvqvxQkkK9n48mZ3yvofXPEjw7Ia9+ESsdyIykf8BTCC3PZwTRHjNFZsWrM5d2tO84oaHknuPLB+AbvdthhS6MUMfc7x+/pCfauO1Li7LkbBZD4LT65WrWA8VflQZGK2UrBJ2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y0Hk6kHPE/88Qf8nylLUrz+9Eqpbj/Mt4V8JRuBC0+s=;
 b=Gg8/CaSHFcbNLb1w4gK2wgsk7fC7tr6a1fcLdEopt0iIcZQNATTTESKSP+VYUtZAZrjJd8RGWEYJ9wotGpKelzSDUsSWgndF8sQFp81UE76d4/zCXmHD2h8o9gIbpifqo6+TSPZmusPyq+e+yaPfxMvDqNm/87mBp3GFhOucj2Q=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by JH0PR03MB7927.apcprd03.prod.outlook.com (2603:1096:990:34::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Thu, 6 Mar
 2025 11:05:22 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%3]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 11:05:22 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
	"jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	=?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	=?utf-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
	<Xiandong.Wang@mediatek.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	=?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"fshao@chromium.org" <fshao@chromium.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	=?utf-8?B?WGF2aWVyIENoYW5nICjlvLXnjbvmlocp?= <Xavier.Chang@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "treapking@chromium.org"
	<treapking@chromium.org>
Subject: Re: [PATCH v4 6/8] soc: mediatek: Add programming flow for
 unsupported subsys ID hardware
Thread-Topic: [PATCH v4 6/8] soc: mediatek: Add programming flow for
 unsupported subsys ID hardware
Thread-Index: AQHbgchAmC8ygt6ujEmjaToxU9ar8rNiz7WAgAH/jgCAACBEgIABHDaA
Date: Thu, 6 Mar 2025 11:05:22 +0000
Message-ID: <451d1b8a5aed46fd119c546f15fe00371f9546f3.camel@mediatek.com>
References: <20250218054405.2017918-1-jason-jh.lin@mediatek.com>
	 <20250218054405.2017918-7-jason-jh.lin@mediatek.com>
	 <c52b132b-fc08-4d1c-8276-1771f7457014@collabora.com>
	 <ddcf01c82f92ee461875e1122b009b7fca691127.camel@mediatek.com>
	 <d02b6bbe-0d32-4e3f-985e-a0b610f72d98@collabora.com>
In-Reply-To: <d02b6bbe-0d32-4e3f-985e-a0b610f72d98@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|JH0PR03MB7927:EE_
x-ms-office365-filtering-correlation-id: b070d1a8-0c2a-4898-be3d-08dd5c9eca16
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?aFdvcjdrblErcGFGa1RmNFlhb2FkM1JSeFNKY3dzZFBTR0tTbTE5SHQzb0JE?=
 =?utf-8?B?RDFBSHZ6aHFjRVBydEhBdTAvelRYbFNRaFRZTXRzOFZxM1FQUVhGckFabFRR?=
 =?utf-8?B?ZFhEK2E0QnRVVmZRNFkrOW5JRTVFOWxqY0RheUtIMGs0V0N4UmxrVGs2WUo1?=
 =?utf-8?B?dVFvNElMc2FtTCt1OW5RKy9ZZHVOZUtDdVBxOEZ0SVVpcEZ5QTBIandBZW5X?=
 =?utf-8?B?SWRjOFI0Z3kyV1pOcXV2TzExSzRoS3JSWC80dnZrbmIyTEg5NURONUZmS045?=
 =?utf-8?B?WXc1Z3JGcFpzWE02TVhaREFTMC9PRktPS3Y5MmlCRkdhTGlWTlRGU3BKekta?=
 =?utf-8?B?aEFCTXBxN1pRTTBqQzN4MGdQVGJWWXMrWWJ4cnJ0S1AycURnRDVObHpDejVV?=
 =?utf-8?B?elZtMjhOTnJsbC9EaG13Z1AyL0Via2kxcDFpMHpuczV0ckxVUWdnSlFDOEh2?=
 =?utf-8?B?b2M3ZTdhaUdYcmFoamdBNk56ZVJBSEFPQkN1UUNoaTkxdTRpVFRsVU02Qlcw?=
 =?utf-8?B?TWlDbkMrU3BiM2xWQXlmVGE4WU9ad093cll1RXNRR3g2TmozRUhPZndtWHpi?=
 =?utf-8?B?b0p3THNtY0huR3l3b1I5S0pTdHVDeEZQdTRuYlhtTlNCT2VRaWFBRjZrRC92?=
 =?utf-8?B?SXluRFlmUnpYUmR1a0xoUFBUVUFFQzkvSjhjLzBBMU9FNEprM2t4R2VpQjZD?=
 =?utf-8?B?aEo1QjZEa2VpQnlXZDJLeSt2SStUcXppNnZYbHJPeGJFNFAxbXRkS3FmbW0z?=
 =?utf-8?B?bjNBTHIzQmlUaHpsSVFyVm81OXNGaFFycDF4Z3dsRitXbkg2L3ZySEluWnRs?=
 =?utf-8?B?aVFDbG9yR2c4SlJXQUxoMVZva2wwTW9qOHVpMFRiTmw4VmhSVkRieGFBdDBh?=
 =?utf-8?B?R0ozNlBlSUFqZ1FuaitlU1FFWDJUVldWVUxkNTdxN21VekhaTGxZOU9oczBN?=
 =?utf-8?B?R3J3a2U1KytpTTNwbVFlV3FLcklEMXJLN0VGbXN0UnJUOVJqUnExWUFOeGl4?=
 =?utf-8?B?RDR4Tk5ObGRPa0lkaFFibHduSTdGZzRCYi9oL1JpRTBxY0NadXByRWtRVTdj?=
 =?utf-8?B?UEVOWmhCb1hjYzZjdFdpYWEveG9uYzdmZ25zdnRNTkVqdmd3QzFQWVBzK251?=
 =?utf-8?B?b0M1MW9OLzY0MmNWNk1CR01CTWNzcGhHNGNZK21UK3Ntc0F1ZU9zMUlzakZk?=
 =?utf-8?B?cWpvTTYyRDNGZTRrV3dpYnZ6VmFpaDhHUzhPVEp5RnpJdWdzMmRneFp5ZzQ3?=
 =?utf-8?B?YUNrYWN5OW5vWENlV0g0ejlISEVXTk05WVEyc1M4SFdhQVBwR1RpUkQ2UDd0?=
 =?utf-8?B?YXJCalVySXJLRW9DelpvcFkwejRWMW9nSWRYQWxRZ2EwTTd1eGJoMHBFZXY2?=
 =?utf-8?B?VlJzbUdRNDFJTEppTDhFbGR0Y05NZm84cHVheWpGM3RLcEJaWEE4NVIvL1Zh?=
 =?utf-8?B?a1Z4cmZCcTNOWkZIaUFoc2s0RkFTTHNsTUE1VXRNckN3Tk5pMFcwb2dvNnNH?=
 =?utf-8?B?Q1N1OGQwdFN1MFMvWXZUeW1hZExuK2RocU1JbEVWOUlPdTBrY3RhV0lFWEdn?=
 =?utf-8?B?NW4wck1PcFlDaFVrSkJ2TWx5aGVaaHd1ZS9wZ2R3L00wZ2w2KzM4N0cxNHJk?=
 =?utf-8?B?QjUwNkl4WitRVnB2L281Q25tY21xMm5wMUJyMFA3UlNkZkw4a3dzektrcFJi?=
 =?utf-8?B?dS92QkR6WXY0b01jQlhvY2xZSUcvOTdiQ3pTbjZaZ0kzWmdndGZINU5EV0ZQ?=
 =?utf-8?B?N3pwS1pkOHFoN0JTamZhbTFEdDBEMVpKL3l0ejdTeEZudzJmSU1QeDdNclYv?=
 =?utf-8?B?dm5VSnA5cmNQNWcyd2hROUd3d3F3NGxZcExsTFl0WUpqdUpIc3NGSWxheEk0?=
 =?utf-8?B?UWRXZUZJb05VZXlrbUVhNmpqRnF0bjVhZGxNT3FlajJYRDh2QURKM1JCUEJM?=
 =?utf-8?Q?MeLY9Y8uBc9DAffsgLqcYW7C+YDGbCSK?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7682.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NnVFM1NveVVxeWIrU1NURW00UndQZ1gxR1pVRlpmUzVuNEZOZEY5cDRKMUxy?=
 =?utf-8?B?U1B2L3JuTDFZWDZkdlY1eEhGNENlQXN1Y3JJK3p1UjQrVkhOYWJTSnNINlls?=
 =?utf-8?B?UWJtditTejlDeTNpd21nK3VrRitScWhXTzFEbVpPQ2FMZU5KbmVyNE9FSzU3?=
 =?utf-8?B?UVZSejFkMkdLWXF6TElnM3dkdlpYMUltbXRUSjVoNkxNZytocnFYL1JTaUxa?=
 =?utf-8?B?YzA3UTBCVmVUYWwrcE1JZkVSWlNtMjNIdkNBU1ZHRFMvL1pHQk4wRld4RFFx?=
 =?utf-8?B?YmFFZzd5cnBBL2o3Qm5WeXNZSTA1Z3BIZ0dkUy9VS1Z6eVFnM05qbEE1dnMy?=
 =?utf-8?B?SlNURjVOZVVjWWt1Z0w0a1JUcUNLNDhGaHZOTHBXdmxOQk1NK3g4dDZVWXE2?=
 =?utf-8?B?UEZleExSMy9wK3ZHay9RV1p6b01heUUzZmR4TzZUaHY1NTBaaUhUa2szbnRu?=
 =?utf-8?B?VXVvWitZQldwcC8wY3ZIS2xYdGFrT2JCYk9mVitnWDFXNTIxTXp3N3BTeE9h?=
 =?utf-8?B?amFwMkg3QkIrRHM1R21vZkp4YkZDcHNEQ1NJMnB6L1VmTDRjdjdBWXh1MVZR?=
 =?utf-8?B?TXN5WDRFbDFsZ2E2RlQ0VVJSZCtRMHN4R2luTzQ0S3JUaGIrU1NJN2xsQkp4?=
 =?utf-8?B?OGF2eVcxWklqeXg3VzZuVEhpd3JlYmxULy90Z2w4VWF4U09HbmJsUWZPaWtY?=
 =?utf-8?B?dW1tQ0ZYUUU1ZkFpSnAzd1J2MGVhNlNLSnpYSlUzSUkrWVZIRzlzT0NmV2NC?=
 =?utf-8?B?MlAvaWRTTm11Y2ZTclJyakhtZ2IzZ3RJVjZ5SExDTktzMzhURjlUa3BzWUp1?=
 =?utf-8?B?R3M4anliMnNsK3hGUnRXaWpnZzZnODdUeWt2bUVuTko1M3podkUva1hQN0V0?=
 =?utf-8?B?SFQ5ZTdOdnJGRkd6ZEtYSVlaWWMrRTJvQXlUb1d4RTg1SW9sMGR4M0dtN1J4?=
 =?utf-8?B?MCtuZ3B1NlZLcloyakcyTWM0R3I0b1BIQk5uRUNpVWd2cFRNN0M1SkR0N294?=
 =?utf-8?B?dHUwMmJEL3REU1ovZ1FzNGFDZGwralNIdzdzeGxNY3pvNWRqK2FJVEJrWUlT?=
 =?utf-8?B?N0h5ekJ5ZXM3eHorUWpQdmVyT2FGNElrYk9NWE1RODNtSzkzV2x5WHFHN1dI?=
 =?utf-8?B?eWJyR3JpcUUxdld1R1drVFE0MnlDWHdWN3VBL3Bta0lWV3BZNnZWZDJldXZG?=
 =?utf-8?B?emVjVFpnNy9kV3U3dXBrTmgzckV5SUZSQmFWOFdwMURsbXN6b1RGMXpLd05r?=
 =?utf-8?B?TFNaZE1UNnU1VTdKTWd1TTZsc2dTNTh5RGw1OWtvSndMd1BqSEtBbk05R0hw?=
 =?utf-8?B?K0gzRFN3a0dBcjJoVHhRNXRadCtxTjFUQVZUY2Q4SVZDQ0ZYVmZXQ25WdVc4?=
 =?utf-8?B?OG50TmRhNnJZWWxISnhRZE5VQXhyMG8rRmExektyWFdtMUpCd0w0L0NIZTd3?=
 =?utf-8?B?dFcrS2JkbGVYWWtqc1VOV1FiMCthbVBLbk42aHo5SWtUaVg1ZVBGQ3FKRUJo?=
 =?utf-8?B?azcvdldHVURGMTdzSE8vWStmUm03azAvQkF2ZlMvN1huUTcvTEpkTmQxUDhz?=
 =?utf-8?B?VlVCbjJhNU1zSmlBN24rU0tHTUVmWXpqUzdNRGVLTGZlY1U5K205TUJseUpj?=
 =?utf-8?B?ZWlOb2U5WnNIUHJyeStObHlKd0pqV1VsZ2NuRzluYmdSZEdOUnpZSTErenJl?=
 =?utf-8?B?NWdybTJMRHdIenZWNjBwbGQ2aDZEdFVQZTgzZCt1Wm00TWdvazlxYTJEZHdX?=
 =?utf-8?B?ZTV3Um5mcUlTaWpIenlWR1hrZUFRQjM2MWx5NEVqc2FqaFI1QmVySG14Ykxl?=
 =?utf-8?B?Z1FGTHU0M1RlTy9nY2N0ejZPcGtlMjRKVnNkVVltalRrNkNwem5OUEViZ21K?=
 =?utf-8?B?ZlZub3Rxbm1KbngzVVRoc1p6N3RNMnM4SmxLRnZiamhMSzhvVzdPTEpoMkVr?=
 =?utf-8?B?UTB1NDBhejhqT0NTcW5IUU5PbjlrTTRQV3dMSlRKbzQvRXV1dXF3cVhtWHNo?=
 =?utf-8?B?a2Z0RjVtU0ZxUjFpdlZKMHc3emJMM2YwaU1JY1Evc3RJeGRsMHdwTWdNTWRy?=
 =?utf-8?B?elFrRVZpVlNxdk5SY0R4ZFVBamFPWmJnZmNPSjQyTTBoV3pMNnBjdmtDZ0Zo?=
 =?utf-8?B?SUMzZzNzdUtLd1hlb1JZYWgyWE8xYXFMVGZlTVBGV3VubmZkT3YrSnVwMmw0?=
 =?utf-8?B?QlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B383795115BEA740814B37B3B356A10C@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b070d1a8-0c2a-4898-be3d-08dd5c9eca16
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2025 11:05:22.0935
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IsA88o7E3Y2SfrZftRWM/TH7pKRIinM5XJt4oYVSwtycamiWtDvW3yBffMo1QCHOTQBAWaC6TnO//GFsacX+gROM6wxW8OewDgMH2Hm0WeE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7927

T24gV2VkLCAyMDI1LTAzLTA1IGF0IDE5OjA4ICswMTAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBs
aW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBz
ZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+IA0KPiANCj4gSWwgMDUvMDMvMjUgMTc6MTIsIEphc29u
LUpIIExpbiAo5p6X552/56WlKSBoYSBzY3JpdHRvOg0KPiA+IE9uIFR1ZSwgMjAyNS0wMy0wNCBh
dCAxMDo0MSArMDEwMCwgQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8NCj4gPiB3cm90ZToNCj4g
PiA+IA0KPiA+ID4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9y
IG9wZW4gYXR0YWNobWVudHMNCj4gPiA+IHVudGlsDQo+ID4gPiB5b3UgaGF2ZSB2ZXJpZmllZCB0
aGUgc2VuZGVyIG9yIHRoZSBjb250ZW50Lg0KPiA+ID4gDQo+ID4gPiANCj4gPiA+IElsIDE4LzAy
LzI1IDA2OjQxLCBKYXNvbi1KSCBMaW4gaGEgc2NyaXR0bzoNCj4gPiA+ID4gVG8gc3VwcG9ydCBo
YXJkd2FyZSB3aXRob3V0IHN1YnN5cyBJRHMgb24gbmV3IFNvQ3MsIGFkZCBhDQo+ID4gPiA+IHBy
b2dyYW1taW5nDQo+ID4gPiA+IGZsb3cgdGhhdCBjaGVja3Mgd2hldGhlciB0aGUgc3Vic3lzIElE
IGlzIHZhbGlkLiBJZiB0aGUgc3Vic3lzDQo+ID4gPiA+IElEDQo+ID4gPiA+IGlzDQo+ID4gPiA+
IGludmFsaWQsIHRoZSBmbG93IHdpbGwgY2FsbCAyIGFsdGVybmF0aXZlIENNRFEgQVBJczoNCj4g
PiA+ID4gY21kcV9wa3RfYXNzaWduKCkgYW5kIGNtZHFfcGt0X3dyaXRlX3NfdmFsdWUoKSB0byBh
Y2hpZXZlIHRoZQ0KPiA+ID4gPiBzYW1lDQo+ID4gPiA+IGZ1bmN0aW9uYWxpdHkuDQo+ID4gPiA+
IA0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBKYXNvbi1KSCBMaW4gPGphc29uLWpoLmxpbkBtZWRp
YXRlay5jb20+DQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiDCoMKgIGRyaXZlcnMvc29jL21lZGlhdGVr
L210ay1tbXN5cy5jIHwgMTQgKysrKysrKysrKystLS0NCj4gPiA+ID4gwqDCoCBkcml2ZXJzL3Nv
Yy9tZWRpYXRlay9tdGstbXV0ZXguYyB8IDExICsrKysrKysrKy0tDQo+ID4gPiA+IMKgwqAgMiBm
aWxlcyBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0KPiA+ID4gPiAN
Cj4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc29jL21lZGlhdGVrL210ay1tbXN5cy5jDQo+
ID4gPiA+IGIvZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmMNCj4gPiA+ID4gaW5kZXgg
YmI0NjM5Y2EwYjhjLi5jZTk0OWI4NjNiMDUgMTAwNjQ0DQo+ID4gPiA+IC0tLSBhL2RyaXZlcnMv
c29jL21lZGlhdGVrL210ay1tbXN5cy5jDQo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvc29jL21lZGlh
dGVrL210ay1tbXN5cy5jDQo+ID4gPiA+IEBAIC0xNjcsOSArMTY3LDE3IEBAIHN0YXRpYyB2b2lk
IG10a19tbXN5c191cGRhdGVfYml0cyhzdHJ1Y3QNCj4gPiA+ID4gbXRrX21tc3lzICptbXN5cywg
dTMyIG9mZnNldCwgdTMyIG1hc2ssDQo+ID4gPiA+IMKgwqDCoMKgwqDCoCB1MzIgdG1wOw0KPiA+
ID4gPiANCj4gPiA+ID4gwqDCoMKgwqDCoMKgIGlmIChtbXN5cy0+Y21kcV9iYXNlLnNpemUgJiYg
Y21kcV9wa3QpIHsNCj4gPiA+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXQgPSBjbWRx
X3BrdF93cml0ZV9tYXNrKGNtZHFfcGt0LCBtbXN5cy0NCj4gPiA+ID4gPiBjbWRxX2Jhc2Uuc3Vi
c3lzLA0KPiA+ID4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtbXN5cy0+Y21kcV9iYXNlLm9mZnNl
dA0KPiA+ID4gPiArDQo+ID4gPiA+IG9mZnNldCwgdmFsLA0KPiA+ID4gPiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBtYXNrKTsNCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBvZmZzZXQg
Kz0gbW1zeXMtPmNtZHFfYmFzZS5vZmZzZXQ7DQo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgaWYgKG1tc3lzLT5jbWRxX2Jhc2Uuc3Vic3lzICE9DQo+ID4gPiA+IENNRFFfU1VCU1lT
X0lOVkFMSUQpIHsNCj4gPiA+IA0KPiA+ID4gWW91J3JlIHN0aWxsIGFueXdheSBwYXNzaW5nIHRo
ZSBzdWJzeXMgdG8gY21kcV9wa3Rfd3JpdGVfbWFzaygpLA0KPiA+ID4gcmlnaHQ/IQ0KPiA+ID4g
V2h5IGRvbid0IHlvdSBqdXN0IGhhbmRsZSB0aGlzIGluIGNtZHFfcGt0X3dyaXRlX21hc2soKSB0
aGVuPyA7LSkNCj4gPiA+IA0KPiA+ID4gSSBjYW4gc2VlIHRoaXMgcGF0dGVybiBiZWluZyByZXBl
YXRlZCBvdmVyIGFuZCBvdmVyIGluIGJvdGgNCj4gPiA+IGRybS9tZWRpYXRlayBhbmQgTURQMw0K
PiA+ID4gZHJpdmVycywgYW5kIGl0J3Mgbm90IG5lY2Vzc2FyeSB0byBkdXBsaWNhdGUgdGhpcyBt
YW55IHRpbWVzIHdoZW4NCj4gPiA+IHlvdQ0KPiA+ID4gY2FuIHdyaXRlIGl0DQo+ID4gPiBqdXN0
IG9uY2UuDQo+ID4gPiANCj4gPiA+IFdvdWxkJ3ZlIGFsc28gYmVlbiBmYXN0ZXIgZm9yIHlvdSB0
byBpbXBsZW1lbnQuLi4gOi1EDQo+ID4gPiANCj4gPiANCj4gPiBJIHRoaW5rIGRpZCBpdCBpbiB0
aGUgc2VyaWVzIFYxOg0KPiA+IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9s
aW51eC1tZWRpYXRlay9wYXRjaC8yMDI0MTEyMTA0MjYwMi4zMjczMC01LWphc29uLWpoLmxpbkBt
ZWRpYXRlay5jb20NCj4gPiANCj4gPiBCZWNhdXNlIGl0J2xsIG5lZWQgdG8gcGFzc2luZyB0aGUg
YmFzZV9wYSBhbmQgdGhhdCB3aWxsIG5lZWQgdG8NCj4gPiBjaGFuZ2UNCj4gPiB0aGUgaW50ZXJm
YWNlIGZvciBvcmlnaW5hbCBBUElzLg0KPiA+IA0KPiA+IEFuZCBDSyB0aGluayB0aGF0J3Mgbm90
IGEgbmVjZXNzYXJ5IHRvIGNoYW5nZSB0aGUgQVBJcy4gSXQgY2FuIGJlDQo+ID4gZG9uZQ0KPiA+
IGJ5IGNtZHFfcGt0X2Fzc2lnbigpICsgY21kcV9wa3Rfd3JpdGVfc19tYXNrX3ZhbHVlKCkgaW4g
dGhlIGNsaWVudA0KPiA+IGRyaXZlcnMuIFRoZW4geW91IGNhbiBzZWUgdGhpcyBwYXR0ZXJuIGlu
IGV2ZXJ5d2hlcmUuIDotKQ0KPiA+IA0KPiANCj4gVXNpbmcgbGlrZWx5KHgpIGFuZCB1bmxpa2Vs
eSh4KSBzaG91bGQgYmUgYXZvaWRlZCwgcmVhbGx5LCB1bmxlc3MNCj4gaXQncyBzb21ldGhpbmcN
Cj4gdGhhdCBpcyByZWFsbHkgcmVhbGx5IHJlYWxseSByZWFsbHkgLi4uIHJlYWxseSAuLi4gcmVh
Li4uLiBsaWtlbHkgb3INCj4gdW5saWtlbHkgOi0pDQo+IA0KPiBCdHcuIENoYW5naW5nIHRoZSBB
UElzIGlzIGEgYml0IGRpZmZpY3VsdCwgYnV0IEkgZGlzYWdyZWUgd2l0aCBDSw0KPiBhYm91dCBu
b3QNCj4gImludmVudGluZyIgYSBuZXcgQVBJIGZvciB0aGUgdW5zdXBwb3J0ZWQtc3Vic3lzIGZs
b3cuDQo+IA0KPiBJdCdzIHRydWUsIGl0IGlzIG5vdCAqc3RyaWN0bHkqIG5lZWRlZCB0byBhZGQg
YSBmdW5jdGlvbiwgYnV0IGl0J3MNCj4gZ29vZCBmb3IgYW55DQo+IGtpbmQgb2YgZnV0dXJlIG1h
aW50YWluYWJpbGl0eSAtIGFzIEkgZXhwbGFpbmVkLCBpdCdzIGVhc2llciB0aGVuIHRvDQo+IGZp
eCBhIHByb2JsZW0NCj4gaWYgdGhlcmUncyBvbmUuLi4uIGFuZCB3ZWxsLCBJIGNhbiBzZWUgdGhh
dCB5b3UgYWdyZWUgd2l0aCBtZSwNCj4gYmVjYXVzZSBlZmZlY3RpdmVseQ0KPiB5b3UgZGlkIGl0
IHRoZSBmaXJzdCB0aW1lIDotKQ0KPiANCj4gQ0sgbWVudGlvbmVkIHVzaW5nIGNtZHFfcGt0X3dy
aXRlKCkgKm9yKg0KPiBjbWRxX3BrdF9hc3NpZ253cml0ZS9jbWRxX3BrdF93cml0ZV9wYSgpDQo+
IChob3dldmVyIHlvdSB3YW5uYSBjYWxsIGl0LCBpdCdzIGZpbmUgZm9yIG1lKSwgaW4gZHJpdmVy
cyB0aGF0IGtub3cNCj4gdGhhdCB0aGVyZQ0KPiBhbHdheXMgaXMgb3IgdGhlcmUgYWx3YXlzIGlz
bid0IGEgc3Vic3lzIElEOiB0aGF0J3MgYSBnb29kDQo+IHN1Z2dlc3Rpb24sIGFzIHRoaXMgY2Fu
DQo+IGJlIGV2ZW50dWFsbHkgZG9uZSB3aXRoIGFzc2lnbmluZyBhIGZ1bmN0aW9uIHBvaW50ZXIs
IHNvLCBubw0KPiBjb25kaXRpb25hbHMgYXQgZWFjaA0KPiBvcGVyYXRpb24uDQo+IA0KPiBNeSBw
b2ludCBvZiB2aWV3LCBmaW5hbGx5LCBpczoNCj4gwqAgLSBUaGlzIGlzIGp1c3QgYW5vdGhlciB3
YXkgb2YgZG9pbmcgY21kcV9wa3Rfd3JpdGUoKQ0KPiDCoMKgwqAgLSBUaGlzLCBhdCB0aGUgZW5k
IG9mIHRoZSBkYXksIGRvZXMgZXhhY3RseSB3aGF0IGNtZHFfcGt0X3dyaXRlKCkNCj4gaXMgZG9p
bmcsDQo+IMKgwqDCoMKgwqAgZXhjZXB0IGl0J3MgZG9pbmcgaXQgd2l0aCB0d28gaW5zdHJ1Y3Rp
b25zIGluc3RlYWQgb2Ygb25lOw0KPiDCoCAtIFRoZSBzYW1lIHRoaW5nIGNhbiBiZSBkb25lIGlu
IHR3byBkaWZmZXJlbnQgd2F5cyAoZGVwZW5kaW5nIG9uDQo+IFNvQykNCj4gwqDCoMKgIC0gVGhp
cyBzYW1lIHRoaW5nIHNob3VsZCBoYXZlIGEgZnVuY3Rpb24gdGhhdCBkb2VzIGl0Lg0KPiANCj4g
QSBmdW5jdGlvbiB0aGF0IGRvZXMgaXQgY2FuIGJlDQo+IA0KPiBpbnQgY21kcV9wa3Rfd3JpdGVf
cGEoc3RydWN0IGNtZHFfcGt0ICpwa3QsIHU4IHN1YnN5cyAvKnVudXNlZCovLCB1MzINCj4gcGFf
YmFzZSwgdTE2DQo+IG9mZnNldCwgdTMyIHZhbHVlKQ0KPiB7DQo+IMKgwqDCoMKgwqDCoMKgIGVy
ciA9IGNtZHFfcGt0X2Fzc2lnbihwa3QsIDAsIENNRFFfQUREUl9ISUdIKHBhX2Jhc2UpKTsNCj4g
wqDCoMKgwqDCoMKgwqAgaWYgKGVyciA8IDApDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCByZXR1cm4gZXJyOw0KPiANCj4gwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGNtZHFfcGt0X3dy
aXRlX3NfdmFsdWUoIC4uLi4gZXRjKQ0KPiB9DQo+IA0KPiBpbnQgY21kcV9wa3Rfd3JpdGUoKSA8
LS0tIHVuY2hhbmdlZCwgc2NoZWR1bGVkIGZvciByZW1vdmFsIGFmdGVyIGFsbA0KPiBkcml2ZXJz
IG1pZ3JhdGVkDQo+IA0KPiBpbnQgY21kcV9wa3Rfd3JpdGVfc3Vic3lzKHN0cnVjdCBjbWRxX3Br
dCAqcGt0LCB1OCBzdWJzeXMsIHUzMg0KPiBwYV9iYXNlIC8qdW51c2VkKi8sDQo+IHUxNiBvZmZz
ZXQsIHUzMiB2YWx1ZSkNCj4gew0KPiDCoMKgwqDCoMKgwqDCoCAvKiBUaGlzIGZ1bmN0aW9uIHdp
bGwgZ2V0IHRoZSBjb250ZW50cyBvZiBjbWRxX3BrdF93cml0ZSBvbmNlDQo+IHJlbW92ZWQsDQo+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnV0LCBpbiB0aGUgbWVhbndoaWxlLCB0byBhdm9pZCBk
dXBsaWNhdGlvbiB3ZSBqdXN0IGNhbGwNCj4gdGhhdDogKi8NCj4gDQo+IMKgwqDCoMKgwqDCoMKg
IHJldHVybiBjbWRxX3BrdF93cml0ZShwa3QsIHN1YnN5cywgb2Zmc2V0LCB2YWx1ZSk7DQo+IH0N
Cj4gDQo+IC0gQXJlIHdlIGFkZGluZyBvbmUgbW9yZSBmdW5jdGlvbiBwYXJhbWV0ZXI/IFllcw0K
PiAtIElzIHRoaXMgaW1wYWN0aW5nIHBlcmZvcm1hbmNlIG92ZXJhbGw/IE5vdCByZWFsbHkNCj4g
DQo+IEFmdGVyIGFsbCwgd2UncmUgbGl2aW5nIGluIGFuIEFSTXY4IChhY3R1YWxseSwgQVJNdjkg
Zm9yIG5ldyBvbmVzKQ0KPiB3b3JsZCwgc28NCj4gb25lIG1vcmUgZnVuY3Rpb24gcGFyYW0gd29u
J3QgaHVydCBhbnlvbmUuDQo+IA0KPiBJIHRoaW5rIHRoYXQncyB0aGUgYmVzdCBvZiBib3RoIHdv
cmxkcywgYW5kIG1ha2VzIGV2ZXJ5b25lIGhhcHB5Lg0KPiBBcmUgeW91IGhhcHB5IHdpdGggdGhh
dD8gOi0pDQo+IA0KDQpZZXMsIEkgYW0gaGFwcHkgd2l0aCB0aGF0LiA6LSkNCkFuZCB0aGFua3Mg
Zm9yIHlvdXIgZGV0YWlsIGNvZGluZy4NCg0KSSdsbCBjaGFuZ2UgaXQgaW4gdGhlIG5leHQgdmVy
c2lvbi4NCg0KcmVnYXJkcywNCkphc29uLUpIIExpbg0KDQo+IENoZWVycywNCj4gQW5nZWxvDQo+
IA0KDQo=

