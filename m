Return-Path: <linux-media+bounces-49514-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E95CDD36D
	for <lists+linux-media@lfdr.de>; Thu, 25 Dec 2025 03:21:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C0AAC30213CA
	for <lists+linux-media@lfdr.de>; Thu, 25 Dec 2025 02:21:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0189324A04A;
	Thu, 25 Dec 2025 02:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Kt0Cz1Ai";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="KnT5/Ls6"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538F52AE68;
	Thu, 25 Dec 2025 02:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766629259; cv=fail; b=m31cMCT1ZJrbkLTvdd4C2hwNWB15a4ArYzpcZc6WD0Fqg71aU6XSVMXvlQoKYrSKMTiXoKEM71XWD+V0r6G3K/ZumvmAF+s/Whaf3T67+zqT5O33VwemH0/RFnxnBRC++e+ia9aQGvTRh1UaEzGt1KL1s5b2Z9qszxvQpr2hqG8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766629259; c=relaxed/simple;
	bh=rcAx6Vj1KctHlFwnf0J1NvuScT5RKre8Q9ELAbF/r1U=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NL11ZLakhX4Gc9aV3WdBt4odo39dmnrWhwtwAh6JqA7a2zNcSl7gOHsmHmFnkNC4xA1jefxdifNadFYlHvgiXxJzbEY6hvIrRFSjbrTSh01Squ33l20OnqdeWGX5PalVbgPhqj3iHcK59ScOYUdMVtSiduvTc1xa5oZYzhIogQo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=Kt0Cz1Ai; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=KnT5/Ls6; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 520aa222e13811f0b33aeb1e7f16c2b6-20251225
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:To:From; bh=rcAx6Vj1KctHlFwnf0J1NvuScT5RKre8Q9ELAbF/r1U=;
	b=Kt0Cz1Aiz8YGlYw0DBl5s//e+mo825kahavh6fE1LgNaYGWnIGw8Bwu9mEG+akhekMkPK/Gi4JXS7kYUXmb4JJtWqmYjoeAqf21n4xRQ7ejJdzKojOhXHk8d8iYDCUnyoRmYpzvG8Ap+nOt3brGQg8jB8/c1v8T+s2P+W1DWVsM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.9,REQID:137f3d54-7bbd-425e-9bd8-5e60b7395e49,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:5047765,CLOUDID:afdf90aa-6421-45b1-b8b8-e73e3dc9a90f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 520aa222e13811f0b33aeb1e7f16c2b6-20251225
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 460643349; Thu, 25 Dec 2025 10:20:45 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 25 Dec 2025 10:20:44 +0800
Received: from SI4PR04CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 25 Dec 2025 10:20:44 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lmwNZjRrJDJ1Ne7AtTQjMFoF8mDyCHBw2i1e6aoBxyfI3M17iZGqJkLiit+3iA77HIZTKu4z5tXLW4si7buSM7ZgDnUX6P+ryFIoebu6wcZyh8DV7P/vhfLHH23Rk2i43CDA0FCR3ItATqvsIFEPuGxT+p8i4GDisbll3Y8NWOIrJ9YSryisVn2N78jFqT6wTWdjKfXAZgMgQIXKQwS/qJU1zZs4G3U/dIkESBDnBfIw6cIsw3kOZmyy9o0rNzhHmdlnaS10/8ikTe+1b0ADNGL67wPISRpCAGVlLwV+/ZpAwNgqSddnERf27QmJkeV94u/dii1C/eoOVg6lARXs7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rcAx6Vj1KctHlFwnf0J1NvuScT5RKre8Q9ELAbF/r1U=;
 b=qJkSkz7A3cmW0P1js23+mR0P1vmpYyc+kGBJbPL5dL55qSQyzeevtqU232lGr9u13n/dh0OfKn0nlhZ9ryomxfjmB9mbsLdlqwhXy+Mv8+g7BzJa15JoVnasy1bhesyDiZ4hcnLvvEmTHrLjQTBi35B+W5yqkaVKvJV/DW+9M/G+KERdRhzg1TFRHkpVq5nuBnMrAKQq6RmS4Ex3IItHhC3/VAAGh7dcQ/W4ZLFe0B355KgWtlqAr+gfkKyfHSwAWHbpEdZxZ+UBLSS1z5uE9hvgbOna09CygnJGQlsw2qJJvcFGLf8hAfUALoYag+rwCgQwkujroln5/1AUfG77gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rcAx6Vj1KctHlFwnf0J1NvuScT5RKre8Q9ELAbF/r1U=;
 b=KnT5/Ls6Eagwx2/aQoDXxqeFZQM/vc5v9yoSjyuoj0pFH7FNxE8I+9efaM5T7cnhNUyxOJm/cp0kG6rupZBLKO1uO30iDMKhbN8vOLRz+FmFq5XQf7PPa2e/r3OT4+AEroib+ZZnXGCr3H2Gqm3ymBqwWc4F+SxDofXanA0K7AU=
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com (2603:1096:301:b9::5)
 by KU2PPF2A1016A19.apcprd03.prod.outlook.com (2603:1096:d18::40d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Thu, 25 Dec
 2025 02:20:42 +0000
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::a013:f3b3:a461:8ece]) by PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::a013:f3b3:a461:8ece%4]) with mapi id 15.20.9434.009; Thu, 25 Dec 2025
 02:20:41 +0000
From: =?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>
To: "nicolas@ndufresne.ca" <nicolas@ndufresne.ca>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"mchehab@kernel.org" <mchehab@kernel.org>,
	=?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v11 01/12] media: mediatek: jpeg: fix jpeg hw count
 setting
Thread-Topic: [PATCH v11 01/12] media: mediatek: jpeg: fix jpeg hw count
 setting
Thread-Index: AQHcY3DD+F6x+E+x+EOSNtKThCBNOrUk1kqAgAzs9AA=
Date: Thu, 25 Dec 2025 02:20:41 +0000
Message-ID: <d99811831065542167c8dae6285ecdada946104d.camel@mediatek.com>
References: <20251202094800.6140-1-kyrie.wu@mediatek.com>
	 <20251202094800.6140-2-kyrie.wu@mediatek.com>
	 <cd4c9c6f89d2ad506113745f4273ff6e6b65c75a.camel@ndufresne.ca>
In-Reply-To: <cd4c9c6f89d2ad506113745f4273ff6e6b65c75a.camel@ndufresne.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR03MB6186:EE_|KU2PPF2A1016A19:EE_
x-ms-office365-filtering-correlation-id: c0db4eb6-1e25-468e-243c-08de435c33b7
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700021|921020;
x-microsoft-antispam-message-info: =?utf-8?B?Q0ZES1IxRmQ5R3pmcCtpM2x1UFg4Y3lvOVN3UG1TYWt1VytYdEltdjR3ZVNF?=
 =?utf-8?B?ajR4M2Fqa2d4NnU3aDhsbEJ0VWZyUFduK0c4TnVoTkVYZGtLSWhyRDYzdHpG?=
 =?utf-8?B?NEtvTXZTbjAzNWZtTG84enNEc01oaEU2RUROSjhkb3VuVVBaSjlUSEJqOEk4?=
 =?utf-8?B?Z1JFR2RjMXJLTEJsWERXQ2lienEwU0tXZW5NOFpiN1FoVU1NYm1NbG1xZHZJ?=
 =?utf-8?B?VkNFTTBCbE5aay9wN2lwc1hQamVDNkR5S1hpNEdDc2ZhOURYYnhrR0YzRmM3?=
 =?utf-8?B?YzNyNVlSZEtEOFVKV3pZaENVM2hDSWJBbGhFWWFranBBdklqK1FOQlJjSGR0?=
 =?utf-8?B?NXIyY2RGMGNNUHZURGlRbVU3UlNjUFBBZjZDRWlNYUlpV1dlVUt2U0pBa1hO?=
 =?utf-8?B?MDZ0NDQ1UDczbStwSVlnVmcyczJYRTJ2OFAyeTJxNDJXMVJhQ2J5b2hHTWw2?=
 =?utf-8?B?NVlUL2kyem9iU3pFd2hnWTJscUg5ODVvTDEyYy9PaUp2UEhkMkFHaDBRSkNh?=
 =?utf-8?B?cnp5d3AveFFlWDNtY2I3MmYvdTAvR2RWeUV1ejVBYmhOd1Z5dkYzcE9wTFdZ?=
 =?utf-8?B?dkxnazQ1RHozL3FoaUZycDBpbE5JWHNFejZaZDFCa3RjaEhZY2lpSjNqcmg2?=
 =?utf-8?B?Y2lQRExJd2NyNjNNNTh2SHNmSGwydVh6YVhselBUN2ZEK0RSNWJlV1U0SGk4?=
 =?utf-8?B?TjZVVFpZQ1pxU3N0THc1ZXVHcjUzSzlUVGFlZGVPRlY1c3AwNURGOGM2R0wy?=
 =?utf-8?B?L1Fnb3JTQThzcjVQeUdZWUw5SWF5TkJveG9IcElZbVAyYzBoa2JkWjZCSTJ4?=
 =?utf-8?B?TlRuVENKOEJldHU3emJoMUxkNG13WHZiZTNLRFd5TGVwdmhKUG1rMEJyblBp?=
 =?utf-8?B?N1BsLzNkcnlQU2QzdGhGTW1UeUJ4WTdHNEpMbjFFY1JFQWl5d1IwYnRDQ3V1?=
 =?utf-8?B?alFkZ0QwVjlhL21kdStIWjArVDVnL1pnRnVObmZNSHdmSTVXNTh6dVE4NWs3?=
 =?utf-8?B?QUErQitZSTZZOWwwWkdqOTVIS1hUVjZRdHRmVzVGVUwxQ0hrelM3Tm02bnZr?=
 =?utf-8?B?LzUvWjF3dmR1eTI5YjVYZUcybVgyK2p5d2h3NFVjNlBGaWtaSHUrY2JkQ3pq?=
 =?utf-8?B?Yko3M21WVHJsZXpIcE9ULzNpQmVnZU5vVlhYLzhnTnhYbndNOHhDZUMrM1lX?=
 =?utf-8?B?Tm8xZ0tXTktpTEZ2dGRyV2RkNmxQQVNydWVqT1ZsNnZNZ1FiMlA0TDNQanZ5?=
 =?utf-8?B?Z3VPWFVVOGZqUG5SNWtSVkdPSFRDaHNBbWpuNTZldkg2M29wT1BVN1FkaEFH?=
 =?utf-8?B?QWJFSEtqblNuSDBSZTRiUzFrQnd5VXRycE4yMlBmdVRueHYzdGQ0Z254SUJ3?=
 =?utf-8?B?NGpyMWZJbW91d3o1T2RZNHlwL0FyQWs3eGszTDNINzV6UHZ5OElTR2JnQXBl?=
 =?utf-8?B?bUpEM2RhMnJzK1ZneHNHWEM3TGVta2pBRVVpVnVzMmcrRGo5cXBLeFBqV0Ix?=
 =?utf-8?B?RU0yZkFsK0pYeXhnVFI0TGMxYTZpVDB2YnhlV1dNVVZ0Y0w4K1pUdTMydkxy?=
 =?utf-8?B?M3AvVENyZ0czQXZEbDFZaXZRVE9aN3VRdHRGVG1DSjZocXc1bkEyZEF1TFZE?=
 =?utf-8?B?Y3VVTkZ5b0IrVjk2aTU1U1JKd3pGNFI0YTZUS256ODlucnVJaXpSRUFVMlhU?=
 =?utf-8?B?SzAwc2pKTEJ1Y0xhcGYzL291OFFsVVIyb2taQmFrRWloOEh4cXhIa1crR2la?=
 =?utf-8?B?MkRTcThJdWxrNUpPclR1aEswa1d2QzU0ZkJ1c2lFWEVmc1FYT29ZM0VOUmhq?=
 =?utf-8?B?VkZjaDVXNjQrMmlSclB2Ylg2dlBZbWFSTzQ2RHJDZmhjNjR6eFFQVkhEMWYz?=
 =?utf-8?B?dzhIY0tPUDB5Si9remIwbmpVRTlBb3pOYnMrMnI5Uk5sTjJHNXVRdDVZM2pO?=
 =?utf-8?B?SGJnWWwwRHJyMU5oemZORWhuWlB1dVZST2dLVS9tMllOL0VyaXR4ZWhTWFZS?=
 =?utf-8?B?S09LTVRJSlhJQy9lNFJvWXJMVnd5a0pSbSt1Y3NUVUZTamlXZVBRWnVDYmUr?=
 =?utf-8?B?eFZKa3RuNmo0aURDMlFYeUxUTXFXUmxkUFIrUT09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB6186.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SG1qWmRkb1dQVm4yZlFuMC9keDZjc1l5ZkFpZExjdEx5Q1pNZmRGLysvSXFM?=
 =?utf-8?B?aGhZd3hOTWEzOGs5aEVsWUZsWU90bW9YNnF6UDFqK3ErbGcyOGVVUlUzWE41?=
 =?utf-8?B?Qm5BdmRLaGt2Z2FiWDJQR0gzUFk5bGUxc0hxcWQ3U0lSekliWGlKUDBqKzN1?=
 =?utf-8?B?RWs4TWNQRXIyY1FiMlBMY25NdlBsM3d1VmkwUTRKREtoRmNObFgxVmtlZXRC?=
 =?utf-8?B?ZjhNVC80VG9FK2x6RDVjSFFWVUhBUmtTS2hZZCt4Rkk5WHpyTjN2bjVqb2c4?=
 =?utf-8?B?V2hhbmV5ak5PUzYvLzM3S1hXTXJjdjBHL0laWDRzK2Q3QTFyczRwd1oxTUFC?=
 =?utf-8?B?RjZjTlpGelg4cGY1SUowSU9TaFEvTDhWdlBvL3AyT3JFQXdUWTNMYlFTVlFP?=
 =?utf-8?B?OFduM1FGVkFoTnVLMHJVVSszSCtPaVF0TnJWaEhLWWJvMHNoaHZPbzYzVmQ1?=
 =?utf-8?B?VUZoZmtibmZvaXVGTUp6amtucWdsZ0xsSlF5ZmdMM3FzWUhLSFk2MGt1dmdJ?=
 =?utf-8?B?aDIwUVJxT0lLbjlQUjBHRGxLQklEaTU4OVduam91SkZoTWtUYVYzNE9iRklB?=
 =?utf-8?B?SGpsRSttSDhYYisxOUV6MGhZZHc3M1JKQWpOMm9SM2NLT2RZODZHbzY0bDlq?=
 =?utf-8?B?bUVRVFZDeG9mOUtJVERLSzFYNWMybENleVF4OUZNb3FPMGZtM1FxZmk2bWVB?=
 =?utf-8?B?dSs4UjM3UVhZM2JJVGp5a2RRcGpKMnFZc2w5S0FyR3c5dUlRSXZ6UUFjdnhU?=
 =?utf-8?B?SFNzN2JJV1MySmZZTTJ4b0wySVVHSmY1SEJUaE1Idlh0Ukx0cCtISStNdTZY?=
 =?utf-8?B?WmtsalRENFBPSWJiODJDOEhZRFlLRHU5WDNOTXB2aHRmZndJbWJpTWwzYjR5?=
 =?utf-8?B?aXpDZ1pqQlh1SFVtTlJiRGl1SUlnbiszd00xT0N1T2MxMVUxSEdMOVN6NlFZ?=
 =?utf-8?B?N2F3UWRkbVptK0NyeFpQL3pvT1R0RWp5eHUxNmVjbDRVNlExRDRXUWpkU2pF?=
 =?utf-8?B?OUVBTUJ5TnJZTU9FaDB4SlI2LzhXazVTa2NqMWxXVytVaTlhWUNNSXRPS2tH?=
 =?utf-8?B?QjhRdHJES2RHOTNuZzk1WmlqWW83Uytxbk9QcGhlUlZRRElaYU8zeUtGaFJF?=
 =?utf-8?B?alBJaEFzVGxXQ2NaZWJOYXNkQ3lienRwVFZYZW9ndHd5WWNBSlFYV1d4d25v?=
 =?utf-8?B?MGRRcCszNXBCam10Z0xKcmQ4UGZIcDNFM2NYQ2Vsc0w5RmNUV0diN3owR3Bo?=
 =?utf-8?B?QVdrNlFXTmc1MzBaNVNRRnVJeTQwa1FtRWhjcFo2NzNvcVQyVjBtY2d3dmIy?=
 =?utf-8?B?Uk1QRmFTWlNuM0FVZ2YvMXBPZU9VMEdmeHV6U2NNNEpIekZwR0dQb21RNS9h?=
 =?utf-8?B?ajh5cVJjQXpMVFd2bkhEZkpFWXUweTEwUGh4c3FrVDRrVVg1REttK25aNUpx?=
 =?utf-8?B?NmpOc3FzZ3VNNXBtWW04djFEQld6T2ZRT1VDWXkwNElwd0lBK3VZTWtxMXhM?=
 =?utf-8?B?enpMRDFpNlJ3bjBMWTlFSGwyY01LMEVtUEI5bnpHWEliWG9BTXJ4K3IrbWJU?=
 =?utf-8?B?em9tTXN0UTkwVnZXckp3aUh3RThrOEdRVEREbGg4d2l4YkhKVDU1N0xmc0RZ?=
 =?utf-8?B?Mlc4U0R5NWdOT2Nvc3o0RkVocDF3VlltSW5kYlBxSW9KMDRJMTFRYlZud3RQ?=
 =?utf-8?B?cWZLSmF0Zm5EZExPVzcrc1Q3M1N1bzkyZU1RS0NlY0s5OThqSFF1bDFGV1Fu?=
 =?utf-8?B?S1dWaE85bDhYZGtVVGRUUDh5NUMrWGJKdFJwNlFqOXhVSi81REZhcVlKdGV3?=
 =?utf-8?B?VGVzRGRUQWhjb09UNVUwcjNqdC9vdFpMRXcxYXNicFZkU2VzT2JqM0NOM0sz?=
 =?utf-8?B?eDJidmZXRGhTRG1wSzFDeUtvbERBcGp3S2cyNy9maklVWHM4OUVidW14bmxK?=
 =?utf-8?B?T0VsSC9WMEZOeVo0Um5WL1A4RHV5QkRzcVpSZDI5M2YvMy9hU1VzZ1JuZWRN?=
 =?utf-8?B?NmNrZnFQZmg0RWt0ODd4UVRUcU9kMWZSdUV2THVrTUJWVW5kL2JGZlV6UFg0?=
 =?utf-8?B?c24yN3IzZll0YXlNQ0NmSEFlNUhhZFFDL2x0Mk9FdktoR3NDTXp5N25GQnNV?=
 =?utf-8?B?RXBUeElITUpxUTBqdWl4RStFdnhBMDFRSno0TWNRbXRqc0J0R3FwcTBzejda?=
 =?utf-8?B?VTkzVUNIZzBwWHE0bkk4cnhJdjluMzg5YTFyLys2QWlNd3A4YWsxcnNLV2wr?=
 =?utf-8?B?MXJIRnRGQzIwbWF0Q3B1VGpMWXBzclpHZ1NBUEQxRldJZWdyRnZ3bVlsUHZB?=
 =?utf-8?B?Q2JvVDFTN0RHYWJERXNoYnNBcWtVeFBrZlZmRzA4bG9oOHRKcFM0QT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <16840A02887E5F42B0DBCD4BAC18CE63@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB6186.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0db4eb6-1e25-468e-243c-08de435c33b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Dec 2025 02:20:41.6077
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0bDV7gpT5PL1fAfIuPRQGRA7w+DBV2ZWYdl5r0DsHfvYbf1Poo4Hy9T3kqgr4p2u23uxvL2z7EvyIKv10fg/uA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KU2PPF2A1016A19

T24gVHVlLCAyMDI1LTEyLTE2IGF0IDE1OjU3IC0wNTAwLCBOaWNvbGFzIER1ZnJlc25lIHdyb3Rl
Og0KPiBIaSwNCj4gDQo+IExlIG1hcmRpIDAyIGTDqWNlbWJyZSAyMDI1IMOgIDE3OjQ3ICswODAw
LCBLeXJpZSBXdSBhIMOpY3JpdCA6DQo+ID4gRGlmZmVyZW50IElDcyBoYXZlIGRpZmZlcmVudCBh
bW91bnRzIG9mIGhhcmR3YXJlLA0KPiA+IHVzZSBhIHZhcmlhYmxlIHRvIHNldCB0aGUgYW1vdW50
IG9mIGhhcmR3YXJlLg0KPiANCj4gRGlkIHlvdSBtZWFuIGRpZmZlcmVudCBhbW91bnQgb2YgY29y
ZXMgPyBUaGUgdXNlIG9mICJoYXJkd2FyZSIgaXMNCj4gc3RyYW5nZSBpbg0KPiB0aGlzIGRlc2Ny
aXB0aW9uLg0KWWVzLCBpdCdzIHJpZ2h0LiBJIHdpbGwgY2hhbmdlIGl0IGluIHRoZSBuZXh0IHZl
cnNpb24uDQoNClRoYW5rcy4NCj4gDQo+ID4gDQo+ID4gRml4ZXM6IDkzNGU4YmNjYWM5NSAoIm10
ay1qcGVnZW5jOiBzdXBwb3J0IGpwZWdlbmMgbXVsdGktaGFyZHdhcmUiKQ0KPiA+IEZpeGVzOiAw
ZmE0OWRmNDIyMmYgKCJtZWRpYTogbXRrLWpwZWdkZWM6IHN1cHBvcnQganBlZ2RlYyBtdWx0aS0N
Cj4gPiBoYXJkd2FyZSIpDQo+IA0KPiBJdHMgbm90IGNsZWFyIGZyb20geW91ciBkZXNjcmlwdGlv
biBpZiB0aGlzIGlzIGluIHByZXBhcmF0aW9uIG9mDQo+IE1UODE5NiBvciBhbg0KPiBhY3R1YWwg
Zml4LiBJZiBpdHMgaW4gcHJlcGFyYXRpb24gb2YsIGRyb3AgdGhpcywgaWYgaXQgZml4ZXMgc29t
ZQ0KPiBleGlzdGluZyBTb0MsDQo+IHBsZWFzZSB0ZWxsIHVzZSB3aGljaCBvbmUuIEFuZCB0ZWxs
IHVzIGhvdyBpdCBicmVha3Mgd2l0aG91dCB0aGlzDQo+IGZpeC4NCj4gDQo+IHJlZ2FyZHMsDQo+
IE5pY29sYXMNCg0KRGVhciBOaWNvbGFzLA0KDQpUaGUgbWFjcm8gd2FzIGZpcnN0IHVzZWQgdG8g
cmVwcmVzZW50IHRoZSBhbW91bnQgb2YgY29yZXMgZm9yIE1UODE5NS4NCkhvd2V2ZXIsIHRoZSBj
b3JlcycgcXVhbnRpdHkgb2YgTVQ4MTk2IGlzIGRpZmZlcmVudCBmcm9tIHRoYXQgaW4gdGhlDQpN
VDgxOTUsDQphbmQgaXQgbWF5IGFsc28gZGlmZmVyIGluIHRoZSBjb21pbmcgSUNzLiBUaGVyZWZv
cmUsIHRoZSBkZWZpbml0aW9uIG9mDQp0aGUgbWFjcm8gY2FuIG5vdCB1c2VkIHRvIHJlcHJlc2Vu
dCB0aGUgYW1vdW50IG9mIGNvcmVzLg0KDQpCdXQgaWYgeW91IHRoaW5rIHRoaXMgaXMgbm9ybWFs
IHNldHRpbmcgcGF0Y2ggcmF0aGVyIHRoYW4gYSBmaXhlZCBvbmUsDQpJIHdpbGwgY2hhbmdlIHRo
ZSBjb21taXQgbWVzc2FnZXMgaW4gdGhlIG5leHQgdmVyc2lvbi4NCg0KTG9vayBmb3J3YXJkIHRv
IHlvdXIgZnVydGhlciByZXBseS4NCg0KVGhhbmtzLg0KDQpSZWdhcmRzLA0KS3lyaWUuDQoNCj4g
DQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogS3lyaWUgV3UgPGt5cmllLnd1QG1lZGlhdGVrLmNv
bT4NCj4gPiBSZXZpZXdlZC1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPA0KPiA+IGFu
Z2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJp
dmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9qcGVnL210a19qcGVnX2NvcmUuYyAgIHwgOCAr
KysrLS0tDQo+ID4gLQ0KPiA+ICBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL2pwZWcv
bXRrX2pwZWdfY29yZS5oICAgfCAyICsrDQo+ID4gIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVk
aWF0ZWsvanBlZy9tdGtfanBlZ19kZWNfaHcuYyB8IDEgKw0KPiA+ICBkcml2ZXJzL21lZGlhL3Bs
YXRmb3JtL21lZGlhdGVrL2pwZWcvbXRrX2pwZWdfZW5jX2h3LmMgfCAxICsNCj4gPiAgNCBmaWxl
cyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+ID4gDQo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvanBlZy9tdGtfanBlZ19j
b3JlLmMNCj4gPiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvanBlZy9tdGtfanBl
Z19jb3JlLmMNCj4gPiBpbmRleCA2MjY4ZDY1MWJkY2YuLjZhN2UwMTEzMGYxYyAxMDA2NDQNCj4g
PiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL2pwZWcvbXRrX2pwZWdfY29y
ZS5jDQo+ID4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9qcGVnL210a19q
cGVnX2NvcmUuYw0KPiA+IEBAIC0xNDY3LDcgKzE0NjcsNyBAQCBzdGF0aWMgaW50IG10a19qcGVn
ZW5jX2dldF9odyhzdHJ1Y3QNCj4gPiBtdGtfanBlZ19jdHggKmN0eCkNCj4gPiAgCWludCBpOw0K
PiA+ICANCj4gPiAgCXNwaW5fbG9ja19pcnFzYXZlKCZqcGVnLT5od19sb2NrLCBmbGFncyk7DQo+
ID4gLQlmb3IgKGkgPSAwOyBpIDwgTVRLX0pQRUdFTkNfSFdfTUFYOyBpKyspIHsNCj4gPiArCWZv
ciAoaSA9IDA7IGkgPCBqcGVnLT5tYXhfaHdfY291bnQ7IGkrKykgew0KPiA+ICAJCWNvbXBfanBl
ZyA9IGpwZWctPmVuY19od19kZXZbaV07DQo+ID4gIAkJaWYgKGNvbXBfanBlZy0+aHdfc3RhdGUg
PT0gTVRLX0pQRUdfSFdfSURMRSkgew0KPiA+ICAJCQlod19pZCA9IGk7DQo+ID4gQEAgLTE1MTQs
NyArMTUxNCw3IEBAIHN0YXRpYyBpbnQgbXRrX2pwZWdkZWNfZ2V0X2h3KHN0cnVjdA0KPiA+IG10
a19qcGVnX2N0eCAqY3R4KQ0KPiA+ICAJaW50IGk7DQo+ID4gIA0KPiA+ICAJc3Bpbl9sb2NrX2ly
cXNhdmUoJmpwZWctPmh3X2xvY2ssIGZsYWdzKTsNCj4gPiAtCWZvciAoaSA9IDA7IGkgPCBNVEtf
SlBFR0RFQ19IV19NQVg7IGkrKykgew0KPiA+ICsJZm9yIChpID0gMDsgaSA8IGpwZWctPm1heF9o
d19jb3VudDsgaSsrKSB7DQo+ID4gIAkJY29tcF9qcGVnID0ganBlZy0+ZGVjX2h3X2RldltpXTsN
Cj4gPiAgCQlpZiAoY29tcF9qcGVnLT5od19zdGF0ZSA9PSBNVEtfSlBFR19IV19JRExFKSB7DQo+
ID4gIAkJCWh3X2lkID0gaTsNCj4gPiBAQCAtMTU5Nyw3ICsxNTk3LDcgQEAgc3RhdGljIHZvaWQg
bXRrX2pwZWdlbmNfd29ya2VyKHN0cnVjdA0KPiA+IHdvcmtfc3RydWN0ICp3b3JrKQ0KPiA+ICAJ
CWpwZWdfd29yayk7DQo+ID4gIAlzdHJ1Y3QgbXRrX2pwZWdfZGV2ICpqcGVnID0gY3R4LT5qcGVn
Ow0KPiA+ICANCj4gPiAtCWZvciAoaSA9IDA7IGkgPCBNVEtfSlBFR0VOQ19IV19NQVg7IGkrKykN
Cj4gPiArCWZvciAoaSA9IDA7IGkgPCBqcGVnLT5tYXhfaHdfY291bnQ7IGkrKykNCj4gPiAgCQlj
b21wX2pwZWdbaV0gPSBqcGVnLT5lbmNfaHdfZGV2W2ldOw0KPiA+ICAJaSA9IDA7DQo+ID4gIA0K
PiA+IEBAIC0xNjkyLDcgKzE2OTIsNyBAQCBzdGF0aWMgdm9pZCBtdGtfanBlZ2RlY193b3JrZXIo
c3RydWN0DQo+ID4gd29ya19zdHJ1Y3QgKndvcmspDQo+ID4gIAlzdHJ1Y3QgbXRrX2pwZWdfZmIg
ZmI7DQo+ID4gIAl1bnNpZ25lZCBsb25nIGZsYWdzOw0KPiA+ICANCj4gPiAtCWZvciAoaSA9IDA7
IGkgPCBNVEtfSlBFR0RFQ19IV19NQVg7IGkrKykNCj4gPiArCWZvciAoaSA9IDA7IGkgPCBqcGVn
LT5tYXhfaHdfY291bnQ7IGkrKykNCj4gPiAgCQljb21wX2pwZWdbaV0gPSBqcGVnLT5kZWNfaHdf
ZGV2W2ldOw0KPiA+ICAJaSA9IDA7DQo+ID4gIA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21l
ZGlhL3BsYXRmb3JtL21lZGlhdGVrL2pwZWcvbXRrX2pwZWdfY29yZS5oDQo+ID4gYi9kcml2ZXJz
L21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL2pwZWcvbXRrX2pwZWdfY29yZS5oDQo+ID4gaW5kZXgg
MDJlZDBlZDViNzM2Li42YmU1Y2YzMGRlYTEgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9tZWRp
YS9wbGF0Zm9ybS9tZWRpYXRlay9qcGVnL210a19qcGVnX2NvcmUuaA0KPiA+ICsrKyBiL2RyaXZl
cnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvanBlZy9tdGtfanBlZ19jb3JlLmgNCj4gPiBAQCAt
MjEyLDYgKzIxMiw3IEBAIHN0cnVjdCBtdGtfanBlZ2RlY19jb21wX2RldiB7DQo+ID4gICAqIEBy
ZWdfZGVjYmFzZToJanBnIGRlY29kZSByZWdpc3RlciBiYXNlIGFkZHINCj4gPiAgICogQGRlY19o
d19kZXY6CWpwZyBkZWNvZGUgaGFyZHdhcmUgZGV2aWNlDQo+ID4gICAqIEBod19pbmRleDoJCWpw
ZyBodyBpbmRleA0KPiA+ICsgKiBAbWF4X2h3X2NvdW50OglqcGVnIGh3LWNvcmUgY291bnQNCj4g
PiAgICovDQo+ID4gIHN0cnVjdCBtdGtfanBlZ19kZXYgew0KPiA+ICAJc3RydWN0IG11dGV4CQls
b2NrOw0KPiA+IEBAIC0yMzQsNiArMjM1LDcgQEAgc3RydWN0IG10a19qcGVnX2RldiB7DQo+ID4g
IAl2b2lkIF9faW9tZW0gKnJlZ19kZWNiYXNlW01US19KUEVHREVDX0hXX01BWF07DQo+ID4gIAlz
dHJ1Y3QgbXRrX2pwZWdkZWNfY29tcF9kZXYgKmRlY19od19kZXZbTVRLX0pQRUdERUNfSFdfTUFY
XTsNCj4gPiAgCWF0b21pY190IGh3X2luZGV4Ow0KPiA+ICsJdTMyIG1heF9od19jb3VudDsNCj4g
PiAgfTsNCj4gPiAgDQo+ID4gIC8qKg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3Bs
YXRmb3JtL21lZGlhdGVrL2pwZWcvbXRrX2pwZWdfZGVjX2h3LmMNCj4gPiBiL2RyaXZlcnMvbWVk
aWEvcGxhdGZvcm0vbWVkaWF0ZWsvanBlZy9tdGtfanBlZ19kZWNfaHcuYw0KPiA+IGluZGV4IGU3
OGUxZDExMDkzYy4uYTFlNTQ3MTVjYjdlIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvbWVkaWEv
cGxhdGZvcm0vbWVkaWF0ZWsvanBlZy9tdGtfanBlZ19kZWNfaHcuYw0KPiA+ICsrKyBiL2RyaXZl
cnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvanBlZy9tdGtfanBlZ19kZWNfaHcuYw0KPiA+IEBA
IC02NjQsNiArNjY0LDcgQEAgc3RhdGljIGludCBtdGtfanBlZ2RlY19od19wcm9iZShzdHJ1Y3QN
Cj4gPiBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ID4gIAltYXN0ZXJfZGV2LT5kZWNfaHdfZGV2
W2ldID0gZGV2Ow0KPiA+ICAJbWFzdGVyX2Rldi0+cmVnX2RlY2Jhc2VbaV0gPSBkZXYtPnJlZ19i
YXNlOw0KPiA+ICAJZGV2LT5tYXN0ZXJfZGV2ID0gbWFzdGVyX2RldjsNCj4gPiArCW1hc3Rlcl9k
ZXYtPm1heF9od19jb3VudCsrOw0KPiA+ICANCj4gPiAgCXBsYXRmb3JtX3NldF9kcnZkYXRhKHBk
ZXYsIGRldik7DQo+ID4gIAlwbV9ydW50aW1lX2VuYWJsZSgmcGRldi0+ZGV2KTsNCj4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9qcGVnL210a19qcGVnX2Vu
Y19ody5jDQo+ID4gYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL2pwZWcvbXRrX2pw
ZWdfZW5jX2h3LmMNCj4gPiBpbmRleCA5YWIyN2FlZTMwMmEuLjI4ZDA1OTA5Yzk2ZiAxMDA2NDQN
Cj4gPiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL2pwZWcvbXRrX2pwZWdf
ZW5jX2h3LmMNCj4gPiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL2pwZWcv
bXRrX2pwZWdfZW5jX2h3LmMNCj4gPiBAQCAtMzg2LDYgKzM4Niw3IEBAIHN0YXRpYyBpbnQgbXRr
X2pwZWdlbmNfaHdfcHJvYmUoc3RydWN0DQo+ID4gcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiA+
ICAJbWFzdGVyX2Rldi0+ZW5jX2h3X2RldltpXSA9IGRldjsNCj4gPiAgCW1hc3Rlcl9kZXYtPnJl
Z19lbmNiYXNlW2ldID0gZGV2LT5yZWdfYmFzZTsNCj4gPiAgCWRldi0+bWFzdGVyX2RldiA9IG1h
c3Rlcl9kZXY7DQo+ID4gKwltYXN0ZXJfZGV2LT5tYXhfaHdfY291bnQrKzsNCj4gPiAgDQo+ID4g
IAlwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBkZXYpOw0KPiA+ICAJcG1fcnVudGltZV9lbmFi
bGUoJnBkZXYtPmRldik7DQo=

