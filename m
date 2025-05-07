Return-Path: <linux-media+bounces-31889-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B070AAD578
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 07:48:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A43FB4E1A97
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 05:48:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A72971F460B;
	Wed,  7 May 2025 05:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d9OH0T6e"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9525D1DE4EF
	for <linux-media@vger.kernel.org>; Wed,  7 May 2025 05:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746596909; cv=fail; b=qsVNCRoe/e1Db0gzc3iFXdOT7BPXC7hLTcBvBmoYtn2HG92lyhDWeoeIYVTB95rKMoOB+EAmvH5Sh1ZX7+l1mlsFI5L7cfZZPqeGG7J5plxazBkniEhXJOpHyjxNkDsNBF/ZfYF97EUWSNx3zHRLbcy4ByRIhOuB2UKko8chj8M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746596909; c=relaxed/simple;
	bh=XjZkOVdLEPOC2NTREGsGbw3r6D5qPAHk5Wc4Y0VSnGo=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=XGvikmpqLoQuqb4J/3LyLNNNYS/qs2JDhlo6ddqkU6gY4/EkALQI2Hgcu+EAE9HkQZ6rcrCPZNbhmthANhVY9SO5n34yFFKTmVZqCMLCXvUnA344U8nwUvvFYaiTUvmKUrB7R9TvdQHeUikMsfKiW+DXzeIj7wVwQXbCTauUPb0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d9OH0T6e; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746596908; x=1778132908;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XjZkOVdLEPOC2NTREGsGbw3r6D5qPAHk5Wc4Y0VSnGo=;
  b=d9OH0T6e5afjwSuMUaRLvnmNebLohJoB2YCvwph09ypGndWyTkxgKwUu
   Ydy8Jz+e13uYWYmzSkevlB3s6DtMRbjci4m2NGYg7A4GLce7PpgRG0mOt
   M9dJtn9raFm65UNh9WIl+xa/AfUj7EW3QnpyziK4SUDuOhTdfIeYUKQdJ
   bNk7lomyYlW6f0QmAlfAKFEyrSuA0JRHyqyV18ktI8QAWfTyjOy98Pluh
   2QFTaKrMLT5V+n86R9lFeQxTn4uJTGsRnGkhVzXGryJZDDnsNOWMfub3u
   ovhwpbFEpYd+R3QwnmiwmPFdbQqklWA2SPtcIb9DMdC7CdZ42+yH+CDgu
   g==;
X-CSE-ConnectionGUID: xowGX8KzSxSZKkpGUAN0uw==
X-CSE-MsgGUID: rdXqMgAJSGa/+LdDTf1a+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="52120225"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="52120225"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 22:48:27 -0700
X-CSE-ConnectionGUID: +VP53x/XQJeIq7ruTO2R0Q==
X-CSE-MsgGUID: dTxSD9vJRgSvUU47XV2kdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="136863573"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 22:48:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 6 May 2025 22:48:26 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 6 May 2025 22:48:26 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 6 May 2025 22:48:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mFRfx5iKTCpar/EMsD1Vmnt5M84BmT1R2PKrzZp+qHd0HF+OXFy/9bAW2s1GXCorcYKl7zIdDeiOT/TNxlUBFfsdPbtx/2sepSNaNyoQWU/8+ONmbXivqf7w8hrvW7Lf3dA3HJhOFARletfwR8ULHdRUHM0f94cXnkM7KEiIqr2cTS9Iny4Ey9zVXO3SRI7Y32fpqiUlRwsPyihCl51ipCPvCByCbI1CuHmXOzKJcjCQ5sjiOp2iPq0HT/In3eac/OMQR2oFeLFOpe4To2uAyWB/FUftxsu2f8hpjVHLlJNLv52HjTm5gphNhTJ8yQTxucjzAD6jrlnwOMZ9eqz7WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pOlEnJHdt8GNkocm53XM3W49AR7Syt44bOh/3jIy8ww=;
 b=UeLm3PEm3gLzTDJcKfaV54qUMTPNy4yt9ZiQNNEaz+LK4bUJ7t4PzzlkuFacNOCvsItcaKIJXQZRds0I6d4SSRP8x0db0luaXUVcXCJHiWWjXkgsK+KyES0wssWno52GzlVapcpXvV09DTIEollqIAWXqnmuzzF+GjB7ELKQFVYdc7xB2YXxDVOERf9hhm0BOKtjcFLDkIjAu+zE7Lnt7mh2CpuUkNULs3eaTho7r530pJMi10164x4QCCxUK7WGTaxYX27wh4Yl+tp7+k1R+VMPToPQtSTf5IN0FqwN7akfpit5iHGiBRLoxv6ydL+usjXC1GLUndGseyE+3s1jGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
 by SN7PR11MB7489.namprd11.prod.outlook.com (2603:10b6:806:342::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Wed, 7 May
 2025 05:47:36 +0000
Received: from PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a]) by PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a%6]) with mapi id 15.20.8699.012; Wed, 7 May 2025
 05:47:36 +0000
Date: Wed, 7 May 2025 13:47:28 +0800
From: kernel test robot <lkp@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>,
	<linux-media@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>
Subject: [linux-next:master 2050/8679] Warning:
 drivers/gpu/drm/imagination/pvr_mmu.c:233 Excess struct member 'pvr_dev'
 description in 'pvr_mmu_backing_page'
Message-ID: <aBrz8NAWXDmUnkdI@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0165.apcprd04.prod.outlook.com (2603:1096:4::27)
 To PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5674:EE_|SN7PR11MB7489:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a37fc4e-77a6-4504-5866-08dd8d2aab70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Y4cYdLFjiUjwuokYnAj9CUjSDphZtkMPO09kYlsMUc7NiTvDF8tt6JUsK9Hm?=
 =?us-ascii?Q?h7gosUOAOFWUXPdXrX9iyRJtUQUU2TtONeIDDQr1XC6ex/z60NIGzrf0rOQK?=
 =?us-ascii?Q?kAD6I1kzqFFwd7oBNIyAibgCs1Oc8ueXltx0OXQbvH1xSkbRUge4Mtj5x++7?=
 =?us-ascii?Q?Os9tn1Vwf8RayRgr0ZvSV1/zmgEG6PoyaH3h9OgRg2BVemP/tkoh+n2jkz3w?=
 =?us-ascii?Q?dv8D8u4ggzUsrhRQUY/je97wMJdafTo+gXuWEF7iWrCTS3yoM3CBQq0ecS30?=
 =?us-ascii?Q?1nqWa4ScevdFxtMgZ8UhQrQUnzjzinEeq1Hpp5d8agTmbo1T4p08v1Bkyzpb?=
 =?us-ascii?Q?BvdX6ax20jVoo7fEHMS7R/K2vEbPwH9TKDuKRHSZ6dFCJ015N95TaeuvvPIf?=
 =?us-ascii?Q?4GRk9M1eKUT+qx/8w9km0eY9idtHKMjr7c9LaGswuoczthXzMnIt2N2EP1Th?=
 =?us-ascii?Q?i94aZHpR+d0/DGRKFI8XpVVPxFvFuDTi5YF8vwnxmFZJZ40voTSjJtny+1sm?=
 =?us-ascii?Q?+pKMgWGmChLE+MqK4xo++z3wKEeBK1M6o2w2CgrMLflfjlzGnw0hLUI0TU7o?=
 =?us-ascii?Q?6WY7CC4oAPkawRxO0ZoiRcgKErXOyYgJF1d/y+Ldk/719v+63UafxfqngANu?=
 =?us-ascii?Q?Y4r5joKAnEzAKiTxgsO36fsVlj/ak8nw+eQN73whRNsFTp888fAMZLRgshDV?=
 =?us-ascii?Q?joTyYzRWvmt4lpuZyJplr4X8Zi6MYvYp2ntQgtqzISAeJ3k6/GDUqSWF+prf?=
 =?us-ascii?Q?5o/7DEg4+EvAeNWpEqQcWB5YHMLxCiIGsKU5HGiwK2TYTr0TTmWCdO5ph5Hv?=
 =?us-ascii?Q?kHFsSwCIzgh5FXMbUmrekR5ihPRFtRokRYGI2tCbt+UozuR4GC5FkpaF/TL1?=
 =?us-ascii?Q?/ueukA4eUFAOPUdPIheDBKx1PitwP8i51fmzcVarKK0sbGe6chc+tWPFBkYf?=
 =?us-ascii?Q?7IbN6TKAHiiMcCpPAJ65N5WplxtH4dgnBECxoNDq+FsY1LYvVZFx4+MrvNHd?=
 =?us-ascii?Q?NAcw6GEBwsaqQ/9wjNSa8k90MyxTyvk7KqiZISCXOhf3BT5sPZ250yNN+HZt?=
 =?us-ascii?Q?7U/1ZtdjeBgqqrtBeJeWOEnAMZUN0Y+zJQ5Whqz/1o97xxz5uvek3XNG4vxt?=
 =?us-ascii?Q?TP81GgyvWhiG+mkgLXKrtqPo3em/Jd1xC4Ji38T+zvxvRmwTHwcNEG4/ElWx?=
 =?us-ascii?Q?K4T/CXuATalnVTBD/+Uy5F4eyRabvRtXQcVSITnkaMSZXojOeWexFPuRGKYY?=
 =?us-ascii?Q?xrPDGsN65mThEJdQZqNTT+YMRIKe0Lc8RprAkFqrQ098YUWEbwO5k148EYiE?=
 =?us-ascii?Q?sALWh4EsMYYuI7X8gLABZK9iJ5TgP2iN+tZR8tRWgCuwlg6M/g+DI1o1jc2m?=
 =?us-ascii?Q?voJxANnJWL+FDls8gLcOihafWDk5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5674.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HpcV81O+s+fZeHrVH5QqI+gJulr6lw9VPU7jjg+ni0Dc9gaJ+Zqc4Mdm20Va?=
 =?us-ascii?Q?VXaVrs/Js5MBWc0mivJs7Zq65+ikkgly24IX1USXYNHAR5ILbjPfd9Hed+49?=
 =?us-ascii?Q?994d6WxA2uqwGWl61peDjJqj0rOl8UNEXuOCaTnpFoNpeDj8SlsIFBMPT6mO?=
 =?us-ascii?Q?0zD3GeyZdgNskV0h89pKC6NMcpvEnPyqgp4E7ptSdfpIFri3Fkk8cpZAPSf6?=
 =?us-ascii?Q?g1+rzqoLEbkxoCGz2v9//gDZA+uZzZMEC27ydEFbNRwKU+PheSD5/UVq8KWS?=
 =?us-ascii?Q?BzqjUD4LXzX5QgGmXV9U9YfuBUpGgapgmSlzMc7uZlp/bdi9bLCbY42qktXc?=
 =?us-ascii?Q?qpOMfeMBgFFqCDdL1wsr5VqtCjMwdlz6Jo5muwpv9Cp268f1ytGu22LtM2Ae?=
 =?us-ascii?Q?Rxr8Evc6TQmAvZQuEKgW9GNaY2YuaPBEfU3Rz1WPxHLBTTK7BV1OhUexF8fc?=
 =?us-ascii?Q?b8gXIXIt/+mZX1+m/HtVqS+YFHjo4WW6gAyhCkDrzRYapYfxAeS0Tb4XYh8q?=
 =?us-ascii?Q?GnTpDUoyXsI72MRUtNVJfhAW3K7mH8a3FumZMapIqrOTyrIN78cDApTEl73j?=
 =?us-ascii?Q?XE2ihQsUX7dUThRCOPQu7dAKYfvcH6lWSXPQ811LAUAqN2FIH7s9u4M5TbP5?=
 =?us-ascii?Q?bMjVyvh1jg9bi4yMH2rPotrRl5SDiX6gsvfMSybkGO18/WWNtJ1m23ehJ1p8?=
 =?us-ascii?Q?Mj+2+Z8Bai/AGv/lcYMEz1hLJpEMF/1yH/m7f0eLteD+S9Jp1NG/5JReCQrE?=
 =?us-ascii?Q?q88nfYaNBLRNQRn1q4zFEZShKgbNkqKuu5eIHlYGwKt4u+lUXZdeOtBIxbY8?=
 =?us-ascii?Q?dWDLgQV9IOTKzGUvqxD1PH2Qm06X+yccQoqVhTnTnlPBU93CAdeYFkvDjIG3?=
 =?us-ascii?Q?c4y2m57JPxDxu11iapg7CW8ua0vfB9Ji+6Kxi/SE/csjluQpabwiGmkfpBq5?=
 =?us-ascii?Q?XLuqmnh3oy/UZ8JblKdFvrL/1cDK/WtHpuUJpS0wHIfoAdFaZJb1pmyxF4/M?=
 =?us-ascii?Q?PQQrflDk5J6FUIitHwx1L5hYMxXCe0BhIMArkRS/jx4Vz2joeiZUQ2urfFo/?=
 =?us-ascii?Q?3/W+Uc/9LghsNfY73tcYsKF4yN6z0UemhUVTvSJHTSvuiNr7D4KP/MsKUoCE?=
 =?us-ascii?Q?QcxE8SL1+/czqiJc5xBduvhQ5Jh0JZgzecZlPOi9jzeEk2qtXNJ0PtFJ1RzD?=
 =?us-ascii?Q?AikRzxLFGVxBqk93SGcHO0g/rJjs2cEgRQtv0/0Cx71miP6LyonASRh4SBkf?=
 =?us-ascii?Q?+n94EYWz6BEV1Jyizz3BeoEMNjLZsRHWhX/x5sLPPYGR+EslrTGFy65GYrAX?=
 =?us-ascii?Q?W7N4DUySjpoUirMf9P5wdd4z6ZdPBaIPwCQtF1DrSra0D64qcoV9PB5Sw9Ui?=
 =?us-ascii?Q?+8wXUg0A/Fz74kGA7GzaIi+fW3cY08/mWcMjy9npYEQryTcOa9+gCLh64B19?=
 =?us-ascii?Q?CaUiqgsprpDFbDwdFO6s/gjOTWqNfWSdbxhJIYjlVQyVMbetSO+F5l77aO9b?=
 =?us-ascii?Q?2OZ2h3dJZE5qACiE02odIYyTzgqBxo+p0r2eX4DNNfBXn4OuH5JS3UBcv1uY?=
 =?us-ascii?Q?eOt9oL/svs1L/JTgVLUdJu1RTS9ZqZOXeCS0+g2BjedZURdIKyLUJ+dIdaPv?=
 =?us-ascii?Q?jA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a37fc4e-77a6-4504-5866-08dd8d2aab70
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5674.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 05:47:36.4138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xKVDPjD8Wp9gG6zCjSdmJ5EoYwZsnmA2BDEmJeOPeMDARtkhZ+5elM3KrK9eDnRvo2rRvBvoNjuRmVyL9XF9XA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7489
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0a00723f4c2d0b273edd0737f236f103164a08eb
commit: fc862949a35aa4d5e92a10c64c620cde350bd511 [2050/8679] scripts/kernel-doc: switch to use kernel-doc.py
:::::: branch date: 20 hours ago
:::::: commit date: 4 weeks ago
config: arm64-randconfig-001-20250410 (https://download.01.org/0day-ci/archive/20250507/202505071357.k14EEQl9-lkp@intel.com/config)
compiler: clang version 19.1.1 (https://github.com/llvm/llvm-project d401987fe349a87c53fe25829215b080b70c0c1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071357.k14EEQl9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505071357.k14EEQl9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/imagination/pvr_mmu.c:233 Excess struct member 'pvr_dev' description in 'pvr_mmu_backing_page'
>> Warning: drivers/gpu/drm/imagination/pvr_mmu.c:1456 Excess struct member 'sgt' description in 'pvr_mmu_op_context'
>> Warning: drivers/gpu/drm/imagination/pvr_mmu.c:1456 Excess struct member 'sgt_offset' description in 'pvr_mmu_op_context'
>> Warning: drivers/gpu/drm/imagination/pvr_mmu.c:1456 Excess struct member 'l1_prealloc_tables' description in 'pvr_mmu_op_context'
>> Warning: drivers/gpu/drm/imagination/pvr_mmu.c:1456 Excess struct member 'l0_prealloc_tables' description in 'pvr_mmu_op_context'
>> Warning: drivers/gpu/drm/imagination/pvr_mmu.c:1456 Excess struct member 'l1_free_tables' description in 'pvr_mmu_op_context'
>> Warning: drivers/gpu/drm/imagination/pvr_mmu.c:1456 Excess struct member 'l0_free_tables' description in 'pvr_mmu_op_context'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


