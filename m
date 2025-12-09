Return-Path: <linux-media+bounces-48487-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED8ECB0A04
	for <lists+linux-media@lfdr.de>; Tue, 09 Dec 2025 17:50:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 87AC930C78B5
	for <lists+linux-media@lfdr.de>; Tue,  9 Dec 2025 16:45:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54F56329E48;
	Tue,  9 Dec 2025 16:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bxk3ukcJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A4A329C52;
	Tue,  9 Dec 2025 16:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765298732; cv=fail; b=hsWMlQ4t1Jmp047VntUg2wnGnm/Yae1Ffpz8N/vefLnq0xXehi/FvlO9QkhLRQwJzril26+lNKyyzopQh//+JuVKa0ZbHTFbVyxJ7TYZY9mbcLZ95tcx0/uvc95OFYT64FDavzaKt78BX1CbnKL4CiYAAT5x6MwN2X7zBLWEnnY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765298732; c=relaxed/simple;
	bh=kAdWmWQQP3hMrF52YdcWKFcurnVBPFoh8H5mFlkQb48=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Oa2/mWiXvAlYHDzjnB+vEKWb7xUVbW5L/Oam2T3Ve0RxxAysSnMN0ySrs/J1mvJDjW9oARjv5jaVaaqN4Lc4diRPReEbRajydv/h/s0G/8X9AwvjnvBXm+juhyXE0obdceQJfDnfdaC/ZUFNk3ujueY7NxUE7MRDZDhCLmXJ8eA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bxk3ukcJ; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765298731; x=1796834731;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=kAdWmWQQP3hMrF52YdcWKFcurnVBPFoh8H5mFlkQb48=;
  b=Bxk3ukcJ8W5i669pcKFJ74E4ZMU6QyoqFVJ8/rd5kVOk+AP/0+tQprzz
   2leQbrprqhAeT4kP0KmCDcGp6X4L4xJOuQ5ee+AiDVjqATGM8MgVod49q
   i47XMYi3Uu3MiVLWqf+C1nyeTc++Pn/JL23sYDC62rgyPWBQKdPlQmtGf
   Sl1fYXE3F8aG/8JCQdvpFL65p6SSn08pGMeswbHVnw1nuaKtYPjMeeLRC
   2vPELYtPp3upLhdKk+LI4lKZioP2ntbqMfyvDDSO96849d00jvv2wmpwi
   ApKg4rr/I3jEoWObJIe6hWoa+FCVG51WGsN1vURr8yNswuj/0NAWiXWSV
   Q==;
X-CSE-ConnectionGUID: KjYVdpmJQ2i4RTS4kuFy5Q==
X-CSE-MsgGUID: 6YHfotRYSpCEkxWKuyowHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="78623684"
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; 
   d="scan'208";a="78623684"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 08:45:30 -0800
X-CSE-ConnectionGUID: 6kcpE3ycTwqzBZegLswwvw==
X-CSE-MsgGUID: a3ZAhbDiTV+sJCeAqYslng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; 
   d="scan'208";a="200750704"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 08:45:30 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 08:45:29 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 9 Dec 2025 08:45:29 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.68) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 08:45:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UdGXvN7km6ThDt0Ai3peumf3W6O2ROYPuc69PQZWcsmKZ6+50NKogghuEfQJOY+UQzvgyYG/ASKfCWtKBVI6hqp1l8lrfyt2HhqjEFjfpdU/SemiIrD3rVw4A2XbTK/Jf4U0kcWmO8fN+IFXop80Ql7GIDfpnJ9iHzxPastRsAJq526+aOxrwNBKHZJ/Lj0w4FQIw/Jo905QxkERL9YC9xIRPUcOwcVd6XWbLLb9kvEpo3beGHJYUUWWDOFzxbAd52fnW+6eecbAKRX+p4pyPX8lKJy50FWlmH30i+ZMEOIZ9PQ2gzoY4G9QyAFcuagah9UzFL3bJkf6mY4NtR2XDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ZXOtulhs+4+CHUr0BOQvAiXIBuX9hCiYBKrcg4wi7g=;
 b=icBlZsNGmjHj8uZs/n0c8d2ydkjuFbKal5WmfBFAJzH9OF01GwfOvZFXVkCpD/ZzzzgAHsiy4Yp109Bx/zX0gqvL4ve2tjpPA5uOZnHZuBqFQd3FxqhagBuvHF1vIa/zLJsh94yaNY3kCbycYqLfpcuMZ65EaoeHQ9tb0ozBt1kIJs8DFMAGzVLICZ7pUFXfGkMLoKFab5us+rU9NQdVo/d728ayABPRcgdFsFb3++OSgJOKsKuuZHdUN5+lLn7r+07576iVKq5jZDSJCOqL/zrhXkujfwkiIqbzG+LGkBa6CePyhMHelKe7vuMzxIF1KkCvSZlkBbu8ZZIhauYlOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by MW5PR11MB5761.namprd11.prod.outlook.com (2603:10b6:303:195::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.11; Tue, 9 Dec
 2025 16:45:18 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361%7]) with mapi id 15.20.9412.005; Tue, 9 Dec 2025
 16:45:17 +0000
Date: Tue, 9 Dec 2025 08:45:14 -0800
From: "Luck, Tony" <tony.luck@intel.com>
To: Daniel Gomez <da.gomez@kernel.org>, Eric Biggers <ebiggers@kernel.org>
CC: Kees Cook <kees@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, "Rusty
 Russell" <rusty@rustcorp.com.au>, Petr Pavlu <petr.pavlu@suse.com>, "Sami
 Tolvanen" <samitolvanen@google.com>, "linux-modules@vger.kernel.org"
	<linux-modules@vger.kernel.org>, Malcolm Priestley <tvboxspy@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
	<hverkuil@kernel.org>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-hardening@vger.kernel.org"
	<linux-hardening@vger.kernel.org>
Subject: Re: [PATCH 3/3] module: Add compile-time check for embedded NUL
 characters
Message-ID: <aThSGiKwJRYOB6kx@agluck-desk3>
References: <20251008033844.work.801-kees@kernel.org>
 <20251008035938.838263-3-kees@kernel.org>
 <aTc9s210am0YqMV4@agluck-desk3>
 <20251209001139.GA7982@quark>
 <d3dd8fc8-ab46-4cf1-87a9-0324685ba2e0@kernel.org>
 <SJ1PR11MB6083C6D97484ED4E4710268EFCA3A@SJ1PR11MB6083.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB6083C6D97484ED4E4710268EFCA3A@SJ1PR11MB6083.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR03CA0279.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::14) To SJ1PR11MB6083.namprd11.prod.outlook.com
 (2603:10b6:a03:48a::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6083:EE_|MW5PR11MB5761:EE_
X-MS-Office365-Filtering-Correlation-Id: da690736-3fb4-45b5-d6b8-08de374254e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sEb+1e4xZj8GciyVf9g1k+wCVH5U3dSa+oqcSU8cWoOcnmuStdWd34xM7f0f?=
 =?us-ascii?Q?qp0Vhu3Mx/4yfenCfMl1Pk9iUwdOx/To8jVmDyltBJl2tpiB2PwA4R6+zBsi?=
 =?us-ascii?Q?NHfThVR1Xr7S39EnuBu0iJZFplKFBSzRmSMHCMWcTUQr6VrpeIDGc2ITXr+4?=
 =?us-ascii?Q?C3amxRUYWfAfx3xz9wCHm2eqHjPXZk11cyAGR12Q8/SguzgLxsshBgKdQ3pf?=
 =?us-ascii?Q?zL8q89yMALHANbYUdAW1PUW2gA+26cvmzh5iNDe+M/p1qlk2GVSNg/iuh0YA?=
 =?us-ascii?Q?hx3nnHoKymEcLC6yjqxIIVTI6JfCHLplPzNP8G06Uev3B7i+QcMQY9pKnCIg?=
 =?us-ascii?Q?sKraPOkN3whajSzg+1xkwJP1oNWcDUWssmzQUgSEJ2+yjSbH186K2KUIdH/M?=
 =?us-ascii?Q?hT1pJrd/s8g/4UcY1ztnu+wlCDAqEbZ5wZuKqQ1X5y7wzlRxKssC7MlAbQ8y?=
 =?us-ascii?Q?7POMnOH/mfTI5nHXWvL1fdN4PaHtxQZ+W8Mlvn3FUVXHVuYUftrEgTcXaDFm?=
 =?us-ascii?Q?uTEutkCZxCjLgyTEOAKC/5dG0y2UsOxE/mUn748kdEqA3T6ukXWPBRTOd9wV?=
 =?us-ascii?Q?9Pg4g8xZxUXK4lbOdw+tUF2MPHJFzLzU0/7eTctLDfDS5oZWtOiOnHTi2vIV?=
 =?us-ascii?Q?yxObyFkev9SRzhepLfxWi0tgoKkkPV9ur6aG4t68h0zEOWmSz/jLGdfkE1+H?=
 =?us-ascii?Q?BfLtBjfs14CM1wQmlbUovfMwKWSJQHDAHYbRpOYGAyDFTTixHL+/OdyukrhE?=
 =?us-ascii?Q?ZfCIAYlF5yJsWAeV1NZpm4K/ukCvJjhN+wtnUgH9t7ukscl3vQmwm8OFkiJp?=
 =?us-ascii?Q?pM31KPnWgzfKkD79zyBuxQ8BeMUgfQgXGx8Ik1hdL3y6cqOOBl2QWLQr/SAk?=
 =?us-ascii?Q?wdINT/6iTvPZHjv2V/GWSg9CgiXOYVXR1rNFk9jKTnInAWydgtyj9D/a18ZC?=
 =?us-ascii?Q?0P4sTsiV5p8liclKcHlJTv5jcZJJE8meMFEy2HUNXvHZgy0p278zyUUpdVQq?=
 =?us-ascii?Q?v4GuK+3r4eDbN/lxg6DKzxhMiRByINWriirtsmaWeNdzSj00vdgP3IN4LznA?=
 =?us-ascii?Q?Q4SRAT9U1Py2gO1jsx5xckqH/In19M4qGL7K4S/vuuDIJ3rKGpaANwkJ7o3h?=
 =?us-ascii?Q?Ymunw2ZMAvjfTrQNlBkAF+QWI370wNFgXduWdP7tyHtWx0BoWZKH6XuSxWJ8?=
 =?us-ascii?Q?g38K02ZiUirCIupHHF5AdGUDEDHqVQJasUuLHXkPMt7vmXp6BdwvUt8Bar9Q?=
 =?us-ascii?Q?tj4VUsgbXqb++uiEahMbaKx8xRdWRKkjj2IPnE7slyARmiUfKepsS+H14DDj?=
 =?us-ascii?Q?puZm4WA7dOrKQ4XBuMM3FGQBCwfF+HyPd3JQj51gN1h7hT1PvWn4Mu3cmEOr?=
 =?us-ascii?Q?suJ3s1KyHLYXgyhv/wWqYDsLK3vt809nTRMd4epp4eUnHX6Z8Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/PHVvWduvpgMKXgBRfGiniXfyGKlKi4rwsiLjoWiFd1jQe6yPBOCpq1b6Lh5?=
 =?us-ascii?Q?7emWJGuqs8MBFBmWMMbFNXQgbCgSdmx6YeQ6+KrVRGTWCkS1PhhzoO2NhDc8?=
 =?us-ascii?Q?IsA4yjIdLt9Bwr4Ub15IijJGThxwIiVjxdTQRoWGL8qt/VJqmpbLpRylJjcO?=
 =?us-ascii?Q?RyggWL+5jF+kD8mTB1DkDrv8hTZyterjoZrHsnyajp4yw5Qmk3OJp79+h2NO?=
 =?us-ascii?Q?IQ7oFIJzf+PcO13j6j8YBNbdXKx2skMfsiseZ5Wry8UW8nNu8jw1ux4GO8BD?=
 =?us-ascii?Q?yI2MIG6VlsFQE6aJD2E/dugLCC5ay+52fqogYjSbvUb+6UEZWi/uvUCIHVuE?=
 =?us-ascii?Q?EHepZZQ6ouwsfxyeXmRbvxIwWBmmRfHArZwZn37LEjFSACkmtopxmp3oXQsz?=
 =?us-ascii?Q?t5IkoQZCgUn4PhFlKgfWIqQkfE2lwjfG3JWRYIXBNx6ZCp6U9WQwpl9Nh0F8?=
 =?us-ascii?Q?+I3Ya6SYi/SLgvOrsIcR7zWXb/mPurIg/uprSOJWxsYWL84CEIImyiF+RPE0?=
 =?us-ascii?Q?yjPKyRa2uBxKe3brSyR5noZbkBoMZOTvXz7ZiB9ml+hIiVCsOfna71dva6z1?=
 =?us-ascii?Q?+gDhCLZij0WHlJn0tJzgIL/kL+Lu3fEqncObHAinN4SXS9BJZXM/cieyrGPL?=
 =?us-ascii?Q?UNYt1p3NPk2aHrr7OBqoHneV+kRb6gIX+5QAvKK4OREOihMtchg6Xj2089QH?=
 =?us-ascii?Q?guwN7W6aNDzrpfceNBgxUO6YF4tW4slke8Fi9jkz5yLhQphcNgzEgTjFgOiP?=
 =?us-ascii?Q?JQe2Z9fJTJyQ6LDar++BKzluGuL1YuT0JCxoHc6n4bJanx5agy5Vs6zJo2Cs?=
 =?us-ascii?Q?3LynWTZVZidEe8MIFCRrIoieUFieZJzs69n18UQU3rkTRSHkyqlsjEvC0SX8?=
 =?us-ascii?Q?hfIZyHtIG2saH7O7zUbnfRLvCs4fIgU1S+NM8zGNp+nJY/keGBarW/OmwVIE?=
 =?us-ascii?Q?4rpEXTgYIi4O9mz5VzMNGErs5FN0cImfl8FzvsG6XLs2LL+CmmoDZs7Ykp3g?=
 =?us-ascii?Q?kh+E1Rxau4EFuRVWMsWxM5tO2mnKSFEIe4G3giL50NVJl+QFlOmpIDqUaGtD?=
 =?us-ascii?Q?6orKe2aQrlZa05tYWtYAQNJcSLC4qnY0zIQILS4ko2c1l/Xlt56SAxEbquG4?=
 =?us-ascii?Q?hGF/h7Kpe1KixZ4i/kCecQL5c2t/MgVT0mzcfdydnvlesWtvnfKUK6nnaDcH?=
 =?us-ascii?Q?yG/X5rI5Ecq1HDPYPmIt2PVSt9iiUrQOxdmR4nIGQ3GpC3j2I5g1PGIaqTAO?=
 =?us-ascii?Q?0DKVLO1IuGBad98GqQVaQ+VtuWJNPKrs38uSYp+peLY59aZAIN9r8DePEQG7?=
 =?us-ascii?Q?TVeT27A2nVZNwhi0FBV7F1cmR8zTIOt5gfV3Ek02A9D9+2GAEDidlzaIzJuG?=
 =?us-ascii?Q?OQtBjsEXuZfpuO++a8pENIK42wq8KGiIrdWRjdX1hgn2EMIqRShz7bJj6vng?=
 =?us-ascii?Q?IQjiBAmOW34Tf1x6y71VU2843I6UPPD73bsLbkNY7IJ88TxZhjICXrIHKdYp?=
 =?us-ascii?Q?fBroKS+KTrHz6n3edk0YFiX6qYMOD/ASUezf6hswEeN5aJI73EEnMOS6w6VM?=
 =?us-ascii?Q?48XQxO7jT79gplIFLGfXS5fXxoAcL2EJbC6aoYjQ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: da690736-3fb4-45b5-d6b8-08de374254e1
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 16:45:17.2140
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KOo3/nbGxeiOvneJE9el9Q7drtRz3aSKHbKM6Y8SQJjXvL98hScdJEciV5/vTbMzUkuZBx3e1ipl/1JyfKm2Ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5761
X-OriginatorOrg: intel.com

On Tue, Dec 09, 2025 at 04:20:06PM +0000, Luck, Tony wrote:
> >> Likewise, I just got the following kernel test robot report sent to me,
> >> where it's warning about MODULE_LICENSE("GPL"):
> >> https://lore.kernel.org/all/202512090359.7BkUaiC9-lkp@intel.com/
> >
> > Can you both confirm which version of sparse are you using?
> >
> > My understanding was that this patch fixed that problem:
> > >https://lore.kernel.org/linux-sparse/CACePvbVG2KrGQq4cNKV=wbO5h=jp3M0RO1SdfX8kV4OukjPG8A@mail.gmail.com/T/#mf838b3e2e3245d88c30a801ea7473d5a5c0eb121
> 
> > The patch is already merged into the sparse tree, and I was not able to
> > reproduce the issue.
> 
> I pulled the latest sparse source and re-checked before reporting. Top commit I have is the one you mention:
> 
> fbdde3127b83 ("builtin: implement __builtin_strlen() for constants")
> 
> I'm building latest Linus tree from the current merge window (well latest as-of yesterday):
> 
> c2f2b01b74be ("Merge tag 'i3c/for-6.19' of git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux")

I added a debug trace to the new expand_strlen() function added to
sparse. It is being called and doing the right thing. My trace says:

	len(GPL) = 3

-Tony

