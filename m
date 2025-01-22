Return-Path: <linux-media+bounces-25095-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B30A18A19
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 03:41:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 920323ABE1E
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 02:41:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8812754764;
	Wed, 22 Jan 2025 02:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="g9brOZJR";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="sH4KVa3F"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD57618FDAB;
	Wed, 22 Jan 2025 02:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737513311; cv=fail; b=P/Wd4wGxkD5bIlUumws1BAx2q5MYf1K/CNr+3EPBasGzJbg+ZLoAP7UwmPSDW/RAMuWJU5wcG08mtXeRgFagDl8zptpC4kWCVgm3hjkvGcWXLHFJjvrkSgezztwD+O1VguU8IoIZxuDZISCbzUWesZ05iYsw0mt2XQCCFZW4Df4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737513311; c=relaxed/simple;
	bh=XqRWpxn1qq83HIsLHgsIPz1N6obrNulSB5jmx76A2cM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TjAmV4RpE3Ik9svDkntinWwSC1T/YQ4B8z3oFraLmlw2SQalTPN7QQr2dCq1b7qm8uwcOODkmm7OCZVjNP7BaqpCgakAOl/LzCyF0diV9rEVB+FUV67V7O/lpk5d+h5znbDGxplKT0JGzD6F/TKeXbx7Bvz+NtNMSc1qWHqsgjY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=g9brOZJR; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=sH4KVa3F; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 7b78a966d86911efbd192953cf12861f-20250122
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=XqRWpxn1qq83HIsLHgsIPz1N6obrNulSB5jmx76A2cM=;
	b=g9brOZJRr6w7qBOw2dfcxY5DVm2sg6VR09ACO5m5PSN7cdIMgCztWkpDFxAZRlohlOlgBrCbHY2lyZJL+hnm2Gf7x0cI/IhYuYwvW2F3zijLqmg8/c/NHSmsUpNDbgQ3uB6W+UkSWMWnUsc/Ruo/961SCueybbFpOBdooiC3qcY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:68f0dcbc-de22-42b3-bf39-0880160f9cc5,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:f480440f-078a-483b-8929-714244d25c49,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 7b78a966d86911efbd192953cf12861f-20250122
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1050607157; Wed, 22 Jan 2025 10:35:02 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Wed, 22 Jan 2025 10:35:01 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Wed, 22 Jan 2025 10:35:01 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kHn7ULD7UPK2qtvW0837TOXVRG7VfQ1o73IFln6QZYKLFxMdo928Hb2yHiT7ST2xKYtQgcJiExjqn13ZhTH/Iv/spsc6aX6FGxjNtFstHzQZnxaGUgs/UcCFAkDYSy78S6KEmmVaPK/W/ESxV9JwpjPo+UR1sVlT4CrvA5pZY13WRNZ8UgrABr7ZrxNg6jkXgUl3z315j950S3nEV9at88U2C6Xd1pxkMmGUhM1HSlldga/JYeeL+xGbYviV7woxAQMD6uvrJ/Ozxjm3PMIG6PBKs07pQsFvY+LxsFIdfwmPyhJeWKLE/BCxacFufoP0+5kLUWBKZVI5dqPPAXbm+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XqRWpxn1qq83HIsLHgsIPz1N6obrNulSB5jmx76A2cM=;
 b=aKgM5zBJ4P37bdJxNbD4FCDdNpLbpid/aFiDrlZhZ3rE0m6wdk1OyoloN4FcfXnq8LmhwhdcpJW/OlCD0rj3RqoCFbfjTYaTJU+be71v4cpjl4HoOhG7XXAdZFX1NCdRuv9U9svKQjqRfh2SCICbXNzfl+ob8D/ekZEuGFpEtOuQLLiMgva4sQXWGUDnuOe28lXwROwek+qBQ6ld04ec+ck1kDobs9R/zTIjfixRFQ2UHg1FdSv+PCG0jZ8KPJPjJYEo8A37gXokQ9LwF5IfcmJkpmBDMtnQO2/Sgx7ClWbeU/xeOF3EgVXRy2aEXu/tCybkpeCd8hN0BwoONsVA4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XqRWpxn1qq83HIsLHgsIPz1N6obrNulSB5jmx76A2cM=;
 b=sH4KVa3F205+21pmDril98ztewQo7TIPF1iTYUuB/L8CKsxB7a+CS/HF2TegdeBoVo3ldvFoYCfoM7Yh84EMkGXXiMEnvwF8JPR3nNJvBgyyltTwptVTW6rW3v2CSL0CsVtfu7Z2ZZmWTCuPhxTeqazTICyqFzKUC8FusJqVVuI=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by SEZPR03MB7172.apcprd03.prod.outlook.com (2603:1096:101:ed::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Wed, 22 Jan
 2025 02:34:56 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%3]) with mapi id 15.20.8356.020; Wed, 22 Jan 2025
 02:34:55 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>,
	"wenst@chromium.org" <wenst@chromium.org>
CC: Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, "robh@kernel.org"
	<robh@kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "simona@ffwll.ch" <simona@ffwll.ch>,
	"mchehab@kernel.org" <mchehab@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "chunkuang.hu@kernel.org"
	<chunkuang.hu@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "airlied@gmail.com"
	<airlied@gmail.com>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	=?utf-8?B?WGF2aWVyIENoYW5nICjlvLXnjbvmlocp?= <Xavier.Chang@mediatek.com>,
	=?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>
Subject: Re: [PATCH v3 1/7] dt-bindings: mailbox: mediatek: Add MT8196 support
 for gce-mailbox
Thread-Topic: [PATCH v3 1/7] dt-bindings: mailbox: mediatek: Add MT8196
 support for gce-mailbox
Thread-Index: AQHbUjifwIYL/sR61UKff0WQOKSFC7MdOi8AgAIvbQCAAKpagIACNAgA
Date: Wed, 22 Jan 2025 02:34:55 +0000
Message-ID: <cccfba4f0a55b4bb952616414158f5173317654b.camel@mediatek.com>
References: <20241219170800.2957-1-jason-jh.lin@mediatek.com>
	 <20241219170800.2957-2-jason-jh.lin@mediatek.com>
	 <CABb+yY2t7rBnoBEf3Pog0eRW_zvb0YggbgKBspnZOS1bsyQBPQ@mail.gmail.com>
	 <CAGXv+5Eg_5CFiCYPk29wvjPq03wO9js5nQNhF8A_kB9+K452uw@mail.gmail.com>
	 <CABb+yY3U9Ud5KNQ-4V9m327ZdumDPperRXvkaVV2RbKscSYH-Q@mail.gmail.com>
In-Reply-To: <CABb+yY3U9Ud5KNQ-4V9m327ZdumDPperRXvkaVV2RbKscSYH-Q@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|SEZPR03MB7172:EE_
x-ms-office365-filtering-correlation-id: 792b997f-128d-4792-b9d5-08dd3a8d5b80
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?MHlaVzF6OU9jQzFmaXVLMlRUTExhV21DWEIwQ3RMZEJTMi9PUGdsQU9HaG90?=
 =?utf-8?B?ait5cE8va3ZsNzBRQlg1YVVrc1pTYWlKTDhRYkM0UVFUd0pORzBZcmF2ZUNX?=
 =?utf-8?B?S2MxMEJUcFJBLzYyUGNHRktKMTdmTmIrSyt1MWdheG11NkdPV0JCd2RqRm1U?=
 =?utf-8?B?N3hVT3ZsellkYWRQSzVqUG5FemJiMGozbk5xd0lOSGFYR0RHNW1rSlIvR1JH?=
 =?utf-8?B?cVhoZzJmU1h6NUlxb2VjcnN2a0E3YUNDRGhoWU9SWndZcHVOcXdPQlhlWHpk?=
 =?utf-8?B?MVlNUmVwRU5vdW8vK3pmcU9ON20zUmg3Ni9PTHdxcElDU3hROGtnTngxREpq?=
 =?utf-8?B?SVl0KzJxdG00V2hONmg2R3NDQnlSb1I4ZDhCVlltM1V3RFJ5WUZrU3hUY3pa?=
 =?utf-8?B?dnBpcjRTMFlHMCs3dHFuV2VlbkVvZ3BRc3BCaVFIRldNRXg5blZuaWxKQVEr?=
 =?utf-8?B?akppRTFEK21sTzhFVS9TZnhNb2FYRG5qYWVCZHVSUlVrOFJKQ0t2alhMOVo5?=
 =?utf-8?B?MmpFTktwREwxTHNsWitqMkRnaXNFZjZlSEpZVnRGeUJhME1Lbk01MnhUNTZN?=
 =?utf-8?B?Y0xnKzFKR3BrSEx2akRxTG1uRVlHVDlROHFxcVU4c0YrRldoNmlpeG1PQ2hU?=
 =?utf-8?B?cWlxV2ppak1JWVcxRXphMVFSR2xwdlN3cUQyeWkxN0dJa3dGb3pDL3h6YWM2?=
 =?utf-8?B?UzE1N2h3N2tSTzlYKzN5ZitYbWVPbjZGNjZMSjNXVVNuSi8wY3Ird29FNnIz?=
 =?utf-8?B?TkZ3L1pnY0dvMWhXNUF5ZnR3RkFiNGtOR0FFQ1lpMTBVT2NreiszaEdMWGp1?=
 =?utf-8?B?ajdEMlhVRSsxMFF4TjFTVnIrRm5iUHNRQURMMzcvbEF6OVlJSW5ZcThRS1dQ?=
 =?utf-8?B?T1dGY3d1VlBZVkdjNTc3R0lLbUxMaXdmMy9oR3Q5UVE5R3oxWVJnSFZGdHBy?=
 =?utf-8?B?OTFkT3VuSktwWXlBdXp5aTZFdUh5LzhORlY0Z2tOWnBGSXpiYURhcXZvVnNu?=
 =?utf-8?B?RGFYbVFtb20xVjRxdVF3UERqQ0ZvejVxaFFQbjJmWVVtMWgrZXRFdDArVSt2?=
 =?utf-8?B?RnNpUVNRT0s2ejdGYW05L2NXa3pLQ2FQQWdrWjhkZzgyRXJRcGNDWnlHaFlp?=
 =?utf-8?B?WHFyVGFhdmdxTGtXejlTM0xxT3BiKzVIT2VtUTgyTzlFQ29jRmJMdjVQbmRH?=
 =?utf-8?B?OHZHQUd0OTFxc0RIWEZDNVpuaGhjalMzRHd3cENOdmY3SG9BTmljalZZRWtm?=
 =?utf-8?B?MW56aXl4Y1h1UjVtWkF2VVpPL0FsODRXVjIwWk9mSENUOVJEV21iT09oQzZQ?=
 =?utf-8?B?MG1ZNkZ3dWQwY0kvL042NWZuZlhVdjU1TmRMWW9tODgrZklQQXJiZEcyZUdk?=
 =?utf-8?B?L2QxaXI3L1NXQ1J0dVdFSnNTWnpLY003cnpxWW5sZURjZERUZVRESzlBQ2tj?=
 =?utf-8?B?Umwwc00wR2lxTWJISFJ5U3hoaVdzUlFQaW1KZFRFWFlyamk4dHVocjV0WGNl?=
 =?utf-8?B?QUFpcE5xc29PeDNiZ09kVjRFS1BNVDRuUWR6eFZyOG5BeE1ORzlEVG14eHQ5?=
 =?utf-8?B?aUdFVU1UZ0l4UUNpUFdRZ1JYY1hYbUpERG9DaWpKT1NhOEpOSXdvcncwVnFt?=
 =?utf-8?B?ZitLK0o0bXY1S0ZvSlhRTU5zblhRc3pmV1lUTFRrL1UrUHNKLzRaZ0tScUlv?=
 =?utf-8?B?MjFCU2RZcVAwM2R2bWx5SGtHWXVGazhxZmV3NC90RXFxQTlCbWVLOWc1b1gr?=
 =?utf-8?B?V2J6amJGaUZCNDBLLzEyeDg5eVdMTzREREJHS1ZTMzBDTnZFbW1YbTFwWG03?=
 =?utf-8?B?WWIwNGVvRW1qMnlUOTdwdDZTaWR1M3d2M29ja3k5R1puT3ZNQ2pDYnlwMlhq?=
 =?utf-8?B?YzhkbWR0S1J1SnlDdzlOOTE4aUxDZVpSTVM2S3pTbnVwbktPSEZLdDVBcGRG?=
 =?utf-8?Q?yIPcCbuHPSNmtyLcZeHz0b2hBKZudC29?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7682.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a1pKWTkvZWFoZlRYbWVSRkt5NmRjNC9VQlhwNnBLOCtQalk4ajFoU05ZV21J?=
 =?utf-8?B?ZmZOU3ZtT1laMVU2aW1ORk8wdzlqR0w1M0p5dE1NL3lEY3ZVRnVQWjQxVTY3?=
 =?utf-8?B?andweFFSMWhiRGNuV3FiK0VCaTZQclYyVUlyV2FDVFliblZEUEZONitaOXB0?=
 =?utf-8?B?SG1xS2RhMWdhN0VZdkxBZEdxNnh5cXQ2WlFFVmZOVmJtTFIyOXoyVlRYZUhp?=
 =?utf-8?B?NFdVNngxaUxjbVVsLzAvNkRhbWxSTDlUQVNEM2F5VC9HeGN3a0JralZSZkJD?=
 =?utf-8?B?dm0wYlBhOUkrY0VpaFRBU3VGUlAxOHIrR082S3h4cWF6NFREMkpYNUNZQmVk?=
 =?utf-8?B?SzZGNmlhSjMveHVER3NSczY4SzZhY01qRUtzM01Gd1RqeDhkZDhLRUkxU2o4?=
 =?utf-8?B?VEVYMWRvYVI1aThuNnpoQ001ZXJtdjVoOGg0OFhUWkdOYThSTWtTTnFESkNZ?=
 =?utf-8?B?NEUyTFBvdmpsVVBwbWlZenI4MEh6aE1lVDZWSGh6Nm5WU204NmZyblVvc1Nw?=
 =?utf-8?B?aGNNdzlXOE5HeEt6aWNUZlMydDdqbEFLUWdLYUEwQ05telhObnZheE15bDQ2?=
 =?utf-8?B?L0ZxTjhPZGwvUElVQ1ZxWWh0T0hkb1lMMkRDQXljeGdjMDlIQzRSVjRuSmpq?=
 =?utf-8?B?emFMYUc2TUY4QUc0QXBOZXd0MUtqZW9EWVoxenkrNTFjUVNQeWpCRG9TVkxB?=
 =?utf-8?B?T2lKYXFZZXBlV2pqTzZUaUp1NHpUVXMxSE41OFBUSm9UdEpycUVwczJqa1ZR?=
 =?utf-8?B?bHZXYzR4QWxLeHo2Y1hjR0loSit2cTVONXdrRy9NTlFUYVJHdUJKeTVwZFIw?=
 =?utf-8?B?Z0YwTWVFeUNuVXlFdUNKQ2t0MjFDSUtiMW9LTExEc3ZzRDlTSENTNVV4K3I3?=
 =?utf-8?B?TExBTGRkZlZIWjZ6WVpJanNoYzkyZW5zcThRbDlOQVZtRnViOElibFExTFI4?=
 =?utf-8?B?WUVJdldiZzYwUFYxWmtyZmZCR3VDKzRpOGsvRlgwSnRwVTR6M1dONFIrOTNm?=
 =?utf-8?B?NENZa01HWitiS21zQVk3aWtoMVpHUzVHYUVKSjRqcWlaM3I4cktDNjdxSVM3?=
 =?utf-8?B?bkVoVXV4aVJiU1QvcXRJTzFUNldNRnhhQ2YxN0tOUlh0TGp1RDA5bzgveFZU?=
 =?utf-8?B?RnRHNnJVS3ViWnU5Y1k3TDdoeEgvUGRRV205M3hXckF1ZjBablFEaS92djg2?=
 =?utf-8?B?Zkp3MS9tWDBVUHZJOVVaV3NYRHd5ZlVZWDMzazZPRW5SMk9Ud2VRaC9yUGx6?=
 =?utf-8?B?TFZ0QjR6Qnpla3hmUHNzSEsyK1Vzbm02YUxwRjlSVUtJVU0yaGxvRTR0VkFv?=
 =?utf-8?B?am13Y2JENVg4SklSM3BoSUVlUG44UHNRa091MFBTaE9pbHcwMEw4NXlUNU9a?=
 =?utf-8?B?RlhHbitRMjhiTVVhUlgrNG5QMUh0Rlh6cC85N2JWN0JMeXNuN1FPVW1UWTZ6?=
 =?utf-8?B?ZlZBMytDRDhkOXArRk9HL3NCL01CcDkzaHZvYkZOOU0yVE9wWmgvMGpqM2M3?=
 =?utf-8?B?ekpNZ3gxVERyQ0lEMDRNNlg4cGUvV2ptR1VvV1Q0TFk4ZGxnMjZFd29VMzZS?=
 =?utf-8?B?TmhQaXZLUGcwWFR5MGpDNWJXQnpyUldiRzdYQ1IyWEYwdUhZclV1endzVW9y?=
 =?utf-8?B?SHNWeWpWZUpaa3dIbWJQZTNaNXZSSE4rdXlwZ0t1WEJpTGFXcGxGMkJrVDQw?=
 =?utf-8?B?azc2QitLM0x1NzdlL3NRcGxvMEdCTVp4Ull2MG84MzlFMkpyYkNCZ0pZbUNX?=
 =?utf-8?B?Y1ZDVGxVV2dwdkJscWllUzN0bm5udERsLzgxUXE5enBjeDhnelFubXNIaTVS?=
 =?utf-8?B?Ym1CSTRtRGxnVUE1Y1d6QVVzTDhFVjdGb1hFWlh2TkNhYk9KMGsxc3A0WWt6?=
 =?utf-8?B?cXBKYmw3Z29ZbVU5WmMrYkIwL1RsTWV3bmVUZ1NuU0hFclFoSlNpdkk2Q2Qw?=
 =?utf-8?B?aitSVDlrVmZJc2dhNjRUM1FBcUNuVEs4MVZEMVhWajMrWFVYL0dacVErdHcr?=
 =?utf-8?B?OVlOTms4WkNRcHJhMXh6RituRXZLS21yS1lGN2lvdCtKK1JkeFZtU00xWXo0?=
 =?utf-8?B?SUZYYTFQNTNzWDRiNnR2UmNRTUtMTVdzSWVkTEhWWlp0QnFPVVM5Z1RsdWgr?=
 =?utf-8?B?WnZ5WWV6Y0FxTlcrNXRHU0swWVZTS0M4SktZTkdTWlNkQTFGUUZqNWN3ZHQv?=
 =?utf-8?B?WEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9B1CD03066645B489DE18DA8EC64C5E7@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 792b997f-128d-4792-b9d5-08dd3a8d5b80
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2025 02:34:55.5871
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mZRkIzJOum9cqbk9UXTSvurxyghB4v8j7hQrlihddcXUOIaI8xsjroUC5v8uWMwAsRKDfP78emxidXrjYgcgnNxMu46zqevmn3ZqEzJ7gn0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7172

SGkgSmFzc2ksCgpUaGFua3MgZm9yIHRoZSByZXZpZXdzLgoKW3NuaXBdCgoKPiA+ID4gPiBkaWZm
IC0tZ2l0IGEvaW5jbHVkZS9kdC1iaW5kaW5ncy9tYWlsYm94L21lZGlhdGVrLG10ODE5Ni1nY2Uu
aAo+ID4gPiA+IGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9tYWlsYm94L21lZGlhdGVrLG10ODE5Ni1n
Y2UuaAo+ID4gPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiA+ID4gaW5kZXggMDAwMDAwMDAw
MDAwLi45ZTA3MDAyMzYwMzMKPiA+ID4gPiAtLS0gL2Rldi9udWxsCj4gPiA+ID4gKysrIGIvaW5j
bHVkZS9kdC1iaW5kaW5ncy9tYWlsYm94L21lZGlhdGVrLG10ODE5Ni1nY2UuaAoKRnJvbSB0aGUg
cHJldmlvdXMgZGlzY3Vzc2lvbiB3aXRoIEtyenlzenRvZjoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvYWxsLzQyZGVmNjgyMDBiMjhiNWJlYTNjYmYwOTE5MDczNDM5NzY0ODIxMzIuY2FtZWxAbWVk
aWF0ZWsuY29tLwoKV2UnbGwgZHJvcCB0aGlzIGR0LWJpbmRpbmcgaGVhZGVyLCBhZCBtb3ZlIGl0
IHRvIHRoZSBkdHMgZm9sZGVyLgoKPiA+ID4gPiBAQCAtMCwwICsxLDE0MTUgQEAKPiA+ID4gCj4g
PiA+IDE0MTUgP8KgIDkwJSBzZWVtIHVubmVjZXNzYXJ5Lgo+ID4gPiAKPiA+ID4gPiArCj4gPiA+
ID4gKy8qIEdDRSB0aHJlYWQgcHJpb3JpdHkgKi8KPiA+ID4gPiArI2RlZmluZSBDTURRX1RIUl9Q
UklPX0xPV0VTVMKgwqAgMAo+ID4gPiA+ICsjZGVmaW5lIENNRFFfVEhSX1BSSU9fMcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAxCj4gPiA+ID4gKyNkZWZpbmUgQ01EUV9USFJfUFJJT18y
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDIKPiA+ID4gPiArI2RlZmluZSBDTURRX1RI
Ul9QUklPXzPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMwo+ID4gPiA+ICsjZGVmaW5l
IENNRFFfVEhSX1BSSU9fNMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA0Cj4gPiA+ID4g
KyNkZWZpbmUgQ01EUV9USFJfUFJJT181wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDUK
PiA+ID4gPiArI2RlZmluZSBDTURRX1RIUl9QUklPXzbCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgNgo+ID4gPiA+ICsjZGVmaW5lIENNRFFfVEhSX1BSSU9fSElHSEVTVMKgIDcKPiA+ID4g
PiAKPiA+ID4gwqBPbmx5IG5lZWQgdG8gSElHSEVTVCBtYXliZQo+ID4gCj4gPiBPciBtYXliZSB3
ZSBjb3VsZCBqdXN0IGdldCByaWQgb2YgdGhlbSBhbmQgZGVzY3JpYmUgdGhlIHZhbGlkCj4gPiB2
YWx1ZXMKPiA+IGFuZCBvcmRlcmluZyBpbiB0aGUgWUFNTCBwYXJ0PwoKQnV0IGFjdHVhbGx5LCBl
dmVuIGlmIHdlIGRlc2NyaWJlIHRoaXMgaW4gdGhlIFlBTUwsIG1vc3Qgb2YgdGhlIEdDRQp1c2Vy
cyBzdGlsbCB3b24ndCBrbm93IHdoYXQgaXMgdGhlIG1lYW5pbmcgb2YgZWFjaCBtYm94LWNlbGxz
LgoKU28gSSB0aGluayBpZiB3ZSBjYW4ga2VlcCB0aGVzZSBkZWZpbmUgdG8gbWFrZSBkdHMgbW9y
ZSByZWFkYWJsZS4KV2hhdCBkbyB5b3UgdGhpbms/Cgo+ID4gCj4gPiA+ID4gKwo+ID4gPiA+ICsv
KiBHQ0Ugc3Vic3lzIHRhYmxlICovCj4gPiA+ID4gKyNkZWZpbmUgU1VCU1lTXzEzMDBYWFhYwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDAKPiA+ID4gPiArI2RlZmluZSBTVUJTWVNfMTQw
MFhYWFjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMQo+ID4gPiA+ICsjZGVmaW5lIFNV
QlNZU18xNDAxWFhYWMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAyCj4gPiA+ID4gKyNk
ZWZpbmUgU1VCU1lTXzE0MDJYWFhYwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDMKPiA+
ID4gPiArI2RlZmluZSBTVUJTWVNfMTUwMlhYWFjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgNAo+ID4gPiA+ICsjZGVmaW5lIFNVQlNZU18xODgwWFhYWMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCA1Cj4gPiA+ID4gKyNkZWZpbmUgU1VCU1lTXzE4ODFYWFhYwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIDYKPiA+ID4gPiArI2RlZmluZSBTVUJTWVNfMTg4MlhYWFjCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgNwo+ID4gPiA+ICsjZGVmaW5lIFNVQlNZU18xODgz
WFhYWMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA4Cj4gPiA+ID4gKyNkZWZpbmUgU1VC
U1lTXzE4ODRYWFhYwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDkKPiA+ID4gPiArI2Rl
ZmluZSBTVUJTWVNfMTAwMFhYWFjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMTAKPiA+
ID4gPiArI2RlZmluZSBTVUJTWVNfMTAwMVhYWFjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgMTEKPiA+ID4gPiArI2RlZmluZSBTVUJTWVNfMTAwMlhYWFjCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgMTIKPiA+ID4gPiArI2RlZmluZSBTVUJTWVNfMTAwM1hYWFjCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgMTMKPiA+ID4gPiArI2RlZmluZSBTVUJTWVNfMTAwNFhYWFjC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMTQKPiA+ID4gPiArI2RlZmluZSBTVUJTWVNf
MTAwNVhYWFjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMTUKPiA+ID4gPiArI2RlZmlu
ZSBTVUJTWVNfMTAyMFhYWFjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMTYKPiA+ID4g
PiArI2RlZmluZSBTVUJTWVNfMTAyOFhYWFjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
MTcKPiA+ID4gPiArI2RlZmluZSBTVUJTWVNfMTcwMFhYWFjCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgMTgKPiA+ID4gPiArI2RlZmluZSBTVUJTWVNfMTcwMVhYWFjCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgMTkKPiA+ID4gPiArI2RlZmluZSBTVUJTWVNfMTcwMlhYWFjCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMjAKPiA+ID4gPiArI2RlZmluZSBTVUJTWVNfMTcw
M1hYWFjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMjEKPiA+ID4gPiArI2RlZmluZSBT
VUJTWVNfMTgwMFhYWFjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMjIKPiA+ID4gPiAr
I2RlZmluZSBTVUJTWVNfMTgwMVhYWFjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMjMK
PiA+ID4gPiArI2RlZmluZSBTVUJTWVNfMTgwMlhYWFjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgMjQKPiA+ID4gPiArI2RlZmluZSBTVUJTWVNfMTgwNFhYWFjCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgMjUKPiA+ID4gPiArI2RlZmluZSBTVUJTWVNfMTgwNVhYWFjCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMjYKPiA+ID4gPiArI2RlZmluZSBTVUJTWVNfMTgwOFhY
WFjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMjcKPiA+ID4gPiArI2RlZmluZSBTVUJT
WVNfMTgwYVhYWFjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMjgKPiA+ID4gPiArI2Rl
ZmluZSBTVUJTWVNfMTgwYlhYWFjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMjkKPiA+
ID4gPiArI2RlZmluZSBTVUJTWVNfTk9fU1VQUE9SVMKgwqDCoMKgwqAgOTkKPiA+ID4gPiArCj4g
PiA+IEtlZXAgb25seSB0aGF0IHlvdSB1c2Ugbm93IG9yIHBsYW4gaW7CoCB0aGUgbmVhciBmdXR1
cmUuIEJ1dCBvay4KCkkgdGhpbmsgd2UgY2FuIGRyb3AgdGhpcyBpbiBNVDgxOTYgYmVjYXVzZSBH
Q0UgaGFyZHdhcmUgZGVzaWduZXIgZGlkbid0CmNoYW5nZSB0aGVzZSBzdWJzeXMgaWQgZnJvbSB0
aGUgcHJldmlvdXMgU29Dcy4KCkFsbW9zdCBhbGwgb2YgdGhlIGRldmljZSByZWdpc3RlciBhcmUg
b3ZlciAweDMwMDBfMDAwMCwgc28gaXQncyBubwpsb25nZXIgdG8gdXNlIGluIE1UODE5Ni4KCj4g
PiA+IAo+ID4gPiA+ICsvKiBHQ0UtRCBoYXJkd2FyZSBldmVudHMgKi8KPiA+ID4gPiArI2RlZmlu
ZQo+ID4gPiA+IENNRFFfRVZFTlRfRElTUDBfU1RSRUFNX1NPRjDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgCj4gPiA+
ID4gwqDCoMKgwqDCoMKgwqAgMAo+ID4gPiA+ICsjZGVmaW5lCj4gPiA+ID4gQ01EUV9FVkVOVF9E
SVNQMF9TVFJFQU1fU09GMcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAKPiA+ID4gPiDCoMKgwqDCoMKgwqDCoCAxCj4g
PiA+ID4gKyNkZWZpbmUKPiA+ID4gPiBDTURRX0VWRU5UX0RJU1AwX1NUUkVBTV9TT0YywqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoAo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgIDIKPiA+ID4gPiArI2RlZmluZQo+ID4gPiA+
IENNRFFfRVZFTlRfRElTUDBfU1RSRUFNX1NPRjPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgCj4gPiA+ID4gwqDCoMKg
wqDCoMKgwqAgMwo+ID4gPiA+ICsjZGVmaW5lCj4gPiA+ID4gQ01EUV9FVkVOVF9ESVNQMF9TVFJF
QU1fU09GNMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAKPiA+ID4gPiDCoMKgwqDCoMKgwqDCoCA0Cj4gPiA+ID4gKyNk
ZWZpbmUKPiA+ID4gPiBDTURRX0VWRU5UX0RJU1AwX1NUUkVBTV9TT0Y1wqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoAo+
ID4gPiA+IMKgwqDCoMKgwqDCoMKgIDUKPiA+ID4gPiArI2RlZmluZQo+ID4gPiA+IENNRFFfRVZF
TlRfRElTUDBfU1RSRUFNX1NPRjbCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqAg
Ngo+ID4gPiA+ICsjZGVmaW5lCj4gPiA+ID4gQ01EUV9FVkVOVF9ESVNQMF9TVFJFQU1fU09GN8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAKPiA+ID4gPiDCoMKgwqDCoMKgwqDCoCA3Cj4gPiA+ID4gKyNkZWZpbmUKPiA+
ID4gPiBDTURRX0VWRU5UX0RJU1AwX1NUUkVBTV9TT0Y4wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoAo+ID4gPiA+IMKg
wqDCoMKgwqDCoMKgIDgKPiA+ID4gPiArI2RlZmluZQo+ID4gPiA+IENNRFFfRVZFTlRfRElTUDBf
U1RSRUFNX1NPRjnCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqAgOQo+ID4gPiA+
ICsjZGVmaW5lCj4gPiA+ID4gQ01EUV9FVkVOVF9ESVNQMF9TVFJFQU1fU09GMTDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oAo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgIDEwCj4gPiA+ID4gKyNkZWZpbmUKPiA+ID4gPiBDTURR
X0VWRU5UX0RJU1AwX1NUUkVBTV9TT0YxMcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgCj4gPiA+ID4gwqDCoMKgwqDCoMKg
wqAgMTEKPiA+ID4gPiArI2RlZmluZQo+ID4gPiA+IENNRFFfRVZFTlRfRElTUDBfU1RSRUFNX1NP
RjEywqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAKPiA+ID4gPiDCoMKgwqDCoMKgwqDCoCAxMgo+ID4gPiA+ICsjZGVmaW5l
Cj4gPiA+ID4gQ01EUV9FVkVOVF9ESVNQMF9TVFJFQU1fU09GMTPCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoAo+ID4gPiA+
IMKgwqDCoMKgwqDCoMKgIDEzCj4gPiA+ID4gKyNkZWZpbmUKPiA+ID4gPiBDTURRX0VWRU5UX0RJ
U1AwX1NUUkVBTV9TT0YxNMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqAgMTQKPiA+
ID4gPiArI2RlZmluZQo+ID4gPiA+IENNRFFfRVZFTlRfRElTUDBfU1RSRUFNX1NPRjE1wqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAKPiA+ID4gPiDCoMKgwqDCoMKgwqDCoCAxNQo+ID4gPiA+IAo+ID4gPiDCoHlvdSBtZWFu
Cj4gPiA+IMKgICNkZWZpbmUgQ01EUV9FVkVOVF9ESVNQMF9TVFJFQU1fU09GKG4pwqAgbgoKWWVz
LCBpdCdzIHRoZSBzYW1lIG1lYW5pbmcuCgpbc25pcF0KCj4gPiA+ID4gKyNkZWZpbmUKPiA+ID4g
PiBDTURRX0VWRU5UX0RJU1AwX0RJU1BfV0RNQTBfVEFSR0VUX0xJTkVfRU5EX0VOR19FVkVOVMKg
wqDCoMKgwqDCoMKgwqDCoMKgCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqAgMzIKPiA+ID4gPiArI2Rl
ZmluZQo+ID4gPiA+IENNRFFfRVZFTlRfRElTUDBfRElTUF9XRE1BMF9TV19SU1RfRE9ORV9FTkdf
RVZFTlTCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqAg
MzMKPiA+ID4gPiArI2RlZmluZQo+ID4gPiA+IENNRFFfRVZFTlRfRElTUDBfRElTUF9QT1NUTUFT
SzFfUlNUX0RPTkVfRU5HX0VWRU5UwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAKPiA+ID4gPiDC
oMKgwqDCoMKgwqDCoCAzNAo+ID4gPiA+ICsjZGVmaW5lCj4gPiA+ID4gQ01EUV9FVkVOVF9ESVNQ
MF9ESVNQX1BPU1RNQVNLMF9SU1RfRE9ORV9FTkdfRVZFTlTCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoAo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgIDM1Cj4gPiA+ID4gKyNkZWZpbmUKPiA+ID4gPiBD
TURRX0VWRU5UX0RJU1AwX0RJU1BfTVVURVgwX1RJTUVPVVRfRU5HX0VWRU5UwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoAo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgIDM2Cj4gPiA+ID4g
KyNkZWZpbmUKPiA+ID4gPiBDTURRX0VWRU5UX0RJU1AwX0RJU1BfTVVURVgwX1JFR19VUERBVEVf
RU5HX0VWRU5UMMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgCj4gPiA+ID4gwqDCoMKgwqDCoMKg
wqAgMzcKPiA+ID4gPiArI2RlZmluZQo+ID4gPiA+IENNRFFfRVZFTlRfRElTUDBfRElTUF9NVVRF
WDBfUkVHX1VQREFURV9FTkdfRVZFTlQxwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAKPiA+ID4g
PiDCoMKgwqDCoMKgwqDCoCAzOAo+ID4gPiA+ICsjZGVmaW5lCj4gPiA+ID4gQ01EUV9FVkVOVF9E
SVNQMF9ESVNQX01VVEVYMF9SRUdfVVBEQVRFX0VOR19FVkVOVDLCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoAo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgIDM5Cj4gPiA+ID4gKyNkZWZpbmUKPiA+ID4g
PiBDTURRX0VWRU5UX0RJU1AwX0RJU1BfTVVURVgwX1JFR19VUERBVEVfRU5HX0VWRU5UM8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqAgNDAKPiA+ID4gPiAr
I2RlZmluZQo+ID4gPiA+IENNRFFfRVZFTlRfRElTUDBfRElTUF9NVVRFWDBfUkVHX1VQREFURV9F
TkdfRVZFTlQ0wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAKPiA+ID4gPiDCoMKgwqDCoMKgwqDC
oCA0MQo+ID4gPiA+ICsjZGVmaW5lCj4gPiA+ID4gQ01EUV9FVkVOVF9ESVNQMF9ESVNQX01VVEVY
MF9SRUdfVVBEQVRFX0VOR19FVkVOVDXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoAo+ID4gPiA+
IMKgwqDCoMKgwqDCoMKgIDQyCj4gPiA+ID4gKyNkZWZpbmUKPiA+ID4gPiBDTURRX0VWRU5UX0RJ
U1AwX0RJU1BfTVVURVgwX1JFR19VUERBVEVfRU5HX0VWRU5UNsKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqAgNDMKPiA+ID4gPiArI2RlZmluZQo+ID4gPiA+
IENNRFFfRVZFTlRfRElTUDBfRElTUF9NVVRFWDBfUkVHX1VQREFURV9FTkdfRVZFTlQ3wqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAKPiA+ID4gPiDCoMKgwqDCoMKgwqDCoCA0NAo+ID4gPiA+ICsj
ZGVmaW5lCj4gPiA+ID4gQ01EUV9FVkVOVF9ESVNQMF9ESVNQX01VVEVYMF9SRUdfVVBEQVRFX0VO
R19FVkVOVDjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoAo+ID4gPiA+IMKgwqDCoMKgwqDCoMKg
IDQ1Cj4gPiA+ID4gKyNkZWZpbmUKPiA+ID4gPiBDTURRX0VWRU5UX0RJU1AwX0RJU1BfTVVURVgw
X1JFR19VUERBVEVfRU5HX0VWRU5UOcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgCj4gPiA+ID4g
wqDCoMKgwqDCoMKgwqAgNDYKPiA+ID4gPiArI2RlZmluZQo+ID4gPiA+IENNRFFfRVZFTlRfRElT
UDBfRElTUF9NVVRFWDBfUkVHX1VQREFURV9FTkdfRVZFTlQxMMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoAo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgIDQ3Cj4gPiA+ID4gKyNkZWZpbmUKPiA+ID4gPiBD
TURRX0VWRU5UX0RJU1AwX0RJU1BfTVVURVgwX1JFR19VUERBVEVfRU5HX0VWRU5UMTHCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAKPiA+ID4gPiDCoMKgwqDCoMKgwqDCoCA0OAo+ID4gPiA+ICsjZGVm
aW5lCj4gPiA+ID4gQ01EUV9FVkVOVF9ESVNQMF9ESVNQX01VVEVYMF9SRUdfVVBEQVRFX0VOR19F
VkVOVDEywqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqAgNDkK
PiA+ID4gPiArI2RlZmluZQo+ID4gPiA+IENNRFFfRVZFTlRfRElTUDBfRElTUF9NVVRFWDBfUkVH
X1VQREFURV9FTkdfRVZFTlQxM8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoAo+ID4gPiA+IMKgwqDC
oMKgwqDCoMKgIDUwCj4gPiA+ID4gKyNkZWZpbmUKPiA+ID4gPiBDTURRX0VWRU5UX0RJU1AwX0RJ
U1BfTVVURVgwX1JFR19VUERBVEVfRU5HX0VWRU5UMTTCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAK
PiA+ID4gPiDCoMKgwqDCoMKgwqDCoCA1MQo+ID4gPiA+ICsjZGVmaW5lCj4gPiA+ID4gQ01EUV9F
VkVOVF9ESVNQMF9ESVNQX01VVEVYMF9SRUdfVVBEQVRFX0VOR19FVkVOVDE1wqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqAgNTIKPiA+ID4gPiArI2RlZmluZQo+
ID4gPiA+IENNRFFfRVZFTlRfRElTUDBfRElTUF9NVVRFWDBfR0VUX1JFTEVBU0VfRU5HX0VWRU5U
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAKPiA+ID4gPiDCoMKgwqDCoMKgwqDCoCA1Mwo+ID4g
PiA+ICsjZGVmaW5lCj4gPiA+ID4gQ01EUV9FVkVOVF9ESVNQMF9ESVNQX01EUF9SRE1BMF9TV19S
U1RfRE9ORV9FTkdfRVZFTlTCoMKgwqDCoMKgwqDCoMKgwqDCoAo+ID4gPiA+IMKgwqDCoMKgwqDC
oMKgIDU0Cj4gPiA+ID4gKwo+ID4gPiDCoGtlZXAgb25seSB0aGUgdXNlZCBvbmVzIGFuZCB1c2UK
PiA+IAo+ID4gVGhpcyBpcyB0aGUgb25seSBwdWJsaWNseSBhdmFpbGFibGUgdGFibGUgb2YgdGhl
IG51bWJlcnMuIEhhdmluZwo+ID4gdGhlIGNvbXBsZXRlIHRhYmxlIHNvbWV3aGVyZSB3b3VsZCBi
ZSBuaWNlLiBPT1RIIHRoZSBudW1iZXJzIGJlaW5nCj4gPiBsaWtlIElSUSBvciBEUlEgbnVtYmVy
cywgZG9uJ3QgYWN0dWFsbHkgZ2V0IHVzZWQgaW4gdGhlIGRyaXZlci4KPiA+IFNvIG1heWJlIHdl
IGNvdWxkIGtlZXAgdGhlIGZ1bGwgbGlzdCBidXQgbW92ZSBpdCB1bmRlciB0aGUgZHRzCj4gPiBk
aXJlY3Rvcnk/Cj4gPiAKPiBXaHkgaW50cm9kdWNlIGJsb2F0IGluIHRoZSBrZXJuZWw/IFdlIHNo
b3VsZG4ndCBiZSBjYXJyeWluZyB3aGF0IGFyZQo+IGJhc2ljYWxseSAnYWRkaXRpb24nIHRhYmxl
cywgbm90IGV2ZW4gJ211bHRpcGxpY2F0aW9uJyA7KQo+IFRoZSBzYW1lIGtub3dsZWRnZSBjYW4g
YmUgcmVwcmVzZW50ZWQgY29uY2lzZWx5IGJ5IHRoZSBmb3JtdWxhCj4gwqAgI2RlZmluZSBDTURR
X0VWRU5UX0RJU1AwX0RJU1BfTVVURVgwX1JFR19VUERBVEVfRU5HX0VWRU5UKG4pwqAgKG4gKwo+
IDM3KQo+IGVzcGVjaWFsbHkgZm9yIH41MCBjaGFyIGRlZmluZXMKPiAKPiB0aG54CgpJIGFncmVl
IHdpdGggeW91LCBJJ2xsIHNpbXBsaWZ5IHRoZSBkZWZpbmUgd2l0aCBwb3N0LWZpeGVkIG51bWJl
cnMsIGFuZAptb3ZlIGl0IHRvIGR0cyBmb2xkZXIgb25jZSB0aGUgbXQ4MTk2LmR0c2kgd2l0aCBn
Y2Ugbm9kZSBpcyBzdWJtaXR0ZWQuCgpUaGFua3MgZm9yIHlvdXIgc3VnZ2VzdGlvbi4KClJlZ2Fy
ZHMsCkphc29uLUpIIExpbgo=

