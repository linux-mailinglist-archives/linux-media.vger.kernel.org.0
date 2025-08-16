Return-Path: <linux-media+bounces-40001-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FCEB289B9
	for <lists+linux-media@lfdr.de>; Sat, 16 Aug 2025 03:54:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 709FEB63922
	for <lists+linux-media@lfdr.de>; Sat, 16 Aug 2025 01:52:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A65F4191484;
	Sat, 16 Aug 2025 01:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="AzL7bAlk";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="aKxZXZ5Q"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6382B2DA;
	Sat, 16 Aug 2025 01:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755309261; cv=fail; b=POEhKhpLaq1lWbPf6zSBcMj7ObBvNEgf2qamoJvzAkeEq2Roz5P8bnL/VIFVUxzSCSE9R6NvmIe9rGJiE4j80DOceXdU2rJGbRjGiuCghOHkl2D+NJx5cwfm1YCbwMm1dsKXtQ4VZ6ooHWMWGaiBCD6eW3FM9f1B1DPNHs28kZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755309261; c=relaxed/simple;
	bh=LWnLPeApm/7w/IW1CztDF7W4LGDIBPM00Oq4pbnpVks=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jCgVphRYbPHx9S2tV1LBEyGategLkIUUq7MkjuwSUsyCgPhodEzY37BccDVNcJcnsO/z/Y4wzmv2JsH/Ej9Qk+Mnb8IUHeCuWXIIGeXxG+1SUSuBL9I2FOyJdcVXnoROc7JFtJzXDmaSdctNJdm40tFByoOU6KXMtkZZE3APyRY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=AzL7bAlk; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=aKxZXZ5Q; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: e8660cf47a4311f08729452bf625a8b4-20250816
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=LWnLPeApm/7w/IW1CztDF7W4LGDIBPM00Oq4pbnpVks=;
	b=AzL7bAlkjWLP+yDCE1PTXU59fpOwXqdaYRE4vrLy0jx95Nz9Ig0l3viXJAeWbQaayaXk0J0d5BDPhNKShZJ44r2BSVMBDfHVvM2C68yS3XF0fZOAjuvFQstrydmRCj30JLeMnyVQmIVzEoSlwBbVgJEGPUQfRuq8vt9+WnFhdpQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:36d12744-db61-4191-a3c4-57fa31124cd3,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:eab88744-18c5-4075-a135-4c0afe29f9d6,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:-5,Conten
	t:0|15|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:
	0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: e8660cf47a4311f08729452bf625a8b4-20250816
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 522073456; Sat, 16 Aug 2025 09:54:12 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Sat, 16 Aug 2025 09:54:11 +0800
Received: from OS8PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Sat, 16 Aug 2025 09:54:11 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eREmn83rUaz0qWJ/OPU5rj1YqRcdkgkskfa/5V8jteI1NCk8l8y7nEmzUrgvS6E9asFP4XLcvI0AM1LxQR6GbDmOo5NidTj7wMlGKpKXpTGhqt4dRa5FXtjXIzSxS39v+XLNycK0zYo7Bg1pYmc5T7OQE0GNGjzvMjjpyfBRW8e4y7xXj9NBJkYo+r1Sl1RoE6VnZEWII/+zvsUR0gnHYqkVRgglqM8BuuNNi4L/sg/zYuPHDgqLLohc6XOqSpwy6W7reoY+mx99cEQvbTMMyIW+a0qSIuoXkndqKptFrbhUh0/7SviUHXNpgM8KNKSdsC27Do8chuZ4Kuqvv3P1vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LWnLPeApm/7w/IW1CztDF7W4LGDIBPM00Oq4pbnpVks=;
 b=hkE253K+1OiZ1sCUj9oG1vmh8tpNZX9W+4eyJy04Obcc3+Ag7E+hCAB+vPKMuCo+8l4ukv7HvCT3S8Grcp8DzTEtKNFIicEm8CKSP+1ppp70RO5kQhPkf/Nqy2HEdTkZ6P0fey7BO1CUuGw7WCzFg5yRXCWMJhCg12o6MMCQUoyWmhEiJtZLqOtmdjWQ5OZBXmtET7emjQTwE62tDJDdPeB0TDS8DUrG72dEMwDgSsoAwH1EEK00XDb3XkWFb92pBNjcOzGck7U3Sp2lzOT1UKoJdRJWWNunNNRIgHX/TDStNcyemlcUq29s722yBhGA0KTptmX2cc9Psik+rZ423A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LWnLPeApm/7w/IW1CztDF7W4LGDIBPM00Oq4pbnpVks=;
 b=aKxZXZ5Q9YXUTzES/F9ofxTAgIT3AIRQFU6n9PT/5dVYeQ0BymGiFnlgrDUPYrKDzvXEBV37+MjWI5RFcAB7LBlFI6JC9RVrqK8R0XBWS+C+SaQivt8UFJ3X/ak/IMIef2SFV980AZdwcubh5F4YGYNTEjpYGROI8TcWOylSwIQ=
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com (2603:1096:301:b9::5)
 by TY2PPFF343E9D84.apcprd03.prod.outlook.com (2603:1096:408::9f1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Sat, 16 Aug
 2025 01:54:08 +0000
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::a013:f3b3:a461:8ece]) by PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::a013:f3b3:a461:8ece%4]) with mapi id 15.20.9031.014; Sat, 16 Aug 2025
 01:54:08 +0000
From: =?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>
To: "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?R2VvcmdlIFN1biAo5a2Z5p6XKQ==?= <George.Sun@mediatek.com>,
	=?utf-8?B?VGlmZmFueSBMaW4gKOael+aFp+ePiik=?= <tiffany.lin@mediatek.com>,
	"andrzejtp2010@gmail.com" <andrzejtp2010@gmail.com>, "nhebert@chromium.org"
	<nhebert@chromium.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, "nicolas.dufresne@collabora.com"
	<nicolas.dufresne@collabora.com>, =?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?=
	<Kyrie.Wu@mediatek.com>, =?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?=
	<Yunfei.Dong@mediatek.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	=?utf-8?B?SXJ1aSBXYW5nICjnjovnkZ4p?= <Irui.Wang@mediatek.com>,
	"robh@kernel.org" <robh@kernel.org>, "sebastian.fricke@collabora.com"
	<sebastian.fricke@collabora.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "christophe.jaillet@wanadoo.fr"
	<christophe.jaillet@wanadoo.fr>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"arnd@arndb.de" <arnd@arndb.de>,
	=?utf-8?B?QW5kcmV3LUNUIENoZW4gKOmZs+aZuui/qik=?=
	<Andrew-CT.Chen@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "neil.armstrong@linaro.org"
	<neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 7/8] dt-bindings: media: Add MT8189
 mediatek,vcodec-encoder
Thread-Topic: [PATCH v2 7/8] dt-bindings: media: Add MT8189
 mediatek,vcodec-encoder
Thread-Index: AQHcCm/o2mTP6bXoukCvauhSTDkn3LRdGTkAgAdzNIA=
Date: Sat, 16 Aug 2025 01:54:08 +0000
Message-ID: <0374df6e0002723b42548101d47658a8b178dea7.camel@mediatek.com>
References: <20250811032616.1385-1-kyrie.wu@mediatek.com>
	 <20250811032616.1385-8-kyrie.wu@mediatek.com>
	 <20250811-determined-truthful-terrier-5ca5eb@kuoka>
In-Reply-To: <20250811-determined-truthful-terrier-5ca5eb@kuoka>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR03MB6186:EE_|TY2PPFF343E9D84:EE_
x-ms-office365-filtering-correlation-id: 5e56962b-babf-42b8-283e-08dddc67ca19
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?V3E1SGJsSHBseEtLS1VnbVdQOTFsL2cvVU1ZdFcwRVRYTVFWZ3IzN3YrV0Qw?=
 =?utf-8?B?TlRVTjhCMG11MHVkRXhXK284Yi9IQnZtdExNVUtMcEpJUHBoZE8wSW0zSlJY?=
 =?utf-8?B?WG5xU0JmeW90QmI1SUdKblFESEk5VkpMRjlLclJ1alhnVjljN3VwaTVzaEZP?=
 =?utf-8?B?MURMOUQzR1B0TFFZVlc1NFpzZWhIdE1FMG1vakVMK0dHRGZVNVpiUGFHNjFM?=
 =?utf-8?B?MktXT3VzZUo0YzhWamdlU0lsZEFOMnliWksvaDMwRmsrK01seCtrVmRIdndY?=
 =?utf-8?B?MUthMWVFSllLR3RYTnlHTlVpaVhON3h4WHpqaXdUYzQwbzJVNlk1WDBmaXl3?=
 =?utf-8?B?T3RRaEZ2RWtGM0IzQzhqRVNyZHNYUWdtZjhrWmFiaUZVeXZiVXh3b1hNdE1h?=
 =?utf-8?B?OGJOTkpVbTlKeXNUZlVoYUNRM3k5VmdhWXFuVGxrWUMvS09Bd3E5aWJTK2Ro?=
 =?utf-8?B?cVA4ckRMSXdVQmVlM0dYb0xLcEF0QXlSY3hQODl1c0ptZ0F6bmdFZTdlQzR6?=
 =?utf-8?B?QjR1SjArNEE5NENsMHZJUGQ5bkMrQ3hTZWtDbmtiWG1wTG1DTGxJUnhoV0xw?=
 =?utf-8?B?NGZjOXAzYWYrcXUrTEp2NWlPdVdZUkxJRlpFNXJnN0NrUGh0RFRaS2VGbHY3?=
 =?utf-8?B?RHhtK25tR1VVYy9KblY0ZENVY2QvV2JjeVFuYmpXaTQwenpFbnJ3Si9uU2lD?=
 =?utf-8?B?Wkw3ei8rZ0FKYTJ6cURKL01QbklXV0M3NEoxMFpFaUNzKy9DOUliYURtekNI?=
 =?utf-8?B?SDlZSEFhd2hyRUphdDlsLzJiTVNLb0IwN2pHN2pGY01pSXVHVlpBZEYzZTBB?=
 =?utf-8?B?b3NGa0N5Z1pYeFVXOGJVUjJHMi9DWlFYS3VoZTRjbFQ1S01sYjQ4VkkzSlAy?=
 =?utf-8?B?OG00YmVrNEVwQlJDcTdPSzVuYldFeVdLcFVyTFhOUmk1RElETnlWMEErbzMr?=
 =?utf-8?B?aUIrSGUwbzdMOEI5cGxLZGNzUG10MXVPcUJYeEpoUVE0M0xKMGxkUW9xTVBo?=
 =?utf-8?B?MmYxbU9PL1RFeE1sV25ZbXY4MmpnMm9zaXFYMFBRUWRwVEZHclJld0hFVHpN?=
 =?utf-8?B?NUdlVUc5SkR1bFpxL1djUWdrcy9rcGJBTkRVUVc2R1c2MDZZeTZDc3pzbDNC?=
 =?utf-8?B?cUtqNTdwTndKd2xYMEw1b0tmRHB6Q1RKall4aDhKc1A3VThHMmsxUTYwbE85?=
 =?utf-8?B?Y3dkRWF2Ly9mZGs2Q3ZCRHNtL01rYk8vK3dwUUU5UWFzK0laOFNrN2FZNi9D?=
 =?utf-8?B?L3R1aXJ3UExnbXhJR3RIeWl6amRVNHp0UzNQdGZMQXIxdGY3M3hxbzdLSjNT?=
 =?utf-8?B?NlYvdkVJL3NuTkZXaXRwdmVoUStSZUhDQWFYUXF1SFFoamcvdGoxeUlrWjdG?=
 =?utf-8?B?ako0MzBoR1M1WWRCdmJoNjM3bTYxaXQ1OHJLbGdLWjkzdkJQRnliSkNVSE5s?=
 =?utf-8?B?RXZuOGEyZ3RqYWJZeGtkUGhCTU1TWVlST1BMbk9wa1FRU0RqMjlHRGV5d0dt?=
 =?utf-8?B?cVJ5TlBhUFg5N2NaYXMyQjdpc0c3MDhOTC9CaHNSbTRCR3JPRjl2Tk5HMW5D?=
 =?utf-8?B?eWpHQlo3c3I5SG1YMXViYmdrWGFGU1dLdkxjZzk4NGFyV1BrZVpSTWNwb3RZ?=
 =?utf-8?B?K0VvRkJqTUtreG56Sk4wYXRDYzlwV004ZFRyZ2Y0Uk82VksyRktodURSVHc3?=
 =?utf-8?B?dlgyRjFqOFZNNW5ORndab2dINVQ4bGlkaWJ5ZG4zcDE5RXVxTWYzcHlJZ3hz?=
 =?utf-8?B?U0tncWtUdHNxdm5uVENkblkzcFgybzZUVjVsU2tCbllJbzN4OVFzT250UDRq?=
 =?utf-8?B?U3dPZDBmMnRpNDRWNExTVjJUcCthdjFIWUdIWmR3MVhrS29EdlVRMzJkZXY2?=
 =?utf-8?B?U09zVUVITWhOdUlkbEdoRW9xYWNHZGk0emZNQ3lwNVlJa1U2RlQrdllCYmlz?=
 =?utf-8?B?Q1ZTaDloblhmMDN3Vkh0R1lJSXorVG9CeXdzMkJwRGhQd09LWVA2UEZFbng2?=
 =?utf-8?Q?he+JoHc5KYritt57eCiekS2tjktoc8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB6186.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MkRWSCt5Wmczc0J1MFFrUlFmbksxMS9udW1IVUM4RHczeDNkalZNaUw0RHVM?=
 =?utf-8?B?NzJPVDB4aVVxUGh6SDdKUVppdjFoNjR3QTNPb2xYRWlSK2ZheVpvVnAyZkVn?=
 =?utf-8?B?TStIc0czMUhSSmRlSlkyTzYyeHBvMFhtWkpOamptYnkxZGQyaklIOVhOaVFl?=
 =?utf-8?B?MWZsV3pHdXl6LzByOEZ0STN6Ry9yUy9NV1R0MmwwZytvcXNZZlBhem5iR25S?=
 =?utf-8?B?TE1vZlRsQ3pHOU1GeHVldTZXUjNXTk9RZlVsT2gva1NrWm9sYmcyZ1B0RTBY?=
 =?utf-8?B?bHpwcnMzZnB0YzNyT05BdmlHVWZXL2FqcU1TT3VpZUxnVUM2RlVEVVRXQVRC?=
 =?utf-8?B?eXNyanhCUktRZWNVemVwT2R1dXdIRTNRdmxHMWVzTlFpR05wemhhbmpuLzQv?=
 =?utf-8?B?cFNxaVV6S2h5dkYzeFQrVUZPOENIUGNTNlJSUVFkT1hoeHpZVEJuSmE0NUxD?=
 =?utf-8?B?anZmWEV5d09qRUhENmZ2ODdibithRjZXZFNWOEN1cmQxdzdXS3R5Mkw5TjRM?=
 =?utf-8?B?bjNhb0g4UXBOT0ZLQU5uVi8yWDBuWHlsRmR0cUwyMVlXS3ZLNVdicVhiYWZv?=
 =?utf-8?B?Qyt6SUh5amFpbjZza05vNnZyUnJiYVJwQ3JNS3djRFluaVlUM2o0dFVxRjNy?=
 =?utf-8?B?M05xZjMxN2xHYVEyWUo4UWZ6WnpDclh4a1VtTUszVnFQZGptK3RVcWYvTHhh?=
 =?utf-8?B?Sk42N2Z1TFdqdjV0WkNablZYMTd3bGIxZ0J0QnNrR0p4VDQ5RENwUHhNU1lh?=
 =?utf-8?B?eUwxZVVUZmZ5YWZ2NDhGMk1nZ2pmYVNadE1ScEUxMWRqRnhKUXlhMjF2Tjcw?=
 =?utf-8?B?aFlub0cxVEFDdHhzdzVMVFBHT0ZpN2dmU3Z5UUtXTXU2QTU2V2xNdTY4NGFX?=
 =?utf-8?B?MzJnaFRLMmJUb25VWWVEN0NFZGVFdFhVd3lRc3RXOGM0bVRvQWljc1pPYXdD?=
 =?utf-8?B?RnYxYVYvSUFwaHRBVlhsNUNCMk9ZOXBRTjMxQloxNENIWHA0UFVOcDN3M0hF?=
 =?utf-8?B?b2g5dUhxbUlWRklRSVd0UHpwOE5ISk1jQnRoaXJ1WERCOTdXc2dHOHhqbWdV?=
 =?utf-8?B?UHNnME1BVEVFRWlCU2g5eFNERWRnR2hTZXpzam4yNisyRnhNYUJiT05wQTVt?=
 =?utf-8?B?Y1VhQXNJcUpES1NpdlZ5NHl5VDRDZGp3SFdVYXNtMHNEQVdYUnpWVXY5RnVG?=
 =?utf-8?B?MTltWVVYNUtNWEpzSFp5dWVkY2YrK3JzTmhJUFdUL1V6NmJxUmZ4aVZ3V2hw?=
 =?utf-8?B?N013YW94ZWs2NXBWUVkvZGRPa3k3ck51c0E5WVBxRnJTK3BJeE02ME90bXZu?=
 =?utf-8?B?QjlLU3RwVjJmOHp5Vys3ekR3NDdoM05YSmRPc2pxRUtGa1ZiM2hiUXhVNnVC?=
 =?utf-8?B?ZkliaU05WjQ2Wmt4UDl0VCtzNXlnaW44aStMRXNkOXcyamFuTkFJcTBaNWZL?=
 =?utf-8?B?Wkl6UmFydXJCeTQvLzJPaUpFclU1WEZFWFkwdU5IS1hyRzlTR1A3Q09Uck90?=
 =?utf-8?B?QW9mZnRwZUpvSTVMY2ZQSGxObUV2bDQ4YU9rV0djalp0YVhBWDZHWEhmbnhy?=
 =?utf-8?B?VTVyRjNaMytSSVA5NGx6MlZBbmpaNFFBdVpEdUxKN1N1cCtaTlE3cU9tY0FQ?=
 =?utf-8?B?OGJBSExlOWEzU0ZjREl3bTBIamVXTmRJRTh5Nkt4dzBTNlZvZDlDZHFoRUxo?=
 =?utf-8?B?bGJHK2h5cUw2eERjV1ZBcmNkUGdXR3ZZNXg1bXI1ZmdUQkM5Z2JXd0RWSy9l?=
 =?utf-8?B?NHVMWUlPck4vemFxa3dOcGZFWWJmOFBGN1VOWmhWOWQ3YjZtaFRXclJvcW5F?=
 =?utf-8?B?eXNBZ3duZXBVMnJyZmplUkpsOTNIQk1RRDlvUG5McEdET2FIay9QZ1NQaUxV?=
 =?utf-8?B?TFh0L1V6bTA4TFRSaFhJM2w5cXFGR1lEcGxBNjREbWVCbU41TG1YeDlXQnNJ?=
 =?utf-8?B?ck1BbEsxL3NhNnoxZ2x2alE1bVpXRUtKNmVkdForQUpCM3VWRU5QQWdjUC9h?=
 =?utf-8?B?dExTbEFHMDBKV3JVQnNTWmZxSnlRRVZ4RVBVQ2lLUnFRZ1dFRk8ya1FPSkdT?=
 =?utf-8?B?UnhwdHc1bDZ3UFFHYXQ3TVg5NkZwVkN0UzFhM29qRDY5aUFyYzZvdlV2Q05L?=
 =?utf-8?Q?L5YRfjo4BJTrwvaM3wijn54jS?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D91CB1C0FD960A4C8A74E60F38C710C6@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB6186.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e56962b-babf-42b8-283e-08dddc67ca19
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2025 01:54:08.6246
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Loj233L6eJMdQqvoSVgE5PDRs+MhIh3c26MFEj7quU7u7m+x++7A9Q7Lv6YxvmCpaFqTfravMcU8IwdjSs54Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PPFF343E9D84

T24gTW9uLCAyMDI1LTA4LTExIGF0IDEwOjA3ICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiANCj4gDQo+IE9uIE1vbiwgQXVnIDExLCAyMDI1IGF0IDExOjI2OjE0QU0g
KzA4MDAsIEt5cmllIFd1IHdyb3RlOg0KPiA+IEFkZCBNVDgxODkgZW5jb2RlciBjb21wYXRpYmxl
IHN0cmluZyB0byBkaXN0aW5ndWlzaCBmb3JtZXIgSUNzDQo+ID4gTVRLJ3MuIENvbXBhcmVkIHdp
dGggTVQ4MTk2LCB0aGUgbWF4aW11bSByZXNvbHV0aW9uIG9mIE1UODE4OQ0KPiA+IGVuY29kZXIg
aXMgb25seSA0SywgYW5kIHRoZSBmcHMgaXMgb25seSAzMCwgd2hpY2ggY2Fubm90IHJlYWNoDQo+
ID4gdGhlIGhpZ2hlc3QgcGFyYW1ldGVyIG9mIE1UODE5NjogbGV2ZWw2LjIsIDhLQDYwZnBzLg0K
PiA+IENvbXBhcmVkIHdpdGggTVQ4MTg4LCB0aGUgbGV2ZWwgY2FuIG9ubHkgc3VwcG9ydCA1LjEs
IHdoaWNoIGlzIGxlc3MNCj4gPiB0aGFuIDUuMiBvZiBNVDgxODguIEJ1dCB0aGUgbWF4aW11bSBi
aXRyYXRlIGlzIDEwME1icHMsIHdoaWNoIGlzDQo+ID4gdHdpY2UNCj4gPiB0aGF0IG9mIE1UODE4
OC4gQW5kIE1UODE4OSBjb3VsZCBzdXBwb3J0IE5CTSBtb2RlLg0KPiA+IA0KPiA+IFNpZ25lZC1v
ZmYtYnk6IEt5cmllIFd1IDxreXJpZS53dUBtZWRpYXRlay5jb20+DQo+ID4gQWNrZWQtYnk6IEty
enlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4NCj4gPiAt
LS0NCj4gPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWssdmNvZGVjLWVu
Y29kZXIueWFtbCAgICAgIHwNCj4gPiAyICsrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKykNCj4gPiANCj4gPiBkaWZmIC0tZ2l0DQo+ID4gYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWssdmNvZGVjLQ0KPiA+IGVuY29kZXIueWFtbA0K
PiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLHZj
b2RlYy0NCj4gPiBlbmNvZGVyLnlhbWwNCj4gPiBpbmRleCA3Njc1MzkxZDdlYjAuLmZhZWU4Mzhk
Njg0ZSAxMDA2NDQNCj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bWVkaWEvbWVkaWF0ZWssdmNvZGVjLQ0KPiA+IGVuY29kZXIueWFtbA0KPiA+ICsrKyBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlayx2Y29kZWMtDQo+ID4g
ZW5jb2Rlci55YW1sDQo+ID4gQEAgLTI1LDYgKzI1LDcgQEAgcHJvcGVydGllczoNCj4gPiAgICAg
ICAgICAgICAgICAtIG1lZGlhdGVrLG10ODE5Mi12Y29kZWMtZW5jDQo+ID4gICAgICAgICAgICAg
ICAgLSBtZWRpYXRlayxtdDgxOTUtdmNvZGVjLWVuYw0KPiA+ICAgICAgICAgICAgICAgIC0gbWVk
aWF0ZWssbXQ4MTk2LXZjb2RlYy1lbmMNCj4gPiArICAgICAgICAgICAgICAtIG1lZGlhdGVrLG10
ODE4OS12Y29kZWMtZW5jDQo+IA0KPiBTYW1lIGlzc3VlLi4uIHlvdSBnb3QgdGhlc2UgY29tbWVu
dHMgb24geW91ciB2MSBvZiB5b3VyIG90aGVyDQo+IHBhdGNoc2V0LA0KPiBkaWRuJ3QgeW91Pw0K
PiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCj4gDQpEZWFyIEtyenlzenRvZiwNCg0K
VGhhbmtzIGFnYWluLiBJIG1pZ2h0IGhhdmUgb3Zlcmxvb2tlZCB0aGUgY29tbWVudHMsDQpidXQg
SSBwcmV2aW91c2x5IG9ubHkgc2VudCBhIHBhdGNoIHNldCBvZiA4MTk2IEpQRUcgYW5kDQpwbGFj
ZWQgaXQgYXQgdGhlIGVuZCBvZiBwcm9wZXJ0aWVzIHN0cmluZ3MuDQoNCkknbGwgY29ycmVjdCB0
aGlzIGluIHRoZSBuZXh0IHZlcnNpb24uDQoNClRoYW5rIHlvdS4NCg0KUmVnYXJkcywNCkt5cmll
Lg0K

