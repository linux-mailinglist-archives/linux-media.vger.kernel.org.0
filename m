Return-Path: <linux-media+bounces-58760-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +EnUApKI3mlXFgAAu9opvQ
	(envelope-from <linux-media+bounces-58760-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 20:33:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 210503FDB64
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 20:33:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4D1D7304FFB2
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 18:30:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9F9831E82B;
	Tue, 14 Apr 2026 18:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="UWCsSPKR"
X-Original-To: linux-media@vger.kernel.org
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010058.outbound.protection.outlook.com [52.101.46.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCD62253EC
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 18:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776191421; cv=fail; b=ZQwaEApu8hvt4Hf96tPhYYEktc3+B4aLekovZ6wgFxvKjFurHbzp0d2P61rh31jmqi8tu+VPOOewnbJl0ZkpoRUKA9x3n/GROKVfLzAdhhXSr8VbMqdYt/hV1HWh20SS7Xuyqv9jgv+aWIMuwlAlQ523+DMye5f+h/7zZkqJfLY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776191421; c=relaxed/simple;
	bh=cvDDZ7javX8BJ9HRmmXgAhO1Qf0ant2wC5O5Hibrq8A=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PcGTCDgHE9X40RgEL+S3HHvtJQyDkyX9nQRRu8sBY9vyQexgM+gIm06lGV9yV19sl2XTntvC73alt0eJExS3ZFDvB0H8IIJj/m0I44kxfxBWDfJnAp4uQ8D1S+YPXGzB6aM2C/3gdcsnPD99NG+LGmJk3ElwMsK3zfEbLw1CPF8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=UWCsSPKR; arc=fail smtp.client-ip=52.101.46.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xxcAWgCMHrvmfzdni3kFNDbCBXjw52Lq0rmWkjp9Aj+85R7wlNE4UPHzuX58Ppr28WVq+CCd7YoTGpxFlurWJkNzR5CnhhIooNI1ksF/l3HTANpRVrQozjx/VTEslLqJEtzMiWKv+Ca1C3yWcShtX9PHKuKf6Meo5phBOp9ZxlPPiZhkiDs6pdzLQ3V18IgjtlsDW6wskvC+i+TBIbfMDBg7b18kUy5eMn23Dy7/G3sRtZMF3ivJ6JkrWDDbNJjb48L/NjHAUdPjoRWRIiPe8nsGUFwDttvD8uC2Yk0r0XqjCCUgGorhA1XGciONOreeMZpHxj1W4nahhaYSIhZ0Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wbesk+Ud5QnC8io+WkRXGb6kAfJ4tMgQ3rZwQ0eR2jo=;
 b=CRoZTdPzB7VUdFv2+TN0rbycRSDH9O4yyFtgkTMo3CmvVd4nBHobFxq4yN45xLcKOkeDMNT+I5zTQKU5KYYco9begAVQRFH8hbszEQ86LYljz/wCSIBPLshUbPayZBJzQCfdYQwWa4Q4JsY40xCzHIzuN9YiwiaORtv48kEdmIE7c2XYnJ8HvSEONZ5bPvMxmODnjrOdp3bhS/+yYbPe80ijcdkYWTHlrKdzH2jK8d2fs7lXDdBu3JmvVTGz1LCVYSIoVIb6W8gqv+nqypTeskAOgK4NCOMgJ6NaGmHylsN5FRnhQCZ4GZK7G3jKaxXvSlswtMoydOJLrQole8p/dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wbesk+Ud5QnC8io+WkRXGb6kAfJ4tMgQ3rZwQ0eR2jo=;
 b=UWCsSPKRiy3majNj9UrGD6wRDBg8JtyMTKyslA4Z+UA6lsam5rIn4xY8bucLVeRCXFHzIW5riguW6Zgeo81t+dSJTu8mUDCJY8lDJFRHKnqOArFiUVQ2OPe10R6H1nT+WV2Mg43wht2ol3sW63ewf4ECEJGD2/mXcJ//Gfkvc08=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ1PR12MB6195.namprd12.prod.outlook.com (2603:10b6:a03:457::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.21; Tue, 14 Apr
 2026 18:30:17 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9818.017; Tue, 14 Apr 2026
 18:30:17 +0000
Message-ID: <650e835e-b60d-44fd-b212-47f8a9d18c15@amd.com>
Date: Tue, 14 Apr 2026 20:30:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dma-fence: Fix potential tracepoint null pointer
 dereferences
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Philipp Stanner <phasta@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20260414154928.32934-1-tvrtko.ursulin@igalia.com>
 <20260414154928.32934-2-tvrtko.ursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260414154928.32934-2-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0181.namprd13.prod.outlook.com
 (2603:10b6:208:2be::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ1PR12MB6195:EE_
X-MS-Office365-Filtering-Correlation-Id: 24ae0b5a-e50d-4d4e-65d6-08de9a53e0a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	xrpzmt4E2ZYcxjPGTUiS2yitu0y5sMp9LJsSr+UYQ9+71hhpq9Zwkl5m5gbSioUcqDqt+3WUsY4JoTC5VePgxR4yTzE/ciK01Fcr4glaBaN8ZY0MTNVtLMloXvf9RNjHcyu45ywzFvbW0ITWdMgNbMMg1GbaQ/K4xXOrvjCF/n6esUaJMQMbmHsXkKM1DSd2LAKdmO10Ubxk5A4sfY8fqWpbiw0PeAGU2LkzddoHPGxxOME6rDmovrxxd1jH0yz2I35t67NO/+h07NKhVFdXmDTzmLo3RH9hPyHE5ncHPT6xsmpeYfbdf7JCwelzVI0DKsFByyrJRS8pFrLRLn8Hdip3lF00/xs3zRJ1JXgIrS9nIYWHU0GMX4+4MVh1Wm6smxkG/E+W5O8zXYf3xYot9q0sOjgLb8sMIqcLkq1gKeUXEQNEc8xaLRclAM1v9zJMFvNn2hEmz2uYKQ/p3JVtoZECZmWveJgt2/lo7nc2FOJm/3m8vOIOFQILo2I6zNadZg61Z5aqzOfqEMQBcwrwemMyZThfnedhy34Vwk5RGUAdKd+oNBCYmsYU/oC5g0AyyFNNtpEyj7lt9rASUSicV6B45wOjWUL3QCWbBUaWpVF7WzHw/f6sUyPPHnXVXfJCAWlQx55VuC1ShQA9Hv5mZ/H+uqOe/3gWfRDEFfZlD3kx1gkDBjpYvw5PM7aC3T9I+QL+04ecXhGiFoKuy8knAHOBKYmAdAFqiHJsyu893HM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?US9DSktET3V1TWpZb295UlpoSmthV2poaFNuVUliQkdKczhzYWJwT29GY0tz?=
 =?utf-8?B?TVVQbEZqbUp1UCtteXNDT0JCdEIybm1Ob3EyZzd4WmZPM0VNUktXczI1TW5N?=
 =?utf-8?B?V1Fock1kblNSZzNiZFZhbDRwenBHYkQ2QXRvek1HR2RPZU5BaWJQZ295N1RV?=
 =?utf-8?B?S1RpWWorQzZhcFZ3STBSU2JHWVI5Z0ZwUlBXemQzVzV3NU0rQnA3WWhCZTFo?=
 =?utf-8?B?cTdzYlh0d1kzQmpjZEVvZG9JSGRuVXRyK290cXU0dGYyYnFHSW5ydGdYNFhz?=
 =?utf-8?B?MktFZ0t6bms2UldPY0VjYXhLTTVSdXB6cTR0aVFTbzljdFVRNCtGdmk1WW1s?=
 =?utf-8?B?SkpiclFDSE44VTFPcWd2ZmVZaTZzWENNNSs1K2J4Y0doZ3Z1TkhwZFNKaWth?=
 =?utf-8?B?TythMS9sRnNqZVU1YnhWYzhYMk1PeGtvbEpJZU0zQzd2WHZyTkZoRHJ0aEpy?=
 =?utf-8?B?dlB5S0F2dldLb3ZzOEJORTJCeFN5ZTlSa3hYU0pIN3JyZ21jMGk2bUErZzRn?=
 =?utf-8?B?SWhLM2NaQkdkbFQyUEpXWkpVdlJYaTcrSlpSam43K1FsMnZ3V0pUSzVwOFY1?=
 =?utf-8?B?ZE1vbnFRTlBQVXN6aUtRNllRVG5FVVVxK2EvdndXVlhqNDZ3c0lMV056a2w1?=
 =?utf-8?B?VTFLc2JCamRXVWFPMDk4UWw4SmtQRnhua1NqU1VzcThydzhTaFFIZlM4TnNG?=
 =?utf-8?B?M0FmSTIySDlUcGUwMVFIZUlqT29VWGlNYkdGY3Ivcm9kMDVGTmVJbGNjTXRH?=
 =?utf-8?B?d214N3FILzVSQ0ZjVUZGMHVaMFRLN2U2aEtPRXdHUTl0SFRpY1N6MXhyZVVL?=
 =?utf-8?B?eWY4MmJyUVZ0QVljUFNnZ0YwN3JyWEFRTW1LT3RaUVdDaG84SWFWdXYwOGl5?=
 =?utf-8?B?MFRmNW9RbmsxQ3Zxd2wwUUFxdFRsTlVDWmx0Wkhac3gwZkVveHMzNHAwSkIx?=
 =?utf-8?B?b3NXRW5OSXpmTGVnSXNGU1pjQ2FldG1Fa1VNR2lETllQRkJxem41eHVDUFQv?=
 =?utf-8?B?aFI0NUFpSFVaQkZSOU5YUHpSeVpFWDRKd0IyVmlNaFRHb25wU1VTMm1OSDBr?=
 =?utf-8?B?NG1yUmI1dGk2clg0VWo0bWhvZ2VmYkNPd1VYLyswT3NkVGc5TFlidTQ5ejhU?=
 =?utf-8?B?d1JpZERvQk5mTDRoL293eDlJNVB0TUZidVcrZDhkcmdqUDhBbjhNUHRzL29L?=
 =?utf-8?B?MGV1YWM5dWFpc0htZHovNTBOYVJEMkdKakh1MWtnMDNmazNQSVdUY1Q2b3BG?=
 =?utf-8?B?WjRnV25YMEs3WnI2bnlnZFc3ZHdZc3lhUzBwRTNJWUU0b0tZSHYrQ1lDWkZT?=
 =?utf-8?B?em9PWiswYnZ0Q1hiZEVIN2pZTi9idDl1QlRoTXhwRHBPVkZydG40MHdKWWs5?=
 =?utf-8?B?cWJsVUdoVGRoRElRYllmaVZOODlGbG1haVY3cVJMandDbFZyV2Fsa3pRc0Vx?=
 =?utf-8?B?OFlJQXFiNFlmWWR5RXV1bE8xSmZYOUxqQ3l0MllqOVlMMVJQdzVkUVJHNEZK?=
 =?utf-8?B?S0pNblplbzFKOXFCOS9rMnFaclM0ejhQMjZDaEc4am8yZzFoeld1dEVpbWxy?=
 =?utf-8?B?bG1XZEN3bUdZNGlFeTlGdGRqL0VVNnpwTVVHSHh4bG1TZzU1R1JqMjczMEFY?=
 =?utf-8?B?aHF3R204WHZ3UlQyS2I2bHJYV01PTllmczFtLytBWUtSOUNNSEZaRC9GaUlu?=
 =?utf-8?B?aSt6Q2tIUlVCVUJmTlhDai9LL281azVwc25Sb045VWljdzE0aEkrS013bnI1?=
 =?utf-8?B?Z01QTWtJSE8vUnZadGVsVm8vS2Jmdmt4U2RraGRJMWVLMGpMYnJYVnZXN1lt?=
 =?utf-8?B?L1U4TXNsSHRDRHdaVm5aUytkYzVxSnZxQmtDVXNBQkxnTTJNTUw3NXBKVEts?=
 =?utf-8?B?S3FOUVFqK3NwOXB5OEpKNjVMN0kwc2I4OVNFV091dmJSRVhhTVlPY2NvajhV?=
 =?utf-8?B?SjhZNnRRL0EzTGI3bFh0eUJCMVcrcFJzZFFjQ3Rhc0puUCsvMzIyazM3OTVC?=
 =?utf-8?B?RzVyYWNYSkU0MEo3Q2Vnd3pPTFJlQUNrUEZUb2ZzUjZCdFZjc3AzclQ4RVlj?=
 =?utf-8?B?RXN2VkN1cUJ5bm1YWUIwOWZoTy9TcDd6QzF3Rk5BVHV5Z0tzZUZScTBCMEh6?=
 =?utf-8?B?NGRIemgrU29nODEzdHZibkp2N25kY1IrbnhxOVY0QWVTUG9FcDJjakNGSXBE?=
 =?utf-8?B?R2tZbUlOTHQyR0JsYkVVL0xzY0VnWHBleW9qS2t2L2lZNFZoNXVWNkZtVGEy?=
 =?utf-8?B?alJqYVlhMmtta25Wek1YZFpCMUxWakRhN3l3Z29naHl4cGgvRlA4WWpENmhh?=
 =?utf-8?Q?9jd2tW+bPBJisSAnN6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24ae0b5a-e50d-4d4e-65d6-08de9a53e0a1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 18:30:17.6561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pv1+btBJ6lB4VCj6zORGT/t/GCz2VpGEFRfHPuhQwwePK7+f8BOK4oeNbAyoWRoP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6195
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-58760-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[amd.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[igalia.com:email,amd.com:email,amd.com:dkim,amd.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email,collabora.com:email]
X-Rspamd-Queue-Id: 210503FDB64
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/14/26 17:49, Tvrtko Ursulin wrote:
> Trace_dma_fence_signaled, trace_dma_fence_wait_end and
> trace_dma_fence_destroy can all currently dereference a null fence->ops
> pointer after it has been reset on fence signalling.
> 
> Lets use the safe string getters for most tracepoints to avoid this class
> of a problem, while for the signal tracepoint we move it to before ops are
> cleared to avoid losing the driver and timeline name information. Apart
> from moving it we also need to add a new tracepoint class to bypass the
> safe name getters since the signaled bit is already set.
> 
> For dma_fence_init we also need to use the new tracepoint class since the
> rcu read lock is not held there, and we can do the same for the enable
> signaling since there we are certain the fence cannot be signaled while
> we are holding the lock and have even validated the fence->ops.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Fixes: 541c8f2468b9 ("dma-buf: detach fence ops on signal v3")
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Philipp Stanner <phasta@kernel.org>
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> ---
>  drivers/dma-buf/dma-fence.c      |  3 ++-
>  include/trace/events/dma_fence.h | 33 ++++++++++++++++++++++++++++----
>  2 files changed, 31 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index a2aa82f4eedd..b3bfa6943a8e 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -363,6 +363,8 @@ void dma_fence_signal_timestamp_locked(struct dma_fence *fence,
>  				      &fence->flags)))
>  		return;
>  
> +	trace_dma_fence_signaled(fence);
> +
>  	/*
>  	 * When neither a release nor a wait operation is specified set the ops
>  	 * pointer to NULL to allow the fence structure to become independent
> @@ -377,7 +379,6 @@ void dma_fence_signal_timestamp_locked(struct dma_fence *fence,
>  
>  	fence->timestamp = timestamp;
>  	set_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT, &fence->flags);
> -	trace_dma_fence_signaled(fence);

I think this part here should be a separate patch.

>  
>  	list_for_each_entry_safe(cur, tmp, &cb_list, node) {
>  		INIT_LIST_HEAD(&cur->node);
> diff --git a/include/trace/events/dma_fence.h b/include/trace/events/dma_fence.h
> index 3abba45c0601..9e0cb9ce2388 100644
> --- a/include/trace/events/dma_fence.h
> +++ b/include/trace/events/dma_fence.h
> @@ -9,12 +9,37 @@
>  
>  struct dma_fence;
>  
> +DECLARE_EVENT_CLASS(dma_fence,
> +
> +	TP_PROTO(struct dma_fence *fence),
> +
> +	TP_ARGS(fence),
> +
> +	TP_STRUCT__entry(
> +		__string(driver, dma_fence_driver_name(fence))
> +		__string(timeline, dma_fence_timeline_name(fence))
> +		__field(unsigned int, context)
> +		__field(unsigned int, seqno)
> +	),
> +
> +	TP_fast_assign(
> +		__assign_str(driver);
> +		__assign_str(timeline);
> +		__entry->context = fence->context;
> +		__entry->seqno = fence->seqno;
> +	),
> +
> +	TP_printk("driver=%s timeline=%s context=%u seqno=%u",
> +		  __get_str(driver), __get_str(timeline), __entry->context,
> +		  __entry->seqno)
> +);
> +

Mhm, I'm strongly in favor to just use this approach for all trace points.

The minimal extra overhead shouldn't really matter at all.

Regards,
Christian. 

>  /*
>   * Safe only for call sites which are guaranteed to not race with fence
>   * signaling,holding the fence->lock and having checked for not signaled, or the
>   * signaling path itself.
>   */
> -DECLARE_EVENT_CLASS(dma_fence,
> +DECLARE_EVENT_CLASS(dma_fence_ops,
>  
>  	TP_PROTO(struct dma_fence *fence),
>  
> @@ -46,7 +71,7 @@ DEFINE_EVENT(dma_fence, dma_fence_emit,
>  	TP_ARGS(fence)
>  );
>  
> -DEFINE_EVENT(dma_fence, dma_fence_init,
> +DEFINE_EVENT(dma_fence_ops, dma_fence_init,
>  
>  	TP_PROTO(struct dma_fence *fence),
>  
> @@ -60,14 +85,14 @@ DEFINE_EVENT(dma_fence, dma_fence_destroy,
>  	TP_ARGS(fence)
>  );
>  
> -DEFINE_EVENT(dma_fence, dma_fence_enable_signal,
> +DEFINE_EVENT(dma_fence_ops, dma_fence_enable_signal,
>  
>  	TP_PROTO(struct dma_fence *fence),
>  
>  	TP_ARGS(fence)
>  );
>  
> -DEFINE_EVENT(dma_fence, dma_fence_signaled,
> +DEFINE_EVENT(dma_fence_ops, dma_fence_signaled,
>  
>  	TP_PROTO(struct dma_fence *fence),
>  


