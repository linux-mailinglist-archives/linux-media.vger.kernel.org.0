Return-Path: <linux-media+bounces-64688-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id F/KsI48ILGoUKAQAu9opvQ
	(envelope-from <linux-media+bounces-64688-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 15:24:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F59679C2E
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 15:24:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=nxp.com header.s=selector1 header.b=JdJlbrJ2;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64688-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64688-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=nxp.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9152B31B2C89
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 13:20:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDE143ED5BE;
	Fri, 12 Jun 2026 13:20:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011050.outbound.protection.outlook.com [52.101.70.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADF33D16E4;
	Fri, 12 Jun 2026 13:20:50 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781270452; cv=fail; b=ch1o5A5TDQJ4jxZmfJmscEdAZGQgKsLDsVT3fvMRq2JIBx58OpM6hv7jBFWSoiYVYzK3sz0WufxIPwWdAl9dFYY8lOx2o+HGvK5OjAX+eHx/x2feVmEgTS1o1zVsixBAqer1UqR+pAmXfbFY3zoUUraFgDokbMibTPkmbsq7Gww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781270452; c=relaxed/simple;
	bh=DQI+ICixHuYdEWziOZtfStHiu7cblNAwd7Ln9r3xTn0=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=gzrcReeeIvCNG1NTY8JCJ4es+y+uN9GzEpMGJUurl14u0Z/USrvVAnz7vPnWpPIq2bO5QKElxgOJdAW4pVs0yXBlsx8U8kGv48ELY0uo7PhggB+9xsoN0cobARmzp2Dx4AMj70NpYiOe4GhdxhkqIarab1zpR4z08IOZQFHmn4M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=JdJlbrJ2; arc=fail smtp.client-ip=52.101.70.50
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S1GH04GV0KH0/UZ4RNkAogvzA3N/WX3dxq9bMzwmhJYbqjn0nBbnKzzlUkm4IZxoJ4Hx3hHoUT+6Wxr/bkL0W8VUu+4MW8RZMA8CyMqusxfvmDyRRDz4n45Ykb+6gaNNoPnB6P9CAZ6kIhS/1SUAG2I7CH5hiPRXu2IFF014tcjlUFEbqNqaYJ6J2z/WiwF+0J2mL2sG8+xWCaaGWTB2V5I8yIEN0ocXwiP6Xez3+tLuam7RXPXlkki/9Eop+RzqnaqxE/0h6LaEhgPLA4yBbYzb8kK9/IwpM9Z6NL6Cr4GGmfvYxZIaSWR0fyHyfak0fVPf6ACr4RZT2IzyUYGvAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hFEQKr9uotyhwWU41frVg4Vsluh7sWuuZXzLuCollEQ=;
 b=cKNS6368CrR0ZeNZWQfrjxs1eJJ1VvHfegmYhHNZjGrgFRsKzpVflCGYbCRVJVhjYyn/5IaBq35wlDyVWD2P25MkXXGDFn+/YsX2g2rrFk5KZWnhx9LG5esF29U1WzyNNVnxvb0G/ViGRYZAhrHs/PgQluYe9nDuD+wTy7W1CcrQ2tVp+D9+q2GVhfgD/wV5/8TbuPs0xW8kSPjLu22LkSN+YnaGjyVF4NBatkceUGYVUmKCSyZQnYyICcUreplzIPljjeF+xO+mcTOUxi6/h0DbyemwG5hIvTkBwLWRNIPPj+i+uc7I5gJrgjJOsiKmzZivTf04YOzGJLse8QnuAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hFEQKr9uotyhwWU41frVg4Vsluh7sWuuZXzLuCollEQ=;
 b=JdJlbrJ2pt7hiifyZ0VtRghaBRVdjvc+ZpoADor0sll8ZQgx7Vm5+/ufXUYwOi7sYEs08e7EM1HGHFjwrG0Irnds8ie1K3y4lnDTB36N/MsYuYVKQKQ8x1uDYKcAuloHnp5+tnncA1bIW8JOr30AUpOzlTF3KN0WXmeKQqEF/CWRQASVgwTP6k4p6CWhR77aDXbCvhrgNMDzs7w/U3GtqRh7bNOYrMPV+hr32k9xySpMwSc9/Xw90SS49oJfu+9GmN3lSFojUgmuaHEz1bXZD7Eq/8YJ/Mf6VFHOOlsxHBZFrJeuA+d8pt9Zvbnr+zplyPsji2gUBEp8komGc23f2w==
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16) by DB9PR04MB8203.eurprd04.prod.outlook.com
 (2603:10a6:10:242::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 13:20:46 +0000
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989]) by PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989%4]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 13:20:46 +0000
From: Antoine Bouyer <antoine.bouyer@nxp.com>
To: julien.vuillaumier@nxp.com,
	alexi.birlinger@nxp.com,
	daniel.baluta@nxp.com,
	peng.fan@nxp.com,
	frank.li@nxp.com,
	jacopo.mondi@ideasonboard.com,
	laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	michael.riesch@collabora.com,
	anthony.mcgivern@arm.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	ai.luthra@ideasonboard.com,
	paul.elder@ideasonboard.com,
	geert@linux-m68k.org,
	sakari.ailus@linux.intel.com,
	hverkuil+cisco@kernel.org,
	Antoine Bouyer <antoine.bouyer@nxp.com>
Subject: [PATCH v3 0/8] media: Add iMX95 neoisp driver
Date: Fri, 12 Jun 2026 15:20:31 +0200
Message-ID: <20260612132039.2089051-1-antoine.bouyer@nxp.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0128.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::17) To PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR04MB11910:EE_|DB9PR04MB8203:EE_
X-MS-Office365-Filtering-Correlation-Id: 806c9616-0256-42fe-1f2e-08dec88569da
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|376014|7416014|366016|23010399003|921020|6133799003|18002099003|3023799007|5023799004|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
 TYwfD05BDG+BWw0Uc4686Q6N0BvM3DexHr5FXYIHl64Wa7iclpaqEpuftFEI+dGfZ+zQwUsBphpslqspHrnvPQmGkeXHBePbA7laQtZGHu3TSp3mt7IX1NXxYbj6ua6CZUIgAkXNUQLS01vS0UKTVEvRZEh5YzLo7Vs+4C+L6Dl4Gr7f63TDEco2BLajIxFY+NHWODOfhIuPiJDMB3rzYohCV2vWGcFlC6UhcAy/4iA7WC1aKWNHxCFSxunV4x57KzdH8ki+twRKNNZljyrlhiuxdeIn4XescTxHZRorg9qtpim5ooxNjUWrUoT1H0FfNQK3CJxU1M85lOaBNCOzMCoe2DOpfn7FJPdhIcMi3C9/UJbgc88MpuR2obHZIxLubvqiawCmKYJuvW1NSZnYir8MPiti1mbMkQxeoDgp3VUZ3WaQn+yNwwGd6KE6zBE/cW8qK02CZ1oRFpfazCYeoy9qyoEd90uokdLQ2HMi/1xKIfrRK/CE28Xv+kEHOkclKTpLAQ0ado+0AqfBcxGMnisbJL14XCF3jVlRl5xYe0LxDQ1MUe1tpeYTLqyLIcb15mgtfBwVWedLKHfrBJcKzCNQKkSvJGp8eazdi4lDRs+gEsy1ELGM9cIvb9moIyARaQc8THH3hnJrl4BsQyz1g5lS0LfX/9DWh0EvBLvBPMSxxBkRgVhHC8QL/OuqxOU7hImyBweFxbj9CwbL2G7Ret9XwBwhuJZalBSHzbm7Imo6+FWQQ0LBzr1C/+Z0utF3
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11910.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(7416014)(366016)(23010399003)(921020)(6133799003)(18002099003)(3023799007)(5023799004)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?W0qzv2NAaIiHV0li8YopBDggpkiV7ULeqpG+ejLkgBKG2/0feqICEEukaeYo?=
 =?us-ascii?Q?5GSlSLig2ZejPlkkHXY25UeHhcUlXW0adI4kSfDU1RM73dIW4sjGx8crxpxO?=
 =?us-ascii?Q?6RVV0m4ZYMDN8T3DoGZmcMB4KC452/9jjNMHNCvxKKS1Gphcvtmgsi3OQfQE?=
 =?us-ascii?Q?8pj9YaChJmC4yDbYgKSp9Epa8ugZ2w7Hgonx4FdvT/cvsCE1kROUFxliwJsX?=
 =?us-ascii?Q?q5U3M8uLVU5tSJ/rj25kL3ABrhKOP25AAq+Y15h1+5OfWZUUPAgIWijjm/0U?=
 =?us-ascii?Q?bjEbznh3jjMWjwDXM1fTfgwfZTH80E6G4SQUB/HV89RuD38YNU0PdRCd9Veo?=
 =?us-ascii?Q?K/QoBB2+B3XjklhlGwjOQuFRuNwpg8Lm4v0dW1YVX3gLj2GRhxXQ49nFsfqc?=
 =?us-ascii?Q?uTIYIIMKfyp33VyGy4pVOgXXkdlG8oD3JasDQGI8yPRArqmoBwc4v28kE/Si?=
 =?us-ascii?Q?Bh8b2vUUyPUhRonaHPDKtQCZrBwrmlPxBQHhj7bbhAUfbIZufmCZNiwdAEat?=
 =?us-ascii?Q?LOsARAha48SdxVgqFGA3PrLOJ9bkjEqfFtFqTV+oElv/3//DBBCoqOMVBB8Q?=
 =?us-ascii?Q?bbAGaRVkwCziAPpM492c/2hTvzEmzoB7RvslDxHAvCmvmA9+By7Erm7URESq?=
 =?us-ascii?Q?Sb9EIdv0LBXkectsE35DV3KpxRvRR/vnrKyVdGHLrCToB4PXJybxLqJXpBZM?=
 =?us-ascii?Q?MWFipSPwSalklprQ+T2+JPPaN7P8HG+NMYlEQJIk+hZ5S/2BIGWu9OOh4mmX?=
 =?us-ascii?Q?F4hL8AAT7RBtD/WzqthWT8efG/kMFdbqSHb8EOEJ0la8QBf1OkXRjpIapvEP?=
 =?us-ascii?Q?8ZupnmLzS/tcc96AeqnWtj3VJF7ZZMeyHAXicHiiLcoaNgG2NTLiUaHn9fHQ?=
 =?us-ascii?Q?raHGhG95fOZq7miZ3BNESOCGL3GrUoZdpuPhhPHyOAvJlFg6hlcoRmL9joD0?=
 =?us-ascii?Q?W+Up5cEI7++5+o1L/M9Nhh/E+9VXBXgT0+l00NpMCtgZNNf6gthQu/yYB1+o?=
 =?us-ascii?Q?IzD8loHT71ofZ0tBNK1JGXOQ7Ipsy9x2q3Bkh93uUA41UQorx9YpY2sc5rYl?=
 =?us-ascii?Q?K6IubhBDzm+UG3/dTqi7DUlEQxlX8TKYlROSuZ2bu9SUk3wbPCd+YfPiogJZ?=
 =?us-ascii?Q?kQ7TFWxp1KSfYKu4ADfJiMNjkCcM5FIaVxWCHkWZPLehY+7JnNnM628b/JnA?=
 =?us-ascii?Q?cSJw3fmKhOYBr1i081/dbQ6oqbzId4YnMjTXs/T6XcGCe5+mPxBt95xHpxOh?=
 =?us-ascii?Q?ZV62pCIzmlAvy4VQyrodD+PpH3PStIKYNTGQQjAH80HAtco4bhfLNGxzxO83?=
 =?us-ascii?Q?LjpHlyA09AUrPQWa8WAlphgq9tAflXvhiCzaguGKl7JULHNjrVIUNKKLs/nn?=
 =?us-ascii?Q?kKDzmBtYts6v0aJtp+YqTseb+/JVXXBUZ7Rq2J9a8wrZq1Js5H+cU1tJFeHO?=
 =?us-ascii?Q?48V6kcFPH2clECBgoaL9xFgM7KJ4nm2NN54ie+GByiooRXhpbHPfmI3J1m0h?=
 =?us-ascii?Q?HuU3lUKN7C/4G75pr2rccKZJtf3htcoFjqiUIga7Do9XFsjfQ6KnFQMbH/Ef?=
 =?us-ascii?Q?dqsqqhLgUTa0M2STECC1OU6s9Waax0QT9H0H9cxscRc53x3cbP/mpvDJrrPA?=
 =?us-ascii?Q?NqshgdmXxQJjTv/B9p3WKboPyx0AxI2K8COZbIchueheeCwmkyeJ0cJT/xG5?=
 =?us-ascii?Q?LBkHRC4D9zCQ+lD+9xYA4sYmedt30yLxxhFyanzGVZGNt+09UsWJZdXaSfcg?=
 =?us-ascii?Q?gOuXIyDjqA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 806c9616-0256-42fe-1f2e-08dec88569da
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11910.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 13:20:46.6576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TS2AIxQEqFLxPQ2BqYAdWZCoYeDxtZQQD5Ir9jhPhXrmxAOTc19CjsiO1jkmnpEqWu747jUSBzBpiDP3OAApLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8203
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[antoine.bouyer@nxp.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	TAGGED_FROM(0.00)[bounces-64688-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julien.vuillaumier@nxp.com,m:alexi.birlinger@nxp.com,m:daniel.baluta@nxp.com,m:peng.fan@nxp.com,m:frank.li@nxp.com,m:jacopo.mondi@ideasonboard.com,m:laurent.pinchart@ideasonboard.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:michael.riesch@collabora.com,m:anthony.mcgivern@arm.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:ai.luthra@ideasonboard.com,m:paul.elder@ideasonboard.com,m:geert@linux-m68k.org,m:sakari.ailus@linux.intel.com,m:hverkuil+cisco@kernel.org,m:antoine.bouyer@nxp.com,m:krzk@kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[antoine.bouyer@nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,nxp.com:dkim,nxp.com:mid,nxp.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E7F59679C2E

Hello

This patch series introduces the NXP Neo Image Signal Processor (ISP)
driver, used in the NXP i.MX95 SoC and future devices in the i.MX9 family.

---
Dependencies
------------
This series is based on v1 of:

  https://lore.kernel.org/linux-media/20260505-extensible-stats-v1-0-e16f326b8dad@ideasonboard.com


The reference tag I rebased all on is:

  next-20260610

---
Description
-----------

The Neo ISP processes one or more camera streams, converting RAW formats
into YUV or RGB outputs. Its architecture is largely influenced by the
PISP driver. To limit the number of v4l2 devices, the driver supports only
one context, with three sink pads (main input, second input for HDR, and
parameter buffers) and three source pads (RGB output, IR output, and
statistics metadata).

The driver uses the generic extensible v4l2-isp framework for parameters,
similar to rkisp1 and mali-c55. The same mechanism is reused for
statistics buffers by relying on the extensible stats introduced in
Jacopo's series. This version does not use a common generic meta format
for the params and stats nodes, as originally planned. Instead, it still
defines meta formats dedicated to neoisp. I preferred to wait for a
consensus on Jacopo's thread first and limit the impact on the neoisp
changes compared to the previous version.

The driver currently supports M2M operation; inline mode (CSI-to-ISP
streaming) is still under evaluation.

A few checkpatch warnings in v4l2-ioctl.c are intentionally kept to match
the existing coding style in that file. Another checkpatch warning
related to job pointer initialization is also kept, as it matches the
approach used in the pispbe driver.

Testing was performed on the i.MX95 EVK with neoisp configured in
standalone mode, with a vivid (Virtual Video Device) instance and a
libcamera neo pipeline handler. An engineering version of the libcamera
pipeline handler is under preparation, and can be shared as dedicated
branch if needed.

End-to-end camera-to-ISP capture, using a single media graph, has been
validated using the downstream NXP kernel.

Thanks,
Antoine

---
Changes in v3:
 * Use single mutex for all nodes' queues handling to avoid list_del
   errors when playing from multiple threads.
 * Use FIELD_xxx macros as suggested by Geert.
 * Add "Reviewed-by" tag from Rob on bindings patch.
 * Force using 32-bits R/W accesses to registers as specified in
   reference manual.
 * Create dedicated accessors for both register and ISP memory accesses:
   register region use readl and writel functions to force 32-bits
   accesses, while memcpy is used for local memories.
 * Fix error code check when initializing v4l2_isp_block_header.
 * Fix some errors reported by sashiko bot:
   - Rework Kconfig and align with imx8-isi
   - Fix NEOISP_COLORSPACE macro logical AND usage
   - Use WC ioremap for statistics region and use memcpy
   - Fix some error cases handling when creating/deleting elements
 * Link to v2: https://lore.kernel.org/linux-media/20260511132629.1300868-1-antoine.bouyer@nxp.com/

Changes in v2:
 * Fix dt_binding_check errors reported by Rob's bot.
 * Remove extensible stats introduction, and use v4l2_isp patches
   from Jacopo's series instead.
 * Use the common v4l2_isp definitions for stats and params in neoisp.
   Replace all occurences of v4l2_isp_params_* and v4l2_isp_stats_* by
   the common structs and helpers.
 * Use the new v4l2_isp helpers for statistics buffer handling.
 * Apply comment from Geert in Kconfig.
 * Fix some typo in the neoisp documentation.
 * Remove `neoisp_feat_ctrl_s` from uapi (used only in legacy format
   which is not supported anymore).
 * Link to v1: https://lore.kernel.org/linux-media/20260413160331.2611829-1-antoine.bouyer@nxp.com/

Changes in v1 (compared to the v0-like-version wrongly called RFC)
 * Integrate Krzysztof's comments in neoisp bindings document: use
   maxItems for clocks, remove unused configs, and rename filename to
   match compatible name used in imx95 SoC.
 * Provide a `neoisp_core_media_register` API to let neoisp register
   itself into an existing media graph, instead of creating its own. The
   goal is to prepare for supporting inline mode alongside M2M mode, and
   to allow userspace to select between these modes at runtime (the 2
   modes cannot run together because of hardware constraints).
 * Use only one Neo ISP context, whereas the RFC version prepared 8
   contexts.
 * Add a module parameter to support a standalone mode. When enabled,
   neoisp registers its own media graph. The goal is to allow testing the
   Neo ISP IP without a camera or other subdevice drivers, such as ISI,
   pixel formatter, etc.
 * Remove support of the legacy mode using fixed-size buffers for parameters
   and statistics; only the generic extensible framework is supported.
 * Remove support of the hardware version 1.
 * Use job scheduling like pispbe driver, to limit impact on interrupt
   handler.
 * Link to RFC: https://lore.kernel.org/linux-media/20260123080938.3367348-1-antoine.bouyer@nxp.com/

---
Antoine Bouyer (8):
  dt-bindings: media: Add nxp neoisp support
  media: v4l2-ctrls: Add user control base for NXP neoisp controls
  media: Add meta formats supported by NXP neoisp driver
  media: uapi: Add NXP NEOISP user interface header file
  media: Documentation: Add NXP neoisp driver documentation
  media: platform: Add NXP Neoisp Image Signal Processor
  media: platform: neoisp: Add debugfs support
  arm64: dts: freescale: imx95: Add NXP neoisp device tree node

 .../admin-guide/media/nxp-neoisp-diagram.dot  |   24 +
 .../admin-guide/media/nxp-neoisp.dot          |   18 +
 .../admin-guide/media/nxp-neoisp.rst          |  179 ++
 .../admin-guide/media/v4l-drivers.rst         |    1 +
 .../bindings/media/nxp,imx95-neoisp.yaml      |   62 +
 .../userspace-api/media/v4l/meta-formats.rst  |    1 +
 .../media/v4l/metafmt-nxp-neoisp.rst          |   70 +
 MAINTAINERS                                   |    9 +
 .../boot/dts/freescale/imx95-19x19-evk.dts    |    4 +
 arch/arm64/boot/dts/freescale/imx95.dtsi      |   11 +
 drivers/media/platform/nxp/Kconfig            |    1 +
 drivers/media/platform/nxp/Makefile           |    1 +
 drivers/media/platform/nxp/neoisp/Kconfig     |   17 +
 drivers/media/platform/nxp/neoisp/Makefile    |    8 +
 drivers/media/platform/nxp/neoisp/neoisp.h    |  265 ++
 .../media/platform/nxp/neoisp/neoisp_core.h   |   30 +
 .../media/platform/nxp/neoisp/neoisp_ctx.c    | 2635 +++++++++++++++++
 .../media/platform/nxp/neoisp/neoisp_ctx.h    |   77 +
 .../platform/nxp/neoisp/neoisp_debugfs.c      |  495 ++++
 .../media/platform/nxp/neoisp/neoisp_fmt.h    |  495 ++++
 drivers/media/platform/nxp/neoisp/neoisp_hw.h |  557 ++++
 .../media/platform/nxp/neoisp/neoisp_main.c   | 1926 ++++++++++++
 .../media/platform/nxp/neoisp/neoisp_nodes.h  |   54 +
 .../media/platform/nxp/neoisp/neoisp_regs.h   | 1465 +++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c          |    2 +
 include/uapi/linux/media/nxp/nxp_neoisp.h     | 1694 +++++++++++
 include/uapi/linux/v4l2-controls.h            |    6 +
 include/uapi/linux/videodev2.h                |    4 +
 28 files changed, 10111 insertions(+)
 create mode 100644 Documentation/admin-guide/media/nxp-neoisp-diagram.dot
 create mode 100644 Documentation/admin-guide/media/nxp-neoisp.dot
 create mode 100644 Documentation/admin-guide/media/nxp-neoisp.rst
 create mode 100644 Documentation/devicetree/bindings/media/nxp,imx95-neoisp.yaml
 create mode 100644 Documentation/userspace-api/media/v4l/metafmt-nxp-neoisp.rst
 create mode 100644 drivers/media/platform/nxp/neoisp/Kconfig
 create mode 100644 drivers/media/platform/nxp/neoisp/Makefile
 create mode 100644 drivers/media/platform/nxp/neoisp/neoisp.h
 create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_core.h
 create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_ctx.c
 create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_ctx.h
 create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_debugfs.c
 create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_fmt.h
 create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_hw.h
 create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_main.c
 create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_nodes.h
 create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_regs.h
 create mode 100644 include/uapi/linux/media/nxp/nxp_neoisp.h


base-commit: abe651837cb394f76d738a7a747322fca3bf17ba
prerequisite-patch-id: 2939dff7f477209138725aa8d86318d6580f4ea3
prerequisite-patch-id: f77370d8fc480b2e972a773f7d56f33ff1995eef
prerequisite-patch-id: bd3b231bc86129d25fca4ae34408a61db43bf883
prerequisite-patch-id: 691322bcfe69b3c51a886441fb241067355b9bdc
prerequisite-patch-id: a5f27213eba078f7ed5420d90df3ecd45151219e
prerequisite-patch-id: 9b2fbe610fb17689030c6da6c529f7db91b86d9c
-- 
2.53.0


