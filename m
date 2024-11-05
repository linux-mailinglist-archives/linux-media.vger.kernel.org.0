Return-Path: <linux-media+bounces-20824-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1B69BC386
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 04:02:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C0C581C21BF3
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 03:02:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07A1674421;
	Tue,  5 Nov 2024 03:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="a7Hi5zvN";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="oge3HDN7"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C54D225A8;
	Tue,  5 Nov 2024 03:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730775738; cv=fail; b=p8ghT+r6sETuOvAERhUihTY36PKfMCBJL5C927umg31gtHv/zR5qyZirQTFmKyMfJUjmP2OUvq1ORbUROhA3QkQxYA+IKv+uAQc4sfnZY9sMKpgetqRkmck7Z4qDqlNkPQfjcMqaPdEGiAwPJ3B1al2GA1u7Ecs+EFgEHFiZlo4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730775738; c=relaxed/simple;
	bh=EVFqfaAusD1qUN0Ynz8ihty0cVesxpzys2/pIiiqZRs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Pwa2iTDhRjMRiI7MPJ4BQItuJ+ly2SYQKW/PqZncjt56J3VK9poUFclkOHV5LRTeyJnIBw7T2fnwQMJ019HOb34GkQXOWNC0lNFgRzM6BqOGShwrkInzdk5/SETyN8dDt1M1K2f6W0mwNfz19lZw5nJ+fvdBNR1AA7EhoAG9T/w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=a7Hi5zvN; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=oge3HDN7; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 54b92aaa9b2211efb88477ffae1fc7a5-20241105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=EVFqfaAusD1qUN0Ynz8ihty0cVesxpzys2/pIiiqZRs=;
	b=a7Hi5zvNb3qOKsQdunVLXYXyyId5ZTeb86GJnOxqopd7gjrkh1vyGf5aqBcEnppYoBMcqP5qiVRePLc8MiMGOWNNYdV86YTHiIdJTeUBaIjj5FmSYByXNpTrGpkgS3EeYm91mPSt4zqs+uTg8mfGsGVE+s8Stc0e7YrIt4YfQ/A=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:01c3388b-a624-4d65-b93b-c5739b495978,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:bcbdb148-ca13-40ea-8070-fa012edab362,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 54b92aaa9b2211efb88477ffae1fc7a5-20241105
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1229760174; Tue, 05 Nov 2024 11:02:02 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 4 Nov 2024 19:02:01 -0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 5 Nov 2024 11:02:01 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pCdf0Hhh303X70UDTEanCSY5O0GqO2GsNQiTyfTZ5jnW8Pero/7oQoYgu6+DwLR4a22x51ivIGWWaOdrQ0t4Yij5j9e++LTZrNuksapLD21p/bKpVvSRnFfugZvzoadngrfO7zWRllW0ojXvEH8WwT350lEvtyCwemAZkDBRI9sD0iLSqhDvk8vNaOcZjlTi56W0YhvoRlgWw6OeDME6G8cts0rCw9SbkiKcoWkCgdl2aLwjjyzc/nuQzpHx+ZQ9EM3W+bMbmUHW6J2cEwjcmeNzgby+jW51lcKboPaJtqAFGE2T6I0nT2lAN48PHHuLxQsln1lyahJSXSJQlaESuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EVFqfaAusD1qUN0Ynz8ihty0cVesxpzys2/pIiiqZRs=;
 b=fsdDl9uR5Z2UJwBl2dSuMYEeLn0SfQML6zv7JpAcKqWgWfIDFTe3CGZz4yTnQ8UZjXZaM2YP0lrS4/lack5Ce34ObbXAGfOThPkEh/Nh0FgIuhn5FtPg7jDpmoE+A3e5M1Bb0McLE4xlz1seSPTtQ2a7uQcng8xeADJOOWb2wxTY6yJZyKK883h2G+gS612J/gdyoOZo2b1J0YC52/4XHYHxcP0OVh9i6I5QBtnpIxbv7vYbidCPrPPvsceukVGiFbgnjOERZTgBXR1fFLP6QXXsnW6PF6jxj4V3dmuOwvPcClkieUrRFPUSmu6kZH4haJEUVaS2affzlwlIuHFfgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EVFqfaAusD1qUN0Ynz8ihty0cVesxpzys2/pIiiqZRs=;
 b=oge3HDN7jE32A+YrEEt1uQkWO7yuT/Nvq/D4J9faHDo0+p7OlVOyP8lthDKhjDx8uNDf+CrtXnZoW4ttYeDMNQAx8LRKEiUFu2wuAVMpZP2RaGKHYgM1ebHtyFLckNDf6YbDGqqYqlUYft59r3mpzDqy8rnA6OwOTl5ss296WOk=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEYPR03MB7890.apcprd03.prod.outlook.com (2603:1096:101:178::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 03:01:58 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8114.028; Tue, 5 Nov 2024
 03:01:58 +0000
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
Subject: Re: [PATCH v1 04/10] media: platform: mediatek: add isp_7x cam-raw
 unit
Thread-Topic: [PATCH v1 04/10] media: platform: mediatek: add isp_7x cam-raw
 unit
Thread-Index: AQHbGj2G8utVn4Ab5UaBggOzyqwWS7KoKauA
Date: Tue, 5 Nov 2024 03:01:58 +0000
Message-ID: <570ed4780c37bc456cf3d4509207335738b52c08.camel@mediatek.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
	 <20241009111551.27052-5-Shu-hsiang.Yang@mediatek.com>
In-Reply-To: <20241009111551.27052-5-Shu-hsiang.Yang@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEYPR03MB7890:EE_
x-ms-office365-filtering-correlation-id: 0c6f6822-d01b-45b6-1976-08dcfd463674
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WGw4M1AvRUczVHVuc2ZOcHpPaHAxTkVtU3pidHNSQWJUN0x3cklLL09EbU1J?=
 =?utf-8?B?VGhNd1FiZFpwWXM0bWptNGRNTTdiZElDZEpZTWNJSHVqQk5xV2VEaUVsdHdJ?=
 =?utf-8?B?Skk2OWZ1QVpXWWxMekxpa0NBT0lQVkFZM1kxNHVROHY2SE9VSHBqNFNjVUNE?=
 =?utf-8?B?NXBoZi9EazVORGttT3UrSWVzTEZvMExMWHNFSUU4RWJPV1JNUjBtdGhMcFkr?=
 =?utf-8?B?QkhrdllHSFNjUVVqZ2M5QUJhWGhwTGVzT3NST3pmR3dtM0djUUVLMHJPOGpB?=
 =?utf-8?B?eStxQlhTWWhTVFNkbzM4OVQrQ3FmTjZCNFU1ZXUzenB3aVhWa3pzVnpabTkv?=
 =?utf-8?B?ZGxjckw2MmU0L0VjTDByVm14ckw4QzdHNXU3YzdPSUhKREpOQkJnZCt3V3Ur?=
 =?utf-8?B?ejlod3BTb29UMmZNSVEwalJjcXZEUXRhVFBFSUdnY2JtRTJaOFNuWSswYkFB?=
 =?utf-8?B?empETncvS3dSdDNNOWhSMGlUd1hDbFJBZWsvZ0VjWmg5bFVRUXdEVHdFMWR2?=
 =?utf-8?B?b0Nvb3V5SXZ0S0l1TFBHSHFTUFN5VDNlQitMWGt0NHFzUkFxeDcvcE5KcFla?=
 =?utf-8?B?c2w5dmZXNzRkQzJjQzFzdHhvMjg4T1ArMmxMdG1FRmtMamx1cXh2UXViMWRt?=
 =?utf-8?B?ekNZZFcrTlljQkNBZytCeG5NWEh4azRDTE4vZlBmakx5SExQNXZBQXZqMkRU?=
 =?utf-8?B?M3VjciswL3Q2ZlhMV2c4S3NIb2RRTmdMVkJhSEhWUXoxK3NrcnBsWFZ3WGFH?=
 =?utf-8?B?V1RNa1hOaDU4Y1FZTCtjRUtGRjlFTXNwL0lpMzUyUDNuWEdoaWhZbVlucE5i?=
 =?utf-8?B?NVhFTXZqT3hIQitpZTh4YlZ3OCtEMi9Kc2s4a3JOWkFNQUNIMUZCd29ySXRR?=
 =?utf-8?B?bEVPY25QWWJ6UVFVNkdyN2V3VmhhdytKYkRPbHNvYVB4SHpVSjZKK1ZxamYx?=
 =?utf-8?B?MDhMU0JuaStWOHZPNFNLSXJMZDNqc2hxRmxsSENYU0ltdDgrd2hXZ29pTUpn?=
 =?utf-8?B?M1Ric2ZhanhsaGxPSWpGWGRMU3Q3bXF4Wk9kMEY1ZHVBY1Y3UmwvM080cGJh?=
 =?utf-8?B?U1ZwVGgvdmk3dERUZ0ZkL0N4UHlEUWcvOVAwd09ZdzYzTHF3cW9kdnJZdVhw?=
 =?utf-8?B?dVI5R3RncUcrbC8rZmVSNjdWSlVHbzVUUjhpZ2xQMkRBQXZIQXpselo1NG80?=
 =?utf-8?B?VGIwbU4rYiszVlFqM085RUtramFyam9sY1NCQnJuSDRqV3ozNy8zdkZNOUNm?=
 =?utf-8?B?NkdDeC84SlFMUDh0bE9icEJqaUIxMmF6R1FGOFFKQno5K3VLWjRsN0ZkcHdq?=
 =?utf-8?B?Nm1nSEhOWlBQbXF2Z2Z6YU40VzlVMXBBZ3loVEVRMEpMbldNK0JzQUN0YVdO?=
 =?utf-8?B?SVorSkRoaitES3NCSWxXU2U0WVNSWnRKMUhhdlo3eENHUFYxOHFaVlFwQzRS?=
 =?utf-8?B?OWhUcEZmcjZucCtVSnZ6YTgvUlRuL1B6Q2lQM0N0aVI1MzV5T3Job3NBcWp5?=
 =?utf-8?B?cEF2ek5NaSt5T1pVaTlqOEUweG8xZ1B2V3BtNzFQNURIWkZtQXc0bVZaR1BP?=
 =?utf-8?B?VCtqK3ZsOEFkS3hBbnN6NkYrY24zTmdTN0RtWEFrcWRwT0t5TnM1Sm9TMmhh?=
 =?utf-8?B?RFN3ZGVWYkNQK1NaL1U4M3g0UEZvUUxtN0QwYXRxRHpHUm1FMmVYS2haeUdF?=
 =?utf-8?B?dDBGZzU5WXZsMndXYWZ3Y2kyUDA2cWdpS3hib1c3S1hPYnUvV0xzM0tDSkda?=
 =?utf-8?B?N0xpNERSZzFWQ01wUjNEV0xvanVBUGxHR1BFVStvaVdZOE9RWTlxdSs2UklF?=
 =?utf-8?Q?to0g//Zj+1d1GY7pI6Hr/Ec52m6m+f425azZQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dDAvcnpraGkydmgwbnA2d2JQTXl0b0dtNTYyVFZ4Y2prTnkza1FVd0FXS3Vj?=
 =?utf-8?B?cm1SQ2lMV0QvcTRueW12bUdMcUl4ZDhjd2wwblhDN3NRT2tBdTZ5eEVQK2pU?=
 =?utf-8?B?TUQ5SjFIcHgyR29kSHBxWSs1YkdWNFhiS1N4K290UHVrR2UyYlpVMHJRb05x?=
 =?utf-8?B?ek5RemV1aUQwZWpNUVJOMlc5Lzk0akFTbkN0UjI5ZW0vTXR0QW1zRjQ4VXdr?=
 =?utf-8?B?OEZNWHRweHYySzRKaHZtY1dSK2ZSKzI3R0VVRFo4bTNMaERXTG9JSFhQaHg5?=
 =?utf-8?B?RlluSWxtMGIvd29yRmFzQ2hkRE9FdFRuanB4UmxXSzF0dXBWUXRFUTg0TlVu?=
 =?utf-8?B?a09jalB4SlBVSzljUWdzNXluN3BJc2F3MmVzUVVhb3FFeUhKa25wWTU1RGlT?=
 =?utf-8?B?aUlDbUFJc1Z1dGFwRWRtQXNBNUozdTNQOHk3bGZaUWx2TUZDQ3Z0WWxnZVZD?=
 =?utf-8?B?Qis5WXA2cHpManVBR0RrV0pEUUxsV2F5ZldpSWU5a2JXOFZyL0dtK1hWTGxO?=
 =?utf-8?B?czZNaE5wVlYzeXJIeXJ6b29udndlUGRKNUJEZjEyVTdBN3o5WUpSU3dnRWxH?=
 =?utf-8?B?WGZQSy92L1l2T2VCZmJPanZDT2dqSWU5VTJ0M0J4TTF2T1F3WkpIRWM3S0VY?=
 =?utf-8?B?bmorM0M1UnNNbjN6ckFWQ2JPVy85elZyQm5saGV1UXZKNXJYdXROV29tYkRL?=
 =?utf-8?B?dnlxTEFKYWpuYm1pb3Z3SWVtWURRbkZqN0FLdTJad2lJZDRQSXlPQWdMRmk5?=
 =?utf-8?B?ZElucGc5RDZLYXM3SFNUYVFjL09BdHFUOFF6ZVFTRGswZGxKSmloY1BMMzRM?=
 =?utf-8?B?dm9IOGxOVE10UDBPcS9la0pmV0JIYjJiN3dhOHI3SEJld3hIbkhUdTMyNENY?=
 =?utf-8?B?ZFViOXd3K1hCS3kwaWY5SUgzMVpwSHUrZm9iVWFEbzlvaUtvaWxWZmFsNGdj?=
 =?utf-8?B?UEZOUVFVdjBkOHNJNTdCWXBxTHFVMGZrZGpHalFHa2g4TjdndVJKbG1BYTVk?=
 =?utf-8?B?WkRMVEhGWlpCRkFNaldVZ0QxM01FOTY4NjVuT0FHZFI2TkNwcVBQRjJPUklt?=
 =?utf-8?B?eUo3eUtHSVorMkhlZFlVclhZRTVmVXA5S2ZkWTMyMW9xSWVPTW14QkNrVnNk?=
 =?utf-8?B?c2I3RGVrMTk2NXA2MjVSTkpoeHBCZ0VkdVJ4SURoNDMwcnRPbXhBZVQ0eG1i?=
 =?utf-8?B?VlZCQ2lCd0t6VFhYUDIxWWpHUUxWRlpick5tQVd3TWN3WkxFa2RQVGVhVGJ0?=
 =?utf-8?B?R3lqOWt4K3dxS2JFRytwendGZk91eGFpRTJCMmJRZzVKbWo0akIzOVRFNE80?=
 =?utf-8?B?T1p1WUxCTlo2WFV4Z1RSUEhGelR2SjBGSmljaUpNZitJRFRJYkcwb0hVbURY?=
 =?utf-8?B?MVY3ODM0SXB3a1BCK1NRV2ZtKzIxWXV1UjkyZS9UZFlsYStLd2lUYkVPQmhr?=
 =?utf-8?B?czVxcktBRU56eFVCQlI3cENLRTVWWmVGQVUvN2htbnNpaitUZVhsVVE5WFIx?=
 =?utf-8?B?aUw0Y3hZcDVqbnZkVmdzTzI4S2Q3aFBubGhOaW9Ib013a0ZYVE5IVzZ0amJ6?=
 =?utf-8?B?MHgzcm1qRUZuYmgxVSsxTDhVdlZyUWFzL0dBTDhqYVpZNVpCU3BlZ1NHbjZR?=
 =?utf-8?B?bGlRL2JaYi91TXhzV3JicE1jYkpVZlVXT2dPZ1hDbVRvbXI1ZWVjSjVnT1ZT?=
 =?utf-8?B?NlJkVDRQNy80SWtBMElHbk1KbHN5V29MMzFSVjAyNW5xQldWMjdRdFZWUHhQ?=
 =?utf-8?B?UXQ3MkcyazhmUEJhYUdkSjM0Y3UrVjVtN0Jkb0N5aTVGSGVSU0psNkRnaGVk?=
 =?utf-8?B?SGR6eFRmYU1Tbng2cWlYa3JYRHVWcGh1MnNnUnI3VEJKeGVBaHVBbHg0bWdO?=
 =?utf-8?B?eGNsZ0p2bys4OWhPeVlsUEk2WW1ZdFlENENiaUt6aTlURzlKajk0bWx2VGp4?=
 =?utf-8?B?Z29TOW5CcWp4WkQxM08yTEFjN2hjcXZJMnBYQTY1WFJ4MDA1blNjUkJacGR6?=
 =?utf-8?B?K2FTcmREc2E0MG8wdU9pSFFVdFZXaE9qOVBBcGtwc1kya1hJbTFLT3JTaXpt?=
 =?utf-8?B?c3B1c1YycUlpR1VOTytZdDM5R1dmUENoMGJuTmV1L0lTd2xick5yZ3dKWnZq?=
 =?utf-8?Q?fyxcMbCRIHj3hDq+zi/otYlwX?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E5DC1D5F8A89EC4CAAD6C6230FEED1DE@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c6f6822-d01b-45b6-1976-08dcfd463674
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2024 03:01:58.2804
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RCQ6mBC1l1Icuuqgjfbaqk3NC+o7kgtn44x7mOf9ipxfSNGyZvLhZY4iLOuTKKIEzu+ipBetiQ3U85D+8dK8AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7890

SGksIFNodS1oc2lhbmc6DQoNCk9uIFdlZCwgMjAyNC0xMC0wOSBhdCAxOToxNSArMDgwMCwgU2h1
LWhzaWFuZyBZYW5nIHdyb3RlOg0KPiBJbnRyb2R1Y2VzIHRoZSBJU1AgcGlwZWxpbmUgZHJpdmVy
IGZvciB0aGUgTWVkaWFUZWsgSVNQIHJhdyBhbmQgeXV2DQo+IG1vZHVsZXMuIEtleSBmdW5jdGlv
bmFsaXRpZXMgaW5jbHVkZSBkYXRhIHByb2Nlc3NpbmcsIFY0TDIgaW50ZWdyYXRpb24sDQo+IHJl
c291cmNlIG1hbmFnZW1lbnQsIGRlYnVnIHN1cHBvcnQsIGFuZCB2YXJpb3VzIGNvbnRyb2wgb3Bl
cmF0aW9ucy4NCj4gQWRkaXRpb25hbGx5LCBJUlEgaGFuZGxpbmcsIHBsYXRmb3JtIGRldmljZSBt
YW5hZ2VtZW50LCBhbmQgTWVkaWFUZWsNCj4gSVNQIERNQSBmb3JtYXQgc3VwcG9ydCBhcmUgYWxz
byBpbmNsdWRlZC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFNodS1oc2lhbmcgWWFuZyA8U2h1LWhz
aWFuZy5ZYW5nQG1lZGlhdGVrLmNvbT4NCj4gLS0tDQoNCltzbmlwXQ0KDQo+ICtzdGF0aWMgaW50
IG10a19yYXdfb2ZfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiwNCj4gKwkJCSAg
ICBzdHJ1Y3QgbXRrX3Jhd19kZXZpY2UgKnJhdykNCj4gK3sNCj4gKwlzdHJ1Y3QgZGV2aWNlICpk
ZXYgPSAmcGRldi0+ZGV2Ow0KPiArCXN0cnVjdCByZXNvdXJjZSAqcmVzOw0KPiArCWludCByZXQ7
DQo+ICsJaW50IG5fY2xrczsNCj4gKw0KPiArCXJldCA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyKGRl
di0+b2Zfbm9kZSwgIm1lZGlhdGVrLGNhbS1pZCIsICZyYXctPmlkKTsNCg0KWW91IGRvbid0IG5l
ZWQgcmF3LT5pZC4NCkkgdGhpbmsgZWFjaCByYXcgY291bGQgd29yayBpbmRlcGVuZGVudGx5Lg0K
RWFjaCByYXcgaGFzIGl0cyBvd24gJ3N0cnVjdCBtdGtfcmF3X2RldmljZScgY29udGV4dCBkYXRh
Lg0KSXQncyBub3QgbmVjZXNzYXJ5IHRvIGtub3cgd2hpY2ggb25lIGl0IGlzLg0KV2hlbiB5b3Ug
dXNlIGRldl9kYmcoKSBvciBkZXZfZXJyKCksIGl0IHdvdWxkIHNob3cgcmVnaXN0ZXIgYmFzZSBz
byB5b3UgY291bGQgaWRlbnRpZnkgd2hpY2ggcmF3IHByaW50IHRoaXMgbWVzc2FnZS4NCg0KUmVn
YXJkcywNCkNLDQoNCj4gKwlpZiAocmV0KSB7DQo+ICsJCWRldl9kYmcoZGV2LCAibWlzc2luZyBj
YW1pZCBwcm9wZXJ0eVxuIik7DQo+ICsJCXJldHVybiByZXQ7DQo+ICsJfQ0KPiArDQo+ICsJaWYg
KGRtYV9zZXRfbWFza19hbmRfY29oZXJlbnQoZGV2LCBETUFfQklUX01BU0soMzQpKSkgew0KPiAr
CQlkZXZfZXJyKGRldiwgIiVzOiBObyBzdWl0YWJsZSBETUEgYXZhaWxhYmxlXG4iLCBfX2Z1bmNf
Xyk7DQo+ICsJCXJldHVybiAtRUlPOw0KPiArCX0NCj4gKw0KPiArCWlmICghZGV2LT5kbWFfcGFy
bXMpIHsNCj4gKwkJZGV2LT5kbWFfcGFybXMgPQ0KPiArCQkJZGV2bV9remFsbG9jKGRldiwgc2l6
ZW9mKCpkZXYtPmRtYV9wYXJtcyksIEdGUF9LRVJORUwpOw0KPiArCQlpZiAoIWRldi0+ZG1hX3Bh
cm1zKQ0KPiArCQkJcmV0dXJuIC1FTk9NRU07DQo+ICsJfQ0KPiArDQo+ICsJZG1hX3NldF9tYXhf
c2VnX3NpemUoZGV2LCBVSU5UX01BWCk7DQo+ICsNCj4gKwkvKiBiYXNlIG91dGVyIHJlZ2lzdGVy
ICovDQo+ICsJcmVzID0gcGxhdGZvcm1fZ2V0X3Jlc291cmNlX2J5bmFtZShwZGV2LCBJT1JFU09V
UkNFX01FTSwgImJhc2UiKTsNCj4gKwlpZiAoIXJlcykgew0KPiArCQlkZXZfZXJyKGRldiwgImZh
aWxlZCB0byBnZXQgbWVtXG4iKTsNCj4gKwkJcmV0dXJuIC1FTk9ERVY7DQo+ICsJfQ0KPiArDQo+
ICsJcmF3LT5iYXNlID0gZGV2bV9pb3JlbWFwX3Jlc291cmNlKGRldiwgcmVzKTsNCj4gKwlpZiAo
SVNfRVJSKHJhdy0+YmFzZSkpIHsNCj4gKwkJZGV2X2VycihkZXYsICJmYWlsZWQgdG8gbWFwIHJl
Z2lzdGVyIGJhc2VcbiIpOw0KPiArCQlyZXR1cm4gUFRSX0VSUihyYXctPmJhc2UpOw0KPiArCX0N
Cj4gKw0KPiArCS8qIGJhc2UgaW5uZXIgcmVnaXN0ZXIgKi8NCj4gKwlyZXMgPSBwbGF0Zm9ybV9n
ZXRfcmVzb3VyY2VfYnluYW1lKHBkZXYsIElPUkVTT1VSQ0VfTUVNLCAiaW5uZXJfYmFzZSIpOw0K
PiArCWlmICghcmVzKSB7DQo+ICsJCWRldl9lcnIoZGV2LCAiZmFpbGVkIHRvIGdldCBtZW1cbiIp
Ow0KPiArCQlyZXR1cm4gLUVOT0RFVjsNCj4gKwl9DQo+ICsNCj4gKwlyYXctPmJhc2VfaW5uZXIg
PSBkZXZtX2lvcmVtYXBfcmVzb3VyY2UoZGV2LCByZXMpOw0KPiArCWlmIChJU19FUlIocmF3LT5i
YXNlX2lubmVyKSkgew0KPiArCQlkZXZfZXJyKGRldiwgImZhaWxlZCB0byBtYXAgcmVnaXN0ZXIg
aW5uZXIgYmFzZVxuIik7DQo+ICsJCXJldHVybiBQVFJfRVJSKHJhdy0+YmFzZV9pbm5lcik7DQo+
ICsJfQ0KPiArDQo+ICsJLyogd2lsbCBiZSBhc3NpZ25lZCBsYXRlciAqLw0KPiArCXJhdy0+eXV2
X2Jhc2UgPSBOVUxMOw0KPiArDQo+ICsJcmF3LT5pcnEgPSBwbGF0Zm9ybV9nZXRfaXJxKHBkZXYs
IDApOw0KPiArCWlmIChyYXctPmlycSA8IDApIHsNCj4gKwkJZGV2X2VycihkZXYsICJmYWlsZWQg
dG8gZ2V0IGlycVxuIik7DQo+ICsJCXJldHVybiAtRU5PREVWOw0KPiArCX0NCj4gKw0KPiArCXJl
dCA9IGRldm1fcmVxdWVzdF90aHJlYWRlZF9pcnEoZGV2LCByYXctPmlycSwNCj4gKwkJCQkJbXRr
X2lycV9yYXcsIG10a190aHJlYWRfaXJxX3JhdywNCj4gKwkJCQkJMCwgZGV2X25hbWUoZGV2KSwg
cmF3KTsNCj4gKwlpZiAocmV0KSB7DQo+ICsJCWRldl9lcnIoZGV2LCAiZmFpbGVkIHRvIHJlcXVl
c3QgaXJxPSVkXG4iLCByYXctPmlycSk7DQo+ICsJCXJldHVybiByZXQ7DQo+ICsJfQ0KPiArCWRl
dl9kYmcoZGV2LCAicmVnaXN0ZXJlZCBpcnE9JWRcbiIsIHJhdy0+aXJxKTsNCj4gKw0KPiArCWRp
c2FibGVfaXJxKHJhdy0+aXJxKTsNCj4gKw0KPiArCW5fY2xrcyA9IGRldm1fY2xrX2J1bGtfZ2V0
X2FsbChkZXYsICZyYXctPmNsa19iKTsNCj4gKwlpZiAobl9jbGtzIDwgMCkgew0KPiArCQlkZXZf
ZXJyKGRldiwgImZhaWxlZCB0byBkZXZtX2Nsa19idWxrX2dldF9hbGw9JWRcbiIsIG5fY2xrcyk7
DQo+ICsJCXJldHVybiBuX2Nsa3M7DQo+ICsJfQ0KPiArDQo+ICsJcmF3LT5udW1fY2xrcyA9IG5f
Y2xrczsNCj4gKwlkZXZfaW5mbyhkZXYsICJjbGtfbnVtOiVkXG4iLCByYXctPm51bV9jbGtzKTsN
Cj4gKw0KPiArI2lmZGVmIENPTkZJR19QTV9TTEVFUA0KPiArCXJhdy0+cG1fbm90aWZpZXIubm90
aWZpZXJfY2FsbCA9IHJhd19wbV9ub3RpZmllcjsNCj4gKwlyZXQgPSByZWdpc3Rlcl9wbV9ub3Rp
ZmllcigmcmF3LT5wbV9ub3RpZmllcik7DQo+ICsJaWYgKHJldCkgew0KPiArCQlkZXZfaW5mbyhk
ZXYsICJmYWlsZWQgdG8gcmVnaXN0ZXIgbm90aWZpZXIgYmxvY2suXG4iKTsNCj4gKwkJcmV0dXJu
IHJldDsNCj4gKwl9DQo+ICsjZW5kaWYNCj4gKwlyZXR1cm4gMDsNCj4gK30NCj4gKw0KDQo=

