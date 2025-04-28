Return-Path: <linux-media+bounces-31137-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F053DA9E80C
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 08:13:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 840473AD778
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 06:13:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1CE51C84BF;
	Mon, 28 Apr 2025 06:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="OHhMaREJ";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="Me80NJUI"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526348F77;
	Mon, 28 Apr 2025 06:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745820805; cv=fail; b=hOmhv4ghT+Iu+2eqwfsHFk61XJ/GsTUCDu+dSMNcISqVe4YuZqw3SEuDRmluM8EO9UGVY/JKtduKFNzSMdFHfDzf9qTVRKmGfMI+TNjBUsiEYn8haiSDWExdzeQ6gG+mxCoryn3fDs7+7OHbrTgoL7Hw2c1S8wILq5uAX25gCuo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745820805; c=relaxed/simple;
	bh=EYdr/oQEJCloBKTrvuv9NS3+rd0atWK5teNzdF7efA4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aJkb5pyAYg8fm1O706lLLVPStpbcIpRGfiGtuDFl2Q2nnHYQou9xuuyU88hd4istUZsS2VDELb0M8PCTfKlrMFscRiyRtdcgntKe+FpA+35OLDYMET31j2lhYUeYqPJ70UbqTFAtBNgBCQWQ25/jtiZV7kt6N7HaExTMaRaKutY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=OHhMaREJ; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=Me80NJUI; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: dc279cac23f711f0980a8d1746092496-20250428
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=EYdr/oQEJCloBKTrvuv9NS3+rd0atWK5teNzdF7efA4=;
	b=OHhMaREJ4whX0qQZB8sOaq88YkszN+2xdbGKjSkn/KqKMi4L61Z58YwD3m3Qvu+HldZyDzRMDcbKoB3fBNtzWSAu3JoFPP4RmbnFadnjBtO1KaSFqHILcfbTNgBe2p/mLGZRqcrJys0v7weGwD8Z4zPBzJPQoVA76rA2DnsRenQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:7ae9a23d-5758-4648-ba68-5f14f38391cf,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:07a4f16f-e08c-41ab-89e8-3ba0a33da853,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: dc279cac23f711f0980a8d1746092496-20250428
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 945136974; Mon, 28 Apr 2025 14:13:10 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 28 Apr 2025 14:13:09 +0800
Received: from OS8PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 28 Apr 2025 14:13:09 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IlU/DClat+9LqiISQl9rvh0pdQaulO5crZCfxab8cv64FOdbcemZ669umGYzqLVsNlk+mm/01FFQHACYyONbALaU1ZmrK+7v0mu74vtOqjYxHbwY1HRNpKu31v5a3//Df6QGFTKEeAsZVcqNEh8P2Vcf2ksIOOeu1lPVnQy+ZKyOS/FqZapRJ9OJQH7CGR9wXxNoXefTB++CsEODYaMj+PhzyZ9lqvhkW8o38B3j6XPPw/YiRskGFYtWQJEwWf35ZmxhmS8fWWlBHrfNOYuJnhYOsYd9XaMqENY+0jyoB2NEKbRsfg2F5nYKvMm366BCGNX1RXIUSLE5p8TWGbiBXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EYdr/oQEJCloBKTrvuv9NS3+rd0atWK5teNzdF7efA4=;
 b=s87f/5p9NutZD2V3A5Ehi/e4k9bx1PjRXQQOp4aEKqJiC2wu0CWni8MSRLXNnd3JEQ6wc4ggPFXKEM8rGdoH1aUxYUyvClqmCVXpK0ZqsC2yl/tqNyuKt28NIUKurMCAsIpxwoBGtiJw9Yawg3bYAU1FMlhZb92yKIZlD9B++RqE1rrHfNANkjJdjirEVenmnJibEMNvauuNzdEbHnYU305XyEi84QA/dkVymvNEgIgAwxcPP+eB/npJIPkMPBUpadA/3v40mDpj8b6tN3qMmKd3OT0pIPMKKPGxFCoxpo+NA/t4dfod0/uwKtu++k9Eu8lDcZSAVWGniQbuTFvCzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EYdr/oQEJCloBKTrvuv9NS3+rd0atWK5teNzdF7efA4=;
 b=Me80NJUIHQuGbkP3+Iroj9jm2XQTcMOtLSKlYoD0ch0Hl9bCDTmuysh+HxCY33T7fzPvju38EjDYZ173u56U3U1GOHNigWdcfCcC1DGuGXAWKwJwsZZ4iuJs/y/vTmY0B+uc4DVD6LEy8GtHVU7TcxOvwUzlQHQgX+e6njfWXxo=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by OSQPR03MB8794.apcprd03.prod.outlook.com (2603:1096:604:278::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Mon, 28 Apr
 2025 06:13:06 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%6]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 06:13:06 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>, "chunkuang.hu@kernel.org"
	<chunkuang.hu@kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>
CC: "pual-pl.chen@mediatek.com" <pual-pl.chen@mediatek.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	=?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
	=?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	=?utf-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
	<Xiandong.Wang@mediatek.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"fshao@chromium.org" <fshao@chromium.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	"wenst@chromium.org" <wenst@chromium.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, =?utf-8?B?WGF2aWVyIENoYW5nICjlvLXnjbvmlocp?=
	<Xavier.Chang@mediatek.com>
Subject: Re: [PATCH v5 03/19] mailbox: mtk-cmdq: Add cmdq private data to
 cmdq_pkt for generating instruction
Thread-Topic: [PATCH v5 03/19] mailbox: mtk-cmdq: Add cmdq private data to
 cmdq_pkt for generating instruction
Thread-Index: AQHbtcUZsgRbDk/9WUWVZTayJC5cI7O4naqA
Date: Mon, 28 Apr 2025 06:13:06 +0000
Message-ID: <6a6aee9658dc467fe7bf9b96e8a8a3f3ac6f182a.camel@mediatek.com>
References: <20250425093237.1543918-1-jason-jh.lin@mediatek.com>
	 <20250425093237.1543918-4-jason-jh.lin@mediatek.com>
In-Reply-To: <20250425093237.1543918-4-jason-jh.lin@mediatek.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|OSQPR03MB8794:EE_
x-ms-office365-filtering-correlation-id: e8e710e3-93b3-42a0-8680-08dd861bbdb9
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?VnJZU0pkTjFGWm9HQ2FsWHVaOHRLNjhHSjJzNG5WWHE5TEtCM2JXeExLRS9q?=
 =?utf-8?B?c05NU3Fpc21EY0plZnBORUI0dkF1VkJReVV5Q3plRHdGSWtxV3I3SVdOeDNO?=
 =?utf-8?B?QVd6dHJoVmpiWkdTSVY4QXZLS1MxdVlJdFVnUFF4eXN2V1NTeStWaEl4djNG?=
 =?utf-8?B?aGowc1l0TWMwY0FBMzRqY29vNThnbGZsR1I3dXgxRWpqQXlpZXp1NGNBaWk2?=
 =?utf-8?B?NDBqNUZManIxd2FrZ3NoQmhCdm5zTTY5Nm1laXA4QW1SYzlsanNwbExzaElK?=
 =?utf-8?B?bnZZUUNyTWNvQk1ST2EwYnQ4bnhKMGo5UEtDT28veFFBMTVDcWQ0VUNLbUJL?=
 =?utf-8?B?VXhXem5INlZxQ0hFcmlaVSt4SXJXN2YxT25UVnVybDE1RHdCQWxicG9XYmVt?=
 =?utf-8?B?SWJMb29JY0dQN1J4Mzl3ZEcwWVlVRnJHWE4rYzZXSVJ5WVg0d0hKUHJpWnRX?=
 =?utf-8?B?S1lvSEpHc0Y0YlVVMVJVZHVObncrTlBNVGNvS1dFYnZ3K2JSclJKWDYzWG9u?=
 =?utf-8?B?cjQ0TWkwNVFFb0kybDlxcUp6enMzL0pnZzhsSHgwM2NWZlg4eDkzM2dRY3Yz?=
 =?utf-8?B?d09yd1VlUDhMbjVML2NldnByejVQazB6WmJxdXdDVjMxV2ZqZWY4S0pQVi8z?=
 =?utf-8?B?UFdWNEYrMWlTRmNmOTZ6ekt3dkZYZzVhYzFlMWk5bzd1TENob216V1lHTExM?=
 =?utf-8?B?a2xDWWJaVllERERBK3RwQnFnNHY0S2pJWjAvR3RxSGxSdEV5K09TLzJaZGx6?=
 =?utf-8?B?cENLcXdPY2V2ZnZLUnlpNDRYSGpDSU9QZDJnSytDSllWMWF1dHhyM2ZYa29X?=
 =?utf-8?B?d0pta3VUNEdoUC9aUFlrM1c1bFhPcm1Ob0RaMnF5QTJ0Y3ViMysyUmJYZU5m?=
 =?utf-8?B?RjNYMDh3RDJBTTY1UGdXUTFaQUFwQ04rTStURFlUeXlRQkw1WjhpNXNmZU1M?=
 =?utf-8?B?Z3NCNDlnSGo4Q0M0QjBKTWxRem1pVHVWNTFSdUZBL1kxdldqZnlOT2ZOSkVD?=
 =?utf-8?B?MDVMSUNhcllYbEI1L2plTUZQRS9MempzdGs5RGpDbSs2ZzhzVFRGZUlkSmhO?=
 =?utf-8?B?emRyRnc4UDdOaUIxQWUrY1ArVUFCL0QwQXV4TkNVdWpSM0ZlRitWVDFuNjMy?=
 =?utf-8?B?U3ZxdkpGSVpIeC9hT0cxaFBtTHVkS3UxME5POTFwc0V1UnJaNGtFdlJVaTBX?=
 =?utf-8?B?RDM1WDgxQzM0L0NVbkZkUlFNVDhnbWNpRkVLaU5pcG1oenhGR0k0dTBWa2Iy?=
 =?utf-8?B?TzIxUFJFcjdkRjdvWFpkZkVtOHNNN2hGVlJMbTFvZDZJYXBERVc5WVphT3NY?=
 =?utf-8?B?Vkwyb3p3Qy84ZDlVbDFCTExmUmVRWUczRzUwT2xCU1B4OW90Q2luazBlTHZU?=
 =?utf-8?B?T2pHNlVPTVhRTkpDellZK0xEOWlGZlphYU5TcEpORVFwbE1ieFhWeVQwS2x6?=
 =?utf-8?B?SDFyNmRHYmZoNTZ5amxiMnZOeFBKMnFKUCtPaEFjZlRqOStOUnYrcHhjL09j?=
 =?utf-8?B?bTRaNnl5VlpxeDlBMmQwY2h2UEovbEYvRlBrY1FSU09zcHVxdFUrZ2VMektO?=
 =?utf-8?B?YW4yaU84ZFAyaFhHUEtncGFhb0J1TTZWMXFCamYwMC9weDJwbkR2ZDFlL3pP?=
 =?utf-8?B?VHBnSFM4TTdTTWZNU0hEQ3VBK3d0cEdoNHZsdVRFL1lvZmJCSHdKRkR6eHFz?=
 =?utf-8?B?REVEVW55QXBEa01UMzdlRHhHUmdXUDJqaWFUbENMeC9KTWZNV3RMa1lrajBC?=
 =?utf-8?B?Q2R4ZERZajVkK2VNUjhOUGVqblhURWN2ZStoN3g1V0R1V3A2Y01BNWJsSjJs?=
 =?utf-8?B?TC8xUmR1WHp4SDFxd0lYWUxzbTdKY3FQOGM2cC8zcjVNcHlvNVlCbWN3ckRJ?=
 =?utf-8?B?M3VlQ0hyK0EyWTRwU0UrbGI2b1JTckpzaWRpUE1nWTIwTFJGa1ZKVWxqaUxD?=
 =?utf-8?B?eU8xb1hDNWgzMTBaK1RqUHoxUUUrbUZOMHRkSjhJb3pLNXBNR3l1RDA1MlJQ?=
 =?utf-8?B?TDkyaGkzdWJRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7682.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aXBudDdNU2pDOVZFcCtOUWpSKzM5bk91N1lIbnIwS1VTeUV5QnFzUEo0TTRx?=
 =?utf-8?B?YnVtZ3dzR3I5dWIvWFNjUnFreFdCY3M1bXFPSkdwZWNsUVNERGh1cG9aay9u?=
 =?utf-8?B?ZHVSclo4dHpXOXl6R2p5Ukx0cGM0QVlQVnhJTmlkTlZVTkpnbC9za3d5WWRM?=
 =?utf-8?B?K1J2bm54ak9zWmVFK1lqQzI2MHRWTHNFa0tIWkNzRDNoRDZHdXBydUlkc0lu?=
 =?utf-8?B?YVh6THZ3b2liTFdmdHFQSFFHM3gvR09sR295b21CKzl2dlJzYndYSG93eG93?=
 =?utf-8?B?RW9xa1RyWElXUEVlbTlRSU1Md0dhaUg3Z0ZodHBQc0lPYk1UZTdFTHIyNWRK?=
 =?utf-8?B?YkVFUlFIZWV3K2V3bWlZc3RMd0t6dmEwdHEycGJkelJwd003cXNmTFVOQkNk?=
 =?utf-8?B?NFVQbUNmQWRvVy9jZ1pySUt4Z1M1dHhZTVpDVmd1SDVDZ1Bsc3d0YjQ5YlFP?=
 =?utf-8?B?R3dPd0k1Wi9tT2xvcDhpUVFubG8zcko3cGZKcjlsUHRHVFB0Sk1zbjd0dlRt?=
 =?utf-8?B?dTFCR3d1UCs1ZEc3ek1hWWVRcVBjd1BBVGQzUitQcDlnajNBOFBYRzVWTVBG?=
 =?utf-8?B?TDRpRStZbmo2d0RFdTRrdTBrb1dTMjROd1BDT2xlRDIvMjBtcFBKOVVtK1lp?=
 =?utf-8?B?T2FUSWZwd0RFaVVOYTFrckltQ2lWL2I2WjdGU2wzN2x4ZkpJaUxTSlNRTmVH?=
 =?utf-8?B?VnBndk1oa1F3Q2NUdFBQQmZiYkFjWlBxYkgwWllvWUJaZG9LelRPTGU0WEJD?=
 =?utf-8?B?alRMN1Y5Nkp5dngwQnVrMUcxdnJZOEJYZHBLNnlvalBkRTMvbDdueXlpT0tj?=
 =?utf-8?B?NFoxdld5bnd6aDA1Um1MVTFZSDl6Yk1NaENDbzRobmtXNi9FVERLTjVoc0kz?=
 =?utf-8?B?Q0NtMTVMWEEvV0xJRCsxUnJyQWQwS2g1YjFqa3Qwd29ENGJKZmVkcWdsS253?=
 =?utf-8?B?UldHdFhQMjRVUXIva0JBZG15VXB1SFZKMkNZaXkwMkp0YjFGTHNwNDFyT3Rx?=
 =?utf-8?B?VmVOTTB3ZWcyM2tQT0paai9lVGt5SzRkVW91UUZFU3FUSXJieU9vaTVReHFO?=
 =?utf-8?B?cml0SEZJVTlhSm04T29pRzlQNHQ4K0k3RC9WK2hGS0lBTm5VdlJNTXNvd0xG?=
 =?utf-8?B?ZEh0TE9jazRCM3BJaHF6ZDV0WEY1Z1U0a01pZzk3STloVzdGUDFYZ3ZKTlhO?=
 =?utf-8?B?aDJnMTQ5Zkg4eGNlazlGb1ZaUWNoQkpydk9LQnlhODJNVm15djhYeHM3d2RO?=
 =?utf-8?B?NVJKbkFHeWhkeUN5bXBCdm9QRnRwVDg3VVlmZmtuSENrUVRRTjlkNUlZR2Y0?=
 =?utf-8?B?bG1Rang3NXlvci9Oa2RGSmRlTUVPaktQVi8wQnhQQUM3SFE4U2czYVQyY2lw?=
 =?utf-8?B?UWQyUmtxZERsRDRqTDlxK1NIYUo2dmFSQ2dJaTdaTVJONG91WTlINkcrUU5L?=
 =?utf-8?B?cklxZzB6ajJTOGxjSjhrOXVwOEhFVFhmamlMRGQ2LzM4aUh2ckFaMTA4YmtZ?=
 =?utf-8?B?ZEl4aU9OYU96YUtRM3hTN1NYZ1N4aTlMR3FGd1hpaFdoYUkxTGNrcWp6dEJh?=
 =?utf-8?B?UVNidVFYZCsvdk9NNDc4RmFmVVN3SHdBNFBiTW13VlA5bGRBMEgvWWJkOXRX?=
 =?utf-8?B?QjBmQm1ySFJCYVZQU3dBN3k4YjVSNXBicWpQSHNmR1NudWNtZGJDZzNDTC80?=
 =?utf-8?B?QlMzSEIwM2xEZ0p6T2ZsVVhLUEMzTU5nbGNFNWdxRFBEYVZYQk41R1VTR3dL?=
 =?utf-8?B?cHpTcE45QkxnZDdVSVBweWpnd3gxVUtpYmJOazdQZzN5MVI1SDVJUDY1RFpK?=
 =?utf-8?B?L3ZxbC9QWTVsMWxFZFh2bktUR0lSNzgzLzZoZkZkcjRDVTFIaTNCR3RHT21H?=
 =?utf-8?B?aHR5VWdhcVpLR3E4VHZJTDhwQ3RGUDQzbW9jK2xRMXRSV3pJQlJhMG5Sdjly?=
 =?utf-8?B?Yys5RE9XNnNBZzI4ZmtzcnFqSUY5eEQyOVVJQVhLcnVnaFZjYVljZlNVM2lm?=
 =?utf-8?B?R3RsellPZTZIeG9jdHZvcHRvZDNvTE4xSnVsdktIaE94K3kyZ3AvR0xzd1ll?=
 =?utf-8?B?R1BzaUFUMzNhQ01PR2RsUFF6SXlhdUVMRWY1U0tUS2NhZG9xVVN5YTduVjFU?=
 =?utf-8?B?SVMyaUU0dlh2cVJGVktwUzdpVWV5clBMcDdKM05oVDQwR0NJdVlIcFBKY0lp?=
 =?utf-8?B?V3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8091C3E595083E43B8C2137B7F5F6AB0@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8e710e3-93b3-42a0-8680-08dd861bbdb9
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2025 06:13:06.1546
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mPlnPdOXj72pqrL7LX044/+VE2K3i5pXzwZKTUo1XgfoWy6yMS9C8JnT6NR67Pzx7qUlG0bBhhC18y8yqntzJanqeVAxHkFVKJnZnqyz3ew=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR03MB8794

T24gRnJpLCAyMDI1LTA0LTI1IGF0IDE3OjI4ICswODAwLCBKYXNvbi1KSCBMaW4gd3JvdGU6DQo+
IEFkZCB0aGUgY21kcV9tYm94X3ByaXYgc3RydWN0dXJlIHRvIHN0b3JlIHRoZSBwcml2YXRlIGRh
dGEgb2YgR0NFLA0KPiBzdWNoIGFzIHRoZSBzaGlmdCBiaXRzIG9mIHRoZSBwaHlzaWNhbCBhZGRy
ZXNzLiBUaGVuLCBpbmNsdWRlIHRoZQ0KPiBjbWRxX21ib3hfcHJpdiBzdHJ1Y3R1cmUgd2l0aGlu
IHRoZSBjbWRxX3BrdCBzdHJ1Y3R1cmUuDQo+IA0KPiBUaGlzIGFsbG93cyBDTURRIHVzZXJzIHRv
IHV0aWxpemUgdGhlIHByaXZhdGUgZGF0YSBpbiBjbWRxX3BrdCB0bw0KPiBnZW5lcmF0ZSBHQ0Ug
aW5zdHJ1Y3Rpb25zIHdoZW4gbmVlZGVkLiBBZGRpdGlvbmFsbHksIGhhdmluZw0KPiBjbWRxX21i
b3hfcHJpdiBtYWtlcyBpdCBlYXNpZXIgdG8gZXhwYW5kIGFuZCByZWZlcmVuY2Ugb3RoZXIgR0NF
DQo+IHByaXZhdGUgZGF0YSBpbiB0aGUgZnV0dXJlLg0KPiANCj4gQWRkIGNtZHFfZ2V0X21ib3hf
cHJpdigpIGZvciBDTURRIHVzZXJzIHRvIGdldCBhbGwgdGhlIHByaXZhdGUgZGF0YQ0KPiBpbnRv
IHRoZSBjbWRxX21ib3hfcHJpdiBvZiB0aGUgY21kcV9wa3QuDQo+IA0KPiBGaXhlczogMDg1OGZk
ZTQ5NmY4ICgibWFpbGJveDogY21kcTogdmFyaWFibGl6ZSBhZGRyZXNzIHNoaWZ0IGluDQo+IHBs
YXRmb3JtIikNCj4gU2lnbmVkLW9mZi1ieTogSmFzb24tSkggTGluIDxqYXNvbi1qaC5saW5AbWVk
aWF0ZWsuY29tPg0KPiAtLS0NCj4gwqBkcml2ZXJzL21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5j
wqDCoMKgwqDCoMKgIHzCoCA2ICsrKy0tLQ0KPiDCoGluY2x1ZGUvbGludXgvbWFpbGJveC9tdGst
Y21kcS1tYWlsYm94LmggfCAxOCArKysrKysrKysrKystLS0tLS0NCj4gwqAyIGZpbGVzIGNoYW5n
ZWQsIDE1IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9tYWlsYm94L210ay1jbWRxLW1haWxib3guYw0KPiBiL2RyaXZlcnMvbWFpbGJveC9t
dGstY21kcS1tYWlsYm94LmMNCj4gaW5kZXggYTNkOTRmMWViMWEzLi5iMTg4MDg4NTU2ODAgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvbWFpbGJveC9tdGstY21kcS1tYWlsYm94LmMNCj4gKysrIGIv
ZHJpdmVycy9tYWlsYm94L210ay1jbWRxLW1haWxib3guYw0KPiBAQCAtMTAyLDEzICsxMDIsMTMg
QEAgc3RhdGljIGlubGluZSBkbWFfYWRkcl90DQo+IGNtZHFfcmVnX3JldmVydF9hZGRyKHUzMiBh
ZGRyLCBjb25zdCBzdHJ1Y3QgZ2NlX3BsYXQgKnANCj4gwqAJcmV0dXJuICgoZG1hX2FkZHJfdClh
ZGRyIDw8IHBkYXRhLT5zaGlmdCk7DQo+IMKgfQ0KPiDCoA0KPiAtdTggY21kcV9nZXRfc2hpZnRf
cGEoc3RydWN0IG1ib3hfY2hhbiAqY2hhbikNCj4gK3ZvaWQgY21kcV9nZXRfbWJveF9wcml2KHN0
cnVjdCBtYm94X2NoYW4gKmNoYW4sIHN0cnVjdA0KPiBjbWRxX21ib3hfcHJpdiAqcHJpdikNCj4g
wqB7DQo+IMKgCXN0cnVjdCBjbWRxICpjbWRxID0gY29udGFpbmVyX29mKGNoYW4tPm1ib3gsIHN0
cnVjdCBjbWRxLA0KPiBtYm94KTsNCj4gwqANCj4gLQlyZXR1cm4gY21kcS0+cGRhdGEtPnNoaWZ0
Ow0KPiArCXByaXYtPnNoaWZ0X3BhID0gY21kcS0+cGRhdGEtPnNoaWZ0Ow0KPiDCoH0NCj4gLUVY
UE9SVF9TWU1CT0woY21kcV9nZXRfc2hpZnRfcGEpOw0KPiArRVhQT1JUX1NZTUJPTChjbWRxX2dl
dF9tYm94X3ByaXYpOw0KPiDCoA0KPiDCoHN0YXRpYyB2b2lkIGNtZHFfZ2N0bF92YWx1ZV90b2dn
bGUoc3RydWN0IGNtZHEgKmNtZHEsIGJvb2wNCj4gZGRyX2VuYWJsZSkNCj4gwqB7DQo+IGRpZmYg
LS1naXQgYS9pbmNsdWRlL2xpbnV4L21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5oDQo+IGIvaW5j
bHVkZS9saW51eC9tYWlsYm94L210ay1jbWRxLW1haWxib3guaA0KPiBpbmRleCBlMTU1NWUwNmU3
ZTUuLjgyMjk1OGY5MjEzNSAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9saW51eC9tYWlsYm94L210
ay1jbWRxLW1haWxib3guaA0KPiArKysgYi9pbmNsdWRlL2xpbnV4L21haWxib3gvbXRrLWNtZHEt
bWFpbGJveC5oDQo+IEBAIC03MCwyMyArNzAsMjkgQEAgc3RydWN0IGNtZHFfY2JfZGF0YSB7DQo+
IMKgCXN0cnVjdCBjbWRxX3BrdAkJKnBrdDsNCj4gwqB9Ow0KPiDCoA0KPiArc3RydWN0IGNtZHFf
bWJveF9wcml2IHsNCj4gKwl1OCBzaGlmdF9wYTsNCj4gK307DQo+ICsNCj4gwqBzdHJ1Y3QgY21k
cV9wa3Qgew0KPiDCoAl2b2lkCQkJKnZhX2Jhc2U7DQo+IMKgCWRtYV9hZGRyX3QJCXBhX2Jhc2U7
DQo+IMKgCXNpemVfdAkJCWNtZF9idWZfc2l6ZTsgLyogY29tbWFuZCBvY2N1cGllZA0KPiBzaXpl
ICovDQo+IMKgCXNpemVfdAkJCWJ1Zl9zaXplOyAvKiByZWFsIGJ1ZmZlciBzaXplICovDQo+ICsJ
c3RydWN0IGNtZHFfbWJveF9wcml2CXByaXY7IC8qIGZvciBnZW5lcmF0aW5nIGluc3RydWN0aW9u
DQo+ICovDQo+IMKgfTsNCj4gwqANCj4gwqAvKioNCj4gLSAqIGNtZHFfZ2V0X3NoaWZ0X3BhKCkg
LSBnZXQgdGhlIHNoaWZ0IGJpdHMgb2YgcGh5c2ljYWwgYWRkcmVzcw0KPiArICogY21kcV9nZXRf
bWJveF9wcml2KCkgLSBnZXQgdGhlIHByaXZhdGUgZGF0YSBvZiBtYWlsYm94IGNoYW5uZWwNCj4g
wqAgKiBAY2hhbjogbWFpbGJveCBjaGFubmVsDQo+ICsgKiBAcHJpdjogcG9pbnRlciB0byBzdG9y
ZSB0aGUgcHJpdmF0ZSBkYXRhIG9mIG1haWxib3ggY2hhbm5lbA0KPiDCoCAqDQo+IC0gKiBHQ0Ug
Y2FuIG9ubHkgZmV0Y2ggdGhlIGNvbW1hbmQgYnVmZmVyIGFkZHJlc3MgZnJvbSBhIDMyLWJpdA0K
PiByZWdpc3Rlci4NCj4gLSAqIFNvbWUgU09DcyBzdXBwb3J0IG1vcmUgdGhhbiAzMi1iaXQgY29t
bWFuZCBidWZmZXIgYWRkcmVzcyBmb3INCj4gR0NFLCB3aGljaA0KPiAtICogcmVxdWlyZXMgc29t
ZSBzaGlmdCBiaXRzIHRvIG1ha2UgdGhlIGFkZHJlc3MgZml0IGludG8gdGhlIDMyLWJpdA0KPiBy
ZWdpc3Rlci4NCj4gKyAqIFdoaWxlIGdlbmVyYXRpbmcgdGhlIEdDRSBpbnN0cnVjdGlvbiB0byBj
b21tYW5kIGJ1ZmZlciwgdGhlDQo+IHByaXZhdGUgZGF0YQ0KPiArICogb2YgR0NFIGhhcmR3YXJl
IG1heSBuZWVkIHRvIGJlIHJlZmVyZW5jZWQsIHN1Y2ggYXMgdGhlIHNoaWZ0IGJpdHMNCj4gb2YN
Cj4gKyAqIHBoeXNpY2FsIGFkZHJlc3MuDQo+IMKgICoNCj4gLSAqIFJldHVybjogdGhlIHNoaWZ0
IGJpdHMgb2YgcGh5c2ljYWwgYWRkcmVzcw0KPiArICogVGhpcyBmdW5jdGlvbiBzaG91bGQgYmUg
Y2FsbGVkIGJlZm9yZSBnZW5lcmF0aW5nIHRoZSBHQ0UNCj4gaW5zdHJ1Y3Rpb24uDQo+IMKgICov
DQo+IC11OCBjbWRxX2dldF9zaGlmdF9wYShzdHJ1Y3QgbWJveF9jaGFuICpjaGFuKTsNCg0KU29y
cnksIEkgcmVhbGl6ZSB0aGF0IEkgY2Fubm90IHJlbW92ZSB0aGlzIEFQSSBkaXJlY3RseS4NCg0K
SSBuZWVkIHRvIHJlbW92ZSBpdCBhZnRlciBubyBvbmUgdXNpbmcgaXQsIHdoaWNoIG1lYW5zIFtQ
QVRDSCB2NSA4LzE5XS4NCkknbGwgZml4IHRoaXMgaW4gdGhlIG5leHQgdmVyc2lvbi4NCg0KUmVn
YXJkcywNCkphc29uLUpIIExpbg0KDQo+ICt2b2lkIGNtZHFfZ2V0X21ib3hfcHJpdihzdHJ1Y3Qg
bWJveF9jaGFuICpjaGFuLCBzdHJ1Y3QNCj4gY21kcV9tYm94X3ByaXYgKnByaXYpOw0KPiDCoA0K
PiDCoCNlbmRpZiAvKiBfX01US19DTURRX01BSUxCT1hfSF9fICovDQoNCg==

