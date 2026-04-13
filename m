Return-Path: <linux-media+bounces-58678-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cF9TBf0U3WkOZQkAu9opvQ
	(envelope-from <linux-media+bounces-58678-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 18:08:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0435E3EE5B5
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 18:08:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C5379302E1AF
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 16:05:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A9732DECD3;
	Mon, 13 Apr 2026 16:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="IHHKclQ+"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010041.outbound.protection.outlook.com [52.101.69.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57C7277C88;
	Mon, 13 Apr 2026 16:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776096290; cv=fail; b=paUqR7viFX+L4wP7DuTgHIYqAe72tdo7QNsrIS4OIPPOfQu3e6XUzVyxSDSJnjC8J8IUe9eicKQ6pA4Otx6h4P/o8DFvFY1TCnyAwQf3oeQVYBFQJoKf16wd9qup54iNj3ZYbom9tvCx8SFqJtjInVbKcW50Ei+EZfihA+gic5k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776096290; c=relaxed/simple;
	bh=s7rqWGs6o8gU6Pk2RMkPpN29LXQev/0SwIqG3OE1QJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lbR5CMHSqpC2+UJM6dkfaaXreCeeNReE8keoOzK6R3jb/U6SmYCASE+2tufwAva2LBwYEzbF9/9UqGoBu+vGYmyW615I9g5mlH39vtVyjR78UYoT+rpDuulG2kCG8dOaRP8QSWMlYviPxEsWsQqVHWdoXyA9wUNzZ8a1zPjwDzM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=IHHKclQ+; arc=fail smtp.client-ip=52.101.69.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ybWx3bJEgV616yLR2ixOU+4o4ho4HR/ycFyRfvjSDKeTJIL0T6JCvSh9ZUhYrUEcSQz0pbswW6QvqP5SO1Wd7X+3yMujaTqp5XD45LRzJpIZXxZVTcDG8OwVclt2ovF1rB77OHu/wyS03YarLVNrC3Y65R7+eKgCMVshtemYuHBQIkMB1P2P/Yls8/QcjRCHYPRm4/X9WkmAokex0Wis/sWeaA7XW6TLpW8GEc7FbiDeLno2sKeObjVb/oMXiX72bLxnW1bMPtA6cLnM8Ghtp8mcHC3WnfMQBus0jz/EXsMlzngJE1A3PvU4CUwmJ2vmtyMJNHzKiwQq4grQ5mnsDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nEjswgM9Z0p5aowbYCrN5F99HQtvecZrlhXCHLNXNRs=;
 b=r4IVkOw/UMCpdq8NzLZSFHF6NOVUlyh/4J43IoZb5hHRIg2FKncmCRa58Bhevk+eKlF3wwbrdAyIIti+O+7bx9QUgN4R6RPg9aXH2X6Poml+U8ukBmsG8DkksqVLINMKQYP3ZBhCrqLf6dHk+5Gvzj8fKHFZ8IYTLtpQjEd1qm9wMZ1UVunbTSoF5F4KdAOgkkgHJBkAzose1Ziqk8prhhRW7SrgQ7PvB9lTk7k+ZVU/HOwXCWQ8J4ZRNHdCG+2YaZorVIH+0JLM+SWVS+9SBHBuhHW7In7BJmFSXmDlxWZoG65jGo8Iiziq9BbRM4scL38bAZicJBzQICRx+dOxPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nEjswgM9Z0p5aowbYCrN5F99HQtvecZrlhXCHLNXNRs=;
 b=IHHKclQ+7xopPs33g8k5QOl6KugslpS7mB7sobyvbK/EJOoYk1JVCiM8s5jgJOrs7sSq/eaTt6sgT6U4ZO6HZwxuLpsKsBDhGvjQzHeRiSVvxaX942G6QIBS6qH2BFvrrXaZPZMZyN7hysGR7rClft7WO40hCu/O/8Dx3wkKDp27+yX5jazJxt8g0bFCzjZ+vq5NYVjPoO4cNEDx3Xv4uC09BMmAFpTDCgJ5kJwct44oYpj2Emk40rs7BrE3YMC3ci50OJnRv5HAMquFuHmTZurfw6mGDxbuXit+bue76uZHCgnRpypEy2T0OgWOtECBxDpxrbkpY2QTtZXIeVT9eQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16) by MIYPR04MB12599.eurprd04.prod.outlook.com
 (2603:10a6:290:7b::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 16:04:39 +0000
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989]) by PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989%4]) with mapi id 15.20.9769.046; Mon, 13 Apr 2026
 16:04:39 +0000
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
	Antoine Bouyer <antoine.bouyer@nxp.com>
Subject: [PATCH v1 07/11] media: Add meta formats supported by NXP neoisp driver
Date: Mon, 13 Apr 2026 18:03:27 +0200
Message-ID: <20260413160331.2611829-8-antoine.bouyer@nxp.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260413160331.2611829-1-antoine.bouyer@nxp.com>
References: <20260413160331.2611829-1-antoine.bouyer@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P189CA0012.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d7::15) To PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR04MB11910:EE_|MIYPR04MB12599:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c6b88e5-918f-4b4f-09d3-08de99765da1
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|366016|1800799024|7416014|52116014|376014|38350700014|921020|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 C4ifNc8B4SRnSHe5r8vKXgCMfwE1Jofr1YKFXZ76KUg62FFwDVAyfCvsSGdEJVMPVxABHEIZvKQliXNfib1a2gi8Aw35mJfw1UO44xwiM+uNGtEstTLJnHfSaBx+AndD7dnm6Acuf4yRAHacMZ1FlmJOKdofpyH1X12rtYKrV6TjC8bU1u0OvSXl8KiO1jjeNr4QW7xWclqiMTAl7/6tu95L6S7qy9IjCyud8ToSwVoSenAvzJoT/oHrVC8ojEQlkF29wyy2zkg8biwzK21FMz9n+ER98DtnhR6SY6xozkZJ0ebTALQ3QEaOnHPbu5lFLKmtb9SMPw8kBq1mY9izbZFm3l1LFn8VBi6sNNPawnUVlEniY8AKrmqpp4r1n/YwPlMeagRerpYCr36ek7ECJsyhsZiYPfU32z0DekYebh28wZ7jEEA3pinPJjTQR3fuV5wr9GAbkyKz8chrXVpCyjXeB0rhkvffVXXAbyboDnKr+nwfpEe0SNv4fNLRnfFLVhfbwUdbX+b/AY6N1wwBGc21rJPJfxfrpTa78GKxi9I6qkT5ZdJo6U66TmsKJ/nYXLJAmPzsK65eX472AjnF/EjFE/QuYasBU/LsRr0kYbBRvTZs2dydJBY1mF+tIF3kI4FrMNUC5JnHIXd/9rtEmiiuettG+uBC/X74GYdwWUvDFQPixc8Gca3ByklXNpfQMl4oFEm5jGXuhwf0FVOXgq2mIykeI+uWkkTW81JPxCiZ9UkoClrKC2LirDwkA+9PS2U8+7vplCKmhjcRqzQFXMmNsoBc7/Th/nlua64BOI02dfcuTwiK73lHHPR3TOXa
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11910.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(7416014)(52116014)(376014)(38350700014)(921020)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?BqxMm2R3cbZU2YexY7vYVMjHTGMl0ZMJPNZpiVwhfwcSARMfa2f5qGpELwE8?=
 =?us-ascii?Q?7FpCWK+I6bZY1gCdbKp7i8GgkWzQk97i+C4tghk1zHoEnXTg+c8q4Kxk8taB?=
 =?us-ascii?Q?GCUT79n7ehYKMUuEb4KElUrmCmZXueA7OonmUscwfvnoEGHKjsrvacbV00kc?=
 =?us-ascii?Q?mpksuf+9HSltPfpGYfD1lOSCk284TPIQMK9FxywaVk25WP7BCIx1WBXXNgRr?=
 =?us-ascii?Q?oroo0Pbn32DLn7o6n56efJ8xAPy2fIjWGUdHYOQa1vz/vDbQnm3E8dgJGrMy?=
 =?us-ascii?Q?RAHUfWsd0vEucS7NQefXnA7Z0DSB0Nu+cVUhC7BzU9ly+oEfNDmfZopFncRX?=
 =?us-ascii?Q?ANyeGyeOnfmHrcixr6BTVRJ6HN1GtATtPmfhj8y2wVlI6PqaX5nWAzmvp+vt?=
 =?us-ascii?Q?bfRFldYLvMRDw8J1UxE6p9HcsSNVpjSbI5acTxh8JmaaOE4nhkm7JkH/UhnZ?=
 =?us-ascii?Q?jzvFpJyWvkZKRa1cOKUxRmWGIATrdBaEY+wEhl5xJBvZb9GHotqc2LvsvVCZ?=
 =?us-ascii?Q?JeyNkvKt484PrFINUMh3CgxM7FQGPn6t0EDJdFNmZJZnb6lmRV31dTkyJEei?=
 =?us-ascii?Q?mkN3BCfMbqnl5ULhMhNt+8jty81JUIqtNpBlL/x72ZoVvT6ZrRKgU60JHZH1?=
 =?us-ascii?Q?gvV9hpzdbcOt0KjK30pUhPONTyF9yXIKjKl8rk5eir+8f1/+/Ma6uIUAhjJo?=
 =?us-ascii?Q?vKUy14dNakUXrOP5JCHW1YEVOC6xggML9QhXzby7EfugDjMfc47/mKeCZx1v?=
 =?us-ascii?Q?bvlLnTE3n+QIcXMDgppUTVNK+YIb5H2bfKqCVG7QM/YWUAbBDv8BbMzFJnKZ?=
 =?us-ascii?Q?8PjfTBn/T6fjRyWI0YAbpDdHFs2YX3H7RSr+w41TdtmpuIcPhVsTU8dY9D4w?=
 =?us-ascii?Q?sxFfVxDROse2/XpAI2mAa6XxPOD5wjIw9QSGTXPilWz9QFabpKTS4K9ViHgb?=
 =?us-ascii?Q?ZZ/wgRwpN+nMIuhjueucrJDr0Q+Z2JSZ9g5yL0a8Qau+YZi7uKR5lQbPYd4G?=
 =?us-ascii?Q?ZiCMS6TeYnIy/1TsMcJ0HvEgFdw4vVswgDEfCROjfKLThKVuVVPdW2n4B1zY?=
 =?us-ascii?Q?rHu6bBRH/hq5EYPWwd/gWcFo0a7EXAu5yGh+RnHQn5ixZE3VSyLCR/fibHZx?=
 =?us-ascii?Q?Tv6GxylD6zrOWqhYDmjLzGKvXD1E0qkJNJBc8S9id1LzYrMyb8LhzBjs5by1?=
 =?us-ascii?Q?9HrOmHioJm4VPFJGK3MtrP+i/k5eToYSCr8Q7m0kqBO6GDfL/P32c+44+OiQ?=
 =?us-ascii?Q?E3HDfwrkAh+PwSK9zujUbMdbIxBWSaxiIsoRJQkEtvdgsAcrvkTDmqtF0JTX?=
 =?us-ascii?Q?mjl/DesBt+LPw19ApfobPwJVrxU5j5vllY4q+yNagl5Ev5YJ5VFV0fyQbXRC?=
 =?us-ascii?Q?eC/1cNvGNjEhNGpe6e9SwZO/B1faEnKIcJNLxwE8EzKMczwb6jVnMehb2eMt?=
 =?us-ascii?Q?13Sh0oIu7O/FX54T6WIkzSIy7Fr8NwwOEZ202WPJpU9IJsjC6vML5BUosfTO?=
 =?us-ascii?Q?8KRgmojJ5Ng885tfzqeE97UKFqK1lpJDBpZhJcuegbmhSmHGEpHNeTc1d8wq?=
 =?us-ascii?Q?GFLUslKA+OtzGzxKfsgiUTI6B6dM+nLda16YdKRPaoqkHOMt9etnTGYgKjMD?=
 =?us-ascii?Q?CdfQuPNAZ+m6EhhhPlmu2GR8QcAe6p5VL3NwfgpN2otj0QEKYWVvrgJjW1eu?=
 =?us-ascii?Q?p6eLC3V6meVzFnpmQeGq8gC+ut8Q3IvweVugxzZbAggvoToYvFtnCzpoci9C?=
 =?us-ascii?Q?q68W31+sWw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c6b88e5-918f-4b4f-09d3-08de99765da1
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11910.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 16:04:39.0616
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yA/A4tsfOGyNeI8f/gjGWbhU+71ykkCCSRhslBAyeJnsA69jyvLFTeo5vdJMGCjgxvBB8HFssou5x00T/0KMSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MIYPR04MB12599
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-58678-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[antoine.bouyer@nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-0.995];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,nxp.com:dkim,nxp.com:email,nxp.com:mid]
X-Rspamd-Queue-Id: 0435E3EE5B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch adds new v4l2 meta formats definitions and descriptions used by
neoisp driver for the parameters and statistics buffers:
 - `V4L2_META_FMT_NEO_ISP_EXT_PARAMS` used for the generic v4l2-isp
extensible parameters structure, supporting a non-fixed-size buffer and
changeable ISP configuration blocks.
 - `V4L2_META_FMT_NEO_ISP_EXT_STATS` used for the generic v4l2-isp
extensible statistics structure, supporting a non-fixed-size buffer
and changeable ISP statistics blocks.

Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 2 ++
 include/uapi/linux/videodev2.h       | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 37d33d4a363d..f9cd8ffdb7fd 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1471,6 +1471,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_C3ISP_STATS:		descr = "Amlogic C3 ISP Statistics"; break;
 	case V4L2_META_FMT_MALI_C55_PARAMS:	descr = "ARM Mali-C55 ISP Parameters"; break;
 	case V4L2_META_FMT_MALI_C55_STATS:	descr = "ARM Mali-C55 ISP 3A Statistics"; break;
+	case V4L2_META_FMT_NEO_ISP_EXT_PARAMS:	descr = "NXP Neo ISP ext 3A Parameters"; break;
+	case V4L2_META_FMT_NEO_ISP_EXT_STATS:	descr = "NXP Neo ISP ext 3A Statistics"; break;
 	case V4L2_PIX_FMT_NV12_8L128:	descr = "NV12 (8x128 Linear)"; break;
 	case V4L2_PIX_FMT_NV12M_8L128:	descr = "NV12M (8x128 Linear)"; break;
 	case V4L2_PIX_FMT_NV12_10BE_8L128:	descr = "10-bit NV12 (8x128 Linear, BE)"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index eda4492e40dc..e1656520b312 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -889,6 +889,10 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_MALI_C55_PARAMS	v4l2_fourcc('C', '5', '5', 'P') /* ARM Mali-C55 Parameters */
 #define V4L2_META_FMT_MALI_C55_STATS	v4l2_fourcc('C', '5', '5', 'S') /* ARM Mali-C55 3A Statistics */
 
+/* Vendor specific - used for NXP NEOISP sub-system */
+#define V4L2_META_FMT_NEO_ISP_EXT_PARAMS	v4l2_fourcc('N', 'N', 'E', 'P') /* NXP NEOISP Extensible Parameters */
+#define V4L2_META_FMT_NEO_ISP_EXT_STATS		v4l2_fourcc('N', 'N', 'E', 'S') /* NXP NEOISP Extensible Statistics */
+
 #ifdef __KERNEL__
 /*
  * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when
-- 
2.51.0


