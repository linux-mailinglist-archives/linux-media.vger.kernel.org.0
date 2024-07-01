Return-Path: <linux-media+bounces-14440-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A7991D763
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2024 07:22:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6471281015
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2024 05:22:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C72022C1BA;
	Mon,  1 Jul 2024 05:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TYtf2o2B"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E3122084
	for <linux-media@vger.kernel.org>; Mon,  1 Jul 2024 05:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719811349; cv=fail; b=LNiRaAsa16TfBMTE4FHYTI2G2jedISOWeynWIJGLgAI+0pAB9FsgDG0uzckfVyM6xkru4Sg4hRFPvCyOjnTmso/5j3dfpSVSCTN0Hhvo5IuQp/1tf2EQpRTRa+Or2oLUSHWd5ua39hG4hU1LacF6gK0BzpWZm6Wgl1QZJvrNAME=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719811349; c=relaxed/simple;
	bh=VhyEIhr9pVuK1bG2Zna5jp8DtLsx11bGqGJXXNmuFzM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=M4tp045dFvUzmzqxKCQZTadOy8xQp39edptLi0Wdw/ONwT2AXo1EXLWdvwV2DbDh8Yte+Sq5Z2wRkEM9Kjo/9GA+uKFJZVFxk8mrYp2OxaO7PJ3L1pamf2hcrfZnudYLh1LcUjPnnBn+D1TUajEC9wYDuXN8Uat5blgWtjkTfJw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TYtf2o2B; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719811347; x=1751347347;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=VhyEIhr9pVuK1bG2Zna5jp8DtLsx11bGqGJXXNmuFzM=;
  b=TYtf2o2BevcgaFV+AfPbmAS6xQ15lx6cvMiJOt6ELz50BP0HMT50/ZMX
   GLivAs/bKXlY2zDC4d+eJnufHo3/Le3HVITyEZG1ILagKh+eJ9kTK+2iR
   +q27oBnKtWJegE24iht7KArGfhpxysfp1YDnSFBiuW8NP8la5a4mf4WRy
   KYT12g5/FIZJWPnR02d9XFKkfhNokGasRZtTG/lWSMFZqaiFQhPSJf+qc
   lqCPYmpiKxolBxpwpXEHzDfAaB1+1pWQj2HBjhO2TG2l4HC0BrEusQODe
   Fu1t9R8nV4jh/Bx2IlkZkrZbfmiPn6ONOUPs60eswLkjWaEs5LmIrSEQN
   g==;
X-CSE-ConnectionGUID: ffeyUzjpSC6uY/ft740CWg==
X-CSE-MsgGUID: VB87qit8QuWDaEPl0RijEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11119"; a="16864783"
X-IronPort-AV: E=Sophos;i="6.09,175,1716274800"; 
   d="scan'208";a="16864783"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2024 22:22:26 -0700
X-CSE-ConnectionGUID: BjDIP2vfStCRpVahpRsFtw==
X-CSE-MsgGUID: wRMtNe8CSfe39iWrjgI9OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,175,1716274800"; 
   d="scan'208";a="45363867"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 30 Jun 2024 22:22:26 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 30 Jun 2024 22:22:25 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 30 Jun 2024 22:22:25 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 30 Jun 2024 22:22:25 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 30 Jun 2024 22:22:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=clk2epFhcgV48FaJFoxTBqvVpljF/VJmr4+DKQgwH54heLFvH8poP8lm5aFI7BuHPvIXOiefdzODpL3IsEs9VueRIgXFCEv3797m//2YtbcIuyTB5s8sy2K+pGMyYxW07JijtTYShX5sTPn3Tv0Ws48GoQje+TNNmg+MhqwOyr7LydWZK7p25s4iBPaXR3gBhXXEvpjyQva9NiXazahpCLdETd1Sl2aLfi9uSw4Ses0TT/cFEBtQWXmqWZw0cLHgGvKkaALqNfMIwkjWhXgqqws7g/RF/FdhQX7l5kh9nb6KFlXu3ZGsi9RLT4OEtxdHN02y9IzZdpsH0h14dDjPGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VhyEIhr9pVuK1bG2Zna5jp8DtLsx11bGqGJXXNmuFzM=;
 b=RrpdhnsczcvA4XtZLpEmsqHtRRFuiIWt7O+OmvnoiW9bUF6QG1dMlq1SNFdYKFgSO02El2McBY4fCJYIEUvCM50uSOQpK5MXX70tk2okNOtIBy8ZTS5s7/LtmiLxynQZ7JfJYiEe668HEjwvjquXeRYKe7Hb0KgaMnesZzpCnUYzXed0Ub7f/wMz6cD345R+rLCQhJjnqCYtkCdFvOcrdbt/OXfUa/DVyK3zXbkkkCXt/xO6t/a2tXhDCfDNSGHb3tGyAUw3P0P2PfpTIWbaUQlj2h73fFZ/G/BhkbHcVEykMni4AzsL3RLDk1nnkBfrr/3GuSP4t+ajCogZN7VFAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6415.namprd11.prod.outlook.com (2603:10b6:930:35::8)
 by CH3PR11MB8436.namprd11.prod.outlook.com (2603:10b6:610:173::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32; Mon, 1 Jul
 2024 05:22:23 +0000
Received: from CY5PR11MB6415.namprd11.prod.outlook.com
 ([fe80::279d:ac44:3bb4:eb4d]) by CY5PR11MB6415.namprd11.prod.outlook.com
 ([fe80::279d:ac44:3bb4:eb4d%3]) with mapi id 15.20.7719.028; Mon, 1 Jul 2024
 05:22:22 +0000
From: "Yan, Dongcheng" <dongcheng.yan@intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
	"jacopo.mondi@ideasonboard.com" <jacopo.mondi@ideasonboard.com>,
	"bingbu.cao@linux.intel.com" <bingbu.cao@linux.intel.com>,
	"dave.stevenson@raspberrypi.com" <dave.stevenson@raspberrypi.com>, "Li,
 Daxing" <daxing.li@intel.com>, "Yao, Hao" <hao.yao@intel.com>
Subject: RE: [PATCH v3] media: i2c: Add ar0234 camera sensor driver
Thread-Topic: [PATCH v3] media: i2c: Add ar0234 camera sensor driver
Thread-Index: AQHavmap79d90fDsfkejR1xd0l7sSLHhLrXA
Date: Mon, 1 Jul 2024 05:22:22 +0000
Message-ID: <CY5PR11MB6415FADB231C59A49880BD6AF2D32@CY5PR11MB6415.namprd11.prod.outlook.com>
References: <20240614080941.3938212-1-dongcheng.yan@intel.com>
 <20240614142432.GA5468@pendragon.ideasonboard.com>
In-Reply-To: <20240614142432.GA5468@pendragon.ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6415:EE_|CH3PR11MB8436:EE_
x-ms-office365-filtering-correlation-id: 2b909c6e-5e18-4d42-ee7e-08dc998dc978
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?SGtlSXFVY2syRTNEMWo3SlVTZ1Nwa3ZoQ1poR21JS2pIZkhITjlwTWJzVW42?=
 =?utf-8?B?K0MveGxyZ3hvaVhOTjhUTm93WnFjNGRjR1FsL0x2cklCVXd4TjM5RGRRaUIw?=
 =?utf-8?B?eE9RNkIwNUJjSXJ1eUdPQ0VNNTZPV3RYTFhmVzRNajBxRXBSV1JlbytvMkpC?=
 =?utf-8?B?bFJ5OWp4ZmQ3ZjFVOWROc2ZlTnIydEVDMW5zSDVmT2pkQXh4S2JXNlFETVov?=
 =?utf-8?B?M0xRUmxBZkRrYWl1c29tZ1Y2TWN4bUc1bjNEQS92djcxT0lTRGZQT1p1MjAy?=
 =?utf-8?B?WUF6ZFk5SVZrZGtTci9wYVI0SjVaSUtVRUU4bkRoMGlQSTBqMGZ0cmhXVXVT?=
 =?utf-8?B?R3FIcjRxSDh5NmJPMWRVRlRPLzkzSnZvRDhZMjBpS2pxbUVRbTBpZXJGbSs0?=
 =?utf-8?B?a3hGUTFXZk1yaGhhNURJSnk2eXQzVThNcVpkMzlORWI5L0lWNnVrZUN2aXFu?=
 =?utf-8?B?VjhxZkkyRFZVcGFOYnQ4Y0Y3Q1FGQ1VwR3NySVlndXZ2TzI4OFJWTE9ER3gr?=
 =?utf-8?B?cGc4azJlYm9VL2UzYU1zdDBadnhOSmdEd25ibHVuZDk2cER4bGlqQW1tM0Fx?=
 =?utf-8?B?L2ltd3JTQytvdkJJYUJwRXFXMG9MQ25LL1J5ejBUMVp6RmxVYlRNc3Q3cWZh?=
 =?utf-8?B?ZE5JV1hOWWt5SUZnL29YOG1UbXdtQ1lhV3ZYajF2R21IRm96SEFnTDdRa3Ri?=
 =?utf-8?B?czE2VTdkN2tDaU1tby9NRkl4K1RvTHA0Nm9jQ3FuTmRuUU95TXdOeGM5WWxZ?=
 =?utf-8?B?SnM3NDNwTzd1MTIxOGRxYnJtQkxyRUhHVzFaaG8vSnczb3BjVk5FWGI4d2ZN?=
 =?utf-8?B?LzV3MC8ya2E3ekZid3NWcU5BWWdJbllkRmQzOU4ySlc1Q1VBcUM1OGpTWjdD?=
 =?utf-8?B?dTZXWEY2U0xGWGVHT25wT0RUdENVZnJRdU9ONzRkakFEakt5ZzBZQlpub3E2?=
 =?utf-8?B?MUpET2Q0YzFPdUdrUzBaYTZwcnhwZExjMnJ4V1h1dGtpU2I3SlRrUjlQNnpH?=
 =?utf-8?B?eFpkVG1uL1NEU1pDUzdHT2txTDJwR2FDZ1NNbSs4RWJEL0VsZWc0NnViT0Zk?=
 =?utf-8?B?dWhoNlpzTkF4cDZnZTA5R2xTRTM3aDBZZkdKd1NDSE1COVJ1MXcwTlhlMFl3?=
 =?utf-8?B?YWxYaEVNRDhWdDBDNHFSZ3VzaUxtZC9VM2JQNFpLSmpZYUpYOEFHT3ljNkZL?=
 =?utf-8?B?VDE1NHB0aEtYYURjMzZ0Wmt0dlA3aGxZOGFyZkJYa29OVkRObWRvUXprWHVK?=
 =?utf-8?B?ZVZtNWhnV2Y4Vmt0aDZwQ3JpWXRJR0RlT2MyN2tnZ0xXdHdJSTlxVHJRaHQ0?=
 =?utf-8?B?clRWTm9aZ2VndTkvT05nZGh0b2VONEFYSWtaNzl2WHB0aGtQNUNaZUVIYWNZ?=
 =?utf-8?B?Smk1L0JWbEtUNmFoZjNQUENHTTA4cFNpcVU3NHhGRm1mblkvZ1RReXlSc284?=
 =?utf-8?B?NTV2aGExV0NVYnFjMENGOHFhc2kyRGNpSTFtK1J6dE9lQXc2MmN3akNDTnBy?=
 =?utf-8?B?WS9PdXBSSThkOHF6L2xYa2N5cDVlWEJHS25uTWczR1ZoMlJmT3pVL01MZ1lX?=
 =?utf-8?B?amtGY3JDKzluZ25DaU1mclovZ1E1Ukg3RC85VkgwMHgrZDVJdHFVQkhQU21y?=
 =?utf-8?B?ekdXdzZWelIzdVV3aDhQYnoxb3JtQkl2YzJxS1NQYitZUm9xYjV2UnNRenE2?=
 =?utf-8?B?WTlMbVV4U0Z0L1NVbTZMek1aY1lha2FMdVRRQ0d2RkFQNXlGMXhNVHZVZGRz?=
 =?utf-8?B?Y0FROFI1bGw2eWpMWTJXSUFETy95bUpZMUFTZG5Vb0xNQ3c2cHlaeVpBVmh6?=
 =?utf-8?B?Z2o4eHBpZThYM1dVRzhXWi9qK2JZaVoyTitmSFNoUjBXQ2ZuVGVnMWxCdWJo?=
 =?utf-8?B?dEZZK0xXN1AzVDFHWFJsQjJFOExNRmxWcGY0M3ZhUlRTZUE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6415.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RERuVTMrOEg2akNES3hRRE5WbUNiZkNtdVR0QmRIZzdFK2xuaWFhMkQ0K2xN?=
 =?utf-8?B?Qms1TUtBVnpPZ0kweStyYXAyL0hVZXd1cFNkMTFCZTFuN3V4WFdyamw0SUdt?=
 =?utf-8?B?UUlCVzJUbEZpaVVrTm92YTBwVjQrVGxhWHh5Q0wwQmVmdWllcGZPdnBkZ1NK?=
 =?utf-8?B?ZmwwUFRjUTBiellCTDZlRGdBSy9GREFKWFcyRGdGRitKcGpuYTBXTm81eVpM?=
 =?utf-8?B?bnJscHYySTBTVEtVYitjNU1tcDVINUM2QTlqYmdOc1RyWDdlRHNvMkhmM0c5?=
 =?utf-8?B?WmRYR2RlN3cyU0F0QjBtd0FILyt3OE1rRGRVTnNGRXNJdzVwTi9pQU5oeGM5?=
 =?utf-8?B?YytpQ3BlclQwcTR2c0czbTgrN0NKMHBWVjExem14OTJRZTl0ZmFTeUo3cVoz?=
 =?utf-8?B?OTNpem9MWEc4VzhMSFdraUN6UzFydU1JQ2UySTh6ZDJZUEZDZXZlcHhNakpE?=
 =?utf-8?B?WFp4czdVS0Q4bFl6Zm5wNDg2STFnK0czMU9iUXJhMTFPYXgzN2hXaThhOFcw?=
 =?utf-8?B?S2pXUHUwZ3ZRY1g2aUxPQzNKdEVNeThhTVhyNGJra1FlNlNkenRoK1hueGtP?=
 =?utf-8?B?ZEd2QjJ5NWRrbW0vSjVwVndKRnVDdmpLamhWZG9ndUFEQThSckdVOTQya1RB?=
 =?utf-8?B?Z1RFRDlQbnFrV1hkcHFDUHJTblBRL000ZnROQlZuNzJrMWRXbXdSc1E2THNX?=
 =?utf-8?B?MVNaWkswRHE5S0lLMnMvbWtwTi9MUVJXZVdseUFPOUVUVjNkWXk0MmdoZHAx?=
 =?utf-8?B?SzJnRHJYSW9BL0p3MWxzWk1PdE4xQXVoMHpDUm52Y213SC9CVFJBZWhjK1dK?=
 =?utf-8?B?Zlk1ZUFhS2tZNkJiL2F0V20xVXpwY3Eremg1VExFekJpYUgxK08vUlVTQyt5?=
 =?utf-8?B?ZE13U2dyckNrM3V6amdnMjlXajVoeEpneVB4cVZZcCtLY2lvSVd3ZWUxRUZs?=
 =?utf-8?B?c2xRRERMZHIyZ1l2c1FCWVdJb0pPK28wWXhvRkQzc20wNFNQUlBrMUd1a3g2?=
 =?utf-8?B?Z0dqK2RONzRvMVZqdWlJYmJ0SmdmOXNSOEFUUW9WeDBuVDFmcjZtUDFWK1Bk?=
 =?utf-8?B?c3ZiYVAxc2tkWExRVSs1NUV6S1hSc3JMbi8ybGRGSnVMajJ0WlFNcWc0T2cr?=
 =?utf-8?B?dVB4Mjc4Ni9ZNmpIblo5dlc1R3pWVzUyeVNDRERURFlFaWFJNFh1UXpndzJV?=
 =?utf-8?B?S3ExYUVoRzk3aEZ6TkZXeDU4aEdIWmp5R3FtcW4zZVljWlU5WU5STFM4RXVi?=
 =?utf-8?B?eVdNZlJLOTdpcWtqa0VSdmVHNWVncGpKZVVMRHkxbHhOVHZ3Q1NkWDRTNnkv?=
 =?utf-8?B?U2I0b1RERm11V1Z3MjJ2enR2R2RLVm1JU1N2VndBZUM5WTIycDk0eGd5ak9S?=
 =?utf-8?B?aURwV045WmNTYnIyZW1TYk96Rzdqdy94MGFLRWt3YTZkVXpvY0VUV2RLSnJ3?=
 =?utf-8?B?NndZNGppWkhCbldOZXAxRUROb25nMEdUREVrUWF6OTdBWURyL1RBbHRGdlpP?=
 =?utf-8?B?cTEveCs1WGFzT1VLRjVlbExsUFVXdGh4YnRzU3Z5K2Y0MDZsdG9zU2dLZEJ0?=
 =?utf-8?B?ZU5qWEJTb1V0YkRxNXo3RERhY2Z0OGlvV2ZiQU1VYkNhSDJMOXdxeUNOaUo4?=
 =?utf-8?B?Q1JFMGpFR0ZUR2R3OTY2dEcrSG9JdWFZNHF2aHNGYWdUdG54cjQzNHFJM09G?=
 =?utf-8?B?K2pKRmFuWGlvWWhmOHFCbUlDZGlIaFZSbUVrWjcyVm5MaFVxZHNaaHlBOWwr?=
 =?utf-8?B?V05jQSs5V2k2dzQyYUR6aW4xdW83T0t1N3VVN0luUnJrUzF1YU5rL2dBYWl1?=
 =?utf-8?B?US9naWtmTmxPUkNYdnhqQzV5VXhYSkhrMG1JNGlSdGJpbE81ZEVGNU01Ymhi?=
 =?utf-8?B?ckhsNmVOWnZOM0dmQ1o3Y2xWL1JBdlBZZlhVdTBLMmdISnZKUVdOMHdSTVlV?=
 =?utf-8?B?ZHMwWVJ5b2ZURzR6Zy8wQVlRMHRnOHcyZTNTNWxnbmFCOW1ZWWg4RjNIN29a?=
 =?utf-8?B?ZGpIQUp6eXc0Yzk1YzNnTnJJMW9SVzB3Um9YRXhFMzdOQjRtUFRrTnA3akVG?=
 =?utf-8?B?UHF1RENqMExqMDhnelZFN21Ua2VVTktyY2dXMkdKWE0wVUJUV2dIV3k2ZW1S?=
 =?utf-8?Q?pUxHKgGoM9KEewl9dla2HbQrU?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6415.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b909c6e-5e18-4d42-ee7e-08dc998dc978
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2024 05:22:22.9146
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BGb3/qeVj2eGqZnfBbbQsGVbTBwus+WsV2wCEa+oYSqXhp25oUH2bESd/Us+Sjb2PO4OygSqYk7Vc/NTLnQHIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8436
X-OriginatorOrg: intel.com

SGkgTGFyZW50LA0KDQpUaGFua3MgZm9yIHlvdXIgcmV2aWV3IGFuZCBtZWFuaW5nZnVsIHN1Z2dl
c3Rpb25zLiBJIGhhdmUgY29udGFjdGVkIHRoZSB2ZW5kb3IgYW5kIG9wdGltaXplZCB0aGUgY29k
ZSByZWxhdGVkIHRvIHRoZSByZWdpc3RlciBzZXR0aW5ncy4NClRoZSByZXNwb25zZSBpcyBhcyBm
b2xsb3dzOg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IExhdXJlbnQg
UGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4NCj4gU2VudDogRnJp
ZGF5LCBKdW5lIDE0LCAyMDI0IDEwOjI1IFBNDQo+IFRvOiBZYW4sIERvbmdjaGVuZyA8ZG9uZ2No
ZW5nLnlhbkBpbnRlbC5jb20+DQo+IENjOiBzYWthcmkuYWlsdXNAbGludXguaW50ZWwuY29tOyBs
aW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmc7DQo+IHRvbWkudmFsa2VpbmVuQGlkZWFzb25ib2Fy
ZC5jb207IGphY29wby5tb25kaUBpZGVhc29uYm9hcmQuY29tOw0KPiBiaW5nYnUuY2FvQGxpbnV4
LmludGVsLmNvbTsgZGF2ZS5zdGV2ZW5zb25AcmFzcGJlcnJ5cGkuY29tOyBMaSwgRGF4aW5nDQo+
IDxkYXhpbmcubGlAaW50ZWwuY29tPjsgWWFvLCBIYW8gPGhhby55YW9AaW50ZWwuY29tPg0KPiBT
dWJqZWN0OiBSZTogW1BBVENIIHYzXSBtZWRpYTogaTJjOiBBZGQgYXIwMjM0IGNhbWVyYSBzZW5z
b3IgZHJpdmVyDQo+IA0KPiBIaSBEb25nY2hlbmcsDQo+IA0KPiBUaGFuayB5b3UgZm9yIHRoZSBw
YXRjaC4NCj4gDQo+IE9uIEZyaSwgSnVuIDE0LCAyMDI0IGF0IDA0OjA5OjQxUE0gKzA4MDAsIERv
bmdjaGVuZyBZYW4gd3JvdGU6DQo+ID4gVGhlIGRyaXZlciBpcyBpbXBsZW1lbnRlZCB3aXRoIFY0
TDIgZnJhbWV3b3JrLCBhbmQgc3VwcG9ydHMgZm9sbG93aW5nDQo+ID4gZmVhdHVyZXM6DQo+ID4N
Cj4gPiAgICAgLSBtYW51YWwgZXhwb3N1cmUgYW5kIGFuYWxvZy9kaWdpdGFsIGdhaW4gY29udHJv
bA0KPiA+ICAgICAtIHZibGFuay9oYmxhbmsgY29udHJvbA0KPiA+ICAgICAtIHZmbGlwL2hmbGlw
IGNvbnRyb2wNCj4gPiAgICAgLSBydW50aW1lIFBNIHN1cHBvcnQNCj4gPiAgICAgLSAxMjgweDk2
MCBhdCAzMEZQUw0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogRGF2ZSBTdGV2ZW5zb24gPGRhdmUu
c3RldmVuc29uQHJhc3BiZXJyeXBpLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBEb25nY2hlbmcg
WWFuIDxkb25nY2hlbmcueWFuQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiB2MiAtLT4gdjM6DQo+
ID4gICAgIC0gcmVtb3ZlIHVudXNlZCByZWcgc2V0dGluZw0KPiA+ICAgICAtIGFkZCB2ZmxpcC9o
ZmxpcCBjb250cm9sDQo+ID4gICAgIC0gYWRkIGV4dGVybmFsIGNsb2NrIGNoZWNrICYgbGFuZXMg
Y2hlY2sNCj4gPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL21lZGlhL2kyYy9LY29uZmlnICB8ICAg
MTEgKw0KPiA+ICBkcml2ZXJzL21lZGlhL2kyYy9NYWtlZmlsZSB8ICAgIDEgKw0KPiA+ICBkcml2
ZXJzL21lZGlhL2kyYy9hcjAyMzQuYyB8IDEwNzcNCj4gPiArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysNCj4gPiAgMyBmaWxlcyBjaGFuZ2VkLCAxMDg5IGluc2VydGlvbnMoKykN
Cj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbWVkaWEvaTJjL2FyMDIzNC5jDQo+ID4N
Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9pMmMvS2NvbmZpZyBiL2RyaXZlcnMvbWVk
aWEvaTJjL0tjb25maWcNCj4gPiBpbmRleCBjNmQzZWU0NzJkODEuLjcxMDhkMTk0Yzk3NSAxMDA2
NDQNCj4gPiAtLS0gYS9kcml2ZXJzL21lZGlhL2kyYy9LY29uZmlnDQo+ID4gKysrIGIvZHJpdmVy
cy9tZWRpYS9pMmMvS2NvbmZpZw0KPiA+IEBAIC01MSw2ICs1MSwxNyBAQCBjb25maWcgVklERU9f
QUxWSVVNX0NTSTINCj4gPiAgCSAgVG8gY29tcGlsZSB0aGlzIGRyaXZlciBhcyBhIG1vZHVsZSwg
Y2hvb3NlIE0gaGVyZTogdGhlDQo+ID4gIAkgIG1vZHVsZSB3aWxsIGJlIGNhbGxlZCBhbHZpdW0t
Y3NpMi4NCj4gPg0KPiA+ICtjb25maWcgVklERU9fQVIwMjM0DQo+ID4gKyAgICAgICAgdHJpc3Rh
dGUgIk9OIFNlbWljb25kdWN0b3IgQVIwMjM0IHNlbnNvciBzdXBwb3J0Ig0KPiA+ICsgICAgICAg
IGRlcGVuZHMgb24gQUNQSSB8fCBDT01QSUxFX1RFU1QNCj4gPiArICAgICAgICBzZWxlY3QgVjRM
Ml9DQ0lfSTJDDQo+ID4gKyAgICAgICAgaGVscA0KPiA+ICsgICAgICAgICAgVGhpcyBpcyBhIFZp
ZGVvNExpbnV4MiBzZW5zb3IgZHJpdmVyIGZvciB0aGUgT04gU2VtaWNvbmR1Y3Rvcg0KPiA+ICsg
ICAgICAgICAgQVIwMjM0IGNhbWVyYS4NCj4gPiArDQo+ID4gKyAgICAgICAgICBUbyBjb21waWxl
IHRoaXMgZHJpdmVyIGFzIGEgbW9kdWxlLCBjaG9vc2UgTSBoZXJlOiB0aGUNCj4gPiArICAgICAg
ICAgIG1vZHVsZSB3aWxsIGJlIGNhbGxlZCBhcjAyMzQuDQo+ID4gKw0KPiA+ICBjb25maWcgVklE
RU9fQVIwNTIxDQo+ID4gIAl0cmlzdGF0ZSAiT04gU2VtaWNvbmR1Y3RvciBBUjA1MjEgc2Vuc29y
IHN1cHBvcnQiDQo+ID4gIAloZWxwDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvaTJj
L01ha2VmaWxlIGIvZHJpdmVycy9tZWRpYS9pMmMvTWFrZWZpbGUNCj4gPiBpbmRleCBkZmJlNjQ0
OGI1NDkuLjU3YjRmNjIxMDZkOSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL21lZGlhL2kyYy9N
YWtlZmlsZQ0KPiA+ICsrKyBiL2RyaXZlcnMvbWVkaWEvaTJjL01ha2VmaWxlDQo+ID4gQEAgLTE5
LDYgKzE5LDcgQEAgb2JqLSQoQ09ORklHX1ZJREVPX0FLNzM3NSkgKz0gYWs3Mzc1Lm8NCj4gPiAg
b2JqLSQoQ09ORklHX1ZJREVPX0FLODgxWCkgKz0gYWs4ODF4Lm8NCj4gPiAgb2JqLSQoQ09ORklH
X1ZJREVPX0FMVklVTV9DU0kyKSArPSBhbHZpdW0tY3NpMi5vDQo+ID4gIG9iai0kKENPTkZJR19W
SURFT19BUFRJTkFfUExMKSArPSBhcHRpbmEtcGxsLm8NCj4gPiArb2JqLSQoQ09ORklHX1ZJREVP
X0FSMDIzNCkgKz0gYXIwMjM0Lm8NCj4gPiAgb2JqLSQoQ09ORklHX1ZJREVPX0FSMDUyMSkgKz0g
YXIwNTIxLm8NCj4gPiAgb2JqLSQoQ09ORklHX1ZJREVPX0JUODE5KSArPSBidDgxOS5vDQo+ID4g
IG9iai0kKENPTkZJR19WSURFT19CVDg1NikgKz0gYnQ4NTYubw0KPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL21lZGlhL2kyYy9hcjAyMzQuYyBiL2RyaXZlcnMvbWVkaWEvaTJjL2FyMDIzNC5jDQo+
ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQgaW5kZXggMDAwMDAwMDAwMDAwLi44MGZlNWZmZDFjNjQN
Cj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvZHJpdmVycy9tZWRpYS9pMmMvYXIwMjM0LmMN
Cj4gPiBAQCAtMCwwICsxLDEwNzcgQEANCj4gPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IEdQTC0yLjANCj4gPiArLy8gQ29weXJpZ2h0IChjKSAyMDE5IC0gMjAyNCBJbnRlbCBDb3Jwb3Jh
dGlvbi4NCj4gPiArDQo+ID4gKyNpbmNsdWRlIDxsaW51eC9hY3BpLmg+DQo+ID4gKyNpbmNsdWRl
IDxsaW51eC9jbGsuaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L2RlbGF5Lmg+DQo+ID4gKyNpbmNs
dWRlIDxsaW51eC9pMmMuaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPg0KPiA+ICsj
aW5jbHVkZSA8bGludXgvcG1fcnVudGltZS5oPg0KPiA+ICsjaW5jbHVkZSA8YXNtL3VuYWxpZ25l
ZC5oPg0KPiA+ICsNCj4gPiArI2luY2x1ZGUgPG1lZGlhL3Y0bDItY2NpLmg+DQo+ID4gKyNpbmNs
dWRlIDxtZWRpYS92NGwyLWN0cmxzLmg+DQo+ID4gKyNpbmNsdWRlIDxtZWRpYS92NGwyLWV2ZW50
Lmg+DQo+ID4gKyNpbmNsdWRlIDxtZWRpYS92NGwyLWRldmljZS5oPg0KPiA+ICsjaW5jbHVkZSA8
bWVkaWEvdjRsMi1md25vZGUuaD4NCj4gPiArDQo+ID4gKy8qIENoaXAgSUQgKi8NCj4gPiArI2Rl
ZmluZSBBUjAyMzRfUkVHX0NISVBfSUQJCUNDSV9SRUcxNigweDMwMDApDQo+ID4gKyNkZWZpbmUg
QVIwMjM0X0NISVBfSUQJCQkweDBhNTYNCj4gPiArDQo+ID4gKyNkZWZpbmUgQVIwMjM0X1JFR19N
T0RFX1NFTEVDVAkJQ0NJX1JFRzE2KDB4MzAxYSkNCj4gPiArI2RlZmluZSBBUjAyMzRfUkVHX1ZU
UwkJCUNDSV9SRUcxNigweDMwMGEpDQo+ID4gKyNkZWZpbmUgQVIwMjM0X1JFR19FWFBPU1VSRQkJ
Q0NJX1JFRzE2KDB4MzAxMikNCj4gPiArI2RlZmluZSBBUjAyMzRfUkVHX0FOQUxPR19HQUlOCQlD
Q0lfUkVHMTYoMHgzMDYwKQ0KPiA+ICsjZGVmaW5lIEFSMDIzNF9SRUdfR0xPQkFMX0dBSU4JCUND
SV9SRUcxNigweDMwNWUpDQo+ID4gKyNkZWZpbmUgQVIwMjM0X1JFR19PUklFTlRBVElPTgkJQ0NJ
X1JFRzE2KDB4MzA0MCkNCj4gPiArI2RlZmluZSBBUjAyMzRfUkVHX1RFU1RfUEFUVEVSTgkJQ0NJ
X1JFRzE2KDB4MDYwMCkNCj4gPiArDQo+ID4gKyNkZWZpbmUgQVIwMjM0X0VYUE9TVVJFX01JTgkJ
MA0KPiA+ICsjZGVmaW5lIEFSMDIzNF9FWFBPU1VSRV9NQVhfTUFSR0lOCTgwDQo+ID4gKyNkZWZp
bmUgQVIwMjM0X0VYUE9TVVJFX1NURVAJCTENCj4gPiArDQo+ID4gKyNkZWZpbmUgQVIwMjM0X0FO
QUxPR19HQUlOX01JTgkJMA0KPiA+ICsjZGVmaW5lIEFSMDIzNF9BTkFMT0dfR0FJTl9NQVgJCTB4
N2YNCj4gPiArI2RlZmluZSBBUjAyMzRfQU5BTE9HX0dBSU5fU1RFUAkJMQ0KPiA+ICsjZGVmaW5l
IEFSMDIzNF9BTkFMT0dfR0FJTl9ERUZBVUxUCTB4ZQ0KPiA+ICsNCj4gPiArI2RlZmluZSBBUjAy
MzRfR0xPQkFMX0dBSU5fTUlOCQkwDQo+ID4gKyNkZWZpbmUgQVIwMjM0X0dMT0JBTF9HQUlOX01B
WAkJMHg3ZmYNCj4gPiArI2RlZmluZSBBUjAyMzRfR0xPQkFMX0dBSU5fU1RFUAkJMQ0KPiA+ICsj
ZGVmaW5lIEFSMDIzNF9HTE9CQUxfR0FJTl9ERUZBVUxUCTB4ODANCj4gPiArDQo+ID4gKyNkZWZp
bmUgQVIwMjM0X05BVElWRV9XSURUSAkJMTkyMA0KPiA+ICsjZGVmaW5lIEFSMDIzNF9OQVRJVkVf
SEVJR0hUCQkxMDgwDQo+ID4gKyNkZWZpbmUgQVIwMjM0X0NPTU1PTl9XSURUSAkJMTI4MA0KPiA+
ICsjZGVmaW5lIEFSMDIzNF9DT01NT05fSEVJR0hUCQk5NjANCj4gPiArI2RlZmluZSBBUjAyMzRf
UElYRUxfQVJSQVlfTEVGVAkJMzIwDQo+ID4gKyNkZWZpbmUgQVIwMjM0X1BJWEVMX0FSUkFZX1RP
UAkJNjANCj4gPiArI2RlZmluZSBBUjAyMzRfT1JJRU5UQVRJT05fSEZMSVAJQklUKDE0KQ0KPiA+
ICsjZGVmaW5lIEFSMDIzNF9PUklFTlRBVElPTl9WRkxJUAlCSVQoMTUpDQo+ID4gKw0KPiA+ICsj
ZGVmaW5lIEFSMDIzNF9WVFNfREVGQVVMVAkJMHgwNGM0DQo+ID4gKyNkZWZpbmUgQVIwMjM0X1ZU
U19NQVgJCQkweGZmZmYNCj4gPiArI2RlZmluZSBBUjAyMzRfSFRTX0RFRkFVTFQJCTB4MDRjNA0K
PiA+ICsjZGVmaW5lIEFSMDIzNF9QUExfREVGQVVMVAkJMzQ5OA0KPiA+ICsNCj4gPiArI2RlZmlu
ZSBBUjAyMzRfTU9ERV9SRVNFVAkJMHgwMGQ5DQo+ID4gKyNkZWZpbmUgQVIwMjM0X01PREVfU1RB
TkRCWQkJMHgyMDU4DQo+ID4gKyNkZWZpbmUgQVIwMjM0X01PREVfU1RSRUFNSU5HCQkweDIwNWMN
Cj4gPiArDQo+ID4gKyNkZWZpbmUgQVIwMjM0X1BJWEVMX1JBVEUJCTEyODAwMDAwMFVMTA0KPiA+
ICsjZGVmaW5lIEFSMDIzNF9YQ0xLX0ZSRVEJCTE5MjAwMDAwVUxMDQo+ID4gKw0KPiA+ICsjZGVm
aW5lIEFSMDIzNF9URVNUX1BBVFRFUk5fRElTQUJMRQkwDQo+ID4gKyNkZWZpbmUgQVIwMjM0X1RF
U1RfUEFUVEVSTl9TT0xJRF9DT0xPUgkxDQo+ID4gKyNkZWZpbmUgQVIwMjM0X1RFU1RfUEFUVEVS
Tl9DT0xPUl9CQVJTCTINCj4gPiArI2RlZmluZSBBUjAyMzRfVEVTVF9QQVRURVJOX0dSRVlfQ09M
T1IJMw0KPiA+ICsjZGVmaW5lIEFSMDIzNF9URVNUX1BBVFRFUk5fV0FMS0lORwkyNTYNCj4gPiAr
DQo+ID4gKyNkZWZpbmUgdG9fYXIwMjM0KF9zZCkJY29udGFpbmVyX29mKF9zZCwgc3RydWN0IGFy
MDIzNCwgc2QpDQo+ID4gKw0KPiA+ICtzdHJ1Y3QgYXIwMjM0X3JlZ19saXN0IHsNCj4gPiArCXUz
MiBudW1fb2ZfcmVnczsNCj4gPiArCWNvbnN0IHN0cnVjdCBjY2lfcmVnX3NlcXVlbmNlICpyZWdz
OyB9Ow0KPiA+ICsNCj4gPiArc3RydWN0IGFyMDIzNF9tb2RlIHsNCj4gPiArCXUzMiB3aWR0aDsN
Cj4gPiArCXUzMiBoZWlnaHQ7DQo+ID4gKwl1MzIgaHRzOw0KPiA+ICsJdTMyIHZ0c19kZWY7DQo+
ID4gKwl1MzIgY29kZTsNCj4gPiArCS8qIFNlbnNvciByZWdpc3RlciBzZXR0aW5ncyBmb3IgdGhp
cyBtb2RlICovDQo+ID4gKwljb25zdCBzdHJ1Y3QgYXIwMjM0X3JlZ19saXN0IHJlZ19saXN0OyB9
Ow0KPiA+ICsNCj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBjY2lfcmVnX3NlcXVlbmNlIG1vZGVf
MTI4MHg5NjBfMTBiaXRfMmxhbmVbXSA9IHsNCj4gPiArCXsgQ0NJX1JFRzE2KDB4M2Y0YyksIDB4
MTIxZiB9LA0KPiA+ICsJeyBDQ0lfUkVHMTYoMHgzZjRlKSwgMHgxMjFmIH0sDQo+ID4gKwl7IEND
SV9SRUcxNigweDNmNTApLCAweDBiODEgfSwNCj4gPiArCXsgQ0NJX1JFRzE2KDB4MzFlMCksIDB4
MDAwMyB9LA0KPiA+ICsJeyBDQ0lfUkVHMTYoMHgzMGIwKSwgMHgwMDI4IH0sDQo+ID4gKwkvKiBS
MHgzMDg4IHNwZWNpZnkgdGhlIHNlcXVlbmNlciBSQU0gYWNjZXNzIGFkZHJlc3MuICovDQo+ID4g
Kwl7IENDSV9SRUcxNigweDMwODgpLCAweDgwMDAgfSwNCj4gPiArCS8qIFIweDMwODYgd3JpdGUg
dGhlIHNlcXVlbmNlciBSQU0uICovDQo+ID4gKwl7IENDSV9SRUcxNigweDMwODYpLCAweGMxYWUg
fSwNCj4gPiArCXsgQ0NJX1JFRzE2KDB4MzA4NiksIDB4MzI3ZiB9LA0KPiA+ICsJeyBDQ0lfUkVH
MTYoMHgzMDg2KSwgMHg1NzgwIH0sDQo+ID4gKwl7IENDSV9SRUcxNigweDMwODYpLCAweDI3MmYg
fSwNCj4gPiArCXsgQ0NJX1JFRzE2KDB4MzA4NiksIDB4NzQxNiB9LA0KPiANCj4gU3RvcmluZyB0
aGUgc2VxdWVuY2VyIGRhdGEgaW4gdGhpcyB0YWJsZSB3YXN0ZXMgbG90cyBvZiBtZW1vcnkgYW5k
IENQVSBjeWNsZXMuDQo+IFBsZWFzZSBtb3ZlIHRoZSBkYXRhIG91dCB0byBhDQo+IA0KPiBzdGF0
aWMgY29uc3QgdTE2IGFyMDIzNF9zZXF1ZW5jZXJbXSA9IHsNCj4gCTB4YzFhZSwgMHgzMjdmLCAw
eDU3ODAsIDB4MjcyZiwgMHg3NDE2LCAweDdlMTMsIDB4ODAwMCwgMHgzMDdlLA0KPiAJLi4uDQo+
IH07DQo+IA0KPiB0YWJsZSwgYW5kIHByb2dyYW0gaXQgd2l0aA0KPiANCj4gCS8qIFByb2dyYW0g
dGhlIHNlcXVlbmNlci4gKi8NCj4gCWNjaV93cml0ZShhcjAyMzQtPnJlZ21hcCwgQ0NJX1JFRzE2
KDB4MzA4OCksIDB4ODAwMCwgJnJldCk7DQo+IAlmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRShh
cjAyMzRfc2VxdWVuY2VyKTsgKytpKQ0KPiAJCWNjaV93cml0ZShhcjAyMzQtPnJlZ21hcCwgQ0NJ
X1JFRzE2KDB4MzA4NiksDQo+IAkJCSAgYXIwMjM0X3NlcXVlbmNlcltpXSwgJnJldCk7DQo+IA0K
PiBBbmQgcGxlYXNlIGRlZmluZSBtYWNyb3MgZm9yIHRoZSBzZXF1ZW5jZXIgYWNjZXNzIHJlZ2lz
dGVycyAweDMwODYgYW5kDQo+IDB4MzA4OCwgYXMgd2VsbCBhcyBmb3IgdGhlIGJpdHMgb2YgdGhl
IDB4MzA4OCByZWdpc3Rlci4NCj4gDQo+IFtzbmlwXQ0KPiANCltZYW4sIERvbmdjaGVuZw==

