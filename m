Return-Path: <linux-media+bounces-19528-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8133999BF9C
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 07:57:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 120831F219F8
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 05:57:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BAFD140E50;
	Mon, 14 Oct 2024 05:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="kxRho2Fs";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="CXO30UPN"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A389413EFF3;
	Mon, 14 Oct 2024 05:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728885414; cv=fail; b=NBuKpF0KGWvuQ9DfnOieyi6NWkVrmH5IRnY1Vn5seKXaOZkMkyrFHUq9O8nVBnsKlYU6ohsCOYyvZMIxHmoxWp8K4lG7RI1Pr1SN/lkM8qqJGwFdG78efRPdnfJVOQzCC0TwmXB6Ls4FD9qU2ygbYUhwVBxf7OO85vjA4bXNcrY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728885414; c=relaxed/simple;
	bh=s6TAF7zbjdBVxUGb29HJV9f+qMTsAr0MuD+XkwElC20=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=km9/UgLFRudo9t3s3KPXn6actwbRkZJnXb0Y0kOtxtA67jAH8DqIfi6Xj88khBfLIfXC5L6AaioqVJwBgRaYk9mCzxGcDbBgxbLYiFTUaqaSi682SlgP/1+kZX4Vn3Wb4HJxgblIiXJ+9KoSjZRpg/nvxlE3ZguGidt77yAnZn4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=kxRho2Fs; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=CXO30UPN; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 1840191889f111ef88ecadb115cee93b-20241014
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=s6TAF7zbjdBVxUGb29HJV9f+qMTsAr0MuD+XkwElC20=;
	b=kxRho2FsusHEM9h9x3xEZnV7jRPCTe2djYC/G4kPPwwKF4AgDJAtMpQNg2f+rBMUVC1q1XcnOpeYVuX2W2ClKvWVqLuq+472Nb68f11pXkoe/xrCaViFoQWe7wQxhD+CW6bfxg1nMIawHwuujH5DlxWJ1QQsRC3k03s2wqWwwxU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:9f0dec64-c2a2-4df8-b990-0565182083e0,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:c4923265-444a-4b47-a99a-591ade3b04b2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1840191889f111ef88ecadb115cee93b-20241014
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1253513523; Mon, 14 Oct 2024 13:56:45 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 14 Oct 2024 13:56:43 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 14 Oct 2024 13:56:43 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jvA+Q5C+Ah3fIO3YL9vKjqtcDA/c248a0RK9yf6Bq7Vd79jo5OacSuJ/Dok4XASwEvRVt3n9mQQBn6TR2t8HQxIPFjUmYcp9TOHtn7FcMzZ3szFFoIzEmYkA0GhbIu0RkhqKANfuPkGrWsXC7e024TDnSxMDzOkUFkDxeIbvgm0kftXTV1e59LtE3XpTP2gwe0ZRFtqnJ094HdWDKK5Pb+VFVgWH1+6Js760PuutphcEESg9VCMPqvt2Agyh7IX5PXYLAiEP97BSS6QCaj+y80KtEfrQM17NXRgpwtvk7rbH43QTUaGQ8kfeV/0G69BXWPsOELZ4bYmG7JCWF7vc0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s6TAF7zbjdBVxUGb29HJV9f+qMTsAr0MuD+XkwElC20=;
 b=vqP0rPgS7flgj1p4vW6nw4iVq15DAoDze40MFT09F3Z5H+hlE4lFsdlQM3V2Xvsuscf7ywyNYREm3b17YMrL894HkVRgWh2q5Q0omplG+47a6F+VFyVPf2Tsy5QZevSiQoyiaOkhwaCGFAVwAfhx16UHaRsQ0/Tj9YWJ/REhsau5Snrn49jhZNm8c0Qrcb+EPBU6DDuBkpylCKTUbVeJcqGXKdEYTE8iqxx5i2vsnoFh6U03rQDvk2hCV+RwbHiwfNkKZswz2hHwmvL4AHdiGNewFJRl0pmblbYs810O3Bj94f8wdLz7oNc7dh0z2lpLPvxFJJCZJBWPbu/DB/ZZTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s6TAF7zbjdBVxUGb29HJV9f+qMTsAr0MuD+XkwElC20=;
 b=CXO30UPNGiCFo7RC+axYX6Cog3JyaY5V8WTs8X383hZx1o9hAPFmgCwMbCjNFOZ1ChkvPKcRDr/RW5aDmT8YhCnkl/Rs0yiwcLw+IOir3JeoL3/JoyWeci7dLIS3fTuhxDV/ojK++C3n8SZni/WS2ug7ZftS6k4t7l7anuk6P3Q=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEZPR03MB8156.apcprd03.prod.outlook.com (2603:1096:101:18c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Mon, 14 Oct
 2024 05:56:40 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 05:56:40 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
	"christian.koenig@amd.com" <christian.koenig@amd.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?utf-8?B?U2h1LWhzaWFuZyBZYW5nICjmpYroiJLnv5Qp?=
	<Shu-hsiang.Yang@mediatek.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"yunkec@chromium.org" <yunkec@chromium.org>, "linaro-mm-sig@lists.linaro.org"
	<linaro-mm-sig@lists.linaro.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, =?utf-8?B?WWF5YSBDaGFuZyAo5by16ZuF5riFKQ==?=
	<Yaya.Chang@mediatek.com>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	=?utf-8?B?VGVkZHkgQ2hlbiAo6Zmz5Lm+5YWDKQ==?= <Teddy.Chen@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "hidenorik@chromium.org"
	<hidenorik@chromium.org>, =?utf-8?B?U2h1bi1ZaSBXYW5nICjnjovpoIblhIQp?=
	<Shun-Yi.Wang@mediatek.com>
Subject: Re: [PATCH v1 10/10] uapi: linux: add mediatek isp_7x camsys user api
Thread-Topic: [PATCH v1 10/10] uapi: linux: add mediatek isp_7x camsys user
 api
Thread-Index: AQHbGj2oNs0v9TyLkkuXYBAr3amqdLKFxzCA
Date: Mon, 14 Oct 2024 05:56:40 +0000
Message-ID: <ff96b314cdd3d52a14a5e91f79ec3097d04c4380.camel@mediatek.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
	 <20241009111551.27052-11-Shu-hsiang.Yang@mediatek.com>
In-Reply-To: <20241009111551.27052-11-Shu-hsiang.Yang@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEZPR03MB8156:EE_
x-ms-office365-filtering-correlation-id: 28d5458b-ce5f-4a48-9eff-08dcec14f915
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?VTdpZThYNVVnanRHVGc2RUlmVEZIRUx3M084NWIweStUZGl2S055RVV6b3Y5?=
 =?utf-8?B?YytaMEtvSVFNdUhCbjRKZDYxN0xTOXNqek5zRExGOHU1THVUckpmM2tHUmlo?=
 =?utf-8?B?bjlZd01BVnIzcVFvZFlGMVRBUWZnL2RqckE0TkN2Rmx3ODk1TUdWQ0tWZWNY?=
 =?utf-8?B?SWluRGt2SGtVcE0zR01oNFoyT1kzNjBVUWVCWk41SVhMdm1GajQ4VEpGYmgv?=
 =?utf-8?B?d2JRNDl0U0lMT3BHQUx4eXdLcTFZVEpwR0JSWXk2dWw0TTB1U2k0b1V2Q216?=
 =?utf-8?B?MnFTMEtaZWFicDJiMDBjbVEzNHNoOWVZT2RwU3pMd3luZmh0N1VNZDVvY3Zq?=
 =?utf-8?B?R0VsYXVxWlBlYVlMb3NKdURIc2tlK0hxN2dIZENEcnU5OTk5TFdxT0lhbk9n?=
 =?utf-8?B?eXNyc1Q1VkRTUEM0amNkVkQ2L29BK0RyTXNBK3J1ekZYcU1wTW5xRllUdXZX?=
 =?utf-8?B?U2JtdkQzOFVGMTJZL0pmTHNkd1p3cU9DNFEzbnZBeVBtVUhQVUtOaURmYmF4?=
 =?utf-8?B?USt1eDdRT0tiSXA0dndpZDBHbkNJbGhwMmZoQ3ZGYXRPaTREZFVic3NXWlNk?=
 =?utf-8?B?SGI0OTVYODcyUXgzVkxRYkQ1VFdUbTdKaVM2V1J1YnBKaUh1NXdtdmlxbkMz?=
 =?utf-8?B?VnNmRnQrd3l0Z2ZhM1F3QWNQbm1xNEZsSVh6ZS9MczNDR0RSREdrM0crQzgx?=
 =?utf-8?B?N2JRTkowaTB6Z3RCaVFCU3M1Y2ZOWStuV0V5c1l6Tk1vTllwQmg4NkR6UjNP?=
 =?utf-8?B?b05FVzlpUUJyM2Q5SVlYMU5sc0tIeXNtaVBseTZWMklFZlVkSG1Xd2xGa3Ir?=
 =?utf-8?B?U3dnTlEzb1VlQ3dmNkhHWENzTXYrTDdEWEtObHg1SllmNytBMXZNbXBaaUd3?=
 =?utf-8?B?MHFoRGN1aS9WSW9TTFVCbmVFU1N4WGJKOVRPY1hFL29oS0VvN3pYeit0REpK?=
 =?utf-8?B?WjE3MWgySWQ1WHVOV3cxYURGQ1Y3QkxBTEZ3a0licnZjTEhOZ1lEZTJyUWE0?=
 =?utf-8?B?bEM0Q2o3ei9KVERyT2tUSG9LNnBHUm0reGZ1RkEvdDBzQllrK1dkczJXS2JR?=
 =?utf-8?B?TXNxazZNOER5VWw2WWczKzBtQ3d6QmZqZnFCZ00zSDVGT0dFSHFxN3kwOFhw?=
 =?utf-8?B?cm5hbXNHbllNS3kxU1o3WWlLRVVFVi9JNFo4dS85VVpNQlNUdHNkRUhXR0Z5?=
 =?utf-8?B?bnFtS0oyMzR3L1pOOCt5cGhyemdYNHVNN3lKdGNZOGZLWjJCN2pnYUoraUJ2?=
 =?utf-8?B?WlhnbXQyVGJnVUhYTWI0UGtFUnFDRXpvY1ZQZnhxTnN3RVk2WHptQ1RSV2RG?=
 =?utf-8?B?ZEJ6QU5wZFJQVEFaS1VkaWxMNkg0RHhieXgzTXJSOXgrdWpvQXJuR3VHSWZB?=
 =?utf-8?B?bXFZSHdtUVJSOFh0enZSc3MvZ0hJRDlPUXFNVktwSWxOWU90WWJiblRHQVBL?=
 =?utf-8?B?ZWpOVTFsNHlqOGJOS0UxaExHVHlNZVZyeUtXNEVtWXB0elh5U2FPdTlPc2sr?=
 =?utf-8?B?b0VpdUdBYVIvdURZRzRPYi8yaWhpL080OFd6L1ErYldxYkpzMW5scUNkbllJ?=
 =?utf-8?B?bWZHOTNOVG82dUJmOXRFbWc1QStKeFFkK3FrOTRjYVV3VitjV24rMXZJNkho?=
 =?utf-8?B?dDMwelVVMERzSEo2TU1vSEEvWk8vYXlmRTNlcGs5SEd1WVZ6Mk9ZTUthdmpQ?=
 =?utf-8?B?V1RmZW1qenY2RFJNTWhqZGN0VXRkVjhoazJudUdvckVnT3dJb2tBVk5DaWVL?=
 =?utf-8?B?TGIwd0lOeVBqOFBXQnRQdHJ6K25iQTdCZm1SbTU3c0lDNHJkNitvbzBsSVF6?=
 =?utf-8?B?Qm5FRW1VdHorT2pQUHVHdz09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TlZuYXZJWVhyb2ZGR0oydG5ERTdaVUVHUzdUbHE2NGxFS2JrMXdZV2Q0ek0r?=
 =?utf-8?B?S3p1SG5lcWxpNm4xQ0FzMy92WkFlZ29kb1RkMXdUUERhRFQ0SVhzQTJYcnNE?=
 =?utf-8?B?YUxnZyszZ0dobGp5QnZlYTBJZnFEdVBHU2dsMkltYnh3KzFWMEphWWxQQTQw?=
 =?utf-8?B?VHpPU2NpTE9VVWE2ZHJySmVLSVNJbUdNaTZxUVJFWG5oaDBlN0RuWjRFbzd2?=
 =?utf-8?B?R2tuVkpqelU2RS9PTm5TR3F4bXpzWnR3RFQ2QVl2cEVQRVJIZWM2WHBkbEtW?=
 =?utf-8?B?U0VTU2w2UlI2bkJobkExUjN5b1MyeDVCSDl4OWNleVBqMHpwbVNwaVViSitU?=
 =?utf-8?B?TVZzSVV1RmhmVHRaMlcwZXVqelZ6cm1RbWhGNE1CQTdhYkdKUG4zM1JjU2Ns?=
 =?utf-8?B?RTNQUVlacHFJZVhZSWt6Y1hOa2Jvb3VnT0dueXdPNjRWVWlHaGF3dlZnbFo5?=
 =?utf-8?B?RVRiZHorT3plNVdGeXMvSkpTVzZscUdObHZTd0xnK3BNbng1c1R6amRKdm5X?=
 =?utf-8?B?OXB4bWx2S0FHdHl5TEI1dWdtSm9reTRoZWwzWTdld1IydU5iVUlsU20yVXlp?=
 =?utf-8?B?Uk9Wbm96Y1duQWYyeWE4Rnl6U1ZQbm5GS21xeE9JU0xkeDEwU01Wa0VXaFFP?=
 =?utf-8?B?NlFBQmkray96M2FCc1lXTlJNSlRpeWgySnlMNVc3czhPWmZDbjdSSXNjUlRN?=
 =?utf-8?B?bnBFVHpMcHFQdXo3QTFIeFF3bmw3eEpKZkc1UmVyb0pSVkN0aE5qREVyZUdk?=
 =?utf-8?B?b05RUWIzb2xiRE9xRGdxMVZjNk1hMW4yZnU3aDlRYkZ3My9lazhSR3NoSmtF?=
 =?utf-8?B?TXBTeVN1M1U0TDA3YW1DaTZnVjFKMVpqZld3Wk1wdTl3TGZyR01NeS94WENh?=
 =?utf-8?B?b25hZ3RCcEE2QS9HYnZsUk5KSnFjeWJ1Z1hmVlU3VjJ5L2dpVGdhZ0o2K3lp?=
 =?utf-8?B?OHRTakhmQkpSTE83M1ZHU05CeHlRai9SZEJpTHo4VFVCbHR1RmsyczBCY2di?=
 =?utf-8?B?WWZkOEV3dWo2SlhZOWRmZDQ2VFlPblVQZlJic0ZPVlJHRE1MRExsMWJaYm9C?=
 =?utf-8?B?a0d3TXV5RVhuTlBrQVR4WVZWMmc3L2FNTXFsVVczZjBrbU1NbXJ5MzlYbFlD?=
 =?utf-8?B?amhXVk9INXBOcnp6d09YY0hxdGZFM0hmSHNXTFgxL1VNYkhGTzFKeGVobmFp?=
 =?utf-8?B?KzAvbkpyWHZIUnVxRTJKSk5sMlRicHJSRkp3Zy9aQ21rZFFyeXZveU1Sb1VM?=
 =?utf-8?B?L0k2QXlMdGY3dFg0Vmx0STRrYThLand3MjdFVUpqUDRWdTJzSHZabndoV0Rh?=
 =?utf-8?B?RjYxemtKei9XS2djYVoyRmZoODJIcnVsU1JDb3FOQ3NveVh0OVl1a2EvUm5F?=
 =?utf-8?B?T3VvR243ZHpNQy9NUEFVdzJMTjlYcEpUTFlCbzdnRXZNZi80bzlQS1RaRkE2?=
 =?utf-8?B?U2JKcWlRSmk2SVd1b3c0RnNSc0Y5TVJDa1hVTzJxcUxLZnVodnJQTjhJcEhY?=
 =?utf-8?B?Sllra2MxVFZWWk44Mit5L1JMUGU5NFJhaEFaUG93dmZ1VWFQSTI2YWNSQy9p?=
 =?utf-8?B?UFpqc1lwSWRmK0E4SnBQeTI0NFhUYm41ZVJrTDRJZE1iZWRhT2IxNDNKVVhM?=
 =?utf-8?B?NVVOL1pOd0tOcGVnSUJQTE9ZUUJKQTREOUh2MkJIQjdtcGVDNFRaTk1ETUJk?=
 =?utf-8?B?bEUxRlZvTkFpWTZnbEtRWUNCVDI3NHgvOGltQ3ZZR0FQOHhoQWpxMDkwZVg2?=
 =?utf-8?B?SjZjR3hHZmloTFZ2MnBQWEYwcHRCajlMbXdma2NCVDJZWGNpamNscFFDN241?=
 =?utf-8?B?dUk0cFQrOHp1Q0U3SjgxbEh6dkhudGdOVmlZSkxTT0NuMGEwMEF4VWdCOCsz?=
 =?utf-8?B?cHVQQzlvckN4cU9MMTVVWGF6bStQcjQ5cENMTW9SOGl1V1JEOERlb094NTdq?=
 =?utf-8?B?RmdyanZacFVHRVZFbVc5ZzUwVmx2SDlSSGU4aHdyRmhMUnVoeWFqV3Z2OFB6?=
 =?utf-8?B?L0p4dzVUTUV4S245emJGd1U4Ky80aEppQXJDK204cjJ5amEzUHdoSUZ6bWlD?=
 =?utf-8?B?UThieWlZQW5XRVZ1RDZIMVh4WXgzU0h6ZFpDT3A2R0RjWUJNa3ByaXZMSWJ4?=
 =?utf-8?Q?LD8nKWdwkj+y3CAuBhAFf2tfK?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BE8C4CCE98D34148BAB76A617FE135BC@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28d5458b-ce5f-4a48-9eff-08dcec14f915
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2024 05:56:40.1873
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3mlY2dvW/5ICgHp986gvF6iUMHnSc60DZZ+lCCOCXF52PXSWHhjtv8/riinbzUd88Ii94byKMbzI65reXa3qJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8156
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--11.962800-8.000000
X-TMASE-MatchedRID: 9zTThWtzImtm6oeM5+OJFCaix8JZpk78jLOy13Cgb4+qvcIF1TcLYJgC
	Mlq+sZ+fP4UK2jG+TwGJBh7KINf2n8Ydp1pG4A6/XbTfocfAWb+1X9aaML89nA5SzgJNSArL7Q5
	ySM5WBKmSQYFwl5txOXxB7fx+SHx24VGGT5XQyDvuykw7cfAoIDoSfZud5+GgoN1ZeaPfSbijxY
	yRBa/qJRVHsNBZf9aRAYt5KiTiutkLbigRnpKlKSPzRlrdFGDwkFPkpbBEUKGydRglRQAkbmSwH
	k0LtiIvIyxxPdI0PtflmMoMwjg9Zw==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--11.962800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	4486781F7AA99F8467381F18E70B526F2A88267DD3141B2DEA43317047178CB52000:8

SGksIFNodS1oc2lhbmc6DQoNCk9uIFdlZCwgMjAyNC0xMC0wOSBhdCAxOToxNSArMDgwMCwgU2h1
LWhzaWFuZyBZYW5nIHdyb3RlOg0KPiBBZGQgVUFQSSBmb3IgTWVkaWFUZWsgSVNQIHBsYXRmb3Jt
LCBwcm92aWRpbmcgdXNlci1zcGFjZQ0KPiBpbnRlcmZhY2VzIGZvciB0aGUgbmV3IGNhbXN5cyBk
cml2ZXIuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBTaHUtaHNpYW5nIFlhbmcgPFNodS1oc2lhbmcu
WWFuZ0BtZWRpYXRlay5jb20+DQo+IC0tLQ0KDQpbc25pcF0NCg0KPiArDQo+ICsvKiBNVEsgSVNQ
IGNhbXN5cyBjb250cm9scyAqLw0KPiArI2RlZmluZSBWNEwyX0NJRF9NVEtfQ0FNX1VTRURfRU5H
SU5FX0xJTUlUCShWNEwyX0NJRF9VU0VSX01US19DQU1fQkFTRSArIDEpDQo+ICsjZGVmaW5lIFY0
TDJfQ0lEX01US19DQU1fQklOX0xJTUlUCQkoVjRMMl9DSURfVVNFUl9NVEtfQ0FNX0JBU0UgKyAy
KQ0KPiArI2RlZmluZSBWNEwyX0NJRF9NVEtfQ0FNX0ZSWl9MSU1JVAkJKFY0TDJfQ0lEX1VTRVJf
TVRLX0NBTV9CQVNFICsgMykNCj4gKyNkZWZpbmUgVjRMMl9DSURfTVRLX0NBTV9SRVNPVVJDRV9Q
TEFOX1BPTElDWQkoVjRMMl9DSURfVVNFUl9NVEtfQ0FNX0JBU0UgKyA0KQ0KPiArI2RlZmluZSBW
NEwyX0NJRF9NVEtfQ0FNX1VTRURfRU5HSU5FCQkoVjRMMl9DSURfVVNFUl9NVEtfQ0FNX0JBU0Ug
KyA1KQ0KPiArI2RlZmluZSBWNEwyX0NJRF9NVEtfQ0FNX0JJTgkJCShWNEwyX0NJRF9VU0VSX01U
S19DQU1fQkFTRSArIDYpDQo+ICsjZGVmaW5lIFY0TDJfQ0lEX01US19DQU1fRlJaCQkJKFY0TDJf
Q0lEX1VTRVJfTVRLX0NBTV9CQVNFICsgNykNCj4gKyNkZWZpbmUgVjRMMl9DSURfTVRLX0NBTV9V
U0VEX0VOR0lORV9UUlkJKFY0TDJfQ0lEX1VTRVJfTVRLX0NBTV9CQVNFICsgOCkNCj4gKyNkZWZp
bmUgVjRMMl9DSURfTVRLX0NBTV9CSU5fVFJZCQkoVjRMMl9DSURfVVNFUl9NVEtfQ0FNX0JBU0Ug
KyA5KQ0KPiArI2RlZmluZSBWNEwyX0NJRF9NVEtfQ0FNX0ZSWl9UUlkJCShWNEwyX0NJRF9VU0VS
X01US19DQU1fQkFTRSArIDEwKQ0KPiArI2RlZmluZSBWNEwyX0NJRF9NVEtfQ0FNX1BJWEVMX1JB
VEUJCShWNEwyX0NJRF9VU0VSX01US19DQU1fQkFTRSArIDExKQ0KPiArI2RlZmluZSBWNEwyX0NJ
RF9NVEtfQ0FNX0ZFQVRVUkUJCShWNEwyX0NJRF9VU0VSX01US19DQU1fQkFTRSArIDEyKQ0KPiAr
I2RlZmluZSBWNEwyX0NJRF9NVEtfQ0FNX1NZTkNfSUQJCShWNEwyX0NJRF9VU0VSX01US19DQU1f
QkFTRSArIDEzKQ0KPiArI2RlZmluZSBWNEwyX0NJRF9NVEtfQ0FNX1JBV19QQVRIX1NFTEVDVAko
VjRMMl9DSURfVVNFUl9NVEtfQ0FNX0JBU0UgKyAxNCkNCj4gKyNkZWZpbmUgVjRMMl9DSURfTVRL
X0NBTV9IU0ZfRU4JCQkoVjRMMl9DSURfVVNFUl9NVEtfQ0FNX0JBU0UgKyAxNSkNCj4gKyNkZWZp
bmUgVjRMMl9DSURfTVRLX0NBTV9QREVfSU5GTwkJKFY0TDJfQ0lEX1VTRVJfTVRLX0NBTV9CQVNF
ICsgMTYpDQo+ICsjZGVmaW5lIFY0TDJfQ0lEX01US19DQU1fTVNUUkVBTV9FWFBPU1VSRQkoVjRM
Ml9DSURfVVNFUl9NVEtfQ0FNX0JBU0UgKyAxNykNCj4gKyNkZWZpbmUgVjRMMl9DSURfTVRLX0NB
TV9SQVdfUkVTT1VSQ0VfQ0FMQwkoVjRMMl9DSURfVVNFUl9NVEtfQ0FNX0JBU0UgKyAxOCkNCj4g
KyNkZWZpbmUgVjRMMl9DSURfTVRLX0NBTV9UR19GTEFTSF9DRkcJCShWNEwyX0NJRF9VU0VSX01U
S19DQU1fQkFTRSArIDE5KQ0KPiArI2RlZmluZSBWNEwyX0NJRF9NVEtfQ0FNX1JBV19SRVNPVVJD
RV9VUERBVEUJKFY0TDJfQ0lEX1VTRVJfTVRLX0NBTV9CQVNFICsgMjApDQo+ICsjZGVmaW5lIFY0
TDJfQ0lEX01US19DQU1fQ0FNU1lTX0hXX01PREUJCShWNEwyX0NJRF9VU0VSX01US19DQU1fQkFT
RSArIDIxKQ0KPiArDQoNClBsZWFzZSBnaXZlIGludHJvZHVjdGlvbiBvZiBob3cgdG8gdXNlIHRo
ZXNlIHVzZXIgc3BhY2UgaW50ZXJmYWNlLg0KDQpSZWdhcmRzLA0KQ0sNCg0K

