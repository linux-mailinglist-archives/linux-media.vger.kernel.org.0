Return-Path: <linux-media+bounces-59332-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mCxPD0XD6Gm9PwIAu9opvQ
	(envelope-from <linux-media+bounces-59332-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 14:47:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AB9446236
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 14:47:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA311306B191
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 12:39:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 081FB3DEFE4;
	Wed, 22 Apr 2026 12:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="WoGq1UKp"
X-Original-To: linux-media@vger.kernel.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011010.outbound.protection.outlook.com [40.93.194.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95BA3DD534
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 12:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776861577; cv=fail; b=E3quAyDnDyqfFfJxBR/MsCtW1pIzbZ2Ijushn2wB/f/3dLcttk2ptrHtIJmwx7uuX5ejnG/E++zuJgIRtpqeaA+W9ajlcS+F1+KqUHlCEUPoFgp3zp8+2B7LbOkgIxkWa+POoeYeR/Z1GJR+3l/jdJYqiL9iE3XemelwFJFyp30=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776861577; c=relaxed/simple;
	bh=uSG7HQpOgDK/u7OdYtgxATSVULajODHUVnD5jhlTaFs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=n7mPGEWdNT+2V++2soQgbWrxrko1Ggr3jslBoSIvbcZPKibzMLHj1SAnEye21/gQc9QJOkyMNvSZIytgiw33g57TNchKw67RV2A5aRb+e82nwuH6HDWX8J3UfLumJsgiwX6e0zOiCxASnevQklZqaQAo/L4jSRYUPj3MdvNuV+g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=WoGq1UKp; arc=fail smtp.client-ip=40.93.194.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jxayQ42uIpfC5JjSS65xUGo8BRkOxvXT2k0hO3qR8HZNLhp86iUduXZLReA6waBAOShGjlUM527SAcnUKk5VE29mpOJ3GaTOh/h47gdZqcMfNwpeWCPwg7tXrbKwtYtMqAQDRuODMRpiwDxiok5BcqcJyrP8akAJ7nZ0EP4bZkL1+lWqJPqHv1T3Bafz13yzmukW/uWopkwUOyPQRT49pkXjw5unv8gr8Y00vo27q6TjklxQAwNsU3OEFOArmCgJCoBf744EDmnBstKH58xHe//8IMemauSwDrWzhkdd0Cf49KLSwExDLCXa0WcDYc1FKi5iYkaj1Op37KdNPMz/XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MMTkXQIsan3SLJhhkBaUokqyVzkv9bCTYB1PHyCN8Yc=;
 b=DE6NaRQ/Pb61aOboQ7CuFmmXcryCmJw9xg6MGrfhgDiPkQLjiTENRbrRRAb8Ilt5PA7BThq2hF4rIRq5WQPM9DfF9MO7VUmAgzxvLel4egSVbyudcL0/meLy28zGacwXsyPPsR2aLKHZiE+XfOffLT1nCQor11jPb5y8SV1S6F4EfACI6bGrxycoNc29CqzQny6NR56dkaKr/W45KmjxqZ6+3T6bspsmq+j3Vt85uYyuMsFVlBNOxcKBvwUUFkOuvig0XSw5B3COEudiHwG7GhkvxRMbGHd/NCM5nla2ZJZb+5T602ANKr35imcRC5aTHYYYXA3/3qFoCyTAU904+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MMTkXQIsan3SLJhhkBaUokqyVzkv9bCTYB1PHyCN8Yc=;
 b=WoGq1UKp6Q1Gcf7gaadmfVZxGRooz/reYyQMBxhzWS6ixwgwnSyT5tkgYVCizEqEucl6e+8lSULkRmRF3AqBbugcQHcRYfXnR13LkR010C7tF0Hx1Ld/S4O5UwBX+w1YbUBHcJYGcCgl+tF1vwfulgQxNZ1v8lJeGdIqFNe1nRM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB5594.namprd12.prod.outlook.com (2603:10b6:510:134::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.20; Wed, 22 Apr
 2026 12:39:30 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9846.016; Wed, 22 Apr 2026
 12:39:30 +0000
Message-ID: <fd8065ce-fd0e-4df5-9c80-8e9603657cfe@amd.com>
Date: Wed, 22 Apr 2026 14:39:16 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 21/26] dma-buf: Add the Physical Address List DMA
 mapping type
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, iommu@lists.linux.dev,
 Kevin Tian <kevin.tian@intel.com>, Leon Romanovsky <leonro@nvidia.com>,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 Matthew Brost <matthew.brost@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
References: <21-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
 <c413710b-4c28-4ed8-88ec-aeb8c4482011@amd.com>
 <20260413121628.GE2588311@nvidia.com>
 <f6d38a08-009c-4efe-9dc3-6bcf00ac35f7@amd.com>
 <20260422115306.GI3199414@nvidia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260422115306.GI3199414@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR20CA0066.namprd20.prod.outlook.com
 (2603:10b6:208:235::35) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB5594:EE_
X-MS-Office365-Filtering-Correlation-Id: dcf9bd2a-ba10-4971-8e84-08dea06c32a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|1800799024|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	FdHV/Oz6+eazfRX7Wu93d1nXYAviTrxGPE7bDjQRJZsaqtEg7fmXEpbhcDIvnl8r4KiR7LkzV7fixlGZi73dp1jkZkzBFCBFWs7P4hHAIbfnO7PUcKKVIykV37bbvQCzPT4CWp0wpDf3Q3GSI2HqsIahy/bjsIvA383O4NiL5MHOQQ0lh+zrBMJuxfXYCuoZgQd9U9zXU7cae29ejhKPJ2oiSMMVN2RxeEswIxv5Oseu7YQogZ/NLdWqhNnAyO0wpi5MJ4F9wu9qDUCdzmO5qAaq2O1IynyjAwZ6KdtKestPewKj/XRWvlTiYmI1z1z7GSfSG1VUw+2uVacGprSsmNaBxrsd4vwg/YQFMEyesjBv8tO6LPKFD1YM0SVhCxe8oDhLSQlOcGbT+35EYf0VbQZG3sRFO28oFr6gKqG5kznqh2al3SlL5j8NdTkE8cvew1/jPiTUFFI3khOD1dG7XRlwp85NfmIk9gLmQrG5+X/XfEZUAA14JOge4HdL4FZr8HzN5Ed7BkKjDshryCwWFowgNlq9Zhj50zzLEkobY/EAdnC27d4Y4xK7OkEPF5SoKsUtoDDYIka59kdY+k9kPGT+AgbNQZnSLDQiffQJyW/P9TElJ+EOxrdEMcRFRgUqDJLlHM4wo7DNT6wZ+8kx9QyUw0piVHKtjCkXrb63AmVjEJhACQqjg/gbbdp4xd4KSt1zy8yirizwWVJFeWFOxkD2p3KkGZVqrKxNrXg62kQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OEUvZHh5V2FQSmpUZG5YTW9nZFUxcG5iaG4zYmlzeXN4MEJhVkVmR2hVYnR4?=
 =?utf-8?B?UFVvUnF4MGhiR3ZkODFod09uekNMTmh6UTZJKzRRazNPVnR2Z2plTjN1anI4?=
 =?utf-8?B?NEROOVlMZXZsNWRKL1U3R1IrK2RsS0FxS2JDUS9TZ2pFd1AzM1VMSmtQQ0tN?=
 =?utf-8?B?S3h3ZTljUUpxNnROeEVzUXdzRjdBQ0IyM2pEZXZ2MDhINmZPcWR6TG9WZk9R?=
 =?utf-8?B?WVlJZWpKM3Y2d0lMR0I2bmtadUtRQXA1bmZ6WnZSdnE4U1hMOHBYUTlDVVRC?=
 =?utf-8?B?YjFEcmtiMjFmdHZ0eWZEM3lMbEhTQnJBbncwT3V2R1pSdlpIcEZXR09DWWpI?=
 =?utf-8?B?NWVzL0h4VWRqVGUzcGRyTldvZDZmSzJsaGQvNkl2aXBKMXFTaFQ0RFRUOENs?=
 =?utf-8?B?ZW5ZYU9sOVNETjNBS1NUN1FWUnJibTZXaFU5WCtqQTlXRmNWRVkyUllTSFRR?=
 =?utf-8?B?Q1U0ZTM3NlJodDZQSUN3SVQrRGJqeTdveVFjL0JrNkV6TnpPdU9NUlMyRGh5?=
 =?utf-8?B?K2YxR1RDb05iUlJtWHVNbVRHamhyRkxQVXpyZUlPcGViY2c1VnJYdUlkZ0pX?=
 =?utf-8?B?WWVsK1N0SVd1OUUzY3plVHFHdHNLUWYyL05Ic21nWDZPVVVnYzNNbHFoRGhC?=
 =?utf-8?B?NEp3d1R0NnFoUWNOSG9ZMGhsTHZyU3h4Y29hay9wVzlmeFdJUWpGVlZuMWdj?=
 =?utf-8?B?cVNlQWtqTmhrMVo5eGUxSm5zaUhPd0Z6Q0RvNCtkbjFEYVRQaCs5N01LMFhD?=
 =?utf-8?B?QU1uYzNvaTJLZE5TdUZBWUxiTHFHVElDK0dJTjMzTFJia1hxeEczZmQ5MHpi?=
 =?utf-8?B?WWtqcjNzSDFHemE0MGpkRXo3Vm01OFg1d3RETWJMUkw3MVdyZGNzS0hVZVow?=
 =?utf-8?B?VUJ5akVXM1Q5WCt5Um5wa1VXWXhUb2k0UDF5am5xcWY4YjBMbmRVN1Y1bG1C?=
 =?utf-8?B?NUlxRmFyK0JBNjdDSmtxWXNNK3lqenNQVG1YWkVSY0RSUEpPQmtIQk5Yd2F5?=
 =?utf-8?B?RWFVNXBoTTY5cHN3SWxyS0lLQjRiN29VdUUydHUvd3pMbmlyMnhQREJQOEVr?=
 =?utf-8?B?WG44MXArbjdXdmxaajdya3ZNckxUbG8rNE14bmF5a0lTWlFCcmNPVE9LZmZS?=
 =?utf-8?B?RTg3ZUQvQUN2aUJQMDFmWlBSR1RIT2VEanRNK0NFbmd4Sk1EMExiYkc5WnJo?=
 =?utf-8?B?L3BGbDB3aGJqblc3MjVPWHF5NUxCaTN1T3JOc2VFOTFMQnBkYUJmWEdCTE5G?=
 =?utf-8?B?bWJQa2xTcDlTR2w4cTZzbzB0ai94KytGeFBiY0JudkYwODlOL0hBRk13ZVd1?=
 =?utf-8?B?RFlYWFdrZnlyTzdLYStxK05uN0dZYmtxR2laOHFZc1ZNNDJnWm0xblRJNHBa?=
 =?utf-8?B?NEo3RUZBTVlvUlRqaTk2UGRob0orY0hDT2M5bnZLSDJ3NTRodnl4cTdUVitK?=
 =?utf-8?B?VkJ5MjlGdkdSVHFDZmJuT2ZPZmVKR3EzYlFWOFNtczJibWN1aGk3TTdSYWJD?=
 =?utf-8?B?akZESWNOMkdEZE5UNVVUanVZRzZGa0JRenVNZDlhRWQvUW1JTS9lQmdCdlV5?=
 =?utf-8?B?enF4bFQrUVZQODZQNHZWS3ZzRjVTMVpsRm1QcHJobEpzOEZtQVJodVZYVW9o?=
 =?utf-8?B?NWV2S0t4Q3ZZRXoyV3JPd0tHcnFXalU2N1ZkZlZHRm1LTGIwTEVpcjlwcWp4?=
 =?utf-8?B?dkxGM25DREp4YVVTMlVNWU5zc05LNUN6RVFaZUtXRzAvT0ZuL21qYzRRbkNT?=
 =?utf-8?B?U3VxSDcwVFRHK3ozS29hVW5vdW1uTjVjc1RXbXBRbzRyR0dORkVyd0pWUHpB?=
 =?utf-8?B?UnFVZm9Za3d2dExkcWJFM2grTThtTGpDd0ZRV05tWVptY1NubklWUVdiQ2Vv?=
 =?utf-8?B?cnJwaEJLMGp4ZE11ZGlOK01JWlNLMTJRWldoWFU1eE03NVdtbG9pUStoOGRC?=
 =?utf-8?B?RXREdk54MEJwSzY1OVlCN1ZpQ2RidHh6OTV3ZXBZLzJNS3U2NVMyQk12Y0du?=
 =?utf-8?B?UG41QW1FYTh0YU5SdWRLK0JySko5a2VDcXMva0dPOG1EaWZjcHhsSGpWaG5R?=
 =?utf-8?B?eWg0b1cyQzY5NEVuVWNKYmtIT3RrMHJHMG9zTVF4K0x6dWRFMzlZU2NnMzRz?=
 =?utf-8?B?SUlaZWdPT1RIN0owellScUMxR3ZJRnhUTzY3YWxhcTl1VVpEc1U4NlA0M09V?=
 =?utf-8?B?UVY3WUN2c1NTWURIblgzQ3lvVzFlSUhudTRUKzJucGhHaW9ONTkrRkNUMlB5?=
 =?utf-8?B?TXVsdllLR3JpUDRTOVczUy9jV3IzTk1XUkh6MWZTeTdQZjZ5a1dBRXF2bk5t?=
 =?utf-8?Q?uJCz54mBlY+14a6nwO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcf9bd2a-ba10-4971-8e84-08dea06c32a1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 12:39:30.2082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H7vVzALxq15kQCMSBceabuoTU67W4blnLomOuTx3mzcYGc8B8Fpbn/gsWEX7hwGS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5594
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59332-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,amd.com:dkim,amd.com:mid]
X-Rspamd-Queue-Id: B1AB9446236
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/22/26 13:53, Jason Gunthorpe wrote:
> On Wed, Apr 22, 2026 at 10:17:06AM +0200, Christian König wrote:
>> No, not even remotely. I clearly don't want such an interface in
>> DMA-buf at all.
>>
>> You can do that as private iommufd interface, e.g. where iommufd
>> offers the functionality to say give me PFNs if you want that.
> 
> I'm not sure what a "private" interface means if VFIO and DRM/RDMA
> drivers need to implement the exporter side? That's not exactly
> private if it in so many drivers.
> 
> I've tried to make the importer side private, if you have better ideas
> how to make it more private please share them.
> 
>> But when there is a DMA-buf interface even if it is limited to
>> iommufd then others will want that as well and that is not something
>> we should do again.
> 
> You can say no, that's the point of the export symbol restriciton.
> 
>> Even for iommufd I think we don't need that. What iommufd does is
>> basically manipulating a specific IOMMU address space. So the
>> interface should be to give that address space to DMA-buf and say
>> hey please map you backing store at this address into this address
>> space.
> 
> Isn't that pretty much exactly what this series is? Aren't you
> splitting hairs to say an "address space" requesting physical is OK
> but a "mapping type" requesting physical is not? The net result is
> exactly the same, physical addresess flow from exporter to importer.
> To be clear, there is no way, nor should there be a way, to use the
> DMA API to create a reliable dma_addr_t that is 1:1 with phys_addr_t.

Mhm, that sounds like what I wanted to say wasn't understood.

> Can you be more specific please, I still have no idea what you are
> thinking in terms of an acceptable implementation.

Let me try to describe it differently:

The iommufd deals with iommu_domain structures which userspace can map different things into.

So of hand I would say that an interface to map DMA-buf into such an iommu_domain should look something like this:

dma_buf_map_attachment_iommu(struct dma_buf_attachment *attachment, struct iommu_domain *domain, unsigned long iova, unsigned long offset, size_t size, ...);

The DMA buf exporter then maps the its data into the iommu_domain at iova starting with offset from within the buffer and size number of bytes.

Regards,
Christian.

> 
> Jason


