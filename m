Return-Path: <linux-media+bounces-53306-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPFZMXbsnWnnSgQAu9opvQ
	(envelope-from <linux-media+bounces-53306-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 19:22:46 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF8818B49B
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 19:22:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B13F1306B9CD
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 18:21:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C190E2C235E;
	Tue, 24 Feb 2026 18:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jd5IzZXM"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D56168BD;
	Tue, 24 Feb 2026 18:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771957290; cv=fail; b=psivHz9vMdYTYOdKPvKDv/jOmjjIlFR/P1KWbkdh6TvD4kFGhmYMoQJ2SBQgkuUxTjC//n/kGBuVSBADIT6iCdiZP5PBW9w8mV2zQSnfMkXikLeLeh/MYYJ4+vPum/gD8zSSKwMKdzQ4Art5ra8XXqcpPIsHanKuharotuPC5C8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771957290; c=relaxed/simple;
	bh=Dda9MP1Mef+nmkVGg7MjdVbb9uxTOIYN4OYHfoCXmkk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=P3b1uynJ3We9w9a91Uah7VOSXYG1awGJPyswyxMkKCl/aabsiOfil5jYjD19NLtX0+P8Bsuc1ZdnBGMnDmOBRH/ct4ViHUcsjmg7+U4e3Ozmi6Bo45Ffx2HqAZDrGQMMnYr8sq2BVkZyVKmacOyuSSvyKL8rz/zsdHCSkCTKFx4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jd5IzZXM; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771957288; x=1803493288;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Dda9MP1Mef+nmkVGg7MjdVbb9uxTOIYN4OYHfoCXmkk=;
  b=Jd5IzZXMIBU2CMhGycOqYUF+6h3I+22id2PkYOHD2QjnmTZzGZfFkX57
   Sl3Fz9wz2nremcTWZIgnTlQgfpDU0u1SPPqjl3G7CkrzG+stMZakrEhS4
   RxLR+CYWjjemj+SxbaqLEhJVFaldrN4+3iWWh4+l+i61Ih7YKbbauYsym
   8tcQx5BsTRJAYqXE9l9ETg++prUi+kV/W8/wu/6s5BqAhGCajUNU08978
   WulhapjWWTkpWqZRWm/CK4THbJ8lFPWDlU4YFrI6KJCTbCPbH9ovdhBJ8
   YRIVuq9nY6M1t1iAmDPD9axl0EJlkSgPDdSPtDSMOf/x7qS4sIUU9e7nn
   g==;
X-CSE-ConnectionGUID: nV9FaevgRcep1RblfvkyCA==
X-CSE-MsgGUID: MeUrBZSXS0GiKCgwFEkLnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="72018265"
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; 
   d="scan'208";a="72018265"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 10:21:27 -0800
X-CSE-ConnectionGUID: iGKr922oSrKZK+LJJ5KztQ==
X-CSE-MsgGUID: 0k+wBM7/QM+7FQlNA6ANiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; 
   d="scan'208";a="213762229"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 10:21:27 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 10:21:26 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 24 Feb 2026 10:21:26 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.48) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 10:21:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YWQhDOsyfDpdi9o1jNPyl8GbuP8Bdqt2PHlnWhyvTqLR9119LjwleUd+SpN90v9q9czUwFB5fxHp9KYCtWRzLvv9x+1qoAUnQNY6yociZayq46B2usihc7ieVzP/fGyZYFd5lzDNPRnXP4fmxlJlnIVV8pxYelsSbFrzBcuWNFs5xRb+8lA2kQaeflFggAwifEE9e0AQhkzMQq5kJAh8TaHnNFe02oT270CaQDFvTixADYVcPo8jAUm4KKxuxzPcgowXQF7cqJ3bCxgu8Z6zXnJzJ3g0wVogn1651vHvkNxHwmrPV7MYrG8G4VbU5FYtI1jMz/X5HgkHl+nRkkDBlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dda9MP1Mef+nmkVGg7MjdVbb9uxTOIYN4OYHfoCXmkk=;
 b=cgwsuGHkeKue2GQ0LPVMcaFxdc/MbJ8i9BEuyWS5DLeJEi/aKwVEuA2/6RHvkcHIF0N3yqxp5RjWvPmNXX/Iqmgu3HJ9s1TaHjWOxyIGe5fTJAcFV7aWc6dvHZgHN0RQ/vFJzug9JX+3dxk2tn7I8LX3TyIRstPsHYcjgVkEByzzjhhnsWpDxdk5N7gcDNN/5ifxskCYL0cxeNG0OytAIJWobm/ZSjsWMDfD/OMLTk9zLSrhZfI7AdPyLRYLiw/qCAZBPTZCjp6LTMJF5fT+a7HzKm1dl4OYiMMZU8s8iQpGkS+6n9c6xX6JF3Pl/hNntx8haxTkusIjikg877B82w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB8022.namprd11.prod.outlook.com (2603:10b6:806:2fe::14)
 by DS0PR11MB7559.namprd11.prod.outlook.com (2603:10b6:8:146::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 18:21:22 +0000
Received: from SA3PR11MB8022.namprd11.prod.outlook.com
 ([fe80::5bc2:3dd9:94f0:21ce]) by SA3PR11MB8022.namprd11.prod.outlook.com
 ([fe80::5bc2:3dd9:94f0:21ce%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 18:21:22 +0000
From: "T, Arun" <arun.t@intel.com>
To: "johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 2/2] media: i2c: ov13b10: Support tps68470 regulator and
 gpio
Thread-Topic: [PATCH 2/2] media: i2c: ov13b10: Support tps68470 regulator and
 gpio
Thread-Index: AQHckcrreo1QZ7XwskOGu5shQMdbp7VviO8AgBb7JqCAC8y+oA==
Date: Tue, 24 Feb 2026 18:21:22 +0000
Message-ID: <SA3PR11MB8022FC7FA01D5895819F93E29D74A@SA3PR11MB8022.namprd11.prod.outlook.com>
References: <20260130092431.2335363-1-arun.t@intel.com>
 <20260130092431.2335363-2-arun.t@intel.com>
 <591ac511-d339-40d1-9cae-299e068a9b17@oss.qualcomm.com>
 <SA3PR11MB802244F8C5FD80539D92C6BC9D6DA@SA3PR11MB8022.namprd11.prod.outlook.com>
In-Reply-To: <SA3PR11MB802244F8C5FD80539D92C6BC9D6DA@SA3PR11MB8022.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB8022:EE_|DS0PR11MB7559:EE_
x-ms-office365-filtering-correlation-id: 321ac34c-076a-40c2-244f-08de73d1838c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|10070799003|376014|366016|1800799024|38070700021|7053199007;
x-microsoft-antispam-message-info: =?utf-8?B?bUpOVS8zMUdpNWdUZ2R3YzZGVDZlM1Y4SEhlelFzUTdNdnllMTBlV0lUR0kz?=
 =?utf-8?B?Z3BzaSt0NVRSbllWcjNnMnU4T2hNVjBzUjlFbnY5bnNxem5UaXNKWjQ5OG5a?=
 =?utf-8?B?VFlsUGU1YzJVb0ViLzdqdEIrL3crNGx5Wk4vZDBYTmc0MGZMaStlVmo2M2tq?=
 =?utf-8?B?RHNGZGJaUm80eXdrQkdlakVrUXpIdGcyK1RaVGQvb0Yxc2NyNlprM3IyNWh3?=
 =?utf-8?B?eW05SDNrYS91d3BSaWxHQkxWekRleHAwVkE0SDhNVmhGUzFtbUFUdzZ3Qmpw?=
 =?utf-8?B?SUxlZ0V6WVhQMUZxWmdvaVhSd0pwYWs0MzF3MEMwOUhEMENtTUdCS25jVDcw?=
 =?utf-8?B?OE5XWmNPYXplaXhlaElIYWkwUGszOG1iQjJlWlNpNUJQa2hqeEFOUG16R2Vl?=
 =?utf-8?B?MVZxYzE4djFGK3loSHhiWHV6WGZvK2lVYnY1ZW0wdmRMK1dTM1J4WVhUTUhs?=
 =?utf-8?B?bGZYUko2UHJsMG5EZnFLK1BUWGt1QXRqaC94cXVqaFg3c2pld1lZdytMc2Nu?=
 =?utf-8?B?SXd4N0NNUFpGaUtXSi9BVHBxM3h6bGNSY2x2MXVpZTVmY2Z0RnlPeStOTm9W?=
 =?utf-8?B?Vk4wbi9hSXVldExvQ0x0UmJlbnN2SEtIZDdQRHRTK0lNQllvamNxSGdyckk4?=
 =?utf-8?B?WHhxK2xMNWUzMktyVXFDSjJCekJCa0YwYmFYV3Y3Y2J5RjFrRWlXQjh1R1Iv?=
 =?utf-8?B?T0JaRmNubTV5elJkNjc0ZUt0TVhCQWlxMXBKa2w3ZS92emU4Y0VacUhwUDFt?=
 =?utf-8?B?QUZ5OEgwbkozV0d6d0k1enN1eTRvaGVHQ29SdGttU1pTWWJ6TnpvcmZCMFM4?=
 =?utf-8?B?MTVPc2dMalI0Mm5kaDUxeS9IUWFtSzVueHIzVk9pbDQwY2FYWFVSTFJweG9F?=
 =?utf-8?B?Q2dIZGZEeHgwWGluSUhwTURsZVRTai9BUUkwcGRpRmJwOVFpNEV1VW80eW51?=
 =?utf-8?B?ZlZ2aXYxS2ZnYWRzTzJ4UmRpbnlCcmF1SENjSFR3cmw4Q0RWNzZtN0F4M2RT?=
 =?utf-8?B?cVhLb0prOGNwdFJwSHY5N0xvdEpWQzFXUTVWbmN1TXRsOTYzWFpWcjNDMjhX?=
 =?utf-8?B?VVJnUStHRzhSWkhuM3ZDdHFPQ2RXemowOHc5U1REMEhwcllXRTJ5M3ZUT2VU?=
 =?utf-8?B?WFBjTFFDZ1lFeUVPRkZQWU9nUDUzQ2w1MWpNb01FSzkxd2JaQ3ZweEF3NlNy?=
 =?utf-8?B?WGdiUW80V0R6YXcvNThkVllLQWo4bUdIR1V6aUhpMnBlNUtHUWVIQ0hTdzhF?=
 =?utf-8?B?YUhqcFRBUzR0aVZEQkNtQjI3c20wamJOU3J2MGdLaWN4RkJJYjUzM3l6RW8w?=
 =?utf-8?B?S1A3ZkIvcGxPTWpSeGNobHBZS0k3UWx2UlpFbmh1Z2sxdTZpNm5URnh0QW1T?=
 =?utf-8?B?QWw2bVE0UE9oTkFVWTlqMmlhUmhybVV6NzV1ejF3V0ErblhaZ0ltQ2ZNVVJr?=
 =?utf-8?B?SDhzWDFTYVM4Q3h0RGQ0bm1qRGUwSGlPSlM2TFZFRDNVUnJnb3FNOGs3bDFt?=
 =?utf-8?B?WG14L2dTMlc2SFcyakpPdnBQbElvei9XZzBMcFRVeVQ4MXlRaGRIakhnRXpx?=
 =?utf-8?B?bjJRMXFBTG9JQnZ3cEtaaUkvQkRkZFZsWjBXSHZDQW9MZHpFQzJPYjZ1Y0Zu?=
 =?utf-8?B?YXovMnJ3Nm9lUDBid2I2WExZNzBNOW11c3V6MGdHTWpmNzJob2tjSXcwcHIv?=
 =?utf-8?B?Y3hiUEcrU0EvVUZDLzhIQk5mc3Jray9Yb2VMd2xkZG5MMWNwS1dWYXBubmd3?=
 =?utf-8?B?T0NDbkFvVk02L0N5RlI5U2h5dGtvUWhSY1FTeVN6U0xKK3VQalNablZuc3FC?=
 =?utf-8?B?aXdFc3g3N1Q3WEFhQXFyZzJzTUlFbHJnQTNWZ2pRdzl6bnBKOFFndmg4eVlF?=
 =?utf-8?B?eXZidkg0VlVhaE5SdlVXUTNyNUxyc3JyUGlUcnBDVk9oNytTeDZxQ3BYdnNh?=
 =?utf-8?B?MC9jL1hDcFEyTm1iOVdoUi81TmtHeEgyd2M2d20zbFVPNWNqemFraGU2anFZ?=
 =?utf-8?B?VEgwM1haVWFXSWpiSTNTL2d2bVkwWElOS040bzBPZzVrSTRFUkRvbGk0OVRj?=
 =?utf-8?B?bUsvOGJYZWhKUU9LWWh6cWFKMTBJWVFNTlY3ajFNaWF2M1ZNd2hSSktndE1D?=
 =?utf-8?B?WStGTHBQd0JoQ0pnK3JFK1dYTTFFZE9RZTFBTWl0TW9PaHQwL1AzMUpiejBt?=
 =?utf-8?Q?2qNrJJxcFNGiCFGKC1eSfvY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR11MB8022.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(1800799024)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Tm5yeFJoNHdGYkhPWGUzR2V3bEtBVmJFcmRnZGNyczhLTnZrZHhCUWlQdjh1?=
 =?utf-8?B?NC9HRzB4YjhDMWJJaVJrWU1RVDBJaWVUOHFDWWFjOFVKTmM3c2pJR05YU0cy?=
 =?utf-8?B?enZCMCsxT1R6Y3JRZ2c2Q0pZQ0xod0xyRGlhak5FcUtJSkoxNlpHUDU2RWZa?=
 =?utf-8?B?cWFQNDN0cjBIUGlLNGpqNnNISGZQTnFEaTFYZDRCd2JlWnRmVm1HL2Z0SlJl?=
 =?utf-8?B?bDRyWk4vVVlFQlNUOHR1M2ZnM2Ftd3NEaXNpaGdMemlEM1RGcjVSaUl3Yk1x?=
 =?utf-8?B?NHBUb05FQ0ljOGtsTnpST05zbTlxT3lCRk94VUVXREs4SHdId3JxcW9jeXJx?=
 =?utf-8?B?ZFQrVERiNGNYZE5kMWNkYVRVbkhFbHhEYkVaOG1aZE5WL1ZOcE1ZNlBhcXBB?=
 =?utf-8?B?WUE5bDQ0MERZcEJwR1NHQ2dTMTNQK20rUnJ2UTJjSHNtWVZCVjhpbzhsdDZB?=
 =?utf-8?B?aFdNYTJ4N1lYUXZRWUdJeG5rUk83Q3NncGdHVzVteVUwLzg1MWJ5Mm9ia0Nn?=
 =?utf-8?B?SjhPdjR0d3BlRHVQZDNmNkV1L2xqTXZXN3dsemZUNmRjclVlUTk2OEVZU0Vy?=
 =?utf-8?B?ai8rYU9YREU4dWhVNmloUU9aRU9EZEhKUmhTSVN6c09XbnlxWDIwWVBpa1dr?=
 =?utf-8?B?K0VDbDUyMEV1RWRpOU1FSFU1eHhwYUozUXk2K1Fwa1JHN25ONWVFdVp4UXJD?=
 =?utf-8?B?Kzh3a0xCUWJxc3hDczYwVFJaclJiTjZWelhBYmp5eEZac0t0VHVxdFJDd3Fm?=
 =?utf-8?B?MWRrUkNjd0dnMnU1SXVOUXgzNmIxakNFbmxsekpwMURuQXF4Z2lFaE85UlUw?=
 =?utf-8?B?YSs4MEZpaEdWVTliTFZEQkhwbDNHVFlTUk1kd0Q4d0M0Z0czL05UNUNsMnZ6?=
 =?utf-8?B?ZEhqRStvbDErU1hFTk5BTjdYMlNpTFhvaEdsdUtwZXR6QnlRSUV3MThKNmRP?=
 =?utf-8?B?clVRYXV1ZzZZemE5QmlCSUNxNWRNYjUxR0FsRyszUGVDdCszbDRWbjROSTJ5?=
 =?utf-8?B?MjFGYWFWK2JxL1d5TWFZSGNLTllSVHViSDlQMU5IMUtLUW91dUNLZXVFM21H?=
 =?utf-8?B?Y0hSWEQ5eG5PMmVpcjJZWHdkalJOdmRHUEp2cm16ZUhFWENRT1phVlhmNFVw?=
 =?utf-8?B?Z3J5Kzg3eHpnOGQxWHl4NHVoU1MrWnJtOFlCVFFHNFNkNmFzeE5TNlgrWlBq?=
 =?utf-8?B?QVRKQkYxY3JnVkNSNFgybU1IWFI5T3JPNXJUSDdCWGRTR05oblVROHNVMEZn?=
 =?utf-8?B?OEg0RTVTdDViQ2FDanNFYmNjQS80TDRBd0F0cWVwYUNiLzd1WFhvQ3BPMEFZ?=
 =?utf-8?B?RUFJa05nV3EzVHVYK0U2dTV6dXh3bVpxYTk3RFVRL3V2ZitCY1pIaFhQdjA3?=
 =?utf-8?B?eGZZZ1lrS3ZLejJJNFp6TnBDbVpjcjVaZXB0Y2JPTnY5cjFSR3Z1T2ZJNmky?=
 =?utf-8?B?R1R2ODAxL1BSVXNyVzlsdlhZbGt6VTVBdmdsQ1hRRml4Mm12c3dDTTVmNnd5?=
 =?utf-8?B?WGY1dmtQZkdMR2UwL2JUQVFERzRKRGFUVlhKak5aRGdIckVCTzRKSUkvTm9Q?=
 =?utf-8?B?bkxIU3ZFdHlJNkJHb0JBN0FNYnhoTjFsMXh1dWdIQVltUEM2RmNjUHFIbDFh?=
 =?utf-8?B?dWx2ZU9nMWtUK21Hd1ZsRkpUTDVQd1YwSGVKa0RWbWtpZXEwRm9RMzhqN1NR?=
 =?utf-8?B?bFhYdmh4NzE4NG5LQ0thM3NaaVowVUJSSnU4UHZraDc4NlpSckMxOTh5YklJ?=
 =?utf-8?B?UVRCNU5sc25DeVZ4YnRtYUtNK1QzZHBHSmRFR2FwRzdYRjgzTzJ1RFprb3py?=
 =?utf-8?B?YjExeHVuTkx3Y1piMVhPWmJ6Y0dwRllUVEhocjFUTjNSWllnVWxXeDU2b2RP?=
 =?utf-8?B?ZzU1NmtIekEybzNZVlZ3UTNXL0F3ZU43dUt4ODI2Y0RoaVN6UDE5aVA2TWpS?=
 =?utf-8?B?Y1gyd1VLOUsrMUF6RHhuSkV4V21WRGZUcGlYaWwyU0pCVW9pUElvVi9OK25B?=
 =?utf-8?B?RTV2cUdidm9BeE9mMHRUbGswZGcrQm1SdUVQY0lYYU1nVTJZeDI1ZXdROVRV?=
 =?utf-8?B?OGdNUXowNmxFdExjTndTNlJ4QUVqTUJCcmJON0crbHJsQmlqdUd4QlVOZTY1?=
 =?utf-8?B?REpjR1lUQVJPNVFFZllDTzA3Y1JFZzV2MWxqYTNhaVFRaitmdFh5V2RDdWhk?=
 =?utf-8?B?OUVhc2RHNms5RE9LZUZjMXNNT296MjRDOXFKZWl6c2QzTnY2RWlGTC8vb0w3?=
 =?utf-8?B?MjdjSmpPOGd0b00rNk14WjUvQW5XbHlDQUVTaVpIYkd2SFNFNFBEbmtaRm4z?=
 =?utf-8?B?ZzZpNTIvMExnMUFjQkQ2VzAwYmZDU2dPNmgvMmlkRWczNklEajV0ejQxeGIx?=
 =?utf-8?Q?5GRoBbctc+DRiPcQLByS9fdg3wgiCRhX8LH3g?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8022.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 321ac34c-076a-40c2-244f-08de73d1838c
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2026 18:21:22.5077
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UQXA92S/eE05vAZjPv5jexZZE9hvlxZ/SPSj4pysLJul6UFWmhmjwq5ss++KT4vMIJd5TYeJIHvon2/8r6rqNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7559
X-OriginatorOrg: intel.com
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.94 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_EQ_ADDR_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53306-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,SA3PR11MB8022.namprd11.prod.outlook.com:mid];
	RCPT_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arun.t@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 6EF8818B49B
X-Rspamd-Action: no action

SGkgSm9oYW5uZXMsIA0KSSBoYXZlIHVwZGF0ZWQgeW91ciByZXZpZXcgY29tbWVudHMgYW5kIHB1
c2hlZCB0byBtYWlsaW5nIGxpc3QuDQpDYW4geW91IHBsZWFzZSByZXZpZXcgYW5kIHB1c2ggcGF0
Y2hlcyB0byB1cHN0cmVhbS4NCg0KLQ0KUmVnYXJkcywNCkFydW4gVA0KLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCkZyb206IFQsIEFydW4gDQpTZW50OiAxNyBGZWJydWFyeSAyMDI2IDExOjQy
IEFNDQpUbzogJ2pvaGFubmVzLmdvZWRlQG9zcy5xdWFsY29tbS5jb20nIDxqb2hhbm5lcy5nb2Vk
ZUBvc3MucXVhbGNvbW0uY29tPg0KQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZzsgbGlu
dXgta2VybmVsQHZnZXIua2VybmVsLm9yZw0KU3ViamVjdDogUkU6IFtQQVRDSCAyLzJdIG1lZGlh
OiBpMmM6IG92MTNiMTA6IFN1cHBvcnQgdHBzNjg0NzAgcmVndWxhdG9yIGFuZCBncGlvDQoNCkhp
IEpvaGFubmVzLA0KVGhhbmtzIGZvciByZXZpZXdpbmcgYmVsb3cgUGF0Y2hlcy4NCkkgaGF2ZSB1
cGRhdGVkIHdpdGggeW91ciByZXZpZXcgY29tbWVudHMgYW5kIHB1c2hlZCBQYXRjaGVzLg0KUGxl
YXNlIHJldmlldyB0aG9zZSBwYXRjaGVzIGFuZCBtZXJnZSBpdCAuDQoNCi0NClJlZ2FyZHMsDQpB
cnVuIFQNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IGpvaGFubmVzLmdvZWRl
QG9zcy5xdWFsY29tbS5jb20gPGpvaGFubmVzLmdvZWRlQG9zcy5xdWFsY29tbS5jb20+DQpTZW50
OiAwMiBGZWJydWFyeSAyMDI2IDA4OjQyIFBNDQpUbzogVCwgQXJ1biA8YXJ1bi50QGludGVsLmNv
bT4NCkNjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtl
cm5lbC5vcmcNClN1YmplY3Q6IFJlOiBbUEFUQ0ggMi8yXSBtZWRpYTogaTJjOiBvdjEzYjEwOiBT
dXBwb3J0IHRwczY4NDcwIHJlZ3VsYXRvciBhbmQgZ3Bpbw0KDQpIaSBBcnVuLA0KDQpUaGFuayB5
b3UgZm9yIHlvdXIgcGF0Y2guDQoNCk9uIDMwLUphbi0yNiAxMDoyNCwgQXJ1biBUIHdyb3RlOg0K
PiBPdjEzYjEwIHNlbnNvciBnZXQgY2xvY2sgYW5kIHJlZ3VsYXRvciBmcm9tIFRQUzY4NDcwIFBN
SUMuDQo+IEFkZGVkIHRwczY4NDcwIHJlZ3VsYXRvci9ncGlvIG5hbWVzIGluIHBvd2VyX29uKCkN
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFydW4gVCA8YXJ1bi50QGludGVsLmNvbT4NCj4gLS0tDQo+
ICBkcml2ZXJzL21lZGlhL2kyYy9vdjEzYjEwLmMgfCAzOA0KPiArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL2kyYy9vdjEz
YjEwLmMgYi9kcml2ZXJzL21lZGlhL2kyYy9vdjEzYjEwLmMgDQo+IGluZGV4IDU0MjE4NzQ3MzJi
Yy4uYzI0NjljODhjNzIyIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL21lZGlhL2kyYy9vdjEzYjEw
LmMNCj4gKysrIGIvZHJpdmVycy9tZWRpYS9pMmMvb3YxM2IxMC5jDQo+IEBAIC03MDksNiArNzA5
LDEwIEBAIHN0cnVjdCBvdjEzYjEwIHsNCj4gIA0KPiAgCXN0cnVjdCBjbGsgKmltZ19jbGs7DQo+
ICAJc3RydWN0IHJlZ3VsYXRvciAqYXZkZDsNCj4gKwlzdHJ1Y3QgcmVndWxhdG9yICp2aW87DQo+
ICsJc3RydWN0IHJlZ3VsYXRvciAqY29yZTsNCj4gKwlzdHJ1Y3QgZ3Bpb19kZXNjICplbmFibGU7
DQoNClRoaXMgbmV3IGVuYWJsZSBncGlvIGRvZXMgbm90IHNlZW0gdG8gZ2V0IHVzZWQgaW4gdGhl
IHBhdGNoIGF0IGFsbCA/DQoNCj4gKw0KPiAgCXN0cnVjdCBncGlvX2Rlc2MgKnJlc2V0Ow0KPiAg
DQo+ICAJLyogVjRMMiBDb250cm9scyAqLw0KPiBAQCAtMTQ3NSwxMiArMTQ3OSwxOSBAQCBzdGF0
aWMgaW50IG92MTNiMTBfZ2V0X3BtX3Jlc291cmNlcyhzdHJ1Y3Qgb3YxM2IxMCAqb3YxM2IpDQo+
ICAJdW5zaWduZWQgbG9uZyBmcmVxOw0KPiAgCWludCByZXQ7DQo+ICANCj4gLQlvdjEzYi0+cmVz
ZXQgPSBkZXZtX2dwaW9kX2dldF9vcHRpb25hbChvdjEzYi0+ZGV2LCAicmVzZXQiLCBHUElPRF9P
VVRfTE9XKTsNCj4gKwlpZiAoc3Ryc3RyKGRldl9uYW1lKG92MTNiLT5kZXYpLCAiT1ZUSTEzQjE6
MDEiKSkNCj4gKwkJb3YxM2ItPnJlc2V0ID0gZGV2bV9ncGlvZF9nZXRfb3B0aW9uYWwob3YxM2It
PmRldiwgInNfcmVzZXRuIiwgR1BJT0RfT1VUX0xPVyk7DQo+ICsJZWxzZQ0KPiArCQlvdjEzYi0+
cmVzZXQgPSBkZXZtX2dwaW9kX2dldF9vcHRpb25hbChvdjEzYi0+ZGV2LCAicmVzZXQiLCANCj4g
K0dQSU9EX09VVF9MT1cpOw0KDQpOYWNrLCB5b3UncmUgYWRkaW5nIGEgbG9va3VwIGluIHBhdGNo
IDEvMiwgc2ltcGx5IHVzZSAicmVzZXQiDQp0aGVyZSBpbnN0ZWFkIG9mICJzX3Jlc2V0biIgYW5k
IHRoZW4geW91IGRvbid0IG5lZWQgdGhpcy4NCg0KTW9yZSBpbXBvcnRhbnRseSBib2FyZC9wbGF0
Zm9ybSBzcGVjaWZpYyBpbmZvIGxpa2UgdGhpcyBtdXN0IE5PVCBiZSBwcmVzZW50IGluIHNlbnNv
ciBkcml2ZXJzLg0KDQpBbGwgdXNlcyBvZiAiaWYgKHN0cnN0cihkZXZfbmFtZShvdjEzYi0+ZGV2
KSwgIk9WVEkxM0IxOjAxIikpIg0KaW4gdGhpcyBwYXRjaCBNVVNUIGJlIGRyb3BwZWQuDQoNCj4g
IAlpZiAoSVNfRVJSKG92MTNiLT5yZXNldCkpDQo+ICAJCXJldHVybiBkZXZfZXJyX3Byb2JlKG92
MTNiLT5kZXYsIFBUUl9FUlIob3YxM2ItPnJlc2V0KSwNCj4gIAkJCQkgICAgICJmYWlsZWQgdG8g
Z2V0IHJlc2V0IGdwaW9cbiIpOw0KPiAgDQo+IC0Jb3YxM2ItPmltZ19jbGsgPSBkZXZtX3Y0bDJf
c2Vuc29yX2Nsa19nZXQob3YxM2ItPmRldiwgTlVMTCk7DQo+ICsJaWYgKHN0cnN0cihkZXZfbmFt
ZShvdjEzYi0+ZGV2KSwgIk9WVEkxM0IxOjAxIikpDQo+ICsJCW92MTNiLT5pbWdfY2xrID0gZGV2
bV92NGwyX3NlbnNvcl9jbGtfZ2V0KG92MTNiLT5kZXYsICJ0cHM2ODQ3MC1jbGsiKTsNCj4gKwll
bHNlDQo+ICsJCW92MTNiLT5pbWdfY2xrID0gZGV2bV92NGwyX3NlbnNvcl9jbGtfZ2V0KG92MTNi
LT5kZXYsIE5VTEwpOw0KPiArDQoNClNhbWUgaGVyZSwgdGhlIG9sZCBjb2RlIHdpdGggdGhlIE5V
TEwgbmFtZSBhcmcgd2lsbCB3b3JrIGZpbmUgc2luY2UgdGhlcmUgc2hvdWxkIGJlIG9ubHkgMSBj
bGsgcHJvdmlkZXIuDQoNCj4gIAlpZiAoSVNfRVJSKG92MTNiLT5pbWdfY2xrKSkNCj4gIAkJcmV0
dXJuIGRldl9lcnJfcHJvYmUob3YxM2ItPmRldiwgUFRSX0VSUihvdjEzYi0+aW1nX2NsayksDQo+
ICAJCQkJICAgICAiZmFpbGVkIHRvIGdldCBpbWFnaW5nIGNsb2NrXG4iKTsgQEAgLTE0OTAsOCAr
MTUwMSwxMSBAQCANCj4gc3RhdGljIGludCBvdjEzYjEwX2dldF9wbV9yZXNvdXJjZXMoc3RydWN0
IG92MTNiMTAgKm92MTNiKQ0KPiAgCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShvdjEzYi0+ZGV2LCAt
RUlOVkFMLA0KPiAgCQkJCSAgICAgImV4dGVybmFsIGNsb2NrICVsdSBpcyBub3Qgc3VwcG9ydGVk
XG4iLA0KPiAgCQkJCSAgICAgZnJlcSk7DQo+ICsJaWYgKHN0cnN0cihkZXZfbmFtZShvdjEzYi0+
ZGV2KSwgIk9WVEkxM0IxOjAxIikpDQo+ICsJCW92MTNiLT5hdmRkID0gZGV2bV9yZWd1bGF0b3Jf
Z2V0X29wdGlvbmFsKG92MTNiLT5kZXYsICJhbmEiKTsNCj4gKwllbHNlDQo+ICsJCW92MTNiLT5h
dmRkID0gZGV2bV9yZWd1bGF0b3JfZ2V0X29wdGlvbmFsKG92MTNiLT5kZXYsICJhdmRkIik7DQoN
CkFnYWluIHlvdSdyZSBwcm92aWRpbmcgdGhlIG1hcCBpbmZvcm1hdGlvbiBpbiBwYXRjaCAxLzIg
anVzdCBjYWxsIGl0IGF2ZGQhDQoNCj4gIA0KPiAtCW92MTNiLT5hdmRkID0gZGV2bV9yZWd1bGF0
b3JfZ2V0X29wdGlvbmFsKG92MTNiLT5kZXYsICJhdmRkIik7DQo+ICAJaWYgKElTX0VSUihvdjEz
Yi0+YXZkZCkpIHsNCj4gIAkJcmV0ID0gUFRSX0VSUihvdjEzYi0+YXZkZCk7DQo+ICAJCW92MTNi
LT5hdmRkID0gTlVMTDsNCj4gQEAgLTE0OTksNiArMTUxMywyNCBAQCBzdGF0aWMgaW50IG92MTNi
MTBfZ2V0X3BtX3Jlc291cmNlcyhzdHJ1Y3Qgb3YxM2IxMCAqb3YxM2IpDQo+ICAJCQlyZXR1cm4g
ZGV2X2Vycl9wcm9iZShvdjEzYi0+ZGV2LCByZXQsDQo+ICAJCQkJCSAgICAgImZhaWxlZCB0byBn
ZXQgYXZkZCByZWd1bGF0b3JcbiIpOw0KPiAgCX0NCj4gKwlpZiAoc3Ryc3RyKGRldl9uYW1lKG92
MTNiLT5kZXYpLCAiT1ZUSTEzQjE6MDEiKSl7DQo+ICsJCW92MTNiLT5hdmRkID0gZGV2bV9yZWd1
bGF0b3JfZ2V0X29wdGlvbmFsKG92MTNiLT5kZXYsICJkb3ZkZCIpOw0KPiArCQlpZiAoSVNfRVJS
KG92MTNiLT5hdmRkKSkgew0KPiArCQkJcmV0ID0gUFRSX0VSUihvdjEzYi0+YXZkZCk7DQo+ICsJ
CQlvdjEzYi0+YXZkZCA9IE5VTEw7DQo+ICsJCQlpZiAocmV0ICE9IC1FTk9ERVYpDQo+ICsJCQkJ
cmV0dXJuIGRldl9lcnJfcHJvYmUob3YxM2ItPmRldiwgcmV0LA0KPiArCQkJICAgICAgICAgICAg
ICAgImZhaWxlZCB0byBnZXQgYXZkZCByZWd1bGF0b3JcbiIpOw0KPiArCQl9DQo+ICsJCW92MTNi
LT5hdmRkID0gZGV2bV9yZWd1bGF0b3JfZ2V0X29wdGlvbmFsKG92MTNiLT5kZXYsICJkdmRkIik7
DQo+ICsJCWlmIChJU19FUlIob3YxM2ItPmF2ZGQpKSB7DQo+ICsJCQlyZXQgPSBQVFJfRVJSKG92
MTNiLT5hdmRkKTsNCj4gKwkJCW92MTNiLT5hdmRkID0gTlVMTDsNCj4gKwkJCWlmIChyZXQgIT0g
LUVOT0RFVikNCj4gKwkJCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShvdjEzYi0+ZGV2LCByZXQsDQo+
ICsJCQkJCSJmYWlsZWQgdG8gZ2V0IGF2ZGQgcmVndWxhdG9yXG4iKTsNCj4gKwkJfQ0KPiArCX0N
Cg0KWW91J3JlIHVzaW5nIG92MTNiLT5hdmRkIHRvIHN0b3JlIHRoZSBvdGhlciAyIHJlZ3VsYXRv
cnMgdG9vIHRoYXQgY2Fubm90IGJlIHJpZ2h0Li4uDQoNCkFsc28gZm9yIGFkZGluZyBtdWx0aXBs
ZSByZWd1bGF0b3JzIHlvdSBzaG91bGQgdXNlIHRoZSBidWxrIHJlZ3VsYXRvciBBUEksIHNlZSBl
LmcuIDoNCg0KaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQv
dG9ydmFsZHMvbGludXguZ2l0L2NvbW1pdC9kcml2ZXJzL21lZGlhL2kyYy9oaTU1Ni5jP2lkPTM3
NWZjOTAzZTU3Y2IzY2E0ZDJkNTQwOGRlOThkNjM2OWQ0YzgzMzQNCg0KQW5kIHRoZXJlIGlzIG5v
IG5lZWQgZm9yIHRoZSBpZiAoc3Ryc3RyKGRldl9uYW1lKG92MTNiLT5kZXYpLCAiT1ZUSTEzQjE6
MDEiKSl7IGhlcmUsIHRoZSByZWd1bGF0b3IgY29yZSB3aWxsIHByb3ZpZGUgZHVtbXkgcmVndWxh
dG9ycyBvbiBib2FyZHMgd2hlcmUgdGhlcmUgYXJlIG5vIHJlZ3VsYXRvcnMgZGVmaW5lZCBmb3Ig
ZG92ZGQgYW5kIGR2ZGQuDQoNClJlZ2FyZHMsDQoNCkhhbnMNCg0KDQo=

