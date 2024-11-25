Return-Path: <linux-media+bounces-21925-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 089739D7BD3
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 08:00:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 575C3B215FD
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 07:00:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 068FF186E56;
	Mon, 25 Nov 2024 07:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="qdtwDiwo";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="htAXS+hR"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6792C149C53;
	Mon, 25 Nov 2024 07:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732518021; cv=fail; b=WQp2+85VDFRrYBsBfSfRhPpvmd4j12VRrtv7lEKj+pOVqTEaH/+jXxObX+KMHJp9vVsZuUrpSVTg+wTFvi5DMkk2VvZ8gxBwV1kJfccb9zbkjfLhi9tbuiR/2o/119eBiK0rLzwSFRrFQPlDJNimN699aJ3bcwlYRs1dYTUP1Tk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732518021; c=relaxed/simple;
	bh=c+EulI4Uqo8tfFmEfFJArOSEfy2PAOfEgVW8OiyTsF0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nNXOwSJRP+RPWoW4i3H5f5dW9aSP60CTWVTbekUGLYLclZGhTthT/+kFtWyrTB//Y91dZasfO778cGD7y7vaK+N/s/AN69lsUQqWXGqZ4l+g4J451R02WqtCPFTHObYTv9gqOcbIlZ6C7u1KpBDdmVKmugDQw0xHivfpjT/UFzg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=qdtwDiwo; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=htAXS+hR; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: e5326848aafa11efbd192953cf12861f-20241125
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=c+EulI4Uqo8tfFmEfFJArOSEfy2PAOfEgVW8OiyTsF0=;
	b=qdtwDiwouvQf3fn8GJ9SypO2v7ILcY/zoyosKAhq3Yu/TCNibbxYL13BitFJRk4o++VCfj/279J8rd8R3ZsDCEnPOdyZmrVARCrNiu1KlFj0O+lOZ81yOGXHOy7zRrr9JkhmdsZjwPCJJre3YwHAyRynSgsW4rADpNyzDPLZq3U=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44,REQID:aee0a1b0-8a5f-45ca-a744-32ec99c807ed,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:464815b,CLOUDID:af6d7323-634f-4016-85ba-2d63e55c9400,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: e5326848aafa11efbd192953cf12861f-20241125
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1181888799; Mon, 25 Nov 2024 15:00:03 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 25 Nov 2024 15:00:02 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 25 Nov 2024 15:00:02 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uL7jDeefd5JT/bDG1RgEOfdxRUHATCgY1OjA/1Vj/cF29c9I3leSfxcsbka/35KWfHvPccGaJ8nS4f3wyyFTwjYu/C75BbfD0dLucq9E5H3iBKDlwdWKrYMIZQnhLqFgP17GHhTn2lkZoeJaHWUWqbGkUcloGL78T3HBAD/7St3K7OV5DZY/BmDeeTLo0pOYo7T/nXcdrrwB6xdTHFkcSPP/QY/Tle/BNBiXHnBxO+UheKWqwFmvtmhX7mf1UpBA50zqKrocOhcouXNO/7EafDztCdhMrgtUNsnp3f36ionjoxTbIHqoakft89Qn054pap2RQ7v2OwuRTd7JDfj7Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c+EulI4Uqo8tfFmEfFJArOSEfy2PAOfEgVW8OiyTsF0=;
 b=k6neieHZGkNQGNciSj+30aHsYyqFHRz9zJIlkNxF/53Z6n+Mqzen1/7F3hdc601r4562Jf8dio/MaMNgsvZnC0MtXVb7bMv2yE0kSTSCznvfqGcwRkzG+JaSKMXBzBv9w9qNRASsf/MubZW0uSs1sHk6NWa075VBq2ItXienVRZEnIlWlCexeJS+L39YTRoZP2xdg6RE/sfWGi9z5IdtfMbode4oog2OexwNJMs1XbMBoC3sSyF+k26h79weQK0CRSGKWwpn06Z3L3Oi3vw9EEnmRMz4HR6EKre+PF4rsGafMfc44axMOPh6s0brqgbxF6x31Awm2K8C2ZW5cPOYCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c+EulI4Uqo8tfFmEfFJArOSEfy2PAOfEgVW8OiyTsF0=;
 b=htAXS+hR/o+iCiokMDbmpBSkFAhlKtn4/jZRYXkmE67S5DbgWm5NLjwtQZA8fnBQAlvpCO2tpTSKoL1rq11f3M/VgpHrMaDKVv5nIiLm/0fKkJMmYZYKd5NBCd4Jn7TksF74EIZRT+38hePIFi/J5GbN3sK+XLFHIiwcuRst0HU=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB7553.apcprd03.prod.outlook.com (2603:1096:400:421::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.19; Mon, 25 Nov
 2024 06:59:59 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8182.018; Mon, 25 Nov 2024
 06:59:59 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "mchehab@kernel.org" <mchehab@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	=?utf-8?B?QW5keSBIc2llaCAo6Kyd5pm655qTKQ==?= <Andy.Hsieh@mediatek.com>,
	Julien Stephan <jstephan@baylibre.com>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "laurent.pinchart@ideasonboard.com"
	<laurent.pinchart@ideasonboard.com>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"paul.elder@ideasonboard.com" <paul.elder@ideasonboard.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "fsylvestre@baylibre.com"
	<fsylvestre@baylibre.com>, "pnguyen@baylibre.com" <pnguyen@baylibre.com>
Subject: Re: [PATCH v7 4/5] media: platform: mediatek: isp: add mediatek
 ISP3.0 camsv
Thread-Topic: [PATCH v7 4/5] media: platform: mediatek: isp: add mediatek
 ISP3.0 camsv
Thread-Index: AQHbO/Orh37t76qSsU6WSMvGDnK0HLLHl18A
Date: Mon, 25 Nov 2024 06:59:59 +0000
Message-ID: <a9aa69dc8d025f0b133f33de6428ffec5a881a2a.camel@mediatek.com>
References: <20241121-add-mtk-isp-3-0-support-v7-0-b04dc9610619@baylibre.com>
	 <20241121-add-mtk-isp-3-0-support-v7-4-b04dc9610619@baylibre.com>
In-Reply-To: <20241121-add-mtk-isp-3-0-support-v7-4-b04dc9610619@baylibre.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB7553:EE_
x-ms-office365-filtering-correlation-id: 86396f2d-3671-47e0-b50f-08dd0d1ec714
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?eGdmdHgxeCt1d3NMNVJZWXNTbWhXTzZkY0RMaDVqQ1M0ZzdLK3RjTUtZVmZ6?=
 =?utf-8?B?OERTR1JaWHQzbjZwNk1mcW9ndXkwZ3hnVktyamNLNWpMUHJXck5wOEZaSFVj?=
 =?utf-8?B?VEROcFJqY29ySzkvZ0JITEFwMXp1NzFGNEhmNXo1c3E2TUxFYnFsdjBzdi9s?=
 =?utf-8?B?MnpydEpoTWpXLzc0TUZkbnRnek5sV0xDc3AzekQ0MlU2RWkybTZJbDZSN0JL?=
 =?utf-8?B?Q2I1cFNHRDNOTDJ6QjJEK0lDZkswRlh2N2FtM1ZQN0ZOTnh4ZGJneWpPRFpS?=
 =?utf-8?B?V0p3VmNNanMxaHZia084b2haNGRCaHFZUmxZZmdXSXdIRTYyN3pabExSUWVO?=
 =?utf-8?B?WDR1U2dMQnloZzQxQVlHbWRaaU45cWFtajlYNUtaUzcvMFhWdndYSUJUcm5u?=
 =?utf-8?B?bzkxWGRxTmdxbmVIc09hQzlRdlRpUnM3TnR3dkJJMFpkYnlYVkZsVHo1ZDcv?=
 =?utf-8?B?L3V2QmFnR3ZrbUc5TlhrT1U5bkdzRzd0K0kyU0VnR0hNNDh0S1hJZnBrZmNw?=
 =?utf-8?B?Tis0ckFSZGw5UDZHREJtNmVjZk5qSEJuaVE0dUx6aWpkUzNEWWtZQjIvVmhk?=
 =?utf-8?B?RUV2ZGdDM0laeUdZdytqbUY4d0V4eTVwMWx5SEUvRFE5ZzIrTkxvekc2U3Fa?=
 =?utf-8?B?MW96V0xLYzJqa1VhZ2VwTkhvc2NobGcwSkd4UFROakNqYVAxeGxSTzhpejNa?=
 =?utf-8?B?WFVUbkJ1UDB1WTIrZU1ZUnc0Zm1JZUFzd0J1NWZsalkxS2RkdUdXWWdsalBD?=
 =?utf-8?B?V0FNc1lBNTB4MHJCaSttWEkyZG5oZlJkdnFRamVqTVQrOWxPVlZ3dFNxY25U?=
 =?utf-8?B?bHF4cjd0K0FwZFNPV2l0aVdTNHlkYzNacEd6aWVGTTE3aXlWZjlxNzhFWkJR?=
 =?utf-8?B?UVNqdTdRQlpJaTdoZHpiWk9LRm9UNTB3Y2pwMHRUV3RrbVdncWEvQ0dMZzNR?=
 =?utf-8?B?TlVlVnJmdGVMVnc3RXIxUjZjSlRGYmJpTERGQ2JaODRWL3o2UCtiUWt5ZG52?=
 =?utf-8?B?Qk9INERUZHkzSmRtdC81SkpYUXl3N1NRSlJRakdmaGtWa0dWd2xKTnVKKzdW?=
 =?utf-8?B?QlEya1huK2xtQ3NJZGp1bVNjV1M1d3E0S2Z6L0RFOVVpMWlucEdhMVp2MUs3?=
 =?utf-8?B?N1hORFNyanFkaWJINW53dUVUK2tvR3o4ODdKQWlsbkxBZ0lHVThzekN4OGJN?=
 =?utf-8?B?dWdUTlR6NmljSi9OQVRON1R6NEtHYlNROXFkMmh6WUVTSFE5b1NZcGFPdnBr?=
 =?utf-8?B?cXFZSmpTZWhqWG90N1RlRXlha05SRHowM3g1OWQ1OGhodjZQaW9kaXVGNU10?=
 =?utf-8?B?bHhkWnUwdWZIazJaL1poYVovZkZUTWt0WW1ISWl6dmNndm5Ib0JVbFoxL1g5?=
 =?utf-8?B?RXo4S1B0T3RxTlRLOHJRSHVSZ21CYnBRT2ZyWncxbFFidHdMT3loV25rUW5L?=
 =?utf-8?B?WUpvazF2aUpCcXFDeHR6dHBGeEVOalBRNmZWTzNuYXR3U1JySHNXMnFOZzBD?=
 =?utf-8?B?SDE1RUFOV0J2VkVtWEtyNVJFVEkvdWpGSEtmSnB4UXNyZERoMCtaaS9JNDFF?=
 =?utf-8?B?MFg0ZW9DelVVVjU5dUtIL0ZQcGtaZ0Jsdkt6OURBelpGQjBsZ29lWUlpMjhY?=
 =?utf-8?B?a0tGZm0yUUJhaDZqODM1bVNuN3BOMytGeE5MUWhIM2tZNWw4MDB3MTVYYzVa?=
 =?utf-8?B?eEpaZGt4UkJNeHdZdGVORUxoUWM4bElYNnR3NDZ1RWx6dWtKZExaNUZWVlJE?=
 =?utf-8?B?Yk52dllWaUN5RSs2cFBoKzQvaGhLRklDYk9DaU5CNElJZThzSUQrbzREY24y?=
 =?utf-8?B?VkpkeXFyTC9RVFJkOFhxeWNCclVBb3NCa213dUJXQ2xMbjRWSkJFSFJTZzJR?=
 =?utf-8?B?RjB6YUJyYnBNS2FxNmlJRWtZS080a2lEa1c1UitXODZOTVE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SWdUeVRNNmZneE9lRjJSTVhIYi9waC9LNGljSE83SDJFRzVsdzBnQStKaVZU?=
 =?utf-8?B?ZmVPZDRZNjhxanpKUEtWcTVMWmhweE5CeUdPMzQydVA4YUVYK0lCcU8ycW1Q?=
 =?utf-8?B?VHJ5U1VjdUU3emxMM2pwZmNXcGxZZHpxMVdyZFB6eStoZEN6KzZIUXQ5c2hT?=
 =?utf-8?B?cngyT0ltelVObkdvcjcxa0wvM1VrMnRMdzFpa0t4WFdYOW96UUVybmhWNEw5?=
 =?utf-8?B?UjNYQnAydWhpbHBtMjk3amMwVEZyMFNYbXEvVFIyOERMRENpZmk5TkpFdFZN?=
 =?utf-8?B?dHBLaUVpMjJaRmpyaEZYYlZvSVkwWTEwQW4vVWY4QVZaeGNRdml4dVRaeWRR?=
 =?utf-8?B?NURYRzc3cTk5bjA2c0JOcTFJN21XNjM3TGNJUjMrVUNvSW5KREFhNlhxaWJD?=
 =?utf-8?B?eTI0bjZKbHpLcmFnZUU5KytoeWN0UE8xZjgzV2pmVlpMYVNqZ21HY1RHVmJG?=
 =?utf-8?B?anBSNFRGRloyeC9zZTh5dFU4SXBjSzM4RzdDRjN4dHhYdlRXOFBlb2VIeU1m?=
 =?utf-8?B?QTZadGNoSE8reEVvRENGRzNURnhaUzNDN3Y4VENhQjgvTW5sTlRQL3ExM0Jh?=
 =?utf-8?B?NE5qVFNLSEdLWXdFalRxaWdzV3M4bXBqaUR6ckgzdTNORTdhNmJ1S2hTVGxl?=
 =?utf-8?B?SmNYNURhdFQvOFRybUpaN0RVR2wrRGRWRk1yZmhRSDNKdWpTeG1EYW9SaEtj?=
 =?utf-8?B?UlNpazZEMmtjSUJVRzFXQXFrUFVieHk5NVNOZ2hYU2FoeTFpdjZBU3ZwZ2lq?=
 =?utf-8?B?OVNVU2dMLzFxUURDQTNzTENZTncxbWw0SUpGMTgvMHdCNTFBT0d6ajV3Nkpx?=
 =?utf-8?B?UkhyR215emRBaWpRVStlaEJ0VmN4RzRaSUErMzFIbWhZMEZ3elR6dkxybmdK?=
 =?utf-8?B?dE54d0JRQ21iYll3OVZtMDBWWlNXOXRJSXVQYmthYjBObVIrQzAvbDZ1eWsv?=
 =?utf-8?B?b2xQa1ppL1hvc1ErcGJMWVRrR1hKUW01aWtSNVJTanJVL3gwZU1lWFdiSUJM?=
 =?utf-8?B?cllMV3NTMDJPNjJkOXZkV3lvYW9lT0loR3l2QXJ3UFpMR0w1aHl3SE0yL0wx?=
 =?utf-8?B?K096M3BwaTVTZko0MXpMSVAwazYxWk1wN0lWV3lsOXJMYTU3aUx5VUZMSy9C?=
 =?utf-8?B?VEpoQ2ZKQXh5OTliZnp6VTJ5NFBlbndHZ3lnRmNiS1V6ajd5S0I4ckhPOVBl?=
 =?utf-8?B?Qlh5d3I1ME1wYU5TcXJtSmZhZEo5aEEvQVJtK2ZBWjV5SHd2a3E3WDNZdHF6?=
 =?utf-8?B?a0FBVnJCNFdJYXAvK3pvSFhteGtiZHNDTHNISU40NjU3enEvckJhOHAwVWJ0?=
 =?utf-8?B?RzFwdWh2NzFRZ3pkSzRCWEpJNk4wOWExUU13RHVoZFFnS1U4RWwrNlZSamp1?=
 =?utf-8?B?SndRaU5UN0lTdXlwUWtZUnJ6OG0raDFEeGMyTS9CVE1zRDdCQmtiamNDa1Rh?=
 =?utf-8?B?bjFWRnVwb2xsRUNNVmxxMkVEcEEzaEIyb1RvK09MSGRaSm9ERnZJVzBrZnF3?=
 =?utf-8?B?N0xMN0F5cnQyZWtNdVI2VTdwV2tkTkxpUGNxa0I5SmptL3d3THJWWmVwcHd5?=
 =?utf-8?B?UitmTzlIMWxZTjA3L0h1Z2VuLy9oMU83dUhDL25COURNb0FmalBUZXZHTWlX?=
 =?utf-8?B?Z1pNd2VMWGxMcU5sYStBSStqRGZQZGFkR2VucDJwTHhpRTA5Q3NBdXQxNCtn?=
 =?utf-8?B?OFBqNWE3RXVwckwxaC9CMVZqUUdycEhOK3dWWlJ1aGlWL21KbzdJditYUGpW?=
 =?utf-8?B?VmorS0IrYktCQUw4T0p0TjZEN2JCVk5maWQ3eE93bmwxeWprQ0ZWQUtmZGV3?=
 =?utf-8?B?R005aC9DdXhrMS9QWktxclJSTDhZcDhoYnczT0VKR1h5enNaUkR5T0llNXJa?=
 =?utf-8?B?ZTFkYzh4RWlXN1hUVDc1ZWRoN1VuYWV3Y1pkR2MySjNwTWQvYnRObHFNZ1BL?=
 =?utf-8?B?WlhPZzFPM2duMHFrZXcvSFZ6M2NPZElNOXRTRVZ2djhLZG5CYnJ5cWxlWUlM?=
 =?utf-8?B?ZlhNMHZ4V1N5SUlSQ2RVSEJrWVJBNHQ1YUlCVlIzNzJsWFJ1amZpdzc1eDc4?=
 =?utf-8?B?eWhKSTBoTklMdTFHZTVMUitZQkd0UjhUVW4vUERZMU4zNjJKcEk1M1BrR2VW?=
 =?utf-8?Q?NVHBD84yvtM2awJ56kzEvo0J7?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <378C1098213D6A48BB3E7D347FF00850@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86396f2d-3671-47e0-b50f-08dd0d1ec714
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2024 06:59:59.6177
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w2k/TFV9vxQumsRIJ5lYQ1OmcpCQKFrRUX1UYT7e/ZucNIbAqowdEXWo+w7OLcxHg6IZMhydXGa9TIXs8Npm1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7553

SGksIEp1bGllbjoNCg0KT24gVGh1LCAyMDI0LTExLTIxIGF0IDA5OjUzICswMTAwLCBKdWxpZW4g
U3RlcGhhbiB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxp
bmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRl
ciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBGcm9tOiBQaGktYmFuZyBOZ3V5ZW4gPHBuZ3V5
ZW5AYmF5bGlicmUuY29tPg0KPiANCj4gVGhpcyBkcml2ZXIgcHJvdmlkZXMgYSBwYXRoIHRvIGJ5
cGFzcyB0aGUgU29DIElTUCBzbyB0aGF0IGltYWdlIGRhdGENCj4gY29taW5nIGZyb20gdGhlIFNF
TklORiBjYW4gZ28gZGlyZWN0bHkgaW50byBtZW1vcnkgd2l0aG91dCBhbnkgaW1hZ2UNCj4gcHJv
Y2Vzc2luZy4gVGhpcyBhbGxvd3MgdGhlIHVzZSBvZiBhbiBleHRlcm5hbCBJU1AuDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBQaGktYmFuZyBOZ3V5ZW4gPHBuZ3V5ZW5AYmF5bGlicmUuY29tPg0KPiBT
aWduZWQtb2ZmLWJ5OiBGbG9yaWFuIFN5bHZlc3RyZSA8ZnN5bHZlc3RyZUBiYXlsaWJyZS5jb20+
DQo+IFtQYXVsIEVsZGVyIGZpeCBpcnEgbG9ja2luZ10NCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBF
bGRlciA8cGF1bC5lbGRlckBpZGVhc29uYm9hcmQuY29tPg0KPiBDby1kZXZlbG9wZWQtYnk6IExh
dXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4NCj4gU2ln
bmVkLW9mZi1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9h
cmQuY29tPg0KPiBDby1kZXZlbG9wZWQtYnk6IEp1bGllbiBTdGVwaGFuIDxqc3RlcGhhbkBiYXls
aWJyZS5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBTdGVwaGFuIDxqc3RlcGhhbkBiYXls
aWJyZS5jb20+DQo+IC0tLQ0KDQpbc25pcF0NCg0KPiArc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtf
Y2FtX2NvbmYgY2Ftc3YzMF9jb25mID0gew0KPiArICAgICAgIC50Z19zZW5fbW9kZSA9IDB4MDAw
MTAwMDJVLCAvKiBUSU1FX1NUUF9FTiA9IDEuIERCTF9EQVRBX0JVUyA9IDEgKi8NCj4gKyAgICAg
ICAubW9kdWxlX2VuID0gMHg0MDAwMDAwMVUsIC8qIGVuYWJsZSBkb3VibGUgYnVmZmVyIGFuZCBU
RyAqLw0KPiArICAgICAgIC5pbWdvX2NvbiA9IDB4ODAwMDAwODBVLCAvKiBETUEgRklGTyBkZXB0
aCBhbmQgYnVyc3QgKi8NCj4gKyAgICAgICAuaW1nb19jb24yID0gMHgwMDAyMDAwMlUsIC8qIERN
QSBwcmlvcml0eSAqLw0KDQpOb3cgc3VwcG9ydCBvbmx5IG9uZSBTb0MsIHNvIGl0J3Mgbm90IG5l
Y2Vzc2FyeSBtYWtlIHRoZXNlIFNvQyB2YXJpYWJsZS4NClRoZXkgY291bGQgYmUgY29uc3RhbnQg
c3ltYm9sIG5vdy4NCg0KUmVnYXJkcywNCkNLDQoNCj4gK307DQo+ICsNCg0KPiANCg==

