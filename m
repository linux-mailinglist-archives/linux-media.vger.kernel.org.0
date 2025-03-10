Return-Path: <linux-media+bounces-27917-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA48A58B0E
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 05:06:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 756213AB522
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 04:06:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2AAF1B395F;
	Mon, 10 Mar 2025 04:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ay0pKM15"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF2F5234
	for <linux-media@vger.kernel.org>; Mon, 10 Mar 2025 04:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741579605; cv=fail; b=bAMKKdiiW4HHmDdMra+RXW/v8kDpDJxAumTq/LkBsHl/v2avaEKswtWPys12DZjk+tyy1WXlnNmjR5vFyfBSHvE1wq9JR4yNf8zw9pqvSfZNGKO82usrW2w5wfJQ5g1pC3ywfbSJhesbWIidy42hEcKyg7jPInRUuj9k1SWCAPw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741579605; c=relaxed/simple;
	bh=IwIGOXL7u3YAorwRpJKdIiUtey3FOKt6cp63C7FdVI4=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=swFHHg34ptTLMceAuTdhgBjpPsUBS0Da1V6GssT9N6lzNANjqkXM3j2Sfx2Io91e86KzSq6VLNSw53OUdAxoet8ZE3ieBXyhpooMbfo++ji8G1RJfyYVrHOy72AfrUBk0WZhcwx4fxEN/+YZzEgkiWBxV48NLgH/qyOvU0Ch8g0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ay0pKM15; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741579603; x=1773115603;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=IwIGOXL7u3YAorwRpJKdIiUtey3FOKt6cp63C7FdVI4=;
  b=Ay0pKM15uAznKwh19ZklWns04hbgKUUIomOdoCiXuxyAQanOq1+Cn8JK
   K1BsQrYokBornYf5LzjVR39dpiUVvg6EODs1n6QeFVJh5bv5QcnLGcmvl
   AmmItFK2D/ojaHVxjFFd1bbAjj5DComWiADBxDkQw2vZL1ZTVS6sE12rv
   5OnrakD6/fSNreayJW3Skta8h++RoT5dj/GUaNgl3fYgzKYzjSctBI04Z
   fptMnkZ8o9zx9m9UAnYd0OFFyvcWTsfR94YYgsmHFCaRq86AuRrbsS+aD
   34DpZaDx3LqVifYIOaWlRzR2Q5dQIHlYlqghjMVAJFVWTKqmmDs/CKN4E
   A==;
X-CSE-ConnectionGUID: a7zfTrgMTCeK0j1GEV2AqQ==
X-CSE-MsgGUID: Kguqkv9SQ2anwbpFFeb6pQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="59967351"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="59967351"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2025 21:06:42 -0700
X-CSE-ConnectionGUID: czL1HezERvOYqMQL5v7x1w==
X-CSE-MsgGUID: I+03UbfcQEmv9qPG965K1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="124473777"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2025 21:06:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 9 Mar 2025 21:06:41 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 9 Mar 2025 21:06:41 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 9 Mar 2025 21:06:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fUNdywikyXWxdjQ23JzjiyLtbzszLZeyY2ud56XZOywGyrHtPE5x4knypfhXzQnr2jzAntyPaAKOPYTZ1aKKwvS00SjEUG9ExW6VdZYw85k6Q3iCY+fzkA6nu2ElqPYuaosAiUCa1meop8VclLHq0/C5a7jgQVEbCnxPNlXEmPoKob6QVcCqRSamflqjIlqLx12NNWYL8my7BTj9Rn7Bj4VkTrGEcyJ3SSjCTPXgKGRHlfFEm0FVuSz6RCny9UyaUhqWYu8fwGZrPIQBhVE45YRGzyuoNb+M4TCHd36wDJ3ybxwSJBMvMX2zJFMk2Vs2XwtKUF4jy9s/H2zkt12K/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tCCWvuC5Kl7UUuIp5R5fIIvyAWPA/oGZqTEqxMvFPNg=;
 b=cm6nUKiDViDGFgTnganSFMQeW0pSd7xQ+g6JezjkLy8nvkG1PTlcd2PM0muroIOVNDCSXD+Q+Xa2j5iiBc7z0NcEPqdgGC7fU/UvHt9Wpl0vjXeCwITYU+Y+u0nSkW2Mi0U+O1B5H6j3qg/NeMAYbGWbyRtUGiLzrbaA8+tBVl6912OeQCXZFoE0eSViup8NdMbhyO0Kk8xtPkR6KUKtzTc37rCKTDywUvD6+XBvrfv1n+bAFMV4Rk5gpfwITi27xvB/i5Jw90wW+hJkdaxsI6QmP7lc+Hp8A9SZQnNfUmXHDEONIDxuSH0zJ/cHaf3HNXL1FHDLa7nGAaUlpGj51Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8230.namprd11.prod.outlook.com (2603:10b6:8:158::21)
 by PH7PR11MB6354.namprd11.prod.outlook.com (2603:10b6:510:1fe::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 04:06:10 +0000
Received: from DS0PR11MB8230.namprd11.prod.outlook.com
 ([fe80::a73e:80f7:8871:99ed]) by DS0PR11MB8230.namprd11.prod.outlook.com
 ([fe80::a73e:80f7:8871:99ed%4]) with mapi id 15.20.8511.025; Mon, 10 Mar 2025
 04:06:10 +0000
Message-ID: <f24a1543-9a8f-4e42-8cf7-40644f6d706d@intel.com>
Date: Mon, 10 Mar 2025 12:06:04 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: i2c: ov13b10: Support 2 lane mode
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: Arec Kao <arec.kao@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	<linux-media@vger.kernel.org>, Bingbu Cao <bingbu.cao@intel.com>
References: <20250307093130.1103961-1-hao.yao@intel.com>
 <20250307093130.1103961-2-hao.yao@intel.com>
 <Z8q_xpTIs1UsN0l9@kekkonen.localdomain>
Content-Language: en-US
From: Hao Yao <hao.yao@intel.com>
In-Reply-To: <Z8q_xpTIs1UsN0l9@kekkonen.localdomain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR04CA0215.apcprd04.prod.outlook.com
 (2603:1096:4:187::14) To DS0PR11MB8230.namprd11.prod.outlook.com
 (2603:10b6:8:158::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8230:EE_|PH7PR11MB6354:EE_
X-MS-Office365-Filtering-Correlation-Id: 31ebfc9a-0c0a-4a1c-55f7-08dd5f88e3ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eU1ZWGxrcHZ2d0tPRUpUdTB3L29pcDViNzdOaTRVSWxVbVhBNXh1NTEzMXJ1?=
 =?utf-8?B?NFQ3NGxPSDVyVTE5ekFJV3poNkhvb3QveHBFREx4eDZTTUs1dWxiMEJnejZq?=
 =?utf-8?B?RFRSWmZWTVloK2xMcFNTWjc4bjhjNCtBN3VnWGtpcDBPZFUyOHJIK0EzZWZp?=
 =?utf-8?B?dUxXNEowbFRvdXVDMzZYd2QvT2tKWFNEMitwUm9GbXBWUFBuUWxHeldBaS82?=
 =?utf-8?B?bU1OM3hrQ0k5SkEvRDdnNGhCRFdTREZXN3ZKbHBXQ2NKck0xV0gvN2h2bFZu?=
 =?utf-8?B?Z0NTczdIb0NUWUtneTJ3cEUxYTNUWTRoazFIakh0T0dGay9PdmlwaXFNZ2Nq?=
 =?utf-8?B?VW1naXdKd2hmK2RzV0ovMlhwc1JPN2tlYUVaWkdCWXZvWmlxcG5SZXlBWjdw?=
 =?utf-8?B?ZHFIWTdIek9QMkZUYWVpMmlGMy9LNnZlL2JRWisvZkZidnJ3SmVYZ2pwY2ox?=
 =?utf-8?B?NkVvMTZ5di8rNk9nTnBDWHZuOS84a1g0cUlZd0RESnh2RDdYVlhWbW4xTnBm?=
 =?utf-8?B?MjVmd1FhR1V2SWpkNnYwb2t4TVZTaTE5UmxmZExXenR1R21GTVdnMGJDRnNM?=
 =?utf-8?B?S0Z0c2V3VklMVGg5TVlMR3lxYW1VbWpCQW5ZSkEyZUdmM3JOb3BuaDVzKzNw?=
 =?utf-8?B?c0x6SzViWm5nOXNtMCthN2ZJdlpSalV3bGowYmpXNCswbXRwYlVhTC85U0E3?=
 =?utf-8?B?RHhENWQrb1pvL1NMU2gyS0JPTCtDUzJCc0todnpia0N3YUlBY3ZSVjdvaHp6?=
 =?utf-8?B?RHFkK1hhKzljUTQzR285TDB6dXFZSzRmWE84QXRPbUZyWWZUZTRkWGNJVGIr?=
 =?utf-8?B?VkFGMjZ4MHpKclV4d01BNlRwSGk2V3F1ZGl0S05hRmp0bys4eW5ncXQ3L2F4?=
 =?utf-8?B?MEF1TFpFbHV2VFI0eEVnRm1hL24xOWJTdjNYNFROdFk0bjlvYXpuMDgzcGZV?=
 =?utf-8?B?N0JsYWFoZmZyUG91eFdXTkZybE1zY1VudU1oSG9nMFNXVW1ZZEI2R3c2OWtz?=
 =?utf-8?B?djdMQWpRODRyZ2grbUpacGVUZDhsL1dlMHdmVlZRR3p1QU5PSnd2Q290emtN?=
 =?utf-8?B?dTZ5bWVnM25jemZldjRPUS9YZ3RjRGhWNDNqR24vZG9vS1pwSVowSlpSdzVu?=
 =?utf-8?B?MGpWc0xGaGUvV3VDN0VuT2tTQ0xSY0hWdVljWHQrRWIrUFFmUVROb09yUG1M?=
 =?utf-8?B?RnpYczFZZFBkSmJCcjVlSDBjRHBlR0k4bDBzUklQZU9mc2dHZnkzYWthTnlj?=
 =?utf-8?B?RFMvMEs5UEt5bllNNVptL1orZnJWNWl5U1lKcStRbGRlLzJjZkRyekxlS2lW?=
 =?utf-8?B?QjBleUhLU3B5YTVQUzE5dmZOTUkrdTE3ekJPdE10LzZQNml6MEx5dnlZaXFX?=
 =?utf-8?B?bUx1eGpmTmc3OVRTVWMveDBhWTErWFkwT0pzQXpQS1V5VmNWRDhkOW4rVkp4?=
 =?utf-8?B?ajRpOFF5VTZ2S2pVTGRhalhDc3lweExzUDFjbVhSTFhyaFFnWWRTdytSbEpk?=
 =?utf-8?B?QlA3L1V5TGp2RTU1a1BtcThYUVJQanMvS2RIS0RybnMwMis2d2VtRlplbGdz?=
 =?utf-8?B?ZGNvVGpTVi9qZjFvUVhWb1dIQVpCUFZ0MDFZZXJVRUtXbWRlcEdaS2hXRjJR?=
 =?utf-8?B?RkhUY0hnanZYWXBYWnNTdjBvemNyNXFGSXlaR3VHWEFLQmNqWHVDeGlWTnVl?=
 =?utf-8?B?UHpjdGRjOFBOZk40NngxbnBjVXpmakwrelM0aWExZlNVWkswUTUyUXpBTk5G?=
 =?utf-8?B?aHcxczVJVmlWeVl3cFhJclBCdE4rKzdiVFA1cXJiSk8yWHFHVGFLa0hPVmx1?=
 =?utf-8?B?SHhWK09JRVNZd3FTM1VzbEY4NFgwOTA3MUp0NnVibHc2WnNTRDEzMmxiQnBv?=
 =?utf-8?Q?xUnL5JAMnOIW2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8230.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWVYZFBrVXZuaXhOVmVuTHZhQ1p5djFHMzFNd2t5QTVSV1FDQ2JFZHliTkpr?=
 =?utf-8?B?Z2ZEaGREazkrb1I4NHFoMnhra0E5UllwUTlYT3grTDNDbXdyKzN3eXN2OWpl?=
 =?utf-8?B?Ymh1L0FOaW1iSy9tN0FEaS9idGZpNEVzc3F3SXJlOWkya2M2aTg4TW1JL3Vy?=
 =?utf-8?B?ZmFxUXMyUGZnZDA5R0hHZnJsZzlnanhCTXlrYm5kbFJsODdhZkROUTNTVDdY?=
 =?utf-8?B?V3V5K1RuZi96NC9pUy91MEVKRVdLWG52d3dqc3YydTE5b1NRWjNVenc5TVFJ?=
 =?utf-8?B?MmJkSXR0SDZRYW9pYUVKZHZCZFMzZi9oenp2UTR5Ny9ISjMwZWdhd1dqa3Yv?=
 =?utf-8?B?bkw4SE5MUldJSnNKcE5HZXIyWmIyK08vVlp4blJoeXFGQms3R2lTVHVSL1Nv?=
 =?utf-8?B?akFVSVZqSlR1UW1YUzc0MXQrY0xiQ0xaVUF2clZHb1RGaG53UDVjc0I4TGdz?=
 =?utf-8?B?MnlQeXdzV1NUTlEwU0Roelh2OS9XRTJKY05wS3NsaTk4SGd4L2tIeW50YlJi?=
 =?utf-8?B?cW5sUFE5SjM0RmtKSXhMY1MyTmVPMlp4cTRTQ0REZU9CejlQc3RIUE1jZUpk?=
 =?utf-8?B?ZE53MXZuSW84RTNwczFxMjVzaVdEc0FhL2kvamVFRlRkcXpOS1dZcnpGU0Ja?=
 =?utf-8?B?aFEvVm9xY1hQSlBQOVEzY21EdGFmZXlmNmxWZE9UZm9obEJQaTZJSWRhVDV2?=
 =?utf-8?B?dFBlQlByRlhzMGJTdjFHeGRVOXRIL2w5OGVFOE5HVkxTLyt5K2x0SGRLd05O?=
 =?utf-8?B?Q3dvU2tjelpvV0FnOXdtaWMrWE5LcHJ4UnBkVS9pVzFuTXJwdnRTaUF6bnZl?=
 =?utf-8?B?MVBVZThoQUlkdkxzc0d5Y0IyaG1Lb0Jadk9BWHlUK2hYM2pydUJpR0p4a09o?=
 =?utf-8?B?cHFTUGphY2x2RWppS1RMZGNCajZleWV1RXpiNzdUV3VER1JWYXJjWlQ3eXQ5?=
 =?utf-8?B?NUVBMDhjUk5TbHlLemRMTFNHT0pHamRsbTZwZUFhOG1yWHVnQkFKWGNjbk9J?=
 =?utf-8?B?eW03a2hhc3AxVFo5VldQN3R4a1Y1STBTZlBjL0Z0dndpZlNlY0p0ZythRkRV?=
 =?utf-8?B?MFUvZkFValFqMEpjL1ZjaC9xVnB0T01EMUpZSUJBYk9raGJJYUpYNFNzRXgy?=
 =?utf-8?B?OTZLdEVEUlFKUTJjbHYrQ3NvRWRIYVdJbWJkaXhPRkw2c1VWblJvRTFLTlpC?=
 =?utf-8?B?M2pDVCtVZlpwcmpacEZYZFpVLzVxMDYvcWZZWHVzT0NpQ0lsY3A4bVRhSTBv?=
 =?utf-8?B?T0s0bVV2dzZZS1NaZWJCL3JGM0ErYnBOYWNmbmg3TFNSRFl1WXZYYXF1YXlE?=
 =?utf-8?B?VU4yUGdVVHNEK2Z4bXU4Vkd6RTRFNlFsWTl4UDkwL0grcXdMdmIwaU5abWFK?=
 =?utf-8?B?NkxTVVhrR0t2aTUyYjVvSFF5ald4TlBHOUdqUE5WUjJ1OVBYeEZUQ2tyZHZy?=
 =?utf-8?B?MnpjMWJLaUVXZHBCcEU0elZHUitRMXkrSW5pY3Z3TnJMMlRSTHZBKy9lVE5l?=
 =?utf-8?B?QlRDT0MwMlNIUEdpU2N3anlGbkx5M3ZGV1JoK2M2dm5zY25Gc3ZNdTZqN2dv?=
 =?utf-8?B?VTkyYjRld3JHcU0zclkrengyd3NOak04cWdwU0lDZUlIRmFFc2MyK0VsMlhN?=
 =?utf-8?B?V1k2WFBzby8vZ25aY0ZQajRISjI0VlVRQ0ZRRzZvMUs4MGMwcFdoLytoZWQr?=
 =?utf-8?B?aU50ZVRZSTNJTHhyTW9RaGhqUGp1ek9YY2VRSStNSVlNZWhBQy9RZHBHbVdU?=
 =?utf-8?B?dTRKT0tIY3ozYzFVSDJXVE9QVDl4OXM5eG8ycGY4ZnFZVFBWRDlmSUdWOGhI?=
 =?utf-8?B?bjJEQWVqZzlEUk0yMmM2dzB5RUU1MnJvRENUWGEyWmF3c0lqa1ZTcmIxdnlk?=
 =?utf-8?B?WE1XQ3k0aVp5TkxYSU5xQjBFaVR1WDdibVl0aEwrejAwa0tJTWZqNzEvdkoz?=
 =?utf-8?B?YjliclpFUVhUaG1WZGJuZXc3S0p2TitJRXlGVndzYkpKR2tOQ2gxbW1nOWtB?=
 =?utf-8?B?bHVQTmxDcWFFczB3RU5yb3FHOHNBZkpFQlBZemhicjV3TlJQSkRLK3dRcXZU?=
 =?utf-8?B?Q0NlTVJIWm8wNThKWDJZeExvOXkvaU9ISzlYMkk1Uk1mLzMxM3ROYkJlMUEy?=
 =?utf-8?Q?55kvJYVGE6GpYLBKhx2c7BF0h?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 31ebfc9a-0c0a-4a1c-55f7-08dd5f88e3ea
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8230.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 04:06:10.1787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ei92zO4TL4kI9TkQdtHotUhj1JcwAcEfMkTBhBmBj97NzyQcudbKwDheBtM/qDeRS7llSSppo22Ausl97zcrew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6354
X-OriginatorOrg: intel.com

Hi Sakari,

Thanks for reviewing this.

On 2025/3/7 17:43, Sakari Ailus wrote:
> Hi Bingbu, Hao,
> 
> Thanks for the patchset.
> 
> On Fri, Mar 07, 2025 at 05:31:17PM +0800, Hao Yao wrote:
>> 1. Fix pixel rate calculation to consider different lane number
>> 2. Add 2104x1560 60fps 2 data lanes register setting
>> 3. Support 2 lane in check_hwcfg
>> 4. Select correct mode considering lane number used
>>
>> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
>> Signed-off-by: Hao Yao <hao.yao@intel.com>
>> ---
>>   drivers/media/i2c/ov13b10.c | 134 ++++++++++++++++++++++++++++++------
>>   1 file changed, 112 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/media/i2c/ov13b10.c b/drivers/media/i2c/ov13b10.c
>> index 2e83fc23f321..20481b8d4e79 100644
>> --- a/drivers/media/i2c/ov13b10.c
>> +++ b/drivers/media/i2c/ov13b10.c
>> @@ -514,6 +514,52 @@ static const struct ov13b10_reg mode_1364x768_120fps_regs[] = {
>>   	{0x5001, 0x0d},
>>   };
>>   
>> +static const struct ov13b10_reg mode_2lanes_2104x1560_60fps_regs[] = {
>> +	{0x3016, 0x32},
>> +	{0x3106, 0x29},
>> +	{0x0305, 0xaf},
>> +	{0x3501, 0x06},
>> +	{0x3662, 0x88},
>> +	{0x3714, 0x28},
>> +	{0x3739, 0x10},
>> +	{0x37c2, 0x14},
>> +	{0x37d9, 0x06},
>> +	{0x37e2, 0x0c},
>> +	{0x3800, 0x00},
>> +	{0x3801, 0x00},
>> +	{0x3802, 0x00},
>> +	{0x3803, 0x08},
>> +	{0x3804, 0x10},
>> +	{0x3805, 0x8f},
>> +	{0x3806, 0x0c},
>> +	{0x3807, 0x47},
>> +	{0x3808, 0x08},
>> +	{0x3809, 0x38},
>> +	{0x380a, 0x06},
>> +	{0x380b, 0x18},
>> +	{0x380c, 0x04},
>> +	{0x380d, 0x98},
>> +	{0x380e, 0x06},
>> +	{0x380f, 0x3e},
>> +	{0x3810, 0x00},
>> +	{0x3811, 0x07},
>> +	{0x3812, 0x00},
>> +	{0x3813, 0x05},
>> +	{0x3814, 0x03},
>> +	{0x3816, 0x03},
>> +	{0x3820, 0x8b},
>> +	{0x3c8c, 0x18},
>> +	{0x4008, 0x00},
>> +	{0x4009, 0x05},
>> +	{0x4050, 0x00},
>> +	{0x4051, 0x05},
>> +	{0x4501, 0x08},
>> +	{0x4505, 0x00},
>> +	{0x4837, 0x0e},
>> +	{0x5000, 0xfd},
>> +	{0x5001, 0x0d},
>> +};
>> +
>>   static const char * const ov13b10_test_pattern_menu[] = {
>>   	"Disabled",
>>   	"Vertical Color Bar Type 1",
>> @@ -527,15 +573,16 @@ static const char * const ov13b10_test_pattern_menu[] = {
>>   #define OV13B10_LINK_FREQ_INDEX_0	0
>>   
>>   #define OV13B10_EXT_CLK			19200000
>> -#define OV13B10_DATA_LANES		4
>> +#define OV13B10_4_DATA_LANES		4
>> +#define OV13B10_2_DATA_LANES		2
>>   
>>   /*
>> - * pixel_rate = link_freq * data-rate * nr_of_lanes / bits_per_sample
>> - * data rate => double data rate; number of lanes => 4; bits per pixel => 10
>> + * pixel_rate = data_rate * nr_of_lanes / bits_per_pixel
>> + * data_rate => link_freq * 2; number of lanes => 4; bits per pixel => 10
>>    */
>> -static u64 link_freq_to_pixel_rate(u64 f)
>> +static u64 link_freq_to_pixel_rate(u64 f, u8 lanes)
>>   {
>> -	f *= 2 * OV13B10_DATA_LANES;
>> +	f *= 2 * lanes;
>>   	do_div(f, 10);
>>   
>>   	return f;
>> @@ -559,7 +606,8 @@ static const struct ov13b10_link_freq_config
>>   };
>>   
>>   /* Mode configs */
>> -static const struct ov13b10_mode supported_modes[] = {
>> +static const struct ov13b10_mode supported_4_lanes_modes[] = {
>> +	/* 4 data lanes */
>>   	{
>>   		.width = 4208,
>>   		.height = 3120,
>> @@ -634,6 +682,23 @@ static const struct ov13b10_mode supported_modes[] = {
>>   	},
>>   };
>>   
>> +static const struct ov13b10_mode supported_2_lanes_modes[] = {
>> +	/* 2 data lanes */
>> +	{
>> +		.width = 2104,
>> +		.height = 1560,
>> +		.vts_def = OV13B10_VTS_60FPS,
>> +		.vts_min = OV13B10_VTS_60FPS,
>> +		.link_freq_index = OV13B10_LINK_FREQ_INDEX_0,
>> +		.ppl = 2352,
>> +		.reg_list = {
>> +			.num_of_regs =
>> +				ARRAY_SIZE(mode_2lanes_2104x1560_60fps_regs),
>> +			.regs = mode_2lanes_2104x1560_60fps_regs,
>> +		},
>> +	},
>> +};
>> +
>>   struct ov13b10 {
>>   	struct v4l2_subdev sd;
>>   	struct media_pad pad;
>> @@ -651,12 +716,20 @@ struct ov13b10 {
>>   	struct v4l2_ctrl *hblank;
>>   	struct v4l2_ctrl *exposure;
>>   
>> +	/* Supported modes */
>> +	const struct ov13b10_mode *supported_modes;
>> +
>>   	/* Current mode */
>>   	const struct ov13b10_mode *cur_mode;
>>   
>>   	/* Mutex for serialized access */
>>   	struct mutex mutex;
>>   
>> +	u8 supported_modes_num;
>> +
>> +	/* Data lanes used */
>> +	u8 data_lanes;
>> +
>>   	/* True if the device has been identified */
>>   	bool identified;
>>   };
>> @@ -760,8 +833,8 @@ static int ov13b10_write_reg_list(struct ov13b10 *ov13b,
>>   /* Open sub-device */
>>   static int ov13b10_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
>>   {
>> -	const struct ov13b10_mode *default_mode = &supported_modes[0];
>>   	struct ov13b10 *ov13b = to_ov13b10(sd);
>> +	const struct ov13b10_mode *default_mode = ov13b->supported_modes;
>>   	struct v4l2_mbus_framefmt *try_fmt = v4l2_subdev_state_get_format(fh->state,
>>   									  0);
>>   
>> @@ -980,7 +1053,10 @@ static int ov13b10_enum_frame_size(struct v4l2_subdev *sd,
>>   				   struct v4l2_subdev_state *sd_state,
>>   				   struct v4l2_subdev_frame_size_enum *fse)
>>   {
>> -	if (fse->index >= ARRAY_SIZE(supported_modes))
>> +	struct ov13b10 *ov13b = to_ov13b10(sd);
>> +	const struct ov13b10_mode *supported_modes = ov13b->supported_modes;
>> +
>> +	if (fse->index >= ov13b->supported_modes_num)
>>   		return -EINVAL;
>>   
>>   	if (fse->code != MEDIA_BUS_FMT_SGRBG10_1X10)
>> @@ -1040,6 +1116,7 @@ ov13b10_set_pad_format(struct v4l2_subdev *sd,
>>   {
>>   	struct ov13b10 *ov13b = to_ov13b10(sd);
>>   	const struct ov13b10_mode *mode;
>> +	const struct ov13b10_mode *supported_modes = ov13b->supported_modes;
>>   	struct v4l2_mbus_framefmt *framefmt;
>>   	s32 vblank_def;
>>   	s32 vblank_min;
>> @@ -1054,7 +1131,7 @@ ov13b10_set_pad_format(struct v4l2_subdev *sd,
>>   		fmt->format.code = MEDIA_BUS_FMT_SGRBG10_1X10;
>>   
>>   	mode = v4l2_find_nearest_size(supported_modes,
>> -				      ARRAY_SIZE(supported_modes),
>> +				      ov13b->supported_modes_num,
>>   				      width, height,
>>   				      fmt->format.width, fmt->format.height);
>>   	ov13b10_update_pad_format(mode, fmt);
>> @@ -1065,7 +1142,8 @@ ov13b10_set_pad_format(struct v4l2_subdev *sd,
>>   		ov13b->cur_mode = mode;
>>   		__v4l2_ctrl_s_ctrl(ov13b->link_freq, mode->link_freq_index);
>>   		link_freq = link_freq_menu_items[mode->link_freq_index];
>> -		pixel_rate = link_freq_to_pixel_rate(link_freq);
>> +		pixel_rate = link_freq_to_pixel_rate(link_freq,
>> +						     ov13b->data_lanes);
>>   		__v4l2_ctrl_s_ctrl_int64(ov13b->pixel_rate, pixel_rate);
>>   
>>   		/* Update limits and set FPS to default */
>> @@ -1312,7 +1390,8 @@ static int ov13b10_init_controls(struct ov13b10 *ov13b)
>>   	if (ov13b->link_freq)
>>   		ov13b->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>>   
>> -	pixel_rate_max = link_freq_to_pixel_rate(link_freq_menu_items[0]);
>> +	pixel_rate_max = link_freq_to_pixel_rate(link_freq_menu_items[0],
>> +						 ov13b->data_lanes);
>>   	pixel_rate_min = 0;
>>   	/* By default, PIXEL_RATE is read only */
>>   	ov13b->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &ov13b10_ctrl_ops,
>> @@ -1423,7 +1502,7 @@ static int ov13b10_get_pm_resources(struct device *dev)
>>   	return 0;
>>   }
>>   
>> -static int ov13b10_check_hwcfg(struct device *dev)
>> +static int ov13b10_check_hwcfg(struct device *dev, struct ov13b10 *ov13b)
>>   {
>>   	struct v4l2_fwnode_endpoint bus_cfg = {
>>   		.bus_type = V4L2_MBUS_CSI2_DPHY
>> @@ -1433,6 +1512,7 @@ static int ov13b10_check_hwcfg(struct device *dev)
>>   	unsigned int i, j;
>>   	int ret;
>>   	u32 ext_clk;
>> +	u8 dlane;
>>   
>>   	if (!fwnode)
>>   		return -ENXIO;
>> @@ -1459,12 +1539,25 @@ static int ov13b10_check_hwcfg(struct device *dev)
>>   	if (ret)
>>   		return ret;
>>   
>> -	if (bus_cfg.bus.mipi_csi2.num_data_lanes != OV13B10_DATA_LANES) {
>> +	dlane = bus_cfg.bus.mipi_csi2.num_data_lanes;
>> +	if (dlane != OV13B10_4_DATA_LANES && dlane != OV13B10_2_DATA_LANES) {
>>   		dev_err(dev, "number of CSI2 data lanes %d is not supported",
>> -			bus_cfg.bus.mipi_csi2.num_data_lanes);
>> +			dlane);
>>   		ret = -EINVAL;
>>   		goto out_err;
>>   	}
>> +	ov13b->data_lanes = dlane;
>> +	ov13b->supported_modes = supported_4_lanes_modes;
>> +	ov13b->supported_modes_num = ARRAY_SIZE(supported_4_lanes_modes);
>> +	if (dlane == OV13B10_2_DATA_LANES) {
>> +		ov13b->supported_modes = supported_2_lanes_modes;
>> +		ov13b->supported_modes_num =
>> +			ARRAY_SIZE(supported_2_lanes_modes);
> 
> How about using switch() here?

How about:
	ov13b->data_lanes = bus_cfg.bus.mipi_csi2.num_data_lanes;
	switch (ov13b->data_lanes) {
	case OV13B10_4_DATA_LANES:
		ov13b->supported_modes = supported_4_lanes_modes;
		ov13b->supported_modes_num =
			ARRAY_SIZE(supported_4_lanes_modes);
		break;

	case OV13B10_2_DATA_LANES:
		ov13b->supported_modes = supported_2_lanes_modes;
		ov13b->supported_modes_num =
			ARRAY_SIZE(supported_2_lanes_modes);
		break;

	default:
		dev_err(dev, "number of CSI2 data lanes %d is not supported",
			ov13b->data_lanes);
		ret = -EINVAL;
		goto out_err;
	}


Best Regards,
Hao Yao

> 
>> +	}
>> +
>> +	ov13b->cur_mode = ov13b->supported_modes;
>> +	dev_dbg(dev, "%u lanes with %u modes selected\n",
>> +		ov13b->data_lanes, ov13b->supported_modes_num);
>>   
>>   	if (!bus_cfg.nr_of_link_frequencies) {
>>   		dev_err(dev, "no link frequencies defined");
>> @@ -1499,17 +1592,17 @@ static int ov13b10_probe(struct i2c_client *client)
>>   	bool full_power;
>>   	int ret;
>>   
>> +	ov13b = devm_kzalloc(&client->dev, sizeof(*ov13b), GFP_KERNEL);
>> +	if (!ov13b)
>> +		return -ENOMEM;
>> +
>>   	/* Check HW config */
>> -	ret = ov13b10_check_hwcfg(&client->dev);
>> +	ret = ov13b10_check_hwcfg(&client->dev, ov13b);
>>   	if (ret) {
>>   		dev_err(&client->dev, "failed to check hwcfg: %d", ret);
>>   		return ret;
>>   	}
>>   
>> -	ov13b = devm_kzalloc(&client->dev, sizeof(*ov13b), GFP_KERNEL);
>> -	if (!ov13b)
>> -		return -ENOMEM;
>> -
>>   	/* Initialize subdev */
>>   	v4l2_i2c_subdev_init(&ov13b->sd, client, &ov13b10_subdev_ops);
>>   
>> @@ -1533,9 +1626,6 @@ static int ov13b10_probe(struct i2c_client *client)
>>   		}
>>   	}
>>   
>> -	/* Set default mode to max resolution */
>> -	ov13b->cur_mode = &supported_modes[0];
>> -
>>   	ret = ov13b10_init_controls(ov13b);
>>   	if (ret)
>>   		goto error_power_off;
> 


