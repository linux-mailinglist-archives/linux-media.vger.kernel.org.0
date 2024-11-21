Return-Path: <linux-media+bounces-21739-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFA19D4B81
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 12:21:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A7B141F21203
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 11:21:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82E2E1D151F;
	Thu, 21 Nov 2024 11:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="JsxNzSXP";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="by7X1vEf"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF37F1CACDB;
	Thu, 21 Nov 2024 11:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732188108; cv=fail; b=UcG/K5JLaebqtmjLHhkK0KR6CMIXAEkczwrDp9sSEKRXL61ArBWZ1s7wZf/gVS8dzamx2gVGSuyXU4ZL/7QriNpT/DXzLWU3B/PdQ+FsCWIVOCYE1lGSLE/83aZdwhneOCgEv0/qpURaQV1hPs5+4kftFqgpfxfPl+ukpClZOwk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732188108; c=relaxed/simple;
	bh=5k8v7ZIbSIYuvrFMxPRlWgtBNgMD10LDQGZc+l0NQbI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=A8mPT7oIL2R3o/w5sc6sgcJ1tRY0bkm5whnmSHQbLq2aZeY/XqUA6ZqlXtFfF9PX29wKrK7RyEvja0xpQDdmGX1AwvAoKaXQ5kk2fWl81tlWVGlhJUK2tHKUYAboQNuWpMRnbQCihJRU/oz8axQU8EjZcfzWJu1tGPFkMEnhKgk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=JsxNzSXP; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=by7X1vEf; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: c71d8494a7fa11efbd192953cf12861f-20241121
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=5k8v7ZIbSIYuvrFMxPRlWgtBNgMD10LDQGZc+l0NQbI=;
	b=JsxNzSXPsFvXwOqMWlw3QlnlQ2bzE84teIvpu+iArmBjTpF7FccMU1Lr0YNHccl9mslbFhAXpoNpArsV7809b43Qrcwk5XuTm4OKFPoVKATAWx9fbAs7EPHhqaRI+8TLxE3QBpN8549d96exB2e2qK0/REqbOypiYsDlu96+llI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44,REQID:bdb58245-9c6d-42ce-98e9-e2a3df85f182,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:464815b,CLOUDID:de0e95a0-f395-4dfc-8188-ce2682df7fd8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: c71d8494a7fa11efbd192953cf12861f-20241121
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 391127430; Thu, 21 Nov 2024 19:21:39 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 21 Nov 2024 19:21:38 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 21 Nov 2024 19:21:38 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fv/G8XyYrxP8FfNqdNn1JR8X2uIzbMIejvG1qVWCiDKDO/3LRuwpjp9fO5VNrXAdNoK4zUAopz2UXpH+xXqY5J2zMvcKaMhC4o806Vk6/oEaKX8l49KgF7uvtbU1LhqunWJlhsHKLYUSPX3Dzg00+5CDftpMVeLImWd0fvolB+CSrAnXsE9Klja2HO6MVQhtylf1whlrxFg2VMjo7dM1rt0PprYkXLI3/exTd54+JnaQDmHv14OXK0gS2/F6/5I+PQu0GjaYQYpBEhhPKsu4xsSsuMwDgcB5w4P71Jw9zrJ5G1nmkVxwcnIxFhF8jnOXF++/eHeCfEXXCGPQJdRSDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5k8v7ZIbSIYuvrFMxPRlWgtBNgMD10LDQGZc+l0NQbI=;
 b=Lh87OBpGOYD8kwaSQaSjFZ0GHf5I3BASTRtBouGEaevwvJJwFFMjBfmcyNhx0xuaZ4EdGG2QARitmaESZeidlDUkvwucqdpDPxixNzhFaWJIkizXwZ8mzXhDLlPB0KZdfguKmGc11kgPuU+kMDFLurS11/XNpDlX2iRqQE/i62x059ZPhji0m2CwYZua9+auvqcE0780njvxPGCf1RWDtw+IF+M5sRarRi0SSccSeP5z0CniYWHzcJIz0eBSXvlF5GU3EQjt2SuG+79qud3q0cxAwHoVP6NHLw0Ag8VNsrGdL1yxnasUeCr25SHlYw4Jqpk2Xq6fW66CB2mas7cN3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5k8v7ZIbSIYuvrFMxPRlWgtBNgMD10LDQGZc+l0NQbI=;
 b=by7X1vEfYG1qVHx+RfC13BiumOc3DvtGkwQ6fGwDAsEvBkw46uI6Suj5JxILJtHnmWA9D905kIOFLJKFhNdKnkmnx8A/X67U6SMI0W99866dDNW9Si9Yi02ijFXS+LFdUyozSj89+KydnmLtBQ9dkAERhwPDxXRiC5onm/ZsO3o=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by SEZPR03MB7568.apcprd03.prod.outlook.com (2603:1096:101:12b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24; Thu, 21 Nov
 2024 11:21:35 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%4]) with mapi id 15.20.8158.023; Thu, 21 Nov 2024
 11:21:35 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "jassisinghbrar@gmail.com"
	<jassisinghbrar@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "simona@ffwll.ch"
	<simona@ffwll.ch>, =?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?=
	<Moudy.Ho@mediatek.com>, =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?=
	<Nancy.Lin@mediatek.com>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, "airlied@gmail.com"
	<airlied@gmail.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 0/8] Add GCE support for MT8196
Thread-Topic: [PATCH 0/8] Add GCE support for MT8196
Thread-Index: AQHbO82cqC9Bx4Dkc0KsU7xaMZU1CLLBboeAgAAo6AA=
Date: Thu, 21 Nov 2024 11:21:35 +0000
Message-ID: <778f7f7c01d395e911ae32f168c17d1f6d95ea40.camel@mediatek.com>
References: <20241121042602.32730-1-jason-jh.lin@mediatek.com>
	 <72c1e62b-0bbf-4213-adbb-972caa1ebfee@collabora.com>
In-Reply-To: <72c1e62b-0bbf-4213-adbb-972caa1ebfee@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|SEZPR03MB7568:EE_
x-ms-office365-filtering-correlation-id: 7525b406-dda7-49c3-72f3-08dd0a1ea8bd
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?U3RHeFNLQ3NlQ1d4QjQ0WnExUTMzZlFPcjQ4SllsR0tJVE44WE81SkZreEMz?=
 =?utf-8?B?OStIa0UyVUhCb05uSVFJNUl4NFBGNnVvNDdoRTNwWGNvRXlUSCszcnZIQjFU?=
 =?utf-8?B?eHhLQloycnpvTCt6cWFGV0ZaN1dGeXFuSXR2RkZqSmM5UFM2bVlPL0dSc2pv?=
 =?utf-8?B?NUw4WFduaWNaVis0K3FSRkJBci9UZXk3U3lkY3VpZmZSN1JwbWtFQ1pyY0dK?=
 =?utf-8?B?RWV1L1RZYjlESTJLcHl3Zk5pNTlzYU9IazFrWU9WMWxaMU1tQkFhVmZ0dm9t?=
 =?utf-8?B?Rzhta3pubWxlM3ZMM3pUejFOdWVWcVgxL1ZqZ0dXcDM4T01wdTlTc2F4K3lt?=
 =?utf-8?B?U1RiWjQ4Z2xSYXM2cVI1QkVHUTFySE5NQUR5S0JFUVRXbWlkcXMrU2hyYjNV?=
 =?utf-8?B?bWJEdi9sL2h1dHlJcG1JOGgxdFN3bWhOUXpBWXNhTHd5WkxLSmIwU0c0aFo0?=
 =?utf-8?B?UlVMZVpsN0YrNGl6UlJjOTlVY0FsbG14TXRYcmdXNXZWNFc0d1ZYem5zUCs2?=
 =?utf-8?B?Mk1YQ3gyL0RLSzdjdS9Xa1dYc0JrTitXOVRLWlVmaFBMRDcxY0xuYkVMZHh0?=
 =?utf-8?B?Q1lKMmRrd01zMXdObExiYnlielk1ZXIzcitaNEZFR2Z2STVxRFozTmlnWlRN?=
 =?utf-8?B?MU9DbUpocnZsb08xNTJhOERqaHhteUEwYUJjTXN5TlozZzhUdlhHWjJJYVhw?=
 =?utf-8?B?RFJvNStUaWsxK0lRWm5tYWYvajFOdUxwYVZSRE1od1E1V1laWDEzWXNIZzhm?=
 =?utf-8?B?alUzU3lNTVpsdXRadDBIUU5LMzFiaXdTay84SE45Q1E2VklTdEtmT01Sa3hL?=
 =?utf-8?B?S2lOQUNNUDBLU2VWREVLaWhwbFFKQzREZ2FxVkJGTzBCa2xFODEvQ3VSLzlK?=
 =?utf-8?B?bzY4bTlJaXdaenBwbU12eThtamF6K0ZpQWJ2a3hIb2IzemczSlVCWDJhR3dy?=
 =?utf-8?B?eUh2QjBKZnZBN0xnSWM5dWFJSWxtM3dySzJTcUpERmR0dnNRb1A3aytkeEtt?=
 =?utf-8?B?QVpwNE5GSEk3L2MvcXREVEgwRU1kR2dOcnlpRm84ZC8vQzhCeThxQXN5YU1E?=
 =?utf-8?B?L2s3cWE5TFNYM2ZwUlhYRUhkZC84di96YzhtYjJmQitheTFBcmduZUpaVUZ0?=
 =?utf-8?B?OXVpVDZsbFNFOGViUFFZVjVodkFWYmRTMkRGZ2R5RGxhQktiWjFKdUJIZG1Q?=
 =?utf-8?B?ZzlIZjNFNE84blpMRmFiQ3V6MEMrR1NONVVxUGdpVDQxelRXejgxMTNpamFh?=
 =?utf-8?B?WlQ2ZGxOaUw1c2xadlBjRkNUN1Nib0pXdzlrV3RsNEN4NVd1UHYyUURVdURF?=
 =?utf-8?B?U1o0cGpydkg2RGNybisxOFFNUzlGR29uWDRpak5HNXErd0hQYkU5OGlpaDI1?=
 =?utf-8?B?OHFHVUhudE4rbjZvakN6Nzk5amFEcWhVNEhtUzhJN1dIbmZMMjBsZy9GTVZi?=
 =?utf-8?B?OU92ZmtxQlFRenB0aHpaL3g3RzR6K3h4UEFiYmpPaERBUXF4akZiYUJ5M0lv?=
 =?utf-8?B?TDg4Y1pzVGdISG5WbDE2SkZaa1lJTXppbHlEOHcydWc2dWtXWjc3a1J4czJE?=
 =?utf-8?B?KzdrOHcvQng4VGpTUzlzQjhsTWdXZDYwdnFwQzRGdC9hT3dSV1hnTjc4MnpJ?=
 =?utf-8?B?MWJ5WGt3RHFJWFlHd05USW9NejdvMXlheWx4ZGU3ZEo0a2haS2cvUDd2KzA5?=
 =?utf-8?B?Slp2TXdWSWNZSzd3RzdtYzhlRWQ3ZWJmWjE0SUJwSXpsK3gzd3ZHS0VIVTVO?=
 =?utf-8?B?VjhMMWxxN0o1VklObHM0UFY3bzdNbGxpUzk3Q1gyRE9tZ2xHbmViVW55c3FT?=
 =?utf-8?Q?+OEAi+7TMYvp24DxCIZj06RDzS2SDx8EPYuD4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7682.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UTFMMnZxazdiVEh2RUJSRHJwZ2xFdFFycmZGL1pxOEVPdXI5Q1lKQ01adHRa?=
 =?utf-8?B?TFp1S3ZvVlZOakJtQ05ZVFp5aHJqOUZWVU9WYkhQVVNjOWJWdkNFTEhLTmhj?=
 =?utf-8?B?Tm5OQmNMNXdPaXE1NXdBMkxmTS9BSGlMaERZa3JYdVN2OW9qOVorVlJPcHJL?=
 =?utf-8?B?OU5KTXFnKzYxVllNMFUxMGUvbTZxd2diZnA0Z080ek9lZlVzNGJta2xFU1hS?=
 =?utf-8?B?R2ozVVRYT3NMSnVXeldQK1IwS052NDJ3c0s0bVNxNVRHajJpUkViL0VuWnRW?=
 =?utf-8?B?SGJGTytncFhXTnVmUnBJRXgwN1I4OEM1QWRhVUhVcU4rc0hQTmp2SUo5VlRw?=
 =?utf-8?B?TDY4K0Vxd2FGd2JEdU53N2l5dzlRY3BweHRPenhLSlhzVGJIcGxOOFViTTFn?=
 =?utf-8?B?UnhHbUtYM1draGRSaTBFME50a0lPMXZHTG5xclJNSVBHK1QxWkxubk41aDMw?=
 =?utf-8?B?M0l1TVN2QllOQUcyOG5HUkdVbjAzT3RUNmpmYi9EQkI5NThFR3I1YUU4T0N1?=
 =?utf-8?B?dU1IaEF0bi9kYjdXelNpK0d3SWVsZk83SkxjM3lwVlhDKyszT0ZIaHFpcFFh?=
 =?utf-8?B?NGdiMGZLNlpGcGFhWkVxKzVESkM1dVJCUHl3R1MxN1huV2tub3JwUzhsMEZR?=
 =?utf-8?B?T29OUTJkUjlqbTJjcStma1Urbkozbkw5WEF2YVpGSWU4bkQ0ZHZsQnFaRHBW?=
 =?utf-8?B?SkxaWVo3MWdQUElNR2c2V1dPeC9iREZaMXRJZWhTR09MYk5KeGZwQlVMc2Er?=
 =?utf-8?B?T1BleVJZN0JIWjJCdjF5SEU4bFNGU2x0WHJMMjhkTEgvblRHTmxGQUtNc0NU?=
 =?utf-8?B?SWhWNWdRYlBDcmFYdHZLZ09Qb1FZUUY4RGduU1lzMm9scG5qS0djMHZmakJj?=
 =?utf-8?B?WUswUVhLZjM2ZGp6NSt5TVBnV2RqSmV6dFMwMS9Yd1NLNUdVTVlwdzVoSEN0?=
 =?utf-8?B?Mlc3MmhYV2tnY3FrVGQ3ei9malROa01Ub3M3MmM3SDdlelhwYXZhTGN2aXZo?=
 =?utf-8?B?TE1FZ2lNRS9tck44ODVFdXoxNkxwMUFXNU5xdkZtZkFsbXRUTHZHQTUzWDdk?=
 =?utf-8?B?UncvbHkvSm9zS3Y3VmhVK2pBSk1YK2U0RlFIWkNXb3AxU2hVUTJheVZEVTRj?=
 =?utf-8?B?OXBuUkZFbzhjdno1dzdGV3pGSUFGQmNiY0VSSkNIZU9CeVowZ2N2QUhLRVMx?=
 =?utf-8?B?MWR4YUJ5djNJYUZFZnFwSFJsT1VCdXRicnpzZGhSaUMzWWZzMS9MT3ZCc1hH?=
 =?utf-8?B?U1hyYW54QzJVbkZZMXJRTVEvZzY4RCtZUkR1b2V6MW5Ka2lhK1VJMHlmZUR2?=
 =?utf-8?B?VlIyb0Y5N3ZHQzFndzFzLzlVOThzNnpIb0lBMzlobmgrRHNIN3JnLzBOZ0pp?=
 =?utf-8?B?RGlKY2htZlhPV0lPSUlPYk9OMHd0MDkrSzdXNlVVOGdNa2N4T2ZYOEN6L1Yx?=
 =?utf-8?B?UjMybE0rQ3lqdjlkdk5XUXNrWldyRlIvd1EvQmpNTlo5UkVzQ0lXU1J5Wi9D?=
 =?utf-8?B?bG4wdlY1QjkwaFpKYjRkNWxBM2d4aU5IWE9MenFvSHhNcFpCOXI0Y3VmMXU1?=
 =?utf-8?B?eHpsOEFiRVhsK0sxcFJzb0cxZVZaaE1yd1B1NXNwRTN6UnV6YU1rMzNzc2Y0?=
 =?utf-8?B?SVNuTW1TUU0vZm5mWkpmTHMxTUgvNDFwK1Q1a3QzVW9raytFT0szeVp0NzB4?=
 =?utf-8?B?bFdhdml5NWc2MDY3b1Y5N0F0eXhXOEFXV21rbktsMEJuS0JLZHkySkx4L1hI?=
 =?utf-8?B?UVlZcFpXSWJwZEZRanhwakVabENtOTR3QkNTeEc1M0cyYlMrMEVmY01ncFhQ?=
 =?utf-8?B?eWY0Q01GSGJzbXpUWnJUY0Nvam5zN2JibHpxTThCQitvNVI0ZGgrNklZYWU3?=
 =?utf-8?B?YmRUWjl0UGYwNVRCZW94b3RxWmluanJrZnRsWXJqV3N6Ry81VG5LejdnZWk2?=
 =?utf-8?B?UTgvNXZuanhKcm1GYnM3Y2ZPbHEweTNqT1Y1MG9na0VwcG1RWTc4ZWpqY05q?=
 =?utf-8?B?TisrRk9DK1hhU2drNlF4bTVYL0RiWUVacGlybUNHUW9nNzZOZUhKM3BLbk1q?=
 =?utf-8?B?Wnl3V3BjVjlUa2hiY2l4VXdHZkdYejZ1TlJmS3k1WEtTckFrVkRZTGhxMXFT?=
 =?utf-8?B?VVlBWlhkS3BBRGZnRWg5UndiOUJmWXR5OGlzSjVqYmJoQmRsZTBldi9xb2ZN?=
 =?utf-8?B?YkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <747F2EFA3052FF4CA21956175356AF8E@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7525b406-dda7-49c3-72f3-08dd0a1ea8bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2024 11:21:35.2601
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HuBczr5yrZkWiXhZkT7iv7dT6q0BGCwqplVu3cRv/RUnLrDbThCUTxdCtqpcAyX13/qWnPQZJ0mfNVLjYhjk6b+JydmVK0iZg0cafdRBdBA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7568

SGkgQW5nZWxvLA0KDQpPbiBUaHUsIDIwMjQtMTEtMjEgYXQgMDk6NTUgKzAxMDAsIEFuZ2Vsb0dp
b2FjY2hpbm8gRGVsIFJlZ25vIHdyb3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBu
b3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJp
ZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250ZW50Lg0KPiANCj4gDQo+IElsIDIxLzExLzI0IDA1
OjI1LCBKYXNvbi1KSC5MaW4gaGEgc2NyaXR0bzoNCj4gPiBUaGlzIHBhdGNoIHNlcmllcyBhZGRz
IHN1cHBvcnQgZm9yIHRoZSBNZWRpYVRlayBNVDgxOTYgU29DIGluIHRoZQ0KPiA+IENNRFENCj4g
PiBkcml2ZXIgYW5kIHJlbGF0ZWQgc3Vic3lzdGVtcy4gVGhlIGNoYW5nZXMgaW5jbHVkZSBhZGRp
bmcNCj4gPiBjb21wYXRpYmxlDQo+ID4gbmFtZXMgYW5kIHByb3BlcnRpZXMsIHVwZGF0aW5nIGRy
aXZlciBkYXRhIHRvIGFjY29tbW9kYXRlIGhhcmR3YXJlDQo+ID4gY2hhbmdlcywgYW5kIG1vZGlm
eWluZyB0aGUgQ01EUSBBUEkgdG8gc3VwcG9ydCBub24tc3Vic3lzIElEDQo+ID4gaGFyZHdhcmUu
DQo+ID4gDQo+ID4gSmFzb24tSkguTGluICg4KToNCj4gPiAgICBkdC1iaW5kaW5nczogbWFpbGJv
eDogbWVkaWF0ZWs6IEFkZCBHQ0UgaGVhZGVyIGZpbGUgZm9yIE1UODE5Ng0KPiA+ICAgIGR0LWJp
bmRpbmdzOiBtYWlsYm94OiBtZWRpYXRlazogQWRkIE1UODE5NiBzdXBwb3J0IGZvciBnY2UtDQo+
ID4gbWFpbGJveA0KPiA+ICAgIG1haWxib3g6IG10ay1jbWRxOiBBZGQgZHJpdmVyIGRhdGEgdG8g
c3VwcG9ydCBmb3IgTVQ4MTk2DQo+ID4gICAgc29jOiBtZWRpYXRlazogbXRrLWNtZHE6IEFkZCB1
bnN1cHBvcnRlZCBzdWJzeXMgSUQgcHJvZ3JhbWluZw0KPiA+IGZsb3cNCj4gPiAgICBzb2M6IG1l
ZGlhdGVrOiBtdGstY21kcTogQWRkIG1taW5mcmFfb2Zmc2V0IGNvbXBhdGliaWxpdHkgZm9yDQo+
ID4gRFJBTQ0KPiA+ICAgICAgYWRkcmVzcw0KPiA+ICAgIHNvYzogbWVkaWF0ZWs6IEFkZCBwYV9i
YXNlIGR1ZSB0byBDTURRIEFQSSBjaGFuZ2UNCj4gPiAgICBkcm0vbWVkaWF0ZWs6IEFkZCBwYV9i
YXNlIGR1ZSB0byBDTURRIEFQSSBjaGFuZ2UNCj4gPiAgICBtZWRpYTogbWVkaWF0ZWs6IG1kcDM6
IEFkZCBwYV9iYXNlIGR1ZSB0byBDTURRIEFQSSBjaGFuZ2UNCj4gPiANCj4gPiAgIC4uLi9tYWls
Ym94L21lZGlhdGVrLGdjZS1tYWlsYm94LnlhbWwgICAgICAgICB8ICAgIDQgKw0KPiA+ICAgZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kZHBfY29tcC5jICAgICAgIHwgICAgNiArLQ0KPiA+
ICAgZHJpdmVycy9tYWlsYm94L210ay1jbWRxLW1haWxib3guYyAgICAgICAgICAgIHwgIDEwNyAr
LQ0KPiA+ICAgLi4uL3BsYXRmb3JtL21lZGlhdGVrL21kcDMvbXRrLW1kcDMtY21kcS5jICAgIHwg
ICAgNCArLQ0KPiA+ICAgLi4uL3BsYXRmb3JtL21lZGlhdGVrL21kcDMvbXRrLW1kcDMtY29tcC5o
ICAgIHwgICAgNCArLQ0KPiA+ICAgZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLWNtZHEtaGVscGVy
LmMgICAgICAgIHwgIDEzMyArLQ0KPiA+ICAgZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lz
LmMgICAgICAgICAgICAgIHwgICAgMSArDQo+ID4gICBkcml2ZXJzL3NvYy9tZWRpYXRlay9tdGst
bXV0ZXguYyAgICAgICAgICAgICAgfCAgICAyICstDQo+ID4gICAuLi4vZHQtYmluZGluZ3MvbWFp
bGJveC9tZWRpYXRlayxtdDgxOTYtZ2NlLmggfCAxNDQ5DQo+ID4gKysrKysrKysrKysrKysrKysN
Cj4gPiAgIGluY2x1ZGUvbGludXgvbWFpbGJveC9tdGstY21kcS1tYWlsYm94LmggICAgICB8ICAg
IDMgKw0KPiA+ICAgaW5jbHVkZS9saW51eC9zb2MvbWVkaWF0ZWsvbXRrLWNtZHEuaCAgICAgICAg
IHwgICAyMiArLQ0KPiA+ICAgMTEgZmlsZXMgY2hhbmdlZCwgMTY5OCBpbnNlcnRpb25zKCspLCAz
NyBkZWxldGlvbnMoLSkNCj4gPiAgIGNyZWF0ZSBtb2RlIDEwMDc1NSBpbmNsdWRlL2R0LWJpbmRp
bmdzL21haWxib3gvbWVkaWF0ZWssbXQ4MTk2LQ0KPiA+IGdjZS5oDQo+ID4gDQo+IA0KPiANCj4g
SGVsbG8gSmFzb24sDQo+IEkgaGFkIGEgZmFzdCBsb29rIGF0IHRoZSBjaGFuZ2VzIHRoYXQgeW91
J3JlIHByb3Bvc2luZyB3aXRoIHRoaXMNCj4gc2VyaWVzLg0KPiANCj4gVGhlIHJlYXNvbnMgYmVo
aW5kIHRoaXMgYXJlIG1vcmUgb3IgbGVzcyB1bmRlcnN0b29kIG9uIG15IHNpZGUsIGJ1dA0KPiB0
aGUNCj4gYWN0dWFsIGNoYW5nZXMgbG9vayBhIGJpdCBvZGQgaW4gdGhlIHNlbnNlIHRoYXQgcGFz
c2luZyBhIHBoeXNpY2FsDQo+IGFkZHJlc3MNCj4gbGlrZSB0aGlzLCBvbiBhIGZpcnN0IGdsYW5j
ZSwgbm90IG9ubHkgbG9va3MgbGlrZSBpdCBtYXkgYmUNCj4gZGFuZ2Vyb3VzLCBidXQNCj4gYWxz
byBsb29rcyBsaWtlIHRoZXJlJ3MgYSBsb3Qgb2Ygcm9vbSBmb3IgaW1wcm92ZW1lbnQuDQo+IA0K
DQpJdCdzIGJlY2F1c2UgaGFyZHdhcmUgc3Vic3lzIElEIGZvciBHQ0UgaXMgbm8gbG9uZ2VyIHRv
IGJlIHVzZWQgaW4NCk1UODE5Ni4gU28gd2UgbmVlZCB0byBwdXQgdGhlIFBBIGludG8gdGhlIGlu
c3RydWN0aW9uIHRoZW4gR0NFIGNhbiBrbm93DQp3aGVyZSB0byB3cml0ZSB0aGUgY29uZmlndXJh
dGlvbi4NCg0KPiBDYW4geW91IHBsZWFzZSBwb2ludCBtZSBhdCBzb21lIGRyaXZlci9jb2RlIChv
ciBhIHJlZmVyZW5jZSBkb3duc3JlYW0NCj4ga2VybmVsDQo+IGZvciB0aGlzIFNvQywgd2hpY2gg
d291bGQgYmUgZXZlbiBiZXR0ZXIpIHNvIHRoYXQgSSBjYW4gdGFrZSBhIGxvb2sNCj4gYXQgaG93
DQo+IGlzIHRoYXQgYmVpbmcgdXNlZD8NCg0KQmVmb3JlIE1UODE5NiwgdGhlIG1vc3QgZ2VuZXJh
bCB1c2UgY2FzZSBpcyBpbiB0aGUgbXRrX2RkcF93cml0ZSgpLA0KbXRrX2RkcF93cml0ZV9tYXNr
KCkgYXQgbXRrX2RkcF9jb21wLmMuDQpUaGUgY2xpZW50IGRyaXZlcnMgd2lsbCBwYXNzIHRoZSBg
c3RydWN0IGNtZHFfY2xpZW50X3JlZ2Agd2hpY2ggaGFzDQpzdG9yZWQgdGhlIHN1YnN5cyBJRCwg
b2Zmc2V0IGFucyBzaXplIHBhcnNpbmcgZnJvbSB0aGUgRFRTIG5vZGUuDQoNClRoZSBjbGllbnQg
ZHJpdmVycyB1c2UgdGhlIHN1YnN5cyBJRCB2aWEgQ01EUSBBUEkgdG8gZ2VuZXJhdGUgdGhlDQpp
bnN0cnVjdGlvbnMuIEFuZCBHQ0Uga25vd3Mgd2hlcmUgdGhlIHN1YnN5cyBJRCBpcyBtYXBwaW5n
IHRvIHRoZQ0KY29ycmVzcG9uZGluZyBoYXJkd2FyZSByZWdpc3RlciBwYV9iYXNlLCBzbyBpdCBj
YW4gY29uZmlndXJlIHRoZQ0KaGFyZHdhcmUgcmVnaXN0ZXIgY29ycmVjdGx5Lg0KDQpUaGF0J3Mg
dGhlIG1haW4gY2hhbmdlIGluIHRoaXMgc2VyaWVzIGFuZCBmZWVsIGZyZWUgdG8gYXNrIG1lIG1v
cmUNCmRldGFpbHMuIE9yIGlmIHlvdSBoYXZlIGFueXRoaW5nIHdhbnQgdG8ga25vdyByYXBpZGx5
Lg0KWW91IGNhbiBmaW5kIG1lIGluIHRoZSBHb29nbGUgQ2hhdCA6LSkNCg0KUmVnYXJkcywNCkph
c29uLUpILkxpbg0KDQo+IA0KPiBUaGFua3MsDQo+IEFuZ2Vsbw0K

