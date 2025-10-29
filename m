Return-Path: <linux-media+bounces-45938-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AADEFC1A1EC
	for <lists+linux-media@lfdr.de>; Wed, 29 Oct 2025 12:53:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7518E18848BC
	for <lists+linux-media@lfdr.de>; Wed, 29 Oct 2025 11:53:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90479337BBA;
	Wed, 29 Oct 2025 11:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RE4gUMkH"
X-Original-To: linux-media@vger.kernel.org
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011035.outbound.protection.outlook.com [52.101.62.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF073346AE
	for <linux-media@vger.kernel.org>; Wed, 29 Oct 2025 11:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761738790; cv=fail; b=EZOd1Kwu7m0S2B3+TSD9URlC+jGCIdw99Cmvui1w/czMe2+ju3Kyh3bFec1PCv+q7AcOOZ1c/K5cm343DpA+/skQDpfiJ2XfbCs4h/ze26uG0ChSgAaHQmCtDdk6zYJUMFLtHBgpoyej3O9MWRm80JI6HPeXM/F9SbZGEAHg6jA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761738790; c=relaxed/simple;
	bh=pa5fTz6LC0iB7TEd+i7UbfVIkP8pNhCJopRjXFzB8CA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MDPDLl523yrOW/w3LOskd1I/6PW6kDpvG2+PAC9gOSo3ABHUcd+6pTIaEq/HTXNRsDQ4VGBXzlqfEc3hB4T3VwrqOeE8dGJ2CAQ0lxuANj8HuYuc+BuxmXyyeyuJ3wqjMC2+cl4krtzSoNEtvekML7Cp+v41wb5YOQPoCXtRYsI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RE4gUMkH; arc=fail smtp.client-ip=52.101.62.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ryec+w0YBM+CNjjrCjLo0eFRU/gTKyJciOIDN73qNT1Y20SVGndYdznfREr4yPGaa+da/fFe5X54vgpNV2rR80ea6mmvqVJHLM97af5FM9moiLgX52bPWyR6LxgnNMjblFOxLFYFbFoof/Hjux5OUA2PH2FK+Ib5l5M6vhYPlPW0rc4AOjfhoQ0pEnIdwxinWDD86BPO3j15n0/BK3OfobmkN9jTDyEWw4RdS8dIruAMC4fRq0UWF55P1axSxS1j7desB6IUhMLuHWhXH4Sl+w0MUDhAZS9eoxqt3YL9dLruYVVNlLGvb3uGwoaGdNDwsIK1S+6lkHVzSLzQ2e7utg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Ht64YA+kP9B07NqLusfhjTFwHM5MfRVTh3+IFr9FPo=;
 b=VNyiR8zEmhSF4VwfOoCZFqkpqJZQDpijLqKeaV+g/Wr4bT1OHv8x99hq/KENy8uU8gOBMPX3zzB39bwNsJQvbJTzG8j9Geoxhw065k3Gu2VWUY6Zp3xh6GZfcMUECQCzFjiKPMbdgkzlA34XBMeDsq+rlp57ffTgHeUuEzq4hJIaY30nrSpOkfZugEyDhzRdeUrceSzzZF69AQutT36HJMJC6tSO4BIURv/L4/sS9vPEEgb3QVSY5Ftgwvdlg6aDYRNfWSOGLNnlGfY4G3FnAMopAMznP17hNLmYkSIrkD/yOHmUS86benVylqw5EVn3/VB0C62WqVi4ONpStTYCKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Ht64YA+kP9B07NqLusfhjTFwHM5MfRVTh3+IFr9FPo=;
 b=RE4gUMkHaNw5/9FeojI7bu6dHb0sna+7eEzFNG3U7WCGISrCrmxT2tfyo0BmijoBfHc+yQ6vZ6CRmMtykWtVPwpSsn22vZNHc7qJwdZN0kC6odQg9il9NNVHtDxXUo4FvSNxMCP0lLn/x0UG5NxwMapt7u5siBtrRO8WFUMw1n0JUOeNYzE38c80FYBzoUzn/3HpnzpB7BnzTLdh0Jz6jxHpldA4FNg6EIyNxWNerWKftYdkUmWCULGb7VqcqIG9M7Jv/w4rrr2O7xv5OMgOaMfEhr8sZdi/NzwqMqhNQAaQ33DTu/tLAqsQaJDG1xZYovIqJxrxhS5fjwRVtnh9LQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by SJ2PR12MB7992.namprd12.prod.outlook.com (2603:10b6:a03:4c3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Wed, 29 Oct
 2025 11:53:04 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9275.011; Wed, 29 Oct 2025
 11:53:04 +0000
Date: Wed, 29 Oct 2025 08:53:02 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
	dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	Christian Koenig <christian.koenig@amd.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Matthew Brost <matthew.brost@intel.com>,
	Dongwon Kim <dongwon.kim@intel.com>
Subject: Re: [RFC v2 0/8] dma-buf: Add support for mapping dmabufs via
 interconnects
Message-ID: <20251029115302.GM1018328@nvidia.com>
References: <20251027044712.1676175-1-vivek.kasireddy@intel.com>
 <20251029002726.GA1092494@nvidia.com>
 <20251029092534.GA11622@unreal>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029092534.GA11622@unreal>
X-ClientProxiedBy: BL0PR02CA0007.namprd02.prod.outlook.com
 (2603:10b6:207:3c::20) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|SJ2PR12MB7992:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cb52102-7407-4ada-c7b7-08de16e1b738
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uKOOBjlPHrPehgpg4Uv+q0m6CL2/Ehz4vciBg7bEq7fVTdWKUHM3ZMQbuhuo?=
 =?us-ascii?Q?en95bk1nEJwfFFlzDw9uFpFH0R+w1AOtQ3ymuc/ktTXc9p4CAQvihcJtzrnX?=
 =?us-ascii?Q?EQCwGB7+5TD/9QafsOgsLVN5bgmATJA5pBdAL9/UV+p6a84sgAbzY9kLDTsx?=
 =?us-ascii?Q?Va8zetSgOP5WbJsMEpYGJZdSNfdqRFvDoa5z8RQGEm/66mPdHYbwbamf/bbS?=
 =?us-ascii?Q?8zwDHNJedIjkyR5bIksN5D+gKaPaJIm37LLZHrIW3pRorYBvOoe/FquTeEOD?=
 =?us-ascii?Q?HxB4FYB/NNpN82L2Yf7daWuqJYqZDz2dtbDpCjWOOXyD6mn5fxFA3jh/AnLv?=
 =?us-ascii?Q?uSDi4LT2iy3ggoS2X09aV9eU1G+TmQuU3lixqgHyO5UbJGAo1Ao6JlLxy+2m?=
 =?us-ascii?Q?0IWn92Qykpw0yl+UZ1xPgq0TLS3O1TC/NpxDJM3tNa4Xk7TUTYjDQxXXslI+?=
 =?us-ascii?Q?jNZ5ttbcKA0Pxt/ouXKudo/Wzo6hEOVNDDk8O1w3sOQ9rhRV9E2xOZICRaM3?=
 =?us-ascii?Q?9jvWjExu8QZicQ8fJpjSTuhn8s8zCZEqmjNfbLRbHWjgV0WiOBKYBao8l3iE?=
 =?us-ascii?Q?MIeiFZjuNoesz9DM/+XYJB2G6W5huabnuezRn6cf/1BazjjWGpb9m70k6gmq?=
 =?us-ascii?Q?fPnGFr7F98PM+YLrRkrfdoHcfg6mSXEMan+hrrLVFp5XMo7yV9abweR0ZOXe?=
 =?us-ascii?Q?dxFZst5bqAmGaj8hjrgQ9wJH5pcr3PcBgupx6YCbyzfDjQ4o4gHBNVPa+hD7?=
 =?us-ascii?Q?ejDw2psbr/oTWaepRMEoOT4EA/+AXiqbNKPgqg4RrtHwvO51V7zuTZ+FnZRS?=
 =?us-ascii?Q?/URVmwOiPJb8jog0seTty/yVizM30qK0XHUyB9CL2CDajZnS6Dz2+y8RQW1M?=
 =?us-ascii?Q?uiZhg/2DFsNPmtGmLEGBQNakdV9IZ4z0gT/caryEbD8twfIeom6D0LykBlMF?=
 =?us-ascii?Q?XChFuP2VjFITzhvAWmqHGMXbGW9IiF5t5Tk84F2BU3bTzoMRlTRTadLA7Uh3?=
 =?us-ascii?Q?DAqdPyUufUh7wdDq3qLHJyNk6h9BbooL46Q4Nl7my2MLaoYx6j4TSHIEltIt?=
 =?us-ascii?Q?ObuNoslJWl/ulUmb3h6/atFtwmv06AnxAZp0q0Nx0CbVN9icyocAjGJgzs/0?=
 =?us-ascii?Q?ZJyCoJkpiFydgCY5eCLA5RdhzeeHLpUCJoh4XpZAHx/nkafhFo3sfQOXNrud?=
 =?us-ascii?Q?yTMaFj0ICcgAmsUlRwhEcjE7Ycz7BTjozspPVPIYqFmkfEUSqznQnG0JYqZd?=
 =?us-ascii?Q?nX/F4KR7nUy+dVLZVvE9f8Z9+Sl1k+j0h7Y8I0trcN6d9fHDEv9LZUQsCjhe?=
 =?us-ascii?Q?H1Q+y6HsgKcr3ebcE1cYQifiynhW2leC7kdo6CgjqpvS6OUgYrMglf9SOTg2?=
 =?us-ascii?Q?xdL3yYzb+momY/LiVl8FnECSiatoXhcab0HUnKREApQdN030/IBYyVdg9GP8?=
 =?us-ascii?Q?vvfCOYZaL2rxHrPwaJpwvhrCh3QgBece4IYPFCTGXzyEOV4zOqu/9A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3613.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vQCk8Wo27DLkt+q/gATb/xQcsgE3uBEAdVU2SypzwMuu0LOeNi/N8GImojzx?=
 =?us-ascii?Q?qXKI0S/iMbfxOsW+q+pY2mbb7erv6/iD6dIWF6evGVsxFRNIQPO+ZecHOGFV?=
 =?us-ascii?Q?oQa6qgbm17fjhiLujaNzi76RMXWCnl8b8FVpya3t+Ox5kiIjFGH4R5vD38Gi?=
 =?us-ascii?Q?c2Bn2RrWYWpustqZ43209FRZkOXq1q8Yzxx/bLY5emY89zJT8KXF0p51p7zF?=
 =?us-ascii?Q?okPiDUGAyPL33Wt82TeFoXnFsDXx+pVHs+V1uJoXwNfGY0r6z6DB3XyKSPJz?=
 =?us-ascii?Q?IJjv0JBP2D52g08zNO4lY0SUqH1rkMH+Pow5xkbEADNF9OYC8XHlB5cHogos?=
 =?us-ascii?Q?RsOqoIlyMJ0cII37e+PcWwqgHf9lpIuUWXrVr3J+cGrq16cVR2AfyzSV6Epi?=
 =?us-ascii?Q?loCRZjIgvmfK8YgtoZp+4bH0hN5aJl6Oyt9Jr/tFdvcaSioHXkkRL1KSnrOH?=
 =?us-ascii?Q?agRcEmv/w8hkh/0DDUbP7FoIR+C34TAAj68i94dcdtdxEk8HHXjA6NlVvHi6?=
 =?us-ascii?Q?c3y7bdAG5eeTq0+ZGVecf3MY/qSVVqafxy3ZErMPv29b9nFyyJUnepNdS1el?=
 =?us-ascii?Q?RUZGrEGn9scq8PzYiLNWsHeJ1ppYzZ9DYj83sBo9ge32SaBRCK/htjorfJvn?=
 =?us-ascii?Q?FTgodXRNKNMFJzHiJwAlsAnLEaZFR91tn4AHZrtRQo03RlOaiVQRSe0kY3n+?=
 =?us-ascii?Q?5bFbiZjHMFRLpEDx/COpUOAX9r3koVH0bgGgyiOoYAzCSOPJmBcCaoaSZD2d?=
 =?us-ascii?Q?X3yNs6HsOdNXKumivrPUdJ0upMeOjLWshmizgBsJyabdPUrxUxd86ToINL+r?=
 =?us-ascii?Q?FnsjzOs8Ukj8aBotTBXvOoNapNtVbvvUmOwByaty2U/RPYLWB11noKGQ55wy?=
 =?us-ascii?Q?W/Z4PUe8kOQDM1Du/SGBunlpAWxTAH6Y9wCjxRc5/92tFxJL3tGIb5X/NphQ?=
 =?us-ascii?Q?I8z8qUekQ1yDwsfNCaJDNH6ogf/ETLkREvoFshcw0qKpZAC/6mmbNAeweZ6c?=
 =?us-ascii?Q?6h1Kgzoy03PfZD8FTzfHDjdvDg4kdOZ09JcG/zG5cl5f4IdHLhXMId55CymX?=
 =?us-ascii?Q?iYZ1F0t8CUhXgdNvZ+LkAxKqjdstK8YWLb2UIWwXe3J8bffBN8Qp5fJBP44y?=
 =?us-ascii?Q?FX0xjsYZz1MMW2Wy4FJZpqLdj0eD5iajNeduBSMWBYC2NZ0Xw0MvmDCEzWle?=
 =?us-ascii?Q?o3nPcThovJ1Ce5Md96cIca4YnIAeSvwqIgcgi9JEIry5P9B+UnD6KEn2HMyh?=
 =?us-ascii?Q?/LmKU+Lv/YJgFc0C4Pjc5Aee2BZ8PXGZignsfup/1vB1tv29oDZ3NziC8/7m?=
 =?us-ascii?Q?eKgnITtlVgNVo2JcDK3KXhxvJzVK0cHCIbcgdOtgTpd5X4QbnPMGTheYT7ws?=
 =?us-ascii?Q?8Ewb8A2cALXvWfEImbu5b2rL0/U+h3GrZT9P2wsFOp+Rna9dIdALluysoY6d?=
 =?us-ascii?Q?iElh9rDR6mOPS6EVT/VJbkEuTPz0mpqnIm16W5Sl3lG8AQn+AII01Vxl9IE3?=
 =?us-ascii?Q?0QEZxQfNCFFY3zbEodOAD1ry25wiFiB8h3wIV8VTItRRDHWdrTLeTlCUIW9D?=
 =?us-ascii?Q?71RyArvonoGy3/tR5e8=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cb52102-7407-4ada-c7b7-08de16e1b738
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 11:53:04.6052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3FZPPu0hMMw9WTvbwy9GK9BBmVK0Fi4fQN9f+s9hLepmM9Wf7bp1vPsFGb4OU9vq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7992

On Wed, Oct 29, 2025 at 11:25:34AM +0200, Leon Romanovsky wrote:
> On Tue, Oct 28, 2025 at 09:27:26PM -0300, Jason Gunthorpe wrote:
> > On Sun, Oct 26, 2025 at 09:44:12PM -0700, Vivek Kasireddy wrote:
> > > In a typical dma-buf use case, a dmabuf exporter makes its buffer
> > > buffer available to an importer by mapping it using DMA APIs
> > > such as dma_map_sgtable() or dma_map_resource(). However, this
> > > is not desirable in some cases where the exporter and importer
> > > are directly connected via a physical or virtual link (or
> > > interconnect) and the importer can access the buffer without
> > > having it DMA mapped.
> > 
> > I think my explanation was not so clear, I spent a few hours and typed
> > in what I was thinking about here:
> > 
> > https://github.com/jgunthorpe/linux/commits/dmabuf_map_type
> > 
> > I didn't type in the last patch for iommufd side, hopefully it is
> > clear enough. Adding iov should follow the pattern of the "physical
> > address list" patch.
> > 
> > I think the use of EXPORT_SYMBOL_FOR_MODULES() to lock down the
> > physical addres list mapping type to iommufd is clever and I'm hoping
> > addresses Chrsitian's concerns about abuse.
> > 
> > Single GPU drivers can easilly declare their own mapping type for
> > their own private interconnect without needing to change the core
> > code.
> > 
> > This seems to be fairly straightforward and reasonably type safe..
> 
> It makes me wonder what am I supposed to do with my series now [1]?
> How do you see submission plan now?
> 
> [1] https://lore.kernel.org/all/cover.1760368250.git.leon@kernel.org/

IMHO that series needs the small tweaks and should go this merge
window, ideally along with the iommufd half.

I think this thread is a topic for the next cycle, I expect it will
take some time to converge on the dmabuf core changes, and adapting
your series is quite simple.

Jason

