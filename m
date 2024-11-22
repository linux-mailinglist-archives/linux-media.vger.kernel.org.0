Return-Path: <linux-media+bounces-21799-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 452089D5BF1
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 10:29:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 88438B20F28
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 09:29:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C6A41BCA02;
	Fri, 22 Nov 2024 09:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="l/wtUZic";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="qdkDrnli"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11F716F85E;
	Fri, 22 Nov 2024 09:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732267746; cv=fail; b=smbuyU9jNAZz2YxWtvQn/v4+jbZB5WVT0chj3ZpsHgMkg5UDLFLm3W8Z+kFhdGuhaQfBMp1fU8F79viqIV1JdTkVZt2DNERN7vOC9wk2TOUdTCZxSwGv5J/Qq7zSYy5jhJOmBrRwhoRUup9MOSGU+Ve9ku2D3Ka6PS3V8jtjZn4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732267746; c=relaxed/simple;
	bh=sL8Wcv/pGDmUyC9USIzRe25fMAVYkWPLtjzBr5wjMvU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=N2XyN0AuJ54Gw+xqnIdlVE/HnRjXyvsx6x3MfaDUwfmTlB0WmljSrY7KtzX2R2lKXr3CL/Ap8KLiPUPd61k/vGPc2ynHEGu1ZYm/VuE4LgiKWdjvCkzUEhvR17zEe8RG2oFbsTvtRoryVah4DNkAEv8hAplGM1gBPRiwYhswcfM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=l/wtUZic; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=qdkDrnli; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 33a07680a8b411ef99858b75a2457dd9-20241122
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=sL8Wcv/pGDmUyC9USIzRe25fMAVYkWPLtjzBr5wjMvU=;
	b=l/wtUZicliYMBTc/kWTWxCRh5rCbujQzx+Bho5w9slRcMgv6yUEDWEqnKO41EsNXWX/opksehUa0WLj3TjGgtSS0/poRgr0gUNsBBGPQULeH4oRIoOdN8yoYl/yZD50cq9ARpcn5uLTnx19ZrP+jnaD1kXPBvNpcpv1lQTri4Zw=;
X-CID-CACHE: Type:Local,Time:202411221719+08,HitQuantity:2
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44,REQID:a099f5e2-572e-44a5-9b50-828b4be053b6,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:464815b,CLOUDID:3c5d3bb9-596a-4e31-81f2-cae532fa1b81,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 33a07680a8b411ef99858b75a2457dd9-20241122
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1258210428; Fri, 22 Nov 2024 17:28:58 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 22 Nov 2024 17:28:57 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 22 Nov 2024 17:28:57 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ep4g+SmAGQoCn5dtY5SD7UDwID3ut1XtnMIc6L3VxfUg2tCFQvaJ/tAtfQebVxmhAUkDMvp+CO6QdiTPVchCtMpis5za25R2wHxgaKtAgv4gW31cGjwDzIeg9zqZH/CEqK3dN5xCCFy5PrvQFZoHbyrWTym/mteRcWaA/LahAHbRaoOEFnlNpJzQbHHPAy4qpDa0x4V+N/RnSZoIpygySJ0zRm/jTqFTet9i9eEa5C501CNQ3V3GowfQyKVPHz30EqNHCphS0thHkA0rj31PY/kY+L4ILngeGam2+btTlJA/hP+qTdknKfu+qgoslVMHVG/ixBxUZANICcKN83f4uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sL8Wcv/pGDmUyC9USIzRe25fMAVYkWPLtjzBr5wjMvU=;
 b=sy7UcBwUCHPYYNSJvJI96xgtvh2eBmcMGM10u1FfSFqlaZBNHZNiu8dkPvfS5StQc8PzTV+MCJ0zx7PJMeAE5+SuQFP7O1qwGykgPvcL8Quze2yLDRB6vHO5g7Wg11WqWY78avm+ntUr5D3XxLqp7J4MeR58A4pAQsjfzfCrwwMyXROkVzfEBJaATNJdlNVk8pGPKdYHANO1VDayvOT6JCiQXG1iufFDbhaiBZbaNDitnCAISNfNeLv5NxYzLmCDMrwLrUgm1CCaiADPG0xP7iRkrXg42SPbw34G+hnjDkI1I97+5sZQ68I/jlZrSeSdv06Xl6KNLARJL8t3zG5f6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sL8Wcv/pGDmUyC9USIzRe25fMAVYkWPLtjzBr5wjMvU=;
 b=qdkDrnliHVxeJoESHgBpYVq3iKwT2w0lZC0wr2Kof667EfrHqpO22A6ELE0bq709rqUOCl+fgCd/wfezas+4HkDilF+hO2GKa3r0LYfsvCshI2m6s4+EXSwRwevuDxzbSa6lA0bHcUWti23RPtgJSaspx4vwS9RLe07+bTcMlpk=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYSPR03MB7989.apcprd03.prod.outlook.com (2603:1096:400:47f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24; Fri, 22 Nov
 2024 09:28:54 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8158.017; Fri, 22 Nov 2024
 09:28:53 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: Julien Stephan <jstephan@baylibre.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"paul.elder@ideasonboard.com" <paul.elder@ideasonboard.com>,
	"mchehab@kernel.org" <mchehab@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	=?utf-8?B?QW5keSBIc2llaCAo6Kyd5pm655qTKQ==?= <Andy.Hsieh@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "laurent.pinchart@ideasonboard.com"
	<laurent.pinchart@ideasonboard.com>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "fsylvestre@baylibre.com" <fsylvestre@baylibre.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"pnguyen@baylibre.com" <pnguyen@baylibre.com>
Subject: Re: [PATCH v7 4/5] media: platform: mediatek: isp: add mediatek
 ISP3.0 camsv
Thread-Topic: [PATCH v7 4/5] media: platform: mediatek: isp: add mediatek
 ISP3.0 camsv
Thread-Index: AQHbO/Orh37t76qSsU6WSMvGDnK0HLLC75+AgAAW2QCAAAOEgA==
Date: Fri, 22 Nov 2024 09:28:53 +0000
Message-ID: <1136391c4cf4067a4cac77da8490e1e009808b8d.camel@mediatek.com>
References: <20241121-add-mtk-isp-3-0-support-v7-0-b04dc9610619@baylibre.com>
	 <20241121-add-mtk-isp-3-0-support-v7-4-b04dc9610619@baylibre.com>
	 <85ab1984c04b1eddbea71006ab5d95cb4333d838.camel@mediatek.com>
	 <CAEHHSvaEzCGZt3GpKBNDGUphetR7JWfJ7SZfvAU=O-3M4WZY7w@mail.gmail.com>
In-Reply-To: <CAEHHSvaEzCGZt3GpKBNDGUphetR7JWfJ7SZfvAU=O-3M4WZY7w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYSPR03MB7989:EE_
x-ms-office365-filtering-correlation-id: a8a88900-4193-481c-5c03-08dd0ad814ee
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?MjArRHhyZ3FCV0lYUWZuNVltZkNsTkdGQ21BSEdCNjVnenR2VVp2b09kekVu?=
 =?utf-8?B?UjUvenJTN015MDkyeFZWY3ZqQmxwc1p4WlVtZlJHbWU4U1RUTFlDUis3b0Uz?=
 =?utf-8?B?b2lxNm13MkU4T3ZQK05qYkdlcGphMnpoR3IzWWNuc1NBL0pPUDhvQlpBSHJH?=
 =?utf-8?B?aEpSdjZRekl0TVhXNCtCSjNEdUR5cGFvRFUweE10QnZRenlmVTR6ekI1MXNo?=
 =?utf-8?B?UHlHQXZqeGd2MTNkT1ZWcmY5UUQxQmd4ak4zaisvYk5HT2IrZUthWVBFSzZG?=
 =?utf-8?B?SWVjckRYTzBRSlp5S0g0dzFRb0kvaUlWQlZaNHZpNGVGNXNHU3dGTnNXNTc4?=
 =?utf-8?B?TXB0c3hHYzlzblZENGdQMy9jOUV5L05yWGNsOWFTbFNJMlB5Mk11NWo5SSs3?=
 =?utf-8?B?aktEbHhzYUdZSVBwd0pVQlhuUFh4aWQ1MWJWeXNlWVpQcmdjNmUybUpuU0cv?=
 =?utf-8?B?Wlp5bGphNkIxTFdFS3RGdU5IUmM1b0JLMTFLMGhPalUzVXYzSEl0S0JoQ1Uw?=
 =?utf-8?B?UHgwVTR6R2x3S29ocjBIZ3ljeUV6eThxTmpaRkVSaGV4bjBDRGdvRkNBTERk?=
 =?utf-8?B?RWNCOWNhdFFOOTY1bUliaGQwT084WDFlcVRDaGthQVVCWTVseHNDY1g2M3lt?=
 =?utf-8?B?TVAyc2hDdmFmajJpQmdBV2FxVmluMEwwcGUyZG1RbXNteG1seUtROFdGS2FE?=
 =?utf-8?B?ejMzOWdyUmFyeTU0eFljTEJsckp4eTYwMTNFWktFL2RlV0FYWTVYOXZyQ1ZG?=
 =?utf-8?B?US9NYmlyOWJCcHZnNVJhV2dUdk5GRXlZT2J4dzFJbVJQdURqcXJYZWZuME1Q?=
 =?utf-8?B?NCs4RVVkanNoVnQ4L3JkK1o3S1A1MTFLeWZIWDEwSDR2bDFDOC9IOFphWGtq?=
 =?utf-8?B?MFRKQzRQczkwK3R5RXo2N1Bja1RIOEgwU3BYdTU5dXVEU2psSC9WZ0pPbFVQ?=
 =?utf-8?B?SXRLUTd2TjcyMDI5c05EUjl2Sm1aY3hRVVArK0VlbHlQM25haGlnSkdvMmhX?=
 =?utf-8?B?UldGZExaUzBBNjRZWGpvb2JkalZlUytualpaemhJd2dZRmNaYmxjMGQ5QW80?=
 =?utf-8?B?dSs4RWFPajV4NVRPSDZFUDlNRzAwV1Z5Yzl6bUhDbzFtVFlzdG5MRkxFcjQ5?=
 =?utf-8?B?emZVcTZwalVObTZhSmJQc1FDNzQ0MkQyNVpVZDVBeGI1SHJwZ1dlaG9Ocktm?=
 =?utf-8?B?N1NGYWJtZWdQbHBrTml5dHozQnlBbFdybWQ5a21sbHAxZU1HVk51MGc2YmlF?=
 =?utf-8?B?YndieTM2YjIyMEZCM2ZwYy94NFpTZi9vdFg1enZlLy93S1dRTHlndzdWbDdT?=
 =?utf-8?B?eVkvVzFrRjFoOU91eXNGTENVS0F5Y1owb3Jhb0lVbjJkTHlKUzRpWWNPeGlP?=
 =?utf-8?B?R3BMTVR3VndrSGRZZmdhOVpUWUs2VXZqT1pVQldGRnRQYzdHYlovSEsyOW5C?=
 =?utf-8?B?QkZJb0V5cndGMnA2M2JhT3VuYnlNUnRTSS9lRFlEVjk5TE5qVTVEWnhxWXl0?=
 =?utf-8?B?SWpQNWY5N05ab3duOTBsaW1DK1BFdXJvZjVqUkhNdEIvQmUrT0dNWjlsWlF5?=
 =?utf-8?B?cUhINC9udjVpdjhqUVBoQUl3QllDenZaNFlBV1RxRDRsSTJrcWQwdFdiSzh3?=
 =?utf-8?B?RzdBTjRVNGlFYWxXNE83RzgxOTZMeEhxZDg2OUpTQWUyQmM4dkhaTG1yQmJv?=
 =?utf-8?B?b0VDN1BOcFJ0ay94WVpENFNsMytmaEtEVi9sVTB3NURFVU9rN2JOUEhhNzVj?=
 =?utf-8?B?UnhOdktNTFFLUzZIVGRLOHl1M3I0NWROemF0bFFHNFl6dUFSRm16UTQ5d1ll?=
 =?utf-8?Q?iIZSzGaY6NyHAlwonEoOJ3IeN3oKT01Ud3MGk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M2RtaC95dzBDdzVqb1NCLzZ5VnVxNG9XeGtIZG1KUHZyRnV1WW5CTmMycEs4?=
 =?utf-8?B?OFNBbUVFYm0yejVtUW42SFlUMDNZekdtRnA0TkhIVnpFU3ZQMzYzVUF3bE5l?=
 =?utf-8?B?aDQvNkFSOUlUa2Z3R1N0WW9iOXpxN0d3SVBNRDRxa2RNT2JOb3ZOU0NCeEsy?=
 =?utf-8?B?ZDl2UnpHcUpsWmlZT21PTW5SaURXRkMwVXNmbVZkZFNQOFdUUnFDcHlUVis3?=
 =?utf-8?B?N1Z1RWcwWWdZNTlaQmhqZDJpeHVvY2dKNGJ6VkFqNmltYkhjQkU5cUZhMDlV?=
 =?utf-8?B?d2pPTkpsd0NlTmNyZ0ltSndBaWVoaTNCNUdJVVd5bnZiazU3OU5KZ1BuUDZQ?=
 =?utf-8?B?N1ZEUjdqNktEZjhPd1FYRzdVM0dmWlZlaFdvRThzcWtrRmJITGVBNlF1S25K?=
 =?utf-8?B?dDZZVU9YWWhiY253aEltSE10UnM2NE1iaXVjUlJ0M2szcG1rUmdoUGNTdE16?=
 =?utf-8?B?NXNkejRvK0RhZ01zVjRod05qL0c4b1hVR1JZRVJuZEV5MGJ0ellQOHBqZUF1?=
 =?utf-8?B?MjNmYVM3M3pGTkpwMVJCb2xRVTlscUNYcVlZNm8rMXNBTEJheDdBNlRuQVNM?=
 =?utf-8?B?c29TZWxsVVFYVk8zSEVUSjh6eERnMXFtalV2R3I1RFl0TFVocjh2QkdxNnJZ?=
 =?utf-8?B?N004UDNmeVRIaVRmSTJ3RmdjeWZLNmdKQTR5OFlJdjMzYjhhenZrRmwwQlF5?=
 =?utf-8?B?MFhrNGJsMk56Zmt4K2poYzdNL3NqVkNRcm1BcHk4cHZYVllwUHRqWVJxQTgz?=
 =?utf-8?B?VGhnS3lXNFM3T1p6cW1uZWtzWjdleDZoQzBiQUhScW5xOTFtT3dXRnhsZjZO?=
 =?utf-8?B?c0hPdENuMEh2VFJqUzNBcGdFUENzaG9vQ2l1NFpIZmpWak5RcldGRlljbkRT?=
 =?utf-8?B?Qzl1WEVKWkFKSEd5bkZXQ3FTODA1U205dDBpZTRhZnZ2cE1iVkNCalIxVEJT?=
 =?utf-8?B?WVIzc1FaMkJUSThLNy9QdHFPZFJIYXBWU2FkTmJxRXMyclM5QVVUbzJBVTlP?=
 =?utf-8?B?RUdQV1J2WlpsbGswQVFxMHNMVzBwQ2JuVy9zQ25BS2YxcENTY1U4TmZYSUhl?=
 =?utf-8?B?RG9iZjNlU1ViMy9KK3lxQmEwSmFvNlhBNGs4T3pkTmNVeXNjSkg2VFR3bDlP?=
 =?utf-8?B?ZkZselJJTE5nMFFzczJvQ3ZsY243YWJ6T2NMOGFzRzdKelVDVlFubzEwMmxN?=
 =?utf-8?B?bC94ZWxCZ0lRNy8ySUN4eFpLYlhMa1lFT0preUprQjhieHAyVEJ1cktQNVla?=
 =?utf-8?B?ZDdZNFFMcy93ZFMyRm5Bc0VXc1B5R3paZ3FDMGEyWU5hWk1BbTExa0p2SVhS?=
 =?utf-8?B?b1hPdlZOS2ZOaUhrb0xjOGxDbnFWN052T1VybFNnWUY0YXphM1NXQ0FKZytR?=
 =?utf-8?B?eHZCK3BNQ3hid2dVSE03OWJraFBYNVlsclZpTitCdnVyTUZZTVczWHlqR1h6?=
 =?utf-8?B?eVdIODhQak04R2x2bGpYUnkxczd6Q0xYekRER2Q4YzRWZS92YTAwVDRuYkxx?=
 =?utf-8?B?djNlWmFqYy9BanQ2aEQ0T25kM0lYV0I1TDBYZTNIVUlBWGxnaEVoVGVuVGZI?=
 =?utf-8?B?elprOVEvbm94cXVyZ3NnVFVuZzVZTjB5V2kweG1qUndvakxOR3FqdHZEcHJ3?=
 =?utf-8?B?dXg2OVFwYUp5MlhyU3hqQnc4QjhsbGRpSW9MQ04xUkVLQVlJc3pFRkhmZ0Zz?=
 =?utf-8?B?bDlHclZiU1JObFo4TG5jTmZ1dWo0VjQzbDlMTmhteStCWXVJa2pGcDcxVXcx?=
 =?utf-8?B?RWxYcVhQOVQ3SUFGdGtteENJNXJ3by8rNy9jNm9panhLa3c5Vlg4bkd2dXhR?=
 =?utf-8?B?UDFHd1FjVkpiSFY2bmR3aC9SSUREYm11RWVWYU1FZmNFNldTWjFZOU9xMGdN?=
 =?utf-8?B?RXhLR0QrUnF0cmUxSmQ3N3IrRk4vR0M4TFNYK0hmNEw3bDVJUTZ0VFBnYU4x?=
 =?utf-8?B?eFU0Z0xGVlZOUXRiWkkvL1QyLy9zMy85TkhwTHZiUDZhcVlOZjZzUzF3MnhR?=
 =?utf-8?B?Zm16bVVoSW5vRTRxRE43Sm9kc1ZMM2tPaDNVNUFvL1hkdkRaRUhlQjA2T0N6?=
 =?utf-8?B?YVBUVFErYW16VCthUVFNMUZHN3BFMlJEaHZxZWNCYmMwWE1KekNrckRmMXQx?=
 =?utf-8?B?a0c2ZHlYT21xdWpoUzNJTDhyTXU0eVZpTit4TUZMbVBwdXQzZ2RhcFZnQTV2?=
 =?utf-8?B?bnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A5F4241A867C9946AC73EB19BF93598E@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8a88900-4193-481c-5c03-08dd0ad814ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2024 09:28:53.6516
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M2ofOj8Toh/ArSgqyXkQyIa4e+87VcN4ZB1I7tI8DIL37DK9Kfyv3jO1HenoAocQ0cGAcwBJfSLjX5NmC2CSmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7989
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--31.528200-8.000000
X-TMASE-MatchedRID: WMT2WRIkHPMOwH4pD14DsPHkpkyUphL9meN8m2FdGic3xO2R3boBWFbu
	qIY+/skQkABPgKBt/0rWz+cNVAnKHMELLYkjA+xdbc297PAGtWYhdi6zxllm1t3eUkv0LDwMQet
	Uhp4fOly6VMXtSc8qd7WrjxGHjCv17c0is1Jg1FcXrP0cYcrA2/ioIsi7Sa0gYdn5x3tXIpfifO
	TDuK1oyBZDMUjKccymQ210vAP1wtihzaM0+ttmeFt3XMydUaMXMVx/3ZYby79tw+n+iKWyyCVy+
	Kp8zxMh/m7C1i3XHsjdzFbj/v8t3WXx2qd4fL0ZZvOUKDbiir6hQhstwJ9G4P3y7vT+lH0aWnki
	69dvZkvYqloUQ9Odyz/Bz6znkOB5xUJyZrEVWlGyOzUI8B1UpshpcNaVl4hsLDwZoJ12UtdKeG8
	DXlTPDqJCnAQiBPSyd5P932Qjc2RccQ8eam5EfdIFVVzYGjNKcmfM3DjaQLHEQdG7H66TyOk/y0
	w7JiZo
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--31.528200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	7A90B80636EFA288555CEB0C30581CA192C49F230AE75738593DA0DA5ED6788B2000:8

SGksIEp1bGllbjoNCg0KT24gRnJpLCAyMDI0LTExLTIyIGF0IDEwOjE2ICswMTAwLCBKdWxpZW4g
U3RlcGhhbiB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxp
bmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRl
ciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBMZSB2ZW4uIDIyIG5vdi4gMjAyNCDDoCAwODo1
NCwgQ0sgSHUgKOiDoeS/iuWFiSkgPGNrLmh1QG1lZGlhdGVrLmNvbT4gYSDDqWNyaXQgOg0KPiA+
IA0KPiA+IEhpLCBKdWxpZW46DQo+ID4gDQo+ID4gT24gVGh1LCAyMDI0LTExLTIxIGF0IDA5OjUz
ICswMTAwLCBKdWxpZW4gU3RlcGhhbiB3cm90ZToNCj4gPiA+IEV4dGVybmFsIGVtYWlsIDogUGxl
YXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsIHlvdSBoYXZl
IHZlcmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+ID4gPiANCj4gPiA+IA0KPiA+
ID4gRnJvbTogUGhpLWJhbmcgTmd1eWVuIDxwbmd1eWVuQGJheWxpYnJlLmNvbT4NCj4gPiA+IA0K
PiA+ID4gVGhpcyBkcml2ZXIgcHJvdmlkZXMgYSBwYXRoIHRvIGJ5cGFzcyB0aGUgU29DIElTUCBz
byB0aGF0IGltYWdlIGRhdGENCj4gPiA+IGNvbWluZyBmcm9tIHRoZSBTRU5JTkYgY2FuIGdvIGRp
cmVjdGx5IGludG8gbWVtb3J5IHdpdGhvdXQgYW55IGltYWdlDQo+ID4gPiBwcm9jZXNzaW5nLiBU
aGlzIGFsbG93cyB0aGUgdXNlIG9mIGFuIGV4dGVybmFsIElTUC4NCj4gPiA+IA0KPiA+ID4gU2ln
bmVkLW9mZi1ieTogUGhpLWJhbmcgTmd1eWVuIDxwbmd1eWVuQGJheWxpYnJlLmNvbT4NCj4gPiA+
IFNpZ25lZC1vZmYtYnk6IEZsb3JpYW4gU3lsdmVzdHJlIDxmc3lsdmVzdHJlQGJheWxpYnJlLmNv
bT4NCj4gPiA+IFtQYXVsIEVsZGVyIGZpeCBpcnEgbG9ja2luZ10NCj4gPiA+IFNpZ25lZC1vZmYt
Ynk6IFBhdWwgRWxkZXIgPHBhdWwuZWxkZXJAaWRlYXNvbmJvYXJkLmNvbT4NCj4gPiA+IENvLWRl
dmVsb3BlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9h
cmQuY29tPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5w
aW5jaGFydEBpZGVhc29uYm9hcmQuY29tPg0KPiA+ID4gQ28tZGV2ZWxvcGVkLWJ5OiBKdWxpZW4g
U3RlcGhhbiA8anN0ZXBoYW5AYmF5bGlicmUuY29tPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogSnVs
aWVuIFN0ZXBoYW4gPGpzdGVwaGFuQGJheWxpYnJlLmNvbT4NCj4gPiA+IC0tLQ0KPiA+IA0KPiA+
IFtzbmlwXQ0KPiA+IA0KPiA+ID4gK3N0YXRpYyB2b2lkIG10a19jYW1fY21vc192Zl9lbmFibGUo
c3RydWN0IG10a19jYW1fZGV2ICpjYW1fZGV2LA0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBib29sIGVuYWJsZSwgYm9vbCBwYWtfZW4pDQo+ID4gPiArew0KPiA+ID4g
KyAgICAgICBpZiAoZW5hYmxlKQ0KPiA+ID4gKyAgICAgICAgICAgICAgIGNhbV9kZXYtPmh3X2Z1
bmN0aW9ucy0+bXRrX2NhbV9jbW9zX3ZmX2h3X2VuYWJsZShjYW1fZGV2KTsNCj4gPiANCj4gPiBE
aXJlY3RseSBjYWxsIG10a19jYW1zdjMwX2Ntb3NfdmZfaHdfZW5hYmxlKCkuDQo+ID4gVGhpcyBo
YXMgZGlzY3Vzc2VkIGluIHByZXZpb3VzIHZlcnNpb24gWzFdLg0KPiA+IA0KPiA+IFsxXSBodHRw
czovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9q
ZWN0L2xpbnV4LW1lZGlhdGVrL3BhdGNoLzIwMjQwNzI5LWFkZC1tdGstaXNwLTMtMC1zdXBwb3J0
LXY2LTQtYzM3NGM5ZTBjNjcyQGJheWxpYnJlLmNvbS8qMjU5NjYzMjdfXztJdyEhQ1RSTktBOXdN
ZzBBUmJ3IWx5ZGdMeWR0QXV6ci1CQzVxQXJ6M0FFek9NMGlTU3I2VFhpZndhYjFrUHZXVkpMeTBr
N3JVaWFzUl9nb01BRl82WFltUElwRXJHRjZDZExrUFEkDQo+ID4gDQo+IA0KPiBIaSBDSywNCj4g
DQo+IEkgZm9yZ290IGFib3V0IHRoYXQgZGlzY3Vzc2lvbiBzb3JyeSA6Lw0KPiBJIGd1ZXNzIHlv
dSB3YW50IG1lIHRvIGNvbXBsZXRlbHkgcmVtb3ZlIHRoZSAgbXRrX2NhbV9od19mdW5jdGlvbnMg
c3RydWN0Pw0KPiBJbiB0aGF0IGNhc2UsIHdoYXQgZG8geW91IHByZWZlcjoNCj4gLSBrZWVwIG10
a19jYW1zdjMwX2h3LmMgYW5kIHB1dCBzaWduYXR1cmVzIGluIG10a2NhbXN2MzBfaHcuaCBhbmQN
Cj4gaW5jbHVkZSBtdGtfY2Ftc3YzMF9ody5oIGluIG10a19jYW1zdl92aWRlby5jDQo+IC0gcmVu
YW1lIG10a19jYW1zdjMwX2h3LmMgdG8gbXRrX2NhbXN2X2h3LmMgKGFuZCBhbGwgZnVuY3Rpb25z
KSBhbmQNCj4gcHV0IHNpZ25hdHVyZXMgaW4gbXRrX2NhbXN2X2h3LmgNCg0KSSBwcmVmZXIgdGhl
IHNlY29uZCBvbmUuDQoNClJlZ2FyZHMsDQpDSw0KDQo+IA0KPiBDaGVlcnMNCj4gSnVsaWVuDQo+
IA0KPiA+IFJlZ2FyZHMsDQo+ID4gQ0sNCj4gPiANCj4gPiA+ICsgICAgICAgZWxzZQ0KPiA+ID4g
KyAgICAgICAgICAgICAgIGNhbV9kZXYtPmh3X2Z1bmN0aW9ucy0+bXRrX2NhbV9jbW9zX3ZmX2h3
X2Rpc2FibGUoY2FtX2Rldik7DQo+ID4gPiArfQ0KPiA+ID4gKw0KPiA+ID4gDQo+ID4gDQo+ID4g
KioqKioqKioqKioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90aWNlICoqKioqKioqKioq
KioqKioqKioqDQo+ID4gVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBt
ZXNzYWdlIChpbmNsdWRpbmcgYW55DQo+ID4gYXR0YWNobWVudHMpIG1heSBiZSBjb25maWRlbnRp
YWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhlcndpc2UNCj4gPiBleGVtcHQgZnJv
bSBkaXNjbG9zdXJlIHVuZGVyIGFwcGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUN
Cj4gPiBjb252ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVz
ZSwgZGlzc2VtaW5hdGlvbiwNCj4gPiBkaXN0cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcg
b3IgY29weWluZyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGl0cw0KPiA+IGF0dGFjaG1lbnRz
KSBieSB1bmludGVuZGVkIHJlY2lwaWVudChzKSBpcyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBt
YXkNCj4gPiBiZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50
IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxpZXZlDQo+ID4gdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0
aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyDQo+ID4gaW1tZWRp
YXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQgYWxsIGNv
cGllcyBvZg0KPiA+IHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBmcm9t
IHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQo+ID4gZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhp
cyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0K

