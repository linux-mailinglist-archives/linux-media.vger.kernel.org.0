Return-Path: <linux-media+bounces-65504-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6Um0GEKGO2rkZAgAu9opvQ
	(envelope-from <linux-media+bounces-65504-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 09:24:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2166BC227
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 09:24:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chipsnmedia.com header.s=selector1 header.b=hINH9bLc;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65504-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65504-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9CFC430EAA56
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 07:22:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F1DB397694;
	Wed, 24 Jun 2026 07:21:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PUWP216CU001.outbound.protection.outlook.com (mail-koreasouthazon11020074.outbound.protection.outlook.com [52.101.156.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A513A9605;
	Wed, 24 Jun 2026 07:21:17 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782285689; cv=fail; b=gCO6ACWSi/93/WH9+TUnhQOixdFjmg1ns4L2ugdzcqTW/IrZdKj/dUNfJ/1Mq45AMu9NUiwAyVlfmb2tWBWY1GZVSkuBX3NVZJAuj6HB4x4zMAo2hJUCrlmfw47Q08YJXY7wjyTgL13lnPj1LSzTyt1vaoAmO51lgv7EmlB+0JA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782285689; c=relaxed/simple;
	bh=aTBNLb7JkupGwe4BoymXw9lHFsS7PeCOcAPm6XCSCuo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IgdTa21SciqfTsweiSa4Xd0jg7wJGQXnX9gHBpmGBR/XTj9xp1xsu8yefq0MkzBHDQYCLpQqO0XmLiGkAuOppTI0SV/6A6wAeujJQ7C/roPb+g8vh64gqP6z2hLpjOIas4iXoHmKkaY3YJaWNmXxTtsemMgkzd69MwK3seH7j3Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=hINH9bLc; arc=fail smtp.client-ip=52.101.156.74
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HwAzD4PoUREKAJjG5ONYytrZdsmfzaaNluKgYOkFs0YB5+IEc6YJv4J+uuum1mvO+69u1oQkAIOJPp42nFoxRI72citSOnFqCHllMvOIbgAmr4icugvYfuT4cGBHKmHhz6MqT9CqvTrrSQBRl/l2ZsvZRgCEyCa121O9148qKyZ6vMmlWd1qVDWvGxfeIvt8VUz0XuaNcjYBKcn28NIk5uFz+EVekw1IFKzsgjsCuvoEKZLO+KWP8BBZB44uVikUuY/1tWquybFFh7SS28lcXji/HfMMr+zTPhGalh9tW1SeGGAlnvqRdA6oH2oVER/pmUeXrjxtvdr3cwHvqs4UcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Na8pFBvI3LfOL0pwztPpMlZi/pcXosiuzqlSHWMU6rM=;
 b=TlGx0LOiPfHQXg6YRNueeiEXBxAv7w7Y7bUZzEO+JJXnAOUvIgj7mcetSzleEt2Tmkf0oKjIhqqKYoDrwmfbSm+nyu/wsWk4Gy9XDb6lwiCwjHRUxOclH9o8rt72WH+x8D71GMQrJo1ffg3w3NF5zaJuRy3ZLRa32tLqvicQX6mTWa/4uhPDbPP4HwSMhoe4IVqYiYAFK1+i96gzB5vQGeCStFpmwPqcKnxwX1e0Im0yhU8sqxA8t5RhBEbRq4OzwpkJA0WM6YlM+mOug2cQDw7q2qL7K8889eyWS3LhaYLCqL8hVSFKDR43JdFbGXrkB2REvk4GEvVAKRW8GsRaMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Na8pFBvI3LfOL0pwztPpMlZi/pcXosiuzqlSHWMU6rM=;
 b=hINH9bLc8YXR1Jl4jkWmsxoFjldIru3wjdwd6BmrgJCp8F+lXBecGskBFlkeeHplHcW93tlwDk7WB98Ddyb+X7nAP10m4MGsZBUqAqjnkWxSbE5AQ+/4aLl/xYd604pac5ZC9Xe4AmKGzcHPTIVxLBs+UjJUYbkpdWYUv8o4Y+I=
Received: from SE2P216MB2440.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1c8::6)
 by PUUP216MB3514.KORP216.PROD.OUTLOOK.COM (2603:1096:301:16b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 24 Jun
 2026 07:20:59 +0000
Received: from SE2P216MB2440.KORP216.PROD.OUTLOOK.COM
 ([fe80::bb33:6051:ecf9:aec3]) by SE2P216MB2440.KORP216.PROD.OUTLOOK.COM
 ([fe80::bb33:6051:ecf9:aec3%6]) with mapi id 15.21.0159.012; Wed, 24 Jun 2026
 07:20:59 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil@xs4all.nl,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-imx@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	marek.vasut@mailbox.org,
	Nas Chung <nas.chung@chipsnmedia.com>,
	Ming Qian <ming.qian@oss.nxp.com>
Subject: [PATCH v6 5/9] media: chips-media: wave6: Add Wave6 core driver
Date: Wed, 24 Jun 2026 16:20:39 +0900
Message-Id: <20260624072043.238-6-nas.chung@chipsnmedia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260624072043.238-1-nas.chung@chipsnmedia.com>
References: <20260624072043.238-1-nas.chung@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0168.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2cb::10) To SE2P216MB2440.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1c8::6)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SE2P216MB2440:EE_|PUUP216MB3514:EE_
X-MS-Office365-Filtering-Correlation-Id: 780199e3-88b2-4d28-dd94-08ded1c1240e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|7416014|52116014|376014|366016|38350700014|56012099006|6133799003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	9XSml5eNXGn5wd9NZMXxmaOS+nyXbBC2qzCVpVoYsUt6SbDqE3FWaNA9VaPzEsWrO2eTwgSjOPIjazxTqkDEwTcJudmz8trLHgGbl47BT0zIUevWa4DX2wV0zrtYejLF+YW3dZk2zpEFJByVaDVdMQfUv5lEMv6p/AqaZS6+pi41A9+/mrTXDIhb4r29sQm5eNR0gIjdmvM0QH+aJTD4tr/n/S6D7O3lZ9Thfo08bP9T5G2fcxPmuawNW1cXpnELRGW6OWmMFLmeMG/XEf+346ZvMAqu2/wr1T/y5DT/lRGwiCacTBZ2ODBtRHaOkAvP0ZHcHlIgVd1P5FrKRjDYzgeQXoKoL9sf+VOQJ03lZgSr9mYKlBREGARYfOMeXFBaI85axBp2MrvFr+c7NBkPG57XE8RxilA2qPJmIG0/1AdxlAfhsMchdk9nXDrqk73SCyCRBNFtJqWef7JKkosDRlLGR2p/hCiq/iyrtmTWQd15gE90tIhHhFg/ys8r/dh1XPzsmHGWT7l7+QqvK2EIs/D2GI6PwT6BWDY/cXH2yA0Geg/K/YeyvXma9uE8eM27ZMTzfYGssS51m1Jv0b+urSaTtJh8Ra4VPGctN2z1RZlyxAfwj7hW+fT9a8FynxGL9EhdqXtyuNajYYVrJpxYJiibYN8mmH8u7LXJUG0u9kAnV8sJC3j3v9i5UWZUiJHd7iy/g9oHdApSAXMhXp3hqi6yV89wNue9ipqPeMFj/oY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE2P216MB2440.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(52116014)(376014)(366016)(38350700014)(56012099006)(6133799003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rGvQKcwcGzDifDl7YqUPpY/X3M7Ft3yM7dGr1DpAO7PNX9Y7jBdT6Q1edftg?=
 =?us-ascii?Q?tWglX0k0tPbrcyTEGBq7jgJ99uPNpOCZxYZv7sSXl4xuYroyzOyFd5dNqV+R?=
 =?us-ascii?Q?tsKh+ar8tditYk+PW0QIMstE1nJpG9rJjpmRMrZbdPY0x6TzTcGFcSavsSwK?=
 =?us-ascii?Q?QPpf40sw3lfrzykr3unejfxCJ12VEc7lmdYw++V5fYKsiNfOR8B+SFBoYs/Z?=
 =?us-ascii?Q?8dDBAQq7KbNus5tw5t40cyVLAmL3k0znf/5aijz15+bJKZD8BwGLTBI0iVQ7?=
 =?us-ascii?Q?G6XwZ4DBZ7XbWUY97s71vWZhFShrQt08ZFyRuSFKOm+/NFV3S6vgEZ1HPzLm?=
 =?us-ascii?Q?wH5HpJq8xE6FjLUJTVUO19IAHFUa08qFudJmFJ5T0bn8BHievyDKBdtP9T2D?=
 =?us-ascii?Q?sLTfQ7J4+SW8LtcLMpIScvo4UvplYW52Kkc/9jhxKuLcbH3i9FELXRk2u8eX?=
 =?us-ascii?Q?p+qFEZxKgpMKu85tsLL6LGoNrrqEoPmU5gSMWFBAG50nG4UJkghCUw9GVVJN?=
 =?us-ascii?Q?iBzIbr7F6kSvYRMfll7dB4KuEN+tQrFWCqx0UnE2slXcJsXtDj2s9Yjc/El9?=
 =?us-ascii?Q?o9wuAMAjUHu8D4MJnrw1OYUaQCFSf2rueBJnNPciwHtyowPTBFGueZvKUEoq?=
 =?us-ascii?Q?qG5O3zUSpnrGHzshas4NGGA7phl4Womygyadn18spuA5JQVJJZfrfniX93vX?=
 =?us-ascii?Q?vbWCqdGtrj5U2yQvB0+jktWU3jAQju/r9vPamvCBqDHDFfglOW6lZi9xWpL9?=
 =?us-ascii?Q?Gui7zHljK8qk5z6a4tFYbs9PpWWhSPE//M84DtcNIJwNK207x9fAizyjYR/u?=
 =?us-ascii?Q?A409uXUi9eVn/DC4aAovKSdxK3jTZdVja9zzmkB8OhtLiY7m4JTS4zXbXaht?=
 =?us-ascii?Q?yltLYMgnvyTRkUk9K2zQdpy6zedPgbJtM+nDUCYo2R/GysYun3M4gkoc3oZ4?=
 =?us-ascii?Q?qt2cPe1OhiaRH5kKbzbLDoJqgie5UfoSF8220X8Xh3vbH2d2i6bESwArO4fc?=
 =?us-ascii?Q?cLL3YOqSbd5kCQ5YIVfxfRGOh4rShdn7GtLnKHrONtune16HNYU9cL06Iz7U?=
 =?us-ascii?Q?O5PMghCS8tpKEV2Ad/6DuEb/VfmInm5Cg8YXjT2R3vn/X4CbBKIy4mamuGgN?=
 =?us-ascii?Q?THiA33FEXOVinYpyxxYjoh1PZ15NyEN0F9SySDjsrYBPTdBFlJrkzrSrArOB?=
 =?us-ascii?Q?O7CY6wSgmkEJiNmpMsuywkswr1eZkdwGlcCOPhZri5hAaziIs9+JKVpu50OU?=
 =?us-ascii?Q?X+P3XjyC61/M1aLYVJb1xzknV6yQVhs7Za3lbKcmaWKqkxI2wYTrEZ1vLUDf?=
 =?us-ascii?Q?lMarrwZoLgrj7ADqP0UTcc82SNQ6HyYCw8N4njfHRS+x5wqLgzqYOx+mjQ/K?=
 =?us-ascii?Q?Mf5J3f/M53wzXTsisQUSNDogPVigHqcUPZYNvf4GBYibfhhzcP9+cqKM3yx+?=
 =?us-ascii?Q?t0Es3pCZgQo79GSllgFUMVhAv2PbNPx0mCjx/lsbsfzt1ToIxxXzRqkWio1A?=
 =?us-ascii?Q?tAIMQQwrZAkCGCeDy59wt9sjEXYstX3hcl+9TcjFPyilWJyhPA0nLrqkJf97?=
 =?us-ascii?Q?sxcoIVKB6NG5EazB/ku//agaMH/Hr8rHNAm1RFsOqPDaddxUWrg58RBloyVB?=
 =?us-ascii?Q?A2K/2jD9WdCJPfEG/dEKqC74J5GiMHuKIEVCLYzviYvxQODFnTgdXGtRzYby?=
 =?us-ascii?Q?vNgD7L1g6/04BSGtXIlq1d35uf3PF/ZT1Dgj2mCTNm1edGF2cvDtiKvXIYfY?=
 =?us-ascii?Q?9dT6sZUkMiKPtSkbmcz4MRuzeYqGObU=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 780199e3-88b2-4d28-dd94-08ded1c1240e
X-MS-Exchange-CrossTenant-AuthSource: SE2P216MB2440.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 07:20:59.8452
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iRn9ks3DWse1mgSb3W4P0C92emwDQR27N9g4ndZxt4AdRBjFRQR2XEGCXBge9QP7fb52s4yEDR6aJ+146enynVtSDJRoCKZZLrNXFlEF1T4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUUP216MB3514
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[chipsnmedia.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65504-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:hverkuil@xs4all.nl,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-imx@nxp.com,m:linux-arm-kernel@lists.infradead.org,m:jackson.lee@chipsnmedia.com,m:lafley.kim@chipsnmedia.com,m:marek.vasut@mailbox.org,m:nas.chung@chipsnmedia.com,m:ming.qian@oss.nxp.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[chipsnmedia.com];
	FORGED_SENDER(0.00)[nas.chung@chipsnmedia.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,xs4all.nl,pengutronix.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[chipsnmedia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nas.chung@chipsnmedia.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,mailbox.org:email,chipsnmedia.com:dkim,chipsnmedia.com:email,chipsnmedia.com:mid,chipsnmedia.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AE2166BC227

Add the core driver for the Chips&Media Wave6 video codec IP.

The hardware contains one control register region and four interface
register regions for a shared video processing engine. This driver
handles the interface register regions, each with its own MMIO range and
interrupt, while relying on the control driver for firmware loading and
shared resource management.

It configures the V4L2 mem2mem devices and communicates with the Wave6
hardware to perform video processing tasks.

Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
Tested-by: Ming Qian <ming.qian@oss.nxp.com>
Tested-by: Marek Vasut <marek.vasut@mailbox.org>
---
 .../chips-media/wave6/wave6-vpu-core.c        | 437 ++++++++++++++++++
 .../chips-media/wave6/wave6-vpu-core.h        | 126 +++++
 2 files changed, 563 insertions(+)
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-core.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-core.h

diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-core.c b/drivers/media/platform/chips-media/wave6/wave6-vpu-core.c
new file mode 100644
index 000000000000..e54a2a39ff9a
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-core.c
@@ -0,0 +1,437 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+/*
+ * Wave6 series multi-standard codec IP - wave6 core driver
+ *
+ * Copyright (C) 2025 CHIPS&MEDIA INC
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/clk.h>
+#include <linux/firmware.h>
+#include <linux/interrupt.h>
+#include <linux/pm_runtime.h>
+#include <linux/debugfs.h>
+#include <linux/iopoll.h>
+#include "wave6-vpu-core.h"
+#include "wave6-regdefine.h"
+#include "wave6-vpuconfig.h"
+#include "wave6-hw.h"
+#include "wave6-vpu-dbg.h"
+
+#define CREATE_TRACE_POINTS
+#include "wave6-trace.h"
+
+#define WAVE6_VPU_DEBUGFS_DIR "wave6"
+
+static irqreturn_t wave6_vpu_core_irq(int irq, void *dev_id)
+{
+	struct vpu_core_device *core = dev_id;
+	struct vpu_irq irq_info;
+
+	if (!vpu_read_reg(core, W6_VPU_VPU_INT_STS))
+		return IRQ_NONE;
+
+	irq_info.status = vpu_read_reg(core, W6_VPU_VINT_REASON);
+	irq_info.inst_idc = vpu_read_reg(core, W6_RET_INT_INSTANCE_INFO);
+
+	vpu_write_reg(core, W6_RET_INT_INSTANCE_INFO, INT_INSTANCE_INFO_CLEAR);
+	vpu_write_reg(core, W6_VPU_VINT_REASON_CLEAR, irq_info.status);
+	vpu_write_reg(core, W6_VPU_VINT_CLEAR, VINT_CLEAR);
+
+	trace_wave6_vpu_irq(core, irq_info.status, irq_info.inst_idc);
+
+	if (irq_info.status & BIT(W6_INT_BIT_REQ_WORK_BUF)) {
+		if (core->vpu)
+			core->vpu->req_work_buffer(core->vpu, core);
+
+		return IRQ_HANDLED;
+	}
+
+	kfifo_in(&core->irq_fifo, &irq_info, sizeof(struct vpu_irq));
+
+	return IRQ_WAKE_THREAD;
+}
+
+static struct vpu_instance *wave6_vpu_core_get_instance(struct vpu_core_device *core,
+							u32 inst_idc)
+{
+	struct vpu_instance *inst;
+
+	guard(spinlock)(&core->inst_lock);
+
+	list_for_each_entry(inst, &core->instances, list) {
+		if ((BIT(inst->id) & inst_idc) && inst->enable) {
+			atomic_inc(&inst->refcount);
+			return inst;
+		}
+	}
+
+	return NULL;
+}
+
+static void wave6_vpu_core_put_instance(struct vpu_instance *inst)
+{
+	if (!inst)
+		return;
+
+	guard(spinlock)(&inst->dev->inst_lock);
+	atomic_dec_if_positive(&inst->refcount);
+}
+
+void wave6_vpu_enable_instance(struct vpu_instance *inst)
+{
+	scoped_guard(spinlock, &inst->dev->inst_lock) {
+		atomic_set(&inst->refcount, 0);
+		inst->enable = true;
+	}
+}
+
+void wave6_vpu_disable_instance(struct vpu_instance *inst)
+{
+	int count;
+
+	scoped_guard(spinlock, &inst->dev->inst_lock)
+		inst->enable = false;
+
+	if (read_poll_timeout(atomic_read, count, !count,
+			      W6_VPU_POLL_DELAY_US,
+			      W6_VPU_POLL_TIMEOUT,
+			      true, &inst->refcount))
+		dev_dbg(inst->dev->dev, "[%d] disable timeout\n", inst->id);
+}
+
+static irqreturn_t wave6_vpu_core_irq_thread(int irq, void *dev_id)
+{
+	struct vpu_core_device *core = dev_id;
+	struct vpu_instance *inst;
+	struct vpu_irq irq_info;
+
+	while (kfifo_len(&core->irq_fifo)) {
+		bool error = false;
+
+		if (!kfifo_out(&core->irq_fifo, &irq_info, sizeof(struct vpu_irq)))
+			break;
+
+		inst = wave6_vpu_core_get_instance(core, irq_info.inst_idc);
+		if (!inst)
+			continue;
+
+		if ((irq_info.status & BIT(W6_INT_BIT_INIT_SEQ)) ||
+		    (irq_info.status & BIT(W6_INT_BIT_ENC_SET_PARAM))) {
+			complete(&inst->irq_done);
+			wave6_vpu_core_put_instance(inst);
+			continue;
+		}
+
+		if (irq_info.status & BIT(W6_INT_BIT_BSBUF_ERROR))
+			error = true;
+
+		if (inst->ops && inst->ops->finish_process)
+			inst->ops->finish_process(inst, error);
+
+		wave6_vpu_core_put_instance(inst);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static void wave6_vpu_core_check_state(struct vpu_core_device *core)
+{
+	u32 val;
+	int ret;
+
+	guard(mutex)(&core->hw_lock);
+
+	ret = read_poll_timeout(vpu_read_reg, val, val != 0,
+				W6_VPU_POLL_DELAY_US, W6_VPU_POLL_TIMEOUT,
+				false, core, W6_VPU_VCPU_CUR_PC);
+	if (ret)
+		return;
+
+	wave6_vpu_enable_interrupt(core);
+	ret = wave6_vpu_get_version(core);
+	if (ret) {
+		dev_err(core->dev, "wave6_vpu_get_version fail\n");
+		return;
+	}
+
+	dev_dbg(core->dev, "product 0x%x, fw_ver %d.%d.%d(r%d), hw_ver 0x%x\n",
+		core->attr.product_code,
+		FW_VERSION_MAJOR(core->attr.fw_version),
+		FW_VERSION_MINOR(core->attr.fw_version),
+		FW_VERSION_REL(core->attr.fw_version),
+		core->attr.fw_revision,
+		core->attr.hw_version);
+
+	if (core->attr.fw_version < core->res->compatible_fw_version)
+		dev_err(core->dev, "fw version is too low (< v%d.%d.%d)\n",
+			FW_VERSION_MAJOR(core->res->compatible_fw_version),
+			FW_VERSION_MINOR(core->res->compatible_fw_version),
+			FW_VERSION_REL(core->res->compatible_fw_version));
+}
+
+void wave6_vpu_core_activate(struct vpu_core_device *core)
+{
+	core->active = true;
+}
+
+static void wave6_vpu_core_wait_activated(struct vpu_core_device *core)
+{
+	if (core->active)
+		wave6_vpu_core_check_state(core);
+}
+
+static int wave6_vpu_core_probe(struct platform_device *pdev)
+{
+	struct vpu_core_device *core;
+	const struct wave6_vpu_core_resource *res;
+	int ret;
+	int irq;
+
+	res = dev_get_platdata(&pdev->dev);
+	if (!res) {
+		dev_err(&pdev->dev, "There is no platform data\n");
+		return -ENODEV;
+	}
+
+	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
+	if (ret < 0) {
+		dev_err(&pdev->dev, "failed to set DMA mask: %d\n", ret);
+		return ret;
+	}
+
+	core = devm_kzalloc(&pdev->dev, sizeof(*core), GFP_KERNEL);
+	if (!core)
+		return -ENOMEM;
+
+	ret = devm_mutex_init(&pdev->dev, &core->dev_lock);
+	if (ret)
+		return ret;
+
+	ret = devm_mutex_init(&pdev->dev, &core->hw_lock);
+	if (ret)
+		return ret;
+
+	spin_lock_init(&core->inst_lock);
+	INIT_LIST_HEAD(&core->instances);
+	dev_set_drvdata(&pdev->dev, core);
+	core->dev = &pdev->dev;
+	core->res = res;
+
+	if (pdev->dev.parent->driver && pdev->dev.parent->driver->name &&
+	    !strcmp(pdev->dev.parent->driver->name, WAVE6_VPU_PLATFORM_DRIVER_NAME))
+		core->vpu = dev_get_drvdata(pdev->dev.parent);
+
+	core->reg_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(core->reg_base))
+		return PTR_ERR(core->reg_base);
+
+	ret = devm_clk_bulk_get_all(&pdev->dev, &core->clks);
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret, "failed to get clocks\n");
+
+	core->num_clks = ret;
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	ret = devm_request_threaded_irq(&pdev->dev, irq,
+					wave6_vpu_core_irq,
+					wave6_vpu_core_irq_thread,
+					0, "vpu_irq", core);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to request IRQ: %d\n", ret);
+		return ret;
+	}
+
+	ret = v4l2_device_register(&pdev->dev, &core->v4l2_dev);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to register v4l2_dev: %d\n", ret);
+		return ret;
+	}
+
+	ret = wave6_vpu_init_m2m_dev(core);
+	if (ret)
+		goto err_v4l2_unregister;
+
+	ret = kfifo_alloc(&core->irq_fifo,
+			  MAX_NUM_INSTANCE * sizeof(struct vpu_irq),
+			  GFP_KERNEL);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to allocate fifo\n");
+		goto err_m2m_dev_release;
+	}
+
+	core->temp_vbuf.size = ALIGN(W6_TEMPBUF_SIZE, 4096);
+	ret = wave6_vdi_alloc_dma(core->dev, &core->temp_vbuf);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to allocate temp_vbuf: %d\n", ret);
+		goto err_kfifo_free;
+	}
+
+	core->debugfs = debugfs_lookup(WAVE6_VPU_DEBUGFS_DIR, NULL);
+	if (!IS_ERR_OR_NULL(core->debugfs))
+		dput(core->debugfs);
+	else
+		core->debugfs = debugfs_create_dir(WAVE6_VPU_DEBUGFS_DIR, NULL);
+
+	pm_runtime_enable(&pdev->dev);
+
+	if (core->res->codec_types & WAVE6_IS_DEC) {
+		ret = wave6_vpu_dec_register_device(core);
+		if (ret) {
+			dev_err(&pdev->dev,
+				"failed to register video_dev_dec: %d\n", ret);
+			goto err_temp_vbuf_free;
+		}
+	}
+	if (core->res->codec_types & WAVE6_IS_ENC) {
+		ret = wave6_vpu_enc_register_device(core);
+		if (ret) {
+			dev_err(&pdev->dev,
+				"failed to register video_dev_enc: %d\n", ret);
+			goto err_dec_unreg;
+		}
+	}
+
+	dev_dbg(&pdev->dev, "Added wave6 driver with caps %s %s\n",
+		core->res->codec_types & WAVE6_IS_ENC ? "'ENCODE'" : "",
+		core->res->codec_types & WAVE6_IS_DEC ? "'DECODE'" : "");
+
+	return 0;
+
+err_dec_unreg:
+	if (core->res->codec_types & WAVE6_IS_DEC)
+		wave6_vpu_dec_unregister_device(core);
+err_temp_vbuf_free:
+	pm_runtime_disable(&pdev->dev);
+	wave6_vdi_free_dma(&core->temp_vbuf);
+err_kfifo_free:
+	kfifo_free(&core->irq_fifo);
+err_m2m_dev_release:
+	wave6_vpu_release_m2m_dev(core);
+err_v4l2_unregister:
+	v4l2_device_unregister(&core->v4l2_dev);
+
+	return ret;
+}
+
+static void wave6_vpu_core_remove(struct platform_device *pdev)
+{
+	struct vpu_core_device *core = dev_get_drvdata(&pdev->dev);
+
+	pm_runtime_disable(&pdev->dev);
+
+	wave6_vpu_enc_unregister_device(core);
+	wave6_vpu_dec_unregister_device(core);
+	wave6_vdi_free_dma(&core->temp_vbuf);
+	kfifo_free(&core->irq_fifo);
+	wave6_vpu_release_m2m_dev(core);
+	v4l2_device_unregister(&core->v4l2_dev);
+}
+
+static int wave6_vpu_core_runtime_suspend(struct device *dev)
+{
+	struct vpu_core_device *core = dev_get_drvdata(dev);
+
+	if (WARN_ON(!core))
+		return -ENODEV;
+
+	/*
+	 * Only call parent VPU put_vpu if the core has a parent and is active.
+	 * - core->vpu: prevent access in core without parent VPU.
+	 * - core->active: execute sleep only after m2m streaming is started.
+	 */
+	if (core->vpu && core->active)
+		core->vpu->put_vpu(core->vpu, core);
+
+	if (core->num_clks)
+		clk_bulk_disable_unprepare(core->num_clks, core->clks);
+
+	return 0;
+}
+
+static int wave6_vpu_core_runtime_resume(struct device *dev)
+{
+	struct vpu_core_device *core = dev_get_drvdata(dev);
+	int ret = 0;
+
+	if (WARN_ON(!core))
+		return -ENODEV;
+
+	if (core->num_clks) {
+		ret = clk_bulk_prepare_enable(core->num_clks, core->clks);
+		if (ret) {
+			dev_err(dev, "failed to enable clocks: %d\n", ret);
+			return ret;
+		}
+	}
+
+	/*
+	 * Only call parent VPU get_vpu if the core has a parent and is active.
+	 * - core->vpu: prevent access in core without parent VPU.
+	 * - core->active: execute boot only after m2m streaming is started.
+	 */
+	if (core->vpu && core->active)
+		ret = core->vpu->get_vpu(core->vpu, core);
+
+	if (!ret)
+		wave6_vpu_core_wait_activated(core);
+	else if (core->num_clks)
+		clk_bulk_disable_unprepare(core->num_clks, core->clks);
+
+	return ret;
+}
+
+static int wave6_vpu_core_suspend(struct device *dev)
+{
+	struct vpu_core_device *core = dev_get_drvdata(dev);
+	int ret;
+
+	v4l2_m2m_suspend(core->m2m_dev);
+
+	ret = pm_runtime_force_suspend(dev);
+	if (ret)
+		v4l2_m2m_resume(core->m2m_dev);
+
+	return ret;
+}
+
+static int wave6_vpu_core_resume(struct device *dev)
+{
+	struct vpu_core_device *core = dev_get_drvdata(dev);
+	int ret;
+
+	ret = pm_runtime_force_resume(dev);
+	if (ret)
+		return ret;
+
+	v4l2_m2m_resume(core->m2m_dev);
+
+	return 0;
+}
+
+static const struct dev_pm_ops wave6_vpu_core_pm_ops = {
+	RUNTIME_PM_OPS(wave6_vpu_core_runtime_suspend,
+		       wave6_vpu_core_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(wave6_vpu_core_suspend,
+			    wave6_vpu_core_resume)
+};
+
+static struct platform_driver wave6_vpu_core_driver = {
+	.driver = {
+		.name = WAVE6_VPU_CORE_PLATFORM_DRIVER_NAME,
+		.pm = pm_ptr(&wave6_vpu_core_pm_ops),
+	},
+	.probe = wave6_vpu_core_probe,
+	.remove = wave6_vpu_core_remove,
+};
+
+module_platform_driver(wave6_vpu_core_driver);
+MODULE_ALIAS("platform:" WAVE6_VPU_CORE_PLATFORM_DRIVER_NAME);
+MODULE_DESCRIPTION("chips&media Wave6 VPU CORE V4L2 driver");
+MODULE_AUTHOR("CHIPS&MEDIA INC");
+MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-core.h b/drivers/media/platform/chips-media/wave6/wave6-vpu-core.h
new file mode 100644
index 000000000000..779e8a132f57
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-core.h
@@ -0,0 +1,126 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/*
+ * Wave6 series multi-standard codec IP - wave6 core driver
+ *
+ * Copyright (C) 2025 CHIPS&MEDIA INC
+ */
+
+#ifndef __WAVE6_VPU_CORE_H__
+#define __WAVE6_VPU_CORE_H__
+
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-ioctl.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-fh.h>
+#include <media/videobuf2-v4l2.h>
+#include <media/videobuf2-dma-contig.h>
+#include "wave6-vpuconfig.h"
+#include "wave6-vpuapi.h"
+
+#define vpu_write_reg(CORE, ADDR, DATA) wave6_vpu_writel(CORE, ADDR, DATA)
+#define vpu_read_reg(CORE, ADDR) wave6_vpu_readl(CORE, ADDR)
+
+struct vpu_buffer {
+	struct v4l2_m2m_buffer v4l2_m2m_buf;
+	bool consumed;
+	bool used;
+	bool error;
+	bool force_key_frame;
+	bool force_frame_qp;
+	u32 force_i_frame_qp;
+	u32 force_p_frame_qp;
+	u32 force_b_frame_qp;
+	ktime_t ts_input;
+	ktime_t ts_start;
+	ktime_t ts_finish;
+	ktime_t ts_output;
+	u64 hw_time;
+	u32 average_qp;
+};
+
+enum vpu_fmt_type {
+	VPU_FMT_TYPE_CODEC	= 0,
+	VPU_FMT_TYPE_RAW	= 1
+};
+
+#define VPU_FMT_FLAG_CBCR_INTERLEAVED	BIT(0)
+#define VPU_FMT_FLAG_CRCB_ORDER		BIT(1)
+#define VPU_FMT_FLAG_10BIT		BIT(2)
+#define VPU_FMT_FLAG_RGB		BIT(3)
+#define VPU_FMT_FLAG_SUPPORT_ROT_MIR	BIT(4)
+
+struct vpu_format {
+	unsigned int v4l2_pix_fmt;
+	unsigned int max_width;
+	unsigned int min_width;
+	unsigned int max_height;
+	unsigned int min_height;
+	unsigned int num_planes;
+	enum frame_buffer_format fb_fmt;
+	enum endian_mode endian;
+	enum csc_format_order csc_fmt_order;
+	unsigned int flags;
+};
+
+static inline struct vpu_instance *wave6_fh_to_vpu_inst(struct v4l2_fh *vfh)
+{
+	return container_of(vfh, struct vpu_instance, v4l2_fh);
+}
+
+static inline struct vpu_instance *wave6_file_to_vpu_inst(struct file *filp)
+{
+	return wave6_fh_to_vpu_inst(file_to_v4l2_fh(filp));
+}
+
+static inline struct vpu_instance *wave6_ctrl_to_vpu_inst(struct v4l2_ctrl *vctrl)
+{
+	return container_of(vctrl->handler, struct vpu_instance, v4l2_ctrl_hdl);
+}
+
+static inline struct vpu_buffer *wave6_to_vpu_buf(struct vb2_v4l2_buffer *vbuf)
+{
+	return container_of(vbuf, struct vpu_buffer, v4l2_m2m_buf.vb);
+}
+
+static inline bool wave6_vpu_both_queues_are_streaming(struct vpu_instance *inst)
+{
+	struct vb2_queue *vq_cap = v4l2_m2m_get_dst_vq(inst->v4l2_fh.m2m_ctx);
+	struct vb2_queue *vq_out = v4l2_m2m_get_src_vq(inst->v4l2_fh.m2m_ctx);
+
+	return vb2_is_streaming(vq_cap) && vb2_is_streaming(vq_out);
+}
+
+u32 wave6_vpu_get_consumed_fb_num(struct vpu_instance *inst);
+void wave6_vpu_core_activate(struct vpu_core_device *core);
+void wave6_update_pix_fmt(struct v4l2_pix_format_mplane *pix_mp,
+			  unsigned int width,
+			  unsigned int height);
+struct vb2_v4l2_buffer *wave6_get_dst_buf_by_addr(struct vpu_instance *inst,
+						  dma_addr_t addr);
+dma_addr_t wave6_get_dma_addr(struct vb2_v4l2_buffer *buf,
+			      unsigned int plane_no);
+enum codec_std wave6_to_codec_std(enum vpu_instance_type type, unsigned int v4l2_pix_fmt);
+const char *wave6_vpu_instance_state_name(enum vpu_instance_state state);
+void wave6_vpu_set_instance_state(struct vpu_instance *inst,
+				  enum vpu_instance_state state);
+u64 wave6_vpu_cycle_to_ns(struct vpu_core_device *core, u64 cycle);
+int wave6_vpu_wait_interrupt(struct vpu_instance *inst, unsigned int timeout);
+int wave6_vpu_dec_register_device(struct vpu_core_device *core);
+void wave6_vpu_dec_unregister_device(struct vpu_core_device *core);
+int wave6_vpu_enc_register_device(struct vpu_core_device *core);
+void wave6_vpu_enc_unregister_device(struct vpu_core_device *core);
+void wave6_vpu_finish_job(struct vpu_instance *inst);
+void wave6_vpu_record_performance_timestamps(struct vpu_instance *inst);
+void wave6_vpu_handle_performance(struct vpu_instance *inst,
+				  struct vpu_buffer *vpu_buf);
+void wave6_vpu_reset_performance(struct vpu_instance *inst);
+int wave6_vpu_init_m2m_dev(struct vpu_core_device *core);
+void wave6_vpu_release_m2m_dev(struct vpu_core_device *core);
+int wave6_vpu_subscribe_event(struct v4l2_fh *fh,
+			      const struct v4l2_event_subscription *sub);
+void wave6_vpu_return_buffers(struct vpu_instance *inst,
+			      unsigned int type, enum vb2_buffer_state state);
+void wave6_vpu_enable_instance(struct vpu_instance *inst);
+void wave6_vpu_disable_instance(struct vpu_instance *inst);
+
+#endif /* __WAVE6_VPU_CORE_H__ */
-- 
2.31.1


