Return-Path: <linux-media+bounces-64979-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9bKnH6EVMWqQbQUAu9opvQ
	(envelope-from <linux-media+bounces-64979-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 11:21:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DC33368D7AB
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 11:21:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=kOKQ0jWS;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64979-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64979-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B1F0930972D0
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 09:18:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E11C42189B;
	Tue, 16 Jun 2026 09:18:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418D5397699;
	Tue, 16 Jun 2026 09:18:16 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781601510; cv=fail; b=euPkCO9UD4mwadN/I7rFgPKAM9mtBj7CoApyuKb2IjIU9rVYkkFUlXaZZ4d7HCby/VRHrR/XGkGuVzoGUFnT9Q1DuriywgnoZsI2toiBOaj4gw1rQP7nkq7plyj+/z1ulBeHUIgtcFQFtDCW9eLf6CE4DVYeSXTYykYMOPnrAWs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781601510; c=relaxed/simple;
	bh=/z4gfBjvaSCKwiZmEZfin2WxPQPTEM3/+W2Xi5y6O+c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iFE4TPeGoDCyKlL4bIfnpwms6njOm4PVxvNQbELM4vg3PPtYGLMs2OUR2Wl2MJ7kkKwK9rEMtmfa6aT62gTn9n7PPw1oGGSupCZUAm9pCaA9NsvxjnQEjMHdicf8CZvf1Kmjatpeu+aK82ty2yFFifD2Ay+k0Ia8l1qtOMaZJd0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kOKQ0jWS; arc=fail smtp.client-ip=198.175.65.19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781601508; x=1813137508;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=/z4gfBjvaSCKwiZmEZfin2WxPQPTEM3/+W2Xi5y6O+c=;
  b=kOKQ0jWScPvKoyI9lvnHFbPrZGTRPiigVcbmz7KyulMjmTGLlDpTfoMv
   Ycj7tFoJ7T7YG43VGqokYwlE3XR2+c13vnF8lioImZTeiK+B2rPTdfrYL
   t3Utjdwm2KAhbdkMNdQsImk+1ltDzps9kDu0bqb444p4Oqexxp4ZxdVPx
   EWTCRhXiAe4NukGLC4MbqBqHMts4uh32nXstNZhDEN4aHnosBGeiYXaQk
   5xKOQSKYaoeADWuG64TCOJVow+RWkdWz0U60JthSsq/fA9dOEyMND7cG3
   XJyODV2ONb7Yrv46m0qaIgeKpZCYLol9cMpzvFT56+GiX6t0kv9eF5MLd
   A==;
X-CSE-ConnectionGUID: 540jKd6QSZ6rQwuspp3vJA==
X-CSE-MsgGUID: jqLmnGFDS1uGnTHHBQMLQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82347134"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="82347134"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 02:18:15 -0700
X-CSE-ConnectionGUID: lZiJa12ZQ+S5E+tqjOGV2Q==
X-CSE-MsgGUID: RT9vP4HuSDODf8TWEaQkDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="249612518"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 02:18:15 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 02:18:14 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 16 Jun 2026 02:18:14 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.43) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 02:18:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YCawg1uP8WwUDkwQnSsayCo/r9YUv9ZfiBO1NBkih66Duz6YD93O0/d0wXPi3ty7QP+R6wWOvsbytKFpq+3mEqAN9fWmBhm/MguKSjPa81R5C3Ea2MyX9FtOCcfZKbvBjOP3JlEeX73d3+t84ghOMk3ILelIcEU+g87m0V5+2sVm1d4pvbUUIFIWHcdhM2WungYNizhyhPV8HMFesPx6nYBPDHbTQDdq/kYcQl91YHRbgtdNMP5Ossi5t1kOPPhnpsVJ3U1v1OQg7NJsCIBhxsqcpvT5dRLsrLcVVRyH8vOoru/OumcfMdvV3rcDclltm1QxPjfgfuL23jYPlsUvwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DTu4Wz1X/swhQ5Wot1kQ81exdlvxuEM5CnXCP7yLkKI=;
 b=M7Z7421NCjKiUzSOEUNIUCvehGquBqwRaIGTQCZAQx9Ak0WNr5y6D+ybfhGWW5ud10jA5LrEXJgasucFpuYs5fyUIRR4vYJepX3QDDP0IPyr+WtCWg0qjLT5MMl210c8LABHCRoGiC4h51xCyDOOcAwmfEhwPpuSBxRuc1bZKnegITQHsSAsJsqPeJ0tmEpDFXF1K48iGo8S+nwYDQvNMMV1K+vYEkM9iHFGSwZQih3PZOt+5gK1R6PRqHTP9q3voX5LJweRRLvaj3r4U0oChS414fyPrbEccpqbamqMG2dKe6KumoE8qUE3F1CrQm/v3nfvqCMQmrvj8L1pXdmENw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB3690.namprd11.prod.outlook.com (2603:10b6:5:13d::32)
 by CY8PR11MB7777.namprd11.prod.outlook.com (2603:10b6:930:71::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 09:18:12 +0000
Received: from DM6PR11MB3690.namprd11.prod.outlook.com
 ([fe80::7db8:f6b3:30f8:ee4b]) by DM6PR11MB3690.namprd11.prod.outlook.com
 ([fe80::7db8:f6b3:30f8:ee4b%4]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 09:18:12 +0000
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
Subject: RE: [PATCH v3 6/9] vfio/pci: Clean up BAR zap and revocation
Thread-Topic: [PATCH v3 6/9] vfio/pci: Clean up BAR zap and revocation
Thread-Index: AQHc+PAbYETvhcTyrUu/DN8Pu72QKLZA7eCw
Date: Tue, 16 Jun 2026 09:18:12 +0000
Message-ID: <DM6PR11MB3690CA709415069FFA5121838CE52@DM6PR11MB3690.namprd11.prod.outlook.com>
References: <20260610154327.37758-1-matt@ozlabs.org>
 <20260610154327.37758-7-matt@ozlabs.org>
In-Reply-To: <20260610154327.37758-7-matt@ozlabs.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB3690:EE_|CY8PR11MB7777:EE_
x-ms-office365-filtering-correlation-id: 476c51f0-b4f8-49dc-147d-08decb883066
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|7416014|376014|38070700021|22082099003|18002099003|4143699003|56012099006|3023799007|11063799006;
x-microsoft-antispam-message-info: eRNi1u3C/BYF+ENG9WQg943nCU5pX35J6PFs5APrSH7lgnoiuSm7/KPN/OE+23PDBLeKCqYx4JvYk+y2OQQwWQqqx08AA9Gw2XsyMJVJgIt6Lb0uMuXG0lIeXGkbuy+K+egk4ccUhW3KmkpsBr6vskQJQTjlKoH1W4h9HMPBtzTLpEYwGw7GoyQ4f31KhlVYK9Iimc6+kzpfp0mDu53wkLf3YaJQ1f/kCgegRLuSMx6vfnxyiHeXW5NuESAix77WUvm3fDCWMyJKDtw/E+gK7SBNPgZ1Kbg/xV2IF/PJXHkrYr0qEhY86ajuqrNNLVA6WCxcbodsoWfa+cBZNVLcrNIBUn9S6uPfh70N4twkrhMXpxPqxKWcneNKZmcCJN0vIV0pMh5Q/CPboyPfgzDkk1AkukqySn8WjCcH4e7V8UH6ZuDfhbLHQe9pu5mQYkijCRj5875TikWJc4qPDx6sB5NnWqbzLbegtPsOlOgm4Uv/bKsI1Lg+yG4cmSRnv3pucGA5tTtj09uzJqDdE5wqFAQ9CoZ51Fg1AGn+erQEQg21TLDh4ezo44CvdqMS6cADWBI6wSb4zriYmTfcMdFghJxSbL4laD1vgGR/DUUpzCRcQ0N8juiWOU2SRFTQ02BM/6ARuZuSxev2q2R7bvJN0iNH21zgCvVDJKLGy4+Nikrtbgif5yfp6PhOzNUk6DRD0qY1PsmlxaGrIlW9t86Ygj7k1p3r7DoyykYoBJuoF4YxUD6dWaI4Ff4t9k4b6aOv
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3690.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(7416014)(376014)(38070700021)(22082099003)(18002099003)(4143699003)(56012099006)(3023799007)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Q1UblXzsvVxn+5jtbJpcIus+SSNFqbORyDEJUcC3Ae/C6QCUdJNJjeMYVW?=
 =?iso-8859-1?Q?1wuXMtSRfKCZueU8ha1O2mAxcpiB4N2nrl/4K77U2O05TV3qv5tvmZ+tpt?=
 =?iso-8859-1?Q?/7xJXqNLLxakXCstDKGQlOxEdOa8wgOlUOb2OtAs/dQwvg5eiAQHxa0QsP?=
 =?iso-8859-1?Q?HKDxCoB/nGrWaTG5S1Xp4nbKVIwMJ4SqPk6P+xomKc7Ef2tYYqLA0zjnLQ?=
 =?iso-8859-1?Q?W2zfQSoUeOMyG7qM3Zt6jQwW0+Pz/oQt3X5tdfRo6oIHOd7VWc6RmjZlcQ?=
 =?iso-8859-1?Q?bfivhySiC1MyyY3s0F2czCOXSvU/KVdt+xMzkeyN5jiRaBeOAMLq5ZhCCT?=
 =?iso-8859-1?Q?WFNc3hbGe73GDY3cV3HK+fDAl/bhKLFwE7xab0yuAyLIp/FPwh9FjGK12v?=
 =?iso-8859-1?Q?j8QALYt7FlZuQSBVIR0T00ep1tiAXKAaMgsfroC8RcRvy5KjvrqxjNadZB?=
 =?iso-8859-1?Q?LkE3sTZoSF1sXyC3hcjH87WjqNuU6HOKyybwgKjUK+19WhDWZkK9Aly16J?=
 =?iso-8859-1?Q?ttMSaqBqX0Qds3iO+i9eDiOjLiQD0s6pUpL9QvSt7UlIzo84Wd5U8JtutI?=
 =?iso-8859-1?Q?UWpzYSOPNJ+iPTwhPOxcfdVjcaaY7aZtu+3gKmzsLx23gmozqxmTqk/E47?=
 =?iso-8859-1?Q?7jAvD9eMrKet8FdI+X5eP0v/C0S6NftNhGp3pBNBXBm9pb7xyOboSEyT0p?=
 =?iso-8859-1?Q?nHX5zS5a9FeCNboN2GxmCR1w0g+FH0kfYJvMlvcewA3NAL191IUJzJASIB?=
 =?iso-8859-1?Q?p5VMbsxjlrAD7sUZWTDTvEjtgMobxS7jYFqQuAmmHjDemL/MD6Eh+9mrBP?=
 =?iso-8859-1?Q?9wy4Dug7wsln04p7zyCp3CC0qYboIVES0eGdctXsY9geYzKpnLYQsFoCHr?=
 =?iso-8859-1?Q?lQIGTywFWGOazLMlbrZcuUZPVLe67dlS4ceeJ+STWVhYqCkzuyHeeG9den?=
 =?iso-8859-1?Q?Dqf9NYE0ZhBDzgrSZF6NkCz4GJlc5JgyjJFSsxBEcMqU0yLLz7ggUyS+uy?=
 =?iso-8859-1?Q?PUDhyy46t48Ir6aUP/LYD5KuILcSi9YdkinWva9dr47xgpI9WGhZFDkCRd?=
 =?iso-8859-1?Q?kfWLa+ama12B6UPWD/ESEviiHB04n2LS/9SIjw1nKHWVUQNfbsLkoWMS5v?=
 =?iso-8859-1?Q?ETbtM1vpKwJiwoKdpEkbLd0TKnXwqg0C0YZuUXJ9+eqkzDR7NbNCbCVNGY?=
 =?iso-8859-1?Q?ejRcJDpw5NhDUopFlYi5s51a/6gQ5A0inUMZCnuB52LMxfTUoPWP3OKWUY?=
 =?iso-8859-1?Q?TRKeQTnnzP6go08YtanNqJySKJ+FG4Lwy0d9kt3y5EH8kAY7hAPdqU6Cgh?=
 =?iso-8859-1?Q?W3+RNWRPu+Yd2Ru/ao7LSDWmA9PypmusUIsLVIAdfJiRJ/rd5nFMJLqYrJ?=
 =?iso-8859-1?Q?H6/H2KinLYzlAd2H/Asn3TaZumKUeiTQKrVWLMVPJ1vhMBHw/2gdOOhzab?=
 =?iso-8859-1?Q?uw7Hf2zmMSAOeODxbHR/MQ7xj1cC2GhINKhsHCEkwwfa8h4CbpH1Bu1JAb?=
 =?iso-8859-1?Q?LATT+5IuG3dODkyC7u5fMeBJzKEeU1jINQtcykr9c1cMVudTtbeVlUuuKj?=
 =?iso-8859-1?Q?mAcetttbF+RV82BHNK+baRPGFA9BZlczi07jxEhe/cnzgvrs13yWlvqvnS?=
 =?iso-8859-1?Q?XT03Woi/3ljRLBZQvRvErm82UTnFxMlPOngz0WvVkIhvLzpkyU/CjMhc7C?=
 =?iso-8859-1?Q?BrYqIjUG2nGG2pKWeaisjQ7HJireYlmpKwYY93SYty/AUY3oVnFzPSWsct?=
 =?iso-8859-1?Q?Fo8/4ztnbHXlFIHUJBbVMEW+qbTFI/5VapCb32w5c0JKlorknSz3Wv1cAN?=
 =?iso-8859-1?Q?ufYD0OOhCA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: HoIdOWK34CoOozZENlb8GGrt/a3xR9IhmVONUDUb+uF0nJxti/5POpqqAcSB7Ou70BtgHWycdS0UEIqtB3SvHWuTxvbtFMYQeqLpGl6VBh4Q6VII2EGvdsPgO6a3vFJ5roukA4uBXfldFl4e6aYh0CvDqxciVw8mYYk6Zq/zzlf42Na8pYbSiP17I1RurZ5atp4CusU5aEA9KM9F5xDxgCH8T+xu6BNATjNiOvK8D9b6De3fGBhVFT573lNp+pNY/biyQD39FctiopFMBKLXIM3YoadYJ5HNONnQUpJHXjJCoMzxHua90CEiYk5neeksmeA+USRQ8gbR7QVX1WG+Mg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 476c51f0-b4f8-49dc-147d-08decb883066
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2026 09:18:12.0735
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dUGHXJUQWP/vQtqRe966HKl0HbvIlJXLLBdwiyLhju2UtazPq1EBnWX9y3OGambjMTOEmhv32bhqfZ/DyS1C/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7777
X-OriginatorOrg: intel.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64979-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:matt@ozlabs.org,m:alex@shazbot.org,m:leon@kernel.org,m:jgg@nvidia.com,m:amastro@fb.com,m:christian.koenig@amd.com,m:bhelgaas@google.com,m:logang@deltatee.com,m:mngyadam@amazon.de,m:dmatlack@google.com,m:bjorn@kernel.org,m:sumit.semwal@linaro.org,m:ankita@nvidia.com,m:praan@google.com,m:apopple@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:kvm@vger.kernel.org,m:linux-pci@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[kevin.tian@intel.com,linux-media@vger.kernel.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[DM6PR11MB3690.namprd11.prod.outlook.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:dkim,intel.com:from_mime,ozlabs.org:email,vger.kernel.org:from_smtp];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DC33368D7AB

> From: Matt Evans <matt@ozlabs.org>
> Sent: Wednesday, June 10, 2026 11:43 PM
>=20
> Previously, vfio_pci_zap_bars() (and the wrapper
> vfio_pci_zap_and_down_write_memory_lock()) calls were paired with
> calls to vfio_pci_dma_buf_move().
>=20
> This commit replaces them with a unified new function,
> vfio_pci_zap_revoke_bars() containing both the vfio_pci_dma_buf_move()
> and the unmap_mapping_range(), making it harder for callers to omit
> one.  It adds a wrapper, vfio_pci_lock_zap_revoke_bars(), which takes
> the write memory_lock before zapping, and adds a new
> vfio_pci_unrevoke_bars() for the re-enable path.

It's unusual to have three verbs (lock/zap/revoke) in one function name.

I wonder whether it's simpler to have:
	vfio_pci_zap_bars_locked() 	// caller already holds the lock
	vfio_pci_zap_bars()

'revoke' is just a side-effect of 'zap', not necessarily to highlight it in
the name.

>=20
> As of "vfio/pci: Convert BAR mmap() to use a DMABUF", the
> unmap_mapping_range() to zap is no longer performed for vfio-pci since
> the DMABUFs used for BAR mappings already zap PTEs when the
> vfio_pci_dma_buf_move() occurs.
>=20
> However, it must be assumed that VFIO drivers which override the .mmap
> op could create mappings _not_ backed by DMABUFs.  So, the zap is
> still performed on revoke if .mmap is overridden, using a new
> zap_bars_on_revoke flag.  A driver can explicitly opt out; the flag is
> cleared by the hisi_acc_vfio_pci driver, since its .mmap just wraps
> vfio_pci_core_mmap() and so still uses DMABUFs.

the cost of unmap_mapping_range() is trivial when there is no mmap
on the device fd.

so it could be simpler by always doing:

	vfio_pci_dma_buf_move();
	unmap_mapping_range();

and remove the flag.

