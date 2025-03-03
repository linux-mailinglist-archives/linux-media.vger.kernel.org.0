Return-Path: <linux-media+bounces-27312-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C7AA4B62C
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 03:38:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C71D188C325
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 02:38:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B4FF18A6A7;
	Mon,  3 Mar 2025 02:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="g0g7398v";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="AB3KRVht"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738FC35947;
	Mon,  3 Mar 2025 02:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740969479; cv=fail; b=J8OJNX+FqVwoORelF56QRH27gG/cNLYoPyEWC3ye1dRur2+Rwnf6y5jopRW7INxml0ZU/JDgkICOD+KQpwHI5Gi8SNGduYeRMlY4m4rD4L+Yc1fo9IVMJp3rsme8FLOjVD9Gq2+jYAx5DrmM5uOn9pUYjoipkMzHliCc6Le5xuU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740969479; c=relaxed/simple;
	bh=g4T/fhT7SErAMXIFxGp3k3yxGYoliyMAqbP8t4NtuP4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DSc076IAdc9+JU6hm5ihJ40dhhkqyWuQLEiKuUF8ertrFgOFqi5d9qATW0H/fFAR1Y4nbYmJfT2XWySVf3yhoFCGRS5KBbWW2RTcFdDMXs6dmUhXTJJVx/bAw0GaL/vbcxme7SNriJ0BYL5MovlIElaMkj2eooUGWsR5AoxjUQI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=g0g7398v; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=AB3KRVht; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 8054691ef7d811efaae1fd9735fae912-20250303
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=g4T/fhT7SErAMXIFxGp3k3yxGYoliyMAqbP8t4NtuP4=;
	b=g0g7398vZYcNcUgIo02hFWB/fU2YSpNpFYYjTxSUd+U0ke9Cx8uRooKd/vjw645Dv/vfmGywf/ZzNiKOKNL0lLS91Ci5pmYFDKa0v7eh5cXuqlVTmnnegcMtbHHipIHw3DXuahF9deulmD9Pr5/GPWWlXMYDeuyRqd6ILTwY5Ec=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:25a9ef33-ab36-4107-bdec-1254c3f2f97e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:caea6f29-e0f8-414e-b8c3-b75c08217be8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-UUID: 8054691ef7d811efaae1fd9735fae912-20250303
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 739432554; Mon, 03 Mar 2025 10:37:50 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 3 Mar 2025 10:37:50 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Mon, 3 Mar 2025 10:37:50 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tzbxlF3hh7D79INymiL7b6oarW/lPs2bk75aRZvZAb4Q+GJMtWzXGt0CinXILrHMzgKt8B/C40yG8jqslk6wInuwA4n2Iwf1c85d1QZdrUvcy/bcMoTFBttvMG+2p63Ta2BZ/CgOEW4hSC9M3naBQuXGgL/7aQRaeyLQiVIC69tQl43ychHUgqbQYq/LnJWPmDpkRVkEPjF02+pw5nk0lxgJHCmXi4iIVvQeanzXgpKvqieYl8J4DzssxODOY9ryBqJRetdvidD2W021MSZRshZ0BBNCr4QcJdMbocZuZDgXXpGVnimm6ACLpQ+C0FYGcYHZkA7rn3UbbSyicn64zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g4T/fhT7SErAMXIFxGp3k3yxGYoliyMAqbP8t4NtuP4=;
 b=FYUYSXPIcR0Aw5bqlgLuJs5i0cn8T+dN99ox5w2TM3AgdAfUXitvyNf6jV7A8Ib2oRmj5vtxRk/9Pb2DXcKQyS6FCqhCyGTspW7EaXk54thycszRCNHrSH5BnH2E0hNACtOuJYS2LLOvhxqcbtVSwF7H48xldHDguaUfPxg8HIwMcjJyIeO/LCmmEi1IqiRbnq8CbYGge2BtjAjDEmgQ/fdZ15lD+uCwpXcvUpQvyePm2OzmNV/Pi3Fu57LtW1JQLw1eAwXVzg4nnVke1QvAwcSGwTMmK2VfuvLqWaDOkALoACXrZv8O6iT8xiwFUyjyykIslqAXTt/kwYrU6l+o1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g4T/fhT7SErAMXIFxGp3k3yxGYoliyMAqbP8t4NtuP4=;
 b=AB3KRVhtEXxfW1QixCjDZuuW4JIkO+xANVbjyDaM5a2+9XcaR0rjSTSYjHr2siWrij02ABbI6kXAVhx6tdfv+YeNM+Fdu5BifQjtwWDDJSPRBqnzBTlM2O7aMparAYP35k7wlPrbn0tfGV1EeRV/JF4UWkOHDjNzgxCbjrPCoBc=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEZPR03MB8709.apcprd03.prod.outlook.com (2603:1096:101:231::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.25; Mon, 3 Mar
 2025 02:37:47 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 02:37:47 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"robh@kernel.org" <robh@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "mchehab@kernel.org"
	<mchehab@kernel.org>, =?utf-8?B?Qm8gS29uZyAo5a2U5rOiKQ==?=
	<Bo.Kong@mediatek.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
CC: =?utf-8?B?Wmhhb3l1YW4gQ2hlbiAo6ZmI5YWG6L+cKQ==?=
	<zhaoyuan.chen@mediatek.com>, =?utf-8?B?VGVkZHkgQ2hlbiAo6Zmz5Lm+5YWDKQ==?=
	<Teddy.Chen@mediatek.com>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: Re: [PATCH v4 3/4] uapi: linux: add MT8188 AIE
Thread-Topic: [PATCH v4 3/4] uapi: linux: add MT8188 AIE
Thread-Index: AQHbg2WhAIPkncgMkkaPZvA9xckFjrNgw7IA
Date: Mon, 3 Mar 2025 02:37:47 +0000
Message-ID: <059077301334d7b683df38cb62e96f74c7300b15.camel@mediatek.com>
References: <20250220070114.15015-1-bo.kong@mediatek.com>
	 <20250220070114.15015-4-bo.kong@mediatek.com>
In-Reply-To: <20250220070114.15015-4-bo.kong@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEZPR03MB8709:EE_
x-ms-office365-filtering-correlation-id: fd4f2965-cdc9-4e4f-0f86-08dd59fc6249
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018|921020;
x-microsoft-antispam-message-info: =?utf-8?B?YnN3NnArQ3NQN0V0V1pWc2N6RUk3RFFQV2FJbzk1ZWV3ajVsc3RnTkJwNkZi?=
 =?utf-8?B?bXFTMXArcUZyb0ZDeE5pK0tQNWF1MjRZbThJMnhXMlFUSnBKK3QvRkk4OVA2?=
 =?utf-8?B?eStuRzJ1Q2RRVjhhUHFzbUxHc1FSTjRZMUttSDIrWlA1QmdxV01kOEg1L1pt?=
 =?utf-8?B?NWNSQ09EYVg4UHJPcmVtRkZhSVVOTm5WN2NtNlkvcllYM3BoQ29PanNNZlI3?=
 =?utf-8?B?M2J4cXY2cVkwNldOajhwd3pBMUozK3JKQ3Z4am90KzB0cmdZT2xiT3lUSERT?=
 =?utf-8?B?RDhscEpFSVNFUUFMczFLSFFncFN5VzNkbGkwRERGMFhvU1RyL2ppRUs0dXlP?=
 =?utf-8?B?bU1jbUVqOVpwWUIwK2JIUUg0TXNvQ0VGSHlpVU1KR0VwdDFGRnY2eUpBejhk?=
 =?utf-8?B?aWhNeXdvYWg3MjRvZlBGMUx0RS9uSk92eXkyeFJ5U2I3QzRmSnZTRUVKNU16?=
 =?utf-8?B?LzJKSWQ4MUZUK2xsaUZUUG1sbkYzTk5IVU1NQkpmMnVoZXJPMTE5bnVaZjl3?=
 =?utf-8?B?bmpWelpnWVVPTkhTYzVKeU5mYkVMNFlpMWlERGh3R2s4MEYyMUJYSUgwRDNU?=
 =?utf-8?B?dXhrK0lMN0FBREVvckgwd3JIdDBrQjY1Q2Y5Nlk0WExpcTVLT096UEdSREty?=
 =?utf-8?B?Y3h1cWMycG5PN3I5ZHFBQU5MRlFFV0JWQjk1OVBTRk9hMmJET3FpMHFENE1K?=
 =?utf-8?B?V1h3WFI1QXRQT0p2NG5YVHZPdXMrMm4yUjhBWGhsMU1NWUlYNWFWbnY0R3By?=
 =?utf-8?B?dk01c014RjgxcEkwcW93TXhpZXA4dm9xYUxVa3ROZGxTMzROTmpxR3hTVm42?=
 =?utf-8?B?SzNNZkZZWkxieHVzVythS1ZhQ1RlNnNtdHZaeU1qeHpld3Zia2crdnVJQi9F?=
 =?utf-8?B?Z3pvYThVaGREWlRvQU9aSlpKbFBtY01FNTFCZnlIOWtnR1lPT1dtZ1puSU5Y?=
 =?utf-8?B?THBwQ281ZGJFcVdCRlVXdDRsREVjVEkvOUxtNkNuK1NOMVJ0OHluTW5RdXFM?=
 =?utf-8?B?SG1VejhPOUFXM2FrTGpRODA4ajRlN0lsTWFxOHZmUE1ubzZGOVV5K0xieWRx?=
 =?utf-8?B?Q0REWFQzbnFXU292bDJQUzlJU0d4SDZ5ZklXMXVEYUU5NWI1dHNLNGR4b1RS?=
 =?utf-8?B?R3lLY0pLc3pSMGlhL01YMnBBbVk5L2pHa3BOTVJhdWZsbEJrNU50VEZHeGpI?=
 =?utf-8?B?NWVxV21VZ1RLN0EvZjFUb3F4YmxSbTYralVUc0U0RWVKVmo2MGh6MmlJbTNK?=
 =?utf-8?B?T3M0WnRQa2k5Y0RaMXorQ2l6NWtHLzBrVytxbENad1FrdFVIeTQxMVA0NE44?=
 =?utf-8?B?RVpVOU9PamREcHRSOVFTN2tHbENNYzZ1V2FFL2ExNmh5b1FGK0NDeTJtY3E3?=
 =?utf-8?B?Z0t3MGYxZzJqajl6ZUNlM1NKczhOZXptdkFwZ0NJOEt2NEdxTC82TDhUSUll?=
 =?utf-8?B?UGRpOHhXSDNVMlVQR0FWOEpZQ3lvYXZRU2RaaDU5dWdNbnJmYlRpMGVSOE95?=
 =?utf-8?B?QWpnNmhGQlN2K1liVDBpRnJmVlZNT2FlcDVQOC91T21WTi9UWE1mb1pGT2cx?=
 =?utf-8?B?cDNVc0ZTZFh4MUxLV056b2daWm92UFhFeEdlRkNNOXdSRkNzZVM0a1dDTkU2?=
 =?utf-8?B?d1RCdnl2TndxN1BKOXRkMXI0akhOUWIyT3haQUZmL0xKSzRNMERPbllJdmJS?=
 =?utf-8?B?QXZmQmdUNXdnTVphdVg5THBRN1luV0pWMXVDNXNtU2dHMUFZbng2amw0YWIw?=
 =?utf-8?B?cVRpRDFndng5RjF0aEpWRHUwTDNZbytCWDRvOTF4NXhNMmtpNnloVTh0QlI2?=
 =?utf-8?B?NTY4a1o3RVpiNC9LSFlYMS85dmZ3MnFUZHp6cWljdzV6OXR5ZFdFZjlOSG5n?=
 =?utf-8?B?aE9UNnp2eFRzd3F4a29VSG1ldTBGWlBOcWZnQ29jN2dWNEQzNW4zRDRUMHJC?=
 =?utf-8?B?TXcrTXRHNVRWczJwOEp4ZXZzMGI4UVRMRHhxMm5rRXNNNVRZYVRoRUxYaUJJ?=
 =?utf-8?B?T1RKbjR5WXpnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dHREanQrYlZhMkRCbDlkSXV5MllMZktLZWo3OU5lWGMrUjZZK0szQnVxNlE1?=
 =?utf-8?B?SDd2VWdrVkZDZVdWM2tzQ0xRbjFyeFhsSmtIMVV2bEJHZENaN0N1dEhUdHFG?=
 =?utf-8?B?R2pVZ2lJMXI4dERHblEwenFRUDdHa3p3QUFPVUp4Uk5lQmpycXZYaDloaE5R?=
 =?utf-8?B?cUhHUCtpdjliZFdFek9KMitORWpxMWJKYVljc2FtM1JPTFJOMjJ2RTBxVWtv?=
 =?utf-8?B?VDR6VTcweG9uUzFoRnY1NHpZMks2MWV1SFlVdnl0U2c2ZytUMVJNUUVFaVJt?=
 =?utf-8?B?T0p5MVhDUGx6Z1J1b3BuZ0Npano1RFVPOHhYci9iMEt2NmhJdzhyTE5LYnNV?=
 =?utf-8?B?bzA2K3dDeER2bVVQK1k3bllnYXVPRFprZ2trc2hGRW8rODYvYm5lTCtYbnhB?=
 =?utf-8?B?KzhyRkUxbzFSM1VUR1lGMmFRY0U2VDBGbTB1anFCcWR0YzJvcy9ES0R5MTNi?=
 =?utf-8?B?OC9IR1NpRVE5RjdGZFMwZHphQVczYmppNkU5bVoyc3RlT3RjK29PS3N2Y1Zr?=
 =?utf-8?B?c0JkNEx1b2kzQUtibzNtSUpaTDdEQlBrK3ZONEdOOUI4VVJReU1pMEhKaW91?=
 =?utf-8?B?VE5xam5WeWxPMGxpR1NyeEFoeGtWTXZUYlVDUFJJbWs0VkNBZDdnaExncFNm?=
 =?utf-8?B?RTJQbk9mM3ZKc1RGSWMvWFFSNjFyY09TbFBxZ3laT3k3SnFtZ0Z6c09QY3d6?=
 =?utf-8?B?ZEF1ckpRKytGTDVPdVBoU2xwU0xrMU1VLzNuR3h6bFpjdExEdWMxMDlrTUIz?=
 =?utf-8?B?d1pmUUIzYmN5aDhIS3JlSTFxNzZQbSszU1BTTUxNT3hrbXBINW5ZZWFFSkY5?=
 =?utf-8?B?S09pZFB6QkIwcW9SbHoxaVlMem56NjhmUzdiYzBDaG1Gb3o3MnNDMVhFYkxP?=
 =?utf-8?B?Ynk3cTdsNDErQWNwV2hOSmFZWXZjWEdVaW9LcXRvZ25QMGtEY0dFRnN4K2J6?=
 =?utf-8?B?cFZLTmx2cTRKdkFSRFIwUTF0czVuaW1wdURpMit6ZCs0MUFyZEhYU1ZlNnQ2?=
 =?utf-8?B?Tkx6dXoySFdvay9rcmFOUWMwWlRRaStHNDBGK1VlOCtwcGpRLy8rSEJhU0x4?=
 =?utf-8?B?dlRnQTh5Ri82aTNhSWNERTBYWHVzcnYxUlFKc1JsM1JDc1JMbDJiMWhoTDEz?=
 =?utf-8?B?NVlrQlpoREFYbGZKLzR3NGtLWTVaTXB3dzBYZlNVVTM1eVNRd0Q2aGJaK0s2?=
 =?utf-8?B?aC9GdEdXQTVIVUpCVm55WDQvUDFYVVVmRVJVeTZCcHZkalZPaCtEUWJmdnF4?=
 =?utf-8?B?TW9XUFIrWkliTnhDWE9YTDhjNzY2eXVKYXQrZGMrVjl4OWFtOXJLZjNMWmtC?=
 =?utf-8?B?WDgwOGlNVS9EUjhvcGppdDJVd2tMdkFaOGcvV1M5elRicHJuOEtVMitSNjFO?=
 =?utf-8?B?dXlYYlNORUExZUlmUS9tckt0RmVTOGtmdk85M0xhRnpwc2xNdWpMZHdhbzRJ?=
 =?utf-8?B?b2licEF4S3Uzcm1kTUsxNUpQWUo4eWRqZEVNS2t2cEFHamx4U1F5S2FiVDZl?=
 =?utf-8?B?WFpNN0NNNitHNlhUQlk0dy80YWxvdkg1WmY2RklnTW1BWEUvem4vUHgrWDN5?=
 =?utf-8?B?ZFd2K0JkWmtTa09qSDNUTEFmSUdNNWZnMWcyT2NBeDRiOHp1OC8rNnY1bGFP?=
 =?utf-8?B?RkY0ZStkZEhoTlBjbDNqM1Bzck9SZ056Wm1KZGtuTENzZDNoREY5SFAxbTZ3?=
 =?utf-8?B?QTV4eUhMRzNvQU53SlBZNWx0YVZodWNYUHVMWlFJdEpSWkZCdTBGOThBOGdh?=
 =?utf-8?B?UG9CZEREdmJxRUQvNU90TktaRllDSnI2a3MvcGtEUXlQbDlGTkUxSDVDVU1T?=
 =?utf-8?B?aGVya3N1eHg1SzhxaEF6TTF5NGtuRTkweWtIeFc1OHJTZmt5MjF0b1J1SWNn?=
 =?utf-8?B?RG9Ta25TK2ZLbXlkOHliREM0cG9jVnBsY1d2OWJFYXNnelowcTdYTVVaQVNM?=
 =?utf-8?B?eUdndVk4U3BzMjZ4V3lQem9oQTZGL3Q3Y3pVclhxa1U3bW5zbGlVem8wVU0v?=
 =?utf-8?B?c1A5MnlPZjB6RDNydmkyVE9GL0lkU2dmOURYWFNpcGtGS2hiSWpmODdWVU42?=
 =?utf-8?B?ZWJtQXFWQWxYNTVjUWRYdEdYZzBmRUhtM3E1ZER0SzRRNG5vK1VzOFhMSWF4?=
 =?utf-8?Q?R66flZZmuXE4ZqJcsjazvXkH5?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BA541A89F7416941AB2E19D3E9BC1440@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd4f2965-cdc9-4e4f-0f86-08dd59fc6249
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2025 02:37:47.1943
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +Bdde2thW+/uQSqE6rfjrPhZYwEYgvAoyCzUq7ToU/dtBDCJtOBpbHdQW+vgJ/tuLKNUpjtv1Zmwx+k1ElKb+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8709

T24gVGh1LCAyMDI1LTAyLTIwIGF0IDE0OjU5ICswODAwLCBiby5rb25nIHdyb3RlOg0KPiBGcm9t
OiBCbyBLb25nIDxCby5Lb25nQG1lZGlhdGVrLmNvbT4NCj4gDQo+IEFkZCBBSUUgY29udHJvbCBy
ZWxhdGVkIGRlZmluaXRpb25zLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQm8gS29uZyA8Qm8uS29u
Z0BtZWRpYXRlay5jb20+DQo+IC0tLQ0KPiBDaGFuZ2VzIGluIHY0Og0KPiAxLiBBZGQgZG9jdW1l
bnQgdG8gZGVzY3JpYmUgdGhlIGRldGFpbCBvZiBWNEwyX01FVEFfRk1UX01URkRfUkVTVUxUDQo+
IDIuIEFkZCB0aGUgaW50cm9kdWN0aW9uIG9mIHJlbGF0ZWQgdmFyaWFibGVzDQo+IA0KPiBDaGFu
Z2VzIGluIHYzOg0KPiBOb25lDQo+IA0KPiBDaGFuZ2VzIGluIHYyOg0KPiAxLiBGaXggY29kaW5n
IHN0eWxlDQo+IC0tLQ0KPiAgZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdjRsMi1pb2N0bC5jICAg
ICAgIHwgICAzICsNCj4gIGluY2x1ZGUvdWFwaS9saW51eC9tdGtfYWllX3Y0bDJfY29udHJvbHMu
aCB8IDEzNCArKysrKysrKysrKysrKysrKysrKysNCj4gIGluY2x1ZGUvdWFwaS9saW51eC92aWRl
b2RldjIuaCAgICAgICAgICAgICB8ICAgNiArDQo+ICAzIGZpbGVzIGNoYW5nZWQsIDE0MyBpbnNl
cnRpb25zKCspDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS91YXBpL2xpbnV4L210a19h
aWVfdjRsMl9jb250cm9scy5oDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS92NGwy
LWNvcmUvdjRsMi1pb2N0bC5jIGIvZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdjRsMi1pb2N0bC5j
DQo+IGluZGV4IDAzMDRkYWE4NDcxZC4uNGZkZjY5M2RkZDFlIDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL21lZGlhL3Y0bDItY29yZS92NGwyLWlvY3RsLmMNCj4gKysrIGIvZHJpdmVycy9tZWRpYS92
NGwyLWNvcmUvdjRsMi1pb2N0bC5jDQo+IEBAIC0xNDc3LDYgKzE0NzcsOSBAQCBzdGF0aWMgdm9p
ZCB2NGxfZmlsbF9mbXRkZXNjKHN0cnVjdCB2NGwyX2ZtdGRlc2MgKmZtdCkNCj4gIAljYXNlIFY0
TDJfTUVUQV9GTVRfR0VORVJJQ19DU0kyXzE2OglkZXNjciA9ICI4LWJpdCBHZW5lcmljIE1ldGEs
IDE2YiBDU0ktMiI7IGJyZWFrOw0KPiAgCWNhc2UgVjRMMl9NRVRBX0ZNVF9HRU5FUklDX0NTSTJf
MjA6CWRlc2NyID0gIjgtYml0IEdlbmVyaWMgTWV0YSwgMjBiIENTSS0yIjsgYnJlYWs7DQo+ICAJ
Y2FzZSBWNEwyX01FVEFfRk1UX0dFTkVSSUNfQ1NJMl8yNDoJZGVzY3IgPSAiOC1iaXQgR2VuZXJp
YyBNZXRhLCAyNGIgQ1NJLTIiOyBicmVhazsNCj4gKwljYXNlIFY0TDJfTUVUQV9GTVRfTVRGRF9S
RVNVTFQ6DQo+ICsJCWRlc2NyID0gIk1USyBBSUUgUmVzdWx0IEZtdCI7DQo+ICsJYnJlYWs7DQo+
ICANCj4gIAlkZWZhdWx0Og0KPiAgCQkvKiBDb21wcmVzc2VkIGZvcm1hdHMgKi8NCj4gZGlmZiAt
LWdpdCBhL2luY2x1ZGUvdWFwaS9saW51eC9tdGtfYWllX3Y0bDJfY29udHJvbHMuaCBiL2luY2x1
ZGUvdWFwaS9saW51eC9tdGtfYWllX3Y0bDJfY29udHJvbHMuaA0KPiBuZXcgZmlsZSBtb2RlIDEw
MDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwMDAuLmQ4ZmQzMGY5Mjg4Yw0KPiAtLS0gL2Rldi9udWxs
DQo+ICsrKyBiL2luY2x1ZGUvdWFwaS9saW51eC9tdGtfYWllX3Y0bDJfY29udHJvbHMuaA0KPiBA
QCAtMCwwICsxLDEzNCBAQA0KPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAg
V0lUSCBMaW51eC1zeXNjYWxsLW5vdGUgKi8NCj4gKy8qDQo+ICsgKiBBSUUgQ29udHJvbHMgSGVh
ZGVyDQo+ICsgKg0KPiArICogQ29weXJpZ2h0IChjKSAyMDIwIE1lZGlhVGVrIEluYy4NCj4gKyAq
IEF1dGhvcjogRmlzaCBXdSA8ZmlzaC53dUBtZWRpYXRlay5jb20+DQo+ICsgKi8NCj4gKw0KPiAr
I2lmbmRlZiBfX01US19BSUVfVjRMMl9DT05UUk9MU19IX18NCj4gKyNkZWZpbmUgX19NVEtfQUlF
X1Y0TDJfQ09OVFJPTFNfSF9fDQo+ICsNCj4gKyNpbmNsdWRlIDxsaW51eC90eXBlcy5oPg0KPiAr
DQo+ICsvKg0KPiArICogVGhlIGJhc2UgZm9yIHRoZSBtZWRpYXRlayBGYWNlIERldGVjdGlvbiBk
cml2ZXIgY29udHJvbHMuDQo+ICsgKiBXZSByZXNlcnZlIDE2IGNvbnRyb2xzIGZvciB0aGlzIGRy
aXZlci4NCj4gKyAqIEVhY2ggQ0lEIHJlcHJlc2VudHMgZGlmZmVyZW50IHN0YWdlcyBvZiBBSUUs
IHdpdGggZGlmZmVyZW50IHN0cnVjdHVyZXMgYW5kIGZ1bmN0aW9ucw0KPiArICogYW5kIGNhbm5v
dCBiZSByZXVzZWQNCj4gKyAqLw0KPiArI2RlZmluZSBWNEwyX0NJRF9VU0VSX01US19GRF9CQVNF
IChWNEwyX0NJRF9VU0VSX0JBU0UgKyAweDFmZDApDQo+ICsNCj4gKyNkZWZpbmUgVjRMMl9DSURf
TVRLX0FJRV9JTklUIChWNEwyX0NJRF9VU0VSX01US19GRF9CQVNFICsgMSkNCj4gKyNkZWZpbmUg
VjRMMl9DSURfTVRLX0FJRV9QQVJBTSAoVjRMMl9DSURfVVNFUl9NVEtfRkRfQkFTRSArIDIpDQo+
ICsNCj4gKyNkZWZpbmUgVjRMMl9GTERfTUFYX0ZSQU1FIDE1DQo+ICsNCj4gKy8qKg0KPiArICog
c3RydWN0IHY0bDJfY3RybF9haWVfaW5pdCAtIGFpZSBpbml0IHBhcmFtZXRlcnMuDQo+ICsgKg0K
PiArICogQG1heF9pbWdfd2lkdGg6IG1heGltdW0gd2lkdGggb2YgdGhlIHNvdXJjZSBpbWFnZS4N
Cj4gKyAqIEBtYXhfaW1nX2hlaWdodDogbWF4aW11bSBoZWlnaHQgb2YgdGhlIHNvdXJjZSBpbWFn
ZS4NCj4gKyAqIEBweXJhbWlkX3dpZHRoOiBtYXhpbXVtIHdpZHRoIG9mIHRoZSBiYXNlIHB5cmFt
aWQuDQo+ICsgKiBAcHlyYW1pZF9oZWlnaHQ6IG1heGltdW0gaGVpZ2h0IG9mIHRoZSBiYXNlIHB5
cmFtaWQuDQo+ICsgKiBAZmVhdHVyZV90aHJlc2hvbGQ6IGZlYXR1cmUgdGhyZXNob2xkIGZvciBo
YXJld2FyZS4NCg0KSG93IHRvIGFzc2lnbiB0aGUgZmVhdHVyZV90aHJlc2hvbGQ/DQowIH4gMTAw
Pw0KV2hhdCdzIHRoZSBlZmZlY3QgZm9yIHNtYWxsIHZhbHVlIG9yIGxhcmdlIHZhbHVlPw0KDQo+
ICsgKi8NCj4gK3N0cnVjdCB2NGwyX2N0cmxfYWllX2luaXQgew0KPiArCV9fdTMyIG1heF9pbWdf
d2lkdGg7DQo+ICsJX191MzIgbWF4X2ltZ19oZWlnaHQ7DQo+ICsJX191MzIgcHlyYW1pZF93aWR0
aDsNCj4gKwlfX3UzMiBweXJhbWlkX2hlaWdodDsNCj4gKwlfX3MzMiBmZWF0dXJlX3RocmVzaG9s
ZDsNCj4gK307DQo+ICsNCj4gKy8qKg0KPiArICogc3RydWN0IHY0bDJfYWllX3JvaSAtIGFpZSBy
b2kgcGFyYW1ldGVycy4NCj4gKyAqDQo+ICsgKiBAeDE6IHgxIG9mIHRoZSByb2kgY29vcmRpbmF0
ZS4NCj4gKyAqIEB5MTogeTEgb2YgdGhlIHJvaSBjb29yZGluYXRlLg0KPiArICogQHgyOiB4MiBv
ZiB0aGUgcm9pIGNvb3JkaW5hdGUuDQo+ICsgKiBAeTI6IHkyIG9mIHRoZSByb2kgY29vcmRpbmF0
ZS4NCj4gKyAqLw0KPiArc3RydWN0IHY0bDJfYWllX3JvaSB7DQoNCnN0cnVjdCB2NGwyX3JlY3Qg
e307DQoNCj4gKwlfX3UzMiB4MTsNCj4gKwlfX3UzMiB5MTsNCj4gKwlfX3UzMiB4MjsNCj4gKwlf
X3UzMiB5MjsNCj4gK307DQo+ICsNCj4gKy8qKg0KPiArICogc3RydWN0IHY0bDJfYWllX3BhZGRp
bmcgLSBhaWUgcGFkZGluZyBwYXJhbWV0ZXJzLg0KPiArICoNCj4gKyAqIEBsZWZ0OiB0aGUgc2l6
ZSBvZiBwYWRkaW5nIGxlZnQuDQo+ICsgKiBAcmlnaHQ6IHRoZSBzaXplIG9mIHBhZGRpbmcgcmln
aHQuDQo+ICsgKiBAZG93bjogdGhlIHNpemUgb2YgcGFkZGluZyBiZWxvdy4NCj4gKyAqIEB1cDog
dGhlIHNpemUgb2YgcGFkZGluZyBhYm92ZS4NCj4gKyAqLw0KPiArc3RydWN0IHY0bDJfYWllX3Bh
ZGRpbmcgew0KDQpzdHJ1Y3QgdjRsMl9yZWN0IHt9Ow0KDQo+ICsJX191MzIgbGVmdDsNCj4gKwlf
X3UzMiByaWdodDsNCj4gKwlfX3UzMiBkb3duOw0KPiArCV9fdTMyIHVwOw0KPiArfTsNCj4gKw0K
PiArLyoqDQo+ICsgKiBzdHJ1Y3QgdjRsMl9mbGRfY3JvcF9yaXBfcm9wIC0gYWllIGZsZCBwYXJh
bWV0ZXJzLg0KPiArICoNCj4gKyAqIEBmbGRfaW5fY3JvcF94MTogeDEgb2YgdGhlIGNyb3AgY29v
cmRpbmF0ZS4NCj4gKyAqIEBmbGRfaW5fY3JvcF95MTogeTEgb2YgdGhlIGNyb3AgY29vcmRpbmF0
ZS4NCj4gKyAqIEBmbGRfaW5fY3JvcF94MjogeDIgb2YgdGhlIGNyb3AgY29vcmRpbmF0ZS4NCj4g
KyAqIEBmbGRfaW5fY3JvcF95MjogeTIgb2YgdGhlIGNyb3AgY29vcmRpbmF0ZS4NCj4gKyAqIEBm
bGRfaW5fcmlwOiBmbGQgaW4gcmlwLg0KPiArICogQGZsZF9pbl9yb3A6IGZsZCBpbiByb3AuDQo+
ICsgKi8NCj4gK3N0cnVjdCB2NGwyX2ZsZF9jcm9wX3JpcF9yb3Agew0KPiArCV9fdTMyIGZsZF9p
bl9jcm9wX3gxOw0KPiArCV9fdTMyIGZsZF9pbl9jcm9wX3kxOw0KPiArCV9fdTMyIGZsZF9pbl9j
cm9wX3gyOw0KPiArCV9fdTMyIGZsZF9pbl9jcm9wX3kyOw0KPiArCV9fdTMyIGZsZF9pbl9yaXA7
DQo+ICsJX191MzIgZmxkX2luX3JvcDsNCj4gK307DQo+ICsNCj4gKy8qKg0KPiArICogc3RydWN0
IHY0bDJfZmxkX2Nyb3BfcmlwX3JvcCAtIGFpZSBmbGQgcGFyYW1ldGVycy4NCj4gKyAqDQo+ICsg
KiBAZmRfbW9kZTogc2VsZWN0IGEgbW9kZShGRE1PREUsIEFUVFJJQlVURU1PREUsIEZMRE1PREUp
IGZvciBjdXJyZW50IGZkLg0KDQpUaGUgbW9kZSBuYW1lIGlzIG5vdCBjbGVhciBmb3IgdXNlciB0
byB1c2UgaXQuDQpBVFRSSUJVVEVNT0RFIHdvdWxkIG91dHB1dCBhdHRyaWJ1dGUgc3RyaW5nIGZv
ciBlYWNoIG9iamVjdD8NCldoYXQgdGhlIGF0dHJpYnV0ZSBjb3VsZCBiZT8NCldoYXQncyBGTERN
T0RFPyBGaWVsZCBtb2RlPyBXaGF0J3MgZmllbGQgbW9kZT8NCkRlc2NyaWJlIG1vcmUgYWJvdXQg
dGhlc2UgbW9kZSBzbyB0aGF0IHVzZXIgd291bGQgdW5kZXJzdGFuZCBzZWxlY3Qgd2hpY2ggbW9k
ZSB0byB1c2UuDQoNCj4gKyAqIEBzcmNfaW1nX2ZtdDogc291cmNlIGltYWdlIGZvcm1hdC4NCj4g
KyAqIEBzcmNfaW1nX3dpZHRoOiB0aGUgd2lkdGggb2YgdGhlIHNvdXJjZSBpbWFnZS4NCj4gKyAq
IEBzcmNfaW1nX2hlaWdodDogdGhlIGhlaWdodCBvZiB0aGUgc291cmNlIGltYWdlLg0KPiArICog
QHNyY19pbWdfc3RyaWRlOiB0aGUgc3RyaWRlIG9mIHRoZSBzb3VyY2UgaW1hZ2UuDQoNCkknbSBu
b3QgZmFtaWxpYXIgd2l0aCBWNEwyLCBidXQgSSB0aGluayB0aGVyZSBpcyBhIHN0YW5kYXJkIGlu
dGVyZmFjZSB0byBzZXQgc291cmNlIGJ1ZmZlciBmb3JtYXQsIHdpZHRoLCBoZWlnaHQsIHN0cmlk
ZS4NCg0KPiArICogQHB5cmFtaWRfYmFzZV93aWR0aDogcHlyYW1pZCBpcyB0aGUgc2l6ZSBvZiBy
ZXNpemVyLCB0aGUgd2lkdGggb2YgdGhlIGJhc2UgcHlyYW1pZC4NCj4gKyAqIEBweXJhbWlkX2Jh
c2VfaGVpZ2h0OiBweXJhbWlkIGlzIHRoZSBzaXplIG9mIHJlc2l6ZXIsIHRoZSB3aWR0aCBvZiB0
aGUgYmFzZSBweXJhbWlkLg0KPiArICogQG51bWJlcl9vZl9weXJhbWlkOiBudW1iZXIgb2YgcHly
YW1pZCwgbWluOiAxLCBtYXg6IDMuDQo+ICsgKiBAcm90YXRlX2RlZ3JlZTogdGhlIHJvdGF0ZSBk
ZWdyZWUgb2YgdGhlIGltYWdlLg0KPiArICogQGVuX3JvaTogZW5hYmxlIHJvaShyb2kgaXMgYSBi
b3ggZGlhZ3JhbSB0aGF0IHNlbGVjdHMgYSByZWN0YW5nbGUgaW4gYSBwaWN0dXJlKS4NCj4gKyAq
ICAgICAgICAgIHdoZW4gZW5fcm9pIGlzIGVuYWJsZSwgQUlFIHdpbGwgcmV0dXJuIGEgcmVjdGFu
Z2xlIGZhY2UgZGV0ZWN0aW9uIHJlc3VsdA0KPiArICogQHNyY19yb2k6IHJvaSBwYXJhbXMuDQo+
ICsgKiBAZW5fcGFkZGluZzogZW5hYmxlIHBhZGRpbmcuDQo+ICsgKiBAc3JjX3BhZGRpbmc6IHBh
ZGRpbmcgcGFyYW1zLg0KDQpJbiB3aGljaCBjYXNlIG5lZWQgcGFkZGluZz8NCkZvciBmYWNlIGRl
dGVjdGlvbiwgcGFkZGluZyB3b3VsZCBub3QgaGVscCBhbnkgdGhpbmcuDQoNCj4gKyAqIEBmcmVx
X2xldmVsOiBmcmVxdWVuY3kgbGV2ZWwsIEdldCB2YWx1ZSBmcm9tIHVzZXIgc3BhY2UuDQoNCldo
YXQncyBmcmVxX2xldmVsPw0KSG93IHRvIGFzc2lnbiBpdD8NCg0KPiArICogQGZsZF9mYWNlX251
bTogdGhlIG51bWJlciBvZiBmYWNlcyBpbiBmbGQuDQo+ICsgKiAgICAgICAgICAgICAgICB1c2Vy
IHNwYWNlIHRlbGxzIGRyaXZlciB0aGUgbnVtYmVyIG9mIGRldGVjdGlvbnMuDQo+ICsgKiBAZmxk
X2lucHV0OiBmbGQgaW5wdXQgcGFyYW1zLg0KPiArICovDQo+ICtzdHJ1Y3QgdjRsMl9jdHJsX2Fp
ZV9wYXJhbSB7DQo+ICsJX191MzIgZmRfbW9kZTsNCj4gKwlfX3UzMiBzcmNfaW1nX2ZtdDsNCj4g
KwlfX3UzMiBzcmNfaW1nX3dpZHRoOw0KPiArCV9fdTMyIHNyY19pbWdfaGVpZ2h0Ow0KPiArCV9f
dTMyIHNyY19pbWdfc3RyaWRlOw0KPiArCV9fdTMyIHB5cmFtaWRfYmFzZV93aWR0aDsNCj4gKwlf
X3UzMiBweXJhbWlkX2Jhc2VfaGVpZ2h0Ow0KPiArCV9fdTMyIG51bWJlcl9vZl9weXJhbWlkOw0K
PiArCV9fdTMyIHJvdGF0ZV9kZWdyZWU7DQo+ICsJX19zMzIgZW5fcm9pOw0KPiArCXN0cnVjdCB2
NGwyX2FpZV9yb2kgc3JjX3JvaTsNCj4gKwlfX3MzMiBlbl9wYWRkaW5nOw0KPiArCXN0cnVjdCB2
NGwyX2FpZV9wYWRkaW5nIHNyY19wYWRkaW5nOw0KPiArCV9fdTMyIGZyZXFfbGV2ZWw7DQo+ICsJ
X191MzIgZmxkX2ZhY2VfbnVtOw0KPiArCXN0cnVjdCB2NGwyX2ZsZF9jcm9wX3JpcF9yb3AgZmxk
X2lucHV0W1Y0TDJfRkxEX01BWF9GUkFNRV07DQo+ICt9Ow0KPiArDQo+ICsjZW5kaWYgLyogX19N
VEtfQUlFX1Y0TDJfQ09OVFJPTFNfSF9fICovDQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkv
bGludXgvdmlkZW9kZXYyLmggYi9pbmNsdWRlL3VhcGkvbGludXgvdmlkZW9kZXYyLmgNCj4gaW5k
ZXggZTdjNGRjZTM5MDA3Li44NDkyZjQ0ZWI1NWQgMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvdWFw
aS9saW51eC92aWRlb2RldjIuaA0KPiArKysgYi9pbmNsdWRlL3VhcGkvbGludXgvdmlkZW9kZXYy
LmgNCj4gQEAgLTg1OCw2ICs4NTgsOSBAQCBzdHJ1Y3QgdjRsMl9waXhfZm9ybWF0IHsNCj4gICNk
ZWZpbmUgVjRMMl9NRVRBX0ZNVF9SS19JU1AxX1NUQVRfM0EJdjRsMl9mb3VyY2MoJ1InLCAnSycs
ICcxJywgJ1MnKSAvKiBSb2NrY2hpcCBJU1AxIDNBIFN0YXRpc3RpY3MgKi8NCj4gICNkZWZpbmUg
VjRMMl9NRVRBX0ZNVF9SS19JU1AxX0VYVF9QQVJBTVMJdjRsMl9mb3VyY2MoJ1InLCAnSycsICcx
JywgJ0UnKSAvKiBSb2NrY2hpcCBJU1AxIDNhIEV4dGVuc2libGUgUGFyYW1ldGVycyAqLw0KPiAg
DQo+ICsvKiBWZW5kb3Itc3BlY2lmaWMgZGVmaW5pdGlvbjogdXNlZCBmb3IgdGhlIE1lZGlhVGVr
IGNhbWVyYSBzdWJzeXN0ZW0ncyBmYWNlIGRldGVjdGlvbiByZXN1bHRzICovDQo+ICsjZGVmaW5l
IFY0TDJfTUVUQV9GTVRfTVRGRF9SRVNVTFQJdjRsMl9mb3VyY2MoJ00nLCAnVCcsICdmJywgJ2Qn
KQ0KDQpBZGQgZG9jdW1lbnQgdG8gZGVzY3JpYmUgdGhlIGRldGFpbCBvZiBWNEwyX01FVEFfRk1U
X01URkRfUkVTVUxULiBbMV0gaXMgdGhlIGV4YW1wbGUgZG9jdW1lbnQgZm9yIFY0TDJfTUVUQV9G
TVRfUlBJX0ZFX0NGRy4NClRoZXJlIGFyZSBtYW55IGRvY3VtZW50IGluIERvY3VtZW50YXRpb24v
dXNlcnNwYWNlLWFwaS9tZWRpYS92NGwvIGZvciB5b3VyIHJlZmVyZW5jZS4NCg0KWzFdIGh0dHBz
Oi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1tZWRpYS9wYXRjaC8yMDI0MTAw
My1ycDEtY2ZlLXY2LTEtZDY3NjJlZGQ5OGE4QGlkZWFzb25ib2FyZC5jb20vDQoNClJlZ2FyZHMs
DQpDSw0KDQo+ICsNCj4gIC8qIFZlbmRvciBzcGVjaWZpYyAtIHVzZWQgZm9yIFJhc3BiZXJyeVBp
IFBpU1AgKi8NCj4gICNkZWZpbmUgVjRMMl9NRVRBX0ZNVF9SUElfQkVfQ0ZHCXY0bDJfZm91cmNj
KCdSJywgJ1AnLCAnQicsICdDJykgLyogUGlTUCBCRSBjb25maWd1cmF0aW9uICovDQo+ICAjZGVm
aW5lIFY0TDJfTUVUQV9GTVRfUlBJX0ZFX0NGRwl2NGwyX2ZvdXJjYygnUicsICdQJywgJ0YnLCAn
QycpIC8qIFBpU1AgRkUgY29uZmlndXJhdGlvbiAqLw0KPiBAQCAtMTk2MSw2ICsxOTY0LDkgQEAg
ZW51bSB2NGwyX2N0cmxfdHlwZSB7DQo+ICAJVjRMMl9DVFJMX1RZUEVfQVYxX1RJTEVfR1JPVVBf
RU5UUlkgPSAweDI4MSwNCj4gIAlWNEwyX0NUUkxfVFlQRV9BVjFfRlJBTUUJICAgID0gMHgyODIs
DQo+ICAJVjRMMl9DVFJMX1RZUEVfQVYxX0ZJTE1fR1JBSU4JICAgID0gMHgyODMsDQo+ICsNCj4g
KwlWNEwyX0NUUkxfVFlQRV9BSUVfSU5JVAkJPSAweDAyOTAsDQo+ICsJVjRMMl9DVFJMX1RZUEVf
QUlFX1BBUkFNCT0gMHgwMjkxLA0KPiAgfTsNCj4gIA0KPiAgLyogIFVzZWQgaW4gdGhlIFZJRElP
Q19RVUVSWUNUUkwgaW9jdGwgZm9yIHF1ZXJ5aW5nIGNvbnRyb2xzICovDQoNCg==

