Return-Path: <linux-media+bounces-64982-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rtatGHMXMWoEbgUAu9opvQ
	(envelope-from <linux-media+bounces-64982-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 11:29:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFC568D8AB
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 11:29:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=O2HaUHH1;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64982-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64982-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D61523146E8A
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 09:26:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E050E421EF5;
	Tue, 16 Jun 2026 09:26:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC4C407574;
	Tue, 16 Jun 2026 09:26:13 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781601975; cv=fail; b=UXsw6yiupO0x3nX0Hvx2pXiVyju/OVBruVKrNQxZO3G9I1KsH2+GrP9uQCFL5UW+pyqawa0d7DqYZ72D2BPBsMg7UQAEUZrXtqf8c+o4ZLDhaFM6DSZqIKXDTGuwpJndL+bD8Jyb6xSCRADZq+pT42MOuxrkQRSZPfeaodXVZzs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781601975; c=relaxed/simple;
	bh=YJnZDQXEJ27FsKFXvHPH3qPwk1/lqib56Z/F9K6zxXo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EvHHvloHFR0UAoA6mqGFd/uD4pQcxWTKzrI3N/sktae+cK53cxxJjNfDf4iqC2wQpJHocHjuerI9qd7oHCgsTfFT4NWqQJuezN0Bqoy/j/R7WZfzmpXn5LC1IZuw/TrxJyhulc0VmCOz1aUIxUKWz7BJiXmRmssncsEYnkMgweQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O2HaUHH1; arc=fail smtp.client-ip=198.175.65.20
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781601974; x=1813137974;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=YJnZDQXEJ27FsKFXvHPH3qPwk1/lqib56Z/F9K6zxXo=;
  b=O2HaUHH1ggm+XpNk2zWRrt3zq2HwPvvJIvrJtAZhwK17KslWbhbAzUvC
   AuEzVy4IPUSf6p2xMzZHwMg+Jw2OaTUt5nRrN+sbveh68hEVVMpV0bmZZ
   52n86KJQQNWf+HCSyyZoJUhClQfpJvu/eFKg54uhKhSRk27vzTge1N7jp
   KOWpiziXCyTt1j2U/41TgcpjB4LWmstifZ6DxSWxhLlLQnTKGPRqwQnsf
   z4GSPdj41tY1A+lTU25x51zamC/bnSkNEX+C6rm9LoNBRZnAsi2rCb3xk
   z8vQgntsJUrDDjDbLLI1iu3EKMS/ueTvaVV/BM7SdO+jVozUnCYvaS5Rs
   Q==;
X-CSE-ConnectionGUID: JpZUZmMWRX2SMqy0Q5+24Q==
X-CSE-MsgGUID: wUwgyBRgTUiAuWBZy81NUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82105955"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="82105955"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 02:26:13 -0700
X-CSE-ConnectionGUID: 4h/YBPewSzqErF2LGZFvng==
X-CSE-MsgGUID: OdkvZj+ESq6h/dCwrHC7Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="244834152"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 02:26:12 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 02:26:12 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 16 Jun 2026 02:26:12 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.9) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 02:26:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SwPkLTCMzQ3VO2Pbfk5WR95LYyLfhclwCXkh8Hi8TaYUR94LQujq6wfeT9ioTsU3rt+Nmv9pjGiEWX8vyOuGfKufW0x/PUB3guCnDAA2ASvE1pSzmwPGCQjGBVfSMREDoSlzWbH2G1gSN4ODEkNJUt8Lj6g08kmGV0PbNSBlDwc2d1Aee777M52HQKBjMlUG84GyFmhcizMtckGLHcn34Z1SoBSR5DxD8egR8wed2LxwUhvtPQEHMclVLg8X3X0i5FqnIT3NclAPdrJIIVMK3c5CTOrUVow5EvrYJTKgbIMwZkDjlLls6Umq90iq+Jibz7juN/da/yxPwWEXx2UT9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3+fEjEwmT+FDwMZT8+DgvAd12i6v/IsTr5tlva3kSkc=;
 b=v5UkHsOU8LS8xeSXdi+ohtVAuOxS0LPR9LmSCc69j/UNooW9CtIj1+joyIdcq5s9Y3L/ws4sjab1czwWsQxEtx67GGMmXBiUlLbt8MQV445uzSE65XAsoasgKPE55NF+ODrYQJGncKx2R3SYiHo6JUmXFj+hEvudZ5oFpaJW6P4+WVjwzUJhSVqSzIGd+X/cGHk7JWzgn6hjGzn/i7nBLRja14qlNEMfWMyEOIQWAB9lKxQR6bciBCBX88f2TlUekpN+r5foH+H+LK74vqLZL+uVkUjWZYX3CxW4qdDclO64r4IEIoo5+Ad6esrSVnI+maOV9vKXdxWrpFqmQzd5Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB3690.namprd11.prod.outlook.com (2603:10b6:5:13d::32)
 by SA2PR11MB4859.namprd11.prod.outlook.com (2603:10b6:806:f8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 09:26:10 +0000
Received: from DM6PR11MB3690.namprd11.prod.outlook.com
 ([fe80::7db8:f6b3:30f8:ee4b]) by DM6PR11MB3690.namprd11.prod.outlook.com
 ([fe80::7db8:f6b3:30f8:ee4b%4]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 09:26:10 +0000
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
Subject: RE: [PATCH v3 8/9] vfio/pci: Permanently revoke a DMABUF on request
Thread-Topic: [PATCH v3 8/9] vfio/pci: Permanently revoke a DMABUF on request
Thread-Index: AQHc+PAmqB+v+Lu5/02KVTOEbnry4bZA8OVw
Date: Tue, 16 Jun 2026 09:26:10 +0000
Message-ID: <DM6PR11MB3690886693898AD755FB246F8CE52@DM6PR11MB3690.namprd11.prod.outlook.com>
References: <20260610154327.37758-1-matt@ozlabs.org>
 <20260610154327.37758-9-matt@ozlabs.org>
In-Reply-To: <20260610154327.37758-9-matt@ozlabs.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB3690:EE_|SA2PR11MB4859:EE_
x-ms-office365-filtering-correlation-id: fe5199aa-5b38-4d64-6b14-08decb894d4b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|22082099003|18002099003|38070700021|4143699003|11063799006|56012099006;
x-microsoft-antispam-message-info: WeOVlZZbnTegErXorJOgH1bs88Rr1ejX3UGb2mR5QpXidKFu+7qQFjWzaUBaqY5qL7qsHMle6AS56dDMYJB4Usu1SHaUZKYB9hPo1m9R0Q6BwJK449GZX972Rz1z+mo2PKIPZtUaetw8v9NWC9ak5DPVtXbW7iE32VcL6Ei9V1r0bRR+TiQdQgH6UlcMpWth4t8XCjr6u7aChgdXWKPM1vXYVGsdDNus/2++yFEkKPVh3WnJttGwWRLm3BJl9OnhC4OW8O6qCrO7mqwSWCTt9ggc+NG0pi7BB6JqFsbbTZoWDJFlN+/KGVlY2ke5a3vLNF/XGBin9aDFR/pRmDoZvXJZqgc3tqDK9UVEj2HuFARQYs40mnC6Qy8SL/Tp94M2iKjJ/4S5Z5fzDqFV4yIvxeMLXGBLIzQp1+sDT87r9SZfonPqKAbstD+W9svlzSvYwApPW+D9uBxp1CamgGHXVkt8ZOHVACyQ4YrSpLZAIwUKoy77VMprZwwIDFMFJP3hmwPGwIvojN7BNKn8CS9Nf90GdvPb0mQ5ylcL+viAc/MrE19pHUav/WX/aN2pSDNz6p5Rz2NFNTHjlANiXUDTSK1MXzt1mhim1Is3h0cWEIN6c1STUj7GPba13JiTz0g+JnfDbLbWqVRIVqoPJV+SMpcnMVqnmpQfLRJ3dt6PtFvbVV7oXzUVL5Z7MVFLfkAS9nPAqt5UPsm8g0Oiee1U0cUOnye4f2oPi/FNMWS7laJ2pHHlSslSYtX/ueS9Ao+z
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3690.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(22082099003)(18002099003)(38070700021)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?OsIJ/5In74HRhs1hSsv4+sJbV9r31d78mHhKhrqj4F5pvNGWIz/dgVs/uQ?=
 =?iso-8859-1?Q?i5k39gqrYV7djVzXyeqFQP4Lj7rM8egjuJSpmYwynTl5xWqiYf/d+N0m6o?=
 =?iso-8859-1?Q?mXbl60/e+x3Do+gwWrt1dCm5XkYdCktZOaseqPY4N6TQ6R98CDe5tOK1EW?=
 =?iso-8859-1?Q?f7gKwPoERFG7k7SUUCejxIZZMTA492YWQUw/uQCHfv3lSemK4LGQeN0ORw?=
 =?iso-8859-1?Q?UIWT2pZps5uG5aYzpKksFdKc3dp6EqIegsHuzoV0G+qAaHWfY2WTtlfhos?=
 =?iso-8859-1?Q?vkRp9hKxzPUdjPQvVO4VieGvpZv8fRFRA5L5M3PZn3/pdHWpAS43rz3I0t?=
 =?iso-8859-1?Q?TQJ/GoLuA3lFU6fVoftlI/hCeh+q8v1yq1tC2mEn85cZX/+KiZrDJgsKCj?=
 =?iso-8859-1?Q?Y8CG6pF0sx8OUzp4/JnPq7PgVUZcDJ9c/ISfh371jw2kD1Lm+oV9JJ+l91?=
 =?iso-8859-1?Q?HuAe1C7orX7btAEP7ST1eVdn22PHbBe5YoQLD8tqOJNe+TuO2Zcwwx5Ddm?=
 =?iso-8859-1?Q?w8HOFZcWDVvvJ9d2Eg+EOg5XANRwQso5QPkT5e1n2BIhKRHMRsISaI57ae?=
 =?iso-8859-1?Q?YHkQ8I6ocxsDRPkdwgti2r11iudi5rS8DP5+qiWhPv1vA0dBk9lgVsHcaZ?=
 =?iso-8859-1?Q?CXyEMKcmFVhv7U1ZQo1mEPm0Ubb/4XtGidODWyIBlF5OWEtitzgW901q0Z?=
 =?iso-8859-1?Q?VuZrFBWZo9gl57x1L0q4W+4BYz+LQSHpAPdSEw8LsbrtKdwhrYzhpMj7+h?=
 =?iso-8859-1?Q?gy2AMhAf01d4zBR5ho7P94/MrYsTb+KkG9EmEU1Gp91MR5GGsJHabChmSH?=
 =?iso-8859-1?Q?2x5vyhpyiVhM7TTrMlSpwTFXCIKKTElkUjIstH01cbKoTnjGy5XVUrxECs?=
 =?iso-8859-1?Q?cSoLGA54djSfAOybG8jwuLOaujU2RF1Ys3If9QPdupJLPfO0oFSy8HWJSV?=
 =?iso-8859-1?Q?SIv9+k4upeqK+wq1Bf3bk2++cvlHxaq5hy0FxpoCrkOdW0YATRccld9/RT?=
 =?iso-8859-1?Q?cvv4Teph9r2jOrk52qR3WSyrs8K4qYKrVsorZOBsRPJ7IPsjafhO6Lf7Rx?=
 =?iso-8859-1?Q?qMoUDtUUHRGubO2j2+J55gDsZnlbYKivZD5y55ltEsIutmi8swr8qgW3Kk?=
 =?iso-8859-1?Q?zdiQ+VdTqyn8GOnd50OZEd3L5G9Gqmc6EuZ9RWF3JDAmxbL4r06gLtbHaO?=
 =?iso-8859-1?Q?fk3oUVGrB5DnyZdmGtEOQ48sAuyXObL6tj03leGlyjSsAlSAc3tTkFRX35?=
 =?iso-8859-1?Q?oHBoZW/sXvD9ytS3rttCYEaB9tG0nCB0EHN2J1wFnTcJSCE4ZDzNW9P0ir?=
 =?iso-8859-1?Q?ZEA8bXAVSevHWvS+mN9bDkWuJNfiT7g6Fkp+8epUs8TtHWGA38HQpKZXs7?=
 =?iso-8859-1?Q?9WfW+hy1bZscSi7ziQcArrytumG08vRCjDUXMWOfLp2K27H0DLoeSyvIYL?=
 =?iso-8859-1?Q?90mqxhDQOto5M/yeYMZik2lEozdiRETfxmCdhuqDvF6eJJA8ta/izOdl1e?=
 =?iso-8859-1?Q?Cq2Ft+Bei0u9arnh+JxKwZRECssOk4Wprm7OWVh06SAXUJn1X1ed3hkSn0?=
 =?iso-8859-1?Q?PgEoKWzoGuRzGiahTgT9p/tvwFztm8wwHxpG5jc56GFyujEp5d+2CGf6bb?=
 =?iso-8859-1?Q?AsITcEUl87tCB/01iB2+xkEwaCYC69qYP8AwLfZoxaK1t08WwOKIpdG4nT?=
 =?iso-8859-1?Q?M/kog8tstxuZtXQ6Rkq8c7VQpYQns13iAtygtyqgrvxVWChDD9H4iNSDSQ?=
 =?iso-8859-1?Q?EPJOYlxQBrBnUH33a9cUdMOSh1qclWQ8FmuxnCa/R41ceh?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: semAsNUBMoquq30qDDL3cDCEKtAqTSoFQh0MUwB1hzWBKmqLogHSqMfRSdXCo7Cu4BJXWJPJ7zWHx5FJgdoKjvEOCYZLVNBGPjQpjEgg532GPcwGhF4nYhPf2ShLeDEYgWwXT7+A39+8AmwTjQkJneQ6Apq+yZxf3Jlx9Ae8dInED1pNOJLcNgWlUpvfvJl+4E5cRPdT4J0aTRtjc61XWXw9eFYqRTKYblUPc7XAtaFwMlgPmfUjpR1gQi+8L/xS7SKW+HuUMJWEKa7BhimMyr14rRRxR9b3kmymLXIi70S44aSOBUFW3OeOfF3NLrDSQUT6Nufg92ZTyS5TdfoVbQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe5199aa-5b38-4d64-6b14-08decb894d4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2026 09:26:10.0351
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sb6jPUtoogsDgeQQjNnPQzC9HKdzUuGEllkMXAgGL4KwOD2mzGaFi1mTL7u2kMSPexGKi9UOK6UH4MitJoAYPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4859
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
	TAGGED_FROM(0.00)[bounces-64982-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:matt@ozlabs.org,m:alex@shazbot.org,m:leon@kernel.org,m:jgg@nvidia.com,m:amastro@fb.com,m:christian.koenig@amd.com,m:bhelgaas@google.com,m:logang@deltatee.com,m:mngyadam@amazon.de,m:dmatlack@google.com,m:bjorn@kernel.org,m:sumit.semwal@linaro.org,m:ankita@nvidia.com,m:praan@google.com,m:apopple@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:kvm@vger.kernel.org,m:linux-pci@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[kevin.tian@intel.com,linux-media@vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ozlabs.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:dkim,intel.com:email,intel.com:from_mime,DM6PR11MB3690.namprd11.prod.outlook.com:mid];
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
X-Rspamd-Queue-Id: BDFC568D8AB

> From: Matt Evans <matt@ozlabs.org>
> Sent: Wednesday, June 10, 2026 11:43 PM
>=20
> Expand the VFIO DMABUF revocation state to three states:
> Not revoked, temporarily revoked, and permanently revoked.
>=20
> The first two are for existing transient revocation, e.g. across a
> function reset, and the DMABUF is put into the last in response to a
> new VFIO feature VFIO_DEVICE_FEATURE_DMA_BUF.

VFIO_DEVICE_FEATURE_DMA_BUF_REVOKE

>=20
> VFIO_DEVICE_FEATURE_DMA_BUF passes a DMABUF by fd and requests that
> the DMABUF is permanently revoked.  On success, it's guaranteed that

ditto

> the buffer can never be imported/attached/mmap()ed in future, that
> dynamic imports have been cleanly detached, and that all mappings have
> been made inaccessible/PTEs zapped.
>=20
> This is useful for lifecycle management, to reclaim VFIO PCI BAR
> ranges previously delegated to a subordinate client process: The
> driver process can ensure that the loaned resources are revoked when
> the client is deemed "done", and exported ranges can be safely re-used
> elsewhere.

probably clarify that re-use by creating a new dmabuf fd as the original
one is essentially zombie now.

>=20
> +/* Set the DMABUF's revocation status (OK or temporarily/permanently
> revoked) */
> +static void vfio_pci_dma_buf_set_status(struct vfio_pci_dma_buf *priv,
> +					enum vfio_pci_dma_buf_status
> new_status)
> +{
> +	bool was_revoked;
> +
> +	lockdep_assert_held_write(&priv->vdev->memory_lock);
> +
> +	if (priv->status =3D=3D VFIO_PCI_DMABUF_PERM_REVOKED ||
> +	    priv->status =3D=3D new_status) {
> +		return;
> +	}

the only interface to request PERM_REVOKED is via the new ioctl.

vfio_pci_core_feature_dma_buf_revoke() returns -EBADFD if
it's already in PERM_REVOKED.

so this check shouldn't be reached, suggesting a warning.

> +
> +	dma_buf_invalidate_mappings(priv->dmabuf);
> +	dma_resv_wait_timeout(priv->dmabuf->resv,
> +			      DMA_RESV_USAGE_BOOKKEEP, false,
> +			      MAX_SCHEDULE_TIMEOUT);
> +	dma_resv_unlock(priv->dmabuf->resv);

It's existing code but while at it let's make above conditional to
the actual revoke path. for unrevoked it's not required given the
previous revoke already cleans up everything.

otherwise,

Reviewed-by: Kevin Tian <kevin.tian@intel.com>

