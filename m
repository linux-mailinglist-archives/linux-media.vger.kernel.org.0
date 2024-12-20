Return-Path: <linux-media+bounces-23858-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 240179F90B6
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 11:51:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 13954188ABAD
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 10:51:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34CF61C5F3F;
	Fri, 20 Dec 2024 10:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="CUNyso0i"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2078.outbound.protection.outlook.com [40.107.20.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC351C5F2E;
	Fri, 20 Dec 2024 10:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734691804; cv=fail; b=iMoCz1kIQp6/5tXS6fIdZPCX43xGxEj/ixD+pvuxSzGxyvlwqmV/mfK8C4xPU6i8NBLaheZ1WHHjNFWkYYY+FwERaFQ1KIoM10S4+YX+rXcte9TKRrB5pCbEcb8OV5cPC1Wrf8kbBmEcZofArJHNXBPPf6LwT11ZZ1EXhVgnXdY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734691804; c=relaxed/simple;
	bh=gJNRxr34lj/nGDemgtj9GVzzAux6+Chsuz9X8RyqqV0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MCM46nkexOpyWyHlYXl9eFrDgmIYu6g+jdUZCMS3Qbg3KhDsHJ4JREyLT730Q37JYTFkXo6ab7HrVB2tINr1VYgMpVHIN6amU71MhWljs0xrXHCuQkUpSk+mLUO5S4VyPWQXQ3IP+z1300zK6xGutLNFO3KcvCZYS3Db2cvYE5E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=CUNyso0i; arc=fail smtp.client-ip=40.107.20.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=smSn745K0UlR1vUTAuGUe3B9mVhsn62DuEJAZQTa8B5xJwlLt8ByD2Qxofft6gcVT0bXL/vJeleYnRWcr+56YL/TEyvWZ7Q0xTc+RL+VApA1y4J9fR2vMQfUZAPVWyyPzJHh/HLzZxXZvKQbClIx9QG306stmQDLXwsxweFNgbrvN7nBt5Kz5ilE03cwfnPt42Mhig9XfNeTHSAU4WmW3LxIgbjZvcm45hFUjfHMuor/Gn4gbxgRQEesQCNYPfsmzzZLfObG+ZJgcZjwmVj4pEx/W+/c8xXvx1DEnNJxCURkOLnhdorWX5WwU6qQrLDZmlzOucpHrWgAhODVF+kiqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WeKM5paNlS3AtZhJRzM2Xm0BisfbHKW+OQibQAjyDHw=;
 b=cYKq1Bdly564hpo+eCMG3/j71IXuIFUezNPIBFfuV1Expjpf+PgNPLEmCeOQWXFDTZziFc01B7IJNGhhq8NGnU9uLLHH+SmSVQLybLTUlpAKJGhc9EzuHktYb+baVShm2W5pJeb4XyjytRBlQE4RLHyBridlWV3iKqHM5h7l12Y3xhhDKfKqdJnaQASH9zhQb7FwlAnUJQ/78ERhLMnXYWBSxzftEkXDh+xibMl2KLuXdBn0uEiCiGJMnBpLHCrGgh8EPd4kQwyKGEN2vkfXr8ehWJikaYS/fCJ4mm/USzfX4YtFXY0J7nQdqyPKNX82Cf9ENTxpoOFq8Mv85vqWDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WeKM5paNlS3AtZhJRzM2Xm0BisfbHKW+OQibQAjyDHw=;
 b=CUNyso0iRbCwiv6fIeusIqjBteD1GondVmQmwB9Mc9utV/iMj6E/Z6Rhwa6/9GM1dnitB/XG/0gBxCnBGMM9B16F+rSuiiOmYi0t2n1SOzcS7HEP4e3T7AnHmg3haMjMxjMKBsP7QvlEA5wwKJqoo4asZ54XjCVKySltFIXQwkfMGET4I25YMu095zlqztwMCLWNBkRB5k2nRJt9ZMJImHoGdWTVGU5SY+6Kk1+uCKc6dcmbqPQyJG4tEF89z4Br+GW0q8yw488PT09leooUGJMc6czlin5URJIzTHJSmV8GQFAfZ5nhefdioxSYj7vQhKe+20jNI8W9Pp+YhC14lA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by DB9PR04MB8300.eurprd04.prod.outlook.com (2603:10a6:10:243::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.15; Fri, 20 Dec
 2024 10:49:59 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%4]) with mapi id 15.20.8272.005; Fri, 20 Dec 2024
 10:49:59 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 3/3] staging: media: max96712: add some register and field definitions
Date: Fri, 20 Dec 2024 12:49:38 +0200
Message-Id: <20241220104939.503547-4-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241220104939.503547-1-laurentiu.palcu@oss.nxp.com>
References: <20241220104939.503547-1-laurentiu.palcu@oss.nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR06CA0144.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::49) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|DB9PR04MB8300:EE_
X-MS-Office365-Filtering-Correlation-Id: 733aa9be-8404-489a-1095-08dd20e40cc3
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JzptdtfB2//XH3KFjhPt3ZlkCCfLcGUN48o6OSqQUPl1YPVkUFb1BCnLqEew?=
 =?us-ascii?Q?BrNLSrKlApO96kFvcefdX1epaXhk/bvrMzsEzGDAwhSr560oT1yFU+8Fxv1d?=
 =?us-ascii?Q?PFdcv63uuOL+Z92o+dsPxTpULVWZ/j+q4hUkgGufckp734ZiUt9VPcTp6S0E?=
 =?us-ascii?Q?FGSX3zIX7rl3bHaaw4xC7Zuef9KrNrFBAobz7XMzCB0h8S55V3HJyqiwJjOl?=
 =?us-ascii?Q?9v5uSHH9OKvnjDCrgNcvkb4tj0I3nun5pAiCgUxyDXYleGTuEMW1tKKhDC/g?=
 =?us-ascii?Q?65vz0vE8N9co/cO4s5kImMVKpRFL2zyy4KfWUeYC2rlqU/LxRxRz0sHx32mr?=
 =?us-ascii?Q?HvbHQ2rHkVsF8rqZjQ5pHt2pVOjWFUfL/1qpW6vlpBkqEaIML18tqodSAoFW?=
 =?us-ascii?Q?Eie/6awMjxYvxEKHhch6KVt7AoH5iNNZkXT9z2vl0ECGzODJcKJU9sPbEPSj?=
 =?us-ascii?Q?BWy3faGoEHSeud2ZZJktGtfZxFNO33KFk4oo1QiGTEcpOTaWbilOidDRGSpG?=
 =?us-ascii?Q?kh2y4CewhGzfqwpt5zqEWKDvv3kG0i7RerslDI7JcLDsZq2ijbabbCIQP3o4?=
 =?us-ascii?Q?61Nxcbt7iyb4hnwPsFz7n7dgBAG8wBwz5tqJe45bfx0pehKkoG5KCSsj0oOi?=
 =?us-ascii?Q?xoYfHaSgpCZLBrLJ4+5VVEtdayPIy9qkPvWhI6Z/o7LedKr2JGvDvlYgIJlz?=
 =?us-ascii?Q?y5zBUmSOrpVFUFIe1JOypInd4Mxc7l19uGM3HUsMzCSgMl+pgXawFVSRHUTB?=
 =?us-ascii?Q?K0KxB+ZvHBhmnB5lX1JgSR+aTtXB9fMI4EeiA5iEVaO7Qt1TReXXxKj/vbT6?=
 =?us-ascii?Q?+sNCqdyI1qTFKhF8OAd5mZStyjDCEDw9D3R6dx8mZ+93fpsNlFSIM9xKoKU1?=
 =?us-ascii?Q?KKjbdXp5S1MHm8An4dXuwVk6+Xg2TPpnAeBD3c0wi4w9npXMGgUgEckX9inj?=
 =?us-ascii?Q?aOoOBbJnZH/PnTx6WWO71mxZy11oOrhij03UjrkpO7ESfecR8LP0iubuKNtN?=
 =?us-ascii?Q?jsJ73kNVvPn9F13NOAz0TLNnqUgGv4L5F0L0DioCGzdXhnobzK7DmegV9mXc?=
 =?us-ascii?Q?F6C1oBcoFlaYHgJyXlyoRBgNDmnQpiTQsrkuV8ypYY/UzIFoaUfIIMdz64Jo?=
 =?us-ascii?Q?M4u/4ufXDcK/pSVZcM2kzczbOeXhUij8taoDlNj20wxKFomzQ9g3PpQr834c?=
 =?us-ascii?Q?ePk9CKkfWhYhK4ezW7ELTzoWc+uW6hsYw6FwLS2qNRPOdkpp1Z0aWsqAPWdB?=
 =?us-ascii?Q?G5paxWJJdlfln9AFvCw6kyl5M7+3in3zgMTdR5fqzv3qTDRKF9/tcDy7+nnp?=
 =?us-ascii?Q?ol/Q0B0tgG3JVYVb9XpHnR+pFKDhsZodFJowRoApiV8cHnJQhyCZr2SB3XwS?=
 =?us-ascii?Q?H/bEralEQ2SvL+GpHmvEzIcQf+mB?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9576.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SPH5BSKyiE8hBR8E9bqJH4fFjOxX3zHNCb4hND83vo1K9jpNlx+GyiyG/OCn?=
 =?us-ascii?Q?nsMQjXAgqtSZFQ2YeUfN9/xGUjQkoxki2SZezUiJh23nXkdzTl3fvGitl7ZB?=
 =?us-ascii?Q?006PRhS0t0WyBSXo9TSXzVXKzwCu/eNy+bFnfl5yFbggj2xRZj4D67YcaLZm?=
 =?us-ascii?Q?Xqn6cC5EVtnEjBbIs1NrSdnKZvIqXqz86KgXaDYXh3rmqMxjjHDo6iWpV6VK?=
 =?us-ascii?Q?wVSRhyF5VN8sKHNaRlejcSbsuMVHLungr0gJZBk7KtlT441x/XRnxbjYugkI?=
 =?us-ascii?Q?yr9Ypxm8bU2XPkjK2gtyejDSpZr17hLnrGHlVTS+yyJ9MBZwhzbNudc+L2Kp?=
 =?us-ascii?Q?SvfyUE+rhJam/0NmKiGsUL8xGuYxbwxugHG9vRA6WcjrzfmfMfVxmRy1SCxY?=
 =?us-ascii?Q?ybx7q4YuSAgEuc1kF7icJyp48OEaMGpmjaaJU1Zy2wMG4XOwycqnRMRbvCO+?=
 =?us-ascii?Q?1xVsXa0oLUADmQSss70uZyw/AU7PNxsfoz80r37qM3Q/7AH2lrYMwL3pmM43?=
 =?us-ascii?Q?AVsf1CKGZtPR9FZIU2MBvzckLsf38j0XGQWDD7uSB0C0yel0qkihIJAph7W7?=
 =?us-ascii?Q?fQMDqqgMmhRdtv/4rQVbKdW/seG03s2791gbRjsWez5JFZ5RKi+hrFkNEWIz?=
 =?us-ascii?Q?7tdLhGzpJFvVHAxGlCXM3iz3XHhsIXwV7xucRL+hFfz3GOmAbB4ChHUdm9e4?=
 =?us-ascii?Q?9fNXdDL7LL2VRRzryFTlA5wZ4+dDCGmIiNR3zzC22WoC1itu/iaTrwNfC9KT?=
 =?us-ascii?Q?/H4WZo/ctX0MZb+iLPjhzeTodgPdbFYSEh0DcLqN/fQ28cxhKPDYQ4cGJs7C?=
 =?us-ascii?Q?pV/CjbrFVju6r1t7dtnR7DytxJOReXhM37vFLZ79+A5wuEzcIeJ1vSc5URRO?=
 =?us-ascii?Q?g57VBgG8WGpwo/DslGvAb2mgVgTKGjbFWfI4DdBoEJ/0HCRCUiAoYu/sAnr3?=
 =?us-ascii?Q?rmMscSPOPSze9jP+zjAUCXA1mobF18yS91EvhVLTBLZX71I7G08n+ENSzRIJ?=
 =?us-ascii?Q?kKtjjhPi0R/UD/hz+9vgIg11Hf6wynsuWD8KbAH/ILjuOKnj5rDK5CQ6pLyI?=
 =?us-ascii?Q?qQ0owJ3Ksi9hpkmaTQ8YcC282rDtwFNFyMZO8/Pl19wBI2U5rbFTqcZG3OvM?=
 =?us-ascii?Q?d9WCfEmW9huRiy8i8pg+jKTqOSFUMKbXW/Qmfj7F/hn+ME7LOVrwfNhykQo1?=
 =?us-ascii?Q?2Pc+iCrfl0iWe+6xt6s27nIt7KbDvoupDfQhVpoFTiCOoj3L2ETosUnkgnt+?=
 =?us-ascii?Q?SYVtmW8SYSmTFoCa2r63ts3Ee7VSUddLoyFnSdeu9r7VhvO3S3ZW8UjdmJvr?=
 =?us-ascii?Q?WF5cP4k39c7NHnqMr4LoVTnzKZ1re0Z1hTorOqEeJ0HmloRMd478xTLsfJBS?=
 =?us-ascii?Q?9xq8rkdUOiVwnYgWrvJVah6W2FiM0JH4mQMW0YQ0BIGkbzuat3tQLRRwxMej?=
 =?us-ascii?Q?Z/EvSjYFT359zrTMmNQKEoAgU8d9oSllhpAo1W6hIntMEwM/K+c2ANZSoAMo?=
 =?us-ascii?Q?1/a6gm/wxMwiKxqU+JnBI/T+lJpUuKsv9ivWN6twFfMlWnnxJd5qGfgT7kbX?=
 =?us-ascii?Q?fKshhn5iFrZWb3cyrNWvr3uIuZvpJKAxyHzf0/otIqzRC2s+hr3bmM+1ZaX3?=
 =?us-ascii?Q?gA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 733aa9be-8404-489a-1095-08dd20e40cc3
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 10:49:59.7030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KuDQYSSMc+Ou8Ky0SjXi0McOtIhJarr0X0cltOKzAmWaJ7G7BtktEyGpmpPLRpNma2iK5RMeh01tD+6wqWWljw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8300

Most of the registers in the driver, and their values, are hard-coded
which makes the code rather difficult to read and maintain. Add register
and field definitions and use them to replace the hard-coded values
where possible.

This patch does not change the driver functionality or its structure.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Reviewed-by: Niklas S??derlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/staging/media/max96712/max96712.c | 207 +++++++++++++++++-----
 1 file changed, 163 insertions(+), 44 deletions(-)

diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
index ed4d5db1ff8d1..47842facec125 100644
--- a/drivers/staging/media/max96712/max96712.c
+++ b/drivers/staging/media/max96712/max96712.c
@@ -16,9 +16,118 @@
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-subdev.h>
 
-#define DEBUG_EXTRA_REG			0x09
-#define DEBUG_EXTRA_PCLK_25MHZ		0x00
-#define DEBUG_EXTRA_PCLK_75MHZ		0x01
+/* TOP_CTRL */
+#define MAX96712_DEBUG_EXTRA_REG			0x0009
+#define   DEBUG_EXTRA_PCLK_25MHZ			0x00
+#define   DEBUG_EXTRA_PCLK_75MHZ			0x01
+#define MAX96724_TOP_CTRL_PWR1				0x0013
+#define   RESET_ALL					BIT(6)
+
+/* BACKTOP0 */
+#define MAX96712_BACKTOP0_12				0x040b
+#define   CSI_OUT_EN					BIT(1)
+#define   SOFT_BPP_0_MASK				GENMASK(7, 3)
+#define   SOFT_BPP_0_SHIFT				3
+#define MAX96712_BACKTOP0_22				0x0415
+#define MAX96712_BACKTOP0_25				0x0418
+#define   PHY_CSI_TX_DPLL_PREDEF_FREQ_MASK		GENMASK(4, 0)
+#define   PHY_CSI_TX_DPLL_PREDEF_FREQ_SHIFT		0
+#define   PHY_CSI_TX_DPLL_FB_FRACTION_PREDEF_EN		BIT(5)
+#define   OVERRIDE_BPP_VC_DT_0_2			BIT(6)
+#define   OVERRIDE_BPP_VC_DT_1_3			BIT(7)
+
+/* MIPI_PHY */
+#define MAX96712_MIPI_PHY_0				0x08a0
+#define   PHY_4X2					BIT(0)
+#define   PHY_2X4					BIT(2)
+#define   PHY_1X4A_22					BIT(3)
+#define   PHY_1X4B_22					BIT(4)
+#define   FORCE_CLK0_EN					BIT(5)
+#define   FORCE_CLK3_EN					BIT(6)
+#define   FORCE_CSI_OUT_EN				BIT(7)
+#define MAX96712_MIPI_PHY_2				0x08a2
+#define   T_HS_TRAIL_MASK				GENMASK(1, 0)
+#define   T_HS_TRAIL_SHIFT				0
+#define   T_LPX_MASK					GENMASK(3, 2)
+#define   T_LPX_SHIFT					2
+#define   PHY_STDBY_N_MASK				GENMASK(7, 4)
+#define   PHY_STDBY_N_SHIFT				4
+#define   PHY0_EN					BIT(4)
+#define   PHY1_EN					BIT(5)
+#define   PHY2_EN					BIT(6)
+#define   PHY3_EN					BIT(7)
+#define MAX96712_MIPI_PHY_3				0x08a3
+#define   PHY0_LANE_MAP_MASK				GENMASK(3, 0)
+#define   PHY0_LANE_MAP_SHIFT				0
+#define   PHY1_LANE_MAP_MASK				GENMASK(7, 4)
+#define   PHY1_LANE_MAP_SHIFT				4
+#define MAX96712_MIPI_PHY_5				0x08a5
+#define   PHY0_POL_MAP_MASK				GENMASK(2, 0)
+#define   PHY0_POL_MAP_SHIFT				0
+#define   PHY1_POL_MAP_MASK				GENMASK(5, 3)
+#define   PHY1_POL_MAP_SHIFT				3
+#define   T_CLK_PREP_MASK				GENMASK(7, 6)
+#define   T_CLK_PREP_SHIFT				6
+#define MAX96712_MIPI_PHY_13				0x08ad
+#define   T_T3_PREBEGIN_MASK				GENMASK(5, 0)
+#define   T_T3_PREBEGIN_SHIFT				0
+#define MAX96712_MIPI_PHY_14				0x08ae
+#define   T_T3_PREP_MASK				GENMASK(1, 0)
+#define   T_T3_PREP_SHIFT				0
+#define   T_T3_PREP_40NS				0
+#define   T_T3_PREP_55NS				1
+#define   T_T3_PREP_66_7NS				2
+#define   T_T3_PREP_86_7NS				3
+#define   T_T3_POST_MASK				GENMASK(6, 2)
+#define   T_T3_POST_SHIFT				2
+
+/* MIPI_TX: 0 <= phy < 4 */
+#define MAX96712_MIPI_TX_10(phy)			(0x090a + (phy) * 0x40)
+#define   CSI2_TWAKEUP_H_MASK				GENMASK(2, 0)
+#define   CSI2_TWAKEUP_H_SHIFT				0
+#define   CSI2_VCX_EN					BIT(4)
+#define   CSI2_CPHY_EN					BIT(5)
+#define   CSI2_LANE_CNT_MASK				GENMASK(7, 6)
+#define   CSI2_LANE_CNT_SHIFT				6
+
+/* VRX_PATGEN */
+#define MAX96712_VRX_PATGEN_0				0x1050
+#define   VTG_MODE_MASK					GENMASK(1, 0)
+#define   VTG_MODE_SHIFT				0
+#define   VTG_MODE_VS_TRACKING				0
+#define   VTG_MODE_VS_TRIGGER				1
+#define   VTG_MODE_AUTO_REPEAT				2
+#define   VTG_MODE_FREE_RUNNING				3
+#define   DE_INV					BIT(2)
+#define   HS_INV					BIT(3)
+#define   VS_INV					BIT(4)
+#define   GEN_DE					BIT(5)
+#define   GEN_HS					BIT(6)
+#define   GEN_VS					BIT(7)
+#define MAX96712_VRX_PATGEN_1				0x1051
+#define   VS_TRIG					BIT(0)
+#define   PATGEN_MODE_MASK				GENMASK(5, 4)
+#define   PATGEN_MODE_SHIFT				4
+#define   PATGEN_MODE_CHECKERBOARD			(1 << PATGEN_MODE_SHIFT)
+#define   PATGEN_MODE_GRADIENT				(2 << PATGEN_MODE_SHIFT)
+#define   GRAD_MODE					BIT(7)
+#define MAX96712_VRX_PATGEN_VS_DLY			0x1052
+#define MAX96712_VRX_PATGEN_VS_HIGH			0x1055
+#define MAX96712_VRX_PATGEN_VS_LOW			0x1058
+#define MAX96712_VRX_PATGEN_V2H				0x105b
+#define MAX96712_VRX_PATGEN_HS_HIGH			0x105e
+#define MAX96712_VRX_PATGEN_HS_LOW			0x1060
+#define MAX96712_VRX_PATGEN_HS_CNT			0x1062
+#define MAX96712_VRX_PATGEN_V2D				0x1064
+#define MAX96712_VRX_PATGEN_DE_HIGH			0x1067
+#define MAX96712_VRX_PATGEN_DE_LOW			0x1069
+#define MAX96712_VRX_PATGEN_DE_CNT			0x106b
+#define MAX96712_VRX_PATGEN_GRAD_INCR			0x106d
+#define MAX96712_VRX_PATGEN_CHKR_COLOR_A		0x106e
+#define MAX96712_VRX_PATGEN_CHKR_COLOR_B		0x1071
+#define MAX96712_VRX_PATGEN_CHKR_RPT_A			0x1074
+#define MAX96712_VRX_PATGEN_CHKR_RPT_B			0x1075
+#define MAX96712_VRX_PATGEN_CHKR_ALT			0x1076
 
 enum max96712_pattern {
 	MAX96712_PATTERN_CHECKERBOARD = 0,
@@ -96,18 +205,18 @@ static int max96712_write_bulk_value(struct max96712_priv *priv,
 
 static void max96712_reset(struct max96712_priv *priv)
 {
-	max96712_update_bits(priv, 0x13, 0x40, 0x40);
+	max96712_update_bits(priv, MAX96724_TOP_CTRL_PWR1, RESET_ALL, RESET_ALL);
 	msleep(20);
 }
 
 static void max96712_mipi_enable(struct max96712_priv *priv, bool enable)
 {
 	if (enable) {
-		max96712_update_bits(priv, 0x40b, 0x02, 0x02);
-		max96712_update_bits(priv, 0x8a0, 0x80, 0x80);
+		max96712_update_bits(priv, MAX96712_BACKTOP0_12, CSI_OUT_EN, CSI_OUT_EN);
+		max96712_update_bits(priv, MAX96712_MIPI_PHY_0, FORCE_CSI_OUT_EN, FORCE_CSI_OUT_EN);
 	} else {
-		max96712_update_bits(priv, 0x8a0, 0x80, 0x00);
-		max96712_update_bits(priv, 0x40b, 0x02, 0x00);
+		max96712_update_bits(priv, MAX96712_MIPI_PHY_0, FORCE_CSI_OUT_EN, 0x00);
+		max96712_update_bits(priv, MAX96712_BACKTOP0_12, CSI_OUT_EN, 0x00);
 	}
 }
 
@@ -119,39 +228,47 @@ static void max96712_mipi_configure(struct max96712_priv *priv)
 	max96712_mipi_enable(priv, false);
 
 	/* Select 2x4 mode. */
-	max96712_write(priv, 0x8a0, 0x04);
+	max96712_write(priv, MAX96712_MIPI_PHY_0, PHY_2X4);
 
 	/* TODO: Add support for 2-lane and 1-lane configurations. */
 	if (priv->cphy) {
-		/* Configure a 3-lane C-PHY using PHY0 and PHY1. */
-		max96712_write(priv, 0x94a, 0xa0);
+		/* Configure a 3-lane C-PHY using PHY1. */
+		max96712_write(priv, MAX96712_MIPI_TX_10(1),
+			       (2 << CSI2_LANE_CNT_SHIFT) | CSI2_CPHY_EN);
 
 		/* Configure C-PHY timings. */
-		max96712_write(priv, 0x8ad, 0x3f);
-		max96712_write(priv, 0x8ae, 0x7d);
+		max96712_write(priv, MAX96712_MIPI_PHY_13, 0x3f);
+		max96712_write(priv, MAX96712_MIPI_PHY_14,
+			       (0x1f << T_T3_POST_SHIFT) | T_T3_PREP_55NS);
 	} else {
-		/* Configure a 4-lane D-PHY using PHY0 and PHY1. */
-		max96712_write(priv, 0x94a, 0xc0);
+		/* Configure a 4-lane D-PHY using PHY1. */
+		max96712_write(priv, MAX96712_MIPI_TX_10(1), 3 << CSI2_LANE_CNT_SHIFT);
 	}
 
 	/* Configure lane mapping for PHY0 and PHY1. */
 	/* TODO: Add support for lane swapping. */
-	max96712_write(priv, 0x8a3, 0xe4);
+	max96712_write(priv, MAX96712_MIPI_PHY_3, 0xe4);
 
 	/* Configure lane polarity for PHY0 and PHY1. */
 	for (i = 0; i < priv->mipi.num_data_lanes + 1; i++)
 		if (priv->mipi.lane_polarities[i])
 			phy5 |= BIT(i == 0 ? 5 : i < 3 ? i - 1 : i);
-	max96712_write(priv, 0x8a5, phy5);
+	max96712_write(priv, MAX96712_MIPI_PHY_5, phy5);
 
 	/* Set link frequency for PHY0 and PHY1. */
-	max96712_update_bits(priv, 0x415, 0x3f,
-			     ((priv->info->dpllfreq / 100) & 0x1f) | BIT(5));
-	max96712_update_bits(priv, 0x418, 0x3f,
-			     ((priv->info->dpllfreq / 100) & 0x1f) | BIT(5));
+	max96712_update_bits(priv, MAX96712_BACKTOP0_22,
+			     PHY_CSI_TX_DPLL_FB_FRACTION_PREDEF_EN |
+			     PHY_CSI_TX_DPLL_PREDEF_FREQ_MASK,
+			     PHY_CSI_TX_DPLL_FB_FRACTION_PREDEF_EN |
+			     ((priv->info->dpllfreq / 100) & 0x1f));
+	max96712_update_bits(priv, MAX96712_BACKTOP0_25,
+			     PHY_CSI_TX_DPLL_FB_FRACTION_PREDEF_EN |
+			     PHY_CSI_TX_DPLL_PREDEF_FREQ_MASK,
+			     PHY_CSI_TX_DPLL_FB_FRACTION_PREDEF_EN |
+			     ((priv->info->dpllfreq / 100) & 0x1f));
 
 	/* Enable PHY0 and PHY1 */
-	max96712_update_bits(priv, 0x8a2, 0xf0, 0x30);
+	max96712_update_bits(priv, MAX96712_MIPI_PHY_2, PHY_STDBY_N_MASK, PHY0_EN | PHY1_EN);
 }
 
 static void max96712_pattern_enable(struct max96712_priv *priv, bool enable)
@@ -169,49 +286,51 @@ static void max96712_pattern_enable(struct max96712_priv *priv, bool enable)
 	const u32 v_tot = v_active + v_fp + v_sw + v_bp;
 
 	if (!enable) {
-		max96712_write(priv, 0x1051, 0x00);
+		max96712_write(priv, MAX96712_VRX_PATGEN_1, 0x00);
 		return;
 	}
 
-	max96712_write(priv, DEBUG_EXTRA_REG, DEBUG_EXTRA_PCLK_75MHZ);
+	max96712_write(priv, MAX96712_DEBUG_EXTRA_REG, DEBUG_EXTRA_PCLK_75MHZ);
 
 	/* Configure Video Timing Generator for 1920x1080 @ 30 fps. */
-	max96712_write_bulk_value(priv, 0x1052, 0, 3);
-	max96712_write_bulk_value(priv, 0x1055, v_sw * h_tot, 3);
-	max96712_write_bulk_value(priv, 0x1058,
+	max96712_write_bulk_value(priv, MAX96712_VRX_PATGEN_VS_DLY, 0, 3);
+	max96712_write_bulk_value(priv, MAX96712_VRX_PATGEN_VS_HIGH, v_sw * h_tot, 3);
+	max96712_write_bulk_value(priv, MAX96712_VRX_PATGEN_VS_LOW,
 				  (v_active + v_fp + v_bp) * h_tot, 3);
-	max96712_write_bulk_value(priv, 0x105b, 0, 3);
-	max96712_write_bulk_value(priv, 0x105e, h_sw, 2);
-	max96712_write_bulk_value(priv, 0x1060, h_active + h_fp + h_bp, 2);
-	max96712_write_bulk_value(priv, 0x1062, v_tot, 2);
-	max96712_write_bulk_value(priv, 0x1064,
+	max96712_write_bulk_value(priv, MAX96712_VRX_PATGEN_V2H, 0, 3);
+	max96712_write_bulk_value(priv, MAX96712_VRX_PATGEN_HS_HIGH, h_sw, 2);
+	max96712_write_bulk_value(priv, MAX96712_VRX_PATGEN_HS_LOW, h_active + h_fp + h_bp, 2);
+	max96712_write_bulk_value(priv, MAX96712_VRX_PATGEN_HS_CNT, v_tot, 2);
+	max96712_write_bulk_value(priv, MAX96712_VRX_PATGEN_V2D,
 				  h_tot * (v_sw + v_bp) + (h_sw + h_bp), 3);
-	max96712_write_bulk_value(priv, 0x1067, h_active, 2);
-	max96712_write_bulk_value(priv, 0x1069, h_fp + h_sw + h_bp, 2);
-	max96712_write_bulk_value(priv, 0x106b, v_active, 2);
+	max96712_write_bulk_value(priv, MAX96712_VRX_PATGEN_DE_HIGH, h_active, 2);
+	max96712_write_bulk_value(priv, MAX96712_VRX_PATGEN_DE_LOW, h_fp + h_sw + h_bp, 2);
+	max96712_write_bulk_value(priv, MAX96712_VRX_PATGEN_DE_CNT, v_active, 2);
 
 	/* Generate VS, HS and DE in free-running mode. */
-	max96712_write(priv, 0x1050, 0xfb);
+	max96712_write(priv, MAX96712_VRX_PATGEN_0,
+		       GEN_VS | GEN_HS | GEN_DE | VS_INV | HS_INV |
+		       (VTG_MODE_FREE_RUNNING << VTG_MODE_SHIFT));
 
 	/* Configure Video Pattern Generator. */
 	if (priv->pattern == MAX96712_PATTERN_CHECKERBOARD) {
 		/* Set checkerboard pattern size. */
-		max96712_write(priv, 0x1074, 0x3c);
-		max96712_write(priv, 0x1075, 0x3c);
-		max96712_write(priv, 0x1076, 0x3c);
+		max96712_write(priv, MAX96712_VRX_PATGEN_CHKR_RPT_A, 0x3c);
+		max96712_write(priv, MAX96712_VRX_PATGEN_CHKR_RPT_B, 0x3c);
+		max96712_write(priv, MAX96712_VRX_PATGEN_CHKR_ALT, 0x3c);
 
 		/* Set checkerboard pattern colors. */
-		max96712_write_bulk_value(priv, 0x106e, 0xfecc00, 3);
-		max96712_write_bulk_value(priv, 0x1071, 0x006aa7, 3);
+		max96712_write_bulk_value(priv, MAX96712_VRX_PATGEN_CHKR_COLOR_A, 0xfecc00, 3);
+		max96712_write_bulk_value(priv, MAX96712_VRX_PATGEN_CHKR_COLOR_B, 0x006aa7, 3);
 
 		/* Generate checkerboard pattern. */
-		max96712_write(priv, 0x1051, 0x10);
+		max96712_write(priv, MAX96712_VRX_PATGEN_1, PATGEN_MODE_CHECKERBOARD);
 	} else {
 		/* Set gradient increment. */
-		max96712_write(priv, 0x106d, 0x10);
+		max96712_write(priv, MAX96712_VRX_PATGEN_GRAD_INCR, 0x10);
 
 		/* Generate gradient pattern. */
-		max96712_write(priv, 0x1051, 0x20);
+		max96712_write(priv, MAX96712_VRX_PATGEN_1, PATGEN_MODE_GRADIENT);
 	}
 }
 
-- 
2.34.1


