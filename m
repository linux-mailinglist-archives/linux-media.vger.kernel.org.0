Return-Path: <linux-media+bounces-62897-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gAfoCO/+FmoJ0QcAu9opvQ
	(envelope-from <linux-media+bounces-62897-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 16:25:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D4D5E5D51
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 16:25:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 785D53019BB3
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 14:23:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C40CE40DFC6;
	Wed, 27 May 2026 14:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oq5F0Md9"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C84231AAA8
	for <linux-media@vger.kernel.org>; Wed, 27 May 2026 14:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779891819; cv=fail; b=X3Bm385VcHL3DBYArPlF3TCiBK/jCZUqB+QmnclJdIE8FtmpxtjZz7MLWgLA6bgYdtJWF8OnCq0NfDvcDzdtblxt7fG8Nj9r5F9Tw6JZMAXN5dAtOyRlBoddq5nha3WgrfcgppjYLcCeEN5Qphv+cTCjO+tUuoC5AQCvnkpdm0Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779891819; c=relaxed/simple;
	bh=xyzgTYWwaP8+++RthTyATJB2Iicy2udQPLMdM1JR8cY=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZjmxtO9+C90vhCPcmCQify53D6Su9dm90/sNURyOPS5E1W2znJD8dGQC+0zp4ybVKsFOK37HLPLumDEC5R6xYztIEDoil2ApVgq6jTEegdqJp2kegfFpl9gpyI9FBl32odwX5wSIjAty58CT+tQY3HKRDriIPFmz6/hAhBUs5Vk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oq5F0Md9; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779891817; x=1811427817;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=xyzgTYWwaP8+++RthTyATJB2Iicy2udQPLMdM1JR8cY=;
  b=Oq5F0Md9rW6MkXToRUATZ+4IhLYk+A1xbkUB5UDXxAFdCSrYQ145ltxS
   OX5YHyDQ23FNDvMAtKlUdt7z92UyeExu/8Xi1IVIr2u5+7Rhh1IpDQM33
   IHbZqg+cZZkepFhx3fF93uTRWvE63j5DTdSnfRQoCMZfxWeENRA7Vo3p8
   BhHwiR66tOAv80/YutwDH292kXUjdLbwg+plpWFe4zLPDEhsE0iE+zMmp
   TDXoG8yPuFwAQ7PV97c93244+ZYHHcencrDEMJu8isMRdN7zakziRGRAh
   Rn1EgR7iJStagTyKPDoNgjZbsFuP0NxzwScY8te5ydvMNGw+2EuuQkI39
   w==;
X-CSE-ConnectionGUID: 03SXyjoKSXW9uEsj1nvXIA==
X-CSE-MsgGUID: uCwjXfaSRq+DfMR/kg12WA==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="91827978"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="91827978"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 07:23:37 -0700
X-CSE-ConnectionGUID: oACoLWiTRqiU6sqfrWy+WQ==
X-CSE-MsgGUID: JXwTFO3lRV+kpgkTjPWGJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="241216496"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 07:23:37 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 07:23:36 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 27 May 2026 07:23:36 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.39) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 07:23:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pLPMLMJCxb/bb/7zlnRxwNvKVAK48Z+ZLIHjyQ5xOe8tL7FCY7ZyncdYOcRaG4sqqyhFZTOyBfgbui6K2mm4nrUCc0/1CJvw/jeh/tnk63l9AbyqQ86wf8Jn8TXuetWyACl/V+MZqiXn0Cfr3IyyJD0QYli877E2rWsSLd/IS33IhKJkJVrse37sIwQf8yesIURahteGyJvUx00sq2Se00g8DlkD0BP+Kcsul211DYkkuKQXdWwJVa1y8DHHMSHb6UTfyjVIxUkkLjbrmUqa8O4YNwimsMkC94MiflDX8dVQdtVAAIM9mmXA3/KSgY4ViJ9eWl51eKojTdGt0QRKPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8d+fnPZss9aWvvyygaZYMY5X3+26LbqVOEdG6gA4gvY=;
 b=CM0ofF1z5cfZIDRXsh109CFO5bvnq7Zp5dDgezQjObm64m+W1cNdJIMd9pN2e9IL0Tka95yybV4TalPO3LTLuIL4JqVV5ejMDmXlO/nBTiFEK03v9igs+Ks2qA4JGKASWbAuhPZZqeTpgd8Ggz1du+9/EkO0sfP3YqTtwD3Skjwsxw/13sAURD2Zn50dABtJg7De9GeWqY/cU3Z1zyPFbon8c1M4H+UFZHi8HhSfaRc/8JTB3W9c2O10DuOrzThNCxnTt903PEFE9XbaZj38sm9A9rheItvaQYp0vkK77ckb8rDPPWOLnghi+m0VzKoV8MfZ7r0SMQIQwIlrVPjwBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8568.namprd11.prod.outlook.com (2603:10b6:a03:56c::19)
 by BY1PR11MB8053.namprd11.prod.outlook.com (2603:10b6:a03:525::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Wed, 27 May
 2026 14:23:33 +0000
Received: from SJ2PR11MB8568.namprd11.prod.outlook.com
 ([fe80::a548:ac78:60a8:8a43]) by SJ2PR11MB8568.namprd11.prod.outlook.com
 ([fe80::a548:ac78:60a8:8a43%6]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 14:23:33 +0000
Message-ID: <0287950d-cae6-413b-8252-ecb40be11009@intel.com>
Date: Wed, 27 May 2026 07:23:32 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] media: i2c: cvs: Add Intel CVS driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: <linux-media@vger.kernel.org>, <wei.a.xu@intel.com>,
	<atul.raut@intel.com>, <antti.laakso@linux.intel.com>,
	<mehdi.djait@linux.intel.com>, <kieran.bingham@ideasonboard.com>
References: <20260526022509.162908-1-miguel.vadillo@intel.com>
 <ahXB-Eg1O2-PlFvU@kekkonen.localdomain>
 <16f5874d-0d22-4c8a-9bad-63a9b383dcf1@intel.com>
 <ahay-Ej_RrrGzIrX@kekkonen.localdomain>
Content-Language: en-US
From: "Vadillo, Miguel" <miguel.vadillo@intel.com>
In-Reply-To: <ahay-Ej_RrrGzIrX@kekkonen.localdomain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0203.namprd04.prod.outlook.com
 (2603:10b6:303:86::28) To SJ2PR11MB8568.namprd11.prod.outlook.com
 (2603:10b6:a03:56c::19)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8568:EE_|BY1PR11MB8053:EE_
X-MS-Office365-Filtering-Correlation-Id: ba8a140f-6cb2-4cf9-b6c9-08debbfb8879
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|11063799006|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: OQLPIkeYRVAgxISUuynbXQ2B5BgURhSz5xy/Vy6Zu/v5nzdDIl4ehRqT08PFAKrvAdx2N5x9eZBlAWWeUd6UlQUWxFbFAM8EtL8pB4QhPrrZHtvEYaLWkgcwxlGoRZ6qdQdEeFszA9sn6IHtqz3uZ2JCuI+smo5DuNjOjsHddhWzoplaooy5MQFVlNjE+AzybQKscTctwPOqnB/AuhrD13UuiKNrXhNrhsztOqXEAQm7b4XrGEtbIDNaO/1jTEn5yFUUFg6B5LAyRfWbhP9yuWgqZi+RTz16TQu2gYev2lIboUqiaEcgDLvRlsRjsvA/HHNbHSVx0DrlEFha008WhtudXuACIEReCuQOK2PInW6ijpEoub2BgfUAY9rHEKx3yl0fjzai9cloa7zOinMDUyZUHuf68qmzplQdaPvUjT8eomI22f7cKol4qfV4YlnSpSB8C0u5fMe8JAaR+7lGmvmWYK+DAupvsSpgrzK8quh7WRO8srWYm0i9H/H8c9bbgSTCUy9/D+jpuNaETrQpKgGrGNf0tiaRPKqvL3OmSjuP47a7M+r7+pzgx1KPhenolHFxnDuWfMkKzzdymgkm+zbjFxcoETf3AigPzbnNIRvZbWcLY3P9XanWyvFhDK4e9EyqExGc6xqmSfRmcHRfkQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8568.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bks5Y3lqL3lya1J2cnl5dkU0ZzFiQ2lUQ1FGSWlBay9sNHI5ZlJXSklwQVFT?=
 =?utf-8?B?eFhtSjIrMVFOdkhKUHUzcStvRjdCQUNXdnp1NFdsRU1wMTU5bXlVejNEWlVN?=
 =?utf-8?B?WVNWY3IrbElVQU4xa29DNUdmWXhmdi9kbnpjV1BhVnVUUHphNlEvSlBETHNK?=
 =?utf-8?B?Tm5qL2x3MGdWVUU5OGdURXliVGxMYk42K29TQU5xT0NFQzVYclU0S3VOQ3hE?=
 =?utf-8?B?a3FXb1U5Z09nYnY2OUZFWlhxMmhPVVMyRWVJNmdvMCtTY0xBSERXOTNqYzhV?=
 =?utf-8?B?Z25BT1Z0dGRZWEVUQjU5WGJ6T05ISWNhcGRuM0NYQzRxV0hZYmhucldPaExS?=
 =?utf-8?B?K1RFOCtjSmk1Ymw3c1lFaWx5VUZNdXVLSHd5V3dtR1RJRUplQkU1TFg4Q0li?=
 =?utf-8?B?VmdZV0JCQmVJdVh0ei9RSXhiQzNGc21TZ24yQXpaUlppbVdKaHNvMXZyL1dC?=
 =?utf-8?B?ZVRnL0RsVDZwbGdhMWFpTEVTczMzbm1wT2ZLeDNqbHU5ei9hSDBxaDVlOXNZ?=
 =?utf-8?B?amI1Zm9FNUk2bnlYVThqenp6L3JKR1BBU1pTbDMvdnpuYWZ4OWRrY2NkTW5p?=
 =?utf-8?B?RjM5NE9rRFNVUHdHbW5aVFlsWnhocHR3N3dIN016ODJmSzZaSUE5bmJVbEJn?=
 =?utf-8?B?TkM3NnVFYkJqejNPZEF1WlVhTGZXRG03MFhEeHdzU3EyMm1oc29ETllyd1Yx?=
 =?utf-8?B?T2RjMTgxQ0FQVXRwZ21wYWpRdU5BNFpvWjFTbjZsQ24rcEM3anMrYmwrRjlX?=
 =?utf-8?B?Y3lnbmIzcDducFJTdktQWXV0cUhOaWI4WUJRRGtDYlJXdGRzQ2s3eGxKa0xp?=
 =?utf-8?B?R1pmS3RzVU1Hc05nU3FyNUc1MENRZnk3cFQwK2JIQitheHhqMTBkWHMvdWJF?=
 =?utf-8?B?dlBpczk4NktjZ3RsdUIvbVg5Y2Z5MjdBS3NUcldDOEhEWTU0cTZiOStyeUNF?=
 =?utf-8?B?d3UyRXNpRVdrMmFIdU5BOWpmZ0lIRGhDaVNWM1d4eWk4NGJpbE1tYVB1R3Nr?=
 =?utf-8?B?bWVtVGl5ZUh5cTdENjJzUnlkTTUweHZTY1JtU1hZM3g0RmQ1SkxWUnErY1dn?=
 =?utf-8?B?dzVxeG9PWHhqamUxYTJ1a3MrcnZqcnd5Q0ZQaXI2cW9XWkNWdkI4N1VhNEFQ?=
 =?utf-8?B?Q0VuQWJwMllRTWhwcW9vYzFDODN5ZTVhc0VsOVVaMC9JK212R25pV3JvOTE0?=
 =?utf-8?B?eFh5Y3Azb29KeFVWY2RrSHA0RjlySnkxSjlEdXpPR2FLRFhBV0lSSHVJQndL?=
 =?utf-8?B?Y0RhcTBSYldjVzVtengrUi9SNUU1aTF0U3lwV2FCclVaaEVPSnhxdHAzOG54?=
 =?utf-8?B?V1oyZkxLL2ErTktJaUlPVmptZ0VaaVpudEdMSUtCTFV5aUNFQTIwelNBZ05B?=
 =?utf-8?B?d0Z3YkxabUNPaFpRcitHWDVrbEhER3hmbmJPTlFYZURsa0psb1llZWhOWi9D?=
 =?utf-8?B?b1ZjRUNoUlk5UTJMYjJwSzAyNHBHMlVBQzFsbWRBTHRvck5COUhFaisybFEv?=
 =?utf-8?B?ZU5QTzBsR21SQTB4MGUxSnVidE1iSzBORnpkTHRGN0FTblBPVDJlbjVEWmU4?=
 =?utf-8?B?aGwvL0lsNkJvcEFrS0pkekxPMVF5ZXdZZlRMTDZzajlHMUxwdEFYRFVNMHVB?=
 =?utf-8?B?cE9MMHhPcCtaZHZKeEVqWnFFUUJNdkVVUElXZkhqZytVZnNjdmpLamdaMlND?=
 =?utf-8?B?QmtrTFVPRDF2T25WWFM4RE5reHBzMmxaUUhUeDEvbzdKYlZJVUxBMlNPOTVr?=
 =?utf-8?B?ejBtUW5VN0RsMlhMRGk1MDZGOUJLdkJILzRTd2d4ZkJKMkt1NjBpNHBXM3ZE?=
 =?utf-8?B?M1JpaEQ4ZzNYMnFFdjhWdFBLVE1zMklaMXZXa3c2MTkxWkI4ZFZqa1hVQWtr?=
 =?utf-8?B?enpyWXpnSHh6RHRvR21HRm1TOWFYK3lFWnNVaE84bHZkL2k1cjZURFdJY0xu?=
 =?utf-8?B?alFXMmZ6Q2FaeFhQZTdpWUZ0ckhNZFR4UFhKYkRhd2J4NkNibGx0U2drSFFC?=
 =?utf-8?B?K1JwTzZkMmRPcndVSTk4MDVHVzdRWFhWSFg4cDFiZXZ4ZVlzWW1KTWVGVlFn?=
 =?utf-8?B?OTZQcmJzQWVIWXRSdUhzNHVSOGRmNkRyd2Evc0VTRzdKV3NVSkdDT2JQQU5j?=
 =?utf-8?B?TndiaEp6ZkZ0akpVNTBoaHV4VUI3dFRhVkk1UVdmNi94UXJCMW41NHFiNk1i?=
 =?utf-8?B?UWNRUDA1UE5UemdrVzNmbDE3aWwyNHFnK09HbW13L1NKWk9rbENDcFN1RElW?=
 =?utf-8?B?bVMxRTVydWRqRW1UWFlIRU1aMFZYMEpTc3hUZ3loZ1I2ZUVFMWpsN0JIdm0v?=
 =?utf-8?B?NW5ldTgzSVhkU0ZXWUdSMVBqUTVCelM0ckpUUWt4NUZLWUhKNmNGaEZ1bW1h?=
 =?utf-8?Q?mRtt1jDOH8qllfAE=3D?=
X-Exchange-RoutingPolicyChecked: L8Kt2KwCYsFPLkpbZDFoWP0dJHvnQZZedwUm7CfZgR1K6OOj3ozGNo5HWX8+3wl6C2gZWIy/ZCG8xPAM8qBjtuOvPK+qqVVOTo6A4KM8OMJLLBaVrU7kqBfWobfHPa4ihzrl0Wk2Xj+9LtJqMZYtLEv9aORuOSYp7fgDFbewyKMq02H6ycFIp5pVulrPBCHrKm6Wd75H3GI1rIF7xvx7opwAvUf7gDiiE+GKZXtIo2qT53YZFYXAbMfPoOCbl8SuzwRPhlbQlNI9NdmHUXG7MAEG2NBdLJPeXo3Dd+9KW2qWlC96Rjlm35xSHa3s0gVMASYTjX0j+SeoGHuWyznFEw==
X-MS-Exchange-CrossTenant-Network-Message-Id: ba8a140f-6cb2-4cf9-b6c9-08debbfb8879
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8568.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 14:23:33.6423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /knO7KpOVs3xT0GZsfJcfo2d4+7RrAeiN+0a9QUY0W3mqxeH6PagMTbbLwAM5NIQvxctmltWX/ng8zkNAdjF85jqYOeO6bbhHFY1fKhg1WY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8053
X-OriginatorOrg: intel.com
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-62897-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:mid,intel.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguel.vadillo@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 70D4D5E5D51
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sakari,

On 5/27/26 2:01 AM, Sakari Ailus wrote:
> Hi Miguel,
> 
> On Tue, May 26, 2026 at 09:29:30AM -0700, Vadillo, Miguel wrote:
>> Hi Sakari,
>>
>> Thanks for checking this.
>>
>> On 5/26/26 8:53 AM, Sakari Ailus wrote:
>>> Hi Miguel,
>>>
>>> On Mon, May 25, 2026 at 07:25:05PM -0700, Miguel Vadillo wrote:
>>>> Cover Letter
>>>> ------------
>>>>
>>>> This patch series introduces support for Intel Computer Vision Sensing
>>>> (CVS) devices found on Intel Luna Lake (LNL), Panther Lake (PTL), and
>>>> Arrow Lake (ARL) platforms.
>>>
>>> Thanks for the update. I got from Media CI:
>>>
>>> drivers/media/i2c/cvs/core.c:909:12: warning: ‘cvs_resume’ defined but not used [-Wunused-function]
>>>     909 | static int cvs_resume(struct device *dev)
>>>         |            ^~~~~~~~~~
>>> drivers/media/i2c/cvs/core.c:892:12: warning: ‘cvs_suspend’ defined but not used [-Wunused-function]
>>>     892 | static int cvs_suspend(struct device *dev)
>>>         |            ^~~~~~~~~~~
>>>
>>> I suppose this happens when CONFIG_PM isn't defined
>>> <URL:https://gitlab.freedesktop.org/linux-media/users/sailus/-/jobs/100763316/artifacts/file/artifacts/no-PM.config>?
>>
>> My bad, that seems to be the case with CONFIG_PM disabled:
>> this fix will be needed, I will prepare this and send an update, waiting in
>> case there are more comments..
> 
> I think cvs_pm_ops also needs __maybe_unused.

I don't think so in this case, since I am using pm_ptr(...) for the 
cvs_pm_ops, this should take care of the ~CONFIG_PM. Just to be sure I 
recompiled with make drivers/media/i2c/cvs/ KCFLAGS="-UCONFIG_PM 
-UCONFIG_PM_SLEEP -UCONFIG_SUSPEND" and no ERR/WARN were generated.

I will send and update with this change if no other comments..
> 
--
regards,
Miguel


