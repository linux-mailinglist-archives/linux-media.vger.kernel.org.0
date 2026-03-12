Return-Path: <linux-media+bounces-55489-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kH1OHJeLsmneNQAAu9opvQ
	(envelope-from <linux-media+bounces-55489-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 10:47:03 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B736026FCB5
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 10:47:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ADD3B300E24A
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 09:47:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D9923806CD;
	Thu, 12 Mar 2026 09:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nbT83Mmg"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD9078F2E;
	Thu, 12 Mar 2026 09:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773308820; cv=fail; b=Mv2tXCXBuARqA/6iBujLd0BodyEuLuFAmBwe3J0FYEDQN4peCwTLPMYD1aYF+1++ZHIBwn69eD6MtrvM1Roh3NP7XTYLro6//M0Fl3SQHPMKxLT8UTkdOKV6wrJdIARGdZi13IZoZmiutYbsgi5gQSDZQbwXxv8ZH5KD2X3D4Lk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773308820; c=relaxed/simple;
	bh=rGEaqP6z/rgDo8sWlajQcyouGv4NmpuNjbvx5CYny8s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=h4Vb1dQbrFKvA9mlyjA7gpmxU/UOj3leYfkKMRQVJTqJ83K5PVL7lZhs3bo9uOXASLM2aNuo99jBDTya4L1ZFLa/TV//+4F3k8XauTuuXdKMS/l8SFt6SznpE3Oi6H4c/Q6/Lf3CCjOKljwBt16cfYZtIkmwpYLxHmXr3lLOQ7A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nbT83Mmg; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773308818; x=1804844818;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=rGEaqP6z/rgDo8sWlajQcyouGv4NmpuNjbvx5CYny8s=;
  b=nbT83Mmg9ib5yrXVm5XmpQOLxYRSF6BKlH7nuVwv2eqpBrOD/HgDP8Jb
   XKo7wpWzr0kM+0QSzqqpwXS1QPryRRyqeNERAA+UFz53KHAHmn0MZxMmC
   W+DAo5E4Ea8tBVBNLV+A/ICm2gTgAfr4tjDtwfX85cnpvZlOxFi6uXunl
   tWouhCgMQcDWGuY6rgZfpE249nEGjgLc5PrMzjh1Ii3b36zWJpHbX4WkO
   6MIqxeoazJFBTwyOdI3yWqohmRJJEtAlhalga8zfPuXFUDduGxn+wncvb
   IdqASAdfMadUfDkCO5emBsOjvyB+5JTXi/qs6F8MWLPd0Ygl6IiO6+Kaj
   A==;
X-CSE-ConnectionGUID: yoMm0/TfTgaDZsOg7+Lzxw==
X-CSE-MsgGUID: 4caqYN6uS9yEFGmqY2adsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74287393"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; 
   d="scan'208";a="74287393"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 02:46:58 -0700
X-CSE-ConnectionGUID: E2RFdiMaTLq3U+jDNB12aA==
X-CSE-MsgGUID: GwlDumTjReaNHWycAOWcUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; 
   d="scan'208";a="225470983"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 02:46:58 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 12 Mar 2026 02:46:57 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 12 Mar 2026 02:46:57 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.23) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 12 Mar 2026 02:46:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DlZkPUex2fWaO9JBLa6ghEJR7eG99DqhlF7FcebUc8bhkxH1gS9+7viF4emEYUTr3m3K0/DmcPSAuyDL6GgtSuTXw1kUYZXIIDWxKBuqMIhLeLRaFByiFVrMt7QIf/kZcDDVoMq+LLlXVWqBmE5cNoQhTFYKli0Sh71biRHW+Lr8ncYFbUVE7vGnXTTtR2JR11SNq3CEV3p1EPSBlUilbJ1deMdS/3nNFCqHwdnGWh1cgUFOCQSWvkuS1ptx4y8QBS6Ze8uUcA6rNlcO4GK+bYr/HYmN6+z5NKr2gK453ksCPz4I1IeB1B2g9vFil9/D4QBrd/3q108TjXNTGEfT4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rGEaqP6z/rgDo8sWlajQcyouGv4NmpuNjbvx5CYny8s=;
 b=ZRVTcMThFCcFDfo28pzWxlKcm0TpHAlsHvqe4+IVPGCIYinR0NWMLgcq76LP4d19Ztoi15IzXD8VAw7IDIDQFf95A9WYZ2K5kvocjhBBgdgsfmPvVTALVLwUqGAdyiVEVj6le+ptcCv/qWbJyHbC6WmFSHZ7l6xbEfGnhXMW+/OlMDs97ixnH/pLaexYyO+TRr1C22/CoBq3fVvwPz8WLYhdItwDkHJg2RJMtVjw/sRfKIv3pkMeIMCJ85fyOFuHVg0buVDx2tQOpCUg7zlB1k9NOJ0D8jn29G0M7A4aQcqGfkBiKfhb6tHPYZX7y71mJfPCA+VdU8vU2ZSDWSFtrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB8022.namprd11.prod.outlook.com (2603:10b6:806:2fe::14)
 by MW4PR11MB5773.namprd11.prod.outlook.com (2603:10b6:303:180::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.4; Thu, 12 Mar
 2026 09:46:49 +0000
Received: from SA3PR11MB8022.namprd11.prod.outlook.com
 ([fe80::5bc2:3dd9:94f0:21ce]) by SA3PR11MB8022.namprd11.prod.outlook.com
 ([fe80::5bc2:3dd9:94f0:21ce%4]) with mapi id 15.20.9723.004; Thu, 12 Mar 2026
 09:46:49 +0000
From: "T, Arun" <arun.t@intel.com>
To: "johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>,
	Sakari Ailus <sakari.ailus@iki.fi>
CC: "mehdi.djait@linux.intel.com" <mehdi.djait@linux.intel.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 1/2] platform/x86: int3472: Add board data for Intel
 nvl
Thread-Topic: [PATCH v2 1/2] platform/x86: int3472: Add board data for Intel
 nvl
Thread-Index: AQHcp+7BHqgdzPW8iUCRjKvSDyBfA7WZwgkAgARgxgCAAxTp4IAADfcAgAlyGxA=
Date: Thu, 12 Mar 2026 09:46:49 +0000
Message-ID: <SA3PR11MB802231C9F539F83E2B7CC75F9D44A@SA3PR11MB8022.namprd11.prod.outlook.com>
References: <20260130092431.2335363-2-arun.t@intel.com>
 <20260227133542.970820-1-arun.t@intel.com>
 <20260227133542.970820-2-arun.t@intel.com>
 <aaRPMtWnX7nWShmv@valkosipuli.retiisi.eu>
 <0f2502fb-20cd-4638-8428-9a9eb5318147@oss.qualcomm.com>
 <SA3PR11MB802248098C161FB7EFB7CB529D7AA@SA3PR11MB8022.namprd11.prod.outlook.com>
 <14f431a2-3c31-4f23-88dc-7e2d5c8da50d@oss.qualcomm.com>
In-Reply-To: <14f431a2-3c31-4f23-88dc-7e2d5c8da50d@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB8022:EE_|MW4PR11MB5773:EE_
x-ms-office365-filtering-correlation-id: c8628775-56d4-4be3-1b9b-08de801c482f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|7053199007|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: T7piNaOlwW5sGTRlFJi2r5LDpGxiY7OMv5vBOYZ4PLciH7vP/LLfCwq8ebo471XyRCxhp9gCyJOfqoqp7Yn078RR7pw3saXQvEGnJtuODTnH5n3m5BG1NIpUKCamGfycgEX+dIPIBRhtWC7A3yK+gZ3/wPWiPnXamlaxbfsByhO4BJZBG74Bcb+PewGpTnLEU6HfFDD7TeDevuspV9jettJxu3zdN534HWeyCItqeb8jOSvfQv11WnD8vpjVp0I3A2E7OLLJakCrEYaUFNRM/q5YYILwXPujsGXquk1ykVP84sbRrQHkBQFR2fe9P33CYxbL1oKm56wkIujjAiGUMdgRQPHc+sSJ6qj/M++5EXEXKPngY3QSpeebhpvK75AhJ5G062arU4Fbi3mpk8SFsh+UNFyCl4OijHwAVvxGli25dkrC/0rFV9ppSPPE4qOE9VsSR3wbDzMheJcpyk2gAhc/xO1Agw4xFXcrG20vwS85tmA/ruReD8tjUrjjEkLNRvNz04X4Dhc1/DcoQ510wBpq1IA/gwljyQcRd5Pd+6FSItZWrRzd3WxIKXHl+jTpO0mIqNUJ6JijZcDr82hSV8Wjm8tY5GA7B9nLw9nJNpNLHmL7fKqTPbUQTaYwPt00D+buazBGNp1LT4qaoPCAjpU+PV7ZRnkhsSSywJFyNlZkw8QJulxl9pW0BV2YMhqQdtB0SAR/ggCpgj7WKXHi4jwY+CWpm9dioIqNNGRvBvcZ1UKFB67c6/sSorsBLPN+46CRtcmqWzMMefX9xdIGb4VSyQDYDM0cBxrA8EnI3MU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR11MB8022.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(7053199007)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YkVjN1VyeHU2d2wvOC9VSVdqKzNFWFdqb3MrMjRPQUsrNUxjUi92KzZ3aUlz?=
 =?utf-8?B?SVdOTmdLaTlJMUdyU0o4NlRQdVNBMDE4aGYzdDRoL05zMUorYTJwQnU2emxE?=
 =?utf-8?B?bFRuM3BNN1ljZUFuSkJKY25vVkR0RzVmS2laMnFwRXFwNVplZDAzY0kxWmRj?=
 =?utf-8?B?WkxmUkpwNHBVOFNUR1FnSVU5V1ZtVEdlOUxLZFQ5TG9Fd2ppaTJYbkpLQU1n?=
 =?utf-8?B?b25jL1VmZDY0R0ZQakNiYno1akJ2dTZqZ2pUYVVWemFaRUd4bkxuUUxiOTNy?=
 =?utf-8?B?WmFSWUdqWmR2aVdMWGRxTGNFaXR2dTBSdWloREN3aVpjYit6cDl6VEJpRVly?=
 =?utf-8?B?ZC9uNW1HVEdUWXArTVUxdHRNU2lLUVk3Tnk5RzdiQmVtYk03OGgzYktjUk1h?=
 =?utf-8?B?eTFveGFrN3h6YS9FMVlSelRndVhkaFlsZE1SbWJBMVU3dStMRkgwR0pEVUlt?=
 =?utf-8?B?SkVCNjZVOE0xbDhQb3Vmb3ZZWm5LZEtYSnpPRmxwR3BGSjlsLzdVMWVSUTBK?=
 =?utf-8?B?WjB1T0Q3Q01oamtnMHB4Ly9IcEtrSnAyS00xQUJETEVOellyOHhuUUFkSG5N?=
 =?utf-8?B?MEVyYndwQ2xRc0VvcGNUYkd4WjcrV3dtR3hSTWZKNXpzOXE3U2pGNkdaS2Rn?=
 =?utf-8?B?bTlwRHRGNTI4ZkdQdkM4S1VLUU9SdlRhLy9oV2tyZ3lQWkU5bUhYM3hDdk1r?=
 =?utf-8?B?QWdlZ3I3cXV0blo2Qi9raEdvdmZqQXp0N1VOZUt3a3hMQzJIZC9Jbzc1RzAr?=
 =?utf-8?B?OHVLb1h1YjdvOUR5RnBjTC9qODZxQmcxVGJ0Mk9PVE9BamhUcjk3U1RnVGpa?=
 =?utf-8?B?WC84NFdva3ozU2hKSVJGb05lenF1T0VjZmZKa1prZGdKYWx6dVBuS3F3YlA0?=
 =?utf-8?B?RFRwUHRSMTJ5R1RwaVdtU1JBUGEvUGtnWTU5R1dzb2UvRzB3Skk4TGJDYnpD?=
 =?utf-8?B?NWZCSGhVZjJRZ0hTbFptRW9WZmVNS2twU28vaXNlV0JFK0xyRnhkSmV3eThL?=
 =?utf-8?B?cnhoU2hhT1dWV3hXL2hCbmdqMjNGU2lMMEIvUlpzS3RqWWppYVJUZkRjWjdY?=
 =?utf-8?B?SXhFNW5oeEd5b2xFMGJKMGxMZmZVM2orVVBjYitKSlJLOHQ3a1dxWnZ1TGxY?=
 =?utf-8?B?Yk9FSzlyeVdtclU4TS9nK0k0eGJPTkF5UU55UjlyZTJpejVENDNxWWtmcjU4?=
 =?utf-8?B?dlNSMTFqNmI5WG1rQ21PVjZqVFR3bWNOY3Vvd3ZBcUtlWmZzWG9VcVJVdGhP?=
 =?utf-8?B?S2VJZXpybzRWclV1a0xwT3hGd1Z5eWNyTlloL0xOWGczZFk5WkgvamVQT0xH?=
 =?utf-8?B?TjdnSXB4QmtjRURKbXBKOERpMEtoc3J5OHhWYmEvdk8zU2h3TklqeWtQWHBE?=
 =?utf-8?B?UldZU2dzRW1ObkdOQ1h0UUdONVNFNFlXOGhaMWtxY0xEWjZ2TXd5VjRlOS9v?=
 =?utf-8?B?Ly82eUhaOVZhTHVydVJvaERxa1E3cFpiWC84TXVFb3lCQXpFc3paL2tWUWIy?=
 =?utf-8?B?VlUxMXZsU3J3dGU3Yy9HQ2ZzZ0VheXdnYjVXZHRyKzJQSmpoVCtDTW1qUjMr?=
 =?utf-8?B?czNYZ0lNTWFOYWpyejZlUU4zMDBEVEJuOWxGcFJMaHMzUnBZVURDSUpDYitS?=
 =?utf-8?B?V1YyV1BEMlE2NHBUQjN4Y3VNYnFUcmZQMXYxakZONVQxNzRnM3Q2emtJSitV?=
 =?utf-8?B?MTlSYkpsVVRiQkZ2NUNuUTRWREx6Y3ZoQlU2c3QrMEFUMU94bWtDSEVRR29T?=
 =?utf-8?B?dzNlL0dXREZjbUN2RHRocWwra3dFVDhHT05FbmlMajFzQjk4a0VNdVRDOFRk?=
 =?utf-8?B?dm1Da2gzdmFMMVBXZGt1SFRyeWkrcTgzbGg2SHJWRW1mVndEWkM1RWlSN1VC?=
 =?utf-8?B?SkcxQm9neXFHRzVFZXhDSmtJT2Q1K1lWQzQrd2FpbHozWU5ZdFVqNEx0SmVh?=
 =?utf-8?B?MDl1NUc4cUo3NFJnb3dkMmUxM2ZycU05K2hOT2c0d3J3TndreGl1czZQMzQ3?=
 =?utf-8?B?YVkrZWtUWjVlWUJwTS9kV2c3S2haWmxWcy8vRE5xam9PTjN2L3ZNekwxaVp5?=
 =?utf-8?B?RHkxVzJ2TFZybzV6M2VRMEdMeW81c2RuWHFIUVBwNnpoMUlyWlN1VUdWWFBY?=
 =?utf-8?B?Sjc3YkJQNzRJRGI0V0U1RnFrbW8zdTdON0JQdFBRRE42TWQrZ212VlRYeFBz?=
 =?utf-8?B?UzdIelVwRllhZm1LcExyM0ZXS2FQanhkaDU3MzN1bnNORnR6MDk3WDhhaUE3?=
 =?utf-8?B?UkJTRitjQzBQU1ViS3lZczhCdDdEcENwVlZnd0d6WnlEU1JXK1dGYWt5TkJq?=
 =?utf-8?Q?8n6NSRNNX48YWvBq4Z?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: qWcCO9Ql8B1h1pPXmDcyYRcvW7MdhD/H3CPl52eeLCEEbiLtFj3b7vBbDFBvzhXbm8LYONbLbG323s3n+uRnBLQGPo5FwYmJNFmZu5hA4XRrLefTVNhTejG6fuW5DY0F6b+kkQURgZpCkC2n0lYo3nQ8C61f0xsQ5BcNenlhz/w9rZ2LGsb1V/KpUw7SkoBKiZGcnfkhQikLiW4PZQL24HlHKfew1zsGGK6q5q0HuXfYU4FKXB2EirZ02eUdAZ9I3ip1Bt37XsR3AZfg6pLHxdIR0TUs0a/4NxjZX+bjyDERwp7T8A7yejjHrluzXUWg0rTj8gN0byUckAB710W8zg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8022.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8628775-56d4-4be3-1b9b-08de801c482f
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2026 09:46:49.1019
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3vBjUFgwK78OFq3dTgMhQf+/HGOrIWF74SlJM7KmSplxDu4CRSAPUwjjBotyz0kqnJiqMdqFyuuOvOXR3ZvU7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5773
X-OriginatorOrg: intel.com
X-Spamd-Result: default: False [0.94 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55489-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,iki.fi:email];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arun.t@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: B736026FCB5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgSGFucywgDQpUaGFuayB5b3UgZm9yIHRoZSBzdWdnZXN0aW9uLiBZb3Ugd2VyZSBjb3JyZWN0
IC0gdGhlIGkyYyBkZXZpY2VzIGFyZSBkaWZmZXJlbnQgZm9yIGVhY2ggc2Vuc29yLiBJIGFkZGVk
IHRoZSBwcm9wZXIgaTJjIGRldmljZSBuYW1lIGluIFJFR1VMQVRPUl9TVVBQTFkoKSwgYW5kIG5v
dyBib3RoIHNlbnNvcnMgcG93ZXIgdXAgY29ycmVjdGx5IHdpdGggdGhpcyBjaGFuZ2UuDQpJJ3Zl
IHVwZGF0ZWQgdGhlIGNoYW5nZXMgaW4gdGhlIFY0IHBhdGNoIHNldCBhbmQgc3VibWl0dGVkIGl0
IGZvciByZXZpZXcNCi0NClJlZ2FyZHMsDQpBcnVuIFQNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCkZyb206IGpvaGFubmVzLmdvZWRlQG9zcy5xdWFsY29tbS5jb20gPGpvaGFubmVzLmdv
ZWRlQG9zcy5xdWFsY29tbS5jb20+IA0KU2VudDogMDYgTWFyY2ggMjAyNiAwMjo1MyBQTQ0KVG86
IFQsIEFydW4gPGFydW4udEBpbnRlbC5jb20+OyBTYWthcmkgQWlsdXMgPHNha2FyaS5haWx1c0Bp
a2kuZmk+DQpDYzogbWVoZGkuZGphaXRAbGludXguaW50ZWwuY29tOyBsaW51eC1tZWRpYUB2Z2Vy
Lmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNClN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjIgMS8yXSBwbGF0Zm9ybS94ODY6IGludDM0NzI6IEFkZCBib2FyZCBkYXRhIGZvciBJ
bnRlbCBudmwNCg0KSGksDQoNCk9uIDYtTWFyLTI2IDA5OjQ3LCBULCBBcnVuIHdyb3RlOg0KPiBI
aSBIYW5zLA0KPiANCj4gV2UgYXJlIHVzaW5nIENSRCBHMyBjYXJkICsgb3YxM2IxMCAoVUYgYW5k
IFdGKSwgd2hpY2ggaXMgc3VwcG9ydGVkIGJ5IERpc2NyZXRlIGFuZCBUUFM2ODQ3MCBwb3dlciBz
b2x1dGlvbnMuDQo+IFdGIGNhbWVyYSBpcyBwb3dlcmVkIGJ5IERpc2NyZXRlIGFuZCBVRiBjYW1l
cmEgaXMgcG93ZXJlZCBieSBUUFM2ODQ3MCBQTUlDLg0KPiBEaXNjcmV0ZSBzb2x1dGlvbiBwcm92
aWRlcyByZWd1bGF0b3IgbmFtZSBhcyAiYXZkZCIuDQo+IFRQUzY4NDcwIHByb3ZpZGVzIG11bHRp
cGxlIHJlZ3VsYXRvcnMgbGlrZSAiYW5hIi4gVmRkLCBkb3ZkZCwgZXRjLg0KPiANCj4gQXMgcGVy
IHlvdXIgY29tbWVudCBXZSBoYXZlIHRyaWVkIGJlbG93IGV4cGVyaW1lbnRzIGFuZCBzaGFyZWQg
b3V0cHV0IGJlbG93Og0KPiANCj4gRXhwZXJpbWVudCAxOiANCj4gLUFkZCBhdmRkIG5hbWUgYXMg
YSByZWd1bGF0b3IgbmFtZS4NCj4gDQo+IHN0YXRpYyBzdHJ1Y3QgcmVndWxhdG9yX2NvbnN1bWVy
X3N1cHBseSBpbnQzNDcyX2FuYV9jb25zdW1lcl9zdXBwbGllc1tdID0gew0KPiAgICAgICAgIFJF
R1VMQVRPUl9TVVBQTFkoImF2ZGQiLCAiaTJjLU9WVEkxM0IxOjAwIiksIH07DQo+IA0KPiArKysg
Yi9kcml2ZXJzL21lZGlhL2kyYy9vdjEzYjEwLmMNCj4gQEAgLTcwNCw3ICs3MDQsNiBAQCBzdGF0
aWMgY29uc3QgY2hhciAqIGNvbnN0IG92MTNiMTBfc3VwcGx5X25hbWVzW10gPSB7DQo+ICAgICAg
ICAgImRvdmRkIiwgICAgICAgIC8qIERpZ2l0YWwgSS9PIHBvd2VyICovDQo+ICAgICAgICAgImF2
ZGQiLCAgICAgICAgIC8qIEFuYWxvZyBwb3dlciAqLw0KPiAgICAgICAgICJkdmRkIiwgICAgICAg
ICAvKiBEaWdpdGFsIGNvcmUgcG93ZXIgKi8NCj4gIH07DQo+IA0KPiBFcnJvciBsb2dzOg0KPiBb
ICAgIDAuNzMyMTU2XSB0cHM2ODQ3MC1yZWd1bGF0b3IgdHBzNjg0NzAtcmVndWxhdG9yOiBGYWls
ZWQgdG8gc2V0IHN1cHBseSBhdmRkDQo+IFsgICAgMC43MzkyOTddIHRwczY4NDcwLXJlZ3VsYXRv
ciB0cHM2ODQ3MC1yZWd1bGF0b3I6IGVycm9yIC1FQlVTWTogcmVnaXN0ZXJpbmcgQU5BIHJlZ3Vs
YXRvcg0KPiBbICAgIDAuNzQ3NjYzXSB0cHM2ODQ3MC1yZWd1bGF0b3IgdHBzNjg0NzAtcmVndWxh
dG9yOiBwcm9iZSB3aXRoIGRyaXZlciB0cHM2ODQ3MC1yZWd1bGF0b3IgZmFpbGVkIHdpdGggZXJy
b3IgLTE2DQo+IFsgICAgMy42MjEwODVdIGludGVsX2lwdTdfaXN5cy5pc3lzIGludGVsX2lwdTcu
aXN5cy40MDogYmluZCBvdjEzYjEwIDEtMDAxMCBubGFuZXMgaXMgMiBwb3J0IGlzIDENCj4gDQo+
IFJlc3VsdDoNCj4gT25seSBXRiBjYW1lcmEgc2Vuc29yIGlzIHdvcmtpbmcsIHdoaWNoIGdldHMg
dGhlIGF2ZGQgcmVndWxhdG9yIGZyb20gdGhlIGRpc2NyZXRlIHNvbHV0aW9uLg0KPiBVRiBjYW1l
cmEgZ2V0cyBmYWlsZWQgdG8gYmluZCBkdWUgY29uZmxpY3QgcmVndWxhdG9yIG5hbWVzLg0KDQpJ
ZiB5b3UgaGF2ZSAyIE9WVEkxM0IxIGNhbWVyYXMgdGhlbiB0aGV5IHdpbGwgaGF2ZSAyIGRpZmZl
cmVudCBkZXZpY2UgbmFtZXMsIHlvdSBjYW4gc2VlIHRoZXNlIGJ5IGRvaW5nOg0KDQpscyAvc3lz
L2J1cy9pMmMvZGV2aWNlcw0KDQpUaGV5IHdpbGwgbGlrZWx5IGJlOg0KDQoiaTJjLU9WVEkxM0Ix
OjAwIg0KImkyYy1PVlRJMTNCMTowMSINCg0KYW5kIHNpbmNlIHlvdSdyZSBnZXR0aW5nIGFuIGVy
cm9yIHRoYXQgdGhlIGRpc2NyZXRlIElOVDM0NzIgZGV2aWNlIGhhcyBhbHJlYWR5IHJlZ2lzdGVy
ZWQgdGhlICJhdmRkIiBzdXBwbHkgZm9yIHRoZSAiaTJjLU9WVEkxM0IxOjAwIg0Kc2Vuc29yLCB0
aGF0IG1lYW5zIHRoYXQgdGhlIHRwczY4NDcwIGlzIGxpa2VseSBzdXBwbHlpbmcgdGhlICJpMmMt
T1ZUSTEzQjE6MDEiIHNlbnNvciBhbmQgbm90IHRoZSAiaTJjLU9WVEkxM0IxOjAwIiBzbyB5b3Ug
bmVlZCB0byBoYXZlIHRoZSByZWd1bGF0b3JfY29uc3VtZXJfc3VwcGx5IG1hcHMgcG9pbnQgdG8g
ImkyYy1PVlRJMTNCMTowMSIgLg0KDQpJZiB5b3UgYm9vdCB3aXRoICJpbnRlbF9za2xfaW50MzQ3
Ml9kaXNjcmV0ZS5keW5kYmcgaW50ZWxfc2tsX2ludDM0NzJfY29tbW9uLmR5bmRiZyINCmFkZCB0
byB5b3VyIGtlcm5lbCBjb21tYW5kbGluZSB0aGVuIHRoZSBpbnQzNDcyIGNvZGUgd2lsbCBhZGQg
c29tZSBkZWJ1ZyBtZXNzYWdlcyB0byBkbWVzZyB3aGljaCBsZXQgeW91IGtub3cgd2hpY2ggc2Vu
c29yIGlzIG1hcHBlZCB0byB3aGljaCBJTlQzNDcyOjB4IGRldmljZS4NCg0KUmVnYXJkcywNCg0K
SGFucw0KDQoNCg==

