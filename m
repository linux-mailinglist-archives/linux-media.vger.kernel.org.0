Return-Path: <linux-media+bounces-38294-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 73517B0FEF7
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 04:56:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C7DC1C86995
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 02:56:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 698691D5ABA;
	Thu, 24 Jul 2025 02:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="vF6KASt1";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="CHBuqMkt"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7537922097;
	Thu, 24 Jul 2025 02:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753325753; cv=fail; b=eB9TXWLU9DCQSC2u2oRybhQDuquNof1AZ1vaJAAEHV1YF6eVEBZl5lQCEYP1vZIxFRGI5ho8pKMjV/P3rEI4h890x3U7NFz4cneneUB8qBgHw9prn48FrtRBijprogPhWHsHUShguKK7lGoqjOA37P/D01bD0B65MU68HLs9vOc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753325753; c=relaxed/simple;
	bh=rorya6tO3ayRB48SNI4kFX509QGyfyNlBKfVce4eKXs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rLF89qZ8pgCfDGOe3pzil8avEh8OD+97MMHDSowv3/CG2qb9PuVQAhVennoICcrMSJzOyk8pPMPKfHpDTE4FbIwoMSmpBJ1uKSglkC413bb6i1CWbSPR/RIPtvNAbDyxXo7src5eI2Cicbex6mRJT+e5sgdTKnnxR7qrn+mJTB0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=vF6KASt1; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=CHBuqMkt; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: b06f4890683911f08b7dc59d57013e23-20250724
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=rorya6tO3ayRB48SNI4kFX509QGyfyNlBKfVce4eKXs=;
	b=vF6KASt1rHvYY5ZybFHhSG9jkijqsoC0/HBcyY+MomK094jTMIdLnEHFusuKKV6R7S/M/FoiASZyZg2WWAQkcmeCzcjRL2Xo0UDCuMScFTZKag3He44D/jb/baF+e7d14Yg8uNFr1YqsKHvpPniG5CeM8WYic+Nb0Oiv8bJPSGA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:08a2e1ce-f51a-40ea-885c-c4cc212e6ce9,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:b9bb359a-32fc-44a3-90ac-aa371853f23f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b06f4890683911f08b7dc59d57013e23-20250724
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2123755153; Thu, 24 Jul 2025 10:55:43 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 24 Jul 2025 10:55:40 +0800
Received: from TYDPR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 24 Jul 2025 10:55:41 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W5q8OYZv1y7DDAV/dg30Qo2pRVNTSCxZ0Nv5SroGjHI9jD9ifjF5stBHOo/lDt5zFBXK0BDn+IyFwt/LORAJLeB+LI0aoWLLcp0BI0Ji4cYDHawjO/v/6Qbgy4JiF/QuGqbG6YB5FY9KjLYVobtVaLup+gGpOnoComWbqH0u2tFwvQuIVPcojJm85lVjGQ32L45C9ABxLfAsmNLPrxGx1PMzLUq8E40r/1G60I7akPulAXZLVAuQHf+e/B1HFy0WvPrSa3bhd6GmO4o8yRFqHZKCMLEmqC0g/mFE1MtEugj+Ga5pwZIcXzeKpBfS+dkFu8A5B9JWKm8RRXFRFrVIqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rorya6tO3ayRB48SNI4kFX509QGyfyNlBKfVce4eKXs=;
 b=kVGp48hqbGSc54iKK6CifXV+ZylRiCaudihP3kkzKLH9DW5h1Q/TCjIleB/ejIZj3V+rwRPYiYPtW7z0aO8lTuG9e2rZnSWEkwtAV5xZyhYYJmILINiTihHTYgz8RdHxKPqKdu03in1BulkMamuaLUoknEw8hFH4NSYciv0LMw3ltAsOlf9KocXH95kixMRl4vrvqt3u4mncrQcalOXjo7jWor35Jz0v1ntpXIX+WZPJ9hiG/xUYjc8EkBDwNcY8OtS1oaHIoY1v1/pcTf/Hj5YgvsZ45q3e3FN7+qjNLA0RBHFKIZnMn9E1Qjqj/uEyctm91H2uhgeFgQOUrKzk3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rorya6tO3ayRB48SNI4kFX509QGyfyNlBKfVce4eKXs=;
 b=CHBuqMktSAdi076S1uhPe4Q2DDifIjFYrSd8iZTPoqf296sLYEUeQ5TrameN5v0jInO16DQFtwv3yKb1djOjB5du58tpjf9UOOqKe8AFkLX2l2YsQeNpTBw5LiN3egggzF/2Tfyr+TuBIqIhPSLPOchFZ+cImttfnWeeO1WTa7Q=
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com (2603:1096:301:b9::5)
 by TYZPR03MB6820.apcprd03.prod.outlook.com (2603:1096:400:200::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Thu, 24 Jul
 2025 02:55:38 +0000
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::a013:f3b3:a461:8ece]) by PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::a013:f3b3:a461:8ece%4]) with mapi id 15.20.8964.021; Thu, 24 Jul 2025
 02:55:38 +0000
From: =?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>
To: "krzk@kernel.org" <krzk@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?R2VvcmdlIFN1biAo5a2Z5p6XKQ==?= <George.Sun@mediatek.com>,
	=?utf-8?B?VGlmZmFueSBMaW4gKOael+aFp+ePiik=?= <tiffany.lin@mediatek.com>,
	"andrzejtp2010@gmail.com" <andrzejtp2010@gmail.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"nhebert@chromium.org" <nhebert@chromium.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, "nicolas.dufresne@collabora.com"
	<nicolas.dufresne@collabora.com>, =?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?=
	<Kyrie.Wu@mediatek.com>, =?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?=
	<Yunfei.Dong@mediatek.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	=?utf-8?B?SXJ1aSBXYW5nICjnjovnkZ4p?= <Irui.Wang@mediatek.com>,
	"robh@kernel.org" <robh@kernel.org>, "sebastian.fricke@collabora.com"
	<sebastian.fricke@collabora.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "christophe.jaillet@wanadoo.fr"
	<christophe.jaillet@wanadoo.fr>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"arnd@arndb.de" <arnd@arndb.de>,
	=?utf-8?B?QW5kcmV3LUNUIENoZW4gKOmZs+aZuui/qik=?=
	<Andrew-CT.Chen@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "neil.armstrong@linaro.org"
	<neil.armstrong@linaro.org>
Subject: Re: [PATCH v1 7/8] dt-bindings: media: Add MT8189
 mediatek,vcodec-encoder
Thread-Topic: [PATCH v1 7/8] dt-bindings: media: Add MT8189
 mediatek,vcodec-encoder
Thread-Index: AQHb+i4mtZyJaKiOLECv2gcLkk8xwbQ9v6cAgAAN1QCAADA/gIACmsWA
Date: Thu, 24 Jul 2025 02:55:38 +0000
Message-ID: <ca71855d3a78a213b837a3d2a48ddd82f856639f.camel@mediatek.com>
References: <20250721105520.5625-1-kyrie.wu@mediatek.com>
	 <20250721105520.5625-8-kyrie.wu@mediatek.com>
	 <20250722-lovely-mustard-scorpion-e07e92@kuoka>
	 <1d51ab1398ea0eec7bcaeaa31f52e4c39d11bd7b.camel@mediatek.com>
	 <31e72f14-bb61-411a-86c8-19c7212d2d31@kernel.org>
In-Reply-To: <31e72f14-bb61-411a-86c8-19c7212d2d31@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR03MB6186:EE_|TYZPR03MB6820:EE_
x-ms-office365-filtering-correlation-id: 483688b3-f870-4546-2697-08ddca5d91d8
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?UG5Xek56ZzRwOGVYZ3hQQlFoeGxRZFMxTVZJanAwcWFkWXVEQjhSRExnLy9I?=
 =?utf-8?B?WTA0WUNUMHBMTzhXRDQzczB5KzJpdnMwVUtaaktyQ1JkR1RqS1c0U0pSQmYy?=
 =?utf-8?B?SklYY09lVWlhYTd2TFMxZE1YK0J1S2F1Y2MwbmVya2tGY0Q0U3hxdTE4QlZ6?=
 =?utf-8?B?ZU9nWGdOZmE1bVRjSldMZUtPOHhpYjJNbzRhQ3lhMUJTTmJpU3d3L2kyQm5F?=
 =?utf-8?B?NG5BZStxdlhVZDlSOXZxaDVwejJzZDZDSmo4R2VPaFppTldncCtBeC9RK2x2?=
 =?utf-8?B?UkFxT2xlS2JTQWRxdzYrTHhqcnhXYjI3ZDU2b2Z0K012K3BlUmlqc2VCNnBW?=
 =?utf-8?B?VU9NYjU2WW53YkxXVDIxUXN5Sy9FemkxOUJDUzF6SWQ2ZTVYWXVNM1ROSHR2?=
 =?utf-8?B?S0VKTHVyTjJVdjJGNVBIQ1hHSndHVkx1ZWN1TUZxV1p4L1A4NHRDVnJaZVlP?=
 =?utf-8?B?dm1tbHRpc2MvbWZld3NEZU43NFJpR3FVMWN4YjlUbGVkMENPMnJDeEh1V0FY?=
 =?utf-8?B?WTk5czJPRnYwYk1sd05aNkY2Y3hJdzRtelZLRzMweUNZbEV2T010TXBtaDV2?=
 =?utf-8?B?aG5KZnBoZ3ZmemFiQ2ZGL1J2c2piQU9MWEQrY28rRUt4TmFwbkl1ZVpKR1NF?=
 =?utf-8?B?amxyYzVmVFdjOVV2TFVHZWZwQlUrZzdtUzIybnh2M3p6TzRpTEdneUphV0hz?=
 =?utf-8?B?dDVOcGo5MHd2akpCdjJmU3V1UkdZS256Vk9pZTltbkxRdFFETTdWMmsrQVVp?=
 =?utf-8?B?U2pCNnFpaThhcWRlUDlWSzl5MTlCZit5WG9WdlpTYWRaTWJvN0JGVFFLUFpu?=
 =?utf-8?B?dFVjSWhxS2dGd0t5ZHEzYkVxK00rSWEyTjJkVUhqcVduSExnclpSM1hhSmN2?=
 =?utf-8?B?T3pxWWdDRXJRMlRDT2NMdjZETVJtcVh4Y0tWQ0IrdWlpUXhnc2pQYjhhbDZh?=
 =?utf-8?B?endKTWtSNi81QkhIbmFLWWw0YzhrN0lic2U2dkt0OGc3TU0vdWpoZG55cGRq?=
 =?utf-8?B?Tytzam5kTEIzbk9sYVBzWm5FYUFvSXphUFVpRTB1empHdS84eVpLV1pENWZs?=
 =?utf-8?B?RSs0SFNOdnZwRmdRYU1HV2p4QndLZGdtQTB6UmJra1RsTHZJZUV3UW4xdEwx?=
 =?utf-8?B?cVhGTG42Q2ZkMDlNNDhwVU5DL0ErQnV3My95QlNYcU1SendJRlo4YWo4TStI?=
 =?utf-8?B?aFp1bkRoT0ZhcjBPYzJ6OXEwQXVKc1ZWdGMveW5RWCs1R25EM3BxcnVZcGxC?=
 =?utf-8?B?dXlMWUdwTk1Dc0taL1JjbDcwRCs1TnFpUXhzWVc2TkJ6V3JidTVCVWN6NC83?=
 =?utf-8?B?YXZZeU5kYnZmdHBZRWg4dkJFVTlHVWE0eFdrTmJwSjR4dWRTR0x6M01FVGJF?=
 =?utf-8?B?ck9jSmdOb09rNjkreUwyMnFYZDkrTHlEd0xsUEhVZ3VqbzdHY0hrd0laV0tN?=
 =?utf-8?B?VlkraTBUdlJCT0t3cmN2SmFJd2ZteDRpQlg3Nm5WWm40WlNDaE9rZDQ4UlJj?=
 =?utf-8?B?NDRYR2pKc2twUzV0cVlGdjBtblRXcEZiaGZGRU85U2Nab3AwUmJjTkZSUjVT?=
 =?utf-8?B?bythS2EwNTNnS3orODdycjJCWVZmNkJFSTNlRU1UZnA2L3lNd0NJZkp6RkVl?=
 =?utf-8?B?czNyNFh1NlVCTGkvbDh1dUxIamhjWm1mUzlvUEpRbUVOdUVKVG9tUG9WdUJT?=
 =?utf-8?B?bXgyQ2lRUlNsMVY4NHQ5STNEd2FsSTZ6MWYxRWN2d1hMTk14ZXBsYTNvWmI3?=
 =?utf-8?B?K05aZ3UrVHhmUk1Vd0NlWkJybk1JclcvWjdodzZRRDZkamQrL2o2YUtkY2RZ?=
 =?utf-8?B?NU5DYkluOCtrVDZ3ZTE5Y3o0NHVyckVKQkhYZGhzUVFPakFnb1AyYkU2VERx?=
 =?utf-8?B?bUYzclNwY1pKTEpyVTFYMkZRb2kzaFA5VFRHYkJ4TWxmWk1oTWVkM3lwZ0Jj?=
 =?utf-8?B?aUtjUTZER1BhdWdjdW5FdFZVNmwzV0l0RkQ2eGFZUXhjSW9nSEo0TllXTUdZ?=
 =?utf-8?B?ZStPbnRsZGl3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB6186.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VlhWWmp0Vys3TVRtekZJQTl0YnJQdm15NzFPSFV1c0l6SnQxTU5iaXRqK2dE?=
 =?utf-8?B?SWhGN09YTW5GTERVM0JTdmI1bVJLUkowdUhMMjlnL3RrQmd5UHVYYkJOSDRi?=
 =?utf-8?B?UnpONjRaT3BUTnZQUkl4TU9qbVdUQmJFcHI4RFlYVTZ4Z0liQVhFejVDWGxT?=
 =?utf-8?B?anplb3ZoYkxlSWVTS1R3YXluVUJ5QjNzSytRaGZxeU1kVzdLZVRZcEF5cjJn?=
 =?utf-8?B?T2ljenRZRGJTRnQrWjlkOUFZTC9qekdidnJSZlRzdGpDNFJOYmo5SW95ZkZJ?=
 =?utf-8?B?UEJTZ01jRnhud1J3aDdlT0ZuNEV0SE5JR056NFBnNEVLeDJMZktURlgyMld2?=
 =?utf-8?B?WFVMTTZ3anc0c1VPL2s0cTM1ZzNaeVo0UmFsZTNOTzFXc3BUTW1jQTdERDdi?=
 =?utf-8?B?OFZPbGVMS05EUXN4ZG00TktyTTZPaFJVbmthMU05c3hZOThFT2tHRXlOb0Qr?=
 =?utf-8?B?aTRKRTVkZlBLb1F3TG5VRk02M1MrY3lCeEE2KzdKcUQ4c1pEaC92UjNxbGVa?=
 =?utf-8?B?SS9tYWdmMlNNbVRpRUNaR3FEVWNUbHFYNFh3eUVOdG5uSmVNRzBycEJhTjdP?=
 =?utf-8?B?OGhUcXc4RzNTbjhQZVBBZ2NkSGs0VFlFTnM3RHBpQ0V3SVFrdXZOK0xRK2ZR?=
 =?utf-8?B?Sm92S0p6MVlRVEIxc2J1VjRTWU42SUd4MXRkSjJSeHowNDBseGx5dksra3By?=
 =?utf-8?B?SEt2OTBXR051di9mcldtZmdEbHdpYzRESmlWQXNDSm9oK3dRbVNxWDdmRlh6?=
 =?utf-8?B?bXg2Q0tMR3hSS0trc0dXV0xRQlRwejdBbW5mdTJlb3hqMHA1WUhEdVhHOVlB?=
 =?utf-8?B?VTRHQVZIdVlrdVE3UzR6TFVkU3Y4VzlEU1FSV3ZzTWhkZCtZdVhWelVLVUxq?=
 =?utf-8?B?WGFsY1l6UGJpRFUyZTMwOFBJbDU0bFBaaDBLZFdOdktDM1pDN2NlSUNGdnAr?=
 =?utf-8?B?NkJ1ZUZjUU1heHUrWDJyMXJVY212MGdWWmhqQ3VXNWQ1Vm5PZnJ0NUJOZ1Yx?=
 =?utf-8?B?eHFpNFY2cTk4KzhPcEJuU2M2L2gwV2l5UGVKS2I1Z0V3bHpwMC9Zb0lWQkkv?=
 =?utf-8?B?bEwwbTFxSzJ1dWNVV3E4Qk84dFA5UmJ2R0xnc1ZwbXovaTArSjhKdndjT0dh?=
 =?utf-8?B?VWFQWXpndVM2ZkF5S1NCTzdwMENJOU55cVNET2ZRVDVZQ3VhWVlRYjk0akFC?=
 =?utf-8?B?bm9YbytvelpBeVVIeHpuSzhzSlRDbTRld2RpODZMM3hjaHhTdnpXdElXTlZX?=
 =?utf-8?B?MjhVazBVa1dqaFhpejlKdUg5alNtM3RNVzJCRDhXaER2cUIwRk01OTFDbGR6?=
 =?utf-8?B?SllkWi9yekw3K1hJYjlJN1Y0NlRWUWNMUmsrVlhxdGN0YldINzVaMXJLZmlC?=
 =?utf-8?B?d0hRb2c2WXV6QTRjU0ZMVnhHa2hwQW5ndWVwajhMbTBEUTlBMzRtQW1qSlJp?=
 =?utf-8?B?eFU1ZnltME5tWWRuOUdleWZlSk52eVNtYjlROTF4eE9Xbnh3aDR6dXFDcjJO?=
 =?utf-8?B?bzN4T1dON3ZLeVhkYkNBTStMYytzMDdPR3RKMlZmamhlR3NjT2JWSENyTDJO?=
 =?utf-8?B?dzlSYjVoWVE3QUh4bVFkbUJHR09NeHJQdlVOb1Bub0V4cXd6Z0M2TjVmTldI?=
 =?utf-8?B?QU9ic0JudzFVTW1SM3BwVGovNmtsRzZRU1RIZGVuTFl4R1FrWVdlalVqNjh2?=
 =?utf-8?B?N242YUNLUnhPd1JDTXcvMVVyQlJ3aGhucDNadkFZYzhjNmp5Vyt5UE84U29v?=
 =?utf-8?B?aXZiRnVVMkN3UXBHV095UHoxczhYSkRCS0RDL2xkQjhWOG9UemFZeGo5bThE?=
 =?utf-8?B?b0xRUllTVTExT3VNZVdEMmVMWmJXZVpQTEVIYVc3d2l0MVVLcHd1a3F4cndS?=
 =?utf-8?B?L254cGtkYm4zSEwxNW9YV0RWZDREUVRmQjhtVXdQalI1WUdWMTY5WVc5QnI5?=
 =?utf-8?B?c0VIMU1JNGlRdFlzRkc0N3A3RWp6YmlFaTJaeTJDOExUdmNNbWVLeFpBRHRK?=
 =?utf-8?B?ZjJoVUtZNTcvbm1mcHlIcU1iNTVXa1JiQzJQYkUrclBQOU5wcysxZHZFSG1w?=
 =?utf-8?B?RWYxQ1BxelJ6K3Z1SVhSWFpoMGhxdlVlbmJmQU9lNXlvRGliZEVyMGNPOG5q?=
 =?utf-8?Q?jn2gYeFnDnN3wvcikLHnH0k9I?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A67A96CC40353F40BC1C58071F304125@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB6186.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 483688b3-f870-4546-2697-08ddca5d91d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2025 02:55:38.3479
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1RS+UDMrR+1eaGzArI9KRIfpCEnFPWQIdRL+awIjHvkwHqJSbgpWnFoZ7QjxMoLIuevkyWLChNtnDB8IuCWOCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB6820

T24gVHVlLCAyMDI1LTA3LTIyIGF0IDEzOjA5ICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiANCj4gDQo+IE9uIDIyLzA3LzIwMjUgMTA6MTYsIEt5cmllIFd1ICjlkLTm
mZcpIHdyb3RlOg0KPiA+IE9uIFR1ZSwgMjAyNS0wNy0yMiBhdCAwOToyNiArMDIwMCwgS3J6eXN6
dG9mIEtvemxvd3NraSB3cm90ZToNCj4gPiA+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5v
dCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzDQo+ID4gPiB1bnRpbA0KPiA+ID4geW91
IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gPiA+IA0KPiA+ID4g
DQo+ID4gPiBPbiBNb24sIEp1bCAyMSwgMjAyNSBhdCAwNjo1NToxOVBNICswODAwLCBLeXJpZSBX
dSB3cm90ZToNCj4gPiA+ID4gQWRkIE1UODE4OSBlbmNvZGVyIGNvbXBhdGlibGUgc3RyaW5nLCB3
aGljaCB3aWxsIHJlZmVyZW5jZSBTQ1ANCj4gPiA+ID4gZGV2aWNlLg0KPiA+ID4gDQo+ID4gPiBB
bmQgdGhlIGRldmljZSBpcyBub3QgY29tcGF0aWJsZSBvciBpcyBkaWZmZXJlbnQgYmVjYXVzZSBv
ZiB3aGF0Pw0KPiA+ID4gDQo+ID4gPiBBY2tlZC1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6
eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPg0KPiA+ID4gDQo+ID4gPiBCZXN0IHJlZ2FyZHMs
DQo+ID4gPiBLcnp5c3p0b2YNCj4gPiA+IA0KPiA+IA0KPiA+IERlYXIgS3J6eXN6dG9mLA0KPiA+
IA0KPiA+IFRoZSByZWFzb24sIGFkZGluZyBhIG5ldyBjb21wYXRpYmxlIHN0cmluZ3MgZm9yIHRo
ZSBNVDgxODkgZW5jb2RlciwNCj4gPiBpcw0KPiA+IHNhbWUgYXMgZm9yIGRlY29kZXIsIHRvIHVz
ZSBkaWZmZXJlbnQgb2ZfZGV2aWNlX2lkIGRhdGEgYW5kIHRvDQo+ID4gZGlzdGluZ3Vpc2ggdGhl
IGNoaXAgbmFtZS4NCj4gDQo+IFlvdSBzcGVhayBhYm91dCBkcml2ZXJzLCB0aGlzIGlzIG5vdCBy
ZWxldmFudC4gRXhwbGFpbiB0aGUgaGFyZHdhcmUgLQ0KPiBXSFkgaXQgaXMgbm90IGNvbXBhdGli
bGUsIHdoYXQgaXMgdGhlIGRpZmZlcmVuY2UNCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6
dG9mDQoNCkRlYXIgS3J6eXN6dG9mLA0KDQpGb3IgZW5jb2RlciwgdGhlIGhhcmR3YXJlIGRpZmZl
cmVuY2VzIGFyZSBzaG93biBhcyBmb2xsb3c6DQpDb21wYXJlZCB3aXRoIE1UODE5NiwgdGhlIG1h
eGltdW0gcmVzb2x1dGlvbiBvZiBNVDgxODkgZW5jb2RlciBpcyBvbmx5DQo0SywgYW5kIHRoZSBm
cHMgaXMgb25seSAzMCwgd2hpY2ggY2Fubm90IHJlYWNoIHRoZSBoaWdoZXN0IHBhcmFtZXRlciBv
Zg0KTVQ4MTk2OiBsZXZlbDYuMiwgOEtANjBmcHMuDQpDb21wYXJlZCB3aXRoIE1UODE4OCwgdGhl
IGxldmVsIGNhbiBvbmx5IHN1cHBvcnQgNS4xLCB3aGljaCBpcyBsZXNzDQp0aGFuIDUuMiBvZiBN
VDgxODguIEJ1dCB0aGUgbWF4aW11bSBiaXRyYXRlIGlzIDEwME1icHMsIHdoaWNoIGlzIHR3aWNl
DQp0aGF0IG9mIE1UODE4OC4NCg0KVGhlIGFib3ZlIGluZm9ybWF0aW9ucyB3aWxsIGJlIHVwZGF0
ZWQgdG8gdGhlIGNvbW1pdCBtZXNzYWdlcyBpbiB0aGUNCmNvbWluZyB2ZXJzaW9uLg0KDQpUaGFu
a3MuDQoNClJlZ2FyZHMsDQpLeWlyZS4NCg0K

