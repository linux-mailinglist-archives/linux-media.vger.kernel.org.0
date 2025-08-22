Return-Path: <linux-media+bounces-40706-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 085C0B30BCF
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 04:24:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C42E172836D
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 02:24:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39B9E1B043F;
	Fri, 22 Aug 2025 02:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="dOWc386y"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2075.outbound.protection.outlook.com [40.107.93.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3423D8F7D;
	Fri, 22 Aug 2025 02:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755829441; cv=fail; b=KmUF9jvFVKTHSOfwQAyneqc80Xy49cPF2RqsZ0N5fqUmcKOyN7VVoBhbw5gtukSdl7G0dnjxUmoqSeAVeCsTSV2eUVGmlIBUyAeVjsIeaxjbGGX/IsxhsRzKsZTcM/uSeBcJUj47eekMTp7DTrV1KHcr+swW3GdxC5m9475fziU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755829441; c=relaxed/simple;
	bh=6gJC4G2R+lZ9Bcsst34F9dsueHU5Luq4VeteoULYa2s=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CkimWiSj20iVvq6B/fRuYGf+fx7cqQrwquqO3GOXgV8786BgCXTxYvF8eKfy9NDTKa2yrchmXiR5aJUzr6z214gA63RrFBGLUU5tFUBGK0Q8YKiyVD9xj/5fxj1ZlLthLUk5mkIYEFxD9fZopYfblef5Z6j26Jysx4yPejPo0hY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=dOWc386y; arc=fail smtp.client-ip=40.107.93.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ttJERAoi5v6+/5lY7KeJfXAwYQMvmTkZbrd1/OGhznZ5QlqGenLaqu6keV3SCH/mzoOWY2eyN02ERBDlw0KVkS7a4EpsYnHALk26jMUt+bJpnjfWfwOOkycKi2gXHf2y1afSaxC5pkpw4j9QYFw6y5X0hRNxVfRULkeo3K2THV+loR+krgCE+dnvmng0ZGSgyE4idfZMUh+cIOh8Kc2LBFB8puMd1pc9towDcabSuQ7a4VNq4Serg3Kc05vhGLm4kbFSRfkbSVfAziXYYaJJyldf+9c+nuGOOVav5S8FdG0Pq6Dbr69rPpN2DpqIhHaM0ioqqwvXQjjO6Zloko/smg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hxX81wk6Lrg3lng7eOQ+MeF8ad2LreOdP1kXMvI6Y50=;
 b=XZjtYKcQfT7jdBl9PeLrdONeu9jJskw06MIWVVq2ylGWGHDV4N776baqnbF6YSdDgQiufnsi3De0/cwZS7EoeJPCi1favOhqRtTIL+qSj78rARSEQRKlWnimkGqtIEUKsgaNjIFQP3iJCEnEvDmYh42MtmrHEk7pHLTLs1UQqlbfHVHPKcnOdZrsQccPG1PwBLsR+8NazEB7gm6CP35NQ8wOcIe5B02+GXt2IauWIsVc+Ds0otkKHArZTTn6q2A7MDITYemQPm8cgv7isYYVtoOPaOmGozwrqx369iUEr2OPQE9OsXVyu5S7GGYbBNPGz7mSuQV17orrtb57NXhfzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hxX81wk6Lrg3lng7eOQ+MeF8ad2LreOdP1kXMvI6Y50=;
 b=dOWc386y+lfS/JbmIJeRky/MovYABWrtaeoJWgrTOtzBzE5dvEFsqy1FbZ8i4fzsjoT+/4HBrCvq3C85oVtnM/MAO3h7SSPbHsSw+BWKLhm4eJpbnqkS1VG0qkxA2I6HPcGmd1tdteeLSFKV1dqQ0ddK0TR2AxNu+BOb8AgjYtY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7446.namprd12.prod.outlook.com (2603:10b6:510:216::13)
 by PH7PR12MB8154.namprd12.prod.outlook.com (2603:10b6:510:2b9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.13; Fri, 22 Aug
 2025 02:23:57 +0000
Received: from PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7]) by PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7%4]) with mapi id 15.20.9031.023; Fri, 22 Aug 2025
 02:23:57 +0000
Message-ID: <ed9deffd-296c-465b-ad8a-314ed0968390@amd.com>
Date: Fri, 22 Aug 2025 10:23:48 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] Add AMD ISP4 driver
To: Sultan Alsawaf <sultan@kerneltoast.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 sakari.ailus@linux.intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 bin.du@amd.com, Mario Limonciello <mario.limonciello@amd.com>,
 Richard.Gong@amd.com, anson.tsao@amd.com
References: <20250618091959.68293-1-Bin.Du@amd.com>
 <aJ2H6CIyZvN8W2sS@sultan-box>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <aJ2H6CIyZvN8W2sS@sultan-box>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0155.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::35) To PH8PR12MB7446.namprd12.prod.outlook.com
 (2603:10b6:510:216::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7446:EE_|PH7PR12MB8154:EE_
X-MS-Office365-Filtering-Correlation-Id: 234d7332-6654-45fd-5b9b-08dde122f295
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QmdDK0FHcFhjS3phYU9USnV5MDVHODN0V21pVXRFUkVRUllQWXJjOWRjN2RQ?=
 =?utf-8?B?RFVlbFZRNWVtblR6aXlsZEM4b3hoOXc2bkNWazJHK1FtbXJwVXdBWjFxazNE?=
 =?utf-8?B?am13d1laQ0xBZkZCUXVURkl5YjYxeDBycU1tSzQwb0hZZTZCdjZzcVZ2U0NC?=
 =?utf-8?B?eTJBZnRGMGgxY25nZkJqS2hlUHE3OW82YnBhTFNMZ3hsdWpTUzZrcTNLY0ta?=
 =?utf-8?B?emNqSVJXajdSTXJVRDR6c2dkQVJQbzdtaHcrZUZIRWpNNml4c1BuNmprYW9E?=
 =?utf-8?B?NG5TalIxWVpQME5qekh6MGxqckU2RHQzRElWSlFQYmxZcDFEVW50ZWIvVVNo?=
 =?utf-8?B?dnBZQ0dZZXB5Ylc2S1pTU0tUd2Ird1g1Z2QrWmd6ckZxdEloblExUTJFK3h4?=
 =?utf-8?B?bXNua2NrRFNZSWx3VWR5cjIyMW1hbFpnRU5QdG42cy9RMXB6K3hnMXhnRG1Z?=
 =?utf-8?B?K2tsRzZRZjFVbVV4MzRxMENKWlY4UGREMEpNSzY1Y0pzTkxVOEdBRGczbVhJ?=
 =?utf-8?B?WW85Tk9VVTZocVpoK1Y4S0NkVzlkTmpCeE1neGhDa1pXeXQrVjhydE9wME43?=
 =?utf-8?B?amxJQTBEa245OVM2Ym5XZGhOa3NYSjFHZ2g3ZUVsOG1yS0kxemNkdFRZZTl6?=
 =?utf-8?B?RG05WHFPbVFVL3JXS3lLczdoZHJTUmEvSmFYMEpsYlY2UTFnNWcyWmc5Kzh5?=
 =?utf-8?B?MlZGY1JFQUJKOExocVlybzdzUWtkSlE0SHFXaTFZWGE1SUNVQXRmTDVNNE02?=
 =?utf-8?B?SWdQQlNpaUdLalQ3Tk1iWTBlbXc4Z0MxT2c4cklObGpab0NMdUoyNXRTYWRn?=
 =?utf-8?B?TXh4dFo5K2tjcTM2V0QrelpPQlczUzAzWDBFZmh4VGF1RXJvQkVKWFY3cXpw?=
 =?utf-8?B?MUdVOWl2TUdYZWY0NFpUZnpDalFvRlZUQlNKdFljS3IyUWxIT2gxZ3dNblJG?=
 =?utf-8?B?ejdnRDdONklnTXNDT2ZFUFBnc05zQVZ4UEpQMHlyaWF3Z0NXYUFvTEF0Wklm?=
 =?utf-8?B?TDhIUGxKaWZEek5OaUFTOHRzL2VGYWpLazR5TEh4SHlKbjc1QlQvUGthMFBF?=
 =?utf-8?B?OENWZ0YrdkVWSkxYRWVjT0FscCsvT3M1OVFMQ01iZEhkb0pFZm1YUkRGMFRm?=
 =?utf-8?B?TVkyQ3hhRGxUV3c5QVhHd2ZDb3Nza3QyWERrMnBwY3V1OXM5alhmMlFua21O?=
 =?utf-8?B?UCtJTE95TE1jTjZLcE1YU0tvL2orTXI5bGJ5VllxazRoNXA0QjNUdlhJSVFD?=
 =?utf-8?B?U1BCYjk3OENXTGJwL0dzTnZFcElHdWZtWjVBdFQxOFJUYVUxS0kxTlpFd3R1?=
 =?utf-8?B?NWN1VExKSXUwbmk3c21zbjMxTDIrSVFHK3QvYVE1TWhyRUdzOHV4cGxycFk0?=
 =?utf-8?B?QWg4bXY2Nks5UHNDTXpleExPOVNWWm82UFptcXo5MnRwWUc1NGFlV3dxUHVS?=
 =?utf-8?B?eS94WnkxY0ZkZmpTcTl1UlhJcEI4d1pGNW9FZzZBS3hCc0JkVkM1KzNoWVBp?=
 =?utf-8?B?WVdHU0YxNmZ4NzBEaXFJTzM2NUYxYzRNVTUrWlZwR3c5a3hKWWdwL0U1UjJs?=
 =?utf-8?B?dm8vSlBTNVEwdWc3ZVREU0UwSlB6Y1Frd2liUU40OXg5TjRXeHNJeHVyOGhk?=
 =?utf-8?B?c2xoNlpRRHNzU3JZbmJuMDhVNlNhTWxEeTZFeWI3N2hSRWh2d1lJS2RTamRM?=
 =?utf-8?B?L3ZGQ3N4RDNhTUFnaTVGTkYreUxVcWN5VmJMM29QakQrNjB3NmRSOWZ2RExj?=
 =?utf-8?B?OHN1UmlSSGJRcjJJODZNZ3IzRm1BeEJYUERSaHFETHUveEtCVlNvVFg1ODUx?=
 =?utf-8?B?Qk1RWTF1azlDM0lhbzFSRDFlR05FbCtCOFVvbWIvYXRDaWg2cExIc2RmZkRa?=
 =?utf-8?B?b0had0pOMTJ5U1U2aXZwaE5RYUVWWkxLeXpONDZDbEpjNHR5Q3ZEOGFjT3Zh?=
 =?utf-8?Q?R27C+i/500Q=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7446.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a0cxcDQwV1lNc2dHKzdoVlQ2VEdCQnNXMmQ4bHU2YU5JVW45R2xuWHNYTHdE?=
 =?utf-8?B?dXRpTnpUOU9GeFAxU002Mnp1SjdJQVZPWWphWitsMmlBbTBKR2FSd2t2YlBW?=
 =?utf-8?B?NERNcVFXN0lOZHVUOTE2K2xzZWlOYWx0WG5zVDRmV3lWOStlMkhIZW42U0hV?=
 =?utf-8?B?RVJnMXlJcmQxSnR3YTF0am1uZ0JjbVM4VUhOQjVNVW5aelhtZVZhbzlIR1Nk?=
 =?utf-8?B?TUt0b21xU1VsM2ZiaVkrOXVzMHVrSUxodXlVa1BKM1lWMlZUT1YrNnZuMjBJ?=
 =?utf-8?B?LzVtTDhjdXBJRS9WeUY4QVFBQWkrY1JaL1l2WU9IVmhOTnZBUDJvSVFDMGcw?=
 =?utf-8?B?bVd4K0Z1MUZEb24zL1lKNFlFK1hHdEFaQlBpb2RVbHdLYWtvSGxxNDlDRElU?=
 =?utf-8?B?YkIyeml4Z0JwUW40WEV1UGtoUnVjR2FHR3hmTXlpQlg2eDkva1JvNGpHeHhL?=
 =?utf-8?B?cUJrMHZiQjUwTERQTWF2dVBYNWk4T3k1ZWZUYUMrM1I1dVNyQ1daY05aUG5q?=
 =?utf-8?B?bmhwS09EbEIrdFhDdndTeVpLcXdvUXZzTnkvN3dCTGpYZ1hldHZSdko4b1d2?=
 =?utf-8?B?TWJXWG42SkZXcGhtODRRakJlSVdRMHBGWXRaT3BZUldzL2FVdFdRYVdUTVU0?=
 =?utf-8?B?VHlHSExaVzI4RlAvOGg1WXBvUUpuR3lRM3dCY0cybzNVVXp1bDVnT0x5YVJt?=
 =?utf-8?B?MjlyZGhqTFkyK0tvRHc2Wm8vNXVmWHIwalJYc2ZrdGdRSG1UbXRUM3JVRk8r?=
 =?utf-8?B?NlMzWjZWMnZJWXh3YWRMdzlZeVo0UUkvQmZUR2ZLSk5zeVp3WkIxYU8xand1?=
 =?utf-8?B?bjhkYmhXVjhWWTFXSjBENGlwTU1hc3N6OHBReGRPYTVITVhsZnhzR25rZ0t1?=
 =?utf-8?B?ZGE1NVVMZzFlczg0cDFoZEpkZjZUaDhWakJXSzJwSjl3aTRpb1JBdFpZTWNz?=
 =?utf-8?B?cEFyZjlFTTBmWWZPTGZmRmpuV2h4cC84VzNvTVBCN2piSUV0K0R4RmVROUd4?=
 =?utf-8?B?WTBkWlRRTmZETUpldzZPNjBCV1ZHS0lnZzNqVy9MVjNFNXBCWm1yd0lQeW8r?=
 =?utf-8?B?Z1RaaTcvTkc1NUdOck1YN3V6cUIvY1Jsdno2dXhEcWh3UjRKZ1VzS0t2a0g2?=
 =?utf-8?B?UTVadmphRndFK1VPTXFzQTM5NWQycDlXb0lIVkdTYTdTaEs0TUljS0ZBUk9p?=
 =?utf-8?B?OC9IS3h0VUpwcUg4ZnhtYXpBY3dUNDB5RHdUVGpTUTFJdUxrMVIrUEJpRHVG?=
 =?utf-8?B?aHFHY2lXZG1lUnJNaUdqcDRwZm5ZVmFTUEE0amRhREhxRzJ1dE1ZaUpVd3R4?=
 =?utf-8?B?eGlOeHQySU5SS0ZvYTF1WE5keE56Qm8rVXRRT0w3c0RUb0dGZGF5WGNLN1F2?=
 =?utf-8?B?dGVHdEc5M0lrZzl2Ui9laGs0aVNCVyt4NEptNENPTVlNTDRGL0lwRG1DT0Jm?=
 =?utf-8?B?VHNvRGxHUkQ1bGNVQ25MVUwrcjJLZFYyYkVTcTlUanlNWEY0V0haUkVBMld5?=
 =?utf-8?B?b3VRWUZ1dllPRkJLYjI1VXc4YWRQRXRxOTlnU09sOFJQWUVjWlVTYUVVb0du?=
 =?utf-8?B?QUpkWUpqdkZuR2Z5M3Q1VUxsWGhtQUVSUU5oeWdVRjVpaXg3NUJnb2UyYUph?=
 =?utf-8?B?dmg1SDBqYnRpeUF6NFFDRVpzTFhCWWNzd1FmNzByUVlubGsrYVJJN3dta09V?=
 =?utf-8?B?bEJkc2RzOS84RWsyanVpbTRKLzJzbEpBK0NpZm4zb2FJc2FheWowOGc4dWhn?=
 =?utf-8?B?cmtsbmFBS1h3Ym5rY3JDRlZHVlI1Um5zcG95bXlnSmZJL3dWWVNybzBvS04v?=
 =?utf-8?B?SHpLN24yMmluSzBVTHpnZmhDaWFsTjlnb2RjbGxUNmthMnNxRFhXSnZxNi95?=
 =?utf-8?B?NXJKOE01NGJzWk1JVFQzRzJhS1hWVTE3MktBMFhpNzdONklKRzNBVGl1c1dC?=
 =?utf-8?B?L0xzbUppZWVtczZDNkI2a3h1bk5DbGVJa255OWZmeUIrUkgxOWc5ZHEvdkZw?=
 =?utf-8?B?MVNrdEs5T3hnQzdnQmR0TUx6VkxrNHppNmtFSUdKZm9KajJpRG9YOHU4MlFK?=
 =?utf-8?B?eDA0bkZvRE13ZEpxWENDL01NZm1oaGl2dHBZYUxGVkcrcHhycUoyZjRmS1dE?=
 =?utf-8?Q?moIc=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 234d7332-6654-45fd-5b9b-08dde122f295
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7446.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 02:23:57.4539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sQ290sp36Y8gHzYPrF9s42QfqwiBq/t2s3G0kxDpgUHMFjy5Ot+DxM8CHqt0Y04s
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8154

Thanks Sultan for the suggestion, sorry for the late response because we 
spent some time internally to discuss the feasibility.

On 8/14/2025 2:53 PM, Sultan Alsawaf wrote:
> On Wed, Jun 18, 2025 at 05:19:51PM +0800, Bin Du wrote:
>> AMD ISP4 Key features:
>> - Processes bayer raw data from the connected sensor and output them to different YUV formats
>> - Downscale input image to different output image resolution
>> - Pipeline to do image processing on the input image including demosaic, denoise, 3A, etc
> 
> BTW, another problem I have which I would love some help with: may I get the FW
> commands for setting basic 3A parameters?
> 
> It seems like the default AE mode does frame-averaging, which is really
> unsuitable for video calls on the webcam. My face is really underexposed as a
> result during the daytime because there's a lot of ambient light in the
> background.
> 
> The webcam on this laptop also has a very wide field of view, which makes my
> face appear small and shows too much of the background. This also exacerbates
> the AE problem.
> 
> I'm thinking CMD_ID_SET_ZOOM would fix the FOV problem, and then either
> CMD_ID_AE_SET_MODE to change the AE mode or CMD_ID_AE_SET_REGION to set the AE
> ROI would fix the exposure problem. What do you think?
> 
> Thanks,
> Sultan

Yes, it's really good suggestion. Because current V4l2 doesn't have 
standard ioctl for like region setting, to support it, besides adding FW 
command, new customized ioctl also needs be added and no existing APP 
can benefit from it. So our idea is not to add them to our current 
upstream driver, but we would be really glad to help you to enable them 
locally with dedicated thread, suppose it can help to improve the IQ 
with correct input setting like the correct ROI region, but we aren't 
sure because we didn't do that before on Linux and would really expect 
your test result and feedback.

-- 
Regards,
Bin


