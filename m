Return-Path: <linux-media+bounces-27451-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF8CA4DAF7
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 11:41:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CCD016AC25
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 10:41:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA18A1FF7B3;
	Tue,  4 Mar 2025 10:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="ZN6j4GkJ"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013033.outbound.protection.outlook.com [40.107.162.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839021F5834;
	Tue,  4 Mar 2025 10:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741084651; cv=fail; b=WLcpy/274SJdNl7Cxp+PMHUqz2CAN2WMj/ZDHa1CwWzGm/WLB5Ilmu6nnmZ69Vg53quisjHgF9UHkbmyzT/IaVtfugO4h7knsqT17bAeIhel7mKZ6XnxA/ejVpNrmKAAxM7i5+dfJVvpa3valeDY9DbSbPMu8JbXOews4CX0h4Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741084651; c=relaxed/simple;
	bh=mY0TpLRbENvdCftU3yfX5fWue1+QCPrcLhvmhMJ/D98=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=guwdQjGz1B6w4SNRSIvSL51zNgQj4ddxSwSPqt6YsTy5y3Un4RqYo06qEKgZwF0HWLEAyj4R6TI6pUg9v0/p9uguW0ozYWX7vZMHV5KO25JFYO/2iT7xstraEGnEVWfd00BmQWYxJ8GlEGOYnRybh0Uxws6NZtQ+o0deGUBwSYE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=ZN6j4GkJ; arc=fail smtp.client-ip=40.107.162.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N/bwyufRUC9t6KHQnm8V9r73ffBCQthSb5IMtfqIOt83MhD3h6/rDywhcCsbuejpc05+hdLWHZrQQ0K2BJ73hV59aO/QCzmLXYuF+FBd5G5HThHVPpBzdckI05G+e8oL2wVwLWsN3V8gFQGLdq1YedkvVbuWioSBTW3vaXHzJpkruP9LxN+QYI/N1ypTzL3lTOU1sFWcbCEIm5C5XE704xt6rOHafFtVzaTwgU9Tt0gMZ+vgwcs+Otxy6SdQpPhwxNyvGk71Lx9Ol7HuReAP42gkLzv37ZjIwcM/9QVz1bfX/BxGjCyp8hkWDQrzkLtUhUBMax1oD8haxOyFjkvRbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P9W6sOO92s6BpP5BFvoSvkK4YYPzZVQFDoq6TTi5FAs=;
 b=gtZELV0BYfyx1n1auCz2EYa25FXiX6SPa/aKzRnWL6C6xcUdQcmFV5zIQhgPYpMGCBbkJieti8LpaqXW/G6oqfVubiTI2Z+fZNcvzexHzZcnipNi3drsDTLNgBOkTi283qbVs2BAJWU57EnCJG5MWH4nienKlImhvvgK9H+jtCioQR8TV/VJEVsB1VFc+jt2p5hkPRCu2YCtZPxkzM9WQpJnCrSaM4tWFkexPcLlyEILIUoiWHR+izvbw4u0Eltq5gKQHuJD5zFsZQCfsApmwd+hUIsFWJrmaGUWUn1tCmmgdPnet1DkoRchC6GxMuJciDcKX0Hn32R10fOY93796A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P9W6sOO92s6BpP5BFvoSvkK4YYPzZVQFDoq6TTi5FAs=;
 b=ZN6j4GkJpZ9SOxi5/1nWUzyg8ShFEm3vfPvHacbM+crwTW46sYffsGy2ptLSH9GFSTPrmtUFAKVBMALwff9gCzA94moiV8wyCBO3EPI/0fpUtbUcKGxZqHoohfPsTDyIvJa0saJ988KSl6evnoQKFrgah0OR/FZ7HRWI6vYjdzIkHL3xiqKADZlmjoc1sLBf1Myeze2fUYRDGHN6EJzqPBbvoSeJr8GdE73iuqF2+xqzvt3eI0Qi1GU/6HH2EJl0BpQIXPTJ7MgRB2gYwg5N6kr3pwrvX0bo7FWt3XcpkB71P+SrgR1On6IUOf+Xl/UPNftKYSOBT5ZZN+TtdzYLgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from VI0PR03MB10400.eurprd03.prod.outlook.com
 (2603:10a6:800:203::15) by GV1PR03MB10575.eurprd03.prod.outlook.com
 (2603:10a6:150:16e::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Tue, 4 Mar
 2025 10:37:23 +0000
Received: from VI0PR03MB10400.eurprd03.prod.outlook.com
 ([fe80::48f6:ae9a:fcdf:b5bd]) by VI0PR03MB10400.eurprd03.prod.outlook.com
 ([fe80::48f6:ae9a:fcdf:b5bd%6]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 10:37:23 +0000
From: Mathis Foerst <mathis.foerst@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Mathis Foerst <mathis.foerst@mt.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	manuel.traut@mt.com,
	mathis.foerst@zuehlke.com
Subject: [PATCH v2 0/7] MT9M114 driver bugfix and improvements
Date: Tue,  4 Mar 2025 11:36:40 +0100
Message-Id: <20250304103647.34235-1-mathis.foerst@mt.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0097.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::12) To VI0PR03MB10400.eurprd03.prod.outlook.com
 (2603:10a6:800:203::15)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR03MB10400:EE_|GV1PR03MB10575:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f829123-9f7d-45b6-1ffe-08dd5b088c63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fbumdzZotPwvlKdHRctFNHvDhpNvNZdzeGrEbRnw45/TE9+1+QQB3CIPGmrD?=
 =?us-ascii?Q?bbb2eff4MNY1SJrOeXqsLkKDTZXKYf9rgtXublIWz7gNEr0PtdLaCZ5vI5Gy?=
 =?us-ascii?Q?ropyrLs/bYerZsmVyHJoASo4Ze/Y2NjDchrjSsWFNloQN6BB+0qFZ+/5JNTY?=
 =?us-ascii?Q?hJWKsFwW8bNkoEEbmogTglC/I9tme6Pn+/TYyMqF9RF0RKkEmWQAVjvJqof/?=
 =?us-ascii?Q?dtr/5Czp1T9zR5qeOGFXR1OLriRTzcS74MiRTPCVRb9nzqsXr/QY1vbsz4UE?=
 =?us-ascii?Q?AGrceowC+ejuzK/3Z9fWSp/WezyBXqG+MKIHOMvwVeDPx38SFwglEkC0j9se?=
 =?us-ascii?Q?4bUypVn+ehHqEb7/8zedzxVg2sWCyCCITD9gqGqQlPy737JznblQf9r2lTkR?=
 =?us-ascii?Q?i5dqjEdMcGNQbyXx/LCyacaJZgRS2Zy/NrqfcaGc5Nu/+eatwJa/1jAbS/bT?=
 =?us-ascii?Q?QAIGybhGbSWoylz+kBkR+lXv920sN//tLCrbLOO/AJ+C95hRXIk3PlZKNekA?=
 =?us-ascii?Q?34TGg7uIf8uhOazaVCsve/ln1Jqx2RHGO24sJAlcwdxH4Ld3nuuy5TGm+9y1?=
 =?us-ascii?Q?FgugVB3CpOzWZxD723kgcmLbo6z3tNPHtmHr/bLslT9LxMLX3BPGe1mCE2QU?=
 =?us-ascii?Q?lC8AXDZoEIyboqicSrrmPCJgJe6JL7IWrEywf7mpuQlyFJBrhtA5HeWwlbOl?=
 =?us-ascii?Q?Y018y3mTNGkmAnatxKZ5ftS6KWMcUU1wxTFtbNtAAWB3PCjK9okP9DZ3ktfR?=
 =?us-ascii?Q?evAr+2n1U3KliAP6knV/G8Cu9h1YeZ9rabYnAxl1Gt6bShbCjI9F4w1iK9t/?=
 =?us-ascii?Q?Ez4LbLc5KRZfDeqm5LmkYWwbbJyTK4zulT+lFWHlxuka7o+OKt9G6fOtEV5Z?=
 =?us-ascii?Q?E6Y+ogNl2RpX2jnQVitI0wVTUgIQe8dERSFCo0CphIpbcOgGm1xkmdyHnFs8?=
 =?us-ascii?Q?6QS2brj81zLE1GDyVd8Z5WvXowqlDKIV4v9PaRZBBOxcVqCqQPz4D9Lyj24p?=
 =?us-ascii?Q?yj0Wpx6CY+U4/mhGgof1J2aWys+wc1wklPGM8SeY0GhOaXE26MmRePZ1vy3x?=
 =?us-ascii?Q?D4acR91WNjJesjhT4AXbFUADApjiD1pVeebAP2FWf+yMRVov+4LbQwe7FWTj?=
 =?us-ascii?Q?jYU0huvKepjTQksDtkBSBAM+HGHgOzsFQT2xykqAXbzyhow/+6XcElP/4U6J?=
 =?us-ascii?Q?gzKuBJO35Yp6D4vAeiPwV/Ere7NnaswU4+W8zI6fxMlnbUhQ+79KplK632wc?=
 =?us-ascii?Q?WChh/2wrUWQroXLHE/J1v5jvKnGyC1TWgmXHi0QgsnqOKL/Ke0F3tqOiicPt?=
 =?us-ascii?Q?jjWqiYVj+MxhATjwD9tr17xUUJTpeFINvT9YNNthxkEoAqm2ZzM5lEQ2lQ6y?=
 =?us-ascii?Q?pqaWwIYb+K6tFssp/K6AGSDNf5Jx/h4Vm1EGlRrQ6i7v4+Y5UxBF4Wctl50j?=
 =?us-ascii?Q?7hWkGLUfz7AZMB0+hDYciOhw30bqjRZi?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR03MB10400.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DMi8XJ8719F8OD6rpY7bqRwDvp7t/EMEVvyV0sR9D9Q3S70InG+c2py6urb2?=
 =?us-ascii?Q?FcRWwk0D2BySx4tqYs5cbZKqqkEG9Ui9W2cuKBGDuFXEHyBywmgNTjGW3+Wz?=
 =?us-ascii?Q?17ErkSQ+dgonmLk7yD7rVvxR5p2qMYZLMGayZeRGlR/RiTIJcdw37KzNsH3K?=
 =?us-ascii?Q?P14UqwcAgnZxQh7gUUnxrVaBvinPQEu5cGR8tYFzyaf/FMpYNQjGGA+ZeRTW?=
 =?us-ascii?Q?FRmuwTZSBojJ46j6Y09YeBmmXQow48oezgGJ+enaNtsK630QImgrDucKRG3J?=
 =?us-ascii?Q?d/fPinMQCYQVg5zsHc0ZszfplOz3vosDNFHxhsmckPsy27EkKuvSVblXeK9f?=
 =?us-ascii?Q?859Zgs7d1Fvi7XFYyn4vEzATx4wK4JgmG/DuBZceB204PyqHJo9PO32YEDuK?=
 =?us-ascii?Q?gCL7gMG6vdAqeWjHxQpEAgdHeOqkXN7JjB3y+4hxFQe8xfR+BXN8kUT3+j6I?=
 =?us-ascii?Q?48bjtxi+2krXDi5PLdOtr2kl2z+kCpH3RaL0r7lC9SOI7fyGHzZFuETo869k?=
 =?us-ascii?Q?XnfKbuEHARPzFvXlINXektyO3YAlr9mLOtasbdAkOUE9P0B3K9ELjEfY5R01?=
 =?us-ascii?Q?ntUJF6/ImNFFnriWGfwcQ/OLDIgBq9gSfnaSRYxgzOfmJxfadKsU6tEv25aJ?=
 =?us-ascii?Q?f292VjWrHHHdo/clUfkqx3dUTJIgm7DqyaSywUrbNh/yUhAmDDAs4dBdZid9?=
 =?us-ascii?Q?PbauN9XSxXG5d96/UKxlXmksFReXCcMo+yd2xqMIAVIofiwBt2lFPm2sXiAy?=
 =?us-ascii?Q?zZowc/Cw5K12V73YjyVCA0WVwkOr0JkNmu5Cc05V/N1RPsCuy4zd6tQH6i79?=
 =?us-ascii?Q?Ib6k7qCxhkVihbbUoIeT9zRUqXSyp/FTGScvkmtGxjxXMoTCi8kknIuTFfK0?=
 =?us-ascii?Q?RkFkRPYI6W+fAm2N6vQpOv60u+qEejF2oOkOq3jnk0uMcbXONBapEcbvrM0c?=
 =?us-ascii?Q?2920xxDXnBAmeT654bkT5TNYgkPxAQ6GBbE9exZ7OigAw8ItDGdRi+aoxK+u?=
 =?us-ascii?Q?hv7JFxORHpZ7FUL1u6d3jGtJtXACb7QUKmqjJ7doYeb+86sUKtIS0pnZljTY?=
 =?us-ascii?Q?+vsuYV55+iV3nO1xPTKWM398RVcfdwKYazxLoSgdTpt4WeCPjkYj85x+9UK2?=
 =?us-ascii?Q?wN13l+8cIa5CQ+WBYmocvcALAKsXWOdl/uRUsMErkGzicLqJAI70ehoJhSiw?=
 =?us-ascii?Q?l5hKaUHEXcqUU6oajvsGWGitt1HFvvVoVrRm7FO5wmC+eRZwwfP1cDHhX0td?=
 =?us-ascii?Q?NFb9CxDVGOPbVx5Cedq4Lu6DtdPbJXU30/DRRw5R6kgAY8CCc/E8XmcIOruB?=
 =?us-ascii?Q?CkTubF9rZFVVE5159IdmAttyoKaCwJhORR1ylp0H+A1vIPb5G8N65/xpfnp9?=
 =?us-ascii?Q?nFtZcGk+9wPydKFjKspZkYxsrL+BdpNF4ljx/PnVCzcnpB647TPLtnMQgF3l?=
 =?us-ascii?Q?dSlofyqWRn+VpKmZX+7y2OS3xS3ifjr1hwUolE+hUsfOUSKDPClnn2kci8K3?=
 =?us-ascii?Q?NoSBeHS01Cjt1EALToI708TJ5INrU5hBB+UbBx0YJf32FTC0lkCF21/ZmxSj?=
 =?us-ascii?Q?8BO4uKeGomIbxbG5LLOIeO5USBxCnwrrcIUe2WPp?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f829123-9f7d-45b6-1ffe-08dd5b088c63
X-MS-Exchange-CrossTenant-AuthSource: VI0PR03MB10400.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 10:37:23.2300
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EiCxJ7sLmwrHHtYbf8eq+5pSlhVb/r5VrGgXEQadCYmRBT/g7BPtN/l6T3/vyCNSA4jBcFcldsfG6qvlYd72cQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB10575

Hi,

this patch series contains the following bugfix and improvements
for the MT9M114 camera driver:

Changelog:
v1 -> v2:
- Fix the subjects of the patches
- Dropped PATCH 1 ("Add bypass-pll DT-binding") as it can be automatically
  detected if the PLL should be bypassed.
- Renumbered patches accordingly
- Switch to uint32, add default value and clarify documentation in PATCH 1
- Add 'Fixes' and 'Cc' tags as suggested in PATCH 6

Link to v1 discussion:
https://lore.kernel.org/linux-media/20250226153929.274562-1-mathis.foerst@mt.com/


Bugfixes:
- Fix a deadlock when using the V4L2 pad-ops get/set_frame_interval

Compatibility:
- Implement the missing get_mbus_config() function to be compatible
  with the i.MX6 camera framework

New Features:
- Bypass the internal PLL if EXTCLK matches the configured link_frequency
- Make the slew-rate of the output pads configurable via DT
- Allow to change the cropping configuration and the horizontal/vertical
  flipping while the sensor is in streaming state

Thanks,
Mathis

Mathis Foerst (7):
  media: dt-bindings: mt9m114: Add pad-slew-rate DT-binding
  media: mt9m114: Add get_mbus_config
  media: mt9m114: Bypass PLL if required
  media: mt9m114: Factor out mt9m114_configure_pa
  media: mt9m114: Allow set_selection while streaming
  media: mt9m114: Fix deadlock in get_frame_interval/set_frame_interval
  media: mt9m114: Set pad-slew-rate

 .../bindings/media/i2c/onnn,mt9m114.yaml      |   9 +
 drivers/media/i2c/mt9m114.c                   | 193 +++++++++++++-----
 2 files changed, 151 insertions(+), 51 deletions(-)


base-commit: ac9c34d1e45a4c25174ced4fc0cfc33ff3ed08c7
-- 
2.34.1


