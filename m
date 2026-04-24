Return-Path: <linux-media+bounces-59496-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YIW4NBEp62m1JQAAu9opvQ
	(envelope-from <linux-media+bounces-59496-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 10:25:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD4E45B6EA
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 10:25:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D1BC63014C71
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 08:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0D06344DA0;
	Fri, 24 Apr 2026 08:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="QmMRsExh"
X-Original-To: linux-media@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012062.outbound.protection.outlook.com [52.101.43.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F77333440;
	Fri, 24 Apr 2026 08:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777019144; cv=fail; b=WHwQ4HtpSMtnjszTDrIwNo/ht+HALFsljZ2TlklofUcWvgem5TrFccp+oDvIpAqAG/R6uWVjmjRQw2mDwh0FMOqZxNZqnyAfzkAlCRx2Q1YzD5kQkfwo26pLO5vkHJ8QUL57Q+FBM5tfBDofz9j3So3VqLVxWlk+CtRQn1u17Ko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777019144; c=relaxed/simple;
	bh=KPsb9ZA2lPVqYOAOp/qrXGRkgJzv7GLG3la0Yit69hg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FYtm964iO1EjX5aSF2GBBCdHUozc7IlrBEJuvVTUPxYOiKPcJU3Tdcwm0LXdWt5SFIQFyXfMqGS00zxYPGu0FIJi7tY2Rl28rd4GCI+/k4oyujXpxUA245VDep62CHivOSkeY/+na7kOTisZ5Ulma1n6KeMUje2msG73ohJVoBY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=QmMRsExh; arc=fail smtp.client-ip=52.101.43.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bc1GOQCXZAopQr/+UgpzNRYrtItbkjKxPCYUM4nK5leWOVpIlrlyfSbuJDVqi0b6qK5NVHIj6lFyRnoLZL+5jf6a9iWOrbv5VwxXtoA8m4jT0PCM77rK7Uku4SezP6mO4E6TlsggR/4SLAUCnW1EZfx4v8Jzs9LuuwbiznRDtdS6qqponNDKeI0axzIXgP9f8EM1v1zxh017kjISFZ0vrfT9+sw1fFNIcoqb5n8aRfwEMh2hS6nOWgR6erDmI/zdDI9A7d1+QhW2hdyqjM26c0ph5bHgIGNFv9UWv6F3hudanXtuwkjK+u+WOqBCA7Im6RQeK2tr1KH9KLEHpfWTXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w7TNyY/lYHLLSCa5Ra/CX9BuJtD5IZVLv3ibec1Z4oo=;
 b=RYmr1PzXCZ/sHTb1twmxAy8LENHv2Bg2134Bt5KSqBsvGAES2Bgk7Cj/EvfLuMZ4wWN06XnYvQUuUxJXogVFr4o7F7t8WMuvIV2Tac2vuStkTa35N30iPKvdzVwVs2YqYPVw7UjQrcB58rPJe7vDwlch89rOiVNuXA/ywQMtq7wESlgaTZi1burbuQZWsTOgbMTzCS0vUebwDW/69tXFZE3cyNIO2QMF3iL1X3wvMiSF0ErS3EDdk0KTk1ycsr4uxAHau3HXDJ7k4N+2PMJHrkaZ1LSF0d6uaWct5PHPexAn0E1amGMmm6DwI/9ItbLp4TYriByxv2TLWKc/kt810Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w7TNyY/lYHLLSCa5Ra/CX9BuJtD5IZVLv3ibec1Z4oo=;
 b=QmMRsExhZegauuWhfb8qhzDkMhXx0ikof/OhhB5DdriGRN5mNLckI/1rT9Oydeh7vo5hFyaEvTxFnOmhiiVFvmPuW+4ghr091FWMpDZXGBaaQlWuRV6GKDYtB3uVIwVMpYpxcUBCtCaRWui0V0PZwRKD71/yVK5W5ickuKFJ0Jo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ0PR12MB7459.namprd12.prod.outlook.com (2603:10b6:a03:48d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 08:25:37 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 08:25:36 +0000
Message-ID: <a2241936-579f-4fa6-a9ec-49325d44413f@amd.com>
Date: Fri, 24 Apr 2026 10:25:25 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V13 2/7] dma-resv: Fix undefined symbol when
 CONFIG_DMA_SHARED_BUFFER is disabled
To: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
 chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org,
 jbaron@akamai.com, aliceryhl@google.com, rostedt@goodmis.org,
 ardb@kernel.org, sumit.semwal@linaro.org, ojeda@kernel.org,
 boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com,
 lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu,
 dakr@kernel.org, nathan@kernel.org, nick.desaulniers+lkml@gmail.com,
 morbo@google.com, justinstitt@google.com, tamird@kernel.org, arnd@arndb.de,
 nsc@kernel.org, simona.vetter@ffwll.ch, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
References: <20260424054742.45832-1-mkchauras@gmail.com>
 <20260424054742.45832-3-mkchauras@gmail.com>
 <b4dcb464-7784-47e2-a973-6d731ab9ccf8@amd.com>
 <aeskOeb9uBiPptEJ@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aeskOeb9uBiPptEJ@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR5P281CA0029.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f1::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ0PR12MB7459:EE_
X-MS-Office365-Filtering-Correlation-Id: 0897a3f6-e7d8-4fc9-2c28-08dea1db0fc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	3btoKxuCOOd4rkrWEedArkPUExY4PnDOWOub5MLCAcYxm/1ZoPDPiNZ8NnCmDfoZSk2LMVUclZW5IdFnPkjcU3F03Jugobzlyizo4CM1eg+H77A9+9H0AvtI6qZWQyex622v7IVHK9+ztosGk22BkpkFsOYIWnsjmdA6s8x5Qp0WY6rHcYXiYMtOAl/CYmh1d4f3UBlfbHUyTpx6H19Pzgs32NUU4Qnhb6LF6a63QEHAJG+a2XWUa8NykwNvn4oG+hAibeY4PrKH9fJ0oqwqkdUnG9nNrQe/05PyC4djvqh4F3TmO5yLmUjMH2PPv4neHslRJX6ddDrq+18BS7rGhzTMvfRqgcJJM/xlhUWJqqnknivB/oNw1eYH3o52Npq7AXR6vMXj6mzdCHK6JDzINE0D7rTtdZhdymtl5eibT0xIBoIOsi6IfKsizrk+B8ODYFoOrvabNXN7jmqw0y+3ltxyhxu3t4ztYiDsO45goqE+r7+7oPqfzify83+GdozGuVKBr/dSgS+GWtXbymVq39lUPDX0mmSbsoNTYULGGd997VMU0doqZnDGeid2oepKHIvwIOd82t9whIPRdxtuzC4RCcm0d9TS/NLhXnsCsonTTnOvekgW2D+eKJ2Yx4Uj1DFrtfu33r/8ootNHslgyK/ceUsoQHDqNXggNXpr0JS5cYqsc+4rryWgPGrUmEqdnOUuJ044iKRLZFHkxrxAFZMssBBhukNjGZEeq+EIoac=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?LzlTMU1yS0F1N0hxdHpsYlhrbldzZ3YzdW5wQ3dUUWt1dDdIL3FLV21lZnVa?=
 =?utf-8?B?NGpvclhHNzE3dXlZUittOGNhLzVCOTZIWTBYaWVrZ3NoV2ExeWFQVlIraXc1?=
 =?utf-8?B?UUI3Z0s0WDZ6WVlzU3doc05RWk5TWTdHejViUlRjcEFnSFpZRFAyZzA1MWdk?=
 =?utf-8?B?ZmxCUStkZDlmRDdYZWRBV2JCYkhXd2hBQTFKaFdSd0YzbzBlNUoreUdYYTR5?=
 =?utf-8?B?dW1QOHgzTWI2SkhtN0lzNDMwMEdjKytDK0dqeDBqTGlLOUZUdmp1WGRjcUVj?=
 =?utf-8?B?SnBSbW41MENTcEkvN2lhNnZhNy93NkR2LzRDQzNuTzNSc2VNM0JXUUY2T1BS?=
 =?utf-8?B?c0V2VzU1WWhoNUp2bDFkeExTZ0ZUVFNJTzZHY2ZKNDFyOG5CTWIyK3hYWG05?=
 =?utf-8?B?K1VFU3doRHJqL0lpZkZ3dFZOc0pnUDhiOWw0QUxIakpiVFRBRzd0UTdkMXJv?=
 =?utf-8?B?ZVdDK2ViejVTT2paQ3VEQkRuWHdjcTVpRGRhSXVwSmFhUElob3lRQ2lEcGd3?=
 =?utf-8?B?TjVSeUVnUVdDeWh2M0txeCtTb2c4Ly94T1Q4emFBWm1MdHNyUEpNVzhvZkpO?=
 =?utf-8?B?cVluT0RmS2tVaDIxMGlFdytORVl5bEJ5VFBCeHQ4dXluUkNhWnlLYjExb21s?=
 =?utf-8?B?Nnhsc0R0alp6Vm4yNzZFQnhZcHZlVVBSRnR6djAvS3pQeWU2RDJqK21LUk13?=
 =?utf-8?B?aC9IK0FCMlpFUzdRTFR5ZjJwL3ZuNlhVcnkzVDlwRnhIUWlFajk0dk5GUmhk?=
 =?utf-8?B?YnVRZHU1RXBzdUl2STVtSE02VDBtRnlwcHlhYW5PdWZXQUt2WDc5NXJwWnJ4?=
 =?utf-8?B?RzQ2MHF0NTJDM3R0K25ubkhpWlEvNVB0NGkvMXM1cytMWnA1Ukhna0E4Y1hB?=
 =?utf-8?B?L25CRUR3OGR2L002d0QrcHRUM0lMN1RYdXpGb0dLaGxvUWI1elloR0sveEk3?=
 =?utf-8?B?cW9ubG9WT3EzUHYrOGNvVElRdVFWbUszeXVFVkdxV0ZGcEcwUVJSRmdIbFNy?=
 =?utf-8?B?ek1GY0pTaEdUQkpLR0Y4TndZWGtFYWVrQm9aVmgwWGh0bExpalBxSjlMaHU5?=
 =?utf-8?B?dGxQbXdoZlhleklVVlMyS3RHdFNSTTBjMjZybWlUeW1CU0JGVTQrSlpiNnk5?=
 =?utf-8?B?Y1Q0TWRrc3JEL05RcHdwS1ZHMFFlOUk1U21xRGYwMnl4SVkxNmVaY3QxL3pR?=
 =?utf-8?B?ZTU2OEp1Y3dIYW9MSURZbFRBNzBwRlp2Q3EyWGtSa1Job2FHenBkRXlxM0Fa?=
 =?utf-8?B?b3c0UzFMamw5RzNFMjlETjhLTGpKTk5hMEhsSUk2dVJWU1oyaytQNGxqZHU4?=
 =?utf-8?B?VGdBeHlVMXVOTmdXeU56TVo2SjdNK1ZjVklNQU8xVGtjYUdWZTlFMFBTV0tT?=
 =?utf-8?B?dGk2RjNTdi8xZ0pwRTRsZzFpMTFQQWNWWHdsVmdQbGtnRUxET0FMY25lRW9K?=
 =?utf-8?B?dUtiNnhqVUcvTjQ5YmJiNFkzNzJ5Um1VYlJKY3dSaHE2UDdHeC9BUzZkS2kv?=
 =?utf-8?B?MFkzaDlzemcwdGNoaWNFTHNINTFHMTYrM01hdWp2SHU0WnZqL3Vxc016ZE5x?=
 =?utf-8?B?N25FM2Q3cEJBM3ExdjI1NFQxY05uY0NFTDdPSVoxT3Rka0xoZjVtdFFMNGxa?=
 =?utf-8?B?bnJQdFBVVnQySDlNTVR6VzM0YVJYZkMzUVJjenVGRzZNd2dYeTZHaEpOZk1p?=
 =?utf-8?B?OGs0TnlRRDdwOXNhMGxuZCthR1JRNE1HcDRTNW1CT3JOQTkxR0VUd2xxNjFv?=
 =?utf-8?B?SnNtbW1Ea0hLSG9uTTlaS3IvZ0dxd1dHK0xOY3JIR1ZqYms3Ulk1aW9sbC94?=
 =?utf-8?B?SVh0SWU2STRJeER2SzhSYTJoblVDSThGQ2pjaWJpcDZRUDVHS3RLd1QrQUJt?=
 =?utf-8?B?c3BwNVVMTjFCR1JRVmczMm1McWVQOElsQzZPZnVLdmlYbGFDZ2N5NHJLMHdR?=
 =?utf-8?B?V3o3OTlVTHdXbDlKZ3ZiNkR5cFNVU3lCaCthWnVGSHFjeG1VL2ZPbWgyRC9j?=
 =?utf-8?B?TzZrc1lKaDdvN05nUXVNSWF4aVlGWTlGMEZwNE0yN0VNNTFXVWdnT255RmI3?=
 =?utf-8?B?MDlvdlBoQWJydlNndURLdGN3R1hDTTc3YXBBZW1VTGNKYWgyQy94VHhuK3N5?=
 =?utf-8?B?cmFQd0tDQ28ra3ZLRVhWMmhtWHBTWXc5bUMrZFVibGRFWU8wNVVmckUrOGU1?=
 =?utf-8?B?Z013anJ6TDVtUkw4QytWa2ZMdTQ2NjZHazBZMFcyWkZ2N29QNkE1NVlmcEdV?=
 =?utf-8?B?SnkraTlFY0tjdTRFaXhJcURTemw3Y2Rna2FCNHZVS2plWVJBUmdHMXUzTXpY?=
 =?utf-8?Q?KxQ2DDDAo9Gj0GwFGX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0897a3f6-e7d8-4fc9-2c28-08dea1db0fc1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 08:25:36.8324
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qS8p/DPDAG2SXgomuWILqM6RZp0xmKRQ1NUKbj+v/xwsFCTE/e94p2rDZWJtQoLy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7459
X-Rspamd-Queue-Id: 4AD4E45B6EA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59496-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,infradead.org,akamai.com,google.com,goodmis.org,linaro.org,garyguo.net,protonmail.com,umich.edu,arndb.de,ffwll.ch,lists.ozlabs.org,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[35];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,lkml];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	REDIRECTOR_URL(0.00)[aka.ms];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aka.ms:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On 4/24/26 10:06, Mukesh Kumar Chaurasiya wrote:
> [Sie erhalten nicht häufig E-Mails von mkchauras@gmail.com. Weitere Informationen, warum dies wichtig ist, finden Sie unter https://aka.ms/LearnAboutSenderIdentification ]
> 
> On Fri, Apr 24, 2026 at 09:56:16AM +0200, Christian König wrote:
>> On 4/24/26 07:47, Mukesh Kumar Chaurasiya (IBM) wrote:
>>> When building with LLVM=1 for architectures like powerpc where
>>> CONFIG_DMA_SHARED_BUFFER is not enabled, the build fails with:
>>>
>>>   ld.lld: error: undefined symbol: dma_resv_reset_max_fences
>>>   >>> referenced by helpers.c
>>>   >>>               rust/helpers/helpers.o:(rust_helper_dma_resv_unlock)
>>>
>>> The issue occurs because:
>>> 1. CONFIG_DEBUG_MUTEXES=y is enabled
>>> 2. CONFIG_DMA_SHARED_BUFFER is not enabled
>>> 3. dma_resv_reset_max_fences() is declared in the header when
>>>    CONFIG_DEBUG_MUTEXES is set
>>> 4. But the function is only compiled in drivers/dma-buf/dma-resv.c,
>>>    which is only built when CONFIG_DMA_SHARED_BUFFER is enabled
>>> 5. Rust helpers call dma_resv_unlock() which calls
>>>    dma_resv_reset_max_fences(), causing an undefined symbol
>>>
>>> Fix this by making the function declaration conditional on both
>>> CONFIG_DEBUG_MUTEXES and CONFIG_DMA_SHARED_BUFFER. When either is
>>> disabled, use a static inline stub instead.
>>
>> Well we are clearly missing something here, but of hand that doesn't looks like the right fix.
>>
>> When CONFIG_DMA_SHARED_BUFFER isn't enabled then the whole dma-resv.h header can't be used at all.
>>
>> So you also can't call dma_resv_unlock() from the Rust helpers. Which means that we need to make the Rust helpers somehow depend on CONFIG_DMA_SHARED_BUFFER.
>>
>> Alternative would be to provide dummies for the functions in dma-resv.h when CONFIG_DMA_SHARED_BUFFER isn't set, but that looks a bit like it just hides the issue.
>>
>> Regards,
>> Christian.
>>
> What about something like this:
> 
> diff --git a/rust/helpers/dma-resv.c b/rust/helpers/dma-resv.c
> index 71914d8241e2..53c119f1b144 100644
> --- a/rust/helpers/dma-resv.c
> +++ b/rust/helpers/dma-resv.c
> @@ -2,6 +2,7 @@
> 
>  #include <linux/dma-resv.h>
> 
> +#ifdef CONFIG_DMA_SHARED_BUFFER
>  __rust_helper
>  int rust_helper_dma_resv_lock(struct dma_resv *obj, struct ww_acquire_ctx *ctx)
>  {
> @@ -12,3 +13,4 @@ __rust_helper void rust_helper_dma_resv_unlock(struct dma_resv *obj)
>  {
>         dma_resv_unlock(obj);
>  }
> +#endif
> 
> This seems to fix the issue and makes sense, whoever wants to use the
> dma shared buffer will anyway enable the config

Yeah that directions makes sense.

I would maybe go a step further and don't even compile rust/helpers/dma-resv.c when CONFIG_DMA_SHARED_BUFFER isn't set.

But if that is not possible for some reason then this solution is perfectly fine with me as well.

The general goal is to make the error messages when you haven't set CONFIG_DMA_SHARED_BUFFER and still try to use the DMA-buf functions easy to understand and not something cryptic.

Thanks,
Christian.

> 
> Regards,
> Mukesh
>>>
>>> Fixes: 0c6b522abc2a ("dma-buf: cleanup dma-resv shared fence debugging a bit v2")
>>> Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
>>> ---
>>>  include/linux/dma-resv.h | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
>>> index c5ab6fd9ebe8..23c8db0b5214 100644
>>> --- a/include/linux/dma-resv.h
>>> +++ b/include/linux/dma-resv.h
>>> @@ -311,7 +311,7 @@ static inline bool dma_resv_iter_is_restarted(struct dma_resv_iter *cursor)
>>>  #define dma_resv_held(obj) lockdep_is_held(&(obj)->lock.base)
>>>  #define dma_resv_assert_held(obj) lockdep_assert_held(&(obj)->lock.base)
>>>
>>> -#ifdef CONFIG_DEBUG_MUTEXES
>>> +#if IS_ENABLED(CONFIG_DEBUG_MUTEXES) && IS_ENABLED(CONFIG_DMA_SHARED_BUFFER)
>>>  void dma_resv_reset_max_fences(struct dma_resv *obj);
>>>  #else
>>>  static inline void dma_resv_reset_max_fences(struct dma_resv *obj) {}
>>> --
>>> 2.53.0
>>>
>>


