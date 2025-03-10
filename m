Return-Path: <linux-media+bounces-27925-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0780DA58CAF
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 08:21:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7A7147A2421
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 07:20:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0FAE1D90C8;
	Mon, 10 Mar 2025 07:20:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021092.outbound.protection.outlook.com [40.107.51.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F691DE3A9;
	Mon, 10 Mar 2025 07:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741591224; cv=fail; b=EJIpRLLuSR0b9lyrUd+EL8W5/jVkWEOtbyNkiwF6PWf6bBsXbV73ttuDhab//4p1NcHS3QGnjXXb4rvvyRrEXL5UcORkTzLvk8DqL+MG6haGjcc/Y+PVvsf/qfJ37Klh5rfX5PyY8WLJ0zrguyCPMWcys2TTXtQXt9fBUEd/S2Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741591224; c=relaxed/simple;
	bh=o7lOocXLfGqu1u5vaQ3XgBZFi+1z3tXXNoToA84ZN18=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=U2V/knCFTPvUi0kmYXWjENBpMJ0rF043er9V90s7FaSK2OhmTvuNYeMTkVNzm10TzQEQsvYHPvnBxKscNqSmtjJI6HCPJrrCBuGiN7NXW6q/mccXCls9WQv6xoYa5pcT5tdRDXSzVA1oYGGtaoASmYE5AZM8G9072L3P/ouHh5U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.51.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NP9QxYvV15CX7IqSVA5uiHIcKiw3AL6YKUQaDkitk45YFDtydJQ1NavlsCyEKqVIEj5WKIA4D4RVSLYtYlmW/pc/40LRH69ifkEy2rOhWMxTk9Y2P1dk/q/R+fMknNcgw3bRuYEqhfQ5Dj7lm/chQY+jtK4kRldXcTVZX+zE8upO9JAfKVJQmwo5VLMiSKd49awH1tTr19ys5WbEYZ8x/9It99odCgRDqbb54NL9zZ9TpKcakSDRw94pKl0ABtCGk7AyAWAhGHPtj0aFtUE8aT2skvLMVl0pckD5SaCyPbJ78kYGDdUe69215TaYG+F/K/jWdGET1L4dkgjJ+1fZYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dZKD1bnhmmeE2dTNjLRyUoxO/owlN39Mraj6KX2bIzI=;
 b=huX09r3C3m1FziLAkpEAFyWQYKO/tPWBWdgd5DUGCdxVbYD1w473YiaRSygV+xu/m4QQUYMsBYM2yiHZlAn7j7JQBV3tiRE+Uu766jbxzfvUgXQnObSmQBLf37sDuadWT3k2WHvXYHlQiPtR/Y4v0WPA8A9hjVPZLam693FgEe+g0A1I0+WWkc8yXKWbafKQ9wTf21dwQZoUQfyV5j703GAeff7NposMUP2SLHh2TcauSswvuL7hdHbNZbb/fcamGswR0EBYgCso37ae+DLpecNoedu1yTiBkNcil4yQYp2YGpAFCk0DpX3wvB19a9z+gUwnwsBJeRSq5FCHN/M7kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN2P287MB1311.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1ad::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 07:20:20 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%3]) with mapi id 15.20.8511.025; Mon, 10 Mar 2025
 07:20:19 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com,
	kieran.bingham@ideasonboard.com
Cc: Shravan.Chippa@microchip.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Julien Massot <julien.massot@collabora.com>,
	Mikhail Rudenko <mike.rudenko@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] media: i2c: imx334: Fix power management and control handling
Date: Mon, 10 Mar 2025 12:47:47 +0530
Message-Id: <20250310071751.151382-6-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250310071751.151382-1-tarang.raval@siliconsignals.io>
References: <20250310071751.151382-1-tarang.raval@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN3PEPF00000180.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c04::50) To PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:199::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|PN2P287MB1311:EE_
X-MS-Office365-Filtering-Correlation-Id: 4405c7b4-5bef-4fd3-c120-08dd5fa40399
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Y/bnhquloFYexjNOh8ZIJSxy0s7H+D+WWNyhrkf45v2Znvqo1bFEc/ZFKZE2?=
 =?us-ascii?Q?Z/yhJKO6p+QqgJFG+SE4rAIQ+Wvcdg1JvkD/rbsNUbRNoC+4i4KKXpkg+U0o?=
 =?us-ascii?Q?xrgCcmMQnxzvHaK87Ja9WQItkUgVfAVw6zhKesXKTdRiGcD1ZikXXz6/XSyB?=
 =?us-ascii?Q?xAPSOO62px7SL3d5dryJbOAvcSL9k0tMCtU04CdtCzFeJst+243TiqvZUFTE?=
 =?us-ascii?Q?0hsFDlHMuKXAyAb7T5vYXERCoAa02dy2vz68S1J0sLAhVHQAEqGGcvsFGHy+?=
 =?us-ascii?Q?qHlWpMPc7way4TJJ4jvRvQdcsM5v9sGBxnJyHTNebYlttrTcJ44PfNRY4gxG?=
 =?us-ascii?Q?rptKYKJUOeGHAKL92WN5A29UM044QgMaHH72I2y+QG181qTQTFcfI5P7/P2d?=
 =?us-ascii?Q?1K39QCien1HFfNJqALJRRwwgToD1MPynyZbJceHSQYgb/spLswr9Z+XBUmpo?=
 =?us-ascii?Q?9wXNCFPgNQK0WyvcGFMWHzqUJgxKb8eEbps+ehtaEcicAki14o960/CVOav0?=
 =?us-ascii?Q?kEc3fdRlBMHT19PrxsPDh28vGkwhpKI72GWB6TZmXL7d3hNKFmSlsGKRmDxx?=
 =?us-ascii?Q?JsrmERDK2XtqMIGT5+WymZXeW4PtwSA7RqSDtA515vqeRsgaS4UaP5RiovEG?=
 =?us-ascii?Q?2bwWPDHD7TGFW8uy6bLK3GjtNrvIiJbBhAkCsIELzSX/94iGdlpXKrjfF2VU?=
 =?us-ascii?Q?vJI2ZGes4cWE4LbYg20MmiIjg2BjiDbfzUm8M9qcXrx+l7lz3xdinCK2lFxN?=
 =?us-ascii?Q?dU2Mx21jcR71OZh3MjzsDtvRlRhsBg5Etx64r0oQZP73EsODu0KEb5PnHRFU?=
 =?us-ascii?Q?saDJo2UljKmWOZo8tgTOiGvufzjp/VolcKRuW11+fMiBh7cfoyNU57Z+WdKJ?=
 =?us-ascii?Q?/0v7B9CiIcvWOSuRXupyVLh2Sgbq+bQScoyO/jKPKPJBVfqxhITCTKaxFkM6?=
 =?us-ascii?Q?dgcx8OaMHyqapF3o5hafb5U4X4SIQa7gt0wWNNXCeilDsBiby0S21GHzN0xb?=
 =?us-ascii?Q?6eQRUjaMDRrPb0moux8yKYO97uXzc6QkplrbtbLgp2RwW+GWueYdLgj79jq/?=
 =?us-ascii?Q?093UWeVGSJaVWnyvzHEQz3shCSqDs9+ysNmJ8FplF0CQUuICu/zFNdmqRGtb?=
 =?us-ascii?Q?91gUpUl7Jz72czI6AFRb+2x2CXOdtUdmz97T9ckMerrQoR6iV1oynCLc8+k3?=
 =?us-ascii?Q?qK4qztIQfHaz5vDo5TbcnEFx+Bok+B2LdG+YbzE4QkKuCjF39jNInJ2yROov?=
 =?us-ascii?Q?0ru+oCbRZya78pFKPSjcSD6ammKRAPqnRJKYWKmRRNTSx45wjyvAOgxozYNf?=
 =?us-ascii?Q?ixGpjN2uWCCnMZe4+cWVOf5O0YLCyIAuaOyklvfczk8/5X30ggFKd8hOs5Op?=
 =?us-ascii?Q?YTNIZQxYkN7Mr5leLdokk0Mfgsy4Ty7mKaJMqNrpvxnBvMl7LvmUahiK5x8K?=
 =?us-ascii?Q?04leeLf1V73CVNbhpGMS2AxLd+FalB+1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dvJq0a8WebXTiab9L339i82SeI97x3AmqLU7ULnBDEn+5wta0LE31VpEw8GS?=
 =?us-ascii?Q?nIISHxHhG8ShhBbfLvIZK+PGKaDBdhEpSxybzBhC4xbfLPsYDMYZwJj0N9NU?=
 =?us-ascii?Q?9IvrkHdEiPEhtZ8Xr2+VsRajmUjr+1II4IQmwb8TNTujERwt35Dckx6nytfL?=
 =?us-ascii?Q?Td4D/948/CymvEDa2gsE6Bg+rKJqB1VkJcNZB3TWQMnOmNACgUp3uatP0r4R?=
 =?us-ascii?Q?cg5C28wG/gjO5NQA2rCQA4yFfZ0zsoDDJtmSMRH8iZqZPVUBeMdkLToWF+C8?=
 =?us-ascii?Q?qIM+ZY0pDVoZDvd5jRHCY7Fgk9c8A7/sGnTGv/cvn7qHjHr6S4/3I64Dn26Q?=
 =?us-ascii?Q?YPIm1CVr7KCrsZfwve334c0dHuWsc58i7rUHyX9fL6zzTZmyb1mfmfOHXmjM?=
 =?us-ascii?Q?6wNnU8xQUtytR3QhYqpGvQeKxuRLX6bWuzmhh1DBbdkI9hKiuQWMOLhIA4hL?=
 =?us-ascii?Q?OxsRYQwhR4aMz9w6QLk3HpTZ29PuReYV1ujRAggfsD1CjOcdTcNZ53Tulo0V?=
 =?us-ascii?Q?nu81wiXd6DMaGe/2AiPurot7KcM+j/YzFJQHX5DnalIKZ/3MgiWhx1jtR88O?=
 =?us-ascii?Q?arhWBGT9TYulEuDkvHZWdQmKTs+5Kpyd7caUEExHVd0dVqqiAlBncNlyj/IZ?=
 =?us-ascii?Q?5+ugy0mXF5eeDCGZZUGCbA67C4YXCTVG5TyhWw5OZRnu2mGTgw4BVJyZDfuh?=
 =?us-ascii?Q?W6yjiazlrDQAyrpEt0MQRhHWIRzqDRkNV8Re5ON+MK4VCUj/bHyMJgqoTvJj?=
 =?us-ascii?Q?cNcdMgC5qz6KYyVrBP3zBge80Uth9i+tHEWjUdJQoLaem0BtkUUc/qU3PGJ+?=
 =?us-ascii?Q?EdBCv/H58OVv9EyLUL8e4CRvklBSTNmnb9KF8Fwp8FEbobNefQFi1WWXZaZH?=
 =?us-ascii?Q?dQ9+wF6KXDTHhEAsprym6T9kVt6dqQFe3VFJN+s0w/dB9sT45N36dq8ikNDW?=
 =?us-ascii?Q?kY+2vZNYciadaj7TqoEBCEBkPtufJdGf/aab1aMAXUUaOHREhErU0gY+Beeh?=
 =?us-ascii?Q?ybY4zODHIShYl3RAZZ3EavoLjbMZSaJ1R0L8yE3NvD8xjQ8HQtNB/No04g7V?=
 =?us-ascii?Q?S35kpkRwyYLWv7XbbcN9khM3nWLbBu/JkrCpBj3rV0Oa6fUh38RZAQHrLoOD?=
 =?us-ascii?Q?+9pILLGElGcCA2qlOM5yH5tqitXtTHXZlkr9rLP7syO65kpawOyYHd/rMeun?=
 =?us-ascii?Q?SDM8MrmEZXieTZOtsqJEA5KU/8hwwjOTjtVLsEmjIyBPHT1YfcbBvcG6Q0WM?=
 =?us-ascii?Q?H+bKa6jq4JVS2mjlDjrLxg7NdRgLVqBOhIo8wgN0Ja7ZGxVFDpnpEPPh2Eht?=
 =?us-ascii?Q?P4hk52yY1ETPwtZ5SXTgkvOwcbNqIguJoLNDrTn/lMqYtW8l/p/aWY+lryKF?=
 =?us-ascii?Q?j23lroZHEVwLZhdS4vzMC3r7d7qXviiLjc4ytM8j/oRb8XbMNYu7tT/eYQiW?=
 =?us-ascii?Q?4AOwKI5PBexavSRv+YxgoBneRAljinxSxepQ0y7AsF53/QptSVSZ3PCvHZ+E?=
 =?us-ascii?Q?bIJBc6xJpHTsJK6HfAiYkQHHnpIa3Fl9sh7Jbx1bHxWrsn1kA4Fez/l1dlBE?=
 =?us-ascii?Q?5UI25T+JAck581uresA1FvujWh62n44QV0jzi1mrqQ2b53sSKEiI6fgdyGKD?=
 =?us-ascii?Q?6Q=3D=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 4405c7b4-5bef-4fd3-c120-08dd5fa40399
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 07:20:19.7208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AOx8xhTVYKrOVu4T6Q5SU1hJ0jFF7NmXOh/jIETk7D4F0F2vRsuID6JkJhlzdFQSZxOBDyFuF6hQAv7nkcUOWD0LBLgVqtQKD75amoEcbCE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1311

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
index 23bfc64969cc..ffa39bb317f7 100644
--- a/drivers/media/i2c/imx334.c
+++ b/drivers/media/i2c/imx334.c
@@ -579,8 +579,7 @@ static int imx334_set_ctrl(struct v4l2_ctrl *ctrl)
 	u32 exposure;
 	int ret;
 
-	switch (ctrl->id) {
-	case V4L2_CID_VBLANK:
+	if (ctrl->id == V4L2_CID_VBLANK) {
 		imx334->vblank = imx334->vblank_ctrl->val;
 
 		dev_dbg(imx334->dev, "Received vblank %u, new lpfr %u\n",
@@ -593,13 +592,24 @@ static int imx334_set_ctrl(struct v4l2_ctrl *ctrl)
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
 
@@ -608,8 +618,6 @@ static int imx334_set_ctrl(struct v4l2_ctrl *ctrl)
 
 		ret = imx334_update_exp_gain(imx334, exposure, analog_gain);
 
-		pm_runtime_put(imx334->dev);
-
 		break;
 	case V4L2_CID_PIXEL_RATE:
 	case V4L2_CID_LINK_FREQ:
@@ -641,6 +649,8 @@ static int imx334_set_ctrl(struct v4l2_ctrl *ctrl)
 		ret = -EINVAL;
 	}
 
+	pm_runtime_put(imx334->dev);
+
 	return ret;
 }
 
-- 
2.34.1


