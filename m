Return-Path: <linux-media+bounces-17893-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E94970BCA
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 04:31:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51B982818FF
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 02:31:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F92F14A82;
	Mon,  9 Sep 2024 02:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CZ94z/Zz"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47113FC2
	for <linux-media@vger.kernel.org>; Mon,  9 Sep 2024 02:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725849103; cv=fail; b=qhLGzSE1lLiU6z33c72Z4vxd7IB9XyCVEe5hwUFSY1Ty94o1FVBXslOma8dq6BWC9k+YCp98tTeq4p/uRP2KMQsMo0gUo3qSNAv2iOFhR3Lsh0+WQ9ZpmnnZYz7WkPpyU/MipPsWhtI1sMPtpoocdc1ZIftQ3Zi2KoEzzDzntio=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725849103; c=relaxed/simple;
	bh=SVZnCojL1+jVA1gFoA8dxtv8uK2A0hRGkUyclH8gw5o=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hbbUeGp6er8t3JzAZzSFC3wtKP5ipbJ+xbiIZYQjS08+6wr6O5gPMz5uLDd/VgciktYP/iSCEjDZjsG7m3BjOWzPJcZqMHokiQthurlw2UQ17+Qt6Ja4s6dE8+OITHAPHc7UnhQHTfhS2ldF1MXf8EkKb0WRLRACmnMmq0PN/zI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CZ94z/Zz; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725849101; x=1757385101;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=SVZnCojL1+jVA1gFoA8dxtv8uK2A0hRGkUyclH8gw5o=;
  b=CZ94z/ZzLG05jOJbxItQgyRtdVq0YaP1UD3jlEd9AsmFiIQJN42D17xA
   x1bMjj+OaYfswCcyHi/By/t8nogFHY+J14d+s9NrkR6z4yyfCgT+9Sgi+
   5age6qfneeaCYKk+Pt2Ro5HhvaR+cwqTpj7FhdMZfmMdFkzkydgdsd8YG
   fSgoRqQ4+mNIxGJso6iVg9P2d43sbewriSsnAcwUE0TOThmQpm6XgDqZM
   LrgglIv6Rcm3GTYdEA9/yXatbiqTi5DMvD3R87EoDtL5KtcJZcK9lTAOY
   x1yyhSsXGZuPRhtYpiuAel7HEFTw0oeqW3UTknRQsXAqmPYRh20TVYNrj
   w==;
X-CSE-ConnectionGUID: 3sOcGlkmRc6McZH1Tu5Yrw==
X-CSE-MsgGUID: M7N4+Gs7TYGvYemMFD5sXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="27446644"
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; 
   d="scan'208";a="27446644"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2024 19:31:40 -0700
X-CSE-ConnectionGUID: IhBmacodQi+/sgNXADlXBQ==
X-CSE-MsgGUID: /It9pKE3Q0eSM5FbjoExUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; 
   d="scan'208";a="66497927"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 08 Sep 2024 19:31:39 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 8 Sep 2024 19:31:39 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 8 Sep 2024 19:31:38 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 8 Sep 2024 19:31:38 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 8 Sep 2024 19:31:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aHnznBvlIkDW1FO6Qj6mMqvdp2ttorcjLCL4ST+k6VtbvWMJtFx/OXmzjtjop80MK61mTNIMJZpWSeIRds4+4sEnr6OWy6Odk/VW5lBTEo4cytiGxAZY8DoGcbwKrt+s+JYg8wDtaTWNk6/OQpuV2DCtSPM6Uel1fMhK/zzj1royjKv2YtfNXcKv4+bIKwZG9igOptvMxTc3oeI+uuRni05ee7CtL6Gr0NFJeOgFfBrRcpEZrXuYyso8pdd/42woH+Exu/dmusXEuMCY4WYt3tH2Be3iGt/mYRajNjaEZzqEualPX5pVri4/dOP71O7e1rnSjL4fYjRciElDlu7D4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=09PBip0Hb+A0JoZ1UCfranna8Y/0uCxSoEYJV5oYhwg=;
 b=wE3XcwxdhrTC2xhrLc3l3esxNxIPJWEqlzEH6/ByHdtY8VmXftHsLlUliBvF/Ypnn8Ld5UKctLPQme1c58IzC+gq+TNBAtKQO6xWni8xCOZuz+JG/D/OANk+d33v6wpl4vEQwdP+rXlmNFhLZC/x72cbyZ9uiHbDDpJIpHvKKO8225E7BugEdMDZksdVrYcj5Uwk3BalDEn0qxVkMNGZ4DIhfOxMUR0q+3Xe+43Bw+zvVQKK2yAJ2uRhoOkXXhjdNMYJTGJpm27vE9ZNz8V5dJuHzH1csuHbdgQF+yWWYH/XX6+CQ4gfhbfX9uWUEsj+RElTRLoxLFGfVEUNjxJSdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by SN7PR11MB6971.namprd11.prod.outlook.com (2603:10b6:806:2ab::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.20; Mon, 9 Sep
 2024 02:31:36 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::a9fd:43dd:b77:f01]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::a9fd:43dd:b77:f01%4]) with mapi id 15.20.7939.017; Mon, 9 Sep 2024
 02:31:34 +0000
From: "Yan, Dongcheng" <dongcheng.yan@intel.com>
To: Bingbu Cao <bingbu.cao@linux.intel.com>, "Cao, Bingbu"
	<bingbu.cao@intel.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "sakari.ailus@linux.intel.com"
	<sakari.ailus@linux.intel.com>
CC: "Dai, Jianhui J" <jianhui.j.dai@intel.com>, "tfiga@chromium.org"
	<tfiga@chromium.org>, "Yao, Hao" <hao.yao@intel.com>
Subject: RE: [PATCH v2] media: intel/ipu6: optimize the IPU6 MMU mapping and
 unmapping flow
Thread-Topic: [PATCH v2] media: intel/ipu6: optimize the IPU6 MMU mapping and
 unmapping flow
Thread-Index: AQHa/dsdswfKd2rTN0euj1ihQ8rsKrJOxOdQ
Date: Mon, 9 Sep 2024 02:31:34 +0000
Message-ID: <BL3PR11MB64104AB0623F6660DD34DD3CF2992@BL3PR11MB6410.namprd11.prod.outlook.com>
References: <20240816033121.3961995-1-bingbu.cao@intel.com>
 <874b3dc9-e9f2-3aaf-e994-81d296dbbbd0@linux.intel.com>
In-Reply-To: <874b3dc9-e9f2-3aaf-e994-81d296dbbbd0@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR11MB6410:EE_|SN7PR11MB6971:EE_
x-ms-office365-filtering-correlation-id: dfeb1aac-7c3e-4f66-f773-08dcd0778604
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?rjSTra0t50bGg2ti7kYC9GD6LbUNjTa8MdcWdw3cxZXQa/Brg4WpA8TxLd8W?=
 =?us-ascii?Q?NKhFWdO7SkARL0fx5XiJUf+xxSPOE8fWwVFGYTXIIdn4cDcMlYj0YAe+bxWm?=
 =?us-ascii?Q?EIftvrQVEYA6puEGw+M7zlq6E0pj18SnjqkkJ7pCgg9ZweCQ/vPDfGchrkmo?=
 =?us-ascii?Q?0eJEy/YQTxnCHctitPwbb+rX+bO29C6vXDwWDWVSJmunSnEYOQSBB1Vn3VuL?=
 =?us-ascii?Q?Iz4KIHs3K9+cLqJFnHNTz2MKcsWJAGoV12CCrkmjHLzN5jBl0UKd2pvfVg8G?=
 =?us-ascii?Q?5rijbnAPi0Xv7qvrmBxvY2xBuxq+4aaAzsziqw7ePIg46APJvCbHiyZnut5Q?=
 =?us-ascii?Q?xiJSGkI8BgixqvOix+3vfsirSlWCX0b19OEizFkMrZBqFEl9s5SOLp0qLwRd?=
 =?us-ascii?Q?Pk6ew4x8xn4FMbnxv9hAarNf8n5rhDU1Kp22ySCIKVZzEm9KmJIn2ck1RpRW?=
 =?us-ascii?Q?TT/+m9p55fv/bmy0xxob2frjGmbAYHIq8ZXuM10nLUe6gGj299qYdi7Vwi+2?=
 =?us-ascii?Q?8eubit2za3V1pr+G9YhfVo+WN+Aj/XJRx6X7KuTDSgtXwf1Y+JB/MdWG9Ce6?=
 =?us-ascii?Q?k11tJA/ULOD4No2D9+KUISXaeR6ubfyosI6lB1Ac2gMNZj/8OO4fntbxR57Y?=
 =?us-ascii?Q?zZvh9zfa5D5L/vvnSNZaAD+MObbz64l5YwV4KK8ojPiIz344wmHB7NTKc54f?=
 =?us-ascii?Q?gzFTB+h7qjJfw81ZG8RconRHW1dZM8e/veWa0/pTMAoo7ei5hERqe8HfjW23?=
 =?us-ascii?Q?wMIsk8YeZcVt1hVWhIN0WP9o6WyetVOkX9EYLt+pLjRUpZBCXZuUWEZ/3OLZ?=
 =?us-ascii?Q?Ov5rveFYiD+550sNpYymAyjM/kRw5v8nK1qGaGNBUONNg7IG00jzqEOHA9QL?=
 =?us-ascii?Q?qFkhlEgGNVMlNbajYCaq9xoVVcH+xQR+6HHxATkSwGVkIPiwFiW59eUijFvY?=
 =?us-ascii?Q?Sf6u5BAKAZrQvPBKGknX3/qvxKMnWHfJfuyV2utM1JoBwdvXcXwCbwsjPCS1?=
 =?us-ascii?Q?7ybyBFpd3i7aOPNjiO0/QVdedFRlH+Va+BlRtYQIQoftSYq6PDZZE5ljm6d8?=
 =?us-ascii?Q?QiLiN/Vml9AoHFQVlTICMmzhglJO0WpnobCDm8sY+trrU7Z8qgKW99IixpaD?=
 =?us-ascii?Q?h8n0ztpwhtiALyNdww4uDGnNX7LxnU85ye7nBAyTdKoQ4FGGt7DjG0Jv3yJO?=
 =?us-ascii?Q?T6+YNZHz5KaSnBz0flux3QPHoAAYncNTn4zPWfbvi7oLfMi/nYWYojY32cap?=
 =?us-ascii?Q?SmIrb+OQbWADPDhSHiuNt8M4+JaIxpuyK3zdjdAHd+E0AMpKRz70M+xFQdUB?=
 =?us-ascii?Q?eysSwCUIYZudqzbcNqOWmV4zoLwn3lYUhb4KONPUpM0iG+gEZpgZNc9GDcRM?=
 =?us-ascii?Q?2rL5AOwDrII84ZsgX9ADakjSOchwnK93yYVHmj/X5ezeRJF2Bg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR11MB6410.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BTquyTRhf4XnWz4nJR9x5uxATglK8aV3hrScPPFm5am6zpNqEZm6NXFQ/OmB?=
 =?us-ascii?Q?b9DsYlm+V/yaXZQOqGjGiqtX4F6o//vvtZ18wBzhutRkDdcwVgEbPohFg0KI?=
 =?us-ascii?Q?wLhVVahzEWznRVRq960wQtjh0uWVyuOAp9OpU4bQ9SiYi+8xJZjVOwU28XZT?=
 =?us-ascii?Q?40BWZgWj9Zv+qjtu95usyGRh1wl5w/0OPzorGz4uAjdNvwtC3ggERD4KasXM?=
 =?us-ascii?Q?Cr1TxEAnHQBvuaBsOfnKajoySBo2trfRdtCIoS60iuy3sCgv8AlS2ALUgGXM?=
 =?us-ascii?Q?rnYHevxrqb1puEqby8O7qsJ1DdOXjubD0hhPVeMFDz234jzSWjvCWORs5kNN?=
 =?us-ascii?Q?pTprcRXO8ALlRdty1LJPqp9ZKHDHNJuAso+ZDQFOOcBrIpApkP4EquCFWXcD?=
 =?us-ascii?Q?X3e8jhc8Ycm5hnOaM2al9ZDHMgQqhCwzMdKqKPe5TRtlnOmW6KtXGxjpgbC0?=
 =?us-ascii?Q?31cBkdDK4BVTmlQmzHNieBzmP5ulKdh7v6xw5mCnzuHl+kchljIvUFZ/0g4+?=
 =?us-ascii?Q?C2gPV7220IO4iL6HOKciP3PCnZrD1fuZPUO8OxdDzdFEjvxO9f0drQZ/57VY?=
 =?us-ascii?Q?5DdacOwOEg/A8FWXa7wfEVkkbSF3Wl0kk//A9R3P5eEsqGnmIHI/wAbKg22k?=
 =?us-ascii?Q?x3eKje1fC624rOajKdl6OQ19AKHcDHACzaK2Afr5L0yommQt0Zvsy8rBaDvY?=
 =?us-ascii?Q?oGgal8O54+EAsv69UFapWPrFzeNITIfuvPRq4YOC5B4SICDtvt34mTND+j9l?=
 =?us-ascii?Q?GQqXDuGhQGrFtlSFOKMAxW21dpbNrdwx0SrbzE9GgN5B6y2BF7gz3L2UNO9q?=
 =?us-ascii?Q?AmAkBQhQ285HB6k7DAPD7XqGLqtn4wlvo1w6SoxhiDOLQ60s5p/sctluOtar?=
 =?us-ascii?Q?NS6Tzhc75XK8Q75NS5vd1ElMG+HK/4bCg//Tx4zK417tSAiFf/gtg2lBz76e?=
 =?us-ascii?Q?mUO/5VgVdXubpTD+ebYkpPPBAWCdvaU2i/g6lZC5CSMBxglBr6SrGfI9OjiQ?=
 =?us-ascii?Q?5/YGqnHaTx3jqTEgxD6rwFlbp5Z0dT6tYbBmUptzLXtCmypjOqI1wwVzD4WV?=
 =?us-ascii?Q?9kJLnDe83Ax54i1STtCwE4QIGuqV1Xf2b7KC6NtB6zcluv6fTC+iSSVMMLz5?=
 =?us-ascii?Q?mNTvkOUSW2OBZXpyYw40O1uMpP6s6Ad8j4fDFeVRj8tjDE/FxKGbuY5lRUdn?=
 =?us-ascii?Q?8mLXzNMtl1FqJ1Y0cQ3z5tlWNc009Ed0ON+2UoTAk/Bx7BRiQMpqT872ItH5?=
 =?us-ascii?Q?shN5uvADOkYM3sWrUXnhS11ltbSqmU5Z//MK8s+s+JCNic4W84VMrpvM99/g?=
 =?us-ascii?Q?IZ8xO8ZabsujYBKirX9P1QRu5yIiKkfcmhioE1F/EEw6H7RkwPtluMdSejsa?=
 =?us-ascii?Q?Co3v1meDbihj/JTaSheZOn7sB33UVrWLUQL9e8+gdhqCe6mhsFS9vLPqfNZR?=
 =?us-ascii?Q?Yb8XG8p2w+dDNIQ8n+QHZB6YfXr9MZQuGPzhCzLMrYiXsZWQMs0e7sxXmOXY?=
 =?us-ascii?Q?fdc4jhUI5eWWwdQ+latFOiC1vXu0nzU4GEh5vW5R4gLCoEV5DREIebPkPQmb?=
 =?us-ascii?Q?/bhFfuG4wSXaJWsjK2QqS60MmT+SvQTLmPyAABby?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfeb1aac-7c3e-4f66-f773-08dcd0778604
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2024 02:31:34.7600
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WowpdXE1KGXwLmN7pesD4DlaeuRK82O7VihLG9+gwewwBDja5YEOemvn8I0GHxQ66pxxTOJdqdoFzGqP4aAG6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6971
X-OriginatorOrg: intel.com

Tested-by: Yan, Dongcheng <dongcheng.yan@intel.com>

> -----Original Message-----
> From: Bingbu Cao <bingbu.cao@linux.intel.com>
> Sent: Tuesday, September 3, 2024 4:29 PM
> To: Cao, Bingbu <bingbu.cao@intel.com>; linux-media@vger.kernel.org;
> sakari.ailus@linux.intel.com
> Cc: Dai, Jianhui J <jianhui.j.dai@intel.com>; tfiga@chromium.org; Yan,
> Dongcheng <dongcheng.yan@intel.com>; Yao, Hao <hao.yao@intel.com>
> Subject: Re: [PATCH v2] media: intel/ipu6: optimize the IPU6 MMU mapping
> and unmapping flow
>=20
>=20
> Dongcheng and Hao,
>=20
> Could you help test this patch?
>=20
> On 8/16/24 11:31 AM, bingbu.cao@intel.com wrote:
> > From: Bingbu Cao <bingbu.cao@intel.com>
> >
> > ipu6_mmu_map() and ipu6_mmu_unmap() operated on a per-page basis,
> > leading to frequent calls to spin_locks/unlocks and
> > clflush_cache_range for each page. This will cause inefficiencies,
> > especially when handling large dma-bufs with hundreds of pages.
> >
> > This change enhances ipu6_mmu_map()/ipu6_mmu_unmap() with batching
> > process multiple contiguous pages. This significantly reduces calls
> > for spin_lock/unlock and clflush_cache_range() and improve the
> > performance.
> >
> > Signed-off-by: Jianhui Dai <jianhui.j.dai@intel.com>
> > Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> > ---
> > v2: fix one build warning found by kernel test robot
> > ---
> >  drivers/media/pci/intel/ipu6/ipu6-mmu.c | 283 ++++++++++--------------
> >  drivers/media/pci/intel/ipu6/ipu6-mmu.h |   4 +-
> >  2 files changed, 121 insertions(+), 166 deletions(-)
> > ---
> >
> > diff --git a/drivers/media/pci/intel/ipu6/ipu6-mmu.c
> > b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
> > index c3a20507d6db..2d9c6fbd5da2 100644
> > --- a/drivers/media/pci/intel/ipu6/ipu6-mmu.c
> > +++ b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
> > @@ -252,75 +252,140 @@ static u32 *alloc_l2_pt(struct ipu6_mmu_info
> *mmu_info)
> >  	return pt;
> >  }
> >
> > +static void l2_unmap(struct ipu6_mmu_info *mmu_info, unsigned long
> iova,
> > +		     phys_addr_t dummy, size_t size) {
> > +	unsigned int l2_entries;
> > +	unsigned int l2_idx;
> > +	unsigned long flags;
> > +	u32 l1_idx;
> > +	u32 *l2_pt;
> > +
> > +	spin_lock_irqsave(&mmu_info->lock, flags);
> > +	for (l1_idx =3D iova >> ISP_L1PT_SHIFT;
> > +	     size > 0 && l1_idx < ISP_L1PT_PTES; l1_idx++) {
> > +		dev_dbg(mmu_info->dev,
> > +			"unmapping l2 pgtable (l1 index %u (iova 0x%8.8lx))\n",
> > +			l1_idx, iova);
> > +
> > +		if (mmu_info->l1_pt[l1_idx] =3D=3D mmu_info->dummy_l2_pteval) {
> > +			dev_err(mmu_info->dev,
> > +				"unmap not mapped iova 0x%8.8lx l1 index %u\n",
> > +				iova, l1_idx);
> > +			continue;
> > +		}
> > +		l2_pt =3D mmu_info->l2_pts[l1_idx];
> > +
> > +		l2_entries =3D 0;
> > +		for (l2_idx =3D (iova & ISP_L2PT_MASK) >> ISP_L2PT_SHIFT;
> > +		     size > 0 && l2_idx < ISP_L2PT_PTES; l2_idx++) {
> > +			dev_dbg(mmu_info->dev,
> > +				"unmap l2 index %u with pteval 0x%10.10llx\n",
> > +				l2_idx, TBL_PHYS_ADDR(l2_pt[l2_idx]));
> > +			l2_pt[l2_idx] =3D mmu_info->dummy_page_pteval;
> > +
> > +			iova +=3D ISP_PAGE_SIZE;
> > +			size -=3D ISP_PAGE_SIZE;
> > +
> > +			l2_entries++;
> > +		}
> > +
> > +		WARN_ON_ONCE(!l2_entries);
> > +		clflush_cache_range(&l2_pt[l2_idx - l2_entries],
> > +				    sizeof(l2_pt[0]) * l2_entries);
> > +	}
> > +
> > +	WARN_ON_ONCE(size);
> > +	spin_unlock_irqrestore(&mmu_info->lock, flags); }
> > +
> >  static int l2_map(struct ipu6_mmu_info *mmu_info, unsigned long iova,
> >  		  phys_addr_t paddr, size_t size)
> >  {
> > -	u32 l1_idx =3D iova >> ISP_L1PT_SHIFT;
> > -	u32 iova_start =3D iova;
> > +	struct device *dev =3D mmu_info->dev;
> > +	unsigned int l2_entries;
> >  	u32 *l2_pt, *l2_virt;
> >  	unsigned int l2_idx;
> >  	unsigned long flags;
> > +	size_t mapped =3D 0;
> >  	dma_addr_t dma;
> >  	u32 l1_entry;
> > -
> > -	dev_dbg(mmu_info->dev,
> > -		"mapping l2 page table for l1 index %u (iova %8.8x)\n",
> > -		l1_idx, (u32)iova);
> > +	u32 l1_idx;
> > +	int err =3D 0;
> >
> >  	spin_lock_irqsave(&mmu_info->lock, flags);
> > -	l1_entry =3D mmu_info->l1_pt[l1_idx];
> > -	if (l1_entry =3D=3D mmu_info->dummy_l2_pteval) {
> > -		l2_virt =3D mmu_info->l2_pts[l1_idx];
> > -		if (likely(!l2_virt)) {
> > -			l2_virt =3D alloc_l2_pt(mmu_info);
> > -			if (!l2_virt) {
> > -				spin_unlock_irqrestore(&mmu_info->lock, flags);
> > -				return -ENOMEM;
> > +
> > +	paddr =3D ALIGN(paddr, ISP_PAGE_SIZE);
> > +	for (l1_idx =3D iova >> ISP_L1PT_SHIFT;
> > +	     size > 0 && l1_idx < ISP_L1PT_PTES; l1_idx++) {
> > +		dev_dbg(dev,
> > +			"mapping l2 page table for l1 index %u (iova %8.8x)\n",
> > +			l1_idx, (u32)iova);
> > +
> > +		l1_entry =3D mmu_info->l1_pt[l1_idx];
> > +		if (l1_entry =3D=3D mmu_info->dummy_l2_pteval) {
> > +			l2_virt =3D mmu_info->l2_pts[l1_idx];
> > +			if (likely(!l2_virt)) {
> > +				l2_virt =3D alloc_l2_pt(mmu_info);
> > +				if (!l2_virt) {
> > +					err =3D -ENOMEM;
> > +					goto error;
> > +				}
> >  			}
> > -		}
> >
> > -		dma =3D map_single(mmu_info, l2_virt);
> > -		if (!dma) {
> > -			dev_err(mmu_info->dev, "Failed to map l2pt page\n");
> > -			free_page((unsigned long)l2_virt);
> > -			spin_unlock_irqrestore(&mmu_info->lock, flags);
> > -			return -EINVAL;
> > -		}
> > +			dma =3D map_single(mmu_info, l2_virt);
> > +			if (!dma) {
> > +				dev_err(dev, "Failed to map l2pt page\n");
> > +				free_page((unsigned long)l2_virt);
> > +				err =3D -EINVAL;
> > +				goto error;
> > +			}
> >
> > -		l1_entry =3D dma >> ISP_PADDR_SHIFT;
> > +			l1_entry =3D dma >> ISP_PADDR_SHIFT;
> >
> > -		dev_dbg(mmu_info->dev, "page for l1_idx %u %p allocated\n",
> > -			l1_idx, l2_virt);
> > -		mmu_info->l1_pt[l1_idx] =3D l1_entry;
> > -		mmu_info->l2_pts[l1_idx] =3D l2_virt;
> > -		clflush_cache_range((void *)&mmu_info->l1_pt[l1_idx],
> > -				    sizeof(mmu_info->l1_pt[l1_idx]));
> > -	}
> > +			dev_dbg(dev, "page for l1_idx %u %p allocated\n",
> > +				l1_idx, l2_virt);
> > +			mmu_info->l1_pt[l1_idx] =3D l1_entry;
> > +			mmu_info->l2_pts[l1_idx] =3D l2_virt;
> >
> > -	l2_pt =3D mmu_info->l2_pts[l1_idx];
> > +			clflush_cache_range(&mmu_info->l1_pt[l1_idx],
> > +					    sizeof(mmu_info->l1_pt[l1_idx]));
> > +		}
> >
> > -	dev_dbg(mmu_info->dev, "l2_pt at %p with dma 0x%x\n", l2_pt,
> l1_entry);
> > +		l2_pt =3D mmu_info->l2_pts[l1_idx];
> > +		l2_entries =3D 0;
> >
> > -	paddr =3D ALIGN(paddr, ISP_PAGE_SIZE);
> > +		for (l2_idx =3D (iova & ISP_L2PT_MASK) >> ISP_L2PT_SHIFT;
> > +		     size > 0 && l2_idx < ISP_L2PT_PTES; l2_idx++) {
> > +			l2_pt[l2_idx] =3D paddr >> ISP_PADDR_SHIFT;
> >
> > -	l2_idx =3D (iova_start & ISP_L2PT_MASK) >> ISP_L2PT_SHIFT;
> > +			dev_dbg(dev, "l2 index %u mapped as 0x%8.8x\n", l2_idx,
> > +				l2_pt[l2_idx]);
> >
> > -	dev_dbg(mmu_info->dev, "l2_idx %u, phys 0x%8.8x\n", l2_idx,
> > -		l2_pt[l2_idx]);
> > -	if (l2_pt[l2_idx] !=3D mmu_info->dummy_page_pteval) {
> > -		spin_unlock_irqrestore(&mmu_info->lock, flags);
> > -		return -EINVAL;
> > -	}
> > +			iova +=3D ISP_PAGE_SIZE;
> > +			paddr +=3D ISP_PAGE_SIZE;
> > +			mapped +=3D ISP_PAGE_SIZE;
> > +			size -=3D ISP_PAGE_SIZE;
> >
> > -	l2_pt[l2_idx] =3D paddr >> ISP_PADDR_SHIFT;
> > +			l2_entries++;
> > +		}
> >
> > -	clflush_cache_range((void *)&l2_pt[l2_idx], sizeof(l2_pt[l2_idx]));
> > -	spin_unlock_irqrestore(&mmu_info->lock, flags);
> > +		WARN_ON_ONCE(!l2_entries);
> > +		clflush_cache_range(&l2_pt[l2_idx - l2_entries],
> > +				    sizeof(l2_pt[0]) * l2_entries);
> > +	}
> >
> > -	dev_dbg(mmu_info->dev, "l2 index %u mapped as 0x%8.8x\n", l2_idx,
> > -		l2_pt[l2_idx]);
> > +	spin_unlock_irqrestore(&mmu_info->lock, flags);
> >
> >  	return 0;
> > +
> > +error:
> > +	spin_unlock_irqrestore(&mmu_info->lock, flags);
> > +	/* unroll mapping in case something went wrong */
> > +	if (mapped)
> > +		l2_unmap(mmu_info, iova - mapped, paddr - mapped, mapped);
> > +
> > +	return err;
> >  }
> >
> >  static int __ipu6_mmu_map(struct ipu6_mmu_info *mmu_info, unsigned
> > long iova, @@ -336,48 +401,8 @@ static int __ipu6_mmu_map(struct
> ipu6_mmu_info *mmu_info, unsigned long iova,
> >  	return l2_map(mmu_info, iova_start, paddr, size);  }
> >
> > -static size_t l2_unmap(struct ipu6_mmu_info *mmu_info, unsigned long
> iova,
> > -		       phys_addr_t dummy, size_t size)
> > -{
> > -	u32 l1_idx =3D iova >> ISP_L1PT_SHIFT;
> > -	u32 iova_start =3D iova;
> > -	unsigned int l2_idx;
> > -	size_t unmapped =3D 0;
> > -	unsigned long flags;
> > -	u32 *l2_pt;
> > -
> > -	dev_dbg(mmu_info->dev, "unmapping l2 page table for l1 index %u (iova
> 0x%8.8lx)\n",
> > -		l1_idx, iova);
> > -
> > -	spin_lock_irqsave(&mmu_info->lock, flags);
> > -	if (mmu_info->l1_pt[l1_idx] =3D=3D mmu_info->dummy_l2_pteval) {
> > -		spin_unlock_irqrestore(&mmu_info->lock, flags);
> > -		dev_err(mmu_info->dev,
> > -			"unmap iova 0x%8.8lx l1 idx %u which was not mapped\n",
> > -			iova, l1_idx);
> > -		return 0;
> > -	}
> > -
> > -	for (l2_idx =3D (iova_start & ISP_L2PT_MASK) >> ISP_L2PT_SHIFT;
> > -	     (iova_start & ISP_L1PT_MASK) + (l2_idx << ISP_PAGE_SHIFT)
> > -		     < iova_start + size && l2_idx < ISP_L2PT_PTES; l2_idx++) {
> > -		l2_pt =3D mmu_info->l2_pts[l1_idx];
> > -		dev_dbg(mmu_info->dev,
> > -			"unmap l2 index %u with pteval 0x%10.10llx\n",
> > -			l2_idx, TBL_PHYS_ADDR(l2_pt[l2_idx]));
> > -		l2_pt[l2_idx] =3D mmu_info->dummy_page_pteval;
> > -
> > -		clflush_cache_range((void *)&l2_pt[l2_idx],
> > -				    sizeof(l2_pt[l2_idx]));
> > -		unmapped++;
> > -	}
> > -	spin_unlock_irqrestore(&mmu_info->lock, flags);
> > -
> > -	return unmapped << ISP_PAGE_SHIFT;
> > -}
> > -
> > -static size_t __ipu6_mmu_unmap(struct ipu6_mmu_info *mmu_info,
> > -			       unsigned long iova, size_t size)
> > +static void __ipu6_mmu_unmap(struct ipu6_mmu_info *mmu_info,
> > +			     unsigned long iova, size_t size)
> >  {
> >  	return l2_unmap(mmu_info, iova, 0, size);  } @@ -619,40 +644,13 @@
> > phys_addr_t ipu6_mmu_iova_to_phys(struct ipu6_mmu_info *mmu_info,
> >  	return phy_addr;
> >  }
> >
> > -static size_t ipu6_mmu_pgsize(unsigned long pgsize_bitmap,
> > -			      unsigned long addr_merge, size_t size)
> > +void ipu6_mmu_unmap(struct ipu6_mmu_info *mmu_info, unsigned long
> iova,
> > +		    size_t size)
> >  {
> > -	unsigned int pgsize_idx;
> > -	size_t pgsize;
> > -
> > -	/* Max page size that still fits into 'size' */
> > -	pgsize_idx =3D __fls(size);
> > -
> > -	if (likely(addr_merge)) {
> > -		/* Max page size allowed by address */
> > -		unsigned int align_pgsize_idx =3D __ffs(addr_merge);
> > -
> > -		pgsize_idx =3D min(pgsize_idx, align_pgsize_idx);
> > -	}
> > -
> > -	pgsize =3D (1UL << (pgsize_idx + 1)) - 1;
> > -	pgsize &=3D pgsize_bitmap;
> > -
> > -	WARN_ON(!pgsize);
> > -
> > -	/* pick the biggest page */
> > -	pgsize_idx =3D __fls(pgsize);
> > -	pgsize =3D 1UL << pgsize_idx;
> > -
> > -	return pgsize;
> > -}
> > -
> > -size_t ipu6_mmu_unmap(struct ipu6_mmu_info *mmu_info, unsigned long
> iova,
> > -		      size_t size)
> > -{
> > -	size_t unmapped_page, unmapped =3D 0;
> >  	unsigned int min_pagesz;
> >
> > +	dev_dbg(mmu_info->dev, "unmapping iova 0x%lx size 0x%zx\n", iova,
> > +size);
> > +
> >  	/* find out the minimum page size supported */
> >  	min_pagesz =3D 1 << __ffs(mmu_info->pgsize_bitmap);
> >
> > @@ -664,38 +662,16 @@ size_t ipu6_mmu_unmap(struct ipu6_mmu_info
> *mmu_info, unsigned long iova,
> >  	if (!IS_ALIGNED(iova | size, min_pagesz)) {
> >  		dev_err(NULL, "unaligned: iova 0x%lx size 0x%zx min_pagesz
> 0x%x\n",
> >  			iova, size, min_pagesz);
> > -		return -EINVAL;
> > -	}
> > -
> > -	/*
> > -	 * Keep iterating until we either unmap 'size' bytes (or more)
> > -	 * or we hit an area that isn't mapped.
> > -	 */
> > -	while (unmapped < size) {
> > -		size_t pgsize =3D ipu6_mmu_pgsize(mmu_info->pgsize_bitmap,
> > -						iova, size - unmapped);
> > -
> > -		unmapped_page =3D __ipu6_mmu_unmap(mmu_info, iova, pgsize);
> > -		if (!unmapped_page)
> > -			break;
> > -
> > -		dev_dbg(mmu_info->dev, "unmapped: iova 0x%lx size 0x%zx\n",
> > -			iova, unmapped_page);
> > -
> > -		iova +=3D unmapped_page;
> > -		unmapped +=3D unmapped_page;
> > +		return;
> >  	}
> >
> > -	return unmapped;
> > +	return __ipu6_mmu_unmap(mmu_info, iova, size);
> >  }
> >
> >  int ipu6_mmu_map(struct ipu6_mmu_info *mmu_info, unsigned long iova,
> >  		 phys_addr_t paddr, size_t size)
> >  {
> > -	unsigned long orig_iova =3D iova;
> >  	unsigned int min_pagesz;
> > -	size_t orig_size =3D size;
> > -	int ret =3D 0;
> >
> >  	if (mmu_info->pgsize_bitmap =3D=3D 0UL)
> >  		return -ENODEV;
> > @@ -718,28 +694,7 @@ int ipu6_mmu_map(struct ipu6_mmu_info
> *mmu_info, unsigned long iova,
> >  	dev_dbg(mmu_info->dev, "map: iova 0x%lx pa %pa size 0x%zx\n",
> >  		iova, &paddr, size);
> >
> > -	while (size) {
> > -		size_t pgsize =3D ipu6_mmu_pgsize(mmu_info->pgsize_bitmap,
> > -						iova | paddr, size);
> > -
> > -		dev_dbg(mmu_info->dev,
> > -			"mapping: iova 0x%lx pa %pa pgsize 0x%zx\n",
> > -			iova, &paddr, pgsize);
> > -
> > -		ret =3D __ipu6_mmu_map(mmu_info, iova, paddr, pgsize);
> > -		if (ret)
> > -			break;
> > -
> > -		iova +=3D pgsize;
> > -		paddr +=3D pgsize;
> > -		size -=3D pgsize;
> > -	}
> > -
> > -	/* unroll mapping in case something went wrong */
> > -	if (ret)
> > -		ipu6_mmu_unmap(mmu_info, orig_iova, orig_size - size);
> > -
> > -	return ret;
> > +	return __ipu6_mmu_map(mmu_info, iova, paddr, size);
> >  }
> >
> >  static void ipu6_mmu_destroy(struct ipu6_mmu *mmu) diff --git
> > a/drivers/media/pci/intel/ipu6/ipu6-mmu.h
> > b/drivers/media/pci/intel/ipu6/ipu6-mmu.h
> > index 21cdb0f146eb..8e40b4a66d7d 100644
> > --- a/drivers/media/pci/intel/ipu6/ipu6-mmu.h
> > +++ b/drivers/media/pci/intel/ipu6/ipu6-mmu.h
> > @@ -66,8 +66,8 @@ int ipu6_mmu_hw_init(struct ipu6_mmu *mmu);
> void
> > ipu6_mmu_hw_cleanup(struct ipu6_mmu *mmu);  int
> ipu6_mmu_map(struct
> > ipu6_mmu_info *mmu_info, unsigned long iova,
> >  		 phys_addr_t paddr, size_t size);
> > -size_t ipu6_mmu_unmap(struct ipu6_mmu_info *mmu_info, unsigned long
> iova,
> > -		      size_t size);
> > +void ipu6_mmu_unmap(struct ipu6_mmu_info *mmu_info, unsigned long
> iova,
> > +		    size_t size);
> >  phys_addr_t ipu6_mmu_iova_to_phys(struct ipu6_mmu_info *mmu_info,
> >  				  dma_addr_t iova);
> >  #endif
> >
>=20
> --
> Best regards,
> Bingbu Cao

