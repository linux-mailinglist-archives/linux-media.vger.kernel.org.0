Return-Path: <linux-media+bounces-25478-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EF966A240AF
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 17:37:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4666018838B0
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 16:36:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA8941F37C9;
	Fri, 31 Jan 2025 16:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="p+tzEiC3"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013016.outbound.protection.outlook.com [40.107.159.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50641F03D4;
	Fri, 31 Jan 2025 16:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738341274; cv=fail; b=U/1j4zJQPsBZ+zAg1ZAUePtcocnuqzcDzdg0N6y21b8vEANkDZdrJnNjc7ydKgJD5EW4o1hKLFbNPho9HlYMaFBZ63j0+hXt23eNc0Id/5qtPNuChgWu9Uqdtw1YhW7gzbmvovXo/EU12FXIW/h9K4zgpNTVsad3HlfjMD4q9jY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738341274; c=relaxed/simple;
	bh=uMGnWazdw4yzMf10XZFI+JXETxKT1vyy2UNrn6LaO2c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DxEAMzBAx/kDTO8rKErm9h91GFiEDkjj9IV+xicmRbEyrD3/f+naIwEDM4uCoxp+sB54DcY740Yd0DABR8Krh5Rkc2MwZmttsZM8r1iEMUFaxWtgQgyDXbnWZN7OvMzwT5aPtUDSPG6wp4b0yXkgw1NJM/b2X0DQN2/3WMvFXcY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=p+tzEiC3; arc=fail smtp.client-ip=40.107.159.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dRJP4W07ZechUv+3xUs1hVdsHVPhdv/tlfFNhhyEJlHakU7n1FjBxVs+gI/EqxbXE0fqMKpZzEIh/Ilsy/y86e6/w/awAM5jrdUm0PeoK0aOY3Cyo1yjSbxKJws195N1pFqCmQ50r5k+y9Bq+F65Cs7jb1j/JnnZuBymAx4l/AM1RKmOxHI6lUBU6pvuEk9I+CpyAicY1YY47X5RYHwXWPYMujLY0I8PBstRxHGXYrxlxAMoKLfwsA1iK+QpzNIous5V4a/aXI/Q8wi25+xxYS4b7fBN9rmw/Te0MlvWcR0a8bTzhYnF4gp9NHFZIY0ZpoN+22YN0jHr0Yf9aAxFoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DkeoquS2GY5W2kC4bmCtoAwABXdEm/40yU391U4VFm4=;
 b=wPJcR5wbu4ZYlihCKbY9Q5XQ/15Lvwk646eeDUJIvxwEoatLGOBCczMV5hxcz3gHwme6kd4JkJwDAfpZZ0CSbC0VqjjvmYT+X4fRNls2baz851l0tRgHV2yk+kIcA337P71jXm7dA1VuprwkU2Ry6Rkp6swIupUiCzTGfTeoxLJhYldZS+17OkpA9o7/PDR83eABSnbwr8zqUKBQfywr4BWqj+5j/p7ZxTMaA+aMOb9wmtRwoeDbr1Q19+XwthFTyChciMnkXcFe0vhp3gSG+1PMfUpLypMDSRuplX6wC1X+I6Wt0m/QPV+5X+WrR+BhKyw1jJqUhxY33+vRT4Pxiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DkeoquS2GY5W2kC4bmCtoAwABXdEm/40yU391U4VFm4=;
 b=p+tzEiC3UfxzL3w46zxnxFaOhcHLdH9ygWERxtZF3Y8S3s3YiuEg56PCALP1l2UNxKYEZou2xzCgnGVsO/U/DXkEDGyZIs121bTn+UMFiDiyNaImbnbq9hNVnHlte6FiRr7gf3j+f9L1DHScq+Z28Led+jjVpo+DX12wxtdoyVhV2W9pBayLSq4cPYnGoomVkNBs3RPU8t478tG/RoR3lnYDNqlbbzIqQZbzaNZ6y1HEyj2am0XMc2RJKfrAM0e0hb3n/ZmcjubKz1F9Ex6Qmxa/Rzq3LpG2MzmKFfBw+ghk9zoc3yAlWzxQl2d8urHc62iDQWdaV+1yjvdIFjFDYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by AS8PR04MB8529.eurprd04.prod.outlook.com (2603:10a6:20b:420::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Fri, 31 Jan
 2025 16:34:28 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%6]) with mapi id 15.20.8398.017; Fri, 31 Jan 2025
 16:34:28 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [RFC 01/12] media: mc: Add INTERNAL pad flag
Date: Fri, 31 Jan 2025 18:33:55 +0200
Message-Id: <20250131163408.2019144-2-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250131163408.2019144-1-laurentiu.palcu@oss.nxp.com>
References: <20250131163408.2019144-1-laurentiu.palcu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P189CA0012.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d7::15) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|AS8PR04MB8529:EE_
X-MS-Office365-Filtering-Correlation-Id: c50ebcdc-0a31-483e-0fdc-08dd42152182
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?o8iX2BWau1VF8D6AXHZdeWZuPXFw7H8UmIWH+3UC+8I4c6iu/DWpBO7FIC1p?=
 =?us-ascii?Q?AHRkhDJkwyep3unTZjoMtdpTMiGXhGInpIxo/atOHnyzbKj5A6mRxJ3UcXaM?=
 =?us-ascii?Q?ArIV+zpzAvj2GLiL6yI+TuWbR4g8lqS+lU/vjcaBp1vPbVkKv8G1sznFnge4?=
 =?us-ascii?Q?99hMehULCwp3iqLRAtzci8dP9biG55pim34xRHDuIvgUCN50tnfENEFZiIMa?=
 =?us-ascii?Q?4Wnt1h4hAaPddlOmhul20xwOiIjppfdgcJqjGZKJakoCFtlHsDi8A+gk/OJQ?=
 =?us-ascii?Q?RTVT/XsNEAhdFkmLxfcoNCdwvt9jAzDj5NiO7V1ky1z45TstykluYcQj00ud?=
 =?us-ascii?Q?uHu5BnJvcSDNENaDW1CitY2nyvmrJ8HNmnN7A5NvSbZUN7FZQD95pM3TYnFu?=
 =?us-ascii?Q?gN0gJGQxQYMNU5oKfhYrSpN7x2naGnNJkhfkudo/toctgZadGretGghE5N2M?=
 =?us-ascii?Q?tbvL7i9kcyNC/I1yikW5J6q2G2z4zHD8Td6QLL/nZgnbUNo1w/JRl6iXa7ue?=
 =?us-ascii?Q?wng6DdS0xp2wUcGUeQKsf0gMl6Amdv7Ay+Qz1y/6EAS+aIFWQDXEFXnJo0cE?=
 =?us-ascii?Q?wrDHI2QIDpomXVqPWiBBgcY3CKAjpZeBKAsMvwjgzSLfzsVazVG+Eyt4kRm1?=
 =?us-ascii?Q?8EScmzCdxjvHgIVZvg8JE/Vsq82VllT/VBdjD/ynsHYmXO91MTg9THgF3bfG?=
 =?us-ascii?Q?sc5Gl6RJ3kc/30LKb4BMtp2mijXU8l/6Wp7qyXtOb4PPLUdCisGjc+9Zu3Ol?=
 =?us-ascii?Q?1Qf4KFGxRFwO3zw71UjycEaVSxwxEjpvMOgbOOH23OiFtKefHawzznTpajng?=
 =?us-ascii?Q?dUZUKIlS4S7JZnz9BOUDZSDrS07N4IaaIvsNvRmF6VL6aqrPJ26JWy/T87yz?=
 =?us-ascii?Q?hqocWoeSn8ONAgl92O/zFPldzUzvWjShazf73QNWnk2hFF0V3OAiApzNf1h2?=
 =?us-ascii?Q?K6U7DKDd+GsbitvCT0t9zl5IjuJ/tkI/qdQPHaoscwZqAKzIgL+VfmIyis7D?=
 =?us-ascii?Q?kA2XyZNg6HJoC2cJJwqJR4xemBgNq6u+LNrvjwOpRxkZp0MbXd3RV52DlucO?=
 =?us-ascii?Q?NjFlWlXC34SBXlwU7AEraHEk32yZpkHdZQAk/++CRzZtC1G0sbAc5D6kElsR?=
 =?us-ascii?Q?yihyKFP6t9hUH5jx9gw7PG7RWxXvVCoEBlMZFEvsfPJa5TSkfZJ/IYerr17x?=
 =?us-ascii?Q?iYD53P49QM0DykRL6FT7/4AI5Grds7/Gnr8lWx1+r4QsjO2ncKZZhalFO4qr?=
 =?us-ascii?Q?10bDJWGlgcsN9wCYIulQbGltRK3uMOP77uYHChU/VnWQOuheeUqMiZQW9PXs?=
 =?us-ascii?Q?rsGXX91LnI/xlhabL7Li/gJQKHW1+glEH0fFfdmVnYv7OR/V8C1c/A2m4LZy?=
 =?us-ascii?Q?uG/TSKDk+WGm5B+FdVed0Pn320a8?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9576.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?68TlGe3HfeXyEmPXcEXlBbyYGfvp0sZJCu6xSTpJeqBG1GuZ3li6edhdn7sy?=
 =?us-ascii?Q?99z0ua11HuqwLnhqJt6DB/WWgVDEtrnBzTO7B8j+zVemDafP3GvvKXy6w9Z+?=
 =?us-ascii?Q?Rm+66MMpK5eihGrUJk2pLW/YDWlHgnshbfqrFBdlARyetwQ7JSXx6h6j5aHQ?=
 =?us-ascii?Q?hen3wQk7iiH9fLYho3/YrQ4h/sdsOn0bbf0HRmdym9JfVLgnOfbxuFuUl9Bs?=
 =?us-ascii?Q?8BbvIfj3Axomia+hS97a7S2TML6jsObsZj9MLVkvDQ3qZeiGo4y73/Vba2Xf?=
 =?us-ascii?Q?7AUFbiYbdI6Y4aD1u+0ug+7WlRU7+hS70E/wjhBgq/F4HzCaoP0qaA28WFFG?=
 =?us-ascii?Q?Ml1fQGNJSbQmdzqTMyOIfTbQ4HnIiTIO+2WBPSgjxa3xXD0E047FNJL7r1IF?=
 =?us-ascii?Q?Ofuc8c8J2adQy+pJQFmigW0uZ4ZSgdewxMzHlkDodEXwefMJZoU66EPqBxV7?=
 =?us-ascii?Q?JUbRTDJKeMBOkuCnFR6xHEBeGYMmFqY/PHThvPikPQg74Hxd51CacgltH7Pp?=
 =?us-ascii?Q?uPW25xK+75TGhxpmfreEnMMJ38oStwexxde/L5uwYfgbDIbonraIpLhbOuro?=
 =?us-ascii?Q?pdskS6zFAF1HEwfAWTjVNQ0XU4KKV96aH/P1pdyCA5rcOkSvtnU19PfG0+zO?=
 =?us-ascii?Q?x9/OrlWN21xEI2D/iGoevcDV94JDvfHmcteWufm360WybnKZjkrkul7tqXLs?=
 =?us-ascii?Q?PNbHqHcKOmNbgyrXjWbGekrnJD44B6cnOjzp3Roj3ghEdNEsxdBLrfNUGJCr?=
 =?us-ascii?Q?+YRvR5+tRl5fqkYFwWTZ4V+wdhMl684MPNrXvXkx46gfK2XqR1PGT1ZaCQ2j?=
 =?us-ascii?Q?lxNepxVbmyXq9DcWSYEq5reaXOJZQ3MbRCjf9ajN5VRpsOuNbHjdtK7ZNnQZ?=
 =?us-ascii?Q?zUESFQbSyVu/QPlhxq5/TfX/oMh6Ge+7GqTExgEq6HihXMxKCjoFs444V4D+?=
 =?us-ascii?Q?5KVjMirF9yAipEcrGnCfrtT8N/IQnr5LzG+0aGSVHR+VbVUzQDLK5+qFNaCP?=
 =?us-ascii?Q?GqKODaUi2AuCoeoC1F7E/Si+TjgtigL/6B+ab6UYXm/9MQKxHB00PBvlCXhq?=
 =?us-ascii?Q?r7r1WtJ1u2GglH+ptueJRWyahrfFeAa/PdIN4HhI3hc1K6iJzNfFQvnApedL?=
 =?us-ascii?Q?ZnsKKy5aP/VHjBfYutu0HwYnP9S326+Gl7Ugbp+VfhXmZ8ziWWTmWH1RXQPr?=
 =?us-ascii?Q?euCAqvulpV42sks+Z2h6af34RLdo8SufoDevPaSVbh1YkVuSCtkjiySdPaA0?=
 =?us-ascii?Q?pY5aP2JoOQKd5SNf4Oz//GV2hshC3gOjtNCxjU4U1Q452bysXh+zRCcBpiZw?=
 =?us-ascii?Q?CuvjSduhab0oQBpD9XRTd9IFvzvR8ahdWC6bgwDOigAkDHBbHY7erTsI8QVu?=
 =?us-ascii?Q?lg8xOvYB2D7t94Yyv65iu6aNEos34inBvfvrwE2mlkn87VKiSL0VVNOdDQOm?=
 =?us-ascii?Q?PkJRhcH8kw6UU5Eq84tr6DGjnvjr90A1+nNuCj5qljYdmXWI5RxKOOKETBNW?=
 =?us-ascii?Q?53UpXQIoIXQDL2gfq8dNKKXX3Neo6namtthyUtaeUg0Lm45oS/Nhehku0ObQ?=
 =?us-ascii?Q?fLz8N8cTGDlvOdN35n0v1tK8WZzFDh/XI/+XVsU056u4CkDJOpt4JOgtIlSm?=
 =?us-ascii?Q?DQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c50ebcdc-0a31-483e-0fdc-08dd42152182
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 16:34:28.2555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wYmehKpVO1UR92y0NaaDqC8+Cf3jUqT/ZTQZlGh30IWZB5ajwv6rqCJwJRnBdY4tmcoOewwmED4xXo7vT95Dcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8529

From: Sakari Ailus <sakari.ailus@linux.intel.com>

Internal source pads will be used as routing endpoints in V4L2
[GS]_ROUTING IOCTLs, to indicate that the stream begins in the entity.
Internal source pads are pads that have both SINK and INTERNAL flags set.

Also prevent creating links to pads that have been flagged as internal and
initialising SOURCE pads with INTERNAL flag set.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../userspace-api/media/mediactl/media-types.rst       |  8 ++++++++
 drivers/media/mc/mc-entity.c                           | 10 ++++++++--
 include/uapi/linux/media.h                             |  1 +
 3 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/Documentation/userspace-api/media/mediactl/media-types.rst b/Documentation/userspace-api/media/mediactl/media-types.rst
index 6332e8395263b..f55ef055bcf85 100644
--- a/Documentation/userspace-api/media/mediactl/media-types.rst
+++ b/Documentation/userspace-api/media/mediactl/media-types.rst
@@ -361,6 +361,7 @@ Types and flags used to represent the media graph elements
 .. _MEDIA-PAD-FL-SINK:
 .. _MEDIA-PAD-FL-SOURCE:
 .. _MEDIA-PAD-FL-MUST-CONNECT:
+.. _MEDIA-PAD-FL-INTERNAL:
 
 .. flat-table:: Media pad flags
     :header-rows:  0
@@ -381,6 +382,13 @@ Types and flags used to represent the media graph elements
 	  enabled links even when this flag isn't set; the absence of the flag
 	  doesn't imply there is none.
 
+    *  -  ``MEDIA_PAD_FL_INTERNAL``
+       -  The internal flag indicates an internal pad that has no external
+	  connections. Such a pad shall not be connected with a link.
+
+	  The internal flag may currently be present only in a source pad where
+	  it indicates that the :ref:``stream <media-glossary-stream>``
+	  originates from within the entity.
 
 One and only one of ``MEDIA_PAD_FL_SINK`` and ``MEDIA_PAD_FL_SOURCE``
 must be set for every pad.
diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 0455909055820..d1feacc608072 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -213,7 +213,9 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
 		iter->index = i++;
 
 		if (hweight32(iter->flags & (MEDIA_PAD_FL_SINK |
-					     MEDIA_PAD_FL_SOURCE)) != 1) {
+					     MEDIA_PAD_FL_SOURCE)) != 1 ||
+		    (iter->flags & MEDIA_PAD_FL_INTERNAL &&
+		     !(iter->flags & MEDIA_PAD_FL_SINK))) {
 			ret = -EINVAL;
 			break;
 		}
@@ -1118,7 +1120,8 @@ int media_get_pad_index(struct media_entity *entity, u32 pad_type,
 
 	for (i = 0; i < entity->num_pads; i++) {
 		if ((entity->pads[i].flags &
-		     (MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_SOURCE)) != pad_type)
+		     (MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_SOURCE |
+		      MEDIA_PAD_FL_INTERNAL)) != pad_type)
 			continue;
 
 		if (entity->pads[i].sig_type == sig_type)
@@ -1148,6 +1151,9 @@ media_create_pad_link(struct media_entity *source, u16 source_pad,
 		return -EINVAL;
 	if (WARN_ON(!(sink->pads[sink_pad].flags & MEDIA_PAD_FL_SINK)))
 		return -EINVAL;
+	if (WARN_ON(source->pads[source_pad].flags & MEDIA_PAD_FL_INTERNAL) ||
+	    WARN_ON(sink->pads[sink_pad].flags & MEDIA_PAD_FL_INTERNAL))
+		return -EINVAL;
 
 	link = media_add_link(&source->links);
 	if (link == NULL)
diff --git a/include/uapi/linux/media.h b/include/uapi/linux/media.h
index 1c80b1d6bbaf3..80cfd12a43fc1 100644
--- a/include/uapi/linux/media.h
+++ b/include/uapi/linux/media.h
@@ -208,6 +208,7 @@ struct media_entity_desc {
 #define MEDIA_PAD_FL_SINK			(1U << 0)
 #define MEDIA_PAD_FL_SOURCE			(1U << 1)
 #define MEDIA_PAD_FL_MUST_CONNECT		(1U << 2)
+#define MEDIA_PAD_FL_INTERNAL			(1U << 3)
 
 struct media_pad_desc {
 	__u32 entity;		/* entity ID */
-- 
2.44.1


