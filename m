Return-Path: <linux-media+bounces-63600-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JBTaFAUwIGpdyQAAu9opvQ
	(envelope-from <linux-media+bounces-63600-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 15:45:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 11691638350
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 15:45:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=WkOl1BsB;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63600-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63600-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6AF08306B1D8
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 13:40:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09DFE30C16B;
	Wed,  3 Jun 2026 13:40:26 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011006.outbound.protection.outlook.com [52.101.57.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5F62D8DBB;
	Wed,  3 Jun 2026 13:40:24 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780494025; cv=fail; b=JLSYvVbyheaaGB/QJxVrfi90uqFPFc4ZLAmp8Ll6iX575NDKmZLixiDaI5rN3ug3Q4/oSs7uQGcHjnHmOuiBV4ITbHlcY9X2oEtxH0Ey/aLMC3OC+P83zA1B9bpmQ3REwo0oHi3eLTTov4jfKBnk+fqYFiaLNot/ANVNrKf2oMk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780494025; c=relaxed/simple;
	bh=70dRiDAY2qjKa0FU8ykvF7RlrcPNjmj3XCDrWfBhY0o=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=M2F3HfFz4LtOpGpcBfrcGXDWeh7Gwn4vvXlKgi1e9V405j1RkDSzyiloYeaYc5H882/j4koIvd8P2iSHy6xvoYh/zNVVvTQeF8e/bUrETdSw9L0IphjIg8LdcXRGqjpq683YhJK6Dn+B+GGoZ8zJOEYaL36H89+y5+5FbBx9OyU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=WkOl1BsB; arc=fail smtp.client-ip=52.101.57.6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N3NExXJQ6oWekVnMMDfE+xEsboKkduMI3+TBZer+//I0be1nWIgB9MPeFDPiXcx680UMEetCO1j4zER5/YxLvFpZQsCxlXZSkphKhl+OFRWAO+NswV9N00DtuXL6suD++81GDWnHGyoCqSptyhQOFHg+6UiwfmW9LpwT+ncsnJ7yG9LvLjo6WC407b/HvCfrDykWHbZKStYXSt0SiU0vuILfzaEEj5U6UjjGbrpXh0pUWLLGfEf/AZdAto6Adngl3eS0B0lK2OF1AYyhIUKbrz7OfRHf5+xXz7Q/LkN3Rwyl1Lw7xw7Hu46ZAHonuv1F20a2nWTz0ifSKA5j6iVgzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XX5kWf/hBf1QlFB99I7mhEf/2cvKTzGcDwVH0Dpl5Ho=;
 b=Zah1/h/FE19PrLjY6UbNlFh+xLqUmhOTfdJlr5iNKd8gEsfPFugAZcQrs5bvFwQP2cVLZq9oXA061unzY7MjJ3rUPaBgLLAm+qXYU0ljv+YoDIg6uUpzAOv0bfCz9O3xoiGNTf/GSKdy3n7R24guWsQfvX4afkQ5F0N/OScbsg4fG+tjln4e4cjg3Ghw9Q86aGQ3sZdkntYFM3yIoBxWtsJQVC5b5BBPCpEKNy24YeT3ZyZw5utdGoYkvE+CvfefXI1QAmswxfVdVs9B4uDC6YJfb5YRbTvxqxozwcHkWBGD2v9Dk8DcSe/BKR//pOX8KDMInTQpAooMLX6YfnfpWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XX5kWf/hBf1QlFB99I7mhEf/2cvKTzGcDwVH0Dpl5Ho=;
 b=WkOl1BsB8+5BaWT6l571Js9uqXiO58+NyA/R6Ur7U1X0pycsV/Kerjm6BQ1jSMKsHsgTgd9JcoRhBIYsVftz6ky5JUVZr0VBwcW7L4gZz2sjd1Xbmdb+k7LWZIHB5hNuE8ZXMiWWf+or+x2QooxuW9ZERFda+yb/FwBpTTC+Y7c=
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH8PR12MB7304.namprd12.prod.outlook.com (2603:10b6:510:217::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 13:40:19 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0071.011; Wed, 3 Jun 2026
 13:40:19 +0000
Message-ID: <0feaad40-8bde-46c4-a251-07a1bd6ac79d@amd.com>
Date: Wed, 3 Jun 2026 15:40:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/15] accel/qda: Add PRIME DMA-BUF import support
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
 Chenna Kesava Raju <quic_chennak@quicinc.com>, srini@kernel.org,
 dmitry.baryshkov@oss.qualcomm.com, andersson@kernel.org,
 konradybcio@kernel.org, robin.clark@oss.qualcomm.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 iommu@lists.linux.dev, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20260519-qda-series-v1-0-b2d984c297f8@oss.qualcomm.com>
 <20260519-qda-series-v1-11-b2d984c297f8@oss.qualcomm.com>
 <3dddb7e8-5837-4038-9823-ce419cb49ec2@amd.com>
 <e465ed15-1568-467b-ac6b-94f903b46776@oss.qualcomm.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <e465ed15-1568-467b-ac6b-94f903b46776@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL0PR0102CA0023.prod.exchangelabs.com
 (2603:10b6:207:18::36) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH8PR12MB7304:EE_
X-MS-Office365-Filtering-Correlation-Id: 521eb7a3-aee8-40fa-f56b-08dec175a6eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|921020|6133799003|3023799007|22082099003|18002099003|11063799006|5023799004|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	kW2ouNX2OIqk+EsytkWS+zXSF1Y8ehOjjPFR1L/K+zn7keV7dVAL3qSu1KhZhd+sr6nxL5OM7n5HqTWgNeuKRBqjvfdcFD1li/JUsopOdPOGym2ekBnHjLS6OV/p6uq9A1Dj2NcPItn3/ff8Z5uZw1IvlsfHCBVYgY4tYh9h7iwh2k4w7krKcUr07L9JR9XgEWBLAF4qzKzEfx8TsOCcDCcW5vYCrVVt9ZRZ3dRDAN9LxG7YoVcVSsBugnyTZrkSLA4r/bQEENTQ1uLZ+jPDbQ4H2MS4f4bZqfm6c2Q2Wfeq2MB4rDAFSwehKmLWVCduSAHpsfp+SScDbljRrFF9GQzSduLz5qUwlykN958tq0akzdPpkkeW1uqec84vTH3gYDOFOdreU8VMGTfy7ej7vhOwUfq26wuLxgWGPCisqK7NGXiyg5Ozq2B8GLo4TjNk2f4JTTcYWeSgz9F85hU7iOB8ELX/k8mWpEoGED1Qn8aG0oZqb0w7bAfoepdgNKMJV6+lMYpTZcPEfnbiozBlh44oEp34dvY86WMSf23h47s7N/fyef8UyzRGUN+hvTpPbesml8AFjg3ImkTIyh3Ie4sg76wmMREmUKbcR1227x2GJDLjefsSY+xEhzC937ePo++Zci4vVRMCDwXJPhyRE1xYBgXBVPv0HBbNEypM55deRIBSez10hDjIY0LNuM1DgYa8keC6ks3Ts6uT1FyfJcGER/Jen8UFh89wGU8k/5k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020)(6133799003)(3023799007)(22082099003)(18002099003)(11063799006)(5023799004)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWJ5a0RvQlJRRTRCbklsYjI5MlVxalBpM3UwcGR4cmVTMmF3UjFza01naHM3?=
 =?utf-8?B?UGtGb29CUFQyYmNtNDVGbXZ3SEl0d1BaNkw5ODBDNXYrU1BwdVVZOTJtd2Rr?=
 =?utf-8?B?ay9hSWcwV3Z2aDBJK0U1Zk03ZlBGZ2MzNm43c2RKQUNEbnBEOVM3NkVUTTRM?=
 =?utf-8?B?UW9NZTY5SWVLb2traUlVZWZqZSszNXpTQi9oaUZQa0FMOHVieThaYWViVVNO?=
 =?utf-8?B?QzF1RitEdkxPVFhkRTNUMGVsZHFVRVgvMTNMRVE0VW94bnlBUmdlR0x0TmNm?=
 =?utf-8?B?UXpnZ0w2MERxU2Q2UVdQTG8rUldwL3F2OVhLTU1zUy9QdGRjbWNrVEhHUHZl?=
 =?utf-8?B?RlVQMUZNVUpTd3hPamFFMTlpUitOV0dQTjE4M3dob3VGb21kMmpBNE53cU1w?=
 =?utf-8?B?YWI4MDF0VkNBOWZwdlAyM3lnMTFmZk5GTHNuMVNobXZsRUZhVWd0TE9UcXRs?=
 =?utf-8?B?d1c0aDROcDZ6RTZZMjFhVWErbkJpWGQwUEEwdUI4cjF1UklaS1NrOHRrS3VE?=
 =?utf-8?B?QWtnM05mMDRuL3RYbkpyRVJKNHdzcDBvdFlyNitTVmdXY0hLQlcrWEZFaEJt?=
 =?utf-8?B?RllRZ1dlT2Q1UXdwMldZNlZac050bHVxVHFZZTZSSThTeXNrYTdmcXZ0UWx0?=
 =?utf-8?B?OFpNUHpiT0UyR1I5UWduOFVLSWNuMWQ5ODloTm9SNlhWeXdxL05VeWNnQU82?=
 =?utf-8?B?MmJxemVCOTlUTXFIUUZ4R2NDWmxFTzV4M1Rud1l4L2oyR1RUbnNzZFpVMmI4?=
 =?utf-8?B?VVVFOGVSTVNRQWg3VE10MHpHREk4bVVMS3RHVDRsNk9YVEpwVUw2b05TeTlW?=
 =?utf-8?B?NXBUaGVLMk9CSklpL1MxNFJiZzE3RERPSmJWTk51OTVsZ1BFbVZQbEZZNHhB?=
 =?utf-8?B?NVExYnFCQXFXMlhCVXp4YlJ5cUlNK2dkSmpaN2RMbEJiNWw5dXlYTmxOQVNG?=
 =?utf-8?B?NWhUNVZjMDZ5SDQvd3RTOGhFMUVQNkZXMWtYa3JIR2dQTUR1VlMvbWNKVFZq?=
 =?utf-8?B?M0NJUzQyb0RXV0JHYnRXMXI3OVovbVM5WnpZUzNqVVdGVThSSTVqWnkwSno1?=
 =?utf-8?B?bVJOUHFZWUEvNVgxMkhaODEvRG5JZ2ZFTVo3UmpocmN5Sy9QUmdENll6SkJ5?=
 =?utf-8?B?cEIrWUkzM1BSejVEZlpheGVNc3lBWVl5TkpPY1lCNS9CdE5tM0Y5OUp4N0k2?=
 =?utf-8?B?aEtOZ0VjSXAyRTJXVTM5WVpUZVh2c0s0WkpRNXQ1amNjaHVhSWpmQzh4cG1X?=
 =?utf-8?B?NXdOUkNJS3p4OVI3WklhUmllbDRDZ0NuZFJKZHN4cjJvQlpob0Fzb3ZZZTFY?=
 =?utf-8?B?bm8yRHYyNDgxZUhnK09tRjB6VjVvaU01QXVWMTBZR04rYWhIeVZXYnQ5cnJs?=
 =?utf-8?B?NEI2R1N3RnJ6M0lvSFNCT2Ixc1dabEJFM3hMVExQbFljenRwT2tuL1RRSXhY?=
 =?utf-8?B?cGxycFQwNFNvYzQ5eUdmWGIxcDUrQllwSEQ3OThoT3l1TVVBZG1vNVd3K3la?=
 =?utf-8?B?cjArbStlM2lldEV6MFowV3ZYTHFiRW4rR0NnZjRTMGg3dUNjMWlmaUMzc3B2?=
 =?utf-8?B?bkcwV2tpNzNhclY0dFAyYnhNMjduTHZhWVNBZ3liUnNPSzlFQ0xaK0hvd1U4?=
 =?utf-8?B?blNURC8xekJBSG5pOUNGV29DbDRmelJwWTBkNWZGYWloK2crcWtxOXpNaFlO?=
 =?utf-8?B?WlNzNDFpTmhLVW5TYUE1LzBxWFZ6Q3JOeGdidG9Id1k1N3hobHU2WHFoSkJZ?=
 =?utf-8?B?RXY0bkJZVExWbWwxY1Jzb2NFUEh0TFVBb3dZUmRiYmhENEhFZXhyUGRCZHEv?=
 =?utf-8?B?eUNVbHNoYVBDS0xPSHBGN2F5ak9wUjhNbzhNYkF6cHo2ZVBGZjN4YURneTBU?=
 =?utf-8?B?Uld3REo5Nk9yZllMQ3FOYmZhUmh3VXRXUDJ0RnVQTGg0TFF2NWxGUXJWQUVG?=
 =?utf-8?B?dzNqQk5tNFdDdmRkcVVFbSswVnBaaHgzZWhQZEpKZ2FsRFp4M2FXZWxxRTJ3?=
 =?utf-8?B?dGcva1FOalNCTFF5bFR6T0gyL3J2czU4b3lJM0laZHNhcU8ramZVOHVRUkoy?=
 =?utf-8?B?RGJ4b29RWkNVcmh2L0RJdkpSQUdwTlZCUTZyNWFGdXFpT21Qd2NpZERYU1ln?=
 =?utf-8?B?MjNDU3dWMVFmaXlHMHNjNWpFbHBpU2oxc0NFZXRydHpLOFJGWVFhdUcvM2JF?=
 =?utf-8?B?d0Y4YS92Nlo5a1ZkRGZJUGVLUGJXT1RZakNFc29xWVdEc21pUi9yU2RTejI4?=
 =?utf-8?B?cGFIOCtvOVhwUzdMQm1uUWVqMkxuU2k5c3g1TFNYVkRyQVhpWmVLREdEYUQy?=
 =?utf-8?Q?80QWgYVnKaw57Q5lmz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 521eb7a3-aee8-40fa-f56b-08dec175a6eb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 13:40:19.2817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OiBtNsdpWeQ8Iauq4qFrZ+y6c7FET0EUW4zZ7CgueU5WnkzUhWDWUNzGTbEN9dSz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7304
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63600-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ekansh.gupta@oss.qualcomm.com,m:ogabbay@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:quic_bkumar@quicinc.com,m:quic_chennak@quicinc.com,m:srini@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-doc@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[amd.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,amd.com:mid,amd.com:from_mime,amd.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 11691638350

On 6/3/26 08:11, Ekansh Gupta wrote:
> On 19-05-2026 12:25, Christian König wrote:
>> On 5/19/26 08:16, Ekansh Gupta via B4 Relay wrote:
>>> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
...
>>> +static int qda_memory_manager_map_imported(struct qda_memory_manager *mem_mgr,
>>> +                                          struct qda_gem_obj *gem_obj,
>>> +                                          struct qda_iommu_device *iommu_dev)
>>> +{
>>> +       struct scatterlist *sg;
>>> +       dma_addr_t dma_addr;
>>> +
>>> +       if (!gem_obj->is_imported || !gem_obj->sgt || !iommu_dev) {
>>> +               drm_err(gem_obj->base.dev, "Invalid parameters for imported buffer mapping\n");
>>> +               return -EINVAL;
>>> +       }
>>> +
>>> +       sg = gem_obj->sgt->sgl;
>>> +       if (!sg) {
>>> +               drm_err(gem_obj->base.dev, "Invalid scatter-gather list for imported buffer\n");
>>> +               return -EINVAL;
>>> +       }
>>> +
>>> +       gem_obj->iommu_dev = iommu_dev;
>>> +
>>> +       /*
>>> +        * After dma_buf_map_attachment_unlocked(), sg_dma_address() returns the
>>> +        * IOMMU virtual address, not the physical address. The IOMMU maps the
>>> +        * entire buffer as a contiguous range in the IOMMU address space even if
>>> +        * the underlying physical memory is non-contiguous. Therefore the first
>>> +        * sg entry's DMA address is the start of the complete contiguous
>>> +        * IOMMU-mapped range and is sufficient to describe the buffer to the DSP.
>>> +        */
>>> +       dma_addr = sg_dma_address(sg);
>>> +       dma_addr += ((u64)iommu_dev->sid << 32);
>>> +       gem_obj->dma_addr = dma_addr;
>>
>> That handling here is completely broken since it assumes that the exporter maps the buffer as contigious range.
>>
>> But that's in no way guaranteed.
> I'll collect more details and will try to implement this in the right
> way, maybe by iterating the full sg_table.>

You could also document explicitly that you can only import contiguous buffers (e.g. DMA-buf heap CMA etc....) and then cleanly reject non contiguous buffers here.

We have quite a number of drivers/HW with that limitation, so only accepting contiguous buffers is perfectly ok.

You just can't silently assume that IOMMU would always map the entire buffer as one contiguous range, cause that is certainly not true.

Regards,
Christian.


>> Regards,
>> Christian.

