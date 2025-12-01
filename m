Return-Path: <linux-media+bounces-47995-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EA6C98DD4
	for <lists+linux-media@lfdr.de>; Mon, 01 Dec 2025 20:34:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B4F23A27B8
	for <lists+linux-media@lfdr.de>; Mon,  1 Dec 2025 19:34:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32BE423ABAA;
	Mon,  1 Dec 2025 19:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m4Qc88YU"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA581E1A17;
	Mon,  1 Dec 2025 19:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764617651; cv=fail; b=gFVAnKwLIVdhza/sdaTSf4TWEY4bVNig7uFZ7uLkWvARugG1RM3Lydl+EnSXSqiBHw1BsbAayhwou3XjvTyBiy3l8MeEr+ESEf5j7HY5KXXsqRSqdpcRpxVxABm8paXcxUziLtSatOywEkmLUs42eL+BhDggjhSvXzmPbmlqcmE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764617651; c=relaxed/simple;
	bh=emSgNlA/d1VdpfHj1K2m1alaafpUwAOujwOVyBnGlMU=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JXZNaeQ2YmcjO4LFELaJm0/3kkcPyIH7brPQW414NkJZt/CwwFlRQroLXxWCNJKa0pwfB1TV7W/RRaGsLbZU+2+JUMm3wrs0PhBZGEgeE7SbT5SO5cObWabjI7Qr3UU89ihOHPIMB3S/sAhFIswcormV+UDG0qbvsr0TMcRVGnU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m4Qc88YU; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764617650; x=1796153650;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=emSgNlA/d1VdpfHj1K2m1alaafpUwAOujwOVyBnGlMU=;
  b=m4Qc88YUfamKOcxlj8QooejhBhIR9nnvWGHdr7S5+Rlkz1EZPmoPMn60
   yG0PXgvXMTTiN7iCnHyOPbjYIwITvZLOMeiwt+NOAewt78wDu+vnnpNd3
   Yz9YKUCBaerHjAQEjSzIz/T46aMWQHySES4cQ2e1bOYnOSawv+WBppEv/
   XJnC7DNLajidM+8GM5G2ZkmGqGW0KfUh9bNRb+bblORVxL/PXFIlJruuP
   3jLQpVbMXpYm0e75Fqzwd8RZfrHbDuAVoGx6oJsCvkKEHojTclqJMhO9I
   th67RyZHM12Iiy4sNMFyuKxpNijuMEpDRSRG+9IdOvbSfdFLLY+5+RwlV
   Q==;
X-CSE-ConnectionGUID: 8LfPZaU7SiaE/ngUBe6t3g==
X-CSE-MsgGUID: /P58gF51Qyyxc78OBp/F4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66607100"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="66607100"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 11:34:07 -0800
X-CSE-ConnectionGUID: I00kCBMKSYGsDjNfLv1K8g==
X-CSE-MsgGUID: 221y7yD/TZ6b26NfJXhTwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="194954498"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 11:34:06 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 11:34:05 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 11:34:05 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.43) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 11:34:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YyTReQLC5wzhzJ0YfOYSneLflNKtIcRaM17/4g+R25ucxFn7LVb2jjdyfJHGgSW6x57wtE0LdKeBR2Q+2QJr7YZRFQTmPn1smmh9A1gHGxw3hZKCH4Q/8ty8KU0P1GxyL8jxIzQKHOY3v5AgRV5CoH4X7ClOrNnC4Rt31VJx5FsLD17rqD9JFbizk0LMddtlHxxZa/RUQRZjNIP5WF/EuBLAX3SqqLHn+SsNLNYvWb2bMlBkzQZBwmOXIa338WSa+bBbjvdpiDedKWNK6gnwobBNCrF9xPKR8C8Oa41fSwQQy6s9MESbfooc+y+bOdZCSJ7iZ4y9bzFzn1a0C+pSPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0JfaFhvYMVss6c4XFD1ikaJIZMkDWb/pC22LE1GnAS0=;
 b=RctqGYKrc6Xh/nOZeH/alP8OURpULPwl31NXExBjLXAc4BI3OiM/6XOe8/SrJ6FnkxdrQKFninS3Z9n9sZ16m/VeShWISnf7gLAjfXXWS78Xty4fJHBzW4L8VajdOTfYI2uLCGbXzQqdfPMcVISoFI6Z/TMwK8/L1CMdqbAO9bHTq5SyYBTT2j2Ol8kIPmSoTAkqgp0yvmKXFNSjHEOKCizLwMu2nUnwtFYt/2xq8VCPVKhmjUam6dqei4PAVpsraIX6/Sx+Ow9HbTgYVnAjbVRmbNGkSIZ5eVsFc7t7qakzvSwgxCfzeq9CXLw45dNDVo5Qje818WPWnLSpCzIwoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM3PPF1A34EE115.namprd11.prod.outlook.com (2603:10b6:f:fc00::f0e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 19:33:58 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 19:33:58 +0000
Date: Mon, 1 Dec 2025 11:33:54 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Philipp Stanner <phasta@kernel.org>
CC: Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan
	<gustavo@padovan.org>, Christian =?iso-8859-1?Q?K=F6nig?=
	<christian.koenig@amd.com>, Felix Kuehling <Felix.Kuehling@amd.com>, "Alex
 Deucher" <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
	"Simona Vetter" <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
	"Joonas Lahtinen" <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
	<rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui
	<ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Lucas De Marchi
	<lucas.demarchi@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
	<thomas.hellstrom@linux.intel.com>, <linux-media@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
	<amd-gfx@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
	<intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 8/8] drm/xe: Use dma_fence_test_signaled_flag()
Message-ID: <aS3touSB1ZyR2hfM@lstrano-desk.jf.intel.com>
References: <20251201105011.19386-2-phasta@kernel.org>
 <20251201105011.19386-10-phasta@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251201105011.19386-10-phasta@kernel.org>
X-ClientProxiedBy: MW4PR04CA0315.namprd04.prod.outlook.com
 (2603:10b6:303:82::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM3PPF1A34EE115:EE_
X-MS-Office365-Filtering-Correlation-Id: ee041753-9b9e-407d-4569-08de31109236
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7GK0tplFJ6S9wYnb4pzDoEfVbbiLfWgyl5bdaGp0YelOcC3tWqfb91q+1f3m?=
 =?us-ascii?Q?T6noG6d/HPg+U1a+iaa2AURGTwT4wVg09GbRRID8JUEvxAsi3xo2sJ5ZhvLg?=
 =?us-ascii?Q?Jp+Fnzyc8ZlA/exbKAiq5Um17K5951LMSEpxAk5KZ8poUhsEl8qcLxwlqqjC?=
 =?us-ascii?Q?zKMK6S4M7OZNT859h+4Y1KMtMfohCDOPfP47SaELHdTyDFXt0oqKPUoBDxAV?=
 =?us-ascii?Q?GfkAPu0Yxe8v+/N5Qyun/9sjkGICnotvpBN+vWr5BZPwnbdjmqZhXyu0vCzD?=
 =?us-ascii?Q?fM89wK3+mwEK5aX62NlRMiqJS8onih+Ix9zy5/pD6KvGh01wezhwa+lcvwn6?=
 =?us-ascii?Q?XZqKrxXG2LdCG9KyxkSDcPogb67Ozkx2oISH39wfR4jBPnPcl636m2Deq4fl?=
 =?us-ascii?Q?iVdbFUUz3r1Ti2f9wdCBS2vDxycV+lizuJnuxye7+588E3K2H3dNv+6ahvwx?=
 =?us-ascii?Q?aTnhnYAspSTI189G8hnosjDlHPbI/o87Uv9777JY0zoe3y7UyE23I+8q7Nek?=
 =?us-ascii?Q?HI65bxU/XqQ7iV/AjVEG9sc1/CMTtpWJzzPKO48DyGP09yW1c2VEqSNx6muj?=
 =?us-ascii?Q?U4hXBPAUhiWgLYh6EuEWpiWE4GljOp/obkKQFYOP5dVNCnRIlVa56gaMaAD2?=
 =?us-ascii?Q?vJSzdn218VDICi6vxCovBfYvr2i5nLVzw2Hh/LViDjIDRnoT99cC48TrM6iO?=
 =?us-ascii?Q?NBtzCK9GrR/YPtwmW+NlPLvgYyBgDOuMUPAfJHGJw2y781dDOkzHrAYZdErn?=
 =?us-ascii?Q?0TxLjMxqHE/xcb6uaVRA94gZlKGTySVrAMX777ip25oaPFKKdENDO9+jJ8tw?=
 =?us-ascii?Q?aocjmZlzjZ8eTsH7y3rt466jptvUrUboIeSVV+iNtcFOhBWe1ROkQmgbU6js?=
 =?us-ascii?Q?nYlfs9Kzs119kl3zo6nhQYVjDN9Jgwtnr+V+owUDX6kKivtB06J4QqA0bYfW?=
 =?us-ascii?Q?2V2REF1zCc2JJgGwQiu0cRqYxe/X4VMHTL21OZv71v1Qu49LhkPjZej5PvjP?=
 =?us-ascii?Q?k1lsZq1Lfm1eS12otChMOM+IhpCUJ1eoJODVZElg18vvh0GHnvbow958JWMY?=
 =?us-ascii?Q?F3J0uov8/pL0CbrFbwEk+FfjGCfNXMVN2BdxIq4KcLj1uJSRrLBwKVLgLEMr?=
 =?us-ascii?Q?C09rVIFhLCZX3/d+Q2p6oauUQ3eR53kkGPBzYREe9Guqbs4ZNVNEGq0Wp4As?=
 =?us-ascii?Q?4+IL2LAyMZO5t2/5YUpNzUBN5+Vgjg4UYHo9YF1nWU4Dsn2plNhiISVYiO0R?=
 =?us-ascii?Q?nx8yfnQLZQHkojgrOXP2dy16Nk5lCrPfNvIs0PaNM6nJORKsguKg8nTD6+jp?=
 =?us-ascii?Q?u9EmJwWlMBAS9GyGSeIUKvgycT98bajoHmoBRZOI6mAkwbtgcE1AaGqx82au?=
 =?us-ascii?Q?lO/rgU1BFmRroEZ9TtJ3/nFxmxCt6y/jVPueRAh9t5WNUfv8ZNADykKcqR1a?=
 =?us-ascii?Q?QX1l2/qBmf2BDiYHsbbNcHLb874n0zSy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6522.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8v9L5y3ENpuZPuXPEuRoIEwv03bSzNmAReUCnRwButwJ1xjcT8M4NO/kV6PW?=
 =?us-ascii?Q?UBm/jiltuXkZTmREDb3UZ6YG34MJONiOa0rQUcXqG2eGksnDEQNSYTOqpr7D?=
 =?us-ascii?Q?V33hmP07cEIO9z1jdQKadgO3f1vtRfsELGYHR9OoCDjUm3TJOQz8xLO7CvWd?=
 =?us-ascii?Q?/2PdDOzHYsfyTpSPWu9qwVgLqORZr+latLflWknWWU9Gnvolk0TrMJ5TIYx8?=
 =?us-ascii?Q?RD0OwNHqK1qyvZq3KUSRhj783As7k2ICGdmN+ov6YqwSdhMD+rmNWU7tQF0x?=
 =?us-ascii?Q?ECxcudHNx9Fi+5bLG1m9ycl+FyEj+FnSErU3pashVNmhwUbtidz3nERxs+Ts?=
 =?us-ascii?Q?8LZ9eo/i4r9pMrYGf9nARrRWT8OnNM9oET4fH9i9OX/bbScN2lQdV9hRWgBJ?=
 =?us-ascii?Q?48f9opERnh5bQw+anbjbFOINhXaaXOpfxAgNF9CGjeJaVpzXc6pA7BXH837y?=
 =?us-ascii?Q?PTPNlHgbKTm2J9rZWK4oyIi9HaLCreRU74T/GvTnn+LBUkMsyhAyCKZx/6q7?=
 =?us-ascii?Q?dt9pt3ql2Qerhehzh3iX2NDEy/P4eGw7PLGx/q4ezjOL3IeldFiZTmzF+wlw?=
 =?us-ascii?Q?rErXIbE+Rwb6voF3flutUe0NOUhfTRdZYrYHJLt0/CFhO9fxjwGmfrjrM8ka?=
 =?us-ascii?Q?CRSsVb0oY0YYwm1L+S98m+WJ2AmDWaaPHAf9Jq5ONB6+BCHrXKczbWCMDEvV?=
 =?us-ascii?Q?B/uQZpAHUl9fBtWaHfpLdW1pEV1qJ95za8A/MIw8LUt/fsYxgXrUP70excxF?=
 =?us-ascii?Q?r8wm870qsdeZ1lxIhA7N+qSKVZ7Cz+Fv53WWPvr66f4cIeRdQwZzL7AdFQNh?=
 =?us-ascii?Q?R38eeJdUGsGDVFancPk7p1ePh8XHZ3jAUsS2fasduNTttDaKvhKwgupZocFp?=
 =?us-ascii?Q?EVyrymFdzalTVsXXnlOoLAP1ZUBsm1rjARxkTFq+pLfWJgm3YPXuBJb0bbXw?=
 =?us-ascii?Q?YPKU3zdLhAN0cEBciyvmyXjpTME76uen9HqEVc+GtOekgKlHz4R2Xda8W0xz?=
 =?us-ascii?Q?6BnVwpF9q22ScdxbZUpjVKWDVgdQQWQb5WmvToTiXSjG8mLH6CNWHVi2Qtav?=
 =?us-ascii?Q?FD7SZyN273FO4hcUOJP8UZ1Dki3RyvNc6z3r0SOef4+FNNIoj1r9t9BDACiI?=
 =?us-ascii?Q?bxKjVKl7PE2vhlq9l+2ltAvCPtWyfAy677UY53eIw/3gXV8KMKKfIYyg+GEz?=
 =?us-ascii?Q?NaX7q5u1LOFU/prF/5qh6ZMiek4P/GGPAlOg/HSFe5pNECyP5Z8mNRZoNxm0?=
 =?us-ascii?Q?hCaMMdlG4ypL0Rx0n6lPUQRV5ss6YuWQfMLmGXe8aYeFdUajPiFD5nI0uKvK?=
 =?us-ascii?Q?RyiZJvB5dYeMh8jKOgt0wqiZ7YoIvNC8Oe6plQcEqEpK2y9HhJ2AuDIbI4sW?=
 =?us-ascii?Q?44rvugz6YH5CHIEzxrBAT3i3YvFUVPd983TGqFbvIaiW2P1i2z32jcVVA51Z?=
 =?us-ascii?Q?FBUODBLFGI6VpcWDEcEKMikKV/pphy2qEQcx3yTwSxm1xCDfOLLNr2Qw0Zpb?=
 =?us-ascii?Q?9i9Pc9PRFcFqwATF6aMUKjpZP9lmWJtkrqcMSxuCYwReQtu2vXs6QfgnaLpq?=
 =?us-ascii?Q?RApO1vzzBem2/CERRcXkyOWIUbL+kdojh6FJsWqinwvTNkvNl0Wni9S1E/Vj?=
 =?us-ascii?Q?Bg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ee041753-9b9e-407d-4569-08de31109236
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 19:33:57.9396
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0lPuLw8dUS5bIqDXf1tVsRNctWrdqj6IFVDCPiwBKeXeoYxlqg3wKiJKhvrmQE/evUvCu5jqKjoGhYem4cds1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF1A34EE115
X-OriginatorOrg: intel.com

On Mon, Dec 01, 2025 at 11:50:12AM +0100, Philipp Stanner wrote:
> There is a new dma_fence helper which simplifies testing for a fence's
> signaled_flag. Use it in xe.
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c | 9 +++------
>  drivers/gpu/drm/xe/xe_pt.c         | 3 +--
>  drivers/gpu/drm/xe/xe_sched_job.c  | 2 +-
>  3 files changed, 5 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index cb5f204c08ed..06736f52fbaa 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -1037,8 +1037,7 @@ struct dma_fence *xe_exec_queue_last_fence_get(struct xe_exec_queue *q,
>  
>  	xe_exec_queue_last_fence_lockdep_assert(q, vm);
>  
> -	if (q->last_fence &&
> -	    test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &q->last_fence->flags))
> +	if (q->last_fence && dma_fence_test_signaled_flag(q->last_fence))
>  		xe_exec_queue_last_fence_put(q, vm);
>  
>  	fence = q->last_fence ? q->last_fence : dma_fence_get_stub();
> @@ -1064,8 +1063,7 @@ struct dma_fence *xe_exec_queue_last_fence_get_for_resume(struct xe_exec_queue *
>  
>  	lockdep_assert_held_write(&q->hwe->hw_engine_group->mode_sem);
>  
> -	if (q->last_fence &&
> -	    test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &q->last_fence->flags))
> +	if (q->last_fence && dma_fence_test_signaled_flag(q->last_fence))
>  		xe_exec_queue_last_fence_put_unlocked(q);
>  
>  	fence = q->last_fence ? q->last_fence : dma_fence_get_stub();
> @@ -1106,8 +1104,7 @@ int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q, struct xe_vm *vm)
>  
>  	fence = xe_exec_queue_last_fence_get(q, vm);
>  	if (fence) {
> -		err = test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags) ?
> -			0 : -ETIME;
> +		err = dma_fence_test_signaled_flag(fence) ? 0 : -ETIME;
>  		dma_fence_put(fence);
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 07f96bda638a..1ca2dec18e51 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -1208,8 +1208,7 @@ static bool no_in_syncs(struct xe_sync_entry *syncs, u32 num_syncs)
>  	for (i = 0; i < num_syncs; i++) {
>  		struct dma_fence *fence = syncs[i].fence;
>  
> -		if (fence && !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
> -				       &fence->flags))
> +		if (fence && !dma_fence_test_signaled_flag(fence))
>  			return false;
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
> index d21bf8f26964..1c9ba49a325b 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job.c
> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> @@ -188,7 +188,7 @@ static bool xe_fence_set_error(struct dma_fence *fence, int error)
>  	bool signaled;
>  
>  	spin_lock_irqsave(fence->lock, irq_flags);
> -	signaled = test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags);
> +	signaled = dma_fence_test_signaled_flag(fence);
>  	if (!signaled)
>  		dma_fence_set_error(fence, error);
>  	spin_unlock_irqrestore(fence->lock, irq_flags);
> -- 
> 2.49.0
> 

