Return-Path: <linux-media+bounces-57799-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMi/Ig7ky2l7MQYAu9opvQ
	(envelope-from <linux-media+bounces-57799-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 17:11:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C2E36B7BD
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 17:11:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8E9AA305DBA0
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 15:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE2A1401A0D;
	Tue, 31 Mar 2026 15:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="h4xYgvQJ"
X-Original-To: linux-media@vger.kernel.org
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011053.outbound.protection.outlook.com [40.107.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9A13E0C64
	for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 15:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774969724; cv=fail; b=RLORI5tbb3/ePteFSKLb398oEDTX9CR0iSfsgHh9KEYSyQj2rbJKRBrkzmduIgvo5qolTR4mDN1BTFkzAudYidZqvpJv0+m33pgk9JZtEs1erswJUyLqcNr4QM1oZnSOFPMvGaESFIvCwuUOHB2ex0jDtdrpmAKXt15SGeMXf38=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774969724; c=relaxed/simple;
	bh=sXmboTGuLE5OUckajxUXEpSN93dqURsJLWJZxh/JSe0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=X5BfhvxA8nnvv8lxjYie38QBRlnKSgLbDyhH7KKYM+7/iBDDL7YgR7UvBbzPvGiiscVmUYvb4t75ajBV9akW8h/E/W3oCNXPBbZgO/Cf/l/WNavZm7hB1n6HCQfQRtYUxJXRREdI3N8S0+yqw5dUk6j4Do/dz1l4fcrIzJulVxg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=h4xYgvQJ; arc=fail smtp.client-ip=40.107.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eJU8lZCdegbP4rKKVZUU9/ED43SDbrx79AKeMAVA77UAZbgnDtlZsmXXI5I3sXIpw9HpgO+48OkhwkRIQzAOm4Z456crwWrhwN4vqrqHVgvB02pBk1GVIfbgb556a4+QMfk7RgVJmrPU07rTOjz6H8diKURazUsTaDDNqLpvN4lRGIJhwoJb/RKTASnkP5MRYbIMoGQniRoqeO8JORmLYnblWHFZBJeaiM2Gh3pqYc1o7pcy1I6a1e/5XILswB+KPeEdWKVkjq6DGEoR84/qys68V+djrN3D5EcV7icoP2EL0YV75AxLhefVPM8tl+aeWdYh/Hib2pCXgGjDijOUFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pv4as3gNxdGn6D6th6D7a6C1lJwvFJnzs8/2TjIPxFw=;
 b=ygFiTeQK29iugJTUnV/WenZhfMOMIZtrDxVcxbn9XVQs/izcrTfjyYaJCz7xbAWeqjWTllf43eOTm/nyrDN4AFBAZvnH6NeT7/Nkj/KvP5HqLJ7VG/wyZ1qFq+/7c3EQNdDhxYx3MYlcX/Sv0FJqbSVFdfNJuL2PHg5i5yzBsqzmi+iiWWyCHlH9qoeDzcHtEWSexohj5tD/hGCVre8kNbv2DPgwbmTiZS0lE5ZZthJmRTCOa7HXNmrgBd0BFDhGZix2VNa/ztkgQSuhAhuTMFRgXPby/2TP1Zlz44DPJg1NMreKq0gjT1L3KfQAH0HlH5Zx/mfgI/XR5hoQ360+Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pv4as3gNxdGn6D6th6D7a6C1lJwvFJnzs8/2TjIPxFw=;
 b=h4xYgvQJF9j1Dl7jk2LJDQnjwTyXvSrNw5pW0gh6NKMdz9QW0eQgeLlV4EiQ9nBdyUqL89u9M3L1m0Zki7I2x2wuPpC5sTVOeMVnprWJADVY72NAP4DH96i/oEIeubBEAlz0ZMi6IrAo4P82XpifmZgqLJallRPTKnRlvHSw/K+2V9aP/01NzS0ZN2BR9AncaOfKwaFrK6mtYtx2xUngS3SocX2dyd6lJbdPwnW4czdTtzzOtZPoxT2fXPCKzLXCa7Idzxu63RvrvFHIsF/HDJ3sC3nBxbzhsnbryQ8I8VDDSICkjab5Lv+JnfMDhdfGg7LOt+qgLEhS1qYULr/e1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by LV9PR12MB9805.namprd12.prod.outlook.com (2603:10b6:408:2ee::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Tue, 31 Mar
 2026 15:08:37 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9769.014; Tue, 31 Mar 2026
 15:08:37 +0000
Date: Tue, 31 Mar 2026 12:08:36 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Jiri Pirko <jiri@resnulli.us>
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	iommu@lists.linux.dev, linux-media@vger.kernel.org,
	sumit.semwal@linaro.org, benjamin.gaignard@collabora.com,
	Brian.Starkey@arm.com, jstultz@google.com, tjmercier@google.com,
	christian.koenig@amd.com, m.szyprowski@samsung.com,
	robin.murphy@arm.com, leon@kernel.org, sean.anderson@linux.dev,
	ptesarik@suse.com, catalin.marinas@arm.com, aneesh.kumar@kernel.org,
	suzuki.poulose@arm.com, steven.price@arm.com,
	thomas.lendacky@amd.com, john.allen@amd.com, ashish.kalra@amd.com,
	suravee.suthikulpanit@amd.com, linux-coco@lists.linux.dev
Subject: Re: [PATCH v5 2/2] dma-buf: heaps: system: add system_cc_shared heap
 for explicitly shared memory
Message-ID: <20260331150836.GB2308548@nvidia.com>
References: <20260325192352.437608-1-jiri@resnulli.us>
 <20260325192352.437608-3-jiri@resnulli.us>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325192352.437608-3-jiri@resnulli.us>
X-ClientProxiedBy: BN9PR03CA0434.namprd03.prod.outlook.com
 (2603:10b6:408:113::19) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|LV9PR12MB9805:EE_
X-MS-Office365-Filtering-Correlation-Id: 396ca46a-1607-4b4d-446f-08de8f3762b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	xStHTyxc+jLodnwpmZC8XvLDN8pEraxkkwu3vCi5IrGWeTk1jdR4ftEQ6w2kN2HSDJrZwTHwUtucfj0Cqcx0VCiqHI5xESo4PXYfLyv8jgW2Opbq4BzmxXSFZv9S9rok0v9MS1ujFvlZjF0fhe5zlyyTDicHvD0+xarVnWu8FPck9rm3A0sB2BVQS9MHjvHN1rIONQ32fO11LTSsAhCuVQf5X8W6gQaiY5R7Ua2Okx+R5sKchzF5m50RopeXEZwKpMmt9t7FT1NcamDei2zz60ZmMeTfqrmDfJOmTxTNHw/l7a4Q5jUzVo1hRaInv8oKLhfIT9klprR94oBoyBlxkiwNvI2MuO3jO411DpRxas48Pd/+KzAn0WyNdav6yekzdW3Ww9JEFzHCavPQ4k4LoLrDoFnJEKdW/xf569Nayk0i3DUhPNzXKY/xxV78mpqMeQGMDJDvg2txGb301RGaXet+cr68P30CwuaBhXtARECFtuPyhZsK3M2+v3M8kOOqOO2EfLxXktl1XzFZsoLjfh2SBGC9lsQ4t5N0g05V7TwOBXr8TrW8S9lyn0hlUbWIniCE1WN+po+OYAojVT+SIVxX6TrraZWUdNGVSwt7OJZP01ZBfJrpbJcCSmNvYTUt/raGsaLo5GJ/4/Zovo2G1M5cKjg/zfFrFzlKHzXmUKadIgUbkXanSUG9u87HsUjF/BeTb0h2k+KGrlBqMKsMTV0DN0uThATtkgGEjhkf9kE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uGLafNIURNrShXUEYT4lrpAPO91TkPUqpLBKgBeuVySDuW7wQTf0AmsV5MR2?=
 =?us-ascii?Q?Yz7BKmDcy31qmps2ZcLvITR8lWJIGoVfhanx/RVtu09gfoURIDCvgIOjR6X0?=
 =?us-ascii?Q?9v5/ae4c9HNzuXbEFyZqMhHrVvdn/q2S0p8G/bY6l3m4VGILWXO2UR+UouHt?=
 =?us-ascii?Q?OItsfkvZbSj6opDPa7USyFMUNPkILfIB8OTPWLojmRk7zc2s+QS9OpXFeHBS?=
 =?us-ascii?Q?YL1a/kyXMj4aXBesGwvOAUSxlyJpZd2sstegmdJFxFURtS74oTB9HUrbayGn?=
 =?us-ascii?Q?ClsITTGynG187a3uR6GRCJ5ifVVlEB6OZiqX1i4DsSueJMG1lJFYNhso6v+c?=
 =?us-ascii?Q?nzPDrK6uQmRYZkasVt4qcS5jfToCdJFjXZfHj0espMaqORpkLbgcWdhG8pee?=
 =?us-ascii?Q?Wsm0JPa8Y0+qb+GjZxJcq4nPVrdDtXrLWTSCg8oVBIuMLl86s3KEsJAePL2S?=
 =?us-ascii?Q?ZyEOME4eT2zte8cf1XnZCZ8sEpkYEErxRN96RIYbPlWFv1Va9WlsPQ4o8cie?=
 =?us-ascii?Q?Wpr+y4ENCv5ukRywC5VAAZXsVLfYhglno6g4jHCvMnmDFUptWuz55OA3M8qx?=
 =?us-ascii?Q?Z8NPRXfZdLssFTty97too93iRknqvci7Gnw//oqCM/2cY6SL2N1GlZd9f0Qv?=
 =?us-ascii?Q?pVPJ9WVM2yhSw3s7GNJ+l60Q8eWDLAL05fLWudXTqz8vj0nEb//hAfWp7xLo?=
 =?us-ascii?Q?dTCZMbzL3OszfKpFr7buECpMGA91Vyu/2onDK/Gb9ZhwIf4B3gGEjIZ93MBz?=
 =?us-ascii?Q?jSyGrPVfhqviUVR+iioG71Hhv4UlLt1srIwBc0krpYkSwugLY6TnMiF5h/CZ?=
 =?us-ascii?Q?yG3YQNWSL4uTQOYGsM/Ef3VcWXWpH87kq/YDFNkdIP68ruryIm/q3HhTt3O2?=
 =?us-ascii?Q?kFSE2JOQB8oae2T16Phr/u4iZg3GC+Iwp+LP6q/oF2hTTfZPlh6ZrO+kfM4Z?=
 =?us-ascii?Q?kEuDvFFlwSSnR7o5g0e6nrp9WUzTBxgoa5YdNH01M2XQAgz0mIrz4S3js/Hd?=
 =?us-ascii?Q?hlE7XCs7NaSebav1Wj4Ag4fz9cYHWhbBzeEs3O6oMDhbhWnRiKe65nv6Pbzo?=
 =?us-ascii?Q?rKM855Y5tNI2hy/2JDDIwRTuCw5aKiNGdtQckj4V37HNeu8fju4ZKAR9TRW9?=
 =?us-ascii?Q?fVtRS4obhNomG34fizBvg/KanGRDyDjLcNv0bwUxORVSTID4LAi8qcJhEjiN?=
 =?us-ascii?Q?R7d70NT+cNYOh7hYu06EjWq4OP1xDOmGffFnIuu6aPR9A1crPSyGq9Wz+b+T?=
 =?us-ascii?Q?S0+4KfveBskgCMgiuBJPqJFha8FBSKeHkClEOLQ2TQ6CSkoEjbk8jocpkaMM?=
 =?us-ascii?Q?hdsUXS5HwDOcHQCeOpeh1gv97ogMim7mcR10JtV8i0ow6HiVhOzTuQX3T/y6?=
 =?us-ascii?Q?iUvr1glGO287+H3d54beqbLx7Oro3Isb7at75Eq+Ji5DUyE9qCqKVopzi3BI?=
 =?us-ascii?Q?ThcSFNftLcuKht/QrReZvf//8ZsV5P90td4icWnpTDPnr9f/RK19i3yfl+nn?=
 =?us-ascii?Q?wYpdgOrdR0wNUUyqPN0Qv3v5UntJC1KsaUrCT/qDfgTVbRbRzQEjd3HyIKBl?=
 =?us-ascii?Q?rJMSiBXs2hKMYbAglgCtwACYKkMqrb10/j6wOUoBBORQY0i1tYfL9cw/h9dJ?=
 =?us-ascii?Q?gqSe7aiqbX7fVBbqHh9VRvJs5sAJxnRgTeeYZ38FUpVAOfbVGB9TBBS0Jia+?=
 =?us-ascii?Q?qMUqcV7ziIkuRhzVe9qP+GFDRjg97DjP68wNKfK0WsQhK2kF?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 396ca46a-1607-4b4d-446f-08de8f3762b9
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 15:08:37.7963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7hBe0oFJ8AuaY2YghjWqvdD/LTT1pEWJnt21xm8AQRR77KPN1rl43j5T69vgpLP4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9805
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57799-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nvidia.com:email,nvidia.com:mid,Nvidia.com:dkim]
X-Rspamd-Queue-Id: E1C2E36B7BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 08:23:52PM +0100, Jiri Pirko wrote:
> From: Jiri Pirko <jiri@nvidia.com>
> 
> Add a new "system_cc_shared" dma-buf heap to allow userspace to
> allocate shared (decrypted) memory for confidential computing (CoCo)
> VMs.
> 
> On CoCo VMs, guest memory is private by default. The hardware uses an
> encryption bit in page table entries (C-bit on AMD SEV, "shared" bit on
> Intel TDX) to control whether a given memory access is private or
> shared. The kernel's direct map is set up as private,
> so pages returned by alloc_pages() are private in the direct map
> by default. To make this memory usable for devices that do not support
> DMA to private memory (no TDISP support), it has to be explicitly
> shared. A couple of things are needed to properly handle
> shared memory for the dma-buf use case:
> 
> - set_memory_decrypted() on the direct map after allocation:
>   Besides clearing the encryption bit in the direct map PTEs, this
>   also notifies the hypervisor about the page state change. On free,
>   the inverse set_memory_encrypted() must be called before returning
>   pages to the allocator. If re-encryption fails, pages
>   are intentionally leaked to prevent shared memory from being
>   reused as private.
> 
> - pgprot_decrypted() for userspace and kernel virtual mappings:
>   Any new mapping of the shared pages, be it to userspace via
>   mmap or to kernel vmalloc space via vmap, creates PTEs independent
>   of the direct map. These must also have the encryption bit cleared,
>   otherwise accesses through them would see encrypted (garbage) data.
> 
> - DMA_ATTR_CC_SHARED for DMA mapping:
>   Since the pages are already shared, the DMA API needs to be
>   informed via DMA_ATTR_CC_SHARED so it can map them correctly
>   as unencrypted for device access.
> 
> On non-CoCo VMs, the system_cc_shared heap is not registered
> to prevent misuse by userspace that does not understand
> the security implications of explicitly shared memory.
> 
> Signed-off-by: Jiri Pirko <jiri@nvidia.com>
> ---
> v4->v5:
> - bools renamed: s/decrypted/cc_decrypted/
> - other renames: s/decrypted/decrypted/ - this included name of the heap
> v2->v3:
> - removed couple of leftovers from headers
> v1->v2:
> - fixed build errors on s390 by including mem_encrypt.h
> - converted system heap flag implementation to a separate heap
> ---
>  drivers/dma-buf/heaps/system_heap.c | 103 ++++++++++++++++++++++++++--
>  1 file changed, 98 insertions(+), 5 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

