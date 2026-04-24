Return-Path: <linux-media+bounces-59560-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4LjWF9q162kJQgAAu9opvQ
	(envelope-from <linux-media+bounces-59560-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 20:26:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3DD462679
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 20:26:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6EDCD3024A40
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 18:26:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD4E03F0AA8;
	Fri, 24 Apr 2026 18:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="doISpOO3"
X-Original-To: linux-media@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012034.outbound.protection.outlook.com [52.101.43.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EAA433ADBA;
	Fri, 24 Apr 2026 18:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777055182; cv=fail; b=rpt56Cw8/+7HCsSybLyxyGbVykKY4Xwx8ZCw0pJ43E4CNvvzAMUUFDRZqr3jvdHLcCugtsrk/hA+hxOwGN+Y2AysltXcRMt/r9ZdeMzuJeWjLJQfnmqBdhSdtuZePoGfWkPhggli1ofuH2tesRSx5+MQIJQAoFqmgzV57BcknNk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777055182; c=relaxed/simple;
	bh=WfF7h5PZW2OeRdSAZ+lMrkaSeKu92H2V7cLi5Z8I48k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=djLWkhaIWBMHFb7s1qUYyimPByHi3zF8kmJgf8gKqR4IcFeSErYr3z5BA9FunhZ5ISH/HaU156rGPcHMdGfTg/aooyP4ex1fi9qvd7wNnzzf9TSo7E1sQ7w4QFWT/ZuJXKyBDZVlhYw39VLaxqM0384Ia5euwj5oGdUsgmuagV8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=doISpOO3; arc=fail smtp.client-ip=52.101.43.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dhZnVROtDCkBvFc8JS7XQRxIQ6Q8BwQRvnv3Q5VvuQJh2/umMx2xrDpy7ILmOMnUV24q1yL1OHw9dG1YqSh+nGYKIWAgH3R79xQXAGqnD+leZp73ssBff+dbXGDfBv9HOvXWQRboNYWtl2AwNqT3tBcc4F48uztulezRmp9qSnbU0AW/MxxFA41rVY4hh9ebc401DdEmBoaa6Yer+BY4ofToK1Fq4QHwRt4Rs/XMoIkEqaQsxo41hh4r2ZoZU35MuE6hOfwc5ymQxKMrMezIqYGxKr2+dYk+lRZJGauXdTQ5/K4PGcyrV5iot2zMltPRsoHSjR5by0hp1HYl7KJF3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o45aHEGAzOZAQxDbyJnnpRjxkJePUvuzdSg5zapsHt4=;
 b=W9vdgZyeQ3d6mLEglq0sa66wrecC+PUmQyW6VX/Vu2pffa5hsQeBoPNWltxesV3ICajClxD/XL0QaOFXJ/ZMkiVSy0y32Si8Ohl5GGUcI2OI/UnbbCG1mZ2Wihn+D7uuehMiOZG1gCAl1YAznfQ9W0ek1uA8vz0CKzM3w4ZIGpgf/7YZRtXA5TkuyXOE3fdlgie7NKVIELM4K9FQT2XZT8aS/SbBQsZ1+chfgsxi9vgDGp82ORtrpmrcJMbEBqt/p95G1Dyqy8JuMgrT/S1X8hfONUX5xZ3jRDS/DNxR4KqnViyZsmZFNWTylsnsJSHHXCP4MynPgciZ/ew7srIWwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o45aHEGAzOZAQxDbyJnnpRjxkJePUvuzdSg5zapsHt4=;
 b=doISpOO3md8yxJNTguvQe/FowQlty3jM06oJMp4XXss7h3H3UhptJzdX4pq0+GxLoz8IxzSQ1kAZpfJ0/1REak5meIDNwgPXf5cp4P3fCDjJtyW2sa9Jnr9XNl++hor+Kj1sqVk2HC0oPgdNnf7EHtTay4E/T5d00lHDjBjO4lbtcH230anfuKVYleVmF12qyMRdZSeRl2MMG8oLKfz9+fLFdH/04+S1aKJ9U7T7plOdfYkpZiibKwYu5dq4DdeMz8MpmC25E9nGM9zCdfogmSJle7vBrMeByvFdPTF5V5MkhswE3Gg9slhFddfFyVgC4AurbYiBOXqs7d/g0wnpsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by SA0PR12MB7091.namprd12.prod.outlook.com (2603:10b6:806:2d5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 18:26:14 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9846.019; Fri, 24 Apr 2026
 18:26:13 +0000
Date: Fri, 24 Apr 2026 15:26:12 -0300
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
Subject: Re: [PATCH 5/9] vfio/pci: Provide a user-facing name for BAR mappings
Message-ID: <20260424182612.GH3444440@nvidia.com>
References: <20260416131815.2729131-1-mattev@meta.com>
 <20260416131815.2729131-6-mattev@meta.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260416131815.2729131-6-mattev@meta.com>
X-ClientProxiedBy: YT2PR01CA0019.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::24) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|SA0PR12MB7091:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c80c321-12b1-4579-ce97-08dea22ef728
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	yu9RRzaNwqLccLh90KYHm5jbwzdYQD/SChAns4Cq4ALR74Z7eEkSjGJ6L86E/rweIMbvaR2yygEIAa5uiTDwBtnYjaz6DXFBiwtXBnzuWBLsPHEZpnRPf8zKWbbb2f5roZHtVhVYFGzEIdMyFPr7F7J5vPSiYzeRUdH5esq2TYDPtxzCZgQJApNMi0sTSD9nBp9rqzxuyqiHrDo37fQlgit9O1kFf587Y5AXtC0UrLtaiaeM8RTTFnk3+Rq+J4cT4uD8nEJDqzUvdsaeDrRgQVjj84/gI7mycAlpdmcJ8ClLPJp5whIo4CzgMM3RdCa08glAib5Hs5JV1LFmtx4m5+E8TFZTOWKL142kE+2nyjSbFinAUVOFwwa92xqSUQEncZzkefaXXbs81JpW0bzdXZx1XHF9mmF/WMFzyt/hWSek64bRGnNCuWYhdEH7rlCnKmjlkn0aXHx+ppFWyHJAl1LDFWlynmIVvCHxmV5J+lMh6mFopYxZRftuylrI5yvmQAl/sHGwJuznDNyErggvUCn9ZCwdUAciVtdzJuf9Ie3k/Hj8X65zzTucNpQrmtwJzpSddZbxbEY6X/jvuDjqAEBXjk/q/XWiNXyNAes/026l0acaNOWV/hWU065GKPc1YNGhY85yp4+s7MiJUDDe7ovdVf4nGPJnT/vM9i0fAR/UbspYRv2fytmk7KKkj+xBIsBHJGMEVf1IB8++R22Wt2C7RwCFAoNWkOfqB0BSc9w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dHM8s1gX4MogTrOaEWPwmQ5DJCc8FDxXyRB4v8KCtDavUH2p1d1gvMr4kcYZ?=
 =?us-ascii?Q?LC+OOINN+cHPfWa2g3jDpWAQ97KF7AhUKJ626h+BmezBAxUyP1psFcMa4vWI?=
 =?us-ascii?Q?nslEO8OWv9DvN9Tf/VIXWzbUz99RT/BS8MdglddH9JRiXE4V0Pmx121u2zPR?=
 =?us-ascii?Q?SSSSgf1KK5/iObeoqrP8v60Kame0SCrw5zVZowxFIxAPaG3x/CHLEyjFB9Qx?=
 =?us-ascii?Q?gftUBSgvxtpAglN+pczNV9gsnPTiIBakBTjy3QULBAkpxRktpNVz3lsdhkUx?=
 =?us-ascii?Q?q9U4ghlMso/9/xtCsIxWF1VqU6rlGsMaqfLwm/7fEPbEyx0krL5oo2dcRVHi?=
 =?us-ascii?Q?do7nQvrh1sCjtM/GWjkyVoHjVDpyQbbtAoX3uDltY8pU4e5Fw0NibK3GvFO6?=
 =?us-ascii?Q?NS3M/lBfX1UGx9DImLbhzPVPk9DjJWeW4+PR1FW5Z5e/oCa0igmypGNRVUXH?=
 =?us-ascii?Q?CIGuDIAZDfPdstnMJN85zzozUU+QnA46IjrZAbFK8PMokLJNbciFr2l7NqGM?=
 =?us-ascii?Q?gYfs9oFMChAnZKlWyY9OqrlMtIGWEYcL8gwQY30czqiOP3VKDR/7e/HJtBGQ?=
 =?us-ascii?Q?s+tXV/2UvPbbiKoibLGXCA7HpAhMjTdI+cTgFHKxkDcSPUZwRdEDOGshZGx+?=
 =?us-ascii?Q?gE+UKBOrn2gqcfV6ScBHt0a1d2lDhd7V+TNF+BjrF9Rekjr2mRvOIs23lgcs?=
 =?us-ascii?Q?SvG0LfkOGBFM2GCZ1u6R6OF0ddLcH1yPAITLlmMsYnCimkBTgGUjzlEddQ0c?=
 =?us-ascii?Q?4cnGj0+RFEcnuIY4MSISJdj5FgVsPdilcnFbmOsvlE59g24UMvjwvYw/jOrv?=
 =?us-ascii?Q?FuCYSdOvteo2VAiLeNuf80t5gc1NhglPY02MTstz/zM+9iJM87jhExbMj1I+?=
 =?us-ascii?Q?eQtQGZi64fAt92VpXZ77NE2IKHgxqI+CIIQEOC/a/31XthZ6/aH05VFNCLht?=
 =?us-ascii?Q?ZfkM51ELXN/YDSptlB7lGNVg+0nUUWZkzTOH1LaS+Mq1qyHSSzUgpsPn2MCV?=
 =?us-ascii?Q?0aZp5vWOocaG6Y6yRdoI6PTdeFU5Wx/NZ20uj4wbeq3VwFb3L1VuoBDsZZLf?=
 =?us-ascii?Q?lPPsxFOFeD1ym/ZrIXzdFKj8jxs8uNJx39voVOmucDuXhqPQNUjAH96SUUhX?=
 =?us-ascii?Q?kRX8IxgJGzgVvuXw4ApU88YvRU9t7g+M1KUwSMy3tST37Ldip1YVeYjk4L81?=
 =?us-ascii?Q?Vk6hyjj9zE00avlnra0QQkrBNDq1H9/wkbX56ykGm7jSIBptRSUYbYGBF/GN?=
 =?us-ascii?Q?aeXfl/t8OFolH1qpP1RSa3LYtgVyZ17FuouMjHXBvW/6EWx/H/c1p+iN12jt?=
 =?us-ascii?Q?SENXasxptl46eMnzn40jPVTQBkIY8F8crLYj0S8duE8w346Il1rRQocLtzlG?=
 =?us-ascii?Q?otGKFAZydMNWw/gZURE74bKkS/BgpNi0TAZOmSpeoDoqYs0HAvr+U9L4uidn?=
 =?us-ascii?Q?aI9jYUkSEP8qIMlPlfdhkI0uojkIzfuuOYo/gc6Be4s9dZqgBlqdTatMRx3v?=
 =?us-ascii?Q?bap99Y67dGp6AQMD1M3NJT1VEmoxLeUpayGgBBZqJx1aKBqM+QvSJC7moclg?=
 =?us-ascii?Q?LKrSA5ak4HF5gP97mhbE/UeUgGaM+93JGkVx3GGnBSgm4kOOTzw6Yiw/Y6IG?=
 =?us-ascii?Q?DCrRpdXY8+Y8dzh3KFQS3Qla+5zqECvqzciWdvLZGQf2Ete4MLeztfy5nbjI?=
 =?us-ascii?Q?E7IVjFD77FD8OkbY4IaTWFt4T54f7LLW9cEgD6Bl6d+fZsFD?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c80c321-12b1-4579-ce97-08dea22ef728
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 18:26:13.3722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mkq3NHYkFYNZjOtc3dAijOxBGdWPM0dB3+DdlO9lCZ2KZvQqOGvTEW5qNfzFfYUu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7091
X-Rspamd-Queue-Id: AC3DD462679
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59560-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[19];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@nvidia.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[]

On Thu, Apr 16, 2026 at 06:17:48AM -0700, Matt Evans wrote:
> Since converting BAR mmap()s to using DMABUFs, we lose the original
> device path in /proc/<pid>/maps, lsof, etc.  Generate a debug-oriented
> synthetic 'filename' based on the cdev, plus BDF, plus resource index.
> 
> This applies only to BAR mappings via the VFIO device fd, as
> explicitly-exported DMABUFs are named by userspace via the
> DMA_BUF_SET_NAME ioctl.
> 
> Signed-off-by: Matt Evans <mattev@meta.com>
> ---
>  drivers/vfio/pci/vfio_pci_dmabuf.c | 27 +++++++++++++++++++++++++--
>  1 file changed, 25 insertions(+), 2 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

