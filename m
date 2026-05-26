Return-Path: <linux-media+bounces-62804-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOM8GpTAFWrRaAcAu9opvQ
	(envelope-from <linux-media+bounces-62804-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 17:47:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2205D9004
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 17:47:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B2ECF307B4F0
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 15:35:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6DB4368299;
	Tue, 26 May 2026 15:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="uZpGEHk/"
X-Original-To: linux-media@vger.kernel.org
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011009.outbound.protection.outlook.com [52.101.52.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF98367B7F;
	Tue, 26 May 2026 15:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779809706; cv=fail; b=UuIaIsIyLAxgRi0kneZMg8Zax1+6RNJb33LsRjcZdIHIvHr186FneZKLhlg8njDbM7TAabsV1aUo4NyCuAGsMVtVVOzqTkz6adPieBw5ddphSKYiCh52/edAoWBe2Ecbc92vhCbtV95trIS6KuebR5dzOuhm3MoiQhu5htOuNqg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779809706; c=relaxed/simple;
	bh=FXsrCP0f0C5jL2YcpxAHL4VRc5nQRFd0dXM6v7lJHYo=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m1GsgJ4awhhP6ioxD9SOX9gWt/gSgzB4FBrhKxyj+kIy/EFzC4EqF8PzJAYGP7YcdELSn4YhM/an6cF3TPPyFoWJWgPf8bHo7Y/B5refF2lS2h+HIZJk9+OMBzuPktZJp8CI2yTdrs7pyyzOhZSm//tEy12KhW6noi6wL+pNrSk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=uZpGEHk/; arc=fail smtp.client-ip=52.101.52.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ctGN3i0Piix8ZFVSaUqdr3+ryAjYc/F2Zi9UQBuX1mIm8WDNzDpvkwAHZR3d5f/yXxDTIGTNCESM/+nvgzxQybrtFFz/DhNDTFKpV5aqY/3iV5FOZ+6078TDcTjGcyDaKaxIEEfySGoOZdaKfvyVS3Zyi690dGbPI+kmZsbqJZqOmsSrnEMLkQLv6b0aVu5Suaeug2dF9P6OTvmv7nxuMUwwyx3AqIg1Ak+/ZjT45vfb/ikQ9zeDwP4oXVKq9JflcPMHQkBHyN7wawsyQT57yOUqZ1NDXNUulY0UM1wZGczpxT/6HoHWOMwJ/gJ1jkffSDj+UlW1I/bKmwg2kjkD4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AnXHydEtrFn0CxSbJfJ3KbAEucQsxTrKq+pVMDQJQ1g=;
 b=ZMi5GkKgLCEfUxkFUpYIBXfdUpE4hn5Ynh40//oFsyjx3V/tzA8WS6Kx9Xy1KrmR2k0ne8TYaBIlzVQVsyyXNldXQ1F4n4uUHGjJQ9yMXujpx8PxbJx3Rwz50jn34z8ibw5KXjnR1ZEoOYFcdJA/bIuv131UnosXiBneEFELQ4CHx4n6cjXzXYiweBewhtCZffeZEjlKaFoT0RBFxwc1c/0tKScHs6dJk9+WF7x8fiXENd9hKeXH0uWpw02rGXaFd8bGKfgcgIhcBctut6i0CZKeaAucJx5if166L/33T/L+YwEM3bisG91xBVUoftwHBO0OlA7moP+z5gtrsFXHtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ziepe.ca smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AnXHydEtrFn0CxSbJfJ3KbAEucQsxTrKq+pVMDQJQ1g=;
 b=uZpGEHk/vwIc5H5UAj+LHMeaCmNuGSgd9V+huTAkJO7AwmkmGfM4kjFI63sDA+Cf6MdtfM11f6eGv6mhM2NZdRE4yXz27BxUSu6c3UJfAVF/HlwG15Etg+P2khXgZGCWZV+zX2JrTlhbxmXKD7P3Ed53jm252nBETohAe8jmOcY=
Received: from SJ0PR03CA0101.namprd03.prod.outlook.com (2603:10b6:a03:333::16)
 by PH7PR12MB6419.namprd12.prod.outlook.com (2603:10b6:510:1fd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Tue, 26 May
 2026 15:34:56 +0000
Received: from MWH0EPF000C6190.namprd02.prod.outlook.com
 (2603:10b6:a03:333:cafe::8) by SJ0PR03CA0101.outlook.office365.com
 (2603:10b6:a03:333::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.11 via Frontend Transport; Tue, 26
 May 2026 15:34:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000C6190.mail.protection.outlook.com (10.167.249.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Tue, 26 May 2026 15:34:55 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 26 May
 2026 10:34:54 -0500
Received: from amd.com (10.180.168.240) by satlexmb07.amd.com (10.181.42.216)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41 via Frontend
 Transport; Tue, 26 May 2026 10:34:51 -0500
Date: Tue, 26 May 2026 15:34:40 +0000
From: Ankit Soni <Ankit.Soni@amd.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
CC: Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>, "Will
 Deacon" <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Sumit Semwal
	<sumit.semwal@linaro.org>, Christian =?utf-8?B?S8O2bmln?=
	<christian.koenig@amd.com>, Leon Romanovsky <leon@kernel.org>, Vasant Hegde
	<vasant.hegde@amd.com>, <iommu@lists.linux.dev>,
	<dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] iommufd: take dma_resv lock before dma_buf_unpin() in
 release path
Message-ID: <uwnw7ybrgdobizf6do3ugrxshqhlzsusi34w3aky5hlp3y7wa2@hxmgp5tbpzzc>
References: <20260526111034.4079-1-Ankit.Soni@amd.com>
 <20260526122656.GE2487554@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260526122656.GE2487554@ziepe.ca>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6190:EE_|PH7PR12MB6419:EE_
X-MS-Office365-Filtering-Correlation-Id: 0eb7a452-7b0f-4ca8-2355-08debb3c56a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|7416014|82310400026|22082099003|18002099003|56012099003|4143699003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	McqmJ5G9IiLfTeBbwMDI3FLoJndmLMZ305FdTGrHYtvXe104OSbvRaqJp8GbwL4f2wKZFe/2LVQdN5im0HjfquOhmE+Ry+ChWbhHzMsYaXBgjexLJnhaB82tZ0WPUptwvzd/3cAmwjnjQDiZ5vSZH4ZAUCG0YJWBi7lBmliMGhKfq5jPemmpWRVf4JjTSkNDZWEdKbNOSKghTB3s+PWAiSIeSJFnkrpdN03GEq7LCKETwpKPMsfTf+KBTYCTFbHYhO00oSvlwtg/RFRDDGSrzdIaZ+HVnvdXz6qoE8s3Ds0gvCSOJobpXemcijVDPttqjZiosTO1tpT5Tq4RYrOaHVSK5HV1VYViALlRjKwMXJogmQ1PPp28NKl37QlCcJkC0GSlnCvhyigQUOIENXpPFjv0JROadSFoZAyGaDEIjxzgKG+ftRNNpg+XYhvK16zea1BRnf9aTJuzdiY/L9ZPv2J6cyUFr9LyTZkql2azZYOM+T0k+7sxhNvVQ3UqMl9t+yI33PPCCLaC6jnJF/4m7QInZFg1p6WBcPscokradHy+BmCyChqALANJTsuXyrmtI68l2puNmJKZrSsWvhuQS0CFhaDU43OXSFo1DFQDGPvUwVS4EEcoDVzB85J8tjqYcZCmhl6L281OJP0ffjoEJtNaENoruFv9t/qZ6m5jdr2WVQbTpvux9BDyEduGKBYDZJ8wuiMczxWtLd1S4GelpFBMuLI7TCaE8KU8t9KfR90=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(7416014)(82310400026)(22082099003)(18002099003)(56012099003)(4143699003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gUaAX7a+2t3qxZY8F8h2uPMW7g4TspUD0kwe/oYHtUO3pgD9m73ZXNZLfjJF1NURGQIIZFu9gjAN+2HaVzraVtsphmCDLSSqD3FQNeehTHme0AQaxghVGnbhvbeKbmTvFV9tcLWDAChXkuVS+UQ/ZW2Lk+PxBcks7tuwelUV3DM1H6Nya49ON4j0OasED6GhZBUFkoNAEBvk5so/lC2Qtz4dJ6Nr3JXL9hLy0xU7UvcsR6xOahbQfV5/rs9lP/cXQDGHpDirWdrIpVNp7p8DTf1Twotw97sHGewKEa9HNAu0me108lIZVlF0CCVX2sQfBWTCkF6HTadQrJhAnl3+k5fB4/h+y8CmWWBladl2ZWDUq61PLO81uHwYlbC6HyEYaMLC5wt4PXqwT2tdy97SZ6AqMztWN6toJgmhhJSCw8WPSbQIixYSmnBypTmIWqtq
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 15:34:55.7751
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eb7a452-7b0f-4ca8-2355-08debb3c56a2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6190.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6419
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62804-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Ankit.Soni@amd.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 0E2205D9004
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 26, 2026 at 09:26:56AM -0300, Jason Gunthorpe wrote:
> On Tue, May 26, 2026 at 11:10:34AM +0000, Ankit Soni wrote:
> > dma_buf_unpin() requires the caller to hold the exporter's dma_resv
> > lock:
> > 
> >   void dma_buf_unpin(struct dma_buf_attachment *attach)
> >   {
> >           ...
> >           dma_resv_assert_held(dmabuf->resv);
> >           ...
> >   }
> > 
> > iopt_release_pages() calls dma_buf_unpin() without taking that lock,
> > so every iommufd_ioas_destroy()/iommufd_ioas_unmap() that releases
> > the last reference on a DMABUF-backed iopt_pages triggers a WARN.
> > This was hit while running tools/testing/selftests/iommu/iommufd:
> 
> Any idea why this is comming up now? Did I run the tests without some
> kind of debug option to turn on that assertion maybe?
> 
> Jason

The assertion is gated by CONFIG_LOCKDEP. My config has it on via
CONFIG_DEBUG_LOCK_ALLOC=y (LOCK_STAT, PROVE_LOCKING and
DEBUG_WW_MUTEX_SLOWPATH each select-chain to LOCKDEP as well).

-Ankit

