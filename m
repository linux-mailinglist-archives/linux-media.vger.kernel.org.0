Return-Path: <linux-media+bounces-20741-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B58869BAB19
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 04:08:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1481E1F216DD
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 03:08:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90C53165F04;
	Mon,  4 Nov 2024 03:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QGXB3EyT"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E800E33EA
	for <linux-media@vger.kernel.org>; Mon,  4 Nov 2024 03:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730689687; cv=fail; b=SCCXvNV/laQo0QqvZUnBAztKNwBp9ofReghOWb/evOdlcBDkVugw0yKdl+k52820h0WCVWgc8HFzNQ3FMgc7PyHi4viTN9wRNtzhR+4Mo6q/U5epIUvxeZMVHoyjxjIcbg29KoU3uWztIlRPLYdzOzY9Dn7sEAulOKtT/nkS/n0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730689687; c=relaxed/simple;
	bh=ftMs+tRUouAmlLUDri3bZsx3jK03JEevwnfbsAZ6WYM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DJ7UIl8/6hHzf/KfSBbcggCyRr817mHNN8UP7y2u0XD0aV+8I0LrEaehps4J+sPQFTidXIKMFb3UVg39JqtcW87WjVMK2g7CEHX0sZbHUyVaB70MP6AiEvUfRbn9BgH94KZQHC6A9BcaQUKsHDHaIKv7QTrZl0KkvYNNSeIVua0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QGXB3EyT; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730689685; x=1762225685;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ftMs+tRUouAmlLUDri3bZsx3jK03JEevwnfbsAZ6WYM=;
  b=QGXB3EyTuit7ms20nVHpV/HWF5xqIcOJfIv5eW8QHCyJlDgysd+tioc9
   w6LTbE9hCYwdo4T6DVqGSFTHONXT6ZbzCZ0j9eZzrWkrMzwpICMNWypHL
   obEUbX9LfxD0LhkKdluXHCNiqo29W0jEt3PYvpGoO1ZkfkX+2jgDEsVSe
   rx2sBTCUCnjxgCyfKlpoB+y7qZae02JQ1jPBootc9k24vVC8c+pfrulWB
   AulA5YMC6IykaRFxdvE7sQVtdUHBlJnobbqSQg3JzrlsOnUkIP8ePubp2
   viuKfzdfKQBzbYxpohu/MHNBwdP53OPV0cEky+bnFIlzJGgU9LCXNPObc
   Q==;
X-CSE-ConnectionGUID: nilkf9DGSU2/hJBdgZf2vg==
X-CSE-MsgGUID: 6dWM1zBJRguBCfezfL0ebg==
X-IronPort-AV: E=McAfee;i="6700,10204,11245"; a="17991328"
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="17991328"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2024 19:08:01 -0800
X-CSE-ConnectionGUID: GPLRXJE5TSSM9sCHgsxqCw==
X-CSE-MsgGUID: 8Iv0/rwlQXGsJkufk9PBjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="114310391"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 Nov 2024 19:08:02 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 3 Nov 2024 19:08:00 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 3 Nov 2024 19:08:00 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 3 Nov 2024 19:08:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KTgqPg08asalG1QeSvczZ78jUXYMD4YvRhteLgBLe3V/IcQwyt5CT6Cj7OhW+O0riM1CpFxp1MdPho2vH3UrHnC653ag0eNeB8Mp12LTxuGLGfLW2rufqDpDrcjuACPuSg4cybQAa3cC1H/XCc6g4SWbCKAiFvKT/s6HyE7EbAi/q/8clx3v7oBFtsHkUtf093+Dvck0DVm+JK3YpaR343vJO+NkLYrynQpYHMpl0QdOCgn1cJaR7l/L7BGJVnfiuQHsRpiTWMKzGfoedhQoEqAxa1XyzVux6XVbK1ekm6F8bxQiuAEyJaI9Edo3fKC/QSEEZh2MmAgr7nMw5R3wBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eiSLi0oJ/U5IZBYdl4gq7gi2SWYqj6joeU+e8Q5eOF0=;
 b=FlfPAb0H0Ch5pdoZPdG3dOiw3bIjymV9Os9EbF+zpAyoEWf63ArEKw3IY1De+azPDWIfxAT/qcvLn0BwEia0dRPAAGE6g94df+NrENNSL7eYjUKdAl4Ke+xH1nBVC5edgNTMUP42NfQuHyam+c3XP1eD67Pl5wZPZt6zt9ExCciW+OqyPUQgUcrgz8ueQ5LN2pcYhranzAIJSauIvV8cmn4/t0ZkSN08Qq01UOarsmsKbNGpL5xSmjBgXUnrl8v0bHNdQcGBS0CGJnfcpbmFQZOLYuM75UYGH08lOE02BQzQtgOljmenE+VtahPRJ5ycxl2teD6jdNYKL/fohxNaEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7171.namprd11.prod.outlook.com (2603:10b6:930:92::16)
 by SJ0PR11MB5771.namprd11.prod.outlook.com (2603:10b6:a03:424::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.28; Mon, 4 Nov
 2024 03:07:58 +0000
Received: from CY8PR11MB7171.namprd11.prod.outlook.com
 ([fe80::af57:a78f:5ba3:350a]) by CY8PR11MB7171.namprd11.prod.outlook.com
 ([fe80::af57:a78f:5ba3:350a%3]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 03:07:58 +0000
From: "Wang, Hongju" <hongju.wang@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"bingbu.cao@linux.intel.com" <bingbu.cao@linux.intel.com>
Subject: RE: [PATCH] media: intel/ipu6: Set the VC of the stream as the SOF
 event id
Thread-Topic: [PATCH] media: intel/ipu6: Set the VC of the stream as the SOF
 event id
Thread-Index: AQHbJcPuFHUKRC8qN0m+pbeYIbbzirKVtBWAgBDGMiA=
Date: Mon, 4 Nov 2024 03:07:58 +0000
Message-ID: <CY8PR11MB7171773036C246F09DC2756EEF512@CY8PR11MB7171.namprd11.prod.outlook.com>
References: <20241024032201.3867638-1-hongju.wang@intel.com>
 <Zxoh36bkJaDQIvME@kekkonen.localdomain>
In-Reply-To: <Zxoh36bkJaDQIvME@kekkonen.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7171:EE_|SJ0PR11MB5771:EE_
x-ms-office365-filtering-correlation-id: 22e99711-97af-483d-b55b-08dcfc7de2c3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?1e5cfMLmZ0sFSWIiRjSvffm2raenHlHNra+ERmctXS7f0JGbCHqaY3feT6kG?=
 =?us-ascii?Q?C+ibzK40DjzpfYYEj6PwCj8z/Ybzan8mxvwBA9Xhjifu9cqIrOBMQ7pyRmOs?=
 =?us-ascii?Q?59CHkmyx95YGq15U2dtcT8I/xoPHiQpDTSJ3JsEVRTgv/41xt2Hg0rFVBzRF?=
 =?us-ascii?Q?ebaWvUmDdwPNK9tqUdNVadt/y+9/eCkIMpZb0/jX4waikssvBN0LobIB87v4?=
 =?us-ascii?Q?d2UX+2FN4LFG55vctHnQo7lKYH/Vf44/JASN9OXALU08vgVrA9fXGbez9Jyl?=
 =?us-ascii?Q?S0jV6L8xLroY0iHhllWuTdMmic1ub67DROomKgUwTP4VMZAHRqeKWh7KPQN4?=
 =?us-ascii?Q?0uD+5d66ay4UnXhCnfex2RRQn/r9+5iLj1ks5fSEzfAyNXdAFOjLmuzVqC2a?=
 =?us-ascii?Q?gNHFjs27OD0LRwdCF5nPZTVbeTxMQhWFfK4JLhZ/yL5qVHT1tqF8Arbl4/lm?=
 =?us-ascii?Q?V35ezpe2IkzPUYoWMxo5XzT23DoOJTRj0NMfHUyNvSE33vZRR7WgX4WjrcwM?=
 =?us-ascii?Q?R9yXZbCsB1qIHUHWhStEN7xbnEyvLG4q3ZHzWw87uiY+mTf8MzwLrDyGYMIU?=
 =?us-ascii?Q?2qU+9JofWm9pXKTKfUkUU3loXoA4t2cdHSLUW8UZRBtnL/RjU1QhwMNmtaL9?=
 =?us-ascii?Q?7YkEawFaz+fpXo7rXonvRRoG8r0ujGmevIOvHC3kuPpxMlX33KPe32crPMGl?=
 =?us-ascii?Q?StAMVW6k/lyXID8UIpT8PBhp2Y3GsznHlTOCiN+zXzYQv8852XbUsX1XJoi6?=
 =?us-ascii?Q?JHElwJJ22/zEoXLclmyyHx9tcU8DWFE4Dp/3A2VpaWg8dxRZWEXS+qoqgw69?=
 =?us-ascii?Q?hHnXp8G5gdrbVRmkUj1QuMIX0Ye6Kr2rQU6g8wnVH3AQOFNlYUtQtW2dr0GC?=
 =?us-ascii?Q?7ZVmevh5bkkdRRv59/xHb2Kpb5Ixpg+7D9RijJQDCGRRW4ug9ykcivj/hqyr?=
 =?us-ascii?Q?slmiptwNTtxOq1mUcBZhnU9FT3aQ/f9cy5/EEdyk3Dwn9IV2sEeHrE7So4Ye?=
 =?us-ascii?Q?VpELFTJXJtqX/CZiorFZrxkE7+KJTwHcz4ACILs96O8rh6n8DiUzmpVyGC3Z?=
 =?us-ascii?Q?dzF2hr/l7TR1a1hLh3z4mFvprparMrxd9pDCNbJJhhH5Ji6CfUo8YcZOOnCB?=
 =?us-ascii?Q?Wy7n2wtc9CxmgKR8H6WtvUr0HKkEzmZp03x7aiJcvGMkUhiM8zSmO2O/asAM?=
 =?us-ascii?Q?BQpwwmwsRq300eOXcbxAzj/pMRYIQyDEWN82fmIuHu/rWlAFMFceRbU8s1zj?=
 =?us-ascii?Q?42KdNyJhLdDJ+mzqutJbxRVinkImI6TKYOTlSkvL6DQ61FlOCHJ15kqpxrU3?=
 =?us-ascii?Q?RgSvPPFbYyuiPZAT1+yOFVx67oncNL6bdPNFLkj2jLZcCFzUDBm0JMAJvtWN?=
 =?us-ascii?Q?znCkLQo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR11MB7171.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?zc0g/7SjbD2G+ao5tSb2bECwuvlBzMU2k+PAk8WAFa1u5i1EsfcFbeYVhf/9?=
 =?us-ascii?Q?nAZmoM9RnrXaufxB+69jzwn2OKGx/D5CCr5aT1J+SErDsJP6wuMvg1amT9/9?=
 =?us-ascii?Q?ddw21N1+cA8iinCZTHG9wPlhj552fc9ewKJYmDE+xWvs3V99n96n/PuDPY2q?=
 =?us-ascii?Q?z6VuS54VJFiUJ3d/+lGV8khS3nDXiNJHl6dyeUCkiytLmC6l3D+ciFggyP17?=
 =?us-ascii?Q?j02zyKrakdCsa3h1o8Gm3fDAv4bKj86yldyJbaJpmcwlGcMz3rQgg7axoTUi?=
 =?us-ascii?Q?feYmEji5Pgu9j897RBrZNh2nK8W5WCGhYyBUho2bkacOsTv8W5HJGkpb41n1?=
 =?us-ascii?Q?5fppPZtpaaxRxzS2eQTjfvSECqOpCf97VEG7NwhjYlICmyezkBBFdu9amPBo?=
 =?us-ascii?Q?lXZmQhlOlHVHFjargaMbIu4CZEAbOBVmzuwJ42fZwPvuu5dv2N5vxeWV31iy?=
 =?us-ascii?Q?WN5HvKOyIDczuqRxKlHD0x8fPNyZZEH2HpUXi7nQuXUyskgu42h/CK3R5nJJ?=
 =?us-ascii?Q?YIgguHZukqfoLWRREnHuvp0oFzzNws9Vtdbq37zenX5NVVOJLslrJxREz1JL?=
 =?us-ascii?Q?DmDxJk2HSyjRisGz0/qURzcJzv9+bVy+xl8KAmovHChvQ2U58P6AEopAFdrY?=
 =?us-ascii?Q?clEuCwBeqxPU2Jgiff2sMmS4uryqB748yFRVpoPYMN1BtHexTwTIE6U7D+eq?=
 =?us-ascii?Q?bStEvzI97R0FhfvgS9R5ok76CdvV3Ik+qLhQlNS49HasZP07RFeJh02CuEah?=
 =?us-ascii?Q?A1RfnXRSQJSkoAkWpSU39nO2JFLM/c0NY97pihNSFLtErgma+u96g7uqsEnB?=
 =?us-ascii?Q?K4Ozm19GhnJzHudefDJ3d6D0JcQHUzDQIqSCHzG0H9IFTx+60GBBYYBNVO6q?=
 =?us-ascii?Q?GL4MDzuijzNqW/io+9YY43qBSqI/hJ3PKvUSrn69dgSkhtZAmKtGDi11UBgZ?=
 =?us-ascii?Q?uRq8wXwUHLLbW7OZySZH2JBuPmSPflfAST52cm/0skh5xrWhqi+vc1P5OWsQ?=
 =?us-ascii?Q?ZjnJH9GzLvegU6lhUzEawzOQZghB7d7Y0uaBsd9h/QdyqX6QI+ALwdwboRv4?=
 =?us-ascii?Q?fHOrsIBlJyXk4FmAjkl5qsphDe/IL5vt757vP4fsv12CVM3Y2cJisbaPxtKf?=
 =?us-ascii?Q?C/A9y/ydyU9qYXcrM4DE+ikUwGmqwhfQnPIBnyhK/BGsS92iLtj3YHbtU5KX?=
 =?us-ascii?Q?3S22u1s8b4KxGSE4rv10LYIG1fleADyVtqxi8dyL/dM06oUxQqgSHvDfpo/1?=
 =?us-ascii?Q?6dr0iSwkuOfRd1skKB+2EKTQr6S92XS9G1uejP9Ogg2nPYIwh76/wmTUP4GD?=
 =?us-ascii?Q?AQ5wpXQeihdtt/l1xNxCQIcyJfS7HBgAPFtCNQndt5dNpE9KUvlQf1iLIIUh?=
 =?us-ascii?Q?xSTX47p3VnQHwWIef4Pqex5tWuXSwXyf68/ieCDG9FmxDpjuFqJdv7wo57bt?=
 =?us-ascii?Q?ghW2GDhBxaVOjBctlc53maomhEBISKeHLma5FzfdfXA4eQCOpcSIFoB6/Hln?=
 =?us-ascii?Q?SPp3/CyCtcptXCVLuhhda81x7uDLEyXkVKC8OXG5uov0mQAfLHEkt7FuOsG7?=
 =?us-ascii?Q?YrpuJ9PFk1Z7cNbwl0r0MdoRFv47qSJnClomHJvc?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7171.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22e99711-97af-483d-b55b-08dcfc7de2c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2024 03:07:58.5276
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YnJlPHN2tWs0JV/02uCg87OdmBAlpa9X/fYnBk6z+QS8Gn7Q7LMuR/Sz+zPbZm0dJH/0r3H43n/JmCxj1VfC8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5771
X-OriginatorOrg: intel.com

Hi Sakari

> -----Original Message-----
> From: Sakari Ailus <sakari.ailus@linux.intel.com>
> Sent: Thursday, October 24, 2024 6:31 PM
> To: Wang, Hongju <hongju.wang@intel.com>
> Cc: linux-media@vger.kernel.org; bingbu.cao@linux.intel.com
> Subject: Re: [PATCH] media: intel/ipu6: Set the VC of the stream as the
> SOF event id
>=20
> Hi Hongju,
>=20
> On Thu, Oct 24, 2024 at 11:22:01AM +0800, Hongju Wang wrote:
> > In the virtual channel case, they should use v4l2_event.id to
> > distinguish SOF events of different streams. Therefore, we set the
> > virtual channel number of the stream as the SOF event ID. This number i=
s
> unique.
> >
> > Signed-off-by: Hongju Wang <hongju.wang@intel.com>
> > ---
> >  drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> > b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> > index 051898ce53f4..5ad426afa0f0 100644
> > --- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> > +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> > @@ -578,6 +578,7 @@ void ipu6_isys_csi2_sof_event_by_stream(struct
> ipu6_isys_stream *stream)
> >  		.type =3D V4L2_EVENT_FRAME_SYNC,
> >  	};
> >
> > +	ev.id =3D stream->vc;
> >  	ev.u.frame_sync.frame_sequence =3D atomic_fetch_inc(&stream->sequence=
);
> >  	v4l2_event_queue(vdev, &ev);
> >
>=20
> The id field in struct v4l2_event isn't used for the FRAME_SYNC event and
> also the virtual channel isn't communicated to the user space currently.
=09
  How to use the id field? User space should use SOF to do FRAME_SYNC,
  but the v4l2_event doesn't distinguish different streams. Do you have
  any good suggestions?

> Doesn't the video device itself (and the routing configuration) associate
> this to a given sensor already?

  Yes, they are already connected. But we can't use the video device
  to do FRAME_SYNC, The CSI2 hardware interrupt has processing for FRAME_SY=
NC,
  we cannot pass it to the video device.
 =20

>=20
> --
> Kind regards,
>=20
> Sakari Ailus

