Return-Path: <linux-media+bounces-60769-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDuvIJBX/GmvOQAAu9opvQ
	(envelope-from <linux-media+bounces-60769-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 11:12:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 182124E5957
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 11:12:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 36C14306BDFF
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 09:10:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F3623BA22C;
	Thu,  7 May 2026 09:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="R7H7A5Xs"
X-Original-To: linux-media@vger.kernel.org
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013056.outbound.protection.outlook.com [40.93.196.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75C83939C8;
	Thu,  7 May 2026 09:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778145026; cv=fail; b=ZKjszUiWMUEJSZuI9glAxvkV7R9Pv7qf3lvPyDJfIilK1wRKgKUcbyIDz8Hkcx9KKvoavcLQWRGIr6B5LYSL7JTrpXd6Sg1E6KQqIDcisbIXOkM/RVU/TaNhHbAmEqbgLo9SAbEq8TkQDnM4vlwu/IJvk+8TMA6M2NiAOBMIwJ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778145026; c=relaxed/simple;
	bh=Ks1Xp7srjagTTKku7z0NtBqdrBdryuSX5SNQ1OOWhzo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dZ9QOpxNZ7HAZUnD8ruRpHImjv8hH1JN2tOBjBBQBk+85c8vU8jrlQ+H/XQQPttKIWMMBLJStgTTtIj3hz7ZV86QAGwlba4ryqYc9AO7gmdGsMlWb4K/rlBx03+EOMBdhUV3pYbn86YpA6wgccnZLNhKW6sa0DtfvVvfJNZRBhU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=R7H7A5Xs; arc=fail smtp.client-ip=40.93.196.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xQBRGDmwaI2Y6Kjc+Pj2sW1ff5r4UkyEMipOGiKvgOOP3tLjCmWSz4lSdZ2jyA9gEEnybu9pCXCkJgfdsunpdqWu+WV9ixrZJ+ZyBMBe7z8XEVI4sMxi/F5tJfITPa2HrqSJ9BmXgS2FcYS9w24hBXMxtTWKi2CG71JvP2KXkh3jWJAzEFTtPtOHxugxSZfkfm4X0eAMj3Cocj0jZw7Cml0uO/sHvmC1o3U2G5MR39EGC+5r2BzjSrewtzlvr39zWIRV0mC/9U6DWm3Wf3rrsTdOLdN1/RJDMPMzQL7n1SvtikMY1GgYRRv16H2kht9JIPM3dAPkRV/i3ICysEHq1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j99NuJDAmwqo+J3Hk7o3bLwrrzjexHVAJRgaFoZDfPY=;
 b=m+CmLQsj5ar9Sb/rA1QF8fy/rWggVmG3vghBVFYwrnsLgIi4zHXDYHrs2Xh7idQZL3HGAWXW0mC07DXe1tDhQe0o0eSucBOmEeLD9dG0z+PtcBH0BO1oTXKqyk4DYdWo91V4+OVX4F5Ojf/gcDCwvsJlKvD7p1XT6LyulCD/beWuQ/IMhu6bHvmM7Nb5auFBvFmrYYjdWrLESiOsf09Btq6xQfddrQ7HiuMGdNy3NvoyjCHRtBucEOtTK5ZNam2R/Tu0tnUp67Yk14SeKow12kdidJgkRxJ8WozbRa4vvWQDZpRszVN3CFbQLbxyzCmGccnlCGWTQfxi4ZF4HixVKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j99NuJDAmwqo+J3Hk7o3bLwrrzjexHVAJRgaFoZDfPY=;
 b=R7H7A5XsZlRNTSGTWpLnY8ssXl+2+RsdpswEvByK2A4bIB5TCz9O5k7vHqAzoSxyU/+VrAfA0MlazHNvxm+ZWTeu47SXo85yU6d5VeY02MK9cWr0KxjmTX4RWzBugux9jEjD/Dm9oAoiqLkH37tyw7GeC77uXN4C+RhikpO07e4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA0PR12MB8693.namprd12.prod.outlook.com (2603:10b6:208:48e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 09:10:13 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9870.023; Thu, 7 May 2026
 09:10:13 +0000
Message-ID: <762200d5-7631-4db7-b8a1-a2078344826f@amd.com>
Date: Thu, 7 May 2026 11:10:04 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Let userspace explicitly trigger memory reclaims
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>, Steven Price <steven.price@arm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20260506-panthor-explicit-reclaim-v1-0-44f82ac147ce@collabora.com>
 <829b8887-48de-4cfa-8bb2-79db1471bb8d@arm.com>
 <qxAaM8FMQLuQt09qti64IA@collabora.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <qxAaM8FMQLuQt09qti64IA@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0099.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA0PR12MB8693:EE_
X-MS-Office365-Filtering-Correlation-Id: fe5d03a3-2308-4e68-12b5-08deac187240
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|921020|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ef7BrHfA1qfa8eQ6js/yUSUYAecjdFDXNTIFQ8wvi3qWR+IqKcHP6iVmJGQaZmM5kLMZafIUHfmrwbQvMHu29KM49s8MxNrTli8SpozsQq7GEp9qiRnFn3GellLDNdOtMvvgHeM2u30l9JsSiR4t6rHeBzwFEVY3Qr+LycpFGNjZw/9xzGOa1UtcSaAcHUbiJdIOY2ACGVZ102kyQsKNtuV6y5ol1g0XuatkPQniXylpJpKcAj2cGC0+JnHOZ2AxAm64dkwzo6yRPs4Vukbc0qnwAIiGsGqlej76rE/IoqvCvk6+Vz4FJ7Wqy9Iq0C1T4/3tXV4YMB6LlLqf/XsA0he1On1MsbixaQX/5+66FbXevTT/NNVk/reqxGMF6MuPic9xD8alRpqfa4MNcotE51GSDmoh8VKsNexL9kcwUSw5ORPVUGzvcTqsI3QhqQ0aL1ke0WqVzut2K5BY3FszKHdGt17qh/F0MUs1+n+QniY2GRg4o5/pCV/ADGF6PeCWAa8TMiIYbtJ9PQqU/x6N2RBa7bogV692vAE+Ex7/Ge5ye2c0ONd1STI1YXCX+kAW8NaxuGY7rYjCoNAeu0XHq/0RloVISwWNMR2T1c0IbuXSPZlI/RbTdHaaAnt/m9IyR8Gn6lSkWtPG9UmCbTgmrIiWZVh6XRivBGUNO204EJULFt2QD5YZ4e8BHwHy+x/iiwn27+6DqkndjKXJpmCzlKFJhI/4sdcvqRWh4rJjYQ9Ty5K+YoaqvFti5POODsxv
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(921020)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RncveXE0TW1xSWxXbXM1ZVlvcVF0dkduOTdsSXdmMmRCdndhcCt0c3drQXNU?=
 =?utf-8?B?ZnkycTdBRWZLOTFEMlpZLzNlRUs0SWwyWVFmTDZzWU9pVzRwNGdaTWRWenVS?=
 =?utf-8?B?bjNRRm9qbGdHWVJ1OWxZdEdWZ0U4MkN3Qk9oaVUrRm4rQmthTFc2S29UZGRr?=
 =?utf-8?B?NitrbnA4N21qWHAzM2Q5MUZwc3R2cWFwOGY0emJjSjJTcEEwejZ1N2NkdXVp?=
 =?utf-8?B?S3k2WUtCd0d1b3ZXV0grWXI5SHRlZkxWK3FrcXdibENzSUJSMTJRWDVXWEVy?=
 =?utf-8?B?ZjRETW1pb3d1VGJ3bW5vRnFBN3B1cXMxcVFPbHVCa3RxTDhpZCtRU1Nob1lD?=
 =?utf-8?B?R0g2NDB4dEYxUHJIUlpJVlFFa04xbXJNNXJVVHRPZVRlVWYxZ0tKUWJ3blVM?=
 =?utf-8?B?N2MxNkdDbE5WbFl3a0lZRm5qYXNDcThiNU45YXFSZ2ZQVC9jWTMxcDN1VzUr?=
 =?utf-8?B?RzFpc05JTm9RSmxTZTVNRkZmWW1tNVhRY2pCMllpT0VRdFdtMmxHS1ZpSEVC?=
 =?utf-8?B?c1RYU0xadWdzc3RSc0lVSFNzMWEwRG1kVmdvNEtKVWljVHVLZVN2V21QWVNB?=
 =?utf-8?B?VnBmRXNhdXNNZFVScStYaU4vOStjN0RqQkltWFhHN2lKWGdSUVBIT0dBOStE?=
 =?utf-8?B?Y0NWR2RWOGpUOXJ4R3VLVjU4Y2NlTjUxQW5QWDdmNG42UDYyNXFaK2FyTUo3?=
 =?utf-8?B?TW83cldDMU0vODdDMHhVRFByd1pORGczWEh6c29IR2p5ZGdjNkxmY0J0SmJZ?=
 =?utf-8?B?Z2hEVjJOdnZTUnp2MjJ5ZnZMcFo1L3AvNXozVUZCUVRlMjBnRDV4Mlg2R3Rm?=
 =?utf-8?B?UGYvcDdnOTZQSmtzaDVadGQwZFluZFVwQVo4WUt6SlRoT3FBTHpDUGNvaWlT?=
 =?utf-8?B?RFZkWXlReWJhM0lacm1hWG9IdG0wRUdYejNkZTQvbWJ6SSthd2R3MXhZN0JH?=
 =?utf-8?B?SmZBR1J5SFBiSndkNXRIQjZxMGlGK3BCaHU0bi9ORDFQWjA0KzZua3BKSVJY?=
 =?utf-8?B?b2hRNFoxb3lCQS9RRHhwYUJmTWFMcjJDL3VKaHpaV2twbm5aQTIwOEdrMGxs?=
 =?utf-8?B?NnQwc3h1N2M0eVRhVE1XVzUraDEvczVNWE9RSUNUelNscmRoaWpWenBJeHZR?=
 =?utf-8?B?eWpnV3VyMGlHVnRTaU5EaEJUQ3pUR1BuNkxaK3R4Vkt2Y29mSGJOZE9LVzhm?=
 =?utf-8?B?bGNpbDRMUGcyNUdDQjRORElaMW5HbDM2aEVVRlZOQndlTzdGOVBrUG0rdm9L?=
 =?utf-8?B?T09ScEhoZ2NnZlYxSlhPZm1PaFlYcjhjUmdZNWVSMDREdlJYdHRRZzBvWTl1?=
 =?utf-8?B?NWp5VUFqcElLZGpqVnhXT0lKRXNLMVVyTHBNNmczbmI4ekFNK2ludElvd0do?=
 =?utf-8?B?bmRpVE1DSHh0d0lxWkUzV1djaDQ4dmd5eDFWeThLMWNoTENkSmlmeUk3eXVp?=
 =?utf-8?B?WXUra0lNKzQ1RzRLZ2JQYnZyYnV1K0MzNTMyV3J6My9zWEsxaXpBcEhTbDVk?=
 =?utf-8?B?VlArK0orWUJoa1Z0dGg1NGhvSnlCVVQ0Z3k1MjRWczRlZDl5aWFIUUNJUzU0?=
 =?utf-8?B?a01tdkZpcEd0UmNjT0xxVmVCeEFSUy9Hbll4bTgwdDhMYUFPb3J0VHo1aUZO?=
 =?utf-8?B?L052cjFtWGF3Z0xmNzc1Y2F2eWlZUEhJcjd2Y21PektLaTJxQVc0aElqS2FJ?=
 =?utf-8?B?dFFFRjRtSU50b01zMU5LZ0NDRHRvWjRpcUVLbkRjWm9nY3FVcTdOMXJnWGRs?=
 =?utf-8?B?MWlWUEd2eG82NTNTcGdQVG5seHFlb1RFY0JUMG44Zk9qaEtoNm04Q25Nclow?=
 =?utf-8?B?TktmaW5YeUIvVWFFaUplUGtnWVR2VlBMOHNLTmltMWpoRWFCQWVrMU0yM0tN?=
 =?utf-8?B?UzJudVN5anFkVzZNdndkeWhCdWZFQUg0LysrR2JzeFZsUys0U2I2S0pBZ1Nm?=
 =?utf-8?B?VllwVTA5dzZLb1dkc1Npakc3SDNMaFVrWktvWFlhQlpzcWI5VXdkSGdxTHZL?=
 =?utf-8?B?NWxwa1BmYi9HN21rMkI4RldCUTZRM0hQSTlHNytVcEtLakR2RHpTN2JCS3VZ?=
 =?utf-8?B?eUY3RHZhbERKVitWdHJUaWk5V2RETW9yMk43eWUvWnNTRi9oL2hsTGJmQ25t?=
 =?utf-8?B?NWNjMHRkOWd2bW56QlJ5ZFFkSVhRTzFXOG0xT1ZxdCtQb2JEK0xVOW13V21l?=
 =?utf-8?B?V1BHRHRnWHlzaXdFUE53SGVuZE9WUjBseVV3L3Q0UWEwdU44dGF3QXpuM3Rq?=
 =?utf-8?B?RnhsY1RCRXdiT0RTWUxaWkk0cVRrZzRwQW5uMm1TejI0N3ZGTElUYVVJZHB2?=
 =?utf-8?Q?JvUJ2/aeWvMT0kZPzP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe5d03a3-2308-4e68-12b5-08deac187240
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 09:10:13.2376
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jHIXHdn9cadTC4A+LdlvMeVx+nYy30ulIc+gRMFq9w/wXzFT0a9fmgQlFsXKPQAy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8693
X-Rspamd-Queue-Id: 182124E5957
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60769-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[collabora.com,arm.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linaro.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_TWELVE(0.00)[14];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On 5/6/26 17:43, Nicolas Frattaroli wrote:
> On Wednesday, 6 May 2026 17:06:56 Central European Summer Time Steven Price wrote:
>> On 06/05/2026 11:45, Nicolas Frattaroli wrote:
>>> RAM is not, in fact, cheap. Especially on embedded systems with a low
>>> amount of memory, but known and well-defined userspace, more explicit
>>> resource management can lead to better utilisation patterns. As an
>>> example, a resource manager process on a purpose-built device may wish
>>> to launch, and then explicitly swap out, memory of processes that are
>>> kept "warm", to improve perceived startup latency of individual
>>> full-screen applications without making the kernel figure out the usage
>>> pattern from observation alone in order to swap out the right pages.
>>
>> Have you considered memory control groups (memcg) for this purpose?
>> Imposing a lower limit than currently allocated should trigger reclaim,
>> so 'background' applications could have the limit lowered and then
>> restored when moved to the foreground.
> 
> This is a suggestion in line with what I've made to the entity for
> whom I am adding this, but was told that for them they really do want
> tight control without having to use cgroups into technically doing it
> by dynamically adjusting the limits of them.

I agree with Steven that cgroups looks like a better fit for this.

We had similar approaches for DMA-buf where Android people upstreamed their hand crafted resource reporting framework exposed through sysfs. That turned into a quite a mess and was recently reverted after Greg intervened and said that this is not really a good use case for sysfs.

This case here is of course different since it is only for a specific driver and not kernel wide framework etc... so I don't think that Dave, Simona, Greg or Linus will block it.

But the question is still if it wouldn't be better to solve it in a generalized manner and not each driver implementing its own sysfs interface.

> I do think that writing 0 to `memory.high` to swap it out and `"max"`
> to allow it to swap back in might work, though that'll then apply to
> all of the process' memory, not just the GPU resources.
> 
> I will ask for clarification internally.

I think you need to come up with some kind of justification which not only explains why you want this, but also why cgroups can't be used and maybe even why crgoups can't be extended to do this.

Regards,
Christian.

