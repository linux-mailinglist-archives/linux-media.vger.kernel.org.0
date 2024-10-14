Return-Path: <linux-media+bounces-19557-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD1399C4C4
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 11:07:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E45BF1F2127C
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 09:07:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 418E0157E88;
	Mon, 14 Oct 2024 09:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="BH8sXBRK"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2082.outbound.protection.outlook.com [40.107.22.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE93715575B;
	Mon, 14 Oct 2024 09:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728896791; cv=fail; b=o2LOOq7gV/2DW9XIP0xwfM2DiDrWCYVryaUqmp5WA09BZtbrwTKvI9C6/WhSDTsiEuzS5wQ7Z0SH9kaZ+s6/pk2nbgsYHKwzdQojuf+ovFnGB+Oune88D81YT5PheJtJzw1AfTRRfMU4AmhZjHhj/1qtSmTChfX/OHdIeZeDWzc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728896791; c=relaxed/simple;
	bh=MzFfAgA9ZDgr+BB7ylTfcwuMMCcuPh3BBy8k92m6qOs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EYCzr/tcWXgsdWlb3LsovV4kQxaVeE+d4M+nW1CSsnt/W82+uU+VAYRs7JqMXTtSuAsRMPMAFjexEQEwbjkeC5wtNUZoJWsFGZXi0xhwJs+RoDtUWBG3TS9LqsMC66dJ9Y1y7biVEXZTxGPbsGPNXDgIz3J19Hh6vL3WxaEXjuA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=BH8sXBRK; arc=fail smtp.client-ip=40.107.22.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O2OKV+mqXVu1yqUtF7LU0x1tyMvrLPPbl7uQnV6nnc0W2KD0U3IwYV0v4tXQxU7s7+8xqH81AXxa+YxqhaQGszTLm2wXkDzQ4Vzhh1eutE42ExVbfXjy2ynVTZMm1t4WX3H8/B6WbagxZT9mFLrlYoEb2oX7Zy+YuV8YnkFF+5S08xwRyrsAE1i3Jy67NLT4F99CZiB6c6gkgeRRlM/hI8Yowy74DbjNF7Owax/R4wrotiPGSB5A+rSFTteb/XueV6ILFl0RyTKatafEiZZvD03aq7W2E+cpcVMcAwVH8JNbhs3j52Ky/QoShhxq7fwcRLI4BbUBV5QwphY6zw/BaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MzFfAgA9ZDgr+BB7ylTfcwuMMCcuPh3BBy8k92m6qOs=;
 b=IauJ4nB1N41vTjkZkskBoAsBj2tduoS666JRluRebCnpMNe2kXTMF5H2XNCqtHUtTdyshqNCiXUrNXafVTgbUzmwuACehB37eU6x7kXU8gLXxyK2+clTLL2XiihwdmLmHl9w4q78OK+V8a3O2BFFiZ+TtWNrRQSSphBj+Y6SgtUw8PxqJnDIMaWwDJFuD3F3xcVtsOzzsd6jylkj8P+BA7Se9tLWuqFK8UpwWjLmrtL2DOdLSuH0p1RUxunzmPe5jjJYhn2qDSsDRlE9Rsq3zYnch7YTAIgzzg9rNGA3o5pjKnK0l4b9nYpubdVTPid8bgKGi0NqZD6FCK5Yjx0WTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MzFfAgA9ZDgr+BB7ylTfcwuMMCcuPh3BBy8k92m6qOs=;
 b=BH8sXBRK+Nt/Y2YRRL2JrajzRX4AXAF4kLZ2Rip7sf/XP3o4dgSnuWaLqPgggkZcTQ5pH9IW/qtPJavBlbcnckxmSOtnFDK0ArK/biV2Rp0GWublyrCIyRxu1oDGEzTjNHzoyOkY3spnovu/ehARXJnMi6SP+lYlUxqnilwHzqdpsJJCKxV7HbS58HMPEVbZpzifHj4EEjmlxqW2zA4T2h+oO65n3Pa/qwBr9qb+VwvdtM7/oSdfNsohDahsv2oPEL/K1ZW7OQC9TE9cTcY/sOEHWLvoBIaQDL2UxfCT6brRwkv5WhLer+7L+6O6GeOraV+c5tWOwGC1mO7P4oaewg==
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by AM7PR04MB6824.eurprd04.prod.outlook.com (2603:10a6:20b:10e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Mon, 14 Oct
 2024 09:06:26 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 09:06:26 +0000
From: "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "G.N. Zhou (OSS)"
	<guoniu.zhou@oss.nxp.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>, "jacopo@jmondi.org"
	<jacopo@jmondi.org>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>, "kernel@pengutronix.d" <kernel@pengutronix.d>,
	"festevam@gmail.com" <festevam@gmail.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 2/2] dt-bindings: media: nxp,imx8-isi: Add i.MX8ULP ISI
 compatible string
Thread-Topic: [PATCH v2 2/2] dt-bindings: media: nxp,imx8-isi: Add i.MX8ULP
 ISI compatible string
Thread-Index: AQHbHINhFvMSuTYhP0mdLjBltsYICrKF3OAAgAAP0YCAAAZZAIAABCkw
Date: Mon, 14 Oct 2024 09:06:26 +0000
Message-ID:
 <AS8PR04MB90808B70DC549A36EB988F7BFA442@AS8PR04MB9080.eurprd04.prod.outlook.com>
References: <20241012084732.1036652-1-guoniu.zhou@oss.nxp.com>
 <20241012084732.1036652-3-guoniu.zhou@oss.nxp.com>
 <6skgxfgvnd5f7zx5gcobcvp7krjskupo52c4op25i4qmmgti5w@3tn3hkmh3e2l>
 <AS8PR04MB9080EB24C4F1CFB6ED2B1C0EFA442@AS8PR04MB9080.eurprd04.prod.outlook.com>
 <05091a06-e42d-4340-b576-b09551d2f833@kernel.org>
In-Reply-To: <05091a06-e42d-4340-b576-b09551d2f833@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9080:EE_|AM7PR04MB6824:EE_
x-ms-office365-filtering-correlation-id: 9a1b1e6c-d7ff-4c89-d7f4-08dcec2f7bdf
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?WDJWalJReDRaVmpaOW9hNi9EUGFWUUxaQ0lDdkZhVEY1NlhFLzlpMGh3UDM4?=
 =?utf-8?B?MGVSYmN6Zm5jOFlzT0U0Y1kxSjVHYWswSVV1SHlnSlhadzdyUlVzRXR0eFVv?=
 =?utf-8?B?bXdOWkMwY2UwZ1VwUTl4dmFPb1U4Y3RhU0ZPWG1xdWI2bTBsOWVNczcwSnlM?=
 =?utf-8?B?V1c1TEZncFdLWDAxMEhjQ25td1RGQWMxSEN6RHJES1NXWlNjUWJDYWN3U1cx?=
 =?utf-8?B?eFBRS0piVEUwdzBtMlljNmRHcE1TT0R2T3cvczZobWZJbnJFbU1GNklTNGlX?=
 =?utf-8?B?a29hTWFDMzBFNzg4SFV0aDUxQzNPa0FsRjgxeDg5SndtWVorTDA2M3BEc0VU?=
 =?utf-8?B?Z2piay9raXZYNzN6dHE4d2JlTDF1bXlPbnNNZFhXcEZiTnU3aGQ2NWFTcm93?=
 =?utf-8?B?M1pQdUdPZ05NaUV2MTBIenExYzd3UmZiV0s3TVNMK3ZITC9aSms2QkxaUjRW?=
 =?utf-8?B?ZmgxWVJpMlhrbU9Gbm1mcE84NTArcVZaZWRUT3ZsQnExUTZqVFVxNVMrRDdP?=
 =?utf-8?B?OFg3bWd4cjFnQlZCZWFtNUNGUEFlMXpOeVRNTjZjWHVKSFlqbVZsUEVNWmRJ?=
 =?utf-8?B?bmwycnFZSUtKWWZZWnVhUVhYV1pPTGprWldqTDFXcGR1MGZTQ0UzQnhqcWJK?=
 =?utf-8?B?L1hVQmY5VTYzV2xURUVwQmpFbzRHK25LQzY2ZVk0NVVBMVkwMFRCeTBid0N2?=
 =?utf-8?B?dVVBN2svRHU3THo1RzlEclBJcmtWZ2hMUzFlZVdmQkVTdGtQTFRZK2I0czNW?=
 =?utf-8?B?cUh0L0VtWXJNbTZiN2M4WVRNVWl1YndZQ1M2QmJnVTVKQzdDeXFjakZRSHpP?=
 =?utf-8?B?WTFERldFancyZ1RTdGt4Y2FTZ0tNWE9LRk5ZOVQwM0YvaExiVFJvTzQ3WmMy?=
 =?utf-8?B?QzAxcFNQUnRTWFlYV0M4K1prenBPdWN5RURxQ0dnYjRkOEN1WlpDbVQ0dk9Y?=
 =?utf-8?B?cnhGRmlZdlFFdjh3VkJsYnZ4a21DaTFhVXUwSGNpV0FFU21sV0x6cGh6VUts?=
 =?utf-8?B?eHljTjlhL2F1L1FQWFZIcjhWcXg0ckJXL2tmK2VtcFpPd0xNdHhMbHVxTFBC?=
 =?utf-8?B?RnhkeDNhU3V6aEl2NngrRE5NZS9nTThFaXpoc0VmeDQ5RTdpcWVpMDNzZjNt?=
 =?utf-8?B?TlZVbzloMThZbldqa3NCQTg3U25kSW5aTlFPbGhTak9aZVZyYThjMi92RWp1?=
 =?utf-8?B?dVFTUDFETzc2anlRcW8ra29nRWtnQ2xMcnZrUHdxSGFza2dNaUlkM3ZoWlYw?=
 =?utf-8?B?VXIzZ2ExN0NWQi9PQkxDWEVqdkdmSmcyZkI1WU9FMlhBNzJRRG5CUkMxY1R3?=
 =?utf-8?B?Wm5sUXNiSHcxL2dhaWMwOXFhWk01TUR4MTNaL3dLK1N1UnA0Z1E4WUhkVDl4?=
 =?utf-8?B?MmZZRlU0YXhEbEYrZk1mb1Mrc2U5VTBwSnY2UGYzVDRKeG92c3pidGtxVHhi?=
 =?utf-8?B?YjMyZ0ZDR3ByYmFsQjI0dE56OTdHOENnRDV1NkxqczhTTVc4b1pFSHFLMDFK?=
 =?utf-8?B?dThzeEdXQTkzN0xJMVZkMFFrMU9FOVRoTmJ0UVlkckxQU29LLy8yMnI4TGxG?=
 =?utf-8?B?WGlwSXZJbldFVzB0V3YySHVNUzNZc0JPdDI4K1hOeTkzN0tYSk45cHd0OFhy?=
 =?utf-8?B?U2FNSU9JTDBZditWcTlpbXRibkVNSmF1M0hIckZzRlZKY0dnWm1hdFUwSXdz?=
 =?utf-8?B?Q01wL01oZC9raHMrQitwMzBvblJJeGw4eEJMRERDMk1uWWpSclUrSW9PYiti?=
 =?utf-8?B?UHVRWlZmcUNtZkN2dFBncWFsY1hWK3E4aTlWR3hpcmZtTm1jaWVFNUd1dXlo?=
 =?utf-8?B?Uk9NUVpaNHFJQ1lIeUtWUT09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MkkyRmJ5V1RkUldBa2JYYXZyazlRYzRLTjFJV2pKa3Ewa1lJclRDQ0dqNzM3?=
 =?utf-8?B?b1RnTVVOby9QYkI4eE5qa0ZSc2lRZFc5dzlUeHNxR3BJRk9HRFU4L0xEdTNa?=
 =?utf-8?B?UWJyaTNieW4zRVc2eUcxYWlnL3ZzeTY0VzFyYnlmOUdadFNsY2FkZDhQR0xB?=
 =?utf-8?B?aWVMWFpQMWg5dlNUV1RFdm9kZUV0WENZSFlIRU5zNkttRW9wbXphb1h3aUZV?=
 =?utf-8?B?bEcxbDIzVzZuNjh4N1ZNRGdJM0hJYmxSdzRmYVJmVm14S0RGeEF3bldRQU1t?=
 =?utf-8?B?bk9CbGFORGVvbkZkdkRqNjlRUzlBLzk4bTcxVFJUaC9ocVdNYmpyNDZrWDJN?=
 =?utf-8?B?VG4zZWFjcVdrRmJjemU3OUJpSnkxVUxaVHo4U3FYSVJvMHV3VlloRVJYTERO?=
 =?utf-8?B?NHduVmhMdldQTno0L1dxQU83NXgxOERQbWY1WnduTTM1bmpwcGw0ZS8raHRn?=
 =?utf-8?B?Uk5zM09McExrUzY3RXJ5RmpEYWhSaEtIaTA1elIvQmppVDljMGNYeHR3MmVT?=
 =?utf-8?B?azJJYW03YjhyUEFZbzlJNFRsMFBwd1NMbUJwVHh2L0tJQU1oSjBhcFBoaWtT?=
 =?utf-8?B?WnV4VTZ1YVBza1JucktLQUkrazVZS1o4LzdIWklwanFVQ1hwZ3JmV2RLT1Bu?=
 =?utf-8?B?ZTAwS1RYYy9ZZ3p6eHdxUlJpN0g5Smc5OVhPYWVJVUthTDlnclU2ZVVTYnNR?=
 =?utf-8?B?bTdiZDBmcFAyT2JCMGlBUjNwRWVobmVCcE52U3k1NmorblZuL0tmZ1hXc08r?=
 =?utf-8?B?QVFJOEphcnNkRzhKZmZWS3BCaWhIbFA5OEs4Q0JmUFBYVDBpTURrcVcweEFp?=
 =?utf-8?B?Ky9XUVp4QmhLUEUwNE5ZZGQvTXorYXQreUd3UlJ2QzkxM1p1aUpvdER1RW9p?=
 =?utf-8?B?V2ZQNWdiYjVoZkZDZVlrd2NmTGR4RXNZenhFMTg2am5CRkl0RzJHMmdaSExL?=
 =?utf-8?B?a1dZN2pkNWJYYVFvTzdvWlZsYWhsb0FKSmN1ZktZdlgrZE95V1lqSmZ1VExV?=
 =?utf-8?B?cFdNR1F2NFp5YnZBc3VFWTBXekxyY2N3MitzNTd6V2czV1BLeVdqblhnYmx4?=
 =?utf-8?B?b2FtZ255a0pPVzBJK3M4bEl3d3ZKRjZEdUFUU2o2cU5QZWZBeXRscCtUdTEy?=
 =?utf-8?B?Y0ViK0xXd1MweDRDTDJlRnY4U1B4S0tZL2FJT2lJbC9uRDhuN3lMMTFkdGJr?=
 =?utf-8?B?VTV3c3k5dUx2SU82alJYZGR3SjRzOGtwN0lVK3RobEVxdHVaYS9hZmNrM0tO?=
 =?utf-8?B?b29zd0JRd2pESStwaE81VnYyQndZNktCK1o5K3oyYkFyeUxsL0xsVU9hZmRL?=
 =?utf-8?B?NWF0N1hES0NCT3U2cmhrQ21HUnRVTE1CNHo0TmZWZlI5MFArOTRaMW1xZlVl?=
 =?utf-8?B?MCtUM3RIRTh6SEZFT0wxbzQ5dS9XTTdPK2kya3FaTklsWkc0R1JVUHlrUk5l?=
 =?utf-8?B?UzdFSmR6YmkvRDRqb2cwTGVrTlZOQ2RwWCtLSHp5WFhuMUhkNHFpbmR5dTg2?=
 =?utf-8?B?Si9RYmZzZUF2V2I0ZzJJNXpSYTNzWXY5bDRzMDFNZ09oNCtrT1h4YTk4Z084?=
 =?utf-8?B?NUcrKzA5YzNZVk5ZK2FHakZkRUpiOEVBcjlqbDYxZlJOQlFzNzJYc2hDZ244?=
 =?utf-8?B?VFpiaG4ydmYzNmFFRGZmQ28zc2NMTGE5LzE0Qlc3dFg5TXJwYzdkQlBJZm9X?=
 =?utf-8?B?YTVoVUNhQms2MW9ncjIrWkhFNDBUVzZOSUIrTTNOQWgrTXFvdnNCbWwrYU9a?=
 =?utf-8?B?eUpZKzBTSDB4YUNIRldKbm53M3A5ZS9FeXdQWDJ1cUxjaVU0bWlRb3lSSWdJ?=
 =?utf-8?B?dkkwZ2pLR1lVT0V0aGF1VDl3eFA5QXY5SnBUekRoZWdWVGMzWjJqMkFubTRB?=
 =?utf-8?B?ODQxNEZUcTUvWDBFWHVxL3Vqa1FReVFzQlI3MG44MXhVMlNNNEc3bndSWU9m?=
 =?utf-8?B?bk0yRmhMajhteE5wblR2ajVpRUk4NCtsSS9tOFpYYWZYelpzbXBldEhHQ1hU?=
 =?utf-8?B?am94dG1TbHc3SDJpRUxKRXVMQXczdWRDbTRvYUlQL1VGWXdtL0RmS2ljMFVh?=
 =?utf-8?B?ZG54SldjWFVFdFJyS2Qxb281UFFhMExlNnU5N1Y5TGtHOFJ2L2tWNzdLeFpt?=
 =?utf-8?Q?ZG8xRODGPZHzwmR60oieJ7JLM?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a1b1e6c-d7ff-4c89-d7f4-08dcec2f7bdf
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2024 09:06:26.5387
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x4FOcYlO6PfZa2jU1DW+FADFmbQmUqTsJfuHr474PsRin6D58tMdFO72VKhlODHD8kE53JBAn0ZLIvYz7JTreA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6824

SGkgS3J6eXN6dG9mLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEty
enlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4NCj4gU2VudDogTW9uZGF5LCBPY3Rv
YmVyIDE0LCAyMDI0IDQ6NTAgUE0NCj4gVG86IEcuTi4gWmhvdSAoT1NTKSA8Z3Vvbml1Lnpob3VA
b3NzLm54cC5jb20+DQo+IENjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmc7IExhdXJlbnQg
UGluY2hhcnQNCj4gPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT47IGphY29wb0Bq
bW9uZGkub3JnOw0KPiBtY2hlaGFiQGtlcm5lbC5vcmc7IHJvYmhAa2VybmVsLm9yZzsga3J6aytk
dEBrZXJuZWwub3JnOw0KPiBjb25vcitkdEBrZXJuZWwub3JnOyBzaGF3bmd1b0BrZXJuZWwub3Jn
OyBzLmhhdWVyQHBlbmd1dHJvbml4LmRlOw0KPiBrZXJuZWxAcGVuZ3V0cm9uaXguZDsgZmVzdGV2
YW1AZ21haWwuY29tOyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsNCj4gaW14QGxpc3RzLmxp
bnV4LmRldjsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIHYyIDIvMl0gZHQtYmluZGluZ3M6IG1lZGlhOiBueHAsaW14OC1pc2k6IEFkZCBpLk1YOFVM
UCBJU0kNCj4gY29tcGF0aWJsZSBzdHJpbmcNCj4gDQo+IE9uIDE0LzEwLzIwMjQgMTA6MjcsIEcu
Ti4gWmhvdSAoT1NTKSB3cm90ZToNCj4gPiBIaSBLcnpzenRvZiwNCj4gPg0KPiA+IFRoYW5rcyBm
b3IgeW91ciByZXBseWluZy4NCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiA+PiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+DQo+ID4+IFNl
bnQ6IE1vbmRheSwgT2N0b2JlciAxNCwgMjAyNCAzOjMxIFBNDQo+ID4+IFRvOiBHLk4uIFpob3Ug
KE9TUykgPGd1b25pdS56aG91QG9zcy5ueHAuY29tPg0KPiA+PiBDYzogbGludXgtbWVkaWFAdmdl
ci5rZXJuZWwub3JnOyBMYXVyZW50IFBpbmNoYXJ0DQo+ID4+IDxsYXVyZW50LnBpbmNoYXJ0QGlk
ZWFzb25ib2FyZC5jb20+OyBqYWNvcG9Aam1vbmRpLm9yZzsNCj4gPj4gbWNoZWhhYkBrZXJuZWwu
b3JnOyByb2JoQGtlcm5lbC5vcmc7IGtyemsrZHRAa2VybmVsLm9yZzsNCj4gPj4gY29ub3IrZHRA
a2VybmVsLm9yZzsgc2hhd25ndW9Aa2VybmVsLm9yZzsgcy5oYXVlckBwZW5ndXRyb25peC5kZTsN
Cj4gPj4ga2VybmVsQHBlbmd1dHJvbml4LmQ7IGZlc3RldmFtQGdtYWlsLmNvbTsgZGV2aWNldHJl
ZUB2Z2VyLmtlcm5lbC5vcmc7DQo+ID4+IGlteEBsaXN0cy5saW51eC5kZXY7IGxpbnV4LWtlcm5l
bEB2Z2VyLmtlcm5lbC5vcmcNCj4gPj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAyLzJdIGR0LWJp
bmRpbmdzOiBtZWRpYTogbnhwLGlteDgtaXNpOiBBZGQNCj4gPj4gaS5NWDhVTFAgSVNJIGNvbXBh
dGlibGUgc3RyaW5nDQo+ID4+DQo+ID4+IE9uIFNhdCwgT2N0IDEyLCAyMDI0IGF0IDA0OjQ3OjM1
UE0gKzA4MDAsIGd1b25pdS56aG91QG9zcy5ueHAuY29tDQo+IHdyb3RlOg0KPiA+Pj4gRnJvbTog
Ikd1b25pdS56aG91IiA8Z3Vvbml1Lnpob3VAbnhwLmNvbT4NCj4gPj4NCj4gPj4gQXJlIHlvdSBz
dXJlIHlvdXIgbmFtZSBpbmNsdWRlcyB0aGUgZG90PyBPciB5b3UganVzdCB1c2UgbG9naW4gYXMg
ZnVsbCBuYW1lPw0KPiA+DQo+ID4gRG8geW91IG1lYW4gdGhlIGRvdCBpbiAiR3Vvbml1Lnpob3Ui
LiBJZiB5ZXMsIGl0J3Mgbm90IGEgcGFydCBvZiBteSBidXQgdG8NCj4gZGlzdGluZ3Vpc2ggZmFt
aWx5IG5hbWUgYW5kIGdpdmVuIG5hbWUuDQo+IA0KPiBJIGFtIG5vdCBmYW1pbGlhciB3aXRoIHJ1
bGVzIG9mIHRyYW5zbGl0ZXJhdGlvbi90cmFuc2xhdGlvbiBvZiB5b3VyIGZhbWlseSBuYW1lDQo+
IGludG8gRW5nbGlzaCwgaG93ZXZlciBJIHRoaW5rIHVzdWFsbHkgYSBzcGFjZSBpcyB1c2VkIHRv
IGRpc3Rpbmd1aXNoIHRoZSBmYW1pbHkNCj4gYW5kIGdpdmVuIG5hbWUsIGUuZy4gIkd1b25pdSBa
aG91Ig0KDQpUaGFua3MgZm9yIHlvdXIgc3VnZ2VzdGlvbiBhbmQgSSB0b3RhbGx5IGFncmVlZCB3
aXRoIHlvdS4gTGV0IG1lIGNoYW5nZSBpdCBpbiBhbnkgb3RoZXIgdmVyc2lvbi4NCg0KPiANCj4g
DQo+IA0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCg0K

