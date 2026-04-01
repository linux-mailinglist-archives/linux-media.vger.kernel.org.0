Return-Path: <linux-media+bounces-57874-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJChKOkZzWnOaAYAu9opvQ
	(envelope-from <linux-media+bounces-57874-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 15:13:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEBD37B050
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 15:13:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2C15E32224EC
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2026 12:33:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 628B540822B;
	Wed,  1 Apr 2026 12:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gYIJ4h7N"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDC53FF89D;
	Wed,  1 Apr 2026 12:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775046772; cv=fail; b=GWs1+kmCWnz0byQ4P2G5csaiA0KXKcaTKi+7auKrMQB5VW1wOjMgDpTDx3pj5a7M7EnZJ+u93Jquh0xM5yS3nhSFomXbXrqDeRyH8pezw1YEPT1v0S8lhVcB66i9tuGQHv9d/mhGjKTmDkZ8jvjmn64hAVWZsyRf3NuK5MMHvpI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775046772; c=relaxed/simple;
	bh=Ypw1XTOhrQvE3ElU61qC0Wvc076K91fjtiVWvcuGIE8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=amC48BzsGcPfGvFD0d/0xpJtg0UWlBrzmjdlj6q8RtaO9Dix4LGQuEuvDhH+bdlbgWjbbluGKqEJ8uKsa12WHuJwJ/hiqPfiqIBZEbRadqSvzaqHWJRxuHPpaIYxgbAkFHDO9/eBheZ78lMsidunfb9VAjQXGOqVsJ9dzvhH4yY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gYIJ4h7N; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775046770; x=1806582770;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Ypw1XTOhrQvE3ElU61qC0Wvc076K91fjtiVWvcuGIE8=;
  b=gYIJ4h7NEmgdFv86Sv/8jicR/VciSLeXBpn2fbrdSJ4wmTUGJPsorOMI
   YGhvtIzGCwRV/xr70LHSBAO/lgIrqu6t8VkdJAsjyO/qe2CJB4mK+zOJC
   iMTKCG6IwnFd7QAzZV0CrhKKxUvfjd983BBaB1kMvSqx6/WXhjPF7Xb5w
   yCAfXC9FNKEyNCoG40etRAm0+1Z3EVbSWDql7yc42Ra6dMBs7wn6NzstA
   pBuyWP6MtIPZ4Pz9QA6DQQDZAUrTio191/dbSX/s3cONRhb8irk+KCx3G
   O8FluUqiUCxjjj2YEIbXZs9Wp44jxeYZePB6rd6ikt2b52kVJjtNVFptn
   Q==;
X-CSE-ConnectionGUID: jvl4ENKEQ2mVNb1BoCpKYg==
X-CSE-MsgGUID: XQE4c5dpQnye2GSOh/qn/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="79937524"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="79937524"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 05:32:49 -0700
X-CSE-ConnectionGUID: ENJbw5eJSJuSAo7FQfYJog==
X-CSE-MsgGUID: fNB47i0eSAqBDZv/WjBiHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="230735322"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 05:32:49 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 05:32:48 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 1 Apr 2026 05:32:48 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.44)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 05:32:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d/WvdcTSUOKjxuySJvctXAdgaoPszLLGip4cOzDXEmb6MToyfYi0CiaKZ1o5OPOhCxEAyNQwtqknf9kyQe3ZgMXSISP7m4dBJ/WH5PNdv43q1pxdQShQ6lAh8WoezgOeGwRxDBO3Quk17G9eMjM5Qjqdar9DULCoMO0LsKMAqo+QvfwmYZOWG/TKSvgprIz4j123QXWjcX9wM59GhT5OtphyhRty/vTm6P8BAfjgreNwZ+OcGQZEkaWConKbEuZId64rDt2j+smkpC1ZBCLt/k3CyhskrW+h19EtVJiIYIjXvEwsRE3vokkZdQfRl+1x9YhawuMTGaDRZtBaq2eHvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vAbDNLXPMlSCd+GuXU2jALb6EX1bBYGpu+j2FRkfYGo=;
 b=ifoM4fySb5vtmjezV3LfB78zCKEStZ6clBv3xhyGLtVqm4cpM5rLaeHPNENrkb6bf1dWMKLj4Xzagu4rhOYfkZQA+pv+BbvJEGeJugWumQl65hdhuw8i2c+AF3icVzVHzpKBu8Jvvc5pngtyXtiPQmSXndQJjJQHCZnKPYLnbwmCkteM2bIvzKRtFWTJApVT0KPUUzDe9a08/QfdMaz3vB9szDif5mdjrDEWJOW1Jy940yoOSxpDuqn2x1XsKSpi9ePM8nES12fmQ7lMmcB98feD0odyRGuw7FDVweuVSm5q4UnHl3PCIn9otx1w9olel5b7aa62uLHsebj2D+3VKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB8022.namprd11.prod.outlook.com (2603:10b6:806:2fe::14)
 by DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 12:32:43 +0000
Received: from SA3PR11MB8022.namprd11.prod.outlook.com
 ([fe80::5bc2:3dd9:94f0:21ce]) by SA3PR11MB8022.namprd11.prod.outlook.com
 ([fe80::5bc2:3dd9:94f0:21ce%4]) with mapi id 15.20.9769.016; Wed, 1 Apr 2026
 12:32:43 +0000
From: "T, Arun" <arun.t@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: "johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>, "Kao,
 Arec" <arec.kao@intel.com>, "ilpo.jarvinen@linux.intel.com"
	<ilpo.jarvinen@linux.intel.com>, "dan.scally@ideasonboard.com"
	<dan.scally@ideasonboard.com>, "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "Djait, Mehdi" <mehdi.djait@intel.com>
Subject: RE: [PATCH v6 1/2] platform/x86: int3472: Add TPS68470 board data for
 Intel nvl
Thread-Topic: [PATCH v6 1/2] platform/x86: int3472: Add TPS68470 board data
 for Intel nvl
Thread-Index: AQHcvhc7PV1kkAULr0iXIPSOZa8WobXIhj8AgAE+1jCAAGSBIA==
Date: Wed, 1 Apr 2026 12:32:42 +0000
Message-ID: <SA3PR11MB802299FCFE26BE2FB8D4C2359D50A@SA3PR11MB8022.namprd11.prod.outlook.com>
References: <20260327181959.3528753-1-arun.t@intel.com>
 <20260327181959.3528753-2-arun.t@intel.com>
 <acuvZPg6saIw53lv@kekkonen.localdomain>
 <PH8PR11MB8016901A604B7463AEC482E59D50A@PH8PR11MB8016.namprd11.prod.outlook.com>
In-Reply-To: <PH8PR11MB8016901A604B7463AEC482E59D50A@PH8PR11MB8016.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB8022:EE_|DM4PR11MB7760:EE_
x-ms-office365-filtering-correlation-id: e8b9292b-456b-407a-6c4a-08de8feac556
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|10070799003|366016|1800799024|38070700021|13003099007|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info: zqkAA6sW0vNMKukFvISPY/YFLbDuXUNP6DpL0NsmYTqPpWYJBFyASGyoG+2FPHI1uBu/vVLCyk+SwtDUKMB+O4b1IPhiV8qbluLsDB70Dzrrdmg2p3t6DWkS6lAiRAoFuT3HbTY9tzqukngKCT9fOay2t96wddGmBA8kJkzYEYB8o9tWjDBo6PPBshb9TiobmsOjax9H+1QpoOeCboPg0k59LlfKvE7DNoK+vWVpbWwTmX9bjjEIiG4D0G/La5eMXm1K6hP5GWZfXGztvQHm/eLaEz7Q92iZZA7UJUUDb4q0bXcvnNTktP+ADSRLHyZ+K4VCtHvxe14uBBVwPEG2H9tn299jijZb+bSKQX+E8L8cQbx8MjHbr6vRieEih8nyRUWL2nfDXvYaRJ/4lVDpcAUlt8/NtPgBk/tPIbDeEV17gqN1QQCoXFH2n6NXDuZ+8hkUDZWdslhDqBg7O8kq2JqUDX4ynsL/hWk92Veo1wu9FIeW27nDWtGeU0TuSd8UUL0zSM2juS8Euk5VDVAmzuvFFnOgCFre05EJbwHPOJWssPm4a3TmZnZEH29kQa3ekZ3uQ0pCdfxxQuaIbGNqWmADfRkd9+BqtWX14MjWMfzCC1d07sSx5t5oMX5b8uO0t8HcLEBxybbQ9L60PK70FxiZS9ueYaWv3L7XfJl7HVFk4yMu+V/3aRG0ltMFj0RmomWhP32VW38dL1553aI6oHcs7E6neDgtsjRAqsqjCDyE3G2oj1dyGg8GnAq5WlK49QlBI5Uo6XMlrbCM29AisvMJrwni2yuIeURXJcb7sQU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR11MB8022.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(1800799024)(38070700021)(13003099007)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dpn/kPP9Wob8rnMg7bOcdgiadSOlXFtpOAEIN/zaffEP6GqGTxitpTWzWe6j?=
 =?us-ascii?Q?DvPJeYZlMmWQuS9EhJchTxcYRhFakAXrN3eE/9I9KX/8pw+e/6NMLrwP7660?=
 =?us-ascii?Q?ua6MTYtME1nm+2XM7Xzg3ZNnfze36ZiTjohdNUs1xfO5VzBL7v1aFXurAU2j?=
 =?us-ascii?Q?mx3ZeWPpMX1p9aWIXNO1Ff2IqbbQbT/f8Gx+j1K7gYLMh2HJ4uMFvB3woLbC?=
 =?us-ascii?Q?ur6bKG44UPhyN/1RUw/49ZD8G297Prq6WFaXMNESVxCwsiyPoU1VE22Bx/1M?=
 =?us-ascii?Q?Jg9THBQPzNRDPFzZ2zBziFy4kpnLCA3kF0TDZBtKFBaniRT/cAvG9nIe9Mtq?=
 =?us-ascii?Q?b8XIhlHOj0FrxB6SCRdYqQS7Ju2qFD1qYNQWga2/GoCrkg0f45nbGM4EZias?=
 =?us-ascii?Q?r2Pgn1l2ADq0NLCG0x/P6l4S7zje/ygvnrsU0xqjLbcql/HhRE+RSjJSu2B0?=
 =?us-ascii?Q?QM6zcLQBIohdZQQGZg5CTxUzIVl/Ciw0a3AxXWfZTeN89FeYUMCz+RfFAbV/?=
 =?us-ascii?Q?w/oQEz6RXfl5lwXwzJIhvvtbqAiJmmPplh2E7lMPlovZtGIaoj52dBE4aLtY?=
 =?us-ascii?Q?4y3eIzlgi7sy9LvdNqOl59or6cz98Fi1cgFfrCcuo2+/7mNC7x0Z1roQQBGO?=
 =?us-ascii?Q?gdqXSjZSmq4wxkU0YbW3xb25gB2U63UlPY8DFAB3G8WrfVm9esu41egLTm7k?=
 =?us-ascii?Q?RPKoNTwY/Ea1cbYiSthjf7T78tnoX0YDznS+hr2B1qPy6moMXKeChV9j8Qte?=
 =?us-ascii?Q?4SDDmapOXXmIyh+5mevC6UoyXFyT0wsOkEXTYM35rsnjxW7DLmYe/LTk59RL?=
 =?us-ascii?Q?j73E0LiWDoQoaNo1fwRVbtq/y838S5DlVZnNwol45JsNZL/2/xbyuqg3U8ki?=
 =?us-ascii?Q?j/xpQqYIDtZNa/zf7i3IxgWfRB4gEMy1Ud+Wid+gc682PyMeQGONDiHHhjbu?=
 =?us-ascii?Q?YD3niXh6Scn+zRkqtxt6bTpSkRrzTbLau8IDD+vIVm5OX2bo8NPiGqBJTD7U?=
 =?us-ascii?Q?OOIihxRJVtdzxKxNHPJ1UewDh2K+LE+KADIVMA/hR7K5brd9PvmWmes0EWaW?=
 =?us-ascii?Q?GvsfOnJX8mCj4r89840O7gaQgKgvUyylStERpjT6YcFVakosQJ4IVIn1xbo1?=
 =?us-ascii?Q?fZHIV72VI8jesRbI++72oibONUEA5MGGoRDLXLh1Ne12hKjxpmAZuOtDZqq/?=
 =?us-ascii?Q?GvJYM7SlhMMOIHek+S+iF0PesIZ35/4xBfH8jm1FLMlBt6U+mTPfyqHMKdjh?=
 =?us-ascii?Q?JwqrlqWAC+rrEm9YZLKmGjxBCJ6p03xx2/ttvkqn2F3TqXHchCoWOwm7kfVn?=
 =?us-ascii?Q?fmMfqhaJpRUTfY7T/YJDlCE11nB4Qprn3KJil9vD+wa4v7AGAJOnB7neQqT+?=
 =?us-ascii?Q?IKJgLHTc8KGf6mLmB64EnnErQmS+jQhf9E+4PojvkZ6kuIWqtXtFyNVE8oLQ?=
 =?us-ascii?Q?D67Kg/5MAmaXgnyizZswk3L6npC2BzXpIgzYjalM+gWh7mQ9eO1iRWaqYApB?=
 =?us-ascii?Q?NuPhXNSFnnSqZiYJ3p+KXCmyx+0h+Tv0j6Gubq1ugQU4t09Rpr60Snc6hsx+?=
 =?us-ascii?Q?oBiUDsvey6faL73UmEVbXHnpP8O7BtUnHCWqSIPPFsnJdSscWos3AnpVAROk?=
 =?us-ascii?Q?NT9whhsql69gT28LTZUC3D4jjtpsitGJYlQzTXZXcWDhpN9xf4nopZ7mPvN+?=
 =?us-ascii?Q?KYsklnfxxhQ0eYSO7rlE48xb9NakAHRJCLTxo6rCUvzCpNaEP5ohA3lvV2R9?=
 =?us-ascii?Q?ftMqbIXNmO2R/bTKoFsuIwi32VFaz0k8AB2jOp7cK5SSkRQFmkoZ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: qwfSsZKZLDBhXbaqYW87wnoI+BlL8HEEogab0L7osJ28yL1mIHnz4HL2NX7uWxHcdL0UiaDcP24y1ZJP8XAB8NlcU7Qke5DyPTr0p24wyIMGX+76QX2Lc1mRp5UKgtlOIbHk7QDmUrFbibUjWBWvageeJ30Gs4nj40LGxW1tsQl8Yz6G9ur4pMx9M6EISgHP+hmkGROTO1tsZQLKbDZrvMSgNZEqS+Gj0/JF8SWuxB4H1MwWg9XBe8R9UUTVRLw7Ut58MUp4iqmH24DNfiFFEav6yov3X0T1NoSRECYcP2r56lxvvcB7mNwUEl2Qlt/tYLNBp0SAiuW17Udo6XnMoA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8022.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8b9292b-456b-407a-6c4a-08de8feac556
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2026 12:32:42.8784
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wLlhANWAvB7QeaXqch8oV1dEeidyA+K2G4PIIxxxERjF6LO2l9X/3y6+7gTcjTE7rdY08dA9BcgBstENrvOpVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7760
X-OriginatorOrg: intel.com
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57874-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,intel.com:dkim,intel.com:email,ideasonboard.com:email,assigned.so:url];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arun.t@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: EDEBD37B050
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sakari,

Thank you for the review.

The VCM regulator is used by the DW9714 autofocus driver on the
i2c-OVTI13B1:01-VCM device. I added a consumer supply named "vcc" to
match the supply requested by the dw9714 driver through
devm_regulator_get(..., "vcc").

I2c devices are mapped properly :

lrwxrwxrwx 1 root root 0 Apr  1 09:04 i2c-OVTI13B1:01-VCM -> ../../../devic=
es/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-0/i2c-OVTI13B1:01-VCM


AUX1 and AUX2 regulators have no consumer assigned.so  I  removed them from=
 the board data.=20

I ran scripts/checkpatch.pl rebase on Antti's int3472 branch=20
https://git.linuxtv.org/sailus/media_tree.git/log/?h=3Dint3472

I have submitted all those changes in V7 Patch series, please review it.
-
Regards,
Arun T

-----Original Message-----
From: T, Arun=20
Sent: 01 April 2026 12:14 PM
To: 'Sakari Ailus' <sakari.ailus@linux.intel.com>
Cc: johannes.goede@oss.qualcomm.com; Kao, Arec <arec.kao@intel.com>; ilpo.j=
arvinen@linux.intel.com; dan.scally@ideasonboard.com; platform-driver-x86@v=
ger.kernel.org; linux-media@vger.kernel.org; linux-kernel@vger.kernel.org; =
Djait, Mehdi <mehdi.djait@intel.com>
Subject: RE: [PATCH v6 1/2] platform/x86: int3472: Add TPS68470 board data =
for Intel nvl

HI Sakari,=20

We are seeing below errors when launching the camera with auto focus enable=
d for DW9714.

The regulators VIO, AUX1, and AUX2 are not required incase if  DW9714 is di=
sabled in the BIOS settings or kernel configuration.=20

I believe we should not remove the unused regulator, as it is required when=
 using autofocus for the sensor.

Please let me know your opinion on this.

Camera pipeline error:

[04-01 05:07:41.452] CamHAL[ERR] V4l2_device_cc: SetControl: Device node /d=
ev/v4l-subdev7 SetControl(int, int) error: Input/output error
[04-01 05:07:41.513] CamHAL[ERR] V4l2_device_cc: SetControl: Device node /d=
ev/v4l-subdev7 SetControl(int, int) error: Input/output error
[04-01 05:07:41.546] CamHAL[ERR] V4l2_device_cc: SetControl: Device node /d=
ev/v4l-subdev7 SetControl(int, int) error: Input/output error
[04-01 05:07:41.571] CamHAL[ERR] V4l2_device_cc: SetControl: Device node /d=
ev/v4l-subdev7 SetControl(int, int) error: Input/output error
[04-01 05:07:41.604] CamHAL[ERR] V4l2_device_cc: SetControl: Device node /d=
ev/v4l-subdev7 SetControl(int, int) error: Input/output error
[04-01 05:07:41.637] CamHAL[ERR] V4l2_device_cc: SetControl: Device node /d=
ev/v4l-subdev7 SetControl(int, int) error: Input/output error
[04-01 05:07:41.671] CamHAL[ERR] V4l2_device_cc: SetControl: Device node /d=
ev/v4l-subdev7 SetControl(int, int) error: Input/output error
[04-01 05:07:41.704] CamHAL[ERR] V4l2_device_cc: SetControl: Device node /d=
ev/v4l-subdev7 SetControl(int, int) error: Input/output error
[04-01 05:07:41.738] CamHAL[ERR] V4l2_device_cc: SetControl: Device node /d=
ev/v4l-subdev7 SetControl(int, int) error: Input/output error


Kernel Error:
[   70.953426] dw9714 i2c-OVTI13B1:01-VCM: I2C write fail
[   70.958675] dw9714 i2c-OVTI13B1:01-VCM: dw9714_vcm_resume I2C failure: -=
5
[   70.967467] dw9714 i2c-OVTI13B1:01-VCM: I2C write fail
[   97.330226] dw9714 i2c-OVTI13B1:01-VCM: I2C write fail
[   97.335456] dw9714 i2c-OVTI13B1:01-VCM: dw9714_vcm_resume I2C failure: -=
5
[   97.344461] dw9714 i2c-OVTI13B1:01-VCM: I2C write fail

-
Regards,
Arun T
-----Original Message-----
From: Sakari Ailus <sakari.ailus@linux.intel.com>
Sent: 31 March 2026 04:56 PM
To: T, Arun <arun.t@intel.com>
Cc: johannes.goede@oss.qualcomm.com; Kao, Arec <arec.kao@intel.com>; ilpo.j=
arvinen@linux.intel.com; dan.scally@ideasonboard.com; platform-driver-x86@v=
ger.kernel.org; linux-media@vger.kernel.org; linux-kernel@vger.kernel.org; =
Djait, Mehdi <mehdi.djait@intel.com>
Subject: Re: [PATCH v6 1/2] platform/x86: int3472: Add TPS68470 board data =
for Intel nvl

Hi Arun,

On Fri, Mar 27, 2026 at 11:49:57PM +0530, Arun T wrote:
> The Intel NVL platform uses IPU8 is powered by a TPS68470=20
> PMIC,requiring board data to configure the GPIOs and regulators for prope=
r camera sensor operation.

Please run scripts/checkpatch.pl on this.

Could you rebase these on Antti's patches adding support for an MSI laptop?
They're here
<URL:https://git.linuxtv.org/sailus/media_tree.git/log/?h=3Dint3472>.

>=20
> Signed-off-by: Arun T <arun.t@intel.com>
> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
>  .../x86/intel/int3472/tps68470_board_data.c   | 121 ++++++++++++++++++
>  1 file changed, 121 insertions(+)
>=20
> diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> index 71357a036292..f0309fd1e515 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> +++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> @@ -143,6 +143,20 @@ static struct regulator_consumer_supply int3479_aux2=
_consumer_supplies[] =3D {
>  	REGULATOR_SUPPLY("dovdd", "i2c-INT3479:00"),  };
> =20
> +/* Settings for Intel NVL platform */
> +
> +static struct regulator_consumer_supply ovti13b1_core_consumer_supplies[=
] =3D {
> +	REGULATOR_SUPPLY("dvdd", "i2c-OVTI13B1:01"), };
> +
> +static struct regulator_consumer_supply ovti13b1_ana_consumer_supplies[]=
 =3D {
> +	REGULATOR_SUPPLY("avdd", "i2c-OVTI13B1:01"), };
> +
> +static struct regulator_consumer_supply ovti13b1_vsio_consumer_supplies[=
] =3D {
> +	REGULATOR_SUPPLY("dovdd", "i2c-OVTI13B1:01"), };
> +
>  static const struct regulator_init_data dell_7212_tps68470_core_reg_init=
_data =3D {
>  	.constraints =3D {
>  		.min_uV =3D 1200000,
> @@ -220,6 +234,77 @@ static const struct regulator_init_data dell_7212_tp=
s68470_aux2_reg_init_data =3D
>  	.consumer_supplies =3D int3479_aux2_consumer_supplies,  };
> =20
> +static const struct regulator_init_data intel_nvl_tps68470_core_reg_init=
_data =3D {
> +	.constraints =3D {
> +		.min_uV =3D 1200000,
> +		.max_uV =3D 1200000,
> +		.apply_uV =3D true,
> +		.valid_ops_mask =3D REGULATOR_CHANGE_STATUS,
> +	},
> +	.num_consumer_supplies =3D ARRAY_SIZE(ovti13b1_core_consumer_supplies),
> +	.consumer_supplies =3D ovti13b1_core_consumer_supplies, };
> +
> +static const struct regulator_init_data intel_nvl_tps68470_ana_reg_init_=
data =3D {
> +	.constraints =3D {
> +		.min_uV =3D 2815200,
> +		.max_uV =3D 2815200,
> +		.apply_uV =3D true,
> +		.valid_ops_mask =3D REGULATOR_CHANGE_STATUS,
> +	},
> +	.num_consumer_supplies =3D ARRAY_SIZE(ovti13b1_ana_consumer_supplies),
> +	.consumer_supplies =3D ovti13b1_ana_consumer_supplies, };
> +
> +static const struct regulator_init_data intel_nvl_tps68470_vcm_reg_init_=
data =3D {
> +	.constraints =3D {
> +		.min_uV =3D 2815200,
> +		.max_uV =3D 2815200,
> +		.apply_uV =3D true,
> +		.valid_ops_mask =3D REGULATOR_CHANGE_STATUS,
> +	},
> +
> +};
> +
> +/* Ensure the always-on VIO regulator has the same voltage as VSIO */=20
> +static const struct regulator_init_data intel_nvl_tps68470_vio_reg_init_=
data =3D {
> +	.constraints =3D {
> +		.min_uV =3D 1800600,
> +		.max_uV =3D 1800600,
> +		.apply_uV =3D true,
> +		.always_on =3D true,
> +	},
> +};
> +
> +static const struct regulator_init_data intel_nvl_tps68470_vsio_reg_init=
_data =3D {
> +	.constraints =3D {
> +		.min_uV =3D 1800600,
> +		.max_uV =3D 1800600,
> +		.apply_uV =3D true,
> +		.valid_ops_mask =3D REGULATOR_CHANGE_STATUS,
> +	},
> +	.num_consumer_supplies =3D ARRAY_SIZE(ovti13b1_vsio_consumer_supplies),
> +	.consumer_supplies =3D ovti13b1_vsio_consumer_supplies, };
> +
> +static const struct regulator_init_data intel_nvl_tps68470_aux1_reg_init=
_data =3D {
> +	.constraints =3D {
> +		.min_uV =3D 2815200,
> +		.max_uV =3D 2815200,
> +		.apply_uV =3D 1,
> +		.valid_ops_mask =3D REGULATOR_CHANGE_STATUS,
> +	},
> +};
> +
> +static const struct regulator_init_data intel_nvl_tps68470_aux2_reg_init=
_data =3D {
> +	.constraints =3D {
> +		.min_uV =3D 1800600,
> +		.max_uV =3D 1800600,
> +		.apply_uV =3D 1,
> +		.valid_ops_mask =3D REGULATOR_CHANGE_STATUS,
> +	},
> +};
> +
>  static const struct tps68470_regulator_platform_data dell_7212_tps68470_=
pdata =3D {
>  	.reg_init_data =3D {
>  		[TPS68470_CORE] =3D &dell_7212_tps68470_core_reg_init_data,
> @@ -232,6 +317,18 @@ static const struct tps68470_regulator_platform_data=
 dell_7212_tps68470_pdata =3D
>  	},
>  };
> =20
> +static const struct tps68470_regulator_platform_data intel_nvl_tps68470_=
pdata =3D {
> +	.reg_init_data =3D {
> +		[TPS68470_CORE] =3D &intel_nvl_tps68470_core_reg_init_data,
> +		[TPS68470_ANA]  =3D &intel_nvl_tps68470_ana_reg_init_data,
> +		[TPS68470_VCM]  =3D &intel_nvl_tps68470_vcm_reg_init_data,
> +		[TPS68470_VIO] =3D &intel_nvl_tps68470_vio_reg_init_data,
> +		[TPS68470_VSIO] =3D &intel_nvl_tps68470_vsio_reg_init_data,
> +		[TPS68470_AUX1] =3D &intel_nvl_tps68470_aux1_reg_init_data,
> +		[TPS68470_AUX2] =3D &intel_nvl_tps68470_aux2_reg_init_data,

Vcm, aux1 and aux2 appear to be unused. Is there a need to configure them?

> +	},
> +};
> +
>  static struct gpiod_lookup_table surface_go_int347a_gpios =3D {
>  	.dev_id =3D "i2c-INT347A:00",
>  	.table =3D {
> @@ -258,6 +355,14 @@ static struct gpiod_lookup_table dell_7212_int3479_g=
pios =3D {
>  	}
>  };
> =20
> +static struct gpiod_lookup_table intel_nvl_ovti13b1_gpios =3D {
> +	.dev_id =3D "i2c-OVTI13B1:01",
> +	.table =3D {
> +		GPIO_LOOKUP("tps68470-gpio", 9, "reset", GPIO_ACTIVE_LOW),
> +		{ }
> +	}
> +};
> +
>  static const struct int3472_tps68470_board_data surface_go_tps68470_boar=
d_data =3D {
>  	.dev_name =3D "i2c-INT3472:05",
>  	.tps68470_regulator_pdata =3D &surface_go_tps68470_pdata, @@ -287,6
> +392,15 @@ static const struct int3472_tps68470_board_data=20
> +dell_7212_tps68470_board_data =3D
>  	},
>  };
> =20
> +static const struct int3472_tps68470_board_data intel_nvl_tps68470_board=
_data =3D {
> +	.dev_name =3D "i2c-INT3472:04",
> +	.tps68470_regulator_pdata =3D &intel_nvl_tps68470_pdata,
> +	.n_gpiod_lookups =3D 1,
> +	.tps68470_gpio_lookup_tables =3D {
> +		&intel_nvl_ovti13b1_gpios,
> +	},
> +};
> +
>  static const struct dmi_system_id int3472_tps68470_board_data_table[] =
=3D {
>  	{
>  		.matches =3D {
> @@ -316,6 +430,13 @@ static const struct dmi_system_id int3472_tps68470_b=
oard_data_table[] =3D {
>  		},
>  		.driver_data =3D (void *)&dell_7212_tps68470_board_data,
>  	},
> +	{
> +		.matches =3D {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Nova Lake Client Platform"),
> +		},
> +	       .driver_data =3D (void *)&intel_nvl_tps68470_board_data,
> +	},
>  	{ }
>  };
> =20

--
Regards,

Sakari Ailus

