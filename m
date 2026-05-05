Return-Path: <linux-media+bounces-60448-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHqMNlUG+mkEIgMAu9opvQ
	(envelope-from <linux-media+bounces-60448-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 17:01:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D694CFDD8
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 17:01:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B07AB304EA0D
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 14:59:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A60348097A;
	Tue,  5 May 2026 14:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FpV1SlrS"
X-Original-To: linux-media@vger.kernel.org
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010069.outbound.protection.outlook.com [52.101.61.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848F8480956;
	Tue,  5 May 2026 14:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777993156; cv=fail; b=axVPJS+v/LkivnqaXwewKrcLlHqPgk0BTvaFDB+zGLx2TBL0Yz/h6DjtgHk8clIKBtDii/DfDJdhiVp2mb2aScRW6dDz+JB4wCHQe5lZ2r4BYmiMuQrTAXaizqLaMY5jhGkH8CqZZSxuOfluBdAYJ8bbMVL/5gzDQWzionCTMkw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777993156; c=relaxed/simple;
	bh=ZB5ROAbrI6cmFwjdv5nGCcK7VDzq2CK6ffbPTjacwas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QUh5XKa/tWKxvmLJFzvZOMI5Z5NajccPxN6Fhq8o1+0RopOOPdnnDh6xRMnAnFuPa/SZ47lQSHGk5sQfWyXqgzjPamchYMtLfP0Fm4EsB9YZwXgA11MlMbbGte2vq2iQGrSDCYQvYCnLcivAVLi51XnYHGJ5ibFPm8y/KCpIrV8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FpV1SlrS; arc=fail smtp.client-ip=52.101.61.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=auLRFohXePwnRUTqgfqoj9uAQHytXOKCMT0gmyEDrv1f4+mztojufybb3SswD5HQzvvk2AwFGwGq2fSVBUOtObt94RZ23YKzZe/v4fy7vvBj6Qv4OZlO+syt0yhmhxUZi2M7Ix88BSMXeZsHVX4sQXnORcHumNDxL08LDnKnOgs2zk9megwTmTztGAwH+mbMcK19FHElAo6MvkPO6xfufpzfLquXw3X79FJfsCoKXCI5BU4qjAhYzI9gIAO8X9c/kKGHtf+U3IrVuElyQZsqQMSAsz/XmBqgEG+EhWol+HD6h3d8WVl7Q+InNSAqCKYWKnaK81aODQ9/zp6s/BZU6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8H4qcHbR98Lvxvsl+J8LGw1vDQW8yRmoXONFOPnnLWk=;
 b=j48ac8T5vz2UIlRD/Fj6W4i2HVaA62WM/GPCf74e7zEwpkuC9UJEGfnDoYFR+NCfdIVV9bGQiK3De4Dsy6ZKdQQzvcHB0S5Jyl9gAZycM509ru1YtloQYNE0tCTY2s4VcwNoal0J7XzwJBBlcTM6gPaIu6wAD3zzCEd7aUeymECPRsvJV2bqR3r3JuhrTpkQSLq4teRyICjAVxToqlT9/oK/v9tnraCQkc3yxmZhTmRPX4vMkG4fTF6Cy0mFueLo/2YdGu2OHhHJQKLsL6HFSmJxfgSzJSj31UedG7qAz1XJKFnrftAkQrr0Xja10gikGbP2XtCfHHnq4u86OOcxmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8H4qcHbR98Lvxvsl+J8LGw1vDQW8yRmoXONFOPnnLWk=;
 b=FpV1SlrSExI3u3J2ObvYBaP4dDY6yFBVm55lNBxRZwTXw0sFhoDsutphVS5Djv6kG2/aIvLyjYFigwWZmvu6aOv4Vqtmzz8lrBOlXr84m0zUHVAj2+8NgIdtdd7wU/ZQVHNemPvMfylJNDjNxaD1AMT+tH9hlSlLOAkGPCu1iNuiNhUzLxzDGJKoDHCxoistoublhrdcCFPPL5ufYg19vrpB87EzHRcwHkb+5V6Gty3V5mBvbLxLLC3RLm8g7KF1PYNtBG1gW6Ie+ghKepgtY9zXP86r09+C6ytTmma1ezrX0+AviwBzC1DW433dzXvG1s28bMnf5gLKKh1vrygA4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by IA0PR12MB8254.namprd12.prod.outlook.com (2603:10b6:208:408::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Tue, 5 May
 2026 14:59:03 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 14:59:03 +0000
Date: Tue, 5 May 2026 11:59:00 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alex Williamson <alex@shazbot.org>
Cc: Leon Romanovsky <leon@kernel.org>, Matt Evans <mattev@meta.com>,
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
Subject: Re: [PATCH 4/9] vfio/pci: Convert BAR mmap() to use a DMABUF
Message-ID: <afoFtHGCl6oSeOoc@nvidia.com>
References: <20260416131815.2729131-1-mattev@meta.com>
 <20260416131815.2729131-5-mattev@meta.com>
 <20260501161915.75525c15@shazbot.org>
 <afhNeYS174EW7RYp@nvidia.com>
 <20260505104911.GB11063@unreal>
 <20260505085058.74c34290@shazbot.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505085058.74c34290@shazbot.org>
X-ClientProxiedBy: FR2P281CA0150.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::11) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|IA0PR12MB8254:EE_
X-MS-Office365-Filtering-Correlation-Id: 5eba83bb-f57e-489b-d0f2-08deaab6d8db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	yYEsPW9M9LiXuDHVQHWu167Rv1tcECZbr3J7noUj23/PmCSihM2s1LxoYiF01I48C8ztWOx2bH6cGU+CbE7A6EsG48g6TdO8d2BooKvgheQNawApBJuz6RvgbyFnd6fQwC9tJJCEKPvcEb5UjcE7U1MrHHPA4hT6RVwoNW7SU0wHRo8SV5SN/qYeMBTPMQQZVVDgXXDal4L6ADQ00zFYM1yGX+ti74OBHgErEmnL2xyUww9Zth7brZd+YIY2NCa2FsBm5KLWoNM+FIYlWUjMF+Pe5j8HobglIHuUqCBM0SneNkr9yr30bhwGfqIn5G6qiGsn7BFEigzyEHnhoFTBYipnttGpfnNvJZwi1qToAWeXeUC/eX8qOKJRNszb/zP8uQc86/y56m4UwOWNE3c8Gwg6q5V+bTHw41YBiWkh+KGIosod/hA11L3nPU/Suz6YKLBkgv2990DjJT4q6YQRsNDTceipGnkN8jmoLUzgj6XVdIwUulWnSsq6wLSbdQTF+7SwYbmwl2gWiXU5vsKrJClk8CzTWrspl+UnFJIOTPf7ztsh0Zbx19ueu7pLt6CWSsGNVXDK4xR714ldeHo1lFKg9jPftdcTDZ951eDzb9aCi828pTO4CHHea4O7uhfeDxV3xxx44rJauir/B6l2f8Yl3qErKAUNXOkNZYAG92slevWDBPyUQDYDKgzdzZbY
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EGbjWwi9J/EujTfH7gLteUl8OJUc2ZKwZhteR3KMr5I+iHWaAtvbaTlbpyHL?=
 =?us-ascii?Q?PH0O1Q9YeSY8BRid3o1WyBJoFTtI69z4UzENsgd0oOnnkPMXsOGBO+iWZTir?=
 =?us-ascii?Q?4dNLAs6nMtd50thh8hQ8bNdGykJOkO8nWOk+yvFdaiiRPUYXnWZuViXIJfQb?=
 =?us-ascii?Q?xvqaen7Z40sEP5BiE6j4qX5E1kB3HZorjxhk4ziplwwRFIu9m8QPlBOtdgiL?=
 =?us-ascii?Q?FguDONZ4TmKmfx7XrJQgPZsn5+VxcnyiHmjRkGt45Uv1IoIR27WzzMti7HaU?=
 =?us-ascii?Q?JI5Cbiv6CyV9NerY4y5aLWOQ8KvegE6rHfXPQjlP9xCS1Zpg4xgDD6k9JpnX?=
 =?us-ascii?Q?nJBrEDkJQganH2UFCgEWTw4wv/Ji7ZDrCvKFJIww52jZ7Evbj53inbqvbSmE?=
 =?us-ascii?Q?rPh/VNKwcBkrSaT770ZWvFS7is7P3CeCTjNd61pQmTDfU4unwt6wwZvLst8c?=
 =?us-ascii?Q?U/tO/X5pOT/IXT25LJAXfjLlKFGz/ljOCDAoiCWvO+MNJDYz4MiPEfCTmd0d?=
 =?us-ascii?Q?WmWJbClXqjhkqo6GYcd4rCzNCsPgRrNzD9vJGQ9T0IvdZ6Sn+rfU0s4qBKuF?=
 =?us-ascii?Q?FAcuptDbqZxTbE8TI2ANsJlla3rNlmU76HUe+Ebcl8tSuc6wynM5A7K23gTQ?=
 =?us-ascii?Q?bdus5hFaZ5B6/JwJnpjPVg2fmPGq2zkDXkTeSxqr1lrXA2GU/0TLTvA08lIj?=
 =?us-ascii?Q?DA+D6BUg6J1MUATp4EqdTua6tZIrXCJp3c7iHVk0pFuYszk+vtqSnxAn6qWa?=
 =?us-ascii?Q?BEnCk2Q3m1uN98VdsfIFcJjAPWBXRl7ifKHykHyhhYA2CrjVVQSk7QM+24OE?=
 =?us-ascii?Q?AoFnBWIwIR/wSHS2jffsPJUX+nfnM4f2rii3jT97GlEBgDj//F5IBYhxK/aL?=
 =?us-ascii?Q?BHIZW4OnhG+N235cdX3AfZCTHJi1RisgHWR7thFvCcM2/EJ+fk9LbffUiSLa?=
 =?us-ascii?Q?dLUYut1DyYjrY/4FeNULq9icpVSV28GvB8koK8g0B3fdvF9EYLMaviyVeQrl?=
 =?us-ascii?Q?tk0HmVd5MgfyIMf5tfIwn9iypNVA6HNwHCH7BHCI6wFiuI31z0i2Vt83fUAz?=
 =?us-ascii?Q?FqHcx1PqJzk4JgCC0X0sk2tB3+/fiodklzXazMuZ1Ld4RlYB/AfSm4Zg5M6Q?=
 =?us-ascii?Q?uc5eEgUFdcF4p5/hisWKuPUYLh6SdvRk0W5xCPsqRMc7wIcoHFey37Sk9OLy?=
 =?us-ascii?Q?PhWuiYr+5H6S9tRq8Dd3A7U/x5phWgqphnP1hpN+br4a7QEPZ+BMkVvLjST1?=
 =?us-ascii?Q?AtIMrCJQ3lezs0+wiinOqq8Ol7uOtl0AA5P0W66y+No9qkjdLD3ONIIfuKy4?=
 =?us-ascii?Q?EFFI9FOMYarWl4C04h7zvoyDLCzHnqgBymdMd7CUnpVzJk6bCHfVS3K3tyJz?=
 =?us-ascii?Q?lmmXU6/CJ1SYAzLPcSnDhq9w0gYUlEv3zKMQWXyKEZdR58hNCGi5fKyrVdiB?=
 =?us-ascii?Q?GgBrh7waSts9XE0XJjT42ch+2LSEeyhbdUvHYfwVaAYSjxzBJgc/dgyB0uyu?=
 =?us-ascii?Q?1scB8qOoqHi+EgpC4FkEm5T30wmqAdkZLn7lxTc1LiRa9EpYeSQRbs/dQD+r?=
 =?us-ascii?Q?UA24+2LOgWhjtedYn2TtSGvLT5lPnsVvPs58KISg8kK1iulC0x1O3DEv2tDe?=
 =?us-ascii?Q?PXobubbOZYmzWvSVFm5zb0GssqKKnpqnGi7zdQAMVkzSwrnanBozia+ioop1?=
 =?us-ascii?Q?PuSKEhPYTLvTRNgByDWhrVlxhuyzEi5JhBzbTYuHWRk7nExZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eba83bb-f57e-489b-d0f2-08deaab6d8db
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 14:59:03.4189
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T7k7cF9UcmrPle3n47bDyIx2SkhiCvsXXwZ0F3G8LfVO/0tlqh8SPkO/Ynous8Mw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8254
X-Rspamd-Queue-Id: 56D694CFDD8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60448-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Tue, May 05, 2026 at 08:50:58AM -0600, Alex Williamson wrote:
> On Tue, 5 May 2026 13:49:11 +0300
> Leon Romanovsky <leon@kernel.org> wrote:
> 
> > On Mon, May 04, 2026 at 04:40:41AM -0300, Jason Gunthorpe wrote:
> > > On Fri, May 01, 2026 at 04:19:15PM -0600, Alex Williamson wrote:
> > >   
> > > > Exporting dma-bufs from vfio-pci is a feature, but mmap of MMIO BARs is
> > > > a legacy requirement.  That legacy requirement now depends on
> > > > PCI_P2PDMA, which depends on 64BIT and ZONE_DEVICE.  
> > > 
> > > That should be split up now, Leon missed it when he added the new
> > > APIs that didn't require ZONE_DEVICE..  
> > 
> > Sorry, what did I miss here?  
> > VFIO_DMABUF is an optional feature and is enabled only when P2P support is  
> > available. It does not affect legacy systems where P2P cannot be enabled.
> 
> If we look at the long term view of moving exclusively to cdev/iommufd,
> where VFIO_DMABUF becomes the mechanism for implementing P2P DMA
> mappings, VFIO_DMABUF may be optional, but it's highly desirable for
> legacy compatibility.  There's an argument though that providing P2P
> compatibility on platforms that support PCI_P2PDMA is probably
> sufficient.

The whole reason we developed the P2PDMA stuff the way we did was so
that all VFIO platforms could use it and get P2P. Thec code is fine,
there is a kconfig/kbuild issue that we can't enable P2PDMA without
also ZONE_DEVICE and those need to be split up. Once P2PDMA is
available on all arches it is no longer a concern..

Jason

