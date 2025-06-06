Return-Path: <linux-media+bounces-34177-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF35ACFB56
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 04:45:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B244E3AF530
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 02:45:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 164E41DE4EF;
	Fri,  6 Jun 2025 02:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="h/LhkOmZ";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="NP2d1TLH"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7413014D70E;
	Fri,  6 Jun 2025 02:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749177919; cv=fail; b=gBpseG0EXLay1UZ+p41FVl2hy3cXKbAbVNlS0fSNgZ+oeWuGTGc5OrCrCi1MUfw5VNSQBpG6IcV4QoHGi2eAOZAuDP2oDgIizrdVCSQyRap0XHejNRbs59Qx+PRXg8rt0/WDy5XxkPUeLTpdqMfTWTny3Z84M87uRhBE8DbSdlc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749177919; c=relaxed/simple;
	bh=XFs96Qop7m3EiUZunaDwBYuV/wUy3M0QXLN6SENvmI0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qRjwq0yg6rlejq8+yNoouaqU7+h6royZy1l/IR+i1N5Y+/JQ9Pmm09Nn1KHZNBohxic8kqOH+0oiK3Cg9fbsCx/FywK69e8ffGSMdkpOPKHkwO+l7UJ2cNYmhMfuybrcyCI8emjMD1e/YPPbBdAAQfTUA6+N8AztAip4rmq7A04=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=h/LhkOmZ; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=NP2d1TLH; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 43a5aeea428011f0b33aeb1e7f16c2b6-20250606
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=XFs96Qop7m3EiUZunaDwBYuV/wUy3M0QXLN6SENvmI0=;
	b=h/LhkOmZvr1x7XPhKMdxCNWgJUWv5MUy9GN31E2TQtjUO4ceJrDZl2gmxGg1m9hpswRUfC0XG+5TMUYQ77ZJupjWtUtdc0rwZuiPwvEratU/7e77fzSu2rPoEhjT93sYm+zTVEhTnxthgaYgZcQiSamCEbGsNOoTkZv4hpbrs98=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:3abae4bf-02c5-434e-8b06-7c301b26aa58,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:1caeb281-ef30-4982-a001-67a9a83f2fda,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:80|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 43a5aeea428011f0b33aeb1e7f16c2b6-20250606
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1291665572; Fri, 06 Jun 2025 10:45:10 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 6 Jun 2025 10:45:09 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 6 Jun 2025 10:45:09 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FzwElLLicR9BuqF62BZDZGMnO/h1pkrGtJT97TOM7dT3a3HxbOPjzRdoFpOkJtpr/5yL/I2IgKGuguoW+TGb5JJHV3CdTdlwYVmI7VC3/Ufs3KNrYvVSLNXeRaL1kiidean8OLedfrwhT7UqCwirjLU/f66BpVX9XMH/tNkrDw/vF1HkM1fpLipl0AVC1Pp8YZMVbHP4jFmv23LmZPQRjE1TYI2ovYXzCed9LYJr18m1LysR1J0e7MMr0wc/f9vG91T98Rc3YqfgEQuzSAn1Dddy4GlRjXSGmV6be8N4TFme1z5nrzhr62lrDRTF3z+657iUj5r7bQTxiwDfRAgMfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XFs96Qop7m3EiUZunaDwBYuV/wUy3M0QXLN6SENvmI0=;
 b=QGCA9bmQh9bzbJQWI7YmxTs+GibJd8gmrNc8/l1fPWXr/1JG342u+qr+WH36fh3UJeem7MW0oiGHiFp1rzlKDcrgC5PDrWjoGzrj7EPbPNQt5yaWPAy3p7gFgSBWmjJF0+qPe8ppZpjHFrKG6OTUj7S4WGBMEwaoCpQ6MXcsZSEDaQ0qbOhx/BSbDaQ2BJ4cUge+D49LSU5os+5XSOIUMZWlCwSqFiGVIqh6AigWdiNUt7jeCgjNNp7R1XLOGseX4LRe3g3Jnluhv5eSxmp1wX6/dIjulBfHRcYB9ssVbKu0jzCop4gwHtLM4CmaZRpI+LAvcEKRnwdJhftIOVezJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XFs96Qop7m3EiUZunaDwBYuV/wUy3M0QXLN6SENvmI0=;
 b=NP2d1TLHTxddBhFRWRA2KIotjJYGBw+CbKQvaDvsub4AuAsP9pmcw4b8yPWimeOsRYbbDJobGPV5cH8rf6YkeKiKfMo+CeakJGfEXgQ9ZX4DWP3LQ1THFWKDW4WxZFdANgENcPd8Iut4A3zFvMP8pzjSE1Q0exWjHvKgKWUYRGo=
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com (2603:1096:301:b9::5)
 by SI6PR03MB8654.apcprd03.prod.outlook.com (2603:1096:4:24c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Fri, 6 Jun
 2025 02:45:07 +0000
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::7b22:91f6:b76e:161c]) by PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::7b22:91f6:b76e:161c%6]) with mapi id 15.20.8813.020; Fri, 6 Jun 2025
 02:45:07 +0000
From: =?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>
To: "nicolas@ndufresne.ca" <nicolas@ndufresne.ca>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"mchehab@kernel.org" <mchehab@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: "srv_heupstream@mediatek.com" <srv_heupstream@mediatek.com>
Subject: Re: [PATCH v5 00/12] Enable jpeg enc & dec multi-hardwares for MT8196
Thread-Topic: [PATCH v5 00/12] Enable jpeg enc & dec multi-hardwares for
 MT8196
Thread-Index: AQHb0TbNl8fv4rHJkUaCXj0mYEWUbbPrcuoAgAoErIA=
Date: Fri, 6 Jun 2025 02:45:06 +0000
Message-ID: <0aec8241ae5c50c95073fe45c5cce95d544062c8.camel@mediatek.com>
References: <20250530074537.26338-1-kyrie.wu@mediatek.com>
	 <23ace820d130e5d18c599d29e960652be49e1457.camel@ndufresne.ca>
In-Reply-To: <23ace820d130e5d18c599d29e960652be49e1457.camel@ndufresne.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR03MB6186:EE_|SI6PR03MB8654:EE_
x-ms-office365-filtering-correlation-id: 4fa4f93e-0672-4ef5-2b30-08dda4a425a7
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|921020|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RGY5UVMyTUx3VHYzM2lFYk1sM3JlVmZ0OG9pRUVzbktFeXJBc2VpaXRGcHhP?=
 =?utf-8?B?elFibERQRGhXNFV2NEl1b08ycUJQcVY0VWtzUlVDNTl4RU9WbFhqN2RJcS9l?=
 =?utf-8?B?Y0ZZM2xvS3BMYnVyb2t2b1dDZUhrY29DZVBHdkNDQjN6SWxoVms4QTJhWEhm?=
 =?utf-8?B?ZktrdnJtSFhwRm5hbitGQ0JyemNPS3Q3UU9LNFF3SkZEVk51UmpCU0NDUjUz?=
 =?utf-8?B?elNGMFBKdXFvZ25wa09kMG9GcVBiUDVzekt1RTBMUHFXc3IxTExTYWh5cHQ4?=
 =?utf-8?B?SGdWUVdBMUlya2tMSTA4TjJuTW9nRHVwRnp2c3JoakI2dms2YjJ1YlZ0L3VF?=
 =?utf-8?B?RHY5WFhCS3U0MVp1b09CQ2o4cVJTSU9Cd01MU0FBaFhrYzArVGpYY3h5SW9w?=
 =?utf-8?B?L3ViZWlzOXZ4MXJrRlRSTkZ5RWxoV0xKekhGbXh6QnFjRW5yR1BMTmczY2JR?=
 =?utf-8?B?aFdlcGJpQ1FOc1lwd1YyUXNsYU5sZUp2cXdPai9nYktBS1JYc0JVUXh6cngy?=
 =?utf-8?B?MzF0Qm44N3N4RkdlMmR1bG1VeEUvVWJpNUV6WFlkMm9IU0d1Yjg3bk9rOStX?=
 =?utf-8?B?SXZwS2pJSVFDczdtRkNOQWRRZncyZFk2RUduTFd0ZUJnRndyTUhmalRraUdO?=
 =?utf-8?B?a2dQeUR3a3NzMzU1TDBtZnRITWErMGorTWxtK2V5d2wrM0tWb0RQZ0dmQTkv?=
 =?utf-8?B?NSsrU2ZNeDZmY3NTNityd0dJZDlxNzRqSnFtNFIwZWFha01MOUpZOUdCZ3Ny?=
 =?utf-8?B?bE9aUi8rL2xBakdyblVaQndtT2I5ZWp3Z3hmRGxCV2dQWGU5enNLK2ZXWFJv?=
 =?utf-8?B?cmRNWlVtNzFhTGVzYU5aMjk4UHZEamE1ZTNwSzd0ayt0YU1wTWxkS1cwS0o0?=
 =?utf-8?B?K2V2MXh6S2FSQWpGMHc1L0hta1NmVi9zcVRIR1lHSmFvREdaY2h3WXMxSk5T?=
 =?utf-8?B?RjBnUmVXc0NtSVpsVHR4ZHRtTXBzanppczdJeitkYjYzVEhpdnoxaWQ5VVhJ?=
 =?utf-8?B?Sm9QajNKWU9RaHlxc3M2WnFUVUN5WXV4NXBHTDZDV2drVEo0SnlnQzdjU0Q0?=
 =?utf-8?B?MnRYTUpxTzdQQ3I0Ti9nazdjTXVmQmwxbWY5eFFCbDBlZjJqY2FsNVl3YWsw?=
 =?utf-8?B?WXVta1lmSUJTa0VqUS9uMUV1bjMxdHBZTldSRnU4L1hjOW43ZzBrL1pDREFX?=
 =?utf-8?B?eVpROFFndEpMTk9JdFYwbGRxeWxka0lDMEtmQjJuOFhldGhrVnZpY1NXUlBz?=
 =?utf-8?B?RG5GbWVoWWhTdXBGcjlkWUdSOHNQQlBadVpkQ2ZJTEZMR0Q4cEdKcnRkanlQ?=
 =?utf-8?B?Yi9VK3MzMU1GNjZyTDdhUTNMbVZBUnRWMTdEV1JDa2k2OFR2TDFEVUs3cGdu?=
 =?utf-8?B?U0xVUkYxSDBEQjFCbzFkZU9qclVXL0tUejQzcUtBL1lHK2JrUFVtTy81MW1J?=
 =?utf-8?B?dmxheXZuZVo0bTdQR203aXdYUWZ6cmo4MC8zMmRoUUhqMW1zQVhTR0RuZm84?=
 =?utf-8?B?Q2cvelZVS0NMZmU4ZDRXU2p1K1hmSENkSkx5L3BYYWVnRkVLWVdNbWxkN2sx?=
 =?utf-8?B?STRwaWh5RlJHNEZkVjdoeTk1aGhCNzBYNFFTU0lyeUl0S0FxTTh2aGZPeEJS?=
 =?utf-8?B?ejFJOWlONVpsS3dpZzVwbGdhck1lT2IwazVZTlQzNXZzMzJ1NlcvZFkrODIv?=
 =?utf-8?B?QStWanpsVU5YLzNYQnA4am1XZ1pvaDdxbGo0N2g2czRqbHlyN3daSE1ZMEFa?=
 =?utf-8?B?a1l0REJOdlg5N2IyckwxOElydk9xRllmWlZYdnVQbTVvTTQ5RTY5dmlncklx?=
 =?utf-8?B?dUtXOXdwM0xkQU5ycVRFcThzYVlGd0lqR2R4czZWbHM5WUI1UWwzc3VMTDRv?=
 =?utf-8?B?THlXTjc0dFFXbmhBQ01JQ3RMMXpIckRUTGJJWHNPTkVPRitYMGlYKzVwU2do?=
 =?utf-8?Q?sZHTufe8AnhHIbsldFQIRQcUm07FfC0Q?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB6186.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T1E1cGd1M25IYWtmTlNjMDBVVHFydmw0TXcvUHpwWWNBTlhjeDAvWXpqNGxq?=
 =?utf-8?B?eHozcncwdVVQMjNHRDBUSUUzRm9ydTc1L0xKTTR0eVRqK2p2eDIrbHUxbVNp?=
 =?utf-8?B?NTdjanVKaVJTTVhhbmhSc2lTMmdrbWZ5VzU5SHZjTGRqcEJBMmZsVG5WN1RQ?=
 =?utf-8?B?SlJUR3hxczFNZFpId2pLTHRYQ1g2aFhDc3I4K2lQejJicThhQytjSE9JYUhI?=
 =?utf-8?B?UXpLc3VYYkJJOFZ2NkpyMU12UDdGcHh3MGk5bjNVb2tjdklJYWJLWE9MU1F6?=
 =?utf-8?B?TWEwcis3bS84ekNDbE9xRFFDSUxDdGZGblVFRVUxbWkzdnJlM1VKcDV5b2h2?=
 =?utf-8?B?NC9IVHo0RHF1U0ZWRnFQeEN1M3A0dXN5eUlrRmNNcjR6ajd6b3RNWUlhRHlR?=
 =?utf-8?B?a1kxemtrTWJQM0c4QVZIUVErTUcwQ3gweWx6a0lZeWxhWWVKdkZxOU05Yjlk?=
 =?utf-8?B?T3o4b2FGV01vSnQwQkpkQnM4T1k0S2hoZ0VhSytwZ1A4YndzUGZ1SkVyak4v?=
 =?utf-8?B?dHB6Mk1mbUZtRmRKa0NqSkNyd043aW5NSUZtaW5iMXd3NW5FYVFZSXhGaHpa?=
 =?utf-8?B?Q1JVa1hhaTRSbkxnNEd1MmNDSXoyKzRTL0NMMW16aVQvaGJ3SVVnR1R5VjA0?=
 =?utf-8?B?MXJmQkF0NHVwVEF5ZGhVbHlhRTBzdm5LMm1DUG9ueW54c3JrNjhPd3UxRjhL?=
 =?utf-8?B?aEZuWndqZkV1TTVrWG1BaTlIeDJMT2lmVEk0NUkrNFdJQVBzSmhYRlk1N2w0?=
 =?utf-8?B?d1hlc0ZZM2lsMFpaQXdnb2tJOUR5b2ViWXhFN3U3aW5GN2c0UFZoY0dFVWlD?=
 =?utf-8?B?MGpER3ZCMGhISklZN2o0YzVCejJreXhmZEluSDBsWFAyU3VqSDJVb2Vmdi9n?=
 =?utf-8?B?UzhTTE1EaFFaRFlRSXhFOVd3SlBNV29YUFJjWnZkNlJrckVFcVkxcGdIdjRQ?=
 =?utf-8?B?YVZlMjNYV1EzRXd0RW1pOUdEQW5ibFJlK2FzQjJUclRKVUNZbDV6MkhNdE90?=
 =?utf-8?B?U1YrREVHcXBTY09xQkpMUWpuai9WcjBya1FvZEFBbGVPUm5DUFF6dVFmMVhR?=
 =?utf-8?B?VlFXRFJhcGZaV0FuNG42Q0F4cWhQYVVUdE16Snd5SXVKaVlnMFRKQTB1QVVu?=
 =?utf-8?B?TTZHYWJQcUhlYmR4VmJPZkFpdUszV1RVakh1ME0rN2pYNUJmZTRsRUNERDVY?=
 =?utf-8?B?blIzSnJ6TzA2clBZMkNtY01Da2J3aDZZcTYzdzYzY09XNVVUTWVhNktMakVX?=
 =?utf-8?B?TklURUhHYXBlQStTZ2RKclpWaEhzdUNCVHFMTTFqNjg1SG5kSHdrT1ZHaE9X?=
 =?utf-8?B?d3pZdnlvTGtMUS82WC9hNXRTL0xBYWRidHFQcjZGMmFxV2MvSnpjZ3oxQ0NW?=
 =?utf-8?B?V3p6b3hrRTVjZXdMNmpMSkZMWnFJNFVVV3NCMHdNTlU4Vjc0YTdyVkpsUWp2?=
 =?utf-8?B?eE1oUkUrdVY1aW16ZlkxajhnZjBuQkJUbjN6Ty9KaFgzOXFzSHNEMFNUaEg1?=
 =?utf-8?B?RWR3RDVBeTNGR2VnSG5NZFVGazJZZytOOFo4Vm5mZEhRRFZTZW1tTkVxZVRq?=
 =?utf-8?B?a1hNR1Nkd1Bic3ovMmpXTXIrSENwNEkreE50WWhlSFJ0Z1hlMFJqMHk4SGQv?=
 =?utf-8?B?NjJJS1cyTm5kTFB2b21hWk1TZ25mR1p4cVlpVEx0dXI2aStrOUlUcmREV2NN?=
 =?utf-8?B?d3IzMHpUb2pQYW9NVHlEc3UvOFUwdFcrK1U5ZGhiZDBhQjdSNmhaUiszQnBs?=
 =?utf-8?B?V2VYUUJ1em9wVXdDYkc1T2JNQlFZZHlMd082QmJkOXVhVlYxU3g1SGd3SG1T?=
 =?utf-8?B?c1JzRnVaa1h3WHZiSXh0SFdvc3FxNmloRTVKQ0V6YzNwMDJPZGY5T1Q4MFN1?=
 =?utf-8?B?S09QQUIwb0RCM0hEK0dkdjVSdmY5d0xJVzlFUHd1NUFGejNoQmloNlRHQ0Ur?=
 =?utf-8?B?ZXBuT3pTaEhKa1hlR2F6UUU3MStodEttVHE5S3JsQWdNRnF0THlaY21XUjdr?=
 =?utf-8?B?VGFZN1lNcGJJdXA2Y1ErZ1hYMVRwcTE0eFJob0poVllvdlVndS9GNklPQ0tt?=
 =?utf-8?B?V2k3WnBQdW1TUG50R2ZqL3VtZXN2UGZuemdYVWFMaGpRME5kT2JJaDd0S1lL?=
 =?utf-8?Q?QhMrMmC5JozOBnaYGa2TG6suq?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <48B2CBF4ED00D24682960B5F1F0858DB@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB6186.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fa4f93e-0672-4ef5-2b30-08dda4a425a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2025 02:45:06.9759
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p7kiDCaaOi+Q7kNgXen6kHILlUxGBvbq4ofts0S/fcIkclFX0pfY+trEUmFsUlMLqXKawk4+zW9gOzMJTnQiPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI6PR03MB8654

T24gRnJpLCAyMDI1LTA1LTMwIGF0IDEzOjQ1IC0wNDAwLCBOaWNvbGFzIER1ZnJlc25lIHdyb3Rl
Og0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBh
dHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBj
b250ZW50Lg0KPiANCj4gDQo+IEhpLA0KPiANCj4gTGUgdmVuZHJlZGkgMzAgbWFpIDIwMjUgw6Ag
MTU6NDUgKzA4MDAsIEt5cmllIFd1IGEgw6ljcml0IDoNCj4gPiBUaGlzIHNlcmllcyBhZGRzIHN1
cHBvcnQgZm9yIG10ODE5NiBtdWx0aS1oYXJkd2FyZXMganBlZyBlbmMgJiBkZWMsDQo+ID4gYnkg
Zmlyc3QgYWRkaW5nIG10ODE5NiBqcGVnZGVjIGFuZCBqcGVnZW5jIGNvbXBhdGlibGUgdG8gaW5z
dGFsbA0KPiA+IGtlcm5lbCBkcml2ZXIuIEFkZCBzbW11IHNldHRpbmcgdG8gc3VwcG9ydCBzbW11
IGFuZCBpb21tdSBhdCB0aGUNCj4gPiBzYW1lIHRpbWUuDQo+ID4gU2Vjb25kbHkgcmVmYWN0b3Ig
YnVmZmVyIGFuZCBjbG9jayBzZXR0aW5nIHRvIHN1cHBvcnQgbXVsdGktaHcganBlZw0KPiA+IHdv
cmtpbmcuDQo+ID4gTGFzdGx5LCBmaXggc29tZSBidWdzLCBpbmNsdWRpbmcgcmVzb2x1dGlvbiBj
aGFuZ2UgaGFuZGxlaW5nLCBzdG9wDQo+ID4gc3RyZWFtaW5nIHN3IGZsb3cgYW5kIG90aGVycy4N
Cj4gPiANCj4gPiBUaGlzIHNlcmllcyBoYXMgYmVlbiB0ZXN0ZWQgd2l0aCBNVDgxOTYgdGFzdCB0
ZXN0Lg0KPiA+IEVuY29kaW5nIGFuZCBkZWNvZGluZyB3b3JrZWQgZm9yIHRoaXMgY2hpcC4NCj4g
PiANCj4gPiBQYXRjaGVzIDEtMyBBZGRzIGpwZWcgZW5jb2RlciBhbmQgZGVjb2RlciBjb21wYXRp
YmxlLg0KPiA+IFBhdGNoZXMgNCBhZGQganBlZyBzbW11IHNpZCBzZXR0aW5nLg0KPiA+IFBhdGNo
ZXMgNSBmaXgganBlZyBodyBjb3VudCBzZXR0aW5nIHRvIHN1cHBvcnQgZGlmZmVyZW50IGNoaXBz
Lg0KPiA+IFBhdGNoZXMgNiByZWZhY3RvciBqcGVnIGJ1ZmZlciBwYXlsb2FkIHNldHRpbmcgdG8g
aGFuZGxlIGJ1ZmZlcg0KPiA+IHNpemUgYnVnIHdoaWxlIHJlc29sdXRpb24gY2hhbmdlZC4NCj4g
PiBQYXRjaGVzIDcgcmVjb25zdHJ1Y3QganBlZyBkc3QgYnVmZmVyIGxheW91dC4NCj4gPiBQYXRj
aGVzIDggZml4IG11bHRpLWNvcmUgc3RvcCBzdHJlYW1pbmcgZmxvdw0KPiA+IFBhdGNoZXMgOSBy
ZWZhY3RvciBtdWx0aS1jb3JlIGNsayBzdXNwZW5kL3Jlc3VtZSBzZXR0aW5nDQo+ID4gUGF0Y2hl
cyAxMCBmaXggZGVjb2RpbmcgYnVmZmVyIG51bWJlciBzZXR0aW5nIHRpbWluZyBpc3N1ZQ0KPiA+
IFBhdGNoZXMgMTEgcmVmYWN0b3IgZGVjb2RpbmcgcmVzb2x1dGlvbiBjaGFuZ2Ugb3BlcmF0aW9u
DQo+ID4gUGF0Y2hlcyAxMiBmaXggcmVtb3ZlIGJ1ZmZlciBvcGVyYXRpb24NCj4gDQo+IEp1c3Qg
Z2VuZXJhbCBjb21tZW50LCB5b3UgYnVpbHQgeW91ciBwYXRjaHNldCB1cC1zaWRlLWRvd24uIFN0
YXJ0DQo+IHdpdGggdGhlIGZpeGVzIG9mIHRoaW5ncyB0aGF0IHdhcyBhbHJlYWR5IGJyb2tlbiwg
dGhlbiBkbyB5b3VyIG11bHRpLQ0KPiBjb3JlDQo+IHN1cHBvcnQgcmVmYWN0b3JpbmcsIGFuZCBv
bmx5IHRoZW4gYWRkIE1UODE5Ni4gTG9va2luZyBmb3IgYSB2NiB3aXRoDQo+IGEgcmUtb3JnYW5p
emF0aW9uIG9mIHRoZSBzZXQuDQo+IA0KPiBOaWNvbGFzDQoNCkRlYXIgTmljb2xhcywNCg0KVGhh
bmtzIGZvciB5b3VyIGtpbmQgY29tbWVudHMsIEkgd2lsbCByZS1vcmdhbml6ZSBteSBwYXRjaCBz
ZXQgaW4gdjYuDQoNClJlZ2FyZHMsDQpLeXJpZS4NCj4gDQo+ID4gDQo+ID4gLS0tDQo+ID4gVGhp
cyBzZXJpZXMgcGF0Y2hlcyBkZXBlbmRlbnQgb246DQo+ID4gWzFdDQo+ID4gDQpodHRwczovL3Vy
bGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9wYXRjaHdvcmsubGludXh0di5vcmcvcHJvamVjdC9s
aW51eC1tZWRpYS9wYXRjaC8yMDI1MDQyNDA5MDgyNC41MzA5LTEtamlhbmh1YS5saW5AbWVkaWF0
ZWsuY29tL19fOyEhQ1RSTktBOXdNZzBBUmJ3IW1LYWRYTVN3Q0duTV92dTU3OENnQkFpaE1HU3Fn
bS02bjI0YWt2dUhaS2tlSEE5eEtaenZSSnVoNks5QkhJUTRITXZmSFk0eEsyeDdPa3dWYVlmWVVn
JA0KPiA+IA0KPiA+IENoYW5nZXMgY29tcGFyZWQgd2l0aCB2NDoNCj4gPiAtLWZpeCBrZXJuZWwg
cm9ib3QgYnVpbGQgZXJyb3JzIGZvciBwYXRjaCA0Lg0KPiA+IC0tYWRkIHJldmlld2VyIGZvciBw
YXRjaCAxIGFuZCBwYXRjaCAyLg0KPiA+IA0KPiA+IENoYW5nZXMgY29tcGFyZWQgd2l0aCB2MzoN
Cj4gPiAtLWNoYW5nZSBwYXRjaCBzdWJqZWN0IG9mIGpwZWcgZW5jb2RlciBhbmQgZGVjb2RlciBj
b21wYXRpYmxlLg0KPiA+IA0KPiA+IENoYW5nZXMgY29tcGFyZWQgd2l0aCB2MjoNCj4gPiAtLXJl
ZmFjdG9yIHNtbXUgc2lkIHNldHRpbmcgZnVuY3Rpb24gaW50ZXJmYWNlDQo+ID4gLS1Tb21lIG1v
ZGlmaWNhdGlvbnMgZm9yIHBhdGNoIHYyJ3MgcmV2aWV3IGNvbW1lbnRzLg0KPiA+IA0KPiA+IENo
YW5nZXMgY29tcGFyZWQgd2l0aCB2MToNCj4gPiAtLXJlZmluZSBqcGVnIGR0LWJpbmRpbmdzIGZv
ciBNVDgxOTYNCj4gPiAtLW9wdGltaXplIHNvZnR3YXJlIGNvZGUgdG8gbWFuYWdlIGpwZWcgSFcg
Y291bnQNCj4gPiAtLXJlZmFjdG9yIHNtbXUgc2lkIHNldHRpbmcgZnVuY3Rpb24gaW50ZXJmYWNl
DQo+ID4gLS1Tb21lIG1vZGlmaWNhdGlvbnMgZm9yIHBhdGNoIHYxJ3MgcmV2aWV3IGNvbW1lbnRz
Lg0KPiA+IA0KPiA+IEt5cmllIFd1ICgxMik6DQo+ID4gICBtZWRpYTogZHQtYmluZGluZ3M6IG1l
ZGlhdGVrLGpwZWc6IEFkZCBtZWRpYXRlaywgbXQ4MTk2LWpwZ2RlYw0KPiA+ICAgICBjb21wYXRp
YmxlDQo+ID4gICBtZWRpYTogZHQtYmluZGluZ3M6IG1lZGlhdGVrLGpwZWc6IEFkZCBtZWRpYXRl
aywgbXQ4MTk2LWpwZ2VuYw0KPiA+ICAgICBjb21wYXRpYmxlDQo+ID4gICBtZWRpYTogbWVkaWF0
ZWs6IGpwZWc6IGFkZCBqcGVnIGNvbXBhdGlibGUNCj4gPiAgIG1lZGlhOiBtZWRpYXRlazoganBl
ZzogYWRkIGpwZWcgc21tdSBzaWQgc2V0dGluZw0KPiA+ICAgbWVkaWE6IG1lZGlhdGVrOiBqcGVn
OiBmaXgganBlZyBodyBjb3VudCBzZXR0aW5nDQo+ID4gICBtZWRpYTogbWVkaWF0ZWs6IGpwZWc6
IHJlZmFjdG9yIGpwZWcgYnVmZmVyIHBheWxvYWQgc2V0dGluZw0KPiA+ICAgbWVkaWE6IG1lZGlh
dGVrOiBqcGVnOiByZWZhY3RvciBqcGVnIGRzdCBidWZmZXIgbGF5b3V0DQo+ID4gICBtZWRpYTog
bWVkaWF0ZWs6IGpwZWc6IGZpeCBzdG9wIHN0cmVhbWluZyBmbG93IGZvciBtdWx0aS1jb3JlDQo+
ID4gICBtZWRpYTogbWVkaWF0ZWs6IGpwZWc6IHJlZmFjdG9yIG11bHRpLWNvcmUgY2xrIHN1c3Bl
bmQgYW5kIHJlc3VtZQ0KPiA+ICAgICBzZXR0aW5nDQo+ID4gICBtZWRpYTogbWVkaWF0ZWs6IGpw
ZWc6IGZpeCBkZWNvZGluZyBidWZmZXIgbnVtYmVyIHNldHRpbmcgdGltaW5nDQo+ID4gaXNzdWUN
Cj4gPiAgIG1lZGlhOiBtZWRpYXRlazoganBlZzogcmVmYWN0b3IgZGVjb2RpbmcgcmVzb2x1dGlv
biBjaGFuZ2UNCj4gPiBvcGVyYXRpb24NCj4gPiAgIG1lZGlhOiBtZWRpYXRlazoganBlZzogZml4
IHJlbW92ZSBidWZmZXIgb3BlcmF0aW9uIGZvciBtdWx0aS1jb3JlDQo+ID4gDQo+ID4gIC4uLi9t
ZWRpYS9tZWRpYXRlayxtdDgxOTUtanBlZ2RlYy55YW1sICAgICAgICB8ICAgOCArLQ0KPiA+ICAu
Li4vbWVkaWEvbWVkaWF0ZWssbXQ4MTk1LWpwZWdlbmMueWFtbCAgICAgICAgfCAgIDggKy0NCj4g
PiAgLi4uL3BsYXRmb3JtL21lZGlhdGVrL2pwZWcvbXRrX2pwZWdfY29yZS5jICAgIHwgMTY5ICsr
KysrKysrKysrKystDQo+ID4gLS0tLQ0KPiA+ICAuLi4vcGxhdGZvcm0vbWVkaWF0ZWsvanBlZy9t
dGtfanBlZ19jb3JlLmggICAgfCAgMjEgKystDQo+ID4gIC4uLi9wbGF0Zm9ybS9tZWRpYXRlay9q
cGVnL210a19qcGVnX2RlY19ody5jICB8IDExMiArKysrKysrKysrKy0NCj4gPiAgLi4uL3BsYXRm
b3JtL21lZGlhdGVrL2pwZWcvbXRrX2pwZWdfZW5jX2h3LmMgIHwgMTEyICsrKysrKysrKysrLQ0K
PiA+ICA2IGZpbGVzIGNoYW5nZWQsIDM3NyBpbnNlcnRpb25zKCspLCA1MyBkZWxldGlvbnMoLSkN
Cg==

