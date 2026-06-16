Return-Path: <linux-media+bounces-64984-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QjesGfIXMWoYbgUAu9opvQ
	(envelope-from <linux-media+bounces-64984-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 11:31:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C92F068D8F1
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 11:31:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=Hn9mC5AP;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64984-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64984-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3D6073039C4B
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 09:29:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21229421EF6;
	Tue, 16 Jun 2026 09:29:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46938349CDD;
	Tue, 16 Jun 2026 09:29:01 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781602142; cv=fail; b=f2Ex668smJ2RXXvJpbaP+FKJbunZoNMlNUqnm6HLJdodKYvKDISYO7jkB2PglUltqYBZzlCjQcwEoQmrBYfzC4zyTmLjcRr0P+TlHo3L+5A1QPKXGxfzpwoKU5ZT07zSRPqTFrC55OENUuh3wT8Sb62QRhDIBfYOa9CSqqFvsQc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781602142; c=relaxed/simple;
	bh=pdx3BbQIYdibySzKarXaQfpDJIsxtrKkeBKJ6wtbFHo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QEx03odkAVZZ62PvhBek/FCNyrVDo2eW4rv+SHaM1/7XKqPUfnZlSOic/GgeokP/e+w/bdNy/FLcybDW9R6BOwacLjefwbaWiZ9FdhfjbrtxA2x2WTIkyamLTNpjsAgA/ZT5XUsuabEynH7igLk+60I16QmDLThtHVenByrX+xU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hn9mC5AP; arc=fail smtp.client-ip=198.175.65.21
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781602141; x=1813138141;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=pdx3BbQIYdibySzKarXaQfpDJIsxtrKkeBKJ6wtbFHo=;
  b=Hn9mC5APGK8RlOUjMtzP+xoD+nH6IKq1d1xhhZ/yhzqtKRm1bJ2J1ZN4
   zTktj2v8aS98zCx8xfNmEy+E6luItXGsbMlrIE9QWke2NkE6gSauMfKJa
   ktGCF9mzsmZMjGSSSpaVMiqZywZr9FpXfIVMWmPCBIynj2wayDqE4fL3S
   oM704+qplTDtp2YpSGbWQbFuaLsjNpd6EIAir6B0K5YhB84pZHBolTrf2
   MUJdhZq7UwBTwN++8zv4SVxMNvZKaWl8XON8ELDfIcmChXYn1MMVSIfm9
   ogrIZq13VP6MlnR05tqN7pzAraEpP/UiBd2JPYqZ6QzDEuYlC4wLDPypK
   Q==;
X-CSE-ConnectionGUID: 02rL84i/RgSItDNWnXhTbg==
X-CSE-MsgGUID: DhNN/PzqT0+Cfue+RRFaOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82261559"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="82261559"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 02:29:01 -0700
X-CSE-ConnectionGUID: 1ewsTyhPTwS1fXL8rovrUg==
X-CSE-MsgGUID: jSIG2K/qTwqfR17itQ+IUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="241338312"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 02:29:00 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 02:28:59 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 16 Jun 2026 02:28:59 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.53) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 02:28:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JOh9k5iSh23zXZ6UQqFKlscKykL0gNkxM9vtIGJTqnGcoCzCe0Kn3h9CNoSH16Nku3huigK29sBJsjXpAecF+UOpStbNQq4LDb44mSJ1kbFdYVlQ+/qsNLQD4SLzwpNMxm3MwL854CVItzXzEPOck/4MlBFAfthG92eXOGWIWyXvpBywA8CXAKg7bLwItYFcnIBgyiWbgnKaUMPOkaDUr8mzLSGcS9vBMqfd1WcXNsfaTAsUTKTzdPZ7uL/DRPEcZX/woptnQcdd7DY+esv8Km4TffiEOQCgv+TS2I+0Fk4bziaxJSgCC1JwBRLRCkv1ZA3bJSACtMlbrJT3kYQntw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pdx3BbQIYdibySzKarXaQfpDJIsxtrKkeBKJ6wtbFHo=;
 b=NgtQHx5ewp40luHJ/k+lzvDIF8/Rg9gBH62j/jTA2gDkyP2b/oH95GDNzM96pKNmYX6ajFIsLlsUgQ54kuAmMKWFLg8ObUzoyqM9xJmci8tqtHcCMmO9cma2XQojv3p7XEOdi7aKaq+OJyBudNWz94MPYnREnoTxIY4u7JcjhYUcUvlKj8jAfBpYAPKfj2D89Vsz24/tbjfg9hnmumFcwtIyhIywQCgk5OXjjRaf/mFHxblHMRaRDXBeeIvz7/gsGGWMcwp8D7AW3e03c96R5s9XvQG0gAAoZJNg9MfW4zGiuJFsbEbQvvHgcBHvn7CZsg/EmiSB1HlAK4Eme6caUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB3690.namprd11.prod.outlook.com (2603:10b6:5:13d::32)
 by SA2PR11MB4859.namprd11.prod.outlook.com (2603:10b6:806:f8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 09:28:52 +0000
Received: from DM6PR11MB3690.namprd11.prod.outlook.com
 ([fe80::7db8:f6b3:30f8:ee4b]) by DM6PR11MB3690.namprd11.prod.outlook.com
 ([fe80::7db8:f6b3:30f8:ee4b%4]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 09:28:52 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Matt Evans <matt@ozlabs.org>
CC: Alex Williamson <alex@shazbot.org>, Leon Romanovsky <leon@kernel.org>,
	Jason Gunthorpe <jgg@nvidia.com>, Alex Mastro <amastro@fb.com>,
	=?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, "Bjorn
 Helgaas" <bhelgaas@google.com>, Logan Gunthorpe <logang@deltatee.com>,
	Mahmoud Adam <mngyadam@amazon.de>, David Matlack <dmatlack@google.com>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Sumit Semwal
	<sumit.semwal@linaro.org>, Ankit Agrawal <ankita@nvidia.com>, "Pranjal
 Shrivastava" <praan@google.com>, Alistair Popple <apopple@nvidia.com>,
	"Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>
Subject: RE: [PATCH v3 2/9] vfio/pci: Add a helper to look up PFNs for DMABUFs
Thread-Topic: [PATCH v3 2/9] vfio/pci: Add a helper to look up PFNs for
 DMABUFs
Thread-Index: AQHc+PAQRqml0ikcREqACcjq+Arri7Y6mQ/wgAVXxwCAAQHA8A==
Date: Tue, 16 Jun 2026 09:28:51 +0000
Message-ID: <DM6PR11MB36903B0203CFFF97197676138CE52@DM6PR11MB3690.namprd11.prod.outlook.com>
References: <20260610154327.37758-1-matt@ozlabs.org>
 <20260610154327.37758-3-matt@ozlabs.org>
 <DM6PR11MB369091A6F1E32054A95AB6788C182@DM6PR11MB3690.namprd11.prod.outlook.com>
 <4d75b948-3b74-4970-97f2-72e54f9c9694@ozlabs.org>
In-Reply-To: <4d75b948-3b74-4970-97f2-72e54f9c9694@ozlabs.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB3690:EE_|SA2PR11MB4859:EE_
x-ms-office365-filtering-correlation-id: 5e36c4c9-6625-4d7a-7dbc-08decb89adce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|22082099003|18002099003|10063799003|38070700021|4143699003|11063799006|56012099006;
x-microsoft-antispam-message-info: WKG0sX9Q62dV144qXL6tQsJSiiNAycVAKCWKwwVSy/X3rsaNZx6o0LwFtAjOEdk1mEby2pQSCehNV0KYx0jSM4d47s6NvQgTqSBGDjlFKFEtb/IVmwJyUNNW19LpxBumG2fvN2ghzcVaZ4Yu1dR5bBbw4IFuqG+UJwREcscFDOERtdsRu8X+lZZ3LAoXKgsRftO5ON4OE/WYSSRLAtDtIw4CRS6jgjNfJF8psh4nICiZFAjYhTStDt7NzXEoLQbNR9vWYLQm4C6z8ZE5B/b2UoeN+fdTuouoITbaTJI0uDjGpRbVtjKhtTGFWcyxEoi4KBp2nwvbf/nYm7wVfuJubxVylXGquNl/YPYe4Hpmf7LF+aZtDrJtIjC+1qgS7BteOJThTLhIHm4GwLlgV2yyQ54WuhGs5zHCYtyLf2zJmm8LaWe/92tnxHe5hh5ezlB7qt5962m6qRpk5I6X/9yOfIGynXaqwOvW4u7WiCksneP47zM+/Pw9WkyRgt9yQeeDwRgjjA5laXFXHFiqpO4QPxi+qnmNw7oou1iPYb56cEmhhWiDrc4hazBiCbbG2v6VsGT0VO0tY0IxPU3vjETgrvW+5DC4JqL/4q6/R9eTf7LvykqC0gZyR98Hl6BAP6sR3jDkPqk/B15x3TegmjDidmONCtt6i6jG2ThTPW38FmQ42f2P5iomZ65hBrK9NSC7YmphRC2Xo/dfu/RN9xt/ze86hYmc4SFtDqBfD95MNJrObgnBDcXrQJSH88ggdzmq
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3690.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(22082099003)(18002099003)(10063799003)(38070700021)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U0pCSDh0SHJiS0gxR0w3ajVHZUVlK3VPSHZTYkVuM01pemZMbURpczJVZDJF?=
 =?utf-8?B?TnYwTWx2b3R1T3piRlNiUVZJRGtydUUrSzZRaFlwVDVxeloxTDM5aDNLaEJM?=
 =?utf-8?B?MGxmTFpFRU9yTG9ZSUZJR0wrdUFEVWsyTm8zZE5Qelduc0czQmtpZU13blU2?=
 =?utf-8?B?WUpLY1VUVkZvdHo1eFZQUUxsRjBqY0ZjY2hsZ1ZQVHY1MG1GTkUzYjJxWEs1?=
 =?utf-8?B?Z0hjUk80ZEJ5Nlo5bTY4UmNydk1pem1tRmhrTXBMbU05YkFzZlo1SXJ2WnBu?=
 =?utf-8?B?Z0dDMkZXMW5TSWdtVlAyd2YzY3FldUlhclQxR0k1MWZ0L0tiNzFqYUVqSUky?=
 =?utf-8?B?NFRjb2NUUUVLTXRSbTV2ckNKZnVHK2hZOHFIeXU4TTBlbVNYY3JlZjk4Tm9u?=
 =?utf-8?B?U0ZLcUJ5ZkdXbkZsd0pWNWVaMmtWdlB1dUNoV2xKUW90d3lqMUdMcDVDeVdZ?=
 =?utf-8?B?L2pJUWs5K2R0UGNSREZ3YnVrVUU0N1RYOVI5N0FrR1RBMTVzSU9idmlyZnVX?=
 =?utf-8?B?TVVucm9ISnRQcWRQa1FjREh4V2c2Nk9zcXlSM3ZXUlh1N0NuUEx2NWxoaEE1?=
 =?utf-8?B?cmdOMTZGQ3V6RU1hV0hmTjVqekJabUFJTDgvbWhGTEtXbnJCV3RpQlEzVmJv?=
 =?utf-8?B?MEJmNk53ZCtxWk5ML28wZnc0akNSM2ZrTUxKM29HLzNUUlQzMlBOcXFPV1dz?=
 =?utf-8?B?TUx5a0JaSjg0UXdCNWF0SEVUSGhEaDJzR2EvS3F3WFFyV2V4dmNVUVZXbzN4?=
 =?utf-8?B?TkRSTmRtZWFGNkJOYllYbVQ5K3dmQU5HTTh1R2VrRDlaY1VUVjlpNEZ6Ym9Q?=
 =?utf-8?B?bTFYWHpha3hRSmFEYXRtWG1QWXBkRVpkNDBIaUxKSXRYS2JhQnNjUGdHUnlw?=
 =?utf-8?B?NTk3bUp0cDRmUDUwRTl2VHZNdDhINHdOVEVONmV3T1NnRGlXdnZuU0ljV2R0?=
 =?utf-8?B?RkxnT0VLTmlaYVBGQWoyaDlBSFBtK2tvNWpCYnVWL1pPWFhwUWRPQ0VsTGR6?=
 =?utf-8?B?UTFtYTFUUXRPdVhiSDJ4eS9MeVVZUkRFdWxnVTB1aVltd3hCeGZTOTlGbURP?=
 =?utf-8?B?Sll3dnNoNjVGd0dGWlZFR2g2OUlKelA2a1YvTTlBa3B0ekg0ZkEybzBVd1Nt?=
 =?utf-8?B?SGhsNGVHZHFUczlEc3Nna2xsMjVLSGxHeXB0S25nZjlrbk9UZExKb1Z5UmdS?=
 =?utf-8?B?M21MZEFKQlY4MlhocG1KZVFMVlM2eUZBUTBkK2dVdWFiY1o4aUVTbndpeVpC?=
 =?utf-8?B?SXFHaEFnVmo4a2tGL3ZaT0w0RWlkWC9WVDA3R3U3clRhVWRsdlA5d2g3bTFz?=
 =?utf-8?B?WU40T0JGRVAwNXQ4R2xjOGZOQXdVNEh5K1JsZUxlSzZRd0xEZkRuNlRQUUNp?=
 =?utf-8?B?dkNhNUprWWxaMEY3RkJHTlBYYTBNT0NyMEVIZXRsSHNmems0OFp5NldrREQ2?=
 =?utf-8?B?bDVJOTV2dFhscU5ydzFPOXJZWXViVVpydVI3MVY2ZW9PMkhJb0M2UitmcFZ0?=
 =?utf-8?B?Mk1tanF6OFBaK1RId3g4YlZCRHB0eXNpMHlSeGhBanZlbHVYMEM4OWViYlpB?=
 =?utf-8?B?dGVsWUlGZXJyTzNOdkVqRlZPdThVUXZWYjJnQjIwNTQ4NkJCdCt6NjhwOFVx?=
 =?utf-8?B?WkRyTUFtM3YrMXAvLzBXVUtLR05TdjZVL2k1SS8zdDZNakcwNlVDWklXVnJL?=
 =?utf-8?B?M0ZnOE4vL0lGeCthcTN0VWpDZnduT2xXYTBBUkNVdHA5NkFWWldkN2dnK1VW?=
 =?utf-8?B?QmdoQUc2MGZVWDVHb0lYTUhtVUpsNkVsQkZTTFdhMTRzRVM3YVowWUtDN1VP?=
 =?utf-8?B?UDhpTk83Ly93aTVsSDBvTVdTaTUvR0FocE1XdjhEY2k0MkVDbTBBMTFKQWY2?=
 =?utf-8?B?eG44VjFMZ2swUVBvemdRZjZ2TTV4bEswQzM2eUV2dis0SVI5NjZHTDdMeDc0?=
 =?utf-8?B?ZzM4ejkrU280SFZ6amJwNGhFZ0piNkpjbk5YdXVwdVFaLzNsbzJ2L1k1TW9V?=
 =?utf-8?B?blI2NktjM2Y4OEx2c1FoakJUV3QxS3RKR05Zb1cwNE16MEJrcC80elExcHZD?=
 =?utf-8?B?aEdGdGtScmlPS2hzR1VGY3JDVlhVOG12NzNHSERpQVlUNW1DYTh5NzlDSWlH?=
 =?utf-8?B?ZGxxdDZoSVdIWDRyQTRxV2ZuZS9zeXViVGVxaXBTY2JxM010UUhxT0UzTTZL?=
 =?utf-8?B?SVRqckhDMGVaRTArNWFWYkRpV0VpR2JOaXppSVhCS2FZejNuYmF6bkdEODJv?=
 =?utf-8?B?MTlEdzhiaG40d2NUT0QraU1IR1U2VkM5Q3JsVmcvbTZrWVJOTG1ISWhwRVNk?=
 =?utf-8?Q?oJrgxoOvGIfpH6sA+k?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: kkQCT5lesgFXOvcAqoTvV2oN9SWbkUgDiIBpkvA2aY7OF1wvXM8cFaMpswuegHbjGw735gOH60Q1Rl/vo3O3/HLMA3sJAP0xlhwfhAre1Ytx6xjp/WArqQiz64ify2WnhCbfxWoGXdlG6MLwoTZvrhC8pMKKFcdB/X4cIPO4KkHlrwREniiLuUFWfmqyUmsILuGGx4sdQZvN4KNH/3P1R+7FlPwrG/n0408UkRKE6QQbp1LRQcxz9scQXxScawtVXX2dr41O8pBdm2R96GEJv9yyGIYfGUsHCfof/SwLCVB5z7vXKgiKHFOOYj+4fNzTzZ7RdoT8wBeXAGFcQzKleA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e36c4c9-6625-4d7a-7dbc-08decb89adce
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2026 09:28:51.9821
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IROMyF0gRB8ir4CWC1ByBD5/oIGo5nBMzAW9fAcqObr5r1njGdkHcwgR/iETXhf8dpBqq4mVhxh2D/M4uD+2OA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4859
X-OriginatorOrg: intel.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.06 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_FROM(0.00)[bounces-64984-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[kevin.tian@intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:matt@ozlabs.org,m:alex@shazbot.org,m:leon@kernel.org,m:jgg@nvidia.com,m:amastro@fb.com,m:christian.koenig@amd.com,m:bhelgaas@google.com,m:logang@deltatee.com,m:mngyadam@amazon.de,m:dmatlack@google.com,m:bjorn@kernel.org,m:sumit.semwal@linaro.org,m:ankita@nvidia.com,m:praan@google.com,m:apopple@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:kvm@vger.kernel.org,m:linux-pci@vger.kernel.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ozlabs.org:email,DM6PR11MB3690.namprd11.prod.outlook.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,intel.com:dkim,intel.com:from_mime];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kevin.tian@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C92F068D8F1

PiBGcm9tOiBNYXR0IEV2YW5zIDxtYXR0QG96bGFicy5vcmc+DQo+IFNlbnQ6IFR1ZXNkYXksIEp1
bmUgMTYsIDIwMjYgMjowNCBBTQ0KPiANCj4gT24gMTIvMDYvMjAyNiAwOTo0MiwgVGlhbiwgS2V2
aW4gd3JvdGU6DQo+ID4+IEZyb206IE1hdHQgRXZhbnMgPG1hdHRAb3psYWJzLm9yZz4NCj4gPj4g
U2VudDogV2VkbmVzZGF5LCBKdW5lIDEwLCAyMDI2IDExOjQzIFBNDQo+ID4+DQo+ID4+ICtpbnQg
dmZpb19wY2lfZG1hX2J1Zl9maW5kX3BmbihzdHJ1Y3QgdmZpb19wY2lfZG1hX2J1ZiAqcHJpdiwN
Cj4gPj4gKwkJCSAgICAgIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLA0KPiA+PiArCQkJICAg
ICAgdW5zaWduZWQgbG9uZyBhZGRyZXNzLA0KPiA+PiArCQkJICAgICAgdW5zaWduZWQgaW50IG9y
ZGVyLA0KPiA+PiArCQkJICAgICAgdW5zaWduZWQgbG9uZyAqb3V0X3BmbikNCj4gPj4gK3sNCj4g
Pj4gKwkvKg0KPiA+PiArCSAqIEdpdmVuIGEgVk1BIChzdGFydCwgZW5kLCBwZ29mZnMpIGFuZCBh
IGZhdWx0IGFkZHJlc3MsDQo+ID4+ICsJICogc2VhcmNoIHRoZSBjb3JyZXNwb25kaW5nIERNQUJV
RidzIHBoeXNfdmVjW10gdG8gZmluZCB0aGUNCj4gPj4gKwkgKiByYW5nZSByZXByZXNlbnRpbmcg
dGhlIGFkZHJlc3MncyBvZmZzZXQgaW50byB0aGUgVk1BLCBhbmQNCj4gPj4gKwkgKiBpdHMgUEZO
Lg0KPiA+PiArCSAqDQo+ID4+ICsJICogVGhlIHBoeXNfdmVjW10gcmFuZ2VzIHJlcHJlc2VudCBj
b250aWd1b3VzIHNwYW5zIG9mIFZBcw0KPiA+PiArCSAqIHVwd2FyZHMgZnJvbSB0aGUgYnVmZmVy
IG9mZnNldCAwOyB0aGUgYWN0dWFsIFBGTnMgbWlnaHQgYmUNCj4gPj4gKwkgKiBpbiBhbnkgb3Jk
ZXIsIG92ZXJsYXAvYWxpYXMsIGV0Yy4gIENhbGN1bGF0ZSBhbiBvZmZzZXQgb2YNCj4gPj4gKwkg
KiB0aGUgZGVzaXJlZCBwYWdlIGdpdmVuIFZNQSBzdGFydC9wZ29mZiBhbmQgYWRkcmVzcywgdGhl
bg0KPiA+PiArCSAqIHNlYXJjaCB1cHdhcmRzIGZyb20gMCB0byBmaW5kIHdoaWNoIHNwYW4gY29u
dGFpbnMgaXQuDQo+ID4+ICsJICoNCj4gPj4gKwkgKiBPbiBzdWNjZXNzLCBhIHZhbGlkIFBGTiBm
b3IgYSBwYWdlIHNpemVkIGJ5ICdvcmRlcicgaXMNCj4gPj4gKwkgKiByZXR1cm5lZCBpbnRvIG91
dF9wZm4uDQo+ID4+ICsJICoNCj4gPj4gKwkgKiBGYWlsdXJlIG9jY3VycyBpZjoNCj4gPj4gKwkg
KiAtIFRoZSBwYWdlIHdvdWxkIGNyb3NzIHRoZSBlZGdlIG9mIHRoZSBWTUENCj4gPj4gKwkgKiAt
IFRoZSBwYWdlIGlzbid0IGVudGlyZWx5IGNvbnRhaW5lZCB3aXRoaW4gYSByYW5nZQ0KPiA+PiAr
CSAqIC0gV2UgZmluZCBhIHJhbmdlLCBidXQgdGhlIGZpbmFsIFBGTiBpc24ndCBhbGlnbmVkIHRv
IHRoZQ0KPiA+PiArCSAqICAgcmVxdWVzdGVkIG9yZGVyLg0KPiA+PiArCSAqDQo+ID4+ICsJICog
KFVwb24gZmFpbHVyZSwgdGhlIGNhbGxlciBpcyBleHBlY3RlZCB0byB0cnkgYWdhaW4gd2l0aCBh
DQo+ID4+ICsJICogc21hbGxlciBvcmRlcjsgdGhlIHRlc3RzIGFib3ZlIHdpbGwgYWx3YXlzIHN1
Y2NlZWQgZm9yDQo+ID4+ICsJICogb3JkZXI9MCBhcyB0aGUgbGltaXQgY2FzZS4pDQo+ID4+ICsJ
ICoNCj4gPj4gKwkgKiBJdCdzIHN1Ym9wdGltYWwgaWYgRE1BQlVGcyBhcmUgY3JlYXRlZCB3aXRo
IG5laWdib3VyaW5nDQo+ID4NCj4gPiBzL25laWdib3VyaW5nL25laWdoYm9yaW5nLw0KPiANCj4g
QWgsIG5vdCBhIHR5cG8uIDopICBUaGF0IGlzIGVuX0dCIGFuZCBBRkFJSyBpcyBwZXJtaXR0ZWQu
DQoNCkkgZ3Vlc3MgeW91IG1lYW50ICduZWlnaGJvdXJpbmcnIGFuZCAnbmVpZ2hib3JpbmcnIGFy
ZSBib3RoIHZhbGlkLg0KDQpidXQgaGVyZSBsYWNraW5nIGEgJ2gnIHNob3VsZCBiZSBhIHR5cG8/
IDopDQoNCj4gPj4gKwkgKi8NCj4gPj4gKw0KPiA+PiArCWNvbnN0IHVuc2lnbmVkIGxvbmcgcGFn
ZXNpemUgPSBQQUdFX1NJWkUgPDwgb3JkZXI7DQo+ID4+ICsJdW5zaWduZWQgbG9uZyB2bWFfb2Zm
ID0gKCh2bWEtPnZtX3Bnb2ZmIC0gcHJpdi0+dm1hX3Bnb2ZmX2FkanVzdCkNCj4gPj4gPDwNCj4g
Pj4gKwkJCQkgUEFHRV9TSElGVCkgJiBWRklPX1BDSV9PRkZTRVRfTUFTSzsNCj4gPj4gKwl1bnNp
Z25lZCBsb25nIHJvdW5kZWRfcGFnZV9hZGRyID0gQUxJR05fRE9XTihhZGRyZXNzLA0KPiA+PiBw
YWdlc2l6ZSk7DQo+ID4+ICsJdW5zaWduZWQgbG9uZyByb3VuZGVkX3BhZ2VfZW5kID0gcm91bmRl
ZF9wYWdlX2FkZHIgKyBwYWdlc2l6ZTsNCj4gPj4gKwl1bnNpZ25lZCBsb25nIHBhZ2VfYnVmX29m
ZnNldDsNCj4gPj4gKwl1bnNpZ25lZCBsb25nIHBhZ2VfYnVmX29mZnNldF9lbmQ7DQo+ID4NCj4g
PiB3aGF0IGFib3V0ICJmYXVsdF9vZmZzZXRbX2VuZF0iPyBwYWdlX2J1ZiBpcyBhIGJpdCBjb25m
dXNpbmcuDQo+IA0KPiBJIHdlbnQgcm91bmQgc2V2ZXJhbCB0aW1lcyB3aXRoIHRoZXNlIG5hbWVz
LCB0aGFua3MgZm9yIHRoZSBpbnB1dC4gIEp1c3QNCj4gdHJpZWQgaXQgb3V0IGFuZCB5b3VyIHN1
Z2dlc3Rpb24gaXMgY2xlYXJlci4NCj4gDQo+ID4+ICsJdW5zaWduZWQgbG9uZyByYW5nZV9idWZf
b2Zmc2V0ID0gMDsNCj4gPg0KPiA+IGNvdWxkIHRoaXMgYmUgY2FsbGVkICdyYW5nZV9zdGFydCcg
dGhlbiB0aGUgJ3JhbmdlX3N0YXJ0JyBpbiBsYXR0ZXIgbG9vcA0KPiA+IGlzIHJlbmFtZWQgdG8g
J3BoeXNfc3RhcnQnPw0KPiA+DQo+ID4gTm90IHN0cm9uZy4uLiBqdXN0IGZlZWwgc3VjaCBuYW1p
bmcgaGVscHMgbWUgdW5kZXJzdGFuZCB0aGUgbG9naWMgZWFzaWVyDQo+IA0KPiBBbnl0aGluZyB0
aGF0IGhlbHBzIGhlbHBzLCB0aGFua3MuICBJIGVuZGVkIHVwIHJlbmFtaW5nIHRoaXMgdG8NCj4g
cmFuZ2Vfc3RhcnRfb2Zmc2V0IChhcyBvZmZzZXQgaXMgSU1ITyBpbXBvcnRhbnQpLg0KPiANCj4g
SSdtIGEgZmFuIG9mIGRpYWdyYW1zIGJ1dCB0aGlzIGlzIHRvbyBsYXJnZSB0byBpbmNsdWRlIGlu
IGEgY29tbWVudC4NCj4gQnV0IGZvciBwb3N0ZXJpdHkgb24gdGhlIGxpc3QsIGFuZCB1c2luZyB0
aGUgbmV3IG5hbWVzLCBhbiBpbGx1c3RyYXRpb24NCj4gb2YgYSBETUFCVUYgd2l0aCAzIHJhbmdl
cyBpbiBwaHlzX3ZlYywgd2hlcmUgYSBtYXBwaW5nJ3MNCj4gZmF1bHRpbmcgcGFnZSBvZmZzZXQg
bGllcyBpbiByYW5nZSBbMV06DQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ZmF1bHRfYWRkci0tKw0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgdiAgICAgICAgICAgICAgICAgICBWTUENCj4gICAgICAgICAgICAgICAgICAgICArLS0tLS0t
LS0tLS0tLS0tLS0rLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLSsNCj4gICAgICAgICAgICAg
ICAgICAgICB8ICAgICAgICAgICAgICAgICB8IEZhdWx0aW5nIHwgICAgICAgICAgICAgICAgIHwN
Cj4gICAgICAgICAgICAgICAgICAgICB8ICAgICAgICAgICAgICAgICB8IChoZylwYWdlIHwgICAg
ICAgICAgICAgICAgIHwNCj4gICAgICAgICAgICAgICAgICAgICB8ICAgICAgICAgICAgICAgICB8
ICAgICAgICAgIHwgICAgICAgICAgICAgICAgIHwNCj4gIHwtLS0tIHZtYV9vZmYgLS0tLT4rLS0t
LS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLSsNCj4gIHwgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAuICAgICAgICAgIC4NCj4gIHwgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAuICAgICAgICAgIC4NCj4gIHwtLS0tLS0tLS0gZmF1
bHRfb2Zmc2V0IC0tLS0tLS0tLS0tLT4uICAgICAgICAgIC4gICAgICAgICAgICAgRE1BQlVGDQo+
ICArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0r
LS0tLS0tLS0tLS0tLS0rDQo+ICB8IHBoeXNfdmVjWzBdICAgICAgICAgICAgIHwgcGh5c192ZWNb
MV0gICAgICAgICAuICAgICB8IHBoeXNfdmVjWzJdICB8DQo+ICB8ICAgIC5wYWRkciAgICAgICAg
ICAgICAgIHwgICAgICAgICAgLiAgICAgICAgICAuICAgICB8ICAgICAgICAgICAgICB8DQo+ICB8
ICAgIC5sZW4gICAgICAgICAgICAgICAgIHwgICAgICAgICAgLiAgICAgICAgICAuICAgICB8ICAg
ICAgICAgICAgICB8DQo+ICArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0rDQo+ICAwICAgICAgICAgICAgICAgICAgICAg
ICAgIDogICAgICAgICAgLiAgICAgICAgICAuICAgICA6ICAgICAgICAgICAgICBMDQo+ICB8LS0g
cmFuZ2Vfc3RhcnRfb2Zmc2V0IC0tPjogICAgICAgICAgLiAgICAgICAgICAuICAtLT46IHJhbmdl
X2xlbg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICA6ICAgICAgICAgIC4gICAgICAgICAg
LiAgICAgOg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICBWICAgICAgICAgIC4gICAgICAg
ICAgLiAgICAgOg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICArLS0tLS0tLS0tLSstLS0t
LS0tLS0tKy0tLS0tKw0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICB8LnBhZGRyICAgIHwg
UEZOICAgICAgfCAgICAgfA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgICAgICAg
IHwgICAgICAgICAgfCAgICAgfA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgICAg
ICAgIHwgICAgICAgICAgfCAgICAgfA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICArLS0t
LS0tLS0tLSstLS0tLS0tLS0tKy0tLS0tKw0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFANCj4gDQo+ICBQID0gcGFkZHIgKyAoZmF1bHRfb2Zmc2V0IC0gcmFuZ2Vfc3Rh
cnRfb2Zmc2V0KQ0KPiAgTCA9IHN1bShwaHlzX3ZlY1swLi4uMl0ubGVuKQ0KPiANCg0KeWVzLCBt
dWNoIGNsZWFyZXIgbm93Lg0K

