Return-Path: <linux-media+bounces-60040-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cCkBKcTl8mmvvQEAu9opvQ
	(envelope-from <linux-media+bounces-60040-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 07:16:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F1449D90D
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 07:16:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7F4E0301E7E1
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 05:16:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62D7136AB56;
	Thu, 30 Apr 2026 05:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SQf8OqVp"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB09F362138;
	Thu, 30 Apr 2026 05:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777526208; cv=fail; b=UgblQLLfR0Fr19Pf0Q3Zgcl4YCqb5v+CBAxW5MmOFIIKyQWn1NxH8Hp0bT3C0ZvCvSBu8198anMOM04CKgmSyXQxzP0Pw3dwGfGxtFn52UnDKWQ2K+2tdDukhmViCqLezth6VS1zR5kNeY6PT238LV62g0Lfz+2kB8v4G7dwoew=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777526208; c=relaxed/simple;
	bh=tG9YB0HgOz4hRIJQnRWmunD+7fu5t9/pgNwKanNS0D8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=D2LaSJoyQ2dizhYnxzTLCl6c/rTOX1VHsYhmM5oKYLqlsKl9NeV3XqfUjE9WalPVZrt02+GLsEd72ZVlm4rcigGcziSXPXTjRVUeDzMoc9a7vvO9w67BWAIuWCz3uoQgnFYI5Fve5J+4PX/WiF+T0K3vTB6FIVOS2Vp+lUyhA1w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SQf8OqVp; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777526207; x=1809062207;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=tG9YB0HgOz4hRIJQnRWmunD+7fu5t9/pgNwKanNS0D8=;
  b=SQf8OqVpQkXGYG4YW844cRKStC6kgOuvwzPtcfUbXYGyb1Pigp8yjUbk
   RGFCE1E9jI0Gz4j+uVpbtZmRj1YY67lDxa0bBb2BIlM22tDtdcCpikuUu
   bhHrIHWTw1jFYXU6zXcHE9CvSpn9AKicZZEv3CTenTCst+3uQyPe1ReId
   GvXRhJ/NxU1MNvlO2YCTUFqJ9jvpW9/8a41Itt6LPxALgtrVleyS7Xlpi
   bUnp50wyFL/sudiiSEppURPUQvY93fIkAfhdYEriARhz+paEJPKui7u95
   dcNfCJPnE8D1vPCnP0BVB/M7287wQd1PcTdaFepN34C2+5R6Ax+vx4ylL
   Q==;
X-CSE-ConnectionGUID: Zj8VMcoHQxKt6ZYEGbBoUw==
X-CSE-MsgGUID: OBppO/BiSmal96M0Osi4wQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="96030306"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="96030306"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 22:16:46 -0700
X-CSE-ConnectionGUID: cfmnpoOdRXmz4UdD3oFYUw==
X-CSE-MsgGUID: C9IzfbrsQ0CFLxhjzQrpKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="238449519"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 22:16:46 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 22:16:45 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 29 Apr 2026 22:16:45 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.6) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 22:16:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j0NyeePTBeUfqnBq4o3gogAPijldvrj6Q+DLOy4/8jHdtN+tan3dkZStxpHIHH9JUN3MD9tgVh23TODuAXidN6CHFNOvjxkzxURfHewV1gedqGxSXV5XmNCaSTk/S+hSdOYBz4EN9uHGxR9AUQ64mEa+FEIW+nt61dFtPvEdHz5gjKzDc85u3eB1bijTC18rnopiG0YIJK2d70y8cFG7AsNphzlUp6EJN+RMDne12NDfsuQVVijKZ02aauP5lhYm3ugfu158DNEpUcjU+0Gq5BbAlpY6rGyFCSyorGVmWi1aZP/O9nx9dRkRF9H4qlMSI0tkqQv+6SC2Z4Mss3vq1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tG9YB0HgOz4hRIJQnRWmunD+7fu5t9/pgNwKanNS0D8=;
 b=gC7uWn8TDKtIks06S87aPgvnkvRh/bs9Tk67WidCQjgHxTVbWxQS8d+xfVtdxQX3wijBxoPqHXxyMVGFCA4folkQXh/dGt2Y0CmXiQYnyb+QN2fHn4tN+xVEKf0yvrX2dxIUX3rDhwHq7fEsiflSKZAZkzFc3Hd1jidzOC4F48mshV1HrIZYpJSeG0HrFAzyzv+lN5/RBNonTHdxLLeNrc70agO9epKBI5ILNznbJ97PsOzqDeu24A1k4+nc8Mb8frn8xE1VthVZXQZXmggzXgHIdIgBJVHEFIXaqrqYxTCtWgLV7BuOGFVJh71Qlj3ilPhxyt9I5I6a/OfI9HFltA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by PH8PR11MB6928.namprd11.prod.outlook.com (2603:10b6:510:224::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.17; Thu, 30 Apr
 2026 05:16:42 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::9f37:cb81:5463:300e]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::9f37:cb81:5463:300e%5]) with mapi id 15.20.9870.016; Thu, 30 Apr 2026
 05:16:41 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
CC: "kraxel@redhat.com" <kraxel@redhat.com>, "sumit.semwal@linaro.org"
	<sumit.semwal@linaro.org>, "christian.koenig@amd.com"
	<christian.koenig@amd.com>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linaro-mm-sig@lists.linaro.org"
	<linaro-mm-sig@lists.linaro.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "stable@vger.kernel.org"
	<stable@vger.kernel.org>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: RE: [PATCH v2] dma-buf/udmabuf: skip redundant cpu sync to fix
 cacheline EEXIST warning
Thread-Topic: [PATCH v2] dma-buf/udmabuf: skip redundant cpu sync to fix
 cacheline EEXIST warning
Thread-Index: AQHcwNYF9KroOjxdFkWXYGnE97XBWbXJBjIQgCOmsQCAAiMqYA==
Date: Thu, 30 Apr 2026 05:16:41 +0000
Message-ID: <IA0PR11MB718511FF2BBBDE3628F6DBBFF8352@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20260331061657.79983-1-mikhail.v.gavrilov@gmail.com>
 <IA0PR11MB718531C51736C57114D6DC2CF850A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <CABXGCsM8T4e8kaaO_bauHnN0yE5cxwkkcN+eAJWE8hnJ8RdSRw@mail.gmail.com>
In-Reply-To: <CABXGCsM8T4e8kaaO_bauHnN0yE5cxwkkcN+eAJWE8hnJ8RdSRw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|PH8PR11MB6928:EE_
x-ms-office365-filtering-correlation-id: 9fa101cb-049a-4991-fb77-08dea677a9f8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|22082099003|56012099003|18002099003|38070700021;
x-microsoft-antispam-message-info: ee6mU+D9D0Wg/mYOX3MnDQUWEuH/F1jhN/hkrC/trspR+ktkL/HGU3gejzwXIGSOBBd+oWzcwK8JQ337/nOA1J3W2HxaKSd2lznFAQnXUHk12DkuKdpzZVSKmYedpHc9NJNawjOJhIKzU5pQ0zjJ69m+uaJCrggp8Ro3+GH+UwjfYY09OGeg4LK8CtWGAG+rMujed49U+6u4MhJhL5X62io8CaxtyWmrFKleazGI4RqLyY+NqzhqDI25TwCrF3v6EN5W2aknktpSkhGVrzH8KAcf5KjvXbj6k78ZjU1OWOaR+KFTAxU/faFuHtfAgoUKgJzw8bS/6Hk0zFnrUX9RpqL6jJx0DR+gr0tpG35KlF9orQqx3hxKYkZVY//kz4LVwzGdL0EWt1KgelUQ3sJSTpTjoa5scF3OnYaumJQANC683Q/r7q1d7cgSTngKT/a3J4vYVMzlcCaNR1RguD0EyHUY2iUn/Q6HwPo8ThM3W30vVrQGvoONBO8L70wUJ1bTX4Od8W0Arb+PkmVLaYhsntJ4d8AXhI+6dn7NiztOpDaN63NVbxTyomdWNSUY6XTo8+0LSktRKIyIpa7JuG5NSc06s0FrwlWW5hjvIkPvGAYd0Rr6DN0hcgOxjYP2jXf4ojzVA8KXuXtQ7oh1ZdKlUA5aFqRaXfKfJcACX2m4reAr0Hd1QwREb/vUuuUN/kQp3w0MW4VsbIl4sZ+0ta3nroFGO7eMBrUSsxbFIZBN/djiUpbAefnDNhFqBCpwlowixdkvT5cbxBdLvuRxyq6mfEbtw7Xi5C1iS2S1/Wh8wBM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7185.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(22082099003)(56012099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bGJyTEhZb3UvRzNRMEhoSkVMOGo4WFk0QzZRUnZGdWtPS3ZRTFVBSytsVEl4?=
 =?utf-8?B?Zm1TVGFMQmk4UGE5clJlK1NEYmxPdVZ2T2EwRWdlL3RjRjlKQXRuTVFBbUk1?=
 =?utf-8?B?cCsrWTkybDNaQnYrYy9BZHQ5MEFWVVhqVkUzYnRMbWg3R2tFM240T1VGQzUv?=
 =?utf-8?B?UUhlQXBGT0lmR0ZIV096NGQwcnE3RU5MTzc4RzR3Z1lkdXRCRmRIQkdpQkVZ?=
 =?utf-8?B?T2xBTklySDdRVlF2WStCMU84L1pNejhiZmNNcVNJamE0VWRCNHh4cnN0R1ZY?=
 =?utf-8?B?aitkdENETVkybEFBczk4MC9EeXpKYU1PQWk1M0pvVlBHSGc3M2wvMDhrVkhO?=
 =?utf-8?B?R0hQMjRDK0xIUmk2MmowaVF1ajJ6U1A0c0ZMQW1NVU1hUDZhMkVNNVF0MVMw?=
 =?utf-8?B?WnRmSitjLzFBczI3VXVmcWZmRWhyT0t4VExJS21nMjdKNHRsdUFqSVhWWS9H?=
 =?utf-8?B?WTc2MSs5bkVBVmY4N3FPQ1pNRk9lOFJldzVqNjdQRjNBd2NBQzRHVStOdlpK?=
 =?utf-8?B?dGlwQms2ZWxPZFMrUDF5dTVVYm9kQ1VNRHFoRGVSQkpGRHRVbitlQlFUZzJ6?=
 =?utf-8?B?dlhpaUV1WTFzL0NiV0VycDdLNVo5UFFPRVdzeVY2NU9Pd2lsbHViUGR0SFlD?=
 =?utf-8?B?aGIvbmIwelV0WC8wbUlyVVZrOTRmNzA0cjlBaXQyeDR0alQ1NXMzTGo4N3J1?=
 =?utf-8?B?R1B3RUx2L05HeDdQQm5ob3JmeGVKd1pyNW1OZm10RWVMblZaYS8vWDJhcU41?=
 =?utf-8?B?SmJIaGJXV1dVSXBzQ2xqTkxBWjhkR3gwLy9WNlI5VUFaRjhpL2ZhYmprY1Ux?=
 =?utf-8?B?Y0wwRDA4UCtrbzNPQ2I1VDVhOWo5STdjQlBSZm5yNmJRUjVYQkhaZUN4ZlU2?=
 =?utf-8?B?dlFGQlY1OWtYRng0ZDZDaElmQmRNQmtzK2Y3RTh2di8wQ3kwY2lzR2tHV1N6?=
 =?utf-8?B?MjE5N2RLa0w5alBlTnVoOEE0SktnOHlZWk5PV1NsWjFqVkpzL2cvVDVVMElp?=
 =?utf-8?B?eGZNZkZHVk9LM0JXUzZnUEF3eUFNZ3kwUkE1S0JvbUhEVDdudUZ0SjRoQ2Fm?=
 =?utf-8?B?UEc5c3FVNnQxVjArdUh5SmxHS29ZTk1SUmdKbGRkYjFHMjJoZVJNRkNSV04w?=
 =?utf-8?B?ejRDOHNyUkV4TFptVDA0Y0RHMHlnYlhLMEJ1ci8vN3BoQytuVHRLdFJBVmhW?=
 =?utf-8?B?eXpiNmlVb21HU29OWk83OEIvc1lHYjhLU3dnalFGZ1VqVzgxUkZNMk9WOEdX?=
 =?utf-8?B?ejVZb3YvZTliSnFzNTlvaXBUY2FiY0FwR2E5V3NibGZHZ2ludWRPVk1pWUZm?=
 =?utf-8?B?RVMrTm04TUpOdDRMNDVDRUJRZ2ZKQnl4MERTWmVvUmJ5TzI0cjhvOVJ4cXcr?=
 =?utf-8?B?bGh3eGExZzZNei9FYmJpeEJHS3lTdmlpMjRVUVVGZzRNOVcvUG54NXZvVmRj?=
 =?utf-8?B?dE1MdGkzZ2ZkdUlMT2Zqd2wrdkxqL1RpQlBDT1p5MkpkRG9EeWovTnFaYnIy?=
 =?utf-8?B?dFZLNnhpendtR09mRDVkb01WcXJEdERXWjJuaGt5OCtnQWF6aVVPNXVwN3BR?=
 =?utf-8?B?V29RZUdjdDdTVW0vNS9jZmJMWUFybWtQcktFbTl4ZUUrU0xxcm5zV0dOSmdm?=
 =?utf-8?B?Nk95YVVLNVdkNnljWnhRVE9idTY5Zmo5bldCbjg0WmVKUFkzNGpDWjRJelJB?=
 =?utf-8?B?K1FSb0JiQUVSQ3B2bjRiMk9YeEprOU14TE5qalFLS1ZDVmdqWFhqUFQvM3la?=
 =?utf-8?B?VitKK2lMSUp0TXUzamRUS0JRWXR2Nlc1ZHZDV05SbGx5V3plc2hxcFpWUUJq?=
 =?utf-8?B?ZHMzSHRjLzlQdVB5cGY2blBvNzg3a01HMnpJYmJheHZTUm90YUlnVjJVVm5k?=
 =?utf-8?B?VUliRCtqMHliYUQzdVcyUnYyeCt3bXlzVnBvMGpTYXNHVDVRWkF1TzE4OHVy?=
 =?utf-8?B?dURMRVNabXdqRWMxcTFrWisyMlE4QVZxaEJ2b3p2SHJpd0JIOFM1Ty9NU1hV?=
 =?utf-8?B?cEcxTll4NXM0YVkxL0lMNC9MSGZOdUZDaWovMVBVTXVCaWpEbkRiNUMrcnRn?=
 =?utf-8?B?dTZhNjlJeklDa2I4clJtL2s1K1c2Tk1QWWRxSjhORUtvWlg4dkUyTGI1S0V6?=
 =?utf-8?B?Q2F2cmYxWC8yc3lQdWYyOXd6TnpZSXRWRkZnRXdNdzFLQmdBTHNudTc4SFJ0?=
 =?utf-8?B?dFArUDQ2MjhVcGxXWDFuenArWElIeUcwVUl3UmtNN1VsZjRWT0s5N0FXQjFt?=
 =?utf-8?B?MUlqN1RydWJkc05CekYwR3lrYXEvRm9ZZHQwRlhrZlVPY2RGTElXY1M0U1dw?=
 =?utf-8?B?TCtCMmYwOUtwaGdnb2laUWtDZndrRXlrMzBiRTFCL01HMGJNaTFTdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Kbzk5thBVRap1VZVhTo6QpiqyvmGC9+OF8wHe1f4A0Woxs+jioR2KrT14rbfsfrVmafnggWO7Ymw+Iox2TtGnS5SuScSSFLI29LH2g9dWyvw0Wj/XuKxXPRkzwdvZ+uNnD+8SSUGtCzgTletBDk3DtfjieZvsUCMaeemtaqJ4m6dgIE80vuIH6HTAp7CReSO+lJROMONTPzvq3kO1OILMM9XTvDuI3uav8coIgGU+3/vOhi9kZQ9EhV0SMqVMUCdCbdPjwD0J2+HVGkaAj1GVnpQUnBzXCfu+WqMAiA823a1sLkpNhvZKwnV1COgS/TzmNwHMuBzPMtvql58UGP35A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fa101cb-049a-4991-fb77-08dea677a9f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2026 05:16:41.5546
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: neCr/pQjWZ/8ZtDER3W3T8kiyZ4wa3vWIcsDMx2k/617ipH2/9czklwki+uzXznYIjnEwEDT4HvUXi11I1vZcyyAD0A9otn0y25ifVylYA0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6928
X-OriginatorOrg: intel.com
X-Rspamd-Queue-Id: 18F1449D90D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-60040-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[IA0PR11MB7185.namprd11.prod.outlook.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim,intel.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vivek.kasireddy@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]

SGkgTWlraGFpbCwNCg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyXSBkbWEtYnVmL3VkbWFidWY6
IHNraXAgcmVkdW5kYW50IGNwdSBzeW5jIHRvIGZpeA0KPiBjYWNoZWxpbmUgRUVYSVNUIHdhcm5p
bmcNCj4gDQo+IE9uIFdlZCwgQXByIDEsIDIwMjYgYXQgNjoxNeKAr0FNIEthc2lyZWRkeSwgVml2
ZWsNCj4gPHZpdmVrLmthc2lyZWRkeUBpbnRlbC5jb20+IHdyb3RlOg0KPiA+DQo+ID4gQWNrZWQt
Ynk6IFZpdmVrIEthc2lyZWRkeSA8dml2ZWsua2FzaXJlZGR5QGludGVsLmNvbT4NCj4gPiBXaWxs
IHB1c2ggdGhpcyBvbmUgdG8gZHJtLW1pc2MtbmV4dCBzb29uLg0KPiA+DQo+ID4gVGhhbmtzLA0K
PiA+IFZpdmVrDQo+IA0KPiBIaSBWaXZlaywNCj4gDQo+IEkgc2VlIHRoZSBwYXRjaCBsYW5kZWQg
aW4gZHJtLW1pc2MtbmV4dCAoNTA0ZTJiNGFiOTdhLCB0YWdnZWQNCj4gZHJtLW1pc2MtbmV4dC0y
MDI2LTA0LTIwKSwgd2hpY2ggdGFyZ2V0cyA3LjIuDQo+IA0KPiBTaW5jZSB0aGUgcGF0Y2ggaGFz
IGEgRml4ZXM6IHRhZyBhbmQgQ2M6IHN0YWJsZSwgd291bGQgaXQgYmUNCj4gcG9zc2libGUgdG8g
YWxzbyBjaGVycnktcGljayBpdCBpbnRvIGRybS1taXNjLW5leHQtZml4ZXMgc28gaXQNCj4gbWFr
ZXMgdGhlIDcuMSBtZXJnZSB3aW5kb3cgdGhhdCdzIGNsb3Npbmcgc29vbj8NCkkgc2hvdWxkIGhh
dmUgcHVzaGVkIHRoZSAzIHVkbWFidWYgZml4ZXMgdG8gZHJtLW1pc2MtZml4ZXMgaW5zdGVhZCBv
Zg0KZHJtLW1pc2MtbmV4dCBidXQgZGlkbid0IGRvIGl0IGJlY2F1c2UgaXQgd2FzIGFmdGVyIFJD
NiBhbmQgSSBkaWRuJ3Qgd2FudA0KdG8gbWFrZSBhbnkgbWlzdGFrZXMgKGFjY2lkZW50YWxseSku
IEhvd2V2ZXIsIGlmIHRoZSBkcm0tbWlzYyBtYWludGFpbmVycw0KKENDJ2QpIGFyZSBvayB3aXRo
IGl0LCBJIGhhdmUgbm8gcHJvYmxlbSBpZiB0aGV5IGNhbiBjaGVycnktcGljayB0aGVzZQ0KdWRt
YWJ1ZiBwYXRjaGVzIHRvIGRybS1taXNjLW5leHQtZml4ZXMgc28gdGhhdCB0aGV5IGNhbiBtYWtl
IGl0IGludG8gNy4xLg0KDQpUaGFua3MsDQpWaXZlaw0KDQo+IA0KPiBUaGUgYnVnIGlzIHJlcHJv
ZHVjaWJsZSBvbiBjdXJyZW50IG1haW5saW5lIGFuZCBhZmZlY3RzIHVzZXJzDQo+IHdpdGggQ09O
RklHX0RNQV9BUElfREVCVUdfU0cgZW5hYmxlZC4NCj4gDQo+IC0tDQo+IFRoYW5rcywNCj4gTWlr
aGFpbA0K

