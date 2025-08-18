Return-Path: <linux-media+bounces-40179-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 573DAB2ADAB
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 18:04:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10BDA5E7CA7
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 15:58:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 235963375D5;
	Mon, 18 Aug 2025 15:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="UdT8ExIA"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013033.outbound.protection.outlook.com [40.107.159.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B860232A3F7;
	Mon, 18 Aug 2025 15:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755532712; cv=fail; b=sZ9m9tVsuW1kLeDI/1kSwrneRX96Ky7GAcYWN6l0wA/dAbAWDHNqG7LSj66voG6vHpFn13tOMNH2S5JnXPljLmRz9lN2rqEb835NEFkglio1ciRrpvJB9XDuW2jHo24r5hCuO+CJp9Ey+Q6OqiYF2pNZ51czgELYy+lRGf06OPk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755532712; c=relaxed/simple;
	bh=WE2WP5wqPSsFCM6tFm/ao0oE1NLz3y8I/64LG1ujfKA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KohAf4ZkMp6lKZoLW8pIWjN5SOD6VWxIGTaxlJfJXl50bpN4YFW3g+P6uiFFxABidwEuHBb7PEp4FYogqCaBfBd0EX5JuaOcot/8Uj14zc2XoYxOHstPhfuzTxrVmgRRXysHedh33cg9zPK8JwHXe1ZT+ZT8EtPqd/eHSxAFlQQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=UdT8ExIA; arc=fail smtp.client-ip=40.107.159.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xFXu0FT5kolPaL6kbGqx2aV9F5/qh3ahoq/SSPX2JHFLC03XUYzaBD75092vhm0kpAhXUmi+qnzf6ZyOEdpysTcgQPetlNaShOadMYU1aISQZRlvBV7U98EAYxgIovSUVz2xBIIAUErPWDWLUcA4tIPpJK91m8tF079lRqmOz4ewNwVZBRWKZkEq/Pcnmu3v3MmyFNOlLoPcyddQJhVmlIIqhkELZ4DIBLqdH3NqqOD6OP+POs0NNbdkKK7BuexW9Xs5BtOY5QLUTT8zaSfoAp2SkgxUk1xu8a46axjKR9mwU64VppLJz3LByf9F3cTrR9NO7NsMadZ9SqFEMGjcIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sb+y8AMgm/Pz246t4tB12uMbVhe+DwkL/jwc6+YzkGk=;
 b=CE1Nge+OuvTsqyfDEQk05M2SHjTZ0p9LSs9Dg7JxCtsGW22mJJR3nb9in5pyUp1kg19QFh7fQdnxTAxhg+78A6XCFuy8x3O/dYPLVcu21NujCMxyk45xL0d3s+/pk1LWR/Bz98qTbkepEcfg5mls2drTt/S/E7AJDRiypAqXwRihHe2I2dHh7bmrFSTZXfLKkBQbbE2kU9ZhPXh1rEc2YI88euDAsb8SDK6EVGcJXH2tXmYABXy5TL70eHC8De9vJDXo6z52DmQtT34kK8J0qshbIMCFIzFDyhdyUldwm7VPzFzNQRm5L8vaWu8FueGcFk8VSJei+Kq6cGGSarmcWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sb+y8AMgm/Pz246t4tB12uMbVhe+DwkL/jwc6+YzkGk=;
 b=UdT8ExIAfyJCVOd6gocZa1hX8xtLVtoJ+mvZBwtgaR+r2ihFmPicXBD2D3FBV2KPNlGo0aYk/Ry2iiuyd7qhg+66/5xa3uTWqon3+WE6F+bTcy5xp6EipQp5JzVPVSZGzU1+JUj2WmVX9mJz7a5zEKp/zXIoUHFolwCgbWXGd+hzU4geNE3L7PVyILmMN6A4JRL8X6LPCerZ6FEH6mFtoCHVgiJYxdcDx3AJFTPva2CYotoVBy/QZNIpJRCVEcrTNOFCnazLIRfNirk7pqWc6NGieq+fTFWrW7dSPhjDiQlH1pde3AUVQDcF4OZbIduWFXM95ZL8VsKc+mXtXXtgQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by GV4PR04MB11305.eurprd04.prod.outlook.com (2603:10a6:150:297::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Mon, 18 Aug
 2025 15:58:25 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1%5]) with mapi id 15.20.9052.011; Mon, 18 Aug 2025
 15:58:25 +0000
From: Mirela Rabulea <mirela.rabulea@nxp.com>
To: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	hverkuil-cisco@xs4all.nl,
	laurent.pinchart+renesas@ideasonboard.com,
	ribalda@chromium.org,
	jai.luthra@ideasonboard.com,
	laurentiu.palcu@nxp.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	LnxRevLi@nxp.com,
	julien.vuillaumier@nxp.com,
	celine.laurencin@nxp.com
Subject: [RFC v2 1/5] media: Add exposure and gain controls for multiple captures
Date: Mon, 18 Aug 2025 18:58:05 +0300
Message-ID: <20250818155809.469479-2-mirela.rabulea@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250818155809.469479-1-mirela.rabulea@nxp.com>
References: <20250818155809.469479-1-mirela.rabulea@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0256.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::19) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|GV4PR04MB11305:EE_
X-MS-Office365-Filtering-Correlation-Id: aa9c23ce-6893-4be3-a891-08ddde701065
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|19092799006|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZYFHJI+WBJcq/pdmumOP1lW1eoNsqp7qzkc6beJKNlMkQQj+5fIfChc7LmRL?=
 =?us-ascii?Q?DnrqSnsw5sXuRMMCkGKhnRhuC857U/f/CWLoFC1LXNPoorjBS4ktq1idTudB?=
 =?us-ascii?Q?zVcMkKZdCuOV5ug1vSiL1+RgXUvgfkNC9FmaH7BA7HKArQTawqNgKIUl4J0J?=
 =?us-ascii?Q?Nh17Bb+fqGhYmHuFv1HuRTF6hB+7AdCyXSvX/LKXVkuvhS0tH8N3OOnmUahd?=
 =?us-ascii?Q?Em6KVwoGxRmLlLX6KA3x2XBGxmWGdqB2ox0yYVL6ex0ckrqo3tA1qVxStNvz?=
 =?us-ascii?Q?1GNzRMUqZ6uPRimVskkLMVshEySgDRWLaiKtW+9DpW+wgix723GbXX1FUKFw?=
 =?us-ascii?Q?U/4plwG9hDgg35AV/I77coRCEckp2uwjKHRuSbu+3yY+VbNIQk45UmZu3khc?=
 =?us-ascii?Q?sTdTxdQV23KbxvbsFUUdFYMiiib/6jNDy8XTKLDlm2vtvO1nXJrmti758yW9?=
 =?us-ascii?Q?a2aaOlL5/rv8tk+gCmOpDn0RRHn2RtZEM2Lgox55nebOAX8H7G+KNPyxqiPK?=
 =?us-ascii?Q?+/G5JJ8aaDKVkN6nGB1oNR1SiBy52OGUl05HCznEn8P76oX7YIIwtHJ10fYi?=
 =?us-ascii?Q?3DU2QXN4cLEIbGEubfUgMk66HshJ9bpdj5VdI8xLC9kaZwy7XfOL1eueBvpT?=
 =?us-ascii?Q?Ns6qzduSZBBw+pVqvnAuAITfEiIhxp4JOg2ZrOtJTl3nIffWGLx2RHVNT4Vk?=
 =?us-ascii?Q?WJJ0hP4bxY0cN+vqeOGF9ng31QhHZFVc2AUTSfKmeGJqgeAeI4W3JQjWTRvU?=
 =?us-ascii?Q?cij1c+3kCrHvUrd2eyxMxBupNCI2sjVWHYa8fRNF1vrxQ7PnDf4nflMtTHRw?=
 =?us-ascii?Q?HCjMP3aXBpm4Y3r8lQb7HfDEYl0Yqqtj/cZPN5zBJEgf9YapZVajlSEnTUxr?=
 =?us-ascii?Q?M6wtQ6uZyj6j6BnqQkd8nXCBSPoWpbSY+4Raf3g/VczzQqBfHmPx/nZlZTuR?=
 =?us-ascii?Q?wGiNk0JS1KTLIaBp3Ii6H2gcuEB/oKG9v0lXAHs0+ZKOf71ZFkYtZL9t8EXP?=
 =?us-ascii?Q?wZvy1hOdAhe4FajqYGWw9arNYJvhAQdyczbfqLJmbYQ6vQdeK5URXuowoz1p?=
 =?us-ascii?Q?FlX4t5ZahEUWT1I3C7tSLBjfYIp5JpRtX+m6C1B6zmegxArnd3Ub2tH34R5F?=
 =?us-ascii?Q?5tKOn8BKDMkCfUSmvVMAGoD6qVTQinPg/tZTZtTxgwn7hiobKNs7Mte3hPcE?=
 =?us-ascii?Q?apsXj7dnTnigIqaPy8rp7KO6Oy6YeayPaEVBNSDlncWxKBlMCDHvWVHZsfjj?=
 =?us-ascii?Q?oJhE8hkKmQUb0auXnz7RczRgGHcMmoMSjKJf3HshQdx6jrYoTO6j6kukmIJo?=
 =?us-ascii?Q?7Vf6mKy5kKjTSCNfFIYEe7gL9f5/8OYVD8h1gPn64Y/eKx8lSYA35KSEcWrj?=
 =?us-ascii?Q?wD5EAgmETV8Ym9He9NCbI6t1OkGAU1cuWiCah+J6KhxZyEbqjKuVvx4poQbg?=
 =?us-ascii?Q?tbMWtR1Ro5Fpi4yJtHMdij6nnhd2Q0lgda6fq+gJwb/jZF21/kawTA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(19092799006)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zvFhkRbaLQXAVc+2NMMypcR0C7d0a5P5zOfOPNr6LKKvbSmHapNc5nRsW9DI?=
 =?us-ascii?Q?/puRJzaZX1wsNXOW7/Sx+bYGRk0YRC2klgkuDrmhbhwdFvxk6pTLiTVK1p0E?=
 =?us-ascii?Q?MJZbmrPl1dXMJnZ638CgXDj3zYM12sG+1VeIuJrZalBmSUmi/sp72OSoAfGU?=
 =?us-ascii?Q?HL0UNvy/K8XeWVKH8FLHQ/2T+v6yJVY6QtSmgXrO9Oz7aEBZa9tV4gQ/g7O7?=
 =?us-ascii?Q?uV0jYjHYOPfWhUgdCDapxImOEN8qBg3nq4R0nEH8fnrUhJ2sx5RUOX54bw3L?=
 =?us-ascii?Q?8vGEtcnDT01H2ClSjQMdz755nSooOWvInujSZKcOeu6XRlExo5rR3wagRO/g?=
 =?us-ascii?Q?MkH7q5ijq085aAuISsE+/wxwUKo8bVZY9DK6xvxQ+27Mow9Ta6CYz3VOzrx+?=
 =?us-ascii?Q?Ag56aXu4BruarNgz5sqCcqUIPp4/DUiD6jsijPkAauuAuTPcu3UorwHSGDeG?=
 =?us-ascii?Q?8Fz7lfZ+AAPOs0NErmNoCIfIaJ1G1W0PVLQC86nWL/H1ajQFMJeyWduJiF1G?=
 =?us-ascii?Q?5Ct5wa7yoj4IAN0NUD5ibzuwx7EUC0QC1PINPobf5sGgdn67Rbv+r/VynptJ?=
 =?us-ascii?Q?kdOTSr2fmn1W2hJaTDKcNsDz1bvAKcA/53tXaDiIY275THMr6E1N1wRDXazI?=
 =?us-ascii?Q?j1ba5qTbiSuLqanpvm0L8smfWJTwFkxR6YlxO1djYZQLluNF/C6kUvpzh57q?=
 =?us-ascii?Q?zu7AUBMIyacF9vHXDWqggOwTEOaadQ0qTtX3umYMnXIsshDxQxzvEqp5810I?=
 =?us-ascii?Q?H0WLXYFGWAYvEfycJJvyao1Qg3QdglDEQnYksTuziU5z3VsBkeZtnTn2ynQN?=
 =?us-ascii?Q?22UsJj+mTDPWAVP7xq7h6hbleXmYHwelGar6GxTx3Drvg1M1dq4LPL4NjXXv?=
 =?us-ascii?Q?IBRsjGftOkIAb+Fg4HBYnlUvR+kaZsmVjlCfK3pH6YQ99osygJJd8I/nVeww?=
 =?us-ascii?Q?pM0Du2/xTOG8gMi0XN+tOU2XqeW+qY/m9LctSUcj9Wf5gi0Q84FYZDu5bvdl?=
 =?us-ascii?Q?hwcyCyzijBHeAUwM/xzxV0xsJUnspmCL2js+w4Dc/m6tZhmaALH0+KofbBy8?=
 =?us-ascii?Q?3NZN2DcrpsC1syUFjux7fBEYiTD2bjuL4Tza5xZCbEfeWDGR9ub0JsIN4VpZ?=
 =?us-ascii?Q?lJJP7Mhds2J/DQKB/f65gzBdQlouFvdEJnUchEtjCcIDqPu4q9p8B8SDvpAd?=
 =?us-ascii?Q?qOJQMSrBdq+ywrB+75Ej0il4vXHdqhOeCklZcFPOkqeis7M/Qrhm5KdOY49x?=
 =?us-ascii?Q?LS1dz2+OBhpms++ZtjLqBhmDyfen09LcbZSGjCj7f9lF44Pmmy6XNBvuM88i?=
 =?us-ascii?Q?MUtLLMfgA7MCMN+HSlz9nuuOL0Z/IHw5oTD7YuIrzpxZwaIdNYi2bx5K7nG0?=
 =?us-ascii?Q?OoEqv3TjcDYiF/a7CLG1L45gJP92B134hoVnXc9Hefvvhkvt8BRhOt8eqftE?=
 =?us-ascii?Q?QrS2NjsLQeDvGaMf96tuimlQa20fpzf4uGR/JD6A8+/22OtbpV7IFShOPKhj?=
 =?us-ascii?Q?X2L6Fu0DBHKgwJCjuxxLvGW7pcmSGmT466uOPJv8EPExw0A2M72wr2HM5Dma?=
 =?us-ascii?Q?dQb0YZCrI+fwFXd30zxJXbXT6WqUxbWXOAbM6kLXCuxO1HdSHY8QvN1/GNZ5?=
 =?us-ascii?Q?Gg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa9c23ce-6893-4be3-a891-08ddde701065
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 15:58:25.2043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wOdjkCHfC+ZLltk6jBzkSorxX0UHlaofi2p7wxVINcURY1hQPUDZvJzwv/HygJHO4x7+v5wZflK5L/SK/qA5Gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11305

Add V4L2_CID_EXPOSURE_MULTI, V4L2_CID_AGAIN_MULTI and
V4L2_CID_DGAIN_MULTI for exposure and gain control for
multiple exposure sensors.

Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
---
 drivers/media/v4l2-core/v4l2-ctrls-defs.c | 8 ++++++++
 include/uapi/linux/v4l2-controls.h        | 3 +++
 2 files changed, 11 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index 1ea52011247a..65c468a3b01c 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -1155,6 +1155,9 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_TEST_PATTERN_BLUE:	return "Blue Pixel Value";
 	case V4L2_CID_TEST_PATTERN_GREENB:	return "Green (Blue) Pixel Value";
 	case V4L2_CID_NOTIFY_GAINS:		return "Notify Gains";
+	case V4L2_CID_EXPOSURE_MULTI:		return "Exposure, Multiple Captures";
+	case V4L2_CID_AGAIN_MULTI:		return "Analog Gain, Multiple Captures";
+	case V4L2_CID_DGAIN_MULTI:		return "Digital Gain, Multiple Captures";
 
 	/* Image processing controls */
 	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
@@ -1607,6 +1610,11 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:
 		*type = V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY;
 		break;
+	case V4L2_CID_EXPOSURE_MULTI:
+	case V4L2_CID_AGAIN_MULTI:
+	case V4L2_CID_DGAIN_MULTI:
+		*type = V4L2_CTRL_TYPE_U32;
+		break;
 	default:
 		*type = V4L2_CTRL_TYPE_INTEGER;
 		break;
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index f836512e9deb..6583c7bdbef2 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1226,6 +1226,9 @@ enum v4l2_jpeg_chroma_subsampling {
 #define V4L2_CID_TEST_PATTERN_GREENB		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 7)
 #define V4L2_CID_UNIT_CELL_SIZE			(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 8)
 #define V4L2_CID_NOTIFY_GAINS			(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 9)
+#define V4L2_CID_EXPOSURE_MULTI			(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 10)
+#define V4L2_CID_AGAIN_MULTI			(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 11)
+#define V4L2_CID_DGAIN_MULTI			(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 12)
 
 
 /* Image processing controls */
-- 
2.43.0


