Return-Path: <linux-media+bounces-41498-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A75B3F2A1
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 05:21:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 546B71A853D0
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 03:22:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32C762E03EC;
	Tue,  2 Sep 2025 03:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="XUux2jUz"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2056.outbound.protection.outlook.com [40.107.93.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F711A9F82;
	Tue,  2 Sep 2025 03:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756783298; cv=fail; b=L7ZWserFWsFLj3RVrKC09ecC3hOs1eMZIqFJUzUbLWhEiWiEJJqY7Z3C8pLpDCEM15jK1KWp+n55uTSZUCL9vKHDZA3JLjg4d11w62oj/RsPx48A3i6NABR1COzUf+DevJE0DpaJjh9EvIFvpd3Kcrdk3wMyQxWRa43cOJ8On9Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756783298; c=relaxed/simple;
	bh=M3G8Lx6E1TrawqT7f3umhYKkKxHtYQRoZXrzp58bSWE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=q5yQUvfttFEZQKDt+fnVwj2bcIyQN575eR4ovmToGatcqnRjQlDOlcK1jTGVmw/2av96oRzRWznf44QFe8W/XEkdTKbeItluz+Ty+nFtwTmefnFl7x4Ffgxlnxs4yd/PtP1B0A2zbty5BTccfX4Xk5TuSdNYtRIlHhxCmqhhZSs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=XUux2jUz; arc=fail smtp.client-ip=40.107.93.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KLe0p3YI4CMiN8hOhAlEU6S/bJc49Jp43UJIf8F2kBEaml5rtXkS8XGpVFDHPjcfgj85rk1mzlr/4IPRY8r9u/rAaKPriTR2QFXZ/YLEbZIoxGXO6QgOjOMjeOpdpW3IHhtUu2wHxWVCZEDHpVbP8hr7xWaYKGH2sdRINLcjAldxPhG1HqKVZ70llWiX8UgCU9myGjNml8zyeb12NLU+US1qegt5D0InfclUHSOwyRWZXwvxrj432/l5ELO/oAlD0iQskMpxNXjNTOaeYjSr4sTNXyXLL6ZO29DMb7qpH1cxh72ytYBHFM3StBVdlszkdWb1M9AQuCxwdWDm71KMDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QDunZr+2JKaYYrxLWD372lfcRsqMLiP2rn3/OK8PDjc=;
 b=KuXigCY/VhUdTLlaKUDwE2kEmSgFLz4v4OfGxsP1vb0Yam0AiYszZ+hrMXhY76Zu1TLRdftMPbwWrcPZ7lBO1sxbuH3oMOMYRiZUhh0sg9ElJIDzFj3dKHikNCfkynLkbeZTQ186mn0b9bz2AnGgwhT45ZI5lbP0lNgBdS9mZwhXL0AXnxnJqmRXXp/Z1Eyj3RjCcF1O+6UxU0KpnoLomIEB1qYmmnERLO8kN6UNDIFpWIdDGl9DJdOVSfPsQkrt4Xy3s20trv4NpwC3LOA3AckxWALN2Qr6JNDAQV6n9Oc3ReZKURnS0h6MwzkI3zlUS1RuE/MMGDArvnTqFbQF1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QDunZr+2JKaYYrxLWD372lfcRsqMLiP2rn3/OK8PDjc=;
 b=XUux2jUzwOC1YzG26KsT+pWw4E8nyLQO6XIxV075DdrpPsUj8IG3Opi4GG6Bh8ewWG+i3sBgeU7F5jZYul0yy+IhV0N9h1xUEYPCAcV0y5C41Yc3/4dY4jtZgujSkNe4RqZTgkR6n5qc+ttBZh7vJbJ+8pwpSo4uDNIHhLC9S4Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7446.namprd12.prod.outlook.com (2603:10b6:510:216::13)
 by PH7PR12MB6538.namprd12.prod.outlook.com (2603:10b6:510:1f1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 03:21:32 +0000
Received: from PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7]) by PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7%4]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 03:21:32 +0000
Message-ID: <a3502513-d085-413c-ac7f-1c924d66354b@amd.com>
Date: Tue, 2 Sep 2025 11:21:23 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] Add AMD ISP4 driver
To: "Limonciello, Mario" <Mario.Limonciello@amd.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: "mchehab@kernel.org" <mchehab@kernel.org>,
 "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
 "bryan.odonoghue@linaro.org" <bryan.odonoghue@linaro.org>,
 "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
 "prabhakar.mahadev-lad.rj@bp.renesas.com"
 <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "sultan@kerneltoast.com" <sultan@kerneltoast.com>,
 "Nirujogi, Pratap" <Pratap.Nirujogi@amd.com>,
 "Chan, Benjamin (Koon Pan)" <Benjamin.Chan@amd.com>,
 "Li, King" <King.Li@amd.com>,
 "Rosikopulos, Gjorgji" <Gjorgji.Rosikopulos@amd.com>,
 "Jawich, Phil" <Phil.Jawich@amd.com>,
 "Antony, Dominic" <Dominic.Antony@amd.com>,
 "Gong, Richard" <Richard.Gong@amd.com>, "Tsao, Anson" <anson.tsao@amd.com>
References: <20250828084507.94552-1-Bin.Du@amd.com>
 <20250828165605.GA9916@pendragon.ideasonboard.com>
 <13c5922f-a134-463a-87df-d7f4e4eeb880@amd.com>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <13c5922f-a134-463a-87df-d7f4e4eeb880@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR04CA0015.apcprd04.prod.outlook.com
 (2603:1096:4:197::21) To PH8PR12MB7446.namprd12.prod.outlook.com
 (2603:10b6:510:216::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7446:EE_|PH7PR12MB6538:EE_
X-MS-Office365-Filtering-Correlation-Id: 9124277c-87fc-4912-b925-08dde9cfd053
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OXdnaHhIcUNnOVN5dW1OTTFpWFJmckJraHFpTmE4WURXSi9UT002MFJDSlk2?=
 =?utf-8?B?YmRYcGVIV1diWEJESnc3cDF5L1pFeFYvVDNnc0ZHM2x6cEVnbGVGS214eTF4?=
 =?utf-8?B?UzJvazNWTnFoclZ2V3M5Um14K2psSnV5UXZDdExBWHZTRk1mdnJqa0lXVm5S?=
 =?utf-8?B?M094YjhrV1FxbjJySzRmMmxKT2FxU0Y3ZmI5RU5KaWJJQVJPZUpYVzBIUURR?=
 =?utf-8?B?Q3dyZ3RnbExjNzBWVjAyUzE1dGRlcVB6MVJnMVRyakRiZkM1bmtLZWFsZHFi?=
 =?utf-8?B?aFFYZVpJMUl3R0k5VGZ5RFkxdnUxOXBVVFVva254cFpqTGtjU2hUK1RJa1pz?=
 =?utf-8?B?eDlzRmprSTcvVFhRY1AydFFNOXNLblJWeTNGaTNLMmFYSnJBTUNnZTJmOXJ2?=
 =?utf-8?B?bDBTdzZtOFZTNTFjYy9ZQXdvcVF3c3BVeWFxbTNoOCtaNExPSkJkdll2NUFp?=
 =?utf-8?B?NjNRV0ZyblVYUHVrVURSUWxLZWZWTXJXR2ltbG0rSmpJRG9vUzJwVm9OakdH?=
 =?utf-8?B?ckZBa3V5aXlRdVlIeUFiS2c2RXFwbXBsSXcvS0J3S3NjemdkSDRSWnhWLysz?=
 =?utf-8?B?NWRQaitWRGR1SDJLUkd2Lzl1T3YwaHUrMjBxazc2cENyNE9saGkrOFBJcXBC?=
 =?utf-8?B?aDhVVVVMcFdXZTVwY3RvVENUWnZ4RlhQdTczV0lpS0Z4VkRCWmcyWlRFc241?=
 =?utf-8?B?NkVUVTNVMnlPTVd2WnhwYXdXQ3k1L01YZGxSdjBaWEFYazRUdW1NTnB4cVJY?=
 =?utf-8?B?S2JsZ3BiZFUyWUhPa0laTlNVM2FLcTVJSW9PcTMxQnJJenpTM1ZKcnpwZ1BF?=
 =?utf-8?B?dC9xUGVST0ZiRHAwR3UwMnpISkhNaVN0aDdYZGdjbDZxR2ZBbzJuNC83R0dx?=
 =?utf-8?B?QkFGZ1FEL2JIbmdXR1JQVlNpN1NFVVMraXphRnRHQXFKeXJNcXkzMTRrcGo3?=
 =?utf-8?B?NjYvWGgvMFY1TU1ubWVsekdmYzl1azBndTMxcjVmMjQvSG9QejVXck1BUlUx?=
 =?utf-8?B?Q3dDUFBTNERBWXByeldBbEswMVc4S1JIS0xaVUJOWm5YbXRldnYyMUh4a1Ux?=
 =?utf-8?B?aFZoL04vbFYxVTVRTVAyeml3cXlJenVXcUNkWk5RWXh1QlI3Szc0dFJIaW95?=
 =?utf-8?B?WENjd1dZc2E4L1NMSWMvNHdnSEdLODRoUzZCOWdtUUVFcEllZXBNK3dQc2FS?=
 =?utf-8?B?Z0RqR1RWbzFyYk04cTJkTzZXbXYzSkNENTlkcGVYRndGR0RuQWpWNjBVQmdh?=
 =?utf-8?B?ekl1dFhncEgvTC91UFZUYUxRV201YWtsblpST2wydUJtc056YzNia3h0Zlg3?=
 =?utf-8?B?M0dGdnNnZFIySFJZWU1FcGdEUU5UZWYxUXFDZHhyL05ORFpncDhPOG52VDFR?=
 =?utf-8?B?YjlNQnNIdWJvaHZwc0t0SWJHc2NpbFh0cnYxSE5jU0V3Y0xGTGdSNmZrcE5z?=
 =?utf-8?B?QVd0alh2c1dVaXdEQ1FXV0RvUUNEb1RBbFFPWEcyc1dybjFrcmxOZnJDamtU?=
 =?utf-8?B?bmlOVnZJRXZtdW1vQlhCTEovTmR4WENocDBrM3kzNy9EcFcxTGVOSm9BekEx?=
 =?utf-8?B?UEZkdGtVTlgwemRFTXRpVGxmOHYwZ2g1K2VRS0VueEdXZzBmMXdSVUYxWmJ0?=
 =?utf-8?B?SC9SR1hjK1lvM3prTkc3dzJRSUd4cW9kaEdiZ05vR2htUHNkMWgzNzBzWGRT?=
 =?utf-8?B?a05lK00xV3F2R1Y4a2pUTkIvL2FocW1SMm1iYTVTQVlndDdmNW1rZXUzRTZt?=
 =?utf-8?B?NmhTaXRmTjVxcnp4RG5EZEY2c0NXYng3M3RKV2F5TmRFZi9vaFFDTHo0R25v?=
 =?utf-8?B?RGo0QUNDVXNWNlZ2S3BxbW04UWV5MllaakdibXcybUYvUXd0SXRnemQ2QVBC?=
 =?utf-8?Q?7RCRv01L18Ple?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7446.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dklCNy9LcmpsSmxxTUF4eU5PcEtBejg4Y2dpN1VWUEEydTFQdWRnVUlCZCtC?=
 =?utf-8?B?QjgyK1E2cFQrSm8rNER5NEJrd2RRcC9TYStlWFJ4WnNsbkp2U0ZTMUJhM0lv?=
 =?utf-8?B?eGFhU2laVG5YcEVrYmRuYzZycXJHSm16UzBPVUlOL1J5UVRQcWIrRmVoTHAr?=
 =?utf-8?B?aDZ1bWc4OGZBbHZoRjBhR243ZEhBczFrVXRzdVEvbGVkc2hDSjZPVnJpNXhk?=
 =?utf-8?B?aVR3RHBCeEJadTFTWTQwZmdSNTdmT1JncEVnbkY1MFB1ZWRFa3RCOVJCaFhT?=
 =?utf-8?B?Z1prWG15djNyM2ovMjdnZmdNOXFpOVAxMXNQKzluaXlMcFR3ckM0SVIyeFNu?=
 =?utf-8?B?N2MvaTA3MUpUSFdzTTBKcHE4aGNFSWlpTFdHQ2Y1YjVlZ3RtUWlCZEY2MmF4?=
 =?utf-8?B?NGU2aythQUVmVy9qRjJ5UlRmOEtpQ1ViNDRYQzRYSEtJY3R4RTFEbDh6QUtz?=
 =?utf-8?B?czNVRWRvRUtJMUp2YzZHQlB6dmlRMjExMitndTVnMnBvMXlsdmhXU3V1bDhG?=
 =?utf-8?B?OWxJdnc3SXl3emRmNVRXS2VaV0psNC82VEF6c3FCOFdRcHVIZkNQSXVJekNa?=
 =?utf-8?B?UUlDb01qOWpsWThsS1c0RHAwZVFhZml1SGNOazFyTmN4QnY0MVM2cWN3M0FB?=
 =?utf-8?B?aFVndFdmcG03WkpWNVF4OWdEeG5WdGFISnJDYnJMUEEyeUgwV0ZvNkdKNVgr?=
 =?utf-8?B?SHNUK3VtZGYvRlNkalJBZHZhZVoxNHhaT3MwT1dXN0xua2pvSkwrczIreGVI?=
 =?utf-8?B?VHREYithUU85MW9Yc0pvRUpMWVMwaEFLSGdnc0J6a2pxOCtaVERoaEdkSFo2?=
 =?utf-8?B?THc2VDBLM21KcWVlWTNtMlZVV1R1YldKUmJiTlVqOEJIS1pDS1BOZEhqeDBk?=
 =?utf-8?B?dlhsVWZuQVg1alkxK0lCeWpSYWFrOHA5Y2QzV2ZTREhsTEYrL3JIeFZ2bHN3?=
 =?utf-8?B?RG1TeW44cHBQTlVwUWhYUzZWcGRSY1UybDhkNVdlclp0RFRURlVxUm1OYUZS?=
 =?utf-8?B?KzdBZHg5bUJBYkFWQi9GWWZZK3oyTWtIRDgvRnlNVjc5OGducS9idXJDK29a?=
 =?utf-8?B?clZjNUNoeFhyVEk2VW5IVFZpOW5QMklMS2I0N29nYkpwMjNRWDRLb3JkbGFI?=
 =?utf-8?B?SnhmM3ZvemdBaHNMV2V3L2pDekhYd3hvbEl5dmQwdURUaFU5UVdoekgwTDlR?=
 =?utf-8?B?N0wyemRMeFJ5TE0xclptSk0vSmU3blNya0dwRkF2NHQ4YmZjZXdrbWc0b1FF?=
 =?utf-8?B?Q1ZpTWpRMlNXOFB1ejVUYWgzeFc4Z3RXWlBIUlhDUytWWjlBTm1iYkxYTm1W?=
 =?utf-8?B?QkJQemYrNUk0Z0lSbkttSUxPMVZsYzhOVWxXc21Mcmx1RVFhMXRSUUo4R0tj?=
 =?utf-8?B?WW9Jdkw2WHdXODZGTys0VUMyUDBoS1hRaWkxcnEzc1RjK0daZjhSaWczOGRZ?=
 =?utf-8?B?UTV5OU95c0o3bXl3dWE1amx6SGg1ZWZtS2RHWitQMWtJNWtEWlJIb3ZROGRX?=
 =?utf-8?B?bXlBclBhemJ4MTNoOXZzYWJ6cVBnMXh2Q0JaQ2ZzQVkxbjRobVFnR1BPanJr?=
 =?utf-8?B?aW04RUY1MzBTM211ZGp3eWxvYlhOZi9nVVVGNDY0MHBkWWpYWHRtZW1wdHNH?=
 =?utf-8?B?NzBTWWRGTGthMjZ6eE1QVUdQbFFCSHFnSTI1NWFOQkFCUDRaRFk3bFZ3bjc3?=
 =?utf-8?B?M2RCREtqT3NuU3ZidDJNMGdjazl1VnA0NktWQzh1cDFMSjRWMVMyMm9lM0du?=
 =?utf-8?B?TUw4M1RKYzlZY1dwYWtoYWlZTnVJVXhHdVhzTmNhbmpHZllBc205ZnY1QTFV?=
 =?utf-8?B?VVA0SDdTRndwU0Q4WE9XQUNqT3lnUG9VcWl0Um1ndkVieWtzRzRXamRBQjk1?=
 =?utf-8?B?MExDYkRkeTUwcitGaGQyTEpmOGlxS0xWYzNqcGloNEJIVDczZ2VNalZqeFdX?=
 =?utf-8?B?ODdremorT1VBcy9NTFc2TCtGdDM0NzNEOXRhcDFHSWt1cVR0YmduQlY1WHV2?=
 =?utf-8?B?NmxtUkV5TVdvRDE4Y0ZkakV0eEMrVUZaS3BIYkZ0dXJEYm03NXFlYXJXTkRI?=
 =?utf-8?B?WkMyZlMyMkpSUmRyM1NrbWYweURkS0MxeHhLOEdqTTB5T2ZlWWJrRzVCUmFn?=
 =?utf-8?Q?WiR4=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9124277c-87fc-4912-b925-08dde9cfd053
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7446.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 03:21:32.3262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DDOcaIjclpNjGEaL0AV/k658pg4ExYksbK5PRD4pUxCcVm/6ZiklyEv8c8RvKlbg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6538

Thanks Laurent, and Mario for the clarification.

On 8/29/2025 12:58 AM, Limonciello, Mario wrote:
> On 8/28/25 11:56 AM, Laurent Pinchart wrote:
>> Hi Bin Bu,
>>
>> Have you sent out the cover letter only ? I haven't received the rest of
>> the series, and it's not found on lore.kernel.org either.
> 
> Something seems wrong with the cover letter threading to the series.
> Here's the rest of the series (which I did receive too).
> 
> https://lore.kernel.org/linux-media/20250828100811.95722-1-Bin.Du@amd.com/
> 
>>
>> On Thu, Aug 28, 2025 at 04:45:00PM +0800, Bin Du wrote:
>>> Hello,
>>>
>>> AMD ISP4 is the AMD image processing gen 4 which can be found in HP ZBook Ultra G1a 14 inch Mobile Workstation PC ( Ryzen AI Max 385)
>>> (https://ubuntu.com/certified/202411-36043)
>>> This patch series introduces the initial driver support for the AMD ISP4.
>>>
>>> Patch summary:
>>> - Powers up/off and initializes ISP HW
>>> - Configures and kicks off ISP FW
>>> - Interacts with APP using standard V4l2 interface by video node
>>> - Controls ISP HW and interacts with ISP FW to do image processing
>>> - Support enum/set output image format and resolution
>>> - Support queueing buffer from app and dequeueing ISP filled buffer to App
>>> - It supports libcamera ver0.2 SimplePipeline
>>> - It is verified on qv4l2, cheese and qcam
>>> - It is verified together with following patches
>>> 	platform/x86: Add AMD ISP platform config (https://lore.kernel.org/all/20250514215623.522746-1-pratap.nirujogi@amd.com/)
>>> 	pinctrl: amd: isp411: Add amdisp GPIO pinctrl (https://github.com/torvalds/linux/commit/e97435ab09f3ad7b6a588dd7c4e45a96699bbb4a)
>>> 	drm/amd/amdgpu: Add GPIO resources required for amdisp (https://gitlab.freedesktop.org/agd5f/linux/-/commit/ad0f5966ed8297aa47b3184192b00b7379ae0758)
>>>
>>> AMD ISP4 Key features:
>>> - Processes bayer raw data from the connected sensor and output them to different YUV formats
>>> - Downscale input image to different output image resolution
>>> - Pipeline to do image processing on the input image including demosaic, denoise, 3A, etc
>>>
>>> ----------
>>>
>>> Changes v2 -> v3:
>>>
>>> - All the dependent patches in other modules (drm/amd/amdgpu, platform/x86, pinctrl/amd) merged on upstream mainline kernel (https://github.com/torvalds/linux) v6.17.
>>> - Removed usage of amdgpu structs in ISP driver. Added helper functions in amdgpu accepting opaque params from ISP driver to allocate and release ISP GART buffers.
>>> - Moved sensor and MIPI phy control entirely into ISP FW instead of the previous hybrid approach controlling sensor from both FW and x86 (sensor driver).
>>> - Removed phy configuration and sensor binding as x86 (sensor driver) had relinquished the sensor control for ISP FW. With this approach the driver will be exposed as web camera like interface.
>>> - New FW with built-in sensor driver is submitted on upstream linux-firmware repo (https://gitlab.com/kernel-firmware/linux-firmware/).
>>> - Please note the new FW submitted is not directly compatible with OEM Kernel ISP4.0 (https://github.com/amd/Linux_ISP_Kernel/tree/4.0) and the previous ISP V2 patch series.
>>> - If intend to use the new FW, please rebuild OEM ISP4.0 Kernel with CONFIG_VIDEO_OV05C10=N and CONFIG_PINCTRL_AMDISP=Y.
>>> - Included critical fixes from Sultan Alsawaf branch (https://github.com/kerneltoast/kernel_x86_laptop.git) related to managing lifetime of isp buffers.
>>>         media: amd: isp4: Add missing refcount tracking to mmap memop
>>>         media: amd: isp4: Don't put or unmap the dmabuf when detaching
>>>         media: amd: isp4: Don't increment refcount when dmabuf export fails
>>>         media: amd: isp4: Fix possible use-after-free in isp4vid_vb2_put()
>>>         media: amd: isp4: Always export a new dmabuf from get_dmabuf memop
>>>         media: amd: isp4: Fix implicit dmabuf lifetime tracking
>>>         media: amd: isp4: Fix possible use-after-free when putting implicit dmabuf
>>>         media: amd: isp4: Simplify isp4vid_get_dmabuf() arguments
>>>         media: amd: isp4: Move up buf->vaddr check in isp4vid_get_dmabuf()
>>>         media: amd: isp4: Remove unused userptr memops
>>>         media: amd: isp4: Add missing cleanup on error in isp4vid_vb2_alloc()
>>>         media: amd: isp4: Release queued buffers on error in start_streaming
>>> - Addressed all code related upstream comments
>>> - Fix typo errors and other cosmetic issue.
>>>
>>>
>>> Changes v1 -> v2:
>>>
>>> - Fix media CI test errors and valid warnings
>>> - Reduce patch number in the series from 9 to 8 by merging MAINTAINERS adding patch to the first patch
>>> - In patch 5
>>> 	- do modification to use remote endpoint instead of local endpoint
>>> 	- use link frequency and port number as start phy parameter instead of extra added phy-id and phy-bit-rate property of endpoint
>>>
>>> ----------
>>>
>>> It passes v4l2 compliance test, the test reports for:
>>>
>>> (a) amd_isp_capture device /dev/video0
>>>
>>> Compliance test for amd_isp_capture device /dev/video0:
>>> -------------------------------------------------------
>>>
>>> atg@atg-HP-PV:~/bin$ ./v4l2-compliance -d /dev/video0
>>> v4l2-compliance 1.29.0-5348, 64 bits, 64-bit time_t
>>> v4l2-compliance SHA: 75e3f0e2c2cb 2025-03-17 18:12:17
>>>
>>> Compliance test for amd_isp_capture device /dev/video0:
>>>
>>> Driver Info:
>>>           Driver name      : amd_isp_capture
>>>           Card type        : amd_isp_capture
>>>           Bus info         : platform:amd_isp_capture
>>>           Driver version   : 6.14.0
>>>           Capabilities     : 0xa4200001
>>>                   Video Capture
>>>                   I/O MC
>>>                   Streaming
>>>                   Extended Pix Format
>>>                   Device Capabilities
>>>           Device Caps      : 0x24200001
>>>                   Video Capture
>>>                   I/O MC
>>>                   Streaming
>>>                   Extended Pix Format
>>> Media Driver Info:
>>>           Driver name      : amd_isp_capture
>>>           Model            : amd_isp41_mdev
>>>           Serial           :
>>>           Bus info         : platform:amd_isp_capture
>>>           Media version    : 6.14.0
>>>           Hardware revision: 0x00000000 (0)
>>>           Driver version   : 6.14.0
>>> Interface Info:
>>>           ID               : 0x03000005
>>>           Type             : V4L Video
>>> Entity Info:
>>>           ID               : 0x00000003 (3)
>>>           Name             : Preview
>>>           Function         : V4L2 I/O
>>>           Pad 0x01000004   : 0: Sink
>>>             Link 0x02000007: from remote pad 0x1000002 of entity 'amd isp4' (Image Signal Processor): Data, Enabled, Immutable
>>>
>>> Required ioctls:
>>>           test MC information (see 'Media Driver Info' above): OK
>>>           test VIDIOC_QUERYCAP: OK
>>>           test invalid ioctls: OK
>>>
>>> Allow for multiple opens:
>>>           test second /dev/video0 open: OK
>>>           test VIDIOC_QUERYCAP: OK
>>>           test VIDIOC_G/S_PRIORITY: OK
>>>           test for unlimited opens: OK
>>>
>>> Debug ioctls:
>>>           test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>>           test VIDIOC_LOG_STATUS: OK (Not Supported)
>>>
>>> Input ioctls:
>>>           test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>>           test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>           test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>>           test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>>           test VIDIOC_G/S/ENUMINPUT: OK
>>>           test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>>           Inputs: 1 Audio Inputs: 0 Tuners: 0
>>>
>>> Output ioctls:
>>>           test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>>           test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>           test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>>           test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>>           test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>>           Outputs: 0 Audio Outputs: 0 Modulators: 0
>>>
>>> Input/Output configuration ioctls:
>>>           test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>>           test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>>           test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>>           test VIDIOC_G/S_EDID: OK (Not Supported)
>>>
>>> Control ioctls (Input 0):
>>>           test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>>           test VIDIOC_QUERYCTRL: OK (Not Supported)
>>>           test VIDIOC_G/S_CTRL: OK (Not Supported)
>>>           test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>>           test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>>           test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>>           Standard Controls: 0 Private Controls: 0
>>>
>>> Format ioctls (Input 0):
>>>           test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>>           test VIDIOC_G/S_PARM: OK
>>>           test VIDIOC_G_FBUF: OK (Not Supported)
>>>           test VIDIOC_G_FMT: OK
>>>           test VIDIOC_TRY_FMT: OK
>>>           test VIDIOC_S_FMT: OK
>>>           test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>>           test Cropping: OK (Not Supported)
>>>           test Composing: OK (Not Supported)
>>>           test Scaling: OK (Not Supported)
>>>
>>> Codec ioctls (Input 0):
>>>           test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>>           test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>>           test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>>
>>> Buffer ioctls (Input 0):
>>>           test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>>           test CREATE_BUFS maximum buffers: OK
>>>           test VIDIOC_REMOVE_BUFS: OK
>>>           test VIDIOC_EXPBUF: OK
>>>           test Requests: OK (Not Supported)
>>>           test blocking wait: OK
>>>
>>> Total for amd_isp_capture device /dev/video0: 49, Succeeded: 49, Failed: 0, Warnings: 0
>>>
>>> Please review and provide feedback.
>>>
>>> Many thanks,
>>>
>>> Bin Du (7):
>>>     media: platform: amd: Introduce amd isp4 capture driver
>>>     media: platform: amd: low level support for isp4 firmware
>>>     media: platform: amd: Add isp4 fw and hw interface
>>>     media: platform: amd: isp4 subdev and firmware loading handling added
>>>     media: platform: amd: isp4 video node and buffers handling added
>>>     media: platform: amd: isp4 debug fs logging and  more descriptive
>>>       errors
>>>     Documentation: add documentation of AMD isp 4 driver
>>>
>>>    Documentation/admin-guide/media/amdisp4-1.rst |   66 +
>>>    Documentation/admin-guide/media/amdisp4.dot   |    8 +
>>>    .../admin-guide/media/v4l-drivers.rst         |    1 +
>>>    MAINTAINERS                                   |   25 +
>>>    drivers/media/platform/Kconfig                |    1 +
>>>    drivers/media/platform/Makefile               |    1 +
>>>    drivers/media/platform/amd/Kconfig            |    3 +
>>>    drivers/media/platform/amd/Makefile           |    3 +
>>>    drivers/media/platform/amd/isp4/Kconfig       |   13 +
>>>    drivers/media/platform/amd/isp4/Makefile      |   10 +
>>>    drivers/media/platform/amd/isp4/isp4.c        |  237 ++++
>>>    drivers/media/platform/amd/isp4/isp4.h        |   26 +
>>>    drivers/media/platform/amd/isp4/isp4_debug.c  |  272 ++++
>>>    drivers/media/platform/amd/isp4/isp4_debug.h  |   41 +
>>>    .../platform/amd/isp4/isp4_fw_cmd_resp.h      |  314 +++++
>>>    drivers/media/platform/amd/isp4/isp4_hw_reg.h |  125 ++
>>>    .../media/platform/amd/isp4/isp4_interface.c  |  972 +++++++++++++
>>>    .../media/platform/amd/isp4/isp4_interface.h  |  149 ++
>>>    drivers/media/platform/amd/isp4/isp4_subdev.c | 1198 ++++++++++++++++
>>>    drivers/media/platform/amd/isp4/isp4_subdev.h |  133 ++
>>>    drivers/media/platform/amd/isp4/isp4_video.c  | 1213 +++++++++++++++++
>>>    drivers/media/platform/amd/isp4/isp4_video.h  |   87 ++
>>>    22 files changed, 4898 insertions(+)
>>>    create mode 100644 Documentation/admin-guide/media/amdisp4-1.rst
>>>    create mode 100644 Documentation/admin-guide/media/amdisp4.dot
>>>    create mode 100644 drivers/media/platform/amd/Kconfig
>>>    create mode 100644 drivers/media/platform/amd/Makefile
>>>    create mode 100644 drivers/media/platform/amd/isp4/Kconfig
>>>    create mode 100644 drivers/media/platform/amd/isp4/Makefile
>>>    create mode 100644 drivers/media/platform/amd/isp4/isp4.c
>>>    create mode 100644 drivers/media/platform/amd/isp4/isp4.h
>>>    create mode 100644 drivers/media/platform/amd/isp4/isp4_debug.c
>>>    create mode 100644 drivers/media/platform/amd/isp4/isp4_debug.h
>>>    create mode 100644 drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
>>>    create mode 100644 drivers/media/platform/amd/isp4/isp4_hw_reg.h
>>>    create mode 100644 drivers/media/platform/amd/isp4/isp4_interface.c
>>>    create mode 100644 drivers/media/platform/amd/isp4/isp4_interface.h
>>>    create mode 100644 drivers/media/platform/amd/isp4/isp4_subdev.c
>>>    create mode 100644 drivers/media/platform/amd/isp4/isp4_subdev.h
>>>    create mode 100644 drivers/media/platform/amd/isp4/isp4_video.c
>>>    create mode 100644 drivers/media/platform/amd/isp4/isp4_video.h
>>
> 

-- 
Regards,
Bin


