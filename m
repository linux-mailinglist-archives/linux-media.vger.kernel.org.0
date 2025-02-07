Return-Path: <linux-media+bounces-25801-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC707A2C18B
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 12:31:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E9BB1886D59
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 11:31:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D47A1DF748;
	Fri,  7 Feb 2025 11:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="v4u2bN6J"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2055.outbound.protection.outlook.com [40.107.22.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882A01DE3C0;
	Fri,  7 Feb 2025 11:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738927840; cv=fail; b=jcEsOWcSQ+t79B8m24ZlRevGgNWe9rlFKcR3TUYn+VGPBQLJ77/XqIUOR+CbsXKXiujATaluer/EMqI5B3D0ye9y+7ZDBFB2QKFEzzP+ZB3G8DrcFw9R1IN+aC3b9WyWE9m4FE1sKqu2FiBbvn73V91Y9PrC7WIUQGbPyCANFJk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738927840; c=relaxed/simple;
	bh=1hHFzgGazPB89wZhW/nUS8bMueK/sH4vKa0sV293FDI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dLqjge7VlBPtKAnLk4eJQqT9/tlB0HwEoOyWC+gPQRBSD22HK39i34qRHctg+QaylpKXH/atTplml/G+7G/AprhQN50nlNrBHBPIQ1RfcO/33RYjWccmPwAyVshATojXHOGmECaF8KO54vFi7wMMea5PqNA4irFypV+ASgTxEfM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=v4u2bN6J; arc=fail smtp.client-ip=40.107.22.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JAeBmVkNpdovLf6Z2rS1q3Kzg0thjjPctVtf/voQP5z4avDVh26efWGh693pmldJFvyAKIp3lnHVn7hzQMrp4DfASBhnp9FPW7Mb3lXVFkHnEqyeck/7gMbvQc0WMP9jQms1dsJaXePrthfbbkV2iFG6/7uV7AlAYzbA0SMJrfW+AiOaxV5zavZflgu9jN89iiLNnY7TA9Qb7UBwVfczd18WUpFbCCq5wFNgh+0I7g1MWjCIe3CdF6cFeo4opvcF0wDmp2LiD9ZKt5ELIaH67t1TAgMiLyn2ySkSDMHXSpwiWEaJ3v0WT/xLqiBILh8YzNLIl8cdTGdfKImLzSnfVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KNkBFzEiYpCNUxnTf1/1CK4CQbmq/Sekyx1DyqxIy64=;
 b=iHpHnAGR5+ilMOauUB/gSVDrvVMnya3nrnlc+fEN9Hg2+SV23kfcLwQSEjddErL6eZxAGYAnrYLqs/JQOYbn2mfOB4i1aXWHh4JYSPKZPD1zX7f3VZAYD/e2zhjxAGRpVTRFYd5aNaT9YBAfWzG9FylyjueLm1kx+PSMzJnfuWdk8zYZdmLoGKJl+x2CUb51ZC8MCKpHKRIHEZ6GQFl7YI4MaNTsppyC7Nghoa8+Z0i63nbuPakSm4qF9ct9Rh7yXnb7gkGGAWHTa6urX7vcW+8594Mf12pq/giMjhYZmvODiCVJZMvkA3euMjHcw1bgbQp2/qOfjW3000qqMXp+Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KNkBFzEiYpCNUxnTf1/1CK4CQbmq/Sekyx1DyqxIy64=;
 b=v4u2bN6JH/jjRO5x+BJOCQMfDkMSmEB+Vx834KNZ/zrGazlJSAvzQSFGfJ5qJ0GCovc+SGZDKMUNRcVioauvw/SOWWX3THnLjty9iSvFCli421vcYQ0ud2jbQvsCuXjDT5quewximcoltMRY4Rf3HhFqiY3Y8K8xwh5gz0kl94Xt0MiEH/Pbc2A5iWeYA7I2lI44ssEl4QMJer/y0e8ygJW1sMoVj256QUznvRA+aoN9ZN3C1Lvfy3TAzi7ealPatBuEQAv9LBSqxaKod1vJBAOCh23pw0sdwmwRSvs8FFUB2NkBUqQbod9Nb4Y1kdkjKshpfrgZjSsK2Tmo2oFgQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by PA4PR04MB9392.eurprd04.prod.outlook.com (2603:10a6:102:2ab::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.23; Fri, 7 Feb
 2025 11:30:20 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%6]) with mapi id 15.20.8398.025; Fri, 7 Feb 2025
 11:30:20 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Julien Massot <julien.massot@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH 2/5] media/i2c: max96717: implement the .get_frame_desc() operation
Date: Fri,  7 Feb 2025 13:29:54 +0200
Message-Id: <20250207112958.2571600-3-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250207112958.2571600-1-laurentiu.palcu@oss.nxp.com>
References: <20250207112958.2571600-1-laurentiu.palcu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR06CA0123.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::28) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|PA4PR04MB9392:EE_
X-MS-Office365-Filtering-Correlation-Id: ee06b63b-9f74-4a4b-ba8a-08dd476ac93d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ce0M+r3m1eqRztBOTkj4lt4zpNZ0d1zW5N21ZZG8uW8vIED+IORySM8BzY9H?=
 =?us-ascii?Q?YAe+OXgT+y03lNoOSd8U7yE7gkG9T2UvCyOg+XhH23X01S4nRSjXAfDFp68f?=
 =?us-ascii?Q?lvCmVEWkfsmC+nmTB9vCLMBRP19TEvz8wBDUSmvFugmPduyoMcgR0DeqEJHX?=
 =?us-ascii?Q?svLa0C5l8kyWlQ3m81p2WyDEoVP4Px2m2fKdeztdFYT9Rg3do8eMFvau6Rt5?=
 =?us-ascii?Q?jKB7237xS8uGGQwy6timy752e+l6mMrKEObcAYvj4/7FTv4NJ+7gabJcjLWP?=
 =?us-ascii?Q?BD4h8IqzuDjk3vGQLiiTVe4y/bDJ8lislxZ5uXgQgDn7oVG13e6atiQ6XU99?=
 =?us-ascii?Q?qFdsAboA3V14wlWc6ZbT/6O62wpLgB7ntmzB1W+d5wpPprFmEPY6IFMfWy2l?=
 =?us-ascii?Q?MGE4YL2azqLMRO3XsmqQTJrKi8fLL1DkYoTS6AKlJY4fUVughBIQ+t3Bb9jF?=
 =?us-ascii?Q?RtewVVM4kqeGuEkc5Nr1PrGohNBReE/bFZaCU3QI4W220/8g6vrxmid/HSbq?=
 =?us-ascii?Q?dOkMDuPmFTBwiOdm2nZr0FgSnwoLLL57aqxwDa1ps2yk7PxcE+xF1nSN1UDs?=
 =?us-ascii?Q?+djs3Rw825WSHbJ7pfn9X0TiMN8dBUse0RcaUchbRGXlo4Jqal29dGvJSusv?=
 =?us-ascii?Q?iKM+jal926yb94jx9Ps5lqJayxpMEquJl/Z3IdIBhmen9PGtvTAVlvy0G3Mt?=
 =?us-ascii?Q?FFXMJn/2vFkOD5BKiXe8plMArJ6aQHZ+y6c9iMzC3I46ibqXqq0t5Dv44of5?=
 =?us-ascii?Q?rVCwTnFJvBhkeEl4GsVslzQxEfV4Gym3UCGL/5/lP+f7jofyT6OFbs++o+Qg?=
 =?us-ascii?Q?2b/uKOfb1cWKw3l0C2SpYCR3vcwzfUjSrFI/x2951C73a7aIQ5NFYFZX4nG8?=
 =?us-ascii?Q?oIEZx/a4DvBej7f9NoSC64NhDeT6v4lTnqu/SQTIlPYXP9Xx09uwXtVHwapA?=
 =?us-ascii?Q?wW8vD8tLQvhtB5U09fZRqkxVXCIyALRsoKCIYYYE624xkIn+YNW2D4cEo42X?=
 =?us-ascii?Q?/aa+L3CBY0/D1OGX9jx049o+JT8kRO2uNja5UBgsjoIh2B5YBREaqwaAyBgp?=
 =?us-ascii?Q?4xT4+Vh9Xehni58O9YZoY+hVtQ0nanec8K13XoK7UzgRlGD1niGwGEblkKc7?=
 =?us-ascii?Q?m9AOBKGWp1qUzKFqBNmMNnCsVl92jbldpwbK3zSglipWHBIMa6Vlmnqy/YeE?=
 =?us-ascii?Q?GbMu4DTy6MG/zvLIXFbXN7Za2lSnPtvYBFhIiIVyMny0sC4BBTgH87w4z88S?=
 =?us-ascii?Q?5GxsdWxUXY+yZw9fZOrnygB8fyhhG87KD2O5OmgSthdWL++zvav7hosquQv1?=
 =?us-ascii?Q?/o7QOPzaVNYwCmIj+G6q4ht7Ed9tILQdpjZSWoeOw4loKZjFU+ZbImNx8Koq?=
 =?us-ascii?Q?H2N4eTn461Juq/+pECV2YIa+pc3/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9576.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JkI7wLJYcCi2OgKCnmpJCmo8PCPcTpnyiUNuG4qZez7gcVfR8ZFLEJ7xGmV9?=
 =?us-ascii?Q?lL3VNeLcftchJUhzTRoMGZRSE8b3s5mDvWoKB1N1JXh8ZCXFHADWyWZnuNxg?=
 =?us-ascii?Q?v1SqBOWspkQy1XHoTbBKGn9JkDBZo3FcydLRyxjgI110uNvqS43EsuhrRQ+y?=
 =?us-ascii?Q?ScnhSi3n+K6Wqvya8/ZAkY1Gg3b5G0r9pibnGtAatQ20AyiTC4w4c+tLXrjz?=
 =?us-ascii?Q?Zzb8Syb/TjxJYrDlmhp8lcmrtUM+2m/5tT4hb1z4bFFcpSOcuA0HQU+zdkPX?=
 =?us-ascii?Q?z2eIeRt6ZjK4E5JuzIHZd/84a9ea2rigG8L28lty5KZi/bG9eWJDSn98cV6H?=
 =?us-ascii?Q?A9CMmbxc1XOWXiUP7h7AzQ0c8JpiTqUKQxF4BlFFWoThw0C0C5DR+5ULqAyN?=
 =?us-ascii?Q?mSRRb7kHFtZCcuxPWssROaC4gtmn5lEs1eH3sjfo+dQLyTAKdCQwkwY52mMY?=
 =?us-ascii?Q?TKE1vTpzQWif2ONCDU/RynZncqaX72Es5EJur8npLKHUiJpBJ7cl/DOKQE1x?=
 =?us-ascii?Q?lrDYwqDpwCTVFYcfqWP4E3gNYtfptsyLxcA0t8bm4O7s+Eyk7Zt4er3GjAye?=
 =?us-ascii?Q?R2k4+jA/TmpCSWuU+ullmN5b9B7gKbgHY9+otW/zMJKR/6RG/GHDWq676jZQ?=
 =?us-ascii?Q?CpVFalrJfrr93MmYe2fuXmaXurXq7ZI64sy8js6y5nEC7O6JO06WM1aInULG?=
 =?us-ascii?Q?ek+pJDC96/S9qrLF7lLIH985PAFdXU3a13/mFeQU/bnPe2+7Als8MrZBVO1y?=
 =?us-ascii?Q?iQV1ZNWKvBW7ooUyW3f9dAfKvBHlmsaSRM6hZeDUyXOAXf3bozFyX/teFMbP?=
 =?us-ascii?Q?t1qNeRqn2dHeBKO+mzYo0cfxmB2lg937GnciHtND7iC9aKICVrHFEAZr4kyR?=
 =?us-ascii?Q?S+hmG/TqaPpuoOZeUnreQv/G4tw6jW4cM4BEqQZIyrhwCK1iUlZE+WiNPKNG?=
 =?us-ascii?Q?7Jo52Bv27WhcgGBv6ul4gHS7sRaebL9TGMDaR7YWzuaCl3UK6C+niatDvwzM?=
 =?us-ascii?Q?JT0vyAwkRCFvAYqJpN5ZQsA4/0ln0j4GshQxgQ7I86XBIXeC85uch9nFOL0s?=
 =?us-ascii?Q?LQd3fH0lKvHlKafD2OjMgZzboVkgfEGgh18FD/NfycEh0resBixNoaaJtUVj?=
 =?us-ascii?Q?pzP57YteKLKCZ9JDtqSc2CZLbZ0fon4lRbwBAwmdOkGY+R6x3U7SsIbU7sMM?=
 =?us-ascii?Q?/PtTrnB/F4AqK0on0mTZSKlqUo59Lc1si7zx4MmmQ7+4bs6nD4Gf5SyDpy0N?=
 =?us-ascii?Q?bnV2wnI4EuDrwKqBNdAQf7fA3FZbLalSEZMjHJm/vsKSh8nwKM5z4ZGC/NKb?=
 =?us-ascii?Q?JvTmGvoOCkBhLFNYj5XbdzhjY8mpbmbhN3MJaQ6N3FmqaDanefiXbVDx9F/w?=
 =?us-ascii?Q?s7kRa5Co5dDNJZERP/dQSW4Voj9HIvE1XD9a2SER+/+F66K3l2d3IjMqUMgI?=
 =?us-ascii?Q?G4aZUaV3I6SKMVeAAS56BfDNDF8yB/cuedRlYGSBaljJuB7PQkwk8zbRRIEX?=
 =?us-ascii?Q?EKL+cHW0VazMOtrfXlZ3+n5vXYB9edDRE45va+49tHrjVIKu33Objyz8LAY5?=
 =?us-ascii?Q?msw/GAikJ438p9JEugA3l6pohh+hkgLRBWvaZwNHQ+QsqUk9bH+MsG3MyjMC?=
 =?us-ascii?Q?og=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee06b63b-9f74-4a4b-ba8a-08dd476ac93d
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 11:30:12.6874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xMpSjS4ry5++d/1yaewL1t3mwq4nU47cjpI2VQK600mv6hOGW+QdKc7j8PkTPDd0NX7xX/Pb3tV0iVAWNoU7Gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9392

Since the max96717 serializer can work with various sensors, we need to
implement the .get_frame_desc() callback to get the VCs and DTs for the
incoming stream(s).

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
---
 drivers/media/i2c/max96717.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/media/i2c/max96717.c b/drivers/media/i2c/max96717.c
index b1116aade0687..6a668a004c717 100644
--- a/drivers/media/i2c/max96717.c
+++ b/drivers/media/i2c/max96717.c
@@ -575,12 +575,33 @@ static int max96717_disable_streams(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int max96717_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
+				   struct v4l2_mbus_frame_desc *fd)
+{
+	struct max96717_priv *priv = sd_to_max96717(sd);
+	int ret;
+	struct v4l2_mbus_frame_desc source_fd;
+
+	if (pad != MAX96717_PAD_SOURCE)
+		return -EINVAL;
+
+	ret = v4l2_subdev_call(priv->source_sd, pad, get_frame_desc,
+			       priv->source_sd_pad, &source_fd);
+	if (ret)
+		return ret;
+
+	*fd = source_fd;
+
+	return 0;
+}
+
 static const struct v4l2_subdev_pad_ops max96717_pad_ops = {
 	.enable_streams = max96717_enable_streams,
 	.disable_streams = max96717_disable_streams,
 	.set_routing = max96717_set_routing,
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = max96717_set_fmt,
+	.get_frame_desc = max96717_get_frame_desc,
 };
 
 static const struct v4l2_subdev_core_ops max96717_subdev_core_ops = {
-- 
2.34.1


