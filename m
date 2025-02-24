Return-Path: <linux-media+bounces-26808-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB85A41C1A
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 12:08:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93190189389A
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 11:07:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AA7E2586CB;
	Mon, 24 Feb 2025 11:07:22 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020097.outbound.protection.outlook.com [52.101.225.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646C31993B2;
	Mon, 24 Feb 2025 11:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740395242; cv=fail; b=Q2SlXRAKDUtXuu6KBtdkjv90HVlWwXkydoXkJinFoAixhGeTsGh3i8MQfjT4vC76cNJic71oYEvUr2MY4+IzRscq/cdrSWgJGmMsATUE93Jqp93j68d2fpvf1CYtsiGiUq9R2uPs/jpr3FH2ZHGlkHAGZM51uQiNXZFLDproEiM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740395242; c=relaxed/simple;
	bh=R9MElmt8eRDMNTi8VU1uyBTUgVWJrqihUwXAdlML8oI=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=p7AbN20E1gDem0epHXi6lMufyxciCRelb9BjtNU2HEcKM1zFJUrm4wpQalDR+BQGQZX9S8cm5S40VzC7dVT00VN4pfxnDgdzXGBIXGA9tkHEWTQ4Zqixn/yx9y4ZaLE9SIq0fOkkfa6k1lAImnXu+70qHeU2AQlr5PzgDn/NAT8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=52.101.225.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UoWZj4v6xIM3WwkPuDaEBIvMVpTlighDmgQD1kjk1X74pdUdPHtyNT5nnem1dMKzXz5wQZf2fN4svpJMGSnNBVtJKsdROjLuDcb0leF76JSgaPRY34YGGxJH4ZBn5R9ThI/5h2wfRughV/48j7ffTUAmuLK5bFmaFDueP3H52p910MJS9In3i1fUvBIQ2MlZB3V7IBiRWXQcfcDi5HQS7IHZePt2tK5W3m8aCk2orJ07VPXmeSHVP++40nABLjQcbfvpthXF4kp+XSpg6HIKv4DEYLBuuPSG0vcpjo4Skrnn1NaTCvVNFTgdgE4XQallqttqyzZpmX54xK4UpFpQ8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j2/U2IXj7rmj19w7+lmFM8Dmsl+rTI/BBIK388Z2zU8=;
 b=Z5haCcaFFv9FHJTBp29EiQ+e5yjBHhJYpGVWkCo3xrCLMTgjpuES6j4EjpwSEbNLd1f1tVJZYefq4ucxJl5UbvknDMMAkYoaKnUqtjjbuwS6AaGJv8P8nEnoXV4YgHlIHgvaJHxh5m5mgJUKR+Ls1SZjmHr5JqUV1NMzET2A5bxyHtp3YTq2S2U8TAng/d06eKMr0tP8DwJQf9zROW7Tfb1Lr8lgw0+6Lj7R1KZc2pNKCD0wF8PP47KLCVUDyM3Lfac5OaYiZMR3N/wIa9hXZOLS/YQD0aW47ivEpzrcFYNtMmbcGG/CPb9WdvoVPYrVc0U7pXOEHBcd9pyrGktxlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MA0P287MB0186.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 11:07:15 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%3]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 11:07:14 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: Tarang Raval <tarang.raval@siliconsignals.io>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: i2c: imx283: Drop runtime suspend/resume functions
Date: Mon, 24 Feb 2025 16:35:54 +0530
Message-Id: <20250224110554.23439-1-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BM1P287CA0010.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:40::20) To PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:199::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|MA0P287MB0186:EE_
X-MS-Office365-Filtering-Correlation-Id: 0479dd23-43f8-417e-53e5-08dd54c364d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PO8HZMxmBrYU7ZXyqI1mtRe0iAj6+qG1unN30ot02aaadStSyrYx+XP7Xada?=
 =?us-ascii?Q?xQhz5GSdDQLSpmL1qKryHO3EcpZYjf8kUHioRbaGyiZd/5m8BqpTCg0U86tp?=
 =?us-ascii?Q?Zap6wA5Runp/MEasnmXSOnob04JDiUdElb+pJx4oLNb0eXEzCg7pdaKjhQu8?=
 =?us-ascii?Q?Ud19kUX+hYUaOx7H6m/i6/cPoR1YQajX4RM8i/MUo4yjdtMmQpxJNEHCJw0O?=
 =?us-ascii?Q?HSmUDIlfPVnZiytQWi6ntRwjfyBiRhZvYM8ieN5VLnz/PpaLuyhsZ8c4+nQF?=
 =?us-ascii?Q?di/awT3SuYulQe+P7GOA3L2c9lqSuePGkj91bnXdkdvV5wkDWOqXiCMLUl6+?=
 =?us-ascii?Q?NM0GjyBEtYRxXamTDBe+TvmOHyS/Y777LQqVP68GRyAzzXVQPmOg+599ya9d?=
 =?us-ascii?Q?2AXVJYeeZsAbHfhpvf25Ip7JIS9wR3d80P4iOMiFC6Z6UkjtPoaoIc94b8ly?=
 =?us-ascii?Q?bHoz/ExBzIxnIVzT1jVYSktV3LPuzbIBHeIjxz7gj0FVykHsYikfP1C81qBE?=
 =?us-ascii?Q?INuYxf/XwY/BnTB82RUixxKBpxgVObTh+GpUAeGLWc1DJQQl75KPIOlNgcTt?=
 =?us-ascii?Q?/EkEQ3NpgR9GD8RYxQzG4q2Xpdcm2tl+3/78vYJY+UHEIAd+1UOoJzIsJyqh?=
 =?us-ascii?Q?jzlaGSEBzQ/3a9LhNB3bznl0jlDoKbWZOvC1n/PpXZs4elUyupS0GA03ibkQ?=
 =?us-ascii?Q?lW3aO3Fvqz2GWALrYt8gneXpn/nNaJBCGjgTVxOIhy4ejzJlfuClf4EPB3kf?=
 =?us-ascii?Q?ITHUtag+5ypZawYVOMDSTPGpCGXUeipRR0u0v+WhVf99nS6cESExBpuKZRcl?=
 =?us-ascii?Q?9AJ511Yh1MDejvRyz5yzUqSkhLJX30VWaqk6fIlDYE32nw2bI6Yi6eQHZBRH?=
 =?us-ascii?Q?0UZjZyB4bsRv32taPfDZWrmjX/Up8FVDMUTT2hGndTd/VaHXIXcotlYeb9ie?=
 =?us-ascii?Q?rJzaNN82BmQNKLnzJHQCoFbTYYtLd+SIyAlwTifLjXimzElbfM/hsp0p9iDe?=
 =?us-ascii?Q?FaMkJB44Md9b14nwQdqZ3YHzL8VXLZIRM2zVZ1Z6dV/a6n0GZHFD+kzqGErk?=
 =?us-ascii?Q?d96AVNtpVweiKKEwqcF/GOcwm2Vd/NOJTbtgXUkLOIoPbDqOELDg0lFVIsZS?=
 =?us-ascii?Q?MZWcukksfXINlX7azqe6MWU8TvV1Xv+J1QIUCVFy95xjv8sKlI9UO7RqtifK?=
 =?us-ascii?Q?f37CVBMZQHPsKFmo6Tv8L2SvJ92N86U3QIHIXKQdsaKnQN+tjO1BRCocNJXo?=
 =?us-ascii?Q?AElfGecc7fgP3riSGn3Rug9X7CsolsfstE/6s/hFCuhbohYUMwCAisk9uVn7?=
 =?us-ascii?Q?5YHqLKX3brWEBWQawaKtb5GVCtT+ox/ZPBPRGQjDhi+MjpK173ogD40ZjAyA?=
 =?us-ascii?Q?xCwjIW46E3RBIgUUnp1wZQXQhOwEiw7hu7fBYG5x/4n0olilXimlhHiOlw7z?=
 =?us-ascii?Q?xT3GHGSzDHso1j6MebcOiPnkM1EdlPTF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KJshOINZztBubgOVWMily01GQSduunIaogP4KxRTzVGiVJroxs9Ijv7QqBw8?=
 =?us-ascii?Q?Hm3YVW3Am9CfyPcJtmo5mAcEVnk9FljcjSsUgWOiKwXVNyPD+RZ0OBN8II8B?=
 =?us-ascii?Q?9r/MopSkRf/lrNwDkXeYT1TRIF03w9xjlQ1x3reUK9EiadlTT2+jTVj8WtqT?=
 =?us-ascii?Q?WGzSxck4fLCCB4xRICnD1phAOOpAokQ/Em5f2s3i68PIjLJdFK4Vz2R1AQSf?=
 =?us-ascii?Q?bK+Vwyl8gMwZ6Moc5S60WRsRNaAJcxl5Im1ycy4aMsEryr5kWPZ/nQNOJpma?=
 =?us-ascii?Q?oJ/GOzb8cWiiFtg7tAcrcbmE/fjt9h/GPA4Ok1asukseENANIVDlWquznOIq?=
 =?us-ascii?Q?5aZAmAY7wDf4DP7lYfGm4hZmWUWz+E0/PuSYdmX2jJ23tWPWu+SxABlt19JO?=
 =?us-ascii?Q?YM9CQD45k11GCC0kaM+VKQY65dxEfy0Re5/R9bR0J6Fy6YCXf4PAwWkuNpGU?=
 =?us-ascii?Q?2j3vsRm4l3XgVtr8/bq/VCDVlYI9+Hw20MtBhTc7bIN1a57hw2/K9rlaN3iH?=
 =?us-ascii?Q?YnubtAZOAMEEwQ9DhUST1oSUIrMsc+FuYSZw/1aR2JYdhzkIpLT595G93HuF?=
 =?us-ascii?Q?voYbs5MpbJO0jA8oHcu/wpfheub9ev35UKbxWxoLP/FDevitu6WmosRrS+ef?=
 =?us-ascii?Q?5W8fXeS3uka0kP1Ckz+M/UWqaHtKLPUXI/R/hvVY98pazdS+MjxHQjXy7g+V?=
 =?us-ascii?Q?f6oeMWRSCOD6PkqcGYM3/cGVkKXEl3ZgYUxNyN/BtzOd4T9y9rca71nXjXYJ?=
 =?us-ascii?Q?PKLRF4SarXTARp2/r8oz3WIV+9ms9mZ1omqTDpah+AQ/WB5o3iWmiYBfnJMJ?=
 =?us-ascii?Q?pf0ugt2nrwKJKLlMpE1WvA2CkcxwiNlysvaJFd1Ze/dF531ADx+FDh8nCYOh?=
 =?us-ascii?Q?tWYi7+9ayt9mtejAy+J+XnSoq0uZshsePbzi/kJOKYddKlO6dSNmCT5CPSkM?=
 =?us-ascii?Q?J9JuMLg3yXK8+EeQ44yIPrxGtDFl8yAXuwW/CUXi4dgVpjx7kcnhZeKJsjAk?=
 =?us-ascii?Q?PMr08eX6g9JNAQO8qiUPFs/UHOgm2KS4/T0Ie6mPN2ALCqNZL1K7wCOGlO4b?=
 =?us-ascii?Q?KJ+tc6qB8hX33XiOnWTyCXmjk7DcbAwHO2xGqcw/5q1Ncxdrx0bBnRxaN1Yk?=
 =?us-ascii?Q?dx5eCINXwhroCPEfRNKbA/2e0/lIP0dg1ahxF0PozzzcuGs3qpE3b6PX2lw5?=
 =?us-ascii?Q?kFfPKoyBf6qbz+LPErYjPQk52mLCY8UK1P9Ppy99n7xL60uSVzN17idsTWqh?=
 =?us-ascii?Q?tdc+yLhni5y+3G2g1iPWXgVSATNOL0T2YL/fnyFS3kRkxPcBwaFWUwg3g0CG?=
 =?us-ascii?Q?yGvziKtRxqziSgzbvy1TfPjHO+vXMEe/kXv/0WhMdsRwfuoXPDSuUdiBLJlZ?=
 =?us-ascii?Q?QG6HKSWOg33EUUsLpll8Dcl25p4MMbg5WECEjlBKPZnPqa9inCQkQFfRNssn?=
 =?us-ascii?Q?hV6ljqlUiONQnGAPdpumLKh6rbhvoVDFyUlOESjaTieocK8uKcN9ba009q/L?=
 =?us-ascii?Q?jAE2DvFcNJqheNBE+kiJw43pk/jjH5X795Z8OoZUOlpkEdAMWcXws0LXYaFl?=
 =?us-ascii?Q?nby09w/qrbqJqREySzTEiSAjE8d4FbRKJmN3LdWRnSjNzhDu1y0CvNvvdkFb?=
 =?us-ascii?Q?9w=3D=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 0479dd23-43f8-417e-53e5-08dd54c364d9
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 11:07:14.8378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dIX537nPMnrv0wo1do8O5rbXkfbjEEMulyHOLmPQ+EZvfPPwcB2bt8jiukqcRpqYU2ILz8APYnScPHSh9H7EfSYo4piXZHnHNmMVs4/5yU4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB0186

The imx283_runtime_suspend and imx283_runtime_resume functions
simply call imx283_power_off and imx283_power_on, respectively.
Since these functions do not add any additional logic, they are
unnecessary and can be removed.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/imx283.c | 37 ++++++++++++-------------------------
 1 file changed, 12 insertions(+), 25 deletions(-)

diff --git a/drivers/media/i2c/imx283.c b/drivers/media/i2c/imx283.c
index f676faf4b301..beb9169f93ad 100644
--- a/drivers/media/i2c/imx283.c
+++ b/drivers/media/i2c/imx283.c
@@ -1170,8 +1170,10 @@ static int imx283_disable_streams(struct v4l2_subdev *sd,
 }
 
 /* Power/clock management functions */
-static int imx283_power_on(struct imx283 *imx283)
+static int imx283_power_on(struct device *dev)
 {
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct imx283 *imx283 = to_imx283(sd);
 	int ret;
 
 	ret = regulator_bulk_enable(ARRAY_SIZE(imx283_supply_name),
@@ -1199,29 +1201,14 @@ static int imx283_power_on(struct imx283 *imx283)
 	return ret;
 }
 
-static int imx283_power_off(struct imx283 *imx283)
-{
-	gpiod_set_value_cansleep(imx283->reset_gpio, 1);
-	regulator_bulk_disable(ARRAY_SIZE(imx283_supply_name), imx283->supplies);
-	clk_disable_unprepare(imx283->xclk);
-
-	return 0;
-}
-
-static int imx283_runtime_resume(struct device *dev)
+static int imx283_power_off(struct device *dev)
 {
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct imx283 *imx283 = to_imx283(sd);
 
-	return imx283_power_on(imx283);
-}
-
-static int imx283_runtime_suspend(struct device *dev)
-{
-	struct v4l2_subdev *sd = dev_get_drvdata(dev);
-	struct imx283 *imx283 = to_imx283(sd);
-
-	imx283_power_off(imx283);
+	gpiod_set_value_cansleep(imx283->reset_gpio, 1);
+	regulator_bulk_disable(ARRAY_SIZE(imx283_supply_name), imx283->supplies);
+	clk_disable_unprepare(imx283->xclk);
 
 	return 0;
 }
@@ -1516,7 +1503,7 @@ static int imx283_probe(struct i2c_client *client)
 	 * The sensor must be powered for imx283_identify_module()
 	 * to be able to read the CHIP_ID register
 	 */
-	ret = imx283_power_on(imx283);
+	ret = imx283_power_on(imx283->dev);
 	if (ret)
 		return ret;
 
@@ -1589,7 +1576,7 @@ static int imx283_probe(struct i2c_client *client)
 	pm_runtime_disable(imx283->dev);
 	pm_runtime_set_suspended(imx283->dev);
 error_power_off:
-	imx283_power_off(imx283);
+	imx283_power_off(imx283->dev);
 
 	return ret;
 }
@@ -1606,12 +1593,12 @@ static void imx283_remove(struct i2c_client *client)
 
 	pm_runtime_disable(imx283->dev);
 	if (!pm_runtime_status_suspended(imx283->dev))
-		imx283_power_off(imx283);
+		imx283_power_off(imx283->dev);
 	pm_runtime_set_suspended(imx283->dev);
 }
 
-static DEFINE_RUNTIME_DEV_PM_OPS(imx283_pm_ops, imx283_runtime_suspend,
-				 imx283_runtime_resume, NULL);
+static DEFINE_RUNTIME_DEV_PM_OPS(imx283_pm_ops, imx283_power_off,
+				 imx283_power_on, NULL);
 
 static const struct of_device_id imx283_dt_ids[] = {
 	{ .compatible = "sony,imx283" },
-- 
2.34.1


