Return-Path: <linux-media+bounces-55309-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aN3EHaYRsWmYqQIAu9opvQ
	(envelope-from <linux-media+bounces-55309-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 07:54:30 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE87225D175
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 07:54:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0465431CB312
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 06:53:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 940DB372EC6;
	Wed, 11 Mar 2026 06:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e+7y8ikE"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2692BCF4C;
	Wed, 11 Mar 2026 06:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773212037; cv=fail; b=FEMXi/VKWgrt4tEedyGJp3i88DOLbcy+1+puy26K0Vjv00sefknedJBFOzGEdk/77+WKCRNBEiUTkJBVFsvKSps0Mjp/3Kz/kg+FLNKbm8VHIAw8b+QxG8GEmi5N7kFJONC1jk4NkFYsSeRv+E2Yq+O1ME5EGI6zAcf8mzqqebA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773212037; c=relaxed/simple;
	bh=nRiHl6OAU2NOIm1+AfKU4NRRSaLGYlVGEuucJDVauc4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=U4yUEolSqrf9Vdyc1sO6e4wuWYl6OibXDkIqT+T/4qio1pB8MQs5VX8NmNz8W1I0l978Dju+DOlhYW2ictv1inam11/5rIRo2ZTj4MHmZKJis0rNllmvRCXmhLA1/mi6Escj/iYE9ySChIzQiyXqnIX+33+pIJBtczBHVQgV18s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e+7y8ikE; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773212036; x=1804748036;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=nRiHl6OAU2NOIm1+AfKU4NRRSaLGYlVGEuucJDVauc4=;
  b=e+7y8ikE18y6XLMlWKtsTWYtgqs2yRCCOG0tT7ccqLImiZNCPNT8SApS
   aIOOfYqOZkz3EMk/0G1A7gM0wqqvW9cFP/QJ05fqOqNLARd0kvmZ0+ti4
   c/emLB7s0m/rVHdNu3jAFEEQGNe76cckGU/LCSUqF/g2iamnPQTJak2IV
   8mOhDo6iUtd3G919Utt6L3ax+WKJMwUR/fCngxRQbIw4MihkN2YW8Wxl5
   kg1e75pGVdtZcPAZywTnL2GbET1C4owt/mmz3o4H/MzgwB60qtftCHX1i
   3T+87njSUpegEDCqYdugTCaqRoN4WGKSYVEkVB25oBJYt2vGHhmoG0uSb
   g==;
X-CSE-ConnectionGUID: ZTFBwzbCRZaGwOVggNucTg==
X-CSE-MsgGUID: Vz+08a9+R/eFw7B0hezTCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="77878039"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="77878039"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 23:53:56 -0700
X-CSE-ConnectionGUID: 8LXJjCQ/SPyUFaTvT+FOVA==
X-CSE-MsgGUID: lzvyRCV+RYu/EjY/ASaw3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="216656037"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 23:53:55 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 23:53:54 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 10 Mar 2026 23:53:54 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.31) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 23:53:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MRqDl/FVrsb/jnqAnxNrPVdhBXvVLCqGUVm/brgChIdgpOe13glFj9fOj8AbTr+8qQQ8ZsvdVElh3p8nZA0r6i3ILUgg598e8px+kUOi9RsU46fx0k+GmNz+LBp11Y1hemSAtrrV0CeySsibAfhmeP0Q+8unA4Yxs9v4g/nHLL4Ebfr+77aud3FRzISr8PxkB5V0Dna6GQdi3F4RE+l7R8Z5TKrHY3wB4ku5e8oO3HCVl9dKbXbnC6epUz1GpKp2Jb9sI2DrGECU82MicwAsNiCcXvNIhWJqseHAUwWIksbGNHPtE/B4zlHw1g3zvWNtgWoqxwU3Pe3jb2/yBPXAdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AnxOkIsbqeA5VF65n23l/t00qHnPkwArs0vfCDCC6dU=;
 b=FIS+HaoXzuGA6EOY1DzKMMezENOmsUt7eszoV+UQ4bB5Z6QerRtgdXqCJqiivlS82luNfXFoUBanwOJRvHvwqnS1mbeQtJUwjMBC4Q09JuszvzoZ0hD8WggwW9xjyWnTcemEDpF6r8OTHnMjJY82IMIAvoX954q4RM1+FkalaAGGyYmgllvKv7MmCSlxhEiOP71aH0i6MNQ1SFRqK7TtQBG/VY4l9i1xFhn0yOtZgyKricsOW7cuy5TVZoP4Y7k4FTBT7mMFfaIeUsar4JADTjjbzma5ErkkEoQXntcb2SVDpB5A9tM4G9dHeSYNOR2wvZbqzNo1EpPBApGVTF67UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by PH7PR11MB6354.namprd11.prod.outlook.com (2603:10b6:510:1fe::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 06:53:51 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::9f37:cb81:5463:300e]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::9f37:cb81:5463:300e%5]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 06:53:51 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
CC: Julian Orth <ju.orth@gmail.com>, Andrew Morton
	<akpm@linux-foundation.org>, "Deak, Imre" <imre.deak@intel.com>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Gerd Hoffmann <kraxel@redhat.com>, "Sumit
 Semwal" <sumit.semwal@linaro.org>, =?iso-8859-1?Q?Christian_K=F6nig?=
	<christian.koenig@amd.com>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linaro-mm-sig@lists.linaro.org"
	<linaro-mm-sig@lists.linaro.org>
Subject: RE: [PATCH] lib/scatterlist: fix sg_page_count and sg_dma_page_count
Thread-Topic: [PATCH] lib/scatterlist: fix sg_page_count and sg_dma_page_count
Thread-Index: AQHcrytGgNCxhmh1dUGazU9lY/+Y4bWmiV1QgAEz34CAAGnkcA==
Date: Wed, 11 Mar 2026 06:53:51 +0000
Message-ID: <IA0PR11MB71859E28938D1695D4223B8AF847A@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20260308-scatterlist-v1-1-39c4566b0bba@gmail.com>
 <20260308180826.GG1687929@ziepe.ca>
 <CAHijbEX=LN_ntp6zwsqy3sW7EB+E6cBCWnrKZb_RqdNG=Et_3g@mail.gmail.com>
 <IA0PR11MB7185574E3A63285860017D69F846A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <20260310125953.GS1687929@ziepe.ca>
In-Reply-To: <20260310125953.GS1687929@ziepe.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|PH7PR11MB6354:EE_
x-ms-office365-filtering-correlation-id: 08be3c64-334c-4c1b-f106-08de7f3af40e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016|22082099003|56012099003|18002099003|38070700021;
x-microsoft-antispam-message-info: RIze3iTvUfTnsyHQJ1M/yWZZVnLvqJvq6OZjwxskoR2u3hVmGGdGXL3WAiGF2/F0HP/c6aMbMFva+sbbewluwmcsHCGLn9hRxAOZcfn0R+JbP/+iOX97i7eJBTOVshkvo0vQEH8veH/NOOBocFGTMqcX2L9yo3Lnr0ifOor7xVeVp5ZAR+dOsooXqivpWiS+HlOGrEa+B0CgScCw0YURCHG66KW3GKc3gLFT9aXuZww0KhEeS4QuEacMSO0S8H1lyv7wnBwCSRDhXTRfm6ruMikPPTrn76mafm/uwg6HtiBeRuVugIlch008U05lApbbefTcO4xqiad9XdY2TKjypr9YkdRXrJlc+AfkGFp6Uu+gVKJA8HS1nJ2DYu5cssVySSPq6ci85O0bD4PvvvkZRC0aFxCTHw0mkLVMwmwACX5w+mGz9RaOk9EMm9WiWj7u2bkgnR/eq+vQm9LiXjd9nyFHLs1D6biZC8NOWpJ9A+uiLgg6ZPF8CBeGgbOjVtOGaIFl6Q7ESOE4Ix4yVwnIftDm/oBM1xxmm6WubzmqjoV2rRp3J5ILsVMgxZYVe+lY2ageGWH2ZDsmeYzuK4LYJNUuyRlA63lA7GPvPfCobE8HHXHrOt4zVsvSvRZ0LpYjXH054PDCBIGTfZtw99I1Vii5Tr63xP3nSiUYWg2KATBZFF7WXfPfHeS3DlQO1pFweM5Zx0P6oWLVhLir/SsSs1kBsmY6qrORNZ83vdREM/utV7ePCdvB0oXYp7ZPVY++QnSotprmd+GiGOwkIfznvzTpI6jc8ddrtrpGN79UDls=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7185.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(22082099003)(56012099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?icyzRF3WnE6QcKuhiymBgNZrQdxC0uzn0BlldnkSL+WMriXEjcUk/WudYO?=
 =?iso-8859-1?Q?LIgY0bPqmEGWR2cEwi2upsFAskLLFgrnZ2+2T92PuAqjbd56C+VhEaLZwK?=
 =?iso-8859-1?Q?qmmJpEKhcwKZ9zIE/+5olKC2JyNV7TQkFYrnfKLRrMcRdQ0IylDfEmv36N?=
 =?iso-8859-1?Q?fecRdqKd73Ea6uN2UEtLql4AZ8rqmIKO4c3EzW/VJxylvFElXORfIPeCrh?=
 =?iso-8859-1?Q?CPagl7DyFnPbA1omeCbXs/d1nrbwPuiqvUuzd5eQux9rdq/tPxW7bA2wMh?=
 =?iso-8859-1?Q?aulKn7MQpBHPVtEsV9YNuzSk7AqDKveMdaZA6QqKwn2jTxC2jgFJUkfNMP?=
 =?iso-8859-1?Q?44fcMgUtnBkW39DY9tzNs2BugOlnHQ5MHnxZsiAetdNphHUtVbdW/VFFwP?=
 =?iso-8859-1?Q?9Zqk/v97wXkQya1jdwqkPKprJZBVoKXX2wknFVE6RjJ9Egh1jchuoBhtnk?=
 =?iso-8859-1?Q?kh3JQDri89EMjVDfuXFj7KqrkvmkDwHwLqq4rroD0oVbyY+esYpGOpl2oS?=
 =?iso-8859-1?Q?o9/O+q4qYJ3vo1wR0C49rOrDyvBfXf6WKeVAYNII8AwB2S5JyLgaqXHH14?=
 =?iso-8859-1?Q?rE8BnwOUdT7MeKaFxOTmYIvrrbYly9pGbCJ90I8jTtT+SXgHlpRlw9xorM?=
 =?iso-8859-1?Q?qEmdSRvdhgUpCtFGuEOapQ6261QqAwoSfDZJ13kT3zKZULVjGPNfznvWHE?=
 =?iso-8859-1?Q?ET0ZkjE77m2vnluPMUrxwAkt2Gys4ss7kRVeSxlNc+HzLp5B2Epag1RTCI?=
 =?iso-8859-1?Q?8d7N5QYkKI8V2yNKQQqWswH0ape+UTBWvpsOy+Nv9Yk9DkpSr52Rcuiza4?=
 =?iso-8859-1?Q?hc1Lox7EY9So6NoEllcZ1kK3Avi2vT+rvHLRtPwpW+/PPQozybuFe2E0rq?=
 =?iso-8859-1?Q?H32JP3p/9rzsZbnFxO/o3h6AboF4gYazTkDcMBPc1DwVbQb4P29hf8L2MT?=
 =?iso-8859-1?Q?veKGrQPOFTEGt6ep5qX0a59EeUlbFHbBuK2tEKVvcrdQP/iChx2VngycwF?=
 =?iso-8859-1?Q?I0PAc4SZaHgO5jJwpsn388QuiOwc0unaLJj+ITG4ei5aVYBRh4Q4AlEUL5?=
 =?iso-8859-1?Q?tFfshf6IjA5mDp1Bgtio05WZ7+QMlZSuQp2yzMy0t3Pj6nW30ZXH8ZJY7F?=
 =?iso-8859-1?Q?7dRaOPE0kw3aaDG504YT+TkbMdkKW/d9qdBP+PbXdRP7rKeae44uvUi9wk?=
 =?iso-8859-1?Q?wnAgEcePsVF+V4n6oyEMAUIjI4rPJ4Bc6kr30nWIpd1tzDoAeH2mMqQ+K+?=
 =?iso-8859-1?Q?LMULsuoCMuhNqE4fKsxB4X+Mfp/LYKtDzyic3rENBTUR0ooN1DPWHr4HeX?=
 =?iso-8859-1?Q?nfDbPJjUA5U8pS+i7oELCPulQhHIPkLqgBHRAvoGiCjzrAtHtn2WCbhykK?=
 =?iso-8859-1?Q?EGr2FNYqRu4iqDt7WY5/OPnNNAP/QRQ+QLclI55T12ISLR9TZIadEoTCEa?=
 =?iso-8859-1?Q?oGc/Frn2KGNfMobKsHRQBAqQfh1ro8S7uBnwaC9wzRcNg8mtWZ56J7HCSE?=
 =?iso-8859-1?Q?SIYieo9LHMdLQJ6FQKhrccZjOoT3+9OHn5XTvo1vTmdsTunby+YIZ3tuZq?=
 =?iso-8859-1?Q?hAcF6kC/AIMOsWT7dXJR/++ojlq4XsxBH0GpsMG+wm11wjoXwO+8wp/YES?=
 =?iso-8859-1?Q?KeUdcr47LUmPplxP79OU+VAA2PEiochfAhXvruVkfsVmJz3z+DVNZOc9qg?=
 =?iso-8859-1?Q?HytymbIRxRpQYw1MqA0wb6QzrmBUx68jjIQ3eZjipa2zA9/Zag/tcpAeaf?=
 =?iso-8859-1?Q?DhMEWzjS7VlVTcGacA5HoCqUCobJ6H0YWV9tnKzV4p6ngwLdzJ4J9cLr+x?=
 =?iso-8859-1?Q?+ho3++hO/Q=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: HCV/HqPVO0sWRWfY1MzVCvDN3wwSDzyMlbXT1L0n/bHhGBT9G1qRnVbcxnWE1hpDmr611LqumhHCSMqkT+jE+3YKGVvMpvpI9U4lsVApx0Qz4IkZs5j/dHCnRvW6YGqXKdYDEGKUT1ro276EaRNNQoB5t5hd6M5ajuUJZrVFq1a8QXMuWo5TS+vfXp7FTYd1MG0usFdLD7yCP8Je/wDPAk6rx8wohABOfDJvLnPu+/Ms7Er5ViJ4Kzd7VwrJpmYFWm00f0JLVB+HmDypbCgo/qme+HKTR2N2sPUAoiUCP1AHwp3xP32rmzrtUfAscPeagjwzvE4h43qirMBnEIGcSQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08be3c64-334c-4c1b-f106-08de7f3af40e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2026 06:53:51.2157
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RXtLMKnRNCSqxyOTuSGTfDCOcviAz205lppLvFplvp9NvKPsA08W2dm1N9sCJla0hw+olWBFoSXvd7xRUvDMvJwqE5P7yTobfrZa3pX8de0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6354
X-OriginatorOrg: intel.com
X-Rspamd-Queue-Id: CE87225D175
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55309-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,linux-foundation.org,intel.com,linux.intel.com,vger.kernel.org,redhat.com,linaro.org,amd.com,lists.freedesktop.org,lists.linaro.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[IA0PR11MB7185.namprd11.prod.outlook.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vivek.kasireddy@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

Hi Jason,

> Subject: Re: [PATCH] lib/scatterlist: fix sg_page_count and
> sg_dma_page_count
>=20
> On Tue, Mar 10, 2026 at 05:49:23AM +0000, Kasireddy, Vivek wrote:
> > There are a couple of reasons why we got rid of the pages array:
> > - Back then, there was some confusion about whether a struct page
> would
> >   exist or not for tail pages when HVO is enabled. Regardless, there wa=
s
> also
> >   a concern about exposing tail pages outside hugetlb code.
>=20
> The existing code relies on struct page for the vmap:
Right, but IMO, this (using struct page in vmap) is a temporary fix until a=
n
appropriate folio/pfn based API is available. We had used vmap_pfn()
earlier but realized that it was not intended to be used for mapping
struct page/folio backed memory.

>=20
>         for (pg =3D 0; pg < ubuf->pagecount; pg++)
>                 pages[pg] =3D folio_page(ubuf->folios[pg],
>                                        ubuf->offsets[pg] >> PAGE_SHIFT);
>=20
> Tail pages always exist, they are required by many interfaces.
Right, hugetlb maintainer (Muchun) confirmed that the tail pages exist
in "read-only" mode when HVO is enabled.

>=20
> > - And, we also wanted to prepare for a future where struct page would
> not
> >   exist anymore, so, it made sense to just use folios only.
>=20
> If you can 100% stick with whole folios then great, but we don't have
> the APIs for that cases udmabuf needs right now. Most likely we'd
> expect to use phys_addr_t for scatterlist and direct full folio for
> vmap. Neither is helped by the datastructure in udmabuf.
So, given the current situation, what is the right thing to do?
Should we take your patch that brings back the pages array and treat it as
a temporary fix until equivalent folio based APIs are available?

Thanks,
Vivek

>=20
> Jason

