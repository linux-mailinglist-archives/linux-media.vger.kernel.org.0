Return-Path: <linux-media+bounces-58803-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePvTOqlb32n1RwAAu9opvQ
	(envelope-from <linux-media+bounces-58803-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 11:34:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4FE402A1F
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 11:34:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A438B311234E
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 09:26:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1842339875;
	Wed, 15 Apr 2026 09:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="H0M9vMc6"
X-Original-To: linux-media@vger.kernel.org
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11021105.outbound.protection.outlook.com [40.107.42.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D9E337BA4;
	Wed, 15 Apr 2026 09:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776245153; cv=fail; b=sdXhN3uHYWPbtFR3irQkhsE2p1RsZmrUJFk5zwzmbMVw0xQziz6KlZjSAyGEQPu258xMHWWsdF11zVDfOyTQFLitvJRJjZjaZn38rViavgdZRf/teyCpNzL/R+g2sRAc9DGeW85d1jRvW5LftRH+C2TgPuO/Hh9oMDzQEfu4wuw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776245153; c=relaxed/simple;
	bh=nSg/Ssoqf6h+vtH77lJyKL6v33LS5sYs19bVnOEvwJI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=W5aK+3M177se8UXCn23wcsc/OgmjkOAE9EXNFz1ebzooM/DqDy5z2CgoCRO6/3zmya7vSIoGDDUry3BCF2KqSWJHTcaQyQnEcd7+J7NfbF7grWaqv36nUPxMM7ce+QSv4NtOOtRVAP70miMO7cDwo1hP+EmwgiLSOl256M7es8w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=H0M9vMc6; arc=fail smtp.client-ip=40.107.42.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UTDI8gWw7GJ95tE/0fs0W//hyzUTTZBogf9JXzFTdE6PlINj8EEioFQRXkVXMmkdztUI1XqL1y7y9k9ve34wqnthALbb1IO8rt61WGVYgnAc5tgTD09DWdoNuzajXfW3Pw2EYB8xC+/GR95QJTsdhP6e08UF7uSxZ9LXMILJ0bBuV7oguBg1hx1XyjyF1kTu/qg5XlOQ9wSjVPgdqKanZITNflzMGL/EXAwjBKfwkZZHnDB/bNw8/dNRAgbFktEX1TSlIF4IGd8pgOTw3BovAcLvGx4R8BI/oIVC4su1BPwpC/VJrceVxzURNCeg+GLZAvTIjkvedyLbucQLGaclHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sHYwka4P/rRproFefkjtnpyL/CcmAO/Wqdy0HjglPvQ=;
 b=zHA5mkFUNCIMepT7M2Mr7pL/mOIEF+OsQYng1F7iA6FsXpjQBNMpvEh2Zrqr2aGEOqaz4WBNwDJErvREj+Yw26htCoucGFT6yaPO2Kfyz7nTrY4mJXiCdDDNBFV3ufRdaMR8P8BbkOqsQVFPQp0Ef4/9l1ZXVEMyjQnq3rq20TIUkXR35/0sUKHa2zdmQGg+XBPxbXHRRRXRTFKBSqkVBt95cRZcwisStiO16A41Wy0x2b4mvGW3QaNAe2T9reyCYh8eUtdYwWySTj6tJpM+R3HDJMFVFGvdqSCTBc1MjEKKX7IjGOaSYSPh/VZniLEGISeHsTuFdU2tSd+NNTjNCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sHYwka4P/rRproFefkjtnpyL/CcmAO/Wqdy0HjglPvQ=;
 b=H0M9vMc6GITBol0UrXgrx1f/+9JX96ePYUAUz2EyGr6d6w+3FNGdQQXIoej6+0WBG5p1dTk0MMRJB/GFefhV/H6FOJdx2c5yKSbovGj995h9mVqFjXH3n8HR7ooeqh1gewfDHgIuTK9LcOIpFAuurM/Y3hBzugPQm3gEdbUtx/Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1b9::8)
 by SL2P216MB2830.KORP216.PROD.OUTLOOK.COM (2603:1096:101:27f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 09:25:44 +0000
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232]) by SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232%5]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 09:25:44 +0000
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
	marek.vasut@mailbox.org,
	ming.qian@oss.nxp.com,
	Nas Chung <nas.chung@chipsnmedia.com>
Subject: [RFC PATCH v5 2/9] dt-bindings: media: nxp: Add Wave6 video codec device
Date: Wed, 15 Apr 2026 18:25:22 +0900
Message-Id: <20260415092529.577-3-nas.chung@chipsnmedia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260415092529.577-1-nas.chung@chipsnmedia.com>
References: <20260415092529.577-1-nas.chung@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0163.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2cb::11) To SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1b9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2P216MB2441:EE_|SL2P216MB2830:EE_
X-MS-Office365-Filtering-Correlation-Id: e7ef0dca-4364-4974-c72b-08de9ad0f838
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	iYU/syPUA0NUn0ZVK55IpPLpU3Z0xFlrnFdI3Q1GQiVZ076Q/MI4R7VyaRArH8PXuUs8FTabSKwxs2E1hjwk/ZKpTrRmIoZGqsav054PVACxK30cU+qK6QpwpwxleSvQzzbwUX6nDfZ/QktxyX8jZnign+OnqeSbkpQKPPbQdGjanvWKdgvMOqfSEOgvbCJ4coMGAKjpXKQNGkzumS/15gpSKmxWdu7PHzt/oMCpe1fJtOKPqoSMgLwxNy5i08zQEmqXgCnulqT7kQAa/ElWBbtroZgZwvAoufhnUhZiTLWLaINInwNLXcevo5axzRGnbobAFpawPbBbrHOkewyPhYn2OG1e3CWssx3kH8xIfBFpvilGF+YAEEAdgF6LSTboc8qFgEUYW2vtI0Et0ApzSBSPD+pGgAnDhcmo2eGydnNCJfbjssK9to6OnnWWlHAN64nasNTg9IevBDL+FWi5vxvQNFk/8IxKOZNAsW/jBeaJ3Py0tsizIraInXM2mhMkB5Tg83lTvI8tzofEXJlh+WEtl1WuCkPgjN6o0fpqBZI9xi+gNvjBLcwUnyhV8cAvpU38JYqh1ekyzqg1MfkvnFQZrHkdDRzJcgZVo5WBGNOcOJH7D7NCG5NFeV3cjH/hBqYs/C6KR6yDCAVXqjm2s5j//EV389y9uyL0H3rLH63bNdPLSnk7l+PubOpxWALzlGNm6pWClQUv7BDwELzN2Ix0Q8xfQWsdKpJjkspFUK0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2441.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Mq4OjQsQh9c1YUykGKIubbI7n+rYIazTIXWHDsCq5rlTg3GMqVzxmpAmCw5Z?=
 =?us-ascii?Q?lbwccukCZW308zqolrOOqq2kT8PCsxpSPtey/CcLj5FHdOSIcbks7gVVXTAI?=
 =?us-ascii?Q?QurOp541FUWILuqRC+0zXNqxV3OdLK3h8TkGr3Q98bTj/s0V+mxbwMk9NeCM?=
 =?us-ascii?Q?KrhgVrGRWiokoTb47QH83M/jxj2YnDXp8aPDkueHwI/0STxcZmOpypjpi5aO?=
 =?us-ascii?Q?gdwSzPWgd7wlNHDaVZ06HEDhIO0oJXnYmgju71+dxIf2EtZY6Hf33Dq2swbw?=
 =?us-ascii?Q?9GaYGar75Kiw58y6zIxkI8yBRKifYV1gWTkK0P1hOv9A5yfVzu9KsVMbGonO?=
 =?us-ascii?Q?BUPmo24PgKlyDJVK6BOWZnQffDU1zJWz+kT3KkeMmWL0hAMUZirgM4JC4SYV?=
 =?us-ascii?Q?fyggNeFNCTrDss2It54H/Br5m16EVAdujkGt12ZECndMy3h7ZxQqGedQxs4f?=
 =?us-ascii?Q?Ikxw77CuFgToxGLgwQKZi7ZwdPKjvo2buHjp2up6ZKTkALYkF7POlFOPZJLj?=
 =?us-ascii?Q?PqimgrZblt4qM1Ekqx8WIxNJgITEmepSl5pAO64FJ/XuoyjvFMVLF6QzQToK?=
 =?us-ascii?Q?E0GjHlk7KsxQ1NOWbkzlPEhrd5416O/ydS8qppswJng4SsX1g0eKu5QRyYdL?=
 =?us-ascii?Q?cR48/FDdZk89dQtLwKepny6W7F257F06Kqnr3AKBduT6IPbHkjhnOTjFcYsN?=
 =?us-ascii?Q?MxnFcsWYZaf1uvNklPapFrCdzuEFeZWhLKIZSFJy5oemuc6TRh+ur/JZypPA?=
 =?us-ascii?Q?GqS7qfAAbnpRDaV+7a9YxMwKV8XofIrCk3bNrKSWF6bYYgt6qJOT6T+cdZbT?=
 =?us-ascii?Q?ZYDINWNa1C1aVpEAKs/VGORj785ouyVjcV0jwGI+m3FhMAaOIstIHbuo8n2Y?=
 =?us-ascii?Q?NfD3vHobfvLRhi4KvzKGHFnIEtlzYFgd3yxBTUZ0qgKPrCA1nzsEoniV9KPT?=
 =?us-ascii?Q?QIpvtSBouykMrNXwPOOzwdeUD3PzVanaKrpEW86nxlf6n5sM4OpFr9SDVlbt?=
 =?us-ascii?Q?cpnh5c5Ty9jiV2ECps8XvDUVfF3Grj6BGYfUxCnhKvmBH3fzjMzj8Amddxe3?=
 =?us-ascii?Q?EoODln85PpdteF/1VO5kA2jYhV4nGMcrq37u4UpPZ5uXksjs7VubH3xPHuiy?=
 =?us-ascii?Q?m9u7kXpr+Sw4UkHXLGmdbyZsLT7JJl8y55fNeOMmihdIdQbY1zb9SPRT4Y7N?=
 =?us-ascii?Q?OGlVaYpjJnwRjj7S4xpS644tm0C4lA3q6UMjydSU/gzRnAgkeiDodA6zQtPr?=
 =?us-ascii?Q?ACPV0CcMS5VrbBoyREkUjIjW+uC/U+lnrTXV5/h+5T+na5MkxNOaSfnFMnIu?=
 =?us-ascii?Q?muAx/bVbdqI2m0ZcH0aigI2zlatjUUBvM8zUnY749jcXuG2oGFEzsAHMEPP9?=
 =?us-ascii?Q?4QO0Qi3Im1H/pkc4EGRW+iZmDOlqNqr4Uogost7LiNZQk9lDAeYroiJH47Dp?=
 =?us-ascii?Q?7lZzwzp+lG/rKZ/wYZaP4QB1KVHTHngS91VrsdsLZ+DuKWEeMKGRJ9Ymrt7A?=
 =?us-ascii?Q?MFa+GQ32PN41Edo1kdGHTEeLDgOdhFcjEmUi/XzyXuoE3MfxnCFADmYgZVPo?=
 =?us-ascii?Q?cFxyPKefmEXld4KMGHY6CKmCMvBCuORl67GVNKwLQ1wOcOwxknllEb9oT0sq?=
 =?us-ascii?Q?O1O0y5WxMziIA6RTnstQNezrJ1BWNpR2/1hBZZrSVBZEV4do0+sEsolgcxwG?=
 =?us-ascii?Q?Mb9tbAyWduNTORh0upEH143R5tYvEWtuNPV3ECY2x1QEhvIOHPMrw9d4MqXH?=
 =?us-ascii?Q?OPbrDCKfwoJJKgOPX2qqbvWR8gZNUg8=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7ef0dca-4364-4974-c72b-08de9ad0f838
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 09:25:44.2743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4m04RFMgtRPoRxAb5oIfhQATp0XREf1npxHJmkSj4+ExKEVz+zXOfhUH6C2uZJzVLYDBL2etGEBb9wC3wIAHaChEANHL44jT3VDIHVdA7zg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB2830
X-Spamd-Result: default: False [3.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[chipsnmedia.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58803-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[chipsnmedia.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,xs4all.nl,pengutronix.de];
	DKIM_TRACE(0.00)[chipsnmedia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nas.chung@chipsnmedia.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,4c4a0000:email,chipsnmedia.com:email,chipsnmedia.com:dkim,chipsnmedia.com:mid,4c4b0000:email,devicetree.org:url,4c490000:email,4c480000:email,i.mx:url,intel.com:email]
X-Rspamd-Queue-Id: 3A4FE402A1F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add documentation for the Chips&Media Wave6 video codec on NXP i.MX SoCs.

The hardware contains one control register region and four interface
register regions for a shared video processing engine. The control region
manages shared resources such as firmware memory, while each interface
region has its own MMIO range and interrupt.

The control region and each interface region are distinct DMA requesters
and can be associated with separate IOMMU stream IDs. Represent the
control region as the parent node and the interface register regions as
child nodes to describe these resources.

Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 .../bindings/media/nxp,imx95-vpu.yaml         | 163 ++++++++++++++++++
 MAINTAINERS                                   |   7 +
 2 files changed, 170 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/nxp,imx95-vpu.yaml

diff --git a/Documentation/devicetree/bindings/media/nxp,imx95-vpu.yaml b/Documentation/devicetree/bindings/media/nxp,imx95-vpu.yaml
new file mode 100644
index 000000000000..9a5ca53e15a3
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/nxp,imx95-vpu.yaml
@@ -0,0 +1,163 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/nxp,imx95-vpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Chips&Media Wave6 Series multi-standard codec IP on NXP i.MX SoCs
+
+maintainers:
+  - Nas Chung <nas.chung@chipsnmedia.com>
+  - Jackson Lee <jackson.lee@chipsnmedia.com>
+
+description:
+  The Chips&Media Wave6 codec IP is a multi-standard video encoder/decoder.
+  On NXP i.MX SoCs, the Wave6 codec IP exposes one control register region and
+  four interface register regions for a shared video processing engine.
+  The parent node describes the control region, which has its own MMIO range and
+  manages shared resources such as firmware memory. The child nodes describe the
+  interface register regions. Each interface region has its own MMIO range and
+  interrupt.
+  The control region and the interface regions are distinct DMA requesters.
+  The control region and each interface region can be associated with separate
+  IOMMU stream IDs, allowing DMA isolation between them.
+
+properties:
+  compatible:
+    enum:
+      - nxp,imx95-vpu
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: VPU core clock
+      - description: VPU associated block clock
+
+  clock-names:
+    items:
+      - const: core
+      - const: vpublk
+
+  power-domains:
+    items:
+      - description: Main VPU power domain
+      - description: Performance power domain
+
+  power-domain-names:
+    items:
+      - const: vpu
+      - const: perf
+
+  memory-region:
+    maxItems: 1
+
+  sram:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      phandle to the SRAM node used to store reference data, reducing DMA
+      memory bandwidth.
+
+  iommus:
+    maxItems: 1
+
+  "#cooling-cells":
+    const: 2
+
+  "#address-cells":
+    const: 2
+
+  "#size-cells":
+    const: 2
+
+  ranges: true
+
+patternProperties:
+  "^interface@[0-9a-f]+$":
+    type: object
+    description:
+      An interface register region within the Chips&Media Wave6 codec IP.
+      Each region has its own MMIO range and interrupt and can be associated
+      with a separate IOMMU stream ID for DMA isolation.
+    additionalProperties: false
+
+    properties:
+      reg:
+        maxItems: 1
+
+      interrupts:
+        maxItems: 1
+
+      iommus:
+        maxItems: 1
+
+    required:
+      - reg
+      - interrupts
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - power-domains
+  - power-domain-names
+  - memory-region
+  - "#address-cells"
+  - "#size-cells"
+  - ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/nxp,imx95-clock.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      video-codec@4c4c0000 {
+        compatible = "nxp,imx95-vpu";
+        reg = <0x0 0x4c4c0000 0x0 0x10000>;
+        clocks = <&scmi_clk 115>,
+                 <&vpu_blk_ctrl IMX95_CLK_VPUBLK_WAVE>;
+        clock-names = "core", "vpublk";
+        power-domains = <&scmi_devpd 21>,
+                        <&scmi_perf 10>;
+        power-domain-names = "vpu", "perf";
+        memory-region = <&vpu_boot>;
+        sram = <&sram1>;
+        iommus = <&smmu 0x32>;
+        #cooling-cells = <2>;
+        #address-cells = <2>;
+        #size-cells = <2>;
+        ranges;
+
+        interface@4c480000 {
+          reg = <0x0 0x4c480000 0x0 0x10000>;
+          interrupts = <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>;
+          iommus = <&smmu 0x33>;
+        };
+
+        interface@4c490000 {
+          reg = <0x0 0x4c490000 0x0 0x10000>;
+          interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
+          iommus = <&smmu 0x34>;
+        };
+
+        interface@4c4a0000 {
+          reg = <0x0 0x4c4a0000 0x0 0x10000>;
+          interrupts = <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>;
+          iommus = <&smmu 0x35>;
+        };
+
+        interface@4c4b0000 {
+          reg = <0x0 0x4c4b0000 0x0 0x10000>;
+          interrupts = <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>;
+          iommus = <&smmu 0x36>;
+        };
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 32b1dfee8614..5700be993849 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28393,6 +28393,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/cnm,wave521c.yaml
 F:	drivers/media/platform/chips-media/wave5/
 
+WAVE6 VPU CODEC DRIVER
+M:	Nas Chung <nas.chung@chipsnmedia.com>
+M:	Jackson Lee <jackson.lee@chipsnmedia.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/nxp,imx95-vpu.yaml
+
 WHISKEYCOVE PMIC GPIO DRIVER
 M:	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
 L:	linux-gpio@vger.kernel.org
-- 
2.31.1


