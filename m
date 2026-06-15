Return-Path: <linux-media+bounces-64886-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5+AQCsGvL2ogEgUAu9opvQ
	(envelope-from <linux-media+bounces-64886-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 09:54:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 75389684597
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 09:54:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=YKESsgDb;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64886-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64886-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8ADF73033AA8
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 07:51:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B86DB3BFE24;
	Mon, 15 Jun 2026 07:51:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0993BED78
	for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 07:50:57 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781509863; cv=fail; b=U9b9hIrH7T6N4AArYjajgjqhlXcTKCQ/PWZQD5G5m00dP5jMEg1pZfnza27ZVu5L/TzlijRdO1CjPPUx9FTCaXz5IvM9oZSQgRIAsFaDbVJMItywiUXJ+/GDGPpzYRSAjQV43v84wClhZVL3ZHmyev4VgreOQodvpBBxZ2dftwE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781509863; c=relaxed/simple;
	bh=2Oayc+M+bQEpAINtXnvFlHip+sR34US7Dec4I48mhf8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pmaNHPcHVuhyp0aYENib+PXDfDufRHa8VExKo2q27/y5JRMQHFBx5BkIWWmWq3K2Ok40+Tlja2SwAKeL/gv83w+KNj4MIgA5H8ow/4ZDNCmL6NsBwAq01TsHPfyP8A/NOYqgpG85oGrjNr/XdmeuI7D3sZhykvgUHxD3e58E0VY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YKESsgDb; arc=fail smtp.client-ip=198.175.65.12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781509858; x=1813045858;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=2Oayc+M+bQEpAINtXnvFlHip+sR34US7Dec4I48mhf8=;
  b=YKESsgDbrOaR2RmgPSLmWwOaB9Ee8CR70XfkWQaPC5BYe/TIqtwe2g8l
   Iro5ve57ksIhetpXClnE4XUD9z4fh+fBnoMPKYDbTbcQQHSv0HgZv6VxH
   RrFmzqaPEUiekx2dU4HTcUF+wLgA6ygCGQGZHvC+dMjXJVzBmFvX+W1Zy
   FUYLxLK606lMFQGATwNmnJ28030+JYx7CSQGtQJ+YbC9rNHsz4CfCSr3s
   7j7eA00B8VTiht0JKguD5o56LGHp4ohvP4UJEQcrXXTPFP2SBaItJ80Ch
   VXxp1w6rGDibMA0sIUoN1BkClrUKyXIdksYZ0clw/Q7wbFyDv0Lzj9Zz4
   w==;
X-CSE-ConnectionGUID: /XvdEfSQTauYS9Y0dbfhmg==
X-CSE-MsgGUID: bGBQ+fowSAm7Xt50ONageg==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="93736392"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; 
   d="scan'208";a="93736392"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 00:50:57 -0700
X-CSE-ConnectionGUID: qsDpV0SkT5ylID+55I2grA==
X-CSE-MsgGUID: yWp2Q+GrTaiR8hgDQ0SbUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; 
   d="scan'208";a="251326632"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 00:50:58 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 15 Jun 2026 00:50:56 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 15 Jun 2026 00:50:56 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.30) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 15 Jun 2026 00:50:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KcCFPq/O7/QApsUvjDyJRIMlnsdzZQ25tBDwS4ijZPYn0kNJmR4WTGVMFS6gUlb9YCEbHVjrPowuVcHWkW5KJk9R8DE1D86gq+lnlJtCDdw6ERAdV1QvyUSylcGm+OOK7iN9vQY7xckjsGMdDk/dYWllhfqMN7i1TLMc8pn2bS9iAKMjA8BC6HHkjZ4CjNI39e5pno4F1O0uGfWmh+N4M6ZOeonjM0YJhNHms5v44QMlXBdyHaplxtzxxK3bIc5As0Y/uRKGhWDPc4EwU3zElHRAeLmQpvJddBQUPoxSIffdB7mAfN+1HpfV9QlaScQ9Yu31TRCoAa2729sIiRoZSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Oayc+M+bQEpAINtXnvFlHip+sR34US7Dec4I48mhf8=;
 b=lfZrQXmoqsOP+Ia0+TYfShfOPo/+6tptN62TjQd+mz4Iv/weEtdQxbZmg5GGDUPLkqh332JjxFZdCxd3iQCg9VrbDKmemEwJOAMVpEKXrPp0Fno55AGPUh1HrILCF4MzN9s+VhvInskGjALrtRML0onaClMIMifo783n4mVNcRSgWBJTKrz0MoVJ9NLndnrXLtnnmkfwarsp3BofT2wIKvU2pDIs8GS7ClR9RMfBnadezH5/1R9JCK/QTQWj8d9gHuYkmx/ogs1cdsn4C+DTexhSqA1Wv4j6YZlcYDT2N6KHGavfn+3e6k5HTM2rnaPMHwBRyyosWnfRJtPoS5YDWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7971.namprd11.prod.outlook.com (2603:10b6:8:122::12)
 by MN2PR11MB4597.namprd11.prod.outlook.com (2603:10b6:208:268::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 07:50:51 +0000
Received: from DS0PR11MB7971.namprd11.prod.outlook.com
 ([fe80::40aa:a291:4c25:6e0a]) by DS0PR11MB7971.namprd11.prod.outlook.com
 ([fe80::40aa:a291:4c25:6e0a%3]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 07:50:51 +0000
From: "Yeh, Serin" <serin.yeh@intel.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
CC: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>, "Su, Jimmy"
	<jimmy.su@intel.com>, "Sapre, Sarang" <sarang.sapre@intel.com>
Subject: RE: [PATCH v1 2/2] media: i2c: ov8856: fix debug message to report
 actual CSI-2 lane count
Thread-Topic: [PATCH v1 2/2] media: i2c: ov8856: fix debug message to report
 actual CSI-2 lane count
Thread-Index: AQHc+YcAHNwKcGlJj0as/sMS446ey7Y5MAqAgAYTHuA=
Date: Mon, 15 Jun 2026 07:50:51 +0000
Message-ID: <DS0PR11MB79710AD8429CEDBFDDAC263EF6E62@DS0PR11MB7971.namprd11.prod.outlook.com>
References: <20260611095046.2665272-1-serin.yeh@intel.com>
 <178117564309.3890308.14729161396189411788@ping.linuxembedded.co.uk>
In-Reply-To: <178117564309.3890308.14729161396189411788@ping.linuxembedded.co.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7971:EE_|MN2PR11MB4597:EE_
x-ms-office365-filtering-correlation-id: d563cd1c-995e-467c-34a5-08decab2d26d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|38070700021|22082099003|18002099003|56012099006|4143699003|11063799006|6133799003;
x-microsoft-antispam-message-info: +tkRbgk7nkYrbZuPgYA60VoAEFzXrgkkVr1cNGCO1EyCZg+3ruj0rB/FWmqw8SJTEoszY7zkpKHf0Gq9ESFxUzb0DUmJc372zf0dhZjTVE82LwRGauQBc5Ds3vBX4DcolskOnfqhc1mb+n5OFSmtZPAaMNJNraQ+fiLZVjGbTb5KhNFDMCDQkG/Rs7QyVVKa8B/IRI5Ykhrm7S8EO+fTwbzIqX1onzJ3DJtUJCE2v8iO4HSYs7KoR4hESQRYeo5B7kHwHKkYr3bJYown2rIhfzInhrvhQ4DrcGKDwEgiR0D8NumoHimH3/MJ4U9kUqSkkNEteu7DKPUyNwox+879+7KLqhTsTnNomRbmxxT9XYYa7E19FA3cvQzseyLei1zYO3gr1VrhZs5YaHMAZTj+JUaoYI00Gu/ik2FeR9ql2mrQCLZMGFR/dHZdDhgnpRgBvNpbRLvIwkfw2puvczOToGsZGIQ5gabZ1TZ5J9JMnYXVafTAgkk1YQlmjhR1oQ2PNWQc2JfiWal9LFrcZQpzCuveOUkQis7co43zcpEwZX8OCt2iraCmap/xMgO5ZjpEtoZMgb4lzMBr4/AqEzfY1D3X9VEPvuu6l5ajslAkEw1BJYxiqC0swRah6LlrtvuW5p8RYxDVbeqhB9BpDURH51tlIqO0N8jMv7ckt3qQPbJHDNmuJaLdSdUuyTLOLB5HyKbuMd1lT+Yq9Hhxa2XBwQaDeft3T1bGAbkU69vKFzztgfehkP5ZrvasIa3kD3w8
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7971.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(38070700021)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dXFTUHVRWGtiSHlKS3UzSEdDMWVjdXJUL25VQ21BS0Zhd3N0WitnVlZ5TFVY?=
 =?utf-8?B?eXBpNmRmQm1zSG1WZDZwQU9LaGlMMDZGWFQxYXJZMDdMOVdwaW5hVDdOT2gr?=
 =?utf-8?B?d1VxVmVaWFh6ZlNpRXA2c0tKVUVSMjI5RVlrY2ZFUVZhZ0tXQi8wUGFnQms2?=
 =?utf-8?B?YmxMeEpHdGpUUk5SdEtNOFUyNnpLRDRBM1JYbmZ1cHovTEZiMG81MGJJTnV2?=
 =?utf-8?B?aXF4dWFZSG9hOTY3RU9KdjZXcllTWlYzOE1SU3pDVFlmN0Nac0JwZ2VKTUpT?=
 =?utf-8?B?VmVOU25YUmFsa2VjKzhPRlpRTTNHTDhzZTlZL2ZEeGNhQ3A4T0ozdFVaUXY0?=
 =?utf-8?B?aWVKVnBRc0MvMjJieXUweW5oTzQ3M2RXOXkwU2dpcHJ5ZDFmQlljME1ERUVn?=
 =?utf-8?B?bHd4djRUN1ZVcFZhSmhEWGpKWWcreGF0NHJvRHJDZ2x5bmNXaWIrekQ1NVFO?=
 =?utf-8?B?elJLeUVDb3pqbmpOZWVJbGpsOE1JRlI5Z29qait5aWs3Ni9HUHlXZloreElG?=
 =?utf-8?B?MVRUNmpOb1AvMnFWSkYzWFpyWnVONzdCMmo2YVdQd0J0eis2bnVnRkd4Y0FI?=
 =?utf-8?B?SGdmMFZLQXhRQitwM0FJc1lZeXVXbktLeTdsdkgyS09zOWFoUGF1c1ZQcldk?=
 =?utf-8?B?ODNxV1VRVDNvRjM3NXIxbU83VC8wSFMyTGtWWlBlMmUvamwxRHJJZFJHS2xq?=
 =?utf-8?B?WUJRdVhkbW9CTHIyKzlsZWRVSW9oWG1rZ09RS0dWdkgvOTBKbDRaUEd4U2Yz?=
 =?utf-8?B?VkNDWkZESFljcW9OMmVxNGhxQlR6b3g4STNXL0pRcDRmNFJjYmtuaDlJQjFZ?=
 =?utf-8?B?MnYyWUVYT0FmNzkwZnhCUG1Ja1ZId25XaVgwY3BuM2lINStmenh4NlJ2aW4x?=
 =?utf-8?B?K05kQ0J1K2xtVWV4YjZJMTJ6NnRmdm0yanlYdjdYOWJKckhiR3hqbU5wRG9F?=
 =?utf-8?B?ZGxIU1ErbXBBTEVjSlB3bWtGZWRQeFlIbjdDOEZnamR6Sy9mRGNHR0xEeXcy?=
 =?utf-8?B?QThLN1BJOTBKdmRTekxNVm1mNW9OQWZXRlFYdU9vSUZHNVQvWWJFWjRVR1JD?=
 =?utf-8?B?Sjlwb3J2WUpmYmZCRXloUGZUR2Qyd090eEZZRGJ6cmNoQjNrR0RjeGpEOW5E?=
 =?utf-8?B?Zk5MQmt3Y2pYQS92OHdsa0x0amVndC9QdjZOeEFJR0FFMkNOakMvVEdOaXc5?=
 =?utf-8?B?T3VJQ1NJRFlJa3ArMVNsc21DOTNoY0ZwSEp5WlUxclB0Nm1EejFLeWp2dEM3?=
 =?utf-8?B?S2ZERTFxbnYyYUpzaVlJandZOStYMlZJU05aMDRxUm9tT3dzUTNmZmtPWURM?=
 =?utf-8?B?Q3ZocVNxeU1SZnNUbGJ3VGpHcEdHcTJxbnBZUjZwR3NYUHR4ZGdWTWpTL21m?=
 =?utf-8?B?YStaVzV5SSthbTk3S1Q4bFhhVGU5cEFHc1pYNWRlbjNuc3picCtBeFBzTVBo?=
 =?utf-8?B?bU9rU1VvNFpGNnlpMlUxVGhwR1JEUlBBeU9IWVEzeDVIYWlnODc5V0NVVys0?=
 =?utf-8?B?K2hsMEhLblhWRVZ0dVdiZUJ1OU1UZGIvK3lwaHZDUGRXaVMwVkhZOEowcFJp?=
 =?utf-8?B?Q3d3eVZ6VjkwWk9iQ1dwQlBjQVhmUktWQ2FBUCs5K2t2NzFYU2hsQjRCQ0pU?=
 =?utf-8?B?dS8ybU9HWGttYmhlSW10SDRQWURNWThnS0UzaTNQZ0c1NFlpNnVOYUtOR2dx?=
 =?utf-8?B?NXVRekh3MzM1b0VwK0NMY0IrbkZSRFQ0OTlrTTgwUCtTZmdENnlZcGx6b2py?=
 =?utf-8?B?V3kzaHpheFpsaUJzMzJmeU85MUI5TlEwY20rUUc3ZTJETjZYbS8yUHdJSGRr?=
 =?utf-8?B?aWEyZGcvY2FRb3VJTjdleURaVTJTcmlUcmFKS3BVTnhvelVpSnRhdk1GeGdP?=
 =?utf-8?B?a3B2bWZlV1dUdDdrLzhFeXJFUERnUndOU29mSmZGbzh3V1l4MW1ZejZxSHJw?=
 =?utf-8?B?a1IzbWRpbFBEd01abEtqL0JxeGU0c0gwU2tvbUFrcGNzcGZzbWw3eEMwNXFD?=
 =?utf-8?B?bkpocFA4cVVZbjAzT25VbTBFNncvY05LMHNYenBCb2hib0dUdWZ0dnljSlYy?=
 =?utf-8?B?c0lJZjRFY2tOa0JqUnlDVjdIbnJiREQxY2dhaTJXRlRsbVYwZVBpcFNKR3NC?=
 =?utf-8?B?S2VXcE1VY2lXT0tJekxMMmhJOGZneUkrWlBXT1JZQ1dCZVhZRnR1c0toc0th?=
 =?utf-8?B?b3dnRWR6ckZ0c0wycThsdjFXYUlacWxnY2RYbDMzNms0eTc1YVpWUENWNWJi?=
 =?utf-8?B?Y1N2enRLb1FqODdhM1RieTJOZ2JLTWUwL2djUWJmRFRJTlRRejJtTGhBQXlN?=
 =?utf-8?B?bDBoeHlBenhZdVFnbWRZVDI5MzR3RzE4anJNZUo3RjFVazA1OXpVZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: F5AekAOv/toyfH0zTatHLZjxkBptI9zwvk0itnkmi4iYxnpDj8x9p3f/FrjhsArkfyapAcgkwPZ5ohGTuTt7wD6ZlFV9jHMRZeXsn1DIiiaHsigVTxUy0ATuoG5XVLu6OPprMz10kv2JC2FHYCatlEFzXjTG7qaRNZOGXULRXIa8RX7N1aFjwCaLhEneIsHT7r5/kvHN1yJy/XN2OzbMxB7sjLkL0NgfUOfziLLwYkhUkD1nnt6JM8jbmesiNoB/sqK9aRb4vIhQAsOhUOsYNm64ywldrQ91uNjW18AH5TWSzwOKXxMa0rDpCVTcAxhaa8Y/mk0rxTsSzoDVMfsYwg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7971.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d563cd1c-995e-467c-34a5-08decab2d26d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2026 07:50:51.6116
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5F8fOsF2+L5CG+/m259BXQ97AzQ1Nf88HbvBu3Egqu5Sy511G7TEaFDzeYhDqTSU5yyMDHUpbZrzvGa/J+ttfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4597
X-OriginatorOrg: intel.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.06 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kieran.bingham@ideasonboard.com,m:linux-media@vger.kernel.org,m:sakari.ailus@linux.intel.com,m:jimmy.su@intel.com,m:sarang.sapre@intel.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[serin.yeh@intel.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64886-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,intel.com:dkim,intel.com:email,intel.com:from_mime];
	DKIM_TRACE(0.00)[intel.com:+];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[serin.yeh@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 75389684597

SGkgS2llcmFuLA0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXcuDQpJIHdpbGwgYWRkIHRoZSBGaXhl
czogdGFnIGFuZCB5b3VyIFJldmlld2VkLWJ5IGluIHYyLg0KDQpTaW5jZXJlbHksDQpTZXJpbiBZ
ZWgNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEtpZXJhbiBCaW5naGFtIDxr
aWVyYW4uYmluZ2hhbUBpZGVhc29uYm9hcmQuY29tPiANClNlbnQ6IFRodXJzZGF5LCBKdW5lIDEx
LCAyMDI2IDc6MDEgUE0NClRvOiBZZWgsIFNlcmluIDxzZXJpbi55ZWhAaW50ZWwuY29tPjsgbGlu
dXgtbWVkaWFAdmdlci5rZXJuZWwub3JnDQpDYzogWWVoLCBTZXJpbiA8c2VyaW4ueWVoQGludGVs
LmNvbT47IHNha2FyaS5haWx1c0BsaW51eC5pbnRlbC5jb207IFN1LCBKaW1teSA8amltbXkuc3VA
aW50ZWwuY29tPjsgU2FwcmUsIFNhcmFuZyA8c2FyYW5nLnNhcHJlQGludGVsLmNvbT4NClN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggdjEgMi8yXSBtZWRpYTogaTJjOiBvdjg4NTY6IGZpeCBkZWJ1ZyBtZXNz
YWdlIHRvIHJlcG9ydCBhY3R1YWwgQ1NJLTIgbGFuZSBjb3VudA0KDQpRdW90aW5nIFNlcmluIFll
aCAoMjAyNi0wNi0xMSAxMDo1MDo0NikNCj4gVGhlIGRyaXZlciBjdXJyZW50bHkgcHJpbnRzIHRo
ZSBudW1iZXIgb2YgZGF0YSBsYW5lcyB1c2luZw0KPiBvdjg4NTYtPmN1cl9tb2RlLT5kYXRhX2xh
bmVzIGluIG92ODg1Nl9nZXRfaHdjZmcoKS4gSG93ZXZlciwNCj4gdGhlIG92ODg1Ni0+Y3VyX21v
ZGUgc3RydWN0dXJlIGlzIG5vdCBhc3NpZ25lZCB0byBhIGNsZWFybHkgc3VwcG9ydGVkIA0KPiBt
b2RlIGF0IHRoYXQgcG9pbnQuIER1ZSB0byB0aGUgbWlzc2luZyBwb2ludGVyLCBlbmFibGluZyBk
eW5hbWljIGRlYnVnIA0KPiBtYXkgbGVhZCB0byBhIGtlcm5lbCBwYW5pYy4NCj4gDQo+IEluc3Rl
YWQsIHRoZSBjb3JyZWN0IG51bWJlciBvZiBDU0ktMiBkYXRhIGxhbmVzIHNob3VsZCBiZSB0YWtl
biBmcm9tIA0KPiBidXNfY2ZnLmJ1cy5taXBpX2NzaTIubnVtX2RhdGFfbGFuZXMsIHdoaWNoIHJl
cHJlc2VudHMgdGhlIHJlYWwgDQo+IGhhcmR3YXJlIGNvbmZpZ3VyYXRpb24gZGV0ZXJtaW5lZCBh
dCBydW50aW1lLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogU2VyaW4gWWVoIDxzZXJpbi55ZWhAaW50
ZWwuY29tPg0KDQpQZXJoYXBzOg0KDQpGaXhlczogYzQ5MmVjOWFlOWVkICgibWVkaWE6IG92ODg1
NjogQWRkIHN1cHBvcnQgZm9yIDIgZGF0YSBsYW5lcyIpDQoNClJldmlld2VkLWJ5OiBLaWVyYW4g
QmluZ2hhbSA8a2llcmFuLmJpbmdoYW1AaWRlYXNvbmJvYXJkLmNvbT4NCg0KPiAtLS0NCj4gIGRy
aXZlcnMvbWVkaWEvaTJjL292ODg1Ni5jIHwgMyArKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21l
ZGlhL2kyYy9vdjg4NTYuYyBiL2RyaXZlcnMvbWVkaWEvaTJjL292ODg1Ni5jIA0KPiBpbmRleCA5
ZDJiMDQ2OWE1NzYuLjYwMTEyMzNhMjE4ZCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9tZWRpYS9p
MmMvb3Y4ODU2LmMNCj4gKysrIGIvZHJpdmVycy9tZWRpYS9pMmMvb3Y4ODU2LmMNCj4gQEAgLTIz
MTgsNyArMjMxOCw4IEBAIHN0YXRpYyBpbnQgb3Y4ODU2X2dldF9od2NmZyhzdHJ1Y3Qgb3Y4ODU2
ICpvdjg4NTYpDQo+ICAgICAgICAgICAgICAgICBnb3RvIGNoZWNrX2h3Y2ZnX2Vycm9yOw0KPiAg
ICAgICAgIH0NCj4gIA0KPiAtICAgICAgIGRldl9kYmcoZGV2LCAiVXNpbmcgJXUgZGF0YSBsYW5l
c1xuIiwgb3Y4ODU2LT5jdXJfbW9kZS0+ZGF0YV9sYW5lcyk7DQo+ICsgICAgICAgZGV2X2RiZyhk
ZXYsICJVc2luZyAldSBkYXRhIGxhbmVzXG4iLA0KPiArICAgICAgICAgICAgICAgYnVzX2NmZy5i
dXMubWlwaV9jc2kyLm51bV9kYXRhX2xhbmVzKTsNCj4gIA0KPiAgICAgICAgIGlmIChidXNfY2Zn
LmJ1cy5taXBpX2NzaTIubnVtX2RhdGFfbGFuZXMgPT0gMikNCj4gICAgICAgICAgICAgICAgIG92
ODg1Ni0+cHJpdl9sYW5lID0gJmxhbmVfY2ZnXzI7DQo+IC0tDQo+IDIuMjUuMQ0KPg0K

