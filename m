Return-Path: <linux-media+bounces-21562-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CC29D1F35
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2024 05:26:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 83F65B2371C
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2024 04:26:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25DC314D430;
	Tue, 19 Nov 2024 04:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gD2JdK4r"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC9113B287;
	Tue, 19 Nov 2024 04:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731990377; cv=fail; b=W+mdcP9ZwYsHxr5DjrrBljYP9q7mFwFCrt170lfBzSmZ89xr14mlESs6IldVe4s+ZBAT6i8qyTmNs2yeW5QtUBCQ7Fc+KM8vx2fRRN3gdnA4HrOi5LlFzM74P7Bjk49n5oTYjqz/vY1zUKK1urtHy+DSer9zzvoowkikpQp4Shw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731990377; c=relaxed/simple;
	bh=/U0EumBW6lCG3quKnYU+Sdh4+f+ze/2HvfWrMs2WKyM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZOtZ5OpqctzFYl2CPbIu/6kdddpR/jWcXINlNyBzSIuop+FUDDdDIdwqvXwEL4+CcjALaQbYOs1O831iZmgrMThIlyXzi8oqq1BxVGLse97KGTpizm3/CsqpNYq8OfjjvMwDL28SDqaPRaMko3cc/+3G13DQovqMwIYOMGoOtn8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gD2JdK4r; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731990375; x=1763526375;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=/U0EumBW6lCG3quKnYU+Sdh4+f+ze/2HvfWrMs2WKyM=;
  b=gD2JdK4rMiS1EioX5FgXdmuVKf4PySjo46jma/BB3L628imMD+JYiHI7
   OS5+1L+2k/lrbAVIe6CCGg56Gs5uOCbWfU8/z14cclhX4oRpxylX3HNzS
   O2ln7+2fSVim5hcoOSk636FIyw76fOzyevYCO97sUl5npyc9fim5F3dHM
   +bUq63w1pRFqLm1TjjkJUXpyrtDB11twH6xj2kUO+s1DdARfnjviYFHX4
   lum/I5tbRhxyOdp1Q2SmiL2cWtoTxF488F/K/FOPLm1jeW3FIJ02uv77Q
   CMb3h4sjLVWp4NLLJtLga13bOIaBbv4GD7sTBZV/Jx9tEY1//Q7uSiySp
   A==;
X-CSE-ConnectionGUID: 8FffWjfvQNmLVsdCq8y2Ow==
X-CSE-MsgGUID: uLqcfV44SMu+1FcFufsN2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="19583376"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="19583376"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 20:26:14 -0800
X-CSE-ConnectionGUID: j/GIrAcaTsmWv4Hn86F3mA==
X-CSE-MsgGUID: 4M6cPQZRSqmT7X8LXwzveA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="89208048"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 18 Nov 2024 20:26:14 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 18 Nov 2024 20:26:13 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 18 Nov 2024 20:26:13 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 18 Nov 2024 20:26:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y0rMBYv7BWA5Odg0t3ypDzwRb9at+V4Sop+mTN/3UTcje3XkPbC0nsicI9e9gDxbdq33nyW8xRDghCUPTNvqyXVBic/ft1nvt/tItqCCiqz1Er6DAg/iwsBRLylKsJ9ASi5mOlZllg5S9n94NF5iYD6wNqfjwvtfK6pUDIz/cAihg+vItCUfDbMLKDLrs8UYfvalIHX4sQIk1Hi9s0UuHsYwGlZmOrAxx/y/1dfYhafBUHYcN2AQTuet17fCEDQz1LKbUBqGCAARHui+1LATLRdhn5H2SeUWHp+ElXAoNXxfc5bt43UXM3/4QOxl0la4Zu3UBuAgWrtwBvEyM1swSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/U0EumBW6lCG3quKnYU+Sdh4+f+ze/2HvfWrMs2WKyM=;
 b=SvicKEggMpOAdSsggXJk59gt8+bC0r+OoYLHroKgXFL5lLVJSaozQs5LtaGYst75IfsWR3WX/qRaA73DX/xcRlPzLRiuJ+8+8qGfN+oh9yLsnbDEgIUHi7DEKh9Bi5yWblxF+tonLimpn1hzMDwCm5AeomEV/lOX9KDL1bmvRd/bVkDjxwLwlqd7zjkHpKi2p8aBEkJgDt9I6sXxcru9trKHVlV3INDq037J0wyVF1jlFZN8xQwR6Yjs8M/pqzhoFewijZ/PXc5IJqsw+nJyeWA4cTlFECI61mdIc7tmrzr258piOluZwlxhm2wh8vv9WIxcFcte0jbNmHQ+qyYgKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 BL1PR11MB5978.namprd11.prod.outlook.com (2603:10b6:208:385::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Tue, 19 Nov
 2024 04:26:09 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2962:1efd:f912:a5a3]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2962:1efd:f912:a5a3%7]) with mapi id 15.20.8158.023; Tue, 19 Nov 2024
 04:26:09 +0000
From: "Cao, Bingbu" <bingbu.cao@intel.com>
To: Nicolas Lorin <androw95220@gmail.com>, "sakari.ailus@linux.intel.com"
	<sakari.ailus@linux.intel.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: RE: [BUG?] media: ipu6 / ov01a10 webcam not detected
Thread-Topic: [BUG?] media: ipu6 / ov01a10 webcam not detected
Thread-Index: AQHbN7xH/E8ALQiM0UKuwVluubje1rK5a6AAgAMOC7CAAPFvAIAAmiJg
Date: Tue, 19 Nov 2024 04:26:09 +0000
Message-ID: <DM8PR11MB565358EF5A7F96CD1A364C5F99202@DM8PR11MB5653.namprd11.prod.outlook.com>
References: <cb2c20c3-e9f9-4758-92bc-43591946ed9d@gmail.com>
 <50811f23-4d59-4ea3-9259-042e7bf557fa@gmail.com>
 <DM8PR11MB5653FF8ED0A4E9BA67B42CF799272@DM8PR11MB5653.namprd11.prod.outlook.com>
 <82148acf-3998-47b7-8fad-ba0118662cf9@gmail.com>
In-Reply-To: <82148acf-3998-47b7-8fad-ba0118662cf9@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5653:EE_|BL1PR11MB5978:EE_
x-ms-office365-filtering-correlation-id: b2d270d9-1cb6-4a3d-d0de-08dd08524b18
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?c3haempjcXhKdnY4YjZHM1V5UjJCUVpOVEttQ2dKc0VuSkdmdkpQanIwNW1i?=
 =?utf-8?B?VTFWc2NoQ3FvTXBrenBaRVR1MG9zejBWdFhPa3o0VGVta1liYlB3bGdvRXNM?=
 =?utf-8?B?OVNtWEw3M2JaNkNGTkFpc0FHZ1d0UUJMOGVEWHFkd1U0aWpjVm5hVzBOdlUv?=
 =?utf-8?B?UytMd1BSK1M4R0N2UmFSMkUvZ3FlYzhrUWYxYmpiWGEzcjlpOWgvRDI3RXN2?=
 =?utf-8?B?VEw3SU9lcDllSkE1RHMySTVvbmR4ZC91UUdrQ2t6UjJMVXJERTI0N0hCN09y?=
 =?utf-8?B?T0NiMXUrWU9IditQV0JIeXBzUXl2a1U3QUdMMlI2SFpncWhWS2kyNzBLOU1E?=
 =?utf-8?B?ZndyRWgrQWkxK2JRRVF5bmRsOG1FNmN3QjFyTm4yODB2bUd6SFl0azFMV3Fa?=
 =?utf-8?B?RWs0R3JXcnJjL1UrS0pKUllYb3J1VFBKbzh1VGRIa3NuOElKdStlUmliSzg4?=
 =?utf-8?B?WkJ0QW1XZG9sbHMvek11N1YyTnVsakhQVkJoVkNnby9HeTNPZ3Ywd0hQTjha?=
 =?utf-8?B?dFNKUjNGTDdaVElpcmw3dmxxWjkyY01PYlN5SHZxOUl6dWZJN0Rsd3F5NXV6?=
 =?utf-8?B?K01SVGczR2VpVWl5cUJJeDA2aUtyVTFyclZEZ2IyRld0YWdKZzJaaTBaUDZN?=
 =?utf-8?B?NnV5OEJvckl0cjFkVlVBRk5xQWx2ZGx6Z25vSktwRnU2R1NCWUFJc2JQcHg4?=
 =?utf-8?B?Mm5sdUNKS3VuR2pFOG1uekY1Wk5oMXArbXI5V05JUEV1NUNBZ29aVEN6NUhE?=
 =?utf-8?B?VHZMc0Ixd2wzVnhsVUZ2VUozS0lqajI4SkU4SkgzcUNFOWZRbm0wdEdmRFZH?=
 =?utf-8?B?RkpsZHBUY3pUQk9wU3E4T3ZsSys1K21hZHRGYzFiVzZzK3FXQ1lPdTdaS3VK?=
 =?utf-8?B?VjBib3J4OVJtVWpCN3JLY3VialBiY0U1OW5scC9OMzJIUllRYlpsNUFOOHox?=
 =?utf-8?B?NUV3L1R0ejR6ZnRXa1FJNmVIMHV4MXppZ0dlVnY1RjV1dFN0MzVnellaK1Fk?=
 =?utf-8?B?Q3h0bmtMb1RpUGt3bWxZNTZMZ1JZR3RhT2RWTE1jenRkQWd1ck9DOGxxSThk?=
 =?utf-8?B?WDl5UWp0MkRHN3FOYkhpQWxJMEdQWEpOc0tJMCtEbTJQcmFDSVFjVW1NcTZV?=
 =?utf-8?B?aDVMV0dkSjRrTFphZjJzdzIzMTg0clEwTnlXV2ZhNSttOGFGWXF1dFY1anhm?=
 =?utf-8?B?bDd3VGVNbXMvd014WFB6REJTUlE4dy9EU0ovQlJreXRCQ244K0JCd0dqV3RL?=
 =?utf-8?B?YmFnc0tuZkhBTlovelJKOEcxSXdOdThBLzFEb29yaEg0S3dXSHdIclp3WThh?=
 =?utf-8?B?aGdwQ2tIS05IWUF4RjNrYURHWFNrVStyaVFSa2JnRkYrSjBhTlJxajJNYXA3?=
 =?utf-8?B?eU11OFhaR0JEalN5V215Q04wbmt0N2djUHRpNG4rK3JZODI3MStNOExuZmda?=
 =?utf-8?B?UkpGTytSdHZVK1ZjYWJUZkdYeUFqYkZGRjl3OXdzNDJXNlNiSTFYSXprbzRj?=
 =?utf-8?B?NGh6Y1dxYTZrd21CcElDOEhlK2llMTFVZG9jaDAyUkNkMTA5SHZHN2RLRGdH?=
 =?utf-8?B?TW5vOTdtMmJ5dGkwTUFkeTVOWXhVTkRLU0N0TjJ2SUZjcmR2VEhkZzhrMVBK?=
 =?utf-8?B?am5WeW4yTVpoLzN6d1h2WCt4U0RxZVl1QU1WTVdmVWcrVCtpdGJyYnR3aUtm?=
 =?utf-8?B?cHlHbVJkN3RlVVE4ZXB0WnRYWVV2ckZhTW8ySVluQ3ozbW02MnV6S0svVHNu?=
 =?utf-8?B?Wkl4TUlBbm9FNmVyVnJVaUdHdlJERnRqU3IyV21tQ3M4SlhzWUVhbTV1VGlI?=
 =?utf-8?Q?JxGdy9fr6cMr/6G71IY4h6U99EYfKq7SlSk2I=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5653.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OFg2UDlFREhyRXliYWFnSDMzeXg0MTFHVXlVeWt3OVpHUktSaHdwYVVRTnRK?=
 =?utf-8?B?cmpKcDRTajVOTmFzN09KMEtEQzJUcTNMQUhjRjJZck9lL0dyaUd4cWJubzZq?=
 =?utf-8?B?MGpGVnRHUWhqMEZ1UW9iYW1aOElLK3BHOW1TK2lHaVVkdmVuNHkzVWpLcTZr?=
 =?utf-8?B?MmU2c3V0amh6ekNRekhjZkJiUFRaUVU0NkJzd3FkaUduUFN5YzJsK2V3RVVv?=
 =?utf-8?B?aDNlTkJ5UmdFaHE2azNXWUtuSnU1a1RNOHYrZllBVGtGUm0rMEgwL2NrVndL?=
 =?utf-8?B?am5EcmV3REt2QnlWUEg1dE5sYWJWQmVWRVhSZHhlQXRhYzI5OG1zNVhSYUw0?=
 =?utf-8?B?TlFHQ2hQQ1I1MWQ0Skl5TG5kaDVJNU1lVmlub0JFejU5TjRvRlFQazA0eUU3?=
 =?utf-8?B?QlYvU1I4d3BTbWlOTW1Ya3hsSmN3dUppNDVhZ1VldXJwNm12M1VFZzhLdmI3?=
 =?utf-8?B?Q1NrOW9jQWpOS2RTdFF3clZ4YmlOWHlZY0dLdm1reDdKc1BhbzdpRGtiMW9t?=
 =?utf-8?B?M3VqQ0VRVnpvVHpSazJRMmYyOFladGk1WktaT3haSzhXbU8vNjNrY3BpWlEv?=
 =?utf-8?B?QkI3bndNdGpjalNWR0VqYkRZZ29yWE1ZSllIVVdINFNmMno4eHFtWXdxT0dL?=
 =?utf-8?B?YUlWTXppdmwyR1pGdXpNM1d6YU1iMkx6eURRRXZyczlwcyswejlteVc4VkxF?=
 =?utf-8?B?akQ2RVBrNVEzVFJ4UGdPQmdNWWs1UEtVQTVpZnFuaG5wTTN4YVc0VlhYRVVX?=
 =?utf-8?B?bFN2TVhKdEpSUUJuSFQ2cSt1bllvZzRPL1JaVFZiRDdvMUJxSlk2MU5oUXRP?=
 =?utf-8?B?eFg5VW9OU2RXb0RieWwxYnM4d1k2c0gvQy9LRWE3YlpPaDJFUUlrQjY0Tkts?=
 =?utf-8?B?Y1prVWVnTWxHdTVReFpVWnh4TStQeU5ZZGVucUlTcDIyNjRZM0ZtNFNQUUZm?=
 =?utf-8?B?YWNLWlJtMk9VRnEraU9VemYwK3ZzY0RKK0ZhOS8rcXpHK1dibllNcHI1NVJ2?=
 =?utf-8?B?WXlxb0xSczJ5ZWhIMDZmV1E3dEVLam16N09abkViVFdZbFZoOGhMNGcwd3dj?=
 =?utf-8?B?eGRzZTJuZ0JrU0hpUXM0cjNrOWxST05kU2EyM1NlVzZuL2tScE5pZGUycWY0?=
 =?utf-8?B?QURGNy9WZzFGdkVKNzlSMExkdHZXaG8yUEF2N09ESmM0SnNKNnQ5U3IwOThS?=
 =?utf-8?B?V0dZcnF6K3dVenQxMDlrdFgwWGozdms0eGdWR3pTaGplaE5xUmdBak9aaUVP?=
 =?utf-8?B?NThSb1M5akkxdVZlZ3NnL1I1Y3dwYU5xa2lDc0NDYmdoMGp2MmFOd2pBMU9o?=
 =?utf-8?B?L3dRMVB3ZVc2YkJ2cU1BQ1hvQ1pKZkhCQ285QitBOXFleFo5a1BSVjlIY0VW?=
 =?utf-8?B?UlVSU2svdExpNnV3Y0V2S2l1Sk82T1dqTUhqa1AxaXhTd3BDT0hqemk5TkJX?=
 =?utf-8?B?bENaaXVVei9Icnk2TzFWS2VkT2ZidFlBVVFEUkJEckczanhHV1JRb2lLRkdr?=
 =?utf-8?B?TjJaN2lVOE9ib3dLNThKQlpYbk1sTytZNlppMjl2UnY0SGpuUWtBQkhqcUF0?=
 =?utf-8?B?OUxnenFtOHdSN1psci91cTlVUm5ubVZ0REFhR3IrTjU3bm1SNDQvUkFjaHgv?=
 =?utf-8?B?MjlKQm0xUnMrUVFBZG1vYkprT3loalZSUFRWZFVRSUNMdEE1aXJGQzRLTEFv?=
 =?utf-8?B?clpUMG8ycDIybDFHSnVvdWJ4MDRkbUE1KzdjaUVFSlVHc3hBQlB6eDQ0aVEx?=
 =?utf-8?B?U3FmcWZYSmQ1VExDRWlPczl0OG16YWtFcWNyZkxObUVQZzN3MEFBZVppQnlO?=
 =?utf-8?B?aVQ4amZtdk1Rc3BET2JBUmVaZ3daaVFyeGY2bE85STNHYzFNQ0Zhem02NXY2?=
 =?utf-8?B?TXVHY0g2aVRqUHA4cG9pT0syOVlYWEVUUU5oTGJKUnBBUkNUYzNMNVFPYmh6?=
 =?utf-8?B?YVZ1eUZlajZMM2lIVWhlNkJSdHFWcFFEQXFQSDArNkNGUlF5dUNGd21yT0gy?=
 =?utf-8?B?SWtjK3ZDejRjMXNETGtsZmpkR09zL3lNM0hxNFR1STFTeVFuS2daSm5FMkFi?=
 =?utf-8?B?aURiYU9reGxqR1FsK3RSUmFrTkF4Snhod1pEam00UFRuZUVKeWllRjhxNExT?=
 =?utf-8?Q?yTyoHEwK3unrW1oRQglsuYkw4?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2d270d9-1cb6-4a3d-d0de-08dd08524b18
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2024 04:26:09.6152
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4HilSRgDmIQ6OS3hubQqaPSLiucQxTG2UkBUQE7D8L3b1/QOFIFn5lRZ1Wx1q30nwt0Mo3MbHHahzfxFDjW0Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5978
X-OriginatorOrg: intel.com

Tmljb2xhcywNCg0KVGhlIElQVSBzaG91bGQgYmUgZW5mb3JjZWQgdG8gcnVuIGluIHNlY3VyZSBt
b2RlKG5vdCB0aGUgYHNlY3VyZSBib290YCkNCmluIHByb2R1Y3QsIG5vIEJJT1Mgb3B0aW9uIGZv
ciBpdC4gSSBzdWdnZXN0IHlvdSBnZXQgc3VwcG9ydCBmcm9tIHZlbmRvcg0KdG8gY2hlY2suDQoN
Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQ0KQlJzLCAgDQpCaW5nYnUgQ2FvDQoNCj4tLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPkZyb206IE5pY29sYXMgTG9yaW4gPGFuZHJvdzk1MjIwQGdtYWlsLmNvbT4N
Cj5TZW50OiBUdWVzZGF5LCBOb3ZlbWJlciAxOSwgMjAyNCAzOjA5IEFNDQo+VG86IENhbywgQmlu
Z2J1IDxiaW5nYnUuY2FvQGludGVsLmNvbT47IHNha2FyaS5haWx1c0BsaW51eC5pbnRlbC5jb20N
Cj5DYzogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgbGludXgtbWVkaWFAdmdlci5rZXJu
ZWwub3JnDQo+U3ViamVjdDogUmU6IFtCVUc/XSBtZWRpYTogaXB1NiAvIG92MDFhMTAgd2ViY2Ft
IG5vdCBkZXRlY3RlZA0KPg0KPkJpbmdkdSwNCj4NCj5Ib3cgY2FuIEkgZW5mb3JjZSBzZWN1cmUg
bW9kZT8gSSBkaWRuJ3QgZmluZCBhbnkgd2F5IHRvIGNoYW5nZSB0aGF0Lg0KPg0KPlRoZSBjb21w
dXRlciBpcyBydW5uaW5nIERlbGwgQklPUyBmaXJtd2FyZSAxLjI0LjAuIFdoYXQgZG8geW91IG1l
YW4NCj53aXRoIGNvcnJlY3Q/DQo+DQo+UmVnYXJkcywNCj4NCj5OaWNvbGFzIExvcmluDQo+DQo+
TGUgMTgvMTEvMjAyNCDDoCAwNTo0NiwgQ2FvLCBCaW5nYnUgYSDDqWNyaXTCoDoNCj4+IE5pY29s
YXMsDQo+Pg0KPj4gV2h5IHdhcyB5b3VyIElQVSBkZXZpY2UgIHJ1bm5pbmcgb24gbm9uLXNlY3Vy
ZSBtb2RlPw0KPj4gYGludGVsLWlwdTYgMDAwMDowMDowNS4wOiBJUFU2IGluIG5vbi1zZWN1cmUg
bW9kZSB0b3VjaCAweDAgbWFzaw0KPjB4ZmZgDQo+Pg0KPj4gQ291bGQgeW91IHBsZWFzZSBjb25m
aXJtIHRoYXQgeW91IGFyZSBydW5uaW5nIHdpdGggYSBjb3JyZWN0DQo+SUZXSShCSU9TKT8NCj4+
DQo+Pg0KPj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQ0KPi0tLQ0KPj4gLS0NCj4+IEJScywNCj4+IEJpbmdidSBDYW8N
Cj4+DQo+Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4+PiBGcm9tOiBOaWNvbGFzIExv
cmluPGFuZHJvdzk1MjIwQGdtYWlsLmNvbT4NCj4+PiBTZW50OiBTYXR1cmRheSwgTm92ZW1iZXIg
MTYsIDIwMjQgMjowNiBQTQ0KPj4+IFRvOiBDYW8sIEJpbmdidTxiaW5nYnUuY2FvQGludGVsLmNv
bT47c2FrYXJpLmFpbHVzQGxpbnV4LmludGVsLmNvbQ0KPj4+IENjOmxpbnV4LWtlcm5lbEB2Z2Vy
Lmtlcm5lbC5vcmc7bGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnDQo+Pj4gU3ViamVjdDogUmU6
IFtCVUc/XSBtZWRpYTogaXB1NiAvIG92MDFhMTAgd2ViY2FtIG5vdCBkZXRlY3RlZA0KPj4+DQo+
Pj4gU2FtZSB0aGluZyBvbiBsYXRlc3QgbWFpbmxpbmU6DQo+Pj4NCj4+PiAgwqAg87GeqiB1bmFt
ZSAtYQ0KPj4+IExpbnV4IGFuZHJvd2Jvb2sgNi4xMi4wLXJjNy0xLWdpdCAjMSBTTVAgUFJFRU1Q
VF9EWU5BTUlDIEZyaSwgMTUNCj5Ob3YNCj4+PiAyMDI0IDIzOjM1OjM1ICswMDAwIHg4Nl82NCBH
TlUvTGludXgNCj4+Pg0KPj4+IGRtZXNnIGFsc28gc2hvdyB0aGlzIGFmdGVyIHN0b3BwaW5nIHJl
cGVhdGluZyB0aGUgdHdvIGxpbmVzOg0KPj4+DQo+Pj4gW8KgwqAgMTcuMjcyMzAyXSBwY2kgMDAw
MDowMDowNS4wOiBkZWZlcnJlZCBwcm9iZSBwZW5kaW5nOiBpbnRlbC0NCj5pcHU2Og0KPj4+IElQ
VTYgYnJpZGdlIGluaXQgZmFpbGVkDQo+Pj4NCj4+PiAtLQ0KPj4+IE5pY29sYXMgTG9yaW4NCg==

