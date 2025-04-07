Return-Path: <linux-media+bounces-29460-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE84A7D5CF
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 09:29:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C7F3B172322
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 07:27:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3164522D783;
	Mon,  7 Apr 2025 07:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="JKdNuJyb";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="A0weyVS0"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DBDF233712;
	Mon,  7 Apr 2025 07:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010501; cv=fail; b=gWJxIeTgTfGwOnlh6yUJFV5p13sG7l1zfiGyFRNKskBgICoJ5T75xCjCXuBd4etwqWHmcrx4jTuASZYHly1KWCcrNfgxiNnECCjKk7HX/a74zHs66GY4tULQ+7FYhjlXw1H3YAOib46gCGt39GwsSIyqLrJodMjgwVteoJVEGNY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010501; c=relaxed/simple;
	bh=J0HGIgkn7O3A27erBlBEbsAN2N0uw+7Yi4q1Etl1igw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hge2LD+b34XUgw5UdLmYt9og/HJiFtXZCXCqPTbEp0Yd9pXKAjfsd4QgV2vkz15Sf5IXRzhKeVupjY/AMx7IfsGA8d/rr8am5wR+I0rKGj83Vsv7neiEXCbzLKRbgp4aksFYej1B0WRAsCU69FQpz2DMbKsilq77A/fJvkXklVg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=JKdNuJyb; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=A0weyVS0; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: eef06454138011f0aae1fd9735fae912-20250407
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=J0HGIgkn7O3A27erBlBEbsAN2N0uw+7Yi4q1Etl1igw=;
	b=JKdNuJybNcf6xl2j/3To18BvOXF6fd6rOqa9fJA0obcNleuBEfUbqsU2cFkr1bLb24EXy0F0wbBKCxDEe5Uw5wtPkhTJ3Qpjip908E+QNlcEndaXFxOEBQa+eC9aPZN/pfFRjEpoxtPLfQ9vo5qwtByIk0YUd0njRjVGojX7EtU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:9fab5029-7c3a-4692-85f9-b82a808be1c5,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:93fb074b-a527-43d8-8af6-bc8b32d9f5e9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: eef06454138011f0aae1fd9735fae912-20250407
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1076170022; Mon, 07 Apr 2025 15:21:33 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 7 Apr 2025 15:21:32 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 7 Apr 2025 15:21:32 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IW0WgQPqvybskreQdeOl7jE2nuzxJ9mHAyTRTqBXpXlPrLj0dR7TR2o3sVzzYVu7AQ0y1ObDxUnpdMsHr2UuolKq439CqeVa9G28uoXVdEOZ0DUFf6QRSrxhaASnB3g5D0RQLVWSWjYvlYt70iO3p9cCPlJ/8K716XuHqSrUDf4kxPy0NauQDBE/oe/3vq+CrB4Krp76OVQhkgpgMi5d6GQqw1hVf+DDJmICLwn3Rcg0a3olTRjsd3o8WSMjECWDIsa4TLez59wuxRg3nVjufPuN0/AJSXDPYTByZrmN4FCKB5ao2Vnkf6SIwZhJDK2wGPF3KX6T1Uxb2XtAbzHxBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J0HGIgkn7O3A27erBlBEbsAN2N0uw+7Yi4q1Etl1igw=;
 b=LKCUW2WZrJWyfzuWlmwwcZoNCXf2RVLlNvbv81379N7bYkwp3XIqJCc9Fhh6xWRhxOXdd1gmP41ph5cvEXY3B9DgcOkXHeLQIsk66EKHkQDqlpnTvC/zZZUxerZtZgRGSRZx7fjSdgG1lNBPsfuq7Ps5qit1a0k/38CEg9fHh6f60m46LHIlfdPsQnQXei6OIeMaQqdrf/jnV/kN0cvcMg+L+ydjZhlRYMlhf4gBa97QnlWCZhFnYRuREsG6JBoowBdLlSWL6VNzBHhitdA8CHE7Io1q1q6aVuF/OlVa/cAYV2HCbEkyF4T2rIhhZ1XoO+q0m3EtlS4C8VsfvzKBgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J0HGIgkn7O3A27erBlBEbsAN2N0uw+7Yi4q1Etl1igw=;
 b=A0weyVS015bPDxkLRElYyQKqYlSIPYOCD9Wv3gTnPSMUU1yLL+PjVGlIt/9DyJoxoVCbU+6XSmFuKlP2Enx8U1UFaqF6SjNmq7WAbeURY79sRloHl6OIMj63SDAzK/7qw61e+CMRzl30Ti6sVuwbt9lFqQZ10e2cJhNJUxICrYw=
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com (2603:1096:301:b9::5)
 by SEYPR03MB7415.apcprd03.prod.outlook.com (2603:1096:101:13e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.27; Mon, 7 Apr
 2025 07:21:29 +0000
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::7b22:91f6:b76e:161c]) by PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::7b22:91f6:b76e:161c%5]) with mapi id 15.20.8606.033; Mon, 7 Apr 2025
 07:21:29 +0000
From: =?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>
To: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "robh+dt@kernel.org"
	<robh+dt@kernel.org>, "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
	"tzungbi@chromium.org" <tzungbi@chromium.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"kyrie.wu@mediatek.corp-partner.google.com"
	<kyrie.wu@mediatek.corp-partner.google.com>,
	=?utf-8?B?QmluIExpdSAo5YiY5b2sKQ==?= <bin.liu@mediatek.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>
Subject: Re: [V1,04/12] media: mediatek: jpeg: add jpeg smmu sid setting
Thread-Topic: [V1,04/12] media: mediatek: jpeg: add jpeg smmu sid setting
Thread-Index: AQHbYpt5bbPZkNtPsEyigoU/gsHV07MPweoAgIiUOQA=
Date: Mon, 7 Apr 2025 07:21:29 +0000
Message-ID: <c5dcf1c5b8cbf5f18a578446f18c34e7049d18d9.camel@mediatek.com>
References: <20250109133513.20151-1-kyrie.wu@mediatek.com>
	 <20250109133513.20151-5-kyrie.wu@mediatek.com>
	 <73144187-7f7f-4f68-aa5a-5fc019e646ec@collabora.com>
In-Reply-To: <73144187-7f7f-4f68-aa5a-5fc019e646ec@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR03MB6186:EE_|SEYPR03MB7415:EE_
x-ms-office365-filtering-correlation-id: 02a985c7-3abb-488a-f0e0-08dd75a4d0f3
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?KzVkelVleS9wTEFGeWN4bWc1NkdjSU1Yd1Q5cWI4N2g5cjlrWkZZcCtTd2ZU?=
 =?utf-8?B?U3h6ZkRNSUdsYTE3T3lYMk9xdmluWFI0QTRjRlZQNGgzVmpSUVB6UTJJYzFi?=
 =?utf-8?B?dUJhbk5jZ0hZNE05VS9aR2JTdForWjZsVkV4aDlTK0VEWEl0RTV2MVA3cXNn?=
 =?utf-8?B?N3oyWTRpT0ZDRlcranJWWThqSHZieHpDaG44WEJyNjZWTDVBRDdDdk01Q3k4?=
 =?utf-8?B?N2M1VFZuVXhHbll0ckRlTGJXbWFWRmkxSlFsZUNQTElmeU1DUWk2ZlJabTRX?=
 =?utf-8?B?ekFUZ2RjOW55N1piR3k3d3lUbWJYWklGaXJzb1FnZTl5TGEzS0FVUHFZSE1K?=
 =?utf-8?B?SmFlbFdoeWI5THYrMkJieFVRNWpRWklQYlFhT1BvdDIxakRKMjVIZ3RLaVlZ?=
 =?utf-8?B?UkVqbk5pdTMycTcyM2FXYnVnWlVmU2FkV25WM2luMzZoZ0lVczlRaDNYZ0ZI?=
 =?utf-8?B?YjBTbnNqZGlwRW9hU1hDcW9XaGl4WWJFWnl6ejc5WTRuci9PNE1QSVdvVW1Q?=
 =?utf-8?B?b2IxMjYzRW9RT1NiamNEN3NTL2NSNm53QVdaVk84K2dXMUoraTYvTXJVcE1U?=
 =?utf-8?B?N2orQXFHMTZNYjRuS2J5SERwcDN0V3d0UWRkZGl6dSsrSEtHb2xGRVlUOWUx?=
 =?utf-8?B?ZkNIUkxGaFdGV0dZdlB2QUZFbVJTYjdlSUtQVnpnRXBFTkMxamZVYkJFU09i?=
 =?utf-8?B?NmR5dW4rRklkaXU2bVo4RTRLTHV3NDRJd21YdW1lcmo0Q0pYWk1BN2R1dlZm?=
 =?utf-8?B?YTRmaWlIZjBUTU9IRVN1emFiMDllVUFYZGQwUmdvMXkwTFg2by8zK05oc0xv?=
 =?utf-8?B?U1d1ZnptRlY2VmpHMThUV3hmdzBpWTIwdWJtZ3h6dTcrODZESEtIZmoyc1RN?=
 =?utf-8?B?RW8xZVZJcTcwRHZIVTNZbnk5UTVXd3lWQjRKbndBVlkxRTd2bmlBMXdiQ2JF?=
 =?utf-8?B?dGtpVDVNK1AxcitxelpHcGxPNkp6TmgrY3dBSUJVM2JMYWxZcjFBWGhMYVNZ?=
 =?utf-8?B?SXY5YkFIMTl5T0JVZ1Y0M3dHWFRlSmF6NFNLTHNJd3F5aTh4c2FCSk1YWW9Q?=
 =?utf-8?B?azhUK1FvejNyYmZFOWdWdFJibnFIb285bVh1SDNwSmRsVVBuUXJIOUlTcnRk?=
 =?utf-8?B?OWJ3NGxXRjgvV3o5ZHQxY1ZVWG0zQWFlb0IwbFpLMkFTL3VEQmxVVUExalM0?=
 =?utf-8?B?WTFzd0VxN29NRmU1TWQvUVExblhhRmdUWmwrVnp0M0lJenNiK3VyY0FOVFZn?=
 =?utf-8?B?Y0JtNlNZNlBQUGh4RWlHTWhIaHBJYTRNQWFHZ1JIdXF5TFVIZm41OVV6TVZn?=
 =?utf-8?B?SFJLaWpoQ2tSUVF5eEh1eFAxVHlRTXlzbHZPQnRqd25YVUd5S3dYb2gvYW5r?=
 =?utf-8?B?aXZ1NG1sOWJqNmJ6VXFlRlIyRnl2YTN1eFowci9qVS95OEdtdlpYQ1BrVlVJ?=
 =?utf-8?B?aXE0UjVWT1dyVjJTWUgrQXNzOUpzeHpWb0pLZGVwRGlWYnhiZzFXMjhTN0d4?=
 =?utf-8?B?Y1hRRzc4RnZUV1lIRG9WZWQ0WVNiSHVXMnRWWTRqYVpMTzFSRkZqSnN3c1N1?=
 =?utf-8?B?OHVQR0lVMkphRlgwNWlNZGNYbnZkRmt5R01rZEVkdXhnQ0dBOUpldmIrRUpB?=
 =?utf-8?B?ek1hQ2x3SUVhZ2Jxb1hRZVFNbjJwL1BtV1FvZUkxa0QwYkQxTlB5TG1sU25z?=
 =?utf-8?B?UzRjREVyU1FrYXZOVG5TTE1ZZm5Hc0xxNjlMU2R1VnFOUXYzQjNrRStwSVdU?=
 =?utf-8?B?aVhiL3Q4bU9qVk83aGp4Z1RCRTRqeU1LMU9EbEZwYmRFRVlnWGdtekFFZ1Ir?=
 =?utf-8?B?dGFkejljUityVEREOVJ0czg0ek41YUoraXpaQ015UmpuM3dwWDNrR3VFRURK?=
 =?utf-8?B?a3ZkemorVnd1NmhsdDZ4RUJlZ3JEN2oydjM1ZmszT1RpUkhDTXZlVGdWNEJX?=
 =?utf-8?B?cndMVVVZMW1Ga3lJSW13SjlDcmp5ZnNkUHlQS0VLa1Z0OUJMNkplcUx4akdQ?=
 =?utf-8?B?a09vWWtudEpBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB6186.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bU5XUkJTY1N3cndVK1lIQjlIb255bFFNaWowUlViU2R3M3NOQll4NlQwQ2N2?=
 =?utf-8?B?Yy82MWpTYXM1a0lGeW5IcEpMQmlqejhJd05Ca2FyOXJkYW9sWmxFQUFWVC9T?=
 =?utf-8?B?ek5FUWtURjhuZFBpd1c4cHh5NTNNVnM0aTZsRExHL08xTWQ3TERtcmpqaUxD?=
 =?utf-8?B?V3ZVWDFWazZzNVkzd0s0U1pDTDRXeW9SbUM3WjNTT3N0WVZ1UzZWampoQmxh?=
 =?utf-8?B?aktTbDZiOWVnbHJuWWIvdGlNSklaUWx5MnNiY3R6WE5obUhnaUUzT3FPVzRH?=
 =?utf-8?B?b3VaUmlhb1QxNGFubFZzZHp4ZHAwYzE3a09XV1hjVVF0S1lKRms3MytOK2tr?=
 =?utf-8?B?MUZxYTcwaXVyeE9kSXJoRUJ0ZndZUGhmK1JKSHBXd2IzK2w5RDNJT0t6MW0r?=
 =?utf-8?B?RWNmR2w5S0l0TXNsL0RuTElybnN4OU1YbmFkNE4vcEJqSE9oMXRybDhscitU?=
 =?utf-8?B?eWhIcGZ3VXRLeEswU2R2RXBHUk9qdkQ5UkMxN1U3OTZlN0IrT3VnbnlaTGJI?=
 =?utf-8?B?Qi9BSGRHSmF4WXQrWjVXYkpzcTQ1Ym9HeWtVSk1PSkVOMjRLc2JZQWR3cmU3?=
 =?utf-8?B?RTNPWDllYmR3bFRNY3Z2NHVBVjJ3U0xBQVJmaStVKzZ0WE5Xa05MZlBOTERD?=
 =?utf-8?B?RllNVlZhS09YdHYzSTc2Yld5dEZiTzBjZ3h6bVJGWGpKQnZBWWNFR2hzY2xw?=
 =?utf-8?B?NVZmbkpqWmtackVZYis2MVN6L2EybDJxSDhDSXl3SXQyUXpMS29rYWg0OWxZ?=
 =?utf-8?B?ZG5DRGFkYi9pS2ZtM1RsUXMya3RGbU1qczhGa3RlTEh5dXVuMVJXalFnTi9C?=
 =?utf-8?B?N2RXbkNpamY5YjBWUHVSU1dNWHhRTDNieXYrMWVDTHVxOUJXSi8zZC9GSzFI?=
 =?utf-8?B?aUdEeFQxVG1vWFpTenJ5WUd4SVd6MTZESEE1QktkQzF5SS9aTzJhdHlrM0Zq?=
 =?utf-8?B?S3AvQUl2dlFRSlVrUG1jSXI3d0U3b1hUQmMrVkRJNW8ySEpWUlBMVkpYMnlk?=
 =?utf-8?B?RFJ0YUZLRFRkOGErQXkydDhNbXF6amREOExSZis2M1o4Wkx2cGxsYVlNYjFn?=
 =?utf-8?B?R0t1NGtBVXV0RlRuMzZ3RFVTYlM2d0pEMnJvb0ZPN3NJR0l3eW5SK04rYUlv?=
 =?utf-8?B?MWtUdlRYRTFEMGNSTlI1NkpQOEdlV0ZZNUdsbml1S3MzYkZaYzAwSm9sdDhl?=
 =?utf-8?B?b1FyUWVOWXVIeU9Fb1VaT2owa3l1aEYyRjQ4dVB1aVc2VlZ5UWdWMXA4YWhh?=
 =?utf-8?B?M0dxZzJRaFpQa0NjbklObGRoMkQ0cy8yUHo4SVhYbnMvSXdFb3ZGMWlTSkht?=
 =?utf-8?B?dXVoMzJXeUphM0hTTFhEL2RicnVoaVBjYzZOdFpMWEdPbTliUlhMcXpDZXhC?=
 =?utf-8?B?dmNPSFJHMnVMT2VmK2tHTlV3c1k1NVlWWkVPUkVxcmpzM0QzaHl4V1d2MzR3?=
 =?utf-8?B?aDZEL1UxUWVHOFRudEw0Rml0cURYOXQ4T3FxMFdBejV2Wm45ejJVZm9HSEpJ?=
 =?utf-8?B?WkhOL29MTDNOdGZ3SzExQnJub2NoS1ZTYkZKZVh0Rmtnek9oQ2w5dUN1dTc2?=
 =?utf-8?B?T0E5cm85QnpzTEl2dkhPUW02Y3piTWlyMkNtVTYrTE9lT0JvT1NMUkdmTjBM?=
 =?utf-8?B?Um1FZkZsa3VQbFMrNHkrM01kaGkzSjVzNjEwdmNPQzE4TC9MeXlESGF0NzVl?=
 =?utf-8?B?TG5nOG96UjVWbG1zMzBmNjlWeHFzWkNVc1J2Z0UyN1NOZHRFcUUwTEZrQkpq?=
 =?utf-8?B?VzBNdUNvZ3M2SFp6dkdNSXg5eFZ6SXpmWnRWZ1BKK2N5MVNIUDhCc3RhQXpl?=
 =?utf-8?B?bGhJY0ZDUzFXYlI3OGRYUGN1QldHK1VJdzNnMm45OGVJQnluSTJhK0dYUTlN?=
 =?utf-8?B?M01KS0M1Y0MyRlhIQzJCUERYUm1EVTBqbnl3MitJRHBvK0ZaMzVDeUVYaHNr?=
 =?utf-8?B?cVFHN01GckpiZ0VwYVpGdUNMNmd2OTUzU2NJUEJuaFlRMEF4cDFqbDB2eUwy?=
 =?utf-8?B?TFYrSnhpRnRvUHZrSSs1M3dkSm1RNTFMbWtVZE9RS2pIS21XQ0JzUmhWR3FJ?=
 =?utf-8?B?dmc1dnFtNXhONGhGd29LaVZYSmJmYU5mdDliVmZ6S2VWam9jcmc4eUp5dUhk?=
 =?utf-8?Q?EQxNZv9cgXI5Xk+k0HpvvIUhg?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6C17ABB30BC0354E8F58AD746B4C2817@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB6186.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02a985c7-3abb-488a-f0e0-08dd75a4d0f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2025 07:21:29.6854
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1Py1hAB0OpTktTJdFHz3ro/rZXEON1IbSUnciWkTsFK/TATB8MrrDPfilwSjn7hswXS/MKrf0YnR8nSwIf5sDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7415

T24gRnJpLCAyMDI1LTAxLTEwIGF0IDEwOjM5ICswMTAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRl
ciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBJbCAwOS8wMS8yNSAxNDozNSwga3lyaWUud3Ug
aGEgc2NyaXR0bzoNCj4gPiBBZGQgYSBjb25maWd1cmF0aW9uIHRvIHNldCBqcGVnIGRlYyAmIGVu
YyBzbW11IHNpZA0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IGt5cmllLnd1IDxreXJpZS53dUBt
ZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+ID4gICAuLi4vcGxhdGZvcm0vbWVkaWF0ZWsvanBlZy9t
dGtfanBlZ19jb3JlLmMgICAgfCAgNiArKysrDQo+ID4gICAuLi4vcGxhdGZvcm0vbWVkaWF0ZWsv
anBlZy9tdGtfanBlZ19jb3JlLmggICAgfCAxMSArKysrKysrDQo+ID4gICAuLi4vcGxhdGZvcm0v
bWVkaWF0ZWsvanBlZy9tdGtfanBlZ19kZWNfaHcuYyAgfCAzMA0KPiA+ICsrKysrKysrKysrKysr
KysrLS0NCj4gPiAgIC4uLi9wbGF0Zm9ybS9tZWRpYXRlay9qcGVnL210a19qcGVnX2RlY19ody5o
ICB8ICA0ICsrKw0KPiA+ICAgLi4uL3BsYXRmb3JtL21lZGlhdGVrL2pwZWcvbXRrX2pwZWdfZW5j
X2h3LmMgIHwgMjYNCj4gPiArKysrKysrKysrKysrKysrDQo+ID4gICAuLi4vcGxhdGZvcm0vbWVk
aWF0ZWsvanBlZy9tdGtfanBlZ19lbmNfaHcuaCAgfCAgNCArKysNCj4gPiAgIDYgZmlsZXMgY2hh
bmdlZCwgNzggaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gPiANCj4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9qcGVnL210a19qcGVnX2NvcmUu
Yw0KPiA+IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9qcGVnL210a19qcGVnX2Nv
cmUuYw0KPiA+IGluZGV4IGMzY2NjNTI1ZDlmZC4uNzdiM2JkNmM0ZDNmIDEwMDY0NA0KPiA+IC0t
LSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvanBlZy9tdGtfanBlZ19jb3JlLmMN
Cj4gPiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL2pwZWcvbXRrX2pwZWdf
Y29yZS5jDQo+ID4gQEAgLTE2NTUsNiArMTY1NSw5IEBAIHN0YXRpYyB2b2lkIG10a19qcGVnZW5j
X3dvcmtlcihzdHJ1Y3QNCj4gPiB3b3JrX3N0cnVjdCAqd29yaykNCj4gPiAgICAgICBqcGVnX2Rz
dF9idWYtPmZyYW1lX251bSA9IGN0eC0+dG90YWxfZnJhbWVfbnVtOw0KPiA+ICAgICAgIGN0eC0+
dG90YWxfZnJhbWVfbnVtKys7DQo+ID4gICAgICAgbXRrX2pwZWdfZW5jX3Jlc2V0KGNvbXBfanBl
Z1tod19pZF0tPnJlZ19iYXNlKTsNCj4gPiArI2lmIElTX0VOQUJMRUQoQ09ORklHX0FSTV9TTU1V
X1YzKQ0KPiA+ICsgICAgIG10a19qcGVnX2VuY19zZXRfc21tdV9zaWQoaHdfaWQpOw0KPiA+ICsj
ZW5kaWYNCj4gPiAgICAgICBtdGtfanBlZ19zZXRfZW5jX2RzdChjdHgsDQo+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgY29tcF9qcGVnW2h3X2lkXS0+cmVnX2Jhc2UsDQo+ID4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgJmRzdF9idWYtPnZiMl9idWYpOw0KPiA+IEBAIC0xNzcxLDYg
KzE3NzQsOSBAQCBzdGF0aWMgdm9pZCBtdGtfanBlZ2RlY193b3JrZXIoc3RydWN0DQo+ID4gd29y
a19zdHJ1Y3QgKndvcmspDQo+ID4gICAgICAgc3Bpbl9sb2NrX2lycXNhdmUoJmNvbXBfanBlZ1to
d19pZF0tPmh3X2xvY2ssIGZsYWdzKTsNCj4gPiAgICAgICBjdHgtPnRvdGFsX2ZyYW1lX251bSsr
Ow0KPiA+ICAgICAgIG10a19qcGVnX2RlY19yZXNldChjb21wX2pwZWdbaHdfaWRdLT5yZWdfYmFz
ZSk7DQo+ID4gKyNpZiBJU19FTkFCTEVEKENPTkZJR19BUk1fU01NVV9WMykNCj4gDQo+IFlvdSBj
YW4gYXZvaWQgdXNpbmcgcHJlcHJvY2Vzc29yIGNvbmRpdGlvbmFscyAtIGFuZCB0aGVuLCB0aGlz
DQo+IGRvZXNuJ3QgbG9vayBsaWtlIGFuDQo+IEFSTSBTTU1VdjMgY29uZmlndXJhdGlvbiwgYnV0
IHJhdGhlciBhIEpQRUcgZGVjL2VuYyBIVyBjb25maWcsIHNvIGluDQo+IHRoYXQgY2FzZSB0aGUN
Cj4gZW5jbG9zaW5nIG9mIHRoaXMgaW4gdGhlIHByb3Bvc2VkIGNvbmZpZyBvcHRpb24gd291bGQg
ZXZlbiBiZSB3cm9uZy4NCj4gDQo+IFVzZSBwbGF0Zm9ybSBkYXRhIGZvciB0aGF0Lg0KPiANCj4g
PiArICAgICBtdGtfanBlZ19kZWNfc2V0X3NtbXVfc2lkKGh3X2lkKTsNCj4gPiArI2VuZGlmDQo+
ID4gICAgICAgbXRrX2pwZWdfZGVjX3NldF9jb25maWcoY29tcF9qcGVnW2h3X2lkXS0+cmVnX2Jh
c2UsDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAganBlZy0+dmFyaWFudC0+c3Vw
cG9ydF8zNGJpdCwNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmanBlZ19zcmNf
YnVmLT5kZWNfcGFyYW0sDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0v
bWVkaWF0ZWsvanBlZy9tdGtfanBlZ19jb3JlLmgNCj4gPiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZv
cm0vbWVkaWF0ZWsvanBlZy9tdGtfanBlZ19jb3JlLmgNCj4gPiBpbmRleCA4ZmRkYzEzM2M0NmMu
LmQzYWJhMWU2Y2FlOCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21l
ZGlhdGVrL2pwZWcvbXRrX2pwZWdfY29yZS5oDQo+ID4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0
Zm9ybS9tZWRpYXRlay9qcGVnL210a19qcGVnX2NvcmUuaA0KPiA+IEBAIC0zNiw2ICszNiwxNyBA
QA0KPiA+IA0KPiA+ICAgI2RlZmluZSBNVEtfSlBFR19BRERSX01BU0sgR0VOTUFTSygxLCAwKQ0K
PiA+IA0KPiA+ICsjaWYgSVNfRU5BQkxFRChDT05GSUdfQVJNX1NNTVVfVjMpDQo+ID4gKyNkZWZp
bmUgSlBHX1JFR19DT1JFMF9HVVNFUl9JRCAgICAgICAgICAgICAgICAgICAgICAgICAgMHgzODBk
MDAwMA0KPiA+ICsjZGVmaW5lIEpQR19SRUdfQ09SRTFfR1VTRVJfSUQgICAgICAgICAgICAgICAg
ICAgICAgICAgIDB4Mzg4ZDAwMDANCj4gDQo+IEF0IGxlYXN0IHRoZXNlIHR3byBkZWZpbml0aW9u
cyBzaGFsbCBnbyBpbiB0aGUgZGV2aWNldHJlZSByZWcgbm9kZS4NCj4gDQo+ID4gKyNkZWZpbmUg
SlBHX1JFR19HVVNFUl9JRF9NQVNLICAgICAgICAgICAgICAgICAgICAgICAgICAgMHg3DQo+ID4g
KyNkZWZpbmUgSlBHX1JFR19HVVNFUl9JRF9ERUNfU0lEICAgICAgICAgICAgICAgICAgICAgICAg
MHg0DQo+ID4gKyNkZWZpbmUgSlBHX1JFR19HVVNFUl9JRF9FTkNfU0lEICAgICAgICAgICAgICAg
ICAgICAgICAgMHg1DQo+ID4gKyNkZWZpbmUgSlBHX1JFR19ERUNfR1VTRVJfSURfU0hJRlQgICAg
ICAgICAgICAgICAgICAgICAgOA0KPiA+ICsjZGVmaW5lIEpQR19SRUdfRU5DX0dVU0VSX0lEX1NI
SUZUICAgICAgICAgICAgICAgICAgICAgIDQNCj4gDQo+IElmIHRoaXMgaXMgc2V0dGluZyBhbiBJ
T01NVSBTSUQsIHRoZW4geW91IGNhbiBqdXN0IHVzZSB0aGUgImlvbW11cyINCj4gcHJvcGVydHkN
Cj4gdG8gcGFzcyBhIGhhbmRsZSB0byB0aGUgSU9NTVUgdGhhdCB0aGlzIGRldmljZSBpcyB1c2lu
ZyBwbHVzIHRoZQ0KPiBzdHJlYW1pZCwNCj4gd2hpY2ggeW91IGNhbiByZXRyaWV2ZSBhbmQgd3Jp
dGUgdG8gdGhlIGd1c2VyX2lkX3tkZWMsZW5jfV9zaWQNCj4gcmVnaXN0ZXIuDQo+IA0KPiBUaGVy
ZSdzIG5vIHJlYXNvbiB0byBoYXJkY29kZSB0aGF0IGluIHRoaXMgaGVhZGVyLCBhbmQgYWN0dWFs
bHkNCj4gaGFyZGNvZGluZw0KPiB3aWxsIGdpdmUgeW91IGEgbnVtYmVyIG9mIGlzc3VlcyAoZXhh
bXBsZTogdW5wb3dlcmVkL3VuY2xvY2tlZCBhY2Nlc3MNCj4gdG8gdGhlDQo+IElPTU1VLCBhbmQg
bWFueSBvdGhlcnMpLg0KPiANCj4gPiArI2RlZmluZSBHVVNFUl9JRF9NQVBSQU5HRSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICA0DQo+ID4gKyNlbmRpZg0KPiA+ICsNCj4gPiAgIC8qKg0K
PiA+ICAgICogZW51bSBtdGtfanBlZ19jdHhfc3RhdGUgLSBzdGF0ZXMgb2YgdGhlIGNvbnRleHQg
c3RhdGUgbWFjaGluZQ0KPiA+ICAgICogQE1US19KUEVHX0lOSVQ6ICAgICAgICAgIGN1cnJlbnQg
c3RhdGUgaXMgaW5pdGlhbGl6ZWQNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0
Zm9ybS9tZWRpYXRlay9qcGVnL210a19qcGVnX2RlY19ody5jDQo+ID4gYi9kcml2ZXJzL21lZGlh
L3BsYXRmb3JtL21lZGlhdGVrL2pwZWcvbXRrX2pwZWdfZGVjX2h3LmMNCj4gPiBpbmRleCBkODY4
ZTQ2YWFmMzcuLmZhZGZjNGI1ZTM2NiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL21lZGlhL3Bs
YXRmb3JtL21lZGlhdGVrL2pwZWcvbXRrX2pwZWdfZGVjX2h3LmMNCj4gPiArKysgYi9kcml2ZXJz
L21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL2pwZWcvbXRrX2pwZWdfZGVjX2h3LmMNCj4gPiBAQCAt
Mjc0LDYgKzI3NCwzMiBAQCB2b2lkIG10a19qcGVnX2RlY19yZXNldCh2b2lkIF9faW9tZW0gKmJh
c2UpDQo+ID4gICB9DQo+ID4gICBFWFBPUlRfU1lNQk9MX0dQTChtdGtfanBlZ19kZWNfcmVzZXQp
Ow0KPiA+IA0KPiA+ICsjaWYgSVNfRU5BQkxFRChDT05GSUdfQVJNX1NNTVVfVjMpDQo+ID4gK3Zv
aWQgbXRrX2pwZWdfZGVjX3NldF9zbW11X3NpZChpbnQgaHdpZCkNCj4gPiArew0KPiA+ICsgICAg
IHZvaWQgX19pb21lbSAqZGVjX3JlZ19iYXNlOw0KPiA+ICsgICAgIHUzMiB2YWwsIG1hc2s7DQo+
ID4gKw0KPiA+ICsgICAgIGlmIChod2lkKQ0KPiA+ICsgICAgICAgICAgICAgZGVjX3JlZ19iYXNl
ID0gaW9yZW1hcChKUEdfUkVHX0NPUkUxX0dVU0VSX0lELA0KPiA+IEdVU0VSX0lEX01BUFJBTkdF
KTsNCj4gPiArICAgICBlbHNlDQo+ID4gKyAgICAgICAgICAgICBkZWNfcmVnX2Jhc2UgPSBpb3Jl
bWFwKEpQR19SRUdfQ09SRTBfR1VTRVJfSUQsDQo+ID4gR1VTRVJfSURfTUFQUkFOR0UpOw0KPiA+
ICsgICAgIGlmICghZGVjX3JlZ19iYXNlKSB7DQo+ID4gKyAgICAgICAgICAgICBkZXZfZXJyKGpw
ZWctPmRldiwgIkZhaWxlZCB0byBtYXAganBnZGVjDQo+ID4gSlBHX1JFR19HVVNFUl9JRFxuIik7
DQo+ID4gKyAgICAgICAgICAgICByZXR1cm47DQo+ID4gKyAgICAgfQ0KPiA+ICsNCj4gPiArICAg
ICB2YWwgPSBpb3JlYWQzMihkZWNfcmVnX2Jhc2UpOw0KPiA+ICsgICAgIG1hc2sgPSB+KEpQR19S
RUdfR1VTRVJfSURfTUFTSyA8PA0KPiA+IEpQR19SRUdfREVDX0dVU0VSX0lEX1NISUZUKTsNCj4g
PiArICAgICB2YWwgJj0gbWFzazsNCj4gPiArICAgICB2YWwgfD0gKEpQR19SRUdfR1VTRVJfSURf
REVDX1NJRCA8PA0KPiA+IEpQR19SRUdfREVDX0dVU0VSX0lEX1NISUZUKTsNCj4gPiArDQo+ID4g
KyAgICAgaW93cml0ZTMyKHZhbCwgZGVjX3JlZ19iYXNlKTsNCj4gPiArICAgICBpb3VubWFwKGRl
Y19yZWdfYmFzZSk7DQo+ID4gK30NCj4gPiArRVhQT1JUX1NZTUJPTF9HUEwobXRrX2pwZWdfZGVj
X3NldF9zbW11X3NpZCk7DQo+ID4gKyNlbmRpZg0KPiA+ICsNCj4gPiAgIHN0YXRpYyB2b2lkIG10
a19qcGVnX2RlY19zZXRfYnJ6X2ZhY3Rvcih2b2lkIF9faW9tZW0gKmJhc2UsIHU4DQo+ID4geXNj
YWxlX3csDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdTggeXNjYWxlX2gsIHU4
IHV2c2NhbGVfdywgdTgNCj4gPiB1dnNjYWxlX2gpDQo+ID4gICB7DQo+ID4gQEAgLTU1Miw3ICs1
NzgsNiBAQCBzdGF0aWMgaXJxcmV0dXJuX3QNCj4gPiBtdGtfanBlZ2RlY19od19pcnFfaGFuZGxl
cihpbnQgaXJxLCB2b2lkICpwcml2KQ0KPiA+ICAgICAgIHN0cnVjdCB2YjJfdjRsMl9idWZmZXIg
KnNyY19idWYsICpkc3RfYnVmOw0KPiA+ICAgICAgIHN0cnVjdCBtdGtfanBlZ19zcmNfYnVmICpq
cGVnX3NyY19idWY7DQo+ID4gICAgICAgZW51bSB2YjJfYnVmZmVyX3N0YXRlIGJ1Zl9zdGF0ZTsN
Cj4gPiAtICAgICBzdHJ1Y3QgbXRrX2pwZWdfY3R4ICpjdHg7DQo+ID4gICAgICAgdTMyIGRlY19p
cnFfcmV0Ow0KPiA+ICAgICAgIHUzMiBpcnFfc3RhdHVzOw0KPiA+ICAgICAgIGludCBpOw0KPiA+
IEBAIC01NjIsNyArNTg3LDYgQEAgc3RhdGljIGlycXJldHVybl90DQo+ID4gbXRrX2pwZWdkZWNf
aHdfaXJxX2hhbmRsZXIoaW50IGlycSwgdm9pZCAqcHJpdikNCj4gPiANCj4gPiAgICAgICBjYW5j
ZWxfZGVsYXllZF93b3JrKCZqcGVnLT5qb2JfdGltZW91dF93b3JrKTsNCj4gPiANCj4gPiAtICAg
ICBjdHggPSBqcGVnLT5od19wYXJhbS5jdXJyX2N0eDsNCj4gPiAgICAgICBzcmNfYnVmID0ganBl
Zy0+aHdfcGFyYW0uc3JjX2J1ZmZlcjsNCj4gPiAgICAgICBkc3RfYnVmID0ganBlZy0+aHdfcGFy
YW0uZHN0X2J1ZmZlcjsNCj4gPiAgICAgICB2NGwyX20ybV9idWZfY29weV9tZXRhZGF0YShzcmNf
YnVmLCBkc3RfYnVmLCB0cnVlKTsNCj4gPiBAQCAtNTg1LDcgKzYwOSw3IEBAIHN0YXRpYyBpcnFy
ZXR1cm5fdA0KPiA+IG10a19qcGVnZGVjX2h3X2lycV9oYW5kbGVyKGludCBpcnEsIHZvaWQgKnBy
aXYpDQo+ID4gICAgICAgYnVmX3N0YXRlID0gVkIyX0JVRl9TVEFURV9ET05FOw0KPiA+ICAgICAg
IHY0bDJfbTJtX2J1Zl9kb25lKHNyY19idWYsIGJ1Zl9zdGF0ZSk7DQo+ID4gICAgICAgbXRrX2pw
ZWdkZWNfcHV0X2J1ZihqcGVnKTsNCj4gPiAtICAgICBwbV9ydW50aW1lX3B1dChjdHgtPmpwZWct
PmRldik7DQo+ID4gKyAgICAgcG1fcnVudGltZV9wdXQoanBlZy0+ZGV2KTsNCj4gDQo+IFlvdSdy
ZSBkb2luZyBtb3JlIHRoYW4gd2hhdCB5b3UncmUgZGVzY3JpYmluZyBpbiB0aGUgY29tbWl0IHRp
dGxlIGFuZA0KPiBkZXNjcmlwdGlvbi4NCj4gDQo+IElmIHRoaXMgY2hhbmdlIHdhcyBpbnRlbnRp
b25hbCwgcGxlYXNlIG1vdmUgaXQgdG8gYSBkaWZmcmVudCBjb21taXQuDQo+IA0KPiBSZWdhcmRz
LA0KPiBBbmdlbG8NCg0KRGVhciBBbmdlbG8sDQoNClRoYW5rcyBmb3IgeW91ciBjb21tZW50cywg
bGV0J3MgaGF2ZSBhIHN1bW1hcnkgZm9yIHRoZW06DQoxLiBhZGQgc21tdSBjb25maWcgZW5hbGJp
bmcgZmxhZyBpbiBwbGF0Zm9ybSBkYXRhLg0KMi4gbW92ZSB0aGUgaHcgc21tdSBzZXR0aW5nIHRv
IGRldmljZXRyZWUgYW5kIGdldCBpdCBpbiBwcm9iZSBmdW5jLg0KMy4gcmVmaW5lIHRoZSBwYXRj
aC4NCg0KSSB3aWxsIGZpeCBpdGhlbS4NCg0KVGhhbmtzLg0KDQpSZWdhcmRzLA0KS3lyaWUuDQoN
Cg==

