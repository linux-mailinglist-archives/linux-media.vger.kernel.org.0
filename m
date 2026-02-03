Return-Path: <linux-media+bounces-52085-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0HEiKEexgWloIwMAu9opvQ
	(envelope-from <linux-media+bounces-52085-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Feb 2026 09:26:47 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3B3D6364
	for <lists+linux-media@lfdr.de>; Tue, 03 Feb 2026 09:26:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3F12E306EE3F
	for <lists+linux-media@lfdr.de>; Tue,  3 Feb 2026 08:25:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA9FD395DBE;
	Tue,  3 Feb 2026 08:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ISKg/43n"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013041.outbound.protection.outlook.com [52.101.72.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6114A395D8A;
	Tue,  3 Feb 2026 08:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770107119; cv=fail; b=nl1KKVXDe1srD6Kh/HhLqlToGLrxkTPG/2DI/IEoLbpWlYGNwEr7GEU+EMde86/yiO4P9vDZnm7deFN9y63PUSSnSGzTdfvfz1pcSvUCrRrypCZyLpa0GvNzR7xtkXDwZtmUGvHMgWf4ShVFzPbfMEbo9mv125ebAgdQlNTiu6U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770107119; c=relaxed/simple;
	bh=b8BHX6wjr0TK13Dx9K7/l0BNoSbPgv4O9FIpjd9nXJU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=A1gPuV+uGBfoetdWx8nDOO3tGxmY5YPAo9EsX+c1E9ydOVdRsqhCH0q+8C9Qd8zFYkAfOYhUjTz7QpU9juLnbHSVT9Ie35lhCTwZXhh150IWMDbnA+kGee0BBQ9iWGrDCu/M+2J27mM2RsEdFULS+B62bVNf753nkWdvnXPDBhY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ISKg/43n; arc=fail smtp.client-ip=52.101.72.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hgvqLlEYbwpVryXgSFsUP6MeYTGgpS7eR9aGcYEjqqiOw0LJrg3nDh8lInFY/UfY3fx2yCyX5MJTAjTlPOpH5SzlbcyAjR4Z9HBjRa7zFc/2BtCHNrWscuCP9CqjsgagEV/e1OveK/y/MnfNsxUrfcpx4Qu74FRMBmaV/M8Q6p6aTlXJyk8XlfXV9N17EcsLpI95t+PQJjdqgh4vvNpfIe7UWeT6SkI03K/8Y5mIdCi1o+GAQCxo4/M1PYzAytQX7tiBJPP7EQn5I1fWbCbTnoT+jKtmHzyFEZZBgdqr99hrAe7a1n37Nhl4XoIpGKr/ZwpleNdOnq/21nHbgNGh3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T/wdbiaoeK04gk0F/GIsuk5jtWZuMabb5IPMuPLeNRY=;
 b=EsKGzojM264AcL2QzmKsmA9KqtqCH02u+yb0hPaX0ZZOuFdddJkpGbRTBaRxRM6axmau7FKMbvgML71PHUj1ma/MsQQVlh9wo3WhwIjnsTefD8SgJR3oCtme620E+HWwHGCVsJNQf+TOHtowZRFWCqGQDRdmvmISMsqhIfobDvRkA3sp1VyMNK/Lz7lr7tZDk9Jh5ZomlzSmwdttKUe3hYLWxOQULJPJeJo+37r9zEPkXZTD7K9mjbUsvKaG2fgz+laD09mAsDK+MFxEieJqKfuUwg4MGS6TAXjKFriZ7Ao4J5YlleAHFEk1xOKXR6DYezLpo1/0srTvB/V0OJim2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T/wdbiaoeK04gk0F/GIsuk5jtWZuMabb5IPMuPLeNRY=;
 b=ISKg/43njNcml9TrzhIKNTRyVJFN5RLBG2VPqZNzIADv5ygbT2DS1qY+lKc5l+nAw4fyJZkqTb1ifebN49pnlAkSsve3nzsiFfGctgx5ScXmmBml2corilpMe/utW1jYQd3kejM2u7JkTklW3gkgb25waebK2FFGupGKgi4IrJJLsHm/1a7xFzC+3Ynmux8WCWfnESheHGb5sh6kua/c41gnvGQguGrg0sXdbIkgJKnXzTSguPm3YoezZnqklvsk7s7Ol9mnfETEkEIGRL13/UNVVIIw/7aPqAQF+uODZUaca0x7E6LIbPNMg3gsZyLaf25yepKmh+qTVGFEVGb+YA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by DUZPR04MB9919.eurprd04.prod.outlook.com (2603:10a6:10:4d9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 08:25:09 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 08:25:09 +0000
From: ming.qian@oss.nxp.com
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	mirela.rabulea@oss.nxp.com
Cc: nicolas@ndufresne.ca,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	xiahong.bao@nxp.com,
	eagle.zhou@nxp.com,
	linux-imx@nxp.com,
	Frank.li@nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 3/4] media: imx-jpeg: Add encoder ops layer for hardware abstraction
Date: Tue,  3 Feb 2026 16:23:40 +0800
Message-ID: <20260203082349.1082-4-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
In-Reply-To: <20260203082349.1082-1-ming.qian@oss.nxp.com>
References: <20260203082349.1082-1-ming.qian@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0112.apcprd02.prod.outlook.com
 (2603:1096:4:92::28) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|DUZPR04MB9919:EE_
X-MS-Office365-Filtering-Correlation-Id: 5474ba77-a7c9-4789-5767-08de62fdbe62
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?10NDXl+gS8tHhhaf+sxVSFFOjmdooH9pdzJpGgkNd2f4EmQuXzuYk3BNZzJe?=
 =?us-ascii?Q?/H7g7H4yOCDH933L1gebSyY0Cro+1s5qKlu/DrVuGbPHZOq+HCv+zb4B1wAc?=
 =?us-ascii?Q?89lAQ1DaTQF8hyiBjGgRcyfd0ndEOVS1q3eE5i3OGmuL+2XA9RRoSK/b4x4U?=
 =?us-ascii?Q?LB2csufz1knWjGmQOaKG/+LDXgU2np/zjnfM7CAenAvNtKjJxvcJbZLkubNn?=
 =?us-ascii?Q?RPgil3avlzyz00H618gYd83ekaUSY3U+tVtelWBy4aXlTaH/LMh9xxONMIXo?=
 =?us-ascii?Q?TTd7n7hRBpMeDf3VpWK7PMV75ptWeTEUMTU8Da26k22V71RmAai58RHi0JpV?=
 =?us-ascii?Q?Flr9s2O1ScK5rfJY5vPhfzXdrJ5sh+XWBwAMaJJSFhpqIKTBeugmlFDFhSKp?=
 =?us-ascii?Q?y3DivTWBHTIJyNHdESZkwi8zmG5QEmsL3NRbI5wBv/H665zgIkmJ4HqEQ9RT?=
 =?us-ascii?Q?MuP6o9jDIwWXqWQsAxIDaVj9b1UvAt5jkIYRmBvn84QaefJrz8GX2JC1M7oB?=
 =?us-ascii?Q?deQTvYNCsxb80FIZNcOl0gQJn/V/0h1Mutul0MUlgP0TtXj17a76epMtDo31?=
 =?us-ascii?Q?+pxRVKrJ7CNq0I3RS3xVUPgV2BlkA9Vcox6qCMYTjdsJ4BzmFZZfHoJTBbHj?=
 =?us-ascii?Q?Wc03Vmblii1hayppH+CLOUX7O7pIVcVw824/gmqxR8WK0DXdDq1/3BxTgTp6?=
 =?us-ascii?Q?8brInRKrw3nggYBtRV7v/Hq7hLOWOfd/vjMv/PBDsoi/FaZ+Yu8k/EjyJkMy?=
 =?us-ascii?Q?WMfxF/K0HYWy3e63AHk7YR6aGS0leudUNx9Snsc+xXBnO6bMQUEqX9yMv2Rz?=
 =?us-ascii?Q?jc1WyHkVwL5JoK0ZReXkieTtoqvCQ1T8eEts5RYzuSuSZwi7QZ3MFPT89bki?=
 =?us-ascii?Q?HUmvVC91vnat8Zyfa1Fkr0OrU83uWMlq9aWA068hVaEN6HnCyYp2gSM4NiHO?=
 =?us-ascii?Q?FqpN5fHVkodXSrANfmO0Dy1XtLNfHrSG7cOZCf9eurCcP9x5jNC50/ovc8um?=
 =?us-ascii?Q?XZVH+I1Lko5DP7QYFZPqV8S/EV13W5g1vanzq2LmKO+N3ScH1B6zmzoycqBx?=
 =?us-ascii?Q?PG77F+vT310iZ5GIKR5Gm9w6HV6nHy5+GKb14mI4FPSCoGsZ5l9MCFt06GXv?=
 =?us-ascii?Q?zNJpYiObVhOMOJyq+J1S6ZXoY2qaLmvg8S9Y1Fbp8JAounQz2G9lEbcBXVEO?=
 =?us-ascii?Q?kKR3pPO3T12xFzv+huFZOMPPahhJys5ZJ149eT3xkjNip4VljKI2ureRsxOw?=
 =?us-ascii?Q?V1FiKf6TnBVpn5Q61zz1B+r9dJlmZ0uJzFnKrmc9WaPzhup7Cck/C4yh4B30?=
 =?us-ascii?Q?9ppCxR2SFUKAXSDqsUf2gWm4Zyy8/7VURJltMg2d67/Cw9VkhZu8saaqgI3c?=
 =?us-ascii?Q?pq47ySEuDscA3wuEmiHRDcnILkj6CFwfRo1TOIAu/yxpe2JbPPfugAi+sDA/?=
 =?us-ascii?Q?XR2JcXO3HkXKjtvbAaPJmfFC6IurIkLX1z0QDO0Yl8aP5T6Vkee/YT7Mlgmg?=
 =?us-ascii?Q?zCJ4y3gteOPOs0sKkIruBhM8UKOrsCJ0gXBdMDM+cApoZiFFRbhkoYs/RMA4?=
 =?us-ascii?Q?3hiRXL0FRDkRpmgjiPKq8nAs4YScGAiuzcVlg9jnFniRj7o094TijZwh32RK?=
 =?us-ascii?Q?tXH5PbY50apwcfJeE6gJzX8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?afs7+7PD75zHUWMy+v1nL0UdxX76mFRlKmdIc+lJhUqoyDbaWhXJSw+nQCfJ?=
 =?us-ascii?Q?hbesJ6asEScBsUAgxTqGnuw+Xfq5aA3dlmjOXpm5zvvKO7AYoD/nvg8ps6lQ?=
 =?us-ascii?Q?aC7mzLsr07i4sIJQo1Ew8qoHtcs488qE8huLG/yeQCZthjbdLE7jw1amh8im?=
 =?us-ascii?Q?ksA+HXUXqUb/zfOYgULP0DDUKjPdCkX2rlfAZOidGn6EpZsoRvNDC9SpGFD0?=
 =?us-ascii?Q?w3QvJR28hiaUuQTiEt+/T1S0gtfgeqf9dJnyKfBW8Kyicf9IS9ApTtuOzlUo?=
 =?us-ascii?Q?s5y0Fqidrqw8boPWTGQ+k/D9vV4JCkDiJa4gC6vs751oic9wVPNAUcL8okt5?=
 =?us-ascii?Q?c0LZlGLK1gBqsVQvN0IuTQgddEIbgGzqtnGFCC1Tph+Pv/bwNEe7+v6S9MUp?=
 =?us-ascii?Q?UPm02viFnM5VKcaHkK7XPS64eII9B2lB7Y6gdbbTAwrGM21Bpt0CDNKhVk+0?=
 =?us-ascii?Q?NWAl7gwPa2yebM+Wh+QufalTj8knDNAZXO61FpqliG054DpFAvXPrYyymvc2?=
 =?us-ascii?Q?XjUs2G4KybnF+4hkmM4bNYhoo3g8WMvWEg0Fki8Xop85zbNKP5WX+GEzP420?=
 =?us-ascii?Q?F95YKEgMd1uYKKUe6TXPUYK4jJ3g5FEZbpCrpqUOsZULTqB+4mkOI5G8ykVS?=
 =?us-ascii?Q?jMFpJ4/0tYx+X085vNJe3kGOs++CoPVQcsszm62jkaXimG4F3DpYw0/EMh2M?=
 =?us-ascii?Q?CHF+HTPIOUJPAicibyPKXqB1Lr8O02cVJxtWko6mvzgI9MMrObVb25x81AE9?=
 =?us-ascii?Q?AFGjjbzYLk/sjq9JmeUonQ77OyyZdtLjUVIwGSmV8VzJZzhzUKAh8zj1fN6M?=
 =?us-ascii?Q?N9e50ySqrnNaO4Qcr5BuD3RPyPE1L2JepZJ9W2cSbm4ODNMkkSCjfxbxijyX?=
 =?us-ascii?Q?o4osfjDhTGiKepuYa426bU0leKLaq3hx7CT5bgOObVfAd+oMTeUaQ0LElubM?=
 =?us-ascii?Q?w4rISOcDNPfPgemOdNHCprtiSIiVnbOz0olE8JYye8P6ZM2oMygVZe1t789M?=
 =?us-ascii?Q?w8dHSUG/cDABCzDdFd4umNsRCuC8fOPip/3kzVWYwPL+FvKF89cxa9yv81gU?=
 =?us-ascii?Q?aDY19V6M4bkj4A3Ze6PyIKiA20Tf2jKj5jFZuPJ50OoQlH6da9oKedMSg6Nr?=
 =?us-ascii?Q?5mBcjqRDpudWKcJwsuwAtCgm3bMhcY5rutRV1aaooPA3/QM5eToDzLwGmrMg?=
 =?us-ascii?Q?/kAhu3xq/uchnKAVyIWC2frrDHqh98bKxFbe29Of1Bl4Vke0JpAOiD/aUUcR?=
 =?us-ascii?Q?gfBJnY9uIwD+2uGhkfAg/hU6bJKinQoMydQ578hz97bynUet3ioQXe+RrLmo?=
 =?us-ascii?Q?hlpK1aSN5CZXDHlTq36Zj9M2/j93JxlfTdZaCdMQz1M5tvjgCsrDJP8QvDnZ?=
 =?us-ascii?Q?tKlrpKc09KGu3Q1wYghz76VIl95YYDndVYgEYFxXmGX2xwGc0RmqLUw6/vO9?=
 =?us-ascii?Q?TVoWdRxNDtFWs6rhx18/5RlnoGPmrZs9g/LnjLXQjb1QQiqpcuZGE2T3pkOC?=
 =?us-ascii?Q?Sic4etRNKh9yYQY1WcXC1YIsHJTRPRWadDFeYpOZ55cyPkQ+avWnF1tL6NzX?=
 =?us-ascii?Q?OSDy00ZjjxSeNuGmNQPHiiXlxAdDAFMguX5G3b6Am2HfF7wmGUTSa1CzWH0o?=
 =?us-ascii?Q?1gNiAOnKYiL3F3U0D+Fbat98KFz86r2tB5r8q7rxSOjq4LBLkVsRwre/0VK2?=
 =?us-ascii?Q?CAutsm3xeCW+sB1Evd2/CG0zK+lE2R7ZPvtRl8uxIEqk24xgqsO1DA9jlmvb?=
 =?us-ascii?Q?tCNNsN13fA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5474ba77-a7c9-4789-5767-08de62fdbe62
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 08:25:09.6610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /CiL7JhZVwp+ZtGx4gD+/fzIgXLaxqe4OJyAZ4Mh4++oTnrKX0qZ1N6jN2XqTKNkkEqG1vVoLyXhKzIXcQ20ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9919
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.94 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52085-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[ndufresne.ca,kernel.org,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	FREEMAIL_TO(0.00)[kernel.org,xs4all.nl,oss.nxp.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ming.qian@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,NXP1.onmicrosoft.com:dkim,oss.nxp.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1A3B3D6364
X-Rspamd-Action: no action

From: Ming Qian <ming.qian@oss.nxp.com>

Introduce mxc_jpeg_enc_ops function pointer structure to abstract
encoder configuration differences between hardware versions.

Extract the existing two-phase manual configuration into dedicated
functions (enter_config_mode/exit_config_mode) for v0 hardware.
Add setup_desc callback placeholder for future v1 hardware support
which will use descriptor-based configuration.

Store the extended sequential mode flag in the context to avoid
recalculating it during configuration phases.

No functional change.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
---
 .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 56 ++++++++++++++++---
 .../media/platform/nxp/imx-jpeg/mxc-jpeg.h    | 11 ++++
 2 files changed, 58 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index 877e6c4f7406..c2e2c028b410 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -64,6 +64,12 @@
 #include "mxc-jpeg-hw.h"
 #include "mxc-jpeg.h"
 
+#define call_void_jpeg_enc_ops(jpeg, op, args...)			\
+	do {								\
+		if ((jpeg)->enc_cfg_ops && (jpeg)->enc_cfg_ops->op)	\
+			(jpeg)->enc_cfg_ops->op(args);			\
+	} while (0)
+
 static const struct mxc_jpeg_fmt mxc_formats[] = {
 	{
 		.name		= "JPEG",
@@ -1030,11 +1036,7 @@ static irqreturn_t mxc_jpeg_dec_irq(int irq, void *priv)
 
 	if (jpeg->mode == MXC_JPEG_ENCODE &&
 	    ctx->enc_state == MXC_JPEG_ENC_CONF) {
-		q_data = mxc_jpeg_get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
-		ctx->enc_state = MXC_JPEG_ENCODING;
-		dev_dbg(dev, "Encoder config finished. Start encoding...\n");
-		mxc_jpeg_enc_set_quality(dev, reg, ctx->jpeg_quality);
-		mxc_jpeg_enc_mode_go(dev, reg, mxc_jpeg_is_extended_sequential(q_data->fmt));
+		call_void_jpeg_enc_ops(jpeg, exit_config_mode, ctx);
 		goto job_unlock;
 	}
 	if (jpeg->mode == MXC_JPEG_DECODE && jpeg_src_buf->dht_needed &&
@@ -1272,6 +1274,7 @@ static void mxc_jpeg_config_dec_desc(struct vb2_buffer *out_buf,
 
 	jpeg_src_buf = vb2_to_mxc_buf(src_buf);
 
+	ctx->extseq = mxc_jpeg_is_extended_sequential(jpeg_src_buf->fmt);
 	/* setup the decoding descriptor */
 	desc->next_descpt_ptr = 0; /* end of chain */
 	q_data_cap = mxc_jpeg_get_q_data(ctx, cap_type);
@@ -1335,8 +1338,12 @@ static void mxc_jpeg_config_enc_desc(struct vb2_buffer *out_buf,
 	struct mxc_jpeg_q_data *q_data;
 	enum mxc_jpeg_image_format img_fmt;
 	int w, h;
+	bool extseq;
 
 	q_data = mxc_jpeg_get_q_data(ctx, src_buf->vb2_queue->type);
+	extseq = mxc_jpeg_is_extended_sequential(q_data->fmt);
+
+	ctx->extseq = extseq;
 
 	memset(desc, 0, sizeof(struct mxc_jpeg_desc));
 	memset(cfg_desc, 0, sizeof(struct mxc_jpeg_desc));
@@ -1369,11 +1376,14 @@ static void mxc_jpeg_config_enc_desc(struct vb2_buffer *out_buf,
 	desc->stm_ctrl = STM_CTRL_CONFIG_MOD(0) |
 			 STM_CTRL_IMAGE_FORMAT(img_fmt);
 	desc->stm_ctrl |= STM_CTRL_BITBUF_PTR_CLR(1);
-	if (mxc_jpeg_is_extended_sequential(q_data->fmt))
+	if (extseq)
 		desc->stm_ctrl |= STM_CTRL_PIXEL_PRECISION;
 	else
 		desc->stm_ctrl &= ~STM_CTRL_PIXEL_PRECISION;
 	mxc_jpeg_addrs(desc, src_buf, dst_buf, 0);
+
+	call_void_jpeg_enc_ops(jpeg, setup_desc, ctx);
+
 	dev_dbg(jpeg->dev, "cfg_desc:\n");
 	print_descriptor_info(jpeg->dev, cfg_desc);
 	dev_dbg(jpeg->dev, "enc desc:\n");
@@ -1385,6 +1395,33 @@ static void mxc_jpeg_config_enc_desc(struct vb2_buffer *out_buf,
 	mxc_jpeg_set_desc(cfg_desc_handle, reg, slot);
 }
 
+static void mxc_jpeg_enc_start_config_manually(struct mxc_jpeg_ctx *ctx)
+{
+	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
+	void __iomem *reg = jpeg->base_reg;
+	struct device *dev = jpeg->dev;
+
+	ctx->enc_state = MXC_JPEG_ENC_CONF;
+	mxc_jpeg_enc_mode_conf(dev, reg, ctx->extseq);
+}
+
+static void mxc_jpeg_enc_finish_config_manually(struct mxc_jpeg_ctx *ctx)
+{
+	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
+	void __iomem *reg = jpeg->base_reg;
+	struct device *dev = jpeg->dev;
+
+	ctx->enc_state = MXC_JPEG_ENCODING;
+	dev_dbg(dev, "Encoder config finished. Start encoding...\n");
+	mxc_jpeg_enc_set_quality(dev, reg, ctx->jpeg_quality);
+	mxc_jpeg_enc_mode_go(dev, reg, ctx->extseq);
+}
+
+static const struct mxc_jpeg_enc_ops mxc_jpeg_enc_cfg_ops_v0 = {
+	.enter_config_mode = mxc_jpeg_enc_start_config_manually,
+	.exit_config_mode = mxc_jpeg_enc_finish_config_manually
+};
+
 static const struct mxc_jpeg_fmt *mxc_jpeg_get_sibling_format(const struct mxc_jpeg_fmt *fmt)
 {
 	int i;
@@ -1590,12 +1627,10 @@ static void mxc_jpeg_device_run(void *priv)
 
 	if (jpeg->mode == MXC_JPEG_ENCODE) {
 		dev_dbg(dev, "Encoding on slot %d\n", ctx->slot);
-		ctx->enc_state = MXC_JPEG_ENC_CONF;
 		mxc_jpeg_config_enc_desc(&dst_buf->vb2_buf, ctx,
 					 &src_buf->vb2_buf, &dst_buf->vb2_buf);
 		/* start config phase */
-		mxc_jpeg_enc_mode_conf(dev, reg,
-				       mxc_jpeg_is_extended_sequential(q_data_out->fmt));
+		call_void_jpeg_enc_ops(jpeg, enter_config_mode, ctx);
 	} else {
 		dev_dbg(dev, "Decoding on slot %d\n", ctx->slot);
 		print_mxc_buf(jpeg, &src_buf->vb2_buf, 0);
@@ -2977,6 +3012,9 @@ static int mxc_jpeg_probe(struct platform_device *pdev)
 		goto err_pm;
 	}
 
+	if (mode == MXC_JPEG_ENCODE)
+		jpeg->enc_cfg_ops = &mxc_jpeg_enc_cfg_ops_v0;
+
 	return 0;
 
 err_pm:
diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
index 9c5b4f053ded..cdfefb68346a 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
@@ -105,6 +105,7 @@ struct mxc_jpeg_ctx {
 	unsigned int			source_change;
 	bool				need_initial_source_change_evt;
 	bool				header_parsed;
+	bool				extseq;
 	struct v4l2_ctrl_handler	ctrl_handler;
 	u8				jpeg_quality;
 	struct delayed_work		task_timer;
@@ -125,6 +126,15 @@ struct mxc_jpeg_slot_data {
 	dma_addr_t cfg_dec_daddr;
 };
 
+struct mxc_jpeg_enc_ops {
+	/* Manual configuration (v0 hardware) - two-phase process */
+	void (*enter_config_mode)(struct mxc_jpeg_ctx *ctx);
+	void (*exit_config_mode)(struct mxc_jpeg_ctx *ctx);
+
+	/* Descriptor-based configuration (v1 hardware) - single-phase */
+	void (*setup_desc)(struct mxc_jpeg_ctx *ctx);
+};
+
 struct mxc_jpeg_dev {
 	spinlock_t			hw_lock; /* hardware access lock */
 	unsigned int			mode;
@@ -142,6 +152,7 @@ struct mxc_jpeg_dev {
 	struct device			**pd_dev;
 	struct device_link		**pd_link;
 	struct gen_pool			*sram_pool;
+	const struct mxc_jpeg_enc_ops	*enc_cfg_ops;
 };
 
 /**
-- 
2.52.0


