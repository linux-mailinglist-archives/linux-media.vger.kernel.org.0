Return-Path: <linux-media+bounces-43344-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38590BA9704
	for <lists+linux-media@lfdr.de>; Mon, 29 Sep 2025 15:53:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8A4657A1CBB
	for <lists+linux-media@lfdr.de>; Mon, 29 Sep 2025 13:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92065307AD2;
	Mon, 29 Sep 2025 13:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="km2p0vsS"
X-Original-To: linux-media@vger.kernel.org
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012055.outbound.protection.outlook.com [40.107.200.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BB01FBC91;
	Mon, 29 Sep 2025 13:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759154003; cv=fail; b=QZ27bsNPoMvzzs9yiUyNF3PWbb+CZDvAAOQr82/49I6dbBiluv4gjkSTtEHOpfqHyG+EUcJyEWxiFmX6YLqRWL99P/j0RyI03+e64jT+bsYKtiD0h0kzuG18fFFCm0FaeRIIAIKy6BEfmDbzXUnJYIExQCDFLs11Y18sDQjvbTM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759154003; c=relaxed/simple;
	bh=Q4rAFhDz1x+DfYWo1YnNu+nGusX20rDLInqk9/vEK2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=aGoGc9B5BEY8AEZhapkPaY1bHn2UDvfbswaO2Y7hlfm7w1w+sa1VrYs8Cp0uWUsR8DDOTpOjj7UWvboYtWvEevWcymstnx23o8CdrJy2viLpidPppp8L6URLVGDeG1TgyUCw2cDHL+JyMU7gRNmGPJjU51S0ZBzkWQ20cDK8w0g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=km2p0vsS; arc=fail smtp.client-ip=40.107.200.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iS+T6VJ/UYYM+WSZXJjtIwaLS007a2U0e7RoFUX0hotCxExEDAoUT4xPvBKF/w8Osm7Nm7aSY6m/zjP/eGpSS00KohGjn28u6jtPQDc6P/uIuRMwJH4RAaHUY010HJwjo/V/iUsOUnB7JfqxZl2jwddMWTbUidD26JhoRZJlFIU5sVtsmSwcyWamitrDNj4i+0H+G1fEvFx+iDa6d9WXe8KDsKLM4mw0dtBs6/kkRNY9UicD8KSd2i+KkgZ8zD4fP91qVUqWTzPvhWL3p++OlBlbUOunnG9gd/9jHQAmr2b16r3SFSPhnytYBGzH7oBOsqTc60AjXtY0Mk15ufJ75g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K/2mtQFmunpxBxAG4KW6KWXqRFPoF9TyAWN+P0va0Yc=;
 b=f4MtntnC89OCVbIESHu1z63c1AqJFXeIJMpkhhF9AB2qOrkJ5SHTqHbZDFbka0oByHtj3HCbyavOo/PsxfLzlQfoyw78rFcRNgurQOP/VdIt0pDsmp3R2B6Sog4HkvvHh/1ZkG1feJwdR2dWaMaa2ShRTR4gHrcUVcqetlO0K7n1ZJhNUAYCC3lSavsGSQX19YcGhNpRkGck3VF/E4LwgPSgxGeHCG/QMyBVF4bTCtT2Vs0b+5hNcJBGhQVZU9pq+ZlNI+ghZgnxSfDucdp1kxIDO04dnjvjhO0ClQmMGLcLCiTF3gNmKPO4l89XvGZ944a58CAFzwQC7A2hVLeG7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/2mtQFmunpxBxAG4KW6KWXqRFPoF9TyAWN+P0va0Yc=;
 b=km2p0vsSJj6rCjlCxffBmZP5Eyw92ylROCfCwSf85l2DAh696nqgHhpzfft6EZbF8yrXCRV3YLsonVfiDZAFmDIvsrLSxmelQprSVGwirCnq/DisHHSrKDN2DW8/YI6EVetoWf0S6yIjhIED/QFF/1IgdcEIv/paKbcjt1aH17C+RXFMKF9qd7SiHHXo3nSWzUE6QCM5uQm9Ch5d6YoQXchppPUMlWHKcmxwkuA26OPD76aCYxEPWsX8bnnFIhBUZTyL5vLzjGtIE7vG8TQPQViqVOy4xqYWSXNIZ6lQU2qdeTsmv+bM2a2+5GOFhy1Dc7nYRVF6O8/wSkN/vSqNbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5757.namprd12.prod.outlook.com (2603:10b6:510:1d0::13)
 by SA3PR12MB8437.namprd12.prod.outlook.com (2603:10b6:806:2f5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 13:53:18 +0000
Received: from PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632]) by PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632%2]) with mapi id 15.20.9160.014; Mon, 29 Sep 2025
 13:53:18 +0000
Date: Mon, 29 Sep 2025 10:53:16 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: iommu@lists.linux.dev, Linux Kernel <linux-kernel@vger.kernel.org>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] iommu: __iommu_attach_group: check for non-NULL
 blocking_domain
Message-ID: <20250929135316.GL2617119@nvidia.com>
References: <9a3ebe9b-518e-49ef-b87d-925d951a446f@kernel.org>
 <20250929120734.GG2617119@nvidia.com>
 <58aabb55-0030-49df-81ed-d4a68174b57e@kernel.org>
 <20250929130214.GK2617119@nvidia.com>
 <4037d353-0ec4-4f68-a09c-564b93ba313b@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4037d353-0ec4-4f68-a09c-564b93ba313b@kernel.org>
X-ClientProxiedBy: YT4PR01CA0372.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fd::21) To PH7PR12MB5757.namprd12.prod.outlook.com
 (2603:10b6:510:1d0::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5757:EE_|SA3PR12MB8437:EE_
X-MS-Office365-Filtering-Correlation-Id: daffb101-be38-4c88-e990-08ddff5f8b67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?la+onpWNsOmjyfZD+GvR/OFh08ldL3Pqun2QoKVjqAhKdpfxmTH4CcfcdoYi?=
 =?us-ascii?Q?qFk6xq8ZnGPH8Nh7Do3isu3bj2+eTI1b410B60XIye8jAN44nGZgYYCX0CJv?=
 =?us-ascii?Q?qNzQ4+GfKGhrSXa7OHvyD8ANFbj/s+BZ3+ntfHRSPV6qC3BIV11lzhC+emYw?=
 =?us-ascii?Q?eU1HHzooGuz3BOnhCykIEDclM6Jz3PGUHu0DEO0jHBxErc/+kFUkqYiA2N4Y?=
 =?us-ascii?Q?CVTHhyqXlvEV77XQ1rS8vjccVFlaDmS6zjPdrbQZnd0Px5XnpTJa8aknQAk2?=
 =?us-ascii?Q?nWusSLrNJUR97sW3sPto78B1Fvnt7/1igcUKljGztUscMmuZfJw/WLwfiNw8?=
 =?us-ascii?Q?CBUbcGEFQUSLnrrsU37kgSMm7TniX6k8As9i/H/wReEcedPrdZQIwRhJkNmg?=
 =?us-ascii?Q?sOek97LlJrQo5pJSUJP8yEPcjakM8+c4D/w7z+6qZNInEmY0cdnHIJIM3OdD?=
 =?us-ascii?Q?vvkjRCkrazDXYTetSURL/9zqGjmQ8J/hHhgNeso2yVeEpeqG8rvnX8Djo+EH?=
 =?us-ascii?Q?pcTKz53+vpBk3V9ucC1TE0eIBep19FtvNC05S//7/+4JZjVo8FkfqNHWJrCV?=
 =?us-ascii?Q?NyO3z/Yg3/mNPviL4wpfo0rD21+Sp0SYiq1eXAam7cWR5hOleT8m3mDj2Xuy?=
 =?us-ascii?Q?q0vDKKm0Xvg56j4NGSNFHqTRo7b8WHbWU9mMdMBWet8DN5/Cy6IUdUONX3+4?=
 =?us-ascii?Q?tm6dbURyrVwpOfNE3H8HcUhsNzULTGeRSpl8i0Np/EbGDhY9xsGys82+Te7a?=
 =?us-ascii?Q?79a55NUSn74xb0x3Mgy1jkW6ii9wDHbmIml09HsR/Uv036VGIKMouUTyccJ3?=
 =?us-ascii?Q?EdzGLS58R8IV70R7i1pzXkLaV+E+DkvPom4ogbTJYoYi1qQQ0COEWuBMYWb6?=
 =?us-ascii?Q?8CeZ5H1cVX5JvJWHZ32KoHidC1QJxRD9QdIDgqLR/E/uF5ZNoR8E0uibmsnL?=
 =?us-ascii?Q?NWYoIGGWljysxju9aoOu3GuAOBWFO5O5XcsjjlRQCLeP4sYstH384qTmPivE?=
 =?us-ascii?Q?BvkDGpBLyfphAV28+CU3u75QaHq6OXa3qs+m6X5n7hACFz808RdvmuqlTk5M?=
 =?us-ascii?Q?QpWQLOcxNkiU6HKWD8R4ckgY9+xkyirC17iLVtAlh6ClM0afBotdmYrMOCVL?=
 =?us-ascii?Q?jAmn0tfrNM+/QiuCeXik3CioD5SAC0Y5f3XrqeV0A4q9tOcLMndFvvgAWFxh?=
 =?us-ascii?Q?N7fb+a/lGe6Mhh3j36p4/vfW/CwDceqPkJ7jUWk382Vx8thIhQNgdvtsoOY8?=
 =?us-ascii?Q?WhzojkViaMsDQfZoN6OLrnvtgxZZgpOq6uMVhd8CxSQx6QaktgYzBGt6Ai8T?=
 =?us-ascii?Q?k9/hdbKlUZeHkvIpiDdYLGkYXf5nSgC8G2HfciYSVRXgFx6+P+FFvdW+jxmA?=
 =?us-ascii?Q?5xttkJkvM5FObAPRMhIlUF6Ei7s8gWHRckPipTk4LmP18PDU31xJOXtQQs5M?=
 =?us-ascii?Q?//b+6t31rhB/XC6ULZPdHO5RposEToeF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5757.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cC91n5hHXZx5H6w6Z1CtBMzqxjIISyh1z1nrD6wWYYQ7+6/HVpvVB1ZYojPQ?=
 =?us-ascii?Q?UfOzTOd7GxgqC2m36KTEooB98zCsnhptdRIE6t5t94TFDtaA8aVVR1oP4uoO?=
 =?us-ascii?Q?SU3ASHfFNY34tvHu7moA/PxIprNAyTUMiQS2kH5M04rtJ7FkYkXYQWZEQ9Q/?=
 =?us-ascii?Q?DoMDSUwDMB1CIxENk+gXvenJNZViQ/MxMlgsWto08r5Zx9C2BiFmwjrxTTTa?=
 =?us-ascii?Q?v64RHizDN3AsbDevSkJiVAF674WJjW1kpbcS2eGdVzH3ZYA3VglVofhV/0vF?=
 =?us-ascii?Q?vMiAHRDoTcbuHGO90SkeaWEkP5WVlNgLyPnSD1xEx9hG/zVt1ymPlh1K6tCN?=
 =?us-ascii?Q?ADCQ/6c5Ih7yceoWMGZLhAm7uPut7Rr//ewUE2QAmOPt4Jg35RMMXRTFxa7j?=
 =?us-ascii?Q?IUMvHFtvXVqrImwR4QnzmapvBJ+AnWFnMOOTBS9nfhTDWYs4hziwD5VezQuP?=
 =?us-ascii?Q?MvG/dDolSCeC/jEWLAsJCLvnYUxMd38wPgf4bDJy5xRHT8C9/HtwRgpD2qev?=
 =?us-ascii?Q?EazqRC2WtFcZnzn6D2zaa+abgr7P30v+vKn6Ca5QjitDqOvfujSue3P8t8qH?=
 =?us-ascii?Q?w6vS/o7+L7cNEBx5IouR1U+oCxLsFwOVB+bnEAono5+KfvQmSz378JJDybOU?=
 =?us-ascii?Q?QxKeOkRAT1ag/4LtZxlfOPooJus6d1lc9oISL3zmO8MtV8DIUzyi5mxtdbKc?=
 =?us-ascii?Q?kIAx0uvOaoFOJBEmoBZOrq9qy6He9fYpQOrHcpc7qaz5WytsIQWRtAvkY+fj?=
 =?us-ascii?Q?tfjhZuGogcl0AFD0WaZ0ifn4oBP2mpxI4dJnVg9EJlH7VPooQuV//HvHKOW5?=
 =?us-ascii?Q?dZNwF47aLy0eS0wHqeB8dBwulzYPX9Je2fiPAGY0D+xo6v4BKfP+njKJkqOa?=
 =?us-ascii?Q?+zMzKRBeg7p41LjdVsWLrIyxL1vZ+IUlOQvTj7CAvsQ9ydp4Sl2897BmUiHG?=
 =?us-ascii?Q?LyakvY5LOtwcK3kg7B3RTwscG6XVdaJkNy97MshlmoeWsRWzbrVBVqEFFLq6?=
 =?us-ascii?Q?Qqib51LvjAOC/nUWFGvY598Zt8WEQiiZVt9AuvutcEtltWapeH+G0ndv9+AC?=
 =?us-ascii?Q?56TqshfobwRRw9MeX0n7yRz0pPBgj74r8/4zoybeIQR6FBkYFbdwQN1yw6Nd?=
 =?us-ascii?Q?MwXeCUsdJ2LwE0jDQtd6n9g8k4nkzH/y6E48W79Sos9O/L3xjFJc1dj6AFi8?=
 =?us-ascii?Q?z0X4hxBNOb0/Ani+hXiw/zX2Hb0/3wBZYJgI3S4LGKMROOirUOPxhS2xqv4C?=
 =?us-ascii?Q?eUqi55JHWQR6r5mCfJwTD63/0oH4nEh644VAzCBEcdRJR6DxPqx3izboj1Wk?=
 =?us-ascii?Q?sIYHBZOWmwy0wxwXVivA3phtji8GD7rGrtG8A17UZBEOlM3mykVqNU5LOKZX?=
 =?us-ascii?Q?fciQHgucj3Qfxp32Pr1h7Bq6Rd1jPtGlliyS0V+6FuHX//Q+b7JF8V9Citj+?=
 =?us-ascii?Q?gRiSM38qD6DS5/B9gv827jeA8WjAlVXyzjei6Qp4bCg+AuHeXt0GInaf5d8U?=
 =?us-ascii?Q?2LOQT87e5/yIo/VWsEvusXH7V7yas+BPCnOym5A/dNP09Qzqek8kWFxmtxdp?=
 =?us-ascii?Q?g1Ul+6/a25j7aHQ6/Ng=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: daffb101-be38-4c88-e990-08ddff5f8b67
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5757.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 13:53:18.5281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HsYq6ozwa6ty4ZoSMGbla0di0EdIf2n4boMgA6+CZ6+RmuqGRWtERyY6WCNCmaVu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8437

On Mon, Sep 29, 2025 at 03:30:22PM +0200, Hans Verkuil wrote:
> On 29/09/2025 15:02, Jason Gunthorpe wrote:
> > On Mon, Sep 29, 2025 at 02:18:50PM +0200, Hans Verkuil wrote:
> >> On 29/09/2025 14:07, Jason Gunthorpe wrote:
> >>> On Mon, Sep 29, 2025 at 10:23:47AM +0200, Hans Verkuil wrote:
> >>>
> >>>> Since I am unfamiliar with the iommu core code, I am uncertain whether I am
> >>>> just papering over a bug elsewhere, or whether this is really the correct solution.
> >>>
> >>> It is papering over something, group->domain is not supposed to be
> >>> NULL at this point.. That probably means the iommu driver has not been
> >>
> >> It's group->blocking_domain that's NULL, not group->domain.
> > 
> > Er, I thought you were hitting a false positive on this:
> > 
> >   group->domain != group->blocking_domain
> > 
> > ie NULL != NULL
> > 
> > But I suppose the whole expression is checking for group->domain
> > already.
> > 
> > All your patch does is entirely disable the safetly logic :\
> > 
> > What is isp_attach_iommu() trying to accomplish? It does
> > arm_iommu_detach_device() and then arm_iommu_attach_device() ?
> > 
> > Why?
> > 
> > Is this trying to force a non-identity translation for ISP?
> 
> I have absolutely no idea. The commit where this was added is this:

Maybe try deleting everything in the CONFIG_ARM_DMA_USE_IOMMU branches
and just succeed in isp_attach_iommu() ?

It is almost the same code flow as in arm_setup_iommu_dma_ops(),
except it ignores the DT.

arm_setup_iommu_dma_ops() should be called by ISP via arch_setup_dma_ops():

	if (device_iommu_mapped(dev))
		arm_setup_iommu_dma_ops(dev);

?

I'm thinking this is all dead code now. The original version was
creating iommu_groups, so most likely 11 years ago
device_iommu_mapped() == false during driver probe and it had to open
code the whole sequence.

But today the groups are clearly there.. So the iommu should be
setup..

The main direct difference was IPS hard wiring the 1G:

	mapping = arm_iommu_create_mapping(isp->dev, SZ_1G, SZ_2G);

In the generic code this should come from the DT:

	if (dev->dma_range_map) {
		dma_base = dma_range_map_min(dev->dma_range_map);
		size = dma_range_map_max(dev->dma_range_map) - dma_base;
	}
	mapping = arm_iommu_create_mapping(dev, dma_base, size);

So potentially a DT change is also needed?

Can you check around these sequences to see what is happening?

Jason

