Return-Path: <linux-media+bounces-30977-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED57DA9BEA7
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 08:29:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C08E4A1450
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 06:29:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C64FC22D4D9;
	Fri, 25 Apr 2025 06:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BPS/dnP0"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A998722B8C3
	for <linux-media@vger.kernel.org>; Fri, 25 Apr 2025 06:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745562548; cv=fail; b=FTMEs0+2pcLX+aelwpknVQ7FHFaw3fWeyHkGy0B3abuf4DfF4raLGUbiilblJIlGvrbDVYcO+1MkXLiWVlO1zXygP3jNeCEWYbQxur1thxYxCc5+Z/eY6t2sCtzzab+J2lqXDZk8WxH89IeeRmM/MN9CtHYWFK5XmOJreeSsyu4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745562548; c=relaxed/simple;
	bh=QbVBaw4KLwSaubJJlek8eiH2AVIxaFR/J4+qrtCnKI8=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=s/FBj5bIbIA5I+RUxZ9TgV0PZMZhfbqsbUwnLYUM2gaFO3CkG9ZYN+GxM9yymJNeiuvTwyv5DIGMoCpQEpxckJQ8l7eoX6FZMb+LWLaM1HWIDfCNlyHt7+zzGpak+RFhSlb/awIqmWHhie7QwaIAWNiS+3SJRcUHTqALWZJRcpI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BPS/dnP0; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745562547; x=1777098547;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=QbVBaw4KLwSaubJJlek8eiH2AVIxaFR/J4+qrtCnKI8=;
  b=BPS/dnP0AK54568JSJ9MJPbwMurplq44FYVwX5NPUertkCQTnO4Guq7a
   m3Tyjy75ZoUEfUANPRmxyHhnZGFPrJ8FNPauwZ3Hkv4UjWMGmy9d8l/CM
   +ZoA1pI7PcKW3KCyyc+XYylbfvRvPIza11JCWqcmYMfijhFn7YP6Kk+eV
   kC4mSRvjcz1F4w+3EFaVXCu1Ry/hdKcptafkBo8laDhsxINOGFs7/fdqO
   js5aQcFk6ugdKfe0HSal2qCgltBVFbtvg9wZoT7zloCzvNjFAMzGcVAbj
   tM/a7lnGqaK+P6WkiwnqvVBFbKMkUJ00ePVD2LkgCTrEorjR1TjaDhqyy
   w==;
X-CSE-ConnectionGUID: beauTx/nSaq0fqsSoYnFNA==
X-CSE-MsgGUID: ASwK4qePTpuIimULG+dGjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="64633351"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="64633351"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 23:29:06 -0700
X-CSE-ConnectionGUID: Cju8T5YgRtuIw/W0DzBrGQ==
X-CSE-MsgGUID: z2BH0WwcQE2opGiTLfonhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="132815760"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 23:29:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 24 Apr 2025 23:29:04 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 24 Apr 2025 23:29:04 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 24 Apr 2025 23:29:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tzcWdUHWft65BkiZwqLtag31U6uMjSJZgHBO5pk+Dh4Kn8Fl4O7Qhucg9P/xcDCaFRWvxm/z1z3sh1gn4g6sleJEWhJYiqIXUJhvLqbwG2ZDpkOfwDutoMJzPIfK6xuTzKbipYRHO+ptWkgBKYLsbmn9P2r+uk4QlRzFpyY0bQJ0Z6DULecgO3kjTZ6t7xI8doCxKb/+lMUCEAyKzHMTbRGdSdNceqTqT87Pp7Mce02x33tZvnQqlXNxRIw85wQtEgiAGaIRJ/Jj4M7MoVf2L1TdkOeybFIJr+49hYdFL3rZKGe8nEQtTTwnXJdQdme8xVzhLrgCPEXQcNNiUfWd5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dFDtQ11sV1pFkcRVWG/ipUbOZZI24kebW2DyY7devVw=;
 b=b35dqY53sgG447+BfVjEx2yOXd1mVXPgCuvZaUuWFTZcYLOi8jfthvpcY9LxCOo9CFiiN4wvGiOh/fSDav1SgGNUkF5bvB0m2mscDSegyaMI4YrQmCze692tnrqUCqXWbkqETluv5VdUG/M/MCWEZ09qUYoHp7lbT7e1aL1gTmCsn8Yl2GuJYrnBkAO5bWCfz4VJNNltEczCqbNh7l3sxerviAsPO29tKifDCijrNXHWs+wFVmKtb9GMzspbv+JCvHCpYTvBgE7vH+hDKmtXf8XEWHjOf9JiN7QmqEirdXalEKIRd3v24vRNtM0j09ccb4zlv2+zh2rQi4xf0FUSXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8230.namprd11.prod.outlook.com (2603:10b6:8:158::21)
 by SA2PR11MB4842.namprd11.prod.outlook.com (2603:10b6:806:f8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Fri, 25 Apr
 2025 06:28:20 +0000
Received: from DS0PR11MB8230.namprd11.prod.outlook.com
 ([fe80::a73e:80f7:8871:99ed]) by DS0PR11MB8230.namprd11.prod.outlook.com
 ([fe80::a73e:80f7:8871:99ed%6]) with mapi id 15.20.8678.025; Fri, 25 Apr 2025
 06:28:19 +0000
Message-ID: <badce13d-bded-4e50-89f5-74538b2c44f7@intel.com>
Date: Fri, 25 Apr 2025 14:28:12 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: ipu6: Remove workaround for Meteor Lake ES2
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao
	<bingbu.cao@linux.intel.com>
CC: Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, <linux-media@vger.kernel.org>
References: <20250311084203.516205-1-hao.yao@intel.com>
 <f8fd0fd4-ca0c-12b5-acc6-ba846b2c9987@linux.intel.com>
 <aAomsUA01Sm5vo1x@kekkonen.localdomain>
 <fb923201-e49c-e61a-bbdf-e67744f2ea6c@linux.intel.com>
 <aAsgQjNEacme1NZU@kekkonen.localdomain>
Content-Language: en-US
From: Hao Yao <hao.yao@intel.com>
In-Reply-To: <aAsgQjNEacme1NZU@kekkonen.localdomain>
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
X-MS-TrafficTypeDiagnostic: DS0PR11MB8230:EE_|SA2PR11MB4842:EE_
X-MS-Office365-Filtering-Correlation-Id: 44ad7515-9506-4433-64d6-08dd83c25eb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aU9wS3VRcVB5a3JCVDZzUGExbDd4cFViRm1KT0VtOVdWdVJLSDV1K3d5K0dX?=
 =?utf-8?B?MXV1TnFPK2lIakNWaExXNTBIL1lHeU5waU5FL2k4b2JVZWhPZCtKMi9zUksz?=
 =?utf-8?B?di9mSkowNWlVaWdZUDlaSmZTNzRTTjlTdEdsbUJkVldrb09TbW5reGovT2ps?=
 =?utf-8?B?MGZnSWl0ekR4MmlheUNyOWtrMUhGRCt3NnlQL21FTXM0NGRhcXJGR2Q3VWdC?=
 =?utf-8?B?NVA5SGx1NWNQV1VGNmRHNTNGTE0vVFNMTU50OFZJcXlRblg3eURNN3hLclhH?=
 =?utf-8?B?ZjFYdG1zLzJ3bXdIbHRSVmhEbFlNbHZ0bWZzbjVUV1JnekYvRGFhbGNwUU5R?=
 =?utf-8?B?bThDbHV5THF0RlRIUnk3NFI1MzA5MUlYR2lyNkxYbHZRdnBENlVCN3Y5ZlNm?=
 =?utf-8?B?SzMwaEVUY1ZkZjg1YThBajN6SWFoQXErYWE4VWV6dGFKRXpyWWlnLy9SeEsx?=
 =?utf-8?B?eGVrcXhxM0RWcEVSbk85Nk1PZGc2bVZnYTg2WnBpLzN6cDZ0S0d5K2VLUnph?=
 =?utf-8?B?bEhudTgyeTAyU2lJTzc1U3lPR1o3VjhIV2VMalM4cEg4TENZWkU5SHB1T1Rq?=
 =?utf-8?B?RkNlOTFNZWNZTmQxYVpza3N0RXBFRmZiQ0IwZ3h2eERQaDVRWkZ3Qm5ob0o2?=
 =?utf-8?B?RmhiODAvTGJzeTRBdWJSMFNRTDkyV1JZTkl5QTFyWHhPa01peHhuZm8zb3Za?=
 =?utf-8?B?QzJuNFpldGU3TzZVNUVvYlo4NXdpSTlUSTI2T1VFYjhsMXQvMWZkY0ZNWmta?=
 =?utf-8?B?MmdNZjBVZEhsUzcrUklaTlFEMEtJSmR3K2JEMlY1b2lVTFlGR3VKVFVtVXVG?=
 =?utf-8?B?ZmJ3dGM0VHBwcTYrSE00bDE3TVBXL1dFNHE0SnRwV0lnTlc2bGNqSFJTQjJ4?=
 =?utf-8?B?M1lqSmZkTXBnWGtRNTU4NWN5eXYrOXpvZG16MHFtWHZPNGhPRjUyVUlSYnFt?=
 =?utf-8?B?ejVVK1BMWnlEOUNkU3lFNlhmTytiSGVabkphWE1hWUNsbDhaU3V2V3I2dTk0?=
 =?utf-8?B?VjhXY1JUMk1IK3dIMkJmLzdWcUtpRnZLTE52YkRaTFBnbWE3OGs4OHk3UDlG?=
 =?utf-8?B?YUQrQXl6UWxZTnFRemt3cWluY1NJNDFQYkkvT2w1NEo5KzYzL2VMK01VeFRD?=
 =?utf-8?B?cERGK1dvaUJYdEs4eEdBdjRuWGtZcTdRTjU2T3BFSzZTZXFud1BkUTJkalZs?=
 =?utf-8?B?cnBaOFZ4Z1BtOUNtVWYwbnZBMUhSRys2YTFNdXhGTUQwemJ3cHNhb05OYUhQ?=
 =?utf-8?B?emlhdFVkekV6VmF6OXBDcS9DcWJKQ1M3YWNFZktvTEpiWE0wMGZHSGt6Y0Rt?=
 =?utf-8?B?UzdHbVd3dVZLQVZSY0V0cVEzTWxoSFRUZktRWWwxQ2l1ZjVWRGpaMGlFUmFU?=
 =?utf-8?B?aTk4SXZ4dzhnb1BEOFlMcGtCYTdTaFc2eTFydW5NZGtwQkJTeXNNbjN4U2JI?=
 =?utf-8?B?ZkM5aExPWjBmSUx5bFdXanc2QjdRSUx1VFVnbE4vd2g0WDdiTVBHdXBQV3FB?=
 =?utf-8?B?amdyYXdZMXlQVDNJMTR0WVBPa05UU3pqNjB6cklsUVBBN2l0SHE0THB3ZjlM?=
 =?utf-8?B?c05CaHhTUmhHN05pVzZNNytQY244VjNHVHdsVnZBZDlIcXhnRGUydU9PN2JW?=
 =?utf-8?B?RUlZalBuZDRGdXNCaHFQd2czWk4xdDkyMWlhd29VaGFwSGVGNnh5UzRKSXBC?=
 =?utf-8?B?ZmFYa1JmZFpEdnF0S0Ztb3NYVGQxMUxKVktzdEg1ZzcvT1pFN3BCZUpWbmYy?=
 =?utf-8?B?RDd6WGdmWVppMmpmVExkcFNlc285aDVvWmMwMFZPbC8vVTZrQWZxSE95MjBX?=
 =?utf-8?B?U3RSKzV2aitMWTdlZnp4ZWdCVTFIcGxZdWRIQVlKbFdLSitBelVXSjJlcnlV?=
 =?utf-8?B?ZmY1ZFU1eDhzWVM5dWdSRGxJMFpyVDVOMTdrQXR4bU5nRmlabFFlT3lxeEJy?=
 =?utf-8?Q?Lk5pMzwxvq4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8230.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czdST1VCSjdaTWVpTXNjVlFxNHNiWWlWbFRlQ01KL0RWNjVJVVVSRWtONGdD?=
 =?utf-8?B?TFZ6SDNrcksyQ3JLeml2RSs0MlJWRW1Nb2lyb1BWYjVBemVOa0RQWnVyekJ4?=
 =?utf-8?B?d3EvY0lKSS83dzBQTG56SnlHOXpqWllKQ1JHcGNoM1MvWm8xa0taRDlTWTVm?=
 =?utf-8?B?T1NydlNWVmRMNExjM0dOODAvNkNhajE1OFpoRGQ5QXI5U0kxWkNIL1J5Q1NW?=
 =?utf-8?B?U29nb25FUUg5eUdObTg5cWU4U0U2YmdjbFN5RGdiODZzOTF6SGsyS1lTL1NO?=
 =?utf-8?B?TFRTb2JlVGtJRy9FL05hVUhlaE94cGl2R3JlQzZaRUpnV0J2SkhKMmp5Wkt2?=
 =?utf-8?B?c1ExbDFnRFdDaUw1Q0FRSXh1YnJubllEMGNhMkhaYVBXY01ueDgvZy94clZ4?=
 =?utf-8?B?ZGMyOUU2MmNSVHUyeUFTMGx1QzFzWWQ2czNpUTVEM3lwa2svbll6QVVLeXRV?=
 =?utf-8?B?MGc5TkNERUdBY20xclFsbTJqMXk1ZHpHSmlBMEZZV3NhL09pQXp5U1M5emdU?=
 =?utf-8?B?UmszSDROUkY3cjB0WFZpdEEwMlBCZ1o5WWxPR1YxNUFacTIxVXNtZXlDdE5G?=
 =?utf-8?B?djZUSlVTQVA3aFVWa2dUMzVpVzY0Z1RpT3cxSU1VaEpnSHhhaUpOeDVGazJY?=
 =?utf-8?B?c3R4RUFtZ2FZQXdWeEVhR0pzZkRDSHowRzZ5bHZwNHVKU012amI2MnZmQ0pE?=
 =?utf-8?B?ZGJLLzFSUE5uNVNoSUVDc25LTm5WOUI5OU1sZGJkMlUvUkJwSGdNVDhVNlFy?=
 =?utf-8?B?azVXY2IwUUpwZXRnSzhlUnlIdDVzNi9FNWZwL2tVQzJaZTduSFo2YTZLRHVq?=
 =?utf-8?B?M0NxakM4T2toOG9OcGkrdlQzL0JTV29lSytQd0xDcGtmbjN2bUF5YUNQTUYy?=
 =?utf-8?B?QnIrS1AzZzBDSXNKNzI3ZGx5Wk02UnFkMW5qWi93WnhrS2Z5VThYalF1TGlu?=
 =?utf-8?B?U2NqMU5QQ1Q5a09COVpMZWFCS3lPWFR5Vms0bWNHci96bHIxSklqUWU5dVVk?=
 =?utf-8?B?S3ZFeCtmVFJTOVJwOStTM1NaKzJiL0NUNmFlM2xRdVI0NmZzbE5ldEQ5VVp0?=
 =?utf-8?B?bTFGSHpZSjJGNlNtV3R3WEp2OExEY1RDZVVlb1JjWUxxM0J6OGRmU2o3VS9D?=
 =?utf-8?B?OFpOdk9DOEM1d2lteVFvaFRmZEVFUXZLb0JSU0pEbVpGak94TUh2a21POXZa?=
 =?utf-8?B?MjlmV1NXK0pnTnNteGZmYmdldGJGV1lTcFZrZlhLb2NtaVVoYy9NbVFzYWZm?=
 =?utf-8?B?b3hteis2dXZJKzJRSUhUMzMrNVp3NDVzdVVweWlzOUYvUlQwcjVwVk9FVjBJ?=
 =?utf-8?B?NXc5OUkweUw4bEpqYU1vMTRad1BOOUdwK3hsR1hpM25oaDJDb0FsbDJXaXpt?=
 =?utf-8?B?Rlp1ZHhESFhzZUcyNWNQbTQ3L3ZGdVR4S3RKalNnT3Vnc2JzZStQZ1JYMmFk?=
 =?utf-8?B?N1lJNUNOOGRGbC82b1hpckR2STdjYWhCdmhGRUR2MHRPU1RJMGNFUTBUSGlN?=
 =?utf-8?B?M3VoNkpaTGVITzhrMzJmRlpWN3lmL1h2R1NxL2U0d3RUcnhQaFJrUi9uOFdW?=
 =?utf-8?B?UnRVMWtqazVzVjFReDFhN1Q4QTRBUnJMWHhmaU9xMUE3WXJLakpVUHZnMjhy?=
 =?utf-8?B?aUxMa20rNGFhVDZlQ25ZVjNmN2w2eEpoNWhkQS91MUFXeXREcWNDKzYvTVhE?=
 =?utf-8?B?czlRMCtZS093eW4xcWNSWVBIWHluUG5ZN2gzcU9heEZqTmZQVGR1NVFJbWJU?=
 =?utf-8?B?c3g3bk9ldDY2RlgreTFxNVFDNzJoNlhUMXhxQTFKSmczdU12QVZYajJqcnl6?=
 =?utf-8?B?R2VFMUo3STljRjB4QjNuUEQ4MlE4YkhXMFdodUFEL1AxMFliTGxiUFJjVUkr?=
 =?utf-8?B?R09pZ0VaYitQVnVWWlRHNmlxR0tZUzFlaGRZUGlZRERwdUpiZUNIRUFQbDBt?=
 =?utf-8?B?enl1d3BIV2ZRblFPOC8wODJEZ1JnWnZmTmZGdnZjeC82ZWI0M2Jxa2h4NW5w?=
 =?utf-8?B?TVMyNmVLY3I1VVVMVkROZEk4ek9DWEt5aXdMT2M1UlQvdE5lK1owK3F6OVZR?=
 =?utf-8?B?RFgrOHBlbTZ5a0pnTEJCMlNJejFDa2xUYWVXTCtYVXdwUm5RNGJJQUxXSE1x?=
 =?utf-8?Q?mJyBxB9ntfEH6Wv8URNNomHMT?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 44ad7515-9506-4433-64d6-08dd83c25eb8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8230.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 06:28:19.5878
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CmKvCIqz4VtjLpyjSLZOTLG50h/KQa4jx/fDvbaz1bN3t7sj1094XIF35BL6mVT37pcLiwX15Zgo/F0fskkagw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4842
X-OriginatorOrg: intel.com

Hi Sakari, Bingbu,

On 2025/4/25 13:40, Sakari Ailus wrote:
> Hi Bingbu,
> 
> On Fri, Apr 25, 2025 at 11:05:54AM +0800, Bingbu Cao wrote:
>> Sakari,
>>
>> On 4/24/25 7:55 PM, Sakari Ailus wrote:
>>> Hi Bingbu,
>>>
>>> On Thu, Apr 24, 2025 at 12:18:06PM +0800, Bingbu Cao wrote:
>>>> Hao,
>>>>
>>>> On 3/11/25 4:41 PM, Hao Yao wrote:
>>>>> There was a hardware bug which need IPU6 driver to disable the ATS.
>>>>> This workaround is not needed anymore as the bug was fixed in
>>>>> hardware level.
>>>>>
>>>>
>>>> It is better to send v2 with fixes tag here:
>>>>
>>>> Fixes: 25fedc021985 ("media: intel/ipu6: add Intel IPU6 PCI device driver")
>>>
>>> Is this worth backporting? Nothing is broken because of this, is it?
>>
>> It is necessary. IPU6 on Raptor Lake share same device ID with
>> Meteor Lake, this workaround will break camera on Raptor Lake.
>>
>> And Meteor Lake ES2 is not used in product.
> 
> Ok, this should be visible in the commit message.
> 
> How about adding:
> 
> Additionally, Raptor Lake has the same IPU6 PCI ID and x86 stepping and but
> does have the bug. Removing the Meteor Lake workaround is also required for
> the driver to function on Raptor Lake.
> 
In fact it should be Arrow Lake. I will add below to next version:
---
  Additionally, Arrow Lake has the same IPU6 PCI ID and x86 stepping 

  but does not have the bug. Removing the Meteor Lake workaround is 

  also required for the driver to function on Arrow Lake. 

  

  Fixes: 25fedc021985 ("media: intel/ipu6: add Intel IPU6 PCI device 

  driver")
---

