Return-Path: <linux-media+bounces-62464-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DSWHAf8DmoSDwYAu9opvQ
	(envelope-from <linux-media+bounces-62464-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 14:35:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC56F5A4E57
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 14:35:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D66FD312AD4E
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 12:27:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D23C3CE48E;
	Thu, 21 May 2026 12:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nF7D9m41"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011035.outbound.protection.outlook.com [40.107.130.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77EF53C553B;
	Thu, 21 May 2026 12:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779366465; cv=fail; b=pQN785+6UCDeSAZ1QGw1y+R8WvJtm+TMms1UrS9sgUWczIfiviCOMBxRG1qp+B++UgucoxSmpt3Evp7PVc/nBXijIS+L2/6gRKZKsw6Q0H/g9rzegHVJlLx3B2j4w/CKel/AhRBXbTQV+9RnJLzivTIitiTxejHJu4R34896Iv0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779366465; c=relaxed/simple;
	bh=9oREFo6RBH2P/Vqlv7PPXGurvCB/70m+y6FLe4X36MU=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=P3SmuPHYqKaR9FNdTOo0lPaztXSFtbxCZGykhddZ2ODUEA9v2DNptZ9qHy1Gs8vCetdTyoCi5fdWlFBD1IqW5TNoXJiVwmFGMB4m8ZKP70OMIsF7jgnryGexDG7xo+nQVxmEfX4r2pVzmL8ciGpkB+tY3XgbTV8/lVxZCEYRsCQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nF7D9m41; arc=fail smtp.client-ip=40.107.130.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eU3goV9nR6qLYib97PpsoFe96J//6eBl+mrKW7lVQ+umhaAY4KILGKk0ZpLS0P44nDX6SNX7c8Y7o64UzJIyXRLOBPMEuYLuX3kMVIw+901eCZBmzek6+082nFD2Kr0OsIqq97jA0YNktob8NAMWA+DcF76EcczPeIQiRe/RZPqoRnf5hzQCkFX56o3WP56/pJShl88fBfnts7ZLf431vuOMLazSe/fnWEiG7SG40DxEprjSZfZK4fUuDYy+mIWHDT7bVGYu4ljjSKNYKKZLZlMZq1baIfwIux2iF+fcykxEftNFn1MYdU1K7g40bZvSKEIDhbdS/2y9taIJ/3YrYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VlJVG6Pmb0ujXZ3mW0On8EJxoDeWEnFXjk/Lu89fy3s=;
 b=aWjLuGfBjiY2+oVrQ0zIi5q4W7f+bYEVbkEhrFNo6QP0rkwlEj6WcdwGTrONs4SAo2jZZrcdsoGrdlkyJfxALEV2bl/+0inPF3hua+HcIZCTQwkh4rP6Qm6DMU9SAxiV408ktKCWCtSixIRvOZ78EsH0NrcSsnEAoLpzKze8T/dCh+AH7Wxh55/T5m+yTb2NFT0oLbQYGmgFCgMAP4/AVdELR6J++7sunAuP6dGOmpiSexQJlYqtClxkH+uIsfHKmFmfOBn//QpAbyKftY8NnpQNsbneE8qDdOnOZnCgrrvkk0rJ7e70VUvYzgA/u36DDY75sWdMlwB1Lyk3E9AB6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VlJVG6Pmb0ujXZ3mW0On8EJxoDeWEnFXjk/Lu89fy3s=;
 b=nF7D9m41Mrmq1K9yuseMYzOeuMkwfsv7EazJebTPveBqy17LAKEousL6a22mix3SRuXZM7+mHmJgcnJX9A9WvsNkkpEYVd+rMmORnMg+q8ZdxX/AA8zMpcf7Bi49ythwkgudVMTFFOKBUrp9e1kdhqs7C2UcAJyk/zOnrLxAe1KKBqnVM04H9QeapginsQkRPshSYVWdOp7RklbAnD2hiNbxApcTHMmg/0nXhK8gyL21Wh3VZ1JJ+aWVOVKmdFdWiembHo5k6sLqqX0dF8Zfntx4ncdGsmGBWKTLJ4XgbItGj4mSHxr/S4153qSLwsNuo0wKD+pWpOQHKOcUq65FOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by AMBPR04MB12286.eurprd04.prod.outlook.com (2603:10a6:20b:733::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Thu, 21 May
 2026 12:27:42 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::adaf:805c:51c5:9538]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::adaf:805c:51c5:9538%4]) with mapi id 15.21.0048.016; Thu, 21 May 2026
 12:27:41 +0000
From: Mirela Rabulea <mirela.rabulea@nxp.com>
To: sakari.ailus@linux.intel.com,
	mchehab@kernel.org
Cc: laurentiu.palcu@nxp.com,
	robert.chiras@nxp.com,
	guoniu.zhou@nxp.com,
	robby.cai@nxp.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH] media: v4l2-fwnode: Fix subdev owner overwritten in v4l2_async_register_subdev_sensor()
Date: Thu, 21 May 2026 15:26:45 +0300
Message-ID: <20260521122646.600179-1-mirela.rabulea@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0241.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::6) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|AMBPR04MB12286:EE_
X-MS-Office365-Filtering-Correlation-Id: d645df02-662d-4a3f-48da-08deb7345a33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|52116014|376014|1800799024|366016|38350700014|56012099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	sMFBOgOOvCw1psKwwawjsjk5Rgee9SeHvWhPR+70wXKRvFGu9xBV/SlGG4gThJ9UN3ZlyUYd6XXnAGf8vykCCFPrRN87WjyO50cLqdUoFZndCNbFpHDAbyPMU9dhhPAR0ADJ48En8ZqCA1KILBOsIOwM5Oyd5AXEw4ZlTfUPEK7Kj7gZ2ld8ade2aFABP4HhGq+b24VmfiRLHIsS8tcxq1doJQ0fkvQ2X1CqjEy0d5X+l9BdfP+76Nehueywgp4hS6pe5K78b2x8RRPlDhcck4MV5TP21Epi5LTjtxeCpdP6funiGitZHVj67mAIpI7B6j8PdDu659I+nFMrlQ53ptyd8kc2pBYr+C6rbKSwEmNlD1viAP5M73a9jzqiqNwRbxShiqO0boZ2U5i3EovUOrrqwOmhYL2fcl/K0jP9gaoj0AaWKcHsr2TmLvXulUpEI2BkTm5j8ufA9Q1TYTDZq5DsIo1AdGk9gFxwtYnffzeDUD06glDflDlzAknwWwP7nkVukHeBS0aJgYp7QGzz5Ci2jGDm7XKhk1HRl1EZk8euk0Fb6FwhJmP4is4V5qgQ7H+YCQJ9YbS6T4vq2QtF/GsdSBSqRXMSVdaW9PhQwNhOz8JDUzLQz9R+hDTnGsfY1M83bFtVBXFvn5i5QUejOej1PgjmNnDi1b3w74fk8RPGFZ28TziBwLvDQJAr/GsN+N0ahXzo6rBXJYP36MfZUX0P4pEfPO0zTTzIeYB+EpILW7acqdfY7p8CpsetAtL9
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(1800799024)(366016)(38350700014)(56012099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Pgu1vHsbL8da9weHyWM5KfxswGUbsJFN9ip37ygGRza6pnixRplUgR70M8hN?=
 =?us-ascii?Q?jRl6N7jZURlBc6DnmCqESqqzkFeg1GxT2FaAPxNMNbGxfmsxRRlf9yrM5e7M?=
 =?us-ascii?Q?cwNdSQu3N6K3PKD3eN42vl2N9UntA8oe/vPLQZm2A41Ugj9WlItIAF+rj1/s?=
 =?us-ascii?Q?4cHVbpJFWAzx8zjhsu3KVM+7Dx9Xs1rf4YhDwPXr+2k/cLOR54e+/zpZEYcn?=
 =?us-ascii?Q?dh4zrH304WpabPQzMvbamhIYtyu+4LQSiWWWW1cA9jI8iZJTD0Bt5iUs384h?=
 =?us-ascii?Q?X3B2nf5A22d5SbmgsdcREZ2nDxo1q5R67b0A3VwUdjf39P956FMCRXjzg+QO?=
 =?us-ascii?Q?+NmriDsUcXsRyue091Icp6+i9g1IlZaqxhPfMocPIWBlkgGSLalNlOn4f5Ro?=
 =?us-ascii?Q?t+gz7nJRprOrM2QpqDHNGriCGbY70N2a4aifTfSWf5iVPtW29FcU/KZ+T5hq?=
 =?us-ascii?Q?3vvj0z4Ds5YRdxZDj77h7qlyqpREW8/XiwhG5slxy9l+BzkgmMCV/24Shmjr?=
 =?us-ascii?Q?4EPElqWpHalNJ39H0FLPKoCdDCS9FJezMNdEGEenwgAot2spN7vpqhyTasAc?=
 =?us-ascii?Q?F44ILFuinWbBnUxERFQd+eHjIeGT3x+vSd+bqbmNlSE+sXsEz6VjqnkXX5gf?=
 =?us-ascii?Q?NRkR4qSuiLra+EVgrGXqnMmtNYtIIGJOMOHKuy+Msu3LwAySqIK3nucYASAh?=
 =?us-ascii?Q?nYUb4kYSgn1u88s270Fci/TowuqqiBXi5bnW9d6qyyJ2qaZeRnQQJta+yc5x?=
 =?us-ascii?Q?/yRW4M2wlZWcwE5mO+3mcNPi00umfRvw8WwsSfLTKTMG48o5aDzsSGv9OEVy?=
 =?us-ascii?Q?X3xcvo7iM6iUYc1BkYhRfDi5If6LF84T5VpSE1FcFG4kKClsfk52FiUQZ5eS?=
 =?us-ascii?Q?4yFhw4HQbbeGQw8ZbPHSJ7Uaui+rXvWVZvSSza4QGHNFkuW4fnsSNxmcdgM5?=
 =?us-ascii?Q?T4YWDpsk122Lv9m1r1YF445OKIwc3+7dYLygpzN0n3axseUgu4bCnk0PYA9a?=
 =?us-ascii?Q?fUu9qmzRWHvV6LHZOxBQGZLitqMnDVv92Kniu/oKN6S35JvsIMjD4NTzMYVI?=
 =?us-ascii?Q?iXe5dT7yjYV2w+YOO54ttgBBLSAjb6M8OMb0dc4xqDsH97p6tT3fuaZkVXKk?=
 =?us-ascii?Q?UHSBS3jbSqQP2MeGh5aqhDo1vDW8shBO8js8kGjtm/oWN6SBx57y2z8HriML?=
 =?us-ascii?Q?pGjDtUpzSexTzobkz67hPSdVpY2LLbWAWzLmYxk066YpHcXA2fHyiPJM2sjV?=
 =?us-ascii?Q?y4mSHApsiTo+isRCYgIwHn/PXKNoSerwzPeSE4nLvwOSFIs8GiNDH4tQuByP?=
 =?us-ascii?Q?u6NxA/v4J/eVoAT4tObTvHTxPxKOJT1ntQ79G5uBR0lko7PEIOM91jLol/jS?=
 =?us-ascii?Q?/30fGLw1t9yUjHn+O16de1QcStuoR7PE+wUY8REzxL6eExK8Xr2bcTQRGe4p?=
 =?us-ascii?Q?a9AOFsyFTUPithFCqjTiBgbk1D1vvJORSokoYYt9vHIR59DVltFxJ/8SMN4Z?=
 =?us-ascii?Q?YYFeqATOPJzE7VmVH1GIJHY6mYAYvgfsw2gcH9x9+epkIkzFvVNcSht2hIP+?=
 =?us-ascii?Q?8HHiAXhOsTTPtNgsnDZr8m+kguKB9z6yzbiqwdxD1cuJZiYBvEQ7M7DgCRFO?=
 =?us-ascii?Q?XDHvqnAKwbgdF3DDlR9gf9QGJ3ZA4guLHz2m78McGnIbNZzBzSBRH8+afetU?=
 =?us-ascii?Q?V60wksg8UhqE20eZMhX/1mYb2DA7Jcey4jinIxf/+Oi+xEGe674e9yazq8N6?=
 =?us-ascii?Q?McMCycIjUg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d645df02-662d-4a3f-48da-08deb7345a33
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 12:27:41.6929
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JkWgi8eQ3cLQyCbHFyu8GnjUFt6j8Rr9G/lfS2o7f7H/z34XBBGd4YzLDuizRjn9rUORBnecR1/42ZB8ulPOtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB12286
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mirela.rabulea@nxp.com,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-62464-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[nxp.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: CC56F5A4E57
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The v4l2 helper v4l2_async_register_subdev_sensor() calls
v4l2_async_register_subdev(), which is a macro that expands to
__v4l2_async_register_subdev(sd,THIS_MODULE). Since the macro is expanded
inside v4l2-fwnode.c, THIS_MODULE resolves to the v4l2-fwnode module
rather than the sensor driver module that originally set sd->owner. When
v4l2-fwnode is built-in, THIS_MODULE evaluates to NULL, which then
overwrites the sensor driver's owner with NULL.

This causes the problem that the sensor module's reference count is never
incremented during async registration, so the module can be removed while
the subdevice is still in use by a notifier (e.g., a CSI-2 receiver
bridge driver).

Fix this by calling __v4l2_async_register_subdev() directly with
sd->owner, which preserves the module owner that the sensor driver set
during probe via v4l2_i2c_subdev_init() or direct assignment.

Fixes: aef69d54755d ("media: v4l: fwnode: Add a convenience function for registering sensors")

Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
---
 drivers/media/v4l2-core/v4l2-fwnode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index 77f3298821b5..57284b7adddf 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -1282,7 +1282,7 @@ int v4l2_async_register_subdev_sensor(struct v4l2_subdev *sd)
 	if (ret < 0)
 		goto out_cleanup;
 
-	ret = v4l2_async_register_subdev(sd);
+	ret = __v4l2_async_register_subdev(sd, sd->owner);
 	if (ret < 0)
 		goto out_unregister;
 
-- 
2.43.0


