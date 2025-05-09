Return-Path: <linux-media+bounces-32157-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB8DAB1928
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 17:46:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D5083B7029
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 15:46:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C95722F755;
	Fri,  9 May 2025 15:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OaTvgJj4"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10F422A4C5
	for <linux-media@vger.kernel.org>; Fri,  9 May 2025 15:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746805591; cv=fail; b=A337JOLjPOecrnK54aPPaYxXL4reD/hhVgVHPhj6Z8BYkpQayjeeL95+OnaXoNk0l129BaS7wIcWxI/5U+wvkSSpr2tG4VvK/iCDUjT69khso5k4CENTfw58yDk/RVDclrvEVyeqPy2ZIZ9Y6iRV1oOD9T5iMPzhPYScNEA00D0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746805591; c=relaxed/simple;
	bh=QhI0rwjQEZwjZUvquRVy/ovpI0QM6RZpsvZC8zWLZ2k=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LK7Hxv15N2ICIUZFvkUvbZAyWVRhdZcLOX289tez18s41mGOrxYzar5gLMrvhYdshEvKG/RHQop2K747D7utohHDpUJR37Nck8t6iha9h4Lexl3h4OUg07bR31dQ06VoURz1501pQpYQcjTmmBjA6+TCpFsTehY+cBxh5EnNKk0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OaTvgJj4; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746805590; x=1778341590;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=QhI0rwjQEZwjZUvquRVy/ovpI0QM6RZpsvZC8zWLZ2k=;
  b=OaTvgJj4nOLQoRF9+AM776sgQ2e6Y2eGenlb9tML2UEdGfUwhkfqzCjP
   /MnMqATPx2SeNcBVari12ci25QOrlrYtZjYhlM440pATOYpWw1i5C7hoR
   A5GWMnfFRAxRL3vJCNCB3O6k+7IdqqIU2omdfGDLLXhtV5azj3OxezFYj
   vc4zda6YpYqh3n2RgREaxPX/AF3OGWwXR+5mq0HvTkbOBXPttYeu7c0a5
   qs6LR7ZFphZD04DZuwQQvKBrJxze5/zGHojJwjtARQPOABVM+gv6ZpFV4
   efW4mJFiqhet+SAftfEWB13/jF+Oq12ze3v/CfC9Wvz59WL6AnIxro8w1
   Q==;
X-CSE-ConnectionGUID: emmYMIilRKKzVJyF/X6PWQ==
X-CSE-MsgGUID: iZ+cqn17RNW4KCGHiTq/eQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="51297139"
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; 
   d="scan'208";a="51297139"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 08:46:29 -0700
X-CSE-ConnectionGUID: fegHTSx6REqTxrT9XEkElQ==
X-CSE-MsgGUID: m2MgdPVKSMS84MtH+7ecGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; 
   d="scan'208";a="141427951"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 08:46:29 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 9 May 2025 08:46:27 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 9 May 2025 08:46:27 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 9 May 2025 08:46:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nf32iG8Rk0IWALY6CR5IgOA7I3FD4Hpf6UySp3X9sqWfaDYY/jumT/w/j+gOPeHw97SUycvMizhK5xFGPD7qiV7WAHD5xggVpd0f/gDuwWJbWGn47cVlXmOFWSR0QGkIgWAd1c0wtZtCPTlVIqSkvRnDEcKqY2EnrfQ/ilbsyYgAGHdXdrOkpIh832puwR23qZRNA8wyyBW+NqqUvQuyuW6OXKwebosdImz0uDsp35KplqVpiwrWXgZz0k+1l2XdkvvZAjTfHfUjO6zHIVZHyBAd+4doqEmvtQzvv0cgbhf4UN40u0+10Ymkvy8HtOzWs162VpjXBD+AJqytijN7lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d2xcQq+FEvOa0w6znkyuTuFIM7GVqj5kvk3+bV5QMKI=;
 b=PYlEB3xL6Gr6Ngkms1DPYJE2nTFd5L3bqwyFcSsMT8Vk0MTdeIKv5r5+S1/C5VDfehN5ekmEFOHdegQM2RXpFiWalpO39btBpuZttlvAA/6u6oVqexln74dypRxwZBymzdx6LmsqNfP4TWkBtGW+O9aBL4OllnBLP1SFWSxhfOyFTAqCrLXkDvTv8sWbPgeqHwZ++ozuncP30uDFy+WGk8x/OFc2sMwDqJvw/nwR7BtpDk+mGIu7kq0XNCGSn/g8ja41RIuRhMBxqH7gAkpkHxvmZnex3cZCOPvipZtvpmr0FqofsejVq6g0dgyVK0NqDz5HrcbH8zYve1GL5zQ7CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7335.namprd11.prod.outlook.com (2603:10b6:8:11e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Fri, 9 May
 2025 15:45:49 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.026; Fri, 9 May 2025
 15:45:49 +0000
Date: Fri, 9 May 2025 08:47:14 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <dri-devel@lists.freedesktop.org>, Sumit Semwal <sumit.semwal@linaro.org>,
	Gustavo Padovan <gustavo@padovan.org>, Christian =?iso-8859-1?Q?K=F6nig?=
	<christian.koenig@amd.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>, <amd-gfx@lists.freedesktop.org>,
	<intel-xe@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
	<linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>,
	<kernel-dev@igalia.com>
Subject: Re: [RFC v2 01/13] drm/i915: Use provided dma_fence_is_chain
Message-ID: <aB4jgtwqqNUs11py@lstrano-desk.jf.intel.com>
References: <20250509153352.7187-1-tvrtko.ursulin@igalia.com>
 <20250509153352.7187-2-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250509153352.7187-2-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: MW4PR03CA0165.namprd03.prod.outlook.com
 (2603:10b6:303:8d::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7335:EE_
X-MS-Office365-Filtering-Correlation-Id: d3134ec8-f19f-49e0-8300-08dd8f109233
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7fuFPfGbPu3xwkkAQJOTqDdlUciQIk4167O3AMipyyJHDpIArYzAtWQFIWxt?=
 =?us-ascii?Q?KrryFNe3XfS974TUg6W5n9wDTwOqSPwAqktnDm4NfFnWCJdWW23FLWbwlM1B?=
 =?us-ascii?Q?LbZt4uavhkCUR/9XHDiW/hTjUWD29FCNoaCpl62EWRCnkM62gxEeZR4PGUFc?=
 =?us-ascii?Q?m3tllUNWl+Jj92czUQrnxkf5Eypzr4SoMTMaHx4rqPu/OSuqZg5bQDB9XKRw?=
 =?us-ascii?Q?xnNyFEdmpd0gTlX1bZ6y+fWQKXtxXuUCZeJNyslIC44kXlZwNQGJF1ulzsHO?=
 =?us-ascii?Q?y3CcFlwCG3ebyTkKR7JS5oHMXC9cSdnFz/tHVLrx92b6UrkAPhyT0ma8L3fi?=
 =?us-ascii?Q?pcATzSSVrF9dgAjxwT8dNNlAazmPg7EH9EKMy3W3vs1Z1yFCMmm/4iL1QQqU?=
 =?us-ascii?Q?bx1XMMziIAdV6nsfumFY5LgWeCBAJ21UKUH+qRpcg8uZp++vzAvzaBEQa6IZ?=
 =?us-ascii?Q?KFGoIOM4czUJoRh9SPxH8ibjVc69hOxu3kciNsQX2Ibs4XigYsEQs0mQKb8K?=
 =?us-ascii?Q?6OrXB9BL1fQsKjjpVHZ3fEGUb0jk0wR0BT5ckw1BM49Si7NXb173f9LVSryq?=
 =?us-ascii?Q?uYIOPwMEK8d0b0WaBZHv7P8tURL08PPfuqUVhNPyUiSOYdEUvxPnwfbTUHiz?=
 =?us-ascii?Q?ONdFU8HYnayyclbI6+9uyQPsXp3cZUUH5WAb8q7+ECXt6JNMKHlz5/SJagML?=
 =?us-ascii?Q?8PNwAEEp0nt6p2melvo9pZyEFpQilHI9rWM9Nk08Mg3PFjgoPKZIJRJv27of?=
 =?us-ascii?Q?3GGoad48/Twp/q2BLFJ5cf3v245ut1EoyeMcdl5XOkD6MN6En8mLmQK/2Z7I?=
 =?us-ascii?Q?TDBqU+TNGT48x7miP9ZbW42welQAljPor9vSfu/nNMSEzkKX95Awy7KpPoE1?=
 =?us-ascii?Q?gjiNrM8FzuWLAdTTv2FIJcdHFTNCBEWwPskQgqqZzJjJP1+pthzetSEop8GY?=
 =?us-ascii?Q?WqiczZp2eRAZ7gAxxGPLsBmuaiwe394t/Nd7jH7m5gTQsDPuHNBvoE7SI+bg?=
 =?us-ascii?Q?BosHa5RiVHKXdEjn/cUcEnrgf6Kfl9XFn66CbZQcKtun8tS8pLM0tg8IdoYA?=
 =?us-ascii?Q?zsj0HyeYqZLXSF657baMF5RHB4L4Alpb43eu5vbvUW8srn+5a4QpFlPCzdaF?=
 =?us-ascii?Q?fRK+GxQ+8nFNAqBffZ6OXdZKNNCYBlmm30edD940m4jqJHaDiQ/v6MP4hSR2?=
 =?us-ascii?Q?gFcu0rRi7kkN7NlJ/2jVFdKuvZXuPGrnQpUY1c8OVSifMP3tqDpIp+aYE6gr?=
 =?us-ascii?Q?WhHL4W0uxS4+Kpc2p+KA0Un28O/jKswZ+dWTDHIqY8K6Gow7GTgnnIPDM9Nb?=
 =?us-ascii?Q?xqtLUb4JvAhSVGVCDXA6WPLTg+hpXebzzOwAkXGOMEJL+5swOc2mfOJjxRHU?=
 =?us-ascii?Q?cYNmmQwgyWGFR295JaykClcMpwF41nQP1Yp0IAGyeWw14ywJZr6pRsbCQaLo?=
 =?us-ascii?Q?yTEEa0Kx36Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6522.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1whwWTKtDw4zx88S6ZBygspV+mUcR3MeWgD/FZ7ck9/8H+Cp9GfrmHaQi40r?=
 =?us-ascii?Q?BXswIU0vgfyHiJQGqIvDb4YjMImbYD1zDEIGfN+ronSRwk+D7y/mANkcS2o/?=
 =?us-ascii?Q?KogzCoDPgW2tPc8mX8yfmsMP0IJG/NKLbddcLSpy2HHVgUsEImGeLY2EeTOM?=
 =?us-ascii?Q?+MkXEDp1gyK2uzxVkNBF5vD6PUC04Bagbu77dxlyoTZFVHIudHxWu0aVNdoq?=
 =?us-ascii?Q?9g9QOyNkeMkLF5QzsucKI0qzslETdBJavJWef6PrJLR9cX5Xh7cwiJ76bZdK?=
 =?us-ascii?Q?3MLzI2O5hNDjINk3yFr9tWNLXNlztOUXxjp+1FXvZd529Qx4XFlQDWE0sLmS?=
 =?us-ascii?Q?ZO0aLIsGTU6CTQPOlJKiyPsNITgwQKpYQp/FTL0qBjiuKOwoLiSMzgrplx0J?=
 =?us-ascii?Q?slnvWkPXmmaqBZHhNGgbpu81kp1hAEPU5Is1+5KCpi4WGJHa9mIddMhzqund?=
 =?us-ascii?Q?mdE3fdcec9CAGfFQ3ItgFdRQbwjQE3B0Dj8EegEpxiB+ZZo/ZGGk3+yajhd4?=
 =?us-ascii?Q?Q7BSpVW9bMlbn1ak+w3w/BfalY3I1YdW6/GGaUpqDTQe+X+d6G6LauomtDNh?=
 =?us-ascii?Q?ZPE+xHjO1fKovdCSPKHgI/d5ny41mqrOy7EFrejeNVHV33nmNfQZ8sRtZh87?=
 =?us-ascii?Q?AFaNZNHUXi6fH4RzNROSJxpAIUWk1x4y4fxq0Ssmy5KytRW7TgVFeyOLuFll?=
 =?us-ascii?Q?8zx4RyxlyXcIq3E+NbLE04KbvfmEn7Ey52HiwR6K3+WNZBoQDgdkBWzzgPL+?=
 =?us-ascii?Q?waDn5BE48ycTPIKhS/klVNtpyoJnfyAixY64RRWEqamkmjNZZtOcYU2e8klv?=
 =?us-ascii?Q?kUf1skDpnOPxHTV7hzhxj/LdkPaTBB/QpHgH/cai7ya7lvsSSa5sP4TUzPBU?=
 =?us-ascii?Q?Z5ElUwSTLvwagIJrwgvh4DX3ZMqdG7nqL35W9Pdk9VBU0NTUYG/I48U3xO7f?=
 =?us-ascii?Q?1JhhYkq/U4hJEEnmEH4TabFENI52q+zglKfNspzcbVUmvZ+ylINJUXCW0ZJG?=
 =?us-ascii?Q?AYgV86F7D/BH2yjJDYqwGSCfxT7D6kAqg6OKKw0pDyBbBbWWfrRcru1jlDjl?=
 =?us-ascii?Q?nUnfbtPHQftZc4dW7G6eRdNKoX7+UKwfouFdgFW3QHsNX8xQB8ercOMjeSO2?=
 =?us-ascii?Q?qR/vfKngTK52w1hEHSJ1h7kKPezxlO5cmW1vebRmaLjfPOnPiMZZKCFBmn+o?=
 =?us-ascii?Q?4HFJXHqBNO1P7IbxlgCw0gLzisBPnuC6lRywTzfKAygUjMBEAhVd2bJIGMBc?=
 =?us-ascii?Q?mWTZycAlRLUh9zaf90O4cEaXJ9kLdB7WW64sfeRJv2fatWlSXfEREjUSoeSq?=
 =?us-ascii?Q?aDW3atdhkyLR1tIAyHkkFp0SlYkR+PcNMyRFhgxsRcT1EkwDQ2hP20uS8PoQ?=
 =?us-ascii?Q?T7amridTtzIXJuPIVbgq/T6r+QqJ3pGSVc2JZgAt3ngHYLlO8w+d+/YRQPWS?=
 =?us-ascii?Q?zPijuKvPPHDQsx1DTNwrP2CZ6IClU4lT/l/DlysytTmXLCOV+D0Qin3xYCjI?=
 =?us-ascii?Q?GpeuMaSIXDTWL3IhXBa93SI8Rzv2o8F6E8kgunRfkDs8zVNSP5aut2c+0ZJb?=
 =?us-ascii?Q?e73TOI2M3mW4/FqtnEY0yohJd0gNNJ8mBL65KL/U+T69DgtqYMCICVyQn1n4?=
 =?us-ascii?Q?zg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d3134ec8-f19f-49e0-8300-08dd8f109233
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 15:45:49.2996
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 18DrdgDhC6qkoW1go2jZUkPw9TUQNMtfNWxQvz4mBKyKneSoLG4637A+VVXVBlW2G8mIVECOTBhXOMyZLC21nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7335
X-OriginatorOrg: intel.com

On Fri, May 09, 2025 at 04:33:40PM +0100, Tvrtko Ursulin wrote:
> Replace open-coded helper with the subsystem one.
> 

You probably can just send this one by itself as it good cleanup and
independent.

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_wait.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_wait.c b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
> index 7127e90c1a8f..991666fd9f85 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_wait.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
> @@ -106,11 +106,6 @@ static void fence_set_priority(struct dma_fence *fence,
>  	rcu_read_unlock();
>  }
>  
> -static inline bool __dma_fence_is_chain(const struct dma_fence *fence)
> -{
> -	return fence->ops == &dma_fence_chain_ops;
> -}
> -
>  void i915_gem_fence_wait_priority(struct dma_fence *fence,
>  				  const struct i915_sched_attr *attr)
>  {
> @@ -126,7 +121,7 @@ void i915_gem_fence_wait_priority(struct dma_fence *fence,
>  
>  		for (i = 0; i < array->num_fences; i++)
>  			fence_set_priority(array->fences[i], attr);
> -	} else if (__dma_fence_is_chain(fence)) {
> +	} else if (dma_fence_is_chain(fence)) {
>  		struct dma_fence *iter;
>  
>  		/* The chain is ordered; if we boost the last, we boost all */
> -- 
> 2.48.0
> 

