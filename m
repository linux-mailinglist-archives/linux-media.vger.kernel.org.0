Return-Path: <linux-media+bounces-48700-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4134FCB8C6A
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 13:14:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CDE2D30C3C8F
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 12:12:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 708CD322B6D;
	Fri, 12 Dec 2025 12:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="U5ayIK9W"
X-Original-To: linux-media@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011012.outbound.protection.outlook.com [52.101.125.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22EF30EF82;
	Fri, 12 Dec 2025 12:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765541540; cv=fail; b=TuICCxyNO6Rqlr8tR8JvCz+xlqBKHUlJYHC/I+pps3Ijqr+hBuSKj3n4YEIVhl/w4aI6PROF44u08zYlUIAj23G2wqsDMGJP1zHDPW9AL1dXcjCmLIa39BinYYG+O6opJAL96/w20gQCzr/Hr1HE9IscQicpTGaODFVlR9eTwSc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765541540; c=relaxed/simple;
	bh=J4V5mQELq/JhwVXqRKhyzEz3CjNKgCjH7wO4qEzEDLg=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=JoQ4trKjRBy4OilYTndegrb2A3TO8xYWCUCYW+S/DmIi850Sy0Z+5EqSGBFpOdaRAKgFdYpL0EnJLIr1J4WXoGpoFwQyrTpUHLLW50pv7BFLFU4lDZ7a7nBCFXE7DMmEXBa7Dl3JcdiOkkkVvj2vcfHAZ3kXLw0HHVRarTEbbVQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=U5ayIK9W; arc=fail smtp.client-ip=52.101.125.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UmKIuG7v4PiU8YcleYFT7Et3+R0dgDXo7E1hYGW+CzZllqoDaCahw7GW60RT3Y1pJ4CakC15U4Dugodu352W1hKYYJeqTX2rZVG/yXxRgddYV4bozwjQLNJVqffwG2dxdLhRj6sU24JP00fARbsGhrvhYIJRXJpp5sPCrjCajLgXvAttmAvOYpsJpNTUCAoDd+zS6PSJz2WGh0CeYSgFHlu6xIi8WM9gbduLFtISMSKjNal5EH91dvbYnykfTe1PWYY70PIITmdZbvQAOPCxrjlKKd4T2DDlFb+l75GB5pQPK3GZcwMIum5PJKMIYY5vgkYNu6CpzJj5/gzBniQHyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5OtuJXa6v+hbP2niLTpn+iIS3BKAioQTgy9vFsEt3Z8=;
 b=NZ394VDSdAsmmekk6/6mhzhA5KD+I/lLm9tkwIAue0MDIaIwY5FBoAu0u5P/K8ZCTpFnOg+htQyaeK6I3rPMbbYqanXVqZXS6zQFYSeu1CTZpEs7J9kiYKQtcnDdMdx3bCJDy7LUdGbSnI0eyQpNQwuh6L7hMsAoWDrAnCEDZHMd2mZ6aGqxFreKcmlmIh+0u2FBsVaSTlSWtBQbsXLJ/xJ+ZVmfmQUY+IOV7sLUSq7VZz206GpFAPoEn3z1bI4JMr4IroszAiIOFkeMaKtKbUpvnAuaAl/amEjFCbkiaB8bGRP9JbFFDwPZdqWR2g4KCIDyV6qsHwMlLys9Au/l5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5OtuJXa6v+hbP2niLTpn+iIS3BKAioQTgy9vFsEt3Z8=;
 b=U5ayIK9WVoYAzlPjqeFiwmPa9+4HxXBSEwXWw2vcbaJSs19IwUoX0GbyVrXAwytnbtSNfzJJHd+hiOBbqyejJPx6gfM2rMeGG4DSOewk/nV/7cQ15c1yXsk/OiVlyiXRxf421/ywOMGn4Qhewkve6lGW9QvQ6q8JKeu33s8ju20=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYYPR01MB12888.jpnprd01.prod.outlook.com (2603:1096:405:15c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Fri, 12 Dec
 2025 12:12:13 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 12:12:13 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: renesas: vsp1: Move suspend/resume handling to LATE phase
Date: Fri, 12 Dec 2025 13:11:50 +0100
Message-ID: <02669d4630e04fe24c17dd2576ec8b27ded458f0.1765541401.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0065.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::11) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYYPR01MB12888:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c9df833-f6fd-4738-164e-08de3977aeab
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?XJdZ0a0oK9gF4r4m+Tqc3Pyr5em0gz5la2VETULGDvFNRLHTPb/gmAJt0DPk?=
 =?us-ascii?Q?Pk3buLKU/uxFmYuKF38R86+Lsm7iWo4IKQaDiUULvIORJ8fl9U/KLZ6+95Gn?=
 =?us-ascii?Q?+4hNyV05p0aEplQC7WLKXNuD0oSbYAu/X9FB9z7NWFagmgR9hoAhW71YYJoC?=
 =?us-ascii?Q?F5r88QOX6ZtvURNr9/AofXXcNaVrDoY7YwQfGW2AlqGwzBxq3NVR9dT3eQt1?=
 =?us-ascii?Q?9gwf3dYXVwnngWMwPVETKOQMjq8czlfh7M3gdj40oI2SIsR77MNQj+lIyNpN?=
 =?us-ascii?Q?B+RuEwTjfscU4I59ccjkPX5vjiEAU5yOsU4bJPXcHXvhyvo0+5cM+zGAPg7h?=
 =?us-ascii?Q?TEYrKaizjaIxeYLi467SdfKzd8MmvLwgsb0s07h2OAXo1gqVSJa6I0ZcCtr5?=
 =?us-ascii?Q?//Ggb9vS9Z4edufNAgQzTRnJe9+IFoKzF9LBuF0EY+ZZdJLuD7qjkyNRpDXD?=
 =?us-ascii?Q?jJ1M+6hQegWo6mr9p+WKaK98IOobjhVEVxLBo6XD1Xd81WboI02c+6QbOqm+?=
 =?us-ascii?Q?lOE2grh78RP1Ho1Q3XHIL0uJC9qk8TuAupvytg5Y2J0DyWymz5UC33npMj43?=
 =?us-ascii?Q?ZzRrY9yXWrKvLFdl5R6Iw+WLBelLzwFKaRk9V9/60VeGUag3XX/SzXFtulfl?=
 =?us-ascii?Q?rlNoj5zNXNZHYjTpib/qZkcLdtqYEGqQutDlJXSpUJWLrJgeyT3vThuPl6wn?=
 =?us-ascii?Q?LBxzqCZW22SWteGcLzw9/tJLN11rcvoNWHvn2VsyXHsHZJxGPQm0uGx/8QZJ?=
 =?us-ascii?Q?awWqDiuTJA3umxMRwWEtuPbYeapZQgVEI5yUJQBDrcELg/Rcr+k+Iq3v9POQ?=
 =?us-ascii?Q?8cDlNuUfpN5lSDmlqPMkrjlQ92LRLvJ43iZW32GEPQm91ws0R6k3G5+ZXF67?=
 =?us-ascii?Q?JmmQthT6WkP3ZsOYKxi0ycOHL/mmWWuFYWY7Hw4cDT0RsNMENGXTcrFeh6dD?=
 =?us-ascii?Q?U+I5nrRNNnS3IrgP2jSm3vrAKXx9BHmSRsmP2+vOECcnJlxwdhBjJKvIUYgE?=
 =?us-ascii?Q?WUAHd2URqDcnNFqOZEuwoqf08CapYT4l2azG/m/Km9pV6bMeZ0Mkj9hTDVcl?=
 =?us-ascii?Q?00EAyz4mi8qfcW2YOCt7VB+H2ID50AOrWZK/uFQ/MaR8Cove/IiAMOz4KyZf?=
 =?us-ascii?Q?TZSRXYXqoi+JN8YA/1MDFnmi8hbuFMJWlmDSBuM1vvCorKKa4QvW3N7uWDu3?=
 =?us-ascii?Q?hILdpy6pLY6vVSlj2QHFcy5bIthIlVQLQEpjhQjFsaIMgjsDPvf2AyXQASOd?=
 =?us-ascii?Q?NyS+u0v+GJakqDs3erXqbPjgU5/EYJMaXEFF75bgxG6Z5GvPqVrDfftqI69E?=
 =?us-ascii?Q?QNJLP+H4bsxKp00uCbCXpP7rpqhpRDcj6m0PnkYuF901bQUmrHcsgJbwX4H9?=
 =?us-ascii?Q?LsFpSS7DurwSvczNeG8x36N+A+gYLuGMalTWzf2ukq+pPxaCYhkj3AS4GCJS?=
 =?us-ascii?Q?qTWDH08vFR3Nj73Pcai9Ou+04d8K9LWrOv+CddI49ytHWCtwiq1jXU9fWB+f?=
 =?us-ascii?Q?3BM4q1piL9BmWEo1f9xmKyopgKaYUaNXrbJm?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?4ysDtvCGgseFR/LX9tVbdpz7x/h4Bn7DpHt0yDsyAOjc8Z1YnVbOPM/BqLww?=
 =?us-ascii?Q?V9hXIMuj/Z5+rpe8vuTRZCHkRGVjHOp5dU3vG7z0JOGB3O89t/IF3AJvOG9S?=
 =?us-ascii?Q?/KrNoxafNGeJW6SiygWyIjT519VDpFmB4L3S8SrJ41FjOaVv+2PeVncvJZVL?=
 =?us-ascii?Q?JFDUYhwCcIQi2I5Fc5yxrbvy+9VnP9/folSBL7nBvXm7dHBhtDwRiFsXOwXA?=
 =?us-ascii?Q?rfJ0bZz0Wc9M+Uyc2IRasRsmI/plZ+1cwYy98eQJCNfLwtNJRsqtASU0be1Z?=
 =?us-ascii?Q?9RsEx3/wBFNXfQ5SQYtHHwMkqqaw9DOecNeGwgwlft7gRQJgpShs5BjFCMN1?=
 =?us-ascii?Q?OBpxp/3CMg89SDU6Zg7qNBFErKUq+B3T/axBYYAMEYWAW4rHSJtbeujH7fot?=
 =?us-ascii?Q?TMcCia2IrkTzzirEogJTVt0WWwmoLbnMe/0ErRUkL0fpVRH9tItxF3sjze0y?=
 =?us-ascii?Q?V76NqwOC0GW0LZooxDLT+AbnrkuIM+miVtWx/gKtPkeqyKiqEnikPj3oVUE4?=
 =?us-ascii?Q?s0NFuUEE47+VpfLOJib8y5kN8eJtbrfZ1ewGtRdlxiLS7c1lSioUKhTWvvl6?=
 =?us-ascii?Q?QhwQsXlVUqlUT9suYhpWcPYbtHwIVzIKm7iVR1297Nrl8sHApHXskjsxGVi5?=
 =?us-ascii?Q?1j1HMYmWn+NQ+82vQj499IVL9C7AvUxgCMV0FHGRaQE0zHBvRiE062fpBIQf?=
 =?us-ascii?Q?zLe1RArn4pNx3X7W8yvyiV9ArxzBoX17z4f/il7qbdpicYDpuU/pPKIrPWXf?=
 =?us-ascii?Q?X8r5H/hqb/T4Jh5v9kaU8J1MWIleYP/5bzxbqcetPVBBA4xDISj43ZvN4le+?=
 =?us-ascii?Q?u3YhOm6dRSQy+8qZ8frz9ID3UYSssiQG5gUbyWo/ufuXH+4tMWNupOcG/6Z6?=
 =?us-ascii?Q?9ibkqkZ59BpccjjU9WqJqCVEdbsvG4u2LwVXRguOw13iuS969NWWefapLSDy?=
 =?us-ascii?Q?Sg70B77TO8hy3PDLuukWe8HWRND1rS9mr31ggPo7LC7T5CGpqx6QX9ct2iFm?=
 =?us-ascii?Q?KAjBNthjwc/E0rIckNaSTlwXTh8ouBz/PYbpIfvDdJpF+P6xFNR0v9baiqfs?=
 =?us-ascii?Q?OoIFyqB8xaj/8Q9BOlScxlfAQSrz8uPI1du1QMk/HBFtClItfZ2LYN0V7bM3?=
 =?us-ascii?Q?0v2rMKZ/oZWVkE6a7hawvTmtQsqUORQAs/xoTGnfuLQ3h2KlOX60kypkc27u?=
 =?us-ascii?Q?af6prtXx77pdQrmGLUBj4S4Wm8ETvk92tLQIuQKHHRTLJDYiLCxZ6v0DFJ8Y?=
 =?us-ascii?Q?hTIDyTJgtPcwa9AjfM5fEuxGG4eJuny8jrAyXIIUPluRWpkiOkK3TP5vNnHV?=
 =?us-ascii?Q?Jxr+8wSJZpOeAUotbG+UHkSoYZaSnvwOr9X0o+AZ4jkbqEanDvX/KSx3wwAR?=
 =?us-ascii?Q?h3/pWT1mYZKjaL6i/kHndV1AODI/3FfH+HDeu4uIyvzLQmgFS2xdqkRsXc4Z?=
 =?us-ascii?Q?FdV/rQqLBJaP/mcuZY7jsF+jwUoDKJ7/OdJb8iyu8DM3xa2JS74kT703dTVW?=
 =?us-ascii?Q?iOzWnHaVy1k9/Hp6QKzQfUhlG9CW2O3S/EEzW+8J9P0hPhd06OVihAaJhxOh?=
 =?us-ascii?Q?A/v5duEQ02lN9KUB6bBeGMxEqZhQeTAsTsdPVfm9qLR5Pc+i7pNZlWAyxQU2?=
 =?us-ascii?Q?GijEXChJyQsH7Bbcvzj2//s=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c9df833-f6fd-4738-164e-08de3977aeab
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 12:12:13.2097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gVOdm28BX75eXCQoBQfKLzdsKmwYnaqPkZGf1DpQO0awQ9aMOB5/5uZerxASBSvzNwqm379g6SlVH0PInElpABHc1VoCxGYkPqVptUIR39CMYcMdDqltkQfwKVEwpUpD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12888

Switch the VSP1 driver's dev_pm_ops to LATE_SYSTEM_SLEEP_PM_OPS to ensure
that suspend and resume callbacks are executed after DSI/DU suspend and
before DSI/DU resume. This prevents timeouts and vblank wait errors during
system resume, such as:

[drm] *ERROR* flip_done timed out [CRTC:43:crtc-0] vblank wait timed out

This addresses display commit and vblank timeouts seen with DRM atomic
helpers during s2ram.

Co-developed-by: Biju Das <biju.das.jz@bp.renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 drivers/media/platform/renesas/vsp1/vsp1_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
index 2de515c497eb..0fbd27df1f46 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
@@ -693,7 +693,7 @@ static int vsp1_pm_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops vsp1_pm_ops = {
-	SYSTEM_SLEEP_PM_OPS(vsp1_pm_suspend, vsp1_pm_resume)
+	LATE_SYSTEM_SLEEP_PM_OPS(vsp1_pm_suspend, vsp1_pm_resume)
 	RUNTIME_PM_OPS(vsp1_pm_runtime_suspend, vsp1_pm_runtime_resume, NULL)
 };
 
-- 
2.43.0


