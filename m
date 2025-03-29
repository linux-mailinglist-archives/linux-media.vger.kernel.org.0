Return-Path: <linux-media+bounces-28978-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 38872A7545B
	for <lists+linux-media@lfdr.de>; Sat, 29 Mar 2025 06:46:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1E0A3B26B3
	for <lists+linux-media@lfdr.de>; Sat, 29 Mar 2025 05:46:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF8EE1A9B34;
	Sat, 29 Mar 2025 05:45:39 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020100.outbound.protection.outlook.com [52.101.225.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054F9170826;
	Sat, 29 Mar 2025 05:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743227139; cv=fail; b=SAzdKWkI0t5MmdbyFLIfHqkmuDt6nDgk8ZJYxPlKpx9vxOpAJsx+zRjg2MWYMNg6D9dSikzdHUkbWweFjApomdaCszoy7KtP7dOgex13PxqJo7rX9DfL2iQBusYa0sCOtuhTrk4JKHQ3h7OM/BhIbBxqqrq/dqOFMTQstFhZjK8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743227139; c=relaxed/simple;
	bh=Ol9AhUaxJkBFxV9lc782zKS/1hDPgKKFnmQsCn/eZYQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=F5potvPQE27hHwiq90RpcgQAsOxamvUI53fAwkt/CmBskPCb7k8nby5ASKZ07lbZdnd4YMNctVh5E7M1Bbu3uqLOYwfbhT3dMMPz9PBM/vOxZSlWfAkYYhTR/xHurSOpxPevhpnWS7qa45yXW20RS50jhPSJo/uvJymbii9VWhY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=52.101.225.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u4WHINbQDR5TFJ0GOqzEEVFOZ8+O4NyT8TNA/ia+xy3VVrH12uEQI487PGw2g9IBK0gJtD5QcWQVGAHWTNXfzT3riZiUJTejdtfVDOK/98wMCTfJNT6YOZv1lA7GHGl32fNHUYNHWRFiwZRTWQju7YkMhJIQSnb9hnxzKHRc8GLT4YPGWW1gnuIteQ0TNAPp/hi8xyiUOJE4Ewu/tbKwaqCuLbARj079u19d3wQL0sZtp6o2jz46S4zbwpW8yPGC/0BXQ4XNQoh9gUV5LMRuc6neqYT8fZSvaruuzvBsiJ8yX1Y1Y0sWPg5Z2utBG0prjtaO7RJjTF3CjoEz2SzHOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wL0cBrVAExfr0JuvHg+L2+SXJchR+lc65nRDoN1W/tU=;
 b=FHyH8Dn1pNwgfDvpdxGZPXqFw6KJDFMAb/hGbnYehelX+FZajqJiRouNZbkd479EDfShhz9FGi2uDjjt2BXExARGLZnNbodeNyaoz8QigiXPgW9zzIyAxlg9FGMw2X9/CEmqCT0X3Gb6+ixPjOgJFbvN+YwATxN6/lx/GP9e4L6jPwwbVe2taYgGarGDYw1s9K6t3Cxmb9RixUjbkIKqlj3w/zq3dtpQEnJ9GxLjH/+rmFFo3ENhmzJmJteQGChsrZAmInPRRs2jYo+sd2s2VecnPx3CdqNKvx+MECz+OTf9kCAIjf4SJyecZzIMr4vjpedV7rLK0Mpcz44DQtQI5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN0P287MB1842.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:18f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.46; Sat, 29 Mar
 2025 05:45:34 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%4]) with mapi id 15.20.8534.048; Sat, 29 Mar 2025
 05:45:34 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com,
	kieran.bingham@ideasonboard.com
Cc: Shravan.Chippa@microchip.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Julien Massot <julien.massot@collabora.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Luis Garcia <git@luigi311.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/9] media: i2c: imx334: Fix power management and control handling
Date: Sat, 29 Mar 2025 11:13:27 +0530
Message-Id: <20250329054335.19931-6-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250329054335.19931-1-tarang.raval@siliconsignals.io>
References: <20250329054335.19931-1-tarang.raval@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BMXPR01CA0096.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::36) To PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:199::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|PN0P287MB1842:EE_
X-MS-Office365-Filtering-Correlation-Id: 57298481-21ec-4c3a-d5a1-08dd6e84ecf6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6v3m4h0Fc9FW6sNwdosqb0XyH9YDQMyc8gS/vgWiMpfT10Cckc/hYdyEPUiD?=
 =?us-ascii?Q?p9RnEBU2DnsijjVceEn1aG3uFZrz5+AMKizGfmpLQAwxC7ZcQ1FNTu4QS+oU?=
 =?us-ascii?Q?vxPbg5uLomMJctDAwyMSi1rmngtosrtx7eimx5DTM1UUukPa/SHM8grBia7/?=
 =?us-ascii?Q?Ad/727JYuvBIJDUMgsQo7/t/fFCLViIUyubgUKCgTEl2sQVdg2+K7h089q0+?=
 =?us-ascii?Q?3cAiVzsulxydJ9Pkc1znFwFIne6R/uxVKplMN5y2tzoDV0+XUaSyFmxbat3e?=
 =?us-ascii?Q?m0TXicDHPBkTnz339PZX8i3F+ou8zbc1rKUP/WW1ZZICi6k5pVvNXYaR97gX?=
 =?us-ascii?Q?CMm3AAy9kW1qKc0Z9wGp4NIb8oMV45gbxX5mYUpX+ZngW6cKaKcUuu5/t81B?=
 =?us-ascii?Q?fSaMXmUKB57Id+9lYB6ylrxCkBUUKj00pX9aTS4fINPSQQzJlC5lyoKvddUq?=
 =?us-ascii?Q?aj9A30tnpTfGlFf6TepBlE95mxkCYjZoLbKFwm9wZ/AyM3/DpnA1piziKugU?=
 =?us-ascii?Q?QuCuO5rSg+0of1wrhCRs/YxXioyI5kA+Y2oVbBMFL0wZlCcQqIr8OWYYPt6B?=
 =?us-ascii?Q?vmbj/McynfToulVv8BLXbKmY9ZdcVE8ALtTWhGQUcL3+Qp2mNa0LgJZ4yQVT?=
 =?us-ascii?Q?l0p3fkFBPWHAbS3eWkfcOVDVzQVsRW2WQCgU+Bbd4fP00HfSKiqCF7kbxQTw?=
 =?us-ascii?Q?wCzOTili26C5OQYiUKkBjxrVWok57oHBpwMBI5uJzeVMb0MHbMpQjnBll64g?=
 =?us-ascii?Q?NEMRC693IToa82wOYvR0a1VivXDEACPyzoI+jsKZepWsSeMWemClU/fEjM62?=
 =?us-ascii?Q?4fDB2tvP+AeygEnzVlJdzLne3RdVYyJqlSPIvJsDJSP1cXoWNmTODli86EIu?=
 =?us-ascii?Q?rWFSnJz5IE8jZdIAJvimds+2dUdBeIP/XJDq3JaLGWXYyrRmM0Mb+q483HSc?=
 =?us-ascii?Q?00TzVvwtlEc0mmaP7eXgdv4e0t4f2pT5NRm+eW4okHXOKcRZ3nfrMa1JA+3Y?=
 =?us-ascii?Q?uAsT2YLKU4p2AQOs+J1cOm9M+Sw7c3pF2EeyhG+SjvCEICwlOgAVLBeBd0uI?=
 =?us-ascii?Q?yI9E3Zo19xBFsUMR8SPdI9Mxi0PQuusJfbNNVDJ4xLI5UIYjC724Mqy6fWuN?=
 =?us-ascii?Q?tTQVNR0EAmCWNjyJ8VK15h9bvDT2LKCi+4gVDp3cNmh2SHKNGNFZElqPpl0/?=
 =?us-ascii?Q?IN+XUmlbLtU591k8xW78xrlmyJqR9f4y1t1BEeec8WWsZo4Afxr1BF/2Dmbz?=
 =?us-ascii?Q?w6pC7gXec5aMpHFA3CQBdHELTEvXwg6Qzw9Gk9vol/fyamJ2YGNTjpMy+G+R?=
 =?us-ascii?Q?x51J9Rddm8QB0AtjkQJwOi90H7OSiPuUOvcAJVXor0K1DyKOhSBlgfKNn3sk?=
 =?us-ascii?Q?ss5OgkpWDgUR8HdH+E4H8fR/pteLgdGjk/t6UnOoANyclPGc0xUrCnUfzRKg?=
 =?us-ascii?Q?GkOG+NSFFuyEEU19Njgql23Tu/Ss/S1mNd2jfCW3fsII/GJ+ZJgtjg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?U3iqxSIdIAhM8EuVMlaQZpw8+Htjl0mUvBJYUa5+KozundXQXmOLX7yODIpi?=
 =?us-ascii?Q?OH/32rin1fZCr0kEPWA4Y2WTd9CHk+j/JijGu7LFJWJqtcLpSCCf7hWUW+9G?=
 =?us-ascii?Q?yG8WEpiklrntH3KVOzUVDpR+I9Gq83SU51GasFZ8MAxeeZxeXBZvQhjFr/kb?=
 =?us-ascii?Q?JIbDFzi0uhA6sG/bTnOK/6waq3/by3GDZ0CxtC31TtBMryP9E/0XoFvVESgI?=
 =?us-ascii?Q?/3oXaXYD16nBLaQfRk3QXkGxvgR+p2lOGD8qThUKFWBqZ+jqnzsVjY7JdKu6?=
 =?us-ascii?Q?TM2JKZwJ1hN+TdeUlin3PGN6nyFHfc9GxawC+ErtGCk3j04jvDHC2J0xJ+aF?=
 =?us-ascii?Q?VXe+IT6LRLmX0zYrHp+eLUI3SxYQul+G6fnOu1gV89VySxw59bQNWw8tykmo?=
 =?us-ascii?Q?6+ZwedK+5kGi0d/+POJ4F7SLkVIb3iK7UJrq1c3xQ2p0a6CuRbEEMuzFP9li?=
 =?us-ascii?Q?duzk3tZdRcMNQq4TywbU0nQfUibCa0Of7b3L5mSLq8Osxu96iRBsQS0lEcuc?=
 =?us-ascii?Q?66mFnVkv3VIdmaq2JuBAOvqRK4ataGHm9VPlhFpj+wKKIOPpTycKdnyyssc8?=
 =?us-ascii?Q?a4mGotj1leRLwu5zxbviDhOPRI+1r1kl3E6F4wmtPf3f5/tDYnx+f8kNs0w4?=
 =?us-ascii?Q?J1sgRPyvBF1RDif+pXC4dHzBk500J7nzVeTKUYF9lX+EkPFKcxWJcYCQ3eDH?=
 =?us-ascii?Q?cWZFObXdYuu+pAAkPCDAhMu9LXcOA/BjnLX90wtcNwG/Cg5ilhIHguQfwGtI?=
 =?us-ascii?Q?TRvnDLOv27mcJV9No5GIA3o4KKP93yLykG5shG4oOWCFozeWCrrQcIUdNttG?=
 =?us-ascii?Q?8z3McTgzqyMezgQdy8T6oxDY5OBuRko5Ha3+F/+D2ewXMc17seszZ+iapfZQ?=
 =?us-ascii?Q?mTw4cIkQ57/C/6+JdsGRrfz8uaD1bpOKA2I9t2qDmSUvO4EIKQqGh7RRtndE?=
 =?us-ascii?Q?lkxR4qK4bxaC3GWcoXppadEUgEKV36wRfYF//JCqRgal3PUNWaomts48OY7w?=
 =?us-ascii?Q?Ujp5Xf0wRXQiUSvBTfrbIQkHu1np3Coeq2j9bel7SK8yetG7V2wg817RMOks?=
 =?us-ascii?Q?XSqHfzCFN2FPk/V2zPGmwryI/xckeFvc2lm8pPkodjIdZNvh6/Xxcfrzth/3?=
 =?us-ascii?Q?x7AYITXsy8QV9ackHjohYrF/GommvGuv0Yu2057aof4driI0acs7JLyWcCbJ?=
 =?us-ascii?Q?AdKc6JufK/l04+tuMsJcJIukfTLkoOFUC9T9AfFZAXu6hHpwPz/Y0ciZoRqc?=
 =?us-ascii?Q?53QQj8PU0gSiuvOEJXudIdxCe33kLlrcYw46FqcyDP0mOmG/rKYxnZWuj94y?=
 =?us-ascii?Q?EMVmQSEnUbss9iYAN9ngZiXUXwp9OTW6bFMwuu/cb31hnLy+SnQcmYu/YokT?=
 =?us-ascii?Q?mGB8hPNPI5nK1ktYtbLrCjiCi1Q7bCPz3gy1Bl1sxxrIV3vClK9mca38za06?=
 =?us-ascii?Q?dlwcItLyVfNHTfOLfnu+Ngo/3q/wxV8fdHAMx3I28c0tGozMsSzsXByZbcIO?=
 =?us-ascii?Q?y/Y6IKg+BzYSS72/72ove9l8FKHKZ0RSks1QXMh42Ia4rTLWhhtF9ed3SZ/z?=
 =?us-ascii?Q?GiDo4QuvqDc6tMJHc5FGzrdXWg/uBLnfHbGsvNRDABIHQpQKHw5A77RSiPNN?=
 =?us-ascii?Q?ow=3D=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 57298481-21ec-4c3a-d5a1-08dd6e84ecf6
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2025 05:45:34.8027
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 32C4wqW594LD774ozudViT7JEYjJv/jb83WpXPQLfPvPlulMpTAEbPlYUmX6cS32TE4dF3BAK9Ol2PEypLrtuqruN+XFuIolJQfRkWsXn3Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB1842

Some controls may need the sensor to be powered on to update their
values. Currently, only the exposure control does this. To ensure
proper handling, the power-up sequence is moved outside the switch-case.

Additionally, VBLANK control is now processed earlier so its changes
can correctly affect other controls.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/imx334.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
index f7be303af024..56d5576ccf94 100644
--- a/drivers/media/i2c/imx334.c
+++ b/drivers/media/i2c/imx334.c
@@ -578,8 +578,7 @@ static int imx334_set_ctrl(struct v4l2_ctrl *ctrl)
 	u32 exposure;
 	int ret;
 
-	switch (ctrl->id) {
-	case V4L2_CID_VBLANK:
+	if (ctrl->id == V4L2_CID_VBLANK) {
 		imx334->vblank = imx334->vblank_ctrl->val;
 
 		dev_dbg(imx334->dev, "Received vblank %u, new lpfr %u\n",
@@ -592,13 +591,24 @@ static int imx334_set_ctrl(struct v4l2_ctrl *ctrl)
 					       imx334->cur_mode->height -
 					       IMX334_EXPOSURE_OFFSET,
 					       1, IMX334_EXPOSURE_DEFAULT);
+		if (ret)
+			return ret;
+	}
+
+	/* Set controls only if sensor is in power on state */
+	if (!pm_runtime_get_if_in_use(imx334->dev))
+		return 0;
+
+	switch (ctrl->id) {
+	case V4L2_CID_VBLANK:
+		exposure = imx334->exp_ctrl->val;
+		analog_gain = imx334->again_ctrl->val;
+
+		ret = imx334_update_exp_gain(imx334, exposure, analog_gain);
+
 		break;
 	case V4L2_CID_EXPOSURE:
 
-		/* Set controls only if sensor is in power on state */
-		if (!pm_runtime_get_if_in_use(imx334->dev))
-			return 0;
-
 		exposure = ctrl->val;
 		analog_gain = imx334->again_ctrl->val;
 
@@ -607,8 +617,6 @@ static int imx334_set_ctrl(struct v4l2_ctrl *ctrl)
 
 		ret = imx334_update_exp_gain(imx334, exposure, analog_gain);
 
-		pm_runtime_put(imx334->dev);
-
 		break;
 	case V4L2_CID_PIXEL_RATE:
 	case V4L2_CID_LINK_FREQ:
@@ -640,6 +648,8 @@ static int imx334_set_ctrl(struct v4l2_ctrl *ctrl)
 		ret = -EINVAL;
 	}
 
+	pm_runtime_put(imx334->dev);
+
 	return ret;
 }
 
-- 
2.34.1


