Return-Path: <linux-media+bounces-65719-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6TvIDOlxPmrtGAkAu9opvQ
	(envelope-from <linux-media+bounces-65719-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 14:34:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D39E26CD08C
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 14:34:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=wHBfuK9B;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65719-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65719-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6128830432D2
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 12:34:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69A5E72627;
	Fri, 26 Jun 2026 12:34:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010040.outbound.protection.outlook.com [52.101.46.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1953DBD55;
	Fri, 26 Jun 2026 12:34:01 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782477242; cv=fail; b=S1XWg+9578cKSlYIGezQSAFPbXgNU4umIBhIvbThDTjk5dnpkhQp/6iMnFBsfV9m6eFwehSPf3md7WigepU+tSYUHfF0BvKqSHFVaNpU36MLypvL68jr7Oau2rrxyiIaWH4R31LwP+OQ2CPnQAeF7m5MXMcQ0V2HpXAVaiM7CcM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782477242; c=relaxed/simple;
	bh=BxBwedZ4PGPR2LVsBY+BNNDzWCayJwUipkF4htncxXM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kT2WzzclVqtLQ6FfQzYJqHqlVkEIBxBAmuYX4OR2FEqyN0xEJmzR/xXeclRBBbIQAr2PRclB4pZWxUsWZrT2qOLq4iRcTvKei0U+LqtH3jlANPyPcBZqCS9i2lMRuh6gyGUAdY/mHODLL+e9trIMkGoD2xweFbjoBxLBtj+jb3E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=wHBfuK9B; arc=fail smtp.client-ip=52.101.46.40
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CQZmu5UQVmKwCZFWpE7T0HesLNiL1hhyQhZcX5XwEhWisE+QjhOSN3xZVouo5PYsH3HQwZkJYf5NpFKsAFoRJ6cHLm3F9kfHP+jCveO8jUopPZMZ7JGYo3sLS5QtdhmuCfYj1dxkOmf8zBh00s4n5WQCPVtw6K6P+Oh2Bk1tkUv6p2ubBBooqANC1eqU0fo8GlVkF3drqZVJYGPq6sDuYIH9sNn0iNBMuvOXr3LUv1T3K298EZZ8kyj5BtVYGu/XlF5p6QWLebfZN6n4wVR7K7AKqEqDiHykwMCPBJn5hSgjCnzlwmhYd4iwAMZAlaCTV3c3Yn/e5CY2wkb3IeNK/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uR1mEWNmQzsZX5ybjlcNz5c4f4pT+EKoC36s4D3BbVE=;
 b=j9QwIiC0d0/478Vs3DM5eF0Eu+ZlM3Us/CIB58VuaCPFZrfcq4vQ7UppD03Q0d6pT7BoJnESQMflgOjdKy2yHpnsyDSPai1eG4BwYVST2ILD1bxHAN7UQRfH1wEXxAyw5Hu/dXBjJStB+vAmVVBNIx2+LG5P63apfDptwH5TpfQS7BmRnCbT9C6qcn0BGb5/rvkBw6x19nWPetWdeXNXBOmQlirKl/9SrAnWOXOTjunchEGg+r6yB/aInGyufIHiB0uOibmf6U6J6qF4BgdonC/7vkw/DvMgvzI/pZTM92qxDXd4RPHdN8Z6iD2M+VS0/50Q0M8xuhnWUunvlzzK0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uR1mEWNmQzsZX5ybjlcNz5c4f4pT+EKoC36s4D3BbVE=;
 b=wHBfuK9BtbbtGZdTsoNFHnwBxJqi/2UhKCUyx6rLFFaAFnAG3kq//hyp8weHaWX5lK9t+h8mdyGpoaFLREEElMeuT0uZr0li00G7oSqg43BR3QMoZbkw0bjw85wtyT0ajbAxqOrqvg9yAApkPq5v0bFewuFNGux1Fq5SrWNjL6M=
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY5PR12MB6372.namprd12.prod.outlook.com (2603:10b6:930:e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Fri, 26 Jun
 2026 12:33:58 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0159.016; Fri, 26 Jun 2026
 12:33:58 +0000
Message-ID: <414021d5-e6b2-4219-9ad9-2c342cbbc7f3@amd.com>
Date: Fri, 26 Jun 2026 14:33:54 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fix: dma-buf: fence_chains_init: error unwind path leaks
 enable_sw_signaling reference
To: WenTao Liang <vulab@iscas.ac.cn>, sumit.semwal@linaro.org
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260626121825.35310-1-vulab@iscas.ac.cn>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260626121825.35310-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1P221CA0043.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:5b5::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY5PR12MB6372:EE_
X-MS-Office365-Filtering-Correlation-Id: 6511d4b2-a26e-4e49-3534-08ded37f319b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|22082099003|18002099003|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	bruDg/mtsJrljz4ebKN2qZsRJFilhrwg/mf4/DjAC+VLKGsl99rqxAnNNcnqC5i9YFrns2Nn2b8SDD5vXZlFjlggHF8gWg4KoU831WdnSXY3cZZPBgcayhxSbRQlL9ESRSBLD2t0EpeKH1m2n84t97iooz2nCJ/IAAdaZbqW49jl7WMotBnOHaHSViGWWXUjLRU9lLzPIj0ivFYc6gaw8QMJTMuxMw2ogHvrXhPtoepfn7a1LzoK4JFaD8UexvQ4S9afM8tS3bcWL7moCAcLrp9Rr01Qk3JRL0awMhfg0rWXhhLGA9hEDmqWF1bYHANKyvtQqb/YV8ZnM2YFER+XAdOR4dxoqXnpx53mXl4QwRlHPnexjI1lFDlDKtVbF9+g7Zaf13Uim6HwatMtAtvf+mKyP++gtYN6BEcednRx98Xv5PL2mq3FH/LoX79AGLTRbOGJtQc5BpgyrpFqYSXEAj1AhCrBNZzUipk87zZ7HaBXbPmS9tUHRI8ttQ6iV91K9Z7N3SHm8uwCD3VA0dbrhqOb38Cy7Kn8TtOHbxUdnkTWAopxTISNtllLuNVy6GKNCxWBURhA0e2sXw9X3+xoLGo8elMqaZoJFj8d3jGV469ylV5RE0OUVViW8DUO/14JPw/2R1y9WfzcBCfBtOSl7XjJaHqa/GYj1xEMwCp5sFs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(22082099003)(18002099003)(6133799003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MXpBL0NNNEJ4NEh5NytmVXhZYWFHeTZPREVKaG5Tb0Q2NDFIN2VrenBWU2l6?=
 =?utf-8?B?UENHZ0M1d0h0NittbEdFREUwemFGWE14UmZ4d1V2QmxFYjRORmMwU0RqSUFu?=
 =?utf-8?B?Z1pSUllvbS9WUGxCR2R3QlhOaWlkMkxhV0RtbXJCY1U1L0M5empHdWYvMlZ6?=
 =?utf-8?B?ZitlZ2R6VWVZaTZtVHRadERSL05HelArdy9zbjB1UENvcWRrT0pLZ0dnbXdV?=
 =?utf-8?B?TE9VdmRGeUFZajBVd1VJY1Q1YWFGU2cyV0FJK01lWGowT0JHUjZSclRQaktt?=
 =?utf-8?B?NXVmRXZqZFhubHBLNkhVQjJTVTZhQ2toL1M0MkdpUENmMFkvOVFIdWljamZz?=
 =?utf-8?B?eGZrb1k3YXlINUlKUmZnTm5YdEFtTWdpQkRwOUhENTRZQWlpNVJTdHJwRmhQ?=
 =?utf-8?B?UmlXeHJwMkd5UkM5by9wdFppTERIL2FwMjNsZ3FhVHhFdDlraVpoMWh3WmFr?=
 =?utf-8?B?U1lqeXg5eGR6YlFHMnVSUUtSd0hkL1B1ZUhlYkFZekU1TGxlZ1ZzL2ZJWHBh?=
 =?utf-8?B?cXZ1WlpUbXFKaTNoNHFEc3NsVTF2T05qWkVRWndUQkN2RjVPT056dG5vVGta?=
 =?utf-8?B?clh3VC9PcnUxZHlwZjRuS1QvMVNYTjhKaEZZRlBNd0x0RGhtVWk3R3B3Z3Ba?=
 =?utf-8?B?TzZIVTFxTGx1TGxHcFhmOUkyWWs2UHBZVGlnT0NpYmJkZU9ZVmRNZ2E0Y2cz?=
 =?utf-8?B?dlBSaDNpOGRuTzdaLzBTTzBwa2pFeG54cE9jNVhCRStBTkRtcitkR2toWFVB?=
 =?utf-8?B?T0kyWW1CRGptQ2RLaEpzU1JUTDRldk1weVhrRHg0c1ppb3pFaE5ieHhWcUdR?=
 =?utf-8?B?SmVaTVd1NnJWZ2Y4STJlTHptODA4U0ZFdVdXY2tIeDlkeDZ5amtRT1JmMHpX?=
 =?utf-8?B?R1ZmQWhGSU5wMFFMVDdHT2ZGVGlWTWhGNVpXVS9EZ1hyU2EzTk5mbU14RGln?=
 =?utf-8?B?eTRmSXp0UXJSakhoUUxVL3grR1dZd3gzaFVKRlF5QkZla3pQa2pDN0krMkJ4?=
 =?utf-8?B?M2VUdWpjT1RUY1NYbUFId3VMcDdUcGtLaFRoYlRUbG9tZ3lqVUxyZTgwT3A5?=
 =?utf-8?B?ZVQ5NXA5TlZoRVZ4S0ZkbCt5TVIyakVQeEsxaHZTTDBzOXF4RmIvd0VFVHdF?=
 =?utf-8?B?cWVqczJKYlNROXgzR1l3MENZVjd2dU1ZNzA2WkN5dnFYNWI5OWMwYjR1clE0?=
 =?utf-8?B?NUcwaHNoUEsxTVdqakttZlhPSG5IemwrU0ptcEJ4aG1TQm1OVytlWisvbG40?=
 =?utf-8?B?WjB6TFh3NkRsK2diK0Rzc0pJeFFIZHZoellMdEwySnU4QmR4TlhrS2hHcERt?=
 =?utf-8?B?ZW11ZjM4c0JCZEJqQmQxem8wMnVpTFRkSUw5MzE1OVl2WFBqcUpTRGVQZ3Bw?=
 =?utf-8?B?V2h0alpsdGN0QkV2NXJUNEsxbkgzeHU2OGRpQVAvT0xOSzBDQXd5NURhSURi?=
 =?utf-8?B?Mnk4L0VoM2phT2pST05mMW80SEJKTytKdWZua2NTeStkSmNjUzhyMnZtcU1D?=
 =?utf-8?B?VjB1bThlSG1FSklETGg3eklPUGZHKzlHTDQzTVF5dWR6Z3Z3QU1LeW9EVSsv?=
 =?utf-8?B?eVNqcXpLUWxMMXZQb0ZlYzdpbHBnR2ZRaGxwWjBhL0QwQ2hBOWJmQ09JK0Nn?=
 =?utf-8?B?MkhteXhnTDhRU0xrRGxOQi9OQWdZb0FjUW4zS0wzdGxmSWhheTFydXpVbHFH?=
 =?utf-8?B?NExMbm9tV0d6ckRYdnlGUzE5aUZkZ3ZQQTNDdkw4d3VKS2pZOTdCWWt2ckZD?=
 =?utf-8?B?S3hDOEVlYmpPaCtoZnFLOVZzTWIzVTVjcGlwdlBvekdMTU5uM0FLeXlRdzA0?=
 =?utf-8?B?UUVWZ25KSlJ0c0ttTHQ3WEc4R0k0VUdZWnppM3pzR1o5cmpJM2hxL2tSeWVR?=
 =?utf-8?B?UVQyZVB4dHIyMXN3cHgzUGVzWXcvYWFySWFDaE1rcjUybytkZjEzdi9IelAx?=
 =?utf-8?B?U3paSmdkS09DVFAvZDlRbk1LQ3FrZEJPZ2RFVFY1bmtsQzgzM2U4SS9MRG9r?=
 =?utf-8?B?b3hOU0dhdVA0S1VHR0tJaXc1S21DWUFqQzdrRXBMYWlqZXpOWUVKR1I1WHJS?=
 =?utf-8?B?Vlp0WWk4ek1sZTlQOHZHYjFEWHJMamFzbEw1SHpqRXFHcmpGTTVCSFpFZVhV?=
 =?utf-8?B?Tktic3B6cWVPQzJUY2tYNG1zaDJ1dUVKOFNUcDdkMlFEMkxnZ2lieTF0QTho?=
 =?utf-8?B?WVNhMVdTTE0yOG5pNDJtc0loVW9ONGtUVjdKOThWbmZ1VnA5QzVEZC9ScTNN?=
 =?utf-8?B?eWFxUWNDYXgrNUtuSGlDWGFIeG11RVRVUHNDN3NJVSszeDVFejlRL2w3MXBH?=
 =?utf-8?Q?STSex74g7M+4eG31uR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6511d4b2-a26e-4e49-3534-08ded37f319b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 12:33:58.1291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2AOtuVfL4EaQCi7pVRJ6kXw2j9peBELcRDRIqdyFAYcdRsRXZsN+uUUsguCbreEz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6372
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65719-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vulab@iscas.ac.cn,m:sumit.semwal@linaro.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,iscas.ac.cn:email,amd.com:dkim,amd.com:mid,amd.com:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D39E26CD08C

On 6/26/26 14:18, WenTao Liang wrote:
> dma_fence_enable_sw_signaling acquires an extra reference on each chain
>   fence. The error unwind loop calls dma_fence_put only once per
>   chain/fence without first signaling the fence to trigger the callback
>   that releases the signaling reference. This prevents the chain fence kref
>   from reaching 0, permanently leaking the chain and its contained fence.
> 
> Cc: stable@vger.kernel.org
> Fixes: dc2f7e67a28a ("dma-buf: Exercise dma-fence-chain under selftests")

Please drop that, this is a minor issue in a unit test and not anything which needs backporting.

> Signed-off-by: WenTao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/dma-buf/st-dma-fence-chain.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/dma-buf/st-dma-fence-chain.c b/drivers/dma-buf/st-dma-fence-chain.c
> index 821023dd34df..7dc18e294387 100644
> --- a/drivers/dma-buf/st-dma-fence-chain.c
> +++ b/drivers/dma-buf/st-dma-fence-chain.c
> @@ -152,7 +152,10 @@ static int fence_chains_init(struct fence_chains *fc, unsigned int count,
>  
>  unwind:
>  	for (i = 0; i < count; i++) {
> -		dma_fence_put(fc->fences[i]);
> +		if (fc->fences[i]) {
> +			dma_fence_signal(fc->fences[i]);
> +			dma_fence_put(fc->fences[i]);
> +		}

The usual text book idiom for such cleanup cases is:

while (i--) {
	dma_fence_signal(fc->fences[i]);
	dma_fence_put(fc->chains[i]);
}

Additional to that we need a different error handling target for the case that the mock_chain() allocation fails (or just do another dma_fence_put there).

Regards,
Christian.

>  		dma_fence_put(fc->chains[i]);
>  	}
>  	kvfree(fc->fences);


