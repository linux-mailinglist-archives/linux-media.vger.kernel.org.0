Return-Path: <linux-media+bounces-67417-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aqh+EzoTVGrphgMAu9opvQ
	(envelope-from <linux-media+bounces-67417-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 00:20:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 923A7746237
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 00:20:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=Nvidia.com header.s=selector2 header.b=CgzVsmcA;
	dmarc=pass (policy=reject) header.from=nvidia.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67417-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67417-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4A0B1300EF8E
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 22:19:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE6013806C7;
	Sun, 12 Jul 2026 22:19:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010035.outbound.protection.outlook.com [52.101.201.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D47F30D3FF;
	Sun, 12 Jul 2026 22:19:39 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783894781; cv=fail; b=J1ZjYuteRP8Zn6Lywdv2kqXT5+cicBQoE9gXpCyXercXwJwgBBy4/PfjY+JnUaVBfUGo4Jf0vqqZI+ebT1f3zH37cFG+MT4QZeYc9YCRcUxa1QSxDzERmJ1GpVi/pv7xIxmDTZIxmJHjs8W8HGpLWuYvkZN3OzY7lIjR5K6UXsc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783894781; c=relaxed/simple;
	bh=0pBg2Zvhy3lLlv0pJ3JysI/SLTC+HlufjfVrN+eNtaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GzJu/1DyIdDbBDVeiahlBBOaxILfiMK8+InET+ckLhPe03aWpcPkq3QhooxNm8D8C3BnRO1j21riYeLmYQYBdr9h++apImhKeVgGlKgMlgtIs21p5fyuSHS1EZGjZlqzdPVULWP4ifBc+BA14xz9EyzPxMQIcQ0bMtBjpYcdBxc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CgzVsmcA; arc=fail smtp.client-ip=52.101.201.35
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vvLKxktm6CH3omDWqO0E6G7mUQ9+W7u4yPkroNsGFrdcIrid0xKQmUpNy9pG+iOYr+jiSlt/HtmWD0DLnL07Cw2/IUSl1FE0E4GqBZgP3U90Bx0IvwOHd8yF/TM/pWKVXxngP1JVMlfsoIJRzuzwJonhOaohvLl81aBgzg2OJto/UKrGw52hPSk+sZiN+sNtLKoP7JafoVH9VhtIFDzLT4a7Tdr3R0L67VLheWRGHjJ0iDZPoULuXaccAlHrJBzgURtpK8ASK5XCN2/pGjG2WCUDFaaOmT8WMBUIR28SvVL6K1xnf3BkED7LJJ0L1frc/AJBe8fmYAANIxBpg5dMSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0pBg2Zvhy3lLlv0pJ3JysI/SLTC+HlufjfVrN+eNtaY=;
 b=SdfgRqFG5Yc3yS6v78+rpizimGT9qlYgWh6C/7oRTFerpZru3qFoVS6wnL1rWxrrGMdyplnKuWL9UK8EwiHIgT1v2pMrToYuXMqUUXLnFOtrNC4AoK/vwBvxVhLvNulnqVb2R35R7fYUKmoJ35ENb8zE+y8GYBAjr1zH76ZJ81ScfJbAsWHFnxI7Vfgz4T6ad+BSRs40NzS3RpSQu5tJagPclFN3EDP6jyDNnrEpBLwOJHPA38uOlE+C58ntgGD3jbb7vKduQHjpKl0IsEPuTzCBzfw1fyPsVXjzOvs4WwmXvuufsrYqCnYgavg9Y9PL6JUXnxxVMx8DdStwK/VKAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0pBg2Zvhy3lLlv0pJ3JysI/SLTC+HlufjfVrN+eNtaY=;
 b=CgzVsmcAEZUT8jRY8JYgUkoxjK42axn/oRcFYYJ1ztQXr5ZNf/w45Pmyp2Um3/v7EQlHL8u1ejQ2QInfpzS2u53f4DwQFUCBc+WcTvCLa9d0gnP+3D3jrr7zPJ3W1bZxrDt+wvsef38Vb738+2D3H20gpZPf4QfOj5ytPjhqUZU45NB/HCaAJJZc8L/Ar9F/P9xx/vVca3drp4JNsUXSZpgx/c9DV3XMOsWq4f+kVWyrR2WSi4MiYs3kSLnPrp6SN1LRTRux+13vjqNIInxUsX8GaFAhmwvQ1+jHCZjisAEu/41dG1UpPPNpLdMx6v02JUSi9rzF9nN2GrNSMWYiYw==
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by SA0PR12MB7002.namprd12.prod.outlook.com (2603:10b6:806:2c0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.19; Sun, 12 Jul
 2026 22:19:36 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0202.014; Sun, 12 Jul 2026
 22:19:36 +0000
Date: Sun, 12 Jul 2026 19:19:34 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: Xu Yilun <yilun.xu@linux.intel.com>, kvm@vger.kernel.org,
	sumit.semwal@linaro.org, christian.koenig@amd.com,
	pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
	dan.j.williams@intel.com, aik@amd.com, linux-coco@lists.linux.dev,
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org, vivek.kasireddy@intel.com,
	yilun.xu@intel.com, linux-kernel@vger.kernel.org, lukas@wunner.de,
	yan.y.zhao@intel.com, daniel.vetter@ffwll.ch, leon@kernel.org,
	baolu.lu@linux.intel.com, zhenzhong.duan@intel.com,
	tao1.su@intel.com, linux-pci@vger.kernel.org, zhiw@nvidia.com,
	simona.vetter@ffwll.ch, shameerali.kolothum.thodi@huawei.com,
	aneesh.kumar@kernel.org, iommu@lists.linux.dev,
	kevin.tian@intel.com
Subject: Re: [RFC PATCH 10/30] vfio/pci: Export vfio dma-buf specific info
 for importers
Message-ID: <20260712221934.GF674038@nvidia.com>
References: <20250529053513.1592088-1-yilun.xu@linux.intel.com>
 <20250529053513.1592088-11-yilun.xu@linux.intel.com>
 <20250602133009.GC233377@nvidia.com>
 <CAEvNRgFpJWQ5M5sQhGpQUV3GbBq9N+MQhhaxdxa=D8ky94SCsw@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEvNRgFpJWQ5M5sQhGpQUV3GbBq9N+MQhhaxdxa=D8ky94SCsw@mail.gmail.com>
X-ClientProxiedBy: YT4PR01CA0464.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d6::21) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|SA0PR12MB7002:EE_
X-MS-Office365-Filtering-Correlation-Id: c652ef0a-4174-4e03-917c-08dee063a7c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|22082099003|18002099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	+0BoDsQdCifYoL5unJB6kmCzcnjPsx78Sh4VsfABrl8txWgnRZQfl2o0elPbodbP1Pyk3qZoQngUV6ivi2VsX1DHaPjFNXuouc+6rBqKf6gSLXhNCOwmSnwIwMAYfCK2LRv0HDI3D/hdsObPllthiqPT+EKoShiUA2x/RFS3QVZLjNXrZ7PHKSfThgEWdmmnmD6BV8qSFrXArYf8fIc5qb9dkHNahOo50P0Xf/kGuOGdRSQWVJ3I5ULZbFnNIBHGm1+/eD5MPejRQIzn1kHJ7iuEoAWBvCIzcU7rbY654J3YBtCWMZn4F9VgbhIYxISrEKBL/3AZmKvVYoakxeANw9na76lULQ7PIa8lIUySFVAOXnJyQm/0rQgbSKjYf88/efmtwc8aWRKHTqUBLwejb+/Tb76D9KTapJMWyTibVQP/MDwyghHPBIrIoUC0+/qjVtwYrG97m8q28/v3DFhgeQxn9J7doI6fX1uB+N7OHQUmluiwaNd1Y/7SSRDKj6h5tL/K+sscWmyRrgVT2uKqPpKwm5VSfAOtb55J/lAvDaOdIOEjpHtJWpVJnq2+b4fCnukPy4qj0Ki6wYAUmm6fCGeKQfrcWNlaSv1+BCd3A4H9ExlQEnh4pEUTZP5nkYOiKAA6b0QJ5ySLMYLzqm9S4g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PP/6uM3A7aRgjy5635Ioe8Fy4Uk04JmBb1B7yp16xRVpSVSrca5isDQA0EZa?=
 =?us-ascii?Q?yP8odGKGEl4L0b+NbgH9/tXw7j4P3Pc7mSvNyXXWkm0dYuV4dHwlQ7ysksWy?=
 =?us-ascii?Q?mcC/B2O9VR4Cg/j8U86DlEucdd3hDX0+aKS89bGOsBJXnY43IMp1R7XtGtL/?=
 =?us-ascii?Q?D12m+FQ0kWQaA1n15OlYBJpCQRpQB1IW3ejW1T7hqQuuN4PnWCrmdtS1KRNh?=
 =?us-ascii?Q?4jY8Qox11ErJCDlIKjjRYxjYo6D5AssMbqGEfNsJt5yVZQCPP5p4dcLeRe+v?=
 =?us-ascii?Q?2UJSJFG6qy5VynthH0qZcu7wrdwj7dMRyMKtFLBhkYyNsXFhodVrcMTOYcGL?=
 =?us-ascii?Q?AJmwx5QG9foCZjztUrklb0YeQgHcqB+BSMcb9dY/r2pChCjyKs664hTMit1L?=
 =?us-ascii?Q?GTest/BuszkMip3DzRiq/QethmWK01RaCcGldQyzsbo169xaLgb7HB/LA2eS?=
 =?us-ascii?Q?xp1NMOZuWwD4iWpTvgV49ltKskhUl+sOnKZVMbLxZtYPWcuUGxki56JuYtrG?=
 =?us-ascii?Q?T+Oj8UcRb5sHO/AAlupDXRvZ2g7CrI72Pe7BoH45KOIZnKVYFzDa0g97w3pS?=
 =?us-ascii?Q?SoK1Of3JO6x5Vb+XuCw3SAu99WFNIO3MTTJ0b8lQqkRwWaQtXaW1Czorbr40?=
 =?us-ascii?Q?s0J1ZBLZjwA6nn7MadMzGL4iKIrqoTzfs7drET1fcCxWx2p6l6fRtdF3CO2l?=
 =?us-ascii?Q?MFJa0+QrtpBgtmsnu9Ms1Y4bOeNGY5BnD9AAXHBmvaXmabySm9yXtVkbR04n?=
 =?us-ascii?Q?jPH8AmF3B7pjgsQj02W4jWOKdVpv6ndKCLJkrDRg2NZ8knNwZjVJNR5B/wCi?=
 =?us-ascii?Q?ZGARIU3lNKqKTiJWBrmKmqrLEb2BJkQ4B7UQo3cwOh4405p9ADyoTP+Epco4?=
 =?us-ascii?Q?oXeB5OXD3n5MlkZ+DPe/1ZXTDneaIMkPClm4A63T0EAic/alaMcKub2WM5Te?=
 =?us-ascii?Q?T0WcMrPxgF1rE0G6l1e74ROFHiXQU0kXM3yBufQqCRQrYlvGmvg4WWdZt0eE?=
 =?us-ascii?Q?ELO+tObx775FtAMgYrvM2rDyGVM2HIVORPyziPN4kPZdVG0X8v83LseSlnzz?=
 =?us-ascii?Q?KM4G++qOc83QmiyYhli9UU7fMFoPr1uQomQsWFJMDYqkcrcXFQPzVUQoODz4?=
 =?us-ascii?Q?JONyfxNMLCKeY5Ls3jWYihn/snpIkxtaqBuNPIHfuG8t6SxKaeM21TcwKOps?=
 =?us-ascii?Q?I9a75hTn6gNHr5C41iEFcbtRc641FA1ctfft6cI2FXevbimotkuViGgx21YO?=
 =?us-ascii?Q?zJr8I62/iI99kGIBC7rxeW7U5poVyW22wLaXCd3ihHdzTBOyb+x+X6hESW0J?=
 =?us-ascii?Q?Ashe4IERR02ehIzeLgo7uS6u3vP7tWHNgwoaifihrY+F5AwDuNzIA1D86HqL?=
 =?us-ascii?Q?tr3/sc7zJX6JFsMqCODt5OingKVSsOPTxkuymGQeV3UxBlsXdAeQtm0eFSiq?=
 =?us-ascii?Q?knz4fosr8UdsLDxnkB8+CjqC7nAT/JgwfBGUXzFtatCe81JLLvP2zvlS8rdw?=
 =?us-ascii?Q?gbsfGhlgVC88GrfV5nuNWyEs4LDETur/O51gqmfQSY7vSnHW773yfwcyRDqB?=
 =?us-ascii?Q?Fb+Lok/5dmpprts22q+H2E7dbGDmx3E/iwoolCFVyiV7QQlrNB6ODZezLgut?=
 =?us-ascii?Q?gYLpq2f3dWDu5u435JGCarg0wlo6u6oa8hHonlqIMh2tPg9MuFEWcrqFFTDo?=
 =?us-ascii?Q?9QaAQz6p1cIpkCYBjfsURHM2GiAbUsXHQmhcmzuV7vxFO0+D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c652ef0a-4174-4e03-917c-08dee063a7c7
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2026 22:19:35.6936
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5vCmbWngIZj3sQddl8ImYB+v0kJNuT3fM9CizR2Yk0OoCtju6dYYgOiPy1yIfPd4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7002
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.16 / 15.00];
	WHITELIST_DMARC(-7.00)[nvidia.com:D:+];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67417-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[jgg@nvidia.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[31];
	FORGED_RECIPIENTS(0.00)[m:ackerleytng@google.com,m:yilun.xu@linux.intel.com,m:kvm@vger.kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:pbonzini@redhat.com,m:seanjc@google.com,m:alex.williamson@redhat.com,m:dan.j.williams@intel.com,m:aik@amd.com,m:linux-coco@lists.linux.dev,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:vivek.kasireddy@intel.com,m:yilun.xu@intel.com,m:linux-kernel@vger.kernel.org,m:lukas@wunner.de,m:yan.y.zhao@intel.com,m:daniel.vetter@ffwll.ch,m:leon@kernel.org,m:baolu.lu@linux.intel.com,m:zhenzhong.duan@intel.com,m:tao1.su@intel.com,m:linux-pci@vger.kernel.org,m:zhiw@nvidia.com,m:simona.vetter@ffwll.ch,m:shameerali.kolothum.thodi@huawei.com,m:aneesh.kumar@kernel.org,m:iommu@lists.linux.dev,m:kevin.tian@intel.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@nvidia.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nvidia.com:mid,nvidia.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 923A7746237

On Sat, Jul 11, 2026 at 06:01:31PM -0700, Ackerley Tng wrote:

> In the course of a CoCo guest's operation, will the guest need to
> convert between private/shared MMIO? Will the guest need some pages
> shared and others private? If these are required operations, guest_memfd
> already provides the tracking and is going to have a conversion ioctl
> very soon. Instead of further extending dmabuf to track more things, how
> about letting guest_memfd track it?

Use another FD type was sort of my fallback if we couldn't get DMABUF
into something workable. I'm kind of surprised to see guestmemfd
proposed as the other FD, but I don't know much about its insides.

If VFIO can create one and fill it with MMIO physical addresses then
maybe it is OK?

Jason

