Return-Path: <linux-media+bounces-30517-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D642A93338
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 09:09:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D6F93AC8F0
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 07:09:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B4CA26A090;
	Fri, 18 Apr 2025 07:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="MfefxE7X"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2081.outbound.protection.outlook.com [40.107.247.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B12211460;
	Fri, 18 Apr 2025 07:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744960175; cv=fail; b=BjC9Z3DiLvhY4SGWfRwBBkpVU7IxKYLpZwiSW9FqovaEBKQo5AxWm5aofpdzPnLsu1XWqjS8TP3HloF1oVxVntQyiB/CCO3EVGx7eD29yKwTiQKW8xKyXYoGPBnXdvqxg2A13hTCs0eRQS4LEEfNSQFFr2qWH7KtBkMqUcJeYbc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744960175; c=relaxed/simple;
	bh=kQqPXicRpZU1c+Qw+WScmvW+yQ4nrZSkHJBEeKNNt7M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QAtHl5NUAYZiq1IOWX1FmWeu8QJ8WKgFuWRUV7l5sM8H8HPupf268td2UqTJmovbovmB+o0XqaEhrEaI4+6rQAmyBlWTqlSIddceMxh0xvq/5aP4in9mk46BfY9GLeW9bYO81ePGZLht+w3i8HtBhNYBofRTkuWBvbDboQUllVQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=MfefxE7X; arc=fail smtp.client-ip=40.107.247.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Aa3nXcrT+LXoduAJ0uc72yZlnqBb0dvlDynfPPedlyh+9MPK8LeAL973uSb/GOjfw5TSKcgJP/BBTNUdRAMedJ2DzGzwgxejc045PXpD3CNvVN3lQsRaIeyqir1rK2Cd8ymQLl9PeGen90cX2B+9GGSK/25+bi5/CIzUHIceA+0lJ86zP8Aw882vVc2r5wNOQ27cSb6SPd26lnIWZkGCFIf5Ov2I7oktpAodvvGos2uLkAOnxvhovfx1/Y3ALV9lsK6/hhAwhSsSZBAq9rdTUPYvPAhoU4eVYeYcLzZZnAwVuLJGaVEzSfofFhLKeBYuuUtEJN/LmcVWx0aQeQnSyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UViXd6A0+zbyBmgvpaPa84xKJbnSR8rUGGc/vKJ3nNE=;
 b=kCpFEs4Gm8t0yfPjRB/LGBx5pmBQ//1bNQsxCIPa3lObuMdfcvIblQK3IEEb6je8KEjOk0/R5iOX9Jjc5zqdCVItO+arNL0WcZGKp6FKD6E2cW0vYB+mwt4ClgvGdqrD51l69R42Wr+5/wq8iPSR3S3GcKgVJHsMhNPlLOhfCEn26ULDRMnI0OL7mAuNHqG3cL8KSxP+HNXCvzJq4cIzwPLeGC9ilD5anUlA216OnwUrdfRNsuPMjvw5ULXMQ/DqEP/mqdblMv4JKRkK388m8iFPJgnmXgDFhUtv/60nsJgaFDadMcqzEfk7Lf/ntiirgbyMPf+deoUWO5JK1zV6vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UViXd6A0+zbyBmgvpaPa84xKJbnSR8rUGGc/vKJ3nNE=;
 b=MfefxE7XSI6MuSyd0g9exnKKoa0bpVKR/Lil/JQE08qP1fpKxwUA0IQxW9ZQNM7EcgN6dJExuPUxEEHwpHL6zTDVzu846eDlr9o14YRJmE8hp8zCmo3DOm6NADd2r//e8cXIU2Q/JzDYXRRzznE8w2UnPrNLaGraOmBtHRk7a0iYoVlhv27fv+4//RJhZTMxrfEm6SQoEZNxZ81urwFd/b+FSV88r1VqvdNyEgQ70zgkQ6fbGDtIzwmdfhPTnuw/BHrHez36Q9A31SW6ai5XU0jE0zzu5DLAbXenwyLgbjSroqAeuYdqTi0K01DQIVCtTXFN5wnqWjpU6cs3AuoZ3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by PA2PR04MB10160.eurprd04.prod.outlook.com (2603:10a6:102:407::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Fri, 18 Apr
 2025 07:09:28 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.8655.022; Fri, 18 Apr 2025
 07:09:28 +0000
From: ming.qian@oss.nxp.com
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	mirela.rabulea@oss.nxp.com
Cc: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	xiahong.bao@nxp.com,
	eagle.zhou@nxp.com,
	linux-imx@nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 1/5] media: imx-jpeg: Move mxc_jpeg_free_slot_data() ahead
Date: Fri, 18 Apr 2025 15:08:17 +0800
Message-ID: <20250418070826.141-2-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
In-Reply-To: <20250418070826.141-1-ming.qian@oss.nxp.com>
References: <20250418070826.141-1-ming.qian@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0174.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::30) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|PA2PR04MB10160:EE_
X-MS-Office365-Filtering-Correlation-Id: 32f8de2c-6772-46ca-37ed-08dd7e47f264
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xNDJtwzSWbOpL1C01vqcm5rlPumEfjGHNzUZCBZeD8jCBXC+hd+u7+aUx25C?=
 =?us-ascii?Q?b42mCzk60J9IdsOZbBGpcP4WP/Vv7zNA30F+ZTxc9beJx/aZBTNzmjZ8Ol1D?=
 =?us-ascii?Q?TPCyz5H0gul89rkINyuS+8tpU141YgPzDbRG8ZmOHf7HPM46g2nNHCi9Uroy?=
 =?us-ascii?Q?M17Iv6cEzp7UtnGgHiysYx7BdDFi0CxuPSTSZT1pk6tNH9AG9SBRZzREtRzE?=
 =?us-ascii?Q?82oxqW0PyF5qixhFCQzGQ4Snpi0UGljaPDXyTfCyCImXSzZDuJwYp5las1Aw?=
 =?us-ascii?Q?R3rB4S285p5Gx3/Jb4IngIjLCvnf9A3BZYxInRG6dGYvfd6o9eg9JX+TEKmX?=
 =?us-ascii?Q?ifmC13VNKmK/721sN+rWAf3RkacSVFUAKL7rafcy1iBq2//KbGsqt13svFhP?=
 =?us-ascii?Q?Bc+DPdycaZTBctctsShGuuIJM1Ji60x3cdedRFVKAlxdeNn89unaMHteIXUE?=
 =?us-ascii?Q?yZwHEfP3o+XooTi0uDkigIQa4UPyXNqoX3FH28o38i5N9iWTthVm8AD86sLX?=
 =?us-ascii?Q?oITNK/+BvBYdEt5N+Dv1tow6e7nwSazFQHXU7Qxgf4mY3mh8dqB672fvHVCy?=
 =?us-ascii?Q?DeBlvYTIUbwvxVKP3gk8L8eAd9DyORbVsiiA8EEbeWmgZN7kQqclqzrSPdaB?=
 =?us-ascii?Q?6DzIuyeoYJXL1iwyAyjJlhngIVAWNE03J0+cYEJi6LGhqFuGcd0t6z5UY8kV?=
 =?us-ascii?Q?Z8BBim+Tw+hIOLq8CmaGtz593DziF88g2DduU1n3pb2oSTMNlvM6XW5RU+O0?=
 =?us-ascii?Q?gc4JeP8P9+O+528r897DL7Wy/TfPrFzArjnYEyeYHnBHh/ZS13kqjxS4KtS4?=
 =?us-ascii?Q?MCtU82I75qqHu3234PVHYQTR7fGy4jS1UJpkJyeNT/3CC5MNNLJeZUH0953w?=
 =?us-ascii?Q?FSL1JhEtSw3+IvwV+MS4fwBpsfDW6r6vd9WabHlUkLbS0U4WMPquXvCfUh69?=
 =?us-ascii?Q?9DMvR+YmDThk87KiUTsLEp4tGJ8oUbHDbMrrnph1ntPaC1lIw8ZPuf2nBPAz?=
 =?us-ascii?Q?gQssJHcJ61ZZY8ylN8p+Q8GoxTGMJn5zRDQWYuzwVB9SUgfT8guyofb+KnU/?=
 =?us-ascii?Q?0P2wMDHuPjT90UZXWkxqUfKseHujk1cGKk9wKRTIPAACZSF9drTFE8MO1f5T?=
 =?us-ascii?Q?hTR/TSHNf+MwOdOswVCRCJB7ZjnHDkIN1qvMCBAGX8fqW81FWPJ1Gqib/JNd?=
 =?us-ascii?Q?zlT1vMKVy6mz0PcC+e+o01xWWyVUFWt2y/dXAzmF1FHsXHk2BU57w1WhPTVw?=
 =?us-ascii?Q?wbGxS3Cv4jJiLuyZUywylpicNv8qpM6ycuranp0o2OV2LGoZ1fiT8XHBT+KM?=
 =?us-ascii?Q?hd/i6efaJpu2ElFYlEeXjieWU48zUIhWJnKOYvbpyY+2D4M+6JTnYaXcmV/5?=
 =?us-ascii?Q?DZYBcQ3f4oNHVXZhVP0qepshgt5d0qoGhOVi9dX0m4LNVnlRajYfh3pSlkha?=
 =?us-ascii?Q?KumPcUkG6p9TFZges2IpdGLugp4Fgw5K8VuYRRwokcD64b7+DngI6Kd4LjPN?=
 =?us-ascii?Q?SH15mSJfYE+4fqo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nlkNcvQRGr37i4i21vQxHahZPDF07WrQfxNOEGMds2/U3BMEX2ytdMJIHNv6?=
 =?us-ascii?Q?MZgn86cNmab9CD5wNGIGHcVDYQIsfZLnwcSl3wDy9F7+Blrz7Zca4fhx+cMP?=
 =?us-ascii?Q?KXJ5XOI8csphOEgCtadsftJ0WEl5tMV8chGNLbrndpxYLx/1uW8LnUQoHIHe?=
 =?us-ascii?Q?MOI8abHSra1LnB6qyEST8qGnPD6B9m/o1Xb9+sTHsfzRSU+2NFiOtj9wLKYB?=
 =?us-ascii?Q?7TLsd51GrQvaRSu/7DDmf5scx8pWEFXfZhOjCe6nWktYgO6g7af+F1VT9ahJ?=
 =?us-ascii?Q?C4kGhH2auvATChpkrpQ4WXyUsPyi0eOA8kXx5BySfa/+5wkwfNaSP7xqlyiQ?=
 =?us-ascii?Q?lfpaBwZyIn82bcyBR4W+2OKeWWNPFoaoxEHVgALaEnxHyMy7HnJg5rRNBY0/?=
 =?us-ascii?Q?pR5wEll4P3OOorxpXF+huDmw0OcqLK4xAAw27NQaIUOq3zGxJEWji6w/mWhW?=
 =?us-ascii?Q?3PR1BfmhYlsAxrXAlXZmFNLG81v2IHzzJLrB/ExGeAgI56gF5Y+f0EXfkyI5?=
 =?us-ascii?Q?MPS6RfG3UwCCSIiq+RKXwbUOGz4brDaXX/ZVNNreO0YAttrbq93BEm6MVR9z?=
 =?us-ascii?Q?PkO7WxNJK4jZ1HqAqjH1qkflXqzJwg0EGAM79eHzSdyl/q8WyxIUtqJKIj8W?=
 =?us-ascii?Q?OQvCTIr2drVsOGK5mcrfAWm9LgFkN9VskPQ9jwyULSKC2Dap0VpPRrkTfqmB?=
 =?us-ascii?Q?GTA4RpKYFqctBDsfC5xzY1jiX68N1HUjjR+QaSCXrVPeYEkfyfAtFPxsz+Y6?=
 =?us-ascii?Q?vWZFsGKegJGWv1Ri+o+93jhE93uCcD8RAOez2DCkxfQSgJJzBdm/5Cb/IPbO?=
 =?us-ascii?Q?FApqkyv85j4JzeltxgTfj81i/5efJXs+luFS8989YXIjZa7iVszrtIw/vb0C?=
 =?us-ascii?Q?tSqZC9fWqnHBgq+OmWzgCWJDOBqnGpp1If0sX6knFtt2anby+UulIXr5w+9G?=
 =?us-ascii?Q?V5nNqYKL8mk5qwaVYSEzhU/CB0jKwHYRUNZ2DHn+RYiJRb+5re0uea43ZkGR?=
 =?us-ascii?Q?aW5Rei0n84F0a1W58WU7m5Gh4JlXeGJWPvZNzgRgkBD/5b7OttxPpjHVc2/3?=
 =?us-ascii?Q?IzrCHy5ItTFGHi6dsCzc46Lfb4f/AvLrBjiLDLR+FiL3NHK2t7xHTx7NBlX8?=
 =?us-ascii?Q?Bn/rXCn+F3fvodH1nZJEA3+aL9JdWr+0rBmrnNr34co9AGwXe2mBiiz8gUAb?=
 =?us-ascii?Q?c3OksI0mA7GMfNQC3yXnpTL1tvdWwiLjFAhshxstTp67+5TG+Z5tKBDGKiDs?=
 =?us-ascii?Q?zA+HN4HCTVEvMHv8VyUR3tTEiv4q1wmLtXcf/2f4TK4jRMI/v9A7Fgw4F6Bm?=
 =?us-ascii?Q?CJCl8M0V0q41hzE2TpdgEp6aqFuQrGhxiqoTzxQVV0GHalPTVN4SS1mWtaOd?=
 =?us-ascii?Q?+XXg39VPvzMVG5IvmD9RjHWJBD+TAqIesWiOefodg524Pl98nElZ4WzBOTN9?=
 =?us-ascii?Q?2Cag5iA31qpgxGU7YbjZnDqZUjtX68YFGggfSq0n5k2DO7P7Xn8Ci9zysobZ?=
 =?us-ascii?Q?eJIDIxju/1Q4qryzYVCOO2Kl0WKuR+wap8dOylen0cDQVKyUjP19M588d5Ob?=
 =?us-ascii?Q?rtgP5egx8ktt56tBcJtSthFE4GfdV3dmB3xWyU2j?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32f8de2c-6772-46ca-37ed-08dd7e47f264
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 07:09:28.5088
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BFcvR54cLmV8qZzlb+4LhjtGibsDhUOC+yRxvkYPhWXD2bQxZp2EtsY4D9BEXcDiC/KJOMNpN9t7HYZF78BjzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10160

From: Ming Qian <ming.qian@oss.nxp.com>

Move function mxc_jpeg_free_slot_data() above mxc_jpeg_alloc_slot_data()
allowing to call that function during allocation failures.
No functional changes are made.

Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
v5
- Split the resetting pointer in free to a separate patch

 .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 40 +++++++++----------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index 0e6ee997284b..2f7ee5dfa93d 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -752,6 +752,26 @@ static int mxc_get_free_slot(struct mxc_jpeg_slot_data *slot_data)
 	return -1;
 }
 
+static void mxc_jpeg_free_slot_data(struct mxc_jpeg_dev *jpeg)
+{
+	/* free descriptor for decoding/encoding phase */
+	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
+			  jpeg->slot_data.desc,
+			  jpeg->slot_data.desc_handle);
+
+	/* free descriptor for encoder configuration phase / decoder DHT */
+	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
+			  jpeg->slot_data.cfg_desc,
+			  jpeg->slot_data.cfg_desc_handle);
+
+	/* free configuration stream */
+	dma_free_coherent(jpeg->dev, MXC_JPEG_MAX_CFG_STREAM,
+			  jpeg->slot_data.cfg_stream_vaddr,
+			  jpeg->slot_data.cfg_stream_handle);
+
+	jpeg->slot_data.used = false;
+}
+
 static bool mxc_jpeg_alloc_slot_data(struct mxc_jpeg_dev *jpeg)
 {
 	struct mxc_jpeg_desc *desc;
@@ -798,26 +818,6 @@ static bool mxc_jpeg_alloc_slot_data(struct mxc_jpeg_dev *jpeg)
 	return false;
 }
 
-static void mxc_jpeg_free_slot_data(struct mxc_jpeg_dev *jpeg)
-{
-	/* free descriptor for decoding/encoding phase */
-	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
-			  jpeg->slot_data.desc,
-			  jpeg->slot_data.desc_handle);
-
-	/* free descriptor for encoder configuration phase / decoder DHT */
-	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
-			  jpeg->slot_data.cfg_desc,
-			  jpeg->slot_data.cfg_desc_handle);
-
-	/* free configuration stream */
-	dma_free_coherent(jpeg->dev, MXC_JPEG_MAX_CFG_STREAM,
-			  jpeg->slot_data.cfg_stream_vaddr,
-			  jpeg->slot_data.cfg_stream_handle);
-
-	jpeg->slot_data.used = false;
-}
-
 static void mxc_jpeg_check_and_set_last_buffer(struct mxc_jpeg_ctx *ctx,
 					       struct vb2_v4l2_buffer *src_buf,
 					       struct vb2_v4l2_buffer *dst_buf)
-- 
2.43.0-rc1


