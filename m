Return-Path: <linux-media+bounces-23438-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 799FB9F246E
	for <lists+linux-media@lfdr.de>; Sun, 15 Dec 2024 15:46:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A3FD165235
	for <lists+linux-media@lfdr.de>; Sun, 15 Dec 2024 14:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB8A718FDA3;
	Sun, 15 Dec 2024 14:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I9cIoDXY"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42899A47;
	Sun, 15 Dec 2024 14:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734273988; cv=fail; b=SUOX09McMIuPOp4I4/e+Cv5DThGHfMMOljKyzdNtnCfyi3Dvnngvh5stXB9Vb9aYzLvMLVeXsi4T1nPe77pF9scqY6q0CBFOTiigVPJUCU46HWb6uE4a7PxM9VNYP0H+tc5YWprvz8Q2HZk7TZnLzMRvhu1PVG5cNYgKtcxemLY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734273988; c=relaxed/simple;
	bh=Yv7DqgULsXphpQzxB04hmoE5lICjNulMcT6tyiCnQUw=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qdGIYigQ9v9NJK134jGOokruQNUWsM6oAkrCHqvcdZGheppPVybGrFERPjd2iEXD/Vb5ehtq70ynx0leQp5/wJNRAkvqpwGHR9F+/HG68ayRZa6rNct76WL3VcWTsZH3soCP++fdem+GMCfdQSHnBoLoYcar/Yt30TRir4kBRMY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I9cIoDXY; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734273986; x=1765809986;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Yv7DqgULsXphpQzxB04hmoE5lICjNulMcT6tyiCnQUw=;
  b=I9cIoDXYiVfjR/igduolKf7Wik7Qim9irj4Su0DLsuFqX8ip4q5QhFkz
   /QdJgbAGujuM98tsaOHunmZIubOHMxVZh6jfWbYdMXDfd/U2Eahi8Gsds
   Jb+ZH2jiyOwQEgrBr/a40qmTCHxrE4gkXMbaZQ/T4MdNN4iJ3VaaxBNnr
   jZRqqbaH43YCa+lU1hz6QJgFzuW4rQ+b0MmMDR7hefQ1x3YhyN1yqkvkR
   YNGwicc0nU31yzy2NT2yu3npB/9HI7VyvQfL4C6pJhtCEudhNlqTgaOPD
   VH81K51KZ1lWSIbzxDIznpiZLSKvNOSEtMg+ttBWHZo+zdHxYNEn5kKbK
   w==;
X-CSE-ConnectionGUID: H1zYhVMtTMihbL5PYP2YdQ==
X-CSE-MsgGUID: 1n71qPe0QhiOoSbyZAu8uw==
X-IronPort-AV: E=McAfee;i="6700,10204,11286"; a="34806517"
X-IronPort-AV: E=Sophos;i="6.12,236,1728975600"; 
   d="scan'208";a="34806517"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2024 06:46:26 -0800
X-CSE-ConnectionGUID: n2ibMXBiSbK0SiXfaXuYrQ==
X-CSE-MsgGUID: m1kW5wB8SLKN1dqCbbuUug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="97771986"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 15 Dec 2024 06:46:25 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 15 Dec 2024 06:46:25 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 15 Dec 2024 06:46:25 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 15 Dec 2024 06:46:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VSFZdFOI3SiDduiP1rcjYqjZJYs3pkCbZjWQMj3TT8mTYZDFzRvfal3eG9+VD07q62qhJD4m7CmAe6fFqOdXmLR3b4AOHZ2tv2HlxqMfJbJdMpZkcKPf91tYLptGW/IBmz+HBXG3cG1fT/krnMeyE1rckyvllfOZaRXO3F+OeUQ2IBAPja/cS7kjyQ6uDN0p6F8tj28GHEWtb608MtS+oZTHbrymcT83ROk3Cn73JqTdSSyqlggWhkMGZeOM2C5CWeG4StVCk6i4tnEGYTk+khqD69CKq/LWipT+IBbX6zGtYyS3aUIFLBcqprD+HP4Evg+NI/F7+22CLL1t1OPtvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+OPHDO4gyBXV+1Mg2r8BeA7eZj08m1pP+QAiN78OzGI=;
 b=G4y/i8Aylqokuo+gOZL/66c72nKU91UmNXMpMBY/MmKnvIsD5QqYcjnoASjC1lXzaHCU1JxwfRU3P20b2jjI1BueS1l12+lllZiRQrAQnVyl8Rf36/bxtToh64j9iE+L9XPjd1nrKaPoP5ovDkc+c6V72QVMCN/nQDsTjY7qBN0FSJR3/BPpdO5Guvq3gYVyTz28/7JoMxGapfMXYO/iNtCV1R4ylNKAm11pU6vq4iBPWI5foPk3NBifBbox5OeZS39v9sqi/GEG22uO5OW866lRPodYBEuSBjBKN2JMFuMe+4ngas1DC8000MD6RAD5/s6VVm2HuGlfgV908o1YFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by MW5PR11MB5858.namprd11.prod.outlook.com (2603:10b6:303:193::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.18; Sun, 15 Dec
 2024 14:45:43 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%7]) with mapi id 15.20.8251.015; Sun, 15 Dec 2024
 14:45:42 +0000
Date: Sun, 15 Dec 2024 22:45:33 +0800
From: Philip Li <philip.li@intel.com>
To: kernel test robot <lkp@intel.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>,
	<oe-kbuild-all@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>
Subject: Re: lib/hweight.c:14: warning: expecting prototype for hweightN().
 Prototype was for __sw_hweight32() instead
Message-ID: <Z17rjUQxBjP+5Usb@rli9-mobl>
References: <202412151922.P70dxEDk-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <202412151922.P70dxEDk-lkp@intel.com>
X-ClientProxiedBy: SG2PR04CA0152.apcprd04.prod.outlook.com (2603:1096:4::14)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|MW5PR11MB5858:EE_
X-MS-Office365-Filtering-Correlation-Id: 3580abd6-e399-4d62-6c23-08dd1d172662
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xpJfiJFZ30kjiSxxOYt5ezUpGEL9dSS8USTQByxxPt+8m+61KKSqY1zf2nCM?=
 =?us-ascii?Q?NI4GPe08KlwQXKvv2Ff1P2nvwbrJniJpMDWCmycUPhddMpN1j8tryPGLFBgm?=
 =?us-ascii?Q?7R+mv3jcYJKzfDfv4SaDDhU32bZ5ABcaXRKYtmI261sbuenMUTIH4bnunwGR?=
 =?us-ascii?Q?eWXd1cFe3Qu6hA+/E1mw8HIriyWrU4Xugtx1rqQBqvtG6tUi5eJ6UiJvoAB1?=
 =?us-ascii?Q?UgQfR//sGnewWs5dS6NBCmj6odDfu3MT4IviOS2XnSoOG8ZDAzKfEv2yu5RK?=
 =?us-ascii?Q?Xuu6sgabm8Mj1NVjLde+8qyZ1lK1UIPJ71VuL09++zMDgQq1BSR6uxe+ceSm?=
 =?us-ascii?Q?izKXIQdf3q/j/usRw+vNRQawct0RRFMYkRYNyBv153qbVxc5+Sp20NQiPqRV?=
 =?us-ascii?Q?wmSO1qV9rdfr9a+H3Rel2lNRduU4UrssqK3hMriTfa6cVMIg5xD5IiSGhZ5M?=
 =?us-ascii?Q?NMCzkM/HMIN7TDEYs26JVm7CX7GcMyhRB33uuOuxyg2t4A4sm9I/iDSkiRGe?=
 =?us-ascii?Q?x28nEhESTk66ZrWEyhFEP/DOK52iA2ahcVPzaGw8unxgTLlCPLHSTe/Rj72a?=
 =?us-ascii?Q?tnPR9z+JQLtcluZJAf01kQkQeQG1oIQ6QSRFekSs1FNKgkTTQKP2JLild2Mq?=
 =?us-ascii?Q?+qRStYx2bEG/Dr3sO0my/LZhQw5AlzRg69DOITJ2A39SbaVK4GR/uqmeg24R?=
 =?us-ascii?Q?cmK6VQnz70Rr4MjFfDkZlsGmYs1UzgA76fekVyJyaPa3HOVrqpPNmDiuB6e1?=
 =?us-ascii?Q?Dz89rvWKNePhBVQpHnIo+cbbujKghoY1dyS/gHSrQD3sCy5/m4p4CNDMdSXS?=
 =?us-ascii?Q?dMo636YzW2dSlIJaksSAJWMCSnYXk7CKxOxJVx/pohuYRIpW2ILIRmaGrcjm?=
 =?us-ascii?Q?7ZP8Hx9H5ojnbnCNHgiYkrFLr16ufaSL64XO34RKxfBc0QZDRGkIZjnEvMM7?=
 =?us-ascii?Q?G6aw1FgoIr8K/VhwFLNY3yLo4cmpGIAXQCUusqf/efMKYSkNahPS6Z/tN1OJ?=
 =?us-ascii?Q?0141NkdqW4MRCs38EfW3V8s0N6S+lMZNLczEkBGW4v+3x4FkjFSyiUfKNnjs?=
 =?us-ascii?Q?S9JI5QHsQ6+RhgZLlRVWQbUWPLMhjEiGhYwIzt4n8XUJa9gTsvUG5xsk6Shd?=
 =?us-ascii?Q?ytqlyMXZ7wKYXtwdMN5Xi1H6uwnIVaqK4s6usIzkgqCVmN6E7y1iGivvy+Mz?=
 =?us-ascii?Q?SodHHp4oB4sdlTJBh2R1dkPEW05SkhNmjUx590IrsMJH96JODUJ+QE+ea5Sv?=
 =?us-ascii?Q?5zr+RGRFHT6ZCuHQYPrxWX3Tiha9cHxjAED37Y0jaa4eg+NeD6/j4PQZv4L5?=
 =?us-ascii?Q?cqGg9ANl7ZwN2vjdK/1BoGOwkN1NcEQQjGhMD3C1YJ3vWg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mEf22k2ATJH6AnIKXAfPRYDmagQ/onq7oDzOFZg5UlUYDXfYk87yZ0825m94?=
 =?us-ascii?Q?C+fUH6Rqc+UzNjghN869BXWoDAQoa55GaOWeWvTEZoPTBso8a6DxXdCqkhde?=
 =?us-ascii?Q?c7ogeAM+SXZjXW+nxXmA4fh7lSns1RKVVtWuOUIzzewu2gEOnLhpKg4Vi2wH?=
 =?us-ascii?Q?b7JPlG/JrynO0rIuFhpspfNIWPHOJ8QtmWiKsHVoimhnMJB/fLtX/rsnUvDU?=
 =?us-ascii?Q?Mj3wn3isyP/rXfKymu7EcWD4OpmbMqBishkW/Zo9WEcQKs5iYTqv+ceeNuF6?=
 =?us-ascii?Q?hsdoKrdUg2B3KDlaGW3ExR+KDgmj5fZcehbiZbPqQowUjXwkCLaXVaR6AQZT?=
 =?us-ascii?Q?WpyF1/6vFejfls10+1mTSf7/DNru/9KqwR96m7NFb8i33qdHhcQkS9L3n9LC?=
 =?us-ascii?Q?Gzu9Hu67hEFxcc6I0mf7tk1+MzcxeumMwWNqhKsbQhhqhrsQUPsNu+fwUrcB?=
 =?us-ascii?Q?OT01xrT5b/Oma+IvHvXW/9rfEpMS14apwBsHJaUhz9FdskLmCkX537g1rVfL?=
 =?us-ascii?Q?MyvMBYT3YLomucPxisXzZeebkyXXOzctIJiwcP5185geSj5EMYGPRSqmH5vG?=
 =?us-ascii?Q?cTbpALbcBxkVHHb1nXrkONiFuyZ/FrZI0RCQPQO0MYICpQLtVnQjKlUXaa6m?=
 =?us-ascii?Q?lo1ZgHAdsJNRPLbZlyAjuRGCaZDMKzjt0MJyKHfzmKitTD0KygdxV/RQ4dGB?=
 =?us-ascii?Q?1f9H4UawTVpsA6ljuFcr1NTqkx3hFd8ZFRrA5Vi2MyXzkUx3TdO8m3J9mZuy?=
 =?us-ascii?Q?KI4qvAHxKKeI5yo/DVP3ZSloTCKubRuta6vYv+d6aHuNmboZTEx0gVpTuTZ9?=
 =?us-ascii?Q?6lHaMtzUPa1f9mZ8mCV1qQn2kE2m3paI1UKvVqIcbL9WHerlEgaHVDGxk2dK?=
 =?us-ascii?Q?IN7jTrm4F4j5e27fzRfJqZKnggZZ3OQlA97AAvpXAdZm3N9BlU0Ht8BqXvHD?=
 =?us-ascii?Q?Dt8Vo4D9Gk+7evb7mYJSZzU3i6iCLleQIoPpQ3hPj5KFNUxMrDwzj5YJdfnQ?=
 =?us-ascii?Q?vRWL2h0tpC7qXfGFeo9YTShf7FefAFHBcI7p27Ny7QVlibjsMrD97Su1tyFL?=
 =?us-ascii?Q?rx3F+hkCpmbBiH1Ild33gCPVZ2qvbiE99fZux7czPd6fZqCf3riR/Jh6G0c0?=
 =?us-ascii?Q?VNQJ/T79M9Wnoa2FLSgrPMrwvKGG8NCytsz1MftjBju4ug+oEY7Fz1grwpWr?=
 =?us-ascii?Q?D3buGaE82kKpuMypPauxIuzAjqMCV4YnUE6sWYGYpxHbjL8F+Z1uKuf5mQuo?=
 =?us-ascii?Q?+95b3eNZQs4qEdet9QghlJCt1tC9jQu4QvzdVyX2iHbb0vjGa6xbnlTbNNZk?=
 =?us-ascii?Q?tdDsShzx2cKq/03ejdkQUaaAsAjTmjn03Lq6gVTVNCOsqYb6kchvkANjAdvN?=
 =?us-ascii?Q?RtjYrQXKuenvN7+KtZSZvlzXimY6OmwWWAMfeVZCvIgCVAuGtTKuDysvvFkS?=
 =?us-ascii?Q?sTzYAo7mt6LamMyAcdyx8dh0qlVaKoKzniHLmyCS8oiNwUJ8XNhXWdWnWtrV?=
 =?us-ascii?Q?kvvz1rRecZUoZbxGqpuEZu2jN3F04K1quRyy+LpIJAjbDxgCAFQyvD2IPgUS?=
 =?us-ascii?Q?bANl6q2d0xekd50EOkBgx9i4i8PD/kqqDrT4L5Di?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3580abd6-e399-4d62-6c23-08dd1d172662
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2024 14:45:42.5037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h4A94Iaf/pK/b68hjL0bvHjgj7qJfyW9iCL6bUzUArH7wAFuLqEe4Qq6XbLnRgmnMmFqYvIL+Tn2UjO2kDH2fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5858
X-OriginatorOrg: intel.com

On Sun, Dec 15, 2024 at 07:34:16PM +0800, kernel test robot wrote:
> Hi Mauro,
> 
> FYI, the error/warning still remains.
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   2d8308bf5b67dff50262d8a9260a50113b3628c6
> commit: 52042e2db45290f6a512d525518488b7bf143531 scripts: kernel-doc: validate kernel-doc markup with the actual names
> date:   3 years, 11 months ago
> config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20241215/202412151922.P70dxEDk-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 12.4.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241215/202412151922.P70dxEDk-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202412151922.P70dxEDk-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):

Sorry, kindly ignore this report, the commit is not the actual cause of
the issue.

> 
>    lib/hweight.c:14: warning: Function parameter or member 'w' not described in '__sw_hweight32'
> >> lib/hweight.c:14: warning: expecting prototype for hweightN(). Prototype was for __sw_hweight32() instead
> 
> 
> vim +14 lib/hweight.c
> 
> 3b9ed1a5d2d121f Akinobu Mita    2006-03-26   5  
> 3b9ed1a5d2d121f Akinobu Mita    2006-03-26   6  /**
> 3b9ed1a5d2d121f Akinobu Mita    2006-03-26   7   * hweightN - returns the hamming weight of a N-bit word
> 3b9ed1a5d2d121f Akinobu Mita    2006-03-26   8   * @x: the word to weigh
> 3b9ed1a5d2d121f Akinobu Mita    2006-03-26   9   *
> 3b9ed1a5d2d121f Akinobu Mita    2006-03-26  10   * The Hamming Weight of a number is the total number of bits set in it.
> 3b9ed1a5d2d121f Akinobu Mita    2006-03-26  11   */
> 3b9ed1a5d2d121f Akinobu Mita    2006-03-26  12  
> d61931d89be5063 Borislav Petkov 2010-03-05  13  unsigned int __sw_hweight32(unsigned int w)
> 3b9ed1a5d2d121f Akinobu Mita    2006-03-26 @14  {
> 72d931046030beb Linus Torvalds  2014-09-13  15  #ifdef CONFIG_ARCH_HAS_FAST_MULTIPLIER
> 39d997b514e12d5 Akinobu Mita    2009-12-21  16  	w -= (w >> 1) & 0x55555555;
> 39d997b514e12d5 Akinobu Mita    2009-12-21  17  	w =  (w & 0x33333333) + ((w >> 2) & 0x33333333);
> 39d997b514e12d5 Akinobu Mita    2009-12-21  18  	w =  (w + (w >> 4)) & 0x0f0f0f0f;
> 39d997b514e12d5 Akinobu Mita    2009-12-21  19  	return (w * 0x01010101) >> 24;
> 39d997b514e12d5 Akinobu Mita    2009-12-21  20  #else
> f9b4192923fa6e3 Akinobu Mita    2006-03-26  21  	unsigned int res = w - ((w >> 1) & 0x55555555);
> 3b9ed1a5d2d121f Akinobu Mita    2006-03-26  22  	res = (res & 0x33333333) + ((res >> 2) & 0x33333333);
> f9b4192923fa6e3 Akinobu Mita    2006-03-26  23  	res = (res + (res >> 4)) & 0x0F0F0F0F;
> f9b4192923fa6e3 Akinobu Mita    2006-03-26  24  	res = res + (res >> 8);
> f9b4192923fa6e3 Akinobu Mita    2006-03-26  25  	return (res + (res >> 16)) & 0x000000FF;
> 39d997b514e12d5 Akinobu Mita    2009-12-21  26  #endif
> 3b9ed1a5d2d121f Akinobu Mita    2006-03-26  27  }
> d61931d89be5063 Borislav Petkov 2010-03-05  28  EXPORT_SYMBOL(__sw_hweight32);
> 3b9ed1a5d2d121f Akinobu Mita    2006-03-26  29  
> 
> :::::: The code at line 14 was first introduced by commit
> :::::: 3b9ed1a5d2d121f32d2cb4f2b05f1fc57c99c946 [PATCH] bitops: generic hweight{64,32,16,8}()
> 
> :::::: TO: Akinobu Mita <mita@miraclelinux.com>
> :::::: CC: Linus Torvalds <torvalds@g5.osdl.org>
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 

