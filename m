Return-Path: <linux-media+bounces-29481-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFB4A7D9F3
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 11:42:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A9E7D16E74C
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 09:39:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67C671AAE28;
	Mon,  7 Apr 2025 09:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="LyTxDlSs";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="RRZh+PXi"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2074D156230;
	Mon,  7 Apr 2025 09:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744018762; cv=fail; b=E50wvWSp7H/aG1iUL5qicMTdfk+72Sek93WKsLQ0x+s41WrIMW48JGgfLEmIj+yrQuLx3YfR9xyG0a0nWqwDF43r03sD50aMhGoHOzKw1u7x3x4pNs2XxjQbIfQ839wbS0lSWyqj+kaROMeByxIR15Pl2TKt59w14acJwzSk4iU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744018762; c=relaxed/simple;
	bh=s+p9wZFrJW7z4I8ABmTuNpQMNKgyMsqFfMrSBJAGUb8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RUyK0kCH8UQb5YVp0nSmjJitnyZmjzrFyM/LjZ9KdPHMvLb3CHLvfIRFgRYH+wnjr53PNlKBDf2ZDvOBTUdaWWF7jJRqzoW4YLaU+M4drDmQSUZPmqgk0o4PhLYCm/3Y0Ij37wyAxxmvjSffA0yvFMaKWkB8KZ/c0/O0wolVDLk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=LyTxDlSs; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=RRZh+PXi; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 29273310139411f08eb9c36241bbb6fb-20250407
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=s+p9wZFrJW7z4I8ABmTuNpQMNKgyMsqFfMrSBJAGUb8=;
	b=LyTxDlSsI3Lp0dh92IqQaaYXXxooZU4P8yACdvfD3ZG51TcVdljSUSknC3IFTLYyGYMZxVotdwTlMmpvUHIbWXKRVTg00tSexf73ZvbQO2Xb4M6N1oDgVbna3/JF5/tXzNUTUXpLQgpIh0HMqDQ8JOBtO4DqL7BU3U6il25ig6c=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:e181c172-3994-438c-9f11-3f19e133655a,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:c0b4094b-a527-43d8-8af6-bc8b32d9f5e9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 29273310139411f08eb9c36241bbb6fb-20250407
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1737682840; Mon, 07 Apr 2025 17:39:11 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 7 Apr 2025 17:39:10 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 7 Apr 2025 17:39:10 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=niPrYyebetZzdu+PVMPT/NT5Xrk1srIl9vgstBulNuB6A7ntcvD6r1YoJr+yEobio/SAftsabvslWXY4U8SiT+3bRdHjJZkv4UpGdSomjslY4Ice+IdJS8HikaQasYOkXesjI8qWdXuFe2MF6VZ3TTc4mapg07Qevxs4s1fb8eEXF1IrPLaonBDLBexbqO1Ekl2/RRheWAiIYm0RKFPEP6XwW6x6unSA26Zra1Bd/WdvYexS09ch3WZaH0iFOZ5hIlGbE70KMTCI26Y58yPdj59ku0DxU5tq02roIeXXXzYhnx2Q0N6ss8l1k6EXTfWuA68lKrIHMXQuXlSA2Xv5UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s+p9wZFrJW7z4I8ABmTuNpQMNKgyMsqFfMrSBJAGUb8=;
 b=eT71vG5sCbSHXDmjlIFoTAipLb1nMux4bnp+SKBGgOX3R9YGtR3zfT5ysTKiCFkAwfR70pBi/8rNPo8TRDmxA/fP0cG1yZuLTnAEv210XoNqQF0wZ+ZX2VL3YNju2x57ufR6JLBhmYOWJzvTi93VlNHtbmx4UAoK4FFXykKKp/UHjaoteW+XyetpYIXR7tXSqIqPDit0CMSMBhFH/ijqGoXyVIbgD2Pc+h0Xv3N1ypJ35+wKRHhaJAqiaCb19LP+kEAa6vOLK6l7rHYErGTxNy73WIeaqFcMbQPzg7QQNv8cIEuE995ASoVP5Q+geenEbfabA7k8Il7tzsWsCglvow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s+p9wZFrJW7z4I8ABmTuNpQMNKgyMsqFfMrSBJAGUb8=;
 b=RRZh+PXifcTzjj6NNwOBxlKE3387mSb6/lofrVrpxJFuI0BKpzVlPmGi82BsBRRLkf30YUpxfhPrD2EVM0dgNujB4WuKEo13gv3KqGpK4bLag2PgU2s6A2WBUwrhkpNQzqES4o4iYGtJEKoJUq9Kq8brBrUWKLs0GMZXPNqV0v8=
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com (2603:1096:301:b9::5)
 by KL1PR03MB8355.apcprd03.prod.outlook.com (2603:1096:820:10e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.42; Mon, 7 Apr
 2025 09:39:08 +0000
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::7b22:91f6:b76e:161c]) by PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::7b22:91f6:b76e:161c%5]) with mapi id 15.20.8606.033; Mon, 7 Apr 2025
 09:39:08 +0000
From: =?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>
To: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "tzungbi@chromium.org" <tzungbi@chromium.org>,
	"krzk@kernel.org" <krzk@kernel.org>, "robh+dt@kernel.org"
	<robh+dt@kernel.org>, "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"kyrie.wu@mediatek.corp-partner.google.com"
	<kyrie.wu@mediatek.corp-partner.google.com>,
	=?utf-8?B?QmluIExpdSAo5YiY5b2sKQ==?= <bin.liu@mediatek.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [V1,01/12] dt-bindings: mediatek: Add mediatek, mt8196-jpgdec
 compatible
Thread-Topic: [V1,01/12] dt-bindings: mediatek: Add mediatek, mt8196-jpgdec
 compatible
Thread-Index: AQHbYptdE6Xdfd8/hkqjk6TuZ7fyXbMOdsWAgIndMQCAAAGJAIAAJxqA
Date: Mon, 7 Apr 2025 09:39:08 +0000
Message-ID: <595e8af841fae48fd306fd92574d181b75ea843a.camel@mediatek.com>
References: <20250109133513.20151-1-kyrie.wu@mediatek.com>
	 <20250109133513.20151-2-kyrie.wu@mediatek.com>
	 <63a97fdb-f348-4ed7-9d7f-8e47d51a4390@kernel.org>
	 <df3f73ea3ed1f8394beb31a9c9997679eb36f386.camel@mediatek.com>
	 <1dacb76d-c227-4373-93db-4255c3f9ac83@kernel.org>
In-Reply-To: <1dacb76d-c227-4373-93db-4255c3f9ac83@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR03MB6186:EE_|KL1PR03MB8355:EE_
x-ms-office365-filtering-correlation-id: fb234620-fdfb-470a-3177-08dd75b80b61
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WXRGSDl6eEVpak1ZNmtGR3FKZFJTekhCNlBwU3FHdnN4K0JvZ1Nwd0lZY1NU?=
 =?utf-8?B?NGpsaTlTSEMzZkllSzJhQmtaL2czNDNFSWhCVUkzVW11Z2hKQmdhaU9UMDFG?=
 =?utf-8?B?d3h3RkV0d096QjlZZFpadUM4OEZwN0JPMkFyRHhzTGpvemxXN2c1dnEyV0V1?=
 =?utf-8?B?SFlMWk9RV05IVkNlQUVkUVZSRHNYa3hhVStScytxajZSblU1ampHazJXUE9j?=
 =?utf-8?B?YW1jQUM0NGk4NWQzd212M2IxUHN2WWtoN3hQSUZLeUNFaFY0VWZvVmFDK3Bj?=
 =?utf-8?B?cU1CY1VSY1l5ZVRWcDRhR21iU0cvVGtUYlRNWGVUS3czN0x2WmRVSkt4MlEy?=
 =?utf-8?B?SlkraHlTV3Y1MmdqWkgwUEZ2Rk9LOU1FalJlNHQrSXpiYVlWNjFodVBKdzRv?=
 =?utf-8?B?MlVPL2FHdm51VWtOZi9iOG10NGZLRnppQXdTeHhJTHNRSDdGa245SW9nTSsw?=
 =?utf-8?B?MmF4czdFdjFqRVFBajJDdldiSHgxbkVZem9CT1FRNkFKZ2JYNUdFb1U0cWsx?=
 =?utf-8?B?KzU1RTkyV0JpcDZubUZtcjI1dEFMdHByZm5WQmdWV3BnWnJ0MDA1QUJ3eHlF?=
 =?utf-8?B?RFE5S01IRFBHNFlVVWluSkR5aDBaekxMMUI4V3NuR1ArQzlMRksxSTlCNWVN?=
 =?utf-8?B?bHl1b1BZdGpwaWwybVpSUm1nK05EQm5VK0MwVVFtWnRPWll4SG5jbmhlVW1s?=
 =?utf-8?B?RmtyTDc5SFVVVEsxZGd6RzFnV3QvREp0SlpWc1dOeGtVald0MUxFUUtqSld2?=
 =?utf-8?B?VHA2NVlNQ0pSTHNpQ2hnVllmNk1JWkNqUGFpWTBZTW44ZEoxM1JlNjY2dW5n?=
 =?utf-8?B?Nm0ySm4zK2FON3FlT0tFdU81MlVlYXpUYUxNWWRYbFhleitNTXB6MTJqbm1y?=
 =?utf-8?B?cXFwdkZLVUFjaUVHTUVQZUF2R2pkVjRIQ0dYWVh1S2I4MWpERjM0anpFbTZR?=
 =?utf-8?B?eiswTXRCZEx3Y3QxRG9oejhJNGNxcTJZZGFjVWZQQkIrdnlWTHJQUnRTRE9y?=
 =?utf-8?B?cytzcUU1T3NMV3NITndFMnM0eXp1RlRnTGgrS25nM3BnaWNZTUp6b0x1K2lu?=
 =?utf-8?B?UmZwb2J1SEJBNm9oNzlMWDQ0bEJ1N1FDTWFXUVVwTHZvVlh5NzJYMnNod0Zt?=
 =?utf-8?B?R0oxZ1k1Q3ZpcUJoMFRqNFFockcxUG9DanVoYU82VWJPcmR1M2ZiMVlXWVph?=
 =?utf-8?B?ei8rQjk2MlpQbzVsTW9wOGxjTWFKNDY4RzNVQTZsQ0xKTDV5eHFRY1pscHJI?=
 =?utf-8?B?dUFlQjU4YmNKdTNQRnQ4RGlMdGZJTjNFVEJVNzJGZzhhRDRtQ2xKcnZrSmtD?=
 =?utf-8?B?TWRwMWNkdGlWTGlTSnEwZGFKaUUzbGpvV0g5akJxTlhuMnlOOEZDWXRGem9C?=
 =?utf-8?B?d0NNdHlBTTNpbUwrV0xCVTZXNEx6Qld5bENKWDEzYkJybVNLU0J4VUw2SWJh?=
 =?utf-8?B?QVBkMGFOcnMzRlRWeGI3d3hONEErTjFLRjRvdFVYY09hblI4VkRZaGNnNWRI?=
 =?utf-8?B?dCsyc3NIMGtKMHBrSmJzdlJTM1ZibUNSb0htZlgzNnlBQ0k4cjRBVkVmbG1x?=
 =?utf-8?B?cnB1akJvL3JXeVp5L1M2L1MrTzJXZ2hvZk5HZFJnSWZjNnZzdnZNKzVOQ2Rj?=
 =?utf-8?B?ZE10dHlCV0ltRDZjejM1cURPZm9JWEtOUGJZaVhRTGJBNUphZU9LbE82RjJT?=
 =?utf-8?B?VDJsdTE2QkVRSGRHRGRLTnM0VnZIZ0tBemxROHBKKytkd0tJdnNkenVKWVJj?=
 =?utf-8?B?c0h6Yy8xQ0tKaTdwdzE2RWozMUsvK0h4a3BxQUF4d210V0FwaGlaNyswV3Uw?=
 =?utf-8?B?Q3Q4MlpPdjdsZTNvemxsUGxYZVBJelNoSnpIcWpjbldtelBuNGFaeTIyeUUr?=
 =?utf-8?B?SDBZek9qa1J2K1hMRWlQSEJ1U1l6Q2tLR1hVQ3d0aVBpa3phbmNoOGU2eGI2?=
 =?utf-8?B?MUp1bnlWUmR2NUVNZXFDN3J5Y1VQNjJxbDF0ZWt5RU41dkdGOXFSZDNpWHVs?=
 =?utf-8?B?UVpGUnFIandnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB6186.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b3k5ODJ0RjZKeiszeEdnQmdndDhGcG1UY1c3ZzRaT0tDVVQvRmNVMEhmcmds?=
 =?utf-8?B?Ympsbm5ycExLZ3BMQ0FkU2F1RTZTSTdFbFR3VXJDQzh4OWRoNUdYL0UvZ0Jm?=
 =?utf-8?B?bEVXTG5LbHh2VVgxLzczZ21jekJ6aTRoZ2h5dFc4MEtIQ2d3T0p5VGlpd2x4?=
 =?utf-8?B?OVF3OXluTDRQWHRIQWczTVhjSzZRZmlvQW5WQU90Ylh1cUJMeVdSUGppZVlI?=
 =?utf-8?B?WWRZV1FJWlFvR2kwWjI2VWsrWUY0elJpSURXOGs3dEVWdHV1SWVmOWNzbnlR?=
 =?utf-8?B?NHdBNDJ3VzFrS3FNMzNMVHhXbmt4MUxzdDNFSnFhQzNWNkl1MEJPZmoxMzlz?=
 =?utf-8?B?NFBpVll3Q1lpa05mY0hGd2FHMFJGYUEvR2l5Nk1ZekxmRGhaRjhqZUR1UFo5?=
 =?utf-8?B?YTc3V1dkK0d6NkM2cDVxTVIxR1YxU250VUtRV0tnWkhYRHVnVDVmclE1cWx4?=
 =?utf-8?B?bmtIQjZ0Vmh3dE8zV1pSZU52Nmd5My9lTHk3U2xlY2pxRGN4aXV4Ni9obi9G?=
 =?utf-8?B?ZU9EbWhudGd2WE5Ja3k2UlAva2o3WTVYWTRmNE93cVQzVmgrVXdkUnFVeTZ3?=
 =?utf-8?B?MGIrejZPZXZBOXdaR2t0YVVlTzdneVJhSVRsYUIvM1NQVHZTSnJOak83WkFr?=
 =?utf-8?B?Y2RyYzlzZ2J0R0hSdllKZzZrTm8wNk1pbUNUK2pMT0lLUExsQy9OYVhyQzNJ?=
 =?utf-8?B?L0NZb1ExWkRuaXZ1QVVrSkRUTnZ1Tm5TL0xMWU4yMWhiYTBwM3hkTGxZUXNT?=
 =?utf-8?B?a3M1NEtnUFVrNlJZL1k4a1Y5SE1TV0IrQTN3Z0lORi9RbDUzUzlIWlpTY09X?=
 =?utf-8?B?amdnU1ZRY1hFTDJFSlhlRGxDSldWZXl1M3FYNDl5SlY2QjdkejdIdFZ2LytW?=
 =?utf-8?B?N1Rpb1dpVEFJYTBOU3ZQOXlHbHJBNEx2NTVFWDFTNi9CNVlWRFlxUmlJWDN4?=
 =?utf-8?B?aGlsMlpLOGFVbER6eDdkQWhtWlJENkp4Q1VIcldOWTJkSFpSbStNalUxbU9N?=
 =?utf-8?B?UnFzODZhdFl2eUl0blMzUEU2YWJvY2daNGZaN1dPRUJzZjdpZlI3dlF6V1p3?=
 =?utf-8?B?VGg2bnA3V3JWSXU3Q1hoN09zNzkzRE90U3BaVWhxK0I4ajhXbnVtam5sVHZ2?=
 =?utf-8?B?MUprZEtvOCt1SXJVTmR0Q09oZHVWNGtOckh6RnJ1N2R5d3c1Q1BNL2F0WStH?=
 =?utf-8?B?RXNHVllKbFJSTWx2T0Vxa0FlRHpJMU4xVTFVcUpBeVFtL0FrRXFEZ09GbjE1?=
 =?utf-8?B?Ukw0OHN4SVlZY0VNSFNzcnF4VU1wR1NOUzIyRm1CcXNNZjV2RlVnaENXOHdj?=
 =?utf-8?B?cWM3SmEyaG51WkcwQ2tndmlsdGxRajZYdlRCa1RkL0I2bTNST2NqbHRQVFBO?=
 =?utf-8?B?OEhza1BXb29qZWJ6eXpCZ05XMWNOM3lMQ3NONWRRdFBEYnpENU52eDB1R2Na?=
 =?utf-8?B?cDNDQ01xUU92a1RuNUNvNkxlREZSb2YxNy90WUthNGNpTzdlbE5ySFRmZHU5?=
 =?utf-8?B?cU1NYWFrV1hVR05uZFIzZWliNkdDS3N2YWgxNTZVVEoxOXhJN2FyZ3VqWHRl?=
 =?utf-8?B?VWhZbE5UUHhtMFYrRGNUbnlwSWoybFlRNU9jNnlXZDg3VEdOdUhjSERzREVF?=
 =?utf-8?B?U1Y2aHpndWxyZ2tzRDBncU11cXdJb0VZODdkaHpKM1F4ZmhiUmwwNU84T2xw?=
 =?utf-8?B?ajloUDZiTUsvUG5Yb2l2NkQ2SXpKUzdYelZ6emdnWDZ4dC9uNitSRmYxanp6?=
 =?utf-8?B?YXp3VmM4OUMxRnppVGFTNjhvSkJPem0yV0w0NFAvUURMUXNwSWtaSHNLcGVj?=
 =?utf-8?B?UnFlNExxRE03RjgvNEwxTlBuNTZXdDN1bXJRRUdlb3hQRW5uVnlBKy9QcHQx?=
 =?utf-8?B?MWpjdktZOTVsYkZTTjllL0p1UzdUazFnWG1ObU0vaTZuOXhHMVdRWVdGS2k4?=
 =?utf-8?B?RUZIdFBPYWJvQzExZDVHYy90ZjBZdmNHOFlkdndacTRZTG40ZnBOamc2NlJo?=
 =?utf-8?B?OForTTZVQnB2Tkp6TVhYbE9sK1oyaFRJZFA3bFFSZkM5dmV1UDF6UURwSjlR?=
 =?utf-8?B?SW03b2ZZUkR1M283SExJOWs1VXo5UWZPOEdUbGlyc0lDUW9ZSWwvQTBEZ0o4?=
 =?utf-8?Q?30kd4vT2njvoqLliunQiaT2OG?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <79B6F7661E6AB94F9221CC9979199ADE@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB6186.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb234620-fdfb-470a-3177-08dd75b80b61
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2025 09:39:08.1685
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I9iDtfHnh+R4EYP/Y74+q9WFxbXJAoOCkjpF8gR9D60Z+Bd6FsdIa9/PtKyxJR6meN5CdnFmqrJB1H7PeKFG6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8355

T24gTW9uLCAyMDI1LTA0LTA3IGF0IDA5OjE5ICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiANCj4gDQo+IE9uIDA3LzA0LzIwMjUgMDk6MTMsIEt5cmllIFd1ICjlkLTm
mZcpIHdyb3RlOg0KPiA+IE9uIFRodSwgMjAyNS0wMS0wOSBhdCAxNDo1NCArMDEwMCwgS3J6eXN6
dG9mIEtvemxvd3NraSB3cm90ZToNCj4gDQo+IC4uLg0KPiANCj4gDQo+ID4gPiA+IA0KPiA+ID4g
PiAgcHJvcGVydGllczoNCj4gPiA+ID4gICAgY29tcGF0aWJsZToNCj4gPiA+ID4gLSAgICBjb25z
dDogbWVkaWF0ZWssbXQ4MTk1LWpwZ2RlYw0KPiA+ID4gPiArICAgIGVudW06DQo+ID4gPiA+ICsg
ICAgICAtIG1lZGlhdGVrLG10ODE5NS1qcGdkZWMNCj4gPiA+ID4gKyAgICAgIC0gbWVkaWF0ZWss
bXQ4MTk2LWpwZ2RlYw0KPiA+ID4gDQo+ID4gPiBEZXZpY2VzIGxvb2sgY29tcGF0aWJsZSwgc28g
ZXhwcmVzcyBpdCB3aXRoIGZhbGxiYWNrLg0KPiA+ID4gDQo+ID4gPiBCZXN0IHJlZ2FyZHMsDQo+
ID4gPiBLcnp5c3p0b2YNCj4gPiANCj4gPiBEZWFyIEtyenlzenRvZiwNCj4gPiANCj4gPiBUaGUg
TVQ4MTk1IGFuZCBNVDgxOTYgYXJlIGJvdGggbXVsdGktaGFyZHdhcmUgY2hpcHMsIEkgcmVuYW1l
ZCB0aGUNCj4gPiBmaWxlDQo+ID4gdG8gdHJlYXQgaXQgYXMgYSBjb21tb24gZmlsZSwgaWYgSSBk
b24ndCBkbyB0aGF0IGl0IHdpbGwgbmVlZCB0bw0KPiA+IHJlY3JlYXRlIGEgZmlsZSB3aXRoIHNp
bWlsYXIgY29udGVudHMuIElzIHRoaXMgYWNjZXB0YWJsZT8NCj4gDQo+IE5vLCBkbyBub3QgY3Jl
YXRlIG93biBydWxlcy4gSSBkbyBub3Qgc2VlIGhvdyB0aGlzIGlzIHJlbGF0ZWQgdG8gbXkNCj4g
Y29tbWVudCBhdCBhbGwuDQo+IA0KPiBZb3UgcmVzcG9uZGVkIHRocmVlIG1vbnRocyBhZnRlciBt
eSByZXZpZXcsIHNvIGVudGlyZSBjb250ZXh0DQo+IGluY2x1ZGluZw0KPiBhY3R1YWwgbWFpbHMg
aW4gbXkgaW5ib3ggYXJlIGdvbmUuDQo+IA0KPiBJZiB5b3UgZGlzYWdyZWUgd2l0aCBmZWVkYmFj
aywgcmVzcG9uZCBpbiB0aW1lbHkgbWFubmVyLiBJIGZlZWwNCj4gZGlzY3Vzc2luZyBzb21ldGhp
bmcgYWZ0ZXIgdGhyZWUgbW9udGhzIGxpa2Ugd2FzdGluZyBteSB0aW1lLg0KPiANCj4gDQo+ID4g
SWYgdGhlIGFib3ZlIGRlc2NyaXB0aW9uIGlzIGFjY2VwdGFibGUsIEkgd2lsbCBhcHBseSB5b3Vy
IHJlcXVlc3QNCj4gPiBpbg0KPiA+IHRoZSBuZXh0IHZlcnNpb24uDQo+IA0KPiBCZXN0IHJlZ2Fy
ZHMsDQo+IEtyenlzenRvZg0KDQpEZWFyIEtyenlzenRvZiwNCiANCkknbSB0cnVseSBzb3JyeSBm
b3Igd2hhdCBJIGhhdmUgZG9uZS4gSSBmZWVsIHZlcnkgYXNoYW1lZCBhbmQgc2VsZi0NCmJsYW1l
IGFmdGVyIEkgdHJpZWQgdG8gc3RhbmQgaW4geW91ciBzaG9lcy4gDQogDQpZb3UgY29udHJpYnV0
ZWQgYSBsb3Qgb2YgdGltZSB0byBoZWxwIG1lIHJldmlldyBteSBwYXRjaCwgeW91IGNvdWxkDQpo
YXZlIHNwZW50IGl0IHdpdGggeW91ciBmYW1pbHkgb3IgeW91ciBmcmllbmRzLCBhbmQgSSBmYWls
ZWQgeW91IGluDQp5b3VyIHNlbGZsZXNzIGtpbmRuZXNzLiBJIGhhdmUgbm90IG9ubHkgd2FzdGVk
IHlvdXIgcHJlY2lvdXMgdGltZSBidXQNCmFsc28gZGlzcmVzcGVjdGVkIHlvdXIgY29udHJpYnV0
aW9uIGJ5IGlnbm9yaW5nIHlvdXIgcmVwbHksDQp1bmRvdWJ0ZWRseS4NCg0KVGhpcyB3YXMgbmV2
ZXIgbXkgaW50ZW50aW9uLCBhbmQgSeKAmG0gY29tbWl0dGVkIHRvIGltcHJvdmluZyBteQ0KY29t
bXVuaWNhdGlvbiBhbmQgY29sbGFib3JhdGlvbiB3aXRoaW4gdGhlIGNvbW11bml0eS4gSSB2YWx1
ZSB5b3VyDQpleHBlcnRpc2UgYW5kIGZlZWRiYWNrLCBhbmQgSSB3aWxsIGVuc3VyZSB0aGF0IEkg
cmVzcG9uZCBwcm9tcHRseSBhbmQNCnRob3VnaHRmdWxseSB0byBhbnkgZnV0dXJlIHJldmlld3Mu
IChJIGhhdmUgaW1wcm92ZWQgbXkgZW1haWwNCm5vdGlmaWNhdGlvbnMsIGFuZCBJIHdpbGwgc2hh
cmUgdGhpcyBleHBlcmllbmNlIHdpdGhpbiBteSB0ZWFtIHRvDQpyZW1pbmQgYWxsIGRldmVsb3Bl
cnMuKQ0KIA0KVGhhbmsgeW91IGZvciB5b3VyIHVuZGVyc3RhbmRpbmcgYW5kIHBhdGllbmNlLiBJ
IGhvcGUgdG8gcmVidWlsZCB5b3VyDQp0cnVzdCBhbmQgY29udGludWUgY29udHJpYnV0aW5nIHBv
c2l0aXZlbHkgdG8gdGhlIGNvbW11bml0eS4NCiANClNpbmNlcmVseSwNCkt5cmllDQo=

