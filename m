Return-Path: <linux-media+bounces-19788-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B771B9A1E2B
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2024 11:22:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B1E328515F
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2024 09:22:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9AD31DB372;
	Thu, 17 Oct 2024 09:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="CoeDfK2T"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2072.outbound.protection.outlook.com [40.107.21.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1C61DACAA;
	Thu, 17 Oct 2024 09:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729156861; cv=fail; b=hQK68NbImOSZpJCmocSeiF9ohFgEGOyHc+gMQtomsnkbW6muppukpb0wuQSQfN6CQGDXrhnAldTn5kc04N+A2zJ0v1rJ5tiyFwS6SQ+guqmSai+AUtlfKn3QUnABM7uVJrI6AqDzPLJWScQ8fTB0fHceJ2RaQK72aITNREDAkqU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729156861; c=relaxed/simple;
	bh=uOwMQIkZ9RIxIpbFlViNiVIbaql1bLSvdFZewvkcJzk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SJl4Kms2jMAA8o9IrpRXF4j1FHL8GHEMmSTXPJJdTWZx3UN9T/bCA7CHmb/fmtyUzpA/r46+BHawS8ZIrdB3lJksRXIW9wkMzRzYI0ibpckPULl8dZo15GG7Pi4k0ayiOcAbugsZOY82zXamCUdbOx01G7ZsGIVflhZF4iZfBJo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=CoeDfK2T; arc=fail smtp.client-ip=40.107.21.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XV2OKcx/FKhb7SgYqR+0euKbdYZIowN4W2IWY5GZVMnY21NsuzSDgwzFwyONT2yza62jPY3r0rf+e70QPbs7U9aBZcEhd5nMjk3oSXe1m8OzcgEZT0231G+ekU+o4+a6dm2/noAEWkVkxOCd+8//MwktnNF5gVMWoRTUBhemjJ2mIFt0bndaM/ByemMf15howivXodWgYIjKOHcigdqJr8vNoGhux7ct2YHF3o8Q+/WbEmFIMyv5APEP01VNe1tOOtVQeTZZf3qHYj+B4bqGpaS4EFUI7w9nOAvjoct3O8tSLDNBqWYm0f+6VUMACsPYexvx81Q7V8fgeGSRxMa6vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZsrsilQB6hYf/CppEdLlZz46gXU+VJmSX74tnVqkasg=;
 b=Y2wJfwNizD3lfP3/ONRm1gRkajqVkV5uqe6QU2BnY51GTCdwTgY74u/a+lvyS9SOb4h6IqAQPbQSv0HXKqpfaA9i+KSQQIw8Wn6Khbv/HF3AzMk2h5mAkNtsL3yVNFR3l+MS1r0fWVrwa5PUibT887cu5/cVHIVhjvPvg1uPkXV5hWgTwT3c7opA+CuNyj+VakbNR/No3EjoSFN3gpKqaMmbVNZ3Zx53aXyft0gd50RySQO4HghPndTVtMGdUc1yvjEGgq01/Zw3NAXul0m5pvJFq2xeWJahv2dnyhICoFyTHKpmodsOdKrDfqAbIMSF88ORKV/6SJy8lHtat4NGTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZsrsilQB6hYf/CppEdLlZz46gXU+VJmSX74tnVqkasg=;
 b=CoeDfK2T2IfQ8XbrjZN4+Sb1YVpmHabcXUShjEukKhRPirsuA5A6Mx0TGBVahYVBd4DubTxKLb8aVVAUaNkw3PMX3YkZn3lG/raJlTkShCqH7T85rjzOBF7JzZtVkPnUrfyLJBf5ur2ZJszX7G0O69NXAl2H36RlZnlR8T3lHstYQhsWS3L3uTtrhcp8MOtpQGU8bIVMuZRZwekM+BeW5Xt9d/0YsLqUjeq3TQjbyEoZ66gsuNN1tq2H92Kk8aYDdMk/XkCX7BzRRiwxufp6gK9bOWQzuCiAU/f1lrhfHktXHb0oPNJgTPiay0UCPZFgj+S9VqgAfrgOr84V2Q18uQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by AS8PR04MB9061.eurprd04.prod.outlook.com (2603:10a6:20b:444::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Thu, 17 Oct
 2024 09:20:54 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%6]) with mapi id 15.20.8069.016; Thu, 17 Oct 2024
 09:20:54 +0000
From: Ming Qian <ming.qian@nxp.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl
Cc: yunkec@google.com,
	nicolas@ndufresne.ca,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	xiahong.bao@nxp.com,
	eagle.zhou@nxp.com,
	tao.jiang_2@nxp.com,
	ming.qian@oss.nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [RFC 6/6] media: vivid: Add a video region ctrl
Date: Thu, 17 Oct 2024 18:19:51 +0900
Message-ID: <20241017091951.2160314-7-ming.qian@nxp.com>
X-Mailer: git-send-email 2.43.0-rc1
In-Reply-To: <20241017091951.2160314-1-ming.qian@nxp.com>
References: <20241017091951.2160314-1-ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0129.apcprd02.prod.outlook.com
 (2603:1096:4:188::19) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|AS8PR04MB9061:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c79d7d8-c2b2-4ca9-219d-08dcee8cffa6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ds/78agqoIlNAiOhoZ5Q+HxhZuZq7ER1GHxM5EBV3Nrif7PrebEYpmZ/Gm+M?=
 =?us-ascii?Q?X9twJLULk8S5HGcIXmr+ySLGWfQVpW0e7gwvXndL5PbHBeX6BNx1BKyvgRbN?=
 =?us-ascii?Q?iRqL22YvtxzsXcm/hWqa2GWlk8UHMu6wobMdlOH0DGlIG3Q2REhGmykA4wB4?=
 =?us-ascii?Q?HphViK9lIOiH0ekdqn/A1XEE3v3bYTFKVPoBlQSuOUtZk9r5vFDKWnSJ1lKd?=
 =?us-ascii?Q?4nAtD/LKSTWTxnU/FV4rxLH8WBX0sFoSZgHw0JYmq9c7f1lYgHLLK6JDUwWt?=
 =?us-ascii?Q?cbQDin7cV3WjYqdPrcqZs7i3pLLAbVjy9ELHdiHSiocnbUWL8w3pJiPFBbq0?=
 =?us-ascii?Q?/6XPNufx0N9W9Zbv+4OMTjsBDPrXoAiFnwr3ZRb80wvpyOToHmMQLoUQHydL?=
 =?us-ascii?Q?PZvBQAfFqDnGE5Q8AnHUs6M9NTlCoy0e6pBwxYMSuTDDoXs9hjlexHgk2/dY?=
 =?us-ascii?Q?TkmE5Fz5irbo/UpWtdJJ6N6c3+vi4UPvx85ypt1Q5qeayBGC6nhT37xTUH1S?=
 =?us-ascii?Q?SDBL1ppxB7y+aGLtkWsbROgTjLUdyJGcka6zQYExXiDgNaqvCcFl2q39hwSl?=
 =?us-ascii?Q?v/mWvboN0uXC0dM4q7mQrbFFu21DEGnyIso4zV5aHsccLGZvvBGM7clBcLql?=
 =?us-ascii?Q?GxI22U+sKtDnm0Q6eoYyaHL7ebdWXUw8q85vxVqUO7bl/+53MqNCIAgYzzpX?=
 =?us-ascii?Q?8qhHnhM5HMQUxoLBrT4sI3XUk3Zjg7QMfqX9OvVeQXvT0mA0muLdZ/wPQh49?=
 =?us-ascii?Q?OmOu9ogAvU+pRdcze1ibnLy+sRs0jPu1AE4ugCIVA4bHMnnnZ4cRgg1NCoLf?=
 =?us-ascii?Q?Dwwa0oIvNtnLrkUzTDu0PrXAFwlnl+hAXipfokui9jZ9EPFcMax7XOhKpNv4?=
 =?us-ascii?Q?WVLp97BC6+2wjxY32xt9nnwzVN/bRl4Y49CEG254iLeu39xHcDjFPidNMvFs?=
 =?us-ascii?Q?th29xyFav7Cd+D2cC01cfQVYqYQ/txH5teSzyYwbB0aiq/1XlyBvEgdU5eGj?=
 =?us-ascii?Q?mbkA3y7SjfB1bV86s8ZcOqfrj9zQvBFYh9E8KApChGSXcC5mvvvbIizVztTG?=
 =?us-ascii?Q?2D9o0zlkjnxrCduCDX5aUSmZaS7aU4cS+VsmKJOpIe7GEfBaARla7G99ijpW?=
 =?us-ascii?Q?ujyTI6xPKkOwHKSJ95EHany2evmLPjP+1/sJ0BvtaSJAhc/mGdm2GqSSdEAW?=
 =?us-ascii?Q?qxCHE8kQzFou3wWysrIMkwi4buHk3HHWmm7tckLDJChOgXqL2HcvqotRFuST?=
 =?us-ascii?Q?OY2LyptogXgM3ea6MPjQU8vj1iiBbSV1gF23It/J/SdY0Am2LYrxo1PrzD4v?=
 =?us-ascii?Q?IeWm6QyYig+56n8Sq2x0exXy2iJDMsUj6KW28S+nApd1l01JqyL1LX3VTEpf?=
 =?us-ascii?Q?7JmGn2w=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wqMyBIiSEoKZDdx91ID3tw8Kuy+1OzkT2ORy7BeY9Uo2VSSL+MlXOXIBqmWw?=
 =?us-ascii?Q?mjul3R+B7GLbXfhmTu/mLSc1C8hXiEXnfrMYE2p3aJOzb5ZfzP2wzVApu901?=
 =?us-ascii?Q?R3pMZGV1dvHA/PV3IKlKmaffS20Z3XGzL0fRAvhDLTbo5+mltLeMkuw/uk5r?=
 =?us-ascii?Q?1wDuPfItTv2Lx0vxYWbzywQKrXhdn7vgB9OK9WcdmEBNlYbw3jGJJF3bEuyS?=
 =?us-ascii?Q?UWu3CZKPWYVAQEdxNLHjX5/aWSGCt+ZZT/stes3CRu9IW4SaUF+S+YjhWKB2?=
 =?us-ascii?Q?EnHyG7wUT7z7r/5oN93URhHvT1HZRxJrYKwd0VIZM4g/zngcbB1V0mg18N8D?=
 =?us-ascii?Q?ti1iTtXtWdIJsXvIHLk5AvQ0eubn2+OMI2OZ9L0QoufJqeYYS6S9qPj0TCEF?=
 =?us-ascii?Q?TM39kSqLmy2TOqDjEUKo9aiBWGBazMT3cTJ9IpFMLCr8yegbfpFNUrRQ/MZF?=
 =?us-ascii?Q?bT4pegrDLc8ByUYC1znlDPBT6tNiCwzy4P7fH3NlIxUhLrXM6hbu5x7Ti7Xf?=
 =?us-ascii?Q?HzpNYq9NfDFOxmFsH44tWuHSwn1QGTTl2DWbCiR4JGvzyII+Ebg2s6zV7n+J?=
 =?us-ascii?Q?VSV/mwVpG0cp1EHBtiN+V4FvpU2c6vdqHMoatYuCDRZ5ZQ2iDMJxiq9PTBCQ?=
 =?us-ascii?Q?0gN3ijg1b7rRVTUI21X/db786+CUpe5Vnptdgz22TZPWPtPPrBlfflm4y+oH?=
 =?us-ascii?Q?6nYgtP8Hs0NbNJvBm5c9fas4oBcwxNPRcdRF0yskyizOQAPXf973xzoQyDRI?=
 =?us-ascii?Q?2rAKFfv8tn98uNpA4mQ6BRo8DYsTeQonMEuhoAWBkBllbKnfQ9cQYzt3UAmK?=
 =?us-ascii?Q?kLlLtl7UCYhCDMsA3wUO1NQiOLLCv37dTs6SjvozbdF+yWq70WVHEdV0ZV8i?=
 =?us-ascii?Q?55OA3ucq5H4WLV4QRJJV/yJflYELvBRJVSCFn2/9YltoUOzeLDT2x5MB8BPf?=
 =?us-ascii?Q?tLcW+JVB6fDjcuGvfS04oMkrVxoMXhG07Gs/EeLwqXdN3fgcTLgdWjZaagP+?=
 =?us-ascii?Q?GXGq6VBK3QxEDeFLJWk+j3/UKU8NV92ktfAqW2JsSza4VjPuvt/CI7MwRflR?=
 =?us-ascii?Q?752RouKFLHhpqMz5JSM9rZbsNx48kymAQy9+Vnj3VJ2QnrNhDyK+xPtI6X+C?=
 =?us-ascii?Q?7+iwICA901ymcO8AS8xz3Ywa7eNQye1YAnhlpzNoH3VzupWUsAXZLV7n2Ru9?=
 =?us-ascii?Q?APP8ol+FRvSCL8nYuMA37ppFDGiHjhgDjqv9xoyH+eapHjvLKxDlW7O7iHNj?=
 =?us-ascii?Q?7OUZ2J0Fd06zDnDQDmO5MoFo5VdM0zlD9SR6ohbzy25TgFn8eJGGv/qf9KKE?=
 =?us-ascii?Q?X3IPXYbxxXhw4XO65WtEXiPegigkVX4L7V2RenLPBNyvKWW2Ka4e8msBeJCj?=
 =?us-ascii?Q?skGtmT4oTH0YvzUFKraVZ1/7UlAIyIwXT8I+Ej3wEZMrDyzIfN+6hynSVvU9?=
 =?us-ascii?Q?AyuZ9IKFEzUFpmKjekyXv1I2LCwaKsDxRyx62yByRj3L8ZABHAdCnGQ7m2OB?=
 =?us-ascii?Q?eL1WZZz8szh0kCfUpxGYtiffXl9F8q8dvdxncmgKq0TixaqE+RFJ/xrpSSFs?=
 =?us-ascii?Q?yJ8pL9mSZDIldltCFeR9liozHl7Ai6ca6ffds1ck?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c79d7d8-c2b2-4ca9-219d-08dcee8cffa6
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 09:20:53.9269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LHWKERgcjRNW1oVN7NE9PegOdHyfAq0IiUJjkq2vJgw156ewuerO12stkcmnUkvthyNSBIAdYLNN8y7M/GjsEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9061

This control represents a generic read/write region.
It supports V4L2_CTRL_WHICH_MIN/MAX_VAL.

Signed-off-by: Ming Qian <ming.qian@nxp.com>
Signed-off-by: TaoJiang <tao.jiang_2@nxp.com>
---
 .../media/test-drivers/vivid/vivid-ctrls.c    | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/media/test-drivers/vivid/vivid-ctrls.c b/drivers/media/test-drivers/vivid/vivid-ctrls.c
index bed5f4fb0c69..6ea64bea13de 100644
--- a/drivers/media/test-drivers/vivid/vivid-ctrls.c
+++ b/drivers/media/test-drivers/vivid/vivid-ctrls.c
@@ -38,6 +38,7 @@
 #define VIVID_CID_S32_ARRAY		(VIVID_CID_CUSTOM_BASE + 15)
 #define VIVID_CID_S64_ARRAY		(VIVID_CID_CUSTOM_BASE + 16)
 #define VIVID_CID_RECT			(VIVID_CID_CUSTOM_BASE + 17)
+#define VIVID_CID_REGION		(VIVID_CID_CUSTOM_BASE + 18)
 
 #define VIVID_CID_VIVID_BASE		(0x00f00000 | 0xf000)
 #define VIVID_CID_VIVID_CLASS		(0x00f00000 | 1)
@@ -393,6 +394,32 @@ static const struct v4l2_ctrl_config vivid_ctrl_rect = {
 	.p_max.p_const = &rect_max,
 };
 
+static const struct v4l2_ctrl_video_region_param region_def = {
+	.rect = { 0, 0, 0, 0 },
+	.parameter = 0,
+};
+
+static const struct v4l2_ctrl_video_region_param region_min = {
+	.rect = { 0, 0, 0, 0 },
+	.parameter = -51,
+};
+
+static const struct v4l2_ctrl_video_region_param region_max = {
+	.rect = { 0, 0, 1920, 1080 },
+	.parameter = 51,
+};
+
+static const struct v4l2_ctrl_config vivid_ctrl_region = {
+	.ops = &vivid_user_gen_ctrl_ops,
+	.id = VIVID_CID_REGION,
+	.name = "Region",
+	.type = V4L2_CTRL_TYPE_REGION,
+	.flags = V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX,
+	.p_def.p_const = &region_def,
+	.p_min.p_const = &region_min,
+	.p_max.p_const = &region_max,
+};
+
 /* Framebuffer Controls */
 
 static int vivid_fb_s_ctrl(struct v4l2_ctrl *ctrl)
@@ -1719,6 +1746,7 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
 	dev->ro_int32 = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_ro_int32, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_area, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_rect, NULL);
+	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_region, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u32_array, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u32_dyn_array, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u16_matrix, NULL);
-- 
2.43.0-rc1


