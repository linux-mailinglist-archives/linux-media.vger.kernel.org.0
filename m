Return-Path: <linux-media+bounces-18406-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B09997CFDD
	for <lists+linux-media@lfdr.de>; Fri, 20 Sep 2024 04:18:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7F3A4B21CCA
	for <lists+linux-media@lfdr.de>; Fri, 20 Sep 2024 02:18:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F4167C13B;
	Fri, 20 Sep 2024 02:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="MrAVwOZn"
X-Original-To: linux-media@vger.kernel.org
Received: from HK3PR03CU002.outbound.protection.outlook.com (mail-eastasiaazon11011070.outbound.protection.outlook.com [52.101.129.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF79D28683;
	Fri, 20 Sep 2024 02:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.129.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726798688; cv=fail; b=fm012+SN1SN5kSHYgvHY/+fENMWu+AD3BvUqmv44+IjS7WuBlZQwp/CJNJTH2s7Bk88qZCVSPZhgqCmGjUJ2O5arrVj8jrd4Gt+ko+ndlb+nrmp514k6U18faNRHJmg6VENvJd2hb7owvFP2P1pUeFPhBlOU/LEeRiICwDwKJ5U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726798688; c=relaxed/simple;
	bh=jJJnAjn0z7YQddBImj49VmGlkePv3uNMuLvxm3lu2e0=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=lrONaVss39+ezuFOjvD50fGUkp1ApDjg8ulZLoSmLC08WjM1Pb9vwlMtp3gygROyZgmWy5BHJhFGtRYmT4zxtl83TUaj26SCH8+M/TOs22KuIgLWuTzNJwkHG7CALfN5wgRoAYeAVGmNodDY+QP5jdceSP2oyVp8DvzuJFar/Sc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=MrAVwOZn; arc=fail smtp.client-ip=52.101.129.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DRcRwJzZ3xZU3QgRRJp1XHsEPQf0wSEsUWyK6D1JhrhmPo2HsQdEhRutcfBaKR8Lea8d/m9v6UXshq+46M3TrSbNhxauxK9nBJzEkO/q9ovzrrStyMuwtYqB/mAoOPysnUWFb2YC86vFaTxxwTguK4YnvPAigpV1sa4vDzAaCzlFG535nBF277Zod0jRvSrcIB1lQcW3FCUFHM0/Vdunl7eOPYfnL6AIBfuwQ7AD3mNgsmTI0+bBPmNd8FuLLEP36JsXNGnlapbwQZ/DC0CUdk+S/ef0fVPLRAgyZxo+xJZ8F075E6ek7AmwAOc0Iv50QrRIp+cHBMj1sQ68x7/cKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3By1JMRf4ojw5RNDqUCGcnfXaTaJqP5X2f7GknIbHGQ=;
 b=HXunM1boLvmtERej49KVFT3K308wltyO4G8ezn3zsibY9SPrIopNkhCumVYeagrLIe8/fiDhe7DnOjCWhHwgs4kat5n6LgWwnY1o51O/wNr0VtDMmpZ+pCoXX7GeSiVKOfh/tYE/Ve0puIIm0dW6o14oT9LSCVosrGMruhRGqpwYgBalqMIVmBXVSCW6iIqe2o1EH6WC8ArbuXq5Oetl0ND5PJGStgiSFPRFq3JmHhOg2i5eBMh4yS5n7DyZ+aGdDPYpqUKqyDeqRSUahd9Pq6WlslAK/LAjoYd5EjiRbGPl6RrU0c14CIP5BLHadWh9Lq3HjB++Zbsgf117qkgEwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3By1JMRf4ojw5RNDqUCGcnfXaTaJqP5X2f7GknIbHGQ=;
 b=MrAVwOZnfhA7RwpZWyLKjnupI8dhnfizDeFq3ji1fNU6v9FhjlfcAZfCgTYRglGylZAy94qtTQf5gTx4n1phR09kAMEEeXsU04g/wes8QUwWRU8dM++myog3z/6+Ktdrp8P+OI1wqXJQcbfYFW2YRbAMZrjr0WbyQYNazn5B8vzJ/JWIXKwA0P+Vds6oQ1UX579ZBfwRMzlTJBMEiKH4TcIsWUsik0yHQvCv37tQbNLOejNYAmo7unUkBf1vu+PqMqCS7Tj+TjnKxNAF5FuMzSPVChp8FSMZD8F0mGyIM4KYjFrOLaEdIm06roJZ7tvct2ZNQMtuqlryJlJ8AqQBVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5899.apcprd06.prod.outlook.com (2603:1096:101:e3::16)
 by TY0PR06MB5845.apcprd06.prod.outlook.com (2603:1096:400:278::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.16; Fri, 20 Sep
 2024 02:18:01 +0000
Received: from SEZPR06MB5899.apcprd06.prod.outlook.com
 ([fe80::8bfc:f1ee:8923:77ce]) by SEZPR06MB5899.apcprd06.prod.outlook.com
 ([fe80::8bfc:f1ee:8923:77ce%3]) with mapi id 15.20.7982.018; Fri, 20 Sep 2024
 02:18:01 +0000
From: Shen Lichuan <shenlichuan@vivo.com>
To: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: bingbu.cao@intel.com,
	tian.shu.qiu@intel.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	opensource.kernel@vivo.com,
	Shen Lichuan <shenlichuan@vivo.com>
Subject: [PATCH v1] media: staging/intel-ipu3: css: Convert comma to semicolon
Date: Fri, 20 Sep 2024 10:17:16 +0800
Message-Id: <20240920021716.4920-1-shenlichuan@vivo.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0234.apcprd06.prod.outlook.com
 (2603:1096:4:ac::18) To SEZPR06MB5899.apcprd06.prod.outlook.com
 (2603:1096:101:e3::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5899:EE_|TY0PR06MB5845:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b9d1f65-3c35-4a88-a1ba-08dcd91a73cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RzHwNs91tvxuD7s45WAkT+hMvAkRGSCfbJkS3KGAVhpfwaP9JtKk70UHQh5q?=
 =?us-ascii?Q?cDplaxQWSwHSe1tULGEAeoBOyggypU0fqiYx349GKhWefURNuR8lv3tBYac6?=
 =?us-ascii?Q?Nz8V0//2WHCyxre3EmaeCGmPYSu3yps5wLljiNzn7DbzNgqvGfX3499uThwB?=
 =?us-ascii?Q?JE/RnJyr8mdJvxuRQavRbScvkqYbU6WGbYkZB5qgpSTZg9wfH3NxoaC4jha7?=
 =?us-ascii?Q?ezuRESAvuBOCkUGK4Hn9xzk2OU4OuDpR6aySj3oVd2w5euBWKGCP1uumUV5F?=
 =?us-ascii?Q?wGFlmn6/Nhm+l2QtQM4Do2FBBxvqedHmRoHlOxoZUvs6Zs3g/14jA4bGR1rX?=
 =?us-ascii?Q?Dgyjt5iHCKDuom3JAcq2aph0qp5HJtyz5nW3BshnxDkvTghW1yk/jT5SwNjS?=
 =?us-ascii?Q?SS1nk54dUYszUH9ESgUd2I8PikST5y7FN4w64lwWiy03twRFJ78URVSqd1oH?=
 =?us-ascii?Q?yl18mGtMtq1HvO27gKcTrnbJ61TkAe7AJXWDbww5j05Za/kDblU9DOYxQNlg?=
 =?us-ascii?Q?T7exF5sFXTNHUGqMkqecocDlMIwMzVNMPFTzhW0zp5lCr8q/KL6NRluMrj5z?=
 =?us-ascii?Q?OSMTG2h4IHXTR55rxVonB1P+xPQhvZrbhPTTc589FoizRaA790RmP8pt43Vh?=
 =?us-ascii?Q?zzNGx6YKLmgcSry8cbAHY40EcE0nGuAzv3dL6iJvrtYJR321pmhzsgAcxxd+?=
 =?us-ascii?Q?JqG0eECyDclEmz61fkQPgWZznytAyzss8CTy5Vd+p2oiz7UI+wi6DRBvNaq2?=
 =?us-ascii?Q?aCIRctz+gUeNSS72enyEt0LGUeizwJdhKb2WSu6IpmlHvRBl7RK7ASqdLRLE?=
 =?us-ascii?Q?lBx4n0JnjfH9JzAkLreeG1O6X7jjyNPZK+r8eseZYkj6ThtsLPTq5xYX5/y4?=
 =?us-ascii?Q?Lhdf/w64XbmqTjFbHdQJQDfaqgjXAFrOdRYSzZLLvrYJSRxD1UDHppRr1d86?=
 =?us-ascii?Q?jcshdkwVNJCtwMZuoo7a1RuUYYb/XFalyOShl4PUTaX7/gEksBZfFrArCf6P?=
 =?us-ascii?Q?7ec74XceCv7giwbpGM4CaWaSoa8zuGI4u8J49Q9sah0Bg7I25xJUzhHEhd9a?=
 =?us-ascii?Q?YjAQXGh76QPqefSMSIS0tYrS/ISc5hNsylSQcCW/Xx7fzzkFO+uSE5U9UWzJ?=
 =?us-ascii?Q?vQUZoMMooL6+4oHZwZn85Fv+Istcm/yspqgfMgoWQiYC3OeM+rSBSiCp2ahU?=
 =?us-ascii?Q?r8hgs9zsf9pIDPQ992ZAKvJbTPBUpsgdjy12vgfsVaFRiBgkNFSOKZxGTk6o?=
 =?us-ascii?Q?1fFbhtzUMOX7NrGx8yK6wCW5E9rXLLKrU69kc6ZBsbAhaiMTOtkPTPI4Eawm?=
 =?us-ascii?Q?qNo+JKxWUmN8pfaWR832gzP1xK+eWDYKPwcwVt70UQ78SD2JOU1pD4shxYcA?=
 =?us-ascii?Q?JYYa8cl2qeZqkr/UUiv37xk+9sBI0ZUgL5B8QEbyjqHwleKKeQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5899.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ByLPri/wEFMx67rB3opbtqq9IfAGxDWaH57Kf97nGX1QBHfsmMYMMLsyEs0u?=
 =?us-ascii?Q?T97Gr/wYs5xWejzexV0l+arS/1FaJDfQH19civpUTTRViMR29AxEJnpoLu8j?=
 =?us-ascii?Q?2yPHJGmYnRYxOigs6SKHTLO/Qh/t9GQ3zccAl/hOHs6X4mg0VhWbyvz+df3m?=
 =?us-ascii?Q?5kXUnV5dipZ4zdaPROk/RdcuPdH+iE3EbT0gJKvsc7gb5T/jMsskkHaNHUCq?=
 =?us-ascii?Q?nYwufGQoiOT0FmmGJI7kWQv5SHYZebNMkYxMVECg6IaE+wlc7LbAUGMTrw/d?=
 =?us-ascii?Q?00rqqmOe1iIHVYqndtNU+lSG2xtc09trLDzejgAI2b5424gyhPJAPQkH53Pk?=
 =?us-ascii?Q?o3JDWjXBXRd5EMHDa80TZXUT27s/t9pIqELZTcmzaK65t7OrLyUz9jNCsvi3?=
 =?us-ascii?Q?dXDFmlA3CEeaiwQnI56j4OK3iwaaw3yXLt9ZYd2liwjOwy0wOVEeCiPRzrbU?=
 =?us-ascii?Q?+6AXvLmjZR0HygKcRjgWzYNWo8Px7hxDM40bqqusuY9SfGvW4PkvslHJLLNP?=
 =?us-ascii?Q?1ezT+G95EcxokSEk98JJddG8hmb/YsAVYcr8CiKFETpBlEzdEK/kgXeOsTwG?=
 =?us-ascii?Q?S1SMbBTo2mKabkqk7QYDaPQWMphNO58mlA0d2UkHN2Pi1dlfYB6jJbP0FSWc?=
 =?us-ascii?Q?AqygG+MXVgrV8AUvC66DJKCgKDT3iolD20KoVchE6saGqs3LdRLChTBW0AUX?=
 =?us-ascii?Q?9kCiQWgogLHS99oSzyYNGcyMoW5GzlKBku3NPXSy2S14rwjOjL2wuYhja2uV?=
 =?us-ascii?Q?4mRmpPDMvxO3O0badmBQSG26KQCiwsT6sAKCY+sn3gZOIIn4jdRKmWEpcGok?=
 =?us-ascii?Q?Qu7Re/GpHnGsZJzhuF8rRLF+iNuQCiz9qIS2TMjJHXxWqsnOf/pZo0CipvK2?=
 =?us-ascii?Q?ppkHKwrcq12loBmlC13bvYPGJF2jdYp00Aq/5uOXB5ceCLgSo0KaD7vJEps+?=
 =?us-ascii?Q?7gu65p/GlarOaXaPbVHl8Fq+YxbgGLVAcAawRJmlk+hj+jbaqKobkzuaxIwW?=
 =?us-ascii?Q?o7D8q+YfAYLWnsfIMQ6CxUHKe4ibwgYECDiq7nNn/N8KuezoPB+coreA2KDq?=
 =?us-ascii?Q?ekAwbZDrS9J4/JEA8kUGqiKx2RwQDoolx+mn8xha3fkiGM0Nj9YMbsyFZnnC?=
 =?us-ascii?Q?y3s3EbILP+8ZrKDDdcqduTTs+YGo2t6OjNvGnZQthnB61qA10x31CCUQ/6OW?=
 =?us-ascii?Q?DmrYaWCqgEOM89+VeaURk2YTsfFrpCG9vmFrW3zjTcgYtjCqVy7IHHkUh4tE?=
 =?us-ascii?Q?NeKLRsBDb4lQHyw6vC6WHpQGWzZwSSemQabggOdFqcixE0aitj6ao8C8DZ5+?=
 =?us-ascii?Q?AR/JA1onv0KdUE4wTFgYuy4E/jMui6m+CncG+RD5OKjb4Bn9FJ377WTUqkyb?=
 =?us-ascii?Q?+StM3lb8lgN8cjhtire4A1KMT9aCu07iMtiAju4hz1UboA6pz49d7LJ2k0zt?=
 =?us-ascii?Q?oWgQPUYRgWfefUsIsxe6a7h/T3YO+J/N73B4Jrt4b7YNTWhgT2yGWeWPAVJI?=
 =?us-ascii?Q?uObkiVfGYW0u7BKfiyQAtmPRYFiDxiU8KFdf9JiYparz0G0sjR8YFTWg+Glf?=
 =?us-ascii?Q?wDiUdY4Db3XHBfKHx+TmJYWMEiFaNaXtaz+Vdz5d?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b9d1f65-3c35-4a88-a1ba-08dcd91a73cd
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5899.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2024 02:18:01.7507
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tHJ5gBSACwnTMu5JE3cCf4kBQ/gcZSGpQJ4mDi9Gr/VKCyg/A0eGaZosp72NymilCQY+7yInamO3Khvf46UIxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5845

The return of function imgu_css_grid_end_calc is void.

To ensure code clarity and prevent potential errors, it's advisable
to employ the ';' as a statement separator, except when ',' are
intentionally used for specific purposes.

Signed-off-by: Shen Lichuan <shenlichuan@vivo.com>
---
 drivers/staging/media/ipu3/ipu3-css-params.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/ipu3/ipu3-css-params.c b/drivers/staging/media/ipu3/ipu3-css-params.c
index 34f574b0b521..69e00f493288 100644
--- a/drivers/staging/media/ipu3/ipu3-css-params.c
+++ b/drivers/staging/media/ipu3/ipu3-css-params.c
@@ -2626,7 +2626,7 @@ int imgu_css_cfg_acc(struct imgu_css *css, unsigned int pipe,
 		return -EINVAL;
 
 	acc->awb.config.grid.height_per_slice =
-		IMGU_ABI_AWB_MAX_CELLS_PER_SET / acc->awb.config.grid.width,
+		IMGU_ABI_AWB_MAX_CELLS_PER_SET / acc->awb.config.grid.width;
 	imgu_css_grid_end_calc(&acc->awb.config.grid);
 
 	for (i = 0; i < stripes; i++)
-- 
2.17.1


