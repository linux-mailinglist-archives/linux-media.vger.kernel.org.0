Return-Path: <linux-media+bounces-47577-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD7EC7A46E
	for <lists+linux-media@lfdr.de>; Fri, 21 Nov 2025 15:48:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 81F3A4EE5E6
	for <lists+linux-media@lfdr.de>; Fri, 21 Nov 2025 14:37:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AD651D6DB5;
	Fri, 21 Nov 2025 14:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="nxBNVYy6"
X-Original-To: linux-media@vger.kernel.org
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011047.outbound.protection.outlook.com [52.101.52.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591A9351FB5;
	Fri, 21 Nov 2025 14:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763735641; cv=fail; b=EySbUTL2+LJCw82nIcmOh1M4XjBRfULBULZx7PMU8rvokxkLi4pf4Wz8JUJVgSxz39YPTzsYlq3jYJIN9R1N+XU81pBcVnH2WCZx13TNu/uTq0Oi5Jlz/P96desFr/U8T97ePpO79T3yH72Qprg1GLOt0GZxWNYbn66RAdOSQW0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763735641; c=relaxed/simple;
	bh=hLY9GGbUUPEQtLX9cyHu/JmXb5AYWoXXBrNATjcQ6mk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gMml3Cscmu4PYZjlBPB8NR0cK6Qk1afeWCA32yqYiAUN80LPSqUxDHATcdMgQy4nvaGv/LnXf2+WLwURyM8uUZGe/ybGp8ot55yyjIOBCaEVFd31pKy0/jjCdOWhAqZ0PFzznHtXC3Kn3nLWg+UkdvpDmJXflhfJ7wJSIALTqVo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=nxBNVYy6; arc=fail smtp.client-ip=52.101.52.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M0RGzWIO9b71SD/7XiIOzqWpBLcxfLkDiiSa5Le48ugcmj906p69h4TzJ91CzUhw1DuvTmfjD1o2NTEv9analkQd0Um8QX5nOehurvyEGQZDjV+iyf4NLvVZct0foAIp6IkCWWAPgMEn8hVCr+Zwtex6SjcbQWJkv7iSyKVK5Xt66g50DfS5synH0nFTSC1TIKZwVQSy46ts6ZlDjNPedXX5vNHvV3Mc7+BZjpPCDytbM/P/pQeiQG0PrhYMg8GquPXf6rLoZBMT1ZyPRGL4/Kp2L4ady1Gp/Bh9/kYErzSUx4QN6dJpVtpBUUiwRVUJO0UWu3OHBTEZGQKLtYORrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eX5y2lNOKBtC4JyFk5t1R6Y4/kqGXKzmfLD48Z7Dd+c=;
 b=DsTWqlXL+5j7l68NNmwxdZdaU+OihlwOQ4ppa6NKAREtu3rqKxd7VqiZoeRxxOa29uTvsen0BJek7/vHo1Pl/WqYSAulJU2qSKmp9g+GMo4qWIjdtvVGqpS4egyBTQjSCHP/bLUKJAW5663O3s9zOE9R9CtQcHTuiobnm0PlUDVRSYoICavLAbMNTQm9jZELcuqw/7kG7EAUPalsAq6vWaiFOrYZhyy2nmPIgUQ1wA5HNwlN5cwD8SqCFCdjejFRRE15wMVA3/QYnGo5prhk+JNm3wb7dJq0SFmiInk+aW6ePjKehBku8dy/TKFurueBV3FfEjpnurSUUgoO6irnYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eX5y2lNOKBtC4JyFk5t1R6Y4/kqGXKzmfLD48Z7Dd+c=;
 b=nxBNVYy6a8eStw72/CAKthAyvFjwLkpgCDqMfosGiwb/BI5l90gSTXMBhG1Yn7gOgeXWOfHsCCMybjcDfbopHfumZJZJlNKzneS8Hg0L4q2ovfccLUVHzl7Ihpo9IA2MFfBfuqkVm68+jrUzkVuizDC0bEL4XMtFzdmsoy90ds8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CY3PR12MB9678.namprd12.prod.outlook.com (2603:10b6:930:101::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.14; Fri, 21 Nov
 2025 14:32:38 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 14:32:37 +0000
Message-ID: <546a8d8e-514b-4f6b-bf46-1ec0c9974e7e@amd.com>
Date: Fri, 21 Nov 2025 08:32:34 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/7] Add AMD ISP4 driver
To: Sultan Alsawaf <sultan@kerneltoast.com>, "Du, Bin" <bin.du@amd.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 sakari.ailus@linux.intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 richard.gong@amd.com, anson.tsao@amd.com
References: <aRL8ZPwXSeKD4Qmn@sultan-box>
 <e09207fd-1879-44c8-a5c1-838a140dcd4b@amd.com> <aRPH1hV7bEfagPtE@sultan-box>
 <aRPhMCwJjpMqAROG@sultan-box> <d9afc6db-fd8a-4069-a8a8-1e2d74c1db3a@amd.com>
 <aRQyAdyiQjhsC11h@sultan-box> <aRQ5aA4Gus4iCVLp@sultan-box>
 <591efd28-805a-4a13-b7e2-0f78a3ca3eac@amd.com> <aRwhuNmPRlPGxIia@sultan-box>
 <8288a5b3-6e56-4c9a-a772-99ca36bb7c52@amd.com> <aSAg1MUVZtDlCC96@sultan-box>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <aSAg1MUVZtDlCC96@sultan-box>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DS7PR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:5:3b9::6) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CY3PR12MB9678:EE_
X-MS-Office365-Filtering-Correlation-Id: a86160bb-b4a3-41f7-1fd7-08de290ad18f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ajVFeVR4eElOZlNWYTRJVWo0cG5RT1RjL3lQOGdLeHRKckdCN0VITXlBVFkw?=
 =?utf-8?B?QmhscUVCWTAxZzVKQnMwS08yNXNGeThoT3VjTEs4Uk1JcFFpYTBXWFJ6cktS?=
 =?utf-8?B?SWw2b3hqVlVHeUluOWQzSC9WQVRPSG5jMkhxWnY4dGJRcG44bVhOTlFveE1J?=
 =?utf-8?B?WDFmTlJwbklnOXpTVlN3c2ZIVjVBSXU2TzRMRThPZHFob2lhRTB4emt6eTZu?=
 =?utf-8?B?MWQ5Y2F4YWlkQWRoVE5TdklHdkhiR2hteU51eVgwb2FLcFpRWk9DREdlSDFs?=
 =?utf-8?B?Ris4ejdnbTYzN3ZUOXQyOElXZmpUY1NTaFU3T29ZVFZkRkNZWkIxeWFHRWVl?=
 =?utf-8?B?Mi95VEtOclIxUHdzRzdOVEwwby9zUUlwbERkK2xmSzZuNWVHSHc4Qm5zM0NQ?=
 =?utf-8?B?YjRtRjlLZHdhSmorNTIvZ0NlaStLR3ZpN2pkWG9hN2V0UWtEdmVkV1VPdThW?=
 =?utf-8?B?RlJTeHR4ZVYzRTduTkxZOVBIMklPcmhEV1pkb09xWjB3NWNaaVRZcjgzNjBj?=
 =?utf-8?B?NGttdGR3YlhlUFRtNzRERWF3L296SW9JZ0pCYW51dm81TXdEcEhXRHZjMmlL?=
 =?utf-8?B?a3UzdHAwRjdTdnlqY0s5TU5hSEsvSGtseFloS3FNT2JyZnZ2RWYyanNLTC9N?=
 =?utf-8?B?SWRnZ0dBYnFiV3FxTklCNDE2Y01ZTGFkbDhOU3NHUlhyc1FCaTRWSVRZRHV3?=
 =?utf-8?B?R1hQRitxRVR1cDNTUGMwQnlLdVhFS2JsR0dmN2pFNm5oaE5oMDNkdUV4N2VQ?=
 =?utf-8?B?SE5aWkZBZE5wS21yZEVlSXdrVzFCeXh2cFNkNWYyd3ZvK2dFdVQra0dJMmw4?=
 =?utf-8?B?UUgwUEtRdEdqRXdOTTRvQmRKL0pVTUZweTVqdXBlRHdlc3JvZWo3YUNjYmZv?=
 =?utf-8?B?MGxHZlBJTHZLZC9PTU5TMnJIS3pxLzhpZUYyS2FscUxvbXlJWjNrWDltenRl?=
 =?utf-8?B?VHBaWjRWUFFoTkREZ3B2WTBIczllSjRrMGVJVVh6dUZ6b1p5RWJOVnhpQ2lG?=
 =?utf-8?B?M21rdGV4Q3RLYmJ3QXRrVEFHeUVzeXVPa3FRMGU5Wi92UHM1UGhock52ZDRh?=
 =?utf-8?B?d25KVjZld2VvL3RvSldjdDliOS9lWkhZMGt1S3NpRWRMQk1ZTkcvYmR2OFky?=
 =?utf-8?B?eXZRZTVpQmczS2ZaSnhPclVLV3ZuUTZwZFROdC9ITWhHZ2xXNjFpM01CMTA4?=
 =?utf-8?B?Q0tWUXZidWJCam80R3piUEVMbjlUa3d6cGF1eWlncnVMQm9LQ3J1SUt0MDBF?=
 =?utf-8?B?ekI0SWxZTEVONXR1UlhQaXdIVGRjMThvMkpZZmVQZFlxTXBFTmtiRUhDb1JG?=
 =?utf-8?B?Ykp1L2ljRFI5TWV5WjBrNFo0ME9rOU1Fd2ZQa2g1OUlGazc1YzVkTkJwYWor?=
 =?utf-8?B?bGRvSEtBOUV6NnhnNVo4UEoveENTWFZVbzZEMFZKa1J3SzFhTXlvUWpWQWdT?=
 =?utf-8?B?OW55d08zb0ZSZ2dvOGtEemVRUWUvREpCN01QWCtydzVOdkF4NEFWUjZhcS94?=
 =?utf-8?B?M3A4YjhJQnZKbGVZS2hJdTZBaklYWFBqMzBBVUdDY0t4YmMzOGJtM1VJc2p5?=
 =?utf-8?B?aU1CdmxTcFVjR0ZXU3VEK09EQkxRK3NrVEc3TVlpdXNMUjhla2ErZ0pCUWx6?=
 =?utf-8?B?Q1JOS0FzenpmZWpLVmZBZGJhNmJINURmZlRqQ3FzN3JZbVA2RERqelZsUHZ3?=
 =?utf-8?B?WjhtRXFxSUpoY3ErZ1NoSEZaU3VZenRFTHZEcHlxUVZHVEJkbGpRNFd0c0NV?=
 =?utf-8?B?bktJaHBTTk1ITXRjYTZnYys1Q01LNXZvRnU0aTBCS3g0ci9ZVDA5M3VUcUFM?=
 =?utf-8?B?YURKSHkrZnVYNXdaa3BqaFFER2tpeklhbTByay9iQ282WmFwS0tQaExFczY0?=
 =?utf-8?B?SElhbXVRZVZuN2V4NHJCTGZUTFJZTDQxamxBYS9FM1BMbVdSdEUzcGVhcHhy?=
 =?utf-8?Q?MZv7MTylGiU1G+lWZ91A9NharvH97UWi?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OXN4SEtJTGZxYnl4WW5CcDFveG5uZ3UwcXV6ekk1K3lPSU5oNFpMcW9GanZs?=
 =?utf-8?B?UG5FYk5zUGltdWY2UXpESGVKOERBNE03VVZPOGJMelp2bkVjTEV3ck9zbHUx?=
 =?utf-8?B?MEdaNXpxbFdQNVJ2dExHWi9ybGxEbS9hTTl1OUNmeHBUazlOdXdTRVljYU90?=
 =?utf-8?B?dndXZ2ZzbVE0OXh4Mjdsbko2Q0xnNnM2SFN0K25heTJoVVo0MGVsVjJwT2Fy?=
 =?utf-8?B?bGkzZ1loc2VXU0hHNHN4TkJRSmZ2OE5HTHQzeDY1T05jcXorSmNsbk1kWDVB?=
 =?utf-8?B?RWVqYUFCdWMwR1JhcFZSWEovWjB6bjc0QkIzSy9yZHl6TlpVMGtKZzAvSkhJ?=
 =?utf-8?B?MVZ2TklRQlRZZkdQQWp4RlI2emR1bTgydGljeENVcXJqU2s4MDN2WmdiejhN?=
 =?utf-8?B?aGRpc2p5dUhoT2dIYXVEMFlIWlBaYnFhNnlTQUFHNWNQcnExRnZ4U1dJYXRV?=
 =?utf-8?B?R2l1ZUVsR2VqZ1hHY1JXZnBxL0NxVStlWkZ3VlhSZFNkWjZJRUg3MEhlSmZM?=
 =?utf-8?B?cSs3OWhtS2pWTElvakdpT0pJMVV0Z3BndXZuNlBPcVNqNkZDZmpFMm9FZXZT?=
 =?utf-8?B?VDdJMTQ0QzkrOGtDQ3JPK3N0QVpmSERyTnJnSk40OG5DNlB2S3RXb3BWTFhS?=
 =?utf-8?B?YkdVNDN6Yk41ZzFzemFFNEp3WldzVTBjNnRWdzIxYWtRZ1FSMVBrdGcvejdS?=
 =?utf-8?B?MDdvckdLelQyV3Z0aU1VZGYxOW9XY2lQS0VWUVh0VWdqV21paGJEWjV4eUtJ?=
 =?utf-8?B?N2tkZVZWay9DU1lCSktaMWZjVVRGeElicFVBK3Jmc2JWUmJDdlU4SzJIa2Vy?=
 =?utf-8?B?S0VwS3BTRENQWXVBa0RVUVR3WVloVGw3Yk9lek8vd2c4RjhTbitPY1JvVzU2?=
 =?utf-8?B?cFJ5M1hLRHRCTEUvZVlwRmxrK0RhOXpYNmRGWmZEbStyL29zbzJoZWdpS0lI?=
 =?utf-8?B?U2M0YjZkc1FvTEduMlVoZXpKQ1JrSFZlVW5Ld3A1bnY0cXFiOFUyRDhIKzhL?=
 =?utf-8?B?b2RMQTlqSzdtbjBNbFVXVVgwTkE5WVpwUVJuMlJmVkMrMjhybTdFaUluQnEw?=
 =?utf-8?B?ZVZXa1FkRmtDSWVnS1AzQ3RVTVB1cnIrM3pkMlZyZGtjQ2x1YWViZ2N3TlRH?=
 =?utf-8?B?dTRRMkVQNGI2aTdQUGk4NENUdFZJNTRaZlFiMUd6dld4aEJNWFZBUEQ3RWxv?=
 =?utf-8?B?Q2VwUHdZUlY5U1BFNStaNGdjQUlwK2ZrRnN0RFFnczU5MkxUK0trTEkxZjJ1?=
 =?utf-8?B?cUkrUG1lbm94eW9TVXhvV2FpZ2hJaVE2c0FYdkxZYVJiLzBMQTF2S2IrNnZa?=
 =?utf-8?B?RHdjZU5FTUFRZm85eCs1Wi9GMVVrRmh5blRycWlkMXc0WUR4YTRSME1oZVpV?=
 =?utf-8?B?cXZweHdOM2xhcWt4NU1xRlR4M3hzWldIOTQvWFBvb0M4bUFJTTlYeXp6VVlK?=
 =?utf-8?B?N0NVSENqNGsySVpqbk1WaG5TbU82NjJZc3M4YXR4djE1cHNqTHBrVE14R05S?=
 =?utf-8?B?ZDNKK1dsaWV0eW1aVTN0bThGemRyVVdqRjRSN0xYRUI3L1JFSEVmNy9VeFVh?=
 =?utf-8?B?bWV3WFBqcUk5d0dmZmo1YWVMY0RSc3UyV3hqRlhhZjF6NHNTU2I5WXRwcXpU?=
 =?utf-8?B?c3VlY3NmUmRwRHZVVDdRVlR6c2hDOFlia2ZDc0dWY3dkTWRENm9yNGZBTHNM?=
 =?utf-8?B?SzVkQXlQdnN2NmI3cE1WTWRZeGZmdU4vTC9ZSlpKM283cTJsMHMxWGRDSXFS?=
 =?utf-8?B?TldvanY4YTdVRkZ4Nng5eEtRNnlkbW1nWUlqYkJzNUg0L1NHYWRldzhlS2xw?=
 =?utf-8?B?R1hidG5tZHJybnQ1dmdGMUVCbmFnVEZxNUVtVlhJOHduU2FXaGtIUTdPT0Ft?=
 =?utf-8?B?NXZXU2tQTEpZYVZ3TWVKRm9HdmtaMFJBM2M2UU5xTllxcDFVdk5sbWNrVEJh?=
 =?utf-8?B?aFpNcWhEbFd3dE02Y2p6L3dYS0RNNXdNLzNJN3kwQ2RDMEdLazNNK0gxVFB4?=
 =?utf-8?B?OXFiWU52eE5CMGlZS2l1Q2xjQ1RUSURaOFcrdXYwd084eDFYa0thbS9NUmdw?=
 =?utf-8?B?Rmh5dVZMOEJqb0NlWmxXRmpCemJuSHpMU21MWDBhZ3FtUStjVEVOM1l1amc1?=
 =?utf-8?Q?FCXtk8GDU3yENjrs3M/mH48Pf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a86160bb-b4a3-41f7-1fd7-08de290ad18f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 14:32:37.8186
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q0z1kbD9yDmTv2grqGm6zArmEPd82dr2x/CmptntfM/rDiXRdNypFTLZuuoC1/GtDrpRHMvNn1g1atlYNXVb5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9678



On 11/21/2025 2:20 AM, Sultan Alsawaf wrote:
> On Wed, Nov 19, 2025 at 06:14:17PM +0800, Du, Bin wrote:
>>
>>
>> On 11/18/2025 3:35 PM, Sultan Alsawaf wrote:
>>> On Wed, Nov 12, 2025 at 06:21:33PM +0800, Du, Bin wrote:
>>>>
>>>>
>>>> On 11/12/2025 3:38 PM, Sultan Alsawaf wrote:
>>>>> On Tue, Nov 11, 2025 at 11:06:41PM -0800, Sultan Alsawaf wrote:
>>>>>> On Wed, Nov 12, 2025 at 02:32:51PM +0800, Du, Bin wrote:
>>>>>>> Thanks Sultan for your information.
>>>>>>>
>>>>>>> On 11/12/2025 9:21 AM, Sultan Alsawaf wrote:
>>>>>>>> On Tue, Nov 11, 2025 at 03:33:42PM -0800, Sultan Alsawaf wrote:
>>>>>>>>> On Tue, Nov 11, 2025 at 05:58:10PM +0800, Du, Bin wrote:
>>>>>>>>>>
>>>>>>>>>> On 11/11/2025 5:05 PM, Sultan Alsawaf wrote:
>>>>>>>>>>
>>>>>>>>>>> On Mon, Nov 10, 2025 at 05:46:28PM +0800, Du, Bin wrote:
>>>>>>>>>>>> Thank you, Sultan, for your time, big effort, and constant support.
>>>>>>>>>>>> Apologies for my delayed reply for being occupied a little with other
>>>>>>>>>>>> matters.
>>>>>>>>>>>>
>>>>>>>>>>>> On 11/10/2025 4:33 PM, Sultan Alsawaf wrote:
>>>>>>>>>>>>> Hi Bin,
>>>>>>>>>>>>>
>>>>>>>>>>>>> On Wed, Nov 05, 2025 at 01:25:58AM -0800, Sultan Alsawaf wrote:
>>>>>>>>>>>>>> Hi Bin,
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> To expedite review, I've attached a patch containing a bunch of fixes I've made
>>>>>>>>>>>>>> on top of v5. Most of my changes should be self-explanatory; feel free to ask
>>>>>>>>>>>>>> further about specific changes if you have any questions.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> I haven't had a chance to review all of the v4 -> v5 changes yet, but I figured
>>>>>>>>>>>>>> I should send what I've got so far.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> FYI, there is a regression in isp4if_dequeue_buffer() where the bufq lock isn't
>>>>>>>>>>>>>> protecting the list_del() anymore. I also checked the compiler output when using
>>>>>>>>>>>>>> guard() versus scoped_guard() in that function and there is no difference:
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>         sha1sum:
>>>>>>>>>>>>>>         5652a0306da22ea741d80a9e03a787d0f71758a8  isp4_interface.o // guard()
>>>>>>>>>>>>>>         5652a0306da22ea741d80a9e03a787d0f71758a8  isp4_interface.o // scoped_guard()
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> So guard() should be used there again, which I've done in my patch.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> I also have a few questions:
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> 1. Does ISP FW provide a register interface to disable the IRQ? If so, it is
>>>>>>>>>>>>>>          faster to use that than using disable_irq_nosync() to disable the IRQ from
>>>>>>>>>>>>>>          the CPU's side.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> 2. When the IRQ is re-enabled in isp4sd_fw_resp_func(), is there anything
>>>>>>>>>>>>>>          beforehand to mask all pending interrupts from the ISP so that there isn't a
>>>>>>>>>>>>>>          bunch of stale interrupts firing as soon the IRQ is re-enabled?
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> 3. Is there any risk of deadlock due to the stream kthread racing with the ISP
>>>>>>>>>>>>>>          when the ISP posts a new response _after_ the kthread determines there are no
>>>>>>>>>>>>>>          more new responses but _before_ the enable_irq() in isp4sd_fw_resp_func()?
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> 4. Why are some lines much longer than before? It seems inconsistent that now
>>>>>>>>>>>>>>          there is a mix of several lines wrapped to 80 cols and many lines going
>>>>>>>>>>>>>>          beyond 80 cols. And there are multiple places where code is wrapped before
>>>>>>>>>>>>>>          reaching 80 cols even with lots of room left, specifically for cases where it
>>>>>>>>>>>>>>          wouldn't hurt readability to put more characters onto each line.
>>>>>>>>>>>>>
>>>>>>>>>>>>> I've attached a new, complete patch of changes to apply on top of v5. You may
>>>>>>>>>>>>> ignore the incomplete patch from my previous email and use the new one instead.
>>>>>>>>>>>>>
>>>>>>>>>>>>> I made many changes and also answered questions 1-3 myself.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Please apply this on top of v5 and let me know if you have any questions.
>>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>> Sure, will review, apply and test your patch accordingly. Your contribution
>>>>>>>>>>>> is greatly appreciated, will let you know if there is any question or
>>>>>>>>>>>> problem.
>>>>>>>>>>>>
>>>>>>>>>>>>> BTW, I noticed a strange regression in v5 even without any of my changes: every
>>>>>>>>>>>>> time you use cheese after using it one time, the video will freeze after 30-60
>>>>>>>>>>>>> seconds with this message printed to dmesg:
>>>>>>>>>>>>>         [ 2032.716559] amd_isp_capture amd_isp_capture: -><- fail respid unknown respid(0x30002)
>>>>>>>>>>>>>
>>>>>>>>>>>>> And the video never unfreezes. I haven't found the cause for the regression yet;
>>>>>>>>>>>>> can you try to reproduce it?
>>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>> Really weird, we don't see this issue either in dev or QA test. Is it 100%
>>>>>>>>>>>> reproducible and any other fail or err in the log?
>>>>>>>>>>>
>>>>>>>>>>> Yes, it's 100% reproducible. There's no other message in dmesg, only that one.
>>>>>>>>>>>
>>>>>>>>>>> Sometimes there is a stop stream error when I close cheese after it froze:
>>>>>>>>>>>
>>>>>>>>>>>        [  656.540307] amd_isp_capture amd_isp_capture: fail to disable stream
>>>>>>>>>>>        [  657.046633] amd_isp_capture amd_isp_capture: fail to stop steam
>>>>>>>>>>>        [  657.047224] amd_isp_capture amd_isp_capture: disabling streaming failed (-110)
>>>>>>>>>>>
>>>>>>>>>>> When I revert to v4 I cannot reproduce it at all. It seems to be something in
>>>>>>>>>>> v4 -> v5 that is not fixed by any of my changes.
>>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Hi Sultan, could you please try following modifications on top of v5 to see
>>>>>>>>>> if it helps?
>>>>>>>>>>
>>>>>>>>>> diff --git a/drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
>>>>>>>>>> b/drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
>>>>>>>>>> index 39c2265121f9..d571b3873edb 100644
>>>>>>>>>> --- a/drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
>>>>>>>>>> +++ b/drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
>>>>>>>>>> @@ -97,7 +97,7 @@
>>>>>>>>>>
>>>>>>>>>> #define ADDR_SPACE_TYPE_GPU_VA          4
>>>>>>>>>>
>>>>>>>>>> -#define FW_MEMORY_POOL_SIZE             (200 * 1024 * 1024)
>>>>>>>>>> +#define FW_MEMORY_POOL_SIZE             (100 * 1024 * 1024)
>>>>>>>>>>
>>>>>>>>>> /*
>>>>>>>>>>       * standard ISP mipicsi=>isp
>>>>>>>>>> diff --git a/drivers/media/platform/amd/isp4/isp4_subdev.c
>>>>>>>>>> b/drivers/media/platform/amd/isp4/isp4_subdev.c
>>>>>>>>>> index 248d10076ae8..acbc80aa709e 100644
>>>>>>>>>> --- a/drivers/media/platform/amd/isp4/isp4_subdev.c
>>>>>>>>>> +++ b/drivers/media/platform/amd/isp4/isp4_subdev.c
>>>>>>>>>> @@ -697,7 +697,7 @@ static int isp4sd_stop_resp_proc_threads(struct
>>>>>>>>>> isp4_subdev *isp_subdev)
>>>>>>>>>>             return 0;
>>>>>>>>>> }
>>>>>>>>>>
>>>>>>>>>> -static int isp4sd_pwroff_and_deinit(struct isp4_subdev *isp_subdev)
>>>>>>>>>> +static int isp4sd_pwroff_and_deinit(struct isp4_subdev *isp_subdev, bool
>>>>>>>>>> irq_enabled)
>>>>>>>>>> {
>>>>>>>>>>             struct isp4sd_sensor_info *sensor_info = &isp_subdev->sensor_info;
>>>>>>>>>>             unsigned int perf_state = ISP4SD_PERFORMANCE_STATE_LOW;
>>>>>>>>>> @@ -716,8 +716,9 @@ static int isp4sd_pwroff_and_deinit(struct isp4_subdev
>>>>>>>>>> *isp_subdev)
>>>>>>>>>>                     return 0;
>>>>>>>>>>             }
>>>>>>>>>>
>>>>>>>>>> -       for (int i = 0; i < ISP4SD_MAX_FW_RESP_STREAM_NUM; i++)
>>>>>>>>>> -               disable_irq(isp_subdev->irq[i]);
>>>>>>>>>> +       if (irq_enabled)
>>>>>>>>>> +               for (int i = 0; i < ISP4SD_MAX_FW_RESP_STREAM_NUM; i++)
>>>>>>>>>> +                       disable_irq(isp_subdev->irq[i]);
>>>>>>>>>>
>>>>>>>>>>             isp4sd_stop_resp_proc_threads(isp_subdev);
>>>>>>>>>>             dev_dbg(dev, "isp_subdev stop resp proc streads suc");
>>>>>>>>>> @@ -813,7 +814,7 @@ static int isp4sd_pwron_and_init(struct isp4_subdev
>>>>>>>>>> *isp_subdev)
>>>>>>>>>>
>>>>>>>>>>             return 0;
>>>>>>>>>> err_unlock_and_close:
>>>>>>>>>> -       isp4sd_pwroff_and_deinit(isp_subdev);
>>>>>>>>>> +       isp4sd_pwroff_and_deinit(isp_subdev, false);
>>>>>>>>>>             return -EINVAL;
>>>>>>>>>> }
>>>>>>>>>>
>>>>>>>>>> @@ -985,7 +986,7 @@ static int isp4sd_set_power(struct v4l2_subdev *sd, int
>>>>>>>>>> on)
>>>>>>>>>>             if (on)
>>>>>>>>>>                     return isp4sd_pwron_and_init(isp_subdev);
>>>>>>>>>>             else
>>>>>>>>>> -               return isp4sd_pwroff_and_deinit(isp_subdev);
>>>>>>>>>> +               return isp4sd_pwroff_and_deinit(isp_subdev, true);
>>>>>>>>>> }
>>>>>>>>>>
>>>>>>>>>> static const struct v4l2_subdev_core_ops isp4sd_core_ops = {
>>>>>>>>>
>>>>>>>>> No difference sadly; same symptoms as before. FYI, your email client broke the
>>>>>>>>> patch formatting so I couldn't apply it; it hard wrapped some lines to 80 cols,
>>>>>>>>> replaced tabs with spaces, and removed leading spaces on each context line, so I
>>>>>>>>> had to apply it manually. To confirm I applied it correctly, here is my diff:
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h b/drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
>>>>>>>>> index 39c2265121f9..d571b3873edb 100644
>>>>>>>>> --- a/drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
>>>>>>>>> +++ b/drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
>>>>>>>>> @@ -97,7 +97,7 @@
>>>>>>>>>      #define ADDR_SPACE_TYPE_GPU_VA          4
>>>>>>>>> -#define FW_MEMORY_POOL_SIZE             (200 * 1024 * 1024)
>>>>>>>>> +#define FW_MEMORY_POOL_SIZE             (100 * 1024 * 1024)
>>>>>>>>>      /*
>>>>>>>>>       * standard ISP mipicsi=>isp
>>>>>>>>> diff --git a/drivers/media/platform/amd/isp4/isp4_subdev.c b/drivers/media/platform/amd/isp4/isp4_subdev.c
>>>>>>>>> index 4bd2ebf0f694..500ef0af8a41 100644
>>>>>>>>> --- a/drivers/media/platform/amd/isp4/isp4_subdev.c
>>>>>>>>> +++ b/drivers/media/platform/amd/isp4/isp4_subdev.c
>>>>>>>>> @@ -669,7 +669,7 @@ static int isp4sd_stop_resp_proc_threads(struct isp4_subdev *isp_subdev)
>>>>>>>>>      	return 0;
>>>>>>>>>      }
>>>>>>>>> -static int isp4sd_pwroff_and_deinit(struct isp4_subdev *isp_subdev)
>>>>>>>>> +static int isp4sd_pwroff_and_deinit(struct isp4_subdev *isp_subdev, bool irq_enabled)
>>>>>>>>>      {
>>>>>>>>>      	struct isp4sd_sensor_info *sensor_info = &isp_subdev->sensor_info;
>>>>>>>>>      	unsigned int perf_state = ISP4SD_PERFORMANCE_STATE_LOW;
>>>>>>>>> @@ -688,8 +688,9 @@ static int isp4sd_pwroff_and_deinit(struct isp4_subdev *isp_subdev)
>>>>>>>>>      		return 0;
>>>>>>>>>      	}
>>>>>>>>> -	for (int i = 0; i < ISP4SD_MAX_FW_RESP_STREAM_NUM; i++)
>>>>>>>>> -		disable_irq(isp_subdev->irq[i]);
>>>>>>>>> +	if (irq_enabled)
>>>>>>>>> +		for (int i = 0; i < ISP4SD_MAX_FW_RESP_STREAM_NUM; i++)
>>>>>>>>> +			disable_irq(isp_subdev->irq[i]);
>>>>>>>>>      	isp4sd_stop_resp_proc_threads(isp_subdev);
>>>>>>>>>      	dev_dbg(dev, "isp_subdev stop resp proc streads suc");
>>>>>>>>> @@ -785,7 +786,7 @@ static int isp4sd_pwron_and_init(struct isp4_subdev *isp_subdev)
>>>>>>>>>      	return 0;
>>>>>>>>>      err_unlock_and_close:
>>>>>>>>> -	isp4sd_pwroff_and_deinit(isp_subdev);
>>>>>>>>> +	isp4sd_pwroff_and_deinit(isp_subdev, false);
>>>>>>>>>      	return -EINVAL;
>>>>>>>>>      }
>>>>>>>>> @@ -957,7 +958,7 @@ static int isp4sd_set_power(struct v4l2_subdev *sd, int on)
>>>>>>>>>      	if (on)
>>>>>>>>>      		return isp4sd_pwron_and_init(isp_subdev);
>>>>>>>>>      	else
>>>>>>>>> -		return isp4sd_pwroff_and_deinit(isp_subdev);
>>>>>>>>> +		return isp4sd_pwroff_and_deinit(isp_subdev, true);
>>>>>>>>>      }
>>>>>>>>>      static const struct v4l2_subdev_core_ops isp4sd_core_ops = {
>>>>>>>>>
>>>>>>>>>> On the other hand, please also add the patch in amdgpu which sets *bo to
>>>>>>>>>> NULL in isp_kernel_buffer_alloc() which you mentioned in another thread.
>>>>>>>>>
>>>>>>>>> Yep, I have been doing all v5 testing with that patch applied.
>>>>>>>>>
>>>>>>>>> BTW, I have verified the IRQ changes are not the cause for the regression; I
>>>>>>>>> tested with IRQs kept enabled all the time and the issue still occurs.
>>>>>>>>>
>>>>>>>>> I did observe that ISP stops sending interrupts when the video stream freezes.
>>>>>>>>> And, if I replicate the bug enough times, it seems to permanently break FW until
>>>>>>>>> a full machine reboot. Reloading amd_capture with the v4 driver doesn't recover
>>>>>>>>> the ISP when this happens.
>>>>>>>>>
>>>>>>>>> As an improvement to the driver, can we do a hard reset of ISP on driver probe?
>>>>>>>>> I am assuming hardware doesn't need too long to settle after hard reset, maybe
>>>>>>>>> a few hundred milliseconds? This would ensure ISP FW is always in a working
>>>>>>>>> state when the driver is loaded.
>>>>>>>>>
>>>>>>>
>>>>>>> Actually, each time the camera is activated, the ISP driver powers on the
>>>>>>> ISP and initiates its firmware from the beginning; when the camera is
>>>>>>> closed, the ISP is powered off..
>>>>>>
>>>>>> Hmm, well I am able to put the ISP in a completely unusable state that doesn't
>>>>>> recover when I unload and reload amd_capture. Or maybe it is the sensor that is
>>>>>> stuck in a broken state?
>>>>>
>>>>> Here is the log output when I try to start cheese after unloading and reloading
>>>>> amd_capture, where the ISP is in the broken state that requires rebooting the
>>>>> laptop (annotated with notes of what I saw/did at each point in time):
>>>>>
>>>>> ==> opened cheese
>>>>> ==> cheese froze after a few seconds
>>>>> ==> closed cheese
>>>>>      [   34.570823] amd_isp_capture amd_isp_capture: fail to disable stream
>>>>>      [   35.077503] amd_isp_capture amd_isp_capture: fail to stop steam
>>>>>      [   35.077525] amd_isp_capture amd_isp_capture: disabling streaming failed (-110)
>>>>> ==> unloaded amd_capture
>>>>> ==> loaded amd_capture
>>>>> ==> opened cheese
>>>>>      [  308.039721] amd_isp_capture amd_isp_capture: ISP CCPU FW boot failed
>>>>>      [  308.043961] amd_isp_capture amd_isp_capture: fail to start isp_subdev interface
>>>>>      [  308.044188] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>      [  308.044194] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>      [  308.044196] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>      [  308.044197] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>      [  308.044198] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>      [  308.044198] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>      [  308.044199] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>      [  308.044200] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>      [  308.044200] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>      [  308.044201] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>      [  308.044202] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>      [  308.065226] amd_isp_capture amd_isp_capture: power up isp fail -22
>>>>>      [  308.174814] amd_isp_capture amd_isp_capture: ISP CCPU FW boot failed
>>>>>      [  308.177807] amd_isp_capture amd_isp_capture: fail to start isp_subdev interface
>>>>>      [  308.178036] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>      [  308.178043] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>      [  308.178044] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>      [  308.178045] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>      [  308.178046] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>      [  308.178047] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>      [  308.178048] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>      [  308.178048] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>      [  308.178049] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>      [  308.178050] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>      [  308.178050] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>      [  308.198776] amd_isp_capture amd_isp_capture: power up isp fail -22
>>>>>      [  308.306835] amd_isp_capture amd_isp_capture: ISP CCPU FW boot failed
>>>>>      [  308.311533] amd_isp_capture amd_isp_capture: fail to start isp_subdev interface
>>>>>      [  308.311723] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>      [  308.311723] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>      [  308.311724] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>      [  308.311725] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>      [  308.311725] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>      [  308.311726] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>      [  308.311726] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>      [  308.311726] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>      [  308.311727] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>      [  308.311727] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>      [  308.311727] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>      [  308.335281] amd_isp_capture amd_isp_capture: power up isp fail -22
>>>>>
>>>>
>>>> Thanks Sultan for the detailed info, I agree with you, tend to believe it
>>>> may related to the sensor, I will follow up with the FW team to investigate
>>>> further.
>>>>
>>>>>>>>> Thanks,
>>>>>>>>> Sultan
>>>>>>>>
>>>>>>>> A small update: I reproduced the issue on v4, but it took several more cycles of
>>>>>>>> closing/opening cheese and waiting 30s compared to v5.
>>>>>>>>
>>>>>>>> Right now my best guess is that this is a timing issue with respect to FW that
>>>>>>>> was exposed by the v5 changes. v5 introduced slight changes in code timing, like
>>>>>>>> with the mutex locks getting replaced by spin locks.
>>>>>>>>
>>>>>>>> I'll try to insert mdelays to see if I can expose the issue that way on v4.
>>>>>>>>
>>>>>>>
>>>>>>> Could you kindly provide the FW used?
>>>>>>
>>>>>>      commit a89515d3ff79f12099f7a51b0f4932b881b7720e
>>>>>>      Author: Pratap Nirujogi <pratap.nirujogi@amd.com>
>>>>>>      Date:   Thu Aug 21 15:40:45 2025 -0400
>>>>>>
>>>>>>          amdgpu: Update ISP FW for isp v4.1.1
>>>>>>          From internal git commit:
>>>>>>          24557b7326e539183b3bc44cf8e1496c74d383d6
>>>>>>          Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
>>>>>>
>>>>>> Sultan
>>>>>
>>>>> Sultan
>>>>
>>>> -- 
>>>> Regards,
>>>> Bin
>>>>
>>>
>>> Thanks, Bin. I looked deeper at the code and didn't find any reason the issue
>>> could be due to the driver. Also, the problem happens outside of cheese for me
>>> (like in Chromium with Zoom meetings), so v5 of the driver is pretty much
>>> unusable for me until this issue is fixed. :(
>>>
>>
>> Oh, really sad to hear that :(, there must be some difference between our
>> platforms because we still can't reproduce the issue you mentioned, to help
>> on this, would you share more info like your Ubuntu version, Kernel
>> version/source, ISP driver version, BIOS version, .config used to build the
>> kernel, FW: commit a89515d3ff79f12099f7a51b0f4932b881b7720e.
>> Just wondering, if possible, could you provide the kernel image either so we
>> can directly test on it. Also, the HW is not broken, right?
> 
> I figured out why you cannot reproduce the issue. You need to pass amd_iommu=off
> on the kernel command line to trigger the issue.
> 
> The reason I am using amd_iommu=off is because this laptop otherwise doesn't
> ever wake from suspend under Linux once it reaches the S0i3 state. The keyboard,
> power button, and lid do not respond to wake up the laptop from suspend. This
> happens 100% of the time once S0i3 is reached, and occurs on the OEM Ubuntu
> image from HP as well. The only fix I have found is to pass amd_iommu=off, which
> other owners of this laptop also found fixes the issue.

You're the first report I've heard of this.

Are you using storage encryption or a storage password of any kind 
(software or hardware) by chance?

If you are can you please describe it?

Also can you generate a report using amd-s2idle?  I don't think it's 
going to flag anything but I would like to confirm.

> 
>>
>>> I've attached a v2 of my big patch, which includes more improvements and another
>>> ringbuffer bug fix. Please check the ringbuffer logic on the FW side to make
>>> sure FW doesn't have the same bug, where it may let rd_ptr == wr_ptr upon
>>> filling the ringbuffer, even though rd_ptr == wr_ptr is supposed to indicate the
>>> ringbuffer is empty.
>>>
>>
>> Thank you for your huge contribution. We'll review, verify, and merge as
>> much as possible into v6 and hope this marks the final significant update.
>> We typically avoid large changes to reduce regression risks and minimize
>> additional debugging, testing, and schedule impact.
> 
> I understand. Don't worry, that is indeed the final significant update. Please
> let me know which changes you don't merge in, since it could be an important
> change. And thank you for considering my changes! :)
> 
> And please be sure to check the ringbuffer code in FW to see if it has the same
> bug I found in the driver.
> 
>>> Also, I have a suggestion for a FW change to improve IRQ handling in the driver:
>>>
>>> 1. Change ISP_SYS_INT0_ACK behavior so that it also clears the acked interrupts
>>>      from ISP_SYS_INT0_EN.
>>>
>>
>> Based on my understanding, this pertains to the hardware design and cannot
>> be modified.
>>
>>> 2. Change ISP_SYS_INT0_EN behavior so that it only enables the interrupts in the
>>>      provided mask, so RMW of ISP_SYS_INT0_EN in the driver won't be necessary to
>>>      re-enable interrupts for a stream.
>>>
>>
>> I'm not sure I understand your point. Are you saying that ISP_SYS_INT0_EN
>> only considers '1' in the mask and ignores '0'? If that's the case, I'm
>> curious about how to disable an interrupt. Also, this is also determined by
>> the hardware design.
> 
> No worries, it's not a big deal. Just a small optimization I thought of.
> 
> My idea was:
> 
> 1. Current behavior of ISP_SYS_INT0_ACK:
>       isp4hw_wreg(mmio, ISP_SYS_INT0_ACK, intr_ack) results in:
> 
>           regmap[ISP_SYS_INT0_STATUS] &= ~intr_ack;
> 
>     Proposed behavior of ISP_SYS_INT0_ACK:
>       isp4hw_wreg(mmio, ISP_SYS_INT0_ACK, intr_ack) results in:
> 
>           regmap[ISP_SYS_INT0_STATUS] &= ~intr_ack;
>           regmap[ISP_SYS_INT0_EN] &= ~intr_ack;
> 
> 2. Current behavior of ISP_SYS_INT0_EN:
>       isp4hw_wreg(mmio, ISP_SYS_INT0_EN, intr_en) results in:
> 
>           regmap[ISP_SYS_INT0_EN] = intr_en;
> 
>     Proposed behavior of ISP_SYS_INT0_EN:
>       isp4hw_wreg(mmio, ISP_SYS_INT0_EN, intr_en) results in:
> 
>           regmap[ISP_SYS_INT0_EN] |= intr_en;
> 
> 
> And to disable an interrupt with this design, you can write to ISP_SYS_INT0_ACK.
> 
> Sultan


