Return-Path: <linux-media+bounces-27994-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B35DA5B959
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 07:43:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F0C11894F9F
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 06:43:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA0E81F874E;
	Tue, 11 Mar 2025 06:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G0da59mr"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2F8211C
	for <linux-media@vger.kernel.org>; Tue, 11 Mar 2025 06:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741675389; cv=fail; b=cA2fPrIYHxLI6RQHiO+WihZIoQ2roWQCQPHxm5LZ3IFNYYOsnrZTghSy6f3ou0vkV56YbQcF8dBoeBeGmt+j+hr0fumBe4LgtSdeZrLz3ATazX7d65zBPjoD9XfaahUPJ0QWeerlbDCFyqqCvwrXPimxTIKHVTCLOCvfXqIBi6Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741675389; c=relaxed/simple;
	bh=qky63Pybovo0C5aUbHvQp91xxpHimzdKMyzQVv7KPa4=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MnIdaLbAKo8cHb05NtnznWaXFJWCZ7HsyzZvCBN1riM3/JZN1XDHt1hu9ACxkBbVYeNI+d6xdAqjxjLJ1yGspHrbYog9CsY3chdG3hdMPPKhTlOCTN3Ktv4AfygfVh1HzrKFlhx1+jzOEeM8Eugbt7uwCyaMXSwgAUsnpRsZc98=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G0da59mr; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741675387; x=1773211387;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=qky63Pybovo0C5aUbHvQp91xxpHimzdKMyzQVv7KPa4=;
  b=G0da59mrICGp5284dMMNAIYLw/V4Lsw8HBxPQ8WJ52ZnGPtaZNsdmahA
   pAZVS3AAmfM6ZQ60oQoEShpFj8F3e7OY+EbmYqinZeruHQs6yhYmDnm7z
   f0GQCz0C2w76JtfpFBna2SfmfOVpzEamtty1pXYepuxLAkBA3P9DBnA5e
   gJKrdYweBAyJVs5yMcDlf/I/x7mAopejvVqBsbjY+w6ZBS1aJxY0n5Jyd
   wAU62xSte7K2yuG1O7XHTI2g/2NridscaiAiJyaj2f4584Gavv2hv6kTi
   Ran5GP6VXCD6o/IkbvcXAqAMpce0UzVah7iV+PBeB1DDCK7CAvfTmGmFd
   w==;
X-CSE-ConnectionGUID: g1FK1IFPQv2Agf3a9YNfWw==
X-CSE-MsgGUID: ERh9dhUFT+OkFT55z4q1yA==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="42883297"
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; 
   d="scan'208";a="42883297"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 23:43:06 -0700
X-CSE-ConnectionGUID: hbG8AsJXSEWe7W7fm9yKtg==
X-CSE-MsgGUID: KbxV2k90SRGN3rBtGSTGuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; 
   d="scan'208";a="125424066"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 Mar 2025 23:43:07 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Mar 2025 23:43:06 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 10 Mar 2025 23:43:06 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Mar 2025 23:43:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=asluCOF+n0vxwPHZy4AVkLKYzmnrTpl06nCJlqAATMDr1wuEhQ3uOlzqpL+ZxQHjtUid7noJEx1x4Bmh6NRXn47qSM+Rl2dWbjRFqqj4idMBDMY5HHXXAL9dPv7lX1Ws63alyTDL2XWM0x4bqxTh6S62wfWz3dva4+OE/rYrTJE/U8IXL87PiauZPOH9xe7kWVcowknqM+BxU4iKAwUqfr9kjDq5l2Pt753h6nAfvd5hLeb7loxM6eRQ3jIJz1hgaYlGGCuyYu0mtanFp7CtY2AJFPjDMGUPVQk2KcXz129Z5fdM1hDK+naHvnWwO18GNXsNRnhh4bLrxwqwHRBK+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DyFdZF3Fw92sSURK9yBMPEDutobIlunbYPErlvBiz9o=;
 b=yifGWo9SJ89aKcjoqB5ezPp8B52/RaO66pMhiBTtGyaWxSY2GW7/oAA25J7Yy36vRxwK2cRNG+JnXMnCukhZPskierKjOwWq9uKczUxwbZ0v3hxqKEId0nCJ3qokZBOmYE6Jv9eOt93mVkD2/q7425axBL6MxnGlLD8Y6zcBgPdLs+8SYeeNtIUbRNnS82Whg6OZU0VnWwbmxFsHneGUu17mJyF2Ho5CjFEbE9SSs9+6ybRcSVxWwS1rQ9bUfXZW295GwvfwH3PPkvjdLHvATfEJ0579RF+9LXH8HzarC02HsVcHpCBpxhwWUkGK+cn64sIjGOKYOYl/fp+FhEO1iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8230.namprd11.prod.outlook.com (2603:10b6:8:158::21)
 by CH0PR11MB8215.namprd11.prod.outlook.com (2603:10b6:610:182::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 06:43:04 +0000
Received: from DS0PR11MB8230.namprd11.prod.outlook.com
 ([fe80::a73e:80f7:8871:99ed]) by DS0PR11MB8230.namprd11.prod.outlook.com
 ([fe80::a73e:80f7:8871:99ed%4]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 06:43:04 +0000
Message-ID: <b1dd819b-89f0-4962-907b-29eaadd58ae3@intel.com>
Date: Tue, 11 Mar 2025 14:42:57 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: i2c: ov13b10: Support 2 lane mode
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: Arec Kao <arec.kao@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	<linux-media@vger.kernel.org>, Bingbu Cao <bingbu.cao@intel.com>
References: <20250307093130.1103961-1-hao.yao@intel.com>
 <20250307093130.1103961-2-hao.yao@intel.com>
 <Z8q_xpTIs1UsN0l9@kekkonen.localdomain>
 <f24a1543-9a8f-4e42-8cf7-40644f6d706d@intel.com>
 <Z86RSEg3BL0uiWlX@kekkonen.localdomain>
Content-Language: en-US
From: Hao Yao <hao.yao@intel.com>
In-Reply-To: <Z86RSEg3BL0uiWlX@kekkonen.localdomain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: KL1PR01CA0150.apcprd01.prod.exchangelabs.com
 (2603:1096:820:149::17) To DS0PR11MB8230.namprd11.prod.outlook.com
 (2603:10b6:8:158::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8230:EE_|CH0PR11MB8215:EE_
X-MS-Office365-Filtering-Correlation-Id: f39737fc-ff90-46b5-a758-08dd6067f963
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d1VHeWZGLy9ha0ZMekNuNU9SQ3Z5YUJTdFNTY1AvSk9sdXNXb0VKWWJPT1E2?=
 =?utf-8?B?VGRPbnhObmRrUzA0VHQwcEF5bHNzRGR5Y3BIcGM5SnVuZDR2SGFjVVVBdm1T?=
 =?utf-8?B?ditDTjUvL05YYkJVaEQrVDBCeFVPNCtXQkhsMFAwbks0MU44TXV0NDlPYnNp?=
 =?utf-8?B?dUhhb2xmc00ra0puZFJIS2hldGFRMGNHdzdUNXpOR0NiSFVwdkJFV1QvTlRS?=
 =?utf-8?B?a09URHB5NGhvbzJwL29rNURDb2IwSWNsNFhiS1FnUFVlKzlTSzVMVHY3RnBP?=
 =?utf-8?B?aThSVll6NnViOU1lVk05Q0lucnZxY1RTMWZta1VuRHd0Q1lDS1pQYTgzckht?=
 =?utf-8?B?WUNlMTNURXViRVV4Y0N1VzJGTmRSbHI0UmdRbFIxNzJMcms3VmJFSGpkdERG?=
 =?utf-8?B?aloybG5IczBwRTRNaFdDT3dOMnNrVWtYcFpqMStPV2ZWb2VkSUgrSVFTL25E?=
 =?utf-8?B?QXAxUWRwcS9ObWdjRHRJdlZpYnBqcGdwTWhzNDAxOWxEZEFzOVdwbVlwWTJG?=
 =?utf-8?B?NUp5NHZ6WDZSSld2UnZ6aE9YU1ovS3djbGxaQ0VPVmJwR0pPTUQ5MDM4cjF0?=
 =?utf-8?B?QmhTeDQvcUNNVlhma0Q5V3ZtaUpEWFRvYjhxMGdJUm9RVHVJK29QU3gwVzVO?=
 =?utf-8?B?bmJoem9ZTC8rVDg2d0xNUjVUQXVPbXRMbUZpZzcrQmpKWFdvc3lPVHFvRjdR?=
 =?utf-8?B?ZFBZSmtNYlU2OXJKdW8yS2k2NGFVT21udWhrM3dnVjZuWVpWRWs1anFmL2U1?=
 =?utf-8?B?SEYrWnlQSTFqQUpscnFnNTFma3JMNnM2aDh0by9vTCtZLytnaXlzb1pnMVFm?=
 =?utf-8?B?TG5tZW9BOG44emthZktTYzVrZUhrbHVNbXIrTGtsYkcxcWVlaFpCRlp6b2ZZ?=
 =?utf-8?B?a1hMM0F3MndtcVk0dHk5ajhMVXRMQXQ2K2o5eksvSlVLZmRkTjRFZzY2NFBy?=
 =?utf-8?B?aHVSVTlUcXNJMmtNUHp5MlpDa2FQcy92eE1hSkR5UnBrY0JWR2F6RWVRcVYy?=
 =?utf-8?B?Y0xPM2xXWFFEdlQ3b0p5bVRBbEhIb28yQ2daTjFKUWJCQWtzcHdzWUh5dzRO?=
 =?utf-8?B?N3B0YnZXaExYcTk0M2liWmhXVC9mMGNCLzMwN21UaVlVRFREMDdzUFdIRFZ5?=
 =?utf-8?B?T1RuMEtEOXJWOFJWTVgvTDl1RG56TG9jOEU2TkFSWkM3bmluK3hidFF6VFQz?=
 =?utf-8?B?bFlSNEtzVHNaYW82MTlqZDNsYllsTFhsTWlYTnRzQXRiNUM1cWJwdnVlbjZj?=
 =?utf-8?B?a0VWZXJLU1E0ME1jZzhGYXNSdkhrQWtrc09mWkw5bzhRcnNMaXBFa2Zjcnho?=
 =?utf-8?B?VE1GR0t5bGNZYUlDWVl0VFFUV3dCZmc4UmxVL3BHb2l1UExVd2lQR1RBWDNr?=
 =?utf-8?B?c0hPWG9hbnFJbFN2NkpEaUZUUERLRFJQbDhEeThLVHdScWRCV1cyVjRVVi80?=
 =?utf-8?B?c0RZemcwSVVCZmV5TmRRcWpoM2pPMGlXYjJmQUtwajQyUUttRi9JU21sMzJD?=
 =?utf-8?B?VlNhUU5JVTgvOUtmZTAzK1hwMjZEc2Z0SzhUdFBEd21xejMya0V0c2IxRnMr?=
 =?utf-8?B?U3ZlK3F6VThTY1BCeTBkUGZITkpubHNzRnVHeFlYTlFRMVBLTGIzb05XU003?=
 =?utf-8?B?SWhiT0JPQXJTWVZNZzkxUG4zRWk5ZkNhOTZZR0pqM0wwZ2VXT2REaHNSVzNt?=
 =?utf-8?B?cU5CeTV0MnYxMEdwYUlDWnRycEtjN0FUY1NZQm1tZUZKR2tsNGJyKzYrQlRz?=
 =?utf-8?B?SlNuSWVwVFR6bG5oQWFaeWdNSk9aQmxJVFBuS1QvSEVhUE1mYkF0Q0JUZmhD?=
 =?utf-8?B?NnVEL1d4bUZSSWFnTW14emhLT092bW8vbERlc3JxVjNJb2ZsbDl2QzFmTEhD?=
 =?utf-8?Q?c+JeRFv2weuRd?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8230.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkxSU2tuR0xxUTVUYzJTMlAvYjRONFE3dm9LTmcveStUc2p2OEV0OS9neEh1?=
 =?utf-8?B?UVo3bGorTjdXKytUODNwbE5LYmdDYlpua3hsZnVkRTJnc3g1S3JvL29EWTkz?=
 =?utf-8?B?enl3SStMUDZjWWIzV1VwdTUxYjN1Skwwd0tmc1ZDZ0JNTmQ0V3dxTTllekFv?=
 =?utf-8?B?VW9UYllNaThYRkNpYlJvUWtyRWVTMElXNjJQWGw5eElYYWpidEVZK1R0c2lP?=
 =?utf-8?B?eUdjTTc0WVZwKzIyZEY2a0YzclNWUW01THkydTlNMFdVdkpyUWwxL3JSUldU?=
 =?utf-8?B?MVVxUG93NEZxQ2hJd1RIME5UbDlnZHJHMlhQT3NzUGhCcVdDMkVBczJhVzN2?=
 =?utf-8?B?aFBLcTdoYmdoeU9GSjV2NGhERG9adm53bDN5VEJlQ3NXamFvQXVtQmhiZzZi?=
 =?utf-8?B?b0VqV09rYkpCa0c3Ykd2RklpMFVTSUZOa3FmbzhNQ0FmeDQ4RkV5YmE1VXRT?=
 =?utf-8?B?SlQxaEVhaTVEZ3ZsVlNsSjFFVGhiaG5iR1BiMVZBSDE5eUJwQzlhL09MRmx2?=
 =?utf-8?B?OXBvc2VoQzZUemxja1RRUzNFMGRuK1pxVHFUOVQ4ZDk3cGx4cGFoY0hYS3hU?=
 =?utf-8?B?WVAzQTA0TWJ6TEE5TlBYUGhtL05qdTlNYndyZFBKQTExbGp4YXB5U0JWNTAr?=
 =?utf-8?B?ZkZiN2lqaWpwMmJCeW53cmhoVDkvMG5sOVpWK3kzUjMxcDZBTHI1QTBZVVNz?=
 =?utf-8?B?NlFmL1VjNUFhbkV0ZmtrcEdMUDA3cnk2bDVZcU1aYk1IREtMbzBjckpIdGV5?=
 =?utf-8?B?Wk0rZWNVa2VENjB4TXJBY3hXdnRtR0NzK0lxb1pnNEZUSVluWE0wTmJFeVZT?=
 =?utf-8?B?MU56anVrbnNQa0oydmdyUGRpdHM5UGxZWjgyRG5LWVNtVXNoOGRwVCtDc2FY?=
 =?utf-8?B?ZTd2VFk5ejRuM2EwNUhBd3VvRU9sUWpIeHJQYlZQOVhSd2NKcElVZ1p0WXRN?=
 =?utf-8?B?MENjdENxY2tGVHladW9aZVFlOGFaYVkxT2lKYkF6Tk02b1hGSUZNZTFObFJE?=
 =?utf-8?B?KzVkNXB0Vy9PRS9yVGpCazhmelYvaGVGWUZkQ3pHSzFOdUx0b3ErUE9ONmc0?=
 =?utf-8?B?bzdGZ09JOVI4N3B1d21DZlFjQUVqNXh0RkVGSXVkTk4zUDRibnlHTmZndlJC?=
 =?utf-8?B?K1JkM3paL0dSdENOZU44czNtSFRGZG93OTFkU2pUVHVobG9EVjRpek5GTkNN?=
 =?utf-8?B?ejVReWhkSFNCRmh6MzU3TE1xTitFOUJlODdJbHdhWS9UaythY1ovbkxPalE0?=
 =?utf-8?B?Y2x3VDFpeEFWUlNPazArRkJ5SzYzVlB0VDRPQUc5QnE1SUxYOEV1QU9jVnA5?=
 =?utf-8?B?UkYyeFRUSzlZWkVpa1NKWTdhWXhnb2RlU09vWEJZdGJGektBQndmQmtNUW9a?=
 =?utf-8?B?c2pwNFhtYy82dzlaV1F2ZHQvdTJTRjNvdGttZFJ5SkJsOFJRb3E4dWhuVUtR?=
 =?utf-8?B?RnU2R1JBc0J6MEVGbmhsNURUSkRwaFJ6ZFJvVlJTTURGckVCb3psR24xSVJX?=
 =?utf-8?B?WktYWHExVVFwRkc4dmJCQmZwSTRnelB2Y1VzZ1puQ3VobUNURmU0UmFZdGJr?=
 =?utf-8?B?V3ZheWNtV244NXRjM25VV3ZXQkNRYXZGRHRjTVRFOU5wTGNnZlFmczRnZ3RM?=
 =?utf-8?B?TzgvOHZRNW51Nm5pa1hLTUpYMFZhTlhyeURrZFhDMmJTQktaMGZrenZvZyto?=
 =?utf-8?B?RkFVbjBhMG1sNHd4cWdWdVFLUUdBVzl6bWZDVmFnNFdHM25lOGhGdUNvckdG?=
 =?utf-8?B?MDNaVDhBYUcwTG12MmwrTXVuVFhoZmxaSmNDbVFqR05zbUNYZS9OSmcxY1RM?=
 =?utf-8?B?UmNCcForVFZDaHlYRGZlVjkvUnJneGQrZzFtYjFOVWRVQ2FMNklKMkVRRWor?=
 =?utf-8?B?WWMxZzV1OUdmWDZQczBKM1g0WWtuZXVtWWxyMWc5c1VvcDVSTXc5ZGh0aGU1?=
 =?utf-8?B?dzdrRVRpZVBMV0RncStLQjdvVjZyZ1IzWXA2bVZjbk1QWmE3NFFwM1hCNjZU?=
 =?utf-8?B?VWNXb0RGakRJUk1nekRTa3ExT21kdkRTQUF1QkxQYUpzby9CTElPWXlDaEFK?=
 =?utf-8?B?Wko2bGZyTjFoSFBEa3cvYjcyd3Y1K0VNSmxtUlUzWEkxOHd1U0JnNTZhUTk1?=
 =?utf-8?Q?zob0/tjb0IIMfiqGLRX9fsnDm?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f39737fc-ff90-46b5-a758-08dd6067f963
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8230.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 06:43:03.9730
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K3mlZoEE4ipGMMHHM+bC6IO9GQOALS/eepoH/OIUmBGEBVrcuXsoyt2tNTTURxTWnLJZ5cestuHESW43/of7XQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8215
X-OriginatorOrg: intel.com

Hi Sakari,

On 2025/3/10 15:14, Sakari Ailus wrote:
> Hi Hao,
> 
> On Mon, Mar 10, 2025 at 12:06:04PM +0800, Hao Yao wrote:
>>>> @@ -1459,12 +1539,25 @@ static int ov13b10_check_hwcfg(struct device *dev)
>>>>    	if (ret)
>>>>    		return ret;
>>>> -	if (bus_cfg.bus.mipi_csi2.num_data_lanes != OV13B10_DATA_LANES) {
>>>> +	dlane = bus_cfg.bus.mipi_csi2.num_data_lanes;
>>>> +	if (dlane != OV13B10_4_DATA_LANES && dlane != OV13B10_2_DATA_LANES) {
>>>>    		dev_err(dev, "number of CSI2 data lanes %d is not supported",
>>>> -			bus_cfg.bus.mipi_csi2.num_data_lanes);
>>>> +			dlane);
>>>>    		ret = -EINVAL;
>>>>    		goto out_err;
>>>>    	}
>>>> +	ov13b->data_lanes = dlane;
>>>> +	ov13b->supported_modes = supported_4_lanes_modes;
>>>> +	ov13b->supported_modes_num = ARRAY_SIZE(supported_4_lanes_modes);
>>>> +	if (dlane == OV13B10_2_DATA_LANES) {
>>>> +		ov13b->supported_modes = supported_2_lanes_modes;
>>>> +		ov13b->supported_modes_num =
>>>> +			ARRAY_SIZE(supported_2_lanes_modes);
>>>
>>> How about using switch() here?
>>
>> How about:
>> 	ov13b->data_lanes = bus_cfg.bus.mipi_csi2.num_data_lanes;
>> 	switch (ov13b->data_lanes) {
>> 	case OV13B10_4_DATA_LANES:
>> 		ov13b->supported_modes = supported_4_lanes_modes;
>> 		ov13b->supported_modes_num =
>> 			ARRAY_SIZE(supported_4_lanes_modes);
>> 		break;
>>
>> 	case OV13B10_2_DATA_LANES:
>> 		ov13b->supported_modes = supported_2_lanes_modes;
>> 		ov13b->supported_modes_num =
>> 			ARRAY_SIZE(supported_2_lanes_modes);
>> 		break;
>>
>> 	default:
>> 		dev_err(dev, "number of CSI2 data lanes %d is not supported",
>> 			ov13b->data_lanes);
>> 		ret = -EINVAL;
>> 		goto out_err;
>> 	}
> 
> Looks good to me. I'd do the assignment to ov13b->data_lanes after checking
> the value though.
> 

Thank you, I will prepare v2 later.
BTW, do you have any suggestions on patch 1/2 ?

Best Regards,
Hao Yao


