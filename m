Return-Path: <linux-media+bounces-17583-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 347BF96BCB2
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 14:44:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DFF15286FCD
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 12:44:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C73FF1D9D87;
	Wed,  4 Sep 2024 12:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MphXv6kY"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2056.outbound.protection.outlook.com [40.107.94.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CAB1D88DF
	for <linux-media@vger.kernel.org>; Wed,  4 Sep 2024 12:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725453853; cv=fail; b=acKmkd9tS+BYxHkvorv+d2iYjzTkynw4Qoi2eDV8b9qpiQpnKf7Xuk5pq4ZcMndMwa38N1oD32kiTNP1tpxL2AIi8jYyD+lzfz40VOHkfEL/nTLxjsiK40ftAn14wZXvxzCl/O6anoAXZOsSiGYidpX8gQ+dGRJT9LT+lFi83js=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725453853; c=relaxed/simple;
	bh=dhIi90Xjlzr1VMsiqknAXUy6v+z6EBakFXLQZbtsbn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SKHBr/rCUWUsPu9aKWZSVlUMvgb89eK3x/IdeMe4n3i4rbJPqT/p0YeAMne4bcMTWTtcAG3+BZBuxcjVDscB/MlOAZzWVDrBUIgLuZqZelULtfS6osjVOczFWbOyOrlTwYAV5/YqqcjxIS1RnXsnoYVKXuAs2M53cqARxQaAA6A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MphXv6kY; arc=fail smtp.client-ip=40.107.94.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c+Rk2riH+pkwLuA83ff+t9sf4pqy7uMhVZ2Zn964lZer9brDumTvfVCiPnHR1E3SQfpgljCdfTTmYr2neBlWRcjFeEvKtbUs/b4rKzkG72bH/P6rvLVperjiMWwW33VwUScJYjtVD3InjUJfVfSg2oQNVM/ijKGD32xJDZdI7kG9qWnHNsw5W0NJXvrLlWH4VzFdMc4sG6LOGEngKmkuKAdLOPX+IlDPoE40sjzGjWzWjopjjuIvw5vnHxLuhKRBeXbWKhXKSDyXFLMEDhQL2LHGaTYx5raMQfI3HP/YN4ZU6as9+I0aVHUt6fOnROQJ/3a/ITH4tRXnxPXjyKg+ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RLumYPqDPg7PvF2Q4xs+85cKU2fUuXlTiNQsEu7UeFQ=;
 b=cCxqhAhfxdEv3s2ouoYctt9lXDZ5uYC9beOB7NxAtK17lvSLCpxAVV8vd41bO6EJLZHxRrhJEtQa0pst8Ib45DSjr7cpHHyuLt+BkXRDIyi86HMlJ0EseTHrqnkDL22LtV1A4OLJUlUKXtdjRtgh+x3LtXrpLTVSS7KKUXUbE7xxF0pK8xtSUxNNKVSBrpIijATC+WvDZ8nXOuED0drYHLtAeF2sb0y6ru1iXzM084X7NNGZXZ+35zfu5gk7aESeP8eRaqxbDpNjTze+eyU0DtNoDI27OUBce2sikT1EQQF/ilrRr5OVjAYV5clrKEMN3mVsbM/zdppkziIY75UMTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RLumYPqDPg7PvF2Q4xs+85cKU2fUuXlTiNQsEu7UeFQ=;
 b=MphXv6kYPbilm74kDLemcD9lh6ISEUeYdie+KEtjGf0/WJPR6Cd4q3Ovn+LK7HrkIxOw8lDrm0Sj021cplpLNwX5PRuwqxKgHFfQJyQ2TpveVCHQd5j9CThgur/m92i6yeojBk/jUqwCJ2KtSTOOluSUzZmQmqRx6f8np0J/TnrQBG48ACobpu6Ib6EbtNeTSCykck4TO47f09t53xUHtRArctI2lpqU16vGwOOFn4imQDYK4qDQzQqNQdml3LwcvY/6Ad+weHqHBly6HlGQ3/KFI03Tx+WOLcW/s8U2+V+p4OAHhOpHiR7rwZjyMD0pVFHMwzaGLlbW7BmOcneo/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB7763.namprd12.prod.outlook.com (2603:10b6:610:145::10)
 by DM6PR12MB4370.namprd12.prod.outlook.com (2603:10b6:5:2aa::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Wed, 4 Sep
 2024 12:44:07 +0000
Received: from CH3PR12MB7763.namprd12.prod.outlook.com
 ([fe80::8b63:dd80:c182:4ce8]) by CH3PR12MB7763.namprd12.prod.outlook.com
 ([fe80::8b63:dd80:c182:4ce8%3]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 12:44:07 +0000
Date: Wed, 4 Sep 2024 09:44:05 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Lu Baolu <baolu.lu@linux.intel.com>,
	Russell King <linux@armlinux.org.uk>
Cc: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Kevin Tian <kevin.tian@intel.com>, Yi Liu <yi.l.liu@intel.com>,
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ARM: dma-mapping: Pass device to
 arm_iommu_create_mapping()
Message-ID: <20240904124405.GA825382@nvidia.com>
References: <20240812070202.9366-1-baolu.lu@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240812070202.9366-1-baolu.lu@linux.intel.com>
X-ClientProxiedBy: BN0PR10CA0029.namprd10.prod.outlook.com
 (2603:10b6:408:143::7) To CH3PR12MB7763.namprd12.prod.outlook.com
 (2603:10b6:610:145::10)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB7763:EE_|DM6PR12MB4370:EE_
X-MS-Office365-Filtering-Correlation-Id: defa86f5-bcca-47e8-f69a-08dcccdf43c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gt25Wv87fBtW9fLKMh7IfRijuOc4AVYivoq5fT3UU/ZSiw5+R/rm82l6oI4o?=
 =?us-ascii?Q?er8Ocwu8iCsmSZApxapDixl5zqnyDwLUesc2moWItT9mP4tyfnndoE33VMxF?=
 =?us-ascii?Q?voNQFtwNgBq0NSr+f4f4eSUDQg3t4w57AestUHhyGdNehR0dcWQNPKSOgnme?=
 =?us-ascii?Q?0qjIYsiUDETwf8gYkDsWCrMZC8BO5aiNqrMBBwPNBnwU3mOnFGf9Pc3l3Byq?=
 =?us-ascii?Q?uJZSqiQaX7bisubRcgXtThslgzSl9Ulq8JHpv5u0T7ksb4JWnjP6PZkq1e3H?=
 =?us-ascii?Q?ESZfDOrq7sXIJdXZlbkOFbnxR+rJRdWcbdjhZQHan3PVYa+t1LJhJBqE53DB?=
 =?us-ascii?Q?OCQqYhn93q5QrzcB0vEMwJUIznu9SAxVyKBcyaXCKM8PlayBPgoMDdYxPQx+?=
 =?us-ascii?Q?s5Xn5h8widrDeS/jgzdRmtGmJTVjB1tNelAJnPDgkksiUgpE0gyxymKITvxh?=
 =?us-ascii?Q?VzfOJ+65PYedjdYAiN9dGIi2CMR8z4k48gEhKbZj4vMplrpQ0829+U2rGdeL?=
 =?us-ascii?Q?EH3yGTqJbJ8Ue6IhsIwfe52N3sxC13tQ/hzDEKS4Q0PDWbP+04ajy+eWvDq4?=
 =?us-ascii?Q?x/y7Tp7C7mqgOYeUf8kAAmVhWB+h96WbiUYVy0j76NTXz3XImGwWgG0PIyfx?=
 =?us-ascii?Q?0XRpTHF9WvPcR9iKHS0wFpURu3Q4DFOQtrAxGGLIB2fyfjovtWRzPF0BkZVs?=
 =?us-ascii?Q?L9BsZ1GgV1kPdxGZGIL/zH/Q6UN0mlQ5RUaYf1njEiARaogRWj1YGEXKDlVb?=
 =?us-ascii?Q?8CrY7DqhsiHqInCS7xx3nEdNuMxU12z1GtRyjvb0C8KroTmRsJrgI2gJrWVR?=
 =?us-ascii?Q?EyFsABozTk9fwIA/uZBpUU8OFnps5Gi0PU/KZ6fj7yLCDZmbnUD6mgHyvBII?=
 =?us-ascii?Q?qfMf6SWIc7cF5y3qc/WhyaBWW2kslsTgmOjo5f4ai4q9zw8pvf18F5LMtqa2?=
 =?us-ascii?Q?wDEdwkDavJXArDzY0OBlsqpgIBR01KeSubbq9ocDRGyQceVm/Ud0hBnMbIXs?=
 =?us-ascii?Q?elxModuuHWK6YTWq6jdEEeQBIrDyLpKeCClSfR7tkDCdDvBN7A2H9uQQA/yG?=
 =?us-ascii?Q?gbCrTwYdq5GELew+UYMzTLNHxjF8MU1tk1JTn1/zUras6hUx88vEZhgULUiy?=
 =?us-ascii?Q?qz1J9+3TdQmFo38x88zhVhHUUKRG6tNkmkdX4hUSgKtkF1jndWwj4q6l5dTA?=
 =?us-ascii?Q?iQkEstV+vqF4WfEaKPUT3z9bRQS6K/tLBSBHdwP8eddmxxoq6CsUoaUBlO/z?=
 =?us-ascii?Q?sJx6vU8z9Vq5nLCpcP2et68SGEdivF60TbbsoGxSkFvISXDlsgfoO2v/Si70?=
 =?us-ascii?Q?o9e/vFSNeys46zn0R7/VZj3QwUvc9MTCPXCs8RqjkTLDLw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB7763.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5rjlqD3mLjn+GGgHQT5yTY7RHmQ8NPV7Zp6ySDL0VN26ajLE+JgtnKezH0ci?=
 =?us-ascii?Q?OlHECwCood/lc24E0X3nVxhsKU5bLJiVj280cZ699BGyymDdLcBlxGLznNYJ?=
 =?us-ascii?Q?NjYP+cMY+ei3SR67JdklBBTb+dyU92nDUOJkM2chu4iqkc/ewziSquAPzt9Z?=
 =?us-ascii?Q?2ueAWDBKivoFvwSRl8m39OMQknYD02ERn3YxRht6iwPwJY0vrINmbHHySlX6?=
 =?us-ascii?Q?tWCJurZNCc/jYWXGtdBU01q6aM2Br5H94r7POrpFzt3eMG1+w7tZfI0TAgIy?=
 =?us-ascii?Q?aVrS5JDcfINmjc/bXb9XDclozhbFR8/ITtldHQWLmZd+FbTJ0Lt1D3WjVwix?=
 =?us-ascii?Q?l8cXuLrIUzh0oBrPWY53mGbPpWwUUOUXw/q98Aa5MhqokF9ImZjlj4K/iY7F?=
 =?us-ascii?Q?QyC4IdDC+6tFiS8czPmwzyxqhTQ2tRWt7+PMQr0stJiJBjpAN+q7F4TeVHM8?=
 =?us-ascii?Q?zvO2MuQ1mM/4Mbbl4aLJ7gxKwldoNbf9ZDrVeCw1KCpkfzwymsiPvnMEfK25?=
 =?us-ascii?Q?vpu6dhtyZnFHzisKFHUH8Ixap4H91gGBetlYYMRAk9v3w+zeb8vRtuQl4Hjk?=
 =?us-ascii?Q?t7Za5hAMlAxYlBhyiFgPPzPpPbKgcWBmxxuFm8ldH2gFXNpXitbzWe+8udQ6?=
 =?us-ascii?Q?YGyhBl5S2Zre7N3auqkpdghbWxlwRyUhQtxXVKBQciT7R09qhYk4ZR+25O4m?=
 =?us-ascii?Q?Z2SUpGBsKl5WSOuq1gSi3i/lZQMfWZ28Jw02yWYqVCwI1pGwMuJculGuNV6i?=
 =?us-ascii?Q?UXQPzE7gJxScF36RX5ebINBbvwZ5Npdobod/2Yr4QdpZSu6yRsuVnr70Wrst?=
 =?us-ascii?Q?EywnvSZf8YsPH904LwKFyhxiKYhcHXIAwmUmo2jt92Flxx+aK5yhvekIkfoB?=
 =?us-ascii?Q?y/ZLc2VI63NZpgjKDPUh/O1rGXpIkOhvhDoR2iSCp7MG6oFjTBVrrQ7RoBeU?=
 =?us-ascii?Q?H74dR3C6E61sEQ17tvpHxowXDc3ggvg0mx4qLUf2OrBXJ/rnoSlVrOtTv19d?=
 =?us-ascii?Q?TdP0aw2xPJEJtkOT7FTAqAhDGUmxOuHLuBFLCT4w3qB5GkeHphVan8QSCtnt?=
 =?us-ascii?Q?gRh6l8nZAV7GLnXSXgh8RLdUR2hqGDtNa3zOM4cZW7+JtKRsI1va3Co8PVy8?=
 =?us-ascii?Q?vHHfDjtW9yyApgqKmGvNVlzalZuUKqoMjQn5r/BhyERwuOn8+MZJJx0/eMwk?=
 =?us-ascii?Q?Q22CGek34h7nw6PUyL9xWzUjxQHB7Zn2nsnWSoh9VveSDsXfuY9dvynf1fz/?=
 =?us-ascii?Q?LjA14QfkLkyS6U3jr0y3UsX0sOOpXSsJLdSzLgLZxorYA7KDuMfXVeX1D/A4?=
 =?us-ascii?Q?/R9/tCVKXTi64fezAEuUrgU02cEsh3++brDMM+/kztZEEbSE/u6aea0W+qDE?=
 =?us-ascii?Q?Hyh0cqzfFF6caEkb5qjNvmXNgeHCa/iYL7gi7ISlsl8CaUk2HtYv1O5PQh4u?=
 =?us-ascii?Q?o3eWKwj6TsAFh/wFJEXluv6arJyEbpz2QX5Iz4sZjSZ3PqK0vT8wx2kPueD+?=
 =?us-ascii?Q?oKYtPqTpqGUxt7l7mPk25RisKFyhcJiPaA/1T3FsF0ejKwgJ/x5Q8CanMx+j?=
 =?us-ascii?Q?4+0OMLNWzRBgYYnRv3VXdKAWajilscxiWlozhzHi?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: defa86f5-bcca-47e8-f69a-08dcccdf43c8
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB7763.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 12:44:06.7905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8z1aTVh3A0x+ztsdFiclfhDA7HMCLW689oEaaA+3JpHBDLtkvVUHyVjlxXJ1f0hT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4370

On Mon, Aug 12, 2024 at 03:02:01PM +0800, Lu Baolu wrote:
> From: Robin Murphy <robin.murphy@arm.com>
> 
> All users of ARM IOMMU mappings create them for a particular device, so
> change the interface to accept the device rather than forcing a vague
> indirection through a bus type. This prepares for making a similar
> change to iommu_domain_alloc() itself.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> Link: https://lore.kernel.org/r/20240610085555.88197-17-baolu.lu@linux.intel.com
> ---
>  arch/arm/include/asm/dma-iommu.h         | 2 +-
>  arch/arm/mm/dma-mapping.c                | 8 ++++----
>  drivers/gpu/drm/exynos/exynos_drm_dma.c  | 2 +-
>  drivers/iommu/ipmmu-vmsa.c               | 3 +--
>  drivers/iommu/mtk_iommu_v1.c             | 3 +--
>  drivers/media/platform/ti/omap3isp/isp.c | 2 +-
>  6 files changed, 9 insertions(+), 11 deletions(-)

I still have an account with RMK's patch tracking system, so I went
ahead and put these there so Russell can pick them up:

 https://www.arm.linux.org.uk/developer/patches/viewpatch.php?id=9417/1
 https://www.arm.linux.org.uk/developer/patches/viewpatch.php?id=9418/1

I think I did it right, though it has been a decade since I last did
this..

Regards,
Jason

