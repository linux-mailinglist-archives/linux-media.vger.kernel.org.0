Return-Path: <linux-media+bounces-30080-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F612A87166
	for <lists+linux-media@lfdr.de>; Sun, 13 Apr 2025 11:42:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D8953B34D9
	for <lists+linux-media@lfdr.de>; Sun, 13 Apr 2025 09:42:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6D4E19E96B;
	Sun, 13 Apr 2025 09:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="V+xH5TcP";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="FkiuFj2i"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90DD717583;
	Sun, 13 Apr 2025 09:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744537324; cv=fail; b=IJ5vFyZsI901p9EMtQCrjIqW9V6mmHpljoQcNgh22vlLhxb4bEBM1fLOfcATpUjt6r+uKrjF/mK8K4M05XbK7zYGKTsHk2UcnGq67gJck81XmnZu6KPVtkno9YFYpPfce+nrVphw00Wo9clNx5ISJXm/a7ZoLtnolhvoa+3L+rM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744537324; c=relaxed/simple;
	bh=pa6uTVQjDkB0rgGbRMydWawUvEWo+qT5f6GBwiLnBgE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=e7w+pl/V8zb7UiO0z0cKfwQhl8QT8Tgt7Lv3wXnFMIF6/++o2YnTRbNfQ+NceEF1x+hJy92yqKNzpm7oe2UPdgac6VuM2Wi3Cx7EJKOUa+0z6bv1cVlEMAx7MBrixJKUGMnLzzJ4Edm1vvn+5U+Gm9Rf74FgYy3mFaa8HOcZ4jY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=V+xH5TcP; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=FkiuFj2i; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 84ebd8c0184b11f0aae1fd9735fae912-20250413
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=pa6uTVQjDkB0rgGbRMydWawUvEWo+qT5f6GBwiLnBgE=;
	b=V+xH5TcPLwQEj+s+BoZifCPVj3KdS7SLRNOOM5YPsoYjma2Z7V6ywiQDgmKipaBGFQWw1g0f3mabJEAgN/TXS/Zdm3f5awmDlcYSEJEaUzE9Qx5yAVMcGPdMroEFEwlWLyONuESaODmS0DaYI7IpaEt8tvaE8m00GdQdkknxNUo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:566440c7-e6fa-447f-a4ab-9cd56d8a00dd,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:f42f82c7-16da-468a-87f7-8ca8d6b3b9f7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 84ebd8c0184b11f0aae1fd9735fae912-20250413
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 47758429; Sun, 13 Apr 2025 17:41:48 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Sun, 13 Apr 2025 17:41:46 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Sun, 13 Apr 2025 17:41:46 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WiM8cvJ10TojToWagH0e2bj1XoGdEYaG1e9rQIxm1qnOEZdBPX+clivgbZYS0gYjbQw2Y1ZoR7rVsRs/hqs7PhNbFarUOHSG6ed/FlOp+wnZGtVBn4U+a9Qx3QdialR0uYalLZ5FkoGZdTBjG2GIJgEGTDM9k0dUjqsUNLY/DVk1CDN0vJBpDP6VJef8erZSgYtufGedE1fJuQcIDejNAfx2cjM0t+Quj599VSyXWJc/SKkjPai8acNurVa7RDInBqyTSMI1wHeKYxX8CoTrXIQ4+hW3QPyd8T49D7awfUi/KRif0ZtcPnVBxR3q+wHvDEcG+Wv/wJA6wI7pkDbH0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pa6uTVQjDkB0rgGbRMydWawUvEWo+qT5f6GBwiLnBgE=;
 b=k7U2WWmcypynF2UBIPpV+CjS5UtagF45v4V9cljQ5GQTeb+0KMXcTz9CCzoT6iMhurNOmVyXf31aBWyLmGvbLVtsppQYKK8TdYVG5IuBp65UsOdNq/dNLozoR8rjp53ZA2ORUvVuqXnzGEfCjDpmdgiV25P9AJnz/Bi4xATS2lNICmLhJswOFYhVkRDCmj9mo28WaBGqc12iyhJZ3D630pmV0YE69o5xy6fchEzFum7R3vRIxlWL/P1VVRMrfhrdiDZJX2hA5h/J6BlanUShsI3MQr4x2EFASn3s9YCe4UoL9ShyHWWfuEIOUt/c8XBHvwWQXRPADBe/qMVaMTz6FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pa6uTVQjDkB0rgGbRMydWawUvEWo+qT5f6GBwiLnBgE=;
 b=FkiuFj2iqzB68XfqcEXvfKZtRyWBjXeANh73n332GDbF8sDnba7+aRA30/g3qIlMbgp2z5UDkLN9tMOql4xe5bfGQDHI3a/bqj4tE9uUWlYi/dmiGBF+aTYt/2OidT3zh0yMt3umKeYVCmMrHefv+WDkl8wQUHOorKhQ8HyhmXg=
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com (2603:1096:301:b9::5)
 by TYZPR03MB6847.apcprd03.prod.outlook.com (2603:1096:400:25b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Sun, 13 Apr
 2025 09:41:44 +0000
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::7b22:91f6:b76e:161c]) by PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::7b22:91f6:b76e:161c%5]) with mapi id 15.20.8632.030; Sun, 13 Apr 2025
 09:41:43 +0000
From: =?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>
To: "krzk@kernel.org" <krzk@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"kyrie.wu@mediatek.corp-partner.google.com"
	<kyrie.wu@mediatek.corp-partner.google.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "hverkuil-cisco@xs4all.nl"
	<hverkuil-cisco@xs4all.nl>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 01/12] dt-bindings: mediatek: Add mediatek,
 mt8196-jpgdec compatible
Thread-Topic: [PATCH v2 01/12] dt-bindings: mediatek: Add mediatek,
 mt8196-jpgdec compatible
Thread-Index: AQHbqeIJBn3odSshKUa7Or3JaQpeN7OccvgAgAFTaoCAAgzsgIABiXEA
Date: Sun, 13 Apr 2025 09:41:43 +0000
Message-ID: <2ea42d0d732bbf84da0216c851c2aa21964a9c22.camel@mediatek.com>
References: <20250410063006.5313-1-kyrie.wu@mediatek.com>
	 <20250410063006.5313-2-kyrie.wu@mediatek.com>
	 <20250410-wandering-righteous-hound-ac5edd@shite>
	 <b4745bd99e28cf90581320f8ddb591f76b1c91b9.camel@mediatek.com>
	 <9714498c-6d89-4e1c-87dc-1b6779e913e1@kernel.org>
In-Reply-To: <9714498c-6d89-4e1c-87dc-1b6779e913e1@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR03MB6186:EE_|TYZPR03MB6847:EE_
x-ms-office365-filtering-correlation-id: f32dd79a-20b6-45ca-b2c2-08dd7a6f666f
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RTBraGhzV0kwZ1plOFpzU3VicmRSTTlRY0wxREZzaUNaRGp4S3VGdE04Q05k?=
 =?utf-8?B?RzVMRm5GUUxVdG1oeE9raGRIL2tuRjZOenE4bTJscHEyclA3NU9JTllZSWRy?=
 =?utf-8?B?TEdMc3NXNE1pTk1zbWxhdC9YMXhBbU9oZ1hGaEhDOG1oZFRMOVczbXdBeDJa?=
 =?utf-8?B?L1RqLzh0N1B0N25TbVdwUmlKTHp4KzRIRzZZOVVhVnMyeCtlT05FdnNqWlZk?=
 =?utf-8?B?V2FBRG5tcHU2R1c4WVZ1aFFiOVFMZUU0dEJqYlVyYTJReHh1MlRtckZ5Situ?=
 =?utf-8?B?QjZIWFgwN1lnTzFYaGVaYjAyRm03aDlFcTZSMFhGTE9Oam1PYXMwSmMyYVBQ?=
 =?utf-8?B?L3dNUFdxK2pIa2dxL3c3ck93Qk9DT3E5ODVOcmZnOTdOejhPRnp0M2d1cTFk?=
 =?utf-8?B?QTd1aVF3ampDY21GNzVyM3J5MlRZaXArZDlxb1BKRkpJdU9Gczd3MDhuazQ5?=
 =?utf-8?B?eFpYa2xuQTVHNXEwR2VYd2I5SkdINm1zNFdwaU1aRkVSVzBPWXlUK2ROVDdT?=
 =?utf-8?B?U3gvZlVaSkVLaE1oM05ZeE9BMlIwUjB1QTJGMGlHWXZuKytoYjRnanRkNHYv?=
 =?utf-8?B?QUU3dTFuakhrVlJ6NHNNejNPVFdsNEZiQVhCRFNBWGhvQ3c3YlpwdlE1djJj?=
 =?utf-8?B?eTNvVE9EQ3kweUVmbDlhV2ljUWJPc2JML29NOU9SUWhsRzdrR050aHpmK0hM?=
 =?utf-8?B?c0hWV1h4clFIYnJPbUc2bUdqMTFvc3RDL284NGJqaVNrL2lpU1IybjdVNWZK?=
 =?utf-8?B?bVIxT1lUQytDTHhvTEtoVGJ2ODlITVh2Mmd6N3dHdENIdERIYm56aGxsTkFM?=
 =?utf-8?B?UEMzQytGTS9qdDJEOFFCcFF2RlVLZm9rVlFJYUo3SlpoT1NGY0d4TzRUSkhD?=
 =?utf-8?B?bk1MSUlHZ2lZYkc0UDZzeUdnQ2kvd1lVS3JUTytFbmN2RnVOLzFDbEV6SW1I?=
 =?utf-8?B?aXlTd2lOUUxleTYybUk5VFZaclRFZjdUalBRS29JNlZGK2lqRW5CdWNHYmVO?=
 =?utf-8?B?Q0dpcENyT0s5VVd2RVdnNE93VGhUZ1RzK1ovN1pHdDc2cjNmZ3Ayd1E4ZEF5?=
 =?utf-8?B?QytNcldzQllUZW5LdjJydjBycy9vUDJUYitaWHFqRVdnSElzUDVDR2pUUmRR?=
 =?utf-8?B?U0MrVGltWFQwYmhUQUt3WGZpbGEwenZDTTlhUE96Wko2S2RFa21mTHRkYUFY?=
 =?utf-8?B?QXJ6aE55bnNDZElqcmlTK3V6NXdlT2tGYTViMW05dlhRS0VabTh4NU9JOVZ5?=
 =?utf-8?B?QS9qQk1KMlc3MmNFdWQ4NmlzMlZ3T3FUK1lZbmo1L0VEYVkvR29rMzBGbUJS?=
 =?utf-8?B?RERoZkRwejN3bkVQQ3lWQUE3T3RGZUFTSjE0Vjg1YWt3Z0wyVmhtaW5hTS9n?=
 =?utf-8?B?ZzhpcytOYUFuZnhxQXArcDJkajFHRXcxRnRQT25CUWJFdnRUUjhUbkYzZ091?=
 =?utf-8?B?S3dZYkEzNFdvbHRiY0lzNlUxZXhpYWJpQURPenhWOUdpOEFVRVlmRnNZcnR4?=
 =?utf-8?B?VXN4cTArSnFEYmpNSVkxcTIwVWtNbVRsMHltZmx6TklDUlJtSmpzclVoM0gv?=
 =?utf-8?B?MHc4RmVhbTJGL3lkY2k0Vm9MNDIvRlBZMFZJbVdjbXc2djRvaVlXU2xFa1cw?=
 =?utf-8?B?OUhOaFRpQ3dITUN4WWloWlhhQjRTVXYwcUo0NEJXa1FUeVI4Wk9kVDZtVzVO?=
 =?utf-8?B?blE3Uk1oQlJUOWdxM2pjZzVMamF3UU1nSFV5TGNibHJLK0FWbDNlUGlsRVI0?=
 =?utf-8?B?aHNFOURhMGNDbVlkVXhpbEdkK2JqMEk0azZDQWZhNDF3MExyT0daRCtHTWlU?=
 =?utf-8?B?REw2bzhXQ0l1VmJjeEErUUhWMmZoTFBEdkMvdmFabFdKSUNDWks2L2g0UUZj?=
 =?utf-8?B?MDFUM2d2QkxpMGdRdGtkeW9EWHBVbFBtS3cyU2wxMDI1dW9ieEIwYXpNWHlT?=
 =?utf-8?B?MERodTJnanQzL29OTlhNdTJWZ1Y1eEpPWmxpZ2JrSWtubnBKZ3BYMkpnVUZi?=
 =?utf-8?B?dWZmUGJxKzZRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB6186.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RDBPODRvUTltcG9mVmJoRjJ6WG10Rjl0Z1cwSGlTS01KKzFDdkhaNERQR3VB?=
 =?utf-8?B?RXVad1pVd2drWkM4d0dERHBYVWZzWjZvcGdyT3B3MVdCb1Y1SmRlazdVbTFH?=
 =?utf-8?B?eFJKUkR3L3BKY2wzM09hZmcwWjNrUjl3RVFldElyVVNhTVNISTR2K3dzeHVp?=
 =?utf-8?B?L2g2Q05tZlFOWGJPUjBTbHB4MFV2dkxjN3RhR21QN3FvNDBRVUpmQitrVVZn?=
 =?utf-8?B?M0JqTEV3RVp5UkFaV3NaR29kZUhXbDRLWmQ1TGVMbXVFQjNTSkViblZ3L3Ba?=
 =?utf-8?B?QVI3QmU2S2VNb3k4cUpsbFNSazc3MXUwMGtITnBUN1NEYmFCOWdWMVFTNzgv?=
 =?utf-8?B?RHFvRHpqc2JIaTdTbkdSNG9wc2E5TS9TM2U3eVBHcDl2SEh6bnZvRmNBbXRz?=
 =?utf-8?B?aTZib1RqUHFwOWxtUS9vM3NmUUMyeXhkRVRSSGllaXIwV3R2bFNGSTJIcCtU?=
 =?utf-8?B?T0xWWjNBQUY1Sjk2a1NBQit5N1cxaVhUVTVCZGNHUEYvZThoL0RCZEdEUG44?=
 =?utf-8?B?MlZSSjE3TWNtbkZ4bmZXcWJIS1RYdTFxMHVCUldIZGJhSk1ocDFzUlZuTWVQ?=
 =?utf-8?B?a3BYamtLTnBzR05OeExJc3h1bTRyZ1FOWlFCd1BwK1FLU1JwZUE0SHZkSmRs?=
 =?utf-8?B?YWM5QldBV3U4d3poTWc2alZaUFJZMXhiRmpqVGNpa1Y1QmptOE9MYzllSHRF?=
 =?utf-8?B?ZUprZy9rQXBiZDhKWERndTV3T3h5QXdsUHc1NzRCaXArZFVVcnFhZW1hOWd1?=
 =?utf-8?B?QmtoQ3l6ZlNGN0RTaW12c2R2bHB4N2I3QitRZEVhQzZ4VWduUzBqbFZIVGVU?=
 =?utf-8?B?V0dJTVFtam9rZG1uVE5sVTUxdzJSV05URUdmWEpEbUsyUHlRdi9sWFQ0bHM0?=
 =?utf-8?B?RDVlRUF0QUIzamlJYmp1WkVBOGozYzc4Sm1hRkoraHVoRTQ3MTdyTWdpYk15?=
 =?utf-8?B?cHNFaTJGLzhMWFpvd0xvSGE3L3FoRVlsY1ZyZlp0WTJDVEU1L0tJSXp6eE1o?=
 =?utf-8?B?U3ZRb3hXdVYvWkJIOEIwTXc5ZXkzZENrbVB3N0VuLzZvT1E2S1JpR2QxZ1VV?=
 =?utf-8?B?eVJobEtQVSsyYVlxTkllL2F6MXZDa1FGM2xXVElJRDJkaytGUTBDYjdSRzdI?=
 =?utf-8?B?c1RzaGR3ZnE5UDM5S3VrL1pKSUhqSm5Ga0gxRUJpMXdReHFrUks5VURBZ3Jv?=
 =?utf-8?B?WnM0RkpvV0JLcUhJcHRGWHJycFpFNFFHdk55Uno1aDNVWEZDenl1SU52aFpl?=
 =?utf-8?B?YUFYaXNLVHlIazNSd0Z4VDJZUnZraTd3Ni94SFVUODQ4ZnZ4MXY5N0xuZ2hP?=
 =?utf-8?B?OE5PVTVpVGJmNEhsSE5LbXdsRm1GRy95UUk3TVBVMEhQVi9RY1g5U2xXSzVa?=
 =?utf-8?B?VUxjS0F6MGczNno3SWhCTDh5RE9OZjFhRkJvMFZUVGVRREhWNmZ6eVIzOERR?=
 =?utf-8?B?VHRlbnk1bEJaVDd1L1VOczZBRGFNQU9ZOS9PUWw0MXRML291bHB4dFljbGwz?=
 =?utf-8?B?WkVXcE9JenJnMDRiNGpJai9wZHRraTF6QXkyckpuSzdCditqanlONlh5ckho?=
 =?utf-8?B?aFdLWTkvaFp2VmJwQVpEeWxOVFBVZnZpaWpEUGV6NnEzMEZkeEc1cUx3SDZr?=
 =?utf-8?B?KzlseGx5TUg2dURPdjlpL0o4WVhKb2NUTEE5Wk5weEtjRzM0clY3VXBkSVBM?=
 =?utf-8?B?cDJKV1M3TFEyVWJjMVpQVjB0aDUvek1tM3lNS0pCaFAxQXpPL0hYcndmSmVx?=
 =?utf-8?B?ZHZxcVpmY2lsOGZhdkZJZzBQRlF4MGpjOTJ5bFl2bXFWK3N6QVFsZDN0SkZ1?=
 =?utf-8?B?UUUyRVFnellwdUFEOEhMZ3BCbzNOOE1HQk80NHRIUUUvU0x0eGpwZCtob1la?=
 =?utf-8?B?MEZRM0ZmRUxzYkI3UW1rZjIxdWlwTjlENUl6VW4vWG5tNUkySjM2Z3pYcVI5?=
 =?utf-8?B?UTlXVVZqNHNLaVNmNmd3Nk1WVm9CUkFvN3pQLzRGVUQrN2o1MzRrMTFrN2Y2?=
 =?utf-8?B?TWdpMFo5azBOTWdPRXd5ekZHUmRwckJPTnY2SkhNS3VHOWI1cHpQSUJ4K3Vs?=
 =?utf-8?B?N2N2cmNQUnNUYmlOWEhveWpGODFnZ05KZ21wZlJjMGNLeWlqbkhZdUpDUHdr?=
 =?utf-8?Q?6r40nPvYnYnVrpwuNd2GTsK7V?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CD051D945A0F9948952995997135ECF8@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB6186.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f32dd79a-20b6-45ca-b2c2-08dd7a6f666f
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2025 09:41:43.4804
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rrYOPw6hcoidtoq5vQMJ3uLaDI2MItArorUJ37FRqO1P27KB+8bOBTNE/nyJmsu7DbTc6pmHtPQXolC5obosow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB6847

T24gU2F0LCAyMDI1LTA0LTEyIGF0IDEyOjEzICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiANCj4gDQo+IE9uIDExLzA0LzIwMjUgMDQ6NTQsIEt5cmllIFd1ICjlkLTm
mZcpIHdyb3RlOg0KPiA+IE9uIFRodSwgMjAyNS0wNC0xMCBhdCAwODozOSArMDIwMCwgS3J6eXN6
dG9mIEtvemxvd3NraSB3cm90ZToNCj4gPiA+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5v
dCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzDQo+ID4gPiB1bnRpbA0KPiA+ID4geW91
IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gPiA+IA0KPiA+ID4g
DQo+ID4gPiBPbiBUaHUsIEFwciAxMCwgMjAyNSBhdCAwMjoyOTo1NFBNIEdNVCwga3lyaWUud3Ug
d3JvdGU6DQo+ID4gPiA+IEFkZCBtZWRpYXRlayxtdDgxOTYtanBnZGVjIGNvbXBhdGlibGUgdG8g
YmluZGluZyBkb2N1bWVudC4NCj4gPiA+ID4gDQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IGt5cmll
Lnd1IDxreXJpZS53dUBtZWRpYXRlay5jb20+DQo+ID4gPiANCj4gPiA+IFVzdWFsIG1lZGlhdGVr
IGNvbW1lbnQgLSBsb29rcyBsaWtlIGNvcHkgcGFzdGUgb2YgdXNlcm5hbWUuDQo+ID4gPiBQbGVh
c2UNCj4gPiA+IHJlYWNoDQo+ID4gPiB0byB5b3VyIGNvbGxlYWd1ZXMgaG93IHRvIGZpeCBpdC4N
Cj4gPiANCj4gPiBEZWFyIEtyenlzenRvZiwNCj4gPiANCj4gPiBEbyBJIG5lZWQgdG8gY2hhbmdl
IHRoZSB1c2VybmFtZSBsaWtlIHRoYXQ6IEt5cmllIFd1IDwNCj4gPiBreXJpZS53dUBtZWRpYXRl
ay5jb20+Pw0KPiANCj4gQW5kIHdoYXQgZGlkIHlvdXIgY29sbGVhZ3VlcyBzYXk/IFBsZWFzZSB1
c2UgTWVkaWF0ZWsgcmVzb3VyY2VzIHByaW9yDQo+IGFza2luZyBjb21tdW5pdHkgZm9yIHJldmll
dy4NCg0KRGVhciBLcnp5c3p0b2YsDQoNClRoZSBhYm92ZSB1c2VybmFtZSBpcyBzdWdnZXN0ZWQg
YnkgbXkgY29sbGVhZ3Vlcy4gSSBxdWVyaWVkIHdpdGggeW91IHRvDQphdm9pZCBtYWRlIHRoaXMg
bWlzdGFrZSBhZ2Fpbi4NCg0KVGhhbmtzLg0KPiANCj4gPiANCj4gPiBUaGFua3MuDQo+ID4gPiAN
Cj4gPiA+ID4gLS0tDQo+ID4gPiA+ICAuLi4vYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWssbXQ4MTk1
LWpwZWdkZWMueWFtbCAgICAgICAgICAgfCA4DQo+ID4gPiA+ICsrKysrKy0tDQo+ID4gPiA+ICAx
IGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+ID4gPiAN
Cj4gPiA+ID4gZGlmZiAtLWdpdA0KPiA+ID4gPiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9tZWRpYS9tZWRpYXRlayxtdDgxOTUtDQo+ID4gPiA+IGpwZWdkZWMueWFtbA0KPiA+
ID4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlayxt
dDgxOTUtDQo+ID4gPiA+IGpwZWdkZWMueWFtbA0KPiA+ID4gPiBpbmRleCBlNTQ0OGM2MGUzZWIu
LjI4YTlhOWJmZGJmOCAxMDA2NDQNCj4gPiA+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLG10ODE5NS0NCj4gPiA+ID4ganBlZ2RlYy55YW1s
DQo+ID4gPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9t
ZWRpYXRlayxtdDgxOTUtDQo+ID4gPiA+IGpwZWdkZWMueWFtbA0KPiA+ID4gPiBAQCAtMTQsNyAr
MTQsOSBAQCBkZXNjcmlwdGlvbjoNCj4gPiA+ID4gDQo+ID4gPiA+ICBwcm9wZXJ0aWVzOg0KPiA+
ID4gPiAgICBjb21wYXRpYmxlOg0KPiA+ID4gPiAtICAgIGNvbnN0OiBtZWRpYXRlayxtdDgxOTUt
anBnZGVjDQo+ID4gPiA+ICsgICAgZW51bToNCj4gPiA+ID4gKyAgICAgIC0gbWVkaWF0ZWssbXQ4
MTk1LWpwZ2RlYw0KPiA+ID4gPiArICAgICAgLSBtZWRpYXRlayxtdDgxOTYtanBnZGVjDQo+ID4g
PiANCj4gPiA+IEFuZCBkZXZpY2VzIGFyZSBub3QgY29tcGF0aWJsZT8NCj4gPiANCj4gPiBTb3Jy
eSwgSSBkb24ndCB1bmRlcnN0YW5kIHRoZSBxdWVzdGlvbiBleGFjdGx5LiBEbyB5b3UgbWVhbiB1
c2luZw0KPiA+IHRoZQ0KPiA+IGNvbXBhdGlibGUgc3RyaW5nIG9mIE1UODE5NSBmb3IgYm90aCBN
VDgxOTUgYW5kIE1UODE5Nj8NCj4gDQo+IE5vLCBleHByZXNzaW5nIGNvbXBhdGliaWxpdHkgd2l0
aCBmYWxsYmFja3Mgb3IgZXhwbGFpbmluZyBpbiBjb21taXQNCj4gbXNnDQo+IHRoZSBoYXJkd2Fy
ZSwgZS5nLiB3aHkgdGhlc2UgYXJlIG5vdCBjb21wYXRpYmxlLg0KDQpUaGFua3MuDQpJIHdpbGwg
Zml4IHRoZSBjb21taXQgbWVzc2FnZS4gVGhlcmUgYXJlIHNldmVyYWwgZGlmZmVyZWFuY2VzIGJl
dHdlZW4NCnRoZSB0d28gY2hpcHMuIGUuZy4gODE5NSB1c2VzIGlvbW11IGJ1dCBzbW11IGlzIHVz
ZWQgaW4gODE5Ni4gQW5kIDgxOTYNCndpbGwgc3VwcG9ydCBkeW5hbWljIHZvbHRhZ2UgYW5kIGZy
ZXF1ZW5jeSBzY2FsZS4NCj4gDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KDQoN
ClJlZ2FyZHMsDQpLeXJpZS4NCg==

