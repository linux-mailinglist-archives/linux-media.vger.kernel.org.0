Return-Path: <linux-media+bounces-31364-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 870B5AA428B
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 07:40:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DCDF8175A8E
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 05:40:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B0921E47CC;
	Wed, 30 Apr 2025 05:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="xI5AgwFk"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012013.outbound.protection.outlook.com [52.101.71.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CB61E1E01;
	Wed, 30 Apr 2025 05:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745991612; cv=fail; b=rS3DwQe6x2FL2WOgxpjER7wK2VOZrnww/zkB/KjiPcZVtIHhGdfIQWK9/a+TzkdXitT2WKaSH2noTgR6KsFzTBaP9BDkzSaaND9TRamIABO3cXeqbQs0gOUsCvGD47FkkX/cGyxPlJC6zMlyS9VZ+xFP7+59kgp3t1aTBkz9g3o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745991612; c=relaxed/simple;
	bh=/dFbOa1eBOtEiu5BSc4Ha1ty3k0ina2xIdiMf96g6Gk=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=j2wln/Xp0GyJIapQmxe//c2TxxG92TvW3d37l5UpfW6SNKC6VxBiccI+yx16TmH1/+6X9f6z1YgBEzyVAUvHnQjnhVEQHboi4zt5CFZE6EPEUsMiDz+rQIPLSzbBAM4rFE+n32f59F0jq/wc6F4XEV66VzL42LKyljWspirtsTo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=xI5AgwFk; arc=fail smtp.client-ip=52.101.71.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S83i1H9AZLvxlJ8+vtO61hqkJbueg35aU8EvmhPuuB01+N14q+dg/c/fS1+nD0oU/BlWWXLHjKa0S+mr2WkL9uV17ExbqEqEVWm/uHQM+0Jx8IkZrZYKdZlTYs28WYJgqA9qjcMWeSiZQHmA5I+r8YVJxUa5f26j9y/ffH7zj2vsc/pU3LDqSxkM0P18zh3aYwGeBqefu9Jt331AViQDg25gj8rFxflayO74Q5HYWOSTFwyGVh1eracb9LHexObUSXpOg2O+z6ZON3dS1wBHkwofG2qb3EQLRjPWdzBk4vA30/SKKS11LYD7aNw2/XuGTYTLMv4IlSQCHKMAh/qgvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NxYvAGv/5J5LDGAfs0pAOf0IvJfk6ntNN5UN6kj+ZW8=;
 b=aTowmfLlCJA3LHBXQWe0n+1Smog0vecHBoimTDESs9ZhmCOpOIRnYsfMYa4E1GrdttsQ626U1ejNOhJbHlSLH1Wc1Hp/K4LGPjGSh29l16e6xjFmTjhqwG1KkbA42zctwTAOZIyglI679rkt/bwIIqSuyTh56AMSp9LO0wFa0zrkj2mmb71t1hbhG81Pml8Oi1Ily1XhlOqraM4zzx48ZpOHwt+eWXnWxuSo3RiNsRHeH67tOFzlbrmakoluyGBUaLHGUvDUsfy908y6SK63u+C6J26UOvCY0XVyMVuEDC+4LSzJvwvd6BqZu4zwX6EpO1Q38R/+klNHlsqJL8Hjag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NxYvAGv/5J5LDGAfs0pAOf0IvJfk6ntNN5UN6kj+ZW8=;
 b=xI5AgwFku2bCzk7fm1mGNd9prduEIq+U28Uard+AQeARNYb09Hl095Kmx/JrfVs+MZcAZkfWWKbOMpxkPkOVripJhcwmZhF+i4MJQfQeaIQnhWPEXDfenfjcHTVGnUjN+kYjj2QZvTQIF+dP0slthO7xjtci45P2/rb4jjAR8XMJVRKILuCW2XvR8yRR1GSyiDiIXgBh4kYN0rFpQ1i3Bj9ikEjU45PqNKkorSD3lUPQWvF4FBrpDPNU8GVXRhojweg93leuevXI97JogyJo+vnYSCo9I4nnr1gP5ng1uvG3gR0O4Li90kbCOej8JUfkW+9yz50UkxXxZUg/lq4wSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by AS5PR04MB9855.eurprd04.prod.outlook.com (2603:10a6:20b:652::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Wed, 30 Apr
 2025 05:40:05 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%3]) with mapi id 15.20.8678.028; Wed, 30 Apr 2025
 05:40:05 +0000
From: ming.qian@oss.nxp.com
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	mirela.rabulea@oss.nxp.com
Cc: nicolas@ndufresne.ca,
	shawnguo@kernel.org,
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
Subject: [PATCH] media: imx-jpeg: Account for data_offset when getting image address
Date: Wed, 30 Apr 2025 13:39:26 +0800
Message-ID: <20250430053928.214-1-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0026.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::11) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|AS5PR04MB9855:EE_
X-MS-Office365-Filtering-Correlation-Id: ad909514-fb5b-4af8-8d5e-08dd87a97552
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1z+Xjw5JnSGMitt3icUOB4u7Fa1JuZaUCpD9sgB/dOaP+mdpVUjUNUFGGy/3?=
 =?us-ascii?Q?DUZ/KFQZbvc0ktAgBSYEdiOv7Cw0zIaNe2fwMebHUnB5f6In/bIcXowJCNUk?=
 =?us-ascii?Q?kM7QeSms0WcPWlLWUmWlBkDosasigT7fhr3LfEY59ctM6Mgc0swtuF/32hMs?=
 =?us-ascii?Q?HBltDDUzFTvPBQ7WkHa8hOZL7xoRxD/mIU0StNFNzksMV57JrGicf4ckir5T?=
 =?us-ascii?Q?9fVZVhKFkR+IuVcAcWrlHfqIRgxI2J9o3IG0uESeCpkuh/NIfTcLlEkHLBxr?=
 =?us-ascii?Q?XwTi+l9wltOCKo+9sASWr76Hd/nkSZ8J8j6ie9CYT604nfh8wOnUwAlVQ6z8?=
 =?us-ascii?Q?HVJlJS1qxHeRs2KoZIxw3RoHbKew6u0nKtihhIkoJwVmLqoWkO0w0mqFHrEu?=
 =?us-ascii?Q?2v06WPL2VZAlkRLQ7/GGaItt2PPG4uM6NArn5d7PRyA5jyqMyT8h8RSy5yLA?=
 =?us-ascii?Q?z+JwQDMgbN4N9jCJyuklxGrCq1luNn11PavzF0OvpLx19qOd7y9pzp0ZJNFj?=
 =?us-ascii?Q?DimzMYUcnHvJSvL8I3Z4MqDeY7XnD5VSMwxQG8QaqTbdVmTtAX5ZyDCwj8l4?=
 =?us-ascii?Q?gmLkQ6hfac0M+0p2tdgzXYv2O9GyYkaMT+X+EgRNuUuDKINbXf8uP74TjsxX?=
 =?us-ascii?Q?8Uu2g80I3WIu9xnQVzFm1fVtJq1pDa2O1TsoCOchXO75O53GFfuMmTyqAQJA?=
 =?us-ascii?Q?yAWgOszDv+kpoD3ED1k4yflVUPBbiZozR33tG/gdpxQNceecyKUZr8Zj/nqP?=
 =?us-ascii?Q?MxhI6NnkH19csPMAUGd64x9KvgOUbZAVFOMxP1NQg79oCB+E9FIIs1ZCRGsD?=
 =?us-ascii?Q?oW7tYiwAOaZuBW+s2psGoFRchhPbDFz1/Pj+x1qutWNnw9SGb8XCAPUyiorn?=
 =?us-ascii?Q?3PxJSbnb2VNYJ6QaU+qNa6OUppgMrH1Cy70qcYk1AW0RgJtQzVs+oDjoS8IW?=
 =?us-ascii?Q?md96/09XWb11Fff4C+HT9VxioyRag0D6f49IePC4klZKkfPJ5/sXoTJmtjk8?=
 =?us-ascii?Q?rWd+ra1XKSZJcDcIyrT9W81ZZRtvPqYETPy2cHs9i8K52Pdk3R8m6zRza6LJ?=
 =?us-ascii?Q?dXGRe6cDI+ImO/N0rT8PlJ2pDloVtJ0OuWJ9yauYhsDOr7kI4vy8hl0LSnau?=
 =?us-ascii?Q?K0KLAG7OQTOSTKaMuIJeNA3ebTe7J9owYpwHEuCXISFJyudi5bCQOHWBMUhy?=
 =?us-ascii?Q?6QkmbNzx/S2ipcFejtUY7pW6C2bT1xMjii6ucb+x5dIPrdtKuoEd2POR0MiM?=
 =?us-ascii?Q?RD8t8D5ZCz3cGZmGZUR+sb2iJznyNIPaj042vAJgYWBB1ztanLlyglCcUebm?=
 =?us-ascii?Q?p67pk+ShpYrEvDxei9PK4Np5ok7asiv42YM592eHfHCXXQ6aiYDIiRZGZTqF?=
 =?us-ascii?Q?2MA9qzok6PDj/1wfFkWpvJbug4vVMlJL0isce3+GSA14jJBuxiH5MS30hJ9+?=
 =?us-ascii?Q?dmfzaG6PoCQzjpT1Q3HanmsuMuk8CV46yz05vXmo3eYv9U22seJYLQYqhkBz?=
 =?us-ascii?Q?dXyEKdbw9wEqb3E=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fchtjCnwhQyvj9obsi6AI5i5DQvfUwCxRh4jo31jGul9rVDEX3dKXqmgpcCI?=
 =?us-ascii?Q?NjKyraF1hc+dnl0SHj6+QVZYqyMqs5GiGLbe/gRB3cluGDXXeN9PqpixACTB?=
 =?us-ascii?Q?QCG0CD7lKxbo3NK3Jdbz9Ue3BkQ7iDBtkfOO6cfF7Vshhkvh02dW22AbLein?=
 =?us-ascii?Q?22eosha2NJF53xqCzH4X77TX49eqpDAnpVIwPBNXuMoaZb7/W8WHvcskFOv/?=
 =?us-ascii?Q?bxbjiHzvfRnrBcONzTOMVZJgM3ZURu8mHU9ePnKnewnN42lknz4lUtdGo+Es?=
 =?us-ascii?Q?jnZkDTjA5FA8tWTPEP1OCGaaW34Lf5lqve1VUGJNaMAT1PFyO89hUwAPI83F?=
 =?us-ascii?Q?26BLyFpoJefF3xDtKNLR7WjmUYqoMgcC6jd0TCealusPrJskuQdKIenoAjPH?=
 =?us-ascii?Q?QCc/TIjUUUivTl36K1L5YERIXiRkD1h4zb0sBqs7CZvwNEY5BDLUctQhTdLp?=
 =?us-ascii?Q?cSTAyDVsE82UfbC3xB4LU07e6JRNuGy3vyYXsjr//7JZ5x9VULlZ3fRIKb5j?=
 =?us-ascii?Q?HMea8kylCm39NQGktKxl+kigqDshJ7J7Pz+F7i0KSL/45YSw955u1M9yaZ9I?=
 =?us-ascii?Q?lLsopm2oRABCXt3mfq6xlR4oNYIpZX/PV7Elp8fQ3hXmZSodhVPSKUKOabQt?=
 =?us-ascii?Q?w/DZZrAJI2kZwtzG2LCoNhxp8AWl+4NjiFtMUf13lLpZIjB8OcyXH6rQ9R2x?=
 =?us-ascii?Q?1GLHmYYyWf32J58JDWkIQzICVeR417zfV+jszXbDMjp+7oRxfi+EdBTJZj6t?=
 =?us-ascii?Q?njgiSeqKjkdFw1zk0uRQd/62C3lwHEtXAVBFa3KJoZ/r/IZYb4N93Es+JFgo?=
 =?us-ascii?Q?bHZPmVWlDkpJxvwyUfRV/QCc5KTCWw0NLWsJcGR8m+6s21HR7RZJyMfKCSVG?=
 =?us-ascii?Q?LFSHuqp8Po4mB/HWXs+kv/o5WuKJk9eZb4pjpFF63hKPcVh07iXt0Ayfp4Zu?=
 =?us-ascii?Q?23JzbioiO4gn8YK7yk1VFNbGY/CyJaIUiW1thn6vQAi+sRu/qCDlnFvpjPRn?=
 =?us-ascii?Q?xrrxBx1xB4r1DpYeI/lPAu5fjv9dLCty6zMUGsES9aLkNKkO1w2xZYCAaZlo?=
 =?us-ascii?Q?n2cBxiXQSgT9nZSGk8tE/5fJ+imFBxld4S+M7aEmmpCmDL0jnqame9tB+7qn?=
 =?us-ascii?Q?InRbnvrCzJ0JxqDePgHTVVtphmIw8BPbkmbFe5tXNz0QxIH16YoehDBJ6K1o?=
 =?us-ascii?Q?xRUTQTcW3OUmYmX4frBrmI2waZoHMF73SgewDGpXxgK3TTT+mgPq7uqjIw71?=
 =?us-ascii?Q?zmL3NZtVbektDoSeN3vTv8k6q1XRYQmZB0WaA2qIs+6i1z0Ommr7M4eQr9Jk?=
 =?us-ascii?Q?tYDd/XeqkLycjbM14ZJgWAtPhjPXBCsUjx/MiTP+be4XgxlQYufYRS+gaJ1r?=
 =?us-ascii?Q?IiH7wswjBKWYJ8LlZ6ebw0WuuZ1418jr27TXZb5nRYifLevzFdt15o/0xQcM?=
 =?us-ascii?Q?wqoufi9EfV9gsc/K//kvTCCijQupf36Gq8HvJl987iTDIskFl3ti8GxiWVfQ?=
 =?us-ascii?Q?l48hFtyjPc6oT8Q/zCYSeMqx/p2LuCCdavc8dluZB6FnvvFYn66jgV9wT0QS?=
 =?us-ascii?Q?J+/OkkU3UdO0rqTU2mjXKHcqAkb2RY6vnbegym61?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad909514-fb5b-4af8-8d5e-08dd87a97552
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 05:40:05.0561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O8YJsQ/7L8i5tuWG9AOJo9rFQ37U+uevqzXoP0WDTpoCpT+3jyi5AelH43KNXBtCJWMGggqr/aUlgO0kOvBcJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9855

From: Ming Qian <ming.qian@nxp.com>

Applications may set data_offset when it refers to an output queue. So
driver need to account for it when getting the start address of input
image in the plane.

Meanwhile data_offset is included in bytesused. So the data_offset
should be subtracted from the payload of input image.

Signed-off-by: Ming Qian <ming.qian@nxp.com>
---
 .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 42 ++++++++++++++-----
 1 file changed, 31 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index 1221b309a916..035368d65913 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -587,6 +587,27 @@ static void _bswap16(u16 *a)
 	*a = ((*a & 0x00FF) << 8) | ((*a & 0xFF00) >> 8);
 }
 
+static dma_addr_t mxc_jpeg_get_plane_dma_addr(struct vb2_buffer *buf, unsigned int plane_no)
+{
+	if (plane_no >= buf->num_planes)
+		return 0;
+	return vb2_dma_contig_plane_dma_addr(buf, plane_no) + buf->planes[plane_no].data_offset;
+}
+
+static void *mxc_jpeg_get_plane_vaddr(struct vb2_buffer *buf, unsigned int plane_no)
+{
+	if (plane_no >= buf->num_planes)
+		return NULL;
+	return vb2_plane_vaddr(buf, plane_no) + buf->planes[plane_no].data_offset;
+}
+
+static unsigned long mxc_jpeg_get_plane_payload(struct vb2_buffer *buf, unsigned int plane_no)
+{
+	if (plane_no >= buf->num_planes)
+		return 0;
+	return vb2_get_plane_payload(buf, plane_no) - buf->planes[plane_no].data_offset;
+}
+
 static void print_mxc_buf(struct mxc_jpeg_dev *jpeg, struct vb2_buffer *buf,
 			  unsigned long len)
 {
@@ -599,11 +620,11 @@ static void print_mxc_buf(struct mxc_jpeg_dev *jpeg, struct vb2_buffer *buf,
 		return;
 
 	for (plane_no = 0; plane_no < buf->num_planes; plane_no++) {
-		payload = vb2_get_plane_payload(buf, plane_no);
+		payload = mxc_jpeg_get_plane_payload(buf, plane_no);
 		if (len == 0)
 			len = payload;
-		dma_addr = vb2_dma_contig_plane_dma_addr(buf, plane_no);
-		vaddr = vb2_plane_vaddr(buf, plane_no);
+		dma_addr = mxc_jpeg_get_plane_dma_addr(buf, plane_no);
+		vaddr = mxc_jpeg_get_plane_vaddr(buf, plane_no);
 		v4l2_dbg(3, debug, &jpeg->v4l2_dev,
 			 "plane %d (vaddr=%p dma_addr=%x payload=%ld):",
 			  plane_no, vaddr, dma_addr, payload);
@@ -701,16 +722,15 @@ static void mxc_jpeg_addrs(struct mxc_jpeg_desc *desc,
 	struct mxc_jpeg_q_data *q_data;
 
 	q_data = mxc_jpeg_get_q_data(ctx, raw_buf->type);
-	desc->buf_base0 = vb2_dma_contig_plane_dma_addr(raw_buf, 0);
+	desc->buf_base0 = mxc_jpeg_get_plane_dma_addr(raw_buf, 0);
 	desc->buf_base1 = 0;
 	if (img_fmt == STM_CTRL_IMAGE_FORMAT(MXC_JPEG_YUV420)) {
 		if (raw_buf->num_planes == 2)
-			desc->buf_base1 = vb2_dma_contig_plane_dma_addr(raw_buf, 1);
+			desc->buf_base1 = mxc_jpeg_get_plane_dma_addr(raw_buf, 1);
 		else
 			desc->buf_base1 = desc->buf_base0 + q_data->sizeimage[0];
 	}
-	desc->stm_bufbase = vb2_dma_contig_plane_dma_addr(jpeg_buf, 0) +
-		offset;
+	desc->stm_bufbase = mxc_jpeg_get_plane_dma_addr(jpeg_buf, 0) + offset;
 }
 
 static bool mxc_jpeg_is_extended_sequential(const struct mxc_jpeg_fmt *fmt)
@@ -967,8 +987,8 @@ static irqreturn_t mxc_jpeg_dec_irq(int irq, void *priv)
 			vb2_set_plane_payload(&dst_buf->vb2_buf, 1, payload);
 		}
 		dev_dbg(dev, "Decoding finished, payload size: %ld + %ld\n",
-			vb2_get_plane_payload(&dst_buf->vb2_buf, 0),
-			vb2_get_plane_payload(&dst_buf->vb2_buf, 1));
+			mxc_jpeg_get_plane_payload(&dst_buf->vb2_buf, 0),
+			mxc_jpeg_get_plane_payload(&dst_buf->vb2_buf, 1));
 	}
 
 	/* short preview of the results */
@@ -1827,8 +1847,8 @@ static int mxc_jpeg_parse(struct mxc_jpeg_ctx *ctx, struct vb2_buffer *vb)
 	struct mxc_jpeg_sof *psof = NULL;
 	struct mxc_jpeg_sos *psos = NULL;
 	struct mxc_jpeg_src_buf *jpeg_src_buf = vb2_to_mxc_buf(vb);
-	u8 *src_addr = (u8 *)vb2_plane_vaddr(vb, 0);
-	u32 size = vb2_get_plane_payload(vb, 0);
+	u8 *src_addr = (u8 *)mxc_jpeg_get_plane_vaddr(vb, 0);
+	u32 size = mxc_jpeg_get_plane_payload(vb, 0);
 	int ret;
 
 	memset(&header, 0, sizeof(header));

base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
prerequisite-patch-id: 0000000000000000000000000000000000000000
-- 
2.43.0-rc1


