Return-Path: <linux-media+bounces-21747-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A27E19D4C91
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 13:10:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 645E32856D6
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 12:10:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDE121D2F55;
	Thu, 21 Nov 2024 12:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SBpywXzE"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B461CDA18
	for <linux-media@vger.kernel.org>; Thu, 21 Nov 2024 12:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732191005; cv=fail; b=AcOg9yvAu6BFa5JX3inWfJbr3f9og1e04qNYaDtGYtvUtyT+U9myHphnm3ab29VFhRfDCX4Jj6kYk9kVQ6CAU1/K4NapWgkUmmU4sl6OIu+6zCtHtOWFENzt16NVTfbvN7isoZbKv0CEvadJX/WVt7hdGAlbpRUPB8nk6/lIJpU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732191005; c=relaxed/simple;
	bh=TfRi/ScfGkW25P7mVFM3YTRWvna20FUZqNksoq6LVm4=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=iMH0r3Gt83l8PVguwv/qMv+vUG1jEvhMm1NZgm043G4CbP70VElKldpwGWrCQtpVY2MTDxNnhczyR3QyiLiplU+GRTB0y2+O207OSGnXcwCkiHK8yA/9HfTa3l4sn2TIwQJAw+zD6TcHcknLT3AsAh8+ErVf/KaHWixF/EYo7JU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SBpywXzE; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732191004; x=1763727004;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=TfRi/ScfGkW25P7mVFM3YTRWvna20FUZqNksoq6LVm4=;
  b=SBpywXzEXxzP9cOHCN3yp8Bz5NkGS55u7qjNQ7RFva5UEyjEtyDnvCzU
   UnSukT3aVmzdkFPEEQlMymNej1JiWNr/y6ReVa2MXKcSALPURuACr2qpX
   jesrjkR9T+QcxtWG9YiHk9j5SegYbAHiBGcvFWCNoYmxLSbgjyH4ZAqq1
   iISpDbpiDZpN9moPunpxHCJG1p5WKzvsRtyisAXQ26NP65RMjTbz+g/yA
   Hqq5XQYT+oAGoICvZzuipayxkJ/lNMP2Rh51kj99TJ8AFXssyD8DBSAAf
   TpJ83cT+0v2O1Ih5K0nnBsLers9M1LC8EmrOl5wJXOXrapqiXSU3TSHjr
   Q==;
X-CSE-ConnectionGUID: KbbDwqVsTN6gMi1jrsLrVg==
X-CSE-MsgGUID: 0IYO1CFMRU2nc33IijcY0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="36209974"
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; 
   d="scan'208";a="36209974"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 04:10:03 -0800
X-CSE-ConnectionGUID: fBF/sqDvR3e9GiMTgtTB9w==
X-CSE-MsgGUID: FgqHn1mXS32EdP3VIt24Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; 
   d="scan'208";a="90625643"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 21 Nov 2024 04:10:03 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 21 Nov 2024 04:10:02 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 21 Nov 2024 04:10:02 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 21 Nov 2024 04:10:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YG6LjXPMTglJy/0Ca99pKVaKaLbfIEZdLVCVM2L+WezzyNGhehGn7exiECf8V+8FrvbBSEypXVnv2HhTwpOvhEg+Ex3PqtfDV+ZW31IjzoNtuPp8pYse9hyPg3j8v13L17WWQBD+D2zsRFISvJYZRDFsBrLUcZQBnOh4KcBJgW8xcLOT1UZm2SYG+LAYa6C8a3iZyQ1rYyPqTDMWvC6nvm+6KKgb6/gwBBa04ovOFLoY+2/KEuVZ/5lEHmUPCYkBTwO4m6NX38AThp9D4MTa5A9+qA5PseZ6j/cPciv5r/T5RkurzpI5ZHvCtJffbM/+ZGhJVtcDoakhexKifrRa/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ziL3DynUplIsp/EMNAZQi0BIQgNZkhbDhe4XYB5iOuE=;
 b=w7w2DL6WGOPWDH0MXHdBEENz7QNwQ+gzsCAe7soHV1c6znYLiYEkiF2uqdSP2HeVgY0ECbeb+QiNYSslJuJUgqjPWKUHLZBYk/BOskx3HnaJ2tB8ke8Qn1vvyB/CIeZQxv2qXeVikpnvnkKuPieJVHJbtIl9lTQFWJZ6wGHOKNjsu21JR+GPBDOefyGP4SpLUXFCdYdlPGaDSKu9StKQTxQschDUqRn64GOMRDi2YVRZjzrfXFGnQm84btpl5UJu4laW0tE+ac9S4c7Ec3ZZuGjYxAdtmamW2ppFHEN3/wgokq22xq2SrOiwO8Ad1+GnrVBMw4GsTCG4xKrWefGAGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by CY8PR11MB6892.namprd11.prod.outlook.com (2603:10b6:930:5b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Thu, 21 Nov
 2024 12:10:00 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%7]) with mapi id 15.20.8158.024; Thu, 21 Nov 2024
 12:10:00 +0000
Date: Thu, 21 Nov 2024 20:09:51 +0800
From: Philip Li <philip.li@intel.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC: kernel test robot <lkp@intel.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, <linux-media@vger.kernel.org>
Subject: Re: [linuxtv-media-stage:master] BUILD SUCCESS
 72ad4ff638047bbbdf3232178fea4bec1f429319
Message-ID: <Zz8jD8/+kAssEuAH@rli9-mobl>
References: <202411211100.qa2lhjOi-lkp@intel.com>
 <20241121082726.3fd8b09a@foz.lan>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241121082726.3fd8b09a@foz.lan>
X-ClientProxiedBy: SG2PR04CA0162.apcprd04.prod.outlook.com (2603:1096:4::24)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|CY8PR11MB6892:EE_
X-MS-Office365-Filtering-Correlation-Id: 21fb46ff-15ff-4b93-81cb-08dd0a256be9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?k1zuFNoNF+/0CcRsIgBVE1H4DnPnSiSAXcKBqArGWO23KHx1ZhsPcGHoHbIy?=
 =?us-ascii?Q?7u7YbzX/2nKOTkA+k216AJvzrdnpBxtUTtuJxdvWg2WmtFXRYQSh3ARghTeL?=
 =?us-ascii?Q?DtdNseYzoDprmiWaPj524J7CksgBNzSr95+Vj42noR1gikYZrTefuCJH6poc?=
 =?us-ascii?Q?GgdpjsP1FaT80K6TDzYJ81dRmS/Rw+skswb8czTPk7oz8c0gGYpBeM0YVD3J?=
 =?us-ascii?Q?2r0xGvC9gPVLkFQrc5bfUTCWdiMO8eVySH0EzZJ/yT+yM1UZcfG7C5i3t3yZ?=
 =?us-ascii?Q?HoV1URv873wYOqpbokxzEvLtlXb5i3W7qzLnd72r9KKkx+JSKXpflLV11YFd?=
 =?us-ascii?Q?0uILkhVQOOewZvufqq7IDZfRPgO5UfOUlr4flFW0Flrs2PMshyMQSLjbT/Wv?=
 =?us-ascii?Q?C6OFLnoWW3oY8kPdjaBreroEjL0/APmJMseHcv5rKRaAto61uPuhjBYULN06?=
 =?us-ascii?Q?WKrLlYAV175Ho4fY32gDYVM8c2B0ojxqrLOAomJcPnU6Lv87ZdKA0v2raPw0?=
 =?us-ascii?Q?kwIoNVvrYghbP8ZPsKyFIHiMveR+ynYjKPz9VwH5/L3ZnZNdJiyRKba1ozS0?=
 =?us-ascii?Q?fEEZ6oTEdE8RlqipJKLSrWkgmTM7fbZemSqahT0IzllY+qRzIrnLBW3NLohV?=
 =?us-ascii?Q?Ce4rckJomjdYjjDtVBXFORM5sqXli2KOa5YbvDslxUxBSgBM85olasZex1xC?=
 =?us-ascii?Q?3vP+M5r2USQhMXKyuXyYHGj/J7QYkB2SDA22m2p5h+cot61xRNypOBcG6YNs?=
 =?us-ascii?Q?tTjKwAq7l9ARI5cVQcrZ1Ub0hzQIwAy7lc9rrLR4UhDX+6oAzBVMex45JkKu?=
 =?us-ascii?Q?p37bRNUDrtn/TuBt84t4bYvxJG/9O4gPAJFoJA3BoM5Ed/j1Wh+ZoxNc1wAv?=
 =?us-ascii?Q?YwesX4gzOZQgjvs4/BNcGa2ts5O787lwa3jKP0RgdkKUWJ69dFxD4KZdENIU?=
 =?us-ascii?Q?wObcZ+nEN3zBx3gBXhbaZaWOTgRZ4DxCQi9Qb3nm96LaHgbkK03BaVoO12y+?=
 =?us-ascii?Q?fMi3AhupIbTwHARDLPV55Vc1T7uD4vV1jbMqQaXBgG9snqQxknofDfnGQCJp?=
 =?us-ascii?Q?c6bqeAVUfmja0jzw7n7gvp+ppLApiZakTvEivyNHvGadxzAzSp7tzqfXg/D1?=
 =?us-ascii?Q?VxU8eml1/wWyrgDS6H7bcwSKGOXFvdff8tYceA5GlUW3eZMWtJ768xe7QYNs?=
 =?us-ascii?Q?YY4Wi41QcQ8fg0dbJ3rH71d9AwQRuAm6fesk5Jw8pz+WyCbpaDGBmjg4T1Y3?=
 =?us-ascii?Q?GEL3qPM6dvy94wpuLHUNxPGfCMR5U4AGDET03w2ohQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CKQLhkxuQB3SSudhpMUzW7OsRT0brS2oFkBOu4Z2ybi3r/Cl2FiFOK275DhI?=
 =?us-ascii?Q?uP58S3e0NT5x9N53A5PSzIVSaXRCnlcmKWaMjuRRwd+W+w5GnKuVSznBYAxC?=
 =?us-ascii?Q?iAVETwHuv1qlHwvaGjwILGpuxcYr1BumOrdX6WyeIgf+JCFni3OUJvd2JyJT?=
 =?us-ascii?Q?T0orzyDbdjkOn4k/JlQ1jL5EMs7Jfmhpa4Rd/omnXt36gklyXzYEgSq3hpyD?=
 =?us-ascii?Q?xx/gewOGm8HYa3M9M/FOfHhargzg60auRfZoME4ijHCGN379WQkHUuzeZ9dK?=
 =?us-ascii?Q?50ne+cKSzTn0ZJRmzLFlLkkn7VFQMPWup7yByCQsR48IrLXb90XDCgoP9hXE?=
 =?us-ascii?Q?3yQGFE8Q65VVOJC5TEILhi8dJohL2LvScn5/Jg/k5bxX6RAtdaunUKfy5UPj?=
 =?us-ascii?Q?GKi1yVtM4ENtxMLuM9aMdae7N8CUC+lu4BYnZLcQ1IyazQxQO0jk2Sn+RByK?=
 =?us-ascii?Q?vX73S2Zzm5bMY0WwZRMtCUMdnLCQXpE3x1fWt9bYCG4M6IYUlHLE6DhpB6Mj?=
 =?us-ascii?Q?EiOtfMw+5RkWUFCPnQVTVWLWrgfDOD5Oru46o0Lf4c7w8eZDkLbTQiokHj6r?=
 =?us-ascii?Q?DY75nDblb/irfMJMpxlT8yVISBTsavnHkSKT2z+EM+qbAN7WRARVvz7bHdDM?=
 =?us-ascii?Q?j6P2VIPdIQfvjdciLX3cwItTTBCf3LQ8GwuyFgNRiIu8bXysn84sWIl885qY?=
 =?us-ascii?Q?+f8oSwW7wJ5OmQrC/ruxUU2eqB+f+dsXdOgwE/yv5TI85u99swqRTv7gnKC1?=
 =?us-ascii?Q?WFlhvsviFfQZcTIFY7zBTv7i1qveHFKatn8w20E++YIZnc8kvP7++zVgwktw?=
 =?us-ascii?Q?y8BfhcIxv+BMsMcm96kIGGj6aPhxj1b8t/7IK3MSVljMu7umbC6KQgZ+YfWw?=
 =?us-ascii?Q?IQFjT7ULrKO9L7KJAdxFzVHUm+dS0eLmiEJ9lgFvcHrluGn1Ex24uq3+wsr0?=
 =?us-ascii?Q?DGY938ive1Wk3Utr7IXIQy3G3awTt5KEnAy6JGpJuigJ6ZhwfkH6Ms9VYrEX?=
 =?us-ascii?Q?WaoWhKppWoL2vZGMWwdORMK/F8+y6RADxvg9KwSy5rCOSt2xqKii23q9R0pV?=
 =?us-ascii?Q?bAw7/YrbMfq3oqfFf/+k619jwfpeOVpXkeKOdzrEIg1JBTfoLDQjV1Gcna0k?=
 =?us-ascii?Q?RyEiFiZ6p1QTEYbyCltINtsWRHx64mX2jkrXF4ublGKoWAAtt0HwjhPtfz20?=
 =?us-ascii?Q?mzj6Fv/+YE/xTGpr5R0h90HH1KdwazycFXwD50bcnonNAuRhaWuKYUrn4PIz?=
 =?us-ascii?Q?XYltHYbFuIQe5b1PJmgdDYmt1K1V8e7OpkEE7U9Zn8OJ7CzCcz8sSil6tyVB?=
 =?us-ascii?Q?oKzhRiaCHl2ZJqUn5Z9Ii5pP/G7PIe2oru6tIs8L4KhiwSacuhsKSNAfQ+fM?=
 =?us-ascii?Q?SZBJAyalyvFOOFH8fwD0jEUqjCx/wdxyMTH03fvtTX/KBRSS9haTcbtIfp5+?=
 =?us-ascii?Q?meorHCvdTIzCHaAyraYfO1LMOKUMeR85c7PFJE4zVs0aFfFyoUoaNxLqjEtq?=
 =?us-ascii?Q?smOegpCPJY6VcGsMBi2o4CKgIGtfLkm9j0qmmM8nY+iKCKyteRUfT+o6oony?=
 =?us-ascii?Q?hQs2oP8PTVhBlcG0QLoPD7utuLNjRNrpp2vxXwIU?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 21fb46ff-15ff-4b93-81cb-08dd0a256be9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 12:10:00.0032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KWkoPyuOpxQ1S/VT6u883sXyOTWKGx2Cw392N+Wzw6di3zC4gix/XaU1sWvqHwJazFhHgo3JDbGa/hY9ZkyJQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6892
X-OriginatorOrg: intel.com

On Thu, Nov 21, 2024 at 08:27:31AM +0100, Mauro Carvalho Chehab wrote:
> Hi,
> 
> Em Thu, 21 Nov 2024 11:32:07 +0800
> kernel test robot <lkp@intel.com> escreveu:
> 
> > tree/branch: https://git.linuxtv.org/media_stage.git master
> > branch HEAD: 72ad4ff638047bbbdf3232178fea4bec1f429319  docs: media: update location of the media patches
> 
> Recently, we changed our development trees at linuxtv.org. In the past, we
> had https://git.linuxtv.org/media_stage.git and https://git.linuxtv.org/media_tree.git.
> 
> Now, we're using:
> 
> 	https://git.linuxtv.org/media-ci/media-pending.git/ 
> 
> For patches that will go to -next (can be rebased as needed), and:
> 
> 	https://git.linuxtv.org/media.git
> 
> meant to be the stable tree.
> 
> On both trees, we have two branches:
> 
> 	fixes
> 	next
> 
> Right now, we're keeping media.git mirrored at media_stage/media_tree,
> but we're planning to drop such trees during this kernel cycle.
> 
> So, could you please update LKP to use the new trees?

Got it, thanks for the info. We will configure it asap, which should
take effect within several hours after deployment.

> 
> Thank you!
> Mauro
> 
> 
> Thanks,
> Mauro
> 

