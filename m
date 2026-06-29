Return-Path: <linux-media+bounces-65990-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id klKJB9GWQmr2+AkAu9opvQ
	(envelope-from <linux-media+bounces-65990-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 18:01:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B386DD0FD
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 18:01:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=dCMV96k3;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65990-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65990-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E54DE30172FD
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 15:51:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F3F0325485;
	Mon, 29 Jun 2026 15:51:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012069.outbound.protection.outlook.com [40.93.195.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B68543C055;
	Mon, 29 Jun 2026 15:51:16 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782748278; cv=fail; b=fgXPlO2whsIOc82dojUYdF+NlszkKGjOGUKriOtXTrXwzI1cn6FjX/pKXjZ0vLA/INm2bYQRedRsUhLmTtOiwclCHiU2qQirUZsfICpKvAV3iqyYwifHpZ+sad8zNQU+uHTKbEAJlUkKeKnJVHDDwHFHrt+g4q1w4T+Kgrgaty0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782748278; c=relaxed/simple;
	bh=rMET8YRayEYmBf6CUeaF3fYhOX7RE1EZyO1w7A92Yzg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=t/fB+KAVIuIx1lFuWteB4dKkp8gwYsT6ddFgGDHQ+z9N64BEjtl1QfbBe1pjgrYtIefuC1JYJpxHCGKdwNNXcf2tP51Elw6fPe+bP4+SdyzgC/NJcLHngJx3M1tJDbjPOOwzJpgbSK+FpEXpvgEafry57xcTzENOaB6XmW+iEeA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=dCMV96k3; arc=fail smtp.client-ip=40.93.195.69
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=azRtmMeVy4LYYmS2y5G3xJImogO0CEOvz5S5hisLgsiK7N34ePbh9vpH+z2QaoGv1uDxbx5elyTYphLwxD1UI6GvcawdYzhxs+z2q4+HTgqGxDa2xYBCAqVY3ZCBBRy7ro1OtGn+g1jKOLTFxh/IMOHsMWB167DF5RL0v3H+7Mmtm8Dwqmazz93AlytV0H5oSOjQXlHBvZU1fz0mY+azMUzQg2+x2jEzpgJdiCrx3YdbpDhVl4pMXwyjwyC82kkOWu0ZhjdjPC7zd+mFdB3kx83iCSlpG71z1Rh+McRUEZTwLLAvPUuor/7Qw+nLjNMHDKndiZpt8k02W4PhXr+KMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aiKh3L0F15qi3tPmHLtN2Q32luN3jZxu89PLTcbQ4wA=;
 b=Hyvec9Zm2rjfJDAwJ7wih0haTvjqRdNyU6v038QFdw4v//UmdIvq/Q3NAyqxLETCa3zTHLgHRx9ABZp3E10tVd2NBHAk9bLel/pxaCV0sup+YoegcofmNbQLzxmhoJo69CJ4p3VEZjHwG8QFonqHZQ6WzsZtAHWH/YbUPMxpDsJk+CNWWMV4DhcB6N8BrwoQP+hRGuMzNrDjZY0qvZ4jsfCLW2xlazL3FNrtDmyExl9C3hZOyQEnx0M3ezRV3UX6piHSTj5ayUFbVPJJelJD0R5IHbJ5Fmv2S2Herx1vYvPHiDfiDKvecMcrMsCK8UQnJ81k8wMHJsJNop4BHIa8Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aiKh3L0F15qi3tPmHLtN2Q32luN3jZxu89PLTcbQ4wA=;
 b=dCMV96k3RP6hlC7MVS5vVIa2Pd2jvOUXi3O4qSboiz11fXS5KOZln5X30eP0q2j7YfKUANPjRH/Ko3WVZBvSycwXg5tERB0CSSzUKlmv38+cMhwafI6Rja7R1H0akMZQJ68efGfcAPZ3XpNw7VPYci8/WryEgZ7AfRnW+uNAPg0=
Received: from DS7PR12MB9501.namprd12.prod.outlook.com (2603:10b6:8:250::17)
 by MW3PR12MB4347.namprd12.prod.outlook.com (2603:10b6:303:2e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 15:51:11 +0000
Received: from DS7PR12MB9501.namprd12.prod.outlook.com
 ([fe80::4564:457c:524b:6b96]) by DS7PR12MB9501.namprd12.prod.outlook.com
 ([fe80::4564:457c:524b:6b96%5]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 15:51:11 +0000
Message-ID: <8bb876da-5691-4471-8813-b12d07ca8ca4@amd.com>
Date: Mon, 29 Jun 2026 11:51:09 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] media: platform: amd: use refcount_t instead of
 atomic_t
To: Ricardo Ribalda <ribalda@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, Bin Du <bin.du@amd.com>,
 Nirujogi Pratap <pratap.nirujogi@amd.com>,
 Sultan Alsawaf <sultan@kerneltoast.com>,
 Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Abylay Ospan <aospan@amazon.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, stable@vger.kernel.org
References: <20260629-cocci-7-2-v1-0-5884c80ee3b6@chromium.org>
 <20260629-cocci-7-2-v1-5-5884c80ee3b6@chromium.org>
Content-Language: en-GB
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <20260629-cocci-7-2-v1-5-5884c80ee3b6@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0432.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10b::27) To DS7PR12MB9501.namprd12.prod.outlook.com
 (2603:10b6:8:250::17)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9501:EE_|MW3PR12MB4347:EE_
X-MS-Office365-Filtering-Correlation-Id: 9930468b-ef9b-4a52-9ded-08ded5f63e2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|4143699003|18002099003|22082099003|11063799006|56012099006|921020;
X-Microsoft-Antispam-Message-Info:
	EqYPUmj1EYfMgrFrEICVbG9CDP0d53bWS1W1yPgCO/wkORIVgfV5Z/wi1Ipz5xkkKTnBz2oNNBWuUS8D5BxHHFpshi1+HgoQZFj2TSvkP9dbv8YZ34l0G1kdl1BDhv1oOudFBtTbvDT2QIIYf3jzpTnOhzSy5AgeGhQJDdTTzol2qYlyZYz4cm9yBPOd0DBC1T1EfXPDpDYa7xDuQFCAZ4cvCxO8XD1dIP0bp5E3bInEYFitDKID4bir8zH4MDBSCibFv/UWwA+RAthQV3mfVBN5z16AYa1WaTIdsnmS1OSUQpQge8dJiJhyV4htTdaQRz/XmAOr3/hbVv0hxSQlNp44iT83K8KWUwKPelzTGKVEY4vQyvzGWKd0rqV5srtAfnpGdv9PvZ3QrN5cHs/yybvp9MtjrGWit6BYvk8efsMwNgv8VyMDfoLIDCzOSuEuZtNrnTgu4JVjzLXYsy3idToRcWBzTMSjTr5mjy3ibFmwZ0b2+M7PQkTsED1dgLORw43IK2ykY5Dg39ABNHLOIrMMslJU4nFqStu9I3Z7YkEN2WGVSrua8bkMIhqCrHxXx5kUYgQhOTP7temDj0ThE5wa1xRVrwVrXNrPqzFGUcby9A+mbxo+/sw1J3iQ637wPS8OQs00SJhKDHYIDcJzZJUKJ2Z8AFziTfSSdSG2xXHNdyFjO9IG5pYNPzkKeMFKwDirkQtvZ6+CboLezHpU9g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9501.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(4143699003)(18002099003)(22082099003)(11063799006)(56012099006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z3ZYaSs4QWU5elR2YVFOdnlGdXIvbzZTMDYxR1ZRbURjL3VCR2VZN0dPc2k2?=
 =?utf-8?B?bVA3eWtkeldNK2ZXaTRSczN1MVdOczVRZzBEdEZ2RzlTTzZNVzNGMHRhU2lQ?=
 =?utf-8?B?MkZLQXNvYjB3Y2hJRXk1VnJaMVBKUytlUHpyODVNUU9zUnJMWjBWL0tNNGIr?=
 =?utf-8?B?QnNRQXptMVpFQUtNcDZDSjdLYUZQcnpyRjhEbUMzOTcwcHVjSUhxOUhwdXJK?=
 =?utf-8?B?MGI2R2dtRndxbXRiRGdlNm5vYXNNaTBzblg2NURLRG5IRDFsemcyb05UcERI?=
 =?utf-8?B?bkswKzVoQ3NUa0dVK3hsOXA2b3VOcnkxaGErbU56MXdrdVJZK0c5TStVdzdP?=
 =?utf-8?B?UDVac0dpeW1RZE95UmZNcS9NdUdqVlBVaUhwZ0dkQ1VwS0tWeU45ejhPc1Fm?=
 =?utf-8?B?cCtERFEwWmlQMnVsYWZEaldlM09yQzhkWVROS3VXUVZuQXMybHBsdUZvelBI?=
 =?utf-8?B?NkNBNzJXRmhZZjVITVlBeTVPYk5NRDBDQmYvK1oySXJsR0R5bFpXcHlWWkJr?=
 =?utf-8?B?UjRITlFUMWo4T3RnT2YrVDQySkxGdFJlMTJod1JBUjlSZjdiQk5TV2tnZzhk?=
 =?utf-8?B?VWt6UkFYM0RNK3hKNk9NQ0FaakY5ZTliWlhEOHpSYkpackNkR1pXUEVINjZI?=
 =?utf-8?B?M05oajFKZWEyUDF1WlNkdU9uNDdqNnF0d3pjbzlXczhuU1JYV01sZU1jbXVv?=
 =?utf-8?B?Sk5COElnSDdDOWlPbXRoRVJWeFFJYmFmRmc2R2lrWnFPU010b2tqNDdsVEs0?=
 =?utf-8?B?MGhpSzlqQ1FwZENZcG4vR3gzdlNVQklIc2dxOFBRNVNEMlg0R0ZISGFWM09w?=
 =?utf-8?B?WWsxeVhqR29ZWmZkTUl3YXdRN29vL21HUGR3dGRGQXR3eW5SM2VYaFhCTHUv?=
 =?utf-8?B?TXllKzJGVVM1cCtpNG5lNzlTYlB1TGRIU1duSTR0REhkbEFGMDNrYTlHZ3NG?=
 =?utf-8?B?b2dNQ3Yzb1A2bTc3RkN4YlB4QkVCaXV3Qm9taTJzUis3d0RaY3JCSkpBVE10?=
 =?utf-8?B?ZlJkUmhUeWVGYTNjVWlVVE9SNkhGTERmN3ZxbytEdTllN0pabFBkRVJ2R1dL?=
 =?utf-8?B?WS9nbmJrcTU4TlhzcXhuc1FmT0FVVnI4ZGNwU2ZoeFU3NEkvNEtBVjNEK080?=
 =?utf-8?B?OVV2b0wxbkgxWGw0UGJ0MVFWZUdoQk1mVHZsQUNMaEpSR3crQ3d4eEdtWjd2?=
 =?utf-8?B?YWlCZzB5VHdWeWpWRUNxZ1l1NFl4RGVuSE54NGZ1bUxhTlNRT0dWeU5xWGhh?=
 =?utf-8?B?TC9rVjZSQWZyQkQ5MTA3UmhJTzgzb2xITUdVTWVaSDBIdzNCSFJDVmlwcFAy?=
 =?utf-8?B?WG9acUIrVmlaWDlUTFdYeW1YNElReURDeFV5WlplV0xkd2pNMG8yNkN4UXRH?=
 =?utf-8?B?eDc0Z2NuN3dETGQxaUJrT2RrUEJ0SFRUNDN2MUYwTjBYSFAwNTFXcXZHQmQz?=
 =?utf-8?B?cVVtQnhFL01DY1A0RkI2Q2preW52eE1KNFF1NnBDdWtrZHFiV1FMZ0E5Z0U2?=
 =?utf-8?B?Y2NLY0NFdkpBdHI2MThXTlhwS0cwN0FJeXcrdWpVaG16WS8yeFYrcGJqUk00?=
 =?utf-8?B?OEUvSVhjeTl1MFA1ejR6QlQzQjFKOGdJTlJFejRSNVExQXpxQk81NVY5T1ZM?=
 =?utf-8?B?UEUwU1V1aU9oYSs3VFc0b21IV3pJOWNJRmdkZk05amk1VlQ3VW9IWkNQdFMw?=
 =?utf-8?B?bklGdVFNWm1EUlJiVnJsRll3SGpUSUNXcUhKZnlmNEhwNXhuOTAwSjhvZmhF?=
 =?utf-8?B?UFFhenNoL3lLQkhDUFFMbHVyUy9EWHVtNTF3WWNtakR1dGRTS3loTTdwd2xl?=
 =?utf-8?B?U0xvSHgrY3VQYm81dERtNjc1QWI1TEhabXQxclRmTzRXOTI2RGNFeEJ0S0th?=
 =?utf-8?B?ZTcvL01ZTDdIMWxpS29PYlljeHN5QVhzWUcvVjdvQnVwVE15UTVBVGxuSlhq?=
 =?utf-8?B?MGpnVU1tRUg2VTYzQzkzYzZaVERLenJkbkh6T2VvMk5lZmg0V2FqczExTW9s?=
 =?utf-8?B?b3E5bkFzV3FraFNDb2RyVUxPT0x5THkzYmtBL1c4aEdrNXRwZXRmS2VZbENq?=
 =?utf-8?B?SXIxMUJkSTV3dTVDeFYvQ3FMSWIwK0xzQlIyUG8vWG1MQ1J1dDlXS3lqcllh?=
 =?utf-8?B?Q2NkVVhPNjJFRldjRjg1VkQ0aGNlczY1N045clFUZDIwS3ZEbXgyUDcvTWxF?=
 =?utf-8?B?V2NQdHFFTk11bGEvTmlnbHZHM2FKcGZNRVBYeG0yMHFicDRMV3crd2U3L1h3?=
 =?utf-8?B?bnBvc1lYUEhWa2Ivamk3VENNeTZEMkE3ZlRXQkpDdTltbWJGdllTSmI0N2t5?=
 =?utf-8?B?THNZU21HSjAzZ0M1Qm8ydmVTTXg3RmtUQlZFbXRCYXFFbWR4YWpqdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9930468b-ef9b-4a52-9ded-08ded5f63e2d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9501.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 15:51:11.6546
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fHdf1QBCzaBU4b1akMrDJd10mG/PIkZWeXXBJ+zYKf5loiKiIzld18BTkcBgNBUq/pP3+5qekq48SYWKdapRMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4347
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65990-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ribalda@chromium.org,m:mchehab@kernel.org,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:skhan@linuxfoundation.org,m:kieran.bingham@ideasonboard.com,m:bin.du@amd.com,m:pratap.nirujogi@amd.com,m:sultan@kerneltoast.com,m:Svetoslav.Stoilov@amd.com,m:sakari.ailus@linux.intel.com,m:aospan@amazon.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER(0.00)[pnirujog@amd.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pnirujog@amd.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	REDIRECTOR_URL(0.00)[aka.ms];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,aka.ms:url,chromium.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 58B386DD0FD



On 6/29/2026 7:30 AM, Ricardo Ribalda wrote:
> [You don't often get email from ribalda@chromium.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> We are using the refcnt variable for refcounting. Use the refcount_t
> type instead, as it has support for saturation and underflow.
> 
> This also makes cocci happier, as it will fix the following warning:
> ./platform/amd/isp4/isp4_subdev.c:394:6-25: WARNING: atomic_dec_and_test variation before object free at line 395.
> 
> Fixes: 4c5feef6a62c ("media: platform: amd: Add isp4 fw and hw interface")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>   drivers/media/platform/amd/isp4/isp4_interface.c | 4 ++--
>   drivers/media/platform/amd/isp4/isp4_interface.h | 2 +-
>   drivers/media/platform/amd/isp4/isp4_subdev.c    | 2 +-
>   3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/amd/isp4/isp4_interface.c b/drivers/media/platform/amd/isp4/isp4_interface.c
> index 8d73f66bb42c..00a817909292 100644
> --- a/drivers/media/platform/amd/isp4/isp4_interface.c
> +++ b/drivers/media/platform/amd/isp4/isp4_interface.c
> @@ -375,7 +375,7 @@ static int isp4if_send_fw_cmd(struct isp4_interface *ispif, u32 cmd_id,
>                          return -ENOMEM;
> 
>                  /* Get two references: one for the resp thread, one for us */
> -               atomic_set(&ele->refcnt, 2);
> +               refcount_set(&ele->refcnt, 2);
>                  init_completion(&ele->cmd_done);
>          }
> 
> @@ -455,7 +455,7 @@ static int isp4if_send_fw_cmd(struct isp4_interface *ispif, u32 cmd_id,
> 
>   put_ele_ref:
>          /* Don't free the command if we didn't put the last reference */
> -       if (ele && atomic_dec_return(&ele->refcnt))
> +       if (ele && !refcount_dec_and_test(&ele->refcnt))
>                  ele = NULL;
> 
>   free_ele:
> diff --git a/drivers/media/platform/amd/isp4/isp4_interface.h b/drivers/media/platform/amd/isp4/isp4_interface.h
> index ce3ac9b9e5cd..04db71cd54e6 100644
> --- a/drivers/media/platform/amd/isp4/isp4_interface.h
> +++ b/drivers/media/platform/amd/isp4/isp4_interface.h
> @@ -68,7 +68,7 @@ struct isp4if_cmd_element {
>          u32 seq_num;
>          u32 cmd_id;
>          struct completion cmd_done;
> -       atomic_t refcnt;
> +       refcount_t refcnt;
>   };
> 
>   struct isp4_interface {
> diff --git a/drivers/media/platform/amd/isp4/isp4_subdev.c b/drivers/media/platform/amd/isp4/isp4_subdev.c
> index 48deea79ce6c..2a8bc1207843 100644
> --- a/drivers/media/platform/amd/isp4/isp4_subdev.c
> +++ b/drivers/media/platform/amd/isp4/isp4_subdev.c
> @@ -391,7 +391,7 @@ static void isp4sd_fw_resp_cmd_done(struct isp4_subdev *isp_subdev,
> 
>          if (ele) {
>                  complete(&ele->cmd_done);
> -               if (atomic_dec_and_test(&ele->refcnt))
> +               if (refcount_dec_and_test(&ele->refcnt))
>                          kfree(ele);
>          }
>   }
> 
> --
> 2.55.0.rc0.799.gd6f94ed593-goog
> 

Reviewed-by: Pratap Nirujogi <pratap.nirujogi@amd.com>

Thanks,
Pratap



