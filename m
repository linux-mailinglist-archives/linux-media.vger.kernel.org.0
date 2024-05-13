Return-Path: <linux-media+bounces-11425-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC218C448F
	for <lists+linux-media@lfdr.de>; Mon, 13 May 2024 17:49:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B62C6283D13
	for <lists+linux-media@lfdr.de>; Mon, 13 May 2024 15:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1746A15443F;
	Mon, 13 May 2024 15:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b="m2efeEok"
X-Original-To: linux-media@vger.kernel.org
Received: from refb02.tmes.trendmicro.eu (refb02.tmes.trendmicro.eu [18.185.115.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3088C15442B
	for <linux-media@vger.kernel.org>; Mon, 13 May 2024 15:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=18.185.115.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715615370; cv=fail; b=Ak2q85kSTvaAtHSLAy+d8Ibta9u1mQtn+/wcT6FMse5Xi9hGQvQs3zrkjipwOGD7z35VHFZ8yGMVIP6b2GAs5Y9zys6/vkAgxg9ZLNwnRRrTuHyyagijZiAc3I5/iQjQPY/YsXX6Lu80fNoTZ/s+wY3JGtN0qyQ0hY4ChlXV3pQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715615370; c=relaxed/simple;
	bh=lUbskxD0MaPCvOToikqkRn+aTMFUUialJoF5KQXvhoU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Fy071RcziK9CUzfm6FM8VPfXGbc6xqIKoVsJzLzS/N/XCBuMs1PEC9v99MDtQLgZGdkz1OExIVNQnIJCwgV496l0aUNzWhzphCtQFI1UalPMWrYmU8vSdCR//C1Vs3suOfdE5fRX4j6yZhF0Qx71grjUS+oS59jLb4m2Xte7bKg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com; spf=pass smtp.mailfrom=opensynergy.com; dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b=m2efeEok; arc=fail smtp.client-ip=18.185.115.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensynergy.com
Received: from 104.47.11.168_.trendmicro.com (unknown [172.21.19.56])
	by refb02.tmes.trendmicro.eu (Postfix) with ESMTPS id B6D2510052305
	for <linux-media@vger.kernel.org>; Mon, 13 May 2024 15:49:24 +0000 (UTC)
Received: from 104.47.11.168_.trendmicro.com (unknown [172.21.199.142])
	by repost01.tmes.trendmicro.eu (Postfix) with SMTP id 1C6AE10000077;
	Mon, 13 May 2024 15:49:17 +0000 (UTC)
X-TM-MAIL-RECEIVED-TIME: 1715615352.232000
X-TM-MAIL-UUID: 383ab084-5df8-4192-89fc-2df913849045
Received: from DEU01-FR2-obe.outbound.protection.outlook.com (unknown [104.47.11.168])
	by repre01.tmes.trendmicro.eu (Trend Micro Email Security) with ESMTPS id 38F3010000312;
	Mon, 13 May 2024 15:49:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CvbQIslauqwlJVRSwhAVqLuHJ5L7F++1rmWEU/1FQYfJ4DNRnli1MjQgjSRNqTYlW213LifoCyYlKrOlxAwouYtEKnQDtNpXv92GdnkoTfxbVuC7QZbvIaZnV/PINs5RrdfhQk8i4XPVDQ64siiwMJyd2CR3PQ4bSgL87x753fTY4k9qVrmAHlPqvanOTS4r+AmPrYiJL2GtRAQPrGe9ZX9SB9O3O/69mxXmJI5Li5CEiZm+Sd6fAtUGUIDvDLzzeuvnPjN2rAnQaWnCYjFV16NJUOxBeXaRhmqMQ2NM/Uox+FmkYJ0X8N+APY6gujMHdmlFdHpuOtTsNMKzveuTSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mwLHl/giKx+cmdIJLI8juGSIDVMY7iAODLc0Y87ZJHI=;
 b=K9d6+hRzEYJ4K+8PaRVU1RON0WzAazsr8GON1PJ0hyEjKCkyQnExnNa/4O4r4oHS20E8ZnkYnLgbmlLGKoahiVv+oLfl/huXTE7LLYdpLkt16MJKa8MxAgV4dcbennVjeSdXtRdbm0EWOVq9DV8Fmm+4bHxG/LDQ9GO7DSts5kbNtcpzh0t4dKzvLk8dHvwrYlXB5jD6IiSS+XvIhTO0/2vMth1e1sNGNZtTN2ZNhl+RWrEiJA9lH16fbL28aCqlgkJ46RUWacSAqVxrk1UgB42tSE8DbVV2ECAPpvehBgZPCUbipDpMhJOte+6DpJRZFe9+joI7DRjtFnEFa8mzOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <9dd4eb98-943a-4167-9fed-fff360d29727@opensynergy.com>
Date: Mon, 13 May 2024 17:49:07 +0200
Subject: Re: [PATCH 0/1] virtio-media: Add device specification
To: Albert Esteve <aesteve@redhat.com>
Cc: cohuck@redhat.com, alex.bennee@linaro.org, changyeon@google.com,
 daniel.almeida@collabora.com, mst@redhat.com, linux-media@vger.kernel.org,
 eballetb@redhat.com, gurchetansingh@google.com,
 nicolas.dufresne@collabora.com, acourbot@chromium.org,
 =?UTF-8?Q?Matti_M=C3=B6ll?= <Matti.Moell@opensynergy.com>,
 virtio-comment@lists.linux.dev, virtio-dev@lists.linux.dev
References: <20240510134317.3201746-1-aesteve@redhat.com>
 <8cfa0b14-7415-4fc9-be0b-dac36467eed6@opensynergy.com>
 <CADSE00K8mSWXkuDTg_33rjNTbpt-azL3_qWDPkQ+ipBVFwSSmQ@mail.gmail.com>
Content-Language: en-US
From: Alexander Gordeev <alexander.gordeev@opensynergy.com>
In-Reply-To: <CADSE00K8mSWXkuDTg_33rjNTbpt-azL3_qWDPkQ+ipBVFwSSmQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0012.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::27) To BEXP281MB0183.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BEXP281MB0183:EE_|BEUP281MB3541:EE_
X-MS-Office365-Filtering-Correlation-Id: 96e821f3-9e45-499d-6470-08dc73643acc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|7416005|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QjJMSXc1VXcrOGE2dVVpTUtvdUVzN0tSNExYeVd0MHpHSmxodzJOUWsvUkFv?=
 =?utf-8?B?T3dpeFR3UW91QmU5VE1uSFBWYlRlUkUyWUVLYUJQSnNnZXFUU1E4Y2EzdWhE?=
 =?utf-8?B?eWtpbjRaN0ZkUTVnMjRFZ1ZmWURqKzFyOTVHMDRaSU9rWUtqUDlxNVpzNWxy?=
 =?utf-8?B?TkorMFhxc3NjL1ZPZXhzUkRqK0dRYlBpYUZRbUVEaHVXTkE2dml5Y3VtY1Ry?=
 =?utf-8?B?SE5tTmh3aTBEbXdGcnZjbUZnRnNuaEJQRmtoWUdYekdEa2tUaEh4TjF1RVBK?=
 =?utf-8?B?clJOQktUL0VQckI4TVhXd0E5Ri90VTF4TWFYaFNRTGRzUjNGbHI2eUpaM1Qx?=
 =?utf-8?B?UzVvaGlzT2tPb040WEprNmdhWHhyaG80bTUyK3B3cUo0bndmNzcyV084bWhU?=
 =?utf-8?B?d1hJbEg0bTVQRllLd2VhN1BKbk9ra2Nkc3RtbnpuNkZLTGZKSnZRdFBYQ3hN?=
 =?utf-8?B?OC9QWEUxQjhlRzZCUDRWTHZ5eUQ0YVNZanJkb01ZZzN5MHE3RUs4Y2xzSDBt?=
 =?utf-8?B?bkdrUnJNbGZrWmVmS1RhSEc4YUNwRzQ4d2tFaFlwSkVXQTFBYm9qSFp0WC9Q?=
 =?utf-8?B?UG54Nms1dUJqWEppdUEvYnFMdkR2bGJwbTc3VVdrWG9IOTVmUklmREdRbmdk?=
 =?utf-8?B?bUgySUlWMll3aFp3b2dWellwaitSNXFRclpFckpzYTlzeDBLVXRZMGQ2SVQ4?=
 =?utf-8?B?TWpHRndBVzhvS1k2THQ1dlhuSHBMamNuZlFMVWd5TWFRUjlPZW1UZGRxb2lZ?=
 =?utf-8?B?RExNZ2NXSWdsVktEbmxOdWdtTG02TU1XOHBWWE5NbEdJNytYUWttVHZvaDRY?=
 =?utf-8?B?dkY1cU9jWXpEc0srN0xMWG13QU9NMVlsaHNYOExKVHptZmlObG43Y3V0cHhJ?=
 =?utf-8?B?N20rQW1RRUl2ZFI2aTdIN1NtUmx3NWtLZFFocWNmbFg1UWZFTHBZSTRMSm4y?=
 =?utf-8?B?Si92TVdwNlNPa295SGZZTHRLNm1tN3U2UXFFQlRBK0dxL0c3RkRxVENGMmha?=
 =?utf-8?B?b2RPbkEwcEtkWGFFN0h0K2JzWTd3NjNyaUk2UXlsV293MEs5TkFKM0Zpd0E1?=
 =?utf-8?B?MVN5SFJZYlc5ZEpwVTVBeWNKUTYzOFRpaVd2ZEw4WG80Y3AvU21zSHJUR0Fv?=
 =?utf-8?B?QjR1L2RVY2RGM1JiV0QwUW9PQ0psNmo3RmE2QW0zVU1pRExnMnM2NUt3bFVJ?=
 =?utf-8?B?YmY5QmticnUveXc4OFRzSUJyM0RCays1dUR0TXBLVU81M1JnOWFJdnExQjk2?=
 =?utf-8?B?TkVzWTZCTmZ3V243SmtpZVF1SDk3RnJtb2xOS3NUWGpRclpub0dURTBDZjFL?=
 =?utf-8?B?ZVlqeVdjOW1hYjF3S1REUEZrZkw0QmNtQTMyL0tDUzZzUVZzbUNIRERabDYr?=
 =?utf-8?B?TXFkWFd1dWFwYjE4RnBYNUZyclhYU3dyd1MxTmZUdkxsWDZ2RVBpb2lvN3hV?=
 =?utf-8?B?OXZzVGluVWd2azI3UXgrczh6Zm5acUl3WnB1WWVDV1BiSmpicDZNdUtwWUxV?=
 =?utf-8?B?NGl3YkxLejFoTUs0V0k3TnFKSmsyaUlnb0RZazhGWEtzSzJ2T1dJU051cWNm?=
 =?utf-8?B?anZvdWR5MDFZZzZPY2hUSzBybG50Smp4bzFFT21IbERFKzBNWlZsMHNIQi9C?=
 =?utf-8?Q?dOiAwKBVzla4f0kmqp3ggdP1MYqOBEq5b9y5BKryYgcQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BEXP281MB0183.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(7416005)(1800799015)(366007)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0cxd09zTm40bXhJdE56OUxRL1p5MXJZQTgzYUVadmFiMTdwZkFXQkNyNk14?=
 =?utf-8?B?SC9wTGJ0OTQzbnRQb1krcGNXdWVlME9yeG1KWDJEVklMTURqdGpkTFJWd2Js?=
 =?utf-8?B?YUoyOFozclVpcXEyNVhTSmV1MUJRVHVmbEovdVA1Ynl6MDVxL1p2dGpOSy9z?=
 =?utf-8?B?bkJMaXg5c1JmT1dKVS9OYWNPSHlhbC8yakk2ZU84dG9zTWJpUmJvVEh1Sy9R?=
 =?utf-8?B?VkdVV1FwcG4vd0hYUlA0d0VrUzFycCtHZVMwWHcwbUFQU0VYaWNzNGdzQTIr?=
 =?utf-8?B?Q1Rsb3RZNU5yQ2hZa05vRzUxVldvbzU5LzkrQXNtWUk0MUhTVVhJMUk0VlpF?=
 =?utf-8?B?SGw3eGZ3QTU2TTVXL1l2QWIvajVPRHJ3Rm5PYjZTc1FaSTdidktjbGF0NXQ1?=
 =?utf-8?B?STFtVUs0a0NJSjE1MC9KQUxCZ2V4Qzl2Ujl1M1YvRHlUTDAwczBFbXgyU2Z5?=
 =?utf-8?B?WHVycnNzVTJRTU4ySWhZUHR6UlRwck0zdkxKcXl4T0VoNDgwWEJTanVxVUpB?=
 =?utf-8?B?S2pORWZKVzM0V2dqcVlHakJpUEZCNkppL1ozY3NCOUFHRzFtQXZoR0ZBZjcz?=
 =?utf-8?B?dGpWdEhZdzdaYW1pdENpYldSekVUQkVQc2FUS1RseHp6QnFwaWNiNjR5N1JI?=
 =?utf-8?B?Ky9oKzBsZ1hkenZGQ3J1cFBnWmlvdkorbEZvbFVTTjdoUGEySFR6a0c4YTR4?=
 =?utf-8?B?UWozMFlhYkFtL3N6b3VvK2lpam00eFVXZlNFTXp3TWI1ZVNIYXNSajl3TzRE?=
 =?utf-8?B?QU5vRjlQaHNTUUlDNnpGT3B0dU1Ua2ZkeVVxYXc1SWxLaC9NQUdQRUVXeVAx?=
 =?utf-8?B?VlBXQkVwUUF3VkRNSHVXLzl1WG5OZzdDQ0tUNUx2aW55VytkZnA3dFo0US9S?=
 =?utf-8?B?c2pOb2kweVV0ZWdlVTFCUWhqVVVDbXREc0luSHdWUUtMbzlJNDZyanZGd05r?=
 =?utf-8?B?YzhEMEVlaElKQW5xblRaS3N3ZjlsODVkKzhpQUprS250d0tTdGtWYUJsdWpZ?=
 =?utf-8?B?SlQrM1gwUzFlMjV1WXoyOEdMcXV6Vm1OSVFqRlExV0VZZlhROWlFdGpFOGFL?=
 =?utf-8?B?RVZ0dXpPbGg3WDdCbkZFNGZ5OXd1MndFcCtSRkFqRk41eWFkWmtkZjBLNEpJ?=
 =?utf-8?B?TEZKcWpDRVdDUVduZjJCRmlUR2picG4ybU9XQkFKNFlKRVg3dXVFTHgxcm8r?=
 =?utf-8?B?cjRpUExic1BnTjRra3VpbGE0UEdrdUgxaGF4N0hneVc2NVBNbTdZcmlXMGpP?=
 =?utf-8?B?Y2RLYWg3R3R6alljZnlxcUVMWGlvM3Z6ai9MMzNGZzlkVXM4akhaZjZTT0E0?=
 =?utf-8?B?VDNpRzVhQ0U0ekFyUlJtVjh1V0ZLWkpQM0VHeS9lMmhURGl1eDZsYmZZcVVs?=
 =?utf-8?B?MW96SHJvc3VRVUxLSUY3MjU4ckJ5b1hET2pKY3kvMGMzOUw4d2RqMkFNVlZy?=
 =?utf-8?B?aXE5TTlCU3VCOFRtbTVzNWxjc3o1ZFE0Q3kyUEdYdjd0NGluVGd4ZDRocDhn?=
 =?utf-8?B?eTdJLzVTUGc4VFpSbW1DYjZycCtoWXZQNzd0cmRVYVVrWFVhc3ZldGdhdDR5?=
 =?utf-8?B?NHMyOE5USmU5eWQzV095MTBYYWpRTDV5YjJqVHNYZkU1alJjS0xORStHelBw?=
 =?utf-8?B?SzlEek9saVlFNXIvanUzUjBRbHZNUFBQS0xrMDAwV1ErdkVYbndqS2dTL2ps?=
 =?utf-8?B?SGNyRS9XU0RESE44V3ZtZFlmTG5lTE0rYlBLTEVKaGNzcXQyYnpjMGlBelBR?=
 =?utf-8?B?MHRoK0FNRjJXMFFPUit2SURuaTZQYjVsUWJvZzgyR1l2d1k2N1E3QzdIeGxq?=
 =?utf-8?B?d3JCcUQzOE95WDlkT2oreWFyeEdMcyt1TFJCSmNMRXJCMUMxWU4xSm9VVnNQ?=
 =?utf-8?B?N014Q2gvODdBSkluZ2toMVJGZ1N1aVVGdnJxdW5oVVBHaStWYldyWjJscm81?=
 =?utf-8?B?Y3prZno5a1FUUU5uZEFmdTRhaWRFRGovOEltdWFzQzA0aE01ZXhNeXNnNldP?=
 =?utf-8?B?TS9pQ05IOGVFanRnNHJ0VG44QlNPVVNnRStGQWIwbDVoZmpWVTBhS1RlLzJq?=
 =?utf-8?B?SUUyb2dCNGZieVh2eDdqY3FhelMrZHBkME91RE1oYUZYNkVhajRVcDhlUkhC?=
 =?utf-8?Q?Ah8S4fEC0CqHF6OFdskiGGBMc?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96e821f3-9e45-499d-6470-08dc73643acc
X-MS-Exchange-CrossTenant-AuthSource: BEXP281MB0183.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2024 15:49:10.1712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IC0pRXau4wkyTOd854IrN69EHHKKxsVmiz4t7PyZvrOU7+aoMZAJC4nNxFICPm+lzfC39oNqL+Cxkum9ukajXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BEUP281MB3541
X-TM-AS-ERS: 104.47.11.168-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1023-28384.000
X-TMASE-Result: 10--27.578400-4.000000
X-TMASE-MatchedRID: pS5owHKhBO35ETspAEX/non73EnA6dC3lR7tN56aWVWOymJujT8rWJtY
	XV8Pkii+laHQ59CB/kYEe0tIYIqXPLkeKW6KfnZEE6hK10iFnk5E64d0xcPXxZdigZi17dHqAWi
	5CYmIyyseq6eDJSt71ynMSSXF3FvCSfihM3YB4U8zqYp6VRKRETb+zdxoKT1DgotzKR+rmj6w0Z
	t5JvNYuXPE9VmsHawdnXS4fEyE7IuQ6l9zTnkxdFY9XYa1m8xAhQpD4YtsXs0Yiu1iAYQFrbFVT
	WPbvmThoAsBV5GWDfoCFmeJGpIR613eT0KEK90jITytpp/jrEzuB3lKociGMl/V69Gj3UidnHmv
	6Wrwqs6wjrGB9E2J4eJebEUvGQXk/MF0/8naPixYZJgo1mL1pUF/kS3ML8OYaXJZV/QhOzWIeE4
	MP8chfJRZ6QFEuXHpxZyhVtOB5DJkLHhirxjl5q3TyHL2jyH2wBLtKYu8bEujIT1TJ6FKjBSslu
	YvDbCu9XuNqVIcQil9glaz7cshR05GJ6XdLTPtNeXdnhDHWRFI3RrBc0CPBUuJfM58tqmevzi/W
	dx3K3/rCXMGdfw4QKwaPMsu0jTyfNR6vxqJ50VkvrTiSNWDZOKyfRqSYeXhzSf4KmZMZzsFGtEY
	3sOz0x7Pi8cnaw581PRbxbP4XeVg0/lm98YAq7DQN+uXSQvrCMiEBPZ3hhXIRhEhdkLWEkvroij
	rBN2VBXbmOqaCMoriUk1a5ZcWxBD/QUeuWPNylEJO70qtU7a3BJFtyO5uJHvBA9C/1eiFSJapXY
	JQvpPQ+sS71+DOCJ+P3lKKn2hgZQ6NwIKCNmGoENw5WsYKM7C66pzjxPrreG3erYjBbl1+3Bndf
	XUhXQ==
X-TMASE-XGENCLOUD: 86b2209b-30c3-40fe-b831-59b8262a882d-0-0-200-0
X-TM-Deliver-Signature: B960B723F2CA6D480A6C5A2802C51D3D
X-TM-Addin-Auth: CdlTEaPUJyDsiPbE4rXIKtQIECb0SVmCjsMl6Od/gcnf6wKPbkplPF5/uKo
	pA983b/1ZCsrAp4L2kN7jR3swWPLQjCF+VEvxpFpvNzWkCEwRp0AKjcwEz/xyH25nFY8Ew1JGDr
	ukfemaYqcmZn6n4++qvx7dUsTwhFfvn23oYZCHFFrIQcP6ymHIkMcESw4VZPdelzfDloBbVmQmt
	LGsYsq7L3btz1s4yhybwymmF6exZY/10m2GWy2WGawSNqIyxTtvNwgQvE94GpvUyRyAvl2R4zVe
	6+RmmBNZqC4ZAJ4=.QOrq3fTabNtEGa5tpIheh7AdVLvQRKCKxHMUVdw6zPNcRHMhLt0koUxZIt
	RsyLknm60TLJ+z8F/3UZRulq03qnJTd3xl430ZoZ6nGfOB9BUECDQxeRAmq8S8SyW0yCSd3rlOg
	xGp8qKv42gjZmNdnXUU0asBRvOlOapulipSHQ0G0iDtDkcdTN6CYD5/9fhjmknZhAcUo9kaAHcj
	lBem37kb1MuLbFozEJaUOC3Rxmk70tvG5qmu6QhWun15xKNiRUDWp6TLiLbmt/EzYH9SRepA8HS
	q9Dctua1sdZoapi8G5P364UVyTyuIULLdJI3gqbBZ3wEw1Vb547WIfPHYpg==
X-TM-Addin-ProductCode: EMS
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=opensynergy.com;
	s=TM-DKIM-20210503141657; t=1715615356;
	bh=lUbskxD0MaPCvOToikqkRn+aTMFUUialJoF5KQXvhoU=; l=7188;
	h=Date:To:From;
	b=m2efeEokOrzI3Y4A4kjOMlrIMjljwZKg6iKvUZcK1xKJ9yiPZGNb2mmoC6LMIOxQe
	 0m3qu3ahfuqYxqTMPI0tQIveVUYXV+s47YBXmluVcxNSwRxmzHiYhK/6ZHK+9QXuVQ
	 EyVZAIa+Ss/4QCepASN2kMzD5nBXTA1n6bppeba7A3hwEGx+0+dhgLfl0Bjfq9ApWv
	 mVEiFpyfFp6bKNsTTbNAinWHNQI3aARlFEhP3EXiRveGBo7w4A53oLbwTTZHwpMRyd
	 AtlZU38NiJepQT7TbTPOcl7ZQ3raxyPD9R8E58GyB9bBSE+6dOkhcN4FabGg17JA/G
	 RQG5TnnqdcADw==

On 13.05.24 13:18, Albert Esteve wrote:
> 
> 
> On Mon, May 13, 2024 at 11:56 AM Alexander Gordeev 
> <alexander.gordeev@opensynergy.com 
> <mailto:alexander.gordeev@opensynergy.com>> wrote:
> 
>     +CC Matti
> 
>     Hi Albert,
> 
>     On 10.05.24 15:43, Albert Esteve wrote:
>      > Hi,
>      >
>      > This a formal attempt of including virtio-media
>      > device specification.
>      >
>      > Virtio-media came from a discussion on virtio-dev
>      > mailing list, which lead to presenting virtio-v4l2[1]
>      > specification as an alternative to virtio-video.
>      >
>      > Later, virtio-v4l2 was renamed to virtio-media[2]
>      > and published through:
>      >
>      > https://github.com/chromeos/virtio-media
>     <https://github.com/chromeos/virtio-media>
>      >
>      > The repository above includes a guest V4L2 driver able
>      > to pass v4l2-compliance when proxying the vivid/vicodec
>      > virtual devices or an actual UVC camera using the
>      > crosvm V4L2 proxy device. Steps to reproduce are
>      > also detailed[3].
>      >
>      > There is some overlap with virtio-video in regards
>      > to which devices it can handle. However,
>      > as virtio-media will likely be the virtualization
>      > solution for ChromeOS (already landed into the chromeos
>      > organization) and possibly other Google projects for
>      > media devices, it would be desirable to include the
>      > specification in the next virtio release despite
>      > the aforementioned overlap.
> 
>     Well, last year Cornelia made it clear, that this kind of overlap is
>     not
>     desirable in the specification. After long email discussion we had a
>     video call with some selected experts on June 1st discussing the
>     proposed approaches. The conclusion was that virtio-video development
>     should be continued, that the virtio-v4l2 use-case is valid, but the
>     proposed approach is not desirable in the specification, it should be
>     instead implemented with multiple device types. It was also concluded,
>     that a new device ID should not be reserved. It is a pity, that there
>     were no public announcement after that, so now it looks like we're
>     going
>     to have the same debate again. But I'll be happy to discuss all of this
>     with Albert and the new joiners in the discussion. I believe my
>     arguments are still valid.
> 
> 
> Hi Alexander,
> 
> My intention is not to re-open the debate. The debate already happened
> and the points given were clear enough. I will certainly noy be able to
> enrich the debate with my own points. Sadly, we did not get a clear
> conclusion, nor an agreement, on the way to move forward.
> Instead, we ended up with two different specifications, one
> that is still working towards standarization, one that did not.
> 
> I completely agree with Cornelia, the overlap is not desirable. I
> really wish there had been an agreement and moved together
> towards a common goal. But alas, that did not happen. And I
> think that having a non-standard virtual device used in some
> systems is the worst case, and hence decided to attempt
> standardization.

Thanks for the clarification!
Yeah, I also wish we could move together to a common goal. But it looks 
like we have different sets of requirements and therefore quite 
different short term goals. I hope virtio-video can become suitable for 
all of us in the long term, if there is also the virtio-camera, so that 
the compatibility is much less a problem.

>     I suggest, that at least both of us (and hopefully others) start with
>     familiarizing ourselves with both virtio-video and virtio-media. I'd be
>     happy to present the current state of the virtio-video spec in details
>     and answer questions in a video call. I think, I'll need two weeks to
>     prepare. Maybe we can even resolve the issue ourselves. I think that
>     would be a good start. WDYT?
> 
> 
> I am more or less familiar with virtio-video (not so much in the latest
> drops, but I still checked them). But I do not own virtio-media, or have
> any intellectual involvement in its design. I merely followed its
> progress, and decided to collect the specification written at
> https://github.com/chromeos/virtio-media 
> <https://github.com/chromeos/virtio-media>.
> 
> So I am in no position to solve the issue. But I decided to try
> and alleviate its impact by having both in the standard.
> 
> That said, I will read your next virtio-video drop and try to
> provide feedback :)

Thanks, looking forward to your feedback. :)

> BR,
> Albert
> 
> 
>      > The device ID in this document differs from
>      > the ID in the virtio-media project repository.
>      > And it will probably need some discussion on which
>      > would be the correct definitive ID.
>      >
>      > Full PDF:
>     https://drive.google.com/file/d/1PG1YxzbSvQHPphFhbUKyKKdvuwO6shyi/view?usp=sharing <https://drive.google.com/file/d/1PG1YxzbSvQHPphFhbUKyKKdvuwO6shyi/view?usp=sharing>
>      > PDF with the media section only:
>     https://drive.google.com/file/d/1Y7kAGzlUfl30VIUx9wQtz5sFTkWnBiyA/view?usp=sharing <https://drive.google.com/file/d/1Y7kAGzlUfl30VIUx9wQtz5sFTkWnBiyA/view?usp=sharing>
>      >
>      > [1]
>     https://mail.google.com/mail/u/0?ui=2&ik=73ebd65ebd&attid=0.1&permmsgid=msg-f:1767388565327924962&th=1887068940754ee2&view=att&disp=inline&realattid=f_libalimc0 <https://mail.google.com/mail/u/0?ui=2&ik=73ebd65ebd&attid=0.1&permmsgid=msg-f:1767388565327924962&th=1887068940754ee2&view=att&disp=inline&realattid=f_libalimc0>
>      > [2]
>     https://www.mail-archive.com/virtio-dev@lists.oasis-open.org/msg12665.html <https://www.mail-archive.com/virtio-dev@lists.oasis-open.org/msg12665.html>
>      > [3]
>     https://github.com/chromeos/virtio-media/blob/main/TRY_IT_OUT.md
>     <https://github.com/chromeos/virtio-media/blob/main/TRY_IT_OUT.md>
>      >
>      > Albert Esteve (1):
>      >    virtio-media: Add virtio media device specification
>      >
>      >   conformance.tex                           |  13 +-
>      >   content.tex                               |   1 +
>      >   device-types/media/description.tex        | 574
>     ++++++++++++++++++++++
>      >   device-types/media/device-conformance.tex |  11 +
>      >   device-types/media/driver-conformance.tex |   9 +
>      >   5 files changed, 604 insertions(+), 4 deletions(-)
>      >   create mode 100644 device-types/media/description.tex
>      >   create mode 100644 device-types/media/device-conformance.tex
>      >   create mode 100644 device-types/media/driver-conformance.tex
>      >
> 
>     Kind regards
> 
>     -- 
>     Alexander Gordeev
>     Senior Software Engineer
> 
>     OpenSynergy GmbH
>     Rotherstr. 20, 10245 Berlin
>     www.opensynergy.com <http://www.opensynergy.com>
> 

-- 
Alexander Gordeev
Senior Software Engineer

OpenSynergy GmbH
Rotherstr. 20, 10245 Berlin
www.opensynergy.com

