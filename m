Return-Path: <linux-media+bounces-23241-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A8F9EDDFC
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 04:42:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 63EEA162ED1
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 03:42:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAAA7154BE4;
	Thu, 12 Dec 2024 03:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="sR/F7umT";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="wM/vWcOT"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2EB38DDB;
	Thu, 12 Dec 2024 03:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733974916; cv=fail; b=dOZQbI96uz7gDt0NCmk4EfmVBPlKpH+TDOW54BONzrFfNUCCvSi0S+XjmHsste425Ww/yN63+K+p/kkKtOZ57IJt5IBZ0DNoGaK/E7DTeZHHsQYve21QNSSyRGirJmhyygWT9hSJq6yivGvb/uDI0IkGSVeOPsPV25QiKEQ35U0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733974916; c=relaxed/simple;
	bh=dmJnya1efeo5AC7IiAr3NL2ukWmsHn5+Dn1PRrKRLuY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tjI62YAtoEPsi5z0H+lZqM6MLnX9Kj95qs2ZxnuhYOQKp7DNKc20C7egY++rFqC+su/mID/t2pkGKClZ2stR9//9SoDFfvtqY8wkTWE2TIMSb2bvlyHlISVb/E7utNWvFqpU2oCDbsapKvcExcbwTzePJ4HM1QYx+4uOOnNFTA0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=sR/F7umT; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=wM/vWcOT; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 00bea016b83b11efbd192953cf12861f-20241212
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=dmJnya1efeo5AC7IiAr3NL2ukWmsHn5+Dn1PRrKRLuY=;
	b=sR/F7umTQ7DN/q3WId2tJM9Tcs+hL/PJJaVSXrgMvSiOKjL/Ewi8eZaj36p2SZOgUK/Xv+QOKjwdrEYsWl8tdBIqYvzYjRsU0y0NzVBlJXcZrfo4iNoLY78x8gPEw+neqxuFiPQhTQpcZmjmeVPoEZAvjrlXl8ibd7e5VIMVS/M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:172706dc-487a-4902-a77c-6935b39eb518,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:ba0d0013-8f5d-4ac6-9276-7b9691c7b8d6,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 00bea016b83b11efbd192953cf12861f-20241212
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1399082486; Thu, 12 Dec 2024 11:41:42 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 12 Dec 2024 11:41:41 +0800
Received: from HK2PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 12 Dec 2024 11:41:41 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dEpcDaHwkfBpxBR8A2O6wrH/jLYp/vfEmmmpV+QLdyS7leitSJRAK1jgKpguQOjOiY990B3/nh4xaK0CpyADuplOMqtvlAYH7axaqvhTcRU+zElTynam+q009HKUINzG5zSPQpXcbs9NUi6TECIY1iNuxpsmVP6rzaFUC5rsFskMHpWpVqSkUWLZ+IY5LGj5l4hM+ilyXDT93RhfIM3ZAhScahjBmK8kHzFjubayxcbnyP0vF3IBA3XzdoEzdGEaFq9aHgkZ/hgXVWaUWBshQaTOxylwMf1zCV2mW0rTT3Eo4dK5dMnPCuQTsxVF0KVQzLAMDA/k+FdgPyI6TftO9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dmJnya1efeo5AC7IiAr3NL2ukWmsHn5+Dn1PRrKRLuY=;
 b=tWsflGYNDc0vhNi4DRRZQIG3hlV7mO+Uq8JxHyo19zqmoJR+dt56KQPnGiBZL/mOYlyHxc0lNBzfnQ8hLAtaIlgk9050Dhc9kQOTtbVdL44GJrtj1GR3UfqUGawPHwrSgADmEJ9efSXZjtUPm/a8WnOCNQ08JEBoiaOy0yZ9apGcvqUnemXh+Y26QXCakmbKoRTyj11SWC6tNwYHfaplNiiLqcP51sMpQQ4o5NyS77rrT9i7PXRzXNiEpmSm5IVFPoSEu+zduaijRbDxB5Xo6eEuBgH/pf+sFRcYWxIfpSfRTnT/HRIcBbggfplbjt9vp7nh37rpoRdfyIz9b/TpFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dmJnya1efeo5AC7IiAr3NL2ukWmsHn5+Dn1PRrKRLuY=;
 b=wM/vWcOTsaTyLYgqaeQQYBO0JbYaeIboytC7a0QjfZXkHQBpFIbCJorZtBAd10hRxwVW4ugpWblPtqIa5pCDURWf3z2TF2cGJ2XzXtOSM5u66Swe8kxNN++g1D8H9n9fEb1VhQf3oXb0pHsE+331C20gvP+6OTaYND/WGZgezC8=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by KL1PR03MB7106.apcprd03.prod.outlook.com (2603:1096:820:d0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.19; Thu, 12 Dec
 2024 03:41:32 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%5]) with mapi id 15.20.8251.008; Thu, 12 Dec 2024
 03:41:32 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "krzk@kernel.org" <krzk@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "simona@ffwll.ch"
	<simona@ffwll.ch>, "mchehab@kernel.org" <mchehab@kernel.org>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	=?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"robh@kernel.org" <robh@kernel.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, "airlied@gmail.com"
	<airlied@gmail.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, =?utf-8?B?WGF2aWVyIENoYW5nICjlvLXnjbvmlocp?=
	<Xavier.Chang@mediatek.com>, "jassisinghbrar@gmail.com"
	<jassisinghbrar@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 2/8] dt-bindings: mailbox: mediatek: Add MT8196 support
 for gce-mailbox
Thread-Topic: [PATCH v2 2/8] dt-bindings: mailbox: mediatek: Add MT8196
 support for gce-mailbox
Thread-Index: AQHbS3wkCctCpYkZuU6w25zo1OjrvrLgyhqAgAEuZIA=
Date: Thu, 12 Dec 2024 03:41:31 +0000
Message-ID: <64326843358d450c9172f3dea1c85e7422e20430.camel@mediatek.com>
References: <20241211032256.28494-1-jason-jh.lin@mediatek.com>
	 <20241211032256.28494-3-jason-jh.lin@mediatek.com>
	 <yhfxpflyumevs66sdwgiiyuablpfxfxw3e7ybrxju7ssicmnu5@truuiuvxlq6e>
In-Reply-To: <yhfxpflyumevs66sdwgiiyuablpfxfxw3e7ybrxju7ssicmnu5@truuiuvxlq6e>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|KL1PR03MB7106:EE_
x-ms-office365-filtering-correlation-id: 36916c16-0768-4d4a-ebe8-08dd1a5ede88
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Q3Q5dU01azVoM3FJc3d5aHVRQ3QvOEdmMjF2MHlmdVB1Nm9mVDNrZllGUXNq?=
 =?utf-8?B?WlloZzR1a3oxNk9HdmdPN2tOYmRsRWViTlQ2aUxObEJIL2RhalJ3TG1aV1Fi?=
 =?utf-8?B?NFdrN1B4YlgwbUZQVzVQZDA3aEpUWGhhL3dBWGNQd2tjbzBQK1MvT3Mzdnht?=
 =?utf-8?B?OHBxOTJwWHVCY3NRcmJHMm9KZ3JpZFJVc0l1STZVcmpoMzBCY013dE1RMDBD?=
 =?utf-8?B?bSs3MVc3VkpUZC9qU0xtY09UYkNzU1pnYXJQUFBIcXpQa0wwVG9BR1pIalVH?=
 =?utf-8?B?cXMrQzh1ak53M054RzMwdjRBSThkdHNJUnN1M2JPWG1NdVExQXNiblRyM3lL?=
 =?utf-8?B?RlB4aHhWbjNXK21DRndENVpSQnFtUzhlc202MkpqQmEvNkZrcUJreTVsbGpF?=
 =?utf-8?B?bWhFQ0MzSUN2a2sydnkvKzB1ZGQvQVJVaThjTGdYZWVvc1g5VUtYYllSc2lU?=
 =?utf-8?B?dDZqZG1xVTEyUHNFbFNqWGQwMUFUSjE0b2tjTTk4SUx1NGVtem5wQ2ZoRnBr?=
 =?utf-8?B?RWlFbTBMQjNOOW9BcXZuYUdBblh0V3FRVkc5WFZnVStnYk5OSVRRempraEZO?=
 =?utf-8?B?bVhBaEJVYndxWDkySEJVbTB2Yk5rdnBQdXdISytYb3krVCtlbktkM3UwbCtv?=
 =?utf-8?B?TGF3Q09kMXZ5cm5wMzlCUm5idCtsVzYwUzRVbmNOSnVUNW5zL21qRzBuSUhV?=
 =?utf-8?B?Y3dFK040NkFwQXZwNjEydWtIR1oxaUQ4WXRUQWlCbW12M1FhajE2SU14QVZv?=
 =?utf-8?B?MFhZV3UrWWxkNndVK3VKRnhnOG5NOVBsdDd4K3o5U25nZzJJV3poMzI5Rk5Y?=
 =?utf-8?B?a2tnWEpvY0IrdWVzQnVkclExc09HdlBzeFp4Nlc5a09aNTQ5VEkxSTJDTlRp?=
 =?utf-8?B?MDhYRmpkTnJISUlXMTJQcG1nRFErN2Z0NFpONWZHcGlCZzRFKytIbC9lZmpE?=
 =?utf-8?B?akp1OXFxbytqZTlRTTJuaDJ2dHlOOHc2SEp4NHdOWjdJd1Y3cFpHaWxVVFo1?=
 =?utf-8?B?MVE1TFZoQWxIaFl6akN4NWtzVUFQZXp2Vng0NXFBZi9hUVZxWWxCUld2THVQ?=
 =?utf-8?B?NmFOQy8rN1kwaE5ESDViMk5FRlQrdjhyTFhQUHJpVzhrM3BxdXcwMHhsdzA2?=
 =?utf-8?B?dXJIdzJ1T21SUktMckROVmNYd1FrRGhLdi9wdDJUZVZES3FydDJodEM0eHZw?=
 =?utf-8?B?WlFmTFVXM016aGZlcFRLdy9zL3dJbzVwWkhwWjRXQTRyNUpzSENvZmR4N09j?=
 =?utf-8?B?YXUwbm9KM3l1bVBJVS9UcVdRMWN4VFpETXlvcFBicElRRVNjR2tnZGFsZ3pR?=
 =?utf-8?B?Z2kwZ1ZPSURPSWxKU2Y0aTZhRklaMDlIUWp5OE82WE0yL2t6bUpkODZhbnZZ?=
 =?utf-8?B?enIzb2hsMmdSdjB3dGk5VkNrVklhWjZqejBDNVEzZUFjQitRNWFqZTFBYzc2?=
 =?utf-8?B?NTlETHNBM0JlTjV3TjZ1K0VkdUtCaHRuTTlVR013d3ZNSVlKelFXUG0zSkkr?=
 =?utf-8?B?WGc3b29uWk5VczRBS04xcW0rOE1JRHhmeHNpQW5XQUNoelVGVWFwRWlkQzJo?=
 =?utf-8?B?YjRjWS9MK3NjVi9zRGdXZEcxUGJJeldtcXFuUGFHT2F0Sld6WnlnM2duZ29a?=
 =?utf-8?B?QlBxQ0JvWXplem1OVVlDRmFLTFlHOXpFcG02M2JhVEpYTlRJVG1sR2IvbnhO?=
 =?utf-8?B?TjU4b0pOckpwZi9hN2hnWm1HQ3c0VXlTaVRXVXdsU3RSM1U1OXpxcXprTGxs?=
 =?utf-8?B?RGwxT2FBdVY3bStEZVNlQ0ZHSjRwQ1krTEFmK3dzT1k2dHNnSmJoWjJXbXpo?=
 =?utf-8?B?dnhCYWN6VmhWMzBObVJjTllMVGwrbjZqb3FvMU90OVFHbWQ4bE1za2Y2U1NX?=
 =?utf-8?B?MDM0dG5FaUM4UU1vbGxNZy9NSFBHam1zWUNtYUdsaE9qTGFJYWhUa2llYUt2?=
 =?utf-8?Q?iSDPZuciVGIdvEpjykVH1Lt/RYre14D1?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7682.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SUlvaTRjV2Q0dVNBSjZIdXVJZEE4WU9SQm1ZbmR6VU1XdmFMMHhabXdwdktD?=
 =?utf-8?B?MVVLTmh1bGtzOXVTK3J6SzF2eVBBMUgxNEJrbjlJWGc3ZUExdHVOU2RDVFRu?=
 =?utf-8?B?TU5MZnczdENLVTl1NUZwalNqTzdzNW93bXhCYlF0UnZ3dEw5dFFISTVubDQ5?=
 =?utf-8?B?SlgxckV3cCtISkRpRExDZXRrbE54WkF0c0hOeG84anZKaEN1a3V0ZW1VSEFr?=
 =?utf-8?B?MWp1c2ZOeTJ3ZzNVaU5laGRkK3pOM0FQNXRVN05rSXdFNFNuZFlPQWJnMmwz?=
 =?utf-8?B?SmlkbTNTVnFJVXhNcVNVdUk3WWJCSmIzY0FCWkUyVnhSWk5vTXhYWHUzd1Ey?=
 =?utf-8?B?aC85WWR2NytzT2pwYzNvUjk3a242bU5OemZPWUI4bFg1WHpBRGlOVUx2Nlhu?=
 =?utf-8?B?Qm43UE1iYU9zS0psV1h5c3piMFRWTFJPZHNlVE44VzI4QXBPd2FrZ2VoUFdU?=
 =?utf-8?B?cDFJZWxLMEZNSzE5THBPY0FpMHJVVWg5THFCRmFIcVJ6MFllM0QyR0h6V0lP?=
 =?utf-8?B?L0gzNmVxQXorbHd2VkpFbSt2eXBtZ2pZM1I2NWF2Rm5uN3BoZFVuSVBoa2Uy?=
 =?utf-8?B?ZVRpT2trYXB0TFFZNEx3NVVqbTlaVHNEazRBTDdRSHVKU2paSFBnaXRPa0pp?=
 =?utf-8?B?eldFVkxadkgzQkFYWnBsTzR4NGtmSGcrWE82M212TGt2dXMzeFFEYWJJYW02?=
 =?utf-8?B?UWQvS3JWeHVRZGducjhIZXNLaDh2enJIZ3VUSWNrTVJzaFMxT3VoQVYrVGRw?=
 =?utf-8?B?Vk90ZnpER1kwTDRJa2pzSklyaG9xMmE1Q1RMRC8vV3dHbVM1UWplczFUMEcx?=
 =?utf-8?B?VVFmL0tCOTB0VlNNa1ZyVTR3L21mbk1BYmFaQ3pKOGhTVUZxZGlDcVFBZkdF?=
 =?utf-8?B?NlR0K3Byb1VIYjIxV09JbUE2UG1zZjFuTW13QnkxOHdmWjRVd1lDUzBHUlRz?=
 =?utf-8?B?bndRazFCclN1cGZXeTJIbkJtVWRYK3YvSndXS1dzQWVnZEFxK3dJQStQQ1Zh?=
 =?utf-8?B?b2swWk11V21wRjlwcGxEbFpFQzFmVkR0UDg5RE9LOWhKdDZFTUdGU3Z5Ykdp?=
 =?utf-8?B?bEw2dUMxcUV2UFFYWVBUR1RzRXhjZTdUcHBycWNWWndIV2E2Zkhtc1Z2NEF0?=
 =?utf-8?B?K2tkSStDWHpPT29Gb1g0M2EwSXRNbmttY2M5T3k0bHZMYWZiR3I1RVZTWVd5?=
 =?utf-8?B?OGsxVEM0c1pJcE1QSis1bWpmd3M1eHFtUEc4dHF3VWtOejV3R3JIQzJOd1kr?=
 =?utf-8?B?enJmUU8xZmVmUWhyOHdnZEw3d1J0d3VTMDBiZEFvSUhSTVVYWXM1aFdnMldh?=
 =?utf-8?B?d0lSTk5QWVUvTE9hOGorMmVOMVk1MW1NOTUvQ1dmSjZTQ2kzK092V25IdXo2?=
 =?utf-8?B?aXRkVlROTk81ODgrVzRjVjhoWXU0bEVTZFJwM2sxMjNNWHppTlp4MTJkK2x4?=
 =?utf-8?B?cGdMTmRiT010WCs0em5IcWZtYzcrU252SnJNZ2U3QytFMlorZnJNY1BZUjBw?=
 =?utf-8?B?Z0xqaVplWmVvaWxNRElSTWl1cmhiN3NTREw0QXIyVjFDMTlLaklPSHBPL1pH?=
 =?utf-8?B?WktUbWQ4dGhqeEpNK3l4ODhZT3cwTjBVS2hOKzlXblhVT1RMUkd3aGJHQzMz?=
 =?utf-8?B?K2pLSkN2ZTV5bWc0UW9EcWR3QmszdlFLRnVhM1RNL3I2cTV1NmlCQVpCdllI?=
 =?utf-8?B?Y29FOFoweUVWaHFWWmprTXkycWRXUEJjd25iOTlMeVZFaTl5K2hkTENJK1hl?=
 =?utf-8?B?TnRQdFJVRnF6Z2gzQlRRNWdsemZJeTNsck5vMGFBRUFkUXBaWHZDSkd3ZktO?=
 =?utf-8?B?eXNvZnBTUS9sd0xnVGM1MTVYRGdjTEdSSmNNWGtXTlYrK05ML2JEbVc0RDdO?=
 =?utf-8?B?bUdGQUtBRjRKZGhNeHBqblpYMlZmKzJsL1JMcU1FNmg2SmZIK3U4U2hZcnJr?=
 =?utf-8?B?OFZ2SE4wVVR3RkFZZm9oL05XSm95TzF1OXU1dXVPZzhFZmVUci90cEdiY3JF?=
 =?utf-8?B?WEZ3UmNFektydVNqU2J4YUlxTXA2UlNaNDFZeHFzQWsrbUtwOVFXSGZGOG5w?=
 =?utf-8?B?WGhXT2JNczRKVWJjb2hrQzdEMG1LUExEQis0KzNPNlRrQkYxS2hIZDk5Wkhw?=
 =?utf-8?B?UUlNR1p5eXdkSU9pT21Eck1SQ0tSdXRMOVIxbWZvREVVUHhZQ2FvbFFtVjF3?=
 =?utf-8?B?K0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <29EE688A4C7E944691AF19A88D65C819@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36916c16-0768-4d4a-ebe8-08dd1a5ede88
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2024 03:41:31.8923
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xJR6c3ismfqftsppdiWbxrnx/5qtCCgSnYq97Y2/F3H7WnFFA+POqh9Un/X75oMoiwUcDrdwa1DGxnuyhLlksFku3XmdxL2d/xkpq545siE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7106

SGkgS3J6eXN6dG9mLA0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXdzLg0KDQpPbiBXZWQsIDIwMjQt
MTItMTEgYXQgMTA6MzkgKzAxMDAsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+IEV4dGVy
bmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRz
IHVudGlsDQo+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+
IA0KPiANCj4gT24gV2VkLCBEZWMgMTEsIDIwMjQgYXQgMTE6MjI6NTBBTSArMDgwMCwgSmFzb24t
SkguTGluIHdyb3RlOg0KPiA+IEFkZCBjb21wYXRpYmxlIG5hbWUgYW5kIGlvbW11cyBwcm9wZXJ0
eSBmb3IgTVQ4MTk2Lg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEphc29uLUpILkxpbiA8amFz
b24tamgubGluQG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbWFpbGJveC9tZWRpYXRlayxnY2UtbWFpbGJveC55YW1sICAgICB8IDQNCj4gPiArKysr
DQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykNCj4gDQo+IEhlYWRlcnMgYXJl
IG5ldmVyIHNlcGFyYXRlIGZyb20gdGhlIGJpbmRpbmdzIHBhdGNoLi4uDQoNCkRvIHlvdSBtZWFu
IEkgbmVlZCB0byBtZXJnZSBbUEFUQ0ggMS84XSBhbmQgW1BBVENIIDIvOF0gaW50byAxIHBhdGNo
Pw0KDQo+IA0KPiBBbmQgeW91IHJldmVpdmVkIGV4YWN0bHkgdGhlIHNhbWUgY29tbWVudHMgYmVm
b3JlIHdoaWNoIHlvdSBqdXN0DQo+IGlnbm9yZWQuDQo+IA0KDQpJIGNoZWNrZWQgdGhlIGR0X2Jp
bmRpbmdfY2hlY2sgaGlzdG9yeSBhbmQgY2hlY2twYXRjaCBoaXN0b3J5LCBidXQgSQ0KZGlkbid0
IHNlZSB0aGUgV0FSTklORyBsaWtlIGBoZWFkZXIgaXMgc2VwYXJhdGVkIGZyb20gYmluZGluZ3Ng
Lg0KQnV0IEkgZGlkIHNlZSB0aGUgV0FSTklORyBvZiBtYWludGFpbmVycyB1cGRhdGluZyB0aGF0
IGFwcGVhcmVkIGV2ZXJ5DQp0aW1lIHdoZW4gSSBhZGRlZCB0aGUgbmV3IGZpbGUuDQoNCkhlcmUg
aXMgbXkgaGlzdG9yeSBvZiBkdF9iaW5kaW5nX2NoZWNrOg0KbWFrZSBkdF9iaW5kaW5nX2NoZWNr
DQpEVF9TQ0hFTUFfRklMRVM9RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21haWxi
b3gvbWVkaWF0ZWssZ2NlLQ0KbWFpbGJveC55YW1sIE89L3RtcC9zcmNfa2VybmVsL2tlcm5lbC9v
dXQgLUMga2VybmVsL2xpbnV4LW5leHQgLWsNCm1ha2VbMV06IEVudGVyaW5nIGRpcmVjdG9yeSAn
L3RtcC9zcmNfa2VybmVsL2tlcm5lbC9rZXJuZWwvbGludXgtbmV4dCcNCm1ha2VbMl06IEVudGVy
aW5nIGRpcmVjdG9yeSAnL3RtcC9zcmNfa2VybmVsL2tlcm5lbC9vdXQnDQpIT1NUQ0MgIHNjcmlw
dHMvYmFzaWMvZml4ZGVwDQpIT1NUQ0MgIHNjcmlwdHMvZHRjL2R0Yy5vDQpIT1NUQ0MgIHNjcmlw
dHMvZHRjL2RhdGEubw0KSE9TVENDICBzY3JpcHRzL2R0Yy9zcmNwb3Mubw0KSE9TVENDICBzY3Jp
cHRzL2R0Yy9mbGF0dHJlZS5vDQpIT1NUQ0MgIHNjcmlwdHMvZHRjL2ZzdHJlZS5vDQpIT1NUQ0Mg
IHNjcmlwdHMvZHRjL2xpdmV0cmVlLm8NCkhPU1RDQyAgc2NyaXB0cy9kdGMvY2hlY2tzLm8NCkhP
U1RDQyAgc2NyaXB0cy9kdGMvdXRpbC5vDQpIT1NUQ0MgIHNjcmlwdHMvZHRjL3RyZWVzb3VyY2Uu
bw0KTEVYICAgICBzY3JpcHRzL2R0Yy9kdGMtbGV4ZXIubGV4LmMNCllBQ0MgICAgc2NyaXB0cy9k
dGMvZHRjLXBhcnNlci50YWIuW2NoXQ0KSE9TVENDICBzY3JpcHRzL2R0Yy9kdGMtbGV4ZXIubGV4
Lm8NCkhPU1RDQyAgc2NyaXB0cy9kdGMvZHRjLXBhcnNlci50YWIubw0KU0NIRU1BICBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcHJvY2Vzc2VkLXNjaGVtYS5qc29uDQpIT1NUTEQg
IHNjcmlwdHMvZHRjL2R0Yw0KQ0hLRFQgICAvdG1wL3NyY19rZXJuZWwva2VybmVsL2tlcm5lbC9s
aW51eC0NCm5leHQvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzDQpMSU5UICAgIC90
bXAvc3JjX2tlcm5lbC9rZXJuZWwva2VybmVsL2xpbnV4LQ0KbmV4dC9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MNCkRURVggICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL21haWxib3gvbWVkaWF0ZWssZ2NlLQ0KbWFpbGJveC5leGFtcGxlLmR0cw0KRFRDIFtDXSBE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWFpbGJveC9tZWRpYXRlayxnY2UtDQpt
YWlsYm94LmV4YW1wbGUuZHRiDQptYWtlWzJdOiBMZWF2aW5nIGRpcmVjdG9yeSAnL3RtcC9zcmNf
a2VybmVsL2tlcm5lbC9vdXQnDQptYWtlWzFdOiBMZWF2aW5nIGRpcmVjdG9yeSAnL3RtcC9zcmNf
a2VybmVsL2tlcm5lbC9rZXJuZWwvbGludXgtbmV4dCcNClswOTo1MzozMF0gLSAtIC0gLSAtIC0g
LSAtIC0gLT4gWyBPSyBdIEtFUk5fRElSPWtlcm5lbC9saW51eC1uZXh0IG1ha2UNCi1rIC1qMzIg
ZHRfYmluZGluZ19jaGVjaw0KRFRfU0NIRU1BX0ZJTEVTPURvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9tYWlsYm94L21lZGlhdGVrLGdjZS0NCm1haWxib3gueWFtbA0KDQoNCkhlcmUg
aXMgbXkgaGlzdG9yeSBvZiBjaGVja3BhdGNoOg0Kfi9saW51eCQgLi9zY3JpcHRzL2NoZWNrcGF0
Y2gucGwgLS1zdHJpY3QgLS1pZ25vcmU9R0VSUklUX0NIQU5HRV9JRCAtLQ0Kc2hvdy10eXBlcyAw
MDAqDQoNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQowMDAwLWNvdmVyLWxldHRlci5wYXRjaA0K
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCnRvdGFsOiAwIGVycm9ycywgMCB3YXJuaW5ncywgMCBj
aGVja3MsIDAgbGluZXMgY2hlY2tlZA0KDQowMDAwLWNvdmVyLWxldHRlci5wYXRjaCBoYXMgbm8g
b2J2aW91cyBzdHlsZSBwcm9ibGVtcyBhbmQgaXMgcmVhZHkgZm9yDQpzdWJtaXNzaW9uLg0KLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tDQowMDAxLWR0LWJpbmRpbmdzLW1haWxib3gtbWVkaWF0ZWstQWRkLUdDRS1oZWFkZXItZmls
ZS1mb3IucGF0Y2gNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQ0KVHJhY2ViYWNrIChtb3N0IHJlY2VudCBjYWxsIGxhc3QpOg0K
ICBGaWxlICJzY3JpcHRzL3NwZHhjaGVjay5weSIsIGxpbmUgNiwgaW4gPG1vZHVsZT4NCiAgICAg
IGZyb20gcGx5IGltcG9ydCBsZXgsIHlhY2MNCk1vZHVsZU5vdEZvdW5kRXJyb3I6IE5vIG1vZHVs
ZSBuYW1lZCAncGx5Jw0KV0FSTklORzpGSUxFX1BBVEhfQ0hBTkdFUzogYWRkZWQsIG1vdmVkIG9y
IGRlbGV0ZWQgZmlsZShzKSwgZG9lcw0KTUFJTlRBSU5FUlMgbmVlZCB1cGRhdGluZz8NCiMxNzoN
CiAgICAgIG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQoNCiAgICAgIHRvdGFsOiAwIGVycm9ycywgMSB3
YXJuaW5ncywgMCBjaGVja3MsIDE0MzkgbGluZXMgY2hlY2tlZA0KDQpOT1RFOiBGb3Igc29tZSBv
ZiB0aGUgcmVwb3J0ZWQgZGVmZWN0cywgY2hlY2twYXRjaCBtYXkgYmUgYWJsZSB0bw0KICAgICAg
bWVjaGFuaWNhbGx5IGNvbnZlcnQgdG8gdGhlIHR5cGljYWwgc3R5bGUgdXNpbmcgLS1maXggb3Ig
LS1maXgtDQppbnBsYWNlLg0KDQowMDAxLWR0LWJpbmRpbmdzLW1haWxib3gtbWVkaWF0ZWstQWRk
LUdDRS1oZWFkZXItZmlsZS1mb3IucGF0Y2ggaGFzDQpzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJl
dmlldy4NCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQ0KMDAwMi1kdC1iaW5kaW5ncy1tYWlsYm94LW1lZGlhdGVrLUFkZC1NVDgx
OTYtc3VwcG9ydC1mb3ItLnBhdGNoDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCnRvdGFsOiAwIGVycm9ycywgMCB3YXJuaW5n
cywgMCBjaGVja3MsIDE2IGxpbmVzIGNoZWNrZWQNCg0KMDAwMi1kdC1iaW5kaW5ncy1tYWlsYm94
LW1lZGlhdGVrLUFkZC1NVDgxOTYtc3VwcG9ydC1mb3ItLnBhdGNoIGhhcyBubw0Kb2J2aW91cyBz
dHlsZSBwcm9ibGVtcyBhbmQgaXMgcmVhZHkgZm9yIHN1Ym1pc3Npb24uDQotLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCg0KDQpE
aWQgSSBtaXNzIHNvbWUgY29uZmlndXJhdGlvbj8NCg0KUmVnYXJkcywNCkphc29uLUpILkxpbg0K
DQo+IE5BSy4NCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQo+IA0K

