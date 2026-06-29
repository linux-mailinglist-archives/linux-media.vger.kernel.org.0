Return-Path: <linux-media+bounces-65879-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qLbYEXIyQmp51gkAu9opvQ
	(envelope-from <linux-media+bounces-65879-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 10:53:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D65116D7B39
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 10:53:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=Q986DCiu;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65879-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-65879-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F3A40300E165
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 08:53:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECBD63F8244;
	Mon, 29 Jun 2026 08:53:00 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010029.outbound.protection.outlook.com [52.101.56.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2453A3EA95A;
	Mon, 29 Jun 2026 08:52:58 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782723180; cv=fail; b=YWWZ7BwnZl2ZFbY3k4AarJmFx5Kt2IDO8uWzfiOmJ7U+F7JN+9kPlWhQ+EqXR1OWzQ7OE1EJqKbrMZE7sJ1cvNirbe8zoYurrRKmPKnS56Way3KW4+FSUL114/rS9CC6zGDpOiplVcF/fGJd7JCKqBMNF0QMPlNmu3kTOnw15FA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782723180; c=relaxed/simple;
	bh=SymsYOiCBeJQu6rpAjB/EbclCuMDAAJfzQv3xLpkXxA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=U71IbUNBZvEm086Vh73zaIOBY2qVSFmaqMBnLVjwhwxda0hbb+3EYB+sRCuKgF/Y1pF9+W7ceZot1R1b2emrwx1iAQGosGWhf1XYKX3cvH1XAIPZgai3R1aTj/Os6v4AYNp5Fo9mbjYsgk9Xsm2rHiVkjvDOWdRzMqbDwW6hZE0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Q986DCiu; arc=fail smtp.client-ip=52.101.56.29
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PjWlq+No56JGLXdo+Dj8AJu5wH+FIBnE5j0XO3gTe01l4962J7vMYJYfRtcDtje3IzbGoRj/Qg1MNihaFxZf17b/iJXBGXcpzM4iR2TDUTkC9MveJRW0RkrQY5g7jJn2CZEFVmuqIIdDEmoSqWFukO5ZazmV9eDtA7fT1MgGVezq3V9qNUiKTkfqT+WaVJ7yC3iH+gcWUXPw45TSFUu2Iq7WLnMPYYaCyG3pa55Me6RWd0lK7CKyZPqg3PfIZGaYPf4ow7Tb9f0Gt7G0sxy9i/gm8cWGuUvTFevO5DRJqikN62MV4Sa2kyxQcUwkf81UbRx2D/MtAI7NWNYmt2ev4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UsOE0Jid2xVVKv1FP3ap2jWQIZIli/rD1TuUM2XSHt8=;
 b=L+jUbSVaj6guo9WASfVAHJxzompNKlf/4mYGGAwP7oN0B0blTujDp7Jwmt+mPJ8jDNYqseKzNUwiBWE/YBqaR6WKpdMeeYR7n8k5tgE0vtHRhiIWx68A5RZZ289KeGKa6J10k9wBd08U7aDPOSnLbgNZqlW1sK3brU2R5ztUaejnzN7XcXnOHDQdVRbuU/DeHDIlzVGHwCJQ5cPb4Is8NCtvSGL26Dzyq9+XE+S4WdKnBzQOryuVph/fvCg51s1kimdJ4e3aayYTVWd6RNEoy3d0dA4OLrQPTaTJuMo2s/+KNSt6ZP9o8yMS/kK090JPesMaFeXNyIjjDaZEf06zVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UsOE0Jid2xVVKv1FP3ap2jWQIZIli/rD1TuUM2XSHt8=;
 b=Q986DCiun9t6zONn5NXa4YfK8kiAEhzKkajPrQFiSK7wybpiQnlFUn6EP3GlDaSeMvOlzjBeZyknbqJQZ2NXdjm7JUr9guHMKovm6QEDBeyee+m4rX+LHrrAt9UlBcDUE4dMGa887AynnqCIpxHmu+Z7n5WbpBxcjbPMp6JplGo=
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB7643.namprd12.prod.outlook.com (2603:10b6:610:152::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 08:52:55 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 08:52:55 +0000
Message-ID: <66344c20-ea97-4dfa-ac42-c9d6e061eb95@amd.com>
Date: Mon, 29 Jun 2026 10:52:50 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-fence: Make dma_fence_dedup_array() robust against
 0-count input
To: phasta@kernel.org, Baineng Shou <shoubaineng@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>, Akash Goel <akash.goel@arm.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260629031346.3875683-1-shoubaineng@gmail.com>
 <becd29b5-9e40-4104-b6c9-3d91e2ddddff@amd.com>
 <058f4bb261e408cf17deca9ff7354460675eacbf.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <058f4bb261e408cf17deca9ff7354460675eacbf.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0136.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::21) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH3PR12MB7643:EE_
X-MS-Office365-Filtering-Correlation-Id: c33b3c85-a4ed-4642-3e6f-08ded5bbcf71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|7416014|6133799003|3023799007|22082099003|18002099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	3vBAu1JrT5D+9xMyUcsQB550w6GpZv79uqXBNiRW5sNAiRXpYaELyfSR0v3xwvh3LlfpCgJCwYpN89IG09XwpiSil4paLT5tE4LR2r3sskn0B39LuwUWl6yjIvrTMce6UEr+gdJX02NYPNJN380xcR9yhK8iIgqVyD4szRidaXO5fsZQ9LMHo7xs0OKIXb4SfWnFBkUuMZQQ+LNgy4kclbSUkFwKF/Oj54hsFiXyeQ4YaxVZtZTbnNpI2Njmr5t+VBJbC3pQeS97YkdkBoOCRbljaxqg2g8414aoFHpGl0rb24xADzTMR1r+LMAKEPSMrl7pdMdkR7Q1D4vBysPrKJLIjtiTdpAoQ6+XZ8Q2JXdaOJSkn0GKAbU9sOjxObImXC/ZSthIJR83MOKn/6Gwd68hesyzcx6i1wYAWR4hHYg8BjYM8eXsIQCb5KLmmCkWlVueYOmIqbH0Gzq+zmWI6oZLk6gN/J8hrkS7IVtO6xajNaW9pkLBTG+/cTEoe2bhFLgl+tScBHLFHAhGsuUJlx1JV4BAqlqdIJmmwRAECLnQvhJ+uIPBP2zb0+PBIbO/M+NBP5QKEAwrgwierkxM+Bg69W/MVzF16frkDFVQ14UUCFErvh+bg2anAhg8jXlzZyBeN5PkqC/c/rGMLn4PxhKxJN1QY7RBc9hmiyyhxTA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(7416014)(6133799003)(3023799007)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b1o3NFk1Slg1WUs2VGJMUGFpRHd3Yys2L1NHVnlWN2ZSZ1BBOVZmTGRYKzBa?=
 =?utf-8?B?S0NIS20rSHcrY3lkeEV0eWVuRmo1bTdTWFNnSHRoWUxKQUhrd3NHZGVhaTRV?=
 =?utf-8?B?WmNpWDUwajNhU0ZIYjd2QVM2bU05YmxLYW1xc1BXTXRsdjNLNjU2RDB5VEho?=
 =?utf-8?B?VGpvQThVSWtpZzNOMnNRWThydDFzS2NFNC9nem9XMkhjNXlkWXUza3puS0wy?=
 =?utf-8?B?VWRnTEIvcVRIc1gwZmZySW9qQUQ0a2UrT2hOVThQWnJqNmtzNVRvYkc2NDBl?=
 =?utf-8?B?VXNuMlpjMG8rOXNsNEswUXZvL0IwbWRFdGRnM0FmeTBNWFkyV0NnN3ZmTURl?=
 =?utf-8?B?Vi9jcUsyUFBidFFyNlZIUDZSZktYZVVRcnFZTEFjdXgxKy9kcVVGQ1UrNTB1?=
 =?utf-8?B?ZTRjc2R4Z0VZMUt5Ymoza2Y5MEdJTDNGd25wM3hnTXpRcXBKeFpvQS9IS1Ar?=
 =?utf-8?B?UFJ2aVR0Zy8vWG9xOVJZOW1wS051QkdWWEIzWlhOMU14aytNOEYyc3hCUjU4?=
 =?utf-8?B?aXlyRVhRV1RoNnpSNFhBL0RCKzIyMmZOVjBaVHdEbHp1L1JOZy85UzQweTJp?=
 =?utf-8?B?bmhZRjYwdm4rYmdOc0lYWXpiNXJYdERtWS9TeFRzMG40WDNoNmJUSjZoQmxX?=
 =?utf-8?B?enJhZldKZlZLaHdEVlF4ZGR1RGVlTVlwTEw0UW1tMXNpTTI2clNnTGFkemRi?=
 =?utf-8?B?NTl0Ylk2bW5taTFudFJNbHN2aEQ3R2M5UzFVd016R3hJcTc1bEFDblk1QVBS?=
 =?utf-8?B?d09CeVczbDJKdmNhR0t0cVdjd093WkxMVXRhTVpVbnpxTC9hTkhBYjdBQ2pa?=
 =?utf-8?B?dDU4MGc3NDhNckp3VG9uSmpoRDNBOU9TdXk4U2x4dzMvb3A0cjZSVVFOUHpm?=
 =?utf-8?B?YmRkSkc0TE5ZUzZPaThYWDJnaS9mSkdaYmczd2lHM21McU9Fd0c1Y1NBQUYv?=
 =?utf-8?B?dXcwSHVzNmhpVlZzdXJtakYxNzdvNzJHMzNRU29YaFc1V3FrZFJFeUxJanBQ?=
 =?utf-8?B?dDU5YVlwT3lEZFB1SEd1YjltRjQvWFFNTndSY3A5Y0t4OCt5aWtpa3VRZFg3?=
 =?utf-8?B?SERNa1daQmJ0aVBWYkUrR05oUURKTFgrYTJybGZyZUd1UUFjbU5rSmdEUDRm?=
 =?utf-8?B?NGxCNnVwdVAwMFRVb1JQbksyZG5jZmFiSmhXdmFma0w1ekVWUWZJMUNQaTRR?=
 =?utf-8?B?NVFwZzRCRzF0bDJzTFp0Y0pjSEVPSUtLOUoxUW1CTlRleWxvRzhCaUxyb2U2?=
 =?utf-8?B?eHdQdDVSWmZHNFE3WVVDMzQzbm9iMzJIZUZ6dWJDWjg4b3JjaUNRcldnYzNr?=
 =?utf-8?B?VG1rUlZ4NlFTdUY5a1ZmcmQzYTdLOGNuWEdGVlIxZWdBYUkvMnhuR01BRHhP?=
 =?utf-8?B?aytlYzNOTWprZTVIanBRSG4yMnVrVy9wVFluQll3Vms5bnFTWk1sM3dIVy9T?=
 =?utf-8?B?RkNoK2RBMkErVENIWGpYU3VqN0MzZW9hUkphbS94b2FtRC9oYjZiRUVHMTlp?=
 =?utf-8?B?YkFWWENTcmhXTkJ0eWVseitWKzdGLzVxT3hsdEU4cWJpOWdtREpZa3MrZldo?=
 =?utf-8?B?NGdpSWJxbUdHWGRCRHNLeE1rSzNzWHllMnRRYXhUTko4NGJPYThrOEsxaGkw?=
 =?utf-8?B?emd4dDBmSEkvYTZmelI2TEpGMGVMZjJRSldORGtVb1VETTRVU0JSYTJYV0Mv?=
 =?utf-8?B?aVRtTmcrRWk1UVlRYlFsNWtBbHg1bElLTWF5Zk1OUllBZjAwd3RiZlBoV1Y2?=
 =?utf-8?B?bWlzZXVLYUh5TW5GN0tFMER4djdLRzBGNkFQcnovMEE2VkV2TXVCbDI0SW5r?=
 =?utf-8?B?bkhoUE83UStLT0RwR1VYSnp0TjN5akkzVHd2NlF4U2VZWWtEOVd6ei9lZWIr?=
 =?utf-8?B?OUc5Vi8xMUdvL1oxV2F5aEMrNkNGV2ZYaDZBald4bGk5cVZZMm44ZUEwMk15?=
 =?utf-8?B?a1dhMVZUSFUyY2V4ekI1SzVCN0xCZW9qQm9QdmppbGsrNmZWYXdZaG1ySDJZ?=
 =?utf-8?B?VnhSU1cwMWZ5VkN0VEhZbDZyeWpIMHgyQ2lBNHVUd3dGQkFnS1lNMitaaDc0?=
 =?utf-8?B?Wm4zODUvMjNCNGIxSmpXL1ppQWFPUVpEL3Q0bnIrSHFWbUlEakhKL01ONzlP?=
 =?utf-8?B?SDBEaHB2d3JHanBiOVQrQXRjWHFVbk5TQ3ZLc25xVlF5b2dwNXpCTzFVWnc4?=
 =?utf-8?B?cDEyTEIwNzIzM3QxV2pubGRWYzhHMTlnR0FrL2VJa1YveFpJSm1yd3RXSXNa?=
 =?utf-8?B?WHppSkVYRVl2cmhLOXRnaHpsTys4QWhDdDl6alZyckJiYXVsSzZlUTZKNFU3?=
 =?utf-8?Q?EioKJmLY2JiN1q597J?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c33b3c85-a4ed-4642-3e6f-08ded5bbcf71
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 08:52:55.0971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j1dwGA0DMu5rFL1gVvtr4MKz1qKjJUcmKaqNoVd/vcPpS2+E2igj55yWcsw3005B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7643
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65879-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:shoubaineng@gmail.com,m:sumit.semwal@linaro.org,m:tursulin@ursulin.net,m:akash.goel@arm.com,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D65116D7B39

On 6/29/26 10:49, Philipp Stanner wrote:
> On Mon, 2026-06-29 at 10:45 +0200, Christian König wrote:
>> On 6/29/26 05:13, Baineng Shou wrote:
>>> dma_fence_dedup_array() returns 1 when called with num_fences == 0:
>>> the for-loop body never executes, j stays at 0, and the final
>>> `return ++j` yields 1. This contradicts both the kernel-doc ("Return:
>>> Number of unique fences remaining in the array") and the natural
>>> expectation that 0 input gives 0 output.
>>
>> Good catch.
>>
>>>
>>> All in-tree callers currently filter num_fences == 0 before invoking
>>> this helper (__dma_fence_unwrap_merge() bails out via the
>>> `if (count == 0 || count == 1)` fast path; amdgpu_userq_wait_*()
>>> cannot reach the dedup call with a zero local count because the
>>> amdgpu_userq_wait_add_fence() helper guarantees num_fences stays in
>>> [0, wait_info->num_fences], and wait_info->num_fences > 0 is enforced
>>> at the ioctl entry).
>>
>> That's not correct, wait_info->num_fences is just the maximum amount of fences we return.
>>
>> It is perfectly possible that amdgpu never finds any fences to add to the array.
>>
>>>
>>> However, dma_fence_dedup_array() is EXPORT_SYMBOL_GPL, so any future
>>> caller that forgets to pre-filter the zero case will get a misleading
>>> return value of 1. Depending on how that caller uses the result, it
>>> could dereference an uninitialized fence slot in the array, since the
>>> caller's array may have been allocated but not yet populated.
>>>
>>> Make the contract match the documentation by returning 0 early. This
>>> also skips an unnecessary sort() call on an empty array.
>>>
>>> Signed-off-by: Baineng Shou <shoubaineng@gmail.com>
>>
>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>
>> I will add a CC stable before pushing to drm-misc-fixes.
> 
> No offense intended or taken, but don't the DRM rules say that things
> do not get merged while there are outstanding concerns or significant
> points in review feedback?

I haven't seen that before writing the response.

I usually go over my mails till the end and wait a couple of hours before pushing anything.

> What about my comments?

Looks valid to me as well, but I think that is a separate issue.

If I'm not completely mistaken we should use size_t instead of int for array sizes all around the place in those functions.

Regards,
Christian.

> 
> 
> P.


