Return-Path: <linux-media+bounces-65085-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pQUtCElRMmooygUAu9opvQ
	(envelope-from <linux-media+bounces-65085-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 09:48:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 67976697446
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 09:48:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=jT69YLn0;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65085-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65085-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F1E4301FD42
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 07:48:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A5BF3C1984;
	Wed, 17 Jun 2026 07:48:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FAE73BBFC4;
	Wed, 17 Jun 2026 07:48:08 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781682489; cv=fail; b=uJZmFKN9al37B1tukrh6XJ1aYHL3UMI31UJ13PudVwiuny0KlPV7g0Pm6EkgwChEGf2FSlSfdmjcsbh4J8gM6S8tFlOTv/XpZc6AKlCHJVXrm8WR4fwhJSX5m4SbJMl+twD1/9xY84QAgiKlyjpDrMoy5l0DSb+SPEA+/GtjhAo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781682489; c=relaxed/simple;
	bh=y8jXTX9jnb0YtUckWw1c+J56W5yLKD/uwjoa5d2ouAM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HtzuYlDg/VJ8juC3T29RCTAD8Q/odAs2sLtlOOY+EUsfyWDE8rlh+2SjWCPTTtEcVSbKGnEFeVeBGN/r5/oTw8nCeIpmJCVN1I3gDzefAUGGWKC94A/GHN2WXFVFFjsQHBFCAUR48T4DslG9+pu87Xmm3rzHHLmtteie3BLrIM8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jT69YLn0; arc=fail smtp.client-ip=192.198.163.15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781682488; x=1813218488;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=y8jXTX9jnb0YtUckWw1c+J56W5yLKD/uwjoa5d2ouAM=;
  b=jT69YLn014h/Ru+hqDSXB6EFlcUVyljVq6qzqWZ5ZRF/WgsmftxZVzC2
   CDk7jZJX+tMq7CmmEYHwSraB66Cj3uLDJ2dnXLrXAhAqhv+4pwo+GeFuE
   MkArWEIWg+QrPeG2urBuOSo6P77UPcJ/JUyzFAxXVcHdFqvYtLp/CSzwV
   tzqZBWg2gMQaKQPo7Q6Lwvs9MCsNdgtcAv8QLyXftIJ2actFDPtgJ/sJ7
   GUH6T3TAjmYHDrH8IR3YBtQRC7mDTEJpmy9Lj6yKcUooODAzEUu+lo8pP
   V26nDQhFBD1b25mu29JHq0lts7XyOUkcmg9nkOt7bTlqb6t2ht8YN6Z+U
   g==;
X-CSE-ConnectionGUID: SRAa08q9SV2hA/oWoRzcsw==
X-CSE-MsgGUID: ons7lXmXQpi9jLpoZxXK8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="82560406"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; 
   d="scan'208";a="82560406"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 00:48:02 -0700
X-CSE-ConnectionGUID: ABQMgZ15TVKVC5Le7k1ihw==
X-CSE-MsgGUID: VlTcue6PReaU3iMe1ans1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; 
   d="scan'208";a="246859504"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 00:48:01 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 17 Jun 2026 00:48:00 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 17 Jun 2026 00:48:00 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.16) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 17 Jun 2026 00:48:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ovFkb9bNMLSb8KItVCGyyBFS9Dv5OSCGfSHqXOoMBCIYoTLpFNKoEBU9rb3/yJZCDvpfj+ea8X6FoV6BtZ85M6od6Ma/W92/ZbHWeDRUOBt5UEPfek48wApyP4QJtTbGAzk3tH1nCYZxCj6wovfFGpbE2i3RDH6Q3AG12PYX4cn+EWfycLfq0jDCQ+YGUnCXmu1fIBOyugF3pw7shHOfMeaQGIVKOG3ZYRPn1wyEO22gpfJAg3Ka5g910BZYuo0txe/MvDMWiqa1NuP/tdLuZW/ji0EscoB1knyOzm+mQFoOKyMojFARa3iApYr/kccuLKHKcNBcdPCkqwo9yjACIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CUd8t1eyQAoUvU/E3IxZGJPRRFchGaMAUuIRnP6vLks=;
 b=kSupIMxKKDqJdtaD+EofSoQEoM5NnmgGQJ3+y91Mk+EoORAanhZ/7wHLBRhYkIRm4HNHVhm4q8kGkpDfsh2+2MdSH5pl6HdovwmfvdJkRF26vxHSPXGpZgTm+wj9JjcZmCd3ZWgs+wJnzcCTx0lY2icJ7fxfIc/ptIU3Q6B3y4QXjDe9wtGgZhGy/rvB2pa3eyzHLokc047SajmUM+1qfHnVICRdxOFebWKIBOdFxifnnQUMkmS4tSt3JSm8c2rxZHvFO+zuC8gzrE4Om5cKbF8PB0w+noo0HHnfkNuhvkVH21oCe/HWzkyyANNadKAWaVKuSKYHLh6P+T1Qta48Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB3690.namprd11.prod.outlook.com (2603:10b6:5:13d::32)
 by CYXPR11MB8754.namprd11.prod.outlook.com (2603:10b6:930:dc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 07:47:57 +0000
Received: from DM6PR11MB3690.namprd11.prod.outlook.com
 ([fe80::7db8:f6b3:30f8:ee4b]) by DM6PR11MB3690.namprd11.prod.outlook.com
 ([fe80::7db8:f6b3:30f8:ee4b%4]) with mapi id 15.21.0139.009; Wed, 17 Jun 2026
 07:47:56 +0000
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
Subject: RE: [PATCH v3 1/9] PCI/P2PDMA: Add CONFIG_PCI_P2PDMA_CORE
Thread-Topic: [PATCH v3 1/9] PCI/P2PDMA: Add CONFIG_PCI_P2PDMA_CORE
Thread-Index: AQHc+PAJt/yTpFL68kOaE02G6F2lPrZCaUBg
Date: Wed, 17 Jun 2026 07:47:56 +0000
Message-ID: <DM6PR11MB369079ED83A213AEFC0EFC458CE42@DM6PR11MB3690.namprd11.prod.outlook.com>
References: <20260610154327.37758-1-matt@ozlabs.org>
 <20260610154327.37758-2-matt@ozlabs.org>
In-Reply-To: <20260610154327.37758-2-matt@ozlabs.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB3690:EE_|CYXPR11MB8754:EE_
x-ms-office365-filtering-correlation-id: ba9e9e7e-7d74-4c28-3c24-08decc44bf13
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|38070700021|18002099003|22082099003|11063799006|56012099006|4143699003;
x-microsoft-antispam-message-info: aJDSBc6hJ+5FCa3fcPyQwXfPojyvzeJnxpo2y2dCbEBuB26/DYfOGH8LcBLtKVBLGg9HSnqavVoqjAnZxNJ9Mhsnb0aYwprW7sYxn8LCYZ20ixt/MXzD86PaQyRDS1X8Ji40kh+Pp/3N34WiF+1ZrLfiAByNxZPKUiPwck0Shx3EZJCSI4tT5h1nkj4iL4Dyru/mcAWCTpS4QaQhh4fwL8CHtg/90BgJJZUjEiSBPD7WFKUT9QdGu3GcLjXDsKYRVwDNNiZF5r+y7daWb7z1eOwvd39S8KTdcnegs9c2S0yJ665FApX+0SQQUT/q6Vvnc6pz5jMUjowLsIQhsZ0aQWg80RqPSYfickS1dRmBPXs1etvQ0FCEeIrrMIGKcneyfUPKSqxDtuZHDWXN9EGgjIX9N8JHGFF0kT6+EziOBspu7ICSEhVQZ6Md1ooJPFLvqAkysbR28i1SVzy/3eLoY+mXl91kiq6nx9WvCfd+JfO4BEO8K5QR9dSSWreod2kEa4nnVf0dgdsMpnJybeR1yfA00Mx9/ZQdL1urtoM+nyqCqJs8VKXQEL74BETplJ2jLA9A6BQdPBbqfEoamQlaa99DaQltUeopUciR6LkavNvfxjd1D1DSL+uJcg1R+9HAwO/bDF8AVWLct01Mz8EFEKWZlgn4oVS8QDWsKpdgbimQ0IiJQS4gw+ZukIf3WihAcNhD0d1VNT6ioNymEMX30cT8j+28IynjzBs1Q1yaevyL4rgSomNT6DBOhz5rwI9F
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3690.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(38070700021)(18002099003)(22082099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?qSC1m9kT9Ijzc3se+s/eBz8BSmI6mzZBTUxDYflhbemc7l99HKyiAbVS+3?=
 =?iso-8859-1?Q?KsXXCsTCNefjw/wfiMFsf1c43uJEbkS1SCWGPeBT0AcemdQCtsMpbh9Tdw?=
 =?iso-8859-1?Q?Cy6oMPqn2qSmimnWbtnOIUZhsDiESDFMv0ETdyfupR75FmP1m00iy7axt0?=
 =?iso-8859-1?Q?Y5IOo25TuCLgoiC5JbMWJU5VzyEEL5acq0yxMVqnEeIKOJDsYpg6hvZNre?=
 =?iso-8859-1?Q?YsBpK5AhNJDxeMwgfCz5SWmHJ5ULmy5dLPKRafCgc21NM1uPNaG7HlYoCe?=
 =?iso-8859-1?Q?MDsC0Yo4jZ0gXUgI/pRR7TONA2zjoOpGRUnv4fzxK9aqsLO27qrQ1sKaS+?=
 =?iso-8859-1?Q?ZNwFsY9B5AtITjePFp193nHSI/cpc5D6KfpmfG4ITmuobAO0RmGaJzRZ1A?=
 =?iso-8859-1?Q?26G4F8Uc2in5AtZo+SwKFslxp5zxiLlxpa0vRwQ/ClRd2feODSrps8R4+z?=
 =?iso-8859-1?Q?JG7WapIDfOZ9JaJRAzHrt92VP6W7SC+l57TKAJkafw2lUM0nUifCTb8Ck0?=
 =?iso-8859-1?Q?RmY2Ar9ghfjyB9b7VWzjDlzQFseLDCVs/YOF/kffJPPeKKrG4u4VWc8bi6?=
 =?iso-8859-1?Q?i7ktJpWj41A4uuYCWeYupgiDcFu8c6Rye2NI9sek5D7uLijx4f9WtRsa9b?=
 =?iso-8859-1?Q?8unihpjD+OAKiV1QX8AQJbKTO6I7ohWLaI4XUrgXm9luUApvVnZTuQUYZk?=
 =?iso-8859-1?Q?oNIAgjjJlENHOav6gvR6Lwlnft/wXfYk00QBhKaUFliU9hBjg11+bMAbIX?=
 =?iso-8859-1?Q?IKHejshUcPMxrajA2s3ecd7hfIRMj5ndDdHC9U+9oeS+mhWKUVpJEYjGWB?=
 =?iso-8859-1?Q?AvcSADJgRJYPF8R0WnZBb+BGeff8OLA2t+6oEcnaShbfTQOVAOwJkGDkTU?=
 =?iso-8859-1?Q?8+hworUQt0HVR3mEKRIDv4vklSCv+VOSQ6y8BxQGKb1LNcvk29PVe471rX?=
 =?iso-8859-1?Q?FffS06//2zIIkbJ5CSDhAiGqVIx7yYM6UBpVHAnJkosSPotQWZ6MM/jSra?=
 =?iso-8859-1?Q?gI88d2HT8UJHMYFaId/QCYGTLTqh+0A49LK3ZkJlQOyYNagBgSTREWbTGt?=
 =?iso-8859-1?Q?KEF7qxNB0Xb9+GkiH68a0HZjhj8lwrp/u1wj7taEH0hT+UjDZM0nFhs2k0?=
 =?iso-8859-1?Q?0qDEYITue0U4bFUY5S40/8aGew24nIREiLfJ2uqnf+JfVfvlhWO9FhkrPL?=
 =?iso-8859-1?Q?e5GYJc3S3GurFLA3Lts5RVmzV9egAKmwwFAAPO9dVa9DViIVn34SuKrRdH?=
 =?iso-8859-1?Q?gE+cBgSmS3iz/dWG9TI2DefzoXlTxlrES3fOXYq8MHiohiC3kqxIK1z67j?=
 =?iso-8859-1?Q?WzyP4vm7lPOLGtnV6/iwFsRxQ3jOye8pth+bvyczG5j9WKpWjhg3sjaV3z?=
 =?iso-8859-1?Q?GEBBSrSz8kAlfpIiZJDvO+pAA3SdPHj1OqX6U4D9InocAa0jQE+IbEjNA4?=
 =?iso-8859-1?Q?RzSrpaBl73cJvCSHtTN5YLR/IeDPWB5zGrlZdhJbeH1wqZSDa/8rTqla5W?=
 =?iso-8859-1?Q?2JhzUnJ7ovFfM1JtphO7UNE9xhA8G7ms09cnjsD2FG7Ru/EaoxP/Ct1Dtp?=
 =?iso-8859-1?Q?9b8u056WkoEKA9JIrB3I3Tj1n+s5TZDWko1VpBeuGF5ZEfZcH87RA+4MYW?=
 =?iso-8859-1?Q?Fa4G3QprTxNlJF0uYpEncLrtkT0SaZYiOA3UUWEqV7EI0t8r4iCkjT5h2c?=
 =?iso-8859-1?Q?eQTdnKbalQRL5B+dRGZjSoMia2W57sImq/skWB6B/XU4RkCjTJ7ZBBW2PK?=
 =?iso-8859-1?Q?YkY3z27q/gCK+wRGH7tfC4e0FmTtE/fFO4wc02gx7QREs2hUjn2pRIJVa3?=
 =?iso-8859-1?Q?xs/oRDGOhQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: RsHAoPlZ1RlG29pygxYLUrypSfiVm1FKIod+ASbHCxNyDQVPHQJd0D0QX2C/7z+IeIyk/Kf49rixzt/N7+OryFpdIuA4u8nifXlTYDDhAq5lmH8HUdR/TzMkzBACyxjmhlUUhURrmEQfob1y+Hl0ixJtPxLHydvDaf0RUfNx12mEJEMTcowTG4ZAzv2Zbpia/IqyEQD0K9fJNORg5l1Ksr+vBRz83g7oWBk5fUH03SfuQrdFy250Z0VnXkefZdv5ffnuerHD+S6NVp6b5RSbrFYhYDiuCd3IHej0O9EowcQ0V9raoXlioek2zd3FtO/FHvdJeY8IbZwj36NBrZWAeQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba9e9e7e-7d74-4c28-3c24-08decc44bf13
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2026 07:47:56.8358
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7RR8LBzm/O5PCjqH2IaXFCiN5E4OPNHQjBGp6ZTnGMFv7UU+ws4Dz1Lq9KwVHM4NdkSaozbrLJxLGm7xsPd1yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8754
X-OriginatorOrg: intel.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65085-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:matt@ozlabs.org,m:alex@shazbot.org,m:leon@kernel.org,m:jgg@nvidia.com,m:amastro@fb.com,m:christian.koenig@amd.com,m:bhelgaas@google.com,m:logang@deltatee.com,m:mngyadam@amazon.de,m:dmatlack@google.com,m:bjorn@kernel.org,m:sumit.semwal@linaro.org,m:ankita@nvidia.com,m:praan@google.com,m:apopple@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:kvm@vger.kernel.org,m:linux-pci@vger.kernel.org,s:lists@lfdr.de];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2600:3c0a:e001:db::12fc:5321:from];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER(0.00)[kevin.tian@intel.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ozlabs.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,intel.com:dkim,intel.com:email,intel.com:from_mime,DM6PR11MB3690.namprd11.prod.outlook.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kevin.tian@intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[10.64.159.146:received,100.90.174.1:received,192.198.163.15:received,40.93.201.16:received,2603:10b6:5:13d::32:received,10.22.229.24:received];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 67976697446

> From: Matt Evans <matt@ozlabs.org>
> Sent: Wednesday, June 10, 2026 11:43 PM
>=20
> The P2PDMA code currently provides two features under the same
> CONFIG_PCI_P2PDMA option:
>=20
>  1.  Locate providers via pcim_p2pdma_provider()
>  2.  Manage actual P2P DMA
>=20
> Some drivers (such as vfio-pci) depend on 1, without having a hard
> dependency on 2.
>=20
> A future commit expands the use of DMABUF in vfio-pci for non-P2P
> scenarios, relying on pcim_p2pdma_provider() always being present.  If
> that depended on CONFIG_PCI_P2PDMA, it would make vfio-pci only
> available if CONFIG_ZONE_DEVICE is present (e.g. 64-bit systems), even
> when P2P is not needed.
>=20
> To resolve this, introduce CONFIG_PCI_P2PDMA_CORE and refactor the
> basic provider functionality into a new p2pdma_core.c file.  This is
> available even if the CONFIG_PCI_P2PDMA feature is disabled (or
> unavailable due to !CONFIG_ZONE_DEVICE).  Then, drivers can enable any
> additional P2P features with the original CONFIG_PCI_P2PDMA (available
> when CONFIG_ZONE_DEVICE is set).
>=20
> Signed-off-by: Matt Evans <matt@ozlabs.org>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>

