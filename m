Return-Path: <linux-media+bounces-56174-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHh1MNM6umnATAIAu9opvQ
	(envelope-from <linux-media+bounces-56174-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 06:40:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3428D2B5F5D
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 06:40:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5F49830382AD
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 05:40:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2598D361DBC;
	Wed, 18 Mar 2026 05:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UeU1rZ2w"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF69231830;
	Wed, 18 Mar 2026 05:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773812418; cv=fail; b=tPN/OgH2h7AA++Xa1VO3Li0yRiRWrM5dEILhKRPcL5R1nNz6FgQ8pFLT6yBJ0FufRPFpX1xQdHvEPtrN+s2MWpCP0DjF4gZDm56M26mNSagWnigI6wfekaqxurqNPvxOluF0vs+rN/IreB4EN/pFea8mO0h83KD6IlxTyyWYj+w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773812418; c=relaxed/simple;
	bh=n821mKUFkV6bvzDDL5VVSYgY6NFpWl58keHD6lpb89Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TQBPx84UiK2/bdK2CkGmxyK5NYMMA2yNYQ1azMOvZ4BP/+sg4mR3vnSF1BUeZ9uwJqp6PPdrCP8qb/vZhD6l9GL25oX8s+wjqv9WltfCLXsEbu4XJRxJ4dG5nLyKPOrZ2zsQxqspJ3ci7tDsf83TRXFESwrWaz2gkFRTZyu+g6I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UeU1rZ2w; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773812416; x=1805348416;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=n821mKUFkV6bvzDDL5VVSYgY6NFpWl58keHD6lpb89Q=;
  b=UeU1rZ2wwjCBcgdOC8cScctdzQg5Tvj2rL1eHZ7N83AGUjKKACog8bT/
   DOj8obneIUNsowER2/1hWnHSUqwxwP09ogztt2m9YaWMVJgmvkmm/wBvF
   gXPWzc2TWayt6WXif3Fwv682rqEZEWx+XGw31zFTkPKR8jNYXZ5eTUWe5
   p/8ljcE41tDpCMMoX92zeOWR+Ddlvx2ECETs9XQRnkK8WX6Y15q4yRytv
   IQtlwBUgxcodQ14ojCb+9LHcrnkRsroWtoQQdkb4LF+8M1KzoSpkuihrG
   kLxN8h19FEC7TGkuoKYg88oIzOEo5m4VhyQXeT/34zosrYVHMoYbjg1U6
   g==;
X-CSE-ConnectionGUID: 3FeLR0oERLinEjLVnI0bTA==
X-CSE-MsgGUID: 5KsY7j/1SPuBHF2EcNKhgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="74890693"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="74890693"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 22:40:15 -0700
X-CSE-ConnectionGUID: UEW6p46sTKmKeWDAT82KPQ==
X-CSE-MsgGUID: MwGWJS3hTvyA9eDUq/cbyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="218115148"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 22:40:15 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 17 Mar 2026 22:40:14 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 17 Mar 2026 22:40:14 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.61) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 17 Mar 2026 22:40:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ay5PoCLwxUq+4Z0x8JwmGjDuuSgWfFXBVYiwWCcslPU19K8qaGLV7VbJJ6zkZbfpNB5JUjVF5etizbmuZmHCfH/s21EIapMUjHKdrMjiyZNLuFOskOlc9L2scpZ0ad6VvstEfL3v339+Q175b3imLpmxN5wYqoLZcPfjz/c4k46I2g0Gju6UjVqDXjbaJ2isrZumxCHYrD1zzIyeiVZSMcQunZkhCFJrhlWpxKSVdqcQpyc2M9M1kBUUEsLFwr1N/QWVNO6b0pR8IsjTz/oeucJ4ECNRoFel/TeJ9qGoVwOHUQcIh8GvaYOLc4RHpzqmqrj56TCTzadWvnWRC/GXPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F+msgDIBuAa6lnmd362UHcqt+vL8hrcGAkvdnH5lDiM=;
 b=N7xXLMcZM6lgrVJWSljEESqxXb5ZCdVUHd4cF6LzP0iCYa6SiwMTE8Eb0Cj/AphrMl1wWVhQoxYq0E6k8jqNUI4pk2526NDKIQFQ01PH2jHu3c+SYPFSHsVeSmUW5LJFABnoeOGBlxtHXstnlWwCeaOND2QVinZTmB1t2FlkGAe72g1r4AyNCEewiFhpT1ZIbeog0Pho1alzc8Fmw4U+6uQFipKEkFK7qVG8rT21ckihh9M4Bf0tR6+cum76gQJhs7WT8jFIEAeYh1NYo8sr8lU9Zjw0VXjiA8C4ijXSqp8Ed7MYEzWBvVFAEJGirpTZDa2c5gPhf1jJLc1iqVYleA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB7177.namprd11.prod.outlook.com (2603:10b6:610:153::8)
 by DS7PR11MB8853.namprd11.prod.outlook.com (2603:10b6:8:255::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 05:40:10 +0000
Received: from CH3PR11MB7177.namprd11.prod.outlook.com
 ([fe80::b997:e226:4979:c035]) by CH3PR11MB7177.namprd11.prod.outlook.com
 ([fe80::b997:e226:4979:c035%5]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 05:40:04 +0000
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
Thread-Index: AQHctdAdEiBcXRZXdE6KpMVNKEWqyrWzHqLA
Date: Wed, 18 Mar 2026 05:40:04 +0000
Message-ID: <CH3PR11MB7177B163E8FBD9B6D812DE86F84EA@CH3PR11MB7177.namprd11.prod.outlook.com>
References: <20260317053653.28888-1-mikhail.v.gavrilov@gmail.com>
In-Reply-To: <20260317053653.28888-1-mikhail.v.gavrilov@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB7177:EE_|DS7PR11MB8853:EE_
x-ms-office365-filtering-correlation-id: a93e4643-a627-40c9-f8b5-08de84b0ce37
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info: 5ty7+1WP4aAiUpvbf50vUR5P77fOXH3Qqo+DAhmYasP7s+hz3elSor2CKTMisEQQ6fJa7UUVSP79pZ0C9XdROFIYHOGdUcq7DbxtrC3gXExhT4OtcVqAPmsUojDow4RXwOVn7sk+TRWK/NEeEjXhuhi10hjLOMC00NY4O+dIJn67Gw+piawYq+cgnWNFRHEfLorENll2o1H+aduo5UolnDzxbTitcPSxFU30Xgpgz07nMFsu/1HjyKc+2t//QhZ0f1pwsyYaNa+8ubDB5Z1RSmaAfwHEfH4vrlT9fTEPqfnV1YsBSCQBDCpla4sK5oXGwxsyQG0uGqU/f8b6ieMfDjbxVHXWmFkRQ/moz3ZA8dZGYr5mz3wqhkIJtOAQippArV2beyHe6NBTnporLZ0jxMpM8qMs7x4dWRc4JxK4n5qK9Oo/MqKNjgpXBI8u8IXjGyiBjnJlFmdNhxV/AGnCDR183ii5IBga+0uDMfuDy4uvDRTR7iteenCZDPmJS2+gW8SzVGX58ZvRbfVnd7M9kkHrjlfLsJRSbM/jqnm/i13AOx3P6oQhx3BxriqcyGUy6hiSw/5O2G1FwXr31P5SFjCKix6AUSYlJnmkyM2QqBHIP9cNBs7zjSBRO3VRZoTIGiseJ6VT/opUZ0VIcee6tmT+sFZ/IZr748V8Pmknow3fo2xb1rP4TpbobvP5gOMmoT4yEV8T5btCMZ3mSzO8UmVZ6e7UysNYzo5RR4iPbz+1ZQELOwpPdY1D5DLuxzxwdLLlA/arwXlDrqhL602c8wm6RkmxJ7gTRHR3sCDkVNg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB7177.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QkWSvQMCLOFDzkPHjTmmvlrs8EbwQ9C9xafCQKaUb31Nsxj4+VZ0Eeh9H6Tj?=
 =?us-ascii?Q?XyDdkXbqBXV715znORTH6B6UzFg07CO4F8ly2vEOr8DDXB2xw9NbZuGaMfCr?=
 =?us-ascii?Q?DmJPwbucy3q0wZGoDvWFZztK/aIkVFY6m2UXZaXNCZ5tj0yJNPKLDaxozi9I?=
 =?us-ascii?Q?GtU7qio6a51DygGyuC3p3wGOrThOWjyVYV7jlpqC6nPlVQtOmzhCHJHJIEI/?=
 =?us-ascii?Q?Ki9QVy3pY+a9OiVnXYwHRsi43GD7OPaW00a9jug5W1NkhUZafJ/lXD1aM1Jr?=
 =?us-ascii?Q?4GHT/2yqzLHvb69eTGPLigIrS/eVs9j+TRIOMBp+7DEo998pm9KImxeW/wO7?=
 =?us-ascii?Q?9y4tPqHrXopsRClKUXiIaOWp3BbDzcOeKAGW7cuAu4rKZrMpvOL4fC9TUENz?=
 =?us-ascii?Q?UYmcYE74xTPiFEkiYMXPfJx3/4HTA21ezz5dPgUbnQRDj+FDRtvoDzKZ6hbi?=
 =?us-ascii?Q?veHAGthuQgj4ijhNSXQsSJN9EyFjeoubWnUNdKIHV/t7JF5xn0oTuoekyh/q?=
 =?us-ascii?Q?6GgAYzdKQHrNgnn0Zx5+LyVLzwrxf6W3vkD0uPO12wmawZpLIiihURwT5P3/?=
 =?us-ascii?Q?e+LMSGjsaXjsLrl+/seGORb56qAxU+7Iv3jRXMVyLoCR+1w189OSBPH0DM06?=
 =?us-ascii?Q?ipTZ8Kyocuya4fXUsmzzl+hP2Ce988EMtCdK48cEt7deOmpmWz2mY5FCKcyR?=
 =?us-ascii?Q?K0F/QNBBKsWJFqy2Xlx3A1Uh+OVA+XKrBaj6qHCDNe0SCnrGKNGRvCTyUV7x?=
 =?us-ascii?Q?c7aMgTuMYQOqkcMVy5+bWJanrFdlqNiRlyzHae4WX4jy7UZQawBR5nCLz/2A?=
 =?us-ascii?Q?oZsMzYieEetJpPqB2J3AetCdVb4AkgFZ+QVDEwVwq76WxfSOfurVatlQi+/o?=
 =?us-ascii?Q?rR1mcyirc25/aXuKGtR2nwS0kmkgeVvPShWSAswMmYxBM9FOFWRqT8BnVaWF?=
 =?us-ascii?Q?nKXUbSnNu2nf6pthRmKAPI9V/hZpmb3J+WYouShTCd570PYqrtZQ/EaNPq6R?=
 =?us-ascii?Q?jZbcShyvgc9D5elHKGgndHxO0d9i1eioXe1ACUdI/gQVMRnlHUeUnbyHGtup?=
 =?us-ascii?Q?WxiLlj35UyqCKyaOJSJC9Ap0y5v8hY6SrWMFoVORiNAihFHSs8EtPe/WnYlI?=
 =?us-ascii?Q?iMNp4HjeULq7RboEJdIrOUafzVCM6RlcQJbWHhZSeNggpQaqID5/JIRSKHNc?=
 =?us-ascii?Q?ifsLhzwYU/qH25TO7nqUEaikmrdXR9iG5DkHSy7CEoyrmX6gultj7sf1ZtCl?=
 =?us-ascii?Q?+DDCtnlzei7LgoJ7RO7OkGMzXTTIIYuTtDyx2phI7iQvOC/R2hVYByHHnXUe?=
 =?us-ascii?Q?cLZ/G60vSJvYGOYq3gQHc7NzCXgzCb8DMJpC+AidYb7/mutecjPWAR2Z3afy?=
 =?us-ascii?Q?9XqAnhFtgfwuR7eZ/hRubGj8uZ50AiFA8BQkwKrICoCIII8gu482YmtiZ3a/?=
 =?us-ascii?Q?SIrDQq6ArGGcBItoR18RuAgeNWn7K2F1jppeKg5ycLMJOPeg5pxsuOTBLrLc?=
 =?us-ascii?Q?3Winzy4YmO4bzOJoYM5msjTELYfK1Ybf9MBM0T51B8wTqwOmNHiY8lALcMxV?=
 =?us-ascii?Q?IqsuxA5bWjgJ5jvSvoCkbwDnXx0gW4T29ZVyvHr4EGpcrQBkCifC4U3+5b2X?=
 =?us-ascii?Q?LWnExpoUFu6a91nLKWbezJ30a1QG4sP5tjgdIIX3nMvHUz7v6UUoz51BlhB4?=
 =?us-ascii?Q?20BgJkUODy/5BKyIvWIaE15KGYUWDSHs7S4HKgBpYHMmDBONbw/wJKZOdxfr?=
 =?us-ascii?Q?rXrHfPl4vw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: IeI+1Qc/NgmeYH7SDsFGA1lMd67WXdJ7o3Wl7/rvvdoOusEF5vAquZCpxU/bCTAbUOeSP4K51G0+XImpeszMd3bee1/3hSmXHNusen4VkXwfVl5Q1jMQnoFRf1N1QHz63XpnSs5AjVR92UqvKQr7BJ6nFb6f8Qo9dYOxnk3oj9ICftszZDpCbF56/yXGG5Q3NY0tXRilzb3jeyCSIYzl31lxZADvLNkr8+/AYDB2M68XrtGQkiRUQwTfKjwynNUKTtGmdRQNF7L39EUxJpTPCsQCnVcXG9aTCnwvKlhfIup3z23y6eXaVa3xXOT7AAePZOsfZPszrjdxyLvpfZvGhg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7177.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a93e4643-a627-40c9-f8b5-08de84b0ce37
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2026 05:40:04.1609
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +l4Upzl4RSvN80iPKXeS5ryvdOGpcgIMabQsJ83oozAYpeFavcHI6xLuHc5GUvzwrq50bqd0C6gCNirSOdXtbCSRz0TggAD9bDlN24Mr+EA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8853
X-OriginatorOrg: intel.com
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56174-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,redhat.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[CH3PR11MB7177.namprd11.prod.outlook.com:mid,intel.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 3428D2B5F5D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Mikhail,

> Subject: [PATCH] dma-buf/udmabuf: skip redundant cpu sync to fix
> cacheline EEXIST warning
>=20
> When CONFIG_DMA_API_DEBUG_SG is enabled, importing a udmabuf
> into a DRM
> driver (e.g. amdgpu for video playback in GNOME Videos / Showtime)
> triggers a spurious warning:
>=20
>   DMA-API: amdgpu 0000:03:00.0: cacheline tracking EEXIST, \
>       overlapping mappings aren't supported
>   WARNING: kernel/dma/debug.c:619 at add_dma_entry+0x473/0x5f0
>=20
> The call chain is:
>=20
>   amdgpu_cs_ioctl
>    -> amdgpu_ttm_backend_bind
>     -> dma_buf_map_attachment
>      -> [udmabuf] map_udmabuf -> get_sg_table
>       -> dma_map_sgtable(dev, sg, direction, 0)  // attrs=3D0
>        -> debug_dma_map_sg -> add_dma_entry -> EEXIST
>=20
> This happens because udmabuf builds a per-page scatter-gather list via
> sg_set_folio().  When begin_cpu_udmabuf() has already created an sg
> table mapped for the misc device, and an importer such as amdgpu
> maps
> the same pages for its own device via map_udmabuf(), the DMA debug
> infrastructure sees two active mappings whose physical addresses share
> cacheline boundaries and warns about the overlap.
>=20
> The DMA_ATTR_SKIP_CPU_SYNC flag suppresses this check in
> add_dma_entry() because it signals that no CPU cache maintenance is
> performed at map/unmap time, making the cacheline overlap harmless.
>=20
> All other major dma-buf exporters already pass this flag:
>   - drm_gem_map_dma_buf() passes DMA_ATTR_SKIP_CPU_SYNC
>   - amdgpu_dma_buf_map() passes DMA_ATTR_SKIP_CPU_SYNC
>=20
> The CPU sync at map/unmap time is also redundant for udmabuf:
> begin_cpu_udmabuf() and end_cpu_udmabuf() already perform explicit
> cache synchronization via dma_sync_sgtable_for_cpu/device() when
> CPU
> access is requested through the dma-buf interface.
>=20
> Pass DMA_ATTR_SKIP_CPU_SYNC to dma_map_sgtable() and
> dma_unmap_sgtable() in udmabuf to suppress the spurious warning
> and
> skip the redundant sync.
>=20
> Fixes: 284562e1f348 ("udmabuf: implement
> begin_cpu_access/end_cpu_access hooks")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
> ---
>  drivers/dma-buf/udmabuf.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index 94b8ecb892bb..9c6f8785a28a 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -162,7 +162,7 @@ static struct sg_table *get_sg_table(struct device
> *dev, struct dma_buf *buf,
>  		sg_set_folio(sgl, ubuf->folios[i], PAGE_SIZE,
>  			     ubuf->offsets[i]);
>=20
> -	ret =3D dma_map_sgtable(dev, sg, direction, 0);
> +	ret =3D dma_map_sgtable(dev, sg, direction,
> DMA_ATTR_SKIP_CPU_SYNC);
>  	if (ret < 0)
>  		goto err_map;
>  	return sg;
> @@ -177,7 +177,7 @@ static struct sg_table *get_sg_table(struct device
> *dev, struct dma_buf *buf,
>  static void put_sg_table(struct device *dev, struct sg_table *sg,
>  			 enum dma_data_direction direction)
>  {
> -	dma_unmap_sgtable(dev, sg, direction, 0);
> +	dma_unmap_sgtable(dev, sg, direction,
> DMA_ATTR_SKIP_CPU_SYNC);
Looks OK to me but it would be nice if Christian or someone else can
provide an Ack for this patch.

Thanks,
Vivek

>  	sg_free_table(sg);
>  	kfree(sg);
>  }
> --
> 2.53.0


