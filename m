Return-Path: <linux-media+bounces-20986-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC479BDFB9
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 08:53:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF1D21C22EAA
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 07:53:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F5FC1D1E62;
	Wed,  6 Nov 2024 07:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="gWB/PVxx";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="FGqpx5LK"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086BE3C39;
	Wed,  6 Nov 2024 07:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730879582; cv=fail; b=gjvxyNrmR9PyS408j56n3GHtSrCZ1Qb+dUVSJMOSFfHoM6R74A3TbCaLiGq7xEn639tzfq8u8ahV1Snu67AEewurV6ax24htXy6lLj/qZq/rSyCEjeWNFPO0CPiYU+qJ21dEE3aO9DRCZ4Xjf0hmHtc0yW8g2Znpy+r8PKjJ8iY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730879582; c=relaxed/simple;
	bh=c8MzmSOS2BYJrKtwQPKlmOCojm6trFTcRiqqAO0a3mY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TMBQd4Q35A2/AaP8AVbIcSJm3+9Tsct5YH5pufNJU0+PWavKSp9kLGJmyEVjPwyFSQuciXGMkFH1SY1CU9N5oMtL+5Nn2Dd2iZSPj43//se+g3hzul4lFEQ9KECeDiIpARAlAHCs5LSs6x/AteX+MXQqO3jHeQAJdNTSMd9exfU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=gWB/PVxx; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=FGqpx5LK; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 1fd088ea9c1411efb88477ffae1fc7a5-20241106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=c8MzmSOS2BYJrKtwQPKlmOCojm6trFTcRiqqAO0a3mY=;
	b=gWB/PVxx2qrUFIXSfReHAN9/kGMCWJof/Ei4OvZhNl90JZH8pdWa+D78W002N+reNPP99X+FfNd3s7r1oRFuza9ELRgPl3ZBRuJcTEoMCeavgWcAgxY3kiyvjUknIWuu142P68JCnr2SneM/sF/YNF67Q+aKgq3lUrZEPsQTsBc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:d25b422f-dc22-4a17-97fe-f7446342d2c6,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:e36eb41b-4f51-4e1d-bb6a-1fd98b6b19d2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1fd088ea9c1411efb88477ffae1fc7a5-20241106
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1427941298; Wed, 06 Nov 2024 15:52:51 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 6 Nov 2024 15:52:50 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 6 Nov 2024 15:52:50 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w2peAAgEhiPBl6GCbkQvv7lgCWrL1WDQ5bdnvYP6j9F1Q1Jcx9VkF9IbwfRk47QtKOJGTwU83BPBqvQXxeC/JUAZCkAvtVQWmumuhiTgubUr5jMbG3E0B89EViroOGb4/wow7S+qGfb/KZEoXZnL189/6uavtX6PD6fkdZuN15JX2uHluKO/V6+R71WM7zeooGln8LyrA6P49W65a9n2/vyAb4EuvWW1OutLNRuEvuOnBG7j7sH0Zs0lrQcGyqFr4RosXklGbNxW6/OQ6vwzT4BCK48sKKrg5EkaSKQoR1FECoUrMS1ks7PcU5U3sinaIWOjwnX+nPc4W6+3xN7hzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c8MzmSOS2BYJrKtwQPKlmOCojm6trFTcRiqqAO0a3mY=;
 b=BjX5cC7XR8ZKYQYdMm0LgQyWfTn7ODWcBnb8EcJu0n18dC4rv0zSGGLWJ9tsLSrcqWjDoPBzfMXgK5Np+fUVPqcbgZVGWN5bRKRDROL0E/e99BHF1HP4M+Aotjh3bnsF2Zq4kN/QkUA416gAjNte/ZfiOlUAKnEPpmgH937SdEFBUKvhxJTPE/y4Kr8Fz9/QLcEeUZ2BRQ7kRZwFY3nRftVMPCodjIqIb6r/Kscx5oDkuLnDwW/3eFMmYvI19OhixxfNkBwCdmsk3p1+m/ixsDaqNy/dp3YrZk1mlRuE97Flsn55r248nS4AYqJ7Q2/75yHjX3v7xwQhRpo2OM+IzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c8MzmSOS2BYJrKtwQPKlmOCojm6trFTcRiqqAO0a3mY=;
 b=FGqpx5LKrv10lkx9eZ8Hwxb8wyNMNkgX88RwDAhtMT3rAfYEX3hFW5HZtpQOHLmKMgyp6PY41C0QV4u8rl6DaGh9bHMlO8NM3WvRq48UPAk7PcH6iL/R2PgQOmJC/IoazhZ7sWAfGQwwF9gfi1J7eHZTUBcWaB2Hsm7PbNjWO+k=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEZPR03MB7007.apcprd03.prod.outlook.com (2603:1096:101:ac::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Wed, 6 Nov
 2024 07:52:48 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8114.028; Wed, 6 Nov 2024
 07:52:47 +0000
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
Subject: Re: [PATCH v1 05/10] media: platform: mediatek: add isp_7x camsys
 unit
Thread-Topic: [PATCH v1 05/10] media: platform: mediatek: add isp_7x camsys
 unit
Thread-Index: AQHbGj3MGEEcsT7oNkOiiJNQG6iUarKqDUAA
Date: Wed, 6 Nov 2024 07:52:47 +0000
Message-ID: <37633e814bbc45126647fe73e325b78f1c547236.camel@mediatek.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
	 <20241009111551.27052-6-Shu-hsiang.Yang@mediatek.com>
In-Reply-To: <20241009111551.27052-6-Shu-hsiang.Yang@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEZPR03MB7007:EE_
x-ms-office365-filtering-correlation-id: 0f12f908-6e73-451d-3e1e-08dcfe380173
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?TGRiQXV0S0RhaUYzU21KeXYyRUZYaU5nZjI0bjZlNUlLSFhLbWpjUlh3cjg3?=
 =?utf-8?B?UktMcER0SUpNUVkwd2JZVkRIOUprY09nUVFWVU1uZVpoK2ZwZVc4WFR2QW93?=
 =?utf-8?B?OGZlY0tLelFybFpiNjViTE9WS08xbEpNeC9vajQxdmhMR0ZNaTFxMDJYQWlE?=
 =?utf-8?B?R016anowSk1PTWJ6N010TC9OYmVPeU1JekZuckJ5NGNqMVRzN29JZVQ0SkdJ?=
 =?utf-8?B?QkxsWmljWE9CMmdrZStvYVNTdzFiamhsWXBBcUlWVXVXKzBFNTg1OUsrUTJr?=
 =?utf-8?B?czU1SHQ3QmE4RlVSditPSThxS1h1MFB0RnBJbW5oYU9Hd0dVclozTm5BbVJw?=
 =?utf-8?B?ZXV5RFQ5V2lLK1VDYWxqVjNLR1F6M1lyWnZ3UzRtMkFIR3VKb2s2TjlXS0hE?=
 =?utf-8?B?Sjk2czl1YXhkaHE3cXloNWNYYm1uSEJHVFV4c3RvYUJ0ZnJPNnNXRW5UdXFB?=
 =?utf-8?B?blhZOW9hYjR5aWg3bDVUYjhpVTkwUXp4OXRGM2VSMzVQaFNNZklsRXZJbzNy?=
 =?utf-8?B?dVhwU1RzWGVwRzdWUFBWSkRMTmpVMjY4Tk9jckUzZm5Zc3llemViYzhCUW53?=
 =?utf-8?B?QUpPOU5xdHhLY0VhME1OdzJiRE9TNGVXd1gyZU5hSVE2bGYxTVpscXhscmxj?=
 =?utf-8?B?dElhK3psbG15QWFOaHAzRmZTUjE0VXFLTkE5ODdxMUJCWlNLazIwOGNXcUVR?=
 =?utf-8?B?dVBaajIzZlYwYkdYUlRERDFrWWVtWnVZNzJmMDRkZVJOZnlTMENMbmhzTHNN?=
 =?utf-8?B?QjZkNTkwNmlGWTh3cDEvVnlWelA5cDl3ODZXU1lCTWEvR3dma3V2dXgzcXVj?=
 =?utf-8?B?Z1hDQzFpQVYweUdDbW5iN25VNkR4UEZzY281SDMyVktoUHJvVDZ4U2g3SjJz?=
 =?utf-8?B?UDNlcndQNUxmRW9tTXVndldDSzlJd1pBMjVmU1RNRE1JTEd3aWZqWE4rdUVu?=
 =?utf-8?B?c0ZnVTNkVlVHaE5hZjVNZHVOZU01LzFyQXRmR0ZSUmh3TDRiZkphcCsrVitZ?=
 =?utf-8?B?WTZlcUVYT21sQmhaakFhUFVxckl3dWFVejZKOFJ2NDhvV2ZsREl0cXhkbUEz?=
 =?utf-8?B?SkhEczJZbndvT09lVDFLTWpuRDhTOUlqRjE4UUI0TlpLNjlLYkVPbm1ZOWxx?=
 =?utf-8?B?Y3FpV1RQbnNSdEpCK3pRbHNibS9UUmRaQlc1Vnp3bkR0bFpnMGw3Y3ZtMUpY?=
 =?utf-8?B?SXYxRWtVNzNXV2dLQy9jelRncjhQajJhWm1QL29rbTlkMlBReEQ1Y0dUMmVz?=
 =?utf-8?B?RHRyMmNVaWgzZThTSXArYnc2RDdVaDRvTFdETGNiYmwybXVhMC91alFlaFB5?=
 =?utf-8?B?NWhXL28wQ01YK0c5cTJBQ0hDMHVXTWZ3T2NwaG1UM2o4NUFxV3JCdHhTQ2sy?=
 =?utf-8?B?QjNYNXQzLzVJYlZMeXE0czFVT2hoT2RiSjJZTVE2YkhFdzFUS3dwRjR5ZkRT?=
 =?utf-8?B?RTVSQWQxcDBvZk5jYkMwSnhqOWdMT0Q1NkZRYlZCVk1LNUVPeFNCMTZaQkFa?=
 =?utf-8?B?WUNBZ3B0VEtCdFVjdGJiWFFZaGppbms4ZnhpbW5BMmQzWFpWM3lsSk1nSWlq?=
 =?utf-8?B?WkI2NWhWQW5QR1pRQUQ0WWRpNXE4VytMZGNUWndLcE4xTHJRaExKV0tHYjZa?=
 =?utf-8?B?bzZOc1N0T2JCQUJYYS9yUkdPdm9Qb09MNEhuTmhlcG5ROWNVVWxqcTdpS3Jo?=
 =?utf-8?B?UHhrekdwOG0xUElQUjY3TDFDVGc0RFUySVA2d1k2aWlnOGRQQ0VaU3g4Yity?=
 =?utf-8?B?eUZsNWU0OUppOVJldHVEU3VTQXJQK2xPWXF1elZBQnd2ZndlQk9PY1BkZU5i?=
 =?utf-8?Q?6ZI+fhQysmcwkKrh/lRG3eVQEPKRLNh3NWDck=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TlQxTzNlaFowbVlXYjNtNDFxeFp0cVZoN0podHRIWlVmaXdNM0VKcHFIaGpo?=
 =?utf-8?B?Z0dXQ1l3S1NYUGxwdS9SOXh6NUJSME90TE5TcFNRR3RlWGZtcklEN1dEWlUx?=
 =?utf-8?B?bTN3ZmVUUVUwTDBKOGFsZzZKcUMvVmk4Vlhzak1vRWprSWJrVzdHRURKMmlM?=
 =?utf-8?B?eXRJaVliSVdid2Z3eHdXOHhxUElaVjdwbGE5dTVHQ0MzRkNYNGp4NEZFME1s?=
 =?utf-8?B?MldocTZYRis0dnNTYmxFc1NXbkUrVDRIblRmdC9xdmpHNE1CUk80a09aT3p4?=
 =?utf-8?B?THl0aWtZR2hOMDJTUnk3Y3NlekFLRjFSTks2aUtCSTFza3RqYm43VkFRd3l1?=
 =?utf-8?B?cGFGOGNEMkVOTDBkTjJkNmJiaEo1V29ZRGw0NmNhOC8wVmtwZURsaUt1emVp?=
 =?utf-8?B?SE5NdWJVZGpCVzRBU3BDY0lmQ0FrckNsTTg0dEhmMys0YWtWSWtNcUhzSVA3?=
 =?utf-8?B?Z0lzaXpqYUFTaFN0ZXdKN0xIejF1VGdVRXFMZ2FzWEtrYy9ZVHlPY0NJMll3?=
 =?utf-8?B?OHA5RzR6M1I2aldJZnhQbXdMeGJHN0pNR2hJL0ZodTdQc1o2Rm1YaS96Y3Js?=
 =?utf-8?B?K0hDS1EyWkRERUk3bVcxNGs1ejZtQ3lUcHVYS1ZjMk8wSTZoUHF6SDNQdElj?=
 =?utf-8?B?TjJXalF1dGRCUFRNbVhvUnJ1UXpBbytRa3Z5TGRrZUZjb0Z3TXV0aEJyV1cy?=
 =?utf-8?B?Zk40RStybVFKZE52d3dDRGZBSGpSS2tuV2dVbWJWYU1BWkpvN2g0dU9kVmFF?=
 =?utf-8?B?QjN1eXd3VDdsSlpIR3FlM2lEcERaU2djOWFhN2F4U3NGenJZbjlmbGtBc3Bz?=
 =?utf-8?B?S2NGeVFldlBtYktxNXRRNU4vVmF5WVQxcytURHpsYVF0UTJUaWNPSllsUnRv?=
 =?utf-8?B?Y281NmVYamxTQ3lub3QyT2RjS1V0bWFRWXJVTkpUT0ZQMFE3YitqZktyK3c2?=
 =?utf-8?B?SVBWY003RnlkcW9naml1VjNlL25ZMVlxVnkyWjllOE5sdkVmQ3pXZ1cwcHFW?=
 =?utf-8?B?SnJZTlU5eWFHVnJHVlI3bFJxMFIwMndNOUlNYUVPOHJKcGI1U085d2pIc1pU?=
 =?utf-8?B?ZFdJU1M4dHZ6R2twM2lFbW92bHoxZCtaWFpoUzhpcllrMW9NZjJWTm0vbGpw?=
 =?utf-8?B?dGZ4cEIzVVhwcWxJM0dmWnJwaDgxZS9heEFXSzhKRkMzVkI4NXk1aFl2UXVw?=
 =?utf-8?B?REJXa090eU1uWlM5V1l6THZKYlNkaVB1Q0R0bnc0WHhja1c2Z0hZL0hlVjAz?=
 =?utf-8?B?c2pLN3Z0d2REbHIzSVh0UGFCb3JKZUVrR2ZHK096djNJeEpwT3R1L3h4ZmQ3?=
 =?utf-8?B?MzFhQlYzdTNHQUllYTdPd20wYTY0eVJjTitvRDdPZjdsL2J2aklXeWdJbUNO?=
 =?utf-8?B?ekRwdlRJbUF2bjVmUmFCVWFlOHFHc1hZWG53YVA3b3F0cUYzYzI0djRDWEpM?=
 =?utf-8?B?SzYwVStRWVJ4a21FUHE2RUxtdmVhdXZ6QjFHZXpBMHUwM0p0UWpCcHpBd0Ru?=
 =?utf-8?B?ZDlWWGQxUHVDcUlXRGJvZUZNN1lQM0M1VEJBbGpDQThGNkFKSElnWkpSTnJ2?=
 =?utf-8?B?alRBVjBqZks0YmFtNzdKYXAvMkJSRU1kdFQ2WnBveEpkQzJaZkZMaG45SlRn?=
 =?utf-8?B?cmJNNkp6QVFHTFNQQk96Y3BsRVBnUU1zejZTOEdmMFFqNHpTQ0E4Vk9uWFRS?=
 =?utf-8?B?eS96WlArL04zdW4zeW41c2dBMC8vam1rb2NGbDRJUEVVanVFWDRHaG5yTmk4?=
 =?utf-8?B?M0hjbXVqMDI5Z1llNVFiMjVXOEZkanRCNk5JZ09jN1NzUGswN3NCMVFVRW92?=
 =?utf-8?B?OWZQZ0pod1c3UWhaRnZuVFdtOVlva2RsY09VSnVSTitVMXI5aUY1RTQ0VmMw?=
 =?utf-8?B?SEFzSC9LRnNhSUJaNDUzNEJ4UVpqd2NIQmtmTHEweTlybndnN1d5N0JwTGJ6?=
 =?utf-8?B?UjVybG9NaWYxT2ppK01xeXpGQ21oN2FNUlQ4WDQwTHJoVnNKQllnTngzR3Za?=
 =?utf-8?B?RlE4Y3h3VkozRHoxemxLSDFWN1F4R1cxYy9qbUVVd3FpT0E2cmxNWlNRTlM2?=
 =?utf-8?B?a3h3S0o0TzIvaGVHWVI4QlBiQUlwNmZ1NVJHdlB6Y2dRVUFCQm9Ic056ZGV6?=
 =?utf-8?Q?njHQsPpbCPueWTb25WZ/0qeR5?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C2E7F35A5E2C974DB826EC0B3765DD73@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f12f908-6e73-451d-3e1e-08dcfe380173
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2024 07:52:47.5440
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ddKxT3a1qUq54xby3f5iN6j8GY7vbxfGU628ZFz9Gt6LeYgWNWg0bHFzdOU4gChKlv5KYW3Z8SE34hc9jF36wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7007

SGksIFNodS1oc2lhbmc6DQoNCk9uIFdlZCwgMjAyNC0xMC0wOSBhdCAxOToxNSArMDgwMCwgU2h1
LWhzaWFuZyBZYW5nIHdyb3RlOg0KPiBJbnRyb2R1Y2VzIHRoZSB0b3AgbWVkaWEgZGV2aWNlIGRy
aXZlciBmb3IgdGhlIE1lZGlhVGVrIElTUDdYIENBTVNZUy4NCj4gVGhlIGRyaXZlciBtYWludGFp
bnMgdGhlIGNhbWVyYSBzeXN0ZW0sIGluY2x1ZGluZyBzdWItZGV2aWNlIG1hbmFnZW1lbnQsDQo+
IERNQSBvcGVyYXRpb25zLCBhbmQgaW50ZWdyYXRpb24gd2l0aCB0aGUgVjRMMiBmcmFtZXdvcmsu
IEl0IGhhbmRsZXMNCj4gcmVxdWVzdCBzdHJlYW0gZGF0YSwgYnVmZmVyIG1hbmFnZW1lbnQsIGFu
ZCBNZWRpYVRlay1zcGVjaWZpYyBmZWF0dXJlcywNCj4gYW5kIHBpcGVsaW5lIG1hbmFnZW1lbnQs
IHN0cmVhbWluZyBjb250cm9sLCBlcnJvciBoYW5kbGluZyBtZWNoYW5pc20uDQo+IEFkZGl0aW9u
YWxseSwgaXQgYWdncmVnYXRlcyBzdWItZHJpdmVycyBmb3IgdGhlIGNhbWVyYSBpbnRlcmZhY2Us
IHJhdw0KPiBhbmQgeXV2IHBpcGVsaW5lcy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFNodS1oc2lh
bmcgWWFuZyA8U2h1LWhzaWFuZy5ZYW5nQG1lZGlhdGVrLmNvbT4NCj4gLS0tDQoNCltzbmlwXQ0K
DQo+ICsvKiBmbGFncyBvZiBtdGtfY2FtX3JlcXVlc3QgKi8NCj4gKyNkZWZpbmUgTVRLX0NBTV9S
RVFfRkxBR19TRU5JTkZfQ0hBTkdFRAkJCUJJVCgwKQ0KDQpNVEtfQ0FNX1JFUV9GTEFHX1NFTklO
Rl9DSEFOR0VEIGlzIG5ldmVyIHVzZWQsIHNvIGRyb3AgaXQuDQoNCj4gKyNkZWZpbmUgTVRLX0NB
TV9SRVFfRkxBR19TRU5JTkZfSU1NRURJQVRFX1VQREFURQlCSVQoMSkNCj4gKw0KPiArLyogZmxh
Z3Mgb2YgbXRrX2NhbV9yZXF1ZXN0X3N0cmVhbV9kYXRhICovDQo+ICsjZGVmaW5lIE1US19DQU1f
UkVRX1NfREFUQV9GTEFHX1RHX0ZMQVNICQlCSVQoMCkNCj4gKw0KPiArI2RlZmluZSBNVEtfQ0FN
X1JFUV9TX0RBVEFfRkxBR19NRVRBMV9JTkRFUEVOREVOVAlCSVQoMSkNCj4gKw0KPiArI2RlZmlu
ZSBNVEtfQ0FNX1JFUV9TX0RBVEFfRkxBR19TSU5LX0ZNVF9VUERBVEUJCUJJVCgyKQ0KPiArLyog
QXBwbHkgc2Vuc29yIG1vZGUgYW5kIHRoZSB0aW1pbmcgaXMgMSB2c3luYyBiZWZvcmUgKi8NCj4g
KyNkZWZpbmUgTVRLX0NBTV9SRVFfU19EQVRBX0ZMQUdfU0VOU09SX01PREVfVVBEQVRFX1QxCUJJ
VCgzKQ0KDQpNVEtfQ0FNX1JFUV9TX0RBVEFfRkxBR19TRU5TT1JfTU9ERV9VUERBVEVfVDEgaXMg
dXNlbGVzcywgc28gZHJvcCBpdC4NCg0KUmVnYXJkcywNCkNLDQoNCj4gKw0KPiArI2RlZmluZSBN
VEtfQ0FNX1JFUV9TX0RBVEFfRkxBR19TRU5TT1JfSERMX0VOCQlCSVQoNCkNCj4gKw0KPiArI2Rl
ZmluZSBNVEtfQ0FNX1JFUV9TX0RBVEFfRkxBR19SQVdfSERMX0VOCQlCSVQoNSkNCj4gKw0KPiAr
I2RlZmluZSBNVEtfQ0FNX1JFUV9TX0RBVEFfRkxBR19TRU5TT1JfSERMX0NPTVBMRVRFCUJJVCg2
KQ0KPiArDQo+ICsjZGVmaW5lIE1US19DQU1fUkVRX1NfREFUQV9GTEFHX1JBV19IRExfQ09NUExF
VEUJQklUKDcpDQo+ICsNCj4gKyNkZWZpbmUgTVRLX0NBTV9SRVFfU19EQVRBX0ZMQUdfU0VOU09S
X0hETF9ERUxBWUVECUJJVCg4KQ0KPiArDQoNCg==

