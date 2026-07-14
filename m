Return-Path: <linux-media+bounces-67538-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Dh9ULJDaVWqFuQAAu9opvQ
	(envelope-from <linux-media+bounces-67538-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 08:43:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FDD751979
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 08:43:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b="Nt1C/lSt";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67538-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67538-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 48DD2309757B
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 06:42:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F9B63DCD8A;
	Tue, 14 Jul 2026 06:42:48 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22CDE3DD523;
	Tue, 14 Jul 2026 06:42:42 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784011366; cv=fail; b=pGUo49oTl+HonWuX/56XhM/10MTC+MaxXhmm/ljGfPpyhAS/cHJI2pvyJqEWhJ7d7Y9MODJOgu2foWQTcwPWxEDQUQ1pBJoswc2m42CeZFFpaMM7M2VBH/LxFYsiq6JYb1mxCXELL82IQjXWtK2ZCVBf9CJN52UYbR79Ak0x+uk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784011366; c=relaxed/simple;
	bh=cpKjNmYxhGZ6Cn0gJRrRXoH3oQKU4FWgKgSDSPWBHjQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=V3h3BmaGx74xOeztMslW6+flEflaC7Bylis1VQ+UrzoDmnSnf0VV79gxhofeydr0M48SYbAisDJ2D9ARViYTHoHpvhM5vHUHulGPr4pKwjdQYKsKgH0muNaSNQTVIYkYvWySDOmwdYzEFy1kasQkFOv+VUJ8+jkONnKBh321cZQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nt1C/lSt; arc=fail smtp.client-ip=198.175.65.18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784011363; x=1815547363;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=cpKjNmYxhGZ6Cn0gJRrRXoH3oQKU4FWgKgSDSPWBHjQ=;
  b=Nt1C/lStWM90RAVklECwSfarSl485czbguUN6BfDCIE9+7i6bu2oVH8f
   SdVhKkfkUiqTacPt7dWt+1gHGFbWRHgVXhkKb6H9Ozo1+kB5hVwPrdrDn
   gpL/rITuYSN3yCE4Ck0r+FQIGJvC9Z1rZdTlDpD4C5YGSPVVfmqXIbLAr
   0uCnhwPQsJa6xK4itnF6IWHX+wUzSi7qn5txXdnfVCObdyxwGAMX/6rq9
   M37ExzzwNb+dGg2GzWD/8YoSDBcQW8RPPMCzttZSODuHNzSbJXTUpOBTT
   8mJdoNe7OjVf7W/W8XW+1+OdJirGdMC1pzkosv7Kn9szDHgZ+yIP6Sn/7
   A==;
X-CSE-ConnectionGUID: xtVu/FFEQcWu3MHyqU+ZQw==
X-CSE-MsgGUID: 9g7tt/U/RVKBAh+ukbo7rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="84722267"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="84722267"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 23:42:42 -0700
X-CSE-ConnectionGUID: 7u7Lu1snRu6HQyJ1uo6KfQ==
X-CSE-MsgGUID: RpG/tkWySu+qWKdtSIrO7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="259618988"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 23:42:42 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 13 Jul 2026 23:42:41 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 13 Jul 2026 23:42:41 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.51) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 13 Jul 2026 23:42:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=txMPVNEjS3UtOl5pYlXXZZxXar7S/uCSGJGY5guvEzKulOYXMQTXmvQgrCUz7+EopcJhu+l5snzXHBiPn626xbcKbYaJeagZkWlk4fXlvSFi35bQU90k1NTxkR0SJyv0FfbK8Pax6tmpyL2bl2iBu/abKTfJ4zpdKEz/J9myuAyK200OMq+OsNJ3p4S643H6Phh1JOXTT7UjQuG5Ic4bBJDkBPeTpKER8jyocPp9CANWXV795IeBLU+1D5lVHBLYO4xrYTyxVc4dtHYeQWWCtK6G69+Qk21yvezeN1Hnyf6M61sCnxK3WUPqMMfqW4eKlktx2d0CfutWdK14lPGonA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AJpBifFmRhVb+8K+MlBwmGgSs+nS89W+eHbmJTlI4Ms=;
 b=fD2TvPi92vU6c9SKGqd2yZd5jFB3JcOQVK7xBBBTyUvqvJU65paTT/uS29nHcg1Ca6o8Ai5TYRD9xlAtNMlQ0rkIVgrQJq42v3t1K5jToNL2xgk9oXTB+eBq4x+99OBhpyBwZoFiAVvBe0fbDi+053wRgkmH7uSsUTrGxV2MYzICs9xx8u0591Xhlll2VhVe85jz+GaI4IRrqV01SJbqDLhp9olwFEZQ4BKgfdbpXIRMI1sph4QWYjDdS9UbASVK5tvB2AVnXN+NEzpi8/MQpvBcDEhEUGj99lmav+svrEHuWpN5FI6p14EPOnQM1HCl5/wWfDW01gJrcrvGJSk8nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by SJ2PR11MB8514.namprd11.prod.outlook.com (2603:10b6:a03:56b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Tue, 14 Jul
 2026 06:42:34 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::9f37:cb81:5463:300e]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::9f37:cb81:5463:300e%6]) with mapi id 15.21.0202.014; Tue, 14 Jul 2026
 06:42:34 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Robert Mader <robert.mader@collabora.com>,
	=?iso-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: Sumit Semwal <sumit.semwal@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [RFC PATCH 1/2] dma-buf/udmabuf: Introduce
 CONFIG_UDMABUF_SIZE_LIMIT_MBYTES
Thread-Topic: [RFC PATCH 1/2] dma-buf/udmabuf: Introduce
 CONFIG_UDMABUF_SIZE_LIMIT_MBYTES
Thread-Index: AQHdEURszbN0kz91K0iVCEG5jjTK77ZrLNAAgAASX4CAALePoA==
Date: Tue, 14 Jul 2026 06:42:34 +0000
Message-ID: <IA0PR11MB71855A08C318B962E0FDB1EBF8F92@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20260711144814.8205-1-robert.mader@collabora.com>
 <6764ca6f-b4d8-4baa-9d27-2ca867ac2d41@amd.com>
 <8b0d0180-09ef-42c7-b111-db51d5ddacca@collabora.com>
In-Reply-To: <8b0d0180-09ef-42c7-b111-db51d5ddacca@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|SJ2PR11MB8514:EE_
x-ms-office365-filtering-correlation-id: 91d345ad-fe68-48ee-5780-08dee173163c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|38070700021|18002099003|6133799003|22082099003|56012099006|5023799004|11063799006|4143699003;
x-microsoft-antispam-message-info: riqAOq0x0uI+cfZHOmGdCfgliq/lIbltglFmzIt3kTvW/c0kem7y2h2xp//ataq3GXiQBGSPAtu8CjWS3QeUrSXYNeEQ4fpBMS62Fu0GEl39BXGpcZ/wIwTGvyzwiKyOWQXXMeKtczebKAF9o5Z0Hue66a7e+yxYMCFtD5TghGcN+c21hhMxzhPxQeqtTTz0qxltRWaI9Mb96Orj4K5dQYQF5aS9h9rDbxgzS9MgjCSIPw8Fkuf190dMYbgwWDWT/yY52s5AnJosmyv7Sk+XI7k8AKuONpb+AIxI2xaBgV2OTuGNDknRcTqgeU9MkM/PqlFBK5fUdd+D2/gzd4diLLu5WNVUUmDiFrdMlWac8/oF98VAU19UR3z+BfARGiLbJIuUj+Dhy96CW/nriNTISiU043EwMSLv6MMhEDUI/baKCK7U3bktAxB6clfbIIc1bgCSiN7nTiVdBT6tzApXnxz+2l+8nqOAJ7BpcsTEb69tvcwyEJeJS3wDPFaSyz+tN3VMkw1Cxpy96Z0ws/AxhkiYsHcL/cmvjG43xUsYBw5r/fY2IA7p6RFK4jjnIc+uHgx/GhN5/wVa5IzF0qKMNaGoC1+cRpVmsbWm9Y7DtJ+SOAp86+6U5Uh+x/tRFMlF5ix9xk8wVfS2bNqGB8Cz1tWBuUtoPstreSsv471+jOAR44ASN2+/B5KGc0wROiKs0asIMXD/3RO4QO7bDjejDA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7185.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(38070700021)(18002099003)(6133799003)(22082099003)(56012099006)(5023799004)(11063799006)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?V2f2MIyZDOixxldOCfW+sSYKTHmcsGPZhRxf9EnAEI1t4IPujgVUBKO3Q3?=
 =?iso-8859-1?Q?H2id3HJw11ePFmAuPz1O+19WDHxbNbR4ggZa1wHw8C863VYaKfQmA4kouy?=
 =?iso-8859-1?Q?PzcPUnDT1P5w8WW48pbVOhss5NYX+ZZjCPTrKgVpnwqcgpN6BFrXN0qXiR?=
 =?iso-8859-1?Q?2xzH2SdJNRs151a2f80KWZtNT0ldV8AUPtlT/2sEwAwhOiI5XMiq+qbDMo?=
 =?iso-8859-1?Q?eSkst0UwKvBenKxScw2IPByYIfhXnXrbZ5iZIX0V/bCOvTh9AMmac8fnl4?=
 =?iso-8859-1?Q?AiQu9IllGAVnCEs82cv3h9/68d3kAb2bhtYvXgpB2rxM69tlFN/1gmV9EY?=
 =?iso-8859-1?Q?QKVunOFfHNrupBTT7nf1/bJEKW7IZcnY6CCYWpcCc/xeZDGC0Gqp9N0z2S?=
 =?iso-8859-1?Q?wF4xEUVtc+Ur81IJKq/QyRM+klaR8VJ1OEBA4xeuW/Fp4avMrBJL44YwiW?=
 =?iso-8859-1?Q?G0xWZwD1xEAUgxjUl6C93wCrAQLZ+Y5KKoHK0DNottk9JxiXxdgPx552nT?=
 =?iso-8859-1?Q?gF/NjtjYuzmgyPuyLSY4WlZMIvWN9JMqP/vnWIglaCRdBSH/CMGgUuyVgl?=
 =?iso-8859-1?Q?TtmLWuiGVRhdDXF+ZXcwB17uWxuw4S7/78CKOReBYatAzUNp8crMi8gVt7?=
 =?iso-8859-1?Q?lepCngaN4UZ6SMiT0ogNnZMkCW8JN4kGS/X81IwTYqHwry/wbSKTFjrM4G?=
 =?iso-8859-1?Q?8ec0ONpkfctSVEYaKsVf8jaoSnoPIe2DBKKPz7fdOQ9GmmOOQyQZhmk8qu?=
 =?iso-8859-1?Q?EEVIgGUlNcDqDozSPRDzjphHOBF8Noz2M9oAeXFiD4cfFhQi7z9JCkrSc8?=
 =?iso-8859-1?Q?GfkodL6d+UZJ7pXMhu32lmtQeD17hh7ir5RlvF9t2g0LEUT7r4n5WEfEWj?=
 =?iso-8859-1?Q?/7i9ouJZX/hqhpcAcCFlO631p9/fTtUzm3Aa53VhrBCCUYJQsgp28DqFaD?=
 =?iso-8859-1?Q?RWMFoSGv4OAD6PYdlDavACmd1q0+/+43/Mry4mlJ9cZDxI1+Z/YUu7/83H?=
 =?iso-8859-1?Q?TXuLFANZe2IG6WMYDzK880eI9TlBp9pA/5F7u2Q+4hq/wm/XV/gtDlKSSN?=
 =?iso-8859-1?Q?gy6bSFakJ9RwsUQJmBtzZOB5Jqcnn7EZxXwfTxcsqfmRdAyEzDPBepUNqy?=
 =?iso-8859-1?Q?RdYReai9DLXkFQyQlyFmTXkFWGIMP6qSNhmmM0yVjgYBwdcHWdQvbabG0i?=
 =?iso-8859-1?Q?YEyB0d7HDHTAz6O099ANIu4FoZC28V4pFZ0l71eofJI4leg7iKlaivxtZ3?=
 =?iso-8859-1?Q?9+TrfqH0KWTdlR83lQU7urUGwaYGfDwwiOkCjQdzjLHOe9ruD+YJ8oR3F7?=
 =?iso-8859-1?Q?alBPwCW4R/aqPg5SAE6wDW0iU8eJyIZAHpPMpz7t1DyRgesMemr6XlrDtF?=
 =?iso-8859-1?Q?ASyCCLSaXxe84BX+2zvngSEhKHD0it6Y6irFTJDJeKbtGTZwHYxSrRSlfK?=
 =?iso-8859-1?Q?Yf9QQS265jBjtXgSnf8RVEnayk11bSc4QpTQeR3rKOdXPTQcuSEsKmPXlA?=
 =?iso-8859-1?Q?0SXCoyIuK78+dNOpag3JfSgJ6rGrfMaZrDcei6v3K/VRcY+wxyp2P1KAyn?=
 =?iso-8859-1?Q?xviUhrtifVZufNpk+ijeYQ5AvVpmZ0pyi4REdkujzCIeNqaF/FuzHkNjCo?=
 =?iso-8859-1?Q?QxbM/ehMob0ZYWakUsyzavqxv6BFo8JETyCqsyX3Jg/QQOengPI2KJinS8?=
 =?iso-8859-1?Q?7KW1k4qeIktxYwPS36TQip4MWI7rrkqihGBBhdP00Jy4dD1UgSjpC7Z6gm?=
 =?iso-8859-1?Q?nyRtnkSxPEEJnc2ZfmhBsVV05/f0v5DtMvx+1Me/Ra3DZkRVrKWEkT6sTK?=
 =?iso-8859-1?Q?XwsI+NjH1g=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: pxzlsP7zFoQcM885mkxiPlwdCiewNPkq13WDDSijLxA6M63ylZTfId+YHax35G5vQR3A54vsT6ltUO+n7W9b3VqPxa8pQIsm3Gc9YVXVZk/vHOhS6L8V1BbBIDMNF5DdDjjehKK+KFiOk7NMVuunR7m+ajkUtpZ/XbWBl6JjIdcyNgsO61ciPIWbJTHgWzYTpbTdtc1GDAzgh+a+6WhTzDW9LymLMV+UEKUDFLdqLnuvr/jlzy5GYebcrSZyqAsA5hOZ7pjcHNtlXnmRgCtsG4jh93fu65iHLfMKJH+vPEEmJhmRpjVq8i8q6C9JfI+Vp4OYrx9L9MglXekcBAgpxQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91d345ad-fe68-48ee-5780-08dee173163c
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2026 06:42:34.3198
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ji8TiHxaGXvwcpjgntzPMlxorZo/9HfieE2RVUfvsQq86ATPvZ5QwB8q/Zsp3c9sTli3aV5suFlI+Lr6sQ4i5Pw0RzOl22TdUp+n8U9aCnI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8514
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
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-67538-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robert.mader@collabora.com,m:christian.koenig@amd.com,m:dri-devel@lists.freedesktop.org,m:sumit.semwal@linaro.org,m:kraxel@redhat.com,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[vivek.kasireddy@intel.com,linux-media@vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,collabora.com:email,intel.com:from_mime,intel.com:dkim,IA0PR11MB7185.namprd11.prod.outlook.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vivek.kasireddy@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F2FDD751979

Hi Robert,

> Subject: Re: [RFC PATCH 1/2] dma-buf/udmabuf: Introduce
> CONFIG_UDMABUF_SIZE_LIMIT_MBYTES
>=20
> Hi,
>=20
> On 13.07.26 11:12, Christian K=F6nig wrote:
> > On 7/11/26 16:48, Robert Mader wrote:
> >> As udmabuf increasingly enjoys popularity - being used in projects
> like
> >> libcamera, Gstreamer, Mesa and KWin - users more frequently
> encounter
> >> cases where the current default size limit of 64MB is too low.
> Examples
> >> include allocating video buffers at a 8K resolution - and even 4K is
> >> affected when using non-subsampled video formats or high bit
> depths.
> >>
> >> While the limit can already be changed via the kernel command line,
> >> exposing it as a kernel config makes that easier and more
> discoverable
> >> for distros. Thus let's do that.
> > Well config options are usually only useful if the value can't be
> changed on runtime through a module parameter, but that is clearly
> not the case here.
> >
> > On the other hand I do see your problem. I would just vote to disable
> the limit by default, there is nothing preventing userspace from
> allocating multiple uDMA-bufs so it doesn't seem to prevent any
> security issue or similar.
>=20
> I fully agree and would prefer that as well. If there is no resistance /
> concerns from anybody I'll send a corresponding patch at the end of the
> week.
AFAIU, the main motivation behind the limits was to ensure that there are
some kind of guardrails. I am not opposed to their removal but I think it
would now allow users to pin large arbitrary amounts of memory and I
feel like there needs to be a way to prevent users from doing that.

Early RFC versions of udmabuf had mlock accounting to address this issue
but not sure why it was dropped eventually. I am wondering if it makes
sense to bring that back.

Thanks,
Vivek

>=20
> Thanks,
>=20
> Robert
>=20
> >
> > Regards,
> > Christian.
> >
> >
> >> Signed-off-by: Robert Mader <robert.mader@collabora.com>
> >> ---
> >>   drivers/dma-buf/Kconfig   | 6 ++++++
> >>   drivers/dma-buf/udmabuf.c | 4 ++++
> >>   2 files changed, 10 insertions(+)
> >>
> >> diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
> >> index 7efc0f0d0712..35f0779cdc80 100644
> >> --- a/drivers/dma-buf/Kconfig
> >> +++ b/drivers/dma-buf/Kconfig
> >> @@ -40,6 +40,12 @@ config UDMABUF
> >>            A driver to let userspace turn memfd regions into dma-bufs.
> >>            Qemu can use this to create host dmabufs for guest
> framebuffers.
> >>
> >> +config UDMABUF_SIZE_LIMIT_MBYTES
> >> +       int "Size limit in Mega Bytes"
> >> +       default 64
> >> +       help
> >> +         Maximum size of a udmabuf, in megabytes. Default is 64.
> >> +
> >>   config DMABUF_DEBUG
> >>          bool "DMA-BUF debug checks"
> >>          depends on DMA_SHARED_BUFFER
> >> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> >> index bced421c0d65..a83153326362 100644
> >> --- a/drivers/dma-buf/udmabuf.c
> >> +++ b/drivers/dma-buf/udmabuf.c
> >> @@ -20,7 +20,11 @@ static int list_limit =3D 1024;
> >>   module_param(list_limit, int, 0644);
> >>   MODULE_PARM_DESC(list_limit, "udmabuf_create_list->count limit.
> Default is 1024.");
> >>
> >> +#ifdef CONFIG_UDMABUF_SIZE_LIMIT_MBYTES
> >> +static int size_limit_mb =3D CONFIG_UDMABUF_SIZE_LIMIT_MBYTES;
> >> +#else
> >>   static int size_limit_mb =3D 64;
> >> +#endif
> >>   module_param(size_limit_mb, int, 0644);
> >>   MODULE_PARM_DESC(size_limit_mb, "Max size of a dmabuf, in
> megabytes. Default is 64.");
> >>
> >> --
> >> 2.55.0
> >>

