Return-Path: <linux-media+bounces-48601-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2E8CB4262
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 23:30:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 473583079A19
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 22:30:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D06F2DE1FE;
	Wed, 10 Dec 2025 22:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ffR0Ci6i"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D93C28CF4A;
	Wed, 10 Dec 2025 22:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765405798; cv=fail; b=ScfCUB4iQkP4FVhoBDew2oajXYsT+cBRJ7x99lSbo9/61bYNyo9QO++mTma7muqDrH5AGOPDYn91CO1RvBG+e3rJnkexyio1pCMTeBqVojyAza8GuXK5tKU5a6bLIVLN+7A2XUh6GREaiDd/kYVvw2eOjwHDGD+GJX5h3rm1C1M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765405798; c=relaxed/simple;
	bh=t5T+YHb6qKxrdId1SIWj0LbOfFh2qUs0dZ1/FFY88j8=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=a1G7MLkihCdB0CEK6ytZkmgkyMMLU3zJam3Ftj9nO0Kb2Ps0uYq8df9M1jT4vAnxCsZvzPR5LyFgRLMFV4R3dFmAnkuYib1CKZqLIEWjq3QKum8SHSqNbB5+9OAYIEmBVZsIg+Yqug7Gz9fSgTA1FB3qN73SnT+3KQF1HU1Dn8s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ffR0Ci6i; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765405797; x=1796941797;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=t5T+YHb6qKxrdId1SIWj0LbOfFh2qUs0dZ1/FFY88j8=;
  b=ffR0Ci6iJAPuEn2XGwarcy3nSe+E5csEbmSuh9PfEd775WoI3mbfXLS3
   bKzFE6AHzOhj7Ews9MP5rUJf4LaMzhxBA9bs9V88BcJlatv6WQejKE9LW
   K6dvE6/ySz/xcl5dCfajMDY5duXTks1zeTlMGmWX9othDbcNedOTa1R1j
   X8WVHGSPdUE8/HKpiDOlZMMXhcAQ6zrxSLbFDSqOdfh0aBo3xC6uWzFaT
   Nw4wKKdZkCqK3PoX1Eq8DH/iyiZEhoEyz8H7FgQMHukC10XtRLi59psUI
   9DskZggXibnnwK15PGwzVf5tSEEs/4kOLXFX/MxjsBcNKkKyd8JKbkh9L
   A==;
X-CSE-ConnectionGUID: 1hDY8bs9RSqZxMdtWFjutA==
X-CSE-MsgGUID: yCRNHdrtQ+6i6f1kBQnciQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="67556231"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="67556231"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 14:29:57 -0800
X-CSE-ConnectionGUID: /3WKix7GRS6yp3zpNSbw4g==
X-CSE-MsgGUID: VYbmU5OZTqqECkW6MafUmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="234050232"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 14:29:57 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 10 Dec 2025 14:29:55 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 10 Dec 2025 14:29:55 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.47)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 10 Dec 2025 14:29:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G7Uf5nvd21e0q8DJmeizrYlcnr5bkq0vvTuKHzz8+2blliLPCas5Pbl6R6WLSiw0asgOEiUzOkNYld4B/jI2cc3aY1ylaxjT0OGrhYnSaDlOyP8C/s+0WVe7RUjwZ3FZN7ZhOtWMrgVHPUtNhDu+2koIh3bnPsxOvcj+t8fKB138dNihOVe28gt2Ja3PNuH0CgPdfpknTdAR5OXh0JXiugvWKZ3TTInWsEpU8XYl0OtEOgoGMIFdzr0yjiArtp8npb4Rtno3FE9ndaECEOM4520uOnq68AoOJgeni6UfFOJGUnAmJnyL6poUgrmaZ0PSmfIMe95+PPzgjeg1li05vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Uo6rbQUdzNMjHsI3N0CcMxBxxOHtxwu8R5asRsDrq4=;
 b=xGz+yP5DBMzTw3YEkIsqPaeNCOOT2T7z4xiROGY6WHyqjNwoXrNk/b2LC1KhbDQn85HlkjpfASqbtr+fqDtRn+7UFfBaDVB3lOyDDPFhw52XGn2SCt6afJM90aeQWJ0iNxSpULuTUkRjYhF6TZzBKVYs9SXG8I78joffSIJx8VOdm17KjsHgWHIqRnhYDupB04L3BcSmQU+V0BhEl+f7NDGAdVOairepGPl1W+8tB8dq5RqWAc0uB2tHeLXCNtWGzOu5lmrxUGwm0dDjP2Iur7BrQmdGWIVZsgVl+kmxKGcxVEVIPOmv4uY+jqOeBxi0ek4rIrqfM9v7RG91khDwVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by MW4PR11MB6620.namprd11.prod.outlook.com (2603:10b6:303:1ea::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 10 Dec
 2025 22:29:48 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361%7]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 22:29:48 +0000
Date: Wed, 10 Dec 2025 14:29:45 -0800
From: "Luck, Tony" <tony.luck@intel.com>
To: Sami Tolvanen <samitolvanen@google.com>, Dan Carpenter
	<dan.carpenter@linaro.org>, Chris Li <sparse@chrisli.org>
CC: Daniel Gomez <da.gomez@kernel.org>, Eric Biggers <ebiggers@kernel.org>,
	Kees Cook <kees@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, "Rusty
 Russell" <rusty@rustcorp.com.au>, Petr Pavlu <petr.pavlu@suse.com>,
	"linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>, "Malcolm
 Priestley" <tvboxspy@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-hardening@vger.kernel.org"
	<linux-hardening@vger.kernel.org>
Subject: Re: [PATCH 3/3] module: Add compile-time check for embedded NUL
 characters
Message-ID: <aTn0WdVv-S_EpQmS@agluck-desk3>
References: <20251008033844.work.801-kees@kernel.org>
 <20251008035938.838263-3-kees@kernel.org>
 <aTc9s210am0YqMV4@agluck-desk3>
 <20251209001139.GA7982@quark>
 <d3dd8fc8-ab46-4cf1-87a9-0324685ba2e0@kernel.org>
 <SJ1PR11MB6083C6D97484ED4E4710268EFCA3A@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <aThSGiKwJRYOB6kx@agluck-desk3>
 <aThqcq0iGge1pQCr@agluck-desk3>
 <20251210010020.GA2522829@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251210010020.GA2522829@google.com>
X-ClientProxiedBy: SJ0PR03CA0234.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::29) To SJ1PR11MB6083.namprd11.prod.outlook.com
 (2603:10b6:a03:48a::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6083:EE_|MW4PR11MB6620:EE_
X-MS-Office365-Filtering-Correlation-Id: ccd3928c-baef-435a-fb15-08de383ba060
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zaWzGqtMJhVR/bKc8cXTqxn+lJbY+d6pjQIszlWPcQHr2e3ZKFQnnHS4aNbe?=
 =?us-ascii?Q?ZJsSHmuNvJPG0WGTvGL/h1/IJe2Q8H/mpTmLiUTlhlOaJ7eHV69SvgJyclRS?=
 =?us-ascii?Q?HsCNj2Ukz31xyKoBKG02YFHAHN9vVtV6D+ovjyN3dp3fj+pgITEaUTdjEp6V?=
 =?us-ascii?Q?pstSvj5IOLjtuzBH1hHi/n8dmVqPVegzX002cSruNPk/Pw6Q2jwJuS7d96xc?=
 =?us-ascii?Q?yk6Tc2dJAd/KtMqUSC7hIOqFHd3nhbRXPFMORlgNDgzmj86sH2ieZTZygVHK?=
 =?us-ascii?Q?B7dFDW7FHARZzBMvrlI/2USkkb0NlvU8sEBTMcuu+UEgBJoXfhuxR6FudWB/?=
 =?us-ascii?Q?fo+RZp+iIoXG1NRTGHwbxolIGgMGmP45iraS8rONv0wDRtqUgKYI0GrXoEtl?=
 =?us-ascii?Q?J9HrTd2BKCee1IpuZfK1GUPHjwgOPvI70QeqjYMLI9+gMB1weebSB9ajpdaz?=
 =?us-ascii?Q?tlruy9HIm7g67QAM6wxA11XwzhDB159KDhvG6uKAsiSKnMb52IfcZrbRSS/p?=
 =?us-ascii?Q?TIdjPNB/A4iP1AVKrblbaMTFMTPWUYivuZq2vkoF9NNF6ce5u3zUcwgUhyJx?=
 =?us-ascii?Q?dMATsjh2sb99tbGHUHUSmcjNxDND7d14C8xJACqv+dDiyPblRhXkUSJiviwb?=
 =?us-ascii?Q?ayQQg1kZMXNjEhE02Gt5qQ/3yGy4z1qQAigKzypE9SkePI08lb5cY6BE+4uI?=
 =?us-ascii?Q?0B6Y8yMDDCd7PwfSZ7Rh/YQZdfq41FgtJuiKaUMPVmiXHdbj+n4xZR7UF81f?=
 =?us-ascii?Q?JPTOHaLSGO0N2rr6Bbi4Dd1K6r0L0Cq+wXlcyYs3jM50RZur303dYv4j5TT8?=
 =?us-ascii?Q?Kq1QGMPCMWUCsCXWcnATEc+izvu8zQzLEl2WLrv06KPHXW12qLq3cN8MhSgh?=
 =?us-ascii?Q?CZdE14/Lw3uniAPPfW/Aznm1QH04aXpPLgjfGgvPqOwQNHrsmAXxc3zfnjMt?=
 =?us-ascii?Q?Kbt6aDYDtTz7hPfM+cwH4Q/eTCCwCbP/f5l7Uy2gNS5uz5zqsJvxap8EF1D3?=
 =?us-ascii?Q?bbR1bY/u1C33mu/Qdi8U3jdNsy9S0dKC0kqB2qc0ktYHgnNl2VlfT8ksgWT6?=
 =?us-ascii?Q?i2Thihqe+QHe5RQeSVrlr70vlLvprkflHc5cDYwWq/BHTsR7NExuFYFbMRRP?=
 =?us-ascii?Q?WZ/jp53CgScyg0euOvq8hUucrWNlODjP+Dr7vHajNdVx+XDL4hH9dTgFrnsY?=
 =?us-ascii?Q?EXXuG7Y4TViFBQ+MbRRArRLCzHvnhPAifiR/jH6d/FbDCrAVjOZRn5WN2OfT?=
 =?us-ascii?Q?RZTsxA1Mvf5RG+3kkJRTS2sDrU30rB2XG4S69D4JNMRKhp0igHItTbZFgLvh?=
 =?us-ascii?Q?Jl6+tlzLvLZ7okVqOJZT60k3M/LJUE8gQlQDVIuusE0Ge6bEB5b0XlOR8rAe?=
 =?us-ascii?Q?8Loss8cJ6pn043QlADMJRa5k/uYJaqQEUTumIoSGSaxUsScrPEOAHKD4rjAz?=
 =?us-ascii?Q?u389XtlFLqM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wXFIz/Ws08Lzyi+GggVmV/ci+rSVs8IsXONdTajzYtEOd/k0wdTnQ6jDPWuI?=
 =?us-ascii?Q?RctwgSLuiaXnr7E1XGihk4nl4fKezv/6WUf4wxj6rkR/0AFBEYLX1iWJ7E28?=
 =?us-ascii?Q?Y2lz9B1Xvh/bsmxfMhIYBWf15n7jWs0WSIaKfTvL21ozR/DTEE8uExJm3dmh?=
 =?us-ascii?Q?EWTuuw+fW+McH/pfLAoh4SZkL9gzjVaeyoKhFpMkws5DxEsyq0zDXmExCgnW?=
 =?us-ascii?Q?PCymARKuNmttb86y4LVmSgB0D+wQP6m+ggnD35yIqjT/SjXGj3Q8dAZoZNc6?=
 =?us-ascii?Q?FfP48wZ+gLFgRptlKHTlqjyHq5NsXT5OlTZELH0lS+sv4G1nnIMfkUstPz3k?=
 =?us-ascii?Q?SQWzAPRh1P/ggo/1d8dY2SOBZhHK8nJiSiszeYQ3IYHpJq+F4tUKo4cNw5hq?=
 =?us-ascii?Q?LmTp1BTdlkTPniBxzKG5vpZzPewK1oDjmUNt8gN49IrKgNEy5vMmT6mYG1wo?=
 =?us-ascii?Q?YzOgHj4g7lpZkuyt8QnF8sFhvcdGQfNXkt1jOrXdThhM4zNAbvNxBoOb6uVr?=
 =?us-ascii?Q?7wgAZ6KPTyWzF63VU3sPSzw6k7zSoXfMMJMBJy1N809ZnXxpxadQAx5nFP/Q?=
 =?us-ascii?Q?/3b/qkWer9EK/E2SS+0V8UlcCstSgg7wquFYU7ZHpQaaUSB+HcrQgh4TWa8a?=
 =?us-ascii?Q?bohMG3ACF2NBKRo1RGSAOmJfJykQ/CE1S5VW+VBTTAZFN2nMamQ+uTyrW0p+?=
 =?us-ascii?Q?p5TqAOjYWePPSa4X8rTUbVv+nSiR9H4Jp4L5HnNTan8PyOmVkuxcq6pAnejo?=
 =?us-ascii?Q?p52ppqE+OKsJCpxFuYvaNrxJEOUiQx9iDoHijYhmnpxTwOijusNxSG1lUSsw?=
 =?us-ascii?Q?Z9SaJyw1gIqEHPTqRIZtRtq6nyDjUYrBHhMWo8ulKqjJEAuGKIernvSrp9oy?=
 =?us-ascii?Q?OQCW5KyUungawvsbrw6tkrxQb1KVo88oWJ1Ucpd7rlsSecuH8fvbQeSs6Ie3?=
 =?us-ascii?Q?yi5I5le57wjfFXhn+MBGjq3dLnSg/helHB0H2r7oFL2MBHL15z/Mo7pY7qSQ?=
 =?us-ascii?Q?4Og2iPNTCm0SLBMtrRQLUlHEvUA6kXn3HxcNVhsJ0rxKlK+/9kG/vB8Esswe?=
 =?us-ascii?Q?GNRX95GN4gWp0mO/Vua0Lbs5b2wNfi8jod/2z+v24hAzXDUB7bw/+jexgate?=
 =?us-ascii?Q?uK07Go12mP7JttStrS21gfhPfEDuCTx1nv0IvRP2wRwLV9dsKwTQSKWojUlT?=
 =?us-ascii?Q?T16GEgREXLUbOiwohB9gqQEn87XuwwOERQvfV9rI6Sy5H/oKik1EAKMdzmBJ?=
 =?us-ascii?Q?NgVP4PFR4VMBqnzYBpRvCFiSYnM0iz9FyRK6QBomvHAsJJXp5lw5O8XtwGH9?=
 =?us-ascii?Q?gpDTUf9pg+Hc9SYMJRbFE3MBy9HnFstiqHTBoigt3nZidaFmMwb7ZNzsb+pl?=
 =?us-ascii?Q?cvILlvY+GNJlzplMrr9x/cr1NDkuUug1oYHN24RCrvTv1FGqtBR+oMmYFgEF?=
 =?us-ascii?Q?XQTv0mQ5OUTD2e3htUQsyqn+RnO0H4K4FdqZZ60DkyIXsYEJYX9VZtEHA/CI?=
 =?us-ascii?Q?lCvdt+OxzyDhEjfesX1a+kTulVPoKBsN6UE8X9OC56u2sv0Haldw246ICRsG?=
 =?us-ascii?Q?DFXb4hzirkZov/gVJb1lO7KCVW2Hz3scaGL2ZqUw?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ccd3928c-baef-435a-fb15-08de383ba060
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 22:29:47.9991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sqyFl0nbDMs27rbsVxJkqYBQcZEHQO93TlgSDhuTj8F6uB0DsBzhETahD3tA/NhkvLzt25cDX0G/QUMDRZfHtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6620
X-OriginatorOrg: intel.com

[Added Dan Carpenter and Chris Li]

Dan and Chris,

You're in the git log for sparse wrting/commiting fixes. Can you take
a look at this?  Sami's fix works for me.

-Tony

On Wed, Dec 10, 2025 at 01:00:20AM +0000, Sami Tolvanen wrote:
> On Tue, Dec 09, 2025 at 10:29:06AM -0800, Luck, Tony wrote:
> > On Tue, Dec 09, 2025 at 08:45:14AM -0800, Luck, Tony wrote:
> > > On Tue, Dec 09, 2025 at 04:20:06PM +0000, Luck, Tony wrote:
> > > > >> Likewise, I just got the following kernel test robot report sent to me,
> > > > >> where it's warning about MODULE_LICENSE("GPL"):
> > > > >> https://lore.kernel.org/all/202512090359.7BkUaiC9-lkp@intel.com/
> > > > >
> > > > > Can you both confirm which version of sparse are you using?
> > > > >
> > > > > My understanding was that this patch fixed that problem:
> > > > > >https://lore.kernel.org/linux-sparse/CACePvbVG2KrGQq4cNKV=wbO5h=jp3M0RO1SdfX8kV4OukjPG8A@mail.gmail.com/T/#mf838b3e2e3245d88c30a801ea7473d5a5c0eb121
> > > > 
> > > > > The patch is already merged into the sparse tree, and I was not able to
> > > > > reproduce the issue.
> > > > 
> > > > I pulled the latest sparse source and re-checked before reporting. Top commit I have is the one you mention:
> > > > 
> > > > fbdde3127b83 ("builtin: implement __builtin_strlen() for constants")
> > > > 
> > > > I'm building latest Linus tree from the current merge window (well latest as-of yesterday):
> > > > 
> > > > c2f2b01b74be ("Merge tag 'i3c/for-6.19' of git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux")
> > > 
> > > I added a debug trace to the new expand_strlen() function added to
> > > sparse. It is being called and doing the right thing. My trace says:
> > > 
> > > 	len(GPL) = 3
> > 
> > Simple test case:
> > 
> > $ cat -n s.c
> >      1
> >      2  _Static_assert(sizeof("GPL") - 1 == 3, "sizeof");
> >      3
> >      4  _Static_assert(__builtin_strlen("GPL") == 3, "strlen");
> > 
> > $ sparse s.c
> > s.c:4:40: error: bad integer constant expression
> > s.c:4:40: error: static assertion failed: "strlen"
> > 
> > So the "sizeof" bit is OK. But the __builtin_strlen() isn't.
> 
> This looks like a bug in Sparse. The CEF_ICE flag isn't propagated to
> the comparison expression, which it presumably should be when both
> sides are integer constant expressions.
> 
> I'm not really familiar enough with Sparse to know whether this is the
> correct place to handle this case, but this quick hack fixes the issue
> for me:
> 
> diff --git a/expand.c b/expand.c
> index f14e7181..71221d35 100644
> --- a/expand.c
> +++ b/expand.c
> @@ -535,6 +535,8 @@ static int expand_compare(struct expression *expr)
>  			expr->taint = 0;
>  			return 0;
>  		}
> +		if (left->flags & CEF_ICE && right->flags & CEF_ICE)
> +			expr->flags |= CEF_SET_ICE;
>  		if (simplify_cmp_binop(expr, left->ctype))
>  			return 0;
>  		if (simplify_float_cmp(expr, left->ctype))
> 
> Sami

