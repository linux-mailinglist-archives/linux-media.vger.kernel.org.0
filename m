Return-Path: <linux-media+bounces-11277-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 779238C1C86
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 04:42:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C234AB21868
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 02:42:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D380148837;
	Fri, 10 May 2024 02:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EhaZ9VAy"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BD07E772
	for <linux-media@vger.kernel.org>; Fri, 10 May 2024 02:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715308952; cv=fail; b=cekQCJxDTqY2r1u/e5E04J6IM48SUEb3kru9nxMFSzrT5runHUZs7I7GIfPMPlBzGaaAVHuyi+A6D/wCsOwpmtPbUs3gJfdjCXLOk3/df9999BYbsjUC3Lx/7LidcBLb0zA/KL+aYo/vi6DLk6SMVaIz4V9VA+BvIgQzd2Dqf4g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715308952; c=relaxed/simple;
	bh=Ab9NKOjzhkEh54b9ikbtgW3O1Aa0IZjC/KnDh/x8eNU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ux6IbaF1RBcytHudcvegInV6wcm5jh9lCxq/jb+5lOHlox5+D8OJ5Jm1SiNMIzCDAlT1qm3AFzX+R9D3t3Nk5N5cMnf1ouaro3EADoya2yHX4qDhjF1kRNOEOR2ltCGDMRRU0pEFHpKPO3CwNqqeT2rovfvhaT0F1mPztb+jfsk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EhaZ9VAy; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715308950; x=1746844950;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Ab9NKOjzhkEh54b9ikbtgW3O1Aa0IZjC/KnDh/x8eNU=;
  b=EhaZ9VAyTgzaEOi3UTSGy/gTeBKGhzcAn7LtkulAhihzIlv/z3cg0OlL
   vyNOcIxEJ/icKc6TZFMVoNp0FFDpGNnFv49pNvdIUdlVeLzCmhm0NZhbi
   ckS5mOMM8+Fp6jAA0bqnbABrTt/uckEn1W5tBa7fV/jzOeN8pl7PFdlRK
   w8p8d1qLYpPGCnbhUAoxZPH/qIAG2jR4CehT503XzvDsF+dVxql7jlqrL
   NsNzPbwYtAH312/gbhOKkuRgIndJhb05AoTcXZU3a3mQr3OjFOnUwj/wY
   7oKtzoOmwLTIIEErGStNY8DwwwKD/ixAckRuh/LTdCoZGDybj2M4XOks0
   A==;
X-CSE-ConnectionGUID: GDnq7okoQWGPK9QTvWYnpQ==
X-CSE-MsgGUID: hHrr+YXpQ+2C2NdVLwra1g==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11118688"
X-IronPort-AV: E=Sophos;i="6.08,149,1712646000"; 
   d="scan'208";a="11118688"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 19:42:30 -0700
X-CSE-ConnectionGUID: 7U+lSmHYQWCvGRpXXwT6eg==
X-CSE-MsgGUID: U75kREOFSAeF3zQGc6ytjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,149,1712646000"; 
   d="scan'208";a="34117636"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 09 May 2024 19:42:30 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 May 2024 19:42:29 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 May 2024 19:42:29 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 9 May 2024 19:42:29 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 9 May 2024 19:42:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hv7iEnWwPkT2uPezFQcM5v8p8r4lkuhX6fInkGZj+xPfdI2Wsn+Y+l0td7p3f7LKr8xiWhtjc8gYxJPGy3oRdgsp3g4L8CFxjVBBfUYcRj/jYRFnApb7KYF9d51qnaRN941yYSSLZ/NeUB8pXwD6wHlOosK1gXOZcpIpfnrgBEdCdFABGSR1KKP4Vf7gEa3mUZXqIXYzMuUJY7jYddqbTQC0P3oSwXwaBpQNeyhB2nzNLYXhYD+U8NaIXfyJHFDxOgZmxO2YC1cdXr1w735abwSGpvHOCQej2vLfSTerz40Z8q4JUeDA+CHgLIXxTVH6KgHSxpqQvpmRs9NVF1deXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zDNcXRG+3hWWgsJceaMblnab4m3GEMrs9ANCf11t8+U=;
 b=ezRAGZPCPNRiBS2QUPeOvgLTqyZYaZNhFNgyLaZ6VmbUSJL8s6RiZ41SgwOnck+F1XxuyvjS8MgCRD1FTBzt1wfLVaZ9XxwBapQKaWHhvPPC7NekYlCh8qtP+1dNcCGCIar5f+sP5FVP+ApH5YGVMWgMn91QLjinIVmRz3X2+u/5V8D+O+nLr2ev6GTszJhDaZNUxXb2skcRbwh4aivTr+HeEtiTGjFLNEKUPthiu5IgmTyTVwZhwZ83y356kmPPSM/mqi8EJWbR0MySskn5JCsXm3ZUcposUJ4XNiNGN/23PNicAStYeKlXKkhwBZBRrWj2iD2SyITkWqViB0Ekgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 DS0PR11MB7787.namprd11.prod.outlook.com (2603:10b6:8:de::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7544.47; Fri, 10 May 2024 02:42:22 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2962:1efd:f912:a5a3]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2962:1efd:f912:a5a3%6]) with mapi id 15.20.7544.045; Fri, 10 May 2024
 02:42:21 +0000
From: "Cao, Bingbu" <bingbu.cao@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>
CC: "Qiu, Tian Shu" <tian.shu.qiu@intel.com>
Subject: RE: [PATCH 1/1] media: intel/ipu6: Don't print user-triggerable
 errors to kernel log
Thread-Topic: [PATCH 1/1] media: intel/ipu6: Don't print user-triggerable
 errors to kernel log
Thread-Index: AQHaoj95+y0SU6AVi0mUfNZwgZ99orGPwayQ
Date: Fri, 10 May 2024 02:42:21 +0000
Message-ID: <DM8PR11MB565345E7258C1726CE41637F99E72@DM8PR11MB5653.namprd11.prod.outlook.com>
References: <20240509183341.935400-1-sakari.ailus@linux.intel.com>
In-Reply-To: <20240509183341.935400-1-sakari.ailus@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5653:EE_|DS0PR11MB7787:EE_
x-ms-office365-filtering-correlation-id: fea8fbdd-4b8a-42dd-b160-08dc709ad104
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?g5ZBMcK3LfJ3raZrI1lOVeiS1vce3glbvfPp3SfMThmPmLqjwVw2TH6nZY0u?=
 =?us-ascii?Q?DhPzKDIf6CqsEe63qQeEQ2CQ9NK/5FtSKIbsh2Lm2gVge6mdZliY8cKNNAYV?=
 =?us-ascii?Q?Lx0duYP/Zq0TvH+fDkXgq7JxN3FaPkHeN+SWJA+M0Kbc6Cn+oSxqGX3Xl8TV?=
 =?us-ascii?Q?dT9eQw3qvZ1R0x7N27bA1G8rmuc3C57I36SKKBfE4McWdUsmeEGbckaBw66N?=
 =?us-ascii?Q?NxZxKgjKNFgSouTCCX7Iu5kd51k2ncvEEtmi1CUjztoy8i1zHL4vNCEDQUPo?=
 =?us-ascii?Q?rwXe80oXqqvSwz8D2d2o4gSBVgy3i+Wn5ANf/9Y1qRB6ObE86UABfpLWAywp?=
 =?us-ascii?Q?ZMUdIr9+dXZFg7dbffkCsxhHbOGrBqDdzCQrkMptRKmpTiiR3ts29qlWyrPO?=
 =?us-ascii?Q?QRaea4mF3BX5TUo7y/RWlKLc/qbMt2/huPeCTvkgCLFDemCL1n7RlLOvqXRB?=
 =?us-ascii?Q?iYFwc/jkXA8szg4xeD/gCjCh64KZbtKo8OOIK5vf0TZPM8TxdvuTgDjlKJkc?=
 =?us-ascii?Q?i1pKfWetSJ069E2Hszkz6yYtgoNtf66VlwPe6aGpG8GfThGJjxiv8ekuM8Jn?=
 =?us-ascii?Q?rRLV9ma0SgUGW8hsxzsA2LZycpoFXA7U1TVvd9gtlhPe2ij/beGuKrB/clVB?=
 =?us-ascii?Q?MNy308r9qfvLdz4xxtwUZgUTja+t8CpjqbTd7txbCPe4kMV3unGCbhaED95W?=
 =?us-ascii?Q?JCxBekeggGgZVeJZVo5/Up39AM1xthaZ3F3UAympp70xnLN14VjJh2GcM7+A?=
 =?us-ascii?Q?iFm6Z+IidAq4kpgzIe2xesrcjfk5Ku/Oedjfey4juiBRWBwp83mNnFK96Ki6?=
 =?us-ascii?Q?GqM7nKmODwu+4jftDgENm8BpN9wEuQ1x6jLr+pqI9nnBGQywViPtRKQzqfZd?=
 =?us-ascii?Q?KSGlM2MKo8ARBrIi4ewUwDukASBBebz27GREvGXT0obNH4sd4iEXhaU2+pEx?=
 =?us-ascii?Q?lXMlXqpcJZ3JjPcPU1Gdidsh2CmrflrcGvuB6erL/9ROS4kWTcmuzxa+9PsE?=
 =?us-ascii?Q?pq3EFEoLllfmlZnw0sJUvU6FYKyMD14aQ03C9RVrK5kZ2A8UoWJZouwESVaQ?=
 =?us-ascii?Q?my2Og6pN9YncYBLySEjSOT670P4OqawKAYW3t+ynoVTrxFT62Ufx83R29bmt?=
 =?us-ascii?Q?5rpwqE6HLpdvXpv1jsBlQmor247620U/aJJKxQbUQg8xS10oF/jtWjM3jpkL?=
 =?us-ascii?Q?dgpQ5OgkKot5iO+lL3IXUc6Qnlpdz23LAdJr6LVCpW7/Yu7H2p3faOIUccVN?=
 =?us-ascii?Q?tnMfBEDIwYvw7suIbh1uoPwP5mB5Q7vK+3scSgK97nFjznAnn8LEBtcVl0a+?=
 =?us-ascii?Q?z025M/2+aug/HY6UYCXWPDpvzDYQM1Fw3CperDKlD8/pEg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5653.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0merxwhlDF8PtEYKZ9beT0o+EA8TLOFN//Ahv6Wqwu+jh3N/fSebEhwuDfdf?=
 =?us-ascii?Q?nebbEhldvG/avqD6srxTQ9+eS7OkzbGuQkGszHVChzKdn6K9xhX0DCW+kVhI?=
 =?us-ascii?Q?lHHRV/HXGp/yvqHBn/irj2b9TKt7S75n76jQBRquzXmB2tWauDBqeUzMl/wr?=
 =?us-ascii?Q?BIhTzdOIzj6g9ndmTBnxt+PKDpik5AxPnLTA6T97jl1YZELx5zu5s7tw8y2T?=
 =?us-ascii?Q?MnbZwjf34qji7KRF4nFLyuW6u1mwdmJiZ+tugHDLyV90IBandHU4jKgpdsj0?=
 =?us-ascii?Q?4PMEJFj2z5InFyPJLESkuh6CYvhGrNPfP8kpcuroFN4CnAFpqIzuRdnHg0sI?=
 =?us-ascii?Q?ovtwRLfmoIXyOXMx6lVIydyACLAI8Z4T55SfI+PG7KRw/DFmr71IiKbrWRT/?=
 =?us-ascii?Q?8M42dKviVbwWHPJWbN4j2cLVlvn0Gf43KbsXIJuuv0xwxGixUyZQLv1Jblst?=
 =?us-ascii?Q?+EJjGwMjBJXkiWdK/89YqWo5DjnsAfzUPtQp4eqNT3BT5zuZslr0WEnGOYGL?=
 =?us-ascii?Q?YQLQA/MX4leai8+vJF61YfMRelQ/8xd5HshO4gf1h5xHrjSsWqN2jGLwtT0P?=
 =?us-ascii?Q?d5w0/TlpDz09LpRmYNr+EfHHhqNcwRvFv0gdVvqLfLajIE9PL3ERGTEBnC0K?=
 =?us-ascii?Q?I98w3zqCeD5nenDxo759HuKNvlGxzrVyzs48SM2ekO9ATiEFFo2JLh+nC1oc?=
 =?us-ascii?Q?y/fDiyR/xlG15f56EMpNFYk+x8mS9CRO1NLQhve0SKhQssDhrWyY5cOo7nB2?=
 =?us-ascii?Q?rw+CTA8aTC+/EAsR624GVGqT4r9MqELWiQK14KS3Jq6EEtr5rvXc2Q9k5rge?=
 =?us-ascii?Q?UuquoW0uxhfvpgPjml29O4WLzh7kfK/71dGWTV3RYywe1cujay6yzMpv2dlo?=
 =?us-ascii?Q?5FfVrqG9c7waVU5cDPHh98y6pNWFbH3XuZ3hko7HYmyH7l19hWVWXEXxwWu1?=
 =?us-ascii?Q?QWpJ+Mh9mu4qIuFHnmtycVSRLJy8OP3thI6NjJRanyg3Jm09vg6MVakmjqV4?=
 =?us-ascii?Q?zweoDC0YgOi12RqKhrxFf82BDi5/gJCKowxjfBpZShTnoh/VNoV4a5SIGKMn?=
 =?us-ascii?Q?R33idl1Gtb9FT4VNC6Nmv0/7Irw4mPfCGv59axdEVL5eLH63fviC2uTkmvKm?=
 =?us-ascii?Q?TLqhb5nCtmJUF5ZDzIUtZ6yYJu8bhfk6JzbMCyZ5sQ0qp8XTxCaPl911IHdR?=
 =?us-ascii?Q?DnaSMS5ubaWoAS+6kMkLF9PqTlebYz7Nh+yZ5Qx/DeYQNqYt/WcNXF6fyYEk?=
 =?us-ascii?Q?M8L2zNe5U/ww2tZXty6/dtpZ9MShMdt34OHvmnNGthqui4y9ugKgmzKGrgBi?=
 =?us-ascii?Q?LZZKmcJQnGFWGbyZScIFy60yO/2MwxN8/yDUYuraPiO4OxdCAkVZzmlPa7v1?=
 =?us-ascii?Q?Q6oyRMMpVaeQ84T2sUy4Ynaczbfn92AorrchQ4DvLnbmuiYNMxoZRueVqVFG?=
 =?us-ascii?Q?KHGkCSqSChPQOB5C3mDBUDiliKZtssDXVV0VyILMcyxYLbudhRXgqufZVWUa?=
 =?us-ascii?Q?sjBmzAjWtX+FNTnHgYPJY9FtGls1zIyn59P79QAmiFwR0l3WlYaipYqxJE0N?=
 =?us-ascii?Q?7K4MHrFNo+WYJD4CUB2GGHHapi2AlBn8MO66x0P9?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fea8fbdd-4b8a-42dd-b160-08dc709ad104
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2024 02:42:21.3713
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wrF4UFRs3F6XrK18ZqnaRyf/rj0/E2mmrNeD0/pvwm62oJPexZqf2yNebCTjWjna6AGEnWyQ5st7WHi+IXsflw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7787
X-OriginatorOrg: intel.com

Sakari,

Thanks for the patch.

------------------------------------------------------------------------
BRs, =20
Bingbu Cao=20

>-----Original Message-----
>From: Sakari Ailus <sakari.ailus@linux.intel.com>
>Sent: Friday, May 10, 2024 2:34 AM
>To: linux-media@vger.kernel.org
>Cc: Cao, Bingbu <bingbu.cao@intel.com>; Qiu, Tian Shu
><tian.shu.qiu@intel.com>
>Subject: [PATCH 1/1] media: intel/ipu6: Don't print user-triggerable
>errors to kernel log
>
>Use dev_dbg() for printing messages on user-triggerable coditions that

condition?

>have no relation to driver or hardware issues.
>
>Fixes: 3c1dfb5a69cf ("media: intel/ipu6: input system video nodes and
>buffer queues")
>Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>---
> drivers/media/pci/intel/ipu6/ipu6-isys-queue.c | 10 +++++-----
> 1 file changed, 5 insertions(+), 5 deletions(-)
>
>diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
>b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
>index 11cd2c977abe..40a8ebfcfce2 100644
>--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
>+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
>@@ -34,7 +34,7 @@ static int queue_setup(struct vb2_queue *q, unsigned
>int *num_buffers,
> 	if (!*num_planes) {
> 		sizes[0] =3D size;
> 	} else if (sizes[0] < size) {
>-		dev_err(dev, "%s: queue setup: size %u < %u\n",
>+		dev_dbg(dev, "%s: queue setup: size %u < %u\n",
> 			av->vdev.name, sizes[0], size);
> 		return -EINVAL;
> 	}
>@@ -359,7 +359,7 @@ static void buf_queue(struct vb2_buffer *vb)
> 	 */
> 	ret =3D buffer_list_get(stream, &bl);
> 	if (ret < 0) {
>-		dev_warn(dev, "No buffers available\n");
>+		dev_dbg(dev, "No buffers available\n");
> 		goto out;
> 	}
>
>@@ -426,7 +426,7 @@ static int ipu6_isys_link_fmt_validate(struct
>ipu6_isys_queue *aq)
>
> 	if (format.width !=3D ipu6_isys_get_frame_width(av) ||
> 	    format.height !=3D ipu6_isys_get_frame_height(av)) {
>-		dev_err(dev, "wrong width or height %ux%u (%ux%u
>expected)\n",
>+		dev_dbg(dev, "wrong width or height %ux%u (%ux%u
>expected)\n",
> 			ipu6_isys_get_frame_width(av),
> 			ipu6_isys_get_frame_height(av), format.width,
> 			format.height);
>@@ -521,13 +521,13 @@ static int start_streaming(struct vb2_queue *q,
>unsigned int count)
>
> 	ret =3D ipu6_isys_setup_video(av, &source_entity, &nr_queues);
> 	if (ret < 0) {
>-		dev_err(dev, "failed to setup video\n");
>+		dev_dbg(dev, "failed to setup video\n");
> 		goto out_return_buffers;
> 	}
>
> 	ret =3D ipu6_isys_link_fmt_validate(aq);
> 	if (ret) {
>-		dev_err(dev,
>+		dev_dbg(dev,
> 			"%s: link format validation failed (%d)\n",
> 			av->vdev.name, ret);
> 		goto out_pipeline_stop;

Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>

>--
>2.39.2


