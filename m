Return-Path: <linux-media+bounces-64470-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eA03DouCKWpEYQMAu9opvQ
	(envelope-from <linux-media+bounces-64470-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 17:28:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AD166AC7A
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 17:28:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=czvWdnim;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64470-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64470-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E4D3030E69C6
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 15:16:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F176306756;
	Wed, 10 Jun 2026 15:16:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012033.outbound.protection.outlook.com [52.101.53.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66AF62165EA;
	Wed, 10 Jun 2026 15:15:59 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781104561; cv=fail; b=RvpIyi4FYpvAodqw/AfRq09Qn7/s7YngEWQkY7MEpBHzMbZeFebsGRp2wwG38PKArmOL3hfeIi3AYwHRKKSoPyvCbsENFLggHLWxGlbpCZDXauog7gECf3OpK6zE4oCUiC/Mesvw8mKfK4tEQoKiVSmGX5AC3sBm5r4RfSw7UOA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781104561; c=relaxed/simple;
	bh=gq6Y9cb0kIP2Ss8y4KJFA5uwl9iWgegML02/Dll3DuQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=P9LBy+VkhFBhEuyhek9jCU92N/sIt3HFega4s5K/20zfkO7RhDnj29Qv8PVR8iAhEHyHMPhUtas/IGDMZQ+V7m2QPQCJKvP1xcitryGD8nu8ff/F9qDPh2n86TCnKp7fhSUNnxdqYsmjQE/yUuJTs7XBZZXHhT/BrmN/jX6lIGg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=czvWdnim; arc=fail smtp.client-ip=52.101.53.33
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yAOoTNFUjjXLbH6VIzvylG8cWax8l74TdfSzXZx6aTC02rBhzkuVzbD2afGmC0+HMl06u1L6nvoAQzIHE8CjIkDgbS74oBFh7Kp4dpJlrqJ03zdskRcWbMgSX4R3b2kdiKf7IokQw8IGjgSUPf8Fd9SdmJP6RmofxnWmQVZelwvthsueudBa5dAoUMju6pyKw0Qp771y+Ti1dn59csQukB3XJnpuwWTp5rh1JDcwLXnfxZ7M/jhqzAWTpvjYTpgcL2qvREazDjZJfU3Q/DNM8vml24qzcY+C6frJcVLxZBio2aEujEwGZuX7272jAhRG2aA0qkVDfJLga9166BKb3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fTvptXvXpGyLBiFjhkP/DsDLhkATHI03GvDc2vuAins=;
 b=pDy50keQfX5AkEsHznOYPrBUl0s519zguiO5H/pI9C/xdAy6QirBuz+sQV8OAFjxGApIgugl/dVDLaRlgpXeYWCOfzN43+X4oH8Hdv+trGu78vOlvOrJrK81QVt9BPXpS7CQmcBCzzk4dEIDB4V7G0ZOyfuRhr8tRLzcMLXYhWpCgxpEA+PKAuKtDMAAR2wxfWiJDXEfxSfnYHFnPsvEdb7a7xw7ZK4dRN0AuL8fSrW5EQjs+ZmvgYYhAl78oK4Fb8F8uBqV1HxaV22TaC0yqDrdoljreH+KLP2/sxlgLRaPtOSx/BtS7T0zQLXA3fVCkr4/HK+voFHV5h4CrEaxkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fTvptXvXpGyLBiFjhkP/DsDLhkATHI03GvDc2vuAins=;
 b=czvWdnimOx860nRHWnrFGM0/tO7mAiKUhR/yjmFWZBcLoRZ3ehLTBIkdGgFVDFR8iCyFbnI8l+jlx+Vhgan0wx1yppGC2sFaO9TU+bvzNkNam22hRBnmFHwPucgClGTR+XyoFEm2FiMi1vSrGGnS48e0SwNnsY/hpKN047byuEc=
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS7PR12MB5792.namprd12.prod.outlook.com (2603:10b6:8:77::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 10 Jun 2026
 15:15:53 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0092.006; Wed, 10 Jun 2026
 15:15:53 +0000
Message-ID: <25494ee8-5108-4044-b4d9-cfcb37c397ea@amd.com>
Date: Wed, 10 Jun 2026 17:15:47 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] dma-fence: Fix races of fence callbacks versus
 destructors by locking
To: phasta@kernel.org, Danilo Krummrich <dakr@kernel.org>, airlied@gmail.com
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alice Ryhl <aliceryhl@google.com>, Daniel Almeida <dwlsalmeida@gmail.com>,
 Gary Guo <gary@garyguo.net>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260608142436.265820-2-phasta@kernel.org>
 <95f4ae6b-9dec-4122-84e0-fbb0cdee9cb5@amd.com>
 <fa9a335196525adbc03ec21b2e05bb526e4fc174.camel@mailbox.org>
 <9d49c901-fcdf-487a-a733-0320d0bdf94c@amd.com>
 <DJ3V3OCLIK2K.3CYKWYNHYU6JQ@kernel.org>
 <ea4e0541-3702-4014-b8f6-0746a148df86@amd.com>
 <DJ3VYD71HDQ2.3C8GG983Z2YCM@kernel.org>
 <c8564ea0-8ff4-4049-996d-bd978c478372@amd.com>
 <aebe759117cd65004510946e39bd02e4c903e1e3.camel@mailbox.org>
 <84519e72-e057-45f9-8ace-baf12f095e55@amd.com>
 <29754897c2b6d0a9560a05fcd1c0a0946577518d.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <29754897c2b6d0a9560a05fcd1c0a0946577518d.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4P288CA0096.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d0::25) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS7PR12MB5792:EE_
X-MS-Office365-Filtering-Correlation-Id: 71266e26-c2cf-4893-f055-08dec7032994
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|7416014|376014|6133799003|18002099003|4143699003|56012099006|5023799004|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info:
	/yD4uVoEDrhnUfhrQaP5M1A/PyTLVNJlpGJzQmrB5GauDpbwDutRqCSyx06SWlOy31CAa/M2rAteSBN4aq74ooaWLMiAUIU9BY1w/GGZKL4GKD0homQF5YH8gCbWyCOsls4g9VroQRcrpuiv3anI7swhzaAUGsPlhfJg/53j6xb9JxP0wMsU7uKsWYex0z5Y/PlxFVYw1xtYRjygcDbxXdKtP9LUjIVuwL0mT2eOGCx6iQN3A6EtQf3581h8Gk73VTNAiqpmlK36TQwNei4Ke/R7o2rUfXVyLYlAMwMIHEloCdJ7c34FyqeHHWkhSW7NPutfkATCP0zO1jiH4NwGjNf/rR/cj+JiIvXcJFduIothmHbYhDBL9hC6H2jCshfAT68q3APPIW1m3gNkAjxBZqpzKpJsxbcSmA2Bs1Yf4fV3Tb20Uz6ahWPVZGUXSHBcJ9JEn+1gJtnknIVEDawiX66J3oC33bX61BOvtjAqBp9HPsnqSfCLlhW5PrzVjch4k01ctsOOF8LTBa7EE7y+3EKvdaKD9HiW6FRBIXsUT85lyBOmDUnQf8dO+UOAAYkJyZ/0qtWgUvkwml/7B6MHdLxVCzpuv0b0C9ly+rJGZ2/AqFHGez8gFYkcbL2F8ZjCtwh77p+2uDVpzPyWUN+aTvuv0SkJca62tHEr9RllGHOyjhSyfs8lD3T05tEC1yx7
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(7416014)(376014)(6133799003)(18002099003)(4143699003)(56012099006)(5023799004)(11063799006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?amkybXRsRFpYTWNuaTFMSjEyakR6blBpNHUvUU04aEg0Z1p5alBwNEdSSERN?=
 =?utf-8?B?OW42c2dJZWNyNGgvbDdHUVhHZE95Y2FCVTU3blE0bnc2V3FQSFZja041ZlNw?=
 =?utf-8?B?R2lqRTgwcDZ5OC9ZdVUvYkFNQTdQK3pQNWVxR1g1WXNBMmtmMENycS9xVnpZ?=
 =?utf-8?B?Q241aWQycFR6LzQvZjhmOUJpSytTWW5mRDBwbjBWb3QrQ2hkSm10a016RFFt?=
 =?utf-8?B?SFU1WXY5SFJxNzFFUVNQTG0wWERPUTViR3BzbXBRcGxlQzZ6VENac01ZeS9w?=
 =?utf-8?B?RVpId3U3T1FBTEg3QW83OFhweThqMWJ3SUdwRFN1eEk5QUFNUUJMZTN0dVlo?=
 =?utf-8?B?WE9UaHpnQ2F1Ync0S2hocjdWeEZrdEx1aE9Gdi9rTXpNRGNsaSs4K2VXYkNp?=
 =?utf-8?B?RG1zZjdITGNVaXErc2Y0UHF2UnNNbXlCcE1raWVFNmVkUG9rVTlGWXZDRmFr?=
 =?utf-8?B?S0VUSEw1NVJHTnJHdnFHSmlhbDQrd2t1WHZQYlVzRHRHR283U2lNdUI4VnEr?=
 =?utf-8?B?eVJ2UTJxNjdJaFlNS0laREtEY21nSzhieDRaeXFhc3lQejAyN25SakxGdjVT?=
 =?utf-8?B?YjA2ZzNMdkszNXE2cUlyeXhxWFlHcEMyOEU0RkNZZlJtelUycDY3WVRHdlph?=
 =?utf-8?B?NUNpZ1prZHM2ODNsTU9hdlJKOXYwTDRObjh3bVJLSXBIZ24wQmZ4RDBnMmRH?=
 =?utf-8?B?T1hsdCtIaEREdGZ6STg0MWtlU0Yzb2RpRUo3aWFDMXVpeW81WlI3TmZRV1hW?=
 =?utf-8?B?NFVwbkx0RElYY2ZJbzk3cDlKZjZCTExqUEc3NHdSNVVCSGRtL0dvV090ek1j?=
 =?utf-8?B?SVkvc3JEMWJvUjFyY3ZzWjZhZVpWclJob0tyK1NuZ2RVTHhBN0FWbStxdmRp?=
 =?utf-8?B?OEdlb2xqRHc1VTlIYWhvL2E2TFUrY0dySmlDSzQzQ1VwYXRJR1lHaVhkRDlj?=
 =?utf-8?B?ZTEzOWMvYklST1VjeFpWY0pIampyUkRjU1JuQ09VWS9mQjd0UklWaXpKTEJm?=
 =?utf-8?B?MVJxdHpFR1dlRllmb2s4cUhiMmFpMEowVlM2c0NwZHUyNUlFejgvMmtLcXE2?=
 =?utf-8?B?ZkVyaXdzN3k1L1dmRXdCS0JlWWdrSDNxemQ1bTNTaUgwbE15T2ptRDVPY1BF?=
 =?utf-8?B?S2JUMVZ4TkQ2K0ZNcy9aWWZZdmlsb2p5bW1lTFNVTzl3eTJkQUNQK3QrM2Rx?=
 =?utf-8?B?cDhTZjV3M2hNOGdwRXJzYVlubk9RVjhtTkt2WDVmTjYxdGt5ZXM2NlpNVGdM?=
 =?utf-8?B?WGVxVW9MVmRSVzFTQzE3QnlFQW1TeXVWbjRLa0R2UXY1QTZCZkRLL2NwbFpj?=
 =?utf-8?B?TmI5T0RST3FLVWFycXoxUHgramFGaUpVc1BWSnk0WlFyTnp2OVdPSG9iTHRr?=
 =?utf-8?B?NTlPbm1aM3MrTFNLZHdSSVcyc1ExeFJCMUNybkkyTmQyY09KRUYxWW9wV0FM?=
 =?utf-8?B?T0FrTDNjZHJuWlhlM2pKWmhBV2xSMG9GS2UxRFh3TUlkMGZjaE1LWURYdlBC?=
 =?utf-8?B?cTk3Q002MTVVVDRPWmRSWllpYnRJQjQrODhLSVBGMHhZL0pySVRTUnZ4S1Iz?=
 =?utf-8?B?NDVNMGlITExLbUlFSmQ0dStkQjd6TUZHM0g0WTBwaFZSK2dob0hjV1F4b2Zs?=
 =?utf-8?B?a2UyajZidkFieTZDMUoxdUYzNlBZU0FESzN2ai9iV241S0UxY3NXODJpdjgr?=
 =?utf-8?B?NlVnUEF1cDU5MmFuVzFQd0RZUU1rQ0szNlRTSXFZRWZHdDVRS3FKOElQSEdM?=
 =?utf-8?B?ZG9KSXdEWnNDVVZ2QzZpT0dudTdGa2ZudE1KZjIrckRMSWNTekdTbTltMFF6?=
 =?utf-8?B?Q25JVzBQdm0wb3J3UDE0aTNlRXRUeVc0aXk1SDdxdlZVK3A0ZUF4S0lFTFlX?=
 =?utf-8?B?L0lEcmNJVGVUR29SbHFkUCtMOFFoQkN2UEdqV1VzVVhDQmFTZzFtVlVjZUw4?=
 =?utf-8?B?TkptNzNucTNPczZoY0paUjRMaEZtMHFjTW5pWEtBRkY5SHAySlZVM3M2a3lT?=
 =?utf-8?B?eXZGL1ZyWlI3SmZNRE83SzR3NjNJc3JlWHRpL1drSGhnME5mRlZFMC9aNlJM?=
 =?utf-8?B?aUNVWlJUN2txVDZhR3kxUTVWTTdGOGhQQ3lmdFZKMDE5RlV1TjBZWHI2U0FE?=
 =?utf-8?B?RjZYUnVQdFM3MUd5ejdXRG83Q0hmN3pOTk96L3daZUdSQU54Sm50WW9DcGkx?=
 =?utf-8?B?aDVWTjlXVzlLRzJDTVREaEJySHZqZ0pvZ1JtU2VHdzdDWTlJL3NzNzNWWTZq?=
 =?utf-8?B?NmJNMUt2RzBjR0xUMUxwUnBnNkt6ZEsrLytVT2g5VnFrb21CMjk1WDBsKzl3?=
 =?utf-8?B?WjdEV25ENlc5azB2MXFTMERidU8wWWF2SWJCdFE2dU1GVFFIbFpaUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71266e26-c2cf-4893-f055-08dec7032994
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 15:15:53.2795
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ucQS35iEBfUpmk5G0hyG/rFgpj9JaSSU2dLB3k0F4zP/fU/1/RWfZhu10jzqKMek
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5792
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64470-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:dakr@kernel.org,m:airlied@gmail.com,m:sumit.semwal@linaro.org,m:boris.brezillon@collabora.com,m:aliceryhl@google.com,m:dwlsalmeida@gmail.com,m:gary@garyguo.net,m:tvrtko.ursulin@igalia.com,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[linaro.org,collabora.com,google.com,gmail.com,garyguo.net,igalia.com,vger.kernel.org,lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,amd.com:dkim,amd.com:mid,amd.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A6AD166AC7A

On 6/10/26 16:25, Philipp Stanner wrote:
> On Tue, 2026-06-09 at 15:34 +0200, Christian König wrote:
>> On 6/9/26 15:19, Philipp Stanner wrote:
>>> And look what I found:
>>>
>>> static inline bool
>>> nouveau_cli_work_ready(struct dma_fence *fence)
>>> {
>>>  unsigned long flags;
>>>  bool ret = true;
>>>
>>>  dma_fence_lock_irqsave(fence, flags);
>>>  if (!dma_fence_is_signaled_locked(fence))
>>>  ret = false;
>>>  dma_fence_unlock_irqrestore(fence, flags);
>>>
>>>  if (ret == true)
>>>  dma_fence_put(fence);
>>>  return ret;
>>> }
>>>
>>>
>>> That looks weird, doesn't it?
>>
>> No, that is pretty much expected.
>>
>> This issue results because of the lock inversion/cleanup race between
>> nouveau_fence_chan->lock and dropping the last reference.
>>
>> That in turn is caused by the fact that enable_signaling is called
>> with the fence lock held 
> 
> 
> Are you referring to this comment from the documentation?
> 
>  * Since many implementations can call dma_fence_signal() even when before
>  * @enable_signaling has been called there's a race window, where the
>  * dma_fence_signal() might result in the final fence reference being
>  * released and its memory freed. To avoid this, implementations of this
>  * callback should grab their own reference using dma_fence_get(), to be
>  * released when the fence is signalled (through e.g. the interrupt
>  * handler).
>  *
>  * This callback is optional. If this callback is not present, then the
>  * driver must always have signaling enabled.
>  */
>  bool (*enable_signaling)(struct dma_fence *fence);

Yes, that was an extremely bad idea which I have tried multiple times to fix.

> 
>> and delegates the signaling to the caller instead of doing it itself.
> 
> Who delegates what to whom?
> 
> enable_signaling() is called indirectly by someone who adds a callback.
> If enable_signaling() is implemented, then the driver callback's only
> job is to activate some sort of interrupt or worker that will signal
> that fence at some point.

No, enable_signal also returns if enabling was successfully if it wasn't successfully the dma_fence framework signals the fence.  

>> This in turn means that you can't do proper cleanup after the
>> signaling is done by grabbing driver specific locks.
> 
> Sure you can. If everything is properly synchronized.
> 
> // driver
> dma_fence_signal(f);
> // all callbacks can't reach our driver anymore

That's irrelevant. The question is not if a callback can reach the backend after signaling.

The question is if the backend can clean up after dma_fence_signal() completes.

> struct driver_fence = container_of(f);
> lock(driver_fence->special_lock);
> cleanup(f);
> unlock(…);
> 
> Where is the deadlock?
> 
> I continue to fail to see it. Show me an example of some code that
> would deadlock, please. Either fictive or from the kernel.


Interrupt driven signaling path:

spin_lock_irqsave(driver->fence_list_lock, flags);
list_for_each_entry_safe(...) {
	if (fence->seqno < signaled_seqno)
		break;
	dma_fence_signal(fence);
	list_entry_del(&fence->list);
	dma_fence_put(fence);
}
spin_unlock_irqsave(driver->list_lock, flags);

Enable signaling path:

myfence_enable_signaling()
{
	if (fence->seqno <= signaled_seqno)
		return false;

	talk_to_the_hw();
	return true;
}

The problem here is that the enable_signaling path can't grab the driver->fence_list_lock because that would be lock inversion with the fence lock.

Implementations came up with tons of workarounds for this which only work more or less correctly. The issues Nouveau had is just the tip of the iceberg here.

If we nuke the fact that enable_signaling() is called while holding the fence lock all that complexity goes away. In other words it would then look like this:

myfence_enable_signaling()
{
	spin_lock_irqsave(driver->fence_list_lock, flags);	
	if (fence->seqno > signaled_seqno) {
		talk_to_the_hw();
	} else {
		dma_fence_signal(fence);
		list_del(fence->list);
		dma_fence_put(fence);
	}
	spin_unlock_irqrestore(driver->fence_list_lock, flags);	
}


> Nouveau's enable_signaling() callback does not take locks. Its
> signaled() does not take locks.

Yeah because Nouveau reverted like most driver to use the same spinlock for the driver lock and the fence lock.

But that approach is fundamentally broken, a) you can't cleanup from the is_signaled path because that can be called with both the lock held and not held and b) it doesn't allow the fences to be independent of the driver who issued them.

When it would just be that we consistently call the is_signaled path with the lock held I would immediately agree, but that breaks fence independence and already caused so many issues that I clearly want to remove it.

Regards,
Christian. 

> 
> I went through all implementors of signaled() and found that only xe
> and nouveau invoke some function pointer that we want to investigate
> closer:
> 
> User Way signaled() operates
> -----------------------------------------------
> amdgpu_userq_fence.c lockless
> etnaviv lockless
> i915 lockless
> nouveau lockless?
> radeon lockless
> vc4 lockless
> xe lockless?
> 
> 
> Who will be deadlocking and with which locks?
> 
> 
>> This is *exactly* the problem I'm trying to prevent here.
>>
>> When the callbacks wouldn't be called with the fence lock held the
>> Nouveau nouveau_fence_chan->lock and the fence lock would be
>> completely independent.
> 
> You seem to circle around the idea that Nouveau's fence list is
> protected with the shared lock?
> 
> That issue, if it exists, is solvable through the embedded lock.
> 
> Anyways, there is no issue. Neither Nouveau nor other drivers will
> deadlock if we call ops->signaled() with the fence lock around.
> 
>>
>> This results in much better cleanup paths, fences which are
>> independent of their issuers and in general much simpler handling for
>> all dma_fence implementation backends because we don't need to worry
>> all the time about lock inversions between the fence lock and
>> internal driver locks.
>>
>> So as far as I can see what you suggest here is exactly what has
>> caused all the problems in the first place.
>>
>> For the cleanup path in Rust you should be trivially able to use
>> call_rcu() if the synchronized cleanup path would be causing issues
>> (which I clearly agree on).
> 
> You can *satisfy the current dma_fence API* with call_rcu(), but as
> Danilo states delaying work always has subtleties – plus I don't really
> want to have an unnecessary call_rcu() call for tens of thousands of
> fences per second.
> 
> And I would prefer if the dma_fence implementation just wouldn't be
> racing. It is clearly desirable that a call to dma_fence_signal()
> decouples the callbacks. That's even how you have designed it, just
> with an unnecessary graceperiod thereafter.
> 
> I also doubt that it's robust that dma_fence_is_signaled() can return
> true while the callbacks are not all executed.
> 
> And all the RCU dancing is fragile, where people need to guard API
> calls with the RCU read lock instead of having the ability to rely on
> their reference / refcount. It would be far safer if dma_fence would
> guard against everything with the lock.
> 
> Summarizing:
>  * enable_signaling() uses the lock already.
>  * set_deadline() users use the lock around the entire callback.
>  * dma_fence_is_signaled_locked() demands that it must always be
>    possible to invoke ops->signaled() with a lock, as Danilo pointed
>    out.
>  * The few implementors of ops->signaled(), see my list above, all do
>    atomic operations without any locks at all.
>  * The other callbacks are either deprecated or not relevant in this
>    regard.
> 
> So making dma_fence locking consistent would make all our problems
> disappear, could probably even solve the unload-problem if
> dma_fence_signal() becomes a hard, synchronous decoupling point, and it
> comes at no proven cost.
> 
> 
> 
> P.


