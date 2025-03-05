Return-Path: <linux-media+bounces-27608-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B73A4FDD3
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 12:39:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 57B247A5FCB
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 11:37:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57C7123ED7B;
	Wed,  5 Mar 2025 11:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="hh9ogRET"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011063.outbound.protection.outlook.com [52.101.65.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0487235BE4;
	Wed,  5 Mar 2025 11:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741174722; cv=fail; b=L7plCDwoJ7P0k0SSb4C2kRewl+kSty+YgDekgGs7hg6pNtMg93D/Op2mO7cHJyXXMowkr+JX0sCnvqV1nHQClWdNRE2MjHD1+aOlr+9itjx50Z/OBv0R60s9pzO53PJ314CJba5GICDfd1lyt1FLw6c8+EjzbBgaGSBhR3d1XTo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741174722; c=relaxed/simple;
	bh=zrZJE1SQwUV8YIDym7vMruuUPOPAdciS04ObPbl7GKQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Zo0G0dJn1itCywtC6V7VYaF2z/2i1jNBOaTeVSz6RSuYUo/04rM/g2Llx+xAW5NEf9LH+OchUtJuA/NzIF9GTuoey5TpxiH2CGeiTESxv9oaO28Z3QBghbKY9auaHkfiL04XSFYUXHMwo+N1Onp5FyF0P/l5G2S127vK1vhhne4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=hh9ogRET; arc=fail smtp.client-ip=52.101.65.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZPfSATkrTUhJhVk+S8aNXKEttf0BMheXMabhfkwWvRSzqGMftyECIzSFfxL0/6aUPQPoyFMN+PhLmV8JGjwR1LnTgyazVFFg0K/Heg+UEmgHkGz6XiYXlHfaT+j/izXK9pLEmd1ZqFqWK7InlLeEjBvzqCz2DJoEQm1dELBb5KlAEzgfk1DR/Y881hsREhlgMQKQkwRkjtassC4moCk1qvVE28snD0hCVnf+2prVs0V1P7+0sTB8r1HyNimgqh5iYF/4S4H2/HkLDiJFuj9eq8B829TBTNJk2BuyOAXTYqZAYPN4KX1CXtqjMo9wo9HJo1Bh5UqH1hqIrEdmIMinkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ON3V7YtH/qR1tqarWspQ7zeUE8pqKgUK7jAGyBfOzfo=;
 b=QyqNUhNB5dbu/ZB8j2eiMe5qlR97Xp5+J49FL0TvK1Ckk70x+wm6Wb8Q3MuTy3M9KmZxqwxgrXhBgjuKxMGNGLQ14joTkR+mXeg1VNi0p2D+UI33y8M03AMWRzRPVYbXYUmF8L+OKzB5hrPt4NrG9gpPThahpxxHeiC6y+AISSFWZs+taZF4SiwszkR7C0/qWcxaIUls+OgEk8G6HQSw8tVtZE/kN4n4pF0yYPcKhOmdspE9UMhzGDk6tiZL7qu2v80Dcyz96eHt+/+6IjiFuxGaYygDpxiwoj5D59ScLobvghIuz4G0fQs/uhaimF3cT7xQ7fSKXhEA4U8RHkkW6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ON3V7YtH/qR1tqarWspQ7zeUE8pqKgUK7jAGyBfOzfo=;
 b=hh9ogRETXqbBY0zVwD7JtlMRBt5Tz2pVOrgyaHFW98wLamDThlJqIuPSH4ZRScrToGmjHKgoe1nPmqNcafAV3z5icY9hkE/AHMOGPWwwvfHFDOm/V03byrsKJzmuwkQ/zpQJsioc8iSm7gqsNG8qEQkKnCqHQRnAIk7Z+uSa2uineQ44ESjFSFLXH1xN7KBzQEBC5/4DdWPM6GxCVdA6rrTx7O3F+r8eXqQ7kriGvxqpSNoHxysTo4FpAH3YOf9CriZTt9Ck3UfbwTox4oXLhaYj/SzzvB1YueF5CBBd6bdxhdcv0Kb4V3Hv+zEH2RD3DAClg3QbjiGJ80F7hERnrA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com (2603:10a6:10:53a::11)
 by VI1PR03MB6574.eurprd03.prod.outlook.com (2603:10a6:800:17f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Wed, 5 Mar
 2025 11:38:38 +0000
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf]) by DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf%7]) with mapi id 15.20.8511.015; Wed, 5 Mar 2025
 11:38:38 +0000
From: Mathis Foerst <mathis.foerst@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Mathis Foerst <mathis.foerst@mt.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	manuel.traut@mt.com,
	mathis.foerst@zuehlke.com
Subject: [PATCH v1 1/1] media: imx: csi: Parse link configuration from fw_node
Date: Wed,  5 Mar 2025 12:38:02 +0100
Message-Id: <20250305113802.897087-2-mathis.foerst@mt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250305113802.897087-1-mathis.foerst@mt.com>
References: <20250305113802.897087-1-mathis.foerst@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0195.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:44::11) To DBBPR03MB10396.eurprd03.prod.outlook.com
 (2603:10a6:10:53a::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB10396:EE_|VI1PR03MB6574:EE_
X-MS-Office365-Filtering-Correlation-Id: 70779bdb-1e49-49a0-bfce-08dd5bda4562
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YtFZQUlrg/mOQx+iFsH/w7qtupRqhSEMDrmpYbbFOzMP1QW/kbe14qqtbkgi?=
 =?us-ascii?Q?6qcZHNmJlSlJyTOMY6sGR6uyhTuXuQwXP2Y9B27d3/9c4BRSL0G3hTlGU7S3?=
 =?us-ascii?Q?v4BtVpF/aUoCbWJVPnejrEmBxl5Ol76yEwhmQWgSxD+ApzDenwXiAt3jdy84?=
 =?us-ascii?Q?4N3l9w3Hrh08xs4w0Uk4Fo/6GAu0Ka25y8MsUFy0hQNT/UCUe70t9sX8x/vm?=
 =?us-ascii?Q?v2UZnkB4EmupKglJMv8bGcnO4LB7xHDejoYwvRI1/lSWPQdesq6S78ZmF/Ba?=
 =?us-ascii?Q?TodrvuzKqeTouLsVpkfN434NQr+gRa6wSvLkpkwj0lMdWsHUOCenj6O3yMUE?=
 =?us-ascii?Q?wgm6Y8r88rW3d4YzBs3WuvX9aKpxM4h8iR3iUiY1tNAeleC27E85P+f6SUJr?=
 =?us-ascii?Q?MqtvI5DL77eAZjnpa+rXNpLwNWoicHsvSsrJiWtieqyfw2s36E0QeaW8OXqt?=
 =?us-ascii?Q?dh1HXUD3FCMy77oPLZivHMN/yLHNO7xY/PFWLmsbHYxkG60gYurd3twXHVgL?=
 =?us-ascii?Q?I40OIsbulQRmqJfyYv4kSYvAsgQJntnedB8sSkKu6SfaoczLC8dgtw/W1Aaa?=
 =?us-ascii?Q?1iYzWfVh6epHXHgo/3mTs/fk+6aWW08kJO1dNcwC7nMP/SAl2YWdFp4LkG0m?=
 =?us-ascii?Q?eJrxeCj0MFLTCxgNAynEkU93o9D4hvoorFpJDhf+7qLYegYLPaZWt79Blv/Q?=
 =?us-ascii?Q?H3bcAOZb2Ekw2mih8r3JxLIBz4ggfMj/Zr0wj/CL5rXpmghuQ64ZSE2BIaXf?=
 =?us-ascii?Q?RmJXD5i7ngjUM5T15ivE1p3aYHPMLosIx0q+fwOuJ3COhjQ5Zdy5UAJBg1KA?=
 =?us-ascii?Q?AuR+Hyj1l6DL15jvgP1dvtQXzgvKHcYBcPTM5SkGy0q6CRDIzTqyrqcSmzny?=
 =?us-ascii?Q?XGgaY+nXXjN92y+ogdVyBGN5vfwVTq1iy6d/8/YC/Co7PL9XmEdFba5Ehg/p?=
 =?us-ascii?Q?6gFWzDfu0h+/8IuO/rzC04MIV8U+QiyQmSqRJA0qPcN0Qg6EYF6+s8nRzcKz?=
 =?us-ascii?Q?PJNhW9KOFzSTYpW7feyty9X5oBUELP/HS4ilDEID3fVtiWtlbMqriJih3fgN?=
 =?us-ascii?Q?rNfkqes9gQCv95sopXnsUHdH8OHbsrayqiUcllnlhl9AkPduYor6TyfTYODf?=
 =?us-ascii?Q?JXNyCTXpjHs7+HIpksSJgxMcIPLtt3KKCpOE1UEEe98V4BkhqMmQGdqdH717?=
 =?us-ascii?Q?LiHNR6DUibNSFyqUNUESM4avHQskc5pGgNl6AsrxubvXJ3zQwJvJAISlvznE?=
 =?us-ascii?Q?ZAGSsQamqnybz3JkhgzFwqLQH85W3qDGd39yvTuPj+shCjqs+HxXecZg1MZP?=
 =?us-ascii?Q?1Aan2a+TTB3UmjJZ7FVyVp9vf6JgM8dmAAiK774VeXZfwwkOPNhHswMK1N19?=
 =?us-ascii?Q?HSXpTQdIBN4nRytfUr8rMZs1+b4TVQIZ98ZR/2Ui6GiHT6YEu4hrlthIYmmo?=
 =?us-ascii?Q?KRIVe+ohszPLNSMarzJzAjNmXDCSIeQ9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB10396.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YJ+rZTHwIzYuMI/a3Fxo9FwWXcG2iMvlCkSwURWK54hB+ZxQD1JTMjUcDABj?=
 =?us-ascii?Q?f0n8tv+UHQM3x9OqjF3+89dP/PW4SxL5yFd2alU5t/5T6FmhmrcAzcxLs9Mv?=
 =?us-ascii?Q?hB+NiD0haBjOfMVa3wy4lfI09V0SmvSCC41+/AhiTT48cjWNMakfPTAqHt/x?=
 =?us-ascii?Q?73Go0VEuxiHuxc5LjiiJDeLOAbhf9nzb8tZ1U8xblDaOxOE0V+LRZzakK1P2?=
 =?us-ascii?Q?0PyTlBeVEfxscek6dYteM1RS0OurDK4/Fr15aICOOYHlj3yVqtXoSBLclVHE?=
 =?us-ascii?Q?9hXWzDT8h1jYr8nCzNTLMryg834OjrFMEWPN9vF8NVM0QQb0sve1YIEm7J/l?=
 =?us-ascii?Q?qy9k+85qAPDkiCoqrPwkt+XRMLxOt7J1YuitJ6mo8pE4ntHgqAzuJqCkhD+d?=
 =?us-ascii?Q?pyfEGd5CDKyQFDVpnjI5YbSTdbSysxgpH62rjaBKmnVCwtlqwIX+ugAFke9H?=
 =?us-ascii?Q?NAUB/LAMdzP9hQVIiZpIGCgtIA1kmFV+o2asm9kPyQvccf3k6JFHFqEZGVpj?=
 =?us-ascii?Q?Lt8G4NnAY8bXy5rH5xk4UmJUPpe4Q9M1N9FXI/A0qR36ScCUF2Kc/w/zDuh/?=
 =?us-ascii?Q?/DGbWm+y4JtitZsaIM5cl6Al4Eo20XCtvyhXQ9y57jqOMlk+GhmakAK1+pg6?=
 =?us-ascii?Q?PChkV3YwB9pTv4UpSD+ZkKqBFZ3uwxN4ABkHYfNLbF+Hr8squUEfOU3pUbiD?=
 =?us-ascii?Q?laCm3RsnlD/+p64G5fqTXwGnIFLSZDJi83huz6Dp27i/Dq/+C3/QkhdYraKI?=
 =?us-ascii?Q?oLCPjGYqPueLIWT5JB8Zis6nza7jdGYxNtBcmR1mu5hKTYqu1FseJFKsVbRf?=
 =?us-ascii?Q?R2FFh84pXuMX+nv8R4TYNKNOGBpvmgv13tl5hml/Yvnl/1K/QaCjU4CiROpp?=
 =?us-ascii?Q?HAQuVdaC1tZIQ44aJnqKFfITaRG0c+OqTRPE8IU/l0Iwk1Fze8XXzQqkgqiX?=
 =?us-ascii?Q?f6H+i31C8FvN9qiTgCWRTJ3DVKTawKUlDpaSolv3Pxe6283Flt0d7yTV0BuA?=
 =?us-ascii?Q?t1iooeIGNYoY1QCgRTf8TTj6KGuEu6nKwbPYLOnWYSQH6690HxDkvHvccueU?=
 =?us-ascii?Q?Hj3ExwaEdlvbEYiXIYOa5j1ZMCe7ZcwLmg8rx8sN9eUfikDLqXPU5FojOw/L?=
 =?us-ascii?Q?6nJrnfGATG8sPzR0gh0PmgHuWR41xCNBTdnXYL0p9sMVshuhY4LQ7b2ufepp?=
 =?us-ascii?Q?AA/3Vl62R97Y8RVlshd0jAq3WpFq796QdoUgiry7KzTgiqDAheh3RsWf4ai4?=
 =?us-ascii?Q?pjmjZxiUqqUx4iexWiWoHjFPs5FpplATAVDKxHRz5ZUD98XLZHQeEvLB4Gfm?=
 =?us-ascii?Q?opmAvt1CIq6AnSP09FGri4Y1N9HtyPTcmRyYaNe8i+NolWqlDb0aa4evDF5B?=
 =?us-ascii?Q?rGIzNPWsUdVcF6CGRbPsoqNJmddqc8yg8Es3DQlMhEOKn+tbBqDZYrCnf2Il?=
 =?us-ascii?Q?TcKcQjNry8KzY1EMooT1LgZTHJY0kBQ7BrxeM4DgRTMqAgQd5YgCpUtEkuu/?=
 =?us-ascii?Q?Gr+RVdDHuFaqihIJNXpTq901tvNUj14Fg7XS8yKwFfC60BK9MYC9tAo0/eDO?=
 =?us-ascii?Q?RSc4iyyurZnZO9D5gQt3goUIDJ6Iu7zG/wbwc8LY?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70779bdb-1e49-49a0-bfce-08dd5bda4562
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB10396.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 11:38:38.3072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ylKkhgYGfM862H7ivK+CaREFCZCcPoBOD909QSpEEvv+EXHTgQPO+1Kd5RKTaflzc30a8RBPzlgh1YHvfCgGJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6574

The imx-media-csi driver requires upstream camera drivers to implement
the subdev-pad-op "get_mbus_config" [0]. Camera drivers that don't
implement this function are not usable on the i.MX6.

The docs for get_mbus_config [1] say:
@get_mbus_config: get the media bus configuration of a remote sub-device.
            The media bus configuration is usually retrieved from the
            firmware interface at sub-device probe time, immediately
            applied to the hardware and eventually adjusted by the
            driver.

Currently, the imx-media-csi driver is not incorporating the information
from the firmware interface and therefore relies on the implementation of
get_mbus_config by the camera driver.

To be compatible with camera drivers not implementing get_mbus_config
(which is the usual case), use the bus information from the fw interface:

The camera does not necessarily has a direct media bus link to the CSI as
the video-mux and/or the MIPI CSI-2 receiver of the i.MX6 might be in
between them on the media pipeline.
The CSI driver already implements the functionality to find the connected
camera sub-device to call get_mbus_config on it.

At this point the driver is modified as follows:
In the case that get_mbus_config is not implemented by the upstream
camera, try to get its endpoint configuration from the firmware interface
usign v4l2_fwnode_endpoint_parse.
For the supported mbus_types (V4L2_MBUS_PARALLEL, V4L2_MBUS_BT656 and
V4L2_MBUS_CSI2_DPHY), extract the mbus_config from the endpoint
configuration.
For all other mbus_types, return an error.

Note that parsing the mbus_config from the fw interface is not done during
probing because the camera that's connected to the CSI can change based on
the selected input of the video-mux at runtime.

[0] drivers/staging/media/imx/imx-media-csi.c - line 211..216
[1] include/media/v4l2-subdev.h - line 814

Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
---
 drivers/staging/media/imx/imx-media-csi.c | 36 ++++++++++++++++++++---
 1 file changed, 32 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index 3edbc57be2ca..394a9321a10b 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -169,6 +169,8 @@ static int csi_get_upstream_mbus_config(struct csi_priv *priv,
 {
 	struct v4l2_subdev *sd, *remote_sd;
 	struct media_pad *remote_pad;
+	struct fwnode_handle *ep_node;
+	struct v4l2_fwnode_endpoint ep = { .bus_type = 0 };
 	int ret;
 
 	if (!priv->src_sd)
@@ -210,11 +212,37 @@ static int csi_get_upstream_mbus_config(struct csi_priv *priv,
 
 	ret = v4l2_subdev_call(remote_sd, pad, get_mbus_config,
 			       remote_pad->index, mbus_cfg);
-	if (ret == -ENOIOCTLCMD)
-		v4l2_err(&priv->sd,
-			 "entity %s does not implement get_mbus_config()\n",
-			 remote_pad->entity->name);
+	if (ret == -ENOIOCTLCMD) {
+		/*
+		 * If the upstream sd does not implement get_mbus_config,
+		 * try to parse the link configuration from its fw_node
+		 */
+		ep_node = fwnode_graph_get_endpoint_by_id(dev_fwnode(remote_sd->dev),
+							  0, 0,
+							  FWNODE_GRAPH_ENDPOINT_NEXT);
+		if (!ep_node)
+			return -ENOTCONN;
+
+		ret = v4l2_fwnode_endpoint_parse(ep_node, &ep);
+		fwnode_handle_put(ep_node);
+		if (ret)
+			return ret;
 
+		mbus_cfg->type = ep.bus_type;
+		switch (ep.bus_type) {
+		case V4L2_MBUS_PARALLEL:
+		case V4L2_MBUS_BT656:
+			mbus_cfg->bus.parallel = ep.bus.parallel;
+			break;
+		case V4L2_MBUS_CSI2_DPHY:
+			mbus_cfg->bus.mipi_csi2 = ep.bus.mipi_csi2;
+			break;
+		default:
+			v4l2_err(&priv->sd, "Unsupported mbus_type: %i\n",
+				 ep.bus_type);
+			return -EINVAL;
+		}
+	}
 	return ret;
 }
 
-- 
2.34.1


