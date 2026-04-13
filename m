Return-Path: <linux-media+bounces-58666-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gH7uHFHp3GmUYAkAu9opvQ
	(envelope-from <linux-media+bounces-58666-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 15:02:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D22D73EC512
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 15:02:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 85876300F181
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 13:02:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A4313CA4B9;
	Mon, 13 Apr 2026 13:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BiQlU6l8"
X-Original-To: linux-media@vger.kernel.org
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010029.outbound.protection.outlook.com [52.101.61.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440A1AD4B
	for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 13:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776085321; cv=fail; b=FD57gCwlAX6V/yi7hsmrhlKLLLlqgdhYwY2vyAVwNvFvXmmxKGcScGO5MUVatwx0zO8TYi4n1DMFgr2ROqXV2eUZQjzBUrdaGqAImbz5vU/5Vq+TytvT64HsxtpOBnlOIReo4xviswHsWVtQr1JNwGQuKfqsEra4tOD8/aOuv0c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776085321; c=relaxed/simple;
	bh=b4pmFBledhtEBUPOIWpL7FMWK8Bk6ES4S4p5+mPrcWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kkPowELiMAWtcaDp+mj7l/FMLjlaFEzokZO9/32rbt84prGcxsBZgUIo7+JrKweDexFT9w9NAxlkwMV/ee1jdk6u3luksq14JXuJcuR4/LRVfpBeQwY18jolt/wHnqP1vUpVzXZocTdu4R2+ViloKGWJrbIu+5c9+Nt59+qrp9c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BiQlU6l8; arc=fail smtp.client-ip=52.101.61.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jPwSo9LMeEXMn1atcdbDihsAYqMiEgQdQVD/ir6lrhpSSWtPJqe3RxXt2XEomT/U3A7/hBrwR9tUdrwa0Q8VRCTMqK9I1ZdoY5bQAeSPKwpRAUx1gMM3pa8gOTia6E/rHkH7ghn4IgIrOiCLg7+b0Ox6GH7TtVb4SShdpgtzwnCIiiXYvl06jdhvvTk2MM12hC2+xfM6GrTMnFK1BadUiTF7hZdFcfO1v2svi0gzmOnbpTyoRxiNMnxRng2Vjni1QPgETeMPH85P6w7hu+V0jMFy1kRAgL/LoL/YbiyV2mnOtbD+KNpmWXY9yQsxLClv3v2qCRLy3AgV6nzH5NYP8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hWg0qLP3JhM8qNtvuzpEXuzGVd99fDCPdR962OPUtcs=;
 b=mpigpr2tgKkVUF6khZ9icidL/K/LTetVcgIQDaxsVr7mPVh7EdNqhmGN2u7BBez5n8pQkngVPvBkyyYOfNcB3xkxVgX2NaEZBMe9Tso0gHsVK+4Gd3F4o+Dn6VS/pMIbGwNFDXuo8w+YQTbJ9nzDhM31doNz2mUyyUe7OFGQ6UkB2TNzKtgoDSZb4TUXg+WdZj5YFcHeYvCf0/Skro19uZqtuayEBN4gzud5cchDTU1N/85YSU+iIlMNXPGgtO1+TEDA+LNeq7fdnpPB6XQLkJNMJULhCtrrK82Ir5sRjvWVxlNNpzDpC3RA3PTSnoYfV99DxkYY5Ne9LFAbbaINgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hWg0qLP3JhM8qNtvuzpEXuzGVd99fDCPdR962OPUtcs=;
 b=BiQlU6l8JMrn9CYVe8+T/nZ6qrbyl8wedjUklZ+9d5EKEmA5KpAOSqg3jdNm07tkNeXS54N1jSP1iIzJZEOAVhMHxMBRNNsGCfD4l7ZDxSNbrv/8C7JxCB3skGsqKE1dY4hXphmIqVX1ge4VP3wBt+uh3XIY7hMlEv/jdQDuvZQxieSgYMVffx6LaWb7xkgS4o/jwQfbuqHSyxa4r6XHLUHI5cVIlEbHavpHS7vlttwH1+TJwRlC8+ubT0ldFi8+lGfxyz+tc+UHvAAEOY/gSmc91Q0cxuZc32Y7ZJj3PcRpbmohIv/yakUztmEr95aBKgBLL1jxK2p69Y2K+Yhvng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by DS7PR12MB6309.namprd12.prod.outlook.com (2603:10b6:8:96::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Mon, 13 Apr
 2026 13:01:49 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9791.032; Mon, 13 Apr 2026
 13:01:49 +0000
Date: Mon, 13 Apr 2026 10:01:47 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Baolu Lu <baolu.lu@linux.intel.com>
Cc: Christian Koenig <christian.koenig@amd.com>,
	Dongwon Kim <dongwon.kim@intel.com>,
	dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
	iommu@lists.linux.dev, Kevin Tian <kevin.tian@intel.com>,
	Leon Romanovsky <leonro@nvidia.com>, linaro-mm-sig@lists.linaro.org,
	linux-media@vger.kernel.org,
	Matthew Brost <matthew.brost@intel.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH RFC 12/26] vfio/pci: Change the DMA-buf exporter to use
 mapping_type
Message-ID: <20260413130147.GG2588311@nvidia.com>
References: <12-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
 <f4e2171a-da58-488f-be02-26a39b5afbe3@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f4e2171a-da58-488f-be02-26a39b5afbe3@linux.intel.com>
X-ClientProxiedBy: BN0PR07CA0013.namprd07.prod.outlook.com
 (2603:10b6:408:141::19) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|DS7PR12MB6309:EE_
X-MS-Office365-Filtering-Correlation-Id: ca1a95af-c3fa-4cc2-fc0d-08de995cd2c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	AsrXT88dqKc55UD1/578Npw8AxvpTNTtJPW5tahhzX9HRH48gyGXuUkGQ3wcV22P5r0xgDTVdw8sHAcfQcNe5mAjUfh/SVf5iHzCTQiujvchWMC7beOu6Blpt/yU3eNsDYddrGcSUjYjXvS8/ipQp+yWvbap8buoBguV1hUniIEO2kTY/sLJ9sfRcdzkOUeUFAPceKx9wM14IYJiYU0e2rTNQioai4P8PVcMmdoewV3/Q7nPLyvQVigmgv7+L7i7/KwbDhRu+v8G3+9sQ8WK+n2K9MLoZ8T3Orz2dASMu2N54xGJbtr2X5BeP5akKSRQ9rgoeeOm5fjH3bLsSMsj3A2kCl82Z+Aws7LUfym8KL9hCDK7lQ0X8G78zLmfsCBFuXDfn19uoVcaeZKNImEZcQEWeayHWmnczWh1YolI9fsXI2XztQ1wq6NoiOGsIPfAWggf6SEej0jEj6+T2GHMR/MsCqdS96rFFEdGZXWdZSj3B8d1q2vjDAjnk9E2DpG1Jwy6B+gnqPpygKHgv6s6kLEl3fIzKKT+NhAYtRePpfjG5seGnoX0h8Ha+1PYXXgJDDASM3+eL9tJZV6cidkRX7JYZjyWa078wNdVjIyjOIK7Fz67w9PaNdBAGmgEnSwHn3vBJzssqDdU4wbRE2juaM5C38sF2dUtK1ziBfD+ItLni4+osbU7JEJW9WT0ip7wRCCjU+07oaIn9j8t3W8MgewPRRoBjE8a5EKeXf8u3E8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6VW/0URCwbFoEmEONLknch+0JF/oak0js/7kYIVNclSAv1Pe20B0fdFrMsIS?=
 =?us-ascii?Q?XIPsP+7fqAnpdPgdoxn6birfdWYGSVyhiKK2P/aeBe42NMjpOiKPuceWZjl+?=
 =?us-ascii?Q?+TQU7QcLqJlDyZqGv0lLuCIyg8xJOUgNUVmm4cb0x6Qem63b6/5WNLTRQ3bd?=
 =?us-ascii?Q?BAbopOz1L+A3V5VLTteXSQiMtrkP9Or/SZQ+MT5xXLFGlMLrJzqnM6qGJUvf?=
 =?us-ascii?Q?poH6JqpVmFgZAYPWPdZPKMz+tCKJ+8juPhLY1N6feODCbEl83ZkpXuAkvZTg?=
 =?us-ascii?Q?ZYxEELazipT5DOceIRDsU5yTD/f/z0fMWWs/6o4d9Y3eg+qBpnNntuOhLDy4?=
 =?us-ascii?Q?IRHUB/NlezTeb/2el4U11qW/rUolpzmyfc7kIo5Tm9uxzEB+sIZyvE263PX+?=
 =?us-ascii?Q?XptLrdmbp0lrvHp+xj71mqnTF9NLUQIrPcfNo8qbSHRwSLC/K7AHecSdZ8xg?=
 =?us-ascii?Q?VjLC9r2pAgXudIzXIEAWSdxTcgTx0X+btZQUGj57fFRVXVOgSKwClIVe3+mS?=
 =?us-ascii?Q?PfTgB6EVE/4J2/hjlmuoE6Wjio47J71sY5JUYjHqgUc5ogqWjfo0ksr/xIVi?=
 =?us-ascii?Q?Z6AF0pyKkSxBRqNZEfWVVQJmKtmxlWMBmnlYgqv18M8laDZ4NBvEPg6U6JJj?=
 =?us-ascii?Q?E8rS2O1K+kWgxmOrCflNcjPH6jJGqte0eNcRnPE0tjTHjkG+XZINaJTA/oaO?=
 =?us-ascii?Q?+0P0RaE/40EBK4YcsIwkuZyCZZfwQgYm5FoNOR8Rnw6KWpKH4oB1nzJTAlIr?=
 =?us-ascii?Q?J/5TY6DuV1Q3pXA/5IuPRVHZz551Ibzwy1xOYMJyzQNzLoL9xV4EIYSkh7Gj?=
 =?us-ascii?Q?sTXOlO5fjadi8uCtCdjUYY9+sy8Ubyel7NNDekSjUZ7uZeQVnF2xblbGhxxm?=
 =?us-ascii?Q?V4U073NPg05e/VYgxhWNRdHpKPrT/wmIdza4GWA4RD0rVVOT5vxl595URFnF?=
 =?us-ascii?Q?V0sP6uBFXpT06YimQ1DmEHD7B8WmdXOCdeuRTk+ZkYxDPcTXQeOHoM9zBZNN?=
 =?us-ascii?Q?8w9zLIfA/GboJ2Ju1yS4BYuCuLNOU3Po9g8BzITK5IHuN5swXG+LQ0XFwIF4?=
 =?us-ascii?Q?z4To0IfiBnL2P5AXyy5tHiEy71rzV6hT3XVQyaui2rrcLVQx8UT+3rRpSe2Q?=
 =?us-ascii?Q?IShhxGnm3r5bgjdk3gC2fKjI/Pd5ikKaZPtIZxGf0XYPv5/hxiTChur92d3Z?=
 =?us-ascii?Q?3IP+paOgU0+AMdsQXkrZDUY6BVSnaNZskGjeZ5J8cF9g0amdlXIOZU0+yr+8?=
 =?us-ascii?Q?tY2gGqDAEtGReoJfXz3da1fzwV2Ye5YEZ8BadTH3MaZa6OagVKBaL+YExtpO?=
 =?us-ascii?Q?OMzdMuxgNj7ZTeM5NlzvN1UHXQlSuO8gK/hhSugJT0O5swLzglYYBKAPExSO?=
 =?us-ascii?Q?hhEwDYlipQRKBpK6UZ9ss7qO0NGPZiEvpcKls/dahB6ELnMAM6BwlIHD32Uw?=
 =?us-ascii?Q?22NvRovr4Jiu3T57Wn2L5sxL/UvRISiddCSB5HCAAJXQYCvdijMDjBBwUjDm?=
 =?us-ascii?Q?xHy1baz1dyFaeN0d71IESYTwF8mxCH0uU6/qcxQ/p05JRBpKPiRlZ1UjzQxw?=
 =?us-ascii?Q?waAED2ZgXKlswZ71W51zbGJXC4nDzE3jsBIgr3PScOKKXplgTEXYSNGVkuwB?=
 =?us-ascii?Q?c9qnGhhA40pAIp7FCaJYWE5iOlCG14a89eYPxYLrqiPJ2sEQ4pjeLucMPnCU?=
 =?us-ascii?Q?E1ed6xTOT+4YyU/mCtv5Gf+4vXfEvYPCfQkaeqXvXxWq7vGC?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca1a95af-c3fa-4cc2-fc0d-08de995cd2c6
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 13:01:48.8372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wzTM+joJkQfbg9oGKow8dNHqULg0CXzdMufp1A6TGs69mANay2rARCDwe5/Fvrv1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6309
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58666-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,nvidia.com:mid,Nvidia.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D22D73EC512
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 13, 2026 at 04:29:59PM +0800, Baolu Lu wrote:
> On 2/18/26 08:11, Jason Gunthorpe wrote:
> > Simple conversion to add a match_mapping() callback that offers an
> > exporter SGT mapping type. Later patches will add a physical address
> > exporter so go straight to adding the match_mapping() function.
> > 
> > The check for attachment->peer2peer is replaced with setting
> > exporter_requires_p2p=true. VFIO always uses MMIO memory.
> > 
> > Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> > ---
> >   drivers/vfio/pci/vfio_pci_dmabuf.c | 31 +++++++++++++++++++++++++-----
> >   1 file changed, 26 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
> > index d4d0f7d08c53e2..c7addef5794abf 100644
> > --- a/drivers/vfio/pci/vfio_pci_dmabuf.c
> > +++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
> > @@ -25,9 +25,6 @@ static int vfio_pci_dma_buf_attach(struct dma_buf *dmabuf,
> >   {
> >   	struct vfio_pci_dma_buf *priv = dmabuf->priv;
> > -	if (!attachment->peer2peer)
> > -		return -EOPNOTSUPP;
> > -
> >   	if (priv->revoked)
> >   		return -ENODEV;
> > @@ -75,11 +72,35 @@ static void vfio_pci_dma_buf_release(struct dma_buf *dmabuf)
> >   	kfree(priv);
> >   }
> > -static const struct dma_buf_ops vfio_pci_dmabuf_ops = {
> > -	.attach = vfio_pci_dma_buf_attach,
> > +static const struct dma_buf_mapping_sgt_exp_ops vfio_pci_dma_buf_sgt_ops = {
> >   	.map_dma_buf = vfio_pci_dma_buf_map,
> >   	.unmap_dma_buf = vfio_pci_dma_buf_unmap,
> > +};
> > +
> > +static int vfio_pci_dma_buf_match_mapping(struct dma_buf_match_args *args)
> > +{
> > +	struct vfio_pci_dma_buf *priv = args->dmabuf->priv;
> > +	struct dma_buf_mapping_match sgt_match[1];
> > +
> > +	dma_resv_assert_held(priv->dmabuf->resv);
> 
> My understanding of this lock assertion is that priv and the underlying
> priv->vdev are accessed within this function. Therefore, the lock is
> necessary to protect them. Do I understand it right?

It is because we NULL priv->vdev on the cleanup path

I'm not sure why my test kernel didn't hit lockdep failures but yes
this looks incorrect.

> However, callers - for example, dma_buf_mapping_attach() - do not
> acquire dma_resv_lock() before calling this function. So kernel traces
> will always be triggered.

I think this is the fix:

diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
index 9e7e8e7719d1bd..3e31ffb03ddd9a 100644
--- a/drivers/vfio/pci/vfio_pci_dmabuf.c
+++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
@@ -12,6 +12,7 @@ MODULE_IMPORT_NS("DMA_BUF");
 struct vfio_pci_dma_buf {
 	struct dma_buf *dmabuf;
 	struct vfio_pci_core_device *vdev;
+	struct pci_dev *pdev;
 	struct list_head dmabufs_elm;
 	size_t size;
 	struct phys_vec *phys_vec;
@@ -92,6 +93,7 @@ static void vfio_pci_dma_buf_release(struct dma_buf *dmabuf)
 		up_write(&priv->vdev->memory_lock);
 		vfio_device_put_registration(&priv->vdev->vdev);
 	}
+	pci_dev_put(priv->pdev);
 	kfree(priv->phys_vec);
 	kfree(priv);
 }
@@ -143,18 +145,9 @@ static int vfio_pci_dma_buf_match_mapping(struct dma_buf_match_args *args)
 	struct vfio_pci_dma_buf *priv = args->dmabuf->priv;
 	struct dma_buf_mapping_match sgt_match[2];
 
-	dma_resv_assert_held(priv->dmabuf->resv);
-
-	/*
-	 * Once we pass vfio_pci_dma_buf_cleanup() the dmabuf will never be
-	 * usable again.
-	 */
-	if (!priv->vdev)
-		return -ENODEV;
-
 	sgt_match[0] = DMA_BUF_EMAPPING_PAL(&vfio_pci_dma_buf_pal_ops);
 	sgt_match[1] = DMA_BUF_EMAPPING_SGT_P2P(&vfio_pci_dma_buf_sgt_ops,
-						priv->vdev->pdev);
+						priv->pdev);
 
 	return dma_buf_match_mapping(args, sgt_match, ARRAY_SIZE(sgt_match));
 }
@@ -323,6 +316,7 @@ int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
 		goto err_dev_put;
 	}
 
+	priv->pdev = pci_dev_get(vdev->pdev);
 	kref_init(&priv->kref);
 	init_completion(&priv->comp);
 

