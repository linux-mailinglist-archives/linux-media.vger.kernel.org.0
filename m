Return-Path: <linux-media+bounces-57311-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMnRHgbNxmn5OgUAu9opvQ
	(envelope-from <linux-media+bounces-57311-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 19:31:34 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D60783490BC
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 19:31:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 51761305E15D
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 18:30:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42A90408222;
	Fri, 27 Mar 2026 18:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cagsv12P"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3742E38F222;
	Fri, 27 Mar 2026 18:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774636213; cv=fail; b=Iuv40/eWW3lvBjvx7IxM3fJPQgwhfj1GFi+xsQCC2gOsNWmDBpostLzO9gaX7n+vCDcdOK8fN8Gg2ObTW0admjCRVvQNqWQWmgICs4kl5ekHe3K7kNeWhAfm8fHD56e4A6CvJ5pPLX42WPCrqMjZvOQLb8VpW1fTF8NR/2rmTHc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774636213; c=relaxed/simple;
	bh=4knFdZ4hMXVOWZKBeNuNmODbJmfWy9APQHimtIbNFDU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=W9G8GRXU3mnqzlvIv3YtHHeAXB2RdNWiYXAKiOlG7A0YsCs1/pr3/cXHjPUTE/CTeLXPavWEM2/CFQ2TiHPq0WmGprLJKW/e0JZ4NZmH8zJ37VExukUnup2Y3VP2ggqItZ3y5bMaPwguQkGc1jlaT74DACa1hjmlvRRIholUoDY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cagsv12P; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774636213; x=1806172213;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=4knFdZ4hMXVOWZKBeNuNmODbJmfWy9APQHimtIbNFDU=;
  b=cagsv12PHVs1XdiosTBYluY635pLZlt5wWmwdtR3tniwQJ35Pw5UKmZl
   cQ4LqYRmPeStwk0IYOzttOnhLyydqaC5NK2sYiWmXxjF0l9MH75JzEzsG
   2mNFL3zG+UtKmzuIrrag7ILaRP4KU7WrBVbtqkTkYMQI5XSPO0VqwoMdT
   ByTuSClRUH8ynj/kTcZX40LyR50ILplKCkCHsY6zIubIdPouoj0mwIqgZ
   Zsr2o2uWw7lKFArp6G2hQQM2qDLbHeE1LxqbBjt9GYNkJCfEBpAG/JJgj
   +3oX2KxbdRctuvA5gHO1FCFX7ybe8Nb/BxkaJMwvBPwyCq14Jxicx1YTy
   w==;
X-CSE-ConnectionGUID: nwvaBcYNRraew+JL18Pzbg==
X-CSE-MsgGUID: Bheg7IIiQkOGIr3yVomlOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="75595477"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="75595477"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 11:30:12 -0700
X-CSE-ConnectionGUID: gDxoWGHSSL6qltJH6UYoQg==
X-CSE-MsgGUID: DYtbU+hRTw++w6WmYLECag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="225407968"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 11:30:12 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Mar 2026 11:29:23 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 27 Mar 2026 11:29:23 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.14) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Mar 2026 11:29:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yxgv1g4XK74BLGbSaTXYVwPFk+ZtVPaFIK5DXqjxT48/wNqBmyVpmQ6HayvKQZZsnkxg+ax736nEiNrUD2ae1od/O2Aw7MZ8mnlJ2B0wAckYCMLfbJkI79EmiMZg09OWTdJ06l7pILdMWpHbMIbT3WKQaZb4uAqvfOmaNO27BLu5dOk0nbLKrYXiC1FrRnR5CbobL2brn+FAiuHKsioLTXF20HiKHJpIMnfv1ZyFzy7PNTz2VYDJN3ba45T820F0jrzUXnrr7bQCTi9a46bTSZW9JTX7i+G2dDrObul/gMd6P2zZGzC8F2VuQ6EWcLsX6YDGf9BSZaYw1x4aIjS4yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4knFdZ4hMXVOWZKBeNuNmODbJmfWy9APQHimtIbNFDU=;
 b=VY58uCymT2qr9sDHE8Vx8I4OHf8E135zTifUnNNiSDv2hn++ieqqbddv8FwW8sJr1R8W7AQ9PbA3VLXOnAyFTTHbvp6yphOknUBi+qmosrag4zRxvJU+WNzg1gdIynVCEs0migCFi1WgnLbTFPgyl67WnFvGg5x3vpqswL7MplsGmezBhqGG2w1qicR+HAJKpDr3STVtUKNpIDbQ4WVEsIIAv2S8cVhDKdXdY0T8YpbBhSpH1XvphSEkobad/MYZ/ZEiA0Qsj6Zx9O2QpcuJ4uPspO4LFWw3LG8FoAVl4fN5Qx2jJJCznLcSe+0vpDMe+yhe4p3P2fbQ/N9+uTsdwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB8022.namprd11.prod.outlook.com (2603:10b6:806:2fe::14)
 by DS0PR11MB6423.namprd11.prod.outlook.com (2603:10b6:8:c5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.7; Fri, 27 Mar
 2026 18:29:19 +0000
Received: from SA3PR11MB8022.namprd11.prod.outlook.com
 ([fe80::5bc2:3dd9:94f0:21ce]) by SA3PR11MB8022.namprd11.prod.outlook.com
 ([fe80::5bc2:3dd9:94f0:21ce%4]) with mapi id 15.20.9769.006; Fri, 27 Mar 2026
 18:29:19 +0000
From: "T, Arun" <arun.t@intel.com>
To: Dan Scally <dan.scally@ideasonboard.com>,
	"johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>
CC: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>, "Kao, Arec"
	<arec.kao@intel.com>, "ilpo.jarvinen@linux.intel.com"
	<ilpo.jarvinen@linux.intel.com>, "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "Djait, Mehdi" <mehdi.djait@intel.com>
Subject: RE: [PATCH v5 2/2] media: i2c: ov13b10: support tps68470 regulator
 and gpio
Thread-Topic: [PATCH v5 2/2] media: i2c: ov13b10: support tps68470 regulator
 and gpio
Thread-Index: AQHcvfABL61RDqpI3EadU6FEN8MEkbXCfROAgAA1jkA=
Date: Fri, 27 Mar 2026 18:29:19 +0000
Message-ID: <SA3PR11MB80224956A3DA13D98BB9A5049D57A@SA3PR11MB8022.namprd11.prod.outlook.com>
References: <20260327133905.3509868-1-arun.t@intel.com>
 <20260327133905.3509868-3-arun.t@intel.com>
 <6c286871-656c-4790-a118-48e897d18839@ideasonboard.com>
In-Reply-To: <6c286871-656c-4790-a118-48e897d18839@ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB8022:EE_|DS0PR11MB6423:EE_
x-ms-office365-filtering-correlation-id: 742c6292-9264-4c52-7d00-08de8c2ec289
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|10070799003|366016|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info: 4cfDWcpOSJiRuoHYZnhXvwzQ5PzTGc+P0nGH3kUZnXV38m3++M4sGlrpQt1JzBIfBMPVBwpPcAFwjTKvK9ekwFa+V5rObbMOfaaxlCXi7EWbgUSpyofDQteaH6CQaNHAoEQ5d9+bsgnEddtWJx7QS2UpPrt3wvZg+aD87c1a8Dv1WFSA8QLgLu5eWb0Cz61U/5G6UhMnxT33Jl9KeQipZnQ8xDS7hKUzUjUxpP8qO6kHbKL+/SsBwTa7p3ITFVFwFhIi26DxI00BcexzN2acPEh3HiMRQrnuAg9diofsS/6yWKjSdLBTMnst5ub6NnxCSJC44F86rhMfSloV8+XlbWpycQEe/kx0carnsdSASmMaGJBlQ+/PLyJ2onoGjuiuW/TmPH90NeCpR3cS9MRVEisaE0te1A7uEd5vSB6okmZRV0fQNWPqVHp92C1S0jRooXG6FtakWhXuAmw3udN0XE4JJZtc9KXjH5h8X8dOpo/Dz8wine8+I6GG/G07/lQs7Ow7u5uxymZQ742bMUJhczxvLUWagbS8+yWkD/1onjA686yZNFYIg/8bSF25vSkAvrDGnXMi3OSsZl3qFDNT3YX+6vuPe0bBMo9aUdNHgKut3NVfdiQjhKAU3+LJvo7PPKBWqKTgmMn9wDY1L3OJCkwIxedXA8T/favBn4zCDDdHdNICEAe3b/5V2sL8SzkIxJ9vgXRCWIl1nSyX6EiLUfsRhUMuSkYmMzvPNAA7W5lh9t5wOafb5/ldpZzszE5R9QgN27MF/f/S9baP8wdA4/fCEYO3mAF0NCrtCb6f6sc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR11MB8022.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UnhMd1VoTmhweTNGRm1raWNOUktHZHMzMzlOYlIwV3Rtc0NLZXVJZEVUUEhE?=
 =?utf-8?B?aGNOSUVCMGgrVzJJM2U1SjRySVFCekthZHY5eTNKT3hPTjNmY1hNL2lFUDMy?=
 =?utf-8?B?YlJuSkFHQkx3SzU4RXQzU1RlREdYUGxyUWJ4TXJVbEJWbVhoTlZ6dXJSOHNR?=
 =?utf-8?B?MVlwMXFNbVk1NUszbnhyWEpaWmJQazJCOVpyN2ZyWENWc0ZHalZ2SWU3T1Ay?=
 =?utf-8?B?RGMzMFZDcGEzZkZ0d3ZxU3JNc1VlZE5uWStmRm9oeFkvRFFhclU4bzRaQ2lC?=
 =?utf-8?B?U05ZeVFsNDFmRXdJbi9TeXdRWS9IeXRtNGFCZUFUZG5HT3RMMHpwZW9teFF0?=
 =?utf-8?B?Zi92SHZCQW1GYmdiSHhPNGp6WVM0eCtHZE4wQWxQbnVGd0Fwd3IzS0xJTzBP?=
 =?utf-8?B?bXBXK2JKS1JEZ3daSlhoZEFoYWJuSGhlOUlOM3Y3c3pvQWFVQUVVbzl2U3h0?=
 =?utf-8?B?WVUxMmtLeWdmTy96Z3ZNY0FkU3hiNkVVSmY3MVJkK3B5TVZNOWdRdFEveEkv?=
 =?utf-8?B?OWdrMlQxNXc1ZWp6dEY5SE5lVlBSU1ZWUFFuZEhSVTlKZFdUZ083TkJDd2pG?=
 =?utf-8?B?QkF1RUUxTmFRTE9MMDlFN1hubFh0QTNYenZUcWRRYUZXYlJJUEI0enVHMEcx?=
 =?utf-8?B?MGpZMVphU3puSktlanEzZThFWTFSNGp6Vk5sc0c2Q2pVMG5iMmJ1Nk1kTW1x?=
 =?utf-8?B?bEF3a0Z5eDZaWXVMMS9uRTY5RlgxNGszcTNnV09UYjc0YlpBRUZ4RWp0a0F2?=
 =?utf-8?B?RlZCUXRibUpjMmpYWjlmSS9EQnRqbkZBN3B5YktITzAwTXRzWUVwdVdDcFN0?=
 =?utf-8?B?ckJvaGZvWXo0elpjQ2t1aFZlUkc1cFNaL2J0dHpmNWlBekFMMFdvS09wN1Zq?=
 =?utf-8?B?WnBINmFLbmViRFh1WERETVBGTW5xM1ZDYW96Q1FjQVJ0VGlhUm9nUW5zQmUy?=
 =?utf-8?B?aWdMMVZtTkg4ZGdpZnlXWEI0U3RLS3prckZVUmZSclJ3OW1ROFVvZUliM2hj?=
 =?utf-8?B?dDRORWZaNkNodmxMTXFFRGpBZGd0UkJhdk42aTE4N0VXMDE5emg3OGY1WXRk?=
 =?utf-8?B?VmRSMVRaT1B5ZU93d0xVVnBpZTRPbFZHMVlTZUpDNUJQQmhIeDM5bVFIVHZu?=
 =?utf-8?B?WU5UM2dOSC9vN2FzNDJxTDMrWFhNUVU0cnpXVHhTVWwrQUJUQ2NqLzBYN3NU?=
 =?utf-8?B?S2p6SExFRERWS3hRK29WWkJ3ZVdjQ092L0ZwU0Z2RktPTzV4eGF3SUJhNVFF?=
 =?utf-8?B?Qlh6OUFES3V3Rml2UTB6R2kvanFUVDNjQVRDSFdaMWZGSEQ1ZVJOT1doUHhM?=
 =?utf-8?B?cWE5c3dXOHdSSDg1cDgvUk83SkIvZThxb1pLc2M4WFJkN0FNYmZ4eURiT2la?=
 =?utf-8?B?emllbElKK3VkSTZ3U1Z0OVZBd3V1dWhaTmpRcnFxWmZuTUJobHFkU1NTY01v?=
 =?utf-8?B?bUliT2ZlbDI3TFlFSVZydHlLN05xZitNNE5teURVcjByZnJJWXVUU1J3c0JF?=
 =?utf-8?B?eUZoNGtlb0NSeDV3QWdkQXVCNGwwT3k3YXBsaERwbGZvZmFKaWdCQTVFMHhV?=
 =?utf-8?B?SkpGWTV0ZHI1YnFyM0lXUGkwZVJiWFRPRTl6a0Z1djBYOGpoc2tHMExtanR1?=
 =?utf-8?B?NlpFOWdUamhmYzR6aWlDQnRoM2hoTWRSZlU4M0ZTZi9rOXRoa01oSnhPaTh4?=
 =?utf-8?B?c1Qrckh5QTN0R09rcXB6VmpkTEh5UGJOQ1RaRG9GOTV6VUoxRnNjdHdSRWgy?=
 =?utf-8?B?WXZtaUQzSXdOTDVxdlE1emp2d0hOMUc3OTFvK2pUL3hTOWw2ZlpVOGFzTmx4?=
 =?utf-8?B?MkpMYTc2TGFaRXpqV2ZtdVRybEp5ZHBYVnNvdEQrc1RjMHhlR3FLdVl6dkF3?=
 =?utf-8?B?K29IM0RrUDFxeDI5SWVnQU11dys0MlBtdnNPMEtQbDdzcDRMdTdjenIybjlR?=
 =?utf-8?B?ZFdjZ0tucUdINE4zRXZmMUxESThrWStnMWVxNGg4MUNGTGtaWnVQZG1jQWN3?=
 =?utf-8?B?bjlCbnFLWFFaelBpaGRaNUZ1RHp0a2E4cU52KzJmN1MxVlZ2cmNIc3lHcWtO?=
 =?utf-8?B?WEFpckFudHRUTDk4WVBvaTFmazViaEVaRWhnMEFWblMwOFZJZmY4SDQ2Y0E2?=
 =?utf-8?B?MGZ3SGxTcEROOWtNdVpVV0NRR3Uwc09YOGRTYkpva2E0YTlqUVJBaXpuSStE?=
 =?utf-8?B?Q1I3MUFoa2dRL0w5VE5SaSsxMU1NOU5ZS3Flank5MHdGa2xiQXhocVBCM24z?=
 =?utf-8?B?RGMvQ1VIMktiYSt4N3J1YmRpZHUzbmNXZVNUUlpQeHZZbTlmVWwvNXRxNXp4?=
 =?utf-8?B?TmMxa1RiNjVsU1E3TmxMQTJEbytQYjhmUDdBbG5HZnVsWFcrb1JJUFRzR21v?=
 =?utf-8?Q?q5exAM6ogEQqZzcEPtJ3c0bDvll3kHiDIjIdE?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: HHJ/H6fBYaMIUPu6gzenrK5jkBkt55Jwum5/KthZx8QkmczZp5O/WuWcrSA21NedRS17GvgD3fwl5n1Qp8StwGotE1K4TC/DP9t+eke6EzKcoipwl3FbqlFS+AGEEvCXdOTKhkzVNkiSYjhJ53OneVKUcRVA5g+avgoePiLZoEsXoP2sh4sCtXjy1nkhisxUoWoLbL2GGsLGCLRXc6O+TVPgnZTfo3LahsAbY0TpQZF/pcWjZizzd7JC4y+heIabfhmMnffZCTv6m8yYRLtq/1O2sHN7WOHx7vcHECgdFiXFxMWY9jfeNQ1GqM909uSaTYdxJSSiGX+TGcL4enFJBA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8022.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 742c6292-9264-4c52-7d00-08de8c2ec289
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2026 18:29:19.2936
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mGNkP8NolRoYyr+31Zeo1bhJhLTp1k4bhSTFacJ8hnQ2f/iS2c+aXV4c4X0sTIC6lNinCaV32Z6h8/nCwJKVLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6423
X-OriginatorOrg: intel.com
X-Spamd-Result: default: False [0.94 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57311-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,ideasonboard.com:email,intel.com:dkim,intel.com:email,SA3PR11MB8022.namprd11.prod.outlook.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arun.t@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: D60783490BC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgRGFuLA0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXcuIEkgaGF2ZSB1cGRhdGVkIFY2IHBhdGNo
IHNlcmllcyBhcyB5b3Ugc3VnZ2VzdGVkOg0KDQpVcGRhdGVkIGJlbG93IGNoYW5nZXMgaW4gVjYg
cGF0Y2ggc2VyaWVzLg0KDQotIENoYW5nZWQgY29uc3VtZXIgc3VwcGx5IGFycmF5cyBmcm9tIGlu
dDM0NzJfKiB0byBvdnRpMTNiMV8qIGFuZCB1cGRhdGUgYWxsIHJlZmVyZW5jZXMuDQotIFJlbW92
ZWQgY29uc3VtZXIgc3VwcGx5IHplcm8taW5pdCBmaWVsZHMNCi0gVXBkYXRlZCBjb21taXQgbWVz
c2FnZSBmb3Igb3YxM2IxMCBkcml2ZXIgYW5kIHJld3JpdHRlbiBmb3IgcmVndWxhdG9yIGJ1bGsg
c3VwcG9ydA0KLSBVcGRhdGVkIDxsaW51eC9yZWd1bGF0b3IvY29uc3VtZXIuaD4gaW4gYWxwaGFi
ZXRpY2FsIG9yZGVyDQoNClRoYW5rcywNCkFydW4gVA0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KRnJvbTogRGFuIFNjYWxseSA8ZGFuLnNjYWxseUBpZGVhc29uYm9hcmQuY29tPiANClNl
bnQ6IDI3IE1hcmNoIDIwMjYgMDg6NDUgUE0NClRvOiBULCBBcnVuIDxhcnVuLnRAaW50ZWwuY29t
Pjsgam9oYW5uZXMuZ29lZGVAb3NzLnF1YWxjb21tLmNvbQ0KQ2M6IHNha2FyaS5haWx1c0BsaW51
eC5pbnRlbC5jb207IEthbywgQXJlYyA8YXJlYy5rYW9AaW50ZWwuY29tPjsgaWxwby5qYXJ2aW5l
bkBsaW51eC5pbnRlbC5jb207IHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnOyBs
aW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7
IERqYWl0LCBNZWhkaSA8bWVoZGkuZGphaXRAaW50ZWwuY29tPg0KU3ViamVjdDogUmU6IFtQQVRD
SCB2NSAyLzJdIG1lZGlhOiBpMmM6IG92MTNiMTA6IHN1cHBvcnQgdHBzNjg0NzAgcmVndWxhdG9y
IGFuZCBncGlvDQoNCkhpIEFydW4sIHRoYW5rcyBmb3IgdGhlIHJldmlzaW9uDQoNCk9uIDI3LzAz
LzIwMjYgMTM6MzksIEFydW4gVCB3cm90ZToNCj4gVGhlIE9WMTNCMTAgc2Vuc29yIG9idGFpbnMg
Y2xvY2sgYW5kIHJlZ3VsYXRvcnMgZnJvbSB0aGUgVFBTNjg0NzAgUE1JQy4NCj4gQWRkIFRQUzY4
NDcwIHJlZ3VsYXRvciBhbmQgR1BJTyBuYW1lcyB0byB0aGUgc2Vuc29yIHBvd2VyIG9uDQoNClRo
ZSBjb21taXQgbWVzc2FnZSBuZWVkcyB1cGRhdGluZyBub3cgcmVhbGx5OyBpdCdzIGNoYW5nZWQg
c2luY2UgdGhlIGVhcmx5IHZlcnNpb24uIFdoYXQgaXQgbm93IGRvZXMgaXMgc3dpdGNoIHRvIHVz
aW5nIHRoZSByZWd1bGF0b3IgYnVsayBBUEkgdG8gaGFuZGxlIHRocmVlIHJlZ3VsYXRvcnMgaW5z
dGVhZCBvZiBqdXN0IGEgc2luZ2xlIG9uZS4gDQpUaGUgR1BJTyBjaGFuZ2VzIGFyZSBnb25lIHNv
IHlvdSBjYW4gc2tpcCBtZW50aW9uaW5nIHRoZW0gaGVyZS4gSSB3b3VsZCBhbHNvIG5vdCBtZW50
aW9uIHRoZSBUUFM2ODQ3MCwgYXMgZnJvbSB0aGUgc2Vuc29yIGRyaXZlcidzIHBvaW50IG9mIHZp
ZXcgaXQncyBpcnJlbGV2YW50IHdoYXQgZGV2aWNlIHByb3ZpZGVzIHRoZW0uIE1heWJlIHNvbWV0
aGluZyBsaWtlOg0KDQptZWRpYTogb3YxM2IxMDogU3VwcG9ydCBtdWx0aXBsZSByZWd1bGF0b3Jz
DQoNClRoZSBPVjEzQjEwIHNlbnNvciBkcml2ZXIgY3VycmVudGx5IGhhbmRsZXMgYSBzaW5nbGUg
cmVndWxhdG9yIGNhbGxlZCAiYXZkZCIsIGhvd2V2ZXIgdGhlIHNlbnNvciBjYW4gYmUgc3VwcGxp
ZWQgYnkgdXAgdG8gdGhyZWUgcmVndWxhdG9ycy4gVXBkYXRlIHRoZSBkcml2ZXIgdG8gaGFuZGxl
IGFsbCBvZiB0aGVtIHRvZ2V0aGVyIHVzaW5nIHRoZSByZWd1bGF0b3IgYnVsayBBUEkuDQoNCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IEFydW4gVCA8YXJ1bi50QGludGVsLmNvbT4NCj4gLS0tDQo+ICAg
ZHJpdmVycy9tZWRpYS9pMmMvb3YxM2IxMC5jIHwgNDcgKysrKysrKysrKysrKysrKysrKystLS0t
LS0tLS0tLS0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspLCAyMSBk
ZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL2kyYy9vdjEzYjEw
LmMgYi9kcml2ZXJzL21lZGlhL2kyYy9vdjEzYjEwLmMgDQo+IGluZGV4IDU0MjE4NzQ3MzJiYy4u
NGI3YjE3YWZiNjRjIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL21lZGlhL2kyYy9vdjEzYjEwLmMN
Cj4gKysrIGIvZHJpdmVycy9tZWRpYS9pMmMvb3YxM2IxMC5jDQo+IEBAIC0zLDYgKzMsNyBAQA0K
PiAgIA0KPiAgICNpbmNsdWRlIDxsaW51eC9hY3BpLmg+DQo+ICAgI2luY2x1ZGUgPGxpbnV4L2Ns
ay5oPg0KPiArI2luY2x1ZGUgPGxpbnV4L3JlZ3VsYXRvci9jb25zdW1lci5oPg0KDQpBbHBoYWJl
dGljYWwgb3JkZXJpbmcgcGxlYXNlOyB0aGlzIHNob3VsZCBnbyBhZnRlciBwbV9ydW50aW1lLmgg
YW5kIGJlZm9yZSB2NGwyLWN0cmxzLmgNCg0KPiAgICNpbmNsdWRlIDxsaW51eC9kZWxheS5oPg0K
PiAgICNpbmNsdWRlIDxsaW51eC9ncGlvL2NvbnN1bWVyLmg+DQo+ICAgI2luY2x1ZGUgPGxpbnV4
L2kyYy5oPg0KPiBAQCAtNjk5LDYgKzcwMCwxMiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG92MTNi
MTBfbW9kZSBzdXBwb3J0ZWRfMl9sYW5lc19tb2Rlc1tdID0gew0KPiAgIAl9LA0KPiAgIH07DQo+
ICAgDQo+ICtzdGF0aWMgY29uc3QgY2hhciAqIGNvbnN0IG92MTNiMTBfc3VwcGx5X25hbWVzW10g
PSB7DQo+ICsJImRvdmRkIiwgICAgICAgIC8qIERpZ2l0YWwgSS9PIHBvd2VyICovDQo+ICsJImF2
ZGQiLCAgICAgICAgIC8qIEFuYWxvZyBwb3dlciAqLw0KPiArCSJkdmRkIiwgICAgICAgICAvKiBE
aWdpdGFsIGNvcmUgcG93ZXIgKi8NCj4gK307DQo+ICsNCj4gICBzdHJ1Y3Qgb3YxM2IxMCB7DQo+
ICAgCXN0cnVjdCBkZXZpY2UgKmRldjsNCj4gICANCj4gQEAgLTcwOCw3ICs3MTUsNyBAQCBzdHJ1
Y3Qgb3YxM2IxMCB7DQo+ICAgCXN0cnVjdCB2NGwyX2N0cmxfaGFuZGxlciBjdHJsX2hhbmRsZXI7
DQo+ICAgDQo+ICAgCXN0cnVjdCBjbGsgKmltZ19jbGs7DQo+IC0Jc3RydWN0IHJlZ3VsYXRvciAq
YXZkZDsNCj4gKwlzdHJ1Y3QgcmVndWxhdG9yX2J1bGtfZGF0YSANCj4gK3N1cHBsaWVzW0FSUkFZ
X1NJWkUob3YxM2IxMF9zdXBwbHlfbmFtZXMpXTsNCj4gICAJc3RydWN0IGdwaW9fZGVzYyAqcmVz
ZXQ7DQo+ICAgDQo+ICAgCS8qIFY0TDIgQ29udHJvbHMgKi8NCj4gQEAgLTExOTQsOSArMTIwMSw4
IEBAIHN0YXRpYyBpbnQgb3YxM2IxMF9wb3dlcl9vZmYoc3RydWN0IGRldmljZSAqZGV2KQ0KPiAg
IAlzdHJ1Y3Qgb3YxM2IxMCAqb3YxM2IxMCA9IHRvX292MTNiMTAoc2QpOw0KPiAgIA0KPiAgIAln
cGlvZF9zZXRfdmFsdWVfY2Fuc2xlZXAob3YxM2IxMC0+cmVzZXQsIDEpOw0KPiAtDQo+IC0JaWYg
KG92MTNiMTAtPmF2ZGQpDQo+IC0JCXJlZ3VsYXRvcl9kaXNhYmxlKG92MTNiMTAtPmF2ZGQpOw0K
PiArCXJlZ3VsYXRvcl9idWxrX2Rpc2FibGUoQVJSQVlfU0laRShvdjEzYjEwX3N1cHBseV9uYW1l
cyksDQo+ICsJCQkgICAgICAgb3YxM2IxMC0+c3VwcGxpZXMpOw0KPiAgIA0KPiAgIAljbGtfZGlz
YWJsZV91bnByZXBhcmUob3YxM2IxMC0+aW1nX2Nsayk7DQo+ICAgDQo+IEBAIC0xMjE0LDE0ICsx
MjIwLDEyIEBAIHN0YXRpYyBpbnQgb3YxM2IxMF9wb3dlcl9vbihzdHJ1Y3QgZGV2aWNlICpkZXYp
DQo+ICAgCQlkZXZfZXJyKGRldiwgImZhaWxlZCB0byBlbmFibGUgaW1hZ2luZyBjbG9jazogJWQi
LCByZXQpOw0KPiAgIAkJcmV0dXJuIHJldDsNCj4gICAJfQ0KPiAtDQo+IC0JaWYgKG92MTNiMTAt
PmF2ZGQpIHsNCj4gLQkJcmV0ID0gcmVndWxhdG9yX2VuYWJsZShvdjEzYjEwLT5hdmRkKTsNCj4g
LQkJaWYgKHJldCA8IDApIHsNCj4gLQkJCWRldl9lcnIoZGV2LCAiZmFpbGVkIHRvIGVuYWJsZSBh
dmRkOiAlZCIsIHJldCk7DQo+IC0JCQljbGtfZGlzYWJsZV91bnByZXBhcmUob3YxM2IxMC0+aW1n
X2Nsayk7DQo+IC0JCQlyZXR1cm4gcmV0Ow0KPiAtCQl9DQo+ICsJcmV0ID0gcmVndWxhdG9yX2J1
bGtfZW5hYmxlKEFSUkFZX1NJWkUob3YxM2IxMF9zdXBwbHlfbmFtZXMpLA0KPiArCQkJCSAgICBv
djEzYjEwLT5zdXBwbGllcyk7DQo+ICsJaWYgKHJldCA8IDApIHsNCj4gKwkJZGV2X2VycihkZXYs
ICJmYWlsZWQgdG8gZW5hYmxlIHJlZ3VsYXRvcnNcbiIpOw0KPiArCQljbGtfZGlzYWJsZV91bnBy
ZXBhcmUob3YxM2IxMC0+aW1nX2Nsayk7DQo+ICsJCXJldHVybiByZXQ7DQo+ICAgCX0NCj4gICAN
Cj4gICAJZ3Bpb2Rfc2V0X3ZhbHVlX2NhbnNsZWVwKG92MTNiMTAtPnJlc2V0LCAwKTsgQEAgLTE0
NzUsNyArMTQ3OSw4IEBAIA0KPiBzdGF0aWMgaW50IG92MTNiMTBfZ2V0X3BtX3Jlc291cmNlcyhz
dHJ1Y3Qgb3YxM2IxMCAqb3YxM2IpDQo+ICAgCXVuc2lnbmVkIGxvbmcgZnJlcTsNCj4gICAJaW50
IHJldDsNCj4gICANCj4gLQlvdjEzYi0+cmVzZXQgPSBkZXZtX2dwaW9kX2dldF9vcHRpb25hbChv
djEzYi0+ZGV2LCAicmVzZXQiLCBHUElPRF9PVVRfTE9XKTsNCj4gKwlvdjEzYi0+cmVzZXQgPSBk
ZXZtX2dwaW9kX2dldF9vcHRpb25hbChvdjEzYi0+ZGV2LCAicmVzZXQiLA0KPiArCQkJCQkgICAg
ICAgR1BJT0RfT1VUX0xPVyk7DQoNCkkgdGhpbmsgeW91IGNhbiBqdXN0IGRyb3AgdGhpcyBjaGFu
Z2UuDQoNClRoYW5rcw0KRGFuDQoNCj4gICAJaWYgKElTX0VSUihvdjEzYi0+cmVzZXQpKQ0KPiAg
IAkJcmV0dXJuIGRldl9lcnJfcHJvYmUob3YxM2ItPmRldiwgUFRSX0VSUihvdjEzYi0+cmVzZXQp
LA0KPiAgIAkJCQkgICAgICJmYWlsZWQgdG8gZ2V0IHJlc2V0IGdwaW9cbiIpOyBAQCAtMTQ5MSwx
NSArMTQ5NiwxNSBAQCANCj4gc3RhdGljIGludCBvdjEzYjEwX2dldF9wbV9yZXNvdXJjZXMoc3Ry
dWN0IG92MTNiMTAgKm92MTNiKQ0KPiAgIAkJCQkgICAgICJleHRlcm5hbCBjbG9jayAlbHUgaXMg
bm90IHN1cHBvcnRlZFxuIiwNCj4gICAJCQkJICAgICBmcmVxKTsNCj4gICANCj4gLQlvdjEzYi0+
YXZkZCA9IGRldm1fcmVndWxhdG9yX2dldF9vcHRpb25hbChvdjEzYi0+ZGV2LCAiYXZkZCIpOw0K
PiAtCWlmIChJU19FUlIob3YxM2ItPmF2ZGQpKSB7DQo+IC0JCXJldCA9IFBUUl9FUlIob3YxM2It
PmF2ZGQpOw0KPiAtCQlvdjEzYi0+YXZkZCA9IE5VTEw7DQo+IC0JCWlmIChyZXQgIT0gLUVOT0RF
VikNCj4gLQkJCXJldHVybiBkZXZfZXJyX3Byb2JlKG92MTNiLT5kZXYsIHJldCwNCj4gLQkJCQkJ
ICAgICAiZmFpbGVkIHRvIGdldCBhdmRkIHJlZ3VsYXRvclxuIik7DQo+IC0JfQ0KPiArCWZvciAo
dW5zaWduZWQgaW50IGkgPSAwOyBpIDwgQVJSQVlfU0laRShvdjEzYjEwX3N1cHBseV9uYW1lcyk7
IGkrKykNCj4gKwkJb3YxM2ItPnN1cHBsaWVzW2ldLnN1cHBseSA9IG92MTNiMTBfc3VwcGx5X25h
bWVzW2ldOw0KPiAgIA0KPiArCXJldCA9IGRldm1fcmVndWxhdG9yX2J1bGtfZ2V0KG92MTNiLT5k
ZXYsDQo+ICsJCQkJICAgICAgQVJSQVlfU0laRShvdjEzYjEwX3N1cHBseV9uYW1lcyksDQo+ICsJ
CQkJICAgICAgb3YxM2ItPnN1cHBsaWVzKTsNCj4gKwlpZiAocmV0KQ0KPiArCQlyZXR1cm4gZGV2
X2Vycl9wcm9iZShvdjEzYi0+ZGV2LCByZXQsDQo+ICsJCQkJICAgICAiZmFpbGVkIHRvIGdldCBy
ZWd1bGF0b3JzXG4iKTsNCj4gICAJcmV0dXJuIDA7DQo+ICAgfQ0KPiAgIA0KDQo=

