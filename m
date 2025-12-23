Return-Path: <linux-media+bounces-49393-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 488CACD83B3
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 07:04:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CB94E3016358
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 06:04:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86BCD2FDC52;
	Tue, 23 Dec 2025 06:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OU+JSRl2"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B12A20DD75
	for <linux-media@vger.kernel.org>; Tue, 23 Dec 2025 06:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766469862; cv=fail; b=MVw21PlnkjbjodsLfynqGkymeWJ5sjClp+i8zBeGBYzAvuT3ki0RblXUM5MRJ25m88cpT9qimTbSjfTdGay88Z8BFqnhR6HoqgkW4JmoqBtBE5LKSGTIQt4Gm9FF6+sHvn/oLG4vI9XrPbX+vKvv05POcfGsGS0Nnai3wQ2TMzM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766469862; c=relaxed/simple;
	bh=IfwqzzovQvEYkC96ErJrvyMXR3ChMov7CixmUSzjOKI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lab/2HMyKShhOl+R4QdI7LM83tgjXRVABcbruL9SdFy9DSM7aHafdlHQYBSYFr1jTmG4nTnhkrs0Qvp2baShjkzbEClSp651HFHAXWVYs0s2038wFmKyxv9uVflztk/PuxWUiFpwi/cSfmIl33D7GI0Q+m9ZYgJ0jp3e1OVOhQQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OU+JSRl2; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766469862; x=1798005862;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=IfwqzzovQvEYkC96ErJrvyMXR3ChMov7CixmUSzjOKI=;
  b=OU+JSRl2SDYpEtCq3fnpeeGYXE8jJWRFRUaisv/0Om56yL1ppgPLIAIf
   L32b7MYO7kuNGsItQh1EMnv6cvQ4JW4y7e4gTq3MtooPH6oIy4beappH7
   76k6JFH7bXzo9lGKOKv++K2PF988yq2Wr0XjMEaPh73qNMTAMEmfxrSLb
   W+SCDaaanvgKRe4NFpqfF30mgR+/TkMLfpxLZNyhMxErxddBlBSqMJoBA
   rJXHD21w8lAQXR6BoCs8JvXQw0wIyLkaxBAtAGaIRs5V2FeAJODq2Eg+G
   P34G5tt1keCmYiVsOONUVuBzn1/+t5V3VGtjuOr9zaeHXzPxtt0Uiq/Ed
   Q==;
X-CSE-ConnectionGUID: kn38LWYETiy9qJgspf5hww==
X-CSE-MsgGUID: v4nSZ2c0RT6B3GgaEAXPVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="68303903"
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="68303903"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 22:04:21 -0800
X-CSE-ConnectionGUID: nw3pfQvSSMmS+Vp0MLnDkw==
X-CSE-MsgGUID: oVmIkFHASgG1zLaiS4wklQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="204654988"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 22:04:19 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 22 Dec 2025 22:04:11 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 22 Dec 2025 22:04:11 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.15) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 22 Dec 2025 22:03:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HT/OBST3hSjfRlVW19jbK5ajegczvcrSP7sZEwy4TBPD5SR2BuXhde1+y/nRRlzgdOzENKC6NKCT9+slCWk/nrbqkMIsrWUs6ELep3aEMM525RfUH0le26Ss/rJbS7znOVxJb545NgoSuhtR5ymnAzPlgcqbvThcRSozi/q+RtxP6G7+ZvEU+tRp/zgf0/m0/GkRcO1JWbvYo/c+3fK04WIXQgftE9JvLLNE4R01ucGDakN6dGJ+hWGa1ptw/xXny1en3sEP/Cu2teWYAtoE5puDP43iAkKtg6Jc58TSdS0W1kjQPRWY4nSP6fCb/mHaPXm+Her8aPBHQQiFIsNFGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IfwqzzovQvEYkC96ErJrvyMXR3ChMov7CixmUSzjOKI=;
 b=Xlwrr9o/nrMMt3UrRU1/qCq2+eC6aCLJx3GXLl0UGFrolSgJZjl/hEf+TiC7vvG20noVHoTbmHnaq02MwrEvMTdoX0kmlu7nALMRoX+6CPn1HSyGB4u2/mMr9qaFF0H+bRAldNiMHlP1IgExqNMm4v3C+t+f+g2mY6del+s/itQBTfSNgPQlGyyoN3Q0wobARD340t1PWcKM7X6rQXVANyGKxuufE5s3yIdhREFhxRgG8V/MN/5E2wqrURG2uPpBm0OU661ar6wcG7bJQ7WwWpNQS8jyzGFaiZfGjBcn0Kz/hyxXKRDIcLsu/Cz9zmJgcfZbLEs6llZuQsgTgb9WxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 SJ0PR11MB7155.namprd11.prod.outlook.com (2603:10b6:a03:48d::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.11; Tue, 23 Dec 2025 06:03:29 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::74e3:c0eb:29ee:fffa]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::74e3:c0eb:29ee:fffa%5]) with mapi id 15.20.9434.009; Tue, 23 Dec 2025
 06:03:29 +0000
From: "Cao, Bingbu" <bingbu.cao@intel.com>
To: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
CC: "bingbu.cao@linux.intel.com" <bingbu.cao@linux.intel.com>
Subject: Re: [PATCH v3 3/6] media: staging/ipu7: ignore interrupts when device
 is suspended
Thread-Topic: [PATCH v3 3/6] media: staging/ipu7: ignore interrupts when
 device is suspended
Thread-Index: AQHcc85vD0YA32RMUU6hrKf2MWPOxLUuu78+
Date: Tue, 23 Dec 2025 06:03:29 +0000
Message-ID: <DM8PR11MB5653FDA7233D3B05B3A4C66799B5A@DM8PR11MB5653.namprd11.prod.outlook.com>
References: <20251223053844.3124621-1-bingbu.cao@intel.com>
 <20251223053844.3124621-4-bingbu.cao@intel.com>
In-Reply-To: <20251223053844.3124621-4-bingbu.cao@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5653:EE_|SJ0PR11MB7155:EE_
x-ms-office365-filtering-correlation-id: 4e8e6d1b-3c48-4eb1-6eb6-08de41e8fe85
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|7053199007;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?vtSEo47XNCe1ntef3/chZoYXJNYyBpnW8GkLkosHmLeEAIousog3iUH9q3?=
 =?iso-8859-1?Q?qWB33ur8lgOYgOczZ6OKzmmi40MfOkjQuPRpF4dmOwY16sdeiJtmbZossj?=
 =?iso-8859-1?Q?RKS9yiLZxohdqIy0KzIlFRXUr47ZYaBoTgy2tsF97BS6h/5U7C9qyjC99g?=
 =?iso-8859-1?Q?GPE5GqmZaMgo893VAk8LtqVbs3xOn+rX15DcSxoGsq9SXpQXsP8bsp/owh?=
 =?iso-8859-1?Q?1QWiLVF+xIuz7oeVF5EpiXad9rBlBsTjkovQNCY4CT3Z4OtVSqVp4O54xg?=
 =?iso-8859-1?Q?9xMq2eJpuT3R/gsKFrIzcJ20d6fvjngQaHl32CothR1JY4hmHzX1vLc7wN?=
 =?iso-8859-1?Q?6EMoA6gM/+3jQ3fDeDR4YBDllu4dNcONJPZNtEQabQTGUChFqhpmbZ3YaW?=
 =?iso-8859-1?Q?nB+v3LoP00B9aluXAaHjyFQgsiXbQqgvu9AKkA7G51SSZZ8DqNBuLYdJg7?=
 =?iso-8859-1?Q?r1llIoyAFl85UmRbRcUFoP8ziu9lpfH+lnyCZ+GltOu57bJQZw2pSdRg7z?=
 =?iso-8859-1?Q?fz6QXc0Vxk8Dsad5pYM1Fd/qW9ae30GOE46uzj67G5BVvBHz6kWpaOpfrz?=
 =?iso-8859-1?Q?RXR+BEPIEiT5ZBFIxBRjLmS1VsCi9MaLGrqOkjemHTsGjxsF9yJ5Kz8Umg?=
 =?iso-8859-1?Q?xSwhGjlpYEIHbW2GsiQ94akgX3v7tdeD4CrA4pwV2D0U4LatpPc4G4araF?=
 =?iso-8859-1?Q?KbiCwOR5jqztghmgnI9R2ci1egJxy3CncOWetGWf6cb54PTa3OGIZsTLYq?=
 =?iso-8859-1?Q?mP9bTYmxWU8OB9jQcJFpMD0Xk/zjXx+9ZIPbqUBlLi5cHnwVnqGBtUsxI8?=
 =?iso-8859-1?Q?+trTPNMQ2ksDvMmQTPHBft78Ohc6JMrRLO9Ec9j6rPO+grnCe/9jaN93Au?=
 =?iso-8859-1?Q?ShgZo9HPMhTGZtXz7UJjJaTkg4ysXbcerVlLU8Ry797VgTD4N51WB2v4Uo?=
 =?iso-8859-1?Q?SJTeIONKciWb0d2uPFUHfKGzKKO+hStWCqv+KykLz41EmnLt6/9uzaLFkJ?=
 =?iso-8859-1?Q?3iKT0uEuR9C3WUSt4b43bY2XhOuo2nP62/Lxt183k0ByyBYsWCwq+Weduw?=
 =?iso-8859-1?Q?aszvc5kiwhzBNr0gjuKlmUnM0q9ImNXL93miU/JCyKMb6N9zI72154X28C?=
 =?iso-8859-1?Q?g1RmuhUCLBeO2uEa7QT9NaVJFLtp1Vxl7STbt77LfKj/OftamltOJ+XZL+?=
 =?iso-8859-1?Q?bqT1xjzimKMZ5htFnIvwQqr0+UrZ4hLVpZQH2bNN3ACA54w7HPCsV6f2z/?=
 =?iso-8859-1?Q?TG3LDa8J+61gEJxDnfqJ02zb5BEq/wkk4YEIaFUruON1K5ZIXVNRMNms0/?=
 =?iso-8859-1?Q?u/Nmt6VLOm22/lbJJUAOd8OfLHCJQzOwKI5c+4AuANBsuBmX4sgk+GH9V9?=
 =?iso-8859-1?Q?c9ceDAduJlKVbryckSCOdhmrMPo41AZepowdYT7IRIAiQJsidgIVM5ywXa?=
 =?iso-8859-1?Q?NLNMKSbSf0wt2c9mnoTdgHC9XHNOrAa75NGKadlc3M0ou2Ah0yhTJvIkNn?=
 =?iso-8859-1?Q?lxbTdLmua8aWt5fCXwjIRHHE+CzupwutHLI/qNDYiwPoPB/l29a8cRUerq?=
 =?iso-8859-1?Q?nOExeyKNmb8iXCbMujpCgJm5Eq5H?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5653.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?eKujp/ioFf2XqhNtAbNuUMSJ11LgnpG9141Qad+1AO8URhkw+mU65gLMZL?=
 =?iso-8859-1?Q?S6AHWxkYTWSPD4/vtCN96+aOEyP3mEKh9O3/6y1njf6Ljw9VsppGHd6PR5?=
 =?iso-8859-1?Q?4+RSs3sp+kPoT5E6/LFAIhzDNwhAK4b3Yf/fqkSlv+WnaO6nbB9m08/Ksh?=
 =?iso-8859-1?Q?+A8WDp1vfSp1HmXGQC9x4ToGN+nTA1NwG2WJACbUvhxXuxtNURoxVj6gPh?=
 =?iso-8859-1?Q?d+vbUvZx/VHFGIOKYlN7PKTlJbfiByE1+0W7MInRNHnsdy99DcyIM262NB?=
 =?iso-8859-1?Q?VyPllx972uWzScn0DkIZw8ABcsxyyHCNEsLFrExhORjtNnnQ7QlYoumKwU?=
 =?iso-8859-1?Q?9O4qRGTK9uwJShs78MlG8pltx68dM85YAUgomnobYNUDUhcVliRWDs0a/4?=
 =?iso-8859-1?Q?tLRcqXv24OrGMPFzS6u509vboTEJlKTPcch22Z2uRJa+F65SUj59zzd2YZ?=
 =?iso-8859-1?Q?eGIxQjonld0hkiIaPrN5Y60/flvRVY0F1pMVzQMO6QKyYl+JaPMHSx28Rv?=
 =?iso-8859-1?Q?DmHPESJsIQ7XkOXOEiWgRUehGTGMUEkaqRFNGxpu8fAChhbK7EFGt2UuSP?=
 =?iso-8859-1?Q?R2swjq+XhKAYD0cZLaksLZtyb3ucxtmW5tqG1Fbr90296SSmSRg7QOkcFA?=
 =?iso-8859-1?Q?NDDYCP5obrQVMD/xn0fJLnhDfL9cV3nCbIrf8EKV5FgNrJkOg6E1k3DX0e?=
 =?iso-8859-1?Q?MqZz/er4RzO72QDPGAevtVc6vMX9ND1rK7A9FLuzBZE2W+F3tUrg8Jvixd?=
 =?iso-8859-1?Q?IRAcQnOE6ys7kpZeWrdP0jZM9TkjjHjgnjChoeCx9OZJ4y2EvzdLuHGAzn?=
 =?iso-8859-1?Q?4Y6Xc+dRzCybhnibVTcQV3M3xT0y6KV2Wm76PKPTIrEEkUwV/i5W1J913b?=
 =?iso-8859-1?Q?3oxWiUkWdmQn8OPElpKlX9lroB/jxUdg4IADvb6BXIeNWB8KKNLPkGv7gr?=
 =?iso-8859-1?Q?akbRIxwE3oTjwvimTk8TA8jH45DPolFmedsXcraYiATTen0rU1vV1KkUPK?=
 =?iso-8859-1?Q?YFKrwpYFmxDWDJh+owH15EV0SXs06yDG+yj3SwuatVf4ryRWtL7MRRuSeW?=
 =?iso-8859-1?Q?pVAfS/9NeUjfZgln3YMVDSIFHWsooHxgOSNHyRMRlxsoN2H654nncShtcp?=
 =?iso-8859-1?Q?PKxeP5mC9qzooajUet/+mTD+BLeDHiUbnzyat/XzpbBDLRH8NsYUTW0v8+?=
 =?iso-8859-1?Q?iNX/UMfrSmQ2jgE6FuVzPbIq1eSm/KMaifNfDMARqT6n81h1w53jnzMal0?=
 =?iso-8859-1?Q?6tBaOIQuQqs5TY4yB9ZSJtY6qFMkRebNHzESYGdaZfPoIUjUaOP/fbowdL?=
 =?iso-8859-1?Q?Jn5P2UfQ7WsioyA/M3rHhNXcMoBd32tKh+K035/YSZgDqVlBcgY8uzbv16?=
 =?iso-8859-1?Q?2WTtFRSnYCfZTzKvfjID3byivc6gPatuBrPo/ujLgwixUnlqSh8DdxEO0C?=
 =?iso-8859-1?Q?mhFe6TG3zvww1kzvokIBGTCs3PqgSRh0d1JTxiRJ1C3eAMZZr7jQ2fT5pR?=
 =?iso-8859-1?Q?Yf6ubcz5jEbo6SAJgfpOiDFSgNaorXNGLUD6/XLVn3Y1gVtqKqtjS3NLVw?=
 =?iso-8859-1?Q?oN/16GQe44Vrr365AJUv2ooLGGfzOnFbYr2pO/vIPDyolISE5FIUPuZSjq?=
 =?iso-8859-1?Q?ACGASKlZxUGps8U686TABdB1ZA7LOA8ZzHw/tzVma5wZhrDrNcxWfFxwHf?=
 =?iso-8859-1?Q?WRv7nsk48xWgl+g0SC0gpLY1dhYT0HcVFttaw2gOfRyCZXXsKJSje2T22P?=
 =?iso-8859-1?Q?u67HBF6bWMkfeTQguEIs+I6XIqzHBos1JZ1AobFZU/yTvk?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e8e6d1b-3c48-4eb1-6eb6-08de41e8fe85
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Dec 2025 06:03:29.1028
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5RGmH8ZDY1E1TfzEWSeO8UB0DTUWNzmJKCyP/z+VnopAURkfhBHu9ADc/PYtUXLUW7PQblh5CJh3F5Ri9vwf4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7155
X-OriginatorOrg: intel.com

Sakari,=0A=
=0A=
I forget to fix the WARN_ON_ONCE comment, let me address it in=0A=
v4.=0A=
=0A=
------------------------------------------------------------------------=0A=
BRs,=A0=0A=
Bingbu Cao=0A=
=A0=0A=
=0A=
=0A=
=0A=
=0A=
________________________________________=0A=
From:=A0Cao, Bingbu <bingbu.cao@intel.com>=0A=
Sent:=A0Tuesday, December 23, 2025 1:38 PM=0A=
To:=A0linux-media@vger.kernel.org <linux-media@vger.kernel.org>; sakari.ail=
us@linux.intel.com <sakari.ailus@linux.intel.com>=0A=
Cc:=A0Cao, Bingbu <bingbu.cao@intel.com>; bingbu.cao@linux.intel.com <bingb=
u.cao@linux.intel.com>; antti.laakso@linux.intel.com <antti.laakso@linux.in=
tel.com>; mehdi.djait@linux.intel.com <mehdi.djait@linux.intel.com>=0A=
Subject:=A0[PATCH v3 3/6] media: staging/ipu7: ignore interrupts when devic=
e is suspended=0A=
=0A=
=0A=
From: Bingbu Cao <bingbu.cao@intel.com>=0A=
=0A=
=0A=
=0A=
IPU7 devices have shared interrupts with others. In some case when IPU7=0A=
=0A=
device is suspended, driver get unexpected interrupt and invalid irq=0A=
=0A=
status 0xffffffff from ISR_STATUS and PB LOCAL_STATUS registers as=0A=
=0A=
interrupt is triggered from other device on shared irq line.=0A=
=0A=
=0A=
=0A=
In order to avoid this issue use pm_runtime_get_if_active() to check if=0A=
=0A=
IPU7 device is resumed, ignore the invalid irq status and use=0A=
=0A=
synchronize_irq() in suspend.=0A=
=0A=
=0A=
=0A=
Cc: Stable@vger.kernel.org=0A=
=0A=
Fixes: b7fe4c0019b1 ("media: staging/ipu7: add Intel IPU7 PCI device driver=
")=0A=
=0A=
Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>=0A=
=0A=
---=0A=
=0A=
=A0drivers/staging/media/ipu7/ipu7-buttress.c | 12 ++++++++++--=0A=
=0A=
=A0drivers/staging/media/ipu7/ipu7.c=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0 4 ++++=
=0A=
=0A=
=A02 files changed, 14 insertions(+), 2 deletions(-)=0A=
=0A=
=0A=
=0A=
diff --git a/drivers/staging/media/ipu7/ipu7-buttress.c b/drivers/staging/m=
edia/ipu7/ipu7-buttress.c=0A=
=0A=
index e5707f5e300b..e4328cafe91d 100644=0A=
=0A=
--- a/drivers/staging/media/ipu7/ipu7-buttress.c=0A=
=0A=
+++ b/drivers/staging/media/ipu7/ipu7-buttress.c=0A=
=0A=
@@ -342,14 +342,22 @@ irqreturn_t ipu_buttress_isr(int irq, void *isp_ptr)=
=0A=
=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 u32 disable_irqs =3D 0;=0A=
=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 u32 irq_status;=0A=
=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 unsigned int i;=0A=
=0A=
+=A0=A0=A0=A0=A0=A0 int active;=0A=
=0A=
=A0=0A=
=0A=
-=A0=A0=A0=A0=A0=A0 pm_runtime_get_noresume(dev);=0A=
=0A=
+=A0=A0=A0=A0=A0=A0 active =3D pm_runtime_get_if_active(dev);=0A=
=0A=
+=A0=A0=A0=A0=A0=A0 if (active <=3D 0)=0A=
=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return IRQ_NONE;=0A=
=0A=
=A0=0A=
=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 pb_irq =3D readl(isp->pb_base + INTERRUPT_STATUS);=
=0A=
=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 writel(pb_irq, isp->pb_base + INTERRUPT_STATUS);=
=0A=
=0A=
=A0=0A=
=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 /* check btrs ATS, CFI and IMR errors, BIT(0) is u=
nused for IPU */=0A=
=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 pb_local_irq =3D readl(isp->pb_base + BTRS_LOCAL_I=
NTERRUPT_MASK);=0A=
=0A=
+=A0=A0=A0=A0=A0=A0 if (WARN_ON_ONCE(pb_local_irq =3D=3D 0xffffffff)) {=0A=
=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pm_runtime_put_noidle(dev);=0A=
=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return IRQ_NONE;=0A=
=0A=
+=A0=A0=A0=A0=A0=A0 }=0A=
=0A=
+=0A=
=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 if (pb_local_irq & ~BIT(0)) {=0A=
=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_warn(dev, "PB interrup=
t status 0x%x local 0x%x\n", pb_irq,=0A=
=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 pb_local_irq);=0A=
=0A=
@@ -365,7 +373,7 @@ irqreturn_t ipu_buttress_isr(int irq, void *isp_ptr)=0A=
=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 }=0A=
=0A=
=A0=0A=
=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 irq_status =3D readl(isp->base + BUTTRESS_REG_IRQ_=
STATUS);=0A=
=0A=
-=A0=A0=A0=A0=A0=A0 if (!irq_status) {=0A=
=0A=
+=A0=A0=A0=A0=A0=A0 if (!irq_status || WARN_ON_ONCE(irq_status =3D=3D 0xfff=
fffff)) {=0A=
=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pm_runtime_put_noidle(dev)=
;=0A=
=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return IRQ_NONE;=0A=
=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 }=0A=
=0A=
diff --git a/drivers/staging/media/ipu7/ipu7.c b/drivers/staging/media/ipu7=
/ipu7.c=0A=
=0A=
index 5cddc09c72bf..6c8c3eea44ac 100644=0A=
=0A=
--- a/drivers/staging/media/ipu7/ipu7.c=0A=
=0A=
+++ b/drivers/staging/media/ipu7/ipu7.c=0A=
=0A=
@@ -2684,6 +2684,10 @@ static void ipu7_pci_reset_done(struct pci_dev *pdev=
)=0A=
=0A=
=A0 */=0A=
=0A=
=A0static int ipu7_suspend(struct device *dev)=0A=
=0A=
=A0{=0A=
=0A=
+=A0=A0=A0=A0=A0=A0 struct pci_dev *pdev =3D to_pci_dev(dev);=0A=
=0A=
+=0A=
=0A=
+=A0=A0=A0=A0=A0=A0 synchronize_irq(pdev->irq);=0A=
=0A=
+=0A=
=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 return 0;=0A=
=0A=
=A0}=0A=
=0A=
=A0=0A=
=0A=
--=0A=
=0A=
2.34.1=0A=
=0A=
=0A=
=0A=

