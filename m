Return-Path: <linux-media+bounces-61879-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yORlBnm7CmrG6wQAu9opvQ
	(envelope-from <linux-media+bounces-61879-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 09:10:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E29F567359
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 09:10:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 364B630157E5
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 07:10:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E90B53DEFF6;
	Mon, 18 May 2026 07:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="EB6Ew+V0"
X-Original-To: linux-media@vger.kernel.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011033.outbound.protection.outlook.com [40.93.194.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A7A3DD523;
	Mon, 18 May 2026 07:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779088237; cv=fail; b=srRCgvJLNCwBoMxDFJcMcNzV2PMrKrS3+xEstI80tqso8dO/Vpi+xABsLXBFBLHI7ScZUE8A2A1iXLbi6I8CdlxwwhO3b6Sp1gqlwnukEjvisqwoO1AShzWpH9YIPs1CXV2WwZtlfY31NDkyFSZGCfASUCzclNxbiBaN/wU9CBw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779088237; c=relaxed/simple;
	bh=aQd9ulOkJQSTU1WzflnoHBMKVCCG8bef2bkvS4kQkF8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Wq30e4s+datOrfmHgsj0gb6i/pOpFBQgo/TB4O0s5TH4vnbbtF3E5wwmXROmFNQ1H35hizdob87Rjvyznysi0PTuSK0r14J4fzH/cn15Iu/D2JOaKS0+dJW/alJAS3qItScG41E4xIiUs+I+FeZioHhz6FvbG6rO14eGux7Yv5w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=EB6Ew+V0; arc=fail smtp.client-ip=40.93.194.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VLRGFsLBIZN/4/HaPCu6XbhgqCYVZoyMLwBJbt1rWXyzBp53fcEp+eg9MqPpso+EWrl+ECXwaj6Mv//6u9B2nQ4gsbnjcoipeHxWzANHtyAjuUvYpkplo/iycTCDyq0L1C/i9IaPcJmrbPfC+mSuaH3wTnZCxVYf1h6gGHyU4opW9v8mSDpn/vEm6h6hKBiVoSKlk9o1/OgzykdJ7RP9W3uyGeS/4oMqaUwqGaXcgZT8d+t8mE3yZv8SRF5bjT0S/XgX0sc5P55at09Z2mMg5Ep/HHxBQpnNoOYF16YS7XCZLW3gbO/1OCp3QZ0PrhDZ71hJDzzaOMVEHjcYOYaLRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hv/EuG1WPJeVlDUtwL9KLMZlTu4YMpUr+dBM8KhSnuE=;
 b=j8sdW3S0FCBZkwbdYHQFKYlu5IQoZzzyUiIPIjHIzwtAS/p62BV6ANWdMhGkOl0TGa1U6z93fhuTIEgOtubKY+giBh96Woq4XAjBZ0cvR2qcD6yWXE9F+HcrnirG7UUwJTcZBX5Apz7W54C6NvFa+0DteiM4OkD5gm38NcxX1q5pL0W2S9awOqCJBZS7TuhGNmf0Qg3g1xbP64nIuPIqkH72iamOBGPso/atbA3srM9Z8aodmNU1WcN5Etv7ghahx6LMdk1xkOajtdANF7Fz/CZ6xP8o6fzsABIbvs3cWKB/Pw1tuZE/xPktYuGFQ2NA7bMFPCo65FzXkaELQ/cYHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hv/EuG1WPJeVlDUtwL9KLMZlTu4YMpUr+dBM8KhSnuE=;
 b=EB6Ew+V0zH7WldTsxxmjygyABaqWC16WaGuFELuCjJGkkFLaWE75D4yY00I9As7J0JufzSEicTDtqbmNqp7N7n5HZLGBxXW0PziS//kQEDyqxjFWyVSDqdnnsTCECOuxRSM6fS0cwXAMxmYtAS8G1wL14CnbfALEaNoGuHoVICE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH8PR12MB6748.namprd12.prod.outlook.com (2603:10b6:510:1c4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 07:10:31 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0025.022; Mon, 18 May 2026
 07:10:31 +0000
Message-ID: <03a57011-e734-4a74-aef2-e3a6016e15fc@amd.com>
Date: Mon, 18 May 2026 09:10:23 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] dma-resv: Define guards for context-less dma_resv
 locks
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20260513-panthor-guard-refactor-v1-0-f2d8c15a97ce@collabora.com>
 <20260513-panthor-guard-refactor-v1-2-f2d8c15a97ce@collabora.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260513-panthor-guard-refactor-v1-2-f2d8c15a97ce@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0177.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH8PR12MB6748:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ba60c40-7978-48b1-cb81-08deb4ac8c3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|56012099003|22082099003|18002099003|4143699003|11063799003;
X-Microsoft-Antispam-Message-Info:
	qac2ir2EyddERn8gKXUsDBz3eqff9+Q14/dwuLmc8NRhtssR7MYOcttd9yPzXDArWi9g9XcV5oTjtdpxUohRjMWc4bs1Zuj/xdohStLrhGDg+U8H0eoPctdDh0yPLUu0KN6LX4c511epuw63Iipu06/naUOtuQw7201TWvd0B8MNpe1SDoOv0mBvg14daBB7oNqbh9dc+TUjSd1f2O925ZsBFt8e0NwXtflW07nuhznMignNJhGY9v1t07vxrBp48Ry5ogiWOuoL/uEZlNAvh1WFWKnnhSwxzc3/x3pX0/Ri/u4RDFV6N7b6N4iUzWZKrzsxK9WcUM05EC/Z7UofyQVNDqZUGuAfg6qAN2Qb+s8AxVa5aExEAWpHCvO46/Nvb8IZn7J6KnA+aFi7lollo7m4XAhAcQIZ1n+OdM0woOxUaZkV8PhPZnEsBI7lOWtNhgMwbq9ZraPKjiVsrMyAmyKNPCOXvQ4ApDvq0hIordw6Un00v8hEaKJ1GyphTo5Iv7s6PMBqRIXO4qlS5au39lEBxW0WHUi5Q6e6nMteqCN3Ltgc4Cs+uOEmRIyCvwG7n0pvYU0hf6yHE0afce6xifl9w29Q7ggH+XWLjtFaqPEeZqYD9pjKQ8rQkVVYhnue5fj6Gp51fgaSzIr2iftTsNoSr6CCtZje/EMwkBpYWFMh1D7we5oTlpNuH3pM44Gs
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(56012099003)(22082099003)(18002099003)(4143699003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QzVpQkpHSjhiNlJzRnJobEJ1MGs3azMweGhneXFLcmJ5OXNUdnVCTGYwc1pL?=
 =?utf-8?B?QVpyWi9ITFM3dDUzTTFPOEhOUldZaTBtMVBqL24zbExyeVEyUXJDbUtESWE1?=
 =?utf-8?B?QnlqL2dMNHRJdXZmVERuOWZkU2xaR2NpQStVdVVxRnBBazZ6cXRZa0E3WmhJ?=
 =?utf-8?B?RjlaVWk0S0x4d1c3L0ZGTHVuWFpScTVMalZrWVdmOFVHUzBJZkt5WElZTGVC?=
 =?utf-8?B?K1FMTTh3ZjJGZ0JWZW1ib1BUN3hEWGt3VGxteFdtVDJEbFpvMFdVdTBjbmY2?=
 =?utf-8?B?dWNSQ2hyeDRIRTFIeDVOUG5OSDJVKzJXWE1NYS9ycFpZOXdyd291bm9XNXB5?=
 =?utf-8?B?aC9oZG04dnJsTTVuODROMWZGZ2RlcG5EMDA5MDU0TnZRT2EzRWZmd09UWE1r?=
 =?utf-8?B?VGEvQkFydHA5UFNhZm5ZelMydTBvSUgwK3VoN29tcEF3eVNodXFZWkxLZGRl?=
 =?utf-8?B?YkNBNUNseTNjU3VEdzB0VFdsMmhPWWxua010MWNSM2FqK0g0N0xlajhXMW5a?=
 =?utf-8?B?SDZNSUxyaUp0b09JbFJSUTBjYlkzMHNnK3lUVzJJT0hOcEs4T1lvWTIrTlRP?=
 =?utf-8?B?aXpaK1ZnV00ydlA0c0dFUCs3REQ2NzdjbHZ3WldtK0dZdm1OUU1WdnRnbnpL?=
 =?utf-8?B?cEZPR1A1ODlaaE5iY24wNStZRWlVMWZBOWx6VmRZUUhxUHN2cHdTZ2E1ZU1F?=
 =?utf-8?B?T1RRNDBLVW5NbVNWRDFtb3RqQjZKRSt2N1pOTzcwOTJTOTVacmEyTC9vdXNp?=
 =?utf-8?B?cU9VSUhSRVpHL3Q0MjZBWEY4NkZKL2NZK2x5UEJISDJTK3kyclBkQnRxbHRD?=
 =?utf-8?B?T0FiV0Q3Q2FjT2QyQ2pGZDVOU3lISEt5U0J1NzdZSEtNT1JxUFBlam54Qkxz?=
 =?utf-8?B?UmhXZ1kxRERHUEhEdUxFaktVVW43NHlnRE1zOWVscnVUNjg2ek83SWMxWDl5?=
 =?utf-8?B?cm9PdUxZaEJBbWZtM2g2Zk4wTWNCcklmM1JLd09WSkdQcE1BZDdUOW5lNmxl?=
 =?utf-8?B?cXFFUGlvc09PS213MTE1Ymc4Unk4MDBzYXM2ZzMxa3Y4NGwza2hNa1FCN25S?=
 =?utf-8?B?bVNPRGV4Rk53cXI0NjBCSWVBM2ZJaEhJR1ltVm03MTkyUUNQVUQrZUMvYm56?=
 =?utf-8?B?N3o5eTVibVhaVm1MdDU3Yk55d3NQOHNCTmJCY0I4NVlibWR3ZFhGbVYxOGE0?=
 =?utf-8?B?TnNzaEtid1JjaVA4d2RVRU1razMvMTdGMzB6L0NEVGlpVHdaRmhyYmZsTG5S?=
 =?utf-8?B?RWFOTUNCN2JzTDdjdzNuaXRKaWlxSjhuVG1rcm9IZEVrNG15bXJ2Yk5ESnVX?=
 =?utf-8?B?Y0dleVZzTnZWZUdSY0txMjVlQ2tHQ2JxT0R3dXFIeUMrdGNPUjJjRDY0Q3dW?=
 =?utf-8?B?dDZocW94WW1WTHhNUkZBNHZxc2wva2pudHZjK25GcUxpck5GUmxVZWRMUDVP?=
 =?utf-8?B?K0h1Yit0UHBEdXQ4WDVDc2NBRlQ1MU9PQjRhS0ZoYkVySCtrSVVKUFJ6dmtw?=
 =?utf-8?B?QUpMSU1YWG5FMzRpWll0b3c0bUFYd01YV3prMndNcDBhbVFaY2lSNG1OLzhD?=
 =?utf-8?B?ZnBaMm9zSFBuVnpVZ3dEZ2hMQjEyOE5iaE5LNDlIMjBSdzhPTjZrdkVhR25H?=
 =?utf-8?B?K3RMUFY0SU9rOWF2bWM2YzdxSXl2b05Lbk9UOURZSG9oclUrTUNmTHVydUJy?=
 =?utf-8?B?R1B1bklWYjZqUCtQZXI5dFIzMW55Y0R0WjZsbVZCdFVsZWlLcWdCRUFaZlZ1?=
 =?utf-8?B?WkZEQVY4WkhkUnVHVEpxbDJrSGFnMzErZTd0T240b2d0V3laeENuOW1TL0x4?=
 =?utf-8?B?anFla2FsdjRhUjlGMzhEdzdUbUF6bjYyb09SUGRKQnJYK2FoOEpuRE9pMWRG?=
 =?utf-8?B?bXRzRE9RZm9MVVNBTm9XOWJzanlHTTFQZ0FNb1FsdWpDc3ZGNCttMFBKd3Mw?=
 =?utf-8?B?Z25RTVlqQk04L3lpVFl3RmVaTDR2eCtyeVZhYVcyTTZzZkk5Q2V2RFhtT2Qy?=
 =?utf-8?B?N0pKQXZYeS9lRXg5Rk5QRzdBUXZtZXcxTkN1aEJMV2pydFU2MlJFbldWMWx1?=
 =?utf-8?B?R1RQcVNIcTYwWTdLUVlmS0hBcE1UajdOaFpPOHp0eTU1RE5sMUJjRWtxY3pj?=
 =?utf-8?B?YThNZ1prVlNGdHNDc1FQN3FhRUhVOUdEQlk0VVdDL3JLUHZ5VGcvN21JOTMy?=
 =?utf-8?B?V3NwbWVoZjFibllWV0ZWSXFNM3FMcGdiSDJlQ0YzS1VvcDZWMTU4dm1GSU1x?=
 =?utf-8?B?YUxhN2Y5SmN4am1XVjlGdVJaeTlzZ3E1c1lxOUg3UjVZSHF1Z0Y4a1hxNVo3?=
 =?utf-8?Q?oTETOfBrIoheuiKiiM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ba60c40-7978-48b1-cb81-08deb4ac8c3a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 07:10:31.4727
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SAb4m3kIqYGTH6xYIQkLgOME/6IhxbOzAPcUf75hbpfYjZ6A/l5nyrx1zO1CZoig
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6748
X-Rspamd-Queue-Id: 8E29F567359
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
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-61879-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,lists.linaro.org];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:mid,amd.com:dkim,collabora.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On 5/13/26 18:58, Boris Brezillon wrote:
> When used without a context, dma_resv are no different from regular
> locks. Define guards so we can use the guard-syntactic sugars for
> explicit/implicit scoped locks.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

How do you want to upstream it? My preference would be drm-misc-next, but I think I can live with a panthor specific branch as well.

Regards,
Christian.

> ---
>  include/linux/dma-resv.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> index c5ab6fd9ebe8..e559b1811ca3 100644
> --- a/include/linux/dma-resv.h
> +++ b/include/linux/dma-resv.h
> @@ -40,6 +40,7 @@
>  #define _LINUX_RESERVATION_H
>  
>  #include <linux/ww_mutex.h>
> +#include <linux/cleanup.h>
>  #include <linux/dma-fence.h>
>  #include <linux/slab.h>
>  #include <linux/seqlock.h>
> @@ -484,4 +485,8 @@ void dma_resv_set_deadline(struct dma_resv *obj, enum dma_resv_usage usage,
>  bool dma_resv_test_signaled(struct dma_resv *obj, enum dma_resv_usage usage);
>  void dma_resv_describe(struct dma_resv *obj, struct seq_file *seq);
>  
> +DEFINE_GUARD(dma_resv, struct dma_resv *, dma_resv_lock(_T, NULL), dma_resv_unlock(_T));
> +DEFINE_GUARD_COND(dma_resv, _intr, dma_resv_lock_interruptible(_T, NULL), !_RET);
> +DEFINE_GUARD_COND(dma_resv, _try, dma_resv_trylock(_T));
> +
>  #endif /* _LINUX_RESERVATION_H */
> 


