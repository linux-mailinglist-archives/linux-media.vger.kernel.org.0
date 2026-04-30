Return-Path: <linux-media+bounces-60103-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 118hNzqN82n/4wEAu9opvQ
	(envelope-from <linux-media+bounces-60103-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 19:11:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6BF4A63A7
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 19:11:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 98085300F4EB
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 17:11:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5A2146AEF1;
	Thu, 30 Apr 2026 17:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="X6xeGw9q"
X-Original-To: linux-media@vger.kernel.org
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012003.outbound.protection.outlook.com [52.101.48.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E417428CF6F;
	Thu, 30 Apr 2026 17:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777569076; cv=fail; b=vDh9EiOQlPq5WEzVCBhY3Hs/yLPUAcHuomhyMHnJaSTMUO7m/OBpB7gEusTSAepWfgJT7pXD20YfptsUxgzTD1ZTmuKtoDTY23zHCnqQHDSzfBhAyRLmBuQcimN2nmFGuqPGkGowFJFoyF7nC4xcmf0P+DCIongwFb8FMOv0IgU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777569076; c=relaxed/simple;
	bh=1ZuDqRweiI3+YW/Iy1/f1fqk/fpMawoL3L7hXtHmNYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lfY7W90nWeIz5BVULPYzJ+PVL70hzTYyxD+6QjYiG2rbVTo3sF1cLqyQNSTajMCBDT+OAFRdUaLTBzhAf+ga4FIcG7WiwNBBqGkg82uPhMjTbZ9AfFmmXqq45TpqRz6wMgs1gHNP4lqSzjNyyLzhZekCnLiY3ZrsqFuVX5GqUZ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=X6xeGw9q; arc=fail smtp.client-ip=52.101.48.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bv3KX57iWpZgcwxP7RXsUYjPo3mIHMBrLZadDoouUolPLS/0oHB87dXfun77F8pJdHBz1Lzv2LAmTCdGLB3HpJaiu6VCO5m4ltX6Lko3djwoDtePMRiYqfxIJyahRRnpSk2JKTB0LFGQ65ldbc3SorNGFbVI39txaqrU7Bg9Essc1zD+Ob4BAZfWFGXipnPHlhNqfWWO63sW9/C7D4p93A0LYwsTfgxMpVE6w0mWKIdT7pakN061n0nMQIoEjFonKjh9JqfY/8+6BCB5qgmiM820cte5LoX7jpfaO8FCmpu860c2807AA0+8VBQgO7siKsn72wSJREechwD8borR5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Jiqy9RNcWUpFKZQwyR5C/hJEYwNU75zrvvXm4zBhys=;
 b=OBz56GXorDORBELX9sjP1MFpaZiWrfKnoET2e80cUiVfSc+m5KqwwQyfGh4Kn1gCHXMgLvXEGROHbM3UxWv0sd4lVZy+R/AgzX19Vz4+mQObrr3wPQTO1tWcdi5uCRWYp2CXJdnqlm57Ty6lcTwHVBsKlh/43x3KKDWG78j7z5WN0ChEF9PYWYwYUczT25+oSnM7Icy6FEyqFKcq80+PhOyhnZV1nGatzgd+srkIA8XUG/IdG5lvGs4D3feiCsaTwkqRI9hXW/Os+8z8WBL+FG5N39NfOH8RpS67NsezgFN5AmiVlX00hdIrNc0QwegS9gQ3HF2mep0AYIpH6teZeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Jiqy9RNcWUpFKZQwyR5C/hJEYwNU75zrvvXm4zBhys=;
 b=X6xeGw9q4C6dyDrhV9Q66CmPkRXlMkxCssGR2bc8J/4sn07/Wzxeb+9Mk6aAuzauO5KabF5jfiNQX3Umi0wR7WeX4c205KbPodEVv5buUBFMRIhJHilEDRiE1hRULwIbPQf/46rgL02LFxhOIBKm38Bd5BIwnMBRAoqDf7mtXYnZMJkrOsvi1/N9hbT42HDoELAz5OtvEq1hGgbSZhEiLNQ4ZBbXDJfQt7kvjVORh6xmR6fBLM8MKG2lVsHQrJEBlEC8sC04kCegzH+bs+wTXigRJwhAVlMzt9gOxx3hTvKkmRkAdpok4qMtOg4LJPrxwzyfy3mmAPRp3THmHMM1tg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by SN7PR12MB7933.namprd12.prod.outlook.com (2603:10b6:806:342::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 17:11:08 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9870.013; Thu, 30 Apr 2026
 17:11:08 +0000
Date: Thu, 30 Apr 2026 14:11:06 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Matt Evans <mattev@meta.com>
Cc: Alex Williamson <alex@shazbot.org>, Leon Romanovsky <leon@kernel.org>,
	Alex Mastro <amastro@fb.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Mahmoud Adam <mngyadam@amazon.de>,
	David Matlack <dmatlack@google.com>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Ankit Agrawal <ankita@nvidia.com>,
	Pranjal Shrivastava <praan@google.com>,
	Alistair Popple <apopple@nvidia.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	kvm@vger.kernel.org
Subject: Re: [PATCH 3/9] vfio/pci: Add a helper to create a DMABUF for a
 BAR-map VMA
Message-ID: <20260430171106.GA6829@nvidia.com>
References: <20260416131815.2729131-1-mattev@meta.com>
 <20260416131815.2729131-4-mattev@meta.com>
 <20260424182426.GG3444440@nvidia.com>
 <c598a21e-ee50-42d9-98dc-2959e84ace50@meta.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c598a21e-ee50-42d9-98dc-2959e84ace50@meta.com>
X-ClientProxiedBy: BN0PR04CA0156.namprd04.prod.outlook.com
 (2603:10b6:408:eb::11) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|SN7PR12MB7933:EE_
X-MS-Office365-Filtering-Correlation-Id: d0e585d4-1f41-4ec2-0512-08dea6db785d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	kM3+gYeorXlD3gc9nlrNmMykHCJldluM3p6Y7oQMkqEzcxxUrBB0sg02KPLP4tq8LtmvZXEvqm50TUv8pENSlhfJrbk4et9mmU9TuOsNCBsTSo2nETJ7sb2YaxFNDikXD18MsMaW7JiMtfXCxpp8ISkK64bwuZuvKGrS6PnizuBpkwFBzYYc3JqiUfbtbQCyjNAwCS7XQdGDX2ZP/2/xaiG/gE8eSHiZ2eR/tTQ5gclerSvNHYPC6KCVI3Q45G74pfxAT6bvg+GcN9oqByuRJXWEJpmJrxNDjeMA+bL2B6X2hA2qWlKsPGqL8dvwH3PlQL3yLqltL3dh3Y/SfA8R4ehZgrtKVWsQIhU3fg9jv2k1ububdbvBATzXF5XZaoqBdB37elconIMlXVuiVgL+BChHU8Rs01Tjow7F3bbMreU8jrOx7ZlWNUk3mAvCNCw8NFq5Zog0btdC9jNE9UCJhT/+bMXBiRwaPYwYLyVkdemXEmPuZleUVkt6oYwJOvcoEFXPbId2VKPwbdw2KbS0J5XIEK3kBgWYwZQGZ9tu5jS0FMUCsWyUbAG0w0hHx8tiN2/rRttW0bEo9f7dUsydAHVVqSdPtGzICxLSnG8iLEgM/tj8QTT5R27lrbo7gcVq3BQuak4jgXwVHPhzvm6OU+3Rvol9Hy44Dmrc4pJ/RXvnrEXRsm5WgyblDobS3IDd
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?z0zPOkwkQfhxQpGO9xmNwGVwrFkvg3+oHJpP/mKJBVaemT3ExRA/QvBFPvn3?=
 =?us-ascii?Q?n05peVKHL+Fel3zfean52mljhHxSLqcQBFSFsqtz8heCvEAcWy4qFa6Jzw1f?=
 =?us-ascii?Q?9i+7OFiJayUkPnUWoD+SPmh8QzBBAN0c00TGSWp4Nwt1bFo4SiO7OuuKgMO6?=
 =?us-ascii?Q?XHe8tR+1YuUO9M0qvdgVjJpn4E1nLXuZNhljqW8HIgVF2GwCVrSxHbI6j2Ga?=
 =?us-ascii?Q?rlKwQWLwDkZThxjjZa/2Py91hOTBjbWXTFCoRKv2xLWsts89gVMCkfptIG1x?=
 =?us-ascii?Q?SSw1XzL0drq6rIBm4Z0a/rOZrE1l03G1LgQU+nnzhGNGB6yOowSt6fS9n3Og?=
 =?us-ascii?Q?k16RdPPu2nTWIV/evEb3GMGjb6QLRbQP0GgNZ2UETsgi2NYruvIypBOsBM+Z?=
 =?us-ascii?Q?cg864QtdPHNt1DlUdQxz1CqTB9jyk+bMmL89hiyMhfSixS1infSkHincJt3A?=
 =?us-ascii?Q?V4gQ3RaRL2ShkcM8exz+ZTM0YuW0JeE8eAhfKb/P6bJb7NIVdzsMRRFPFBRE?=
 =?us-ascii?Q?nSn19DPlTTUu4k5TkZp824e2twLWUH8dErCIO6ispN6cGBPLXgugKSs1D/w9?=
 =?us-ascii?Q?8olNfmSTcqZT1qSQZVvu5QCExL3FUqgsx4tWNYxIEjyFHi1UIqkty+Nsstxa?=
 =?us-ascii?Q?6GGyVdg14Gyt633giJwSQXHhrJhKG1KJhDge30gxDIQbMevKB3NSuxDq0/EX?=
 =?us-ascii?Q?ABnOWr67vH8lLudyaTNAKqqhHYct1eUdvN5+CR1Q5YPqFg5p8v4NK7YlB7oJ?=
 =?us-ascii?Q?gkYgm5iwFeH2rd3DjntkSLWRBgzSfAAXNxhii5pt59OdJV6khVU+ZwKIy/CC?=
 =?us-ascii?Q?GRyHXNifrH9XxA5xR45objg2cHy9FdHdP1fJo12L6BKXmf8VZRtTmO99FOkY?=
 =?us-ascii?Q?UN48OZogNpJMohmvgTftMGrDEpX49aSH+i5xNRQX0yjTV5Ee8v3YIK3DJe3Q?=
 =?us-ascii?Q?1NMVptuOS+p6Y5v2Cx3KpFPh3/USJgRHoVaajI2ovkESzsBi5ZIkYa1QD4MD?=
 =?us-ascii?Q?u6iHem2iuXV9qu7jVZ64t7Rhgb42XkBaBuiXmfTNHEOgV35XjNaa6oX4sumJ?=
 =?us-ascii?Q?8EDxpSgaxaxxy2bcI7P6ozquZk6yQE1IsLUn6De44TEmNGc909ah+Fig6jwW?=
 =?us-ascii?Q?u8B24PcXGJcmNQkV0B0gOtgkWinf8BxRyWIQGc0f4Jpkv+xUkBT2FnCELDXW?=
 =?us-ascii?Q?N8z/U+Misfd5MSVUY/TvRq89tiE4e/V3U/+xo5DXThChrVfBVBKtLKAqQgEf?=
 =?us-ascii?Q?cJmPj8aQQHlA07XJK5ohjXkN6Fj/MdVzJP1D1Gz2MfMoSctZRUvGxjjGFaqh?=
 =?us-ascii?Q?F0xJz5C/NzxA0SdpWLIY2eOXpWwD0KaMbd5Q22/9yoePtLHaazj+jGdoduhQ?=
 =?us-ascii?Q?0lnHPx2K1ZSoR+KHr4VYFNPgy0SIjL/PHEmvxKScEh4c37si27W3fCV5Y3ef?=
 =?us-ascii?Q?rH+9ro+6lTCLgWQdjYKkRkIhJJJS40ZAqYscSLYYVWKsi+6H392FzJdlAmAz?=
 =?us-ascii?Q?WRruOdk6h+sHorowq1dJ9+AQvk84Cg4OXf8MLvhYo5FNCmQQtgG5cGTeCh9F?=
 =?us-ascii?Q?VVHnS2RlSiX5UfqhACGInieHbSuErOSzpAxpXCYjm1UlmfsUI341U+djWmEz?=
 =?us-ascii?Q?j9aJxDFMFxRYPIloep19fiLU7EkFqYrERsbJlQ29NIc+yYVAMalNJgCLoY/o?=
 =?us-ascii?Q?m84PDDP2zC3rcuzXgYIR3t+2L6KpXfy2ab8z+bNjqzg4N7Ah?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0e585d4-1f41-4ec2-0512-08dea6db785d
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 17:11:08.2706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IedbvKor3QUPoqYsugydTBpQ27NIbP69CNdEqytL+NIPG9E25XbtAfEfNpxpPa2i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7933
X-Rspamd-Queue-Id: 6B6BF4A63A7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60103-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@nvidia.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

On Thu, Apr 30, 2026 at 05:47:49PM +0100, Matt Evans wrote:
> > On Thu, Apr 16, 2026 at 06:17:46AM -0700, Matt Evans wrote:
> > > +int vfio_pci_core_mmap_prep_dmabuf(struct vfio_pci_core_device *vdev,
> > > +				   struct vm_area_struct *vma,
> > > +				   u64 phys_start, u64 req_len,
> > > +				   unsigned int res_index)
> > > +{
> > > +	struct vfio_pci_dma_buf *priv;
> > > +	const unsigned int nr_ranges = 1;
> > > +	int ret;
> > > +
> > > +	priv = kzalloc_obj(*priv);
> > > +	if (!priv)
> > > +		return -ENOMEM;
> > > +
> > > +	priv->phys_vec = kzalloc_obj(*priv->phys_vec);
> > > +	if (!priv->phys_vec) {
> > > +		ret = -ENOMEM;
> > > +		goto err_free_priv;
> > > +	}
> > > +
> > > +	/*
> > > +	 * The mmap() request's vma->vm_offs might be non-zero, but
> > > +	 * the DMABUF is created from _offset zero_ of the BAR.  The
> > > +	 * portion between zero and the vm_offs is inaccessible
> > > +	 * through this VMA, but this approach keeps the
> > > +	 * /proc/<pid>/maps offset somewhat consistent with the
> > > +	 * pre-DMABUF code.  Size includes the offset portion.
> > 
> > I'm not sure I understand this comment?
> > 
> > For the old path vm_pgoff for byte 0 of the bar starts at some large
> > offset
> > 
> > For the new path vm_pgoff for byte 0 of the first range starts at 0
> 
> Glad you asked.  :)
> 
> This is trying to achieve keeping /proc/<pid>/maps (or similar) somewhat
> as informative as pre-DMABUF BAR mmap, in terms of keeping the VMA
> vm_offs column useful.  Before this patch, say you mmap() two slices A
> and B of the same BAR:
> 
>  struct vfio_region_info bar_region;
> 
>  vm_a = mmap(0, 0x1000, ..., device_fd, bar_region.offset + 0);
>  vm_b = mmap(0, 0x1000, ..., device_fd, bar_region.offset + 0x4000);
> 
> ...you'd see something like this in /proc/blah/maps:
> 
> fffff4000000-fffff4001000 rw-s 10000000000 00:07 148     /dev/vfio/devices/vfio0
> fffff5000000-fffff5001000 rw-s 10000004000 00:07 148     /dev/vfio/devices/vfio0


> then the VMA's vm_offs would need to be thunked back down to 0 (since
> the fault handler then treats vm_b + 0 as the first byte of the DMABUF).
> That works/adds up, but then the vm_offs of both VMAs A & B both have
> offset 0, and it's harder to differentiate in /proc/blah/maps.

Yes, and that would be correct.

The VMA output of lspci should show the exact pgoff passed to mmap and
nothing else. Do not mangle it for "debugging".

pgoff is not to be used to show random internal FD details..

> We could possibly stash the original offset somewhere and then render it
> in the name string, but the name's already about the max size and using
> the existing vm_offs column is nicer IMO, doesn't need a new field, etc.

> I need to work on this comment then!  What this is trying to say is that
> the DMABUF is made artificially larger than the part that is visible
> through the VMA.

Yuk, that's another reason not to do this.

Jason

