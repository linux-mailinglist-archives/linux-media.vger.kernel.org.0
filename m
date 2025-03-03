Return-Path: <linux-media+bounces-27314-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E04A4B642
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 03:51:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5232E7A2A4A
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 02:50:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16C5F1A5BA9;
	Mon,  3 Mar 2025 02:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="TXGuNxk7";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="JOrB+Rqm"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785B52AD0C;
	Mon,  3 Mar 2025 02:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740970253; cv=fail; b=GdpqhnqoN62edXuu999yZRkidQAcYslypssfs7DF374QcUwJqIj10np306UdRcpxsBx6aOuuuXAlowwmgJrSpvHHV4x2fqHPWFLfxai3kK565oEAVcOQPDFnV4jvsDT/GvBpx8nduX0qlLTgiz9pdDcCx+d5vFHsSLcv1LRJQVw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740970253; c=relaxed/simple;
	bh=PGhHsqAioohCJk7XedDGbc3qt8mS/hlbqFjjPs/Ld3A=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Wsw9lBLAylRDPyZgXG4Us62J0XjtdBsNW2+xenfjvddsmBTTsQDdPOVS3DPNeI0zP8CI8dOejom5km4PXywmAOTUFBrOYaSQx3OPFuCZMnhcYXFgFiOLpyc0xaIcwVgQAJC0IjgN7M+UAYTR+HHOy0PA3h2isSqODd1cmcd2LkY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=TXGuNxk7; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=JOrB+Rqm; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 4d20c630f7da11efaae1fd9735fae912-20250303
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=PGhHsqAioohCJk7XedDGbc3qt8mS/hlbqFjjPs/Ld3A=;
	b=TXGuNxk7N3r6A3ZpJxNXeabDMtxUQoHDa/561uuLKT7sNwA5PgPYKHgEBl/KdumPJwJ9JR++2x5lVRIxFCGg8mnx400W10DAdY8vv5m8UvmzCSP8L+6MpKusIksD5B+UUX6HTarWoYeAT+EF70GidAKYADqG6vZhtAC1+g/zbB8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:935d213d-15ae-43a6-ae03-41d7bff82ede,IP:0,U
	RL:12,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:12
X-CID-META: VersionHash:60aa074,CLOUDID:b272c2b5-a2a1-4ef3-9ef9-e116773da0a7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:11|80|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 4d20c630f7da11efaae1fd9735fae912-20250303
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 995632864; Mon, 03 Mar 2025 10:50:44 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 3 Mar 2025 10:50:42 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Mon, 3 Mar 2025 10:50:42 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Avck9/XL6mUBHOmxVbm8etvYUaR7rICEscgrbHX9yBRpkJL+zH0WzLvElINMVW+6s0wzro6f3vE2hn0wgKqPbzkE1HwE5rq85rY/+eTDnWNGnpVfqOLmkNn6tfV/Phw0uQ3Zh9AnJJg63wlO3YEXpw3NDcyfZ+qLZudNGT7w3w4b44kLB2SM6j5OTQVpHwZzSNK2pjZxTGEjyMhYf5d58Ec4WIQ1+SKEEkGme6+f+my16D33YmXoS15jluG2rMa37iuepVd8ypJXfBt/HORBX/2geujV5YtWXq8R8MGxH42QuNWzn4l+IPM7wghRoSm/dLj8eWTyB/pEfshFFXA4Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PGhHsqAioohCJk7XedDGbc3qt8mS/hlbqFjjPs/Ld3A=;
 b=j6Y/YDxQKj0D4rspbLUxTjdmaWDzqS47SatEVtD6djWJ4Kq/FJiTLG7/KMTQdNMnl3V1fCLhlujVi4AoyCHruZDSNiufzdXA3ND+EVfQp8Fqhl0SpT5AtE4MZrKNbmiiEaQmU+c8mznAevjS+VCpq1/ktrXMPP9Ei7KWasOO0t5zal2D3izarvPmOrC+UjWbzAOh6TpOyHUxWIV6fnS1EVnA22lNsrrpxNrKSyM9+2n3rmLiM0hh1ZgSrA91Qmrtg1WbYEkV7vBGYaq8f94v948z7F6piew9LE+qUza6NpDT2ThnP2J7dNRsy86ehMAUtUWGujzE7sOJt0MhoeFEJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PGhHsqAioohCJk7XedDGbc3qt8mS/hlbqFjjPs/Ld3A=;
 b=JOrB+Rqmd3zCHuPxwYjViYjXbGstxg+Q3i6qG1DrfmmkSwVHdzQrRO9sXOLK1ND/LDxTRKJeBA+kqp8Eue14un360t1aPzDqQL7nnZsm/CxUKLZJ+FsNwHF36FvSmdJfozGM7APLtrKfMsOZprzgIbJYUvNPDOhC35PnIMwzMIY=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SG2PR03MB6707.apcprd03.prod.outlook.com (2603:1096:4:1d7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.27; Mon, 3 Mar
 2025 02:50:39 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 02:50:39 +0000
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
Subject: Re: [PATCH v4 1/4] media: dt-bindings: add MT8188 AIE
Thread-Topic: [PATCH v4 1/4] media: dt-bindings: add MT8188 AIE
Thread-Index: AQHbg2YTMwLMnnxr3kaTnAUlHn5nQrNgx0uA
Date: Mon, 3 Mar 2025 02:50:39 +0000
Message-ID: <0475076e9d3d63a17eee37dc7e21dd6e029f52df.camel@mediatek.com>
References: <20250220070114.15015-1-bo.kong@mediatek.com>
	 <20250220070114.15015-2-bo.kong@mediatek.com>
In-Reply-To: <20250220070114.15015-2-bo.kong@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SG2PR03MB6707:EE_
x-ms-office365-filtering-correlation-id: acc0d65e-ab03-4137-e6be-08dd59fe2e98
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018|921020;
x-microsoft-antispam-message-info: =?utf-8?B?K2svNGNyTjBWMGdqZjRDM3RCZmp1cEczbTFPcHNFdWxDRWgyMms1MUQxdk9J?=
 =?utf-8?B?cmNXaHVzY2RHUk9meTg1UW95QmFodmNZYUtuRHU3Q3BaZXJTVlFQMXgrL0U2?=
 =?utf-8?B?TEdSd3p0amV5ampQd0g2RTh2TzRSSzNRb3Zvek4rbm5lMGtxbStRWEFMWHhj?=
 =?utf-8?B?OUsyWldKOG1pUk9XUy94a21ldlFGQm1RR1Yvd2hrSDhsMkRJU1hOd3lDU1lW?=
 =?utf-8?B?Ykg5OW16d3AvU2xHcFVEcHQza091YlY5TjFDK0tEc2pCSEw0bkFSaDE5YW5o?=
 =?utf-8?B?c2JaQXpORXd6WCthMHlRNlVLZHAvWDdmQU4yWUpoSXRhSjE2WlpULy9lZHdx?=
 =?utf-8?B?Mjk5cVhkeCtQTTk1dVVKN3BTS3hOYVJvTUhxdXAxTHdrdmhBSHB1ZURQTEoy?=
 =?utf-8?B?bzY3aldHMlFlNDZ5OG45R2pVQitBeEcybkppUGpidGZLcjlFL2VWWkFtOXlE?=
 =?utf-8?B?KzdxMGZPM3V0dzM3R0VZakk5ekw5elI2VXgzNm84YmdEQ3N5Rjd5bUJOYURK?=
 =?utf-8?B?TERVTWYrZC9xUjZHNEp2MnZqOEhnSXV6OHgwNzFjc3lqYjRncFJTYnFxVy9s?=
 =?utf-8?B?QjZuWVBFN2ZKbk9FS0N1N1dndkdsS3NwOElNMWNxSTlaeWhzY0gva1lFOUlP?=
 =?utf-8?B?S05yazRBVUlYRGp4NUFUeGk2dE92dTZXWWw1b2pVbEVVNE0xU3hVa3N0a0lt?=
 =?utf-8?B?S0dnSlRKVWU5bktMS0hRUFNYV24vT1JtOGE4S2Y2L1dUcjl0L1dYZmhhV05V?=
 =?utf-8?B?S0phV05udDFjcXVnNUVPL1FWZjFkWENlSk1KUkJUL1pIZ2NsemZzaFBIMGll?=
 =?utf-8?B?WElwMCtGN2NRYit4MUdjOG9zYVNsR2tjaWc4RHdJV04ySGk1NDdDWWhZN2w1?=
 =?utf-8?B?RkFsVWxJdW1uZlp0aWNabEJqU3ZmUDd5NHdvb0s2cHBFeXlzYlltZ000Mkgx?=
 =?utf-8?B?cTJyQmRQZ0ZtU2g0WjhjWVZ5ZjJTTWtzNm12VEN3ZENxNTk5d0x0dmsyL2lx?=
 =?utf-8?B?VnVQR3l0VU1KaGVaN0s3b1VwSXhmSStLY1hUTTZsYkk1dy9WMDhmWWRhUity?=
 =?utf-8?B?UXkyOHhQdVFqOXRNaUxzUWFXU29LZHJCUjRaaEJvMUxodkFtM05Bc05hRW5n?=
 =?utf-8?B?cWlybGhsSnAwNUpjMENpOUhRSXJ4WmRuMHZJZzJpNjhuRkxHNmJWSExOWFBZ?=
 =?utf-8?B?ZFZJNGxxK0s0czdGT3lrQmovNHcvd2x0bVliQUpoS09RZlU5R0hTdktJdm1r?=
 =?utf-8?B?YVlJZlRieG5LS0JnWlhkbDVUbXEzbzZBanVkbHFiVEk3RkFMTVo3cmVtdlFI?=
 =?utf-8?B?dVl5Qk1kZFBmUlVLV1B1SWFwZW13WnFSK2FqcjZhb2J2aDFVSEVxZHZYM1Vx?=
 =?utf-8?B?Q044OTNicEl1SWtZeVRDbi9YeUVDcThOcUsxNEpnS3ZqY05WeXJ2Y0ZvejJI?=
 =?utf-8?B?RkZnUUdUU3VwR25hZnAvMzV2MkM0bitPTkJuUnJkZS9SM3dLbjJLUDNQaCtS?=
 =?utf-8?B?M3dRcTdvTVNJY09uV21yVXp4bGFkQmV0ZkJSV2VUKzRHYjBmV2crd2tpb1RP?=
 =?utf-8?B?dGFtSERlWjA1Njd4NS9vV1pzZUFXZk04c2lxaXc4M0JLMWRTZ2RDOVhHdGZE?=
 =?utf-8?B?TjNLd2N6Y25xa2NZS2lIdHV5YXVNLzVKQnNwYzkrekYwVXVoTExZNEljVThI?=
 =?utf-8?B?aFNUWWpSZy91NVRRN3FXbXRWVG1TY3ljQkZ0L2dHS0ZiM0JXOERNc1FPVzVZ?=
 =?utf-8?B?NTdvNXlPc2VBbXJyVENVazQzZ2c5NFJKMWZCaXI2MkxFTjhodmo5K2tYa291?=
 =?utf-8?B?bVRGVnpWNEhKS1FhWnZ1enlOT2w1SzNLcW9BUUpkdW1QMklDTXpCMWMySFBv?=
 =?utf-8?B?R0RVeFN1UWxFWm56d0czYTRKZEs4SDFxY1ZMSDJtdFZwMjEybFFrc3dFWUdC?=
 =?utf-8?Q?e45XF1mnWzk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TnprRU5vTjhuOWk4QlJYSEhXZ2FxejVWWU5ldmd2bW5UYTNhNWE4aEMwOFVy?=
 =?utf-8?B?SkVXUFljYlFkOXBZN0hEcDlFS2t5ZVZuMkV0RVgwL0MySFRlcDZjd3BLQ0h2?=
 =?utf-8?B?NkJ1d2hCTUlmQ2UwOExTK2p4Z3IzSnZudVIrL0RjSGZiZ3hmckxaOGRtN1ln?=
 =?utf-8?B?dEdhUHg0TGdTZDE0SVloKzc2V3BjaE4zelJKS3Q0NDc3OEV5azVCa1FKVjkz?=
 =?utf-8?B?WTR6V1dDd21MMGdWRksrRTZGZE9XbEdXcDBtVzNrdnR0RVZDRnkrdGFjUyt2?=
 =?utf-8?B?SmRGcVhkdnJJbDk3bjZ4UWdyd0dzb0ZaaENDRUhTeWFvWVhoMGF1QkV4ZkZE?=
 =?utf-8?B?SkpQY2M1SWRHR1lRekJNd3RoK0Z2V09vZkt4S090SDZNL0FiSGRaaTJiZ0w2?=
 =?utf-8?B?UTVMd0o1MXVZYXY0eHJ2dTdzdFR1K1R4RUZXVk4zdWt2K2owa05wVkFEbm1k?=
 =?utf-8?B?UDZ2QzJ5L3dGb0xKNE50cEhiVzIyUDRlUml0Mkk5TmxNVnFjM0h5MFhwL3B6?=
 =?utf-8?B?K3hMWEJJUU0wTkxrU3BoeE1XZFczbUVwdVpHUzNjWDBRdmdSRllqVGFndFpB?=
 =?utf-8?B?UGR0azJSclViK05ZbjBBc3hkaWpxL2VpWnJCbmdwS3l2VDA0aUQ4ekhWZ2Q0?=
 =?utf-8?B?ZFRkSzBDelpQT2NDaW9odHRMeUJFQ2Z1WnN4aFdDdEZFUWgzM1hLakZoVC81?=
 =?utf-8?B?VVFIdjZNTTJ2YXRlcmFaZkNXSmlZb3VNSUY5NEt5UWpVVzNGOGhHclNVelNL?=
 =?utf-8?B?SnVKTEl2eThnTTBqVGFNRG83M1N1R002cDhLUC84ejFwaE4wSWFESFlLKzEx?=
 =?utf-8?B?VW8rajIzSU10NW5oR2syRHRoZGltOUlmaTNPZUh1Y3RBL2VKZytsalJia1VJ?=
 =?utf-8?B?YjFZaDNjbE9kM0x4ZmM5VHc0Mnd2UUtUNWx4YUpWMlp0MVVoTWZaK3BzcG4z?=
 =?utf-8?B?dTJjTWwrbEt3QkRWNWdNYVNHamI4R01xR2x1SU1mSDBRcE44eXVpTG51UVIz?=
 =?utf-8?B?eUNZRFc0cnZrWnYxcXJ1ZjlQbmRjc2ZXODlzdi9XOU10TFdHc09qY0wwczgy?=
 =?utf-8?B?MGtzT1ByNWdOdUZNWXhLcCtkNGFJQ2lsNlpWQ2ozQTVVM1EvTHQrcVdBMThQ?=
 =?utf-8?B?ZXBXbTBiZ2Jod2svKytnYVNjOVdCZFU0d1VkdGhoRlZpL25oRG9jc3FUWHRi?=
 =?utf-8?B?NTcydndzWnYydkJEcnhXbGxNNzR2UHFUUzB3ZDgwVlV3Vm1HNHpQalpza1Yv?=
 =?utf-8?B?bWU3aFNCYVNRYS9yMVpsK29vWUxFL3l0UWpadnRJRVV3N1oxUXZUK0xvOTBy?=
 =?utf-8?B?eFRQQ3RVbklUZEl3MlVKRGVzQk5yNEVLTzFPbkRsMGI5enI1Q2ZlQVZlSXR1?=
 =?utf-8?B?MGN5Zmo1Y0ZUZXMycmo2RTJadi80ajFzY1pubDhkd1hKdDhWTHhXWDA0Zlpj?=
 =?utf-8?B?TE5QZlYxWE1iUXA5WDNzcFdnNEFYeHNpYytTV0drb2lkazl2azgwK04vWU9m?=
 =?utf-8?B?OUxXSzVTaVdVR0hNdElsY05qdTY0VDM0SWZNaUlpSCt6OExEcXRBUDhINzVv?=
 =?utf-8?B?a3p6ZXBROGpGZ3ZpRjlaUzFUMEpDcGkrNlVGVkMrNlpoNi83RlpaTFB5TnRM?=
 =?utf-8?B?T0ZHYnNGc05qSThyVUtyb0Rpc1NnVnVxd0EwRTlpcTlvL01KSXJERVdLMHJ4?=
 =?utf-8?B?MCt5ZUtlSUFRUkYvRmU1VFVjQW51L3ExYWx2NzNxZ0ZtblAxLzlCa1V3WGIw?=
 =?utf-8?B?WURFOW9pM1kvUEtQckFUVEtKMXFYMlBUMU5RZVZpa2F3MUw3cFFQSDMwV25n?=
 =?utf-8?B?dDdHaitGaVJjUmEyT01WZzkzVG9UanAzdmZNMXdDQlVzaVFXcHJQYmt1R0c0?=
 =?utf-8?B?SHNMeU9QVG5XVk5YTENSZjVvbEducmxWSVFpdlBiVDBZNEFjVFl6ZG1PYmlT?=
 =?utf-8?B?OXFmZURWdXZWdm03M3BwSjZnTUpQQ3VrSnp0SXFVSWRWeHZ2Y1VPS0lvd0xI?=
 =?utf-8?B?Um5RQ0VEbmVPUXlVYjRnaG1Jc2JXMTl6TVZ2RHRVQ3FzaiszcDZqaW9jQ3RV?=
 =?utf-8?B?R1lRTDlpVUlRY2JzRG1Dd2lRNDJNL3E4TUhza3lhcnhQRFYzdkJNTU5RM0lI?=
 =?utf-8?Q?7TC1/xup+rvaQ4b0Wc9JiSaGx?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <12C7BA7408E95B42B49F0811AA709F02@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acc0d65e-ab03-4137-e6be-08dd59fe2e98
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2025 02:50:39.4410
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ssmdrQeIYwOfLGUQ2qWy5ljpRogbMb75s7jR11aLVd6UqFd2HhrO3Ond/1QAMxIutA6VPiWiC9uCt7WiIjAmkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB6707

T24gVGh1LCAyMDI1LTAyLTIwIGF0IDE0OjU5ICswODAwLCBiby5rb25nIHdyb3RlOg0KPiBGcm9t
OiBCbyBLb25nIDxCby5Lb25nQG1lZGlhdGVrLmNvbT4NCj4gDQo+IEFkZCBZQU1MIGRldmljZSB0
cmVlIGJpbmRpbmdzIGZvciBNVDgxODggQUlFLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQm8gS29u
ZyA8Qm8uS29uZ0BtZWRpYXRlay5jb20+DQo+IC0tLQ0KPiBDaGFuZ2VzIGluIHY0Og0KPiAxLiBS
ZW1vdmUgYWRkcmVzcy1jZWxscyBhbmQgc2l6ZS1jZWxscw0KPiAyLiBSZW1vdmUgbGFyYjEyIHJl
bGF0ZWQgY29udGVudA0KPiAzLiBVcGRhdGUgaWQgY29udGVudA0KPiANCj4gQ2hhbmdlcyBpbiB2
MzoNCj4gTm9uZQ0KPiANCj4gQ2hhbmdlcyBpbiB2MjoNCj4gMS4gRml4IGNvZGluZyBzdHlsZQ0K
PiAtLS0NCj4gIC4uLi9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlayxtdDgxODgtYWllLnlhbWwgICB8
IDkwICsrKysrKysrKysrKysrKysrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCA5MCBpbnNlcnRpb25z
KCspDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL21lZGlhL21lZGlhdGVrLG10ODE4OC1haWUueWFtbA0KPiANCj4gZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlayxtdDgxODgtYWll
LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWss
bXQ4MTg4LWFpZS55YW1sDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAw
MDAwMC4uMjMyYjVhZmMyYWQzDQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLG10ODE4OC1haWUueWFtbA0KPiBA
QCAtMCwwICsxLDkwIEBADQo+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1v
bmx5IE9SIEJTRC0yLUNsYXVzZSkNCj4gKyVZQU1MIDEuMg0KPiArLS0tDQo+ICskaWQ6IGh0dHBz
Oi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9tZWRp
YS9tZWRpYXRlayxtdDgxODgtYWllLnlhbWwqX187SXchIUNUUk5LQTl3TWcwQVJidyFoX3JHRmtK
TXMxWlpia2NGNkxRS2V2UUFLbnBXMElxTklTTUNxNHNPU1RjSTdwSkxUbEVKa3pyVmQxeDFneHE2
NFNuY21fMDgzX0ZlWXVzYiQgDQo+ICskc2NoZW1hOiBodHRwczovL3VybGRlZmVuc2UuY29tL3Yz
L19faHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwqX187SXchIUNU
Uk5LQTl3TWcwQVJidyFoX3JHRmtKTXMxWlpia2NGNkxRS2V2UUFLbnBXMElxTklTTUNxNHNPU1Rj
STdwSkxUbEVKa3pyVmQxeDFneHE2NFNuY21fMDgzLXM1bG1vcSQgDQo+ICsNCj4gK3RpdGxlOiBU
aGUgQUkgRW5naW5lIFVuaXQgb2YgTWVkaWFUZWsgQ2FtZXJhIFN5c3RlbQ0KPiArDQo+ICttYWlu
dGFpbmVyczoNCj4gKyAgLSBCbyBLb25nIDxiby5rb25nQG1lZGlhdGVrLmNvbT4NCj4gKw0KPiAr
ZGVzY3JpcHRpb246DQo+ICsgIEFJRShBSSBFbmdpbmUpIGlzIG9uZSBvZiB0aGUgdW5pdHMgaW4g
bXQ4MTg4IElTUCB3aGljaA0KPiArICBwcm92aWRlcyBoYXJkd2FyZSBhY2NlbGVyYXRlZCBmYWNl
IGRldGVjdGlvbiBmdW5jdGlvbiwNCj4gKyAgaXQgY2FuIGRldGVjdCBkaWZmZXJlbnQgc2l6ZXMg
b2YgZmFjZXMgaW4gYSByYXcgaW1hZ2UuDQo+ICsNCj4gK3Byb3BlcnRpZXM6DQo+ICsgIGNvbXBh
dGlibGU6DQo+ICsgICAgaXRlbXM6DQo+ICsgICAgICAtIGNvbnN0OiBtZWRpYXRlayxtdDgxODgt
YWllDQo+ICsNCj4gKyAgcmVnOg0KPiArICAgIG1heEl0ZW1zOiAxDQo+ICsgICAgZGVzY3JpcHRp
b246IFBoeXNpY2FsIGJhc2UgYWRkcmVzcyBhbmQgbGVuZ3RoIG9mIHRoZSByZWdpc3RlciBzcGFj
ZS4NCj4gKw0KPiArICBpbnRlcnJ1cHRzOg0KPiArICAgIG1heEl0ZW1zOiAxDQo+ICsNCj4gKyAg
bWVkaWF0ZWssbGFyYjoNCj4gKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0
aW9ucy9waGFuZGxlDQo+ICsgICAgZGVzY3JpcHRpb246DQo+ICsgICAgICBNdXN0IGNvbnRhaW4g
dGhlIGxvY2FsIGFyYml0ZXJzIGluIHRoZSBjdXJyZW50IFNvQ3MsIHNlZQ0KPiArICAgICAgRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycy9tZWRpYXRl
ayxzbWktbGFyYi55YW1sDQo+ICsgICAgICBmb3IgZGV0YWlscy4NCg0KWW91IGFscmVhZHkgcmVt
b3ZlIG1lZGlhdGVrLGxhcmIgaW4gZXhhbXBsZSBkZXZpY2Ugbm9kZSwgc28gcmVtb3ZlIHRoaXMg
YWxzby4NCg0KUmVnYXJkcywNCkNLDQoNCj4gKw0KPiArICBpb21tdXM6DQo+ICsgICAgbWF4SXRl
bXM6IDQNCj4gKyAgICBkZXNjcmlwdGlvbjoNCj4gKyAgICAgIFBvaW50cyB0byB0aGUgcmVzcGVj
dGl2ZSBJT01NVSBibG9jayB3aXRoIG1hc3RlciBwb3J0IGFzIGFyZ3VtZW50LCBzZWUNCj4gKyAg
ICAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pb21tdS9tZWRpYXRlayxpb21t
dS55YW1sIGZvciBkZXRhaWxzLg0KPiArICAgICAgUG9ydHMgYXJlIGFjY29yZGluZyB0byB0aGUg
SFcuDQo+ICsNCj4gKyAgcG93ZXItZG9tYWluczoNCj4gKyAgICBtYXhJdGVtczogMQ0KPiArDQo+
ICsgIGNsb2NrczoNCj4gKyAgICBpdGVtczoNCj4gKyAgICAgIC0gZGVzY3JpcHRpb246IGNsb2Nr
IGZvciBpbWdzeXMgbWFpbiBpcGUNCj4gKyAgICAgIC0gZGVzY3JpcHRpb246IGNsb2NrIGZvciBp
cGUgZmR2dA0KPiArICAgICAgLSBkZXNjcmlwdGlvbjogY2xvY2sgZm9yIGlwZSB0b3ANCj4gKw0K
PiArICBjbG9jay1uYW1lczoNCj4gKyAgICBpdGVtczoNCj4gKyAgICAgIC0gY29uc3Q6IGltZ19p
cGUNCj4gKyAgICAgIC0gY29uc3Q6IGlwZV9mZHZ0DQo+ICsgICAgICAtIGNvbnN0OiBpcGVfdG9w
DQo+ICsNCj4gK3JlcXVpcmVkOg0KPiArICAtIGNvbXBhdGlibGUNCj4gKyAgLSByZWcNCj4gKyAg
LSBpbnRlcnJ1cHRzDQo+ICsgIC0gaW9tbXVzDQo+ICsgIC0gcG93ZXItZG9tYWlucw0KPiArICAt
IGNsb2Nrcw0KPiArICAtIGNsb2NrLW5hbWVzDQo+ICsNCj4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVz
OiBmYWxzZQ0KPiArDQo+ICtleGFtcGxlczoNCj4gKyAgLSB8DQo+ICsgICAgI2luY2x1ZGUgPGR0
LWJpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2FybS1naWMuaD4NCj4gKyAgICAjaW5jbHVk
ZSA8ZHQtYmluZGluZ3MvbWVtb3J5L21lZGlhdGVrLG10ODE4OC1tZW1vcnktcG9ydC5oPg0KPiAr
ICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9wb3dlci9tZWRpYXRlayxtdDgxODgtcG93ZXIuaD4N
Cj4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvY2xvY2svbWVkaWF0ZWssbXQ4MTg4LWNsay5o
Pg0KPiArICAgIGFpZUAxNTMxMDAwMCB7DQo+ICsgICAgICBjb21wYXRpYmxlID0gIm1lZGlhdGVr
LG10ODE4OC1haWUiOw0KPiArICAgICAgcmVnID0gPDB4MTUzMTAwMDAgMHgxMDAwPjsNCj4gKyAg
ICAgIGludGVycnVwdHMgPSA8R0lDX1NQSSA3ODcgSVJRX1RZUEVfTEVWRUxfSElHSCAwPjsNCj4g
KyAgICAgIGlvbW11cyA9IDwmdnBwX2lvbW11IE00VV9QT1JUX0wxMl9GRFZUX1JEQV8wPiwNCj4g
KyAgICAgICAgICAgICAgIDwmdnBwX2lvbW11IE00VV9QT1JUX0wxMl9GRFZUX1JEQl8wPiwNCj4g
KyAgICAgICAgICAgICAgIDwmdnBwX2lvbW11IE00VV9QT1JUX0wxMl9GRFZUX1dSQV8wPiwNCj4g
KyAgICAgICAgICAgICAgIDwmdnBwX2lvbW11IE00VV9QT1JUX0wxMl9GRFZUX1dSQl8wPjsNCj4g
KyAgICAgIHBvd2VyLWRvbWFpbnMgPSA8JnNwbSBNVDgxODhfUE9XRVJfRE9NQUlOX0lQRT47DQo+
ICsgICAgICBjbG9ja3MgPSA8JmltZ3N5cyBDTEtfSU1HU1lTX01BSU5fSVBFPiwNCj4gKyAgICAg
ICAgICAgICAgIDwmaXBlc3lzIENMS19JUEVfRkRWVD4sDQo+ICsgICAgICAgICAgICAgICA8Jmlw
ZXN5cyBDTEtfSVBFU1lTX1RPUD47DQo+ICsgICAgICBjbG9jay1uYW1lcyA9ICJpbWdfaXBlIiwN
Cj4gKyAgICAgICAgICAgICAgICAgICAgImlwZV9mZHZ0IiwNCj4gKyAgICAgICAgICAgICAgICAg
ICAgImlwZV90b3AiOw0KPiArICAgIH07DQoNCg==

