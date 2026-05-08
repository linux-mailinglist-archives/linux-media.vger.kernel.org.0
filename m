Return-Path: <linux-media+bounces-60939-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKDGEj0m/mlTnQAAu9opvQ
	(envelope-from <linux-media+bounces-60939-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 20:06:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D53644FA63F
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 20:06:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AD033303D556
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2026 18:06:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12DE136165E;
	Fri,  8 May 2026 18:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="lSs4R+Ce"
X-Original-To: linux-media@vger.kernel.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011032.outbound.protection.outlook.com [40.93.194.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D733E31F98F;
	Fri,  8 May 2026 18:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778263581; cv=fail; b=oZzQayMHFxrYk8PlTZsqYMuit2G4Db8lK0wKtDo7dW2g4u/3ZzgDPzddo1RBKgwDmxNgd73k1TkAMaUFANwFH1JtiEN6QhAi+s1pkp5GrQ1ViDwyvhOCDXyOVfSSnSSxOVaU99203xoVodyeK0d2Xuvxs1W3QpKY54OButIxwLA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778263581; c=relaxed/simple;
	bh=RaYQv9ZwwwXv7oBPwa848oDqSlGmYwkhF7MFrqZA724=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Rr+CRZyjsgKJJlqrjaWiBrjrUGJSVEeH9bgHF+ncxOm+mxTcz2jG1EuRxX0AIXogcBShxJbRz34TzFg0JVGXAtfVQAQckGF5ZJM9pqtExzQWvygHdxNh/UfJKJTyzLddoGVSNxaF9Ggnl5VtHp9r+rEBI6IlAyCW6/wutZwbZ1I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=lSs4R+Ce; arc=fail smtp.client-ip=40.93.194.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TZq4KxmnrpNwENcObShoT4zTuKK7D0O0CPNnDxI9d5d9IU08JjYC13e4mgEOmrlwFl7iFFtyW7NGeeKEgc2yOGXfwMbsuyUkSro81bpqvSvTdNcZSFu+CyxTmzZaScknyYxG4gRu5xrcNkgH2a6fk/rC3/JQYegnw1NLYubshdtWSQqnEBCpv2Zsf5UvvEazMI9UspdFlCtw1hfVlMigUewEedw0tXLWf+JQ4W28xXMbKkvPZQ+h+zyOtCpyEK5yt4d4kgeo5Dtlki9jYd0Q8E7ShP4ONeSA5JxidR5vmNzVS8lJtr7zo4FduQxCJ6ahEFWFU1BuKnNXD0VtEtsYtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8CPc0E2+9IxrMuUGnrr00zcjviUtuSFG/uuj4yFbjmk=;
 b=ga6g3hEe/6PU5JKZfG/9DSAaYJvMWJUSyCnDCvF6fT0mbvkoQdv0KAKtBUmSoW0DlVU4Y1tttVUFuf5aZT+gjkhzHJ+TXNYHyNKeRQeSzDU7kYKQFKGxMKm16xUy82VOiKiIO2OrkYjM6BEz+jjGsfpeE8K6gomPoR87d6tmUgmYYPykqWntWp5dwxzzOOz/dM5f0pVldPWyq6+9jDge78g178bGXp8DWbbFYEeaI28CEy1SX+qDptgSM/7b69PL7TnE7hd5RatCmOZAMteTUyrkesMpdt3q0odAFOxgAgRx2kvoswVfmG1XarB2zUJQxui0Jc9PXw1gGeYlh9UeMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8CPc0E2+9IxrMuUGnrr00zcjviUtuSFG/uuj4yFbjmk=;
 b=lSs4R+CeVvzZfSzn0zVDOyzkNl1OEUhaIb3EBA+dp9Xp8oWb2H7fbHXyF3V+6J35ESEHfCE2kfhnOR607Bz4k2CoQkR+gaU6H5R5GTBv+GrB2TNcPkjom7BvnZ8uXNoC8BQPPV8QCMRHOCnNeLvE1BWv+rcudgskxagES4h1Y5g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS7PR12MB9501.namprd12.prod.outlook.com (2603:10b6:8:250::17)
 by LV2PR12MB5919.namprd12.prod.outlook.com (2603:10b6:408:173::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.20; Fri, 8 May
 2026 18:06:16 +0000
Received: from DS7PR12MB9501.namprd12.prod.outlook.com
 ([fe80::4564:457c:524b:6b96]) by DS7PR12MB9501.namprd12.prod.outlook.com
 ([fe80::4564:457c:524b:6b96%4]) with mapi id 15.20.9870.023; Fri, 8 May 2026
 18:06:14 +0000
Message-ID: <5086ff26-5635-405e-a364-b8aa63a1b4a9@amd.com>
Date: Fri, 8 May 2026 14:06:12 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [v2] media: platform: amd: avoid -Wformat-security
 warning
To: Arnd Bergmann <arnd@kernel.org>, Bin Du <bin.du@amd.com>,
 Nirujogi Pratap <pratap.nirujogi@amd.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sultan Alsawaf <sultan@kerneltoast.com>,
 Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260508124402.3082615-1-arnd@kernel.org>
Content-Language: en-GB
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <20260508124402.3082615-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4P288CA0064.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d2::19) To DS7PR12MB9501.namprd12.prod.outlook.com
 (2603:10b6:8:250::17)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9501:EE_|LV2PR12MB5919:EE_
X-MS-Office365-Filtering-Correlation-Id: 28bf5483-5e12-44f6-54bc-08dead2c7e65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	eWBRRI9U5+spuZxShRV+oNN9ldERpZfufYgiSxax2WHg0gclyCWnF1HZSH2Y/4mlPNWyuwOBvY7sbco2H+L/h8/fALFrkGa6700vmvMqhh0QVZ+wE3SyWEbjOoO9XiDG/w4+GV3vuLwsAhNQHIWJJUQ1Dg495PJpqEkAYijAzRi8QXflulLFKW4F2GWbjij3TU5TtBk7Iel3/IgqhuBEY1A5bf9eoaX6kLunacgnYYSaGMtR2rT6bSj3ErfNIaePPHKAGaN2K+8nm13+1nXUblJLKBv3lIdf/c/5kOAW16ejM9WOgjwKr0wH3Qg453bAQJXq8GXr+2tbLreNl+xh+iXfu25msVmfj/Id0iDzh1HiuTxPycd1P9y2wKx8T1OvaGq8aFA862mdosWSCilJTgq7zSKp0dYST68u1/+dQ1k1bbis4Fn7ZroMMDV65A+xY7UCiKyYQ4VZ7ercDrw/+XIFiWAhl+pCnVGq4bL1E+fx/3w2ERoIW/ndSe68dj+sw73fexix84tCaFevllfOT7DXewTH9756mh6tnL2lUYTrXbZdIbOFL552VPrD71tshAYXwEme9MjWYxqW608aUtdEKweJo2i/waRkg4t9XHsB939jzmDVPtj/m7s0y7KANXVvjY2SxOAq47Ln1Hd9l0LjHyNG+mTSf4T0Zwef6yXjLcLyRpd70J1SWCw5aJil
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9501.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVhncjlmVkU1aTJLazZvQytBVWFrM2lwOU1KMm5xYkt1ajVGdU9hOExhVE4y?=
 =?utf-8?B?VDIvSlJ1T3J2K0l4eUVDckhkSFgrcytkSk9DN2ViamdMaHBDN3h1TG5UN2Js?=
 =?utf-8?B?ekRFcHEvcDdHTTd4QlUwMDd1WkxVYmJZSElIQzhmWEFOUWR6a0g3NCt4U2Nx?=
 =?utf-8?B?a0VjVzloOUluUGw0dTZ0QnluUGdYRUhWWjhpMDNNSVVvT1J2cTdGL3lvS1Q4?=
 =?utf-8?B?WGJEaVBMbS9JQmlpV0h1dVBqYm9hajZlZXVKTVQyUm90Vm1rOUhHWlZSR1pT?=
 =?utf-8?B?VkxlZEQzQkFYakR0b2tDSURROG9KK3hMd2lRYjFoeUdUOVVBS3VBQlNlSFk5?=
 =?utf-8?B?djlMNjFUcHJCWGgzNHFtUytxZmI1SHdTSzVNVGpINTdWaVVFMmR3dWJXR3Fx?=
 =?utf-8?B?RDN3VXAveVQ0OTFtNXpIYnVaMHFQSlpTYUJzWGEwaVE1ekNtVmdkSTYyL1Bk?=
 =?utf-8?B?VHlBbkhjU0N5MFBtTnBtRmFLWFVwSWYwU3VyTmxWN0dDbXZWYVBTT204L1pa?=
 =?utf-8?B?SkI0SCtKVENjTERObXBTdDR6eU9BR3JJQ245ODlEaTg5U2ZIaVh0OEtLWm1G?=
 =?utf-8?B?N3VpYkQ5TWVQQjAzMDluSFptdlpkYlpQdWpYa3JLbVZ3c3ZHcFZpUFNQMUhM?=
 =?utf-8?B?NVJwbmhxYTVDOHJtbXlaRmlhYmlYQlIzdUtSYVhadlQzQy9RQ3VjbG43eEtj?=
 =?utf-8?B?UVlHYTkwSzd1SWpKaEFVc0o2dG1VeDdnV1M3NGdLYnNqUHdEVHNmdkVSRERG?=
 =?utf-8?B?SDZjTkJYOTdZR0ZSOWJUTytpVVUxSTZ0MHBGK2VWVDd4VWdXb2ZiL2I2b1Q5?=
 =?utf-8?B?VU4valdwYXJFWUNpRHlWOFJWUlRScEUvcGc3VWE3S3hFYkl0UmdmUVFRVlZt?=
 =?utf-8?B?Z1ZERjhNVTk0U05RSFUrQ2tXRGhlQnFHQUtKUzRtOG8rTklNTzVIT1Z0ZDMy?=
 =?utf-8?B?RFZKMmthR1FDOElzQUpJT3ZEemJpVGdsYllLdjcxUXg4WEQzbVkrNnVvWkcw?=
 =?utf-8?B?L1dkeVJNaE0rbTN1UVVsQlBLSlE4Y2dlRzRHQ2xkZDNPRjlHTzlKbllLRTZP?=
 =?utf-8?B?RzFmL29rendPdzA2V292d0pXSnhMa1pRZ01haUErNGxhQ3FvUzJqbjN0QVV4?=
 =?utf-8?B?bXQzdUJuMDNET0lta1p5VzVXMmE0QWg5RjNUdnVRZDNxdjJLb3NJZjNnTW1k?=
 =?utf-8?B?V3BoMWt6MVdzeGpNQi8yUkRTSHI1VFFGTEZBTUFwbzdrbWNZQXMrY1hEVkIz?=
 =?utf-8?B?azM1VWFqKytpRWJNczVybXcvcVdDWkQ2a2JZMGh6Yy9rNDltN0FublRLaCtQ?=
 =?utf-8?B?Zk1YV1FNdTJBSjFvNHRoVEhBVjMwL0xqb24rRXVzUklsNkkxUjJaMjY3MkdK?=
 =?utf-8?B?RWVYbndYbTQraksrOW82ZDVNdVE3WW11VXk2ZFNBOW1oZTBrcnNTTGRPd3kw?=
 =?utf-8?B?T0xjczh5aWlzb2RKWmtkU2FsWm5xK29EL0w0alBYNm5vL3UxZlZwdlhrU3Uv?=
 =?utf-8?B?RWViR3hHaENGVDU1anE3Tlpma2dTWVRiN3RJVFJWNEJ6eUIwcmJTSUpEZFVL?=
 =?utf-8?B?QUtiK0xrbWd0S0VBalpSYXpFa0xIUUIzcHJ0NEwrYzFKR21CbkkwdWhURzg3?=
 =?utf-8?B?SkROOE12K3JFREJWWmpEemhhVXI4NlUxcVNUbDNWbzlHRkM1NCtlaGZIS2tD?=
 =?utf-8?B?b2lPNEY0RDhmaTh3WHMzYVN6T1dvbmRWZEtLanpoTk1qS1lGbDBXbzJmbFJa?=
 =?utf-8?B?Q0NYc1h3dHNYYVpaK3p2VUtwTTdNaFpSeE0zVWYvaDQ5RG0rNXhhZyt1SktV?=
 =?utf-8?B?bVdXUmJPSXZ4aFFVOSsxcGxFQVg1Z3IwWStObTVtVXhhelZhYUZuNkFjM0Ns?=
 =?utf-8?B?Y0wxZis4ZEZqL21sNVFFSXNtU2FNQ1VTeVNod05JTDNwS3AybmlaRWNpZnBa?=
 =?utf-8?B?WXlHalBMQWlKMHNsbms3ZktuSzdKZ1drV2VYZlFMdlMyV3NBYmtpQ2dQb0dl?=
 =?utf-8?B?WGwzbG1TaVBkZ1p3Y1ZBZ3lQVXhXa1lPWFlJK3R6SUducHp1cU1QbXlDZDQ2?=
 =?utf-8?B?cG9Mb3ZlQWthMmtDWmRTemJPZFp0d0tjRGN5elBJWXVzUmo2Si9oa2Z0L2M2?=
 =?utf-8?B?NUVBSVBHekM2cURRdFFrbVRxZlNRR2NLUVN1blFTRE9CekRHcSs4L3RJL1pq?=
 =?utf-8?B?TXlwZDkrV21rVnJJUjJVK3VzUG5JR1RJQVdvRklaKzhkbXptSndHTk14Vksx?=
 =?utf-8?B?clRsbHBhYU0yaHVIUmt3Rk96MmU4S1pVdCtyd1ZNWXp1MHdzVCtNZXpWejNt?=
 =?utf-8?B?anV5WG9rSEU3SFVoNG1mM0s5SU1mTWcwQWRnblZnVGx0VzhjQVZ4UT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28bf5483-5e12-44f6-54bc-08dead2c7e65
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9501.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 18:06:14.6127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0fXt1+jEybFyOg26dXog1QFQtdDd3UVYXTPSq+x93xMW21Gab32Jn8jY5SlgGMpFTd4R3aFQTRcvin159zikPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5919
X-Rspamd-Queue-Id: D53644FA63F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60939-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_HAS_DN(0.00)[];
	REDIRECTOR_URL(0.00)[aka.ms];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pnirujog@amd.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:mid,amd.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,aka.ms:url,arndb.de:email]
X-Rspamd-Action: no action



On 5/8/2026 8:43 AM, Arnd Bergmann wrote:
> [You don't often get email from arnd@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The newly added kthread_run() call passes a string variable as an sprintf()
> style format, which gcc warns about when -Wformat-security is enabled:
> 
> drivers/media/platform/amd/isp4/isp4_subdev.c: In function 'isp4sd_start_resp_proc_threads':
> include/linux/kthread.h:71:16: error: format not a string literal and no format arguments [-Werror=format-security]
>     71 |         struct task_struct *__k                                            \
>        |                ^~~~~~~~~~~
> drivers/media/platform/amd/isp4/isp4_subdev.c:596:38: note: in expansion of macro 'kthread_run'
>    596 |                 thread_ctx->thread = kthread_run(isp4sd_fw_resp_thread,
>        |                                      ^~~~~~~~~~~
> 
> Use an indirect "%s" format to do this safely, avoiding the warning.
> 
> Fixes: 4e5e7a7ddb4a ("media: platform: amd: isp4 subdev and firmware loading handling added")
> Tested-by: Bin Du <Bin.Du@amd.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Pratap Nirujogi <pratap.nirujogi@amd.com>

Thanks,
Pratap

> ---
> v2: avoid overly long line
> ---
>   drivers/media/platform/amd/isp4/isp4_subdev.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/amd/isp4/isp4_subdev.c b/drivers/media/platform/amd/isp4/isp4_subdev.c
> index 48deea79ce6c..427e9ba910bb 100644
> --- a/drivers/media/platform/amd/isp4/isp4_subdev.c
> +++ b/drivers/media/platform/amd/isp4/isp4_subdev.c
> @@ -595,6 +595,7 @@ static int isp4sd_start_resp_proc_threads(struct isp4_subdev *isp_subdev)
> 
>                  thread_ctx->thread = kthread_run(isp4sd_fw_resp_thread,
>                                                   &isp_subdev->isp_resp_para[i],
> +                                                "%s",
>                                                   isp4sd_thread_name[i]);
>                  if (IS_ERR(thread_ctx->thread)) {
>                          dev_err(dev, "create thread [%d] fail\n", i);
> --
> 2.39.5
> 


