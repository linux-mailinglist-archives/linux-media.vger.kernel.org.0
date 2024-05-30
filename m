Return-Path: <linux-media+bounces-12226-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A738D46EB
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 10:20:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE78C1F22B87
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 08:20:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3591C14C580;
	Thu, 30 May 2024 08:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ShObzsr9"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB3B143746
	for <linux-media@vger.kernel.org>; Thu, 30 May 2024 08:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717057207; cv=fail; b=uQ/CAEl3mBpqlHWpbsJo86XxT9bbWb8CjzIkkncI7wb70qV1f+IBt7A59GRdCOTLj1cOFko9Iv9399mLMG0atuqMSEPKZI/aQ3rzbG6zp3Jmpw6rdqaYi9F4K2jpSXNEY/jIqvHJVqi2lubA1JKELJF9kJFpoN8BX6XEbrRz+lc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717057207; c=relaxed/simple;
	bh=t3ytDTDSFneLT9NOwWD9w/5yWSQxXcs+Bu3cnnwsqeM=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=LzcC3n3GJTEpjf6cWBaVVXhZJ2hQZ2PwOR+rA3D44vUKT4GkfloJJ+g93bkJH53eGQ9i0mT9JtNE7GISrHPRIxntdmy4TTUiMc0bRv5Jl40nZJizUSrJjMusDEu2SeE1tVWsYy8wBqxBaD/zB62TiVhGMWxDO09dA7DYNSQR/XA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ShObzsr9; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717057205; x=1748593205;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t3ytDTDSFneLT9NOwWD9w/5yWSQxXcs+Bu3cnnwsqeM=;
  b=ShObzsr9ET4mf7/QTM363upf7GNdR8gtds8LiZtmcBniWYvv96NiTUuc
   kEHQuRI6F7bYfYNmhr7Zt2JiVU7FQ/vcagaQ4yx05Lq8wVcBYSkCkeFtp
   vhfvSuoaidillmtLYvC7K80xDoigvIDjp3pZHNxZAMpQVIQe3tBqGetOU
   77dvbI8mLY94MaHYXjQ0oLwrvQZvcIEQi7Hl8Hr22GH5n0+/lXGIbUTz5
   sztgAYhrjT1k3HiPYb9AnS6R7x/2m7zwfuNSj9xQuotylByfagm0HB3b3
   pjDW//WjqlPcxkekQHLaBiB5CG1fdC3Uafs+V9KPtyLXuSvVQekqWbX67
   Q==;
X-CSE-ConnectionGUID: OUeiGEmTTCyfb46lyrvqcw==
X-CSE-MsgGUID: MplxGhXWRK6ontV1U8zi/Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="13680228"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="13680228"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 01:20:05 -0700
X-CSE-ConnectionGUID: 8mjXons/R9eGwGG7xvv3AA==
X-CSE-MsgGUID: 6tJEXFugRfSGZe97ioWktQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="58912686"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 30 May 2024 01:20:04 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 30 May 2024 01:20:03 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 30 May 2024 01:20:03 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 30 May 2024 01:20:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e5fXcEEh9p1/FDF0HXx1zfDTxcfxP/jU8GXEAMEzyGd4mlu1SJvc/iTVJBooCChXVCjOKEayINXxizRPtmS7CksO2o5LwVBHG8UARLV+AnTsBdopA457CYEKpMICHF2Jbu6y8gXUUFUqzKWilfQ3uncIPfscQ4Itj3rHQNePNttqak7FU5/Bo78PTsYhLz3iJLAnf8AoUY39GgaNaPvImSxNncen6/CravPCK1Tm6WL7EhWLy4rZw64leqTJBX1UMhemVeg+T8QSAhxCrOrMYZdZByECs6OTW9qRC6/HUojUH1vGmKA915BOVVDvXlB4VwlxYQ0nWNjhMKXAxax3EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=APg8LE76ll7RQUbBsB4+Bp8URvp60H3RsD63hbzzUQY=;
 b=dXxJcx8ZW9HbpBwKIncQd1XgkG04m8v/Ty9j2cUunhjhi8VnPl3OrYhbopYJCZSqSKdH45jMH7KXy92ePfsIqpEFijovt+Qn/H4+vZFmeg247B8Jy5A2FqjKws95abNbB6Kx88QDgXA+BVQMXxqn0gbdn5UzGiaYT6P8cVbI5sfxyfc5hGPalumH2v+102lWdM/zngnH5y8bltHqkLuYill8g5LlyWRtuTGXMkZdbpgXA4n+kwiOjgXyAB/5yhfvXsm37CW9wWfH2yOit9DKEYAcDGHpH1JITUVXu2WXrH/YDNK6znj2VpW10Yh6il+4QWw25GlsSHFhcWm4Qok2Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by LV2PR11MB6070.namprd11.prod.outlook.com (2603:10b6:408:179::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Thu, 30 May
 2024 08:20:01 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%2]) with mapi id 15.20.7611.025; Thu, 30 May 2024
 08:20:01 +0000
Date: Thu, 30 May 2024 16:19:55 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-media@vger.kernel.org>,
	<oliver.sang@intel.com>
Subject: [sailus-media-tree:media-ref] [media]  448a5b20c8:
 BUG:kernel_NULL_pointer_dereference,address
Message-ID: <202405301650.8d02c0c8-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: TYCP286CA0103.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::16) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|LV2PR11MB6070:EE_
X-MS-Office365-Filtering-Correlation-Id: 55f5c9e0-a5da-4b41-968e-08dc80814d24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DYXneCjM6/Cm+lzxlXtLOEF8LEi9jZ1+x4njH3y0z/hVw55RzadzYcqQqt1T?=
 =?us-ascii?Q?D3sXq+TEpsW6iEGIeqSq7E2zAcoV7QaR24GYj8nYFI5EtHR7Gr3GpWEh7bx2?=
 =?us-ascii?Q?CCDEK9n3ob9aXDiCdCqRJParo3o5aC6f7cV0swbLTadWWUlSY4xZlY73c75g?=
 =?us-ascii?Q?n5NW/RxMl6ZcUSVOKandCifxZk3xVcXRs6Kq5eH5s+tXBbuCbBDHEjd9e3OA?=
 =?us-ascii?Q?KG1ipV68hFqEbw3fRmLEriMfxBTntaXqzd4iApU4w2Gt8Eb28FHepAve9ApD?=
 =?us-ascii?Q?3/elIqQd5q1wOMIGyRWXbu7N1IpZSCidZZ9WtiMw8FIHITdwBzLcIiJTYKCh?=
 =?us-ascii?Q?8IfpnFE28pvOcTKhqJYu+7rT5pcEhZRi/GH0RdAyvLGL/R1/d7A18Ezssq5J?=
 =?us-ascii?Q?4f/o5lssLUMG9pR7x1+zzxt6lrNbZO3LB+fvD8uCXZLEwUD6dLJNBU3tdN/3?=
 =?us-ascii?Q?Cr1MU7LTF/MxRKEPhF30gQwo89n/5p5zjyhcCtUvM+naDKlC9RBYLNM876Gh?=
 =?us-ascii?Q?vNJCHAGbl5Ee9kmW8RfjvCrXOQIVU+rhL23dXlj2IpSrCoplgZO78I0kmM6u?=
 =?us-ascii?Q?/fNaAfcyQ9uLX8XPrcTWd5HRqjsMHzsGWdEoDj8oVtITMhYCOsul4vwoN/Xo?=
 =?us-ascii?Q?Kvq7O3JolAjVEGM+BEO0JZjCIjh0d8bGW7a5Rcg0tikbQ8T2CzqgX0DKzJrA?=
 =?us-ascii?Q?0AmWPZFD0AWDDPB7237t9yhAiO2dS8uHzBS6QQtyPEZjCvzaPKWw23gUA4LA?=
 =?us-ascii?Q?P9aRa4cockp0a5q3XMKccqCMZXQxwB0hhbIk853iHX4siBSefsff1Xr5qowh?=
 =?us-ascii?Q?KuG2w+PFBu0v4CxKiGdaaY9bN1qeD1vPYDhgve0Kn1rXVvKaV4zOrTlVW3ac?=
 =?us-ascii?Q?oW+WMiWunB/CxK+mdXy73yICzadLksFjEQIb52ndODI2dNq2t7MGM0By8sqJ?=
 =?us-ascii?Q?tmvJbRV/2eRlzTyub9eeAjPpC+yNvTuVkSAq9fpifjtXNzfRwqqi0IwIVRbl?=
 =?us-ascii?Q?ABkb9hw4of5LpdSASszNHHcfsriQAgSxwRXTj+P22V1CpDoJU+DSj2XDoyK3?=
 =?us-ascii?Q?B9QvwG9ob6IEF0ROEovZJa6bjgQmJ4PojASE1RpFK3v5Fw2Qzgybm3WtAtOB?=
 =?us-ascii?Q?ktpWu05PacDJyAYZyZ4fOmVTMoEqLuceTp8T+nq13nPOxbdrGTfUClSnwb2R?=
 =?us-ascii?Q?ASCj5Gwac/AQDjGBZAispNthwGidRjU752+98hW4sWAIYPXnI2hjfIg3pu8?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bNqxnRHDzaPJ15hLtm2ysvq8irxMOz3Hg4IQrJY2EjGFzCdEHrr9k/NMfY1J?=
 =?us-ascii?Q?bZ5NJ4A2l6aSaV3wQ22seE9sK5W5K1+mnHn1T/A1QecMdLxFUm69Hrn7Ia9P?=
 =?us-ascii?Q?hkxEusnzAtMEoEUWUU/Yrr0nVRvNCkb30A6WNWj4tKXkd2lBreqcMYg4oIix?=
 =?us-ascii?Q?aCOJVjGGjycmrmxiisP+MHWVt0kopCqXV4MgdfH0n99oR1ib0WTl/s1CV0Vp?=
 =?us-ascii?Q?34Eq1qi5ZG4QyHoLWO89OqgzBZ9XHDS596OuSbJHLl0lGKXUbyd7Wc1e9lTU?=
 =?us-ascii?Q?0dqMAs3dGCm2997wqpjql4YKwntUORQ9JuKDxf3O+bHfSmOOvu6Y3euIZWu/?=
 =?us-ascii?Q?tyQN3L05GUDoA9I3TtngdJ8DN/wBVdHfTNqXYz/AD98pYV3tC4mFxoFtPlnw?=
 =?us-ascii?Q?fIYtNXN8xro5K0NiPDfbBjiU25GlAUgW4hZ2w+SB3BoyNyjMlTetDL3vw7n4?=
 =?us-ascii?Q?mCJuPtxOcs2ToCUGTuhvZw39uIfQF2PbjzSv2LN7KCQIgMRyShvNPjBgsO92?=
 =?us-ascii?Q?v5AEQQzpiVhi+AfLthris1YhlC/h7f6C7jNMvBdE3MmDwBLksWnTkuAUwjMz?=
 =?us-ascii?Q?1fy9S2bL1gCUOmgOCJmYm3/KIGBZro9+lMIrmHdE+98C9YrC86bTpHVOUsd9?=
 =?us-ascii?Q?HRN8/yHZse1Q/wA8Sm6gcThPrqow+Knt3CjGYWQPBpRMrWLK9ZcqTGdShdw2?=
 =?us-ascii?Q?3jKv5B1p9GouN/+KfeqzLVooIDStFKd6IksghQfvie/3HqbEgO0FW38bnQn3?=
 =?us-ascii?Q?la4L6yDsrIdGVIApz6uVRSnxM1rKgaK7f1C/ArRvvyHpwerY2ZDSHcdJslnQ?=
 =?us-ascii?Q?l3N+pOBPVny9cTaLpl4QyYQ+J3MM9u9/1HLlx6A4ZIroS+t+0guQkiPB4kcc?=
 =?us-ascii?Q?kjG0gUiDhPNJU6KVqi7fXa1wuZHmGme9UUyHjgZtWBOoKVlCAbLBjLIV2+e4?=
 =?us-ascii?Q?B8dkKjdpASPJdUyoDhjqYHfLtUZjTEHfOTTf9EQ1IwhaWdIneY+jFKu3yrN+?=
 =?us-ascii?Q?8hcirWSR3NvU1n3b7SmOX79wGRne9kHGy3RR1p6pMJfk/xYrdOI5n6a48klj?=
 =?us-ascii?Q?V1NEpqOF+9JRsTAK5UM3UoNmb4rGzAbpk0W3XMp3yUxc2QqRWxk0k6PTYfGq?=
 =?us-ascii?Q?D9O1sEVxSGb7DkJra7GXtHidyNc/jG79OGMgG98sYV9ScRsxD6+Gh+JpsRHF?=
 =?us-ascii?Q?1IzhLqGOXkLUlEv4fGgH98OgK1IAGI7IBeS6QqcbUMu5ZtfFfndD6dVAGgAR?=
 =?us-ascii?Q?oQmdBruO5Ir2pMei+28mmOxvOehRlmi/Jzqrr7IzFBweSiXlhzJIP89kvXAD?=
 =?us-ascii?Q?MuU82aT94EbslShdAhQrAKW5B5KuqC397ecsnTNAIhzNFgJgyGntJ9RyWT6T?=
 =?us-ascii?Q?leCW5l7kST5m5aMJvMQzqnB1TXFP1AliHuj6+xUVPPZZaBiTgAA3/EKoxFR1?=
 =?us-ascii?Q?HmD7UAdqDJxNdilTFnkW+FMNnB32HhIWJ7PvbwAAZzpARo03iZfkL4ijM2tM?=
 =?us-ascii?Q?GMBFXjHAuGp67ZUw/G5lsChFft5FRbTzH6YwwW+Jc80oBsViQMmleEDeZ9wS?=
 =?us-ascii?Q?rR7cc84L/MDm1Na2O7zgsE+6B9gOHDm9a+2S93d9IKYOS4n2atIVu7by9Wxn?=
 =?us-ascii?Q?KQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 55f5c9e0-a5da-4b41-968e-08dc80814d24
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2024 08:20:01.5559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QPFmS5dLKAd6sNNvDsMeEzw/Adg26qEZD0tIRmN7Q2ju6PHaDnX4PFRoGnvG9P0YfE42G20m0h7ycMZMMLtnsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6070
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG:kernel_NULL_pointer_dereference,address" on:

commit: 448a5b20c8ee3fb8ae739b0553d9cb923b9b73a0 ("media: v4l: Acquire a reference to the media device for every video device")
git://linuxtv.org/sailus/media_tree.git media-ref

in testcase: boot

compiler: clang-18
test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m 4G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+---------------------------------------------+------------+------------+
|                                             | c3e54bf550 | 448a5b20c8 |
+---------------------------------------------+------------+------------+
| boot_successes                              | 21         | 0          |
| boot_failures                               | 0          | 21         |
| BUG:kernel_NULL_pointer_dereference,address | 0          | 21         |
| Oops                                        | 0          | 21         |
| EIP:kobject_get                             | 0          | 21         |
| Kernel_panic-not_syncing:Fatal_exception    | 0          | 21         |
+---------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202405301650.8d02c0c8-lkp@intel.com


[   12.522155][    T1] BUG: kernel NULL pointer dereference, address: 00000028
[   12.523843][    T1] #PF: supervisor read access in kernel mode
[   12.525285][    T1] #PF: error_code(0x0000) - not-present page
[   12.525787][    T1] *pde = 00000000
[   12.525787][    T1] Oops: Oops: 0000 [#1] SMP
[   12.525787][    T1] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G                T  6.10.0-rc1-00018-g448a5b20c8ee #1
[   12.525787][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[ 12.525787][ T1] EIP: kobject_get (lib/kobject.c:639) 
[ 12.525787][ T1] Code: 64 a1 38 65 b3 c4 3b 45 f0 75 0a 89 f8 83 c4 1c 5e 5f 5b 5d c3 e8 9c f0 02 00 90 90 90 90 90 90 90 90 85 c0 74 3c 55 89 e5 56 <f6> 40 20 01 75 16 50 ff 30 68 33 12 09 c4 89 c6 e8 03 a8 43 fe 89
All code
========
   0:	64 a1 38 65 b3 c4 3b 	movabs %fs:0x75f0453bc4b36538,%eax
   7:	45 f0 75 
   a:	0a 89 f8 83 c4 1c    	or     0x1cc483f8(%rcx),%cl
  10:	5e                   	pop    %rsi
  11:	5f                   	pop    %rdi
  12:	5b                   	pop    %rbx
  13:	5d                   	pop    %rbp
  14:	c3                   	ret
  15:	e8 9c f0 02 00       	call   0x2f0b6
  1a:	90                   	nop
  1b:	90                   	nop
  1c:	90                   	nop
  1d:	90                   	nop
  1e:	90                   	nop
  1f:	90                   	nop
  20:	90                   	nop
  21:	90                   	nop
  22:	85 c0                	test   %eax,%eax
  24:	74 3c                	je     0x62
  26:	55                   	push   %rbp
  27:	89 e5                	mov    %esp,%ebp
  29:	56                   	push   %rsi
  2a:*	f6 40 20 01          	testb  $0x1,0x20(%rax)		<-- trapping instruction
  2e:	75 16                	jne    0x46
  30:	50                   	push   %rax
  31:	ff 30                	push   (%rax)
  33:	68 33 12 09 c4       	push   $0xffffffffc4091233
  38:	89 c6                	mov    %eax,%esi
  3a:	e8 03 a8 43 fe       	call   0xfffffffffe43a842
  3f:	89                   	.byte 0x89

Code starting with the faulting instruction
===========================================
   0:	f6 40 20 01          	testb  $0x1,0x20(%rax)
   4:	75 16                	jne    0x1c
   6:	50                   	push   %rax
   7:	ff 30                	push   (%rax)
   9:	68 33 12 09 c4       	push   $0xffffffffc4091233
   e:	89 c6                	mov    %eax,%esi
  10:	e8 03 a8 43 fe       	call   0xfffffffffe43a818
  15:	89                   	.byte 0x89
[   12.525787][    T1] EAX: 00000008 EBX: c572756c ECX: ec69d004 EDX: 00000001
[   12.525787][    T1] ESI: 00000003 EDI: c5727504 EBP: c5b41bd4 ESP: c5b41bd0
[   12.525787][    T1] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010202
[   12.525787][    T1] CR0: 80050033 CR2: 00000028 CR3: 04c94000 CR4: 00040690
[   12.525787][    T1] Call Trace:
[ 12.525787][ T1] ? __die_body (arch/x86/kernel/dumpstack.c:478 arch/x86/kernel/dumpstack.c:420) 
[ 12.525787][ T1] ? __die (arch/x86/kernel/dumpstack.c:434) 
[ 12.525787][ T1] ? page_fault_oops (arch/x86/mm/fault.c:711) 
[ 12.525787][ T1] ? kernelmode_fixup_or_oops (arch/x86/mm/fault.c:738) 
[ 12.525787][ T1] ? __bad_area_nosemaphore (arch/x86/mm/fault.c:785) 
[ 12.525787][ T1] ? bad_area_nosemaphore (arch/x86/mm/fault.c:834) 
[ 12.525787][ T1] ? do_user_addr_fault (arch/x86/mm/fault.c:?) 
[ 12.525787][ T1] ? exc_page_fault (arch/x86/include/asm/irqflags.h:19 arch/x86/include/asm/irqflags.h:67 arch/x86/include/asm/irqflags.h:127 arch/x86/mm/fault.c:1489 arch/x86/mm/fault.c:1539) 
[ 12.525787][ T1] ? pvclock_clocksource_read_nowd (arch/x86/mm/fault.c:1494) 
[ 12.525787][ T1] ? handle_exception (arch/x86/entry/entry_32.S:1047) 
[ 12.525787][ T1] ? pvclock_clocksource_read_nowd (arch/x86/mm/fault.c:1494) 
[ 12.525787][ T1] ? kobject_get (lib/kobject.c:639) 
[ 12.525787][ T1] ? pvclock_clocksource_read_nowd (arch/x86/mm/fault.c:1494) 
[ 12.525787][ T1] ? kobject_get (lib/kobject.c:639) 
[ 12.525787][ T1] get_device (drivers/base/core.c:?) 
[ 12.525787][ T1] __video_register_device (include/media/media-device.h:234 include/asm-generic/bitops/instrumented-atomic.h:29 drivers/media/v4l2-core/v4l2-dev.c:1078) 
[ 12.525787][ T1] fm_v4l2_init_video_device (include/media/v4l2-dev.h:383 drivers/media/radio/wl128x/fmdrv_v4l2.c:539) 
[ 12.525787][ T1] fm_drv_init (drivers/media/radio/wl128x/fmdrv_common.c:1638) 
[ 12.525787][ T1] do_one_initcall (init/main.c:1267) 
[ 12.525787][ T1] ? timbradio_platform_driver_init (drivers/media/radio/wl128x/fmdrv_common.c:1620) 
[ 12.525787][ T1] ? __lock_acquire (kernel/locking/lockdep.c:4797) 
[ 12.525787][ T1] ? kvm_sched_clock_read (arch/x86/kernel/kvmclock.c:91) 
[ 12.525787][ T1] ? sched_clock_noinstr (arch/x86/kernel/tsc.c:266) 
[ 12.525787][ T1] ? local_clock_noinstr (kernel/sched/build_utility.c:269 kernel/sched/clock.c:306) 
[ 12.525787][ T1] ? local_clock (arch/x86/include/asm/preempt.h:84 kernel/sched/clock.c:316) 
[ 12.525787][ T1] ? ktime_get (kernel/time/timekeeping.c:848 kernel/time/timekeeping.c:848) 
[ 12.525787][ T1] ? ktime_get (kernel/time/timekeeping.c:195 kernel/time/timekeeping.c:395 kernel/time/timekeeping.c:403 kernel/time/timekeeping.c:850) 
[ 12.525787][ T1] ? sched_balance_trigger (kernel/sched/fair.c:11840) 
[ 12.525787][ T1] ? clockevents_program_event (kernel/time/clockevents.c:336) 
[ 12.525787][ T1] ? update_process_times (kernel/time/timer.c:2493) 
[ 12.525787][ T1] ? tick_handle_periodic (kernel/time/tick-common.c:120) 
[ 12.525787][ T1] ? trace_hardirqs_on (kernel/trace/trace_preemptirq.c:63) 
[ 12.525787][ T1] ? irqentry_exit (kernel/entry/common.c:?) 
[ 12.525787][ T1] ? sysvec_call_function_single (arch/x86/kernel/apic/apic.c:1043) 
[ 12.525787][ T1] ? sysvec_apic_timer_interrupt (arch/x86/kernel/apic/apic.c:1043) 
[ 12.525787][ T1] ? handle_exception (arch/x86/entry/entry_32.S:1047) 
[ 12.525787][ T1] ? rq_offline_rt (kernel/sched/rt.c:756 kernel/sched/rt.c:2444) 
[ 12.525787][ T1] ? strlen (arch/x86/lib/string_32.c:?) 
[ 12.525787][ T1] ? next_arg (lib/cmdline.c:273) 
[ 12.525787][ T1] ? do_initcall_level (init/main.c:1313) 
[ 12.525787][ T1] ? parse_args (kernel/params.c:153) 
[ 12.525787][ T1] do_initcall_level (init/main.c:1328) 
[ 12.525787][ T1] ? rest_init (init/main.c:1459) 
[ 12.525787][ T1] do_initcalls (init/main.c:1342) 
[ 12.525787][ T1] ? rest_init (init/main.c:1459) 
[ 12.525787][ T1] do_basic_setup (init/main.c:1365) 
[ 12.525787][ T1] kernel_init_freeable (init/main.c:1580) 
[ 12.525787][ T1] kernel_init (init/main.c:1469) 
[ 12.525787][ T1] ret_from_fork (arch/x86/kernel/process.c:153) 
[ 12.525787][ T1] ret_from_fork_asm (arch/x86/entry/entry_32.S:737) 
[ 12.525787][ T1] entry_INT80_32 (arch/x86/entry/entry_32.S:944) 
[   12.525787][    T1] Modules linked in:
[   12.525787][    T1] CR2: 0000000000000028
[   12.525787][    T1] ---[ end trace 0000000000000000 ]---
[ 12.525787][ T1] EIP: kobject_get (lib/kobject.c:639) 
[ 12.525787][ T1] Code: 64 a1 38 65 b3 c4 3b 45 f0 75 0a 89 f8 83 c4 1c 5e 5f 5b 5d c3 e8 9c f0 02 00 90 90 90 90 90 90 90 90 85 c0 74 3c 55 89 e5 56 <f6> 40 20 01 75 16 50 ff 30 68 33 12 09 c4 89 c6 e8 03 a8 43 fe 89
All code
========
   0:	64 a1 38 65 b3 c4 3b 	movabs %fs:0x75f0453bc4b36538,%eax
   7:	45 f0 75 
   a:	0a 89 f8 83 c4 1c    	or     0x1cc483f8(%rcx),%cl
  10:	5e                   	pop    %rsi
  11:	5f                   	pop    %rdi
  12:	5b                   	pop    %rbx
  13:	5d                   	pop    %rbp
  14:	c3                   	ret
  15:	e8 9c f0 02 00       	call   0x2f0b6
  1a:	90                   	nop
  1b:	90                   	nop
  1c:	90                   	nop
  1d:	90                   	nop
  1e:	90                   	nop
  1f:	90                   	nop
  20:	90                   	nop
  21:	90                   	nop
  22:	85 c0                	test   %eax,%eax
  24:	74 3c                	je     0x62
  26:	55                   	push   %rbp
  27:	89 e5                	mov    %esp,%ebp
  29:	56                   	push   %rsi
  2a:*	f6 40 20 01          	testb  $0x1,0x20(%rax)		<-- trapping instruction
  2e:	75 16                	jne    0x46
  30:	50                   	push   %rax
  31:	ff 30                	push   (%rax)
  33:	68 33 12 09 c4       	push   $0xffffffffc4091233
  38:	89 c6                	mov    %eax,%esi
  3a:	e8 03 a8 43 fe       	call   0xfffffffffe43a842
  3f:	89                   	.byte 0x89

Code starting with the faulting instruction
===========================================
   0:	f6 40 20 01          	testb  $0x1,0x20(%rax)
   4:	75 16                	jne    0x1c
   6:	50                   	push   %rax
   7:	ff 30                	push   (%rax)
   9:	68 33 12 09 c4       	push   $0xffffffffc4091233
   e:	89 c6                	mov    %eax,%esi
  10:	e8 03 a8 43 fe       	call   0xfffffffffe43a818
  15:	89                   	.byte 0x89


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240530/202405301650.8d02c0c8-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


