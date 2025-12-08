Return-Path: <linux-media+bounces-48367-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5D6CABFD5
	for <lists+linux-media@lfdr.de>; Mon, 08 Dec 2025 04:54:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 64FCA3018D63
	for <lists+linux-media@lfdr.de>; Mon,  8 Dec 2025 03:54:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D8A226E6E1;
	Mon,  8 Dec 2025 03:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NVUHLm/m"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76BE3FBA7;
	Mon,  8 Dec 2025 03:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765166042; cv=fail; b=FUlikhxWqw3lpZpz5e5jRqDFc6cLTQozAA2ezV/7uhJ4UOsbjk6okGHeytysHXFqUGkiXNL2fHzVIBQKzQ3hb8yo16BAdSU3lDdzE9tcSe2B90NAvOy7FpU0fHJnyDTbvIylvHkl3cyhX6kqKc7XP+jERcBdU3dwHeEvJEGQbus=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765166042; c=relaxed/simple;
	bh=PO/7H7s/lHXRiLf9fkytDNSJPLSRvKy8Yxl3GD8JwDE=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hd9Eak2lYn9e7756Kb6rO1t3xq0uKevKnHzJeqo7SUr5oqLoohYxg1k6dYz+7H1mfOyHP9hopRt/FsML1cNpDXzVbWq19U3gAfqmFpOxhJBm/BuXwomphxs4wXKkqJ1jPTPYxZml4phVXwl0+mO19Ftm23cAOPeyQMlKho8739A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NVUHLm/m; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765166041; x=1796702041;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=PO/7H7s/lHXRiLf9fkytDNSJPLSRvKy8Yxl3GD8JwDE=;
  b=NVUHLm/mnbvCNLHYrbvoUwVIUG4V14K/jcd42ErPTUbpCR09oiEp6fVy
   SC1lIw/+7IfYaultemiQPnDZR11nrIm1HrJKolcPbzNCD01awwgLOkuEH
   pOUcGRBTkFMNITvh2D6Va2I/sztMbqrouycip1j6d+R66zM2FixsFP+dG
   6MDUc/9DsoMCIzXrEZZ7JUZ1+5e1DddyO2VJXbMplUvzb7Eb3I6o1C98b
   GNfhKQ28K1ZqM8RIh034sP+UtcnEC9M9cEqXBgrRTkJJ7QvroCoNlRPtu
   88UODSm8AmycQCwZ0WkfxansYu18h6YWCrzrOu/kSEsc1NuFvIHx1JzXQ
   w==;
X-CSE-ConnectionGUID: yHCBai2KRyWzjRVRCtLdaA==
X-CSE-MsgGUID: aGMjA6/bRh+bO/vOF5rlZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="89761480"
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; 
   d="scan'208";a="89761480"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2025 19:54:00 -0800
X-CSE-ConnectionGUID: v1bPZoryQjeJci4OkK+FVQ==
X-CSE-MsgGUID: aUtu0y0+T/myPBWN+l1iww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; 
   d="scan'208";a="195857545"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2025 19:54:00 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 7 Dec 2025 19:54:00 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sun, 7 Dec 2025 19:54:00 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.3) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 7 Dec 2025 19:53:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qSqitbt0HsKH4/2ZQf4BApI3lsIe+cHlj4PvDZWaspw9225k7i8lS5BS4G84V6w877GfIcIMECSBs3foSJIW1WqK1dtj36OdCTkxnmrziHuX1J7MaxorQlmX2dJ9tLpiuJ28u9sqIBNA7JCdFAFkCe7tRyXYv8xq1a74cEFXYF3+NiAe/2nX++QQn2tHJlAlX5yxGOqUH0KMALntQQoqvShkd2nSMn8AkOsUHcINLYRxi/utRIk7lsAb/+mZqm2FvW095eIC2w3Bm0ov91EH7QPKyVZ4qgQjFuEQRH4DzmhbmKh8AZhlvLGq/JyDVem22O0kGNjykXu+5UbHsEPiKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ri5rENpVed4V3srfR95Fs2HTyZA/XGVs4vZlYWUyryE=;
 b=a7Fs6psvAmx6dLfg4M5r9d00oD0I4fSU1yArT3rEG9r/RTfd/BT75weyCjpqKy4Ee1/u2Wd6E3UgkZbbLRn8KE5s8fs7cM8/6odGJ5llo/m+2tRCVUDdZpLWEiJWoRLyXbw1o1Tua8bd6sgSXLpI8gLz4VWiDo4P2oVGT2lbB1CZnfZCz8qcmIafwB2eeYLTfeCwOMHAGMMjjW4hfPsU2HKhxmZSLOv5kregyUkoIq9SG20tloiWTmTb2h9FPYnUjZ1q9Nsr0ANww70RPCdG7/VgiSA8RMlmB6WC7kRrZPkD4cgR0w3EHCoVHWcKbfFjN3AK/YoWwdl6xeEJpTWivg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8230.namprd11.prod.outlook.com (2603:10b6:8:158::21)
 by PH3PPFA3FE8A23F.namprd11.prod.outlook.com (2603:10b6:518:1::d3f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 03:53:58 +0000
Received: from DS0PR11MB8230.namprd11.prod.outlook.com
 ([fe80::2592:f5a9:a751:be40]) by DS0PR11MB8230.namprd11.prod.outlook.com
 ([fe80::2592:f5a9:a751:be40%4]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 03:53:57 +0000
Message-ID: <9890dbd7-ee91-41fe-8436-03f60bd97419@intel.com>
Date: Mon, 8 Dec 2025 11:53:50 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: int3472: Use actual clock frequency for DSM
 method
To: Bingbu Cao <bingbu.cao@linux.intel.com>,
	<platform-driver-x86@vger.kernel.org>, <dan.scally@ideasonboard.com>,
	<sakari.ailus@linux.intel.com>, <ilpo.jarvinen@linux.intel.com>
CC: <bingbu.cao@intel.com>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20251205095525.1264971-1-hao.yao@intel.com>
 <d4f08e2d-8257-ec95-9f67-7514240a4f82@linux.intel.com>
Content-Language: en-US
From: Hao Yao <hao.yao@intel.com>
In-Reply-To: <d4f08e2d-8257-ec95-9f67-7514240a4f82@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0041.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::15) To DS0PR11MB8230.namprd11.prod.outlook.com
 (2603:10b6:8:158::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8230:EE_|PH3PPFA3FE8A23F:EE_
X-MS-Office365-Filtering-Correlation-Id: 883c3daa-bf1c-4a41-a0cd-08de360d69df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|42112799006;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MU9rVmxEbFBJdDlYWjB3cXBBZWJ6bnhkdmRsaG84Ty9iOS96cVNUYTF3OTBO?=
 =?utf-8?B?NzVRTWxSa2JOcjRrTTJQbStGaXZicHNKaWZSNWRXK0tSQmw5dGpjWG9uL1dq?=
 =?utf-8?B?a2UvNENaZXVEekl1UTVwbUJNMmJtOHVEMWh3aGprbEdPV3NEaFlLOHhuclIy?=
 =?utf-8?B?QmpaZmV6NXJRRkNiYlFPVmZBYTR6NUM3TFBLb21DQVJxaVNGcWtZQkp1RmQv?=
 =?utf-8?B?ZkhCTzZVc2NMa24veDBFNmIyRW1jT01CYU1ac1pzVTNCMng0OHZjbWkvRmdn?=
 =?utf-8?B?NHF5RlN4bHAxQ3E2WGRFVHZnT3dnMDFNVVd5U0ExZzE0bDV6Y29QbTduTFBw?=
 =?utf-8?B?RmZzbjFFbnB2YndydnRaQmREd1U1Zm1QRExoejdhd3pYNFdidUc5SXpDekh3?=
 =?utf-8?B?K3RwdFcwVG44ZXE4RUxpK3ZzeVZXODR3SnNaVUZUNUR6V1UzRmR3Y3ZjWlk3?=
 =?utf-8?B?ODM2Q3NlMHBhL01VMjF0UzhIalVCMEM0WWJ3MHJGd2d0NXlwcU1veUZVV3hp?=
 =?utf-8?B?QkNaYUVlWjZlN2Zjamx2cGJyYzRlZkZXYXZFMUpiTVdVZjZ3cmY1bmNYR05Z?=
 =?utf-8?B?ZFNFSkViUVRvT2ZpaW9CQ0cxTzZTcXJ6RUtLUi9xNVpZdVZHRm1tS3NHMFV2?=
 =?utf-8?B?Q3pIRjQvNi80UEpyRThwditVMmxjOWRjVEJneTk3VGtGWnFtb2pGRW5NRFVV?=
 =?utf-8?B?YnJjTUV5QzExVGxTV0IxZHJzRk5ocWRVVklRMXllRXhzSDJxN3N3alRhOVNh?=
 =?utf-8?B?RWYzRElNSzQ2b1ZYYUlobTBkMUQwTmZVVGVFOGZwd0hUNGVWOXduSm52QWxj?=
 =?utf-8?B?V2hnRjFkSGVaWVQweGtOUHdmSC9Kd2tybk5Oa2ZCSHpQT3VTM1pLYWpGL3VD?=
 =?utf-8?B?WFlTam5DQTB4Tis5aUxnTVlhZSsvcXZPaDl4bjVSVHRRamVQaVUxQ3hTenpB?=
 =?utf-8?B?Y3hTTkl2NGd6QTY1UGFrNlN6ZVI5dWxMd2Q5aE5GUDJCZ3Nwbk5JME5EejFR?=
 =?utf-8?B?YWROcE8yejJlbTF3ckFLRGV3cnZUUTV0TFRoSWdBeXY0VnB3VWpQSmRJdVRH?=
 =?utf-8?B?YmlDbzZmSElBTVBBdGVyamNQUUZYTW1qdHpneXZIUlVoemdoSEtXUlRKKzg0?=
 =?utf-8?B?Wkk2TzFRWWgydGZ2aHVyblF5VmRSc0g4c1ZuR21pOGM5RWlOUmdLT2JkeVdM?=
 =?utf-8?B?UnROL01XOUV2ZjZIcURVbjFPR2dYaXJKTlRkQTYxRmhTaTlwU29EN0FtRGxN?=
 =?utf-8?B?cTBReXBDWnhIYkllUFoxNndwK0crSmVocnNZbUwxUW90Z090THYzOHdNKzR4?=
 =?utf-8?B?MlJUYnM0REZsUW9KOVdZbXdUQU54MFVyRmNxcWkzSStuRGo5ZC9MZi9NMlI2?=
 =?utf-8?B?TURHZzhXZ3FaOUhPRldjKzErQmNFZTZLWHJ0MEpmZjY4b0R6Yk9UQVV5eGlL?=
 =?utf-8?B?RjRlaUVUVlRYaVhQdlVGT0txYmFQK2ozM050L2ZSZWRTZDVDUW5kWW1XS0sv?=
 =?utf-8?B?Wk9hT080d3JnbWFxN1dyeFJjMXdaNTlrQ0Q3c1BoRW5zWG1qOUloMkFkREtV?=
 =?utf-8?B?cXpGcDJOZDFYMHFTT1VKdVNWS1BMTGRjL3dwblFNQ2Iwdyt2d3NudFNOWlgr?=
 =?utf-8?B?ODdnQ0JWRk53QXVDT2sxZXpVV0wxWFpZSjR4WEtNSmVmb2ZVV3dod3NFd3Jh?=
 =?utf-8?B?UlNzVmsvbGdjZGRtNk1xVDM1bmxDZm1UT01CbUc5UWJmQjlnNExaOWVCcGtV?=
 =?utf-8?B?OFpqeGFNdUVyMEhVL0REa1czdXNCajR6SHpiS3NqQlpLZk1vUDhJdE9vcHV3?=
 =?utf-8?B?NlljeGd5QVI1eTU5ZGU2TGlyK0t4eWZ6anhiNzE5SnZsZzVYSVJWVWtYNnpZ?=
 =?utf-8?B?M0ZmdE04OGRrT2Y2eGZEQWRjUlBQVEVPeEZScXY5K0RncUdIZFZLSTBoS29R?=
 =?utf-8?Q?Kz/2TMOrYT7pmz+puYrrcf5SGerfu4sr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8230.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(42112799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVVzaGFYU3RiUXJBR2lqeUpVNUErZlVOR0ZvMytTQjFFWmFkMHBpcXFhK0Z4?=
 =?utf-8?B?bTFRQXBhQU04Wmd4Qlh5M010RE53UHVlYkt0WVdSNU8yWkkxUmY3Tjd6bXZS?=
 =?utf-8?B?Y1E2anZycUJHT0M4a2d1VzdSdERFTUVRYnA1eEYyVGVETm05NnBIYWo3ai9x?=
 =?utf-8?B?Y1k3cUM1NXQrTHBtSVZvQW1DQzVjcHhwVEg4ZFRabm96QXBKak9sdXk4aVFp?=
 =?utf-8?B?cjlaUjN5UllnbjdSTjRmYUgxcnl4WnJ5dXh5cFZqRE5ibzQwQURlbGFoZlNi?=
 =?utf-8?B?V0xWaTRXaXJSbnRKOGVnRThFSzhNckVmVnJZakR2eFp3dHFpYTk4QTU1VXpz?=
 =?utf-8?B?S2ttcGpFMGZtTG90cis0aFJTVXdHbk90cGNBc3ZST1JDWVU5S0tRU1p4Vzd5?=
 =?utf-8?B?OFBYOGdqUG5DRG85Z0FnTTZ2L080dThkTW1oSklOT0NzeWxjak51ZUpGWFBF?=
 =?utf-8?B?Tk93L3J1NmV3ODlXa0dCNTJoVWxnb1ZSVmtvUmhWOFBYajNjMkFFT1RiYzUw?=
 =?utf-8?B?TC92MnVEZjd5cW5sRzh1WjRWMzZnczE3OGR3V1lmVnRjdkhacnBXdC8zZXlZ?=
 =?utf-8?B?VTRxYTBxTGdrKzVBTy91NXh6MXoyTWJ0UU5XUG1Mc0tBclpGdW1KZEhnSUda?=
 =?utf-8?B?aVBxSjhzQmJEQVVBbmFEbG96S3FzcHFBUHcxYTh0S2VXMkxXbHYzQUkraUNC?=
 =?utf-8?B?YkJqcytlb3UxTkFYYjdRSVNoKzZLNDRqbTM4OWFZbkJoUUFmc0Frdk1vU2VR?=
 =?utf-8?B?bWxqbG5WdTk4czRQdDJmcStaL1p0aU0xM1cyNUZDLytaWDVpN1NYSm5IWHpw?=
 =?utf-8?B?STFxZTkzOG1uWVF4UTBjZm03R0FJa01RVUJOSUVJZkxFTWFiM2FRRG5jZXNJ?=
 =?utf-8?B?UlU1OG5IeFpCNmRQaTFza2lHQjlaUE5TMzc4VjBpVm5qRXhZM1NTeldJbWov?=
 =?utf-8?B?amZzZ2hRNWhZZmhySjBNNk1GODBvMkZwYU1NWkcwM01iRllLaUJjemE4Y2NP?=
 =?utf-8?B?UnVJQTh6WFNleTFKVWswNnZUaWdRZDRXUXZTUlo0RXRETEgrVC92UXVndGtL?=
 =?utf-8?B?bHYzVWZMR2JhU3U4U1BEcWdZOFZodWMxV2xQWmxkLzFLdkZiaHErcTQvRTRW?=
 =?utf-8?B?amdiOUhRMmJFSUlSbCsxSGp2NjVRYzZsWTVXQml1RFVTNEE0cGtDQTV0U1BO?=
 =?utf-8?B?YzFtSStSSUV3eGY3U2ZvSVZ0Withd3JtY1NDMUkyRUNWeGRrT05EYkZEUjhG?=
 =?utf-8?B?OHdMUktqMStUV1lRWlBaQTFXekZrNFJNZ1pld1RKbnBybEx2cGVjdW1KQXdw?=
 =?utf-8?B?dW1iYjY2YXhSOGRvZXpENG9mZEJ5bDB3Ujc4NndHR1VicnVHQTdlMVhWaTJK?=
 =?utf-8?B?NzcxMnB5c1hrL1JyK1pRSi9HTFE5TmRHOENIb2orUnY3OUptTkVDelVRdGI5?=
 =?utf-8?B?TXRxaUJoOEg2cjZ1U0FyUnVFdjY3SG1UaXlNdUtBOTFEYzBYT1pVbkRlTCt4?=
 =?utf-8?B?eHo3VkhkZ1NHSWJWTWc1dUI2cVhLSjAyUXdSZmpLdDA5SWs3OFBXb2wzSUlP?=
 =?utf-8?B?RjZKdzk4Rysrc2xTa285V083ei9BWk5xZldaMUJjNXdSUTF5dHhZNGh6RkxZ?=
 =?utf-8?B?aU9FTHNVdVFGTjZscGFtY3ZDTzZtVnIzdytDNWViZ2VJVUtiZzAwazB4Mkpj?=
 =?utf-8?B?cjlzcXRTSVRSUUZ5Z3VuTzlNODluL2cyRkd2N1FkUSszalBKQXRwbXkyMm5u?=
 =?utf-8?B?Z0tabnh0Zm1kZjFOcytVQldhaVJyMTNSVzVWWFFjTVB5NjFwNENLRXkzZ0RO?=
 =?utf-8?B?SmRMMlladkFmTGE2OVZ0aldvWDAxR3J1NnNUaEdqa2FOajBidTZUd3gzVnFU?=
 =?utf-8?B?OG1EM0M0ZkdSRllHWTg4WE1xY00zVWNYYXd2dEpRb0NMK1gwL3pRYjB2UW5O?=
 =?utf-8?B?NFQ3eWduMmFXVm1kRC9XZ0NoeWFWU1dDcTZUMXpYRWM3WXYzbmpLb3ZCdXJh?=
 =?utf-8?B?Y3BxQTBpOUg1VTdqdkVIZHJ6eG5VQXRvZW5paU5UM1JsdEh1S2QyanZYWklw?=
 =?utf-8?B?Y3ZXWm1BL3gxTnFWUTUxYW4wLzVSdGM2YnBhZU03bnBVV3lXd2VSelJ1bTM4?=
 =?utf-8?Q?6tWi+OGliRxzw+PY7KEmo36ak?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 883c3daa-bf1c-4a41-a0cd-08de360d69df
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8230.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 03:53:57.5187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: baMiBpMk8ek46NzoS95ySO/dGXwdcARjPzEu09tN2CsBrQruZ+A1oGbXevkA/5Z/f1qbkRhwgPCQBGFDz7xgGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFA3FE8A23F
X-OriginatorOrg: intel.com

Hi Bingbu,

On 12/5/25 18:10, Bingbu Cao wrote:
> Hao,
> 
> Thanks for the patch.
> 
> On 12/5/25 5:51 PM, Hao Yao wrote:
>> The third argument (args[2]) to the _DSM method was hardcoded to 1,
>> which corresponds to 19.2MHz. However, this argument should reflect
>> the actual clock frequency from the sensor's ACPI data.
>>
>> According to the DSM specification:
>> - 1 = 19.2MHz
>> - 3 = 24MHz
>>
> 
> What are the value 0 and 2? I think there are other frequencies.

Seems 0 and 2 are reserved for future options, as I can't get the clock 
output by setting these values.

Best Regards,
Hao Yao

> 
>> Read the frequency from clk->frequency and set the DSM argument
>> accordingly, with 19.2MHz as the default for unsupported frequencies.
>>
>> This ensures the sensor receives the correct clock frequency as
>> specified in its ACPI configuration.
>>
>> Signed-off-by: Hao Yao <hao.yao@intel.com>
>> ---
>>   .../x86/intel/int3472/clk_and_regulator.c     | 21 ++++++++++++++++++-
>>   1 file changed, 20 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/intel/int3472/clk_and_regulator.c b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
>> index 9e052b164a1a..0502876284ee 100644
>> --- a/drivers/platform/x86/intel/int3472/clk_and_regulator.c
>> +++ b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
>> @@ -19,23 +19,42 @@ static const guid_t img_clk_guid =
>>   	GUID_INIT(0x82c0d13a, 0x78c5, 0x4244,
>>   		  0x9b, 0xb1, 0xeb, 0x8b, 0x53, 0x9a, 0x8d, 0x11);
>>   
>> +/*
>> + * The PCH clock frequency argument to the _DSM method:
>> + * PCH_CLK_FREQ_19M = 19.2MHz (default)
>> + * PCH_CLK_FREQ_24M = 24MHz
>> + */
>> +#define PCH_CLK_FREQ_19M	1
> 
> I like 19P2MHZ.
> 
>> +#define PCH_CLK_FREQ_24M	3
>> +
>>   static void skl_int3472_enable_clk(struct int3472_clock *clk, int enable)
>>   {
>>   	struct int3472_discrete_device *int3472 = to_int3472_device(clk);
>>   	union acpi_object args[3];
>>   	union acpi_object argv4;
>> +	u32 dsm_freq_arg;
>>   
>>   	if (clk->ena_gpio) {
>>   		gpiod_set_value_cansleep(clk->ena_gpio, enable);
>>   		return;
>>   	}
>>   
>> +	switch (clk->frequency) {
>> +	case 24000000:
>> +		dsm_freq_arg = PCH_CLK_FREQ_24M;
>> +		break;
>> +	case 19200000:
>> +	default:
>> +		dsm_freq_arg = PCH_CLK_FREQ_19M;
>> +		break;
>> +	}
>> +
>>   	args[0].integer.type = ACPI_TYPE_INTEGER;
>>   	args[0].integer.value = clk->imgclk_index;
>>   	args[1].integer.type = ACPI_TYPE_INTEGER;
>>   	args[1].integer.value = enable;
>>   	args[2].integer.type = ACPI_TYPE_INTEGER;
>> -	args[2].integer.value = 1;
>> +	args[2].integer.value = dsm_freq_arg;
>>   
>>   	argv4.type = ACPI_TYPE_PACKAGE;
>>   	argv4.package.count = 3;
>>
> 


