Return-Path: <linux-media+bounces-61117-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oIuiJzvZAWqvlQEAu9opvQ
	(envelope-from <linux-media+bounces-61117-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 15:27:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E50750EDE5
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 15:27:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5F8EA302E7D1
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 13:27:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A41C3EC2DC;
	Mon, 11 May 2026 13:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="HnSQAYdl"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013045.outbound.protection.outlook.com [40.107.159.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8ED73E92AC;
	Mon, 11 May 2026 13:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778506017; cv=fail; b=I64NPXq+1zmsTqBhF9G6ZKDpla1v88xFWiToscshESsknagpPgT7cGtS6OWdNHiCJTnUyzEoKlhhQmZaVHcXAQCr/dlr7FWXaM2vg6Zmshmih/oIPnntlXsJjNQnRlEd5YBwCKiIRsvNatZrpzUgBU1Dl2p3e5a3YOLNuislNQ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778506017; c=relaxed/simple;
	bh=TwYbDSlLUlAuUXUjFtKXBciDf2Rv0ZFHbuD2/tO9Iw8=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=bQcAYoryBdyunfKs3bTWgbMz5dltdHdnn8BrdR9ACoKnqcU0gz2tZIi7shs6stLOg0yuHH4Ffj6MjToSyh9mgzYqbvCttpb0E0tAAkhqiiLqIcCKNnkm6J9MUqpYVgl1maZQnWgBLyqmuOpzVIWaLxAxWaw80WEobUjzRmKNVeQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=HnSQAYdl; arc=fail smtp.client-ip=40.107.159.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=isQASqipSJS6RBCDuFjZlj/rEK/IHV3o5Au9kQKOPc8das4g04w9wulOvIkXRu2HmW10zPLj1ZKzBa5Kg5rQ3iuROaMDmCErVNpAVosMoPnc+sDfNpqzEO3XKxk+aK1sZre27cyTce/yzFKAGQ72tHwXnmjX5Hnp2Izt2QbGMck8kkjWtv8YfBkIjY1lAfRWoQ8nF2Zyj71cbSLGP5vu5QkZTUXPnK3+LuOKT8noelVq3QH+E2m2j2SVjsw436kOX9w0NoByB7ghCLgIwdO+9GkIM0Fk6zT/cxYsyGowp3c9HQHr4DDOJKtSJDzH9UI17QEMxxzSRPR0ak0/Bb1Vlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ofEo6L54zG8kXtZdAWhrrtvz+4M4/oNXAxFrAD8uwk=;
 b=oZwVxjoTuZlZrWSPXCBSbxgETCNyTMcJjvr5fJHb3uHVqYNR1KBBibOSFZSacLnuCq0F6Y34DCU/dKa+N+GILfpyrN1r2rXZJ2ycqZthTHPGDE93KF5DGQRCBf3rI7WqHUaamfKSQq8H+nCw7+wuq5JbAAf2V7Xp3CI9CtlA6ZD64ejr0h4V+sAQNRX1+advi3+q1f8umWGRe/MZMGNn9SdlyBOsBwmj8PwGpZw5BwBXz9fizs3qlPwt7pfKcIv2We5AnEppv41qOjtNVLUjiF0/Abus+DEdwYw5UT0dwg+6nUMJuWnRaPqQmBAhtpzjcK8Ncl06+BpqckSAZcqXjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ofEo6L54zG8kXtZdAWhrrtvz+4M4/oNXAxFrAD8uwk=;
 b=HnSQAYdlYQtw26UPBm5RCpM1C/ZGOBiu0uyzGEiHaYObmrTKlJbuJI3LjRhgzGstVO/VWmI/gWgpqPLuokZlnU0dXQI4b9eY5NAe5UzZ35tmRFFwJZM3yatlZpSUge7C8GPkvcZM5oP6Fz236t8hxSfd1f58md21Z3rMSlINWcKQ0XgxQN7z+cPYDO94ZXV27DGLli3wnYt9nfokAly2JgnOfgXjMb45Y9Jo/8y6C6kP/1E5eF7qDL2XmtMIpprbosLQzG81Qi24RKW5ZGDb3BBY6zV+zBahkDHDKVxkbis62dpC+5GYavzXETSLWT1Yip+wo/CRqYr38e5FPQ3HKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16) by OSKPR04MB11416.eurprd04.prod.outlook.com
 (2603:10a6:e10:9b::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 13:26:52 +0000
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989]) by PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989%4]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 13:26:52 +0000
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
	Antoine Bouyer <antoine.bouyer@nxp.com>
Subject: [PATCH v2 0/8] media: Add iMX95 neoisp driver
Date: Mon, 11 May 2026 15:26:20 +0200
Message-ID: <20260511132629.1300868-1-antoine.bouyer@nxp.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0135.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::19) To PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR04MB11910:EE_|OSKPR04MB11416:EE_
X-MS-Office365-Filtering-Correlation-Id: dbe433d5-246f-45bc-216c-08deaf60f65a
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|366016|52116014|7416014|376014|1800799024|18002099003|11063799003|921020|38350700014|3023799003|56012099003;
X-Microsoft-Antispam-Message-Info:
 5+sKymuHGBXVH9lsq6zBoidqwVc7DV+/+RXX8ywdys4u3ARy4SfTwzNWIsRcLE26cfi0q9YKKHSrQiQ3Fq4mHHjst4m6dELE2St9j1tFGNmUHushe+d+Z6G6vXYdd/aDgwc4EnfUAWXGVia1hvJHg/2DX6SIFn65WCjQglRa6pExFgGHj7/e/CJiCIKqo/hohLTkR/naiu64U9A5EFzQjLA0Z2MpmTnYzf23OQJf68PUrT/mluIMqZCym/jI6k5KITDI5p2gbXRUJzUpkg0zG47kJQGcxWWpp5177fBFJUm3UDdrtY3bmxCRn26mLiQ0kUpnkIuZfUw5cjiynwn7xE1Td79UAmgkFba17JrkPboQBsLQG5LMSbjSKnPjXrzXEqQ78gE0qZDmiS2toVUDZlQcd6SCHIf14dLW5bYF+WtzfjaIc581mWxvOKpou2iUoElcwtPA1dkbQbLw6uDDOKLjXui1ILhVis6hUlAvcqvw7NfRpZHulHZZYeiHhLofnY20CsCfh5lCMWLi5cSJYbYMb7Wfvjs9jBKZTg9S/xNK8+PHfiqezkzwQo8ZK08apqgfP76njMm4GUJpq3RgVxlqDjJTlS5FaZ4b0JBW2GgGFvzS9bUu5tA4ZC2ZwKpcvcNorM7DAy4y+FUqIsYI7rmYPs5xeRhuo5YDggY6fK3Ujz0hX+VjY2qAwXae/eu8VQj+iIehVoepwBCAimdURoprlXLKEM2we44DsMpOaRa4z7cbQHNMAD1kinrL3iagUc4Pfs3VuvIkJxWac+fmaA==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11910.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(52116014)(7416014)(376014)(1800799024)(18002099003)(11063799003)(921020)(38350700014)(3023799003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?bR9cQ1cWqEgYthbTCjlV0EnTjaZgMiprYoQ1jr2h+rb8TSWr0AJocNvVG5ol?=
 =?us-ascii?Q?3lqyqpqi07FONXu/isNRnLBeRtDIxdAXDBwKWVU1BFbReHNtJEDEYra6AoEZ?=
 =?us-ascii?Q?p/d5IeL+3xNVPZXK6n3j5nX0TbGNtTvLe2zY3TGryC3p5kWNlx+3CdYWTApj?=
 =?us-ascii?Q?SCaSJimb0pmYd+6gAPSylYsG6Y61DLWDIkl1mcNftj9b9XcxJrPdTrSRDA+G?=
 =?us-ascii?Q?ZUU7IBFh/RHnUmYDacH4gzWs+nYjLEWUqDL+V+3VnKiio/X9/CqMnzRuNb15?=
 =?us-ascii?Q?Cjs7YMbovC0//gzk23fy+7++Ey9IVoQC7j9UAG7Gf2UCY4/c4a99Ko2+tfJf?=
 =?us-ascii?Q?4QCrsRbZOJ17driaZ7r+najx+45sa1NurgO9oz3v5TNpkWKzKXyLj4AAvyc9?=
 =?us-ascii?Q?NN6UiVjK9/FW5aC7nKkMWO+Lb/tQ4G1vvmfD6K8i6lNVb+ZzyV2R2MaD96C6?=
 =?us-ascii?Q?TvhbOQYChMdb0XtzAylgUCui5zrQRvHcKQgKPoSpkokFgorAzoSks9NMXm6u?=
 =?us-ascii?Q?iYnkRcC4AAKfnC5tg00WI+B8JyzmHhvQln+t5Ife3UUaoEG2Mxr3dw2xZkWr?=
 =?us-ascii?Q?EsiflZs3RyXw0Qm1xnamyLZW4ZAXdxyfhhMwc6jOwIw4xyXuVD93z6+k+rJZ?=
 =?us-ascii?Q?B1l1G7H/GUqzVaCtprkQQh2jYp8nUFb0C5qw3tGBUtemiiPLePE/bAIV/ojZ?=
 =?us-ascii?Q?SszRCCRjEDiFIvIyBrMRm0bZdryvX0TBAFX2XhxTLmwDdgelJCZGoU6n7SY+?=
 =?us-ascii?Q?nGhLVIDDGJk2C41DCOkVdGXv5CcL5tRI7R6VV4iwYNenVKv//3vuQXdB4Yuw?=
 =?us-ascii?Q?kQ+oLwnSNo+7yHSSnkF44S9ZR9wRuP/yWYkqLkVIMFsojMd4OmDIrKRgY08o?=
 =?us-ascii?Q?OahwJFXCRWScW9xXTGhg4+MOTaMlJBweazx6/epC523mME8EOj9z62EMbedJ?=
 =?us-ascii?Q?QnzkLtDLhaanGuP33unhD2nAMDSkuQr0EPuwRWgWqYjyZMk+8GSyqYTWtgRz?=
 =?us-ascii?Q?6SZL6cWfIIvtmhv3qV+zqBQflO5YKh3da+vHq/2rYjrGn2vXTm+CYCCK+IGr?=
 =?us-ascii?Q?aIPO2yK+PyOVGjtWLl/YeMb1rpABzMu4zD9uF/HPc4qp3hIu+TYx5Oo2oM+l?=
 =?us-ascii?Q?rURd1KuAei0B+5WE+lfjLxsh5bYtACY2gw+uiO+mLiTIBqlneFhGVKzQAiPK?=
 =?us-ascii?Q?3610q3Imz+9zCTTwPMz7oI+lQw57BB/NqF0ytgf4ruDbECN+V35U/oErh6w4?=
 =?us-ascii?Q?L7uUzH4O9TbaJ3/2CUWUgFEgc9vfrbeNszc4iVlQfKLCwOOh6O8DFWMyPgPy?=
 =?us-ascii?Q?XD5UmZaX/MZJBT+fNyOBSyHH3evW5/yV4qhqK4MV3sw+/D7fv4Hm+QXoCfxr?=
 =?us-ascii?Q?JKVNx84EmSbkGLNGLpqDwCBqZNjNhARehTL3wnd6QapohryJMcnkfYJlj6jZ?=
 =?us-ascii?Q?yGF6WKMWjLOUBsH4nLw+snx4kdIbzLkcQI89ZswsMA0DD/+Ao6UdICm8e3Vl?=
 =?us-ascii?Q?A9XXe5RZEgdPbrUhqAawaJz2Vg6hEchOaGVr6TLXs4yROxndSHPYclDez8Eo?=
 =?us-ascii?Q?HNcd8MQZh9FJk7Bmoaku5tGnYmhQc73+nhc8S1SkUt3GoAxIIIdiiz36DzyJ?=
 =?us-ascii?Q?FgWQV0faWBQOYqzudI2aY1INtRlR5bjKvGFyYf/AzTXoYTFMm3H6me7u5Ppq?=
 =?us-ascii?Q?GMVWvEB6EqFF5zny5YQ4UdswksVRSb/U866uazjhKwzviP7Y95tW3LATEpoN?=
 =?us-ascii?Q?C/rVIEZtLQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbe433d5-246f-45bc-216c-08deaf60f65a
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11910.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 13:26:51.9786
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: autIeNs31KtUJLZmtbmr55eFsrTTder9WPW3+FmjBaLuXJhnD22h6byOqwAelRE1BvWETwfheuBZH2IXU35Ipw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSKPR04MB11416
X-Rspamd-Queue-Id: 2E50750EDE5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-61117-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[antoine.bouyer@nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-0.996];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:mid,nxp.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hello

This patch series introduces the NXP Neo Image Signal Processor (ISP)
driver, used in the NXP i.MX95 SoC and future devices in the i.MX9 family.

---
Dependencies
------------
This series is based on v1 of:

  https://lore.kernel.org/linux-media/20260505-extensible-stats-v1-0-e16f326b8dad@ideasonboard.com


The reference tag I rebased all on is:

  next-20260505

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
Jacopo's series.

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
link to v1: https://lore.kernel.org/linux-media/20260413160331.2611829-1-antoine.bouyer@nxp.com/
Diff compared to v1:
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

link to RFC: https://lore.kernel.org/linux-media/20260123080938.3367348-1-antoine.bouyer@nxp.com/
Diff compared to RFC:
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
 drivers/media/platform/nxp/neoisp/Kconfig     |   16 +
 drivers/media/platform/nxp/neoisp/Makefile    |    8 +
 drivers/media/platform/nxp/neoisp/neoisp.h    |  263 ++
 .../media/platform/nxp/neoisp/neoisp_core.h   |   30 +
 .../media/platform/nxp/neoisp/neoisp_ctx.c    | 2657 +++++++++++++++++
 .../media/platform/nxp/neoisp/neoisp_ctx.h    |   78 +
 .../platform/nxp/neoisp/neoisp_debugfs.c      |  494 +++
 .../media/platform/nxp/neoisp/neoisp_fmt.h    |  495 +++
 drivers/media/platform/nxp/neoisp/neoisp_hw.h |  557 ++++
 .../media/platform/nxp/neoisp/neoisp_main.c   | 1916 ++++++++++++
 .../media/platform/nxp/neoisp/neoisp_nodes.h  |   54 +
 .../media/platform/nxp/neoisp/neoisp_regs.h   | 2498 ++++++++++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c          |    2 +
 include/uapi/linux/media/nxp/nxp_neoisp.h     | 1694 +++++++++++
 include/uapi/linux/v4l2-controls.h            |    6 +
 include/uapi/linux/videodev2.h                |    4 +
 28 files changed, 11153 insertions(+)
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

---
base-commit: 4cd074ae20bbcc293bbbce9163abe99d68ae6ae0
prerequisite-patch-id: 2939dff7f477209138725aa8d86318d6580f4ea3
prerequisite-patch-id: f77370d8fc480b2e972a773f7d56f33ff1995eef
prerequisite-patch-id: bd3b231bc86129d25fca4ae34408a61db43bf883
prerequisite-patch-id: 691322bcfe69b3c51a886441fb241067355b9bdc
prerequisite-patch-id: a5f27213eba078f7ed5420d90df3ecd45151219e
prerequisite-patch-id: 9b2fbe610fb17689030c6da6c529f7db91b86d9c
-- 
2.51.0


