Return-Path: <linux-media+bounces-43147-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BCDB9F026
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 13:53:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B43917FC1A
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 11:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D71C2FC86A;
	Thu, 25 Sep 2025 11:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PzxRpVFS"
X-Original-To: linux-media@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012027.outbound.protection.outlook.com [52.101.43.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105972C17A0;
	Thu, 25 Sep 2025 11:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758801194; cv=fail; b=LtIKlIzx1Tq4+oUJqwT2nNLRQN5Q4xP7pw/oeJOiiVYV6T7nubCZBBdm5aX6FcO5LFsv4cl35Re2bS5h4gKj5EpV5HtXqU5yD8jQ6MDYbkKnXCT727fKOYYxJLsGRP7ah+LrZjHZ8UstLgGBQ/9gvyFAETbjAYGlQgKv0gnJVJQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758801194; c=relaxed/simple;
	bh=wsq82cMVuJXiDrRRHDP0XjgkAanoDtubM1o0yrEcyJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=npcUUySPREByAz13MgLe7IagfogyY6ykgYfgCx2GVbHR9Dx6RKoVEfoiMyxtggnvexu0Ph7zrDTbtS/A9UJkBgMHoOQPcBqvmxteqFdyKxqdffG/6eMk191ASz79CVac7bkEYRAmuJMzvG9R6zW4dQUTcKyBv48lz+ebgG1OWhI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PzxRpVFS; arc=fail smtp.client-ip=52.101.43.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=egii8MpGSPZHZ9cxM1fHyHN8mn6+quqIquH/K6lrg1zEfUldNoHyzOVPPn07vwC+0xTiLsmKiFE1pXc+UhU+oBywOpzOam0pSuxbtsEw6mXRsYqrAevwMhsTx/5rmajd4LVx8CL1b1a+rFLpW8SJmam2/19uw6/D1i/JEUYGLjZaKykZKkR4J+B5lkbLwiR0kzeLXxNNSVdHhYhXW5bOadqIMWJYTTE10oRlAdvKTr8lmo/h5hQZJN2qptMHb2gAEO5JCQNsyTiuNygTzsm6+6z3YRgz8zHUCA1ENBREmQ3Co+jSz6e0tad686iC7uoI0TnXxSo3sbdSIC0jI9J2TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QODKn9Ui+ltheYIHWDWac1wskQ/Yw/qpqIVGllIqi/E=;
 b=NIkJwtaBSHVtD8OpT4qQBkB4H1k9vDt/FDzngMkisylgJdrleMZQgfE/EnYfqYGICsIoLyfX5v/r9wAqOSbIY6qrjnEeKYtfUqhSiMbXwmBYxQvL3z83StwFfgznOaD4pyQk7242J36sFlysyYaB5MNWsJFCWm1+Jc77QmDlRF4WMrqPx2pThTu198KdloZM4n93XME606dYn3SXslxAak2mQasU4bpuDDxvvwQQqGkSihHmVWRcZKijEIy1vH23YZcjRm9UT5gt6FNmHpz7XepxTH5tNXw1JFXzxK8b31ILnfSQSwiezckRuaaDGXse3I6at2HUOu8gDfgsuaCl8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QODKn9Ui+ltheYIHWDWac1wskQ/Yw/qpqIVGllIqi/E=;
 b=PzxRpVFSn7daxkuBM45CbgmQ92VUwdudqOgCJfhdL4cwcrtiNhkYBzov6W93P7ePZAUMvsOM4Aw36eJjC+H3yeo8rZvSf4PglU0VJykjGptDcFhFqdoMjD4wsZPdToRudSf0i/s2jkTdoBvZvex/nyjNGe17v8CMM3wvXaSYz2180BuV21HdO2MbZHbsvHMRGRvjSnqcDA46gsgiG9kZ73Np+6W1+GTrWh5Ig3rulP2urqjynRJSPa0wLZCODG/083AuExm57bE3GpJuJIOesRherKapoCdOBArcYm4gf24lqKIrt+fok1eyX/GfMLZP0t9szWWbtR34KAj7gtdu8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5757.namprd12.prod.outlook.com (2603:10b6:510:1d0::13)
 by SA1PR12MB6751.namprd12.prod.outlook.com (2603:10b6:806:258::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Thu, 25 Sep
 2025 11:53:09 +0000
Received: from PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632]) by PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632%2]) with mapi id 15.20.9137.021; Thu, 25 Sep 2025
 11:53:09 +0000
Date: Thu, 25 Sep 2025 08:53:08 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: Alex Williamson <alex.williamson@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	dri-devel@lists.freedesktop.org, iommu@lists.linux.dev,
	Jens Axboe <axboe@kernel.dk>, Joerg Roedel <joro@8bytes.org>,
	kvm@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-mm@kvack.org,
	linux-pci@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v2 03/10] PCI/P2PDMA: Refactor to separate core P2P
 functionality from memory allocation
Message-ID: <20250925115308.GT2617119@nvidia.com>
References: <cover.1757589589.git.leon@kernel.org>
 <1e2cb89ea76a92949d06a804e3ab97478e7cacbb.1757589589.git.leon@kernel.org>
 <20250922150032.3e3da410.alex.williamson@redhat.com>
 <20250923150414.GA2608121@nvidia.com>
 <20250923113041.38bee711.alex.williamson@redhat.com>
 <20250923174333.GE2608121@nvidia.com>
 <20250923120932.47df57b2.alex.williamson@redhat.com>
 <20250925070314.GA12165@unreal>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925070314.GA12165@unreal>
X-ClientProxiedBy: SA1P222CA0161.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c3::9) To PH7PR12MB5757.namprd12.prod.outlook.com
 (2603:10b6:510:1d0::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5757:EE_|SA1PR12MB6751:EE_
X-MS-Office365-Filtering-Correlation-Id: ce458c94-657e-4a56-d013-08ddfc2a190f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pSgVEb8b6KvWO/8Kh+G0nNdWEIpSJtu2flhAl93INC79YkRIQ/i6SqWK/KDB?=
 =?us-ascii?Q?ib/RhJ0vjlXF66NRxN/kD09tPom/MRumuHrsD9r7kNqKgxW787OD4QS+oJpa?=
 =?us-ascii?Q?gwOKITSQaL2rccHRQwilNUmuJKXTA6Paf57x4Ccyz74DLdky1qNa/NnUA4+r?=
 =?us-ascii?Q?+12DzVfURLWkRqhNpffLGMnlJxVMaN30fJ4JJWgSoMsBifVpAkLjy2o09/rO?=
 =?us-ascii?Q?ZWi1n6OLhynK9X7VqxTR36PSD/u37oVn7/h9ZYf5dCzZgSdUKN3W6amsVZ04?=
 =?us-ascii?Q?gYG6Su0O4BkBZ8vV5GxtdDFpI3gqtFNbdHS2KwCjo+MjqvbZZ4q+KgqiihTR?=
 =?us-ascii?Q?5uzMZ2yyP8JfoG6mLuMOWOJmTiQboRXqduO3LzeTCsB7ghbbn8BxQEqYjwXe?=
 =?us-ascii?Q?JEEuyCQ6wa521ykEFeraq+lU72FYymt8ZVO9vKK9Ck7UPl6mf8EewqfyxRr7?=
 =?us-ascii?Q?QAIqryontd5LRyRbCE2Cca5pg0pMVJuvejRWsEg0lB5lXWLWERdYJefq/5qh?=
 =?us-ascii?Q?6yX1xfuKr9VphRe29XRZn9UEvitvK5gxkum4r38y+AMJZIDKMWC1/QC/o+lO?=
 =?us-ascii?Q?C0u8m1p5x6Z0QirgQhKUAgV7Ys5uoADlLTR7RUJpFbifNCwSnupjAPq2Zy2Y?=
 =?us-ascii?Q?Ez/6C4RJTnsRp4iHwGnAjZd1lTnYQZ/PBAXGz8p1DTOln3XzCX5rD47Z2xpX?=
 =?us-ascii?Q?qJCZ6FCU0RjbNI7St1wbPHcnJDr6Y8kYbLNZBS8+fldOIW2InDr+RW2yywdc?=
 =?us-ascii?Q?2EzXJAvusKWrgPCq7nnroktNG3XrdLbPjLuYQAB/E35v7U+Y3poG+fdjTtT6?=
 =?us-ascii?Q?De3wtSrgDAyzQhwnx9V1GyW+2LCPlS40Jf+axTrDOB1J7Fomihnk9D1+4Wql?=
 =?us-ascii?Q?Cg/huC0VSSnDdsw37gAoDIRTgN2Z701kWp9tejz236AoPQGlg1hNgcVJLw4p?=
 =?us-ascii?Q?/pcooPB3PQFj/Dpfuozk81LHJoROyi9/TlpbWhbSQADuwjbrEjTTOMtI9mRS?=
 =?us-ascii?Q?FvwmkuNCZNip6azzIQO4+hP6s/h7+vroRNnNjU0T1aYAQj8B0Udu2b+0C7Zv?=
 =?us-ascii?Q?RXBJxzQSojLypCoeVwHd3BBzEbSya1dtnrUheBNsyMekomGXeG3I+XRlRncd?=
 =?us-ascii?Q?66gKaflBsAq4Mca5jZbw0JTm5kZcAkijmfVxwuVYtVL8XgQUjhDYRGpeTEi/?=
 =?us-ascii?Q?YWTrojBCYlXUM/bVyjH0jQDpYQgs1crc1rBkGq3WicLAku4IgwwnYaIpK7Lq?=
 =?us-ascii?Q?X8kuXRNefkBmxhmobsvVFDnlnKK+o3i5E8RmQAO6XFW+C29kSR/CsaNHizWz?=
 =?us-ascii?Q?lcGnlFG3IXzQDQLiFr/1mtL982BdPFpd6J8j0eNIaIrUnZwl98VHHqNTjVns?=
 =?us-ascii?Q?QePNazHNEE9dATL4xTCGPWTpA7AcbhQ1LKNl+E6IlQx8WYgKk0zWpDG46WTC?=
 =?us-ascii?Q?3LCFmbV5oKI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5757.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?i8fxwWWeHXe45Gc/7Fui0+yPn3NmkmmYud+HtG1HqNOg7cBRcTQPB5CDcsl6?=
 =?us-ascii?Q?hDheSTsI3UV81vhhzN4XuTl2RW0xLrFimwgRlEUMf1FIAcTAa/bVRugNVHAA?=
 =?us-ascii?Q?i5T4MmJqHv7vSkUEnuzwE0MQRFPYRx5d71RP6l581FObqH/tiTrXChsq3MPU?=
 =?us-ascii?Q?4kgkLoWSq7D04M9zs6BYNhyieGQV6jsjZDTcd0BGw7FEHYTS03rhIl40SXSO?=
 =?us-ascii?Q?NQ+oRru1PzwExWsRwEhOeDCjD2dI842os448QINVGNEyMw9GwtRNO9mqibWv?=
 =?us-ascii?Q?Xgpe7g4rYPG3v80LfenictE/PY/dHUzzZK+NRCTWCJsOfIaK0tYlbXssgASb?=
 =?us-ascii?Q?4om9WKg2IJufl6a4GCiW4A9JcDRIUH85rHeW4TT4BaGzxNJi5oD4AUcmVjyW?=
 =?us-ascii?Q?rZjh1rhIXrRj8dIpnYNl+CYX/cUJ9eEBCQ4h6yp7cq940YQlxNiz73CPppCw?=
 =?us-ascii?Q?Cuuyx/LAWgbeahsoiXDuKR7dHmIExLUgJAE394dip/33H2g91XiwQRrHDbpl?=
 =?us-ascii?Q?mU4RCsFQDLLtSD2DRXvmODX1GxeU3PKyr0BZ6bQ/wfQQBr9KvWdh1nKII4WL?=
 =?us-ascii?Q?OCtXZc8C/sBwsjVn6TBBJf22mEni2mYmNaXvuf2ljorQdfJ7kaaOKlG7HdIX?=
 =?us-ascii?Q?tKoDj3p3cZyoQ4gfq4y5/aHedx0VjNqo0bE1rDyvSyhLG4j+wEMA1JlIHXje?=
 =?us-ascii?Q?UtkHLhtJYy2NYVQeAX6z7JYMLPc1lHEppD3oGF2zTdizTXxFVuiXps9bcO+P?=
 =?us-ascii?Q?6+aEoBgzXranD9eEaigPcv7/WWO4C0ZEBl7Y8kQ1fWwRIf92NVDlm/zpNlmd?=
 =?us-ascii?Q?TiGpiHq3jHoKCtbv4ia30l5HXLWOX5YSKDa1y2jmu0k92ziqpm9y8krjttaB?=
 =?us-ascii?Q?rqyyAFl+WyvzzyGgjsknz2o1s2xb5RR185Nnl0BEE+lmpl7eHUV1BSjtJQXa?=
 =?us-ascii?Q?Pz+jdbVQqqsVqTCcvCFhez95vuO4DrsuDoz+sSl8zLZx73IXHQkidThsCV9A?=
 =?us-ascii?Q?i2BYMocAHhicNGBaiSs6HRcJEHnEHgDs8EaAnC3DfQR20owcjnroXCSOv6MU?=
 =?us-ascii?Q?+rrKet4IuE51qqoCz8Zv6EHcHDC3+lf9PAF6MCZBah71R6LXPiK3eEb8thi5?=
 =?us-ascii?Q?wMlRc8xnXRqXTNA+0OPOypJVTLIX5nLaWmKMDfBGtb7aPWggAzTC4Dmn+eq8?=
 =?us-ascii?Q?p/M7YoEJa+W5jkos9zk+NHZpXyDS3AgRPcy6jXfFL9EEsBt9fozQMPgpIcLV?=
 =?us-ascii?Q?/Ez5sw4+UP8qaqiKR6gXCdbkdehzo9Vet4/fDV8+eVZ1834at8fI8PklZdKn?=
 =?us-ascii?Q?FZEop8bCGnFgzvqqUkPURbVH1P7GgzXyVeG8m3BzfgqwnIdNDMznXo5shkQj?=
 =?us-ascii?Q?n1VnRJveSLRvk8NEdzuyLpL4ILaYx0OJfbZqmh0n+E1VuyuoKXLADGn/gl2x?=
 =?us-ascii?Q?BGf+XDgCb5Ql6xpwhNfR/7fkSOlWMfO0LV8Eky79PUrp9i3e2pU757dEa38z?=
 =?us-ascii?Q?q5SbydndtEl34lLotlCk9XD2cbEoVAwrYL50SLYkg2yOysizsYmCGwyav42o?=
 =?us-ascii?Q?7Kslylb7VQHs0+JShODSXrm/jLy7bTi9c2sHumZY?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce458c94-657e-4a56-d013-08ddfc2a190f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5757.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 11:53:09.7267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B5PwFHHVts9+Re3FZIF4gKRGUJRrPXeRuyK/vEUDVZM1wu6ok/ncCDG2to02T0oK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6751

On Thu, Sep 25, 2025 at 10:03:14AM +0300, Leon Romanovsky wrote:

> > It would at least make sense to me then to store the provider on the
> > vfio_pci_dma_buf object at the time of the get feature call rather than
> > vfio_pci_core_init_dev() though.  That would eliminate patch 08/ and
> > the inline #ifdefs.
> 
> I'll change it now. If "enable" function goes to be "get" function, we
> won't need to store anything in vfio_pci_dma_buf too. At the end, we
> have exactly two lines "provider = priv->vdev->provider[priv->bar];",
> which can easily be changed to be "provider = pcim_p2pdma_provider(priv->vdev->pdev, priv->bar)"

Not without some kind of locking change. I'd keep the
priv->vdev->provider[priv->bar] because setup during probe doesn't
need special locking.

Jason

