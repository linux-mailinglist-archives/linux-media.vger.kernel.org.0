Return-Path: <linux-media+bounces-51715-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLoGEwu4eWlHygEAu9opvQ
	(envelope-from <linux-media+bounces-51715-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 08:17:31 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 166589DAB3
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 08:17:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3B057301ACC6
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 07:15:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87001260580;
	Wed, 28 Jan 2026 07:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="uRet7vVp";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="Ux1Ke85A"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9135825F798;
	Wed, 28 Jan 2026 07:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769584514; cv=fail; b=p7P1ty3e4WZcDif1r2RgDvXjK7Tiv287/xdh0SqQwQD7DtkM6rK0YMHTkAFd9wED6c4VBMYJUzf43JVlYiGwvH8y21AWNadSNN1uWI4ZDMyBIPmtr06NiHSiAUhnWNWU8OSnBGxfWesycagjtV5XThktdkYAIukUqxvDe3ub7Ww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769584514; c=relaxed/simple;
	bh=IdUfoltAyaCHMIKuANNsp7Iy/V58pRDNXOTOVjSE32c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XJ71F9yOZXPaQTlHrHy5ZNAb3+BSf2PFt1gdzgzK2ZL4CjF6DTuuoyS0EpB2jFNExYWAoT5l/G2dNp7LVDXTGmRENiQYtRGi7wMtTDRxBZcarT7roaK8Mkrcoz28aWNZ6f44j+yGgJKvTN3rrAzbpT4GG21bZA1E7sdTGuq+WQc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=uRet7vVp; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=Ux1Ke85A; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 0f2b6990fc1911f0b7fc4fdb8733b2bc-20260128
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=IdUfoltAyaCHMIKuANNsp7Iy/V58pRDNXOTOVjSE32c=;
	b=uRet7vVpnE6v86lgBZgMeYsH2v2y/BtfEB/6ahtqo2Cax73uUlGsPiOV+W5QYL1RvwWTtDdyllJYuITsabb8ZT/ToLu9R0eIWc8ZAdiJ8PBwIZBaA1D0GseEK3iFp/oxE8zcPlBVzqXkQxS7xmKZaBQz9QPi3kIkgyp0RntSjBo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:f2b33750-aebf-4136-9429-9b037dfce1b5,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:1e9608e9-ef90-4382-9c6f-55f2a0689a6b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 0f2b6990fc1911f0b7fc4fdb8733b2bc-20260128
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 743128022; Wed, 28 Jan 2026 15:15:00 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 28 Jan 2026 15:15:00 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 28 Jan 2026 15:14:59 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Owz/8NnSvn+yMLXTFeEHHwFq/VJS01bw7u/SjCnpsXE4WZTNn6BPI+13JVQ3xNd42bQ2/Mi92tE4visNoxRxaeonefgNeSRdIbakjdBljGtWtjWJjhebMoC5nF2PEKAS70LnZB10j7/Mf81YrdXtFIvSF1c4KLdAnVnsBK5Kp9XAkIxMs7yFilGNSOChk0eGrMk2VYRIX8u07Lsw05PGz9/w9sseMDvDNaGiv9IUkjK7SdKcDK98JKIexW5K7o51NCsPoS1A/+M2lNp9tqnYHnvskMf+mY4wM+eZV/tcC/KK6JpI3n8heAK98bzNWjL3VNY+DZ+Rg2dUNwE+fmukxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IdUfoltAyaCHMIKuANNsp7Iy/V58pRDNXOTOVjSE32c=;
 b=U0E52VzaWdZ+FGVDGE01HtXOBm+kXb1spcVU7I34GJybgKeHhLb0BDsGldDzIhyDLSlI3N9NsI1Bp5HCWjTa/rTshHrbB+FbAYZRT0uMjXzbBOIHWdY83tPYeyCo7z2LbBQm8wKePLolR61Zdry6Hh6Xl49lxAtQ9/Jq+vpKTFW0kLNg7aPDKjbcSHjAMazD/IjrsrTNnYVs2vGLIM1ltIUaZda0Xn83Y97iWtDAV+WHAtfoHPeCexwAFs5c45W2c8hDs+ZGH/q+Npc+yCIDquzj+77Ad3iTAoNQO+Fgsw+2L58+WtitoWcnGyZu+6XrMDN2f5QgxWXEOZAGjryw0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IdUfoltAyaCHMIKuANNsp7Iy/V58pRDNXOTOVjSE32c=;
 b=Ux1Ke85AqoC8ZGGWuPGPKO8K2SqEO59nI9t1Z2b55obZPH5Ap36ix+T0YJ27a4eOJoAqjNponZFtIP73QxLjzo5CoJ+6vV3wjKgk8v2qO53HEcrn96VHAojgLbZDWbKAfN1w4Y0LqgT2QzZbuyBzrF2EcMhVWBz0BHiDomujb3k=
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com (2603:1096:301:b9::5)
 by SEYPR03MB8580.apcprd03.prod.outlook.com (2603:1096:101:207::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Wed, 28 Jan
 2026 07:14:54 +0000
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::a013:f3b3:a461:8ece]) by PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::a013:f3b3:a461:8ece%4]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 07:14:53 +0000
From: =?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?R2VvcmdlIFN1biAo5a2Z5p6XKQ==?= <George.Sun@mediatek.com>,
	=?utf-8?B?VGlmZmFueSBMaW4gKOael+aFp+ePiik=?= <tiffany.lin@mediatek.com>,
	"nhebert@chromium.org" <nhebert@chromium.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, "nicolas.dufresne@collabora.com"
	<nicolas.dufresne@collabora.com>, =?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?=
	<Kyrie.Wu@mediatek.com>, =?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?=
	<Yunfei.Dong@mediatek.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	=?utf-8?B?SXJ1aSBXYW5nICjnjovnkZ4p?= <Irui.Wang@mediatek.com>,
	"robh@kernel.org" <robh@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"arnd@arndb.de" <arnd@arndb.de>,
	=?utf-8?B?QW5kcmV3LUNUIENoZW4gKOmZs+aZuui/qik=?=
	<Andrew-CT.Chen@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: "andrzejtp2010@gmail.com" <andrzejtp2010@gmail.com>,
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
	=?utf-8?B?WWlsb25nIFpob3UgKOWRqOaYk+m+mSk=?= <Yilong.Zhou@mediatek.com>
Subject: Re: [PATCH v7 06/10] media: mediatek: vcodec: Add VP9 Probability
 Size Configuration
Thread-Topic: [PATCH v7 06/10] media: mediatek: vcodec: Add VP9 Probability
 Size Configuration
Thread-Index: AQHcjzbVIUs/0stasUuz50ZVkGnBBLVl7JAAgAFAmQA=
Date: Wed, 28 Jan 2026 07:14:53 +0000
Message-ID: <e6376de7f323911d496777ccdc711379c19c120c.camel@mediatek.com>
References: <20260127024248.18406-1-kyrie.wu@mediatek.com>
	 <20260127024248.18406-7-kyrie.wu@mediatek.com>
	 <558d1cbf-1765-49b7-acbc-f38d448d0411@collabora.com>
In-Reply-To: <558d1cbf-1765-49b7-acbc-f38d448d0411@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR03MB6186:EE_|SEYPR03MB8580:EE_
x-ms-office365-filtering-correlation-id: 67a559d1-32f1-4daf-700d-08de5e3cef29
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700021|921020;
x-microsoft-antispam-message-info: =?utf-8?B?eEkzSE01akpUQjFQZDdTZ1dQTFZGaXc0NnRyd2RvaVZWdFpINVhhajdYcDJM?=
 =?utf-8?B?MXQ0QVdNamVsZ2FkRFZRdDc0Z1dzREFKdHhQOGdPcXRNRTBCR2Iyc1FLMWpi?=
 =?utf-8?B?WWoyclVpTWlkb2RKNUUya3h3bDJEM2JQNFQ0T29hU2FhUkZqaG4rVFVWZmZJ?=
 =?utf-8?B?anhwOG9zM3FtSG1mS1R0cFlCZ2drQTNsVm1mVE1vQ0FROWYvdTVRUFlJWVFz?=
 =?utf-8?B?ZG52M3pWNkkwQk83dHEzdGMxZW9odzh4Q2Q1K2JYalJaWktoOGVLT1hEcWw3?=
 =?utf-8?B?ZWpSVEp1QVVwd2RHOEFNc3BjYVhIZUd6TDdVYkVHNGhlcmp3QnFWT3pHSE1F?=
 =?utf-8?B?QkZXYjlvSkR5SERPQktIRzJhclVKR1JMN3dDcTRTR1IyVHZvQndDUFhJbmxq?=
 =?utf-8?B?VFFXWGVLelhXcHZ4ZjNDQWZkWktiamlHOG0vUWlyK2sxc0k2RUJGdDJhUnE3?=
 =?utf-8?B?bkN5MkZCQ1BkblFqWjl4QnRqWURDZis0L2w1MHltbU1wT3N1c1RibnFpcUxK?=
 =?utf-8?B?djc4ZkdjNDRENU5oWC9ON1l3cjBvM2NNSWJNM1podkxkenhyMmZXbUFpWWJY?=
 =?utf-8?B?MWM1NGFPOVpZZFM3dmkvKzI1dXNBVnNjbVBOMFVva3ViVm1CaWttNlplVThE?=
 =?utf-8?B?RFhxZ0Z5MmQzMm1zdk1aRnNadSsrVG1NWmszWDFBNWJzcWtFRDU0aTRJejdR?=
 =?utf-8?B?K2o5aEFpR1JXa2l1U2Nub3YvTTlpVW5WTGFDc1dtK0ZFNTBWMlk4MkJmQjlr?=
 =?utf-8?B?NndMbWgwSEFwV2JJZkNDa21BZ0J1QU9PZ2hlbVZ4R1NScDJSbkZOTFZJOU9F?=
 =?utf-8?B?dlVMRVNlK3hNdENMU29Edms2Vndma0QzTC90TDVzVzQ3LzBtOVFaamhqRURv?=
 =?utf-8?B?K1A3VEJCOVZYcmFLRE1TUXRsc1F2aEw1T2VKVHF5OHlNMTJaV3J1ZnBCUXhO?=
 =?utf-8?B?UDUrSStuYmt4cm9lSCtyUEUvdER0bGdkZkFZdng1bitQNjR4V3ZXcG1vUnli?=
 =?utf-8?B?YjZzSHlFdDNGUUFZSVVuTlZ1d0QwMFVWeUljL0xhRTZzVzQ3cU81V2ZTbVNp?=
 =?utf-8?B?VmlzM05URVlWZVRiSTMyZGo3My8yNktwS2lJZlR5SkhXR3FMNzgyOGJrdnQ4?=
 =?utf-8?B?NUhIdjlmaitiQ3U2TDArYXNUNndLSzltalZCYjFiaEZ6dGxUb3hTRGNNck9E?=
 =?utf-8?B?SmhNM1czN05rNStySkdVSThSNS9YQzVMa0JlbVRkczNHTnBoTmJscWlwblNI?=
 =?utf-8?B?emM2ZW0za2p5TUsyMzVRblFIVTNldUdFVWk0WG9YR3o0b3c5NEZiYlNhSCtX?=
 =?utf-8?B?bkxkSEd3K1FVNlhOT2JmMGhSZmdiNURDNzFzR25VN0FtOThMaktVRDNIZFFr?=
 =?utf-8?B?UnhlQ1I0eEhSUVlMMTVMVXRUdGtsN2FFRDZVQ25Ga2xIUHl1L0RJWnl6MGpB?=
 =?utf-8?B?dEh3WXBnZHdaR0VpemtuMDNhbVVHb0pIQ3BrVklPWjVxODdsMDlTY2k4YnhW?=
 =?utf-8?B?QzFNMVBzbTF5MkMrbmZuejVlV2JBZ1JhUnhxK1RGS2xuelVTN1pMZS9qV0hD?=
 =?utf-8?B?L2NrMWNHUU9lQkNicm5wMFlhVnhZOUFGN0dhZjdQckVBTFVia2tXNnoyeWty?=
 =?utf-8?B?UFVIWWY5OUJpRXBsaW5wTjZQWlVGMVUyV3ZwcGRpVHRVUHQ2TGIreGRLYzlS?=
 =?utf-8?B?dVA3QnVMazV3L1BPbnJqbFJHSG8zZXFtK2RXaGl3S0NjbGlFQTQrOHJBMTNN?=
 =?utf-8?B?YlgzTGgyTEFsYmYxcHNKVHdieExHR0lwbHEra3JiVjBJMlNSb1Q5dUk3MXpZ?=
 =?utf-8?B?clVNS1dYV3Z2ejdmcCtNOGxBbGg5aGJ4Zlp2VFRjUVlyTlJCV2RGdm5qRU5i?=
 =?utf-8?B?b0FjL1VQTWRqd092TkkxeXRSSlplZzJHR0kzZG1xNFBXb1Rjc0hVS0thRXdJ?=
 =?utf-8?B?QS9XcHc4NU4rVitnbHo3ZWxLZ0lrMzRldEVzWXRtTkJnMnlXczh3ZDArWWxJ?=
 =?utf-8?B?bFFoeTUyTUhzSmQrRGJuVElPWENWcmdxNllQakJvSXRDTGduMGVraVBwckQ2?=
 =?utf-8?B?NFdkTXUvSzNUc282a3BBSjY3QVpxVjRNZ2I3YUFsVW1pNWo3UHlBanlLczg4?=
 =?utf-8?B?WU1vNUFyU2tGdm52bFdsVmNMcW01SFhNaVZoSWlQS013Q3B0UTc4U2wxdllR?=
 =?utf-8?Q?OAhmW8TBYmbOaDE1kBlKTBeZkxKDW74JwBveqi3jWowZ?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB6186.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RHE5QklRTjVHR3laTEFpdWt3clFqdDdHVEw3ZEZVYm1NbDdrajNJUmFEOUF5?=
 =?utf-8?B?dSttUU81S1AzeU9KRlYxOTltc2YzRnlZcFlMdWx3NnFuTi9hNENTclEvQUVP?=
 =?utf-8?B?MGN0RlFHdkdTMU5XVlVuQU9vS1VJamh6Tzh2RnVDSkNWMXlXeUVHMDdqaE01?=
 =?utf-8?B?VHd2OS82aU5OS29yRVc5MGFyRDk4OTR6VWJHdEowZmFNUDhLeVptTjROaXp0?=
 =?utf-8?B?VDA4WUtYb3VMeWRjTXZUNnhIY1lMMk12SEZqalNiMEY1WjJ5S0d1eUI1SEdM?=
 =?utf-8?B?Vyt0Wmw5RnJLY1hLZkcxSVIyVVB5d2pIWGR6TDJMa3kzVW9LcnN0L1d1ejNp?=
 =?utf-8?B?OFMzY01IeUVlVGtDK1R5cUhMT2VuRzBrNUpranB0YXUyY1hHeHBYQTZTWW9w?=
 =?utf-8?B?SmoyU3gvVSt5cnYyMHpEb2VMYkY1cjdUUkg4b0dxOXJHYkhONzFnRGVwcHV4?=
 =?utf-8?B?YWZjNEJkWnZBUi9iQXhxSFJuV0J2dVdBKzVYOWRlajhadm5VUDVsM2V2blY2?=
 =?utf-8?B?SUVwbmhpSWE5NmtBWTVzU3pSYkU5YUJHM2JuS2dLeTZiaXhaYlh3NlplUnhl?=
 =?utf-8?B?YmEzbHh4bjFiVkpwTWpLQ2lsMzVhTDNnZ1ZGQXlhTWhERCtRSnN1R0FOZEhR?=
 =?utf-8?B?VmozeGZ3SWF2bXg5M29USUNDbkhXTlZXSUtIWEcvT0xnUnRBTTJmQmthd0dz?=
 =?utf-8?B?SmhxM0hySGc3UFpWVWVZdUlwcVBWUFdSUnp0cC92emd2UEowbVJTWDZZdUtB?=
 =?utf-8?B?WnE3d2dtR2RuMTNVQW1OeTJKcFltOGh5bG9lTmQ0SXY5RkRKUXZEd3J4enJy?=
 =?utf-8?B?ZC9FUGFsSTJ5NnJNNXZnVTJ4VnNYT3J1NFFLcDZJMGxUOEpteVJibVd3VENn?=
 =?utf-8?B?alkxVEkwM2RFUHRSbDIzb1lpU0ViSEppU2tDOUM0Yk96YTZxWHVnSVppV2g3?=
 =?utf-8?B?UE0zejlYUWRMZHJUUWlVRVpyNTlrcXRtV04xb081YlVOcVBnQWJVVW95dDFY?=
 =?utf-8?B?bmtmY2M1TmV5VTlwSFA4VWJGT0s1MUp1ay93MTFlb25RV0NFMDhWSmljdmt5?=
 =?utf-8?B?VzRBYklXc1ZzNGVqVitrbU1yVnRIUGVQdWREbVRuZ0lRcEtsUEJJY3Joc1R4?=
 =?utf-8?B?bjFDMTNjb1Y5ZXEyUXhqTjVwd0tCVm5jMjZFSkRGM3VlMmJsQktENyswN3Fl?=
 =?utf-8?B?dHY5WEJlb3g0WnNYbzJwQThUY3h5UkpMRTJWZGVXRWRCNXRPT2V6em9oNzhu?=
 =?utf-8?B?UmFPdmhsd09rYjlGUU5RbDRPYTVDNFBWUnJHdGZxL3FEKzJTckg3enc5YTZh?=
 =?utf-8?B?UXFiUVV5bW1SNFJBRkJBK0dpenlwUW8xSmZFd0FZRi9ESlR2OWtZRFlZK0hv?=
 =?utf-8?B?Y2l3cGZaSWZnRExFSVh2QW54c0xiNzQ0N2xBR21pQ1NDUGIwdXVCYlZPcHZk?=
 =?utf-8?B?NVFIaU5tdVp0WVRWTjIwUC9BQkordW00K2RhWk5iaDBRZUt3WFYzRFYvYlcv?=
 =?utf-8?B?S0YvdWlyNmpvblFUMS8rR1pDRGF2STVoNG1IUXVOWCtjc2o2R091T3VVTkdS?=
 =?utf-8?B?ZzVBRUgrSXVpdkk3TkJuMUZKVG5HL2Nja0lJVnhneVZkL1EyVVJhNmUvYVNB?=
 =?utf-8?B?ZitFK0dnV3NzQ0JaSmZNUXVQRm9HNFFXdlJvMkpKR3F4OUtHY0xuVVVhNlBH?=
 =?utf-8?B?UldQc09IQms4d0NLZGtsb0R0SjVuMk8yQTl2RUtaYU5Sa2k3Um9TWUFPazZn?=
 =?utf-8?B?YVQ1MkIvTWdWcmpmRDY4Y2FzL3cvZEQ0aXhERUdPR01HZ0ZXVG0xczR1Um1R?=
 =?utf-8?B?bENpNUk4VXN5cmdYdUxQSkZXQVUrWmRVQTVJZDRnbzZTemI5ZU9NcjQ3eDJ3?=
 =?utf-8?B?NDhsYlRqcC8rQ3BMc1p3U2gzNkR6dGxxZHl4cTd0N2tLZnBYNkloWVU4by9a?=
 =?utf-8?B?TXlQS0E0MWxmbmlLUmVVLzQzSUh5YlljcTh2UW5VdWpjMzN5aVlZVCs3UmdY?=
 =?utf-8?B?YkhnWVUwZTFDSGU4RXN0M0xmcGpRTUxNcTF5WlVNOEFJNkpabW1Fdm5LT0No?=
 =?utf-8?B?djBJNlRjamlvVHJjRkZReUViTC9tUGlqSWhKaXl2djUvdFhZWk0vWDJUbzk2?=
 =?utf-8?B?Ym9DaXVISUNEQmdnWjlESFFrOHM0bFhtTHluQWpMcTFIcjFiVWQ5dzRyeWVC?=
 =?utf-8?B?bkZBQlpWVWlDelRUTnZiL3YxU2Y0dGsybzBONzJBV0o3R1hUd1M5TGdHQlVP?=
 =?utf-8?B?RXBmR3lYZWFzQTdBSEJhZTlSS3IvVlBZUStteDdxbFpmcis3dGtOakpKbmdU?=
 =?utf-8?B?ZDJiaHk1aWd4WGpxYXFuU0pieDRHWEh1VURuaU1IT0JsemYwK2tvZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4E2C0A51E0470348B5C670788D927EA4@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB6186.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67a559d1-32f1-4daf-700d-08de5e3cef29
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2026 07:14:53.6606
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: khLALveVIXODNJNA0PfTtlYJg7N/lMQO9gS0Nrj+UbxQlkZkPLNuYNVjb6K6kjuZciLEoSEZyqMIiF/BB5yicQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8580
X-MTK: N
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[mediatek.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[mediatek.com:s=dk,mediateko365.onmicrosoft.com:s=selector2-mediateko365-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	TAGGED_FROM(0.00)[bounces-51715-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[vger.kernel.org,lists.infradead.org,mediatek.com,chromium.org,kernel.org,xs4all.nl,collabora.com,gmail.com,arndb.de];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mediatek.com:email,mediatek.com:dkim,mediatek.com:mid,collabora.com:email,mediateko365.onmicrosoft.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[mediatek.com:+,mediateko365.onmicrosoft.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Kyrie.Wu@mediatek.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linaro.org,mediatek.com];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 166589DAB3
X-Rspamd-Action: no action

T24gVHVlLCAyMDI2LTAxLTI3IGF0IDEzOjA3ICswMTAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gSWwgMjcvMDEvMjYgMDM6NDIsIEt5cmllIFd1IGhhIHNjcml0dG86DQo+
ID4gVGhpcyBjb21taXQgaW50cm9kdWNlcyBzdXBwb3J0IGZvciBjb25maWd1cmluZyB0aGUgVlA5
IGRlY29kZXINCj4gPiBwcm9iYWJpbGl0eSBidWZmZXIgc2l6ZS4gSXQgcmVtb3ZlcyBoYXJkLWNv
ZGVkIHZhbHVlcyBhbmQgZW5zdXJlcw0KPiA+IGNoaXBzZXQtc3BlY2lmaWMgYnVmZmVyIHNpemVz
IGFyZSBoYW5kbGVkIGR5bmFtaWNhbGx5LCBpbXByb3ZpbmcNCj4gPiBtYWludGFpbmFiaWxpdHkg
YW5kIGFsaWdubWVudC4NCj4gDQo+IERlcGVuZGluZyBvbiBob3cgeW91IHNlZSBpdCwgdGhlIGJ1
ZmZlciBzaXplcyBhcmUgc3RpbGwgc3RhdGljLCBhcw0KPiB0aG9zZSBhcmUNCj4gZGVmaW5lZCBp
biBjb25zdCBzdHJ1Y3R1cmVzIGFuZCBuZXZlciBjaGFuZ2UgZHVyaW5nIHRoZSBlbnRpcmUgZHJp
dmVyDQo+IGxpZmUuDQo+IA0KPiBBbHNvLCBuZXZlciBzdGFydCBhIGNvbW1pdCBkZXNjcmlwdGlv
biB3aXRoICJ0aGlzIGNvbW1pdCIgLSBhcyBpdCdzDQo+IGltcGxpY2l0DQo+IHRoYXQgeW91J3Jl
IGRlc2NyaWJpbmcgLi4uIHRoaXMgY29tbWl0Lg0KPiANCj4gTW9yZW92ZXIsIHRoZSBoYXJkY29k
ZWQgdmFsdWVzIGFyZSBub3QgcmVtb3ZlZCAtIHRoZXkncmUganVzdA0KPiBoYXJkY29kZWQgaW4g
YQ0KPiBkaWZmZXJlbnQgd2F5IC0gYXMgaW4sIHRoZXkgYXJlIG5vdyBoYXJkY29kZWQgYXMgYSBw
b3NzaWJseSBkaWZmZXJlbnQNCj4gdmFsdWUNCj4gZm9yIGVhY2ggZGVjb2Rlci4NCj4gDQo+IEEg
YmV0dGVyIGRlc2NyaXB0aW9uIHdvdWxkIGJlOg0KPiANCj4gDQo+IEludHJvZHVjZSBzdXBwb3J0
IGZvciB1c2luZyBkaWZmZXJlbnQgcHJvYmFiaWxpdHkgYnVmZmVyIHNpemVzIGZvcg0KPiBkaWZm
ZXJlbnQNCj4gc3RhdGVsZXNzIGRlY29kZXJzOiBpbiBwYXJ0aWN1bGFyLCB0aGUgVlA5IGRlY29k
ZXIgY2FuIHVzZSBhDQo+IGRpZmZlcmVudCBzaXplDQo+IG9uIGRpZmZlcmVudCBTb0NzIGJlY2F1
c2Ugb2YgZGlmZmVyZW50IGhhcmR3YXJlIGNhcGFiaWxpdGllcy4NCj4gDQo+IE1vdmUgdGhlIGhh
cmRjb2RlZCBzaW5nbGUgcHJvYmFiaWxpdHkgYnVmZmVyIHNpemUgdmFsdWUgdG8gZGVjb2Rlcg0K
PiBwYXJhbXMsDQo+IGludHJvZHVjZSBhIG5ldyBWUDlfNEtfUFJPQl9CVUZfU0laRSBhbmQgYXNz
aWduOg0KPiAgIC0gVlA5X1BST0JfQlVGX1NJWkUgKDI1NjAgbGluZXMpIHRvIGxlZ2FjeSBTb0Nz
OyBhbmQNCj4gICAtIFZQOV9QUk9CX0JVRl9TSVpFICgzODQwIGxpbmVzKSB0byBuZXdlciBTb0Nz
IChNVDgxOTYsIE1UODE4OSkuDQo+IA0KPiANCj4gQWZ0ZXIgd2hpY2guLi4NCj4gUmV2aWV3ZWQt
Ynk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDwNCj4gYW5nZWxvZ2lvYWNjaGluby5kZWxy
ZWdub0Bjb2xsYWJvcmEuY29tPg0KDQpEZWFyIEFuZ2VsbywNCg0KVGhhbmtzIGZvciB5b3VyIHN1
Z2dlc3Rpb24sIEkgd2lsbCB1cGdyYWRlIHRoaXMgcGF0Y2gNCmluIHRoZSBuZXh0IHZlcnNpb24u
DQoNClRoYW5rcyBhIGxvdC4NCg0KUmVnYXJkcywNCkt5cmllLg0KPiANCj4gPiANCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBLeXJpZSBXdSA8a3lyaWUud3VAbWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+
ICAgLi4uL21lZGlhdGVrL3Zjb2RlYy9kZWNvZGVyL210a192Y29kZWNfZGVjX2Rydi5oICAgICAg
IHwgIDIgKysNCj4gPiAgIC4uLi9tZWRpYXRlay92Y29kZWMvZGVjb2Rlci9tdGtfdmNvZGVjX2Rl
Y19zdGF0ZWZ1bC5jICB8ICAxICsNCj4gPiAgIC4uLi9tZWRpYXRlay92Y29kZWMvZGVjb2Rlci9t
dGtfdmNvZGVjX2RlY19zdGF0ZWxlc3MuYyB8IDEwDQo+ID4gKysrKysrKysrKw0KPiA+ICAgLi4u
L21lZGlhdGVrL3Zjb2RlYy9kZWNvZGVyL3ZkZWMvdmRlY192cDlfcmVxX2xhdF9pZi5jIHwgIDQg
KystLQ0KPiA+ICAgNCBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQNCj4gPiBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0v
bWVkaWF0ZWsvdmNvZGVjL2RlY29kZXIvbXRrX3Zjb2RlY19kZWNfZHJ2DQo+ID4gLmgNCj4gPiBi
L2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2RlY29kZXIvbXRrX3Zjb2Rl
Y19kZWNfZHJ2DQo+ID4gLmgNCj4gPiBpbmRleCBmMzhiNWRjNGJiNzQuLjA4Y2M2NTA1NGRlNSAx
MDA2NDQNCj4gPiAtLS0NCj4gPiBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNv
ZGVjL2RlY29kZXIvbXRrX3Zjb2RlY19kZWNfZHJ2DQo+ID4gLmgNCj4gPiArKysNCj4gPiBiL2Ry
aXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2RlY29kZXIvbXRrX3Zjb2RlY19k
ZWNfZHJ2DQo+ID4gLmgNCj4gPiBAQCAtODAsMTAgKzgwLDEyIEBAIHN0cnVjdCB2ZGVjX3BpY19p
bmZvIHsNCj4gPiAgICAqIHN0cnVjdCBtdGtfdmNvZGVjX2RlY19wYXJhbXMgLSBkZWNvZGVyIHN1
cHBvcnRlZCBwYXJhbWV0ZXJzDQo+ID4gICAgKiBAbGV2ZWw6IGRlY29kZXIgc3VwcG9ydGVkIHZj
b2RlYyBsZXZlbA0KPiA+ICAgICogQHByb2ZpbGU6IGRlY29kZXIgc3VwcG9ydGVkIHZjb2RlYyBw
cm9maWxlDQo+ID4gKyAqIEBwcm9iX3NpemU6IHZwOSBkZWNvZGVyIHByb2JhYmlsaXR5IHNpemUN
Cj4gPiAgICAqLw0KPiA+ICAgc3RydWN0IG10a192Y29kZWNfZGVjX3BhcmFtcyB7DQo+ID4gICAJ
czY0IGxldmVsOw0KPiA+ICAgCXM2NCBwcm9maWxlOw0KPiA+ICsJc2l6ZV90IHByb2Jfc2l6ZTsN
Cj4gPiAgIH07DQo+ID4gICANCj4gPiAgIC8qKg0KPiA+IGRpZmYgLS1naXQNCj4gPiBhL2RyaXZl
cnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2RlY29kZXIvbXRrX3Zjb2RlY19kZWNf
c3RhDQo+ID4gdGVmdWwuYw0KPiA+IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay92
Y29kZWMvZGVjb2Rlci9tdGtfdmNvZGVjX2RlY19zdGENCj4gPiB0ZWZ1bC5jDQo+ID4gaW5kZXgg
YTQ3OTA2YjlkNzE3Li45OWMyNTJlMGEyZTEgMTAwNjQ0DQo+ID4gLS0tDQo+ID4gYS9kcml2ZXJz
L21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9kZWNvZGVyL210a192Y29kZWNfZGVjX3N0
YQ0KPiA+IHRlZnVsLmMNCj4gPiArKysNCj4gPiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVk
aWF0ZWsvdmNvZGVjL2RlY29kZXIvbXRrX3Zjb2RlY19kZWNfc3RhDQo+ID4gdGVmdWwuYw0KPiA+
IEBAIC02MzAsNSArNjMwLDYgQEAgY29uc3Qgc3RydWN0IG10a192Y29kZWNfZGVjX3BkYXRhDQo+
ID4gbXRrX3ZkZWNfODE3M19wZGF0YSA9IHsNCj4gPiAgIAkudnA5X3BhcmFtcyA9IHsNCj4gPiAg
IAkJLmxldmVsID0gVjRMMl9NUEVHX1ZJREVPX1ZQOV9MRVZFTF80XzAsDQo+ID4gICAJCS5wcm9m
aWxlID0gVjRMMl9NUEVHX1ZJREVPX1ZQOV9QUk9GSUxFXzEsDQo+ID4gKwkJLnByb2Jfc2l6ZSA9
IDI1NjAsDQo+ID4gICAJfSwNCj4gPiAgIH07DQo+ID4gZGlmZiAtLWdpdA0KPiA+IGEvZHJpdmVy
cy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay92Y29kZWMvZGVjb2Rlci9tdGtfdmNvZGVjX2RlY19z
dGENCj4gPiB0ZWxlc3MuYw0KPiA+IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay92
Y29kZWMvZGVjb2Rlci9tdGtfdmNvZGVjX2RlY19zdGENCj4gPiB0ZWxlc3MuYw0KPiA+IGluZGV4
IGI1NzFjNGVkM2Y3OS4uY2EzOWFlMzU3MWEzIDEwMDY0NA0KPiA+IC0tLQ0KPiA+IGEvZHJpdmVy
cy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay92Y29kZWMvZGVjb2Rlci9tdGtfdmNvZGVjX2RlY19z
dGENCj4gPiB0ZWxlc3MuYw0KPiA+ICsrKw0KPiA+IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9t
ZWRpYXRlay92Y29kZWMvZGVjb2Rlci9tdGtfdmNvZGVjX2RlY19zdGENCj4gPiB0ZWxlc3MuYw0K
PiA+IEBAIC0xMCw2ICsxMCw5IEBADQo+ID4gICAjaW5jbHVkZSAibXRrX3Zjb2RlY19kZWNfcG0u
aCINCj4gPiAgICNpbmNsdWRlICJ2ZGVjX2Rydl9pZi5oIg0KPiA+ICAgDQo+ID4gKyNkZWZpbmUg
VlA5X1BST0JfQlVGX1NJWkUgMjU2MA0KPiA+ICsjZGVmaW5lIFZQOV80S19QUk9CX0JVRl9TSVpF
IDM4NDANCj4gPiArDQo+ID4gICAvKioNCj4gPiAgICAqIHN0cnVjdCBtdGtfc3RhdGVsZXNzX2Nv
bnRyb2wgIC0gQ0lEIGNvbnRyb2wgdHlwZQ0KPiA+ICAgICogQGNmZzogY29udHJvbCBjb25maWd1
cmF0aW9uDQo+ID4gQEAgLTg0MSw2ICs4NDQsNyBAQCBjb25zdCBzdHJ1Y3QgbXRrX3Zjb2RlY19k
ZWNfcGRhdGENCj4gPiBtdGtfdmRlY184MTgzX3BkYXRhID0gew0KPiA+ICAgCS52cDlfcGFyYW1z
ID0gew0KPiA+ICAgCQkubGV2ZWwgPSBWNEwyX01QRUdfVklERU9fVlA5X0xFVkVMXzRfMCwNCj4g
PiAgIAkJLnByb2ZpbGUgPSBWNEwyX01QRUdfVklERU9fVlA5X1BST0ZJTEVfMSwNCj4gPiArCQku
cHJvYl9zaXplID0gVlA5X1BST0JfQlVGX1NJWkUsDQo+ID4gICAJfSwNCj4gPiAgIH07DQo+ID4g
ICANCj4gPiBAQCAtODkyLDYgKzg5Niw3IEBAIGNvbnN0IHN0cnVjdCBtdGtfdmNvZGVjX2RlY19w
ZGF0YQ0KPiA+IG10a192ZGVjXzgxODhfcGRhdGEgPSB7DQo+ID4gICAJLnZwOV9wYXJhbXMgPSB7
DQo+ID4gICAJCS5sZXZlbCA9IFY0TDJfTVBFR19WSURFT19WUDlfTEVWRUxfNV8xLA0KPiA+ICAg
CQkucHJvZmlsZSA9IFY0TDJfTVBFR19WSURFT19WUDlfUFJPRklMRV8yLA0KPiA+ICsJCS5wcm9i
X3NpemUgPSBWUDlfUFJPQl9CVUZfU0laRSwNCj4gPiAgIAl9LA0KPiA+ICAgfTsNCj4gPiAgIA0K
PiA+IEBAIC05MTAsNiArOTE1LDcgQEAgY29uc3Qgc3RydWN0IG10a192Y29kZWNfZGVjX3BkYXRh
DQo+ID4gbXRrX3ZkZWNfODE5Ml9wZGF0YSA9IHsNCj4gPiAgIAkudnA5X3BhcmFtcyA9IHsNCj4g
PiAgIAkJLmxldmVsID0gVjRMMl9NUEVHX1ZJREVPX1ZQOV9MRVZFTF81XzEsDQo+ID4gICAJCS5w
cm9maWxlID0gVjRMMl9NUEVHX1ZJREVPX1ZQOV9QUk9GSUxFXzEsDQo+ID4gKwkJLnByb2Jfc2l6
ZSA9IFZQOV9QUk9CX0JVRl9TSVpFLA0KPiA+ICAgCX0sDQo+ID4gICB9Ow0KPiA+ICAgDQo+ID4g
QEAgLTkyOCw2ICs5MzQsNyBAQCBjb25zdCBzdHJ1Y3QgbXRrX3Zjb2RlY19kZWNfcGRhdGENCj4g
PiBtdGtfdmRlY184MTk1X3BkYXRhID0gew0KPiA+ICAgCS52cDlfcGFyYW1zID0gew0KPiA+ICAg
CQkubGV2ZWwgPSBWNEwyX01QRUdfVklERU9fVlA5X0xFVkVMXzVfMiwNCj4gPiAgIAkJLnByb2Zp
bGUgPSBWNEwyX01QRUdfVklERU9fVlA5X1BST0ZJTEVfMiwNCj4gPiArCQkucHJvYl9zaXplID0g
VlA5X1BST0JfQlVGX1NJWkUsDQo+ID4gICAJfSwNCj4gPiAgIH07DQo+ID4gICANCj4gPiBAQCAt
OTQ2LDYgKzk1Myw3IEBAIGNvbnN0IHN0cnVjdCBtdGtfdmNvZGVjX2RlY19wZGF0YQ0KPiA+IG10
a192ZGVjXzgxOTZfcGRhdGEgPSB7DQo+ID4gICAJLnZwOV9wYXJhbXMgPSB7DQo+ID4gICAJCS5s
ZXZlbCA9IFY0TDJfTVBFR19WSURFT19WUDlfTEVWRUxfNV8yLA0KPiA+ICAgCQkucHJvZmlsZSA9
IFY0TDJfTVBFR19WSURFT19WUDlfUFJPRklMRV8yLA0KPiA+ICsJCS5wcm9iX3NpemUgPSBWUDlf
NEtfUFJPQl9CVUZfU0laRSwNCj4gPiAgIAl9LA0KPiA+ICAgfTsNCj4gPiAgIA0KPiA+IEBAIC05
ODEsNiArOTg5LDcgQEAgY29uc3Qgc3RydWN0IG10a192Y29kZWNfZGVjX3BkYXRhDQo+ID4gbXRr
X3ZkZWNfODE4Nl9wZGF0YSA9IHsNCj4gPiAgIAkudnA5X3BhcmFtcyA9IHsNCj4gPiAgIAkJLmxl
dmVsID0gVjRMMl9NUEVHX1ZJREVPX1ZQOV9MRVZFTF80XzEsDQo+ID4gICAJCS5wcm9maWxlID0g
VjRMMl9NUEVHX1ZJREVPX1ZQOV9QUk9GSUxFXzEsDQo+ID4gKwkJLnByb2Jfc2l6ZSA9IFZQOV9Q
Uk9CX0JVRl9TSVpFLA0KPiA+ICAgCX0sDQo+ID4gICB9Ow0KPiA+ICAgDQo+ID4gQEAgLTEwMTEs
NSArMTAyMCw2IEBAIGNvbnN0IHN0cnVjdCBtdGtfdmNvZGVjX2RlY19wZGF0YQ0KPiA+IG10a192
ZGVjXzgxODlfcGRhdGEgPSB7DQo+ID4gICAJLnZwOV9wYXJhbXMgPSB7DQo+ID4gICAJCS5sZXZl
bCA9IFY0TDJfTVBFR19WSURFT19WUDlfTEVWRUxfNV8yLA0KPiA+ICAgCQkucHJvZmlsZSA9IFY0
TDJfTVBFR19WSURFT19WUDlfUFJPRklMRV8yLA0KPiA+ICsJCS5wcm9iX3NpemUgPSBWUDlfNEtf
UFJPQl9CVUZfU0laRSwNCj4gPiAgIAl9LA0KPiA+ICAgfTsNCj4gPiBkaWZmIC0tZ2l0DQo+ID4g
YS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9kZWNvZGVyL3ZkZWMvdmRl
Y192cDlfcmVxXw0KPiA+IGxhdF9pZi5jDQo+ID4gYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21l
ZGlhdGVrL3Zjb2RlYy9kZWNvZGVyL3ZkZWMvdmRlY192cDlfcmVxXw0KPiA+IGxhdF9pZi5jDQo+
ID4gaW5kZXggODJlMjU3YmQwNTlmLi5lOGJhOTlkMzFlNzQgMTAwNjQ0DQo+ID4gLS0tDQo+ID4g
YS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9kZWNvZGVyL3ZkZWMvdmRl
Y192cDlfcmVxXw0KPiA+IGxhdF9pZi5jDQo+ID4gKysrDQo+ID4gYi9kcml2ZXJzL21lZGlhL3Bs
YXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9kZWNvZGVyL3ZkZWMvdmRlY192cDlfcmVxXw0KPiA+IGxh
dF9pZi5jDQo+ID4gQEAgLTIyLDcgKzIyLDYgQEANCj4gPiAgICNkZWZpbmUgVlA5X1JFU0VUX0ZS
QU1FX0NPTlRFWFRfQUxMIDMNCj4gPiAgIA0KPiA+ICAgI2RlZmluZSBWUDlfVElMRV9CVUZfU0la
RSA0MDk2DQo+ID4gLSNkZWZpbmUgVlA5X1BST0JfQlVGX1NJWkUgMjU2MA0KPiA+ICAgI2RlZmlu
ZSBWUDlfQ09VTlRTX0JVRl9TSVpFIDE2Mzg0DQo+ID4gICANCj4gPiAgICNkZWZpbmUgSERSX0ZM
QUcoeCkgKCEhKChoZHIpLT5mbGFncyAmIFY0TDJfVlA5X0ZSQU1FX0ZMQUdfIyN4KSkNCj4gPiBA
QCAtNTQ2LDYgKzU0NSw3IEBAIHN0YXRpYyBpbnQNCj4gPiB2ZGVjX3ZwOV9zbGljZV9hbGxvY193
b3JraW5nX2J1ZmZlcihzdHJ1Y3QgdmRlY192cDlfc2xpY2VfaW5zdGFuY2UNCj4gPiAqaQ0KPiA+
ICAgCQkJCQkgICAgICAgc3RydWN0DQo+ID4gdmRlY192cDlfc2xpY2VfdnNpICp2c2kpDQo+ID4g
ICB7DQo+ID4gICAJc3RydWN0IG10a192Y29kZWNfZGVjX2N0eCAqY3R4ID0gaW5zdGFuY2UtPmN0
eDsNCj4gPiArCXN0cnVjdCBtdGtfdmNvZGVjX2RlY19kZXYgKnBkZXYgPSBjdHgtPmRldjsNCj4g
PiAgIAllbnVtIHZkZWNfdnA5X3NsaWNlX3Jlc29sdXRpb25fbGV2ZWwgbGV2ZWw7DQo+ID4gICAJ
Lyogc3VwZXIgYmxvY2tzICovDQo+ID4gICAJdW5zaWduZWQgaW50IG1heF9zYl93Ow0KPiA+IEBA
IC02MTYsNyArNjE2LDcgQEAgc3RhdGljIGludA0KPiA+IHZkZWNfdnA5X3NsaWNlX2FsbG9jX3dv
cmtpbmdfYnVmZmVyKHN0cnVjdCB2ZGVjX3ZwOV9zbGljZV9pbnN0YW5jZQ0KPiA+ICppDQo+ID4g
ICAJfQ0KPiA+ICAgDQo+ID4gICAJaWYgKCFpbnN0YW5jZS0+cHJvYi52YSkgew0KPiA+IC0JCWlu
c3RhbmNlLT5wcm9iLnNpemUgPSBWUDlfUFJPQl9CVUZfU0laRTsNCj4gPiArCQlpbnN0YW5jZS0+
cHJvYi5zaXplID0gcGRldi0+dmRlY19wZGF0YS0NCj4gPiA+dnA5X3BhcmFtcy5wcm9iX3NpemU7
DQo+ID4gICAJCWlmIChtdGtfdmNvZGVjX21lbV9hbGxvYyhjdHgsICZpbnN0YW5jZS0+cHJvYikp
DQo+ID4gICAJCQlnb3RvIGVycjsNCj4gPiAgIAl9DQo+IA0KPiANCg==

