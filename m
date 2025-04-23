Return-Path: <linux-media+bounces-30771-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 065F5A98006
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 09:04:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BCAC03A4AD9
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 07:04:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31E1D1F4171;
	Wed, 23 Apr 2025 07:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N1QYhYTG"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6B628F1
	for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 07:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745391874; cv=fail; b=jT0ujuX6Svcy7we8s7grO3259/VrU/BYNLQ4hNnfe7YS6XDcM8k192Lvl4lfcdAB//DG0NKnF47hVCmjfcShOAG7N9rot3cnAZOeT5g13k3EdvVCddL+6OOOfCJXjWIIYnVQ3g1HGZFnr9UjKyJl3A/hKu6qyyXC/ikKuocFVWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745391874; c=relaxed/simple;
	bh=qNIPWZzkyW17RJmVzTe6wXQnnBaTvC0S8Cbuq4p7Y+A=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ljH9CIcdsSwZqOQk4IryUW0NKwo3KenYcLlk2kwK5Uu+xU8anCK0xoxYUxAcBuWfnQcwnRjeWB1g08TCsa8mcEp914qUhcmuiCQFBLw7V+u4zB48MnmoSyHMpibkW2GzDYL9O4o7MqbFhaPU42RK7jxP+ePZz5ENREh/XzYHKVE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N1QYhYTG; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745391872; x=1776927872;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=qNIPWZzkyW17RJmVzTe6wXQnnBaTvC0S8Cbuq4p7Y+A=;
  b=N1QYhYTGqGDqD3DGoZuQ04RryA+LwQ0PU/xA56BztLHCVjwztkbGK1i1
   silnOCS5OYzqK2gE0SDEdQzhb68SYEp16J4LdvRU0sVz/QE6dodq2Xk/w
   RlWAjJG9mXDHNCecI9bU6x99ESV3q1IOH8yDjl+/OzJIPw/zRSU6i9pJI
   FXjeGFQ8+mQRUbAVc+5XIlFMOBuTPuBzqXtwjIC0FRxO1eQV+T0ulyZCs
   tF/TdJD9dtar8DKIW9GU/99Ws7xZSlrAJVQSKyTWfaXuYeM84YGdHGICz
   ESnZguqzzszl+uqjegXyB/RDGkdx1UVGOC1wBd+AVmJvQedAoktNKgV7t
   Q==;
X-CSE-ConnectionGUID: OsDanlR5SQOceRhoK7Beqw==
X-CSE-MsgGUID: iNEeqE/bQ6q+mOjaj/F/Yg==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="57955011"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="57955011"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 00:04:31 -0700
X-CSE-ConnectionGUID: tqx6GlGESkec18j5XcpK5w==
X-CSE-MsgGUID: osxpozljQlmk3rz5nThUig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="132079685"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 00:04:31 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 23 Apr 2025 00:04:30 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 23 Apr 2025 00:04:30 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 23 Apr 2025 00:04:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nnCbu9A3OHifbhM1/NCeTSRYNCS21yQhEjidcWp17xvRXHsCS4bw7oiVaR9Q/JcSGQMnitRsdf+mEJS8fE1AW6C5IhHPFuo542vdIptFy2Lh5PFNcyhxeN+xvk4mKLRK5z9ZS+7GLdlxcvH/zAtJtSt7+qm+MiiTu1gi3Yo9OyKN7aexrqeILITgYhHQ32i3UnaXfPOUNoYmqn3opRgi+Fh5DHaCXMVlhLqbOp6Bf14rVKmsV6WbXeK/UR+kIGT6etBvvKvxeHA4Ho3A8BPAqSxxwZT/4cykQ30BrHCZ/B+7CXWTp3cPSKtMFRI79IQKfV7AHb9nSfhL6rchq5V3EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jKRn+Apa7oTWSMcY/9YYOtVLhrYkIJreahlFj+2hB7E=;
 b=DvSqN6NJMXkwyg+VMFRgGTvvMgvsNHCrWh8M3KI5XrKOKCR95xXyBOyEyO1vDdbljZS1PSyd5xq20DHaMYwKQy66ayDOKCIug42L02mzZ9Fl/zaGIiKDWRxsaZkMmxtumEX5sgxFm+wOMjlPsx/nbqKTq3qaBh1RvH2hlL+/cJk1cWekBJpCc3ZbsqiOqIzCCWtCq+zYQ4yYDF+Kh38tBz8TXgUAs60H4F6x8ZVqenOev6rouJdsTtcN0A2Sch23d96QMMGmMwFyFgDDjCG/yKrSjfDtRMGUYpoClbtta/h0rcsmQHWtEwJR3NtgAgc7NTUOEwXpKRTxIE0TFImOlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 SJ0PR11MB4847.namprd11.prod.outlook.com (2603:10b6:a03:2d9::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.35; Wed, 23 Apr 2025 07:04:13 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2962:1efd:f912:a5a3]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2962:1efd:f912:a5a3%4]) with mapi id 15.20.8655.033; Wed, 23 Apr 2025
 07:04:13 +0000
From: "Cao, Bingbu" <bingbu.cao@intel.com>
To: "Yao, Hao" <hao.yao@intel.com>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, "Kao, Arec" <arec.kao@intel.com>, "Hans de
 Goede" <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: RE: [PATCH v3 3/3] media: i2c: ov13b10: Support 2 lane mode
Thread-Topic: [PATCH v3 3/3] media: i2c: ov13b10: Support 2 lane mode
Thread-Index: AQHbkvOUmSIutQmyAku5W0W5oEtklLOxFcKg
Date: Wed, 23 Apr 2025 07:04:13 +0000
Message-ID: <DM8PR11MB5653ABB9DA59A313C2BB6C7899BA2@DM8PR11MB5653.namprd11.prod.outlook.com>
References: <20250312020713.687778-1-hao.yao@intel.com>
 <20250312020713.687778-3-hao.yao@intel.com>
In-Reply-To: <20250312020713.687778-3-hao.yao@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5653:EE_|SJ0PR11MB4847:EE_
x-ms-office365-filtering-correlation-id: 4feb4106-b501-4a24-fc3c-08dd82350dbb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?D/FXtqA1a2Z1sffxakxsUL1Q35axIqdTKm4/RW/BvA6bseZ+bawuTt5R4FWX?=
 =?us-ascii?Q?SG6HhCi1CEKiK0yeSOdKMX7TvHzafd+Slo3deoXZtUtezvutDIkCrRvbJyIk?=
 =?us-ascii?Q?IP7lUN9wzs0kfwKqe04+gZFtF3VOsjwaOJgqcjzScpLDDUurA3LhEkDKYfu1?=
 =?us-ascii?Q?2pu0aibp68IyDHIG2lszs1CcDIp+v5TNwpsLr/fHOgjSuMPlHJi+hvxVbE5J?=
 =?us-ascii?Q?7JFCgVhgMO7z52/OucLtfsA7hbKKX/D8UPW5Q/gDkBE6iQoy+HH5qfVGnS+m?=
 =?us-ascii?Q?cEp+se4hbFyg4hhMa+sA3vexTcASkQznbgNBI+UQD9Qz56IDYNOsmYTq8kjP?=
 =?us-ascii?Q?JzdF+61nSC6ij2TfUgBVNjXiKauMcRxlFr2QuKnOgrpcJY6HUAS2LoZQ0d4s?=
 =?us-ascii?Q?SS2etdD9viiQGrs0gYHfzCV1ze+7f5LD0IRwCAoyYkB+BKXhSEbNjTVuf9jS?=
 =?us-ascii?Q?XnZsusfZ+WEvn3XFzJ+El8AQMIwFVNxIIkhd9wRrh2PE4vNGPkV2HK0/4Ds0?=
 =?us-ascii?Q?59ziiV2EFYjMGOhf9QZG7FNX9h+Ii9guqY9UN/yXW1W1VAEkRGnWV9xqMh5Y?=
 =?us-ascii?Q?H1KasG8/PxyNZH/0e/rmt9ufIEYcgY2jdas3QmvImFNpXtbplGeqKdaK3b0H?=
 =?us-ascii?Q?/sz/VPfI+mqlXCBuDIbYa9tI8h/FRc9WctUENeL60TL6n9dedjCgme7/8cSL?=
 =?us-ascii?Q?rHfkqfoq3ldmy4AXxHQsgtHq7DacvgARohl4cjt7gCCccU40dnr5xzp0JllL?=
 =?us-ascii?Q?s22okiuhRGuMDxbj15yurNr8iGiNDeNu/cs+m9MPpgYGuxmkeEujBPKHUUZs?=
 =?us-ascii?Q?wW4dZVRhQC2D8TeGVYgGprxBI8vaI4v/CC8HAWegf9UzOv8sGpijn0Az2/I4?=
 =?us-ascii?Q?OkAx8TQlwK8dbx9g/TnhcFyASzEJSlkPj/crrxn1LOLjrwC/6YCEShrsUH2F?=
 =?us-ascii?Q?5eI8Lg2CAxcW8BccsHa+72HVT1WF71MIC1NQtJtOPHqqSGBkYYaxQAdtrfnd?=
 =?us-ascii?Q?EebIdk3jqWwzL0e0xfLYA0pMCIsFEvn/IrsIjeCausiwkiyBNOFRQuSApT6W?=
 =?us-ascii?Q?baFB1K6shnEnEeV2RYm3a2MvTAvAoXVZgdjwMXKBDbkRy8bz3Gl6HcSGauzb?=
 =?us-ascii?Q?D0gKPT6dqqCab4M96gSdjT0ikdFwapoED1WHMuy5z2iMUY0JUJk5WrXHPZMJ?=
 =?us-ascii?Q?6K1mF+IuyEVxn401HAlHuEsQofRLccDKJiH5IYvMcStovdfyhnlDqE0D19H4?=
 =?us-ascii?Q?KLEkJPETULOHx7Z9r3uLfmvC/vwtBHGsGJRavDjCrr/yD2z4ymYzII+3W0dD?=
 =?us-ascii?Q?0IjrA+gFizyuiSdU72YzsIauF2PdjEvheVe5mKayxPAxHw2NI8UClzJo+Qpp?=
 =?us-ascii?Q?R4lrRk4/YTd8W1ctfaBYxBHWjpcvbX4Bq/2O8dgtpp8rUTZwNOb9lpiFa0/p?=
 =?us-ascii?Q?lP9MPtg5JQxj8nv3UE1P3lyP3iPz9wg7cvKceXMGixTqgwm1T+sbAg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5653.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9tv2W3XUryJok6YaqGaPoFYNvTRmDyNzt45FJlGVscawCp1QeVEZNWHkCMr5?=
 =?us-ascii?Q?NMueFUDi0CU49hMidPg2RcBXMH5EXrkIMp4SgiLu9adtB5f9i7+JgPhQYvrl?=
 =?us-ascii?Q?7u/52Zlh6Ag4oWMcfvU9qNa6mJtbB/IjZ8Pa6d+JcRk/X7GO96bAPjo9zca3?=
 =?us-ascii?Q?7+Y2c4bQSYc5yk+KdbaSyPkpUXHKFjhreOJ9USBlzTsbXgS9EuhC+2cfZGNw?=
 =?us-ascii?Q?cUjTlfFLNrSHlXDIMHmqIA3LJN5BtyvYrvwpRhZRJIgro5/EygletcjWoy84?=
 =?us-ascii?Q?aDnWS9cuTh93cxkPFq82lwJk0nTsAUgBKzZ5OQ80uUFABD1f79MkwjSbQPR/?=
 =?us-ascii?Q?agC2Ri5ADbnX67ZY20/eO9C6X18xk1cl9wReGPFeQvxLDskrnDIPJWK84ulD?=
 =?us-ascii?Q?ccWWyuTyrEA14aSAzFdSLOJy+qqQHL41MVrRwVRcpEsCqCHrwzcGUOEAGolG?=
 =?us-ascii?Q?z0BV624jLCslOxBFR02x0w5Wi++CQHfAgHg5vtribmX8HTOoY8KmHAII3IJ6?=
 =?us-ascii?Q?sSEebptSjBUn2eRHbYUCcoKq16RpnBN9z+o3fJ+dXyXd+1FBBHFFLvEiDt5v?=
 =?us-ascii?Q?TwPvEAktzvyLXEXa29C/OJWlZBoFry8+c+yzVvFH6J9iDBRdtm4/bBCt7zTu?=
 =?us-ascii?Q?OwU+FoM4/UJAO3kKW42qSS6QUUVxJH7JPoPdiEIk1mIcqn8m0mJmh1VFNiqA?=
 =?us-ascii?Q?pFlOqTnmVep/ZvwULzMkegODYPV1A1ajamIi1kzJ/zZl2pIbSymY9IDHiomc?=
 =?us-ascii?Q?4giz8N1fySVtkZel9JXczh+SC51xxEqGqNDy/z2p6pOCyOafZLQ5+qWUejjz?=
 =?us-ascii?Q?JDsVX6LCaqkdVEczF9197JuSBZWntBFq+eOcZYFiNqN35WPwlm+hfVkwxrXO?=
 =?us-ascii?Q?954vDYjH1hH+3psy1MaP+raQp8Bt7QBymsZGLc40RIDpQ41FpryIT2LINWHh?=
 =?us-ascii?Q?eNPOZMmZZMDSXINfazrgAGFQrpdYsTMBrxXZEAlXjw2yUFYa9k71yHPpsjPA?=
 =?us-ascii?Q?+8L49/yYbWImGfhp4gh3VpV21HV1EZkqO6v7ebMUGVg+XVgGIbASgjFpCDi9?=
 =?us-ascii?Q?2B68h0+25VSj1eprn5N4gqYvA746SDaKCCHhvU4+isjWJ7WMG8t640yAujj+?=
 =?us-ascii?Q?+4Xlukh3pAEgkuaOZR/dIkppzQMdyT8UPX5P6a+HSmqfdo8U/TC5Yis+4uAZ?=
 =?us-ascii?Q?PonHmFV+qibCA+e9Qqg+VgDD+JCnInzLtvf6NMViI5MO1fCrTs6zDOvMfYGB?=
 =?us-ascii?Q?lRkIiLCr5HqQVE79CUEsZC8C1Yd+p3ryGlpxRO2UZ4LP4LQhCjYYeacH1c1D?=
 =?us-ascii?Q?XwHeTGo1Ah670tYDODcFSYNZTAppHnst9oHY+V2E6YQIz3Pve0IXUMT7OqGq?=
 =?us-ascii?Q?h+KmyzGAPATkXydZLNBe6GeueD8FdDwJ4UmBbqkb4TT1+GgkAr2oRl+u/Vei?=
 =?us-ascii?Q?drrgMzhUYnMa4oKJaVb4J6ae1DaNshRQdG6z86ruNOYIet4SOrJyoUkTOqN/?=
 =?us-ascii?Q?8scyVYgWbLPdyfLWx1CuTwl269eulV5bnO0aopRrqv2bhAgaYR3BjAHo17PE?=
 =?us-ascii?Q?uv91sgNefkUvY5dCtviX64c/ERuwK+gtiD0njIvS?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4feb4106-b501-4a24-fc3c-08dd82350dbb
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2025 07:04:13.1487
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pgW6znvAvwU8H8ZNuMYd4GFjPrPG6laBLXHmMNmOgNTfLpqSO1xWkk9FzVwbYs6zOy+EX386c8KUOh/38R0w6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4847
X-OriginatorOrg: intel.com

Sakari,

Could you please review these 3 ov13b10 patches?

------------------------------------------------------------------------
BRs, =20
Bingbu Cao

>-----Original Message-----
>From: Yao, Hao <hao.yao@intel.com>
>Sent: Wednesday, March 12, 2025 10:06 AM
>To: Sakari Ailus <sakari.ailus@linux.intel.com>; Kao, Arec
><arec.kao@intel.com>; Hans de Goede <hdegoede@redhat.com>; Mauro
>Carvalho Chehab <mchehab@kernel.org>
>Cc: linux-media@vger.kernel.org; Yao, Hao <hao.yao@intel.com>; Cao,
>Bingbu <bingbu.cao@intel.com>
>Subject: [PATCH v3 3/3] media: i2c: ov13b10: Support 2 lane mode
>
>1. Fix pixel rate calculation to consider different lane number 2.
>Add 2104x1560 60fps 2 data lanes register setting 3. Support 2 lane
>in check_hwcfg 4. Select correct mode considering lane number used
>
>Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
>Signed-off-by: Hao Yao <hao.yao@intel.com>
>---
> drivers/media/i2c/ov13b10.c | 140 ++++++++++++++++++++++++++++++---
>---
> 1 file changed, 118 insertions(+), 22 deletions(-)
>
>diff --git a/drivers/media/i2c/ov13b10.c
>b/drivers/media/i2c/ov13b10.c index 2e83fc23f321..e85c7d33a670
>100644
>--- a/drivers/media/i2c/ov13b10.c
>+++ b/drivers/media/i2c/ov13b10.c
>@@ -514,6 +514,52 @@ static const struct ov13b10_reg
>mode_1364x768_120fps_regs[] =3D {
> 	{0x5001, 0x0d},
> };
>
>+static const struct ov13b10_reg mode_2lanes_2104x1560_60fps_regs[]
>=3D {
>+	{0x3016, 0x32},
>+	{0x3106, 0x29},
>+	{0x0305, 0xaf},
>+	{0x3501, 0x06},
>+	{0x3662, 0x88},
>+	{0x3714, 0x28},
>+	{0x3739, 0x10},
>+	{0x37c2, 0x14},
>+	{0x37d9, 0x06},
>+	{0x37e2, 0x0c},
>+	{0x3800, 0x00},
>+	{0x3801, 0x00},
>+	{0x3802, 0x00},
>+	{0x3803, 0x08},
>+	{0x3804, 0x10},
>+	{0x3805, 0x8f},
>+	{0x3806, 0x0c},
>+	{0x3807, 0x47},
>+	{0x3808, 0x08},
>+	{0x3809, 0x38},
>+	{0x380a, 0x06},
>+	{0x380b, 0x18},
>+	{0x380c, 0x04},
>+	{0x380d, 0x98},
>+	{0x380e, 0x06},
>+	{0x380f, 0x3e},
>+	{0x3810, 0x00},
>+	{0x3811, 0x07},
>+	{0x3812, 0x00},
>+	{0x3813, 0x05},
>+	{0x3814, 0x03},
>+	{0x3816, 0x03},
>+	{0x3820, 0x8b},
>+	{0x3c8c, 0x18},
>+	{0x4008, 0x00},
>+	{0x4009, 0x05},
>+	{0x4050, 0x00},
>+	{0x4051, 0x05},
>+	{0x4501, 0x08},
>+	{0x4505, 0x00},
>+	{0x4837, 0x0e},
>+	{0x5000, 0xfd},
>+	{0x5001, 0x0d},
>+};
>+
> static const char * const ov13b10_test_pattern_menu[] =3D {
> 	"Disabled",
> 	"Vertical Color Bar Type 1",
>@@ -527,15 +573,16 @@ static const char * const
>ov13b10_test_pattern_menu[] =3D {
> #define OV13B10_LINK_FREQ_INDEX_0	0
>
> #define OV13B10_EXT_CLK			19200000
>-#define OV13B10_DATA_LANES		4
>+#define OV13B10_4_DATA_LANES		4
>+#define OV13B10_2_DATA_LANES		2
>
> /*
>- * pixel_rate =3D link_freq * data-rate * nr_of_lanes /
>bits_per_sample
>- * data rate =3D> double data rate; number of lanes =3D> 4; bits per
>pixel =3D> 10
>+ * pixel_rate =3D data_rate * nr_of_lanes / bits_per_pixel
>+ * data_rate =3D> link_freq * 2; number of lanes =3D> 4 or 2; bits per
>+ pixel =3D> 10
>  */
>-static u64 link_freq_to_pixel_rate(u64 f)
>+static u64 link_freq_to_pixel_rate(u64 f, u8 lanes)
> {
>-	f *=3D 2 * OV13B10_DATA_LANES;
>+	f *=3D 2 * lanes;
> 	do_div(f, 10);
>
> 	return f;
>@@ -559,7 +606,8 @@ static const struct ov13b10_link_freq_config  };
>
> /* Mode configs */
>-static const struct ov13b10_mode supported_modes[] =3D {
>+static const struct ov13b10_mode supported_4_lanes_modes[] =3D {
>+	/* 4 data lanes */
> 	{
> 		.width =3D 4208,
> 		.height =3D 3120,
>@@ -634,6 +682,23 @@ static const struct ov13b10_mode
>supported_modes[] =3D {
> 	},
> };
>
>+static const struct ov13b10_mode supported_2_lanes_modes[] =3D {
>+	/* 2 data lanes */
>+	{
>+		.width =3D 2104,
>+		.height =3D 1560,
>+		.vts_def =3D OV13B10_VTS_60FPS,
>+		.vts_min =3D OV13B10_VTS_60FPS,
>+		.link_freq_index =3D OV13B10_LINK_FREQ_INDEX_0,
>+		.ppl =3D 2352,
>+		.reg_list =3D {
>+			.num_of_regs =3D
>+
>	ARRAY_SIZE(mode_2lanes_2104x1560_60fps_regs),
>+			.regs =3D mode_2lanes_2104x1560_60fps_regs,
>+		},
>+	},
>+};
>+
> struct ov13b10 {
> 	struct v4l2_subdev sd;
> 	struct media_pad pad;
>@@ -651,12 +716,20 @@ struct ov13b10 {
> 	struct v4l2_ctrl *hblank;
> 	struct v4l2_ctrl *exposure;
>
>+	/* Supported modes */
>+	const struct ov13b10_mode *supported_modes;
>+
> 	/* Current mode */
> 	const struct ov13b10_mode *cur_mode;
>
> 	/* Mutex for serialized access */
> 	struct mutex mutex;
>
>+	u8 supported_modes_num;
>+
>+	/* Data lanes used */
>+	u8 data_lanes;
>+
> 	/* True if the device has been identified */
> 	bool identified;
> };
>@@ -760,8 +833,8 @@ static int ov13b10_write_reg_list(struct ov13b10
>*ov13b,
> /* Open sub-device */
> static int ov13b10_open(struct v4l2_subdev *sd, struct
>v4l2_subdev_fh *fh)  {
>-	const struct ov13b10_mode *default_mode =3D &supported_modes[0];
> 	struct ov13b10 *ov13b =3D to_ov13b10(sd);
>+	const struct ov13b10_mode *default_mode =3D ov13b-
>>supported_modes;
> 	struct v4l2_mbus_framefmt *try_fmt =3D
>v4l2_subdev_state_get_format(fh->state,
> 									  0);
>
>@@ -980,7 +1053,10 @@ static int ov13b10_enum_frame_size(struct
>v4l2_subdev *sd,
> 				   struct v4l2_subdev_state *sd_state,
> 				   struct v4l2_subdev_frame_size_enum
>*fse)  {
>-	if (fse->index >=3D ARRAY_SIZE(supported_modes))
>+	struct ov13b10 *ov13b =3D to_ov13b10(sd);
>+	const struct ov13b10_mode *supported_modes =3D ov13b-
>>supported_modes;
>+
>+	if (fse->index >=3D ov13b->supported_modes_num)
> 		return -EINVAL;
>
> 	if (fse->code !=3D MEDIA_BUS_FMT_SGRBG10_1X10) @@ -1040,6
>+1116,7 @@ ov13b10_set_pad_format(struct v4l2_subdev *sd,  {
> 	struct ov13b10 *ov13b =3D to_ov13b10(sd);
> 	const struct ov13b10_mode *mode;
>+	const struct ov13b10_mode *supported_modes =3D ov13b-
>>supported_modes;
> 	struct v4l2_mbus_framefmt *framefmt;
> 	s32 vblank_def;
> 	s32 vblank_min;
>@@ -1054,7 +1131,7 @@ ov13b10_set_pad_format(struct v4l2_subdev *sd,
> 		fmt->format.code =3D MEDIA_BUS_FMT_SGRBG10_1X10;
>
> 	mode =3D v4l2_find_nearest_size(supported_modes,
>-				      ARRAY_SIZE(supported_modes),
>+				      ov13b->supported_modes_num,
> 				      width, height,
> 				      fmt->format.width, fmt-
>>format.height);
> 	ov13b10_update_pad_format(mode, fmt);
>@@ -1065,7 +1142,8 @@ ov13b10_set_pad_format(struct v4l2_subdev *sd,
> 		ov13b->cur_mode =3D mode;
> 		__v4l2_ctrl_s_ctrl(ov13b->link_freq, mode-
>>link_freq_index);
> 		link_freq =3D link_freq_menu_items[mode-
>>link_freq_index];
>-		pixel_rate =3D link_freq_to_pixel_rate(link_freq);
>+		pixel_rate =3D link_freq_to_pixel_rate(link_freq,
>+						     ov13b->data_lanes);
> 		__v4l2_ctrl_s_ctrl_int64(ov13b->pixel_rate,
>pixel_rate);
>
> 		/* Update limits and set FPS to default */ @@ -1312,7
>+1390,8 @@ static int ov13b10_init_controls(struct ov13b10 *ov13b)
> 	if (ov13b->link_freq)
> 		ov13b->link_freq->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
>
>-	pixel_rate_max =3D
>link_freq_to_pixel_rate(link_freq_menu_items[0]);
>+	pixel_rate_max =3D
>link_freq_to_pixel_rate(link_freq_menu_items[0],
>+						 ov13b->data_lanes);
> 	pixel_rate_min =3D 0;
> 	/* By default, PIXEL_RATE is read only */
> 	ov13b->pixel_rate =3D v4l2_ctrl_new_std(ctrl_hdlr,
>&ov13b10_ctrl_ops, @@ -1423,7 +1502,7 @@ static int
>ov13b10_get_pm_resources(struct device *dev)
> 	return 0;
> }
>
>-static int ov13b10_check_hwcfg(struct device *dev)
>+static int ov13b10_check_hwcfg(struct device *dev, struct ov13b10
>+*ov13b)
> {
> 	struct v4l2_fwnode_endpoint bus_cfg =3D {
> 		.bus_type =3D V4L2_MBUS_CSI2_DPHY
>@@ -1433,6 +1512,7 @@ static int ov13b10_check_hwcfg(struct device
>*dev)
> 	unsigned int i, j;
> 	int ret;
> 	u32 ext_clk;
>+	u8 dlane;
>
> 	if (!fwnode)
> 		return -ENXIO;
>@@ -1459,13 +1539,32 @@ static int ov13b10_check_hwcfg(struct device
>*dev)
> 	if (ret)
> 		return ret;
>
>-	if (bus_cfg.bus.mipi_csi2.num_data_lanes !=3D
>OV13B10_DATA_LANES) {
>+	dlane =3D bus_cfg.bus.mipi_csi2.num_data_lanes;
>+	switch (dlane) {
>+	case OV13B10_4_DATA_LANES:
>+		ov13b->supported_modes =3D supported_4_lanes_modes;
>+		ov13b->supported_modes_num =3D
>+			ARRAY_SIZE(supported_4_lanes_modes);
>+		break;
>+
>+	case OV13B10_2_DATA_LANES:
>+		ov13b->supported_modes =3D supported_2_lanes_modes;
>+		ov13b->supported_modes_num =3D
>+			ARRAY_SIZE(supported_2_lanes_modes);
>+		break;
>+
>+	default:
> 		dev_err(dev, "number of CSI2 data lanes %d is not
>supported",
>-			bus_cfg.bus.mipi_csi2.num_data_lanes);
>+			dlane);
> 		ret =3D -EINVAL;
> 		goto out_err;
> 	}
>
>+	ov13b->data_lanes =3D dlane;
>+	ov13b->cur_mode =3D ov13b->supported_modes;
>+	dev_dbg(dev, "%u lanes with %u modes selected\n",
>+		ov13b->data_lanes, ov13b->supported_modes_num);
>+
> 	if (!bus_cfg.nr_of_link_frequencies) {
> 		dev_err(dev, "no link frequencies defined");
> 		ret =3D -EINVAL;
>@@ -1499,17 +1598,17 @@ static int ov13b10_probe(struct i2c_client
>*client)
> 	bool full_power;
> 	int ret;
>
>+	ov13b =3D devm_kzalloc(&client->dev, sizeof(*ov13b),
>GFP_KERNEL);
>+	if (!ov13b)
>+		return -ENOMEM;
>+
> 	/* Check HW config */
>-	ret =3D ov13b10_check_hwcfg(&client->dev);
>+	ret =3D ov13b10_check_hwcfg(&client->dev, ov13b);
> 	if (ret) {
> 		dev_err(&client->dev, "failed to check hwcfg: %d",
>ret);
> 		return ret;
> 	}
>
>-	ov13b =3D devm_kzalloc(&client->dev, sizeof(*ov13b),
>GFP_KERNEL);
>-	if (!ov13b)
>-		return -ENOMEM;
>-
> 	/* Initialize subdev */
> 	v4l2_i2c_subdev_init(&ov13b->sd, client, &ov13b10_subdev_ops);
>
>@@ -1533,9 +1632,6 @@ static int ov13b10_probe(struct i2c_client
>*client)
> 		}
> 	}
>
>-	/* Set default mode to max resolution */
>-	ov13b->cur_mode =3D &supported_modes[0];
>-
> 	ret =3D ov13b10_init_controls(ov13b);
> 	if (ret)
> 		goto error_power_off;
>--
>2.43.0


