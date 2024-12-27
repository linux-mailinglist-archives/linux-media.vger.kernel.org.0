Return-Path: <linux-media+bounces-24106-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3DE9FCFE8
	for <lists+linux-media@lfdr.de>; Fri, 27 Dec 2024 04:55:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 225F11883420
	for <lists+linux-media@lfdr.de>; Fri, 27 Dec 2024 03:55:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0592B50276;
	Fri, 27 Dec 2024 03:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="eGRU/aL1";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="VqcBNdBn"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F0D374EA;
	Fri, 27 Dec 2024 03:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735271695; cv=fail; b=W8WuK3fHZ6xVpmW6Cupb1vRkH6Rc+fsQ/5Mz3Q4L0F9dFoG1tMCkcHh4bYG1kzlG8VMHPOk4SDjdG15WmEwFV9o/bQFFl4FCUpJ2XrGfTefykdMYNdTlmPZar2WgpJlbvOFhxhZxg+RP0TnNto7YCTVgQAgOILiCt9uY3OHlSqQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735271695; c=relaxed/simple;
	bh=qa5GDb4bKsShhtLa7/F9ceUkt6lXp2tmZE0peuTpFmU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PRY9VyL4rJyYkFziExCaEA1U0cVA+lhJfEM/XDukgBIEukmv0xq0ckMrkrp8C2spWcxxOSLXlu9mUjsI2zrDxCUEN0aOFNBq8951sj6TNb+WxudoEwj29EZ7CsmZ8lVMgmDLClrOywzrggnBSHsyODO06hxHsdDHQtXlI+/TK/k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=eGRU/aL1; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=VqcBNdBn; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 4ccc00c6c40611efbd192953cf12861f-20241227
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=qa5GDb4bKsShhtLa7/F9ceUkt6lXp2tmZE0peuTpFmU=;
	b=eGRU/aL1AtNLAgSiVFlMm12chXWfgK2O6A1yRkRSaR4Jf1r7cn4BMi1eP/LeJAbUaNGJIxItsMmus+pNv/xB9ezmVVOXTLtypSr0fd9qCMlcKBewJ+Rt3iodJ1jF7qERoXRYd+qWHC2VLhQu0cijSEdsq5iQvXsg7A2LscFb1go=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:2d437de8-3421-4e24-9998-02999d146623,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:f972f736-e11c-4c1a-89f7-e7a032832c40,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 4ccc00c6c40611efbd192953cf12861f-20241227
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1904317827; Fri, 27 Dec 2024 11:54:40 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 27 Dec 2024 11:54:39 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 27 Dec 2024 11:54:39 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n8XQcdilytxV8oKrkoGnvjPhrEtWD74MThYJMoshuj/T19nQCXY2ArykvpJeUWAtZutrmdOSSRhfofH5icMofcyFaEGhmNq31p/76DMGdFwciy+idtlfZnpI0ZxRkZ8RJ/P+VoSmDCuF4PobqZ2o1WfOsi+0orXtuBe5qHa3XWIQk5oZuf/Aicndtbsx2Egn3KJiN+jbcyDfNACeF31QqSI/a5GLUNTGF0fkPE3LgrwksHY2BgxeAbwlY2XusnDmwtY8yhO6TdOQ6S0si+PGxJm/Ly7EY312V/tmkUMhvDyKRGOCsOjIezMf+wOWOr/3CKJVmn16T78Bejgz+hEoaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qa5GDb4bKsShhtLa7/F9ceUkt6lXp2tmZE0peuTpFmU=;
 b=EDju76JYJ+nDD09kGMlIlWHyUTaIRKWekdvZNABf6wDHbLN9rMXuJr8qwAwdGZsiyRe7D8QJ/R2ec+ax29vliPoj0rH0abCjXH6OvPJ/SpXNaTcS/ZwfjLELIyb4SI+zSru0vLvYsqcWoPwqaqqDh5fA+UgqPb/SGCInP1ZekTzZ7zRxNDYoG72VLW9JEnLGS6Fcvg7dRjDg22a1botRlYvVVhQ6FBjbg0mkBfpMluJlwTETD+/Akuj8IQyxyJP7aIW8qrq0cPzklM0lXBVqEe2f76O89ikiYMc6RKUJOh3UtvoFrkA4tUmVExMsDTDzOCtetQG8xKHsNfGes6DMOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qa5GDb4bKsShhtLa7/F9ceUkt6lXp2tmZE0peuTpFmU=;
 b=VqcBNdBnBduK/+Ag06J6tiFBObK+gH1dH0zNZPTvLB7cZRb0cVv6FUo8k6X0sJYsvhRcoWj8oY4Z+d2BazAd/NiavrWbz1tZ5xDj4RfYcDlzs8ADJPKRT3lsna/4+RYfVMKwt149L3VIW3ftjU8yjozi8njmEY+yHQ3/gXDGJUw=
Received: from SEYPR03MB6626.apcprd03.prod.outlook.com (2603:1096:101:83::7)
 by KL1PR03MB7693.apcprd03.prod.outlook.com (2603:1096:820:e3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.20; Fri, 27 Dec
 2024 03:54:36 +0000
Received: from SEYPR03MB6626.apcprd03.prod.outlook.com
 ([fe80::9fa0:ee98:d5ed:beba]) by SEYPR03MB6626.apcprd03.prod.outlook.com
 ([fe80::9fa0:ee98:d5ed:beba%5]) with mapi id 15.20.8272.013; Fri, 27 Dec 2024
 03:54:36 +0000
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
Subject: Re: [PATCH v3 3/4] media: mediatek: add MT8188 AIE driver
Thread-Topic: [PATCH v3 3/4] media: mediatek: add MT8188 AIE driver
Thread-Index: AQHbVqv2E/LiiDV3F0q0O1OD05OMm7L5eL6A
Date: Fri, 27 Dec 2024 03:54:36 +0000
Message-ID: <337b5afe951eecf54e8036faa5c106866cebff69.camel@mediatek.com>
References: <20241225090113.17027-1-bo.kong@mediatek.com>
	 <20241225090113.17027-4-bo.kong@mediatek.com>
In-Reply-To: <20241225090113.17027-4-bo.kong@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB6626:EE_|KL1PR03MB7693:EE_
x-ms-office365-filtering-correlation-id: c8ab3ba0-b23f-4c06-49ee-08dd262a2e25
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?R1pmeGRhblpBbVZ2ZkViOG9wd3VmNVhPQ0I2RXBER3BwSkkrWUpiaXRVSi9E?=
 =?utf-8?B?N2VZVjU1TG9SQmhScXk3OUZjQUJaZnZCN1pLSmlLeGFNUnhhYjNIQWFXdHJw?=
 =?utf-8?B?TDQ2VmNubWdiRFB5SjRic0c3d1FYMzJRWG9Ga3J3a3hVOHh5NFJCT2RVY0po?=
 =?utf-8?B?SXRUSGhFVDMyVTQ4YWN5K2lCN0Y5bFBreGlXbEpnQ1dWVFFXNS9NVXdSTm5D?=
 =?utf-8?B?d0s5UGtKQXNYdnVXRVB0VFJMTFpvVWxKeWNpdkVRMVFSbWdieThWTk82UzVa?=
 =?utf-8?B?cUdQRHRaN0lqeHNnemZOM0dvYWFRY1kzbytmYlBIWUhteVRQcGRLNHY5YkJL?=
 =?utf-8?B?dWpvWnBDSlBZbGNFaXp1aXBWK0JlYXNITFlDbm1ieSt4SHZNVXN1TzNKSE5N?=
 =?utf-8?B?dFAyaUFCVjhWRlF3OVJSOHFEQlRuckdTUWE2SmZVd0J3OHBndUZKcGxvNnpz?=
 =?utf-8?B?dGM1a0pjNWNwWitJanU3N3IwVThtWVNzTlJHMkowdlpKbDBmckpsQ0FLUmZm?=
 =?utf-8?B?TnJXdWZNK09qYm9DYUxjMEdWcldWZTVYOGh2R2psK095My9OZm45MHV4cFgv?=
 =?utf-8?B?V054eXFlY3BFa0t5aFppbDR3SGtKakhTRmdCazlJd0pTYnpRUUJkenVzWEhv?=
 =?utf-8?B?S1IwWmJwdCs2T2hmcEtJUlFORDhEdjROYzc2di9GU0oxOXRXbjNGb0o0S21p?=
 =?utf-8?B?WVJwQzlmUUlmdHMwYnBwZ0tZVWg1d2RaLzI1WndWRHpXc1JPT2daS3huUUZm?=
 =?utf-8?B?cU9ZRm10MjFuQ2R2NzMvMXdXUHI4Z2xubW5BdklyWWN5TVpmWEZKMC91UkNI?=
 =?utf-8?B?bUc5T3RMSzZOWk95ZFp0RmJkQlI2bzZPRVJBUkQ1K2hWdUw0bUU3TkFWOERa?=
 =?utf-8?B?WDZxcjF0cDdyd01VRGM5NkE0cmdpRm5uQ0FkaWZ6cUFNRy95R0Y1REo3eEZp?=
 =?utf-8?B?cEJWckt3N00rc05McTgwWVhOcGowbm12M24zWXFET1dLVmI3RkRMcW9hMGJP?=
 =?utf-8?B?L2hkdnRGY1BvZDc5RDlkbnNCRkhGcC9TM21zN2Roek0zOVZGemh1cXI3TWhE?=
 =?utf-8?B?cUhzRFlaZGpVL1pIWXl5ZEJobDhQdTI4TWIwMzNkQVBwNlpDbHp1U1puNDZl?=
 =?utf-8?B?dXVrbDFoRmlnYkVRUEtlVzE3NGNZL1BWWU1SdStoZm42SERoeGYycmNiOUdi?=
 =?utf-8?B?akJQd0Zqd0g5bVJWeHU2eXhuaTE1NGhYeFRPaHV2KzJsUmZSRlcwc0lvcE5T?=
 =?utf-8?B?SG0wMlBOMnpYZkdkVU4vcTYrUldRZ0lmRUtsK045SUJUZVNOUjgwRkRNaWxh?=
 =?utf-8?B?UzVrNFJjbWZJMFhjVnBmZHE4QnBYOFhhOEdaZG8reEhralM1MDcyNDd2aG1a?=
 =?utf-8?B?azZpOUducElPTTdIeUwrYWcwVlp3VEJpcHF3YXVOb3hYUkVkU05Dczk4Y0FH?=
 =?utf-8?B?QlpxRXdlSTlUd29CbEJ2SklNcnhkMWhoSnY3b1N0Z2hNY1N3WUppRmh5dGYz?=
 =?utf-8?B?Z3NOUFgwNTdOc3drdGxORkJnT1FQcjVBUWVQQ3dDQllPN3lXSFd5TFV5Q2h0?=
 =?utf-8?B?ZVZFY05uSkJ0U3B6MHNkeGxEYTJNYzNvV3RPdjRJTmVkM2V4UzRXbmNHR05T?=
 =?utf-8?B?YnpneWtqd0d1ejhUNEFaMEgwbksvOFpnYU1yZ3N2MVJQU3p5UFQ5ekJqeFpx?=
 =?utf-8?B?NGpacSsramNTbDBuaS85NU9HV25lL1pjSVRjZ1dmQVlYWEdSaEE1RnltRDN6?=
 =?utf-8?B?aVVhNTdBTmFuQkFmZG82TEl0RGZHajZFcUFjeVFuK1N6bmRWMHV1d0NIYURJ?=
 =?utf-8?B?K1RKYmdWbUFJb0pHOXhSYS9lL3VIT25iRTdTb3FWSXJaWEFIekVrS212bFI3?=
 =?utf-8?B?dkZCSHhZbmFqYUtqRURMMWxDQUp3SzZuMzV1SXVPL04yMnJLdGI5TThCQlIx?=
 =?utf-8?Q?R+50F6sIZqGPPrs00WKRzGaQt3PAJiFC?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB6626.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c0p5dHp2V1J0dHpPRlhjM3JiVUR0aWdmLzl1WXVjdTRZUHdRNFMxMCs2YWls?=
 =?utf-8?B?Yktmc1FGU3paTm1qZlpuU2pkWi8yeUVqdWxuT2R6UEY0ellBbW90V2t0a2Ru?=
 =?utf-8?B?Vi9YSTlRdUQxeXZMMWZyekdGSnUxUkxXL0xXUXowQm5CMVVza3hUbXdYRUg1?=
 =?utf-8?B?bTh3RlgyWW1rc1FSeTdPOGprS0RXT0lpVjFPV2tQU1lvN05PZTF2RS9PamRl?=
 =?utf-8?B?bkFZMDJMZGVjVGlMUDlFdmw1T0l6L3h3Wnd4bHBJQ2tLd2dkV3g3elpQTmpq?=
 =?utf-8?B?R1hHWnlBbHcrSlF6VzVLY2pHbEUwbjJHWTVORTM1RHF0bS9aMldmSWdmVi8r?=
 =?utf-8?B?NXZ4VGcyT1hCcllUOGx4TkNqYmpZRHZ4R3ZKUFZFWmRMb0VmbnZHcDd6OTNK?=
 =?utf-8?B?Q2w2ZmwxOFdmanh6cXhIcjBwTUo3U0lJUkdKd1N6Vk1xQ0Fmcm1obG1TQ0Zj?=
 =?utf-8?B?QXJLNXBxM0RxQW5tU3VzZUE5NkNod281Tm5LeFJqV3psQzZlaUE4NVNXb3Rp?=
 =?utf-8?B?SFM3SEFhbjFUY251NndBRjJsVDkzenVZUUpjVmFJVXNyMTQxeHpIVjVBR3Q3?=
 =?utf-8?B?NmZDdk9zbDVDeWc0ZmJYYXJJWWFteUtwNS9ZQWEwanZIVFo3ZXN3SmVSVC9a?=
 =?utf-8?B?bThjci9UTE5ESEtQRFV6aUlXb3VRVVBmcFNROU5kbk1ORWIxY2lBdzFtVGgy?=
 =?utf-8?B?ZENocUhTRndWaEMwMFdLSTM0SlJTUWJXcjFuRldoZS9WTC9WSEZUcmZKVFZt?=
 =?utf-8?B?NE96b09aZzJ1TU92K3RlZ0NIVXdCKzQ1Z3JaQnptTk5ScFhNeE5tTTI2QVdw?=
 =?utf-8?B?TUZZTk1uQlZOWnp4SU1jMnlEcFhLZkQwdHFOZElQZjFFQk1JU1NDc0phQnk1?=
 =?utf-8?B?QzJVYk5BRnZibDFXYkp6c3cvaW1XOHhNRjIvck9jNm5KZ3Z6azNvY25tSmJ4?=
 =?utf-8?B?cWt6dVBBb2F1cXJYYStoZEpvaWg4d05xU0tER25kcnFPazVwV0VYTGtNRGFN?=
 =?utf-8?B?TzA3TkZwQWpvSmVUM1RQMFJvL2Z5eW5pdlFRd3ZaUGI4T3NMd3M1UnNYa1lD?=
 =?utf-8?B?SlZWRVVpTmlhbjAycVlvaEJ3ZEdkNkxtaEwvK2tVbWUxbGxvVXV3R0tBejBj?=
 =?utf-8?B?M0Z5S2xRQ0FoZ2t3eU43Y1NBNU5MbzRqUnNPL1RYQnlOOHhVN3VsRUdmdjI0?=
 =?utf-8?B?enVrNldmUzRLdFAvOEpobnkxM05pVWcvaDNjOWlZTm1tNk03czQzZjhhZ2dL?=
 =?utf-8?B?b2xlT2tZNnVGeFpqYkwxdUZ6ZW5jTlVBdUp3QlEyTEpCT050bksreU51N0Ur?=
 =?utf-8?B?M2ozV1hudnBnem0yZlBka0NZSGN2Wi9tMGhPd0pOY1NXUjJQVWRTeG02c3gy?=
 =?utf-8?B?Y2VWVWZTN21SK20xTlVLZXliSkVHMDJ0ekJCMW91WHd3WGdPcUdMdHNuZGlm?=
 =?utf-8?B?YkROdFNJbW0rdW90c0ZCekZhSTZpaEtETWxKUUVyOGk3aWI3T1lxOXp3aVRI?=
 =?utf-8?B?elVKbDNyaDVyK1dPaVdVQWphQThOdXVqYllLcDNuRWcvb3hYZVNFYms1OC9I?=
 =?utf-8?B?MUJGbytEbnpDd3FkWTgyOVArZlZnREkvRHBDaW13M09HU2Q4Vi96bitMa0VW?=
 =?utf-8?B?WEx6aFRMR2oyVnA3cTVTTnlkVmI4ejV4YnlyYzlRbWdkallNdmZ2TVliT3lK?=
 =?utf-8?B?bm9jNitIb1pFNHpIQm9FOW1IdWpjM3IvalhQYng2MnUvN002QnlYNERMa1U1?=
 =?utf-8?B?UlJCaWc0T2ZabXhkR2tvRG5nRkl5NjRqSzExZFBEMkJON0J6d0lZWVJxY29x?=
 =?utf-8?B?eUlacU00bTdqb1Z2Yk5GeTFMZ3ZZQ3EzajIydUNNVmRET3V2L3o0RTdEMnRS?=
 =?utf-8?B?cTExS0V1MWpIOS9Hd2FMV2NVUGFmanFVS2sydnNQa3hyZFh3OHZBVm1ndmlt?=
 =?utf-8?B?UndFQzVCaUdjMGpUN0Z0YVlhbW5HOUhObk10dEJIbmRodXZORDEwS2VtMW9X?=
 =?utf-8?B?dW10ZXhsdmFnUk9jNjVGb056dzRDTXlzcHFtSTNxc1ZUVTYzRFpQT2FmVkFy?=
 =?utf-8?B?U3liNWE5S0ZmYWFzUUp4eWxMa2hNNkNiUTNyUjgzMGlMUCtmeUowY3p5YUdt?=
 =?utf-8?Q?0n9NCZ8hR/4TBrlfy0MEiNqbj?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <704985BDD812EA47ACDD3271386A3DDB@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB6626.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8ab3ba0-b23f-4c06-49ee-08dd262a2e25
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Dec 2024 03:54:36.0528
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A+3dq9Y9+Me8XWKj8ocXw0++wnrpqYfPNVzyIi5AzuKxz6QuJqa9gF27aClEr5rCZDztTyBACl6OmKW5sX7nmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7693

T24gV2VkLCAyMDI0LTEyLTI1IGF0IDE3OjAwICswODAwLCBiby5rb25nIHdyb3RlOg0KPiBGcm9t
OiBCbyBLb25nIDxCby5Lb25nQG1lZGlhdGVrLmNvbT4NCj4gDQo+IEFkZCBhIFY0TDIgc3ViLWRl
dmljZSBkcml2ZXIgZm9yIE1UODE4OCBBSUUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBCbyBLb25n
IDxCby5Lb25nQG1lZGlhdGVrLmNvbT4NCj4gLS0tDQoNCltzbmlwXQ0KDQo+ICsvLyBBSUUgMy4x
DQo+ICtlbnVtIGFpZV9tb2RlIHsNCj4gKwlGRE1PREUgPSAwLA0KPiArCUFUVFJJQlVURU1PREUg
PSAxLA0KPiArCUZMRE1PREUgPSAyDQo+ICt9Ow0KPiArDQoNCkJlY2F1c2UgdGhpcyBwYXRjaCBp
cyBhIGxpdHRsZSBiaWcsDQpJIHN1Z2dlc3QgdG8gYnJlYWsgdGhpcyBwYXRjaCBpbnRvIHNtYWxs
IHBhdGNoZXMuDQpJIHRoaW5rIHRoZXNlIHRocmVlIG1vZGUgY291bGQgd29yayBpbmRlcGVuZGVu
dGx5Lg0KSWYgc28sIEkgc3VnZ2VzdCBicmVhayB0aGlzIHBhdGNoIGludG8gdGhyZWUgcGF0Y2hl
czoNCg0KMS4gQWRkIE1UODE4OCBBSUUgZHJpdmVyIChzdXBwb3J0IGZkIG1vZGUgb25seSkNCjIu
IEFkZCBzdXBwb3J0IGF0dHJpYnV0ZSBtb2RlLg0KMy4gQWRkIHN1cHBvcnQgZmxkIG1vZGUuDQoN
ClJlZ2FyZHMsDQpDSw0K

