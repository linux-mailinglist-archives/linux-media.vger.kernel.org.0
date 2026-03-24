Return-Path: <linux-media+bounces-56828-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBReJ9FMwmnvbAQAu9opvQ
	(envelope-from <linux-media+bounces-56828-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 09:35:29 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 47748304B83
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 09:35:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 63C64306D455
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 08:28:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2268D391859;
	Tue, 24 Mar 2026 08:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vk87pUTr"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2FD1390C95;
	Tue, 24 Mar 2026 08:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774340870; cv=fail; b=KVadn/IVaWvrE2Dz72rf6BbtUtBvzw/FAszYOHHuhANnro/wWOm8lHxxnbRCPzeYYtzVwKZY/OAyAF5uzdHSqS9zCau1ODdpVAq3gzzE//gb1U2r3X3RRDB9q+cBYJlS7mDXslpIDsErc/1y9VzGrWeqpaRkvyBwIkmXasufwKc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774340870; c=relaxed/simple;
	bh=eti6EnmQCZ2xMj4Tk/fhCHqo9DfAhwdHDTBb7fOeCIs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XLopQCquHfIO6VFmm1KupNJGiHal27hkFu+hssWcqaXkwcmZHzLoLq9trAwlBbDHQzEUil8CUYr4zMhf6YV1sZbvt7aknvlThw/1BrrnvFeUQE6DsgQldKFbFzmN5cy7XKiIVONQf+9N5xug6u7amss4JIWTLhWun+bJQaGYZHk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vk87pUTr; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774340863; x=1805876863;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=eti6EnmQCZ2xMj4Tk/fhCHqo9DfAhwdHDTBb7fOeCIs=;
  b=Vk87pUTrCWlnOIwpbGy10109uWlraFazMOXAIHBtHCsjqe5XU6qyh1AI
   /+lirYP7MzYGpPUcBUeE324OEsxfJGYgSdtoqZypHmfCE6W8S4STpUbBO
   r29KdBqTWu4eFxICf5jrow5fhPZSVWpDUdfxR2XxNfl7ShmGeH6hWO8mv
   jHUubf/X3TiOTJsQrqMTxMLkVS1SA8FsdQKT82bzqXR9Smjv4Wp2N80M9
   5ZDjh+GLF3MVV22C/kcolXO+lsxjnzvFI8swfBybpVNLDhxRM2GWsSBbb
   V6kcY1ANcDu4kYfU2n/2Y7SJB0vonLnlv5q+NVD9VA46tligSdhUWb1EW
   Q==;
X-CSE-ConnectionGUID: IH631gJuRA2Db7LDhpAFgA==
X-CSE-MsgGUID: BIWnYecqQtqzq71NZAuIdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="86046834"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="86046834"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 01:27:42 -0700
X-CSE-ConnectionGUID: yWQvczyqTlandXRb9gd8Ag==
X-CSE-MsgGUID: PbmXgExUSdqjbWGDGBEwIQ==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 01:27:41 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 24 Mar 2026 01:27:41 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 24 Mar 2026 01:27:41 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.69) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 24 Mar 2026 01:27:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oIDHAqsMY1expPd48y4fFFNry2sGt58PkPsN9BZJS4g3dgrvS1Xq66L98eNKTl8P966s42mnR1O4AdCofxqW9nrVxcdrqWyNtM/GGPxKvZL9+/HbSzJZicmjp/Afq7sUdnTRW/E++JVcnKC/bjAK2Vg5EFuj/736ZZRViJKCbdtTN6EABwRf0ceODr6F4pgXVyTo9toLqLiVWzDDsaWMf3FaswvxHsJBC5SbDE0FPQUYhKuTcoKdFMZwcbSf5uJrSQjUGmyjW5q+6wK4QsmaiegXFosZ1ZFbTSFSkHFImetISgKTK9NN7G4N3jd7TFHOqi4Z/XJFNZp5DpDkJFxqvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qb2zHi7IyE4ImgCQqYwMNLvLdHXtt1CUfrquttCHfNA=;
 b=FmNhSa/XzDLau88/af1EEVoORs/cPtax2Hidr/Ya7T/sVxEl2LDHlR2WRLvd8dlp9MsCRcommDabSSIqWy56fPRhBBUEqrxAFu7LqfHqrZE6e59dWuGsoy/wbZ5X9Z57KEljHQDmoZfW58uK+LR2CdLLNWIyKzHQNVqDfDaVqNJF77zirhzYjnOFTXP2plH+Y2TIdHV6Or1+6M55gpRspK2+HzJTXt35DlYRoO7VcBdvoH9ErfwkT9oXl/MJeupK36PuCS1k/VqbbPlJu/eupfyVCt6ipUI80vQmSiv0c4VYV4/u81RDhPpXOGKfhKxsz7V9dD1Pv9lsIS4+744ZnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB8022.namprd11.prod.outlook.com (2603:10b6:806:2fe::14)
 by SJ0PR11MB6624.namprd11.prod.outlook.com (2603:10b6:a03:47a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 08:27:32 +0000
Received: from SA3PR11MB8022.namprd11.prod.outlook.com
 ([fe80::5bc2:3dd9:94f0:21ce]) by SA3PR11MB8022.namprd11.prod.outlook.com
 ([fe80::5bc2:3dd9:94f0:21ce%4]) with mapi id 15.20.9745.019; Tue, 24 Mar 2026
 08:27:32 +0000
From: "T, Arun" <arun.t@intel.com>
To: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
CC: "johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>, "Kao,
 Arec" <arec.kao@intel.com>, "ilpo.jarvinen@linux.intel.com"
	<ilpo.jarvinen@linux.intel.com>, "dan.scally@ideasonboard.com"
	<dan.scally@ideasonboard.com>, "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "Djait, Mehdi" <mehdi.djait@intel.com>
Subject: RE: [PATCH v4 1/2] platform/x86: int3472: Add TPS68470 board data for
 Intel nvl
Thread-Topic: [PATCH v4 1/2] platform/x86: int3472: Add TPS68470 board data
 for Intel nvl
Thread-Index: AQHcrYdZgLR4y1PdOkqwcAH2m3V2krW7vJpggABLo4CAAUov8A==
Date: Tue, 24 Mar 2026 08:27:32 +0000
Message-ID: <SA3PR11MB802232540AF3AA7ACC64E00D9D48A@SA3PR11MB8022.namprd11.prod.outlook.com>
References: <20260306163019.1619490-1-arun.t@intel.com>
 <20260306163019.1619490-2-arun.t@intel.com>
 <SA3PR11MB80229E0FF7B1E8B32EB35E689D4BA@SA3PR11MB8022.namprd11.prod.outlook.com>
 <acEY6_sFAnb3aHY6@kekkonen.localdomain>
In-Reply-To: <acEY6_sFAnb3aHY6@kekkonen.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB8022:EE_|SJ0PR11MB6624:EE_
x-ms-office365-filtering-correlation-id: 6c57ecd6-ef1a-4611-9878-08de897f3201
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|22082099003|56012099003|7053199007|18002099003|38070700021;
x-microsoft-antispam-message-info: V8XK2hGtvgIk7FmBWQA4eBMohTaKtm74YGvZfrf52BpZOJSq9+O8uNzYbou1Fs8jUU6yv8dJOATunkWQDBZOMZ36zrdv2+3lHpZ2NYY1pUXCneFDuv2pkgjEkubrDemIcrev1SMHlWjwgIItcDWips/ViFSY6byYZwEGwd/bgl24EBUjZzzCq3vFbgSZh27BjZ2OGiOok15OLJR98orUaqJn4CmltohYAvGnR8RnEKn90xnQ4QRE9ck7QxSKcr0dUEQr/S5zSE/Ip5gcKP/uDezgtH6U2/56xwYgC9uCl+TKLn3FnjdXAsxxa+uCJNXPWP+iBxRVz+OWjB7aK7njJq/+so1uyyFGlUEUJTt9ISEO8AEnweuwO3T1NW0A2ndmrapBHrcxlTFLmFyZnth7LO3Yp2/P0OCHFaRwIoIAtub7F13ucSRNPfukGFSplCkDahwftAiyQLbxP1KlcEeKzO/s6YHjFhZ0C+gtYj1Y/tysCn1GidHR4jRQvsHMzHQETXYbfmOFe+24tn7Z6WOHjuBuYRH7PcJ/eigsXNkGS83+C1vnWEoJRIn1SX/A55nfMq/+/eQdcUXNPDtu6/gctZg176JFJRxZ+3Qeeau0a3DcYCmluF1LI9gmtsgszap2syi1Kchv/Fxf2OZrMUvUKboMP31uLOp8mZQeE/hwut+36WBMfjxm8/rsREW5mhL7FbTJLP4TTs2MeN7e7Ip9TPMfdNUqgUIhXRxGlmK8EDUgAavy72qb0D5P8fgFsOOR+lNU4QUrkxqAKy/E5ALK5dzkyvcpfgWJUaxC+ZFnuku7wP/K5a2mw2CpqcIYEJkd
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR11MB8022.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(56012099003)(7053199007)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?v2VhRvrb6MTidbQMXqYVSTyq0YDcrSAg2CbeTEi4YYtDF3A5A26FERpVB+Ij?=
 =?us-ascii?Q?GMCFYLGBsuY/MmrUgJskwl2fpqdODSbJNNSgNf4S//73tYKDJtp+cpBEVxZl?=
 =?us-ascii?Q?KqXzbWKhtxNshA+qqQf3aQNBAdEfVQHRtiE37AmE3TkCWOQuHaMMBk6t7+xr?=
 =?us-ascii?Q?FVA1RMX8CUB7fzJ2a21ryEAhMosQGR+n0chu3Tnv/DbVaCMvAEuZlwjAg/hg?=
 =?us-ascii?Q?2tPsQHDlUVXgUMTWic2Wp2Umrzs0zdUSsQHjuuw7LYN2Xhvbiub1qIlOEo71?=
 =?us-ascii?Q?1XZV/GSzDoo7BKP8qrYXNasMgyEtGnr5xcoC8/AkTPENIImDgxAQH6aPzlw1?=
 =?us-ascii?Q?y2vBa5Sva49FoTaqxXzo1v12VAxK4AozfBM7mhHIxY7/TCm1F+mm/p9FUtZl?=
 =?us-ascii?Q?2UYOYxW9+2rg5+2a5y6snSlo3H5Ch6rNB/5FDTbI23IlpqUHBoG/2z8zuORF?=
 =?us-ascii?Q?00+GzeTly8eH6cdMrlviPubPPLEvoTbeppPILMHYyrw2ODOAiSdyx6W4t8dW?=
 =?us-ascii?Q?Fpn6iKE/ACwKtoP7adXR1W4/Ck1SFgp7kxgPHQ5M8I4aAXqzQY8OBt+sLY5l?=
 =?us-ascii?Q?ltzKCm30iVIj+RVpdqjfQo4mEdU0G4PMGdv4t4etw7qZMj1LW0xqe1snlZ5w?=
 =?us-ascii?Q?ceLm40tOkQjdJ2+yhqcxI9aBGPUo55NN8MDu9wuvcDR07Ao8ijqS2i5CB9uD?=
 =?us-ascii?Q?EZ3kUZqwLOqdAixl+2Lwtva9uQ+a4CWlGx2XZ/5ZTv9O9ciSvUgdesSVVN+6?=
 =?us-ascii?Q?032IhvwlpSSo9/4b9G/OiogJMUIqOP/t4GV8KttsmISdjtGOSa3RedQzrXrB?=
 =?us-ascii?Q?k9WpThqCuk8PAohpH2BnAJUFXhMcE4tqhYqQGOYdnP3L0AkffK6ykIArr24O?=
 =?us-ascii?Q?EoZ1aV2b2Bc2IvjmJckssyd+Dl9+PTWPF/A9Rczr5bfE/S6XMt6WnfPR0Nwc?=
 =?us-ascii?Q?4aQwiUH3G0wzwGrhmAoYmXLXqmIfS4rNp1hxk6K+RJoqzd+DiJTXZOYCQ0hI?=
 =?us-ascii?Q?9e14sn06iduMhC9NU0G/aiqeCOWCg20EFxxq9fQEsiPdg8CdvzRf4Tr8IpZU?=
 =?us-ascii?Q?0Tb6W7VAXlGTjDaq13Y3GtfCkxiK0HRNOuQhvaUaTt3TjgJS1cXcaczq5AhT?=
 =?us-ascii?Q?sb5UFyberzg+uxMrMthzHleSjrBdM+dCQtp91rtdo2azkoXKRTpo6CqUtWS2?=
 =?us-ascii?Q?haFO0PrvbaMXiGEkhZeKYq0R/26wbIsZftlRwnEtR9kUe17QNufesTAchgTF?=
 =?us-ascii?Q?JhaOBtPN8vqY19oXqA3isE1044wO+XnKAvK/sK8sfBuovmN0I/tgILO8mWSQ?=
 =?us-ascii?Q?9e8GzUutcCmlugeZkLAQLyx1sG4tHbAyw0KVVHBiiNIHmD7YiaX0AeiDXXAq?=
 =?us-ascii?Q?fk5NFBRN7P37Sia4Ax3qTuIvtssB6izKR/N1y4EGIkWhtHeZhKVt9/oaxxhy?=
 =?us-ascii?Q?GcDzdNjpwsIkx51wrskiS9/M8MbyFRmFD5b8uTL+C5rD9Bn2jezfsa2ppYJz?=
 =?us-ascii?Q?yaJnbos7xqnqojf/ZF10OLoIZztfc/LZpfyxpJ9GKNoUkIb7YiVsmVCsVh0v?=
 =?us-ascii?Q?8y9oxM+xqcsmelGVHEPcIT3roxWGpvaTYLuZsIagD30Z4flYdlZ0GVd/zwoZ?=
 =?us-ascii?Q?ioace2NxPE/GXAkRipYTvJiqlixmIJW9QR/zPkwMaFaPakAG71W7foVqU/+Q?=
 =?us-ascii?Q?vk/nTpEsVXikwz53ikm9eixulje2p+39046aP5H7h94AeHUY?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: K8OmExxNfPva44L/ljDdkpGZdEugBSOjUhQ5jIkE5EnhHVGOD5oKANVrPSjrvaFePh2mYi/7GFOsTEHdBcNXkLm8XydbqZrCVyoYHuduFJ+Dz51n1Orv00TSciCvGBVp7Yu/RVeCEMAxPt+X5thKnPiCySEQkXniDMI9YvNKCQ3TYgWG9Fi/IC6WY8nbe+fKrzGlx9qhaJxl6VI8sONYBHv7g5Hjp3aCrbo2Hr37LJM/xhNc7Rya7vmMnY5PVKhTx9KWRszB5KjhBQ147Or5Huv27VQmx9iecquE79Z7YlwiDYoO4Brv0fbVp+4ZWakoSK8WcpEXDQ7CkJC9oVO08w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8022.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c57ecd6-ef1a-4611-9878-08de897f3201
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2026 08:27:32.5939
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bm+NE9hPIgpA2ua4LzJtx/kBsO/jovWUSDR2acEQAjWG7h2dwN1Hi2l4P4RqO2uTaNvB3mBuvJNG1Y971F3Waw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6624
X-OriginatorOrg: intel.com
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56828-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,tel.com:url,qualcomm.com:email,ideasonboard.com:email];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arun.t@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 47748304B83
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sakari,=20

The TPS68470 is providing multiple regulators. The VIO regulator is enabled=
 as default ON. The Core, Ana, VCM, and VSIO regulators are enabled to prov=
ide power to the ov13b10 sensor. These regulators only get enabled after ad=
ding the always_on=3Dtrue flag.

The sensor does not get powered on without the always_on=3Dtrue flag. I thi=
nk there is some issue in driver/regulator/tps68470-regulator.c for configu=
ring the regulator through regulator_enable(). I think always_on=3Dtrue is =
good for this case. Please let me know if anything needs to be done on this=
.
-
Regards,
Arun T

-----Original Message-----
From: sakari.ailus@linux.intel.com <sakari.ailus@linux.intel.com>=20
Sent: 23 March 2026 04:12 PM
To: T, Arun <arun.t@intel.com>
Cc: johannes.goede@oss.qualcomm.com; Kao, Arec <arec.kao@intel.com>; ilpo.j=
arvinen@linux.intel.com; dan.scally@ideasonboard.com; platform-driver-x86@v=
ger.kernel.org; linux-media@vger.kernel.org; linux-kernel@vger.kernel.org; =
Djait, Mehdi <mehdi.djait@intel.com>
Subject: Re: [PATCH v4 1/2] platform/x86: int3472: Add TPS68470 board data =
for Intel nvl

Hi Arun,

On Mon, Mar 23, 2026 at 06:12:29AM +0000, T, Arun wrote:
> Hi All,
>=20
> There has been no reply to these below patches for quite some time.=20
> Could you please provide any feedback, comments, or suggestions on=20
> these below patches
>=20
> https://lore.kernel.org/linux-media/20260306163019.1619490-2-arun.t@in
> tel.com/=20
> https://lore.kernel.org/all/20260306163019.1619490-3-arun.t@intel.com/

Could you reply to my earlier reviews?

First and foremost, we still have eight regulators configured for a device =
that uses three. Some of them have been declared as always_on, too, for no =
apparent reason.

>=20
> -
> Regards,
> Arun T
>=20
> -----Original Message-----
> From: T, Arun <arun.t@intel.com>
> Sent: 06 March 2026 10:00 PM
> To: T, Arun <arun.t@intel.com>; johannes.goede@oss.qualcomm.com
> Cc: sakari.ailus@linux.intel.com; Kao, Arec <arec.kao@intel.com>;=20
> ilpo.jarvinen@linux.intel.com; dan.scally@ideasonboard.com;=20
> platform-driver-x86@vger.kernel.org; linux-media@vger.kernel.org;=20
> linux-kernel@vger.kernel.org; Djait, Mehdi <mehdi.djait@intel.com>
> Subject: [PATCH v4 1/2] platform/x86: int3472: Add TPS68470 board data=20
> for Intel nvl
>=20
> The Intel NVL platform uses IPU8 is powered by a TPS68470 PMIC,requiring =
board data to configure the GPIOs and regulators for proper camera sensor o=
peration.
>=20
> Signed-off-by: Arun T <arun.t@intel.com>
> ---
>  .../x86/intel/int3472/tps68470_board_data.c   | 150 ++++++++++++++++++
>  1 file changed, 150 insertions(+)
>=20
> diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c=20
> b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> index 71357a036292..8ae5e01f6660 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> +++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> @@ -143,6 +143,34 @@ static struct regulator_consumer_supply int3479_aux2=
_consumer_supplies[] =3D {
>  	REGULATOR_SUPPLY("dovdd", "i2c-INT3479:00"),  };
> =20
> +/* Settings for Intel NVL platform */
> +
> +static struct regulator_consumer_supply int3472_core_consumer_supplies[]=
 =3D {
> +	REGULATOR_SUPPLY("dvdd", "i2c-OVTI13B1:01"), };
> +
> +static struct regulator_consumer_supply int3472_ana_consumer_supplies[] =
=3D {
> +	REGULATOR_SUPPLY("avdd", "i2c-OVTI13B1:01"), };
> +
> +static struct regulator_consumer_supply int3472_vcm_consumer_supplies[] =
=3D {
> +	REGULATOR_SUPPLY("vdd", "i2c-OVTI13B1:01"), };
> +
> +static struct regulator_consumer_supply int3472_vsio_consumer_supplies[]=
 =3D {
> +	REGULATOR_SUPPLY("dovdd", "i2c-OVTI13B1:01"),
> +	REGULATOR_SUPPLY("vsio", "i2c-OVTI13B1:01"),
> +	REGULATOR_SUPPLY("vddd", "i2c-OVTI13B1:01"), };
> +
> +static struct regulator_consumer_supply int3472_aux1_consumer_supplies[]=
 =3D {
> +	REGULATOR_SUPPLY("vdda", "i2c-OVTI13B1:01"), };
> +
> +static struct regulator_consumer_supply int3472_aux2_consumer_supplies[]=
 =3D {
> +	REGULATOR_SUPPLY("vdddo", "i2c-OVTI13B1:01"), };
> +
>  static const struct regulator_init_data dell_7212_tps68470_core_reg_init=
_data =3D {
>  	.constraints =3D {
>  		.min_uV =3D 1200000,
> @@ -220,6 +248,82 @@ static const struct regulator_init_data dell_7212_tp=
s68470_aux2_reg_init_data =3D
>  	.consumer_supplies =3D int3479_aux2_consumer_supplies,  };
> =20
> +static const struct regulator_init_data intel_nvl_tps68470_core_reg_init=
_data =3D {
> +	.constraints =3D {
> +		.min_uV =3D 1200000,
> +		.max_uV =3D 1200000,
> +		.apply_uV =3D true,
> +		.always_on =3D true,
> +	},
> +	.num_consumer_supplies =3D ARRAY_SIZE(int3472_core_consumer_supplies),
> +	.consumer_supplies =3D int3472_core_consumer_supplies, };
> +
> +static const struct regulator_init_data intel_nvl_tps68470_ana_reg_init_=
data =3D {
> +	.constraints =3D {
> +		.min_uV =3D 2815200,
> +		.max_uV =3D 2815200,
> +		.apply_uV =3D true,
> +		.always_on =3D true,
> +	},
> +	.num_consumer_supplies =3D ARRAY_SIZE(int3472_ana_consumer_supplies),
> +	.consumer_supplies =3D int3472_ana_consumer_supplies, };
> +
> +static const struct regulator_init_data intel_nvl_tps68470_vcm_reg_init_=
data =3D {
> +	.constraints =3D {
> +		.min_uV =3D 2815200,
> +		.max_uV =3D 2815200,
> +		.apply_uV =3D true,
> +		.always_on =3D true,
> +	},
> +	.num_consumer_supplies =3D ARRAY_SIZE(int3472_vcm_consumer_supplies),
> +	.consumer_supplies =3D int3472_vcm_consumer_supplies, };
> +
> +/* Ensure the always-on VIO regulator has the same voltage as VSIO */=20
> +static const struct regulator_init_data intel_nvl_tps68470_vio_reg_init_=
data =3D {
> +	.constraints =3D {
> +		.min_uV =3D 1800600,
> +		.max_uV =3D 1800600,
> +		.apply_uV =3D true,
> +		.always_on =3D true,
> +	},
> +};
> +
> +static const struct regulator_init_data intel_nvl_tps68470_vsio_reg_init=
_data =3D {
> +	.constraints =3D {
> +		.min_uV =3D 1800600,
> +		.max_uV =3D 1800600,
> +		.apply_uV =3D true,
> +		.always_on =3D true,
> +	},
> +	.num_consumer_supplies =3D ARRAY_SIZE(int3472_vsio_consumer_supplies),
> +	.consumer_supplies =3D int3472_vsio_consumer_supplies, };
> +
> +static const struct regulator_init_data intel_nvl_tps68470_aux1_reg_init=
_data =3D {
> +	.constraints =3D {
> +		.min_uV =3D 2815200,
> +		.max_uV =3D 2815200,
> +		.apply_uV =3D 1,
> +		.valid_ops_mask =3D REGULATOR_CHANGE_STATUS,
> +	},
> +	.num_consumer_supplies =3D ARRAY_SIZE(int3472_aux1_consumer_supplies),
> +	.consumer_supplies =3D int3472_aux1_consumer_supplies, };
> +
> +static const struct regulator_init_data intel_nvl_tps68470_aux2_reg_init=
_data =3D {
> +	.constraints =3D {
> +		.min_uV =3D 1800600,
> +		.max_uV =3D 1800600,
> +		.apply_uV =3D 1,
> +		.valid_ops_mask =3D REGULATOR_CHANGE_STATUS,
> +	},
> +	.num_consumer_supplies =3D ARRAY_SIZE(int3472_aux2_consumer_supplies),
> +	.consumer_supplies =3D int3472_aux2_consumer_supplies, };
> +
>  static const struct tps68470_regulator_platform_data dell_7212_tps68470_=
pdata =3D {
>  	.reg_init_data =3D {
>  		[TPS68470_CORE] =3D &dell_7212_tps68470_core_reg_init_data,
> @@ -232,6 +336,18 @@ static const struct tps68470_regulator_platform_data=
 dell_7212_tps68470_pdata =3D
>  	},
>  };
> =20
> +static const struct tps68470_regulator_platform_data intel_nvl_tps68470_=
pdata =3D {
> +	.reg_init_data =3D {
> +		[TPS68470_CORE] =3D &intel_nvl_tps68470_core_reg_init_data,
> +		[TPS68470_ANA]  =3D &intel_nvl_tps68470_ana_reg_init_data,
> +		[TPS68470_VCM]  =3D &intel_nvl_tps68470_vcm_reg_init_data,
> +		[TPS68470_VIO] =3D &intel_nvl_tps68470_vio_reg_init_data,
> +		[TPS68470_VSIO] =3D &intel_nvl_tps68470_vsio_reg_init_data,
> +		[TPS68470_AUX1] =3D &intel_nvl_tps68470_aux1_reg_init_data,
> +		[TPS68470_AUX2] =3D &intel_nvl_tps68470_aux2_reg_init_data,
> +	},
> +};
> +
>  static struct gpiod_lookup_table surface_go_int347a_gpios =3D {
>  	.dev_id =3D "i2c-INT347A:00",
>  	.table =3D {
> @@ -258,6 +374,23 @@ static struct gpiod_lookup_table dell_7212_int3479_g=
pios =3D {
>  	}
>  };
> =20
> +static struct gpiod_lookup_table intel_nvl_int347a_gpios =3D {
> +	.dev_id =3D "i2c-OVTI13B1:01",
> +	.table =3D {
> +		GPIO_LOOKUP("tps68470-gpio", 9, "reset", GPIO_ACTIVE_LOW),
> +		GPIO_LOOKUP("tps68470-gpio", 8, "s_idle", GPIO_ACTIVE_LOW),
> +		{ }
> +	}
> +};
> +
> +static struct gpiod_lookup_table intel_nvl_int347e_gpios =3D {
> +	.dev_id =3D "i2c-OVTI13B1:01",
> +	.table =3D {
> +	GPIO_LOOKUP("tps68470-gpio", 7, "s_enable", GPIO_ACTIVE_LOW),
> +		{ }
> +	}
> +};
> +
>  static const struct int3472_tps68470_board_data surface_go_tps68470_boar=
d_data =3D {
>  	.dev_name =3D "i2c-INT3472:05",
>  	.tps68470_regulator_pdata =3D &surface_go_tps68470_pdata, @@ -287,6 +42=
0,16 @@ static const struct int3472_tps68470_board_data dell_7212_tps68470_=
board_data =3D
>  	},
>  };
> =20
> +static const struct int3472_tps68470_board_data intel_nvl_tps68470_board=
_data =3D {
> +	.dev_name =3D "i2c-INT3472:04",
> +	.tps68470_regulator_pdata =3D &intel_nvl_tps68470_pdata,
> +	.n_gpiod_lookups =3D 2,
> +	.tps68470_gpio_lookup_tables =3D {
> +		&intel_nvl_int347a_gpios,
> +		&intel_nvl_int347e_gpios,
> +	},
> +};
> +
>  static const struct dmi_system_id int3472_tps68470_board_data_table[] =
=3D {
>  	{
>  		.matches =3D {
> @@ -316,6 +459,13 @@ static const struct dmi_system_id int3472_tps68470_b=
oard_data_table[] =3D {
>  		},
>  		.driver_data =3D (void *)&dell_7212_tps68470_board_data,
>  	},
> +	{
> +		.matches =3D {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Nova Lake Client Platform"),
> +		},
> +	       .driver_data =3D (void *)&intel_nvl_tps68470_board_data,
> +	},
>  	{ }
>  };
> =20

--
Regards,

Sakari Ailus

