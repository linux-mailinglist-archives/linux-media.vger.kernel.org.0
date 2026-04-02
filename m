Return-Path: <linux-media+bounces-57918-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SEa8D+sTzmn1kwYAu9opvQ
	(envelope-from <linux-media+bounces-57918-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 08:59:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BF992384D8E
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 08:59:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4B17B30FD13E
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2026 06:57:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E5CB330647;
	Thu,  2 Apr 2026 06:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I9p7Bidm"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A60035F619;
	Thu,  2 Apr 2026 06:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775113021; cv=fail; b=cCh9rlinxQ5NATGost4Jbo4xohuNPmirVovoAw/UKHbWhuR+JJ63cKty0nGgNAIIsN8BdokvGRTKJUSsw57veYnDPRm2X1er7bqC8DkajHR06M0Ra+uOMU2TkXr/W228f/yNv3pC0/h1yeNneMuEHJB77jP9cVHMle1Ufdy9JV4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775113021; c=relaxed/simple;
	bh=DgdrdSd1+in4LnQwdPQEk+PRT0iMrkc6aaBVlR90Y7o=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jQuKB0BCj/o/LA02M3QQEfh/B8uXCz2x3Y3cY2ImN/JWHj0NW4VSJH6x876aDpPwOOIy26210FbRjNanVOtvQX0qaTs1X1XIk78HpNmrsWjqIJRFd+BWi+uLnAxHqZgfP8npZKUGOWfyT69s04Qlp1MjFrylLEBFt7o/TrM4OTk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I9p7Bidm; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775113021; x=1806649021;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=DgdrdSd1+in4LnQwdPQEk+PRT0iMrkc6aaBVlR90Y7o=;
  b=I9p7Bidm1MQzYvKdumK+PzWVj4PO7vZ4jaRnfX8/wuwjulX1VO3mc/Wq
   FwXJsteoHDGYZyQqxSrvTL918hxqt6+lwktnF9dbrUrXsR3lPx0Ueij1X
   6FFtyAVXJD/70MM0kBxj+4Yr/wJcJQlYJPmhV+RzxX+0QZyiemOYkVOvd
   Dy3jwdWRL2b4t5ZvQ98QQ6ewk+46WnM1VKixgMYdJ187KViAblLZ31Mgv
   lIYXN9TYAzpQ2XKNG4v0WBfOzFoqSB9wEJ8JRs+zFk1AGGB/NRJiVlsYM
   RYJwoEjkaHu3nFE/1A/t/BozDwS/FI00Qi/zfJ1m5uL1ihMwqaC0zVENo
   A==;
X-CSE-ConnectionGUID: vGvGjoROSYKkClcAotf1WQ==
X-CSE-MsgGUID: 20+DOTalS6+3zrkSO8SRhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="87239903"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="87239903"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 23:57:00 -0700
X-CSE-ConnectionGUID: eW1TrP6wSiycSKypGfjfrw==
X-CSE-MsgGUID: NDDZTrYAQnS8ZekWeG9Kvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="264831164"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 23:56:59 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 23:56:58 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 1 Apr 2026 23:56:58 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.48) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 23:56:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HVzVRE0MXsrd4ZBod+Ebj/N/G6p2B+vKw1pNEnYCHqhqC95VGeNiQiGa0Dj3v5waJytDRvl5p3cCwZfZwSpjKnHI0TQ/bNMuWiUf0v1jhxJRqFOl0pq9rb0czq3+oyYDozAVZkIP0ESV8b5rMA9+mcGkzkvVMc3geUERJMaBJ6et6a8uE4iCL1xe5GQgyBBpAaYBgXMaJIDQwaebD2tjuF7uaF8mX4jeCzjhD2UUhByCOTfF/klKwWL934KML3XaZ3g3dWVGaNHiAppmRolJN66+eYhgtqjTnr48FZ+05+JiYY5HdelEouqZsjNZGA/GmHhxGrjcL2Dl9gWJWc8XVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=omMJyqX37jf+XJYcMBXl2Ittss7mD2XSR+bQZVineOw=;
 b=QBOWiIQfd9ErPcOOhmCMatRfPSngSZGW517Y/Syowc/6y8pyldb/duvF3iAANGQ9qaqaEmjsXT7lzDfD+8bn7L056BoAuVUorTkickgdMHtBk4NZ6FvoKvQ5WQXOI/HIeqCA1HAMf5M8voLOIVXKpf9+c31CNziBUt/166dWi978OVMkiSvavdmTrN6+Mm5Cvuxz58L0df5PfMUCE3CD2Y6a9O0O0sldGkb4eGzqi8DXuTE7IrrYbAuKbYXoxhJt7kmLtZouo1LDIJnh5aTyZJEsCNFPUzlwne2Bpgh+tzKqu8564YHEA/Iv2iuyKBPIwpLZVgt6+pYgoxxZ3Ee3oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8230.namprd11.prod.outlook.com (2603:10b6:8:158::21)
 by IA1PR11MB6291.namprd11.prod.outlook.com (2603:10b6:208:3e5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 2 Apr
 2026 06:56:50 +0000
Received: from DS0PR11MB8230.namprd11.prod.outlook.com
 ([fe80::2592:f5a9:a751:be40]) by DS0PR11MB8230.namprd11.prod.outlook.com
 ([fe80::2592:f5a9:a751:be40%4]) with mapi id 15.20.9769.015; Thu, 2 Apr 2026
 06:56:50 +0000
Message-ID: <e84dd3fb-0758-432b-9068-81c7d106f21e@intel.com>
Date: Thu, 2 Apr 2026 14:56:41 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86: int3472: Use actual clock frequency for
 DSM method
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <johannes.goede@oss.qualcomm.com>,
	<dan.scally@ideasonboard.com>, <sakari.ailus@linux.intel.com>,
	<bingbu.cao@intel.com>, <linux-media@vger.kernel.org>, LKML
	<linux-kernel@vger.kernel.org>
References: <20251208035122.2147678-1-hao.yao@intel.com>
 <e66e29a3-f534-64a8-67cb-79f93e9d1f10@linux.intel.com>
Content-Language: en-US
From: Hao Yao <hao.yao@intel.com>
In-Reply-To: <e66e29a3-f534-64a8-67cb-79f93e9d1f10@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG3P274CA0021.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::33)
 To DS0PR11MB8230.namprd11.prod.outlook.com (2603:10b6:8:158::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8230:EE_|IA1PR11MB6291:EE_
X-MS-Office365-Filtering-Correlation-Id: e69eba45-8c8c-411e-8086-08de90850383
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|42112799006|1800799024|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: RxaEQDd9ah9TvRyIeN0V1koBcyMbERDLQyjndsbF9oURoynfOgCMX63XBgXEmr5HoUiLi/n5JOH3SGsBrN1bk/IRx8yJz05sGG8P6PqLgoRwm+3TCv84ghRBFWi4E4UuUns8Rm1lGKMg9viG90s5dYBRMXDbwfrbgoxJIZy7GWUXu851JvYTHL3v5Dkv9Wmt0+baFPAVdfV51XZoGI697njWHdtDnwsRxK1Fz58LBOEN5Obe+IG0xuQS17n/TnVh986W0vQkI1EFhJpy73f6MiX3wTBvPRUFd77p4PCCcgUrqA30yHLAEnh1sYuRAFiPQlMISTRPTqOdXKU7zmbZHOaC98ALBlXPYoeVh5iPT6vASUre/lWdSSHEXBwgeLb7H/WkB7M1Ttz22mZ4dNU7t+667/MVVI40HzJ3n0549wAH1HQ4sVlZqXjU8d163T/LZLJUZeD/Anj2xM0v155zPTmrnvPQzpqZu7FwEC6FMSZ8vOmi4pRMxeVxMz4TgaboC1NWmirbzfzO+IW8s/gHCZu5GR2ePnBvZPbGcpue9ITfv0niNMU9bqbkb2sxMxFx1q/nX+DSXmMp0s3aQZjLTf5IxeelBGGi34R/i6pwHAjlVv/48h4NLdy9KT1Oqd9DEn2UL2wMMqmsb6rmTE+J2bN2n7x/K4iFLZgbkgNDLzbSoQ6wuhmf3zxJup3PXZpY95S3cO1dkywqlBi2fFVLszSmWGKtuHEp5r91jqQ+s10=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8230.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(42112799006)(1800799024)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGZzcVJVcWlyRmFxWmlVK1dYNjhadHVuaGJBQ2RYMzJZcVppMG5SUDFZQzNi?=
 =?utf-8?B?YW9GK2NQekJtZktiSTBZeDAzQ3BScnhYcFhtc2MwbXVObkpsczF5L085SEZr?=
 =?utf-8?B?Y09aZ1poaithQ2hLdFRES3NHVnh0ZDhLUWl3Y3JvZWZyb1hOQ3IxcUZWWnlv?=
 =?utf-8?B?bWc0S2FSeXgzS29LWDZ5OUtWdUpja0d2L0RsZkJuUXFoSFZoL1F1WTV2WDU4?=
 =?utf-8?B?NUhZeFpmVzk1WDRTbWk4NXhTSTMxcDRhWmtWWms4NFlBYmJzajAwQnp1S0NS?=
 =?utf-8?B?cGN2R3p0VTBLZWRCYXgxL1pTdmtkejU1NFpKanVTUUdYdUxQOFpZZjlRM3Jp?=
 =?utf-8?B?K1dUbUJyRW5RM3lCZWZyN0RjcUVDVEpQano2SDlqUWMwNWJCckJVU0Q0eUM5?=
 =?utf-8?B?ZHpNcjFFSkF0QnhTVkNYU3pzOUMxTDVvQmVZdzRDTFc3ZUZHWXBVRGwvOVFi?=
 =?utf-8?B?VGJpOGY2MVlNOXUzUVV2dUtWWGdwOC9FRi8rbTB3ZDRWU2dnUFVsYVdGVCsy?=
 =?utf-8?B?NGJ0REtyQ2V6Z05PSXQrcnhYZ2o4d29Tc1d3d1Zobitzd2w0NHZqZDM5RjYz?=
 =?utf-8?B?Z3RIL0F4SWRKbzVKREN4L2ErUnFaS3YvRlY0TFZ6c2dQeG9raGNSdjd4WmR3?=
 =?utf-8?B?RCtncndYR1ZwRUxML1hxaWo2a1ErUDN5b3ROV1phNytxQnNvTXZ4aUNxNk82?=
 =?utf-8?B?TE84bWQxTnlzc2t0WG12TEh3bGlBWEwyMW5ESEo1TEdITXpNb04ySHNPOGNT?=
 =?utf-8?B?cFZwRUNzTkZBQnJqSlFmbk5vcFlVejdFanRxL1JqYkhsd0J3eDhKMk1aSVZC?=
 =?utf-8?B?Y0gzOTcwNU5YeDBOTHhqWGlQZzR5Nkwva3YwY2tQUEhIWm92am41RHVyZHRk?=
 =?utf-8?B?enROeEhYT0pGR1R2MmowK3VHRUNacmI3R2M2MEZnMTc4V0dHcDBIRzVmcEV5?=
 =?utf-8?B?dW1GYVIrRkRCbVNCQitSdnhmQkVOTjRxdDhBVHhBSjR0SEMzYTJhSE9XbVhP?=
 =?utf-8?B?WG53QVRaMmxWTWJhVGlsUExab3diYUxvWnIybW9vSmlVTVNNekUrbUxBS2NV?=
 =?utf-8?B?TVQvb0tHdHMyUXpDNUowLzcxU1J2VUd5aG82SUFqYVVFWktJcmVjMU1sczZQ?=
 =?utf-8?B?SVB0NWk0MGgvNXp4NXNwc2drSENYSE5IMGlXbUZ1TStWc1N5eFFlQncyR1Bs?=
 =?utf-8?B?Q25GMjA0dmxGVXcwRzJ4TTM0eFIrc1BIclR3L1dzZU8yU3Z1R1N5M1VSd0or?=
 =?utf-8?B?WXcydzlPNnRDRDRDL1kzZTQrL1BDZTVNWkxWb09uanZZR0NVMjBTcTE0aUpF?=
 =?utf-8?B?UGFLRVUxTFRwbENHaUpYcnpqWFUxVTVBNTRrTmxVU28xdGV3Y1IzdWM0MnM1?=
 =?utf-8?B?WXVxaFpxVW5mUW9ZWEVwVWI0cnZheU5NYkRPc0N0L2dZQlRwUUZPV0dtWlhj?=
 =?utf-8?B?bXhqSWlUSFhSVkhMUENNSWZGZFJuVnBycmMvU09mbHZscWowSlVtc3JFMEVM?=
 =?utf-8?B?R1JmUzk5VEc0MnVwZzhPRlI0cXhGZi9lOVJrbTRLSFIzNlgzZElVeHAvZ3lT?=
 =?utf-8?B?L0FVT1c4TE5Fd1ZMRjdDTzVOY1N5Y3BFWE5mVFZMdW5YbE9nZUVndEZiZlhr?=
 =?utf-8?B?UFV0ZlpFek5GMWVKWGQ3eW5PNXdNWVA3V2dUM25oOEx5SnliRE8wSXFXdVV2?=
 =?utf-8?B?UHNVd28wSitid2w4eFRVdmtXSWZBM2FXV29VTUpWd2NMUkNWeFo2Uk1IZEFl?=
 =?utf-8?B?ZU0wMnNQNk9ndHZWOFNHSXFCRnJBZDFnZVhEam51NmhNQmI1azFSWkxxb25v?=
 =?utf-8?B?YS9hM1E1N1h6NXkxN2l0azA0bzdycUxSQWFBWjQ2OXJPSGZ2bXFJQjdOaTIr?=
 =?utf-8?B?OXBYTXJJS211SFBXUmVocHhmYUV0RkNtOFg1MDNJTUlSaTV6K1BUQWFLNEJX?=
 =?utf-8?B?dkhjSjNKa3JhdTZSNDlCemJlQXN4QnJaZmw1SEx3MTJwaldoVG1LRTZtTkNN?=
 =?utf-8?B?UVA5MnpnNDFvWXRFanpmVWpJb0wyNTlKQnovcVlkSmYzdzBteW80cGYxQjVB?=
 =?utf-8?B?NnVsdUZpTHB5YlNIM01oRmtYUEdVaW9EbkQ5cnh0QzBiVkNOaTZDNktnV09s?=
 =?utf-8?B?UXBVb3krUEtzckpndlpoRk9EWlRHU1FoMXZaMktlRCtiVFYwRUVQcEpzb2Zn?=
 =?utf-8?B?dW1Bemh5SUZubkRiZnFkN2pCYndhZkd3OTZETkRORXpmR0tXRWJTYWFOMEt4?=
 =?utf-8?B?WTVpR2YxUjVaWkw0dnhudlVrSm9KSEJ6aVdBRVZCMHU0NVdMcWtFUTdBUis4?=
 =?utf-8?B?YlF5QWZIajJubkFuZXB2L3lmMjlFUjJ0dEpNUEZ5aUxEMndSVlZzZz09?=
X-Exchange-RoutingPolicyChecked: ncbj32kAtVbv9VxREBtfJs76FmX0Gznn9sFT4YT4Fjyvw1eQte/lNXaRzMdAJc+BMcFdMsWloGw1K1HY9it4L7B8snZRIyBXvfkHj5RgLQPPbHMVJ3M/f52pOtxP8DZStw5nKef+dwhyWivzZLCmY3eykuENnm2sd2eA+ogpiqExtNnsbA/wqYNLyscTxN/qHhx5z15Ki20lThon7Mwo4afcUZ0Tom0joUjLRoxbIoN9VcOAmnSmLzglBHkNXkE/lrKzmiGUhttqYsdqVDkZi6FqwOXsf76nWvxjBRNNn585a+4AiqxC/Bm2qOk6KQEWeQxyIW6uiNCeBGR3t1nsjg==
X-MS-Exchange-CrossTenant-Network-Message-Id: e69eba45-8c8c-411e-8086-08de90850383
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8230.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 06:56:50.0619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1zZJxV5INWHUTrFmIuOv2e89DOY2MVWnN5A6atNT+lAwNRryRO3nIRp7ScDhWon6LwqTgGRk0K4ojfTqhuf49w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6291
X-OriginatorOrg: intel.com
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-57918-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,intel.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hao.yao@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: BF992384D8E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

Sorry for missing this mail,

On 12/29/25 20:06, Ilpo Järvinen wrote:
> On Mon, 8 Dec 2025, Hao Yao wrote:
> 
>> The third argument (args[2]) to the _DSM method was hardcoded to 1,
>> which corresponds to 19.2MHz. However, this argument should reflect
>> the actual clock frequency from the sensor's ACPI data.
>>
>> According to the DSM specification:
>> - 1 = 19.2MHz
>> - 3 = 24MHz
>>
>> Read the frequency from clk->frequency and set the DSM argument
>> accordingly, with 19.2MHz as the default for unsupported frequencies.
>>
>> This ensures the sensor receives the correct clock frequency as
>> specified in its ACPI configuration.
>>
>> Signed-off-by: Hao Yao <hao.yao@intel.com>
> 
> Should this have a Fixes tag?
> 

Fixes: e4543de8b6ff ("platform/x86: int3472: Evaluate device's _DSM 
method to control imaging clock")

> Could you please also mention what you discovered about values 0 and 2 in
> the changelog as it seems useful information (I requested this in v1).
> 

When I send value 0 or 2, the clock doesn't change (checked by 
oscilloscope). I guess that values other than 1 and 3 is ignored 
currently, maybe reserved for future usage.


Best Regards,
Hao Yao

>> ---
>>   .../x86/intel/int3472/clk_and_regulator.c     | 21 ++++++++++++++++++-
>>   1 file changed, 20 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/intel/int3472/clk_and_regulator.c b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
>> index 9e052b164a1a..c834fd59ec0c 100644
>> --- a/drivers/platform/x86/intel/int3472/clk_and_regulator.c
>> +++ b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
>> @@ -19,23 +19,42 @@ static const guid_t img_clk_guid =
>>   	GUID_INIT(0x82c0d13a, 0x78c5, 0x4244,
>>   		  0x9b, 0xb1, 0xeb, 0x8b, 0x53, 0x9a, 0x8d, 0x11);
>>   
>> +/*
>> + * The PCH clock frequency argument to the _DSM method:
>> + * PCH_CLK_FREQ_19M2 = 19.2MHz (default)
>> + * PCH_CLK_FREQ_24M = 24MHz
>> + */
>> +#define PCH_CLK_FREQ_19M2	1
>> +#define PCH_CLK_FREQ_24M	3
>> +
>>   static void skl_int3472_enable_clk(struct int3472_clock *clk, int enable)
>>   {
>>   	struct int3472_discrete_device *int3472 = to_int3472_device(clk);
>>   	union acpi_object args[3];
>>   	union acpi_object argv4;
>> +	u32 dsm_freq_arg;
>>   
>>   	if (clk->ena_gpio) {
>>   		gpiod_set_value_cansleep(clk->ena_gpio, enable);
>>   		return;
>>   	}
>>   
>> +	switch (clk->frequency) {
>> +	case 24000000:
>> +		dsm_freq_arg = PCH_CLK_FREQ_24M;
>> +		break;
>> +	case 19200000:
>> +	default:
>> +		dsm_freq_arg = PCH_CLK_FREQ_19M2;
>> +		break;
>> +	}
>> +
>>   	args[0].integer.type = ACPI_TYPE_INTEGER;
>>   	args[0].integer.value = clk->imgclk_index;
>>   	args[1].integer.type = ACPI_TYPE_INTEGER;
>>   	args[1].integer.value = enable;
>>   	args[2].integer.type = ACPI_TYPE_INTEGER;
>> -	args[2].integer.value = 1;
>> +	args[2].integer.value = dsm_freq_arg;
>>   
>>   	argv4.type = ACPI_TYPE_PACKAGE;
>>   	argv4.package.count = 3;
>>
> 
> 


