Return-Path: <linux-media+bounces-44945-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DBABEC605
	for <lists+linux-media@lfdr.de>; Sat, 18 Oct 2025 04:49:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E338C35289A
	for <lists+linux-media@lfdr.de>; Sat, 18 Oct 2025 02:49:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12D12283151;
	Sat, 18 Oct 2025 02:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W7sXnGOO"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAD726F478;
	Sat, 18 Oct 2025 02:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760755718; cv=fail; b=Wsn+rjo8yv9aXHJUA4ascNFN5MIleynDd3oDsXUZagcQGRxRkC6hQIaQkyh+YPBQQIAcJL6Iyz2HQ2d3U90XxwK071+JbrMnTkBdJDp35L6kC9G0tC2ZGhKVcKWpL7feayBtCnGI1X0eS8gRZIBwOsFFAFnUGUBIDMJ+ptGfyWo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760755718; c=relaxed/simple;
	bh=G2Y5eIgkpN0jJyD72WTtv8hl7rCli3kdb/6jFsj+pLY=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nk0Pt1JywS7gQbEetsCS/pfQN7juuBP3zaz+xOiuvt+GUp309yx2PN7aL19kx1yxDuUU8F1FYkflvKs30sHUe+2La2jSyzoMyn4wCU2Mj2Is9qMxamAogZCTPelUFqC5y0dCMsjKZ0Ty5YrHTaW72eKsF7xy5p+lj9cw+sGEQkE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W7sXnGOO; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760755716; x=1792291716;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=G2Y5eIgkpN0jJyD72WTtv8hl7rCli3kdb/6jFsj+pLY=;
  b=W7sXnGOOjDRJbBzuLD72+7sAfE1oxdwuuzqFfxrdAFsuKtIbsN9BhI/u
   tjPSJkalKv/s3oNj8FjcNwXGMm/S2IxuKswqyd2HM/SGj9xhzm6ej94iV
   ChI6saAcEb418OrMI2a0K3eZpAvYAHArJoEGem3vHLANZcUsaP0PMjC+o
   wp95pVsF9oXwreMPcDAU5DnH8v6YUijWyK+hkmUmwjoHn2RiDsP1Abr5m
   O5jx0FdMk7ZDD3fk5dPOx/GiNtplOgqrSFeXLXMnQW/N4tlAzS3P0flXM
   EdozwL+MT2ibEE67t7yeYxlhaQx0/aMtDcD3TuYoydXI/xZ/izcmLAOHX
   w==;
X-CSE-ConnectionGUID: Poc1eVLpQC2bo3Mp1d3I7g==
X-CSE-MsgGUID: fQ7lI4d4TI6I0yILXKtbYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="50541622"
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; 
   d="scan'208";a="50541622"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP; 17 Oct 2025 19:48:36 -0700
X-CSE-ConnectionGUID: m4clNzP2S5K2he2MTwrbDg==
X-CSE-MsgGUID: EjMBvazxQCeVRd/gU/yPHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; 
   d="scan'208";a="182819001"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2025 19:48:13 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 17 Oct 2025 14:28:08 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 17 Oct 2025 14:28:08 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.12) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 17 Oct 2025 14:28:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YlSNdnpnx491DAmCtLWwWqflFQ1asy0M9NbthgytgTf/8YXyuRk2fiv/jQTiun7Z2peR+KKkkYJFWBARCCQZUfTLukx3OvJ/mq+sUEXOEVPQGI3fTRGP9m2H7lHJGJ2NC5kl0KULM11svHk8KlseJAsb2BWxrv18hkOfdDA7/M+HOwKCpaomv0NMKHc7t+44fdw84yxBQbUJ6HlHu/gzurkTp6CsivF3pK2R49ihPQhwbdnWi2sSbMM+72uPWzF3XoskwDH0jdzrEAnwbonef5clH3/usN4KRQpSQ/D0sZGNLuYAc3J3VkjTgSdSdyWbuq/mg4MwyitZN51xWkTPNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/zBe4jwdaPVDbmTMczGZBLCP3Yqj8Dp+mkpxi/5aWeM=;
 b=QULQFGXeCr4lYX+KfGAf5gjWKuIrTvLGf4X5mLjPojmDX7VNrGrH4xjgJoDXI6THmTmGKgz8ohNTxzYaCFSCrCl8xuOocjjk1O/okg44TKfQUPQlq32EGQHNPuQ+vI+ODR86xkfbfdLFNOPZGQVI7B0TjRa3huCvXX+KCqCbtScPiCB7IPyAoWUOziSSe1o8sLbMK7GsoGVqSGzoZVLwtO+qwrg3FaTRvUkTKwRECuOCKOFQYWbeXje2twNRT1updR3DGQOIFnfgN2yOf876FNZXwD90lzBuI/QpVDsEhTEs3022nLWvnBYzdEDALZaxTh8IbilqFzgMsIIRt6NFWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB7749.namprd11.prod.outlook.com (2603:10b6:208:442::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Fri, 17 Oct
 2025 21:28:05 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9228.009; Fri, 17 Oct 2025
 21:28:05 +0000
Date: Fri, 17 Oct 2025 14:28:02 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Philipp Stanner <phasta@kernel.org>
CC: Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan
	<gustavo@padovan.org>, Christian =?iso-8859-1?Q?K=F6nig?=
	<christian.koenig@amd.com>, <tursulin@ursulin.net>,
	<linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linaro-mm-sig@lists.linaro.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH] dma-fence: Remove 64-bit flag
Message-ID: <aPK04r1E7IbAZ9QY@lstrano-desk.jf.intel.com>
References: <20251017093146.169996-2-phasta@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251017093146.169996-2-phasta@kernel.org>
X-ClientProxiedBy: MW4PR03CA0112.namprd03.prod.outlook.com
 (2603:10b6:303:b7::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB7749:EE_
X-MS-Office365-Filtering-Correlation-Id: 274244fd-1bb4-42d7-a49f-08de0dc40efc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T3dycGNTZGJYNlBBTitjQysrMUFNQzBHcExoc1FRWjFveWNjaUVVYVd2KzFl?=
 =?utf-8?B?MTJjMlpxNW5PcUhCc21wNFVLemRMSWQ0Mml6S0xoT0dFdm40SWVVL3Z3TStR?=
 =?utf-8?B?cllSS25qMzFjMTBYZzdoNi9EMEpGeFY2cFAvRG4vN1g2TGhENXRFZ0ZyZzNN?=
 =?utf-8?B?L0UyN0hpRDFkT3lBUk5QWFBCSndzZ2VFK1BVYVpjcGpIZms2VWV6d1V5bk4y?=
 =?utf-8?B?bnYrRFZnUWdWbWRoWUVxWFYxekNvaHJnSVkyU1FUTDRvRFpEaFlzZ1lxWjZV?=
 =?utf-8?B?YWJ1dVp6clpJMVhFQkZxV0dxdDhDT2wrWmNrWXFaNDFkZ3ZWOTk2aENjd1pM?=
 =?utf-8?B?Tk56Ump5eGkyQ0ZtRHdLUmtucEYwWXJ3YXVsRnFaVVRxNWNzNFExRWhCSk1p?=
 =?utf-8?B?eUpnZU5qNnNxSU5KdjBJVW1mdWJzd29CM2xNUkpycXhsekJNMmV2MFVmNnlG?=
 =?utf-8?B?RlI4bmVjWlh5dG5IMnQ3S3k0L2tacTZsVXF1TzdCbmQyU1gxbkRVUEhUTHdq?=
 =?utf-8?B?WjBOMGVjRWRBRUluZTVmUHdOQWZSZ1JtTy92N1RTc0dZTElrNHZJK3hpNC9M?=
 =?utf-8?B?TWR5YkxhZ0o2c2VQMW9UQy84MUpVM3N1OTJCc0xUczUrbFBjQldNMUUzb0NZ?=
 =?utf-8?B?djNrMG9RazNIeHJNdno1WWZNTzR5STI5MFZ4bmxOWGd0ZThUOHVnSWxsbzJz?=
 =?utf-8?B?aFREdzBYM2JObVpCa0JFNW40dzMxeVdTYy94RmQrSW9DcFY4NFFLQ0FHOXJj?=
 =?utf-8?B?RklnQkJXV3NadUR4a3NhR2c5bzliNzE4bmRaWXdYaW9aanI4V2R0MHI2M29y?=
 =?utf-8?B?RUlCc1J5ZXo1bmJWbm9DOGxHVy9Pa2k0SjI4M0c3Qzd3Q0ZrQWY5RHBlcjI5?=
 =?utf-8?B?SUlpUXFqTWJkSmRqcm9naEl4TnJmdUhRcVFweXJmWnRMZjVJeGZrWjZoa01J?=
 =?utf-8?B?cm55Tm9xYWorVXczZy9rM1R1VjJDWGNQTVVUc1NqeDdTY3FSVDlDZEFvbFla?=
 =?utf-8?B?WG5UcGtVMzRqeUtUNVhNWE1OeFo5SFVaQU54cFBzTUxyMEkwZ3dQMWxxeTZP?=
 =?utf-8?B?QUU2SFBhZmh6Y09BYis3eXdibUdmR0JQdHNON1E5N3RSaVNzVENJZ2M0Yzdh?=
 =?utf-8?B?YmR3cU1uRU82ZDN0VW93OFZybWlWUFp3L1BSUmZEL1Y1OGx6elExcWF4dU9E?=
 =?utf-8?B?Z3lXVmZaR0tmdnE3NlJFeHQ4TXlJUXdVdUVuK1FocHgzbXREYnltVEhta2VT?=
 =?utf-8?B?SXpBZEFUeWNYK0FNd29UdklPaStpZVBVdkhMbERVMlVVdi9vQmhSVVdCTTRk?=
 =?utf-8?B?OWRwR2xoRVFjdmM2QmVxV1hzZTlJWWhpS2U1REU3OWdMUy9xNHRFLytkZmtZ?=
 =?utf-8?B?dXB1SWhLamUxdlpESVNVRnB1RzBYbWNZakVmSW5YQllGNUJQOGNVTnRoTW9j?=
 =?utf-8?B?cTQ4S2pnUXJWSlYzeEdaZ0FPMzdvOVlrN1hKTHN4M05SZURTeDMzenVaYkxv?=
 =?utf-8?B?aERuelRJS1pFcWJZYnFpUno1V1BRcHYzMVRNUVJKd0Q5ME1uL1g2UkR0eDl4?=
 =?utf-8?B?VXpEcHRia09LNmFKdlUrb2hPUkRzOGNDaUlLRFFWeG1kUFdITW5ENmxvNmg2?=
 =?utf-8?B?c0ZrVm9ZNnNLOFJTY3QzTWI4YVkzMUtQMGxjOW5Xd2ZtZEhBeFdOeHVvNHdB?=
 =?utf-8?B?Sm56RWtwRS82RzRLMURTb0hWeUFZaEFoWlJDNkZzNWM2TVZiOW5FTy9EL3NV?=
 =?utf-8?B?cnduclA5NHdyWFNuSGg1Y0ZEZGVvVHA2U2pWa1RXemVpVThYaEw1UE9LMkxW?=
 =?utf-8?B?WW5MWFByc0pMVnU5bXlBZmlnd3BtWWxJUnFrOGt2NDdJUUttS1ZxdDNoZGJ0?=
 =?utf-8?B?aUVET0ZNNXNGenh3M0h0MVR2OG5TM000NEwvN3RITmhuWlE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6522.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0FEc2FPMHFtWC8vRTl2eU9vbS8wbVMzdllJbGQzdXdKQ0MvZWRoVjlqTnNu?=
 =?utf-8?B?MnlqbnV0MmwzMnB4YTZZNnhSK3RzaHFPSCtGK2tCelZmbm5wbnI5THVqSWtZ?=
 =?utf-8?B?ZkdSTHhGdTdMcGp3UGtNOWRQaW40K3YvRG13ZWxCeDJvUnc3S1dIeGdrK0xW?=
 =?utf-8?B?ZE05M3lNQktlZnFMbGk1dmlYR2JIdnlSdm9TWWY4TGNJbmhsQXJHRHRKZHlL?=
 =?utf-8?B?cGVRdkUvYWl0UVBPOU9qZjR4TGtqODVuc01wbHRMUm9BRTBidzE3dzlnSDZ0?=
 =?utf-8?B?N09zNUsrZng4VUNPNTRmQ3VMSUNyaStQbktYdVJpQVlVVzNGZDNjWlJLUTV6?=
 =?utf-8?B?WWpSSEtsNUdCbDZaZGxscE55L2pibnVjTU9wOTNtT2ZGQy9qT29TT1BjclE4?=
 =?utf-8?B?Y3FhNXF3N3VBSmh1czJSUFc0WVpnTmFaSW5UaElpVjM3TUlNV05OYXU3THVz?=
 =?utf-8?B?dmFxc1VXOWk5SjFoM29oN0o2RFBIa214bHlmb3czeUszaHIzMEdPQU9KRGtq?=
 =?utf-8?B?T2hwNHpXbG5rQlZFc0RmUWhPRGxyY2pSaVZmamxVYy9iVitpbjFEWEtaMTBF?=
 =?utf-8?B?dzRvMmN4K3NXOG9tb1h1ME5Kenk2aWZOUDRYNHlFV0lNNTJhTHpJcnltSWho?=
 =?utf-8?B?Nitqd1dMd0VGQ3AySGFneENBSkJnaWtBZ1NlWlQ2QXE1ZlhiUk9iWXlpNXBK?=
 =?utf-8?B?WjdQNXZzaEp6WVk3Z2VNcEV1RDZnanc5RG5Vc21kQkZmK1VQWmRWdENJTWg3?=
 =?utf-8?B?ZlJIZEI0cm45UTZGMjNLNGtDNjdDR2xZbUFwR0JMZFVNSXY1dlc3ejYweml0?=
 =?utf-8?B?WXZsQThUcmlObDJ5Qjhva0FNMWRTeHM1Q2ZJN1d6ZUkvdUZPTnhML0NyRFVr?=
 =?utf-8?B?Z3ZRbi9wQ0NPVjN5c0hpQUU0MjYzRjgvaERnMW1uaVcvRE5VcmwzRjRsR2s4?=
 =?utf-8?B?TnVwRFE4VmI0ZHpDRjc2QndwY2RYajA4b3VpNmlnWkU4dDlRd1c4UG9BM1Vj?=
 =?utf-8?B?UW1ncnlsY3NaeDVuTXE2eHF3ZU03N1JsMi9lc0V4ZWVVNDBjcGl1dzE4eS9Z?=
 =?utf-8?B?L2RBQkRBZkZDQlNBcFZad3kwRTN4MXcwOFRCVTlqMHF0cnRSL0Fwb0tpV0Fl?=
 =?utf-8?B?cm5kWmVvRGRkRGtXaDk5MFFkOG5OTW1ZMDlrd3o4KzI3Q1RnY3BxaGpxNnJ2?=
 =?utf-8?B?WGZWZ2xWMU1yTmhyd1lLU0hOK2wvQzhlL3dQOUk2NEtTQUlIWGJQWUROaU8w?=
 =?utf-8?B?OG04WHdVSW9pNXNlSEQrU2RqckFKTXlPRDA1TWZIZFh4Tzd2WDcrcE9iU05Q?=
 =?utf-8?B?V1dOY0JvSW5iUVZaM3ZQREFIU1N6WDRRakR3dVN2VWwrZ0t3empUYXF2OE1o?=
 =?utf-8?B?YmNtY01qTG4zMFBTa2E3eE85by9mdENnd1NkSE9zZmZJOElCNWJCZDNwdVo2?=
 =?utf-8?B?RjA1Z2ZIc0tsUDI5LzRRc2wvRllnOVhxNzZuRk15eUZhK09DbEI1QnBValJk?=
 =?utf-8?B?YlhMYlY2OG9yTm1hbEdvUmI2VkxEZUZRcFdlaUZQSVFJNzVNU0w3MU5vVTE3?=
 =?utf-8?B?ZU16eXZzSyswbjFqWVhBZ21RYUp3N0g5SjhVVUVtZEVXUUJmZVF2YmhuMWpj?=
 =?utf-8?B?V3Q1SmM2MHZEZFlpNzlZQlRYZEwrZld2Zm8xWTJYRnJMbEV2VHI1MTZjK0kz?=
 =?utf-8?B?OU1TQ05WdmJBS1ZUcXZMMVRwbnhGcVVIbE9nMkdJeEpQVVNnaExiYVFCU0RF?=
 =?utf-8?B?ZW1kWWdjVXgvZ0taWXMwVExxWU43T2lxbjdsTmYxelFpS3Vab1kyWFdTcHAy?=
 =?utf-8?B?a0didTBLc1NEUEJzZEZaTUluSlpnaXc4UU9xQUV1KzhlYWU3TDFZMmVscUJP?=
 =?utf-8?B?RjNkQ2w2TTJDSkhYUnBXUVJCb1dieGFiT2tPNnlvSUdmMXV6OUJXNEwxbEY2?=
 =?utf-8?B?dHpIdjFFYTR5Si9RN0hvcU1FTWlPd1pGNUpXM0tVK0ZpQXVHTkxlSGtkQVpu?=
 =?utf-8?B?WEpxdWN1blRJSGcwUHJGVEI4cncrVk1vaHhPWmlTV004cDJQNlhJTTlsd3N6?=
 =?utf-8?B?dTRZRVgrZ1ZLT0c1NldMcTR3azhGWmdiQkdJRmZOTGN5MTB3Q2xGTUF5bExR?=
 =?utf-8?B?bzVoRUZtTGo5dVZETnN2bmQ0MytDR3JsaHh0M1pMUi96WjIrdFR2Vk85VU41?=
 =?utf-8?B?NVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 274244fd-1bb4-42d7-a49f-08de0dc40efc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 21:28:05.0393
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9MVXPWWeRATF2wpIwgJnQKB0jErq1ZetIfp17ZRLGfqNoMHIf60zoR7uUlBbAgHWiaTV8NIKhQFLX7OAbL4tkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7749
X-OriginatorOrg: intel.com

On Fri, Oct 17, 2025 at 11:31:47AM +0200, Philipp Stanner wrote:
> It seems that DMA_FENCE_FLAG_SEQNO64_BIT has no real effects anymore,
> since seqno is a u64 everywhere.
> 
> Remove the unneeded flag.
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
> Seems to me that this flag doesn't really do anything anymore?
> 
> I *suspect* that it could be that some drivers pass a u32 to
> dma_fence_init()? I guess they could be ported, couldn't they.
> 

Xe uses 32-bit hardware fence sequence numbers—see [1] and [2]. We could
switch to 64-bit hardware fence sequence numbers, but that would require
changes on the driver side. If you sent this to our CI, I’m fairly
certain we’d see a bunch of failures. I suspect this would also break
several other drivers.

As I mentioned, all Xe-supported platforms could be updated since their
rings support 64-bit store instructions. However, I suspect that very
old i915 platforms don’t support such instructions in the ring. I agree
this is a legacy issue, and we should probably use 64-bit sequence
numbers in Xe. But again, platforms and drivers that are decades old
might break as a result.

Matt

[1] https://elixir.bootlin.com/linux/v6.17.1/source/drivers/gpu/drm/xe/xe_hw_fence.c#L264
[2] https://elixir.bootlin.com/linux/v6.17.1/source/drivers/gpu/drm/xe/xe_hw_fence_types.h#L51

> P.
> ---
>  drivers/dma-buf/dma-fence.c |  3 +--
>  include/linux/dma-fence.h   | 10 +---------
>  2 files changed, 2 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index 3f78c56b58dc..24794c027813 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -1078,8 +1078,7 @@ void
>  dma_fence_init64(struct dma_fence *fence, const struct dma_fence_ops *ops,
>  		 spinlock_t *lock, u64 context, u64 seqno)
>  {
> -	__dma_fence_init(fence, ops, lock, context, seqno,
> -			 BIT(DMA_FENCE_FLAG_SEQNO64_BIT));
> +	__dma_fence_init(fence, ops, lock, context, seqno, 0);
>  }
>  EXPORT_SYMBOL(dma_fence_init64);
>  
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index 64639e104110..4eca2db28625 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -98,7 +98,6 @@ struct dma_fence {
>  };
>  
>  enum dma_fence_flag_bits {
> -	DMA_FENCE_FLAG_SEQNO64_BIT,
>  	DMA_FENCE_FLAG_SIGNALED_BIT,
>  	DMA_FENCE_FLAG_TIMESTAMP_BIT,
>  	DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
> @@ -470,14 +469,7 @@ dma_fence_is_signaled(struct dma_fence *fence)
>   */
>  static inline bool __dma_fence_is_later(struct dma_fence *fence, u64 f1, u64 f2)
>  {
> -	/* This is for backward compatibility with drivers which can only handle
> -	 * 32bit sequence numbers. Use a 64bit compare when the driver says to
> -	 * do so.
> -	 */
> -	if (test_bit(DMA_FENCE_FLAG_SEQNO64_BIT, &fence->flags))
> -		return f1 > f2;
> -
> -	return (int)(lower_32_bits(f1) - lower_32_bits(f2)) > 0;
> +	return f1 > f2;
>  }
>  
>  /**
> -- 
> 2.49.0
> 

