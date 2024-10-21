Return-Path: <linux-media+bounces-19964-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 726FA9A5AE6
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 08:50:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 933EF1C2152B
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 06:50:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 655E11DF987;
	Mon, 21 Oct 2024 06:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Gq3+lbWS"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2050.outbound.protection.outlook.com [40.107.247.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9D91D130E;
	Mon, 21 Oct 2024 06:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729493276; cv=fail; b=pFsWSRw3KbHbdWzpketacGPa+bV7ojmZLMELJmY4A/b3BG7387AAPcgQLtDJ6NcX6yxhzmOHe0W8TwMcI5nbRWYuizAmQBy45n8BQ91vqNpkC38WmDo/zDey+30sjwwyPUaA3Af0oJSYPRBwiHT937P0uLx0X6d52dafuIWjYnE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729493276; c=relaxed/simple;
	bh=4WzqXn9R7wYAgO5ROHfjEScsQCr0djY4MYs6rZxoulw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=H5JFUxqFJGZMHxMTGx4mgJqylLMo1whXY3PTbKQM4+5SwneYfQWOnbmLwMQmVemsE0MTNXq/maXHjtOIGbczZk4aso4CcH1O+lnf3RzbmfNrfkVt42YBSTTZ9LP6hBxIIjlW0v6ChegQHNvOCJ7SZCmZsLw1hc4rbpXos6gXU1c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Gq3+lbWS; arc=fail smtp.client-ip=40.107.247.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jm2WN3LimxlYUHtEKVL0QEz+B0GsS5tBGxIWZDYZ8IuM1k3Rnb2buXy8lrIrc79Fju0sZ8FL4zLLWZZXPZjGDdBeLHEdw5FHQAdaXR2vUicFplBnRtaB/eRewnxKgbz0xj6TSTumYcf8Z2oF6iF6/LAptc7qI12nsaBH0UyyzzeqQqxE7mTYP9/vxKNCoO3+oylzKVfwN3AsV+j7+baxKlEChyrepSkeJOczSpKCjHYlNfD4f79TCZjSKzMX3dYNG/13g0GY3XJFJYo2F1X/t+Rbuc3FqTR81WIPOz+JkYtf0oBVi0WozmzAf9aoeAC/rjjmg9qpQ4FvkE0EkynOsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O/YWO8KAng8wET1DAqIOHkQDWpD06Wb47nIdw7i8W9A=;
 b=acQK5OkKrk54/7r4VBREmRTPxagzz/x1fK2TE+BfKKq8+F6Flwb3zY8dA9nlRNJIjqOtdQ14r/sbpX0jmc2ITIOxvnvOFSesRbg9jQumQLjI5ULREpLF2mxAbs3ydvqheVEf6FRtU+2CcTkuibopFXL6oLJhT1gIPamJw2i2Wrezysq/noEZcNQorNLDOa0Ql3//tcZRG1NdoDKXfo+fVdYX7X+2CtlOupKC3PYeASjN18K1A612EMPSrk576j4S083YF4tLlU5LYq6kfIFtfNtDEGjWfaP6sC4jVWSEZCs/7G6WG4ilTFhwBoA5R+76AudJfw81u7TO92mqcTxfgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O/YWO8KAng8wET1DAqIOHkQDWpD06Wb47nIdw7i8W9A=;
 b=Gq3+lbWSb8LvassGiiodbO0cHn1WWg62wfnHP2tJhKcmEwa0L6nCpVAWai6pIxItU+d2lD6YNNYynBpcj/idElthhskJtC1/Cm6jKkRPOv06QhurkdTekOsaQyOY5Y7USduiFLcZFhGlxO+obR0lnHRP7qHWdSrKnjmtQCeH3YeKYq3LmKw8NMIx+8q8BRZcVDxKm0MLECYLF6SOw3nrwgmxT9j2WtvRpxkZORmybOwJbWytjjPt5Aw1dFjkfZNP6aX/eD8Y+3B6q/ztoWmz1pydOg6BOMUP9DBBscH5MMzpY4uoDZW9GOnPrH8mDfL93fknVdbsuX36MDrffYtK5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB8440.eurprd04.prod.outlook.com (2603:10a6:20b:3df::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.21; Mon, 21 Oct
 2024 06:47:50 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8069.027; Mon, 21 Oct 2024
 06:47:50 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	quic_jesszhan@quicinc.com,
	mchehab@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	sakari.ailus@linux.intel.com,
	hverkuil@xs4all.nl,
	tomi.valkeinen@ideasonboard.com,
	quic_bjorande@quicinc.com,
	geert+renesas@glider.be,
	dmitry.baryshkov@linaro.org,
	arnd@arndb.de,
	nfraprado@collabora.com,
	thierry.reding@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	sam@ravnborg.org,
	marex@denx.de,
	biju.das.jz@bp.renesas.com
Subject: [PATCH v3 14/15] arm64: defconfig: Enable ITE IT6263 driver
Date: Mon, 21 Oct 2024 14:44:45 +0800
Message-Id: <20241021064446.263619-15-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241021064446.263619-1-victor.liu@nxp.com>
References: <20241021064446.263619-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0111.apcprd03.prod.outlook.com
 (2603:1096:4:91::15) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM9PR04MB8440:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ab2ff5d-821e-4a08-d4bb-08dcf19c47b8
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|52116014|1800799024|366016|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?i6R0vlOFr7jo1YE123EU9KkZSlvjNQ/azKeeJAJNDm1RBLfF1n+a+nRI27hz?=
 =?us-ascii?Q?PNzCCeHp9TBHwhWD9bBQaaPSBQ8hpAaUK4J//o0MrCvpfUVjED1GlUgHoEBL?=
 =?us-ascii?Q?Ejk58XDEc93IeDOKC/bNhc8I8PEY4+e4wh3S+F0TABrgfTBCLq6NCb19mMqj?=
 =?us-ascii?Q?XM4P74foPrPxJKEbgnEGfExiGP5PlIZczbSg8EtvkFCFsp44W+gpAR+7OC5g?=
 =?us-ascii?Q?hxZ82wHdmgWt6fF30zyWtGL+faSaUpAhcnjdRE3KzQ79TTS7Fsgpk/ZP49oi?=
 =?us-ascii?Q?DKd15ziJNbO0ZhxT2iweilpR6vDNLIYd6rd1PCTSocs5nRI1WJyQYAfQDRKa?=
 =?us-ascii?Q?cNxW0tRBb07aNGiMLMtJZKgX8BYBppTLpfWXIFqi0dP6Wn+ouDz8v7ms8nRn?=
 =?us-ascii?Q?bW6kRGZhXFRE6HW3d2UQKd0XRmPAV+4bEQP2fjEqDm7NSVf3hQG2AqCSFqlW?=
 =?us-ascii?Q?Rgu2S/Y67oZx7ADlKqJhcBBQ3WPTMkCPjvYisH4GsxY4UduG64q93tvxJwqZ?=
 =?us-ascii?Q?6gwa+hHZlwCPjlOE+fugkIYow8iktbe52P4YFNMogQsttbSXb7FwBuxcDW++?=
 =?us-ascii?Q?Iq2qj1F8vRyVRh4NE8DOu7U52WIMJpWZ1V9A3pm/gMkGEOm/4gMOtLGsuXwD?=
 =?us-ascii?Q?ZRg2xU6BZicIeM+fsZ/OpvkrsIstU4thai6Tdwpnk0oO3Ek17RbBH7K49e8g?=
 =?us-ascii?Q?tD0X4QCdMJ+XsliHoKEIz9ku+MPYu3oqGy8enDTePG77TNlDejYn6zPCkden?=
 =?us-ascii?Q?RWcTiupcWC1RvDtNAzm8yEFONWElgvVBAgmPOrAd9uez5qMbZ7/oXl6E2/o3?=
 =?us-ascii?Q?7z2V6UdXM2zzNWboKTZU9IhOQLGsCHzfElAWgWRJcAaZN7P5n2uXuXtFQJVE?=
 =?us-ascii?Q?hs/8t693vwQGK3XRVZQRQkTfIf1sZG2Tze67wXfqIunODUc838Ip5NwGuCKX?=
 =?us-ascii?Q?3D47zcCGcDEhJ90z+ONX1HL6EGAWOhD1emQDFJdAJXLCWDc8Jhee+b8yNSUG?=
 =?us-ascii?Q?WPupGZrJnVQwK/xheClrA5CLMSN7kHHwgt+xNCS5nYOgNeKnBzv/2ZTarS49?=
 =?us-ascii?Q?76pf0dZzIwOV7L+jJlB1R/S+VuSZclbxE5q6G27SiLQvj290GdBkCLbSnHZw?=
 =?us-ascii?Q?1gQyyOpVcBdfeP/yscZyA7WC+YRCkRsdhFm+M5ZHl1QQO0BlSKFdItYpQa3T?=
 =?us-ascii?Q?8CTr7wHKHpAmddm8cjwzQ81B69d4d1nXNdR48zjX5xnU6Xs14+3Eoe95XWCH?=
 =?us-ascii?Q?VBl5oAp7rP5bfsh9Z/qCpPrUb5PkxM55Af/WaMIwfW7EJfyUIHBsc0lc/so2?=
 =?us-ascii?Q?ApUuCbSTMl5EktG7KVjCSjW31M2ZBEfYKzc7INmBHtaIdiezw6fPHNU4a2xz?=
 =?us-ascii?Q?609oOT4=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7046.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?RN+eyPUqPKwwo1eXquHe6WGjVbEhnLymJTOufpwe48FQPTJbAyo/ZXqEzGuD?=
 =?us-ascii?Q?kL2F54W36Mg0gJKEZRaejuRrReHDTZUdwg3u647UOqcfrEVTSxgU+SkAr2fe?=
 =?us-ascii?Q?xGVHj4Ece1nP1FJmwQNic5nwfGlN21VuiRto9n1vC2Je4yVjAuZt5mcZH7YV?=
 =?us-ascii?Q?n+Pf+HikNF032Wr0kOB84Wf0AVhhSy4GGteETnI/ZzQOmU7d8iIINRGhM75P?=
 =?us-ascii?Q?QXalo8V2WyYh6XaBa50wp9dlgcznVoeXcce09xRH/t3XOzMWssU2bVyfNCgZ?=
 =?us-ascii?Q?wAOYOM1xIKA00tb71ON+4QUW5B6sTJunXiLB7exWILCeacdI6XJGI/16Tc7U?=
 =?us-ascii?Q?tNugoZVcQ546XETGLSVrxSBEeKeY6yZ9c4yShrZxVDJ9IN3ig9BdaMAT7P3V?=
 =?us-ascii?Q?xbwXk7gzzU5nf7IChKrqTcAt2nnsHNtqTLrpN3falX7ju91sSpl4krWLOAn/?=
 =?us-ascii?Q?F4l9LK7YUTr1HPaLtPynASdTJKf7Weqr3LCH7k4Td229PnixEzzcqyMJdEm6?=
 =?us-ascii?Q?QbpkzSH3D2P2Z623mf3KshqhOPfZj9+HvmQ19hsLKILIKnhg3X/Pld6NqyZh?=
 =?us-ascii?Q?LgRwcpKrXVpJnVlDEp7Sy+KIu8FWs7L23xnygCT5LCI6HY38HGRue2SkVKVr?=
 =?us-ascii?Q?67U/d9maa2mJQKRiBe+ElJs7VRqRggooJ+HrEs4T7PcTx+pAmK6IM0zhpoXo?=
 =?us-ascii?Q?AlUhSKHYNUulyCp9nMXqVaSi8D07Is5Z0W4cXnLE53/vGPoZ6E0Jk9ssk3mc?=
 =?us-ascii?Q?+XvEINdUka29/C8RqgcO0ivw2sCv6mAhJAyMhFThLdGe/TUWQdifUUqBuEPj?=
 =?us-ascii?Q?srHPIRbx0ugvxxykkq/xUnPvR5MFTnQO/o25u6nIjhu11pvQPA6VrkXyXEz9?=
 =?us-ascii?Q?/i7joudnkq6FpvlAp5ZKVf70E0vdiedzNcDGVHTfMqVnNEsXkaskqDG1ig6D?=
 =?us-ascii?Q?hfjOcV0IXyUkQQd61O+mVmEJalXKtvDlvJ0tEy0E77RWExTkCawuzKtd6w3f?=
 =?us-ascii?Q?KZ9qAbvL/nypxqfT0JrxFFopcdfGiJDD+Q7zkmjyCz62z8PCDniZB/cA/EAc?=
 =?us-ascii?Q?WaOcODY1HCqaBWPkoQ/NU/qMYfreSAbtnEyAmCIyhsnAHWU9p/Dmc1CvnAP7?=
 =?us-ascii?Q?2U+y+jgNluifKMRQPBJW5gfBbvB8r7999Tj6dHosQ6Zn8sOUo/7QfK9IfCuO?=
 =?us-ascii?Q?3ZkTxI3KVL5nceehrydzKlItiHOGsczIpVbrdGbcC9SIuQdVH1agt93eoaiI?=
 =?us-ascii?Q?f798SeUakGIs4u8+sU+vgRLqs+IeXy5dmpbyHq6TEfg0rgmass27sPmz0/o4?=
 =?us-ascii?Q?Skv0n3L8XU4cHI8LuYBVd6weG7JV4c6jG3QqFumI2117zLIskasOt789JXaJ?=
 =?us-ascii?Q?uLtRfPagnjXpdXWwQvvCL6bSKAnQ7R/r3DFCsMy2q8qG/EBGKkVOMTgieztJ?=
 =?us-ascii?Q?dHLung0d6wW2a3udWu4OdDdZoBNcmIZ6nsFEPzkjlCQLSxZ0IUk3AuBjeCex?=
 =?us-ascii?Q?MQPn5qwcdrqI09EWCm+Gra9qDpjyX7bYA89DEyUrJR33SYw5XD32xRraI3SK?=
 =?us-ascii?Q?3eMBZTZd3MOb6W1ccuOaQpLtvhYxP6zAN9zAuVGl?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ab2ff5d-821e-4a08-d4bb-08dcf19c47b8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 06:47:50.2773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kO3sTqULEO4128OtGZK0oqIdTMQ9ju0XOwiAdodAUq1JaE5vR3MJlvGIvCQsGkl2q7HVgN2nlVjRuJYaIhdCwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8440

ITE IT6263 LVDS to HDMI converter is populated on NXP IMX-LVDS-HDMI
and IMX-DLVDS-HDMI adapter cards.  The adapter cards can connect to
i.MX8MP EVK base board to support video output through HDMI connectors.
Build the ITE IT6263 driver as a module.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v3:
* No change.

v2:
* No change.

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 36b33b9f1704..d249df72e2bd 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -899,6 +899,7 @@ CONFIG_DRM_PANEL_SITRONIX_ST7703=m
 CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=m
 CONFIG_DRM_PANEL_VISIONOX_VTDR6130=m
 CONFIG_DRM_FSL_LDB=m
+CONFIG_DRM_ITE_IT6263=m
 CONFIG_DRM_LONTIUM_LT8912B=m
 CONFIG_DRM_LONTIUM_LT9611=m
 CONFIG_DRM_LONTIUM_LT9611UXC=m
-- 
2.34.1


