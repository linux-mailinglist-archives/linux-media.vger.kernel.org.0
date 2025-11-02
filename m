Return-Path: <linux-media+bounces-46134-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7DDC28C23
	for <lists+linux-media@lfdr.de>; Sun, 02 Nov 2025 09:21:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 16E174E3D19
	for <lists+linux-media@lfdr.de>; Sun,  2 Nov 2025 08:21:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C89DE2288C6;
	Sun,  2 Nov 2025 08:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="meWW8UkQ";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="PXWEDdAU"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5861C34D394;
	Sun,  2 Nov 2025 08:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762071661; cv=fail; b=O44RK0zwTlpjBaJNqJhMYxCo0Zynaz+C37oVr3plDneWgwB8bsKpAG0XEGv7WbqCOacr0sfjARYSa/sPK5Ko7zCtwH5A/0nGJ1dbQOwelemk3Rgl/eJUR+t5BfQ8Nz2LtR4PR4UPBQ8iYvzMJJbD/fofl7pfZAw/Bftt6yxpavo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762071661; c=relaxed/simple;
	bh=t5zNy0240Q/GhEPkyB1XGPEuF1Nuuz6daCg6Rh65YUk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=d0dzbMa1n+4IKnpfhKoyV5nLOboHKPKNrDcCk+Qov+kT5JEQJlz0+CGs5h24K047/EKSA2rPHV+HjVhKQuTgAINFgAmFfRhZ/+bo75Z9XLsV2O3slUOnvj98RCuWaeYpfn4OeKK42vFGZ2RXlO/oLIPZtvHg2EC0udEiPUpW0gw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=meWW8UkQ; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=PXWEDdAU; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: d4a4c386b7c411f0b33aeb1e7f16c2b6-20251102
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=t5zNy0240Q/GhEPkyB1XGPEuF1Nuuz6daCg6Rh65YUk=;
	b=meWW8UkQjj4jkfahQ0WtxxbeeLmYNavB8O91r7b8s0IFkV/Jpb6PtLfqfSMddBKGazc3yau6vAOJnfIEq498SL1ep6B7a8wz7hz/jH7YBut+j58mMkpw35IN4POkBoPTkTPFADJBupGWMN7qHA0cpnTQw70w6NNFXzZyPawIh1k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:b69a564f-e772-4263-b13f-d01c6b81a32a,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:a68e8326-cfd6-4a1d-a1a8-72ac3fdb69c4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:99|80|1,File:130,RT:0,Bulk:nil,QS:
	nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,AR
	C:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d4a4c386b7c411f0b33aeb1e7f16c2b6-20251102
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1299264156; Sun, 02 Nov 2025 16:20:45 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Sun, 2 Nov 2025 16:20:39 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Sun, 2 Nov 2025 16:20:39 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CoAhyGOJubuLYM8kS/7g5j5bG8EGmM4H1fSCbtWxqfNNEvDoi2c/eKl0NyNuc/FG8DYUWNfj2Z/ulw7gZ7ySBsnwzL8rn9uwwXWeIMIvMhEUu2eqOcII7CW3F5ifnXPJCvyF9cJ89kbFGGO2OOEPFtTORcBso7SNbu3uS5+nJnOED/FtsPuenSnTJKkDoU3+ltRutcRFk4/qlUqSn0UzpF9yyU6M1ukXJCTF/Y1pBxt5cKtm+AymWdSvvsj5jwvNF5eImj2U3JXNmeEs3Ki69z1vsj1KtV4Cgjz/J+yer1pqNNLEHW9VVz7mdgM8D9J4Y4Pbtn6MgFT1QG39GEBHIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t5zNy0240Q/GhEPkyB1XGPEuF1Nuuz6daCg6Rh65YUk=;
 b=Gb4Yg/C6tIdabPT+UE5xuXp008LY6cW+W7+fvt+pywfnEmsswuojp5FD/eM0i14R1WhZDJQTIEIsNmyQjwUkiHrNi6q84SuxesQJNZsLdcT6R99LPV+FWI6s8WOZ/rV2lLxenVmbXNHyoUHKhUgIwAicvt3on2gM3u5pKcVMl7YkI0kGxMXmC44cP/LcppzJaEAdjwT0+e6AUdjk19ClFPMj32oyVDX+5+49KK388qNrlrWpn94+DpvPUNTZLdYCI/qweTSU6eRjDor8rGt+0vnWiVN1ioD+iNRZmTqCuIF9ONO43cEF7iGun4O/nEZXj2JIV9MM90kZPtWYJi0qIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t5zNy0240Q/GhEPkyB1XGPEuF1Nuuz6daCg6Rh65YUk=;
 b=PXWEDdAUlvxTc+hbXQlCwsziOnF/1MXRSkw9UAnWXE77ak4gtjPEFYF5VNlkOC3BkQLjhNH8BrMViCFyRiY0eBHLeLWJKJ8d4H/cle0QYQFwCCeOFHhb8GYIzYfdsiu5DKjMkVOBw8knCviev78kNbwCKs20az/LxyDdFGq3+zM=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by TYZPR03MB7412.apcprd03.prod.outlook.com (2603:1096:400:41b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Sun, 2 Nov
 2025 08:20:41 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%7]) with mapi id 15.20.9275.013; Sun, 2 Nov 2025
 08:20:41 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "lkp@intel.com" <lkp@intel.com>, "krzk@kernel.org" <krzk@kernel.org>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>, "robh@kernel.org"
	<robh@kernel.org>, "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>,
	"mchehab@kernel.org" <mchehab@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	=?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
	=?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	=?utf-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
	<Xiandong.Wang@mediatek.com>, "nicolas@ndufresne.ca" <nicolas@ndufresne.ca>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"fshao@chromium.org" <fshao@chromium.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	"wenst@chromium.org" <wenst@chromium.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>
Subject: Re: [PATCH 2/5] soc: mediatek: mtk-cmdq: Add cmdq_pkt_jump_rel_temp()
 for removing shift_pa
Thread-Topic: [PATCH 2/5] soc: mediatek: mtk-cmdq: Add
 cmdq_pkt_jump_rel_temp() for removing shift_pa
Thread-Index: AQHcSn/1MkxRWbZZH0if/lZL2o4nUrTdsEiAgAFd3IA=
Date: Sun, 2 Nov 2025 08:20:41 +0000
Message-ID: <d65f8bce2537445f4e7af26f5f6ef3374deb2311.camel@mediatek.com>
References: <20251031160309.1654761-3-jason-jh.lin@mediatek.com>
	 <202511011919.0lkK3DY8-lkp@intel.com>
In-Reply-To: <202511011919.0lkK3DY8-lkp@intel.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|TYZPR03MB7412:EE_
x-ms-office365-filtering-correlation-id: 4553d4cf-f737-4bb0-e168-08de19e8b61f
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700021|7053199007|13003099007;
x-microsoft-antispam-message-info: =?utf-8?B?ZzRTeUdBNXhTUnpTZ0xPMmpISkxUUVl1QWxsSW9TTXB4cTV4WjlpVkFaRkhO?=
 =?utf-8?B?SW9aS3R1Vk5ZaExkNy9Vbms5Zk01SHdUUlZSRUl2TnRvNXpNblc1YkJJSG1v?=
 =?utf-8?B?SjdqeUM2WlBlajJydjdzMGlqMCsxc3Bmbmp1blczdDBlMWxoczZEdkZ2ZUto?=
 =?utf-8?B?L08yQW1iTUxBMC92TGhVN2I3ckRJdklrVmZoWnFIcmVkTERIYXBRb2h3TVNn?=
 =?utf-8?B?OVpjSS9ldVpBdXZOWlFvaWlwcEJjeUxhUmFWUkU0NzZGWC96NjN6OHIwdDZG?=
 =?utf-8?B?N1pLL25sY25kUlYrSnBZaThoS1dEWmVYa2QzVnFaVVFjTW5qVlg3ZzlWREdM?=
 =?utf-8?B?cXk2eGNvNWllY2owYUYvV0ZpK3hDcEVDWUNuVlNqQ3lKcnpuTEM2dHVCWjhr?=
 =?utf-8?B?RGYvZGt4TGhrODZGYkdNSGVWbjZlOW4vVHJHcjZTcVQwVG0wZ0xuc0ZtMGFV?=
 =?utf-8?B?YmdHaW5sdnQ5L2NEYk1OZnNwbFFpMXNPeXFUVytxenFGK0drMGRPSjJiT2ZQ?=
 =?utf-8?B?cTBXaUdjbXFhd296RklUMDZVd2JuZkF2WGltTW1oWVpwYW04NUoyUUJkTFJs?=
 =?utf-8?B?bEwwdzJVWGZsbVBaR1d0WktKb0hBUW5EZlFiQ2dKd3NzSDdiNDVsSlV3UkFs?=
 =?utf-8?B?c3NLLzA3cVE3MGtXa1ZLYk9ia0g1cUR3bllBUjlrY1gxalI3WkNHVUl4UVlO?=
 =?utf-8?B?VVhjM01IM05zR2FwVk1LeTZUZzAvWVF2bnM1Sjl6Y2RKdVdHa1B3MUR0b3dK?=
 =?utf-8?B?ZVE3bkJmbGtuV1BRci9vUzZnRUpyZ3orNEVwaWlzNmtSanNLZUlYM3JEV01T?=
 =?utf-8?B?UmFaWC9PVUFzNEtNeE5YSGtpWGRSVVYzamtsbUpEdW9NRGU0bmJwdWdTMkpN?=
 =?utf-8?B?NXl1Z1RHNVFpbnIwUnI5cDlYY0l4eENOdytaNy9sMXNDdnhtUURsZE1QcnZU?=
 =?utf-8?B?bDRFa0d6dDlra1B1c0o2aTVUVVRuWStiL2ZwSWMzckFVZXhWRDZGYWRkcTQr?=
 =?utf-8?B?ZzlsRjdxRWt6MlJXOU5NSU14MjIzcHp2TXUxR0RTZXRzMm0xZnFuVUxUS2d5?=
 =?utf-8?B?SHh3UGNqZ1p0TU1ubVVQTWJyKzNyNDVLeFoxWDdLVUlMaVpGMjA0Rk0zNU5y?=
 =?utf-8?B?UHo4WjZxK0ttRnBVcE04czcvVjcwYmswNTNzRnhKZEF2ME9nS0VzazJJdndP?=
 =?utf-8?B?b0VJdlI2TGtxMGVmMkNrTVNsQTIxK05KREl0and1WlNiOUoyRDhrN1BsdVJY?=
 =?utf-8?B?UDVKTUt6ejZqU1ZJdWMxWVU3VWJxUGZEWHFVeXRhOWlzVXRTU2UxZkNuZVls?=
 =?utf-8?B?Mzc5MWpxZ2J3aCtTa3Njei8vbU5mTWFrMTJDbEpwTXAxaUhIRkRiNW0vNjhx?=
 =?utf-8?B?ZVJRNElVdVhkc1NmVW11eTVKYjJUbDhTL05OQm95TTR0SVdiMHVwcmR6cW5t?=
 =?utf-8?B?MkYyMlRJNWJweEtiWDVtWVltdWU3b1BYYXBrMEczYzg2YU8rZHI5Y1VIUGd2?=
 =?utf-8?B?VXJESkN4WFk1L3dKNWRieU0vRS92eUh2cDBrUjNpZjVZN3d1NXZVUjl4TEYw?=
 =?utf-8?B?Z0QyYmJ4WGVqOU84UFRweTcvZkZUYTNoQzBsSmkrK0xuOVFyalZNamVGNENj?=
 =?utf-8?B?OVhMVldzSGRSWWFEb1g5YlpYaW9BNjN4cy9hZWJIVTFPU2ZTK2VrR2lFM0My?=
 =?utf-8?B?T05Zd3NTR0dqQXU2S2ZXUkw3NTVXTFpSaXRzWUJXbC9aWFpLelNVTzgxeFpw?=
 =?utf-8?B?NXZLQWQzSzVjY3hSSFZYOHA4eGdYZFB5aldQUUZoRXRWYUg1TWJOWmRPMEtS?=
 =?utf-8?B?UGlDbmtoK2owemQ3c1h1OU1vMk5YTzEzR2hyRnEySnp5aTRKNVdBSnRNNU5F?=
 =?utf-8?B?eTAwNHpYK3c2dUQyQ1R2azNLT2NHQTBLVHpvbUJTWG1UaUloVzFCRDdYNVlt?=
 =?utf-8?B?SWhGNC95NDJvTFdsM3I4ZlkxNUZqSE4yVXRIWXRITkJScjZ2dndOTmVEOTV4?=
 =?utf-8?B?NnhrVGYxU0h3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7682.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700021)(7053199007)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eUcveU1PWTVDMlhqMnE4a3AvRElUQ0dsYkIxWGUvellaZkxtcWwzeWkxWXlw?=
 =?utf-8?B?bFNMeGxlaysvVmFQcXFXSm94cnBLSm5IbXJPUmtvMENSbWc3RklEVG1KSHJS?=
 =?utf-8?B?emV6ZkJmZ3V6cHNidGlMbmMyV0tHVFduSk9wbjQrWU1GcUhtcUx2NitickM0?=
 =?utf-8?B?SzBld2FBamh6OS93N1pxMmlXdkZjUnFPQ1hrSU1YcnlaSjBZckU2akNTdWR3?=
 =?utf-8?B?QmJjRlZIY3hCOG5kN1lLTTcyNFhJazM0c1NRT2xoZzRndytiZk50WngvRlkv?=
 =?utf-8?B?TlQ5TFJocVVNRi9LV2xLN09MbmJlaHNzaHVNcSsybmdyRmk0M2YyY2U1dWZ4?=
 =?utf-8?B?aFdWV1hTcnl4cGt3d1Izd2RrVmtaTG1kUjR5VHZSRktJaEhFVHlGSVpxcTNi?=
 =?utf-8?B?RjFhMFI3QkJzMmlCUGpNd2NsUC9KM0U0M1ZuK3JLSnVUMmVNRlNRa3k1WDhp?=
 =?utf-8?B?TU1uZU51NGIvQnROTzgzQmV6azFpNjRuaVFIeEcrNVVWbFpkM1hSVnpyTUph?=
 =?utf-8?B?OXcrd1FXazNPYXdrcnlMb1JCWHFpbnlNdzBSUnFkNHpmdlB2VnpKZFJ4SGxw?=
 =?utf-8?B?R0V3N09pT3dxRkcrKyszcFk3YXZ1SmZQZFZjRzh0djkrejJIZ2NNN3hHRjRQ?=
 =?utf-8?B?akJreDFnbDgxRWhTSnE4dWNXUVJOQkdPSWpWUkY4QVlHTmwwejB4cDZHSy9I?=
 =?utf-8?B?QVJkY3QrdnlIYWVqNFRZa0g1QytDUjhpMVZ5VWNtVTRwdzBLVWNpN0lWN0dW?=
 =?utf-8?B?eW9jSXFCbUwyYlhCbUUxSkFWTGNPampSNk04VEZzeVlyRkpQOUZYMDE0MUlD?=
 =?utf-8?B?TDhscWo1TlQrb0YyWUxUMEFnbjBlNEdYMWhMM2lZNEhmQjZKblVWOCtFRFhi?=
 =?utf-8?B?MGFvNmR6dGozcEZnSEt4M3ZNQzdmRUUrbGVscHN3NGlzQ24zaXE2S0M1QkNC?=
 =?utf-8?B?ZnE5dHZQNHMzdEJEaWdMUFl5SktDTE1CK1RWQk5vb2JqcldLbzdkVXpMdkFT?=
 =?utf-8?B?dU1FRURUREozRnNRa29LdGZjaWdDMkJFTnM2YjRqQ3ZFaVROTHYvbkpIdFBW?=
 =?utf-8?B?SEdyQllhblE4QzF5R2hjVUhQMzZGc3p6QXhJOG5uMktaZE5sUG9Yd3FFeWpE?=
 =?utf-8?B?Q1p6algyOXl0Wm9qUklmRTJMZEd4NEZxa0lJUEVEekFZUW8xRS8vejZJcDVq?=
 =?utf-8?B?YUtEU0YvR01RZTFSOEFuVW5HLzY0Ylc3VWVJanNmNGRJN0o2d08rL250cnVn?=
 =?utf-8?B?VGxaMTgyZzh2N0Rzd0wzR3E4b3RXTUtCNnR4dFZKL25EMnozNG12N25Cdnla?=
 =?utf-8?B?WjgrZU53UWJ5cGFiT0hOQU1jSmM5TDF0MncrQ0hOZlFsR1l1TVE4UmI2c1VZ?=
 =?utf-8?B?aE8zTTlOanhuTU1lMnFhVjdBR3c1WXR3elJsRlpOeGdXbDEwS0l1ZUlnNkI3?=
 =?utf-8?B?bHRvbCtIc292NmorL0lJRmtCQkZEdW5GNHByc3Bjenp2WDR6QUsvMXV3Qmk1?=
 =?utf-8?B?ZW5Zem9HNWROUWYwRmRTU1ByT2hVTnptQU5oS1F1REJMd1Z6VUdqcmI5VC94?=
 =?utf-8?B?Wm43MmpUZ3JSMzZXWVhGdC9Ub0VNTGo4QmZDQVdGUWNWaTRLWkNVdmVwN0FL?=
 =?utf-8?B?U2lhb1VMbGVGelloSnZPUTF4ODhIUDk4QW9MVmpod2RRTHVONUk0WkNZNHd6?=
 =?utf-8?B?bDcyRWFjVm85bDBMZ0MvdEp1R3FxcUZ3NkRNdGdLR2hzdjZlZWxGc1VKbHZB?=
 =?utf-8?B?c1pHYzFIWkRGUEcwSjMvVHNsbGVkZlpUWGN1MlBGSGRTTHBNTWMzWkl6djda?=
 =?utf-8?B?UEhEODRDUWdmQm1uZ1cwWFJXT1RHTFlsYitpaUxwWGlNbEJZdmVLNG5OTU5C?=
 =?utf-8?B?YUxBamxYY0R2WXdxZUh5VWwrbnkzYXV2c3J6a0gyYUo2Tkd0TUtxV1oweHpY?=
 =?utf-8?B?U1piQ1pGYVROZDlaUG1Ock1FS2NvcVVwOEIvZGN2YnNROFd4Wjg5TWdNREpY?=
 =?utf-8?B?YWNwdFFaMTkyakhlQXlXZTA3M2QvRUIvQzRMZkNRYWJzVnBDQXV0NUdncHFT?=
 =?utf-8?B?YXBFRGxsU3lXQkFBWW9nRVdRbGh5VVdBZEtNOWZrT0NYU3o5UmNocXdhSmxJ?=
 =?utf-8?B?MWtZQkxhK0k0R1c0eE1zQ0xSMGhTUW5xNnRiOTRTNFRucnJlZ3hGL0VIbDM4?=
 =?utf-8?B?aHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <45E76E471FF63142986360834FFA9B03@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4553d4cf-f737-4bb0-e168-08de19e8b61f
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2025 08:20:41.1303
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lC5D+FDVuy9DU6onPgbBBlCS9m2IwyKOzKoW9hk1wC5wTR2Y4+QiM3Xxlg/foZ2Gyaxl4eTJ0Ot7LiOkKopljI8KXO4xJlOxapL6MqZwuEw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7412

T24gU2F0LCAyMDI1LTExLTAxIGF0IDE5OjI4ICswODAwLCBrZXJuZWwgdGVzdCByb2JvdCB3cm90
ZToNCj4gDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBv
cGVuIGF0dGFjaG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3Ig
dGhlIGNvbnRlbnQuDQo+IA0KPiANCj4gSGkgSmFzb24tSkgsDQo+IA0KPiBrZXJuZWwgdGVzdCBy
b2JvdCBub3RpY2VkIHRoZSBmb2xsb3dpbmcgYnVpbGQgZXJyb3JzOg0KPiANCj4gW2F1dG8gYnVp
bGQgdGVzdCBFUlJPUiBvbiBsaW51eHR2LW1lZGlhLXBlbmRpbmcvbWFzdGVyXQ0KPiBbYWxzbyBi
dWlsZCB0ZXN0IEVSUk9SIG9uIG1lZGlhLXRyZWUvbWFzdGVyIGxpbnVzL21hc3RlciB2Ni4xOC1y
YzMNCj4gbmV4dC0yMDI1MTAzMV0NCj4gW0lmIHlvdXIgcGF0Y2ggaXMgYXBwbGllZCB0byB0aGUg
d3JvbmcgZ2l0IHRyZWUsIGtpbmRseSBkcm9wIHVzIGENCj4gbm90ZS4NCj4gQW5kIHdoZW4gc3Vi
bWl0dGluZyBwYXRjaCwgd2Ugc3VnZ2VzdCB0byB1c2UgJy0tYmFzZScgYXMgZG9jdW1lbnRlZA0K
PiBpbg0KPiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9naXQtc2NtLmNvbS9k
b2NzL2dpdC1mb3JtYXQtcGF0Y2gqX2Jhc2VfdHJlZV9pbmZvcm1hdGlvbl9fO0l3ISFDVFJOS0E5
d01nMEFSYnchbktaX1RIbkcyaGpfeDBQbnNrU0s2Y3Nyel9uRFVTTHFETHdKcHN5SEFKMUNNZzQx
YWhualZZdjBtRlRhUDdqcldBejBwRXZ1MTgtazdUbyQNCj4gwqBdDQo+IA0KPiB1cmw6wqDCoMKg
DQo+IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2dpdGh1Yi5jb20vaW50ZWwt
bGFiLWxrcC9saW51eC9jb21taXRzL0phc29uLUpILUxpbi9zb2MtbWVkaWF0ZWstVXNlLXBrdF93
cml0ZS1mdW5jdGlvbi1wb2ludGVyLWZvci1zdWJzeXMtSUQtY29tcGF0aWJpbGl0eS8yMDI1MTEw
MS0wMDA1NTVfXzshIUNUUk5LQTl3TWcwQVJidyFuS1pfVEhuRzJoal94MFBuc2tTSzZjc3J6X25E
VVNMcURMd0pwc3lIQUoxQ01nNDFhaG5qVll2MG1GVGFQN2pyV0F6MHBFdnUzc0Qta0hvJA0KPiBi
YXNlOsKgwqANCj4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vZ2l0LmxpbnV4
dHYub3JnL21lZGlhLWNpL21lZGlhLXBlbmRpbmcuZ2l0X187ISFDVFJOS0E5d01nMEFSYnchbkta
X1RIbkcyaGpfeDBQbnNrU0s2Y3Nyel9uRFVTTHFETHdKcHN5SEFKMUNNZzQxYWhualZZdjBtRlRh
UDdqcldBejBwRXZ1aU43akpPWSQNCj4gwqAgbWFzdGVyDQo+IHBhdGNoIGxpbms6wqDCoMKgDQo+
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNTEwMzExNjAzMDkuMTY1NDc2MS0zLWphc29u
LWpoLmxpbiU0MG1lZGlhdGVrLmNvbQ0KPiBwYXRjaCBzdWJqZWN0OiBbUEFUQ0ggMi81XSBzb2M6
IG1lZGlhdGVrOiBtdGstY21kcTogQWRkDQo+IGNtZHFfcGt0X2p1bXBfcmVsX3RlbXAoKSBmb3Ig
cmVtb3Zpbmcgc2hpZnRfcGENCj4gY29uZmlnOiB4ODZfNjQtYnVpbGRvbmx5LXJhbmRjb25maWct
MDAxLTIwMjUxMTAxDQo+IChodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9kb3du
bG9hZC4wMS5vcmcvMGRheS1jaS9hcmNoaXZlLw0KPiAyMDI1MTEwMS8yMDI1MTEwMTE5MTkuMGxr
SzNEWTgtbGtwQGludGVsLmNvbS9jb25maWdfXzshIUNUUk5LQTl3TWcwQVINCj4gYnchbktaX1RI
bkcyaGpfeDBQbnNrU0s2Y3Nyel9uRFVTTHFETHdKcHN5SEFKMUNNZzQxYWhualZZdjBtRlRhUDdq
cldBDQo+IHowcEV2dVZtY1VyUmMkwqApDQo+IGNvbXBpbGVyOiBjbGFuZyB2ZXJzaW9uIDIwLjEu
OA0KPiAoaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vZ2l0aHViLmNvbS9sbHZt
L2xsdm0tcHJvamVjdF9fOyENCj4gIUNUUk5LQTl3TWcwQVJidyFuS1pfVEhuRzJoal94MFBuc2tT
SzZjc3J6X25EVVNMcURMd0pwc3lIQUoxQ01nNDFhaG5qDQo+IFZZdjBtRlRhUDdqcldBejBwRXZ1
OWNJWXdJTSTCoA0KPiA4N2YwMjI3Y2I2MDE0N2EyNmExZWViNGZiMDZlM2I1MDVlOWM3MjYxKQ0K
PiByZXByb2R1Y2UgKHRoaXMgaXMgYSBXPTEgYnVpbGQpOg0KPiAoaHR0cHM6Ly91cmxkZWZlbnNl
LmNvbS92My9fX2h0dHBzOi8vZG93bmxvYWQuMDEub3JnLzBkYXktY2kvYXJjaGl2ZS8NCj4gMjAy
NTExMDEvMjAyNTExMDExOTE5LjBsa0szRFk4LWxrcEBpbnRlbC5jb20vcmVwcm9kdWNlX187ISFD
VFJOS0E5d01nDQo+IDBBUmJ3IW5LWl9USG5HMmhqX3gwUG5za1NLNmNzcnpfbkRVU0xxREx3SnBz
eUhBSjFDTWc0MWFobmpWWXYwbUZUYVA3ag0KPiByV0F6MHBFdnVVMzJ1aHZrJMKgKQ0KPiANCj4g
SWYgeW91IGZpeCB0aGUgaXNzdWUgaW4gYSBzZXBhcmF0ZSBwYXRjaC9jb21taXQgKGkuZS4gbm90
IGp1c3QgYSBuZXcNCj4gdmVyc2lvbiBvZg0KPiB0aGUgc2FtZSBwYXRjaC9jb21taXQpLCBraW5k
bHkgYWRkIGZvbGxvd2luZyB0YWdzDQo+ID4gUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90
IDxsa3BAaW50ZWwuY29tPg0KPiA+IENsb3NlczoNCj4gPiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9vZS1rYnVpbGQtYWxsLzIwMjUxMTAxMTkxOS4wbGtLM0RZOC1sa3BAaW50ZWwuY29tLw0KPiAN
Cj4gQWxsIGVycm9ycyAobmV3IG9uZXMgcHJlZml4ZWQgYnkgPj4pOg0KPiANCj4gwqDCoCBJbiBm
aWxlIGluY2x1ZGVkIGZyb20gZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmM6MTQ6DQo+
IMKgwqAgSW4gZmlsZSBpbmNsdWRlZCBmcm9tIGluY2x1ZGUvbGludXgvc29jL21lZGlhdGVrL210
ay1tbXN5cy5oOjExOg0KPiA+ID4gaW5jbHVkZS9saW51eC9zb2MvbWVkaWF0ZWsvbXRrLWNtZHEu
aDo1MzA6MTA6IGVycm9yOiB1c2Ugb2YNCj4gPiA+IHVuZGVjbGFyZWQgaWRlbnRpZmllciAnRUlN
VkFMJw0KPiDCoMKgwqDCoCA1MzAgfMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FSU1WQUw7DQoN
Ck9vcHMhIEkgZGlkbid0IHZlcmlmeSB0aGlzIHdpdGhvdXQgZGlzYWJsaW5nIENPTkZJR19NVEtf
Q01EUS4NCg0KVG8gd2FpdCBmb3Igb3RoZXIgbWFpbnRhaW5lcnMgcmV2aWV3IHRoZSBmdWxsIHRv
cGljLA0KSSdsbCBmaXggdGhpcyBhbmQgcmViYXNlIHRoZSBzZXJpZXMgb25jZSB0aGUgc29jIHBh
dGNoZXMgaW4gKFNlcmllcw0KMS80KSBpcyBhcHBsaWVkLg0KDQpSZWdhcmRzLA0KSmFzb24tSkgg
TGluDQoNCj4gwqDCoMKgwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgXg0KPiDCoMKgIGRyaXZlcnMvc29jL21lZGlhdGVrL210ay1tbXN5cy5jOjE3MDoyNjogZXJy
b3I6IG5vIG1lbWJlciBuYW1lZA0KPiAncGt0X3dyaXRlX21hc2snIGluICdzdHJ1Y3QgY21kcV9j
bGllbnRfcmVnJw0KPiDCoMKgwqDCoCAxNzAgfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHJldCA9IG1tc3lzLQ0KPiA+Y21kcV9iYXNlLnBrdF93cml0ZV9tYXNrKGNtZHFfcGt0LA0K
PiDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB+fn5+fn5+fn5+fn5+fn5+IF4NCj4gwqDCoCBkcml2ZXJzL3NvYy9tZWRpYXRlay9t
dGstbW1zeXMuYzoxNzI6MzA6IGVycm9yOiBubyBtZW1iZXIgbmFtZWQNCj4gJ3BhX2Jhc2UnIGlu
ICdzdHJ1Y3QgY21kcV9jbGllbnRfcmVnJw0KPiDCoMKgwqDCoCAxNzIgfMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoA0KPiBtbXN5cy0+Y21kcV9iYXNl
LnBhX2Jhc2UsDQo+IMKgwqDCoMKgwqDCoMKgwqAgfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoA0KPiB+fn5+fn5+fn5+fn5+fn5+IF4NCj4gwqDCoCAz
IGVycm9ycyBnZW5lcmF0ZWQuDQo+IC0tDQo+IMKgwqAgSW4gZmlsZSBpbmNsdWRlZCBmcm9tIGRy
aXZlcnMvc29jL21lZGlhdGVrL210ay1tdXRleC5jOjEyOg0KPiDCoMKgIEluIGZpbGUgaW5jbHVk
ZWQgZnJvbSBpbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGstbW1zeXMuaDoxMToNCj4gPiA+
IGluY2x1ZGUvbGludXgvc29jL21lZGlhdGVrL210ay1jbWRxLmg6NTMwOjEwOiBlcnJvcjogdXNl
IG9mDQo+ID4gPiB1bmRlY2xhcmVkIGlkZW50aWZpZXIgJ0VJTVZBTCcNCj4gwqDCoMKgwqAgNTMw
IHzCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRUlNVkFMOw0KPiDCoMKgwqDCoMKgwqDCoMKgIHzC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBeDQo+IMKgwqAgZHJpdmVycy9zb2MvbWVk
aWF0ZWsvbXRrLW11dGV4LmM6MTAwMjoxNjogZXJyb3I6IG5vIG1lbWJlciBuYW1lZA0KPiAncGt0
X3dyaXRlJyBpbiAnc3RydWN0IGNtZHFfY2xpZW50X3JlZycNCj4gwqDCoMKgIDEwMDIgfMKgwqDC
oMKgwqDCoMKgwqAgbXR4LT5jbWRxX3JlZy5wa3Rfd3JpdGUoY21kcV9wa3QsIG10eC0NCj4gPmNt
ZHFfcmVnLnN1YnN5cywgZW5fYWRkciwgZW5fYWRkciwgMSk7DQo+IMKgwqDCoMKgwqDCoMKgwqAg
fMKgwqDCoMKgwqDCoMKgwqAgfn5+fn5+fn5+fn5+fiBeDQo+IMKgwqAgMiBlcnJvcnMgZ2VuZXJh
dGVkLg0KPiAtLQ0KPiDCoMKgIEluIGZpbGUgaW5jbHVkZWQgZnJvbSBtdGstbW1zeXMuYzoxNDoN
Cj4gwqDCoCBJbiBmaWxlIGluY2x1ZGVkIGZyb20gaW5jbHVkZS9saW51eC9zb2MvbWVkaWF0ZWsv
bXRrLW1tc3lzLmg6MTE6DQo+ID4gPiBpbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGstY21k
cS5oOjUzMDoxMDogZXJyb3I6IHVzZSBvZg0KPiA+ID4gdW5kZWNsYXJlZCBpZGVudGlmaWVyICdF
SU1WQUwnDQo+IMKgwqDCoMKgIDUzMCB8wqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTVZBTDsN
Cj4gwqDCoMKgwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXg0K
PiDCoMKgIG10ay1tbXN5cy5jOjE3MDoyNjogZXJyb3I6IG5vIG1lbWJlciBuYW1lZCAncGt0X3dy
aXRlX21hc2snIGluDQo+ICdzdHJ1Y3QgY21kcV9jbGllbnRfcmVnJw0KPiDCoMKgwqDCoCAxNzAg
fMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldCA9IG1tc3lzLQ0KPiA+Y21kcV9i
YXNlLnBrdF93cml0ZV9tYXNrKGNtZHFfcGt0LA0KPiDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB+fn5+fn5+fn5+fn5+fn5+IF4N
Cj4gwqDCoCBtdGstbW1zeXMuYzoxNzI6MzA6IGVycm9yOiBubyBtZW1iZXIgbmFtZWQgJ3BhX2Jh
c2UnIGluICdzdHJ1Y3QNCj4gY21kcV9jbGllbnRfcmVnJw0KPiDCoMKgwqDCoCAxNzIgfMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoA0KPiBtbXN5cy0+
Y21kcV9iYXNlLnBhX2Jhc2UsDQo+IMKgwqDCoMKgwqDCoMKgwqAgfMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoA0KPiB+fn5+fn5+fn5+fn5+fn5+IF4N
Cj4gwqDCoCAzIGVycm9ycyBnZW5lcmF0ZWQuDQo+IC0tDQo+IMKgwqAgSW4gZmlsZSBpbmNsdWRl
ZCBmcm9tIG10ay1tdXRleC5jOjEyOg0KPiDCoMKgIEluIGZpbGUgaW5jbHVkZWQgZnJvbSBpbmNs
dWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGstbW1zeXMuaDoxMToNCj4gPiA+IGluY2x1ZGUvbGlu
dXgvc29jL21lZGlhdGVrL210ay1jbWRxLmg6NTMwOjEwOiBlcnJvcjogdXNlIG9mDQo+ID4gPiB1
bmRlY2xhcmVkIGlkZW50aWZpZXIgJ0VJTVZBTCcNCj4gwqDCoMKgwqAgNTMwIHzCoMKgwqDCoMKg
wqDCoMKgIHJldHVybiAtRUlNVkFMOw0KPiDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBeDQo+IMKgwqAgbXRrLW11dGV4LmM6MTAwMjoxNjogZXJyb3I6
IG5vIG1lbWJlciBuYW1lZCAncGt0X3dyaXRlJyBpbiAnc3RydWN0DQo+IGNtZHFfY2xpZW50X3Jl
ZycNCj4gwqDCoMKgIDEwMDIgfMKgwqDCoMKgwqDCoMKgwqAgbXR4LT5jbWRxX3JlZy5wa3Rfd3Jp
dGUoY21kcV9wa3QsIG10eC0NCj4gPmNtZHFfcmVnLnN1YnN5cywgZW5fYWRkciwgZW5fYWRkciwg
MSk7DQo+IMKgwqDCoMKgwqDCoMKgwqAgfMKgwqDCoMKgwqDCoMKgwqAgfn5+fn5+fn5+fn5+fiBe
DQo+IMKgwqAgMiBlcnJvcnMgZ2VuZXJhdGVkLg0KPiANCj4gS2NvbmZpZyB3YXJuaW5nczogKGZv
ciByZWZlcmVuY2Ugb25seSkNCj4gwqDCoCBXQVJOSU5HOiB1bm1ldCBkaXJlY3QgZGVwZW5kZW5j
aWVzIGRldGVjdGVkIGZvciBPRl9HUElPDQo+IMKgwqAgRGVwZW5kcyBvbiBbbl06IEdQSU9MSUIg
Wz15XSAmJiBPRiBbPW5dICYmIEhBU19JT01FTSBbPXldDQo+IMKgwqAgU2VsZWN0ZWQgYnkgW3ld
Og0KPiDCoMKgIC0gR1BJT19UQjEwWCBbPXldICYmIEdQSU9MSUIgWz15XSAmJiBIQVNfSU9NRU0g
Wz15XSAmJg0KPiAoQVJDX1BMQVRfVEIxMFggfHwgQ09NUElMRV9URVNUIFs9eV0pDQo+IMKgwqAg
V0FSTklORzogdW5tZXQgZGlyZWN0IGRlcGVuZGVuY2llcyBkZXRlY3RlZCBmb3IgR1BJT19TWVND
T04NCj4gwqDCoCBEZXBlbmRzIG9uIFtuXTogR1BJT0xJQiBbPXldICYmIEhBU19JT01FTSBbPXld
ICYmIE1GRF9TWVNDT04gWz15XQ0KPiAmJiBPRiBbPW5dDQo+IMKgwqAgU2VsZWN0ZWQgYnkgW3ld
Og0KPiDCoMKgIC0gR1BJT19TQU1BNUQyX1BJT0JVIFs9eV0gJiYgR1BJT0xJQiBbPXldICYmIEhB
U19JT01FTSBbPXldICYmDQo+IE1GRF9TWVNDT04gWz15XSAmJiBPRl9HUElPIFs9eV0gJiYgKEFS
Q0hfQVQ5MSB8fCBDT01QSUxFX1RFU1QgWz15XSkNCj4gwqDCoCBXQVJOSU5HOiB1bm1ldCBkaXJl
Y3QgZGVwZW5kZW5jaWVzIGRldGVjdGVkIGZvciBJMkNfSzENCj4gwqDCoCBEZXBlbmRzIG9uIFtu
XTogSTJDIFs9eV0gJiYgSEFTX0lPTUVNIFs9eV0gJiYgKEFSQ0hfU1BBQ0VNSVQgfHwNCj4gQ09N
UElMRV9URVNUIFs9eV0pICYmIE9GIFs9bl0NCj4gwqDCoCBTZWxlY3RlZCBieSBbeV06DQo+IMKg
wqAgLSBNRkRfU1BBQ0VNSVRfUDEgWz15XSAmJiBIQVNfSU9NRU0gWz15XSAmJiAoQVJDSF9TUEFD
RU1JVCB8fA0KPiBDT01QSUxFX1RFU1QgWz15XSkgJiYgSTJDIFs9eV0NCj4gDQo+IA0KPiB2aW0g
Ky9FSU1WQUwgKzUzMCBpbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGstY21kcS5oDQo+IA0K
PiDCoMKgIDUyNg0KPiDCoMKgIDUyN8KgIC8qIFRoaXMgd3JhcHBlciBoYXMgdG8gYmUgcmVtb3Zl
ZCBhZnRlciBhbGwgdXNlcnMgbWlncmF0ZWQgdG8NCj4ganVtcF9yZWwgKi8NCj4gwqDCoCA1MjjC
oCBzdGF0aWMgaW5saW5lIGludCBjbWRxX3BrdF9qdW1wX3JlbF90ZW1wKHN0cnVjdCBjbWRxX3Br
dA0KPiAqcGt0LCBzMzIgb2Zmc2V0LCB1OCBzaGlmdF9wYSkNCj4gwqDCoCA1MjnCoCB7DQo+IMKg
PiA1MzDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FSU1WQUw7DQo+IMKgwqAgNTMxwqAgfQ0K
PiDCoMKgIDUzMg0KPiANCj4gLS0NCj4gMC1EQVkgQ0kgS2VybmVsIFRlc3QgU2VydmljZQ0KPiBo
dHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9naXRodWIuY29tL2ludGVsL2xrcC10
ZXN0cy93aWtpX187ISFDVFJOS0E5d01nMEFSYnchbktaX1RIbkcyaGpfeDBQbnNrU0s2Y3Nyel9u
RFVTTHFETHdKcHN5SEFKMUNNZzQxYWhualZZdjBtRlRhUDdqcldBejBwRXZ1alNkSnpaYyQNCg0K

