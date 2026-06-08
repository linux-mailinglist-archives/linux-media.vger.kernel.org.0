Return-Path: <linux-media+bounces-64243-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sJ2SCcMRJ2qtrAIAu9opvQ
	(envelope-from <linux-media+bounces-64243-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 21:02:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E77659F66
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 21:02:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b="GlbGM/KI";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64243-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64243-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 036C43062F62
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 18:48:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D041338B7A1;
	Mon,  8 Jun 2026 18:48:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010060.outbound.protection.outlook.com [52.101.56.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF3E349CCF;
	Mon,  8 Jun 2026 18:47:59 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780944481; cv=fail; b=C11XiInVw9obV4i4Tnz3szg4bPBSD5L8k0iu2B50DyCSPfdqSkQ1SGYA3zToaIUF+lyRL+73SCkI+f5W03G50OI7IdMEGecBg6CG4Y1HYUJmlvDUKK1bG1cpWOfomVyhNLd4+h8sNskQQCIq2UIxG5LZzMHPPDRqexlkxOqbCJk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780944481; c=relaxed/simple;
	bh=sUX2NzfoWQdkO0M1rM7GS3Ef0sRj/iqyX8f0nzghsWA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=anBcyyTjlAim73z59icg6qS5fBWo1Z2bIdMZOJPLMYF250g7UUk3vXkx6ig4+ZOUHbI1lzVE4NBr04Cj5qfVNCWb1DB/eYNoNa2jDxfBxConzv8dp4ZM2tqMdE7B3Xj8JV3xjktmahr+QTtBk73HcTwL1QIu9lzKvnueZmx2pmc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=GlbGM/KI; arc=fail smtp.client-ip=52.101.56.60
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LE2JLxIqEE6bOyhepXOOKRoaSrG2bQKqDlBnAucSgbluZ2lnJe/8G/BfdxwCvXWA1kofS8CWxe4s0sIhJU/fHjHYS8a7I579Yw26hlnuYP2sPA+F+GGlci+hBnlhysTFu4NhH48gpsxnIENn2az/+SJ8hyVWIc/pqWqO+vKhIzq+6qK/xSM5Be4h/TPF/0XI3QKe4nu/LnrVJtanfTSPb11gbMk4GV+L1detcCSir57jXuaa7DwupkHFzZZROSa8DOiHdvpi0MoHO7qsCClkDn/qoc+oYYTdefdml3s14147wzI6pzaI+h7j1vBXJh3f8ifYt0Zpy+3RtsP81bLS3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ahY0uBk5tNDGWAQkUV29VHaodbjseY4aPBd/YJcXhg=;
 b=TiRTySh7BDAaSt0WKmt6eD7NUh0be/gJPA0CLB5/xprkj5YZ6d1KLfHkP/Lk3YgHjZc2YbMiKTUCFOfDeWCWzaD7SOZlQpPVLhMpLjd3Jqcqh8PXzPF6B+a0CxEvmuBUAtAcG58m2++27oaP02zNqUME2q5S7ukiyGRt4bxO2jVxhk1/cqrVa58/ZE05MbDVMt23gQ5LO7eEmOTJgl8gdjeIHaOqnLFyypvMyxJj6+zgzwhkcKH4kNDHn2fAtsW1n3WKbFALRMWQ1p1f6h8W40ennJ6QFehxmFVqZpW2iICAczztnUqhfb8pcJYJXq4UfpCYk/maFFqMQdzuUD+p/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ahY0uBk5tNDGWAQkUV29VHaodbjseY4aPBd/YJcXhg=;
 b=GlbGM/KIfpF3En+UYLRMRNCz6ozsnSSEPlZG3AbpTs73gQRx/U35Zki6ys1KLSh2Jv6jMXeus1iHWcpHVP54vYgw63Uhi0eYntZTpLoEoSQF/WziXoNYmwp+RLbKNVm2/IFTQRIIgZ+MF4GRDSzvh7P9bpEoFCuHpnKZFpqLpc4=
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA4PR12MB9785.namprd12.prod.outlook.com (2603:10b6:208:55b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 18:47:56 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0092.006; Mon, 8 Jun 2026
 18:47:56 +0000
Message-ID: <c8564ea0-8ff4-4049-996d-bd978c478372@amd.com>
Date: Mon, 8 Jun 2026 20:47:51 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] dma-fence: Fix races of fence callbacks versus
 destructors by locking
To: Danilo Krummrich <dakr@kernel.org>
Cc: phasta@kernel.org, Sumit Semwal <sumit.semwal@linaro.org>,
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
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <DJ3VYD71HDQ2.3C8GG983Z2YCM@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0125.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA4PR12MB9785:EE_
X-MS-Office365-Filtering-Correlation-Id: 53a79ac8-2258-4c56-6c88-08dec58e7446
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|22082099003|18002099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	usALKeMpjvUdHdpCOyZfdcwKfcqWG84UZHm9U3N6WwX7A47evIwuCwIPsrr6rKb0x5FxbJ2km8876xEXEhMB3wiKAeszzx776E+hHIQh5UVR49t2gbXRDvEBmp+tXYagcSzsNnTYcSNGD8rB8No2iutxOEiRNVc0EHZUXBWrmt8MtRdNyMGrI3q92gn+lRbevxVncnfKLzOepFVpTMECGem+kOkF15n0WqBdxvB7JB+qCcvggC5dVEYv4arCxYdZ0PCsePkT68rVpkiK7gtsxUh9zHYH1OxokuPDkZzOdObPTFJu4KSDLxMc2k3dsB+hb00XT8YZiyjqzYd452Hq41FyTIvqphz6YEiadV8ZF8cFYdwvPzad5LzKhgzqLqaogjsb6WK25gOuNSqB2eusMRB+L/3CPn9gbJXH9af7g0dcxmkYbofbm8TEX80hceNYcqvh9Jnzwb3p5TwNIVYJWLl2NE/PHJ/mMd48+GzxV074sakb2vzJvW7o6WVQHTtE86K/cxc8ebCYpQ0j+GDJSHL8672N8DLpH7+9JmiAKb5n8EwmlcPfLyVyMg/ruWjqsb+zAt97cUeoLMKFJfoprWbc/9LTzVgWEmlzIXTZ6E4q0V0n1ztX5Vz9ixZseghsbCxKHe+y8+H5rw+avGFr+mgW53twUYZVOUNluL1R8xPvhv5lPHxBnuu6AdoGn99+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UWFVL1hRaXJ3Wlh3Yk5YM1UzM0JDVzgzejFxZW5xSy9TUjgvdmpZbXVFWE15?=
 =?utf-8?B?NVJPUjEwak93bkNCd1pYblFCdGN1VVNlVkVMUHVkOXBkYzFpaUhINWRJQlNp?=
 =?utf-8?B?SnYrYTBqd0htaFJHMDNQRStaYTZWQWFKSE4wZHd3VXVYY05aTXM0NjBoUCs4?=
 =?utf-8?B?VmZwbHlnbFgvU01VeDU3anVFNWVyTmhIVlVOQWxreVFtT213eFVwaUJFZWJB?=
 =?utf-8?B?UFRHQjRnUEFaNWZudmFqS0dBeU9XTXpTTmduYXJSa1dyaWxkMGhCVTRkcFE5?=
 =?utf-8?B?cmx0eGw2Q09GRmtFa0NSakE5RTh2Zk1mVnZscXJhQ29aWlFCK0ZvYWk2S3Va?=
 =?utf-8?B?dTBLTmVGUkJBQjBCcFU4VjlEaUx2WjB4STZnRkNtMlZWWHpJaDBMdnpINHhX?=
 =?utf-8?B?M3JoZkJ2RnM1cFpkUk1XenRrTjZQR0U3RTkxQndDdXpmcTE4TkxRSUVlTXVi?=
 =?utf-8?B?dWFZU2JDalhVNUNUS2Mwb29xMDRWL3BZeDEzTnpjN2xibEZZY1JxR2FyTGJC?=
 =?utf-8?B?cTRCVkUyVm1jQ25ucityT2I4NWRSRnlWemtPVGdEdHRINTFGTjVBZjJoYkhi?=
 =?utf-8?B?REw2STFtOHRkM3BPVisra3ZOYktRdWc4a29EcHhGUy9LVnFlWXU5QUx6cUJQ?=
 =?utf-8?B?dGxmb3lFa1duMWtXZGpEMVBZZDRBYTgycExkcGJvcE93NGRLSFl6bk1jWDk0?=
 =?utf-8?B?TWxzbmlDWUh1ZS9lZkd5L0FObzM2QVM2czVlekFHdFlXaEE0dE9QeENidVhZ?=
 =?utf-8?B?QUZ1bEZUTWEwcmg0YmwxQmRNMm1jQmlxcnVnRFdSUEdReDd5enhWenNzVmR6?=
 =?utf-8?B?MXpVU1A4MFp3d1Q3QmxIM3AvdVA5eUFhaEFqU2IxeEc0YlFpc0M0VURoRTR4?=
 =?utf-8?B?VDdaS3NhSkt1MUpEbDNGamtLMEZzREI1a1Jub1kvajI1VSsrb0E2b0hpM25T?=
 =?utf-8?B?SnFrODkrcnpKaktGbDYydXZyYUNKaFNCY081akVaeVhRWmJHRTR6b1hja2tJ?=
 =?utf-8?B?K3Z4ZEZmZzdFWlpMakl4WlUxTGZzN0s2dFE3QVVNUEFpN3FDWWhjeTRsckNp?=
 =?utf-8?B?TllMdnVNQ1VrZStOQ3ZXckNDME5KR0d1MmpoTlk0Y2p3MVJGa1FhQlNhUzZu?=
 =?utf-8?B?NHBYdmNQUkVjc00xSXRDTVZEK09UdzZXR1JsYm5tV1BYbkpDR1QxRENHa3lJ?=
 =?utf-8?B?b0NSTlNxcnUyZGpjVElHMyt5d0Y1b1h2QlBCckpmRVF3Tk9mbDhORUp2dGhS?=
 =?utf-8?B?QXpQbXhzbVAyYklSclNNQzQxc1VLc0wrSjJDVElMV1ByK2JmSzNjSTBlL0ZO?=
 =?utf-8?B?bVpRUHFBNlBuUmsvR3YyYkVxZEpRZmtDbXVMa285Nlcya3RHVlRWNTRPd0Vt?=
 =?utf-8?B?Ry83T0V1WmhMTHBVbnFWWDMxWlpuSWNFcFIzS3MwUnFzLzdOOGdCbCs5QVBr?=
 =?utf-8?B?VGFoTEltMXNXbXlHY0tUZityc2VnM0lZWTJ3MXpBS1ZDdmIxQkJ0R0RQOHcz?=
 =?utf-8?B?RzZ4b3BVWk1Ed3JiVXZ5cGs0VGd1dm4vU1NXazlHU2syNmFheDZnVjd1K3Fa?=
 =?utf-8?B?UVVIaFovSjFEcVZuSElmSFFJYTZWSlJucng4TlZvRE1WRWtxWjNhWWNuZGFQ?=
 =?utf-8?B?eVRsTWtxeURIb1Ztc1kyME5kU0p0ZnBxSGhrSThjTFpVSlVjbkJnVUJqOUhp?=
 =?utf-8?B?TmpJUkE0eFpEeFVDYldPNFRSK2trNlZ1RmZISlZYVU5oazFHU09HRE5uYWRp?=
 =?utf-8?B?Nnd0ZDN6Ni9mcDVBRGtacFJUSkVSVU9UdmlnQlNaeHVZOE5oYWpzNnEybmpw?=
 =?utf-8?B?UUhUd3RxSE1UVzBJS0R5eHh0M1lwMEhUWEZBQUVyVzdta0RXcE1ZeTF3dkh4?=
 =?utf-8?B?ckJDRnIyaWN5VGN5UTd1dllWT2x4dndZNFlEVlJxeXlnKzR1Y083K0RzeEla?=
 =?utf-8?B?SC8rTEM0ZUVYNy9EVDl1T2N0cXJ6dGJ0bS9qc0h5YXhkZm5IWElGU29oY1Rk?=
 =?utf-8?B?M0xrL0luamdpWmVicDRXa1IrNUNsNEo2dDhZVXFEUGFyUmZqQzZMSzJBbGo3?=
 =?utf-8?B?cW9ibVo3V3h5MGZLNjNhZW9ibXhWL1dLMXhvQWFVM0JWWW5Tb21TNEFqanEr?=
 =?utf-8?B?Rmtkc3U4K2RlNFNFMjJHTlJrcGFNZVIyLy92b1NrTU16UXFYVjdnZ0p0Zmxz?=
 =?utf-8?B?QWg0UWlJWmFqWlR5cTcwY0VCTkl4U2E2dHhNWjRyT2d6ZzZhZjNCVXcxT05B?=
 =?utf-8?B?bnVGbnZTamFqdDZwL3U2clV5QmV3RUYvdDFkQXhXdlpLWXAyWUh5VWJScWlV?=
 =?utf-8?B?NkVCSGFQdkJ1OWNIZTVMZ0lNc0xhTTh2aUpTeGhVNWdrOTBFYzBSZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53a79ac8-2258-4c56-6c88-08dec58e7446
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 18:47:56.1296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1oi0VPp1qw/MDzYPMohPHjiw/hJRRoZIKzOBSRnb0EQmsbjKpAeuUl7xaZTkH7HV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB9785
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,collabora.com,google.com,gmail.com,garyguo.net,igalia.com,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64243-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:dakr@kernel.org,m:phasta@kernel.org,m:sumit.semwal@linaro.org,m:boris.brezillon@collabora.com,m:aliceryhl@google.com,m:dwlsalmeida@gmail.com,m:gary@garyguo.net,m:tvrtko.ursulin@igalia.com,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:mid,amd.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 72E77659F66

On 6/8/26 20:39, Danilo Krummrich wrote:
> On Mon Jun 8, 2026 at 8:32 PM CEST, Christian König wrote:
>> On 6/8/26 19:59, Danilo Krummrich wrote:
>>> On Mon Jun 8, 2026 at 7:34 PM CEST, Christian König wrote:
>>>> That's why we need the RCU grace period to make sure that nobody is
>>>> referencing the driver stuff any more.
>>>
>>> Right, and that's what Philipp tries to address, the requirement to wait for an
>>> RCU grace period is perfectly fine if it is only about freeing memory, but it
>>> can become painful if the fence private data contains data also needs to be
>>> destructed in some way.
>>
>> Yeah that makes sense.
>>
>>> IOW, if a driver signals a fence, it is lifecycle-wise reasonable to destruct
>>> the private data that is no longer needed (remaining users only deal with struct
>>> dma_fence) and having to wait for a full grace period adds sublety and
>>> complication that can be avoided with the proposed approach.
>>
>> Yeah, I've run into that when I tried to make the amdgpu fences independent as well.
>>> That said, I'd like to ask the opposite question: What are the concerns with the
>>> proposed approach over (pure) RCU?
>>
>> Well a) locking inversions and b) performance.
>>
>> For example the reason why we have the dma_fence_is_signaled() and
>> dma_fence_is_signaled_locked() variants is because there is a measurable
>> difference in some specific use cases for not grabbing the locks.
> 
> I checked for this as well, but couldn't find a case where
> dma_fence_is_signaled() is used in a way where it would be performance critical
> to avoid the lock in any way.
> 
> Note that the lock is only bypassed when the fence is signaled already (this
> would be preserved) and if signaled() returns false, i.e. dma_fence_signal()
> will take the lock anyways.
> 
>> I personally find those micro-optimizations rather questionable, but the
>> community agreement is that we should have them.
> 
> I agree, it is rather questionable. So, I wouldn't make this the deciding factor
> unless someone can present a valid case where it actually matters.
> 
>> So my take would rather be that the dma_fence_is_signaled_locked() variant
>> goes away and we consistently call the ops pointers without holding the
>> dma_fence lock and the driver implementations can then optionally take it if
>> necessary.
> 
> How did you get to this conclusion considering that you run into what I
> mentioned above as well and the fact that we seem to agree that the performance
> concern is rather questionable?

Quite simple, it's the cleaner approach.

Calling callbacks with locks held is rather questionable even putting the performance issue aside.

In detail calling the callbacks without holding locks allows all implementations who need it to explicitly take locks in the order they want.

If you call it with the lock held you enforce the fence lock the be the outermost lock.

Regards,
Christian.

