Return-Path: <linux-media+bounces-24084-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C18189FC7DC
	for <lists+linux-media@lfdr.de>; Thu, 26 Dec 2024 04:42:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3A1057A1472
	for <lists+linux-media@lfdr.de>; Thu, 26 Dec 2024 03:42:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF3B214A0A8;
	Thu, 26 Dec 2024 03:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="cuPsOlnX";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="rAlQaaE+"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C426910E0;
	Thu, 26 Dec 2024 03:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735184524; cv=fail; b=Jat3lzNOe3E3wUOFnH5tVGiEoq+RNMRuCB78V75MuHlS+7PcQuZuxEBRM6OQF0WGayY9XslgxI9NwOXUtAX9Zk5sR51f25kL1e91eviGmO7gQucCtTVAKD5JW3V5TjWqxuAaRnCBO10ZTV6OgfVrIUM6ik/my1A3CWaaGJeUyic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735184524; c=relaxed/simple;
	bh=8T/p3q9oj27cyuwBeyijVOxwfM879tnqNLsqHj9Hnuw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=t3lKxqbK1acHfNH/Ii11laEFSjH7O1j64pgXBSgBHpRz+SFRs93RBBsp56ZzNNX3FO0M7y30TMrjVJiYakGj9MApMECdKtXAjgjavaaFly+7tP7t04YbwTuwfWVG8JDOq6YohcWR0y3hkLnChZEdNMbVDolm6ZWx5YnwOBosAkg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=cuPsOlnX; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=rAlQaaE+; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 5ac49bdcc33b11ef99858b75a2457dd9-20241226
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=8T/p3q9oj27cyuwBeyijVOxwfM879tnqNLsqHj9Hnuw=;
	b=cuPsOlnXstwUUUwYjkR9qTwotchlaJuOSh1PzxavYMEVFOugNB9Zm66ImtLugVCDBCXI1Jnmln8Mk+ZWbgbAJML2jAuHOEIuyECnu2rQXhImoiU5B28+QibWwkFFKH4TvLQw9HUoQlnkOKjY6Kx2GkFsgIjyakFlZKNYXL6ztlE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:f6b4b05b-97e7-4546-a943-a1eee0546714,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:ab8ae118-ec44-4348-86ee-ebcff634972b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-UUID: 5ac49bdcc33b11ef99858b75a2457dd9-20241226
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2120899202; Thu, 26 Dec 2024 11:41:56 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 26 Dec 2024 11:41:55 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 26 Dec 2024 11:41:55 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xio94n9DfNLblUBeLIv4LsX8hzSrAMACBBtwQtiqmh7AoB6XsDhniIUipapsqXSJWr0Ns28IL6/MMkmlRbXSnm3ZC86V04fTfrnIeWw/UcPIaFWcs3d6AfUxksKbxtWD//27YDzQlMytC4Tt+RtWoicaohdQ6k91dpVIRVKSawVkFHC3l8sRrFodgs5yrPjeocoHyBKEaWEliHK9ea86GxxBri/fURgkk2pE6ll4pVaLKp+Fg9W5+MRI0Bm9blLWyA9+5T+jMkbws6bdFozw2SCVs1bgHSdHYPMVXkm3vMGiqW2upt9+8/3dbkb9KlVzkLeYi7AS9MUubeJRDvw7dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8T/p3q9oj27cyuwBeyijVOxwfM879tnqNLsqHj9Hnuw=;
 b=X4K6jB3K163LhD0NKMyOZPlZ/1oNZTb8dMuA9E+rYT7UtC1MstIaLkeGb8PRcWpE/NSUq+Z3shNs+nNP3lA8FxnzzxiTTT3H6AK9Y+vQDSTtbtT24yAakU/LI+kzWUms2N7mhNRZ89891SI5r9co3PC+PDDBkbHl+wXRZ0C0sK4bPSxETpOcOB8sCBaK8yAXWyZmJcnypgyw7M5LJcLvOEjBJqrjiAYZPJ8IBIaoNSsURgjNe3nSwIsMlWPxkQMtI/rq07QsdiXgB1Qbn5IX20zQaWYhENIXUaDu8rgDsgdPcedCHIEzXrho0QyX9qplsi6jXcYHKVu1e/Fo2SORXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8T/p3q9oj27cyuwBeyijVOxwfM879tnqNLsqHj9Hnuw=;
 b=rAlQaaE+VMh8cHvs4/oYMAK0UjiPampXWGlMMSONxrFDdMVd//wxvwK3OATDHYb5VFYt5P/5bzjl2J/KVAvSvYVJhXQoSOH5NT1RkfTnJQXXdaPK750Z/t9vdhzMPob8TfTI1YnODwTvt8mpl8+01IOwPc6DiHxU6D1PwgK88xs=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEYPR03MB6626.apcprd03.prod.outlook.com (2603:1096:101:83::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.19; Thu, 26 Dec
 2024 03:41:52 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8251.015; Thu, 26 Dec 2024
 03:41:52 +0000
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
Subject: Re: [PATCH v3 2/4] media: dt-bindings: add MT8188 AIE
Thread-Topic: [PATCH v3 2/4] media: dt-bindings: add MT8188 AIE
Thread-Index: AQHbVqwldqtUheFtjkiOmM8I/AZjsLL34tqA
Date: Thu, 26 Dec 2024 03:41:52 +0000
Message-ID: <de173b50912e294a866963aa37c9a9b5f974bf96.camel@mediatek.com>
References: <20241225090113.17027-1-bo.kong@mediatek.com>
	 <20241225090113.17027-3-bo.kong@mediatek.com>
In-Reply-To: <20241225090113.17027-3-bo.kong@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEYPR03MB6626:EE_
x-ms-office365-filtering-correlation-id: d5ba9a60-e1e8-4fa0-ce0d-08dd255f3cb4
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?cXFmWnVvUnpxdnNyTjlZdjNyOEhDS3FQaUo4eHA1ZVg2NWdSWWUzalB3VXJa?=
 =?utf-8?B?L0szWFBOWUZibkw4cUx0TDF1WkZtdExYQWY5STJ3OFN2SU5hVEFqSUlrMzlr?=
 =?utf-8?B?d3ZqZGltRUxIUjloeGZTZDRsRWhoVGxwNmVlZjd4dnBBb0xKYk9kRXJ0MVNH?=
 =?utf-8?B?K2tabFJqWTVNak5lSUV4dS9oakFKUTI4VTJLNjNUMjZHd0o2TjR6QS9waG84?=
 =?utf-8?B?NzNERkRzZ1FWOEUzZzV5YkRuQmszQlZ2OEhpdmEvMGFhdmlWYkhtV1ZBem5B?=
 =?utf-8?B?NXBPWHE1eVhPY3Y0ZFVXSUNZeU9Ock9KTkVlNFZ5Skl3SjFjSHN1dUtHOGVn?=
 =?utf-8?B?UHYxRnFuSlgxWGIxRHRUZ3NyN3g0UFAzc3FHRmRhTmNkNDdteUZBdERpdFBW?=
 =?utf-8?B?cTJqKy9PZ0NodTFENjBNNy9BK0NVUHJ4Q1Z1OVJyT20xSmZTSnk0OEYyejhJ?=
 =?utf-8?B?b2NSajZ1STZxUFJFc3V3L25mTFNzRW1ubmpoejNmRzFYOW11MW9Yc1h2cWRM?=
 =?utf-8?B?K0xmNTlJYnZ0RGdMaE4wVHRLWjNvczN6elJvRDFtWmxpQmEydzVUSUVMamZ1?=
 =?utf-8?B?SUIySk1BTXJ4aUMrMXdwanV5MDFncWNkdzB1d2Q5Qkw0UzZKOWR2WlVRWmZ5?=
 =?utf-8?B?RFhMejMwQkRLR1ZTWHp1VVFka0lSWWhndlF6Q215Z25rMTVNNWlTZXJISW16?=
 =?utf-8?B?TFVBd1EyYVBzYW15bCtYd0poYzlhUTlyMFVvaG5CcmhhWnp5TW52RWtEellU?=
 =?utf-8?B?ZjZTakRQZ0VLU3JoanNqUUJaV0xpazdicHQ5dmRZS0g1VTJ1OGRMVEkxaFhZ?=
 =?utf-8?B?dTQ0YUFnVjhIL2JpMHlTVWcydG03WHhpaDNibVdxa0VhUnhQTFJ3SDdQUjhH?=
 =?utf-8?B?TmxLTGlTQkNERmM0bWdWY1A5QU9BZnRxVWxPeVVNS1MrK0dRK05CVTNDWEVJ?=
 =?utf-8?B?aGVoVWFzaVdaUm9wYjMwdnBJYVoxaWZVcllFdWo4NlVFZXRzTmVsRXhyK2F1?=
 =?utf-8?B?ZWw0Y1dTMXhFSFBRbUNGS1FCNkRPT3VsYlpsNWI2cnNEN0F5V21xcnlBVjNl?=
 =?utf-8?B?RmFXSFNPSXlTTzZFenlWMGl3bFpPT0drbGp5T3pmaWF6MnByVjhsVGVTM1FL?=
 =?utf-8?B?S05LZkVKWEN0eUwxY0lISTZDbURmQTE4WnMrRjdvQjNjb0t6Umh6Q2NmZldS?=
 =?utf-8?B?dTNac2JQTlUzZTczN2J0NzM3bDMwZlE1aDZEN25ITEcxNzRYOS8rcFpGQzZy?=
 =?utf-8?B?cCtqNjN3MytuU3hnZk03eUhVMzdXcCtkSGJJWmdwNG51RVg4SWZ4dGRVaHd2?=
 =?utf-8?B?bExqQ3MvTVhXbjFMNzlvV1l1K0h2MlhFWXhQZUFhT0xVajJQVXBnQ25VeDJH?=
 =?utf-8?B?SVhJb1lJeU0rUnNuMnJYcW9OZDlvS1pxWUd4ZkxHRkxpVGxkV1NlNWFuODlx?=
 =?utf-8?B?Ym10a3hTN1h1dExCNzJjcW9xM0t6K2FBcDAvVHhwSVZwQlI3TjdRRDdYSVNh?=
 =?utf-8?B?UnFYbVFTTGNBQStRRXdwR2tDV2VJK1hBa1g1QTVTenpERGw0NkFGWHdxaUhY?=
 =?utf-8?B?RE9vMnN1RVpSYkp6UGhvNmpQSG92d1VwZTlxZ2xpazFXWS9UV3dqdVRZNjhl?=
 =?utf-8?B?S0lQQUVMbHBnM2xsMTZuNUxmQzI5VFkwcDNJUDJnZkJRY2tJSjF2OS8rTXVV?=
 =?utf-8?B?Mzd2ZklMM21jbm00S2ZFdHJ3RjRmZk0wdmlJNkF5c3A5eUFSQm1GcmJwdDdW?=
 =?utf-8?B?enlXRE1jRGFtMVJrY3IxbGNPaUtBMEQrYzM2RzFrbWZKQnNoeGV4cC9BdjNi?=
 =?utf-8?B?UDRyYXNiWm9kQzlnYzhIWURvT1RHUWFzZS83bnpMZjNXV0J1WVAxTE4rSTdS?=
 =?utf-8?B?cmk0bnZUbGpDWVVqOGJWNGNpdFNuT3VSblFjaVdKUHBZZkE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?alo2TmR6VDd4aHA4bERJSHVpWWN0S1hCVDlJeW9UNFFVeXNITWVKdUhqa0dK?=
 =?utf-8?B?STBoZ0JaZ2lSdXVrZk5LUTRMUjU4dHpYQTFVN1IwdHcyNkVGVEhIOFV4Q0dM?=
 =?utf-8?B?VGhBekZ4OUVuV1ZCaHZ1a3V5bkJpK1FqcVRUTUpmczZ1NVR1L3BSbnJiY3pn?=
 =?utf-8?B?SkJieTlsN1pBb1luaEpGNGt4TE1URE9NQmdGSFRQdVExcHltUDl4clhaRVly?=
 =?utf-8?B?bWttbm9Sa0VzTHQ3MG9JemM0ekl6ZVR2K0MzZXBMWWozSXJmUVRkaW9iRWQ4?=
 =?utf-8?B?SFV4OC9KQ2oyR21rR2VPVEs2VFZ2M2U4aE1weUxJWXFRZ3hZSG1GM0w3eEN0?=
 =?utf-8?B?YzlIQ3BSWkdzUnE2TlhSYzhxZ1lsT29DN3k3Q0dkYzY3VTA2eE8yTE1CTmZ4?=
 =?utf-8?B?aHFUM3VaaEhBR29UUVpOM1dqOEVBa0VYbmU3d3BkZVQ2dTJBVWgxL0p0UG9z?=
 =?utf-8?B?d1RFV1Z1YVNBTk1PM3M0VG1RWEVVZW5MaXNrVmVvdFZYS0RpQ1c4RUpObXRM?=
 =?utf-8?B?Mk1ERVIvOTF0Uk1ydzViOHdWc0JLeW5DOGJRTHhhMUpQK0xic3cyT2w2cjE5?=
 =?utf-8?B?UjF4c3pCT2lEeWlKSWwwcndQWTl6SnNyYVZra09veDEzdDUxUi9qSHdkV2Rx?=
 =?utf-8?B?UDBwOVRhSHR5YmliWVBmdE5PQ0sxU05BYUlPRFR6c1paNGxVV2ZKb1hDd3U5?=
 =?utf-8?B?SHM3NlQxenJjRVhEeXk5ZkhjN0oyTWRtREJ2RG5tMktGRWxlSXNOWFl6a0dE?=
 =?utf-8?B?NnhUclVUWmdsejZxRFJQVFI3NU5qWW9lclJGMEQxQjN1UW1NMG5ZMFRSZXdt?=
 =?utf-8?B?Q0VjMXM0dk05VU1wNEt4MFhnQnpDUmFiZzYvbVNSUzE5SldQclZybW9Sbmpv?=
 =?utf-8?B?RmpGYmpHWHFDeVJMaFpweE9Ebm1udG9PZWUvdXpNSXhuMjZ4YzZtVTJKV00x?=
 =?utf-8?B?VE5IK1NLZzU0b1BUQXRvQ09iakFaRndHWTBXbVB2WFdxRGF0MnF2M0dhdE5Q?=
 =?utf-8?B?ZTFKSUtzcEFRc1RiM0RsS2hIWUowZTgwUTV5RWFORVhUMTRHbnFMNCt6NUpR?=
 =?utf-8?B?ay9mMlJIWEl4VjluRHE0Z1E3UFcvbHZNNE1HekxnalV1eWZ0cmJLeEZMdlZX?=
 =?utf-8?B?RUtwdlpQM2ZtblNJOWM3STRJVXNoTTc4ekZjeWM2c3duK3RwcVpKVkdka0Nj?=
 =?utf-8?B?alhBZDBnNUxydXk5cng3a2s3N1JmT1FhQW5VdjFTMjc5TDZvTDJqandScVA1?=
 =?utf-8?B?VEJpVUZzWE1RbkxwTGMwK29VMHJhZlRYUklYKysycDVaUjd6MkJhdlpscDNq?=
 =?utf-8?B?cVAvKy9kbXpjenJRZFAwcVBvcFNBRmV4bzhFU0VTa0FmaW9BWkdlTmJIYm9Z?=
 =?utf-8?B?eFVZNkFiTkJ3anpjWktqcUhYdTFWV2JBb0JVcEU2YTE5SURiclZaWUp4RTNt?=
 =?utf-8?B?bVVjdy94RHBLektWSndPVkcvUjdHVVovaFZITDE0K095ckdMaTIxemV3N3pI?=
 =?utf-8?B?M1RRRFkzMEdWcDVZVE9UaXFkdUZmSlRUeEdtRW1hdFUxajFIUkpOOWpwSGFw?=
 =?utf-8?B?V1ZQYmV3cmNhS1JVNUU4T3JMcDlJWXozblVFcFYvYVNoa0tqNit0V01oSnhW?=
 =?utf-8?B?Qm9LMHN3Mk9SamU0L0RWQjZiSXFvTEkxZXFUcEZxaFcwQW95c1YzdEJmQnJn?=
 =?utf-8?B?UVdNbzRvZDlYdDA1ZnIyV0RqVkxWb2IvbjZKT01sQ05WUFJ3KzFzVldqSHZL?=
 =?utf-8?B?SDdMbHJXdUdocllpNWRscVFyeWZsaHBlVWRRMHc5YWpGSXRsQWh5RmNTOFZF?=
 =?utf-8?B?UEp5UkU4LzB0N1c3YjdUQk5rQnNXNFhJVTlIM21za2dLQkY2MnVRNjQ4L0lk?=
 =?utf-8?B?cWVKY1JFdGZ6RHJTK2d1TEIyYUlxWldwV2g5NlE1OWg5amQwd0tnQVFJb3hr?=
 =?utf-8?B?QUovdFdvS1JIWHM3TDVGdk9UdU1kZVpEYUhBSGphMm5SRzZyWDJyMDE3dlJ4?=
 =?utf-8?B?NkoyVHVPeXA0ZUkrUHZIV3BBaTN5cVN2VVdtQW1BV1F2dDBudVdyR3Iyallj?=
 =?utf-8?B?VWtlRVNQZGcxTUZlQ2hZeEJjN2RFcURqbUZubHlVWGNvWHZ5MVB5NGYyTlh2?=
 =?utf-8?Q?9AN59wZrBnAo4zc3i5f4CGDCV?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4A5A8258E17D2442B111AC08039C50C1@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5ba9a60-e1e8-4fa0-ce0d-08dd255f3cb4
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Dec 2024 03:41:52.7057
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: st4TYjqYLvW4Wzd5H1etmPB0PVJJcoPWv48gGAgVWN18wPy9f1Aqruj5jXu6CjEa9Isq2BLmf9sjbZUMUdbD1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6626

T24gV2VkLCAyMDI0LTEyLTI1IGF0IDE3OjAwICswODAwLCBiby5rb25nIHdyb3RlOg0KPiBGcm9t
OiBCbyBLb25nIDxCby5Lb25nQG1lZGlhdGVrLmNvbT4NCj4gDQo+IEFkZCBZQU1MIGRldmljZSB0
cmVlIGJpbmRpbmdzIGZvciBNVDgxODggQUlFLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQm8gS29u
ZyA8Qm8uS29uZ0BtZWRpYXRlay5jb20+DQo+IC0tLQ0KPiANCj4gQ2hhbmdlcyBpbiB2MzoNCj4g
bm9uZQ0KPiANCj4gQ2hhbmdlcyBpbiB2MjoNCj4gMS4gRml4IGNvZGluZyBzdHlsZQ0KPiAtLS0N
Cj4gIC4uLi9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlayxtdDgxODgtYWllLnlhbWwgICB8IDk3ICsr
KysrKysrKysrKysrKysrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCA5NyBpbnNlcnRpb25zKCspDQo+
ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21l
ZGlhL21lZGlhdGVrLG10ODE4OC1haWUueWFtbA0KPiANCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlayxtdDgxODgtYWllLnlhbWwg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWssbXQ4MTg4
LWFpZS55YW1sDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAwMC4u
NjNkZDcyMGVmNmVjDQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLG10ODE4OC1haWUueWFtbA0KPiBAQCAtMCww
ICsxLDk3IEBADQo+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9S
IEJTRC0yLUNsYXVzZSkNCj4gKyVZQU1MIDEuMg0KPiArLS0tDQo+ICskaWQ6IGh0dHBzOi8vdXJs
ZGVmZW5zZS5jb20vdjMvX19odHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9tZWRpYS9tZWRp
YXRlay1haWUueWFtbCpfXztJdyEhQ1RSTktBOXdNZzBBUmJ3IW1PWWlBUTRMMzVyUHBuZFphUzkx
dFRjRmdhVjZ3ZE5vUTlDc0lLNUlINkhwanQ1U2pzZGNYWDRaMC0tTFZWVU96NFdDZV9lT2Z5Ukpt
Skg5JCANCj4gKyRzY2hlbWE6IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwOi8vZGV2
aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCpfXztJdyEhQ1RSTktBOXdNZzBBUmJ3
IW1PWWlBUTRMMzVyUHBuZFphUzkxdFRjRmdhVjZ3ZE5vUTlDc0lLNUlINkhwanQ1U2pzZGNYWDRa
MC0tTFZWVU96NFdDZV9lT2Yydjl5OUZVJCANCj4gKw0KPiArdGl0bGU6IFRoZSBBSSBFbmdpbmUg
VW5pdCBvZiBNZWRpYVRlayBDYW1lcmEgU3lzdGVtDQo+ICsNCj4gK21haW50YWluZXJzOg0KPiAr
ICAtIEJvIEtvbmcgPGJvLmtvbmdAbWVkaWF0ZWsuY29tPg0KPiArDQo+ICtkZXNjcmlwdGlvbjoN
Cj4gKyAgQUlFKEFJIEVuZ2luZSkgaXMgb25lIG9mIHRoZSB1bml0cyBpbiBtdDgxODggSVNQIHdo
aWNoDQo+ICsgIHByb3ZpZGVzIGhhcmR3YXJlIGFjY2VsZXJhdGVkIGZhY2UgZGV0ZWN0aW9uIGZ1
bmN0aW9uLA0KPiArICBpdCBjYW4gZGV0ZWN0IGRpZmZlcmVudCBzaXplcyBvZiBmYWNlcyBpbiBh
IHJhdyBpbWFnZS4NCj4gKw0KPiArcHJvcGVydGllczoNCj4gKyAgY29tcGF0aWJsZToNCj4gKyAg
ICBpdGVtczoNCj4gKyAgICAgIC0gY29uc3Q6IG1lZGlhdGVrLG10ODE4OC1haWUNCj4gKw0KPiAr
ICByZWc6DQo+ICsgICAgbWF4SXRlbXM6IDENCj4gKyAgICBkZXNjcmlwdGlvbjogUGh5c2ljYWwg
YmFzZSBhZGRyZXNzIGFuZCBsZW5ndGggb2YgdGhlIHJlZ2lzdGVyIHNwYWNlLg0KPiArDQo+ICsg
IGludGVycnVwdHM6DQo+ICsgICAgbWF4SXRlbXM6IDENCj4gKw0KPiArICBtZWRpYXRlayxsYXJi
Og0KPiArICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3BoYW5kbGUN
Cj4gKyAgICBkZXNjcmlwdGlvbjoNCj4gKyAgICAgIE11c3QgY29udGFpbiB0aGUgbG9jYWwgYXJi
aXRlcnMgaW4gdGhlIGN1cnJlbnQgU29Dcywgc2VlDQo+ICsgICAgICBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LWNvbnRyb2xsZXJzL21lZGlhdGVrLHNtaS1sYXJiLnlh
bWwNCj4gKyAgICAgIGZvciBkZXRhaWxzLg0KPiArDQo+ICsgIGlvbW11czoNCj4gKyAgICBtYXhJ
dGVtczogNA0KPiArICAgIGRlc2NyaXB0aW9uOg0KPiArICAgICAgUG9pbnRzIHRvIHRoZSByZXNw
ZWN0aXZlIElPTU1VIGJsb2NrIHdpdGggbWFzdGVyIHBvcnQgYXMgYXJndW1lbnQsIHNlZQ0KPiAr
ICAgICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lvbW11L21lZGlhdGVrLGlv
bW11LnlhbWwgZm9yIGRldGFpbHMuDQo+ICsgICAgICBQb3J0cyBhcmUgYWNjb3JkaW5nIHRvIHRo
ZSBIVy4NCj4gKw0KPiArICBwb3dlci1kb21haW5zOg0KPiArICAgIG1heEl0ZW1zOiAxDQo+ICsN
Cj4gKyAgY2xvY2tzOg0KPiArICAgIGl0ZW1zOg0KPiArICAgICAgLSBkZXNjcmlwdGlvbjogY2xv
Y2sgZm9yIGltZ3N5cyBtYWluIGlwZQ0KPiArICAgICAgLSBkZXNjcmlwdGlvbjogY2xvY2sgZm9y
IGlwZSBmZHZ0DQo+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBjbG9jayBmb3IgaXBlIHNtaSBsYXJi
MTINCj4gKyAgICAgIC0gZGVzY3JpcHRpb246IGNsb2NrIGZvciBpcGUgdG9wDQo+ICsNCj4gKyAg
Y2xvY2stbmFtZXM6DQo+ICsgICAgaXRlbXM6DQo+ICsgICAgICAtIGNvbnN0OiBpbWdfaXBlDQo+
ICsgICAgICAtIGNvbnN0OiBpcGVfZmR2dA0KPiArICAgICAgLSBjb25zdDogaXBlX3NtaV9sYXJi
MTINCj4gKyAgICAgIC0gY29uc3Q6IGlwZV90b3ANCj4gKw0KPiArcmVxdWlyZWQ6DQo+ICsgIC0g
Y29tcGF0aWJsZQ0KPiArICAtIHJlZw0KPiArICAtIGludGVycnVwdHMNCj4gKyAgLSBpb21tdXMN
Cj4gKyAgLSBwb3dlci1kb21haW5zDQo+ICsgIC0gY2xvY2tzDQo+ICsgIC0gY2xvY2stbmFtZXMN
Cj4gKw0KPiArYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlDQo+ICsNCj4gK2V4YW1wbGVzOg0K
PiArICAtIHwNCj4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xs
ZXIvYXJtLWdpYy5oPg0KPiArICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9tZW1vcnkvbWVkaWF0
ZWssbXQ4MTg4LW1lbW9yeS1wb3J0Lmg+DQo+ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL3Bv
d2VyL21lZGlhdGVrLG10ODE4OC1wb3dlci5oPg0KPiArICAgICNpbmNsdWRlIDxkdC1iaW5kaW5n
cy9jbG9jay9tZWRpYXRlayxtdDgxODgtY2xrLmg+DQo+ICsgICAgYWllQDE1MzEwMDAwIHsNCj4g
KyAgICAgICNhZGRyZXNzLWNlbGxzID0gPDI+Ow0KPiArICAgICAgI3NpemUtY2VsbHMgPSA8Mj47
DQo+ICsgICAgICBjb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE4OC1haWUiOw0KPiArICAgICAg
cmVnID0gPDAgMHgxNTMxMDAwMCAwIDB4MTAwMD47DQo+ICsgICAgICBpbnRlcnJ1cHRzID0gPEdJ
Q19TUEkgNzg3IElSUV9UWVBFX0xFVkVMX0hJR0ggMD47DQo+ICsgICAgICBtZWRpYXRlayxsYXJi
ID0gPCZsYXJiMTI+Ow0KDQpsYXJiIGlzIHByb2Nlc3NlZCBieSBpb21tdSBkZXZpY2UsIHNvIGl0
J3Mgbm90IG5lY2Vzc2FyeSB0byBwb2ludCB0byBsYXJiIGRldmljZSBoZXJlLg0KDQpSZWdhcmRz
LA0KQ0sNCg0KPiArICAgICAgaW9tbXVzID0gPCZ2cHBfaW9tbXUgTTRVX1BPUlRfTDEyX0ZEVlRf
UkRBXzA+LA0KPiArICAgICAgICAgICAgICAgPCZ2cHBfaW9tbXUgTTRVX1BPUlRfTDEyX0ZEVlRf
UkRCXzA+LA0KPiArICAgICAgICAgICAgICAgPCZ2cHBfaW9tbXUgTTRVX1BPUlRfTDEyX0ZEVlRf
V1JBXzA+LA0KPiArICAgICAgICAgICAgICAgPCZ2cHBfaW9tbXUgTTRVX1BPUlRfTDEyX0ZEVlRf
V1JCXzA+Ow0KPiArICAgICAgcG93ZXItZG9tYWlucyA9IDwmc3BtIE1UODE4OF9QT1dFUl9ET01B
SU5fSVBFPjsNCj4gKyAgICAgIGNsb2NrcyA9IDwmaW1nc3lzIENMS19JTUdTWVNfTUFJTl9JUEU+
LA0KPiArICAgICAgICAgICAgICAgPCZpcGVzeXMgQ0xLX0lQRV9GRFZUPiwNCj4gKyAgICAgICAg
ICAgICAgIDwmaXBlc3lzIENMS19JUEVfU01JX0xBUkIxMj4sDQo+ICsgICAgICAgICAgICAgICA8
JmlwZXN5cyBDTEtfSVBFU1lTX1RPUD47DQo+ICsgICAgICBjbG9jay1uYW1lcyA9ICJpbWdfaXBl
IiwNCj4gKyAgICAgICAgICAgICAgICAgICAgImlwZV9mZHZ0IiwNCj4gKyAgICAgICAgICAgICAg
ICAgICAgImlwZV9zbWlfbGFyYjEyIiwNCj4gKyAgICAgICAgICAgICAgICAgICAgImlwZV90b3Ai
Ow0KPiArICAgIH07DQoNCg==

