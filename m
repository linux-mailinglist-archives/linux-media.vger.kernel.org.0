Return-Path: <linux-media+bounces-48444-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F32B8CAE304
	for <lists+linux-media@lfdr.de>; Mon, 08 Dec 2025 22:06:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 176DE30806A7
	for <lists+linux-media@lfdr.de>; Mon,  8 Dec 2025 21:06:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02A9B2DE1E4;
	Mon,  8 Dec 2025 21:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BhcSHoYR"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33696288C22;
	Mon,  8 Dec 2025 21:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765227968; cv=fail; b=kXJensgcvNtZkZ5iHNG5ZIsvarWXsWNQTGvTDYveHdFWNRmOjS2ebqnfcTi9ytYUOUSzoZdz9wB8rk9pPCGmflQhWgyQf4MMsVY3xqnkhIklHAtiJzAOHKMaQmnnb8ZoaEGPaGZYz6jMnvk914EjZV4KL5cCSumwZ0hZuDMM7xc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765227968; c=relaxed/simple;
	bh=CeEtj3C0Yxi2us5+NR/13RlfRjuMVdqR58g2jZ5utFQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fhVcz7ANP3DABsFvMjadmkPI43Y0ccQJjpRnFsH99ehU8c3ZVy+3sJA1cch7bETdKswdR4M7dGU//bgVxR+oZGvX3d8/9SPDzfBA6V+VIbQ0a7s1VEUlmdhUmr7R69EKsYSM68hYFMHfQX3ymsMK5KAFnfzh2q0JNI3AE5lXl4E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BhcSHoYR; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765227963; x=1796763963;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=CeEtj3C0Yxi2us5+NR/13RlfRjuMVdqR58g2jZ5utFQ=;
  b=BhcSHoYRA/FT/C3VdroSXMJJXiSNvL7I1F09vLZm6sWbe40+tD/k3kjB
   SmogCjxbVsPIHOmFqwDB0BdITD/Ig/2JzYssdmzuKLkzrLcg/ueOXyHv0
   Ok3nzuB6v0LY06jlznJoms3Uab9xcc/aYpB/uhGErDJ92TbFSEKBh05ZR
   oWxCuUlz9IQeIYssvWt28KulVdyjWpOO7jGCuqlAGWwwl6DBwwgdQ2wB/
   IK4a5SUK7+I3h8X1polC70IxJU3awpneGKCS3JFMS2jBwL5sh7oLwvPuX
   J3m11rBunjX0ucx2v7zjFAtWmoKjxMUZA6FGRAIEIgMD6fHVrSA3FOce8
   g==;
X-CSE-ConnectionGUID: 4XbDC6n/SYO2Fz1Ji2a62A==
X-CSE-MsgGUID: mmn3cV8xR42A5HpjZPawww==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="67062492"
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; 
   d="scan'208";a="67062492"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 13:06:02 -0800
X-CSE-ConnectionGUID: IGmo+mTHRkCKvbNiIhxMtg==
X-CSE-MsgGUID: 8wLC5tcVS/yJ90bx2H1Zkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; 
   d="scan'208";a="200953472"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 13:05:59 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 13:05:59 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 8 Dec 2025 13:05:59 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.35) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 13:05:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zpamf+PikB7agLR5w6dVm9fuXUeRTjZKmwFGWxA+7wzgvki/tK+mhZVtFJ9DdphWja3cHwZxNSePFjemAfVx/273GzZy4cKv1NgddNhXPBlFu2hAS3l9Nl8DhZOBpNSt2kCV3ZhHy4N/I7+9Jj0tTWk+NK9Ye6x/mfBsXn2zaxYEkLP4cN9VSCTGjIo1HR78B4pk/1cLOd8e8o4I2yRW7hbRUFFDPOD2wiaB/1JerFZR4oflvuC1NriVxwSdciDDgl/6GiEfHMKDcoTu5AqHml+vtqzXZUF3gVGgf+8zSu150ahvMB2Gns0wywZuq0qZF9SK92R4rXujPsQi84gEcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Hc50Ot3KNDjKg9x09Jzgk+zwvm39HXUGVKNebdmhfU=;
 b=c2XpvBPagjxgTxx54+MXxgLPNgXz9DMwwhBcR0zlyEeHZym6daxfulltTyZzZZQMnUEjLRQfMuYTOZuhwJPUkc7OeykQVO4szRErx8BftGFW0xD2bcKeUMbeyT0cHN/w+ywL9IAPYO7Y8U9nVnDSa5FTI5tvQvNvfd6QpVla2SdHuacPH5OqgJJycCHAreOWyYkzSbx0v83FaNcEJZURq3oMbTfXrAgJYp1TTGP8i44r3fThBPusMdqwzTJiy42Sd5IMbH2QeZQXTnJxDu+uVVhiGKJ3HZ+c3QdCToY/a9zaaK8150JfMZ6Hzq2YP64ufHClfU1yuGiUmCJ4gts3Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by CH0PR11MB8166.namprd11.prod.outlook.com (2603:10b6:610:182::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.13; Mon, 8 Dec
 2025 21:05:56 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361%7]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 21:05:56 +0000
Date: Mon, 8 Dec 2025 13:05:55 -0800
From: "Luck, Tony" <tony.luck@intel.com>
To: Kees Cook <kees@kernel.org>
CC: Luis Chamberlain <mcgrof@kernel.org>, Rusty Russell
	<rusty@rustcorp.com.au>, Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez
	<da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
	<linux-modules@vger.kernel.org>, Malcolm Priestley <tvboxspy@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
	<hverkuil@kernel.org>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <linux-hardening@vger.kernel.org>
Subject: Re: [PATCH 3/3] module: Add compile-time check for embedded NUL
 characters
Message-ID: <aTc9s210am0YqMV4@agluck-desk3>
References: <20251008033844.work.801-kees@kernel.org>
 <20251008035938.838263-3-kees@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251008035938.838263-3-kees@kernel.org>
X-ClientProxiedBy: SJ0PR03CA0013.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::18) To SJ1PR11MB6083.namprd11.prod.outlook.com
 (2603:10b6:a03:48a::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6083:EE_|CH0PR11MB8166:EE_
X-MS-Office365-Filtering-Correlation-Id: 524c18c4-1f69-47ea-490e-08de369d94b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?P7cuuUPC/D2BfRzuCdEUEHJ8kARy2e85mvVGgX5AqpzWwKZ2JOCLqKIO0zcL?=
 =?us-ascii?Q?8sUVdo9Ho8oUoxMtoNjiCV/ouzPBmzBGJ/WMWNvYcmWiQe/EVKgjlH0ZxmVa?=
 =?us-ascii?Q?pRxBkA0hOAgFKM4JookqMZ0wN9ov8pTMSnfT7y1TKAmNv0Ea6ebZi3bRj8Hx?=
 =?us-ascii?Q?HzM2E3NwZmrcj2d4qWF/urXFfIS/iMN2IpZIBqhTe4mGCLNO6hsklqRwR4lS?=
 =?us-ascii?Q?u7VZR1T/pHC4hau8FbZSOqGrx32tGl1NjiIyMNLrR7uzZsjqOrXMGU5Ysup5?=
 =?us-ascii?Q?oaBM0fJX5tjjDbU+931eE9v1urJGqCFu3fV1orJK8NIdNzdw1ssl97NVV4sn?=
 =?us-ascii?Q?K7M+fe35GIdKMvTaHgE/jGiE3V9ueyIZ0oWJCCYPy1x8Fl8mZG0oZcJPbv1U?=
 =?us-ascii?Q?/4h8w4TTuZItnmtCD6Netri6YEkdGUSU3HF4geP9ed5cN6eib/qSSICmEEKN?=
 =?us-ascii?Q?KCPB+e9BfaHJHqRR2JCVcq9F+lFUhj/bc3inFDgHQNAJ67FrNpjzmCD31ub7?=
 =?us-ascii?Q?KJPYvhBhLV7hLHs05feiohsna932PTJ96dNQqjaAcXw4J4fIR93Z7a+rAExt?=
 =?us-ascii?Q?GR2k84SA1jMJVn8mITt+VBjfxoFpg9nlKq0Y4oaInBXGBFBi98FTUgB6RS5I?=
 =?us-ascii?Q?Um+dEyKMAhp7OPBwEwkoqmUBzLFLE3gg8mUgFvn+NS0DREsiTVB5zcBdRyp/?=
 =?us-ascii?Q?KyoNFpUt5fd5XBIHTCCagV5Px5LPlGzY5x9+5UwPrvlFTwPS33OIdbcJO5Lw?=
 =?us-ascii?Q?MnFqcB7M0fQscvVUmm9a2bFMyvg5EiuzaokZ+4V2If7QyIoG2kVpQEc7BCFi?=
 =?us-ascii?Q?W6xXhOFExUSqyDe9N1iCrNJoMfzR3a+d15yOf74MvJLd6Mgn78g/058ej/Gu?=
 =?us-ascii?Q?OE0rhEV15+6GxsDgxquEt2oONANTE+478hR8I44i9l5vg02KgLq3g6Z3Kwu2?=
 =?us-ascii?Q?6naeaDczRLoe+CDBlLiRktLiGwN85Uw4ZtUxJvIxKtlxamD9hWgpui4vxIXT?=
 =?us-ascii?Q?c4zC/eu4NWlveZS/nlWSPO4YVgGPAy7LVCCABdM7njQjcTQODFLNizFzNDg7?=
 =?us-ascii?Q?gbspf20+fedL7uLpWz9FZWxJAl7RoWON2oDuEc1nisnFMTbD1MtdOU3WDRla?=
 =?us-ascii?Q?1N675BhlzySJzUWsOFopcloj8trP1D6r3Slj6F51eOGE6YyYmsQAbWYzHHJw?=
 =?us-ascii?Q?Bfp6y/wYiw057fFHjcl83xrQ/xRT1og02GSFRKoCFbKwURaWLzhYSLUFsHWN?=
 =?us-ascii?Q?q6ioPUJ6l3xmVW+1NBicZlhVJ709fgvUVRJVXQl8sNzBjV+6a2TsVLdACii+?=
 =?us-ascii?Q?lrZ25Ss+7iKan1MF0ulBz2fNC7nGbRxmwrG8N6HVYNTsFdsE8xqM4AqJGdsg?=
 =?us-ascii?Q?yBqpYHlt859lu5+YHQSsDgVato6tg73lBAVr9i/mbmOEmfq1XHxDdHopcraX?=
 =?us-ascii?Q?CBH1h3Aj+FMmuI3+Ezo2cMFSGk7RaZz0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1iR6yteizZ5ed9jYjZxFfKUA758IIuf3foiMgZmwIc5qJj1cLeqhmNCwPa4g?=
 =?us-ascii?Q?LzRucpwNhc9uUzm1HeG8Hm133jfgGkWrhRQGnhE4QhuB/e5h6lqbvR1cJN6T?=
 =?us-ascii?Q?yeSA8KYOvqq5BurbIAYWmKyo3qCaB9CW5SQ9uZZPSb5/8qJq+0auxs4e87jU?=
 =?us-ascii?Q?YtZuNJ5TDI/kwXa/0vJbO6fzUC8VI/TWkBwEGWXxDejYjWT56gqMSeBLPDer?=
 =?us-ascii?Q?pquTpXjdQ379TnnETj0A5wOp/Oowx/KLPjnz48LDlvfkxAjuSB6Fl+CtCiVO?=
 =?us-ascii?Q?ULeAPXgDjODfo58YNKUiNf8IjfIKSvoHykcfOkWd3qPHF042YZyPANuJ5eoV?=
 =?us-ascii?Q?/rheJbP4jdQ9POo4C8k+/yoCBTkoIlN/zTL3sadDhnwXrVuoNfSfG2Y22PXu?=
 =?us-ascii?Q?WtYAGYUagqPD7B8ifSKPiKvKTa/uAPaVCaDtThrlqFGhQS8uGjc5NGEQTJaM?=
 =?us-ascii?Q?xBVdBf6nfhCb45sIHxDpDxDoltIqKG8DtCUWeF+x04+qj0t3DUTE9KfvxgSq?=
 =?us-ascii?Q?rhyXL1JYMtrPESDJ5W6V4o9QJ7cIlYK4cjqWmCtlAV2DcjjQUxZE4zukNfYT?=
 =?us-ascii?Q?8dDuVBJXsKOMQSDeRKMzU4WFWeX15ZFLMSUd+6C/Jw8Q7YQof1igeEvlv4Xr?=
 =?us-ascii?Q?xrRPsfPDiyMks/A1r03RPU8EJyukBjqzFNT4gd9/oe82g2z0izH5xakGlnbY?=
 =?us-ascii?Q?kvymxfTWQ3If0x2QKrH28m78gpFUyes0En0i3OYZzlSuvVEJ8Z/T9UcjBq7m?=
 =?us-ascii?Q?bw247QL78IC5o+Osgo4giCKQpk1OIXEfnurK6C/fX/rWBFJoT1qsYosVQbWM?=
 =?us-ascii?Q?OhAXwOQ5oOd04CyGbz+SZhjmXT8WPgRIZPKx1QyXjVCr4Bx/DClRXGxkJwlj?=
 =?us-ascii?Q?y0m1ulpYuz38r6/BUsYSZv9dpl1xgFMotEzx0FfuRHaQk7Z4JuYx0swdsp60?=
 =?us-ascii?Q?+JRU3KFFUZ8iLmlDnSk2yyyx7sSIqtwVJ6AXmTakiZ6Y2CdOioLT3jBvwGuI?=
 =?us-ascii?Q?jsL49yxGqco8ufrAy7DCNAzR2TnfWh++ihaWKbQDB57fVIQ+MYgL2C5yn4j1?=
 =?us-ascii?Q?YpTGh5htVUJXawoLZWnzYdRJTQDaPPZuhiLzr1I3F7b64wIUVwCd4sl1eRxX?=
 =?us-ascii?Q?QzycHZi590aOh5e6NvoGHd6cmiCnALSP0TP9hd/Tyg/8WXOE3vQzV2P0hItj?=
 =?us-ascii?Q?kgDbjY99Z5PcRkgsCAedtdXczhPhk/GIVSNMBaS7vBHNDshAbWjJkZ+owy6q?=
 =?us-ascii?Q?8QCMUoUva3tmJWmXnfqPcASON1tJ3D89UMYkLG4CrYlLkzoNlabwQzCJWapD?=
 =?us-ascii?Q?Azrin0fpfX6NFQIZvn2FnNhc2L24qrA+Tuiii6/DmpIaUZltDXjZcJhOydUY?=
 =?us-ascii?Q?Ckr4yVKnRZWcKmZCs8HvmQCXQoYFUbWWNr+7/N6Gctzfs7BfysonLSO98eSi?=
 =?us-ascii?Q?JKl/U7aUO4rO1oYN2ZXvXLwRkTk0Cm+j2vJu1PmHGsc8V/hCtsrcmMsYu/nM?=
 =?us-ascii?Q?W99by3F6VC8YnmJBZF0+3yPL9s3ZmMkPp4Dit++wnTVXpJSou6foQxenoC12?=
 =?us-ascii?Q?HJTictlj6QHkj9Yg0Q6iT/rGWO0m3+XG4SLoztwF?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 524c18c4-1f69-47ea-490e-08de369d94b1
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 21:05:56.7336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2+yAz8OYPNTnHSuC7jks0cJxI15Wu8Uc9/t/O+8vIJYinufnS6IoW/JIJOXaKEFEFJJqO7E23Z/55Gs4cXa5zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8166
X-OriginatorOrg: intel.com

On Tue, Oct 07, 2025 at 08:59:35PM -0700, Kees Cook wrote:
> Long ago, the kernel module license checks were bypassed by embedding a
> NUL character in the MODULE_LICENSE() string[1]. By using a string like
> "GPL\0proprietary text", the kernel would only read "GPL" due to C string
> termination at the NUL byte, allowing proprietary modules to avoid kernel
> tainting and access GPL-only symbols.
> 
> The MODULE_INFO() macro stores these strings in the .modinfo ELF
> section, and get_next_modinfo() uses strcmp()-family functions
> which stop at the first NUL. This split the embedded string into two
> separate .modinfo entries, with only the first part being processed by
> license_is_gpl_compatible().
> 
> Add a compile-time check using _Static_assert that compares the full
> string length (sizeof - 1) against __builtin_strlen(), which stops at
> the first NUL. If they differ, compilation fails with a clear error
> message.
> 
> While this check can still be circumvented by modifying the ELF binary
> post-compilation, it prevents accidental embedded NULs and forces
> intentional abuse to require deliberate binary manipulation rather than
> simple source-level tricks.
> 
> Build tested with test modules containing both valid and invalid license
> strings. The check correctly rejects:
> 
>     MODULE_LICENSE("GPL\0proprietary")
> 
> while accepting normal declarations:
> 
>     MODULE_LICENSE("GPL")

 
I did a "make W=1 C=1" and found that sparse is now unhappy with all MODULE_LICENSE(),
MODULE_PARM_DESC(), MODULE_DESCRIPTION(), MODULE_AUTHOR() defintions (with no NUL byte).

I see:

error: bad integer constant expression
error: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"

for every use.

-Tony

