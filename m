Return-Path: <linux-media+bounces-65600-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6s3qMc54PGqzoQgAu9opvQ
	(envelope-from <linux-media+bounces-65600-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 02:39:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 981C26C2042
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 02:39:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=LpI03OJk;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65600-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65600-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1388A303E4FA
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 00:39:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C10D934A794;
	Thu, 25 Jun 2026 00:39:38 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F5135839C
	for <linux-media@vger.kernel.org>; Thu, 25 Jun 2026 00:39:21 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782347976; cv=fail; b=SG3RRh2Te+ZXe5mrbEQdZXzbpNA4/e11c/4MRPvOGPehaUmF2Nf4BbTGU7zClqPQP6PJbkPxb+00MOib831NxM07dTw0bBSlVU/MLQe8+f/8lM5hzx0eglxrLrzF1qlU4TQhTIgeblnc7c/30Cta6Wj41eUJlWXiEj8X9d9jQgM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782347976; c=relaxed/simple;
	bh=+w+Dy1m6aWzVQOu+uaA8apzuoTF7yQud1wetSJm1ryc=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TGPa9Qy1eUJth7PLe4dwTd4oH4dyrRI4tlGNVWqubCFVltNHu5tqeyy98pZ+G+szL8Ug/ObDXuvt28zi0rXdP4qiq+bhGgk4ysrq3BwU607EiEIKr8kNimKXleNHXykx+rggiCh/XHh/x2CxPvEALU+Jj5ByFMGw+FcVFNPH230=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LpI03OJk; arc=fail smtp.client-ip=192.198.163.11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782347962; x=1813883962;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=+w+Dy1m6aWzVQOu+uaA8apzuoTF7yQud1wetSJm1ryc=;
  b=LpI03OJk4k1ZYUiv0rYbYP3/PuQDm6b2PcQ3Xx0UZVtoag7w/dmH8AHX
   Zz5pSceINjt2SjzoOWlJraN+iw0apCtfPJpxEo97H4UDAuMHqZ4zA3qIk
   Hg/mqeiD9N51R7/JtizFgReBsqNlcd6AdsTvHZQbpok8sn8YKydRYTIVk
   IzCxxBPF45K1Lji0Ryna1dDgOEpEnwwbfsYWOHZ/x5eQgZ7bkB0IFlyyd
   8JlSEf82Xd0peNRJrUR2k6dSSaMjGh8Xfaxg2jVxQszK3iJ3fAs2CJCFQ
   CgpJIr+xYU+NrbsIdhC61xoIVAjVN2sDWXCr6BOoGXxyN3FKMMw6xks3b
   Q==;
X-CSE-ConnectionGUID: 21ZytROlRRqxwJHXpx7vhw==
X-CSE-MsgGUID: Sk1VMuSkTKWt+2+sg0Kxxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="93721397"
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; 
   d="scan'208";a="93721397"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 17:39:20 -0700
X-CSE-ConnectionGUID: VTcsF6wOQ2KoV/D+RnaC/w==
X-CSE-MsgGUID: 1KQ39IkEQgq2hmtyqyavbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; 
   d="scan'208";a="250245496"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 17:39:20 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 17:39:19 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 24 Jun 2026 17:39:19 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.20) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 17:39:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KaVbpzsmUzyNEv9+6kz1emkOJ02Y7KNow0DY25R37K2ED0bQdlG4vCAYFiDQWEupqZUVeQ4OIjiow3kNFwyfjmcWX/UKqIwJw1NBOZ/1KoH0qZvPClrwau26Uu0ZTYCOHWSoGpK2TlEiv8guSy1/vOkOgAsovO6Ic9umiaC+ZUGyciH80e3H4dtXryovtemY6NUA6g8gG8NuI8Y+dSPHInKNqolFuwOFqtjYQ2hZjEJNnlGlCSKaFEsbbrLpkO978aOiU5UiTG50Ogb1+1mkQm6uj25A4V2YCpgVq5LYaWf8H/lvQD0V2ROxl74seH9iK7d1rikIm/pj9ImbmDsPMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xvo0ZdeuennVst8tvdfTt7abfAq20xrdloI3Ia85Lyw=;
 b=HkzVNkSW8Pc14HDMNexiUWe8xNrHsDwUSOBkwICuB979W7/JL11oAYVklGbTkoqcmKFPC+gXFho9DsXB9NFR60wARIh2LCvHC7qT5dPoyT2oc2V5t7OveqI2ZX+MhGdMcD95SUjT7cZfFjXkyhKd0C5VDGy9z58RCUjJ8hjV1poXijXpx48VplnPsn51R1BKJiIi0ZGu/syI9nGW53ysObeBSlgJ3iMn7gxfD6YtHmXELPtQXWHVrq3BlGTkXx+OPo5MUaJ4I8Yn3fLowDTw3ejewV1Su13T0Pq4fe/b4GHXXixXqa/AghcBhB3vkswRbQ74eMkH5PHeP8b6GfAb6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM3PPF9EFFC957B.namprd11.prod.outlook.com (2603:10b6:f:fc00::f40) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Thu, 25 Jun
 2026 00:39:12 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0159.014; Thu, 25 Jun 2026
 00:39:12 +0000
Date: Wed, 24 Jun 2026 17:39:09 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <christian.koenig@amd.com>
CC: <phasta@kernel.org>, <simona@ffwll.ch>, <sumit.semwal@linaro.org>,
	<tvrtko.ursulin@igalia.com>, <dakr@kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-media@vger.kernel.org>,
	<linaro-mm-sig@lists.linaro.org>
Subject: Re: [PATCH 01/10] dma-buf: rename dma_fence_enable_sw_signaling
Message-ID: <ajx4rStJiHc6/I2q@gsse-cloud1.jf.intel.com>
References: <20260624122917.2483-1-christian.koenig@amd.com>
 <20260624122917.2483-2-christian.koenig@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260624122917.2483-2-christian.koenig@amd.com>
X-ClientProxiedBy: SJ0PR03CA0090.namprd03.prod.outlook.com
 (2603:10b6:a03:331::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM3PPF9EFFC957B:EE_
X-MS-Office365-Filtering-Correlation-Id: 2207ed55-f8fc-4df1-5293-08ded2522cef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|22082099003|18002099003|11063799006|4143699003|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info: 4fMl0Zu3R78FecJfoTqcf0SdqsiB1uMVuJq78lx5kGSmilsM9lb3LtSxY88f+T3e4YRiANSpvYKLWpAj8w3TV2kvSwUooYkqn1AMXTMSGQtbOqnuSs+6MBHzYgTpg63WHo1rnA4slJ4SndgpmS9p4Xhh5pKyH3WcZXLOm5xDsZeTpiE9gi901+L14m0A7PypmTUl5JJ3JGbPmoaO/UV645PgV7IJOJ/rNssHjPmYDqlhKsvkDJLgMXNWgkSCNJfTYL7GaV5KUWgu+mf850z+p8blNScQTbk3M4mpJ3dwB1dQMJb/OhTT+DtL0u0J2z/D6EU91MIQWF1uOiINgthvLmbef/DTrL32O2pAt6u7BmpMdCUljv0hJVUI7xsiWlck4Exe+W+hBhU3m7dme5gdatv4rTORrE07ZGlHHKSZuFgb7sIA3u6TqCISeSu2D36reUhzRB64fvDV5PT3ytPZj2fVi6YLA3jhziVbabsTQB9BMav7gI7kw3HsJ3stO7DkJu+NXeH570YWH8xfya68JH+sJp3aAzIe5G4s4H5mcuDZZoVQxpPT3DVw1u2qRMYrB50yHA5R+YdDCF5GfUweIjHcp5fCGUl20zZ7vr47EwS70Z8YkdjgsX5dB74ZE7ONdSQQVoO0gLAcdYVx9u+ANYZ+gDu1P/96ILm3ldvo3EQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6522.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(22082099003)(18002099003)(11063799006)(4143699003)(6133799003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?tjfatzwj3yQx4TVETLH8aACLvwD41NEhy2Uab3giIJKfsEH7ME1kPAmb6A?=
 =?iso-8859-1?Q?z20oit0xr+kb04UVy+9JU1/6NHyynitNQIHwT7kB9W+3Gw0hIrNXT/zt4u?=
 =?iso-8859-1?Q?Tt8Fh+tBPKB6Tqpkx+++uEO+Z/uyQFjJc9y+60JLo7hJOQ16sBPfQC2gmr?=
 =?iso-8859-1?Q?F03j5TYei9eC9K3bNK5F4lMKi3rmbpO/Gn9lbdZ8ryzbZE+zzSoIFB9G0G?=
 =?iso-8859-1?Q?/mNc5s3tF6Jj9HPqKBV2A32p8Wf9v0jxDDbL4qY7p7EQh/iwyNvia9Lvw9?=
 =?iso-8859-1?Q?yV3zc5jV3PVxl3jbOo78rkrU5FlT6EFlMDSmfNpt8J99jrabF/ScWELRsJ?=
 =?iso-8859-1?Q?9q+Zoe+V7r/dkRnvbxytta2oRpjrHaUFThvVF86g14HxuXcCRQWBK6kRlD?=
 =?iso-8859-1?Q?BQyRkOKx0oHVRW3vD3FQ1AkS7igXjnH9dNxggxHDoYFZwQZtCIvDAntECd?=
 =?iso-8859-1?Q?pimhn7kGSLiG88bxh/Jgn9XZhOeYPGZoOlqGq/U9qVaGhnXeGUooJsghFy?=
 =?iso-8859-1?Q?5rh+oOpvRymKHR7rIc0I1lS83cInzlrf8IM3jKNrJqItrL+8Km4sdhRoMW?=
 =?iso-8859-1?Q?WJAXZUIowWWhOy9Hk8u1kF3oP878xiJelsovVZINLIHfiyzVyvI0f7uZMU?=
 =?iso-8859-1?Q?5bG3y062uC1/igbgYkErmBTD+rvH42iDAZR+4AU4XFZ/6Qtcg1LWmxGdw4?=
 =?iso-8859-1?Q?EXk+qlqryVPFikTJ9LpZcjdjwNnRsQgJdfX+2NJ8zHb4ExDflaoM4aB+gc?=
 =?iso-8859-1?Q?QwfrHUuG0vn4JQdbM4opPOjzuiiSJoqI6W2PAWW6Aap9teM64mPhP+WuAa?=
 =?iso-8859-1?Q?pqFYPqYAgVJ/pg3Q8cSTB7VoepVPa+WfQTy0swzTmLYfSHdVoQq/7mbdeY?=
 =?iso-8859-1?Q?5znPKI5+83Fyzd4s9GNisuROd1oHKJNNYZfhA0RUt6VRl4R+Ixc/Dy6HMl?=
 =?iso-8859-1?Q?Z6l5pwqOqYQZhe5TcqCvZgfCOeKRVHn7z/lKSy+xmuX5qkY5Ko1AAT8rfi?=
 =?iso-8859-1?Q?Evg6ONPUVcE28sWmNM4MfpWcXPg/NRmarGbnwc3HPtQQLozjHE7fns+SjZ?=
 =?iso-8859-1?Q?2dWfhlFR4uPn/d4Vg4PY33H7KeZ4QNyKFBmRZVQuAwj/7vhpsUZxISz1a6?=
 =?iso-8859-1?Q?L43Y4iOCBfdtcDCdc3GJxHnS2LB7SwvWDVPtFpAzvBYsJT3O50ekpeeF2V?=
 =?iso-8859-1?Q?s5yqfAEb2Nf0mPdleDendslMm1BV0hOLanaveWlUqqTNoQVpoVc0HdLWl0?=
 =?iso-8859-1?Q?XPOsmAsM3pBgCwNF9X9pj+r0u4RQPoCi52hNJ8TcIJb25izD27GcMvBxTH?=
 =?iso-8859-1?Q?RK/w8mH1dAd7uhBF/0anylNAgr3Ub9ZczkNncGj1/yzKst091y0X6k7bvK?=
 =?iso-8859-1?Q?n9U+sxDbOX95A9z20ziGVC9XrqlFkGA2sI05WmydMUWtH1EdGXf7qJMWcq?=
 =?iso-8859-1?Q?Pb+yti851w9xvPpM/NJFiF50eVbPZgsasOofA6b1vJV5QvTC3/gHJkhxMH?=
 =?iso-8859-1?Q?zblKxaTL1zc6IqaKuuMQmJu3tK9BoKnPxc2hC0tFerZJwSQBlTkZeiEosm?=
 =?iso-8859-1?Q?TbixltYd2QocW3FovMuffSLZDyDS7ZToZS3VgenyyExA4qPxUlN9tM7cyE?=
 =?iso-8859-1?Q?gVNzZW9lYBWXvwMYxSvL1EnE1+gNW5Df/LynYdK62W6BMYE8SoR5N+av3d?=
 =?iso-8859-1?Q?/mWHYEvNO3xzGaVfUlbpSvMwGjjVbO2lr8BjYL+Xlmmre0P4lzNae69rlA?=
 =?iso-8859-1?Q?gy1sG8dmOj1AeGMVWFiSO5MuWAJqp4iyLqfaMtTRmuCa+mkSfM17xrNfMm?=
 =?iso-8859-1?Q?teGBmh4jO23rP0/WPe5IHw5DuUGXiGw=3D?=
X-Exchange-RoutingPolicyChecked: hJuKtuTHWGSQ+C9E0mr5ArhEcOt9ZcbywxyLEqeshGEtUrtkJETABRvJgmJmvlZAAQsMNtWMRrMEwWDFmtu7ocXuvwL3zmFZ5qI36DIeARPh1Y5yCZz+PF5Wm7pwhqEn/5Hg18m32yHT1bg2LdXrw003XsOFGg6tVdWvJwex1rQxIL/rD4Et8fdJhiewbAn/M8bSE5SUfYVKxbbjfy8o5kfJp69CGudYCUDkqMVfRu6H4XtPeuGUohU+bsx0R4RcEyXmmRZO3xyTrVpSQAzcMoAS1n+Km/l6ebrlz8cdZrPd8D82+0DUBUYBvyVzDjaCdOFaUpXxAggAnY3m8J5wRA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2207ed55-f8fc-4df1-5293-08ded2522cef
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 00:39:11.8572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Igxjsh2CCSjR285fmee2D624ls/prGonVgGPGWLGURbLleKYZZaTCpK75KgPcXsT7P95uy4K8SMb/DuAezaoTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF9EFFC957B
X-OriginatorOrg: intel.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65600-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gsse-cloud1.jf.intel.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:dkim,intel.com:email,intel.com:from_mime,amd.com:email];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:phasta@kernel.org,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:tvrtko.ursulin@igalia.com,m:dakr@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[matthew.brost@intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 981C26C2042

On Wed, Jun 24, 2026 at 01:13:25PM +0200, Christian König wrote:
> Dropping the _sw_ part from the names was proposed multiple times now and
> IIRC people generally agreed with the idea already.

I certainly agree.

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> 
> The function requests a fence to signal and triggers some sort of HW
> interaction on most backends.
> 
> So this is not really software related at all and the callback is already
> just named enable_signaling as well.
> 
> Just streamline that and use a consistent name everywhere.
> 
> Assisted-by: Claude Sonet 4
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/dma-fence.c                   |  8 ++--
>  drivers/dma-buf/st-dma-fence-chain.c          |  4 +-
>  drivers/dma-buf/st-dma-fence-unwrap.c         | 42 +++++++++----------
>  drivers/dma-buf/st-dma-fence.c                | 16 +++----
>  drivers/dma-buf/st-dma-resv.c                 | 10 ++---
>  drivers/gpu/drm/i915/i915_active.c            |  2 +-
>  .../gpu/drm/ttm/tests/ttm_bo_validate_test.c  |  2 +-
>  drivers/gpu/drm/ttm/ttm_bo.c                  |  2 +-
>  drivers/gpu/drm/xe/xe_bo.c                    |  2 +-
>  drivers/gpu/drm/xe/xe_sched_job.c             |  2 +-
>  drivers/gpu/drm/xe/xe_svm.c                   |  2 +-
>  drivers/gpu/drm/xe/xe_userptr.c               |  2 +-
>  drivers/gpu/drm/xe/xe_vm.c                    |  4 +-
>  include/linux/dma-fence.h                     |  4 +-
>  14 files changed, 51 insertions(+), 51 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index c7ea1e75d38a..0ec81a568bbd 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -534,7 +534,7 @@ dma_fence_wait_timeout(struct dma_fence *fence, bool intr, signed long timeout)
>  
>  	__dma_fence_might_wait();
>  
> -	dma_fence_enable_sw_signaling(fence);
> +	dma_fence_enable_signaling(fence);
>  
>  	rcu_read_lock();
>  	ops = rcu_dereference(fence->ops);
> @@ -656,14 +656,14 @@ static bool __dma_fence_enable_signaling(struct dma_fence *fence)
>  }
>  
>  /**
> - * dma_fence_enable_sw_signaling - enable signaling on fence
> + * dma_fence_enable_signaling - enable signaling on fence
>   * @fence: the fence to enable
>   *
>   * This will request for sw signaling to be enabled, to make the fence
>   * complete as soon as possible. This calls &dma_fence_ops.enable_signaling
>   * internally.
>   */
> -void dma_fence_enable_sw_signaling(struct dma_fence *fence)
> +void dma_fence_enable_signaling(struct dma_fence *fence)
>  {
>  	unsigned long flags;
>  
> @@ -671,7 +671,7 @@ void dma_fence_enable_sw_signaling(struct dma_fence *fence)
>  	__dma_fence_enable_signaling(fence);
>  	dma_fence_unlock_irqrestore(fence, flags);
>  }
> -EXPORT_SYMBOL(dma_fence_enable_sw_signaling);
> +EXPORT_SYMBOL(dma_fence_enable_signaling);
>  
>  /**
>   * dma_fence_add_callback - add a callback to be called when the fence
> diff --git a/drivers/dma-buf/st-dma-fence-chain.c b/drivers/dma-buf/st-dma-fence-chain.c
> index a3023d3fedc9..e0d9b69bfa76 100644
> --- a/drivers/dma-buf/st-dma-fence-chain.c
> +++ b/drivers/dma-buf/st-dma-fence-chain.c
> @@ -82,7 +82,7 @@ static void test_sanitycheck(struct kunit *test)
>  
>  	chain = mock_chain(NULL, f, 1);
>  	if (chain)
> -		dma_fence_enable_sw_signaling(chain);
> +		dma_fence_enable_signaling(chain);
>  	else
>  		KUNIT_FAIL(test, "Failed to create chain");
>  
> @@ -139,7 +139,7 @@ static int fence_chains_init(struct fence_chains *fc, unsigned int count,
>  
>  		fc->tail = fc->chains[i];
>  
> -		dma_fence_enable_sw_signaling(fc->chains[i]);
> +		dma_fence_enable_signaling(fc->chains[i]);
>  	}
>  
>  	fc->chain_length = i;
> diff --git a/drivers/dma-buf/st-dma-fence-unwrap.c b/drivers/dma-buf/st-dma-fence-unwrap.c
> index 4e7ee25372ba..4d9d313b460c 100644
> --- a/drivers/dma-buf/st-dma-fence-unwrap.c
> +++ b/drivers/dma-buf/st-dma-fence-unwrap.c
> @@ -103,7 +103,7 @@ static void test_sanitycheck(struct kunit *test)
>  	f = mock_fence();
>  	KUNIT_ASSERT_NOT_NULL(test, f);
>  
> -	dma_fence_enable_sw_signaling(f);
> +	dma_fence_enable_signaling(f);
>  
>  	array = mock_array(1, f);
>  	KUNIT_ASSERT_NOT_NULL(test, array);
> @@ -122,7 +122,7 @@ static void test_unwrap_array(struct kunit *test)
>  	f1 = mock_fence();
>  	KUNIT_ASSERT_NOT_NULL(test, f1);
>  
> -	dma_fence_enable_sw_signaling(f1);
> +	dma_fence_enable_signaling(f1);
>  
>  	f2 = mock_fence();
>  	if (!f2) {
> @@ -131,7 +131,7 @@ static void test_unwrap_array(struct kunit *test)
>  		return;
>  	}
>  
> -	dma_fence_enable_sw_signaling(f2);
> +	dma_fence_enable_signaling(f2);
>  
>  	array = mock_array(2, f1, f2);
>  	KUNIT_ASSERT_NOT_NULL(test, array);
> @@ -160,7 +160,7 @@ static void test_unwrap_chain(struct kunit *test)
>  	f1 = mock_fence();
>  	KUNIT_ASSERT_NOT_NULL(test, f1);
>  
> -	dma_fence_enable_sw_signaling(f1);
> +	dma_fence_enable_signaling(f1);
>  
>  	f2 = mock_fence();
>  	if (!f2) {
> @@ -169,7 +169,7 @@ static void test_unwrap_chain(struct kunit *test)
>  		return;
>  	}
>  
> -	dma_fence_enable_sw_signaling(f2);
> +	dma_fence_enable_signaling(f2);
>  
>  	chain = mock_chain(f1, f2);
>  	KUNIT_ASSERT_NOT_NULL(test, chain);
> @@ -198,7 +198,7 @@ static void test_unwrap_chain_array(struct kunit *test)
>  	f1 = mock_fence();
>  	KUNIT_ASSERT_NOT_NULL(test, f1);
>  
> -	dma_fence_enable_sw_signaling(f1);
> +	dma_fence_enable_signaling(f1);
>  
>  	f2 = mock_fence();
>  	if (!f2) {
> @@ -207,7 +207,7 @@ static void test_unwrap_chain_array(struct kunit *test)
>  		return;
>  	}
>  
> -	dma_fence_enable_sw_signaling(f2);
> +	dma_fence_enable_signaling(f2);
>  
>  	array = mock_array(2, f1, f2);
>  	KUNIT_ASSERT_NOT_NULL(test, array);
> @@ -239,7 +239,7 @@ static void test_unwrap_merge(struct kunit *test)
>  	f1 = mock_fence();
>  	KUNIT_ASSERT_NOT_NULL(test, f1);
>  
> -	dma_fence_enable_sw_signaling(f1);
> +	dma_fence_enable_signaling(f1);
>  
>  	f2 = mock_fence();
>  	if (!f2) {
> @@ -247,7 +247,7 @@ static void test_unwrap_merge(struct kunit *test)
>  		goto error_put_f1;
>  	}
>  
> -	dma_fence_enable_sw_signaling(f2);
> +	dma_fence_enable_signaling(f2);
>  
>  	f3 = dma_fence_unwrap_merge(f1, f2);
>  	if (!f3) {
> @@ -285,7 +285,7 @@ static void test_unwrap_merge_duplicate(struct kunit *test)
>  	f1 = mock_fence();
>  	KUNIT_ASSERT_NOT_NULL(test, f1);
>  
> -	dma_fence_enable_sw_signaling(f1);
> +	dma_fence_enable_signaling(f1);
>  
>  	f2 = dma_fence_unwrap_merge(f1, f1);
>  	if (!f2) {
> @@ -322,7 +322,7 @@ static void test_unwrap_merge_seqno(struct kunit *test)
>  	f1 = __mock_fence(ctx[1], 1);
>  	KUNIT_ASSERT_NOT_NULL(test, f1);
>  
> -	dma_fence_enable_sw_signaling(f1);
> +	dma_fence_enable_signaling(f1);
>  
>  	f2 = __mock_fence(ctx[1], 2);
>  	if (!f2) {
> @@ -330,7 +330,7 @@ static void test_unwrap_merge_seqno(struct kunit *test)
>  		goto error_put_f1;
>  	}
>  
> -	dma_fence_enable_sw_signaling(f2);
> +	dma_fence_enable_signaling(f2);
>  
>  	f3 = __mock_fence(ctx[0], 1);
>  	if (!f3) {
> @@ -338,7 +338,7 @@ static void test_unwrap_merge_seqno(struct kunit *test)
>  		goto error_put_f2;
>  	}
>  
> -	dma_fence_enable_sw_signaling(f3);
> +	dma_fence_enable_signaling(f3);
>  
>  	f4 = dma_fence_unwrap_merge(f1, f2, f3);
>  	if (!f4) {
> @@ -378,7 +378,7 @@ static void test_unwrap_merge_order(struct kunit *test)
>  	f1 = mock_fence();
>  	KUNIT_ASSERT_NOT_NULL(test, f1);
>  
> -	dma_fence_enable_sw_signaling(f1);
> +	dma_fence_enable_signaling(f1);
>  
>  	f2 = mock_fence();
>  	if (!f2) {
> @@ -387,7 +387,7 @@ static void test_unwrap_merge_order(struct kunit *test)
>  		return;
>  	}
>  
> -	dma_fence_enable_sw_signaling(f2);
> +	dma_fence_enable_signaling(f2);
>  
>  	a1 = mock_array(2, f1, f2);
>  	KUNIT_ASSERT_NOT_NULL(test, a1);
> @@ -442,7 +442,7 @@ static void test_unwrap_merge_complex(struct kunit *test)
>  	f1 = mock_fence();
>  	KUNIT_ASSERT_NOT_NULL(test, f1);
>  
> -	dma_fence_enable_sw_signaling(f1);
> +	dma_fence_enable_signaling(f1);
>  
>  	f2 = mock_fence();
>  	if (!f2) {
> @@ -450,7 +450,7 @@ static void test_unwrap_merge_complex(struct kunit *test)
>  		goto error_put_f1;
>  	}
>  
> -	dma_fence_enable_sw_signaling(f2);
> +	dma_fence_enable_signaling(f2);
>  
>  	f3 = dma_fence_unwrap_merge(f1, f2);
>  	if (!f3) {
> @@ -510,7 +510,7 @@ static void test_unwrap_merge_complex_seqno(struct kunit *test)
>  	f1 = __mock_fence(ctx[0], 2);
>  	KUNIT_ASSERT_NOT_NULL(test, f1);
>  
> -	dma_fence_enable_sw_signaling(f1);
> +	dma_fence_enable_signaling(f1);
>  
>  	f2 = __mock_fence(ctx[1], 1);
>  	if (!f2) {
> @@ -518,7 +518,7 @@ static void test_unwrap_merge_complex_seqno(struct kunit *test)
>  		goto error_put_f1;
>  	}
>  
> -	dma_fence_enable_sw_signaling(f2);
> +	dma_fence_enable_signaling(f2);
>  
>  	f3 = __mock_fence(ctx[0], 1);
>  	if (!f3) {
> @@ -526,7 +526,7 @@ static void test_unwrap_merge_complex_seqno(struct kunit *test)
>  		goto error_put_f2;
>  	}
>  
> -	dma_fence_enable_sw_signaling(f3);
> +	dma_fence_enable_signaling(f3);
>  
>  	f4 = __mock_fence(ctx[1], 2);
>  	if (!f4) {
> @@ -534,7 +534,7 @@ static void test_unwrap_merge_complex_seqno(struct kunit *test)
>  		goto error_put_f3;
>  	}
>  
> -	dma_fence_enable_sw_signaling(f4);
> +	dma_fence_enable_signaling(f4);
>  
>  	f5 = mock_array(2, dma_fence_get(f1), dma_fence_get(f2));
>  	if (!f5) {
> diff --git a/drivers/dma-buf/st-dma-fence.c b/drivers/dma-buf/st-dma-fence.c
> index 499272229696..856d0d302a5d 100644
> --- a/drivers/dma-buf/st-dma-fence.c
> +++ b/drivers/dma-buf/st-dma-fence.c
> @@ -42,7 +42,7 @@ static void test_sanitycheck(struct kunit *test)
>  	f = mock_fence();
>  	KUNIT_ASSERT_NOT_NULL(test, f);
>  
> -	dma_fence_enable_sw_signaling(f);
> +	dma_fence_enable_signaling(f);
>  
>  	dma_fence_signal(f);
>  	dma_fence_put(f);
> @@ -55,7 +55,7 @@ static void test_signaling(struct kunit *test)
>  	f = mock_fence();
>  	KUNIT_ASSERT_NOT_NULL(test, f);
>  
> -	dma_fence_enable_sw_signaling(f);
> +	dma_fence_enable_signaling(f);
>  
>  	if (dma_fence_is_signaled(f)) {
>  		KUNIT_FAIL(test, "Fence unexpectedly signaled on creation");
> @@ -127,7 +127,7 @@ static void test_late_add_callback(struct kunit *test)
>  	f = mock_fence();
>  	KUNIT_ASSERT_NOT_NULL(test, f);
>  
> -	dma_fence_enable_sw_signaling(f);
> +	dma_fence_enable_signaling(f);
>  
>  	dma_fence_signal(f);
>  
> @@ -209,7 +209,7 @@ static void test_status(struct kunit *test)
>  	f = mock_fence();
>  	KUNIT_ASSERT_NOT_NULL(test, f);
>  
> -	dma_fence_enable_sw_signaling(f);
> +	dma_fence_enable_signaling(f);
>  
>  	if (dma_fence_get_status(f)) {
>  		KUNIT_FAIL(test, "Fence unexpectedly has signaled status on creation");
> @@ -233,7 +233,7 @@ static void test_error(struct kunit *test)
>  	f = mock_fence();
>  	KUNIT_ASSERT_NOT_NULL(test, f);
>  
> -	dma_fence_enable_sw_signaling(f);
> +	dma_fence_enable_signaling(f);
>  
>  	dma_fence_set_error(f, -EIO);
>  
> @@ -260,7 +260,7 @@ static void test_wait(struct kunit *test)
>  	f = mock_fence();
>  	KUNIT_ASSERT_NOT_NULL(test, f);
>  
> -	dma_fence_enable_sw_signaling(f);
> +	dma_fence_enable_signaling(f);
>  
>  	if (dma_fence_wait_timeout(f, false, 0) != 0) {
>  		KUNIT_FAIL(test, "Wait reported complete before being signaled");
> @@ -300,7 +300,7 @@ static void test_wait_timeout(struct kunit *test)
>  	wt.f = mock_fence();
>  	KUNIT_ASSERT_NOT_NULL(test, wt.f);
>  
> -	dma_fence_enable_sw_signaling(wt.f);
> +	dma_fence_enable_signaling(wt.f);
>  
>  	if (dma_fence_wait_timeout(wt.f, false, 1) != 0) {
>  		KUNIT_FAIL(test, "Wait reported complete before being signaled");
> @@ -379,7 +379,7 @@ static int thread_signal_callback(void *arg)
>  			break;
>  		}
>  
> -		dma_fence_enable_sw_signaling(f1);
> +		dma_fence_enable_signaling(f1);
>  
>  		rcu_assign_pointer(t->fences[t->id], f1);
>  		smp_wmb();
> diff --git a/drivers/dma-buf/st-dma-resv.c b/drivers/dma-buf/st-dma-resv.c
> index 95a4becdb892..0b96136bbd54 100644
> --- a/drivers/dma-buf/st-dma-resv.c
> +++ b/drivers/dma-buf/st-dma-resv.c
> @@ -48,7 +48,7 @@ static void test_sanitycheck(struct kunit *test)
>  	f = alloc_fence();
>  	KUNIT_ASSERT_NOT_NULL(test, f);
>  
> -	dma_fence_enable_sw_signaling(f);
> +	dma_fence_enable_signaling(f);
>  
>  	dma_fence_signal(f);
>  	dma_fence_put(f);
> @@ -73,7 +73,7 @@ static void test_signaling(struct kunit *test)
>  	f = alloc_fence();
>  	KUNIT_ASSERT_NOT_NULL(test, f);
>  
> -	dma_fence_enable_sw_signaling(f);
> +	dma_fence_enable_signaling(f);
>  
>  	dma_resv_init(&resv);
>  	r = dma_resv_lock(&resv, NULL);
> @@ -117,7 +117,7 @@ static void test_for_each(struct kunit *test)
>  	f = alloc_fence();
>  	KUNIT_ASSERT_NOT_NULL(test, f);
>  
> -	dma_fence_enable_sw_signaling(f);
> +	dma_fence_enable_signaling(f);
>  
>  	dma_resv_init(&resv);
>  	r = dma_resv_lock(&resv, NULL);
> @@ -176,7 +176,7 @@ static void test_for_each_unlocked(struct kunit *test)
>  	f = alloc_fence();
>  	KUNIT_ASSERT_NOT_NULL(test, f);
>  
> -	dma_fence_enable_sw_signaling(f);
> +	dma_fence_enable_signaling(f);
>  
>  	dma_resv_init(&resv);
>  	r = dma_resv_lock(&resv, NULL);
> @@ -246,7 +246,7 @@ static void test_get_fences(struct kunit *test)
>  	f = alloc_fence();
>  	KUNIT_ASSERT_NOT_NULL(test, f);
>  
> -	dma_fence_enable_sw_signaling(f);
> +	dma_fence_enable_signaling(f);
>  
>  	dma_resv_init(&resv);
>  	r = dma_resv_lock(&resv, NULL);
> diff --git a/drivers/gpu/drm/i915/i915_active.c b/drivers/gpu/drm/i915/i915_active.c
> index 5cb7a72774a0..e7632c1ff4be 100644
> --- a/drivers/gpu/drm/i915/i915_active.c
> +++ b/drivers/gpu/drm/i915/i915_active.c
> @@ -543,7 +543,7 @@ static void enable_signaling(struct i915_active_fence *active)
>  	if (!fence)
>  		return;
>  
> -	dma_fence_enable_sw_signaling(fence);
> +	dma_fence_enable_signaling(fence);
>  	dma_fence_put(fence);
>  }
>  
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
> index 2db221f6fc3a..56ad8ef32584 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
> @@ -69,7 +69,7 @@ static void dma_resv_kunit_active_fence_init(struct kunit *test,
>  	struct dma_fence *fence;
>  
>  	fence = alloc_mock_fence(test);
> -	dma_fence_enable_sw_signaling(fence);
> +	dma_fence_enable_signaling(fence);
>  
>  	dma_resv_lock(resv, NULL);
>  	dma_resv_reserve_fences(resv, 1);
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index bcd76f6bb7f0..3980f376e3ba 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -224,7 +224,7 @@ static void ttm_bo_flush_all_fences(struct ttm_buffer_object *bo)
>  
>  	dma_resv_iter_begin(&cursor, resv, DMA_RESV_USAGE_BOOKKEEP);
>  	dma_resv_for_each_fence_unlocked(&cursor, fence)
> -		dma_fence_enable_sw_signaling(fence);
> +		dma_fence_enable_signaling(fence);
>  	dma_resv_iter_end(&cursor);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 4c80bac67622..85e6d9a0f575 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -670,7 +670,7 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
>  		dma_resv_iter_begin(&cursor, bo->ttm.base.resv,
>  				    DMA_RESV_USAGE_BOOKKEEP);
>  		dma_resv_for_each_fence_unlocked(&cursor, fence)
> -			dma_fence_enable_sw_signaling(fence);
> +			dma_fence_enable_signaling(fence);
>  		dma_resv_iter_end(&cursor);
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
> index ae5b38b2a884..a4fa00632a30 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job.c
> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> @@ -214,7 +214,7 @@ void xe_sched_job_set_error(struct xe_sched_job *job, int error)
>  
>  	trace_xe_sched_job_set_error(job);
>  
> -	dma_fence_enable_sw_signaling(job->fence);
> +	dma_fence_enable_signaling(job->fence);
>  	xe_hw_fence_irq_run(job->q->fence_irq);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index e1651e70c8f0..dba73786d82a 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -1090,7 +1090,7 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
>  				dma_resv_wait_timeout(bo->ttm.base.resv, DMA_RESV_USAGE_KERNEL,
>  						      false, MAX_SCHEDULE_TIMEOUT);
>  			else if (pre_migrate_fence)
> -				dma_fence_enable_sw_signaling(pre_migrate_fence);
> +				dma_fence_enable_signaling(pre_migrate_fence);
>  		}
>  
>  		drm_pagemap_devmem_init(&bo->devmem_allocation, dev, mm,
> diff --git a/drivers/gpu/drm/xe/xe_userptr.c b/drivers/gpu/drm/xe/xe_userptr.c
> index 6761005c0b90..2e45e42c648f 100644
> --- a/drivers/gpu/drm/xe/xe_userptr.c
> +++ b/drivers/gpu/drm/xe/xe_userptr.c
> @@ -180,7 +180,7 @@ xe_vma_userptr_invalidate_pass1(struct xe_vm *vm, struct xe_userptr_vma *uvma)
>  	dma_resv_iter_begin(&cursor, xe_vm_resv(vm),
>  			    DMA_RESV_USAGE_BOOKKEEP);
>  	dma_resv_for_each_fence_unlocked(&cursor, fence) {
> -		dma_fence_enable_sw_signaling(fence);
> +		dma_fence_enable_signaling(fence);
>  		if (signaled && !dma_fence_is_signaled(fence))
>  			signaled = false;
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 080c2fff0e95..73ac031ffb04 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -256,7 +256,7 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
>  	 */
>  	wait = __xe_vm_userptr_needs_repin(vm) || preempt_fences_waiting(vm);
>  	if (wait)
> -		dma_fence_enable_sw_signaling(pfence);
> +		dma_fence_enable_signaling(pfence);
>  
>  	xe_svm_notifier_unlock(vm);
>  
> @@ -287,7 +287,7 @@ void xe_vm_remove_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
>  		--vm->preempt.num_exec_queues;
>  	}
>  	if (q->lr.pfence) {
> -		dma_fence_enable_sw_signaling(q->lr.pfence);
> +		dma_fence_enable_signaling(q->lr.pfence);
>  		dma_fence_put(q->lr.pfence);
>  		q->lr.pfence = NULL;
>  	}
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index b52ab692b22e..158cd609f103 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -448,7 +448,7 @@ int dma_fence_add_callback(struct dma_fence *fence,
>  			   dma_fence_func_t func);
>  bool dma_fence_remove_callback(struct dma_fence *fence,
>  			       struct dma_fence_cb *cb);
> -void dma_fence_enable_sw_signaling(struct dma_fence *fence);
> +void dma_fence_enable_signaling(struct dma_fence *fence);
>  
>  /**
>   * DOC: Safe external access to driver provided object members
> @@ -534,7 +534,7 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
>   * Returns true if the fence was already signaled, false if not. Since this
>   * function doesn't enable signaling, it is not guaranteed to ever return
>   * true if dma_fence_add_callback(), dma_fence_wait() or
> - * dma_fence_enable_sw_signaling() haven't been called before.
> + * dma_fence_enable_signaling() haven't been called before.
>   *
>   * It's recommended for seqno fences to call dma_fence_signal when the
>   * operation is complete, it makes it possible to prevent issues from
> -- 
> 2.43.0
> 

