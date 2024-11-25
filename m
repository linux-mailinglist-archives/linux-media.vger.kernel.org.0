Return-Path: <linux-media+bounces-21923-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 084169D7B91
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 07:34:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D72D162AE5
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 06:34:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EAC416CD35;
	Mon, 25 Nov 2024 06:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="WC0Q2XZD";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="P5dujAWR"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491FC2500DE;
	Mon, 25 Nov 2024 06:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732516485; cv=fail; b=p5iPf4+SAwOa5DzcfF69Czl/ugW5cHSZGN+3Yu6CG9P1qkoyFtauTPlktWjTzab4eZVVmQ5miykEmg4bkERJGU5AKG9h18KGEbUfLHw+tJ4FrK84obNMKTSVLPSh1uPTWmbxGqHu37RlfrKbIvvDbapwJ+peNCixsogwuziCtGA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732516485; c=relaxed/simple;
	bh=iPfYtCAOOR647UmXPq5zp5NfB7M7XhvRCkxehl+g6n8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KvmJNKmMz3WUtXgC3sQNkv5UQ6sR8F3J4KDe8j4dkTNcRtYLv/sMexpfoYZOHi72JNB319w9rrN3itjIiCAdcFl62hK/LMdL3dHzkOOE7pcYnpG279ixZzMn93UmsdP1dgUxztOyi3V7Fv25QkeMD23Vi3IFr2yVDIruN4S0k2Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=WC0Q2XZD; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=P5dujAWR; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 5884bf7aaaf711efbd192953cf12861f-20241125
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=iPfYtCAOOR647UmXPq5zp5NfB7M7XhvRCkxehl+g6n8=;
	b=WC0Q2XZDLxJEsM+0scR5nDl9HtqyJw2z5eug+JcFw1mGhzlqi50AvD1ONN9fc5B2AHzS+8Lnlk6Sjc2Yp573rJIhbXv8EJgLvQLPZ/AERjevVAhccgwKPAI6ZLN48SoAt4B3IYyHnwHwqKGNUXJMEuYfi32SmP4KRPoad3krmyw=;
X-CID-CACHE: Type:Local,Time:202411251354+08,HitQuantity:4
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44,REQID:265e36d7-71fc-4666-a652-c65c7bb8e650,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:464815b,CLOUDID:07507223-634f-4016-85ba-2d63e55c9400,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 5884bf7aaaf711efbd192953cf12861f-20241125
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 505826266; Mon, 25 Nov 2024 14:34:39 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 25 Nov 2024 14:34:37 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 25 Nov 2024 14:34:36 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dp5AyVJCYTmw46Iw+W43uaJFk3GTb9OHhL7c1UWmly/987Buskq+dpj6v+1Jo7dSzbant3Ok70Md65ox6IAc8/RV0psCWxdJWx1Noq329PpWv2L1b+9yq0GeY8qiNALHeZFndqtAoQcSZEsRMScWeUEGkceXEPToWQejn4GRb1KlM1HVRkNHCtieGyqQpORocEUvegIvBrFW8/JKNxRA4GEC8Y8kXWrlKggqqwKbMc/u4pXhZpcqBRaGtH9NPGJBx7cMBDat7umGac0eNo3DIfGkhXYAJOTjQhjeLAt86FDihzVdAnridHxISjnDyqAIg5mxOrlHwplm0VOFCo/NbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iPfYtCAOOR647UmXPq5zp5NfB7M7XhvRCkxehl+g6n8=;
 b=p2SEqaAQBN4noO2i6yuku7q9wVmWJQ9lPCVnVwEMpEn8nXUSGk+/W+nRcsHchaWMPbGWbpeQ8sy7obto52iFG5pUWhPw865BdRIxiJwJIKYvZwI1A+yVbW0Z7Dcx0oTFK6rUdPSNkx8vkFJsSkIbg5lIEATjGQT3GH4IA1CCvFhtiRx7SDlnRfcFf8/EEGgZnPcNtdLW1ynQWR15qE6auP2vdiL06cIhpjBaNtpIb2hLn0iw/ClbsHfOiWTBNZKmXQeJlUlPsBjKKDQ5KVvRfRZNXhVbgUn0hg1kAqYguQEQI4L9CQEkFXSPTknQnisiu1H/yfQVc/ofxJ/b1TEFLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iPfYtCAOOR647UmXPq5zp5NfB7M7XhvRCkxehl+g6n8=;
 b=P5dujAWRuTIl/Cx73d9tM+bNjE7haY8KKwt+OeQXIsxSnCLvG8GK2PELtZ1AdYjwg5mp6CLU/R2mbNx2sNZi5M2P8eD35ZYf9kliJP+P/DfKPZE0S/SV141LsGUjeeELdzuEEimyqcss1wWCBGoSljtfX3ExzYWkjwilCEpuI1A=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by PUZPR03MB6968.apcprd03.prod.outlook.com (2603:1096:301:f7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.18; Mon, 25 Nov
 2024 06:34:31 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8182.018; Mon, 25 Nov 2024
 06:34:31 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "mchehab@kernel.org" <mchehab@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	=?utf-8?B?QW5keSBIc2llaCAo6Kyd5pm655qTKQ==?= <Andy.Hsieh@mediatek.com>,
	Julien Stephan <jstephan@baylibre.com>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "laurent.pinchart@ideasonboard.com"
	<laurent.pinchart@ideasonboard.com>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"paul.elder@ideasonboard.com" <paul.elder@ideasonboard.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "fsylvestre@baylibre.com"
	<fsylvestre@baylibre.com>, "pnguyen@baylibre.com" <pnguyen@baylibre.com>
Subject: Re: [PATCH v7 4/5] media: platform: mediatek: isp: add mediatek
 ISP3.0 camsv
Thread-Topic: [PATCH v7 4/5] media: platform: mediatek: isp: add mediatek
 ISP3.0 camsv
Thread-Index: AQHbO/Orh37t76qSsU6WSMvGDnK0HLLHkEIA
Date: Mon, 25 Nov 2024 06:34:31 +0000
Message-ID: <f84ddcdc8e29f8c2970afe10a0dbb17694fe441d.camel@mediatek.com>
References: <20241121-add-mtk-isp-3-0-support-v7-0-b04dc9610619@baylibre.com>
	 <20241121-add-mtk-isp-3-0-support-v7-4-b04dc9610619@baylibre.com>
In-Reply-To: <20241121-add-mtk-isp-3-0-support-v7-4-b04dc9610619@baylibre.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|PUZPR03MB6968:EE_
x-ms-office365-filtering-correlation-id: 241fd584-a3da-4773-6ab2-08dd0d1b3830
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?K3NqUysxNU1sM3JaT2hBYkFLUnhSNDJOMnpVTzBFKzFqUm5uQ1ZVSHlUdng1?=
 =?utf-8?B?U2lidXVuMlF1eHZqMXRuWFBZbVZBMllmSml3QkVldVZqNnpmUG5BMUNNdm5O?=
 =?utf-8?B?aFZHMjhjL01yaitaMHdMLzRPbVZtYkMramFsUmJMWXI2NXFudjQxVEp6aHRt?=
 =?utf-8?B?WWR3alQ2TEloem44cHM1VUlqWVdWSlVndjF3QlI1VkNYZFBQWmxCa3cvK0Fp?=
 =?utf-8?B?RGJNZ2x6U1RySWhTcnRMNmtmL0pJUjI3MWVoaXpVdDdJSS8ydUNmOUY5M3pD?=
 =?utf-8?B?emdDZ3pFN3pFZXR6aitxWndNYVVadW1BWVR1aUt0VzFiWlF2VGV6UkY1RzR3?=
 =?utf-8?B?WFI5WC9oYm54alpSY1k1aDFhVWVFNUlpVHJDUWVKUlNZcS9ET0xyQVF4eWdD?=
 =?utf-8?B?UEdRRkJsWjJpSi94ZnQraFFZSjlteVlRSk84RnVYTG5VaGlVSDZwZGpHMUs1?=
 =?utf-8?B?QTR4Tmh1SHlNdDl1RFA2d2FlaDVGUzdVcGJQQllrSml5VzJGTzBRMkxnNGF2?=
 =?utf-8?B?eksrNE9Pc1BPaWdrKzJYeHIrSGptVWpIRE05alNOVHRQNm1TdzM2SVhDc29B?=
 =?utf-8?B?MHUwa0xBTU15VThReWZVaCttM1d6R3BBWVNnUlZqMWZTbkJNZXI2S0IwTmR6?=
 =?utf-8?B?b2Jsa1lPUnNLb25ReUtqNmJCMlJyekVPeTlWdVJFQUQ5VTgxekxBMS9pRkEy?=
 =?utf-8?B?aTh2TzJwbFBSVUFNV3BmRk54Q21hNHVEMTYyb29BZ2V4VnJHWXBNekx1ZW1G?=
 =?utf-8?B?S1ZlclVneVlnY1lhNE1YWlN2ZHp4aFNrTVByeEhjMTR3MzVJNUFlUm8va080?=
 =?utf-8?B?eVRucW5KQ1RuMG9FQXlKWDJPakJIYzRQMWlQck1pcERRNk0wTWFVUFNHY3Q0?=
 =?utf-8?B?ZFJSdlN0KytUL1p0eU1GVGRSYmx4U255MElLaWVSSWdlMURWTUpQTWhoR1No?=
 =?utf-8?B?WTZheCt1TVI3RFIxWEVJRFFodnVlRU5ENDlOZDNWenVNdGwvRVNvSHQzR0hw?=
 =?utf-8?B?dW1hd0dUQmszNlNWNVlIdGt2STZEYUJ1eDFCcXZ0MGhyK012STZ2eVBVVVo4?=
 =?utf-8?B?UE43N29aSEFWSHlGei9oOCsyQVE5R2ljNU1OVEptNjZnclhianY5STZybjY2?=
 =?utf-8?B?dklhNzc3dXRTVFNRY2xITGxpUkpKTVVySGo1L2lHSlNoQVpIZDRQWGovZmlG?=
 =?utf-8?B?MVlPYjczaEpYQ1Rxak1vYUIxTS9YamxQc3BDNERCS3NCMmlhZUNSRzdpMHpy?=
 =?utf-8?B?NCtZNW9QYzFCRjFvbGc0bm9jSEJpeWdvaVhKejBjaEZYMDhKdGRxekVZNnZw?=
 =?utf-8?B?YWdUa1pFNVRCRjY4ZCs1S0Z1eDhoTU81ZGJJMGRFMks5MGVVdnRMb281THVP?=
 =?utf-8?B?b0pGKytiRS93cW0wK1RKWFBRWFRRSTQrWW1McmQvc0Z6WTFCeW44VFF0aGZG?=
 =?utf-8?B?YjhrVEs2Z2ZVVkJPTHF3QkhlUGVIVm1EME9wVDZFMVBNMXZYSXBGUEJVVnlU?=
 =?utf-8?B?Q2FmeHRTVTlJeXA5N01lb3pqM2tkblEyeGJQMFpXcDdXZm9jQVhvczhkdjNX?=
 =?utf-8?B?WkFPNlQvTDBUTi9OVklFV3RIRVlka290T2hhOXQrWmlzb2tjMTdTYWkyZzg5?=
 =?utf-8?B?TGxpS202cFFIOWw3QTZBNnlnTTdpRFNFb2R5QnBiL3NJNUZTampMbElzYTRs?=
 =?utf-8?B?eDE2Q3BYamE3OXp0Z3VFNUo5VEQ4dlZOaFdjT3RBVlZiY2I1QzVkVExjRVNF?=
 =?utf-8?B?N2JOeVdHdlZ2STRDT3pYZWFzV3ZPcmR5SjJwZlZBMitmZXZBRUtCbTA5YUx3?=
 =?utf-8?B?K1cyWFFhaXE5bHMvUVRsUXJ4aCtqdjBldUw3azMzK0dxSGtTVXJNbHAybHJ5?=
 =?utf-8?B?YU5ORjJMWWhWVkhpckR2ZHFHSHBzY2RrTjJRclZvVlN1K0E9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WXhWcXhZcWFabWliR0pHbmFnQnVXWEJnTXc1bGxRRFhmR3dwUk80YWNSOUtt?=
 =?utf-8?B?U0pOV0VvWjV4VVRiWUhzWnNaamwyWWw1RkpyOWh5ZitYTWkvN1hOd3Yxd1Bz?=
 =?utf-8?B?cjU1L2dyaHpJS0g5cUp1TENCWFZWdjFQUXZscUhPdWNWZ3FFZ1E1TkNBNFQ5?=
 =?utf-8?B?UVZnZ25abEhRaC9UMCtuT3MvZXNHUXVaZWQyVS9KNVE3b255U3V1cXVJZklY?=
 =?utf-8?B?RVZtN0RyNXhQL21KTThOQ1lmSlh1U3pQRHNjQVJubE9ncUN3bXcwQVdIM094?=
 =?utf-8?B?Y3llRk5pOUNSMUc0aGJrS2xQcW83cFZsTUkrdkRHZWViOTRaTnFIb1krV2ZU?=
 =?utf-8?B?d25NclVyWFgzZk94dXArVmQxNk0wMCtJV2VYYm10QWNHOHlJSHArbUxQc0h0?=
 =?utf-8?B?ZnY4dkNacVFSN3h4bVpBZjF2R1M1VXJNN3A2anRpTTY0U0VFS3l3L3RTRk8z?=
 =?utf-8?B?T0ZPMnRYWmVlZHB3U0FNWmtjTzFxYzZVc00vV29pb0xlQmpMdUNNajVnVGtw?=
 =?utf-8?B?VXk4am9FaHhUT2pIRTlkVGVJOGt4dWhZVFVmdUNwZ2U1bElJRjcwVXEyWXdB?=
 =?utf-8?B?alJhelErVll1ck81N25NSnpTMjR4cmtUSWNmVGZaRU4ybG44UTEzU1NhSG5Y?=
 =?utf-8?B?QnFCblRsVFNta0RHR1dFOTNBYlY4UVZ0NWViRVNJWm8wcTFEcXdSU3ZTcGZZ?=
 =?utf-8?B?NkRFTWZPSmZ4N0dlMlFNTlJyWjNZZUJCWmFoWmp5NmRuVkVGSmVlT05ibGMv?=
 =?utf-8?B?cEdzV0RCQ0FabjRVbEZBOTRaRVF3ZEdXcE5hamR0V3JMdUN2UG82TllGUTh0?=
 =?utf-8?B?ak1EZW5sTDVmVUpDekljemNWUUtKcm9IRXdkbjgzUTZxekVGRXNZVmRNOHk3?=
 =?utf-8?B?cjFjdWR4eTdRalg4c3daT0I4cVlucXhmajQ3d3ZrbmdxTTNrT1ltOFVaR09o?=
 =?utf-8?B?RlBVTmhFSkMySjd1WUZzTm55eVZlUXIvUGJsSFRCSnFIUUF1Z1kyYlo1eTFI?=
 =?utf-8?B?Z3Vxd3FwZGJYbHR2VnlTd3ZJbTJxTHVZamE0UktRU2V5eE1lcG5KMVVUNnRi?=
 =?utf-8?B?TEJucTVkenBMSHRJK0ZQWEN3ck05eXZZeFZiOE9uSUdFa0tEd3JrM05Sb3Fo?=
 =?utf-8?B?eU8zeTl5bWQ5ZUgxeEkrTTJYMnZXOVhYSFVWK2pYZ3lBRFoyRXZkUzlmOXV0?=
 =?utf-8?B?V1BublJ2WCtXcUNDNjhJbWFoV3J4MzhYbjhHTk1tRDZxUDhEYzZOT0lNdDhn?=
 =?utf-8?B?TkxOM3ViMVVJdlI3clpvNTJsQWV0QXo2a3phS0I0MHNwakRBSXRXUW0ybjJj?=
 =?utf-8?B?dHplM00zUDZ1cHFlUE1yYWVYb1Q3KytvY0V2QUdnVG9hK1ZmSDZid1B0KzVt?=
 =?utf-8?B?UE9NUXcxUW9CYnl2cTRKWTQ4bFIwYzEyeTFwWlhYVHFnTGlKeUV3UzlJRW40?=
 =?utf-8?B?TmFTM1dYenlxc0hkVWxrT25VTXF6RjhlWkxTM1ZwbVIxVmtJTVk0ZHhBVXl6?=
 =?utf-8?B?MGN0cUlSM2NiVi9BMExNamI2a2MxQmtyekVFL1IreGRYcnNmY3l0cmUveXZO?=
 =?utf-8?B?YWFSWVhVQVNZRzZGWW1YZjNoVGpHT21UR2loTWkrZmFPQzhWdGJ3Ny9QRllY?=
 =?utf-8?B?dnRjdTAra0s3RjRZYmNncXRzVzJGVmNwK2V0Z2RjUUt3N01VN3hBY0hoN2M0?=
 =?utf-8?B?bS91MVpEQVIzMzRVTFRCR0tTbkhhdnVpTXNFT2pRcCs5NlZEdURPeE9INURr?=
 =?utf-8?B?SUxKcytGUzQ4Y1U1eEptOFBWZFNhSWZ6RU9xMlJ6TUxIdS8rUjU3MXZIcWM0?=
 =?utf-8?B?NUFsclNTQitXdWRhRG5xd3VoWlpCQ2MvMyt5VSs1YVhQa2tNMmlONFZoUGVo?=
 =?utf-8?B?SGFHUVpRNUwzN0xEMDFRVS9VTkZCdXNSeUh3aUlqSi9zTUxXWENGSWtoeTF5?=
 =?utf-8?B?V1FFVnJrQUhCSGZ2YjZsMmVuZFQzV1JhY2J3YTFVWnMwaWIxaG9ra0svcFpK?=
 =?utf-8?B?dmh5YUwrc0RNbVJUT0lrVlVTbFZYd1lnSmNyaTZEbDhRTVNDU0plc0NXZTd5?=
 =?utf-8?B?Sy8yMGtPc2VnNFRNTEJldWFVQklkamFNa1Uvd2IxNTcrMUUvek5IZHpsNHNW?=
 =?utf-8?Q?0XGmmR53Dv+5I1CNfNMXe52ge?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CDC12FE5A3260A479BB1DA735CCCBF16@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 241fd584-a3da-4773-6ab2-08dd0d1b3830
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2024 06:34:31.4060
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i4DcqPTMf6p7g0jCU0IoM7SXlETI3yx6NfD2hDhC7ag7Nj+7zbs7cVaRRfK75Sm3sQpDfQsM1lSTvMHHac+eow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR03MB6968
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--20.975300-8.000000
X-TMASE-MatchedRID: scwq2vQP8OEOwH4pD14DsPHkpkyUphL9meN8m2FdGic3xO2R3boBWFbu
	qIY+/skQkABPgKBt/0r/XD0CNJ3fxO4dcT3ZaTocyYHhs0mgDoxyETzgIO4sasaQTVtPXXNM7tV
	VrM60tss6hPK3kyg7bGruTU0cCq8rLZbtj42l31HLtNJZxvPj1ofsPVs/8Vw68cWgFw6wp7ODVl
	Xt0qS4XDfPPRwxkti0nBYRiiCaeCxccQ8eam5EfdIFVVzYGjNKWQy9YC5qGvz6APa9i04WGCq2r
	l3dzGQ1A/3R8k/14e0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--20.975300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	46F935490BB3EFB479B1BDFC7C6E2B6F15B6091A792C0EE4ED252FCAD61D5F872000:8

SGksIEp1bGllbjoNCg0KT24gVGh1LCAyMDI0LTExLTIxIGF0IDA5OjUzICswMTAwLCBKdWxpZW4g
U3RlcGhhbiB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxp
bmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRl
ciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBGcm9tOiBQaGktYmFuZyBOZ3V5ZW4gPHBuZ3V5
ZW5AYmF5bGlicmUuY29tPg0KPiANCj4gVGhpcyBkcml2ZXIgcHJvdmlkZXMgYSBwYXRoIHRvIGJ5
cGFzcyB0aGUgU29DIElTUCBzbyB0aGF0IGltYWdlIGRhdGENCj4gY29taW5nIGZyb20gdGhlIFNF
TklORiBjYW4gZ28gZGlyZWN0bHkgaW50byBtZW1vcnkgd2l0aG91dCBhbnkgaW1hZ2UNCj4gcHJv
Y2Vzc2luZy4gVGhpcyBhbGxvd3MgdGhlIHVzZSBvZiBhbiBleHRlcm5hbCBJU1AuDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBQaGktYmFuZyBOZ3V5ZW4gPHBuZ3V5ZW5AYmF5bGlicmUuY29tPg0KPiBT
aWduZWQtb2ZmLWJ5OiBGbG9yaWFuIFN5bHZlc3RyZSA8ZnN5bHZlc3RyZUBiYXlsaWJyZS5jb20+
DQo+IFtQYXVsIEVsZGVyIGZpeCBpcnEgbG9ja2luZ10NCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBF
bGRlciA8cGF1bC5lbGRlckBpZGVhc29uYm9hcmQuY29tPg0KPiBDby1kZXZlbG9wZWQtYnk6IExh
dXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4NCj4gU2ln
bmVkLW9mZi1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9h
cmQuY29tPg0KPiBDby1kZXZlbG9wZWQtYnk6IEp1bGllbiBTdGVwaGFuIDxqc3RlcGhhbkBiYXls
aWJyZS5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBTdGVwaGFuIDxqc3RlcGhhbkBiYXls
aWJyZS5jb20+DQo+IC0tLQ0KDQpbc25pcF0NCg0KPiArLyogLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0N
Cj4gKyAqIFZCMiBRdWV1ZSBPcGVyYXRpb25zDQo+ICsgKi8NCj4gKw0KPiArc3RhdGljIGludCBt
dGtfY2FtX3ZiMl9xdWV1ZV9zZXR1cChzdHJ1Y3QgdmIyX3F1ZXVlICp2cSwNCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgKm51bV9idWZmZXJzLA0KPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCAqbnVtX3BsYW5l
cywNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgc2l6
ZXNbXSwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZGV2aWNl
ICphbGxvY19kZXZzW10pDQo+ICt7DQo+ICsgICAgICAgc3RydWN0IG10a19jYW1fdmlkZW9fZGV2
aWNlICp2ZGV2ID0NCj4gKyAgICAgICAgICAgICAgIHZiMl9xdWV1ZV90b19tdGtfY2FtX3ZpZGVv
X2RldmljZSh2cSk7DQo+ICsgICAgICAgc3RydWN0IG10a19jYW1fZGV2ICpjYW0gPSB2YjJfZ2V0
X2Rydl9wcml2KHZxKTsNCj4gKyAgICAgICBjb25zdCBzdHJ1Y3QgdjRsMl9waXhfZm9ybWF0X21w
bGFuZSAqZm10ID0gJnZkZXYtPmZvcm1hdDsNCj4gKyAgICAgICB1bnNpZ25lZCBpbnQgc2l6ZSwg
ZGVmYXVsdF9udW1fcGxhbmVzLCBpOw0KPiArDQo+ICsgICAgICAgc2l6ZSA9IGZtdC0+cGxhbmVf
Zm10WzBdLnNpemVpbWFnZTsNCj4gKw0KPiArICAgICAgIGRlZmF1bHRfbnVtX3BsYW5lcyA9IDE7
DQoNCk1ha2UgdGhpcyBhIGNvbnN0YW50Lg0KDQo+ICsNCj4gKyAgICAgICBpZiAoKm51bV9wbGFu
ZXMgPT0gMCkgew0KPiArICAgICAgICAgICAgICAgKm51bV9wbGFuZXMgPSBkZWZhdWx0X251bV9w
bGFuZXM7DQo+ICsgICAgICAgICAgICAgICBmb3IgKGkgPSAwOyBpIDwgKm51bV9wbGFuZXM7ICsr
aSkNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgc2l6ZXNbaV0gPSBzaXplOw0KDQoqbnVtX3Bs
YW5lcyA9IDEsIHNvIHRoaXMgZm9yLWxvb3AgY291bGQgYmUgcmVwbGFjZWQgYnk6DQoNCnNpemVb
MF0gPSBzaXplOw0KDQo+ICsgICAgICAgfSBlbHNlIGlmICgqbnVtX3BsYW5lcyAhPSBkZWZhdWx0
X251bV9wbGFuZXMgfHwgc2l6ZXNbMF0gPCBzaXplKSB7DQoNClRoZSB0ZXJtICdkZWZhdWx0X251
bV9wbGFuZXMnIHdvdWxkIGxldCdzIHRoaW5rIGl0IGNvdWxkIHN1cHBvcnQgb3RoZXIgbnVtYmVy
IG9mIHBsYW5lcy4NCkJ1dCBpdCBvbmx5IHN1cHBvcnQgb25lIHBsYW5lLiBNYXliZSB1c2UgJ3N1
cHBvcnRlZF9udW1fcGxhbmVzJy4NCg0KUmVnYXJkcywNCkNLDQoNCj4gKyAgICAgICAgICAgICAg
IHJldHVybiAtRUlOVkFMOw0KPiArICAgICAgIH0NCj4gKw0KPiArICAgICAgICgqY2FtLT5od19m
dW5jdGlvbnMtPm10a19jYW1fZmJjX2luaXQpKGNhbSwgKm51bV9idWZmZXJzKTsNCj4gKw0KPiAr
ICAgICAgIHJldHVybiAwOw0KPiArfQ0KPiArDQo+IA0KPiANCg==

