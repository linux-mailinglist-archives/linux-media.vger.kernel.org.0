Return-Path: <linux-media+bounces-57728-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCMiH5R3y2k3HwYAu9opvQ
	(envelope-from <linux-media+bounces-57728-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 09:28:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1CA3652A5
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 09:28:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2F49B30447A3
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 07:26:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99BAE3CCA12;
	Tue, 31 Mar 2026 07:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="GnxLnmcT"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010050.outbound.protection.outlook.com [52.101.69.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B06F3CC9F6;
	Tue, 31 Mar 2026 07:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774941943; cv=fail; b=IQA4vKuayiHS5OlVuNQm6SGuzuZ1QG59TIJg+pXAbvRcsLQQZ6efVgfKj7wJKqWmTTeMd0g5NRKEFJEq1MdKoRSME8CwfJrFt4aWETGT51WeZPqC6DGeYuaxWfGa+8mLyqAcob2S/d1zgkM09OPO+SKwRNyIPMFnQCputC5s0Nk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774941943; c=relaxed/simple;
	bh=z2BYag+HfV6vLv5PPbvoGhSMBBp92Zi1l02zftvAsLg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kq6nl7NU2wXKpv9vier9BrZy0fVNW4gHWKpFBV+ZSjZpqdLcyLXj4cEIIwKySzW0GUPim6+huuF5TMFvJ0EQRY0OexuVTakrjEj9l1Cd4Sy0WKxStC8dussZKkqJ9X+CQeVKkrn3L0sCpekiPoIKdwuHxQfYhFd6oVaFBennmW4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=GnxLnmcT; arc=fail smtp.client-ip=52.101.69.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U6x2rB84RciYIk/fTIgzoMtnxHQ2ypdF3WKMzULYP0yia/qi/yV8PXIJ7O9YdNfffiFbS84eGAegegwNgtmxIXcXEluqCZ+uU0jhFOu9BSseRHqxVx1xLR901GxbB8u/GEYZPVHllkoRH+9Ay3WfKj4ma28z1gatVscO2UUV16O504Y8pp1N8ikQ1d1PpShP+PAYXjLXdqYOtk+PQh0sNdpRWF0P/lAjAM0zkVJDVCvaBWcpKndvkZGjdaF3uSqWU9VauUVC8tmw69EV/6JaDOQQtwDC4n9tg20Gw0AnGb8Vzlnsg2371fDX340CYxzyKIxCWYPNfOZvdluCQEr1JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=84LqcDjhmhSzOTlkbBUOdKZ9yjdyXAbdIfXFeK2c20c=;
 b=xKUqazXJ4v8HODHEbG9hd8dV1vzBw9vMmtUrmqlx5rV0SlYYnDfMvyNRQa2CgtVGYE5AuAbE2fKJJlcu7pRjQDqEfPigZEU7d87CvEZY11XbvJAE1mGdug++Y1PVD8B8gqI2rd6903gW8pwIfQPygN8VumUNWWWi1m1dtUtczUXeuTZWZL6KR7lH975jBdCOufM+zHGxBNJ/BQf5BUsDliVyGOunB7lsIecrAcNK1+vIWJjFVfz7WSdy5X1kqQ3KPU8JT9Ga8fF+pvZQmCMjMT3HPJjumDQjplq3Nsx4Md5gCo28EhgMiye5BOQ0ZvVV/88UwIsVHBqs3pE0DpXKUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=84LqcDjhmhSzOTlkbBUOdKZ9yjdyXAbdIfXFeK2c20c=;
 b=GnxLnmcT4MM2DPA40cLRwBMyq3HWLFE3RTgZqTF31SBUgCDdUzPnbUSltFcOB5+9aa+OmPiqr1Sn1kzI24HWP1L9j+WcXC4Jr4sT5cRaEwxBTpvI41EyXlySyPb3COvJ7pqa6BntCnAHtxcy6uEIEqgRn3C1M2wK7npJPJTGTYrOpXWjQB73UwU99htnqxY1dRO/o1ersmXZndYo9bJN+ZJa7ILXyYr6Vp3EbT2SV42VSqDNZVm1et01DZhK4zVJf6ail+PR+HGt4Q99Yzfw9hYJoFkqyxUAUYWDSUk2HKZBCsb7B+3xZnjhcWWTPp8owX/koMUcGYscpk+N1tAOFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM6PR04MB5110.eurprd04.prod.outlook.com (2603:10a6:20b:8::21)
 by AM9PR04MB8131.eurprd04.prod.outlook.com (2603:10a6:20b:3ed::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Tue, 31 Mar
 2026 07:25:37 +0000
Received: from AM6PR04MB5110.eurprd04.prod.outlook.com
 ([fe80::2866:93b6:c814:89fc]) by AM6PR04MB5110.eurprd04.prod.outlook.com
 ([fe80::2866:93b6:c814:89fc%5]) with mapi id 15.20.9632.017; Tue, 31 Mar 2026
 07:25:37 +0000
From: ming.qian@oss.nxp.com
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	nicolas@ndufresne.ca,
	sebastian.fricke@collabora.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	Frank.li@nxp.com,
	xiahong.bao@nxp.com,
	eagle.zhou@nxp.com,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 7/7] media: amphion: Add V4L2 memory tracking support
Date: Tue, 31 Mar 2026 15:23:17 +0800
Message-ID: <20260331072347.253-8-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
In-Reply-To: <20260331072347.253-1-ming.qian@oss.nxp.com>
References: <20260331072347.253-1-ming.qian@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0P287CA0014.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::16) To AM6PR04MB5110.eurprd04.prod.outlook.com
 (2603:10a6:20b:8::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB5110:EE_|AM9PR04MB8131:EE_
X-MS-Office365-Filtering-Correlation-Id: 38321f11-3341-4234-257a-08de8ef6b416
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|52116014|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Al79VKFXgJzsHqISEB3sDRdKxiI5xfd6yBqr8v5XNjfJY8n+QleZhuF8EmSspzmEOviCFXnA5mamuhDRS+ATIHgfmx3ooH4Dix2MerKegcSJDq2SFbjXxLr+cIbFvYMIYujpWPUehNDGE5O4rV8A+4VsVC+r1j7q8g32q5moAa2GgBrOSBNJSUyD01+WH7iq17d1xQs3iL7Gk3fBASCKP/xMj0Vqx1wKNa424IExzLYmEHWlKSaUKef5xrgtOm3kkd+6fqCr/x5FzTz6nHjGzOk6QA7eIrH9YwF9MECwkTU5518bFRLRhShKlUwD9reDhGI5n5G3hzFJPrDYG6DiPhkUiZ0OpmH5tdExbOy38QN95bM+TtgNu2AY5gumpN1IfDodFqpdTdKK9GSOiZFCngBGS+bWEPnIjM+amBJXRSQsymWSSYNEGi7LEUNIp7SDDfX4CMgSnpt9170STemD98JHPG3TuJ5qqy9A2/emHlQ5zD9VOw6NeZyLHjQiXYvD6SroM5k4SA/3oampquvk65BjUJkVHgoI10VV20/9ngOFfpJdhIp9eSrQY8Ql7Xi4kZOf6lgbdHzb7R/EQKRz8fUdU0LejqOmhRMuXWdaaHVBGkV4YJ8e2MDnnJ9K2FnCM0aFyMYxsIQspMbtzEqc/mH7chVDrtASks/edXXL6kY3a6HWqco9yoPhHY/j1oZU3NTNhmmP6dJt2kiq7xll536C2cNkx/G0N3aYgXTdhteU1VYbcVCXPtmVZ+LmePvTeCvOSRiTz4VW4GI81xl5+K8w4j4ARH3fYeafWbmcWpU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5110.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(52116014)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hbrS0gYgq/44U5YP1uOe+xr6DDnsT6fhQLMcbY0f2M6qSl2pub1446b+g29P?=
 =?us-ascii?Q?Ya6PVLSe5igM0kNnco6t1e8K27mvsel+pHkz41bb75CMXJylgsZzDuWXqn3x?=
 =?us-ascii?Q?HvWeZcTN5S7I5R2JnRIv5P7xCX5lyD3hOb5M3cqBNEItBjsxFMTIFhcGWUWO?=
 =?us-ascii?Q?+ljrufhI+mPVHZULhREtWgRFiumHVPyufrw7BegzQQ4fhkyNNr+fgKQJWi3X?=
 =?us-ascii?Q?DJve/BZ11egvS/3axZFGc09D6JFQLB9fkeiu2D+2bnPGsIxS4nPZacIJjFZV?=
 =?us-ascii?Q?qbURzvO3VPMytUsovqBbCzq/R9SDKTfiLyl9D7/j+uqXp+PdUlWVY2vTjNKl?=
 =?us-ascii?Q?gcx8P/tFgs0HJkmnBBeqY8XS606bw6e62ADo+dmzaSN3qtsz96Rn5uPcjG+0?=
 =?us-ascii?Q?6UZorwaDXQQ0+RgQ+IvQilMZlkouqvFfbH3BJ8rgZBwiFvO2eFM1wqwIFjy/?=
 =?us-ascii?Q?MXPdcykBW3DolNAd6MpW5vAelpHB8Vzz8Lbm2dkf5+vtcY9dEqrDamQdCMt5?=
 =?us-ascii?Q?vE2e2D75cpfTooeBw2k+KZcAXUvN6DG52BHwZN1dSqipOdCu6LPsrbHPRHcz?=
 =?us-ascii?Q?q6NK/nC2C8puNfyDX18cfIkPDEcv7B5VDyaZgj/bFxTseDT/cGx2PX51XArq?=
 =?us-ascii?Q?IM3m43YnRQV/pWMEApFLd7sJQrNQsKRfc0h6Zg2OmqgRfeYoP4vrQqY1Wo5o?=
 =?us-ascii?Q?z+/rHzcHnEYN4UHv+om3t8KOj3UQ14d3WvtQsLFsyBqVmGoFWfob5nBoQDEF?=
 =?us-ascii?Q?fCfV925O+JPD3k+MOCY7NFOfsJPGjYEelS3XggD3PGAoIddGvxjHbr0ws77R?=
 =?us-ascii?Q?7RYwZZSy73ZtWj1Pj/6Iz/LYQbRiCrpDProOmq+NQcuMAufp5aIXxAaUUmoJ?=
 =?us-ascii?Q?BoYncm8JKzpRUxkVxewFgKm7pKprFAj19n/Q8LyoMXeZ70JfNER4odCQAZD6?=
 =?us-ascii?Q?5Y45GurrdqPN8V8FJWQM3TGRTwKj9gLWJujBq/qtVqgwHrYeCj3PTC1rYnVY?=
 =?us-ascii?Q?lQYHQgbOHtM//zc+zOikFh6zlwtctb7XspAJvlInEaqkWL/ICQlCGfhT4SIE?=
 =?us-ascii?Q?YED07mGCCY7sBqflihFpa2MRqN4aahgZ3QZ1xcXXZfToB2B8O3rQNaqOdLKk?=
 =?us-ascii?Q?+grAtZdUqSUqpHFYJGZGXj3u1/n+qOZXiBqmILyy8n4DB/MGAYhTHiwcICF6?=
 =?us-ascii?Q?TC+kP1WPexFPd84rD/uO0q4znVWaqX8pRvLuJFavLB78pkbH6lUyimR7kWOZ?=
 =?us-ascii?Q?/47g0uIlGft7RA6sCHdN/8QIkJKTvt9Q/wiE8VRJmqD8EodfxPdiswnL1DsP?=
 =?us-ascii?Q?Hyd/JBDxx9PvhjsmiiuMmS07SQSm58GR9nJLyAVtnL7rsjpufmBgFLYEhQXj?=
 =?us-ascii?Q?sw7ndyywTNEtOCLjnQPgx+t5hoo1eVjNksWCWP7DBoD4FVgqGxnYvWtwDBtS?=
 =?us-ascii?Q?OKZgpnqU2B1qHzA2jNIiOg+mrB9Ky3oPd2QUxs7pO+ZAobgThiAbE/vRkPan?=
 =?us-ascii?Q?gc6bNzPHWChS9CAZh6km31dPXcBq0r8qjtGnKvvmjWnXkHK3XB87vIU9KVrW?=
 =?us-ascii?Q?+sT8GfEANa2LOVkHXbEFYNfAg4tAJCNYN/3Rgdz8GM1GT8+4jyfJCGO/Pa5x?=
 =?us-ascii?Q?KH7n+flvdKVlzSqpHgs/itM8ebYS60knF1aEPJSwvdNcokv/oMf53l3nfD2J?=
 =?us-ascii?Q?AJif2HOLZZaAezpzRtl21KUKO1DT3W70IeN0A8iI8+r5WJ7W+mDAxDY1/Wae?=
 =?us-ascii?Q?utrRzADAxQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38321f11-3341-4234-257a-08de8ef6b416
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5110.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 07:25:37.1037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L7AmC+rCcUXRhvG+RoOoxzDl7PpX1RmbW2WjeUDwQ09+78yvKjAyCyf02YZnRaAVV7jxiIeyeQA2BzVHsK4J0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8131
X-Spamd-Result: default: False [1.94 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,xs4all.nl,ndufresne.ca,collabora.com,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57728-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ming.qian@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,nxp.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.nxp.com:mid]
X-Rspamd-Queue-Id: 1F1CA3652A5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Ming Qian <ming.qian@oss.nxp.com>

Integrate V4L2 memtrack framework to track DMA buffer allocations in the
Amphion VPU driver. Memory usage is organized hierarchically (device ->
instance -> queue) and exposed via V4L2_CID_MEMORY_USAGE control and
debugfs.

Tracked buffers include firmware boot region, RPC, stream ring buffers,
and codec-specific frame buffers (MBI, DCP, enc/ref frames).

Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
---
 drivers/media/platform/amphion/Kconfig    |  1 +
 drivers/media/platform/amphion/vdec.c     |  9 ++++++
 drivers/media/platform/amphion/venc.c     |  9 ++++++
 drivers/media/platform/amphion/vpu.h      |  7 +++++
 drivers/media/platform/amphion/vpu_core.c |  6 ++++
 drivers/media/platform/amphion/vpu_dbg.c  |  5 ++++
 drivers/media/platform/amphion/vpu_drv.c  |  2 ++
 drivers/media/platform/amphion/vpu_v4l2.c | 35 ++++++++++++++++++++++-
 8 files changed, 73 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/amphion/Kconfig b/drivers/media/platform/amphion/Kconfig
index 4a363e07ccc9..2835c25415c5 100644
--- a/drivers/media/platform/amphion/Kconfig
+++ b/drivers/media/platform/amphion/Kconfig
@@ -12,6 +12,7 @@ config VIDEO_AMPHION_VPU
 	select V4L2_MEM2MEM_DEV
 	select VIDEOBUF2_DMA_CONTIG
 	select VIDEOBUF2_VMALLOC
+	select V4L2_MEMTRACK
 	help
 	  Amphion VPU Codec IP contains two parts: Windsor and Malone.
 	  Windsor is encoder that supports H.264, and Malone is decoder
diff --git a/drivers/media/platform/amphion/vdec.c b/drivers/media/platform/amphion/vdec.c
index a9f0521f2e1a..2b863fadb67f 100644
--- a/drivers/media/platform/amphion/vdec.c
+++ b/drivers/media/platform/amphion/vdec.c
@@ -279,6 +279,9 @@ static int vdec_ctrl_init(struct vpu_inst *inst)
 	if (ctrl)
 		ctrl->flags |= V4L2_CTRL_FLAG_VOLATILE;
 
+	v4l2_ctrl_new_std(&inst->ctrl_handler, NULL,
+			  V4L2_CID_MEMORY_USAGE, 0, S64_MAX, 1, 0);
+
 	if (inst->ctrl_handler.error) {
 		ret = inst->ctrl_handler.error;
 		v4l2_ctrl_handler_free(&inst->ctrl_handler);
@@ -1069,6 +1072,8 @@ static int vdec_alloc_fs_buffer(struct vpu_inst *inst, struct vdec_fs_info *fs)
 
 	vpu_free_dma(buffer);
 	buffer->length = fs->size;
+	buffer->memtrack = inst->memtrack;
+	buffer->label = fs->type == MEM_RES_MBI ? "mbi" : "dcp";
 	return vpu_alloc_dma(inst->core, buffer);
 }
 
@@ -1683,6 +1688,8 @@ static int vdec_start(struct vpu_inst *inst)
 	vpu_trace(inst->dev, "[%d]\n", inst->id);
 	if (!vdec->udata.virt) {
 		vdec->udata.length = 0x1000;
+		vdec->udata.memtrack = inst->memtrack;
+		vdec->udata.label = "udata";
 		ret = vpu_alloc_dma(inst->core, &vdec->udata);
 		if (ret) {
 			dev_err(inst->dev, "[%d] alloc udata fail\n", inst->id);
@@ -1694,6 +1701,8 @@ static int vdec_start(struct vpu_inst *inst)
 		stream_buffer_size = vpu_iface_get_stream_buffer_size(inst->core);
 		if (stream_buffer_size > 0) {
 			inst->stream_buffer.length = stream_buffer_size;
+			inst->stream_buffer.memtrack = inst->memtrack;
+			inst->stream_buffer.label = "bitstream-ring-buffer";
 			ret = vpu_alloc_dma(inst->core, &inst->stream_buffer);
 			if (ret) {
 				dev_err(inst->dev, "[%d] alloc stream buffer fail\n", inst->id);
diff --git a/drivers/media/platform/amphion/venc.c b/drivers/media/platform/amphion/venc.c
index 0b3d58b9f2f7..193ee488eba4 100644
--- a/drivers/media/platform/amphion/venc.c
+++ b/drivers/media/platform/amphion/venc.c
@@ -678,6 +678,9 @@ static int venc_ctrl_init(struct vpu_inst *inst)
 	v4l2_ctrl_new_std(&inst->ctrl_handler, NULL,
 			  V4L2_CID_MPEG_VIDEO_AVERAGE_QP, 0, 51, 1, 0);
 
+	v4l2_ctrl_new_std(&inst->ctrl_handler, NULL,
+			  V4L2_CID_MEMORY_USAGE, 0, S64_MAX, 1, 0);
+
 	if (inst->ctrl_handler.error) {
 		ret = inst->ctrl_handler.error;
 		v4l2_ctrl_handler_free(&inst->ctrl_handler);
@@ -929,6 +932,8 @@ static int venc_start_session(struct vpu_inst *inst, u32 type)
 	stream_buffer_size = vpu_iface_get_stream_buffer_size(inst->core);
 	if (stream_buffer_size > 0) {
 		inst->stream_buffer.length = max_t(u32, stream_buffer_size, venc->cpb_size * 3);
+		inst->stream_buffer.memtrack = inst->memtrack;
+		inst->stream_buffer.label = "bitstream-ring-buffer";
 		ret = vpu_alloc_dma(inst->core, &inst->stream_buffer);
 		if (ret)
 			goto error;
@@ -1027,6 +1032,8 @@ static void venc_request_mem_resource(struct vpu_inst *inst,
 
 	for (i = 0; i < enc_frame_num; i++) {
 		venc->enc[i].length = enc_frame_size;
+		venc->enc[i].memtrack = inst->memtrack;
+		venc->enc[i].label = "enc-frame";
 		ret = vpu_alloc_dma(inst->core, &venc->enc[i]);
 		if (ret) {
 			venc_cleanup_mem_resource(inst);
@@ -1035,6 +1042,8 @@ static void venc_request_mem_resource(struct vpu_inst *inst,
 	}
 	for (i = 0; i < ref_frame_num; i++) {
 		venc->ref[i].length = ref_frame_size;
+		venc->ref[i].memtrack = inst->memtrack;
+		venc->ref[i].label = "ref-frame";
 		ret = vpu_alloc_dma(inst->core, &venc->ref[i]);
 		if (ret) {
 			venc_cleanup_mem_resource(inst);
diff --git a/drivers/media/platform/amphion/vpu.h b/drivers/media/platform/amphion/vpu.h
index bfd171a3ded4..08913cc54cb1 100644
--- a/drivers/media/platform/amphion/vpu.h
+++ b/drivers/media/platform/amphion/vpu.h
@@ -9,6 +9,7 @@
 #include <media/v4l2-device.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-mem2mem.h>
+#include <media/v4l2-memtrack.h>
 #include <linux/mailbox_client.h>
 #include <linux/mailbox_controller.h>
 #include <linux/kfifo.h>
@@ -17,6 +18,7 @@
 #define VPU_TIMEOUT		msecs_to_jiffies(1000)
 #define VPU_INST_NULL_ID	(-1L)
 #define VPU_MSG_BUFFER_SIZE	(8192)
+#define VPU_NOTIFY_DELAY_MS	(200)
 
 enum imx_plat_type {
 	IMX8QXP = 0,
@@ -47,6 +49,8 @@ struct vpu_buffer {
 	u32 length;
 	u32 bytesused;
 	struct device *dev;
+	struct v4l2_memtrack_node *memtrack;
+	const char *label;
 };
 
 struct vpu_func {
@@ -81,6 +85,7 @@ struct vpu_dev {
 	atomic_t ref_dec;
 
 	struct dentry *debugfs;
+	struct v4l2_memtrack_node *memtrack;
 };
 
 struct vpu_format {
@@ -279,6 +284,8 @@ struct vpu_inst {
 	pid_t tgid;
 	struct dentry *debugfs;
 
+	struct v4l2_memtrack_node *memtrack;
+
 	void *priv;
 };
 
diff --git a/drivers/media/platform/amphion/vpu_core.c b/drivers/media/platform/amphion/vpu_core.c
index 85cc4a14f8ed..16c2efc86feb 100644
--- a/drivers/media/platform/amphion/vpu_core.c
+++ b/drivers/media/platform/amphion/vpu_core.c
@@ -150,6 +150,8 @@ static int __vpu_alloc_dma(struct device *dev, struct vpu_buffer *buf)
 	if (!buf->virt)
 		return -ENOMEM;
 
+	if (buf->memtrack)
+		v4l2_memtrack_add(buf->memtrack, buf->length, buf->label);
 	buf->dev = dev;
 
 	return 0;
@@ -160,6 +162,8 @@ void vpu_free_dma(struct vpu_buffer *buf)
 	if (!buf->virt || !buf->dev)
 		return;
 
+	if (buf->memtrack)
+		v4l2_memtrack_sub(buf->memtrack, buf->length, buf->label);
 	dma_free_coherent(buf->dev, buf->length, buf->virt, buf->phys);
 	buf->virt = NULL;
 	buf->phys = 0;
@@ -550,6 +554,7 @@ static int vpu_core_parse_dt(struct vpu_core *core, struct device_node *np)
 
 	core->fw.phys = res.start;
 	core->fw.length = resource_size(&res);
+	v4l2_memtrack_add(core->vpu->memtrack, core->fw.length, "fw");
 
 	ret = of_reserved_mem_region_to_resource(np, 1, &res);
 	if (ret) {
@@ -559,6 +564,7 @@ static int vpu_core_parse_dt(struct vpu_core *core, struct device_node *np)
 
 	core->rpc.phys = res.start;
 	core->rpc.length = resource_size(&res);
+	v4l2_memtrack_add(core->vpu->memtrack, core->rpc.length, "rpc");
 
 	if (core->rpc.length < core->res->rpc_size + core->res->fwlog_size) {
 		dev_err(core->dev, "the rpc-region <%pad, 0x%x> is not enough\n",
diff --git a/drivers/media/platform/amphion/vpu_dbg.c b/drivers/media/platform/amphion/vpu_dbg.c
index 497ae4e8a229..a82e21cc8a67 100644
--- a/drivers/media/platform/amphion/vpu_dbg.c
+++ b/drivers/media/platform/amphion/vpu_dbg.c
@@ -212,6 +212,11 @@ static int vpu_dbg_instance(struct seq_file *s, void *data)
 	if (seq_write(s, str, num))
 		return 0;
 
+	num = scnprintf(str, sizeof(str), "memory usage = %ld\n",
+			v4l2_memtrack_read(inst->memtrack));
+	if (seq_write(s, str, num))
+		return 0;
+
 	num = scnprintf(str, sizeof(str), "flow :\n");
 	if (seq_write(s, str, num))
 		return 0;
diff --git a/drivers/media/platform/amphion/vpu_drv.c b/drivers/media/platform/amphion/vpu_drv.c
index 2cca61f41bea..73e01c55da82 100644
--- a/drivers/media/platform/amphion/vpu_drv.c
+++ b/drivers/media/platform/amphion/vpu_drv.c
@@ -138,6 +138,7 @@ static int vpu_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_vpu_media;
 	vpu->debugfs = debugfs_create_dir("amphion_vpu", NULL);
+	vpu->memtrack = v4l2_memtrack_create_root("amphion-vpu");
 
 	of_platform_populate(dev->of_node, NULL, NULL, dev);
 
@@ -162,6 +163,7 @@ static void vpu_remove(struct platform_device *pdev)
 	struct vpu_dev *vpu = platform_get_drvdata(pdev);
 	struct device *dev = &pdev->dev;
 
+	v4l2_memtrack_destroy_node(vpu->memtrack);
 	debugfs_remove_recursive(vpu->debugfs);
 	vpu->debugfs = NULL;
 
diff --git a/drivers/media/platform/amphion/vpu_v4l2.c b/drivers/media/platform/amphion/vpu_v4l2.c
index 7cccc994fc50..431f5f64e683 100644
--- a/drivers/media/platform/amphion/vpu_v4l2.c
+++ b/drivers/media/platform/amphion/vpu_v4l2.c
@@ -651,6 +651,14 @@ static const struct vb2_ops vpu_vb2_ops = {
 	.buf_queue          = vpu_vb2_buf_queue,
 };
 
+static void vpu_memtrack_ctrl_notify(struct v4l2_memtrack_node *node, size_t total, void *priv)
+{
+	struct v4l2_ctrl *ctrl = priv;
+
+	if (ctrl)
+		v4l2_ctrl_s_ctrl_int64(ctrl, total);
+}
+
 static int vpu_m2m_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_vq)
 {
 	struct vpu_inst *inst = priv;
@@ -668,9 +676,13 @@ static int vpu_m2m_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_q
 	src_vq->buf_struct_size = sizeof(struct vpu_vb2_buffer);
 	src_vq->dev = inst->vpu->dev;
 	src_vq->lock = &inst->lock;
+	if (inst->memtrack)
+		src_vq->memtrack = v4l2_memtrack_create_node(inst->memtrack, "output");
 	ret = vb2_queue_init(src_vq);
-	if (ret)
+	if (ret) {
+		v4l2_memtrack_destroy_node(src_vq->memtrack);
 		return ret;
+	}
 
 	dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
 	inst->cap_format.type = dst_vq->type;
@@ -684,8 +696,12 @@ static int vpu_m2m_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_q
 	dst_vq->buf_struct_size = sizeof(struct vpu_vb2_buffer);
 	dst_vq->dev = inst->vpu->dev;
 	dst_vq->lock = &inst->lock;
+	if (inst->memtrack)
+		dst_vq->memtrack = v4l2_memtrack_create_node(inst->memtrack, "capture");
 	ret = vb2_queue_init(dst_vq);
 	if (ret) {
+		v4l2_memtrack_destroy_node(src_vq->memtrack);
+		v4l2_memtrack_destroy_node(dst_vq->memtrack);
 		vb2_queue_release(src_vq);
 		return ret;
 	}
@@ -706,6 +722,12 @@ static int vpu_v4l2_release(struct vpu_inst *inst)
 	vpu_release_core(inst->core);
 	put_device(inst->dev);
 
+	if (inst->memtrack) {
+		v4l2_memtrack_unregister_notify(inst->memtrack);
+		v4l2_memtrack_destroy_node(inst->memtrack);
+		inst->memtrack = NULL;
+	}
+
 	v4l2_ctrl_handler_free(&inst->ctrl_handler);
 	mutex_destroy(&inst->lock);
 
@@ -745,6 +767,8 @@ int vpu_v4l2_open(struct file *file, struct vpu_inst *inst)
 	inst->min_buffer_out = 2;
 	v4l2_fh_init(&inst->fh, func->vfd);
 	v4l2_fh_add(&inst->fh, file);
+	if (vpu->memtrack)
+		inst->memtrack = v4l2_memtrack_create_node(vpu->memtrack, "instance");
 
 	ret = call_vop(inst, ctrl_init);
 	if (ret)
@@ -757,6 +781,14 @@ int vpu_v4l2_open(struct file *file, struct vpu_inst *inst)
 		goto error;
 	}
 
+	if (inst->memtrack) {
+		v4l2_memtrack_set_notify_delay(inst->memtrack, VPU_NOTIFY_DELAY_MS);
+		v4l2_memtrack_register_notify(inst->memtrack,
+					      vpu_memtrack_ctrl_notify,
+					      v4l2_ctrl_find(&inst->ctrl_handler,
+							     V4L2_CID_MEMORY_USAGE));
+	}
+
 	inst->fh.ctrl_handler = &inst->ctrl_handler;
 	inst->state = VPU_CODEC_STATE_DEINIT;
 	inst->workqueue = alloc_ordered_workqueue("vpu_inst", WQ_MEM_RECLAIM);
@@ -775,6 +807,7 @@ int vpu_v4l2_open(struct file *file, struct vpu_inst *inst)
 
 	return 0;
 error:
+	v4l2_memtrack_destroy_node(inst->memtrack);
 	v4l2_fh_del(&inst->fh, file);
 	v4l2_fh_exit(&inst->fh);
 	vpu_inst_put(inst);
-- 
2.53.0


