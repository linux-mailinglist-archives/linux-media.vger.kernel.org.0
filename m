Return-Path: <linux-media+bounces-37599-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDA6B0392F
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 10:21:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 408C13AB2EE
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 08:20:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67A7C23ED5A;
	Mon, 14 Jul 2025 08:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="oQuHmVO2"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010054.outbound.protection.outlook.com [52.101.69.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A7A23E350;
	Mon, 14 Jul 2025 08:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752481210; cv=fail; b=iJ7h99wL1VQYKRZQFNsgX1xxFjb0Rgw00DXB+jtdCAYd7Q0dXjZ7ME6jMEQcfLbLxiLglqnQAYp84E9Fiu0kD6wb4rIhiaiNKqHYT9t4K2HjrUa1PhMWhGc7Y+X/c4nOBa6I7gbJw/CGGCjgEJkHcjmfkWVJBmtSk6Co5v5f0hk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752481210; c=relaxed/simple;
	bh=9Ywz10QaZTBmxPUsazFIaz/wHA8bBZY23QrIuKNUkGQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mxw7Oueuz/DpHrsHNMYiTW51iEv94sL8MBnmMnk0O9ofkXObAllmkitjHD0PTOnWLSAHlAcEVI7TGUTjv1qBh2E03d5S8r6auqFVITfdTWT/ic9fk/32z2AH+TN+gr5PELbfMQ4FPwxU9+p9MWMlbY9kvX4sxi8EQ5c8/ZVLvEc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mt.com; spf=fail smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=oQuHmVO2; arc=fail smtp.client-ip=52.101.69.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mYkyQ5jCasAz4hQZhxeihNDgLGteRMx5bVniynAf1wYn9gMO+kWag47zmOos4CPsXNRKANOg3DEpNTxALShDQtRbFa0lArDkEmqZBgaDnZ2NQA0NFJ/kwa2XTscDRQvxMJAvcT52Fnei1VkXc5v9/Iir2EbgjmDw2iWqeN1ioBZFIOtjKKdojvlZNloJQQwgOsZKdYnpiO2Q6OslXO2UqKOQl2H+X8E0u/xMhGOxKBAYd3X3ZqdXCCygpp+JNQqpzdQlbsNAasmnK2XG0dJINdCp94NtkyS+x+2xYJNnMyymlqpwDDZg2RJj2Ndhf4xDTVXY+cjwVEK6ioNBA31bfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ntwXyvWcB5pN2RSp8hHJjUsty1gNUb6WcjV1nT8AgjE=;
 b=POn4fpUdPwI6gQg43goqGAcKsCEiqlmycJWWJGReA/oNg0iff75WLDQfUzjjDpz4JJn4LdgVNWShdKpCcbdvwH5oTYas1JGu3SlaZB5zRymqjrdS8/loy9+3ylM3R+0sFWpmcnsV3cizb/whyZ7K/AnrZyJJ09HoRsMtPcs5xLak49wBQZLj6j0I5TWSbnOQGcGHEfXxH+USvdkMaoJo98YcFj0LnTLhxd733hk1/PwLxdAXI4NXI74ccbKZLbFKPFySmnv4cFLph9p+TjW2mXn5/OZGPqycxDm/mAqYNpgtzAlpSbuxJr2Mzac938tCiIggruRwAqZ94rmI2QKJHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ntwXyvWcB5pN2RSp8hHJjUsty1gNUb6WcjV1nT8AgjE=;
 b=oQuHmVO2PzGA0pByY784LQM6achKHgdinOtBa6J9yJIR/rF6ZwrTejTRv/HsBq9L1UU2JT0TmVD2syuNu6fFVdWL9sDc47TeSkkmkD1/IqCec3MACTMkQPHnMoUADnuC3k893VfRSqlhAdWZelbpBwyQXCAWIAnnj74cfYYvm4UURtMSI3ECgGXgHQXhDZ5zLSgu+WusUBsw1CRlEx5nY2bckE/U4uOQseh6EwralrEG7xDO4vu+QvrdqrLBvwBLafbvP+rovhmeXBnu0ikCq8W7ft59aV6AsqDwEzj+AH3dgf6dDdMHIRUibt4FujKY8AdnsO3th0rbxZpUIl5HGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DB9PR03MB7755.eurprd03.prod.outlook.com (2603:10a6:10:2cc::22)
 by DB8PR03MB6250.eurprd03.prod.outlook.com (2603:10a6:10:136::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Mon, 14 Jul
 2025 08:20:05 +0000
Received: from DB9PR03MB7755.eurprd03.prod.outlook.com
 ([fe80::2ef6:ec79:4089:ce54]) by DB9PR03MB7755.eurprd03.prod.outlook.com
 ([fe80::2ef6:ec79:4089:ce54%3]) with mapi id 15.20.8922.023; Mon, 14 Jul 2025
 08:20:04 +0000
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
Subject: [PATCH v5 RESEND 1/1] media: imx: csi: Parse link configuration from fw_node
Date: Mon, 14 Jul 2025 10:19:13 +0200
Message-Id: <20250714081913.516481-2-mathis.foerst@mt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250714081913.516481-1-mathis.foerst@mt.com>
References: <20250714081913.516481-1-mathis.foerst@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0200.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:6a::11) To DB9PR03MB7755.eurprd03.prod.outlook.com
 (2603:10a6:10:2cc::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR03MB7755:EE_|DB8PR03MB6250:EE_
X-MS-Office365-Filtering-Correlation-Id: 282c310c-2992-483d-5e73-08ddc2af3c81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CI19HGdbv8Gl4OjHBRPHx/kkzFBKh6of9Qsq0Obk+mDohf/Zop6rMk4XriGu?=
 =?us-ascii?Q?qCN1II0ftELwN1ESWCs9M2g48mfTggzjimjGBG4CNRV8xOz+AZl67RxKOXUX?=
 =?us-ascii?Q?3DhGGaDgA10+kdbE3QkyUv0cjU/VcGi27yvUE2Ugho1qw6gE7H/0qFYAwzTe?=
 =?us-ascii?Q?u6EqmA2pJGaFh+lJPDH8kl6UuEMo9CzP4pq9JNRy3vQh0sjNzOHGveuYFuAy?=
 =?us-ascii?Q?5iuoa2gHwcqIDNFnksgB/F6UNtiRdkH5qg4Pxn0z3nEeC8hytRsR7I4unM0B?=
 =?us-ascii?Q?ioRbY2MorvBEUQD8rR97L26CBswIze/oVUr6zYkI7gQ7B826mUWtdGZtMcfz?=
 =?us-ascii?Q?RFSFscqwJb2QlhElg/v8kZu8FbIwGSbc/RJlEINRrfDMO15tk2PKWMnA2c1O?=
 =?us-ascii?Q?BzQLH0WlgyCSoXxeNXofMVZtU1jGfPKm3lGKLJpMgMOClQP7sNSYWUiwbZah?=
 =?us-ascii?Q?DlzWfjNDwPmyX+uuNoMJVpANbNxTBFRsZKRliYXl6leOt9ygjEOzr274u8Y3?=
 =?us-ascii?Q?dUzJlIQW9Cjzwt7IzUUKmgYfYhYYGbBxjZgYU+86Pji1dVTDIgPCmk5aTA9a?=
 =?us-ascii?Q?NUmTBUmsse7ActuiUFaDNiAexVxLI2u7omktAzzjEU08GYSDmk0gO0Rk+jAK?=
 =?us-ascii?Q?jhzir7FfU0jmop0z5Trq8vlGQvA2x1q1E0IXrD9QDBXA8NfPuOdsHYaVaGzk?=
 =?us-ascii?Q?74Z3ETov++vx8K+Td+Gxq7xJ9nT893IYUX2laCvqVycEb4/7gzII7mXr6Ip7?=
 =?us-ascii?Q?XX3Zl5qsl1N8k9sRqFE/XX2Ccs/Vyt1vs81mGSLb8a4E6otVQvqxe/N2n5Bb?=
 =?us-ascii?Q?bm4ezbsu+o3KZoDbKxYVTp3DIfpAvxLp9BO8q96KoULMbfvoStaGaSF+k8kL?=
 =?us-ascii?Q?UiN0dIHRIYLuw0goZSzR0d5+XsTKv07sYgqdJ5ErTQQrIAOeGJpDX/0NkplY?=
 =?us-ascii?Q?HRDmqaNZm4fFaXeYwL44HXWumfEByj+osOLxkm4GRY85brYLVXwaCcocJcbP?=
 =?us-ascii?Q?dE3oNGEYwagIg1c5oDt8aqeuItx7jZFZ987IT01KulHyBUSkgE1QlJE3S6f/?=
 =?us-ascii?Q?cCDCBUFxUeN2BS+9omTA/FeCjF2MNaROkNeN4GiTf477VcBCgkUCJlX+cCrR?=
 =?us-ascii?Q?1Yz0PGDl0k56Va6LDMwVUr1GjIAzXWfamciy1ueFRg1EI5INYWDmSG3mxX1m?=
 =?us-ascii?Q?kfFrh6/Ujx7RMgj9hVFhvpbWEALBPWzNZ6NWruSbYGmkES2gPXSH645m3PSO?=
 =?us-ascii?Q?R377njTmO1XYNezzcenjNhijtLY1Q39hhu42jEFMC+vU/eCRD1JSm8yXgPRg?=
 =?us-ascii?Q?IqzCel5p1GuCno3x+TwrHfApcsX+R3JAEkw9KN1qJjbwrFC7RUQJsYdtcVbc?=
 =?us-ascii?Q?5OSDzBWtOWEsG139nHYW8iMSXTSsT5FDzSAOs6PzNMIksGmuQNKiKUBegczh?=
 =?us-ascii?Q?9fxEaduoJCJhDiIo655VyUiy/DtYt6gnvsFlaEqP+D2awctMFZBGHA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB7755.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VMlnyz2Guj+nk09lbYSEOD2CNJONqd5gU0Is/wWYDkKnM6FKG49u/Ck8RUNa?=
 =?us-ascii?Q?wZN7jBODJX9m4khDoo5FhRl5R9vERXo+htQj1R+PGxTMzX8mxjwByMqncKnz?=
 =?us-ascii?Q?8JVKUfx0y/gHulBEcuxDZUw6K0g8YrbYIQhXAhwn5SowhgUZ5baAvHx8UR7R?=
 =?us-ascii?Q?7vYPXusvSNYyZ1F9508ZCjvhi/gZI+UQYbo/BSysd0nVW0UggLhZnv7C/Zj1?=
 =?us-ascii?Q?e0KNCK8SRjg115I/l5TKpt5NdsM7Nc8jYp5aYtdZxGZ2DutEb9vwUy1JUVad?=
 =?us-ascii?Q?IX3FNT7iz9gAp5iLV8CNxJaF03DgO1p5G1ejf1kzCFV6i52WZ5LVz+QeQdeP?=
 =?us-ascii?Q?pUYyePtM1omOplqcYQ5KQgdD9ITsFkivoqVvjOIrQK3/Xw6W9hToeP34QXOT?=
 =?us-ascii?Q?J/pEZXM9/sax9TjVWkUDyp/ceO08NFZmGj+4AAGYW2o5SZMDmnuXgpg/w7RE?=
 =?us-ascii?Q?1kNh12kiV3+7ftr7nKSeS/w0Y7XW3/4D7sZRMUV3ZeLJGkkbnkdxwohmqR8h?=
 =?us-ascii?Q?p4NFITPnn7mmOG+UM+y/c7KRJ8nWAItnGDuA2m/v8W09GZRxHAqmBVOosW6S?=
 =?us-ascii?Q?KXANWSZJlhxKV4FATCp1ZPa56MUM7nkKyHOIQ0nrUhT1/55dYInpzAKZgA3u?=
 =?us-ascii?Q?oT6IGfNrVANqWlWPJt3dNNwrjqTOnjGzqWieFAI/nwkTvVr5ZQcnzCi35lqH?=
 =?us-ascii?Q?k/ceBKK/NsPPH99oV4Erw9i7//zY40Z4EjUc9EMJRoctUnmxRCfhlgxuhALe?=
 =?us-ascii?Q?yuEF7mfrI35hTytJRufyhrGkzd/pvJQwqm06fRt0X942sfNYa4VoDACttElc?=
 =?us-ascii?Q?7l2Lv5CX9XzKih4qHPVRaCCvtcj2I5Wk/SoH2eJYwYBSxezg32LILW14m781?=
 =?us-ascii?Q?ePqi0/RLLWErdqawk76yDZ7CZTeB0FIgceNUGWPxGGfAWp5Io++nq2CjKr1Q?=
 =?us-ascii?Q?F1+teYAZXNa8FRCeOmo1u3DL5S9VJpBL4tErfshDA4yfWZuiTEAYMR2x8VhK?=
 =?us-ascii?Q?APsRom0IQAj3324PdCjzM9pV/9iRZpWAkXGqdeOZVN8lHLhvdoBUhKE27Hn4?=
 =?us-ascii?Q?BU4f1Dk9pg3ObeWzEM9Z/JJOz0jksta31bTVga4YHG3tQpef7fZrj+0ZaJ8r?=
 =?us-ascii?Q?UlVb/okcP3ASWcz7CI1conw5O2kHwaGZG+3BWbTm1OXpkvJGh8cwO2hdHsJM?=
 =?us-ascii?Q?k8Nn3Oizk8Gk9C5GjLRnsf2KF1Xs1BoXO2/hSvNfHX9W0df6u8QlPudAerlA?=
 =?us-ascii?Q?W/95p1IBjHhcv/6KCwXCjaxkkjfXtI8DcYxmoLnQJZQmLqDQDJfZ2tQ+T1Cj?=
 =?us-ascii?Q?moA5mlYuBJvglkV0NRHRwSQ+xeBvZrHREYscra5mMdPHIsIeXGvyfd/so9rV?=
 =?us-ascii?Q?GBMXie3hkpTySw2WAtopgVtQYy8B0Sorqp0W9Vn72HoIpA1Jl3qipX3Hv9Yq?=
 =?us-ascii?Q?xZeJnimHnwoGO5r87erH1vrTyw0KG2kFoPxAzIIZ8YsnlEP49MsFxJ6wWvkX?=
 =?us-ascii?Q?71cJK/Zff6IcTtMsCpEZneWy0sjiyzU3lb4hIfyv2JQ8BSII2ysX7usgRgdN?=
 =?us-ascii?Q?K6ZGcUFtScsoA8GFMvIfLzoki7kpkI1IUgjWrUQj?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 282c310c-2992-483d-5e73-08ddc2af3c81
X-MS-Exchange-CrossTenant-AuthSource: DB9PR03MB7755.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 08:20:04.7757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P0QhnlkMcpN2yeLqh7lxHyJHHCJTLlvNweJO3Xk9T09dUGXZ34Ho2ShenZvslpe5dYOeHFxpFxGLc+M7sC1HDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR03MB6250

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
 drivers/staging/media/imx/imx-media-csi.c | 62 +++++++++++++++++++++--
 1 file changed, 58 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index a7cd3ef95fc3..5c2f197ae961 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -158,6 +158,50 @@ static inline bool requires_passthrough(struct v4l2_mbus_config *mbus_cfg,
 		 infmt->code != MEDIA_BUS_FMT_YUYV8_2X8);
 }
 
+static int csi_parse_upstream_fw_link_config(struct csi_priv *priv,
+					     struct v4l2_subdev *remote_sd,
+					     struct v4l2_mbus_config *mbus_cfg)
+{
+	struct fwnode_handle *ep_node;
+	struct v4l2_fwnode_endpoint ep = { .bus_type = mbus_cfg->type };
+	int ret;
+
+	ep_node = fwnode_graph_get_endpoint_by_id(dev_fwnode(remote_sd->dev),
+						  0, 0,
+						  FWNODE_GRAPH_ENDPOINT_NEXT);
+	if (!ep_node)
+		return -ENOTCONN;
+
+	ret = v4l2_fwnode_endpoint_parse(ep_node, &ep);
+	/*
+	 * Retry with V4L2_MBUS_BT656 if parsing fails with V4L2_MBUS_PARALLEL
+	 * as the parallel interface supports both MBUS types.
+	 */
+	if (ret == -ENXIO && mbus_cfg->type == V4L2_MBUS_PARALLEL) {
+		ep.bus_type = V4L2_MBUS_BT656;
+		ret = v4l2_fwnode_endpoint_parse(ep_node, &ep);
+	}
+	fwnode_handle_put(ep_node);
+	if (ret)
+		return ret;
+
+	switch (ep.bus_type) {
+	case V4L2_MBUS_PARALLEL:
+	case V4L2_MBUS_BT656:
+		mbus_cfg->bus.parallel = ep.bus.parallel;
+		break;
+	case V4L2_MBUS_CSI2_DPHY:
+		mbus_cfg->bus.mipi_csi2 = ep.bus.mipi_csi2;
+		break;
+	default:
+		v4l2_err(&priv->sd, "Unsupported mbus_type: %i\n",
+			 ep.bus_type);
+		return -EINVAL;
+	}
+	mbus_cfg->type = ep.bus_type;
+	return 0;
+}
+
 /*
  * Queries the media bus config of the upstream entity that provides data to
  * the CSI. This will either be the entity directly upstream from the CSI-2
@@ -175,6 +219,7 @@ static int csi_get_upstream_mbus_config(struct csi_priv *priv,
 		return -EPIPE;
 
 	sd = priv->src_sd;
+	mbus_cfg->type = V4L2_MBUS_CSI2_DPHY;
 
 	switch (sd->grp_id) {
 	case IMX_MEDIA_GRP_ID_CSI_MUX:
@@ -186,8 +231,14 @@ static int csi_get_upstream_mbus_config(struct csi_priv *priv,
 		sd = imx_media_pipeline_subdev(&sd->entity,
 					       IMX_MEDIA_GRP_ID_CSI2,
 					       true);
-		if (IS_ERR(sd))
+		if (IS_ERR(sd)) {
 			sd = priv->src_sd;
+			/*
+			 * If the CSI-2 receiver is not on the path, the
+			 * parallel port is in use.
+			 */
+			mbus_cfg->type = V4L2_MBUS_PARALLEL;
+		}
 		break;
 	case IMX_MEDIA_GRP_ID_CSI2:
 		break;
@@ -211,9 +262,12 @@ static int csi_get_upstream_mbus_config(struct csi_priv *priv,
 	ret = v4l2_subdev_call(remote_sd, pad, get_mbus_config,
 			       remote_pad->index, mbus_cfg);
 	if (ret == -ENOIOCTLCMD)
-		v4l2_err(&priv->sd,
-			 "entity %s does not implement get_mbus_config()\n",
-			 remote_pad->entity->name);
+		/*
+		 * If the upstream sd does not implement get_mbus_config,
+		 * try to parse the link configuration from its fw_node
+		 */
+		ret = csi_parse_upstream_fw_link_config(priv, remote_sd,
+							mbus_cfg);
 
 	return ret;
 }
-- 
2.34.1


