Return-Path: <linux-media+bounces-55954-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2OfnG61EuGmLbAEAu9opvQ
	(envelope-from <linux-media+bounces-55954-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 18:58:05 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B87B29EA8E
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 18:58:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D7D8B30398D9
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 17:57:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7EF633D4F5;
	Mon, 16 Mar 2026 17:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hUZtxxqm"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D661133B96F;
	Mon, 16 Mar 2026 17:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773683841; cv=fail; b=XsFV+lSer9HdtV54TkzzvtkmDKmpHreQkgh1JqqAw5XuRJmpqPdSRheOUFFtzOOKCP9h2PusKJsnqeDc8XZpIXig83TURFFxI29w3WfMx8Aue9piMMNQHFjGHwQYu8kv8Hz1rHVAjCYi0rjrNzkeXfD2Fsis/vaVwHrlv9Z9hfo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773683841; c=relaxed/simple;
	bh=r4U55ceP71v4TQYmn7aKGupU+4tmGytlMyF9H/kIPr4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pST3ewl4Qt8NgAyUMwFC4t0tYDLs7/pW7IFj4Lzvkbm4JyNl7gx7MXLRvttf8nUaQ+ajUP335Qh2poy5F381k07eyMNCECoUU+e1GdhQDn76WgIBwAUCo2hF6a6I5lRD3V/u2LR61x4OHDKX/NAdmUwutwCvSeICG9YGsr+sYPI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hUZtxxqm; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773683840; x=1805219840;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=r4U55ceP71v4TQYmn7aKGupU+4tmGytlMyF9H/kIPr4=;
  b=hUZtxxqm+jwLV6bBUgbthtuZ3waPGTiThez5F41csDdXw0pEr3f77HmM
   r+MhAFppywM3uK9f2g4XfYAAVpSG6KEXUsqKcNMDXnu1pum32z9NLZB8I
   5/TvJh0OzzbkB5nyhpIqhoO0ooAi9ucnpbsRoUnmpR+uO9uz+S8rxdbu4
   DfmbV7Tv3GEh+MWB7cTROgAPSiuzjkxfSHJS4B932juelTTLluuhPh7v3
   vg3jt4u9cCWcVh4q4/X6RwGFBHCIFW5GuMl7LQsQbHbaipMFuyIVwJ6ZZ
   Q6tGQjDUikgJfDLDCDRIe9rgypLxmNlRN0TGZGS33MJtMKlzcMRST+nTI
   Q==;
X-CSE-ConnectionGUID: 1xfAmU1QRPeDghUFOIInEQ==
X-CSE-MsgGUID: gyMpY2heRYur9w00KtyKCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="74414688"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="74414688"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 10:57:19 -0700
X-CSE-ConnectionGUID: 6OirLsRCQx2pcEQK8R6UmQ==
X-CSE-MsgGUID: DVUiSuRRTZKv5reonTAvmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="259888139"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 10:57:19 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 16 Mar 2026 10:57:18 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 16 Mar 2026 10:57:18 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.67) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 16 Mar 2026 10:57:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oSjI7Iv3f6mOChESp8oPVrgDftGXkIwkPbYf2jS/uX+XOzfIDly2NznSPj8B/crDFNyatZsGXm4TwGw1UhJb/PwhCU1cfA7u3R8SzYm7NHzPOHOu+fALBa92gZWrMa/120K5WK7jgKYJvlILyWt93t2M6mA9l0Mb1APLGfbpwm9cK6T2Uaq0orpa2m7vvfkiyAwIEorJJlicuuS9vq74/xzn7bQLXEtiMZVJT/rNU/uooPibpqNJiex1TN08fdR1v3NjHvyUJ4nRD41yqoVLgWQykRSYQeGQzWVD2hE0QrPcCgZYdtD4Hi8I1ycs8zINI8EdxCzM7mO51CGDi6fScw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r4U55ceP71v4TQYmn7aKGupU+4tmGytlMyF9H/kIPr4=;
 b=NIo7eU1zFCioHJhQunueS+A1GBttME5yCuVSQTKc/iVFDT8cYas0a1wQqbatYbM8AKPNObMikFyzSdmU+R50pPklzvWpj+Qp71ODUMoxEgRY2v5TX2Gc3PnjXToYihIt7qxjJYY//PorCPBp0ZUsDX1s2pGw1XcGy3/5/OBkfJHu0S9p/8MrffywJOCIGYPFaykbK9TGYnK5dzQyeHW5YqS7BvkKCaq/qCm5+FhcKJkyodVmjvWHkJBczc46L29K9WppVAlqOMbGjudANLgNkp/vf/AAmqWx1ghirtLjdFU2tKC0OcgsC8KUUQRms4FMiRV1d/6fS2EVbtmLGyZD7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB8022.namprd11.prod.outlook.com (2603:10b6:806:2fe::14)
 by SA1PR11MB7698.namprd11.prod.outlook.com (2603:10b6:806:332::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.7; Mon, 16 Mar
 2026 17:57:16 +0000
Received: from SA3PR11MB8022.namprd11.prod.outlook.com
 ([fe80::5bc2:3dd9:94f0:21ce]) by SA3PR11MB8022.namprd11.prod.outlook.com
 ([fe80::5bc2:3dd9:94f0:21ce%4]) with mapi id 15.20.9723.016; Mon, 16 Mar 2026
 17:57:15 +0000
From: "T, Arun" <arun.t@intel.com>
To: "johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>,
	Sakari Ailus <sakari.ailus@iki.fi>
CC: "mehdi.djait@linux.intel.com" <mehdi.djait@linux.intel.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 1/2] platform/x86: int3472: Add board data for Intel
 nvl
Thread-Topic: [PATCH v2 1/2] platform/x86: int3472: Add board data for Intel
 nvl
Thread-Index: AQHcp+7BHqgdzPW8iUCRjKvSDyBfA7WZwgkAgARgxgCAAxTp4IAADfcAgAlyGxCABtM/MA==
Date: Mon, 16 Mar 2026 17:57:15 +0000
Message-ID: <SA3PR11MB8022A59F50321D799E49BB2F9D40A@SA3PR11MB8022.namprd11.prod.outlook.com>
References: <20260130092431.2335363-2-arun.t@intel.com>
 <20260227133542.970820-1-arun.t@intel.com>
 <20260227133542.970820-2-arun.t@intel.com>
 <aaRPMtWnX7nWShmv@valkosipuli.retiisi.eu>
 <0f2502fb-20cd-4638-8428-9a9eb5318147@oss.qualcomm.com>
 <SA3PR11MB802248098C161FB7EFB7CB529D7AA@SA3PR11MB8022.namprd11.prod.outlook.com>
 <14f431a2-3c31-4f23-88dc-7e2d5c8da50d@oss.qualcomm.com>
 <SA3PR11MB802231C9F539F83E2B7CC75F9D44A@SA3PR11MB8022.namprd11.prod.outlook.com>
In-Reply-To: <SA3PR11MB802231C9F539F83E2B7CC75F9D44A@SA3PR11MB8022.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB8022:EE_|SA1PR11MB7698:EE_
x-ms-office365-filtering-correlation-id: 09280663-441c-4f36-9531-08de8385757e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|10070799003|1800799024|366016|38070700021|7053199007|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info: PIDYBdOZ27TIIf7zBm+h9xthjS7ko71u8sdaEZz297dL1McVBqhd/RioOaJRNI4Nk6YRCtjfnoiN+AicnoVahQK6pX1DWMfKkAU3QAVKtg6+4fM2dV5cN9RwKwP5qNdgzuCwkUjufWGZlTub8IE97kvTMWnhkrHKr6Wy5rvtjPVNuKjLU4V9Fz0sPCgJ7VB38C/heRVmkmGTicghap6UsPWRUdb3bDdmJDpj7rAcogzj6w24XSzI59dqjko6CZxZvPPxjg8WEXLDag9dWBbVepFFoeJUoyQ6OywSjdFeODaxig/h/RLegRM9sM/E69aoElBaCPIGsHxNaIoXcN2bE50yGQ8wF0GyQMr2WondfvNRJwokdRqRJPU6OlRlHS6LnzxyoSq5bC8jcf0cXoa5LjTh0FjGAP110a33yC0g3Hl2ypez8DpR5uOnOPKoTxb+aa4DkI/O2rssR+fc31zIhZNs0kjh6/MY+yDuIsfr5M5xpOu2rjZe8/YEdcvtPg1Vy3/h6fjP9HQQ1l0wZhjNQH5XzcXQR4JWHLOVfwtjJjQRJk6jPudjDS/SC3LeFhhmiT01ap2fe5nwo/+b3mGACXxWLLV/sllZKAHCECaTsWzm9eZ/dqGByEoAlPhpzeA0UFINfzUmPqEJBR5ltnDIbtiedxS2zESApmGpBVXL2/iZ/xeGy6NblaqyRAjonCmbW77qD6Jo5ssbZ8C+NO1qwW8o5LE3wwcKWMBmdH8w312i/K+G4RY94WYbICFQ9W1WbE3vdTv5JV9tKb+myy3LpvUtwnrcYhq0VZ5aUJwbYs8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR11MB8022.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016)(38070700021)(7053199007)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?KzNhS0dra0UwM2M3Z3lPZnp1UmpIczY5ZXBmN3l2MjFmcDg0M1NPVEhLZk1D?=
 =?utf-8?B?RmNiRmg0aVVZRUdrU3QzRWxaeU1STDlBd0J4dktjWW0wcUR4djlGS3hReWkw?=
 =?utf-8?B?cWhEWld5bmJrbU9CS3BjeWNoYlNhc3VvSW5OY3BPSU5tRmpyaGZSd2VCcElC?=
 =?utf-8?B?eUxQR09PaDJ6YlI5dm1wTFYrRGtNQTJpV24zNS95RFErVXBDSzdFM2s0L3FN?=
 =?utf-8?B?Y0NLcTRXMXIzS2ovVEcxY3hudHhoRk1GNkZxZi9VeXpSQzlnSGVvdE84N1RC?=
 =?utf-8?B?S002Y3dQNEFGdldza20vZW02eVF4RmY3NERUcld2V3ZIVHVxc1dDaENCRjQz?=
 =?utf-8?B?aHI1MWVHOWxmTzYwaGQ5alVsTE02a2NYdExvL0VjVVdhM2lJTkFIYXEraHpq?=
 =?utf-8?B?YmorZm5LQXJZRVJsa1BMU2E4ZWtqNUN3TU9KTzRrT3BWZGdXcWw2a0FRM1lr?=
 =?utf-8?B?THF1c0s4TXhXR2YwWWNYcE1qOEVoYktrV2xsMFZUNzN5bVNRbGRrcXo5UmZv?=
 =?utf-8?B?M1BYRWFRLzlnZUJBU2F1eDFSTWFJQ0VOM1lTUG40QUdBeTNWOWFvSGh3ZlRh?=
 =?utf-8?B?bkFiVVcrekMxNWFlbEtOWk9ha3hUMzBaZ0tGdEtidzh4RmJsWGxmRktkcTg1?=
 =?utf-8?B?dktEbkVjbEV1dWlGYjEvZ3ROb2FTbmVrRXk4aUcrRlp0cVFjczZQUDdaT2ly?=
 =?utf-8?B?c2NWRTgyNXZWQ0RNY2ppN2hEZ29jWWR4SUdZa0JSaHNNaDl4dTZ0WkgwaHQv?=
 =?utf-8?B?MHl6dStQN3JXa3cvQk1MVEhmY2w5NkwwdWpjWE9rNzhYeHkzQzdNNE9LZlN1?=
 =?utf-8?B?T3Z4VjZvTmI1UmpYZGhUUTMwTFFtMVUzeUNnajZGZXR3VlI4WjBVUUIrZTNj?=
 =?utf-8?B?QkR0WUord3B0YldQaFBjU3RTb0hvWWU4SFhUUGxJMWZXK3lnZXhIMFBlUnpB?=
 =?utf-8?B?WUFvWjNwdW1OUkkzVTNZRWZHUmtLdDErMHAwbDkwSFNRQmhXZnlkZWNKaHRU?=
 =?utf-8?B?K0RLNVdRdFdpRnEyNFVNUGdUdCtGNDRJWmVtZVpOQTA1eDJyN0xFRWhtQ01V?=
 =?utf-8?B?TWRwbms4UGUyajVlanNPalVjRzRwbGJvVm1YSmxqaGNtZEQ1U1ZucmE0ZXpB?=
 =?utf-8?B?VkpZR29IbVJ3WDgzYkoxcHlQakVpOWE3NmZKSlZxL0lCMlV0OFlRQitPVnV2?=
 =?utf-8?B?SzBmWXo3V2lJbHVPenZsTEljVW5heWkvWFY3RDJRRVpIbUNMY3J4eDZGUVh6?=
 =?utf-8?B?ejJ6UDFXODZiTEtDMXJ0Unh2cXZEd1R6RkI5ZlE2RlhXT3krMHh3ZUptNE1R?=
 =?utf-8?B?Vk14cVpndnZnUmMyMVp0Y2tQWVZUZVg3RlVyTkhUaTh3MG5JV1k5alovWWRp?=
 =?utf-8?B?eHA1RFFuVnlaVGQwQ1dLejcwSEM1UmN3Z1dwWkFLM0E0S0Ewb3FlNm5jQk13?=
 =?utf-8?B?aFJBMFdDV09EVXoveEs5djJjNElHQ1Q3cHFudXBtbS9HdWVFbGVzRE1hUjJr?=
 =?utf-8?B?UGhhL1RxT0ZlZ0QwV3VoQTZ3YUR6d0cycFpLaXdsUlhydVdsR01VaEU2dGU3?=
 =?utf-8?B?dGFnV1h5RUVqSnIwNnlBaE9FNWxhWklEV1dUUVc5ejdyNUpXRDZvd2tZUVQ0?=
 =?utf-8?B?Q29uSmkrUTdyaUFkc1FKY2YwYW5Hc2packo0Zk9Fekc1RSt6MVZJdFVUWHQ3?=
 =?utf-8?B?NnI3aVozQ3VXTnZ0eDF2WVJrak9hVGR5UGpNcTRORjZCVXltWTVqMHV4SHoz?=
 =?utf-8?B?QlYwbGYrcktveTA1MXdib3o0c01DM3FhSEJka2ZsTWV2STY2SDZWcHFRdHZR?=
 =?utf-8?B?UVhHZ2FsY0tqRDRFMGdpejlTOFRNQTlraUpCNXp1TUVwZXhzaG56eVJYOCtR?=
 =?utf-8?B?aGgwcWl4LzdwVWU5eVFMNjZ1TFJxclpFSmV1WUwyZlI1SlRrT0hydVoxYnpk?=
 =?utf-8?B?dDVXSHZ5VXMzYU5yU1RzSFdXWWlIdG1iYlBpS2hCMnRRd1JNTEdiU2ZvalVY?=
 =?utf-8?B?d2VZelBORnJLLy85Vms2N3RrVVNwaEgwUWRPb2hTUXBzNkR0RWg0c0RvcEtQ?=
 =?utf-8?B?OWxZN0JIc1U3UkxrVk40RTQ5eHlvRjFWSGFLTURxUHVCTmt0N2JSbVdkejhD?=
 =?utf-8?B?bWxPLzlpaG5yUGZ1VlMrWWd3NlN3NzBIM2dheVZYOVg4LzhJci9UTEpPOEJj?=
 =?utf-8?B?d2xYcWxUL2tNL1VNS0NyNU1PWm9pYlR2dDdqT3l6SHBZa1hmQ0NEUVRhZWVD?=
 =?utf-8?B?RGlPN1d3MG52ZmN1T3pQR0NhZG00N2VRWk44WHRMN0lwcllwZHRUVkR0Ylp2?=
 =?utf-8?B?QnJEaFk3V0JXZm5VbEFxQi9ycUxrVXp2VjVJbjFYR3k0eVFRVHlMT1k5R3N3?=
 =?utf-8?Q?DPAr39eApSVVgXqaLeUQ51SkkvholUH9l3meH?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: YZe8eoxBR8Wmbt5kC6xFVxY4DFfkDuHBolj2sx5acDxx1OsjuDUrtg2ZtYPDziDm3NYtDO4Rp2yai12N/J/mLaMNVWcbz40FvlVnYjQ/X4jsA/DYlXBgVSZHZti0RfFXdJAsuwzFPEb5XxzVOk86fZoxKVmTv5PoMpRVKX6PF6FUJgcr8NTOuylg1keb9GyrB6RfE8oHQNV4L/mVH8wHJaupfUvm4iXSLJTl7wch6JbjJAFlRVlfrvGXtY0dmFw6YPq92WV327WippzBsF8Dn785g+qKRwxALDQThaVhTY0NRBl/aJOoncTYfVggPkw9D6L3egb7GVGDBcAM90mwYw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8022.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09280663-441c-4f36-9531-08de8385757e
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2026 17:57:15.7766
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qV5/oRFnljNXids15kNKi1YyG+ro7aReeWCfVZklc2l8KV818Zvg3BZh6YGd6dX6wqoNnuhh8V5RHgAtOSXHAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7698
X-OriginatorOrg: intel.com
X-Spamd-Result: default: False [0.94 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55954-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,iki.fi:email];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arun.t@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 0B87B29EA8E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgQWxsLCANCg0KVGhlcmUgaGFzIGJlZW4gbm8gcmVwbHkgdG8gdGhlc2UgcGF0Y2hlcyBmb3Ig
cXVpdGUgc29tZSB0aW1lLiBDb3VsZCB5b3UgcGxlYXNlIHByb3ZpZGUgYW55IGZlZWRiYWNrLCBj
b21tZW50cywgb3Igc3VnZ2VzdGlvbnMgb24gdGhlc2UgcGF0Y2hlcw0KLQ0KUmVnYXJkcywNCkFy
dW4gVA0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogVCwgQXJ1biANClNlbnQ6
IDEyIE1hcmNoIDIwMjYgMDM6MTcgUE0NClRvOiBqb2hhbm5lcy5nb2VkZUBvc3MucXVhbGNvbW0u
Y29tOyBTYWthcmkgQWlsdXMgPHNha2FyaS5haWx1c0Bpa2kuZmk+DQpDYzogbWVoZGkuZGphaXRA
bGludXguaW50ZWwuY29tOyBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5l
bEB2Z2VyLmtlcm5lbC5vcmcNClN1YmplY3Q6IFJFOiBbUEFUQ0ggdjIgMS8yXSBwbGF0Zm9ybS94
ODY6IGludDM0NzI6IEFkZCBib2FyZCBkYXRhIGZvciBJbnRlbCBudmwNCg0KSGkgSGFucywgDQpU
aGFuayB5b3UgZm9yIHRoZSBzdWdnZXN0aW9uLiBZb3Ugd2VyZSBjb3JyZWN0IC0gdGhlIGkyYyBk
ZXZpY2VzIGFyZSBkaWZmZXJlbnQgZm9yIGVhY2ggc2Vuc29yLiBJIGFkZGVkIHRoZSBwcm9wZXIg
aTJjIGRldmljZSBuYW1lIGluIFJFR1VMQVRPUl9TVVBQTFkoKSwgYW5kIG5vdyBib3RoIHNlbnNv
cnMgcG93ZXIgdXAgY29ycmVjdGx5IHdpdGggdGhpcyBjaGFuZ2UuDQpJJ3ZlIHVwZGF0ZWQgdGhl
IGNoYW5nZXMgaW4gdGhlIFY0IHBhdGNoIHNldCBhbmQgc3VibWl0dGVkIGl0IGZvciByZXZpZXcN
Ci0NClJlZ2FyZHMsDQpBcnVuIFQNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206
IGpvaGFubmVzLmdvZWRlQG9zcy5xdWFsY29tbS5jb20gPGpvaGFubmVzLmdvZWRlQG9zcy5xdWFs
Y29tbS5jb20+IA0KU2VudDogMDYgTWFyY2ggMjAyNiAwMjo1MyBQTQ0KVG86IFQsIEFydW4gPGFy
dW4udEBpbnRlbC5jb20+OyBTYWthcmkgQWlsdXMgPHNha2FyaS5haWx1c0Bpa2kuZmk+DQpDYzog
bWVoZGkuZGphaXRAbGludXguaW50ZWwuY29tOyBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmc7
IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNClN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMS8y
XSBwbGF0Zm9ybS94ODY6IGludDM0NzI6IEFkZCBib2FyZCBkYXRhIGZvciBJbnRlbCBudmwNCg0K
SGksDQoNCk9uIDYtTWFyLTI2IDA5OjQ3LCBULCBBcnVuIHdyb3RlOg0KPiBIaSBIYW5zLA0KPiAN
Cj4gV2UgYXJlIHVzaW5nIENSRCBHMyBjYXJkICsgb3YxM2IxMCAoVUYgYW5kIFdGKSwgd2hpY2gg
aXMgc3VwcG9ydGVkIGJ5IERpc2NyZXRlIGFuZCBUUFM2ODQ3MCBwb3dlciBzb2x1dGlvbnMuDQo+
IFdGIGNhbWVyYSBpcyBwb3dlcmVkIGJ5IERpc2NyZXRlIGFuZCBVRiBjYW1lcmEgaXMgcG93ZXJl
ZCBieSBUUFM2ODQ3MCBQTUlDLg0KPiBEaXNjcmV0ZSBzb2x1dGlvbiBwcm92aWRlcyByZWd1bGF0
b3IgbmFtZSBhcyAiYXZkZCIuDQo+IFRQUzY4NDcwIHByb3ZpZGVzIG11bHRpcGxlIHJlZ3VsYXRv
cnMgbGlrZSAiYW5hIi4gVmRkLCBkb3ZkZCwgZXRjLg0KPiANCj4gQXMgcGVyIHlvdXIgY29tbWVu
dCBXZSBoYXZlIHRyaWVkIGJlbG93IGV4cGVyaW1lbnRzIGFuZCBzaGFyZWQgb3V0cHV0IGJlbG93
Og0KPiANCj4gRXhwZXJpbWVudCAxOiANCj4gLUFkZCBhdmRkIG5hbWUgYXMgYSByZWd1bGF0b3Ig
bmFtZS4NCj4gDQo+IHN0YXRpYyBzdHJ1Y3QgcmVndWxhdG9yX2NvbnN1bWVyX3N1cHBseSBpbnQz
NDcyX2FuYV9jb25zdW1lcl9zdXBwbGllc1tdID0gew0KPiAgICAgICAgIFJFR1VMQVRPUl9TVVBQ
TFkoImF2ZGQiLCAiaTJjLU9WVEkxM0IxOjAwIiksIH07DQo+IA0KPiArKysgYi9kcml2ZXJzL21l
ZGlhL2kyYy9vdjEzYjEwLmMNCj4gQEAgLTcwNCw3ICs3MDQsNiBAQCBzdGF0aWMgY29uc3QgY2hh
ciAqIGNvbnN0IG92MTNiMTBfc3VwcGx5X25hbWVzW10gPSB7DQo+ICAgICAgICAgImRvdmRkIiwg
ICAgICAgIC8qIERpZ2l0YWwgSS9PIHBvd2VyICovDQo+ICAgICAgICAgImF2ZGQiLCAgICAgICAg
IC8qIEFuYWxvZyBwb3dlciAqLw0KPiAgICAgICAgICJkdmRkIiwgICAgICAgICAvKiBEaWdpdGFs
IGNvcmUgcG93ZXIgKi8NCj4gIH07DQo+IA0KPiBFcnJvciBsb2dzOg0KPiBbICAgIDAuNzMyMTU2
XSB0cHM2ODQ3MC1yZWd1bGF0b3IgdHBzNjg0NzAtcmVndWxhdG9yOiBGYWlsZWQgdG8gc2V0IHN1
cHBseSBhdmRkDQo+IFsgICAgMC43MzkyOTddIHRwczY4NDcwLXJlZ3VsYXRvciB0cHM2ODQ3MC1y
ZWd1bGF0b3I6IGVycm9yIC1FQlVTWTogcmVnaXN0ZXJpbmcgQU5BIHJlZ3VsYXRvcg0KPiBbICAg
IDAuNzQ3NjYzXSB0cHM2ODQ3MC1yZWd1bGF0b3IgdHBzNjg0NzAtcmVndWxhdG9yOiBwcm9iZSB3
aXRoIGRyaXZlciB0cHM2ODQ3MC1yZWd1bGF0b3IgZmFpbGVkIHdpdGggZXJyb3IgLTE2DQo+IFsg
ICAgMy42MjEwODVdIGludGVsX2lwdTdfaXN5cy5pc3lzIGludGVsX2lwdTcuaXN5cy40MDogYmlu
ZCBvdjEzYjEwIDEtMDAxMCBubGFuZXMgaXMgMiBwb3J0IGlzIDENCj4gDQo+IFJlc3VsdDoNCj4g
T25seSBXRiBjYW1lcmEgc2Vuc29yIGlzIHdvcmtpbmcsIHdoaWNoIGdldHMgdGhlIGF2ZGQgcmVn
dWxhdG9yIGZyb20gdGhlIGRpc2NyZXRlIHNvbHV0aW9uLg0KPiBVRiBjYW1lcmEgZ2V0cyBmYWls
ZWQgdG8gYmluZCBkdWUgY29uZmxpY3QgcmVndWxhdG9yIG5hbWVzLg0KDQpJZiB5b3UgaGF2ZSAy
IE9WVEkxM0IxIGNhbWVyYXMgdGhlbiB0aGV5IHdpbGwgaGF2ZSAyIGRpZmZlcmVudCBkZXZpY2Ug
bmFtZXMsIHlvdSBjYW4gc2VlIHRoZXNlIGJ5IGRvaW5nOg0KDQpscyAvc3lzL2J1cy9pMmMvZGV2
aWNlcw0KDQpUaGV5IHdpbGwgbGlrZWx5IGJlOg0KDQoiaTJjLU9WVEkxM0IxOjAwIg0KImkyYy1P
VlRJMTNCMTowMSINCg0KYW5kIHNpbmNlIHlvdSdyZSBnZXR0aW5nIGFuIGVycm9yIHRoYXQgdGhl
IGRpc2NyZXRlIElOVDM0NzIgZGV2aWNlIGhhcyBhbHJlYWR5IHJlZ2lzdGVyZWQgdGhlICJhdmRk
IiBzdXBwbHkgZm9yIHRoZSAiaTJjLU9WVEkxM0IxOjAwIg0Kc2Vuc29yLCB0aGF0IG1lYW5zIHRo
YXQgdGhlIHRwczY4NDcwIGlzIGxpa2VseSBzdXBwbHlpbmcgdGhlICJpMmMtT1ZUSTEzQjE6MDEi
IHNlbnNvciBhbmQgbm90IHRoZSAiaTJjLU9WVEkxM0IxOjAwIiBzbyB5b3UgbmVlZCB0byBoYXZl
IHRoZSByZWd1bGF0b3JfY29uc3VtZXJfc3VwcGx5IG1hcHMgcG9pbnQgdG8gImkyYy1PVlRJMTNC
MTowMSIgLg0KDQpJZiB5b3UgYm9vdCB3aXRoICJpbnRlbF9za2xfaW50MzQ3Ml9kaXNjcmV0ZS5k
eW5kYmcgaW50ZWxfc2tsX2ludDM0NzJfY29tbW9uLmR5bmRiZyINCmFkZCB0byB5b3VyIGtlcm5l
bCBjb21tYW5kbGluZSB0aGVuIHRoZSBpbnQzNDcyIGNvZGUgd2lsbCBhZGQgc29tZSBkZWJ1ZyBt
ZXNzYWdlcyB0byBkbWVzZyB3aGljaCBsZXQgeW91IGtub3cgd2hpY2ggc2Vuc29yIGlzIG1hcHBl
ZCB0byB3aGljaCBJTlQzNDcyOjB4IGRldmljZS4NCg0KUmVnYXJkcywNCg0KSGFucw0KDQoNCg==

