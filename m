Return-Path: <linux-media+bounces-23370-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AEC39F097C
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2024 11:31:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 46E301657CD
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2024 10:31:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC1281BB6B8;
	Fri, 13 Dec 2024 10:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="DI1J6c5z"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2041.outbound.protection.outlook.com [40.107.243.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916FB199947;
	Fri, 13 Dec 2024 10:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734085856; cv=fail; b=sjX0MW0Da9qDsw2NSJn4MecYdIDI37BFnUJZwaAbWBwCwPD8oWeRWEqeiWu/zcJ2/lFfIQqDJXLOSLvI4jkEYRpeBCs4ZaZEgZp8V2QeW6dbvwkPW000StdVcTJAlNqlGWoI66nBGeghY5LqgPjAOrI6z8TCfQqGrLpZHBi0+NQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734085856; c=relaxed/simple;
	bh=fFDQhUzXkeQnhUAiWRDcTLLyMNgqyBzPl7DA6dzkWtw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WCuo34MSw4Q12dG3I2NMSOwOlEJnmqRP7P6VBEzLmtdZ2DCWEfawk46z2MNtIXzIKEX3CNOOTcE1EpkuUQ0+iEkPj8zmiPVgP9tn6rot98xFETA6YaVpgTL3Hz/cDRLLCQJVA2BZFglQSAse6c4qe32sw5EpFv31GWuVR1xSzmE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=DI1J6c5z; arc=fail smtp.client-ip=40.107.243.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SsiZ/t6vetZDr30aEE4WUq25NvXrKbsezD4dVV1dIQody4ppuLJAc+Mt9+7bII3X/FSIepAvN1DikMObzK+YrVjN80d63imEXA48Q+6rgXGXi1bq8K/3/H03fzwyPk9CPq+Lo4KjCmY6o4Eh/eHbRYeCJFlI+QF1KWLOhFyGApextqGLdFBEvGQbqXbEh69ET3dCuHcOtYOYY7A3A8iQT/J+N8B08WSvxNSFqhbP8ImuXv8B0GD/Lex4PaZJ9c8eFoSGPcP15cdiWLXWpEPjwIvrWH0HH4oQWvF2jqCnD2lqzRJhCdWIzpw8bOqHTXbFV4LgRYKLph08vUAh0L1kxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d9zGC3Xq6c7fCCUsmexSFc9d2aXSQR2EfP27g9ek4Ds=;
 b=nr4SBHMPHTRqKXK2k8uGRSCOUDw4l/1UCIx/2Idje8l1u7o2RABoso3SGTNVdSc4tCdPNv0gdYD1/xVTFFjJSGJgb+Vy0DpCLauSU0yBGyNxrGFrqFD547QaYsU5qRKu/AAjlXg1UsosRDbkkOdpTloCy5r+j3iub7srxEliZ9k05Zj2nuRaBz1oujIhwZmvAS163DE0dNc9VB5FxE5+3Xev/uuzbZNEAdWsxJMjFGzFlFkgpculMTiwVD8EogLmpHemi2HdJSJfXicvcWa5shW69PhuB/UWanSVQ92pXXm4V2yqjKIFiqYZjmuGlXsqjf1AuNhCUZEWyiPcRPGT9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d9zGC3Xq6c7fCCUsmexSFc9d2aXSQR2EfP27g9ek4Ds=;
 b=DI1J6c5zcbB+PIOVZ41UOaUwrdgcjAPc2oXU/kG35CMX6u35sxFP0C4RGZkOqnUcuMrvfZxLP4D9A7+Pl4xIfD1MFHel1rCSAOkPfTghridKPSsNLauM/FWtdbKuSX6M+Dz977viz7Tcfv/+qjrKzt6Qi/7qLR/O/0Y5SkvC2iE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by IA0PR12MB9046.namprd12.prod.outlook.com (2603:10b6:208:405::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Fri, 13 Dec
 2024 10:30:52 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30%5]) with mapi id 15.20.8251.015; Fri, 13 Dec 2024
 10:30:52 +0000
Message-ID: <05ce02de-6eed-4f28-8052-56ca9cac4b64@amd.com>
Date: Fri, 13 Dec 2024 11:30:38 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: ov5640: fix get_light_freq on auto
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, monstr@monstr.eu, michal.simek@xilinx.com,
 git@xilinx.com, stable@kernel.org, Sam Bobrowicz <sam@elite-embedded.com>,
 Hans Verkuil <hans.verkuil@cisco.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Steve Longerbeam <slongerbeam@gmail.com>,
 "open list:V4L2 CAMERA SENSOR DRIVERS" <linux-media@vger.kernel.org>
References: <2e79be9185cbb0dbe40e670eee996cf290bab0a6.1732264079.git.michal.simek@amd.com>
 <Z1v2VRzgUVpHZvXR@kekkonen.localdomain>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 3i3l5DA=
In-Reply-To: <Z1v2VRzgUVpHZvXR@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0127.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::11) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|IA0PR12MB9046:EE_
X-MS-Office365-Filtering-Correlation-Id: f4c3438c-5efe-43e1-3a69-08dd1b6137e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WTE4bXVXc3hkQTU5TW9hWWY4Qm4xdlB4dWV5ay9LbFZCYld4RmJTSUdpTnNh?=
 =?utf-8?B?SUNuZlpFWlBrTTZPdHJuSDl2aFFiYUZVYVN0d2NTNU8reWlPYUlGeVFrS2NB?=
 =?utf-8?B?ekpyS3NUeE8zd1ljdVN0VC9oZEhRKzBVam1jR1AvL3NCSy9wUE5NbzRndUFF?=
 =?utf-8?B?VldNVjBZVk8vd2FPbnlGNGZGeDJrV3kvbEZNUldUL2s5NVhpTUJSMVBvUFJH?=
 =?utf-8?B?LzZQY1hnQmJCNHdMRS9nVW44NjVGS3NhUk5XU1VhRnM4cDRJU0FpcVNXRzBo?=
 =?utf-8?B?aUtjMkU0SHUxR1FDQjh2THNEY2IycnBxazJLTjI5eFYyZVpDRGxHS21rUHUx?=
 =?utf-8?B?cVFpYWtrS2Eyc1VENFVIblJaWHlPTEx2dnRiem54MTRyWlV6TW5jcG1YOE8z?=
 =?utf-8?B?bFlnejhsdE8zWkVyUnRuYUViS1JwaXdPZ0p2cGhlVkR3TUpxWk9lNzV3L25m?=
 =?utf-8?B?V3JHQ2trZVRzc3pHa3ZDUEx0cjhZTG91cWRVRXRVdGI2MjVUeVM4czZqTTl6?=
 =?utf-8?B?Sk5zR0VZWEJRM3ZWdmdaMmlqTk5NMTdkTE9icjNOUFJoY2Ixd08xekN5MFJR?=
 =?utf-8?B?bEhGMUJmSURFZDI0T0F6K0dVRFF6enFGaDhuODNCaXFvZnRFK1p0QWZ0R29w?=
 =?utf-8?B?SnhxdmZDcXowZ2MyRDMwZmUyTDhLdUpYU3hDdGg1VEtxN2JJeHJGU05rY0VW?=
 =?utf-8?B?Tkh3LzhvSlcxYlhiOGNkVmJDYlBwbFFyVW5lZGp4bGRJY2prY2YzNDl3a2JB?=
 =?utf-8?B?SCtyTnZNYllKNmV1NVRJNUVpRjh1WjAzYlN5SDUrVDlDSzRqbWxIZmxLR2do?=
 =?utf-8?B?YlM4OXU5QlU2SXFxbkE2ck11amF3WUY1VkVVTDQzYWdMR1A2aEhHYTZNUjdm?=
 =?utf-8?B?bUI0T2pTWjFNOExOYXgrdmYrU09QVTR1VFJ3bU9lQmc1b3JjK2hsaXM1THp6?=
 =?utf-8?B?VHQ1UkJVRWI2dG5MeHpBM2hZOEZKaDVVTUJBSlVKVGZjcUYwWFA2SGJsblhx?=
 =?utf-8?B?MzM1alZ2dWk3Sy90RmhDbWNTSDJzRG5TSEo5Wk00Q2ExUU5aZDdWdzVIbjE0?=
 =?utf-8?B?VVExa3pLaHBucHF4em5yaTE4RHRQY2RlZjQ3SUZTb2tycndJdml3ZWNqSXU3?=
 =?utf-8?B?OVdWWXdLa0NEQU9Ecy9iam1JQ0NMTGJMMUpHSklueGN4dmw0ZzJmdThGcktm?=
 =?utf-8?B?azFhMG8ybGRpd2pSUUZoaDZtYmptZnpHaUdNUEV1QkpWOTRXVmlOQXRSTnYx?=
 =?utf-8?B?QUx1cWx1SjZleDRzVndoaUpQZU0xZTFtc085a1NsdWhISXdEcnA5clZxa29Y?=
 =?utf-8?B?UnR6UG5YUUJTenVpT3Y5dEZuVEp1YWFlR0dWS2dTaEFBVTEzR00zWjdDUkdC?=
 =?utf-8?B?ci9xa1VBVWlNb3pkWkRUZDVEU3c5WHVOc2JsNHF2emtUaE93Y1FWbllCNm1w?=
 =?utf-8?B?QWVKek9SY0RCc0dSdkROT1BEcTJkb25BSXhQeDdpbW45OWttNVZGUEhCTTBj?=
 =?utf-8?B?WlVsbnloT3NZQ1RVL0NFQ1UzVnJSdE42UDNraER4cHpNajVoU2xkYlRaRVJM?=
 =?utf-8?B?YlFiMTVvek0xaTRtcVI3dXgwY0luMjIyODZya2tpZlIrQnQrSWdHQS9BMnRU?=
 =?utf-8?B?QjRiRVFwTEZKeWhlb25vQytNNTBSMGZKVGxCdk1zeElxMExuWUM5RlZMZ1h4?=
 =?utf-8?B?UmpnbEJrQjhDLzY5ZVdRRUpKVnhFcDFjSkY5bE9TZi84emFjWi94eFJ1QnVY?=
 =?utf-8?B?dE44bXp2NWRMS3RrVlZxWjJUZG5CMFNmZVh3OU9RYUp3M04zbktlOWxTM01O?=
 =?utf-8?B?VGJaNHhJRGQwZHRLSHNHdkV2a0ltM3NHb2w3ckdkMUVBeTZ4QmRRS0FuZUxQ?=
 =?utf-8?Q?uvkMJf3GN6nIV?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YS9UQWIwL2lCS1NzaTBIUUpkWU5mRVpNSWNjV2oyazZQQXBnaUlCMkdxM3Q1?=
 =?utf-8?B?ZVdBNENFR2VJUm5Ja2JwUmVKbTcyeWRGNENWdE9rQlBkOHU3U2JvUFNEZEhr?=
 =?utf-8?B?dXQyOUVRSW5DcXcvR1VQT2hzUFZuMzJEZ3p6WlYxQjkrdGo3THpWcWQxZUYy?=
 =?utf-8?B?UnpSODRXQVo0eEFwbGE3VEQ0RFR0WkdsWkxGT0Q2aEpBU1VNQkRzVi9RU3VH?=
 =?utf-8?B?N2lOT1hCUGRUMmJaWWlCQTVud01FaDRzM1J1VHVHamhJZEppWGpycnNlU1p4?=
 =?utf-8?B?R3dqR2NLRjZQbUwwNW5uc2Z6SzNWUTIrRXFyTVpQaHA0aXV4dlAyN0hIUmFH?=
 =?utf-8?B?bmJOb2ZjVnFmZjdpUWpGTkZaZUtDQklLd0hCbldYSjNycEhXU3gzK2xFdmNa?=
 =?utf-8?B?NXRYbHp5cjUwSk1Ick1PanVsL1VYNjRrN2pNL0ExL1V0QW40ZDFXY2duTWhF?=
 =?utf-8?B?ZVBUUUJqaEdCcjlSMTV2ZVk2YXFVTnFQVUlGTDFUN3pQdG4zNjc5Mk1WanhR?=
 =?utf-8?B?UVJIUzhWZ0VIeUFnVERQMHR3enZrSVdwdURkVVNPS292SmowL2NlVndYV3cy?=
 =?utf-8?B?YUdMMVZtWVBpNjBUNlJSaS9mQU81ZFdCdTJGK0xKckRxOExOZHJkRDM0MSs4?=
 =?utf-8?B?U0lOMHdROUFkbXJoTG80K1JOU1NxWnJBbkkzbE9KSFZhbWk0aEVhd25saTBk?=
 =?utf-8?B?ek9YRGlFN2V5MjN3R2tVcUxLTmJVY0dxL01hQm52QVV0QktmamJFTWZGU1U3?=
 =?utf-8?B?MSt4NEhtbmhEc3dBcmVvY3F5SGVyZkt2aWRwMXY1VXlEQ2JEZkhmRHhEK0F1?=
 =?utf-8?B?Rk9TQ3h6TC9sSGhVOTNzUi91K2U4VjE1ejlGUVY5MTVjeVpxK2Rra2cvS0tv?=
 =?utf-8?B?UzJGZHdCSWdLeTNMb0c2eUZvcEVJYzNVYXN1TUVvWjZ1b0R2NUROVXVGdS9P?=
 =?utf-8?B?a1dna2trZEtHYnVuTVFoMWszUHAwdVJaQUZYOVFIbjFPRW5qRXRtOURGNTRh?=
 =?utf-8?B?KzZyQ3NrdWJUY3RlWlcraUFOZnUzc3drelVhY0FXOGJJa3dYWTNvbWwrckJG?=
 =?utf-8?B?c1Bzdmt2WExicFc1cS91QnNYaGxXNFVhZGVXWE5TYzVsNWdVVkxkdDJPOUR2?=
 =?utf-8?B?aHpXM29ZbFVoSkNMZGdibEVRNS9XSUI4bUJDWi9YcHlXRi9KcEU3elZ2ZE1Q?=
 =?utf-8?B?UytHQUZNMWhWY1ArSys3Y1ViZHF1K3lIL0tDSUwrRlhmVVhBRFNnZjh3Wnhi?=
 =?utf-8?B?TWZoK2NYelkxbE5kMGRkOVp1eTNIdUFUTU9GSlZ2aGQzUzhMRWFDUGpiUSti?=
 =?utf-8?B?YTlUVi8rb0RIVWVXNGh5cENNMzBucjdOUnMydFZZWUlmSjlpTk0vYW8relJa?=
 =?utf-8?B?RFV4NHd0K3lmU2xGR0p4dHhzekRhbUVhMGlpODBSMFo5MHZWOEcxVHlxNnIz?=
 =?utf-8?B?cDRIZWRUWGgyTmlGUXV1NHFCWVRUSFZYdWhKZDNFOWdvc21qelg4VkFwMURX?=
 =?utf-8?B?UEF5bFNnY3YwNXZ4K0lZVHVTQjBMa2ppVzhjZjdlc1NWZ1pqa2hTMlRJeWRa?=
 =?utf-8?B?STNkZDZmZkJKL2JMcTBtbHZHZWJOYXBsK29TbHNoUVFWSTBGbUtNYlVRTzJh?=
 =?utf-8?B?SFJCQnRGcXVNZEpZUm1MQ3ZqQ2tXbUVRT3ozUkNRREJYOUlvM1MyWUpZZHdk?=
 =?utf-8?B?OXBrWmpWWjR6SFpVR1VSOTN0Y29qMnpmNUpRRWRJUldpQmFvSVorZHVLTUsz?=
 =?utf-8?B?Q2NoTEFqcGRLeWJhMWIrVi96ejJiSWc4dDF4czhSdnN3QXhFWndkT2k0cFVa?=
 =?utf-8?B?U2g2UTVvcDlSMEIzTVBkeEsyQ0RLUU9vdVN6Y1lKeDdES05Mc0pDczQwVEEy?=
 =?utf-8?B?SDkzRFJ2YVI5WVNIT1U5NSs1aUhKRjZiQWZkRThRYmFoaHVIcHZBRitVUGo5?=
 =?utf-8?B?QXVwbVlNRTVDcUZkMDBlVk9heWNPLzdoeVdGZGg4RUUrQUl5NzdPM1duMHIw?=
 =?utf-8?B?SzVjc2tIbE0yeXBNRGEwYy9pVlJTb3JjSXJONVIxdzV2YUtHS2ZhdUZ2a0ZF?=
 =?utf-8?B?eDZpZjhGWDBCTEw5M2lubXBFUy9qdW5Cc0J6anNZNGpFNkFmSmFMT1lGWmRY?=
 =?utf-8?Q?sty6QlSJo0hM40UlB5QCcMjym?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4c3438c-5efe-43e1-3a69-08dd1b6137e8
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 10:30:52.2750
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4/Sg9ok1pbwpBtJ383NPqGZlZjDazXfNm+u6HNOkPG/dFirt+1jzySl3PhvtVuKq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB9046

Hi Ailus, +Greg

On 12/13/24 09:54, Sakari Ailus wrote:
> Hi Michal,
> 
> Thanks for the patch.
> 
> On Fri, Nov 22, 2024 at 09:28:01AM +0100, Michal Simek wrote:
>> From: Sam Bobrowicz <sam@elite-embedded.com>
>>
>> Light frequency was not properly returned when in auto
>> mode and the detected frequency was 60Hz.
>>
>> Fixes: 19a81c1426c1 ("[media] add Omnivision OV5640 sensor driver")
>> Signed-off-by: Sam Bobrowicz <sam@elite-embedded.com>
>> Signed-off-by: Michal Simek <michal.simek@amd.com>
>> Cc: <stable@kernel.org>
> 
> Cc: stable@vger.kernel.org
> 
> And right after the Fixes: tag.
> 
> I fixed it this time.

Thanks for this. I was trying to find out if this is described anywhere because 
in stable tree both ways are used. Also Greg's script didn't report any issue 
with it. Is it a rule for media tree or your rule or described somewhere?

I have no problem with that rule but just want to understand where this request 
is coming from.

Thanks,
Michal

