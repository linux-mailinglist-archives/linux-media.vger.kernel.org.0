Return-Path: <linux-media+bounces-21953-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB41C9D8241
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 10:30:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B17028217E
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 09:30:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D9BA191473;
	Mon, 25 Nov 2024 09:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="OHJJHuwh";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="kSBdXWiW"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736CF186E26;
	Mon, 25 Nov 2024 09:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732527042; cv=fail; b=ViXbJfWdk5Wn8is2aF5z9oCtwliqgzI+QI1SeWwOFpjfrNzwS+RTSkXa2JA5EA75/rkGEcwpZHl4+wr2igXW04A0OntGPogGFAF3r6Uc5bpHEftSCpyMaIN64JznidZr6yb3vavgoAeq/zexLDeHKd5LK8ONzHkHflzI4ZHIp+M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732527042; c=relaxed/simple;
	bh=YwjUMkjtZ0gTceAbZrLBJHBVnXo5uozJrnieSVSbkYo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rEWJZ5wb6YuBlSnkMU7JyFc9DNlTr3mYdkByhrTEQKfzG7s7M3NBtbjILn20HMg+JP5pMJkhb+NYM8UY0FENZSYsK0aZJwQJqoxU3k9caZ8ZoBzRl7rc7/RYDQzuc4P533ts0yxOds6imCDX5TvX/qzuN2HFq0DNRcX95q7VzhU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=OHJJHuwh; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=kSBdXWiW; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: ec8e2f72ab0f11ef99858b75a2457dd9-20241125
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=YwjUMkjtZ0gTceAbZrLBJHBVnXo5uozJrnieSVSbkYo=;
	b=OHJJHuwhh3eNTvxPO1mQJTLZ0ywtnVqt3NwEg4e6UMGYPVNSIVQqpQc+pxwYGydTRSjNh7jezR9dKSsLXXXPuVUxa0gP17C8OJtEn/2y8DEzTZlZGlD0fRskISPcHtDpbPCS/P3S0aCl74cw0jiq3SK9lB1hiMduBqj+YtMsezs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44,REQID:ec02c54f-02bd-4cfb-968b-da1f73f1d7e7,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:464815b,CLOUDID:f9f07523-634f-4016-85ba-2d63e55c9400,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ec8e2f72ab0f11ef99858b75a2457dd9-20241125
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1541820279; Mon, 25 Nov 2024 17:30:35 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 25 Nov 2024 17:30:32 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 25 Nov 2024 17:30:32 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gPzocdVZ/cZoNHL9DAHJNTA9rEoJ7atL0As433riGpC8hxoez/PnDohg8fBA6i418SKD3oI7YwM1U4miv7sDxN1OEnNvJRELkjJJXRsFvWnIDtaUaeJin5TdhC3mT0xCxXQ4YtkIoDiPTPh3bP3X1ZNoQXTJFAxtUNij/HKFaTHemfedw8W2HxYhfFJqAbsJSyJwL66ltwn+CpUL5YP5DJNEPmG/HZnOfGBi9IaMlxpD2rkWt2zNnbHul8+5p+4g0N7wjWhpKT5AFzQ4p96Sm6ZQ0sLk17zwL/gYjwnNLHyd9GIxDPil64QQ+n8L40MFlFXmE02n2fmeCyvO4033IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YwjUMkjtZ0gTceAbZrLBJHBVnXo5uozJrnieSVSbkYo=;
 b=eOfFsepfe0J9N9Sije2e52ZM38ZwOdEpDD82hdyYN7GMIN7iOdtjy9dyu+sXd6s1ktYwr5WX05oU4Hul+LOoiMZ1WVA9Pa6cPDLj6OPiKnNZeWjIrXgwB+o7BCxrHhPr3Qj78+0iQpJdqGaoFWXNfL1R892mfx95C8uY2hAf4sLLPVN2RYFa0ngxuB3tdk3VvyRoK78xAPXGVyAXAzA3STrzbV/UiN1EqhXZk10A4VPy8Qb+qG1tUB+fcCmqNcdkWdcQUQrtFyvfBESJFL6XtyT/bXqEPRFtMYVS36YHnetGjrag2MnS0mV+2gr0+zvhIw11STuhe/XP2wZ5J2W1Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YwjUMkjtZ0gTceAbZrLBJHBVnXo5uozJrnieSVSbkYo=;
 b=kSBdXWiWLOwWDJTCANDqJpVmAVP6YS/606q3sbM2BNPlJ8EaZNsm9aLAI6rr869xKBjqQpCb/8Z4xZ+/XmWvBMU2v94u75R9nYubmKVn70j+CBnKBXUOXy6zV6Y9eEwpcYHN73+5ej6lAzhQuLpBhDZbyhVdx0LtuqxtGmwSlP4=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB8658.apcprd03.prod.outlook.com (2603:1096:405:ae::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.18; Mon, 25 Nov
 2024 09:30:30 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8182.018; Mon, 25 Nov 2024
 09:30:30 +0000
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
Thread-Index: AQHbO/Orh37t76qSsU6WSMvGDnK0HLLHwW2A
Date: Mon, 25 Nov 2024 09:30:30 +0000
Message-ID: <875ddc5620c64e36e10e2bc79fcb44fc25647234.camel@mediatek.com>
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
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB8658:EE_
x-ms-office365-filtering-correlation-id: eb8bb18c-4540-453c-76a9-08dd0d33cdea
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZkpnVUpYd0svUEU3eXlFbFdzVzduM3pBcnhybzVzck9lOFBJaWwzdVRZbXJT?=
 =?utf-8?B?dnRTMkk3bE0vSFV3dDdtNDJDSnZUU01qTlp5M3pHV3BKRFFubmUzVnljcHVn?=
 =?utf-8?B?MWgrVzNscHlhQmU0eFltam80dmVNemdaL2ZtRVVXWTdmWkhlMzIyY2RjMTJ2?=
 =?utf-8?B?bi9zUStqdUlONzBJUEdOalZGS3ZOZ3R0dngwU0ljdldsVkVzVFRvV1NOeWxC?=
 =?utf-8?B?enV4amZqZ01kZHlWemVLWEJsRU5sNHg5elZ0Rlp0VEtUQjl2dlhlUGp5VE9D?=
 =?utf-8?B?c1hXWklqdis4d0dQUUQrVXFDSzgwWTl2THlQcHFhVFJHMWgrakNjVzJWdXp3?=
 =?utf-8?B?V0lqbWQyY3dqSGloUUs4MURlSDhEOXhuSWxsZnJla05yV0dpZ2VEeHdUSkxC?=
 =?utf-8?B?RzRwc1JxK0JzRG1XQkU0YkJIMVoyMjBxbmlZMlFSZ2l2VGQ2UUl2V0ZGRjV6?=
 =?utf-8?B?Q29xdUpYV2tsUE9icGhsUWpQYjFEWm9hMmVRTmMvR3FvZDkzS0h4Y1YrYk1U?=
 =?utf-8?B?MnkrSHFDZG1iVXVLNlJIOU9tZnNmSjQ3VWdUQ1BqRDMzaXlFejhmdFUxbjN0?=
 =?utf-8?B?MHVTU0gyOHA5SytSVU81OHRPR2dSRE1rSzZnbHh3YTFleXE4a09neWZIZURZ?=
 =?utf-8?B?cFJLSENueTVmTWR4QkNRTkpQMjZuRTlsQTR3RGlhWk02UmxnL2ZNaGJLNkJR?=
 =?utf-8?B?cVRjcXVCSUFjVVdNb21hNE1oM3p1NlMrK2RibGpLTzZweERLYWZpb2ZUMFp5?=
 =?utf-8?B?TzVPSDFoTnFHZlorU1UzK3h2U001b0l5ZkhPRTZVdDdPMGJVNkJrdjc2bFZM?=
 =?utf-8?B?UkFpY1Zkd0VWdFp3dWUyNFVDNHZXMVdqVFRoK2pTRDh3L21OWW1VNmZoWHFN?=
 =?utf-8?B?eDBKSER2akZVbVUxSU1kVmNBK3dDTFNTczJFVm1SVUVMb1JyQXRpbDFjTGZY?=
 =?utf-8?B?Ym4vK2hTTXB5TWozano1T3pmeGttd0lSZERqeGF5cTFHTm82YnNSZ3hadVRF?=
 =?utf-8?B?SnRUekxkY0tnNmhDRkluL1NCOVZVZm9GSEtwSUROSU4wN2l6dllMc1J4eXhw?=
 =?utf-8?B?Z3R3blU5V0JlS2dqMEVDUzh2OEQ5T2tQNHRhMmo2VE9QcjRxcFJDNVE1ZDhy?=
 =?utf-8?B?dlBWbzBuVXIwMHEyeDZOWU1EVzFRZ3kzNStxY0hXSHZPYXVvYjlSVzJ6SGh6?=
 =?utf-8?B?UFVRQWMwQkJmTWJOV3JtZDJqUEM3L01LSlVHckVZblhQdFFUWCtQaVJlTlVv?=
 =?utf-8?B?Zjc0WEw5Ymg5SE5VWlpza2xnUmljZ3Bvb3RhMjNwTElqVk9Hek10cUVIQzNU?=
 =?utf-8?B?OXhIdW1oaTc1RjBySVFTRmVUb3M4TWZVL0hydmQ5OWo4a2dhT2pTeW03MEVr?=
 =?utf-8?B?dTZESDdINjJBUVFtVzR2RysyRGkyUDR1a1lHTmZpOURKUys3cDl4bTNKVi9h?=
 =?utf-8?B?ZTFpVlYvc0NLeEFOVDNpeTZ3MFFNWW9wRXpjdDdjTUI4bUNRRVo5QmtLa3dJ?=
 =?utf-8?B?bXp0NTNuZnBNN1JPeWpOMHFQVlpWYVRkWDdUSUtzeFBweUw2M0FUTXJWSjcx?=
 =?utf-8?B?VEZ0UXBVOXpsZEk5QkhBVCtDTzRQN1BieEVwWFdyZDhYSzgzU05kYkJiUHU2?=
 =?utf-8?B?OWdJaEdFUmhHQjdYOHYxbldRaFNvaHgxejFxc1Axb2pMM241d0xRNE1DMHFr?=
 =?utf-8?B?TVFubzU1ZlJHb3p5c0V5MXZsSjFLNlpQRDRPNnRETjZnUDJMMm9raldHVGYw?=
 =?utf-8?B?OGZwRG45REhHN2gybUJYOExuWHJOTmpvUzltT0xWYjhkWlVHcXIvZ21CMWpX?=
 =?utf-8?B?VTVSNm1takhwR2NVdWRNUWdOOVNLZVdpRTVIK2daREQ3c3FhaXNpb2tjOHdw?=
 =?utf-8?B?NU1za2l1blppVGlKL294ZE1ZekpiVlRRM1IxUHE1STQrWlE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZENaNkJzY2IwMm9sWEROTDArbHVnWDBJQXpRaXF1OXFXZFF6K1REcWN4NmRn?=
 =?utf-8?B?TkRqNzRkWHdjN3RZN3lSZUZndlQxdWpQZW1McEt3QmVQRkp0TmY4dkN3d2Jx?=
 =?utf-8?B?Tzd2OVBDeG1oZVljRWRZeW5NWlVHckpXcUdrZDRCdm52Vk1vckpObmkrYjdv?=
 =?utf-8?B?a3NWWmpTbldMVjhTUnliN29QYWlNY0laVkd1NmIzeEdiRUVMQTZmSE1nTWRX?=
 =?utf-8?B?VDJmQXc5c1Q3a3dDbStTZWNhcGVObzZVcm9nSGlaQ3lpWUVKTlo1ZjV2MDJr?=
 =?utf-8?B?dUVYMG1Edm1uUGFMMDUydWM5Z3cwZVFWbEptWG9jdE9UMmNHMVhuUVRNaFRS?=
 =?utf-8?B?cTBZaitxcmpMUzNzVktudkZaeWhLNnVDdEZxZXhWb3V0empaNjBDTFd5S2d4?=
 =?utf-8?B?ZzJoWWtYaExaU2pCNzd1aHNSOGdmemZlY2FSb2dXTlIzMVZDOU1Md3ZHNjNQ?=
 =?utf-8?B?T0xHUHhSVHNlUUlLRTExcklYcTFrRThnSkJTZkNOWldwWTdVTEo1ZnBqTjIv?=
 =?utf-8?B?d3g2TjN3a0xXanJXOXYwWnh1TnJqWk4rbUxtM3F0eGRiUTBwc2t4a05Jbzlu?=
 =?utf-8?B?U2hsQThJOXdDZVhBSFRna1ovbUJPemxDc2xOR3kvOGFnRTcwRnUvN3F6ZTla?=
 =?utf-8?B?ZllabUV0c1NFWVdlMVhCaXRTYzMyN1QzQTFJTW1UQkVqcWYwY2RqeXNVMnYy?=
 =?utf-8?B?a3JBN2htdDNMR3cwWXZjVmI3Y0pDbHJHZHVmN2psOVBWbUprY2MvMUpHR0lo?=
 =?utf-8?B?d0NUKzJCWjVsTjZQWllNVkhlRG5PS3cxQjAxQnMyVDQza3pnclhjNklXZXNQ?=
 =?utf-8?B?SG94a3NGSzBxZDExeDNIVzRLbWVDMURteW5UY2hkMElRV2RNaW9qVFgxTnVK?=
 =?utf-8?B?TEx3WTZCS3BuSVhkeVorM2hwR3ExT3hWUDJteG91SUxJRDRiZzRZU0Ixdjh3?=
 =?utf-8?B?VmR5UnlGWDd2WU5yaCtPWkFwREN3WHVwdnJ4TDFSYkdqaTFTTFFlRTlLODVu?=
 =?utf-8?B?Ylllc0NBTjNUbFRYOC9FdVVQMFJBTllaczVwbEdDYkZYY1RSVUZ3UTV6eVF0?=
 =?utf-8?B?RWQxeGpDaWZjQkQ1M0hFU1lWTHhENTVnR1BKbGc2bE9xbXR2WWFKUFdXMXFF?=
 =?utf-8?B?b2ZobkJhb29WTjhOQzgxZU9wRHcxQkU0aU9xUWVGby9ESE1yZXJna2NrQzRD?=
 =?utf-8?B?MzdaelE4VmJIMTgyVG8weUFuQjV6bGl2dS80RVFnWmVvSlRLbm5IUU9Fa1pF?=
 =?utf-8?B?aXk3NTlpMW4vS05hdjdHSmdDWVJXMVMrZ1dDbHNRcDVKbDYrd1YrWWI5NENP?=
 =?utf-8?B?dDlUREF2UWpCNzR1U3ZXV3JRY0NkUHF4azlsS2Zkd2lnbG1sdHhKNzd0eWx5?=
 =?utf-8?B?Ym1GN2dRZ1JXUnk5VGtqZCt3TWhDNEZ2VG82c01qYW1Tc2s3ZFpFYWQxNW83?=
 =?utf-8?B?TEdIRlhGdTYwZjFJcVFIcFJYZ1U3MDcvREdZeGtXbWI4UjFwbEprdkRiby9H?=
 =?utf-8?B?S3o3UUpWMkV4ZFVKUmxCU2pJRWd6WUNXeUJPMVVvZzBCUHdORHl5cjdTS2cz?=
 =?utf-8?B?aytCcnJZZGtVV2NnU2JKVTQ3ZE5Dc3loeTZQMDBxVU9pZzVEczc4MUtzUHRa?=
 =?utf-8?B?Uzc2RVJud0Rna0RCUTgwZ2w4SVZTOXNCTDVrWFlYM201cys2Yy9YRUU2aXJP?=
 =?utf-8?B?MTZOdStqQ0pTQXFOT01TWFd2YitWc3FYdDl0anp2OUtKb3hRZDRBaHJ0UW1S?=
 =?utf-8?B?TGNaOUh4NmtpaFZZUFNSRU9rNUFQVE5tOGVlRUh0T3dtMnhPTC85TVRiZXJl?=
 =?utf-8?B?dnNRZVpSTjZFRUZHZTFlMURKN0d1VE8xT0NGWHhtT0NKSDJZM2prK2FYN0Zl?=
 =?utf-8?B?a0w4ZnVGdTlnOHR4THlxUzN2bFF3MUhxVVZHazMwN0JNRXNsa1EwaHdrRVh6?=
 =?utf-8?B?aE1nQUJGeG1zS1NGZHJnMFBOajZOSEtkaHFvMHgyQldXaEc3bVJsYit0NUtj?=
 =?utf-8?B?ak9SMlBtV1ZCeDMwODRIM25rZldGeXFyOE1IRVFlM2pFVHBPNmhvTEJJMHVW?=
 =?utf-8?B?QjA4SysrY1pKaUtzc0RoUGJ6YVI5dXVYZHQ5Zk81emY1OXFJd0psUnlKMEJ2?=
 =?utf-8?Q?Wwo5ZHxZVtPZHGcf/K3YY9X2u?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CF5EED1E31FEA24793FBB92F2773091E@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb8bb18c-4540-453c-76a9-08dd0d33cdea
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2024 09:30:30.5038
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LuL2F/I596c39qPTLpazzmJKWMxGNaKGSsEvMxl2Scr7QnDAlwpcvn0kdjrezK01k+DTSYdNS0ddW3Uwu+CQpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8658
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--14.640000-8.000000
X-TMASE-MatchedRID: pBwXUM+nCwsOwH4pD14DsPHkpkyUphL9meN8m2FdGic3xO2R3boBWFbu
	qIY+/skQkABPgKBt/0r/XD0CNJ3fxO4dcT3ZaTocyYHhs0mgDoxyETzgIO4sasaQTVtPXXNMUal
	WGtrKS6Ti8zVgXoAltj2Xsf5MVCB1t7DW3B48kkHdB/CxWTRRu25FeHtsUoHucjMMeqDrOW+ypu
	LhtFASVVccEbLWRttpxAAtV6ZE5+xLhb8xGEnVfg==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--14.640000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	DF1B4EE03CADBCAFFC2751144A41F71A1A52F35C9FB2643E3F61C81A47391E492000:8

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
aWJyZS5jb20+DQo+IC0tLQ0KDQpbc25pcF0NCg0KPiArc3RydWN0IG10a19jYW1fZGV2X2J1ZmZl
ciB7DQo+ICsgICAgICAgc3RydWN0IHZiMl92NGwyX2J1ZmZlciB2NGwyX2J1ZjsNCj4gKyAgICAg
ICBzdHJ1Y3QgbGlzdF9oZWFkIGxpc3Q7DQo+ICsgICAgICAgZG1hX2FkZHJfdCBkYWRkcjsNCj4g
KyAgICAgICB2b2lkICp2YWRkcjsNCg0KdmFkZHIgaXMgdXNlbGVzcywgc28gZHJvcCBpdC4NCg0K
UmVnYXJkcywNCkNLDQoNCj4gK307DQo+ICsNCg0KPiANCg==

