Return-Path: <linux-media+bounces-20762-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6104E9BAD5C
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 08:43:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21244280F12
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 07:43:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03C82199E8D;
	Mon,  4 Nov 2024 07:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nbQsIg0J"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7756818C91D
	for <linux-media@vger.kernel.org>; Mon,  4 Nov 2024 07:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730706181; cv=fail; b=HTY5kW9EDmu3P2E58Rk5aA60A9XoMo9H3mQkOaUw1axn7W9wityfXAR9B9ALmvBCy4iiddetU+dKc0VKiGmk1dDh6vJ+lhOpC8uFZITCF3vCHh/3NgBPHgjJxX1xVcn0uTxersiCQOn0fnm6Byc7vw+RvFf+6btedt4/KcJ19pM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730706181; c=relaxed/simple;
	bh=NoPTjtN3XME6flgxH/hioVy3CvcFV0K1DWBc4NVMQ4g=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Ow06sU7Neu2UhL8LDwq8A0QLxJT/mdr6/gmxwqRewWPhTStEDjE8aKP8Xy1OItVPr/2UFUqxkTImv7qjYXH+yezYnpTb6ED3woHoevmuVFdrBdx2GlYp+E+Lulkurk9CDbxvI3R2Pr8uErhRx92h2qbNTmmimkDepOluG4lKWmk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nbQsIg0J; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730706180; x=1762242180;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   mime-version;
  bh=NoPTjtN3XME6flgxH/hioVy3CvcFV0K1DWBc4NVMQ4g=;
  b=nbQsIg0JOwL/a/B9EW41n55STP0HtVB0aCvlXuNsa/KZWt3zswCCQ1JE
   qxDQkC7rsuw9lfRe0FtsogijV3+xhtJp67UODDFdq/PF/Mac8s9MmEPTD
   Ej20go1XxZY6KUT6UEQSjNZiYcI7ewOIfgr3I9tqmLUqwUGajo1Aw4gsW
   HROlxRUAly4o0qRqHTrDm+ARTVPoFK+kNPAGU2clmzPsjlw2pg+a748tY
   r59PJ3U8HfFE94gUVwjai/B6weRCGvb0PAlF627e2rAmFf31Ew66gALC5
   g8UTxSgvtLo8gIDNalI95Z7g77ZkqsC4/cmV3bpFhOM9WR5yqV8a+G+m5
   w==;
X-CSE-ConnectionGUID: dPc9t2WhQwGQisGXTY77GQ==
X-CSE-MsgGUID: ACeNpo0lTS2OnilnucrBpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11245"; a="41761759"
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="41761759"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2024 23:42:59 -0800
X-CSE-ConnectionGUID: TwxJxYrfTVKB+9JhhSpsRA==
X-CSE-MsgGUID: 82IC2VgTSNqRnf3YyR08MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="83099859"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 Nov 2024 23:42:59 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 3 Nov 2024 23:42:58 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 3 Nov 2024 23:42:58 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 3 Nov 2024 23:42:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l/bw7i/+hMSCJvSuMZNpJ2bszj7ZgkXrM8m9DYNesdHExcm29gdKwv21Cl+O6gyQhYpWkgb0yv6r58nc7Rg0Gc9vL987FTtBliKpnL6ipW66N8aoLY5Id+8zxR8q99Md3YAGo9TpCIg/xDNk2XwuJwL/QMbYpNBj+v9eYuewavFeFmfY6cm+sAh5OK0aPcDQ9rrE+pPMYhEpy1Skr18jdDdOk1TRVqUp+cadbM1rA4TOqo3DTn0g2ij5QzskumhapSvyl6N75FRTQ3bvsUQXUh1wTg1st/72EeZgn2COrN7gx/gObvmjHdVm+HAPA6tb2jGuf1H6zErT6/Bs3a0kUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gRGJPel0U5YM5ZgmlyVsVPX6st+T9tieDUovSpMx0+U=;
 b=lYE7padROzpOyfVnRdQw42Xm6uByDelO4p1d2/H/hRSigLol5+fu/1gbq1geSnXxohwrts6iI7/9x199a5M8X8rCLjsqyMa30VseSMMlsW9Hy+3AFEkMu7wja7H9Ptuhyd7oK8mtwbJ2f3vTdHm8w4eyxIJCYYhsasQhnnQA1FJUbUB/4kj2s7Ox8F425VG+k/wTv8/0gxwkZB/TbMTPkfAw/dwZi5huvbv2VqK4X81YeLded3Mm4R1vKOgv5yWIk67WviAfSdtULrVc/IlxSeXfylmZRBKJmi8LZuri+zWUQmwESdmq1AN7TiTozOFC27kjbxK10zRUxyRhdvYfaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DM4PR11MB8157.namprd11.prod.outlook.com (2603:10b6:8:187::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 07:42:55 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%4]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 07:42:55 +0000
Date: Mon, 4 Nov 2024 15:42:46 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-media@vger.kernel.org>,
	<oliver.sang@intel.com>
Subject: Re: [PATCH] media: vicodec: add V4L2_CID_MIN_BUFFERS_FOR_* controls
Message-ID: <202411041552.ff2b79d7-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1dd09050-40ca-4c5b-b985-819731140388@xs4all.nl>
X-ClientProxiedBy: SI2PR04CA0017.apcprd04.prod.outlook.com
 (2603:1096:4:197::15) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DM4PR11MB8157:EE_
X-MS-Office365-Filtering-Correlation-Id: 23064e12-777e-485b-d14f-08dcfca44b8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nsH5dOBqRLg+IaSCua7wasebAtXmJaoe758NhnCVwpPf5gRgQ2O2PF+zd3Co?=
 =?us-ascii?Q?A06YbPhdVH85NZrz1ub6H/UiO7pXG/xXc4pANi78BDnAWGhKt0CrTKdod3hu?=
 =?us-ascii?Q?fuOkWNtgu/kXoyJ4xkaa3MVifOfdGBrAlflG26x7AAmhK+HS4KAM3X8/GU3n?=
 =?us-ascii?Q?fYaE3KT9OzOoI3Na3yx+qhTwRyUt7zRzth0khbkfmkV07R3UC0DNXioNaa63?=
 =?us-ascii?Q?6U1BnOcD7H7+hHkgp11xNLgT9pTWQTBuqjmtnOE2BBLUePvW/xJjJ1bA5Ij2?=
 =?us-ascii?Q?1l5cJOUDAP1XQXfD9KX34EWDj9cHs63jl7BvVbvl3DewiMbQlI0zq2ShKxsX?=
 =?us-ascii?Q?HTuxjbnnufjwBhyc6YHy0C3jt57HK2AnLzg21D6F/5bbqN8REKT8cj5JAWAm?=
 =?us-ascii?Q?/BlCd+r3pqZ095QTa3JO9yV3bAEpD4nCNTa4itIfeXVe8seOl6FQHm6+Nyqc?=
 =?us-ascii?Q?BgeZ01gwhI0VMsOHErbM//nzHuOHi4QF5M+oji42VvJ4/NhCVFbjkjPjZF1+?=
 =?us-ascii?Q?lnHxDtKSMXziectFKqxqb4ooTT2ctnI18G7IhstD+6PTAPtFe8N8GK9jEw+I?=
 =?us-ascii?Q?bFNgdoMIcekp3BSpJsnf1T9VqWHH1llXV2RlRSDTgb82FTH/NMz2UaC1HXzZ?=
 =?us-ascii?Q?QBIBQU617cO0YPHcVjiDxH3ktA9XN605FCNpqL8xGh74sZoWXr2tFkftTSY7?=
 =?us-ascii?Q?SG2yypaEQKLp6GzW1CpaQFyOy6oSeJ0KfApWS+R94UdmugWxlhu2Q3wmavtP?=
 =?us-ascii?Q?H7JYZm2HwYWFeB72KeAXriZk08sMSHA6qCuNZGmsqG+PRn2r93cmtK3Pkni0?=
 =?us-ascii?Q?Yyyh931OjT54Z09+QnEMxDq8DdIHqbtUfbCb3zhdj+vqRpDLvbHumfPHKrIH?=
 =?us-ascii?Q?x/D4IRHNGKzg/UVETRx7yLSNE2EvCkjy9UTiYDsgYJ+xN38XT7iqmpDgBlEb?=
 =?us-ascii?Q?4FRbmJlaRYMitXxwNUPwUzdrEHFFlSyeC0l6UfToPzf8kB82CQj31NHBXMAm?=
 =?us-ascii?Q?4G3SEugt4mbzcgMb4w3bZghk1VpViFcxIFsLkbUBLq5/AR6eY41DQdvKwQiF?=
 =?us-ascii?Q?zbTRR6hC3KR+2f5J+8l2kkmF0Q2DpIkvrzvrd8VKi8NdRZ1LmcoD8J5QXiE1?=
 =?us-ascii?Q?Qi/oWrAvsXPVE9NtZBgxluLfpRnd6hI0yol20zsAfG9WX+7uZGqq9pj63d83?=
 =?us-ascii?Q?zhjieh40igf52IislqOedpC97x1Qj36LVkDNXph0nsYOys3uKulKbGlJVSh8?=
 =?us-ascii?Q?ZZ5UAs+HFQzC3lQnTI6avajC7KSMxXU2jThkJFdJuQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IS4W1Srf7yfh3W8wUwsx+NknHEFLb84jCE15JoJTO1OQUL6ya2KQdLnpqRU3?=
 =?us-ascii?Q?wdESboDaWN0R9XIbeL33AQnOfkReUvffOa+BA0/hfn+UqlonqgeT62oObZIq?=
 =?us-ascii?Q?kFAomWXWPOtMY/K1jFskjdOLRVSsmdZXVX75eELheMrVpqipathNC1n+i0u7?=
 =?us-ascii?Q?fBAuHda62W+pjitURqngm0zn3nTInIIk4Wi1DPoJ2DGfiaRQC/OdXQ8qCIMh?=
 =?us-ascii?Q?RL+hO1PAw1YTiuOzUnXBNW0Ao0uRb/kiiiSouOfCUopZep7cP1rWTN4RCuAs?=
 =?us-ascii?Q?SHvJqFVcF4cmgMfV+s8j52Db+R4uQ+NITQ5LxwtuEyiBDmz++EQYjrqO+qKW?=
 =?us-ascii?Q?UjqYKKeuvrERxY9mFrx1qmyQGhWClyfjoI/qfKs+dKpnYIURltP5r51agK5Y?=
 =?us-ascii?Q?CxKCbNWp8v7/vCqTQXjJ8tNqTnH5yOqTrBnDB7YjaQqZhS67e30Zao3k4RZg?=
 =?us-ascii?Q?woAC+saqN3rUMeYhL3t8lgXSOArPcHvV1Y3NJaJUromR7EC8YNY92v6m73mP?=
 =?us-ascii?Q?F0vnv6Ha/WFycN3SfxCI/0SA3VfsrihQafH9Pe21Pd0QI2RXx8suXhsHUjJk?=
 =?us-ascii?Q?0sMUCLFFMR6wTXYv/kLB3GSyYF4mNdW9q/gczkfdTETTa0wiGqmXnPwcfDDu?=
 =?us-ascii?Q?bSncCjkuZOvF7mhjwksjjVk8g0eCJfjjrXo3pfSDC8T3TgHQ8Ka8S/ViqDra?=
 =?us-ascii?Q?tC0QHvg2D7e7B9OoJbJdM686X8py+QelG8jVP8GZU2nOPqyaDOCrmclix6HX?=
 =?us-ascii?Q?HGRQWBBebWyYGYrUMUx68+PNG6STnHtGefZiINz3AfcSFtJ04IqUnaxj6Y83?=
 =?us-ascii?Q?eCaI28+ZtPDMhAS/28IAj5uLn+dl/9q02Gfvp3HZpMb/p9FEcABIeA9MLgpy?=
 =?us-ascii?Q?dfmitkFA/zifkWRbkkBTAccRX9DOMSQaK+G4g3JHob0m1hSi4PXoDQhxlFEs?=
 =?us-ascii?Q?oMDxynfBU7o1xEzcmTpQ4TYT8vfFMPhsXRe35AeWSe1FnlSQtbM2EGhNAOGe?=
 =?us-ascii?Q?ziFzuxAlajRTiZUCg2TZa2QdDIyVU+q98tdp9+EJufoXgfNdWoTCbUl/yAyV?=
 =?us-ascii?Q?4PzpT/SFkoZPzXTO4oG4e0yjgfex3WaVIGZOUjrnSAKwO9Wo6xHg20h3kmD+?=
 =?us-ascii?Q?HkrckCmZScRJKSbBrqJMWp3DDr8k0gPM5R9JgXbcXLE6EYXXAt8IZCuiwIG5?=
 =?us-ascii?Q?42TExJ4sDZOlEqM1NB6fr4LoDVOVuieaaY4ORNTX67XeBVCsVLaqw+2g0biu?=
 =?us-ascii?Q?YHR/TlGG0fqawprz05vusUoyIUhe/2ESSVUyYrHt6nNeqI12+0a5oe1S+0Bi?=
 =?us-ascii?Q?3JKHck1OBN1YjuK6fPsSty3X+UbTOTmJELTEygoVgNti7ZoWqEgiTLgsYxyj?=
 =?us-ascii?Q?x5qVNJRf2IUyLT0Cwhz0JIpoL8z8BjsWBTMAMyqmyRiVz2SsMPwXDe8Pr99s?=
 =?us-ascii?Q?cR4UbShhEKZxY42xXIzvd1qfvLjjQW8VKHDfx4/turur+VsLx6ZiuYkl89hV?=
 =?us-ascii?Q?7+hUw6/6iBZ9bPD9CYojZi4VcRC1zRZjSYEry2V/onAyklRzgXQB2QcJBjhm?=
 =?us-ascii?Q?Imxk4mxEkW13snyqu7As6eZsoFQaK8bjyB9xPRP2lo4my78EnZwZlptekabN?=
 =?us-ascii?Q?Pw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 23064e12-777e-485b-d14f-08dcfca44b8d
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 07:42:55.3771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v4IQIt0cImeJjSf8LrRoWafiycQqVolP01KP3lXPz5Loo6oAssIFjskHP+leMR1TfsYXyJ/ZfMPwkoJb/HHPCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8157
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG:kernel_NULL_pointer_dereference,address" on:

commit: 9e4beef457f5cf6e0c388248b2e12d9755edf03d ("[PATCH] media: vicodec: add V4L2_CID_MIN_BUFFERS_FOR_* controls")
url: https://github.com/intel-lab-lkp/linux/commits/Hans-Verkuil/media-vicodec-add-V4L2_CID_MIN_BUFFERS_FOR_-controls/20241031-155021
base: https://git.linuxtv.org/media_stage.git master
patch link: https://lore.kernel.org/all/1dd09050-40ca-4c5b-b985-819731140388@xs4all.nl/
patch subject: [PATCH] media: vicodec: add V4L2_CID_MIN_BUFFERS_FOR_* controls

in testcase: boot

config: i386-randconfig-013-20241103
compiler: gcc-12
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+---------------------------------------------+------------+------------+
|                                             | d020ca11a8 | 9e4beef457 |
+---------------------------------------------+------------+------------+
| boot_successes                              | 6          | 0          |
| boot_failures                               | 0          | 6          |
| BUG:kernel_NULL_pointer_dereference,address | 0          | 6          |
| Oops                                        | 0          | 6          |
| EIP:__v4l2_ctrl_handler_setup               | 0          | 6          |
| Kernel_panic-not_syncing:Fatal_exception    | 0          | 6          |
+---------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202411041552.ff2b79d7-lkp@intel.com


[    9.211498][  T113] BUG: kernel NULL pointer dereference, address: 00000000
[    9.212220][  T113] #PF: supervisor read access in kernel mode
[    9.212739][  T113] #PF: error_code(0x0000) - not-present page
[    9.213245][  T113] *pde = 00000000
[    9.213566][  T113] Oops: Oops: 0000 [#1] PREEMPT SMP
[    9.214004][  T113] CPU: 1 UID: 0 PID: 113 Comm: v4l_id Not tainted 6.12.0-rc1-00151-g9e4beef457f5 #1
[    9.214806][  T113] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[ 9.215724][ T113] EIP: __v4l2_ctrl_handler_setup (drivers/media/v4l2-core/v4l2-ctrls-core.c:2469) 
[ 9.216251][ T113] Code: 83 c0 38 e8 69 34 26 00 85 c0 75 02 0f 0b 8b 43 50 8d 73 50 39 c6 74 08 80 60 1c fe 8b 00 eb f4 8b 5b 50 39 de 74 c1 8b 43 14 <8b> 38 f6 43 1c 01 74 04 8b 1b eb ed 83 7b 30 04 74 f6 31 d2 f6 43
All code
========
   0:	83 c0 38             	add    $0x38,%eax
   3:	e8 69 34 26 00       	call   0x263471
   8:	85 c0                	test   %eax,%eax
   a:	75 02                	jne    0xe
   c:	0f 0b                	ud2
   e:	8b 43 50             	mov    0x50(%rbx),%eax
  11:	8d 73 50             	lea    0x50(%rbx),%esi
  14:	39 c6                	cmp    %eax,%esi
  16:	74 08                	je     0x20
  18:	80 60 1c fe          	andb   $0xfe,0x1c(%rax)
  1c:	8b 00                	mov    (%rax),%eax
  1e:	eb f4                	jmp    0x14
  20:	8b 5b 50             	mov    0x50(%rbx),%ebx
  23:	39 de                	cmp    %ebx,%esi
  25:	74 c1                	je     0xffffffffffffffe8
  27:	8b 43 14             	mov    0x14(%rbx),%eax
  2a:*	8b 38                	mov    (%rax),%edi		<-- trapping instruction
  2c:	f6 43 1c 01          	testb  $0x1,0x1c(%rbx)
  30:	74 04                	je     0x36
  32:	8b 1b                	mov    (%rbx),%ebx
  34:	eb ed                	jmp    0x23
  36:	83 7b 30 04          	cmpl   $0x4,0x30(%rbx)
  3a:	74 f6                	je     0x32
  3c:	31 d2                	xor    %edx,%edx
  3e:	f6                   	.byte 0xf6
  3f:	43                   	rex.XB

Code starting with the faulting instruction
===========================================
   0:	8b 38                	mov    (%rax),%edi
   2:	f6 43 1c 01          	testb  $0x1,0x1c(%rbx)
   6:	74 04                	je     0xc
   8:	8b 1b                	mov    (%rbx),%ebx
   a:	eb ed                	jmp    0xfffffffffffffff9
   c:	83 7b 30 04          	cmpl   $0x4,0x30(%rbx)
  10:	74 f6                	je     0x8
  12:	31 d2                	xor    %edx,%edx
  14:	f6                   	.byte 0xf6
  15:	43                   	rex.XB
[    9.217884][  T113] EAX: 00000000 EBX: c410a7c0 ECX: 00000000 EDX: 00000000
[    9.218489][  T113] ESI: c0a6c104 EDI: c410a900 EBP: c425dd68 ESP: c425dd58
[    9.219105][  T113] DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068 EFLAGS: 00010287
[    9.219760][  T113] CR0: 80050033 CR2: 00000000 CR3: 048af000 CR4: 000406d0
[    9.220371][  T113] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
[    9.220987][  T113] DR6: fffe0ff0 DR7: 00000400
[    9.221391][  T113] Call Trace:
[ 9.221717][ T113] ? show_regs (arch/x86/kernel/dumpstack.c:478) 
[ 9.222109][ T113] ? __die_body (arch/x86/kernel/dumpstack.c:421) 
[ 9.222498][ T113] ? __die (arch/x86/kernel/dumpstack.c:435) 
[ 9.222868][ T113] ? page_fault_oops (arch/x86/mm/fault.c:715) 
[ 9.223285][ T113] ? kernelmode_fixup_or_oops+0x50/0x5e 
[ 9.223873][ T113] ? __bad_area_nosemaphore+0x37/0x1db 
[ 9.224429][ T113] ? up_read (kernel/locking/rwsem.c:1621) 
[ 9.224788][ T113] ? mmap_read_unlock (include/linux/mmap_lock.h:171) 
[ 9.225210][ T113] ? bad_area_nosemaphore (arch/x86/mm/fault.c:835) 
[ 9.225649][ T113] ? do_user_addr_fault (arch/x86/mm/fault.c:1280 (discriminator 1)) 
[ 9.226083][ T113] ? exc_page_fault (arch/x86/include/asm/irqflags.h:26 arch/x86/include/asm/irqflags.h:87 arch/x86/include/asm/irqflags.h:147 arch/x86/mm/fault.c:1489 arch/x86/mm/fault.c:1539) 
[ 9.226496][ T113] ? pvclock_clocksource_read_nowd (arch/x86/mm/fault.c:1494) 
[ 9.227059][ T113] ? handle_exception (arch/x86/entry/entry_32.S:1047) 
[ 9.227509][ T113] ? pvclock_clocksource_read_nowd (arch/x86/mm/fault.c:1494) 
[ 9.228049][ T113] ? __v4l2_ctrl_handler_setup (drivers/media/v4l2-core/v4l2-ctrls-core.c:2469) 
[ 9.228563][ T113] ? pvclock_clocksource_read_nowd (arch/x86/mm/fault.c:1494) 
[ 9.229122][ T113] ? __v4l2_ctrl_handler_setup (drivers/media/v4l2-core/v4l2-ctrls-core.c:2469) 
[ 9.229606][ T113] v4l2_ctrl_handler_setup (drivers/media/v4l2-core/v4l2-ctrls-core.c:2502) 
[ 9.230067][ T113] vicodec_open (drivers/media/test-drivers/vicodec/vicodec-core.c:1874) 
[ 9.230469][ T113] ? __mutex_unlock_slowpath (arch/x86/include/asm/atomic.h:23 include/linux/atomic/atomic-arch-fallback.h:457 include/linux/atomic/atomic-long.h:40 include/linux/atomic/atomic-instrumented.h:3189 kernel/locking/mutex.c:921) 
[ 9.230942][ T113] v4l2_open (drivers/media/v4l2-core/v4l2-dev.c:429) 
[ 9.231310][ T113] chrdev_open (fs/char_dev.c:414) 
[ 9.231704][ T113] ? cdev_put (fs/char_dev.c:374) 
[ 9.232074][ T113] do_dentry_open (fs/open.c:958) 
[ 9.232468][ T113] ? cdev_put (fs/char_dev.c:374) 
[ 9.232809][ T113] vfs_open (fs/open.c:1088) 
[ 9.233152][ T113] do_open (fs/namei.c:3774) 
[ 9.233507][ T113] ? open_last_lookups (fs/namei.c:3721) 
[ 9.233893][ T113] path_openat (fs/namei.c:3933) 
[ 9.234240][ T113] do_filp_open (fs/namei.c:3961) 
[ 9.234580][ T113] do_sys_openat2 (fs/open.c:1415) 
[ 9.234933][ T113] do_sys_open (fs/open.c:1431) 
[ 9.235262][ T113] __ia32_sys_openat (fs/open.c:1441) 
[ 9.235647][ T113] ia32_sys_call (kbuild/obj/consumer/i386-randconfig-013-20241103/./arch/x86/include/generated/asm/syscalls_32.h:296) 
[ 9.236049][ T113] do_int80_syscall_32 (arch/x86/entry/common.c:165 arch/x86/entry/common.c:339) 
[ 9.236452][ T113] ? irqentry_exit (kernel/entry/common.c:334) 
[ 9.236817][ T113] ? exc_page_fault (arch/x86/mm/fault.c:1543) 
[ 9.237201][ T113] entry_INT80_32 (arch/x86/entry/entry_32.S:941) 
[    9.237584][  T113] EIP: 0xb7edd2a9
[ 9.237888][ T113] Code: 89 d0 31 f6 25 00 00 41 00 3d 00 00 41 00 74 29 65 a1 0c 00 00 00 85 c0 75 27 b8 27 01 00 00 bb 9c ff ff ff 8b 4c 24 20 cd 80 <3d> 00 f0 ff ff 77 50 83 c4 10 5b 5e 5f c3 90 8b 74 24 28 eb d1 66
All code
========
   0:	89 d0                	mov    %edx,%eax
   2:	31 f6                	xor    %esi,%esi
   4:	25 00 00 41 00       	and    $0x410000,%eax
   9:	3d 00 00 41 00       	cmp    $0x410000,%eax
   e:	74 29                	je     0x39
  10:	65 a1 0c 00 00 00 85 	movabs %gs:0x2775c0850000000c,%eax
  17:	c0 75 27 
  1a:	b8 27 01 00 00       	mov    $0x127,%eax
  1f:	bb 9c ff ff ff       	mov    $0xffffff9c,%ebx
  24:	8b 4c 24 20          	mov    0x20(%rsp),%ecx
  28:	cd 80                	int    $0x80
  2a:*	3d 00 f0 ff ff       	cmp    $0xfffff000,%eax		<-- trapping instruction
  2f:	77 50                	ja     0x81
  31:	83 c4 10             	add    $0x10,%esp
  34:	5b                   	pop    %rbx
  35:	5e                   	pop    %rsi
  36:	5f                   	pop    %rdi
  37:	c3                   	ret
  38:	90                   	nop
  39:	8b 74 24 28          	mov    0x28(%rsp),%esi
  3d:	eb d1                	jmp    0x10
  3f:	66                   	data16

Code starting with the faulting instruction
===========================================
   0:	3d 00 f0 ff ff       	cmp    $0xfffff000,%eax
   5:	77 50                	ja     0x57
   7:	83 c4 10             	add    $0x10,%esp
   a:	5b                   	pop    %rbx
   b:	5e                   	pop    %rsi
   c:	5f                   	pop    %rdi
   d:	c3                   	ret
   e:	90                   	nop
   f:	8b 74 24 28          	mov    0x28(%rsp),%esi
  13:	eb d1                	jmp    0xffffffffffffffe6
  15:	66                   	data16


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20241104/202411041552.ff2b79d7-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


