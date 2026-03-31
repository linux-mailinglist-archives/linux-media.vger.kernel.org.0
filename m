Return-Path: <linux-media+bounces-57707-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6ABhJJ5fy2lZHAYAu9opvQ
	(envelope-from <linux-media+bounces-57707-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 07:46:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F1851364373
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 07:46:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7275B30292E5
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 05:45:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4960B36402A;
	Tue, 31 Mar 2026 05:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hP09MKsw"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1570640DFCA;
	Tue, 31 Mar 2026 05:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774935956; cv=fail; b=GTnbe29+cyt3w0IE8zBvGf34Y1jrg1Ekl9hyi+tzl+rsQzMhJ60U18F9xlyhF4G2/6D6rjTCYvp/TacMPDHjlu0m7XPYIIAj9o9vb9UENIRtkDm8M7zgfVPCDnfBYAbyQar9NxpTYujSLqTzedzSz+jck4Aoum7x9QgPV0cG0ec=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774935956; c=relaxed/simple;
	bh=aXE0CpbYes/W+0ZtH5oeAj7NTgMzQIO07JOLh04J7Eg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eAe3BpwLCZjBePBxw1fFW8MfK8d9P1PZzzlqqvguQDH8K2ZSd7iVw5m9D3rCNASXvKWq9CoTBedAzM5yesd8GFry6YFfToMG88fpbLF9hYAgg+rpIWlWl2aVyAbdLmnNZ62zxLfELwmMtkNLaIECQXRbTBV8XGKuU/rFP0wmkxg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hP09MKsw; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774935954; x=1806471954;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=aXE0CpbYes/W+0ZtH5oeAj7NTgMzQIO07JOLh04J7Eg=;
  b=hP09MKswE0m21Kg6FTcZjL+Nym83TB1OOBoAYjp7HfWfiNSScodzHrml
   9ORL/9jyreT2WsaeRBiFyT2tCTWwm5Ms8+Fb+qI9bTtqzGmxeAHx7uraX
   aPt1Egl2RHumSFKrPEpGVxG8ztlS4HLYXHIRDk8Nzc8CNjI3AE/89/cS7
   DpTOjz8pCgoyeRbmFo9HYyD2beFIU7a74cJhdO3AAR6rb+v0O1e2wCa7I
   MQ8KTZHC2KhQzU4gsXnz2zBJzmKJCGKO0ABiwloqUG4fgKh9QIate/qYm
   UE80MGfenJ1bbzw53JNvbz0z/LfMDa4hMiKYKwvn8CmEnE3BwITcooA+2
   w==;
X-CSE-ConnectionGUID: dgVp/OxyT9iLfjuLjt9RKg==
X-CSE-MsgGUID: iBBTM8AxTl6M2WXHYc3xeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="86237744"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="86237744"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 22:45:53 -0700
X-CSE-ConnectionGUID: rHOBO5aZTqma4bkqUkMA0Q==
X-CSE-MsgGUID: tDS0BX+4Tqyt/rTaJbbNUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="231074161"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 22:45:52 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 22:45:51 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 30 Mar 2026 22:45:51 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.20) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 22:45:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ImC/biVQQ/4Dm6Lk+dlGuSWjJlEjLVvPH+RrBNz8MW62a3cECUChAbEVD98a1qefZtx9nNYgKxK/ska2StqKuHBM8kHfcMNLKtc112ItH2FlnoYFVxHrkvIHrSQA5FWXDBIZcxjYYwT1H2yhzfW4vRPuTrmCXrWhsDmgVxDZxNrv9whXt95Pd6AOkjvyDa4SCLsv4RKFA2a+MVI5xRD71QLR73BpBgLDXT41c9GVs5vGBF5JYYYf6h9EdSUQqQmiWQy2J0hxWGxc9oZJi8OW8RIWi4i9VWHOUPB6HUdNt5BM+5EzqfCwH/hQwsq9xpHRyRlbiiIuaTBgeh5GZ/BOAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AcobNwfQ1bzpDKAKuSLZPGJ7WaSwgJnmqV7EC4lKw5g=;
 b=E3CB1SgVyHRgCNXjfGM7HRwJwk7IvJ1uBW43SyeB9ygOyHLP9fTb96uzV5phxdONxoJ6nW+yHqFimxDGdKW8ro38tI8kuYO5uKgcaWUFzz/4ywnjksrraXUdOifxuS98ATyNvqUxBTLahdEfqavcJLa66Wo6hyD2aHVAA41nxpRn9FY7lVj+1oAQD6wUK5VTkPSZhYkVbHK4aNT704MXozRzOyMkJQju6SJT/A1tXyN/7hqT8eNLhSzU8Z2BDK3rwWBd5eykIo9HM5LsTeb9k/nXU6U4JEV7JdKTbyOBfbUjpFP6XCiO7v3f16x9GnGC121N0WAPRTVXcTlFVFK/pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by MW4PR11MB5821.namprd11.prod.outlook.com (2603:10b6:303:184::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.6; Tue, 31 Mar
 2026 05:45:47 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::9f37:cb81:5463:300e]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::9f37:cb81:5463:300e%5]) with mapi id 15.20.9769.014; Tue, 31 Mar 2026
 05:45:47 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>, "kraxel@redhat.com"
	<kraxel@redhat.com>
CC: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
	"christian.koenig@amd.com" <christian.koenig@amd.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: RE: [PATCH] dma-buf/udmabuf: skip redundant cpu sync to fix cacheline
 EEXIST warning
Thread-Topic: [PATCH] dma-buf/udmabuf: skip redundant cpu sync to fix
 cacheline EEXIST warning
Thread-Index: AQHctdAdEiBcXRZXdE6KpMVNKEWqyrXCf4OAgABYNKCABRKr0A==
Date: Tue, 31 Mar 2026 05:45:47 +0000
Message-ID: <IA0PR11MB7185A3652480207665640553F853A@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20260317053653.28888-1-mikhail.v.gavrilov@gmail.com>
 <CABXGCsOCjQQ65uO3c8DFGx+ErLtn9jSVnktb3MgVdHRfU2pbVw@mail.gmail.com>
 <IA0PR11MB7185CCB08BE83F37DC239EF2F855A@IA0PR11MB7185.namprd11.prod.outlook.com>
In-Reply-To: <IA0PR11MB7185CCB08BE83F37DC239EF2F855A@IA0PR11MB7185.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|MW4PR11MB5821:EE_
x-ms-office365-filtering-correlation-id: b91c99fc-bdff-4321-1a66-08de8ee8c21e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info: zPne0Zg9QV8aGcuDrEmlXYNjyOT5KE0dwwLg12+ltOr8pt81tSs8oM2j3z0CBaCdfneXdc3QROjLoiwkzW5USqW5dvvNmveU6taB9InLuFlJQI8nFIhWreUL/u4NjBQDZnK5zx2MUfnfAYCKNrwrAiCf+L+kHylE7IHQQjlqNzPdVX5aifSVCwKeZRCEGpO+P6Rlf5EF7M/w/N9cKOhufJUbsz/Q3wB6KY5X8tBBpJG0jwVvuxqSwFDUwO27WGOwqme1im7TU/676aOpN118MfK870iRkmmyI9EfPhau0KM7eId9eZhbLkjLpXJD3ME+Qdk8bLivICwxzXTk3JXCo/KC0wDJ+1X3/phK0nvPGSoaFzenPvgouDzmZr0jgSMMhwqF/XRcaHpjlw/a91bZxuFYrFkb0+Ms5QEu2i0c/6QHlGRQX7goV8Ywk0Sgc8pIIW/GPohrslo2nCJchG0eV8l0RrvmMuDARaMGccFKa8hiy6Rqgq7YK4zQJbWEwI6toUorKzj7oL90Qnr2mRSW0hkXLB/NcKaQ1pF5vlDko++H7li8jBKrMl9bqbmUqeM+75BxdtvGnbSnUePuqfijjr7gLmXXwTQ/jAjHxvmbYCPLb93bap0OVcetaeMkFP5MgXlfpkooa35wvxOtBr95UaqY2bVMqiCqss9gVvuEN1fgApT9/5VbMVG13lGTN9dCV477woMi63aVu3uQkQWVb4r5UsgaORjngunfpFNoXmxBw8WB4Zo+YRqkSOku1IZD
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7185.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?A7FGSYm3e8UdrOOJarfmZ/OMfyPv7St+WBET+T16vcmF2UMXmLyFlYg4okGC?=
 =?us-ascii?Q?MMwcpwqg523cCyx4SPtzVuTGA7xm9BkJo4zZQ6XRJF55rICBwFvUdQncxKEJ?=
 =?us-ascii?Q?WhOC4L/p0brk/XeJFx3ZMbm0AxaKxyDolkm2okqOx/5HepohuDz2LIObyL4D?=
 =?us-ascii?Q?PBhsUxhyhDONj9yt4mDS7FxpfdNNSX0xG/vvuGy2IYjvCZR9zY8pV6oEj+6h?=
 =?us-ascii?Q?DdyOt1yGpzni/bLftSfmkDY+pEA2XkoKkJ0GMfW/lkv+Rj9yBn3l5bVmsJV6?=
 =?us-ascii?Q?JeV6ikD/TNgGEyHjKJ9VEuAigFD5Cea2mUMforQfgDYVvk0y/BMFu6PtvGGG?=
 =?us-ascii?Q?VdDbNgwqFFA03Drd1L+qpkvB/ObO4Ll2LavffRwG19siCmNdcMMAaqrgEi+0?=
 =?us-ascii?Q?SftCGBeXUzh9era8zhi+U1fQDRdiqZ4TNcy0owB3qj4uTmm5iz3cFM4pyulH?=
 =?us-ascii?Q?KpyBOLfdWlyOm1oZyLWTgloQMu8TnxE7XL3lh5LVdrMV+1r6ehTTSqr8udRp?=
 =?us-ascii?Q?PXcGfhgW+r+t6EGRgeG7h5DaNZCBMMgahqpxWxbej8UezvpPI3kWKMvwWEf7?=
 =?us-ascii?Q?1ZexSjbIaoNYXMri+nFXjetFl8kve1g69xPLmKr81yLFzv4oBKqojjZWw6sV?=
 =?us-ascii?Q?wtlgamB33wxoK/1YQ2jqSyxpBDrrs0Hepq9eXpC46j3qARX1F9NvKTB2KZEq?=
 =?us-ascii?Q?ltBEgU9LbfVKABo3RvAI/DUTko6qfJDtE2HT6dgADYxO/UGoDjTrlthRMIpK?=
 =?us-ascii?Q?4D3QIRgKiEv7qv4svumIxzRh7QlMEFx3bmPNHaiNPNKDQlRsx51JkR9xn0gJ?=
 =?us-ascii?Q?1PvKTCXD/S4Lx7i0yRy+p0VqMAJaAY6ejHe/pqhNndwfZIRDrj0hGZSUtwwp?=
 =?us-ascii?Q?+TeTdqz+WB7KpiqvXOWM1UTblAlSrsHvZM+21maY5k8+VOfZOOCV9lLJNYzz?=
 =?us-ascii?Q?dvLxwU+zmuSfJojT33w1eEqENeiAo+9rK9bAkA8c6pQByJHnQYkTGwOOIWF2?=
 =?us-ascii?Q?eXvSPx9tT0uYxMboErvrpJgNeXcvI8P7Tsevxn6ap6cMXgVGHzzJQanpzRyC?=
 =?us-ascii?Q?Z9aV7tkxYfxP0y4EWOqdTdSLgSDr6DJFMGcNYTWHJUO5d512QtL2A+PGDy4p?=
 =?us-ascii?Q?qNPsC5BMUfCWTHj4D/LzySbS7kbioHX/WJnOp2YgxxCZBnDCh8Ywa2lcQa+8?=
 =?us-ascii?Q?wuxHizb/DtvpUmdW83pYaY8I4yi1IUl7HXNBE1gkQk3wG9PN68WG6wEjBAh1?=
 =?us-ascii?Q?95buvNYY+S2zcB4Oijxo4AB/i+q0JrdF4p3IuNibu3Xym2E86ji1K4l/lh+o?=
 =?us-ascii?Q?M1AxBQ7ZqJtxDy0chtDt2FWWQ4sGFf1L0teLuvy4WioZ5ByI0BX/bhZUF3iw?=
 =?us-ascii?Q?qenGwb9sM07+ruADt3RId9/GiToBu7MK3s+51keqRLaDTphslQHdlJqmfwGQ?=
 =?us-ascii?Q?VNCO4PHAcg9Sjod4B8ubGa9PQQCCe8zKY6yfk2zV0tz94AEwrZnn0CiRz5S0?=
 =?us-ascii?Q?bguyP97sFCq+rhNM/PvPzIi98/QjnOht6UEYDfBDLYujF+kNjJeOWkeAuqsk?=
 =?us-ascii?Q?DJGf/iu/vujNlKOQHcCkfqLe7GYFmgOSZM4PZvhOHdJZjaGhDviOG4RJiPur?=
 =?us-ascii?Q?MwsuFDrlLEKliH+wCmv+Xy/uNerR+aHsR+8OYeKFEH7Hl+G6OMENYRB1/G9Q?=
 =?us-ascii?Q?L0oqxwLzmL/pBYp3EgTRERzGDFyNIktA4jawcRBQtZJBJOjfrAqA+n+X/6Vk?=
 =?us-ascii?Q?N2+OIW0hrg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: EiC8qH4ioqCaiiUiziNDwNtjyTrn9GR0Xqr8dQcuWEDcuWQgWF4qvOE+60pa+5fQpm3cJJf7rjM0fDZUn2ebXWmEGcjesJaVS2nirFrTa2VBRrslBOy+vawTaEvHmb5N6UV3ao7UHqcI78tAatoTbjqEQFZTqKzqqLS1iOy7rLCR06QZLecZmTjocf7MfNgvOJAgZcSF7+sa+EJNGZ+M4LNpAIMNFhCC79YU3A46DNjyuStepHGmqcNLqG4kOsAMaoR3e1ULFgNwGbFEhtaar0Wvdd3K5HwJ8qpmD5QNvLfQ+B9PG0jbOhDR08Vbx0F3QRqcIz/gPj3Ub8r9PJ2R9g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b91c99fc-bdff-4321-1a66-08de8ee8c21e
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2026 05:45:47.3188
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QxYXE+cCwZZS2c7ND9y+bU2GWVIKzKNBzCuZ7//4ETBdIvzJl1CkuyUYgWZXw5tcFX1ZaJshN/c51N73RzjcqiGX7PoLJdOFGOJbPXYWIdU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5821
X-OriginatorOrg: intel.com
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57707-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,redhat.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vivek.kasireddy@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: F1851364373
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Mikhail,

> Subject: RE: [PATCH] dma-buf/udmabuf: skip redundant cpu sync to fix
> cacheline EEXIST warning
>=20
> > >
> > > When CONFIG_DMA_API_DEBUG_SG is enabled, importing a udmabuf
> > into a DRM
> > > driver (e.g. amdgpu for video playback in GNOME Videos / Showtime)
> > > triggers a spurious warning:
> > >
> > >   DMA-API: amdgpu 0000:03:00.0: cacheline tracking EEXIST, \
> > >       overlapping mappings aren't supported
> > >   WARNING: kernel/dma/debug.c:619 at add_dma_entry+0x473/0x5f0
> > >
> > > The call chain is:
> > >
> > >   amdgpu_cs_ioctl
> > >    -> amdgpu_ttm_backend_bind
> > >     -> dma_buf_map_attachment
> > >      -> [udmabuf] map_udmabuf -> get_sg_table
> > >       -> dma_map_sgtable(dev, sg, direction, 0)  // attrs=3D0
> > >        -> debug_dma_map_sg -> add_dma_entry -> EEXIST
> > >
> > > This happens because udmabuf builds a per-page scatter-gather list
> > via
> > > sg_set_folio().  When begin_cpu_udmabuf() has already created an sg
> > > table mapped for the misc device, and an importer such as amdgpu
> > maps
> > > the same pages for its own device via map_udmabuf(), the DMA
> > debug
> > > infrastructure sees two active mappings whose physical addresses
> > share
> > > cacheline boundaries and warns about the overlap.
> > >
> > > The DMA_ATTR_SKIP_CPU_SYNC flag suppresses this check in
> > > add_dma_entry() because it signals that no CPU cache maintenance is
> > > performed at map/unmap time, making the cacheline overlap
> > harmless.
> > >
> > > All other major dma-buf exporters already pass this flag:
> > >   - drm_gem_map_dma_buf() passes DMA_ATTR_SKIP_CPU_SYNC
> > >   - amdgpu_dma_buf_map() passes DMA_ATTR_SKIP_CPU_SYNC
> > >
> > > The CPU sync at map/unmap time is also redundant for udmabuf:
> > > begin_cpu_udmabuf() and end_cpu_udmabuf() already perform
> > explicit
> > > cache synchronization via dma_sync_sgtable_for_cpu/device() when
> > CPU
> > > access is requested through the dma-buf interface.
> > >
> > > Pass DMA_ATTR_SKIP_CPU_SYNC to dma_map_sgtable() and
> > > dma_unmap_sgtable() in udmabuf to suppress the spurious warning
> > and
> > > skip the redundant sync.
> > >
> > > Fixes: 284562e1f348 ("udmabuf: implement
> > begin_cpu_access/end_cpu_access hooks")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
> > > ---
> > >  drivers/dma-buf/udmabuf.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> > > index 94b8ecb892bb..9c6f8785a28a 100644
> > > --- a/drivers/dma-buf/udmabuf.c
> > > +++ b/drivers/dma-buf/udmabuf.c
> > > @@ -162,7 +162,7 @@ static struct sg_table *get_sg_table(struct
> > device *dev, struct dma_buf *buf,
> > >                 sg_set_folio(sgl, ubuf->folios[i], PAGE_SIZE,
> > >                              ubuf->offsets[i]);
> > >
> > > -       ret =3D dma_map_sgtable(dev, sg, direction, 0);
> > > +       ret =3D dma_map_sgtable(dev, sg, direction,
> > DMA_ATTR_SKIP_CPU_SYNC);
> > >         if (ret < 0)
> > >                 goto err_map;
> > >         return sg;
> > > @@ -177,7 +177,7 @@ static struct sg_table *get_sg_table(struct
> > device *dev, struct dma_buf *buf,
> > >  static void put_sg_table(struct device *dev, struct sg_table *sg,
> > >                          enum dma_data_direction direction)
> > >  {
> > > -       dma_unmap_sgtable(dev, sg, direction, 0);
> > > +       dma_unmap_sgtable(dev, sg, direction,
> > DMA_ATTR_SKIP_CPU_SYNC);
> > >         sg_free_table(sg);
> > >         kfree(sg);
> > >  }
> > > --
> > > 2.53.0
> > >
> >
> > Gentle ping on this patch.
> >
> > To summarize the review so far:
> >   Vivek: "Looks OK to me"
> >   Christian: Acked-by
> >
> > Note: while my separate dma-debug patch [1] would also suppress
> > this specific warning on x86, the udmabuf fix here is still
> > valuable as it removes the redundant CPU sync at map/unmap time
> > and aligns udmabuf with other dma-buf exporters that already
> > pass DMA_ATTR_SKIP_CPU_SYNC.
> >
> > [1] https://lore.kernel.org/all/20260327124156.24820-1-
> > mikhail.v.gavrilov@gmail.com/
> >
> > Gerd, could you take a look when you have a chance?
> I am convinced that this patch is useful in some cases, so I'll add
> Christian's
> Ack and push it (into drm-misc-next) in a day or two.
I ran into a merge conflict while applying this patch on top of other
udmabuf patches. So, please resend this patch after rebasing on top
of drm-tip:
https://gitlab.freedesktop.org/drm/tip/-/commits/drm-tip?ref_type=3DHEADS

Thanks,
Vivek

>=20
> Thanks,
> Vivek
>=20
> >
> > --
> > Best Regards,
> > Mike Gavrilov.

