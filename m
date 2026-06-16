Return-Path: <linux-media+bounces-64980-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5FRcCn0VMWqDbQUAu9opvQ
	(envelope-from <linux-media+bounces-64980-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 11:21:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D40D68D785
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 11:21:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=CznRUdDR;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64980-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64980-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4730C300053A
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 09:20:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 724BA421EEE;
	Tue, 16 Jun 2026 09:20:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856FF3DB304;
	Tue, 16 Jun 2026 09:20:28 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781601629; cv=fail; b=oUgbVKDoCCjr/oE+Tsz47/7nQqkARXn97mCZdXNTx75nqj+VvEo5kQ37GKOaaWeZIv8qDjjRAxt+LrbWPvsd5vSK7Zg5nfEljQBrk2Gcsi9BER8wksJX1ZPmSZE4jeYn000ycBeyLxNUUiL1JTMC0jU6M+vEsMSoxXPcNCDeiHo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781601629; c=relaxed/simple;
	bh=pGVkH8RKUmO3Hu3wQBJKnM2pv2LqdMd1N4mkyw1uI7Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dCuQ95XeraDU5muESrQxInc2AOIW2ljbbprx45SW6NAkbtGf7mci3DgJgzWrdjckPzToipv1rP45ltAOKdONX7eR4tnbyD0DEomL1J+zenIdo73BB8rrNa1JO1aRDDPU1hNTfktBjrRqQOetnhpayozy6d2rZAilKnX79fwtD6g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CznRUdDR; arc=fail smtp.client-ip=198.175.65.18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781601628; x=1813137628;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=pGVkH8RKUmO3Hu3wQBJKnM2pv2LqdMd1N4mkyw1uI7Q=;
  b=CznRUdDRWnsQDjkskeUSC8zgiv1dFR8Kdqmxj+REptQKMY5cRrolbnWC
   9LTPS4syfj8g/wrAKc2mzV3VTZVYQNwJd4Ai7OzpYPgCkTMbDfFSc79jo
   JH3O5TKfSuyNwkJQ0ukNKMzC5HpL3QFAlsHq78BzJKsrbPmAlKduH7dL7
   smu82g3XpxmmDHQB9RgBngxcXPbo7kmv4pnhWxydlJw2XVZavsQFYExpw
   e5CUKgJcA7z8hwXJmHs6/4ApjL+n/v7GQRjz6u3AfvRqS9hzRla/iVQt/
   x+ypeDWZAQhpuHQ9kR6nbqqiBxf3sidsZLEjNTHYh0/t9zEhnwdEkFMQG
   A==;
X-CSE-ConnectionGUID: hlQlrtJSRaSiYHeKH+fLRg==
X-CSE-MsgGUID: cCClBW20RTukN7mqNDHJaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82424445"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="82424445"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 02:20:27 -0700
X-CSE-ConnectionGUID: bAdvnGAaTNm0ad6VYPuT6g==
X-CSE-MsgGUID: bJ93cf4TTM+eKO3clRvR9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="243348959"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 02:20:27 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 02:20:26 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 16 Jun 2026 02:20:26 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.36)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 02:20:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MNbnQZLDHv2SnAXF8weskxj4/bXHL0OKG3zFrupxEJSO+QDl644qJ9KchUHPxwdbh656/lyk5/aTHf4n6PweIlsokv3/gt/IfMFlHeIcG48ge+QAdB2BCD1AC4nEKaxqyzgGNouHl5oU0uYEsD333twcFml6HlQ7QK/b6KFaoVmHhLyH5hxWw1jEzP5UnWTo2Pm4jco6tR8yXKEK9lLBPHgmZY8xqYybmVtHn/4D6a5vX4f+OyMhTLsrGWGXkGfv9lD+jdUthHADg7wuH89duN/4BPUVKmJJDmMuK6acbJ9p7NXiOdrBz051u/s/iQQiCNIqfr670tnX/GxPRR5qFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YdYqLluIV4LK3UMDZHkIIBX8zazVmupWEMmBGjK+DDA=;
 b=y++VKrJcihWEHB3ZoarClE8Agj+uwAp8aQdv0NxqvdV7qHDO5djKAV5Ej7b4HwRwnE5+AHWFeLJ3pktVJqeBvY32vGYYkBqkMVurCWSrzNpjaCJcaJj0MUHEGEmT32/yIEiVvAMotb+cFxfWF1W/6XX8ZfG6I23ejyC+BPNQTc6PsmS7nfDeeou3PcQQ8egH6ZjtLuiR3pFZ95dSLfAsEK2dWSeGGUBFv3cLxWfmZFW1aZv5JOCDLI/aGwqlxMClB0S78dDgg+PwxIZUg0LaHGPcsXdng04QJSkOOthSVdcsasy/AJlxgYZdSZDId1DAQH9Eno/8SWaSAXZXcC+O6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB3690.namprd11.prod.outlook.com (2603:10b6:5:13d::32)
 by CY8PR11MB7777.namprd11.prod.outlook.com (2603:10b6:930:71::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 09:20:24 +0000
Received: from DM6PR11MB3690.namprd11.prod.outlook.com
 ([fe80::7db8:f6b3:30f8:ee4b]) by DM6PR11MB3690.namprd11.prod.outlook.com
 ([fe80::7db8:f6b3:30f8:ee4b%4]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 09:20:24 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Matt Evans <matt@ozlabs.org>, Alex Williamson <alex@shazbot.org>, "Leon
 Romanovsky" <leon@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, Alex Mastro
	<amastro@fb.com>, =?iso-8859-1?Q?Christian_K=F6nig?=
	<christian.koenig@amd.com>, Bjorn Helgaas <bhelgaas@google.com>, "Logan
 Gunthorpe" <logang@deltatee.com>
CC: Mahmoud Adam <mngyadam@amazon.de>, David Matlack <dmatlack@google.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>, Sumit Semwal
	<sumit.semwal@linaro.org>, Ankit Agrawal <ankita@nvidia.com>, "Pranjal
 Shrivastava" <praan@google.com>, Alistair Popple <apopple@nvidia.com>,
	"Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>
Subject: RE: [PATCH v3 7/9] vfio/pci: Support mmap() of a VFIO DMABUF
Thread-Topic: [PATCH v3 7/9] vfio/pci: Support mmap() of a VFIO DMABUF
Thread-Index: AQHc+PAf4AeqLdLk40CDl4oUXVXjy7ZA8LDQ
Date: Tue, 16 Jun 2026 09:20:24 +0000
Message-ID: <DM6PR11MB3690C5AC479BC8DDA1A7692C8CE52@DM6PR11MB3690.namprd11.prod.outlook.com>
References: <20260610154327.37758-1-matt@ozlabs.org>
 <20260610154327.37758-8-matt@ozlabs.org>
In-Reply-To: <20260610154327.37758-8-matt@ozlabs.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB3690:EE_|CY8PR11MB7777:EE_
x-ms-office365-filtering-correlation-id: 042bd23c-379d-47aa-f47b-08decb887f0a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|7416014|376014|38070700021|22082099003|18002099003|4143699003|56012099006|11063799006;
x-microsoft-antispam-message-info: XMh9/2lVrFzpoXAO8trTXaVFRRsvFXZ+sLp8bAIGXXCzAeDr0/FfUWGaRI64ZKASvkHlSWYWL6tZgodKZRn6yEzipw/Ry6G4YWw/BbKcznVnyHk7QGPwo0tQq6Pyon1EHLHm4rthL5jR2w+yzbfb13fb/pBwhHMO9LuBo4xTAJ2aG2eiS04AtA+Kqpnz0rAdaWwhthq3DVUPz7BYpFIGOGpKTStT+CwxVPgukCD5XQ5egLbXW7c+gusYNtsT1OQly2fOhFbDV4xmUkBxB4j6RMuQgLTw/9ZnqODPnbT6MqDolCklPbh2Q3CaWNfHkVh2FNQwAO2lD6m/Fet3QP+olsLugv8tmw1PyTeV62ckLWYY3vnmIeBCo7YWncxLFCs3IP6ZClZiRNi3SOQX99z+b3KgZ6rkcXuIwTNjBbD8kqHnKzr2h0sFSwv+MPjvNE/QLSOvi19KvdpEs8XWMr4RPlfJok40xUXsKR5e5CoBMfkYuM/6WEcBOSAl8hbDEq3cKj+W+Qu8Wk+hl7aaP1OFcmF0bzISIkaMXpHiEOanFxld/2WEJXZyXsz4KWh7JHuHSGQ26d2piUIDSOfsn/dcqU3Iy5/nZ5GcP3L2F1lzxvp6s31v7iMMobE4RqlK9wzU0KpZT+K7MkQLFLMKeGA+NSsHqTRIzt7QjtqNehgv/9mN/WgJ15e6H/p5Opd+0OvSkwr1GeThDj/CVKlftZdSEXzAvEP/B2MV9mHQy5foTupjpxH0vMPEGo67YpWS5VGP
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3690.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(7416014)(376014)(38070700021)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?jiaykK+NHm45hybI5KzmDmPCbQ3xiYfD33heoHc/STVHw2555fkKUDAVzw?=
 =?iso-8859-1?Q?SEJflW1oKrIeJYVwMDWHOBgRgld4c2tQUbetdzaLxkPLnLr9n4J/TC8PaP?=
 =?iso-8859-1?Q?g3zIFm2AGQwEqi4lv1gBeD1+kp4g5cQjzM38WtqCTvlWLDZHUA498+9+Sa?=
 =?iso-8859-1?Q?RmpES2d9ZO1TUAemtKL222AEmi2uuxOEUJBvbqr5AB1eyKN8aNj7iGGSR+?=
 =?iso-8859-1?Q?x63q0tMTlgK1j+6R5MO6E+D2blbkfd/h4uieu8IDpEHH8F+9T7/363Z5Qk?=
 =?iso-8859-1?Q?8cyfVbTkOt0JA5wtmSCvhRG362mKBMfAed8Jcy3+pDjF/t2F9d6oebN2dN?=
 =?iso-8859-1?Q?ZROpEmk4CMcgnbLkYNmUjD2IDfnAlEKdNm9+dRDHY71uwkDBhQCV/qNSoT?=
 =?iso-8859-1?Q?fnnrzPpFCuGhTsEdfemAbnAExQ0N47mXZIXVBc4ZY+ly9ZoTrupcbOludM?=
 =?iso-8859-1?Q?AyXdTVUd3BJgrCj+UVAGsNZyP0IvRcuSsPXOL/CNImqVsVh2e2llYWoDxe?=
 =?iso-8859-1?Q?d6BD/ZeIpN81pBJlAUc8ZauTwZvxtlzLBC0uIYlji6zj+IMqjQY56jm9OZ?=
 =?iso-8859-1?Q?xkksCUY5b7/JTtA3uRFYhqfe0vHjeOmTXdGBPtvyx27Fzu3Gt3nVRA0B5G?=
 =?iso-8859-1?Q?Y/2oRABm9EQiTmtfIRdlCrhSZxpcMP0M7bvPrCmG9mC7ObhSF89vqgetuA?=
 =?iso-8859-1?Q?dycbvHhLuyDZ18gA7ODOkpv7hNJIELyj5I8bWJoO9D1kuA4hWwKkurlpGX?=
 =?iso-8859-1?Q?KlL/+ZUxLcTp7zUXU4Nl/Bg+OsCUlGFVQRvMR03PYbfZ/pkF/0DHFaBOdz?=
 =?iso-8859-1?Q?GVabxWqQPpzZHYsbg0o2/ZZcSoL/cwYWtjO4gqarcAm/3ErTYMN96Goyts?=
 =?iso-8859-1?Q?bg6/otLz5kD5GfSbVVZ1ACmBFnIJ4enwk43FhXYVp3oD9nQqve89Bic+5W?=
 =?iso-8859-1?Q?swo2ZsP+9R7QPDnD/uv2VlUc6QctgFDi5Jq8gnyvgjbDmOEAodubeHDsLs?=
 =?iso-8859-1?Q?WEYoE8rhZ8omzY0DSqHxLFSjB4J1NVHdnqvXWmFWxquYH5gKfCEo6tlOtJ?=
 =?iso-8859-1?Q?SCfghZ/Cvq2+5qXywSOUWRcGToeD9dCk0PPvN2knieGh45Bf5TUbIMstdS?=
 =?iso-8859-1?Q?2FlVFoN53HxHWQSR0qtKJO/JpUTuW4f5PxooLaqQhNwpLemAz4V45dxZsm?=
 =?iso-8859-1?Q?vo9iEBTVjYKIcB50GJm0kAyhHUEy6gaKx0P25NdzUpDKq24pOnNUa9DI6b?=
 =?iso-8859-1?Q?/Mf5RDSN/2OpG9CdUYos4Xy9mPPUGI7+b/L/HYDcjNyCf64sReGV+6kkEz?=
 =?iso-8859-1?Q?v/DMctRdGYqawwaiVTFl7EUnbUR7fyB39RR/iX5xwNbyiECxlxg3YjNi6p?=
 =?iso-8859-1?Q?XwMJ/MFiy/bhuJkhNNZnaV81QQ792OB5Vuvx4WPZJF0kXAJeIobUbKi1I9?=
 =?iso-8859-1?Q?hG6Hb78FyyjIM0eoQlDYOY3oxSZi09b/r/4vbXNUnt8/bfUbvjXbRZgXS0?=
 =?iso-8859-1?Q?cjT01O4mCJdesdGtphFRa8Oy4tb9AsMGBfXeosiYL4XqaGgg2zoQJMmr1h?=
 =?iso-8859-1?Q?GuhSvIiU7J+jR7ZGj91JQUd/KMKuWFdj70oTd/FAf8RiqE8Um00Qpgetud?=
 =?iso-8859-1?Q?ZIebGiD6qkQA8qrKtUDAyLYHh963sXiltqv2Jy9XOqoSQURMxrWiUlFImV?=
 =?iso-8859-1?Q?GxciVwDFGdvDcFuDrlQ3fvImonhHn49FFE9pHHuR5TPUBEVOmnUS27ue2a?=
 =?iso-8859-1?Q?PUn2dzga4EYW/qI1Za1nKXX+YnqP9Q45/dELQdpF+lq2WO?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: T5hlUp6X8oPPH++rciwxXYGgZt+/eecQ/QZ9II6DSdBqwaepgmYcTEgRn9ouRkBg6qXFxVu94HDUF426XgYmGd7v6GTZvw0hSeuWWkeEgoQHJujnoPuUwBey7fEpRgYc4Wy4nlvPfjREvrzWBUxtmNvotc7Gfs/K59ZpUqLDP2O//vPO971ty1lJis5qSEOTeT47n3fBmsDeD0pZkfXVsIXctEQTFb+KeA17Sq26a7f+wbQ90lyqPeAMZqGyew7sFx6afrR3bHg3O1gZERlPyMGOAI1mco/zYc1cQ1fCyqHpu6XQCCIH0Ix4BgGs6ipzQ/RqU3ZggEjJ6shlW7JlRw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 042bd23c-379d-47aa-f47b-08decb887f0a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2026 09:20:24.0549
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6Q8VT+Xg22WrkuOnF0RCtpFu3UtQhdrWzJ0wj8O8hNXdi9a1WyRDjo5/NLs2qsu/4m1M13UghYJc+6onwVapsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7777
X-OriginatorOrg: intel.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64980-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:matt@ozlabs.org,m:alex@shazbot.org,m:leon@kernel.org,m:jgg@nvidia.com,m:amastro@fb.com,m:christian.koenig@amd.com,m:bhelgaas@google.com,m:logang@deltatee.com,m:mngyadam@amazon.de,m:dmatlack@google.com,m:bjorn@kernel.org,m:sumit.semwal@linaro.org,m:ankita@nvidia.com,m:praan@google.com,m:apopple@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:kvm@vger.kernel.org,m:linux-pci@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[kevin.tian@intel.com,linux-media@vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[DM6PR11MB3690.namprd11.prod.outlook.com:mid,ozlabs.org:email,vger.kernel.org:from_smtp,intel.com:dkim,intel.com:email,intel.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kevin.tian@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7D40D68D785

> From: Matt Evans <matt@ozlabs.org>
> Sent: Wednesday, June 10, 2026 11:43 PM
> +
> +	/*
> +	 * dma_buf_mmap_internal() has asserted that the VMA is
> +	 * contained within the DMABUF size before calling this.
> +	 */
> +
> +	vma->vm_page_prot =3D pgprot_noncached(vma->vm_page_prot);
> +	vma->vm_page_prot =3D pgprot_decrypted(vma->vm_page_prot);

remove the blank line.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>

