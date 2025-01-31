Return-Path: <linux-media+bounces-25487-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43623A240EC
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 17:43:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10A8B3AD50F
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 16:39:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE6861F131F;
	Fri, 31 Jan 2025 16:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="sl7vjvES"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013049.outbound.protection.outlook.com [40.107.162.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8801F03CC;
	Fri, 31 Jan 2025 16:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738341327; cv=fail; b=az4k2pw9kCNqMsIvFcrnlrcUcEwW8QY5tdKak6ss2NB6MZ2tBWHKX4/rYNpAt/2proOLHRGu8hcNB/gNRuSshH/v9BBQpl2l7gOFv8aTT93W1nsyb7Bxk6dqvEIs9z8A+BlhIWGOGoDuswpC59vAKJ/i2Dag5fOSoajXMrkwM9I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738341327; c=relaxed/simple;
	bh=BCIUwP+J62pB8iR0wXPlqWgVn8OnaGK6CtH4pYGSPDk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S1EByLNoK3/J1W+Ib2HP90qMOLlcx8dyzo9XhAl806Zk4eb3WOzSPfp8+0fWgFVGxjsySnpU2OkMLXLGUeOU5hIthrn5+mtMKXRPE2KYtpHqqTlQRA/VfZmcjqCoVjVzBAcXtSJVkd1ayUqYKqoXtUauvEypcD4lrUkQsvBNFks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=sl7vjvES; arc=fail smtp.client-ip=40.107.162.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SaVkkp5Gf3nIki3w75fJuOkSINeSuMwX9IBa+STdnLTbCNiIThk8Ohc937JpHTLMFx/bDry6V3LeWOTuRIAxMectISxCJ3sYW1Ne+TmWaG9mseC9gUsM6OyyV5dAbxs8DiODyOE0etE6m+ztIs3UUbtqBDutiWQczyt3NViQky6vR1/1rkJBijj0lNf0O+Gts9nMp94EhbSo8XLXj6Ar3RcpMRZwQkMj5MQeGvxL3FsZZxbDAi4iiby5g+BqrhHJrPjSmKHuw5/MgSu4U1sYL/sa/SrlU+LovkF66aH8qwSnW6oVuOFI5nRMZ7pfWnqv+RqF1W+p27Hi7fH7ZvisAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mTfkrxsvLGQq9nUjHIOiSjjUQgC/1WYEKm/0T0MUWPQ=;
 b=hXKf83H78cGpN3unlBLoB44Jg16YsGn3/dMJS8mFA5s2YHXR5pB1vqngDCOgQ7vlrW6BXZDXnhGlaos8o8epEgXX68M6/0xR8t0Z54+9N1kn+O6WbMZADehG74MrrUKM3WNTHrAi7mZNpi2er1wUR+WkA0FrFrrXFAPUd4bgsG7HHUjpa4DcLOZX/cbzEf6dSkU7UAWyIsh3Bns0h8ufnNSsWtwPjj0c1qyL7nfB3T51ujkp77j0l0wINgTLDbBXeNC8ZO0icbajAsruvCP/s633h76PpckH4ln9mnkUyWtWcXGktQpj6iDg/H7nz4mpL5g7wNVvDxfuodU1ZlmNyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mTfkrxsvLGQq9nUjHIOiSjjUQgC/1WYEKm/0T0MUWPQ=;
 b=sl7vjvES9dV4tNOHgnPkwN3iUB8GrrQX66cTMtgRkU3dJ4LOGh3wiIyFdAJNBR8lhYuktlxusmAesyZQy7IvohUczntU1eeLsBBBUwLIFGg5bFT5fmiRh2QmpIcVXruZyR9UMDRkK/yvOInDx6X2LdCe20hW82YKEFt0C7vJhEVbNkgvn9grr4qnaEjECGMEvi8JSn27Goiv11u+v0UXDCvdY6Rvv5iwrqneSiF2kau2FWKQJZv+Ve3MnQPH21/BvP6BXS+6uzv7ss2v2xbTDGKcUv4LcNmS50QPEpwUmLGVIyS5UtM6BKSBHbWu9WlrcV1DYRvt/b2nHF3e2J5Kdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by AS8PR04MB8529.eurprd04.prod.outlook.com (2603:10a6:20b:420::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Fri, 31 Jan
 2025 16:34:52 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%6]) with mapi id 15.20.8398.017; Fri, 31 Jan 2025
 16:34:52 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [RFC 11/12] staging: media: max96712: add fsync support
Date: Fri, 31 Jan 2025 18:34:05 +0200
Message-Id: <20250131163408.2019144-12-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250131163408.2019144-1-laurentiu.palcu@oss.nxp.com>
References: <20250131163408.2019144-1-laurentiu.palcu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P191CA0013.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d5::8) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|AS8PR04MB8529:EE_
X-MS-Office365-Filtering-Correlation-Id: 29da4582-0584-46a9-12fe-08dd42153007
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?StyB0wkv9NAqOhjWJbKmR/gitQ5P/RFKGxuBwNBnzx/ftQD2XlTEl8+D1Iah?=
 =?us-ascii?Q?E1zrI/kRGqqApJCHD9DlFbXuKRSY+obT4RQs1UuYBYveoAR5p535xgJVpewl?=
 =?us-ascii?Q?bchJNzSjaeH59C9GjnMp5LFdcudH8deymepn5tNg5pdA45ZHGDq6PKq5qmyo?=
 =?us-ascii?Q?iNCN4ogRvTh0XhT9wEV3ug6ahuYtUfWo6L3zvWG4S35V+bpjZmL2v1pOlHha?=
 =?us-ascii?Q?mZ1SKAtV07M2d9iDBE/EwP7olgMTtFl84sC4A4zcY1aUF6osABNvb/bZLBD2?=
 =?us-ascii?Q?0ucakdgnHZ1k/cb+xamKJH9NJBJk2wsJ1wopG5fuBQWreFZWzfQiD+AK/jh5?=
 =?us-ascii?Q?cF32tX+BIA7pVBJYj4rGq+s86WwtbaQtZhjOfcVxNjBHU1qL7wLu9n6kcloy?=
 =?us-ascii?Q?ZTWDfmGfuRh+VxTU9IlS/VKcixG2zzwQQP+2N1fwvVrGNBjkkD3Kz1pn65uE?=
 =?us-ascii?Q?cfWPSYoXZHqonYCeE4rbt02oiUCvuh0bnif2P33ypxzDqWHxub/iDeSkIG9W?=
 =?us-ascii?Q?5ocs1sw6kwMGCAIsREzGUWw7fPLjpNZ7VpEtHlqnfgG5TThXg5etjzRq/27C?=
 =?us-ascii?Q?Lz+XxYGKUoZcyHY2LX06x9jXUMXcXW1wfxNOv9KbmqzJbJiW2vQmZIfo+Ioy?=
 =?us-ascii?Q?tKLOTEETGwLziItYQxO21SBAy3u46DvPaoMUUCTof2IoPXVbV/h9KeZ56Edy?=
 =?us-ascii?Q?Wqfu5aK5AneaWTXqCE4ozFuPV13EsGK7005yBh+Qw1xI/T15PlL8PJfbM6lI?=
 =?us-ascii?Q?IJUvZd/ptMUl4sj9tot85zRJkAXHEI+XjnZEUuLrldKODPPYBz/jU6hOw8TO?=
 =?us-ascii?Q?5vG2xM41XW56ALM/fk/j6Dh//xnljAp0XFJGhlfTBYYHJwkFG9ocTPXAE3uU?=
 =?us-ascii?Q?R1ytAtxaGOcY0DsPJ+VzicectQX7rpF7rFiWpj1JJux6OkER7kqBGHELpZZM?=
 =?us-ascii?Q?W715XvbmobV7/OhxXnrckIF4ryIoPkQt5MXxDC9ZopIGw3nkNDOcvzBJsQQo?=
 =?us-ascii?Q?BDYvYlgagHUQ0BrUELLijOPxftOUMTDYUw/b8q8+UfkQsZfR+n5PI8I7WlSn?=
 =?us-ascii?Q?5mq2DiYC7b2IGVham4teH2SWMQ15mvLgmqX79ZZFQZLgwVwBP3umG/bNzHrG?=
 =?us-ascii?Q?h610VupPd7OnfozrRpg0aejY/nV8yQ/SBJ8G6AcAg9M6Cr9er39HhE1tS3g9?=
 =?us-ascii?Q?0YL9FiEcaSD5RkIyb5qpjZnAFoamaZ7uR6KApVAhrPL8w0C6Le6v179z40i8?=
 =?us-ascii?Q?qvMhue6/u7HEdYX4eoVZvd6qvFqk+EQMjF+uKa9NNGDlZSFkTJYLtOQ5FiCL?=
 =?us-ascii?Q?Qr1M7R9FCVH6kN16A/wkg++dZeFUC1hd6RP/T8xirUgIRHxL/Bv0vM8zgKYx?=
 =?us-ascii?Q?20Y6xWCjKlNLViEkoeXhuliGWAmK?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9576.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Nn6+HUGqGzQAC1mZOdvOUWQEpzFzGNAUeyfVjPnJgLtSmMJXb5I0QkQRrz0i?=
 =?us-ascii?Q?vPwsY9mRoWAILIWLwFHUjYMDk+UJfviBld/EuXBRRKCC3H8ddKT01RUmIlqj?=
 =?us-ascii?Q?mSVy8aCOiJF0sZ6f5CvFDPvk08BiXmgZSQZh21OUHBKjtSdPs5furhCb/bDZ?=
 =?us-ascii?Q?6cn/vYEtwd0t3f8CvxLJ8Hq7afxfv+dlr7wCtPAKHCpa5XcEClUOuD8nzFxP?=
 =?us-ascii?Q?6gh6iNA0yZ5NtKs/DmIvmfruUadgd+pWWKv/IFjIo2J3HUrtl7H5bM1x+ahU?=
 =?us-ascii?Q?0iP955noF/NTgrxJY2iYO7CRfq2szd1COAfpqEic7azSvLghDqJvtfTutR8R?=
 =?us-ascii?Q?+IgSPjOOIEsdU0tfYrgGnMyOJ5w/iD55hv2y54l2mDGR09u0J3pn1K4MZ4Rg?=
 =?us-ascii?Q?S5/g1P9VzG6+YFdgxtzU+Ti13fVroq4NSE5prm/Q52LAfpIKAwQt1oWtiM+L?=
 =?us-ascii?Q?E+WwgOcHfoFuwzqVeeLom+/7MaH6ldTveqGQnrPNb0OPhvawWh/Y3j+MP46j?=
 =?us-ascii?Q?4x6dZGPnLnAkNZjUnAHqzqk6w8aaqNTOgeD4ou4I+/6Vp3JMKAx8+dZAhBvJ?=
 =?us-ascii?Q?Ts0vi1v2XDgnAwQ1KCuOoJVNKU8LMqGKMWhsbMBn9PA0wm2hSdlrNRHyB8WG?=
 =?us-ascii?Q?wXQmSCdvXGhfxjyUBkYfxpVnzfLrYtcxG2NqJCms2B0Z5aBR3kzSwP6DWE94?=
 =?us-ascii?Q?zuilcJaCo+q7GrmItxTPamUevEMjURtjWArAd28bs25VL62rUBaXMSFBa+Iz?=
 =?us-ascii?Q?da0gaisayS5cQb3jiq6XbA4HHo6f9IVGTayZk4TSDHkqI+v6N6yvRl2QfVLJ?=
 =?us-ascii?Q?F98HVHAWr5MgTGXqRm/Wm3CUj2D3jGY+Wn3OG+eaM0CsayqMnlddc1cE+HqY?=
 =?us-ascii?Q?8ruLK7YHO6UC/uQcnW8jgY1ALGAhWq672qfkZVOHwi4ClRERgashlzVSmxXy?=
 =?us-ascii?Q?SDAzgNN388blsLThjlgeYIir4/EWW1ti7FznAlQRv17q66/KcJfl5Un75IhN?=
 =?us-ascii?Q?kGj77zxcbvklJeH+GFhKOoki7zy+RDeiAvjZEU/9Oel534P3XQvLzXFWdSA4?=
 =?us-ascii?Q?/nmmYr+j+zRfkLjpiDOgan+kXCXxwN+2Z35C8z9PSocuor7OQ2jDhSFvTtHD?=
 =?us-ascii?Q?bTsCrOobz1WfP7Itv5+qBMekq6w6J5Zr4XWlE11k37U88SsaIPfM9E4TaJBc?=
 =?us-ascii?Q?1L0HiQ7+OkIhsn3iSxTlgkjTJTjC+fVmCGBiHOmNajmMdvbQBhCN0xlerQ2j?=
 =?us-ascii?Q?RAIjMTnx7R4hiUCO9EVlVXD74pmXzKPy2x4oSCRnoQvKtONkRYDuc0oedDi+?=
 =?us-ascii?Q?/g1K0LM4xHdop2//ITn0ktJ9mFZu7u4lEzxn70OU6w2D420jXi8wFWk8PU7q?=
 =?us-ascii?Q?n6hSmj6XXJYV1vbrei9N8JM8HuDz6hJI89tjChtJ401p1bZClnH92A+NKVlI?=
 =?us-ascii?Q?DCWL5mCv1lRcJWCmjmJaQUMReUKdTr3Ily0XfKMvgK7w8MoBh+vu+wifsWEd?=
 =?us-ascii?Q?QaVgHNcgChY8Ul6Oa0kbhUyu/AzM7u6WS3P246/XugxOd8ZqZG4YkUXwbkRS?=
 =?us-ascii?Q?3yes2Butt4BWZ1siyEKVksLpIlpNnE3B+4Ybip3dqlKCP4+WBTQKFeR9C3Pi?=
 =?us-ascii?Q?tw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29da4582-0584-46a9-12fe-08dd42153007
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 16:34:52.5689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3JXJ5VqPjL5skbCjzYO11eKC4X07XcFh3lOfvfaooH305/mY1QzD7Wea1mq9NezB5JoF9f2wmIMZrOM9xOTSbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8529

FSYNC is used to align images sent from multiple sensors.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
---
 drivers/staging/media/max96712/max96712.c | 119 +++++++++++++++++++++-
 1 file changed, 118 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
index 307b2f1d3a6be..0112052171b06 100644
--- a/drivers/staging/media/max96712/max96712.c
+++ b/drivers/staging/media/max96712/max96712.c
@@ -51,6 +51,21 @@
 #define   OVERRIDE_BPP_VC_DT_0_2			BIT(6)
 #define   OVERRIDE_BPP_VC_DT_1_3			BIT(7)
 
+/* FSYNC */
+#define MAX96712_FSYNC_0				CCI_REG8(0x04a0)
+#define   FSYNC_METH_MASK				GENMASK(1, 0)
+#define   FSYNC_METH_SHIFT				0
+#define   FSYNC_MODE_MASK				GENMASK(3, 2)
+#define   FSYNC_MODE_SHIFT				2
+#define   EN_VS_GEN					BIT(4)
+#define   FSYNC_OUT_PIN					BIT(5)
+#define MAX96712_FSYNC_PERIOD				CCI_REG24_LE(0x04a5)
+#define MAX96712_FSYNC_17				CCI_REG8(0x04b1)
+#define   FSYNC_ERR_THR_MASK				GENMASK(2, 0)
+#define   FSYNC_ERR_THR_SHIFT				0
+#define   FSYNC_TX_ID_MASK				GENMASK(7, 3)
+#define   FSYNC_TX_ID_SHIFT				3
+
 /* MIPI_PHY */
 #define MAX96712_MIPI_PHY_0				CCI_REG8(0x08a0)
 #define   PHY_4X2					BIT(0)
@@ -194,6 +209,7 @@
 #define MAX96712_VPG_PAD				(MAX96712_FIRST_SOURCE_PAD + \
 							 MAX96712_MAX_TX_PORTS)
 
+#define MAX96712_XTAL_CLOCK				25000000ULL
 #define MHZ(f)						((f) * 1000000U)
 
 #define MAX96712_NUM_GPIO				12
@@ -207,6 +223,19 @@ struct max96712_info {
 	unsigned int dpllfreq;
 };
 
+enum max96712_fsync_mode {
+	MAX96712_FSYNC_OFF = 0,
+	MAX96712_FSYNC_INTERNAL,
+	MAX96712_FSYNC_MASTER,
+	MAX96712_FSYNC_SLAVE,
+};
+
+struct max96712_fsync {
+	int pin;
+	enum max96712_fsync_mode mode;
+	int tx_id;
+};
+
 struct max96712_rx_port {
 	struct v4l2_subdev *sd;
 	struct fwnode_handle *fwnode;
@@ -237,6 +266,9 @@ struct max96712_priv {
 	unsigned int n_rx_ports;
 
 	enum max96712_pattern pattern;
+
+	struct max96712_fsync fsync;
+	struct v4l2_fract interval;
 };
 
 struct max96712_format_info {
@@ -523,6 +555,68 @@ static void max96712_pattern_enable(struct max96712_priv *priv, struct v4l2_subd
 	}
 }
 
+static int __maybe_unused max96712_fsync_set(struct max96712_priv *priv)
+{
+	u32 fsync;
+	int ret;
+	u8 mode_map[4] = {3, 0, 1, 2};
+
+	if (priv->fsync.mode == MAX96712_FSYNC_OFF)
+		return 0;
+
+	if (!priv->interval.numerator || !priv->interval.denominator)
+		return max96712_update_bits(priv, MAX96712_FSYNC_0,
+					    FSYNC_METH_MASK | FSYNC_MODE_MASK,
+					    0x3 << FSYNC_MODE_SHIFT);
+
+	/*
+	 * According to Max96724 users guide, "sync signal frequency must be specified in terms of
+	 * the onboard crystal clock (25MHz)"
+	 */
+	fsync = div_u64(MAX96712_XTAL_CLOCK * priv->interval.numerator, priv->interval.denominator);
+
+	ret = max96712_write(priv, MAX96712_FSYNC_PERIOD, fsync);
+
+	ret |= max96712_update_bits(priv, MAX96712_FSYNC_0,
+				    FSYNC_OUT_PIN | FSYNC_METH_MASK | FSYNC_MODE_MASK,
+				    (priv->fsync.pin ? FSYNC_OUT_PIN : 0) |
+				    (0x0 << FSYNC_METH_SHIFT) |
+				    (mode_map[priv->fsync.mode] << FSYNC_MODE_SHIFT));
+
+	ret |= max96712_update_bits(priv, MAX96712_FSYNC_17, FSYNC_TX_ID_MASK,
+				    priv->fsync.tx_id << FSYNC_TX_ID_SHIFT);
+
+	return ret ? -EIO : 0;
+}
+
+static int max96712_get_frame_interval(struct v4l2_subdev *sd,
+				       struct v4l2_subdev_state *state,
+				       struct v4l2_subdev_frame_interval *interval)
+{
+	struct max96712_priv *priv = container_of(sd, struct max96712_priv, sd);
+
+	if (!max96712_pad_is_source(interval->pad))
+		return -EINVAL;
+
+	interval->interval = priv->interval;
+
+	return 0;
+}
+
+static int max96712_set_frame_interval(struct v4l2_subdev *sd,
+				       struct v4l2_subdev_state *state,
+				       struct v4l2_subdev_frame_interval *interval)
+{
+	struct max96712_priv *priv = container_of(sd, struct max96712_priv, sd);
+
+	if (!max96712_pad_is_source(interval->pad))
+		return -EINVAL;
+
+	priv->interval = interval->interval;
+
+	return 0;
+}
+
 static int max96712_enum_mbus_code(struct v4l2_subdev *sd, struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_mbus_code_enum *code)
 {
@@ -780,6 +874,8 @@ static const struct v4l2_subdev_pad_ops max96712_pad_ops = {
 	.disable_streams = max96712_disable_streams,
 	.set_routing = max96712_set_routing,
 	.get_frame_desc = max96712_get_frame_desc,
+	.get_frame_interval	= max96712_get_frame_interval,
+	.set_frame_interval	= max96712_set_frame_interval,
 };
 
 static const struct v4l2_subdev_ops max96712_subdev_ops = {
@@ -1124,7 +1220,28 @@ static int max96712_parse_dt(struct max96712_priv *priv)
 {
 	struct device *dev = &priv->client->dev;
 	struct device_node *node = NULL;
-	int ret = 0;
+	int ret = 0, count;
+	u32 dt_val[3];
+
+	count = fwnode_property_count_u32(dev_fwnode(dev), "maxim,fsync-config");
+	if (count > 0) {
+		ret = fwnode_property_read_u32_array(dev_fwnode(dev), "maxim,fsync-config",
+						     dt_val, count);
+		if (ret) {
+			dev_err(dev, "Unable to read FSYNC config from DT.\n");
+			return ret;
+		}
+
+		priv->fsync.mode = dt_val[0];
+		priv->fsync.tx_id = priv->fsync.mode ? dt_val[1] : 0;
+
+		if (priv->fsync.mode >= MAX96712_FSYNC_MASTER && count == 2) {
+			dev_err(dev, "No FSYNC pin provided in DT for the given mode.\n");
+			return -EINVAL;
+		}
+
+		priv->fsync.pin = dt_val[2];
+	}
 
 	for_each_endpoint_of_node(dev->of_node, node) {
 		struct of_endpoint ep;
-- 
2.44.1


