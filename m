Return-Path: <linux-media+bounces-60045-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIYkK+778mmIwQEAu9opvQ
	(envelope-from <linux-media+bounces-60045-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 08:51:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5D649E408
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 08:51:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 599D3300B9C4
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 06:51:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC5C818A92F;
	Thu, 30 Apr 2026 06:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="aPQl8tf1"
X-Original-To: linux-media@vger.kernel.org
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010022.outbound.protection.outlook.com [52.101.85.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CA4358379;
	Thu, 30 Apr 2026 06:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777531876; cv=fail; b=ruguu7bE7VYYW+LVhGqPwG62PbhsGOxy7VBT9TgDU0RZi/pYLwBl6P8P9G8omjJZyQKalE58uQIzVDlsdJkTURrl9KN3xXUn+G0Iq5qO103q3mnXeUfL9l1szL0YmNBRgMGVrX05gPmXioWquGgDzBp3C0egCCpZujWDhia+/zc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777531876; c=relaxed/simple;
	bh=403rXdcMKo046UIut/FxaddVnNnUQGztDRxK8sgxMPs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WUpI07X7VCX1pGc5iOijObfAIFgK9VlVFhVw2sn+LdA/Mt9RX65qyr4HoG1TLxmAm9+MbqMtoeHb5HbF3hpCkMowfxlfDEsDLhLHd+lvxd2B1v8oO3v0FVFpGCEvOsRNbkkXrdW9uFZGC+Zv4TGrCq/0xmZMx+hmPdMUXdVUgiA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=aPQl8tf1; arc=fail smtp.client-ip=52.101.85.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sr1K2OdvGTvgPdAwka6RyO2fZRnjvg5UI81YY3IM1+8AHjNjIq2YuAwuCY7OSONk0YWwkarjjozMpT92AT1itEXFKSMC3pHLR9aLiFqN0pdAytuSdVcFW4fv9rE/GSFH/lTfUY2NGlVbt7PbZ6uLJIZjWSCZVstkloTWZZy6hyk0nB/dp4aW8WDjTEzq1YV/je8dk8EHrE6VQOW+XY8n8o/MnxEca8JgMyLQGlM1ZGwxvbMQX4MMOGnfiT60L9IYIRYhEXKGUrNNwF3Ts/LobVKV6S5hltviWooVinZJYUgT6zN5LnUJ448OvEDYOvUgrKrxvfXzZ7pN82Miwm5Ffg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Krw4Q4OuXK0oCTY3JCtD5HpeU+6a7h2eI/rUyGjjeA=;
 b=mECEOsxk9wrVnArt4UdqQUozDwI1u0nrV0WKiq4kkrQLF2p0ijHGj2Ipx6ECpfFw58aGorr6c5rfnSc3baWLIzyGwoBXP0tRBJqu/ZDPuUSMcXHHR7NVplcxUw5ad1nT/PXKQSDmJI5y6wdMSJtXRxHM7Ffh3zGC+k5Qm5f1rjiJVvo/Ahpp7dlDejHCXmMVUgMjfIElDfPu+Ch9zdlywW9Q0KlDobeoZFgUICpx4Qp7w7D14cU30lOHoqNT4G5QG06TXg5P+77vorF4J1pmykhc49RSq7Uf662ZqcsT2LT1AxSdcehgEy3LcJD/8NOzGsYhECaEzNK2aX6bNJjveg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Krw4Q4OuXK0oCTY3JCtD5HpeU+6a7h2eI/rUyGjjeA=;
 b=aPQl8tf1lgTlHuBJkoDeIRNVgt5C7z72gKNjx/1vYv8xS3f/xaWUy88i8rqmZcZ6PiidZeP01QvEiTK5eE6+wp5od4tIAdtUQyEsDqfTsHDxYWslRe2OKJwC/roHqwV44hhfx+02e3AsVfb+VvB/33xVDRFycOl77dRF6aKIPj0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Thu, 30 Apr
 2026 06:51:11 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9870.020; Thu, 30 Apr 2026
 06:51:09 +0000
Message-ID: <4c63c81b-14f7-4e6b-a733-2f98e6055ca8@amd.com>
Date: Thu, 30 Apr 2026 08:51:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/3] media: videobuf2: opt-in dma_resv producer fences
 for V4L2 dmabuf exports
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
 Markus Fritsche <mfritsche@reauktion.de>, Tomasz Figa <tfiga@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Philipp Zabel <p.zabel@pengutronix.de>, Jacob Chen <jacob-chen@iotwrt.com>,
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20260429195306.239666-1-mfritsche@reauktion.de>
 <3d8deeb15581b754e4c061d4c4a13657aa08bc3c.camel@ndufresne.ca>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <3d8deeb15581b754e4c061d4c4a13657aa08bc3c.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0404.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cf::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB8059:EE_
X-MS-Office365-Filtering-Correlation-Id: 804581ca-52b4-4f80-6397-08dea684dc44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|921020|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	4R8qL1A5Ok91ZSIsrixXzNbuo8WOy3G4vQy3xQ0irS1uOdFE7/neroH4jbE/Zjs1pz29l9Z11LQIrCZlihD9WzX74aYilRdSPK4hehnQAtGDecsZ5BK+mxTugDsvLc27z/eSiZofBLW6wHi2qWDCl5It4ZQZyZBxBk81UANqCUPEl4A7nksQLldDgLU9QXUuXUFyXBceZGvqcQMQgcDIe7AaNxlIan2KzJU2GgsrGxCueEqvOSMOsj31pDsJ3qCIDSVZ/PR31CqE4rZVMF+EyWoCSITip3laRtpU2DPJx2gnD4sMU2S8mwowxWWUhTa4K/0hG8E2fblCqXDfP+3MBbyn4K+ijwP3pe0uQQGozAmgCIwrAYgGYwuO01pX4zxXG2ygGWXbmbMewWVqqrmkRLnWOxCoaNLkmOpOkDatcmpEAax87aYS/LVbKhRXPbUtAkYQHLOCkDd6obYQ2tbVwwY9U9Pa+w3bNDFVIRUbQOvRg44ZzAz0hDItZdsnwRG2Tm7yvu+2KeDYEX2ORZbYYcU4tggmoM1hmzRfG8UL8nSnTlfJ6JiadkWX2uNBlx+owjgBm+uKK672UAi/9h+3jveLLRDO1Jpjnkh6VSK6/jxY3BdVoc1NgJcEsqB7jxKU8wjQl/22TCepKGFbjLLr1cunpp35zZbgHP7o2tBQjQ0REM7zOn/e0laFzZQJiwYtbf/d88coFefCR1UWYp8zUiB8ho7f1luoenClEnM2MRkzePBnp5lf4xdXTb+BklW5ghasq0ok2/+unF8zObm2fRwiEvPEcpycZUcte2Jatxs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SVdzeng5MUxEL2hwUDlZSVZTemNrQmQzYmdmUHhyK0lVRE9ySzdrcHNNR3Ji?=
 =?utf-8?B?cWpRL1hZdjVQQUdEMUYrcis3R3I2RWwzdTNOdlNvVlhWRUxtbjY1Z0E1M1Yv?=
 =?utf-8?B?UFUxU0NWYk94YS9wT0pmaUVQaDQ5UXM5KzB1V1VLOTZ5SlBvdzZST3lURVVR?=
 =?utf-8?B?clJpZDVvekc0U2R0MCtsYTdaZ1RTVkVsR3BRQStPcS9QZ1lacXRhOXE2SStC?=
 =?utf-8?B?c0tJNW1TNGJWci9DZ1BnRGNnT3p5MkJycHBiamlqVm5XVlo1NjdOdE16dGRB?=
 =?utf-8?B?U1pKTWNRelBZbXk4czdnUzQzYkVjWmVBV2ZyUW1qbDdkZG1PUXU4cnIweXd0?=
 =?utf-8?B?OXVWeGc4Nk1sdzdXblgxR1NxVEtGeGZDelIyYTQ3ZFZyaktUQnVtRFhDU1dq?=
 =?utf-8?B?YmNQbW8vc2d2Y2Z1djZldTNrUjd6Q3VJaFp0WjhCdGNFSnZWYjJGd1J0a0Vj?=
 =?utf-8?B?VHQxcC9UUzF5ZHcwT2JUS3JZTGRNOFJIdjMwNG1CVkdJVGRHNEphNHYvbm5p?=
 =?utf-8?B?THdrcHVOUXNuY3AvL1liRUxwakZNVWtPaUJiVlVjdzZ6R3lvdkJLRjJnVkFP?=
 =?utf-8?B?c2ZoT1A1Sm0yQlFvbzFwVVRXYXI0NXlQRXVsMnozQW5tTmtuRVZXUGdtQ2E2?=
 =?utf-8?B?ekVGRHVjTi9YQWFNeWNXLzlzT3JJd2ZyMllVeUUydlJGMEdrSkRVYzlPcHdP?=
 =?utf-8?B?TmxrbFZ3Uzd6RVRpUDJNZmdHdDFwUWRkUXA5NEFBckM3MXZXZGFKWGJ1VlRJ?=
 =?utf-8?B?MVN5VGt4WVdIV2hHUGxyN0p6d1grRVVhOWRidm42NzBOWEZpS3h2bTkvcXBZ?=
 =?utf-8?B?anRPaTlGY0g3V203NWwzZVFCNEEwMTFHZUszQkxuQkp0OFFqckNWTnBDMC9T?=
 =?utf-8?B?WGlad3U0ZWl4YkNPWU9tdkFiNm5laXpoRDU3WTBZclhIa3VFS3ZxZm9ZOXRx?=
 =?utf-8?B?S1E4TDdIQWFYVENWeEpjMHlzVXNuS0ZqRnVEbjZ4cGJoeUJyZkhmTGtMV1c4?=
 =?utf-8?B?NHBKajZJVHBVK1cvZG02Qi9WUnJCVDFaQjRLYmZzWVg2d1B5WWxsN0FvUnVQ?=
 =?utf-8?B?SUpaOHJmblIxZjdYZVRwVlB6KzZWQUtjamI3enNMT0phd3hyNmNMSU5HMzFo?=
 =?utf-8?B?MkE5MGhhdUpqY1FTdHZTMEovbkZmUlNhREszbzRrbkNXUDcxaHUycjBRN0Ir?=
 =?utf-8?B?aSt4Yk01K1lsR2FacHNwU3JnSFZlSmkrNGJmZFhmV0w3cDFCd2VFeG1GekVF?=
 =?utf-8?B?TVdhUnZtaXJNditDYUY1VWRPUUtsZ1RyN2hZOERFZzJKeXVQUFNpb2tCZFlU?=
 =?utf-8?B?TjMveC9DSXpvYis4cVRuM0g2ZmtsdzBuRW9ybExRb2RiMlhzNTRJVDZteVlD?=
 =?utf-8?B?WnlOMlNXNE5MdG9vRDQ4QmFGZVRhQTJIREtyTDFabzFHdW5jWkgrdWwwQjlG?=
 =?utf-8?B?cGdKdmM2eGhWbmtwZGpVcnQ1V0Q1L1RXQlVzcVhFSUxWL085UmwwT0xvWkhT?=
 =?utf-8?B?bFdZclNLQ2hnaWR3OEVVeGl1cE9XYjJjTmhGVWxTZDBCQ0g5bHQ5MUtnNFRj?=
 =?utf-8?B?OGlWdUN0VWM1bElEVWUzWi9UK2tmRk1tSTV1SzFJUStYMUpqa0RER0dnL3Ux?=
 =?utf-8?B?cUxETFpScTJjUTV0cEttVEY2bFJSMFptSUVKdVlPZVo0ZVNVeFQwL2VFNUFs?=
 =?utf-8?B?aE9zZVNXeDFBT3NoQkZ5ZXNRczg1NTNQOWEzVFcxeWsxYzJmOEtBVDcvb1F0?=
 =?utf-8?B?MHRVVGwzZGFXcmVhTGJoQkl0SEVTUmowMFlYRmh0VlRaaHRKdkNjNmlsTU5S?=
 =?utf-8?B?S0liQWYzdU1sdXRwYXBCeU8vekY5RmlsVVc0UlVMRjRLWUZqbXFndk5mMXJQ?=
 =?utf-8?B?T0doMzlNZDMyWGkwN3pqMk9ZN09NK3VGS0RPa2hhTjhOamhGeG5rWm1HaHJ3?=
 =?utf-8?B?VnI5SzVYU2R5YWQ4aUdYUlJVbXBYcUFHcklsTk1FN1kyZTRuRnZMYWNhbGo3?=
 =?utf-8?B?dkFTbmJiUmZhSi9uZTRUK1drakphSFVzSE10WTJhVm54ZTMwUGlXM3dzTGFV?=
 =?utf-8?B?VnZ1T0hjWDh0a1BOaExjSDJGUG5WU2MwOUg2Zkx3L2JoV0FSckdjSDdFVnB1?=
 =?utf-8?B?b3cyQ1BWaElDK051VldVWENlWWJ6SGdnY0E0dnE1NzJucHJEYXlvclIyZ0RG?=
 =?utf-8?B?Y2w2bU5wRWlRLzM3STZ1TnFxajR1QUUwQk9JdE5xZ3FMUVR6MEdRYU03dkpt?=
 =?utf-8?B?L3Y2WmhWS2ZPMDhtcmlqWjVZRit4V1NBeGw1d1U4S1UwSDhCZE5VMXdMa01p?=
 =?utf-8?Q?o4VYBt5QaT4rH4DJNY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 804581ca-52b4-4f80-6397-08dea684dc44
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 06:51:09.7266
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wt1eK0zZOMNaqCYjU19BNpzevHLBjE+RRdPn+rxUv5Sgci/aTLnz5oaJDRCPTJON
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8059
X-Rspamd-Queue-Id: 8E5D649E408
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60045-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

On 4/29/26 23:22, Nicolas Dufresne wrote:
> Hi Markus,
> 
> Le mercredi 29 avril 2026 à 19:53 +0000, Markus Fritsche a écrit :
>> Hi,
>>
>> This series proposes a small opt-in API in videobuf2-core that lets V4L2
>> drivers populate a dma_resv exclusive write fence on the dmabufs they
>> export to userspace, signalled when the buffer transitions to
>> VB2_BUF_STATE_DONE. Two example drivers (hantro, rockchip-rga) opt in
>> to demonstrate the call shape; the change is no-op for every other
>> driver.
> 
> Thanks for attempting again this feat. I see you went for implicit fencing, but
> in the past we've been recommend to stay away from these and adopt an explicit
> fencing model. Is this something you have started to think about, have you
> reviewed past proposal in regard to fences ?

Yeah agree, I just wanted to note something similar.

Implicit fencing is basically just a workaround how the GPU HW used to work ~20years ago and only rarely makes sense today.

On the other hand putting it behind a flag might be acceptable when you want to interact with implicit synced HW, e.g. a GPU.

If you want to expose a dma_fence to userspace then using a sync_file as output from the IOCTL which kicks of the operation is usually the better approach.

>>
>> Why
>> ---
>> Modern Wayland compositors and any other userspace consumers that
>> import V4L2-produced dmabufs and want to do implicit synchronization
>> the spec-clean way (poll(POLLIN) on the dmabuf fd, or
>> DMA_BUF_IOCTL_EXPORT_SYNC_FILE for a sync_file) currently get either:
>>
>> 1. A stub fence from dma_buf_export_sync_file(), because the dmabuf's
>>    dma_resv has no fences populated. The kernel substitutes
>>    dma_fence_get_stub() which is permanently signalled. The compositor
>>    "successfully" waits on a fence that represents nothing real about
>>    the producer's state.
>> 2. A poll(POLLIN) on the dmabuf fd that returns immediately for the
>>    same reason — dma_buf_poll_add_cb finds zero fences in the resv,
>>    triggers the wake callback inline, and reports POLLIN ready before
>>    the producer has actually said anything.
>>
>> Today this works as a happy accident on most paths because clients
>> attach buffers after VIDIOC_DQBUF, which the userspace V4L2 contract
>> guarantees only returns a buffer after the producer is done. So the
>> implicit "the kernel's stub fence is fine because the buffer is
>> already complete by the time anyone polls it" assumption has held.
> 
> There is no accident, just saying. Have you studied also the other side of
> fences, the one that actually cause problem with Freedreno and Etnaviv ? To me
> these would be higher priority since they are known to cause "back flash" kind
> of bugs, specially for compositor that are not expecting GL driver to place
> implicit fences on imported (v4l2 allocated) buffers.
> 
>>
>> But:
>>
>> - It's a contract gap. The kernel claims to expose implicit sync; it
>>   does not, for V4L2 producers.
>> - It paid latency for nothing. Every Wayland frame from a V4L2
>>   producer pays a DMA_BUF_IOCTL_EXPORT_SYNC_FILE round-trip for a
>>   fence that's stub-signalled. On Mali-class hardware (RK3566 Wayland
>>   chrome video playback), this contributed to compositor stalls.
>>   Removing the wait at the compositor level is a workaround, not a
>>   fix.
>> - It blocks downstream consumers from doing the right thing. A
>>   Wayland compositor that defensively waits on a sync_file gets a
>>   stub-fence pass-through with no actual gating; if the V4L2 driver
>>   ever has an out-of-band path that releases the buffer before
>>   finishing the write, there is no fence to gate on.
> 
> Some things don't add up here. I think I want to remind that there is a contract
> in regard to delivering a fence to userspace. One of the most important aspect
> of fences is that they must in finit time be signaled, regardless what userspace
> decided to do next. And for that reason, you shouldn't deliver a fence to
> userspace if its not armed. In my reading, you are delivering that fence at
> QBUF(capture) time, just like what Gustavo was trying to do previously. Its even
> worse if you deliver it to your compositor allowing that compositor to hang
> forever by not feeding any bitstream.

+1

> Let's take Hantro driver as an example. The right moment to deliver the fence is
> either right before we set the DEC bit on the control register, or somewhere
> before that when you have bitstream, parameters and request queued. At that
> moment, you are guarantied that the decode will either finish or fail (yes, it
> can fail, and its extremely common with live stream, or when application calls
> streamoff, since in v4l2, we cancel work). Prior to that, user may starve the
> OUTPUT queue (the bitstream) and cause the fence to hold forever. This would
> break the contract I mention earlier.

Exactly that yes.

Regarding failed or canceled submission handling that is not so much of a problem since we also have proper error signaling on fences.

But what is usually problematic as well are things like dynamic memory management, e.g. when HW uses the PCIe PRI interface or similar functionality on other bus systems.

Getting the contract right is indeed really tricky but unfortunately mandatory because you otherwise run into deadlocks sooner or later.

> Though, if you attach the fence at that moment, you will need to design how to
> signal the fence readiness (rather then the data readiness). One idea would be
> (with userspace opting-in) to signal the queue at that moment. But then you
> can't do the memory management operation you would normally do in DQBUF. This of
> course don't apply to hantro, which has no device cache, but we can't design
> something in vb2 for the old HW. So we'd need to move memory management somwhere
> else, maybe buffer_done, though you have to carefully make sure in which context
> you do that, you can't sleep in an IRQ.
> 
> There is an obvious benefit of basing your solution on
> DMA_BUF_IOCTL_EXPORT_SYNC_FILE, once you get there, you'll discover that there
> is very little room in v4l2_buffer, and that was causing a lot of headache to
> previous people attempting this. Though, if we look forward, we could also
> consider this a feature of the media_request. Queuing a request could maybe
> deliver a fence, assuming few pre-condition that guarantee execution (or
> failure) are met. We've seen with DW100 recently that its rather easy to convert
> an existing m2m driver to request. The media API is a much more open canvas to
> design new mechanism. We could have a really simple ioctl that attach out fences
> to request, and in a future hook it to our own depedency manager.

My request with the DMA-buf maintainer hat on would be to correctly annotate your fence submission path the with lockdep primitives Sima wrote and then make a few test runs with lockdep enabled.

It's not a prove of correctness but this at least gives you a good hint if your locking order and memory allocation paths are correct.

Regards,
Christian.

> 
> I'm simply throwing ideas, I could have missed few things in your PoC, let me
> know.
> 
> Nicolas
> 
>> What
>> ----
>> Patch 1 adds:
>>
>> - struct dma_fence *release_fence to struct vb2_buffer
>> - u64 dma_resv_fence_context + atomic64_t dma_resv_fence_seqno +
>>   spinlock_t dma_resv_fence_lock to struct vb2_queue
>> - vb2_buffer_attach_release_fence(vb) — drivers call this from their
>>   buf_queue callback. Allocates a dma_fence on the queue's fence
>>   context, attaches it as DMA_RESV_USAGE_WRITE on each plane's
>>   dmabuf->resv. No-op for buffers without exported dmabufs.
>> - vb2_buffer_done() extended to signal+put the fence if attached,
>>   so the producer's completion signal lands in the resv synchronously
>>   with the userspace DQBUF wakeup.
>>
>> Patches 2 and 3 add a single call to the helper from hantro_buf_queue
>> and rga_buf_queue respectively. Both are demonstration drivers; other
>> vb2 drivers can opt in incrementally with the same one-line change.
>>
>> Tested on
>> ---------
>> PineTab2 (RK3566 / Mali-G52 panfrost / mainline 6.19.10, this series
>> backported), playing 1080p30 H.264 in chromium under KDE Plasma 6.6.4
>> Wayland. The test harness is the chromium-fourier patch series at
>> https://github.com/marfrit/fourier — chromium plus a KWin patch
>> that *previously bypassed* Transaction::watchDmaBuf because the
>> kernel-side fence was stub-signalled. With this series applied, the
>> bypass becomes unnecessary; KWin's fence wait completes correctly
>> because the fence now signals when hantro completes the capture
>> buffer write.
>>
>> End-to-end result before the kernel patch (chromium + Qt 6 patches +
>> KWin watchDmaBuf bypass): 1080p30 H.264 plays through, ~81% combined
>> chrome CPU, but the watchDmaBuf bypass weakens KWin's defenses against
>> misbehaving clients.
>>
>> End-to-end result after the kernel patch (chromium + Qt 6 patches +
>> plain unmodified KWin): 1080p30 H.264 plays through with the same CPU
>> profile, KWin's watchDmaBuf wait completes within microseconds against
>> the now-real producer fence, no defenses weakened.
>>
>> What's missing in this RFC
>> --------------------------
>> - Other vb2-using drivers don't opt in. Each maintainer should look
>>   at their driver and decide. The hantro + rga patches show the
>>   shape; copying it to other drivers should be straightforward.
>> - For drivers that have intermediate image-processor stages (e.g.
>>   CSI -> ISP -> user), the fence semantics across stage boundaries
>>   are out of scope here. This series only addresses the producer-to-
>>   userspace edge.
>> - No selftest. videobuf2 doesn't have a great in-tree selftest harness
>>   for dmabuf flows; the validation is end-to-end at the userspace
>>   consumer level (KWin, in our case).
>>
>> Reviews especially welcome on:
>>
>> - The decision to make this opt-in per driver vs. automatic for all
>>   vb2-CAPTURE queues. Auto-on would force every driver to be audited;
>>   opt-in is incremental and safer but leaves the contract gap for
>>   drivers nobody touches.
>> - Whether vb2_buffer_done is the right place to signal vs. an earlier
>>   hook (e.g. immediately after DMA-from-device finishes). For hantro
>>   the two are effectively the same; for drivers with asynchronous
>>   post-processing they may differ.
>> - The choice of DMA_RESV_USAGE_WRITE — we are emitting the producer's
>>   write completion, so WRITE matches dma-buf documentation, but a
>>   sanity check is welcome.
>>
>> Cheers,
>> Markus
>>
>>
>> Markus Fritsche (3):
>>   media: videobuf2: add dma_resv release-fence helper
>>   media: hantro: attach dma_resv release fence at buf_queue
>>   media: rockchip-rga: attach dma_resv release fence at buf_queue
>>
>>  .../media/common/videobuf2/videobuf2-core.c   | 95 +++++++++++++++++++
>>  drivers/media/platform/rockchip/rga/rga-buf.c | 10 ++
>>  .../media/platform/verisilicon/hantro_v4l2.c  | 12 +++
>>  include/media/videobuf2-core.h                | 29 ++++++
>>  4 files changed, 146 insertions(+)


