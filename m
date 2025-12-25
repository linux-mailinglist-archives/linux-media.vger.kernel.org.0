Return-Path: <linux-media+bounces-49533-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 01242CDDA0C
	for <lists+linux-media@lfdr.de>; Thu, 25 Dec 2025 10:55:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6C35C3020BED
	for <lists+linux-media@lfdr.de>; Thu, 25 Dec 2025 09:55:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D05B319862;
	Thu, 25 Dec 2025 09:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Md+qv0jF";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="aJfE8kPF"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD3029BDAE;
	Thu, 25 Dec 2025 09:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766656534; cv=fail; b=US/fZiavR3iwbJC9m6FYnjUg/YgW8mXTF2FpCryUOM1sdzokEd27cwN5pzcCwY95tMgM5Fp7XU1KWdlKI2UBYxoM1Q3bio8o2vCSlvrnmK6XI697Y47209IfyIhFPInmcNZGGnigVqrZVpXG4MOKU6srWw/AdeWrZqB6uMIWxMQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766656534; c=relaxed/simple;
	bh=QkWpkB3YpjpbGVZVV9cSijwc64WUbgMJK8t4u7GZDxY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=akPOoY+HWQ4qNlPX4nJJQHoMMTdxWUvUExC5kj0MLFS3sUtNdms9sx8TioN9iLtfaRU84juBkE4CTEGrsB9T7A6/hfrJ4tYiGbBCOG2QUwCUJwddfqCHPY9ZkXZKiSAZGs4skfNz3wGeBOqGjjFeHuhWJo3COUPQd3swv1RyU8o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=Md+qv0jF; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=aJfE8kPF; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: d620ff90e17711f08a742f2735aaa5e5-20251225
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=QkWpkB3YpjpbGVZVV9cSijwc64WUbgMJK8t4u7GZDxY=;
	b=Md+qv0jFoadwDh5zEIGRwqLEScjVcWrgelUELwelQgaLiwKBUMsfwJyNhbli9x1yeiAiqWkWT+ksrwrsd0W4euz12Bo4t6yUx76JNVr3cDbEVCgYhJWXH2+HB7OCFOw0nJlP2mQPIqFNfC/1piaJZJCVszEAlP9pz/9Xi11Neco=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.9,REQID:b79d95f0-5b4c-432f-966a-df9aec1797b7,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:5047765,CLOUDID:e4eed2c6-8a73-4871-aac2-7b886d064f36,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d620ff90e17711f08a742f2735aaa5e5-20251225
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 434586144; Thu, 25 Dec 2025 17:55:25 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 25 Dec 2025 17:55:24 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 25 Dec 2025 17:55:24 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dB4Tmo2l7Dm4qbJuyQf8v2ExHfCPmB6rsEvrSgvuydcsTA7Fg/14+0iZwMALUq1jJYAvKPKZnD7+tQeLDLi1rZe0/6jxTi4oKiNp44cBFWBZp+bkpwymAiyCwtvM279xubpSr/KLgGvZj+LfSVlZywFmmZf9whXmcVZL6hDAORWP98nac9O4fVQzOgH2DpP/bpRkIGlFxjHIGBlaIcLj0Ss7+OpsY8QOfoVMXOcfHn2WbrqMml+rihasykn1C0+gHMb5iqoYOpK9udlb3zTZpkNLTGq/608ksoVlLkceH4A3zXs9xL5LARd7lfIUw0WByFi9lJsUIW1AuJxBgXMwLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QkWpkB3YpjpbGVZVV9cSijwc64WUbgMJK8t4u7GZDxY=;
 b=ZYkr/WrqAiFO0P4IGVK/ISliIDVavt2ApeVqouwDK+6vwnhl1E7zTNfzWcwUvGdDGVxq8rWzN6czDZgrKqphg6C4sjraEf8EJldggh9ktCAIQtxBs5mZX2Ndn4o6B95uZvo2pCOk6W3vDgGTRqJ89xVd2zm0WbWjsCVgevVw1a51FBESLQePCMWUt1Vi7+Ic9RPaJPGC82XS6B9FKnNOrXODfZcI+KZae6T508RKUt9LWEFxoGDDMofaY3PQ04tmwLYw+ls/Oy69ojZNsMWicEWr9HH3Kq5rHZH+gAGciMopfBCEh1D5li8v8j0+bID8gS/yK4gqG/p7kHT99npHEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QkWpkB3YpjpbGVZVV9cSijwc64WUbgMJK8t4u7GZDxY=;
 b=aJfE8kPFd0gdaP19woq5/GDDmNnEqaOdv/3X0ewcp30mQHaVEyoBsLq/gLPZCJiNAKKTXT1UQtWcPrBb3Op1JTKw4JsfTZjz2ZE+NIu6DuIJQ6au/Rugz8+kWMDp16ftydH6xMQOsosywRt4M8EREFqeVv4xqw0D5R8n23SzpSc=
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com (2603:1096:301:b9::5)
 by TYZPR03MB6448.apcprd03.prod.outlook.com (2603:1096:400:1cb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Thu, 25 Dec
 2025 09:55:20 +0000
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::a013:f3b3:a461:8ece]) by PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::a013:f3b3:a461:8ece%4]) with mapi id 15.20.9434.009; Thu, 25 Dec 2025
 09:55:20 +0000
From: =?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?R2VvcmdlIFN1biAo5a2Z5p6XKQ==?= <George.Sun@mediatek.com>,
	=?utf-8?B?VGlmZmFueSBMaW4gKOael+aFp+ePiik=?= <tiffany.lin@mediatek.com>,
	"nhebert@chromium.org" <nhebert@chromium.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
	=?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>,
	=?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
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
Subject: Re: [PATCH v6 05/10] media: mediatek: vcodec: refactor setup dst
 buffer metadata interface for VP9 decoder
Thread-Topic: [PATCH v6 05/10] media: mediatek: vcodec: refactor setup dst
 buffer metadata interface for VP9 decoder
Thread-Index: AQHcY18VFgTkY+GA6UuxhHCBHF+GTbUc8u8AgBVPeoA=
Date: Thu, 25 Dec 2025 09:55:20 +0000
Message-ID: <72cae8fffc3ccd2a6f31fc777a5441c9a15c82fa.camel@mediatek.com>
References: <20251202074038.3173-1-kyrie.wu@mediatek.com>
	 <20251202074038.3173-6-kyrie.wu@mediatek.com>
	 <d9a58ddf9b90d8320562ec54f2bd74fa77f0bc67.camel@collabora.com>
In-Reply-To: <d9a58ddf9b90d8320562ec54f2bd74fa77f0bc67.camel@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR03MB6186:EE_|TYZPR03MB6448:EE_
x-ms-office365-filtering-correlation-id: 151539a5-a2a1-4028-89d0-08de439bb71e
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|921020|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?NmNLQzZWdnM3NjBYOHFpZ2NrR28vSFlKTzZNQXVzRlJVY2RDZzlSK3RlUkto?=
 =?utf-8?B?bTRIWDRjR1hEc1JEZHJJQUVycDVHYUpFanVIS01oam5ncUNmZlRPTWVSMW42?=
 =?utf-8?B?Vkh0d3hJU1ViT0xiY3ArOHJyTFdLOGU3Sy8vZ3BacWxJNlB4cURIUSs0dnRx?=
 =?utf-8?B?TXI1STdFTEtIc1A5Szh5S24vUExDOFhXNW5WdkJTMnpwZ1Q5VFQxb05ESkV1?=
 =?utf-8?B?eXJ3Zm51SVZXWVJUOVVvNzIwQzQzcnIyR29naVZ6YXl0dE9DUVg1eEswNWJQ?=
 =?utf-8?B?eDhSa3liV2JUbHVRSUJRWUIvcUY2dnppd0VjZXFOVDFBeEFqUFo2MXJEbENR?=
 =?utf-8?B?YXpCeDNYZXpLN0U1WnFBb296VVRCSlBqK1JicGp1SUlUV3YzTWdXTjNydG5X?=
 =?utf-8?B?L1dVa3IyQWhFQlNiZHVSZk1OWnp5aG92RUZscGd4UU1LckVBUXJIUjFsWmhC?=
 =?utf-8?B?VVBuWkJVUWI0YmkyOEJOVXluUklGbkdCM2I0RWpDbUJhamdiVUk5eUs2RmNW?=
 =?utf-8?B?QWkxM1pwbUpqbE8rTXA2MFd1byswL2pna1RnTktwRFFCbFZpM3V3WjQ5TWtQ?=
 =?utf-8?B?NUdESnJ2TFVRZmlOWUxkZlBNemVPZEZ6dWh6M1JYM0s0TnM1eWFXZTNtVlMy?=
 =?utf-8?B?VGJYS1BnWWFRRkp4MGx0eGx2TytjalpkNjVObFBTQ3hzZEI1aE1ORmRBQnp0?=
 =?utf-8?B?S1NLYVIwNWNOSFVlZlp4S3RQWDN3cnNlVnRNbW5MY1AxbDhrRExGU1hYS3lG?=
 =?utf-8?B?MVdNaDlOZTJUZ1lxbmtDNlZIWVBGdDZyZGZ3R0ZEQWh3RHh1WDFVL3ZZQTBz?=
 =?utf-8?B?b2o0OGo3TTNwU2txN3p0SDBVcE5laGdsZjlWWjNqL1RKNlZMb2FCaGVoQXRL?=
 =?utf-8?B?cks5WExGUE1sKzZOZWJhYitnS2JDN3BuUVU4WHdaQkt0WGRpR09odzJDcEVk?=
 =?utf-8?B?V2pkeUM4aDJKQk01R3ZYdWtRTzgxWmM4QUQrWkJlT1VjaE4xRzgwb0Z5cGM5?=
 =?utf-8?B?Ri91cGR3QzNGbTAyK3lUMW5aeWpqeCs4cXlDSTFHMTZxamszSnp2QzFyNVBw?=
 =?utf-8?B?eW1OQStBQlY1ekJOTlgyTnhZVlJIdzVtKzV3VEx6QmpZbnJwSXhVRXViZXhs?=
 =?utf-8?B?b3czb1FwTTIwcEdrSkxtYVpRSlBFWVBVMHF1TmVlQmRRZDV4bU9PQTVYSzhl?=
 =?utf-8?B?bnlkdWRHRVRucGFGalA4M3ZmRjlKb3ROM2xMRHFhMTJSN1VtRlJmYVNGeFd4?=
 =?utf-8?B?TURWdkZFdUdzMFJFcTNrMkZMdG5NSHJnc0Fub1A5NEJYVE5mMGRUeFYybFJ3?=
 =?utf-8?B?aGhaRDJTSFd4dE56NzRzRklwSkZiaTdmT2NuSnUxTG0xZ2NwR1N1ako5RUdJ?=
 =?utf-8?B?NXVOaUZPd3ZQd3I0bVRBZHpkMTJkSGVqQUFXMlZ5dTVlUFNMaUdVY20wVjQ1?=
 =?utf-8?B?SXRJaEVQUFQvNVFldmJVcU5VUXNndm1NalBaSWRjVUx6N0twUkRmLzNnakZC?=
 =?utf-8?B?eUhMeTh3VXNNQmtSVXhFbGhRSzBVck1UNmdkZHJQVDNOVldEOXh4VWg4bEJC?=
 =?utf-8?B?cVl5RkJKT3d6NEFKalpsamlvaytnRzFOWm1LaUg5SWhrcmRuWXpuVWxjNHpR?=
 =?utf-8?B?Q1U2S3hOQUFoUVF2SGdBRmpVU3Z5cE4xVFdvREJTdGwyWWVzVUlJaktlNmVQ?=
 =?utf-8?B?cVNIa0RBK0RKK2VNZy9aYjNtVFRtSEZneDkwaE9WLzdmQjRrVFBBSjZiOHBX?=
 =?utf-8?B?VlNOTWx2bEt6SnNSZTZ4ajlEaUEyMk5OcmpZbGhaQ2ZZZEtLeUtIWHY2b2Nt?=
 =?utf-8?B?eGhMZlpUenZjdk83T1FDeEppc0h4cGR2aERjRk1KK0xSRTNtQUVpQ0FBSWth?=
 =?utf-8?B?d3RiQlJXaW4yTzU4TUlUOW5zQ3NqMzY0eGpveExLd1RSeEI5YVF4OVFMRmVm?=
 =?utf-8?B?VTZ0TWduK21Sd2ZsZXFiVXNDWE5DOXFzdWFUakNNbjJ0ckwwSzIzajJOZ2Rq?=
 =?utf-8?B?ZUJONFlZMG4vOFhsMDdiSEdvcm5xdml6QnA0NjZiYkV5UVBiUTgxQWc0TXV3?=
 =?utf-8?B?MVFKSjJEWGpSYWRhdnIrTEZBalcxcUtkN2NSQT09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB6186.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SnNlV2NQMGRvS2NjQmJuNS9lMEx4NEg0M0ExMTMxc3oxb3B2Zm9PTkkxNnNj?=
 =?utf-8?B?enQvcmo3dEYwRFNtYXRtbmwxNXMwaC9vWWJwU1JCT1JNU2NBZFlXNGNVYWhD?=
 =?utf-8?B?dmx2M1YzdmFBSzJUaktrWjk0aE5pb3dHY0l2M1IzNUtxeEQ5eEdaR0dzVllS?=
 =?utf-8?B?a25hSFpra1BybWxtRFhPcVZwd013TnFHVTRXV2xNSGpuNTZGUjJWYjRoWkFV?=
 =?utf-8?B?dFNSVHF3TUxOSXpWNUM0SHNxVDRXcUJzRmpVSFhUZmIyWlM4ZVBhVklFeTU4?=
 =?utf-8?B?amRkQU1Ob2NOVW5sTE1mYzdnOEJkdS9iVGpoQkJaZVJydk5nNGVjeWEyRU05?=
 =?utf-8?B?M3duVGIxS2pjU005R2I1Q0JaNHpiR0dMZnVDcysybTFLUnpqTDlpTFZVYVR5?=
 =?utf-8?B?S3BnZWhvbllJeWNBNHJDNzVqZzFUOG5aN2ViMjRLMnFEZTgzeGtEdGNMb2dy?=
 =?utf-8?B?L1hmVm5tV3NjVHZNYjBvVXJreGExdVA2RXNIUm9zaklTU0NQb2k5MWtuRUZL?=
 =?utf-8?B?RmRCRDVoU2FPNkExWVZZdEUxTU1wZXNNTlpuaHRqQzdhL290R1hCZGhnRmVy?=
 =?utf-8?B?TVlKSlYvSWo0TVBYWXRTYlZRV3R5TWV0aTdwMVZwQjEvaTQ3d2padWxyV0kz?=
 =?utf-8?B?bWVCZUhGd0R0M3M0Snd5eVo2L0puL1RoTEVaT2pqYy9xUDVyS1lwaFZsdXZo?=
 =?utf-8?B?ZjdJaUJiRU1FTDJ0dHRsWXB5WTdlUTdRS3VxOHl1M3VXblFVNVJlcVM0dFBw?=
 =?utf-8?B?d2tzbGtidXA0dFhTM2NSUzY2SjhodFRPdThsSkRTOThvT3o1ZnRQTHhJOEF2?=
 =?utf-8?B?SERiM0twT3hZbG1qb2NyRUROUXBFYlorMk5scml4WnZmTzUzTytJMDVSNFJo?=
 =?utf-8?B?cDlTQlM3Sk5UUDFDenduVnJoRDZIWGJkOW83ejBOelJsWmcyZTBFK2lHMGlT?=
 =?utf-8?B?amlkNmxOY1l6M0ErNXVsTXRMcUQvK0Jhb29lZ0xsL3RQRDJiUHhPYlNuVTVy?=
 =?utf-8?B?ZHpDUHdRd2tVV3JsMGpoOFFRNVRlRnNkNTNLMm1sS3lXYUpybk5kS1YwZ0Ez?=
 =?utf-8?B?dFl5ZkFsUFFHQVh6RWdkSlBFeWFNRVpwMlNzaUpPWmtCeHRsOXFWR21rUkFG?=
 =?utf-8?B?bzZwMUI4SU1GMUZaNGh5VVBlb3dDbmFOZkx5VUNuZkVSb2tXSXhBT1hSSUx6?=
 =?utf-8?B?Ry9FK1U4WkpxaHNadkNoSWZQQXUzbzUyckFDczIxWVBRRzl3NWs0alV4Y1hT?=
 =?utf-8?B?OGRVc09UWWRHOURIaXJpWVY4TXMrZHBSMmgxekx0S2p3Rnc5S3Z4Z0pma29Z?=
 =?utf-8?B?b1RoNExtTmVGL1pFUmY4YnJ2SXNCNlZNRkVEQmtSZTE2Wmx3dk1VeVdSOHdL?=
 =?utf-8?B?dHAxL1BVRmRmZVNRZjMybUoza1NEUnZkNEdQd2d6dzNLYmczSm9JdUEvQU1y?=
 =?utf-8?B?RUl1Tk9TSjlhS3BiK1NkTkpuSHhaRlhOUjUybFJyd0l6eWdOVi95bE5DOGhM?=
 =?utf-8?B?bUJpRWxqZXBkcDVGVmZTc2NMOFgyWnJ2N2thaURNTnRYUnVGMzRabEtIOTJW?=
 =?utf-8?B?dVRpVGc0dUhvZE5LQm1veUZBYkF6eDVWNVFGN05LV2RWeTBGQk1WTVI0R3ly?=
 =?utf-8?B?aWRwdlRyaEp2OHZaZDliQWh4UG1OSmdLR2NHUDQxdEFXYzcwT0w3aXZFcXk3?=
 =?utf-8?B?ZGNJeFhRdG90dzhFYTNjc2gxckVFTmZDTjVaY1BLcUxqMUhrNDZlWWc0M0JZ?=
 =?utf-8?B?Z0NTN3c3ajM1QlErRGxQYWNqenNsV1ozWU03QmFyYXU0ajRJWEhZeFgzL1kr?=
 =?utf-8?B?cTU2K1VJWlNUSUV4U3NqNnRDRkw4SG55VWxTcENVTThEU1QxYUZVRWJxWlRw?=
 =?utf-8?B?bGFWNUh1YngzOFVvQ1pvMGdwQTlDaHdFbk0wUko5eUZ4NWVoM0VCRG5PbmFV?=
 =?utf-8?B?bkRRR1YyU1k5UHoxNHZ6cnYrL1BZRWQ3Ui9PZXRQRmhUR3kyK2treW40L3VC?=
 =?utf-8?B?VTdBczB1YjM3cnVPZDFtS2JhWVRmZjI3VHhlMVRQSFJPazlWR3BnVDhEUGFk?=
 =?utf-8?B?LzlVa2JmUmlEWDJaQ3ZmYUxXZitQMFVTcERwNjN4TGFFY3E2SndiMFlYMnNB?=
 =?utf-8?B?bWw3RXN1MUxKdjUvbFNVNVRFODRhSHYxZjB1UTFLckhMc24vaUdDelZoSklL?=
 =?utf-8?B?TDR2VVVXYXdPVVpKMEtPVUxvdVJwOUVMVkYrZUR5NlhGOEtVSE85RUVZbnA2?=
 =?utf-8?B?aTV3Y2JRU2xXOFpBK2JGQ0xQdG5pT3lCcTR1RSt1aU10NkhodHoyeWJWVTNO?=
 =?utf-8?B?MVlvVCtoMzZnUkVNVmxXSWtBbWZJNjV2c0lDVkM2eGVraFhtRkVqdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <05046178AB29C745BE8B240052E0F10B@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB6186.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 151539a5-a2a1-4028-89d0-08de439bb71e
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Dec 2025 09:55:20.3975
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UN2trNTpBIpRgKKe2Wk+6VQwa5EIr58TsqYZdLoZch4lkBzpayUit3cAnLwBheQzcPfQ2yFdw7qKb4z3zrjUXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB6448

T24gVGh1LCAyMDI1LTEyLTExIGF0IDE1OjI5IC0wNTAwLCBOaWNvbGFzIER1ZnJlc25lIHdyb3Rl
Og0KPiBIaSwNCj4gDQo+IExlIG1hcmRpIDAyIGTDqWNlbWJyZSAyMDI1IMOgIDE1OjQwICswODAw
LCBLeXJpZSBXdSBhIMOpY3JpdCA6DQo+ID4gUHJldmlvdXNseSwgY2FsbGluZyB2ZGVjX3ZwOV9z
bGljZV9zZXR1cF9zaW5nbGVfZnJvbV9zcmNfdG9fZHN0DQo+ID4gd2l0aCB2NGwyX20ybV9uZXh0
X3NyY19idWYgdG8gb2J0YWluIGJvdGggYnVmZmVycyByZXN1bHRlZCBpbg0KPiA+IC1FSU5WQUws
DQo+ID4gaW50ZXJydXB0aW5nIHRoZSBkZWNvZGluZyBwcm9jZXNzLiBUbyByZXNvbHZlIHRoaXMs
DQo+ID4gdGhlIGludGVyZmFjZSBzaG91bGQgYmUgdXBkYXRlZCB0byBzZXQgYm90aCBzcmMgYW5k
IGRzdCBidWZmZXJzDQo+ID4gZm9yIG1ldGFkYXRhIGNvbmZpZ3VyYXRpb24uDQo+IA0KPiBJJ20g
aGF2ZW4ndCBmaWd1cmUtb3V0IHdoeSB0aGlzIGhhcHBlbnMsIHBlcmhhcHMgeW91IGNhbiBhZGQg
bW9yZQ0KPiBkZXRhaWxzID8NCj4gDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogS3lyaWUgV3Ug
PGt5cmllLnd1QG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uL3Zjb2RlYy9kZWNvZGVy
L3ZkZWMvdmRlY192cDlfcmVxX2xhdF9pZi5jIHwgMjEgKysrKysrKysrKy0tLS0tDQo+ID4gLS0t
LQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0p
DQo+ID4gDQo+ID4gZGlmZiAtLWdpdA0KPiA+IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRp
YXRlay92Y29kZWMvZGVjb2Rlci92ZGVjL3ZkZWNfdnA5X3JlcV8NCj4gPiBsYXRfaWYuYw0KPiA+
IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay92Y29kZWMvZGVjb2Rlci92ZGVjL3Zk
ZWNfdnA5X3JlcV8NCj4gPiBsYXRfaWYuYw0KPiA+IGluZGV4IGZhMGY0MDZmNzcyNi4uOTUxM2Rk
ZGU3YzdjIDEwMDY0NA0KPiA+IC0tLQ0KPiA+IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRp
YXRlay92Y29kZWMvZGVjb2Rlci92ZGVjL3ZkZWNfdnA5X3JlcV8NCj4gPiBsYXRfaWYuYw0KPiA+
ICsrKw0KPiA+IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay92Y29kZWMvZGVjb2Rl
ci92ZGVjL3ZkZWNfdnA5X3JlcV8NCj4gPiBsYXRfaWYuYw0KPiA+IEBAIC02OTYsMjEgKzY5Niwy
MiBAQCBzdGF0aWMgaW50IHZkZWNfdnA5X3NsaWNlX3RpbGVfb2Zmc2V0KGludA0KPiA+IGlkeCwg
aW50IG1pX251bSwgaW50IHRpbGVfbG9nMikNCj4gPiAgCXJldHVybiBtaW4ob2Zmc2V0LCBtaV9u
dW0pOw0KPiA+ICB9DQo+ID4gIA0KPiA+IC1zdGF0aWMNCj4gPiAtaW50IHZkZWNfdnA5X3NsaWNl
X3NldHVwX3NpbmdsZV9mcm9tX3NyY190b19kc3Qoc3RydWN0DQo+ID4gdmRlY192cDlfc2xpY2Vf
aW5zdGFuY2UgKmluc3RhbmNlKQ0KPiA+ICtzdGF0aWMgaW50IHZkZWNfdnA5X3NsaWNlX3NldHVw
X3NpbmdsZV9mcm9tX3NyY190b19kc3Qoc3RydWN0DQo+ID4gdmRlY192cDlfc2xpY2VfaW5zdGFu
Y2UgKmluc3RhbmNlLA0KPiA+ICsJCQkJCQkgICAgICAgc3RydWN0DQo+ID4gbXRrX3Zjb2RlY19t
ZW0gKmJzLA0KPiA+ICsJCQkJCQkgICAgICAgc3RydWN0IHZkZWNfZmINCj4gPiAqZmIpDQo+ID4g
IHsNCj4gPiAtCXN0cnVjdCB2YjJfdjRsMl9idWZmZXIgKnNyYzsNCj4gPiAtCXN0cnVjdCB2YjJf
djRsMl9idWZmZXIgKmRzdDsNCj4gPiArCXN0cnVjdCBtdGtfdmlkZW9fZGVjX2J1ZiAqc3JjX2J1
Zl9pbmZvOw0KPiA+ICsJc3RydWN0IG10a192aWRlb19kZWNfYnVmICpkc3RfYnVmX2luZm87DQo+
ID4gIA0KPiA+IC0Jc3JjID0gdjRsMl9tMm1fbmV4dF9zcmNfYnVmKGluc3RhbmNlLT5jdHgtPm0y
bV9jdHgpOw0KPiANCj4gTXkgY29uY2VybiBpcyB0aGF0IHZkZWNfdnA5X3NsaWNlX3NldHVwX2xh
dF9mcm9tX3NyY19idWYoKSBhbHNvDQo+IGRlcGVuZHMgb24gdGhlDQo+IHRpcCBvZiB0aGUgT1VU
UFVUIHF1ZXVlLCB3aHkgaXQgdGhpcyBwcm9ibGVtIHdpdGggbGltaXRlZCB0byBzaW5nbGUNCj4g
Y29yZSA/DQo+IA0KPiBDYW4geW91IGFwcGx5IHRoZSBtYW51YWwgY29tcGxldGlvbiBmaXhlcywg
YW5kIGNoZWNrIGlmIHRoZSBwcm9ibGVtDQo+IHN0aWxsDQo+IGFwcGVhcj8gSXMgdGhhdCBzb21l
dGhpbmcgeW91IHJlcHJvZHVjZSBldmVyeSB0aW1lID8gUGVyaGFwcyBpdA0KPiBzaG91bGQgYmUg
a2VwdA0KPiBvdXQgb2YgdGhpcyBzZXJpZSA/DQo+IA0KPiANCj4gPiAtCWlmICghc3JjKQ0KPiA+
ICsJc3JjX2J1Zl9pbmZvID0gY29udGFpbmVyX29mKGJzLCBzdHJ1Y3QgbXRrX3ZpZGVvX2RlY19i
dWYsDQo+ID4gYnNfYnVmZmVyKTsNCj4gPiArCWlmICghc3JjX2J1Zl9pbmZvKQ0KPiA+ICAJCXJl
dHVybiAtRUlOVkFMOw0KPiANCj4gSXRzIGEgYml0IG9mIGEgY29uY2VybiBpbiB0ZXJtIG9mIG1l
bW9yeSBsaWZldGltZSAvIHBvc3NpYmxlIHVzZQ0KPiBhZnRlciBmcmVlLg0KPiBXaG8ncyBob2xk
aW5nIG9uIHRoZSBidWZmZXIgaWYgaXRzIG5vdCBpbiB0aGUgcXVldWUgPw0KPiANCj4gTmljb2xh
cw0KDQpEZWFyIE5pY29sYXMsDQoNClRoYW5rcyBmb3IgeW91ciByZW1pbmRpbmcsIEkgdGhpbmsg
dGhpcyBwYXRjaCBjb3VsZCBhYmFuZG9uLg0KSSB3aWxsIHVwZGF0ZSB0aGUgcGF0Y2ggc2V0IGlu
IHRoZSBuZXh0IHZlcnNpb24uDQoNClRoYW5rcy4NCg0KS3lyaWUuDQo+IA0KPiA+ICANCj4gPiAt
CWRzdCA9IHY0bDJfbTJtX25leHRfZHN0X2J1ZihpbnN0YW5jZS0+Y3R4LT5tMm1fY3R4KTsNCj4g
PiAtCWlmICghZHN0KQ0KPiA+ICsJZHN0X2J1Zl9pbmZvID0gY29udGFpbmVyX29mKGZiLCBzdHJ1
Y3QgbXRrX3ZpZGVvX2RlY19idWYsDQo+ID4gZnJhbWVfYnVmZmVyKTsNCj4gPiArCWlmICghZHN0
X2J1Zl9pbmZvKQ0KPiA+ICAJCXJldHVybiAtRUlOVkFMOw0KPiA+ICANCj4gPiAtCXY0bDJfbTJt
X2J1Zl9jb3B5X21ldGFkYXRhKHNyYywgZHN0LCB0cnVlKTsNCj4gPiArCXY0bDJfbTJtX2J1Zl9j
b3B5X21ldGFkYXRhKCZzcmNfYnVmX2luZm8tPm0ybV9idWYudmIsDQo+ID4gJmRzdF9idWZfaW5m
by0+bTJtX2J1Zi52YiwgdHJ1ZSk7DQo+ID4gIA0KPiA+ICAJcmV0dXJuIDA7DQo+ID4gIH0NCj4g
PiBAQCAtMTgwMCw3ICsxODAxLDcgQEAgc3RhdGljIGludCB2ZGVjX3ZwOV9zbGljZV9zZXR1cF9z
aW5nbGUoc3RydWN0DQo+ID4gdmRlY192cDlfc2xpY2VfaW5zdGFuY2UgKmluc3RhbmNlLA0KPiA+
ICAJc3RydWN0IHZkZWNfdnA5X3NsaWNlX3ZzaSAqdnNpID0gJnBmYy0+dnNpOw0KPiA+ICAJaW50
IHJldDsNCj4gPiAgDQo+ID4gLQlyZXQgPSB2ZGVjX3ZwOV9zbGljZV9zZXR1cF9zaW5nbGVfZnJv
bV9zcmNfdG9fZHN0KGluc3RhbmNlKTsNCj4gPiArCXJldCA9IHZkZWNfdnA5X3NsaWNlX3NldHVw
X3NpbmdsZV9mcm9tX3NyY190b19kc3QoaW5zdGFuY2UsIGJzLA0KPiA+IGZiKTsNCj4gPiAgCWlm
IChyZXQpDQo+ID4gIAkJZ290byBlcnI7DQo+ID4gIA0K

