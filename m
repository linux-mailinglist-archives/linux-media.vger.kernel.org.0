Return-Path: <linux-media+bounces-46072-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7605AC24DB8
	for <lists+linux-media@lfdr.de>; Fri, 31 Oct 2025 12:52:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F56B561880
	for <lists+linux-media@lfdr.de>; Fri, 31 Oct 2025 11:51:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 667C134A3C4;
	Fri, 31 Oct 2025 11:49:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020111.outbound.protection.outlook.com [52.101.225.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78ABB347BA9;
	Fri, 31 Oct 2025 11:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761911351; cv=fail; b=YGzIDQqjo5fxfw7TNyYJM1/T0jdL3sN+VRmOH/ZWW5F3ld/Qm9QKAJH26JDZqcK4Ad3sZA69PW5BZ5KJwhGtwSwcFlLGrdC5qEyaNxWOeyLi5rRgbysHZbyZ3VXIihMVGhYLHvsbRypjta302g590VVGuxLlKAETM7h7z8IMRTY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761911351; c=relaxed/simple;
	bh=8+flSWiNDD3S0G84VKBRdr2QtNJlFwWIsLciHLYoc1Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gig92ExfkdGNxnPYqPiM9BfxQAtYymSW/1kYTXznstw/5gPPoiN5HpzC/3+wK33TYS+7T0+q+J1NTGVZOYGheMFynLgUUYwqz6TinfEXUsRGVgL+H7fZ+/rd1DJmCZhjm/F7P70t7WRcRI/1emSv3nXtwYbie7QU46bQhvZ7lbo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=52.101.225.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SArBKMIBVCv3fcTDJMOuJCnlK6S6RT6WDB78UB2tTATh2rknb/MN/vNHL8NlS34bh4AF62M+flVB/x2LVl3hBTI1zlMrzEjfUvNZTKjXiKxogrvLXH/cbpWExt2uE2yogdVv0mdMva8mBc3YAFM1QMdb+fP6t36da9exlHU+hJP+GD12tUy3Vr3LOLh63HdzdM4disnt9ptXjrrhZBiCvk/UXrGYeGAT+Dfjd43SxpkimLlc3ocMHWCkKXbYQ4qgA87EKUOBXY7cxXBcZoICrVicroKrFqwuWvxV3O0hodeRZMLRfmfWvYJvLjb/IhHycr3PbdmKP15AyExLAPfWqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/xosQkk7NtwI+EtEhN4pmDisKv/DAyu/MljgMhi/590=;
 b=hu63DZBMdOLVETH2glm4xUfe9Nsk5iVjDPfOcyqtb/KZtSTUWJ5qusLq709GyQmXk87nKNbf17Fm7f5G02z275zt4GugGbvjhpFHIEZxFNoCZov08kBXc3uZwM6KoH3dE5FKpX7IGFG3aKYUVZiBJQd1tSJHr5R9e4FrWgy7rssJQPf3j/xoZunAm9wjQlU6FserTEzM191O14BKBq8u+YwC689XPOvt00pC1/9QdSamrhJ59Gh7KyhJRDwelzC2QDQP2IaJof+zYUCCEcNB7dZq8AHyk0ciDNW2OeBanFnaF1uXpXRnT4FdSibFN4j1P0kbl89PrWcxC+rCuy2F1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN4P287MB5137.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:305::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 11:49:04 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%4]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 11:49:04 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: Tarang Raval <tarang.raval@siliconsignals.io>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] media: i2c: imx219: Replace exposure magic value with named constant
Date: Fri, 31 Oct 2025 17:18:35 +0530
Message-Id: <20251031114835.113026-3-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251031114835.113026-1-tarang.raval@siliconsignals.io>
References: <20251031114835.113026-1-tarang.raval@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN2PR01CA0220.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::18) To PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:199::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|PN4P287MB5137:EE_
X-MS-Office365-Filtering-Correlation-Id: 87f7c342-4d89-40c3-0c5e-08de18737d8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HggZ2rJWrcZSa/ArL9DAjx/1cs949OPLJh1kHrZx1Y8n5J+cSjqD4lO+2oSE?=
 =?us-ascii?Q?zeksg4/+lrxIhCTdU+Sj5wXbsxb/zeqO2vTxYQiWEm9Bx9E0hTjhpgIkNt+/?=
 =?us-ascii?Q?vlC+a7igUMMEIROw2sKR7ie8IcDSLeuJFDC5KLw0ffA6Qz4jfLNpMTfprrys?=
 =?us-ascii?Q?9We1xTrYm7XdfKYvDC9rR6q0O6bcxzOy5n8Cci97lyySeQgclZh7T4hTNRmS?=
 =?us-ascii?Q?LvPta1OI3I4SD6pFX/AUAKyryGyfgR/G63G65s1W+5EgCg8Roef1tKDQh9Hm?=
 =?us-ascii?Q?mfBqb2TTX2rRWA5dXwpCK8OEM+yzWw2SCI0ApRVXFlGUeY+bDFc4EpXnjJgg?=
 =?us-ascii?Q?bSSy9DItFUExgEClbUouBGN3z3XZu6AQ7GaguV01x92YOEEShHcKXQYWm1au?=
 =?us-ascii?Q?yEqXCU6QQuG9tTC/xLB/5wfXngpvSMq4EVfK6NKT4n/AJb4vZib+AHgHTjfR?=
 =?us-ascii?Q?xcC68KILosGs+2oGEICfQDgu8maPTefV+ANAA7mn6DnhdGLJdMU1DTymjc7W?=
 =?us-ascii?Q?9cr6/l2MjGBSjOjTK7ajcQbWxeG0Jecr3dHpXPyxMiCbpXxn9h8MQZowMtF+?=
 =?us-ascii?Q?feSpgJIYnc0g2EhPmlhJbatZu30mhePoRPhC3EXvr7EwguB0TvL+WBMRmSSr?=
 =?us-ascii?Q?+I3hS8vLRam2d3EuvsvphxROmHpb0xgj7+sA+SiwbehFZrngpKjpE9cg/x4K?=
 =?us-ascii?Q?TQBl6VG7huQ/f7fu9rEpcLFmUCzYANhv0MAaoKhr0zinlrORN/+L03vvhB7G?=
 =?us-ascii?Q?6ke/C0whiSlKccNjEbFI14SffdTrUBK8P3XgtnzJM//QDRookLWpuK6k0vRT?=
 =?us-ascii?Q?h1veMxE58VvocsSuBBFp/FDypSEukWJ43mwTq+DU/z1/rBBEHQ8uE+er9dWk?=
 =?us-ascii?Q?ksJnu+x2B81isd6UqJfyJP+9MSl9hWMbUQSNhCg3D1zgwxyxUSZKXgILUmFb?=
 =?us-ascii?Q?tVvvWE5zV5oOgu0N9T/d+e2yjclkLrpJZH0IrE1sXw8nd6SzKXS243SxzRiL?=
 =?us-ascii?Q?IFEa7NFVkLGRAub3P9uzKhPaP6wVsejGPpTUHC2uV+gMd/nJrN+kF3JTCjYT?=
 =?us-ascii?Q?YPRAzq8YIe8o27o1nnK/waRCfzjaBw+/9JErt4vLP25nYVwuTPSqUmZYPnyr?=
 =?us-ascii?Q?dDIi4I/JiPNppuxz6Z5bKYr5OmqozL6AqgKvfnt6z8tdD1XmlMgxNOomu/hD?=
 =?us-ascii?Q?bQkVYnkADviBpZvCc/O/S9z1UpwjdCbmUnAAX1yMeUlabEfvMDo8XLIJ6kBU?=
 =?us-ascii?Q?Ma2IxJi+rA4kTNtSGSgpvNlegAi1V/khb/cEa4zFfUaA1cc/gotUgw1dHR+v?=
 =?us-ascii?Q?TLMoKNXh/db/ZCxPFVb2VtteDatxdVtZYGdInQ0FMo8rgMkZ6HLI6iN1ejps?=
 =?us-ascii?Q?S8KHhwdr9fE2/W8/NClOphurKGabkgRN8G8zTvzDZcysfG8DYKzfZw90Lq+h?=
 =?us-ascii?Q?2sp/7H0LM7Xfwpix3QnFTH826i1BN1oIuPK9BfJ4ACbPIjB2xvcmcbNZ2Nmg?=
 =?us-ascii?Q?CCtfobAwxUSq7jFhaOiDGiCoZ4hFHGiDCjep?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?e1tTSgslf77JwE4xGGcCaZ+kSAxbhtU/Re5AkYZnT8xcT3OE0UIanH9ltsOd?=
 =?us-ascii?Q?HHhl1DuoA3mIUjal2ARmdw89DXOKrRH9KIGip521XVOPlkF9p673qkSrwIOt?=
 =?us-ascii?Q?xcZE+iVMQllMZBP3e19G+2+7ReID/ph45BJP8DhVYLtoJCAPUaGoIXJymKxs?=
 =?us-ascii?Q?7zG1ilBr5yr0JoZpzuhv4z1Xouyirqx/zYj2c8VQb/zifpYkfc1Z1J1fdpW0?=
 =?us-ascii?Q?jy/EL7dkzcO+Ar5NaMpWbvlHrvJ2fDBbtfhM7IzQWVVN378eTaiy7yNUeoGC?=
 =?us-ascii?Q?7A2Kw0UUYoPfqL9VTWwZonAT5tlxXknWEifVL+deSHLxImtVxxLUmggvlpgr?=
 =?us-ascii?Q?ZtdfdUMh8ElX8IDJ3IgOMfjotAyUbxSyYDNez/hCXsR40JHk05lh0fl8xLNe?=
 =?us-ascii?Q?2tnC3Ipxj8HlpR/chza9wrAchpAkEnhzVfVozw4f+3yT6GsvMlIRJHWUaOlb?=
 =?us-ascii?Q?XrB7vVqJ3EJ21Rk30CPGQK+q6DgDmjKzpoo73ZAPAlXntDhbIyg/tbJ3JBif?=
 =?us-ascii?Q?3YEj26KGwa8a9VUjvzAWBHzoSYMZcvDHernudMO7vJ9HjxQ9RUxq53BD4zdR?=
 =?us-ascii?Q?KZNHMCyAB7hsmzRIPu0BdlC6z2Wct0LqBcaylVaOSyfhmP6rxUax2l585Jwy?=
 =?us-ascii?Q?g4RwYlEq5bRMq9sNaAhxjN7rFHhH5w4NciCvABvHiAiGy0xp3DsMqooYYMTZ?=
 =?us-ascii?Q?v7dO814/S6FdFNPblaDjxlc3A+GNN7wA+iDyWKTBpZ3F77hWTCV6EJaqEViF?=
 =?us-ascii?Q?w7wr6bOI7+X9W9IkLbXilGmnkUkN69TrB07bQSXtYJ9cqDi9gyajai5Q88FJ?=
 =?us-ascii?Q?PuVjvqcX6D80MRfH2joeDBHWCOHjvlxEap/ZY9VhG78p7UP4tVkmzeqbvJNq?=
 =?us-ascii?Q?jAhwB55Iypcg3hKNr55NxtEe6KabCkkfADKJ+siCHeUrqS3JY1LIl8i9AcK+?=
 =?us-ascii?Q?IUaU1BU+gsizMmpP9blZMlhFGGoS4OzzvCuPp7wk39XDIPJSLsALgXOK4cOF?=
 =?us-ascii?Q?f2171eL7zOtgCHXuD0ZwTyd7WNWfChPEEhS5En2XcFVG9BMvKX/JQA3Ks8P1?=
 =?us-ascii?Q?Sm4xmI7w8KHyEx3GK+uxfN9KN2WEw4UeDaPDAkUVlOjNH6GH9CzWsdmxMJfZ?=
 =?us-ascii?Q?x+QQF7zUWFg2+ga3JcEpJPKfFc22UjteAeG70xWl2V38kloZLgk0iOUqiysK?=
 =?us-ascii?Q?2PPUARPoXMQ2Yc0LWqBju7/8PI3lJwrlEtUtmaNdL8zTnCYBn+xlhHDSlp4R?=
 =?us-ascii?Q?vOInXpaRVANNh/x4PgSsdb9I1ds7Alx0S3xluQ0CZkd0eZnww/LGEPTQlngo?=
 =?us-ascii?Q?zOJZ/uxREnYdtlwIbgOxtKjPp7+UbQcVGhcm1Piz9gowPb5gw5GqMQD/iQt/?=
 =?us-ascii?Q?N2N3ZFOwUOwFrlSTA0jNP12ds6gzDZYLN7o8q0Vrn5dM2iaKzW6tGbgvrSP6?=
 =?us-ascii?Q?nh15VK4lJMoys71huo4nxZmY7th2iUomTmriVtwsETmxWhrQ+FXEkazmOWjk?=
 =?us-ascii?Q?o4/lw06Fi7diwwJ43WzYbq1PDZvUf7cB3vHH6Izd3a82leXMW+CamgdhgLuA?=
 =?us-ascii?Q?W1hyTGzV1weUndcnzQe1n4tbxUDApnmT9bXKWJFeZIHTl/yhia20vdhvW1mJ?=
 =?us-ascii?Q?Xw=3D=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 87f7c342-4d89-40c3-0c5e-08de18737d8e
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 11:49:04.3783
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zpRy73/fluTjvwVWULmjLgz5NG2dikgFWK3SLLcxghrT2LLmA2uAPymg36e6EV1RTQOb135jdv3TfxcQFPtQfOSMgA6mAW9+0nLJiLxBxhQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN4P287MB5137

Introduce IMX219_EXPOSURE_OFFSET (4) and use it instead of the literal
'4' when computing the maximum coarse exposure. The IMX219 datasheet
specifies the maximum storage time as frame_length_lines - 4.
(Ref: Datasheet section 5-7-1)

Also fix one indentation issue for consistency.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/imx219.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 40693635c0c3..e87d5a18fe87 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -68,6 +68,7 @@
 #define IMX219_EXPOSURE_STEP		1
 #define IMX219_EXPOSURE_DEFAULT		0x640
 #define IMX219_EXPOSURE_MAX		65535
+#define IMX219_EXPOSURE_OFFSET 		4
 
 /* V_TIMING internal */
 #define IMX219_REG_FRM_LENGTH_A		CCI_REG16(0x0160)
@@ -450,9 +451,9 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
 		int exposure_max, exposure_def;
 
 		/* Update max exposure while meeting expected vblanking */
-		exposure_max = format->height + ctrl->val - 4;
+		exposure_max = format->height + ctrl->val - IMX219_EXPOSURE_OFFSET;
 		exposure_def = (exposure_max < IMX219_EXPOSURE_DEFAULT) ?
-			exposure_max : IMX219_EXPOSURE_DEFAULT;
+				exposure_max : IMX219_EXPOSURE_DEFAULT;
 		ret = __v4l2_ctrl_modify_range(imx219->exposure,
 					       imx219->exposure->minimum,
 					       exposure_max,
@@ -579,9 +580,9 @@ static int imx219_init_controls(struct imx219 *imx219)
 					   IMX219_LLP_MIN - mode->width,
 					   IMX219_LLP_MAX - mode->width, 1,
 					   IMX219_LLP_MIN - mode->width);
-	exposure_max = mode->fll_def - 4;
+	exposure_max = mode->fll_def - IMX219_EXPOSURE_OFFSET;
 	exposure_def = (exposure_max < IMX219_EXPOSURE_DEFAULT) ?
-		exposure_max : IMX219_EXPOSURE_DEFAULT;
+			exposure_max : IMX219_EXPOSURE_DEFAULT;
 	imx219->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops,
 					     V4L2_CID_EXPOSURE,
 					     IMX219_EXPOSURE_MIN, exposure_max,
@@ -900,9 +901,9 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 			return ret;
 
 		/* Update max exposure while meeting expected vblanking */
-		exposure_max = mode->fll_def - 4;
+		exposure_max = mode->fll_def - IMX219_EXPOSURE_OFFSET;
 		exposure_def = (exposure_max < IMX219_EXPOSURE_DEFAULT) ?
-			exposure_max : IMX219_EXPOSURE_DEFAULT;
+				exposure_max : IMX219_EXPOSURE_DEFAULT;
 		ret = __v4l2_ctrl_modify_range(imx219->exposure,
 					       imx219->exposure->minimum,
 					       exposure_max,
-- 
2.34.1


