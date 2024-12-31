Return-Path: <linux-media+bounces-24193-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA0A9FEDE3
	for <lists+linux-media@lfdr.de>; Tue, 31 Dec 2024 09:16:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 749D41615FF
	for <lists+linux-media@lfdr.de>; Tue, 31 Dec 2024 08:16:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A3EC191F68;
	Tue, 31 Dec 2024 08:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="arPLQdFb";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="N36kBNjB"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337F118C004;
	Tue, 31 Dec 2024 08:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735632842; cv=fail; b=Q270GbFBISrdFXtqzsAQHR2EQWxdY/N1n1njDyIGMuBEaIeUcmSn2Py6O6+hzptTkf1qFJUDHDsYlmZxK1Qp+oo30pT7LpPQkGIsg3H3kbVxZ9GK38zW7NuD3krSZrMZ8yHEVOLx+ABdDKnDe7CUQurxdH/rCgiodFdRyRuaEhI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735632842; c=relaxed/simple;
	bh=PVMHZ2n8+LUpSyHybMTONdo0Yv7MAU722DLW6bjw8+U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CPlqr5EFjIHi27YL2Py6yBQsZEe4iQBuLNCHA4ipm/SnRTrsmoUlNnE/IdunbL2N9DmJzJLXC3tMjvNRLKzJ8RFc/SWyqwBtbvYAt9/c+gOqe+YHb6M7zYQsElNQ22j6D7f7dwCYdhZ9ZfO8F0Ou1k1Et9uTc5iLxfXPZ/7mSXE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=arPLQdFb; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=N36kBNjB; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 2b7740b0c74f11efbd192953cf12861f-20241231
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=PVMHZ2n8+LUpSyHybMTONdo0Yv7MAU722DLW6bjw8+U=;
	b=arPLQdFbuEionC+guOK2RJk465p44n1eoeiXt3zIWv/qh1q539R2zwm7SSCq+Y8I710TgdnJSzNFp9Gah3xu3u+RBq5r3NgyhD2pT5dtpPFSQVESQQw06r7E+jwXgrkrIMndTVHOBX2oL5K9y8O0KyHVAq6zevcykF2/yBIMcmI=;
X-CID-CACHE: Type:Local,Time:202412311557+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:5c811ba8-6e97-4baa-9f4c-2675c3cc39e1,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:476c2737-e11c-4c1a-89f7-e7a032832c40,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 2b7740b0c74f11efbd192953cf12861f-20241231
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 5114130; Tue, 31 Dec 2024 16:13:51 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 31 Dec 2024 16:13:50 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 31 Dec 2024 16:13:50 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yiSVCllg8feX6fGxoRCA98AUYBaGzSywcg/SURGRvM+BpNuYxt0ZC+tQWFgvHob7wIfexfgk6vM6SMJDI2JbjnLOT7KeGCrkiIZWHQHTxv6bE9/bHPKCKI5/qD8o51oras2jyS4pd8uIoiuf5vrM+VNa0qvu4vBYcWekLSUYotP3u33endHJArgnCwR/QX2Hev7cwvNxsn2rOHmgWyVi2EKwwIUp7WAI+y6D7EutX3p/gjcGyuK3MgDxI56/dWzq3Famh/CKt+fu1zUM/3vEQeQVExOEMHpOKV3lS7hel8LFT4+xXNmsSxn0Hn6hpsxb9USWi8j/+S0ZGDyubip5Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PVMHZ2n8+LUpSyHybMTONdo0Yv7MAU722DLW6bjw8+U=;
 b=bcCMu6iLhTQ/4o/8J62vNoKpZTwFnIQj9+rnBbGh3pLk3ahrylL+izgsb1CT5ayXNbM5QudgXrMT2E255TefVlOn6aAYcpCU2sWlQEX2XefLBssTER8caGhm4sA1aswpx4NiV1kNxkDBviynr3MEw148kLXUvnkuywuN4RNBLTjw212L8QjhU5hTOSzFpRCEilulRR7KUF2N56Lwf+57toZ4WBYErPfnW+TzhFIZa1s7HUgumCbCa3RSvQazGwkXLb+zvPG7GppKFeqqyQu/xrB/Ga1df6WEe1AwnXRwZoC0w9SQJ4Nexguv1RPRVuumK6kE5lrY8q0f1EHYmA5nZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PVMHZ2n8+LUpSyHybMTONdo0Yv7MAU722DLW6bjw8+U=;
 b=N36kBNjBuWguIFihrAPVYSC71TZUumLfQ4aNYpMe0Og0NjZatoB73T6QoEBf41VzeCll7gLFdGtez7K7YplF/bpNZZbulS2sh3/GV6EccI5P7TiEV+b9UbH596Q2SrpPHpesnA5tSvPOi2jcNRj14qCRfgOuxXkAZyEbSbHfsyw=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEYPR03MB7814.apcprd03.prod.outlook.com (2603:1096:101:178::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.20; Tue, 31 Dec
 2024 08:13:48 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%5]) with mapi id 15.20.8293.000; Tue, 31 Dec 2024
 08:13:48 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"krzk@kernel.org" <krzk@kernel.org>, =?utf-8?B?Qm8gS29uZyAo5a2U5rOiKQ==?=
	<Bo.Kong@mediatek.com>
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
Thread-Index: AQHbVqv2E/LiiDV3F0q0O1OD05OMm7L5nUmAgAZlb4CAAAMsAIAAAvgAgAABoIA=
Date: Tue, 31 Dec 2024 08:13:47 +0000
Message-ID: <996761d73771c010732a3b3187829a2a7a1e9903.camel@mediatek.com>
References: <20241225090113.17027-1-bo.kong@mediatek.com>
	 <20241225090113.17027-4-bo.kong@mediatek.com>
	 <351287f9e8a118babd225fb0e484976bef3db6c0.camel@mediatek.com>
	 <3c58790f-b1eb-4183-aafd-063dc5472b52@kernel.org>
	 <b89b90b85e7c00889595bd8b8664d564ba8dc8ca.camel@mediatek.com>
	 <02618fb5-1ed4-44b4-943f-fe0f859d9fb6@kernel.org>
In-Reply-To: <02618fb5-1ed4-44b4-943f-fe0f859d9fb6@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEYPR03MB7814:EE_
x-ms-office365-filtering-correlation-id: 967bb492-598d-4776-a930-08dd29730d74
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZnNoL1l1eXRuWjBmUHZnYW9BOHZPRG5ER0Y4OWJoVDMwNGF4STNDek9tQ25l?=
 =?utf-8?B?cHJ6ODY4UlM3U21Eb2hJeXN1VUxodTFraG1ZWDd2bi91N1VnTjRSWkZCS1pt?=
 =?utf-8?B?R2xPZktoUGtTdTkxV0RKY0lyK0VPSEM4VnJoUytpcjJlM2FMRFU4RTZudzM5?=
 =?utf-8?B?ZVVtWFMyTjdVU1NtdmNpV01YY3BXK2xYOUlrWnVhY0JvV2xTWHk5Q1QyOHZF?=
 =?utf-8?B?d0lOdC9zR2xXejh4c2xGVDAwd1l1bXVWSmRGNzlSNUZzL0xQMm03MVJaaVpV?=
 =?utf-8?B?RExXYVpRQTE3TkFxaUZ2R0o0NC9ITGQzRXdoL3hUbFp4OUlmK2ZtVEdhMWlM?=
 =?utf-8?B?a3ZuWlJMWnVFRDdMZjROWHZqMExNZkNSOHEvQWxIT1orUkdscVNPbmdyWGpP?=
 =?utf-8?B?Q3dBODdmRVBadkYxeVJOQVBOTTVhcEphbkNSRnR3dmFUN3JrdFJlNkxxQ09x?=
 =?utf-8?B?WmJYSDZhTE5hOFRkdytXSWlpUFBNWk9WU2I2Z3VpYkJ0WVFpMG9CNkVLTzZs?=
 =?utf-8?B?UGV5M3lkY0lWelp6SUkvdGxjam5uTVFDZFg4dlNSbGN6U3VCKzZzcEs1Smdk?=
 =?utf-8?B?S1FMSFEzZHpoOEVkNHcyWXcyVFR3Ymwyd3VZalZYWjVURDg4QmhkT2NNOEhC?=
 =?utf-8?B?dGdTUjR6ZW1vTS9sWGRoWDR5SlhNNkd5WG5oc0NNRjAzTCtZMVRTUGc0b3py?=
 =?utf-8?B?MFJGcEl6MGxQVGlPY2Z5RW03R2N5RFc2M0d2eC92Zk1YY2syS2w4NURScFBF?=
 =?utf-8?B?THZlNkdFSllKYXh4Rm1ORFExR2V5b0tqWTlLcUF3dXI4MVdDZzRlYTJQS1pM?=
 =?utf-8?B?TUcrNEIxeHJhalhOcGt5WTJ3ZFJYWmpKQ0VHUm5RRmhWak91UjhsWGNVUUpO?=
 =?utf-8?B?UGVwL21DQThCSG5kOVBGLyt0R1BacWdlTnRzcFRkUXJWaXEzMnlia1hTRlRp?=
 =?utf-8?B?c29TMUljYlUxaklwQXZEUWR2T1AvRUVzeWVPWDdCVnlSQVh2RkU4WjRFc3Jo?=
 =?utf-8?B?dGVMVWFDMVcxOXZDdUg1NmZEeCt3bS9xamdWR1hzejRkNXFpZDRDekxyZ3N5?=
 =?utf-8?B?OENMSFRzUjU4ekRSeTdPVU9ZNmxtQk1XbmhPSVJ6aEJZWDVZWk5Lc1k0WVor?=
 =?utf-8?B?ZmpOMjF5dlQxQW51YUxoVDdKRjVGOVEvSWxCdno4c2tFTkxjT1VqVmhEWm1k?=
 =?utf-8?B?bnBMTFFibmpwUkRuRzNPWnBRdEVqY1Bad2UxYXl6Qm14RjFqNkZJQmlINmhY?=
 =?utf-8?B?S0t5NGlZOXpqZUxITFRsRnZRejBIMGVqTCtKc3Q4YjFtYm81V0NpV1cwZzlM?=
 =?utf-8?B?bmExZ1ZvZ21YU01pTFRvb0RvalAzVE1NZHJ2a3c3dXQxV3NGaGhOeUprWUd4?=
 =?utf-8?B?bTZpZGVjWUxqdld4VDA5TUlsRkxBV0xGbVk3aG8yelZILzZrMTVhOTNvT0dR?=
 =?utf-8?B?ZWd3anF2cU9KUHVaVXBXVHdPUHl5OFJydjJRdVE0YzlDZGZpQzBObFc1dU1R?=
 =?utf-8?B?MkVETndQSzgzYlVjV0ZRVlhibG04UzExUHZhaWZVQjdLZ1c2REhjOGxjNHNC?=
 =?utf-8?B?N2ZsYnpRaERHbHc2TlpCK2dpUi94aE9VMlh6QzN5NitJcmZXWWx1bXJqOW02?=
 =?utf-8?B?WEFnTndSU0ZwVjV6UnpHMEdORWZCTkZaUDA5UHNCbFhoMU9ENk15bGhiblNK?=
 =?utf-8?B?KzZ4ZWVJWjc4b0J3ZHJva241UFZTSDduRi9HM3dhdW9BTGN5RG9aeDFaSElp?=
 =?utf-8?B?ZmJGZXl5R2xzdEwxVld3ZkgwRittYldpMjdQaHZmNlJlM3dUZXZEWU00QVNR?=
 =?utf-8?B?ZXlUTE9ORTQyKzMrYS94WHQ0akZxOVlGTFJDSTAzTzR6Wml4NFRsTHZjcW9i?=
 =?utf-8?B?ejNSSlpsa0RSZU94ZGZlWlZ3NkZtSlVaT3c0QUYyOVZnYVVHZ2NyTlZTbXdZ?=
 =?utf-8?Q?2slKZJPF3xB9zhryY53/4rVqlcCRfVth?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U1liL0xsQ2swQ09LdDdWYXErR1p0MzQ0amdDM3dINDNCSFVCYUtkeUhYZkUz?=
 =?utf-8?B?SWY0MGprbTBNSi9GelJ5WWU5clJxZzlNRUJMU2FlMDFYSHR0TUxFR3hscTFO?=
 =?utf-8?B?bUFrMDNDQUl5dXVUUzB4UHptNUxCMUpEVHhzbzNzR3BUNWt2RkFRVFRXQ3hV?=
 =?utf-8?B?em93REhnTnF2SGd3K1AzaS9PV0hoTE8zOTFpVXlUbjB1UmdmS21KUkl4S0dC?=
 =?utf-8?B?a1pDK2NhdlhNVGl0bjg5czloRm9nRi9NU0lPcE9KY2xWcDU5L0p0WndXUU9r?=
 =?utf-8?B?K0RLandhbHJVVEpzSzJRQnBVTVU2YmVkeHZUWnljZFdmWUlNdzEwbHI3cGla?=
 =?utf-8?B?NGdXbFFjYm42S0VlSCtoOS9qM2E5YlJVSFpoYzZxeGhjaWNiNkFLZDVwY2gz?=
 =?utf-8?B?bjZPdEdIY3JzdkxaZjVRVnhGWnpaTDMvUnpSOTFOOWlEaDd1YjZpeFEzMVR1?=
 =?utf-8?B?SGExN3BCVVJ4bjd3TjdNOXV0aXRWRWpHTTJIMUtObEtaZHB4ekxoQXBPTFBM?=
 =?utf-8?B?QithcVpOUzFFY1B3YXN1L05ORnZZUldLekhGZ2ZaVk1DdUxvL0FnT2VXZ0Fz?=
 =?utf-8?B?citsbGhqeEhvelZvUUhuTzc4Wk9BWlZ5Q1V6OUFSaXZHTytBSENVczM4ZFhY?=
 =?utf-8?B?eXh1ZmZZTXA0N2N2aFE5S1RtdGx5b2YyOHFOaW1hVW15bUttRFJGd1M4dWFT?=
 =?utf-8?B?M2g4WlF6bG9GMUZtN2FpNHB1dVNKNnV6V2dOMXlPS0wyQ0dmTWx0bEQxemhW?=
 =?utf-8?B?K3R0RHJ0akxJMXdKUnMvRzh6ZVpITkJjWTJ2a3lSM0pJK2l4NkFoUjRMSzha?=
 =?utf-8?B?MG01YjZSMXZxNGlJamZoQTV5WjJ0UTloY3lUNTk4RHlocVVFcFdxMDd2bGZj?=
 =?utf-8?B?TkdiRjMvNkY0VStjc3JtN1NId3dTRkZJNDhzaWVEdjIyUGZQZlJGNk44UW4w?=
 =?utf-8?B?aVFwY1FaRko0L0hJYjcxRlQ2bWw2NHl3RENpQUtDMkl4dGl1Mno0dmNObjZl?=
 =?utf-8?B?YjVYbEFjcFo1MEMvaGhaRWxuMXF1R085Njk4eG5jRG1sU3c3VFAyQjd2ZWtQ?=
 =?utf-8?B?YXlPRkJjUjlBdE5LWlk2RjhTaXNGL2lnV1lZSzFhQy92WlM0TFZJQklBMTdu?=
 =?utf-8?B?dUh6dzQyK1JoVlk2YjV1NWhoaDU0ME55REwxdklMWnVlRTNIM1lZbWZZT0kw?=
 =?utf-8?B?U3N5dm81NG1vWXhJa2JRS2lmcFZrQm9SWlpNV25NMkdJOHpiOENvTWR0YzdG?=
 =?utf-8?B?eGZQWVkzTVVxQVREZzBOVU50bzRBVUpNZDdPVXpmQUI5bU0vaFFVSzAxNzRF?=
 =?utf-8?B?UHdybnI3WU5lajl6dGRDWHZpNW9SYkQwUTA2K20wY0FoN3BkOXpxQWViSXpL?=
 =?utf-8?B?U0doR2RJcVBTMHZNVXpaZjg2ZHdXcnRxRERuWTE1Q0VZUjRnb1daQmwrbE81?=
 =?utf-8?B?enZUYTVXTEo3aFJyZUMrbFMyQW9UeUovUnRtRUluYnV3YnVNSGFlM1ZVUFBV?=
 =?utf-8?B?Z0RqalJrZll4dEJlVHhvbnJac0x1ZVhzditMS1M4OGk5aFFib05BM25ZRitC?=
 =?utf-8?B?V25UZEx6bVpHVXUrTjl6SmZEMDUvNVNNVWxPUloxTTFGb0M4NEFvcWFwSWw1?=
 =?utf-8?B?M0tMN1BHSi83dWRTcmN4WEY5VEtJUDl4ajRFaUgvemNLSnVQQ2tzT3A1VTI4?=
 =?utf-8?B?cjFXK1ZWU2dyMi9XYjBWMEo4RFVUQ0dhL3Bmc1VoaWJ2akJOMi82czA3K3l3?=
 =?utf-8?B?NFowMUNBYkFMdFRkVytNeWxvNTNTMFRHNHZmaE53V2hpMnB5ajNKU0QzdHJY?=
 =?utf-8?B?M3pEbkxOQlhTMzM4TzI5Uzd2bUJ1SDFYc3h4V1pWOTJaTFRNeTZxeExCUlBL?=
 =?utf-8?B?cE9pM1hVWXAweFdjRVNHOXJCZWd5OVFaRkZVby9ESlo4dWxJY1NidEZxNDJS?=
 =?utf-8?B?R0w2NHhPMnkyQW9XZ09TSmYraEhGY2lvai9uTnk2SjhlZkRwTXhkbGtaYm81?=
 =?utf-8?B?dmREVzlYenUwQ0gyTmtnVGtMWkRQZjlraHU3K05uTFpqVVBMOFRFV2JvM1R6?=
 =?utf-8?B?TCt4OHZlSUFjc1IvRzR1M2Zzb0N5MlVNcTNuY1kwRHFmZ0FYZGxLZCs4NVlt?=
 =?utf-8?Q?GpXJGSblQRD2+Bo4rvi7hbX8f?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0CC6ED22680F1A44B879EEB21866CF20@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 967bb492-598d-4776-a930-08dd29730d74
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Dec 2024 08:13:47.9729
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7h11cDbnURTSCwQSHf0K+3ExLmmQTDMLFTcSvzGgBrcNtsPZfoax9bsOrhQ19pYnvfmO6UTRyQi/UowmKPtApw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7814

T24gVHVlLCAyMDI0LTEyLTMxIGF0IDA5OjA3ICswMTAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbCB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBj
b250ZW50Lg0KPiANCj4gDQo+IE9uIDMxLzEyLzIwMjQgMDg6NTcsIENLIEh1ICjog6Hkv4rlhYkp
IHdyb3RlOg0KPiA+ID4gPiANCj4gPiA+ID4gV2h5IGNsZWFyIG91dHB1dCBidWZmZXI/DQo+ID4g
PiA+IENvdWxkIHlvdSBwb2ludCBvdXQgd2hpY2ggcGxhY2UgaW4gdGhlIG91dHB1dCBidWZmZXIg
dGhhdCBoYXJkd2FyZSBkb2VzIG5vdCB3cml0ZSBkYXRhIGludG8gYnV0IHNvZnR3YXJlIHdvdWxk
IHJlYWQgaXQ/DQo+ID4gPiA+IA0KPiA+ID4gUGxlYXNlIHJlc3BvbmQgd2l0aCBvbmUgZW1haWwg
ZG9pbmcgcmV2aWV3LCBub3QgMTAgcGVyIGVhY2ggY29tbWVudC4NCj4gPiANCj4gPiBTb3JyeSB0
byBib3RoZXIgeW91Lg0KPiA+IEkgd291bGQgdHJ5IHRvIHJlc3BvbmQgaW4gb25lIGVtYWlsLg0K
PiA+IEV2ZW4gdGhvdWdoIEkgaGF2ZSBuZXcgY29tbWVudCB3aGVuIHNlY29uZCByZXZpZXcsIEkg
d291bGQgbm90IHJlc3BvbmQgc28gZnJlcXVlbnRseS4NCj4gDQo+IA0KPiBTZWNvbmQgcmV2aWV3
PyBZb3Ugc2VudCAxMSBlbWFpbHMsIHNvIDExIHJldmlld3M/DQoNCk5vLCB0aGUgMTEgcmV2aWV3
IHdvdWxkIGJlIDEgcmV2aWV3IGluIG9uZSBlbWFpbC4NCkJ1dCB0aGlzIGlzIGEgYmlnIHBhdGNo
LCBtYXliZSB3ZWVrcyBsYXRlciwgSSBoYXZlIHRpbWUgYW5kIHJldmlldyBpdCBzZWNvbmQgdGlt
ZS4NCg0KUmVnYXJkcywNCkNLDQoNCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQoN
Cg==

