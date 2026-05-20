Return-Path: <linux-media+bounces-62297-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cL5RGyPHDWr93AUAu9opvQ
	(envelope-from <linux-media+bounces-62297-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 16:37:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D269558FBC0
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 16:37:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D3EC31CD7E9
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 14:16:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DB163E8C5B;
	Wed, 20 May 2026 14:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lFVZHB02"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE35613B7AE
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 14:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779286479; cv=fail; b=dLYUOrHTvMrkE0aSCGku7UasEJtS6oN5sGJY/JdUs37MW9oGZ9a4lSMEmcSE8Q5nHVwpMqO90uekYGAuVC0dTJqizhLZorh2fhnejcBOqyy2XLmV4Yr2owrWP8T07MZglJEjnjY8u5yxAZ4Bhim/go8zf9h7YfKS5Q+OJEsOTF4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779286479; c=relaxed/simple;
	bh=oZxmzjZLNgsRLNtF3g1uVXKF5oc5XNdOMihHu/z2ijc=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=s5bMZTJoXDnVXThU3GllbwkcX0nGnafW8k38J9lYZZxxzb5W7nqyDtzdfKiXgXpA1bCWU4efzwjayZcfSdUGw7Du561Upcp12HkTbrVO1wohUIqLVOVJtlw3L5ZMdKttUM5q9ZE7eYru0USZNPBhvOk1NSIVxelLxAPN4ba6PFc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lFVZHB02; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779286478; x=1810822478;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=oZxmzjZLNgsRLNtF3g1uVXKF5oc5XNdOMihHu/z2ijc=;
  b=lFVZHB02PSQNDuwXV2By8xmQB0Et641Y5OGzdEzce/rOlnKagRFdLWDF
   SPmO2WPc7oCA6L/fZ6dIYAr8qtDH0HLsSPOaXdFVHJgAKdkzk3MV4rO68
   KetWBtXiaFWZT43aoex6BMG6lE3NAc4duXQ6PEL4vR73IvvpmKWbrSgjz
   CYPrGMonpHvGnBlL2YIiJ9mKLfQ9So+rPIwa3WNgjgrrDpnPQgAR6Jk5f
   dspugiesvAqib0l2pkmKFjbAThMeQ4AeyjOYmdlJvZPcZHRaPhQ6aPrDy
   cr0QwI9jPwA5fz2n4RRqdlILWEnW0Ewp75TG/O9s1+6KuPhe0eDz73xRQ
   Q==;
X-CSE-ConnectionGUID: e9x2UOpiTuWnp/6QXDL59g==
X-CSE-MsgGUID: mnk0ac4GS9SI2bUdOaJ2nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="90881375"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="90881375"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 07:14:37 -0700
X-CSE-ConnectionGUID: xAiKyqIJQemhzAH7POgkkQ==
X-CSE-MsgGUID: ybYtlTDtTGuU8gDn2u2eVw==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 07:14:37 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 20 May 2026 07:14:36 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 20 May 2026 07:14:36 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.44) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 20 May 2026 07:14:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GCVwTCMNSuiHmeBr59WcUv4dfH25pK+x3gzHqBwYYZcW4bRZ0SqjJKTjblAG3Z9D56q74pB82yVrbqIkUFgkyWZ7VhQhQLeNmAAJqBp+EBUOGHAsHm6FjJCAgI3D/JtG77wdm8IkGGuur0fHYKVeBU72S/C09ODa8gAfDlY5JjLhQcTXnrGB023QS3fNMZ4N9D86YV1toGwarRZn0Bhqd9aLX2oDNWItEvxrbhf4b3NMGKrASRUABDnKcFj9z85I0qCOH44Id0yDbF9MsRq6LpWlIxhwLiqES4f8gKexYgQNPLmqsTbsZqOpLnoypAHuUNA28+SjA9grUzyfll0vWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FOeKt97rWtlVbn+UoOHytXpVqMIzlCyCVnxsHt79uA0=;
 b=Er28B2FavyIOaGxq/XcKubDVDlqyWIbVgmxa3XTVsxPf+j0Ub9KLWVqOsIV+oN7cPUexj6Q8VcM5R3gvqZiECRg3nikAkUBH4A3YbVg8bN5f/jkAyUlUXNnJmKm6j5+9hCqR273zbv0PgHGrSi1yoPXzWX2BtdzzXn7eFE/8XCVxEFM1t+lkehO7bhsGkVx1nBNtt9ENdCkNIHic5WOGlq2PBtgtpFosd8jFKvvqN1r+dFAZDfbt+sN44jgyKnWzWVuqpTcQxfLwDaQ8CWGWyaOUD7Q0f2Gt1t/Nfr0Oafq6SkRto0Vadf61Q16QpebugIPI2ywaSlFPsDQVwIcFVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8568.namprd11.prod.outlook.com (2603:10b6:a03:56c::19)
 by MN2PR11MB4517.namprd11.prod.outlook.com (2603:10b6:208:24e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.16; Wed, 20 May
 2026 14:14:34 +0000
Received: from SJ2PR11MB8568.namprd11.prod.outlook.com
 ([fe80::a548:ac78:60a8:8a43]) by SJ2PR11MB8568.namprd11.prod.outlook.com
 ([fe80::a548:ac78:60a8:8a43%6]) with mapi id 15.21.0025.023; Wed, 20 May 2026
 14:14:34 +0000
Message-ID: <e9fd7a3e-8293-4beb-a3f3-f12f3dd81b94@intel.com>
Date: Wed, 20 May 2026 07:14:33 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] media: i2c: cvs: Add Intel CVS driver
To: Mehdi Djait <mehdi.djait@linux.intel.com>
CC: <linux-media@vger.kernel.org>, <wei.a.xu@intel.com>,
	<atul.raut@intel.com>, <sakari.ailus@linux.intel.com>,
	<antti.laakso@linux.intel.com>
References: <20260514184431.288353-1-miguel.vadillo@intel.com>
 <agw84jsC6hrAduxX@mdjait-mobl>
Content-Language: en-US
From: "Vadillo, Miguel" <miguel.vadillo@intel.com>
In-Reply-To: <agw84jsC6hrAduxX@mdjait-mobl>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0130.namprd04.prod.outlook.com
 (2603:10b6:303:84::15) To SJ2PR11MB8568.namprd11.prod.outlook.com
 (2603:10b6:a03:56c::19)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8568:EE_|MN2PR11MB4517:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d3b154b-6c64-4ca0-09c1-08deb67a1e17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|22082099003|56012099003|4143699003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: SayXY02AILHYC5kSuzU97IP7A0C69yulKE2hA8A+3BUATuLvyq0SrySDaUqmbjASM2HOh0eARiwOfBUhTnrHYu6QsuHm/LeX8p+jvydLeoApQNRmoDheX5EvZU3bamikMfU5daGDyZhOYdnMmLSHErV45G0w/4lxbASBYva/xCOBn5X0Kv0uqWBFiKHPmkWkfuHBtYt2xYAi6FdmBVdzk3aEFyo8pamg/qAxNd88qq7Xob3IVryoBIB2F2IP2XNiUhvwIzm0D/s5pW4LZNUQR9FV6GEEw+5gHTv9O5a9bL5cOfqLHGlHDB2jM5D1uxZfLCuwG3fsu9n/C15Eyw+HByiKtgXuKGE6RPu2a6MGuLoV7kfr6UOeekedtqwNTna49SwwM+F4CcMrrfZOIu21LRSUmEDmk/BSmLymXy+BIX3IOmMOEG8y0USLWGfsDpIB+VgF/nTKWcB/hC7HRmFzzwML4XfE3TrrbFPCqb0c6IPFikzpa+0ueGnnRnIQo2St3/Pigw63SSrBeDS3jaXHsTlQQ9DreVlzbGJpIeI4ujFtuFfgAv7jDyPBO5kqQ4nblD09MLDhdJIYRuVWPJ650QR88dU46dLtIPa3HN1eGeUkEvaoMT3od0dmkQqClTayBDQChy0J4jlPnSf0+ETl+VRSV3krD8b8946ioPMjDC6+/1IjuuYsyPR8heXkooCq
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8568.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(56012099003)(4143699003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkJuRC9pYVlLRUdUdkxPNUEzYmdYQWhxZ2RrWUd4RGF1QVNNMktQVE1qU2RM?=
 =?utf-8?B?b3lMNVBjelo1UDA1VEg4OVJZMnBnRXVLZXE3c1FENWNQQW9rd01mcVZBZDR1?=
 =?utf-8?B?VEM5elMwUFdSUHdLR0tDK2FOT1orM2RqVmZXaWVoMTVtWkpUSUhWQS90NTBo?=
 =?utf-8?B?am9WUkhRR3JCa3VLOTN1S3o2aFdraDNTS0FwS3FzWlBTb2ZFeENxN2R2ekl6?=
 =?utf-8?B?MHFmb1c2UVlLTlF6YUx1Wng3TWtTbkFHRVVrSktISHdCdU9iUXBZR2VVNTZl?=
 =?utf-8?B?M0NWUmlLTjNMZFJZaVRqZ0E5b09YZk5CaU51aHY5dkZxa2Q1SmlESGRRcGxj?=
 =?utf-8?B?YzBqYU5GUnY5SzY3TldwYWRYQVJKTlZpVG4wMXkxeHpza3JPS3Q0L3FrTkFI?=
 =?utf-8?B?ajdqeFdGeFo5OGZOa3B6cFk3WHpkK21teWtvMWh2MU51RFRYN2YwRkZ6UE05?=
 =?utf-8?B?ZkRTenNjbVJvclNEUGRQTFR6dXhjYk81K2tYT3hCcHZkM1BuODlwQ1pDSzhK?=
 =?utf-8?B?Wjl6Yy9PaFdnY0drTC9ISXcyNXR2TStZWWozczNpVExHd1ZHVXgzL0hCdmpZ?=
 =?utf-8?B?MWtCT3c2OUxjQ21wWWs0Z0lFVS9ubU1tN2VIZFFUS2V5WG9vZkdzNlZCdlBo?=
 =?utf-8?B?VnNpMGZrckFwQllja0pnT3JMNEFxZEMrN1VKY0hocjBwbndnQ3hUWGVyaUg3?=
 =?utf-8?B?Z0RDSTU5L1QwTmw1SDRpK3E5OWVTbnBkbjZMallxQW56aVgzK1RTd014a0di?=
 =?utf-8?B?SWNDYmdIdUhaanVpemJaSGpuRGdVd0ZKRjNpTGVKUG93ckZoK2lUUnVTNk1p?=
 =?utf-8?B?SGM4b2M2ZTFrT0E1SUdjSG9QUGduMWcvSzdxWFh5cGU2cFdiUkhWTW1nZWVu?=
 =?utf-8?B?N2p0dWc4SFQwZTdnQ2hjc3Q1WnFLci9DdU04cXVYcjhmNVY0azErTWtSa1VL?=
 =?utf-8?B?MU5QRnRKckVjN0xMTVRVbENOQ3IrVU16RllvYk9FYWwzRjhVazJTc3g3c1Nh?=
 =?utf-8?B?TjUrczAza1Zpd1FMRm5pV2F5ZXBCQ0xRRUpFZEhERHBDSWJlVEZaQ0xsSmI4?=
 =?utf-8?B?TzZkZDlwakFsb3hPZDRjMzRkKytDazE5U3VsdzhoeGFrdlNrVTRVdHY5Mnpw?=
 =?utf-8?B?Zk9MOXlPWFpxWXhUaTdnVFpnL3RULzVyT2U2d2Jhb1hCZktMSFltSU92eE1O?=
 =?utf-8?B?anVsd1ZjZWVhckc1RTE3bE9DU1ZwMmRxNU9hVG0zNVF3UFVrd1hNQ25NSlBa?=
 =?utf-8?B?czVkaHdGQlQzbldTekoxdkdHN1R5U3BpM2hWK2NFbnZtV2pNVWttYlQxa09w?=
 =?utf-8?B?RlRRcW4wdHRUekNOWGVhYitFZkRCQ1dGSVVGcUY1OFJkZVpYQi9ySURlcFp6?=
 =?utf-8?B?NUFYVDRYdXhVbDNHNjhBemV2SzBHZzgxSDFTNXp6WG1oTmh5MUZPUHhUZTFn?=
 =?utf-8?B?VHQ5UjZIN296TEphR0hBNnNkQkN6REV5aDE2V0JyZDhYSFMrRzFwUk5ySXlu?=
 =?utf-8?B?MndPSElWRXhaNEdYTzFtdFI4NDlpekNYYURCUHQwajhSVmVyOGZGNVp4RlVS?=
 =?utf-8?B?RDFyZ2lqYWpiQ0tpU241WUZ6U0lGMFYxbHRRM1czbmU0cmRoZko1WjZBTU5W?=
 =?utf-8?B?NTVncnVTZSs2R2UrYVpVaGkySDZGUVpUcUlkcWF3S3NXcTg5cDB2WCtXdlNx?=
 =?utf-8?B?YWZlUHZOZGZha3YzZmFRRVdsenRWWlVJUkV0YUcxd1FJRmJuZ282LzkvTGtQ?=
 =?utf-8?B?UGJtcktsQXBlVDBmek1lTFhMYmo1V1hEZzVvaFZKeFVpYXJtS3pNbEt2bHM1?=
 =?utf-8?B?THFEamo1bjlIWHhEamRJWllqaE01T0hHZEtVa3BXOVZzN3JFQVZMVXpZR2Rl?=
 =?utf-8?B?bFI3dU5ZcmQ4Rk11OUpIWi9GRWpGZXlUTlBkelJWVmFEelFnbXljR2RhUUl2?=
 =?utf-8?B?aXkxaW5hYVVvczZWeEpUejJXck5DY25PNHJMa1U1OGhMemdHdVVXUTRxTTYy?=
 =?utf-8?B?YzFuZytNZkpSMFZuYm9kbDJNR1MrQS9oakQwSG1ZSThZUTR4QWZrVGdFZUdM?=
 =?utf-8?B?MVpNRVVxeFFQVGEzMHdHSGV4TklBTFErNTNNYmVRZVkyUFduOE1OSDVpOEU4?=
 =?utf-8?B?bE9WR1lKN1J3ejRFdUd1YXlyYnBJWTg3Ny9hdGk4bC9TZ1BmNzBJcEM0QWl2?=
 =?utf-8?B?UkJpVmhJTW9zR1E0akpBZHl2RHl4RzA1VmF2Y0RZRFpnbU9CQXBCeDdhakFh?=
 =?utf-8?B?Ui9wWG1qbkRnejJ4T0RSWmpTemV2aGsxd2lORnRyRUtIZ2ZOMVJmVHE1NWRF?=
 =?utf-8?B?Uk9PalYyWjFyOWdBUlpNVDZNemdBRkVqKytpdjM2aDdURDJ0OUJZYlhJRmNS?=
 =?utf-8?Q?HiBKmCYTO8U+HLnQ=3D?=
X-Exchange-RoutingPolicyChecked: bLrYNWvN08KUNfBsbYnUeD3cwAIqUaVu83OkFTWaPH0WRCSQTG7E3kR0VqOI28n2XSbTvcWWXFraq0PGknysiS1+z961fJDlQMDYs8yTYmrhZRy5RrtRfVLjXGE9jd00sg55q/IW9C0WA2jA+OJ8pBkGV2/QSPV5RDNgCYynVDlRFPLBGtoQCIp02tny37HT7SyAr2LwZ1zNzTrntZ2PqEFYJkiHR403JlKDVLuROcokUJ5HISuQJcZjYhASIOYNTaGTk31PPCXpFizDGTDeiD0UNa8YOr3AamztquSQrIQVrLbfQJJ1T8tc1tL2JLfea+haUFmqJ7RKJEqc2AvyUQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d3b154b-6c64-4ca0-09c1-08deb67a1e17
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8568.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 14:14:34.2543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P6VZDMnz9Y6+PmOJzNXMZWs4sh6rH/AFX53txx0PHaST6j3aSMORl7GhbLDwZ04fArExzg3IzN/gpbt5kSDEVQ1gYo1vedaogS4nBXrfH6c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4517
X-OriginatorOrg: intel.com
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62297-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:mid,intel.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[miguel.vadillo@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: D269558FBC0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Mehdi,

Thanks for reviewing.

On 5/19/26 3:40 AM, Mehdi Djait wrote:
> Hi Miguel,
> 
> Thank you for the patch:
> 
> On Thu, May 14, 2026 at 11:44:29AM -0700, Miguel Vadillo wrote:
> 
> [..]
> 
>>   MAINTAINERS                          |    6 +
>>   drivers/media/i2c/Kconfig            |    2 +
>>   drivers/media/i2c/Makefile           |    1 +
>>   drivers/media/i2c/cvs/Kconfig        |   21 +
>>   drivers/media/i2c/cvs/Makefile       |    4 +
>>   drivers/media/i2c/cvs/core.c         | 1007 ++++++++++++++++++++++++++
>>   drivers/media/i2c/cvs/icvs.h         |  495 +++++++++++++
>>   drivers/media/i2c/cvs/v4l2.c         |  618 ++++++++++++++++
>>   drivers/media/pci/intel/ipu-bridge.c |   13 +-
>>   9 files changed, 2165 insertions(+), 2 deletions(-)
>>   create mode 100644 drivers/media/i2c/cvs/Kconfig
>>   create mode 100644 drivers/media/i2c/cvs/Makefile
>>   create mode 100644 drivers/media/i2c/cvs/core.c
>>   create mode 100644 drivers/media/i2c/cvs/icvs.h
>>   create mode 100644 drivers/media/i2c/cvs/v4l2.c
> 
> Is this series missing this patch ?

You are right, the ACPI and the FW update patches are not in the 
intel-media list. I wanted to first get the main patches reviewed and 
merged and after that we can send those two. I think ACPI will have to 
go to a different mailing list anyway. I can add just the ACPI change 
with the next version of the patches.

--
regards,
Miguel

> 
> diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
> index 530547cda8b2..3a6ff694047e 100644
> --- a/drivers/acpi/scan.c
> +++ b/drivers/acpi/scan.c
> @@ -848,8 +848,6 @@ static bool acpi_info_matches_ids(struct acpi_device_info *info,
>   static const char * const acpi_ignore_dep_ids[] = {
>          "PNP0D80", /* Windows-compatible System Power Management Controller */
>          "INT33BD", /* Intel Baytrail Mailbox Device */
> -       "INTC10DE", /* Intel CVS LNL */
> -       "INTC10E0", /* Intel CVS ARL */
>          "LATT2021", /* Lattice FW Update Client Driver */
>          NULL
>   }
> 
> --
> Kind Regards
> Mehdi Djait


