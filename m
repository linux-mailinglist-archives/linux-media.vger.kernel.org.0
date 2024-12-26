Return-Path: <linux-media+bounces-24091-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B0D9FC915
	for <lists+linux-media@lfdr.de>; Thu, 26 Dec 2024 07:37:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 60DC07A038F
	for <lists+linux-media@lfdr.de>; Thu, 26 Dec 2024 06:36:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20ECE14C5B0;
	Thu, 26 Dec 2024 06:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="h2zsOiMO";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="H2Ai0Cl2"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6EA1494A6;
	Thu, 26 Dec 2024 06:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735195006; cv=fail; b=uxjvI8lq7pE+EBT4iMtgfSE9K57DFv4D+dZEwZfYkOT9UCUGlO7yWsXCIPqqSnaJHt5Nagd7YLAtBoQLqbTNgfzJOdSiAK2RfMTsQyKxSokSarp42my8cjRK2HgS2/1/k4CdoDlRyMkV5EPox75I0AobL510T9ZzdM+ZDMEQxwA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735195006; c=relaxed/simple;
	bh=xOQD8LAptnsYQOTNMvCMEstr73mB/kghWTLO653xrxE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=taPb2faQaJqlO22T0OFKy+oHKpzJqAcohpu3CfNEk6nHSiXLw6w+CgZPRIxukTG3aNoCxPM3QlSrgeKUgCxlwkLmGryPym0l2b9MwUVa4dD3/f2+2no7jJ9wlLkKv4nwfsc7rjqPvWDnyMvHe9hDbYfSPHnrQ0Q3EHdOmmuFJjA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=h2zsOiMO; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=H2Ai0Cl2; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: c07d1cf2c35311ef99858b75a2457dd9-20241226
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=xOQD8LAptnsYQOTNMvCMEstr73mB/kghWTLO653xrxE=;
	b=h2zsOiMOzckfn1zdlhb8gEuH62j1eHLj//ZaWjg+VRNQmFcD6zPl2S6jDZz2lBiF951QksUzLYxw6M8gLazJ2O1zzqdaa/aiOAm4bkKgmTHWOKXHVuyR/I4XZXSABrzhhwMmImVdfWen8+WX+54bwu2+LiZwPsKOyGH8f/jbWac=;
X-CID-CACHE: Type:Local,Time:202412261436+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:6fd8c022-a7f4-409f-9b0f-6fdae601b853,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:5e4e3725-8650-4337-bf57-045b64170f0c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: c07d1cf2c35311ef99858b75a2457dd9-20241226
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 29404293; Thu, 26 Dec 2024 14:36:35 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 26 Dec 2024 14:36:33 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 26 Dec 2024 14:36:33 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=axuxZ8/B/WHoUok3iBomAmoxezYDTZfWI6ZfJuvIMemVbwV6mSyq94QH3+qOVLT0Tz1YZK3iRX51sUmadwxdjiiw88Tj/ITtgdQfwekfFLavJyK2NrCnYiNOhSLgoiDPqFG1KAXQ8SGkz1969WA1XXzeguMNBJqkh54F38eZJw1eal0Ob/LjBpUO4O4gdOjb7ZPEUTL1BD3G6uzk3mV3irutXaBy3aT7b8vo5NRgcUJigP3Jj3/eIgIoQJ8M+9D2KSrM19VZLwIsB0vfAb3r0/1CECs7fZ7/A+OXX2JAn9W6cl8sd9hg21hjpYYEDdNYL1xNSAhQ6eHnXr5bx1YuJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xOQD8LAptnsYQOTNMvCMEstr73mB/kghWTLO653xrxE=;
 b=irFCi+ZOY4lL5rMQnn6EN4Mey9FjSdZ4DxwnIAVgbU8ylwLEwRGDa4dV1KZp1TiJCVzwm/IzANbQn4m0DUzugh1+UkK+O5IDpLf0gkV6SYxfCxJX8ro6mqy7QjRKADsRHEvGIbkU/ZfEStS8AXAwC4ZcNrxt8h4N73jv9TSJ1bC/1+a3wZ6B89EHOKS2qOyi2m+jYGC1ueoXKjMnWf/J3U2Zyeqb9TuPkhv59F+YWAUXqiEiLbl3uTk+FjAlQ9+QBPhmkI9Hs0lC1VLmTwldCP6n3Hg7W57Z2qjOK9jqtVLDKWsiGVQ5RVauTEnO1rpUFKgPzce14+ompRwVVxT6kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xOQD8LAptnsYQOTNMvCMEstr73mB/kghWTLO653xrxE=;
 b=H2Ai0Cl2QWnuVlsMf99rXzt65Gez7hZefxIfjTlEaChnaRRqcBdzFkzer13q/kCImHn4IQpL08ddNgRvIqo9YjoKNNp+cyD/ERxrqR6NE0s9DTEacpkqHtKAh/n1nQH+Cm6d6BwKgRRXfzNBGZRKmBRmRaNzPv096WgUCsSyJ3I=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by KL1PR03MB8308.apcprd03.prod.outlook.com (2603:1096:820:106::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.19; Thu, 26 Dec
 2024 06:36:31 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8251.015; Thu, 26 Dec 2024
 06:36:18 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	=?utf-8?B?Qm8gS29uZyAo5a2U5rOiKQ==?= <Bo.Kong@mediatek.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>
Subject: Re: [PATCH v3 4/4] uapi: linux: add MT8188 AIE
Thread-Topic: [PATCH v3 4/4] uapi: linux: add MT8188 AIE
Thread-Index: AQHbVqu3NoUY7tW7Y02VDtQ/iO6t3bL4E5eA
Date: Thu, 26 Dec 2024 06:36:18 +0000
Message-ID: <188cfc0c15e6ba6e84f06b5ace376f267f40cca6.camel@mediatek.com>
References: <20241225090113.17027-1-bo.kong@mediatek.com>
	 <20241225090113.17027-5-bo.kong@mediatek.com>
In-Reply-To: <20241225090113.17027-5-bo.kong@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|KL1PR03MB8308:EE_
x-ms-office365-filtering-correlation-id: 986ff15b-d3f7-44da-3614-08dd25779a9a
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WWtIZm52R0s2RFVrRGpQMnlXT3g3eWkzUTZ3b3BoZCt2VDBDR0x2TWcrR29M?=
 =?utf-8?B?SDRFV3ZHNGZyMXEwRzl1SERsZ3Nmb2dvV3RFUy92QkJKVEdhMWFMSUtYM2dP?=
 =?utf-8?B?b0kvdElUaFRiN3ZYNUx3Vkxwa0JGSmlJcUVocWY3VlNaWWQ2VWZIQkxjb0sz?=
 =?utf-8?B?NVdRQU9uSi8rN2NFcjVaWGtQNmwzSklHNVJOSjdzcDQ5MjBTV01QdHNiUVJF?=
 =?utf-8?B?eis1c2p1UUFtOHVXMXRzbDlxa0hpZlRQc3NQWWQ0eTNQelp2ZTlzdFp2SUs1?=
 =?utf-8?B?WmZuZEZycjk2QzIzdG54bXRZc21FUHloMDFlMzI2aEFmMHYzaER3RnJLUnZN?=
 =?utf-8?B?dzlXUkVZeGFyZE1DWXNtcUw2TGR3UWlBdjRSVHRxZWI1czJBVWlSOFgvZDhQ?=
 =?utf-8?B?ZTU5VXFsdE5wSWt0QVA4dFZQM0hHL3NhZ1cxRld2cW9rYXBrVXhZT3U5SVJu?=
 =?utf-8?B?d2pvbGl6b1JiZ05kUXNZM0g1TWZTV09HUG5rRVo1VnEyNVdQb3hlVm5pWHRF?=
 =?utf-8?B?ZUMxaUhSekNXcUJoSW5tQmVHYzZJMk5FdnhFN1dRVDJ0ODUwcEpmVS9hUjQy?=
 =?utf-8?B?VUNZVGthQXhhbk5aOUtWNGMxNGNCenBwQUFHa0ZvN0d6SHFDOVVWSlZTUTNl?=
 =?utf-8?B?MXRCUTA1eHRSSWZpVjNBQjlCUHFjSENzSE83UGFVKzUrakoweUxSRUNKRlcr?=
 =?utf-8?B?aWFnVktwd3h1SXRPS1BVZVZwaTBHVS9lTjU1SUtHMFBpVW9lck9KWmVET1U4?=
 =?utf-8?B?ZDFDVytpUWJjUGVrVngyRFpvKzBmYmp6WWZ3R3UzQmprWEt1Z0h2RlZVMFZR?=
 =?utf-8?B?SXU0K1pJYTk0aDgyNUNCSG9JTXhMRzhIdW8vYkN4U3dWZTVZSERCRm1HREVH?=
 =?utf-8?B?ZEI2bVNMYlFieEpkVGFmMVNSV1dKYk1SRDFLQ3lOdXFTWFA2N3pZcnM1QUVz?=
 =?utf-8?B?dld6dWxETVliaHUxRUliSUZDWU9Dc09YMCtQN2lRbHFDL2dTcmZCVkVrNWhv?=
 =?utf-8?B?L2RQeEZxczhRRW5yZldPSUJPb1JTWWZHQmVKZ1pMOW1pMTI1TFpheFQxL0p0?=
 =?utf-8?B?a1ROWEVmVklXOG4zTW50VkFRWWhaMjJnbys1S2JwTTdaTm9MMWZsVjErUDNC?=
 =?utf-8?B?NTlhWkhqakNEaGdlelNqdElmeDBXNVlWUWc5MUh6OUUyUVZnQ1RSYWJ6UVpx?=
 =?utf-8?B?NVVNTWVSdTc2VFZnSE1IektCR1RITUdaUTdFYmNWRzNiNXMxN2FleDU4MDJy?=
 =?utf-8?B?ZWlLR0tYZERuZFZPTStSUkI1YWVVT0U0UkpEeUhFSC9HUlNya1JXVXJkZllB?=
 =?utf-8?B?ZVAxdUdyR3FJcEx2aXZEY1RzaXB2Mzd2R2pyMWZNVUtPQm1oUDZWNmJwV2xL?=
 =?utf-8?B?bXJ0YVJjejVNVW5QMlFBc1ZOTE9DeHpQNmU4RS9aakd0NUwrcDU2QWhxRUVX?=
 =?utf-8?B?N1B3MUxzWTdCWmYxSk9EY1BPYWdPeFZXVVA2Nkp0UGw3V2hZUWtzN3BFOHg0?=
 =?utf-8?B?S2tFOHp0alRQeHRNaGZWUmtmNUxuNDF1Tm5pYVF5cDRadmNzNXl6R0RmbzRY?=
 =?utf-8?B?TlFTRS9nYTVXL0x3eWJ1TmRJenZReUxKU1pqUVRNd25UZnZlTy93RGY1S1lW?=
 =?utf-8?B?bVVpY0NUZmVYS2kwMmJXZzJnekgyVTNBUjg1RWM0U1AyM1JHYmUvZk1SOUpJ?=
 =?utf-8?B?QzQzSWsxQ2VuUktydysrQUY2VThSOXI2Y1ArczhkV1lHWXBabFNzVk9VNW1N?=
 =?utf-8?B?VHdMY2xTcUFzc2R6T29DMkVQaE9xM1RMblVLQ0JrSHo4Y3Vtbjc2d0x2aU9U?=
 =?utf-8?B?WDVqSmg0ZS9pZnQzY09BNEM1STRLMXpyT0RuNFhWS2lTYWlselBxeXQ4WU9C?=
 =?utf-8?B?SUZZMnZValVsRDAvSkM4a0lUcWloUnI4d0x6NExETk9SY3VydGhzTmc2UkZz?=
 =?utf-8?Q?fnnrCiZUaQuyRdKL6aCJkyvMSaU3BH6o?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SXpHRWhvVFNDbGw1QjIvbUJ0VU5vNVp1UlJnL2J2NGZ5SzNYVFJtd25ud1pN?=
 =?utf-8?B?SHdpOTh1RzdBeEZXWXJDTjRrcEF1SFRkdVRkM0RWSVlqY0g4QklCOS9JeURM?=
 =?utf-8?B?bCttTzZUQUxvU3cwcGN0KzNNRDhmY0NVQkY5OTFtZzRmN24vSGF6NW9KNVZS?=
 =?utf-8?B?eW43dEg1NjR0T3NST2FGNysrOXNoVHdlZEpGdzBNSDRKcGUzRWozUzNxUkVZ?=
 =?utf-8?B?dCtITEdvMFc2bFZlYmx6aWhqalZXSzQrYm5taCtOTmMyQVlwTlFZREsrNFhG?=
 =?utf-8?B?cXMvMVFoYmpiUk1scnNEVHhDeXZyenp3S2JpSnNBODZvV2xzOUxJUEJiMFBx?=
 =?utf-8?B?bVlLdERzd05YQm1BbUdiK0hkMGhuWWtvUlgwM25QZlpBS0plK0h3ZjJVMXhU?=
 =?utf-8?B?dC9pY3dMaTNqblNhdnRXMkRVWVV3SnFIc0ZFcHhUTmpJVWV0U0VhV1Fpak11?=
 =?utf-8?B?cHJkWUZxTWdVWjRIRkZTQ2hCK2FwdFdMci96c1hrSmdHZzhWbjdaSm9mQjlr?=
 =?utf-8?B?bEZuQmJuT2ExUzB6SWpPZ25ZNlJTeVF6eWJ1Y0pISk1qYS9hN08zY0puWEpB?=
 =?utf-8?B?Y1dqU0paOC9EWHhtQ3cxUzloQmJ6aGlQZlNJaWtJU2lyemNJNXdFeEozYm1N?=
 =?utf-8?B?SFhxcG5YZ0pWcnJtbENzdURkcjRJSzQvU2VVWndvZ2U2S0tZRWxnZ21YaTgr?=
 =?utf-8?B?cXJqLzBZa2p6UEc5QnEwUGJXeTB2aS9FY29USjdrYUlxQS8xQW96M2hRYWVv?=
 =?utf-8?B?UzZUaWx3WUcwUUlXRW90Z1ZHR1F3aGlMYW1TdXJjK3N3UUQzWDd6aFFwd3Ba?=
 =?utf-8?B?MkNWN3N4eXJDaDhCY2JPMzZjSHJLajZrTXRidFNmeGdrZW1hR21pQkF3MThT?=
 =?utf-8?B?MDRVN2ZLUnpwd3B6MTkrWFRSZUtxUDRnOU9kdCtPTzZIaWlxNG91b3YxZEVq?=
 =?utf-8?B?bVZzMXJ3b3Nic0FmOWRiVU1SRVV4ODBqRDFsTUJTbk1FNnQvQXhseWZ5UWJm?=
 =?utf-8?B?VFNFOE9Sb3B4a0ZXL1Vkc253cUMyem1EY0xLVmdXRFhzUlQvYjFGcFhNWFJ1?=
 =?utf-8?B?aWt5bUU2dTM2ckxONXh2OEs4NDlWRjdldDlVbDV3amlib0pKakI4UGVXaWlN?=
 =?utf-8?B?NnRXYmtERldlUEMydktXZEUxMGI1ZE1SVjZkMkdzdkZIUGVRUWdJcUJrZGxQ?=
 =?utf-8?B?SkRDZ1VNeDN3WWFJR29EU3dmdFRkaG1mTjMwNUZ5K2szVThqZ2VsUmc3STJW?=
 =?utf-8?B?TmM1Q3dydjBYcXh4c2xRczVWZm85V1RZa0JmNnRBazI2SUdRNmN1Qkk0NTdo?=
 =?utf-8?B?U3R2VEJXSHJtRXpqTG5ZbzZDY1dzdGp4OHVXeHl2OHlQb00rUUhjY3NJc0xN?=
 =?utf-8?B?ZDJRNVJQUWhDcEJtbFJiNFhtRWp3SVorT2RlU0hIQ0htZE5CRVlmNk9CTmF0?=
 =?utf-8?B?L0Jyckc5c3ZNeUFNdzd3Q3d0WGRQenNrdHRQdUhRRnVobXFtS2ZjakRnZXpw?=
 =?utf-8?B?bU1LeUN5TnAvSGR0dU0venFLWUZLL2lqTGJBdDNrNTRXMHU4ZkVWTFREenpk?=
 =?utf-8?B?YWZnTjdveWlzd0t3VTRPZkhMZlVLTHlkbno0eFB4YWFsY3Z0ZlFJWWQrbTRD?=
 =?utf-8?B?ZWp3K1hlWndLR2hwQmk0VllYL0RaRVRlU0k3M1JmYmszYnhsWTFuT212bmdG?=
 =?utf-8?B?bFEvNi9WMGxZZm9xUENnM2pFdWNPcGNQMGY4NlozMUZRaVJpR1orcWhXbVRI?=
 =?utf-8?B?V1AzTzJEYlltSlJrT1N4UjlGTURtR1FYRWI4Q0w1eEJuRGVMellMOWxOQ0VB?=
 =?utf-8?B?RGJqSDIyVWJqSjBobHVlc3VzeVhWSGtBYnFVYzQ2MG5NSkFuM1g2OW5UUEth?=
 =?utf-8?B?NVczamplYk9iKy9admpvaWIyaFdvNW1NVmNNc3dCN1JNVXkrdEpCWWF4L1ZU?=
 =?utf-8?B?djdxRHJsdXVNeXQ2VGRsdGlyUmZaK25nRGVMeHdCZktSUWZnVlo2a3BhZkVv?=
 =?utf-8?B?QWd2Tnh2elFoR01pQXdacWJIdWtPdk1JaHJwcWNBeDZIa1VtZlh2M2U1MVpH?=
 =?utf-8?B?Zlh4WVF5SVYyNUhnWW1GbXNLcjRhMUhpWllnSGhOeDlhdHR1cVZXaXRKQko1?=
 =?utf-8?Q?/LpU2Ei89BZMQ8WE3+SPXfWy/?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0991D2B294469D419178235C0362674D@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 986ff15b-d3f7-44da-3614-08dd25779a9a
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Dec 2024 06:36:18.1258
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zKSmzFEElLFj51pM4aUkQQeFaqYnbY+u5A3lB16gjxeroL1mF3DbmkUK9eqVjcZr5XcxYOM6qNFSG8lvxm6oOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8308

T24gV2VkLCAyMDI0LTEyLTI1IGF0IDE3OjAwICswODAwLCBiby5rb25nIHdyb3RlOg0KPiBGcm9t
OiBCbyBLb25nIDxCby5Lb25nQG1lZGlhdGVrLmNvbT4NCj4gDQo+IEFkZCBBSUUgY29udHJvbCBy
ZWxhdGVkIGRlZmluaXRpb25zLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQm8gS29uZyA8Qm8uS29u
Z0BtZWRpYXRlay5jb20+DQo+IC0tLQ0KPiANCj4gQ2hhbmdlcyBpbiB2MzoNCj4gbm9uZQ0KPiAN
Cj4gQ2hhbmdlcyBpbiB2MjoNCj4gMS4gRml4IGNvZGluZyBzdHlsZQ0KPiAtLS0NCj4gIGluY2x1
ZGUvdWFwaS9saW51eC9tdGtfYWllX3Y0bDJfY29udHJvbHMuaCB8IDEzMiArKysrKysrKysrKysr
KysrKysrKysNCj4gIGluY2x1ZGUvdWFwaS9saW51eC92aWRlb2RldjIuaCAgICAgICAgICAgICB8
ICAgNiArDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDEzOCBpbnNlcnRpb25zKCspDQo+ICBjcmVhdGUg
bW9kZSAxMDA2NDQgaW5jbHVkZS91YXBpL2xpbnV4L210a19haWVfdjRsMl9jb250cm9scy5oDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2xpbnV4L210a19haWVfdjRsMl9jb250cm9s
cy5oIGIvaW5jbHVkZS91YXBpL2xpbnV4L210a19haWVfdjRsMl9jb250cm9scy5oDQo+IG5ldyBm
aWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAwMC4uZTYzNTU0OGMyY2RmDQo+IC0t
LSAvZGV2L251bGwNCj4gKysrIGIvaW5jbHVkZS91YXBpL2xpbnV4L210a19haWVfdjRsMl9jb250
cm9scy5oDQo+IEBAIC0wLDAgKzEsMTMyIEBADQo+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogR1BMLTIuMCBXSVRIIExpbnV4LXN5c2NhbGwtbm90ZSAqLw0KPiArLyoNCj4gKyAqIEFJRSBD
b250cm9scyBIZWFkZXINCj4gKyAqDQo+ICsgKiBDb3B5cmlnaHQgKGMpIDIwMjAgTWVkaWFUZWsg
SW5jLg0KPiArICogQXV0aG9yOiBGaXNoIFd1IDxmaXNoLnd1QG1lZGlhdGVrLmNvbT4NCj4gKyAq
Lw0KPiArDQo+ICsjaWZuZGVmIF9fTVRLX0FJRV9WNEwyX0NPTlRST0xTX0hfXw0KPiArI2RlZmlu
ZSBfX01US19BSUVfVjRMMl9DT05UUk9MU19IX18NCj4gKw0KPiArI2luY2x1ZGUgPGxpbnV4L3R5
cGVzLmg+DQo+ICsNCj4gKy8qDQo+ICsgKiBUaGUgYmFzZSBmb3IgdGhlIG1lZGlhdGVrIEZhY2Ug
RGV0ZWN0aW9uIGRyaXZlciBjb250cm9scy4NCj4gKyAqIFdlIHJlc2VydmUgMTYgY29udHJvbHMg
Zm9yIHRoaXMgZHJpdmVyLg0KPiArICogRWFjaCBDSUQgcmVwcmVzZW50cyBkaWZmZXJlbnQgc3Rh
Z2VzIG9mIEFJRSwgd2l0aCBkaWZmZXJlbnQgc3RydWN0dXJlcyBhbmQgZnVuY3Rpb25zDQo+ICsg
KiBhbmQgY2Fubm90IGJlIHJldXNlZA0KPiArICovDQo+ICsjZGVmaW5lIFY0TDJfQ0lEX1VTRVJf
TVRLX0ZEX0JBU0UgKFY0TDJfQ0lEX1VTRVJfQkFTRSArIDB4MWZkMCkNCj4gKw0KPiArI2RlZmlu
ZSBWNEwyX0NJRF9NVEtfQUlFX0lOSVQgKFY0TDJfQ0lEX1VTRVJfTVRLX0ZEX0JBU0UgKyAxKQ0K
PiArI2RlZmluZSBWNEwyX0NJRF9NVEtfQUlFX1BBUkFNIChWNEwyX0NJRF9VU0VSX01US19GRF9C
QVNFICsgMikNCj4gKw0KPiArI2RlZmluZSBWNEwyX0ZMRF9NQVhfRlJBTUUgMTUNCj4gKw0KPiAr
LyoqDQo+ICsgKiBzdHJ1Y3QgdjRsMl9jdHJsX2FpZV9pbml0IC0gYWllIGluaXQgcGFyYW1ldGVy
cy4NCj4gKyAqDQo+ICsgKiBAbWF4X2ltZ193aWR0aDogbWF4aW11bSB3aWR0aCBvZiB0aGUgc291
cmNlIGltYWdlLg0KPiArICogQG1heF9pbWdfaGVpZ2h0OiBtYXhpbXVtIGhlaWdodCBvZiB0aGUg
c291cmNlIGltYWdlLg0KPiArICogQHB5cmFtaWRfd2lkdGg6IG1heGltdW0gd2lkdGggb2YgdGhl
IGJhc2UgcHlyYW1pZC4NCj4gKyAqIEBweXJhbWlkX2hlaWdodDogbWF4aW11bSBoZWlnaHQgb2Yg
dGhlIGJhc2UgcHlyYW1pZC4NCj4gKyAqIEBmZWF0dXJlX3RocmVzaG9sZDogZmVhdHVyZSB0aHJl
c2hvbGQgZm9yIGhhcmV3YXJlLg0KPiArICovDQo+ICtzdHJ1Y3QgdjRsMl9jdHJsX2FpZV9pbml0
IHsNCj4gKwlfX3UzMiBtYXhfaW1nX3dpZHRoOw0KPiArCV9fdTMyIG1heF9pbWdfaGVpZ2h0Ow0K
PiArCV9fdTMyIHB5cmFtaWRfd2lkdGg7DQo+ICsJX191MzIgcHlyYW1pZF9oZWlnaHQ7DQo+ICsJ
X19zMzIgZmVhdHVyZV90aHJlc2hvbGQ7DQo+ICt9Ow0KPiArDQo+ICsvKioNCj4gKyAqIHN0cnVj
dCB2NGwyX2FpZV9yb2kgLSBhaWUgcm9pIHBhcmFtZXRlcnMuDQo+ICsgKg0KPiArICogQHgxOiB4
MSBvZiB0aGUgcm9pIGNvb3JkaW5hdGUuDQo+ICsgKiBAeTE6IHkxIG9mIHRoZSByb2kgY29vcmRp
bmF0ZS4NCj4gKyAqIEB4MjogeDIgb2YgdGhlIHJvaSBjb29yZGluYXRlLg0KPiArICogQHkyOiB5
MiBvZiB0aGUgcm9pIGNvb3JkaW5hdGUuDQo+ICsgKi8NCj4gK3N0cnVjdCB2NGwyX2FpZV9yb2kg
ew0KPiArCV9fdTMyIHgxOw0KPiArCV9fdTMyIHkxOw0KPiArCV9fdTMyIHgyOw0KPiArCV9fdTMy
IHkyOw0KPiArfTsNCj4gKw0KPiArLyoqDQo+ICsgKiBzdHJ1Y3QgdjRsMl9haWVfcGFkZGluZyAt
IGFpZSBwYWRkaW5nIHBhcmFtZXRlcnMuDQo+ICsgKg0KPiArICogQGxlZnQ6IHRoZSBzaXplIG9m
IHBhZGRpbmcgbGVmdC4NCj4gKyAqIEByaWdodDogdGhlIHNpemUgb2YgcGFkZGluZyByaWdodC4N
Cj4gKyAqIEBkb3duOiB0aGUgc2l6ZSBvZiBwYWRkaW5nIGJlbG93Lg0KPiArICogQHVwOiB0aGUg
c2l6ZSBvZiBwYWRkaW5nIGFib3ZlLg0KPiArICovDQo+ICtzdHJ1Y3QgdjRsMl9haWVfcGFkZGlu
ZyB7DQo+ICsJX191MzIgbGVmdDsNCj4gKwlfX3UzMiByaWdodDsNCj4gKwlfX3UzMiBkb3duOw0K
PiArCV9fdTMyIHVwOw0KPiArfTsNCj4gKw0KPiArLyoqDQo+ICsgKiBzdHJ1Y3QgdjRsMl9mbGRf
Y3JvcF9yaXBfcm9wIC0gYWllIGZsZCBwYXJhbWV0ZXJzLg0KPiArICoNCj4gKyAqIEBmbGRfaW5f
Y3JvcF94MTogeDEgb2YgdGhlIGNyb3AgY29vcmRpbmF0ZS4NCj4gKyAqIEBmbGRfaW5fY3JvcF95
MTogeTEgb2YgdGhlIGNyb3AgY29vcmRpbmF0ZS4NCj4gKyAqIEBmbGRfaW5fY3JvcF94MjogeDIg
b2YgdGhlIGNyb3AgY29vcmRpbmF0ZS4NCj4gKyAqIEBmbGRfaW5fY3JvcF95MjogeTIgb2YgdGhl
IGNyb3AgY29vcmRpbmF0ZS4NCj4gKyAqIEBmbGRfaW5fcmlwOiBmbGQgaW4gcmlwLg0KPiArICog
QGZsZF9pbl9yb3A6IGZsZCBpbiByb3AuDQo+ICsgKi8NCj4gK3N0cnVjdCB2NGwyX2ZsZF9jcm9w
X3JpcF9yb3Agew0KPiArCV9fdTMyIGZsZF9pbl9jcm9wX3gxOw0KPiArCV9fdTMyIGZsZF9pbl9j
cm9wX3kxOw0KPiArCV9fdTMyIGZsZF9pbl9jcm9wX3gyOw0KPiArCV9fdTMyIGZsZF9pbl9jcm9w
X3kyOw0KPiArCV9fdTMyIGZsZF9pbl9yaXA7DQo+ICsJX191MzIgZmxkX2luX3JvcDsNCj4gK307
DQo+ICsNCj4gKy8qKg0KPiArICogc3RydWN0IHY0bDJfZmxkX2Nyb3BfcmlwX3JvcCAtIGFpZSBm
bGQgcGFyYW1ldGVycy4NCj4gKyAqDQo+ICsgKiBAZmRfbW9kZTogc2VsZWN0IGEgbW9kZSBmb3Ig
Y3VycmVudCBmZC4NCg0KV2hlcmUgaXMgdGhlIGRlZmluaXRpb24gb2YgbW9kZT8NCg0KPiArICog
QHNyY19pbWdfZm10OiBzb3VyY2UgaW1hZ2UgZm9ybWF0Lg0KPiArICogQHNyY19pbWdfd2lkdGg6
IHRoZSB3aWR0aCBvZiB0aGUgc291cmNlIGltYWdlLg0KPiArICogQHNyY19pbWdfaGVpZ2h0OiB0
aGUgaGVpZ2h0IG9mIHRoZSBzb3VyY2UgaW1hZ2UuDQo+ICsgKiBAc3JjX2ltZ19zdHJpZGU6IHRo
ZSBzdHJpZGUgb2YgdGhlIHNvdXJjZSBpbWFnZS4NCg0KSSdtIG5vdCBmYW1pbGlhciB3aXRoIFY0
TDIsIGJ1dCBJIHRoaW5rIHRoZXJlIGlzIGEgc3RhbmRhcmQgaW50ZXJmYWNlIHRvIHNldCBzb3Vy
Y2UgYnVmZmVyIGZvcm1hdCwgd2lkdGgsIGhlaWdodCwgc3RyaWRlLg0KDQo+ICsgKiBAcHlyYW1p
ZF9iYXNlX3dpZHRoOiB0aGUgd2lkdGggb2YgdGhlIGJhc2UgcHlyYW1pZC4NCj4gKyAqIEBweXJh
bWlkX2Jhc2VfaGVpZ2h0OiB0aGUgd2lkdGggb2YgdGhlIGJhc2UgcHlyYW1pZC4NCj4gKyAqIEBu
dW1iZXJfb2ZfcHlyYW1pZDogbnVtYmVyIG9mIHB5cmFtaWQuDQoNCkhvdyBkb2VzIHB5cmFtaWQg
d29yaz8NCkRvZXMgcHlyYW1pZCB3aWR0aCBhbmQgaGVpZ2h0IGhhcyBhbnkgbGltaXRhdGlvbj8g
TGFyZ2VyIHRoYW4gaW1hZ2Ugd2lkdGggYW5kIGhlaWdodD8NCkhvdyBtYW55IG51bWJlciBvZiBw
eXJhbWlkIGNvdWxkIGJlIHNldD8NCg0KPiArICogQHJvdGF0ZV9kZWdyZWU6IHRoZSByb3RhdGUg
ZGVncmVlIG9mIHRoZSBpbWFnZS4NCj4gKyAqIEBlbl9yb2k6IGVuYWJsZSByb2kuDQo+ICsgKiBA
c3JjX3JvaTogcm9pIHBhcmFtcy4NCg0KV2hhdCBpcyByb2k/IERvZXMgcm9pIG1lYW5zICdyZWdp
b24gb2YgaW50ZXJlc3QnPw0KSWYgaXQgaXMgZW5hYmxlLCBob3cgaXQgd29yaz8NCg0KPiArICog
QGVuX3BhZGRpbmc6IGVuYWJsZSBwYWRkaW5nLg0KPiArICogQHNyY19wYWRkaW5nOiBwYWRkaW5n
IHBhcmFtcy4NCg0KSW4gd2hpY2ggY2FzZSBuZWVkIHBhZGRpbmc/DQpGb3IgZmFjZSBkZXRlY3Rp
b24sIHBhZGRpbmcgd291bGQgbm90IGhlbHAgYW55IHRoaW5nLg0KDQo+ICsgKiBAZnJlcV9sZXZl
bDogZnJlcXVlbmN5IGxldmVsLg0KDQpXaGF0J3MgZnJlcV9sZXZlbD8NCkhvdyB0byBhc3NpZ24g
aXQ/DQoNCj4gKyAqIEBmbGRfZmFjZV9udW06IHRoZSBudW1iZXIgb2YgZmFjZXMgaW4gZmxkLg0K
PiArICogQGZsZF9pbnB1dDogZmxkIGlucHV0IHBhcmFtcy4NCg0KV2hhdCBpcyBmbGQ/DQpXaHkg
dXNlciBzcGFjZSBhbHJlYWR5IGtub3cgaG93IG1hbnkgZmFjZXMgaW4gaW1hZ2U/DQpJIHRoaW5r
IG51bWJlciBvZiBmYWNlcyBpcyBkZXRlY3RlZCBieSBrZXJuZWwuDQoNCj4gKyAqLw0KPiArc3Ry
dWN0IHY0bDJfY3RybF9haWVfcGFyYW0gew0KPiArCV9fdTMyIGZkX21vZGU7DQo+ICsJX191MzIg
c3JjX2ltZ19mbXQ7DQo+ICsJX191MzIgc3JjX2ltZ193aWR0aDsNCj4gKwlfX3UzMiBzcmNfaW1n
X2hlaWdodDsNCj4gKwlfX3UzMiBzcmNfaW1nX3N0cmlkZTsNCj4gKwlfX3UzMiBweXJhbWlkX2Jh
c2Vfd2lkdGg7DQo+ICsJX191MzIgcHlyYW1pZF9iYXNlX2hlaWdodDsNCj4gKwlfX3UzMiBudW1i
ZXJfb2ZfcHlyYW1pZDsNCj4gKwlfX3UzMiByb3RhdGVfZGVncmVlOw0KPiArCV9fczMyIGVuX3Jv
aTsNCj4gKwlzdHJ1Y3QgdjRsMl9haWVfcm9pIHNyY19yb2k7DQo+ICsJX19zMzIgZW5fcGFkZGlu
ZzsNCj4gKwlzdHJ1Y3QgdjRsMl9haWVfcGFkZGluZyBzcmNfcGFkZGluZzsNCj4gKwlfX3UzMiBm
cmVxX2xldmVsOw0KPiArCV9fdTMyIGZsZF9mYWNlX251bTsNCj4gKwlzdHJ1Y3QgdjRsMl9mbGRf
Y3JvcF9yaXBfcm9wIGZsZF9pbnB1dFtWNEwyX0ZMRF9NQVhfRlJBTUVdOw0KPiArfTsNCj4gKw0K
PiArI2VuZGlmIC8qIF9fTVRLX0FJRV9WNEwyX0NPTlRST0xTX0hfXyAqLw0KPiBkaWZmIC0tZ2l0
IGEvaW5jbHVkZS91YXBpL2xpbnV4L3ZpZGVvZGV2Mi5oIGIvaW5jbHVkZS91YXBpL2xpbnV4L3Zp
ZGVvZGV2Mi5oDQo+IGluZGV4IGU3YzRkY2UzOTAwNy4uYjIzYTllOTljODM1IDEwMDY0NA0KPiAt
LS0gYS9pbmNsdWRlL3VhcGkvbGludXgvdmlkZW9kZXYyLmgNCj4gKysrIGIvaW5jbHVkZS91YXBp
L2xpbnV4L3ZpZGVvZGV2Mi5oDQo+IEBAIC04NzcsNiArODc3LDkgQEAgc3RydWN0IHY0bDJfcGl4
X2Zvcm1hdCB7DQo+ICAjZGVmaW5lIFY0TDJfTUVUQV9GTVRfR0VORVJJQ19DU0kyXzI0CXY0bDJf
Zm91cmNjKCdNJywgJ0MnLCAnMScsICdPJykgLyogMjQtYml0IENTSS0yIHBhY2tlZCA4LWJpdCBt
ZXRhZGF0YSAqLw0KPiAgI2VuZGlmDQo+ICANCj4gKy8qIFZlbmRvci1zcGVjaWZpYyBkZWZpbml0
aW9uOiB1c2VkIGZvciB0aGUgTWVkaWFUZWsgY2FtZXJhIHN1YnN5c3RlbSdzIGZhY2UgZGV0ZWN0
aW9uIHJlc3VsdHMgKi8NCj4gKyNkZWZpbmUgVjRMMl9NRVRBX0ZNVF9NVEZEX1JFU1VMVCB2NGwy
X2ZvdXJjYygnTScsICdUJywgJ2YnLCAnZCcpDQo+ICsNCj4gIC8qIHByaXYgZmllbGQgdmFsdWUg
dG8gaW5kaWNhdGVzIHRoYXQgc3Vic2VxdWVudCBmaWVsZHMgYXJlIHZhbGlkLiAqLw0KPiAgI2Rl
ZmluZSBWNEwyX1BJWF9GTVRfUFJJVl9NQUdJQwkJMHhmZWVkY2FmZQ0KPiAgDQo+IEBAIC0xOTYx
LDYgKzE5NjQsOSBAQCBlbnVtIHY0bDJfY3RybF90eXBlIHsNCj4gIAlWNEwyX0NUUkxfVFlQRV9B
VjFfVElMRV9HUk9VUF9FTlRSWSA9IDB4MjgxLA0KPiAgCVY0TDJfQ1RSTF9UWVBFX0FWMV9GUkFN
RQkgICAgPSAweDI4MiwNCj4gIAlWNEwyX0NUUkxfVFlQRV9BVjFfRklMTV9HUkFJTgkgICAgPSAw
eDI4MywNCj4gKw0KPiArCVY0TDJfQ1RSTF9UWVBFX0FJRV9JTklUCQk9IDB4MDI5MCwNCj4gKwlW
NEwyX0NUUkxfVFlQRV9BSUVfUEFSQU0JPSAweDAyOTEsDQo+ICB9Ow0KPiAgDQo+ICAvKiAgVXNl
ZCBpbiB0aGUgVklESU9DX1FVRVJZQ1RSTCBpb2N0bCBmb3IgcXVlcnlpbmcgY29udHJvbHMgKi8N
Cg0K

