Return-Path: <linux-media+bounces-65492-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KPdfLe5LO2rwVggAu9opvQ
	(envelope-from <linux-media+bounces-65492-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 05:15:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3197E6BB0DD
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 05:15:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=nxp.com header.s=selector1 header.b=VNLmv8HS;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65492-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65492-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=nxp.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B152D304BE58
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 03:15:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C600A308F3B;
	Wed, 24 Jun 2026 03:15:44 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010040.outbound.protection.outlook.com [52.101.69.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94D12FC00D;
	Wed, 24 Jun 2026 03:15:42 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782270944; cv=fail; b=T4nxSOkr62hCsHK8zinNDx3D69i3ioUUXHVDEbeN4XKQJuZO4NHftz6rt1uI9G3oTFyapnO/+3oFPtYC3O2ZZwPU6tOIgwa0P6s0BGL5v488JbeUHineRiI7+pvF0th6zVOdtAKFlYem/7bB7CGkGeLpp7Y3ml1nAbk+flsOkrA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782270944; c=relaxed/simple;
	bh=JNITk1BNnKLc0S1vYp5r/gWjpIRU4er+vTbp70fegsU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZNMKOiJELQnA5MB2OB5Yq7Bh89exS6umd/YtGYWYWXsTHf9znIzqdb3OBH8TUbsrUYkcdL/Br908BEYvtioK+A2am4r64hzhqdd6E4tg9WFmWumEelnYecbsT3fQFCOaOeO2v3yH5zG8LHrne1gjaAM2L0evU7/w3iy22Dg4ZnE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=VNLmv8HS; arc=fail smtp.client-ip=52.101.69.40
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B9tkFLGqAwbKVuZBn/Zj5w6/6K8PCjz6SDlcfSUjvM0IlBQGRq9EDwX6V7t52/cCRapu+bxnW0atfZjZTVplQnnzvP2WRuyVz3ZronUYnb7ISSoxJYOl3LzBYT2p/n503tv3yR+Mp+5bjsUvBEQBQglE/3VcZTMHwweSF86cGND4feYHec3Vdh0iUZGf633CuRoOnNZh3+AAlXqlX0w5KHL87wnNqEOE2r6XocDrycXQWyodrUEy0sw0n4O1aGwg2GHWhZ10ZOtOSauRdFCMo/RcPz6gkKLPsE1s7/L8u1amBE4NQsE4AJQtSetb4PGRrceaFcNfspKjBxKMKv0z0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L69q7hqtuE+dr6mCSS63zKlS/8DKuSasKG+/Mx1ZNm8=;
 b=fkZPOrhBkcWnqhZaiqrsv3m0NTugODUEfo8HPmYCRzAB9x25JC4x+k43Au7zU/4MoH/4aSQRgwJAuDp31GmeE18bXTWxUltstS17OKzE4B7F1UCNSHULPUL3HFDGj9s8f6Cw/xJ4VeaJMa6MAXdkyJq4m9boFjOntQTlNWqMI1Bei3PVdHD4JnztK2kcGwJqDjhEpoAmXMms752McpGl9u2mO8LErpY7xiSW+mw5m1S21LWuYk/vw/3x+Kp7s3KGGBtPWlZgsSUkItpIijq7zpos8chFol2k77SLuQ3SYmPnH6E2nrvwECiEjWLtvRgbjo4YMWjRnxbntJQw+O/rSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L69q7hqtuE+dr6mCSS63zKlS/8DKuSasKG+/Mx1ZNm8=;
 b=VNLmv8HSQbTQspgaFjZo8NLypY75xNWCmQV+Qz9iKIlG2WUehujv+2nRKAduRiQ97gLD4A2Slrz1+lfFx0O5HmlspiPjGZQ58k88njyCZjvTTxtdHp6YHHT9RUUt68uD4KIIy54MPyU2BAcdTmxpTUSwIwu+PlDgIGJXLhIFsDaUPoAMAckhI3bW+4IHtpkGGjNZX6L2U1QVkgVT+7OjqTWO+F7dMytAQGJu49xCJRi0WXjs7DH84uAnm3C8sjIiBu7fCnBCrTmTPZO5ricVtFb6NtbOiM9ld++omHpsnzIzkstE0ee5Y9oMtIL1Q6t3qVqioVoUS9djq451P0e5rg==
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by VI0PR04MB10590.eurprd04.prod.outlook.com (2603:10a6:800:264::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Wed, 24 Jun
 2026 03:15:37 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.21.0139.018; Wed, 24 Jun 2026
 03:15:37 +0000
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
Subject: RE: [PATCH 2/4] media: mc: use
 fwnode_graph_for_each_endpoint_scoped() to simpilfy code
Thread-Topic: [PATCH 2/4] media: mc: use
 fwnode_graph_for_each_endpoint_scoped() to simpilfy code
Thread-Index: AQHdAlO2S9u8oDYSvUOuCIjyNu1QE7ZNCKnw
Date: Wed, 24 Jun 2026 03:15:37 +0000
Message-ID:
 <AS8PR04MB9080F3143F9ECFC26FB40CC4FAED2@AS8PR04MB9080.eurprd04.prod.outlook.com>
References: <20260622-fw_scoped-v1-0-a37d0aac0a68@nxp.com>
 <20260622-fw_scoped-v1-2-a37d0aac0a68@nxp.com>
In-Reply-To: <20260622-fw_scoped-v1-2-a37d0aac0a68@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9080:EE_|VI0PR04MB10590:EE_
x-ms-office365-filtering-correlation-id: 7ea18f9b-6b2c-4341-3bd0-08ded19edd18
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|19092799006|921020|38070700021|18002099003|22082099003|56012099006|4143699003|11063799006;
x-microsoft-antispam-message-info:
 KNcmpRnWdPBxWkQrEvmJM3Syy1JS+Cr4pVV/aZjq7x1wbl6KYeSdQa2hrzf2IupVcEYV24p2jqy9vsLe3NUwLBxBjHF0SRh2jXx3ntixb3iosxuEu9lZQvUTMRwhMP9BriDoJCbKsUeF65ssroWzBJaEEWA48CNLKXEtRFZkaqDGXP3DPXWxhgXJgLJMNMuanB1hoNYTntYh7ooWlMa7YlGOOALaL1uiVZXnoPIeNC2MkjzlQNztE3gd608tUlnUJxDyPzEYAtfQIB/KTu78stIs94LuLNhqXexUj2Fo7ht3GXeosvJSd4h9vkUTuLTHc3scoZRSjg8EUf2deKujKSTK/4NH7uQRvJMMwSkbl/aeVwygmSg4+GTuiuwaJtmcu0CphMvm6obnTQV4YJ+ksY3pUvZeD/DxHloa/uxmOJuTuUppQWzrL2pIJhAKZjek2jW4wjaaMZwCOe/LtEIweQno2AAjHEYpRKb2M4CkYoJo1Q6DFdnj8AXpMozZ0tR1WPIgDWs8SyBbZZIoFUBwEyHfCvjQiLsXMX2F6Pgn16/6SHSmK9Px3K/wULHpvOHB63VN3OYxESLN7j272vpZczrEP5TsbRiZ65DJMJCw5iizXbLdgU4RLGOHrDJjs3a3JY1XmT6SpaQGr6uvdWrQWSLHorJMHS+p2Z9JK812O1kJpT9/osyOogRWqIkjijfCGpiJwLJ6JjsfL95NMzrNB/xsYj/EpaiwD2zoH0ifzaHeDD8APg2CD5oMF93eNcTc
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(19092799006)(921020)(38070700021)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?VAykx0O0I7kkZj2hbliCIRwvPgvi6g3fdH2Er1oA2Bc/j0m/JIZeTJowcCp2?=
 =?us-ascii?Q?Ay/7g2Fwcpgff53TQCmoetGMTp5C4vJsXNE42ow9w7y+PCzh1ZHTdFR6bpQd?=
 =?us-ascii?Q?Hp9kqMTwI1uQTJ9rRQ3P/eMhX1j/RWKGA0YLVYeNZHGO+25r0jF7TLjIV4iC?=
 =?us-ascii?Q?TRB9/v70KiI69q1IU4MEFYngepWgFtjSwmfZfnro6X6SlJ4Q9LhV0TbELdK0?=
 =?us-ascii?Q?8k/BG0yE50fynju3r0A3JhRYT7bB7F9gxrU/QV0WZ7n7mXK9uhIoVxlkRVVu?=
 =?us-ascii?Q?Tq3VfBNciZt/nE6DuaEpHS1rQR+qmarSQrKM8c024vYQsDM7lCx0HKa9xcIC?=
 =?us-ascii?Q?MgByifKmfQh0FLTkFhJbQAnCl7AL0axBIW/QrDlpY5m92wOvBCke7w1kIybj?=
 =?us-ascii?Q?HEcOp6NxjdZvtwU0CWivdHZHKVciyk7gzCdJ51S7G1PJUcUUxBsAHW1mGbZj?=
 =?us-ascii?Q?fg8GhcV4/a/JkcxoILVmQkRzFNVpon0LRVKJQFNjJK/DbtDL9gOnFT4IV9sb?=
 =?us-ascii?Q?Z0xxIImi8cQC45AZyI5naWbxmAqszOn0+rBPPkXXjNa9WCGUcJ2KP2zxkoLu?=
 =?us-ascii?Q?x5E4wormo8+UQ4XAo8UzmPTtrghL/ojgeu8fzFQU/31PK9VLP8eSAR4TZntn?=
 =?us-ascii?Q?fR75IPKsIYitG3jnErtlcBO5FXn4o10CqM/kBc06klBB31YMC9l+XBjeTNkg?=
 =?us-ascii?Q?kJPuqhsMpJIuKPAqzdCQkZf3Iqicy0CgB/PMhx2boLnddSbC8O2UjbSWXb6d?=
 =?us-ascii?Q?uxZgIrdbu07gFq4ll6OYQVTb+6HUFBCMCmaI/PZApQF3AJ9ZCoeybcXIhKeo?=
 =?us-ascii?Q?+m6RgtATCKqlkpKC+sx3L2cTInWsWNga6wqEjdnznJPNpzGgJsGHmuMwS4ce?=
 =?us-ascii?Q?L1WrV23sggohbwYeenlErioRiYOqdjxHobk0HINQO7Ke2h70LxMsUWIGRNfR?=
 =?us-ascii?Q?Ewg53zRqjEjT+kF3kGyb99HyFb26dizHSKmqaAlBvA+/40ZHwPyUObdyeqNe?=
 =?us-ascii?Q?tbDbwqf7pgwRm5DsLYatvtNNzQhXkakCsUnfX0o2eDhczisMkXoIccyj+9Po?=
 =?us-ascii?Q?pm+bOqL1jYur6XUIfZtHFBDJ7j4Jwc1NrtXNOljWnCZM7/zCeBxzNi2isF2r?=
 =?us-ascii?Q?h6dCcKdtmFmPIx9DAxETtw985/6DAd2Cfkwh7TOtUBatvEdyr4sImoX6qWOs?=
 =?us-ascii?Q?WzZMmO0JMHSqb8lrqjej99dKeckSoPcsRHBazIXGHLlFcg/oscjHtMfO953a?=
 =?us-ascii?Q?v0tPi5Rc12ecJudtszbQcLDnhotv4L4wT+k1lyj72poCzFp3zr1Gwe4areSN?=
 =?us-ascii?Q?epJy9xI/ZnG/B2XJEX+hL18f4yG60EPg8sKLgH3PeSTAq7Jz0R3sh8Xe/UOI?=
 =?us-ascii?Q?fZOUiD5EWwptNVqJZhesfagl16KNGa3EJ9fK/fbJXy4h/COHSuE+kBdQMULg?=
 =?us-ascii?Q?w/K74BcqwJuUrbu5FlKcWEGh+CznhLeBgd5Q79+6xDLJ+X3yCc/cnWfEnwr/?=
 =?us-ascii?Q?sAY+kH/OvNB5kNHfIWjzZ9zteqx/JyS/XGx9BgEymgTyegQFXmZwoaQXszWT?=
 =?us-ascii?Q?8G1le26nPAvYq/QWzBn5Q17XlcujVrwC9nuobxophAJX5jbfu/n7ulXCh5Be?=
 =?us-ascii?Q?Z0tVnCwoycWIo53lq2TbwdzCRE5G42z2WMZcEIrKAfd+Q6LkEaUIzHnOglCV?=
 =?us-ascii?Q?Ly3II8SUj3mWErn07/1aiqrhFBNmNE2lNJJpPreEyVJDC3/B?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ea18f9b-6b2c-4341-3bd0-08ded19edd18
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2026 03:15:37.6940
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BFXYKBpF2qldJEyZINzPf7tLsH463PBqU+jIKlLEX4B6ZDGuSAML1BYqv8sG6zRUyYGamaqfygPncjSPkzQR9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10590
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:frank.li@oss.nxp.com,m:andriy.shevchenko@linux.intel.com,m:djrscally@gmail.com,m:heikki.krogerus@linux.intel.com,m:sakari.ailus@linux.intel.com,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:mchehab@kernel.org,m:dafna@fastmail.com,m:laurent.pinchart@ideasonboard.com,m:heiko@sntech.de,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:driver-core@lists.linux.dev,m:linux-acpi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:imx@lists.linux.dev,m:frank.li@nxp.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65492-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[oss.nxp.com,linux.intel.com,gmail.com,linuxfoundation.org,kernel.org,fastmail.com,ideasonboard.com,sntech.de,linaro.org,oss.qualcomm.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER(0.00)[guoniu.zhou@nxp.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3197E6BB0DD

Hi Frank,

> -----Original Message-----
> From: Frank Li (OSS) <frank.li@oss.nxp.com>
> Sent: Monday, June 22, 2026 10:30 PM
> To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>; Daniel Scally
> <djrscally@gmail.com>; Heikki Krogerus <heikki.krogerus@linux.intel.com>;
> Sakari Ailus <sakari.ailus@linux.intel.com>; Greg Kroah-Hartman
> <gregkh@linuxfoundation.org>; Rafael J. Wysocki <rafael@kernel.org>; Dani=
lo
> Krummrich <dakr@kernel.org>; Mauro Carvalho Chehab
> <mchehab@kernel.org>; Dafna Hirschfeld <dafna@fastmail.com>; Laurent
> Pinchart <laurent.pinchart@ideasonboard.com>; Heiko Stuebner
> <heiko@sntech.de>; Bryan O'Donoghue <bryan.odonoghue@linaro.org>;
> Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>; Loic Poulain
> <loic.poulain@oss.qualcomm.com>
> Cc: driver-core@lists.linux.dev; linux-acpi@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-media@vger.kernel.org; linux-
> rockchip@lists.infradead.org; linux-arm-kernel@lists.infradead.org; linux=
-arm-
> msm@vger.kernel.org; imx@lists.linux.dev; G.N. Zhou
> <guoniu.zhou@nxp.com>; Frank Li <frank.li@nxp.com>
> Subject: [PATCH 2/4] media: mc: use
> fwnode_graph_for_each_endpoint_scoped() to simpilfy code
>=20
> From: Frank Li <Frank.Li@nxp.com>
>=20
> Use cleanup helper fwnode_graph_for_each_endpoint_scoped() to simpilfy

s/simpifly/simplify/ both in message title and body.

With this addressed:
Reviewed-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>

> code.
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/media/v4l2-core/v4l2-mc.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-mc.c b/drivers/media/v4l2-core/=
v4l2-
> mc.c
> index 937d358697e19..5d7fcd67dc42e 100644
> --- a/drivers/media/v4l2-core/v4l2-mc.c
> +++ b/drivers/media/v4l2-core/v4l2-mc.c
> @@ -324,12 +324,10 @@
> EXPORT_SYMBOL_GPL(v4l_vb2q_enable_media_source);
>  int v4l2_create_fwnode_links_to_pad(struct v4l2_subdev *src_sd,
>  				    struct media_pad *sink, u32 flags)  {
> -	struct fwnode_handle *endpoint;
> -
>  	if (!(sink->flags & MEDIA_PAD_FL_SINK))
>  		return -EINVAL;
>=20
> -	fwnode_graph_for_each_endpoint(src_sd->fwnode, endpoint) {
> +	fwnode_graph_for_each_endpoint_scoped(src_sd->fwnode, endpoint)
> {
>  		struct fwnode_handle *remote_ep;
>  		int src_idx, sink_idx, ret;
>  		struct media_pad *src;
> @@ -397,7 +395,6 @@ int v4l2_create_fwnode_links_to_pad(struct
> v4l2_subdev *src_sd,
>  				src_sd->entity.name, src_idx,
>  				sink->entity->name, sink_idx, ret);
>=20
> -			fwnode_handle_put(endpoint);
>  			return ret;
>  		}
>  	}
>=20
> --
> 2.43.0


