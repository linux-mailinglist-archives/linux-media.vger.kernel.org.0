Return-Path: <linux-media+bounces-62465-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CMZnOGL8DmoSDwYAu9opvQ
	(envelope-from <linux-media+bounces-62465-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 14:36:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C665A4EB7
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 14:36:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 91C90309E1BF
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 12:28:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9B2C3C9EE0;
	Thu, 21 May 2026 12:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ed4Z80cl"
X-Original-To: linux-media@vger.kernel.org
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010002.outbound.protection.outlook.com [40.93.198.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918653D1A83;
	Thu, 21 May 2026 12:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779366508; cv=fail; b=s+S9mtkAxLS9UzP5Oxn2qv3yf6feLa8xr/CV6vhns6Tu5aReD+706CmtgP14SZMPTqyDGckMMJB45RGLsM+tn4GBVDe+nYBOenwf8MoaCZIH46YKnv1Bu/F9rcXOAPARbjzIsLC9+5Qd5h9pAsTcTjZlhxcI7UfqRtIM9O32tRU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779366508; c=relaxed/simple;
	bh=qzbLutj0IWydVatkLgnZtki7KUWFYp3FfJ6iwyB4IwM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=j9io16k88nwh3/o9x0idLsmzHOlsvHqGCt2fz/rrsLZlCWqRdMoZVMoj32H/phP+tXb93BV+T24DqLSMGtA3YgEAvXkBK5EvdmKJTnMFHlqe9XeQrmJwkB9/8Ej2672eekSXOuBl1nrDgK8qzr4EPlSSppGDcDPp6xf7a7uCX/U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ed4Z80cl; arc=fail smtp.client-ip=40.93.198.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dhW/jRE3sh0w1M+2Qfsha97IR38fo+xWylxgYH+L3Q5UKMVqo5CFnuQSvufRJ9iZevbnB0UcVkN5rRx8+85omm07uY0cPSIj4xg7VFEq8blUUXfo0l2KS4GZfB9mCUYJZugZpykJ89t4uEY3ZxcVPQm8PbzHwVn0xgIi4Cx+ziRYJNgsgJDdZxol8JiGp0MGC+FpFwKPjRROoUJK7f2jwMQF25yMtYetPpn3XTGAcTKo4Y6/YlQLpLffWdm1ELZQvKpOZS04p8FNRm2WMEi8GrqGxaVBRnf9/xlv4pLNaEZeWxAUj1UFyiYjwTuKuytk5Tp9Cb1e9USBncKWAq8s7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JQ3P1JU7gPxNE6tmfvhoojCYlaX8q1B127RCLIlF4XU=;
 b=jMeK1RJqABPN2utw0guodp8q0oHXpG/BdSzXqa3bDhWsQo7Kp/AWzUv3SNbNo7+Xty56x7wcq7KJ4WhmUqcKw8MF11CTTE5vKJzgmqPVfZcpk8r1uwY9QHDQtVVd9DyqW90/lqohLwecuy/5Jy4pwmA/WdcCZXoNKGgbr+MF8cX7FHKxLmsjZ6uq7pTwj56Zb5gf3W7IHCzyAo67eEkId1AyRgVnVcPJSgunISK3bdVCM8FNnDGzvcy9xTvuasSjH11fBgewdFMD5lSgH8IXJi7i6b8XE38BGXUVxIEe3KMN3TzNIQOj1rgwyEMjP8raxFWjuu1KTnb1dVnEP90vtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JQ3P1JU7gPxNE6tmfvhoojCYlaX8q1B127RCLIlF4XU=;
 b=ed4Z80cl2oCXKRYW4MZFRrsUcsp4wrzpuC6Z3GX5a7mTesiyx1DCKCbTOzVLRx8GqulWx6tO5zuIKbNMr5vUw9Bt0xvObD8gexzuLzA1lXnul5b5K39xfNr72vbZ7y5xTrBpr0B7MkGS+tHzjXLK5v8fI5aESX/K6Z4yXlQvX6o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA3PR12MB8811.namprd12.prod.outlook.com (2603:10b6:806:312::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Thu, 21 May
 2026 12:28:22 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0025.022; Thu, 21 May 2026
 12:28:21 +0000
Message-ID: <7b662fcd-3bcd-40a2-b014-d9ce36f6425b@amd.com>
Date: Thu, 21 May 2026 14:28:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] dma-buf: add DMA_BUF_IOCTL_DERIVE for
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
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260521-dmabuf-limit-access-v1-0-26c01e27365a@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0410.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d0::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA3PR12MB8811:EE_
X-MS-Office365-Filtering-Correlation-Id: 87abbc02-3fe4-4fac-de82-08deb7347255
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|18002099003|22082099003|56012099003|3023799007|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	0KiGsXu49oQkCLBhvUa0sm2/4+TlhVdev+yzycX4xY014ZqXzrNdIxPpxzwIODICBQcgaXE3SG6eMNMAtTXSSkKDuRDQdDaxoxVyjENrxlktKrEBr4x+5O2xnE2YismJ71MpcvFIjyrCSrEKE+MIY+XlS2X4z9SHbn0lfSHsCVHdX5s4lZuFg70ukxq0Ig7T8t9ErfMu0EK7PxxQ/p5y9iUNUSzc9SDyaliinyDONrO58kQ8idJXrhMx0BBHQW2OgUtsfGbXh7IyAcfOEc6PZPUx6SjcxiO+/MF/b1zNsOCfaHIlkokl02S++GzH6fScu3j7pX/UEKw0oBPbO1FwhlM/1xoE0eK7QBCXmu3xguE894cI35MDnIMXDWt1Mtmv74SNTATFgdP+gtnExkdFLio+aMRq0wseHjjYr5vwCwCPkQBgPnxYhhcMsCdnGTR0C/leH5UMhZYOeHpe+0qnkl25CFSh8e/3yC+1xWDRS4zJdniHsd1AtCa8A6y+ZdioTucS9MRi4zig+I2HGngC/FXBHemYiXVaYzFelrVI0oOvSa4zwf2Z6M5b/vOC2GIt1JwbBjBjG1jM4cDUhs2teKZnBNhtZGwPHqgRy1A2N69Rfr3qKNgxcKR0i/IgtYZsmiQQxMyzijBOFSqhXDrGD+RUK9JT+I9t78G2766n+bM3KNwr2hCTN3fpI4/Bui6u
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(18002099003)(22082099003)(56012099003)(3023799007)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bHdYMkFoQkZ0MStqQThuc3Z2RFNDYjJTSVoxaEhQZm5kV21JT2c5YlpXdExo?=
 =?utf-8?B?cGdPOG01SDl3MmhFNm5BaFFkVE51QTFOUmF5Q1VsS2Vra0RxUTIwUVJPRnY5?=
 =?utf-8?B?R2c1dnU4RUZ0cktudXVweElTbk41bnQzR3ozOE45aGhKYUhOZ0drUTJubXVM?=
 =?utf-8?B?SmtEUGRTUkpOWDBONE9QZjM1UHBDMFZadWtqYWpNOWNoMEU3aitidS9ST3VB?=
 =?utf-8?B?bnRBcERxaUxQMnp1a0lsSURubjBEVWs5N3VqM0VUa0NOZ0pJeDFQZ2EzYjgr?=
 =?utf-8?B?TUJ4T3AvSUdMODZrQTJlWmFhd0lmZzI0aXpGMDViVyt6bzAxQ1Zmc3FxWkVO?=
 =?utf-8?B?RkNURGE3cmNNVDJnREo2VzNDVGRJTSs5bWI1dU8wVnpWNVZIcmgwSEZlZitQ?=
 =?utf-8?B?bGFBYUxaV0loamk4c0xram9STlNVSXVxNVBUNWM2Y1R6SmltUGRTai9wVGJ0?=
 =?utf-8?B?b0hIWHZyRlBtb0VjeVdsdFA2L0piUDlNTmUxM3FhaGFMaEVpMEFXRVZUSW00?=
 =?utf-8?B?VTVvTlBjUjNieVZrcDEzUW9jS200eENYTHhPT0ZiME9kVUpGZ3VpVDVpbnN4?=
 =?utf-8?B?YWRDZHRyTW41L3BWMzFES3oyeXQ4aTUyYWJGaXd6SkpWb056U20xQk9ydzl4?=
 =?utf-8?B?MktOU2h6dFVKeDVTUFpXVUwyWlVzb0ZwNVlXUTByRmtFS2pDeDF6TThVVGs1?=
 =?utf-8?B?KzhJMFRLZEVDQTd6MDgvSWg3S1lvb3M1Ni95QjZKSERYZUg2dGVJMmxFZ25j?=
 =?utf-8?B?dE0wSk4yVTkvOXNvUzJEZUdZSFd2WXhpQUkvN0Vidnh1eFhYNXhDWXgyaTkw?=
 =?utf-8?B?K21CeXh5SWF3Z2hqSFVzMDhwOWxyVlpjU01CaXcwbVc0VytUVEppaDk4dURV?=
 =?utf-8?B?WDcwYVVtMFhmaUk4YXk4K3FMUE1jMFMxQXVEOGlDU1M1clJHZ1o5UHI1T3VR?=
 =?utf-8?B?WTEyTXFWMkYvbFhHaDhobVNGbDNETy9oaUdxc2Z0RzN6ZzE5NTJqRjBGSExB?=
 =?utf-8?B?OUFzYzhlQStUdXVvc0M1L096cGJ1T2RUdk1rbnIrSmd5T0hpK1I1RTAwZVd6?=
 =?utf-8?B?b2VjZkFIOFZXNEIxZS96WXFhM1YyZlhvY0NIb2JvV3piS01yYjZKZDJWR0l2?=
 =?utf-8?B?dlh4bVA4YVhNVHlBSTJNWmtoYXp5YitTaWQrRCtkb2RYZE9XUW93by9XVFBR?=
 =?utf-8?B?YVovSUdIVFhUZytuWmZEMllsNVgvWmV6ZkozdEs1VkY1Q2NpN2NvZlU5ZGdQ?=
 =?utf-8?B?VFdFY2JseGdsMytCZGo0LzlnRmNrZWdyUWhMWjVqWTZvZzk0RG5YY2o1dEtY?=
 =?utf-8?B?NElsRDI5alBJZEkvNHlPeDVMaUsxcmhNMXZSTzR1cWtPeWVGU3hQUWV5YnJO?=
 =?utf-8?B?U3ZlVW9QN0tJWjczTFVrc3hDdXJlc29DNkUrdmZJUzYyaDgzbTB6cG5lZWpo?=
 =?utf-8?B?WVBKMWRUUE5RME1ORTJyQVlCZVZDZEYyOEFZYW8yQnYrVHNUTEx0TnpydTQ2?=
 =?utf-8?B?NnRHcEdhanlUdklTa2Z0NzZSNzhGM0lma2ptM013S3lEQWNUdVJaYmZjWDl1?=
 =?utf-8?B?aktHWEJuMDQ1TUM1aXZQcjJFU1QxMVlKTkIwWmo1QmpFTjk1clUySVRCV0FB?=
 =?utf-8?B?TDdGQTVkRnBodi9oRFJId2tvWk53Y1BNb1VucFZlcFZLWWhHMUsvckMyd1pE?=
 =?utf-8?B?VkZicHhkeEZrd0NiTmtPSFRuUTdHNmNZZ3lHeW8yenlsWXNETWVLc1dQSWpF?=
 =?utf-8?B?WWsxQkdUSVJadjR2Rm84SU1hOEI5d09LWlUrdVZ5THVDN1hsWVR1NUZIYWdB?=
 =?utf-8?B?TXpMb25jOVBaRndpeTRZSXBvZXdvY2VaQkE5VmZCK0lranVwN2tpM0ptbWpt?=
 =?utf-8?B?T2F3aGJUTnh2bEFhNVU5enVFYk9LcGdqQ1RUK3dPVjBWdVJ4REh0VTlxUHYw?=
 =?utf-8?B?Q1hkVXBOVzBrOXpDUmtETXhlMWlxdUdUdWNCQTJvL2EwakdUNm9JUlZua3NZ?=
 =?utf-8?B?SUlCOFdnaTVLMFVaNEtFSmpmNXAvVFkxbTZIREZsa0sxL1R2RkdveGM1RENJ?=
 =?utf-8?B?dHh6eHNrVkVXb0VmWXlWMldLK01OMVdKNWJkMUFYY3M1My9GdVBzT2FNMGVE?=
 =?utf-8?B?dHpSUkUzQWxaU1UzNVhuMS9LUzJPTzhNanVjeDE1bzJhWkJuUHJqTkNUTjBB?=
 =?utf-8?B?RUdiKy85WXh0OWNlTEZSdmEvNTR0V1NxbW1uQUVKQWNncGVSd0V1Wk5HVytr?=
 =?utf-8?B?Tm11QUpiYTRWVzNiM1VqZG9WZ1pKSHRKekhqWU9qbzN6eWFFaVV2d2hIYllP?=
 =?utf-8?Q?OACEhQB8WzVDBhjMdT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87abbc02-3fe4-4fac-de82-08deb7347255
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 12:28:21.8877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UbypUtKrJKweMp9k0C+qqEue3j2vyYzHyW6hNHrxf969E8NigDVkRDkzOM7HivII
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8811
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62465-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 61C665A4EB7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/21/26 11:10, Albert Esteve wrote:
> When sharing a dma-buf between components of different trust levels, the
> allocator may need to hand a consumer a read-only view of a buffer it
> holds with read-write access. An example is a camera pipeline where the
> capture component writes frames into a buffer and needs to pass a
> read-only handle to a downstream processing component that should not be
> able to modify the data.
> 
> However, no such mechanism exists today. The access mode of a dma-buf
> file descriptor is fixed at export time, and the standard POSIX
> interfaces for duplicating or changing file descriptors (i.e., dup(2),
> dup3(2), and fcntl(F_SETFL)) cannot alter the read/write access mode of
> the copy.
> 
> One natural candidate would be reopening via /proc/self/fd/<N> with
> O_RDONLY, which works for regular files. For dma-buf this would fail
> (that is, if we were to add a new handler for open f_op) with ENXIO
> because the dmabuf pseudo-filesystem carries SB_NOUSER, which prevents
> the VFS from opening its files through path-based resolution from
> userspace.

OH MY GOD! This is the like the sixth time I had to clarify that in the last few weeks, I'm really wondering where that is suddenly coming from.

Creating the DMA-buf with O_RDONLY does *NOT* make the DMA-buf itself read only!

That's a really common misconception. The flag only controls if mmap() can be done read/write or read-only to handle cache coherency issues.

It is still perfectly possible for a device to write into a DMA-buf created with O_RDONLY with DMA!

So long story short there is not such feature as a read only DMA-buf, and putting read-only pages into a DMA-buf and then expecting that nobody can write to them is an absolutely clear No-Go.

If we would want to implement a read-only DMA-buf feature we would need to go over all the different DMA-buf importers in the kernel and add security checks.

Regards,
Christian.


> 
> Alternatively, exporting the buffer twice would produce two independent
> dma_buf instances, which breaks fence synchronization.
> 
> Therefore we add a new DMA_BUF_IOCTL_DERIVE ioctl, which produces a new
> file descriptor for an existing dma-buf with a caller-specified subset
> of the original permissions:
> 
> ```
>   struct dma_buf_derive { __u32 flags; __s32 fd; };
> 
>   struct dma_buf_derive req = { .flags = O_RDONLY | O_CLOEXEC };
>   ioctl(rw_fd, DMA_BUF_IOCTL_DERIVE, &req);
>   /* req.fd is now a read-only alias of the same buffer */
> ```
> 
> Permission escalation is rejected with -EACCES. The new fd aliases the
> same struct dma_buf as the original, same dma_resv, same exporter ops,
> same underlying memory; so importers attaching to either fd see the same
> fence timeline and operate on the same object. Access control for which
> components may receive or pass on restricted descriptors can be layered on
> top via SELinux file:read and file:write permissions.
> 
> A shared writable mapping (PROT_WRITE | MAP_SHARED) on the read-only fd is
> rejected with -EACCES in dma_buf_mmap_internal().
> 
> Two small internal adjustments accompany the ioctl:
> - __dma_buf_list_del() is moved to dma_buf_release() so it fires exactly
>   once on dentry destruction rather than on every file close.
> - dma_buf_file_release() is updated to call dma_buf_put() only for
>   files that are not the primary dma-buf file.
> 
> This may not be the best approach, but after considering different
> options and alternatives (as described above), we decided to raise the
> discussion upstream. Thus, we welcome any alternative proposal or ideas.
> 
> The series is structured as:
> - Patch 1 adds the new ioctl implementation.
> - Patch 2 adds selftests covering the new ioctl.
> 
> Signed-off-by: Albert Esteve <aesteve@redhat.com>
> ---
> Albert Esteve (2):
>       dma-buf: add DMA_BUF_IOCTL_DERIVE for reduced-permission aliases
>       selftests: dma-buf: add DERIVE ioctl tests
> 
>  drivers/dma-buf/dma-buf.c                          |  58 ++++++++++-
>  include/uapi/linux/dma-buf.h                       |  28 +++++
>  tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c | 114 ++++++++++++++++++++-
>  3 files changed, 198 insertions(+), 2 deletions(-)
> ---
> base-commit: ab5fce87a778cb780a05984a2ca448f2b41aafbf
> change-id: 20260520-dmabuf-limit-access-73261353841a
> 
> Best regards,


