Return-Path: <linux-media+bounces-16859-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DC89595F9A1
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 21:24:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3FB16B21B15
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 19:24:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A77D1993A3;
	Mon, 26 Aug 2024 19:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ge8KPhx9"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C285198E9B
	for <linux-media@vger.kernel.org>; Mon, 26 Aug 2024 19:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724700278; cv=fail; b=YmgmgiXolI898ZKuKsqogpZlFQQ4WMoXAoyppko4gJrjtppr2voP6PMjtIpKOg+Q33pqJrhPYytwXiD5m4t34cuMkw9XtmNvYQ8vXrAFp4gXhT2B6yYLkSe9W8/xGkmy0s1K6yzP9ox1dX9LRkxS0Upta0U4eoaryb5GBmXBCbc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724700278; c=relaxed/simple;
	bh=240VKphlzz+2bTNP1nRpayLHX5EbDhRUBPdLJkrwNbE=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Dsrg6dfVZYUVCsnff11Nfs4ZOvQphS/VAttf/k3MSwXzIH5+2GRko3Z6q8NpRPsGZT2GqO4XBT3lrIX/yTLdWpj++qXz0EdlGhpypAA5lz6Owbjc6MnU8S92msBhh9i57cSoLb3t/XLVNtA0KFAbz02Lc1Ouiw+w0Twi7dE6e9I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ge8KPhx9; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724700276; x=1756236276;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=240VKphlzz+2bTNP1nRpayLHX5EbDhRUBPdLJkrwNbE=;
  b=Ge8KPhx9swG2bVNXFgynKzbSaq6wN7OFHHyGfCxwssITBStYhJSKAr+/
   06LDb7yJ911/3MELkf6zyIHFakDa9Vc29XA/nMAFcc8K437OiJ5dfqMnj
   aaMzBhYpPI6j1L8md5uYkpyZHq5VP9tethGtn20tVINFjkSJuhYCXYY7H
   NV35JHsn0TCSkcM6mxtgy3efxUCTo9kkeLjLKtDzv1ocy9xXNXeZyJuvB
   vwtZNM0KybkdObbCe58TlBXhNqE9AuhkCjJ8X/1SMC3h3pNFxjXrq/pSp
   lefMnsS61pES4GBmkdQ+3bRuiZL4vHiNF9RaagpdmVd8sMQWrLYUg6Yjv
   A==;
X-CSE-ConnectionGUID: dU9AUSxmS1inCkHMMe9qbQ==
X-CSE-MsgGUID: MWujcdzrTIq5+6e52FR6qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="22952858"
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; 
   d="scan'208";a="22952858"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 12:24:36 -0700
X-CSE-ConnectionGUID: 3Xu6IYGCSaeFuS4nE8TNFA==
X-CSE-MsgGUID: KzTXSIRASAiXlmnbd2ApKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; 
   d="scan'208";a="62283229"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 26 Aug 2024 12:24:36 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 26 Aug 2024 12:24:35 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 26 Aug 2024 12:24:35 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 26 Aug 2024 12:24:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mylE1D2j4tEzhI1+l+NQ0VK3pUpGRp+dh8S1+iWo6w9Mt3iFwBleSXvCEa01t4XoYlHEvI1QDEJBuIkS7xi+wTkY7yN8jya/aoexkuRNXP5tbarpclbIJWYDjFaLnVKPL3KrhQB9NxitwQNRbC89MTgLCDdZMR3fa4sbpub05bGSXu6DAsIlhOkTTUUYhi0+DUrR57lUpyylstTQsgnAPJfbgeREvN+ANAt7EcoC64CFbibqzGyfOs+Aajzw2I41TGDGP7gbQjv7VkJoXHpTaiOn1zLbiivPKFMLGqObzaotNU7zwRGK2lytYEjkGFx6sIH5PprcLIetckClUhq6qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AN6YDHN+9WmpZ7Z87E+15fuuWV10De7gmXyTvlK7Lnc=;
 b=Eh5fOrl6PA64GGf8DgV6QfPuZ2t509ERTzocrimhGsweSKpPK8AGn0YgwqIoqgwxUrCJddgRFYXi7LoXL/H+OCNvOxOB+U/PbZ9FoWV0EAtGiMTEgnFzfbeISJTnpAqxiZM3QKUEyVlRhrLSn/CeCkL5hjetf0lVm7ymcGmPgf4o4vERncRKc7GWSRNfCiyUrtDHRQjfE2pRKaF1BHcsUl3kZ8GShPZtGuJnDzYvlsJ55reMwVYK3Zckg13snHHpWjxwhs5NGVCQo11fHXum12Apv0CQxaL+ib9TLlq2kPMhbDXWpCoCH8bWbcH+y/B8uvnJymBqbCd7vcQhlXhwrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6194.namprd11.prod.outlook.com (2603:10b6:208:3ea::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 26 Aug
 2024 19:24:32 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7875.018; Mon, 26 Aug 2024
 19:24:32 +0000
Date: Mon, 26 Aug 2024 19:23:17 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
CC: <intel-xe@lists.freedesktop.org>, <linux-media@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
	<sumit.semwal@linaro.org>
Subject: Re: [PATCH v2 1/2] dma-buf: Split out dma fence array create into
 alloc and arm functions
Message-ID: <ZszWJaX9I3sh5jxZ@DUT025-TGLU.fm.intel.com>
References: <20240826170144.2492062-1-matthew.brost@intel.com>
 <20240826170144.2492062-2-matthew.brost@intel.com>
 <aebe8cee-8674-42f0-b112-439da1ef7073@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aebe8cee-8674-42f0-b112-439da1ef7073@amd.com>
X-ClientProxiedBy: BYAPR07CA0047.namprd07.prod.outlook.com
 (2603:10b6:a03:60::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6194:EE_
X-MS-Office365-Filtering-Correlation-Id: cb48c614-1bb5-4d58-8338-08dcc604b693
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?NOAJeJNx0RHE/QsDcTbyFaaskC7MqkyxGpFKV7RRlQLJklw3cRpLqJFnDH?=
 =?iso-8859-1?Q?1cRDsjPt8uzrKxeDTOO7htdvxW87vCj5jeHwHLppyGncT6dTW0/01xxQLa?=
 =?iso-8859-1?Q?ag32f3i0YZTQlhWynDtezjrNcPWZZQjkBzCYlS2IHVHP2gjw5mj+/mwiuA?=
 =?iso-8859-1?Q?/0RN7/bn5MV1BmMFZ4SqsqvkYNYyUiI8OKIKhlDcn8xOT/Vmv9Uf9quX+3?=
 =?iso-8859-1?Q?PC8jdrXf7z4sQ0aI7A+npD58ElaudpTZPm7co4HFn+Bx3WPkSXKk5EdaAZ?=
 =?iso-8859-1?Q?R8QUr2/SKS3TSc3MsiyumlraW4F6S8lpVBKI0QT0c3zkIRTL0/JvKFrSiC?=
 =?iso-8859-1?Q?wG643Feh0uruMVe0NHoL9BxWYQYudT2CzKIPalRlX/gym7X9r5+I6A/VOz?=
 =?iso-8859-1?Q?6SZ6K+eC36F62svQyBNKpLIgGUWrJB88i89MQUT13I3q5oOi/V6r8JY9x4?=
 =?iso-8859-1?Q?bkquPo4xJITeKt25Bn1NcaMWXd2M9w6zZLiwPHmNXpF7GMlJh1O26lnWK0?=
 =?iso-8859-1?Q?aP9Uy4Sha4nLbNMjyLYJwJjXLg/mfRGckPmy/CYm80X2o8tB1DHkReb8rS?=
 =?iso-8859-1?Q?0GOH0ekN55H2njFVk6gfJ6pDuyScABdkT8BOoE/DnBUSYIUZYD1KCIgT7P?=
 =?iso-8859-1?Q?SjPCxDRoYs5+aq0sF9N7he17rVv7QOWqZwOcyrK/OXdqzmpxe+THlxwP5u?=
 =?iso-8859-1?Q?DsXrxXlhKJqRgvp+nEPUinhAafOyIEYdopVujfBAujQTNXCx0koAGdZx5F?=
 =?iso-8859-1?Q?BIzefkybZn5Fe+BUvk4UlWFmpbi+0QxIHwP7p1v4GGOOrxQ9PjmbzJeQ3n?=
 =?iso-8859-1?Q?CT1duBWbWykq0H9e2nyDXHcZaOJxUFqN0+Nzn3O15ymWY7LhFpFN7BY3wM?=
 =?iso-8859-1?Q?FzoK9jELmILsvyhsM+NLy8VAGEKUTgM0JFZiOJzpr0dPE54ELZLSzGqKC5?=
 =?iso-8859-1?Q?5pVDsyJG2pEDEIVthsJ4h5DqpJNIhQN9fdunGDxyTVMLaWPfZXe4a2eRrS?=
 =?iso-8859-1?Q?uWOi+qEKaaJJ12wFbOq/pe4oo8dwT5gsKCrL0yxiaPCN6VvbHrjeb1RExT?=
 =?iso-8859-1?Q?xNGk3KefgY/3ItWmBgChpnRrwDVmtKj/T6O9zantUGKn5ULj0zMoyZx7F2?=
 =?iso-8859-1?Q?Didfom6ZQbHtk/kLzgPw/Zb8VO4VhCj9azkro6JJYDQSznJ9kL9WpP2A0b?=
 =?iso-8859-1?Q?zIdnzZIgEJmnRrEs8VqWhzamUEzbymKDHEhYAFK+H81DmLo72G3yTe9lq0?=
 =?iso-8859-1?Q?F71dFk9w0FeWhftS2cijum3UlFBPLGe3+rEqBFj7GecvTaURnpybvGIdEi?=
 =?iso-8859-1?Q?7/eWSl5nOIZmnYTmm0//4ZXD0J99grSkM9SAJFyCF6cm3OigbpsS/4+/2U?=
 =?iso-8859-1?Q?COo1P1syyteap49Sb5BpQPQ0Hv+S7DoQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6522.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?RgxP3fv7T+cp+dSk4C+7tNHNGF5L5V/moonZav/sp3aGsWuyJCLVXWlXW7?=
 =?iso-8859-1?Q?9GAW42NTY2/nlw7YO/BxQrELZ4VP4lFgPc9KtKVYUjKLCfXU4h0yTteRaO?=
 =?iso-8859-1?Q?n4Uz216X8/WvE8B8SSFyAKVBEUxz2Y5As4uNEklG5LF5bDCq1FOSTMdVRO?=
 =?iso-8859-1?Q?h6xx1lvZeF6l1TudHDRE2JwgxLGc+RPZ/DTqTidOR2ajXMKutxuJ7FftSj?=
 =?iso-8859-1?Q?8UHzBLEqX9x/HDlsQStJ0Y1IAukNTPKsyvFrs4vRw4a0u8MmxXEFzMh5Ro?=
 =?iso-8859-1?Q?1iyHfxUp/mIDt2s6sZxw6x631Z5ImqG/+HZTZIDXLUdOIGSI5JC88/sn5I?=
 =?iso-8859-1?Q?0kTGPPPugBnVUTUwlKL7ve6T1MsdGao4L+gZzTv/IJTUmEqKBV2ETJKOjH?=
 =?iso-8859-1?Q?qykrBIG+MpKZKV6YlbENoDcZV8mba8CEs73TpiDGhKn12iPAuFgoIIn9Wq?=
 =?iso-8859-1?Q?B4lV9w48y0kJk4nv7b42/ArH76j1BaeY630Js4wpzJvCStdnCycn6DsDh2?=
 =?iso-8859-1?Q?6H2DxLPw+1YXdJrizLNhK+CA7Oesbj31ZkTGj+hsPJqErgiJsf8JaDZbs6?=
 =?iso-8859-1?Q?5c1NV1f0cnHBKiGYCyEZ6JMiECuwWcovjQ4j+hkRadU5k0ZSvE3MVPO6XX?=
 =?iso-8859-1?Q?DAwY6aDFMSpaRE92OgJsGb1xUeQI+B28O4zYUUkpNAhRviFkz6FNEKV9gG?=
 =?iso-8859-1?Q?BKPP/V8c3G5txMeenL9d44qhINMfKcyYAI8slpmNcRSMP5qn72ad+vVEof?=
 =?iso-8859-1?Q?dlqDoEaDjGpUbmp2BUwT7JS85HIrz1bYs7Eoeh1+KUfXACv5Ijo/YFN8WN?=
 =?iso-8859-1?Q?nZUfDa0dTr2EntARbV6jaXk7sgloJrTVonw6Ge18JlUeIIYZRdpNMWogiN?=
 =?iso-8859-1?Q?jzoinHjHXshrS/gZGpMvjGkx6yI5jbRxHF79Lf8zBs0h+Q0T1U0DOslJUQ?=
 =?iso-8859-1?Q?nBUreq+9BxbxLgR/iR+KNgoG23S2JfE3nwOYcrdPDdacvEFZ9u0fLy55L+?=
 =?iso-8859-1?Q?kCtX/u6r5GeGpZnuECo5ATDxSPaSYKz7glp48fgbS56fJ15AOZ01Z3aZ4K?=
 =?iso-8859-1?Q?9STUmbUQYdJtI5RK/YsEUz2yhEdvDy/+nwF56kOndQyXQykHfNQC42TD8I?=
 =?iso-8859-1?Q?Ap/BATblgEtYJxevyaft+KbUY4aWbLsEU5h8twlUJU0H0E4U2S+ti6auMQ?=
 =?iso-8859-1?Q?puDFVcpqXdhas174KnxteSsW9duokx5k1oDOWS41eDZG1TA5dHRLIUxqcK?=
 =?iso-8859-1?Q?SADm/zu9p0tKmXz8SLLHXcQFKtIp9AzoyLrXPKQGrA+g69UDVnbb9Bugkx?=
 =?iso-8859-1?Q?YHMnXtr6NXm+wHvnben0Gjw+KD0Lmnzgd/VbOhROM9nS8Yt2A+HtDa8ndW?=
 =?iso-8859-1?Q?HTsxcDN/i792BDhP5xklMape0UjPZ9/Wc2VWozFM/HHzA25RQoNWbq8SbV?=
 =?iso-8859-1?Q?5kSPROQapUv/idbn+TfPkbsn6/DNCPlxZZlfxh51XVUsDjiauUCPJ7js0J?=
 =?iso-8859-1?Q?Fddxl82QkwfdTg3AupyN8jpXQj7GW/BkWlBF3XB3e6WdVUtovbQPCcHp0F?=
 =?iso-8859-1?Q?eS7DAkuQgJgKzsK13hB7DXGyykeoyNFSEhSp/WFS9i0+qC5ofBbuh3czsO?=
 =?iso-8859-1?Q?swCTZ3F9PIJr35hALhzw36HtnMBUMPYhPuFOKynYHiHoByzOLBKRiKKw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cb48c614-1bb5-4d58-8338-08dcc604b693
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 19:24:32.6100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NsSQm4kgTsWvJIHoz+q05FOPDnYEEYwHHHytBXf2oU9ctg9JeX8gg20964etYtO6U8OiSkuT68yK8tyd5o1X2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6194
X-OriginatorOrg: intel.com

On Mon, Aug 26, 2024 at 07:57:07PM +0200, Christian König wrote:
> Am 26.08.24 um 19:01 schrieb Matthew Brost:
> > Useful to preallocate dma fence array and then arm in path of reclaim or
> > a dma fence.
> > 
> > v2:
> >   - s/arm/init (Christian)
> >   - Drop !array warn (Christian)
> > 
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: Christian König <christian.koenig@amd.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> 
> Reviewed-by: Christian König <christian.koenig@amd.com>

Thanks for the review.

Unfamilar with the merge flows to dma-buf subsystem. Do you merge this
into a dma-buf branch that we can then pick up in 6.12?

Matt

> 
> > ---
> >   drivers/dma-buf/dma-fence-array.c | 78 ++++++++++++++++++++++---------
> >   include/linux/dma-fence-array.h   |  6 +++
> >   2 files changed, 63 insertions(+), 21 deletions(-)
> > 
> > diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
> > index c74ac197d5fe..0659e6b29b3c 100644
> > --- a/drivers/dma-buf/dma-fence-array.c
> > +++ b/drivers/dma-buf/dma-fence-array.c
> > @@ -144,37 +144,38 @@ const struct dma_fence_ops dma_fence_array_ops = {
> >   EXPORT_SYMBOL(dma_fence_array_ops);
> >   /**
> > - * dma_fence_array_create - Create a custom fence array
> > + * dma_fence_array_alloc - Allocate a custom fence array
> > + * @num_fences:		[in]	number of fences to add in the array
> > + *
> > + * Return dma fence array on success, NULL on failure
> > + */
> > +struct dma_fence_array *dma_fence_array_alloc(int num_fences)
> > +{
> > +	struct dma_fence_array *array;
> > +
> > +	return kzalloc(struct_size(array, callbacks, num_fences), GFP_KERNEL);
> > +}
> > +EXPORT_SYMBOL(dma_fence_array_alloc);
> > +
> > +/**
> > + * dma_fence_array_init - Arm a custom fence array
> > + * @array:		[in]	dma fence array to arm
> >    * @num_fences:		[in]	number of fences to add in the array
> >    * @fences:		[in]	array containing the fences
> >    * @context:		[in]	fence context to use
> >    * @seqno:		[in]	sequence number to use
> >    * @signal_on_any:	[in]	signal on any fence in the array
> >    *
> > - * Allocate a dma_fence_array object and initialize the base fence with
> > - * dma_fence_init().
> > - * In case of error it returns NULL.
> > - *
> > - * The caller should allocate the fences array with num_fences size
> > - * and fill it with the fences it wants to add to the object. Ownership of this
> > - * array is taken and dma_fence_put() is used on each fence on release.
> > - *
> > - * If @signal_on_any is true the fence array signals if any fence in the array
> > - * signals, otherwise it signals when all fences in the array signal.
> > + * Implementation of @dma_fence_array_create without allocation. Useful to arm a
> > + * preallocated dma fence fence in the path of reclaim or dma fence signaling.
> >    */
> > -struct dma_fence_array *dma_fence_array_create(int num_fences,
> > -					       struct dma_fence **fences,
> > -					       u64 context, unsigned seqno,
> > -					       bool signal_on_any)
> > +void dma_fence_array_init(struct dma_fence_array *array,
> > +			  int num_fences, struct dma_fence **fences,
> > +			  u64 context, unsigned seqno,
> > +			  bool signal_on_any)
> >   {
> > -	struct dma_fence_array *array;
> > -
> >   	WARN_ON(!num_fences || !fences);
> > -	array = kzalloc(struct_size(array, callbacks, num_fences), GFP_KERNEL);
> > -	if (!array)
> > -		return NULL;
> > -
> >   	array->num_fences = num_fences;
> >   	spin_lock_init(&array->lock);
> > @@ -200,6 +201,41 @@ struct dma_fence_array *dma_fence_array_create(int num_fences,
> >   	 */
> >   	while (num_fences--)
> >   		WARN_ON(dma_fence_is_container(fences[num_fences]));
> > +}
> > +EXPORT_SYMBOL(dma_fence_array_init);
> > +
> > +/**
> > + * dma_fence_array_create - Create a custom fence array
> > + * @num_fences:		[in]	number of fences to add in the array
> > + * @fences:		[in]	array containing the fences
> > + * @context:		[in]	fence context to use
> > + * @seqno:		[in]	sequence number to use
> > + * @signal_on_any:	[in]	signal on any fence in the array
> > + *
> > + * Allocate a dma_fence_array object and initialize the base fence with
> > + * dma_fence_init().
> > + * In case of error it returns NULL.
> > + *
> > + * The caller should allocate the fences array with num_fences size
> > + * and fill it with the fences it wants to add to the object. Ownership of this
> > + * array is taken and dma_fence_put() is used on each fence on release.
> > + *
> > + * If @signal_on_any is true the fence array signals if any fence in the array
> > + * signals, otherwise it signals when all fences in the array signal.
> > + */
> > +struct dma_fence_array *dma_fence_array_create(int num_fences,
> > +					       struct dma_fence **fences,
> > +					       u64 context, unsigned seqno,
> > +					       bool signal_on_any)
> > +{
> > +	struct dma_fence_array *array;
> > +
> > +	array = dma_fence_array_alloc(num_fences);
> > +	if (!array)
> > +		return NULL;
> > +
> > +	dma_fence_array_init(array, num_fences, fences,
> > +			     context, seqno, signal_on_any);
> >   	return array;
> >   }
> > diff --git a/include/linux/dma-fence-array.h b/include/linux/dma-fence-array.h
> > index 29c5650c1038..079b3dec0a16 100644
> > --- a/include/linux/dma-fence-array.h
> > +++ b/include/linux/dma-fence-array.h
> > @@ -79,6 +79,12 @@ to_dma_fence_array(struct dma_fence *fence)
> >   	for (index = 0, fence = dma_fence_array_first(head); fence;	\
> >   	     ++(index), fence = dma_fence_array_next(head, index))
> > +struct dma_fence_array *dma_fence_array_alloc(int num_fences);
> > +void dma_fence_array_init(struct dma_fence_array *array,
> > +			  int num_fences, struct dma_fence **fences,
> > +			  u64 context, unsigned seqno,
> > +			  bool signal_on_any);
> > +
> >   struct dma_fence_array *dma_fence_array_create(int num_fences,
> >   					       struct dma_fence **fences,
> >   					       u64 context, unsigned seqno,
> 

