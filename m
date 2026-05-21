Return-Path: <linux-media+bounces-62466-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wIRbD+D8DmoSDwYAu9opvQ
	(envelope-from <linux-media+bounces-62466-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 14:38:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4945A4F03
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 14:38:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4C8F9315135B
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 12:30:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC95D3CE0A2;
	Thu, 21 May 2026 12:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="hPs+LI9t"
X-Original-To: linux-media@vger.kernel.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011000.outbound.protection.outlook.com [40.93.194.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783473D4107;
	Thu, 21 May 2026 12:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779366636; cv=fail; b=qXqziADhbEz65sAUBJblQw9P7qL5JcuxI/DMDOR0ZTcVULtfy3MTPttxn8TJdx2TMMMVnVpHe8lp6ho3OOrqRLW+wEDH6wUA1LtfzAgqb66c2mJ0mp3Q5+5Ta/lRlhOlFLxUcDqQhmtpZkrT6HgNANaV+61IX6ttPEcgAjxKNFU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779366636; c=relaxed/simple;
	bh=IGJeQg/0IzGtIJqUoAExl9TYW+zCcp4OaJSwWc4UmVQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GgFAzrih2M0s4f3GYJX6o6nFYidFZHA1GoUDvX9ryKrUZE8xJyMBkPbNjnvyUTU8vR1QdYVzD0ZsVBD1d+8dwNAu7H/InwPnHVbLcGdBfoRYh+ti6NzmiS3UwRt5Q1GIa/SOiDy7KcA0NJ9yxJKHNlv9jC0mwZrn9xHf3GIGJ1Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=hPs+LI9t; arc=fail smtp.client-ip=40.93.194.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ax3miZOmgBILrGdhVk4AmeluNh+gD7DGHRYQQQqIyMRRcHvniYfYeZnFvykP2ofyG7UYFPy4nyWiX+M273JFlpFZohRu2466u8UhkNbHcxwC2cDU/+WYTojlPXGAEHVim2IA2fP5Z7jBX0moJRPO0NzjF45zRecQDzY89nvkImiDPplpS3xOALK7axKmk619MnedU7m3WLNoNN8kArjjSNno5Dw1FlyOYTQcRIQoiW04kuVa6spobq5fxrxrZalpu9m3WPY/CcgO/PLHmobmRdksg7Ve+vfVq4dT7UjPP06NQkqNEi7UdaZtmxgYuKdBf+rtld0L+KMZ0dSxBitDzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oLvXFcH5KavKgiiI0TyEeeIOpVLMjvyPhQ4iH2prz+U=;
 b=n3I4LPtAPgUrgWpHjy+aTJdcZdOcvGxWbh6f9KDGw+cqy5KAGeqVvgvcrqpv+AdFaG1/Q0B1dZRNPS6g6QWIioyasp2f95Z4bQTh6nz5Qpa/rcfvVJUsvfG5HzfrIcbLKwuAGADYgzuMMqLWED6lgLHUMgTeBd0W3RLC61yqLXzYQDQDjnoTHGA0mTAjBu3sel/94cTRi9jBdQMZFYrROg7GRnd3L/D8KPeItiXacyFZ58ZL69EjmfXvgZV2Tb7gqt1IdbRHwSv5ZZPb5DzQz2sz9zBvW3IVoAH/mndzH+AkLV+EfrpiRw4zKTHkqElgRRrYpf6q6zM0XB+RIzbaFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oLvXFcH5KavKgiiI0TyEeeIOpVLMjvyPhQ4iH2prz+U=;
 b=hPs+LI9tja58GfVLAdm7VmIvuH4KGYXG1mLM/bbG2BrpuZk6j3FYnX1J2jLX6q0+fLFHMQtbTYe6UPgMpHkiJBEr7FukAY4VdIo6uVDPBVcIOGlL5vruFcFNg89GAEZ10RXqOhWnmAjHeF1i6DyE01rloNFC48Pdz4+TtfTIuU4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB8843.namprd12.prod.outlook.com (2603:10b6:806:379::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Thu, 21 May
 2026 12:30:25 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0025.022; Thu, 21 May 2026
 12:30:25 +0000
Message-ID: <bbcb0051-7969-45a5-847f-24e1c43f83dc@amd.com>
Date: Thu, 21 May 2026 14:30:18 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dma-buf: add DMA_BUF_IOCTL_DERIVE for
 reduced-permission aliases
To: Albert Esteve <aesteve@redhat.com>, Sumit Semwal
 <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, mripard@kernel.org
References: <20260521-dmabuf-limit-access-v1-0-26c01e27365a@redhat.com>
 <20260521-dmabuf-limit-access-v1-1-26c01e27365a@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260521-dmabuf-limit-access-v1-1-26c01e27365a@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0399.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cf::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB8843:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e013e7c-e50f-41bc-7a01-08deb734bbb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|56012099003|18002099003|22082099003|4143699003|3023799007|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info:
	8MBmF//3CuLnS8ZMWCVazGwRW3qTy2D4wNzeIg8Ytr5crbvU246wRmO2KSmkxC298troxHve7ngSl5tFm3+aOyU/iM04Qzi2G6M7uwlJN7I5M0hiq+XkTg2kP4YV3JKUSch8ha8BY7B1BT+cL8EttSc0kfFXPewAhHUiryPiMiP7eKMJUaEnSOjc4MWRSMvfCo9edWEKI9C1gO8eR/XoxowCvmpaB61JsyRvBNtNxDt3STcxls/Ee0myToXet9JEsGd1W7cq0ntpWqrel/aX1GC4xLCSLnCUtdukSF6l0jUmtbLRHA9mLrph2QUogB6NVcu/CpM07Ysh2MlWLsnZ4rxooRFyUBp0MoQwuuH8X8HakUvXg8tc1p3k/Ae8u7iRNTtAsm2xW/GmBwLvvfB/vRl4BGHdQH5roDmrglVCzdeNr2X/pMvyZAsm8YvDoiABejeHTixBQ1gaw22LqRsYeRRcnPIWIj6J1vPGkUFjSal83Xjetp12CwXZTrZvu0Wx6CT7f5EGcvesIft+2EdHFkGkRLHPE1sA1WawgaU3Zl0dbKBFrZvYwyEdJM9FdcjkzJhQs0kRhXbh81fKgfFsrxW6JCFUezlo3mOQd4OY0Dx7QPj8v/VUt8oG1Uuev5USRBe62cROx1K4tvh50fY8pRfUB61CIsy6BAeVavAtYgBr+BN2JW4dJl5sN2kmSctt
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(56012099003)(18002099003)(22082099003)(4143699003)(3023799007)(6133799003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b0ZtTEtFZmtCVXpIdEtndzJ1SUpFMVB3cWN6WnA5VnRUZVJ5bERSVmo3b2k4?=
 =?utf-8?B?Qk4vdXZqYTE1Y1pkOGdJYkUrcXhZZzBMaWVKanhzSy9sdzEzc1hpYVcyc2Jx?=
 =?utf-8?B?bmlBL2hPR0Fod3BrMUF0THFYRUpTb20yS05hL1hvSlRQcjMyK3NuSHRiME8w?=
 =?utf-8?B?Sk16SXRZWi9scGRaNzh6cytvdlIrRm1nUWlOeC9PM0xpOUI5cXI2WFY5aEZx?=
 =?utf-8?B?VUMwK05kS3lsL2lqekdBV3VPVTFaM1lWRms3ZjN1WjVteHVwNGRPenZ0SGYv?=
 =?utf-8?B?dlJZQ0tveEhaQ1o1TXdpMVNKaU9NeGVzbWFWMUtOdzh1THNidmlIUjFXOVJy?=
 =?utf-8?B?c2c3U3piYW1OS2FleURYMzZhMWprOHgwRjJyRk1MS0pyN3hpc3h0RFluSG5J?=
 =?utf-8?B?R0hxTURyZzIrbC9nK0w1elh6dlI2ajA2NkUvM0YzZ3phOEZvZWFEL3RaNTNV?=
 =?utf-8?B?WWtrcE1pSC9saHVWNnoxWVdmWFN1bWh3M0N5UWpjVzVXVTdYLzljR2lDNDRv?=
 =?utf-8?B?WjhqQTBvazJuM1BFNWhJL2dSMFdxRnNwUVgrMWNzS3VUVEp0bFVjSjdCK2FB?=
 =?utf-8?B?TlA4NnZrNGtRVHBJS2J2UEE5MDJrTzVlN3F3aTJLWWlyV05adkJyaS9XYXFq?=
 =?utf-8?B?WStPVkFzcUkrTW9Zb1NPam5YU1dCaTlGYjFzbzgxRjJGSFUzZmw5TjNFZHpp?=
 =?utf-8?B?UzNtbi9kb3k4RXRhUWkyc1VvT3hRT3NVTDFNZi9INzFhQTJCQ1I3b0hSYTBO?=
 =?utf-8?B?alh0YklYS2l5Q3U0b2lXMDRrWEZmOTNLNTArK1VIZ0xEbFZWaExwVFBmNTNF?=
 =?utf-8?B?ZHdKZHhPNkJ3YzZFREJqQ09VOUxxOUtWVFBOeWRGazY0ckxIYmdTSzR2TTFU?=
 =?utf-8?B?OHFMbEFvZCt0eHpVTXh2WlNSaEcyL2Nya2VUWktkR05qZi9NVXdWam9jQW9p?=
 =?utf-8?B?ZkUzTFBkU2NLNlVHQU9yUlJ0ZFo4NWU3b1Q0Z3VlcFE1TUFXemNJTndkT0tZ?=
 =?utf-8?B?bnRNNXAyMUcrSW5ZbjRNelNVSytrNDBCRXg2RG5uQXkvOG9QUzRxRG43aTlu?=
 =?utf-8?B?SEJHb1ZqemxhNDdDZjZWL1hsR2hGVHRMalV1WnJIYS9Wbnh6ek1UNkFUd1B5?=
 =?utf-8?B?MjlHOVdxR3VyUklmRkFZVkIwZUVFaTVadHFpS21DQ1p1WGZjaklIek44U3dW?=
 =?utf-8?B?NWlIdms4WWRVQnhYeWdmN0sybXZONGFGeUZnS3NnODMwT2FCMGE4VEFDTnBG?=
 =?utf-8?B?N1Y2UlR4cmFPTno4M21JekhjdnlKMEg0Rmh4WVlNMjQxbmtIQzArTk9ib3RY?=
 =?utf-8?B?SzRwaTlEVmFjbm5nZEtxL1NnYW1zUThnZmhNMGM3TW9PZmswNC9id3AvQjg2?=
 =?utf-8?B?M3R4ZVExZUM0cWdidXhDMVlDd2xncUJBYTNQb09TQlBoZGhDc2ZYZzJBbW85?=
 =?utf-8?B?RjFZRytoRm5xU2Z2WXhMNUd5cWNjNXJQRUFMWGZCRXF3UEhsRkd6VUR2NTdJ?=
 =?utf-8?B?dzE3OFNPQ2FNblhmRUxFQm5CaUFpZUw2UDNudnpGZEt3U2dPWWFhOE52UG1X?=
 =?utf-8?B?dEE1R3hqNmN6U3ErQmlUaEg2Ni9XQ2pmdDBxTWZISnJrUVdoaWJ6NWduVVgz?=
 =?utf-8?B?WDlzcHdlVHdGdjQvYUJpcUVDR1ZTU2ZGaXhZeU0rN1p4Z3lQZUtsd3JqMCto?=
 =?utf-8?B?bDBBWHpQeGhZc3JobTd3bE54eVdQL0pzUnEwQTdXTC9PNDRrRFBzRlg4dk13?=
 =?utf-8?B?UkgrN0tWRTQ0UWJ1ZGRhMXcwejRKYms5cUV6QU40Q1pTcDBGSFpiWHo1V2E5?=
 =?utf-8?B?VFVtS1VpTk1WRGw5U0dtYWJScWo2bjEzaTMvUFUybkphVmFJYkhPTnpMVlNX?=
 =?utf-8?B?V1MrVFJqNjBrQnN3aFcvWGFGNEFWZlM2WGVmYXNiWlBGdXpTTUtFRHJZZDlh?=
 =?utf-8?B?NGVDWUpWVTVocytYSmVybTAyWS9jeHl1SjlWcVBvY1ljMHRUWi9FaDRwWUlE?=
 =?utf-8?B?elJZZTlMenRHYU01blQ1K2UxaHo4a1BkSnNlTzMvYVlncXJCc0p1OUlRVWNN?=
 =?utf-8?B?bzNUZnNqcG1qTllTbTIxMDFLQlYvemlTQTBZNjVNREt2Z0dsQzZVbGdUMW1F?=
 =?utf-8?B?UEJhUW16UWFTZ0NoM0xuSEFXMmJDTStJWTk1ZWZjczJ0bXhQQ1VBM2ZkNzcz?=
 =?utf-8?B?WXZhR0d2aEo0NnlJWlZFWFo5QW4wQmpUUG1IOHg2NGtCb29lN3dRVnVDbUdE?=
 =?utf-8?B?Mko3aXZONjFDSEF3YUNXWUNqM1R2QTJVOGxaTml0MDhRUEFVRkVKd0R4SDRM?=
 =?utf-8?Q?leCyzGrqBmUwzXT11v?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e013e7c-e50f-41bc-7a01-08deb734bbb9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 12:30:25.0485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fHykI5Ua+N0R7HLMRhokJTjWaOSgcVJmyQ5hBeR8AKv6+GXHXih8Aywj3Vz4usD4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8843
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62466-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: BE4945A4F03
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/21/26 11:10, Albert Esteve wrote:
> When sharing a dma-buf between components of different trust levels,
> the allocator may need to hand out a read-only view of a buffer it
> holds with read-write access. Currently there is no mechanism to do
> this: the file flags set at allocation time are fixed for the
> lifetime of the dma-buf, and dup(2) and dup3(2) cannot change the
> access mode of the new fd.
> 
> Add DMA_BUF_IOCTL_DERIVE, which takes a struct dma_buf_derive carrying
> the desired access flags and returns a new file descriptor for the same
> buffer with those flags applied. Permission escalation is rejected with
> EACCES.
> 
> The new fd aliases the same struct dma_buf, same dma_resv, same exporter
> ops, same underlying memory. Importers that attach to either fd operate
> on the same object and observe the same fence timeline.
> 
> To support multiple struct file instances sharing one struct dma_buf,
> two small internal adjustments are required. First, move
> __dma_buf_list_del() to dma_buf_release() so that list removal fires
> exactly once when the dentry is destroyed. Second, update
> dma_buf_file_release() to call dma_buf_put() only for the files that
> are not primary dmabuf files, leaving the primary fd's refcount managed
> by the normal dentry lifecycle.


> Finally, enforce the access restriction in dma_buf_mmap_internal():
> a shared writable mapping (MAP_SHARED + PROT_WRITE) on a read-only fd
> is rejected with -EACCES. Without this check, O_RDONLY on a dma-buf
> fd would be cosmetic, as the VFS does not enforce f_mode for writable
> mmap on anonymous inodes.

Clear NAK to that since that would break the existing uAPI.

Regards,
Christian.

> 
> Signed-off-by: Albert Esteve <aesteve@redhat.com>
> ---
>  drivers/dma-buf/dma-buf.c    | 58 +++++++++++++++++++++++++++++++++++++++++++-
>  include/uapi/linux/dma-buf.h | 28 +++++++++++++++++++++
>  2 files changed, 85 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 71f37544a5c61..34a3872365730 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -180,6 +180,7 @@ static void dma_buf_release(struct dentry *dentry)
>  	 */
>  	BUG_ON(dmabuf->cb_in.active || dmabuf->cb_out.active);
>  
> +	__dma_buf_list_del(dmabuf);
>  	dmabuf->ops->release(dmabuf);
>  
>  	if (dmabuf->resv == (struct dma_resv *)&dmabuf[1])
> @@ -193,10 +194,13 @@ static void dma_buf_release(struct dentry *dentry)
>  
>  static int dma_buf_file_release(struct inode *inode, struct file *file)
>  {
> +	struct dma_buf *dmabuf = file->private_data;
> +
>  	if (!is_dma_buf_file(file))
>  		return -EINVAL;
>  
> -	__dma_buf_list_del(file->private_data);
> +	if (file != dmabuf->file)
> +		dma_buf_put(dmabuf);
>  
>  	return 0;
>  }
> @@ -232,6 +236,11 @@ static int dma_buf_mmap_internal(struct file *file, struct vm_area_struct *vma)
>  	if (!is_dma_buf_file(file))
>  		return -EINVAL;
>  
> +	if ((vma->vm_flags & VM_WRITE) &&
> +	    (vma->vm_flags & VM_SHARED) &&
> +	    !(file->f_mode & FMODE_WRITE))
> +		return -EACCES;
> +
>  	dmabuf = file->private_data;
>  
>  	/* check if buffer supports mmap */
> @@ -537,6 +546,50 @@ static long dma_buf_import_sync_file(struct dma_buf *dmabuf,
>  }
>  #endif
>  
> +static const struct file_operations dma_buf_fops;
> +
> +static int dma_buf_ioctl_derive(struct dma_buf *dmabuf, struct file *file,
> +				void __user *udata)
> +{
> +	struct dma_buf_derive params;
> +	struct file *new_file;
> +	int new_fd;
> +
> +	if (copy_from_user(&params, udata, sizeof(params)))
> +		return -EFAULT;
> +
> +	if (params.flags & ~(O_ACCMODE | O_CLOEXEC))
> +		return -EINVAL;
> +
> +	/* Escalating permissions is not allowed. */
> +	if ((params.flags & O_ACCMODE) == O_RDWR &&
> +	    !(file->f_mode & FMODE_WRITE))
> +		return -EACCES;
> +
> +	new_file = alloc_file_clone(dmabuf->file, params.flags, &dma_buf_fops);
> +	if (IS_ERR(new_file))
> +		return PTR_ERR(new_file);
> +
> +	get_dma_buf(dmabuf);
> +	new_file->private_data = dmabuf;
> +
> +	new_fd = get_unused_fd_flags(params.flags & O_CLOEXEC ? O_CLOEXEC : 0);
> +	if (new_fd < 0) {
> +		fput(new_file);
> +		return new_fd;
> +	}
> +
> +	params.fd = new_fd;
> +	if (copy_to_user(udata, &params, sizeof(params))) {
> +		put_unused_fd(new_fd);
> +		fput(new_file);
> +		return -EFAULT;
> +	}
> +
> +	fd_install(new_fd, new_file);
> +	return 0;
> +}
> +
>  static long dma_buf_ioctl(struct file *file,
>  			  unsigned int cmd, unsigned long arg)
>  {
> @@ -587,6 +640,9 @@ static long dma_buf_ioctl(struct file *file,
>  		return dma_buf_import_sync_file(dmabuf, (const void __user *)arg);
>  #endif
>  
> +	case DMA_BUF_IOCTL_DERIVE:
> +		return dma_buf_ioctl_derive(dmabuf, file, (void __user *)arg);
> +
>  	default:
>  		return -ENOTTY;
>  	}
> diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
> index e827c9d20c5d3..d0cf616228e55 100644
> --- a/include/uapi/linux/dma-buf.h
> +++ b/include/uapi/linux/dma-buf.h
> @@ -168,6 +168,33 @@ struct dma_buf_import_sync_file {
>  	__s32 fd;
>  };
>  
> +/**
> + * struct dma_buf_derive - Obtain a dma-buf fd with reduced access permissions
> + *
> + * Userspace can perform a DMA_BUF_IOCTL_DERIVE to obtain a second file
> + * descriptor for the same dma-buf with a subset of the calling fd's
> + * permissions.  This allows a producer holding read-write access to hand a
> + * read-only view to a less-privileged consumer without giving up its own
> + * write access or allocating a separate buffer.
> + *
> + * Unlike first-export ioctls, the new fd is not a re-export. It shares the
> + * same reservation object, exporter ops, and underlying memory as the
> + * original.
> + *
> + * The requested permissions must not exceed those of the calling fd.
> + */
> +struct dma_buf_derive {
> +	/**
> +	 * @flags: Requested access flags.
> +	 *
> +	 * Accepts O_RDONLY or O_RDWR, optionally combined with O_CLOEXEC.
> +	 * All other bits must be zero.
> +	 */
> +	__u32 flags;
> +	/** @fd: Returned file descriptor with the requested permissions */
> +	__s32 fd;
> +};
> +
>  #define DMA_BUF_BASE		'b'
>  #define DMA_BUF_IOCTL_SYNC	_IOW(DMA_BUF_BASE, 0, struct dma_buf_sync)
>  
> @@ -179,5 +206,6 @@ struct dma_buf_import_sync_file {
>  #define DMA_BUF_SET_NAME_B	_IOW(DMA_BUF_BASE, 1, __u64)
>  #define DMA_BUF_IOCTL_EXPORT_SYNC_FILE	_IOWR(DMA_BUF_BASE, 2, struct dma_buf_export_sync_file)
>  #define DMA_BUF_IOCTL_IMPORT_SYNC_FILE	_IOW(DMA_BUF_BASE, 3, struct dma_buf_import_sync_file)
> +#define DMA_BUF_IOCTL_DERIVE		_IOWR(DMA_BUF_BASE, 4, struct dma_buf_derive)
>  
>  #endif
> 


