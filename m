Return-Path: <linux-media+bounces-24023-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D029FB97E
	for <lists+linux-media@lfdr.de>; Tue, 24 Dec 2024 06:23:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65EA716295B
	for <lists+linux-media@lfdr.de>; Tue, 24 Dec 2024 05:21:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84C4014A635;
	Tue, 24 Dec 2024 05:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="UtQKeIlJ";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="n05ZbGdX"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA10B27702;
	Tue, 24 Dec 2024 05:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735017697; cv=fail; b=UaRHdIwK1qI4jMUw1kEctPHnXaSABEWIdIYNv4bwzUFWMBCBytptt3OkoPXXTUq+4yz8p9X2de7uHdXTCHLsLN4LI7YPEm4rXSF95Z8hSW48uym1CQzXvVl7Fc3qpai++OJD1bDJPZb/N5o9I680d4ugc2xKoTh6hMNCV9kyUto=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735017697; c=relaxed/simple;
	bh=ytzeOgK/FAUxvyd7UzyJbhb3/WxKXrRT4jDW94CjsXE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DrMnm4DOvNewR6eHmeaB8o77C+ylSVGM95HK5xhub363F/ntmq0B6KJJndfPNj9ze2xWjDNH5Akdggxa6g5qSjwJUOtCw/+35REEz4IGBofX9N1g3QUnC+3K6Hgmc/F20lo85h3PDkWe/aUWlpqn6Yi+FR3DL8QhaoCSHQGJsyI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=UtQKeIlJ; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=n05ZbGdX; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: ea636b28c1b611efbd192953cf12861f-20241224
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=ytzeOgK/FAUxvyd7UzyJbhb3/WxKXrRT4jDW94CjsXE=;
	b=UtQKeIlJUqUFlEZ/f9ZTYmUtgOv/nFpqazeLqJDbVl8y4j2l1diISzBk50jKIiPq7xD2dDP0TjOyB6J3341e2iFTeCDqac/SnzxVEv60ezjCC6WYbesAZ0GaHAHlEvya11yb/5CqDzfQopGnGb/ocFSmekfbg5WtJ2plDHySXsM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:d0ffdec8-a4c9-4a24-b538-939bb22383e2,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:8529c618-ec44-4348-86ee-ebcff634972b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: ea636b28c1b611efbd192953cf12861f-20241224
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 251574801; Tue, 24 Dec 2024 13:21:23 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 24 Dec 2024 13:21:21 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 24 Dec 2024 13:21:21 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n66xL6U65LEzw60UfYushx0aRPaOTL1TTiuvXeIWAtASxs+sS2bqBLjALKI0eK0ihoBbqMfyAHQVK2vGCmtB5tZVOYaNfNAr87YtGMYiU8/QN2Ca/rCmRI3/g844RH1ut9ENLPKaQEg5YPJ+dqTjaOJeBjhnP9oi3JsJa088tVD3IxS3jp4kjXTleNsy0gVyk10VRpISATILjFOhrYQmnzawy8iabnnlZS+xqGqVN7TZ+8Em6Hsu/tNa1UncOs2PrugUPHv/999NHWHDslDo4eYXD+FQovB0TLY2xMfvQbie8d3y5DVb8eU5pQ8iZ7OJeg1cYVP79AovJGIVMtTK8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ytzeOgK/FAUxvyd7UzyJbhb3/WxKXrRT4jDW94CjsXE=;
 b=KNAzB/wBrvpBO4jualYfiYF32uVZJ90unk5cKMksBzWxmlJGTsU++yhTx4E+uaaduSP7QSUHtoq2EENqJ0ImgiYygxVj2r0vPpgVj+ygRVGktni6b5r8NP/ZHdQocMkaH1rgtmwN4JHjOHtzgNDgrdcnxMOTwd0vOOXrqVAMWB9c2KWnMBDZ6kMr+lAjrskj+LAFvebDBhc4PDqlKeKN7x2H9Y3UUdwffrL8mFSrvgmxPDV0q6SC8QcvLYupc5C0RAtIbg8mAxhlNmKq71vWhWA4YO189SvSRDS8M3dlEkL8jNiVbtJgEmspF6X4Uk5x4uzJ6fkwFuNX1Vq5Gm2NzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ytzeOgK/FAUxvyd7UzyJbhb3/WxKXrRT4jDW94CjsXE=;
 b=n05ZbGdXHEmGQw/AKNJ/jt/lCyksGxn9RUJIb99pyB53RoxrJ7jhNFVd/Egw3z0KmPt1kmwydkTmm3HqbsjioG9mpPFg4ysJLqjy1XItaJlnV/JXMz0tJUffbekqYQ/Y7hdORhYqDP7efwEiD6eN3VLEkJjsHJ8T8lwOWgK9BXs=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEZPR03MB7913.apcprd03.prod.outlook.com (2603:1096:101:189::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.18; Tue, 24 Dec
 2024 05:21:18 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8251.015; Tue, 24 Dec 2024
 05:21:18 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>, "robh@kernel.org"
	<robh@kernel.org>, =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?=
	<Jason-JH.Lin@mediatek.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	"simona@ffwll.ch" <simona@ffwll.ch>, =?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?=
	<Moudy.Ho@mediatek.com>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "airlied@gmail.com" <airlied@gmail.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	=?utf-8?B?WGF2aWVyIENoYW5nICjlvLXnjbvmlocp?= <Xavier.Chang@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: Re: [PATCH v3 6/7] drm/mediatek: Add programming flow for unsupported
 subsys ID hardware
Thread-Topic: [PATCH v3 6/7] drm/mediatek: Add programming flow for
 unsupported subsys ID hardware
Thread-Index: AQHbUjk94C1yrUVLDkWaw4QjUwi+O7L04t6A
Date: Tue, 24 Dec 2024 05:21:18 +0000
Message-ID: <a20004d1279c234ca3b25681a47897d31f1d525d.camel@mediatek.com>
References: <20241219170800.2957-1-jason-jh.lin@mediatek.com>
	 <20241219170800.2957-7-jason-jh.lin@mediatek.com>
In-Reply-To: <20241219170800.2957-7-jason-jh.lin@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEZPR03MB7913:EE_
x-ms-office365-filtering-correlation-id: cb1eefa5-0fe1-41b6-5705-08dd23dacb92
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ODBObzg3UFBqcFNxSXkyay9rd2YxejF2TjloREhxc2c0R2MrQTBYYWxyY0pL?=
 =?utf-8?B?UW5wdDdvcVl6OUVvMCtTdkNyT0h1NXdkdVpFbW5CaXN2UXl0M1pyR1dpc0xI?=
 =?utf-8?B?Y2ZhbXQwcWNUUStoMlQ4aEtBVVFwdmpJcDRPUDRWRXZiTHZoSGYxaysyYjAw?=
 =?utf-8?B?a1RheDIzR2NDNjRPMmhBc0pXZUIvYjBsdytkVTFCUmluRmJNVWhZWXkwWjda?=
 =?utf-8?B?a29RTmRyR0pBdU5ORzV3WnJQN3JnaTZ2bTFTa2dxRVBmSjVGOXpPQkpWdnF5?=
 =?utf-8?B?M0t1UVhhbXlLeHhlckdqaFI5SnNkWGs0NCtDbmowRzFZaldOeU42QTBjK0JX?=
 =?utf-8?B?TG1jYU9CY1hMMjYza3FHQzNWWWFaS1pjRG5KMElIM1REMXRQVnpUMW1FMm1l?=
 =?utf-8?B?ZE05Rlh3SFVUTnpuWkdoZmlKcHkwejByZVZFbFkraU1Ob25UV1ZiN3daTXZD?=
 =?utf-8?B?OFVqUUpsb1hudFR4SFgwUkFDK1E0ZENLTmVmb1JiRWF3V0FzWGU2alJyS3BO?=
 =?utf-8?B?NXpNS3hOeDdmWGg1aXc4eHdkZ2psc1NMTTRwSVR6N3d3SnoxcjIrSkg4RTd0?=
 =?utf-8?B?VWVuTk1nVFh0ODIrRXlXZ0Z6WjZPWkQ3N2JKdFBNT3Z6a1NBSnlJUE14TmM4?=
 =?utf-8?B?bjlmQXRKaUllSGVlYXFEK3pWMS9RdkNOVi9rdXNEY2Y3N25JemJLd1NNMmhY?=
 =?utf-8?B?cjc2OWcxOXgwN2hBNUFrUGk1OEdIU2szYTRsZytnOG9mUnNOank4ajVrWGdq?=
 =?utf-8?B?L0xBTG9OdU40NU1KQkJoQWlSQzE0bjV2Z01LNjl6UmwxczYxUFh3dmFkV0ts?=
 =?utf-8?B?L0dCbHg0ck9odko3TmhFeFNqeGxPaEVhNllaMm5oNnZkbjBDWmxzbzNIRmU4?=
 =?utf-8?B?eHppVGxoNkkzMEdGSWR4TEtwU1I4WlhyTjdmY0Jaa3ZGOVR1UVhUMzVsWkFs?=
 =?utf-8?B?Q0pOSVJRYWVHUjVJcE1lNHhnclRPMXVCbmlLQkdZOEtsQlhwVGxudHhiUjJp?=
 =?utf-8?B?eFZZVm9wS3k5ZHhwLzgvSGJTUWI5MGhBVnhIeXAybzIrU0FTSEFQSWUzUWNo?=
 =?utf-8?B?MjYyelI0T3FCMzRFOCs0aWtUd21xQWV6dmE5K1ZlaTV1ZkhXZ2JsMTd5ZERG?=
 =?utf-8?B?UkczbjR6NDNHdm80a1ByRFdpRjJiajUvUGVyRk1MVFNmWWdaeEw4YWtXeEtw?=
 =?utf-8?B?SXY4NE5seHN1WHQxbXpWUXA4MGtOQ3BiQUxvdTJTMHFnZllkUzhjcG5lcUkx?=
 =?utf-8?B?Q3dwV2hTNVNSek42UTQ2TVZ1WnMrWDM4d0prUlNuRFV0d2MvVkpIWE5TRG5z?=
 =?utf-8?B?WkYvVFJWSTBUOGxYWUNlYWxuMlZ2dW1KV0l3U01QTnoybGUvclo3TjhLOE14?=
 =?utf-8?B?ZTBHWjRVVmdSanlqM3RyRXJDT2Q3N08zakZvSHk5ZHk0TWFZNk5BTzZ6Y2pB?=
 =?utf-8?B?MWVtME14NmdTeXJ5SXU3REdacDVzaE9kRllYYk42NUtkTlpiN2xSUXJTb3ZV?=
 =?utf-8?B?c0kxaGlnQmlvVVQxWUxLK0twQ01hODc3aXhxV1NhT0VUNGtZTVk1WFc1ZDk1?=
 =?utf-8?B?aWJMdE5tQ214bWpRbWtmRGJ0RnEreWMrWnhINzgyVzlOWEgvSFNVRXoxYmpC?=
 =?utf-8?B?ZTBtVkszTjcxbXNxcE5jU20zUDBDMFFFZTlDZzhsOWNhZHFwM05XV3Fvdncw?=
 =?utf-8?B?Y0VXbmNhODFwb0pDNkNVc1VhRkl5c3BNVmg3YmtOVzJ2QW83VUlwY0RZcmxx?=
 =?utf-8?B?azYxS2VGcHBvTVhVaGlRM1ZBNGpWaEQ0bEJwbE01eUQwT3VCSHorZy9iVm1U?=
 =?utf-8?B?ektwNmtUWG5nQVBqOXBsUEoySXdjc1JGVUdoSUFoUDdlYU9ISEh5MktuOEw0?=
 =?utf-8?B?WDV0WTRZSUs5RUw1SWJ1NnJYTERRSEZBcXJhUjhkTFFoMWhkUnRzT2lGU2lE?=
 =?utf-8?Q?3gPHdU6PhwIUDK3qyzjRFOqs7pPe5ODl?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eWlmcEM5WW1GQ0dHSWFOOEZ5ZUZkN1BHQ25STFFYbnJUQmhIZXVmaTBVdzVO?=
 =?utf-8?B?V0xYY01PME1LZFAwbzhqZ2xZcnJsRnFHMHRDUUk1RERzakZmbVFRMXgzbVov?=
 =?utf-8?B?RGRuVzZVcFFUS0FxcnM1dFJQTlBWc2NKSkFSOTZtNTBmVXBaMWQ5Nk5uRnE5?=
 =?utf-8?B?cjF6WEZrRmdkbVVJak4rS2diTm5Nd2hGTndmdWhwQzJSTlFUb2NkTStmSDVU?=
 =?utf-8?B?Q05kWHNvUitwRllESHJCZFlNRXVVK0xGT1pMclpueGVQM2J2UG15Z0VJOCtO?=
 =?utf-8?B?aEt3M0xMaENDU0JjdGY0aFpXK3BGdmI1T2dBMFNPc2EwbXlSNk1EWnRqRkFr?=
 =?utf-8?B?K3IxK3NKQWhZckRMUDdsaGpkbncycTNTK1grZUJ6bEo5dlY4K2hsSi8zQ1Nh?=
 =?utf-8?B?TStUdCs0aXRiS3B1WmowLzNubC8zWE51elRzRkNwTkNnK1QzOW90ZDV0WWE4?=
 =?utf-8?B?OWN3WTBIanN6RnlqTDFRZnRPNkJlenVCbUNYSHZpdHBEQjRjSzVnWEJScTkw?=
 =?utf-8?B?RFhnODV4MllyZDEreDVPZXk1ZGRNWUh3T1I5Vng3ejFSdVA3M2ZVdS96VGZn?=
 =?utf-8?B?ZjJOenZZM3FLbTFkUkIycUlxcDZqZ0tWSFRscXBndVJMYUdIQWVHNDFBRE1w?=
 =?utf-8?B?UUpRZnVFd0EyRGxDMEhJVTcvMUdpbC9DQlhyelUvdzFxczNIWnZnVnFTNzVv?=
 =?utf-8?B?WU5jUFRwT1J3SzNGelNVMlREY1hmbFBwcERockc5K0ZYdzcvWHcvQ1lRU2Mz?=
 =?utf-8?B?aHRtM081bHdlQVNaVlJtUkRYV0pRczRPTThSSWVKMmgwOTRveVRGNFhzdlRR?=
 =?utf-8?B?K3FuQ2RIUVhmaDQ3UUU4cnlOSldhRUNnOEtUeTVHT1FKeTdiQjJsTUw4LzJX?=
 =?utf-8?B?SDJveG1GK0F5NzNKQ0NpcHlGc2xvWGpSQjdGVjFwQ2RHNnNpTlQ3WVIxSU9K?=
 =?utf-8?B?M1FqU3ArckFuMG9LN0xNd0pDOFkxbExRbVd6WHA3ZDJOVUZVTldnMDduRlI4?=
 =?utf-8?B?QTVHck9hU0NwSEgvMmR2ZEZDOUphM1gramdMMklpQWt5YnBwVG1KYmlTOUV5?=
 =?utf-8?B?dC9aN1JCUXcxOTR1cjdTTWRQL1FqMmZ2UytjM3dUR1BBT013T3l5RGR1TFpO?=
 =?utf-8?B?Y28yRHloSWpkOU92Nm9Ic2tzRU43ajVIWFZ2LzhPREFYb2ZTb2RXb01zdlpX?=
 =?utf-8?B?dVYzVVoweW9aSzloM3hmMEpGSGs3Szd6K1UzdkVUenVrRzhNaXBheVZhMUFn?=
 =?utf-8?B?WkFiOE1lMFR6Mm91NFRySG5mQzNvZkY1UzMxdkxWdUtDWFQvYit3WE0vazR0?=
 =?utf-8?B?ZVVQK0JOQ1VkQXFyZ2l1VENWcVZuTmRXTFAyZ0F0Wmp3OE1TVlpmZ1BmMzlD?=
 =?utf-8?B?TWp1d2hYRW0vRTRJTHNXbUlZRFd5UGpKdXpwRGU5Wm1UVmkvZUZGazVEek85?=
 =?utf-8?B?b3F0aEo3SnlWTFZ0QkM4a282VVNzQW1Hd29XeW51M2p6bm02U0Z4Tk9xT2Vq?=
 =?utf-8?B?eUJFSldZOWlPSUlZbmhEeWk1SjA2UHdMaUhnbW0xdjBRdGw4MHBDcmVCWW15?=
 =?utf-8?B?Y3c5TzFGNU9sb29mSGxRQ3F6Rkc3MzVFT05XMHNvZ1p1NEJHQmYvaDZmRG1F?=
 =?utf-8?B?ZDRaSXoxbEZGMUtpTFE2L0xSZWZYSytMZXNhbWRtdEV4ZWduck9Sc0ZzZ0E0?=
 =?utf-8?B?bVoySjQ4c2pEdXJGKzhGOVRJbHV4b2RKTnMrSWtEOXAvZTFhUGxFbi9DR2Y1?=
 =?utf-8?B?TjdNYzBzd1NpUVpiZDkwRlNMYXVIeVBUcnYyVWEvMEovWVBySWQ2eTBBZG5u?=
 =?utf-8?B?SHljdVdOS1UxcUJ5V0svYVBvTTZ3TUVXZDhEeWhBSEs4N3BYQnV3RTRBdXVq?=
 =?utf-8?B?MUJkYkFhVjZUckJNOExQWjE4cUV1a1JNNWRLdy8zQk5NWjY5bHc4MEdjcW1C?=
 =?utf-8?B?YlBNOGRqc0V6RVRTeE9CdW94bGVORjRxRHNPNVJZR25xZUpNMjV2RE9OdFFI?=
 =?utf-8?B?ajRpNUcxY2ZtUTIxdlB1aXhrRjFEaEVoOEl6clRoR3lCZGpYMVJWOFllV2xG?=
 =?utf-8?B?bXpENklwT2NSZ0k4RDdSSG5HY052eERnVjZ0UWd6aUxQQS9TdGd2N0NOcmU0?=
 =?utf-8?Q?4VKbsbb/E4Qxa/N/5sNKbQxD6?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <78CE2A4C5E5F9E4B9A2B2753659529F2@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb1eefa5-0fe1-41b6-5705-08dd23dacb92
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Dec 2024 05:21:18.1169
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3g1Ah2xwiTVo0Tj8SrHYxdVI9WhXWEyXQUDtTX3izBzVl07lzntO2gazJBPCJhlyLqTupuB4mEvNujm02CPMpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7913

SGksIEphc29uOg0KDQpPbiBGcmksIDIwMjQtMTItMjAgYXQgMDE6MDcgKzA4MDAsIEphc29uLUpI
LkxpbiB3cm90ZToNCj4gVG8gc3VwcG9ydCBoYXJkd2FyZSB3aXRob3V0IHN1YnN5cyBJRHMgb24g
bmV3IFNvQ3MsIGFkZCBhIHByb2dyYW1taW5nDQo+IGZsb3cgdGhhdCBjaGVja3Mgd2hldGhlciB0
aGUgc3Vic3lzIElEIGlzIHZhbGlkLiBJZiB0aGUgc3Vic3lzIElEIGlzDQo+IGludmFsaWQsIHRo
ZSBmbG93IHdpbGwgY2FsbCAyIGFsdGVybmF0aXZlIENNRFEgQVBJczoNCj4gY21kcV9wa3RfYXNz
aWduKCkgYW5kIGNtZHFfcGt0X3dyaXRlX3NfdmFsdWUoKSB0byBhY2hpZXZlIHRoZSBzYW1lDQo+
IGZ1bmN0aW9uYWxpdHkuDQoNClJldmlld2VkLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29t
Pg0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKYXNvbi1KSC5MaW4gPGphc29uLWpoLmxpbkBtZWRp
YXRlay5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kZHBfY29t
cC5jIHwgMzMgKysrKysrKysrKysrKysrKysrKystLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDI3
IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kZHBfY29tcC5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kZHBfY29tcC5jDQo+IGluZGV4IGVkYzY0MTc2MzllNi4uMjE5ZDY3NzM1YTU0IDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RkcF9jb21wLmMNCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kZHBfY29tcC5jDQo+IEBAIC02Niwx
NCArNjYsMzcgQEAgc3RydWN0IG10a19kZHBfY29tcF9kZXYgew0KPiAgCXN0cnVjdCBjbWRxX2Ns
aWVudF9yZWcgY21kcV9yZWc7DQo+ICB9Ow0KPiAgDQo+ICsjaWYgSVNfUkVBQ0hBQkxFKENPTkZJ
R19NVEtfQ01EUSkNCj4gK3N0YXRpYyB2b2lkIG10a19kZHBfd3JpdGVfY21kcV9wa3Qoc3RydWN0
IGNtZHFfcGt0ICpjbWRxX3BrdCwgc3RydWN0IGNtZHFfY2xpZW50X3JlZyAqY21kcV9yZWcsDQo+
ICsJCQkJICAgdW5zaWduZWQgaW50IG9mZnNldCwgdW5zaWduZWQgaW50IHZhbHVlLCB1bnNpZ25l
ZCBpbnQgbWFzaykNCj4gK3sNCj4gKwlvZmZzZXQgKz0gY21kcV9yZWctPm9mZnNldDsNCj4gKw0K
PiArCWlmIChjbWRxX3JlZy0+c3Vic3lzICE9IENNRFFfU1VCU1lTX0lOVkFMSUQpIHsNCj4gKwkJ
aWYgKG1hc2sgPT0gR0VOTUFTSygzMSwgMCkpDQo+ICsJCQljbWRxX3BrdF93cml0ZShjbWRxX3Br
dCwgY21kcV9yZWctPnN1YnN5cywgb2Zmc2V0LCB2YWx1ZSk7DQo+ICsJCWVsc2UNCj4gKwkJCWNt
ZHFfcGt0X3dyaXRlX21hc2soY21kcV9wa3QsIGNtZHFfcmVnLT5zdWJzeXMsIG9mZnNldCwgdmFs
dWUsIG1hc2spOw0KPiArCX0gZWxzZSB7DQo+ICsJCS8qIG9ubHkgTU1JTyBhY2Nlc3MsIG5vIG5l
ZWQgdG8gY2hlY2sgbW1pbmZyb19vZmZzZXQgKi8NCj4gKwkJY21kcV9wa3RfYXNzaWduKGNtZHFf
cGt0LCAwLCBDTURRX0FERFJfSElHSChjbWRxX3JlZy0+cGFfYmFzZSkpOw0KPiArCQlpZiAobWFz
ayA9PSBHRU5NQVNLKDMxLCAwKSkNCj4gKwkJCWNtZHFfcGt0X3dyaXRlX3NfdmFsdWUoY21kcV9w
a3QsIENNRFFfVEhSX1NQUl9JRFgwLA0KPiArCQkJCQkgICAgICAgQ01EUV9BRERSX0xPVyhvZmZz
ZXQpLCB2YWx1ZSk7DQo+ICsJCWVsc2UNCj4gKwkJCWNtZHFfcGt0X3dyaXRlX3NfbWFza192YWx1
ZShjbWRxX3BrdCwgQ01EUV9USFJfU1BSX0lEWDAsDQo+ICsJCQkJCQkgICAgQ01EUV9BRERSX0xP
VyhvZmZzZXQpLCB2YWx1ZSwgbWFzayk7DQo+ICsJfQ0KPiArfQ0KPiArI2VuZGlmDQo+ICsNCj4g
IHZvaWQgbXRrX2RkcF93cml0ZShzdHJ1Y3QgY21kcV9wa3QgKmNtZHFfcGt0LCB1bnNpZ25lZCBp
bnQgdmFsdWUsDQo+ICAJCSAgIHN0cnVjdCBjbWRxX2NsaWVudF9yZWcgKmNtZHFfcmVnLCB2b2lk
IF9faW9tZW0gKnJlZ3MsDQo+ICAJCSAgIHVuc2lnbmVkIGludCBvZmZzZXQpDQo+ICB7DQo+ICAj
aWYgSVNfUkVBQ0hBQkxFKENPTkZJR19NVEtfQ01EUSkNCj4gIAlpZiAoY21kcV9wa3QpDQo+IC0J
CWNtZHFfcGt0X3dyaXRlKGNtZHFfcGt0LCBjbWRxX3JlZy0+c3Vic3lzLA0KPiAtCQkJICAgICAg
IGNtZHFfcmVnLT5vZmZzZXQgKyBvZmZzZXQsIHZhbHVlKTsNCj4gKwkJbXRrX2RkcF93cml0ZV9j
bWRxX3BrdChjbWRxX3BrdCwgY21kcV9yZWcsIG9mZnNldCwgdmFsdWUsIEdFTk1BU0soMzEsIDAp
KTsNCj4gIAllbHNlDQo+ICAjZW5kaWYNCj4gIAkJd3JpdGVsKHZhbHVlLCByZWdzICsgb2Zmc2V0
KTsNCj4gQEAgLTg1LDggKzEwOCw3IEBAIHZvaWQgbXRrX2RkcF93cml0ZV9yZWxheGVkKHN0cnVj
dCBjbWRxX3BrdCAqY21kcV9wa3QsIHVuc2lnbmVkIGludCB2YWx1ZSwNCj4gIHsNCj4gICNpZiBJ
U19SRUFDSEFCTEUoQ09ORklHX01US19DTURRKQ0KPiAgCWlmIChjbWRxX3BrdCkNCj4gLQkJY21k
cV9wa3Rfd3JpdGUoY21kcV9wa3QsIGNtZHFfcmVnLT5zdWJzeXMsDQo+IC0JCQkgICAgICAgY21k
cV9yZWctPm9mZnNldCArIG9mZnNldCwgdmFsdWUpOw0KPiArCQltdGtfZGRwX3dyaXRlX2NtZHFf
cGt0KGNtZHFfcGt0LCBjbWRxX3JlZywgb2Zmc2V0LCB2YWx1ZSwgR0VOTUFTSygzMSwgMCkpOw0K
PiAgCWVsc2UNCj4gICNlbmRpZg0KPiAgCQl3cml0ZWxfcmVsYXhlZCh2YWx1ZSwgcmVncyArIG9m
ZnNldCk7DQo+IEBAIC05OCw4ICsxMjAsNyBAQCB2b2lkIG10a19kZHBfd3JpdGVfbWFzayhzdHJ1
Y3QgY21kcV9wa3QgKmNtZHFfcGt0LCB1bnNpZ25lZCBpbnQgdmFsdWUsDQo+ICB7DQo+ICAjaWYg
SVNfUkVBQ0hBQkxFKENPTkZJR19NVEtfQ01EUSkNCj4gIAlpZiAoY21kcV9wa3QpIHsNCj4gLQkJ
Y21kcV9wa3Rfd3JpdGVfbWFzayhjbWRxX3BrdCwgY21kcV9yZWctPnN1YnN5cywNCj4gLQkJCQkg
ICAgY21kcV9yZWctPm9mZnNldCArIG9mZnNldCwgdmFsdWUsIG1hc2spOw0KPiArCQltdGtfZGRw
X3dyaXRlX2NtZHFfcGt0KGNtZHFfcGt0LCBjbWRxX3JlZywgb2Zmc2V0LCB2YWx1ZSwgbWFzayk7
DQo+ICAJfSBlbHNlIHsNCj4gICNlbmRpZg0KPiAgCQl1MzIgdG1wID0gcmVhZGwocmVncyArIG9m
ZnNldCk7DQoNCg==

