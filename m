Return-Path: <linux-media+bounces-45927-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6ACC19431
	for <lists+linux-media@lfdr.de>; Wed, 29 Oct 2025 10:02:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F50556740C
	for <lists+linux-media@lfdr.de>; Wed, 29 Oct 2025 08:40:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E50D73203AA;
	Wed, 29 Oct 2025 08:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="NIzCCNa7";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="gXYa3rBH"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566E031D74C;
	Wed, 29 Oct 2025 08:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761727153; cv=fail; b=HAYXpno5lPJ3Vt6t+NjjfLtHBQCceGZC+I7mCxFmCbHR4QPPft0zt3ecfHzlL3IVf5Zd0YJdrZV+mFPgtKSLdAyBCt565dQjdPIxmCRcrb64URO6YS32eced7CYVK/qMm3MmByyByMn4yzhKWQyUBNUsJ8BCBdZDyoKboUEk4uE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761727153; c=relaxed/simple;
	bh=DO9QFT9kLeGgeDoLwAVQJykA7BXIAMfWM2s2ok3HQzY=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Mo51dxJUwxq+MN8/aI/AsvvSR0u0yuqtBJY+AlWnKvu2aLfCgzvdv7F5XCfatSh5lSc9m8apjD6TF/Fmx4oE95WXrovCI2l+/u7VOdRvA+/psFkqx8ruQXClfVhBZZOVGmSL9Ah+MSsfSNNOsgZ3aHjT/imQfR4QeWPrYNF6oLM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=NIzCCNa7; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=gXYa3rBH; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: ba82a650b4a211f0b33aeb1e7f16c2b6-20251029
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:To:From; bh=DO9QFT9kLeGgeDoLwAVQJykA7BXIAMfWM2s2ok3HQzY=;
	b=NIzCCNa7vYAod1rRKij71L4JHZGmLGlFaP5qntOZRCo9nYtau3jlsZZ27yBX5AU7E/Q3MicMQ9UbPw9HgGjn/Jw5US/nyA2xLptxVMDXBjir3l6b9VhMwDNsQ9GLCCOQrDuFgR/hwMNnOCExQqu2leyJeeETTJzUoCvAYgN84Ls=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:e3b233e0-3920-42b2-a38a-c17f7662ec68,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:dc7bf258-98d8-4d0a-b903-bc96efd77f78,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ba82a650b4a211f0b33aeb1e7f16c2b6-20251029
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1354121144; Wed, 29 Oct 2025 16:39:05 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 29 Oct 2025 16:39:03 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Wed, 29 Oct 2025 16:39:03 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=amjbcRrzOWu0rt/ZfYinCxJrOADRY4mfDX5PYHKDUzZi7bYAW8WbiIWXQGHGmzDNjrAiyS+NHwWDxGrP46XMefD1dZv9ycPH2KM1smHyvd9YwYifbC2TPhKwU7AzDRgXPjDiW/5YWPokfG+e4VecEyo/Qi+JPY5WE4A/EPMKwoee/S7EgmwvV+Jgc2hmi+r9l7HvGGIPWmDfNLkl7VOKoJKbhMlul6l3ECruyjZxKDp2zVNmeoXUvIpsTMIT39WBmKqjvTXrzZgcUGXDief8JiCizDr7bn0iHuEFsZ1gjf/zKu94S+mO07JfWwhMQVl9bD0bDBgUvWyNwkboqBIxvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DO9QFT9kLeGgeDoLwAVQJykA7BXIAMfWM2s2ok3HQzY=;
 b=jzxIgNWIRTktT9Np7M/Kc7HxcwBQhoF7wWDH4jHxAFbk+Qg7hh1hEp7HM3TqKs+nT6RV/LcCOULScQ73VpmpKGs7rEaT5bjxc8P5fPQzSCS8r6nqx6EQ5726rdc7++U4L9cBH/PQ4zluiXbSBnCGs+gZ4obSR4vLaW6346VNEV6OoIrhBok012qG9xloSt//mAaiXxKF+8NKMkArxAbMEvaIrnsrp/FYYWWR+Aj15YylGobupwknxjVHQKb0XU+q0YIv3qGnft0n9LVKckpQq4yyq8VlMJ4Q9JfEhbvk3OPoVosRloV39G6V88F3D5usa5Bm/2Odr68TyHGzMTo6aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DO9QFT9kLeGgeDoLwAVQJykA7BXIAMfWM2s2ok3HQzY=;
 b=gXYa3rBH5u/MXfDzWZasPSV4lRYqladw+B+qGXuTJ/8yyiluGABi6ixX5NXPZHhFzDCEN3g25pGvd4ZRUg/lvvS54gq0rFpYkWkOksQhudURhiT/5hKSUAyshPZnwFi7s6QccDiPWtcQfXYGFzEdjT9ztT1B607kxhvOKnvGwP4=
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com (2603:1096:301:b9::5)
 by OS8PR03MB8825.apcprd03.prod.outlook.com (2603:1096:604:289::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Wed, 29 Oct
 2025 08:39:00 +0000
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::a013:f3b3:a461:8ece]) by PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::a013:f3b3:a461:8ece%4]) with mapi id 15.20.9253.018; Wed, 29 Oct 2025
 08:38:59 +0000
From: =?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"krzk@kernel.org" <krzk@kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>,
	=?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [RESEND v10 00/12] Enable jpeg enc & dec multi-hardwares for
 MT8196
Thread-Topic: [RESEND v10 00/12] Enable jpeg enc & dec multi-hardwares for
 MT8196
Thread-Index: AQHcSKx1EuVD+ifMFEG/10aS9lalabTYyKQAgAAE8gA=
Date: Wed, 29 Oct 2025 08:38:59 +0000
Message-ID: <4828487bfa21a9f036716bdbf5719ee379224290.camel@mediatek.com>
References: <20251029081717.29551-1-kyrie.wu@mediatek.com>
	 <b319c2ca-72e6-4a11-a9c5-7ff78ab94cc7@kernel.org>
In-Reply-To: <b319c2ca-72e6-4a11-a9c5-7ff78ab94cc7@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR03MB6186:EE_|OS8PR03MB8825:EE_
x-ms-office365-filtering-correlation-id: 070986b1-7367-4d0d-8d0b-08de16c69b41
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700021|921020;
x-microsoft-antispam-message-info: =?utf-8?B?REVQQ0J5Zmk2bDVOQ1ZiM09RRTQwTFEzZnlKQ0FsNldJOGNQSHhoNFI0ZmtV?=
 =?utf-8?B?ZE14dVdpS0RUVkZ2RTB6TkVtZGlYbTZpM2J3UG9yQ1c1Uldvb2xzMnRocUR3?=
 =?utf-8?B?V0I5eGZ0bE1ycVVteFBYR0FGdEZ1N1hVbWFhZkpDK1ZhemhmU1lsSVB1L3NP?=
 =?utf-8?B?bVNWQ0ZyUmZZeitjcHkwZG9XR0N0ajlNWXpXN0JjVmpONE4reXBBNWFzcGxp?=
 =?utf-8?B?eDJINEtDTG54bHZzTE9iVkN0ZEFHR3FDUUJyT2FFSHlEZGJiK0ZKcVNTVWNl?=
 =?utf-8?B?a0pld0VPMnFUU0wwQ3RyMUgyMGhoZURySk8xa1FvL1pQUGRoNzBUWDBWV0po?=
 =?utf-8?B?alkzSFI3b3BTVkFoMmt6S2ZlK01mWGpTOG10b0pURWIyd0dSZkkyLzQ3QUdX?=
 =?utf-8?B?MzNrdm9zcG1vTEtRbzhWczdILzdTQkNGNFdRWEM1WGt6T1JYakRNeFZlN3d6?=
 =?utf-8?B?T09XaDVuT1VQSEd3SFNORm4yWkdHSWxpWWpUNFRyTFhJWHlFTjlSL2FUaDRz?=
 =?utf-8?B?WFJCUCtTTk5IVVBzWWpiNVU4dXJpa1k4KzhvUzFHemZhZ0dIRlUzbEVLUWp4?=
 =?utf-8?B?WlpjanB0WENVYXJKQkVhRnZKWWo5Yk1Cd2tEZ2d3M2JubVdRUTYyK2I3bUR4?=
 =?utf-8?B?ZDhBdXhrU0c0L3FMbjA5aThXOUIyUHUzNnFpSDZmcFJZaTFaVUNjWmkvU01U?=
 =?utf-8?B?aVZ6THN2YXBrTDcyVlVobFQvSDAvTkFYOUF4VzIrQ2d0SUhDM2wzSnlXbHVn?=
 =?utf-8?B?M1NOWFp3TkFyRkNnZ1FaajdXU25STXIrYkQ0VVFSaVNmUXZQNWtPVlZmcHBu?=
 =?utf-8?B?MUV3SVRWN0hwUktxa3BiampNS2ppc0xjV1oxZVNPdzgyZUM3NzF3Y1pqcUUr?=
 =?utf-8?B?VlExdFpTZHFoM3VaWjNvVkFuaGw2bGdPc1FpNkNlTFY0TXhheS9aOVBsRThj?=
 =?utf-8?B?c0tXVWNqYkdXSGg3ckNIVHNaUTZCdXZiK05yWkFWUE9ZaS9WSzIvMXVlWC8x?=
 =?utf-8?B?QkRmeEcveFBkME42WlI1ZUlOb1cxRGZjYXYyYnZwazIvSkNONkNVRnZzd1hh?=
 =?utf-8?B?U0EzN0FNNi9lMDVZeFNKWnAxNEtCN1QzRG12YnVFbE1sTnFZMFN1bE0zb0xw?=
 =?utf-8?B?ZGhpMUM5UDA5a1lBRFZ5allFaTB4TmE5NWNZSk5mSmpNdjMrKzhMVUE4amFQ?=
 =?utf-8?B?aGIxb0EzbVdjSVQwbDJva2xDOFJERGR2RlBUMjhVSTlQR3hvcjdxZ0kyekJD?=
 =?utf-8?B?Nm1lYTNQbWR6Z1p2cUtTTHFXbExxMnRGZVJ4ZmlIRGNLM3lVamhNUlYzRGNm?=
 =?utf-8?B?ZUZOdGduVHhRY20ySkdCeWR0dlBqVENPZXBTUjIwaUkxOVZmK3E2UEdkWEU5?=
 =?utf-8?B?c256UkE0NkVTOGJCWFZHWEN1bm4zUzRFK1hraDlvVkVJdEhlZE40S25jRmJj?=
 =?utf-8?B?cnhjeVNCTGFJRXlpellzVGQzU245ODE3Q1VQdUUrV1VFdXY1VkJwU0M1TVhT?=
 =?utf-8?B?TEdOQkNGSHJHbm1ZUHYrWmp2Nko5LzNiTnZBaTRtNm9EMEVLWktEcWtWKzNj?=
 =?utf-8?B?VlJqditzRms0c29vYUp1Ky9UUTBTNDRzS09oNXB4SVJSVlk0Um4vcHY1Q2pa?=
 =?utf-8?B?WVViV0FsYXVXVWhDZmdaRm5vTzF5Uk5sUG0weEtFM0dhNFZ3UXAxcS9PNkpz?=
 =?utf-8?B?NE1mTWZ6YU5JRmszWWpoTkVJZVJzaCs1WUVPZERsSUx1K3Zzd0EyVWFYaHAr?=
 =?utf-8?B?Z0xIZnNnSTVITFluOEsyN0lGNThMTW9Lekl0ekZSSU1EdTIwL3FSV2VnU1lp?=
 =?utf-8?B?bHovQm1BUm1WUU1wZC9LOTIzYmlkdU0wblByV0NrZ21TbEswcEhLSXhwa3Uw?=
 =?utf-8?B?MlJ3cmtXU3FXUXpsYnpBWGEwZFZKZWk2U0x6WXB0eTIxSGtrTHRSdDF1aGdj?=
 =?utf-8?B?NU50QVpXKzNnSXhCbkFXQVByRUNOQ2orRG9HOGM5YnE2bTNYU2ZjUHFWRW93?=
 =?utf-8?B?VitCZUVvRjV6a2xLQWR0bEtnVWdoTVF3MHpsUXdpRlArUGp6VENQM3FtV0ZT?=
 =?utf-8?B?bjFZdW5QazlPajlsSXgyVFYwYmJzNXpvYzJ5dz09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB6186.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UVRjcGRlYjhJN2dUeTVQa2dmT2RmaDdiK1FNVmFSek01V0Z4Szl4dlA3ZWVi?=
 =?utf-8?B?UHR4djFqQnYzYUJhZ0JFeEloUzN5TDN1a2wwdnVEZDZHTTZmd0p3NWtvMkw1?=
 =?utf-8?B?YlFYbUE4ZS9TWk9GbHVsVjRqbkJoM0tTSWM3K3g1ckFPQ1c0dEF0ZWN6di93?=
 =?utf-8?B?dUg2M1dEWGljSHdPZEJHRnMyQUUrWnpmU0F1ZzM5eDN0NXFyOXhrVHV2bkRC?=
 =?utf-8?B?VmJxNTZhKytqQVZTSUxHN3hCWDFkTzlkWXV3S2lPcEhzQ1hXK1VuWUVuVFVi?=
 =?utf-8?B?VTJOamRabStlU3VzSlM4VUwyUVJRWVRFbzZ5ZWRoenZkdjVERWQ0WE9kdlpa?=
 =?utf-8?B?WU1VQ2tSOGpVSmlMeWZWUUhGWVdmdGNSZUE0SWxEQUt0L0JQREdhcFJFM2t4?=
 =?utf-8?B?ZENVNVhnZDJ5cDliSmFwTE5NTFhQS1JyTEZQSlRIcTQ1eVBqK1RhZExyWDRp?=
 =?utf-8?B?blB4bTRRTDBXYzZnU3V2R3NVaDdJb2lsUlcrTWFxcTRRREMyZm5YcWNPZTRr?=
 =?utf-8?B?Y3drRmRVRXZhZ1NGa1VJL2V3aDFnS29oZ2ZiZWpLYUVDVE1BK1REcTJzRVdV?=
 =?utf-8?B?aHRyK250WFpEaFdlQVBLZm1pQjJ4aEduWk1oRjFmdnRqeXFYTXVVNHpyVmhU?=
 =?utf-8?B?VzA2T25EK25LZGREOHNXUHE0S0sxUlpISVNJa3pUTCtaT2lMeFhnaUZXVjV4?=
 =?utf-8?B?V2ZEbjJvSlBLcnZOKy9DOTBXVjdHSXNOaXFNaUFURHg4enB4djRlekxZVFlm?=
 =?utf-8?B?Ym5QWWFteUNwQ0RzcDlFUzRESXMxZEREVlF0VzdTeGhqeWpQT0hjd0VTWE9q?=
 =?utf-8?B?cktLVDJ4Umo4WXBuYldIVmxFc3pFRmt3d0JDNDNuVDE5OTRIMkt5aEp2TVJQ?=
 =?utf-8?B?aTdMNDR0WHozY3VDQ25KQWVSMmZxTnZkb2xwbk1xa1pHSFVSbEFKUEUrOVAw?=
 =?utf-8?B?TUVYYzVlYmluSHZ5WHBhendrWDRNV0h5OXJLWk5tZjJPQUpHYUpCVEgyQWlS?=
 =?utf-8?B?NVVFdkdxTnJubSt4Sms1QUxkZVB6TWcxS1krY08yMDZXV2FITWtxQVdXbXRQ?=
 =?utf-8?B?ZDQzTVBJWnFwSXE3MTMvTTdzVlB5b21DQ01USEEwMjNqdDRQVWF6bGI2WS9u?=
 =?utf-8?B?RGRZUU5aWW5CV3pQWjhzYjlZZjl3ODhwdkFFQzVlZnJISS8xc2JhWTlCdGZs?=
 =?utf-8?B?QlZFZnYyUXMwRHNqT3VQenNoWHFKZGpBaUlJT0NFS0hMZnp1dHJnbWp4STNN?=
 =?utf-8?B?TWRqZzdQRlk4Y2h0K1pxZ3dyaThveWE2VWg2SVFWaUlTZEZaTGZDekFkVUNt?=
 =?utf-8?B?VTBFay9oc1FjSmxUQXB1VW5qQzU4Z3BXTmQ5QUdDTVBGRk9Lb3V1NzZ1Nkps?=
 =?utf-8?B?OVpkZ1A0WDFNRGcyVTAwbllscW80bW9RMDBBdnNDNDJIRDhyZmJVSmYzYWls?=
 =?utf-8?B?bjJJNW4rOXVlOERITWVIeGxQaEtMdzIxcHBDVmRBcW5yVmFwc0x0cVpyRG4x?=
 =?utf-8?B?cjlveFFHZEpuTDVyanR4Q1dXRkVvaXRoekZFUDNqQ3kvd0dFM043RHNKdHZH?=
 =?utf-8?B?ZVNJRC9OcHpNOW14TGFTaHNmbWg0VWxxdS9VbTNpcjhDUUxSUk9udTBaSUEv?=
 =?utf-8?B?dm1MS2o5ODhYYUpkM1dHVjZROVVCR0FWQ0NscmlvalZEUlZUYWxhRmwrampF?=
 =?utf-8?B?WTlDQWMxdmFycHNQcDJib1RrZlZUVmw2U0pKdG41SHhtK01zRHdWajdDS3Jx?=
 =?utf-8?B?MWJlMGpwc1ZzMU9aUTBJUStUcXkxMUk2ODNTclRnVTc3d0I0b2NRek5HSHBK?=
 =?utf-8?B?MSsyTjdVakk3S29aQXNOVzIvVVdxbzg3dzJORXNHWG5MWTZETTBuMjZGNjU4?=
 =?utf-8?B?VjNHYzdiSjNjemZhNEhmTTdCTmtsK1U5R0tDL3JPdmNxcUdJdzVJM1p0cytn?=
 =?utf-8?B?VHBzSXBhdlBFOWJhdTJZRCtlaGpxWERRT0VEMFBQbGpyRmdiZ2ZjWUdtcW9Z?=
 =?utf-8?B?VDVpRVZQbVBEckI1SVNvYUNVaW53aGdySFU3L3A1N2U3ZmVuaHFrTXhSSVB0?=
 =?utf-8?B?Vm50cjF0RHdJSjM1ZFVqeUw2T2VPZTErS25QWm9hYU1JSFRFZmc5UzR3TDdW?=
 =?utf-8?Q?l1sB3qzN//daILmul3tgg5Fcp?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A070CEC4E0445545B44122CDA4EA5673@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB6186.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 070986b1-7367-4d0d-8d0b-08de16c69b41
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2025 08:38:59.7075
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gi2NiELFfgjcypHNaoNbqB4F+5nz7n+ujU9ExXdOEncjuBsd1j+/lp7Il6IJtS4P//MO/OHrmjcKlOZIByGdcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS8PR03MB8825

T24gV2VkLCAyMDI1LTEwLTI5IGF0IDA5OjIxICswMTAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiANCj4gDQo+IE9uIDI5LzEwLzIwMjUgMDk6MTcsIEt5cmllIFd1IHdyb3Rl
Og0KPiA+IFRoaXMgc2VyaWVzIGhhdmUgdGhlIGZvbGxvdyBjaGFuZ2luZzoNCj4gPiBGaXJzdGx5
IGZpeCBzb21lIGJ1Z3MsIGluY2x1ZGluZyByZXNvbHV0aW9uIGNoYW5nZSBoYW5kbGVpbmcsIHN0
b3ANCj4gPiBzdHJlYW1pbmcgc3cgZmxvdywgZml4IGJ1ZmZlciBsYXlvdXQgYW5kIGNsb2NrIHNl
dHRpbmcgdG8gc3VwcG9ydA0KPiA+IG11bHRpLWh3DQo+ID4ganBlZyB3b3JraW5nIGFuZCBvdGhl
cnMuDQo+ID4gU2Vjb25kbHkgYWRkIG10ODE5NiBqcGVnZGVjIGFuZCBqcGVnZW5jIGNvbXBhdGli
bGUgdG8gc3VwcG9ydA0KPiA+IE1UODE5Ng0KPiA+IGtlcm5lbCBkcml2ZXIuDQo+ID4gTGFzdGx5
LCBBZGQgc21tdSBzZXR0aW5nIHRvIHN1cHBvcnQgc21tdSBhbmQgaW9tbXUgYXQgdGhlIHNhbWUN
Cj4gPiB0aW1lLg0KPiA+IA0KPiA+IFRoaXMgc2VyaWVzIGhhcyBiZWVuIHRlc3RlZCB3aXRoIE1U
ODE5NiB0YXN0IHRlc3QuDQo+ID4gRW5jb2RpbmcgYW5kIGRlY29kaW5nIHdvcmtlZCBmb3IgdGhp
cyBjaGlwLg0KPiANCj4gDQo+IA0KPiBObywgZG9uJ3QgZG8gdGhpcy4gWW91IGp1c3Qgc2VudCB2
MTAuIEl0J3MgYSBodWdlIHBhdGNoc2V0LCBkb24ndA0KPiByZXNlbmQNCj4gIGltbWVkaWF0ZWx5
IHdpdGhvdXQgYW55IHJlYXNvbi4gVGhhdCdzIGp1c3QgY2x1dHRlcmluZyBvdXINCj4gbWFpbGJv
eGVzLg0KPiBBbGxvdyBwZW9wbGUgdG8gYWN0dWFsbHkgcmV2aWV3IHlvdXIgY29kZS4NCj4gDQo+
IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQoNCkRlYXIgS3J6eXN6dG9mLA0KDQpUaGFua3Mg
Zm9yIHlvdXIga2luZCByZW1pbmRlci4NCg0KSSdtIHRlcnJpYmxlIHNvcnJ5IGZvciB0aGF0IEkg
cmVzZW5kIHRoZSBwYXRjaCBzZXQgYmVjYXVzZSBwYXRjaHdvcmsNCmhhcyByZXBvcnRlZCBhIHBh
dGNoIGVycm9yIHRvIG1lLiBCdXQgSSBpZ25vcmVkIHRoaXMgYWN0aW9uIHdvdWxkDQpjb25mdXNl
IHRoZSByZXZpZXdlcnMuIEkgd29uJ3QgZG8gaXQgZnJvbSB0aGlzIHRpbWUuDQoNClRoYW5rcy4N
Cg0KUmVnYXJkcywNCkt5cmllLg0KDQo=

