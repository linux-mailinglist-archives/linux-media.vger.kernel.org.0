Return-Path: <linux-media+bounces-18606-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2548E986FDA
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 11:19:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D9E1D280C38
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 09:18:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 897021A7AD8;
	Thu, 26 Sep 2024 09:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j8CfeHqQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06050192B91;
	Thu, 26 Sep 2024 09:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727342327; cv=fail; b=JPbpqo3Q11gf0uz1eKy+Rdlz6rmmMNOArd1HKFHXOA0mHkdKF1g8wkp578YgtZbxEevXyx2wpU+JXiE+VbT6rtYfMLJt9oDWkpJtFuwJaFtcyqAqyBacZ0vVgdUv56U71opcEEakkfOcrmgB2WvgeXg2h+DVJnGcLbyLQHAdcLE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727342327; c=relaxed/simple;
	bh=KJUJWSGLBVUS+hLfvxONBETfdrlnoXJJiiYHwMveg4w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HgA4KWBCDb0zVrMUmtaWtnB3M6xuR6dH0HaJa4TFFjcNwCpx9/l9mCB3dgbldr802W9KvFqpcKKQRepyGbXBTJAZIC4MNaE+YhoP+drqqOFOYQQrP2ue2IiQfaZkxRB0E99HDg7X0tLyiSlN1yjTh9noBlJ7oxFAa7wcSTy71pY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j8CfeHqQ; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727342325; x=1758878325;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=KJUJWSGLBVUS+hLfvxONBETfdrlnoXJJiiYHwMveg4w=;
  b=j8CfeHqQXpY2S6o7p7ZDsMzb2TJA4pMJkx3DUATysGVjcJwpcuf6Mo/X
   nf48BWnn9nRHdKqgV9Remmd1sU4kx3/IzfofFh96g4b3uY6qwYSYGF/Qe
   XxnNSQ0LeP5xQPs2TaDnuAY8BCuAq8qFtzeKdMf4SHCdxxVI+SMiD8OhJ
   uEYNGlRiUOPWSndYR0Kgb0U90t42LWIVcLP7Pbt4r8uUzjRpdOIt6u0/s
   po34XSgqPtXo54BasCgju4k8Nxoj+0EloEkYa1ah1a5Oc9XXGOp4sNCL2
   AdKySeUJZs4vlPpbtIXSUra5SNpt9A/jX8JN77Gn5IrYdABtzDYHfbuVU
   g==;
X-CSE-ConnectionGUID: 9+LzEsi4Rfq+59w5gkFqAA==
X-CSE-MsgGUID: bwch0ZpdR1S7WMTPYm1jLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="26293322"
X-IronPort-AV: E=Sophos;i="6.10,260,1719903600"; 
   d="scan'208";a="26293322"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 02:18:36 -0700
X-CSE-ConnectionGUID: Y3YZpTIhRZi7XoyGSdQQqA==
X-CSE-MsgGUID: HRbEvGqMSROaj3X/MNEU1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,260,1719903600"; 
   d="scan'208";a="72881012"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 26 Sep 2024 02:18:32 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 26 Sep 2024 02:18:31 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 26 Sep 2024 02:18:30 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 26 Sep 2024 02:18:30 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 26 Sep 2024 02:18:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DdAS+Kiod+nCjiN5L9aRfivAPhYO6MwwWAPYN2b15Ar/vhBwemsrvhdG1Wb7SQc4C8JNQAeelUFKSJRPfc9XrnU1yUWNxd1UWRIJo5r5/KCgA9Ph6AG/VAeX0q3jNUw//sigpkX0GwQQoAdmLSCQihtj/X816qvagKUEE3fJHu2rYK/2r4mF1PEu5JEAiOGMmqAzqBpPO8ouOarr157jz6yRo73snmYk4+/WcfBGFbRO2QVHV3NnBSPEbcqUbbrgbemNn1VX4ah5vELnX44IZuY5RQpskUH/IHAl794yIZrj0UREl/vgqJDKufexEMXRB4c8JE9a3ouMBWL+oEiJ9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KJUJWSGLBVUS+hLfvxONBETfdrlnoXJJiiYHwMveg4w=;
 b=RP+ZjS0nnRP6VdtNwyYWpIs5gsLI4qRNdF/QBvb27Qkcbjh/Bz7wlzBL4PU44M9xAg0gEm2yYYwePTuCpwImZYH16gPobwWCVd5nm/mPfe9zOt4wLSwXRwWaMD7HWwGEHBDXl6ZFBmlTtbr7jXJTVQkuwTq2OziZ8dYXU8arEpCu/070cm8fsItiG20mqZ+BQ8sWNWq32H4K3lsL8FK/hmmlrIm1PwQ2oDDUyMciJ0leGzaV5bfxIddHLXILx1hLVYmC/IYQfGpopGdTKCO8gzgZSGMvmS6u2VVNRyqgrhqax/7nOGRRlw/TlmdOaxw97ADTPV/WvBUZbwkFd6lB0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by IA0PR11MB7284.namprd11.prod.outlook.com (2603:10b6:208:438::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Thu, 26 Sep
 2024 09:18:28 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::a9fd:43dd:b77:f01]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::a9fd:43dd:b77:f01%4]) with mapi id 15.20.7982.022; Thu, 26 Sep 2024
 09:18:28 +0000
From: "Yan, Dongcheng" <dongcheng.yan@intel.com>
To: Bingbu Cao <bingbu.cao@linux.intel.com>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: RE: [PATCH/RFC v1 2/9] media: i2c: Add a driver for the onsemi AR0144
 camera sensor
Thread-Topic: [PATCH/RFC v1 2/9] media: i2c: Add a driver for the onsemi
 AR0144 camera sensor
Thread-Index: AQHbD+pVHp2LnbbGw0W4ItsQfNNPy7Jpx/Sg
Date: Thu, 26 Sep 2024 09:18:28 +0000
Message-ID: <BL3PR11MB64103DCD972AC02F444231E8F26A2@BL3PR11MB6410.namprd11.prod.outlook.com>
References: <20240630141802.15830-1-laurent.pinchart@ideasonboard.com>
 <20240630141802.15830-3-laurent.pinchart@ideasonboard.com>
 <da12c6ba-1c49-0ec7-8ee0-5c230d3de2d3@linux.intel.com>
In-Reply-To: <da12c6ba-1c49-0ec7-8ee0-5c230d3de2d3@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR11MB6410:EE_|IA0PR11MB7284:EE_
x-ms-office365-filtering-correlation-id: adddb41a-202c-443f-8893-08dcde0c2e9f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?SnJXb0FYMGtmM1Nnd2hVRjZlQWptUXdkUmJHMStCbHk3eVZvMkhQd3A0TWE3?=
 =?utf-8?B?UUtSbDd5U21DajBtaUtiNWlwVFNLZTlNRndiekkrb21EMnNSZEJoK1FpRXVL?=
 =?utf-8?B?eTFEQ3JYUWx4aHl3dE5vWFVRYm9VYURmSk5TOWFyeGhQSWJ1NmJERUUrOWIx?=
 =?utf-8?B?WWp4bG9xRWorYXZmMzhEcnZhUjg0N2NxeG1LSHJUM3lTVEtsaWZXdm41b1BY?=
 =?utf-8?B?Q2Q2b0plL1dDdmZoSDF5MHRNTTlmaTNTYjRPcEcxYU9NdEJtYUMzUDR2WXVV?=
 =?utf-8?B?NStWK3kwclhMVGlJcVgzZ2wxZ2xBNUt6OFhQQWpieHUzZlNTQXkrUHZYVWpy?=
 =?utf-8?B?SFdWWXhybkFVYTZRdlYvOVF5NmM5RFVCSFJ6MHZNZjQ0M3NpakQ0K0M1R282?=
 =?utf-8?B?MmRJeEtFa1JDbmhYbm44OWk2QWpIaC82Z2FZSzFVNGhtSTJQU3BQVUMrQ1FN?=
 =?utf-8?B?Wnk3blRJUzhHeU5uanNYaWZhckFYb3JOVkUrUUViMGppZzc0ZHdEakJDTkhJ?=
 =?utf-8?B?WDhIYVJSYXRneTUyaHhXMEgrVVY1aktLeGFPTG9aeGZyZVFQdi9FdlZkb0dM?=
 =?utf-8?B?aEl2bUR3M083d0lBc0VZRHc3NC9sY3dzZGkvaFNuL1JyL25sNFlWcHBOcDVx?=
 =?utf-8?B?M1YvdlpRUnZUVm5RQ2VUME5paTVXNnF1V2Q5NGlyeUtKRGYzNXJyVzNxVVpv?=
 =?utf-8?B?bThsYWxwM2xyZG5pSC9xV1dwTjg3RGdSeUFENklrcG92RXYwbjdjSmtUTk1E?=
 =?utf-8?B?bmRRZGw2VG9zUk9HVTBKWS9UTStacmd6Z01YbDgxdDhuRW9ZQmt4SWxuZkd5?=
 =?utf-8?B?dkJMNi90VnVYaFZtQkJPU3p6WFIrNVpIMzA5Zm00c2tZakZHOGJ4LytNSDJR?=
 =?utf-8?B?NTlURUgyQUdLNkdXOExlM2Z6SHBIN0pzTW5UOGtEanc5dzRyZTQrRFkyNkVL?=
 =?utf-8?B?NGlTMkd4OUpCb0lTd20xRUM5RC9kSktBVGM1Y3RjU0FYTCtFRHl3ZkgrR3hk?=
 =?utf-8?B?MmJLUENpVlhSZU5QK1ZKSG55WXIzWWpGSWRUWnNHMnlSRkYyak1kR2VzVTBS?=
 =?utf-8?B?TkhzM1kzcmdjUGhrcFlCNFRFWXduS0cxTWhLNHBBOEV1VTI5L294VEZmeU50?=
 =?utf-8?B?SXFIMm8rUk5oaC93Sm9PSDgyd3B2VTg2OThGTVFQcU5jamxEOTJ2UzA3c2V0?=
 =?utf-8?B?MS9YbmRSM1lLOG9hWnJ1NjJXUmxqRjlSb3ZYeWY4dnR5RWJWM0xXY1g1eDhB?=
 =?utf-8?B?T3F1ODk5ZXVZRGFCUXdReHlka3BwbU9oSDZDYnFrVkF5OVJNcDhvRUpQQkVN?=
 =?utf-8?B?OHFUdjZXTjU3cEVnYUNjYnB0TmkyZE15L2dSSVhFeTVTUDZwSzJBaTN4eENz?=
 =?utf-8?B?MXNNRFZSY1djVkNkakVEcVFFWW41bVh5MllTWlNuOFBhNjFxS0N1Y0s5b2Z5?=
 =?utf-8?B?dVlUZ2NHUlM1dDZuanpDaGtvQ3NwbnhDUHU1RU80K1V3c0JvUDh4VHpHZGNy?=
 =?utf-8?B?QXZ3eHRaQkRaVFA3QzdPaVpRWms1dWg3WmMxOXd5R3U0UzhXWTdYN1BBTk5O?=
 =?utf-8?B?UHFaeWpxcDF2dlFyUVlSM0NJNURPTmtVMWxxSU4xU2VaOE16b242UDU1aWpG?=
 =?utf-8?B?SG56WDVjOHdObWxkWkRUZkI3WUpFUmlwZ2NsZkVTNU4weGJjempqeWdML1lP?=
 =?utf-8?B?MWc4UG1OQnpZTk9YeStZSTVxdk01aVAxcWl4YTl5WXZjME5PeXFFbi8yMkxo?=
 =?utf-8?B?RUVtZmF1SEpncmVVYWV2VlB4NjBRVko1ZlpDS21xZVJxZWlXSDhhOFVSQVpF?=
 =?utf-8?B?bVQ3QVo5cDdwSHNJRkxVMmMzQnRUa2pwcVBDVDVHTU5kZGI4a090MGRXNlc1?=
 =?utf-8?B?eXVlZjBxWUthbnFhMGFmWWljZGZlWmVKbWx0SDFTUWdFanc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR11MB6410.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dUxmUi9BNlROdUNxYUNuMDNiT2NXYk9EYkNRQUp0ajJTNHAxWStsdWVHMmNZ?=
 =?utf-8?B?dDlWZzEyNWU1NGpSakorS3M4eTB2WlNXeGh5K3p0SGR4N3BXMkxaaDBWNndo?=
 =?utf-8?B?VWxGNHRaWEF2Ry9QOCt6bkgxZmVEUVd0WW5RR040cTUvYllCUTdGS08xY0Ex?=
 =?utf-8?B?a0JCdkwwckpRQk9WRjZxb0dlcmh0TjhxMGY1bnJEaGlIQ1p5YmFheFpMaytC?=
 =?utf-8?B?VUFydG1FeVkxS1NGM1NiNlloZnlnazlNZXJVbjU1MnZrMDBnT0IzSm82SjlU?=
 =?utf-8?B?WDIxUlB5QmRwN1ZITyt1eGpad1hzOVc1ODlsSTNPbEtzN1dxcVQ5WmNsZmp3?=
 =?utf-8?B?RSthMTJwNlZjVC9xa0FJeHl5N2ExclU4d3NFcU40NDRra1pWV2dUcDREenBY?=
 =?utf-8?B?aWp1aGNpUGZtWVIyaUpHQ3pJT2w0MUFpcXdWTlA2TSt4OXNpVjdlVU14N3pM?=
 =?utf-8?B?SVFSYytYeVM1Z1NiME5qSlNGNWNGZkhJdWYrUDZQek5MUUY2eUV4OStNOG1k?=
 =?utf-8?B?YVQvUlhNSmZNN3lpNGlza1ZhSzNWd0ZraFVGKzd6Q0RzYVp5L1BDSUpqdWRz?=
 =?utf-8?B?Z3Vvdm9nUm45UEV6MkJuZk10ZzZZNVJPR05FZkZOTmJadkx4TUNhSGFQNzhw?=
 =?utf-8?B?VnU1b2VMUkhLNVVnRCszcG14VVNERk90enFaRzdwUkVCZGtrMlhzMUlNMklo?=
 =?utf-8?B?MkREQVNBQXNOQ0lXRjVrWXBoU3hsM2Y3NzA5amdtMG9DYmNFU2I3Y3Z0ajJ1?=
 =?utf-8?B?K2tQWUJiRWUyOTMwd3hOS0VWV3ZtdkhaVE5mUmVweXBPQkFmQmU0aFBXMHdD?=
 =?utf-8?B?c083VXo2ZThoUGhUZDRPMVZGOGdCOWhQU0xmSlY5Z0dLWmtKRjZyODZMbCtH?=
 =?utf-8?B?UDdiYmU5bXNEZWl5Sm5yM002ckFSSGtPWTBkSXRUSzI4UVBCNUZvZWdlaWNq?=
 =?utf-8?B?bVFsVG9Gem00TXNxbmxrd1BTNFYxQk1XamxScEdKNzV1YXR4T2JWc3hkLzVa?=
 =?utf-8?B?YjFSVmFKTmZ2VlJEN3VUdklrZUhOM3c2ZW9YMlZ2b2psclVEZFdSTG1rVkNH?=
 =?utf-8?B?L0tKbS9YNFBNaHZYTUlSWlErM09aT0RZTDRTZEUwZW1FM25qMEY1aWkrWjd2?=
 =?utf-8?B?VzZiM2p5K0crTnQ3WlhZSmYzYXVoOEpnVUJ2SHo4cUJmYWFqejh3dkZoRmtk?=
 =?utf-8?B?a3YvYk5FNzh4MnArNnRDK2o1bUsxMDFZZ3VUZkRKN3hDUDY0eFRLSjNVVElY?=
 =?utf-8?B?bGZTYi9xdWxwdFNHcWFNd3lTSFF5YUg5dnBvNlJIT044QkZMV0RzSEVaQTNM?=
 =?utf-8?B?T0lkK1ZzQXl2aXN4YlRGUCtjMVovVjZBZmlRWDA0dG9NcEVwS051amdubDh2?=
 =?utf-8?B?U24ycEdBVXhyNVpPbVJvYjQ2Zy80UzNlRWdIZ3dqK1V2TnNnUGVaTTNrOTgr?=
 =?utf-8?B?Y0FHK1FUQ2M0Y0g4WTZzdTBJaW9nMDFxamNrS0ZlbHZqcEd3VFlTcFltQ1N6?=
 =?utf-8?B?dktIcXJNZmd1TjVXbUxFSU8zNy93RzQyUU9jWjhzNGxRbHI4L1V2WjArV0t3?=
 =?utf-8?B?M3NOd2I4aWszeHVtb3doclpIYit2UHZyZXVBYlVna0xsM3dXMFR6WW5lNmVH?=
 =?utf-8?B?aFZ3eUpuaDNYemljMjVpOE1wZUxJRHQxdDBxYUFlaExhUGhaUmF1S0NaNVc0?=
 =?utf-8?B?SlM4YlBRM2dFdzFSM1MrU3hZSjUvYXl3UnRWblRJdVY4RlVYZXB6bTF3ZXp5?=
 =?utf-8?B?ZUt3V0F4eVpWei9PQzRORFpRbng2QXV4UXhSZFlPSkRkSHVpZVUrNzB1MkZ3?=
 =?utf-8?B?a0xmWkJrSVJGN2RvOFAwZjQ1SnYxV3hmOS9VTzZkN0ZwNUxqSWRsM1pQRjF6?=
 =?utf-8?B?TVpLeXpQR2Q2WW1heUNnNHk2NUw1a1dEQ25KaXNsL0dmci92WnFBY1o2YTF5?=
 =?utf-8?B?aFF6VjRmK2RUZEY4Z2hFUFQxcW8rRXhacEFPUGdZcFVsNlNGekw3bUN3bG9i?=
 =?utf-8?B?K1FFLzJqc3VUcFJQMFNLYkFvOGpMNm4zMDVrMDVtOE9kbUNKM095YnFvQlVv?=
 =?utf-8?B?ck1QK3lIdXhJa1VVZkQ4eUFQOStVWXRiK09pMk9xdXRUbTRKUlMvelFTZjQv?=
 =?utf-8?Q?IhmOst14YaksxRIXIhzXE4Cgz?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adddb41a-202c-443f-8893-08dcde0c2e9f
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2024 09:18:28.2455
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4qSJhYyJjI6tjDqHkkylEGtgPcDPJE0o/ingi/68o8NIwk2ACTW5TwwiIvYUfSPRVrMlbiYDi5taWvV5PP2Jpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7284
X-OriginatorOrg: intel.com

SGkgTGF1cmVudCwNCg0KSSB3YW50IHRvIGFkZCBzb21lIGRldGFpbHMgYWJvdXQgY29tbXVuaWNh
dGluZyB3aXRoIHRoZSB2ZW5kb3IuIEhlIHNoYXJlIHdpdGggbWUNCmFyMDE0NCdzIHNwZWMsIEkg
Y2FuIHNlZSB0aGUgbWluL21heCB2YWwgb2YgcGFyYW1zIHN1Y2ggYXMgc3lzX2Rpdi8gcHJlX3Bs
bF9jbGtfZGl2DQphbmQgcGxsX211bHRpcGxpZXIuIA0KQnV0IHRoZXJlIGlzIG5vIHJlbGV2YW50
IGRlZmluaXRpb24gaW4gdGhlIHNwZWMgb2YgYXIwMjM0LCBvbmx5IGV4dF9jbGsgYW5kIHBsbF9v
cF9jbGsNCmhhdmUgbWluIGFuZCBtYXggdmFsIOKAi+KAi2RlZmluZWQuIFRoaXMgbWFrZXMgaXQg
ZGlmZmljdWx0IGZvciBtZSB0byBkeW5hbWljYWxseSBjYWxjdWxhdGUNCnRoZSBwbGwgYmFzZWQg
b24gZXh0X2Nsay4NCg0KVGhhbmtzLA0KRG9uZ2NoZW5nDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCj4gRnJvbTogQmluZ2J1IENhbyA8YmluZ2J1LmNhb0BsaW51eC5pbnRlbC5jb20+
DQo+IFNlbnQ6IFRodXJzZGF5LCBTZXB0ZW1iZXIgMjYsIDIwMjQgNDowMyBQTQ0KPiBUbzogTGF1
cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPjsNCj4gbGlu
dXgtbWVkaWFAdmdlci5rZXJuZWwub3JnOyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZw0KPiBD
YzogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz47IEtyenlzenRvZiBLb3psb3dza2kgPGty
emsrZHRAa2VybmVsLm9yZz47DQo+IENvbm9yIERvb2xleSA8Y29ub3IrZHRAa2VybmVsLm9yZz47
IFNha2FyaSBBaWx1cw0KPiA8c2FrYXJpLmFpbHVzQGxpbnV4LmludGVsLmNvbT47IEhhbnMgVmVy
a3VpbCA8aHZlcmt1aWwtY2lzY29AeHM0YWxsLm5sPjsgWWFuLA0KPiBEb25nY2hlbmcgPGRvbmdj
aGVuZy55YW5AaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIL1JGQyB2MSAyLzldIG1l
ZGlhOiBpMmM6IEFkZCBhIGRyaXZlciBmb3IgdGhlIG9uc2VtaQ0KPiBBUjAxNDQgY2FtZXJhIHNl
bnNvcg0KPiANCj4gTGF1cmVudCwNCj4gDQo+IE9uIDYvMzAvMjQgMTA6MTcgUE0sIExhdXJlbnQg
UGluY2hhcnQgd3JvdGU6DQo+ID4gVGhlIEFSMDE0NCBpcyBhIDEvNCIgMU1QIENNT1MgY2FtZXJh
IHNlbnNvciBmcm9tIG9uc2VtaS4gVGhlIGRyaXZlcg0KPiA+IHN1cHBvcnRzIGJvdGggdGhlIG1v
bm9jaHJvbWUgYW5kIGNvbG9yIHZlcnNpb25zLCBhbmQgYm90aCB0aGUgcGFyYWxsZWwNCj4gPiBh
bmQgTUlQSSBDU0ktMiBpbnRlcmZhY2VzLiBEdWUgdG8gbGltaXRhdGlvbnMgb2YgdGhlIHRlc3Qg
cGxhdGZvcm0sDQo+ID4gb25seSB0aGUgQ1NJLTIgb3V0cHV0IGhhcyBiZWVuIHRlc3RlZC4NCj4g
Pg0KPiA+IFRoZSBkcml2ZXIgc3VwcG9ydHMgOC0sIDEwLSBhbmQgMTItYml0IG91dHB1dCBmb3Jt
YXRzLCBhbmFsb2cgY3JvcCBhbmQNCj4gPiBiaW5uaW5nL3NraXBwaW5nLiBJdCBleHBvc2VzIGNv
bnRyb2xzIHRoYXQgY292ZXIgdGhlIHVzdWFsIHVzZSBjYXNlcw0KPiA+IGZvciBjYW1lcmEgc2Vu
c29ycy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQu
cGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4NCj4gPiAtLS0NCj4gPiAgTUFJTlRBSU5FUlMgICAg
ICAgICAgICAgICAgfCAgICAxICsNCj4gPiAgZHJpdmVycy9tZWRpYS9pMmMvS2NvbmZpZyAgfCAg
IDExICsNCj4gPiAgZHJpdmVycy9tZWRpYS9pMmMvTWFrZWZpbGUgfCAgICAxICsNCj4gPiAgZHJp
dmVycy9tZWRpYS9pMmMvYXIwMTQ0LmMgfCAxODI2DQo+ID4gKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrDQo+ID4gIDQgZmlsZXMgY2hhbmdlZCwgMTgzOSBpbnNlcnRpb25zKCsp
DQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21lZGlhL2kyYy9hcjAxNDQuYw0KPiA+
DQo+IC4uLg0KPiA+ICsNCj4gPiArLyoNCj4gPiArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gKy0tLS0tLS0t
DQo+ID4gKyAqIFBMTA0KPiA+ICsgKi8NCj4gPiArDQo+ID4gK3N0YXRpYyBpbnQgYXIwMTQ0X3Bs
bF9jYWxjdWxhdGUoc3RydWN0IGFyMDE0NCAqc2Vuc29yLCBzdHJ1Y3QgY2NzX3BsbCAqcGxsLA0K
PiA+ICsJCQkJdW5zaWduZWQgaW50IGxpbmtfZnJlcSwgdW5zaWduZWQgaW50IGJwcCkgew0KPiA+
ICsJc3RydWN0IGNjc19wbGxfbGltaXRzIGxpbWl0cyA9IHsNCj4gPiArCQkubWluX2V4dF9jbGtf
ZnJlcV9oeiA9IDYwMDAwMDAsDQo+ID4gKwkJLm1heF9leHRfY2xrX2ZyZXFfaHogPSA0ODAwMDAw
MCwNCj4gPiArDQo+ID4gKwkJLnZ0X2ZyID0gew0KPiA+ICsJCQkubWluX3ByZV9wbGxfY2xrX2Rp
diA9IDEsDQo+ID4gKwkJCS5tYXhfcHJlX3BsbF9jbGtfZGl2ID0gNjMsDQo+ID4gKwkJCS5taW5f
cGxsX2lwX2Nsa19mcmVxX2h6ID0gMTAwMDAwMCwJLyoNCj4gbWluX3BsbF9vcF9jbGtfZnJlcV9o
eiAvIG1heF9wbGxfbXVsdGlwbGllciAqLw0KPiA+ICsJCQkubWF4X3BsbF9pcF9jbGtfZnJlcV9o
eiA9IDI0MDAwMDAwLAkvKg0KPiBtYXhfcGxsX29wX2Nsa19mcmVxX2h6IC8gbWluX3BsbF9tdWx0
aXBsaWVyICovDQo+ID4gKwkJCS5taW5fcGxsX211bHRpcGxpZXIgPSAzMiwNCj4gPiArCQkJLm1h
eF9wbGxfbXVsdGlwbGllciA9IDM4NCwNCj4gPiArCQkJLm1pbl9wbGxfb3BfY2xrX2ZyZXFfaHog
PSAzODQwMDAwMDAsDQo+ID4gKwkJCS5tYXhfcGxsX29wX2Nsa19mcmVxX2h6ID0gNzY4MDAwMDAw
LA0KPiA+ICsJCX0sDQo+ID4gKwkJLnZ0X2JrID0gew0KPiA+ICsJCQkubWluX3N5c19jbGtfZGl2
ID0gMSwNCj4gPiArCQkJLm1heF9zeXNfY2xrX2RpdiA9IDE2LA0KPiA+ICsJCQkubWluX3BpeF9j
bGtfZGl2ID0gNCwNCj4gPiArCQkJLm1heF9waXhfY2xrX2RpdiA9IDE2LA0KPiA+ICsJCQkubWlu
X3BpeF9jbGtfZnJlcV9oeiA9IDYwMDAwMDAsCQkvKiBObyBkb2N1bWVudGVkIGxpbWl0DQo+ICov
DQo+ID4gKwkJCS5tYXhfcGl4X2Nsa19mcmVxX2h6ID0gNzQyNTAwMDAsDQo+ID4gKwkJfSwNCj4g
PiArCQkub3BfYmsgPSB7DQo+ID4gKwkJCS5taW5fc3lzX2Nsa19kaXYgPSAxLA0KPiA+ICsJCQku
bWF4X3N5c19jbGtfZGl2ID0gMTYsDQo+ID4gKwkJCS5taW5fcGl4X2Nsa19kaXYgPSA4LA0KPiA+
ICsJCQkubWF4X3BpeF9jbGtfZGl2ID0gMTIsDQo+ID4gKwkJCS5taW5fcGl4X2Nsa19mcmVxX2h6
ID0gNjAwMDAwMCwJCS8qIE5vIGRvY3VtZW50ZWQgbGltaXQNCj4gKi8NCj4gPiArCQkJLm1heF9w
aXhfY2xrX2ZyZXFfaHogPSA3NDI1MDAwMCwNCj4gPiArCQl9LA0KPiA+ICsNCj4gPiArCQkubWlu
X2xpbmVfbGVuZ3RoX3Bja19iaW4gPSAxMjAwICsgQVIwMTQ0X01JTl9IQkxBTkssCS8qIFRvDQo+
IGJlIGNoZWNrZWQgKi8NCj4gPiArCQkubWluX2xpbmVfbGVuZ3RoX3BjayA9IDEyMDAgKyBBUjAx
NDRfTUlOX0hCTEFOSywNCj4gPiArCX07DQo+ID4gKwl1bnNpZ25lZCBpbnQgbnVtX2xhbmVzID0N
Cj4gc2Vuc29yLT5idXNfY2ZnLmJ1cy5taXBpX2NzaTIubnVtX2RhdGFfbGFuZXM7DQo+ID4gKwlp
bnQgcmV0Ow0KPiA+ICsNCj4gPiArCS8qDQo+ID4gKwkgKiBUaGUgT1AgcGl4ZWwgY2xvY2sgbGlt
aXRzIGRlcGVuZHMgb24gdGhlIG51bWJlciBvZiBsYW5lcywgd2hpY2ggdGhlDQo+ID4gKwkgKiBQ
TEwgY2FsY3VsYXRvciBkb2Vzbid0IHRha2UgaW50byBhY2NvdW50IGRlc3BpdGUgc3BlY2lmeWlu
ZyB0aGUNCj4gPiArCSAqIENDU19QTExfRkxBR19MQU5FX1NQRUVEX01PREVMIGZsYWcuIEFkanVz
dCB0aGVtIG1hbnVhbGx5Lg0KPiA+ICsJICovDQo+ID4gKwlsaW1pdHMub3BfYmsubWluX3BpeF9j
bGtfZnJlcV9oeiAvPSBudW1fbGFuZXM7DQo+ID4gKwlsaW1pdHMub3BfYmsubWF4X3BpeF9jbGtf
ZnJlcV9oeiAvPSBudW1fbGFuZXM7DQo+ID4gKw0KPiA+ICsJLyoNCj4gPiArCSAqIFRoZXJlIGFy
ZSBubyBkb2N1bWVudGVkIGNvbnN0cmFpbnRzIG9uIHRoZSBzeXMgY2xvY2sgZnJlcXVlbmN5LCBm
b3INCj4gPiArCSAqIGVpdGhlciBicmFuY2guIFJlY292ZXIgdGhlbSBiYXNlZCBvbiB0aGUgUExM
IG91dHB1dCBjbG9jayBmcmVxdWVuY3kNCj4gPiArCSAqIGFuZCBzeXNfY2xrX2RpdiBsaW1pdHMg
b24gb25lIGhhbmQsIGFuZCB0aGUgcGl4IGNsb2NrIGZyZXF1ZW5jeSBhbmQNCj4gPiArCSAqIHRo
ZSBwaXhfY2xrX2RpdiBsaW1pdHMgb24gdGhlIG90aGVyIGhhbmQuDQo+ID4gKwkgKi8NCj4gPiAr
CWxpbWl0cy52dF9iay5taW5fc3lzX2Nsa19mcmVxX2h6ID0NCj4gPiArCQltYXgobGltaXRzLnZ0
X2ZyLm1pbl9wbGxfb3BfY2xrX2ZyZXFfaHogLw0KPiBsaW1pdHMudnRfYmsubWF4X3N5c19jbGtf
ZGl2LA0KPiA+ICsJCSAgICBsaW1pdHMudnRfYmsubWluX3BpeF9jbGtfZnJlcV9oeiAqDQo+IGxp
bWl0cy52dF9iay5taW5fcGl4X2Nsa19kaXYpOw0KPiA+ICsJbGltaXRzLnZ0X2JrLm1heF9zeXNf
Y2xrX2ZyZXFfaHogPQ0KPiA+ICsJCW1pbihsaW1pdHMudnRfZnIubWF4X3BsbF9vcF9jbGtfZnJl
cV9oeiAvDQo+IGxpbWl0cy52dF9iay5taW5fc3lzX2Nsa19kaXYsDQo+ID4gKwkJICAgIGxpbWl0
cy52dF9iay5tYXhfcGl4X2Nsa19mcmVxX2h6ICoNCj4gPiArbGltaXRzLnZ0X2JrLm1heF9waXhf
Y2xrX2Rpdik7DQo+ID4gKw0KPiA+ICsJbGltaXRzLm9wX2JrLm1pbl9zeXNfY2xrX2ZyZXFfaHog
PQ0KPiA+ICsJCW1heChsaW1pdHMudnRfZnIubWluX3BsbF9vcF9jbGtfZnJlcV9oeiAvDQo+IGxp
bWl0cy5vcF9iay5tYXhfc3lzX2Nsa19kaXYsDQo+ID4gKwkJICAgIGxpbWl0cy5vcF9iay5taW5f
cGl4X2Nsa19mcmVxX2h6ICoNCj4gbGltaXRzLm9wX2JrLm1pbl9waXhfY2xrX2Rpdik7DQo+ID4g
KwlsaW1pdHMub3BfYmsubWF4X3N5c19jbGtfZnJlcV9oeiA9DQo+ID4gKwkJbWluKGxpbWl0cy52
dF9mci5tYXhfcGxsX29wX2Nsa19mcmVxX2h6IC8NCj4gbGltaXRzLm9wX2JrLm1pbl9zeXNfY2xr
X2RpdiwNCj4gPiArCQkgICAgbGltaXRzLm9wX2JrLm1heF9waXhfY2xrX2ZyZXFfaHogKg0KPiA+
ICtsaW1pdHMub3BfYmsubWF4X3BpeF9jbGtfZGl2KTsNCj4gPiArDQo+ID4gKwltZW1zZXQocGxs
LCAwLCBzaXplb2YoKnBsbCkpOw0KPiA+ICsNCj4gPiArCXBsbC0+YnVzX3R5cGUgPSBDQ1NfUExM
X0JVU19UWVBFX0NTSTJfRFBIWTsNCj4gPiArCXBsbC0+b3BfbGFuZXMgPSBudW1fbGFuZXM7DQo+
ID4gKwlwbGwtPnZ0X2xhbmVzID0gMTsNCj4gPiArCXBsbC0+Y3NpMi5sYW5lcyA9IG51bV9sYW5l
czsNCj4gPiArCS8qDQo+ID4gKwkgKiBBcyB0aGUgc2Vuc29yIGRvZXNuJ3Qgc3VwcG9ydCBGSUZP
IGRlcmF0aW5nLCBiaW5uaW5nIGRvZXNuJ3QNCj4gPiArCSAqIGluZmx1ZW5jZSB0aGUgUExMIGNv
bmZpZ3VyYXRpb24uIEhhcmRjb2RlIHRoZSBiaW5uaW5nIGZhY3RvcnMuDQo+ID4gKwkgKi8NCj4g
PiArCXBsbC0+YmlubmluZ19ob3Jpem9udGFsID0gMTsNCj4gPiArCXBsbC0+YmlubmluZ192ZXJ0
aWNhbCA9IDE7DQo+ID4gKwlwbGwtPnNjYWxlX20gPSAxOw0KPiA+ICsJcGxsLT5zY2FsZV9uID0g
MTsNCj4gPiArCXBsbC0+Yml0c19wZXJfcGl4ZWwgPSBicHA7DQo+ID4gKwlwbGwtPmZsYWdzID0g
Q0NTX1BMTF9GTEFHX0xBTkVfU1BFRURfTU9ERUw7DQo+ID4gKwlwbGwtPmxpbmtfZnJlcSA9IGxp
bmtfZnJlcTsNCj4gPiArCXBsbC0+ZXh0X2Nsa19mcmVxX2h6ID0gY2xrX2dldF9yYXRlKHNlbnNv
ci0+Y2xrKTsNCj4gPiArDQo+ID4gKwlyZXQgPSBjY3NfcGxsX2NhbGN1bGF0ZShzZW5zb3ItPmRl
diwgJmxpbWl0cywgcGxsKTsNCj4gPiArCWlmIChyZXQpDQo+ID4gKwkJcmV0dXJuIHJldDsNCj4g
PiArDQo+ID4gKwkvKg0KPiA+ICsJICogVGhlIHNlbnNvciBpZ25vcmVzIHRoZSBMU0Igb2YgdGhl
IFBMTCBtdWx0aXBsaWVyLiBJZiB0aGUgbXVsdGlwbGllcg0KPiA+ICsJICogaXMgYW4gb2RkIHZh
bHVlLCBhcyBhIHdvcmthcm91bmQgdG8gYXZvaWQgcHJlY2lzaW9uIGxvc3MsIG11bHRpcGx5DQo+
ID4gKwkgKiBib3RoIHRoZSBwcmUtZGl2aWRlciBhbmQgdGhlIG11bHRpcGxpZXIgYnkgMiBpZiB0
aGlzIGRvZXNuJ3QgYnJpbmcNCj4gPiArCSAqIHRoZW0gYmV5b25kIHRoZWlyIG1heGltdW0gdmFs
dWVzLiBUaGlzIGRvZXNuJ3QgbmVjZXNzYXJpbHkNCj4gZ3VhcmFudGVlDQo+ID4gKwkgKiBvcHRp
bXVtIFBMTCBwYXJhbWV0ZXJzLiBJZGVhbGx5IHRoZSBQTEwgY2FsY3VsYXRvciBzaG91bGQgaGFu
ZGxlDQo+ID4gKwkgKiB0aGlzIGNvbnN0cmFpbnQuDQo+ID4gKwkgKi8NCj4gPiArCWlmICgocGxs
LT52dF9mci5wbGxfbXVsdGlwbGllciAmIDEpICYmDQo+ID4gKwkgICAgcGxsLT52dF9mci5wbGxf
bXVsdGlwbGllciAqIDIgPD0gbGltaXRzLnZ0X2ZyLm1heF9wbGxfbXVsdGlwbGllciAmJg0KPiA+
ICsJICAgIHBsbC0+dnRfZnIucHJlX3BsbF9jbGtfZGl2ICogMiA8PSBsaW1pdHMudnRfZnIubWF4
X3ByZV9wbGxfY2xrX2Rpdikgew0KPiA+ICsJCXBsbC0+dnRfZnIucGxsX211bHRpcGxpZXIgKj0g
MjsNCj4gPiArCQlwbGwtPnZ0X2ZyLnByZV9wbGxfY2xrX2RpdiAqPSAyOw0KPiA+ICsJfQ0KPiA+
ICsNCj4gPiArCWlmIChwbGwtPnZ0X2ZyLnBsbF9tdWx0aXBsaWVyICYgMSkNCj4gPiArCQlkZXZf
d2FybihzZW5zb3ItPmRldiwNCj4gPiArCQkJICJPZGQgUExMIG11bHRpcGxpZXIsIGxpbmsgZnJl
cXVlbmN5ICV1IHdpbGwgbm90IGJlIGV4YWN0XG4iLA0KPiA+ICsJCQkgcGxsLT5saW5rX2ZyZXEp
Ow0KPiA+ICsNCj4gPiArCXJldHVybiAwOw0KPiA+ICt9DQo+IA0KPiBEb25nY2hlbmcgYW5kIEkg
YXJlIHRyeWluZyB0byBjYWxjdWxhdGUgdGhlIEFSIHBsbCBsaWtlIGNvZGUgaGVyZS4gQnV0IHdl
IGRpZA0KPiBub3QgZmluZCBhbnkgZGF0YXNoZWV0IG9yIG1hbnVhbCB0byByZWZlciB0by4gRXZl
biB2ZW5kb3IgaGFzIG5vIGlkZWEuIENvdWxkDQo+IHlvdSBzaGFyZSB3aGljaCBkb2MgY2FuIGhl
bHAgdXMgdG8gZG8gdGhhdD8NCj4gDQo+ID4gKw0KPiA+ICtzdGF0aWMgaW50IGFyMDE0NF9wbGxf
dXBkYXRlKHN0cnVjdCBhcjAxNDQgKnNlbnNvciwNCj4gPiArCQkJICAgICBjb25zdCBzdHJ1Y3Qg
YXIwMTQ0X2Zvcm1hdF9pbmZvICppbmZvKSB7DQo+ID4gKwl1NjQgbGlua19mcmVxOw0KPiA+ICsJ
aW50IHJldDsNCj4gPiArDQo+ID4gKwlsaW5rX2ZyZXEgPSBzZW5zb3ItPmJ1c19jZmcubGlua19m
cmVxdWVuY2llc1tzZW5zb3ItPmxpbmtfZnJlcS0+dmFsXTsNCj4gPiArCXJldCA9IGFyMDE0NF9w
bGxfY2FsY3VsYXRlKHNlbnNvciwgJnNlbnNvci0+cGxsLCBsaW5rX2ZyZXEsIGluZm8tPmJwcCk7
DQo+ID4gKwlpZiAocmV0KSB7DQo+ID4gKwkJZGV2X2VycihzZW5zb3ItPmRldiwgIlBMTCBjYWxj
dWxhdGlvbnMgZmFpbGVkOiAlZFxuIiwgcmV0KTsNCj4gPiArCQlyZXR1cm4gcmV0Ow0KPiA+ICsJ
fQ0KPiA+ICsNCj4gPiArCV9fdjRsMl9jdHJsX3NfY3RybF9pbnQ2NChzZW5zb3ItPnBpeGVsX3Jh
dGUsDQo+ID4gKwkJCQkgc2Vuc29yLT5wbGwucGl4ZWxfcmF0ZV9waXhlbF9hcnJheSk7DQo+ID4g
Kw0KPiA+ICsJcmV0dXJuIDA7DQo+ID4gK30NCj4gPiArDQo+IC4uLg0KPiA+DQo+IA0KPiAtLQ0K
PiBCZXN0IHJlZ2FyZHMsDQo+IEJpbmdidSBDYW8NCg==

