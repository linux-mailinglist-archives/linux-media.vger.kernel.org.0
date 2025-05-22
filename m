Return-Path: <linux-media+bounces-33139-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 42464AC0DA0
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 16:08:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3FF827B6527
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 14:06:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D9A628D8E0;
	Thu, 22 May 2025 14:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="DBqh2uJW"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013020.outbound.protection.outlook.com [40.107.159.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087E328C5C0;
	Thu, 22 May 2025 14:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747922820; cv=fail; b=QNgOKSRUxarfi0dFiuM+Paa46qTcPd6Urr1UKGTPDnXH/l1NHKAH5C3EasN92WpHr7cls9qIGepzKtJ0LB9cb62rggJhUF21b+YJU2pRM4Eeq1K6iK0Yg4lEc1KPQ1dSb+qUWgmXmCNEcmvLqkXeWcBH6XMKYrzIqKr5aTvBpag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747922820; c=relaxed/simple;
	bh=TV156EtxR6hzu3CGex0/aWTtznD3wHRyinXVeLsQk4U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Fw1m2GgmwdkzzMDIpr/O9waXzitlBy0TLIJ/MiQCYtY8S0E+2QrAz0BWatPQjBl4q3UYkxPj0QC6zAfNNJjUZeS8dik9BVijGL9IYhkWZWsth979kw9O6LFd86L2irdA95weX7pCr67Tf0yqJQtHuaZZzG9JOvcv3QfkwYNNFVk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=fail smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=DBqh2uJW; arc=fail smtp.client-ip=40.107.159.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BdG+s5pVPrMePhexFDrHHQevyzEhV3OvbKZwTf42baCDifmkdR6f1VVAo+bkzjMSccjO0GY6gAuZ1fMS0XTocQIgHILAFEGJm16RmgmP8+zWEHhJZBr12YiiP3MRz8OEd0BrX0wVBHi+HANcWod26q7/Gv3AYOQQOnTt9Jq9MIo46dTK+TEu+je6K9735oQPSSb+SLnCTyakFqUMCKhMRWm5uUhj6Udt8N/TexJ30+ZSiJWGV6KsO4nnAEswmGzeBklQ83FKdXGEjgF1pmKxXdktxx3e0J11DcQFtB61VYNZzylYLYBFCoYZIfyo0p63bI03ESY+6db9kOwNRU55qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o3ZiWvfW+NmR6QNPMxVhi0wvo+OYomNh/F99QUvV6sc=;
 b=hpheX+zTUmQniqCHUviojNleBGGQL9ywoDqZKErnmwFx3VEmoCt/18g0eoNPu/G7UL+iONwJG38MZi2wf0grIE/BjSgTnX5s8VDdjjpHHNMURxFp6Mg68wkwpNG6Fovv09NEJnBgUKp5PLtPWbb2C5+FTs7xlm8ViIZzTxt1D5mW5TQfllATsPFb0X89K4O6aY/oQm+I0dlAfrCY4ZdvreK5iP+zuSnFxh4YSS845lvehGpt16tpmBdKKd2vqAbYNX98hyRyDdf8Xe/XA9eQwREeINEa5I/qp7UTDORNjel1V01Iz6o9guaCETbayeTiJVDJU8Z9goAkMzBq8fhWtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o3ZiWvfW+NmR6QNPMxVhi0wvo+OYomNh/F99QUvV6sc=;
 b=DBqh2uJW0Z+AT5hRwW+S/6IhgXqFtj0jzTVkfd/abSnoUFyH/Uo5X4oeLQ3TvxgDhNZJbpQT7ycCr26RWK0QVpOUPjCLk4MqKSPvAXdFUFrglrDjSkKpEC1amwIdndvYttfKFh9LO6xgzERvLezm1RN+kyQLeYJElVZ2zD9e0ZLMB4ogWsOkADDo/fO/aMO4A2LCL6k6lldwdBKDvFjfYq9DFLutFIECdjPX3Yjc9dGvIjebVZO499UY8dmcq8LJgJLXwCvQTRCgxaI4thgTuIpHSnBcXH/mwpPv4lACyXsOtNlEmh5Ol8pbE/sIL9Lv/CzakqvICjuPZVpGCxBXgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com (2603:10a6:10:53a::11)
 by PAXPR03MB8252.eurprd03.prod.outlook.com (2603:10a6:102:23e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Thu, 22 May
 2025 14:06:55 +0000
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf]) by DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf%2]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 14:06:55 +0000
From: Mathis Foerst <mathis.foerst@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Mathis Foerst <mathis.foerst@mt.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	manuel.traut@mt.com,
	mathis.foerst@zuehlke.com
Subject: [PATCH v5 4/7] media: mt9m114: Apply horizontal / vertical flip while streaming
Date: Thu, 22 May 2025 16:06:10 +0200
Message-Id: <20250522140613.104963-5-mathis.foerst@mt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250522140613.104963-1-mathis.foerst@mt.com>
References: <20250522140613.104963-1-mathis.foerst@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR2P278CA0031.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:47::12) To DBBPR03MB10396.eurprd03.prod.outlook.com
 (2603:10a6:10:53a::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB10396:EE_|PAXPR03MB8252:EE_
X-MS-Office365-Filtering-Correlation-Id: ee92e31b-f3e6-4f5a-fdf5-08dd9939e8a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GWNSrNo34HOeDHRbngPBzlD9eArPSTCRR9LxWRbKeyX3aw24TcnxF2BjipNM?=
 =?us-ascii?Q?072WzKgI7kTKqK3YCWTfoEjhXL9T7WZwyXWkhgS3awUXBGwaHnnvicXp7OCK?=
 =?us-ascii?Q?ssY9q07LcoFMgkKp9YR5ZBEfMkZflgehf1JZtUHaTsG8eNiPx/nG/ZTjZKy5?=
 =?us-ascii?Q?Z+8ob39HwJkfVWL3DWYgeejO4w5v96MohdYtQj1M/C1Jv+m7uesI1RFYFWQ/?=
 =?us-ascii?Q?6H0Kd9G5UxnKE2rWoYVUCgi1qaZ9Rczo3g2WQ+ZWc6sbXtl/OzunO3cNMEbg?=
 =?us-ascii?Q?HCW3ZKtabrs4KQYRqBtcx0eYMhxeVHPbmSaFNjOfEJu2cuydX1nQ07kWqTv1?=
 =?us-ascii?Q?9N8Y8s40ujShQ3EHf5KttiSeos+UCjqT95eVeAfpwqY5sCypiQ182Bj2owxe?=
 =?us-ascii?Q?WLW8vpaJkqhjUb8OvGs2cELjoMXEnpUAWyHKgc07VPKcei2OCnyVMTqA0yho?=
 =?us-ascii?Q?Xk/xnllbDk9PZQHyWtz2K+hVOYnvdwJuYBjMf/rDgsQi4hugoaKPPHXUdqhZ?=
 =?us-ascii?Q?lFDErUZ9Ay2/CYbzH9JiEBpjlD3MFj1eItI1Glz9TShNFopiXT8ACwACniiY?=
 =?us-ascii?Q?0rQgih8WdDQD1swAW7VpvtjIOdQeu4ZjFD86TlwAoaLyUKGb8sqdkJkHLgKJ?=
 =?us-ascii?Q?vyKe7KWq2fuIcKOD+FSme+w///byU2Hf+nBDULG5BPPeQwYnfOpm/aKgfmZ9?=
 =?us-ascii?Q?2rdVk3WupnZKYxltsjsdPDgS53+nwKoE61VXHdTZESfZQeFDSio3kA7c9IHs?=
 =?us-ascii?Q?quzcS/kjUvVAushl6OH4lwhe5M2hX68fk3gcRkQNO0dg67O9loJZFdV5eoKN?=
 =?us-ascii?Q?yRH+fhuathwAyuYBFLFpFK1O6LeRSTMPkLWLzuocIEhvu353+UyHs5KRsgeZ?=
 =?us-ascii?Q?iZLSw1QnSf6TLI14fCRvRX0UHefZpSXDRomOmpMXfIxeKLd6mM3ZX/i5tNes?=
 =?us-ascii?Q?G9rC+aTV1sIngq0TgesSgsSuLeOQGy5NXJzHmyCF/DpsltYE4xGGtgMRRP7R?=
 =?us-ascii?Q?HaMQUdUx+2L7zbuGQU/aF6zK+vUOjCj6aivg+DwZJJol9K4Gl62IJICQOkhx?=
 =?us-ascii?Q?UGS7vomvDnsgIG/91ByvhxJxicJrCpg0mir4bjsQGydNpn6aapCUudHyezdL?=
 =?us-ascii?Q?2tLBHTbi3rA7bny1jbJL0ffW+y8ReF+uKcOkHCZUJZeb7s6E+syQrRJT2all?=
 =?us-ascii?Q?hdFuOIY6XqMBTuS5wIvyMyieWNegSx0+bqCbAbX9dxi9/cvs/GU/z+A0+wiZ?=
 =?us-ascii?Q?lpovPLmalQlgtwjshjnnT81gba6naqgQimR3RfCQExCCP75auZCaPdeQoNMB?=
 =?us-ascii?Q?OBMu/0GbGI6c7M5/ReKx52mwFEITpQa2hwsQW5qGAj9JyIsvBP+MZiroeYaV?=
 =?us-ascii?Q?bBjptmv6jgjOKfwUKwhaqZYk1zKPQlV7sHrw4a3oDv9Nxar+XnnOsnl6EvkH?=
 =?us-ascii?Q?GZeyaEjsFxcaPnbmZHnqNTJfY54YIUt/72KQId1grdG86avkQKAjeA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB10396.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VkgnKHKzd6Jp35jhUhbmybbehL6Y333Vy64YH2+jONZOyErJ3EnQ+J94UP55?=
 =?us-ascii?Q?kHg7J4+oYvVT/5vkE1zQMR7E2sCBsryltyW8+kMzQebwIqSXI41EuyLCrkrM?=
 =?us-ascii?Q?b6VD+9ARrBFp1PXg0zJoy0Eg1CtmDqrC0C9xR1z0hw5UOd2T+I6gp7Xrv5/u?=
 =?us-ascii?Q?/fP0rLAWx/QUvOXXqXlDBftt2h2/6blARlApjRpQKa3CwFvVf8u4/cSsz0ue?=
 =?us-ascii?Q?T0SMfKob+kUto9HQir0FWnVGEtWCdiwiJ72uDyQy6LQVMHCUOwQQyDGghqQk?=
 =?us-ascii?Q?yTaPMBMedNf8r5WXzkIbL4eIeRSgARro7F6ERq1Zu3F4aLwLZ/s8P+Oyjxth?=
 =?us-ascii?Q?x4Yibdc3/vIuHbmQGZMV3QKiYMClYLbijL30Wquqyn+r0Qne8wA1FDbs4+Al?=
 =?us-ascii?Q?woA9aEeVz9QTKuYQUbx8EegnYdPQ0drEBc6QSnxFBQi791B9mM8S1PYuQi4U?=
 =?us-ascii?Q?qaadUm4BsSEUV7SkPGRsZExoVnpZad5UIISFhJeRHA2AcEWYAI2Hym/U8DtZ?=
 =?us-ascii?Q?pQ2lrxDyyKhpKx/jLUYBH46aF0vF18l1oESz5x7W3n1LTn0HqenTybX7JQIO?=
 =?us-ascii?Q?YNJ9W0/7Pgfe6Nxc+wH2q/GUbKvmJdVdHCq90PW53//ersfX+yfAgRmGtDYW?=
 =?us-ascii?Q?s7FztkapKCHgSHnTp3mZctgl/LxsSXA+MGKzPIr0hj9ojgMMuCrvrwbkmtzr?=
 =?us-ascii?Q?UYOB5axsuXpkbmAyTcG6ubytGDKeOp2zLDvqshGTo9d0/qsGZBS4yv+uX3++?=
 =?us-ascii?Q?NVMqgC7VzMZuqyM1MGoipE8e+QuWmht7LKcNbnvV+tptjJ1knOqpnis8dmJV?=
 =?us-ascii?Q?qh2qgAHtAsU9jGnGvpOPyjSn55SxAwRaFKZcdJR4TxtpkVEipy9C888HhL41?=
 =?us-ascii?Q?RBnKTv8BPxYuHAhrXI1bNKRWyI/AGOjrY/3nf64qmIH8g4R0xS23jITIeNSE?=
 =?us-ascii?Q?0p2NQ/ZgwH0GFYqjlTlVwHwAedcSmeQ/JRcvTttCrBs1ChUvaaTLM/cv6oa/?=
 =?us-ascii?Q?ywyIjE9rRhxVW1bY4RSexH9GkSTw+PN8tofwEsnd2z75+EecexW/+QaYq/nA?=
 =?us-ascii?Q?vyzug/8F8vem+EPld3q113Dx9Jyi3mj+2wSn37Vbp8u6DtjumuTvlpir+Ee2?=
 =?us-ascii?Q?e66oR/eREBBrmVDlbzH3/pNVvuGPwv0jNz1NcXt4arNXWwyE9sEYQpgYEwa1?=
 =?us-ascii?Q?vtmJh+OEDL0bZd8dIr/P56VF4RR8rKQeSoHRbqNNg7KY8qk5ZRYg4eYmezkm?=
 =?us-ascii?Q?JOrOvawsziHn3WrkOQPRtbRnKB1HWSbnGdyudeHhpXKBT169Iy9+YMCHGuDk?=
 =?us-ascii?Q?xa2IHfA0XoAJjm2FqP8wt6ADyON9gtH5Lg9eu7CQdvpmloCVb1tl7I7yeuIH?=
 =?us-ascii?Q?aZ8ed3XqbkLNa16wLju6I6P3GyeKdYUQ2uRQ91JWMW4Kb/QhfLSz5eww10jF?=
 =?us-ascii?Q?2HBmWjQoAQOUJa98FwIE6EAFJD6f0xwThvpmdx3QGbqaQ2hRRAAt9EyyoMKs?=
 =?us-ascii?Q?D3UzqnUn6tpi70uUdz55PtQSWW/lpaCdjBbZ9a4sPsystWJUAuuMMaY0Ea7W?=
 =?us-ascii?Q?zR1N/TZdQt/O4RY2n2lnGvt+7ngWufny67m+upg9?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee92e31b-f3e6-4f5a-fdf5-08dd9939e8a5
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB10396.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 14:06:55.3487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0cRmsa6V2g6Gn9jZEMzZG/kvDvTtQ9DjdjR99RIdZXWUBKe1dxfiaSBnVBtPkjJ9bc4Vtl80MP3wCTzTQUeVaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB8252

The current implementation does not apply changes to the V4L2 controls
HFLIP & VFLIP of the sensor immediately if the sensor is in streaming
state. The user has to stop and restart the stream for the changes to be
applied.

Issue a CONFIG_CHANGE when the V4L2 controls HFLIP or VFLIP are set if the
sensor is in streaming state to apply the change immediately.

Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
---
 drivers/media/i2c/mt9m114.c | 43 +++++++++++++++++++++++++------------
 1 file changed, 29 insertions(+), 14 deletions(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index 6c80c6926aef..7d39978835fe 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -399,6 +399,11 @@ struct mt9m114 {
 		struct v4l2_ctrl *gain;
 		struct v4l2_ctrl *hblank;
 		struct v4l2_ctrl *vblank;
+		struct {
+			/* horizonal / vertical flip cluster */
+			struct v4l2_ctrl *hflip;
+			struct v4l2_ctrl *vflip;
+		};
 	} pa;
 
 	/* Image Flow Processor */
@@ -1059,6 +1064,7 @@ static int mt9m114_pa_s_ctrl(struct v4l2_ctrl *ctrl)
 	struct v4l2_subdev_state *state;
 	int ret = 0;
 	u64 mask;
+	u64 val;
 
 	/* V4L2 controls values are applied only when power is up. */
 	if (!pm_runtime_get_if_in_use(&sensor->client->dev))
@@ -1095,17 +1101,25 @@ static int mt9m114_pa_s_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 
 	case V4L2_CID_HFLIP:
-		mask = MT9M114_CAM_SENSOR_CONTROL_HORZ_MIRROR_EN;
+		mask = MT9M114_CAM_SENSOR_CONTROL_HORZ_MIRROR_EN |
+		       MT9M114_CAM_SENSOR_CONTROL_VERT_FLIP_EN;
+		val = (sensor->pa.hflip->val ?
+		       MT9M114_CAM_SENSOR_CONTROL_HORZ_MIRROR_EN : 0) &
+		      (sensor->pa.vflip->val ?
+		       MT9M114_CAM_SENSOR_CONTROL_VERT_FLIP_EN : 0);
 		ret = cci_update_bits(sensor->regmap,
 				      MT9M114_CAM_SENSOR_CONTROL_READ_MODE,
-				      mask, ctrl->val ? mask : 0, NULL);
-		break;
+				      mask, val, NULL);
+		/*
+		 * A Config-Change needs to be issued for the change to take
+		 * effect. If we're not streaming ignore this, the change will
+		 * be applied when the stream is started.
+		 */
+		if (ret || !sensor->streaming)
+			break;
 
-	case V4L2_CID_VFLIP:
-		mask = MT9M114_CAM_SENSOR_CONTROL_VERT_FLIP_EN;
-		ret = cci_update_bits(sensor->regmap,
-				      MT9M114_CAM_SENSOR_CONTROL_READ_MODE,
-				      mask, ctrl->val ? mask : 0, NULL);
+		ret = mt9m114_set_state(sensor,
+					MT9M114_SYS_STATE_ENTER_CONFIG_CHANGE);
 		break;
 
 	default:
@@ -1406,12 +1420,13 @@ static int mt9m114_pa_init(struct mt9m114 *sensor)
 			  sensor->pixrate, sensor->pixrate, 1,
 			  sensor->pixrate);
 
-	v4l2_ctrl_new_std(hdl, &mt9m114_pa_ctrl_ops,
-			  V4L2_CID_HFLIP,
-			  0, 1, 1, 0);
-	v4l2_ctrl_new_std(hdl, &mt9m114_pa_ctrl_ops,
-			  V4L2_CID_VFLIP,
-			  0, 1, 1, 0);
+	sensor->pa.hflip = v4l2_ctrl_new_std(hdl, &mt9m114_pa_ctrl_ops,
+					     V4L2_CID_HFLIP,
+					     0, 1, 1, 0);
+	sensor->pa.vflip = v4l2_ctrl_new_std(hdl, &mt9m114_pa_ctrl_ops,
+					     V4L2_CID_VFLIP,
+					     0, 1, 1, 0);
+	v4l2_ctrl_cluster(2, &sensor->pa.hflip);
 
 	if (hdl->error) {
 		ret = hdl->error;
-- 
2.34.1


