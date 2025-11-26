Return-Path: <linux-media+bounces-47790-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F88C8C64E
	for <lists+linux-media@lfdr.de>; Thu, 27 Nov 2025 00:56:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C34B33AF128
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 23:56:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D91C305E29;
	Wed, 26 Nov 2025 23:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F0S9KNWG"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C3329BD85;
	Wed, 26 Nov 2025 23:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764201401; cv=fail; b=ARfmTowy+leCGMLPeAemzNCD30DyzGRxw+1zDi9/CPl7QLVTVvEpi3KUjBiEX+He5lgJkt6M95yOT+evrIIdEiEc+Tfn0VL5nxuRYlCEPq2CIKc+4FjFSa+RCGQhc0dP01E1ATF/Dm6cu7KjYB/edO8S54Un2KQEaut5JMF7mYM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764201401; c=relaxed/simple;
	bh=QUQ2KK290uKhGm1gUSaA8wi1HFdZunmQMewtvc+ENQI=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GvZepOZeKm7lQr05ADLm36y3exbZ9fmPyAgpMpFiZh1hfChAHWkiFD8SYdlcfAMsZolwe6UJFTVNOjC/k3roaJjOlyMlBQcuHtosJoiunEmbKpfpFsjQjXVAFtkcpeQBZFBLBa/JmQ8rgIZDcpSWj9MN+bOdtBkHVd6nFUgnuHY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F0S9KNWG; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764201400; x=1795737400;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=QUQ2KK290uKhGm1gUSaA8wi1HFdZunmQMewtvc+ENQI=;
  b=F0S9KNWGqxvNNIDHuetE9RIpufD95NYgQiq7xqAEWRHjTdfazR/8JJ8E
   +oJNPac37914bzmA/bIu6HVkCaOC7L12DAl/CAyhGyxL/yDvW0k3zv41p
   W0PvpZlMQXdHI4LdMXZwlAMC/LUMqOcKv2E8o5wB8mFBXnFQ87KkY18R0
   UAEIjuvok2xqCoPXv5dT41w5ka59RG+SlCTwUgNTUndrHuSroSJEL/4XN
   4NGNSSHIWDL6+FLSr4VyjOy6oE3m3YzaWXEc957fuD3SOqYQRahGzWl8C
   U546AtxBn5RFvr7NTGYZ/pEEYRwzL+DVcMtmRbcZBkKkOMZlvZaIdezrf
   Q==;
X-CSE-ConnectionGUID: NrVTzCDQSSOH0SlDbClUUw==
X-CSE-MsgGUID: eSRHm5ffTbKmgzrQExol3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="69869668"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="69869668"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 15:56:39 -0800
X-CSE-ConnectionGUID: SiwNzYeWTGuvVU08l6D2Sg==
X-CSE-MsgGUID: C7C8D0LoT7Sry7nPcgd3NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="230355014"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 15:56:39 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 15:56:38 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 26 Nov 2025 15:56:38 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.11) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 15:56:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h2VPHBm8ZaWidBS5GhxRVFKxwXYLN9ff3wfrES5FUPneiU27CEqUcuTbCtZYkbYGuN4VubS9l0tzJvgQwU2lwzQzRbJl375bVV9GyK8HfhACRiwF9s2QcTZ28ZdflcJqDjjpUpuZ9kY2zv0Sp4u64hipcEgZYU5XCZuT/rpi3+LbXotqDG3jibDh8elMjjri6tUd69kGtsWHbcExDWBRqN+RyJZ+ujVfsRaL7PS/zxWNvCF49tXsldH7nF/cNeuCN62SvUWX6KOpwDOJwjZ4BnPj5p7tn9nPE9Ve2ie2HxapcAI6Dg9hrcUaq54w6zmVmwmbTh+p7ws2IZTDqP35Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=73y+pZa2e4N9HKv0LTqEJOc54RuhhPPMLajbtwv8prQ=;
 b=EhnWWjnPJ43qFN/1jmqg0u6Z+QEhpE0atnZb+uSZvDYJzBIPPMjp0W9xfnoOWzBlvGVwhH9/rqt/6zJQhTWw0rncCgufvRyHsFyf3LQq/uDDiiSoGQyy6EXBLwRV5tapglAOBo8R8IYeZ1dTCLwJHDzqLWpiNR0gp5BDk0cgW95OmG9wKug1MD4IrfY4u/w/lI50kG7kRFiNdPP2Q2/3iXjMQ+NlXDFPxILtc3aERMBYcg4Q7eEKlQ2HZ5LpSYzPYFc2G08Pw9I9QgrjTmT2bkYgcs00LIsrCY5EXKSYl+yCUoO/FxdQ4RrgB/lL9oH1YPZCr17BJvG50702R2QiYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB8105.namprd11.prod.outlook.com (2603:10b6:510:254::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Wed, 26 Nov
 2025 23:56:36 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 23:56:35 +0000
Date: Wed, 26 Nov 2025 15:56:32 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Andi Shyti <andi.shyti@kernel.org>
CC: Philipp Stanner <phasta@kernel.org>, Sumit Semwal
	<sumit.semwal@linaro.org>, Gustavo Padovan <gustavo@padovan.org>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Felix Kuehling
	<Felix.Kuehling@amd.com>, Alex Deucher <alexander.deucher@amd.com>, "David
 Airlie" <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jani Nikula
	<jani.nikula@linux.intel.com>, Joonas Lahtinen
	<joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
	"Matthew Auld" <matthew.auld@intel.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Lucas De Marchi
	<lucas.demarchi@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
	<thomas.hellstrom@linux.intel.com>, <linux-media@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
	<linux-kernel@vger.kernel.org>, <amd-gfx@lists.freedesktop.org>,
	<intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
	<rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 3/6] drm/gpu/xe: Ignore dma_fenc_signal() return code
Message-ID: <aSeTsINKklqqJyIs@lstrano-desk.jf.intel.com>
References: <20251126131914.149445-2-phasta@kernel.org>
 <20251126131914.149445-5-phasta@kernel.org>
 <nrrk4kug6a42fztx7ryuz5bk6uy7roiszjhiivlvtrw3uvunps@wn44moyetzff>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <nrrk4kug6a42fztx7ryuz5bk6uy7roiszjhiivlvtrw3uvunps@wn44moyetzff>
X-ClientProxiedBy: MW4P222CA0017.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB8105:EE_
X-MS-Office365-Filtering-Correlation-Id: 724dad7e-3641-4d53-a184-08de2d476ec2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pS1xDnB3XsOp8KYNPtvU72l6CDHkAPrbGQDgRV2/FgwYHII69ZI5/hD8KmvJ?=
 =?us-ascii?Q?egPLluGkMc28EByFJhyJlGIEAhwGxW2L/QTB1NnuHhyJ90D9UZtISDXV0zhc?=
 =?us-ascii?Q?DzhGbusaEgioZEaD0sjss1VWRxT4z1f1RueNcYVk1W1dywNkn9urK0vJIzWi?=
 =?us-ascii?Q?NJBZh111lCjZvINM2M14fxtfuogSJ8LY0w8yV1ioMyUirqDjgiHB+PufNAUv?=
 =?us-ascii?Q?2Qt7w39LdKUEYROVmDLvQdLzWKmcpUF4OdsOnnzrKgoG7YSZuUjQnD2tfPyv?=
 =?us-ascii?Q?zlKtazRyMkbFg1xqS6kmDh3SgkmYRSP3ULtLA0P3mPBJx+41wNWptzcL5QrE?=
 =?us-ascii?Q?SszGfnEibleT+XlQGfU0HL0AUGNvZLhybPcXonDThAcjm+2U8nK4vx7qRWJw?=
 =?us-ascii?Q?jForqTNC0iXJIHp7esQW3HZTOeE8CLMWdGzPLc2VT93BIS0wnpQGgGlLkpCa?=
 =?us-ascii?Q?gTX9uXBxVREwU/NuzK4TOTApsgA89UlpcJfYk2BXdjin8kjFyhaZvj5DMaH2?=
 =?us-ascii?Q?+fVliRMsaZl3A/5IfrYAuSXn2BHElkedobZmmJyMsMnpvGqeEWmw5QO3TIYT?=
 =?us-ascii?Q?gOm3Ant0HprYtr7+P5A+omk87pvGjPkHKYgUIhUqI03V5gBGHXAgNT/85ROn?=
 =?us-ascii?Q?0L19AYN90TKN/J4qCO7rzgwnmIhw8T4vULiysuzgs+mTZnyLJU69GQpUaLZ+?=
 =?us-ascii?Q?U+BZWj74uGWXxPE9SaPr8rM38vLOIRhf8pPDmlpi/oqBfU5ldfNRjbo6MDfL?=
 =?us-ascii?Q?sG6WXanUGd2fgb1DUWCDSe8a0O3wVmbAj9D9rbxhvgWlSjzLBRpiY6pobaAC?=
 =?us-ascii?Q?mpjBwmzFreixU5Vc7/SeYrnG7H96LmSxKXH/MMyJJvtIPKMO6W5o0e3yBP4d?=
 =?us-ascii?Q?O1mm7nYVFx2gmtf93NzrHFczgk1YX99rPKfPuolLYSU8fR2Mq1A2+Gja7gjj?=
 =?us-ascii?Q?gPner593q06S65YCMs6VjSMCWiWCazuAgLaFpSw0eeMRcxul7bpzcRY4NxvS?=
 =?us-ascii?Q?WjaxXlfg3tLJOFTRAlhsyxdlSoAJZnHupfUrXkIq7lkZ2p2xjDJrhdBBWuKI?=
 =?us-ascii?Q?1wCxwA1na5VG1VfSAUux6Yk9of1r6mgKYB/tMydozPYv6Po9g216DHvplGFg?=
 =?us-ascii?Q?oxEFRdMFoMv5lNG5n500Pi07hDFnfeAhtGX4q9Svs2HzQ6KutFzGlhwq/lOa?=
 =?us-ascii?Q?iEFCYyDXIUasRH7wcAHtIsXSeoAnnkaxMRQWZGwHp2h0Y+ohajH6r9+vE7pk?=
 =?us-ascii?Q?GNzzTnE5RBjSi5eOddGqqZF/V+eKKGTOoupEbf/INP5Wc+08XeJiMTqUAXhY?=
 =?us-ascii?Q?lpp8o/9bl4IwvhaEhHEUUIHE8PBi+ZeUqDx4amX9j1zwou712V4x1Yap5DaE?=
 =?us-ascii?Q?h8N6z6KBD6LHx4J8cNRROeP6gy4CgxZ3/S/N6rkgFn6mY3k6VNQhCOU/9hRd?=
 =?us-ascii?Q?1+7vth+DuXpbjjBr2MQ5WRFoMrtXwsvT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6522.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EFCSRSvQzfx6i4i0rMTakbbArWEwRKQGvfpyNYhWXAdyzQ86HPxgrNXq1Hy2?=
 =?us-ascii?Q?Gb2KgqAbbCbuDB6ftAcOpkm17gpdHZPtkfpr1u4GtAI42jCgcv/1aFUGRBN7?=
 =?us-ascii?Q?LvnmqL4AXQ4bUvzkZ4iaOZqZpatyyhNU+yAnu4gAhSTXUkzHtBqpIKmbCQFl?=
 =?us-ascii?Q?ZZA8ZDX7SGyNU4sbaCG7R33Xwf0jo2fPP0AcCOlRgkeJ9k35Qud2pXv9XgtF?=
 =?us-ascii?Q?zq3C1dMura4p0YnbjorpGE06xlCx5qJRqLZYPXL509VFP6sZ8Pn1yb1xA70t?=
 =?us-ascii?Q?WO10Bwxjic8WTI1HIDzKONYwfLqrTbiue3alAxWflszTBj8sK6HKy0XG5j2N?=
 =?us-ascii?Q?ABHCl5Ba4km8O4zXYiAZ8GNZkkGDO7biaey7oxkSGTsaoxRxYq3tDfeIs8J3?=
 =?us-ascii?Q?divTjZkBS1Yx1ns8nExaWd8LBD1RaUnE8Ph5F4cFacuup8p+M6I5GphG3m90?=
 =?us-ascii?Q?eLNH/JAUEk8cu8KpRQYQtj5kAEkF/BRh1RBcafnOyh0Aax6yQjjsDbs33ore?=
 =?us-ascii?Q?EMUtAeilMspNTKVkcOgK0r4IkUYzOswVmo0cvtVqxtBBmoLG+zRWlJMLvSXT?=
 =?us-ascii?Q?NY7dhFfkvJUjKaZ5dJRPtFKnuA5YAD+3Ousf/W35wtV4WZRBoBGUOhpYNlpk?=
 =?us-ascii?Q?UYHfzTV86KGdHwRCnpZEXAFCIgLJy9XJ5fONphO5wQx2/HaJBaGkqdHxNMm1?=
 =?us-ascii?Q?x5Qd/9bwUpthAQ7XqqdQgTBMPy7af0WevgxTv+4mDfE0eLhCELrYdG43f785?=
 =?us-ascii?Q?LBf5BoQrHuq2CVeKC4TRM8xDTGhFESD71LiHcjuNxaQ/L3GWb2LBgq27NI4t?=
 =?us-ascii?Q?T6xditbojWjgIHW1UQyqzZ9MJsUj0ijCtQEDt+ZszivMSh4FVOi0mLxSuLa2?=
 =?us-ascii?Q?XRBxlxZGhzjbAr2PBKwbQ7X2GvNOrxprigBWGMBfWlWqQQe3oQ0wzwf0uwrJ?=
 =?us-ascii?Q?upvZRTvcGEm2NLPkDov6cy0fZErIQ/jMzyalZccEjtJcLGiVANbBGo5hZIPg?=
 =?us-ascii?Q?PorIeIi64LaadBtnF6ittLJh2xr8D8fokj3jD9zj+14HxiCFDdzW390PKxKf?=
 =?us-ascii?Q?O8fWk5GHUvEC4zXhm8AaDBfLkjzVqyc9nZqy0+ocDKrSDJvU6D3cKC5SeOkM?=
 =?us-ascii?Q?Uqymy6w5l8StJh/S8WfHN3cHZVPhIDw57HysNjJjGicPiHpb/KfOgEY5+gso?=
 =?us-ascii?Q?vTFoIATSO062bCFaDhncgVz+sQEli+I4OsdpxeoGu3dABa3EITvOCfOte3ea?=
 =?us-ascii?Q?wtXan6VIviunAwOW6UYmVb1MBTcEDvSEKm6iQkLgkW/6E3yPqoZ9cNbHcuu4?=
 =?us-ascii?Q?uoEivBMxP+K0Wm4QkKQqOlf8XwRZyKcihxCXrNfay6n0dzBftwz7+5daEtE7?=
 =?us-ascii?Q?gHRRC7jkoVfwFBS0nRQNFy5Hyr3xSUfHuL29b3ylelvvbeo0M0imbG2gLXmu?=
 =?us-ascii?Q?NlQR/hEqZVAO0MqKW+UGZrjXNPkaOJPyaJPMBNIHBMMvwCXHGgl2sUZ33HCu?=
 =?us-ascii?Q?mgh1bK7tjKWXrnfrgLZKh46ZdsdSjRPa2dFT7rMIWv1u++wUV9SanNt1ICHY?=
 =?us-ascii?Q?FthMbo9VPzvYr+q6YtABo3CWMj8yXDFauu73iGS1vWhAh/2KgMrviBGqSeyl?=
 =?us-ascii?Q?pg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 724dad7e-3641-4d53-a184-08de2d476ec2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 23:56:35.8807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wSDe0OF4NypabCwOEfS+K51f0leyoniHbec65FefVr/Bl7ra1g+WFlvuVdRWwHQLU/p8ifk43++Gw3Tb39TpMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8105
X-OriginatorOrg: intel.com

On Wed, Nov 26, 2025 at 11:56:57PM +0100, Andi Shyti wrote:
> Hi Philipp,
> 
> in the subject /dma_fenc_signal/dma_fence_signal/
> 
> > @@ -85,7 +85,6 @@ void xe_hw_fence_irq_finish(struct xe_hw_fence_irq *irq)
> >  {
> >  	struct xe_hw_fence *fence, *next;
> >  	unsigned long flags;
> > -	int err;
> >  	bool tmp;
> >  
> >  	if (XE_WARN_ON(!list_empty(&irq->pending))) {
> > @@ -93,9 +92,9 @@ void xe_hw_fence_irq_finish(struct xe_hw_fence_irq *irq)
> >  		spin_lock_irqsave(&irq->lock, flags);
> >  		list_for_each_entry_safe(fence, next, &irq->pending, irq_link) {
> >  			list_del_init(&fence->irq_link);
> > -			err = dma_fence_signal_locked(&fence->dma);
> 
> why don't we do
> 
> XE_WARN_ON(dma_fence_signal_locked(..))
> 

IIRC the above statement can compile out. So the patch looks correct to me.

Matt

> instead?
> 
> Andi
> 
> > +			XE_WARN_ON(dma_fence_test_signaled_flag(&fence->dma));
> > +			dma_fence_signal_locked(&fence->dma);
> >  			dma_fence_put(&fence->dma);
> > -			XE_WARN_ON(err);
> >  		}
> >  		spin_unlock_irqrestore(&irq->lock, flags);
> >  		dma_fence_end_signalling(tmp);
> > -- 
> > 2.49.0
> > 

