Return-Path: <linux-media+bounces-23856-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D66549F90B1
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 11:50:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1CB561888B24
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 10:50:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70BAD1C5CDB;
	Fri, 20 Dec 2024 10:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="A/L8MMCs"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2065.outbound.protection.outlook.com [40.107.22.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143791BD9C1;
	Fri, 20 Dec 2024 10:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734691797; cv=fail; b=ieJOmPdEb3o71FnmWqo3lUazhyU7HSSF2bJV5KnnNVmwhn6h3Is1lEEm2E8xJf1rLWtKHxK8qlx8KEFxUJ1tZOsJHgH3tuYtFcHlCLfcU5+kQ+zpPOoPoGSwoTqlSmkuRqHe+v+oyr/XUMVy19Gl05/jO2Xm6PfFamVeVZmT8eA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734691797; c=relaxed/simple;
	bh=VlwGoiZRi/nYzrOA6EkTEUjSpkDOHYZgaTA33UUeVXA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Uum+QsRYnBQJa/uk/1qw//vKrbIKkoO8i985niyu5ZKWUh4puHrSM4hpHnilr+ZAWShly8pptP6D0uDys+iJ3vToWv543ahXEIiThFhOQwqggH2JNXBKJ1M/Oj1itWmXEk3Nr9rQdGiTCV0plLk6UHffJ1eY1c+zr2CBYUlf7yw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=A/L8MMCs; arc=fail smtp.client-ip=40.107.22.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QSVkT/Uehfb2oesNcWeYwN/ua8QmLZZUqvvlDpONphF87gPCWqwVPll2jXLYpD2o67fV8zpvHbHY5nJnaMvSvwClTC4GVcQpGSEzv6YVZIoRZ3Up0b9CWnaqRBOVG1avG4tOw2tNfZAvJQDE/iEYk64zP0w5DsrxtZahYtBiVynhpqvodEgYxRYMEcKyZwFagdl3rCRhcDILzhdRpq/ySkpUJqTzEb8AN5P0CLiaWyb4xsUnkDmz5YDRZ64icyt+y14EgIDY/6gX/A/vJz7IojXOq7Hu2C7ZRN4n6sMV5uAQ8W+lUMKcs8q5k8UCPniBgYgNjx36y9iT0IVXD0yifA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UF2+mNsNZcNBmhUr8D/YvQKmNT8y3bT6PDQUhwTE+7c=;
 b=XskY+1Lo8WoUZz/qkHm0+7tXyL7a3T4EP8wplNp+8bBtus28mtKNT2Hljrxw7fB4GmO7hnqcBmT6PBW1pb8yBK9TtVz3SQblBwvXXFV7Td+ZGptlH+bmuOi/HjomZlTD54mTfoTznWcUomL3p5GkzGMzSr7n6bykIMDlKF5pcXU2CCqqQ8Gpyqoov1Kw9OcJNn4ERU4ktuPN4ao0g6T2gWd2t1s5liHDF6DBOErd/+TxCWa/oridKpaswebhGd2QldthnhIepXGYbk2bDwExljJvj5+BV4cR8uDACyWEcqODNY1Ds8wS0mBsJj4FJt5drMa/O9a6Wd4O697UGFSf/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UF2+mNsNZcNBmhUr8D/YvQKmNT8y3bT6PDQUhwTE+7c=;
 b=A/L8MMCshnLKqQ9IKREUCuil4gisNIULK2mFGcEX2VV/Z+f1lF0kB7JxumTmMLUhXXH0OAu6s50Qa6x3+apKyclOvvW5h9+Wr/ddgUXcow7tRTB/wZrWMq+GpsmWX3Z7ZGwdUhTKG9VOR9NUZHPri/h2CGmObXhwY8gKbORW1PncTwX2Wxj2VNruZyaYz9LmSYL9nY2cPZoWN9KJnddWHxJVvKTpXHZG7+MbS1BIrE1Af7jDppix5OhFZ0sQbc0lfnSpl9PZJsJEytKi/HcJzUaMwWbCXueaU/ReQGju7jv4lQGOZjMlVs35GTfWnXnd+0uiw7WPUVAnclEMo2zs/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by DB9PR04MB8300.eurprd04.prod.outlook.com (2603:10a6:10:243::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.15; Fri, 20 Dec
 2024 10:49:52 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%4]) with mapi id 15.20.8272.005; Fri, 20 Dec 2024
 10:49:52 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 1/3] staging: media: max96712: fix typo
Date: Fri, 20 Dec 2024 12:49:36 +0200
Message-Id: <20241220104939.503547-2-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241220104939.503547-1-laurentiu.palcu@oss.nxp.com>
References: <20241220104939.503547-1-laurentiu.palcu@oss.nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P190CA0055.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:656::19) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|DB9PR04MB8300:EE_
X-MS-Office365-Filtering-Correlation-Id: 62782ec7-24ca-4deb-192e-08dd20e40868
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fOFyls31MF6/3ZIl29XA7DGO3M1NGQZYTKTrl1GiRqYuJVYTja5Hgq8ZkYMi?=
 =?us-ascii?Q?nu7wHEkcjaKIP5Akkw/kyVXmfXYALDnp04l+O0/6AjXY2UEEe/BJQIsDiYLp?=
 =?us-ascii?Q?WeoYKg77HoDySd/sQC6wMpDz2JOosxGjbP6kBkXJrgsRd1hUy8mqqTedVP5d?=
 =?us-ascii?Q?PIHgoNjxRZPUQhi8iO83IMNdAqa8ggWyJUB9ZX2or8xJPx+Rcq8nRk04QznQ?=
 =?us-ascii?Q?bbfFGTtXtDFOVMMZqcEKft7ZwlpYOR8mZhSfMHKfxpQ+xGUvdP6F0SsbwYec?=
 =?us-ascii?Q?RKm15wAFN1H9Qybnn3RFZ3b6KgGENrrefC8XfH6GH1K1v06IJDUPUgdaAnSY?=
 =?us-ascii?Q?IiQcHR8XULvon+oBexcSpIwKRYZh+qrvfeIBsXIayY1GFWpkC8qQMcs2GLkR?=
 =?us-ascii?Q?I6oafOy1HQdfbn2qjFeNmk5rq2AK4DFnEV+tbcP2ShJmhfbmXOVj8xsKNhuM?=
 =?us-ascii?Q?OyHUBjFSYFhRp22esFVQ3Ru3yeR9uQPQpjjbVzW59GQhB5WL41JD98Dr+2X/?=
 =?us-ascii?Q?qF0eCgVBUhmUdPVKYIKy27v3qVCO55fRxmlQJAwGB6Av82Jz/3eNp6QD9CJu?=
 =?us-ascii?Q?Bg2Fwep3deMp+VZsmkUFtHFqG8rJ1vdtFPdYwSH7ArKVegZ1BJwSYRV3mN7k?=
 =?us-ascii?Q?hbn1XhTohNAkp3NIsivncF7HRllQ7jpkR53sVB5gKBCq8DzCON5xa8fgJb73?=
 =?us-ascii?Q?HogMzXE6QJ9O6gw76LU/RVWigCAvCXUsvYg2apRBa+eJNwmscjBF8c2sW19/?=
 =?us-ascii?Q?f975g+Nr0hmyqGCOKxkqYY+1r4eOodckeDAYk8gIqhRsIM4uW6V+GVdEljp4?=
 =?us-ascii?Q?k/d4Ms18NTFKfdzFgEqzT1iJp0YcfJQx+mgIheaUbjgHO5bDCC0Tiei8PufC?=
 =?us-ascii?Q?DMtEXEyNbO79xeAXVz3F3I0yUT4l92HIXaCUNOWPQCh4EQCOqLGKtoxh+i4A?=
 =?us-ascii?Q?Cj9dJ4htZ//U/6TUD7TFnyFNUSh7DqbTH4zt+TM7EKEQFebpW4nuAxa17/Aj?=
 =?us-ascii?Q?STbLHhmlXV5+Owuh8CaY1xJCAoP5jIgr4aUySoPJPQA9HHy6AeSW8vIY6I95?=
 =?us-ascii?Q?OABRDomjhg+0XR4xHKcYITObSZVOqES23BQMgEWFWMEu5lcWnGK4GG4wsJmk?=
 =?us-ascii?Q?okXnodIyVLdzWTIh9EZ+MHgi2TePg9yRgDdes4qdUg4feLK9g1CR0UxetapA?=
 =?us-ascii?Q?8sE3Y29JDdEg1/+mwFm+LYV9A2hoi5VlJDPiSnjY2DBnWogMAMzj0sF7GfEU?=
 =?us-ascii?Q?Qd787MMi+Bycxp35lrncgJkOzLDvEusGuFeuHYVkkFtG/r5F29Dp3O/CtHsh?=
 =?us-ascii?Q?PoiVrbIIN2lAZu+VJqu/yBikNaHCWXr5rpXxM8V2nnwhDTEw9B1j9kgg5aYW?=
 =?us-ascii?Q?eCM28QCidWSd5hFVbLdwobUc5G31?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9576.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?90gcCI5u/UxHavdWTRkobOb5fiUiyByEC4bXltXAWgenk7Da0PmKywuq3lP9?=
 =?us-ascii?Q?RKZcgfstrP5vwmm3hn7uynL/IiWd29FAqj6aJ+hLXz+waQU5iU7cpJyudKs/?=
 =?us-ascii?Q?lIbDAuECkkw+4pHSrdBpcjk5ksb6KKmmEoBLowr5C2SXsMPdOj1pUngKJGo8?=
 =?us-ascii?Q?u4OX6kb0HHbmUmM5Zf+p1R1gTpB5KqgFqH4gSXFXDGPoe5yMSWfBE+hZWzIf?=
 =?us-ascii?Q?szN2Pu8HRRClCQFqRoKZwnqgv/G13wkyUEU3s/bgiVpzTtMcKia1KNngCRm4?=
 =?us-ascii?Q?kZoS/nIoVJnd2fwt5Zf06B5NNFtpPw7FKz0UHRx6USsRXKlhH9k8td0ENrgo?=
 =?us-ascii?Q?d8+6SI+W8TuX6m9kEHNxKLku//MUmsfjC16x2fM8bGJfpI0QVmg8N8DBfTkM?=
 =?us-ascii?Q?2wYLEhoxXTAtepawn6jTAJMzOCWuw//xe3U2CCpH8Ea0O7lFO6BpkFXEfL97?=
 =?us-ascii?Q?j0CfT8sgVw4NY7UNz0zmBtH3JBIJ+WquHLTh/nlz8WYHfrqAwZTm0VnZCRim?=
 =?us-ascii?Q?r3707bWCYgOIYJqvgQMLwjpexGif2fkcY26RVQI3/fPWIQyUOjc4MSOS6Hxm?=
 =?us-ascii?Q?PwnKd8Y0VQKqHJgIpa7wyBznGE+vQ/O9SyBnuxAm49WN87js9JkQ2UG5iqZp?=
 =?us-ascii?Q?cigHkLXJ7iq2b5c6zkIl1OOHO591eP65/vkwUmo62gc6FdEz7vvgySd7b88R?=
 =?us-ascii?Q?HHxb7+5bKL2UEY87mM/5J9k3IWQEZjrP0iDqBBIanUcSBMBqkdgIrjYKvfH3?=
 =?us-ascii?Q?MQ4jMgazqvCLrt7jlVx7JEzExbEW77X2Cjt5aEnXyJzrZXQXVmQpfNwxoOpU?=
 =?us-ascii?Q?mz4SFgUE2/zdkIoDcvEiZAfgQYtgQC25jbXkXN7vZrnGg1d5TXUN1BrOCZyB?=
 =?us-ascii?Q?SXm8b4JNyjSxAQz+qVlsY7k+pnRYw4CwlcCGVG0R00ZBIY8ZVBwUDLoVrRnh?=
 =?us-ascii?Q?NHvhZdWUkFx4iv6CjllQjLgUYzy/6UtaAhQ292kdRC4OI5tAVin2jvf83TT6?=
 =?us-ascii?Q?9YtdCXy0pTUXYavx6BzmUYKnU0JFKaZWYbWlpGHMvy6CcTwSsXy8yA7UHisQ?=
 =?us-ascii?Q?0AtS7AGHA7AhjaXoxS3LKYYTibfugYUl9j9IWT/N0VfPSJ41R6KVE1bOAN+q?=
 =?us-ascii?Q?uZHvcvKzFFR1pfh6Ug31ry4C1C2PL7qLp3SkL2Cx0pAtxTq0MJvmMzQM7zGG?=
 =?us-ascii?Q?Np5UBoFKPv/wHxa2U6wEjSde6UXZPIUImXtKEkMHy7nQ8dQ8QUuy6mINR/u3?=
 =?us-ascii?Q?u3uA/szitL5runpjm3PMuSg+gdMECy9pJCRc+eDk7BMZJa9QUBrSOX2aaMzV?=
 =?us-ascii?Q?AIPJd4X/DpECrGHrVFsBF6B11WNeY160KkLLJtTIpp6goal9HfFTVgygMx3M?=
 =?us-ascii?Q?k51T2T4Q3O+Pz4rydoqNxkXxTvnRZKLTrvKSs68nA/6ZxcKOCB9PtKtHQASV?=
 =?us-ascii?Q?hBNUltmAga6QfNmG0VLHyuJEmgx9s2jlQa4ILB6+uMd8LVbdyAvN9sxUEH1W?=
 =?us-ascii?Q?PgYFiiSNBNc5CoyZSjzvpf1lqWRb6oWY+hcxhd+25dc7mmWGUuqLDhIeHtOl?=
 =?us-ascii?Q?csqF8rEHqdypjYnYRklL5O3uniVJQq9ryn3ynwHXTFWugi5mGBE0lEsiYSiE?=
 =?us-ascii?Q?aQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62782ec7-24ca-4deb-192e-08dd20e40868
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 10:49:52.3091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c01at+oW/BMefLOp4O1nI45dUAFGyWh7olSi37cfj3QvyVW6P02gmrSYxdHUMOe+vU2C7+BxmIk52OFjGCZLEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8300

Fix a typo in VS_LOW expression.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Reviewed-by: Niklas S??derlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/staging/media/max96712/max96712.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
index 0751b2e048958..5228f9ec60859 100644
--- a/drivers/staging/media/max96712/max96712.c
+++ b/drivers/staging/media/max96712/max96712.c
@@ -182,7 +182,7 @@ static void max96712_pattern_enable(struct max96712_priv *priv, bool enable)
 	max96712_write_bulk_value(priv, 0x1052, 0, 3);
 	max96712_write_bulk_value(priv, 0x1055, v_sw * h_tot, 3);
 	max96712_write_bulk_value(priv, 0x1058,
-				  (v_active + v_fp + + v_bp) * h_tot, 3);
+				  (v_active + v_fp + v_bp) * h_tot, 3);
 	max96712_write_bulk_value(priv, 0x105b, 0, 3);
 	max96712_write_bulk_value(priv, 0x105e, h_sw, 2);
 	max96712_write_bulk_value(priv, 0x1060, h_active + h_fp + h_bp, 2);
-- 
2.34.1


