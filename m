Return-Path: <linux-media+bounces-57250-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oO6hGkWMxmlELgUAu9opvQ
	(envelope-from <linux-media+bounces-57250-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 14:55:17 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC546345A53
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 14:55:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 603EC3120455
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 13:46:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 614183F0740;
	Fri, 27 Mar 2026 13:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TSwciMkB"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2992839B486;
	Fri, 27 Mar 2026 13:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774619144; cv=fail; b=J/eTOUrUH/1vQBy3RVPJKtNSIWYsf47vxv1Gizz38Fmaixqlnx5l8T/5x9jBrVnDojure6uhG5FZ5zJjqQveOPYP6KZByUckrC7GoCVXEl8sMBwGFrPq6AmgO4EFbjk4Jt8TijrTIuf5YwPt+z/qGJtkka78VQfeNQ8QKMcBvwY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774619144; c=relaxed/simple;
	bh=mGimq3smE6qf3Ai8+oAp2Hou8tVHTdY3X43+pbz3wgI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UMm/wlImeOBInkuaM5cP0JAE+ceD5TGb85lUmLMHY3v2yOsm2L5POoaDSQqTAQ8kfdyTBBhFMFXFE7WTK0GDm9BeCFkNtpYUOOHxiKoKHxQ/Lrr6NlGW09C6onvKWI9Xmu8OgDrbFgmmr82LqJylWglY0ADbtegw3OGdokcvcJo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TSwciMkB; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774619143; x=1806155143;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=mGimq3smE6qf3Ai8+oAp2Hou8tVHTdY3X43+pbz3wgI=;
  b=TSwciMkBpHxvGrbP5q+g9ODV7f+Kr9IhXbFMfb3UIAowxfugQR9mWqcP
   2CS8uzGLB3QX7MF3IsUgNrkW81hDvAtNdANY7Cr01fjGJ9a1QV2tTw5V1
   NVT1SsxK8MgABTCiOxjlk2bfgT2MABfKu+DdjP2Q8g584DumikbZhGtis
   dtvpu4Yx8S67XzTy3B0VF/gW0ksAmcpJoJTQTgsYkNJ/8FzL+wnlanEqO
   KEfWYD+mxVUheZdgQSd2KbFY2lQtuzuPtoNnEI+RvgB5EcpoHQn0myUfL
   IuaJbo4YyNrbmReV7XgRjoye1UwIekJ+XjeVfuYvTK3Bmm3McTWN7YmGj
   A==;
X-CSE-ConnectionGUID: GndkhYQhR06+j4MRvNMExw==
X-CSE-MsgGUID: VHIgo/mhS2eqSXq00V8KRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="86769624"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="86769624"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 06:45:43 -0700
X-CSE-ConnectionGUID: iEe5eejwRuuZHjTLbxLb/Q==
X-CSE-MsgGUID: rkYOwyIRS0eyjFOSLSVfpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="225243106"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 06:45:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Mar 2026 06:45:42 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 27 Mar 2026 06:45:42 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.34) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Mar 2026 06:45:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XntbDpknHWLLX0u7fsXy3eh5HSspbYFiAhwBwZxBoXQZrU/udX+nIRJ4AhaGObkzKPXoavHB2/Ue+eNMHNwAF5zgzQf/447jXShv03XsSbDxNxiwPqr+ciINJjM/wwgTxFpTVJs7EW/8iM//wSdS1kFQWBNE3PqyenwenXyhAkCxPsV/AEgzoVY7ipASqrwCGXhZbe0jUQ2Uoy/mvhzSlVmSAb8zNMxvS5YiQ4jyZRRVpL+LNPQOsx3/njfpNtkhePm/mH+MsJY4l87MntEFZDxLOw12vYXGc9bmhTN9FZ4owQjionlqU1So0VW0eKcRefr502cjYZOjCUO8W65SqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mGimq3smE6qf3Ai8+oAp2Hou8tVHTdY3X43+pbz3wgI=;
 b=g+LKuMZYXZoKQ1eFCD2ZnqeMIDZr8fVpzuqxPmzm/z//fhpgqmU4rKFidOMfRL+sHiwcRTeMboD3LM+KixFSWqllnvKNVZLFDXVFpRnV4721dnnY5DcP4Zj4eAajFUO5hfpB87bMNaEmON+gM/7Mt6j9FNUY67uUx7nCtKjeZx4bMvTufAjFpuAsCocMLE1VN5goT3pGicOZlLX6RoPRSomCedb5I6TCLZxLP+bu8W/svnrK8kFXUgvcFB4zZRfjs44IA8QCompkoigFzjBucewJSdaC/POcgAdiJmIn25gGv2Rl1q+X0KXADnvstePjvvbHVn6TkzCEBPgMZYBy1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB8022.namprd11.prod.outlook.com (2603:10b6:806:2fe::14)
 by SA3PR11MB8118.namprd11.prod.outlook.com (2603:10b6:806:2f1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Fri, 27 Mar
 2026 13:45:37 +0000
Received: from SA3PR11MB8022.namprd11.prod.outlook.com
 ([fe80::5bc2:3dd9:94f0:21ce]) by SA3PR11MB8022.namprd11.prod.outlook.com
 ([fe80::5bc2:3dd9:94f0:21ce%4]) with mapi id 15.20.9769.006; Fri, 27 Mar 2026
 13:45:37 +0000
From: "T, Arun" <arun.t@intel.com>
To: Dan Scally <dan.scally@ideasonboard.com>,
	"johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>
CC: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>, "Kao, Arec"
	<arec.kao@intel.com>, "ilpo.jarvinen@linux.intel.com"
	<ilpo.jarvinen@linux.intel.com>, "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "Djait, Mehdi" <mehdi.djait@intel.com>
Subject: RE: [PATCH v4 1/2] platform/x86: int3472: Add TPS68470 board data for
 Intel nvl
Thread-Topic: [PATCH v4 1/2] platform/x86: int3472: Add TPS68470 board data
 for Intel nvl
Thread-Index: AQHcrYdZgLR4y1PdOkqwcAH2m3V2krW/I8AAgANgdYA=
Date: Fri, 27 Mar 2026 13:45:36 +0000
Message-ID: <SA3PR11MB80220432F6134A90912A43419D57A@SA3PR11MB8022.namprd11.prod.outlook.com>
References: <20260306163019.1619490-1-arun.t@intel.com>
 <20260306163019.1619490-2-arun.t@intel.com>
 <d7abde5d-0945-45f2-a1a4-b4d3a1d7e4f8@ideasonboard.com>
In-Reply-To: <d7abde5d-0945-45f2-a1a4-b4d3a1d7e4f8@ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB8022:EE_|SA3PR11MB8118:EE_
x-ms-office365-filtering-correlation-id: fce4028d-c8f1-45c7-df52-08de8c07206f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|10070799003|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info: w0L0A+0xB2Fw/dRlrGKh2k6315OkNfrqAvoCedQCk/p6kkFpUMiGJnxwaWLpfGrkaS6xVH0x3vpQyAC+L1Xn0zNj1AIRCOWuL5w5DIYRFUrebNpDkxE0HdU23sCPQBY5KLaYB44CtD6dHSowMMYy3QgzlG+R7qhx8JwYKfxC4aNg5F/Z2EXAIZb2Fez2rRdeImSg+RAyGJ2R9WISR90VvZOAxhHCxhOqiG0rrpUV/xQQBvwZDnBdNGaQrMl4yIT4GX9e6RE2bKH0dns1N8UYS9jxJPEavoWDuVsbOv+YauL1Z5+vKH63wbJaoBJEb+2fpjzKYVaYgDRGd8LNjojZBh82HqesjWSb3MojkrWqHt2fhcC7AtWGXpK2xmY+SSGDxBdEZ8LDYx+8aVCY9zqU2dD0dyWaRFqCJPinKoUIs+o5K0Jm4CJi2ALJBaJl7w31Z6Ynugu1uCfJ/+KYDOghgFwhRIaA6IqLx8kl46IctNy9WWQ5pIX5gqyx4V6ILCyEbLVNsMkJZmI6fJ3wup2NSbvp8zUaUyJT86lsJJqRfz7woe/IHCbI0YLfA42qUu7it2RV4mAWjVHLMPDJwtnj46lcqoCZbsSTtZbDEc/vInm8/vnLye9d8xh92+oNeopIic4EuPs/5Eu8z5l68vR2RgLPHZBntrR5Mg+Kim5qxgIM1TJWn+gFzMIYdrSy2swBL1pn/7jeNEZdXGQhecNDKlEZhni3pf6CH6Ss77MlIfIB3PleGO9ozEmhILKWf00LhQtkb348jdqZ8m0VNbaquxO50oJGWCxH/1k2jDPXk7o=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR11MB8022.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(10070799003)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SU01VzE0S3MvWGJ2MGhiWEV3MEs5SDE3NXlkaDhhSjFPQnZKWHQxWXBzRXIz?=
 =?utf-8?B?eXpOS0VUY25GVUYyZFdoZFFERVlmZUZMM2lvaTBQQzhmYjY2UC9FeGpjMXdp?=
 =?utf-8?B?NCt6S3VOb0lrcXNlKzU4bUNtK25mUXhTTCtzZEtQMHlJVzU0ZDJmZlNsbCtt?=
 =?utf-8?B?UUpmK0FUTXo3RVA4Tk9vQVN6TmNnUnhXdGh4M2p2VDk4RktCOFhOK0hkeURL?=
 =?utf-8?B?WVFxUFZaaGkrS2tYQ3BsSFlpbkphMkgxVEpJWURwbUw0L2c1dXJ1Zlp4UHJo?=
 =?utf-8?B?Z1J0Wkt2UXEvSjMvRW9iVDZRMlp4SkFsN2VyWW15WC9kTHNXTDN2c282T0ll?=
 =?utf-8?B?Rks1c3ZHb0pzNmM4aW45RzNsc1Z4aTNxdkViNk9xWE0wRWp2bXcxeGpXYkJM?=
 =?utf-8?B?WmU0NEwvSnNBc3RpOEZhMU0zNWwrZk9iZkw4RWkzdm9qd1dFU1pjQWdZenlq?=
 =?utf-8?B?bVVOT1Rpbjd3aWo2NHpHem10alE2R2FVQy8zaTZmOFN0SnVJdzNDN2dSQjc1?=
 =?utf-8?B?OUttbUVoWm1tVHNOeU4yOXpEZElIam9MUnpsODJ4clFaZGtSRCttYko2V2dJ?=
 =?utf-8?B?S0VyZkRmZzlEaGVvRUJkNzN6TUcxemJPejJac0RoOXhpNFk2SUpRclRMNjVj?=
 =?utf-8?B?M2R4S0hDMzlqWXZzbmRZLzB0MHpiVHlkSzZaOXJEbkRnelNNWXdXaE1saVJN?=
 =?utf-8?B?VDdrOEcwOXMwdjJ1ZXdvTkcwVjJZV05tVTlSTGowejN4cWZhNzNJaE1CdDZV?=
 =?utf-8?B?b05iMWJ0OG5HdE1LbFpjNGxqbWtwZmRZQjhVVWVndWRUUkNHb3hsMlFYeXFs?=
 =?utf-8?B?UU9QVVp6aU5aeDFqKzU4a3pVcnhTZlJuM201eGc0b1JXSXM3ZGliK2dPYWpx?=
 =?utf-8?B?M0lIZWd4b3RvWHJBN3BGK1BjdW9YUU13OU1yYlRHak51SlJlVXNlOEMzU3BF?=
 =?utf-8?B?b2JycU1yUDZrenZPbVlXWDBRWXV4c2hxT1k0UWdNNVY5ZDdJOTRtRlNLVWtx?=
 =?utf-8?B?QzRpZFZnLzg1R2FCcm1VMUFCOWpDU0JhMnFtZmtTdFhvbXZHOHFjNk5FNGJY?=
 =?utf-8?B?eU5Xay9vNjMrdDR5WkEzQU9uRmVNRXkvWURxQXFRSkJaTkZ2ejdZNGpxWGIz?=
 =?utf-8?B?ekxvYnhpUXRyN1gzYVpjb1F3RmRaRVlOaEExYlZJOUw0Q0cvWE11RzV2aDNW?=
 =?utf-8?B?L0ZSRjd3cUk1RngwUWMwSGFMUk03Yy92WjQ3ZURDV1RLWDY0MldTWXJ4K1py?=
 =?utf-8?B?VDh2cHhaMzczUkNSNElDSDNjdXlFelMrdWhTZXEyQ0o4cHRQWnhEWHRtQUMr?=
 =?utf-8?B?WHdLLzNCbFdGa08xTWpXS2wwTG1mN3B4MUdRSThvUUJtczRMZjdNek5HTTF1?=
 =?utf-8?B?dGkxcVkwNkYwbWNHQmVpWjBFa3hQYUdLZ0RRbkJ6cFQrVDRKWU9pUTA0WHZC?=
 =?utf-8?B?ZWlFdlZBcXR4SFUxVUFSMDF0N3VvRUhMUkQwN0g1cHQ0RnZpd1N5d3FXNXlF?=
 =?utf-8?B?SWF0UmUwS3AzeGI2K2RzT3NVRldpQldOcU1tZlp3QXZhM0JKYTRxcks5NEc2?=
 =?utf-8?B?OEZuc2NQQUI5ZlBRRVJrei9iN0NCZ2podDRnMURVNHMzNmdaSFR6V2hMdVBD?=
 =?utf-8?B?SVpoQ2pmbmEzS1lCb05reXM0eVNISXNHdUl5Q2t0ejBBZWd6Q0hqeFo3c051?=
 =?utf-8?B?NlVlcHlXaEJFNEk1bXJZdHBiQnUwUXhQUWtrZDY1WWVWMURocGpDWURDSktz?=
 =?utf-8?B?VjhIN0ZsUVFSVkVIbGRJUkxzQzhaQjZMWlZRUWpmM2JJQmkxb1JwVk5oQStZ?=
 =?utf-8?B?OGNEeC82bmp1OUhNZW1UelQyMFJvc3RwU0pDNGQrNUVYUE9xdXZmVFBCSWh2?=
 =?utf-8?B?QmJDQUtyN21RWWJTTWMyTzNkTE5JTUYwRlEzeTlSWjJIZTJVMkdDaXJMTDdN?=
 =?utf-8?B?UXlROUVJSUJkaEd2OWdPSDVEMUdtVUhMUHJDSFRWR2NWUWF3cU95dW5COGU5?=
 =?utf-8?B?R2Y0Q1Z6TU1JYzFoL1BsYlpPUHQrQkdTTGZYZU5qMWd1UHBUeU55UHZHU1lW?=
 =?utf-8?B?TW14V2ZITTQ4R2ZmV05qUlVLZm5FM1pqNktJQUZ3Z0QvUXRIaHgvVzRscHEy?=
 =?utf-8?B?ZCtaMzJudmNqdlRra0RlRHJqYkJOYnkvaVFrN08rRjVnTTFaLzBGd2NPdDZO?=
 =?utf-8?B?RzFvZVdmRFN0Vm1kVDAybVNiYnR0TjVrUWN0SUw4UmlTc1IvaFRnV1h4Y2NY?=
 =?utf-8?B?T096RXF3T3FoL1NuT0lrNG1BUURCRVprVnlaNlIxL2h6Y2NaVm1seGR3SnJv?=
 =?utf-8?B?RHRMQU9JVDY3eGVHSXVkY3lCUGRTODN4bDZEMkpBL0liSjlacGZhQmFFKzh2?=
 =?utf-8?Q?CyhJAewvhSX+C5Fdp7P6gwZRoFeV5sXUaDaKQ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: HiUws6i9tBpQx0cFW+8U7YyU0OFnTR8vFhZO+JkFXPs1B4h7fgzPGO6exLKBdDwbu47MyLpO3mX6+XJsNwylLD9/kNFky3LQnxwfqK1Albawz05gUtZUHCnZUl6+aJhlTNBZs+2zlxFTrwA/5fKwQAZ+4gQjmOCDmLPReup5GJvcFEpcgo6iItRgLfN8Fhp2K1fVX17+nPmRiO5Pl+bOcl4C5n4c0K2CfQjcTxk4cJaTHf6BC5TzvfvFQimFEAkwPj4VFVa5ILDthiijWHa+dAayifzXkvOxjQbnFd7jfCziUiOsV1/s/NlXJIesLRJGKZ1xb2UPVGQtkoHcuecrFg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8022.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fce4028d-c8f1-45c7-df52-08de8c07206f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2026 13:45:36.9480
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qqAjKcI1G0LB3uSIPwN5lL8K5LoiOs+X85TahZ7ySe3uo9jz8fYxv4BIYt1E2oWa3UTDGlekpMF+HNUod+LanQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8118
X-OriginatorOrg: intel.com
X-Spamd-Result: default: False [0.94 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57250-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,ideasonboard.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,intel.com:email,SA3PR11MB8022.namprd11.prod.outlook.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arun.t@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: DC546345A53
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgRGFuIGFuZCBTYWthcmksDQoNCg0KVGhhbmtzIGZvciB0aGUgZGV0YWlsZWQgcmV2aWV3Lg0K
DQpJIGhhdmUgaW5jb3Jwb3JhdGVkIHlvdXIgc3VnZ2VzdGlvbnMgaW4gdjU6DQoNCi0gbGltaXRl
ZCBzZW5zb3Igc3VwcGx5IG1hcHBpbmdzIHRvIGR2ZGQvYXZkZC9kb3ZkZA0KLSBSZW1vdmVkIGFs
d2F5c19vbiBmcm9tIG5vbi1WU0lPIHJhaWxzDQotIFJlbmFtZWQgYW5kIHNpbXBsaWZpZWQgR1BJ
TyBsb29rdXAgdGFibGUsIGtlZXBpbmcgb25seSByZXNldA0KLSBSZW1vdmVkIHVuc3VwcG9ydGVk
IHNfaWRsZS9zX2VuYWJsZSBlbnRyaWVzDQoNCkkgcG9zdGVkIGZpeGVzIGluIHY1IHBhdGNoIHNl
cmllcy4NCg0KLQ0KUmVnYXJkcywNCkFydW4gVA0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KRnJvbTogRGFuIFNjYWxseSA8ZGFuLnNjYWxseUBpZGVhc29uYm9hcmQuY29tPiANClNlbnQ6
IDI1IE1hcmNoIDIwMjYgMDM6MzkgUE0NClRvOiBULCBBcnVuIDxhcnVuLnRAaW50ZWwuY29tPjsg
am9oYW5uZXMuZ29lZGVAb3NzLnF1YWxjb21tLmNvbQ0KQ2M6IHNha2FyaS5haWx1c0BsaW51eC5p
bnRlbC5jb207IEthbywgQXJlYyA8YXJlYy5rYW9AaW50ZWwuY29tPjsgaWxwby5qYXJ2aW5lbkBs
aW51eC5pbnRlbC5jb207IHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnOyBsaW51
eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IERq
YWl0LCBNZWhkaSA8bWVoZGkuZGphaXRAaW50ZWwuY29tPg0KU3ViamVjdDogUmU6IFtQQVRDSCB2
NCAxLzJdIHBsYXRmb3JtL3g4NjogaW50MzQ3MjogQWRkIFRQUzY4NDcwIGJvYXJkIGRhdGEgZm9y
IEludGVsIG52bA0KDQpIaSBBcnVuIC0gc29ycnkgZm9yIHRoZSBkZWxheSBsb29raW5nIGF0IHRo
ZXNlIGZvciB5b3UNCg0KT24gMDYvMDMvMjAyNiAxNjozMCwgQXJ1biBUIHdyb3RlOg0KPiBUaGUg
SW50ZWwgTlZMIHBsYXRmb3JtIHVzZXMgSVBVOCBpcyBwb3dlcmVkIGJ5IGEgVFBTNjg0NzAgDQo+
IFBNSUMscmVxdWlyaW5nIGJvYXJkIGRhdGEgdG8gY29uZmlndXJlIHRoZSBHUElPcyBhbmQgcmVn
dWxhdG9ycyBmb3IgcHJvcGVyIGNhbWVyYSBzZW5zb3Igb3BlcmF0aW9uLg0KPiANCj4gU2lnbmVk
LW9mZi1ieTogQXJ1biBUIDxhcnVuLnRAaW50ZWwuY29tPg0KPiAtLS0NCj4gICAuLi4veDg2L2lu
dGVsL2ludDM0NzIvdHBzNjg0NzBfYm9hcmRfZGF0YS5jICAgfCAxNTAgKysrKysrKysrKysrKysr
KysrDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDE1MCBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9wbGF0Zm9ybS94ODYvaW50ZWwvaW50MzQ3Mi90cHM2ODQ3MF9ib2FyZF9k
YXRhLmMgDQo+IGIvZHJpdmVycy9wbGF0Zm9ybS94ODYvaW50ZWwvaW50MzQ3Mi90cHM2ODQ3MF9i
b2FyZF9kYXRhLmMNCj4gaW5kZXggNzEzNTdhMDM2MjkyLi44YWU1ZTAxZjY2NjAgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvcGxhdGZvcm0veDg2L2ludGVsL2ludDM0NzIvdHBzNjg0NzBfYm9hcmRf
ZGF0YS5jDQo+ICsrKyBiL2RyaXZlcnMvcGxhdGZvcm0veDg2L2ludGVsL2ludDM0NzIvdHBzNjg0
NzBfYm9hcmRfZGF0YS5jDQo+IEBAIC0xNDMsNiArMTQzLDM0IEBAIHN0YXRpYyBzdHJ1Y3QgcmVn
dWxhdG9yX2NvbnN1bWVyX3N1cHBseSBpbnQzNDc5X2F1eDJfY29uc3VtZXJfc3VwcGxpZXNbXSA9
IHsNCj4gICAJUkVHVUxBVE9SX1NVUFBMWSgiZG92ZGQiLCAiaTJjLUlOVDM0Nzk6MDAiKSwNCj4g
ICB9Ow0KPiAgIA0KPiArLyogU2V0dGluZ3MgZm9yIEludGVsIE5WTCBwbGF0Zm9ybSAqLw0KPiAr
DQo+ICtzdGF0aWMgc3RydWN0IHJlZ3VsYXRvcl9jb25zdW1lcl9zdXBwbHkgaW50MzQ3Ml9jb3Jl
X2NvbnN1bWVyX3N1cHBsaWVzW10gPSB7DQo+ICsJUkVHVUxBVE9SX1NVUFBMWSgiZHZkZCIsICJp
MmMtT1ZUSTEzQjE6MDEiKSwgfTsNCj4gKw0KPiArc3RhdGljIHN0cnVjdCByZWd1bGF0b3JfY29u
c3VtZXJfc3VwcGx5IGludDM0NzJfYW5hX2NvbnN1bWVyX3N1cHBsaWVzW10gPSB7DQo+ICsJUkVH
VUxBVE9SX1NVUFBMWSgiYXZkZCIsICJpMmMtT1ZUSTEzQjE6MDEiKSwgfTsNCj4gKw0KPiArc3Rh
dGljIHN0cnVjdCByZWd1bGF0b3JfY29uc3VtZXJfc3VwcGx5IGludDM0NzJfdmNtX2NvbnN1bWVy
X3N1cHBsaWVzW10gPSB7DQo+ICsJUkVHVUxBVE9SX1NVUFBMWSgidmRkIiwgImkyYy1PVlRJMTNC
MTowMSIpLCB9Ow0KPiArDQo+ICtzdGF0aWMgc3RydWN0IHJlZ3VsYXRvcl9jb25zdW1lcl9zdXBw
bHkgaW50MzQ3Ml92c2lvX2NvbnN1bWVyX3N1cHBsaWVzW10gPSB7DQo+ICsJUkVHVUxBVE9SX1NV
UFBMWSgiZG92ZGQiLCAiaTJjLU9WVEkxM0IxOjAxIiksDQo+ICsJUkVHVUxBVE9SX1NVUFBMWSgi
dnNpbyIsICJpMmMtT1ZUSTEzQjE6MDEiKSwNCj4gKwlSRUdVTEFUT1JfU1VQUExZKCJ2ZGRkIiwg
ImkyYy1PVlRJMTNCMTowMSIpLCB9Ow0KPiArDQo+ICtzdGF0aWMgc3RydWN0IHJlZ3VsYXRvcl9j
b25zdW1lcl9zdXBwbHkgaW50MzQ3Ml9hdXgxX2NvbnN1bWVyX3N1cHBsaWVzW10gPSB7DQo+ICsJ
UkVHVUxBVE9SX1NVUFBMWSgidmRkYSIsICJpMmMtT1ZUSTEzQjE6MDEiKSwgfTsNCj4gKw0KPiAr
c3RhdGljIHN0cnVjdCByZWd1bGF0b3JfY29uc3VtZXJfc3VwcGx5IGludDM0NzJfYXV4Ml9jb25z
dW1lcl9zdXBwbGllc1tdID0gew0KPiArCVJFR1VMQVRPUl9TVVBQTFkoInZkZGRvIiwgImkyYy1P
VlRJMTNCMTowMSIpLCB9Ow0KDQpUaGVzZSBzZXR0aW5ncyB3aWxsIGFzc2lnbiBhbGwgNiByZWd1
bGF0b3JzIHRvIHRoZSBpMmMtT1ZUSTEzQjE6MDEgZGV2aWNlLCBpbiB0aGUgdnNpbyBjYXNlIHdp
dGggMyBkaWZmZXJlbnQgbmFtZXMuIFRoZSBwYXRjaCBmb3IgdGhlIHNlbnNvciBkcml2ZXIgaXRz
ZWxmIGlzIG9ubHkgbG9va2luZyBmb3IgZG92ZGQsIGF2ZGQgYW5kIGR2ZGQgLSBzb21ldGhpbmcg
aXMgbm90IHF1aXRlIHJpZ2h0IGhlcmUuDQoNCj4gKw0KPiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
cmVndWxhdG9yX2luaXRfZGF0YSBkZWxsXzcyMTJfdHBzNjg0NzBfY29yZV9yZWdfaW5pdF9kYXRh
ID0gew0KPiAgIAkuY29uc3RyYWludHMgPSB7DQo+ICAgCQkubWluX3VWID0gMTIwMDAwMCwNCj4g
QEAgLTIyMCw2ICsyNDgsODIgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCByZWd1bGF0b3JfaW5pdF9k
YXRhIGRlbGxfNzIxMl90cHM2ODQ3MF9hdXgyX3JlZ19pbml0X2RhdGEgPQ0KPiAgIAkuY29uc3Vt
ZXJfc3VwcGxpZXMgPSBpbnQzNDc5X2F1eDJfY29uc3VtZXJfc3VwcGxpZXMsDQo+ICAgfTsNCj4g
ICANCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgcmVndWxhdG9yX2luaXRfZGF0YSBpbnRlbF9udmxf
dHBzNjg0NzBfY29yZV9yZWdfaW5pdF9kYXRhID0gew0KPiArCS5jb25zdHJhaW50cyA9IHsNCj4g
KwkJLm1pbl91ViA9IDEyMDAwMDAsDQo+ICsJCS5tYXhfdVYgPSAxMjAwMDAwLA0KPiArCQkuYXBw
bHlfdVYgPSB0cnVlLA0KPiArCQkuYWx3YXlzX29uID0gdHJ1ZSwNCg0KSSB3b3VsZCBub3QgZXhw
ZWN0IHRoZSByZWd1bGF0b3JzIHRvIG5lZWQgdG8gYmUgYWx3YXlzX29uIC0gd2l0aCB0aGUgZXhj
ZXB0aW9uIG9mIHRoZSBWU0lPIG9uZSB3aGljaCBpcyBhIGJpdCBzcGVjaWFsLg0KDQo+ICsJfSwN
Cj4gKwkubnVtX2NvbnN1bWVyX3N1cHBsaWVzID0gQVJSQVlfU0laRShpbnQzNDcyX2NvcmVfY29u
c3VtZXJfc3VwcGxpZXMpLA0KPiArCS5jb25zdW1lcl9zdXBwbGllcyA9IGludDM0NzJfY29yZV9j
b25zdW1lcl9zdXBwbGllcywgfTsNCj4gKw0KPiArc3RhdGljIGNvbnN0IHN0cnVjdCByZWd1bGF0
b3JfaW5pdF9kYXRhIGludGVsX252bF90cHM2ODQ3MF9hbmFfcmVnX2luaXRfZGF0YSA9IHsNCj4g
KwkuY29uc3RyYWludHMgPSB7DQo+ICsJCS5taW5fdVYgPSAyODE1MjAwLA0KPiArCQkubWF4X3VW
ID0gMjgxNTIwMCwNCj4gKwkJLmFwcGx5X3VWID0gdHJ1ZSwNCj4gKwkJLmFsd2F5c19vbiA9IHRy
dWUsDQo+ICsJfSwNCj4gKwkubnVtX2NvbnN1bWVyX3N1cHBsaWVzID0gQVJSQVlfU0laRShpbnQz
NDcyX2FuYV9jb25zdW1lcl9zdXBwbGllcyksDQo+ICsJLmNvbnN1bWVyX3N1cHBsaWVzID0gaW50
MzQ3Ml9hbmFfY29uc3VtZXJfc3VwcGxpZXMsIH07DQo+ICsNCj4gK3N0YXRpYyBjb25zdCBzdHJ1
Y3QgcmVndWxhdG9yX2luaXRfZGF0YSBpbnRlbF9udmxfdHBzNjg0NzBfdmNtX3JlZ19pbml0X2Rh
dGEgPSB7DQo+ICsJLmNvbnN0cmFpbnRzID0gew0KPiArCQkubWluX3VWID0gMjgxNTIwMCwNCj4g
KwkJLm1heF91ViA9IDI4MTUyMDAsDQo+ICsJCS5hcHBseV91ViA9IHRydWUsDQo+ICsJCS5hbHdh
eXNfb24gPSB0cnVlLA0KPiArCX0sDQo+ICsJLm51bV9jb25zdW1lcl9zdXBwbGllcyA9IEFSUkFZ
X1NJWkUoaW50MzQ3Ml92Y21fY29uc3VtZXJfc3VwcGxpZXMpLA0KPiArCS5jb25zdW1lcl9zdXBw
bGllcyA9IGludDM0NzJfdmNtX2NvbnN1bWVyX3N1cHBsaWVzLCB9Ow0KPiArDQo+ICsvKiBFbnN1
cmUgdGhlIGFsd2F5cy1vbiBWSU8gcmVndWxhdG9yIGhhcyB0aGUgc2FtZSB2b2x0YWdlIGFzIFZT
SU8gKi8gDQo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHJlZ3VsYXRvcl9pbml0X2RhdGEgaW50ZWxf
bnZsX3RwczY4NDcwX3Zpb19yZWdfaW5pdF9kYXRhID0gew0KPiArCS5jb25zdHJhaW50cyA9IHsN
Cj4gKwkJLm1pbl91ViA9IDE4MDA2MDAsDQo+ICsJCS5tYXhfdVYgPSAxODAwNjAwLA0KPiArCQku
YXBwbHlfdVYgPSB0cnVlLA0KPiArCQkuYWx3YXlzX29uID0gdHJ1ZSwNCj4gKwl9LA0KPiArfTsN
Cj4gKw0KPiArc3RhdGljIGNvbnN0IHN0cnVjdCByZWd1bGF0b3JfaW5pdF9kYXRhIGludGVsX252
bF90cHM2ODQ3MF92c2lvX3JlZ19pbml0X2RhdGEgPSB7DQo+ICsJLmNvbnN0cmFpbnRzID0gew0K
PiArCQkubWluX3VWID0gMTgwMDYwMCwNCj4gKwkJLm1heF91ViA9IDE4MDA2MDAsDQo+ICsJCS5h
cHBseV91ViA9IHRydWUsDQo+ICsJCS5hbHdheXNfb24gPSB0cnVlLA0KPiArCX0sDQo+ICsJLm51
bV9jb25zdW1lcl9zdXBwbGllcyA9IEFSUkFZX1NJWkUoaW50MzQ3Ml92c2lvX2NvbnN1bWVyX3N1
cHBsaWVzKSwNCj4gKwkuY29uc3VtZXJfc3VwcGxpZXMgPSBpbnQzNDcyX3ZzaW9fY29uc3VtZXJf
c3VwcGxpZXMsIH07DQo+ICsNCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgcmVndWxhdG9yX2luaXRf
ZGF0YSBpbnRlbF9udmxfdHBzNjg0NzBfYXV4MV9yZWdfaW5pdF9kYXRhID0gew0KPiArCS5jb25z
dHJhaW50cyA9IHsNCj4gKwkJLm1pbl91ViA9IDI4MTUyMDAsDQo+ICsJCS5tYXhfdVYgPSAyODE1
MjAwLA0KPiArCQkuYXBwbHlfdVYgPSAxLA0KPiArCQkudmFsaWRfb3BzX21hc2sgPSBSRUdVTEFU
T1JfQ0hBTkdFX1NUQVRVUywNCj4gKwl9LA0KPiArCS5udW1fY29uc3VtZXJfc3VwcGxpZXMgPSBB
UlJBWV9TSVpFKGludDM0NzJfYXV4MV9jb25zdW1lcl9zdXBwbGllcyksDQo+ICsJLmNvbnN1bWVy
X3N1cHBsaWVzID0gaW50MzQ3Ml9hdXgxX2NvbnN1bWVyX3N1cHBsaWVzLCB9Ow0KPiArDQo+ICtz
dGF0aWMgY29uc3Qgc3RydWN0IHJlZ3VsYXRvcl9pbml0X2RhdGEgaW50ZWxfbnZsX3RwczY4NDcw
X2F1eDJfcmVnX2luaXRfZGF0YSA9IHsNCj4gKwkuY29uc3RyYWludHMgPSB7DQo+ICsJCS5taW5f
dVYgPSAxODAwNjAwLA0KPiArCQkubWF4X3VWID0gMTgwMDYwMCwNCj4gKwkJLmFwcGx5X3VWID0g
MSwNCj4gKwkJLnZhbGlkX29wc19tYXNrID0gUkVHVUxBVE9SX0NIQU5HRV9TVEFUVVMsDQo+ICsJ
fSwNCj4gKwkubnVtX2NvbnN1bWVyX3N1cHBsaWVzID0gQVJSQVlfU0laRShpbnQzNDcyX2F1eDJf
Y29uc3VtZXJfc3VwcGxpZXMpLA0KPiArCS5jb25zdW1lcl9zdXBwbGllcyA9IGludDM0NzJfYXV4
Ml9jb25zdW1lcl9zdXBwbGllcywgfTsNCj4gKw0KPiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgdHBz
Njg0NzBfcmVndWxhdG9yX3BsYXRmb3JtX2RhdGEgZGVsbF83MjEyX3RwczY4NDcwX3BkYXRhID0g
ew0KPiAgIAkucmVnX2luaXRfZGF0YSA9IHsNCj4gICAJCVtUUFM2ODQ3MF9DT1JFXSA9ICZkZWxs
XzcyMTJfdHBzNjg0NzBfY29yZV9yZWdfaW5pdF9kYXRhLA0KPiBAQCAtMjMyLDYgKzMzNiwxOCBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IHRwczY4NDcwX3JlZ3VsYXRvcl9wbGF0Zm9ybV9kYXRhIGRl
bGxfNzIxMl90cHM2ODQ3MF9wZGF0YSA9DQo+ICAgCX0sDQo+ICAgfTsNCj4gICANCj4gK3N0YXRp
YyBjb25zdCBzdHJ1Y3QgdHBzNjg0NzBfcmVndWxhdG9yX3BsYXRmb3JtX2RhdGEgaW50ZWxfbnZs
X3RwczY4NDcwX3BkYXRhID0gew0KPiArCS5yZWdfaW5pdF9kYXRhID0gew0KPiArCQlbVFBTNjg0
NzBfQ09SRV0gPSAmaW50ZWxfbnZsX3RwczY4NDcwX2NvcmVfcmVnX2luaXRfZGF0YSwNCj4gKwkJ
W1RQUzY4NDcwX0FOQV0gID0gJmludGVsX252bF90cHM2ODQ3MF9hbmFfcmVnX2luaXRfZGF0YSwN
Cj4gKwkJW1RQUzY4NDcwX1ZDTV0gID0gJmludGVsX252bF90cHM2ODQ3MF92Y21fcmVnX2luaXRf
ZGF0YSwNCj4gKwkJW1RQUzY4NDcwX1ZJT10gPSAmaW50ZWxfbnZsX3RwczY4NDcwX3Zpb19yZWdf
aW5pdF9kYXRhLA0KPiArCQlbVFBTNjg0NzBfVlNJT10gPSAmaW50ZWxfbnZsX3RwczY4NDcwX3Zz
aW9fcmVnX2luaXRfZGF0YSwNCj4gKwkJW1RQUzY4NDcwX0FVWDFdID0gJmludGVsX252bF90cHM2
ODQ3MF9hdXgxX3JlZ19pbml0X2RhdGEsDQo+ICsJCVtUUFM2ODQ3MF9BVVgyXSA9ICZpbnRlbF9u
dmxfdHBzNjg0NzBfYXV4Ml9yZWdfaW5pdF9kYXRhLA0KPiArCX0sDQo+ICt9Ow0KPiArDQo+ICAg
c3RhdGljIHN0cnVjdCBncGlvZF9sb29rdXBfdGFibGUgc3VyZmFjZV9nb19pbnQzNDdhX2dwaW9z
ID0gew0KPiAgIAkuZGV2X2lkID0gImkyYy1JTlQzNDdBOjAwIiwNCj4gICAJLnRhYmxlID0gew0K
PiBAQCAtMjU4LDYgKzM3NCwyMyBAQCBzdGF0aWMgc3RydWN0IGdwaW9kX2xvb2t1cF90YWJsZSBk
ZWxsXzcyMTJfaW50MzQ3OV9ncGlvcyA9IHsNCj4gICAJfQ0KPiAgIH07DQo+ICAgDQo+ICtzdGF0
aWMgc3RydWN0IGdwaW9kX2xvb2t1cF90YWJsZSBpbnRlbF9udmxfaW50MzQ3YV9ncGlvcyA9IHsN
Cg0KSSB3b3VsZCBjYWxsIGl0ICJpbnRlbF9udmxfb3Z0aTEzYjFfZ3Bpb3MiIHRvIG1hdGNoIHRo
ZSBfSElELg0KDQo+ICsJLmRldl9pZCA9ICJpMmMtT1ZUSTEzQjE6MDEiLA0KPiArCS50YWJsZSA9
IHsNCj4gKwkJR1BJT19MT09LVVAoInRwczY4NDcwLWdwaW8iLCA5LCAicmVzZXQiLCBHUElPX0FD
VElWRV9MT1cpLA0KPiArCQlHUElPX0xPT0tVUCgidHBzNjg0NzAtZ3BpbyIsIDgsICJzX2lkbGUi
LCBHUElPX0FDVElWRV9MT1cpLA0KDQpBbHRob3VnaCB0aGUgc2Vuc29yIGRyaXZlciBkb2VzIGxv
b2sgZm9yIGEgcmVzZXQgR1BJTywgaXQgZG9lc24ndCBjdXJyZW50bHkgdHJ5IHRvIGhhbmRsZSBv
bmUgY2FsbGVkIHNfaWRsZSwgbm9yIGRvZXMgcGF0Y2ggMiBhZGQgdGhhdC4uLnNvIHRoYXQgZW50
cnkgbWlnaHQgYmUgdW5uZWNlc3NhcnkgdG9vLg0KPiArCQl7IH0NCj4gKwl9DQo+ICt9Ow0KPiAr
DQo+ICtzdGF0aWMgc3RydWN0IGdwaW9kX2xvb2t1cF90YWJsZSBpbnRlbF9udmxfaW50MzQ3ZV9n
cGlvcyA9IHsNCj4gKwkuZGV2X2lkID0gImkyYy1PVlRJMTNCMTowMSIsDQo+ICsJLnRhYmxlID0g
ew0KPiArCUdQSU9fTE9PS1VQKCJ0cHM2ODQ3MC1ncGlvIiwgNywgInNfZW5hYmxlIiwgR1BJT19B
Q1RJVkVfTE9XKSwNCj4gKwkJeyB9DQo+ICsJfQ0KPiArfTsNCg0KVGhlIGRldl9pZCBpcyB0aGUg
c2FtZSBoZXJlOyB5b3Ugc2hvdWxkbid0IG5lZWQgYSBzZWNvbmQgbG9va3VwIHRhYmxlIGZvciB0
aGUgc2FtZSBkZXZpY2UsIGFuZCBzX2VuYWJsZSBpc24ndCBoYW5kbGVkIGJ5IHRoZSBzZW5zb3Ig
ZHJpdmVyLg0KDQpUaGFua3MNCkRhbg0KDQo+ICsNCj4gICBzdGF0aWMgY29uc3Qgc3RydWN0IGlu
dDM0NzJfdHBzNjg0NzBfYm9hcmRfZGF0YSBzdXJmYWNlX2dvX3RwczY4NDcwX2JvYXJkX2RhdGEg
PSB7DQo+ICAgCS5kZXZfbmFtZSA9ICJpMmMtSU5UMzQ3MjowNSIsDQo+ICAgCS50cHM2ODQ3MF9y
ZWd1bGF0b3JfcGRhdGEgPSAmc3VyZmFjZV9nb190cHM2ODQ3MF9wZGF0YSwgQEAgLTI4Nyw2IA0K
PiArNDIwLDE2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaW50MzQ3Ml90cHM2ODQ3MF9ib2FyZF9k
YXRhIGRlbGxfNzIxMl90cHM2ODQ3MF9ib2FyZF9kYXRhID0NCj4gICAJfSwNCj4gICB9Ow0KPiAg
IA0KPiArc3RhdGljIGNvbnN0IHN0cnVjdCBpbnQzNDcyX3RwczY4NDcwX2JvYXJkX2RhdGEgaW50
ZWxfbnZsX3RwczY4NDcwX2JvYXJkX2RhdGEgPSB7DQo+ICsJLmRldl9uYW1lID0gImkyYy1JTlQz
NDcyOjA0IiwNCj4gKwkudHBzNjg0NzBfcmVndWxhdG9yX3BkYXRhID0gJmludGVsX252bF90cHM2
ODQ3MF9wZGF0YSwNCj4gKwkubl9ncGlvZF9sb29rdXBzID0gMiwNCj4gKwkudHBzNjg0NzBfZ3Bp
b19sb29rdXBfdGFibGVzID0gew0KPiArCQkmaW50ZWxfbnZsX2ludDM0N2FfZ3Bpb3MsDQo+ICsJ
CSZpbnRlbF9udmxfaW50MzQ3ZV9ncGlvcywNCj4gKwl9LA0KPiArfTsNCj4gKw0KPiAgIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgZG1pX3N5c3RlbV9pZCBpbnQzNDcyX3RwczY4NDcwX2JvYXJkX2RhdGFf
dGFibGVbXSA9IHsNCj4gICAJew0KPiAgIAkJLm1hdGNoZXMgPSB7DQo+IEBAIC0zMTYsNiArNDU5
LDEzIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZG1pX3N5c3RlbV9pZCBpbnQzNDcyX3RwczY4NDcw
X2JvYXJkX2RhdGFfdGFibGVbXSA9IHsNCj4gICAJCX0sDQo+ICAgCQkuZHJpdmVyX2RhdGEgPSAo
dm9pZCAqKSZkZWxsXzcyMTJfdHBzNjg0NzBfYm9hcmRfZGF0YSwNCj4gICAJfSwNCj4gKwl7DQo+
ICsJCS5tYXRjaGVzID0gew0KPiArCQkJRE1JX0VYQUNUX01BVENIKERNSV9TWVNfVkVORE9SLCAi
SW50ZWwgQ29ycG9yYXRpb24iKSwNCj4gKwkJCURNSV9FWEFDVF9NQVRDSChETUlfUFJPRFVDVF9O
QU1FLCAiTm92YSBMYWtlIENsaWVudCBQbGF0Zm9ybSIpLA0KPiArCQl9LA0KPiArCSAgICAgICAu
ZHJpdmVyX2RhdGEgPSAodm9pZCAqKSZpbnRlbF9udmxfdHBzNjg0NzBfYm9hcmRfZGF0YSwNCj4g
Kwl9LA0KPiAgIAl7IH0NCj4gICB9Ow0KPiAgIA0KDQo=

