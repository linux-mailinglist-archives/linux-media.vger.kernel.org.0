Return-Path: <linux-media+bounces-27392-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA1FA4C698
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 17:18:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10DE03A3F9A
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 16:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F91F22689C;
	Mon,  3 Mar 2025 16:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Kx8MhguT"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010044.outbound.protection.outlook.com [52.101.228.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632BB21B9DC;
	Mon,  3 Mar 2025 16:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741018245; cv=fail; b=c7lcFi0+gnNf5Rf080ZnSuUbUbc6YoKRqBbLVHYbq+EVo1Ntk36F01N2qqz8DkRXoW5MBsYT5iK0/br3ly+t0slZJs1vgN0XG1fNupdQs7MmRV6r+vYd2DG4enGc8IbG05Sp1hvrW1+ZbTw+jXZmrqvIIPFpKrW4sG+DfIOwCyA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741018245; c=relaxed/simple;
	bh=RF13DkM6Q9CQ/7QlEkmWIR4ZREIFuwHvU3wNJOpyi+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DayTES741eNMqDN7D+fouRkYWg8eMmhB2+c1kh1xI+bc3diUJMAaPejCb+RRHlgRqvzK1MTV3nLAUbph12kuuMptozcuIZZD14bGTsDd7SoAYzdf7tf7DqS8/EFzwDuiB+fXpOPgD9j82vHVoorI+ZqGK/HvLWGXpN+IqtBA2iE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Kx8MhguT; arc=fail smtp.client-ip=52.101.228.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UHQuKoiNUuSTkJsRIYSDnBkNGJLCafWrDHMsiRpHNMl7agwns2Fgqa6x66NPQMF1dE56mEbgLJj92VTe+XnEJ7N/jZO6DWB5BMetjmrU7XUPs+iDLXA63zNfJRlBXFdS/lz8QoKUzid7F1AjwqXzWwzkCkxM7gZG8/AOI3YT/FyZAljErdfB+88+4YWF5SCwvF9LGHrqehKUHtUS5LjriA69Nc8S2/a6BpUvxvxSJLuxPXWJV7tgwl46nwaZCaWJ4ocaJ/tjqypalqmSiSePS8x/lQ+6Cn8wbvCCMEA4oCMS1g9G4Rjd/Wo08+LyPGV05a0xMMXFCRIDD/HE5rZfzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XLKpxNsBF5xTXAIuDGy5THwATi5YWhLTwHjytEbsHYE=;
 b=T/BPuv6wVpkJSSzb1VqJXd3Qp4XNJCmtF+p2QaeDs5PtE6DvkQpuALNq+wvOQl2V9BLbQ4x1iyoolG475w5jOgRmBfTIPa+qR9DPAEXVfGWq17yXo6Lddh2is7h/rEroqTKOkanf8SacvzgHnC5FlwNKX+ZqxaWE7/eh2Qu/AZVU7vhtU6bWq3r2ECXVWWtVRaQX0WrXiX8DzgulI+3y0roAIjfCW0NWz3lB8N2D5ZLCIUOBpqmm7Er0mbG+IV0fr7MNq8YUrQkoUOUxK0ga/THEM9+sNC/292pRMpJOOqbS+sLCC+sqknsHv9XqSA+RLSULnU4MXw4rpu4jbUt4hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XLKpxNsBF5xTXAIuDGy5THwATi5YWhLTwHjytEbsHYE=;
 b=Kx8MhguTfkbvakokSRu8LcBTjSaSNzlz4oCAq+5yC3g0fr96LmETuiTNh9pZOQcSROPL+g3OOtWyVjkapE5hbEKD+34BoB3yWkzZDBxXDbWNBqsYpKnL5hZR/tfWr3Bgc4UHxvFNswWSWDJyldDZqg9wCRl+zAMDVQzLY1vpAHw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OS3PR01MB8683.jpnprd01.prod.outlook.com (2603:1096:604:150::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.27; Mon, 3 Mar
 2025 16:10:41 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 16:10:41 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 11/17] media: rzg2l-cru: Add register mapping support
Date: Mon,  3 Mar 2025 17:07:51 +0100
Message-ID: <20250303160834.3493507-12-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250303160834.3493507-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250303160834.3493507-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR5P281CA0032.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f3::6) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OS3PR01MB8683:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f1caa50-72a5-4652-134d-08dd5a6df1cb
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TC2guJC4eXdbYL+VE5x6RYv3WAP+9kQhNelDDjgjRp50PQKXIZRtSNuzJrry?=
 =?us-ascii?Q?qO9Yji5OSfVkscKi+XASgehDkHVmy8yR+DBCGYdDcH/q1H6HhCl9OgFtxABf?=
 =?us-ascii?Q?VHCLmvkbgYHMVy0iY0xPo7G9JQ23zcU8VYQGdLs8M5lldka/J4SCx29rBlAH?=
 =?us-ascii?Q?LutF6Mn8XXsyusseyZeIhrosZQIisDyDriBo2w4nujmtg0LAAyc0PnaJAbJ3?=
 =?us-ascii?Q?rJh0QqJkam54TyyhvUoyOB/9eqbzXHnGFePCJEJsqhi85e3ykXpU+VSyaGok?=
 =?us-ascii?Q?YURe2NvBrd6zTo5UiEg5vthof2jVAvl9UgfsbcyjtN21pdgGgDLYWQO/Hajz?=
 =?us-ascii?Q?6aAscpPeKVh1jr1c382q3g5YJCiaFYl+RUJH8yJcZQVQqUu9Xig7B6/qIMVb?=
 =?us-ascii?Q?l+oPYMOaRSS0QtYixH7IupeTfmD+p1cMXWaQLDnQlIGONrFQHiPaYQ4T3EUA?=
 =?us-ascii?Q?p2ZQ1qe9c/DgwHvF6ote9Zv+rbgne6VslRCSIlGkB7JhZk0qNp8E4Ost0KtP?=
 =?us-ascii?Q?Xmdx6tFaX5y69VWb02LZxvEzT+nTpCVZ+UhTGPHV9NoJQBdgMAaJYn7iIwBs?=
 =?us-ascii?Q?jdjB+3YVaQxji1SNbZ855Pifw/KQfOcRSYHlO9g3r/EAxE7xd2pI9W8B6q4q?=
 =?us-ascii?Q?pBvKXrHJHtsvVg6/TGmmHTj/sjewpPGTF79vDSg+ijonrrEhLdnXgg9icHMx?=
 =?us-ascii?Q?+6eeB9TY6GAERcW/BAzns9A6V7CXvssrA/8zy21ty10qkpHeuT7jtIse60yz?=
 =?us-ascii?Q?e8dgo1+KWNEdrGsrxIuuZeL3RhG4+UD1vCokx3Eb2iVoo9unF4SbmFi/48zx?=
 =?us-ascii?Q?MY1qoFk/25qmWXZRN9735O+hphXDqHjKBYRSKvuAlOHTWqbq7//3xFUPqZX+?=
 =?us-ascii?Q?6P+yOhxYO+WVdKSXlqmJ4PSBROnTqdOqFVk7JOKsjNNajCg4L0+1tjgE97cZ?=
 =?us-ascii?Q?0QaSpNTN/lsmJoVwrImhzHomjcBNtlgVd/wb+NK1jKfYn5WoBa05C/CYfkjN?=
 =?us-ascii?Q?+C5fQhkSWo4e9RgDEYP9V4EAoemKZZPNHo6G/w0JjyiJtrh8OTBkV4VZ3Kg8?=
 =?us-ascii?Q?m9RRaI2XX8XyFAXgKkam3D3f+CNvgFBy810ZZqj676FW8CfL15DYXJve72DZ?=
 =?us-ascii?Q?WmnFjHWAf6SCxzIymvR+JgQTHnxVJWhMIuvXt/+8gg1V0TvbxRQQ1VSbOwEb?=
 =?us-ascii?Q?q6FmMNH7jPzaA2bo8to23a7Vnb/BFvHhNPqMXm9QTcjx5jCX3hZknHwftru2?=
 =?us-ascii?Q?TEuvLI0dRXFpT9wjyQH/zCe2/CIfz3/UXHDAt0csSzrY/+ldQiFrUjL3sKPy?=
 =?us-ascii?Q?ioghwAWWP2ArLkv9PZ0/P/ogxi/qkjMSed5Vmgbuw5fIeC5iOFMRlBTJCfYi?=
 =?us-ascii?Q?4/91Uwd2hAJ+FkXE+/PaSrvRtHlsSkIOrwf/8ssVzAQxlosTtdKAYyWxW0re?=
 =?us-ascii?Q?Wb7teVsxW8RYqwIaFrLEf7bNUW6/n7rF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2HSjXqxzBjkXBxUcPGXyqMgMgWplkf2fNt754uyX0pfvGgbhcueTQfHU8Dt0?=
 =?us-ascii?Q?vS6IZpsPvcHLaMjxi6Rg1fyi2xufGfl3g1w8xADcFATqjYlr9mxzfrdKyhDX?=
 =?us-ascii?Q?swStb6DuEKKYlgMr2SGxbBgYTRCBe/JCHfULFpj9jYaGsaDIZJHZbPw3FwJT?=
 =?us-ascii?Q?92NTMUgiLgHN3hIUT0AK/GPW+JWipnPF1y2Kw8qaLTEP/EHiUZRNEkGaGopE?=
 =?us-ascii?Q?AymBQvJHlo8YtiLOCb/bDCELtoZWNJh51w6gZChEpfz9cuMVUNfgEUmCfIju?=
 =?us-ascii?Q?MhKfVb0JXKIidOTzWz1bliaf+aQiUlvr3AtzCUQmkJQVD0GsClnp+vltHKNG?=
 =?us-ascii?Q?YnetehxZqeZKBRrgXCWxXF681Tl0YWUqglodviYb1Aaeai8ALY9ujZuXOQUS?=
 =?us-ascii?Q?rU8lDnZaQKqWQnl64TA9QtwdVqbYA3DR8xtrEvXoOGK0KBgph4/tH2D0dMo9?=
 =?us-ascii?Q?JdKK85QOv45EEhi6jLY6aQdXhs6AM6pLq72obLjMnJa0UaI/SFPGbVB4RV2+?=
 =?us-ascii?Q?UZii4qzIkZ64J3fMapl40MFOBGo9DxlLBkHGSU9heA9xfCrCJ4xspkmXcjjU?=
 =?us-ascii?Q?EQlO0Oni9kwGoORhkU25Vsx3Nfdz9UiIU/IihSPslpQFTJTl6SNsBmR9g35A?=
 =?us-ascii?Q?2o/4HCEvL30u79DUVYvc5cxsHs5QT/mO9scgkIqCO5ZMW5Kuo5DNjLc9l0UP?=
 =?us-ascii?Q?ClWCRhQXz+zodxHnVVmkqwMJqXjDozIrG2dkXR/r2VYbO908cY5n3dgraoSG?=
 =?us-ascii?Q?uaxf5E6NYWK9cPrMNN3Je/STghOGll8bMRu4WcjAJtyNjwROdwK0pYdONzmG?=
 =?us-ascii?Q?BvS64TWTDFwlCh1+MHuAvv+I3SxT4DFQSy+TpHgrbM58vB+mNdfZDTteQZiU?=
 =?us-ascii?Q?4XZXI465qL7INQF3sZ6jZKQ0Pa/gBfFiPx8RP5xVGFesX4bbLcrlBDAvUYQf?=
 =?us-ascii?Q?VShNygG8h9Z+HYTQ53gZxXh+3XG1QgZnk6Q7Z4Hjfez8rDtiBIJ9u09D5exX?=
 =?us-ascii?Q?R6S9O5jqIJN6ISsGTroczXx38FqZzIxQ8TgCa5C1hqlSUFqmNyx23dREQiSO?=
 =?us-ascii?Q?GoxIzeJAyc2zM72zzi1F8XFi9f1HhuwapPNfXDV5bWq9KOdjHGmY2Vw7i8JU?=
 =?us-ascii?Q?js1jIUrgXCFw25sVEkul/e+DZQKN3IMfVkFbzpt2ET6WVaTcNsdXkCfhUvvp?=
 =?us-ascii?Q?QY3opFFPsdHtfiNfPaTfieTtCtNkcYsL/F5ZqKWahdEKLsolkObzDJ9YKNzI?=
 =?us-ascii?Q?C8bEOXAahMdDbeO+JcgefZe6N+xkkTqUqN6Sm2LX7ODksoH3RQAWnK+k7oWI?=
 =?us-ascii?Q?Ge2p3nitWxKGHiMPFFXqNgBu7BaO/dXukPqY/Z+d5z0Wy6MVbN/Ds1aJaP7f?=
 =?us-ascii?Q?q+Qtt4Mz9De0IUC4g0hFdo/pfqNw6xAtnwc+8u+1RPjYqREMljRanb56Yc9b?=
 =?us-ascii?Q?caAGuhmFsFkqWOyarlqGZa/aNCK2oUMMQpYP8L5PsrEDKuLsyP0PuhI7Y/NW?=
 =?us-ascii?Q?GaUnsog+eOPNTKOCEs1+kUMTST9Ifa/ORnb9fu3E2QmxEIknLMUGA1/I41bg?=
 =?us-ascii?Q?AgVEQGb0gQoKNYZhBdDj04LnmD6mI+W27G4ns0nnb39ld9hEAcgedCigFRlJ?=
 =?us-ascii?Q?zoj5DxXMkYolYcvugn8yQA0=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f1caa50-72a5-4652-134d-08dd5a6df1cb
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 16:10:41.2103
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RJ71aruaz9tRpyANQwrda/GSE7QM0QW9N8z2VYS15lN4kN3CIUd+yxRZVG+er9Z6u/EdnnYKEhYpY3oKSYJi+FEDdgTHKnPLNTpUThPpfchraah2wJHNGjsrgmaIItiC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8683

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Prepare for adding support for RZ/G3E and RZ/V2HP SoCs, which have a
CRU-IP that is mostly identical to RZ/G2L but with different register
offsets and additional registers. Introduce a flexible register mapping
mechanism to handle these variations.

Define the `rzg2l_cru_info` structure to store register mappings and
pass it as part of the OF match data. Update the read/write functions
to check out-of-bound accesses and use indexed register offsets from
`rzg2l_cru_info`, ensuring compatibility across different SoC variants.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v2:
 - Implemented new rzg2l_cru_write/read() that now are checking out-of-bound
   accesses as suggested by LPinchart.
 - Fixed AMnMBxADDRL() and AMnMBxADDRH() as suggested by LPinchart.
 - Update commit body

 .../platform/renesas/rzg2l-cru/rzg2l-core.c   | 46 ++++++++++++-
 .../renesas/rzg2l-cru/rzg2l-cru-regs.h        | 66 ++++++++++---------
 .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  4 ++
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 58 ++++++++++++++--
 4 files changed, 139 insertions(+), 35 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index eed9d2bd0841..abc2a979833a 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -22,6 +22,7 @@
 #include <media/v4l2-mc.h>
 
 #include "rzg2l-cru.h"
+#include "rzg2l-cru-regs.h"
 
 static inline struct rzg2l_cru_dev *notifier_to_cru(struct v4l2_async_notifier *n)
 {
@@ -269,6 +270,9 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
 
 	cru->dev = dev;
 	cru->info = of_device_get_match_data(dev);
+	if (!cru->info)
+		return dev_err_probe(dev, -EINVAL,
+				     "Failed to get OF match data\n");
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
@@ -317,8 +321,48 @@ static void rzg2l_cru_remove(struct platform_device *pdev)
 	rzg2l_cru_dma_unregister(cru);
 }
 
+static const u16 rzg2l_cru_regs[] = {
+	[CRUnCTRL] = 0x0,
+	[CRUnIE] = 0x4,
+	[CRUnINTS] = 0x8,
+	[CRUnRST] = 0xc,
+	[AMnMB1ADDRL] = 0x100,
+	[AMnMB1ADDRH] = 0x104,
+	[AMnMB2ADDRL] = 0x108,
+	[AMnMB2ADDRH] = 0x10c,
+	[AMnMB3ADDRL] = 0x110,
+	[AMnMB3ADDRH] = 0x114,
+	[AMnMB4ADDRL] = 0x118,
+	[AMnMB4ADDRH] = 0x11c,
+	[AMnMB5ADDRL] = 0x120,
+	[AMnMB5ADDRH] = 0x124,
+	[AMnMB6ADDRL] = 0x128,
+	[AMnMB6ADDRH] = 0x12c,
+	[AMnMB7ADDRL] = 0x130,
+	[AMnMB7ADDRH] = 0x134,
+	[AMnMB8ADDRL] = 0x138,
+	[AMnMB8ADDRH] = 0x13c,
+	[AMnMBVALID] = 0x148,
+	[AMnMBS] = 0x14c,
+	[AMnAXIATTR] = 0x158,
+	[AMnFIFOPNTR] = 0x168,
+	[AMnAXISTP] = 0x174,
+	[AMnAXISTPACK] = 0x178,
+	[ICnEN] = 0x200,
+	[ICnMC] = 0x208,
+	[ICnMS] = 0x254,
+	[ICnDMR] = 0x26c,
+};
+
+static const struct rzg2l_cru_info rzgl2_cru_info = {
+	.regs = rzg2l_cru_regs,
+};
+
 static const struct of_device_id rzg2l_cru_of_id_table[] = {
-	{ .compatible = "renesas,rzg2l-cru", },
+	{
+		.compatible = "renesas,rzg2l-cru",
+		.data = &rzgl2_cru_info,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, rzg2l_cru_of_id_table);
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
index 1c9f22118a5d..86c320286246 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
@@ -10,71 +10,77 @@
 
 /* HW CRU Registers Definition */
 
-/* CRU Control Register */
-#define CRUnCTRL			0x0
 #define CRUnCTRL_VINSEL(x)		((x) << 0)
 
-/* CRU Interrupt Enable Register */
-#define CRUnIE				0x4
 #define CRUnIE_EFE			BIT(17)
 
-/* CRU Interrupt Status Register */
-#define CRUnINTS			0x8
 #define CRUnINTS_SFS			BIT(16)
 
-/* CRU Reset Register */
-#define CRUnRST				0xc
 #define CRUnRST_VRESETN			BIT(0)
 
 /* Memory Bank Base Address (Lower) Register for CRU Image Data */
-#define AMnMBxADDRL(x)			(0x100 + ((x) * 8))
+#define AMnMBxADDRL(x)			(AMnMB1ADDRL + (x) * 2)
 
 /* Memory Bank Base Address (Higher) Register for CRU Image Data */
-#define AMnMBxADDRH(x)			(0x104 + ((x) * 8))
+#define AMnMBxADDRH(x)			(AMnMB1ADDRH + (x) * 2)
 
-/* Memory Bank Enable Register for CRU Image Data */
-#define AMnMBVALID			0x148
 #define AMnMBVALID_MBVALID(x)		GENMASK(x, 0)
 
-/* Memory Bank Status Register for CRU Image Data */
-#define AMnMBS				0x14c
 #define AMnMBS_MBSTS			0x7
 
-/* AXI Master Transfer Setting Register for CRU Image Data */
-#define AMnAXIATTR			0x158
 #define AMnAXIATTR_AXILEN_MASK		GENMASK(3, 0)
 #define AMnAXIATTR_AXILEN		(0xf)
 
-/* AXI Master FIFO Pointer Register for CRU Image Data */
-#define AMnFIFOPNTR			0x168
 #define AMnFIFOPNTR_FIFOWPNTR		GENMASK(7, 0)
 #define AMnFIFOPNTR_FIFORPNTR_Y		GENMASK(23, 16)
 
-/* AXI Master Transfer Stop Register for CRU Image Data */
-#define AMnAXISTP			0x174
 #define AMnAXISTP_AXI_STOP		BIT(0)
 
-/* AXI Master Transfer Stop Status Register for CRU Image Data */
-#define AMnAXISTPACK			0x178
 #define AMnAXISTPACK_AXI_STOP_ACK	BIT(0)
 
-/* CRU Image Processing Enable Register */
-#define ICnEN				0x200
 #define ICnEN_ICEN			BIT(0)
 
-/* CRU Image Processing Main Control Register */
-#define ICnMC				0x208
 #define ICnMC_CSCTHR			BIT(5)
 #define ICnMC_INF(x)			((x) << 16)
 #define ICnMC_VCSEL(x)			((x) << 22)
 #define ICnMC_INF_MASK			GENMASK(21, 16)
 
-/* CRU Module Status Register */
-#define ICnMS				0x254
 #define ICnMS_IA			BIT(2)
 
-/* CRU Data Output Mode Register */
-#define ICnDMR				0x26c
 #define ICnDMR_YCMODE_UYVY		(1 << 4)
 
+enum rzg2l_cru_common_regs {
+	CRUnCTRL,	/* CRU Control */
+	CRUnIE,		/* CRU Interrupt Enable */
+	CRUnINTS,	/* CRU Interrupt Status */
+	CRUnRST, 	/* CRU Reset */
+	AMnMB1ADDRL,	/* Bank 1 Address (Lower) for CRU Image Data */
+	AMnMB1ADDRH,	/* Bank 1 Address (Higher) for CRU Image Data */
+	AMnMB2ADDRL,    /* Bank 2 Address (Lower) for CRU Image Data */
+	AMnMB2ADDRH,    /* Bank 2 Address (Higher) for CRU Image Data */
+	AMnMB3ADDRL,    /* Bank 3 Address (Lower) for CRU Image Data */
+	AMnMB3ADDRH,    /* Bank 3 Address (Higher) for CRU Image Data */
+	AMnMB4ADDRL,    /* Bank 4 Address (Lower) for CRU Image Data */
+	AMnMB4ADDRH,    /* Bank 4 Address (Higher) for CRU Image Data */
+	AMnMB5ADDRL,    /* Bank 5 Address (Lower) for CRU Image Data */
+	AMnMB5ADDRH,    /* Bank 5 Address (Higher) for CRU Image Data */
+	AMnMB6ADDRL,    /* Bank 6 Address (Lower) for CRU Image Data */
+	AMnMB6ADDRH,    /* Bank 6 Address (Higher) for CRU Image Data */
+	AMnMB7ADDRL,    /* Bank 7 Address (Lower) for CRU Image Data */
+	AMnMB7ADDRH,    /* Bank 7 Address (Higher) for CRU Image Data */
+	AMnMB8ADDRL,    /* Bank 8 Address (Lower) for CRU Image Data */
+	AMnMB8ADDRH,    /* Bank 8 Address (Higher) for CRU Image Data */
+	AMnMBVALID,	/* Memory Bank Enable for CRU Image Data */
+	AMnMBS,		/* Memory Bank Status for CRU Image Data */
+	AMnAXIATTR,	/* AXI Master Transfer Setting Register for CRU Image Data */
+	AMnFIFOPNTR,	/* AXI Master FIFO Pointer for CRU Image Data */
+	AMnAXISTP,	/* AXI Master Transfer Stop for CRU Image Data */
+	AMnAXISTPACK,	/* AXI Master Transfer Stop Status for CRU Image Data */
+	ICnEN,		/* CRU Image Processing Enable */
+	ICnMC,		/* CRU Image Processing Main Control */
+	ICnMS,		/* CRU Module Status */
+	ICnDMR,		/* CRU Data Output Mode */
+	RZG2L_CRU_MAX_REG,
+};
+
 #endif /* __RZG2L_CRU_REGS_H__ */
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index 8b898ce05b84..00c3f7458e20 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
@@ -80,6 +80,10 @@ struct rzg2l_cru_ip_format {
 	bool yuv;
 };
 
+struct rzg2l_cru_info {
+	const u16 *regs;
+};
+
 /**
  * struct rzg2l_cru_dev - Renesas CRU device structure
  * @dev:		(OF) device
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index cd69c8a686d3..792f0df51a4b 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -42,16 +42,66 @@ struct rzg2l_cru_buffer {
 /* -----------------------------------------------------------------------------
  * DMA operations
  */
-static void rzg2l_cru_write(struct rzg2l_cru_dev *cru, u32 offset, u32 value)
+static void __rzg2l_cru_write(struct rzg2l_cru_dev *cru, u32 offset, u32 value)
 {
-	iowrite32(value, cru->base + offset);
+	const u16 *regs = cru->info->regs;
+
+	/*
+	 * CRUnCTRL is a first register on all CRU supported SoCs so validate
+	 * rest of the registers have valid offset being set in cru->info->regs.
+	 */
+	if (WARN_ON(offset >= RZG2L_CRU_MAX_REG) ||
+	    WARN_ON(offset != CRUnCTRL && regs[offset] == 0))
+		return;
+
+	iowrite32(value, cru->base + regs[offset]);
+}
+
+static u32 __rzg2l_cru_read(struct rzg2l_cru_dev *cru, u32 offset)
+{
+	const u16 *regs = cru->info->regs;
+
+	/*
+	 * CRUnCTRL is a first register on all CRU supported SoCs so validate
+	 * rest of the registers have valid offset being set in cru->info->regs.
+	 */
+	if (WARN_ON(offset >= RZG2L_CRU_MAX_REG) ||
+	    WARN_ON(offset != CRUnCTRL && regs[offset] == 0))
+		return 0;
+
+	return ioread32(cru->base + regs[offset]);
 }
 
-static u32 rzg2l_cru_read(struct rzg2l_cru_dev *cru, u32 offset)
+static inline void
+__rzg2l_cru_write_constant(struct rzg2l_cru_dev *cru, u32 offset, u32 value)
 {
-	return ioread32(cru->base + offset);
+	const u16 *regs = cru->info->regs;
+
+	BUILD_BUG_ON(offset >= RZG2L_CRU_MAX_REG);
+
+	iowrite32(value, cru->base + regs[offset]);
 }
 
+static inline u32
+__rzg2l_cru_read_constant(struct rzg2l_cru_dev *cru, u32 offset)
+{
+	const u16 *regs = cru->info->regs;
+
+	BUILD_BUG_ON(offset >= RZG2L_CRU_MAX_REG);
+
+	return ioread32(cru->base + regs[offset]);
+}
+
+#define rzg2l_cru_write(cru, offset, value) \
+	(__builtin_constant_p(offset) ? \
+	 __rzg2l_cru_write_constant(cru, offset, value) : \
+	 __rzg2l_cru_write(cru, offset, value))
+
+#define rzg2l_cru_read(cru, offset) \
+	(__builtin_constant_p(offset) ? \
+	 __rzg2l_cru_read_constant(cru, offset) : \
+	 __rzg2l_cru_read(cru, offset))
+
 /* Need to hold qlock before calling */
 static void return_unused_buffers(struct rzg2l_cru_dev *cru,
 				  enum vb2_buffer_state state)
-- 
2.43.0


