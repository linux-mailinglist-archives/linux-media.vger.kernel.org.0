Return-Path: <linux-media+bounces-28033-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF54A5C3AD
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 15:21:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C15AF3B246B
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 14:21:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2105425B68F;
	Tue, 11 Mar 2025 14:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AT61QhY5"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29E719AA63
	for <linux-media@vger.kernel.org>; Tue, 11 Mar 2025 14:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741702875; cv=fail; b=nF7Rx2GvTHwPuJp1AAJrvrfUkgIDXb7fMy3v33LFd5uybvWvkCPASk7b+Bl6duU6Am41W/XjRM3nibzLsJ2on+Y7VxcYeB5C20znMmotTu5EMAAkU1WbTJHL2ia18B7wh6w2NrucyRszO4q5KfJ/idAggMf7zgG75TUjwNdyyXg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741702875; c=relaxed/simple;
	bh=zYPf43ArnBsd0OMou6mF4jHGgcQlUfK5lnZ5f192sM4=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qSoei+IRulZjdhJuwjcvY32ig7gGVgYoH61pi6sreow2tR063dR/IjjkJDLCdcs9Vl1ef9T+UM9NZRrRI2AHo9aOYtzUsh57hwetyYnQx7KBpDJhycmNw+JnPWz3jR78BLcLqZiXk7LbfhUfZY/0XXxZP/ucq+UBSjqaFX3qgMY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AT61QhY5; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741702874; x=1773238874;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=zYPf43ArnBsd0OMou6mF4jHGgcQlUfK5lnZ5f192sM4=;
  b=AT61QhY5hd7yP3wZjJ2e3tHCuvD8TKGIcP03Gnbx3cD9s5SgHTz4D6II
   fTyTEZMULwDzNl9Yne89BaTficOoA6HpymZdYvLJGHcZXyvgZGH8C5DmO
   P5wCfZpRHAmfvFEpGOamS+88V0Y2VQrW+CambBsHknRefjEnX/RQPPJVc
   UaU4xt+yDo4eBBvOJRdo6LfN+4vfKxAnSmktdOjmyHjF2S5RaoFBhRFPm
   QmiKOyKMQOkAidyabrTCH4plvOKx+bQKlL/0j8UkbzoJhdFtqvVF9PUeg
   ij2QW6ZHuBLT0opyvxLSv5i1CXs8JYQg22KLGFthVoHHum+QfJv/qMsKA
   g==;
X-CSE-ConnectionGUID: 9STn55ehStGbGuPKk2oPkw==
X-CSE-MsgGUID: 4O00N0LkSAWUw6WJ7ebomw==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="42654451"
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; 
   d="scan'208";a="42654451"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 07:21:13 -0700
X-CSE-ConnectionGUID: M1t7OXo+RC+Zik9kI7Mo8g==
X-CSE-MsgGUID: xW+WdQw5Teuv9+vPQrJvEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; 
   d="scan'208";a="125539898"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 11 Mar 2025 07:21:13 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 11 Mar 2025 07:21:12 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 11 Mar 2025 07:21:12 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Mar 2025 07:21:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f15KTsmqkSVS3GzYSF4qUrLEMVEcLDimXJKHKa7dKPCgyWVoFf24n/O4oM9Uf4VmW2RpMsLEdLhl1gPbdOK3CvZmGdkQjY5KoDcIpByFzMFbuQPumlEXPP7HgohJrQiDK9wvgTfGud2jYd+b84nd2oT8AUcoiX0hS2ICIGMtmcXBF4f0zM//mQLyEPi1ULuvayA3vuIZmLyxsIh9EfLD4/WkHO1TPT+5yS+PJM/CiShrSOZckR60Octo2q2abNnVJPO39TdEWQpEv1/+cx5ds/aPjWHKWmR3bx3gpFbiqKgwb4pcImpqXluojiu9t0jziKgJjACavhduuORBKDBpnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TTMywmOEqXU8o6EyAd3KWSf0Vsr/I+yitFLf9S6Hkyc=;
 b=QlCgjC4aIAq3Mn5MBAuWn5nEon0sX+5ITu6ILNxTEJbIT5L1O84bdKQi4TaoM337Jm4bApcX4hqPhHXfRV7V4htXe69uGS7PBxOrPMnDZRwa/V8qgSmGXkhiyYvECnfkT63M710tG4l8/Ue+QIt85CLhmY4gdMqC62VEXJmYI7bXvklso2ezdpj4m6Y+mQ/9iW0RmJJmnUICO0H7V8Iioo6lLEOipjPtIexF6GNMXvIu65NhkEYrUgc3dI90xMm+7nt/7EjrinxXwtdl2rnJk0MHbQHx4Fx/QWUY41UpXHmxtosC8NMqPlDavLFcnr++1KHDFHZt7kfl9UA14GFJfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8230.namprd11.prod.outlook.com (2603:10b6:8:158::21)
 by SJ0PR11MB6717.namprd11.prod.outlook.com (2603:10b6:a03:44f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 14:20:43 +0000
Received: from DS0PR11MB8230.namprd11.prod.outlook.com
 ([fe80::a73e:80f7:8871:99ed]) by DS0PR11MB8230.namprd11.prod.outlook.com
 ([fe80::a73e:80f7:8871:99ed%4]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 14:20:43 +0000
Message-ID: <8580b975-42f1-440f-9f27-aa1c2229a530@intel.com>
Date: Tue, 11 Mar 2025 22:20:36 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] media: i2c: ov13b10: Fix h_blank calculation
To: Hans de Goede <hdegoede@redhat.com>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Arec Kao <arec.kao@intel.com>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, Bingbu Cao <bingbu.cao@intel.com>
References: <20250311084656.516627-1-hao.yao@intel.com>
 <70b8c4d4-09c4-4818-ab59-0ea8867157db@redhat.com>
Content-Language: en-US
From: Hao Yao <hao.yao@intel.com>
In-Reply-To: <70b8c4d4-09c4-4818-ab59-0ea8867157db@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0016.apcprd02.prod.outlook.com
 (2603:1096:4:194::9) To DS0PR11MB8230.namprd11.prod.outlook.com
 (2603:10b6:8:158::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8230:EE_|SJ0PR11MB6717:EE_
X-MS-Office365-Filtering-Correlation-Id: fe66e9dc-afbe-4dbe-1e90-08dd60a7e818
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bDJqYzFlYXV0bkpQUEVmWWlNYnJqdndReUJRaTVGd1AwckNvTTB1V3k5QmZG?=
 =?utf-8?B?OGJNeWZaeCsxTlYvK3VjeEEydjk2cForbDl4ZlFtREQ0VkpSZGpNTnZFc3pT?=
 =?utf-8?B?ZFRHMHVrSlFja1RFZDN0cjg1Q1ZORERISlBoZVo2ZGJIcGYxTE5vNnlQLzhy?=
 =?utf-8?B?Wm4rWEdidXczMUZkeDFKMjZETVhpSXBhdzliK3Jiby8wS09VV2YrdUFWZk9p?=
 =?utf-8?B?SHJCbXNqL2o4VlFkdXBBV2hqVm5yN2VwK05tNngzT001ZTUyTFlBeGpkQkpB?=
 =?utf-8?B?WmNyRVp4QW43MFd1Uk11WEZWN1BwRkt6bm0vOUhPT1NpdkgzR291b3JtRUVp?=
 =?utf-8?B?OTRSdWNSZEpIcElhdHdjVE1RYXd4WUNlcVR5Nit3ZTR6TTlSaU9MbnhJUkhX?=
 =?utf-8?B?K1MxNERKSExzbDREd0dsNWJNSmxWQlJ0dXZwNEVncUNUcWlWcmEwRHVOWFVo?=
 =?utf-8?B?aXJFNEF4K21DZDNySjUwZ1VQcEMyVjlKQVB4SzlIR2tRUDlaWHhscFNrTmc3?=
 =?utf-8?B?SGdnNHhsR2RnYlpUWlRRODNQOW1oT0hQUGdoYlFudDJOUUZWT3RqKzNCOGYv?=
 =?utf-8?B?NlBiQmJTcER6YzhBd3hGOVVOczZEMnBpeHgrYk9oUGw0QnM5NkhCQ04vZEF6?=
 =?utf-8?B?ZWs3LzVDa3d6N3VEQTJ2TkhnMjVCVmVjeEhIcVBubUdON2REUCtoQzVLci9K?=
 =?utf-8?B?OFdpRkVKek1vMEN4bEJXVmRlektTbll3TXZ0MGcySFpUZ2JRSjdoTU5GSmh1?=
 =?utf-8?B?Qk9MaysrM0dKZ0xJOUt1aU8wZXBLa2M4U2l2YVpZRXhuS3NBNm5sUE5GUEhN?=
 =?utf-8?B?ZCtlU3N6SXNUa1pNZEpTUllDTFE2L1ZGWmRSRDRTa2FlMURscm1FekFNOVVF?=
 =?utf-8?B?ZzEvcXNUc0JKc0Q5cDhhUGVFTmVIbzZhWWNkOFBMdEowU0xpMTR6MlBKZm9C?=
 =?utf-8?B?eTZRUzVBa1FqWGNEb0w5NzMvV3djRmJ0QURDRmVjNFhmdmd0Tmh4Z3QrNEJZ?=
 =?utf-8?B?WFA2SUZqRjVjbGZLTWtuZlJQbVRkUkJVc3lwVXUwZzE2djAxTEw0eEwybEdi?=
 =?utf-8?B?eG5JMGxmT0QzOXpvdktCaTlGNTRXUnJiSE13eElRZk9lVk1sT1g4M0xkVWIy?=
 =?utf-8?B?b3pFK2pIZzE0ZUlnVXllYkFDQXluTU9HMmxQZG9FNCtTNUNhUFFhL0RoN3lJ?=
 =?utf-8?B?Wmh4MFZxb2xjZEUwZGxrUzVtR0ptbi8vSnVjOW9vRWJEaHlLTkk5UTJYQ1FK?=
 =?utf-8?B?NGU2N2RYODRLSUpJbzZCV2JqekQyazBlWlV4Y1JCVjhHQUZiTTBicTRMKzNJ?=
 =?utf-8?B?U3BEb2VabHZPd0ZqRmdHUHNYcjVXQU15VmI3bWJxbUZoUks4YWxQbVRCTWhP?=
 =?utf-8?B?TVJpVnhLT1dBYTdxVGl6YXFqWFVrN3E2YnowSjZpSG8yMTdIbHlJcTdhK1Mz?=
 =?utf-8?B?cnNFa1hWclZmNkdNVW8yd1lGc045cHN2RnFYZTExaVpEK2FUMitFSjB2azBM?=
 =?utf-8?B?TGtUbnhSZkNCc2NwdUdEdjZNWllSWmducDkxMlBCMWhjS0VIZDRobUdaRmVk?=
 =?utf-8?B?cUJuSnpEMW5ObnF5VUJTU3hZSkZWUXRKVHE1TjQwQWdFOVliYkhsajFNVFBD?=
 =?utf-8?B?UytOeDV6bmVWVG5iYWtPbmlqRDRyME5sLy8vaEZVTW42R09wKzVITjRvc0g0?=
 =?utf-8?B?ZmQvaVJFaUVYYlNzU2hGaFpOTURSbFBqeHJzbC8vbzRPWk5IaTRmRGFPeExE?=
 =?utf-8?B?YXFROVMrK0V2eDZEaUxqcjN5eHVUYk56VWFoNW1tVnc4UktPdFFpU3ZZdll1?=
 =?utf-8?B?NlJqN0RTRGdsWHJPTTc5YVFZUExQVU45aEFOZUs0Vi9DYWlrTzBEa2VyS2JS?=
 =?utf-8?Q?3Argf357mU17w?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8230.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHVyR3pxMTRXTHhaY3VLUU1pYXRic0VnQnpEaGQ2TGdaeTRRZGcwdHlNZW8x?=
 =?utf-8?B?RTMrdWU5SW1GWEtsczc1YTIwSk91emptOXBXQ0FxV1I5Rkpyakk5ZlRMYlJD?=
 =?utf-8?B?NFI5YnVtRWJGWlVUWWZYd3NtSTZZYXRnNHpXcTU3K0h6VlA2eXFlMTMwcFFG?=
 =?utf-8?B?YVU2WmFxT09Jb2N6SEVQODhVOG4veFc2dmJQOFhtMFoxbEJDVlhFUnFBbGpT?=
 =?utf-8?B?T1pIOEJLNnAybndQWnplcjYwUFQyZ1N0SkJ4MStZU3lxNElBTFQ3YStTNDUy?=
 =?utf-8?B?QXJjY0RCempJakVsTDRQNkErMFRFUkFKeEFLVk9aL0FTNThNMHY1TXhXODFy?=
 =?utf-8?B?OEswcFRTUkFwbmRNMTFHR0NwdFliZkV3ZW95SlVrY1QvQ21PNUdGTjhxUXpJ?=
 =?utf-8?B?TXJiUzdnTHZqejRyYWNjYU5LWjk4aW9jTkY4SWF3cWVPSk4zckRrN1NHa29w?=
 =?utf-8?B?OHAzdnkxRlZXTldmS0o1MytNRFUva0pJRGxlV0d4RE80a2ZtM3VTbEY0Mi91?=
 =?utf-8?B?eTNiYXRPQmhyblNTL0RJQXFscHQ1dmJvaVBiTnl5L2NvVVVHZ3Y1N2xwYWVM?=
 =?utf-8?B?TGJ5WFRudHNWWVVkdDZ4RDlDcldDR08yYzE1ZitwNzNROUQ1ZmNUanlpVytN?=
 =?utf-8?B?OExxWldOMUZKelFhOVM5VHZOVzFUV2YyU3NOU2xndjN1UmZhcXg0eVplelpS?=
 =?utf-8?B?dzJKWFBsQTNqZ1FmTUFZRDlFU3RqUnlWRmdrTXJCVS9Wakhud25pd0QyalE3?=
 =?utf-8?B?V1VZcGpmSHIvYmYrdG9mTmhxbytqVmpqUlNObzFsRE84UWxsYlRPRGt2OVBo?=
 =?utf-8?B?UXVUdzNNVlBLTTc1M2tUVk5rUjN2YThwWXU5Y0Qvb1c5WGhJT29RUjd0VmFH?=
 =?utf-8?B?dVdIMXZvUVU3TTRhcHo2aFFXL0dlN2FGSFZVNEt1UGJoaDM3Wm5mQzZrejZL?=
 =?utf-8?B?R01MazRXamJHcURMbUxvbXdWRjYrdFFxdjdseW1Gc0hONVJYRHp4VkxBa3N0?=
 =?utf-8?B?THRveFhXekdiY1NxbG5VY2J4YXlCczBFRXZ4VnYrR3NiN0VuMU1WT3JKSEZ2?=
 =?utf-8?B?TlFDUms1d3AwOS9Gbm1XUmxSNWVnQ2NETlJaZXpvZFY0TGlpQVozYUdmbW5G?=
 =?utf-8?B?eVdjbFlPaUpjSE9LMlRkL1lFbE8xTHFUejZYUXp0ZlFrUVFiM2FJeTY0WU02?=
 =?utf-8?B?N2JtTFk5MTJucHluQWs5ZVR6QnVod0hSYk1rK3R1bTFKVjRjV010THZhaWYy?=
 =?utf-8?B?SEp4eloxbFFSSDFZMTgzbHpOaUl4ZngyUzZ2c05DMmU2YXFXb3hxWjBabnF0?=
 =?utf-8?B?VWZaVFFFZHVlak5iWW1URjNWT25LS2hxNmN6VHpJblZ6YjZMdDF3c2hPQ1Zq?=
 =?utf-8?B?czRyTDI2eXJoVmFwemlNV0NmZENYTFZXQit3NENBdVZNbDNLN1I2UWR0WVox?=
 =?utf-8?B?VDB2b1hHNWM3Q3I2S0ZvS3MxTDVVQWNjQ0NoSXhlUmF2Y3VvUTkvdTRKZzlB?=
 =?utf-8?B?QWNraTg2aFp6RjRCYzJjUTgzYzcwSlpNQVIyS3JrU2pJaW9iY1R3UWEwc3da?=
 =?utf-8?B?V21Wd0RnOVgrdExQcUQ1UUxHcTZXUnY1dkJTc2k5ZWhzM29rOFQ2aHpOdmw4?=
 =?utf-8?B?aGdTM3dBNUpvVTJNRVN4NTdHWEo5SENNRHZLZEtWYld5V3QveFdJZEE4cW83?=
 =?utf-8?B?L1NJQ1I0Ymx0Q0d3TEZiaHBLbjJTcE03cStVZGx5bFovdFR6bWdobmJ6Z2R5?=
 =?utf-8?B?WU9lemZaTk9oRHZDMyt1bE5aY25NT2QzTURNYkI3M0xxYUlrditWRUYyN0FJ?=
 =?utf-8?B?aDlxejdod1pEWFZjaVJDSzRyWHB6andYcTBVT1BuU3NrZ2xFcCtzd25sMXRI?=
 =?utf-8?B?eEpiWHM1bEs1K21xdDU3WjdLVkwrR1dYZUx6R2cvWnlVbkQ1Z0J3UEdJd3ZM?=
 =?utf-8?B?UVphbmNRcGlYTnJneWNwbWlaUUJjWkUySkx0dHl0NkJLQ0NmY1kwd2NLaXFi?=
 =?utf-8?B?QndHeERxNzkwSHo3Z1BndkVFMkhWTThDSUwrWXhmNEhkb01OQmVxanNQMkxU?=
 =?utf-8?B?cHNlaElpR2dKTnRDeEFzUnhGTG8zNU1PdUNRU2s0OTRNbUtFY1ZXd0g3NDJM?=
 =?utf-8?Q?vznFse1SEOEqYcrqOLdhEBxtl?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fe66e9dc-afbe-4dbe-1e90-08dd60a7e818
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8230.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 14:20:42.9859
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d8Op0uFQMafyofayXfu6wiH2mHmwoP3LeMPaDwM0HdMYL5OZsURs+nolAdPDMFw8+gNO7OC2JQH6x2tQF2jmew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6717
X-OriginatorOrg: intel.com

Hi Hans,

On 2025/3/11 18:20, Hans de Goede wrote:
> Hi Hao,
> 
> On 11-Mar-25 9:46 AM, Hao Yao wrote:
>> Pixel per line (PPL) is calculated as pixel_rate / (VTS * FPS), which
>> is not decided by MIPI CSI-2 link frequency. PPL can vary while link
>> frequency keeps the same. If PPL is wrong, the h_blank = PPL - width
>> is also wrong then FPS control is inaccurate.
>>
>> This patch fix h_blank by:
>> 1. Move PPL from link_freq_config to ov13b10_mode
>> 2. Add PPL value for different modes
>> 3. Use PPL from mode to calculate h_blank
>>
>> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
>> Signed-off-by: Hao Yao <hao.yao@intel.com>
>> ---
>>   drivers/media/i2c/ov13b10.c | 36 ++++++++++++++++++------------------
>>   1 file changed, 18 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/media/i2c/ov13b10.c b/drivers/media/i2c/ov13b10.c
>> index 73c844aa5697..2e83fc23f321 100644
>> --- a/drivers/media/i2c/ov13b10.c
>> +++ b/drivers/media/i2c/ov13b10.c
>> @@ -34,9 +34,6 @@
>>   #define OV13B10_VTS_120FPS		0x0320
>>   #define OV13B10_VTS_MAX			0x7fff
>>   
>> -/* HBLANK control - read only */
>> -#define OV13B10_PPL_560MHZ		4704
>> -
>>   /* Exposure control */
>>   #define OV13B10_REG_EXPOSURE		0x3500
>>   #define OV13B10_EXPOSURE_MIN		4
>> @@ -95,7 +92,7 @@ struct ov13b10_reg_list {
>>   
>>   /* Link frequency config */
>>   struct ov13b10_link_freq_config {
>> -	u32 pixels_per_line;
>> +	u64 link_freq;
>>   
>>   	/* registers for this link frequency */
>>   	struct ov13b10_reg_list reg_list;
>> @@ -114,6 +111,10 @@ struct ov13b10_mode {
>>   
>>   	/* Index of Link frequency config to be used */
>>   	u32 link_freq_index;
>> +
>> +	/* Pixels per line in current mode */
>> +	u32 ppl;
>> +
>>   	/* Default register values */
>>   	struct ov13b10_reg_list reg_list;
>>   };
>> @@ -549,7 +550,7 @@ static const s64 link_freq_menu_items[] = {
>>   static const struct ov13b10_link_freq_config
>>   			link_freq_configs[] = {
>>   	{
>> -		.pixels_per_line = OV13B10_PPL_560MHZ,
>> +		.link_freq = OV13B10_LINK_FREQ_560MHZ,
>>   		.reg_list = {
>>   			.num_of_regs = ARRAY_SIZE(mipi_data_rate_1120mbps),
>>   			.regs = mipi_data_rate_1120mbps,
>> @@ -564,6 +565,7 @@ static const struct ov13b10_mode supported_modes[] = {
>>   		.height = 3120,
>>   		.vts_def = OV13B10_VTS_30FPS,
>>   		.vts_min = OV13B10_VTS_30FPS,
>> +		.ppl = 4704,
>>   		.reg_list = {
>>   			.num_of_regs = ARRAY_SIZE(mode_4208x3120_regs),
>>   			.regs = mode_4208x3120_regs,
>> @@ -575,6 +577,7 @@ static const struct ov13b10_mode supported_modes[] = {
>>   		.height = 3120,
>>   		.vts_def = OV13B10_VTS_30FPS,
>>   		.vts_min = OV13B10_VTS_30FPS,
>> +		.ppl = 4704,
>>   		.reg_list = {
>>   			.num_of_regs = ARRAY_SIZE(mode_4160x3120_regs),
>>   			.regs = mode_4160x3120_regs,
>> @@ -586,6 +589,7 @@ static const struct ov13b10_mode supported_modes[] = {
>>   		.height = 2340,
>>   		.vts_def = OV13B10_VTS_30FPS,
>>   		.vts_min = OV13B10_VTS_30FPS,
>> +		.ppl = 4704,
>>   		.reg_list = {
>>   			.num_of_regs = ARRAY_SIZE(mode_4160x2340_regs),
>>   			.regs = mode_4160x2340_regs,
>> @@ -597,6 +601,7 @@ static const struct ov13b10_mode supported_modes[] = {
>>   		.height = 1560,
>>   		.vts_def = OV13B10_VTS_60FPS,
>>   		.vts_min = OV13B10_VTS_60FPS,
>> +		.ppl = 4704,
>>   		.reg_list = {
>>   			.num_of_regs = ARRAY_SIZE(mode_2104x1560_regs),
>>   			.regs = mode_2104x1560_regs,
>> @@ -608,6 +613,7 @@ static const struct ov13b10_mode supported_modes[] = {
>>   		.height = 1170,
>>   		.vts_def = OV13B10_VTS_60FPS,
>>   		.vts_min = OV13B10_VTS_60FPS,
>> +		.ppl = 4704,
>>   		.reg_list = {
>>   			.num_of_regs = ARRAY_SIZE(mode_2080x1170_regs),
>>   			.regs = mode_2080x1170_regs,
>> @@ -620,6 +626,7 @@ static const struct ov13b10_mode supported_modes[] = {
>>   		.vts_def = OV13B10_VTS_120FPS,
>>   		.vts_min = OV13B10_VTS_120FPS,
>>   		.link_freq_index = OV13B10_LINK_FREQ_INDEX_0,
>> +		.ppl = 4664,
>>   		.reg_list = {
>>   			.num_of_regs = ARRAY_SIZE(mode_1364x768_120fps_regs),
>>   			.regs = mode_1364x768_120fps_regs,
>> @@ -1062,19 +1069,13 @@ ov13b10_set_pad_format(struct v4l2_subdev *sd,
>>   		__v4l2_ctrl_s_ctrl_int64(ov13b->pixel_rate, pixel_rate);
>>   
>>   		/* Update limits and set FPS to default */
>> -		vblank_def = ov13b->cur_mode->vts_def -
>> -			     ov13b->cur_mode->height;
>> -		vblank_min = ov13b->cur_mode->vts_min -
>> -			     ov13b->cur_mode->height;
>> +		vblank_def = mode->vts_def - mode->height;
>> +		vblank_min = mode->vts_min - mode->height;
>>   		__v4l2_ctrl_modify_range(ov13b->vblank, vblank_min,
>> -					 OV13B10_VTS_MAX
>> -					 - ov13b->cur_mode->height,
>> -					 1,
>> -					 vblank_def);
>> +					 OV13B10_VTS_MAX - mode->height,
>> +					 1, vblank_def);
>>   		__v4l2_ctrl_s_ctrl(ov13b->vblank, vblank_def);
>> -		h_blank =
>> -			link_freq_configs[mode->link_freq_index].pixels_per_line
>> -			 - ov13b->cur_mode->width;
>> +		h_blank = mode->ppl - mode->width;
>>   		__v4l2_ctrl_modify_range(ov13b->hblank, h_blank,
>>   					 h_blank, 1, h_blank);
>>   	}
> 
> You are doing a bunch of unrelated search 'ov13b->cur_mode->' replace
> with 'mode->' here e.g. for vblank_def and vblank_min. While this is
> a good change to have which increases readability, this is unrelated
> to the hblank changes, so please split this out into a new patch 1/3
> as preparation for the further changes in the series.
> 
> Mixing those changes into this patch makes it hard for reviewers to
> see which changes you are actually making wrt h_blank handling.
> 
> Regards,
> 
> Hans
> 

Sorry for that - let me fix it in next version. This patchset was mainly 
for the 2 lane setting of ov13b, and the style change is not necessary.

Best Regards,
Hao Yao

> 
>> @@ -1328,8 +1329,7 @@ static int ov13b10_init_controls(struct ov13b10 *ov13b)
>>   					  OV13B10_VTS_MAX - mode->height, 1,
>>   					  vblank_def);
>>   
>> -	hblank = link_freq_configs[mode->link_freq_index].pixels_per_line -
>> -		 mode->width;
>> +	hblank = mode->ppl - mode->width;
>>   	ov13b->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &ov13b10_ctrl_ops,
>>   					  V4L2_CID_HBLANK,
>>   					  hblank, hblank, 1, hblank);
> 


