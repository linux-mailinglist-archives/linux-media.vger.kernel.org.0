Return-Path: <linux-media+bounces-39562-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F20B2233B
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 11:33:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA6041885179
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 09:29:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A793D2E9726;
	Tue, 12 Aug 2025 09:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XnlFYZqd"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013039.outbound.protection.outlook.com [40.107.162.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70912E888C;
	Tue, 12 Aug 2025 09:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754990964; cv=fail; b=Z5w/N3kuaV3dp9D8Nuzs0U2OKIRncrylaIrJmruYU/XndFZwciy2EmAW//T2ulXCS1t9ATB0y08TkWaUqc19GE5ZgKegslAAVKVx1oS0pX6YqfhlBXC5ZDKxqU9sH5xYjxua+5ztVsvdf2PUAxtryX65LkM0SxPS3ds4aJX1sx0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754990964; c=relaxed/simple;
	bh=RU/c4PZdAB/iLaHBBZca0IZh9t9LauyBWbT4T8tnG3k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=f8Hjz2nrGc7xbmHUrKHAjlUmtOm/QixrkwTWrZcJIMxV7rq3NotQ1F8lKLZ2Hg7Ax5jHHRVLvSqFHah4gdj2VNAZIk3Yiy11CRmQ0x/8ng56h8gg8rdgKN7l2BdpGRf7YyJn2/yFzIbyWXOxFmpatnAvTndwJqnGi97gnH2miFs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XnlFYZqd; arc=fail smtp.client-ip=40.107.162.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=adbgUgyU9DpSuZihHebswdpUq4v/4ye/HF7gKf93JQIEIvXDU74inW06vlTti24bNbdcy/FlJ3OpWHEZJ++79B1KYc3k8ALhtsPdG/sdU8vVsa3roR+sVgdSsqx+lDF2wmDwhZXc3Kc9uyjvVcFYssVV6HlFJJEoOLxbfAXxxkUmixS2mK8kmoQMrGskNvysqSNTX4vqQxX8mIJnOWgRLwkTCLSSg7tZGo62TqpVaUBMuKY4nbEd2PeSPJQ3r04NEhEP+kmNnwIO1+bLMmy+nXc61yTwN7HQrHdqi093QbF3Kzyovhsjd0zknBmcnW9A4Mq386cBh5bhf56lQ4bG6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RU/c4PZdAB/iLaHBBZca0IZh9t9LauyBWbT4T8tnG3k=;
 b=yRI5+1P/XHkd1FRDryLZXoy6bT0JTH95HJ/CJPPwhyH8+1EQe5PG74Ynt+zHb+XOl++WHH1+RP7fg1dJ8ilAFLC1PGp1RLAm/CVIrAP0FOA9DdtCECAzQs8st3jkKuzb9i2rGCKCPRQ+YTxhlpp/tqxDxv2epvoCvebLPGc+RvPSmTn0ZxwAYfR0UoE+t+0smwVKRauBpIFk+BWmzYKPTFeHFcEx68au9VzpJmxQdIlT8nEhe/JKHuKlC4tVAygke4+2CIwLRMJYt4fxQuOd3TnhdRKYJ5Ce4n2gf1Dbl7DLdL9Gf0APd8QTW6WXz8YzQOQyXml3uATP51KIpKRy9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RU/c4PZdAB/iLaHBBZca0IZh9t9LauyBWbT4T8tnG3k=;
 b=XnlFYZqdiRSvqPtbEQ5LO3X3jHsA4pPEQ+CCVBH9VFtWlBbMh7HyxZKTDnHPeU7Db51RXvT3YTPnx5Vb0FC5r8yyhHAD0LBbEojXty0cKlJMjGj78b4+8jBbZiKttQMs8VSz+hxiB+LjaFVps89UM1G5ZOo560XRpWGu1Rv8bVtCELqXL9eRJfbpZ0yXYM73lvbB50TtKtEz5eObY2SRRumtDKyVlNorZVS5XuecmB6dQloPwFq7o4KulwjNOHuswIufqSOTsygV9p8mpIntKJguBHYRZsr+r2z2dgnRXyeH4+i2ykA7Bh8oHnhlEHjHawWtHkV7Izor/ZQo61cTDg==
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by GV1PR04MB10967.eurprd04.prod.outlook.com (2603:10a6:150:203::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.13; Tue, 12 Aug
 2025 09:29:17 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.9031.012; Tue, 12 Aug 2025
 09:29:17 +0000
From: "G.N. Zhou" <guoniu.zhou@nxp.com>
To: "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, "rmfrfs@gmail.com" <rmfrfs@gmail.com>,
	"martink@posteo.de" <martink@posteo.de>, "kernel@puri.sm" <kernel@puri.sm>,
	"mchehab@kernel.org" <mchehab@kernel.org>
CC: "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Frank Li <frank.li@nxp.com>
Subject: RE: [PATCH] media: nxp: imx8-isi: Add suspend/resume support for ISI
 mem2mem
Thread-Topic: [PATCH] media: nxp: imx8-isi: Add suspend/resume support for ISI
 mem2mem
Thread-Index: AQHb9sRLGkrKAAD5PE+pdxmIcoX/drRe6Pqg
Date: Tue, 12 Aug 2025 09:29:17 +0000
Message-ID:
 <AS8PR04MB90805590BB4501F7F4289624FA2BA@AS8PR04MB9080.eurprd04.prod.outlook.com>
References: <20250717024353.1811576-1-guoniu.zhou@oss.nxp.com>
In-Reply-To: <20250717024353.1811576-1-guoniu.zhou@oss.nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9080:EE_|GV1PR04MB10967:EE_
x-ms-office365-filtering-correlation-id: d01e88b6-77dc-40ee-e13e-08ddd982b5e5
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VytHd2JDNlF5RTZiNWdzRTJZdnRvWThVa0JGU25hNzAyTTVxaUdhRXhXOVFo?=
 =?utf-8?B?eUlHd0dFRnZ6VklrVHo2Q3FoYTZaZTMxSE5pdHJaK3NYYjBIVnJVYUZOcHdX?=
 =?utf-8?B?T3RCQnZwczNleVdMZ3RaUUFlM1FKWWhrQXpudGltOWttSHdZdVo4Sk4zUkZp?=
 =?utf-8?B?TnNFMEEvZUpxNFY4KzV6Ump5bU9WZ3NIdnNHUU5hTWRzUlNPcGJ2UmR6YVhu?=
 =?utf-8?B?T1JGTlpLKzdXWkhUSnFRbG1taXVkaktHU1h3OXlpd1pQdWhkSVZmVGpyd3Nt?=
 =?utf-8?B?UVlnd3Fvam5qQ0RSSmc2YzVxUTdQenM2aERxYzJFMXhYSVI4LzVJSzhLR2VS?=
 =?utf-8?B?bHBzK2w1TUFYaVFuZmNMTEhaZ1lZZjdDb0dXY3U2YUhDSWJLYXF6WlFkUVZm?=
 =?utf-8?B?R0tLTjFtZ3NOZDBaNjkxVVoyRWlCVWdDYUUxNzNGS04xVDBMRFl5OUJrTzk1?=
 =?utf-8?B?VURHZ3F6SHhxMUVHcEdxSXlMTnA4SGRYdTd6UU41bWN4UEtrOEFDWS9LMnk2?=
 =?utf-8?B?OSs1VXh5NzdRcWlvQ3BnbCs1THNaOHgxQlRKSWpSV1V3TzQwdHgwUlZUR0ds?=
 =?utf-8?B?Z0Yrd3NjYUNzOFpJMGVKVkprTWlidGFvUkdJdHF5dk1aMnBadmYyRWJReTIr?=
 =?utf-8?B?UnNBZTVLdUtSV2FuZG1MTkhuZnNJTmcxYlgvY056bzY3akUzQjgwanlBNmcr?=
 =?utf-8?B?Yk83SFJMVE9NRjFiQktjbytabTNON2dEb29Xb3hzVWQxWGlCY3d1LzhwWVJV?=
 =?utf-8?B?SEZVKzkzMlE3djNMbWZnMkhTdGRHSUMzQUczL0poaW9QSWQ2VDArRGRwOWQx?=
 =?utf-8?B?c0JDZ1ZMNytaS0g2cUZZZ2cwcFcvN2NraG1jVUV2YlZOQjJYdlhmS2puaDk3?=
 =?utf-8?B?TTVKS1cwcENTYnRoclUzRUZFbVRKeHNEczc4bk5STlNLbU1kTlNRWEllZ3Ay?=
 =?utf-8?B?MjMyVlUrUUFkbHpiYXoyVGtJRFpLQlNNMmJaeXpsbDhQMlN6NkNFbSt1dUxW?=
 =?utf-8?B?WHl1R2tzRVBhcDZtRXZnalFYL1NlZzBHV1NsNlZvRXIvKzBkZ2NZT0dUdU9F?=
 =?utf-8?B?OGlJWWh5TFFSS0xFMk1RSGVtWHQ3R0dhY1VyeFduM0Y2dFZwQU5XUnE5MlVU?=
 =?utf-8?B?Vy9XdWZzMkRIZFdUNGhyc1J6L0VoVVo1RjVUYWs2ajFERXBlRVZmYkRZUmdO?=
 =?utf-8?B?OTZCbXY5VlpOc1NNM1ExcU90ZzliYXNvWDhqZ0hwczlncG5LWW9kRVZLb1FQ?=
 =?utf-8?B?RFlaTmdGQTJjV3h2UHh0Qm1yZi81M05rM1pWbHZob3p4cFdFM0NrREJqTkpy?=
 =?utf-8?B?a1pkUm1KR0JZS2w0N0FBa2I0K0ZCSVI3VXMwRmNFZEpwTjFEemN4WWFrVlE5?=
 =?utf-8?B?WHZXc0srbXp2Q3ZwK0xHVWNnRWVzbTZOSW1rL0NNZGYvN3MxSTRtSkNPQTNq?=
 =?utf-8?B?NmdwbVdxZWNwS3p5UVlua2FqWGJ5ZG1rMlZaeWJLNVI3YjdGYlVBMWxacFdR?=
 =?utf-8?B?RGJObEtYcWpDZjZLS0tFUVI4VjkxaTFLMk03dVhtU3g2bXJjNkY5NythaXA1?=
 =?utf-8?B?SlNwRUNRL1JrUkZCNmR3QWJDQmhhSWJIb3NPWnJNL2hjR21UZ3d2Y0QwdC84?=
 =?utf-8?B?TjBBY3d5bDFCRjZRZERiSS80REE4NEJJTklITmhKZEdYcWk2dGF3aEpMOGls?=
 =?utf-8?B?dnRmWWFOTld5UGczL3VQWmc1N3ZGbHp1Nk1vYlpGTlIrVnhlem5ET0V6eGs3?=
 =?utf-8?B?U2NMRjhWajdqdU9QcHZSUFdMSjZJbVhRUkUxd2wwSmdZaDl5Ly9nazFidTUw?=
 =?utf-8?B?NWt6ZFl6Y0dMS2doZjJ5RDlqSTNFZVNOVXZxNmh3a3FINmZxU0xvSUNzSEZt?=
 =?utf-8?B?ckJROUh0WE9XcGZ6ZTU3MWo3Ky85cWdOaC9VZDhNZWh0ckhKdWl4dUp2Yk83?=
 =?utf-8?B?bk1OYXU5N0wvdjk2QmhNQkJlRlJIUXo5RDRKWGY5Uk1UcWUrem9RK2w3WitI?=
 =?utf-8?Q?pq1YHtMQCBpBDdAp5yhIC26GhQ+VhQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Vm4reWp4RTFtU0JuWFAzbm9YR3p4VktMa2VVZGVvdm5zNjZQTG40TXJqZUNi?=
 =?utf-8?B?WGYwaWNDNG5NY2t2MUYveTQzTHk4d0ZMVW0zZWVtQnJxcXBtLzRSbk1nazYx?=
 =?utf-8?B?U1FxQUgyNktOMkdtVTBPdERtTEFLamo3QndwTTlpdUlyVnlsdk5Hbkg0dm5Y?=
 =?utf-8?B?N1lrZmNWRGlZMHNEak9PMUVCZmtDOFFvR3hGajdXUjFVS0NjREpwT0lPa2FS?=
 =?utf-8?B?b3RBM1Vka3dCM3UwRFJLd3R2UzZUY2tON2ZvV1dDNVdVQzVxMEJjdjV4clRI?=
 =?utf-8?B?Ui9EN2F6RjViRTZIdm5pTlFzbWpLd3dhNTZkNUo5eERNUXZ4RG9iUXovTkZV?=
 =?utf-8?B?YWZKYm5vZUJjSmxkZ00zczRUTzNJdzdjOVM2RUtwNU1kVkY2N1NtTTBucnVW?=
 =?utf-8?B?eTBUMlZ4M1RYRFRwMElITHlOaUxkZU1VNnJvMnNsN0t2a3hRcm92Tno0c0dK?=
 =?utf-8?B?bXlhVEExTzJwS0tJWFMrTnl1djJHMHhja3hSUkhuTlpzVDlLL1U3NWdmeUpS?=
 =?utf-8?B?NkRITWxQRGV0Y1BjaUlnOTVrcHVzOFcyS0t4ZXNXUUROZUpGTWR5U0Z1RWE4?=
 =?utf-8?B?N0VYdmc5STlDeE90MForcHVXVXpnRnpFcW5yNDdsc1ZQYnFDU1hWcit3UFZx?=
 =?utf-8?B?M1E2cXVlVVUwdFVuUVpoRFhDL0J0ZW82ZzJQVzJiTzE2MVI2Zyt5STc1U0FN?=
 =?utf-8?B?bURCNFlEN1AvbTI3NW9kZXhFUnBpU281dnNYZHNjSzJyZUJTL3lBeFZxWklq?=
 =?utf-8?B?bHcxTGtNb09MTWc3NGo3QlpQbEZSWGQvVHdFV1p4Qzl1RGdaa1p4NVZScEdP?=
 =?utf-8?B?am1TbjhOaG54MGxNMmpMb3pSTnU3WmladDgwZkNYS3k2blg3dS9JdVp1WDEv?=
 =?utf-8?B?ZW9TYlZUb2xkQ1JudkZWVWM5bFdpNldOaHpMZWFZbWRmWEIveU1DRFU3ZzRu?=
 =?utf-8?B?aVNwWFBseVJVcW42SE9lSDRxQ0lZcG8zVmU4SFhYQXBhNGtPMTY4VHpxMnkx?=
 =?utf-8?B?djJmNlR6L3VLcDRhMHJvN3dKcERoZlV5L2NJdGR0SUI0ZEYxWkNqb1JKcnpr?=
 =?utf-8?B?RkQ0L3h0U0F4RzdVUXJQSkx5S05hT1Q4YWkwYzZoK0FIdUV1VTNGZmFvZ3M0?=
 =?utf-8?B?cHB3R3cvRTl1MmJUQW55aC9yUndwcEg3Q09yTVFJRkZVdEN4NmpuaHFORjV5?=
 =?utf-8?B?aUtsck5Nc3c5ZWVCTmhKRGswSEdSM01pdEh2bmpiMWV5SU05MjVEazdzM2VM?=
 =?utf-8?B?STE2dGRncEhScEMyWmhFS1hGckdBQndNcXhPTEE4Tk5nMmVtWnlHeXZiWXNB?=
 =?utf-8?B?RXF2akRRYkhJOG1EMmpkc1JnM2ZPTUMyTlZiYXlYRXpBazdvc3VpWkFiaG5P?=
 =?utf-8?B?Z05DdVJ2MEFMbkY0eS9KSkVOZW0vWVIxOVFINGx2OUUrRzlQYnBlVExaQmNx?=
 =?utf-8?B?UGxXdnlhZi8zUVBYNEozOFk3Sit2Q3RsWDRqMjVsVW9ISVhtL1BNWGl0MnNN?=
 =?utf-8?B?NWdQSDhlckJjZEtJZXBWKzhDREcvdlkxZDJ1SmdSM3BqUEFNaXVTcnRHQXZP?=
 =?utf-8?B?dGpSQmtFZ0k0KzdabmYwWWV2alJTWmhpYTdSZUM5dW5HVytKSlhlTFB6WUpL?=
 =?utf-8?B?ZVpteXU3cmpJL3dxcW84Rm9jYUdhWTROQllxZEdIRTZlckE1RzZJQXRkSFNI?=
 =?utf-8?B?VzBJUnRndFlna2k5R3JJSHFqcFlsQUJvZHJYVUxMQURybTY2aFZyTVB2Ukhi?=
 =?utf-8?B?bFpqQlk2RWt1bWRwVWpiVUt3OVh2dnR2OUNxZzc2bGNSK3U5ODAzSE9HTkVC?=
 =?utf-8?B?djg3cnRBNEdnSUJFRnlaOWN1dVRWV3I0Z3gzQXI3QU1CbVZuVlh0aTErdC9H?=
 =?utf-8?B?OW0yRUdiY2xmaTNmQlZLNkZ6Y2gyanNXb2V4VG5pZUxkOUwzZnBWellXZ3o1?=
 =?utf-8?B?bTFHRGZoZUZxYjI2UVI4RGRCaU5TcXVpMjBqUHJUdCs5S3I2ZVptcXREdHRD?=
 =?utf-8?B?QUJBc0pVL0czTlFrdmZ4SCtIdmdxbTQzWWx5Q08rblVWREpPNzdnUEl1YTVR?=
 =?utf-8?B?RzlPY1BlbWIvTTNMZGJhdnNGUmpCOXRRYW9VeEhZbURLY1JaTk4xUHNPR2JI?=
 =?utf-8?Q?5Xe/8bhz1Qw9znPo/Sb+E0l9A?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d01e88b6-77dc-40ee-e13e-08ddd982b5e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2025 09:29:17.6562
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oSdH588U4ZTF3zJZCLIZ7rRiOiR9o4O+G1xc5qCcAYUHXeFvUCqP91O4k/UUAmQbFeUnN7qrejdS/t5DXdUEFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10967

SGksDQoNCkNvdWxkIHlvdSBoZWxwIHRvIHBsZWFzZSByZXZpZXcgdGhlIHBhdGNoZXMgd2hpY2gg
SSBoYXZlIHN1Ym1pdHRlZCBzb21lIHRpbWUgYmFjayB0byBsaW51eCBtZWRpYSBjb21tdW5pdHku
DQpZb3VyIGZlZWRiYWNrIHdpbGwgYmUgdmVyeSBhcHByZWNpYXRlZC4gVGhhbmtzLg0KDQpCZXN0
IFJlZ2FyZHMNCkcuTiBaaG91DQoNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBG
cm9tOiBHLk4uIFpob3UgKE9TUykNCj4gU2VudDogVGh1cnNkYXksIEp1bHkgMTcsIDIwMjUgMTA6
NDEgQU0NCj4gVG86IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJv
YXJkLmNvbT47DQo+IHJtZnJmc0BnbWFpbC5jb207IG1hcnRpbmtAcG9zdGVvLmRlOyBrZXJuZWxA
cHVyaS5zbTsNCj4gbWNoZWhhYkBrZXJuZWwub3JnDQo+IENjOiBzLmhhdWVyQHBlbmd1dHJvbml4
LmRlOyBrZXJuZWxAcGVuZ3V0cm9uaXguZGU7IGZlc3RldmFtQGdtYWlsLmNvbTsNCj4gbGludXgt
bWVkaWFAdmdlci5rZXJuZWwub3JnOyBpbXhAbGlzdHMubGludXguZGV2OyBsaW51eC1hcm0tDQo+
IGtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3Jn
DQo+IFN1YmplY3Q6IFtQQVRDSF0gbWVkaWE6IG54cDogaW14OC1pc2k6IEFkZCBzdXNwZW5kL3Jl
c3VtZSBzdXBwb3J0IGZvciBJU0kNCj4gbWVtMm1lbQ0KPiANCj4gRnJvbTogR3Vvbml1IFpob3Ug
PGd1b25pdS56aG91QG54cC5jb20+DQo+IA0KPiBBZGQgc3VzcGVuZC9yZXN1bWUgc3VwcG9ydCBm
b3IgSVNJIHdoZW4gd29yayBhdCBtZW1vcnkgdG8gbWVtb3J5IG1vZGUuDQo+IA0KPiBTaWduZWQt
b2ZmLWJ5OiBHdW9uaXUgWmhvdSA8Z3Vvbml1Lnpob3VAbnhwLmNvbT4NCj4gLS0tDQo+ICAuLi4v
cGxhdGZvcm0vbnhwL2lteDgtaXNpL2lteDgtaXNpLWNvcmUuYyAgICAgfCAgOCArKysrDQo+ICAu
Li4vcGxhdGZvcm0vbnhwL2lteDgtaXNpL2lteDgtaXNpLWNvcmUuaCAgICAgfCAxMSArKysrKw0K
PiAgLi4uL3BsYXRmb3JtL254cC9pbXg4LWlzaS9pbXg4LWlzaS1tMm0uYyAgICAgIHwgNDggKysr
KysrKysrKysrKysrKysrKw0KPiAgMyBmaWxlcyBjaGFuZ2VkLCA2NyBpbnNlcnRpb25zKCspDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9ueHAvaW14OC1pc2kvaW14
OC1pc2ktY29yZS5jDQo+IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9ueHAvaW14OC1pc2kvaW14
OC1pc2ktY29yZS5jDQo+IGluZGV4IDk4MTY0OGEwMzExMy4uNmVlZjQ1MzAyZTZjIDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL254cC9pbXg4LWlzaS9pbXg4LWlzaS1jb3Jl
LmMNCj4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9ueHAvaW14OC1pc2kvaW14OC1pc2kt
Y29yZS5jDQo+IEBAIC0zNzIsNiArMzcyLDcgQEAgc3RhdGljIGludCBteGNfaXNpX3BtX3N1c3Bl
bmQoc3RydWN0IGRldmljZSAqZGV2KQ0KPiAgCQlzdHJ1Y3QgbXhjX2lzaV9waXBlICpwaXBlID0g
JmlzaS0+cGlwZXNbaV07DQo+IA0KPiAgCQlteGNfaXNpX3ZpZGVvX3N1c3BlbmQocGlwZSk7DQo+
ICsJCW14Y19pc2lfbTJtX3N1c3BlbmQocGlwZSk7DQo+ICAJfQ0KPiANCj4gIAlyZXR1cm4gcG1f
cnVudGltZV9mb3JjZV9zdXNwZW5kKGRldik7DQo+IEBAIC00MDEsNiArNDAyLDEzIEBAIHN0YXRp
YyBpbnQgbXhjX2lzaV9wbV9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQ0KPiAgCQkJICovDQo+
ICAJCQllcnIgPSByZXQ7DQo+ICAJCX0NCj4gKw0KPiArCQlyZXQgPSBteGNfaXNpX20ybV9yZXN1
bWUocGlwZSk7DQo+ICsJCWlmIChyZXQpIHsNCj4gKwkJCWRldl9lcnIoZGV2LCAiRmFpbGVkIHRv
IHJlc3VtZSBJU0kldSAoJWQpIGZvciBtMm1cbiIsDQo+IGksDQo+ICsJCQkJcmV0KTsNCj4gKwkJ
CWVyciA9IHJldDsNCj4gKwkJfQ0KPiAgCX0NCj4gDQo+ICAJcmV0dXJuIGVycjsNCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbnhwL2lteDgtaXNpL2lteDgtaXNpLWNvcmUu
aA0KPiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbnhwL2lteDgtaXNpL2lteDgtaXNpLWNvcmUu
aA0KPiBpbmRleCAyMDY5OTViZWRjYTQuLmI5NzliNzliNTUyNSAxMDA2NDQNCj4gLS0tIGEvZHJp
dmVycy9tZWRpYS9wbGF0Zm9ybS9ueHAvaW14OC1pc2kvaW14OC1pc2ktY29yZS5oDQo+ICsrKyBi
L2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbnhwL2lteDgtaXNpL2lteDgtaXNpLWNvcmUuaA0KPiBA
QCAtMzQzLDYgKzM0Myw4IEBAIGludCBteGNfaXNpX3ZpZGVvX2J1ZmZlcl9wcmVwYXJlKHN0cnVj
dCBteGNfaXNpX2Rldg0KPiAqaXNpLCBzdHJ1Y3QgdmIyX2J1ZmZlciAqdmIyICAjaWZkZWYgQ09O
RklHX1ZJREVPX0lNWDhfSVNJX00yTSAgaW50DQo+IG14Y19pc2lfbTJtX3JlZ2lzdGVyKHN0cnVj
dCBteGNfaXNpX2RldiAqaXNpLCBzdHJ1Y3QgdjRsMl9kZXZpY2UgKnY0bDJfZGV2KTsNCj4gaW50
IG14Y19pc2lfbTJtX3VucmVnaXN0ZXIoc3RydWN0IG14Y19pc2lfZGV2ICppc2kpOw0KPiArdm9p
ZCBteGNfaXNpX20ybV9zdXNwZW5kKHN0cnVjdCBteGNfaXNpX3BpcGUgKnBpcGUpOyBpbnQNCj4g
K214Y19pc2lfbTJtX3Jlc3VtZShzdHJ1Y3QgbXhjX2lzaV9waXBlICpwaXBlKTsNCj4gICNlbHNl
DQo+ICBzdGF0aWMgaW5saW5lIGludCBteGNfaXNpX20ybV9yZWdpc3RlcihzdHJ1Y3QgbXhjX2lz
aV9kZXYgKmlzaSwNCj4gIAkJCQkgICAgICAgc3RydWN0IHY0bDJfZGV2aWNlICp2NGwyX2Rldikg
QEAgLTM1Myw2DQo+ICszNTUsMTUgQEAgc3RhdGljIGlubGluZSBpbnQgbXhjX2lzaV9tMm1fdW5y
ZWdpc3RlcihzdHJ1Y3QgbXhjX2lzaV9kZXYgKmlzaSkNCj4gew0KPiAgCXJldHVybiAwOw0KPiAg
fQ0KPiArDQo+ICtzdGF0aWMgaW5saW5lIHZvaWQgbXhjX2lzaV9tMm1fc3VzcGVuZChzdHJ1Y3Qg
bXhjX2lzaV9waXBlICpwaXBlKSB7IH0NCj4gKw0KPiArc3RhdGljIGlubGluZSBpbnQgbXhjX2lz
aV9tMm1fcmVzdW1lKHN0cnVjdCBteGNfaXNpX3BpcGUgKnBpcGUpIHsNCj4gKwlyZXR1cm4gMDsN
Cj4gK30NCj4gICNlbmRpZg0KPiANCj4gIGludCBteGNfaXNpX2NoYW5uZWxfYWNxdWlyZShzdHJ1
Y3QgbXhjX2lzaV9waXBlICpwaXBlLCBkaWZmIC0tZ2l0DQo+IGEvZHJpdmVycy9tZWRpYS9wbGF0
Zm9ybS9ueHAvaW14OC1pc2kvaW14OC1pc2ktbTJtLmMNCj4gYi9kcml2ZXJzL21lZGlhL3BsYXRm
b3JtL254cC9pbXg4LWlzaS9pbXg4LWlzaS1tMm0uYw0KPiBpbmRleCAyMmU0OWQzYTEyODcuLmZl
OWQ4NTMzNWI2YyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9ueHAvaW14
OC1pc2kvaW14OC1pc2ktbTJtLmMNCj4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9ueHAv
aW14OC1pc2kvaW14OC1pc2ktbTJtLmMNCj4gQEAgLTczMiw2ICs3MzIsNTQgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCB2NGwyX2ZpbGVfb3BlcmF0aW9ucw0KPiBteGNfaXNpX20ybV9mb3BzID0gew0K
PiAgCS5tbWFwCQk9IHY0bDJfbTJtX2ZvcF9tbWFwLA0KPiAgfTsNCj4gDQo+ICsvKg0KPiArLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0NCj4gKy0tLS0tLQ0KPiArICogU3VzcGVuZCAmIHJlc3VtZQ0KPiArICovDQo+
ICsNCj4gK3ZvaWQgbXhjX2lzaV9tMm1fc3VzcGVuZChzdHJ1Y3QgbXhjX2lzaV9waXBlICpwaXBl
KSB7DQo+ICsJc3RydWN0IG14Y19pc2lfbTJtICptMm0gPSAmcGlwZS0+aXNpLT5tMm07DQo+ICsJ
c3RydWN0IG14Y19pc2lfbTJtX2N0eCAqY3R4ID0gbTJtLT5sYXN0X2N0eDsNCj4gKw0KPiArCS8q
DQo+ICsJICogQ2hlY2sgcGlwZSBmb3IgSVNJIG1lbW9yeSB0byBtZW1vcnkgc2luY2Ugb25seQ0K
PiArCSAqIGNoYW5uZWwgMCBzdXBwb3J0IHRoaXMgZmVhdHVyZS4NCj4gKwkgKi8NCj4gKwlpZiAo
bTJtLT5waXBlICE9IHBpcGUgfHwgbTJtLT51c2FnZV9jb3VudCA9PSAwKQ0KPiArCQlyZXR1cm47
DQo+ICsNCj4gKwl2NGwyX20ybV9zdXNwZW5kKG0ybS0+bTJtX2Rldik7DQo+ICsNCj4gKwlpZiAo
Y3R4LT5jaGFpbmVkKQ0KPiArCQlteGNfaXNpX2NoYW5uZWxfdW5jaGFpbihwaXBlKTsNCj4gKw0K
PiArCW14Y19pc2lfY2hhbm5lbF9kaXNhYmxlKHBpcGUpOw0KPiArCW14Y19pc2lfY2hhbm5lbF9w
dXQocGlwZSk7DQo+ICt9DQo+ICsNCj4gK2ludCBteGNfaXNpX20ybV9yZXN1bWUoc3RydWN0IG14
Y19pc2lfcGlwZSAqcGlwZSkgew0KPiArCXN0cnVjdCBteGNfaXNpX20ybSAqbTJtID0gJnBpcGUt
PmlzaS0+bTJtOw0KPiArCXN0cnVjdCBteGNfaXNpX20ybV9jdHggKmN0eCA9IG0ybS0+bGFzdF9j
dHg7DQo+ICsNCj4gKwkvKg0KPiArCSAqIENoZWNrIHBpcGUgZm9yIElTSSBtZW1vcnkgdG8gbWVt
b3J5IHNpbmNlIG9ubHkNCj4gKwkgKiBjaGFubmVsIDAgc3VwcG9ydCB0aGlzIGZlYXR1cmUuDQo+
ICsJICovDQo+ICsJaWYgKG0ybS0+cGlwZSAhPSBwaXBlIHx8IG0ybS0+dXNhZ2VfY291bnQgPT0g
MCkNCj4gKwkJcmV0dXJuIDA7DQo+ICsNCj4gKwlteGNfaXNpX2NoYW5uZWxfZ2V0KHBpcGUpOw0K
PiArDQo+ICsJaWYgKGN0eC0+Y2hhaW5lZCkNCj4gKwkJbXhjX2lzaV9jaGFubmVsX2NoYWluKHBp
cGUsIGZhbHNlKTsNCj4gKw0KPiArCW0ybS0+bGFzdF9jdHggPSBOVUxMOw0KPiArCXY0bDJfbTJt
X3Jlc3VtZShtMm0tPm0ybV9kZXYpOw0KPiArDQo+ICsJcmV0dXJuIDA7DQo+ICt9DQo+ICsNCj4g
IC8qIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICAgKiBSZWdpc3RyYXRpb24NCj4gICAqLw0KPiAt
LQ0KPiAyLjM0LjENCg0K

