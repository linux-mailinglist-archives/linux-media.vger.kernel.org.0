Return-Path: <linux-media+bounces-43338-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9282DBA9261
	for <lists+linux-media@lfdr.de>; Mon, 29 Sep 2025 14:07:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E40EB1895C00
	for <lists+linux-media@lfdr.de>; Mon, 29 Sep 2025 12:08:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85D5430506C;
	Mon, 29 Sep 2025 12:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WQlq0GRQ"
X-Original-To: linux-media@vger.kernel.org
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012029.outbound.protection.outlook.com [52.101.53.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F68E2522B6;
	Mon, 29 Sep 2025 12:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759147660; cv=fail; b=B0sdG4b2z31gZNN05g27sDbF+5CkhNqimX4+YF6OGTbDcRVyK3npR9XtFy3IW0eDj4q5tNoemNgWm4sQNvrKTjJ1PTXQQwfC1mJYRrVSxSrmw2KPsR1F+tvQQBYAsfgc129W24m8LfgvhCgucRu+V1Juft+F/I2ct6W0ZrEqG8Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759147660; c=relaxed/simple;
	bh=rz5i0G2w6hisaRorJC09cE5WPxqBrHe2rfm3FEKYRv0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qhTgqnjzYmVia6Q7ysV3uV8yQhfhe+xUAfDw9Fdqvexx/DJ0zEQEZRK85bUZgMimh3piD/yQuDtfk+tIWqgIsYd9zpmq6EJpwle5wvMAYOVCOf95iu25KFkswWxG64jWmuTysDDw11874gtfrcltMJj+A8FDfOhlh/hBr+ZMQsc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WQlq0GRQ; arc=fail smtp.client-ip=52.101.53.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=neBelkxQjlzpYCt6Y2dlXM4h32yWYTX8ARlOlxXZtAj2J80nF4eEzMq9e89YRmEkPhBeusH8z2ZhfN8r3ICPMPwiMIc9tAhAFnI+7JNEeGMc/Xv174B4Qakt4/GJ9p2tQWeDwUkWV4JZjl3tE2mvjlJQDDyWPDjFQsFQfQDsE/v+LBsmoPh8I388Uo2nHw7o/KhlP4q24qyYV4envLTsnQLTGVqgP3Gz6vUTBhVN/0nw6xnder0YiwtfVWT+py97KfY7WhgsQzRoRjriW4+Z6xGQKUK0HpmPesq3fM6RCRUFyQ7oBbz1yYfA5qTeTxmYl5YSBdsFZwAuNRhUW7o8rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z0aGcMyEL18qrGGjnKjGvRfwjj/lbxyhN/yOiOTfVIU=;
 b=IPsZarSzCZ2UZ/RW+XeufLP/Q4zFk0A/j4507dUEeguvX6I7gmCEgQq/v4RWImLmIZM5Uvci0nXHkF2ovXs9j4RQto0wGiZBE0FcO54AfTxS4UhafeR+qlicEogjUYp4pSahYgGVakQW1r0KnKsZGT5IJ7HQRr6Qj/Kriiw9YRNDQ1Lk1E9i85qm8BRt1hxhGf0UoO90VzIy6yqwzwJZb6utxxJp702OdWNODemNCzhw0famc1JmpVVYkoM19/YQXdiuHnlinFbley+S0vMGeCIX2TjOFFCGMnaDhxIei9QPffQr/3oC+jguCKqR4Ac2dOstDdl9wvvyxyYJARVgyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z0aGcMyEL18qrGGjnKjGvRfwjj/lbxyhN/yOiOTfVIU=;
 b=WQlq0GRQzLm62Grx44JG0R+XX+dserzj46T+Rp6YYzBiX96QjJ33Muv8B7c/B8jTe4kiKv5NG95Wuda4uoPrGXu8La9XS3kzEPXUflZZCVP8velylwEST0iy05rVKi22khGAc5ZLXurAHdbtcOW/bJSWiDXIwfd5iVKQ18OoLt5aBJ1RgUfYU41w+20MBwgWt2BfYlq9NV7s4+OH0cFmJU8AiDeo6gwAv1DnaajX7jxuMSGGKu3E4kKpvg+uzsNvMA8+jBpyBinrul4XSPmVLDIV2B8L6Rc2hPu2C4Nh/BBlMriA7XbUsnC9lmRbc9nLGvfBck/dzYNQs6jM2P0gZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5757.namprd12.prod.outlook.com (2603:10b6:510:1d0::13)
 by CY8PR12MB8216.namprd12.prod.outlook.com (2603:10b6:930:78::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 12:07:36 +0000
Received: from PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632]) by PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632%2]) with mapi id 15.20.9160.014; Mon, 29 Sep 2025
 12:07:36 +0000
Date: Mon, 29 Sep 2025 09:07:34 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: iommu@lists.linux.dev, Linux Kernel <linux-kernel@vger.kernel.org>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] iommu: __iommu_attach_group: check for non-NULL
 blocking_domain
Message-ID: <20250929120734.GG2617119@nvidia.com>
References: <9a3ebe9b-518e-49ef-b87d-925d951a446f@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9a3ebe9b-518e-49ef-b87d-925d951a446f@kernel.org>
X-ClientProxiedBy: YT3PR01CA0129.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:83::17) To PH7PR12MB5757.namprd12.prod.outlook.com
 (2603:10b6:510:1d0::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5757:EE_|CY8PR12MB8216:EE_
X-MS-Office365-Filtering-Correlation-Id: ae8dd3a2-a184-445d-4f44-08ddff50c748
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bt2v24l+TJxDoLb1MVacaZ0t9gRS0FqshVw8WTLg1Hb580o8TQqHXPCjiGm5?=
 =?us-ascii?Q?HcHRcDGJMcEMp7sgQWRFQ6zLNvd5H8XXDk002R3AsSMoY2VOfyzn5sB0VLnX?=
 =?us-ascii?Q?sHFlQGZHHk11nSLQn+U5cqaXEoP+PMpalq+1XvKIDW75yj4ijN/SRq8JYWMW?=
 =?us-ascii?Q?YEJwKudjz+vghlmHAM4JdYaYSM8Rp6G4Iu/P3d/RJ2Qt7fPjAF7XNWnqwzn8?=
 =?us-ascii?Q?btaE7MELscwUVuS2DTb+go0l1BhULXKzxmhC4DKI5fieeZ8moKKqF0eNGHgH?=
 =?us-ascii?Q?caW2+4U+ClsEO35KF4mRna6vk4QQAuAJFBsjLqb2fsWymdqmJecEj75vNq22?=
 =?us-ascii?Q?xeRXoxEYM8+X6a6qEyZkj3KboswLLN2Jq/ndVrPCDsPmFkOP64GQakdTZtrJ?=
 =?us-ascii?Q?XSSauV2SspCpd91y+t7GcODjsxMBS3jaayvMO4w5MKHtRB94o7Cu8J1FxQBl?=
 =?us-ascii?Q?YyyaQqLcBFpHbI8PMN4hbdJtJEMkuQV65p3AQzsOquGHeeqUqez5MTnMMJbk?=
 =?us-ascii?Q?hDRnRh6ITnUIJiNAY18GZak7Uup3QImlhsxQpQ3kEXWwMK+jTbABLef/qGOP?=
 =?us-ascii?Q?xpEhmuBUxL6kq4mtBfD/xVqvXR9Ntjkac0ZiGLzvVrTVA+Ayrnhwf7HWkFdJ?=
 =?us-ascii?Q?V3TENRzezI4F3OxqerMzzn2DpcgbtS+6ptA6+zSIZfU/WDAgceKhKj18Rdjf?=
 =?us-ascii?Q?nzUfhhR+f+nAkZqcF6QGTKczCw5EgoG1xBmLs5ImqhPs/uFU5d11jXUXXt7G?=
 =?us-ascii?Q?n4AaHi6cF8kB+8BztEs5qkpDBE4NHOMchhtv9u8q/ytY4r0iQsIAmzdYArcB?=
 =?us-ascii?Q?yWKwieYw/RtkqJkE6US5k4oj/VyCDcYxlCGc2XMv/66DKylYzRY3y9QGQ0ki?=
 =?us-ascii?Q?ThQyZsl+E4bQts5Mu00xXo1/wqyDNRTCgpeYYqrkLovT4f5LMcP5Wc3qTEAV?=
 =?us-ascii?Q?+nZb6f2fFHONMsqWmutPEWdf/SyC2khDSggn0CbRtKZlAvG3hlkn6JDqeBVc?=
 =?us-ascii?Q?ar4HZbU/D6Ty4xyo02fKE1MLLKbl+EVw3nyLvZijvzPMbkKWK6TRsgokmOoO?=
 =?us-ascii?Q?choUYsDM6qrQhnJZZmvsZApy4RxWN1xmrJlteGZbKZHfdRVYa3XcbYG6XIM5?=
 =?us-ascii?Q?f0ZA8NlLJwUtbitvkEGJNBHAG0pV8SGPMrxKx+HdJDEwZrQEXaQvmwNOgzzW?=
 =?us-ascii?Q?gFETxhrmuKBe5OVz4qVBJgbK7UV+qDDG9WI9o6TBxThBU+FVp5jJWP3qwdKW?=
 =?us-ascii?Q?9sZcZ69bhgajjHPeRAJ3p4S6dMHx/3PFVUglCoaV5GOqx9TvZ9diEOCToNg8?=
 =?us-ascii?Q?Mww88Tw5EOS6D/93WUi0OsNYPYZJp1MY/nHd5o3dcxp5xCUhyx0pPQ4P6yuo?=
 =?us-ascii?Q?jSzroqc9n6X/0C2Ww4Neni9A7cl2xAov1l5nV8fevnmoOTospSQDvmqoee1t?=
 =?us-ascii?Q?3HwBOlupZHehsahvmwo/uhQ3DqFXzBlr?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5757.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Jp0sZzpaDVazSN3q21Qu/kTl7eLevio7DpxTTwkD07sNW54hbPAf0Qq7DEq2?=
 =?us-ascii?Q?euTyjv0WaL486E+MwKMj26qPe7Z6dC6s288JVBedPQ6p3IPG8X1pm8lRFREo?=
 =?us-ascii?Q?+OvwWWbiVEerdwu02K6yHJpHctecCj36KPx00KW2UDXGc/HrMTU/QcKhKVRD?=
 =?us-ascii?Q?HLz+wUqa+X/xIvILinyv7l2exsPGNn+SHjhbiGG27Xmt3zUGiqPqZEv+SMO/?=
 =?us-ascii?Q?YWwEA6c0MvHdiYsMEtp1CsYIsulC/bF2UWG19tM0zqlQ5/kvB3o6w69TREKe?=
 =?us-ascii?Q?dRaRUdqB8rpk/TaUTh2jggJlUFnYzOIW1LcfqfQ9J8zcxrn3JgZCuOLYeOkY?=
 =?us-ascii?Q?9gJ4RVBaiM61L1j8YYgryzGPQrofkMXmud9gKo7DS6yqXBl8X+3acQ/XhPpg?=
 =?us-ascii?Q?O1Y/F/4MsdzHKOFtnEBgbzQsR/vzsd/QAyggCjvGDXng0h73KEMdIJfp85Ul?=
 =?us-ascii?Q?1K5eEky7Eey6BD8DY3MZVvafXspQyWbXtHwGOZqjD4+4bLClXltzWjsWhNRd?=
 =?us-ascii?Q?1lVMaoUPU7sVumryeMpiDB0q2KTSHfe6kjV685bshBbxvcdh7+pMg51jGQ6i?=
 =?us-ascii?Q?GpJAvH0trUwznwwnUJC51JwdE7O+LMM+RskXnZlhYGVM40QJKZUmgmuxCmcT?=
 =?us-ascii?Q?GsAVdrEk4jWV/0AjU53mdLUKX2xJADQHWjWq7cp3HEo72DIZ2ffN+IBQYnDT?=
 =?us-ascii?Q?7fREZVnjZe/QwupDaSZFq1O/K0Rs+URBzkxSKt22Uo6NFhNx9L4j3TbgNuT9?=
 =?us-ascii?Q?Q/QlXOQMVbFKyF/a6xA454cIs3aN/jz8qPxIZTvJHzGbEwyrD0xMnmOcCl4p?=
 =?us-ascii?Q?qkrna3vd+uW9iF4DjoqWnFtjXfEZjdQ74s1j35kzAg/DAO7rW5GhrhB0qT7n?=
 =?us-ascii?Q?FhZP+KfGp1KbP+XXZT9r8GD9zp/QRony0Dr55fmQWtul5CN4n1Hs6EL2wpPy?=
 =?us-ascii?Q?PYHzhlOfgUVum8kMIHq1Hr0ZP4K+okjtdyAR3wzgUu6AUj5pvFqnR1uJJ7WC?=
 =?us-ascii?Q?4c9bSyCvf2vfsARGrBeUEN20d+a3xXO2xJjQYvE75xr9OcwAGSdSuEH0oSs4?=
 =?us-ascii?Q?wZuWwUze6D8KRD8glT5gJtlnrbyc2yDVHvjrIfZEqgdfFg0zkGe3AMg5lFeO?=
 =?us-ascii?Q?V4aspngNc6U74ebjCPFQdaiIdrL4UcIuUXFZYdRIEUShohOFUvDYhF1jGLfR?=
 =?us-ascii?Q?jciR6DQ8z/YHFfYa6JCdNcWPmPWyP2LyliUzcoHw/HuSV0J1CLISQToMLC/r?=
 =?us-ascii?Q?7+XmxK31aFh6PnZXlyDd8fct3gkPdEX98KEZrLc4t3Hb+VyCBk+dYqsmQfSE?=
 =?us-ascii?Q?utDr2fBFB6BwUAALZYo/mKWO0Gkwhgh6dKhdvdRDsbf1R1wPX+/uNJLJKqra?=
 =?us-ascii?Q?PpG7sdHmWR91sV5k8DDMyhYcmfKAqVwpYcumDyiV8ai4iXir4CciqxrFdpK5?=
 =?us-ascii?Q?yrgGE3YYMzPtcqCzcoRcgMnvgPtnzNh110KJ0YMBhn+Wa3rc+oC3IzTLECN9?=
 =?us-ascii?Q?2yGG4egrcn1qywihg9yDEdlX/bArlZwfStB6UlpwaCk6lvQpUrV2czgiU1fv?=
 =?us-ascii?Q?4iiwFsPX7oPMAHnZt8Y=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae8dd3a2-a184-445d-4f44-08ddff50c748
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5757.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 12:07:36.3927
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q4cvYrDqILUTZoy0l5QwLvJ5yXFIonQHVSJYywyNuuq92uxHiipUjw24R3/OVaSB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8216

On Mon, Sep 29, 2025 at 10:23:47AM +0200, Hans Verkuil wrote:

> Since I am unfamiliar with the iommu core code, I am uncertain whether I am
> just papering over a bug elsewhere, or whether this is really the correct solution.

It is papering over something, group->domain is not supposed to be
NULL at this point.. That probably means the iommu driver has not been
fully setup yet.

This is ARM32? It should have gone down this path:

static int iommu_get_default_domain_type(struct iommu_group *group,
					 int target_type)
{
	if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)) {
		static_assert(!(IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU) &&
				IS_ENABLED(CONFIG_IOMMU_DMA)));
		driver_type = IOMMU_DOMAIN_IDENTITY;

And I thought there shouldn't be a way to get here:

> drivers/media/platform/ti/omap3isp/isp.c, function isp_attach_iommu().

With a NULL group->domain?

Maybe it didn't call iommu_setup_default_domain() in the right
sequence for some reason?

Can you inspect around this?

Jason

