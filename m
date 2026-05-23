Return-Path: <linux-media+bounces-62680-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AZ+9MVQ6EmrHwgYAu9opvQ
	(envelope-from <linux-media+bounces-62680-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 24 May 2026 01:37:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A9C5C0E44
	for <lists+linux-media@lfdr.de>; Sun, 24 May 2026 01:37:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 87B4B3006D78
	for <lists+linux-media@lfdr.de>; Sat, 23 May 2026 23:37:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FFB62DAFCB;
	Sat, 23 May 2026 23:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l2YkAFw6"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04154B672
	for <linux-media@vger.kernel.org>; Sat, 23 May 2026 23:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779579469; cv=fail; b=eyZmp1AvPjBEXvkgCHTeT+OODgI+e0M15bXA96kWVYvXArfzJDomdWweAtcbQNwqWmpToo64KU1vEc6M5wL3x4TNOwdQ1Zdysf39cMlyybH8zQ0hN5bAPRpGhnvO0ZOEojAJFcYymCqzwnF6cBZvhCpYDZMZ7GxSmm57kUluaxo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779579469; c=relaxed/simple;
	bh=zqhUJpApZtTRjCfvm6BEIrjetoDbncztxJfgee2kCjw=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=T1nY3aaDHOxcRg5cozHSELU4oOcCatLARn6kpNdYgmqGWUFg8KVSgYRky+VLhACU6UDRzMHrXpqNO4iUZYRpg/pDpo8/tgFXRUQRpYTM/w+Y5RTwGIDxUGdjSyu8fOO32iOMQcsQgzNoDYj6I/Cl+4d6oP3Yy9MWwV0GwhPGn3A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l2YkAFw6; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779579468; x=1811115468;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=zqhUJpApZtTRjCfvm6BEIrjetoDbncztxJfgee2kCjw=;
  b=l2YkAFw67QObzF1Z0EPW40SZphax+CQCinSO4+y2DD/R5Bhemyn5RK/K
   NyBhj+JOn+3jRcHB7ndGIAVxX3gp5J/RBhPr6RCVK8yK4hsLiPcE01J9f
   43BXfRk+M6bP6n+s3jdLlJQutQwgvlhNjeZewpfHXhkPQUlJT+XQmmLEz
   sHyaicF3c05R/lgKmmRY2sHb596rpWkdKVZHUevPgThll23TgneOiaVnj
   uBRD3PcVZLyLkxHpUxpterw+v0+J+efX3HOyVZJ7Rrmffmj6eGhqQpF/g
   /DaMHjqoRkP/5bvlZLXnfNDagz7RkZqhsdR6e1ITvPPhBAKd/zBgEP/ez
   Q==;
X-CSE-ConnectionGUID: tYloXcBYSdmXqe2WIBxI7w==
X-CSE-MsgGUID: QtLxy9XnTOK51nCs8K+VwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11795"; a="98033072"
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="98033072"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2026 16:37:48 -0700
X-CSE-ConnectionGUID: mekFQBXjSNCiXD7jxGn5SQ==
X-CSE-MsgGUID: cN42v+5ZQwmsG7TcXuKYYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="241448204"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2026 16:37:46 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sat, 23 May 2026 16:37:46 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sat, 23 May 2026 16:37:46 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.65) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sat, 23 May 2026 16:37:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WzX8SEY+NgLgJf1odm22gkYCuyTYbWgupXkkxL5okOnLlUBN7NkvsjMHuJuJv8EucZno68ltGYPqKWen2cFZim0Dp2OHYbJvrkVfWeDmAfyvjm0bLK0Z4/X4vXGN1zHLbjL8h+KWsbiH1xbdfru8j7VGRRwWv81CowydhIcCERf4HQIQNCDCXBz1roRcqiCHXKZdV6dOXXLYqxcxLCoFWpmE0e3oVTuWyoGxnf5I24RMu/XGjKYIrAORofk1qqvNvqUvtlZR2G1MLSJRRDcH96HHVdpyHiduvE35W+Q2+iWKuB8ybi344p6l2U+I1ptKVqT3gWywF7YZkhc5Ksj5Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6FedCPqUV25VPfj/P98CzB+D3TUeCBmTElKC6AkpqJc=;
 b=eFKhfSaRACWIMIzWIkh6pPAaVrwOX9X6us+23ecy7KKxHzKaNH6PBi2APvja9kCop2Xl2wu4D8gOSFIenLzawMKEMg8dpHc4MEXmoac7EcHSyPOKs5tn/6T4z4taKKiY+lRio30EaMM+uAPCNyjfJYLYlkrPTqT2oLrSIiwuFGEoX6Szq9EIml+R9luVNx9+9gKkMbW6AoUEmWFfpjmk0XalRuWBf7wh/eZn31FppfpxZlT0f5/sK9XBUX7OXBZ/AhY7jrwRRlQAAYo59DESZK4kioBvgDLUluM4xuwAusSslrx3wrrfD5f6bPCOE3BX2m4sT75TI9tHCWYhuncUAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8568.namprd11.prod.outlook.com (2603:10b6:a03:56c::19)
 by PH0PR11MB5174.namprd11.prod.outlook.com (2603:10b6:510:3b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.18; Sat, 23 May
 2026 23:37:44 +0000
Received: from SJ2PR11MB8568.namprd11.prod.outlook.com
 ([fe80::a548:ac78:60a8:8a43]) by SJ2PR11MB8568.namprd11.prod.outlook.com
 ([fe80::a548:ac78:60a8:8a43%6]) with mapi id 15.21.0048.016; Sat, 23 May 2026
 23:37:44 +0000
Message-ID: <173d3eec-de57-43eb-ba46-d08c8c1dc8b2@intel.com>
Date: Sat, 23 May 2026 16:37:41 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] media: i2c: cvs: Add driver of Intel Computer
 Vision Sensing Controller(CVS)
To: Mehdi Djait <mehdi.djait@linux.intel.com>
CC: <linux-media@vger.kernel.org>, <wei.a.xu@intel.com>,
	<atul.raut@intel.com>, <sakari.ailus@linux.intel.com>,
	<antti.laakso@linux.intel.com>, <kieran.bingham@ideasonboard.com>
References: <20260521222359.16716-1-miguel.vadillo@intel.com>
 <20260521222359.16716-2-miguel.vadillo@intel.com>
 <ahAVpZUnNhI34BAv@mdjait-mobl>
Content-Language: en-US
From: "Vadillo, Miguel" <miguel.vadillo@intel.com>
In-Reply-To: <ahAVpZUnNhI34BAv@mdjait-mobl>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P223CA0030.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::35) To SJ2PR11MB8568.namprd11.prod.outlook.com
 (2603:10b6:a03:56c::19)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8568:EE_|PH0PR11MB5174:EE_
X-MS-Office365-Filtering-Correlation-Id: 78ecadb0-6fed-48d3-b4c0-08deb924499f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|56012099003|22082099003|18002099003|4143699003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: VVQ/083SKRlw84Pu7U7GUe5QDVMpZyehz7IstcbLV4yaLzsfofOscsjQVeRPGQQB5dd7mTHTHBlVtVcQR2oh0EM0rUtO/MuG30jTOK4F/nMr9Y3vV91sz+5h9E+cFeKDgsB5+BKpEsRAH0UImWr/+Nkm7YmgJd7NXk/NKtweJtBWDLRuGZy/UWa2MAN6YeO/HSdUuLWjKOvK9smP/9kAjtMDsq0bmG4JCwc5L+sOi6THNi33X/pD2CqiYWsWwrvf6SDHJuAIAsID1TisjoGlW3rpw9058sUkikPfgHmVoS8rcHHWyFkNnDNON+6PgqIAyAd8mGV7Fl7x5VBnSfvHgu4wFH8tWHDKomsrAN4nMvajPwWBIGEAPt+qZbnnLEvV4YBb1dO/A1Vx+daqsDCG1OL2nM2JCvZ9F1vJiUaFF/dOdudS15XI68HS5mx5az8X5RqX0UytiD2UyVbSkT3JWyxxYSkUbVPoGY7kdbegU/sRrXSE0DygWiw2oDybhe2lAhb3a/WJWPosuqyThNcAYE8JxeuXB//NmPQilOxuBBsQ5yJhfnfxBvSmX1hDajM4XvxylvTL2LZdc5UBl/RSIkN61IbGHAV1X0KsGZlN3dG2/D6BAJzrt+5TN8BzGDQG5TVws4NvLYxhaehhN/WUDobJNKC07GB0pkh++593F4dddppKyZctMDI9eEfhkX73
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8568.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(22082099003)(18002099003)(4143699003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGRUREh4aTY5WVhxdG81WHZxSURMWXhUNlVoN3pzVzFxelBSeXFoV2poU2ZW?=
 =?utf-8?B?dTlWNXVjNDBGck43dUxmZDZCSUwyRXRpOXlqVjF3WlRHcFoxalRYbDkveDNz?=
 =?utf-8?B?dmlJMkdQWGJGTG84bmdNQTUvSXBVMmxSeWsvc0h5bFhlZmY0cGJsMllMMFFr?=
 =?utf-8?B?aXc5RXRBZlF4THVaMkVzUVhOWEVla2REWkFHS09raGN1SnA4RzVzcEtaS0NS?=
 =?utf-8?B?VVRCM1AyWHgxdEpFK3BKUzBvQXZuTGNJV0pSOExVTU9lcW5UL2I1VG5aL2Zq?=
 =?utf-8?B?cU5tOWpieDhkR0p6NUoybVJyQld5djZWS3ZaUFgyNmpUa1pjNjNRdzVuZUlq?=
 =?utf-8?B?T0xpQ2Iwdm0ySEJaazN4Y3htT2w1QlJRTjlHTzg3RWhXUDl1dmVaQlltU1RN?=
 =?utf-8?B?Z3hPeWVsbXNCb2RBQ2FqWHIyNWVaVU1keUNBYWpxV3dvVkhDbUpoM1NKOE40?=
 =?utf-8?B?a1B6UExabk9mK09aNW4vZWNyU25iWXEvSm9GQldyekZqeEdBcmNqU3p1QVBU?=
 =?utf-8?B?TFhXQVpWNmk3ZXFMc1FyWGtvTDhlYTVXcWtOM0ZOakY1WEFCVDhOOXFRQjdD?=
 =?utf-8?B?Um1FRk1LUFFhOWNUWkFpN2x2cEhpNnhPb1p4bE44d3dGS05iUVhGUzlVc2xS?=
 =?utf-8?B?enA1ZmVrVVJ3UnE2d2JIM1c5RnV1YUQ2anZ4Y2grN3lnWGcwaXFTSFdyZGlH?=
 =?utf-8?B?R3pNOWo1L2JlVXp5TElvbG5wYms2RXVUcU12b0xHQUU5RHlvVFhMaWcrVEdH?=
 =?utf-8?B?MzZkNXhuNERJbjJJRFl0cTlGaFp3M245eXBEY0RqV3VZTVpLQmVWTndKWUlV?=
 =?utf-8?B?aUpZaWJZd3NyTnNmTEVZRHhOc3NPeG9valUwcXd4NjdLS3kzaWxmcUY3V09v?=
 =?utf-8?B?dlA1SlRHN0QyUHYrOHBKc1V1R1lEV0dQUnJQTnZRTmlUVDVodFYzUWQ0Wks1?=
 =?utf-8?B?TUpYTHRMMlJuQlpiK2tvVE81S1RzNmFqM3o0T1FsbTF2UHFVbnhkbndPSmho?=
 =?utf-8?B?bnZpZGtPekhFNjFsOWVMdWxhTXlMMHFteXpJSWxBbTdnTFhOcDhGc0l1ZTB1?=
 =?utf-8?B?eW1xczM5UWJsOUVlQTBKWnA1bmdMd0RCd0J2MnZGd1luOGJsdzhZK2ljV0Qr?=
 =?utf-8?B?eDNMMGVkaGhSMDk3eGU2ZWljS2JISnJlcWJJdkE0T2pYb1psbC9mamFxbmNo?=
 =?utf-8?B?T25Xcy9hcEVtNG1lUXBJMHRaZXQ1SG5aMlgraEwvNGJrOUpZeXJqSjFzQ1c2?=
 =?utf-8?B?Q0V1K1dzV3BZSkpVa0pzUUZENDB5Z0pvVnhDSDRjZjJyVGdvWVMwd3NRVVdR?=
 =?utf-8?B?UnhvRythcy9sZC9tNmNQYjVsNzJQZFFrWnREUi9KMUNvQTg0WlNoRHkrS0t0?=
 =?utf-8?B?REdGaFBkUEJrQ3ZZUXlMcTczaFlIN1REQ2Z2dVZRQ05lbHZIajZqR01kM1Qv?=
 =?utf-8?B?Z1ZhTDlpb1Z0ODdFWXRLUEVxSWR5RCs4bFVLbkFPaEV6TXp1QUh0elRRZ050?=
 =?utf-8?B?V2JoaUdjdTUybzNmK2xsVGJYaU1XUFkwSVBJYjBJUXc5c3YwL0FmdW9Kby91?=
 =?utf-8?B?Y2lDdkdDT21FRG8rSHJtRGczU1BVdlRjcWpYVmduZSszZzZLV2lYb1dxMjJn?=
 =?utf-8?B?a1J3bWRWSXdkaUNNYi9uYi8xZHU4R3Fyd2VuMUlISEJJVi9mY043KzRrN2Jm?=
 =?utf-8?B?VWRINWx4OHowQWtqaitULzhsaERrc1A0a2FMeDJtN2RzbWY2ZlBPaEx3VkNk?=
 =?utf-8?B?S05EN2FTTHVDNmMxczFEQTVZaklkOUZHOWNaRUQrM1dxZDJPL3pqSWNjb1BJ?=
 =?utf-8?B?UllxdXhTazJubndQZ2VySnlhTG1Gc0JjVEp0Z01keGpXWCt5N0RIWWg3ckhH?=
 =?utf-8?B?MjFWZjhUbW83SXFOeXorMFE0cDMzSGFxMHpoV0xnbEZwMUpnMnVqWHZuOWpM?=
 =?utf-8?B?NHN1bW45Q3Z3RGlQSnFRSktkQmdBRUQxaXBiVUdzc1V3ZkdKYjFRbUhYVjNv?=
 =?utf-8?B?dkVsWWFmYml5SGxWSGRDT3gxUTBIb1RhejBxTnU0bDAwb29NbUJvczFoQmE4?=
 =?utf-8?B?d0FuQ1VxNWZNRk5HZVFjVDJhUGlxR3dqSEUyak0xdUN6dHdudy9JeXVwbTRC?=
 =?utf-8?B?d2xyejdoNUxEUVlPYWF4U1JiRzBGTVJ4QzJ5MXJ3dXpYMEgwc0VCWlByZWpF?=
 =?utf-8?B?dFhJSEZpTjY3SXNQY2JSZlpWRHJIbTRRUkZRV0c1MjZCdS9jMFV4TzltZkZa?=
 =?utf-8?B?a3p3S28vWEpuWU92NjlsR0dYYjZCaWtWcUVCZzJocExJODhkZWdzTXB0cER6?=
 =?utf-8?B?VzJ3a3JmdGNoTThoOW94Qm5GUTNYVWV6bk1hZHFaR0ZwK2s5SHcxVmV0TldO?=
 =?utf-8?Q?ItxIqD3GXU6R5Sr0=3D?=
X-Exchange-RoutingPolicyChecked: Hmsz4lCaVKuAd4KxHMrorHwFdva9SnXuuFwTlOmE6eXJgxyqOBtWrO1PZ1Ks1gJtjnSdsOVZ+ZWl7NVpKBcDQ9/Z1bDxJD1BQOWo3HzMmdN8U8qGm70V5UNKRCZxyP+Kf8EDCQicIEcjk/JEsmjtxG/6e8+3xFGIX4CGNwBvVFQeD21rMLrWgL32mBuTLSRmsKqkfmDwq7XyfFRwfTlPgDA4wACy/gfpPZ0VkorFzH5u93lt/LCgXgP55Thy1gkWHeI1FBbImC+oe/Q6fYKLqe5oABxaNtwTAMpB6yFxg/6phxzvBH/RG7dlwSOwYOHhB+ZQVuRoXZ5KLT3W6FGsWw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 78ecadb0-6fed-48d3-b4c0-08deb924499f
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8568.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2026 23:37:43.9577
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0mZjs1ydmkAXvyUeZCnk4JowXeJZmhn4XQP6fgfegTqvA/bbf8Q6pOLqpFgQOdwm4P9VjL41/iIITMi5KrWgztEmyCrrf9vjzxhbo35NqMs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5174
X-OriginatorOrg: intel.com
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-62680-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguel.vadillo@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: B2A9C5C0E44
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Mehdi,

On 5/22/26 1:39 AM, Mehdi Djait wrote:
> Hi Miguel,
> 
> Thank you for the patch.
> 
> On Thu, May 21, 2026 at 03:23:57PM -0700, Miguel Vadillo wrote:
>> Add driver for Intel Computer Vision Sensing (CVS) devices found on
> 
> [..]
> 
>> +fail_i2c:
>> +	ret = cvs_csi_init(ctx, dev, i2c);
>> +	if (ret) {
>> +		dev_err_probe(dev, ret, "CSI init failed\n");
>> +		goto err_put_ipu;
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
>> +	put_device(&ipu->dev);
>> +	if (!ctx->ipu_link) {
>> +		dev_err(dev, "IPU device link failed\n");
>> +		ret = -ENODEV;
>> +		goto err_csi_remove;
>> +	}
>> +
>> +	if (has_acpi_companion(dev))
>> +		acpi_dev_clear_dependencies(ACPI_COMPANION(dev));
>> +
>> +	return 0;
>> +
>> +err_csi_remove:
>> +	if (ctx->ipu_link)
>> +		device_link_del(ctx->ipu_link);
>> +	cvs_csi_remove(ctx);
>> +	pm_runtime_dont_use_autosuspend(dev);
>> +	pm_runtime_disable(dev);
>> +	pm_runtime_set_suspended(dev);
>> +	return ret;
> 
> this return ret seems wrong here.

Are you referring to just the space before return?
@@ -1318,10 +1318,12 @@ static int cvs_core_probe(struct device *dev, 
struct i2c_client *i2c)
         pm_runtime_dont_use_autosuspend(dev);
         pm_runtime_disable(dev);
         pm_runtime_set_suspended(dev);
+
         return ret;

  err_put_ipu:
         put_device(&ipu->dev);
+
         return ret;
  }

put_device(ipu) was already done after the ipu_link so no need to 
waterfall all the way down. Please clarify if I am misunderstanding your 
comment.

--
regards,
Miguel

> 
>> +
>> +err_put_ipu:
>> +	put_device(&ipu->dev);
>> +	return ret;
>> +}


