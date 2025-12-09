Return-Path: <linux-media+bounces-48484-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2805DCB08B7
	for <lists+linux-media@lfdr.de>; Tue, 09 Dec 2025 17:23:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 786F93034A36
	for <lists+linux-media@lfdr.de>; Tue,  9 Dec 2025 16:20:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6253830103F;
	Tue,  9 Dec 2025 16:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R5a3xB5M"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D2825B311;
	Tue,  9 Dec 2025 16:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765297239; cv=fail; b=U+1WVo0C5wD9WssJuPMDwtt+92sINlUTQ7uGXw42xgLgoDh4AlnUf2HMWeK90N/0pBb6DfcIt74ZmdXGi+jOcZwRPGu1BNPEoVr1f7juQQcmiFOdnH8LyS8WcIXhPeb99i51vLXPnNMHILZBrkabufJp42QA473bfcd5LoZLQlY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765297239; c=relaxed/simple;
	bh=/oQptPuWYDCJNO0dEP94DFAOU2MSKjb/MeInUI0IVhY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kbB5GJgReO2TYQZaXgc/V9sbOQAAlqWFyS/sjXJsHnPfbGiN66NsMkuSmSl2JRFcLBBWJ2n7uM85NE1FztnlNs9e3ETW3YHuf1P3ydOusWJi/NdbxwahlHnU5/zpVq4Fu6ExLbeOgn7S+G8YhPGlBUmFwIQswNB/9xwdC4fLDm8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R5a3xB5M; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765297238; x=1796833238;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=/oQptPuWYDCJNO0dEP94DFAOU2MSKjb/MeInUI0IVhY=;
  b=R5a3xB5MQ0z2M+9NnE2dxR7sbPSc+wC5GrjjyHT7QCBli0pbr/i8EHmj
   tW7634tu+WSlYBR4LXMeGK8lkdAuQ9kpMTvET6n6ZhKTqtddr2D1dkYJL
   O24NRzzQ0rocnihGcc9uNbI0UdOk6iZkhQkcRc1QuC82XKCLLx08o4q7d
   QXNEMC1hryI8Q+I44ztOmhmwHHljIDsHz4MytRygUSaC7zetuhq+MtCF+
   E07fW+TFSiSRB15/MRicJOD8hCJ7I0m6eTBs2AbbnV9Dvp2YmjdZExVz+
   SMSUxPfWzdAY5zRr0GIIbRIGTRBrk/5Q+MiDeGTb1NR3dS5EljW+j+4g1
   g==;
X-CSE-ConnectionGUID: kk6VYzotTZi+OycTlnHw1Q==
X-CSE-MsgGUID: qJa/j8jwSC6OrPdCJgr2ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67426878"
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; 
   d="scan'208";a="67426878"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 08:20:09 -0800
X-CSE-ConnectionGUID: VcfbEGfVQvCa2gH3QN0prw==
X-CSE-MsgGUID: goAnoH0HTimW2JnmDSeV3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; 
   d="scan'208";a="200443538"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 08:20:09 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 08:20:08 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 9 Dec 2025 08:20:08 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.51) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 08:20:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AvdTm5zczPIgUrBjbL/13KNkt6+04vD8haH7OjWegKhcfVAC4O/eSq+NSuZfGSCsa/dgfMoq4/sr8vYevuOeA4IHVujCbJqxxPCtMGEf49js7qiaqUMyjJ+PAf7gC4uy2nUxG4dWfNAygRHR7bN2A1FhDeHpipDBHKvnu+fWn8cBZm18W/O9qjRDeTBW3r/FwIKxD13i8UCWAPmuWGZ0ucrDXtuoNgY/vEJ0DK6Y9QvSwf2X9ysxBduqxff4dq741iLGcRoY/Nng5IiXLpUrXVLm720hBiF7w9xH5VM51M72DNIFRyRD+Fzyh9MbHtW8YjP07XuTOqTZgDdc8gQtvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/oQptPuWYDCJNO0dEP94DFAOU2MSKjb/MeInUI0IVhY=;
 b=yi7l43G6BY/cVaISXZB0NrwBG78JVDvCRSf4rddd1ynxzLWiYV+oswOSPyU5EQxkgaaFz3+lllHVDuHtclioEOkl7WPhOoIeitYW85R3x6eTkjFJKkKrkw0BohAEaUWtAgkRr8SCAs7QDvhISj16SqLoHesZjVx/BALkmmHUN2fkXKENhKL2X+ggpJysMhVUiNAz8vV1VkZX8DjnukR7cTcAEZ4hHQORUkicLzrEdLgMGHehd9c711OibpqxLfOJCbcrF6Lv4jSXkQN+R2bzOU5Or2Me2d4dRUKbHwNxf8I95aCMh6YTuBAJLDiUfshHQ6pKt83DICNGZq3naoY7qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by IA4PR11MB9251.namprd11.prod.outlook.com (2603:10b6:208:56f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 16:20:06 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361%7]) with mapi id 15.20.9412.005; Tue, 9 Dec 2025
 16:20:06 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: Daniel Gomez <da.gomez@kernel.org>, Eric Biggers <ebiggers@kernel.org>
CC: Kees Cook <kees@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, "Rusty
 Russell" <rusty@rustcorp.com.au>, Petr Pavlu <petr.pavlu@suse.com>, "Sami
 Tolvanen" <samitolvanen@google.com>, "linux-modules@vger.kernel.org"
	<linux-modules@vger.kernel.org>, Malcolm Priestley <tvboxspy@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
	<hverkuil@kernel.org>, =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?=
	<u.kleine-koenig@pengutronix.de>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-hardening@vger.kernel.org"
	<linux-hardening@vger.kernel.org>
Subject: RE: [PATCH 3/3] module: Add compile-time check for embedded NUL
 characters
Thread-Topic: [PATCH 3/3] module: Add compile-time check for embedded NUL
 characters
Thread-Index: AQHcaIZye2Etctg8UkqhdIaE3Zh1nrUYb7qAgACH5oCAAIUnIA==
Date: Tue, 9 Dec 2025 16:20:06 +0000
Message-ID: <SJ1PR11MB6083C6D97484ED4E4710268EFCA3A@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <20251008033844.work.801-kees@kernel.org>
 <20251008035938.838263-3-kees@kernel.org> <aTc9s210am0YqMV4@agluck-desk3>
 <20251209001139.GA7982@quark>
 <d3dd8fc8-ab46-4cf1-87a9-0324685ba2e0@kernel.org>
In-Reply-To: <d3dd8fc8-ab46-4cf1-87a9-0324685ba2e0@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|IA4PR11MB9251:EE_
x-ms-office365-filtering-correlation-id: 90f719d7-1735-404c-9bbf-08de373ed0be
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?TzJWN0t6andjejgydDFFcUVpQmt1YzFNMU40dDI3TkMyQXgvK2pGMFdRM3Rs?=
 =?utf-8?B?SXBiSkh3MStlUHlsS0lRelJKaUR3ai8rQS82RFNCcU5pWFNKbzk2VjIrb0FS?=
 =?utf-8?B?UGo0Qm9VQkZoakEyajk5cUZHeTQ2SDFnUGRiRzlDb0pZWlVsS1RWWUZSOTdU?=
 =?utf-8?B?aHdwUEFyVjJOK1BaMVg0NzJtQjllZTU5WVBGaG41ZHVFQjVvWWVoOW1PRHZ6?=
 =?utf-8?B?MjJiSGh2SWlSeWo0QzdFUUlFaEsyT1hUWkNqcGFzOHgzaTMrRnFhNVJ4WlZm?=
 =?utf-8?B?Zjk0ZkZRcmRieDJjb05KYmtTdXpBSS96a2oyb2RORWxuR1J0NzBrenJUaE5Y?=
 =?utf-8?B?M05FTDVxNkowQUtqTXdDRGh2SEZTcWlHMkpkcWNrQVFBZ3RhR0hFcGF3V0Zz?=
 =?utf-8?B?aW5VTUxJZ2N4V0kyUUZ2OVN1OHprVlB4YnFhbWRsUzI0aDRINnNhOWwrdW1v?=
 =?utf-8?B?YmNOQ0FobjNpK0txdkRKVTc1WUt1OVhFWnJlRTgyZ0F2NDFpem8rOEoxMUdh?=
 =?utf-8?B?ajBiOXlCL3o1VHhUbmRhTnN3bnRzZlNZWlM4aGdYVVlLYjZuUHFqVVo0KzFt?=
 =?utf-8?B?NnRBZzFobDZ4RVVzdC9qTWcwV1I2K01UZmM5RGdCTWlSdHFSb1F5dzErbHJ6?=
 =?utf-8?B?NXRHRFgxUlA3R1NDUW5QdzJqM1RUdWQ0Yi9MV3p1SS96ZE81V1ByVEJVOUsy?=
 =?utf-8?B?Wk1NUFlLbUJRQzBxQW1IczNVZEhTaXBVdUM3SnhDSEFKQlBxTEM2VlFveWxU?=
 =?utf-8?B?TUx6TGlWUkRtdi83TldwU1NQU0krL2JWb0RHU3J6WHhNSVhydytCYWJHallo?=
 =?utf-8?B?N09CLzMvRzRLRW1HR2VKWEYxaE1pMnZKMUl6U2lWdVRNREdSOU1FeWhWeGpD?=
 =?utf-8?B?bzRyQ3FJU2t3YzFnTE55RUVrZmVDc2hqWmtMQ1hkTklDZzlOZFpjaGc1Sk9K?=
 =?utf-8?B?Z2duUG1DMzhPbmJkaWRaMlgyYkFmM1VkR1N0cHprM3pBM05KR08rRTZqNVVz?=
 =?utf-8?B?SjRvb2dUMVkzcHNDdnhldGZ3a3kvandZWW9ZWnd3Q3ZrQVpBVHFqZ2JEbFpL?=
 =?utf-8?B?YVJ2Mm1VOVpUVTZUZjVxeDVBeGZOM1pGRExSYzdrKzJrN213QlQvUEVpcWNY?=
 =?utf-8?B?dDlBaUZzTHN6Z2x4cnB6cU0veHJiVTAxcDE2M0JmNmlhYjB1WmxaWkV3dUFa?=
 =?utf-8?B?NmEvVUVwN2Qxd1ptZWNwdzZ1TlY1UW5yS1VwSFlvc1hxQlp5ZmJHOTFGbWRw?=
 =?utf-8?B?WExCSy9NNGVpT1FlRkZHNVgydHlLQkk2R3h1R2JuaTJXSDEyTmVVM1RvYmNv?=
 =?utf-8?B?T2pPTFBVNEhJRDVneUIzUkZiVkl6UkZuMENMWmV3ZDQwcWJXZE84MTk1UU9V?=
 =?utf-8?B?MGdoTUZ5NmZMMmVPT3Zyb0k2OFVDQmhkYzcwdjhrRmlQNkZEL3kyejduU1Bn?=
 =?utf-8?B?ZEdzZkUrUFdqMk9FOVluY05NbjhLcDI4OHM3Z2J1Qmt5SEI5TitvbXFZTWxn?=
 =?utf-8?B?WElZeUxIcWhZd1BOM0prMElPTUdob1dlZkdmWHdHR1lobXZNazRHamx1MXJp?=
 =?utf-8?B?SGY0ZlA5VUhCWXB2WWNtd3VsMi8rQXNRSmk3ZXRmZGJUS0NMMkwrT25UZFVs?=
 =?utf-8?B?YzRMZUxtM1g5RDRIY0FuZThrVXI0QzNVUTNNYmFubkxOV3Y1cVd1U3dldS8r?=
 =?utf-8?B?M1RSYS9RMHZZR0F2TllLQmR2ek9iWkpFcXczb2dLRnhmbFZqN2lEeUhVd1pO?=
 =?utf-8?B?VDREMjVmRGVlcjU3NWVDL3A4Skk0cXlScjlZVmdJbFU0VXU0N2J3YnAzbkNK?=
 =?utf-8?B?UUdqdDRCZXNoWXNZTStULytLRmFxekNlYUp5NFpkYkRvRFJhZHp4WmhTUEpC?=
 =?utf-8?B?dDdLb1NieHh2NzZrbG1keWNhTkwrYUoyTlU0NWhSWGdrdHhXUi9UWW1WZmcv?=
 =?utf-8?B?V0NKbGhNUnlqbVdIVkNwVnNzTGRJbzMxanVJNFVhUVoxeHkyWlpobmFheWsz?=
 =?utf-8?B?bEtleXYzWjRRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U1h4SnBMK2Vpc01GaU5oT01UamFEckZSdStHM1FBS0F4Nzlxekc3T20vbVJ5?=
 =?utf-8?B?cEptOG1GQU1WeHhnV0c2VkxYQlZnTVF5TXd3S0NWOW90R3doRitLa05kdzFQ?=
 =?utf-8?B?dlhKUzZwSTVVUHpwTndwUVQ0QldHQjBzYWMzZm1HWnlqclNHbm1tbThicWhk?=
 =?utf-8?B?TzNhb1NGMXVSRGhxZURMcjNlLzhneGk0bDBOOS96ZEppQURiRDRQYTM2RG1P?=
 =?utf-8?B?V3paSzVHTnpna1p6OCtoVzF6MEI0cEdHbjJVdUFJa0pwV3l4NkJRc1V3bDVI?=
 =?utf-8?B?YytTMEtmSFc4bnZLQmFrTzVTQWxqQW5QZW9MaWJEK3RpV2kyMklIN0J3TlFw?=
 =?utf-8?B?eVRrOWtHU0VGQWE0WnNjL2lVQlFDWlJDUEh2N1FVVHVYUEo4aUlaRFRjUzhm?=
 =?utf-8?B?cUJtdTUzZ0VQMmVLd0luU1ZPaU5pU1hrWnVKNXA1VzdHZzFFazdHcW8vMGdw?=
 =?utf-8?B?bFZZZ1N5bzkrUmNka2M2d3Y2Z2tJQVpuWFkyRktiNGRCSVk4L2I5b3hrdTdR?=
 =?utf-8?B?L3VWNE43Z0FwWjJGL2VnYjZhd3g0WTMvbjROdmNxR0htcFVtVnJrczJyNkx0?=
 =?utf-8?B?R2NzdVg2L25saUhkeGpSbVVjTkNrbEhJMUdhbEpUdkJKd1J5WkZYK3EvN2VJ?=
 =?utf-8?B?T29mUG12empMb0wwNTlSZlk4OTNNTVdtWUY1a29JaXRCa0lLaVFjdVcxYS92?=
 =?utf-8?B?NEFnRmo3UlJFSEcra3FzZlRBckc2R2htSkR5NWx1N044ZWRFb0xKWTRXeTNo?=
 =?utf-8?B?OHNkZ2YvMUhPeGljSmJERXp4V015NjZjU0Q1T2VqbU5xVTFSNE1hRWpBK0Rw?=
 =?utf-8?B?NFg1d2IvN3RncG1MU2Vlamd6OEpnWGlLeGYzdmdJUDBiZWJmeDVUcURYNVdO?=
 =?utf-8?B?NFZlVmhTaEhUbWF0c0d1S2FKUEhWOWZsbGs5TTdsRnVqOUtScnByZVJIYVFi?=
 =?utf-8?B?elc4NFNpY0VXV1o4M3JVTVlCOUl3ekVZZnk5R2lxcjJUOTR5eWtWdXU1YTM1?=
 =?utf-8?B?cGpCOHFVbU1zY1NUYjdQLzZQUFBxaXRtOTgyTTE0c0RCbjZpTnpNRjcxQ3FN?=
 =?utf-8?B?cTBDSEdVM3pOSW1WMnZYQkxjNUJDVG81T1Ayam1KMk5rcmNoK2RHdFkvWFpu?=
 =?utf-8?B?K0FwNHpHUGxKeWdFSHY0ZlRDZ0phL3FvakNHYWdxQUFacUY3aUdQTXI2VkZT?=
 =?utf-8?B?RWlMdGlWSEJVZDlMaTlPV05QN1gzNGh3VlZqWkZ6bjQzRXNySGFuVm9lN2Qx?=
 =?utf-8?B?OVdEWmpQRzhDYnA4dllIcVJSRHlNSGdraFlWSDlBZUlpYUZmcVJNZ3hyZ0F1?=
 =?utf-8?B?a0h0bnVMMm9wbURGR0JFdXlJTlY0SThjRDRmM2hzc0ZubzYwbTM5TnhQTXJy?=
 =?utf-8?B?UnBrOVYvN0p6cnJVQmphZmk4bTN0bWNBanZSYjNFNXcvaDlpK2MzQThSY2dZ?=
 =?utf-8?B?c2kzeXFNNmwrYUtpTzQrWjJQTS9MMW5TYk1wSGM2aTc4QWE4YlNMYzhDMVFr?=
 =?utf-8?B?a2x3ZjhkdXVCZU1pdG5JU1pWMFRVSmxEekpQdjFXbG1lZWRTRy9wMGxiME4v?=
 =?utf-8?B?cjJsdmJYUFFrZHFCbjMraWFmSDhLL0lpYTFFTzlHSWc1dlFNQVlCc0k4Z1dK?=
 =?utf-8?B?cTBVY2VSRnlmZXpONU9XWERkOENhRWpaa09mcURQMU1FcXR1TzViaGZQT0NL?=
 =?utf-8?B?Y3pWeS8rSEJmMmlqOUNvN1M5M2xiMXFkcEpLelBtMEFIcXAvaGpXV25qMlgw?=
 =?utf-8?B?S1ZKYVVidldGNmdESTdWeTFVK3ZmcWNSWEgrSy8xdkFmZnpJaVdiK1lZZEsv?=
 =?utf-8?B?T0pmMkZFWTJVWmFHL2luN1cxcm5JNS82UTR2enhtcndVQU8rWHZGYXFjRWdU?=
 =?utf-8?B?Uk9abHppMTBlVDVhZmI0ZytscjVENDhkZmZYUzIzRjlOMFprVU9qd1J1U1pl?=
 =?utf-8?B?YmE5aVR6V0p3eDNZcXljcSs1V3ZvZys3SlBHWE5VZ1JHOTZKMUVlcG5FK2h4?=
 =?utf-8?B?S2VCZkwzakFBaitaY1Z2ZEtNZVZUM3RJT01YNHRjajA0RU1PeUdTZmdOc3VW?=
 =?utf-8?B?YmtyWTgxcUMyWDFKSnRFd2dieUR2VGJZWVluSkx0RXU2ajhHemtwa2hmNU9j?=
 =?utf-8?Q?AR8G12p72triiCAzWkI/eiGB7?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90f719d7-1735-404c-9bbf-08de373ed0be
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2025 16:20:06.2666
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wTY0/RLwk/qRUrNap9wr1APt+BpgTNWuk/Y9SOuOUDDIvE5VhJd7x/Gl24Uq/GvrEEDak4b4GMqvGy4r54srRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9251
X-OriginatorOrg: intel.com

Pj4gTGlrZXdpc2UsIEkganVzdCBnb3QgdGhlIGZvbGxvd2luZyBrZXJuZWwgdGVzdCByb2JvdCBy
ZXBvcnQgc2VudCB0byBtZSwNCj4+IHdoZXJlIGl0J3Mgd2FybmluZyBhYm91dCBNT0RVTEVfTElD
RU5TRSgiR1BMIik6DQo+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNTEyMDkwMzU5
LjdCa1VhaUM5LWxrcEBpbnRlbC5jb20vDQo+DQo+IENhbiB5b3UgYm90aCBjb25maXJtIHdoaWNo
IHZlcnNpb24gb2Ygc3BhcnNlIGFyZSB5b3UgdXNpbmc/DQo+DQo+IE15IHVuZGVyc3RhbmRpbmcg
d2FzIHRoYXQgdGhpcyBwYXRjaCBmaXhlZCB0aGF0IHByb2JsZW06DQo+ID5odHRwczovL2xvcmUu
a2VybmVsLm9yZy9saW51eC1zcGFyc2UvQ0FDZVB2YlZHMktyR1FxNGNOS1Y9d2JPNWg9anAzTTBS
TzFTZGZYOGtWNE91a2pQRzhBQG1haWwuZ21haWwuY29tL1QvI21mODM4YjNlMmUzMjQ1ZDg4YzMw
YTgwMWVhNzQ3M2Q1YTVjMGViMTIxDQoNCj4gVGhlIHBhdGNoIGlzIGFscmVhZHkgbWVyZ2VkIGlu
dG8gdGhlIHNwYXJzZSB0cmVlLCBhbmQgSSB3YXMgbm90IGFibGUgdG8NCj4gcmVwcm9kdWNlIHRo
ZSBpc3N1ZS4NCg0KSSBwdWxsZWQgdGhlIGxhdGVzdCBzcGFyc2Ugc291cmNlIGFuZCByZS1jaGVj
a2VkIGJlZm9yZSByZXBvcnRpbmcuIFRvcCBjb21taXQgSSBoYXZlIGlzIHRoZSBvbmUgeW91IG1l
bnRpb246DQoNCmZiZGRlMzEyN2I4MyAoImJ1aWx0aW46IGltcGxlbWVudCBfX2J1aWx0aW5fc3Ry
bGVuKCkgZm9yIGNvbnN0YW50cyIpDQoNCkknbSBidWlsZGluZyBsYXRlc3QgTGludXMgdHJlZSBm
cm9tIHRoZSBjdXJyZW50IG1lcmdlIHdpbmRvdyAod2VsbCBsYXRlc3QgYXMtb2YgeWVzdGVyZGF5
KToNCg0KYzJmMmIwMWI3NGJlICgiTWVyZ2UgdGFnICdpM2MvZm9yLTYuMTknIG9mIGdpdDovL2dp
dC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9pM2MvbGludXgiKQ0KDQotVG9u
eQ0KDQoNCg0KDQo=

