Return-Path: <linux-media+bounces-49565-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 79735CDE4C6
	for <lists+linux-media@lfdr.de>; Fri, 26 Dec 2025 04:44:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8D4D83011180
	for <lists+linux-media@lfdr.de>; Fri, 26 Dec 2025 03:44:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D39051C5F1B;
	Fri, 26 Dec 2025 03:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="eQz/QBmP"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0585B665;
	Fri, 26 Dec 2025 03:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766720638; cv=fail; b=mWjRbt2I5ga8Px3RS7V2cKyKdOrJnm0h/V7m6dD2nJxDX/aYKWzEXyDdiiAak7VOwHOg3YxF2AkLMaEnP3PrROTXiJKeEbFLqLaMXUpMrtdkQGezZV8QGTJ9tpas9h/LDycLME2dbnDkvk6yRA15haHGF8Ms59ybdAALKWPz++M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766720638; c=relaxed/simple;
	bh=IcmXdG4G/eHctR5c1qXWoDomauV9Y1p56N7ZXL/6SBg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WZ+qJoi3TwzGzb1A1Yatn4Fj2MjtBOa2HbhgzZlhq/n2xugNN61uHB5G/bK5gDmVvTaMD0HsOLgVUQ8VgJtqHxWmTbyl+fZ2aVKOtL+469gQbco05ckz1/my3OeSSWFkgbhO46Nh+lGaIO3SrYozPAlKvwm/TVh6CrBwGyedbNc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=eQz/QBmP; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BQ2mxJb2152822;
	Thu, 25 Dec 2025 19:14:01 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=2qtjmGj5b4nZ37ZSKkvhaN9xBCLaY3Crm2fg8NRtQYU=; b=
	eQz/QBmP6yvgh2oAco7lXpKs7Dxj2W0/B3x2m8OB13pF6o2StYqWfIfbAgmcBt7K
	FUISYhonjCcTciMPwN+FsVN7SVQAPCp/E3wnoHhTnVI1kfSCC6XwZkIEp61vbdux
	lKP9K/Jsh11se2SeostWe5dd7gGaQfYawWUQuaNJxkgPVjOrOtk6QIWunTAksWR4
	frP16juTS68bdhxRKAYYUT+ZT4SH74xWfM8s5lInMM8ug6u0caU8lF3rdA0IjyIt
	R+xyHFO+K1joF3iHwTz1+jO+AM1KFU+ov3hBqqJJuZsqPET1NqeXLbsEmkGkvntU
	uuvOgpc/lSRuwyAhqXi3Xg==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011043.outbound.protection.outlook.com [40.107.208.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b5qy4wab5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 25 Dec 2025 19:14:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SOWQt3LeGPKSYbOklNn/9nQ3c2SYDfQF5Ygo7udPoeCUplHx5Skw2nIlz0v25OvINouILiXv8KJZQnx2rX/bRoMEsZsHGf86r7NMyMTZXUBLX1EaYK+an4Y0F2D6VelCjZANhMh8Gjjv8bnfe8FEsNm8J/JjtcMftOjWPrNY5AKpBX5AgU/tW47P3/WS5FrOV8t0WDfe7z3xKY+uEoujHEUVlpbK9Axbndbo14i9GyCEg3hZPnHkbWSNbftdNGK+FN+dFxQ5KyFnWGY7N3WEehWdUYF4qlxFsmmDTDIaN6jbzcstGdDLlim1qFbjt4GIsw8FqRS97uIT7kiampEihg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2qtjmGj5b4nZ37ZSKkvhaN9xBCLaY3Crm2fg8NRtQYU=;
 b=HS1BcKA820xyyEwNJZKt9LzQrIclRzTFVLTX6MSt1x/Al2mI7Q0chAgiPl1yg0ayUVCMu9nkfWyEhpkvURg7RnqPz5gpZctR2TkgtaBZbEq4CA1vavm47qizDXQ2newGlB/5ssTH/VpONWsdtyUhyyDj6yyMyrJpBASqhGOE3GOOUJKGegSg2oj8e58mB6XHvVcdS/ZFUq+YMjSqXMkCYy9cgBzcOtVMqAkRnFmoe1ZV4tt6+P0G+030VNFwcyFW+zP1zGQ/NciBSPSXfUeDwqFfp5wVKCmvl+RxspfiJY29pXLEKPpl7NT5wnJpJ/QYTnmLodaZBL2IifNKccoUgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by DM6PR11MB4660.namprd11.prod.outlook.com
 (2603:10b6:5:2ad::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Fri, 26 Dec
 2025 03:13:59 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::56cb:3868:6b6c:193d]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::56cb:3868:6b6c:193d%6]) with mapi id 15.20.9456.008; Fri, 26 Dec 2025
 03:13:59 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: sakari.ailus@linux.intel.com, dave.stevenson@raspberrypi.com,
        jacopo@jmondi.org, mchehab@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        laurent.pinchart@ideasonboard.com, hverkuil+cisco@kernel.org,
        johannes.goede@oss.qualcomm.com, hverkuil-cisco@xs4all.nl,
        jai.luthra@ideasonboard.com, Xiaolei.Wang@windriver.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] media: i2c: ov5647: Switch to using the sub-device state lock
Date: Fri, 26 Dec 2025 11:13:11 +0800
Message-ID: <20251226031311.2068414-3-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251226031311.2068414-1-xiaolei.wang@windriver.com>
References: <20251226031311.2068414-1-xiaolei.wang@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0027.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::18) To DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFD667CEBB6:EE_|DM6PR11MB4660:EE_
X-MS-Office365-Filtering-Correlation-Id: 45237120-9607-4393-6632-08de442ccfd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DOikvhkd8+rMO7XhziCofJQKthTDHkBRKoU+dov0m2Z4ffG+XAsNYmAu0gKh?=
 =?us-ascii?Q?zQxq054uK6DszfsmxXlBQ7aAbTGAOPrBe8vUS7Zd4sB1pQXeHthWFMmstN1S?=
 =?us-ascii?Q?DMXUqX2f0CWFWhO1ddzFhAh5WeWXy2bf1oAIL4XqJTQuYJIqbw9Mqc7d6vQY?=
 =?us-ascii?Q?jARWBmhZA7eZeTGeiOboO+BBHes99ZPRbDeHoCcKjQfujE3rJCryAH7GgzwB?=
 =?us-ascii?Q?NCuXsS7MndNkXfAOZGhpG2ErYJ6HscGyJLKe4a0B0LlEUouV8yRxgG4ptPn+?=
 =?us-ascii?Q?5CESMJJAtsT/16f6z3vENVyFyLLBMdFpDVzPO06M4/TEMI0aewzyda1cXhAX?=
 =?us-ascii?Q?yLtB1BcOoz+4wpM1vXCASdNOksOVQazaQyDB1ZvyjgH/kZLIoe7OXT2sXVcU?=
 =?us-ascii?Q?L+8L/VwYpsjgVGy9fG5sxurX9Pf4+fDsjmgmB7HsEoc/fQtwGsnR+c2b/3le?=
 =?us-ascii?Q?w19hI4PcAQg1T1VO9W7i3zpWr9McA8tNSpeq7IPg8ecNOCLKxT42BuBO+BKW?=
 =?us-ascii?Q?vYDYAiKYWGKZjt7FLmmEukW68TeQgAG8mA1idS7WaeOLDgXK9SZJBMliwr45?=
 =?us-ascii?Q?Ev3cgveomvz5ylETtJTDiyzYdeggKslkzKeXu+HMCjVPZa5ULZfdUIUImpsw?=
 =?us-ascii?Q?HhbBba72TolMH38SW51vVfvzK4nOMtk+VE6alPhazsvMIxFAGbWQFmKXeUEn?=
 =?us-ascii?Q?3CBjKJ3H9TqQLYcvIt5EjMx/tEou5ubfWHwZFfm0wBecoOmhPYkc4WdHBzZs?=
 =?us-ascii?Q?8DbnQwGSTB+wq8XhgWV0JSt56mJpRwG7lrJf+UGWJefmnm18yzqXMEdxMPSi?=
 =?us-ascii?Q?8K9YeRAn5QMRq+A9ZaiSuHNVYBDcZ3ZO1mNRAzGLCGXdM+GEY3rugYVddVfj?=
 =?us-ascii?Q?oNy+xsrmoFPqeuWIEBJ69vRtjxgYQu/yPIJmrUYVWINuaIAtiM0Ah9oIeEqD?=
 =?us-ascii?Q?fcfimxI32Gdejxtd2wdxnvQWLBEjDLGSKAL+BVmuoJT4YP48akT3eGAjCYlC?=
 =?us-ascii?Q?L/Yw9Y9Tcc4rUQpIrYcshwXZfmaLUuOcorzLss6u+mzPYGowbC+3dQg04f5w?=
 =?us-ascii?Q?DXmniJan09Yq5O19gTAliM1jlsRXlWZ7qmQEJcE9upiDrELUi/dq/MZo/PER?=
 =?us-ascii?Q?MWVkevVHy3JsXsW8fG3nOQnuF5ChMckmF0AgucYLdKyXbdw4ij/S1bChj5Ac?=
 =?us-ascii?Q?j52CdeznI4Sya9iWVFt+Ykv5HItlsGN8Yx5cTg+I76nue3ozc1vCW4Fk5nTH?=
 =?us-ascii?Q?UadblbJNp91HJvS3YfJwvM1Sjr9X2o5DgIvO0RG86bXW8i4LHnClqmSMEQe4?=
 =?us-ascii?Q?EjkxKtpiruL5WwffpLoAZjhzwuDk0isPiDM0tde9mlMFSWkZYfwzKoXO2meM?=
 =?us-ascii?Q?P6brRjoovM2mOrbT+yF7numHieyhqx+rzrs6LoYEI+lzY8XaFF2uaxi1WtpM?=
 =?us-ascii?Q?w9brRw4gfSLScGzL25xPr9RM7HnsEpNLbXP7YxtJuO6IPxsOr8Fcv+h43cCT?=
 =?us-ascii?Q?q5zBwK87BJmDUkpPDeq+u0E6PL7lPeLzgth8F3kCCcf9Xy0d6mw6Hh64pg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFD667CEBB6.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ikDA2F8rAcNGEx30gLKuxDxCpmsGSeZhX5ioIQIZvx9VTzP318njijB4gGFX?=
 =?us-ascii?Q?MN4+bvZ3C16Ynpek8Y5S0y0UhWX1NDONR+2U/8Ep+cdKjxEhhwIDMDgWv1dJ?=
 =?us-ascii?Q?e2HkbpsyxXMthd4Xibx+UKLSsbK53aMriXp0UraIZ6gXujrE3FJkvsZizswD?=
 =?us-ascii?Q?qu1aX9dIZOiVazSEbeMjAbORxBg2l2fRQzp73Uiw764UiAbKKp7RbtdcEKJH?=
 =?us-ascii?Q?I50V8bm17fbRHuvk+11spjBSXGT+19P6Qd2QhyHV956g8QgpzePih/pdOgko?=
 =?us-ascii?Q?BqySQkhRirqoMBFRffYmKWFl5sowRmemLIeZO9R/mLsAlUo9VDAzQhYbbRH4?=
 =?us-ascii?Q?5z273f4rSuJabW0+99d4P7ys8E0hPh9R554TE198XOxWr/15XdgR3hg6rQgB?=
 =?us-ascii?Q?JAE4WZpc5YGyoDEuEfOhGCSLrSdaZLM3pSE8TkeYpPNFzwRoxw6eog9M8nYM?=
 =?us-ascii?Q?nFR445JiBQaMKAgfwLAb21BXf/s31G0oZj0nq6Ug96IlJKTrs4qc28RUBVGd?=
 =?us-ascii?Q?hExf6/JFnlUZXHxBtn61AxuBm3UCjFFH+OAdbD8WSZilNVib2kTJPq8Eu9kx?=
 =?us-ascii?Q?knENHr3V5yUQKLJSSOfsVShDNcHWNOuzlKqPIsMxfSqRLt04MFfk9AGqrxv3?=
 =?us-ascii?Q?xqQn8hb3twy87k4fOGE6EfBs6wtSzoix5FPwLuK4eZKFb5qKB0xXLAu5Nusu?=
 =?us-ascii?Q?B2+s3AcXMS0sSO5hDP4jFq5TwpijJ0h96J8nq5BRNJZqPr7aE4/r/+L5fIDI?=
 =?us-ascii?Q?u59QMucVlG+UQldsMKSY+C17ziYhsjLSaWh1/UoLrWONslEQJBkp8Ov1kXL5?=
 =?us-ascii?Q?vUEV9W8vQf+R1JJRlMfo6d0/s5nTkdnSdKxk0U5QlSMqym7dNicdWxaystLi?=
 =?us-ascii?Q?UC9r3tSceBpi+aH/29+xGTVpvTZt9VVamgBVVN7QSriL8x5H91+4Sc4ic07V?=
 =?us-ascii?Q?rRGOShm1UsiMhiTyesunFQbWrOdZcnAT7bgs1m0PaLczrw9IEly6NnBcPOf0?=
 =?us-ascii?Q?MojgRndfi3oUr0oenOsF0JHsxjImZYCtsUte6NG4vRaAKGDZoKiVmC0BKfsV?=
 =?us-ascii?Q?OkgwKBiILx7E1lLiToCgxSUcjm36LA2FaocMxy7bN4oGE5wrGsB/QwoO5w45?=
 =?us-ascii?Q?0Puy/kbFpANAuWx5/rMhibS5+uAACcwBKEZ9myrlRs72mSwiVKhJcx8HADL5?=
 =?us-ascii?Q?VZc9Wsx482SRy3FLFfo2Bjn0dMq5KB2t7Y6MAtfDnj0s4tu1f5BBJUULOtzg?=
 =?us-ascii?Q?TPI656uUYdRD1vxBRBjpfH8fBkSg79aPXdGxvL034Wf9O09e3Vr1DnotjiiF?=
 =?us-ascii?Q?+x8O1oFhIkUDQwZPFLD8LWVxe3R2Lq2uDplNX3lHsRVg9aCq0bGc257eUX24?=
 =?us-ascii?Q?K6M/9cOvk5m/yYDubpBk3LkYvwFzbOdUEwgJLtDP6iFeAPEHtiEd+iF2Gewb?=
 =?us-ascii?Q?yV5j8NJpvPjQGcX8ByOx2MmRaAKS83GPn9qLiUUsN7gM/ltERO+maJNIZjWC?=
 =?us-ascii?Q?SEm5WNyaOv7pZJszCdvjMZMUCzYRtXKDyxiz/VoOy0F/7TogyExTvDb6Gq1q?=
 =?us-ascii?Q?wN0w2ofk3MjYYCNmHqwcTs+jIWQVCgaHCsPehSyzCNC4sJynRpBYD6Pk75Ya?=
 =?us-ascii?Q?e0dZl5x62xDvcslacPV4eXzWa/Hp0ZsI+UhmYKEKzd5oPGks+LRgdrVq89jp?=
 =?us-ascii?Q?qiX85zV2RV4rKhjOVzIMMQPlG934zyaAjc/LXWPDteGA7mm5nhXLxCQuPMCj?=
 =?us-ascii?Q?P+OEEcEefj/lhPvibvLotcH9jclqBcg=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45237120-9607-4393-6632-08de442ccfd5
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2025 03:13:59.0952
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: je6zOA+bD2bMn9hexywUmUDCk5NRetEQbBkCogm6Jt1LbJ7BerUjkbsVC2MlijqH10G+BgJ+iQMJZjXjnpMH2oDR+8qj1nBSkHnn6zY+0LA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4660
X-Proofpoint-GUID: TImIRxv3IVhEBa8CfqE4cP-ojs-QdwD1
X-Authority-Analysis: v=2.4 cv=Q+vfIo2a c=1 sm=1 tr=0 ts=694dfd79 cx=c_pps
 a=dlt6EHtatQYmFek7NWVDaw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=Q8O0FyF9z40g30L6lpcA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI2MDAyOSBTYWx0ZWRfX4bLerRsxEiWC
 eRWTZ45c/D3054t2LBBIWym1e3JxDswUovkCwzxrxRBOWdCMSvKt2VU0KGYAMVel3HoyWlV3S26
 mLa8E+Ccbo2GFGetmx3wFf2dMPHZRADCOx5AeribRS2ywSJlan1mDsJfbnpg3f2uBofcjuDBCoi
 zUhVP0xtCDrW+J7LiLW4TchOyhNYZgFipufPNWzeyhfy2yRS/9pEMnWFtu3JMxE0y9Xl0rkYgq5
 oGr4GYWoIkCJmkcuOd/tpX8Z5Tx2T7WkUF9j4mcCPrLIjq3yL6DcprceG3/+zUCQmtZVMCW9fnt
 YmPUtFg5FOnkdja5A6ANM+h/A/kq5oqtnxezf3mpmKU5fCTIQDfU2Vl0eHFZP8LVyFWmHSPiMdi
 e5Ms1enM6ciDFh/kPQEVh9tvKvOjxVQ12kxtT15r6e8MGT5fgMe2VZ3PpC1yYok/cb9MNq3T2LC
 MET2MMIdj4Vy/cNtt+g==
X-Proofpoint-ORIG-GUID: TImIRxv3IVhEBa8CfqE4cP-ojs-QdwD1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-26_01,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512260029

Switch to using the sub-device state lock and properly call
v4l2_subdev_init_finalize() / v4l2_subdev_cleanup() on probe() /
remove().

Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
---
 drivers/media/i2c/ov5647.c | 40 +++++++++++++-------------------------
 1 file changed, 14 insertions(+), 26 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 1f8e173417b8..2619971353fd 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -96,7 +96,6 @@ struct ov5647 {
 	struct v4l2_subdev		sd;
 	struct regmap                   *regmap;
 	struct media_pad		pad;
-	struct mutex			lock;
 	struct clk			*xclk;
 	struct gpio_desc		*pwdn;
 	bool				clock_ncont;
@@ -657,7 +656,7 @@ static int ov5647_stream_on(struct v4l2_subdev *sd)
 	}
 
 	/* Apply customized values from user when stream starts. */
-	ret =  __v4l2_ctrl_handler_setup(sd->ctrl_handler);
+	ret =  v4l2_ctrl_handler_setup(sd->ctrl_handler);
 	if (ret)
 		return ret;
 
@@ -821,15 +820,12 @@ __ov5647_get_pad_crop(struct ov5647 *ov5647,
 static int ov5647_s_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	struct ov5647 *sensor = to_sensor(sd);
 	int ret;
 
-	mutex_lock(&sensor->lock);
-
 	if (enable) {
 		ret = pm_runtime_resume_and_get(&client->dev);
 		if (ret < 0)
-			goto error_unlock;
+			return ret;
 
 		ret = ov5647_stream_on(sd);
 		if (ret < 0) {
@@ -845,14 +841,10 @@ static int ov5647_s_stream(struct v4l2_subdev *sd, int enable)
 		pm_runtime_put(&client->dev);
 	}
 
-	mutex_unlock(&sensor->lock);
-
 	return 0;
 
 error_pm:
 	pm_runtime_put(&client->dev);
-error_unlock:
-	mutex_unlock(&sensor->lock);
 
 	return ret;
 }
@@ -900,7 +892,6 @@ static int ov5647_get_pad_fmt(struct v4l2_subdev *sd,
 	const struct v4l2_mbus_framefmt *sensor_format;
 	struct ov5647 *sensor = to_sensor(sd);
 
-	mutex_lock(&sensor->lock);
 	switch (format->which) {
 	case V4L2_SUBDEV_FORMAT_TRY:
 		sensor_format = v4l2_subdev_state_get_format(sd_state,
@@ -912,7 +903,6 @@ static int ov5647_get_pad_fmt(struct v4l2_subdev *sd,
 	}
 
 	*fmt = *sensor_format;
-	mutex_unlock(&sensor->lock);
 
 	return 0;
 }
@@ -930,7 +920,6 @@ static int ov5647_set_pad_fmt(struct v4l2_subdev *sd,
 				      fmt->width, fmt->height);
 
 	/* Update the sensor mode and apply at it at streamon time. */
-	mutex_lock(&sensor->lock);
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
 		*v4l2_subdev_state_get_format(sd_state, format->pad) = mode->format;
 	} else {
@@ -959,7 +948,6 @@ static int ov5647_set_pad_fmt(struct v4l2_subdev *sd,
 					 exposure_def);
 	}
 	*fmt = mode->format;
-	mutex_unlock(&sensor->lock);
 
 	return 0;
 }
@@ -972,10 +960,8 @@ static int ov5647_get_selection(struct v4l2_subdev *sd,
 	case V4L2_SEL_TGT_CROP: {
 		struct ov5647 *sensor = to_sensor(sd);
 
-		mutex_lock(&sensor->lock);
 		sel->r = *__ov5647_get_pad_crop(sensor, sd_state, sel->pad,
 						sel->which);
-		mutex_unlock(&sensor->lock);
 
 		return 0;
 	}
@@ -1149,9 +1135,6 @@ static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	int ret = 0;
 
-
-	/* v4l2_ctrl_lock() locks our own mutex */
-
 	if (ctrl->id == V4L2_CID_VBLANK) {
 		int exposure_max, exposure_def;
 
@@ -1351,13 +1334,11 @@ static int ov5647_probe(struct i2c_client *client)
 		return -EINVAL;
 	}
 
-	mutex_init(&sensor->lock);
-
 	sensor->mode = OV5647_DEFAULT_MODE;
 
 	ret = ov5647_init_controls(sensor);
 	if (ret)
-		goto mutex_destroy;
+		return ret;
 
 	sd = &sensor->sd;
 	v4l2_i2c_subdev_init(sd, client, &ov5647_subdev_ops);
@@ -1385,9 +1366,16 @@ static int ov5647_probe(struct i2c_client *client)
 	if (ret < 0)
 		goto power_off;
 
+	sd->state_lock = sensor->ctrls.lock;
+	ret = v4l2_subdev_init_finalize(sd);
+	if (ret < 0) {
+		dev_err(&client->dev, "failed to init subdev: %d", ret);
+		goto power_off;
+	}
+
 	ret = v4l2_async_register_subdev(sd);
 	if (ret < 0)
-		goto power_off;
+		goto v4l2_subdev_cleanup;
 
 	/* Enable runtime PM and turn off the device */
 	pm_runtime_set_active(dev);
@@ -1398,14 +1386,14 @@ static int ov5647_probe(struct i2c_client *client)
 
 	return 0;
 
+v4l2_subdev_cleanup:
+	v4l2_subdev_cleanup(sd);
 power_off:
 	ov5647_power_off(dev);
 entity_cleanup:
 	media_entity_cleanup(&sd->entity);
 ctrl_handler_free:
 	v4l2_ctrl_handler_free(&sensor->ctrls);
-mutex_destroy:
-	mutex_destroy(&sensor->lock);
 
 	return ret;
 }
@@ -1416,11 +1404,11 @@ static void ov5647_remove(struct i2c_client *client)
 	struct ov5647 *sensor = to_sensor(sd);
 
 	v4l2_async_unregister_subdev(&sensor->sd);
+	v4l2_subdev_cleanup(sd);
 	media_entity_cleanup(&sensor->sd.entity);
 	v4l2_ctrl_handler_free(&sensor->ctrls);
 	v4l2_device_unregister_subdev(sd);
 	pm_runtime_disable(&client->dev);
-	mutex_destroy(&sensor->lock);
 }
 
 static const struct dev_pm_ops ov5647_pm_ops = {
-- 
2.43.0


