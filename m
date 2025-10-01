Return-Path: <linux-media+bounces-43499-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D24BB128C
	for <lists+linux-media@lfdr.de>; Wed, 01 Oct 2025 17:45:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7FB461947518
	for <lists+linux-media@lfdr.de>; Wed,  1 Oct 2025 15:45:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06DB528467C;
	Wed,  1 Oct 2025 15:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NvNkUIte"
X-Original-To: linux-media@vger.kernel.org
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010005.outbound.protection.outlook.com [52.101.61.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D129018CBE1;
	Wed,  1 Oct 2025 15:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759333462; cv=fail; b=E6+t+LYgQUMiIgZJK1ZBFp70cN0w1ttFQS0umZfYXrmzaI0+4U0QHVysFGJ1SLT3HkiHQE3laTE88BokDAgEh6ZgwdqEEhAqVR4oxnVtaoRYe/Jh0BW4UI+yUS+e6oo1JbXZWuTnh7G6lhrNwgCPRcYVmg3xy9dvwfAreTnqmgo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759333462; c=relaxed/simple;
	bh=c+0dN/gWQlZ+qxsum4i1mLkXQAE5lt2ZmQLo5Ckv+FA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=H2OQHOBLqg+u7G0Y9f/g30mBshibQ7qtbC42Q/MsT2hYicsR+7zcLYEltwIKMhawXUqbALVqOySZzaBSXBHVxTkeIXaquQG9Lp+/mTgBHzIkdLySEOEg9bX1zRCujSRcb3b7y4NlUwOdlmzvLAWp9XqIuuZQ6aeG/33IeU4q2nc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NvNkUIte; arc=fail smtp.client-ip=52.101.61.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I0o8kL7sp0Mn+VwQ4u4Fu/YZt1scz6Ydy4lLxFDUcFm77QHr57LnM3JmBCtwJ1usI+AzEY032AMCvSIMK7Zw9frzVt15Nl8j2ELZS1gSsrpNVkYVwc5u+98qGW7lVpQr5A6V1I6JsHUr/iHhKdX/xPt54zy5J/ilOpIPJVwZae5YQDTW3QuEa2bNd/MB6MkSlo6UK6B1Uo4EL2sifXFlylrb6Ncy8ZMTQZe2NzwfF6ueqlHYZb9pPj8K/nsNidQa+HfISG4yZtII06ULhDjQX2obSaoUBNufCN587t97XIcbyQcUvd9an7QZow/2iyoRqlZix17RlX3odWoE0H1p8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k/LexqHIlukupJmgPZguIYXRNCDcqja/CghGVuBexAA=;
 b=FNdXAri9j2fXPUqDm4MuxJNzxlt4siq2K35w5LWIePIdCTPrIDZbipa8pZ3uXTtkdD9YBMurHDb6rTsL3gltEUwuLAeFjs9KYwpI4usHQAZkLQ7D3KfFpYxtgnKgivEKy8DXtMyxed3wsb7S949m6o0Tek3fcrop9kNS/efExUXT1XAN7TME0XvjamoF9aWy4/uQB/jRf0f62BtJcxv0XkLPXfJD3167MLPsG3638IwtV2jfhGcpV4ZzDwqrKOU2Nm1nCjww+ypOjtc/Xm5oEk5hCDiJUkEGqRyTa5ksa4ZHf5NZzBnfA6D6WbTymA7h2EzD04ojDv7Fs8mXsk4Oyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k/LexqHIlukupJmgPZguIYXRNCDcqja/CghGVuBexAA=;
 b=NvNkUIteEm532mIPfQuq2Kvc0chXVPlKZwZcpScGW7u/6qOpSVKP6NTBO7sotsSRLQ3/e0em7X5/9q149nvUz7TfQTWK9Z78XqspmG1f3eCtVUfElNfdcwcD9Mf1IfRkaSxHemrrOLnH5wIsrZlMJnftqDHeQtttPxkeWUf5VXRksyt398WguSrUrVVqVh4332Ro7dMtZpk5+rTj2E8zj8onjQkoKpfgYwFTzGtclFIsak/5/x7uR/lJvAeRsFze1gMfKNAjvVcODL13EqiTF+p6uLUNfA+LUl1ILrn3bppGYpvrWKM9EitraGE4hqb4VtqD9AfzXWAPekXl5TObsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5757.namprd12.prod.outlook.com (2603:10b6:510:1d0::13)
 by SA1PR12MB6896.namprd12.prod.outlook.com (2603:10b6:806:24f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Wed, 1 Oct
 2025 15:44:12 +0000
Received: from PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632]) by PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632%2]) with mapi id 15.20.9160.015; Wed, 1 Oct 2025
 15:44:12 +0000
Date: Wed, 1 Oct 2025 12:44:10 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>, iommu@lists.linux.dev,
	Linux Kernel <linux-kernel@vger.kernel.org>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] iommu: __iommu_attach_group: check for non-NULL
 blocking_domain
Message-ID: <20251001154410.GD3024065@nvidia.com>
References: <9a3ebe9b-518e-49ef-b87d-925d951a446f@kernel.org>
 <20250929120734.GG2617119@nvidia.com>
 <58aabb55-0030-49df-81ed-d4a68174b57e@kernel.org>
 <20250929130214.GK2617119@nvidia.com>
 <4037d353-0ec4-4f68-a09c-564b93ba313b@kernel.org>
 <aNzEOeCi8Zjn9S3N@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aNzEOeCi8Zjn9S3N@valkosipuli.retiisi.eu>
X-ClientProxiedBy: SA9PR13CA0073.namprd13.prod.outlook.com
 (2603:10b6:806:23::18) To PH7PR12MB5757.namprd12.prod.outlook.com
 (2603:10b6:510:1d0::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5757:EE_|SA1PR12MB6896:EE_
X-MS-Office365-Filtering-Correlation-Id: a851e3d8-ad4f-41eb-fd0a-08de01015e1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?g4OGZ/ayQadP0x+GolJiPt2ktxjwi1R/TrZjRyHiJvApgbgng4yAS3bCQ9My?=
 =?us-ascii?Q?nrjzaKUBjD9drharK0JHV0SsPnvMLh6yIk7XivKFlLP9uiVxNDctXXWVccC6?=
 =?us-ascii?Q?+yfoGDx+CxF5vaDufpQVUmnQAtrD5YY4A1I3ntzoVG8NFR/5quFssf95qrHM?=
 =?us-ascii?Q?zmRCffFANxNz+L+HCgv2do2Qy9nUiWM3frmkztZP0/BdiFHl78TgfcpT0a5j?=
 =?us-ascii?Q?2jkPb7ydsJkw+P2GhN+3935EgVVHqDify3N1/bM4WpllERIaYhMO7Q8nBreC?=
 =?us-ascii?Q?kHfl60/ApR5krZ9AVXq0u3xGe1mkszqHaWyedt8zPwf764hIlBxl3VZfzA0g?=
 =?us-ascii?Q?vCaQ/MR/G3B3ZXCTfZc4vJt4TCTq1DKyTaB942xKQ6XeokDZsgx0OETDTiJi?=
 =?us-ascii?Q?ZIsCNGHXbjh/1//PO+UZzZpz3B38NyRUAn7UixZWTpVnYjFywgK5G3Y0dAwL?=
 =?us-ascii?Q?LlsnTwKs1eHJVsBpJVn/p4yTuG2BvxFv7V30WnsbZmAdwokpzWdfp7r3bPVJ?=
 =?us-ascii?Q?OtqLcRkw7f9Y6KIB2TNrHDUCJqK7vlHzI4yqMCYUfQ0QGewqzD1+dkJDsuzE?=
 =?us-ascii?Q?ej0ht/EK9hvxoEI9c7VeW6U2pXTYXkl9I9xHtFyOJHKb85rNaJ/Y8yMIZoST?=
 =?us-ascii?Q?NdA9KTmkgoN6r3skPAWEif4n/0NKYwCp0+5uDFKZrticVXZiFl1kIfVgajOc?=
 =?us-ascii?Q?jEX6d5mNphOXFGMr3A56Hdx3d49ADCMAO5hxuc7UltE/enJutT9/XMI47x3b?=
 =?us-ascii?Q?dotkXwW3R6MxzFpYQvrhiucDpNoGI2h1JS+Q80dyPaIhHLRHSMAmIQctdvgh?=
 =?us-ascii?Q?lQfdEEUV/wA9z1Pzuj5oOgfHQkYOY4de8nOhdcXXoRyHy/J0fJmYIJYb5GaY?=
 =?us-ascii?Q?Zfy8XIVAqkBFEsE9SYEDJZsRZbNxvpkR1TQB8/cSQTs3/hAc0uCgwZUWhW0A?=
 =?us-ascii?Q?nS+K8IrM/4T4/twpEn//rnVXVPVAb6ToN3hfw3kqHD62EhelLPRbhfYqWYIF?=
 =?us-ascii?Q?EmXxqlxKvUlloNzlaS779/ZRgWwidGNM8ugnFWILyowDe943WqDOHjjiLIII?=
 =?us-ascii?Q?oCq4k+PoIumCAv0CciYRUad2E4FOz0h02uGU66jI7Aes9HDEQe6cZFJPoruw?=
 =?us-ascii?Q?nOikrNqeauABXEBgnEJYxpUUpJriHIm5ZYlEAnLoGMlqyrJsl2K2sGC/HSKi?=
 =?us-ascii?Q?US8ClaGJTWXn8++h7+8SFNfTbaos1UT9LUGUzF4WcIGCXwNUVzhrMan+IXNa?=
 =?us-ascii?Q?Fi+4SV2MB6/ickR3XCarA6flBSOeyQk+N3St4XSMkx7qwIY5kf3h/Uvlb3ft?=
 =?us-ascii?Q?IkAX3ulMPBJxCDR+qkx8VaiwAWCsTDt9i3Rm6Yaf3/XY/fGduUr0KTV114Xd?=
 =?us-ascii?Q?W5Tjuv4p8Am7g7JBLopWQjiRw/G/eFvEx91dc0xU0WDBrsP5kB2RYQKhgi2G?=
 =?us-ascii?Q?Xt+31O6muyubSdxwt/hyUDqQ+5El1HPQ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5757.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cPnHWoQ9ZQrupUEiW83+UorYTwrqjdt7HCe0c1avxCqhj/jgnJiBp+Y/+efU?=
 =?us-ascii?Q?dc/aNCAr1ZyEGqyAXEdAg48wB8PP7CCRe3rIZsHOohMYBV5CfqQ1jAPLq0zj?=
 =?us-ascii?Q?0hCG+ihtuVvmMvmR/5wboJZRt9z7r3JXOgl9AM0MM2P+UbfAY4aGWZqSG9Vx?=
 =?us-ascii?Q?fZfGYbXxsbbW2/JQMlcUpAcY8PzFFin74lGxThhlhKpnw1Jskcs4BM2nSSdP?=
 =?us-ascii?Q?x/3cGCAkuLgp9xEg3a7AomuUUNI7xys+X0WuPDH5H6nKCfx49k+Q9X9N6phm?=
 =?us-ascii?Q?qfQrGBiuw23teFBKgOe1o735cI+PHyqKXe45vvorXkp0DCz2jq7hZA1C/fif?=
 =?us-ascii?Q?dc8/Us6fBy+5PRD7qnWG3GWCo5bBo8AYt8rgwiSInExO8lT7m0bxSGPgtzbD?=
 =?us-ascii?Q?ELrPz/0NYyoD41TsF3sXNFWfgfszC3YaT2PtPWk5HnLSR7PVUg7wm7HnM7FY?=
 =?us-ascii?Q?bNE6cFTYO6q+/Oqqz5lypYj8ETajUy5nR4R/mofF//tk4qDsppEDRzFrXxI3?=
 =?us-ascii?Q?WkTfAcYU6yxGXA0IIjxkMclLdXbtdPBuqY2I5IOLSV2Yk3yFZrJ9A8K65EO5?=
 =?us-ascii?Q?3SzO2Bu4S0Kt9NKny1Ag/feRGAvxpFkhEgL6ztWiuGbbVt2oFqez2zq/rhUW?=
 =?us-ascii?Q?GXRaEmz9x93+Cho17VYsNnijHo/Ar9PvU4++utUUEoxGkGMsumOuuAux0DtG?=
 =?us-ascii?Q?M9iCivH9dcrdQUwGYAwmVYd2LWiSL4B6Qll//o4HaHjPcd3U/JPppihEAvCw?=
 =?us-ascii?Q?qjBK4g/c0XEjXciCk2GyvMBIwbgwkZgP+UJBGQb5Qt0WgdO5sXBIumF2IwkQ?=
 =?us-ascii?Q?WYmXR3YHh/JVxh7xLt/n+NeHiGkgMCjFDq6z1CUHgMSlHk/2WqzISad0nwiT?=
 =?us-ascii?Q?uOmyqkQNKbo4GEM5dOOaFSKFcy+s6mOHAjui2PP5SqLyfDYgXVGfMQbWz1fo?=
 =?us-ascii?Q?VMiAAfQAgy3TYbo/lgEL1f5YB2z/DW8epoGJmiNstVkFD7Elv4omVUJM7Qj9?=
 =?us-ascii?Q?78Kj6wiXeYKpH84Wce9TG6h0xSTMrdCpT7bByphxx75uRiAowYf4F3jeY+ha?=
 =?us-ascii?Q?Bjk0Cwo7GW/qb6LT8dwOPvLwKqTmOz5jnM/No+48b/RbliXMfdq/RmKMHmnN?=
 =?us-ascii?Q?pi6T0weF6H2qh9M8wMcOi4Y9/Q/DOGMmRZQANtCGw+4x9g+knTyPdssnfuMT?=
 =?us-ascii?Q?4927uL3IVu/hmTI736ld2VE2vjnkoTp/X4qFl3NMmt/Lkuha1omNo9I3IUZu?=
 =?us-ascii?Q?Dp5mO5x/ptxz9HMcm+EGPzJ5YBfQtn3Uf8nOoFRleslHv5xxQP7UQghLlP1b?=
 =?us-ascii?Q?jnb/a3RMDwh024JAJGvd1xdyD73QGgNSMGX5KVp4pOlzSQLW9zY4VykqB4AH?=
 =?us-ascii?Q?g2+AZSZOea6j5yShAt75QCA9wM2y0tBexuevqixyYtm40npWPf7+qGdwG9wP?=
 =?us-ascii?Q?S9bNOIdda8I4Crq3/cx6OAYXbWVp1uekWJNMyYYkAtDnGWqPgGOVbAtZDTyM?=
 =?us-ascii?Q?S+pZkScbbL6ry5EDVVmKpeqzPDMicpfwLY4V9AFQ1c2tDq2OUskGgndYW9+q?=
 =?us-ascii?Q?Qf22g8fVNQH527Rx01zlY4jPb+wqIYJvmfkoyf9r?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a851e3d8-ad4f-41eb-fd0a-08de01015e1c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5757.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 15:44:12.1811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G3cGS/AfcDTuzm1XeIbFD2/BXvxrsLwz4TiMgjFlCtiM3UfVX7KaG5UyyYoky7oY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6896

On Wed, Oct 01, 2025 at 09:03:37AM +0300, Sakari Ailus wrote:
> Hi Hans, Jason,
> 
> On Mon, Sep 29, 2025 at 03:30:22PM +0200, Hans Verkuil wrote:
> > On 29/09/2025 15:02, Jason Gunthorpe wrote:
> > > On Mon, Sep 29, 2025 at 02:18:50PM +0200, Hans Verkuil wrote:
> > >> On 29/09/2025 14:07, Jason Gunthorpe wrote:
> > >>> On Mon, Sep 29, 2025 at 10:23:47AM +0200, Hans Verkuil wrote:
> > >>>
> > >>>> Since I am unfamiliar with the iommu core code, I am uncertain whether I am
> > >>>> just papering over a bug elsewhere, or whether this is really the correct solution.
> > >>>
> > >>> It is papering over something, group->domain is not supposed to be
> > >>> NULL at this point.. That probably means the iommu driver has not been
> > >>
> > >> It's group->blocking_domain that's NULL, not group->domain.
> > > 
> > > Er, I thought you were hitting a false positive on this:
> > > 
> > >   group->domain != group->blocking_domain
> > > 
> > > ie NULL != NULL
> > > 
> > > But I suppose the whole expression is checking for group->domain
> > > already.
> > > 
> > > All your patch does is entirely disable the safetly logic :\
> > > 
> > > What is isp_attach_iommu() trying to accomplish? It does
> > > arm_iommu_detach_device() and then arm_iommu_attach_device() ?
> > > 
> > > Why?
> > > 
> > > Is this trying to force a non-identity translation for ISP?
> 
> The omap3isp driver expects to use its own virtual address space for the
> ISP: the video buffers are mapped there as virtually contiguous (physically
> they can be whatever).

Sure, but where does it do the mapping? I didn't see an iommu_map or
any other iommu_* call in this driver.

I think it is using dma_map_* to do it - probably dma_map_sg though I
could not find it?

This is why I gave my remarks, if it is relying on the DMA API for
mapping then it should just rely on the DMA API to establish a paging
domain and not try to open code something like that.

Jason

