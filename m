Return-Path: <linux-media+bounces-65491-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6mzpLAxHO2rNVQgAu9opvQ
	(envelope-from <linux-media+bounces-65491-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 04:55:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 566876BAFDA
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 04:55:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=nxp.com header.s=selector1 header.b=IMUE6f32;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65491-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-65491-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=nxp.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BC9FA300E023
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 02:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1019530149F;
	Wed, 24 Jun 2026 02:55:02 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011008.outbound.protection.outlook.com [40.107.130.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD572857CC;
	Wed, 24 Jun 2026 02:54:59 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782269701; cv=fail; b=e4j61jqrfPNcE2FxzUKxCkbt7YKxQ2rPnVmrqM3R91tOJM5n5ejK1knKcfTmRWsVwHlIp998k1/tl7lm4xWM+ptnPM5TBoMtjjBdBmC5+hTWi12NgZrB20HYm9z1AU8iVmaoM/UDS8JsnfddBAm6hNKskHPIA9PUixc1DfuRVFU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782269701; c=relaxed/simple;
	bh=RZjPcW2JE8ZLh9HJwTD4mZIX1rMTewE33vNNuk2hK/k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iB5a8ZVRLsbgGFRtY44v77A/lcbQljIbl0EFPPbys8Jd2Ldtn4EyLJpuEVWT03WwCjALkHhvVk9QeIxnsCzBMPLBZ/jT6ZTtgh5EduwVTvYg63NZPcYbXxoHGe3WuHPBI8Ubvzj9wdSJbOAVWqGyzKRODfAs7jLG6aS4heOB1YA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=IMUE6f32; arc=fail smtp.client-ip=40.107.130.8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ObpS0OUraLjGpjRI8ZKBLZmIHjHLlgbvOmHtGuxKpd+8cnKEoVqD8kiuOsK+hIVDT8sqoOG4XCrrIjvlMwLPOAg0Zrltcp7NDnfih6eQQwyOuhKT7MFZ+gULOfZLlnnfwCC9gdVjS/LxjFhVs+rc1EfukIhxXNM7i67WSpiFZFAfPVPOgKb1WnsDtDIgRouq5LbetvjJ1kGqS7foddVr52148S7FEwJHezEmMOKC7wFX4WPgnvtx2n5asbzBINl3t5FHBWRZ+ptA8B41bGa1ZPSdsIaiWJnem+gKz2pajxYqPd/65wYw93LM18jbU0W03L870YEFKfetK1jrD+tSdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RZjPcW2JE8ZLh9HJwTD4mZIX1rMTewE33vNNuk2hK/k=;
 b=v/ZWafGx5HPIkLl1c46YB7DnBE2wjHA78XHnKT6vk4ECQP4JxlEJFSfDhV1zC0cMoKpTSS2BgD4wobsQr0iF8Ma+kWaRnuDpBeEAcGK+syopSLehwiV0zk7hXpWxeBT8+z2hWtpA2PzuhlEUAeqbdljWUu2Z90ffgEynly+vEFieBmq3rgNuna9AuxDgYJxHeKh3a39fps7Xg1KVa5PCpFYtHYOYrEoosPXdz4nhm96B5zWGbGk4BZ1GMdmnqva20Oa/LhdL7x/cyePIa/WuifZAM8+pMClhwVpE/mNd5L870YlgOFhTHNI88JZBBZcErjsO8VgUsqYrgfBmw0tRkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RZjPcW2JE8ZLh9HJwTD4mZIX1rMTewE33vNNuk2hK/k=;
 b=IMUE6f32KHo7kr6GAn2eEuMTwwXfKRaxYadvQGuv0JaGj4GmoNVBxYL2eupM9DHhpOJcnjcdK1G4e0Ay+K0qjPSLom/ha7d/qO8kV/k/APcYbwlLc8RbcsVLQSB6HnTrqqKwvmC+qVsAoWhNWiKFpyqmU4h4qFrEgyxIBlDDqPcOI8BsaSKk0BWbCNBM/3iJGar7I1fyV2480gkeSs8zP8sKl3BjutDFHWZg/KcnwEyfbbvE7zs3sopBzk4s4Ea81LxlBDlZzYFkYGS74CWRS7LlBFpIvDDuZOcCpNAol0pVG5JNwNt6LZ1ovb4kKyMbj7EGoXllroM8akQnP76irQ==
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PA1PR04MB11432.eurprd04.prod.outlook.com (2603:10a6:102:4f7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Wed, 24 Jun
 2026 02:54:55 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.21.0139.018; Wed, 24 Jun 2026
 02:54:55 +0000
From: "G.N. Zhou" <guoniu.zhou@nxp.com>
To: "Frank Li (OSS)" <frank.li@oss.nxp.com>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Danilo
 Krummrich <dakr@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dafna Hirschfeld <dafna@fastmail.com>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, Heiko Stuebner <heiko@sntech.de>, Bryan
 O'Donoghue <bryan.odonoghue@linaro.org>, Vladimir Zapolskiy
	<vladimir.zapolskiy@linaro.org>, Loic Poulain <loic.poulain@oss.qualcomm.com>
CC: "driver-core@lists.linux.dev" <driver-core@lists.linux.dev>,
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	Frank Li <frank.li@nxp.com>
Subject: RE: [PATCH 1/4] device property: Introduce
 fwnode_graph_for_each_endpoint_scoped()
Thread-Topic: [PATCH 1/4] device property: Introduce
 fwnode_graph_for_each_endpoint_scoped()
Thread-Index: AQHdAlOzl1psYbfwf0Gue7fOzJtVubZNBOcA
Date: Wed, 24 Jun 2026 02:54:55 +0000
Message-ID:
 <AS8PR04MB908065454C3DA49C9ED866E2FAED2@AS8PR04MB9080.eurprd04.prod.outlook.com>
References: <20260622-fw_scoped-v1-0-a37d0aac0a68@nxp.com>
 <20260622-fw_scoped-v1-1-a37d0aac0a68@nxp.com>
In-Reply-To: <20260622-fw_scoped-v1-1-a37d0aac0a68@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9080:EE_|PA1PR04MB11432:EE_
x-ms-office365-filtering-correlation-id: cc6d0c70-7b8d-40f2-f435-08ded19bf8af
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|7416014|376014|366016|23010399003|1800799024|22082099003|18002099003|38070700021|921020|56012099006|11063799006|4143699003;
x-microsoft-antispam-message-info:
 gNrHtleUuQOv0e+fszZyJWQfJd7HLu8o67q7wYcKN8DJ/KOlLhdEn+maAinzI9PBPqoVzv+lQFNgbcm9UKl5oxkdUiqCRociB4mMHncoh7ANdqKYmZ9S+D/D7MUrOnW15NQNhjHz4q1o9TscuihNxpbGA6yu2uYERlL6t8kiqgQLn9GFoW2n09d7ZRG5oLpT6zbWJVRBbPbtqN3LE7LFt6/4T+IVT1r4ZYdzdZGnGapxiYR30sE5uceArfU8JTRu0D5FLPlBDkyKfYzRTi6qJtQqSnxF0hyVBIGY6fiz64eCBUnJ7fZJSXxjgomn7pCbP8F0ixq6eopvNYZCwC3RE6UmALVZQqcD6V9tolRnFwqSS+QzqhtGuuTCuVO0NYGWA0aKq5d+kFozG0DL8aIsNPCgH0rH+r33V6GanxguionoJZ8A5KaHLVMzHrnJUMQLwBBFVpN/YTEuRENdD6gH4y4uxqgdZTC6uQfd2CozvXNq6wsjTFeZOFxHC1MHdg/UbWvxNKY+1WOswED2KV4C7fjDL2lFpFa/csKQCBGuTuCPe2CDDwpZoPTLPf2sX6ej2DJ98AuQ/iKZkR+U7FWDCeoysiDPteDMEkpGC0r++1j825Yq933qL/YQUQYFX0ughQNJWy99dQL+gS4E8N+4klPP87lCAuetDJcFIm0/8RgepQ/RSWHI2m1SV7G9mqx0VuKfhO1Nj5Pphp0JAFk+hEXdSTJVv0YWFWSbJN5I1ICz6mIzH6DTHu+Q3AZJza0y
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(366016)(23010399003)(1800799024)(22082099003)(18002099003)(38070700021)(921020)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?LzhxUzhOMXdqaEFFRERUZ2dtczRIU0taSzFFS3lsVVFQSHAzTkJsNjdzNlhH?=
 =?utf-8?B?dUxpYkFrcFpXMHRxOHFBdC9xRFZCUGRXbFNLVVFXQXhEZzJYT2JDaWFpSlpu?=
 =?utf-8?B?ZlRDL2JXUXVCRXZ1Vk5iTXRUc2xzZHYrOUM3WEFZUGZ5VnV3Ly91YkNITDhq?=
 =?utf-8?B?Z2Q5TkxHbDYrRmkzdUptK2Noc2lTOTU2cUVhQnNRVGxLZHVuSHpGcHdycm9u?=
 =?utf-8?B?ZDNxL2xWUHhoUVhvR2YzR3oweC95WVFSWTNVNWRiUWlLaEF5ZStreHE1OGxB?=
 =?utf-8?B?a1YrcCtIeWRyT3RwM0pZLzB6Rk4wQ2YwNTBqRG5XN25BVlNPOFB4MnhKbWZV?=
 =?utf-8?B?TTFQbGdaNnNKOWN1OUxLTHJzem1seE1mL1ZSWW5EZ2JLWmhFS0dsaHM4cFlB?=
 =?utf-8?B?ei9NNVpiTDlpRkpXSmxscWxlUUlhU0tTMlFvcnFZZ1Bsc3MvZ3I5WFBzaGNW?=
 =?utf-8?B?VFFmZVJjaGFDZUdoYmM3aEFESEsybG8rZkozSDR4REpSbmFISC94eDdKUFU1?=
 =?utf-8?B?algvTWxaTjNtTUw1V2o1OTNqcjMzeXc3bUhpUVNtdGt4emw0MUtEVU82Z3Zw?=
 =?utf-8?B?MHdXTDNUUmxzT3RjK0cyckVKdFkxekVnUUNaRVV1cEVYRzlGNXJBSmtENXJZ?=
 =?utf-8?B?ZFR1cGRWWVlETFNxZWpFRStTTjBtdkJQV1l4Rzc2ZFFCZEtoT3JWRXdYWnBF?=
 =?utf-8?B?T2NMbE92bi9GdzNxVGg3bWh1bEoxY010MWNKRHpoY2xqdXZsYWl2MDNqZWxK?=
 =?utf-8?B?OWNLSmxXRFMyd2ZrYWU3dDVndlBxS2pOekFTaURPZ3NrbzFoL3FSMU9CQ2E4?=
 =?utf-8?B?RUdrQ1FxcFlsY1hnUVh4RDNraDkxeFRtVDFnVS9LRmtTOG9OMUhqV0RBY2Fn?=
 =?utf-8?B?TVZwZVlLci9uUThHVmNqS3lXc1BveEZhZW9nbEZkTTQ2NkxTUVIvTXFvak4r?=
 =?utf-8?B?b1cvTXRvUDNXcWp6d3VBejJaTWJPUFJ2eHRlVVUxRmFKblloVkc1eml5UG5J?=
 =?utf-8?B?MlF6QllVL0ZwaTUvWWlSVkhocEl6eGwzck9UOGJZQ3Vvc3N6VlA5YW9WYWc1?=
 =?utf-8?B?VDdSY3QvT1VwSkNWZGlZemdVK0dGblRMYVorVitmYS9TK1NTTURmSEIxTFgw?=
 =?utf-8?B?eTlJWGpUTmJBUHVQZ0F2cUhZcUd2VkVJZWFUVThqN1kvWExaMEU2cldVUDE2?=
 =?utf-8?B?enlqUVloc0xFWEVaT25LOStUdUlVMTNoZ0Y2L3FZWHc2RldEcUhvZjUrbGVt?=
 =?utf-8?B?SU9iaE0zVnljKzZmL3lXM1MrbENlT0l5QjJUaXNjaU9XQkJKcFB6NHhGVC8r?=
 =?utf-8?B?TThQVS9QSWFlbUNmSUVxaFZ6Q3V6aWZrMmJyekJpRExBQW44L3MyU1NZME9H?=
 =?utf-8?B?SUI4a2hnM0NqNHNDcFNIYVplbGVqRXBhOXQ2TUk1dkJGcnZIMTNKQ1R4a21q?=
 =?utf-8?B?dHY4VlIzOU13Q2hrQ1owcU5rN0l1V3IzYWl2UndQQW9FQzU1d0w0MEo0ZFc0?=
 =?utf-8?B?NzMySTVTVmgvSUdzNjY5c2hsWmVSY1dyaElkQys1OU9MR0RXRlZjRFlnQWpk?=
 =?utf-8?B?YmNoeGtnd2liZE4zeFRhenkrUGtXcHFtbW5wcG0rUHJCTTBWb1ZoL1lVMStm?=
 =?utf-8?B?Qm81Y21mcTF4Z09NRC9pSXBybjFUQndPUW1nZGtnV0VYUlFDc1dmQUY2UlI4?=
 =?utf-8?B?bmdud1h1MkNpZnRZT2tyNzJiZFRTdVlqSWYxbkh5bFZHUWpha1Q3aWpSNmdB?=
 =?utf-8?B?NmxVTHBlRHVNWWVtdVVJQWd2NXRCaFFZRWdWMDhTbkRYWEpCTEJ3TkF6a09C?=
 =?utf-8?B?Y3ZqWmlWKzJiTTcxSjlGOHlud01SU0J6U00zVlZxYnV6L1QwZURlN01lc25Q?=
 =?utf-8?B?RE83MlVpUnNCVlladXZwUFJ6N3FGYVRZTG00dlhhcGNVSlhQNUFwdmdQdjRa?=
 =?utf-8?B?NG5TTG9Zays3bFlLRWJMbTBiMnVsQWhBZElXRzlzUEk2bGVvNzEzNUtwWTJx?=
 =?utf-8?B?NzdiZTBtbUVmUUtpNGRuc0R3ZTVkN0JrYlBwVEJBOGx4bmx3bDZJZzBwcEVs?=
 =?utf-8?B?Sm1FYyttdkxrMUF6VzU5Rlc5eUJrT3BzNVQxZ1F4cFpjamxCMTdTZWJiMG9F?=
 =?utf-8?B?djVqdU5rc0VVd2dRQ3ZEcG1FVWo4b0JzS2VTZkhaWDNrWTNGeFR1ZDl3TUFM?=
 =?utf-8?B?YTFyNjMvZUNTMVJ1ZW9iU2VhbVd6UnJabjJ1YVR1RHMzM0k0emcvWm8vUVUr?=
 =?utf-8?B?R0tuTk1pWHV0b1hBbFBzK29YbkJuUWYxbFZnZlB0Tm1zVWlvRlgzSVdXNnpx?=
 =?utf-8?Q?sVD2v/QStWoJgLKbc3?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: cc6d0c70-7b8d-40f2-f435-08ded19bf8af
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2026 02:54:55.5005
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JDUQI+xoQY6eRhBbPY9tj99zT30aL6HAKhHHqya4rzPaPdRJIh57Z/4FuAA60cVoJqKDogRYd/SbigLfJqyn3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11432
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.94 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65491-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:frank.li@oss.nxp.com,m:andriy.shevchenko@linux.intel.com,m:djrscally@gmail.com,m:heikki.krogerus@linux.intel.com,m:sakari.ailus@linux.intel.com,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:mchehab@kernel.org,m:dafna@fastmail.com,m:laurent.pinchart@ideasonboard.com,m:heiko@sntech.de,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:driver-core@lists.linux.dev,m:linux-acpi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:imx@lists.linux.dev,m:frank.li@nxp.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[oss.nxp.com,linux.intel.com,gmail.com,linuxfoundation.org,kernel.org,fastmail.com,ideasonboard.com,sntech.de,linaro.org,oss.qualcomm.com];
	FORGED_SENDER(0.00)[guoniu.zhou@nxp.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 566876BAFDA

SGkgRnJhbmssDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRnJhbmsg
TGkgKE9TUykgPGZyYW5rLmxpQG9zcy5ueHAuY29tPg0KPiBTZW50OiBNb25kYXksIEp1bmUgMjIs
IDIwMjYgMTA6MzAgUE0NCj4gVG86IEFuZHkgU2hldmNoZW5rbyA8YW5kcml5LnNoZXZjaGVua29A
bGludXguaW50ZWwuY29tPjsgRGFuaWVsIFNjYWxseQ0KPiA8ZGpyc2NhbGx5QGdtYWlsLmNvbT47
IEhlaWtraSBLcm9nZXJ1cyA8aGVpa2tpLmtyb2dlcnVzQGxpbnV4LmludGVsLmNvbT47DQo+IFNh
a2FyaSBBaWx1cyA8c2FrYXJpLmFpbHVzQGxpbnV4LmludGVsLmNvbT47IEdyZWcgS3JvYWgtSGFy
dG1hbg0KPiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+OyBSYWZhZWwgSi4gV3lzb2NraSA8
cmFmYWVsQGtlcm5lbC5vcmc+OyBEYW5pbG8NCj4gS3J1bW1yaWNoIDxkYWtyQGtlcm5lbC5vcmc+
OyBNYXVybyBDYXJ2YWxobyBDaGVoYWINCj4gPG1jaGVoYWJAa2VybmVsLm9yZz47IERhZm5hIEhp
cnNjaGZlbGQgPGRhZm5hQGZhc3RtYWlsLmNvbT47IExhdXJlbnQNCj4gUGluY2hhcnQgPGxhdXJl
bnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT47IEhlaWtvIFN0dWVibmVyDQo+IDxoZWlrb0Bz
bnRlY2guZGU+OyBCcnlhbiBPJ0Rvbm9naHVlIDxicnlhbi5vZG9ub2dodWVAbGluYXJvLm9yZz47
DQo+IFZsYWRpbWlyIFphcG9sc2tpeSA8dmxhZGltaXIuemFwb2xza2l5QGxpbmFyby5vcmc+OyBM
b2ljIFBvdWxhaW4NCj4gPGxvaWMucG91bGFpbkBvc3MucXVhbGNvbW0uY29tPg0KPiBDYzogZHJp
dmVyLWNvcmVAbGlzdHMubGludXguZGV2OyBsaW51eC1hY3BpQHZnZXIua2VybmVsLm9yZzsgbGlu
dXgtDQo+IGtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9y
ZzsgbGludXgtDQo+IHJvY2tjaGlwQGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LWFybS1rZXJu
ZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgtYXJtLQ0KPiBtc21Admdlci5rZXJuZWwub3Jn
OyBpbXhAbGlzdHMubGludXguZGV2OyBHLk4uIFpob3UNCj4gPGd1b25pdS56aG91QG54cC5jb20+
OyBGcmFuayBMaSA8ZnJhbmsubGlAbnhwLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIDEvNF0gZGV2
aWNlIHByb3BlcnR5OiBJbnRyb2R1Y2UNCj4gZndub2RlX2dyYXBoX2Zvcl9lYWNoX2VuZHBvaW50
X3Njb3BlZCgpDQo+IA0KPiBGcm9tOiBGcmFuayBMaSA8RnJhbmsuTGlAbnhwLmNvbT4NCj4gDQo+
IFNpbWlsYXIgdG8gcmVjZW50bHkgcHJvcG9zZSBmb3JfZWFjaF9jaGlsZF9vZl9ub2RlX3Njb3Bl
ZCgpIHRoaXMgbmV3IHZlcnNpb24NCj4gb2YgdGhlIGxvb3AgbWFjcm8gaW5zdGFudGlhdGVzIGEg
bmV3IGxvY2FsIHN0cnVjdCBmd25vZGVfaGFuZGxlICogdGhhdCB1c2VzIHRoZQ0KPiBfX2ZyZWUo
Zndub2RlX2hhbmRsZSkgYXV0byBjbGVhbnVwIGhhbmRsaW5nIHNvIHRoYXQgaWYgYSByZWZlcmVu
Y2UgdG8gYSBub2RlIGlzDQo+IGhlbGQgb24gZWFybHkgZXhpdCBmcm9tIHRoZSBsb29wIHRoZSBy
ZWZlcmVuY2Ugd2lsbCBiZSByZWxlYXNlZC4gSWYgdGhlIGxvb3AgcnVucw0KPiB0byBjb21wbGV0
aW9uLCB0aGUgY2hpbGQgcG9pbnRlciB3aWxsIGJlIE5VTEwgYW5kIG5vIGFjdGlvbiB3aWxsIGJl
IHRha2VuLg0KPiANCj4gVGhlIHJlYXNvbiB0aGlzIGlzIHVzZWZ1bCBpcyB0aGF0IGl0IHJlbW92
ZXMgdGhlIG5lZWQgZm9yDQo+IGZ3bm9kZV9oYW5kbGVfcHV0KCkgb24gZWFybHkgbG9vcCBleGl0
cy4gIElmIHRoZXJlIGlzIGEgbmVlZCB0byByZXRhaW4gdGhlDQo+IHJlZmVyZW5jZSwgdGhlbiBy
ZXR1cm5fcHRyKGNoaWxkKSBvciBub19mcmVlX3B0cihjaGlsZCkgbWF5IGJlIHVzZWQgdG8gc2Fm
ZWx5DQo+IGRpc2FibGUgdGhlIGF1dG8gY2xlYW51cC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEZy
YW5rIExpIDxGcmFuay5MaUBueHAuY29tPg0KDQpSZXZpZXdlZC1ieTogR3Vvbml1IFpob3UgPGd1
b25pdS56aG91QG9zcy5ueHAuY29tPg0KDQo+IC0tLQ0KPiAgaW5jbHVkZS9saW51eC9wcm9wZXJ0
eS5oIHwgNSArKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvcHJvcGVydHkuaCBiL2luY2x1ZGUvbGludXgvcHJv
cGVydHkuaCBpbmRleA0KPiAxNGMzMDRkYjQ2NjQ4Li5hZGUxOTRjNDYyZDQyIDEwMDY0NA0KPiAt
LS0gYS9pbmNsdWRlL2xpbnV4L3Byb3BlcnR5LmgNCj4gKysrIGIvaW5jbHVkZS9saW51eC9wcm9w
ZXJ0eS5oDQo+IEBAIC01NDUsNiArNTQ1LDExIEBAIHVuc2lnbmVkIGludA0KPiBmd25vZGVfZ3Jh
cGhfZ2V0X2VuZHBvaW50X2NvdW50KGNvbnN0IHN0cnVjdCBmd25vZGVfaGFuZGxlICpmd25vZGUs
DQo+ICAJZm9yIChjaGlsZCA9IGZ3bm9kZV9ncmFwaF9nZXRfbmV4dF9lbmRwb2ludChmd25vZGUs
IE5VTEwpOyBjaGlsZDsNCj4gCVwNCj4gIAkgICAgIGNoaWxkID0gZndub2RlX2dyYXBoX2dldF9u
ZXh0X2VuZHBvaW50KGZ3bm9kZSwgY2hpbGQpKQ0KPiANCj4gKyNkZWZpbmUgZndub2RlX2dyYXBo
X2Zvcl9lYWNoX2VuZHBvaW50X3Njb3BlZChmd25vZGUsIGNoaWxkKQ0KPiAJCVwNCj4gKwlmb3Ig
KHN0cnVjdCBmd25vZGVfaGFuZGxlICpjaGlsZCBfX2ZyZWUoZndub2RlX2hhbmRsZSkgPQ0KPiAJ
XA0KPiArCQkJZndub2RlX2dyYXBoX2dldF9uZXh0X2VuZHBvaW50KGZ3bm9kZSwgTlVMTCk7DQo+
IAkJXA0KPiArCSAgICAgY2hpbGQ7IGNoaWxkID0gZndub2RlX2dyYXBoX2dldF9uZXh0X2VuZHBv
aW50KGZ3bm9kZSwgY2hpbGQpKQ0KPiArDQo+ICBpbnQgZndub2RlX2dyYXBoX3BhcnNlX2VuZHBv
aW50KGNvbnN0IHN0cnVjdCBmd25vZGVfaGFuZGxlICpmd25vZGUsDQo+ICAJCQkJc3RydWN0IGZ3
bm9kZV9lbmRwb2ludCAqZW5kcG9pbnQpOw0KPiANCj4gDQo+IC0tDQo+IDIuNDMuMA0KDQo=

