Return-Path: <linux-media+bounces-59558-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eFDKIZ+z62kJQgAAu9opvQ
	(envelope-from <linux-media+bounces-59558-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 20:17:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA9A46254A
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 20:17:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E6DDB3019F12
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 18:15:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6FCC3EF0AA;
	Fri, 24 Apr 2026 18:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ErMKlxue"
X-Original-To: linux-media@vger.kernel.org
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013066.outbound.protection.outlook.com [40.107.201.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD8323909F;
	Fri, 24 Apr 2026 18:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777054516; cv=fail; b=YHNoQ5X3R33DR+aelyocMPUF5gE9++Tt6PbqMAsuxhdIkwmUgFbXvVCJSND4sKcjiqOqlHyVRgOFb/qfh6uPjSqCADb1Vud0D1Nr5Di65hJDG49vLa8V5EcSddrSgml1j+35L3VwoMwDeI4va4yqI3Lf6B0uKDdJ8KZKAHGXLCg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777054516; c=relaxed/simple;
	bh=zp/snQFHBiiW/LbZUytZMpejdFlEv8W2VvDoAZ/9YWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Rf3kNEjeeu3qGThuIt9BL+NZFtrFoOs36lNkCMy72tdFedc7VVXOzIJTEW1xapdZw+5aUA325WFqybloFWmuY1kjZbRzkBIwaCyYf9BubtJXbPZYO6ZWahzm9fzQU8KNKuVTNGm/YzubRmY2Qu5KlPg5LxxwFMQVMjQRewS/+X4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ErMKlxue; arc=fail smtp.client-ip=40.107.201.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O6hDuzT4FqF/8T+Ag39+ft1LODptxs8gy7dS16e8CImfvqgFsY11Y71Mp3ZWvC6I6+Qwp5AKKkvyfit+4dIOQv/IbIfkOpZdri0uS7BZFTkZLVCcnVUQZ7zuRSBwjJnA0iBRuifGiT0s3wX9/owZG7ppaPM0aP/RMTkwKvxYJsAysLqlIY9W14xqseS+ROy4aGpNtSClqFIVXw0/h00ukl4WmfT6WGiShKbnHNqPANdTl3oDL3GWfgMbliu0xF6wWWz2zNT0rZ4paC0nPApMeDnjsWRI4JxDYaKkxTcR28NHR55M8QHJ5oAlfNNRlbtXAHJ1G30TBkTC/QJ1RPkltQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=14Fbcp7TgS0X4Hr+lTZS4Ke6ZRwNjycYv0U+OMfOAxk=;
 b=WRus6in1l58HF8caRRrTKW/G0RhlnAedhKYIpHhNWrI8q/cAp9kSLc4vZYAmdE91IQOwoiX+nzQYDqLO0slnvh1A1JdLgiasHQMQ2vEYDoqndsQdKbFqqgPpYUNqrVq6cwUc4qt0Hi9px/KEaV+WDvWUBHS95SAd1wfrMlaUgNWaNxJHZ4h77BBNKB54NGYebwd+F0srGHl5+PPMhSpe66jeDx8jNHHbKhQBaVz86dO1+wMwLXk1B5Cbf4O24KAnJpHNetizuXsVPQWd4JM8xnNhHI8tZJ8NyHUxVlS2y6bbrOfhAYUmUQIJPCPbJOxk4YoWdoqmyguzgCVwqUQeHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=14Fbcp7TgS0X4Hr+lTZS4Ke6ZRwNjycYv0U+OMfOAxk=;
 b=ErMKlxueUhp9IqsEjifXmA/8aFNcssFvY4aekcXwHgSNNRvb/tuLzO0wjf103QAAwLEi9n65gxwNKFKbhHvzHCjMVjon75EGfVUX0wEYWB309ns/BaKW3SyUU3YRwR8qBVBziqwDy/bOEDMtvdNuhl8zI1MEkbtQnb3lzBO9F1YkcWYIlK6otu8b/wu2bU6dSDMY9AAC2npjCf1Oc9F4VWoycBfWn9ROj0wnL3gB0e1iOPr9HurVY4mFdX+AxNwWGb4IKAesG2IFT64tPl7T8NujMSD0eNAoUbUklo01J4h+zsc/NL8T3iQFJT2pGGSDlHwzbj8fbfWVMpEL7k0OJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by MN2PR12MB4093.namprd12.prod.outlook.com (2603:10b6:208:198::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 18:15:11 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9846.019; Fri, 24 Apr 2026
 18:15:11 +0000
Date: Fri, 24 Apr 2026 15:15:10 -0300
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
Subject: Re: [PATCH 2/9] vfio/pci: Add a helper to look up PFNs for DMABUFs
Message-ID: <20260424181510.GF3444440@nvidia.com>
References: <20260416131815.2729131-1-mattev@meta.com>
 <20260416131815.2729131-3-mattev@meta.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260416131815.2729131-3-mattev@meta.com>
X-ClientProxiedBy: IA4P221CA0009.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:559::11) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|MN2PR12MB4093:EE_
X-MS-Office365-Filtering-Correlation-Id: 57fddc49-8c08-4039-2aca-08dea22d6c70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	cGv709BlogjWO1u3QeLEcTgNKLME+hg8Zdvd1XjyzEWdLuOhb0s96qlIkUpukxaY8lDm91f+xmx2Ph7rpycLfFc8old3MXajyUgkHBKgNGpR6zRCiw8HhrQWZTdJDNTl3AsLCHyWJcVhH3pKpXR6R7ky7a8zqeBQJHhAwwxBONwZYBnVtlJJDVv2E4RcTdlyOosiyqQNk29UxgQXgi9/Rj7Kd43RjthiWfmfGYe+a6rvJH/w7o7LTi2K8Q9Xo2sRsFrWQwenijgpQxJNTvDaU9g7wS8tozw65AgPdYsarcvNyrK9kv0E24IiI2th6rgbMC9uF2+a3Mqa70nmRxJLASLH77gU4nSuxlI/skvWI5PkmZRECPCGeFAR66XIf0JF89U80AtzrL5shVt+QSYMcJqx/L1ZXTh59axdry2BQUCifSTfVK0JkPuPlJOsYBS4Svk9wubv6n5KviVmKMfRIW4OzCy+QmkJnicBpPw2LvRCtBZrYGmu/bNbiBSiXrIArRmadZPqh7P7XeJ09imX1yKlmErwSsxro31AwEIYnf5H7IHnpQaGvguPQf/V2v+wQ/EVda2XN88gfulaQvpuPa6cnvAzCdAPr8uhcn+ADgQVM3Oq8pluBqm1aoQdhHDP54MCK2BFo7+tg6P49YKPIVbdb+g5eqKvtSLvYZHI7pJmTdrTDBD+2j/G2tLuxuH3Tsy4QMA4ZDHkXtlN909KHjcZT50nEUX0MQ91WJmV2cc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VMYs3KSj2ANQ6dAtzjA+8NeO1vdDpSytv9hiTfLmLG9JJQf9LofCkGWTfzr2?=
 =?us-ascii?Q?dDQlyH02nC8921Lvz38rd2dkNj13tY84cUDawLImDHhCdqfQzSFew2N3AjBF?=
 =?us-ascii?Q?ICP942n46DHkwhd+02rOxTCSwfV2zP4jgjgU+C0uTEbE6vo5KdGEzJw5Rr1n?=
 =?us-ascii?Q?S5M6af7HQzKG1xcjEYdQ4NfQvmexk4jtszt4DyPgaR+XpPHQYMSHFQ8hhSLQ?=
 =?us-ascii?Q?Qx1f5BxQTm8OzEeIOoMVuOccp1zTJdmP0yEtoQWPuKIPDAKj518nuXlwpox5?=
 =?us-ascii?Q?8fgB1jRCw0AT4pJbQZxeP1YDXdGc86VWN+Z8gqo1N5lGgY0R1YwRVHYJnMEY?=
 =?us-ascii?Q?mbauASFfZXut0SB0nopzdOuustdbhtG94YKLkCkA8/ooUkd5gQ+Wm5eDQ1r8?=
 =?us-ascii?Q?Pf6E2fi/rIllENL+zYcLyZcAuH8iX6xePtGyTyJ3igh27zKwzvio9jglHRq2?=
 =?us-ascii?Q?4a94rcF+W6h5REGvbZywq3u4jpw6+2+4whQTAN5oak3ReAi1YpH+ctIT/4b0?=
 =?us-ascii?Q?54b+UzllGbXb+Qxmybxi5WrJ6tou5hdJcUunUT+05g/3eJFDyW+/LV8soSa4?=
 =?us-ascii?Q?b8XoZeD9kEx7SXYX27PIOGKgWZkgkQhdldta5M+mzVC1E9tMv60j9uOxbN4d?=
 =?us-ascii?Q?BGlvhSXmgOeCjnVoTFYPeUHBKeKrw8BOhvFRTCgE7EXzs7OxSciclXALiYBd?=
 =?us-ascii?Q?oEWKaI9BZmUJ83yBXX84R2s8twptGLjpkfsL2YLTlRmfYZc5ZpkqmSY612fq?=
 =?us-ascii?Q?4QVVFEAeQhsYW4iizL0XaFju16pmfa/aVFbMU0hmuMDXgrPzWzdpsvwnpiRE?=
 =?us-ascii?Q?MUnrR3NklaxLLC/U9Xg/lAGcKGxmvMDWVGpFICDMM/g3jrxqvivgCsZXe3pi?=
 =?us-ascii?Q?QLj0Q44AaA5NgMeLg+4NAhTqC2COkiNczJQyPIkLE6ILz9STPqRixYEXiSaT?=
 =?us-ascii?Q?36bD6ZqpsAPYoOmZ9/7nbWKUid4gOVq0lyWh+WL1oetuFCnlrk88Wr8uOx+t?=
 =?us-ascii?Q?2sZwDIk/eGlD2yElWeBoNEL17uRa22a9IH3p/fO/B/xBYL1uDDdvNI9a3Pr7?=
 =?us-ascii?Q?Fo810ibgPwVQ+stjjcJ1DHNI/ERKvwUrZVV6H8WIvjfTt/bUKVgDJN/1T6Ya?=
 =?us-ascii?Q?FqqyvPvw7y/6hrYlPSMwTlSyyN2W2EhuM0MGKkpvBRsmxPbhjm5GoqkOhsfx?=
 =?us-ascii?Q?5klM3b1DY9jFo8KghMREVq0KeJSi0HGiXZGldfLm4d7sLH6CZPh6g1KO8GkA?=
 =?us-ascii?Q?641RG3A6by8jqmOrPyNfFY4rOpKlmJCOatnskY6+NfdylzkI/IpNSyguNbDs?=
 =?us-ascii?Q?Qh6fFe+zujuj4rqxj7ME4X9X5kvV2jsl85swLWlvuYJj3x9SeZ2njoIxP5K4?=
 =?us-ascii?Q?/I+AOs6j6uKB9EHlJECR7ZRTTOlCxOheY4KokpyRmtqpL/wMNnwdiuBL8hlh?=
 =?us-ascii?Q?B7g+wdSd+7OK4KytEu53nN+y9qc1Fv7ifchy2Gc2OgbEYwsW3Ot3N8lPgv7M?=
 =?us-ascii?Q?zGPJLU/acV0/pVYRYSsb9zXKLPmWPVemNgqvETMt3PiQnF6B4Mf/mNk/zuPd?=
 =?us-ascii?Q?SU6SmmJgMXFQ0Srh6jPcn7LTQ5u3XFxEv9EH5C9nOpkV7vGJV0SONVjS/Hh6?=
 =?us-ascii?Q?PjgH3wRv/EjCv/uhf/QQrVwUj77Zo7DeshAWii/rHn1umKjIe022pFZTokXs?=
 =?us-ascii?Q?/MNaTH4cdXHwAcPjjDsad/izuaCOE7dkW9uQtriQYBoviov4?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57fddc49-8c08-4039-2aca-08dea22d6c70
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 18:15:11.1670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /KZ7zxfiYBsey/kjqm9JcmnnGHwWEHPZm7uNqzogS39jPgaKFNiHQWscYIqFz7py
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4093
X-Rspamd-Queue-Id: EAA9A46254A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59558-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[19];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@nvidia.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[]

On Thu, Apr 16, 2026 at 06:17:45AM -0700, Matt Evans wrote:
> Add vfio_pci_dma_buf_find_pfn(), which a VMA fault handler can use to
> find a PFN.
> 
> This supports multi-range DMABUFs, which typically would be used to
> represent scattered spans but might even represent overlapping or
> aliasing spans of PFNs.
> 
> Because this is intended to be used in vfio_pci_core.c, we also need
> to expose the struct vfio_pci_dma_buf in the vfio_pci_priv.h header.
> 
> Signed-off-by: Matt Evans <mattev@meta.com>
> ---
>  drivers/vfio/pci/vfio_pci_dmabuf.c | 124 ++++++++++++++++++++++++++---
>  drivers/vfio/pci/vfio_pci_priv.h   |  19 +++++
>  2 files changed, 130 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
> index 04478b7415a0..8b6bae56bbf2 100644
> --- a/drivers/vfio/pci/vfio_pci_dmabuf.c
> +++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
> @@ -9,19 +9,6 @@
>  
>  MODULE_IMPORT_NS("DMA_BUF");
>  
> -struct vfio_pci_dma_buf {
> -	struct dma_buf *dmabuf;
> -	struct vfio_pci_core_device *vdev;
> -	struct list_head dmabufs_elm;
> -	size_t size;
> -	struct phys_vec *phys_vec;
> -	struct p2pdma_provider *provider;
> -	u32 nr_ranges;
> -	struct kref kref;
> -	struct completion comp;
> -	u8 revoked : 1;
> -};
> -
>  static int vfio_pci_dma_buf_attach(struct dma_buf *dmabuf,
>  				   struct dma_buf_attachment *attachment)
>  {
> @@ -106,6 +93,117 @@ static const struct dma_buf_ops vfio_pci_dmabuf_ops = {
>  	.release = vfio_pci_dma_buf_release,
>  };
>  
> +int vfio_pci_dma_buf_find_pfn(struct vfio_pci_dma_buf *vpdmabuf,
> +			      struct vm_area_struct *vma,
> +			      unsigned long address,
> +			      unsigned int order,
> +			      unsigned long *out_pfn)
> +{
> +	/*
> +	 * Given a VMA (start, end, pgoffs) and a fault address,
> +	 * search the corresponding DMABUF's phys_vec[] to find the
> +	 * range representing the address's offset into the VMA, and
> +	 * its PFN.
> +	 *
> +	 * The phys_vec[] ranges represent contiguous spans of VAs
> +	 * upwards from the buffer offset 0; the actual PFNs might be
> +	 * in any order, overlap/alias, etc.  Calculate an offset of
> +	 * the desired page given VMA start/pgoff and address, then
> +	 * search upwards from 0 to find which span contains it.
> +	 *
> +	 * On success, a valid PFN for a page sized by 'order' is
> +	 * returned into out_pfn.
> +	 *
> +	 * Failure occurs if:
> +	 * - The page would cross the edge of the VMA
> +	 * - The page isn't entirely contained within a range
> +	 * - We find a range, but the final PFN isn't aligned to the
> +	 *   requested order.
> +	 *
> +	 * (Upon failure, the caller is expected to try again with a
> +	 * smaller order; the tests above will always succeed for
> +	 * order=0 as the limit case.)
> +	 *
> +	 * It's suboptimal if DMABUFs are created with neigbouring
> +	 * ranges that are physically contiguous, since hugepages
> +	 * can't straddle range boundaries.  (The construction of the
> +	 * ranges vector should merge such ranges.)
> +	 */
> +
> +	const unsigned long pagesize = PAGE_SIZE << order;
> +	unsigned long rounded_page_addr = address & ~(pagesize - 1);

ALIGN_DOWN(address, pagesize);

> +	unsigned long rounded_page_end = rounded_page_addr + pagesize;
> +	unsigned long buf_page_offset;
> +	unsigned long buf_offset = 0;
> +	unsigned int i;
> +
> +	if (rounded_page_addr < vma->vm_start || rounded_page_end > vma->vm_end) {
> +		if (order > 0)
> +			return -EAGAIN;
> +
> +		/* A fault address outside of the VMA is absurd. */
> +		WARN(1, "Fault addr 0x%lx outside VMA 0x%lx-0x%lx\n",
> +		     address, vma->vm_start, vma->vm_end);
> +		return -EFAULT;
> +	}
> +
> +	if (unlikely(check_add_overflow(rounded_page_addr - vma->vm_start,
> +					vma->vm_pgoff << PAGE_SHIFT, &buf_page_offset)))
> +		return -EFAULT;

> +
> +	for (i = 0; i < vpdmabuf->nr_ranges; i++) {
> +		size_t range_len = vpdmabuf->phys_vec[i].len;
> +		phys_addr_t range_start = vpdmabuf->phys_vec[i].paddr;
> +
> +		/*
> +		 * If the current range starts after the page's span,
> +		 * this and any future range won't match.  Bail early.
> +		 */
> +		if (buf_page_offset + pagesize <= buf_offset)
> +			break;

No overflow check on this +? If we are worried order is so large that
the first needs a check then this would too..

> +
> +		if (buf_page_offset >= buf_offset &&
> +		    buf_page_offset + pagesize <= buf_offset + range_len) {

> +			/*
> +			 * The faulting page is wholly contained
> +			 * within the span represented by the range.
> +			 * Validate PFN alignment for the order:
> +			 */
> +			unsigned long pfn = (range_start >> PAGE_SHIFT) +
> +				((buf_page_offset - buf_offset) >> PAGE_SHIFT);

(range_start + (buf_page_offset - buf_offset)) / PAGE_SIZE;

?

Jason

