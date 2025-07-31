Return-Path: <linux-media+bounces-38692-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D88B16EB5
	for <lists+linux-media@lfdr.de>; Thu, 31 Jul 2025 11:32:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0A30A7AD053
	for <lists+linux-media@lfdr.de>; Thu, 31 Jul 2025 09:30:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0565729E0FB;
	Thu, 31 Jul 2025 09:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Nc9kt1Ai"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2041.outbound.protection.outlook.com [40.107.212.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4092298991;
	Thu, 31 Jul 2025 09:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753954332; cv=fail; b=DQOrE1E/Xz21vMubtWGw4fLNoauNFyDLRLdzJibuz6KpdCbBpEaTWPyzJqEkbnXStyeAvlKj0mRDlR5K/5o8O0oeKr84zDpsV8YdcE52ufKPh01dEzOi6R0IYHUOlk208nL6djW9s5W0vU+rQrmD2zKvHWr4TjKbaDfXhC2GGIs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753954332; c=relaxed/simple;
	bh=L66JxiEJ5c/26uFowP8KRpjKrikL+W8iO8ZtUBLfYtY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=h0M9J98pk7Y2XevtV7Y7eV3DtI0+osxDtyzelYcI6hKuvwuT4N+n7OI92AOlWLGiNm4hi+N/7ceqLaQs9ZDbuiSmccSFkfANzEw+huXtHTINuzP6bV+mpxYSMmg8WjhcdanXWwuvlk54hB23Bwu0P+Gk0qR1pqltclHOUqmi5Us=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Nc9kt1Ai; arc=fail smtp.client-ip=40.107.212.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i1ZS2vB0zc9cznd6euosjiiA/A5usXaG4R/y15h+Nd6nm3FBmevLgN/qhlsYcoZuFUagjt2hYM4DHwcy1jr2Wj5WoS73JqPdP3CGfEC0miEzcE3dPI3ehVlchkYLmoGcL7w7NCrKoy31hLP+Lv5F/S5xZrzZUt75lY7bHviqt61Q5rvQoEmVi7rbzOfl3qR6luOUsERQVJ6Xx/aNXXMjiE1bdVbdCiqvGdTsHKsSIegDraaHwDELNK7dGicMw8o5X8Xml5rfc37vu15k5GH2JqrOXZ8TsqTedVjr1evKSvK8eqnchqxMWQ5pXSEqCYpl8o9BNlcY1A0BgLEswGxghg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SRvWSIPlY9Cbqd2HN1TOYIRUB1im9JV2KnsTyq1gFqQ=;
 b=ZHs5X39FM2H7mSpFb9ASFhiTCzEx3fhCRNwGpLcDHcj3BZ+d6Cffx1HgxEZt+sQKJvj6qSQ6rGBT3+vcigcnhlvRsiecUAj1+RPJS0zsm/hKIWR/P04L2hvI76+0+7TRbTqgKM5ubaOjvMR4ebESXJ5jPbjY4vhx69Y0gkhYsRmVzG4Gn5ESKOXE/l+TRxO2RHraCimtlY4qYIGSPX2C14kLt0KYzLOjjjUYCulQwV9BD4WmP1L/bLolcme+8H/q7fCJrNMG7irtebjyKg211KNhxzujU64ufquxsJ5H62Yzf5lmetzs+4lKjJLJ/8T6x2HiWezBj/fEKDAoYrwqdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SRvWSIPlY9Cbqd2HN1TOYIRUB1im9JV2KnsTyq1gFqQ=;
 b=Nc9kt1AiYuHGHLdXkvRYcZE4QC6GlE2OhEDtnoob0l8/qCNEJNHFCqM7foA8F7tRz+DOpXKEnttpuzHy67mLx0DPwBsO554qhEkbTo/jdGgt4oPenANrub/Yb1tTB1FdXZEvJwGMSU8ND/hDhhsHcy159JRsPZ6zOrllsuXHK58=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7446.namprd12.prod.outlook.com (2603:10b6:510:216::13)
 by PH7PR12MB8825.namprd12.prod.outlook.com (2603:10b6:510:26a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Thu, 31 Jul
 2025 09:32:05 +0000
Received: from PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7]) by PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7%3]) with mapi id 15.20.8964.026; Thu, 31 Jul 2025
 09:32:05 +0000
Message-ID: <4406c439-6d46-4166-b2d8-1243a540c4e7@amd.com>
Date: Thu, 31 Jul 2025 17:31:57 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] media: platform: amd: Add helpers to configure
 isp4 mipi phy
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 prabhakar.mahadev-lad.rj@bp.renesas.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, pratap.nirujogi@amd.com,
 benjamin.chan@amd.com, king.li@amd.com, gjorgji.rosikopulos@amd.com,
 Phil.Jawich@amd.com, Dominic.Antony@amd.com, bin.du@amd.com
References: <20250618091959.68293-1-Bin.Du@amd.com>
 <20250618091959.68293-4-Bin.Du@amd.com>
 <aIcmmLi_pNGAYYtN@kekkonen.localdomain>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <aIcmmLi_pNGAYYtN@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0050.apcprd02.prod.outlook.com
 (2603:1096:4:196::11) To PH8PR12MB7446.namprd12.prod.outlook.com
 (2603:10b6:510:216::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7446:EE_|PH7PR12MB8825:EE_
X-MS-Office365-Filtering-Correlation-Id: cc1d6beb-38ad-4a26-b0a9-08ddd0151ca5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V0NjbTZmUDA0QzF1M1JibUJ1OHRMdnc1NVNNMFF5VjVLUVVYYWR5MENNYUJk?=
 =?utf-8?B?RFV3di93WTg3L2ZDcDk5TkZZbXA0TS82WVpla2FIdnZkRlRVWHAwTHNEQ2xz?=
 =?utf-8?B?OW5HNXF5cDcrU0Zid1UwSFkvb1BOOHBiNUhBb0NoMVRoaVBMR1JkRDBpaGVJ?=
 =?utf-8?B?MzhlbGlvR1U2dWpwWnB2a2h3bDlmL0l4M1ZVUzVEMUtNeWFSODIxK1ZIUU1M?=
 =?utf-8?B?SkxRaHI3eDhMNlBaMGRuYlNBTnZYY25MRWFTRTcvZGFtMXdydGxacDlNSHJI?=
 =?utf-8?B?KzZ3MFdYZy9aY0R6T0llQ3hQeTE0bGd4b2JrRDAzSk1kUzJVZXhLNFdocTA2?=
 =?utf-8?B?Si9IZHJWbjlCZ0hJTmRQQzlUS1dRdEh6UHp0UlpKNkRQSnFzWjlJZlRMMmpE?=
 =?utf-8?B?ak1OQyt1QzhBTjZWTFJFdzF5bDlxejA5QzM1aFJJQUw2U1ZWNHJ1bFFiSG5T?=
 =?utf-8?B?U0pIS3lPbUZ2cHo2MnZLZWp4TTNjL0VoVkNrLzkwenErNlIyVGJIazZHVEZ3?=
 =?utf-8?B?Y05JQU8zeGVZeHZudzRCYnUzRTRzN1puLzBJRDRES3Z3RGk3UWgzZDhRL3po?=
 =?utf-8?B?MmpZY0V6bFk3anJObXd0a29KUWJTUVU0d0FVTVZkK3d6ek8vQXQ1TzFXd1U5?=
 =?utf-8?B?TGdtNnI4RlFHNlVkTlpQUTZua3lDM2pFdGxoMXVGRXdBNFNISUhmUWROSitH?=
 =?utf-8?B?YlJIZ2toT09UU2hWNHg0dFNseDZ1RW5GbCtldGRkK2Z0ZC9naDVIV3lVN0g1?=
 =?utf-8?B?cG9CSWJiYnpHS3dTQmhmZXp5d0JzaTh1TDZ2Q1FoRXg2NHgzam5lNGJTa0R3?=
 =?utf-8?B?bUw2NnZCR3JQMnNHSUJJbW5iWlBmZWsyNlF1TEJ0NXcxeHorVGsxMEtyTWl0?=
 =?utf-8?B?OVRwM2syNlBYMGRGQThUREl1QXpLVkVTRXBnK1hVN2JJdG54OXVwcFUwWUZy?=
 =?utf-8?B?U0tadzkxeFhPNnRJYW9DZ3F4cDFvMHVxWTBtbG1ISEl5V3BUNE9sMVNJTFNI?=
 =?utf-8?B?NjJ4Y0Y3QnhRUXducjBOUE10djNZNHU1NkVZS3Q5ZTFLWTljTTIvVEZtVGt2?=
 =?utf-8?B?a2l4Y1phekVJTm1IdDNTQnpKUS9sQWRSUWJSSzdqUmdoclhOZkdLcisvTkFw?=
 =?utf-8?B?QTVPU0Q5RjdsVzRSZEE4S29aWTZSVm5zSjVuUFlsSHg3d0NHcHRJaVNxeWZN?=
 =?utf-8?B?alFzNkQyUTBJOFE4WXhXY3N6bHZTT3RYRVdxK2Rza25oZ1EwWWRtb0FWbFBt?=
 =?utf-8?B?amNqaGNSQk1zTlh2cmo0Ti8zb2wyakpaRnBDcGRyMmd5c1p1SExPd2s3TEEy?=
 =?utf-8?B?YTNTZkhMcUM5VUdPUFd1ZFVCeFFJZUx4VHlybkJJa3lHMnRBWFF4eXJ1WE1m?=
 =?utf-8?B?VXFMQjdBcWdpVVBDMVlLVlJaQXRjNTJUQmNWZzZaS25aUFVnemMwU2MvWWc3?=
 =?utf-8?B?dlREV0hWS015OEJYOTR6bmRsWjRpT2FFVW1zTGhIZlpzTkJoTlFwanR3K3NP?=
 =?utf-8?B?emRQTDZCR1JhS3g2bllTS1NySm9xZWdVWFVYNFpjOFd6ZlhPM1VjNmRROFpo?=
 =?utf-8?B?VGFtYTY1YjFPU00wek9rTGV3a21JcThEZmdPQ3dFUVk3WFFqNndTVzVrL0lm?=
 =?utf-8?B?ZDBPclNwdTNxeVJQT29PQldDcGRCZm9nN0dIWGVqdTcxQ213djI1MjRBSVo5?=
 =?utf-8?B?eXNNZ2xrN3BDbXdkWkMyMmp0ekRCQXk0RkdkeGNnaEVsVWx5WmRudTJYc1RK?=
 =?utf-8?B?bWpra2VDSmU2aGpKNGRWV1ZERXZvUFhtWWRXVWlIUnBqUlJGenhDSjhuQnFq?=
 =?utf-8?B?UUpmakZDRzBuZ1dGY3VEZ05SdVZBTVY4Mm51MkE0Yk1yU3c1RHlVYTR2VTZT?=
 =?utf-8?B?SWN2QTRzWmxqV25YVkx2cnJtd2Uxa3p2TWpBWEk3Kzg2UjVqVjh1a1JqOGhM?=
 =?utf-8?Q?h37yk64oK08=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7446.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OU1DTHNER1VjYUlHZlA3aWd1eU1meWFtSisxNjM0VVlrWENRMXhFdytDUkdZ?=
 =?utf-8?B?S1RXT2Z0SHFvUTBwdFhiKzhlTmZrZEp1UHRENVZCMjQ0bExnaDdrMUtKVGFa?=
 =?utf-8?B?bnhuZUh2UVIzaW1HNUVxQlNFWmdlbGJ2YnJRYXpmaStlYU1FK1FPSXVjRGVo?=
 =?utf-8?B?d0tMSjd5YlM4RmRtRUVsa09FZGdNUU9KdjF4emtwTVlCTlJYd3o3VDZLWUMy?=
 =?utf-8?B?cDhQYXowMUYzLzlkQUE4L256eTRKc2xRU1NuejJmK2lpd1FhczRaRENWRUl2?=
 =?utf-8?B?Zy80L1lHUCt1bWdyWEc4REJ1WVFZVldBSi91ZTR6UmxrTHRBaVEvRjdvWWJY?=
 =?utf-8?B?WmhLK2dDeVBjS01lRU8ycnErZkp4T29SSnB5dllkdUhGVFp4VTVRcnM1djZ2?=
 =?utf-8?B?V0lrN25OTWxyY2ZIRWc3eEhhU1BZeWtvMFpWakhsZ2hYWjJqdWJsUWFXcDFh?=
 =?utf-8?B?SmtqN1RHaStjZlYwRDEwMjJiK1FWZzYxU0FaalNYUjZ1OCtZbk5wYlQ5Zmpn?=
 =?utf-8?B?K29PSTdJZTl0K0RRbFNONzdoc1NmZUNPQmMrRnU1OHdZbnVsOG5Wb3VxT3VZ?=
 =?utf-8?B?UjJmeTdJVlN0d0RCT1FGcjRPbklNOGpnNjdSQmc4SGxiNk5DdG56akZWVzFM?=
 =?utf-8?B?dnU2a2RHNVpiUEVWaFJ4Y0JTT0ZGMElZdlB6MUpSWVpGM3NjM0NzOFZTWWQv?=
 =?utf-8?B?K3U2dUtIbXRNcFh0REhqbCt4SHYvUnAxTS95aHQ5V0JNcjB3TENNSnhJYWRG?=
 =?utf-8?B?ZVdxdzBkN1NTRzdZdGJnZGtETVVqSUYwWldYN29XTlB0c25KWG1QbU50T3or?=
 =?utf-8?B?c2RnZnMxcUtHblFIQkNvMGtlblZ6L2xVZU1iNVU1dDhuU1J4Q1UvS3JETHhm?=
 =?utf-8?B?ZFlzcEdWRC9rN3EwZjlGTTFhay94UHJLL1hqdUlGeEtUblZlMm1ndlcwWmRY?=
 =?utf-8?B?K1RSclZ6alBnblZmNkhTa3VLV1Nya0VFVnR0SDc2YTFuWlI5NURaYVZ2eHNN?=
 =?utf-8?B?WFpWQmhhVG9xSjVrNmRJbTRIa1d5aEtQbVdXeURIb083NFNIdmd5TmdmRnpm?=
 =?utf-8?B?SE1sdE9kL0xlT2NhdHFXL28rYTZpcXNZeGxoRFRta3k1UjZudzJtYW5Ea1Qw?=
 =?utf-8?B?OWQrSmlhYnZ5TUo0dVVRN1I0S3gzNHoxbmRPN1lvVzZtQnc3L09BTnIyU2xW?=
 =?utf-8?B?MHVIVFIrakVFMUN1L3NWQ1JNK1Q1bWFjbnk3TDhyVEVEdlR2MHBCQkVOTUFH?=
 =?utf-8?B?cG9KR3JpMUg5QmJ6TmFQbTBxb09RR1VWNjd1K2d1VXVoV3VXUG1oQVE0QUNn?=
 =?utf-8?B?a0RmY1FYUkpjZ3JVVnorMlpFRGpjcGNjR1V2RzR3S1A0djc4TGRVaWt2MFhH?=
 =?utf-8?B?U3UyRlVKZFl5SFloaXE5KzI0Ym4xZWRFcC9MQ0EyZ1hUNXlZUE9IQmpSYkht?=
 =?utf-8?B?djh6bGdna1Y5RWN3NEtOb3kwenkyTGZ3Tkh2cnRxMmhIOVU0VThJTUhOazNK?=
 =?utf-8?B?dHcrL0xESVlYc0lJaHhDUk1BQXJGaXY1RlNHMytRdXMvdE9FTE5zQXk2Vnpo?=
 =?utf-8?B?cUdFWmQ3N085bUVtUjdEQklkbDlmNzRySlFVZnFTUlZ4RDQ2TTVZRTdPbDc0?=
 =?utf-8?B?Mkc1ajRidE9RR1NKdkpZQUM2Y3kycUpWUXJva1BVUkhrYWlBQ0hEQ1orU3lh?=
 =?utf-8?B?NGFGU0pRVWxLUXFJQ1ZvSjUvdStnamtGaFZ1Q0V2WVM2bXJLL0U2TGR1cTFl?=
 =?utf-8?B?MVQvcWJSTjhJcy92eE4rTHllNkpCT01ialk3SFk4V3Y4akRrSkRtSUFDYjNk?=
 =?utf-8?B?QTMzZlljMHdMdFk3TE56dy93ZkdYeE5yblM0NXA1TUtrT0VOTnlrbXZXaUlw?=
 =?utf-8?B?UFEvNlRzWUFKdEwxMDJ2WXZiV0FUUExleGdFa0x2RHpQZUJzcDFLTVVtM2k3?=
 =?utf-8?B?b3J5L1lxYjBxRDd2ZEFsMFVyYzY1clcwMktXajFuZFVkVUl0NXE5c3Z5RmNp?=
 =?utf-8?B?ZGdzcUFWOXZ3SnNONnY0Y09ZaE1NUmRsZjNYY2pDUDkxQ0VjZHV5UzFnQkl6?=
 =?utf-8?B?M0dkSUlnOEFPMDhGY3JaaVI3T1dXcC8wcXdmRmNRVURSc0laSHdQUE1PL2dp?=
 =?utf-8?Q?Ihuo=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc1d6beb-38ad-4a26-b0a9-08ddd0151ca5
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7446.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2025 09:32:05.3749
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8h2AKIgw+xsYbpMS0Hp2IfAjV64IfojnZk37zJ3QH9F0kcPQFnD14rmnyLev6TKv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8825

Many thanks Sakari Ailus for your review

On 7/28/2025 3:28 PM, Sakari Ailus wrote:
> Hi Bin,
> 
> On Wed, Jun 18, 2025 at 05:19:54PM +0800, Bin Du wrote:
>> +struct isp4phy_mipi_reg_seq {
>> +	u16 addr;
>> +	u16 mask;
>> +	u16 data;
>> +};
>> +

[snip]

>> +struct isp4phy_mipi_reg {
>> +	union isp4phy_mipi_0 isp_mipi_phy0;
>> +	union isp4phy_mipi_1 isp_mipi_phy1;
>> +	union isp4phy_mipi_2 isp_mipi_phy2;
>> +	struct isp4phy_mipi_3 isp_mipi_phy3;
>> +	union isp4phy_mipi_4 isp_mipi_phy4;
>> +	union isp4phy_mipi_5 isp_mipi_phy5;
>> +	union isp4phy_mipi_6 isp_mipi_phy6;
>> +	union isp4phy_mipi_7 isp_mipi_phy7;
>> +	u32 reserve;
>> +	union isp4phy_mipi_ind_idx isp_mipi_phy_ind_idx;
>> +	union isp4phy_mipi_ind_data isp_mipi_phy_ind_data;
>> +	union isp4phy_mipi_ind_wack isp_mipi_phy_inc_wack;
>> +};
> 
> One more thing. Is there an endianness issue here?
> 
> Overall the CPU endianness may be big or little while the device endianness
> is little, presumably. You should use __le* types and functions to convert
> the endianness when dealing with the messages to and from the device.
> 
Good consideration, no endianness issue here because AMD APU is little 
endian x64 arch which aligns with the device endianness, so, no extra 
conversion is needed

Regards,
Bin

