Return-Path: <linux-media+bounces-62960-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LqmCo9FGGr5iAgAu9opvQ
	(envelope-from <linux-media+bounces-62960-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 15:39:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 770765F2DD7
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 15:39:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2DA13311776E
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 13:32:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 970CA3AF677;
	Thu, 28 May 2026 13:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="sBW54BXE"
X-Original-To: linux-media@vger.kernel.org
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011012.outbound.protection.outlook.com [52.101.62.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707BB3E5A18;
	Thu, 28 May 2026 13:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779975160; cv=fail; b=ZMTu4pnlbEBuC0nMAjarLeOgBI3vuUlgW2LsPBPUMGYLBq29hw5YWdL1ugcf7Z0BPVOt87Y1kdSjfQrQxeh4jSwwTmdWyIxGgk3QZ8Z8/aFqcrwBMDvh7bXK6wqfVvtx/2Y7bCplHRNPArQa1xWa7TNYXnXazMJF7r+w+v1v8h8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779975160; c=relaxed/simple;
	bh=6NiOj59uxgDvC+nh10fPGUSehaCbYx1NFxpxdq3PlMw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EXneTMm2MkNUUgmRgAGfo5zDmlsIeX6ne9M4uwYFK+XdaThCYEIEaGfY+hZfwJ6cnmfv/FEew5kGIsFEYGyVRniYObCFD8ho7ZsC61Kx+nu9RxynKE0Fr2tgNX4l4ZWsa7HS6ZEm8UZFSc/xdVOlxhkZci2tVlzG++V7V8jW7fM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=sBW54BXE; arc=fail smtp.client-ip=52.101.62.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pQ5fjdsxu/hTV1cVhWMEwpNfL6ZaslCG3ocEXUUFdEgUB/RAO4wbzYdW/zKpAGPZJG1UkvFxEyBwRy46LhXmpGpd0XpV3UMdZw3UVTzDCyGxl7idOYWbtdpQHq6wQPBXvMNipPClmw6aT7xbePHUbzV+T9oUybU2dEm3b49uLkqSqM2/4BStft+6LdLylgSUEo3+Crlgg5fLb3Fo8CV9tTBoT9MdUigd6oGYJXtouTqyctmBT0hDabGO16MV3uwZbNq1lfV2LyEZzQGL4wgXTVVUYrT+ieU5NltSGWlIfx36O/C1Jv1VNOhd79zi0rWFhJIZ1ARDfhWwO3M/OofrRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v+9YcsALWWSmBSbfZOIBoPsFgGYyV+IQTFs8S6vvagM=;
 b=j/IMIsPU6qnWBqvzrL4O/RBv+F+5nmmiIQWEsWsxjZZ0xGgmA3N1XQePubVBYK8fmvfz/7ZzIc/URhTKZO9E+OZXYnX1URHPnpLhvS3HqOp3Rnz9trWAz5bsPg+cuxYT2GYNg4gxovgFdWZta8scsvH5FtUtFtWXMUc2IYXDGTohU4FCat3AxRO89Osl8FuUNqt8ZSjDUVCEQXsKq5OdQ85V1GLZe38zLmoNCUqncMWnqHKTSr/DLvFWMGQFLeEJfg2J+wJPS+PdK6WSoRS7KsOaQ+2EkroLslIRfVW/uMC3uk0DF8NEXy9FJnF+t6TEf1ThwpCjjKHgGxHn4ZmOPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v+9YcsALWWSmBSbfZOIBoPsFgGYyV+IQTFs8S6vvagM=;
 b=sBW54BXE9oeqD+Ogppv0NxXKqKqnMZdoK+BN2Y7sYYhncLdE2XiT8QlZP/ApuS8ORZ2Sb8q+T61YDejVxxzz6c+cg2yuDjCRk6xICBg5KbAvVvaI6971fYCsOT8Ojlh2STGYZw5WmS2NYw3yUUSFhHDnJqWyrNFZdV+KgI416Sg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB7948.namprd12.prod.outlook.com (2603:10b6:8:152::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Thu, 28 May
 2026 13:32:34 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 13:32:33 +0000
Message-ID: <62c256eb-1df4-4633-8040-222895b54f97@amd.com>
Date: Thu, 28 May 2026 15:32:28 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/prime: fix dangling dmabuf entries after handle
 release
To: w15303746062@163.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 sumit.semwal@linaro.org
Cc: jeffy.chen@rock-chips.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, Mingyu Wang <25181214217@stu.xidian.edu.cn>
References: <0e12ce28-f5b7-4ffa-849c-df9ad1796e22@amd.com>
 <20260528132932.1078483-1-w15303746062@163.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260528132932.1078483-1-w15303746062@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0021.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB7948:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bde40f2-f034-42f4-6365-08debcbd92bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|4143699003|56012099006|11063799006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	WTvgizEDEpNARjStNY1t8ojVHnuzpxqMrCZHIYWRQAh8reJp6BT0XAJeBJHkI3YUMVKLnCidnVl9kH9CFxIqq141o/TVOYHRqbl4zDxPxdOS5NSijSAuFeR95O/pdbif1Cguo2OLVbOESM7ukrUP3KcsmGRHGPBCF9D6C+Wdw/ABN/sgPAYgomcJIsgz2AJCw8YhD+DQ+m1SXsrX5JZrLqnEGF32OSEKwONzVPOBc6nDF+OEJpwZsJyLA5OiBgYqIpUXxgPKV5h1FO/xIsNsJw/QLTfMHHcCMSNaQ1zNbCMw+ORNyiPIEAAImFdsQEsNBoRxRLsiTxJKn7ax9dfGUXOEJxd5n5a6OPcJIvEg3sw2cNtWKyyVWGhHD3yuzmCHJlG3gBE2IR5IwKxpguaYNd04cAnYZTPWiLY/rMBpU0XZRJDqcGe9MjLbfj1RUxx19AQ/HJ0PtedF2xEXY34OWyYpUBxM6hkxFH8TDYoIxIMlpVmFXH/ro8becGgc9hFhTsMdNWOrrqH3kwWwXCjKjkhm2W3P8OnWWdD5ziyxE0iY/IyzfBa1YF3o8VPuMHUUlCJQ74T8rwv7fkgGt53qtVzKnN7cvtjYA8kuC4KtzGrPW6ePfhZ0WBnwxK+vtVJVm3CUk7LDMWxHoxpuZhDxBiqMLG7vP08rik6Vfa5dfS4z7Tb5f6t553teyrX4Y0a+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(4143699003)(56012099006)(11063799006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b3VFbTFyTUc1NGwwc3Bxa1N3V3hLSVgzVlUwbW1QcDF3WWQyNXBIL1BySjhV?=
 =?utf-8?B?Q05salZpVHViR0JZYkNiWHc4MklCaXlFU3hoME03U3FLRnhMUEVZeHJSVFNO?=
 =?utf-8?B?akdHNlJCMUZWWjV3QUZYTzQ3V29oeFc2UnZ5NURyeEpIMlJrNjVNYk1JcVVy?=
 =?utf-8?B?dmRDYmpYUXY3ZmRWVGFoL2hueFBlTG1XeDFUeTkxeDNVRmNGMUFrMXJNdm1Q?=
 =?utf-8?B?Nk00TUhzcWNZYzRiMXhSYTV5RVNVNEJMREdHaHpiRkRuMmgxblpRRlNHUkRs?=
 =?utf-8?B?SjBXWTBFc0l1djE4cmhWRVVrTUdIRWd2T2RGMytmZDVDcEJoZy9rYmxaM1FV?=
 =?utf-8?B?SlZDdTR6RjhlaGdLK25DcFhhdGM0ckZ2TmhCUzJaS2dzNU5TVUVLaDBVYm1V?=
 =?utf-8?B?MkFOdElDdkRpN1hFT2xwSkd4dDRhVzhGRVdvMTBsanZYSGd6OTVJRG1Ha0RF?=
 =?utf-8?B?Njg2R1FGU2dBZWF1S2lOZ3hjSDF2NDNHQ3RicURTQ3d2RENuZU81QnppdHk3?=
 =?utf-8?B?TUZtNnFiQm1WNFVyZjN4V1czQUlVM0MyeWd4Zm5TTThLNlJxRXFlTGJNZ1Qw?=
 =?utf-8?B?UlRjRWdMMTNkVjBmQ0h5ZHY4RXlIMFIwVUtJY2gvZTh1UXFvcDhUeTkvMk03?=
 =?utf-8?B?dUhibDF3ZkVKOUZZZG5MQi9NUEJRVmNHTDdaRzNodHk3amlhQ0xEVEsvQVp3?=
 =?utf-8?B?N1BTM1F2VkI3R3Z3WUJnWUc4cmhKdUxKb0NpdlNMUHhlSDM1Y1JQLzU2RlBx?=
 =?utf-8?B?OE9BajJJdzJzTGdySXpuR3ZVK1doc0xSRFBmUjJmeVZuN2I5WE9LMlVJYXhk?=
 =?utf-8?B?bVY5VzJaYkJJYXViVUsxcTdnUE9vd1VuS051blFIZEtmTmhpeTJuZG5Sd2Iw?=
 =?utf-8?B?WFhXVjRINHpRN1dRc3NNelBWU2ZjZFZaV2VwVnFhMGg3SG01aENuVnFhVVVr?=
 =?utf-8?B?UjVFRXU2WnFCRWdWaDZvaGt1LzkreExEcUlxK0JhODFWK1c2MmdWTDhTbEZs?=
 =?utf-8?B?NzdoY2o4dTBRbnF4eWhoWFVaZExVTXh1QWZEMHgxK29lK2JTcEhmYzFJdzZ1?=
 =?utf-8?B?V01SN1RoOU5Bc2dqYmN0QkNESjg4ZUdTbkhZaGNnN1VMb3FtMzZpZmZKa0Vy?=
 =?utf-8?B?aGtzSGtxc0dsT0pTWC92VEZQalpGcmhiS0ZKUk02YXBjbVgvVDNCMUl4UXd3?=
 =?utf-8?B?dGwrelhBV1N6alRZZGpZZGRSUzB4aEN4cHpVWEJ0YjlqQmNiL1oyT3V5c3VQ?=
 =?utf-8?B?YS9SWHRGbGdvY2prOFNqank4YW03ZmJhKzEwdFpHcmpQUGhWMU5MblZDSUE2?=
 =?utf-8?B?R1hFZWhBNnJhaGEwZ0tmSTUybDdmZmNQMS9NbGJuVWZBRi92Q2FzTXZyNHFX?=
 =?utf-8?B?Snpld2wzNkNFOGNZNjRqU0NYSkFQWThFajJaeFNtUFF3TnY1QlplWFB6SEta?=
 =?utf-8?B?cW5lZlVoRHFiU1JPN21xUDg4dXdZK0VWRXRDc0JmNTg0bnJrdmNmYWNRRFY2?=
 =?utf-8?B?NzBQYlZuOEZVTzc4eEtFK2dxMkkydUpyaVYxSEw0bmltLzB2Tm02Nkx1Z1I2?=
 =?utf-8?B?WGlmRVA4dGl0OFl4VEVjVGl0eXhsazFCamJva09TelFqcDFZdkk5d2VQYkNK?=
 =?utf-8?B?UURRN3F5TzZWMEl6cExrOTFpSXUrM3dlMUtyREFVQVNwMHpPMmowaXY2VUdI?=
 =?utf-8?B?bEU1emFmRGdwV044RUJwSkFpOWd0cEJKWW5KeTlIVVhTSjJPeDMxZUlIc2R1?=
 =?utf-8?B?eDM1eEEvTVRHcEpodytqWjdTRmV2cStpRnNLNXhsNklHUjBpeXl6ejh1Y010?=
 =?utf-8?B?STQ1M3FkYWk0SXcrdmxreTR6V0dURnBFVWt3d1ZXcHlMelBmZmI2TlNPWTh5?=
 =?utf-8?B?bkljcFdnTDJZYVM1NnNVTjVSOEptVGlvOG1sVFJZTjR4bmR6WkJqOVlyWUF2?=
 =?utf-8?B?RlJWOUNKV2lkWXJBU2l6THY2QlJvSmJMOUJ0U0dUdHBOVWI4MVd0S1BVeGNC?=
 =?utf-8?B?ckcwNmxzdGRLUGQyMmZKOE55N0k2MGZjSTdQS1ZCV0RMUjE5RVJCbVlkdmNx?=
 =?utf-8?B?T2QrWjVBUGJ1R3BRVWJWcmllbm01TnZmT3BqdnpuTzFiLzBqNEs1UWtpSEow?=
 =?utf-8?B?WVZxQ0VxalVhVXpXMURCR1hQZmkyZUtlY0pyR3RPL2ZlSk8vci96L082VXRo?=
 =?utf-8?B?K3RxWUlkTmFWOENSeVZWcGQwdXVwZlJzNWR3dElMM0VCT1dZM21aM2VnbkpJ?=
 =?utf-8?B?OEp5NjJneHhqU1VhMTJBV1k4a2dHT0JibEZOeWd1b2lDNzQwY1NRRVA0NjU4?=
 =?utf-8?Q?8haX1nJHoKaB3Ifjop?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bde40f2-f034-42f4-6365-08debcbd92bd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 13:32:33.1616
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oy8LF59FPZF1JpzYP6e7Gw8YnyZr4DvDrIGS25wZw09Ba5U0oqqc6UJcsRc4wiGd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7948
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-62960-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[163.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linaro.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,xidian.edu.cn:email]
X-Rspamd-Queue-Id: 770765F2DD7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/28/26 15:29, w15303746062@163.com wrote:
> From: Mingyu Wang <25181214217@stu.xidian.edu.cn>
> 
> When a GEM handle already exists in the drm_prime_file_private, repeated
> calls to DRM_IOCTL_PRIME_HANDLE_TO_FD can cause drm_prime_add_buf_handle()
> to insert multiple entries with the same handle into the handles rb_tree.
> Because the insertion walk moves left on equality, duplicate keys are
> structurally accepted by the tree.

That should never happen and would be a major bug.

All callers should check if a handler exists before calling drm_prime_add_buf_handle().

How do you see that a handle is added twice?

Regards,
Christian.

> 
> Later, when the handle is released via drm_gem_release() ->
> drm_gem_object_release_handle() -> drm_prime_remove_buf_handle(), the
> latter iterates the handles tree, removes the first matching node, and
> breaks out of the loop. Any remaining duplicate nodes that share the
> same handle are left orphaned in the dmabufs tree - they are no longer
> reachable through the handles tree and are never freed.
> 
> When the drm file is finally closed, drm_prime_destroy_file_private()
> triggers:
> 
>         WARN_ON(!RB_EMPTY_ROOT(&prime_fpriv->dmabufs));
> 
> because the dmabufs tree is still non-empty. With CONFIG_PANIC_ON_WARN
> this becomes a kernel panic:
> 
>         ------------[ cut here ]------------
>         WARNING: CPU: 0 PID: 19739 at drivers/gpu/drm/drm_prime.c:223 drm_prime_destroy_file_private+0x43/0x60
>         ...
>         Kernel panic - not syncing: kernel: panic_on_warn set ...
> 
> Fix this by restarting the lookup from the root of the handles tree
> after each successful removal, so that all duplicate nodes for the given
> handle are erased. The caller (drm_gem_object_release_handle) already
> holds prime_fpriv->lock, so this does not change the locking strategy.
> 
> Signed-off-by: Mingyu Wang <25181214217@stu.xidian.edu.cn>
> ---
> Changes in v2:
>  - Drop the unnecessary mutex_lock addition, as the caller (drm_gem_object_release_handle) already holds the lock.
>  - Rewrite the commit message to accurately reflect the root cause (duplicate handle insertions) rather than an assumed lack of synchronization.
>  - Restart the rb_tree lookup from the root instead of breaking the loop to ensure all orphaned duplicate nodes are thoroughly removed.
> 
>  drivers/gpu/drm/drm_prime.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index 9b44c78cd77f..dc28df1c6698 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -202,7 +202,10 @@ void drm_prime_remove_buf_handle(struct drm_prime_file_private *prime_fpriv,
> 
>                         dma_buf_put(member->dma_buf);
>                         kfree(member);
> -                       break;
> +                       /* Duplicate handles may exist; restart search from root
> +                        * to guarantee removal of all matching entries.
> +                        */
> +                       rb = prime_fpriv->handles.rb_node;
>                 } else if (member->handle < handle) {
>                         rb = rb->rb_right;
>                 } else {
> --
> 2.34.1
> 


