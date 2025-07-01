Return-Path: <linux-media+bounces-36376-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4714AAEEDFD
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 07:51:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 32A44189746A
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 05:51:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C10982376E4;
	Tue,  1 Jul 2025 05:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="B2XY5tqJ";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="LzlZcJgc"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245741494A8;
	Tue,  1 Jul 2025 05:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751349059; cv=fail; b=Sl5lKBa2oPoeYLLdhFEM6+s8S08OrZ5Swbe8ZeHtVGBMRKtpSSJ6LRovU9LnOPObNSnqMslcl0KCMU7tU0Ojq+n+LHJT7hM5zqATbWzfWUVF3JGH+CTKVFUAQ0cGQE3v77XP988MxPT7KKiahsFnaf3O/vdtWaGZG44tg1gpHrE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751349059; c=relaxed/simple;
	bh=YjdTlZBuiG6bi9aAaWGSubvHfAxrO66KKUxb/uROHeg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Q/XrkO/JKNJ8u+Ya/Pkpc77EbsQMAmJhtBati8OmH57y3Su3f9wIGYiIA3CLz8VBV99Cjvz4/gLK3jZhj+/vib8FxqkK1fzdzsUUTpJE6ZSOEbdrFP7OONb7yfHZ7yA/X4RTF+dN5wVzWHWvJDg63evViujqQVgpI1012LAUImU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=B2XY5tqJ; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=LzlZcJgc; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 587b011c563f11f0b33aeb1e7f16c2b6-20250701
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=YjdTlZBuiG6bi9aAaWGSubvHfAxrO66KKUxb/uROHeg=;
	b=B2XY5tqJT9zAOJjPVVC9oDHF4o+yX3Hk/AIXf1GD/5zlIZjpUvV4BTCB+Zf5YMytpJl3ikzcWR3AZRZ+ElqGrY8eeoI/umNIUG1lMC9Y2xvttbH9mFMFfGzA6cdDaTxMlNBrna62kRtMhXLyVohjC0DQeBvTCTyDQygbC1FwpC8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:1cca179e-480a-48e0-8136-53d9dc4ac17d,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:572dbf73-15a7-4ae6-ad4b-94c27b45c266,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|51,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 587b011c563f11f0b33aeb1e7f16c2b6-20250701
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 954240100; Tue, 01 Jul 2025 13:50:51 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 1 Jul 2025 13:50:48 +0800
Received: from TYDPR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 1 Jul 2025 13:50:48 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZgA6X/Yg+tsKw+g71vEv4hXa9/y1dK2ZehKowgfd9DEoB0rcoHDqYq2mkRkhYzVsi6pZZKrs+2kGwZ5V1JgYnPs3kDWnb1/XKkXrcbC8YCKGXUahJ0F8/PkVrT7Tr5OjXI/daUaqY3/IPU8R2hX1syY5yBIUAm1YnasSRAJ6uNs+krujGpbyZGXeQaCN25mJfyhnTSkIjuhabBtZaR6F6YXBLwKzT5MC3UYNy2NwBDshXZfJXZzw+nYXwyrFr35apmmaVmulM6DdsW5NAluwtZMTwLje6hbmVw0pMpHi3gJ8qeDjlMUXRXGGGvshq00SzhMOMy1CMI/4PAaQv3Rh4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YjdTlZBuiG6bi9aAaWGSubvHfAxrO66KKUxb/uROHeg=;
 b=j16Yn3BTD9RYW/UPsp+KT22xTbA5A6jfg5kXCS8Hz3j60M3Zq/l0EiS3/L+i4fjBrTw4xG4bccGIBrlpNaIa65LuIZmrAC09Qegv7jXayAtHkSbNoxveBCVKbOEubGXGvep7bxo7UH5pKq9a8IAB/yBHt7rc9fl8tUbURGoxo5NPwMGylgj35zbCQiNw8NDc18tk9/g0rV65WvgVYFxJ+2CoBvUZsyMjvuPYhDf4904kyoFL5D10bOIG7H19dL8/0wbErIRU/sQegDkABFTp/lJqCbeBIs0LO8VyqEwa0C///jhr2AMjGKwpziSyLZcZbWJjXYYHPDPEbgkXfnT2DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YjdTlZBuiG6bi9aAaWGSubvHfAxrO66KKUxb/uROHeg=;
 b=LzlZcJgcFL5SoXdBcOGNHLwD2aE+xrzcr2lPjjV9U6wB+E1CvJEIC1AwrcqOO7EI/7kgFJBYVCZsbe3Y3kpMiO5mvleIvhQ8mcBXdy14iFtsowKOH6rT4VqG6wbLC8r8SohwxPAtfNDkoalXXPH2pKZNbbDMMZmfrXT8gWigLlM=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by SEYPR03MB7069.apcprd03.prod.outlook.com (2603:1096:101:d6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.29; Tue, 1 Jul
 2025 05:50:46 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%7]) with mapi id 15.20.8880.029; Tue, 1 Jul 2025
 05:50:46 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	=?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	=?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
	=?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	=?utf-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
	<Xiandong.Wang@mediatek.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	=?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>,
	"fshao@chromium.org" <fshao@chromium.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	"wenst@chromium.org" <wenst@chromium.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, =?utf-8?B?WGF2aWVyIENoYW5nICjlvLXnjbvmlocp?=
	<Xavier.Chang@mediatek.com>
Subject: Re: [PATCH v6 06/20] mailbox: mtk-cmdq: Add GCE hardware
 virtualization configuration
Thread-Topic: [PATCH v6 06/20] mailbox: mtk-cmdq: Add GCE hardware
 virtualization configuration
Thread-Index: AQHb0xtretbpi0s7ZUiTqZa8FSHZUrQW2FcAgAYZnoA=
Date: Tue, 1 Jul 2025 05:50:46 +0000
Message-ID: <23b7cc9681b69946562be50079ece0c6bd6308ff.camel@mediatek.com>
References: <20250601173355.1731140-1-jason-jh.lin@mediatek.com>
	 <20250601173355.1731140-7-jason-jh.lin@mediatek.com>
	 <f12d0d954bea2b89d6f316db6b9bbfeea6b4db8e.camel@mediatek.com>
In-Reply-To: <f12d0d954bea2b89d6f316db6b9bbfeea6b4db8e.camel@mediatek.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|SEYPR03MB7069:EE_
x-ms-office365-filtering-correlation-id: 6b824ec1-fe81-4aac-f2c7-08ddb86339b3
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?L1l2NXBoa3NZUmo3bm4rdXV5aElBbld3ckpOSGxlaHRwMHFHbDNoa3E0OXRY?=
 =?utf-8?B?UFA3SUYxS1N2aU81R2ZHVGJxWWYrc0Y2NGxleXN1UHBmVEcrVlVYMnJ5dUl4?=
 =?utf-8?B?MHZodGdpbWlqbktxYXVNVHlOUmdMQ0dYUjJYKzFmWUwxSjRKcGtwOTJqS2NZ?=
 =?utf-8?B?NDZyQlkrWVJUam9LeXNFaGVmem4zZld0V2orMGRZa21HdkFpMlZDYnEya2Iy?=
 =?utf-8?B?RWRCNjVsak5TU2llZ0M3QjJMZ3Z6OXpwSFE2ZGw2Y1ZzZnNGYTVtWkZXMDVG?=
 =?utf-8?B?M2V2MjR2QzlGZTNaTE1uU0JSQjgzZkxMMlZ5WWhWb20xWEpZOGhaRHdRc29M?=
 =?utf-8?B?QnllSS9OOWpaVmFmR1FmcSszUmtwOURheUlsRlMrNGZ6UkRzdFZuMmVQRktC?=
 =?utf-8?B?eXRKRjIwZUhTRVBBcnBHbGhwQXdwY21OVUZRanZ1b1hYVHF5ektiQWcxTkI0?=
 =?utf-8?B?ZVErUlYyT1pwam9TeG9LbWt2RlQyTEZkVnVPbmdEV3BaRHo3UCt2TFo5NFNE?=
 =?utf-8?B?aVNPRENHUUZTanhFNG9sUmNtVHFXeExONzdzUkFwem9JeHJDdWtPWWN4dUF4?=
 =?utf-8?B?MWUrMTZmMitwcTNkWHBoM3Fob2JPZUdUUVcvNURqR0RIVlp0S1FJQUlBZlJI?=
 =?utf-8?B?UU1kS2lobStpdFk0bjBTM29wbWF1V2JVZThxWE9rQW1ORXFuQzUwTExoTG5p?=
 =?utf-8?B?Vmd2dEQ0S1QzcENVekpVY016VmNoT3JNYzVTQjZUMFFzTmZSSmhubEZsbGU3?=
 =?utf-8?B?SUhuNDhPQjBCQTNoelpRQWtybWhLWFlRVEltNUVKOU9GZ2xVNEZTNWpBeDR3?=
 =?utf-8?B?dVdoZ2FFeWlKclpXT3JaSkc1QVFEU1d6SGNoeW56QlF5aFF6blJDVHJHcitK?=
 =?utf-8?B?a2pIdFZiSWxGM1p1eFJmWlFrK2MzUy9DUGdaWTg4YUVQYnI1ZlZCVEE5SkI0?=
 =?utf-8?B?WjgwMVk1L25uM3hnaEI4WFdvclBVZ21SbzBTK2NZOUJlUUZRN3R1VXkwdTZr?=
 =?utf-8?B?RDN6dGV5Rm1xZzdZOFI3OWtqS201YThKdzN1enpPQ21vbTkxSUx6NSs3ejFJ?=
 =?utf-8?B?WFM4cDBaK2pyeEl2bDdxU1hLc2ZNTFBmR3NlK0UzQ1BlZ1VVVXM3SVNvcDhy?=
 =?utf-8?B?NG9mTjgzS1JhMkdnWEIrT2F3WFF5ekJ1SU90dVVNN0pScUhGaUx1NEYyS2JB?=
 =?utf-8?B?VGZ2cWFZNTRZWmNMWnF0Ky9SdVVHKzhuTytndHl2cE9FL3phQmdBczhPVkZN?=
 =?utf-8?B?V0hwZjBqd1JVUWJ2QWtxbDVHYU9BSjZQcml5MlI3RXBLOXB5WTluL21aZ3hE?=
 =?utf-8?B?WUtyckVqZkdMVkRRSkRsL2RIUDNzQlR1K1g3QnRIcUJ0K3hIalVQdWNpaFlP?=
 =?utf-8?B?TEtISWI2ZTR1anp0bVhxZ0FlWmU1SFlDUmFFU3lFOEVyYk9rS01Lcjh2QUNi?=
 =?utf-8?B?ZVpqMkRLMjZjejM5eDdrcnB2TnV4TUowTGRhZzRiMUd1YVVWOWF5SllsQUpU?=
 =?utf-8?B?R0NyUkpwWWJXR3VneTdORElnUWZNVE5DblM0OVcxOXdqTDFMcFMyMXowNzQ4?=
 =?utf-8?B?TmtiejdXYUk1c21VMlRjOGQ1WG50bytNNXhHQ3V0ZHFyQWFGOXNBR3hIK0JT?=
 =?utf-8?B?b0lNeWJTYSthb3IzUUtjT1ZlUGhIdWJyYkk3MTJ6Vk9KOEFjbVBTTnM5aGt4?=
 =?utf-8?B?YUlOM0FyNGFneVJqVDdaTzVjQXJ4QWpNLzVqQlpnb1ZoWE1YMVZHbFcyck8x?=
 =?utf-8?B?WUtaZzRUY0lrK1V6SjJ0SEJUcGdtcGhJcTROS0dPMlBiU1Vqd0ExY3pEa1Jq?=
 =?utf-8?B?ZVhyTHR4UFZ1QmhhSW5aYkl5Wit2WGZIOXltYU5hL29DNkZQMHdKbVZZUkxu?=
 =?utf-8?B?Wi9NdUtCOXIxNmY3WVptaVg1TkQzRFkxd1FNM2NNQzQ3STNYMFVBNURSMDlt?=
 =?utf-8?B?bTVsNFpnS3hIbUNoV09rYmVIa09mM0pwQzZCN2EzeUlWYnJCdFZISUlHOHg0?=
 =?utf-8?B?SFhVS0JmZFF3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7682.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MDAyeEZnSGFJM043ZXZNV2pIdVdiVWIvQVdxbjdZNnd0d3RpVHMrQXdWb2Jt?=
 =?utf-8?B?Z0IxalgvczN5aDQvS08xZ0Jsb1hZU21wMWJMdFNhOWdyVSsvOEs5OEdTYlV3?=
 =?utf-8?B?Q21NeUh0enBaZlpKZHRnTlFLNWFYSEtFaXVDa3ZlcnVFUVBvdE90Q01wUThP?=
 =?utf-8?B?aW5yL015YTVMQU5Yb0crTXlzelNMMFc2YUJoaFRNK3hYaUdaMEJLZ1Ftc3Fo?=
 =?utf-8?B?NmU0bkJuMmE2TFZGS0FSN0s1c2dxUlRydlVmUGk4UEI5bGFRWXlBSllBZm9V?=
 =?utf-8?B?MUY5Z3l6Nm0zZ0diU2UvMGlGeThPcTRGckY1R0taUlB6VEw1SXZUbEdNalhT?=
 =?utf-8?B?ZjF6SDFlQ2x0bjExeGM1MUdISDdKTVZIZXhlR1dReXpQellmNzJCVzNISDVP?=
 =?utf-8?B?YXFGNk9pTi94Y1BzMWZqbEVoUEtXcng5UHE5THRqSDNlbkpRZnM1d3lpdVJX?=
 =?utf-8?B?cVVrTlY2aVFIRmhmNWxQRk1rY3dGdHJZK3VmdDdrT1RKUjZpdE5kcHdqT001?=
 =?utf-8?B?d1M1S3hwdFVjK1pCUlJBSWJZakpvbTFSK1VORnkwNnNmSzVtYTlNalo1RUJH?=
 =?utf-8?B?Q3R5QWZoQUZ5MTJ4OUJvMmVxUGJkM3Y5czdhSHRxa1NhdjY1cFhRZ0hPbHor?=
 =?utf-8?B?b2ZGcHQ4aGxaY0RZdzlyU0FqMk1GZnJQZ1l2Q21IWEpxVlFpbG9pZkhDYTIr?=
 =?utf-8?B?UFFPU2lXZVhTZ0FxYWo3Ni9TKzdJWkE2ZGhtZ3RxRHJ6WFhRWVlhRmhGcGJJ?=
 =?utf-8?B?VXFueDVHbjg1SjQyd04rcE1hRjVqYWxwMlBqNytzcUZSeWRZWncyN3ZnNXJl?=
 =?utf-8?B?b3lMcEZ4ZEpQQXZ0NDROTlBjb0JwMXU2UHJCRk04Y0xzbXJBc0s2TllIdXpl?=
 =?utf-8?B?WUZpd3ozWUt2eUh4NmVsUlhKOTR4eTl3RC9tZjR6OTNyZEl5dENjYmhidXpV?=
 =?utf-8?B?UHZXRnpUYmY0UkJDeU9ueTdJTUJLOG1RZVhBSVk0aXhabmRiL3J5dlZZMWV0?=
 =?utf-8?B?SXNOeExBbXNGdFpySEFTcis5L2c3Zy9YdnpEU0NoNWRzNnQwdGYrbEJXUnJ6?=
 =?utf-8?B?NE5FNExpNkIrdkVwSmM4TXJIYXVmaCtScHVhc3Y4VTFMbE1pRWtSRUt4SnEr?=
 =?utf-8?B?bEtnWnVZYXpJWW9MRmJpc1d3Q1h3K0RxdklIOXJ0d2hOQkdMY29PWFpwZ0FP?=
 =?utf-8?B?a1RNbEVvSHVLZkVwZWVDZ0hpT1N5Qm4zSHdVQnNaaFZFWjhxMjVPampoUjkw?=
 =?utf-8?B?M1djRWFpWEtKQVNPY1drL0dmd0VrWS9najVJWFB1djdhRDR1ZHN1dzBabmlN?=
 =?utf-8?B?bmZDUVYwcFlMR3IrVWVGei9jVmJPY3VISko5UHdZUnYvVWVYQ0lFSVJtNXhn?=
 =?utf-8?B?WHpHSThVa2pHb1IzTmFTZFhNbU4zS3JNQTh1SjdBNEV5eWZTcVFSM0FzOThK?=
 =?utf-8?B?bGJhV21XTVJGM0Q0a2tmSUJKUTZUdkVyczgzVkp5aTNDc1MvVFNYbVlBZjNt?=
 =?utf-8?B?UDZhMEl3eFZNSURNNFdscWFtYjR0V3FsZzF1SHU3c0FuQUNHdG94c1FEYkZu?=
 =?utf-8?B?ZCtjYWZIUHYxVHRRNnBXVFg3WWtGWkcrM2pvK2hDdXJHZFZEd0RjT0w1QjA5?=
 =?utf-8?B?a1Y2b0RhWkhFcGtHbWFHeEE0WXJsZFE5ZldleFl0TWF5RDFMbitKamVSRnl0?=
 =?utf-8?B?MUV4dHN3NDJ5ZWkxL3NhWE1XaHN2dkZOWjZzVGVVdlU4WUVqaTBEZGJOY280?=
 =?utf-8?B?a2lnazJQTVRLQ3RwMGFIZzYxbUN5QjJaT2NSQ1FzcThoQVBhTm12WHVLN3NY?=
 =?utf-8?B?OWxEUFFXNG1UTnhhUEZtSUtNV1FldDQ3L2R6dHdqQkZ0aDZqZmZPWml1REpN?=
 =?utf-8?B?OWo4TkZGbjgwbW5GdXJUTkNMbnlaaEp2T2FmeWJnR1QvM1BJRGhEcUlmZFg5?=
 =?utf-8?B?UFVNWXFYbG9BWE9wUXkzM1RJQzJvenF3a09uRlRqY1dESE1lS3FYL2doS2ls?=
 =?utf-8?B?MWpJSzlYSkZzRkRmNDU4VEdBU2RJRXFRUXdpdGNuQ1JLeFB2Smw1Ni9ZYjI1?=
 =?utf-8?B?cDVHczI2dDVIdk11N3ByQjFJOGNKY3U0WnVmTnMxMjdsb0ZJTWduZFdKN1N0?=
 =?utf-8?B?aHhvQzBuSERJbjFOa0FqTEdRakljV29kYnV6bG9mSmM5ajlqZ2JLcUF1RCtl?=
 =?utf-8?B?SGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <75B96E31BFB8F14D8AC0CD74B8EC1733@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b824ec1-fe81-4aac-f2c7-08ddb86339b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2025 05:50:46.5701
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o3lW6tSufilqSwsJXUYfO8ujFoIeMzk30hC+oCSt1BbvWfG3MhzGOUMtaJ5ZpHjcN5kwqgoqWWTJL/b8RTbpa4e5n7PQunS9biVdz0xmGnA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7069

T24gRnJpLCAyMDI1LTA2LTI3IGF0IDA4OjQxICswMDAwLCBDSyBIdSAo6IOh5L+K5YWJKSB3cm90
ZToNCj4gT24gTW9uLCAyMDI1LTA2LTAyIGF0IDAxOjMxICswODAwLCBKYXNvbi1KSCBMaW4gd3Jv
dGU6DQo+ID4gVGhlIEdDRSBoYXJkd2FyZSB2aXJ0dWFsaXphdGlvbiBjb25maWd1cmF0aW9uIHN1
cHBvcnRzIHRoZQ0KPiA+IGlzb2xhdGlvbiBvZg0KPiA+IEdDRSBoYXJkd2FyZSByZXNvdXJjZXMg
YWNyb3NzIGRpZmZlcmVudCBPUyBlbnZpcm9ubWVudHMuIEVhY2ggT1MgaXMNCj4gPiB0cmVhdGVk
IGFzIGEgdmlydHVhbCBtYWNoaW5lIChWTSkgZm9yIEdDRSBwdXJwb3Nlcy4NCj4gPiBUaGVyZSBh
cmUgNiBWTXMgYW5kIDEgaG9zdCBWTS4gVGhlIGhvc3QgVk0gaGFzIG1haW4gY29udHJvbCBvdmVy
DQo+ID4gdGhlDQo+ID4gR0NFIHZpcnR1YWxpemF0aW9uIHNldHRpbmdzIGZvciBhbGwgVk1zLg0K
PiA+IA0KPiA+IFRvIHByb3Blcmx5IGFjY2VzcyB0aGUgR0NFIHRocmVhZCByZWdpc3RlcnMsIGl0
IGlzIG5lY2Vzc2FyeSB0bw0KPiA+IGNvbmZpZ3VyZSBhY2Nlc3MgcGVybWlzc2lvbnMgZm9yIHNw
ZWNpZmljIEdDRSB0aHJlYWRzIGFzc2lnbmVkIHRvDQo+ID4gZGlmZmVyZW50IFZNcy4NCj4gPiBD
dXJyZW50bHksIHNpbmNlIG9ubHkgdGhlIGhvc3QgVk0gaXMgYmVpbmcgdXNlZCwgaXQgaXMgcmVx
dWlyZWQgdG8NCj4gPiBlbmFibGUgYWNjZXNzIHBlcm1pc3Npb25zIGZvciBhbGwgR0NFIHRocmVh
ZHMgZm9yIHRoZSBob3N0IFZNLg0KPiA+IA0KPiA+IFRoZXJlIGFyZSAyIFZNIGNvbmZpZ3VyYXRp
b25zOg0KPiA+IDEuIFZNX0lEX01BUA0KPiA+IFRoZXJlIGFyZSA0IHJlZ2lzdGVycyB0byBhbGxv
Y2F0ZSAzMiBHQ0UgdGhyZWFkcyBhY3Jvc3MgZGlmZmVyZW50DQo+ID4gVk1zOg0KPiA+IFZNX0lE
X01BUDAgZm9yIHRocmVhZHMgMC05LCBWTV9JRF9NQVAxIGZvciB0aHJlYWRzIDEwLTE5LA0KPiA+
IFZNX0lEX01BUDIgZm9yIHRocmVhZHMgMjAtMjksIGFuZCBWTV9JRF9NQVAzIGZvciB0aHJlYWRz
IDMwLTMxLg0KPiA+IEVhY2ggdGhyZWFkIGhhcyBhIDMtYml0IGNvbmZpZ3VyYXRpb24sIHdoZXJl
IHNldHRpbmcgYWxsIGJpdHMgdG8gMQ0KPiA+IGNvbmZpZ3VyZXMgdGhlIHRocmVhZCBmb3IgdGhl
IGhvc3QgVk0uDQo+ID4gDQo+ID4gMi4gVk1fQ1BSX0dTSVpFDQo+ID4gSXQgaXMgdXNlZCB0byBh
bGxvY2F0ZSB0aGUgQ1BSIFNSQU0gc2l6ZSB0byBlYWNoIFZNLiBFYWNoIFZNIGhhcyA0LQ0KPiA+
IGJpdA0KPiA+IGNvbmZpZ3VyYXRpb24sIHdoZXJlIHNldHRpbmcgYml0IDAtMyB0byBjb25maWd1
cmVzIHRoZSBzaXplIG9mIGhvc3QNCj4gPiBWTS4NCj4gPiBUaGlzIHNldHRpbmcgbXVzdCBiZSBj
b25maWd1cmVkIGJlZm9yZSB0aGUgVk0gY29uZmlndXJhdGlvbiB0bw0KPiA+IHByZXZlbnQNCj4g
PiByZXNvdXJjZSBsZWFrYWdlLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEphc29uLUpIIExp
biA8amFzb24tamgubGluQG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gDQo+IFtzbmlwXQ0KPiAN
Cj4gPiArDQo+ID4gwqBzdGF0aWMgdm9pZCBjbWRxX2djdGxfdmFsdWVfdG9nZ2xlKHN0cnVjdCBj
bWRxICpjbWRxLCBib29sDQo+ID4gZGRyX2VuYWJsZSkNCj4gPiDCoHsNCj4gPiDCoAl1MzIgdmFs
ID0gY21kcS0+cGRhdGEtPmNvbnRyb2xfYnlfc3cgPyBHQ0VfQ1RSTF9CWV9TVyA6IDA7DQo+ID4g
QEAgLTE2Miw2ICsyMTEsNyBAQCBzdGF0aWMgdm9pZCBjbWRxX2luaXQoc3RydWN0IGNtZHEgKmNt
ZHEpDQo+ID4gwqANCj4gPiDCoAlXQVJOX09OKGNsa19idWxrX2VuYWJsZShjbWRxLT5wZGF0YS0+
Z2NlX251bSwgY21kcS0NCj4gPiA+Y2xvY2tzKSk7DQo+ID4gwqANCj4gPiArCWNtZHFfdm1fdG9n
Z2xlKGNtZHEsIHRydWUpOw0KPiA+IMKgCWNtZHFfZ2N0bF92YWx1ZV90b2dnbGUoY21kcSwgdHJ1
ZSk7DQo+ID4gwqANCj4gPiDCoAl3cml0ZWwoQ01EUV9USFJfQUNUSVZFX1NMT1RfQ1lDTEVTLCBj
bWRxLT5iYXNlICsNCj4gPiBDTURRX1RIUl9TTE9UX0NZQ0xFUyk7DQo+ID4gQEAgLTMzNSw2ICsz
ODUsNyBAQCBzdGF0aWMgaW50IGNtZHFfcnVudGltZV9yZXN1bWUoc3RydWN0IGRldmljZQ0KPiA+
ICpkZXYpDQo+ID4gwqAJaWYgKHJldCkNCj4gPiDCoAkJcmV0dXJuIHJldDsNCj4gPiDCoA0KPiA+
ICsJY21kcV92bV90b2dnbGUoY21kcSwgdHJ1ZSk7DQo+ID4gwqAJY21kcV9nY3RsX3ZhbHVlX3Rv
Z2dsZShjbWRxLCB0cnVlKTsNCj4gPiDCoAlyZXR1cm4gMDsNCj4gPiDCoH0NCj4gPiBAQCAtMzQ0
LDYgKzM5NSw3IEBAIHN0YXRpYyBpbnQgY21kcV9ydW50aW1lX3N1c3BlbmQoc3RydWN0IGRldmlj
ZQ0KPiA+ICpkZXYpDQo+ID4gwqAJc3RydWN0IGNtZHEgKmNtZHEgPSBkZXZfZ2V0X2RydmRhdGEo
ZGV2KTsNCj4gPiDCoA0KPiA+IMKgCWNtZHFfZ2N0bF92YWx1ZV90b2dnbGUoY21kcSwgZmFsc2Up
Ow0KPiA+ICsJY21kcV92bV90b2dnbGUoY21kcSwgZmFsc2UpOw0KPiANCj4gV2h5IHR1cm4gb2Zm
IHBlcm1pc3Npb24gd2hlbiBzdXNwZW5kPw0KPiBXaHkgbm90IGFsd2F5cyB0dXJuIG9uIHBlcm1p
c3Npb24/DQo+IA0KDQpZZXMsIHlvdSdyZSByaWdodCENCg0KVk0gcGVybWlzc2lvbiBzZXR0aW5n
cyBzaG91bGQgbm90IGJlIGRpc2FibGVkIG9yIHJlc2V0IGFmdGVyIGJvb3QgdXAuDQpCdXQgd2Ug
ZG9uJ3QgaGF2ZSB0aGUgSHlwZXJ2aXNvciB0byBrZWVwIHRoZSBHQ0UgSE9TVCBWTSBzZXR0aW5n
cywNCnNvIHdlIG5lZWQgdG8gY29uZmlndXJlIHRoZSBWTSBzZXR0aW5nIGFnYWluIGFmdGVyIGNt
ZHFfcmVzdW1lKCkgdG8NCmF2b2lkIHRoZSBHQ0UgVk0gc2V0dGluZ3MgYmVpbmcgY2xlYXJlZCBh
ZnRlciBjbWRxX3N1c3BlbmQoKS4NCg0KSSdsbCBkcm9wIHRoaXMgVk0gc2V0dGluZyBoZXJlIGFu
ZCByZW5hbWUgdGhlIEFQSSBhcyBjbWRxX3ZtX2luaXQoKQ0Kd2l0aG91dCB0aGUgZGlzYWJsZSBW
TSBzZXR0aW5ncyBmbG93Lg0KDQpSZWdhcmRzLA0KSmFzb24tSkggTGluDQoNCj4gUmVnYXJkcywN
Cj4gQ0sNCj4gDQo+ID4gwqAJY2xrX2J1bGtfZGlzYWJsZShjbWRxLT5wZGF0YS0+Z2NlX251bSwg
Y21kcS0+Y2xvY2tzKTsNCj4gPiDCoAlyZXR1cm4gMDsNCj4gPiDCoH0NCj4gDQoNCg==

