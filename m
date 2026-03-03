Return-Path: <linux-media+bounces-54404-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ID7SFadlp2mghAAAu9opvQ
	(envelope-from <linux-media+bounces-54404-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 23:50:15 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0441F829F
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 23:50:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 17733303725C
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 22:50:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BCF639023F;
	Tue,  3 Mar 2026 22:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="JWzUibNi"
X-Original-To: linux-media@vger.kernel.org
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011002.outbound.protection.outlook.com [52.101.62.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EF8356A2B;
	Tue,  3 Mar 2026 22:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772578209; cv=fail; b=PYOCC18cRC3oaXRE3fP/tRmv2wZBb7FpjLRuKQBHPdG7gpvWOHYJzMftwbNzqPBLQ9+aO/8sPF9h7mspT85Zf4a1ZjRLhpHgUkzZw0lSpxXyVUoWF++tfBQ1f9JiBeEMHtbeo4ejP9x41UBdkrqDTgGWqW1p5GXziiGdElQg+CU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772578209; c=relaxed/simple;
	bh=u0dFstEQoNr6fWOpRn6Kyh71y1/Yz8Dgyhw6bxieC6I=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NohM1CgpybVCVFXJZujY65qVTYfjGUSWW+ycc2JAm6DWJ3EnaEujDrgAIkDM6S+Yfud9Q/JFnSZEqh41zAnbm9Zudb8i91njS8I62i7LtM+8xuzQ3OJ252HGZUAb3aWqVyVGXbsRC1LrMhIaI3K1ouupQvM7HO9VVrDYAaCj6UA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=JWzUibNi; arc=fail smtp.client-ip=52.101.62.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rhsk/BzCOBQV4nMB+jjne7xeq8DpLYAev+9fndmvBnIpUdthh016WnTguKd0ahdjy2oIrVgtDAPHlA+PckDAiRibLPHL4IS6zdiXPmxR7CQ2aYXA+poZfYFD3IlOUFIb72k8ZwS+exqPzZqO9dRxziGefPuYOwzMct2O3iQEoqU0qEYmYuExzk3f7YK9T9maNZ1D+YXV6PP1hbqdQU2lIULgSmbVMfk+3noA4DJ3a+/OhyTUMLn9csZHkNaJW2COG4jcPKNsV8sdWeD1EbuVCoBw+eti7FPEYZOjNz00pSe/GQEO5pEZPPwUifPo0MWLqB8gBuSMW3mmQ+XsphywIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M3NCfBIEbqLtnEvDnnnarA/Uf/aGaOI7fFQzpxxSR0A=;
 b=Kptc9aBtpHs0SR/ayjg7cSlj+3DanzD/rYeAWVyeE6U+YxHE5dTLOrFeW7PiekCiopQW+LdRyAUGcdYFVCG6n5HG7mO565rJNGvWxyNeA9+RuSZWNHzHMQTWY/Xfe5iJNmH+mp0hC8rum7JsQcvIim5u+wPAHLI6ldHgJ5jzOQ4Ieh9U1TefAVoL9J+6lcz0ceVf8z53aQR2ngARc1PX0UFEG3Vt6yfySc8qlyoHVQ+/i2j29z1p0jan/CRvr0JF+8Qaqb3o7EgomY3ifZAFK2sZeWPwz9rXy73aQ+1hkW5PWOtc+YodyJUFHRwSEJQzHgJIt7hVZp0Wv5/X8bakbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M3NCfBIEbqLtnEvDnnnarA/Uf/aGaOI7fFQzpxxSR0A=;
 b=JWzUibNiGuRSrt0FTc+a6ouo1fKP5Z78StL9Ew0xIVV8IiLjwI4QIld6T08WokbyyN9vpQ69Tazpxnk7YssNoFiY16tF6xMpi7LO5iIAmTALENDOA7jWvVVnCEMVnejLfgx/2sYvlHugbbRZHtFdAB9BlvpIWVDMDKnH6D6f1FY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4557.namprd12.prod.outlook.com (2603:10b6:806:9d::10)
 by CY5PR12MB6273.namprd12.prod.outlook.com (2603:10b6:930:22::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Tue, 3 Mar
 2026 22:50:01 +0000
Received: from SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287]) by SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287%5]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 22:50:01 +0000
Message-ID: <41a26229-821c-4535-bfe7-1901d0968371@amd.com>
Date: Tue, 3 Mar 2026 16:49:59 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: amd: isp4: add system suspend/resume support
To: Kinn Coelho Juliao <kinncj@gmail.com>, linux-media@vger.kernel.org
Cc: Bin.Du@amd.com, pratap.nirujogi@amd.com, sultan@kerneltoast.com,
 linux-kernel@vger.kernel.org
References: <20260302073020.148277-1-Bin.Du@amd.com>
 <20260303224433.87242-1-kinncj@gmail.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260303224433.87242-1-kinncj@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CY8P220CA0022.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:930:46::27) To SA0PR12MB4557.namprd12.prod.outlook.com
 (2603:10b6:806:9d::10)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4557:EE_|CY5PR12MB6273:EE_
X-MS-Office365-Filtering-Correlation-Id: e3ae4ee3-ca38-4bc3-f0d0-08de797733cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	QNzpjtEzjYDtqcjdaUWdLrVNQ9vGQI5fnjOOs+Dl6h8lXjN2E6dcXa2YpgQcMyKIJLatWn9bVEJ1N3NV6cjdIBSdlsFGR/vO3pNJvymtRXsCwb36m3l2HJYf5Lm77EtKTkGSTWr+0e3o3+gx4UELEks0rw9tLKfN9nox4VXUPdvCGgvKTMlitSK+Ei2m2VOLin4HGQo5GCoIFA6buoELz6mFciaj/duRrgABY6AbAvZFceLo4pYYRafUPCZpMXLB69q/8BcYwQiU18P9iRtVjKmJjkLqR250pA7YpJOlbDXbeIUoRA3dQyy4/qYQweGNxO9tVJaKCDH8qKY3vUMW1ZuTn0Ljv6cLpz2yXor1Rl8N/+x6U4GaASQTkWRUDWyt4t9xYwXzbY5tWs/bzSQhYbXZ7bYRvKIlsez6sU5LFYMQQ1mQe1lTdgL5i01wY5BmTKNq0JGBUNuo7RDFiY6gw6QLJTYAiQfJgHkJnwFsko1i5RR8ycrTa50PFxBt6T7h8J1+Dk0l5h+IqPvYu5vGZbtRw09CM3N/c4OzgfxHV6TxNgp9hwThJbh2jwSF3/o/DJVAGVs1xtJeo2qKolmWpJ2WNjHVhE30yT/Iv/W4Nv96G5YLuXepvU/X2vJjKRja/mkZGgfn4jyPrSTbWPNo61v9bIXm1rOfd33SkEIx8Wo3c199GNYYi9rVoLly0D3Ogll1GwFx84N9ra4++6rKVw7CNoxZxCchmUf0zjkH5cM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4557.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bWNPKy83MmlkSCs0MS95cHBWRTV6ekZmZFhQZG1EaWxvdmFXWjdVek9pQXEz?=
 =?utf-8?B?MEoxTlhWR2x3U1o4Uno1RkhTM0VTN3pGVW16MGhYTURrQ0VmdzRhTzBzYzRO?=
 =?utf-8?B?SFZGVk1takxEZlllOW9vYzY2MndGRnd5RWlCa0RkSFJUS3NnL3hvS005dVAz?=
 =?utf-8?B?YXhmNGkzaElJemZkMW9tOG5xY2JwTFh1cWhhbnRMWS96MTRnMFd1djN3dmxM?=
 =?utf-8?B?Y1RQYU1uZXFvYWoxSFl3U1ZQOWFMSi9NTlRmOUVuN2d6alpLMTZqaHhlay8r?=
 =?utf-8?B?T2lxdkJPSGpoMWY1bHRZcVZKU25NRUdLY2Q3eks3eGVxcjhOWFhWbXU2NlRC?=
 =?utf-8?B?UTRleHROM3JKRWpuSjZlUjFIeU1yc2VuUk5tcnc0aWhORzFzZVd6NWN6SEIx?=
 =?utf-8?B?VGFySnFLVnpKYUNmL2Q4MTltbjhQMktrUGZScFZYcEFOaFFhRHAzeHNJTXBP?=
 =?utf-8?B?NDVoZ1diSzBNNnJOMExPOUFMYlFGVVRYTXhTTWVGbThIY0RNZ0FaUHNXN0xm?=
 =?utf-8?B?MGxiZ0FZcHBjOHpRdzNPWUFjdkh3c0JSWm5hRDJNc00zaWVGbWE4alNiUHRP?=
 =?utf-8?B?RFBHci9xOHlxNllxN0hvcmJkS2J1azIrakZrb0FnSmtValFCdG0xU2xLUDU5?=
 =?utf-8?B?MnhJMTlMYTFJSEg5N1RydmJmbFlxYXROalJad0JHTXR4VHNHZVhXSG81Y0NI?=
 =?utf-8?B?L1A5REdqSWZrL1BJakZXc3NZMk9FWUp4K0xONVFqWFIwbFIyRDNQTXlCRTIx?=
 =?utf-8?B?SDYwWjZtcWhnK004QnRtT2Y3dFc1OUNZSzc5elJsMU96aC8xNS9VdWxvR09l?=
 =?utf-8?B?bDVzMlo3QzA3TVFEYW1Cb2d1a2M0dk82S1p3TE9wOWsxRWFFSjNtdzEwZ3Yz?=
 =?utf-8?B?L21QSnYzbmdjc2dOQTdEYS9NMWl3bUVtNENjUWxYTlE1dmFrQnV6NHYwWDBj?=
 =?utf-8?B?RkZQazcyYWdBTWZEWGk0Mi9SWUExc2hFSFJkVm1XZWtqUnMxR05MVHJIY0Nx?=
 =?utf-8?B?WlY3VXBFZ3F6QURvczhlbUdjS0VSbUYrd1FUV3c5WlEvRHExS1lqd2prTllG?=
 =?utf-8?B?RWZoVURJNVVwSXBJaEZNYUdENzUwSVo2UHFUclZBUjZ0dGxCaUpibjRNMHpi?=
 =?utf-8?B?MnJUYjBLS2xkNE11YUxYRzA3Ykk3eUtCZERXTDdUWllieWFOSWM1OHUwNE9V?=
 =?utf-8?B?czl3OVN6c2liaUJIYjBCcU5vaFVjNktIQ3hDcU1CV3dkRE1zQ2JxNUxMR251?=
 =?utf-8?B?bkRVRUg4c2cxL0syYjRiRDV0K04zY2J6b0dldjUrUHE3SENFMGJ1a3dEUk1O?=
 =?utf-8?B?aDNORzF0MUVZSWVpZlhhOWdtVzdDNHcyMEQ0Z1BEb0UrZXArM3IvT3NhWXRN?=
 =?utf-8?B?d0FCWjBJdnVrMUdGdE41RlJDbXFJeVloTmcvRFNzUUkwWUN6UlBNeEU5ZTZX?=
 =?utf-8?B?ZFZpOVdzZHdLaEJGMStPczE4RzZlSWVJeGpkcmRFTVNKbkV2dUtORlA3Ukdn?=
 =?utf-8?B?NnJlVUlRQkN2NnFtNFgvOWtqcndRT1MyVkJDYWNXVEJ3L1F0eTgvYzJGaVd4?=
 =?utf-8?B?cXpyM0pDeFFadnA2RmlXTXVTU3gxYU1rS1F0VWVraGgrdlp1cTViRExOK0RW?=
 =?utf-8?B?d3pPRGFxM0lrQlBhdGlXOXNrVitTd084YTN6THdnNVkvcHdqUDBtaUdEZ1Rq?=
 =?utf-8?B?MXdhd1ZGTEN5S2FHK29qRG5JTjNBUlVoN1lFQVVTQ2dkeXVEK2ZVc1k0YklI?=
 =?utf-8?B?UDhtZkw0M3JFMkFWckROQ2xlMGZBaUQ5SGhrclQ0WkRIRUJyQ21qWHZFOTNO?=
 =?utf-8?B?OSs1U2xjcmtMMlRCWGdZQnBLNXdZelF5MWdiRytveUxGRFVURGhUVXNlMnd3?=
 =?utf-8?B?Um5lYmdiUk5PdG9ScUNEU21QbkNDbFRESzV4ZndLUkFTcUtISmN6U1FEbGFS?=
 =?utf-8?B?cFA1VUtveGM3aUhuaERMWWJHZE9hS3laVlpyaXV3cElqWWE5VXhNRXBsTkNP?=
 =?utf-8?B?aFRqOXQ4Y0JncHVndVdBT2RHalVHa1Y1SkVlOHV2Wi9aYkhJSW9aMTJCUG1E?=
 =?utf-8?B?aEpOdWhKV2FSV21HaGMrSnZ2aDQra1Fmc1duWUlYNE5jdmlveXlmTWpWTnZV?=
 =?utf-8?B?Ui9ENElIWnNKaitJUUFqRlFUK0FndmxvaDcreTB2cXFTT1dLQWF5em44M0Yr?=
 =?utf-8?B?RGlpZ1JkUUp3U05UUTJBZzJFc0lWa1VvaHk2bTZxcVhGeVBnNlQzK1hOU1lB?=
 =?utf-8?B?WmRVMDhodVdTaGZPVlBBekc0VTllT3ZHOWZOK0Y0TXZ6M3NYWDUyL2dlNmQy?=
 =?utf-8?B?OEJHeTFBNm1vSksvYWlJOGhwZHhaTEIxUDU5VkhtaFhlTDZtWjc4QT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3ae4ee3-ca38-4bc3-f0d0-08de797733cb
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 22:50:01.2410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v1ZMtai3Uvv5TT28EDf4HG+4FuRF5/UUz45Enj+KS1BqGY7nNfavSOX0PLAh6v9qpzmRIlcpIXcyp2a6HuYGqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6273
X-Rspamd-Queue-Id: EF0441F829F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-54404-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mario.limonciello@amd.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action



On 3/3/2026 4:44 PM, Kinn Coelho Juliao wrote:
> The ISP4 capture platform driver currently has no dev_pm_ops. When the
> driver is loaded during a session, the ISP hardware is left in an active
> state on s2idle suspend, causing the system to hang and requiring a hard
> power-off.
> 
> Add suspend and resume callbacks that properly tear down the ISP firmware
> and hardware state before sleep via isp4sd_pwroff_and_deinit(). On
> resume, the device is marked so that userspace re-opens the camera,
> which triggers isp4sd_pwron_and_init() to reinitialize the hardware.
> 
> Tested on HP ZBook Ultra G1a (AMD Ryzen AI MAX+ PRO 395, Strix Halo)
> with CachyOS kernel 6.19.5 — multiple suspend/resume cycles with the
> camera active before suspend complete successfully.
> 
> Signed-off-by: Kinn Coelho Juliao <kinncj@gmail.com>

I'm a bit surprised this is needed, I thought that we handled this from 
amdgpu side of things.  Will let Pratap and Bin comment.

> ---
>   drivers/media/platform/amd/isp4/isp4.c | 48 ++++++++++++++++++++++++++
>   drivers/media/platform/amd/isp4/isp4.h |  1 +
>   2 files changed, 49 insertions(+)
> 
> diff --git a/drivers/media/platform/amd/isp4/isp4.c b/drivers/media/platform/amd/isp4/isp4.c
> index bf6b8e2..3e2c3bc 100644
> --- a/drivers/media/platform/amd/isp4/isp4.c
> +++ b/drivers/media/platform/amd/isp4/isp4.c
> @@ -4,6 +4,7 @@
>    */
>   
>   #include <linux/irq.h>
> +#include <linux/pm.h>
>   #include <linux/pm_runtime.h>
>   #include <linux/vmalloc.h>
>   #include <media/v4l2-ioctl.h>
> @@ -221,11 +222,58 @@ static void isp4_capture_remove(struct platform_device *pdev)
>   	media_device_cleanup(&isp_dev->mdev);
>   }
>   
> +static int isp4_capture_suspend(struct device *dev)
> +{
> +	struct isp4_device *isp_dev = dev_get_drvdata(dev);
> +	struct isp4_subdev *isp_subdev;
> +	struct isp4_interface *ispif;
> +	int ret;
> +
> +	if (!isp_dev)
> +		return 0;
> +
> +	isp_subdev = &isp_dev->isp_subdev;
> +	ispif = &isp_subdev->ispif;
> +
> +	if (ispif->status == ISP4IF_STATUS_PWR_OFF)
> +		return 0;
> +
> +	dev_info(dev, "tearing down fw and hw state for suspend\n");

This is probably a bit too noisy for regular every day use.  I would 
just exclude this message.

> +
> +	ret = isp4sd_pwroff_and_deinit(&isp_subdev->sdev);
> +	if (ret)
> +		dev_err(dev, "suspend teardown failed: %d\n", ret);
> +
> +	isp_dev->was_powered_before_suspend = true;
> +
> +	return 0;
> +}
> +
> +static int isp4_capture_resume(struct device *dev)
> +{
> +	struct isp4_device *isp_dev = dev_get_drvdata(dev);
> +
> +	if (!isp_dev)
> +		return 0;
> +
> +	if (isp_dev->was_powered_before_suspend) {
> +		dev_info(dev, "ISP was active before suspend, camera must be reopened\n");

This is probably a bit too noisy for regular every day use.  I would 
just exclude this message.

> +		isp_dev->was_powered_before_suspend = false;
> +	}
> +
> +	return 0;
> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(isp4_capture_pm_ops,
> +				isp4_capture_suspend,
> +				isp4_capture_resume);
> +
>   static struct platform_driver isp4_capture_drv = {
>   	.probe = isp4_capture_probe,
>   	.remove = isp4_capture_remove,
>   	.driver = {
>   		.name = ISP4_DRV_NAME,
> +		.pm = pm_sleep_ptr(&isp4_capture_pm_ops),
>   	}
>   };
>   
> diff --git a/drivers/media/platform/amd/isp4/isp4.h b/drivers/media/platform/amd/isp4/isp4.h
> index 2db6683..f39be96 100644
> --- a/drivers/media/platform/amd/isp4/isp4.h
> +++ b/drivers/media/platform/amd/isp4/isp4.h
> @@ -13,6 +13,7 @@ struct isp4_device {
>   	struct v4l2_device v4l2_dev;
>   	struct isp4_subdev isp_subdev;
>   	struct media_device mdev;
> +	bool was_powered_before_suspend;
>   };
>   
>   void isp4_intr_enable(struct isp4_subdev *isp_subdev, u32 index, bool enable);


