Return-Path: <linux-media+bounces-65493-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tISEBVVMO2oPVwgAu9opvQ
	(envelope-from <linux-media+bounces-65493-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 05:17:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4186BB108
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 05:17:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=nxp.com header.s=selector1 header.b=ex1mzyfD;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65493-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65493-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=nxp.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D2D363048DEF
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 03:17:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC4983090D9;
	Wed, 24 Jun 2026 03:17:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011010.outbound.protection.outlook.com [52.101.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6A8306486;
	Wed, 24 Jun 2026 03:17:16 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782271038; cv=fail; b=YkiKkQiWBbZjYd+y5JBYg0l9rmOi21CBj21rQEd4cWpU1kOEO/kf2gq4+tiVND8OP7KizFPhjuFrPXKRDeBHIC2GuWFsC1pWhZFesYIKQDamF31bUzo09KVvmuTaqlTNBN0w7IwbugjKabHd3i3U5T/NTCzYK1L6HsGW5Vh/pAA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782271038; c=relaxed/simple;
	bh=fqNWmTV9Dxdgpko8RyOqyhmXjYg6a8SB/qcOxBlWi6o=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ubFAMSM/4LkocIfwKRjc1A5F9KB1tx5Sf1HYO2dTRUR25CDkEb9Z/i0ZE5LqDe4dE3t8T2vKA1MwPPNhbmJYF0884J83C7vgmJ1gdLgVp+5NXL/rmyy84a5qonXcQuzgTDSEQnbMoscQjA5KskvlprDHTLvLPNAEsxgDTOGKtX4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ex1mzyfD; arc=fail smtp.client-ip=52.101.65.10
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tj1OaPSsNg8kfLYxgIHTBE4HtIQ4R0sAPD1NIlKKjQKbd34qlQVKSzQ7iWpv4Wddk2JmhT6/c7mAvPAr29GplMk5/o+3NdNWC+kqBUzCG9LUT6clA9c/unzzvxty2Y3yUU3YqqwAPG9KkCgNcb12e6vZdDRy8cl30qb1F25kj4xhS+2tUtY8S1HWKfdA2gU+iztAK/rOIYRb5YBf3/t0eTntk6cp4VLyoBM927jt7hpJjYJF2iEo3raaOfNay6Yf0RzEwtLPgPp3MEIiisvk3a3o/E1wSdAodtsgsvGXzxlDdAuP0LRkq0+pwMgaEdmnmFe7w0VQqJTlqQXrI+z5+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fqNWmTV9Dxdgpko8RyOqyhmXjYg6a8SB/qcOxBlWi6o=;
 b=BK//MZ8gAm5uGhrv9PcoegTUrmRfnfyx844YOPvAy2dXdMXpxCsVokGl+tmgOt1ZHxVzCvC9VNMC/jtvJBe2iJIGtpOuduUC+6Q0P8buJMYA3T6x3a6F4ZloZeC7SfUxNoJk0/D+kYfYxvXOOhP/RFFhqh8YChJbQQ01GcXxUNOV6HyX60yxZ9O1fuB5q7aQJkV66naw0WswKFcxKH0TF72yQ68D0KtYLkR/mVwkqedK9v7QBX+HpL0xeS+RminN2lL89/ZsgqMRLH3gz6Sg9hyXaa2ns1YI1Ggz0o9KPEsLgnQjfX/3F9OhyKmXBsvlplKmN3LrxoB5QYoD2bzupg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fqNWmTV9Dxdgpko8RyOqyhmXjYg6a8SB/qcOxBlWi6o=;
 b=ex1mzyfDj8TIS9dQsqJfdQbLqH57lnZgd8zcj4noQutEGjzjOTXnxMF8lFx2ckwVQgkNK4fe5VO4B7NoOFviPKcIAsQ/vkFHbi0UeXRWDY/gKHSho6MUlIuS2ccjMPp2xUNuGWJeN5diLwQ41BlhRv9gSQUEp8F+S0j7VOsQX9go7nOYFDDjBBqLhlZt3Lut1eUflzhdgPVszGKExxtyHW8PezUS06k8TEACwVsHVBOedkBaYbfCDlAh9qVees8q09oxp7sgySNujk6KWrIQkxRElYO4BGJZKLk9jzD7/UR6BfNKXw6d8RH2xBBQByjRsyohYlw6A1gsPMdTzgMavQ==
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by VI0PR04MB10590.eurprd04.prod.outlook.com (2603:10a6:800:264::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Wed, 24 Jun
 2026 03:17:13 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.21.0139.018; Wed, 24 Jun 2026
 03:17:13 +0000
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
Subject: RE: [PATCH 4/4] media: qcom: camss: use
 fwnode_graph_for_each_endpoint_scoped() to simpifly code
Thread-Topic: [PATCH 4/4] media: qcom: camss: use
 fwnode_graph_for_each_endpoint_scoped() to simpifly code
Thread-Index: AQHdAlO8xvgwLshCx0qcG9P9W7PTubZNCwWg
Date: Wed, 24 Jun 2026 03:17:13 +0000
Message-ID:
 <AS8PR04MB90804423362CA11D83F7075CFAED2@AS8PR04MB9080.eurprd04.prod.outlook.com>
References: <20260622-fw_scoped-v1-0-a37d0aac0a68@nxp.com>
 <20260622-fw_scoped-v1-4-a37d0aac0a68@nxp.com>
In-Reply-To: <20260622-fw_scoped-v1-4-a37d0aac0a68@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9080:EE_|VI0PR04MB10590:EE_
x-ms-office365-filtering-correlation-id: e05e21bc-4543-4ca9-1535-08ded19f15fa
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|19092799006|921020|38070700021|18002099003|22082099003|56012099006|4143699003|11063799006;
x-microsoft-antispam-message-info:
 TxoHpOUjc64esV6XH775pzCwu5pSMHsgq1pmc0TvgU0mOOjTgc/ImZGiXlNdUwmhMp/rKzow8YFKiPjy5LGgRmE8NVpYAhLJiqOBcWyueHn0y5r8E2jzd/c7DLqi1wndglyMUrkX0WPnkDZ9LF+AiBFye1RtVQKOodBKBt3bVDfFAOUqTsYtVPrv2sxqES0W8B3WCnqy22e/clLKWhb2gkc8jnQ+0SjzDKwQ/F+ydZmBEttwL/AOPUfNIdSZm9Xip82yno3dycjJ1gejeqUTxxiOeTe/IC77l53OQCnN4ql431TIF7MHzK6BZz0l+dbSQyXzSHq3F1aNnRNxXS/NciS2iufYU9ej7SsJE2pQf+/8WGBH/hj7HdY1fawZF+qVY4RNJc5amRoZQImn+MgKwY3ZWuS/kZfTOWe4U3JMKzbJI1l6hv9mM2vlfU+XoSCtTRfKFhGYcCqPkSc1Evv+WYVw58LhBnaAmjeF2HL5nIn7kP3G5izNDibbeTvgsl7ilHFA3pBh2zSFNIzzEXfnzZtRNaPoOUHpdTIS6NCTcjsvXVGRgVqEP9bZ1S063RAFC+AbX2qbgPS/1Mpy9QioiiRWeMYS5sZs/S3e2my7dQVRttkviBD/hBCQc9PUs7R252/CQjFdKVhTVLqFST3LpV28ENiJNPV8r5nB3zkbuxokOPNIAwnt5d4Jfng0vr2ZjCZos2MRlL3FnyHMpeXw+xnprtTKXSLduyUMhtgWzKHayyMZac+tI9ghp0FK0d36
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(19092799006)(921020)(38070700021)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YUFZZkpKWkppSy9pL3p1Z3lZL0tGbU1Uay9idm9tT1l6c3ova2l1bDBCU0NC?=
 =?utf-8?B?NGVqWGp4QStFdEtOTUVTMXZyYmRnOUtJQThhZjdqNDNFeFhvRDdHT1BxQ3dO?=
 =?utf-8?B?Y3A5NTA1RUxYZGxRY0l1bllYc2ZrQXhFR3pWbFVKaFNORm8xNktvK0hOeDBw?=
 =?utf-8?B?bEs3bXA3Skt4VGNDdGdBWUc0d2VOcktZbjZGTU81U1o0V0trRzVld1RzZjM2?=
 =?utf-8?B?bGFoMGtLSzQ5RzV6aEU1VXJqOVdvV2ZpYlNlazZFaGdnSE5XZjNGSDh3TzBn?=
 =?utf-8?B?MWZxRWkrbHNyREJkbmVobzkySTJtSHhyZ3RKNjJVTFFTdFB0Q3VIaExxTkdV?=
 =?utf-8?B?MEFFN2w1UitwSFNaNU9WbGV5d2xPRnFPN3dQaHFGdFZxbytTWUdacnZob2s4?=
 =?utf-8?B?d2ZWKytndVpZNDNZWElPM2NiSGV6UCtTNWVueEpBazNpdE1zc0FtdjRwb1Vx?=
 =?utf-8?B?bDJ4RzlaYkdpWTBMV3JpNFo1K0VoY3dnQlAxRWFING5GYUJJNy95M3UxMllr?=
 =?utf-8?B?dUFFdDlCZU5mNGVWUnU3Tmx3V1FLWU5wUlJRd3dhVFZCTG05UkZNVVRDZkNs?=
 =?utf-8?B?c2p0N0UvSHZrS25DOEZvUnM3bDluc3kxQk56clVUZnNjVGxpbUtRM3Y4ditr?=
 =?utf-8?B?OW1YcjBaVFZlcU5IK2pUcVdyWmpqMndXRHJCT1dGN0xZZThyNytmbFRGZlUr?=
 =?utf-8?B?MjFzOGxOQVhOb0FoVDNGb0NEbzBSR25YTVlkY3doVTlEeG4rd1ljR2N3ZzhH?=
 =?utf-8?B?bGxwdGEwS3dXZ2IvN0U3OGZBN21ucWVEMHhOaFAyRzR6dy82NVcyeGdYdldx?=
 =?utf-8?B?M3lnQlFZRFF3aEtiV21xc0FocUhGRytQbXdPdkQxcEJUOWw2YzhMK2FYa01l?=
 =?utf-8?B?M01BRzZWcE91N01lQXZ0VDc4bEIvNjhsM2ZoZysrUE1kYjJtRTNwcFYrWEdz?=
 =?utf-8?B?dklPbG8rK2JqWDJJS0lIM1RFY0xyamdydVFDeEo4cmxYWFRQSlA0bjF3cnJu?=
 =?utf-8?B?OHM3bzFLNGpnVlNqM2NrS2g0cjNTTEFiVnN3a0hCbzV2TUtINGJraEVYeVRh?=
 =?utf-8?B?Q0JzNFhQQk9wUnJHaGt0SDU0Y3lrbzdmTmVhak11YURmQTdmelNmMmRaUXNG?=
 =?utf-8?B?Q0VXNHdNS0x2dEp4NkdyckFKRUpWWGVJRzA2U0VUMU5RclBYc2FlK29QUlUv?=
 =?utf-8?B?MXg1dTdJYlJUUCsxTy9nVUhMSWsrdDlGSnoyalV6MTd3OGNmWFNQK3ZFWnEy?=
 =?utf-8?B?VjE3K3lJRk0zaWZhbDg4ZnZPMmNLckg0bUxpQnAwRDhvaFZuSmJCR0dpZEta?=
 =?utf-8?B?aTJXZ09YZHV4S0NhTng2dlZFekN0cGVGUXhiVi9lcUNZTmZzRG1yZ0NrQk5D?=
 =?utf-8?B?SkdXam52ay8rbUJOYWI1ampTMjBZdDh5RlY1UFc1aEVQdFB2azRDeFI4bnV6?=
 =?utf-8?B?OW0zKzF0dDdFV2xsZDVGWXAyQXpKKzNFZWxOY1l5TEMxeGRyTnp2OUdaUXd4?=
 =?utf-8?B?TjhsckVCOEhpT0RPNTNYbTRpR1JRT0trUDNxM0dndFJITHBuZHdHVU5BSlZX?=
 =?utf-8?B?U1ZCZVJGbHMrMlpaNjBvRDVHMERnc3dCREt0ZEVMMm1pbndwQlhicEhlWGlN?=
 =?utf-8?B?Z0hRYUhkWjA1Y2hIalVZbHEzWWVOUTdBbVRMNEpibUV2SUJZNVd3Ylh1MkR3?=
 =?utf-8?B?RnljbTNPZzNnRDUxZzMyUHM4WVBnQitQSGtRdDY1M1ZRY0dZOGlyYkh6cFRu?=
 =?utf-8?B?c0YwN1cwNTRUamxuSXRLUVlXU1F5ZnF2NTUxYXkzR0NhT1ptSm9wZFgvV2xY?=
 =?utf-8?B?NnN1WDN4STlPdHdZYVZ6Z0kvc0xQS2oybXBGY01DaExOaEJUMEdNZ0NLRk00?=
 =?utf-8?B?MmhPc2tQY1AvUGdDNW00N2ZVV3cwWmJaNWVUVkFtaG9JNGZtWEhyNUZCUGtO?=
 =?utf-8?B?L3VJbjY3RmFTakZDTHBBbmo3R2ZzNWc1d0pMQnhJc0d4Z3Rpd0hTaURCVHZS?=
 =?utf-8?B?SGtUUWdEMW4yUzZKQTA5S0ZpaGRRbElaeXpZSk5KZmZJdHFvSnVYL0l6WTdB?=
 =?utf-8?B?OE5vYTRyVnpROXY3dHprNm5WYjkvSC91a2VXMDF2bzRGL1QvS0I5VEt6Z1Fh?=
 =?utf-8?B?dWRhUFFDQUhMRnlJQThBVEluNEZ6b3QyL1lWS0Z6TjRLNHphSnY0WUZiRnk0?=
 =?utf-8?B?RHMzeVRxYmRaUXRPSEIvS0tHVCtnbGlYdXFla2Jta3p0VXNxWWl0bmVpSjRM?=
 =?utf-8?B?THlzMitkbGdGZHhGRnlTUTlCa05GWW5oN3crdndiaWtrWVZwNklldnFYazhW?=
 =?utf-8?Q?dQ/Tk3IFNVOdJP+136?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e05e21bc-4543-4ca9-1535-08ded19f15fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2026 03:17:13.1019
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fUQmPLhSY7gH9DcgzUzJqQMe0rTXFp0QkvSvRueX6dxkoni0TsdUmhZoskzJPR73Ac+jw44I1XtSpGV8BBmMwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10590
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.94 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65493-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5F4186BB108

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
OyBGcmFuayBMaSA8ZnJhbmsubGlAbnhwLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIDQvNF0gbWVk
aWE6IHFjb206IGNhbXNzOiB1c2UNCj4gZndub2RlX2dyYXBoX2Zvcl9lYWNoX2VuZHBvaW50X3Nj
b3BlZCgpIHRvIHNpbXBpZmx5IGNvZGUNCj4gDQo+IEZyb206IEZyYW5rIExpIDxGcmFuay5MaUBu
eHAuY29tPg0KPiANCj4gVXNlIGZ3bm9kZV9ncmFwaF9mb3JfZWFjaF9lbmRwb2ludF9zY29wZWQo
KSB0byBzaW1waWZseSBjb2RlLg0KDQpzL3NpbXBpZmx5L3NpbXBsaWZ5LyBib3RoIGluIG1lc3Nh
Z2UgdGl0bGUgYW5kIGJvZHkuDQoNCldpdGggdGhpcyBhZGRyZXNzZWQ6DQpSZXZpZXdlZC1ieTog
R3Vvbml1IFpob3UgPGd1b25pdS56aG91QG9zcy5ueHAuY29tPg0KDQo+IA0KPiBObyBmdW5jdGlv
bmFsIGNoYW5nZXMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBGcmFuayBMaSA8RnJhbmsuTGlAbnhw
LmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL3Fjb20vY2Ftc3MvY2Ftc3Mu
YyB8IDE3ICsrKysrLS0tLS0tLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25z
KCspLCAxMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3Bs
YXRmb3JtL3Fjb20vY2Ftc3MvY2Ftc3MuYw0KPiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vcWNv
bS9jYW1zcy9jYW1zcy5jDQo+IGluZGV4IDIxMjNmNjM4OGUzZDcuLjIzZjNjYzMwYTE1YTUgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vcWNvbS9jYW1zcy9jYW1zcy5jDQo+
ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vcWNvbS9jYW1zcy9jYW1zcy5jDQo+IEBAIC00
NzkzLDMwICs0NzkzLDIzIEBAIHN0YXRpYyBpbnQgY2Ftc3NfcGFyc2VfZW5kcG9pbnRfbm9kZShz
dHJ1Y3QNCj4gZGV2aWNlICpkZXYsICBzdGF0aWMgaW50IGNhbXNzX3BhcnNlX3BvcnRzKHN0cnVj
dCBjYW1zcyAqY2Ftc3MpICB7DQo+ICAJc3RydWN0IGRldmljZSAqZGV2ID0gY2Ftc3MtPmRldjsN
Cj4gLQlzdHJ1Y3QgZndub2RlX2hhbmRsZSAqZndub2RlID0gZGV2X2Z3bm9kZShkZXYpLCAqZXA7
DQo+ICsJc3RydWN0IGZ3bm9kZV9oYW5kbGUgKmZ3bm9kZSA9IGRldl9md25vZGUoZGV2KTsNCj4g
IAlpbnQgcmV0Ow0KPiANCj4gLQlmd25vZGVfZ3JhcGhfZm9yX2VhY2hfZW5kcG9pbnQoZndub2Rl
LCBlcCkgew0KPiArCWZ3bm9kZV9ncmFwaF9mb3JfZWFjaF9lbmRwb2ludF9zY29wZWQoZndub2Rl
LCBlcCkgew0KPiAgCQlzdHJ1Y3QgY2Ftc3NfYXN5bmNfc3ViZGV2ICpjc2Q7DQo+IA0KPiAgCQlj
c2QgPSB2NGwyX2FzeW5jX25mX2FkZF9md25vZGVfcmVtb3RlKCZjYW1zcy0+bm90aWZpZXIsDQo+
IGVwLA0KPiAgCQkJCQkJICAgICAgdHlwZW9mKCpjc2QpKTsNCj4gLQkJaWYgKElTX0VSUihjc2Qp
KSB7DQo+IC0JCQlyZXQgPSBQVFJfRVJSKGNzZCk7DQo+IC0JCQlnb3RvIGVycl9jbGVhbnVwOw0K
PiAtCQl9DQo+ICsJCWlmIChJU19FUlIoY3NkKSkNCj4gKwkJCXJldHVybiBQVFJfRVJSKGNzZCk7
DQo+IA0KPiAgCQlyZXQgPSBjYW1zc19wYXJzZV9lbmRwb2ludF9ub2RlKGRldiwgZXAsIGNzZCk7
DQo+ICAJCWlmIChyZXQgPCAwKQ0KPiAtCQkJZ290byBlcnJfY2xlYW51cDsNCj4gKwkJCXJldHVy
biByZXQ7DQo+ICAJfQ0KPiANCj4gIAlyZXR1cm4gMDsNCj4gLQ0KPiAtZXJyX2NsZWFudXA6DQo+
IC0JZndub2RlX2hhbmRsZV9wdXQoZXApOw0KPiAtDQo+IC0JcmV0dXJuIHJldDsNCj4gIH0NCj4g
DQo+ICAvKg0KPiANCj4gLS0NCj4gMi40My4wDQoNCg==

