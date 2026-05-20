Return-Path: <linux-media+bounces-62357-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDwbIaY2DmpN8QUAu9opvQ
	(envelope-from <linux-media+bounces-62357-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 00:33:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED41859C15D
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 00:33:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9676A315E3F0
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 22:24:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14BE13D090B;
	Wed, 20 May 2026 22:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hDNkQjjI"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5EF3CFF4B
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 22:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779315781; cv=fail; b=ADRgqQXWWH0p4fbJ0qQLKLH4kKdNg/FVlFX8yPuoPvzTVeFlPVaRzLD+JoyMHxMVw7IaSXGjJe1YVx0tEz6yRic4I4Kerm/B2D/e4TWfMjeylVzpIcJL6wUGaVcuYZKTRFuOz3xGzpzNZNS2+qYhIbAcx5/qEBDfVsWSKI9pay4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779315781; c=relaxed/simple;
	bh=NCXvfQhwPdWOimXUMlG89kGSKdtVj/vQz+kJLaOjLfQ=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DQdZutSWVuUw4huYHUyO7NBpbI+IiHkUIl+SnOtVWimBu84m3WKV79u1DKIEIr80wi5Ji119xTQCtZMA6Rby8W6LiCZg8yfEBamm5cEUpkrQgMvU/ABT2isPy7cSSNIfZ3Eevwqxa4spjEVk13gIuApt88fI+iO1mRc9VDhlXmA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hDNkQjjI; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779315779; x=1810851779;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=NCXvfQhwPdWOimXUMlG89kGSKdtVj/vQz+kJLaOjLfQ=;
  b=hDNkQjjI+nm9R4bCjtgfM3BjyDbmwqRbi2DCQgaJWefgpTAszQ5rITwM
   xEfsKueaHOpTriBxm6nSlTB4tVBG1N3TQTHyg7uwda4b0i6BTW7BZlQeB
   CVWGmoPrd93kZhT7IskkMkuar2Naig2DJOKlKJ/b5lQUct7yL9vcEfrU0
   oULcRvfBGog0L4KAJeetohU4/NtpesfoNtJ84HD8Zabph4/bpN248on0q
   MxxUkFxIDQOpH1layyKYjk7kD3g0cT9pgb7OurmxmQUqxD9wDjCqR1k9o
   zQJ1Cee1RLGhA/V8luMgtPaF6jsOeUjwG87dZG/VmA0RdlttHJ9vi8hJ7
   A==;
X-CSE-ConnectionGUID: iDt9WPZkQzWYwpUbJuNxzg==
X-CSE-MsgGUID: lem2E9KaQRWQWos7Tupuzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="91701067"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="91701067"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 15:22:59 -0700
X-CSE-ConnectionGUID: mUv9GLjASd2PGOn6mzxcYg==
X-CSE-MsgGUID: UjkGCEItSv6Dmp+TtU3MVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="244320257"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 15:22:59 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 20 May 2026 15:22:58 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 20 May 2026 15:22:58 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.29) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 20 May 2026 15:22:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MeVxK+DumN9eCVya96QeXJIG9uvAC0GzzYM7sOj53MGzntl/LdAjVGb6PUCN+AZxq1egqxE9aLDilO8Zw0GRlTQZ7r8OuKtSVXK2CesNuYrzW15/dqJPZ8FCuhhte6bOXzuZedzMRcgvWjLAuqkT/ZvcMfMNBM+VrKrGH+n09AyGWeAvzXGM0FGrCdgmUuCWiCegJo/+rp0rAiTt4iy+mCVHW9ubdqY4d14zfUH16BWjRK0UjdE4TIzFR3v+NUmobyJrlUrPgsGvNx8ARaY5VFGUH7nn8cp/BjlghIiGkwAR+e+xpl4Ta9eVgnoH3wY3J8Pd0MzOLFWmRhfYBSvfCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9kLqUVbhe5gmRhd6mDAOxK1PuRaLMQD78Iitnj/Rkh4=;
 b=l2gxKq85PxjsrkG0cWchyZ8sz843Ft2l/HRKHoVi2yNdqoN+55IVnwSy5ofZd0CegLJcEZkchTyqr3zpBLvncdtIZKwf7R6YZxtqGXItnrSAlMCc5tuBneoFoDRYumutKR/5YipXNZgQN5Ru19AX9q3f9whOplC9wR/EXDjKJoIBjJcj5KDXY9oE7Nss5Qs9yWb89BFyjhgV1oWMd3JN2N6NKh34v/S7babR2hidOKxzTTFBUH0bvv7h7Z2gOk9Sqr2j9xY2LkY2LlZuOplqmmGlE93yleKKbOyJQ3mFhx6Vy7/HZN+yRKXWIFbiViobMxDPvUJzHs50sJQZpDXQ8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8568.namprd11.prod.outlook.com (2603:10b6:a03:56c::19)
 by DM4PR11MB7303.namprd11.prod.outlook.com (2603:10b6:8:108::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 22:22:56 +0000
Received: from SJ2PR11MB8568.namprd11.prod.outlook.com
 ([fe80::a548:ac78:60a8:8a43]) by SJ2PR11MB8568.namprd11.prod.outlook.com
 ([fe80::a548:ac78:60a8:8a43%6]) with mapi id 15.21.0025.023; Wed, 20 May 2026
 22:22:56 +0000
Message-ID: <47332918-552c-44b4-87ab-0f6b46e70b44@intel.com>
Date: Wed, 20 May 2026 15:22:54 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] media: i2c: cvs: Add driver of Intel Computer
 Vision Sensing Controller(CVS)
To: Mehdi Djait <mehdi.djait@linux.intel.com>
CC: <linux-media@vger.kernel.org>, <wei.a.xu@intel.com>,
	<atul.raut@intel.com>, <sakari.ailus@linux.intel.com>,
	<antti.laakso@linux.intel.com>
References: <20260514184431.288353-1-miguel.vadillo@intel.com>
 <20260514184431.288353-2-miguel.vadillo@intel.com>
 <ag2s6q1XJ7bdP4ai@mdjait-mobl>
Content-Language: en-US
From: "Vadillo, Miguel" <miguel.vadillo@intel.com>
In-Reply-To: <ag2s6q1XJ7bdP4ai@mdjait-mobl>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0041.namprd03.prod.outlook.com
 (2603:10b6:303:8e::16) To SJ2PR11MB8568.namprd11.prod.outlook.com
 (2603:10b6:a03:56c::19)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8568:EE_|DM4PR11MB7303:EE_
X-MS-Office365-Filtering-Correlation-Id: 194fdab4-d42a-412e-7945-08deb6be574b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|4143699003|22082099003|18002099003|56012099003|11063799006|3023799007|6133799003;
X-Microsoft-Antispam-Message-Info: mXj0JFaWDIBYL3V0loWgo2WM8XDE3KGLdH2eq9QD6sq4lMYmoANEYJCxnYJTtATB57J+b8vaMB665wFpz+/DJTjbv356Ki7qpIFVTYVwpQl7imJ6J6zQCIHtgpqXlPI0LnGFscdKnA0YUWwi1wipDglPtCYqltd2Ovq1WtIEvXPdO9eaJ3CMIVRgL/3tB9YFwjHRKrHpj4qcNnjNJWE7eJ5eGqEA5CxcKLYlOTYYw6FsRjRi/f1jZkC5GYk4xpK+2RYo9vEnfl4O46ZRILynLTx2PASfk7ulSmam1Fj7GrxHxIMJuuv3udo6JZ4BW6p5WsSjFzSUbh6195kTuOTNJekRAZIXiQCM3Q+C6VvfaJYtcCsy0nbwyPDx5J41MmoNXnvohqcjRdCXKr1AVnYQthvIGyXRVsrlgOjsRZnov5rDLH9a8YnY8ogctgtbpzy2bltw6v8ouGchxdb8mN/YZxZjQuk9+XZpm2H1SdomtIwxRw3ICOf5Y0TOJtvXLnI3TOsNWEsHOWQIeUFVmny1WqsmkzvWxmOyAC23oanlgJILEW/G4a3hpLGEq+4trej2UMIuBMzqOayzfor0Jt/+Ulp54mxqXVRjOxpFWiNYfq/8XlVAIneT/D6G333pBy3v/fXAHwDMs3GN5pparkrUkX1LsoSfnJyp94hWWTjNLwbj78K1aZH9WAnTt92PnYdL
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8568.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(4143699003)(22082099003)(18002099003)(56012099003)(11063799006)(3023799007)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2lDb2tpd1RsOW1KK2I2dnNtYk1kOWpKOXhIaGFGaEc4aFFkWlowWVQ0eHox?=
 =?utf-8?B?dnRISDV3bmxsVWluWHhLdDlWbW5laGdzcFlDVlJQUVlBS2QzVG5Td2RFR3FS?=
 =?utf-8?B?b1FjV2U0YW5WRHlsMENBQkZVN2p1S0lVOWJ2WHdzZlEyd2VhbDR4TTFLL1pU?=
 =?utf-8?B?TDF5M05yVlhTcUovQzMrR01zSVZpVFpYTWJJVzIxQU14anNCd2FFKzlJQ00z?=
 =?utf-8?B?dUN1UHNOTitkSWNRdElidUVHWWh4Z2tJVEdBcklqaDkvK2p6K2dHRC9MQXVN?=
 =?utf-8?B?TTZBN2NORC92NnBKNmhwUytBNGdVOTIwUVZHR21BeTM2VTJYeFdpZUxtS0Vl?=
 =?utf-8?B?RG5VWHZkYmJQM0Y5R05XRmxCR0dsYnErSm9naVJxNHhacXlhS2tWZ0xaem1s?=
 =?utf-8?B?NUNJV1hRcFIwMldVTytpZk5aaElqS0IwT0szYWRieW9UamsrbzNWQlh1RFhy?=
 =?utf-8?B?SGcvTVdyazVWVFVUeEVOcTBPM3RPblhHZHFnSVhnVlI5QXNLeUNmVGRLR0RP?=
 =?utf-8?B?YUVlZjBHaDNDOGh4am5UV2FDRU5lcVdKSjh1YVdHeVhVT1ppUGlkMVBYNGFP?=
 =?utf-8?B?Q1VGOTZ3NUQzSlFBZnVoUDhHZ1ZTck84aU10dHVZWFZTUHlFbkp5ZjRuWG9n?=
 =?utf-8?B?Z0c2OUVDUkRuRm1oU2xkdW9MRkFQelNrdGFVaXcxUkNqU3RkRzY3VzhJb0h6?=
 =?utf-8?B?MjNVSjh0RFZCRmJiK3lvUVR6ZXlSR2RPS0xVL3RQZ2hmTUxpQXJaNGphVEIw?=
 =?utf-8?B?cXgrd0tDOGFubkcrTWZROG1WOVNoZUtENkxEd2dsSUJzbmFwMjZvV2J4aFl1?=
 =?utf-8?B?dk84Tk03ZWlNbnNEaU1QaytOU250cGtSUm5BWmdxZUJrdnJ1eUp1UFZ1S1Fz?=
 =?utf-8?B?VFBBVVVReDQwTVpjdnlvRWZNM1NkVUxncVRNV2N4cURGVmpxVVBzczdvSFY4?=
 =?utf-8?B?dk4wTUZCNjJ3WFZ6bjVnb3JkRlVEZWtNb0dvdkFlYVk3d3NEMzE5SDd5MTUr?=
 =?utf-8?B?T21xYk9uOHhvZTlvaXRwQ1QrTURReXlYM1dueE9jdVRUWTlONnI2cXRNV2hu?=
 =?utf-8?B?cU90UHlBTUZUMDZnczl6ejZ4NHM2N09nVkJaSTB0UTRMTkl2RVcwRWxNVm4x?=
 =?utf-8?B?R2JSL2dxd016NXBnNjRXSlE4Rkx6UmpDeWVYNnhjRVhLWFk0YXNOd0w5cnFP?=
 =?utf-8?B?UklXOHRGRGRWQnpMNFRUMmxvZzFFamR3SFlOQTZnRmRKaXdoSEZiNWpmQ3ov?=
 =?utf-8?B?Ry81T3pST2lHY0p6SHdJMzNHN00wTWhyZThVWG9zTXlxZVIvRU95MXhWczk0?=
 =?utf-8?B?YlltemUzamltc1A5RS8xVnE1OS83dEI4YnlPNGJBcm93UGsrUzc5aldLZXB2?=
 =?utf-8?B?eGdEUC81cGpRaU5rZzk2eEl1azduOGZuNUI4dUtkOGR4YlUvOE5penFrcUtT?=
 =?utf-8?B?b2tCWXRjd1lpc1ByaDlUcmhSQXRZalBKeTlxb0ZTMjhHZlZEcE9oUUhNejVr?=
 =?utf-8?B?YWZ1VGVtZ1JmUzBzL1lhTFVMZGkvR1dJM1M0clpPV2FCamRXZDg0Z0FkSlNU?=
 =?utf-8?B?ZDhpSHhGM1c5TTdKQ203SlpEcGt2YnFmRlkvVENiMnpjUTRQTDZQMkJlaWNk?=
 =?utf-8?B?RWl3b3NwKzBNNzBDdUErWXpZdG5XSVo1ckwycDBpM1NqTWlVZXhrc2lYWUVa?=
 =?utf-8?B?OEorbzBSWjFDWUhQMmdPRFFRK1Zrb3A4b0pjU00wQUt1dGtiRnY1d2hNZjVr?=
 =?utf-8?B?aDh2Nk04d3kyYjdwVnphVnYxZ1U3UGZWWGIyUDh1bnR4c0hlNnprbDFmdnNI?=
 =?utf-8?B?T0o4dkRxanZXbUZIUWRXWVBSWnIwR2FHa2syN3M2bjZqRjRENFd6c3JWbkdw?=
 =?utf-8?B?YWVieXlsaU9keFlITVE2a3NPRjhwRUR2VnFWZlMrN2V2UzB1QW9Vc1I1bDA3?=
 =?utf-8?B?YUE3bTRjSVRCTEgvN3MwSmZ5T3pRRUdMUHpSdHovQVNsTkVWMFhSdVFPUm1V?=
 =?utf-8?B?QU05amJoUjhkcWZreHFZbGhSKzBaQjhSNXJFUyt2SiswODRxbFVBeUZtWlFO?=
 =?utf-8?B?QXRLQkkzOTB4WFlUcURUNlB2c3R0Um4zbGs4MDh5VTJTM0ZhMUhaSWt1KytJ?=
 =?utf-8?B?ZlhGTGRwWnlPMldQSVdyeC94T1ZmN2lqekdmaHpsdTZKdVZQVllKYktWNGpr?=
 =?utf-8?B?a3NNSHJEMVEzemo3Zm9WQzRRZHB1WHVpN1hBQ1FBUW9YQkdKMmFEV2MwMm4r?=
 =?utf-8?B?aGl1L1luRjFBanBKY05EUjZWZ1R2TmhXVklMZ1pJVHB0ajI2ZkdNckkyODRh?=
 =?utf-8?B?YWRWR3Vqa0RyOHhCcjUwR2Z3RFNPbWtoWHo5ZWlKT25QaFY5T0JUMVBSbkdR?=
 =?utf-8?Q?y6bgX1xhu70aQIBc=3D?=
X-Exchange-RoutingPolicyChecked: bwNW/pz4qehCvB+MSd9MK3U07bsdaNIVaUXpAaBXkhvnGteIA2QesMybhJTY93fzyL36FCEBCadNg4KTWwBY6sOSB2cEAfDBLp12CAxcgi9V5xZfPB/xW+MNBzVIZqAdKBISS3vZI9HXw8C6XsqALilutE+jBHDfaxRl3mEGi0KLFn+Nv7h9RqwqVjsOrRIZ3shyco9yhc54euAt++/bvpD1/oNLob2NxQKxBaTKocpZAWnYkpyjYImIceQxlcZS/9CZKciPCe2h6CCSic398XV0s13wVcot+8vW6OreQmNJz1ymaWaoF4JyEQLSMnqje4qCyrKqTzO2vec5aANnxw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 194fdab4-d42a-412e-7945-08deb6be574b
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8568.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 22:22:55.9722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Qou6CtCi1bCDUIz4tIOz9aV1Ntpt6j+iA9ojsmhEdKh2byutjhFrNnckHoldbU/SXyvPCyVhauksTSSkmLp1hSuL6jlhvhj3M4snZvLpeQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7303
X-OriginatorOrg: intel.com
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-62357-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguel.vadillo@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: ED41859C15D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Mehdi,

Thanks for checking.

On 5/20/26 5:58 AM, Mehdi Djait wrote:
> Hi Miguel,
> 
> Thank you for the patch!
> 
> On Thu, May 14, 2026 at 11:44:30AM -0700, Miguel Vadillo wrote:
> 
> [..]
> 
>> +/**
>> + * cvs_hw_init - Probe device for prefix support and apply quirks
>> + * @ctx: CVS device context
>> + *
>> + * Sends GET_DEV_VID_PID and probes for a 32-bit prefix.
>> + * If it matches ICVS_PREFIX_VAL, sets ctx->prefix for subsequent reads.
>> + * Then reads VID/PID and applies matching quirks.
>> + * GET_DEV_VID_PID is supported by all protocol versions.
>> + *
>> + * Return: 0 on success or negative errno.
>> + */
>> +static int cvs_hw_init(struct icvs *ctx)
>> +{
>> +	struct i2c_client *i2c = ctx->i2c_client;
>> +	struct icvs_resp n = { };
>> +	__be16 cmd = cpu_to_be16(ICVS_GET_DEV_VID_PID);
>> +	int cnt, resp;
>> +	int ret;
>> +
>> +	cnt = i2c_master_send(i2c, (const char *)&cmd, sizeof(cmd));
>> +	if (cnt != sizeof(cmd))
>> +		return -EIO;
>> +
>> +	cnt = i2c_master_recv(i2c, (char *)&resp, sizeof(u32));
>> +	if (cnt != sizeof(u32))
>> +		return -EIO;
> 
> Is it possible to use cvs_read_i2c() here to avoid code duplication ?
> Something like:

This could work, I will check.
> 
> 	u32 resp;
> 
> 	ret = cvs_read_i2c(ctx, cmd, &resp, sizeof(resp));
> 	if (ret)
> 		return ret;
>> +
>> +	ctx->prefix = resp == ICVS_PREFIX_VAL;
>> +
>> +	/* Now read VID/PID to apply quirks */
>> +	n.cmd_id = cpu_to_be16(ICVS_GET_DEV_VID_PID);
> 
> you already defined cmd, use it again here.

Correct, I think this is better.
> 
>> +	ret = cvs_read_i2c(ctx, n.cmd_id,
>> +			   &n.resp.vid_pid, sizeof(n.resp.vid_pid));
>> +	if (ret)
>> +		return ret;
>> +
>> +	cvs_set_quirks(ctx, n.resp.vid_pid.v_id, n.resp.vid_pid.p_id);
>> +
>> +	return 0;
>> +}
> 
> [..]
> 
>> + * cvs_core_probe - Shared probe path for I2C & platform instantiation
>> + * @dev: Parent device
>> + * @i2c: I2C client (NULL for platform devices)
>> + *
>> + * Discovers IPU, parses ACPI resources, sets up GPIOs/IRQs, initializes
>> + * sub-device (CSI) and host identifier, and exposes sysfs firmware interface.
>> + *
>> + * Return: 0 on success or negative errno.
>> + */
>> +static int cvs_core_probe(struct device *dev, struct i2c_client *i2c)
>> +{
>> +	struct pci_dev *ipu = NULL;
>> +	struct icvs *ctx;
>> +	int ret;
>> +
>> +	/* Locate IPU device */
>> +	for (unsigned int i = 0; !ipu && icvs_pci_tbl[i].vendor; i++)
>> +		ipu = pci_get_device(icvs_pci_tbl[i].vendor,
>> +				     icvs_pci_tbl[i].device, NULL);
>> +	if (!ipu)
>> +		return -ENODEV;
>> +
>> +	ret = ipu_bridge_init(&ipu->dev, ipu_bridge_parse_ssdb);
>> +	if (ret < 0) {
>> +		put_device(&ipu->dev);
> 
> why is put_device() only used here ? And not again in other error paths
> after ?

Good catch, I will handle the error here and where needed

> 
>> +		return ret;
>> +	}
>> +
>> +	if (!dev_fwnode(dev))
>> +		return -ENXIO;
>> +
>> +	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
>> +	if (!ctx)
>> +		return -ENOMEM;
>> +
>> +	ctx->i2c_client = i2c;
>> +
>> +	ret = gpiod_count(dev, NULL);
>> +	switch (ret) {
>> +	case ICVS_GPIO_SYNC:
>> +		ctx->res = ICVS_LIGHTCAP;
>> +		break;
>> +	case ICVS_GPIO_ASYNC:
>> +		ctx->res = ICVS_FULLCAP;
>> +		break;
>> +	default:
>> +		dev_err(dev, "unexpected GPIO count %d\n", ret);
>> +		return -EINVAL;
>> +	}
>> +
>> +	ret = devm_acpi_dev_add_driver_gpios(dev,
>> +					     ctx->res == ICVS_FULLCAP ?
>> +					     icvs_acpi_gpios :
>> +					     icvs_acpi_lgpios);
>> +	if (ret) {
>> +		dev_err(dev, "failed to add ACPI GPIOs (%d)\n", ret);
>> +		return -EINVAL;
> 
> return dev_err_probe() ?
> Please check other places in the probe where you can replace this
> pattern by return dev_err_probe()
> 

ACK

>> +	}
>> +
>> +	ctx->req = devm_gpiod_get(dev, "req", GPIOD_OUT_HIGH);
>> +	if (IS_ERR(ctx->req))
>> +		return PTR_ERR(ctx->req);
>> +
>> +	ctx->resp = devm_gpiod_get(dev, "resp", GPIOD_IN);
>> +	if (IS_ERR(ctx->resp))
>> +		return PTR_ERR(ctx->resp);
>> +
>> +	if (ctx->res == ICVS_FULLCAP) {
>> +		struct gpio_desc *wake;
>> +
>> +		ctx->rst = devm_gpiod_get(dev, "rst", GPIOD_OUT_HIGH);
>> +		if (IS_ERR(ctx->rst))
>> +			return PTR_ERR(ctx->rst);
>> +
>> +		wake = devm_gpiod_get(dev, "wake", GPIOD_IN);
>> +		if (IS_ERR(wake))
>> +			return PTR_ERR(wake);
>> +
>> +		ctx->irq = gpiod_to_irq(wake);
>> +		if (ctx->irq < 0)
>> +			return ctx->irq;
>> +
>> +		ret = devm_request_threaded_irq(dev, ctx->irq, NULL,
>> +						cvs_irq_handler,
>> +						IRQF_ONESHOT | IRQF_NO_SUSPEND,
>> +						"cvs_wake", ctx);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	ret = devm_mutex_init(dev, &ctx->lock);
>> +	if (ret)
>> +		return ret;
>> +
>> +	init_completion(&ctx->cmd_completion);
>> +	init_waitqueue_head(&ctx->hostwake_event);
>> +	INIT_DELAYED_WORK(&ctx->work, cvs_recv);
>> +
>> +	if (i2c) {
>> +		ret = cvs_hw_init(ctx);
>> +		if (ret) {
>> +			dev_err(dev, "HW init failed (%d)\n", ret);
>> +			/*
>> +			 * Fallback to GPIO-only mode.
>> +			 * Some BIOS show the device on the I2C bus, however,
>> +			 * the device is not accessible via I2C.
>> +			 */
>> +			ctx->i2c_client = NULL;
>> +			goto fail_i2c;
>> +		}
>> +
>> +		ret = cvs_get_device_caps(ctx, &ctx->caps);
>> +		if (ret) {
>> +			dev_err(dev, "get caps failed (%d)\n", ret);
>> +			return ret;
>> +		}
>> +
>> +		ret = cvs_configure_dev_caps(ctx);
>> +		if (ret) {
>> +			dev_err(dev, "configure dev caps failed (%d)\n", ret);
>> +			return ret;
>> +		}
>> +	}
>> +
>> +fail_i2c:
>> +	ret = cvs_csi_init(ctx, dev, i2c);
>> +	if (ret) {
>> +		dev_err(dev, "CSI init failed (%d)\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	dev_set_drvdata(dev, ctx);
>> +	pm_runtime_set_autosuspend_delay(dev, 1000);
>> +	pm_runtime_use_autosuspend(dev);
>> +	pm_runtime_enable(dev);
>> +	pm_runtime_idle(dev);
>> +
>> +	/*
>> +	 * Create a PM runtime device link with IPU as consumer and CVS as
>> +	 * supplier. When the IPU runtime-resumes to start streaming, the PM
>> +	 * framework automatically resumes CVS first, triggering
>> +	 * cvs_runtime_resume() which hands CSI-2 link ownership to the host.
>> +	 */
>> +	ctx->ipu_link = device_link_add(&ipu->dev, dev,
>> +					DL_FLAG_PM_RUNTIME |
>> +					DL_FLAG_RPM_ACTIVE |
>> +					DL_FLAG_STATELESS);
>> +	if (!ctx->ipu_link)
>> +		dev_warn(dev, "IPU device link failed\n");
> 
> Just a warning here ? Will the camera even work if device_link_add()
> fails ?

ACK
> 
>> +	put_device(&ipu->dev);
>> +
>> +	if (has_acpi_companion(dev))
>> +		acpi_dev_clear_dependencies(ACPI_COMPANION(dev));
>> +
>> +	return 0;
> 
> --
> Kind Regards
> Mehdi Djait

--
regards,
Miguel


