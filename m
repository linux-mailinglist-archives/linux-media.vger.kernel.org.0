Return-Path: <linux-media+bounces-19820-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 459F69A3464
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 07:46:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4629A1C2257B
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 05:45:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1779E17332B;
	Fri, 18 Oct 2024 05:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Y+yYgOoz"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2078.outbound.protection.outlook.com [40.107.20.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA2917D358;
	Fri, 18 Oct 2024 05:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729230336; cv=fail; b=RksEmJdktMHLRvEm7P+2w2o+Su7qRoeYUA8lnC7vyHy8DuyUuS4wcSgBPNK1fxmR4dGRdERe/IWIKtStL5QtOfEgA4dIBEBfNZZt4OENdkbmdORLnTp/0v1UIuI/DCwQG3PY7QPPXDKtutq1Ugw3G324ULPKIcVBlgQOFWVJD34=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729230336; c=relaxed/simple;
	bh=V9uQS5qYmiXssOXx3/jo+h9bUk3tmEJA4+u5KYczP+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Yo5K7R5rtf5WTay2JZKAUlyyndvCWFVXqRWykNR3s68pe2IOAgngABgz1uW2kRl02HXnnQ2Y4LljKq3BMIJ2EiRKJwM75Jow4AlwpQjiuO6dS09ZD6+ayH6RE463E25gAllQxfymSujbqobomrpNbFJojTr8ntLSyhJiFX2pd+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Y+yYgOoz; arc=fail smtp.client-ip=40.107.20.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l/vm5o79Hh8mIXo3SSB4Ww2ESqySFMLS4aX0iAcX4bv8Xxpe9boAPHpOTemKLjB7W/5AUm6Cwf9VB1cqRlRrjqSv87hQs9CHAMoOtQwG2qFfCCv6IzGuYWxolcSq0o2S9mbLslF2bkUrTsxg9uMKxFh4+4/gWN5EW68FLk4ZKoxTJuXgOBeo3IAFL/56mfF5/M5Phv1o3Q0wX0cjdU5prNzB3f6JEUWV+2UDhdWcJ5tAsU/57Fg0UL9XI6H+Nf/qoBLh3xQDtkCobFMdELKe4cCDLXwv6mgi/bsOdBhE6On+cqLzLdEF6MK0czo1/CR3WCi+19V7kTNgMj/0LsJ6Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z3oKuxRFkA9yHb1hrfi99zYa7fO58IZs40h8sxAWj0U=;
 b=i+nVJMXuBI7w+AfZwfAehKNVqGY0t6gWXspHANczKe1M5T2SNq7x4vNvoQx6OrOY7vpTWQdQmOgxJuWZcLNn61lQfxUcrZELQJxQW9mRJFsjlq9IlsXhozIbAaUzX/RllPExU/RaY5jwRUf3HeLMxO8BRzCBi+c8misqkfU7tlHs6EWh+f/5NdFFiqWA5xdiJSbwpD0n7fUV+NIHsaROCiW2R4YylFDs/912heiEMAUHnnoJ0CVnSIs0aOQTa1gQxFfNa1ClxAcXaIYBrlU5r30cT/xz9d3lmNbmYIMaTYaNCVf9A5TaBHxv7WgKovZgjw9Yyaf3Pa6KEF+Q/AshMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z3oKuxRFkA9yHb1hrfi99zYa7fO58IZs40h8sxAWj0U=;
 b=Y+yYgOozV1yrRMyT9jRbrBMfpyqvLWubAOpMpB/2rEVQgFtoBbsGnev3wn9IN7tlAi4S4lUkL9oPMdslTC5Zh/wKoMmSORzjIqhkpTF7hxQ8Sh6WF3fHsapgcEyeOmoGxgkbpRdhFded8Aq91YyL9tVIkzK73R7p5uqdQlz3YtI9RCSVFZL2cs3gK5cLNTJ163ZdLtGbg6MnL9pB4xws414EpHQLPVoa5DVRQTn9wYTaGHZwrJNmlERTISuJpTpNGh1Jqv5g1V+jewr0FgdphW5ewpPzOV66JExqn2/QvX0vuCZiDmQRHwMPT0Y14ZnhsAx5p9ZRlWNCiUdEgUlojw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by VE1PR04MB7312.eurprd04.prod.outlook.com (2603:10a6:800:1a5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.24; Fri, 18 Oct
 2024 05:45:32 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%6]) with mapi id 15.20.8069.020; Fri, 18 Oct 2024
 05:45:32 +0000
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
	ming.zhou@nxp.com,
	eagle.zhou@nxp.com,
	tao.jiang_2@nxp.com,
	ming.qian@oss.nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [RFC v2 2/6] media: vivid: Add an rectangle control
Date: Fri, 18 Oct 2024 14:44:44 +0900
Message-ID: <20241018054448.3190423-3-ming.qian@nxp.com>
X-Mailer: git-send-email 2.43.0-rc1
In-Reply-To: <20241018054448.3190423-1-ming.qian@nxp.com>
References: <20241018054448.3190423-1-ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0030.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::15) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|VE1PR04MB7312:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b7f151b-c5da-4703-98d9-08dcef3814a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?O0+7Qypc+lwmS8+k82ForojsUIcBf10cCOexPnQeeypps3tyNm3W3BYLg9Hm?=
 =?us-ascii?Q?1f/ggHDu4qgY8xoSRYEvbl8IAkacKZ0QsZbIBusJg/GTpn0sCxSIKcmRnd21?=
 =?us-ascii?Q?5gzbp0dlo9ZNJ39IH140FZeczUu+ldMBjXRycsIqRpZIy++QPtOXRpdxn+rh?=
 =?us-ascii?Q?9M0j79ZBfOQDfM4z77BIQFYTS/bCsoDCAxHONOuLGBe3ONgFa6LSY3Ntlrij?=
 =?us-ascii?Q?WEyVFqw5P6wHBjh9cA/PHi2AAui8jcJHGhSYi/YmnSZQorzdu6Uf4PO+tfjI?=
 =?us-ascii?Q?iR5O1oTef+jRE/PlaONVSKR82vEy8Ejc2TvVxJpS9DQpS3XtAvN/xxlkG0pL?=
 =?us-ascii?Q?ZYae/x+hHjmD0V1uOBqo+w1ctFpu71CnlwVTKUSDsoAF1V8ufhNMeC8x1b79?=
 =?us-ascii?Q?JrWHD6JnqXZfW2mdI33IZ1m2QOHKNopuNnW+R2z54rYmPmM/ryiAcKJkdM2y?=
 =?us-ascii?Q?Bx72NvBaIJEwJ+tFqab2cUXZzi6qDy+z5j1jp/4zKdNRn7MXQhdnV9bu5GwA?=
 =?us-ascii?Q?4fJrQgdPEFn/5qf5BrmsrngaB5akFeaEsuZvb7xFuJxAWnZ2c30BT3H2+jpT?=
 =?us-ascii?Q?foFOZzcfHOQHIjND21JRVH1igWN/PZQZEjeujl/VjwesmuKRqj1HL+MxWimu?=
 =?us-ascii?Q?iOeiigunPV3MZbdAaoW8PTa/8PlU8RIFaatOLglDUZnPO0v2CfWG37+FhVHV?=
 =?us-ascii?Q?CJk1o9oxQSxFuDriV5GXVFUsH9dNJOvllIBpcxWIZGNzh7ITIOiB3oJn8TJA?=
 =?us-ascii?Q?NXl1Jz/kjcBEpQ9i147NM0u5MJSnsqivV+DOdOal3Mmv4MCZrYxUh17vQu9Y?=
 =?us-ascii?Q?Tyr4iy6wY8AV2VN+YHATI27xY0X0sVkGCU5KtK2IyIs7lGOlwFNit90C+UOr?=
 =?us-ascii?Q?fVTGxkxeMTfKC2zY2CnoiC7pysrX8IW73nT4Xcy5+XsEC+kY8pjRhn9n4AU3?=
 =?us-ascii?Q?ExXPyRqHq+T1x6ciwm4mOCUf9TQi3KvMXJ5hRbIaTHqXtkcFJWA8fDswr69h?=
 =?us-ascii?Q?2SitdtsS18hijR3FUc1CT6LI7aqk98+4vmJ4h/JtJNCGtPQDr4IR/2d3xy40?=
 =?us-ascii?Q?rOYltMJrxR+41ygmLlRHDXXk5eK3cMQFi1ChCWwJBF3hO62UahbyYbtRkOGL?=
 =?us-ascii?Q?InAP9NGCnPWF0hPoaUdXu3W/TLmvL3PcwBABM3E+7L6nAn4k6+DwjndT/wO1?=
 =?us-ascii?Q?v76ovAnrIyw7lcfPK/gtQOJIxrT3xEmPYdEJFcD+5D/VKdaxFfG8U5rHPDKY?=
 =?us-ascii?Q?NBvaPyJIKTe+ATGQJhNpYXeIE+XsmXM4dHmaYOMq9IBO3d1FVL+ooCZm6yYR?=
 =?us-ascii?Q?1nMiyma1ohkr/hIuElfxkWoBMuwW3B9mF4oP/8hIA5mEEDyixDDawsAZHe24?=
 =?us-ascii?Q?8WCZ0Fk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1ORZruj46Q/jr+6qrW6nP5npdTU4poY3kbZ5wvyPSIr10oKMyyEMsvmsi1bE?=
 =?us-ascii?Q?3L1Y1HFvntLP4wXwr5udCOQb3JG9/o2V0tp14zzsF35ZIFe5fbWR5xj0o0qX?=
 =?us-ascii?Q?Sy6mAQztmn5C0IYz4jUp/wK5hn0/jBe2plRIQsDVDZ2Da/QZ7sMuY87bEi4i?=
 =?us-ascii?Q?223gw40XD+L0Z+LyQfghr5VNAg8+VGLrupwk4ijdDTk1gQqysvUJmg+8Mpn2?=
 =?us-ascii?Q?q9Cp0G9bw4DTIRVN7kNTsGL6IQi63bUjYhsdFZoz39VcsowSxUkKsv7WWFBf?=
 =?us-ascii?Q?bOLF4WmdRjQW1Lf7qHsHRuoXalw0TpytQ9kJZevdBa8jJw5xT2wvzVebP59x?=
 =?us-ascii?Q?b3aTlF2Pd944MtIs9rYYPS59WNx92FJfNlwSpCJJPi5vGs2kaCk44TDH3krj?=
 =?us-ascii?Q?Rrn0LMlnncN62KiU0bvTeZXgfEMY4LNC+MR2Yg3WMv0iBeoNwg4StEs+oKay?=
 =?us-ascii?Q?im+UPCrOm7rfxZf5CPGo9wWmvWonvlnuNLnSpeQhT4A7x0WeOp2ePjZMnJbF?=
 =?us-ascii?Q?4RCkiuFVioJa8WJWwvRgFAopYiLfxVp9Q3LaVAKtvOgQIFJSITnE85AP7Yx/?=
 =?us-ascii?Q?nHnbrKKWBJjtXI1l968pzsVv5bLCD8DF8rUaPICtcclpabtaQEukpPaui1ni?=
 =?us-ascii?Q?+aMeL9U6pTudx4kTbUkRUWULTgL+G9Y5zGPviwFhpF8LwPzrgxDj/rnfaelJ?=
 =?us-ascii?Q?U05FAOeXX+eGb7Ieo/Zn7UzGmO/nWCp7CgzVOadLH8aWBO+IjVzmPT8spxo/?=
 =?us-ascii?Q?7p3D1SfOF99dTAVO3qp1guawXS3YeWztveulQXpuFnhB6mYqpsqwtauQgbvM?=
 =?us-ascii?Q?6JbR67rN3hRCAExiwQ3dMQyjfqy0dw+NLm60RTfwLd+vvND3lx5EYFBPHb++?=
 =?us-ascii?Q?ECd45OvES63VWy/wwyeusxxnxx37COUGCJw4I21dQ2sadE37iEie+ku96+n4?=
 =?us-ascii?Q?BM4fFEKSYUIxUop0kYZ7r7fYsi+OPnszcsh9M5+jJGU0Gk4cacRHYfG/sRZS?=
 =?us-ascii?Q?ecq5wXIyKFR6t0ksqsbSjjoQOhY/PQworci93wu0y4jvPsXQ2T2qEq5k1kQE?=
 =?us-ascii?Q?rBgdqrFgrHHrHql+R9Sh33+omjykzidCnb6W6cdCOvEeuxiJMXS+YS0pjag7?=
 =?us-ascii?Q?wqoIWVvPIE/UKVKT88A97yJKYTXQNjHyZJIsx8MZohAXojU+DJndYPaZC1eK?=
 =?us-ascii?Q?RK8CMAxh50s0XAEWCTr0omvJ/VOb9Gb1PFzts9PUR6gMaFSBPwmQZgUkHMP3?=
 =?us-ascii?Q?2P7nNkTaUV45tCe0T1HRuAVgDGSRXQP4D1S/eRxadkm7USi2NBPSeA7LSfuV?=
 =?us-ascii?Q?Os8PvpC2CfkFg8/hPFCBwXv304SHkgI5Bs3Av5c+TzOlHygVtTUbRc6Wzthc?=
 =?us-ascii?Q?xZe4/dG6HU5G+ATBv/unxklg+nZ6Uq3epArWrCXNLBFHQkVhJoH+MBbiF1q+?=
 =?us-ascii?Q?yK0UDT6gZXjviq6QDCgW61rKkjRQ7UzmzIaunuwl6wfBUg1O/Lgj+E4lXI9W?=
 =?us-ascii?Q?e0fvJQ22MHSCE/xFknbALNUB0n4zvQg5tJnYh2tdOEk1V3XnceIidkDOVoJa?=
 =?us-ascii?Q?9zp5tmaSwRuGE9hwQCT80+4NKZqlTqdgp/pBO+fK?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b7f151b-c5da-4703-98d9-08dcef3814a4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 05:45:32.5503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v2N2kMCkgZtixJLW8UTDrmJaDdmzH4dKU8MLSRNGEaAW4NLDRDdpXXSO39hFUnGmv3YJ+/7FEUOP8khknTZ++A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7312

From: Yunke Cao <yunkec@google.com>

This control represents a generic read/write rectangle.
It supports V4L2_CTRL_WHICH_MIN/MAX_VAL.

Signed-off-by: Yunke Cao <yunkec@google.com>
Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 .../media/test-drivers/vivid/vivid-ctrls.c    | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/media/test-drivers/vivid/vivid-ctrls.c b/drivers/media/test-drivers/vivid/vivid-ctrls.c
index 8bb38bc7b8cc..bed5f4fb0c69 100644
--- a/drivers/media/test-drivers/vivid/vivid-ctrls.c
+++ b/drivers/media/test-drivers/vivid/vivid-ctrls.c
@@ -37,6 +37,7 @@
 #define VIVID_CID_U8_PIXEL_ARRAY	(VIVID_CID_CUSTOM_BASE + 14)
 #define VIVID_CID_S32_ARRAY		(VIVID_CID_CUSTOM_BASE + 15)
 #define VIVID_CID_S64_ARRAY		(VIVID_CID_CUSTOM_BASE + 16)
+#define VIVID_CID_RECT			(VIVID_CID_CUSTOM_BASE + 17)
 
 #define VIVID_CID_VIVID_BASE		(0x00f00000 | 0xf000)
 #define VIVID_CID_VIVID_CLASS		(0x00f00000 | 1)
@@ -360,6 +361,38 @@ static const struct v4l2_ctrl_config vivid_ctrl_ro_int32 = {
 	.step = 1,
 };
 
+static const struct v4l2_rect rect_def = {
+	.top = 100,
+	.left = 200,
+	.width = 300,
+	.height = 400,
+};
+
+static const struct v4l2_rect rect_min = {
+	.top = 0,
+	.left = 0,
+	.width = 1,
+	.height = 1,
+};
+
+static const struct v4l2_rect rect_max = {
+	.top = 0,
+	.left = 0,
+	.width = 1000,
+	.height = 2000,
+};
+
+static const struct v4l2_ctrl_config vivid_ctrl_rect = {
+	.ops = &vivid_user_gen_ctrl_ops,
+	.id = VIVID_CID_RECT,
+	.name = "Rect",
+	.type = V4L2_CTRL_TYPE_RECT,
+	.flags = V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX,
+	.p_def.p_const = &rect_def,
+	.p_min.p_const = &rect_min,
+	.p_max.p_const = &rect_max,
+};
+
 /* Framebuffer Controls */
 
 static int vivid_fb_s_ctrl(struct v4l2_ctrl *ctrl)
@@ -1685,6 +1718,7 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
 	dev->int_menu = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_int_menu, NULL);
 	dev->ro_int32 = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_ro_int32, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_area, NULL);
+	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_rect, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u32_array, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u32_dyn_array, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u16_matrix, NULL);
-- 
2.43.0-rc1


