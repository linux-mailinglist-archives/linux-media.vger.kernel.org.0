Return-Path: <linux-media+bounces-39511-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 81013B21E68
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 08:34:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38D6F62663B
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 06:34:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE3D323ED6A;
	Tue, 12 Aug 2025 06:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="opWj6ns3"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2059.outbound.protection.outlook.com [40.107.100.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F5E311C18;
	Tue, 12 Aug 2025 06:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754980461; cv=fail; b=poOnDep43B9K8iAJE4ZDm3DfLPkrMAvZdEPRRV5l5uUG/eszPhb0mhoc2kQ8Zz41+5FFZaPS2Avwq+AmilVCa8NirjIMCHx/hveqIcW5E1TjO5msKfHGWFN6JrQFQTPkjpYQBbyVq2VdOymhevscQgTEXN+7FfRoGMUyM7Q0VV0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754980461; c=relaxed/simple;
	bh=XqdLs7LyVOvLkCM3Br1FgnJZMTuaHrqS7awH93kuNFo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=g9IaYCP7PgduJupHODqszB/EHjmg9eN60Tng2gY5pslzXGokAkZ21WoqUANU87CS7I1buL5+wZOCKYVGMx+QIwVs/Gt/o1jyr6fYnEi5cVWaoPhkICWvqGiEk/na0IVFJm4Fh0XrHwYtaHgzjknF+59YST0Lg9DIhkgwrhngca4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=opWj6ns3; arc=fail smtp.client-ip=40.107.100.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SegkHnutv66FPxSLGQTPR6iyG7r0IGxy5iZuqheSU94eEs7SKYfJBpsJVklW0PBp5ChYW6Ln5jMgMa3Ok2cU+lrYIMYRTZNBiCwCuE5l0u/JvWZGUbaYUzm4qxnXLdW30fQfNs2na6FY8AWNKeTGQNIwRU25NSoDCTg1REIyCx5P2s2WaWC8NoH7QRt+Bj50/sj1Sb4f7eKB4SYYUfWtwXwgiQVgDY3tRdlcRZNcpPnOBdCa/R0QPq7+1ovt09V0ES3YrPlaM3fXUtae5k8ua4UK9MOf4DFxNFGc3LOVuxmf+jDx3m3cfhprMtMXEKxg0kQMsDwF7gicsBp81culug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rQ+xldP1msu7JYldBsj1/3HQSlG1jOw6ARLMLlyajcg=;
 b=XXcANKQv8hdMYwIwePf1XKFYjVMp1+U8/hVz6251xipfhEemOzOjCQjxkuu+gRMODBbgxO3g6TcFafJLHp+9bAIQbXxPZf7bGv9OiJD/w9eytxwwBGucdtpo/nLtTIinTyTMreIeiAEftjPnqUWvnU6QXj2skrY8x7XpPHmd06pSRtq61FhgvCOcnbNtagf47k2mfsXePERlMqj3Xki8M+Vrh8vHK6ew7YBLfYgAbn7KDf88K5bKal3R7ownXm50f3N4oY2eoHWVbyab/wqg0erJ4BITGK5qZYxR/P2zVdyXSMqHSy9jqUrMtIbowDLAb7npb9wUBdZdlCu82yI1WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rQ+xldP1msu7JYldBsj1/3HQSlG1jOw6ARLMLlyajcg=;
 b=opWj6ns3y4BTkGYx94KZq1E/I+PymqHu5psLHMxjTgyIZPCrYs1FQtmye+RI6C9d0ojuSONZLmB4TJBQOoIjRiOAdkduk4ebxCFDuX4XJY2JA1jwrVvz0RBwSJtPzcXWnA+x0ZOVfreG9xRxCz9t4ckzZMpajlv9dC/gp5WQsIs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7446.namprd12.prod.outlook.com (2603:10b6:510:216::13)
 by CYYPR12MB8729.namprd12.prod.outlook.com (2603:10b6:930:c2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Tue, 12 Aug
 2025 06:34:15 +0000
Received: from PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7]) by PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7%4]) with mapi id 15.20.9009.016; Tue, 12 Aug 2025
 06:34:07 +0000
Message-ID: <1a2e9233-4914-4d27-ae9f-51ca28adf568@amd.com>
Date: Tue, 12 Aug 2025 14:33:53 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] media: platform: amd: isp4 video node and buffers
 handling added
To: Sultan Alsawaf <sultan@kerneltoast.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 sakari.ailus@linux.intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 Mario Limonciello <mario.limonciello@amd.com>, Richard.Gong@amd.com,
 anson.tsao@amd.com
References: <20250618091959.68293-1-Bin.Du@amd.com>
 <20250618091959.68293-7-Bin.Du@amd.com> <aIchBRdmy48BHl2k@sultan-box>
 <7a422602-7a99-4b49-b994-cddd9730cb20@amd.com> <aIq6DpV_cMJWKfhn@sultan-box>
 <aJmHWQMsk6Pdniap@sultan-box> <5500a71a-68bd-4dd1-99cb-6523281f0c7d@amd.com>
 <aJrWb1LfwXf5PGUf@sultan-box>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <aJrWb1LfwXf5PGUf@sultan-box>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0023.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::17) To PH8PR12MB7446.namprd12.prod.outlook.com
 (2603:10b6:510:216::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7446:EE_|CYYPR12MB8729:EE_
X-MS-Office365-Filtering-Correlation-Id: b43a0370-8f3f-48d5-5481-08ddd96a3ab0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YWpwelpYa3Z3UEVzVnRHRytEdjFFb2VSL3pmRGJzeDlXODFJdXVzWWJqcmpO?=
 =?utf-8?B?YTBKKzU3K0dkYnhLS1dEcE92d08yQk1paTR0c2hRUVU2VGxXSERJNjdkRlVm?=
 =?utf-8?B?QjdabFhVaFJkbkNYMGhTTlBwUGlWeTMxS3pKbTh4Q1NyWjdjbHc0WmpHYjh3?=
 =?utf-8?B?NGNhWkxGc3RkWS9uQ2swSm5HV09KemVSZVRhSG9PV0lvaEdJUlZza1l6b2t5?=
 =?utf-8?B?K2tCZnhNKzEySGc3T3FOaHQvNi9OTkxackhRVHlQWWk4VFdQZ2FuazBKd2Np?=
 =?utf-8?B?MmsxUVJSd09ab1lZbVdPQi9pQjNTRHAxR01MVEJWdUI3aTBnWTZybkJBKzlq?=
 =?utf-8?B?YUZIdkVlTi8zZkdvU0VRM0Z6K3ZiT01DNDRzeUJHdGc5SEJjcXBha291SEdG?=
 =?utf-8?B?WXdxcENFQ2FzaE9jbnlVQmpicS9MSjA0bDBQZExsb3R2ZjN1TTNGUEVIb3RS?=
 =?utf-8?B?cGVJNWcrZXpwOWdJM01nTE5yK0VxclA1TFpra2F0R0M2TmJ3bjZUUWdDMGhy?=
 =?utf-8?B?a09VcFFmRUU3dHZ2bldmeldETElJK2x4TTUyWkVkRFlmUkFNRFg4cEpGY0lq?=
 =?utf-8?B?b0dNbGp6a0dmYndpb0ZISDRJQlFLSE9mSHVmZ1R4U3o2VVZQd3VKNDFlUlFG?=
 =?utf-8?B?N2cyczlDTnpqRGJPU3JoK091R2w3RXVDV1hjWG9uOWYvTFhvWUJobzZJMlQ3?=
 =?utf-8?B?Y1BXbkEvMWJFVnJ3WnRXUmJWVG8vZXlqTGRqbzJ2b1dYSDJBRUJiK3Z2WTNa?=
 =?utf-8?B?TWRHbDZaQ2NFWkduemlwbmxWa0xERU43KzVYMVhGRC96dEVZSVhpN1BrMUJM?=
 =?utf-8?B?L3R3c2l4a1VHN3BsQVNsaXViOFllQi8zcC90blMvOTdWRlNDbDd5YnNPT2hP?=
 =?utf-8?B?cUc2ekdhVW4wallPUFJHSHhsdEE4TWVUUmF2YzFBUjVNZWh4Q01nWmFabitz?=
 =?utf-8?B?M3NHeWZqSHVBbnlHb2dPSjhINTAvNUFTTXdtZzd3bFFmV3RGTENSVmtwYnFD?=
 =?utf-8?B?UUpYOXJ0ZUpUSmxoMmtrR2Jpb1JVZzZxQWVEcHM4TW1RVmd3K01uSzlNdThn?=
 =?utf-8?B?bEVkN1ovUk5oWmtGVFk4Wm1STkVUZTdFNkIwaFZ1SldOMkNlRTdCcVYxOFlW?=
 =?utf-8?B?ckJ5VnRKdnU0dzB5R2gyUVdvV1pxKzVicGk0czYxMVhTZGk4MGRneGRkWUNZ?=
 =?utf-8?B?a2p3WkVKL3UwNUdJN3NMUzkrMlltdm95YjUwU2FFd1NrbUd2QzcxK2xhZUZ6?=
 =?utf-8?B?UW5RWHJKR3VmTDRteVA0ZzNWaUp5YUxISUkzMEs0SEVsaWh3QzdiVnNNc3Vp?=
 =?utf-8?B?VmR2clcyNHF3aGxtYVRGc1RWUzVWWkhObEpOeTNzZTRieDNzVDNZY2pEYVQw?=
 =?utf-8?B?dnpFdzRqQ0gvbWxOTVVvTnBXT2pTLzVDMDVZOGhzTzBNWU13RC9IbXAwbVVr?=
 =?utf-8?B?Q0dPL3U1M1hISFllRVd0TVFiQlVjSHRDcU4xVEVPSGN3TGY5eWZmZzBJUkFq?=
 =?utf-8?B?LzI0VnNEeFVTNHZLbVlJbUxnQnVxWkFNTU9HMWhxK282aDg4WE5KUEtPTkg4?=
 =?utf-8?B?YmdsWUEzNTVZQjVFeERLZ3hzeFp6TURPbHhjdktZT3I0RW8zaFpIbkpra2F5?=
 =?utf-8?B?SGlRVWlucXd2K0p6Rk9nbVcwOWNGVzlRTW94c2pmZWg5SHVMNDBXRW5BQVpS?=
 =?utf-8?B?bm52YmhUcXBjbVhFTEdJQ09yTWJUWkdoVStmRkZjeWRDY3ArL09IL2lkbzZj?=
 =?utf-8?B?UWNibzJnTFQyc2xEeVM5TEY5QkVDZVY1eTNTb2N0T1N0bFpLOExFcnRpWW1u?=
 =?utf-8?B?RWdGVFVOdXJMUjA0a1B4bU13Qy91TXVHbWp5UGVXRlhwM3lZNVpuTVVvejl2?=
 =?utf-8?B?QmQ3b3FzbWkzdkNNdGFadXIyZCs0VGhvd3VsOURhM2hFZE8wM2haWUYvMUVT?=
 =?utf-8?Q?ajAJ/6wC0wk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7446.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aUMvL3dqY0ZEbDhhNzAwSmRsMmMrNHJtb3lWdU44RTlBUzdwalJYbHdIU0Fh?=
 =?utf-8?B?MFRZbURRVmlZR0ZsbDlMUnNRbjNpU1dUVkpMK0ErOGdDRCt0czcyR2lLcjNJ?=
 =?utf-8?B?M1FhVFJqN1I1UWQ3bkhqYjNybVJGNmNjUXpmcjNyM05JakN2SDlnWmtiYmlS?=
 =?utf-8?B?M3pnOGdRNzgzY1B1cTZRaFVzb0I0TE5NeldvdmZzc0wwMDgxQno1MnpQK3VM?=
 =?utf-8?B?VVp6eXREdWM4enBaazRRQmk5M3A3TG5tM2phN2JGZHpYMEFNR0V2bDRGd0dp?=
 =?utf-8?B?L1J6SU5keVJJNG02bXMzTjdXenQ3KzJnNWtlb1hSSElwQWg4Y1JoaEpWQmtS?=
 =?utf-8?B?eW1ycko1K0c5UmhlTEJ6YkRVQkcxVngzS1VldHZHOFg4b2NxUUg2NWkxRFJ3?=
 =?utf-8?B?bzhmVzUySHhUMDhxVVllTHVJdERwSmxHeHJVS3VZR2pMSitnV2FWUkhQcGJH?=
 =?utf-8?B?WC9vNFZVSHplN0FLQzdBeVQ0OXg5Ny9UbTlQdzBCeEdJRWZONnNiakJvSko4?=
 =?utf-8?B?Tkt0TjY1UDJISVcxQjNFVlg2YUtDRFgrTjduT04vNFd3ZjdnWWJkbm0vcjZI?=
 =?utf-8?B?V1A4d2hNUTg1bVJrZm0yenJGMm9oMHpMcVFMZ24yTmhrZHFjeUkzZUo1TG43?=
 =?utf-8?B?cFB0TGlTcjlmOFNHQ0ZkQmJqSHBtWWdRSVNIdkYvMEpISHF0eXBHdW52SHdT?=
 =?utf-8?B?MDZmZ2NPYk91allmMm1TM1laeWMyNTJkeEFOYi9YL0Z1MGVyWUlRaEpONjli?=
 =?utf-8?B?WkxzcFhrTk11Q0x0cXZlcExraDNzOGZkVnVaQklTTENWbDNrMEdSK00rOXhm?=
 =?utf-8?B?RFl2Z1hOUkJscyt1TTFBcGp1Wk9wVEdWMTYzVHJ5OGMxTnp6YlprQ3Y2dEFU?=
 =?utf-8?B?Wk5xaEtQUm9kYnVlcWJ6UVJSaEJXczZDT1hpYVMwK0RwM3R5em5yYjN3Z3NP?=
 =?utf-8?B?L0krYmFPRUkxVkxlSFZMQWRtRGl1Q0NBZWJjZjJWYlpHa1BHekI2TTJFNzJ3?=
 =?utf-8?B?Ty9JWk0wVkIva0hrWms1QWFJTlpFU2Z4SFVkakJmaUhsemgzSWE0eCs3UFNH?=
 =?utf-8?B?YzdnSXl2eWlaY0d3UXhlUldFUTBRelVHR1RqTTNzT28rTWQyajVIcm9wQ0hC?=
 =?utf-8?B?Q1VmS1VQRU81UmI2MGRLWDNYaVRlWjlpN1FXcE8zOEppMVpYWG81ekcyUVg5?=
 =?utf-8?B?U250NTNYV09NazFyWGFtbVZIa05FT0ErRzZqZklUMzIzUFY0Wm43NmVIdkdk?=
 =?utf-8?B?bEN2SDNHNG1MdnVOMVM3L01DMUZsbzRlcTE3Q05iRGFIMjUxZGJUVUpLSDRy?=
 =?utf-8?B?NlViYXYxS2pIdUVaSWVtenB3WkpVS3JCdFo2d2NlTkdFNHJORjdzREtTSm5X?=
 =?utf-8?B?VDVjQWZJNGhXek5ObDNtZUZFMXROWEhyYzRocXcwZUk0MUdGdWtadW5La2tX?=
 =?utf-8?B?UUJtcFJrSWVhTXU1dkJDNFhtbFc4bUNldVJhaThkUDFtWFFFRGFBdUZUcTl5?=
 =?utf-8?B?b0hsV1NIUWJrV0VXTEplYWU5NjQ1VlRCT3gzVlo4bUF1Zm1JbHUzemZScElQ?=
 =?utf-8?B?YUdMWFR6RjJZRDU4Ymd3ZU1xMmo0L0J0OUQvdG1aV3dEc1pORVBKa2xYYnpH?=
 =?utf-8?B?dmVtM1hNalFyVXVxZTRkTC82SVUybjJxRnJROExwTSsrWVhSZzdaSjJkZTlk?=
 =?utf-8?B?Yi9QMkUvTzlyZnJkWVl3NDJpV1djUi9MRDB2SDNrTXlDbXpvRE4rYkgwTFBJ?=
 =?utf-8?B?aHlDYU05WXFQTjJRTFpkWHZQMWtjUENQcVcyeXJjb3JadElyL1NOUHpma1o4?=
 =?utf-8?B?NkVibE9PdDJXTUxxQVp2SldWZFl5bEt0OFQ3UExPSEJ2UEF2cjE5RjFsNXBE?=
 =?utf-8?B?ZnBSYUd3S3BZVzNGV3N1Q1p5RUt3ekdnQ3dMdWpodERWbEpOY0p0ODNlYlhv?=
 =?utf-8?B?ZUhqOEdUSFpDQTg3ek1Jd2h6SzRJSDBlc3RjVzJmTjFTd3hYNkVid3RVa1FD?=
 =?utf-8?B?djl0WmhsaW5lNlIxODE4bWxwL1BScmZPN29VZWFTV0tHclhvYVJDamNQVVNX?=
 =?utf-8?B?ekNieFVYb0hZcGp4dDkxVDl2N3hqRTFoN1hMeDVzNXBGOXRGTUFiZmF0V1ht?=
 =?utf-8?Q?ob4U=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b43a0370-8f3f-48d5-5481-08ddd96a3ab0
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7446.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 06:34:07.6542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8oZp+pTLaFgeCv4hmc2sAr+GI4vUhu1zn5IOhs3BJAdKWD+V0j0Wn0qcLEEyVTMS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8729

Many thanks, Sultan.

On 8/12/2025 1:51 PM, Sultan Alsawaf wrote:
> On Mon, Aug 11, 2025 at 05:05:39PM +0800, Du, Bin wrote:
>>>> [ old quotes trimmed out ]
>>>
>>> Following up on this: there were several more issues hiding in the driver that
>>> needed to be fixed unfortunately. I ended up making a lot of changes to fix all
>>> of the buffer lifetime issues, and I created individual commits for this work
>>> because it was getting hard to keep track of all the changes.
>>>
>>> I think I'll have this completed tomorrow and will provide a link to my tree
>>> with my commits. Hopefully your internal branch hasn't diverged too much from
>>> this patchset submission, otherwise there may be some conflicts to resolve.
>>>
>>> Sultan
>>
>> Really appreciate your time and effort. Yes, big code changes happen in our
>> internal branch to address upstream comments, but i believe your commits
>> will be extremely valuable. We can check and test after fixing possbile
>> conflict.
> 
> I've pushed my work here:
> 
>    https://github.com/kerneltoast/kernel_x86_laptop.git v6.16-drm-tip-isp4-for-amd
> 
> Please see my changes since commit 48d18b6e58c6dadbc79374773736924d2f532da5 on
> that branch, up to commit 5cdacf4ff108d83869414a00465e7a612bcd04b1.
> 
> There are 29 patches:
> 
> Sultan Alsawaf (29):
>        media: amd: isp4: Use amdgpu helper functions for ISP buffers
>        media: amd: isp4: Remove -mpreferred-stack-boundary=4 cflag
>        media: amd: isp4: Remove -DCONFIG_COMPAT from ccflags-y
>        media: amd: isp4: Remove the myriad of redundant ccflags includes
>        media: amd: isp4: Pass warning flags through cc-option
>        media: amd: isp4: Clean up amd_capture-objs formatting
>        media: amd: isp4: Don't set CONFIG_AMD_ISP4 to y by default
>        media: amd: isp4: Clean up AMD_ISP4 Kconfig dependencies
>        media: amd: Fix Kconfig/Makefile directory structure
>        media: amd: isp4: Remove superfluous NULL pointer checks
>        media: amd: isp4: Remove superfluous void pointer casts
>        media: amd: isp4: Remove superfluous memset in isp4vid_vb2_map_dmabuf()
>        media: amd: isp4: Don't read refcount counter directly
>        media: amd: isp4: Add missing refcount tracking to mmap memop
>        media: amd: isp4: Don't put or unmap the dmabuf when detaching
>        media: amd: isp4: Don't increment refcount when dmabuf export fails
>        media: amd: isp4: Fix possible use-after-free in isp4vid_vb2_put()
>        media: amd: isp4: Always export a new dmabuf from get_dmabuf memop
>        media: amd: isp4: Fix implicit dmabuf lifetime tracking
>        media: amd: isp4: Fix possible use-after-free when putting implicit dmabuf
>        media: amd: isp4: Remove 'refcount > 0' warning in isp4vid_vb2_put()
>        media: amd: isp4: Fix comment in isp4vid_vb2_dmabuf_ops_release()
>        media: amd: isp4: Simplify isp4vid_get_dmabuf() arguments
>        media: amd: isp4: Add comment to CONFIG_HAS_DMA #endif
>        media: amd: isp4: Move up buf->vaddr check in isp4vid_get_dmabuf()
>        media: amd: isp4: Remove unused userptr memops
>        media: amd: isp4: Make isp4vid_vb2_memops static
>        media: amd: isp4: Add missing cleanup on error in isp4vid_vb2_alloc()
>        media: amd: isp4: Release queued buffers on error in start_streaming
> 
>   drivers/media/platform/amd/Kconfig               |  18 +-
>   drivers/media/platform/amd/Makefile              |   6 +-
>   drivers/media/platform/amd/isp4/Kconfig          |  14 ++
>   drivers/media/platform/amd/isp4/Makefile         |  42 +---
>   drivers/media/platform/amd/isp4/isp4.c           |   9 +-
>   drivers/media/platform/amd/isp4/isp4.h           |  11 -
>   drivers/media/platform/amd/isp4/isp4_debug.c     |   4 +-
>   drivers/media/platform/amd/isp4/isp4_interface.c |  46 +---
>   drivers/media/platform/amd/isp4/isp4_interface.h |   6 +-
>   drivers/media/platform/amd/isp4/isp4_subdev.c    |   8 +-
>   drivers/media/platform/amd/isp4/isp4_subdev.h    |   4 +-
>   drivers/media/platform/amd/isp4/isp4_video.c     | 297 ++++++-----------------
>   drivers/media/platform/amd/isp4/isp4_video.h     |   4 +-
>   13 files changed, 122 insertions(+), 347 deletions(-)
> 
> At least 1 of them should be redundant for your internal branch (9f394a7af2cf
> "media: amd: isp4: Use amdgpu helper functions for ISP buffers").
> 
> Cheers,
> Sultan

Wow, amazing, fantastic work. Will compare to our latest internal branch 
to see what might be missing and try to merge, then have some test. Will 
let you know the result, it might cost some time. Thanks again.

-- 
Regards,
Bin


