Return-Path: <linux-media+bounces-28714-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C9AA70165
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 14:23:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B92DD178D31
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 13:14:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAEB1259489;
	Tue, 25 Mar 2025 12:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N8LOVaei"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B326258CEF
	for <linux-media@vger.kernel.org>; Tue, 25 Mar 2025 12:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742906630; cv=fail; b=UX7SfqgPnhDKdJ91GBcolo59fhBjh7RTCgdgRfJvP6OpHxgXnU8oNK5pHoWy3zxsnwpkvy4CNK0jli0Ix699vHIjn0g69LCXX6tfKKnxfn0QtkvAZTZFLS48clLhkHGt7hQgODdDPCEGAlaZmhvBKpe0TZ3tJ5XU2jg9kx1PGbQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742906630; c=relaxed/simple;
	bh=No86nuqUm6l+pVEjnb47W80ujWTqkO7J0vtTA6EisVs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CNg5U2Y6GFG4mKa41Fzi3EGBWROeloSGLMUvLQk9yDQmztzgplfh1WdbvmJKduip6GBI0uu4A/hzkJ/jWe9feV0t5/beh5ef0fhHfNHmPPz9uWswzFPtYXGf/YimKRKmTK6JTuiDBG40XGFxk8iWSxTfQCqyfEQ8JUfmz5FYJqU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N8LOVaei; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742906628; x=1774442628;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=No86nuqUm6l+pVEjnb47W80ujWTqkO7J0vtTA6EisVs=;
  b=N8LOVaeicUT7T0Lf5XOkaoC8TqXsfMEVhPfa9cGt0pgDcZVgHfBNp/uU
   XquK1BY5fw/tgiaWqwyZyiOGw8Lwj8d736NZgl7+nBBuEDk1OUiNuz/6p
   xAME81CK8BNOvYEWlNAJd01eHDw5LanY2b6HZWsI2pvmNH4Vcuw++ZnHH
   0KHEtQo52A5SDg9LlJLGmHI7tikFOCqoU4MpVuF7FQVpoG24XFu/JOpsW
   Sjf/zmB0fyW/lpiqoPr8arolhm05Xcketwm8T7cYVo2P0qzvTBbgnJVRR
   dLWnsA/nRI62v1XSHsgnsIoNXiBxPXvTFuEcM6g3bmv7FRZSsnwvizuFo
   A==;
X-CSE-ConnectionGUID: JzmMVIf8RzC6+kEF1MHzeQ==
X-CSE-MsgGUID: iR1IsJMoSAGngmtQg2U+gg==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="61676941"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; 
   d="scan'208";a="61676941"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 05:43:48 -0700
X-CSE-ConnectionGUID: SGgCtMtiTzqGRpVutYEQJA==
X-CSE-MsgGUID: LgYQA46VSVaATaEi6xoqLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; 
   d="scan'208";a="125146825"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 25 Mar 2025 05:43:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 25 Mar 2025 05:43:47 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Mar 2025 05:43:47 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Mar 2025 05:43:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jK3wrI5jAS6hqc5omanQb7TkguXlHCD6LCZv4k6HLVU0v8mYxyH/BjNS00SfiMRM4f5k5Paw6sVFrEvxBukmtaDS5tNDMGAA4yjxM6pkbKpws2w6sE4k7lZSq+AMFyKkEamIpD9jKtG3eAeWIrCBqoQsmvYqJUndLYrmzplENYd/Aqnh+GN7fa0knLht2zzKtta9zLByhwN0YCLsSXig74o7ggYX+rK0/ucX2sAHos0KEM1usW9RIEBzXpEoRoc62XhbzZJw+gpd5+zMzWHUJXo2zE3sOxvp4w/U6Uosu1d681gKQ4cEd6TlavZQ6LJd8tfdukeyDb6yjL4jBYekhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=No86nuqUm6l+pVEjnb47W80ujWTqkO7J0vtTA6EisVs=;
 b=BGrp7jU8g21GTcQVxnW1R7em3cLuYC7aSiE8a0F/rPGsOj0QYlmpvqyrsz7AT9B0S3YlROygMSbF9UI4jvaBMleRF/waCQRLl8iS/K1s76czo2S0Prkfbj1H6AFm16h8u3UZ/PqqcKYmFHFO1HyDSVb+Bydeq7FtS5KXrEBS+bgPnokO1w4w3kucwM6SEg3nbOwsAsJfzpNLxNRxNIigOiNDbjkVlTHlVszc88UvPxCkN1VKUcU36OzSn7U1fbXJuDEEeudjmdJt1rAJGGyZmjRoAKbi2HJThwWtL6Hiz+wu3BcameMcOCO3zMQbEu+KnV+8B9vkPtu6yfWPFcJGtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA2PR11MB5131.namprd11.prod.outlook.com (2603:10b6:806:116::9)
 by CH3PR11MB8705.namprd11.prod.outlook.com (2603:10b6:610:1cc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 12:43:39 +0000
Received: from SA2PR11MB5131.namprd11.prod.outlook.com
 ([fe80::6519:dade:ea33:942c]) by SA2PR11MB5131.namprd11.prod.outlook.com
 ([fe80::6519:dade:ea33:942c%6]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 12:43:39 +0000
From: "Hu, Jerry W" <jerry.w.hu@intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: "libcamera-devel@lists.libcamera.org"
	<libcamera-devel@lists.libcamera.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, Kieran Bingham
	<kieran.bingham@ideasonboard.com>
Subject: RE: [ANNOUNCEMENT] libcamera workshop 2025 - Nice, May 16th
Thread-Topic: [ANNOUNCEMENT] libcamera workshop 2025 - Nice, May 16th
Thread-Index: AQHbnXClKc33heq2W0WbuJw9uX1w6LODxO9AgAAFkQCAAAGHYA==
Date: Tue, 25 Mar 2025 12:43:39 +0000
Message-ID: <SA2PR11MB51311DCE49ABC84F5FE9BCE4D3A72@SA2PR11MB5131.namprd11.prod.outlook.com>
References: <20250325102750.GE20035@pendragon.ideasonboard.com>
 <SA2PR11MB5131A5274209B90423488089D3A72@SA2PR11MB5131.namprd11.prod.outlook.com>
 <20250325123738.GA1320@pendragon.ideasonboard.com>
In-Reply-To: <20250325123738.GA1320@pendragon.ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA2PR11MB5131:EE_|CH3PR11MB8705:EE_
x-ms-office365-filtering-correlation-id: 7739e094-5c36-4b46-9d5b-08dd6b9aab00
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WlAyaVNuMW5XdVA0NWVFZW56UVBnUThEK2NvdU1nMyt5TVpLbDUzRXEwS0xx?=
 =?utf-8?B?NEtKUE9LaGVBMy9ZUnEzU3F3dlU3eHJJSHlhZEdOa1p6cWY5N1NSUzYzZWsv?=
 =?utf-8?B?WDJOS0NUdVRUaE1RVTlNZU4vWUh0MU0wMXFqdUdUZUFNVXQ3SjViUXhXYUl0?=
 =?utf-8?B?Y3QxeW1lV3dnN1hIYm5RWE01WDJuY2hNNzZlQXNNOHVDL0M1OFhRdFNzQUkz?=
 =?utf-8?B?RmREcWVFcCtmVzVhaGw4Ylo0UU5oWGxQZUZFNjhQN25sSFhyQjBQN0xrcXBU?=
 =?utf-8?B?cGxlR0ZreUNJZTExMm00MFlGNjNoZ09wNkZNdjdkbDV6ZU9FaU1ycVJNZ0Fz?=
 =?utf-8?B?NlRsYVRiSVNSOW1vQWVQUEwyY3gzN3BhSHlEQWFhVWtPOU83RUZvSkNjUHFY?=
 =?utf-8?B?eEg4ZUorY2hENEs2d3NzRzlJckNLRDZGYzBCN0FXTEt5bjdWRVFtS3JFSERy?=
 =?utf-8?B?YTdEYlFLdlNDRDRsNDFISE4yZEppTXg2eHA1dWNBdnBHNm5VSDFENk1Lc3h6?=
 =?utf-8?B?VXZZZGs4ZXlOZWVTNWpsMkN0eXR0bExDVXRRTUYzc2lDcXk5WEsyTGZBRmRa?=
 =?utf-8?B?NjQ2dys5SHZIVHlQZ3J4akFQcUx0cFo4N3Q3eVU3SlpLSmNwc2s5Skdrakxl?=
 =?utf-8?B?SWVTMmttTTB5dkM5TVFHU3RsbTFobmZiVGJ2bzE4aDNQdDZrVnpCVmwrdHlk?=
 =?utf-8?B?aFl2Q0hCRUxVdkU3OU1TWjhDczVjSWw1T0RGZVJZWnpwL3NlSndrSGZ6MG0z?=
 =?utf-8?B?aUxDdXkxby9EaUJ0bllKRmFJbCtvUWxpRkoxbEI4S1dSOFJxdDVaRUppV3dR?=
 =?utf-8?B?SndpeW5pR1RqZjBTNzlHRjhoaVhRQ05BZVg1NXFqNWNTUFRVaFhsOWdaWGRw?=
 =?utf-8?B?RVowNDFLM21ielYydWZSbWUzc1RjSEprbHA0VGtUMC95M2o5Wk14d0VrWUsw?=
 =?utf-8?B?czFXRXBjWjFHY0xpYTRvZ0hhQ1NSZEl0SVdJLzBYdkh4ZUZsNlEyVk44TzJF?=
 =?utf-8?B?RnhUcWJxTFd1Z0Y0Ynpnek9xcENEWGxZZVpjVERmTUpCS0l6b0UzMHNPakV2?=
 =?utf-8?B?SldRbFBEcHBtR1RuSTF5KzI4ZGZpY2VITW02eW43Q2w5QzdQZisxMEdUUTUv?=
 =?utf-8?B?bFlaZlo3U1kwQTdxdFdFQjdWS1AyQjNCdFpCVG04aG8vcEdOTHFnTFVYenZL?=
 =?utf-8?B?eEwyd3hTU2ZKZWNUL2VWZ3VpWUtuWDdjWjR0WVpRbXF1NjFvQ05XdlhCNk9O?=
 =?utf-8?B?ZVd0a3IvRGQxMlFJcXhnbWVLQ2ZQc2hNdS9CT0dld2dKYkNJOUdZVytVSDk3?=
 =?utf-8?B?ck9wUmxYb1hRWDBPOVQ4by8wQ1cvUGdKTFhWMmVDTU8xaEFEZytRbXNreTBi?=
 =?utf-8?B?eU5BZzdwVm5mSTR0NjdyMUhqYjdDaTQ3eXByN0tTdXJkWUltbWx6VElxOGdu?=
 =?utf-8?B?dkROQWhIaDFZeGxZNm1ZYTJlTkZoUTVZNVVpa3lTc0RGR2RPbDZUZHljZGZZ?=
 =?utf-8?B?WFZlQzRxempnNVRiTVFHTy8yZ3FzUm1ERUxuQnpXdXJTSkI1Yjlnb1h2eTds?=
 =?utf-8?B?bkd3ei9za2tweDV0QXU3dXB2OUtKbnpUcFV4RFRsMEc2SG4rdDNoYXc3aXJP?=
 =?utf-8?B?endGNS9rSy84NXZmc1N5cXRrMk5OTCtTMU1SMzl1L1dtQXExVXBUaTk4bzQ4?=
 =?utf-8?B?aHpnN3FkQnpCa0txQkZ4a2pmQ0tBdGZ6Ukd6eHZqUVBLVVY4QUd0UnJlN0hm?=
 =?utf-8?B?ZHM1N3pLNlF0TitHTkI4ams5YlpnR0xnUUp3eVJzN3ZyYUFDSFNYMGdtbjYz?=
 =?utf-8?B?TkZ1YWdYUERRUDBOSkVuVDV0Z2xhQzVjZjFqbExtdjNtemlIRElBdFp4OE13?=
 =?utf-8?Q?LJNVDylgl63aV?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR11MB5131.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K0VUckNvNndJOXMzbm5XSWUrWC82Rm8rNHdhd2tvNzIzUzBSOUJ3QmZFQkVX?=
 =?utf-8?B?QWZRTFIxZUFTOWR2RWtrNVNVVGVYNnI4WG85SWsvanJWZGc4ZUdTNFNocUlm?=
 =?utf-8?B?eFFlYlc5Zm85ci9VdS85ZS9paWJtRURmcmM1emY5c1h0czJya09NeEJaeU1s?=
 =?utf-8?B?WGFBZUZieFFHQkpaaDBQdWpuQnlWd0NnWjUvUmtTTUl6VkpzN09taHUxdlVn?=
 =?utf-8?B?NVlnRTA4SDFTVVk2cXBaTHBqMW1FbVZmWkdxZVNndVZHWHdSVldoa1dJZ3lS?=
 =?utf-8?B?QTViNnQra2g5blA5bXVIS1RTQUNkTEVLd1psMG9RdTJUNlNFUUZBamFWS0Rl?=
 =?utf-8?B?Q0s5N3Y4M0lxcGVwdzBiM1dYTk5GejNua0FiejJRSkVPUVMyOUtPaFMvbW9y?=
 =?utf-8?B?akRRVDgyT1lqSU9XV3BxUVN5U2FhQUtoczcvaEMwaDgxWjdnaUJtQUlPM05J?=
 =?utf-8?B?NVVTdkFyb0lNaFVZRUV3LzdwdmcrS1ZXaDRPWEcydGlkYjYxRlFvZlFMUmZV?=
 =?utf-8?B?c0RjZFlRWUVRZ215V0srVkdsVlFqMjN1UXNHRTNlb1ZSaG83b25VQWNrR0pP?=
 =?utf-8?B?dVZZRGFWZ3kzcjFFNUJOU2J5SEpOQnpmcVZ0QlV2Nmh5dThvWko2M2hDSEZa?=
 =?utf-8?B?SDlKTGdsdkpFSTBvOHREUkpBR2lJTHBxa2J4ZmljMzVEY21vQWFPV2ZqYnVM?=
 =?utf-8?B?TnlKck5iejBTNWdHaENKR2ZTSTNrSkM1a1djcTdjMysvY0U4UkU5NWlKSm8y?=
 =?utf-8?B?ek93VE5oTmdzd3YwSWpKeUhRaiswWVlpREJxMzZQL0hmUTNPZkRXb2ZVMzZO?=
 =?utf-8?B?SWFoNGpWN3ZSeGhZdmZ1K1FoUWhIemtGeDlNU0kycUhya0sySjhTUk1MekhS?=
 =?utf-8?B?L0JzdDZlZjQ5NnZYOUFvU1M4M0RKRzFUWXFQdjk0NXBJd1UxRlBRdHFuOUlz?=
 =?utf-8?B?TzNqcHdBbUdKYkN3SFErL1E5citCUS8vZVZvdkdHQnc1dzFjQ3Njclp1SXNh?=
 =?utf-8?B?T2MxTVNXRURwcFA0U3dlRHpaaWNDekE5RUJkaDkyODBpbHNtY2ZObC9uSEM5?=
 =?utf-8?B?WlAvS29mOTM2NElpa1p1RjRHZDlFdHk3Nit5VktJNGliRi81RW1TaGtQKzhB?=
 =?utf-8?B?MzZsN2g5YkVtT1NnRkxlcVQ1YmFPajBGczZaRjNkRVJDTzZsTzdBa0U4a2ps?=
 =?utf-8?B?YlJmekpwSlgycWhhRDZvQS8vTFJRSm5zMGxoaHk2cmVkUlFjeXVFeXFwM2hT?=
 =?utf-8?B?ZFJ5VzFuQnMvVjEvVzh0a3BEbEhjbDNJK3F4OGtUdFJocjVIS0QxaEFCZTJX?=
 =?utf-8?B?ME1GL0pIYTg0RHhRT0ZtemtqWm9YbEFpNHMxMVJWSmNJSzBZTHpES01KeWZh?=
 =?utf-8?B?UEdSZlhCTW1kM0MzOWhOc0NYK3hsNFlKQlNKdU9wc2hyWG5FOHdXK2Rkbkxl?=
 =?utf-8?B?TW04RjBDMEJrK1kvWTBVRm5rYWRrT0RjSjR6aHB3V013OGhtMHV2UmNJRmd0?=
 =?utf-8?B?Q2ZmYmwyeThGdDRYUnRaVW9jc3lKb1JteUN6M3Fpb0JnMXV6VkxNVitQdXVS?=
 =?utf-8?B?QmZLN1RhbnFnQlROT0ZBNEZTRmNTYzlMNnR6SVZqZVd3SmVWVkJrbGFlaWZk?=
 =?utf-8?B?V0c0V3R2NWVYYVRKL3pJNDAySEtqM2V2S3l3NWRqcEFMdWJCclF3cjlIMk9k?=
 =?utf-8?B?L01ZbGdISHIwSXFDbHB2MEFhUmpxMlFlVlMyVjNHY0hmYStFanpkS0Q0RzU3?=
 =?utf-8?B?Y2k4Mm1UMkRoajM3UlY3MUl3dUNXZWNSNmQ5dXhvRlRtaUFvNXhEQ1F4UW13?=
 =?utf-8?B?S3VyZWduVWNvZEFTbC84MWVkTmd5S3FuV1Rvd1Z2L2dBY3JOczlqeFhaR1lu?=
 =?utf-8?B?QlJHV00wbHVZU3JEK0pNUHUxT2RGRmZJTkxObGdnTjJZZFZHKy91R3RNckQx?=
 =?utf-8?B?ZU9TZERVSjU5R2l6eUxadHlJL2hkR1JnUk5UQzNhUTRqUUpzT2tJUWhhZUxi?=
 =?utf-8?B?QzlTeFc5LzRvU3lqSGkxSmV6ZS9rdTFjbDBQZFRKVDlKWnNiYTJwdFVocm56?=
 =?utf-8?B?NG1GUnBONlE3Tlp2WFBRb3pwY2F6QXFBcGs0VlNpU213VytKL3g3aWNLNmJH?=
 =?utf-8?Q?Y40AaI2yAWvcq4mYUd4tmtBQo?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB5131.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7739e094-5c36-4b46-9d5b-08dd6b9aab00
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2025 12:43:39.3969
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bfgkWvfK0zlXKEZv+UL5p9E/5MTNIX5TEopyghEwrw/1s9Zmk12ChZGuGqBtHkmE94OwZ62l3QJxXxnTkbLVSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8705
X-OriginatorOrg: intel.com

VGhhbmtzIExhdXJlbnQhIA0KDQotSmVycnkNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
CkZyb206IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNv
bT4gDQpTZW50OiBUdWVzZGF5LCBNYXJjaCAyNSwgMjAyNSA4OjM4IFBNDQpUbzogSHUsIEplcnJ5
IFcgPGplcnJ5LncuaHVAaW50ZWwuY29tPg0KQ2M6IGxpYmNhbWVyYS1kZXZlbEBsaXN0cy5saWJj
YW1lcmEub3JnOyBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmc7IEtpZXJhbiBCaW5naGFtIDxr
aWVyYW4uYmluZ2hhbUBpZGVhc29uYm9hcmQuY29tPg0KU3ViamVjdDogUmU6IFtBTk5PVU5DRU1F
TlRdIGxpYmNhbWVyYSB3b3Jrc2hvcCAyMDI1IC0gTmljZSwgTWF5IDE2dGgNCg0KSGkgSmVycnks
DQoNCk9uIFR1ZSwgTWFyIDI1LCAyMDI1IGF0IDEyOjIwOjE2UE0gKzAwMDAsIEh1LCBKZXJyeSBX
IHdyb3RlOg0KPiBIaSBMYXVyZW50ICYgSGFucywNCj4gDQo+IEkgd2lsbCBqb2luIHRoZSBzdW1t
aXQgcmVtb3RlbHkuIFdpbGwgdmlkZW8gY29uZmVyZW5jZSBzZXQgdXAgZm9yIHRoaXMgDQo+IGNv
bmZlcmVuY2U/DQoNClRoYXQncyBhIHZlcnkgZ29vZCBxdWVzdGlvbiwgd2hpY2ggSSBoYXZlbid0
IHRob3VnaHQgYWJvdXQuIEkgd2lsbCBpbnF1aXJlIHdpdGggdGhlIHZlbnVlIGFib3V0IHJlbW90
ZSBhY2Nlc3Mgb3B0aW9ucywgYW5kIHdpbGwgbGV0IHlvdSBrbm93Lg0KDQo+IFdvdWxkIHlvdSBw
bGVhc2UgcmVzZXJ2ZSBhIFRvcGljIFNlc3Npb24gZm9yIG1lPyBJIHdpbGwgdXBkYXRlIHRoZSAN
Cj4gdG9waWMgbGF0ZXIgb24uDQo+IA0KPiBUaGFua3MsDQo+IC1KZXJyeQ0KPiANCj4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogbGliY2FtZXJhLWRldmVsIDxsaWJjYW1lcmEt
ZGV2ZWwtYm91bmNlc0BsaXN0cy5saWJjYW1lcmEub3JnPiBPbiANCj4gQmVoYWxmIE9mIExhdXJl
bnQgUGluY2hhcnQNCj4gU2VudDogVHVlc2RheSwgTWFyY2ggMjUsIDIwMjUgNjoyOCBQTQ0KPiBU
bzogbGliY2FtZXJhLWRldmVsQGxpc3RzLmxpYmNhbWVyYS5vcmcNCj4gQ2M6IGxpbnV4LW1lZGlh
QHZnZXIua2VybmVsLm9yZzsgS2llcmFuIEJpbmdoYW0gDQo+IDxraWVyYW4uYmluZ2hhbUBpZGVh
c29uYm9hcmQuY29tPg0KPiBTdWJqZWN0OiBbQU5OT1VOQ0VNRU5UXSBsaWJjYW1lcmEgd29ya3No
b3AgMjAyNSAtIE5pY2UsIE1heSAxNnRoDQo+IA0KPiBIZWxsbyBldmVyeWJvZHksDQo+IA0KPiBB
bm90aGVyIHllYXIsIGFub3RoZXIgbGliY2FtZXJhIHdvcmtzaG9wLiBBZnRlciB0aGUgcHJldmlv
dXMgZWRpdGlvbnMgDQo+IGluIFBhcmlzLCBCcnVzc2VscyBhbmQgVmllbm5hLCB3ZSB3aWxsIG9y
Z2FuaXplIHRoZSBuZXh0IHdvcmtzaG9wIGluIA0KPiBOaWNlIG9uIEZyaWRheSB0aGUgMTZ0aCBv
ZiBNYXkuIFRoZSBldmVudCB3aWxsIGJlIGhvc3RlZCBieSBFbWJlZGRlZCANCj4gUmVjaXBlcyAo
WzFdKSBhcyBwYXJ0IG9mIHRoZWlyIHdvcmtzaG9wcyBkYXkgKFsyXSkuDQo+IA0KPiBUaGlzIHll
YXIsIG91ciB3b3Jrc2hvcCB3aWxsIGJlIGNvbG9jYXRlZCB3aXRoIHRoZSBQaXBld2lyZSB3b3Jr
c2hvcCANCj4gb24gdGhlIHNhbWUgZGF5IGFuZCBhdCB0aGUgc2FtZSB2ZW51ZSAoYnV0IGEgZGlm
ZmVyZW50IHJvb20pLCB0byANCj4gZmFjaWxpdGF0ZSBkaXNjdXNzaW9ucyBhYm91dCB0b3BpY3Mg
dGhhdCBzcGFuIGxpYmNhbWVyYSBhbmQgUGlwZXdpcmUuDQo+IFRoZSBMaW51eCBNZWRpYSBTdW1t
aXQgd2lsbCBhbHNvIGJlIG9yZ2FuaXplZCBpbiBhIG5lYXJieSBsb2NhdGlvbiBvbiANCj4gVHVl
c2RheSB0aGUgMTN0aCAoWzNdKS4NCj4gDQo+IElmIHlvdSB3b3VsZCBsaWtlIHRvIGF0dGVuZCwg
cGxlYXNlIHJlZ2lzdGVyIHlvdXIgaW50ZXJlc3QgYnkgcmVwbHlpbmcgDQo+IHRvIHRoaXMgZS1t
YWlsLCBhbmQgaW5kaWNhdGUgaWYgeW91IGhhdmUgYW55IGRpc2N1c3Npb24gdG9waWNzIHlvdSAN
Cj4gd291bGQgbGlrZSB0byBpbmNsdWRlIGluIHRoZSBzY2hlZHVsZS4gV2Ugd2lsbCBkcmFmdCBh
bmQgY2lyY3VsYXRlIGFuIA0KPiBhZ2VuZGEgaW4gdGhlIG5leHQgZmV3IHdlZWtzIGFmdGVyIHJl
Y2VpdmluZyB0b3BpYyBwcm9wb3NhbHMuIElmIA0KPiByZWdpc3RyYXRpb25zIGV4Y2VlZCBvdXIg
Y2FwYWNpdHksIHByaW9yaXR5IHdpbGwgYmUgZ2l2ZW4gYmFzZWQgb24gDQo+IHRvcGljIHN1Ym1p
c3Npb25zLg0KPiANCj4gVGhlIGV2ZW50IHdpbGwgYmUgZnJlZSBvZiBjaGFyZ2UgZm9yIGF0dGVu
ZGVlcy4NCj4gDQo+IFsxXSBodHRwczovL2VtYmVkZGVkLXJlY2lwZXMub3JnLzIwMjUvDQo+IFsy
XSBodHRwczovL2VtYmVkZGVkLXJlY2lwZXMub3JnLzIwMjUvd29ya3Nob3BzLw0KPiBbM10gDQo+
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMDQ0ZjJmYTYtYTI0NS00YWU1LWI5ZGUtN2EyZTg4
MzFjY2Q2QHhzNGFsbC4NCj4gbmwNCg0KLS0NClJlZ2FyZHMsDQoNCkxhdXJlbnQgUGluY2hhcnQN
Cg==

