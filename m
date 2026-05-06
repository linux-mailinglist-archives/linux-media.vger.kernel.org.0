Return-Path: <linux-media+bounces-60501-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKK9Jhep+mmJRAMAu9opvQ
	(envelope-from <linux-media+bounces-60501-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 04:36:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DA84D5B73
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 04:36:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C7F083046192
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 02:36:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F14192D46B3;
	Wed,  6 May 2026 02:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="2LY9dx0C"
X-Original-To: linux-media@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012051.outbound.protection.outlook.com [52.101.43.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5568025A2B5;
	Wed,  6 May 2026 02:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778034963; cv=fail; b=QNVWBf08N/HlCIRsCAkj9lP5ZxhBiZQy28eWPOuGvD0uXKTQKYzvLn8FZAtmqT8Ml9Dqr36xW/kY5FkfExgCE3r+xVjiQ3/LDWRrg/xfSyDyRGVWJIFQu+0lnNUjjQP8rrJhsX0gSEMC6W05Vt75v1kG1ybfdel6azZsDnzH2PY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778034963; c=relaxed/simple;
	bh=Dekol3V88fjVHzxuxHsu8G6WRwJGNvphv1XWIL0wWVo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=anBJs7NTyws7z26I/U8ujHRAmzhetOtoU0/Fpx/0QmBv4uX54+3QADf3eYblTTNdP+Ucgmf3HSPtEr0kJoYOzSLZgi/u6lvSGqfVaFG2jJH+tgf5O+Va701OZARsaoRk4f0TxYMu4n5O131ecz5Cq4P8WzmZOAbVrLhBBBViO1Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=2LY9dx0C; arc=fail smtp.client-ip=52.101.43.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cXcoR1j6x9Mvp3WCBLpFj3c67cYmJtdTRrKDeU3b9hQ/taKienJWpQJssHZpSWCYc2x0LBk4zrXYouIqQfL51JAWc8xzGuSM08zq25OpB1SM1phwR9jPNwgrXQyMcbv2UP7FH5gvD6sA2PkID0a1efEorSQ+Ms9zu3P8m2cZyJHfHVuGxduvZWenYJ6NiJxoRArES9QMnTNi0tcuKLxgxPXYikVCyqA3espkNRWXXsNgZU9a69EqhKqRDYv5enzP/af0fyxA6cdrLHjhjHU4M9cOeh9Ul6lteo/iWAmmNU15WNs3ixKaPIrYvn0vNJyZIfSy04r8gQ20Qq5IYcDBlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dL3KXuneSg5D0d8zy8jXsf0IUlnv71D8mUubTlZZvLg=;
 b=JjJYBxH2JTBNDW3Si9RLCBNSApmWwTipzYHleaK3d4IRHE+5vvPvQEGFTxhCwaJEEMV3A0amMidFWSugt93yjKy0CLip8cIn8g5+VlTw9g4bG8fnup3Yar5h1x+vFeWR0miefP0VisFVcv54EuuuV1JLX1LgB6c70Ig7JxryEPfecPwDtwywWMXC3I5NpYnkXIeb1g5vFsBWWXWF3kIP5s6Ndial5AqXY9toMEvc7TCjzdIEKl6bNdMiXF87ZMwkfzPBDjnfhyiXE6HZIeXjuRzjCZe48TJ7RUJLV+dPKp1KanVPA9Bi6RhZARLkK6pBauEU0TUgdNdXhp7Ifein+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dL3KXuneSg5D0d8zy8jXsf0IUlnv71D8mUubTlZZvLg=;
 b=2LY9dx0CF/1cPF4Z83Qh0qrrM5tr/MKjjGqPTESVcJiyw5i/xY2KqE0rL5/kajwZ0uE5OyLwik5bL/UzgL6A1stobtOrr8AOffD5b3+l8BT62AUNx884KRZVHwz5JtNkQK+0TOBv01LybNO/NXwePBoybfiF0mzZzq07cy48we8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB9194.namprd12.prod.outlook.com (2603:10b6:610:19f::7)
 by PH7PR12MB8594.namprd12.prod.outlook.com (2603:10b6:510:1b3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Wed, 6 May
 2026 02:35:57 +0000
Received: from CH3PR12MB9194.namprd12.prod.outlook.com
 ([fe80::1e6b:ca8b:7715:6fee]) by CH3PR12MB9194.namprd12.prod.outlook.com
 ([fe80::1e6b:ca8b:7715:6fee%6]) with mapi id 15.20.9870.023; Wed, 6 May 2026
 02:35:57 +0000
Message-ID: <c0b160f8-2930-4158-9e50-b4cc4209e2ca@amd.com>
Date: Wed, 6 May 2026 12:35:42 +1000
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [RFC PATCH 04/12] vfio/pci: Allow MMIO regions to be exported
 through dma-buf
To: Xu Yilun <yilun.xu@linux.intel.com>, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org,
 christian.koenig@amd.com, pbonzini@redhat.com, seanjc@google.com,
 alex.williamson@redhat.com, jgg@nvidia.com, vivek.kasireddy@intel.com,
 dan.j.williams@intel.com
Cc: yilun.xu@intel.com, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 daniel.vetter@ffwll.ch, leon@kernel.org, baolu.lu@linux.intel.com,
 zhenzhong.duan@intel.com, tao1.su@intel.com
References: <20250107142719.179636-1-yilun.xu@linux.intel.com>
 <20250107142719.179636-5-yilun.xu@linux.intel.com>
From: Alexey Kardashevskiy <aik@amd.com>
Content-Language: en-US
In-Reply-To: <20250107142719.179636-5-yilun.xu@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SYBPR01CA0135.ausprd01.prod.outlook.com
 (2603:10c6:10:5::27) To CH3PR12MB9194.namprd12.prod.outlook.com
 (2603:10b6:610:19f::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB9194:EE_|PH7PR12MB8594:EE_
X-MS-Office365-Filtering-Correlation-Id: aa57daf3-eef1-4c65-2f5c-08deab1833be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|1800799024|376014|921020|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	2x0WuZnJ8fTf6tJifgznBJxzXjfoyqfIv5VGAP3yjpf7Z9NVgU0RWu8got/jJ60knKPHkct3OOz4fhkYqP2TFA8lb1XNYQq8xiIoUCw2PPULbr1hksYDG9Sta9H+qe5YRT4m1eIq99unITujO3rOGYo5OF7+yn49Yl4QKyq7vsoa4+8VRUBjT3tfRqPxvmqzcvkJgQRavYBlkF4RR76EjCbjBV4QcGrfpTONBRe+rEzO/MUpVcCsyE4vayqozm+dJzaRNS9qQ4mRRiYLgZ+IePjiBJXR1Z9VS2XuxMWkcNmohpEC+Ij+NywM95QeWtQrHF+3jlIz0z7DIjaisCFDoM5wq4goNn/geFD1qDYgcXlny+yL7uJxSmYhhB17IInO9stmTcs6jJKn05Y5YNYqS/gsZhg/ln2D2SMdA3g+W4bL1jQs9XNR//OIPJ+EBHNKjQ1O4pz8DCHkJtav/CT18WRaoJbDgPEj7+EdE2gjGvLWaBS+GB8+cAMN1lNTk5rOXKvc2+OPWiEIpbZebZPt+TazkiClnY0RLK0xkYndTj3fg4P6PwxNtv52GSNcXmYH0izNnhlRtHg5EWHzxjw7C/TOFZgbs2CTUt5vAAfbolt3Y7AQyjT20cguv6PGQO6/RCR60y098tJgdAfbTbPQ0LJtjWsWENTwN0/dJ2GKEwRP5M9c2vwYsI4/vy0VXESWnqUdL+tBdQdui/Koq6Uh6od6PAiXgpExvKuTxm6hXQ/BWstZOKRLNQxN7f+ZbknO
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB9194.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(921020)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WDdxelhYekw3TjllQ29VNDVoM2JUTks2N0t5S1MxM0dqTGRUK3BuMTRMVC91?=
 =?utf-8?B?Y3hDN296Q0tYdFIwSzdTbUFYZHFkNXFUbFFpRXRFcVgxYXlWZXZCQVVHRmFy?=
 =?utf-8?B?aUpXVTNMRHppVStOdDlwb25SOTlNOEVwZGJJMk1DcjFJeG9Ld00zcTZOWjBu?=
 =?utf-8?B?N25vNlVIS2gvMS9XaUtaTklJOHNOaUhEZW5XL1J4VmZEN2d3WGJ1OWdLai9O?=
 =?utf-8?B?RkswL01VK3YvS2V5UnFpL1FXQjVTdkcxSjVGZkVUNE1iQW81dXNFQWRhWDJp?=
 =?utf-8?B?S3ZwM1dCai9pbCtMc0V5NXRhQllSc2lFeUptdTBDMldmMWc3Q3ZZUE54Ynla?=
 =?utf-8?B?SU40QnFRZng3ZUZabkdBbWZ0eDVkZlZ4aC9zRS8wa0NqZmlzWGJNL2pYalRV?=
 =?utf-8?B?NTZzR0hnMWNsK1o2WVVjNEQ0d2VuZlRwQzhid1hXRkxkVzlzaUNyZGhpS0Ro?=
 =?utf-8?B?K3lkb0JaTzZPdXpheFJVWG8yQUU4aWdjbW9VR0VHcEdtaG5MUDQyVlBNRDdt?=
 =?utf-8?B?R1RlbVJUaDNGYlJDNldVUmZ0Vy9tdzhIRUYzSXFyWXRYblZYUHBuZ3U4YTlz?=
 =?utf-8?B?VDhFOGljT3QvUDczZTNpUk1FVklCZ1d3Y01MS1l6cEdWbS9RT1BOSGJ3UVNt?=
 =?utf-8?B?aXhKaWxuTjhMeHVyS1h5WnJmdkYwUUFHVWQ1K3JreVlyV3I4MFpQbVN4M2pw?=
 =?utf-8?B?blM2TkhRTWZDTVJQNFhDSEt2YjRUME5XTXhYUkM2cmw2NDRYQ0YvdUJLOTJ6?=
 =?utf-8?B?dXo5QzN3OVE2ZzhjWFpWOTN6NzJQSDMvWW5yUEJKQWVKRWFRdENVK3M0VGRS?=
 =?utf-8?B?by9nbDQxMnN6L0NVbStaSmNXY3JSLzdwQ3FQWW1TRVhuU0ZESDFUcjl2MG1q?=
 =?utf-8?B?ajhnY096UEU4dnk1d2IxVE5GZEMwVXZwTG81cy84NmZKdVM3TDFxcVhTQ3Y4?=
 =?utf-8?B?V0NXSXFlVDVxNGljL0hUT2gzWDNGbDVBR2x4a3pLMFpacDdNTHU0cDQrcE4z?=
 =?utf-8?B?MGt3WnFKODRyWm1ncHNTZWRSYTd2cTFDemdvTWcyZm93ZXZaR29VYmJrYnRS?=
 =?utf-8?B?OG85bTBDa0l1WW5ack5uRStmanB0c2xVTC9LQXhNZXJ2ODd3NlBiSXNoRWdt?=
 =?utf-8?B?dUVOUVlteXR3SDVFcUhab3RseFAyNnpJM0M3NFl6MU5xdjAydCtKbngvRWNK?=
 =?utf-8?B?dHFLcFZKYUxLRjJSWUkzNTJSeTZGbER4MWFSeG5qWjZ1My9BMSt4UTJHbXY5?=
 =?utf-8?B?NUNCQnR2aUNsdTN3YWZXRVdNSldzelZHaWxUNTFrNmZPYlR4c0plL3VmRnF2?=
 =?utf-8?B?R0RZRkk0ZnZIM3h3bXhhcUlJM2UrdGRVWXk2cFFkeXRBUUExa2xMSStjY1Iz?=
 =?utf-8?B?dUZoS2pVNXU3YS9UUnRwcnVlVUpKRlhqVWhsdTVxanlJZWxLZVpraG1QRElq?=
 =?utf-8?B?NzBpZ0FkaVNMZlhrVGx6Um5mUlJ0bW5PUjI5aUlaOGlSZ2I1S0llWnpiRXJG?=
 =?utf-8?B?UVl1eXNFNktlVkNHdm9jMHcyU0p3WWZXT1FtdW1wVmI3TTNiL21DbDhpQkg1?=
 =?utf-8?B?UXBaOXlVWDBmMUswT3RJK0JtRUxUWDc2WnhNUDRnK3JBdWFDMzk4Vk1KU1pz?=
 =?utf-8?B?YUNZZlNNbmVodGFCWnRQT1VRdjBJNDVjYUJiNmI2b1NzZ3R0dW5MSTBoK3FQ?=
 =?utf-8?B?dDVROVpJSGlqR1Era0VsM2JlaEExcElxYkQ4cFErelhDcmxCL04xbXZUdE9B?=
 =?utf-8?B?b3pVYW9hZHhWblZHWUp1dFcrSU41S1JUWnlHUlcrQVBhd0djV2xnUlZSdTg5?=
 =?utf-8?B?dzh2UlRXd2NtSWd5YVJjNktWNWRKbjBVcEszbnRnWDdxQk00UnB2enJNa2x5?=
 =?utf-8?B?L1JqWC82SHFCT0N1YkI4cHpLa280MTQyMlJ4TVV5aWFFUTNFSStvblcxSzM5?=
 =?utf-8?B?eXhBVnhnVGVBL3RIRnU4NVBPRENDYU5tTVdzbno2YURSSjZJUXQwYXFVRklC?=
 =?utf-8?B?bVZNWEVBZGQ5NGx4VkZ6S1pGTlFKZ2F3UEZJZUs5VWhhWitvbDdRc2s1cFo0?=
 =?utf-8?B?a2IyeWdQVHZxSjIrd2d6MkR0RkxCSHpDVU5DRzFJenhEQmk3QVR6Uk5ZVTEz?=
 =?utf-8?B?UHlTZEJJRGpmWHV3TEdMMWhsTkpIZVEvVVM5Z1RaVG1panNJZUtQbGhwMW9J?=
 =?utf-8?B?TFRjVndXQTNXNGtyZXBDSVljRnpsY0laSU9OQTBWYWhGWTE1d2c4ZFRRT0kr?=
 =?utf-8?B?bUI2R3cwVTg1WWNQU05kMkJGL1BiU0pramtkSzRxb1YzcHZoRUZpVmMvdjlP?=
 =?utf-8?B?cWN6OGxNRW90MTNudmdOQ1Y2YTJTWGhDcnRqdTBRZUZwaTY3NWpVQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa57daf3-eef1-4c65-2f5c-08deab1833be
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB9194.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 02:35:57.1438
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /OiGzxzQ+ZWNf//HqxwPlsU4EDdl1wJnxa+PdB/zLEo3RFDCql8eBQA7zhIbIlxB+K2FSYV2Laz0X8q0r8CCaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8594
X-Rspamd-Queue-Id: 15DA84D5B73
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60501-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aik@amd.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,amd.com:dkim,amd.com:mid,nvidia.com:email]

Hi!

Let's reignite this topic.

I've been using these patches + QEMU side hacks for 6+ months. And it's been fine until I got a device where MSIX BAR is in a middle of another BAR marked as TEE in the TDISP interface report. And no trusted MSIX yet.

Every time QEMU mmaps a BAR - I request a dmabuf fd from VFIO in QEMU. Since mapping of an entire MSIX BAR is allowed by default, VFIORegion::nr_mmaps==1 and it is an entire BAR.

Problem: KVM memslot mismatches the dmabuf fd size
How: QEMU emulates MSIX table and PBA by adding emulated MemoryRegions on top of the mapped BARs. In the QEMU memory flatview this splits the BAR into 2 or 3 sections (2 if MSIX at the start/end, 3 if in a middle). QEMU tries registering 1 or 2 KVM memory slots for regions outside of MSIX which fails in kvm_vfio_dmabuf_bind() as regions are smaller than the exported dmabuf fd (which is the entire BAR == 32KB).

Solution1: use QEMU x-msix-relocation hack to move MSIX elsewhere - end of some BAR (doubles the bar size so problematic for huge BARs like 512GB+), or another BAR (there may be no available as 3 of 64bit BARs is the limit).

Solution2: modify logic in VFIO dmabuf to allow multiple KVM memory slots per dmabuf. Now it is kvm_memory_slot::dmabuf_attach with no offset into the dmabuf and one kvm_vfio_dmabuf per dma_buf.

Solution3: hack QEMU into smashing a MSIX-containing BAR in vfio_pci_fixup_msix_region. Here is what it does:

0000380004000000-0000380004002fff (prio 0, ramd): 0000:41:04.0 BAR 4 mmaps[0] KVM
0000380004003000-0000380004006fff (prio 0, i/o): msix-table
0000380004007000-0000380004007fff (prio 0, ramd): 0000:41:04.0 BAR 4 mmaps[1] KVM

The problem now is that the TDI report must have the same split of the BAR as the VM is going to validate TEE (==trusted) MMIO ranges and this has to match the QEMU view. Harder than it sounds as the size of MSIX table in bytes is not exactly specified anywhere except the report.

Solution4: the above + modify QEMU to check the TDI report for not reporting MSIX+PBA where QEMU emulates them. The problem is that when QEMU adds emulated MRs - there is no report yet (the report is created later on, some TDISP witchery). So when the device is accepted - QEMU could reinitialize those emulated msix and pba MRs to match the report exactly so the flatview generates correct KVM memory regions and then KVM can work with dmabuf fine.

Any thoughts? what is acceptable for everybody? Thanks,



On 8/1/25 01:27, Xu Yilun wrote:
> From: Vivek Kasireddy <vivek.kasireddy@intel.com>
> 
> This is a reduced version of Vivek's series [1]. Removed the
> dma_buf_ops.attach/map/unmap_dma_buf/mmap() as they are not necessary
> in this series, also because of the WIP p2p dma mapping opens [2]. Just
> focus on the private MMIO get PFN function in this early stage.
> 
>>From Jason Gunthorpe:
> "dma-buf has become a way to safely acquire a handle to non-struct page
> memory that can still have lifetime controlled by the exporter. Notably
> RDMA can now import dma-buf FDs and build them into MRs which allows for
> PCI P2P operations. Extend this to allow vfio-pci to export MMIO memory
> from PCI device BARs.
> 
> The patch design loosely follows the pattern in commit
> db1a8dd916aa ("habanalabs: add support for dma-buf exporter") except this
> does not support pinning.
> 
> Instead, this implements what, in the past, we've called a revocable
> attachment using move. In normal situations the attachment is pinned, as a
> BAR does not change physical address. However when the VFIO device is
> closed, or a PCI reset is issued, access to the MMIO memory is revoked.
> 
> Revoked means that move occurs, but an attempt to immediately re-map the
> memory will fail. In the reset case a future move will be triggered when
> MMIO access returns. As both close and reset are under userspace control
> it is expected that userspace will suspend use of the dma-buf before doing
> these operations, the revoke is purely for kernel self-defense against a
> hostile userspace."
> 
> [1] https://lore.kernel.org/kvm/20240624065552.1572580-4-vivek.kasireddy@intel.com/
> [2] https://lore.kernel.org/all/IA0PR11MB7185FDD56CFDD0A2B8D21468F83B2@IA0PR11MB7185.namprd11.prod.outlook.com/
> 
> Original-patch-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>
> ---
>   drivers/vfio/pci/Makefile          |   1 +
>   drivers/vfio/pci/dma_buf.c         | 223 +++++++++++++++++++++++++++++
>   drivers/vfio/pci/vfio_pci_config.c |  22 ++-
>   drivers/vfio/pci/vfio_pci_core.c   |  20 ++-
>   drivers/vfio/pci/vfio_pci_priv.h   |  25 ++++
>   include/linux/vfio_pci_core.h      |   1 +
>   include/uapi/linux/vfio.h          |  29 ++++
>   7 files changed, 316 insertions(+), 5 deletions(-)
>   create mode 100644 drivers/vfio/pci/dma_buf.c
> 
> diff --git a/drivers/vfio/pci/Makefile b/drivers/vfio/pci/Makefile
> index cf00c0a7e55c..0cfdc9ede82f 100644
> --- a/drivers/vfio/pci/Makefile
> +++ b/drivers/vfio/pci/Makefile
> @@ -2,6 +2,7 @@
>   
>   vfio-pci-core-y := vfio_pci_core.o vfio_pci_intrs.o vfio_pci_rdwr.o vfio_pci_config.o
>   vfio-pci-core-$(CONFIG_VFIO_PCI_ZDEV_KVM) += vfio_pci_zdev.o
> +vfio-pci-core-$(CONFIG_DMA_SHARED_BUFFER) += dma_buf.o
>   obj-$(CONFIG_VFIO_PCI_CORE) += vfio-pci-core.o
>   
>   vfio-pci-y := vfio_pci.o
> diff --git a/drivers/vfio/pci/dma_buf.c b/drivers/vfio/pci/dma_buf.c
> new file mode 100644
> index 000000000000..1d5f46744922
> --- /dev/null
> +++ b/drivers/vfio/pci/dma_buf.c
> @@ -0,0 +1,223 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* Copyright (c) 2024, NVIDIA CORPORATION & AFFILIATES.
> + */
> +#include <linux/dma-buf.h>
> +#include <linux/dma-resv.h>
> +
> +#include "vfio_pci_priv.h"
> +
> +MODULE_IMPORT_NS("DMA_BUF");
> +
> +struct vfio_pci_dma_buf {
> +	struct dma_buf *dmabuf;
> +	struct vfio_pci_core_device *vdev;
> +	struct list_head dmabufs_elm;
> +	unsigned int nr_ranges;
> +	struct vfio_region_dma_range *dma_ranges;
> +	bool revoked;
> +};
> +
> +static void vfio_pci_dma_buf_unpin(struct dma_buf_attachment *attachment)
> +{
> +}
> +
> +static int vfio_pci_dma_buf_pin(struct dma_buf_attachment *attachment)
> +{
> +	/*
> +	 * Uses the dynamic interface but must always allow for
> +	 * dma_buf_move_notify() to do revoke
> +	 */
> +	return -EINVAL;
> +}
> +
> +static int vfio_pci_dma_buf_get_pfn(struct dma_buf_attachment *attachment,
> +				    pgoff_t pgoff, u64 *pfn, int *max_order)
> +{
> +	/* TODO */
> +	return -EOPNOTSUPP;
> +}
> +
> +static void vfio_pci_dma_buf_release(struct dma_buf *dmabuf)
> +{
> +	struct vfio_pci_dma_buf *priv = dmabuf->priv;
> +
> +	/*
> +	 * Either this or vfio_pci_dma_buf_cleanup() will remove from the list.
> +	 * The refcount prevents both.
> +	 */
> +	if (priv->vdev) {
> +		down_write(&priv->vdev->memory_lock);
> +		list_del_init(&priv->dmabufs_elm);
> +		up_write(&priv->vdev->memory_lock);
> +		vfio_device_put_registration(&priv->vdev->vdev);
> +	}
> +	kfree(priv);
> +}
> +
> +static const struct dma_buf_ops vfio_pci_dmabuf_ops = {
> +	.pin = vfio_pci_dma_buf_pin,
> +	.unpin = vfio_pci_dma_buf_unpin,
> +	.get_pfn = vfio_pci_dma_buf_get_pfn,
> +	.release = vfio_pci_dma_buf_release,
> +};
> +
> +static int check_dma_ranges(struct vfio_pci_dma_buf *priv, u64 *dmabuf_size)
> +{
> +	struct vfio_region_dma_range *dma_ranges = priv->dma_ranges;
> +	struct pci_dev *pdev = priv->vdev->pdev;
> +	resource_size_t bar_size;
> +	int i;
> +
> +	for (i = 0; i < priv->nr_ranges; i++) {
> +		/*
> +		 * For PCI the region_index is the BAR number like
> +		 * everything else.
> +		 */
> +		if (dma_ranges[i].region_index >= VFIO_PCI_ROM_REGION_INDEX)
> +			return -EINVAL;
> +
> +		bar_size = pci_resource_len(pdev, dma_ranges[i].region_index);
> +		if (!bar_size)
> +			return -EINVAL;
> +
> +		if (!dma_ranges[i].offset && !dma_ranges[i].length)
> +			dma_ranges[i].length = bar_size;
> +
> +		if (!IS_ALIGNED(dma_ranges[i].offset, PAGE_SIZE) ||
> +		    !IS_ALIGNED(dma_ranges[i].length, PAGE_SIZE) ||
> +		    dma_ranges[i].length > bar_size ||
> +		    dma_ranges[i].offset >= bar_size ||
> +		    dma_ranges[i].offset + dma_ranges[i].length > bar_size)
> +			return -EINVAL;
> +
> +		*dmabuf_size += dma_ranges[i].length;
> +	}
> +
> +	return 0;
> +}
> +
> +int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
> +				  struct vfio_device_feature_dma_buf __user *arg,
> +				  size_t argsz)
> +{
> +	struct vfio_device_feature_dma_buf get_dma_buf;
> +	struct vfio_region_dma_range *dma_ranges;
> +	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
> +	struct vfio_pci_dma_buf *priv;
> +	u64 dmabuf_size = 0;
> +	int ret;
> +
> +	ret = vfio_check_feature(flags, argsz, VFIO_DEVICE_FEATURE_GET,
> +				 sizeof(get_dma_buf));
> +	if (ret != 1)
> +		return ret;
> +
> +	if (copy_from_user(&get_dma_buf, arg, sizeof(get_dma_buf)))
> +		return -EFAULT;
> +
> +	dma_ranges = memdup_array_user(&arg->dma_ranges,
> +				       get_dma_buf.nr_ranges,
> +				       sizeof(*dma_ranges));
> +	if (IS_ERR(dma_ranges))
> +		return PTR_ERR(dma_ranges);
> +
> +	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
> +	if (!priv) {
> +		kfree(dma_ranges);
> +		return -ENOMEM;
> +	}
> +
> +	priv->vdev = vdev;
> +	priv->nr_ranges = get_dma_buf.nr_ranges;
> +	priv->dma_ranges = dma_ranges;
> +
> +	ret = check_dma_ranges(priv, &dmabuf_size);
> +	if (ret)
> +		goto err_free_priv;
> +
> +	if (!vfio_device_try_get_registration(&vdev->vdev)) {
> +		ret = -ENODEV;
> +		goto err_free_priv;
> +	}
> +
> +	exp_info.ops = &vfio_pci_dmabuf_ops;
> +	exp_info.size = dmabuf_size;
> +	exp_info.flags = get_dma_buf.open_flags;
> +	exp_info.priv = priv;
> +
> +	priv->dmabuf = dma_buf_export(&exp_info);
> +	if (IS_ERR(priv->dmabuf)) {
> +		ret = PTR_ERR(priv->dmabuf);
> +		goto err_dev_put;
> +	}
> +
> +	/* dma_buf_put() now frees priv */
> +	INIT_LIST_HEAD(&priv->dmabufs_elm);
> +	down_write(&vdev->memory_lock);
> +	dma_resv_lock(priv->dmabuf->resv, NULL);
> +	priv->revoked = !__vfio_pci_memory_enabled(vdev);
> +	list_add_tail(&priv->dmabufs_elm, &vdev->dmabufs);
> +	dma_resv_unlock(priv->dmabuf->resv);
> +	up_write(&vdev->memory_lock);
> +
> +	/*
> +	 * dma_buf_fd() consumes the reference, when the file closes the dmabuf
> +	 * will be released.
> +	 */
> +	return dma_buf_fd(priv->dmabuf, get_dma_buf.open_flags);
> +
> +err_dev_put:
> +	vfio_device_put_registration(&vdev->vdev);
> +err_free_priv:
> +	kfree(dma_ranges);
> +	kfree(priv);
> +	return ret;
> +}
> +
> +void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked)
> +{
> +	struct vfio_pci_dma_buf *priv;
> +	struct vfio_pci_dma_buf *tmp;
> +
> +	lockdep_assert_held_write(&vdev->memory_lock);
> +
> +	list_for_each_entry_safe(priv, tmp, &vdev->dmabufs, dmabufs_elm) {
> +		/*
> +		 * Returns true if a reference was successfully obtained.
> +		 * The caller must interlock with the dmabuf's release
> +		 * function in some way, such as RCU, to ensure that this
> +		 * is not called on freed memory.
> +		 */
> +		if (!get_file_rcu(&priv->dmabuf->file))
> +			continue;
> +
> +		if (priv->revoked != revoked) {
> +			dma_resv_lock(priv->dmabuf->resv, NULL);
> +			priv->revoked = revoked;
> +			dma_buf_move_notify(priv->dmabuf);
> +			dma_resv_unlock(priv->dmabuf->resv);
> +		}
> +		dma_buf_put(priv->dmabuf);
> +	}
> +}
> +
> +void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev)
> +{
> +	struct vfio_pci_dma_buf *priv;
> +	struct vfio_pci_dma_buf *tmp;
> +
> +	down_write(&vdev->memory_lock);
> +	list_for_each_entry_safe(priv, tmp, &vdev->dmabufs, dmabufs_elm) {
> +		if (!get_file_rcu(&priv->dmabuf->file))
> +			continue;
> +		dma_resv_lock(priv->dmabuf->resv, NULL);
> +		list_del_init(&priv->dmabufs_elm);
> +		priv->vdev = NULL;
> +		priv->revoked = true;
> +		dma_buf_move_notify(priv->dmabuf);
> +		dma_resv_unlock(priv->dmabuf->resv);
> +		vfio_device_put_registration(&vdev->vdev);
> +		dma_buf_put(priv->dmabuf);
> +	}
> +	up_write(&vdev->memory_lock);
> +}
> diff --git a/drivers/vfio/pci/vfio_pci_config.c b/drivers/vfio/pci/vfio_pci_config.c
> index ea2745c1ac5e..5cc200e15edc 100644
> --- a/drivers/vfio/pci/vfio_pci_config.c
> +++ b/drivers/vfio/pci/vfio_pci_config.c
> @@ -589,10 +589,12 @@ static int vfio_basic_config_write(struct vfio_pci_core_device *vdev, int pos,
>   		virt_mem = !!(le16_to_cpu(*virt_cmd) & PCI_COMMAND_MEMORY);
>   		new_mem = !!(new_cmd & PCI_COMMAND_MEMORY);
>   
> -		if (!new_mem)
> +		if (!new_mem) {
>   			vfio_pci_zap_and_down_write_memory_lock(vdev);
> -		else
> +			vfio_pci_dma_buf_move(vdev, true);
> +		} else {
>   			down_write(&vdev->memory_lock);
> +		}
>   
>   		/*
>   		 * If the user is writing mem/io enable (new_mem/io) and we
> @@ -627,6 +629,8 @@ static int vfio_basic_config_write(struct vfio_pci_core_device *vdev, int pos,
>   		*virt_cmd &= cpu_to_le16(~mask);
>   		*virt_cmd |= cpu_to_le16(new_cmd & mask);
>   
> +		if (__vfio_pci_memory_enabled(vdev))
> +			vfio_pci_dma_buf_move(vdev, false);
>   		up_write(&vdev->memory_lock);
>   	}
>   
> @@ -707,12 +711,16 @@ static int __init init_pci_cap_basic_perm(struct perm_bits *perm)
>   static void vfio_lock_and_set_power_state(struct vfio_pci_core_device *vdev,
>   					  pci_power_t state)
>   {
> -	if (state >= PCI_D3hot)
> +	if (state >= PCI_D3hot) {
>   		vfio_pci_zap_and_down_write_memory_lock(vdev);
> -	else
> +		vfio_pci_dma_buf_move(vdev, true);
> +	} else {
>   		down_write(&vdev->memory_lock);
> +	}
>   
>   	vfio_pci_set_power_state(vdev, state);
> +	if (__vfio_pci_memory_enabled(vdev))
> +		vfio_pci_dma_buf_move(vdev, false);
>   	up_write(&vdev->memory_lock);
>   }
>   
> @@ -900,7 +908,10 @@ static int vfio_exp_config_write(struct vfio_pci_core_device *vdev, int pos,
>   
>   		if (!ret && (cap & PCI_EXP_DEVCAP_FLR)) {
>   			vfio_pci_zap_and_down_write_memory_lock(vdev);
> +			vfio_pci_dma_buf_move(vdev, true);
>   			pci_try_reset_function(vdev->pdev);
> +			if (__vfio_pci_memory_enabled(vdev))
> +				vfio_pci_dma_buf_move(vdev, true);
>   			up_write(&vdev->memory_lock);
>   		}
>   	}
> @@ -982,7 +993,10 @@ static int vfio_af_config_write(struct vfio_pci_core_device *vdev, int pos,
>   
>   		if (!ret && (cap & PCI_AF_CAP_FLR) && (cap & PCI_AF_CAP_TP)) {
>   			vfio_pci_zap_and_down_write_memory_lock(vdev);
> +			vfio_pci_dma_buf_move(vdev, true);
>   			pci_try_reset_function(vdev->pdev);
> +			if (__vfio_pci_memory_enabled(vdev))
> +				vfio_pci_dma_buf_move(vdev, true);
>   			up_write(&vdev->memory_lock);
>   		}
>   	}
> diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
> index c3269d708411..f69eda5956ad 100644
> --- a/drivers/vfio/pci/vfio_pci_core.c
> +++ b/drivers/vfio/pci/vfio_pci_core.c
> @@ -287,6 +287,8 @@ static int vfio_pci_runtime_pm_entry(struct vfio_pci_core_device *vdev,
>   	 * semaphore.
>   	 */
>   	vfio_pci_zap_and_down_write_memory_lock(vdev);
> +	vfio_pci_dma_buf_move(vdev, true);
> +
>   	if (vdev->pm_runtime_engaged) {
>   		up_write(&vdev->memory_lock);
>   		return -EINVAL;
> @@ -370,6 +372,8 @@ static void vfio_pci_runtime_pm_exit(struct vfio_pci_core_device *vdev)
>   	 */
>   	down_write(&vdev->memory_lock);
>   	__vfio_pci_runtime_pm_exit(vdev);
> +	if (__vfio_pci_memory_enabled(vdev))
> +		vfio_pci_dma_buf_move(vdev, false);
>   	up_write(&vdev->memory_lock);
>   }
>   
> @@ -690,6 +694,8 @@ void vfio_pci_core_close_device(struct vfio_device *core_vdev)
>   #endif
>   	vfio_pci_core_disable(vdev);
>   
> +	vfio_pci_dma_buf_cleanup(vdev);
> +
>   	mutex_lock(&vdev->igate);
>   	if (vdev->err_trigger) {
>   		eventfd_ctx_put(vdev->err_trigger);
> @@ -1234,7 +1240,10 @@ static int vfio_pci_ioctl_reset(struct vfio_pci_core_device *vdev,
>   	 */
>   	vfio_pci_set_power_state(vdev, PCI_D0);
>   
> +	vfio_pci_dma_buf_move(vdev, true);
>   	ret = pci_try_reset_function(vdev->pdev);
> +	if (__vfio_pci_memory_enabled(vdev))
> +		vfio_pci_dma_buf_move(vdev, false);
>   	up_write(&vdev->memory_lock);
>   
>   	return ret;
> @@ -1523,6 +1532,8 @@ int vfio_pci_core_ioctl_feature(struct vfio_device *device, u32 flags,
>   		return vfio_pci_core_pm_exit(vdev, flags, arg, argsz);
>   	case VFIO_DEVICE_FEATURE_PCI_VF_TOKEN:
>   		return vfio_pci_core_feature_token(vdev, flags, arg, argsz);
> +	case VFIO_DEVICE_FEATURE_DMA_BUF:
> +		return vfio_pci_core_feature_dma_buf(vdev, flags, arg, argsz);
>   	default:
>   		return -ENOTTY;
>   	}
> @@ -2098,6 +2109,7 @@ int vfio_pci_core_init_dev(struct vfio_device *core_vdev)
>   	INIT_LIST_HEAD(&vdev->dummy_resources_list);
>   	INIT_LIST_HEAD(&vdev->ioeventfds_list);
>   	INIT_LIST_HEAD(&vdev->sriov_pfs_item);
> +	INIT_LIST_HEAD(&vdev->dmabufs);
>   	init_rwsem(&vdev->memory_lock);
>   	xa_init(&vdev->ctx);
>   
> @@ -2480,11 +2492,17 @@ static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
>   	 * cause the PCI config space reset without restoring the original
>   	 * state (saved locally in 'vdev->pm_save').
>   	 */
> -	list_for_each_entry(vdev, &dev_set->device_list, vdev.dev_set_list)
> +	list_for_each_entry(vdev, &dev_set->device_list, vdev.dev_set_list) {
> +		vfio_pci_dma_buf_move(vdev, true);
>   		vfio_pci_set_power_state(vdev, PCI_D0);
> +	}
>   
>   	ret = pci_reset_bus(pdev);
>   
> +	list_for_each_entry(vdev, &dev_set->device_list, vdev.dev_set_list)
> +		if (__vfio_pci_memory_enabled(vdev))
> +			vfio_pci_dma_buf_move(vdev, false);
> +
>   	vdev = list_last_entry(&dev_set->device_list,
>   			       struct vfio_pci_core_device, vdev.dev_set_list);
>   
> diff --git a/drivers/vfio/pci/vfio_pci_priv.h b/drivers/vfio/pci/vfio_pci_priv.h
> index 5e4fa69aee16..d27f383f3931 100644
> --- a/drivers/vfio/pci/vfio_pci_priv.h
> +++ b/drivers/vfio/pci/vfio_pci_priv.h
> @@ -101,4 +101,29 @@ static inline bool vfio_pci_is_vga(struct pci_dev *pdev)
>   	return (pdev->class >> 8) == PCI_CLASS_DISPLAY_VGA;
>   }
>   
> +#ifdef CONFIG_DMA_SHARED_BUFFER
> +int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
> +				  struct vfio_device_feature_dma_buf __user *arg,
> +				  size_t argsz);
> +void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev);
> +void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked);
> +#else
> +static int
> +vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
> +			      struct vfio_device_feature_dma_buf __user *arg,
> +			      size_t argsz)
> +{
> +	return -ENOTTY;
> +}
> +
> +static inline void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev)
> +{
> +}
> +
> +static inline void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev,
> +					 bool revoked)
> +{
> +}
> +#endif
> +
>   #endif
> diff --git a/include/linux/vfio_pci_core.h b/include/linux/vfio_pci_core.h
> index fbb472dd99b3..da5d8955ae56 100644
> --- a/include/linux/vfio_pci_core.h
> +++ b/include/linux/vfio_pci_core.h
> @@ -94,6 +94,7 @@ struct vfio_pci_core_device {
>   	struct vfio_pci_core_device	*sriov_pf_core_dev;
>   	struct notifier_block	nb;
>   	struct rw_semaphore	memory_lock;
> +	struct list_head	dmabufs;
>   };
>   
>   /* Will be exported for vfio pci drivers usage */
> diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
> index c8dbf8219c4f..f43dfbde7352 100644
> --- a/include/uapi/linux/vfio.h
> +++ b/include/uapi/linux/vfio.h
> @@ -1458,6 +1458,35 @@ struct vfio_device_feature_bus_master {
>   };
>   #define VFIO_DEVICE_FEATURE_BUS_MASTER 10
>   
> +/**
> + * Upon VFIO_DEVICE_FEATURE_GET create a dma_buf fd for the
> + * regions selected.
> + *
> + * For struct struct vfio_device_feature_dma_buf, open_flags are the typical
> + * flags passed to open(2), eg O_RDWR, O_CLOEXEC, etc. nr_ranges is the total
> + * number of dma_ranges that comprise the dmabuf.
> + *
> + * For struct vfio_region_dma_range, region_index/offset/length specify a slice
> + * of the region to create the dmabuf from, if both offset & length are 0 then
> + * the whole region is used.
> + *
> + * Return: The fd number on success, -1 and errno is set on failure.
> + */
> +struct vfio_region_dma_range {
> +	__u32	region_index;
> +	__u32	__pad;
> +	__u64	offset;
> +	__u64	length;
> +};
> +
> +struct vfio_device_feature_dma_buf {
> +	__u32	open_flags;
> +	__u32	nr_ranges;
> +	struct vfio_region_dma_range dma_ranges[];
> +};
> +
> +#define VFIO_DEVICE_FEATURE_DMA_BUF 11
> +
>   /* -------- API for Type1 VFIO IOMMU -------- */
>   
>   /**

-- 
Alexey


