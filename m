Return-Path: <linux-media+bounces-65503-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TvKLL/qFO2rWZAgAu9opvQ
	(envelope-from <linux-media+bounces-65503-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 09:23:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF986BC218
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 09:23:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chipsnmedia.com header.s=selector1 header.b=SklpYp4G;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65503-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65503-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 33C503086997
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 07:21:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02BAB391E7F;
	Wed, 24 Jun 2026 07:21:19 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PUWP216CU001.outbound.protection.outlook.com (mail-koreasouthazon11020074.outbound.protection.outlook.com [52.101.156.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7B93988F8;
	Wed, 24 Jun 2026 07:21:08 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782285677; cv=fail; b=AViS3HHFjK32Q5UHYvI4LNg/JJXC825BIfBP/QzVsl9jA8gmX1KpRu0BfMlWBtR6pedTL1+ikVVUZTWfFKYGgeVyhY+n00J4t2urkk6Tfg6xxrWn7HTaWwGe41DJ/W9d1bRgUCeAK4n0sK5usbq7aKgd5l8gW25TNog9c1dtSl0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782285677; c=relaxed/simple;
	bh=DoDv6bKqP39yP649MoUWUTCQYQMtQX/HpeZtzCIcFkg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YbOuOWs1HPLr0v8klWacXoNw9ot0Jv1oi5UBLrS04iQBBKB5AxsmrfiTILit89x4rGJwPYOPo4ml0gQPBIN6urg2LW8CTXlmomoelWNS9NBNbJpJicVoP/X31k9K83xMGgvwwKB09oCy8XOlnzUBCFRPZ18Y92/AyTg1qYXBWTs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=SklpYp4G; arc=fail smtp.client-ip=52.101.156.74
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UZrVipP8fTbKvPlvFFOv+BtDiP7NNahvDn7AhA3Mnoa/PKes/gN1d3MA4RQL9dvw1NoUYTgpsM87tF0aiWlRbEDBJnzCVP69oQDf5rQllGJMJkp7Xsa23lW5Tg1okBWnmpNmu/z4QY38wwi7sk+xtoUh/9wk89OZbNyIWLrEigkAHdjqlpyh4c/1FwfYpeRIUhRN96ofm4036HHzE2BSOrkeASWPJ649DAuIl9mOVxzkU0QkWr5mW6PL64c+JswOVNGzKYXIlsHxq5jdb23EI1/1RFqJOsDuCySEdBUBqVDj6a1Ls0zIXXwFph6DfqQVIMFqpow4vcvqOXYjT/eEBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vvErox2CyhzdINwc76UYibmiS3940qhjdrVYMtsZ9NU=;
 b=KD10DRMEwMyeGmtSLrOCrSxc/GtMV+KdxPRDlbdE7vGET0lSUiJlxBSwDXNW7LxzNU0+EgpIO4ftCBDtb1KB5UIosYsOR53s7VkOzRH9W3rSK4zjQG/UV2RzAfHeQgRUP0q95YDEOT0KyvonetGAkpdWRmcuswDZqi9qq1v2XWMdspgIPerhtkBSpYBsbzFeVy7pSBplSCO9ATnsXp6tYpLYNWWMjb08k/k97Or6RMALQ89b8B5OzpIXN/7NHbwaaArT+QnZEe7WH1U/uxo9nOBRAml2ypLYonGFuk5r/CqkyEZGfzUfJIPtzseIzSChncV3kbSysybUp962QxMajw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vvErox2CyhzdINwc76UYibmiS3940qhjdrVYMtsZ9NU=;
 b=SklpYp4G0+cSZmapFT1zApfs0dr7yx0niDJte9jbt144npFSUrWw63ZAvFZeS0ZsdYJ6eqCoym3oAfpcAyxrcoZ142pO/2wocvwLTzZxzHN1oiKJH8ktH6lu7b6ETPdmjDJR8nOrdftHJO4S0Icb7EHIylPh3XKlher3l3ve84s=
Received: from SE2P216MB2440.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1c8::6)
 by PUUP216MB3514.KORP216.PROD.OUTLOOK.COM (2603:1096:301:16b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 24 Jun
 2026 07:20:58 +0000
Received: from SE2P216MB2440.KORP216.PROD.OUTLOOK.COM
 ([fe80::bb33:6051:ecf9:aec3]) by SE2P216MB2440.KORP216.PROD.OUTLOOK.COM
 ([fe80::bb33:6051:ecf9:aec3%6]) with mapi id 15.21.0159.012; Wed, 24 Jun 2026
 07:20:58 +0000
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
	Nas Chung <nas.chung@chipsnmedia.com>
Subject: [PATCH v6 2/9] dt-bindings: media: nxp: Add Wave6 video codec device
Date: Wed, 24 Jun 2026 16:20:36 +0900
Message-Id: <20260624072043.238-3-nas.chung@chipsnmedia.com>
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
X-MS-Office365-Filtering-Correlation-Id: b1f1ef04-71f6-490f-4f50-08ded1c1233f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|7416014|52116014|376014|366016|38350700014|56012099006|6133799003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	eYoUxujYqIdb+CpzFStzhJSKeN7tqQtqX16676/Bxu00py8NKYICod5N1NsNoP7ItzEKlAwVanJM1ArkDFBLnsWHXecSLK34cX/qiFK+jH8L115Lnb7f00zGyK2gZ8eH7Oagru55OY1MBJ7ePndL0ranWVjHkuWpV3bKQxgG0228hDM/w9I/dWRlKFMuUnqKMs9NEa+vILY2v6gEkSW9QIhCIHeB6yWJ4YhX+9YhwIt990OxP4piOCBPjz+igqLxIfE/U7dlWUVI7KnV0UqGfCj9T849IEUJiIl6RoSFe+gJk7Bfjna4zYAvfGC//RNZVI/ujBUJU4OLWPUrlcBtqbn6J5PlTAE/hUUMVWjIwq845RXeiCzCdmkvkDXWaXMwaoVxrRLxlpBfE3hePwZ3qRq3JSAcNQl1DsftgS9z8tCv9RuLWu3HJVjobkNOyBPwpi+lefKH3wVcBsrPfNmd9i5HsaFUwvm1eJkaWJU/sB5nMnIEcaQsYNaiSaRCxfOUghfR0oenZrdEUiwChuyIvq5LGSrJ3l7qQz773wfXPmaCDYihZ4MipdCuVOQBPJ0qebRSG7SAlyYuVM/uCBSGgvvwaZMuejDQOfklpzMrzpAs9ZDcEHhNMjObnkCjbMdbh+LIWDuxFabi43WKTHyuoe1RwZor8Oe7VyMOArq+Gsw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE2P216MB2440.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(52116014)(376014)(366016)(38350700014)(56012099006)(6133799003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?m5zeTQky4/LWMO67ebRGaS4XP6bEgHshJ+b0pMlbyE17Kp/YBbfQk+iI85pM?=
 =?us-ascii?Q?KPwEUjgFNYJ1pNSrwZdEn9PgG9r1et0SAcUF8crKQQqKbeY3rYeSuaCSv1+A?=
 =?us-ascii?Q?NFX7ohOQ5p4QLYi0GytdRmNE7PU2kIUGPaFKczFHyCevoiELfuK8kSME50FC?=
 =?us-ascii?Q?PcYAN9DARSTR8qdC6GEf8tpzvOR6s7sw2Ey9/+kVrqjZQdZk+/in5H8fzXDU?=
 =?us-ascii?Q?JrngVqKC/Qx1bbi+h3sgGC/4Q0jkM+Q40bXhbp0NQWaaokWrzmftaxCU6gPY?=
 =?us-ascii?Q?4NAaMRtDCHcuk5w/i0FTz430O5nG+5NWXJOpt4EGSoXngZGUBWyV+mbN/C4M?=
 =?us-ascii?Q?RUFErxyhstAtSygtKLmxrZzC3zgaMyFfEyio0Qk6NPZssfTY1+2e4eQbwZr3?=
 =?us-ascii?Q?C/PYrOXTICmxAX5FwSnYi6+F+vC/yzF9Z4WuSq1aBMjq3L7UDjKaazBLJord?=
 =?us-ascii?Q?07uNZ38xf8AFkrMIKiP4hCi2/ssszUn8XCfCmXnSvzwkprUFS9LVk+zL+JTR?=
 =?us-ascii?Q?U74vTGrSBMi4vqAjEvDp5KeZS5F9w42iXrhcEcY0IXfplQBNQdZnD9FQewRq?=
 =?us-ascii?Q?mYLpcm9rcshaaJHRdf92TkLOS2xHDuqKEadYONwq5JmbT6bkjxjY7OsOzx4E?=
 =?us-ascii?Q?Q5JBT+emIa8NRjAFtxCDix3jaz4h4UIu1QBH5XGDSMH/CztxpB+GT0MbI13D?=
 =?us-ascii?Q?leuUVtOXrMPMZiX0edNaKWYQ7aZ+f0vRWVmGxWNW8NbGqMzZCnyOWA22M7wJ?=
 =?us-ascii?Q?W/f7ObgjDu11zMQmSRfdPbbqGqEuOsSJWEyMMGj2g+FIVdFA+BgeIWscyKDG?=
 =?us-ascii?Q?fJ0P7jGrCZmFRlAjKyzZqMJS5vy4qjnPqNKbPmkSUjZKxCGq5FyAR4NErrfm?=
 =?us-ascii?Q?nbOSXlF29vH0fVIJivBysuu19KalqfrH3vKn96PzaSfGjF6h81y36vX0X6l5?=
 =?us-ascii?Q?vLinSaHbAR7F5kZ8nJlmODXDS7Z9rAGEVQ3bARsAGcKozTl+0a2oerjmmuqm?=
 =?us-ascii?Q?bo1Sfxf3XQ4RT4RaQ32TFz0n2rxLDmJODpE7G3i1q0BdAvYxvNaihsb+AWyN?=
 =?us-ascii?Q?BSmjSmjZcKt0KEufZ4t6vSGk2fzmkiU0T8mHQHRMPE1A04x/4biwnnjlejvu?=
 =?us-ascii?Q?jGytAGmdF8oD6uKeWM43h8ULn3MND5XPd5ZMV0+RL30EI6Efl1qwIFgHdFhX?=
 =?us-ascii?Q?YU2isw6ixCJnNQl2jdFiVua8WsnVzN1MubDlRvILPZRfJYgx0cJVkb9Cfk7Q?=
 =?us-ascii?Q?WqyQXWmlu4Vb43l2kalmSiyHtSNFiREKvLKUKvjB1sirQPV+Fx0B9YO6G9C/?=
 =?us-ascii?Q?HP87KLZs4hrxezmYteCAEZCQCUkNLmUrFR/ImAMu3Hss65DbkxRc5CIpk3Q9?=
 =?us-ascii?Q?gx6p85fqOvxXWSxdpd63jXStD5804xGHJxPSpAfJr3mI0Dxc8WNwTwXsoXOp?=
 =?us-ascii?Q?KlpVwXfw3ilL5lzRBv9q78VkGPs8ixI3pBodUR2efTmAJVBV1nlZMo5IM0Wg?=
 =?us-ascii?Q?GBwi5VVeMHj+136TIqpdJJY/Mqy6ldRSOcvIyjFwqc938IK093yGJCShkbmU?=
 =?us-ascii?Q?EvRSYyMTVsU1AsOJl0obUuP8dScstCZ0u/U26i3cmIDA328MGZn06O1V1jBQ?=
 =?us-ascii?Q?9/w1AjnqjqgVwHerrLfUfn7k1Zh8e9fBjNnYKqzbGFjg9ao22ZncQKQdYE/R?=
 =?us-ascii?Q?voVTYTmP4vq1QTaURYFt4RvViJYnhXKIZymZeeH5HX+zl4acuSAt8wX7GoMY?=
 =?us-ascii?Q?oUX5/IwiAZG+fh9ZPuY48/lmHhqPRa0=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1f1ef04-71f6-490f-4f50-08ded1c1233f
X-MS-Exchange-CrossTenant-AuthSource: SE2P216MB2440.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 07:20:58.4162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kCLjUOc4tcUiWRO7DHb7Vy5LMVnTWuHZl/AKq6vWzgtarl68RKyjMLOmUwXVoOv3e8PisTCabjnQNCP14s1g2kb5zIbjq96NqeMMsWRWoYI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUUP216MB3514
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[chipsnmedia.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65503-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:hverkuil@xs4all.nl,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-imx@nxp.com,m:linux-arm-kernel@lists.infradead.org,m:jackson.lee@chipsnmedia.com,m:lafley.kim@chipsnmedia.com,m:marek.vasut@mailbox.org,m:nas.chung@chipsnmedia.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chipsnmedia.com:dkim,chipsnmedia.com:email,chipsnmedia.com:mid,chipsnmedia.com:from_mime,intel.com:email,devicetree.org:url,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,i.mx:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1EF986BC218

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
index efbf808063e5..77ea3a1a966b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28688,6 +28688,13 @@ S:	Maintained
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


