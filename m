Return-Path: <linux-media+bounces-21488-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6EE79D0876
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2024 05:46:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 39C8E281BA9
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2024 04:46:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4766413B58E;
	Mon, 18 Nov 2024 04:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R/9W4pdQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDDA28E8;
	Mon, 18 Nov 2024 04:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731905204; cv=fail; b=SY+xUF4XtAo2ih8xkeq51VPCVPOK8upf8Iy6NJM0+EOY7vIkMb3ZQ8mTTckG7swFG8PtBeWQrmMltwMwp/9pa/tuaUALZ8r7JDMJIMseyJMlzV/4mirNpH/O1A5idWStEiHHE9gnhPYgeSt7nr1n6rzGXtbOTpI6d0DaDOhBePo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731905204; c=relaxed/simple;
	bh=B/bvb+O7oyCNU/6/Jq4UeWJq8NtOOR4SttRrSxawSzM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ENSt9qk0T4BsNnNvlpiKQmxNvvW1hLn7g4YCALyB4OZwpW3NXfstTCrLRDF3wRXmIi1Fmzv8NTUkpIi5v9PPS/Uek6F2p24Wtrru+r2iicZln6dyOKHds4wqhNed1faOvbofzUc/XgW+0czlf6U3HougPjKeR7BoGbkjxj5s/mU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R/9W4pdQ; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731905203; x=1763441203;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=B/bvb+O7oyCNU/6/Jq4UeWJq8NtOOR4SttRrSxawSzM=;
  b=R/9W4pdQs3VsjIhy8s0tENCqGB7aS9x6oC8olyXWqnlw6b+3RtVlRmFM
   DUcwznk4+GjeFTBObXeCIHnANTFNpEoZBjcfKnvaPRo50VLaMQgeRFbCN
   +Pn53z2ZfFAkcPgQguJBkXlR3+roDyuFW1JqrArhoKfJOBEYEyNj0skD7
   0RfjdLoguOWvAN/6+b3wX1uv1QQmUlbfO46tkIPzKQFzoks/4FUfDrNsN
   NNZrkEzotijCSGPpkIwTwLckoT8We5RjTH4Dts8ZTVTz7xWvDb0VKEOW0
   UMYpomqBi9W7CuMIsc5vkhVEQZVlrvwHsp0cEDf9xKoZBt/5+PVokNmwr
   A==;
X-CSE-ConnectionGUID: vfjdUfwPSymYDRcRINUgJQ==
X-CSE-MsgGUID: w8PC4XOWQi6VEDUQC/5p6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="31781196"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="31781196"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 20:46:42 -0800
X-CSE-ConnectionGUID: E3HQR4xzTXSZMww0MJhhOQ==
X-CSE-MsgGUID: +WmW4xgDT/q+NCKcDGNpVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="89540558"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 17 Nov 2024 20:46:42 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 17 Nov 2024 20:46:41 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 17 Nov 2024 20:46:41 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.42) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 17 Nov 2024 20:46:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iL5vwCACA6Qnum2fgGF11SLRf6zm//8lBpFLc+7Qxl7aXWNHUj1P+V07dzWTZGXA9NSCdoNz+Venh39UssmlQL/cRs3WhjPeh3lO8MV3E66gNadF1nL5pefvxEwsQbYl7dS+yoKHVscCQ7mP8U0l3i5HH0UwJHlhTYl48xH4hs2rCO1846o1CYwKkFSOWhYsitf4wN9qgv0Ry+ykKN6CBXtYw7CVa23S3EMFMuZsPaSlLpLWq44YACF+pbzFzgGS1smd/4lMTLKn/KYcakoUUnXUNnpgf0VpDsJRVmy3mnrYOXQWX4LCERYBrXTZcgk9z8l/WXn3i02iEak/L18+Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B/bvb+O7oyCNU/6/Jq4UeWJq8NtOOR4SttRrSxawSzM=;
 b=sRW9XE6/NNawKc5qha4FKt8X5w6uCFpHzdgI+7axRPx4s8wZsxVW6BIwWBGBLvbwxpLCpdgMFBBqXZOq710yIN2aOiREHfOX6zgn5mP84EZlPqfwjn9apYj50k9mGTAT1a/Krun4BosNQAAY7Fadpd2z3uXzanJgN5ycg33hm5cQWI/ssDufwmkeIuVL7Xgn60uG71rcYzPz4D2cePxFvoEaN/SG/cH2DRdgIgt4OSlW8H02YJ35MPdVSyB8uzDShZ90uJtR/8xThJbFqXqw85QrINMC4iyfsGW//qnE01qi+GwUSLLR2CuMYcg08nHrjlTc9lsICIKIciHlA0+2MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 CH3PR11MB7817.namprd11.prod.outlook.com (2603:10b6:610:123::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18; Mon, 18 Nov
 2024 04:46:38 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2962:1efd:f912:a5a3]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2962:1efd:f912:a5a3%7]) with mapi id 15.20.8158.023; Mon, 18 Nov 2024
 04:46:38 +0000
From: "Cao, Bingbu" <bingbu.cao@intel.com>
To: Nicolas Lorin <androw95220@gmail.com>, "sakari.ailus@linux.intel.com"
	<sakari.ailus@linux.intel.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: RE: [BUG?] media: ipu6 / ov01a10 webcam not detected
Thread-Topic: [BUG?] media: ipu6 / ov01a10 webcam not detected
Thread-Index: AQHbN7xH/E8ALQiM0UKuwVluubje1rK5a6AAgAMOC7A=
Date: Mon, 18 Nov 2024 04:46:38 +0000
Message-ID: <DM8PR11MB5653FF8ED0A4E9BA67B42CF799272@DM8PR11MB5653.namprd11.prod.outlook.com>
References: <cb2c20c3-e9f9-4758-92bc-43591946ed9d@gmail.com>
 <50811f23-4d59-4ea3-9259-042e7bf557fa@gmail.com>
In-Reply-To: <50811f23-4d59-4ea3-9259-042e7bf557fa@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5653:EE_|CH3PR11MB7817:EE_
x-ms-office365-filtering-correlation-id: fa8f7b3c-7ff0-4678-69ba-08dd078bfd17
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?R0M2REFIaDE1U0hzbi9HczdscDFhK3ZTS3dGS3RBQmFLMEVCZHVldDJnR0hO?=
 =?utf-8?B?TEtnN2hxNnE1R0pzRTNWQ2cwaWcySC9zaVI0VEErMExZaWd1UnZKTnFOQ0VZ?=
 =?utf-8?B?TjZNRFAwRnJ4WHVjK3k2SCtjcktxN25zeXhWM3JEOW44QzBXblNaaGZidFlY?=
 =?utf-8?B?ZGxPNDBidTdxSVk5TEdwaVl0WUE5alBFSlhVaTJudFJKVWlaUEUrOVlINGtQ?=
 =?utf-8?B?VEdkY0NTdmwxZUFUdWtrVzZpUDlhMmRPNlZLQWI4OEd0aGRMOXFIZ1lUQUtM?=
 =?utf-8?B?aGlEU1ZEWVJINGtvU0YzMEM1cWF6eDJwb3o3RERwdzBNdTVBK0tuUzRQNUJo?=
 =?utf-8?B?T2JKaEdUV2taZ2E1U3M5ZlJ5RVRFZitRV3E3QnV6dWt5K3ZlOEUvaVgrZkpo?=
 =?utf-8?B?bXE1YUtKN0VjT09CeDYvWUZSM1VYNzU4TVcyek5NTTcwa1phZXJQOVFqQTVk?=
 =?utf-8?B?NTRrSXBDNEZQNE5keFIxWC84TEtrKy9EZFJMYlRjQ0VHUWlLTUtrcXpnS2pJ?=
 =?utf-8?B?dk1YYjVIWVJvazZjNWltZFpNSjV2L3UvbWZQamRRbE9jTWFSdm9TTVRCdlAy?=
 =?utf-8?B?aG5RMi9jY2lMUEZHcExoa3R1OHN1dVlPKzF5V1lCL09Fa24vV1U2NitrRDBN?=
 =?utf-8?B?MjZWQWx1dHV3U3FRdDZSVUFpREYrWGE4dzBBV3dxTmtyeWhEbkVHM252ZEZS?=
 =?utf-8?B?MjFkeUlWcmZkUER3cUdPeTcrZWxuK3R6UVlTMjNpSVdaVzU0bFJiUm0zWFpy?=
 =?utf-8?B?T1hRTnJRdmVLMHA4bUdjbXl5YngycnFJbnovVnpmY2Q4eTVQSkRkTmVtQmll?=
 =?utf-8?B?MUkrSEFSSUxBcnVYM2xidkNURjFrbDNZU0MrLzJzMnhiODZLYXE3SVZsODRl?=
 =?utf-8?B?RU9Fb2U0d3JuZUcrTUN0MmpxM2dxamtUZ0FoRzVYVmNHNXROL0RtTkhGQ0d3?=
 =?utf-8?B?aktMWEZ3UVM2cVp4a3E2SHp0L2pjQUpNY044dkVid3IzWjlRVXhkWWx3c1dZ?=
 =?utf-8?B?T3ROb3R2OEJ0SDEyUTRlYWJDZm45RTBjakVSamtlZGhiQkpBaEtSSDhtaHEv?=
 =?utf-8?B?YkcveGZJUThmOFFycUV5NHNQTHpEcUdjVmVJd0VtVnhRdjVEMUlFNGpCZjZ4?=
 =?utf-8?B?TzdGSW41SUJaTlZ3ZXJtN29mYjJvUWJ3b0dqRUdiS3BSNnhLZlNkWjZEb3J5?=
 =?utf-8?B?K2pPTlc5a1pZSWczcVMyM3BCOGw3K05VZ1VlZWRWYTNRenV1eUV5K0tOWXUv?=
 =?utf-8?B?QmQvR3hHUUZWRVZiVHJPMDRYT011WVRrenJ1aG5sUnBZUG5uRzhlT0FDc2hr?=
 =?utf-8?B?eCtsSUpnRVNETk8zSDBkVzdvS0hIbDlNOEtGT2YzditFUTBhQkwwb3A2ZHFm?=
 =?utf-8?B?aWxaTXBIY1JpRHMvSk5HWldLNE9haDE4U0E0Skt0U29CNndYQm1uRVBKaGVL?=
 =?utf-8?B?TlF2WGMvWXJJZEd6VzRYa3JidnMzUW52SVcySHBvWktpWGtCYXJkZ2RXTTNs?=
 =?utf-8?B?aDhVbS9zYnNyYUptb0lId2haMlJHKzhKRTBaeVc3Zlo4Z0JWMWMycnNDN1lI?=
 =?utf-8?B?NXB1VlRJaWw2YWJzVFpia09hWTMyN0hwd3IrZk9taXBMMUhCSXpjNFV4NjBi?=
 =?utf-8?B?R2IzOFdtM1JVay92a29sdTRmZkUxOFZaTWlmSWVIdTN4VlJ1WXBNS3hKcjNl?=
 =?utf-8?B?bVpTN1A2RHVIQXB4Q1IyeUhPMHRqdzMrSzdPZHFITnRjdk12OGU5SWQ4dk9n?=
 =?utf-8?B?a1VSLzY2enBZMVJJMzFjUkdMQlVFUlhDVmk5WjZOM2xId0EvSFc5TTN4bldY?=
 =?utf-8?Q?Uu4fS/CjIMrzFvhlmvQJizS0WMpN96gwifHW8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5653.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N3dkNTgvUHBualk2NE9mKzFjNzdXVS82T0pTV0k1UlkvTEt2dnBVcytadFN5?=
 =?utf-8?B?TmVCRURFS25vR2hnOHRrM002cHE5QXppNlZYbGdyUWZjVitLVGtrT3BaaEJB?=
 =?utf-8?B?OEhNZXd1U2xCMFZSUTZRYUZCWnBFQTVuajkzUHdSaGg2NWRUNXBjbHVSUE03?=
 =?utf-8?B?K1MxS1Vqd21TSlhGckFoem1pZGhERENqdUtKSmk1T2pmeTNvbTFpaFd5Q1ll?=
 =?utf-8?B?RElwQmNzWHp2Tk5OZ0lRRjg0eEtqbm9aRWFEcjJ1TVhGamJwUjZ3Y3NlVW1p?=
 =?utf-8?B?MXNuTVMzZUV4dDEvQUpOd3Y0Uk96cFZMTTNybUlBR1ZnWUZKYm9hbUZmVmww?=
 =?utf-8?B?SnppSHQwQkYrWk9JUytmYmpIU0J0MW5kTkxvSEZkaTlKYWNMY2V2WUpCbVFu?=
 =?utf-8?B?bXZpTDFyQ3NDS0FlejZORGp2clBMQ3pMdE5LcjB4MzRZK2NSdHpubTl0YmR1?=
 =?utf-8?B?SWM2cEYyNkN0Vzd1NURrVE5aK09pUW95MGVacFA1UFBXUGF2WTJCL0RvWjB6?=
 =?utf-8?B?U0EyMUt5dSs2bWlGdHNPNkMxNlB2SUZsMjFzV3pmWWI5dUFaT0MzZkhUZDJv?=
 =?utf-8?B?R0lveDQybnRrbkx0SGJEbFJqVThBMUl6WjlXdVRhYjZmY3YxcC9oQTRGdXB3?=
 =?utf-8?B?RStEbC8yQUFJNm16VUhwbG1YUVNKdEJyeWRGeEhvTnV6S2tFdjFpZDVlc2E3?=
 =?utf-8?B?cXg2UHZLOXR1SDMwS3RmOGYyYTRoNGsvQTFkdE9sdzV2eHhWNzdsZUVsbU9Z?=
 =?utf-8?B?U0pBSGVlT2tCT1R5K3A0MzRSSjU2SnA0ZjFtbTdTVkNpdThlUzkxWmtrUXA4?=
 =?utf-8?B?c2R6dTJkdU8zQWZSV2dObHgzM3R3eithTFJKOVBwaXBtUGU0UTMwTUFDckhP?=
 =?utf-8?B?SGlHME5IN09hNmFDb1VrQUNoVW5ESUI5M3g4MC9sL3J4ZUtmeXdSdUxmcnlU?=
 =?utf-8?B?TEc0dmNobW1mdysxaithMWt0K0VhTWJPMysrM3h5WS9ZcTVYNFFmNGtxcHJT?=
 =?utf-8?B?ZzViWFpraHZaMWZXTWxhWEFQN2VNZ2pYVjNBZXdiSThkb1VxaWxtNjgvdTIz?=
 =?utf-8?B?ODhNVGk1d2w1UzJCMjZjeW03UWNaVktrL0YyMXVrbjZ5dlMrRm5zbW0yZU91?=
 =?utf-8?B?MTlXQkI4Vkdya1JXdFdmYXlTSGtsVEY4QUVVblBhdXNHT1EvaHg4WnBGbFJw?=
 =?utf-8?B?MWtvWE4rV2h2QnhzTkJMK1podERHNDA2MHVsRnI4ZUJwM0RZbitQMDFqMlBM?=
 =?utf-8?B?TDRwZHNXZ0RkZ2gzUXByR2xpTjN6eGtkYlhML3J4a09oWEhZbWhIRmw5Q1Fj?=
 =?utf-8?B?bHJtbHlFdEpJcWMyNzJUWWd0STZFblA0c2lZRnlPYVd2dm0yNGU1T2QwdWdH?=
 =?utf-8?B?M292ZzM4Z0swLzFGKzV0RHpkLzhEZG9XejFhREhiNEcwVkczdnNmNDVkMzlT?=
 =?utf-8?B?UUVNNmpsTVBSekJiMlFuaGxYRVpoekRBMTVYY0pqWmY5aGU3VHY5dDFxUXd6?=
 =?utf-8?B?UkM0VElSclA0UlF3c2NWSklzYVIrcG9QbSsycWgxeXdzaWh3TzFncXRvejRl?=
 =?utf-8?B?dkRybEQ2eUFjbGRDOVUydFNwQ29VZWxTcHAzSy9ycDZmMjl6NjlJSUJwci9H?=
 =?utf-8?B?RFRrUnZOZ3JjSFRqUUhwa1BUUlpwUU9OZndwcFZma0Uvei9LVS9mV0xDSUdl?=
 =?utf-8?B?RnlYcktWZStWZkVQUk15VlV5RllIV3JtK3ZWUENKZUIwZ3FmQkxnZTFlZTAz?=
 =?utf-8?B?blk1eC84WkM4OVlXVHFzUnpNU1hNZHJ5Q0llWE1qNTk0emIyc2VhNWtRcnR2?=
 =?utf-8?B?UjZOWXNHMTQvY1YyNTA0b2ZsVXFFMUFzYklhR3pYSld3a25iK3JLSXM5QUlN?=
 =?utf-8?B?ZzhIdUhMdWRvUEVKZTZMVHVMR1dJTDRZTzVSZis5eldaRXFKd2QwdmorZjVt?=
 =?utf-8?B?Z052N2UvTXRIYmVSY3llRHk0Nng1eFIzRHFMU2ltRHdFa2ZWd0p0R253MFB5?=
 =?utf-8?B?dlUxQndqZERZQm93cDVPQWF6aVBXY05adUt4U0o3M1R4NloxK1Z2VEJrd1Jl?=
 =?utf-8?B?V3pCWkN2ZDNaelNXVUx3RmZ6UlBHRVNPVExVUW1Vdkd2eGhVRFgrUlJGdXda?=
 =?utf-8?Q?zPpMaZVKEOVO+/NP/rm4mW1Y/?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa8f7b3c-7ff0-4678-69ba-08dd078bfd17
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2024 04:46:38.4464
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tylQgXOB6OGwwFWiFIr2ePtTEX0Wvsrv4rVSPbrbakenRuBP5Ew6/cINbj91pay8iYiIwql23WFnesjOjlPgLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7817
X-OriginatorOrg: intel.com

Tmljb2xhcywNCg0KV2h5IHdhcyB5b3VyIElQVSBkZXZpY2UgIHJ1bm5pbmcgb24gbm9uLXNlY3Vy
ZSBtb2RlPw0KYGludGVsLWlwdTYgMDAwMDowMDowNS4wOiBJUFU2IGluIG5vbi1zZWN1cmUgbW9k
ZSB0b3VjaCAweDAgbWFzayAweGZmYA0KDQpDb3VsZCB5b3UgcGxlYXNlIGNvbmZpcm0gdGhhdCB5
b3UgYXJlIHJ1bm5pbmcgd2l0aCBhIGNvcnJlY3QgSUZXSShCSU9TKT8NCg0KDQotLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0NCkJScywgIA0KQmluZ2J1IENhbw0KDQo+LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
Cj5Gcm9tOiBOaWNvbGFzIExvcmluIDxhbmRyb3c5NTIyMEBnbWFpbC5jb20+DQo+U2VudDogU2F0
dXJkYXksIE5vdmVtYmVyIDE2LCAyMDI0IDI6MDYgUE0NCj5UbzogQ2FvLCBCaW5nYnUgPGJpbmdi
dS5jYW9AaW50ZWwuY29tPjsgc2FrYXJpLmFpbHVzQGxpbnV4LmludGVsLmNvbQ0KPkNjOiBsaW51
eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcNCj5T
dWJqZWN0OiBSZTogW0JVRz9dIG1lZGlhOiBpcHU2IC8gb3YwMWExMCB3ZWJjYW0gbm90IGRldGVj
dGVkDQo+DQo+U2FtZSB0aGluZyBvbiBsYXRlc3QgbWFpbmxpbmU6DQo+DQo+IMKgIPOxnqogdW5h
bWUgLWENCj5MaW51eCBhbmRyb3dib29rIDYuMTIuMC1yYzctMS1naXQgIzEgU01QIFBSRUVNUFRf
RFlOQU1JQyBGcmksIDE1IE5vdg0KPjIwMjQgMjM6MzU6MzUgKzAwMDAgeDg2XzY0IEdOVS9MaW51
eA0KPg0KPmRtZXNnIGFsc28gc2hvdyB0aGlzIGFmdGVyIHN0b3BwaW5nIHJlcGVhdGluZyB0aGUg
dHdvIGxpbmVzOg0KPg0KPlvCoMKgIDE3LjI3MjMwMl0gcGNpIDAwMDA6MDA6MDUuMDogZGVmZXJy
ZWQgcHJvYmUgcGVuZGluZzogaW50ZWwtaXB1NjoNCj5JUFU2IGJyaWRnZSBpbml0IGZhaWxlZA0K
Pg0KPi0tDQo+Tmljb2xhcyBMb3Jpbg0KDQo=

