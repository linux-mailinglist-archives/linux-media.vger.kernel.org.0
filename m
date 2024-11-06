Return-Path: <linux-media+bounces-20968-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E299BDDC8
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 04:48:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D740F284F17
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 03:48:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD670190671;
	Wed,  6 Nov 2024 03:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="vIAeIKyu";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="PhuWeBeZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FDE653;
	Wed,  6 Nov 2024 03:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730864902; cv=fail; b=rSgDZZSs1I4ipJgVRs1nvGCbQ7U0ZQ+8bfKMbJ5oun/PJcScLfhVkSTJgW4ioKxJh2XrYpGo9/DVg0pski2OmbzXi0ObxuKmb4ba1hICPag49CxonsogNvy2ea7sfvonvGTs3gv+YqGTo/P+QTeq2nD7rL4lWFmdBzMHP7LwJxQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730864902; c=relaxed/simple;
	bh=9Jphk5lFKebJ4I/p0d4AUfRC+04fAKyWYcKIhAv8dL0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LaBmm8f/peAp6qJ1ZAbvSnBrrvvTkfeyJOLrPiZO5gqNmk3xoJVbYOCS0rPLdbQL27CpxaSa6ABXtMhUTPK/JSstZ0u/FwwlJKDVNWOaYPaAC69uoLy7ac49lsN2yKblIAiCZhduaV3UNIdX+PLckPktFxGX7STsd5XSam7RvmU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=vIAeIKyu; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=PhuWeBeZ; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: f2c9d0449bf111efb88477ffae1fc7a5-20241106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=9Jphk5lFKebJ4I/p0d4AUfRC+04fAKyWYcKIhAv8dL0=;
	b=vIAeIKyu9hT/pXKyOy+fg7PKTuBfwKtOyyNbCMrShSv8aVfhBGSdUQ7QY/WdLpzkHUHdbqLjZl1OTU3+iiAb7vmwDwUT1+dngNBkYNB4depvY1HoEdEZJJXfR08WQBykr1FqzBrQltFMAADZoCXDDH4b4lh18d9BVmd8gx/j5bQ=;
X-CID-CACHE: Type:Local,Time:202411061135+08,HitQuantity:3
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:ce1c64ec-5d74-4827-a803-a2c849b57c95,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:2d80b01b-4f51-4e1d-bb6a-1fd98b6b19d2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: f2c9d0449bf111efb88477ffae1fc7a5-20241106
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 188880772; Wed, 06 Nov 2024 11:48:13 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 6 Nov 2024 11:48:12 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 6 Nov 2024 11:48:12 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OrzoZbvgG8R9VM6nE5usYjpswrIb11+Ym9ARjn0fcZt+a6xmQCrPeDU86M+Pa1Dgvytz3f4XWamUTjZACTwGaGGDVSael2MccuIN5XVEQqFKXVn98gRQ19jvSvygk6Nur+/H+21HRHbLuVjF0y8gnUf2DLeiPiGXUseweLPEv2JNDb6Errqe4Gdj0VqIV5Qqm4da2QNYNDgiPRudXWIVVFG7+Flwm2gjDx2hj22rKr0JzX45oQWjZhxTZJicoG8TBy9iNLxWN9ZR/P/xs6doZKeI9Ck2iOsKeZE+jJCllS98p8ax72q1IzHVePImuGkCaGuibRg0DlBdcQYkDmROZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Jphk5lFKebJ4I/p0d4AUfRC+04fAKyWYcKIhAv8dL0=;
 b=Z9ziUg/Xg82WHSx1MSbWCIoqtP8dU4yXLs6exHFNQk8DLWHHP0byBhIs2zRXQrTgOkjXVBvTj3oMqGkjManwwhYcFA9uQQwzdRKJS1xjse1+S+m5rA74HylmEuRjffpsxGfPobi+qSNBIJQi7K3/PbBfN6W3fl8Hc2lZv2g5VCic9gCvZoXM+r4nOUmcKyYIhSlfafBvfYJbkBSbdkfucmtV5go/QJRMYfoVc3f/xcwPiitWjtaVTXJO8th31hsJDLZCuRKFv1Ng2IDQS9NsppffD2msUsmlI/p3TGXe9q8gQRGmNnwSbf2oBc2EUMLH2iG22QEfPYPnxQ2E5+yAvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Jphk5lFKebJ4I/p0d4AUfRC+04fAKyWYcKIhAv8dL0=;
 b=PhuWeBeZ9SR6t7XDlozsE3ZXRTXtmFu+SKidiRM/7zogdXUMQCqwIRdxVW0+/QSK6Oi4FRlsZi8YQh9B1inC1VTkyuVAeFzLxIWlhG/mrNApKKSYcQTOS9tsXyGfI1e4vXLoycFNztaDq0BztSUFNFB/05egliqjPBRE3dSP+rU=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB7962.apcprd03.prod.outlook.com (2603:1096:400:462::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Wed, 6 Nov
 2024 03:48:08 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8114.028; Wed, 6 Nov 2024
 03:48:08 +0000
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
Subject: Re: [PATCH v1 06/10] media: platform: mediatek: add isp_7x utility
Thread-Topic: [PATCH v1 06/10] media: platform: mediatek: add isp_7x utility
Thread-Index: AQHbGj2JaAd/ufwz/0W0Edv5eKs5YbKpyOaA
Date: Wed, 6 Nov 2024 03:48:08 +0000
Message-ID: <617f31522bf0bc5975d1c6d0bb04e14ef3f45236.camel@mediatek.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
	 <20241009111551.27052-7-Shu-hsiang.Yang@mediatek.com>
In-Reply-To: <20241009111551.27052-7-Shu-hsiang.Yang@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB7962:EE_
x-ms-office365-filtering-correlation-id: feedb231-c64e-42ba-5d6b-08dcfe15d420
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RTdkVkxMTklHdE5rOXRWdDNScWxPaXVDSnpDeUFlSWliUk1aYmRoL3BPdjNy?=
 =?utf-8?B?c1hkMDdUS3NwM2FiWVdwQ09GanlmTWhTUng0V21uSTlSTk41NGRqL0VpRlNL?=
 =?utf-8?B?djlUZnNURzFXUnovc1hhSFlxaWVULytkZER6aW5MM0x2QmxFSlFzMzZQUDJa?=
 =?utf-8?B?R3I5eGpaZ0h4VHI0R1BGRWlaMlAyVlFMbzRIMmNRZndyZ2I2NUZsQ2xzYkZG?=
 =?utf-8?B?UGxWK3VicUpJbG4wTGtEb2ZUNnBXNWR2cmJiSjczQUJpejRQQnVTUnllci9a?=
 =?utf-8?B?T09FSzI2ODYrY3VuNUFFZmNUMW5tTmtHQTVsclJ1TlZsRGc2SVhyU2JqUzd5?=
 =?utf-8?B?eGorM2pTQjU1OENoWURLZ2E3T2dQY00zV0xPeHhqSll6YjB1dU5lek11TmRR?=
 =?utf-8?B?ZWp5V3BnMHJoZWU2SU5iQlNLUXllbmVETVdUcDBmSU9KdHNZempUSzdoRUpu?=
 =?utf-8?B?NWIrWENLemxMQ3hEVUNQMlNHVXdqKy9CbXJmakFVUDlBUzVhUFRJRG1PUUMv?=
 =?utf-8?B?U2hJZ2tRRFNtRWZrYktkWjNQYWdFNzE5OERjR0pVQ2QvQnpDN1hxeVlmUTRI?=
 =?utf-8?B?clJYOHRlZFpFQzRxcEZrbkYxeGFleWk3ODlIamdTOGRuQTg1SCt4aUcwRTV5?=
 =?utf-8?B?NnZWQ3ZnNjBDZjF6MzFaRnRkMCtkWXZCZU40SnR1QkdqL2xUb2ZwZnl1Ukdi?=
 =?utf-8?B?L1gzVDg3TExIdzgwWGgxYUhNc2tFOUczamE5NDJKN01QQ3Avc2xPK3FOQ0pG?=
 =?utf-8?B?a05haVhNeHExSFhHd0EvQ3FyVTJMUnhvVUtwZVh4Z3JqdHByL3BWTjRPQkMv?=
 =?utf-8?B?Q20vSElLZE1MYUxvTEZPaDAzN0xXTXYzejN0U1A0R3ZUUDQyMHRXbjY1L1V2?=
 =?utf-8?B?b0MwM3l5eHcycXpENnJvbEhPblI2NktFbTNwaHhWWDNIM1lSR2ZaUTcwbXNm?=
 =?utf-8?B?QWU0SzRVNkZTL0xRTWNhTHFTY04wVk5EcVBoWW9BNUVRcHozQ2Z0V213Z2Mv?=
 =?utf-8?B?b1ZwZGpzOTZ2eE5INHNWUEw1QUwxSEg3TEQ2NmwvaVpVTHpjYzhvU3RXMlgr?=
 =?utf-8?B?N29jZFVKSFp1Y2hGajN1ZzVmMktWTFNUMktHZGhKcXZteGQxKzgyNXFhVVd5?=
 =?utf-8?B?blFpYVZhN0NxNFVhYUJSRFB3aWxtY2tBS24vVncvT2dGdkxYWVF2VDBkc1Ri?=
 =?utf-8?B?WnhaTW5WdVhUZ093YzFOZW5XbzB5Y2JBUHNOR0VUbU5Nc3pveDR4b0hkTVds?=
 =?utf-8?B?Z1k4c25GUmhzNTQ3WGY1L2ZhMVZZL05qY3hnNFBTR2VsVjI5bkFVc1Q5V3dP?=
 =?utf-8?B?dTcxanEzRFVWNFBjM2lndUkrR1ZLUVFnaDkzYVVDamQ4TVd1MVA5T1p2OTBO?=
 =?utf-8?B?KzBHcmx2eU9OdzI5cFFNT0ZnMm95K1BYSnFrMk5ocGpPNW11aW03dTh5eCt1?=
 =?utf-8?B?TmJrckRMMTN2dDRReUp1dGEvdU11OS9zajhUdk1oMXZscVhocXFYbGd0c3NU?=
 =?utf-8?B?N3p5YTVmTUhuL3FwOXFDNGJzNFVnTnVXWU9IL293cmg5QnVqZVY4M0E3Y2My?=
 =?utf-8?B?TTdLT3dmMGkxUzFjRVhpSWQ3a1o0dlJwTk1LQ2VQY05SUUxxSzFHU05WSyt4?=
 =?utf-8?B?MjJGZ2Izd25xZHhuSW1JZ1dxVnB2UnFsb245WjJTc2E2OUVja3RIS3dJMk91?=
 =?utf-8?B?WUZUV20vQmh4VUpnRWlNRytZeXU2Q1hvRjRDMjhNNVBHajM0OWxKQU5Id3Fv?=
 =?utf-8?B?ckw4ZXJ6VGJjdDJyM0NZVzlDSm5nYmxJUnk4OEVaQ25yU0pFRWRlWkJaemFy?=
 =?utf-8?Q?srtiUw/L9yDTYJG0CuURR3ZyWK8y7XHeRh/Bo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q3NOM2dGaTRuTDVQSEx2NW84aW0rL0FwNFFobTFNMXU4OU9ZdFhtUnF6SHly?=
 =?utf-8?B?ZXRYdnJydVlxdnVMZmRTdTU4azBLMzZkbDNtYnRwalB5TzVUTVQxTGFYOGd2?=
 =?utf-8?B?d1B4TSsvOHZpZ3hoWStOZ1cwVjAyV2hEWDF5VFJhQlVEcnI1bldKUFcrSVdu?=
 =?utf-8?B?Z3VUMFZrT09RUnhuc3lLSzRkbkVaWXVmeUhVOHFaczJoYm50am9aTWkwNDQv?=
 =?utf-8?B?RDFMNDF3SzB6ckJWbCtJeVNaZTk3dW9Pak1EempTcFc4YlYyLytOQ2NzTVBt?=
 =?utf-8?B?TUNEY25Mb09pVEd5QjlRM0lMVis4YXBhQTFSZEdoSUZpeFljUE5OSTR4VU9G?=
 =?utf-8?B?R0ZPWWlEYTZtajRkUGpVd3hSZWFUVWhMNmlnWmp1QVJlZ1dVeE5odmpHMVJs?=
 =?utf-8?B?Z05EY2FjSGxPSXJUcTcxSzhQR0Rrc0JvSnNDRjI3ZE4yTWMyWWVuN2I1QW5a?=
 =?utf-8?B?SlFWeVErSVBqVytEV1krZFBRdk4vNi9WVytmdEYrbFRUVjA2bEY1UHUrTUtC?=
 =?utf-8?B?b0UycmIzTEVmdVRNRktCNXFaSmRlNnh1NEd2amJNWVh4YkQ0L1BwOER6dzFx?=
 =?utf-8?B?Rks4Sk1WN2NkUld0aFJqZng2TGVKSVRWL2RDOXBGQk85bTFCT1VtZFFmbkk4?=
 =?utf-8?B?Qzk2Zk9XOHFCejUyMFRuNkxJNk55S2NXUlg1SWRqam84dUEyY1dxVXFaM3R2?=
 =?utf-8?B?Y014aEJjZVlFNjlpT2ptc0N4UWFlRmRyZmFRcUgzRGZrdThjdHF5QjhJQlFk?=
 =?utf-8?B?dzJRY1k3bjNLelN2WVZWSEZZTy9HTUpvSXozb0RPTDR4cmdEcDhjaWJFdnRC?=
 =?utf-8?B?OVFHNDdGaE9wd0JTVGVsekFzbFhWaHRCZUxJdTNPLzFTOVorQUNvbk4vMmJQ?=
 =?utf-8?B?L1VPQmxaT0VWWk1SVXRxM2ZLa0Vrb1dHTVM5bGd3WUlIQWVZTnZRTzNCMnFE?=
 =?utf-8?B?aEJnVjVGYVVEcFpYbVY3MTdmOWJOZUtFTXFnTWFkU05Zc2JqYzN2c1JnTmRs?=
 =?utf-8?B?SlN4SHZvQm41NDN5by80b0RTUHFtOFVsSmlma0JqMzJENlE2dUZCekc2MWtr?=
 =?utf-8?B?dXgycGNHWGVDUlVuWmgyWmRNYnlqMWZLMUZ5VGJzTXdpME0xck03ZlM0L25l?=
 =?utf-8?B?akI5L1F6VVlTNjd6UHlxYUVuVFBXVFJBZVkxRHZaM1E3RVBSRkNCQkRNbVVC?=
 =?utf-8?B?WllUbzVBVE5BeC9XNWNpeGdMQTZiRWV6YWUxT0VBazhLVUZMZUhGQ0VCWEhY?=
 =?utf-8?B?ZWc4UytjWjZLdEQ1U0dpVElNSmJNSnMrdzJRb2FnTGNrcWZhT0Jnam1MeW5H?=
 =?utf-8?B?QXJueGMxSnBwN1l0UXlURGZsUXo1NjRJSWxpcFRHbGR3R1NlS2pnOUtFVDlL?=
 =?utf-8?B?SElnY0xjdzZDcmQycDZBZlVEbnozQnQ4bnFxZHJSNTQ0cCttNEtZWXJWSUo2?=
 =?utf-8?B?MUUzRXlyVlFhMVZBNEZJSWpCZDJnOTlIYnJsd3ZybldLaUtKcnN6dTFpT2FB?=
 =?utf-8?B?Vm40Zk1LeFl3RUtwSTJXMDRrcnlNSkoyWHB5a1BGaU5INmZsTU9xN0hacmhp?=
 =?utf-8?B?UjIwQ1JNU0lvcHRsWWZjWkhFMm9BanJsczFLWUxpSmYwdW9EOW9UT0xTUC8x?=
 =?utf-8?B?V0JGQmVlcjY1V0lIZUQ5bllYYUdjVUgxbityR2h6U3ZGR05CaTVSYkppRzRt?=
 =?utf-8?B?aERLZTJFS3JtRTlkdUtLZ2ZyQUxScWFKazhmb1dwRFRoYWpZOWJpZmw1WVVV?=
 =?utf-8?B?dFpER01sUzltN1pGYXUxSUlsL1Erc3FKMTZ4L2wwaEw4Um1tVmZKSml3bk16?=
 =?utf-8?B?aEwxNnRXOHN3aFp5YktJYWovYy9zWXZ5V2JtRG1ST2dhV1ZZU2NaL1Q5WEVi?=
 =?utf-8?B?S096dUNjbUdRWkMwVWtuQWdjRkFwcktMQVN2NStBekpTZ3FzWjQrcHRLQ05N?=
 =?utf-8?B?Y2hVb2lqOHhrMHZzZmdGMEtOWFlYM0M5dXRHdTZyZ1hrNlR5ZGxIUzIvWTZl?=
 =?utf-8?B?dGJ4M29TT0x5WitUVk8zRTBEWEFtZ1dycmk2ZG8xSVNDVnp1U1AzSkcySDVI?=
 =?utf-8?B?OGptZm1uaGZYcWwvU1FaRzlwYTBqVG9oVUpac1V4Nm9QL2R5aFZGdnF3anFk?=
 =?utf-8?B?Q251Qk1Zd0NlTHY3dXk5aFRIUmVRdnFtakliM3BuK0lCc2Z5TUpKOWlYcTJY?=
 =?utf-8?B?NUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BFB630A0C779854FB0C979C95F2A4DEE@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: feedb231-c64e-42ba-5d6b-08dcfe15d420
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2024 03:48:08.6394
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FnAVPRM9nhd4CL4Kj+z0jjjLxmdwuZi/T8aMLPNMyQlnamoY09Of1IemtZKPpqQWgmPUIJBb7O6+UoCqW2aKdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7962

SGksIFNodS1oc2lhbmc6DQoNCk9uIFdlZCwgMjAyNC0xMC0wOSBhdCAxOToxNSArMDgwMCwgU2h1
LWhzaWFuZyBZYW5nIHdyb3RlOg0KPiBJbnRyb2R1Y2VzIHV0aWxpdHkgZmlsZXMgZm9yIHRoZSBN
ZWRpYVRlayBJU1A3LnggY2Ftc3lzIGRyaXZlci4gVGhlc2UNCj4gdXRpbGl0aWVzIHByb3ZpZGUg
ZXNzZW50aWFsIHBsYXRmb3JtIGRlZmluaXRpb25zLCBkZWJ1Z2dpbmcgdG9vbHMsIGFuZA0KPiBt
YW5hZ2VtZW50IGZ1bmN0aW9ucyB0byBzdXBwb3J0IElTUCBvcGVyYXRpb25zIGFuZCBTQ1AgY29t
bXVuaWNhdGlvbi4NCj4gS2V5IGZ1bmN0aW9uYWxpdGllcyBpbmNsdWRlOg0KPiAxLkhhcmR3YXJl
IHBpcGVsaW5lIGFuZCByZWdpc3RlciBkZWZpbml0aW9ucyBmb3IgbWFuYWdpbmcgaW1hZ2UNCj4g
cHJvY2Vzc2luZyBtb2R1bGVzLg0KPiAyLkRNQSBkZWJ1Z2dpbmcgdXRpbGl0aWVzIGFuZCBidWZm
ZXIgbWFuYWdlbWVudCBmdW5jdGlvbnMuDQo+IDMuRGVmaW5pdGlvbnMgb2Ygc3VwcG9ydGVkIGlt
YWdlIGZvcm1hdHMgZm9yIHByb3BlciBkYXRhIGhhbmRsaW5nLg0KPiA0LklQSSBhbmQgU0NQIGNv
bW11bmljYXRpb24gc3RydWN0dXJlcyBmb3IgbW9kdWxlIHN0YXRlIG1hbmFnZW1lbnQgYW5kDQo+
IGNvbmZpZ3VyaW5nIElTUC4NCj4gNS5NZXRhZGF0YSBwYXJhbWV0ZXJzIGZvciBjb25maWd1cmlu
ZyBpbWFnZSBwcm9jZXNzaW5nLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogU2h1LWhzaWFuZyBZYW5n
IDxTaHUtaHNpYW5nLllhbmdAbWVkaWF0ZWsuY29tPg0KPiAtLS0NCg0KW3NuaXBdDQoNCj4gKy8q
IENBTVNZU19SQVcgMHgxYTAzICovDQo+ICsjZGVmaW5lIE9GRlNFVF9PQkNfUjFfUl9TVU1fTAkJ
CQkweDExNzgNCj4gKyNkZWZpbmUgT0ZGU0VUX09CQ19SMV9SX1NVTV9ICQkJCTB4MTE3Yw0KPiAr
I2RlZmluZSBPRkZTRVRfT0JDX1IxX0JfU1VNX0wJCQkJMHgxMTgwDQo+ICsjZGVmaW5lIE9GRlNF
VF9PQkNfUjFfQl9TVU1fSAkJCQkweDExODQNCj4gKyNkZWZpbmUgT0ZGU0VUX09CQ19SMV9HUl9T
VU1fTAkJCQkweDExODgNCj4gKyNkZWZpbmUgT0ZGU0VUX09CQ19SMV9HUl9TVU1fSAkJCQkweDEx
OGMNCj4gKyNkZWZpbmUgT0ZGU0VUX09CQ19SMV9HQl9TVU1fTAkJCQkweDExOTANCj4gKyNkZWZp
bmUgT0ZGU0VUX09CQ19SMV9HQl9TVU1fSAkJCQkweDExOTQNCj4gKyNkZWZpbmUgT0ZGU0VUX09C
Q19SMV9BQ1RfV0lOX1gJCQkJMHgxMTk4DQoNCk9GRlNFVF9PQkNfUjFfQUNUX1dJTl9YIGlzIHVz
ZWxlc3MsIHNvIGRyb3AgaXQuDQoNClJlZ2FyZHMsDQpDSw0KDQo+ICsjZGVmaW5lIE9GRlNFVF9P
QkNfUjFfQUNUX1dJTl9ZCQkJCTB4MTE5Yw0KPiArDQoNCg==

