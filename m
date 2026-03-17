Return-Path: <linux-media+bounces-55993-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIOpMvnouGlClgEAu9opvQ
	(envelope-from <linux-media+bounces-55993-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 06:39:05 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A34A2A4089
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 06:39:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F338B301AB9B
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 05:38:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35AE037F015;
	Tue, 17 Mar 2026 05:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FT3k3BxU"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B6437EFEA
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 05:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773725931; cv=fail; b=CAYQ/0a7gouAbFaNnNee3NTbSm0Hboby4WOd9uD1Ya9JAAaQT21tHKgPrAI3jofO+/ATzZxFGLcbVVSQz+7fSlq+sFiSA9vgAVuQLXSmpzgGRFrc/9LloxnTEmGXOiLaYTJGNxDMJTgDOfPt3SNyp470Vo2XA3aTm9oEaK9ML4M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773725931; c=relaxed/simple;
	bh=pn0VQnjk3rgLIb/i5B8PupWdqnUf3GK/RLfjuonPMno=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PnopnZywyISRaGjlv6+RNWgNIVPN8nH/Zp301n6euJ4G4mtaQQtqAL3KRsW2tYssxwkTpoqrnbvdrz8M77kbZIHVwWk2/pFIL8hCGuqv8JcmEo4cZcg4qBQ5/pgVkx6zKrz6Sml834NgfkB8Gz4z748L1RkGHrp2eWAs8lTIuX0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FT3k3BxU; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773725930; x=1805261930;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=pn0VQnjk3rgLIb/i5B8PupWdqnUf3GK/RLfjuonPMno=;
  b=FT3k3BxUGkIB9vX+87EGollWQRfU53Mz9hmAqVwAqhqd1/1OcVJFPits
   HzrYjelOLHPeSXxYBS+IGxACmskxf/Y1pPjK7EtpY6frjg4apO9rVxf/N
   vfMjEb3svbKKqzh8f69GE0nnn+WJO5jQND3dP0VvVKufwkWwvjXHFXBXu
   yfvavVf0nRqjDKXAzCIhBdABc48va0Crh/LEEmN/hRf04MtvYr4o1BBIg
   DmPIN+yCuvmEDiIwQC/VyJKjHtsEXUed/BpoR5cC4dDGUTTDeKXXcUYoY
   olSZLWjbkiZd5qzfM2FAhxHKOENPfgOVZYhvjixt3OrAwlWQKbtzvr6xk
   w==;
X-CSE-ConnectionGUID: +WseM0gaSBiX02I06OH95w==
X-CSE-MsgGUID: ikIVDR5FQFOlue/x/Dz99g==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="78603442"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="78603442"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 22:38:49 -0700
X-CSE-ConnectionGUID: WR8IIcuXSq6NnvtVjBCuog==
X-CSE-MsgGUID: bBbYjreVQ5aKsNV7zKK3EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="217889026"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 22:37:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 16 Mar 2026 22:37:46 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 16 Mar 2026 22:37:46 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.2) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 16 Mar 2026 22:37:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CYSCrxAvtv/G9a6bMphv6zvd8xjSKV6V1NHXYBrteiYjYHKus8dSmVxOAZ1PDXSTuzoo4TJinHBmPoddmaR8ROiEqAEDqZSZopvD25gNdBc/E5H6GEbaBAJOm3f9tEkpt64P4uirqiFq1xJUDc/NqXPJbl7cuycfC23TvW84QHlrnJYarNiPVI7bBotQZ89CLMpqB1hkIyh9kFgplURon6Yb1XTSS6YAaF3hnz9lXbmbu9y+xCxZtdOvitifxebeHfkB7HhGxM9XjzsUU6jGvC0Bvy389ppR8EWqoM1OOHc3sEDdpDx2/gcWtpF+fFL0L7dJ+2q+RT32h3I1CJjqzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t+y2zQuUbpVjKNpv1DjSaAqpNskadbNbkwnUouPcj1U=;
 b=h/CYkMkDnz8qHK7aVldNgTwCDq+23dgKwYM8OsCFL57jpjTZgEgUdNlr32nbTiIidbmHRJ2Xrnx7DjElQbg5nOX0r2UORXQru8tsjVZm1AFb5cUROFnOF5D4ldf6NZD29G+Yegwd6F3lzWUtGCOaYXjrs2glelGk9Za7E64QwSldtcgBVoqdqnzoAqobB6Rnqi06A50lz3P4sjIBEglTeMtxb0NS+/Eb0gAamtGp46FMYGNaYyXLe+zk8Zxy5aBE7Q2PET0Y6q3Xs2v4xNSkcNBNd8DlZU1BIbCk9NAPhqdEcDDbPI3AqOx1tMSReXnw6TofQcjYx/ijGa/cCnyuKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB7177.namprd11.prod.outlook.com (2603:10b6:610:153::8)
 by DS0PR11MB8134.namprd11.prod.outlook.com (2603:10b6:8:15a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.17; Tue, 17 Mar
 2026 05:37:41 +0000
Received: from CH3PR11MB7177.namprd11.prod.outlook.com
 ([fe80::b997:e226:4979:c035]) by CH3PR11MB7177.namprd11.prod.outlook.com
 ([fe80::b997:e226:4979:c035%5]) with mapi id 15.20.9723.016; Tue, 17 Mar 2026
 05:37:35 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, =?iso-8859-1?Q?Christian_K=F6nig?=
	<christian.koenig@amd.com>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "linaro-mm-sig@lists.linaro.org"
	<linaro-mm-sig@lists.linaro.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>
CC: Dave Airlie <airlied@redhat.com>, Andrew Morton
	<akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Daniel Vetter
	<daniel.vetter@ffwll.ch>, David Hildenbrand <david@redhat.com>, "Kim,
 Dongwon" <dongwon.kim@intel.com>, Christoph Hellwig <hch@infradead.org>,
	Christoph Hellwig <hch@lst.de>, Hugh Dickins <hughd@google.com>, Julian Orth
	<ju.orth@gmail.com>, "Chang, Junxiao" <junxiao.chang@intel.com>, "Gerd
 Hoffmann" <kraxel@redhat.com>, Oscar Salvador <osalvador@suse.de>,
	"patches@lists.linux.dev" <patches@lists.linux.dev>, Peter Xu
	<peterx@redhat.com>, Shuah Khan <shuah@kernel.org>, "Matthew Wilcox (Oracle)"
	<willy@infradead.org>
Subject: RE: [PATCH] udmabuf: Do not create malformed scatterlists
Thread-Topic: [PATCH] udmabuf: Do not create malformed scatterlists
Thread-Index: AQHcsxCg2jmO8KOozUyLmq08MkwvOLWvLm6A
Date: Tue, 17 Mar 2026 05:37:34 +0000
Message-ID: <CH3PR11MB7177AE4908A2D9511A647275F841A@CH3PR11MB7177.namprd11.prod.outlook.com>
References: <0-v1-42779f29381a+4b9-udmabuf_sg_jgg@nvidia.com>
In-Reply-To: <0-v1-42779f29381a+4b9-udmabuf_sg_jgg@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB7177:EE_|DS0PR11MB8134:EE_
x-ms-office365-filtering-correlation-id: 7a742da8-5e72-4639-cedd-08de83e74ad7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info: Sq6l6zqWlo8QWN3qMRSdIlqYUMY0tFLYBddab20cg/8A0DXIxHKdA3TwIAivBXp0V+tENMZ9FmMCahjoBXVKsFYCBdJNFy10Nq0NXwoUTgFh2AJ9i6Bf784MgquA9YTl2tlk1un78sXKhnohhEcCo2sI2tmuIHeBFqrvKcXICh1Tkbp0cZPIZbF968SeQFB5easixbgH7hvBUeZPQn0FF8RTcl5PvIflHCVDvgeUdGD5D3WLTmZtrgmSOziutE+y7cctPDETe4UpEMg7Pv/uLtLjhmf1uWBnmPa6dJpuIjeNXtTODGxd7wvMbz50VpDxNtIwQ9X+Y1ZyVmozYh0nvbwfKBwto5KoBXRXKjIcxN8/WtfQrdz0ppVHCYIjCu1UTE+Faf0rkFmzRewqTe9nFAlfiYOFAq/mKgMST6nczl+R4wCmAOwI+gZsd2b812WguORqZk6vBP1DYiLrrJ9M8CJo4CYpxlpbv8QTbjVlMRLDUFeIHL+NLtND69vWe/oor6Q+KH8jfSm7NvCSxvX14lnID5aqNCCVso2UJCZmWoiiDD1a8FzK4xc6isNuPIrkjVD5QXIa6SXW0rNM+roTCSj0YoXr1S8TyAvNiDMZ2tGxdu7UrpOumyTHQ7GtEn0hFRllQAO2ZzO1m5MesEWPWaRFv82I1inoBK6/psc6E3bppxFCschpaI9B8LdfXtkW7GwsY9+CLyj4wUkGkvMu3lF6l7pZzaNMn0eclJ0DiHjOYGw5By7jKvnif420dXWPKldVv17HtdwczdrKYNpidNkwUtsM7vxdzvGLooNEiWM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB7177.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?DKn9WlKZCLQGR9Ps+ay2mbyV+8TPqkJg/NMNXvpz7/4jXsU5HLIXtwPLmK?=
 =?iso-8859-1?Q?jBfI9HGTUO7xjWt+tTdnklbUB76XAHuwLkNOCPapge8McqkUJqDQ56DABG?=
 =?iso-8859-1?Q?0SCDMYrg87Rv2qrgRKfREqBmLEO5Ya92miqlJKMjLYfKYTR4csJON6urqd?=
 =?iso-8859-1?Q?jc0HNdTJSBfrGZWGf6i/c1dfFxY4NyFIbPVMEo6Yduku6bzpUmz283g0M4?=
 =?iso-8859-1?Q?7Hxy0JAbsmy7G6MokdlVatUpmQAbEKQgSuj3I5Ccea7ZD09CC6MGYPCu9K?=
 =?iso-8859-1?Q?iAscD9ET3KKJ5h/jACtmXEDJVgBzddjHH3aGTHcPLB0jziatCK+DIpUVKV?=
 =?iso-8859-1?Q?2IM7FqtxUQo5ZZmIsycIE92FWQL8Jg/u/vM1AcwyJhqxf+TGGRbzi4Qin7?=
 =?iso-8859-1?Q?ONAKAdT7B7W/ob7jKFFG40aKMz7Et8GPkO0wP9HsGUzxRm0fsVOEllgkcx?=
 =?iso-8859-1?Q?qrk4aDL3bDch/yxY1aRz4292vXK4khgVaU85g4v6xQH8eEmhZz+h+6ifK6?=
 =?iso-8859-1?Q?lh++p8arlGI8d4BinYk2ED4TqwK9ahYHtydpQCTzvcdG5PdeVgfilqKfVw?=
 =?iso-8859-1?Q?zxxfjzGWM9lQRuXrj1NcIiHdJ+HoXZufY9QibJTsRyt/RmzilrcfGQAOLU?=
 =?iso-8859-1?Q?HpZmi5JQYOxwiKRQL/K2zrcHbBh9pUlsSob8BSIB4rAd/2wZU1bAJ5bZaH?=
 =?iso-8859-1?Q?6rrpRbqkeFPDPjxYvfKay5GEmh7eVCGU+9sudIOEr30J26x0WMYSZnWyu3?=
 =?iso-8859-1?Q?c8BM2NhhHSsK9uh0wXXtfcsa4bxJqT2pyrgdTON4Wzhn85YbYcJaGwMUEv?=
 =?iso-8859-1?Q?z/Mvrb30f3HFVNzbzix1qvETRlQ69vdNUE7kbqAVB/yzFfRJq74fBUfBVq?=
 =?iso-8859-1?Q?IfnaLRbfzxD6xLH+Ev/BGmvWcTNV77Yv51OUHU6KEJgqLA7n0+6y+6Uzvq?=
 =?iso-8859-1?Q?iLTJqBeZi/ggY4CR/43i7dfh49FqSsqYKW19shbtDagVBqZ8dlrQ/ETGXv?=
 =?iso-8859-1?Q?gdsioqSm8WosjSrhqPPrlzykGOa1IOTZ5nnrhyshIRcGl3Hgaie464oDFy?=
 =?iso-8859-1?Q?7I8zlucYwad5vte3J8Y7VYGa7Fm1sqX7qNXhAfWN2srWQiVobyxwxPJsQx?=
 =?iso-8859-1?Q?edV4Xwr6IXe/YFDgezUM70inUDiqiGIYUxNbe6x4kJD43GDvREKTZ0JYmk?=
 =?iso-8859-1?Q?srf6oqcF8sRtJE2Wj8Jgfa1wIw5fVJhwdxCX1yUMEh6fUCKBFRiyI9Heky?=
 =?iso-8859-1?Q?6ZL7Jxz2BdnA4RhE91RNYsYPuHqXLtH1ghUQqXYO8uhOkxXWSpQCQNxl3L?=
 =?iso-8859-1?Q?yNOMz1LSN/ZwRgqHAS4W+gEz+7niBBNPmMgleeXYJIvKM/zSfFlea45cL7?=
 =?iso-8859-1?Q?7oVG+4Zsre7J9DXlHWzqEX2ZFReKTb5TVjNgDLufld4usHHJhBdFzlGb8a?=
 =?iso-8859-1?Q?jc/UTVm/FvdkAX1sZaQcI3iCjcbH9ZsHuN014JC+PH7BWBX1rFxP/lW3DP?=
 =?iso-8859-1?Q?zAcW5nYgn1Aw13F/ICXA5diWHziMWovol3Fx2RbYoeXgSUT2LZDDFNypav?=
 =?iso-8859-1?Q?wur9QVu+xOCZWfLtqHczW8syXzZ3qlDRUq5wVDkBQ8d+lBYIWu8KHA04FK?=
 =?iso-8859-1?Q?37z/q3s8JlPjEb+1o/AULLVvG6Av2u+AKJ/Ukp72kKWkCkxzklO9YO/Wlk?=
 =?iso-8859-1?Q?KCTlRDH4oYAV6qcLEqO/VJ4NapgEkvj0P4NuX8aLtzccF9TFKVadxsC93p?=
 =?iso-8859-1?Q?7wspr6pTsmWpVLcxvFAcrUrMqVLsQ4IQh6tGbviZhihhgWlT0XXnmfc6kK?=
 =?iso-8859-1?Q?MMaHQOCK8A=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: dtYUUn1vInY7fjwIbvkGsCp6H5k9xqJSEpfztpCMAnPMAIHqGpmNvkBUUAhJ7Tzzr2AscHDss9RfDszkP+A4l2I54eKLUzbFEPP8mgzOoWNNVtD2F16I3Y5Q4JQSbfNgsCNuzH076J7lKnLvvusAgHfx9IeqLY+GCC7SzMdUs+rzrebOsLILJEa6YrIf+lmwvEQevaNWG/FTrJey+umt76qbNyoPpc3woYta05HBqphuLKHtyNX56A3dwlbjH09NNlKmiF2YtPKjWo77TEwO6K79jDhJRxielLJ1KxtRGuXOkpRsaRn0NgRy3hRrJ/NidmEIJHwqcXpp5W1PqYOgFA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7177.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a742da8-5e72-4639-cedd-08de83e74ad7
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2026 05:37:34.9246
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lFJEqlaMxkF40l2yYUC+O+IwqG8qKhcDoOhZTrjhcpHUE2eIFGaSQPXZa+3RzyZO/3rKkCuJSAlaMAaEnp/qiARcXVv4+4xD6M1VigkiueU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8134
X-OriginatorOrg: intel.com
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
	RCPT_COUNT_TWELVE(0.00)[23];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55993-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[redhat.com,linux-foundation.org,arndb.de,ffwll.ch,intel.com,infradead.org,lst.de,google.com,gmail.com,suse.de,lists.linux.dev,kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[CH3PR11MB7177.namprd11.prod.outlook.com:mid,intel.com:dkim,intel.com:email,nvidia.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: 3A34A2A4089
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> Subject: [PATCH] udmabuf: Do not create malformed scatterlists
>=20
> Using a sg_set_folio() loop for every 4K results in a malformed scatterli=
st
> because sg_set_folio() has an issue with offsets > PAGE_SIZE and because
> scatterlist expects the creator to build a list which consolidates any
> physical contiguity.
>=20
> sg_alloc_table_from_pages() creates a valid scatterlist directly from a
> struct page array, so go back to that.
>=20
> Remove the offsets allocation and just store an array of tail pages as it
> did before the below commit. Everything wants that anyhow.
>=20
> Fixes: 0c8b91ef5100 ("udmabuf: add back support for mapping hugetlb
> pages")
> Reported-by: Julian Orth <ju.orth@gmail.com>
> Closes: https://lore.kernel.org/all/20260308-scatterlist-v1-1-
> 39c4566b0bba@gmail.com/
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/dma-buf/udmabuf.c | 49 +++++++++++----------------------------
>  1 file changed, 13 insertions(+), 36 deletions(-)
>=20
> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index 94b8ecb892bb17..5d687860445137 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -26,10 +26,10 @@ MODULE_PARM_DESC(size_limit_mb, "Max size
> of a dmabuf, in megabytes. Default is
>=20
>  struct udmabuf {
>  	pgoff_t pagecount;
> -	struct folio **folios;
> +	struct page **pages;
>=20
>  	/**
> -	 * Unlike folios, pinned_folios is only used for unpin.
> +	 * Unlike pages, pinned_folios is only used for unpin.
>  	 * So, nr_pinned is not the same to pagecount, the pinned_folios
>  	 * only set each folio which already pinned when udmabuf_create.
>  	 * Note that, since a folio may be pinned multiple times, each folio
> @@ -41,7 +41,6 @@ struct udmabuf {
>=20
>  	struct sg_table *sg;
>  	struct miscdevice *device;
> -	pgoff_t *offsets;
>  };
>=20
>  static vm_fault_t udmabuf_vm_fault(struct vm_fault *vmf)
> @@ -55,8 +54,7 @@ static vm_fault_t udmabuf_vm_fault(struct vm_fault
> *vmf)
>  	if (pgoff >=3D ubuf->pagecount)
>  		return VM_FAULT_SIGBUS;
>=20
> -	pfn =3D folio_pfn(ubuf->folios[pgoff]);
> -	pfn +=3D ubuf->offsets[pgoff] >> PAGE_SHIFT;
> +	pfn =3D page_to_pfn(ubuf->pages[pgoff]);
>=20
>  	ret =3D vmf_insert_pfn(vma, vmf->address, pfn);
>  	if (ret & VM_FAULT_ERROR)
> @@ -73,8 +71,7 @@ static vm_fault_t udmabuf_vm_fault(struct vm_fault
> *vmf)
>  		if (WARN_ON(pgoff >=3D ubuf->pagecount))
>  			break;
>=20
> -		pfn =3D folio_pfn(ubuf->folios[pgoff]);
> -		pfn +=3D ubuf->offsets[pgoff] >> PAGE_SHIFT;
> +		pfn =3D page_to_pfn(ubuf->pages[pgoff]);
>=20
>  		/**
>  		 * If the below vmf_insert_pfn() fails, we do not return an
> @@ -109,22 +106,11 @@ static int mmap_udmabuf(struct dma_buf *buf,
> struct vm_area_struct *vma)
>  static int vmap_udmabuf(struct dma_buf *buf, struct iosys_map *map)
>  {
>  	struct udmabuf *ubuf =3D buf->priv;
> -	struct page **pages;
>  	void *vaddr;
> -	pgoff_t pg;
>=20
>  	dma_resv_assert_held(buf->resv);
>=20
> -	pages =3D kvmalloc_objs(*pages, ubuf->pagecount);
> -	if (!pages)
> -		return -ENOMEM;
> -
> -	for (pg =3D 0; pg < ubuf->pagecount; pg++)
> -		pages[pg] =3D folio_page(ubuf->folios[pg],
> -				       ubuf->offsets[pg] >> PAGE_SHIFT);
> -
> -	vaddr =3D vm_map_ram(pages, ubuf->pagecount, -1);
> -	kvfree(pages);
> +	vaddr =3D vm_map_ram(ubuf->pages, ubuf->pagecount, -1);
>  	if (!vaddr)
>  		return -EINVAL;
>=20
> @@ -146,22 +132,18 @@ static struct sg_table *get_sg_table(struct
> device *dev, struct dma_buf *buf,
>  {
>  	struct udmabuf *ubuf =3D buf->priv;
>  	struct sg_table *sg;
> -	struct scatterlist *sgl;
> -	unsigned int i =3D 0;
>  	int ret;
>=20
>  	sg =3D kzalloc_obj(*sg);
>  	if (!sg)
>  		return ERR_PTR(-ENOMEM);
>=20
> -	ret =3D sg_alloc_table(sg, ubuf->pagecount, GFP_KERNEL);
> +	ret =3D sg_alloc_table_from_pages(sg, ubuf->pages, ubuf-
> >pagecount, 0,
> +					ubuf->pagecount << PAGE_SHIFT,
> +					GFP_KERNEL);
>  	if (ret < 0)
>  		goto err_alloc;
>=20
> -	for_each_sg(sg->sgl, sgl, ubuf->pagecount, i)
> -		sg_set_folio(sgl, ubuf->folios[i], PAGE_SIZE,
> -			     ubuf->offsets[i]);
> -
>  	ret =3D dma_map_sgtable(dev, sg, direction, 0);
>  	if (ret < 0)
>  		goto err_map;
> @@ -207,12 +189,8 @@ static void unpin_all_folios(struct udmabuf
> *ubuf)
>=20
>  static __always_inline int init_udmabuf(struct udmabuf *ubuf, pgoff_t
> pgcnt)
>  {
> -	ubuf->folios =3D kvmalloc_objs(*ubuf->folios, pgcnt);
> -	if (!ubuf->folios)
> -		return -ENOMEM;
> -
> -	ubuf->offsets =3D kvzalloc_objs(*ubuf->offsets, pgcnt);
> -	if (!ubuf->offsets)
> +	ubuf->pages =3D kvmalloc_objs(*ubuf->pages, pgcnt);
> +	if (!ubuf->pages)
>  		return -ENOMEM;
>=20
>  	ubuf->pinned_folios =3D kvmalloc_objs(*ubuf->pinned_folios,
> pgcnt);
> @@ -225,8 +203,7 @@ static __always_inline int init_udmabuf(struct
> udmabuf *ubuf, pgoff_t pgcnt)
>  static __always_inline void deinit_udmabuf(struct udmabuf *ubuf)
>  {
>  	unpin_all_folios(ubuf);
> -	kvfree(ubuf->offsets);
> -	kvfree(ubuf->folios);
> +	kvfree(ubuf->pages);
>  }
>=20
>  static void release_udmabuf(struct dma_buf *buf)
> @@ -344,8 +321,8 @@ static long udmabuf_pin_folios(struct udmabuf
> *ubuf, struct file *memfd,
>  		ubuf->pinned_folios[nr_pinned++] =3D folios[cur_folio];
>=20
>  		for (; subpgoff < fsize; subpgoff +=3D PAGE_SIZE) {
> -			ubuf->folios[upgcnt] =3D folios[cur_folio];
> -			ubuf->offsets[upgcnt] =3D subpgoff;
> +			ubuf->pages[upgcnt] =3D folio_page(folios[cur_folio],
> +						subpgoff >> PAGE_SHIFT);
>  			++upgcnt;
LGTM.
Reviewed-by: Vivek Kasireddy <vivek.kasireddy@intel.com>

Thanks,
Vivek

>=20
>  			if (++cur_pgcnt >=3D pgcnt)
>=20
> base-commit: 1f318b96cc84d7c2ab792fcc0bfd42a7ca890681
> --
> 2.43.0


