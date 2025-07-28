Return-Path: <linux-media+bounces-38531-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6023CB1376D
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 11:24:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A7DF1776A3
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 09:24:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8A1822C35D;
	Mon, 28 Jul 2025 09:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="nlrSTHZc"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2040.outbound.protection.outlook.com [40.107.94.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866D821CC49;
	Mon, 28 Jul 2025 09:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753694690; cv=fail; b=VxBuCwu6edZ/hdBoiZaCXBkfuAKf93di/8CoAJmQn4f90G1ai96CSWQ+FhlaL1fcX9aFTW6blu+z0E6lD6BHzLdKIc0RRePY3ft7FbKDOYQdB10x3bXspOVBFkwdbLlBMlVE7bq5eX03ozY7FXolRK7Iep4cjD9OrCbDobODPyY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753694690; c=relaxed/simple;
	bh=OYKXM+qT3uO0zDh1Hnf1Cn396qD5SR2EgQiyiqNObkw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NZYUvwmq+NfmjnFpu0Uplsmw9GCbIq0Yw5u8fOdv1s+wHumQHRLpsfMCs2R1mcZjh/HLPuda7oeDLJPmG1fCgf/FOy03dy0BYAsnSQURLgLPqxRjzVOde7Ky18h+fdoSBKkOXH/9BVjg1YjEUije5+tZhD4dQPlcSAhEeHKbcsc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=nlrSTHZc; arc=fail smtp.client-ip=40.107.94.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vhX4z/6izJyPYHtJU3jongqfB/TMBQwjnW5nE2b1e0ZVB2HO6oJadwCIGdXUeQRXS7ew2+BMmbevouS40Vn2+DfqaPpPWt22mY2m4nx+9sKQVC7AxDjknNgFJIhQk75fzZGqJynS5BZ+458yr7SqJmpS2JZlHMUDtStb8q+DWfoehTW5Y1tIFGt0EoFqeE0fkg3268FXaHsMBBO8xE5HNefIYtmOMf3HdJOuw2iPcy/YxxBpMg3F/amWEiN29LWADJpLgsi1upFaDt4+iwvIcRgI9szgAjNKratucBhhR/PqBJgRY2etQ1J6bzAkRkhjK/MiK5Ix/Jw9IcpZWJyH0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qI9z+g3JCcT/++CYlDUhbFqMTKTjYmfiy3aE7bd8v38=;
 b=k7OTCiEt3nNYZ8GiRKr568exfDW6rtPCHU0iMInK21thOAFNRodifH7ibKuhEAdJ4gZndM5fLdUZ4uj/Xuv66l1Vh7HYUkWpgn8x/FYzwM/IgLlX2zMoKEz7u1RDeRSaE6wDhFJuNcv7l0DWfd4mgNa1gI0l6sLCq+KGGPgoeKhESaZOtCQVWDQ2Z0n76jDUgY9eIDkXioYvcV698jF6wxNeVbH1yWAoB5jq2G0PJURTHotCkfNwLtzUzqHWX8W5+CG+lY8y9hM6Z9dotl18cgwFhdL8vWK4PRfmYlZLvk9gpQ9F/YVN8nPupqwfZX6nikNR2Wnox2ZoKeIfH4OS4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qI9z+g3JCcT/++CYlDUhbFqMTKTjYmfiy3aE7bd8v38=;
 b=nlrSTHZcwN6ZcWkWYoXpSvJIfRoZmeshVHu6cAOG63Nn+eSfPHNnN/7mwMiQ+mSezxi0UfxdQFNJpJR7k5kSshVBfdGT4d9ftDKJSWhAxHrle4CDf2k+RP3xl5GtIonhg76LD9fljTuIdu3IGDioX2SjQaV5dsiDdtUli6Tmo6M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7446.namprd12.prod.outlook.com (2603:10b6:510:216::13)
 by MN2PR12MB4392.namprd12.prod.outlook.com (2603:10b6:208:264::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Mon, 28 Jul
 2025 09:24:44 +0000
Received: from PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7]) by PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7%3]) with mapi id 15.20.8964.021; Mon, 28 Jul 2025
 09:24:44 +0000
Message-ID: <13d80da3-ced9-4304-8036-78668a4bce88@amd.com>
Date: Mon, 28 Jul 2025 17:24:36 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] media: platform: amd: low level support for isp4
 firmware
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 prabhakar.mahadev-lad.rj@bp.renesas.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, pratap.nirujogi@amd.com,
 benjamin.chan@amd.com, king.li@amd.com, gjorgji.rosikopulos@amd.com,
 Phil.Jawich@amd.com, Dominic.Antony@amd.com, bin.du@amd.com
References: <20250618091959.68293-1-Bin.Du@amd.com>
 <20250618091959.68293-3-Bin.Du@amd.com>
 <aIcRTapInMVSIkx5@kekkonen.localdomain>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <aIcRTapInMVSIkx5@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2P153CA0007.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::8)
 To PH8PR12MB7446.namprd12.prod.outlook.com (2603:10b6:510:216::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7446:EE_|MN2PR12MB4392:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b75d355-b84f-4707-6090-08ddcdb8968d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bjNFaElwNVhsR1k2emtoeFZTSnE4SFlYVkFaL2d4OEdHaHF1SlFWRGpQOTNp?=
 =?utf-8?B?aHREVmR2anBDRnZDZFdWd2xhQ0RXWngwR2FJcXlrUi8zZEdjTldxdlQ1ZVJN?=
 =?utf-8?B?ZklKbFl2NjdmWXhVVzdiZUZIOStLVVRjMTNuRkUzYjFuV2xkTW9pUFdFa0hi?=
 =?utf-8?B?d1QyT0M2WHFUSGZTSVFIUXhtYW9ROVE0Z1Q5V0tRTVR2d2FNeG9ZQmRqdUFF?=
 =?utf-8?B?TzQvRmJvQnFVekU0V1VsWVV0SEdpUFdwOWtTUDVZVXRJV3UrWVFLSkcxUzMx?=
 =?utf-8?B?WVRyVENPRGJ1QS9VSGNZY0FqQVNkbUFWVTNVb0pudkNpU3lQODNJRXI1VUpM?=
 =?utf-8?B?bzZCRkxqbUNnMlBjcWM5cnRMR2pNNFVja0h2LzVNYkpwb1FJOVd6ZmJiQmRU?=
 =?utf-8?B?alIzM0QwV0Y2NmpEdUxhTUcvYmI0ZzVaZ3ZCNXBOWFRpc1RmdGFJYVV3OFo3?=
 =?utf-8?B?aWJCSWQxM1JicTFYdFVZb1I3N0xNYk9IWkVIdFh6ZWFJbjBvUlg3Mmp1aWRG?=
 =?utf-8?B?cytTYlZDMldJeldmWDRUVGd6aE9NSEJxbGdhcS9Ud21GOExBMWU1Q1laUTg3?=
 =?utf-8?B?bEJYR0QvZVFKUTQ0aDJMSUh0NjVNMWNTWE5CS0dnd3VJakgwdjJraGR5Vkxz?=
 =?utf-8?B?NU84QTdaRG5aSmppM2FNZ21xMmFrNWNwcFBTOEY2M0JCWFNBdEVkbFcwWFBp?=
 =?utf-8?B?MmN5VzF2cGlEaTY5cStQZzdTcmlKS21FK3pEZDNHV3NnUlVpZzZnb3ovZFdW?=
 =?utf-8?B?UHhLdy84NUVBOXpiUHZtK0YvbW9VdjFXdWt6UzVZZmgvUHhYVFdtNldtay9R?=
 =?utf-8?B?NGh6NzcxYnI3d2RKSU5RZUlvYi9KSGd3NmI4WnoxWCsrb1N0YWNDMkcxT0Jp?=
 =?utf-8?B?ODZkUG40Y2ZFZW1BMC93Q21ZY3BUNG0yUERQNkVmOTNiMytoRjB6QjF6NGtT?=
 =?utf-8?B?RWR1dmJuZmZ4RmsxNElHOFdqTnJIcGZLblNHeVI4RWNhaUxzR25QVVo4RTdW?=
 =?utf-8?B?K1NwWSt3OU10NU1zSnQ0N0JtanhzbXZobzBlR0YvaXo3SU1MdUdhcVg3THJN?=
 =?utf-8?B?NjZYNXptRU5ybldGUUJUYjhGYnpJVVNRbkt5VC9UdDVuZFQ5R3BZZHNnYUhP?=
 =?utf-8?B?UXBFWUxKdlhhWEEwOGY1QjJ0TlVRRVoyYWFtWWNDNnI2R3ppUzlleVhocHJt?=
 =?utf-8?B?SzVBbkNoMC9LWG1rUExROHo3akFPNk1DN240UVpCK0llL3o5VE1qUWdpS3pj?=
 =?utf-8?B?WGg0YU5kcDFvaXErT0NGcHhvc2hERWRJTGlMT0R3VFI5dkl1NW9tQ3hOYUV5?=
 =?utf-8?B?aTlWSlh2dG1RUzFSWndKMndMa0lXVjZjenhia1Z2eDJQVktRbWFQUjV1M0Jt?=
 =?utf-8?B?V093QWY0Z0NsTTAyckw0WGU1N2kycUdNYS9IRzR0TUw4S1FQU016Ujg2bjNa?=
 =?utf-8?B?OFA2a3RCQnBsNjlWZFY0eDM4dWlyM0Z0d2xwZ1I1aHBOU0FiSkZrbEE1Kzhv?=
 =?utf-8?B?YWxRRTRsaGREdnNsRENEbzlDZ0NTRTB1QjNDaUtyMnBPLy9kNmtsYzVFR2RM?=
 =?utf-8?B?cmpkcXRmSmxHZDVZWVVNdFVUekVqaXp0TlErOEhRWVppU3lMeVRJSncvM3FT?=
 =?utf-8?B?RkhzbHh2Njd4R3ZNWDlQNkR2dGNmTlkxYkZOdGpvQUhIYTdYSmpVVjI2cmFC?=
 =?utf-8?B?YitnQmlmMXB6R1c0bGNPNmtNRlhzVDVWdDE3NEUrQVJlMHdOQTFad0NUR2Jo?=
 =?utf-8?B?ajFUcWhTcktSellQWnNvbXhmZ093dm1mekNtbm5SS1NWczFUbFpSL1F3eCtE?=
 =?utf-8?B?U1Y1UzRQbGdPQnZGSTZKNXl4ejVlWXhpRnE2ekMrMkFNa09hYmFiWHhocjZj?=
 =?utf-8?B?ek9tYjFvbEVlVXo4bzFjOGlGNVZ1bllBNGxCd1l0VTZEVkdmUUxiSFRuV3gr?=
 =?utf-8?Q?dbj/mqiM+Bs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7446.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ODRkY3ZBdUhFeFo5Syt5UjRFeXJrWFlWY1BIMWh6cHJJRnB3b2JjeWh6TVNx?=
 =?utf-8?B?UjBQbGVjK0JuM3ZtcHhLQTBFYnhPYjhKZG8yK3NtQXlmcGJDZFYzb1kxcita?=
 =?utf-8?B?QWE3MXFsNmt6VTdEc3FOeGs5bW10MzZHaVR4WjJpS2xiam5jcmprVmRxN3Zk?=
 =?utf-8?B?a05tOFZhSVp3cG5zWDFlT0pHWmE1WGhzejUyWlhqajZBTjQ1Y0xyYzFEd2FE?=
 =?utf-8?B?RnJEV3NhdGQ5YTEzOWFZSW94VUJVakxFc3RneUgvNEdXWjZ2TnFqMW1xVzgy?=
 =?utf-8?B?VkhZYXl2T21EZllvL3pnamd6SG93czVuYUFBaW93bFV2bFhVZnBZeHFMck5i?=
 =?utf-8?B?czVTa1EwTjBrRC9NNDJjSUtoQmNsM0s0S0l3OXF0ZzhJS1BZdnlwYzhiL1dU?=
 =?utf-8?B?Q09LL3JaaEx0Q3dNZTR4ZnA4QU91ZURCOGkwVkhvVkVReGlJVmowSDAxTXpY?=
 =?utf-8?B?UnF0RDB5N0tkZVd4YmNKcjVlZHVyRGY3Z3FFaFVDZERLa1kvVFRpUnFnREZB?=
 =?utf-8?B?YzBLWGg5eCtCNURVeHk4eHBWRU9VTTBoRHBCMmZvdkYvaWxTZ0FxVGtFcUpo?=
 =?utf-8?B?WnNWUWxCVTlPSW9WTWtvZEo3eFo1REhROVIvUitwM01qcTUzZFpuRXpwL1Zm?=
 =?utf-8?B?b2FHdG5CVjZIb2Y0dXRCK3plWVNtV1U2UlpQdm9PbkxWNlNtZmE0UzY4dkZU?=
 =?utf-8?B?V2YreEFQeGpIRWErRlNzdFNWYWFkckN3Ly9wUGl2S2d4MU40RVRtcFZWUHBu?=
 =?utf-8?B?ZEkxdDRpMkdhSE1vaklwbDJHcUN1UTg3SE5ndW1PNjBEbUNKQzdZMXI0Q1Zp?=
 =?utf-8?B?ai9uVGNFQjQ5UUFXWFR2T3ZNSHVDVUhRc0daK3JSeFBIdnZBRFowbVNlR01v?=
 =?utf-8?B?bG9icFAybmU1cnplalVrcWpaMDZRbE5YRUZJNnowOGZGNlBuUmxETmFCMzVa?=
 =?utf-8?B?a2c1Tm5PeWhWTWJ0cVdPOVJyeTkyWHJyVTNWZmVwUUVpdk1iM05NaW9EUDhB?=
 =?utf-8?B?eVBUUVYrSFM2UXNxVFpseno1dVZ4SFhTQkd5N3k0Y1FoV25tWjFXSCtBejJ0?=
 =?utf-8?B?a1B5b1hWMGNqMUNzdGlhTlJVOE44Ri9Hc3pNOTFkTTNmbyt5UG1XZ0JQM2xM?=
 =?utf-8?B?cTMxcENYYmpGVXM5WWJkek54U3dpTVZJTXBHY2RoNW1HcEZMVVFLdGRtMkdN?=
 =?utf-8?B?ZFRxeDRKZ2dFcUJ3ZnllVUZ6dStOclZCMVJndmxhSk9wQkZPazdZMUg1VXg5?=
 =?utf-8?B?WVA1MHNwWWhkSGtNNjRSM2dSWFdvZUQzUDJ3NHNmVmMvR09Zei92ZUI2UFFu?=
 =?utf-8?B?bEFiVUI5STRteWcwbWdIbFV2cFJDTDg2bkMvSEQ2NlVtSytkUDNJTnR4UUx1?=
 =?utf-8?B?TFY2SEk1UDV0MVFwVURubkFRNDBxcHY3cHdlMktFNXFlTGQ5b1YreStTZjZR?=
 =?utf-8?B?UWk1ZUtqM2h3K21pRldTcVlmM2MxdDd3Zk4rVzRiY3czTS9aTkVKOGZDT3Rn?=
 =?utf-8?B?TUFtam1vYVdPMkhPM0g1T3F5Vmt6Q2UwWUtyKzc3M1VxK1dFZFk1aVIrUlBm?=
 =?utf-8?B?c2xKNGJsL2FjL1FTRy9OY1BTTW1HOVMxRGlCaWlGUVFxRCtwb3lraDVzOGtH?=
 =?utf-8?B?NlMwUWdVQUk4MlVKQmFaRFBUTkxGa0NVWHJoZWF4SjB2NysvcjhzTUNoZGl0?=
 =?utf-8?B?OCtmcGJ2NDJ6eTZSMnRMdDZTa0VmSFljZzBtZ3NMV3dCWVZtWHQrV0hrVWJz?=
 =?utf-8?B?NDBadEJPV012MVhqQjdkSzZEeEVBUklGV1NkRkFhK1prNnJxcGFYUVVYRXY3?=
 =?utf-8?B?bkRMUHFXYkNHYlBMcWU1NVkvSXRGcGFjNTByaWZOd250eVcvdzA4UUFOZ3FG?=
 =?utf-8?B?QzdkQlQ4WXJ6WG56UU9vVit6NmZSZmVKSDJjeVNRRWJmZ2ZMTkF1VS8zOWRp?=
 =?utf-8?B?b0RuVzhrWCs5ZUpnYkR3Ulp0RHMxaFlFVjlmcENKY0dFOUJ1ZU1CcjFPcE5V?=
 =?utf-8?B?bFVQVXUrajRlVmFtK0tZaU1weEY4SnZ5aVF5ZGhFZExxaS82STg0ajJPa014?=
 =?utf-8?B?MnljNDdkTE1kWU4zMmVlZi8yanNWandBK1orKy9SZjZTeGs0LzVHSlgzR0FP?=
 =?utf-8?Q?nMtA=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b75d355-b84f-4707-6090-08ddcdb8968d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7446.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 09:24:44.2992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4fIHXSd1l3zpXpMTWNDSE/cuUBaE+QOZXTbMgzCJHZnGPpwtqgbrhw+YkOYVaNGH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4392

Many thanks Sakari Ailus for the review.

On 7/28/2025 1:57 PM, Sakari Ailus wrote:
> Hi Bin,
> 
> On Wed, Jun 18, 2025 at 05:19:53PM +0800, Bin Du wrote:
>> Low level functions for access the registers and mapping to their ranges.
>> This change also includes register definitions for ring buffer used to
>> communicate with ISP Firmware.
>> Ring buffer is the communication interface between driver and ISP Firmware.
>> Command and responses are exchanged through the ring buffer.
> 
> Please rewrap this, the third line could well be longer.
> 
Sure, will do in the next patch

>>
>> Signed-off-by: Bin Du <Bin.Du@amd.com>
>> Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
>> ---
>>   drivers/media/platform/amd/isp4/Makefile      |   3 +-
>>   drivers/media/platform/amd/isp4/isp4_hw.c     |  46 +++++++
>>   drivers/media/platform/amd/isp4/isp4_hw.h     |  14 +++
>>   drivers/media/platform/amd/isp4/isp4_hw_reg.h | 116 ++++++++++++++++++
>>   4 files changed, 178 insertions(+), 1 deletion(-)
>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_hw.c
>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_hw.h
>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_hw_reg.h
>>
>> diff --git a/drivers/media/platform/amd/isp4/Makefile b/drivers/media/platform/amd/isp4/Makefile
>> index e9e84160517d..8ca1c4dfe246 100644
>> --- a/drivers/media/platform/amd/isp4/Makefile
>> +++ b/drivers/media/platform/amd/isp4/Makefile
>> @@ -3,7 +3,8 @@
>>   # Copyright (C) 2025 Advanced Micro Devices, Inc.
>>   
>>   obj-$(CONFIG_AMD_ISP4) += amd_capture.o
>> -amd_capture-objs := isp4.o
>> +amd_capture-objs := isp4.o	\
>> +			isp4_hw.o	\
>>   
>>   ccflags-y += -I$(srctree)/drivers/media/platform/amd/isp4
>>   ccflags-y += -I$(srctree)/include
>> diff --git a/drivers/media/platform/amd/isp4/isp4_hw.c b/drivers/media/platform/amd/isp4/isp4_hw.c
>> new file mode 100644
>> index 000000000000..e5315330a514
>> --- /dev/null
>> +++ b/drivers/media/platform/amd/isp4/isp4_hw.c
>> @@ -0,0 +1,46 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
>> + */
>> +
>> +#include <linux/io.h>
>> +#include <linux/types.h>
>> +
>> +#include "isp4_hw.h"
>> +#include "isp4_hw_reg.h"
>> +
>> +#define RMMIO_SIZE 524288
>> +
>> +u32 isp4hw_rreg(void __iomem *base, u32 reg)
>> +{
>> +	void __iomem *reg_addr;
>> +
>> +	if (reg >= RMMIO_SIZE)
>> +		return RREG_FAILED_VAL;
>> +
>> +	if (reg < ISP_MIPI_PHY0_REG0)
>> +		reg_addr = base + reg;
>> +	else if (reg <= ISP_MIPI_PHY0_REG0 + ISP_MIPI_PHY0_SIZE)
>> +		reg_addr = base + (reg - ISP_MIPI_PHY0_REG0);
> 
> Redundant parentheses.
> 
Sure, will remove it in the next patch

>> +	else
>> +		return RREG_FAILED_VAL;
>> +
>> +	return readl(reg_addr);
>> +};
>> +
>> +void isp4hw_wreg(void __iomem *base, u32 reg, u32 val)
>> +{
>> +	void __iomem *reg_addr;
>> +
>> +	if (reg >= RMMIO_SIZE)
>> +		return;
>> +
>> +	if (reg < ISP_MIPI_PHY0_REG0)
>> +		reg_addr = base + reg;
>> +	else if (reg <= ISP_MIPI_PHY0_REG0 + ISP_MIPI_PHY0_SIZE)
>> +		reg_addr = base + (reg - ISP_MIPI_PHY0_REG0);
> 
> Ditto.
> 
Sure, will remove it in the next patch

>> +	else
>> +		return;
>> +
>> +	writel(val, reg_addr);
>> +};
>> diff --git a/drivers/media/platform/amd/isp4/isp4_hw.h b/drivers/media/platform/amd/isp4/isp4_hw.h
>> new file mode 100644
>> index 000000000000..072d135b9e3a
>> --- /dev/null
>> +++ b/drivers/media/platform/amd/isp4/isp4_hw.h
>> @@ -0,0 +1,14 @@
>> +/* SPDX-License-Identifier: GPL-2.0+ */
>> +/*
>> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
>> + */
>> +
>> +#ifndef _ISP4_HW_H_
>> +#define _ISP4_HW_H_
>> +
>> +#define RREG_FAILED_VAL 0xFFFFFFFF
>> +
>> +u32 isp4hw_rreg(void __iomem *base, u32 reg);
>> +void isp4hw_wreg(void __iomem *base, u32 reg, u32 val);
>> +
>> +#endif
>> diff --git a/drivers/media/platform/amd/isp4/isp4_hw_reg.h b/drivers/media/platform/amd/isp4/isp4_hw_reg.h
>> new file mode 100644
>> index 000000000000..b11f12ba6c56
>> --- /dev/null
>> +++ b/drivers/media/platform/amd/isp4/isp4_hw_reg.h
>> @@ -0,0 +1,116 @@
>> +/* SPDX-License-Identifier: GPL-2.0+ */
>> +/*
>> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
>> + */
>> +
>> +#ifndef _ISP4_HW_REG_H_
>> +#define _ISP4_HW_REG_H_
>> +
>> +#define ISP_SOFT_RESET		0x62000
>> +#define ISP_SYS_INT0_EN		0x62010
>> +#define ISP_SYS_INT0_STATUS	0x62014
>> +#define ISP_SYS_INT0_ACK	0x62018
>> +#define ISP_CCPU_CNTL		0x62054
>> +#define ISP_STATUS		0x62058
>> +#define ISP_LOG_RB_BASE_LO0	0x62148
>> +#define ISP_LOG_RB_BASE_HI0	0x6214C
> 
> Lower case hexadecimals, please.
> 
Sure, will modify in the next patch

>> +#define ISP_LOG_RB_SIZE0	0x62150
>> +#define ISP_LOG_RB_RPTR0	0x62154
>> +#define ISP_LOG_RB_WPTR0	0x62158
>> +#define ISP_RB_BASE_LO1		0x62170
>> +#define ISP_RB_BASE_HI1		0x62174
>> +#define ISP_RB_SIZE1		0x62178
>> +#define ISP_RB_RPTR1		0x6217C
>> +#define ISP_RB_WPTR1		0x62180
>> +#define ISP_RB_BASE_LO2		0x62184
>> +#define ISP_RB_BASE_HI2		0x62188
>> +#define ISP_RB_SIZE2		0x6218C
>> +#define ISP_RB_RPTR2		0x62190
>> +#define ISP_RB_WPTR2		0x62194
>> +#define ISP_RB_BASE_LO3		0x62198
>> +#define ISP_RB_BASE_HI3		0x6219C
>> +#define ISP_RB_SIZE3		0x621A0
>> +#define ISP_RB_RPTR3		0x621A4
>> +#define ISP_RB_WPTR3		0x621A8
>> +#define ISP_RB_BASE_LO4		0x621AC
>> +#define ISP_RB_BASE_HI4		0x621B0
>> +#define ISP_RB_SIZE4		0x621B4
>> +#define ISP_RB_RPTR4		0x621B8
>> +#define ISP_RB_WPTR4		0x621BC
>> +#define ISP_RB_BASE_LO5		0x621C0
>> +#define ISP_RB_BASE_HI5		0x621C4
>> +#define ISP_RB_SIZE5		0x621C8
>> +#define ISP_RB_RPTR5		0x621CC
>> +#define ISP_RB_WPTR5		0x621D0
>> +#define ISP_RB_BASE_LO6		0x621D4
>> +#define ISP_RB_BASE_HI6		0x621D8
>> +#define ISP_RB_SIZE6		0x621DC
>> +#define ISP_RB_RPTR6		0x621E0
>> +#define ISP_RB_WPTR6		0x621E4
>> +#define ISP_RB_BASE_LO7		0x621E8
>> +#define ISP_RB_BASE_HI7		0x621EC
>> +#define ISP_RB_SIZE7		0x621F0
>> +#define ISP_RB_RPTR7		0x621F4
>> +#define ISP_RB_WPTR7		0x621F8
>> +#define ISP_RB_BASE_LO8		0x621FC
>> +#define ISP_RB_BASE_HI8		0x62200
>> +#define ISP_RB_SIZE8		0x62204
>> +#define ISP_RB_RPTR8		0x62208
>> +#define ISP_RB_WPTR8		0x6220C
>> +#define ISP_RB_BASE_LO9		0x62210
>> +#define ISP_RB_BASE_HI9		0x62214
>> +#define ISP_RB_SIZE9		0x62218
>> +#define ISP_RB_RPTR9		0x6221C
>> +#define ISP_RB_WPTR9		0x62220
>> +#define ISP_RB_BASE_LO10	0x62224
>> +#define ISP_RB_BASE_HI10	0x62228
>> +#define ISP_RB_SIZE10		0x6222C
>> +#define ISP_RB_RPTR10		0x62230
>> +#define ISP_RB_WPTR10		0x62234
>> +#define ISP_RB_BASE_LO11	0x62238
>> +#define ISP_RB_BASE_HI11	0x6223C
>> +#define ISP_RB_SIZE11		0x62240
>> +#define ISP_RB_RPTR11		0x62244
>> +#define ISP_RB_WPTR11		0x62248
>> +#define ISP_RB_BASE_LO12	0x6224C
>> +#define ISP_RB_BASE_HI12	0x62250
>> +#define ISP_RB_SIZE12		0x62254
>> +#define ISP_RB_RPTR12		0x62258
>> +#define ISP_RB_WPTR12		0x6225C
>> +
>> +#define ISP_POWER_STATUS	0x60000
>> +
>> +#define ISP_MIPI_PHY0_REG0	0x66700
>> +#define ISP_MIPI_PHY1_REG0	0x66780
>> +#define ISP_MIPI_PHY2_REG0	0x67400
>> +
>> +#define ISP_MIPI_PHY0_SIZE	0xD30
>> +
>> +/* ISP_SOFT_RESET */
>> +#define ISP_SOFT_RESET__CCPU_SOFT_RESET_MASK			0x00000001UL
>> +
>> +/* ISP_CCPU_CNTL */
>> +#define ISP_CCPU_CNTL__CCPU_HOST_SOFT_RST_MASK			0x00040000UL
>> +
>> +/* ISP_STATUS */
>> +#define ISP_STATUS__CCPU_REPORT_MASK				0x000000feUL
>> +
>> +/* ISP_SYS_INT0_STATUS */
>> +#define ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT9_INT_MASK	0x00010000UL
>> +#define ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT10_INT_MASK	0x00040000UL
>> +#define ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT11_INT_MASK	0x00100000UL
>> +#define ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT12_INT_MASK	0x00400000UL
>> +
>> +/* ISP_SYS_INT0_EN */
>> +#define ISP_SYS_INT0_EN__SYS_INT_RINGBUFFER_WPT9_EN_MASK	0x00010000UL
>> +#define ISP_SYS_INT0_EN__SYS_INT_RINGBUFFER_WPT10_EN_MASK	0x00040000UL
>> +#define ISP_SYS_INT0_EN__SYS_INT_RINGBUFFER_WPT11_EN_MASK	0x00100000UL
>> +#define ISP_SYS_INT0_EN__SYS_INT_RINGBUFFER_WPT12_EN_MASK	0x00400000UL
>> +
>> +/* ISP_SYS_INT0_ACK */
>> +#define ISP_SYS_INT0_ACK__SYS_INT_RINGBUFFER_WPT9_ACK_MASK	0x00010000UL
>> +#define ISP_SYS_INT0_ACK__SYS_INT_RINGBUFFER_WPT10_ACK_MASK	0x00040000UL
>> +#define ISP_SYS_INT0_ACK__SYS_INT_RINGBUFFER_WPT11_ACK_MASK	0x00100000UL
>> +#define ISP_SYS_INT0_ACK__SYS_INT_RINGBUFFER_WPT12_ACK_MASK	0x00400000UL
>> +
>> +#endif
> 


