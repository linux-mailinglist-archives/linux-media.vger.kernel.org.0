Return-Path: <linux-media+bounces-22581-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD119E3638
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 10:09:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC2582819C5
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 09:09:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76CCA19F475;
	Wed,  4 Dec 2024 09:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OcypJ2cT"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946B91990D3;
	Wed,  4 Dec 2024 09:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733303364; cv=fail; b=hXAJp90DXLTfVyTeX4h4XKh/s6byX7NIJR/PoCK3nYQlR52Bz7gwdWUsW9SiRpxfN53V/vkrp6hfCOBlTQPrHJJ14NrxE1oMhXL4oCaQLT8OSPBOqpzrqAQbq3lVljX84X4Wra/iRXj6s8J3A59Bew05MI64ltPHfiefpLZAwXo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733303364; c=relaxed/simple;
	bh=crbxIXmUOIyun8oLVkLaFvpAmryfdfSExffo1lkBxhU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UImRIN872ehF5So5b6bIS4zmfbXU+fATe/2fRSJLNbZLnVR5ty6Oevj3Y/ivPCql6i5j5ZuYEvs59twHNaSTKVN1EMmKf9CEJH5A3+KD7mFGvctr37yT2LiZ7xLjo3CN1weEGxR56uEWGvzUxTbor0SogWZDvmDHgyC61q13bp8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OcypJ2cT; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733303363; x=1764839363;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=crbxIXmUOIyun8oLVkLaFvpAmryfdfSExffo1lkBxhU=;
  b=OcypJ2cTUHrj0CUoxVOrh7c15OvRc7qeeM9xZOAzyZdvRcf6jL7/AkfR
   YzQPVfUiT9cbHDZWAEKpHTJ1lDjNNGy7huz/x20kOD5edNK040buzTgKU
   E0DmsSFu5Fe8EowZVt6NnC5fIrAUsSb4CVxH+Hw+YEJtSG+tB0K9c1708
   SoCXuL8LdSu9HUbhfbp4mWHEk6MWRn5zpi8xoeDQTfKMyLJZJzUFeHu+I
   Wmfp3IG3Sy4O7kmpu4YOJEedtwpOjzV2YX+uTEVI19TkhrgxeiZIwVcDU
   HA0J+MY2c08Wc6easI6iehlgwRCryHyW7dgEmS3mr82MV3jR89kqTjHIs
   Q==;
X-CSE-ConnectionGUID: mGxMUDKrRxmZx2JGy1XI1A==
X-CSE-MsgGUID: FUXch1yERBy1H4yB7CrBpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="32900654"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="32900654"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 01:09:22 -0800
X-CSE-ConnectionGUID: XgVeFFIpS/Wgy1Zyi/lOhQ==
X-CSE-MsgGUID: +oZaWiR+RD207tOE6SSB/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="124636244"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 04 Dec 2024 01:09:21 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 4 Dec 2024 01:09:20 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 4 Dec 2024 01:09:20 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 4 Dec 2024 01:09:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CyQYy+pqYhy0i/CSH4OQ4JxgBZEXZqplr5JOwPUC7Yn93X8/dVXSmRu+G8LTfo9XvtBks5ZeTEzDvrI/oSYQTBquryP7OgCGvjEFhEGnyV3Q0bYe73iL61GiT23gEO6+Yxs3HmEOoswdHTxe3erfL2N2KjAsEezN4pBco+r3t79qVjCrmqgj0/Ex1UMQb07rZK4TKbcnO725ck++fU4giGbU5VJ1pzCBh4fKkFADmCQ/MO9YORFKYrQayvxKL9LZqx9kTdE6o0XDNwJ4uwz+lZ+hOVVvoL7TFcg+OxOyildNP1Ye2DH97QMux05o8i/XASvteiCQ+CHFpNVmgroUag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=crbxIXmUOIyun8oLVkLaFvpAmryfdfSExffo1lkBxhU=;
 b=Y1JZosUv5Mf/FOPnxw7J7/RmY7DKSyQzQUK0YsMCz/ATpX6bBmtUveWOU3HC/UcdFnxbl74CwtRIonBX4PutrYrYNOW2GEbwzogcImHU8qG4+kstrs1mlJlVvy/kJk3gcjNZpGwHuKq8hARKXdKXsSBMYsmIfBggZO8tGlk/YDiqFE6X4w76UZrmuQOYGYa8Qwtc0JkRPjeEN2CXornYZEait7Rtuqt32VVfepslfaWdpVnj5l4QgUHtvbBiOjSBeknzHBCUjhU7/Bp0IaOU+Z7hAuZGF3g6JrPOINAQ1hAkdRSzdgstqllJm10rXgQA1fEZ+e9RV60+3Ab1Hn0ZrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by IA1PR11MB7727.namprd11.prod.outlook.com (2603:10b6:208:3f1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Wed, 4 Dec
 2024 09:09:17 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%3]) with mapi id 15.20.8207.017; Wed, 4 Dec 2024
 09:09:17 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Jann Horn <jannh@google.com>, Gerd Hoffmann <kraxel@redhat.com>, "Sumit
 Semwal" <sumit.semwal@linaro.org>, =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?=
	<christian.koenig@amd.com>, Simona Vetter <simona.vetter@ffwll.ch>, "John
 Stultz" <john.stultz@linaro.org>, Andrew Morton <akpm@linux-foundation.org>,
	"Joel Fernandes (Google)" <joel@joelfernandes.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: RE: [PATCH 2/3] udmabuf: also check for F_SEAL_FUTURE_WRITE
Thread-Topic: [PATCH 2/3] udmabuf: also check for F_SEAL_FUTURE_WRITE
Thread-Index: AQHbRaiQNDoQrjVryEiFB0gBzzaLf7LVxbVQ
Date: Wed, 4 Dec 2024 09:09:17 +0000
Message-ID: <IA0PR11MB71852E284842DD85061F9CDBF8372@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20241203-udmabuf-fixes-v1-0-f99281c345aa@google.com>
 <20241203-udmabuf-fixes-v1-2-f99281c345aa@google.com>
In-Reply-To: <20241203-udmabuf-fixes-v1-2-f99281c345aa@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|IA1PR11MB7727:EE_
x-ms-office365-filtering-correlation-id: af3ff589-bfc1-4759-9cf1-08dd14435508
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RGFPRVJobk45WUZTcDd5eHFadmJidVpZQkFQN0MzS1doMzlYMVdjejc5WVRk?=
 =?utf-8?B?WDBYeitzTnRkdHZ0ZHhURzJ5VkVkYU9SUzZQSVN6elh5YXBQcU54djU0WTlm?=
 =?utf-8?B?RE5TY1A0d3NKNlFWMDlPdVJFSGFDM1pNSytqd0NWMDZpNGIwdnJLMTU2aFUy?=
 =?utf-8?B?RXVTRmtKYTBWYW9CclI1YVdJZUwwaFkyd1lQWHpkRzNEci9pMzc2RTZhdGZ0?=
 =?utf-8?B?aVRYRG5TS3g3MjdCZWhMdzhWVWd0NkVOd1poMFV5Smh4UzdTYUdnYnk4VnNZ?=
 =?utf-8?B?YlY4RnE3T3Z0a1BYK2dWM0hkSEtRNCtLbVRxbndLUFplbkhIQTY3TGZBbzBy?=
 =?utf-8?B?SlB4K21tT2ozQVhGcGM4eUR0NlA3U2lhOVdpZTBjYVlqVVNtWDE4Y01RUlNr?=
 =?utf-8?B?QVN3V2hBTWNJc3c0RmtFZVg5M09uajduZmRVSWdlSThMa1kvREt0WVAzdFVR?=
 =?utf-8?B?YzBHN3dLYzJPQ3lVM1l2U0ltNUxpR3BLSVlaNXVyZnlFZzAraHlES29MM1hr?=
 =?utf-8?B?RXhqckU5RzdsbkdlMHhGWXRkOEZ2WWZDNis5cFVnalJlZ1JKcG9nNjhXM0o0?=
 =?utf-8?B?Sm9yVlpIZ05UeStQZjBnWXVKc1E3RDJ5bHF4Z3FHYmMvTC9qeFhCWHRpNzFR?=
 =?utf-8?B?WU5qdDVmYzArQytEbkcyOE9OaGlZNDBqMWRqTy8rT0ZBUG9KUEhaY0p3QlF6?=
 =?utf-8?B?dlI0S1ord1lmcXowbTUwWUV6aWx3ZzBhWGxXUi9MaG5teSs5eC9kaDNLeEZ0?=
 =?utf-8?B?d25uZzFMenBCVWNkT1NHVUhSOUZwYUVTdjZVNE80Z29IRUVVMWpZdktpMDNV?=
 =?utf-8?B?Vkxnb1NTMUZXdlNHRkdWenVZZWl0TXBPbUxpSE4wSTVHRjcrTHRFUnNHRHc3?=
 =?utf-8?B?R1RZZkprYzE4QTRPSjlvK3RYK3ZEV2R3QStYbzM1TDZFWkRPdEVzSkdtUGly?=
 =?utf-8?B?YWxWdDRSTk1oRWI0UVZBeHAwVENpNVZ0Z0RVNlk3OUg5YU8rWEs1UWpxdlVv?=
 =?utf-8?B?TWR4Y0pJcm9meGdCbFFXZWd4ampCaEd3UGNFdGVjZGgwU0VxcXFkV3lrNmRo?=
 =?utf-8?B?NEd3MVQ0QVc4ZVRKd3VTUkdudFh2VkRzK2hKSXhGZjQvT2UwNnVabWFxNTFT?=
 =?utf-8?B?MFhxaEVjMUFudGNqUVY1bjFDS2VpZW1rTGhScGo0MnVTN1IvejhQVEtFS09J?=
 =?utf-8?B?dzhuMW1XK2s3YXlDSlNpVTN1YlhSSVBtWEtqclo2ZHoyMVVFUC8wcTF4cGdw?=
 =?utf-8?B?NjRITERKRldEN0U3eXBnektBa0EwWUlyKzdLT1VqczV5aG9tcXczbVlkajVM?=
 =?utf-8?B?eURyMjh3SnpUYVphR1daelZDamhHeTRaM3Fsb1NuME5zdFdvK01YdDVkK1Rs?=
 =?utf-8?B?TGlyYXo5T2hNV3g4VHJpRy9RMU93OUROaUh3eUE3aElHZk9xWWlDaHVDU3Rs?=
 =?utf-8?B?SkR1dmJrYnArRVBjTUZUS3A4Q1U2OGE2bE1GSzB4Mm9tM29BZ1U0VnpOd2s5?=
 =?utf-8?B?eld1Z2Y1eEZFay9UMTR0TGpwNGtBTnYyMUozTWRCUnZWelMzL0NQa2ExZzJu?=
 =?utf-8?B?MUpMYzFJRjJUSTMyTkQxSm10VzhtSk5LVndJM0xtbHBDTVdwTXZoSjFoVE01?=
 =?utf-8?B?VzhHN3ovek92N2Y2bnZmVkZGbXJCTHNRMkx2RTVEdUVnZU5sSGRYNGdCK3BZ?=
 =?utf-8?B?cW9LRmNvS1JTOFJUbVdlcWIvL25HRVJobFNWRmpCSm1POTZnYXJaZUZNZ2ZN?=
 =?utf-8?B?KzgvaTU3STZRTWs4a3dRRHNkMDN5cFRRWFJSRWIxSnZacmE0TWdGNjREK0cy?=
 =?utf-8?B?b2tlZTZ5SjRwdWMvOGpXY2NkODdVS1pNSXdLN3UrajJxRkJFVzB6L3VvazFh?=
 =?utf-8?B?Z2RuUUR0NDFxQkszcjV1a2V1NXdsenZudmpVVE1VSUJaMlE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7185.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YlJhalJlMk5TOExTNHMzazUzbHJES2dXMCtWYjhhVFN3c3ZDVE1jWW1Ccngy?=
 =?utf-8?B?eEV3WVJJeHJ1YWFzRzUzQ0ZMTWlWTk9sN3pQZ3pvS2dsOXJpbHp2Z1hhUWR3?=
 =?utf-8?B?M3IyWlBxdHVxMU5WeUwxTXc0WWNDZnJwaS9CaHlhWWkwS21zNW5raVVoaUw4?=
 =?utf-8?B?c050SzEvZ2RYS2o1T1hLMXFibk1XOVZ6dWQ0c0FRNVBIUE5rdG9OT3JIMk1F?=
 =?utf-8?B?ZXdnS3RrS1JDc1ViU1ZLNDlCMG5wYVV5WWJFU2l2akZreTQ2VkNtbGRONmkw?=
 =?utf-8?B?VnJLYVpCYzFNanVyUlIzSVlzMHkybjJBN0xLTFFBcVVhMzJrWWNyblRvRytP?=
 =?utf-8?B?UEprMmZ1bEd5SjJ6UWg0OHlvR3NqK05DcEk1VDRBcDJkRkNtbVd4OUJrUzla?=
 =?utf-8?B?YkVoZmY0bXNvZ25uU2p1T1A4ME5QWlVrWllxcGUwd2NBQ0orNkdjVEJTdElX?=
 =?utf-8?B?ME1tNjZ5UU1NSEVoaktZcG14ckRzVmdIeGN4eXFETjdzeWpsWGdhOVpiTmVI?=
 =?utf-8?B?bkV4amQwcGJFUnZ2aHJkY2pKczM3NTNDbU1CcE5lMmkycmtPTzVDUlBKMXIz?=
 =?utf-8?B?ME01QjJHNjZzRHBjYWV4T2h1YXdjU3lINXNHNzc1aW4vS1VJVTNkK1lFZzVM?=
 =?utf-8?B?b3NIeDBNSHJpdEY2RkVyektuellLSVlpaXZTcHY0L1ZoNTZ4RGpPc2dqYUxj?=
 =?utf-8?B?RE1ISjFDejljWFR1d3o1ZVJaeDFSY1lSeEE2aUxsdkhET2ptby9zbDN5dld2?=
 =?utf-8?B?T2xtc0VveTZVbnluM0kyUHcxcGx6c0ttUVl5Q3JmQ2VYZjNtd0pqODlkUFBv?=
 =?utf-8?B?emd2emhiS0xlNXUrK3dubEZLZDkyeWdCaVY0My9ZOTVyL2lvbkVLSGdEUVZ5?=
 =?utf-8?B?NVRJeUNka0MrS1dTcDNNMnpGRXovcFgrUWFLbzcyNmx1bWJXeHBlTkMwaDBa?=
 =?utf-8?B?TnVuQWF2ZkpBK1RraDJzR0V2eTcyTG0rbFArUFIyeUlkM3JhK2dyVFhmaWxN?=
 =?utf-8?B?UkJjbnhDb2M3bjhtMXd0akViQWpjT3FnUWNDRzJGVmZRN1BjZVNqbU50S0xW?=
 =?utf-8?B?K0IvaUZKT1Yyd3ZYVDk5ZlozVUZIdU93aTRNc01OZS9CMDJ4ajlpZ25XdGtj?=
 =?utf-8?B?RkZtdFc1VmV5TjNtUFZFRFJyVzZUNDZKYitKL3ZuMzlrWEhWTFFjRWN1VG1G?=
 =?utf-8?B?cE1TMkFCOEpWRkZTdFR1eXZhRFc1NzhjaHVWV3RETzlxKzBlZnhIb0pnSnU5?=
 =?utf-8?B?aVdkYkxiWTdPVnFTMjdaemtNSzJaMGs4bGh5R0FOaTdMQmJ5UzJiUFhNc291?=
 =?utf-8?B?bmVZTzVGVXVHQU5BeUlyUmM0TkluL2g4VnZjL2wvb29TQnBXWUk2K3Q0NjlF?=
 =?utf-8?B?cFc5cjFjQW9FcW9WalJocG1OdFNqMGdDMkVIMGFQK1RwVnBmdXY3Umt6djZH?=
 =?utf-8?B?NkovNGNlNyszZ21UK0xJMFR2cHhxemRFakIzdkJPZllLa0IvWUNEeG9JM1Yw?=
 =?utf-8?B?c0NyS2k2V3dDb0J6MU80bUhPSXl1MnB5eEV5TFRmL1U3WVBXVkFuWlFBZFdx?=
 =?utf-8?B?WkpOd1ZiajhSMTVzWUc0c2RtMG1ZMlg2Zjd2NzVYK0hEc0xxc2grellMM2VO?=
 =?utf-8?B?T29QZVlabzNkd1NUZUI1WWRsWFRRNjdzc01SMWcvK1VKVzB3TlRwUVF3UHFn?=
 =?utf-8?B?Zy9SMitLd0x1R2V3ZGpZM01ZOTVuSlNYakNwVTJsdVNKTmpWWThORUhXb1hv?=
 =?utf-8?B?Wm0rQzhYcHloMHhmQzIwaTJYNDNaUnFpdVQvUkwzRzhLVkN0dzNWbTBNUTI4?=
 =?utf-8?B?aFJZTnA5Ui83eUVWYjdQQlNGcS90TUY3cERJTDdSZXFJOW83K0dtNSs3RFc1?=
 =?utf-8?B?Rk1WVk9NOG9haVkwRkptODdEUkdwa0ZjaG9Ndkp3d0dxQ1hQczNZaWlBV2dr?=
 =?utf-8?B?ZUpJb1FFdUJ1MDduMzJLSjU0ZUJmNkZOWlJzQkNUSWhMUGhleUdoMGZMWk9a?=
 =?utf-8?B?T2h3bUVxZTNMSEdUbGtaSVJxOW5VaURjYnhwdC9QaXlGZG42aGJuaTY3Unhp?=
 =?utf-8?B?WFQ0UXN5d3UrWVZFVEE3VUdvT1pxMXVGM2NEbjQySFN2OVZPSEFxb1lqTUgv?=
 =?utf-8?Q?DtM6Z/YwgUa5ZW5/AmVoqBNIS?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af3ff589-bfc1-4759-9cf1-08dd14435508
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2024 09:09:17.8050
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AQzpr33HnvYNGgeQAZykjQ7LKYRGCZHIqDQnT+qJE2N5aGavp/9BuX1adMWs71C1AnF6896fqQQdh6o/9fNm8wsBb3XbDNkeIKGMANROvCs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7727
X-OriginatorOrg: intel.com

PiBTdWJqZWN0OiBbUEFUQ0ggMi8zXSB1ZG1hYnVmOiBhbHNvIGNoZWNrIGZvciBGX1NFQUxfRlVU
VVJFX1dSSVRFDQo+IA0KPiBXaGVuIEZfU0VBTF9GVVRVUkVfV1JJVEUgd2FzIGludHJvZHVjZWQs
IGl0IHdhcyBvdmVybG9va2VkIHRoYXQNCj4gdWRtYWJ1Zg0KPiBtdXN0IHJlamVjdCBtZW1mZHMg
d2l0aCB0aGlzIGZsYWcsIGp1c3QgbGlrZSBvbmVzIHdpdGggRl9TRUFMX1dSSVRFLg0KPiBGaXgg
aXQgYnkgYWRkaW5nIEZfU0VBTF9GVVRVUkVfV1JJVEUgdG8gU0VBTFNfREVOSUVELg0KPiANCj4g
Rml4ZXM6IGFiMzk0OGY1OGZmOCAoIm1tL21lbWZkOiBhZGQgYW4gRl9TRUFMX0ZVVFVSRV9XUklU
RSBzZWFsIHRvDQo+IG1lbWZkIikNCj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcNCj4gU2ln
bmVkLW9mZi1ieTogSmFubiBIb3JuIDxqYW5uaEBnb29nbGUuY29tPg0KPiAtLS0NCj4gIGRyaXZl
cnMvZG1hLWJ1Zi91ZG1hYnVmLmMgfCAyICstDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1idWYv
dWRtYWJ1Zi5jIGIvZHJpdmVycy9kbWEtYnVmL3VkbWFidWYuYw0KPiBpbmRleA0KPiA2NjJiOWEy
NmUwNjY2OGJmNTlhYjM2ZDA3YzA2NDhjN2IwMmVlNWFlLi44Y2U3N2Y1ODM3ZDcxYTczYmU2Nzdj
YQ0KPiBkMDE0ZTA1ZjI5NzA2MDU3ZCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9kbWEtYnVmL3Vk
bWFidWYuYw0KPiArKysgYi9kcml2ZXJzL2RtYS1idWYvdWRtYWJ1Zi5jDQo+IEBAIC0yOTcsNyAr
Mjk3LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkbWFfYnVmX29wcyB1ZG1hYnVmX29wcyA9IHsN
Cj4gIH07DQo+IA0KPiAgI2RlZmluZSBTRUFMU19XQU5URUQgKEZfU0VBTF9TSFJJTkspDQo+IC0j
ZGVmaW5lIFNFQUxTX0RFTklFRCAoRl9TRUFMX1dSSVRFKQ0KPiArI2RlZmluZSBTRUFMU19ERU5J
RUQgKEZfU0VBTF9XUklURXxGX1NFQUxfRlVUVVJFX1dSSVRFKQ0KQWNrZWQtYnk6IFZpdmVrIEth
c2lyZWRkeSA8dml2ZWsua2FzaXJlZGR5QGludGVsLmNvbT4NCg0KPiANCj4gIHN0YXRpYyBpbnQg
Y2hlY2tfbWVtZmRfc2VhbHMoc3RydWN0IGZpbGUgKm1lbWZkKQ0KPiAgew0KPiANCj4gLS0NCj4g
Mi40Ny4wLjMzOC5nNjBjY2ExNTgxOS1nb29nDQoNCg==

