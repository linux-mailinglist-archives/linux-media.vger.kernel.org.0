Return-Path: <linux-media+bounces-62209-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kP8rOj5eDWpuwgUAu9opvQ
	(envelope-from <linux-media+bounces-62209-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 09:09:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 539F2588B2D
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 09:09:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2E91A30B6253
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 07:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80C1734250D;
	Wed, 20 May 2026 07:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Jrf6VkZc"
X-Original-To: linux-media@vger.kernel.org
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011016.outbound.protection.outlook.com [52.101.57.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B63236604B;
	Wed, 20 May 2026 07:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779260758; cv=fail; b=YG/MhUbBzOaCfIobv2PVj02vNixCuNeKZ4p0GOWMJS53jRoLoI1AB6FHZ8LJiOeeqOP/sGvpA4rtuh4wZ+vdC0pwZ2Aso8/AtNZz47cjXU2XvSt740ACgwGfvBdGAQ5MZknKAKdRrat4UH5zuWHBGsw77CarrfCf9E50hVX+6oM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779260758; c=relaxed/simple;
	bh=wQtexVcnPpH40yDR8V9jQZU9wqVbUYlsR2FXw3yxkTI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=C27qtmfRCueSkYq6EBYrP/xUr2gpYHO42lUoZrM6EELNpsNYUCGXSh0/c7peHppZjSfNqhwmYZBUzpvOklsY/WevnZl8DAgIyXo/LKekavdAcPJBMgysq6cQ0p0PjhYGG5/I9gDscEe2w5nzOlpLcBxM8lkqwnlra9y+M/4SJKM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Jrf6VkZc; arc=fail smtp.client-ip=52.101.57.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k7ZQzDGKqCbqtAT3ALpKj0kch3jHKyVghb6v2PEnMZEMG4cYqEJjOQDR1edEr3NmPk9ie9XayzLW4zeEfqj/+BC7Tc3XgwyltKseqeCuXivhpLfydUoKXD4f1wQm/h+jsd5LSiz81x/RcILGsBDFxtK1RYb3jEsNokPBnFuVMKvdRasKYl0N4daEOzcRfmXaR8TvwOR3qfskRISgfaSPGAb0GHZV1cT0Xevbkcy18QLZe/oQ2MNppxfDgFZo0G+KOkWJ/eha6VGVhsMDFLtU0vzUK4J3Jm4S/2sPVHbXBS2+pPsBDuWIjzNnKoulaiZvisuLp34Ju3FfKAbrhZGEdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KF74rf0vudxEU7djBAMlucGnT96Vba+Q8vZdd5leGdg=;
 b=kNbTIC3lKQo/kiN+GYuuLWsRGoLe08/4etz2EyIGXr3CsuetsNmdrIg0uZB9zjY+n2YqFIJG0FlLXXc/Zk4pWRmJ38bqZd0MfRENb0L4xquX9tT9K1gWJSE2CPI91tMqeGZvMaf8hWz5ByQ8FU8/z6D8os4ghnPZozWCTAryk9msL1dfnAz3Qk5hzlQCjYe0XQU0fcvulkxasEh5Kng0V/QO1T6mtSQzJwLu0GFe42B3IQIO4CBpQeqCS0LT+iMg0rS6D5BCLrGEe3WfiBRdAsJFC4mC+gL6+LjRd+H7o5F8n5IIc6wKfKeud05uHa3lWTrHjf9RpeGfF3gWXClqLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KF74rf0vudxEU7djBAMlucGnT96Vba+Q8vZdd5leGdg=;
 b=Jrf6VkZczTye+v6a5OoLIxK1UmpDvge+4wiHcqZuDWSzwdL6vt8p4s/nAgBtSgeSLW7ZbxSQjtxaLPC0Knc/Iv+wtOfww3Bs8Q5JdHtgeFdlD9xl6D15H8AuFav9PE8kTld0SgdBqn0A01x8bYxluXSTG/WMDhP2FLCfBPjq0fY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW4PR12MB5603.namprd12.prod.outlook.com (2603:10b6:303:16a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 07:05:13 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0025.022; Wed, 20 May 2026
 07:05:12 +0000
Message-ID: <a0f2cfd5-d4df-4e50-a52b-d5befbc2e481@amd.com>
Date: Wed, 20 May 2026 09:05:03 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/virtio: use uninterruptible resv lock for plane
 updates
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Deepanshu Kartikey <kartikey406@gmail.com>, airlied@redhat.com,
 kraxel@redhat.com, gurchetansingh@chromium.org, olvaffe@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 simona@ffwll.ch, sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org,
 syzbot+72bd3dd3a5d5f39a0271@syzkaller.appspotmail.com, stable@vger.kernel.org
References: <20260519082247.34470-1-kartikey406@gmail.com>
 <2e23513c-9d59-4891-acfe-9f1fbcbce778@amd.com>
 <f6bcef23-5510-4aad-bf6a-4e1ecfc8d474@collabora.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <f6bcef23-5510-4aad-bf6a-4e1ecfc8d474@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0135.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW4PR12MB5603:EE_
X-MS-Office365-Filtering-Correlation-Id: bf816e99-9a5c-4c4b-a78b-08deb63e22a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|366016|921020|22082099003|18002099003|56012099003|11063799006|3023799007|4143699003;
X-Microsoft-Antispam-Message-Info:
	tIcb0Gu1V3bF5FjmDurbYpcg/LJELZjVWGH29JPOR7iOJ33584sODuaXTSrYl2U+2yN+WYHV+pJSzs4vVtI1cNqc6Tgql0t/BtO3NHGVCwGWwsRA2iuKlUqQr+pG5IsnUi7hERv9xzXmnijRGGPNrZZr4jiOE+0HQMjIpiIF203v2MRHdvgpGBgxbYT3ygGQSbR5eHGBvAgYOld3s/CrMzCzryCNhLQ5GglzuT6BGIVSW1keXCWeced4RPqkq2RyINi+16bHBiEFTWtf9/SidgDpIaLljsxS3lCCsbnfQisuRrfBMm5kwCC3TwplII/wVryw3kYWl7tdLMeaz6XItzESsYcaJu1QFdcAlQJeg9k/789DKUq1XmNCi9MEetQd8oxeRMbzCvhkpEOkzrjm8j7/BBy4/oiSjcnlLQ2W8zbb6Phw7NmROEsCEnnMWESt+r3IxtN3YKInc5vnIxUbjkyQQOIOrvEmLHRdqS/COFGPjBDuOhnj26jKAUYuYeIazHj85gTwH6XgfdlorzaoIIdrJpBP/B6WZzPMAOz6WR8CQLgyKEIilU4H/Y9/OUjoTSrQJdJtXCJyVyzY8NLQKQFySslrNS197oMjjzUSfb+1LBcNUXq+mbXrS8WwTWYLzU1MmJFDevKCezmJa9D2IfZxZlAJGvFKLGzGOZ73LlZBp445XKI9fJjmPfDiWyOhfbpDC7ODPZgw4zh40FULfBLr7LsBtmgT8jh4MfXZMWA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(921020)(22082099003)(18002099003)(56012099003)(11063799006)(3023799007)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MHlQbHNUcEZiajNubTJsT1NGeUhpdVdFMHhCSEVLbG02YzAzVmN6TlJ3SG5V?=
 =?utf-8?B?MVIvdXVpL2NCNXpsNTVpUFA4aHptYUZRQVlCRTdXQUowblkzZktNZ1RsQWxM?=
 =?utf-8?B?bjNZckpqOXRBUjkrWFBrRW1OTGRhalBpbUMxZUlaTG9ibHM3T21iVnFXK0xj?=
 =?utf-8?B?LzJMMEVnZ09UdFpGdkNYRms1MU10M0s1MVJUU1kzaGU4QWJYVWpIdVB3WmdR?=
 =?utf-8?B?eERHaHFDd21XYi9sTFB1YTJEQnovcG1LMEVURzIwMGp4UjFaRjZLNFhqeG1Z?=
 =?utf-8?B?eDVQSDdOV29XdDRXRENaaDkwVGJST1RrVWRXZ0l1ZGUwaWpnNTVMa2MzVlF3?=
 =?utf-8?B?TnlGdDdWamVieFFLRVgwSTAyNk5oV3ZLL0plUHY5eFUzeFRhd0RCUHBvZkM0?=
 =?utf-8?B?dk5vUlAzQ0lteDZnS0JkaVJqVHlhZHdBSVVEdFhyV040OEVaYW9qakJ2VW9j?=
 =?utf-8?B?T2dwSjQ0ZGZyNEV2cWhMZFhqbXpJM0w2STZ6Zm8wTTh6TEdOb2U2dU42MFNz?=
 =?utf-8?B?T1BKdEFhS3BWZitxZ0ppKy9IY1BJT1lPbXBFYktPZnJOTWdmN25SdnJ4dk9H?=
 =?utf-8?B?bkNSKzdyZFdVaTlBY2h5REVna3ZPd2gra0VjeG1SY0dURG1Vem5JSjZnb0dH?=
 =?utf-8?B?NUswa0pvQVA3YkpXdDJ0Nm1KanAweTByZFJ3OUZLVitBQzNFai91RGk0L0Zl?=
 =?utf-8?B?UHBpSUxrRitlQ2FnVTY0ZUpPVkUrNWR5bXY3UXRNMHVUMUN3aS9IaWppTTcx?=
 =?utf-8?B?aUttYjdVWUNiOVlBUmpjYlNrUHh4MVNoOW44czRoKy9KK0NYMDlKd0ZLSkZN?=
 =?utf-8?B?ZDBNQ0NXNUpNdWV6bFhpcjFKVnNwb2o4QmlIQzZmOFVHYkJSaElGMnZnL3dW?=
 =?utf-8?B?a1ZyeWk1dmQ2THhjbXNnemxzMm9hMUpMVFZ0Qy9xa1BpbWRlN000dk03cnVj?=
 =?utf-8?B?SWZ0ajlIaHBkQ1A2QzlGQVdJTFdsU0dlWEl3TkdwMU1NOG53VzBob29CWGc1?=
 =?utf-8?B?QUtncitsNHMzK3Q3OWFJb0dJb2l5M2djNjZLYTIyTHZOZWN6bUVHYkNUeFFv?=
 =?utf-8?B?SlpSQjFMSVg0QnRCQWkvaTZuNHV1NExqSXBKODRrOGwrME5zL3Z0bVl2em9h?=
 =?utf-8?B?aHh2bi9GcHV4QWtQTnBCNWtycWxFQnJrUFczUGpnUWFNMjF5aEZ0bkpXbm56?=
 =?utf-8?B?aE15ZURjb1hQaWd0c2Z4clRUektOOERjZFRZSmk0OWpTMjRrSGNYUmlpZEtr?=
 =?utf-8?B?QlNtVGIrNjlTMk5nVmdTdHlHZkRSTksrOU1MSG4zRm5rNm1JdENnZGlZQVIy?=
 =?utf-8?B?RTl5Z2JQdElraVJ5anFPNXFjMGpUSlpxQmhNY09EN3hZR3BJUlpmM1lsR3pv?=
 =?utf-8?B?bHoycW8wQ0o0TFJCS1grL2syOUdZazdBQmRTdXl2RFFxc1lvSmZKeFgwNm54?=
 =?utf-8?B?VVplL3B6T2Q4Qm1jd0p6R0ttZ2F0blhXMm9Gc3BGWGFyUytIMGRGeG80UmQx?=
 =?utf-8?B?cVo2S0JNbjhGeWl0OTJCSDB4WGhVOW95WjMxWnMwMFNzU1A3VnF4QzBaU2Er?=
 =?utf-8?B?akd5b1llRzAzZTZPTlhIN0wvNUpheHAxYnpHQ0JHQzVVZHFnNXFaRitiUEVq?=
 =?utf-8?B?NVpSd2dFVDRnVzVaSWMwOUVCNkFkZUpoclN0T3ZEWDJEU2pQbmU4dllDUmpN?=
 =?utf-8?B?QjBnR1RseHpIZVR0OEMxNVV2YmJNaU1obndtcW9INDU1VExZMDdyVGVnSmM2?=
 =?utf-8?B?dFphZ2pEYk1XLzA2MDVNbjQ0ME1zU1VEZGJaajNKOGdadlpDVkNhK3ovWURN?=
 =?utf-8?B?amZja0E4aElaSFNzWFdqWHBJWXEwbXFvVytqY3oxMXBuZ0padGlqOUdSZ3JB?=
 =?utf-8?B?blJnYjBjV3pSVkl3Wk51andCY3pZWlE1Nk0wbkNlUzF3SWZURTlYTDQ3dHBl?=
 =?utf-8?B?OTFMOS9CR1F5Nis0eXZZaUU1WWtDRXZKY0JFQlRwSG03a01KWHRkVHZ5MGlY?=
 =?utf-8?B?R3JySjZRU0FYeGlMc2xTNC8vVitsY3dwcFZ5Z25naWhyejhHTzhTUW5rd1pE?=
 =?utf-8?B?YXZFSVk2LzVTQXV3MmRhZFVXT01mMlYxYzZMTWRhUkdWRWZLY0Jqd2VpbnVF?=
 =?utf-8?B?NldCbFNxNlZXQTA3YTVTUFpabkp2c0JrQkxjWDdlUStFVUVIRlFyVm54YUJv?=
 =?utf-8?B?SFpGUEFHZHRjVnJWak1VVHp5Rlh2S05GSE9sanhOdGdqZDVKY3RnY3FxVFdr?=
 =?utf-8?B?ZWpLbGZiTlVMOXc2bDAzSElFQjBpUC9ZL21CaHVJNXE4L3ZtSWROdVpUOGk1?=
 =?utf-8?Q?0Lj1PQ+skOgi6EaxPg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf816e99-9a5c-4c4b-a78b-08deb63e22a8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 07:05:12.0750
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: elxi1F7PVDjnXxgNip9eysKtODo3NvSXdlsXWi9KonSXanMKHFxLX7NQH8Fs4u89
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5603
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62209-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[collabora.com,gmail.com,redhat.com,chromium.org,linux.intel.com,kernel.org,suse.de,ffwll.ch,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	URIBL_MULTI_FAIL(0.00)[amd.com:server fail,sea.lore.kernel.org:server fail];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,72bd3dd3a5d5f39a0271];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: 539F2588B2D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/20/26 08:50, Dmitry Osipenko wrote:
> On 5/19/26 11:27, Christian König wrote:
>> On 5/19/26 10:22, Deepanshu Kartikey wrote:
>>> virtio_gpu_cursor_plane_update() and virtio_gpu_resource_flush() lock
>>> the framebuffer BO's dma_resv via virtio_gpu_array_lock_resv() and
>>> ignore its return value. The function can fail with -EINTR from
>>> dma_resv_lock_interruptible() (signal during lock wait) or with
>>> -ENOMEM from dma_resv_reserve_fences() (fence slot allocation),
>>> leaving the resv lock not held. The queue path then walks the object
>>> array and calls dma_resv_add_fence(), which requires the lock held;
>>> with lockdep enabled this trips dma_resv_assert_held():
>>>
>>>   WARNING: drivers/dma-buf/dma-resv.c:296 at dma_resv_add_fence+0x71e/0x840
>>>   Call Trace:
>>>    virtio_gpu_array_add_fence
>>>    virtio_gpu_queue_ctrl_sgs
>>>    virtio_gpu_queue_fenced_ctrl_buffer
>>>    virtio_gpu_cursor_plane_update
>>>    drm_atomic_helper_commit_planes
>>>    drm_atomic_helper_commit_tail
>>>    commit_tail
>>>    drm_atomic_helper_commit
>>>    drm_atomic_commit
>>>    drm_atomic_helper_update_plane
>>>    __setplane_atomic
>>>    drm_mode_cursor_universal
>>>    drm_mode_cursor_common
>>>    drm_mode_cursor_ioctl
>>>    drm_ioctl
>>>    __x64_sys_ioctl
>>>
>>> Beyond the WARN, mutating the dma_resv fence list without the lock
>>> races with concurrent readers/writers and can corrupt the list.
>>
>> Well why are you trying to add a fence on an atomic mode set in the first place?
>>
>> That is usually an illegal operation here.
> That is pre-existing in the driver. It performs draw operation and in
> some cases waits for the completion during atomic. Whether all that
> syncing is correct is hard to say immediately as some of it may be
> historical edge cases.

I'm not not so deeply in the atomic mode setting stuff but it strongly sounds like that this is seriously broken.

The background is that the atomic mode set framework allows an output dma_fence which is signaled when the commit is finished.

So when you allocate a fence slot and add a new fence to finish the atomic commit it is trivially possible that this cycles back and waits for the atomic commit to finish. In other words you have a deadlock.

You probably need specially crafted userspace with the right timing to trigger that, but such issues are usually a rather big no-no and need to be fixed in the long term.

Try to add dma_fence_begin_signaling() and dma_fence_end_signaling() annotation and enable lockdep, the tool should be able to point out if and what exactly goes wrong.

The usual fix is to prepare everything before commit_tail is called (alloc memory, create, reserve slot, add dma_fence etc....) and then just send out the prepared commands later on.

Regards,
Christian.

