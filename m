Return-Path: <linux-media+bounces-62679-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KsfNHXk5EmqewgYAu9opvQ
	(envelope-from <linux-media+bounces-62679-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 24 May 2026 01:34:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3705C0E39
	for <lists+linux-media@lfdr.de>; Sun, 24 May 2026 01:34:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 872593012CD5
	for <lists+linux-media@lfdr.de>; Sat, 23 May 2026 23:34:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4F1F2D2394;
	Sat, 23 May 2026 23:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lX5U5xpD"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4CB1E515
	for <linux-media@vger.kernel.org>; Sat, 23 May 2026 23:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779579253; cv=fail; b=ln4lxOt+Y22uI5p5mUtjnQSwTd2OB60vyzm8//ueDS1HmKKm/WV5/9abAfK2bpPbG916dVfmWtFPKQPqiGgv+Y7jKDI7ekIsYm1GTgzNMSzUo7y21sLKelYMq8zlHw/iFY0StttxsJ6wLJQeCs0oP6bExHALuoy8h8d1t+Hln50=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779579253; c=relaxed/simple;
	bh=TkpSTJ3AZlVlmNRub9SxC/Gz3qh4C/qX2PzM2Oz4BPc=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=R4QHIdBQSCrCDdCsomfvkpRLel7jQcZ4Y57uLyC0ZHnlSoXcyT1aarw1oK0vqvw2fJ9mm+Fzish2g8PPowLlr93HenwXW1EHf9qBtH/G8LjwD4qXEatVgGLzXwDd4ckSO7qoi0RHI6xb4cj4twJzOqQZXI1RrBidP563TUgs8sg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lX5U5xpD; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779579250; x=1811115250;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=TkpSTJ3AZlVlmNRub9SxC/Gz3qh4C/qX2PzM2Oz4BPc=;
  b=lX5U5xpDoXaGaji3Doe6NzDAxGlpq6ANWPBGAjzpTMKyVH5lkARTr2Es
   dewFoSeJmx+OTbqgjIA9tQlYw3qSVBcQLNMCyqFWgUCmFTqFDfabAcNAT
   FkzrY7TqZ3b1p4sZvuspt2RSSu4AjU9h37uWhUFWP9UsjUBOBJg5YvKjK
   LMPNxEWKnldDyX2N/gdTnkkYfMZZJql3po0BCUj3OF4uWR+3LnxZlZg8X
   LPbmqUgbaia7tP/9HG/NNnFkBfzcLvmbKhFZEV2sVPPyTIzoV3xXf3smH
   8gYLjuAZb6xq89k3VifluH9JzfeDgPUTwF4Yv+WXuP8z0tOmo0UQGVARN
   A==;
X-CSE-ConnectionGUID: E6FlPqzySmyUwnigMuKUIA==
X-CSE-MsgGUID: rkuqaYP1TQS5NLx94jxm5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11795"; a="80638761"
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="80638761"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2026 16:34:09 -0700
X-CSE-ConnectionGUID: kkm5FFMmQOmOotfnt0/GRQ==
X-CSE-MsgGUID: ch0SRsluS7WlXRxZ3Rj8wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="246217670"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2026 16:34:09 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sat, 23 May 2026 16:34:08 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sat, 23 May 2026 16:34:08 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.43) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sat, 23 May 2026 16:34:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gCaAtfGnJsUIVIZpoN76box1zVerLzgH+5sRAgSUvoe6tUCKkW4XByboNrefvJ3SdU2xdp+9KFZ0+exyMxnE8tleLo5SdBDVo9iZfw7JaXy4qSNxZMp7JD98kwuSARCkQ2N92ftHbjw/NXVGFKd73RC5unxVTct2OT81aLphZA9KiBFegvWTFjmYHu3/ApVGG6IiBA4wpeLiXzGEvrrqnlQIguYNRPjZVFMsYwcEkODouf2rNIdVb28XztMI8QazGLOoD4DPN9bbQj9QZDPr5YYq+WxemICy9GrpDdMLzKn+pNaLYDQ2hDY/1f5mc6mZtNMdv4Pn7m81QOJRgSTpsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y9bfrounLg4AkLl2TRsReSrByQPMjfdjCISWYENnYRo=;
 b=awyvW/wAd/+gkHrbpUD4SK6nTj7oEoxvng+sTn8O/TNE/+5eb2qo9nBJtwiPGKWwiHmncBPC4ZmCDE+f6JWpGCaazHAg8Cs+eadmY9+MTSp4Rtb3mSDcZuNnwjP7QcFQJwPtBGURYEt77zBhhPw/9jL8aNsmUD4AMsSB0cawUt4M9oFtkBp8kuSaj1YPUzmhHvE7jAZ0zrxJ84aP8GHBa1hyidFn6seK8kgBln3WB+qJmFpx6tg+6KE0rxSvc6SJSpYToGEo5m2+EWAg4X0QmS6ij3h6Uq0MMFxsL2yN94KBNHNYOXjB+Of/hsYvSmywPPODUdsBPS78HVmGvUs+2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8568.namprd11.prod.outlook.com (2603:10b6:a03:56c::19)
 by PH3PPFC80959CE8.namprd11.prod.outlook.com (2603:10b6:518:1::d4b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.18; Sat, 23 May
 2026 23:33:58 +0000
Received: from SJ2PR11MB8568.namprd11.prod.outlook.com
 ([fe80::a548:ac78:60a8:8a43]) by SJ2PR11MB8568.namprd11.prod.outlook.com
 ([fe80::a548:ac78:60a8:8a43%6]) with mapi id 15.21.0048.016; Sat, 23 May 2026
 23:33:58 +0000
Message-ID: <0ecb5cb8-1772-4b9e-a9dc-580b48f071f5@intel.com>
Date: Sat, 23 May 2026 16:33:56 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] media: i2c: cvs: Add driver of Intel Computer
 Vision Sensing Controller(CVS)
To: Mehdi Djait <mehdi.djait@linux.intel.com>
CC: <linux-media@vger.kernel.org>, <wei.a.xu@intel.com>,
	<atul.raut@intel.com>, <sakari.ailus@linux.intel.com>,
	<antti.laakso@linux.intel.com>, <kieran.bingham@ideasonboard.com>
References: <20260521222359.16716-1-miguel.vadillo@intel.com>
 <20260521222359.16716-2-miguel.vadillo@intel.com>
 <ahBmGsv67RcYAvsc@mdjait-mobl>
Content-Language: en-US
From: "Vadillo, Miguel" <miguel.vadillo@intel.com>
In-Reply-To: <ahBmGsv67RcYAvsc@mdjait-mobl>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0048.namprd04.prod.outlook.com
 (2603:10b6:303:6a::23) To SJ2PR11MB8568.namprd11.prod.outlook.com
 (2603:10b6:a03:56c::19)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8568:EE_|PH3PPFC80959CE8:EE_
X-MS-Office365-Filtering-Correlation-Id: 87aef7a8-4801-4d9d-ee44-08deb923c339
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|3023799007|56012099003|22082099003|18002099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: FImq2AH84Fciv6y1udaY8VRylbJSYN4ehmR5CsVM1hQ/99DswyGw0p1P7vtoqbP4W8GlN26xlHvq4XjWFJb+2LQifjh/UZfB2RcwRGfQ0aZIZgLFLh2RwB6kua9pDOFFSEpTdPa116WIFw9DVs1aaXnwj4W0TE21iyLX+Pc2I8W1w9kTE+xXsWq7sVnv0xlwfcfY1ICvBLPqjh4J49dVnxtRhjftLAisr2Zwc1u3Ok6eEzkIl7NAeEt1UZfhnqMSrik5+xv+lGQ7Jcsx7TahBSXXVbl3OcPJ7TohBrtCA5uoUdS+vaol5lbpUXUQBVWYO3uofqXs4v5H0Rl3DemllD08O6D/hdn2k8HqOkVKQ8wn4tU92J9SNiDYyR1AkkchKyNpPJu3u79c/fmwXuu1kbPsAIJr2oFoyBxFJ0CSsTl3RBLwSuefSaVxVB1D67bD9ci0xdRm43FaOD6JUzXudTlb+IS/hrepKSH2XYO4sI37auV1USlgFXhMdUBfisVe4uDrTTHsEJm2vTUbYtl4F+3SjXFUbKo/c/vna6/5sgBki9c6xwnEll/3UgCJkQPxtl4TRhPXHzodZQy2vOoT6OkFkD6oh2q/qEEcTItBLDsw8QKkK5aokH2gvTzE6wIPE4HuOPWK4tX/7RuJd1Y5Ec9Q8Bkv8jreJ8QytJsZM/BJ7p1z7m9IBlPOYP3bdKLh
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8568.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(3023799007)(56012099003)(22082099003)(18002099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFFxQ0F2Z2VWUkorNGoydHBkbXh5dU1ZSG43SDY4YytwemY5VUVnSFZocnNZ?=
 =?utf-8?B?SDZPK2s5QkhYb0V1Y1FJUTZTQ0ZEclp3YXduWnphaWh4OWQzRVByWEkwSU9T?=
 =?utf-8?B?dStRSTAvMml4eG16QmtNaUlOV0ZkSVBLUkphVU5NeTlsUDFGekJpOEVFNnNz?=
 =?utf-8?B?dS93TGprZUdTWTBUK0tzVlhsbWlTRmNoejJLczVwTEJkcmJCdmIydFdlUkFD?=
 =?utf-8?B?UDA0bUp4c0IxV2NDV1hkUXRZemRNS2RjMDloTWRzM0YrTkdzRzVwTlFHZzFT?=
 =?utf-8?B?MGtMaHIxS3RoVlBNYW1rTHpHUllRc3lmNEV2eWJmK3IxaERUcHk3dXhvL0ta?=
 =?utf-8?B?STdsSUhzc1ptakp3QkhPeCtCclFrUytGeU5SQzFlYWptbzlINzRDb1JSVThw?=
 =?utf-8?B?NkxLODNoMjFIWnREUGkvQm5uNWs3N3VISWY1alBzbVRSVU9Wdk02Z1FQb3JY?=
 =?utf-8?B?bkFDNFNvSE54VkVybWxPTDl0b0NCS0k1TTVRbWMwSGNEK3VjWHVUUTVUWWxk?=
 =?utf-8?B?VkM2UzdGRmgxQ1UrbnZaUUdNN1ZnZDZNTnE5ODNZdDJndWNJTVFoajM4QzBK?=
 =?utf-8?B?ODZ6U05FNjZyaXdQdWZGWlVDK01HYUVwQU0ydTA2K3ZWckJFUm16RkhDR0l4?=
 =?utf-8?B?YjNKQkxvcXd1bjFjVithQmxhR3JnS3dTMC9CWXhqVEd6L2s4UUI3OVRTeFRK?=
 =?utf-8?B?bjd6MXU3aFBqQTBpMFlMK1N5eHBIK0lDK280bFhzRW8wbDU4a3NCZlVqbDJa?=
 =?utf-8?B?akc1cW56T0RrTjV1OFRPalhUdXoxL1VzdDlrcnlqSDF0WGRJbHRJWDNkRUpT?=
 =?utf-8?B?bmZmUVVybFFQcmRoUG83aStDbzVneVVNTzRJQ1NZVnZhcFZQR2l3SWUvRkRo?=
 =?utf-8?B?NytBZ0lxQkRGQmtaYjVuOGREUTFiQWRRNmYvUDZDQU5YV2laaFl3ZE05Q2xD?=
 =?utf-8?B?NjBYdlJWblIzMmtDSFdwaFEvQ0l1WUJ6OTZsUWFhbk1RK1NaYVdVNkc3OEd5?=
 =?utf-8?B?WHQ5WXkxQSs4eVVmdmM4dERYYTVVd3lEUll6RU1Tang4YmdsOHFlcDZrU3kz?=
 =?utf-8?B?SnZ2YnNzNGVva3FGVWJKZ3UrL1hwbUhHOHVFc1RTbmpyWGZXRzdxanQzSnpH?=
 =?utf-8?B?bVl4b244ZWhjajdsV0F0VkJaMVh6dDMxR0hHeXVsMXJpNStuUWUrRmIxUmYz?=
 =?utf-8?B?dUdBdk9TTHg2cVZUTkNpMnM4cVovUDVlTDNEQ1hkV0U4MDR1eHNjVjZwTlFq?=
 =?utf-8?B?TmVDaW1Wd0ZpWGp0cXhVOFpWNnRGUTB5Tm84Q2FUV00xdWpRSHJMbnkwQmhM?=
 =?utf-8?B?YUZYYnVJakdBdHZVclArL2JkK3JNTWxodk0vazNrOEVSZFg5Q1Bqb1ZuVk04?=
 =?utf-8?B?MUd3VU9mVUlFSVFFMndaOTdGOXVUN1BtVWVGL2dWWk9zQ0UyRXd0RW1pWStH?=
 =?utf-8?B?dUlwOEhNQlZnVnZEejZsc2hmeHZHWGZGOG5pS2tDMGhYK2xhQmFvbFFCd0gx?=
 =?utf-8?B?akdoRkprZ1NveDJ2eVU5dDZzMkMrM2NyVWhSMk8xd2FmMFp1V29ibS9rUlRR?=
 =?utf-8?B?ZVBZa01DVHppdGZBUFIxMFZGdzdrcWdIWmlvK2lrcUdQZHhHY2ZhRHlId0Nx?=
 =?utf-8?B?cjlBd2pmekFoQjE3V05oQi9ZSlVyVnFOeHU3NVAva2VzTGQvZXBZZGJDbW53?=
 =?utf-8?B?Qlp6aXF6UVowbjU5UVg2dVZTcWhNMW1SYnJvNXFDTUlKSm1VL3VXaU1MaDNO?=
 =?utf-8?B?SjEyNnZacm83dmJFSUdmWTF4K0pWQ3JncDh3ZldPTjZvMnVSRDlGSmFiRmUy?=
 =?utf-8?B?aUxEbDFNQ2xjNmQxRjZzdmY0TERGaGtGR1d0Qk9tcGN2cjc1TmIzZ1doNjlr?=
 =?utf-8?B?UGpQTVMzUFJqSlRDWXdXbjJnZnI2cllTeUR1ZlAybnZ4bUR5MzBqYkdJd0I3?=
 =?utf-8?B?dGdmZEY2VFEzQmZJc3pYcTVlK0lZN1FrK0ZsUElIRGR5cklpOTRGdHFKWFFT?=
 =?utf-8?B?RFZYUGxwWnJJUmYweFJYZXZRVXlCLzVQMnV6UnZmSHczRjJPbEszZlFZc1lB?=
 =?utf-8?B?Rkp5dE9BN1RlYnJWNStHeHR0bXo2b21IN0gweThac1FXWmlvNEEreHF6NUs2?=
 =?utf-8?B?cEJpYm81Z3NqNm9ZckdYNXo4WGJmUkVTOWphR2VDcnZ0eEpCK0hKT0t6aWZT?=
 =?utf-8?B?RnUrTjdDcFB5STNEcytycXRQLzFUalUrSnMvVlhFcFZLc2MyVFI2bFJIM29T?=
 =?utf-8?B?a3RlMlVCT1lzcHFEVktGaXpGSXo1aUVEZjUvR3VOcnNZeVZpcnNWN3hWaFZ2?=
 =?utf-8?B?MVZrVHYyczBUUkw3V0pPRFZocjVSWlYvQTN0WXVzSnhsdzJkOWVJeDlkYmI4?=
 =?utf-8?Q?Bw0uLOG36AknJgao=3D?=
X-Exchange-RoutingPolicyChecked: pSzvUcVT8LG7XtMSh541h8/i+KZ/9KFW9o4kReb2mOmsgBNDHjRZfzpy7dcggTu2D6QkYVWVJ9eQbP43IUKa42XxPVLO1AAUf2V8goXMZgOiWgs+ITJxa3E+b2cHDFTWH7KyAa2YMIOu5rDtEQkjOferwGurJ41jwyrc9hVf8jr4/2c+gikBWPkYX/b7utErsa8QMzd+chPAN9no3W2lNT/K3wi1RgKL6b+hPsfYSnnWxsECF2TbeuDoLamkZoAulADH3XCMm/kRldBHrUsH+OkjGQBIpPJUiiyZdSZVXxDVlC8rvrZc1+62tmxUFZscVo25+1ZGfcnbAGKaEGKqmA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 87aef7a8-4801-4d9d-ee44-08deb923c339
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8568.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2026 23:33:58.5323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dVYkbqfGUybU6D8A2xaZJMT6e5LNKBJuB5HUs9rsgi203Lj2iTZuwVIWQzG6HHajmv9fJ4bUlG0biE5FqO4GGANNz1wWVsntPbN3rmSNJ7c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFC80959CE8
X-OriginatorOrg: intel.com
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-62679-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguel.vadillo@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: BC3705C0E39
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Mehdi,

Thanks for reviewing.

On 5/22/26 7:41 AM, Mehdi Djait wrote:
> Hi Miguel,
> 
> Thank you for the patch!
> 
> A couple of comments below.
> 
> On Thu, May 21, 2026 at 03:23:57PM -0700, Miguel Vadillo wrote:
> 
> [..]
> 
>> +
>> +/* I2C transport helpers */
>> +
>> +/**
>> + * cvs_read_i2c - Issue a read-type command and fetch device response
>> + * @ctx: CVS device context
>> + * @cmd_id: Command identifier (big endian)
>> + * @resp: Destination buffer for response payload
>> + * @size: Size of payload to read into @resp (without prefix)
>> + *
>> + * Sends @cmd_id and reads back the response in a single I2C transaction.
>> + * When the device prepends a 4-byte protocol prefix, the combined
>> + * prefix+payload is read into a temporary buffer and only the payload is
>> + * copied to @resp, avoiding any dependency on the layout of the caller's
>> + * buffer.
>> + *
>> + * Return: 0 on success or negative errno.
>> + */
>> +static int cvs_read_i2c(struct icvs *ctx, __be16 cmd_id, void *resp,
>> +			size_t size)
>> +{
>> +	size_t prefix_size = ctx->prefix ? sizeof(u32) : 0;
>> +	size_t read_size = size + prefix_size;
>> +	struct i2c_client *i2c = ctx->i2c_client;
>> +	u8 *buf;
> 
> use this instead:
> u8 *buf __free(kfree) = NULL;
> 
> and then remove the two calls to kfree() below.

This makes sense, ack.
> 
>> +	int cnt;
>> +
>> +	if (!resp || !size)
>> +		return -EINVAL;
>> +
>> +	cnt = i2c_master_send(i2c, (const char *)&cmd_id, sizeof(cmd_id));
>> +	if (cnt != sizeof(cmd_id))
>> +		return cnt < 0 ? cnt : -EIO;
>> +
>> +	buf = kmalloc(read_size, GFP_KERNEL);
>> +	if (!buf)
>> +		return -ENOMEM;
>> +
>> +	cnt = i2c_master_recv(i2c, buf, read_size);
>> +	if (cnt != read_size) {
>> +		dev_dbg(cvs_dev(ctx), "recv cmd 0x%04x short read (%d/%zu)\n",
>> +			be16_to_cpu(cmd_id), cnt, read_size);
>> +		kfree(buf);
>> +		return cnt < 0 ? cnt : -EIO;
>> +	}
>> +
>> +	memcpy(resp, buf + prefix_size, size);
>> +	kfree(buf);
>> +
>> +	return 0;
>> +}
> 
> [..]
> 
>> +/**
>> + * cvs_send - Common command submission path
>> + * @ctx: CVS device context
>> + * @cmd: Command buffer (icvs_cmd) with cmd_id and param populated
>> + * @len: Buffer length
>> + *
>> + * Dispatches a set of supported commands:
>> + * - ICVS_SET_DEV_HOST_ID,
>> + * - ICVS_HOST_SENSOR_OWNER,
>> + * - ICVS_HOST_SET_MIPI_CONFIG
>> + * - ICVS_FW_LOADER_*
>> + *
>> + * For I2C based commands it sets big-endian cmd ids, writes to the device
>> + * and waits (via delayed work) for completion or timeout.
>> + * GPIO based ownership toggles are handled locally.
>> + *
>> + * Caller must hold ctx->lock when invoking this function and check for i2c
>> + * bus availability.
>> + *
>> + * Return: 0 on success, negative errno, -EINVAL for unsupported command
>> + * or status from device in ctx->wq_resp.
>> + */
>> +int cvs_send(struct icvs *ctx, struct icvs_cmd *cmd, size_t len)
>> +{
>> +	int ret, status = 0;
>> +
>> +	dev_dbg(cvs_dev(ctx), "send cmd = 0x%04x", be16_to_cpu(cmd->cmd_id));
> 
>  From where I see this function being called, it needs to hold the
> ctx->lock. It is also mentioned in the documentation of function
> 
> Let's add a lockdep_assert_held() to make sure of it at the beginning of
> cvs_send()

Agree and ack'ed

> 
>> +
>> +	reinit_completion(&ctx->cmd_completion);
>> +
>> +	switch (be16_to_cpu(cmd->cmd_id)) {
>> +	case ICVS_SET_DEV_HOST_ID:
>> +		cmd->cmd_id = cpu_to_be16(ICVS_SET_DEV_HOST_ID);
>> +		ret = cvs_write_i2c(ctx, cmd, len);
>> +		if (ret < 0)
>> +			break;
>> +
>> +		ret = cvs_schedule_and_wait(ctx, FW_READY_DELAY_MS,
>> +					    CMD_TIMEOUT);
>> +		if (ret < 0)
>> +			break;
>> +
>> +		status = ctx->wq_resp.resp.state &
>> +			  ICVS_DEV_STATE_ERROR ? -EINVAL : 0;
>> +		break;
>> +	case ICVS_HOST_SENSOR_OWNER:
>> +		gpiod_set_value_cansleep(ctx->req, cmd->param.param);
>> +		fsleep(FW_READY_DELAY_MS * USEC_PER_MSEC);
>> +		ret = gpiod_get_value_cansleep(ctx->resp);
>> +		status = cmd->param.param == ret ? 0 : -EINVAL;
>> +		ret = 0; /* success */
>> +		break;
>> +	case ICVS_HOST_SET_MIPI_CONFIG:
>> +		cmd->cmd_id = cpu_to_be16(ICVS_HOST_SET_MIPI_CONFIG);
>> +		ret = cvs_config_mipi(ctx, cmd, len);
>> +		if (ret < 0)
>> +			break;
>> +
>> +		ret = cvs_schedule_and_wait(ctx, FW_READY_DELAY_MS,
>> +					    CMD_TIMEOUT);
>> +		status = (ctx->wq_resp.resp.state &
>> +			  ICVS_DEV_STATE_ERROR) ? -EINVAL : 0;
>> +		break;
>> +	case ICVS_FW_LOADER_START:
>> +		cmd->cmd_id = cpu_to_be16(ICVS_FW_LOADER_START);
>> +		ret = cvs_write_i2c(ctx, cmd, len);
>> +		if (ret < 0)
>> +			break;
>> +
>> +		ret = cvs_wait_wake_or_sleep(ctx, CMD_TIMEOUT,
>> +					     FW_READY_DELAY_MS);
>> +		if (ret)
>> +			break;
>> +
>> +		ret = cvs_schedule_and_wait(ctx, FW_READY_DELAY_MS,
>> +					    CMD_TIMEOUT);
>> +		status = (ctx->wq_resp.resp.state &
>> +			  ICVS_DEV_STATE_DOWNLOAD) ? 0 : -EINVAL;
>> +		break;
>> +	case ICVS_FW_LOADER_DATA:
>> +		/* Quirk for older protocols */
>> +		if (ctx->caps.protocol_version_major >= 2 &&
>> +		    ctx->caps.protocol_version_minor >= 2) {
>> +			cmd->cmd_id = cpu_to_be16(ICVS_FW_LOADER_DATA);
>> +			ret = cvs_write_i2c(ctx, cmd, len);
>> +		} else {
>> +			ret = cvs_write_i2c(ctx, &cmd->param,
>> +					    len - sizeof(cmd->cmd_id));
>> +		}
>> +
>> +		if (ret < 0)
>> +			return ret;
>> +
>> +		ret = cvs_wait_wake_or_sleep(ctx, FW_READY_DELAY_MS,
>> +					     FW_READY_DELAY_MS);
>> +		if (ret)
>> +			break;
>> +
>> +		ret = cvs_schedule_and_wait(ctx, FW_READY_DELAY_MS,
>> +					    CMD_TIMEOUT);
>> +		status = ctx->wq_resp.resp.state &
>> +			  ICVS_DEV_STATE_ERROR ? -EINVAL : 0;
>> +		break;
>> +	case ICVS_FW_LOADER_END:
>> +		cmd->cmd_id = cpu_to_be16(ICVS_FW_LOADER_END);
>> +		ret = cvs_write_i2c(ctx, cmd, len);
>> +		if (ret < 0)
>> +			break;
>> +
>> +		ret = cvs_wait_wake_or_sleep(ctx, CMD_TIMEOUT,
>> +					     FW_READY_DELAY_MS);
>> +		if (ret)
>> +			break;
>> +
>> +		ret = cvs_schedule_and_wait(ctx, FW_READY_DELAY_MS,
>> +					    CMD_TIMEOUT);
>> +		status = !(ctx->wq_resp.resp.state &
>> +			   ICVS_DEV_STATE_DOWNLOAD) ? 0 : -EINVAL;
>> +		break;
>> +	default:
>> +		ret = -EINVAL;
>> +		break;
>> +	}
>> +
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	return ctx->wq_resp.status = status;
>> +}
> 
> [..]
> 
>> + * cvs_core_remove - Shared remove logic
>> + * @dev: Device
>> + */
>> +static void cvs_core_remove(struct device *dev)
>> +{
>> +	struct icvs *ctx = dev_get_drvdata(dev);
>> +
>> +	cvs_csi_remove(ctx);
> 
> Shouldn't we cancel ctx work first ? And then do the CSI2 v4l2 cleanup ?

Good catch I think this was leaving a window for race condition, ack'ed

--
regards,
Miguel

> 
>> +	cancel_delayed_work_sync(&ctx->work);
>> +
>> +	if (ctx->ipu_link)
>> +		device_link_del(ctx->ipu_link);
>> +
>> +	pm_runtime_put_noidle(dev);
>> +	pm_runtime_disable(dev);
>> +	pm_runtime_set_suspended(dev);
>> +
>> +	cvs_reset(ctx);
>> +}
>> +
>> +/**
>> + * cvs_remove - I2C driver remove
>> + * @client: I2C client
>> + */
>> +static void cvs_remove(struct i2c_client *client)
>> +{
>> +	cvs_core_remove(&client->dev);
> 
> [..]
> 
> --
> Kind Regards
> Mehdi Djait


