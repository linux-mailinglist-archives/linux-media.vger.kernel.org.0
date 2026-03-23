Return-Path: <linux-media+bounces-56651-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id PklONz+0wGkQKQQAu9opvQ
	(envelope-from <linux-media+bounces-56651-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 04:32:15 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 776B62EC38C
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 04:32:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D40D83003D29
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 03:32:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 219581F5821;
	Mon, 23 Mar 2026 03:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="rmRVk/NG"
X-Original-To: linux-media@vger.kernel.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012053.outbound.protection.outlook.com [40.93.195.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3238ECA52
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 03:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774236730; cv=fail; b=r6+qZQfzSv+s0hjIifrattRHxcpAcOqIeHSPeKqAT6S2/QqrMPBSi30VT6b8DKjDb6UENXwpjlLaqcK1hrid6CBLSdnhiB56OKMfVqqjGAkcPkJB0ee61m2lqGft2mfQSavpCmyri9xXs/Jz7iiDrGX62rVwWVsRbUbC2uxytus=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774236730; c=relaxed/simple;
	bh=7kus24of4n8QvPi1yB88L3+1Sc9znRCoMoqrx9W5QWo=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dJ8hbhjCPqM0WcUnpSNKoQpX2caiR6y01B4lD2wiI7fJqT799ASsCgpfeSKP9vEorx5yJ5wZ2AfECfq07PLG+sPpjhofzruQA46fvKvMJNlKwJ5VClwXYDgTigejYUS5lij//9+X4Ai0dNH5NRT3GN60dLxUpJUftd9T50G0Vc0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=rmRVk/NG; arc=fail smtp.client-ip=40.93.195.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AYo02ybyBy1PMoe0HLrUgVl2hPZRSSRdDq0ioC9OphmRlnAcONSbiW2mEjUBQFUxsPcQrtFXRl60I6hCxsit2VRBVEIbwWX8dLwXrnX4H6tjvChxIhHvdA0MIf2fVodaw3Wu/b0/Sd0IzgXxtc/MXSUQHpAqcu3SVt9hfeZGzGDV5EUjGco1Vnp22Ob1IRL2M/aeBzsC3UoNXpFKWy3aigVHN65qFEBVBVa5JePMnF0J7y8+8Mu+QToThOhIqlMHAl+STVS/v0zHngkto9W+JUXb/pAUGYSX+yfxvcIDkzWd0KjV/Y6Wc/ytVQivfftC3ZowiNXyq/TcxVZZUeCZIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pW4Rt62vrMBk4oGALV17ppWYsSLWa1ty9fCXZ0dR57U=;
 b=jcv9OK/wHSxY9HTZwElQohsqqk65g1X1LFC1ub1wt940gWVBeSbX3vvtYyNYMB1Z/SF/oRQR39HBVsvP6QWsihu9A7F1sxc0OE6Gae2WVUDVBqNLuBt3BCQzC0R9eRSuG03YMNvAYl6zRVQFeGbTwGznhPMIbA51i0j9hsaQG0zX5QWR8HYBEVI75gBU1lFscGWpiI7sCt1vDBp8bYUonBML3KoLb8p1VnPd1pdcjvxVAphpCiMcDSLbCVw6xoFuQjDXbT01N4cbTGaiRKC4TK7rXP2v8+C4B0+kIOMuxXU2DKt8lfISNwySGxjWRk7YTtqDWoT1mfloPqyickWZmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pW4Rt62vrMBk4oGALV17ppWYsSLWa1ty9fCXZ0dR57U=;
 b=rmRVk/NGsf3eO1u6dSsWIh80VtNBdNB+APpC24DyBVgarOYcYsSGn0ZOIOEOZaURyldZhRwgIsEyPm7qvQ2KxR4rr55mtbzbKA45xM3PGcZiuIE0ozVBu0O66MqEoItUvOhZVGi9l+74b4AprIPovXDjhL8aJcq3qaCA3uezbf0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV9PR12MB9829.namprd12.prod.outlook.com (2603:10b6:408:2eb::9)
 by MN2PR12MB4079.namprd12.prod.outlook.com (2603:10b6:208:1d5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Mon, 23 Mar
 2026 03:32:06 +0000
Received: from LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::2bc0:451f:661a:ac32]) by LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::2bc0:451f:661a:ac32%3]) with mapi id 15.20.9745.012; Mon, 23 Mar 2026
 03:32:06 +0000
Message-ID: <ce3cb00d-7214-4980-823a-955ae4cca62c@amd.com>
Date: Mon, 23 Mar 2026 11:32:01 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [v10,0/7] Add AMD ISP4 driver
To: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
References: <20260320084146.200988-1-Bin.Du@amd.com>
 <69bd3a57.050a0220.1b4541.789b@mx.google.com>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <69bd3a57.050a0220.1b4541.789b@mx.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR06CA0209.apcprd06.prod.outlook.com
 (2603:1096:4:68::17) To LV9PR12MB9829.namprd12.prod.outlook.com
 (2603:10b6:408:2eb::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV9PR12MB9829:EE_|MN2PR12MB4079:EE_
X-MS-Office365-Filtering-Correlation-Id: 226789b3-86f5-4a84-ea83-08de888cc200
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	l8/zOGBntSW9DTJ6AA6pKI63a13l8CmERn+BeMrg6PIHWzW2mAuL0yt3k0sFnpxpPRF0d9BLABMmoeMfYSC6d2Q6K0NgFsIbUaE3EFQOGmORpJ5M1Kortyc++yGyn8GwxRYQtcR4Fm9WqXEPU8IM+7rJhYjssaaqX49Kque5A74x9zNiP9Riz65eRMjfW8LLVqMxcB1YkRzJTfLIDCvvXacRN4pgWe/fvuvVb4tNUVTM+MEUR0x4pZvT/AAHJHCcYKnjeP4Oa2ynAOIMZRUI4PevKL0I9m6/Ad56P15iRbreZqXOShPhg7qEUWWu/BxZvog6PT1prnh5WxUdg4lBN2goO9r5t6Q6lTE/MzbiRJRf+2YocQQjRvFBhzmGmOJwCY0Mu88z4bBB7ShYe7O2hU63jTuiKId3a+rV8lYhMIp1PA6iX9xUoc7/VRQlzVAk7Sy/rk1AqdZYop22FH93HWNVOr/TkEE3LPwkXL+u2ZcvOhw2spDNtuVyh+GudE3s5FQAQ1odNgLzrQddlim1Xjx+cNKMWM1McWjmP0ODJuns2AqRZdXgBxOoY1NNDKqpPZQI3/ylv/vum1IDK82Pwi4yJhurBftjL6ZKiLNE6tJaLx80hE1K2f1vO3JuQnqlkW8Dr+jVnKEXCaaLxro9Ev8xMpJdk54pr13ChjjHLxbC0Xhc5LjhaefyinVOqbg2
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV9PR12MB9829.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VkVMOExvN3dnWG4vQ1k4QTc2WnlaWVFZQnFoZU15TmsyY3BSNEVNRXdTQ1h2?=
 =?utf-8?B?OTRKNVkxREF4UGFKUE4vejdnampiV2MwS0pkRjY1TzJMOTBZelN2eVRUV3Ft?=
 =?utf-8?B?Qi9zeWdVWUIvL0FzTVh4NFRSbXhhMStpRStmZm42M1R2ZERwY0tsbzRJUm05?=
 =?utf-8?B?RjNIRHpsSEx4VnJZeXdibGpqWFY4d1FHQ0tXL21oYVpvWFVxRG5nTWM2TkN4?=
 =?utf-8?B?NVZMUk1QSy9idEVGUDJXT0V4dWp6b3BmZWJIdy9kYU9IdmVDOHc1dmM5VDZt?=
 =?utf-8?B?L0hLOXZnOGpNRFh4QVZvL0lXZWQrWlBBRGdvVGVyK202d2ZMQ0FNT1I1SWFr?=
 =?utf-8?B?K1NnVldWdXVydkNwTEhXVkJodG5qaFBQNGFHZDN1SWVLQXczdXZTYytoSHJh?=
 =?utf-8?B?c1pGVnJWenVwQm1KUjBRcXR1bVR1SFRpQ241di8zTXhaMlF3YlV0VWVsaXlk?=
 =?utf-8?B?ZVVENEQ1dExrZVZxWUhDTVU3alhVRURLMGt1M1JNbTE0VmhKaUFnajhpa1Fa?=
 =?utf-8?B?Y2RSZTRGbjNRdzlDWmQyN3ZDcVkrQ1h0elpMVlJ0TG9sZGo2VEs5Y2tyMXdE?=
 =?utf-8?B?VStjWitjaktEVC9oNE1MRm1XdkRyYXNaS1lFWUlMZjN2T3BKU2NmMFpBTlJC?=
 =?utf-8?B?a3hDVTQxYjY1NmtMMXJFeHFGZExTRmMrcWViYUVoWG9xUHcvWGlrbHcxMHBQ?=
 =?utf-8?B?YmJRWFFWYTdnUUU0ZW1WMXhaeDY3Vi8vYTQ4bEc1TUxmR2o4RndTSXNNOUFC?=
 =?utf-8?B?ZmxXampidjdEUnZLZVErNmZEM2NtcTcrZ1MrLzVUZWpCaVdPZ2FxWEhvV0ZE?=
 =?utf-8?B?ZEd0OHJudjhFNlpMR252anVoRDg1cUl3VnpCZEd4OXY0OHlHdzE2Y2hWRlBj?=
 =?utf-8?B?cmZ1RVAwcFlnSWhYQzdNOGtmeHNEMFE0UmVrN0IwcUk3ZVpNcW1qSkFMNHM0?=
 =?utf-8?B?U0hYQ1l3NEtYK3dZYjVFNXNRc0dSU3l5d2ltZDJNV1hXa01HbHIySzBhTEM3?=
 =?utf-8?B?QjhuUXl5UUpBUmlBN3JFQkRnbStGY2ErUkp1NjkxSE5RMysyOXlkcjZMbEFx?=
 =?utf-8?B?OVAxKytwTEVuMituTWdzTGFmMytaaVUzL3BjODdndVJQQXJpNjRKRWVMNTJG?=
 =?utf-8?B?dFk2ZUlqcFlCQUNFWVFmVTRldDJ0c3lHQXVSc0RCYy9mZlp5R01waGpycGFQ?=
 =?utf-8?B?RDFySmZOOUM3V0JDd1FxanZYOVZwR3gwVzV0NlRyZFNkY2VtYWU4d2ZCWVZK?=
 =?utf-8?B?T3pUVm92SFROaDBkcEhwUmRmTjZoa1p1Qy9jMUozalk4VFJmK1QvSXduVVR3?=
 =?utf-8?B?WFdBenkxNGhpems0Y0FSbDFOQjRHSHRZNkNjcGJWekR1UHdmaDJ6NXZLUFNX?=
 =?utf-8?B?dDgrb2RRWW1IU0lDdzFUQnJSU3Z2VU5XVTF6L2VqeFFIbFVmcnBKQi9rVEgx?=
 =?utf-8?B?M1I3R2dLczg3TTliR2lDZmRNdFNseGIwUnlBTDh4aDFEZDFuMTVUVU9XV29w?=
 =?utf-8?B?b0d6Qkc0NzNGRmZpcHlGNVUvcDN3MS9BeS9jSnRsdVFuNlk5eUFLTkhHSnNv?=
 =?utf-8?B?T2JybXhPMEJHaksxcXV1amN0Q1lLMzZqYmZIaFpEd2hIbENvTWVQSklyV3Ez?=
 =?utf-8?B?NWl1d2krdStOdnViaVlWWlJzUm4yZUR3emVZZEtsWWs5eGJOYkN0ZmpIVkpl?=
 =?utf-8?B?MUhyRUQrTHpiS0dtYkhaQ0pvUUxIQlhFTmlCVnNmU1VyKy9OSnp0ajFzNVgr?=
 =?utf-8?B?eHZ0bVc2WjFvM2UySkNXWEZ6Um50aHJOMXFzR01yRlMvOEVjWFFwMXE0NGdi?=
 =?utf-8?B?d1F1R3Nsem83SHdzSk1RWFhLdU5NczhYU0pIbnJtSTREYlRKNkc3bSszWXdC?=
 =?utf-8?B?ckRoeEIyMFd2dkx5TmlqbUUzS0VaTEFxTVcyc2ZhR2djNi92eFJrZEp5REpP?=
 =?utf-8?B?M1Bsbkgvb1dVa2VoNnhKakRIdXh5NmZTSldsRGRiNFVKWGZhQUZydDc2V3ZO?=
 =?utf-8?B?c0gvVUtCejJFNVUxTkZvcHI1dlJYZUZrSDNVVllsWklJQkhDSDdOQnNQYWgr?=
 =?utf-8?B?anIzbElOSHV5NmE0QUlkS2d3REQyenA5andWUVNPL0xEN2l5Z0twTVo0QU83?=
 =?utf-8?B?NzJqSWNSSzRibnRDYVRjaWdDYzAwZUNoT0x3N3pLK0lnSEl0THhZOWlqc3la?=
 =?utf-8?B?U2pNc09aNVZHZkxuOHNmdld0T1NVYVEvbXh1Qk0xbTNTSURiN3o3bUlDTFcr?=
 =?utf-8?B?RHdHamNHd1RYWjFlN2pveE1hZWRrYlEydUVzM21Rc3ovanFqTkxVNkZXZ2Yv?=
 =?utf-8?Q?FUZXc9XTzRQhtiv/T0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 226789b3-86f5-4a84-ea83-08de888cc200
X-MS-Exchange-CrossTenant-AuthSource: LV9PR12MB9829.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 03:32:06.7595
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B7nYE9bBukFtcHRm8IPIyiYuXwBhNkt0n/vEgAJZKXC5sQfe5CNtzvGJfIvFffLx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4079
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_EQ_ADDR_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-56651-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bin.du@amd.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,gitlab.freedesktop.org:url,pages.freedesktop.org:url]
X-Rspamd-Queue-Id: 776B62EC38C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



>-----Original Message-----
>From: Patchwork Integration <patchwork@media-ci.org>
>Sent: Friday, March 20, 2026 8:15 PM
>To: Du, Bin <Bin.Du@amd.com>
>Subject: Re: [v10,0/7] Add AMD ISP4 driver
>
>Dear Du, Bin:
>
>Thanks for your patches! Unfortunately the Media CI robot detected some
>issues:
>
># Test static:test-smatch
>drivers/media/platform/amd/isp4/isp4_interface.c:462 isp4if_send_fw_cmd()
>warn: '&ele->list' not removed from list
>

Based on following code, I believe it's a false negative, by line 462, 
'ele' is either not added to the queue or has been removed by 
isp4if_rm_cmd_from_cmdq() called at line 453 or by 
isp4sd_fw_resp_cmd_done(). This appears to be a smatch limitation due to 
list operations being split across helper functions.

static int isp4if_send_fw_cmd()
{
...
err_dequeue_ele:
	/*
	 * Try to remove the command from the queue. If that fails, then it
	 * means the response thread is currently using the object, and we need
	 * to use the refcount to avoid a use-after-free by either side.
	 */
	if (ele && isp4if_rm_cmd_from_cmdq(ispif, seq_num, cmd_id))
		goto free_ele;

put_ele_ref:
	/* Don't free the command if we didn't put the last reference */
	if (ele && atomic_dec_return(&ele->refcnt))
		ele = NULL;

free_ele:
	kfree(ele); // smatch gives warning, '&ele->list' not removed from list

}

># Test checkpatch:./0003-media-platform-amd-Add-isp4-fw-and-hw-
>interface.patch checkpatch
>WARNING: Prefer kmalloc_obj over kmalloc with sizeof
>#522: FILE: drivers/media/platform/amd/isp4/isp4_interface.c:129:
>+mem_info = kmalloc(sizeof(*mem_info), GFP_KERNEL);
>
>WARNING: Prefer kmalloc_obj over kmalloc with sizeof
>#764: FILE: drivers/media/platform/amd/isp4/isp4_interface.c:371:
>+ele = kmalloc(sizeof(*ele), GFP_KERNEL);
>
>WARNING: Prefer kmalloc_obj over kmalloc with sizeof
>#1131: FILE: drivers/media/platform/amd/isp4/isp4_interface.c:738:
>+node = kmalloc(sizeof(*node), GFP_KERNEL);
>
>total: 0 errors, 3 warnings, 0 checks, 1305 lines checked
>
>

The kmalloc_obj function was introduced in version 7.0-rc1. However, 
since our ISP driver is required to operate under both the 6.x and 7.0 
kernel versions, it is appropriate to utilize the kmalloc function.

>
>Please fix your series, and upload a new version. If you have a patchwork
>account, do not forget to mark the current series as Superseded.
>
>For more details, check the full report at:
>https://linux-media.pages.freedesktop.org/-/users/patchwork/-
>/jobs/95723459/artifacts/report.htm .
>
>
>
>Best regards, and Happy Hacking!
>Media CI robot on behalf of the linux-media community.
>
>---
>Check the latest rules for contributing your patches at:
>https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html
>
>If you believe that the CI is wrong, kindly open an issue at
>https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-all to this
>message.

Regards,
Bin

