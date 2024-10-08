Return-Path: <linux-media+bounces-19196-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 303B1993C53
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 03:40:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2424F1C22A5F
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 01:40:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E68B14A91;
	Tue,  8 Oct 2024 01:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VexJGSZG"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E911E50B
	for <linux-media@vger.kernel.org>; Tue,  8 Oct 2024 01:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728351614; cv=fail; b=UE6pfOgVK4xUoPrEIA+/wQXozf3odPrnVNOr8iTJGFN444Vcodqn5TUGKeYjwQzqwsdnzXToUOFVUL4KdvyCVDPLSDgZ2jGMAEwsQln6pEF9RUu2+karOGApcseIHOIeeO0UeANamQJIs5jYexDR2wKDg19z0b4FHpZemYcFo+U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728351614; c=relaxed/simple;
	bh=Fzj/1URe7HxFeiDoT9NqpXE1NVMhE3eiq4OQaCpwqCE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uYPbs2A+lwI0Hrw6nz/qei8cayjkkyl3hxY2Gy8ev/xsuNEPtI4SSaqu2Ps99s32Jci/ov2UMdjsOF2TgmKdVvTxaILx0Ia/HkMptDtkEKc5iMw3+DZ7ka5c4K+7NZ8sPBdPvNM6d2ebsWR2A2c/VxNnTi40w1SmLVI4sGiI2j8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VexJGSZG; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728351613; x=1759887613;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Fzj/1URe7HxFeiDoT9NqpXE1NVMhE3eiq4OQaCpwqCE=;
  b=VexJGSZGElb4N4kAyjZzJljsTmh6EPhpix068t335D+aogwCE3yHA3CO
   CRG9ET+r1CgeAItKwRBKnhb6kZ908peoomDy62OnbKInS7Wom58W5xWyl
   bpsRS6z/pFEK7ObYiTPbmrFMvxj7lhM0uOylU7oYt2Spj1jwCuTxcpTBE
   Ki8GkvQwF8gARh6+/6mlfhQrraoq8xi2GAyV1/tnHud9YjxibgLNo0Wds
   +8WP7uAHjp4z/TLjSTkJwtxTgxe2K8n4Q3wXp/FW1kMWifZDc2yTuAIIa
   cWS3jRdRQWr64VWWY4pmbvrTdQjC/2W8EUTstOGPChpifrXgndxFd7/8q
   w==;
X-CSE-ConnectionGUID: WhLdCqpETZegYYmM8tvNpg==
X-CSE-MsgGUID: MqpwFB1HTqKeHNWrqu+R+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="52925628"
X-IronPort-AV: E=Sophos;i="6.11,185,1725346800"; 
   d="scan'208";a="52925628"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 18:40:12 -0700
X-CSE-ConnectionGUID: NLaZ64IdT7yIGFYjNaXRBQ==
X-CSE-MsgGUID: 7tJ0mWXZQv+o0M3fcvRxSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,185,1725346800"; 
   d="scan'208";a="79647055"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 07 Oct 2024 18:40:12 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 7 Oct 2024 18:40:11 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 7 Oct 2024 18:40:11 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 7 Oct 2024 18:40:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KtprU0ZTlnrJYvxAEkZj7UyO2A1lV/p2kbuAAWvFFBT4ysVTD2hpSr3tPThdXFDwrxcP9XQkLHv3xYjDAJJlgM4cMa18lW6QN2+y5Cy+Hsn2U6CbowpFg6eU6wKMq+PwYXUd1d54dk8zI1MVUgkaluPGRaBhYxd1y6MU/XAs+o97c7oBJOpvY+9V8smQ6bjiRaa1hrXhRo9BVOHLV9/uJZCTzLor4Hhbx/pG3I4WllKrFky0rOppJHyyyhpbcQz0LyjrtfdyXGCO+NP1xmuCCKmZ323XEKb3bwSOXF0gL961+bXw1Gu9PBxYkY4odDJdKMeQj2BrMC159GNypy3TXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fzj/1URe7HxFeiDoT9NqpXE1NVMhE3eiq4OQaCpwqCE=;
 b=H+hCZTKGqZk5+MuwXFUPpdY/c7NsipAB7m2msehSNN/92VDYjqNc2CU8yhoi4D68JKBiW+ZCKhWMrd8lUzS7LtrxiHqjMCzw/GaDMMw8wQ7yvODv/pURQztq9lIUzUjJM54Q5ngXAs23O211hyBJv/RXIQ7PzAnHrkLLHBH/7vVT95NIGiumXF9GQ6XyZh+8NVgGR80/oSfERxJn+Dg1AdqJH4tPKEGNavVmYLIxABWZncmIeD2+s+7R4FViz5Pr19HJkNVNuco3NInDZJkGbJKivEzYpARV6gR9G0z02JcZAFJRznjlGcqkF1SUBPe93VaLSH6beUSG0F1UWU/F3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 BL1PR11MB5287.namprd11.prod.outlook.com (2603:10b6:208:31b::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8026.23; Tue, 8 Oct 2024 01:40:03 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2962:1efd:f912:a5a3]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2962:1efd:f912:a5a3%7]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 01:40:03 +0000
From: "Cao, Bingbu" <bingbu.cao@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "Dai, Jianhui
 J" <jianhui.j.dai@intel.com>, "tfiga@chromium.org" <tfiga@chromium.org>,
	"bingbu.cao@linux.intel.com" <bingbu.cao@linux.intel.com>
Subject: RE: [PATCH v2] media: intel/ipu6: optimize the IPU6 MMU mapping and
 unmapping flow
Thread-Topic: [PATCH v2] media: intel/ipu6: optimize the IPU6 MMU mapping and
 unmapping flow
Thread-Index: AQHa74zKtUs04ltcEEWSiDEWo3sOZrJ1LCWAgAc3EcA=
Date: Tue, 8 Oct 2024 01:40:03 +0000
Message-ID: <DM8PR11MB565321C196D7AC69AABE8EA0997E2@DM8PR11MB5653.namprd11.prod.outlook.com>
References: <20240816033121.3961995-1-bingbu.cao@intel.com>
 <Zv587-LihwNQoQzU@kekkonen.localdomain>
In-Reply-To: <Zv587-LihwNQoQzU@kekkonen.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5653:EE_|BL1PR11MB5287:EE_
x-ms-office365-filtering-correlation-id: 6ceff0a7-0a92-40c5-594c-08dce73a2193
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?L4wHpSAM/wdZMTSnJmSIhwvTLlZkELCRKDqprevrUzE2bnSqeyN4l981JyUh?=
 =?us-ascii?Q?eT62WRlS50SROngL9s6D2zyYwtNxsWx32V1c2V8zEPikERwRLkTQiZgUdaNK?=
 =?us-ascii?Q?CyvChd/LY+Hdep2wXxzMzOGqnkdOkvYaxv71tCIdFLCNqgCa41QtLBcqCkJF?=
 =?us-ascii?Q?09TTVxO4RSiCynUrtP7XkO3lQaOdv1pqINjYGnevu4bUtQSvBNXnM/el43I1?=
 =?us-ascii?Q?nPCq/2uY1Y6a5VbEOiWNzUQOHcG4pZ87tUA1GHx7ZwfKgS18+G3CsjEF5e7F?=
 =?us-ascii?Q?Kwq1hUs1k86m1C0YhdC/IIVbTT7NgSzJ7Pbd0gB6rV68dbA/LqhTbNZ1xhAx?=
 =?us-ascii?Q?PPaAmjjUINxQ1tYX3kIlzbQ6Jpnxs4uYzErbinDy1TisSC4LOiYmM2guTW0w?=
 =?us-ascii?Q?BWcl8oCLK61Lx9xCY6ZhliGaSv2o3c8cDZ8MMJJNDGfUYeIkkeFvAjb6Jw9+?=
 =?us-ascii?Q?CTRmFIaz8eBtkUrsYJj6YTGP4ZQgOyGxXFYnLlZXptOf2DFTBZArz9J/Fe0p?=
 =?us-ascii?Q?DLv4PPiRjh5OmYt57rp2xK1ns9P3ydi/j2TVUPAS102TzNqQTkU5jXtQZjYM?=
 =?us-ascii?Q?eyB+ndNtgr+ruZar7nbhMt6Evs163W2goUn3XoSR+F6C/018BciLO4sb6Ysk?=
 =?us-ascii?Q?nlbBGx3wO+OoWFyoWn7596kQOKbDkQl6Fy5hvxbXtX44lYQQUqeAzfIz2m5E?=
 =?us-ascii?Q?UsXwv8ZJCz5lTP2c/dSHf+7UiyQoREsppVuL7jYAAiPWrognfxeGQ91np7jk?=
 =?us-ascii?Q?TD9y9N/9tbi6c4kr/T+igePpSuzzkSP62MtBYxa7OZyon8FOfNg0kYFd7Wzz?=
 =?us-ascii?Q?bKRPwvWuJfqIL33EeVR9+yGyh5GnauQM7Iry2Hwt8XoeLh1Yi+hW32ZSZx5E?=
 =?us-ascii?Q?jAns3LsIkKFk62n9ma0E45ZN5mZOgUXTqrUz4Rwusq55yCxTSSsh2xWcfBEd?=
 =?us-ascii?Q?QjzuV9E2mWfBL/mW2BWfyPupBWxgKkhVMaq2VmeaRoJwtr5SPhmwGdP+/yQr?=
 =?us-ascii?Q?A6/sp5A8OoA9or0OpU3caGLp55o6kVgvTu/tZMO2ERylbPpwBd3cOPGcHRhe?=
 =?us-ascii?Q?kYPz9tsuEbLM9cDGksl5U2m6t1LBxkPOL86tLZ+nhmy8W5RywDEiGhYfDOuL?=
 =?us-ascii?Q?HX4wVuGlV0EO4cgHW+1JqtAH0cFd7j+3BeeLwNoWorZP9v5WPPrYERMsscG7?=
 =?us-ascii?Q?HHL6cTvL2yQGUhJ/gb5Xz/UIDWF8UhAi4yHpgyCY8SmAThSip4JgwHkWeB47?=
 =?us-ascii?Q?7ZbQW2qboD5VQuEhJzuf7BZQ8yUFPh6A17d6/TORKGt5qBXwpsup7+/bIKGE?=
 =?us-ascii?Q?BkJvC8/FOVLT/vSJZ5emPDhMUx4tsWPAzdcRW+dvw7Gf0A=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5653.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Qe+KUBGDnyWZ2SbD407XMRy/MFTagXyZnIgMPznxr+dfVFaiXOM1dfkhIj89?=
 =?us-ascii?Q?fI12bXRsWUeRjT3WV8uRp/anpmdokQ8qY58XPlVKZOAHRmYGt4JQ3uzH5+2+?=
 =?us-ascii?Q?fn03kAOwBUs7T4VaNFluDYv6T25Qk6xGQGtg28xZwbvGij6t8Bnyd7rcahuO?=
 =?us-ascii?Q?OhREyrNW6pkuNP6WIoi9/6nJZJbI68lYkF5zonvwIO4oME/aXvAzzXYJ9CHi?=
 =?us-ascii?Q?Pz4j7xeSEHyNuHYu4Y1VVKr4lrCKqYkLOk+k8quYJJI7Q4jKU43nI7ap+oSQ?=
 =?us-ascii?Q?0WTEUgf4xe5GUmqZnEJb0hNayjqO552B2Z8xK1J0S272FiPp8oVXfTNxgVPv?=
 =?us-ascii?Q?OTYaKM/5cEJ/TpO8wasceLOYldBfIOCMgPJ0np2GcfGj6jyaYByH+r9MdqIU?=
 =?us-ascii?Q?QwA3nttViZNgT2WJD+3BBz9zPvQgfcsgwFKLaBKnGDnChqcnfGjsSIaQFBOi?=
 =?us-ascii?Q?5uGqfhG8spY3iNn1fo/xo8ON04njmlwjQ84jLZ3Lv9g6O21RSSGjeRMBnXjI?=
 =?us-ascii?Q?mi2r/tRARz5CHWYyjp0X3rlh7ck3P92jLjsN4QtZ9JmpZRgA5exArE1LqHaO?=
 =?us-ascii?Q?J8fiUkCAlNAsd0QjakIJMZ5adGEzvSR5Lz8uizzxX0/EdFxxADNAMmu9gwa1?=
 =?us-ascii?Q?klNrdQP3EZIq3ipgkdheQjzsXnWIHClOSlgBAVQsiKJi9EnRS4ICiVh1UNav?=
 =?us-ascii?Q?dFqRt5CwN4VLF1WxNoVICHP4Xbfgr6kKhcy78Zy+WxaJkuKYlpNgrp9+tusr?=
 =?us-ascii?Q?zBe16ollaAHpO7HR9K2WyKo0bzoremyz17meDcfemjYS2sBotXVEucmpQMEj?=
 =?us-ascii?Q?L+IW8ACvCtw/QKWpjVNCA9Y1iNe0Phc4LDEdragTDTslP7+FlQmE8BQYfaVx?=
 =?us-ascii?Q?GDYSx9e/j/QRZkke83FhRhAaF6xt2xvDq1DBq+BkY7hjOOoU6cP1BrK3Bd3s?=
 =?us-ascii?Q?egHKDSIpguNgGoUKp9JlPzywpgmyw/PV/TJD60HKl9esAkXWI5lsMYupmCtg?=
 =?us-ascii?Q?QaUjQew9XjXqPe7NBYdEQUPN+cplE0sqHDPVhxK7FCeYrtbl4R97DpkRq7F4?=
 =?us-ascii?Q?6gjrOYJJuFzQnNsTNg3Lp+4mOWeVxb68DU6i4SSRp9M+ZCumA2xymwnOwpkp?=
 =?us-ascii?Q?gAYXA28ZJkkz1deREwMTQ9USYxrmOW1DIlxoPpgJ3EICzc7nu3pj8TaMKD88?=
 =?us-ascii?Q?c789DaNGaGqu4pekVCbk6pY7pkzUevGtTUexXJMaO2kRW96Q1uxTU7IW+PjO?=
 =?us-ascii?Q?iV1HJxOCjbg9Neousaj5JVawbpBMOyQAK076QM40tiHwqMjk24FuvBQia0+F?=
 =?us-ascii?Q?quGdRvugH4Lk9Mi8u+94OEhdQDtyuwpTGrilDn5IjzjNF+Xzwaji6wvLF9DQ?=
 =?us-ascii?Q?DmvN3Cvjsib9Bu0leYySXVpr7q4olwBWVg3w6WRMLmHNXS2UQF9fSRoFRrTG?=
 =?us-ascii?Q?FCAB7fTw6ys7KrlEAiVo0YsU0e5Q8KI89hmMowvazoE2uDOsaHcxgDaSsWd3?=
 =?us-ascii?Q?nqPpntr1gwlC1qV2PQCUR0/Ea+ZHabylG7s9kAhBnqWiMFUcT0ZlOvA223Fn?=
 =?us-ascii?Q?IieYDxrHK3yMUE2yHbqzUqp6PtZkCdAfOm6qcRMe?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ceff0a7-0a92-40c5-594c-08dce73a2193
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2024 01:40:03.6808
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8tkazfasIZ4v7/e/emupji+tR9pxqZYcdOQK8hB1ZcS+h1wZlNWrXBhTST3BnPQG7k4j43zI0SDlAQOoX9nWbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5287
X-OriginatorOrg: intel.com

Sakari,

------------------------------------------------------------------------
BRs, =20
Bingbu Cao

>-----Original Message-----
>From: Sakari Ailus <sakari.ailus@linux.intel.com>
>Sent: Thursday, October 3, 2024 7:16 PM
>To: Cao, Bingbu <bingbu.cao@intel.com>
>Cc: linux-media@vger.kernel.org; Dai, Jianhui J
><jianhui.j.dai@intel.com>; tfiga@chromium.org;
>bingbu.cao@linux.intel.com
>Subject: Re: [PATCH v2] media: intel/ipu6: optimize the IPU6 MMU
>mapping and unmapping flow
>
>Hi Bingbu,
>
>On Fri, Aug 16, 2024 at 11:31:21AM +0800, bingbu.cao@intel.com wrote:
>> From: Bingbu Cao <bingbu.cao@intel.com>
>>
>> ipu6_mmu_map() and ipu6_mmu_unmap() operated on a per-page basis,
>> leading to frequent calls to spin_locks/unlocks and
>> clflush_cache_range for each page. This will cause inefficiencies,
>> especially when handling large dma-bufs with hundreds of pages.
>>
>> This change enhances ipu6_mmu_map()/ipu6_mmu_unmap() with batching
>> process multiple contiguous pages. This significantly reduces calls
>> for spin_lock/unlock and clflush_cache_range() and improve the
>> performance.
>
>Obtaining spinlocks and flushing the cache for a page should be
>rather unnoticeable operations from performance viewpoint in memory
>mapping.

Some buffers may contain lots of pages if IOMMU did not concentrate
the pages.

>
>The result appears quite a bit more complicated than the original
>code.
>Do you have data on the benefits of the change in terms of
>performance?

I don't have the full performance data. From one of Jianhui's tests:

The CPU usage went down from 3.7% to 1.7%, the clfush() down from
2.3% to 0.89%.

>
>The old code was loosely based on arm DMA mapping implementation
>AFAIR.

DMA mapping is based on that and changed a lot, MMU part is not.

>
>--
>Kind regards,
>
>Sakari Ailus

