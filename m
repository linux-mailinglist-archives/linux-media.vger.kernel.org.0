Return-Path: <linux-media+bounces-61778-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mpf/MhZxB2q73gIAu9opvQ
	(envelope-from <linux-media+bounces-61778-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 21:16:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BDC556A00
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 21:16:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7E2543007A4E
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 19:16:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0313737FF79;
	Fri, 15 May 2026 19:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d+dUsRWT"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88AE23E2AD5;
	Fri, 15 May 2026 19:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778872573; cv=fail; b=iaAI9ZEUJ01nR+9SW/00KA+YccXGljltuyeAMwYgcutxeMLMXkWampCHqOmf77U5sl4cl5BGSq88xp5+b8wt9WN0FzUqrjkmPXBjvrP8fbpYmTSK0xTS8TmVOULVWRh/HZU+Ka4/m028qcEaIScO9kSYLUAZIuQFiNsWiBuZRNI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778872573; c=relaxed/simple;
	bh=UyREzTS67NBrwzxK12GBxYQCpW65N74owDYJrM6Spao=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tnM2uz7fHxVtbpRl8z4AV2dF8K/ymrWFEidNA/kOItAutL7O/tqV8o8sEattcWgEnLHh8yHDAXeGke35g1K11OcxAtke0xgEuMT/a8y3zyw4r4Pb4zlUoE07qRhl13DjR0H3FO6qpDmYwT75dh/591Q/q/kB3cqYqR6h7IRFOTc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d+dUsRWT; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778872571; x=1810408571;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=UyREzTS67NBrwzxK12GBxYQCpW65N74owDYJrM6Spao=;
  b=d+dUsRWTmrrqCPC8CX94wBqlbbptFHoskeyejvwc3Q1dReDEWmD06CaE
   wNU919z3comgmT2ev6USCyhltztllCMGiNKmujRl05651z9ilJ2N51Q31
   avyqmXUHGlWMO4ynR5JDgAx+eBg0G2kzwhrPGR6+3R968HzopS516N5ly
   d0FuQrZH1BmKwBVYUGCUi63Ub5xLLDnmvXT5Y7wy1JAnkWAj3dlqyYw2/
   zgpadvRbhKLXlb0mpx3xgCDMgZgg8M315Fdg3f3elShy3J5+Vt9d4j6cT
   PAQWZ6ZfZTcoebcJVC1vdE7+FPmP2GmPm/ZzO7gIXJpy08ELYPo5uUUu6
   Q==;
X-CSE-ConnectionGUID: K2ev3uZCTQ6WTzGsrkc21w==
X-CSE-MsgGUID: V5w09wdmQ4mMDFFDIQCGMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="90142319"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="90142319"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 12:16:11 -0700
X-CSE-ConnectionGUID: Gc2Iew0wSYqpe6M0TY7CUg==
X-CSE-MsgGUID: 5cuaUcVFTfetDX10D3rPwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="276876085"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 12:16:11 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 15 May 2026 12:16:10 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 15 May 2026 12:16:10 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.11)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 15 May 2026 12:16:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d0aUvHernkF6CSQcFkZ6fjX4mwWCI388zwgAarG6RjFFpW2dDhDRacs0G4TzT3SJ1gW9k3wwcxjsVrDKzbwRExC1eOIBuhiqalDAO5FuclPMUxvFWmygTGv/TV+Xxfvie5RtenpTs/TWdi1Y6ZMBMO2/SzxZIv53Lhhg7prmepaHsr1EHFrAMSgCHAAG4cZZPGLl+l7S7oyYa8dQBz9aByN5eylzVw3QGpYl4KowqiT0lM8JV0spHH6dAbseCnIBMnqxGacTzZjpxKanTlipu9egvuqX5xTTc9N8PmUTOJ5w7tUWvg28iPRFVgxzCf3ii6n3xaTCsvUA72L3Ey67ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ygr03TXyyvQxXwuVyibswJqabH1ojYj5YSPJnsWp0TU=;
 b=aw3wPkD5FEAmSngOc1mlpDDu9uxUJgMWp+y0J/C9iEdQxYj+uCWCxHuO7oIuHPrXXkAZulfmyKJLEyUCixpX+iCUexEJ4dGdsv2B3h1VTzd+fhqt1TlxTz0o8aH5WrCLISMaVlGYDB0ZBuk1uuUrOFjfeUUvganQtzH//ZwlW6D14OG8+Q9TfDqJdJqTjtHKcAMQE/GjcQVwN6eOWaHK5iIRahkFwEdiSQWESutBtSfo5md6kiVTkoylRRXwwDoLXQj7dLhjDCf1ZpQzyRUC2PX8dqRKAGZszKvnL+a2RZVNie9oOyImlkDzdppUacXXH4bmemvscADa/7ASaGLtWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8568.namprd11.prod.outlook.com (2603:10b6:a03:56c::19)
 by DM4PR11MB6311.namprd11.prod.outlook.com (2603:10b6:8:a6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Fri, 15 May
 2026 19:15:58 +0000
Received: from SJ2PR11MB8568.namprd11.prod.outlook.com
 ([fe80::a548:ac78:60a8:8a43]) by SJ2PR11MB8568.namprd11.prod.outlook.com
 ([fe80::a548:ac78:60a8:8a43%6]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 19:15:58 +0000
Message-ID: <f7bb577c-abbe-43f5-9630-05288eeb0c41@intel.com>
Date: Fri, 15 May 2026 12:15:56 -0700
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=5BREQUEST_FOR_GUIDANCE=5D_Dell_Panther_Lake_IR_cam?=
 =?UTF-8?Q?era_=28HIMX1092_/_Synaptics_SVP7500_06CB=3A0701=29_=E2=80=94_port?=
 =?UTF-8?Q?-2_streaming_gated_by_bridge_secure-handshake?=
To: Jake Steinman <j@metarealtyinc.ca>, Sakari Ailus
	<sakari.ailus@linux.intel.com>
CC: <linux-media@vger.kernel.org>, <mario.limonciello@dell.com>,
	<hdegoede@redhat.com>, <bingbu.cao@intel.com>, <tianshu.qiu@intel.com>,
	<tomas.winkler@intel.com>, <hverkuil-cisco@xs4all.nl>,
	<laurent.pinchart@ideasonboard.com>, <kieran.bingham@ideasonboard.com>,
	<dan.scally@ideasonboard.com>, <platform-driver-x86@vger.kernel.org>,
	<libcamera-devel@lists.libcamera.org>
References: <CAE_FnZKNn0TzpVi+kaDZd91WtO4FN9S9AtXd9UjQZfGDDsxgfA@mail.gmail.com>
 <agRvdKI9nj4qwDt8@kekkonen.localdomain>
 <CAE_FnZKC+=hq-8hi-QPaHo9o=B_KoDA6+iLY2GLa-cWADMRfGA@mail.gmail.com>
Content-Language: en-US
From: "Vadillo, Miguel" <miguel.vadillo@intel.com>
In-Reply-To: <CAE_FnZKC+=hq-8hi-QPaHo9o=B_KoDA6+iLY2GLa-cWADMRfGA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4P220CA0006.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::11) To SJ2PR11MB8568.namprd11.prod.outlook.com
 (2603:10b6:a03:56c::19)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8568:EE_|DM4PR11MB6311:EE_
X-MS-Office365-Filtering-Correlation-Id: 7eae8b21-c5da-4f24-b335-08deb2b664fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|13003099007|4143699003|3023799003|18002099003|22082099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info: njIIQEH2cJZSSgLEmPRvAsC+pQHqRcm7l70ybvglJ2VCXWAKUzU+JmW3Qh8kunDuqtwlF4D+cZwdekfePCxPJjfz/dTrxCUkceVBwqzQ3Rw5k6ZCnWJkSWVDOXaRC7+FMnu0ImTN9MnubmIbL3e0COncCo9XOXfheCQQd2CUuIh8Pxyv45ZpCAm/6hMDwRCqnXorBdQEe4NnLYDuYWdrU7VktAVKQ8ikVSGpWP9nPChaRllGVBIoVqY6UhxnRK1EOrmncgvNFnJvm5zqKHK3YDxGPyZpRkn5mdXLs+FFZ6ewL3wPx7Ym9Eybu3RyCxPfRuazCkBT7l7YuwLKUjROky4pCB5jalYJx/nwqfKLQ7cn0Zo/kWncwrb94nQFgVwj+1ykF2UKQ0P0ocpe/8sRuqo+RtamOAq1jOnR8heloe7nxwl5t3p9S7idXY1Cgs6OtM1WJYG5Gf0c2MEY1CcE8ys73XkBLYDO0eHMWV49XpJmtgbtWVcS0LuueHDh67R4Vgbu+btqLZeO57+Y3aaXIBWdV+G1JYgQ8hBbuh7hWQAhd04jBtPgUJAEXmAxKOggSYrwoaoYMtA6rvesxqERm03Rf1UIzWsfYvda94cmQtObHeCPpxmXuLKEgAiLNSz0+QSladcTRJCbAbZw+u/oTg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8568.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(13003099007)(4143699003)(3023799003)(18002099003)(22082099003)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHhUVzh0aWJGcE5CNkQwRERZRlp4ZEk0VmZicVFCUnU1ZFJVcVI3WWlYZE9J?=
 =?utf-8?B?RzFyL1U3bWlGakRtQVFoVE1PVS81cE5qek1TNWRqV2E4N21qaFlieVRTMkhh?=
 =?utf-8?B?R0pmSHJZK0dmaUdIYklLMjJySkN3em1kWndScnRxdEx5bC9pNi81aTFwYU5Q?=
 =?utf-8?B?d1FYMTA2NkZyczNVNExQZTl5dko0UXVMQXF4QWV3d2VHVTdlWnNuSHE2RVdt?=
 =?utf-8?B?aFFJZDMvNTE4Tk1HMENrRGt2SzNKOUpkcjhKUmNEbEQ1bldOZDVBZDdkZjdi?=
 =?utf-8?B?WTRnUmEvNHFLVzVzUFVDak5BRXlweEkzNDl4cGtxRXBLdmlnVUZTeEIzNWw4?=
 =?utf-8?B?RUVybzd3WU9DQXRiQUNFaXBMRU0zQ2FvRDVTYUFMOHRCcjZLMm5aczNlVmZz?=
 =?utf-8?B?cHhXVkZISjZZQ1QyMm50Tkd5RlkvNEFzN3h5azVZM01OT3pGcFprR2VpNUc3?=
 =?utf-8?B?VnVlUElkWUdjSm9BYThteXBPT1NSUUpLK0F1azV6UFhBRHNqKzdMNXVxdHhr?=
 =?utf-8?B?ZU9udlpvTzBuaGxlUk53cDUyL0NHMGVrRFYybWNmN2U5L0dkdmRTTTFOTmNC?=
 =?utf-8?B?OU8yQ3ZGclZYZmVPQnUzckUyT01LNDlnZzg3YnY3MkY3ZXFpMk9SM1lyaDZW?=
 =?utf-8?B?NGtwVlMvR2ljeWFMUkI3RWxOeU1JVnlMWWE0YTREUzRhRVBDcDYxaDQvb1o4?=
 =?utf-8?B?b1dFc2hsaGJIZXRlenBhRWpDSjV5THlLbDFTRmpFaUphRTFKUktIQzRWZTU0?=
 =?utf-8?B?aHBKNGE2TzR0UWs2NlJEK1RiMFNHUTZPMjg1WVR6ZFlHbVRFVlF2Q0FhV0hB?=
 =?utf-8?B?d0txNytNSGJsaDk3MTQ1UkNTdEhsZ0JCUXc1RDMxelBJQVdqZk9LZ1RLd1hX?=
 =?utf-8?B?aHZGa0tLWWlhcktNZ2xnSTNpRzRhOTZzR2RTMVlQeG5TUlZ6R1ltTEI2Wmgx?=
 =?utf-8?B?Ung4dlNxUDhrZTZXMDdvZU1UUUJYamxUNGIyMmZIa1kwWkhwZUdPWXVtbGIx?=
 =?utf-8?B?K1NvZHllZGxSM0Q2Y0tiTzN2c214Y1Z6VGRyRWRIaERJdTZ2REFlc3EySmF1?=
 =?utf-8?B?bkZySm5ZdThFbFNiaGUvWGRBMVhCbVJNNGY2VS8zY3ZKZEdlM0p6Z1ZHSkpZ?=
 =?utf-8?B?MWVtRnNqbUUxNEdMdVBRd2crblRiK2tneUEwR0wrL0NjSEx3UE9JN2MzRGZi?=
 =?utf-8?B?Z3RheVM0dmhsUkM2M3RKeVNibzNTMll1dDJ5QTAzeHEzQWVTUHJDN1oyUFIx?=
 =?utf-8?B?SU9Fcm9Pc21HSjFkYWE3VGtWSVY0aStIR3hKZ1dDbm9SamJZU2JyZE0xTXAz?=
 =?utf-8?B?b2U1Mm5XUlBYS0tZQW43ZEhOT3ZlSHhKNDR0SXB3UmIzc3RZMWkxZmk5WW5B?=
 =?utf-8?B?TjlDbjNYMjZDTFNaVFhNazFuUnBkRGZsZXhLVUhlbUFoZ215N0lySmlQM2pk?=
 =?utf-8?B?RDluTDdkdWRqRmRCRkdaUkZTZjAydGZGL2hYbjh5dk9nNmZ4b3A5dWNDbWN5?=
 =?utf-8?B?NFl6VDRJRCt6clRaOGVjWjRqMTFXNUl5eGl5Z1oxbnNydTJGT0FrRFRUM0lw?=
 =?utf-8?B?YTEweHowSnpaR3puUmhkWk5QTHlVMHF4NjRoYmpDNFJWQUxIbGlRcGpYZFZi?=
 =?utf-8?B?SUtWSkJ5eGxSQXpucitpQTN1ZVVMdnNGM0hiTU4yaUxKbTRETXBHV3Z3NlRq?=
 =?utf-8?B?cG0reWVWRS9tQlhkS1pQSUp4Uy9lWFhmWXRLRGt3ek9BUFp4Zm1yK1NJQ2gz?=
 =?utf-8?B?RUtyd1luU2dVelVqeXhtdXRxYjQ2NXMzWUJBY3lNRnVzUjVCMmZBc1p5T3Vq?=
 =?utf-8?B?RHE4bVNDZnd1eDJhNkVidzFxNU9lUC9heXFBOTdCNUlUNWxsSVhtUFlMWmx3?=
 =?utf-8?B?ZW5MWkNJU1UwTGk4M29GZFFoRU9RUmptaGRwWE51bW1YUytDRGFXU0lUWEpX?=
 =?utf-8?B?ZlpTTUxReXQ4SnFXclo0UUsxQzM0M2cxbUZsNk5jc0RYREZnZnJCTU9FOURp?=
 =?utf-8?B?eGdNREMwaWZSbnlkblh4SkRrZk1BdUxYUnFBMWNYTkxaTmZ1amR6djJsUlRJ?=
 =?utf-8?B?Q1RxSGdNalZxcm56L2VpWnB5RWx3aWtYamtYTVJsU2pKZjYxMlN6TDY3OW95?=
 =?utf-8?B?UUZDSWVoNWw5YTZFTmt6VHRwRXBZbU1EblJ4dE5DWXVaR2NOS2o5M0dSSGti?=
 =?utf-8?B?anRvUVpJR3BHS2lQTTZmaERtdlBDV01ySTQrUStTdWZxckJBbjNYaGY4aW1x?=
 =?utf-8?B?Yk81bzNEMFpnMUlaR0hFZ2ZuZ0hqeXY4RC85WEdkL1BzK29MdlNwcXh6RFoy?=
 =?utf-8?B?QWhrZmlvOWRxNkd0aW91dVk0K3lTKzV2MFN5Vzd3UmJxQWVranBpY2JNeHdh?=
 =?utf-8?Q?peyVks1OW5s5Q+zU=3D?=
X-Exchange-RoutingPolicyChecked: TKd0LDiFtgcglji9v033Tgab6yWD14gVxMPSZ8od7sQ3e+aEJ+kr4XOaO6ubEbZZ3JmWnB3pqA9XLBo0jcvW6E9TYq9YWuTHctCsT50nOi+oERwhajbVurYPUKAiD4kB+BWR96Jx9k7Ab+ViuWCtuwINYA+PqecSCiUwGRD36BdM6C8/i/XEadopiBqgbGQxNlPGO9Sg/2ZywZOGjOBLBNwW6ltz5UJ+PRPM9YzGmjCPZIm04fusHOdO66v/cwzdCl2ndxQabJX03hgxf/OX67sQOqBJV5AaB3gNHtFehDfkqodvcvvzT/sQG53uF81dmzVW3eEmR1vd/DEpBJgXdw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eae8b21-c5da-4f24-b335-08deb2b664fe
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8568.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 19:15:58.3437
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mzN+jFkCzJ9dwPIeE1ZUu4Hr6aym3RTvjxSUipf1+CmyJQkXO8sOXrQftnBo6W1I7ozwqi6KMSM774yBClAQGDEB6+Yq3oScYVesNlOt+c4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6311
X-OriginatorOrg: intel.com
X-Rspamd-Queue-Id: A4BDC556A00
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-61778-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,dell.com,redhat.com,intel.com,xs4all.nl,ideasonboard.com,lists.libcamera.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:email,intel.com:mid,intel.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguel.vadillo@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

Hi Jake,

On 5/14/26 3:16 PM, Jake Steinman wrote:
> 
> 
> 
> 
> On Wed, May 13, 2026 at 8:33 AM Sakari Ailus 
> <sakari.ailus@linux.intel.com <mailto:sakari.ailus@linux.intel.com>> wrote:
> 
>     Hi Jake,
> 
>     Cc'd Miguel and fixed libcamera domain.
> 
> 
> 
> Hi Miguel, all,
> Tested v2 today on Dell XPS 16 DA16260 (Panther Lake, Synaptics SVP7500
> 06CB:0701, kernel 7.0.5 staging). Built v2 standalone, swapped our
> out-of-tree intel_cvs DKMS for cvs.ko, kept our hm1092 sensor driver +
> ipu-bridge HIMX1092 entry + INT3472 GPIO type 0x12 handler.
> Bound to ACPI INTC10E1, recognized 06CB:0701 with quirks 0x7a (matches
> your SVP7xxx table entry), read protocol 2.2 + capability 0xd200 over
> GET_DEV_CAPABILITY.
> Then probe failed:
>    intel_cvs i2c-INTC10E1:00: CSI init failed (-22)
> Source is the lane-count consistency check in
> drivers/media/i2c/cvs/v4l2.c around line 504:
>    ctx->nr_of_lanes = ep.bus.mipi_csi2.num_data_lanes;   /* sink */
>    source_ep = fwnode_graph_get_endpoint_by_id(...);      /* source */
>    v4l2_fwnode_endpoint_parse(source_ep, &ep);
>    ...
>    if (ctx->nr_of_lanes != ep.bus.mipi_csi2.num_data_lanes) {
>        ret = -EINVAL;
>        goto err_nf_cleanup;
>    }
> The check assumes sink and source endpoint lane counts match. SVP7500
> violates that by design: HM1092 outputs 1 lane to the bridge per ACPI
> SSDB, but the bridge transmits 2 lanes to IPU7 per Windows USBPcap
> decode of HOST_SET_MIPI_CONFIG (icvs_link_cfg byte 1 = 0x02). Bridge
> does protocol translation; sink/source lane counts naturally differ.
> Q1: is the hard mismatch check intentional? If yes, what's the upstream
> story for protocol-translation bridges where SSDB sensor-side count
> differs from the bridge's IPU7-side output?
> Side warning to anyone reading: we tried forcing sensor->lanes from 1
> to 2 in our patched ipu-bridge to satisfy the check. The IPU7 firmware
> does not fail-safe on lane misconfiguration vs its actual DMA layout —
> we lost the Xe GPU compositor to graphics artifacts and a hard freeze
> (IOMMU page corruption on a domain shared with GPU). Reverted.

The check was incorrect: it assumed bridge input and output lane counts 
always match. That's not true as you pointed, can you try with this change?

@@ -494,17 +494,20 @@ static int cvs_csi_parse_firmware(struct icvs *ctx)
         if (ret)
                 goto err_nf_cleanup;

-       ctx->nr_of_lanes = ep.bus.mipi_csi2.num_data_lanes;
         source_ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 1, 
0, 0);
         ret = v4l2_fwnode_endpoint_parse(source_ep, &ep);
         fwnode_handle_put(source_ep);
         if (ret)
                 goto err_nf_cleanup;

-       if (ctx->nr_of_lanes != ep.bus.mipi_csi2.num_data_lanes) {
-               ret = -EINVAL;
-               goto err_nf_cleanup;
-       }
+       /*
+        * Use the source (bridge → IPU) lane count for MIPI config and
+        * get_mbus_config. Protocol-translation bridges (e.g. Synaptics
+        * SVP7xxx) may receive fewer lanes from the sensor than they
+        * forward to the IPU, so sink and source lane counts can differ
+        * by design.
+        */
+       ctx->nr_of_lanes = ep.bus.mipi_csi2.num_data_lanes;

         asc = v4l2_async_nf_add_fwnode_remote(&ctx->notifier, sink_ep,
                                               struct 
v4l2_async_connection);

I believe, this should match what Windows sends for your usecase. Thanks 
for checking.

> Q2 (separate from your driver scope): on HM1092 we can probe, read chip
> ID, send the verbatim Windows MIPI config, bridge accepts everything
> (state 0x06, no error bit), but port-2 forwarding stays closed — zero
> sof_event::csi2-2 in any test. usbbridge.sys (Windows Vision driver)
> strings include RESET_HANDSHAKE_CTX and 1_BRIDGE_STATE_TRIGGER_CTX, and
> Windows USBPcap shows zero per-sensor opcodes on the I2C bus during
> Hello unlock. Reads like the unlock crosses CSE/MEI rather than I2C.
> Is the per-sensor secure-auth path on your roadmap, or owned by a
> different team (Vision stack? IVSC?) we should be asking?
Yeah, I am not currently expecting to handle the IR winhello camera.

--
regards,
Miguel
> Happy to test patches against DA16260.
> Jakes
> Dell XPS 16 DA16260 / CachyOS / kernel 7.0.5
> 
> 
>     On Tue, May 12, 2026 at 09:24:13PM -0400, Jake Steinman wrote:
>      > Hi all,
>      >
>      > Cold mail to a wide CC, sending once instead of many — apologies
>     for the
>      > broadcast. Community Linux camera-enable effort on Dell PB16250
>     (Panther
>      > Lake, Synaptics SVP7500 bridge USB 06CB:0701). To my knowledge
>     this is the
>      > first working Linux RGB camera on any Panther Lake laptop —
>     OV08X40 streams
>      > at 28.57fps after our IRQF_ONESHOT stability fix in intel_cvs,
>      > independently reproduced on Dell XPS DA16260 + Fedora 44
>     Silverblue by
>      > another community user. IR (HIMX1092) does not stream, and I
>     think we've
>      > narrowed it cleanly to a bridge-internal secure-auth handshake we
>     can't
>      > trigger from outside the Vision driver stack.
> 
>     Miguel is upstreaming the CVS drivers
>     <URL:https://lore.kernel.org/linux-media/20260505223005.84162-1-
>     miguel.vadillo@intel.com/ <https://lore.kernel.org/linux-
>     media/20260505223005.84162-1-miguel.vadillo@intel.com/>>
>     so now downstream drivers should soon be needed anymore (for capture).
> 
>      >
>      > What works:
>      >
>      > HIMX1092 probes, chip ID 0x1091 confirmed, bound to ipu7-isys
>     CSI-2 port 2,
>      > 1 lane
>      > Geometry aligned to Dell production (648×368 SGRBG10, from v81
>      > graph_settings_hm1092 files)
>      > IPU7 firmware ACKs STREAM_START_AND_CAPTURE
>      > intel_ipu7_isys: "stream on CSI2-2 with 1 lanes" (RX listening)
>      > Sensor MODE_SELECT=0x01 ack'd, intel_cvs port-2 mipi config (0x830,
>      > verbatim Windows USBPcap, 5×52-byte chunked) returns 0
>      > Cape FW already at Dell v81 level (1.20.129.0, identical bytes)
>      > What doesn't:
>      >
>      > ZERO sof_event::csi2-2 in any test, including with RGB streaming
>      > concurrently at 28.57fps
>      > 10 host-side hypotheses falsified including geometry, format,
>     MIPI replay
>      > verbatim, AE-kicks, vision_sensing flag, dual-stream
>      > Evidence the gate is bridge silicon: usbbridge.sys (Intel Vision
>     driver,
>      > Windows) ships strings RESET_HANDSHAKE_CTX and
>     1_BRIDGE_STATE_TRIGGER_CTX.
>      > Dell v81 06CB0701.bin (1.97MB, magic VISSOCFW) is identical to
>     what our
>      > cape boots. The handshake exists in cape FW; the trigger isn't a wire
>      > opcode visible in USBPcap, suggesting it crosses MEI/CSE.
>      >
>      > Pinging this group because the answer probably lives at the
>     intersection:
>      > Mario (Dell upstream routing), Hans (camera-stack architecture, prior
>      > bridge enabling), Sakari/Bingbu/Tianshu (IPU7 maintainers), Hans
>     Verkuil
>      > (V4L2 second opinion), Tomas (MEI/CSE if the trigger crosses
>     HECI), Daniel
>      > (INT3472 — DSC0 only exposes HANDSHAKE/IR_LED GPIOs, AVDD/DOVDD
>     appear
>      > bridge-internal), Laurent/Kieran (libcamera once unblocked).
>      >
>      > Not asking anyone to debug — just a pointer on whether the
>     secure-auth path
>      > can be exposed to a non-Vision-stack driver, or who at Intel/
>     Synaptics owns
>      > that mechanism. Even "talk to <person>" is enormously helpful.
>      >
>      > Background + reproducer:
>      >
>      > - DKMS fix pack (v0.4, MOK-signed, single-command install):
>      > https://github.com/jibsta210/svp7500-camera-fix-pack/releases/
>     tag/v0.4 <https://github.com/jibsta210/svp7500-camera-fix-pack/
>     releases/tag/v0.4>
>      >
>      > - Forensic write-up + IR debug history:
>      > https://gist.github.com/
>     jibsta210/8316b6a0bc58910891512945c4e91a08 <https://gist.github.com/
>     jibsta210/8316b6a0bc58910891512945c4e91a08>
>      >
>      > RELATED:
>      >
>      > - https://github.com/intel/ipu7-drivers/issues/26 <https://
>     github.com/intel/ipu7-drivers/issues/26>
>      > https://github.com/intel/ipu7-drivers/issues/51 <https://
>     github.com/intel/ipu7-drivers/issues/51>
>      > https://github.com/intel/ipu7-drivers/issues/72 <https://
>     github.com/intel/ipu7-drivers/issues/72>
>      > https://github.com/intel/vision-drivers/issues/37 <https://
>     github.com/intel/vision-drivers/issues/37>
>      >
>      > -
>      >
>      > Thanks,
>      >
>      >
>      > --
>      >
>      > *Jake Steinman*
> 
>     -- 
>     Kind regards,
> 
>     Sakari Ailus
> 


