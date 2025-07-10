Return-Path: <linux-media+bounces-37237-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE20AFF69A
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 04:07:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1249D1C81A4F
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 02:07:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 537D82727EF;
	Thu, 10 Jul 2025 02:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GgHg67c1"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E31EC4
	for <linux-media@vger.kernel.org>; Thu, 10 Jul 2025 02:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752113248; cv=fail; b=ebv/2qrcTjcSjVhA6Z98yccgch6N2dVgA8vT+1iI+oBCd0zGrlSey2sbG04EXkrHYiu/tPX0/laWu0dt3xawWL2gZDQSLJ7H4V6w5rgQjtOK9McD60SKAmTjcNTbMVXcFIuqvXuB7wsNAjxqGgPGUmhNTtGpIdTzNnuAUKtblDc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752113248; c=relaxed/simple;
	bh=91yZD5MYqVBrN2gtmJEjHyuKXkiMDZDL0LM3UDjCYzE=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=C6toCMQAl3GzeX2WazdS8a4+PWt+hlXl9wW1FCVBTjFrOvmHTkAMH5K6Vnovs4J29zQXkkUJPqpQOyBiAyTnjd4NDggO6xOVd0LNXU384+IzbPJmunboiIcFp7dq3ZXUQWiMPcVn8p8fyIboe32rnzth2sKgHvKINxaFBiVL8C4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GgHg67c1; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752113247; x=1783649247;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=91yZD5MYqVBrN2gtmJEjHyuKXkiMDZDL0LM3UDjCYzE=;
  b=GgHg67c1zwAxpkfZ+hTcWKnvKmgH/l1LXTF29eygtbuIKxVZNytnlxUt
   owJCEB/vPutxwOQBzUfmrtSS26AKfP4xKtdFraAsUXV5OdsHMwE3bJ5fp
   rfEC5k9CLQjfD3wM9QJ7Pxcdlqo6Y6fusElwEo4UdtJLYUzLmClP6LeSq
   p0wWqzf6piakoEfvhm0rfTBKxeeYTQFvZxvZxMfpfskrnDsrWTfpAyYaG
   WX+dvA2LDxV5hurCZ+CuWb8o75SNaDP9cqI7ji/T+WuyRoBWno7k20v9O
   /eN9p0JgvFnAia83lOSDQLhTHKgbNI6LkdzS/MCf9Vn9XikKklvujPva+
   A==;
X-CSE-ConnectionGUID: n1OtnUnbSP286o6Lp/+Qnw==
X-CSE-MsgGUID: ZSRyPbEjRoS2KDETyPfHCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="58191341"
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; 
   d="scan'208";a="58191341"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 19:07:26 -0700
X-CSE-ConnectionGUID: E7eWSodXSWqh87R1gwUl+Q==
X-CSE-MsgGUID: ccVm92XUSs6c7Gm/Xi5yYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; 
   d="scan'208";a="160482627"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 19:07:27 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 19:07:25 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 9 Jul 2025 19:07:25 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.67)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 19:07:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KuVtZETXZc05xQis+mKByEDAD2Dz+iXUBTm/m0k/oJXknz37mgoCRwWXyuNvySjPfHMIgdvFtPeT6XjrkqKYAEMprh9XY1jrFlSYOBZk0h0jBEqFjAQNvfh+vWtz3T4KuX+f7YNDMWRd/fW+iv0sdKnr3mamxxWivMyxLJH6ZzMtyqgWnHKx+36Bh1QTqqp0PEcNw70MilJbrOfzxUpyNhFA0kxIh5OzseeRVzctBWq9AmJpffTFufgXENoaWOSxRQpgbMnRjglK87B3BF9M9Q/qe3jwim9pQmBZ50cUNThBCnUFboilhOJumfwVFollrvv0qJHjfLRSbOI9bEbwzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PSUzZ/pb0hmV8jdepzTM+W1QAqC6OjDaPWDBrU0Y27U=;
 b=Ro8pATLff/m13d0JeqXj+hxP8C6VfXoJCsFottcLWh/kEp7nT1iFOAAigumxhjAH9lLEFguC642ZwHl/xXnK88beDgmHKjHfAS5Lj5EZ/xRXOxTITmeDRrE9414/FIYoPaFPBPY3paB22iayNUMe8V8kMm3m12dCG5ITOfBGZPKTLfnyD+sJPXyhtQs0QMfkMGi6Iy58VoZFHW+OIhz3HA2+An9h9DpNnztKL1ScwDPY18nmZk/U+y5N43Y35XEe2L0ZGTSFfgK/xTfNkmA8SzA3aNAdcSfyEYowFblJZF0ehZzcQhQxYvZxpKBreWLDcRbnJEsbSqXqeh7rVi/Sqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5995.namprd11.prod.outlook.com (2603:10b6:8:5e::11) by
 PH8PR11MB6804.namprd11.prod.outlook.com (2603:10b6:510:1bc::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.28; Thu, 10 Jul 2025 02:06:42 +0000
Received: from DM4PR11MB5995.namprd11.prod.outlook.com
 ([fe80::654c:a738:ac8:7908]) by DM4PR11MB5995.namprd11.prod.outlook.com
 ([fe80::654c:a738:ac8:7908%4]) with mapi id 15.20.8901.028; Thu, 10 Jul 2025
 02:06:41 +0000
Message-ID: <8b878b6b-6b4f-43b4-b7e3-91b4f7762717@intel.com>
Date: Thu, 10 Jul 2025 10:09:15 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] media: ivsc: Add MAINTAINERS entry
To: Sakari Ailus <sakari.ailus@linux.intel.com>, <linux-media@vger.kernel.org>
References: <20250703075302.960243-1-sakari.ailus@linux.intel.com>
Content-Language: en-US
From: "Zhang, Lixu" <lixu.zhang@intel.com>
In-Reply-To: <20250703075302.960243-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2P153CA0051.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::20)
 To DM4PR11MB5995.namprd11.prod.outlook.com (2603:10b6:8:5e::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5995:EE_|PH8PR11MB6804:EE_
X-MS-Office365-Filtering-Correlation-Id: 99df4958-99b6-4146-d2bb-08ddbf566979
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TFdMdE5semVSNHhHMUQ0bnpBZHJYUG5MYjJST1pQN09QMEZrbjFTUWhiYjJh?=
 =?utf-8?B?cktweDlIK0RhK2xHeEo2RENrRE9yK2ozS1Q3RkZOOWJibWRCRkNOU3MySGRq?=
 =?utf-8?B?Rk04MGw1NGVZcGxrMkNESjc4WEE2TEFWQzdZRnYrOXNSWDZQaVptaXZwNnkz?=
 =?utf-8?B?MmdkdlhIYnp0V0ZvOFJPOU5RZjhPTzBJUEhFYk5XOVEvbTU0K0w3bUxOSlFR?=
 =?utf-8?B?c1ZDN1BnaDBkSzFFc3E1dktzT250V0RsNUhUbnE2aEJGUHdEYUZmaDRndEY1?=
 =?utf-8?B?cG1yN3cvQ2lIWHBCSlJSMHN1TDdCN1h3c1NMcFJPSUtMM0pRUWJjOUdZWURh?=
 =?utf-8?B?cGMzSGRQdnZybCsvWkRnQWpvUzVUS3dYSndPUHdUV3lCSFZYdVRVY1BVNlRs?=
 =?utf-8?B?Z3pQcEVtTGJZbU1KOS9qejQrS0IvbHk3VFFzQUhGYWtCVEovUEphdnZnbXgv?=
 =?utf-8?B?L2gyNWx2UEx3SXV5d2k3R3hoaGFWV0RhckNXZXN3WGNLQ0dkbmpURWZBQWlX?=
 =?utf-8?B?d1BGNHVRWk5VZWpPMzdIMGdmK0ZaYWFMWUlWRGNUbGR5SE9NZHhCSldWalVq?=
 =?utf-8?B?Q2xIdWNrdFlxUytBbUx1blpnOGtmNUlNc3MwNzJSVlBCLzREenVSODRBMkxK?=
 =?utf-8?B?eWRuanJRQVpyODkrUGVTRzJOQWpiTFNpcDZ2bDNBdWYrVFhMSy8yRlJWQmY3?=
 =?utf-8?B?eGtQZFVzNndXSXlhVXVqNGRIc1hsdWNlMkRFcXVxL2ZpUjByaUFGVVpYRWJ4?=
 =?utf-8?B?SUNReXRTYVJPQWNIUE5UaDVkamxmaXF0azFjOG81T0EwWU9hRjRZV1ZxYi9v?=
 =?utf-8?B?SUdnTEJGaUYzczZwS000c2tMdHhuM28vYVEvTDFsaFF4SGlYR2cyL0VuRmpz?=
 =?utf-8?B?Tm9QRXJlQUswWk9BK0dZNVZWMDYwODh5dXd6U3BzaGhWUXBXMFU5SWk3b1JO?=
 =?utf-8?B?RlB3NWtOSDZremN2S2srZDhHYVY2SnltQnMvb0ZzWUN0VXE1R1BYcW5Ic3VN?=
 =?utf-8?B?TGhMaVpHWVVZYkVsM2JPZXVRWS9JbU4rZlpxaEx2alJ2ZVVINUFYdEE1UXd5?=
 =?utf-8?B?M0ZWWTF6bExmVGw3MS91MTVDWW13RkFmWEh0ckpLMmtUOGRPak5SZEI5N3Vr?=
 =?utf-8?B?d2JzS0ptWG92RlZDTU55ODc5RHhiU2FJTVh0QU9RWEJ5aHZkWVArRkFpa0lS?=
 =?utf-8?B?elpUUmdBVnVPUmNqcGZ6cjllVVY5RlpMYlUvendWK2h6M3BvYWU4Y2Z3OUdC?=
 =?utf-8?B?NCtOd1FKSENHckI2Ym9vWlVyTFo1VDZZV2hKa0E5cXNOQzJFM3BEWERSeUNO?=
 =?utf-8?B?b1VXUU9IeVh6MURLanNFM0dyTCtWaExFUmZ5ejFJSjhxeW50Mnk1SHh2OEZ1?=
 =?utf-8?B?QUJ3a1pMTFRLanlBdjBoVy90ZTUwT2ZzZDVOT2dGOHBaaUNTbnRiNlZBQ1o0?=
 =?utf-8?B?czBhVUUwRG9ha1pCRVRPWU50Z1JrZWZFRExjOGxPM2tWTS8ydjR4K2lzcUdj?=
 =?utf-8?B?U1Joc3N0V1RJTlM3YUQ2bk1UNTVtVGVLKzY3Mis4ZmNWQ1o5V09CYmZ0VDdT?=
 =?utf-8?B?ZEE2Q2xJS1kyVlJxdkt3THlaeHRCeFZXclpkS2M0c1lEZG1oTWR0SHJEbzVs?=
 =?utf-8?B?aVkvOVdzLzRTQk1XaHVXYm1ldTRvMXNmVTkxMHVtZEIzUkdCM2xSY1pucWJq?=
 =?utf-8?B?UDFDVXJuN0tkdXJIQmNFU0pMeFZ2N2NnUTNvbFZTL3hoU2wrWTR3Q3NTQ25p?=
 =?utf-8?B?U1NKakJIc0JReEMxMHIyVVV5anMxY0hLYlZEZ2crVitudEcrNTFIK01MM2xB?=
 =?utf-8?B?WEJPenN4U0tBTWVEYkVLUC9RMUhraXUybXVrR3F6aU5rU0xCUld6MlY3RTVy?=
 =?utf-8?B?bjBjTEZKalRwSnU0Z053cUlKRDBVb3BTRm1WNkpEZjg5bFExeHY5MnpUbUJC?=
 =?utf-8?Q?33OpHRnMcMg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5995.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVRTVEUySTZiRlJZZHZrSmVOVDI0T0YwaS94bjNMRTMreTByRGg0QldpbUhs?=
 =?utf-8?B?QlB5OCtPV3h5L25sUkJGQ1J4YURqTWgxd0FNZE16TEpVd3VTMXVpbnNRSFNP?=
 =?utf-8?B?ZVJDdHV4SGQ0dExDWG1ZbVJNd3A0dVZMck1TcktyWDlQYmVUaFF4bTQydUpF?=
 =?utf-8?B?SmRlYnlyQWNVYVpWcHkvS2lyMjcxNVBUTE83U2ovMUVKaU51cy9rZk4rbldr?=
 =?utf-8?B?OUxWdkRsU3pOc2QrcUtKcjBsNE1jSnVZclpMU21BdFJKZVVFcDJyTmY3em1y?=
 =?utf-8?B?WHBYc0xYQldDR1JxeWRqN1NxTi81c2x0bmZFUE55TEhseHRsb2FUMXovOG12?=
 =?utf-8?B?N1dpcjNyd2JhYVRkSWFoeDduS2tQaGkwbmlSdkpDQ3F6dXc0dGJEeTVGaHZa?=
 =?utf-8?B?cXpGSmlQZjhYVEZ4K1RIRHMzYjNMT1ZTWFRHQkt5NzRYWUFRWEdYdENBUkFH?=
 =?utf-8?B?elR3MGgyOERkbkJLUTZSUm1pM0FSZFp4U3oyOGhBNFRmbHN6MTcyNUF3bU5I?=
 =?utf-8?B?NlptOUY2WHovRGEwNDRMTHlBSmZsWnRMUkVyZHNsa0pJMFpqUnVPVlZ3RTFB?=
 =?utf-8?B?L1pFQ25FQ09GUVU4YU9hcWVRczQyTVY5UVM1WklUOS9odlZjcGYwb1BHeFAz?=
 =?utf-8?B?elFTZHNiZzh5ZUl4czMwZVRlMlcveWxyMkdvU2FxVlhVSXVsVDEza05DMFU5?=
 =?utf-8?B?ZmhwWXMzaUZrK1pxUWJCQko3TFRKc2k1QzhMSm8yWGxldkVaOFZ4MHN6OUpy?=
 =?utf-8?B?cFBvQVFnSTRlY1FzZVRJdWVtcU1QUHVaTXN6MTJWdnZLQ3MzSTE0ZTYxVTdn?=
 =?utf-8?B?REVCeWNyQ1FyUExkYUtYc05YclY4SXR3RWgzL25Ta2pVenVMb003ajlIdWdU?=
 =?utf-8?B?b2xiMUUvUWNqSk9Jc3kyN3dUMm84MEVDb1N3eWJwaUNSMFdFUWF5TWpraWQ5?=
 =?utf-8?B?QVlzeGV4Z0lOaDFucWFTQitGdkVtTnlMeHFiVDlRZ1I4aWkvdFN3M3k5T3Ja?=
 =?utf-8?B?bVY1NWovYzB4TXBPclgxekV3dzFrY0ZKYklEcmlLR1BsSWVOWFZEdkhncm1G?=
 =?utf-8?B?MmlkY2s0VmlPa091NGVKS1ZjWlNrMUtpQnp0Y1d4Wk9YWE82WVpIZDN1Sklz?=
 =?utf-8?B?aUhkWjR0M1hPWStVRm0zeUlPMXRVNGFodFhlQ1hleUxXZGFPZW9MRXZpM0Fv?=
 =?utf-8?B?NG9oUTl2Ukdzc04xaGZPV0tQQjlldEN3anZrK0RuTWtUUm5lYWFSWEZqRDc0?=
 =?utf-8?B?dUpBL2VDaGhycTdaWjFzUUxLLzl0UnlhTm1UOVRyVE03elE2MVZZOUZuRm9m?=
 =?utf-8?B?eGRjRkl6dWNGeUpBQjV4VkdOaDgxZWl5aGVLU0pDellzWlpTdVllZHZVYVpD?=
 =?utf-8?B?WGdyWm4xNWMrTWEyOEhFVzdoT3c4U3B1Nm9uWEwrVHZxdzV1Q3ZrQ3BlR2lx?=
 =?utf-8?B?UXdOQlpNLzZwQXAvc0xKM2tSR0lRT2JjUHNSYm1Cc29meUo5NnZYcFhMQ3hs?=
 =?utf-8?B?YzlmdUIyaWYyL0xBRTlYb3pVMmo0Q01PTmJ2SDBPUHFPelZZOEtUNG5QVEE4?=
 =?utf-8?B?b0VyY08xdm5QT3Evd1RyWGdMNmlMWjZVc0dnekg3aXpoVFc1Q3N1YjVtYjVh?=
 =?utf-8?B?YWZ1b3crUDEwQVE0NzRJaGFISnA2L05aUlpENE15c1dpckhFT2dDQXQwY1o5?=
 =?utf-8?B?ZmY3Tm9xZDJZZC81Rjd1dTdGb2U3YnFoL1FwUzVOUUVQdnR0cWRkc0x2L1NI?=
 =?utf-8?B?dlBNRGZyc2lSQ0JMeHlvUjA0aWhoR29UaEY3ci8xRy90OVZKZ29GUFZpWUN1?=
 =?utf-8?B?K2JaNjNwV3JHck4wblJVK2hDVG5XZjhDYUQ1UzVrby9HY2VKbWx1WVVJY3JZ?=
 =?utf-8?B?eHE3bTRDU0k4ckZhcFdiTGcvUTZ4REpHMjJBa1EvNG5BSWtjRWV0NGZEZ09y?=
 =?utf-8?B?NDcvdTEreHI5WGV5NXg2cHV4YTE4SGE5TlZ4djNycm45YklFaDh3ajlLK2Zm?=
 =?utf-8?B?MC8rWldwL2NhUGVCdjdiN1ZYcjBvOHdobmxhb1ZNRjhxSEZHK0pyZmFWUmZ3?=
 =?utf-8?B?eG4wL2NMcWlYeEI0WWVLS1ViaThYWHdRZ3QwR2liRlQzRjE5cUxMZlQ0V2pV?=
 =?utf-8?Q?vYPaqVbE5d8vjYeEC7jHOIqa4?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 99df4958-99b6-4146-d2bb-08ddbf566979
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5995.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 02:06:41.6691
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0vi8M1ckRgtF1nu/c+RgWBZSCBsfmspaueryL3vW7gtYSdw6UsiSR4zHIcY060Xc95sQceRemCCoMtH1VWIo5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6804
X-OriginatorOrg: intel.com


On 7/3/25 15:53, Sakari Ailus wrote:
> The IVSC drivers seem to have never had a MAINTAINERS entry so add one
> now.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Acked-by: Zhang Lixu <lixu.zhang@intel.com>

> ---
>   MAINTAINERS | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 276c5a0b2dc5..125b3d373ef7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12524,6 +12524,15 @@ W:	https://wireless.wiki.kernel.org/en/users/drivers/iwlwifi
>   T:	git git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi.git
>   F:	drivers/net/wireless/intel/iwlwifi/
>   
> +INTEL VISION SENSING CONTROLLER DRIVER
> +M:	Sakari Ailus <sakari.ailus@linux.intel.com>
> +R:	Bingbu Cao <bingbu.cao@intel.com>
> +R:	Lixu Zhang <lixu.zhang@intel.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +T:	git git://linuxtv.org/media.git
> +F:	drivers/media/pci/intel/ivsc/
> +
>   INTEL WMI SLIM BOOTLOADER (SBL) FIRMWARE UPDATE DRIVER
>   M:	Jithu Joseph <jithu.joseph@intel.com>
>   S:	Maintained


