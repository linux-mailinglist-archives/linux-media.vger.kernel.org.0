Return-Path: <linux-media+bounces-20454-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF10F9B3A18
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 20:09:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0D988B214BA
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 19:09:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1F3E1DF26E;
	Mon, 28 Oct 2024 19:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="H6Ficmbs"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2049.outbound.protection.outlook.com [40.107.21.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24DB1EE031;
	Mon, 28 Oct 2024 19:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730142424; cv=fail; b=FPvCc5RKytrCaHBwoWJlRM/AdeDqrisHLdDeM/RUdEso1EYQ1ETQ9Z8BvYk3a/FZpd00i/QIBwW5eqw83uR3ipCfAlphZviUnTJBO4T/KLtwqpmCzzW3mTeb61kxaNrYd96gSJc2RMVQ2dugXNDtirPmJ3kBxVrZ5/toZ1q6AAw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730142424; c=relaxed/simple;
	bh=GT92jT/7ViUezaODGKywWl+0NPHnmKa1fElidxFv2iM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SeL1IxK+MuLfLGsAd9QwFx7o/YIaBuPLqEIye6hWAhHIzVX/rg9rwIdb/YJrAFeSIMej8WK/WqAQ/q2rpYtH+I6qqcvcwpaUs1v1xsGq1IwhGCggleV7oJAD6CIeYyUw8I6naDJ6JHcV+BC+WcBOzjMLKTOv1JkPzrOR884+7mE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=H6Ficmbs; arc=fail smtp.client-ip=40.107.21.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oAO90dSPxmv90CdC1pZ1l4U/Mo7u8IVKiYKt10RNjFGPnaFZ86Bs5+qNmqL92ZgOTWtkCM3wM42UuviY3idWAXfXUOLsiyjKNNLrM5M5ljeMk4SnrKtxxsxksUt6JBpH089fjeNiBIdObhFBUZt2/fYU7kUrJ0fquY2C+l/ID1ceaVfQJ44EOxRxTGngjXT34F+wxnAKNR5OuDzQxw44n2yrAiLq6BwtJxX5oNIf5TbDN8zUMLcOJNb/PN4bcHtNR0iKBRlqbfb9CdtxfoHCTqVSLsv0QQuKiSiSzL0cw6cYqvQS0Z06FFmHJn3p+qioN3+KV/R/2+mPn1UpgVvPMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0MWJbejlaqnRIGl/5+sopHRFBf7f6Ye7F/ymcSBUUmo=;
 b=aBnrb8dgLogM6fu2YKvYk/gFPix7csvfvk/8HFOS1yJ2r9tHW4QW4aUJxjAzfM+BmqnL2LNj44bZ49eEQYGoZ+ZTaPfEn7vUgN32ei7uem1oMcWdo1SnZaodQeGuR7MbsMMJZkxAwkjRyOJUT2D6KIdsYJtflGqJN3uVo5f8JUbZhGjf17Yrye1kwDPej91USG94B8uX9iQEyQAO/EzgW+xFksawPHn4x+sUAjyACnhS6OTdeU9um0a4jaBD+I+Rv2Wx+4zy+ylUN4rIEtyaRlZ2kQZaFBjBgA92S6hwM7N5x2eLo4JEWyUScodqIVRZGCuwn5H8jBvh3N+dnRsM8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0MWJbejlaqnRIGl/5+sopHRFBf7f6Ye7F/ymcSBUUmo=;
 b=H6FicmbsVBouU2KI2IDiTVK61bR4TIFtxuAYfkvvq9XMo5Me7mFwu76eGHyh3xu+vMLNkCLxJtTwSSFs+OI/Em7jREpqEwprV7AiUy8gaxphqVVDujysLBqM19PIpTXCHIuSgoNZid0THMLuECZ2uGh6217BASBjCnV8H4873Rj6DpJcLXqzBZmwBgCm955msFpIRzHDAV1Yb+Oeio8VCNicTRVpIMMl7iCuqLxGA02J6r/XpAM9QnSshwhUYjvacZRVG++03AH0me5EURmi+ZsKQbcFP7VwtDQ+bQBZgsLX7QLHAqUQoO/s20KJThtMFx7SajteePGn2D+YLXBP9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by DU0PR04MB9441.eurprd04.prod.outlook.com (2603:10a6:10:359::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.21; Mon, 28 Oct
 2024 19:06:48 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1%4]) with mapi id 15.20.8093.018; Mon, 28 Oct 2024
 19:06:48 +0000
From: Mirela Rabulea <mirela.rabulea@nxp.com>
To: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	hverkuil-cisco@xs4all.nl,
	laurent.pinchart+renesas@ideasonboard.com,
	laurentiu.palcu@nxp.com,
	robert.chiras@nxp.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	LnxRevLi@nxp.com,
	kieran.bingham@ideasonboard.com,
	hdegoede@redhat.com,
	dave.stevenson@raspberrypi.com,
	mike.rudenko@gmail.com,
	alain.volmat@foss.st.com,
	julien.vuillaumier@nxp.com,
	alice.yuan@nxp.com
Subject: [PATCH 3/5] MAINTAINERS: Add entry for OX05B1S sensor driver
Date: Mon, 28 Oct 2024 21:06:26 +0200
Message-Id: <20241028190628.257249-4-mirela.rabulea@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241028190628.257249-1-mirela.rabulea@nxp.com>
References: <20241028190628.257249-1-mirela.rabulea@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR07CA0289.eurprd07.prod.outlook.com
 (2603:10a6:800:130::17) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|DU0PR04MB9441:EE_
X-MS-Office365-Filtering-Correlation-Id: 17e66537-1ce0-4806-7f92-08dcf783ac50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?H7zO4S8TsQPbk7tOEn/qIyk7jugpBvT/a0S7h8F/1FEMkWh/VcpGmWc8hWgY?=
 =?us-ascii?Q?UEJGGV3nLPlNYnaFpUTht9paCE5JJXHByw6wb6bvaBDXHCuMY0IeZC6DXleW?=
 =?us-ascii?Q?tCxSM09IjEP0ofSXPdOihrxtbpPzpt6KX92Wd56qbRwD9Z0jxIYMDC3Wm6Tl?=
 =?us-ascii?Q?gpN+hf6V+3AZmva3aySO8qvsODH0pkas1ib/Hprn6fVjS/V+VnFVHJVoD1ER?=
 =?us-ascii?Q?YmWGN/e5FEN3YhNWKfQem16Z+22/guEpe9ZHUETC+Zx8p805dIQOnGrLHZKy?=
 =?us-ascii?Q?P2ZxRazOc/WAWZRxT1XUd8gfRFlrFvQ6dJ+IvOJ+0WjKVtH1pKHIJXPQ8O8P?=
 =?us-ascii?Q?j2/9k5ZvKw197r8MDoygBCmdnacGBsuVM4k28TsEdLNGBl/04zfExT3nh9T+?=
 =?us-ascii?Q?iMAzWnXJjvD1dbRy2z7G2CdyxOQz2Jt3E/mGUKee46aoyz8au4kcyHQi+tHm?=
 =?us-ascii?Q?7fBppDCJqEiGvcH531K+4S/q8W/XVZ7CLw8ZJAVxQTuAICRxpaM8LEQa1k8c?=
 =?us-ascii?Q?eaIDgQe4Nca+3AMFtuD8L/5GqqVwDYWAKEd7gWlPBvYAmCfKILqIatFJOxUB?=
 =?us-ascii?Q?5qrE8pMaX/nt+5QTUra5GuNQ8yXZgvXkab8OtmbgzlB1Um2qjyY90sndX7/D?=
 =?us-ascii?Q?wumbBie+tRw3Q7om7vT4koxBTQ7FxSNsBfwPEjiQAoUce7yiCkmpE80qSdFt?=
 =?us-ascii?Q?v3wh6f64AYQ7L0I6nHC2BDOIPAUyrYByiaJYe2tCOLTyQfetbMFBVxeYSPPI?=
 =?us-ascii?Q?aKi/9Ud91W23f51LhuyVzee8qSQQEBMvbtdarTys7xEmZvDSQZUbVv8uxVzr?=
 =?us-ascii?Q?4SVNHp4IjfTMWFIG5yzlcGbyu/D0HSBvmbl5SlQrKYDct1V41ZSXmlDM1xT7?=
 =?us-ascii?Q?OmyOTpTcsN5GhxGLBjBmsv7VyUhtKxm+cIvOi23hCw0cNx5i0rR5nUVC3FYY?=
 =?us-ascii?Q?GmygtkX5cf6Wwsfa10YpANVLBzhebsBdogK1fiC40Pl1zog8fm0ZP1R65V1g?=
 =?us-ascii?Q?uldfdpDovbmwsDxRh+QdFLAwifGZ3RWEDKcea1VfIY8J5vlYZOhcYXsVnfIJ?=
 =?us-ascii?Q?DYLvB1z79zNZvNYynG0EfWzM8ZFJDe6n3MH5IMoUvBr8w+PueSuiCNs+NIZS?=
 =?us-ascii?Q?l6QnOd/k7ZzhoR/RAXKLnG4DshMAideZjXViGdGOQcPbxsLERSpfbHtte+3s?=
 =?us-ascii?Q?2aaPLK02VhsGuplQ1v9CT50ASdyHhV3mhjkhxm9vOlveEOCiNaZYAB/nr8+Q?=
 =?us-ascii?Q?WHQyG9RnmolDw5SztABFFcwjQ+bffpENeQNWA0uTYdjBmdsTv9VXa9AW5QgW?=
 =?us-ascii?Q?3oLmPRZu8RTOeOz63VorbwOfAQNlesKqwJNfy6SHaR46pM0iJOcvISW9P4u7?=
 =?us-ascii?Q?+XTuOno=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?B9o1Qow3YjTJIXgixHVZqopHdzeE6lurmSh4W5f9PDoYZPwwhIZWUCBVrfW/?=
 =?us-ascii?Q?cBQ1q2jX1ABYNaN1po5CViGIzJrmwiZTcHHyC7/90TJXcmM64cfB8T0Q9PvR?=
 =?us-ascii?Q?DZl5k08pHrQ3VfDUOntAGUNOPvGK83ZWb0cU0bR73wrSlwPLtDsayLuWw/GD?=
 =?us-ascii?Q?szx4S9945ejpw78ZnIYRmepFYtTlO7bxbY5vhZB/Igk9VXyxAG7JOHrXR1fH?=
 =?us-ascii?Q?rEtl8YA3eY9OxW3Ol1TziL7rnsk3KeqvgNZZZ3wkygwyty+HAKNMl2cR5KXm?=
 =?us-ascii?Q?yFkHf3QOxF/MmzLALdvss8BYzJ5LS0o7F570j+bmq/R0RuJeUqIfhr99GJYe?=
 =?us-ascii?Q?nIoUJbA6EHSVuiZSeW0f2kxkpKlz8mmXNCluprV3+7zSuvQ/bqeRn9Xk0++j?=
 =?us-ascii?Q?z/JcENQcR8+bbJytOmCUDIkRkslplbRrvrkI3PebKKAD0Eq/fWqg5kDxLRZF?=
 =?us-ascii?Q?41g9EwRTfsaNweP+FhJcxGboWGy5p8lWyIrxBLdRE74zHLaFrR2nTRcD+ThG?=
 =?us-ascii?Q?G2OozB3sF5dIuBDkXfp5qt4lGmXtbyRMVrYS38EDXFaqUxCyW6R5bOSvgR5z?=
 =?us-ascii?Q?0mWaGABMYuZ3XmYEqwSU1HhhDL7v8id9udhp6kpbsRBeU9rZ1n81h3Bqe8ko?=
 =?us-ascii?Q?9olb/FekfsEYcIuuo84lNbWIMp+S8BLe8L4L0BWhLsHjl+QX5tUOLLLkAO9F?=
 =?us-ascii?Q?cp+2gSRl1LS5vXG7fMfuWdA6bFv6hbVOaxVIhaBPELdlTHDdNqvuS9o3QGVL?=
 =?us-ascii?Q?sIo03CTArYiZ1LEP5e5ysZnbHiMPob/ejoNz0YQxD0ohMjx5jtLucsbsD6bs?=
 =?us-ascii?Q?2kGzxgZXY0IEj9OQnXVpo08WPd/0u/5lA7A5bHtoTbxbPWkVd7DC5592DNJA?=
 =?us-ascii?Q?VZnIUPC+XcP/C3/errpFN9auEFSBk178xCLgSP7WSwsiXYfjT5HSuFfzK7cR?=
 =?us-ascii?Q?SWBQFAPgrQYHqSeEdANHhHAWfR9eCdd0Cm7j90vl6BEK8LQ6r1p68BIqRnBy?=
 =?us-ascii?Q?LclsCZOJZ9aT1Q/loSsKZuvhW0EHoIN/yWEAofOVyaCKyKGfbp/7PXqKESi+?=
 =?us-ascii?Q?U5S9Bwr1662IObH/RuXfD2LTuMmn677i4bcVV1EmpJ0wWuzMl2vdVVKfyFTN?=
 =?us-ascii?Q?W6Wv9NAa3cIDDqssZwv6Uaef9iDxKP/XMoqXh0LxXdS9qIti01TVWPn1dFp6?=
 =?us-ascii?Q?V+SdOOn0PNfTmaOXalaecbMiwLKHWT36tZKze44TrrEKy6lInRJKFMVo9aRf?=
 =?us-ascii?Q?On/IgANJwoPrjj4xAkKSFaUjtDycda44zMZN/Qb7dr/gsajNLETIWz6GHnmt?=
 =?us-ascii?Q?kN5uixlxu854A4Mru79dWs2q78ID+cFAu8yKPdA5FGNLHCh/bkL3xpcC5E3T?=
 =?us-ascii?Q?dlVhm+3B5YQT4J+XmFaxRTcBRyqmpMfKBjlEYfP5XmkrnAvWKXIFxYYruvny?=
 =?us-ascii?Q?T5btl0AIBLPvWJK4yRXGaBXCWD1dGkuhyBQmfmPAlwepJKMddLuzcoB1oNhd?=
 =?us-ascii?Q?IHYUNHGZscOESXPZ3+QJUkNCcDYwG1L+goZi35Vx2s0Esc8Par+Pc6YC+9T+?=
 =?us-ascii?Q?6RjTgdhQNbd/cjLluBWpeCvKZ9p41ChIU47ffo3ZbM0qfkWgYH9rzokeZKqX?=
 =?us-ascii?Q?KA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17e66537-1ce0-4806-7f92-08dcf783ac50
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 19:06:48.5503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r8HAVOBklXqgipN5t6sGp6gQop+n3X22OdXb5pB0uYCHMnD+GzWgwvQVPxlRA5AxwCi7NxyO0kcGlnD33+4iCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9441

Add maintainer for Omnivision OX05B1S sensor driver.

Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a77770cd96b8..8372ab4999da 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17259,6 +17259,16 @@ S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
 F:	drivers/media/i2c/ov9734.c
 
+OMNIVISION OX05B1S SENSOR DRIVER
+M:	Mirela Rabulea <mirela.rabulea@nxp.com>
+R:	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
+R:	Robert Chiras <robert.chiras@oss.nxp.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media_tree.git
+F:	Documentation/devicetree/bindings/media/i2c/ovti,ox05b1s.yaml
+F:	drivers/media/i2c/ox05b1s/*
+
 ONBOARD USB HUB DRIVER
 M:	Matthias Kaehlcke <mka@chromium.org>
 L:	linux-usb@vger.kernel.org
-- 
2.25.1


