Return-Path: <linux-media+bounces-43125-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60341B9D582
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 05:56:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5312B189AA4E
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 03:57:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 589662E762E;
	Thu, 25 Sep 2025 03:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="yNmC8hHI"
X-Original-To: linux-media@vger.kernel.org
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011069.outbound.protection.outlook.com [40.107.208.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655BF2E6CBE;
	Thu, 25 Sep 2025 03:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758772587; cv=fail; b=fWyeOshntD9ZBLtPomsPk8HfLNq5BjBVq3ELaDqN9q6MnqpQOuVJZCXPTa6YhAtIRR0kSpF1i2uh4GkzbvG/j3/up6upOyCRNbDLLuE1CG+tHkeSpoiv8oKGtKbnWatk63tWbWzKfeHf1RHB5U7bctKT96o2WYeYmlKn3mXRB7o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758772587; c=relaxed/simple;
	bh=/rrPm1pUbyN/amhlIVsP3CcPbFKtqVgDObugNpGHQpQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CSWzj7ZfJYboYRVIb7qNTuwnA6W73HIxK0s3hajgoQSeaUwBXrqCTPm9kzsSt4bqb1E/GdxySvieQ57zUqZH6oYhUMNJik8L6Nte7mpXcibBt5sBEoV1l2W1aIg6Qw6kc8vm0WSRjcNwCnfT/wYhdDcR/z6rzbnzK3xa5/j/q/Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=yNmC8hHI; arc=fail smtp.client-ip=40.107.208.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=skNqkDOOZ07rb10j1nc69s1wRGBsCKG/AB/iZ5biS/k0NPqgxGHAPJMiIiRO/5fnFrZ368UL394cZBOCG2lxDZq8vs0z0hVmiEaXAs5SLeeax/Nxlih7TWBV8db/ffrlGboG2YW8msP2ztRgH+GdT4Ixh99swtah+ibydORnCnC8DVuQL5DwIerzq/Zad+sxCU6DxVx8NSNlXx2OmnyZQwyCjbxfHJUHSdZqJfaMG8p/nCuJ4udAbBmM4Az/wIJqV+xijOsA3+ytUepxcS31BvgwnBCp2hA60JEYYp/6s0OUKbdSRsXgPv1WLVp0DfH3fhxrI0TiiJD4DNKyoIaKIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UJr+sDfY5UjFNKHoKr3oLlSegeSakAYmtUX0zjUBzRM=;
 b=UdieVrONnKWVgSSq6h/tPn53AuGEUTgVKCKVynPoP2bcosHlsWvojama/HU9GALaD7jCahzoC3rCLVsScxUOdEi9NWSOjy8vb+4dFDy99awxpbhLr4XhROXPLpzL8b9awySEAo3jOZvl7ln9pef1v4OmiuuEjSAqtoG4rkoZFipyxhJ9Jk9FVgxqVAoYPwFq1VwoQFccJVbfG+tqgbIIN+Kjtr7Vgxk/F8YEwi/azgWqbt7EptyH7YhZq+Hbj2BJkIMQtgwOt7P4enUdpgGFfQKn4wHsS+6TMAj2Sk3kKMvV1SdOE4WO35P0qj3xZ0+F8IHG3TuXT3fB2xDHzugrxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UJr+sDfY5UjFNKHoKr3oLlSegeSakAYmtUX0zjUBzRM=;
 b=yNmC8hHI58FfThq1HH3kOZkZF2ciSbwk2myqmmIK4RJlcwACe4wfgG/tvkImXZ3t4+lhLTR2A9/zeU3i4HZ3sswBq0RURshfndD716GiXc7XvdZxfuWP1Acf47gJH7yfEBuradPg1jWJNIRZiV9Iu4Gbawm66ZiftIcSdvN/Yo4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7446.namprd12.prod.outlook.com (2603:10b6:510:216::13)
 by SA0PR12MB4479.namprd12.prod.outlook.com (2603:10b6:806:95::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Thu, 25 Sep
 2025 03:56:22 +0000
Received: from PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7]) by PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7%6]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 03:56:22 +0000
Message-ID: <2f6c190d-aed0-4a27-8b20-1a4833d7edf7@amd.com>
Date: Thu, 25 Sep 2025 11:56:13 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/7] media: platform: amd: Add isp4 fw and hw interface
To: Sultan Alsawaf <sultan@kerneltoast.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 sakari.ailus@linux.intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 mario.limonciello@amd.com, richard.gong@amd.com, anson.tsao@amd.com,
 Alexey Zagorodnikov <xglooom@gmail.com>
References: <20250911100847.277408-1-Bin.Du@amd.com>
 <20250911100847.277408-4-Bin.Du@amd.com> <aNB0P18ytI1KopWI@sultan-box>
 <df5f52eb-0480-4d59-b930-e8336a993831@amd.com> <aNOZM2fj1X9TfZSF@sultan-box>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <aNOZM2fj1X9TfZSF@sultan-box>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR01CA0013.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::9) To PH8PR12MB7446.namprd12.prod.outlook.com
 (2603:10b6:510:216::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7446:EE_|SA0PR12MB4479:EE_
X-MS-Office365-Filtering-Correlation-Id: b2ea0e16-b87e-4f7f-c902-08ddfbe77dc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TWc5SkY4UmgvSGQrU3JHWWhUR2p6aGpMdmhCZnZXWXVpWDI3blhtN2tKZjZi?=
 =?utf-8?B?bTZmUnpGQ3YvY21VVitDOVhMMnczVUlsMkdyWWtmL01QOXhYeTlBcjZVU29n?=
 =?utf-8?B?RFhuR01meFg0RFl0bWV4Mis1bW96WXZGb09aQ05RUk1CTWdrN1V6S3FNQ01P?=
 =?utf-8?B?MCtIZ3NhT0RDbzN1SjZVakhmS0g4SFMzMTdKWis5QmpMSVVtRlZlWU9hYmFr?=
 =?utf-8?B?NmlsOXduWlV0WXlWSGY0disxMWZQekZmNzNxczhoRDJDMHd2L1piQjJIRWVD?=
 =?utf-8?B?TG5uU3dmSFFpK1laNURKNkRoazNYTEdaeE56bi9SalZ5bFNqWHJmY1dSVHVY?=
 =?utf-8?B?VUYyVWJ3TnVwNTgyaWdNbmhzcG5tTGdjeW8vMExxdjV0OEJUQkN1R0tJM1FL?=
 =?utf-8?B?cnJVQlVTWU9YSmxQNUFhQVBPeEg5Nm1mM2s2Sk1FSCt6RjFjQUI0LzJMaVlT?=
 =?utf-8?B?NDYwS3cyc3RqNUw2ZHZYVmdxb1paTVBLMmFKUkxudHo3NnZpME9rWXlLT3Nn?=
 =?utf-8?B?MkE5SGloWi8rTnU5SFdXWnBXdGh2NGE5N3V6V1NCZFVmazAxRFNUeFc1YWYx?=
 =?utf-8?B?MzYxN3hLdFBHOHNLd0d0TW1CcFhTVlE4WDdDWkZIYVZNRXRhRkY0UloxOSt0?=
 =?utf-8?B?S0JZTjgvcGRmNG1nTDJIalNzNlNzeThJbUMyUkhpL01YQXZGSU9qMFJGdDdi?=
 =?utf-8?B?T0Zxa3E5QnBFbGNXa1lnWldZZDRKZHJocU1iTDVvTGplZEFIbytTbVJCemEy?=
 =?utf-8?B?SU82WVJVZjJkY1lCVXVWSG1XZmE3QTF6Z2xRL2czUTBlSmtDLytJRGFBMEFC?=
 =?utf-8?B?Tm9UVGk2bmhSRVgvTUVyTU9DY0tCdkhSNUdEeVVCZnR5YmhlSWo2Y0g5eFha?=
 =?utf-8?B?bzZCVy9BbGV4SzFqOW5SNTJxblQvbjU1aGNWYm56S3FpemY1U0trUnRGQzVy?=
 =?utf-8?B?U3lGY25SNHYxVENuNEt4cXJvY0dXRkh4Tzlmd3JBQ1lISnpnb0k3Y3dGTStR?=
 =?utf-8?B?c1JENnpqK2lVRWxULzdXM01RUlc0WTFiZkVodWdDSmZiNVlTVExYc0pnV2E1?=
 =?utf-8?B?RXZHK2JjYk0vR1VxYXdOc2hPcHJid3hPbkN5Um9vL3VlVFNIWHRpSGV5RjhJ?=
 =?utf-8?B?MUFKYk14VVVUaUpPN1JJNEFDOU1ZbWxQa3JlZkRWa1RCcm5wM0xab2lmNzlM?=
 =?utf-8?B?NEx2VHhmMG9lZmlrOTJ2RkxyMkJ4UmZhMFNLa2lBV1AyTnVSVGFVN09CcEhq?=
 =?utf-8?B?RVIwNW9OeTVjNGtLQkRCbG1nNU56aUgySEdlNEFXYzZLVnFvSmxxQURQUzZO?=
 =?utf-8?B?cU8wOC9BYkc5RlVGSlNROU81V1NJMEFrdmtTdVViSHdEYmpzMm9YVXU1RXk3?=
 =?utf-8?B?WUdhUHdQamJSSXg3YkovL01rR2lqdDduazNtVDh2c0JNdnVDVTk0YlpFMEVm?=
 =?utf-8?B?bUpSUS9paG9yRVlOY1VTUEIyS3hCM1lKaWlmdk42Uzl5YjlRZW1QRmNIc25I?=
 =?utf-8?B?eTgyM0lvT0l3eHVrOUtWelVPc01FMGhuMXExRVBhVXFEUm1pMjlmd0dnYVdT?=
 =?utf-8?B?Wi9xUUJ4T1pyRGpTTlhWUmdVMEp4RHcwLzVJMUJubFpZQUZGbVJ4WG1rTlBo?=
 =?utf-8?B?OHN4MVV0MHFHa2FwRVdpejFoNXJBd29kQ01IYjBGVHdybnVFSFF0Y2xsR0Zp?=
 =?utf-8?B?eEcvK3JEbGNQaU50VjJORTBGdnJhdndRVW02NVV4Ukl4OTVnUFE3QndlTk9L?=
 =?utf-8?B?MVBSajh0WmhiSGI3bklDcFkzazZ1T3hGdWo1WGd3Ykx2MWd6TXBpblBRLzQ0?=
 =?utf-8?B?bGlvdHFZYzZzT3hoRUZuVXdHaXVMdGkrU1dmVTEzamdGVCtTNDRNS2VwTFBw?=
 =?utf-8?B?QzB4NmxqNTBmeGVjNUpIcjl2ZDRlOXkrcDdtUjdPN0xkcFlJSWwvZ0tQMU56?=
 =?utf-8?Q?RIHqa/b/t5n0h8+rOOmPNb/O8Ww7OgaE?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7446.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N1QyZFBGMllyV01IN0d5eDErTlBjWGFrMkpLcWxzajRGMnhYUkdGQ2F6RG5s?=
 =?utf-8?B?VllweWhJd3NQUE4zOTFFK0RWV0c4ek9lZHJUTlMwUWhrY1BlYU5QVlRpMUkv?=
 =?utf-8?B?ZEJ6ay92a01XUkxabGdZQzhSTFVsRmVlR1dBZlBBVnNHeEYrc3prUTdiNE5D?=
 =?utf-8?B?am80NU5pVlYyOXBXWFNKanRteWRQWXNjd28zWXQrcW5na29zUU9zcUpqbHlM?=
 =?utf-8?B?WERxc1pnOTkwaHJQQ3NOb1ZCNGpNRlBrMlJVd0lMYVRybnppZFRxRHVnbWRl?=
 =?utf-8?B?Y2IvcGR2ZUFDM0ZIUkxyR0Vnb3I4WXhNeDAvNmw5M3lHNjUzNjhoTmdYcjJS?=
 =?utf-8?B?aWJzVVo1Z0ZMT0gzVlF0WWZjamNlSG5CWXVTYUhvd1VjUGJJOW9mZ2NNbHVP?=
 =?utf-8?B?aWVzamZPWGV4MXlZQ2t2dlkwNU8rOG9sOVk2ZisyOGlUNitFdWRlNUNEZ21W?=
 =?utf-8?B?MVRHWk9pNTl6OVJDclBBV1R3RlZ4U0xrZjhFWnRMTEgxb0R4bWNzZXlpZzhq?=
 =?utf-8?B?a3VGNnB2V3Nva05OaFN5U1E1V090bGdSbG5qQm9TTmlIcEZIVW5mdkJWbzlN?=
 =?utf-8?B?UytTc1ROVllTU3haL2U3a3g4UGNENkkyNlFHVmtqZVVNMUxic1JPeEdJZUJX?=
 =?utf-8?B?VlFiMCtZLzhSWlUzdkExb3VEU0xOTTZQLzQwWWJIVGR6eVF4THdTbUhVK0sz?=
 =?utf-8?B?dVQvT3pGcU5BT29QWnF5SlBUVGdDdUU2M2dmbUM2NTZERUllRExIZGlMYXBt?=
 =?utf-8?B?ZnRyVjRrazlCaXN3NFJ2UjhoS2RTeGdaaWc1VzlIOVFibnNaS3d1ZktmbWpN?=
 =?utf-8?B?ZHhLNkFYSVBTYTJSN29LYnE1TnIvTDFzMnJvRGxwL25vbmxqQkRjaXpMRE1H?=
 =?utf-8?B?T3o3OUlhM3JJSEQ0UmloMmt1VlphdWJkWVNJcVJIM2NzL0R1VnRSQURkc091?=
 =?utf-8?B?eStUbUI5U0xWUkgzODJvNXMwWHpqTGQ3MC9HNEZObGZ5QkRRWGlWQ2JwNWxB?=
 =?utf-8?B?U2lkTytoSjI0WjZhN2FaNE0xU1lzMXViQno1WWxCamdOTDB4YmdjT3h2TDh2?=
 =?utf-8?B?dWwxSGthRkQyVnBSdGZaY2JCNXVYcTAyKzNoNjgzazRpaUZvSE9iTW1SN1FU?=
 =?utf-8?B?ckZJN0trTC80VzRLMFBmbzlsU2YrR0ZDaWNreTF1RExFY21PRDFuR0srNUd2?=
 =?utf-8?B?V1UrSFBMVStNYXBaYklRNnVmUVNhaUkrZXVDaUMzeUVGNUdzL2ZpbmpWcHpZ?=
 =?utf-8?B?alVCVmZDZHFLMjBYanV1SzJiS0xiMkt2RDdtQXhjcDNZdTdhR1ZaUEpZU1Zo?=
 =?utf-8?B?TkVPTkZVenlGV2x1QVBaSWl5QkJvR1JPQlRpNmxLbU5sbW1NeEJlWDdEK1lv?=
 =?utf-8?B?ZnRzN3NxREVINGhtY001bUI5akxYL09wZVlIZGlGYmUzUW40WDNLNFZMcDQw?=
 =?utf-8?B?T1pxM0pMOGRmV2FTY2FIV2o3dmM0M2JJZGpnN3VOY2dPOXlDM2NMaWtoUDR3?=
 =?utf-8?B?eENMT1EwajBEZGN6cHEwWmRUTDZObFVkRjNteG5aNmRBdXZGNnNSZFkvOUJY?=
 =?utf-8?B?MnRyRHcrZmxwZFhUN0c0bHZMbFRtWXV4WjhISE5RbTc1Y3JlUVBOT1JMNmpM?=
 =?utf-8?B?b1RibmpuT1BRUmlaaUZHSGlkQzF0ZkxkNlU0OGkxNGJvUzhuU2ZMMTh0OTli?=
 =?utf-8?B?S1dKdDNlTm8wdUI0bGtjRVBHK3Fkb2dXWFd6RU5FSW84NElVdFI0THZqZmZp?=
 =?utf-8?B?RHRtbGdIT1VwMm40RmlJNEVoMmRYVFAza29BZmNiUk1HMmdKaG8wYlRoclRX?=
 =?utf-8?B?WUxRZXpkOEZIczExSk8wajh1N3JIZ3pOaFZjRkZNMU5iV0w5ZEtkSllkOHZW?=
 =?utf-8?B?TUZFWFNPb3NRZjQwcmZSS3NoejJGNmEvZkwyZUcvTmYwUU1TNVBFNVBqdGdk?=
 =?utf-8?B?Tzh1S1FHZzdQbUNhYnFyeGZVR1FLNEM4RmFxeHJhRnY5cDltQzdEVGg1Q2ZI?=
 =?utf-8?B?dDZwSFovc0NxdmxuaHZ3dnQ0MkxRUXpYdGgrRCtuck9ZeTVFckcvMEdPeFlW?=
 =?utf-8?B?aUhGVGVOQ2diakNrc0FKWi9zNHBUUzZqcHUvOHJ0MmIrZUl2Q2ZINTZPWlBF?=
 =?utf-8?Q?Rclk=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2ea0e16-b87e-4f7f-c902-08ddfbe77dc3
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7446.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 03:56:22.5757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RX9OxeEwJqnmmQxHts68cjWeDfmqXnWfeGIfLZNqN848DGf0w54xvdboA80sRi3T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4479

Thanks Sultan.

On 9/24/2025 3:09 PM, Sultan Alsawaf wrote:
> On Tue, Sep 23, 2025 at 05:24:11PM +0800, Du, Bin wrote:
>> On 9/22/2025 5:55 AM, Sultan Alsawaf wrote:
>>> On Thu, Sep 11, 2025 at 06:08:43PM +0800, Bin Du wrote:
>>>> +	if (!mem_info)
>>>> +		return NULL;
>>>> +
>>>> +	mem_info->mem_size = mem_size;
>>>
>>> mem_info->mem_size is not used anywhere, remove it.
>>>
>>
>> Actually, mem_size will be used in following patches in isp4_subdev.c, so,
>> i'd like to keep it.
> 
> Ah, I didn't notice, my apologies.
> 

It's okay. Actually, it is not used in this patch, so I don't think you 
are wrong :)

>>>> +	for (i = 0; i < buf_size / sizeof(u32); i++)
>>>> +		checksum += buffer[i];
>>>> +
>>>> +	surplus_ptr = (u8 *)&buffer[i];
>>>
>>> Change cast to `(const u32 *)`
>>>
>>
>> Sure, will modify in the next version. I guess you mean `(const u8 *)`
> 
> Yes, it should be `(const u8 *)`, apologies for the typo.
> 

Never mind, just coding details, what's most important is the idea, 
thanks for that.

>>>> +
>>>> +	guard(mutex)(&ispif->cmdq_mutex);
>>>> +
>>>> +	list_for_each_entry_safe(buf_node, tmp_node, &ispif->cmdq, list) {
>>>> +		list_del(&buf_node->list);
>>>> +		kfree(buf_node);
>>>> +	}
>>>
>>> Move the whole list to a local LIST_HEAD(free_list) variable and then release
>>> the lock. Then you can list_for_each_entry_safe() without needing to do a
>>> list_del() every time, and you won't need to hold the lock the whole time.
>>>
>>
>> Thanks for the suggestion, seems that will make code complicated, e.g. this
>> is the suggested implementation in my mind if i don't get you wrong,
>>
>> void isp4if_clear_cmdq(struct isp4_interface *ispif)
>> {
>> 	struct isp4if_cmd_element *buf_node;
>> 	struct isp4if_cmd_element *tmp_node;
>> 	LIST_HEAD(free_list);
>>
>> 	{
>> 		guard(mutex)(&ispif->cmdq_mutex);
>> 		if (list_empty(&ispif->cmdq))
>> 			return;
>> 		free_list = ispif->cmdq;
>> 		INIT_LIST_HEAD(&ispif->cmdq);
>> 	}
>>
>> 	list_for_each_entry_safe(buf_node, tmp_node, &free_list, list) {
>> 		bool quit = false;
>>
>> 		if (buf_node->list.next == &ispif->cmdq)
>> 			quit = true;
>> 		kfree(buf_node);
>> 		if (quit)
>> 			return;
>> 	}
>> }
>> So, I'd like to keep previous implementation by removing list_del and adding
>> INIT_LIST_HEAD, so this will be the code after refine,
>>
>> void isp4if_clear_cmdq(struct isp4_interface *ispif)
>> {
>> 	struct isp4if_cmd_element *buf_node;
>> 	struct isp4if_cmd_element *tmp_node;
>>
>> 	guard(mutex)(&ispif->cmdq_mutex);
>>
>> 	list_for_each_entry_safe(buf_node, tmp_node, &ispif->cmdq, list)
>> 		kfree(buf_node);
>> 	INIT_LIST_HEAD(&ispif->cmdq);
>> }
>> It's much simpler, and based on our test, for command and buffer queue, the
>> elements in the queue won't exceed 5 when run to here, so the lock time will
>> be very short. What do you think?
> 
> This is what I am thinking (with cmdq_mutex replaced with a spin lock):
> 
> void isp4if_clear_cmdq(struct isp4_interface *ispif)
> {
> 	struct isp4if_cmd_element *buf_node, *tmp_node;
> 	LIST_HEAD(free_list);
> 
> 	scoped_guard(spinlock, &ispif->cmdq_lock)
> 		list_splice_init(&ispif->cmdq, &free_list);
> 
> 	list_for_each_entry_safe(buf_node, tmp_node, &free_list, list)
> 		kfree(buf_node);
> }
> 

Many thanks for the reference code, it's concise and easy to understand, 
will incorporate it into the next version.

>>>> +	struct isp4if_cmd_element *cmd_ele = NULL;
>>>> +	struct isp4if_rb_config *rb_config;
>>>> +	struct device *dev = ispif->dev;
>>>> +	struct isp4fw_cmd cmd = {};
>>>
>>> Use memset() to guarantee padding bits of cmd are zeroed, since this may not
>>> guarantee it on all compilers.
>>>
>>
>> Sure, will do it in the next version. Just a question, padding bits seem
>> never to be used, will it cause any problem if they are not zeroed?
> 
> Padding bits, if there are any, are used by isp4if_compute_check_sum() and are
> also sent to the firmware.
> 

Yes, this will impact the checksum value. However, based on my 
understanding, it will not affect the error detection outcome, since the 
firmware uses the same padding bits during both checksum calculation and 
comparison. I apologize for the minor disagreement—I just want to avoid 
introducing redundant code, especially given that similar scenarios 
appear a lot. Originally, we used memset in the initial version, but 
switched to { } initialization in subsequent versions based on review 
feedback. Please feel free to share your ideas, if you believe it is 
still necessary, we will add them.

>>>> +
>>>> +	ret = isp4if_insert_isp_fw_cmd(ispif, stream, &cmd);
>>>> +	if (ret) {
>>>> +		dev_err(dev, "fail for insert_isp_fw_cmd camId (0x%08x)\n", cmd_id);
>>>> +		if (cmd_ele) {
>>>> +			isp4if_rm_cmd_from_cmdq(ispif, cmd_ele->seq_num, cmd_ele->cmd_id);
>>>
>>> Using isp4if_rm_cmd_from_cmdq() sort of implies that there is a risk that
>>> cmd_ele may have been removed from the list somehow, even though the fw cmd
>>> insertion failed? In any case, either make it truly safe by assuming that it's
>>> unsafe to dereference cmd_ele right now, or just delete cmd_ele directly from
>>> the list under the lock.
>>>
>>
>> Good consideration, so will change it to following in the next version,
>> ret = isp4if_insert_isp_fw_cmd(ispif, stream, &cmd);
>> if (ret) {
>> 	dev_err(dev, "fail for insert_isp_fw_cmd camId %s(0x%08x)\n",
>> 		isp4dbg_get_cmd_str(cmd_id), cmd_id);
>> 	if (cmd_ele) {
>> 		cmd_ele = isp4if_rm_cmd_from_cmdq(ispif, seq_num, cmd_id);
>> 		kfree(cmd_ele);
>> 	}
>> }
>> The final cmd_ele to be freed will come from cmdq which will be protected by
>> mutex, so it will be safe.
> 
> Looks good to me!
> 

Thanks for the confirmation.

>>>> +static int isp4if_send_buffer(struct isp4_interface *ispif, struct isp4if_img_buf_info *buf_info)
>>>> +{
>>>> +	struct isp4fw_cmd_send_buffer cmd = {};
>>>
>>> Use memset() to guarantee padding bits are zeroed, since this may not guarantee
>>> it on all compilers.
>>>
>>
>> Sure, will do it in the next version. as mentioned above, padding bits seem
>> never to be used, will it cause any problem if they are not zeroed?
> 
> Padding bits, if there are any, are used by isp4if_compute_check_sum() and are
> also sent to the firmware.
> 

Same comments as above

>>>> +
>>>> +	guard(mutex)(&ispif->bufq_mutex);
>>>> +
>>>> +	list_for_each_entry_safe(buf_node, tmp_node, &ispif->bufq, node) {
>>>> +		list_del(&buf_node->node);
>>>> +		kfree(buf_node);
>>>> +	}
>>>
>>> Move the whole list to a local LIST_HEAD(free_list) variable and then release
>>> the lock. Then you can list_for_each_entry_safe() without needing to do a
>>> list_del() every time, and you won't need to hold the lock the whole time.
>>>
>>
>> Same comments as above cmdq
> 
> This is what I am thinking (with bufq_mutex replaced with a spin lock):
> 
> void isp4if_clear_bufq(struct isp4_interface *ispif)
> {
> 	struct isp4if_img_buf_node *buf_node, *tmp_node;
> 	LIST_HEAD(free_list);
> 
> 	scoped_guard(spinlock, &ispif->bufq_lock)
> 		list_splice_init(&ispif->bufq, &free_list);
> 
> 	list_for_each_entry_safe(buf_node, tmp_node, &free_list, node)
> 		kfree(buf_node);
> }
> 

Very good reference, will update in the next version.

>>>> +struct isp4_interface {
>>>> +	struct device *dev;
>>>> +	void __iomem *mmio;
>>>> +
>>>> +	struct mutex cmdq_mutex; /* used for cmdq access */
>>>> +	struct mutex bufq_mutex; /* used for bufq access */
>>>
>>> It makes more sense for cmdq_mutex and bufq_mutex to be spin locks since they
>>> are only held briefly for list traversal.
>>>
>>
>> I'd like to keep them as mutex, because 1.no sync with hard/soft interrupt
>> is needed, 2.Not very time critical 3.Make guard mutex optimization
>> possible. What do you think?
> 
> For very quick/short critical sections that don't sleep, it makes more sense to
> use a spin lock. A mutex lock is heavy when it needs to sleep on contention,
> which isn't worth it if the critical section has very few instructions.
> 
> Also, guard and scoped_guard are available for spin locks too, as shown in my
> replies above.
> 

Thank you for the detailed explanation. Really appreciate the insights 
and will make sure to include these updates in the next version.

>>>> +
>>>> +#endif
>>>
>>> Add /* _ISP4_INTERFACE_ */
>>>
>>
>> Sure, will add it in the next version and check all header files. BTW, will
>> change the macro name to _ISP4_INTERFACE_H_ to align with others
> 
> Good catch, sounds good.
> 
> Sultan

-- 
Regards,
Bin


