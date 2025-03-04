Return-Path: <linux-media+bounces-27455-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF3CA4DB0E
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 11:43:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 46E8D188D04F
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 10:42:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EA81204F6F;
	Tue,  4 Mar 2025 10:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="a89cdEMT"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013021.outbound.protection.outlook.com [52.101.67.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4DFB20102E;
	Tue,  4 Mar 2025 10:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741084693; cv=fail; b=VUkKYtTFUS+kxfo/fKSBIzEQatVOw+MU5xGVS+8khQ2iVI7idH1Z8MzX/rhPJO/tF0aYBV97SPtF6SbgHtbXwLRcf+Sg58wmh0uDwFpRBGdKSnSx0yvbtaZBlWGClGhkJjXuyAwa9sZY78uj1FJMpkfXXom7vkiQLELQ3CCbDvU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741084693; c=relaxed/simple;
	bh=fB7jbikXKvlKXP1lZS4MLMC1BeFNPmxltxFyxeyg+7s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BL03futuStiuu1Nqq+kHpUEVdEcNqxGux9clVocr4RWCP+onG9uNVcQra73NjkSCGaYG6ePLQxI0RJXW+sSWaVdoZUpCmZcTv2c8yBj16hijqbiN4M+FeCAaeZ172QVfZ0XaV55CMEqhbBLvUWeNmGLw5jLJVRPMVQRM6eDJoxE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=a89cdEMT; arc=fail smtp.client-ip=52.101.67.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hSsWDbBpQVQjHc6cXkKy6EKe3UBd1k/1OhVNN/VSfZg5mvTEHQu1bUNs5Wpv98GPzAq4VcqGaXfu28txSZqBvdRmTZuy5/1qkDMn4aYfEli6I5g5hG2KxQ1/Ivx5aF7XR9mnkOd43AgmAbgLeGIH9axrZlKCYS4aXmIlI156wsd2E9ijKdthXKMITVnbZicBlaAFfy66eBdIDPpQNmZMG182x0huTqd8pP+CZrcW+VKOXvq9PJtPDVztXcYg5ZUmIAz9Z38PJXri0Y9c2e9WZKu2zSxEOgu8XH2SPziQKhVD5B1zsaN577f6FMbzKWYm4A5UhQ8yuWVu+rlg1Fqsiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AAPzIh+tX8QixsO1ryJVyTIVujEp14CYaWDrqCwjD94=;
 b=VBpeS2KcnPcRp96IVJwIOz79nWYWtLZwOUsCzTMpuUI3QaleAf3+J6pJqZUxvxL3uNHT3fGlsjxKN6+McXjKA3GBkUwr7InL9tW2+DU9O5ArD3NktEPLNjyAO+OqTeE43fWgqX7M/MgUHKP84zRHx6o5YKmX8rhccsfVKpCjnt8tW1OQEixbIuJlEWRidtkeBf65k2oR8R3ycO/NY7K5sDqvk4D4WIq6uJzGXa0bRk0E0ey5jkIM6dYp8ywqeS+qO+ELXqZGNPIFCCNX6oSD7q5KM7eL7SUKxhXOM+Ny+L+7m8yoz2NXMBceg229eEE/21EcH3q8z5hpjlj8sm9wVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AAPzIh+tX8QixsO1ryJVyTIVujEp14CYaWDrqCwjD94=;
 b=a89cdEMTk6AAo/Fg98tUjTo+F5T2ZA9VxGKB728Cf2Z2WrsgZO6uE/dEg78UP7BUaAQtomld0gdltdA88Acq6kKo9ZzEGTphfFSnmMtKGIuBN2Be8w6lXbY8k6yOAzgfPeKu3q4wOky5CRvCGNYCA1wTBwZLZeoUynasr0IpBDhQAf9zbUZoi1QA8XHL/6SUdOGv92qE7o42jZkd7i8jBWO6Q5Nh0zB7mixNtv9Ok/D/i/ak5BqcReEtbNx+KkRejsyfBLBI0q6+PCtz7d0hhyM42ZX+h5w5xM9RWhj2sUVnmPUD/c/iFszf3qsz8O/G4HyPpfyUxjr8U2VSmZWwvA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from VI0PR03MB10400.eurprd03.prod.outlook.com
 (2603:10a6:800:203::15) by GV1PR03MB10575.eurprd03.prod.outlook.com
 (2603:10a6:150:16e::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Tue, 4 Mar
 2025 10:38:09 +0000
Received: from VI0PR03MB10400.eurprd03.prod.outlook.com
 ([fe80::48f6:ae9a:fcdf:b5bd]) by VI0PR03MB10400.eurprd03.prod.outlook.com
 ([fe80::48f6:ae9a:fcdf:b5bd%6]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 10:38:09 +0000
From: Mathis Foerst <mathis.foerst@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Mathis Foerst <mathis.foerst@mt.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	manuel.traut@mt.com,
	mathis.foerst@zuehlke.com
Subject: [PATCH v2 4/7] media: mt9m114: Factor out mt9m114_configure_pa
Date: Tue,  4 Mar 2025 11:36:44 +0100
Message-Id: <20250304103647.34235-5-mathis.foerst@mt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250304103647.34235-1-mathis.foerst@mt.com>
References: <20250304103647.34235-1-mathis.foerst@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0189.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:44::6) To VI0PR03MB10400.eurprd03.prod.outlook.com
 (2603:10a6:800:203::15)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR03MB10400:EE_|GV1PR03MB10575:EE_
X-MS-Office365-Filtering-Correlation-Id: 4552886f-1794-41a0-0c23-08dd5b08a7b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mXEvvQbFc65wfoFQgMiV3SK0FS/7ZBzJzLh5hniDsJkV7A3pBeSyzGjSgt5U?=
 =?us-ascii?Q?/OvTt1pSaTNFBuo6Fo3uljnFF5pVhizBkoxHaGXMXH2YV/DWuOvnE8vM6DPd?=
 =?us-ascii?Q?CRgeawYf1o4hS8okeOpv6hsh8KtNG32031pngGqpl51KNIMGpLo/7T+ZwqYq?=
 =?us-ascii?Q?yVkfkOhtX8JfVVpF8on48HtsGJSpMcKWXtHrJBnfnuT/SCfoAY8nXFRdTWhX?=
 =?us-ascii?Q?4K9WGZAU3G9as3sd449c9dkU8JBF3HQZQRpWP53u/JlyeeeSJSA9c++kWMFe?=
 =?us-ascii?Q?5kqbqsM1uqujN1ij3ghZRT3wynHxmtssOx6AAcotXzQXyoa/fKy3S8UY2Dgs?=
 =?us-ascii?Q?FxYNgdbFPTvpTFGSLu6lLVeCleki8KZSB94ZnNMbo9UjmmNysDhk9hDeCY3S?=
 =?us-ascii?Q?VydwsGp6fYUoAd3/tpOKvrXsjnrNbBYDK/drAYR0NrCzfeqjKjh9s4HK6UfK?=
 =?us-ascii?Q?RQYeCljCeOzvy6puggwFZlp/LTGgTH5JwHC9PqNOqPPSBVVJmfefyLdqbPLw?=
 =?us-ascii?Q?4UMmcGT1rfQS3P2PiJrBYdxeb51eZUziG8MPxSvH+XvEzOR+jTC4Fk33vsy1?=
 =?us-ascii?Q?V37LhhZgJTHmymNX0oh5x4xCFevVMahAXI9sBvNz92Pv+JkIMxoIyNjTJC7c?=
 =?us-ascii?Q?th9zSwZrmMPKc0xytpDIBLFrqqO/SWFqQqm8lG5mw4jiiGH7HXM5POHDGWpa?=
 =?us-ascii?Q?Wvb4vHv1mx3zkCf8hSyzrPnZJyji2UAcfgHsBNpH7JlLjowoWgNCIJhnKFWw?=
 =?us-ascii?Q?JAlSqQkwUfrNbliysVwxsPa4RuvxdeoLhVgYF8Vxx97iqcLPLPmbaVsVoedD?=
 =?us-ascii?Q?imkJCd1J7hzZJozzoK4g+1spQdkCZEmFp5VHIo7k05sT3XXgKOfthbsmLHh0?=
 =?us-ascii?Q?2pnqX2iIseFAaeRVgk0opa/f/GALOXIPojaPsrVd0UTqGnuqON8OGi6Q0ixk?=
 =?us-ascii?Q?6pnoj5GRH5GDFK9FmcJKNBTHriIly2pS3J1Mt31kaJLZ4nZvGjX+yIjZBBW9?=
 =?us-ascii?Q?Hq63tWP/pdbGq49C+pVJ3gsRLt10XBmnPZR0idyU+VMkU5C2MMZJ+K2xDPbo?=
 =?us-ascii?Q?uikz+XnLaPOaDATn61r3m/rcQNwHTXEPXnrkVrj42APMNmO71EErk/dV6mmA?=
 =?us-ascii?Q?NN6AEbylxiJjZhwHrg3jtVid2ovWaGmLGp+OOEzY8nIXEvDNUURkdfqlU6qu?=
 =?us-ascii?Q?pk05x3LP57yf7Mml1o9oxztMJSmtntTl10chfon8Zsbl+CGUNrR1YSXI6h7x?=
 =?us-ascii?Q?3hZBkL4EZYfeZdfWVMX4qLHOMZQlhZ0tvzooMBkP7X0/PVANsTO/cps9IiNt?=
 =?us-ascii?Q?Sfp9KW1uewmidAohMvxQc+37sgyXXih9BpCPnsDmkK5J0RrLbKcm4uxyq+w3?=
 =?us-ascii?Q?a79gbQM4x8z+nSxXG5kLEB5AdDnnZL+LUjZMvOm59q96RAHRc8OdeKNKXKn+?=
 =?us-ascii?Q?oOKWUVZOFcB65TwolzH97nWr51LXu/S4?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR03MB10400.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XG73EYC1o2avynTz7b2kKXYooyP/RSQ8GPnsq1fJVCyHAugA9xaTYCUyH0yi?=
 =?us-ascii?Q?ERUQ7aAZumbhd55gvelSCwaz9ou3gHPiC4RIfJYi3oFPCjCyP6+k2WVftSdf?=
 =?us-ascii?Q?XPoPySUvPrn4aNo770o32/PlQe4UZlQa623Y1YVlKZmXArnIElWQF5mUrIkk?=
 =?us-ascii?Q?FlcYMHXSnxoD9RutFuALFVVxXQA7KT+VCWApMt/dI+jKCCM/jWj6GczUy8An?=
 =?us-ascii?Q?J4+vAruhMVf8RWe+Cglf3FsalrfR7xdfHSJ6Bc7I9KE2YrOh4b/GrPojwSRX?=
 =?us-ascii?Q?9VhdR7wowOXgLg5vOa0pG+5SIOHFW+hN7vkgtS8tI4Mp4+fMpZfDUYX3hPK7?=
 =?us-ascii?Q?ET3KfnVUfRauHbiFzlH1l3jnZp9JsmLncplK/qXn81XWvE+JGWNXb5IM9489?=
 =?us-ascii?Q?qYEkxu9vIspPISahu9gjx/RT0+NT/o/R9NLlQFIBs2VGCj6NOoSucflz09ZC?=
 =?us-ascii?Q?D0FwtqBbbKFUG2pe2/pU5GA8Bf53oVyHFAhptSmpddEXbSWDq+2Nu3quSQ7w?=
 =?us-ascii?Q?hVF+JDIGj5NH+dwCyka6G6zC8BeUW7V3QVh6nut6f2cRFEy4bL/X6J9Pk9Pc?=
 =?us-ascii?Q?C2xCakHOwY3mzI+V65gmOjhHlijMvuieOuX0PurnZX9+d0t+FyeWJgaUBvYj?=
 =?us-ascii?Q?q67ouFNtJLNB8rUeR18023fXAJQC5y+fHP2ZzXfzvdKGV40OeT++qq8ROVi0?=
 =?us-ascii?Q?gyhD8Allt+IfjEY3B1S5MScRzOc+GSEtXJlPpynQRX7M4IlwaR2Lw2AuvF4c?=
 =?us-ascii?Q?EnpWpqwalH44Stx3yZpYGbO/f61cK5wi2NOo7xWRI+Ql26yjOyONOqp4p+pw?=
 =?us-ascii?Q?NToC4c+hH7VDQGhzCCZQ19GHb66f/goS8oh3GHnVyy4OtVtWEBI1gpLQf1wh?=
 =?us-ascii?Q?ZNka0pHQEnhJvl56y7n+FGm2eauqqcFPhqvzHRKYwTb5GgSiw1xryD9VExdv?=
 =?us-ascii?Q?gb5A7xnvIcgpxb/bpFhfqFOHXfe0+t+NrOEjOWNql08+DC3ZsqA177bj0vie?=
 =?us-ascii?Q?GBDdtCYtss0dbCrYyu7KlnwNOwyWEsKOM0Kr432j1B1XrXkdIkNJKFqM6Gwj?=
 =?us-ascii?Q?Qm1cFnFNLBPHNnPMT6a8tPgEtTzWUKHHA+E2Bh3GS1cj5XSungyvnJitMef7?=
 =?us-ascii?Q?HFunJbgOOEMimrl5iShKuGKq0lEpMLV8OnbTV+CiswIGdyFRT4cUQc8QApLB?=
 =?us-ascii?Q?+YFS7GCL24iCjW+dxeZnYMVbIyqI49/pDBB4SjRoNKHyo4u6wZw5hFnW0RGt?=
 =?us-ascii?Q?T8WGC4GD0Xqj7BEWjmZ3EY9xDz9j3551ae40gQVUd0DbrHtGmTymMXI2FDYI?=
 =?us-ascii?Q?Rfcf6Qx1y1/AwVsKz36+B0gvRltcXClKF3uh4onD3DMp/pgWla+3JAd/FEZU?=
 =?us-ascii?Q?lG2IsYKOnj+94W5ULoOiXsyHKgq/TUdnXwcZYp/7Kon8FDp2T2W1XFWL5J0O?=
 =?us-ascii?Q?wy2mMYf6Vee5qekkWvjL2mZSt5U4h4VE0PBq6ehB5HhIUcw2vm8QZianklij?=
 =?us-ascii?Q?f0EoIpsHzA5tWGjPzONzgQSnphAN9i7uQAocogsLitm1tPkVnw7kp44j8ybi?=
 =?us-ascii?Q?CIcIw73rfz39f5kgBFH0QBjeOyL6uP4atzdo9l1V?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4552886f-1794-41a0-0c23-08dd5b08a7b3
X-MS-Exchange-CrossTenant-AuthSource: VI0PR03MB10400.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 10:38:08.9548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: INRwd8POLDveLvdWiLpvww/H6A15Dzlq0q3vULnP6FHZnaiKFGR96ZuGTbwpGuXcA7RD+0YOnLKyIPHS4QfgSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB10575

The function mt9m114_configure writes the configuration registers of both,
the pixel array (pa) and the image flow processor (ifp).
This is undesirable if only the config of the pa should be changed without
affecting the ifp.

Factor out the function mt9m114_configure_pa() that just writes the
pa-configuration.

Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
---
 drivers/media/i2c/mt9m114.c | 49 +++++++++++++++++++++++--------------
 1 file changed, 30 insertions(+), 19 deletions(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index 104b146a5d11..a91bacc1421f 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -789,39 +789,22 @@ static int mt9m114_initialize(struct mt9m114 *sensor)
 	return 0;
 }
 
-static int mt9m114_configure(struct mt9m114 *sensor,
-			     struct v4l2_subdev_state *pa_state,
-			     struct v4l2_subdev_state *ifp_state)
+static int mt9m114_configure_pa(struct mt9m114 *sensor, struct v4l2_subdev_state *pa_state)
 {
 	const struct v4l2_mbus_framefmt *pa_format;
 	const struct v4l2_rect *pa_crop;
-	const struct mt9m114_format_info *ifp_info;
-	const struct v4l2_mbus_framefmt *ifp_format;
-	const struct v4l2_rect *ifp_crop;
-	const struct v4l2_rect *ifp_compose;
-	unsigned int hratio, vratio;
-	u64 output_format;
 	u64 read_mode;
+	unsigned int hratio, vratio;
 	int ret = 0;
 
 	pa_format = v4l2_subdev_state_get_format(pa_state, 0);
 	pa_crop = v4l2_subdev_state_get_crop(pa_state, 0);
 
-	ifp_format = v4l2_subdev_state_get_format(ifp_state, 1);
-	ifp_info = mt9m114_format_info(sensor, 1, ifp_format->code);
-	ifp_crop = v4l2_subdev_state_get_crop(ifp_state, 0);
-	ifp_compose = v4l2_subdev_state_get_compose(ifp_state, 0);
-
 	ret = cci_read(sensor->regmap, MT9M114_CAM_SENSOR_CONTROL_READ_MODE,
 		       &read_mode, NULL);
 	if (ret < 0)
 		return ret;
 
-	ret = cci_read(sensor->regmap, MT9M114_CAM_OUTPUT_FORMAT,
-		       &output_format, NULL);
-	if (ret < 0)
-		return ret;
-
 	hratio = pa_crop->width / pa_format->width;
 	vratio = pa_crop->height / pa_format->height;
 
@@ -853,6 +836,34 @@ static int mt9m114_configure(struct mt9m114 *sensor,
 	cci_write(sensor->regmap, MT9M114_CAM_SENSOR_CONTROL_READ_MODE,
 		  read_mode, &ret);
 
+	return ret;
+}
+
+static int mt9m114_configure(struct mt9m114 *sensor,
+			     struct v4l2_subdev_state *pa_state,
+			     struct v4l2_subdev_state *ifp_state)
+{
+	const struct mt9m114_format_info *ifp_info;
+	const struct v4l2_mbus_framefmt *ifp_format;
+	const struct v4l2_rect *ifp_crop;
+	const struct v4l2_rect *ifp_compose;
+	u64 output_format;
+	int ret = 0;
+
+	ifp_format = v4l2_subdev_state_get_format(ifp_state, 1);
+	ifp_info = mt9m114_format_info(sensor, 1, ifp_format->code);
+	ifp_crop = v4l2_subdev_state_get_crop(ifp_state, 0);
+	ifp_compose = v4l2_subdev_state_get_compose(ifp_state, 0);
+
+	ret = cci_read(sensor->regmap, MT9M114_CAM_OUTPUT_FORMAT,
+		       &output_format, NULL);
+	if (ret < 0)
+		return ret;
+
+	ret = mt9m114_configure_pa(sensor, pa_state);
+	if (ret < 0)
+		return ret;
+
 	/*
 	 * Color pipeline (IFP) cropping and scaling. Subtract 4 from the left
 	 * and top coordinates to compensate for the lines and columns removed
-- 
2.34.1


