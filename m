Return-Path: <linux-media+bounces-58548-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAmDJzb12GlJkAgAu9opvQ
	(envelope-from <linux-media+bounces-58548-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 15:03:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A90C63D7D61
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 15:03:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6BF493042E36
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 12:44:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0BF9212FAD;
	Fri, 10 Apr 2026 12:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="cOQz8leK"
X-Original-To: linux-media@vger.kernel.org
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011029.outbound.protection.outlook.com [52.101.52.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1BB1DE2D8;
	Fri, 10 Apr 2026 12:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775825049; cv=fail; b=Ao2TGuYOAjhWuAurOrb01UPls3SDiZHLgW+9vTYAC6YJij56ctQkA3VstEqugJzsgBFYgzgNvdI+0ayZhL9x7C/Y0kw0lW0/e8ap5vyqbrNK6/nyTl+cVID5nmovI7mMOhB5WKHw4YvPHZmTEBxqL/M7EB2NppSCYh6X8RavLvU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775825049; c=relaxed/simple;
	bh=Bk+kOThW/3hoZfBnX/y30o40R7uGuXKqYB0tivNMVZM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pYuiTkIMeRbof5eIBMwtCZR7NaodhujGkRC/YK5EHCcPTpBJx1hc8CMxSCvD1gITQTVlAYfkw29wVmU9ELD9X5TRbVhrvI/3QgrkKbT0uFEWgdmj32qSo2IIx/Kk7MTrD43MJfDTm+75h7WBKC4tHw4tY7OTvrMrvSa1ajKMvuE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=cOQz8leK; arc=fail smtp.client-ip=52.101.52.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jrqpBvK2m43WXwD3kvKS6sy3zyFPTS9VKiDluHUf8Yi6pt3gBErGiTSdmdAlXoSpqHY9FnWLOb/yedaDabt9NZe2x6WQO3yjM694F84SUdhA6s3jlnCfgpDhJRCIY7UigLbwNjrph7NHdN1DRJFBd+nnJC62pAG3aB3+prLiToLGAnHfzgoXclBJ5hJvYRIw9MuichKu5nKvqYdFtLp2b9YQKYOjCFul7bKUNLBCJAPC+JB25OWzKYad4fljP8VU79Nyo7FcyzH/I1kdrVXOyWiqRiG/8rbqTOC4d9DFLWJdFO0Tz6oKlKms0oyLuLdqxbUzU5fVsRAnd29wKgj2Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lkR6FL23Rbktt/TwqNYkS7MzUc9aaeHy3S+ohwdeLMM=;
 b=X0UijeQPXoXsZczhnDcTMbQtFpSA4RpKnzGPqojXK9dEOHu4agH92+gMF/ujLnjyxjuuH/7ujQtNHZXPc7OCoBkmptGAEY7bNXLikSedJOCbB/d4u+fgD/QwTAS/Hm4TeKASNXyGzCNTc+SsL/8CaXUByFybODNW+UGcGEwAppx0YyUXt5PvEx3gOhBvCUPxqlKQHrM1dBLX8Z0JlqmAsfQwJqhVJFu3m0GPKzVW2mZ3ELh6rXkaLzn57Vc+uTLqMYNQ/Dz2eaI2zDVAO110bmUiZ18qX/tvumO4Odn08VleTrGh4Frl6o3GNLLZwVOzq6EOH82R8oif+SFcyezS8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lkR6FL23Rbktt/TwqNYkS7MzUc9aaeHy3S+ohwdeLMM=;
 b=cOQz8leKh0Wtdjlh/WtfnTr7FwM3gC9FFVhdkoJrLTVa+dXucGnU0N4sNKRAmSPbU24J7BPI2MCUpC4kiAx7OwIgeF9nUQnOFS4GYuRshubgK0Xnncf57S3u5wdIfcAosu04Eh9rd72BHhdLmuZR88Z4Lg3hwYcPVmrKoYO1A0E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH2PR12MB4104.namprd12.prod.outlook.com (2603:10b6:610:a4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Fri, 10 Apr
 2026 12:44:04 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9791.032; Fri, 10 Apr 2026
 12:44:04 +0000
Message-ID: <c427afeb-15eb-4a46-aa6c-fe24631d24ae@amd.com>
Date: Fri, 10 Apr 2026 14:43:59 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: fix htmldocs error for dma_buf_attach_revocable
To: Sumit Semwal <sumit.semwal@linaro.org>
Cc: leon@kernel.org, broonie@kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-next@vger.kernel.org
References: <20260410123703.937822-1-sumit.semwal@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260410123703.937822-1-sumit.semwal@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0110.namprd13.prod.outlook.com
 (2603:10b6:208:2b9::25) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH2PR12MB4104:EE_
X-MS-Office365-Filtering-Correlation-Id: d7d36420-d736-4201-13e3-08de96fed94b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Ymld9jD4OTITreIkS1vU6TXZ6veo15s7+rKI4i3BSfaIgygaTuveuutuFiA+HUcul8jzoLOELCEVjVz+peXaHnX7E5L3eNITc8/zJjnFKANTFHLGksytfTF0Ril6Q2vugADqTm1qI/m4rlSwe0bjPaVc3uDt+74OTsB5g8tZmp/ljAvZx0NfYs2jEnrfRO6lwFaL7/jkpjfHajM9G8TC3nej4ds/9oUNBKWo1cH6HgNMWbomdxtmvxeFJUS/p8WFpUb4NYsXmIY9qwWM6423fpYAnEDQb8p4Jb2I8TY1wNYqkWYfSWaAxPqPUxRTIrPR52YN7eBkFzcVpRKwymP6wWkvfuoNojGh8wwHbEGLzZJfcFfNgzqBCG0QMUfIdPt/B1DVm+t+3gCPpU9bS3j6nB3IHFjg1oy4xmIC2mmCfW536MUq0oBFQrXjSA3eTfTvxPQAQt5IoJQ5+Xwif+43SxbOZu/dOevWbS6+niPsaEATUkK3LupBeAfQXuLhAR2mFk1CkTTCrGqSuf13AD6uZjtN5hdjSv5Bynp3WQg+SNtiMj+tmRBALi8Nx1ATEAr33pzWzPMN1u4gQsYj3VpyC6iSDN3Ll9ChfchYN/PohfG+79VhGIp8gOWVg6x52eENKKATIIdWOl7CzhKb7fUTlUQ01NBLdSnxqtbggkfK6Kb1UHC9tFbeT4Izfev74jcBt7JAfa7cW+NJUD2BDQT9G5wL9coLdE+78pJ+Z/vOxkU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?clB0L2x5N3JOcW9hZzRqNURPVXdyMENYaGM2YnJVSExHTGg2SUs1STJuNmdL?=
 =?utf-8?B?aDg4OUE4ZWRTMG00YUZ1WUN6MFBCN05KKzIxNTNxdjBiOXBmVEJaVU5nTnF4?=
 =?utf-8?B?bzZBK3VydDh4Z3ZaakF1SFQvWXZNbTg4R0hveWJGYlMwYk5lREx5eUtUT0xy?=
 =?utf-8?B?LzhSd056blNjVU1RK3NKN3pMeUI1Q04wTk9iTVN3T0FmVXlZUVRzL2ZlN0E4?=
 =?utf-8?B?b3VvMWNqSmlDT3l1MHZyUXMrUEIxWllYZ0phOUUzNldpWFNOY0hMYWFxNC9v?=
 =?utf-8?B?NmtCQW9XNFJYYU5IWGtKRWJ6T0ZETnVFSWovUjYxK2JFU3JaR3hmT3QrejY3?=
 =?utf-8?B?eEUrMHpFYXBPekd4Sno2VzhSTlh6a1lJOEN3TjdvbXc5cDc0UFB1OGxnQ1Fs?=
 =?utf-8?B?VVZlSXUxTUJwUDRvSDZFb1NXODU5WmV3SFc5VTFaTDM5c0tyZGdGTFkwTFFj?=
 =?utf-8?B?RmJVY3RuQ0VGeXVOZGIzaWZBRzhZbXRTaDVwR3lmVDdsZWNsZ1N0RWM1Z09L?=
 =?utf-8?B?WkhZbE02cGthc3NUV2FHWGszTWJJRzgzakZmK3VtRXZIeWhEYTl4ZlVGS2tU?=
 =?utf-8?B?UjNhTkJnTitDd2M1TWs2aXd1MTRIZkhmVXV6RXo3QmV6Y3FveitYeUlHN1p3?=
 =?utf-8?B?UWU3YVlLc1Eyb0VDU3hFbG9YUDRHRk1NZVM0RmhuUGNEblNkV2xGRFVBcWth?=
 =?utf-8?B?SzlWNFVaQUlXU2VQR2dtQU1nTGJmZk0zSlN5RWQza000a2hYSGlUZldTL01a?=
 =?utf-8?B?NHpaYm8yQ1ZuSlhka3pSbUxOY1VFNVFTRmk3N2VuVkhYV0tBSXRnNlFtTkRP?=
 =?utf-8?B?ZWs3T1RsTDFjOUo5YytEZ1hZYk9zdm9YMVhJRUdXSG9YaE50RTlKZFJjVVJB?=
 =?utf-8?B?UnhQc3VwaEJQVVVtT0FKU0NXREJvMzZTMU4yamdqRU9UZGxXSHUxY3VGVEJE?=
 =?utf-8?B?cGxaYXBmMW85OXJwWFVpYlFxMjg2VzlLR0RBYkZVaW53OTUwV043Q1VkUHVY?=
 =?utf-8?B?T2RwQU1Nbm84L0U2Zkp1Y2xjUW93OVMwUDl0UklWMCtJMTgvTWd3RHNaRUVz?=
 =?utf-8?B?U002RmhydDhBd1FKb2k0eGdJdk5JazBuM2xIUFdUMnVocC9YbXpZZk9pZFF6?=
 =?utf-8?B?MnVxRmxwTEJ2M3pMUXEwRWxhTHQvNTk4OFdTM3gwZjFKdHorQXBCQ0xvbG5z?=
 =?utf-8?B?YWp3d1Z0cnJuZU5zaFZBdm5HTU92OFJoOXR2QVIwUHZhVm5IVVVEWlY2Zy9m?=
 =?utf-8?B?cjZiUm1NTUdEOXFzeGI3VFpVM2FoWGoyTm1jSS9vREpsanl5d2Zuek5yRlVw?=
 =?utf-8?B?WXhqSmlTeHdVR09QYm5hcGhESVJFSlBNK25waVgxL3NvVlRnSzhOaHVNcVZD?=
 =?utf-8?B?a0dxUUIyRERlYm1rS0tJQWVVNHlEWk9XR2JXRnowTUd5Z2oxSEVSSHVsUWdP?=
 =?utf-8?B?VzdJL3c5TzFFelpVTmJ6ZWdyRkU0ek9EQWJlT1hOZkRyT1IzWXFwanBiMUw4?=
 =?utf-8?B?THduazUxMmxZenAzMWFab2hRd0NnVFBoSERLUzUxUFR1MjBCV3I4cVdSMnd3?=
 =?utf-8?B?N21GNXlTMThtT1NEaDdGY1hURkJlSFNzUVZGUkFlc1NET3liV3RXM2w5bFJS?=
 =?utf-8?B?SkxpSFJPSGFZVGdwSFBvdDM2Mm9BSHVLaU93RXI0UXBRYUE1RUxCQTd5ekZ3?=
 =?utf-8?B?d24zN3V4ZlpPM3g5TCsxTUkwMEdydkVXS1cyZTEwbWJSeGFmVXRKR1A4aVl5?=
 =?utf-8?B?RWZSVjFrZWlQaEk3TnpUMFY5ajR3NCtjekNkMG9vMHEwYzkrU1FWNHkwUW1V?=
 =?utf-8?B?T3pSYllXMzFuRWpLUXRvNVBKUHZIaTg0aFBDK2Fxd1VYcEk1QkRqSFI4RTlK?=
 =?utf-8?B?ZFZKM2RaQ0NDZmxZUDBQcnpVVy9Yd3k5Y0hNaU5HOGtKNWZtTUxGK0tRQk1H?=
 =?utf-8?B?QnJlS2pHRkdFdnlzNTkvUUNRNjQyNnVuRGhidFg5cThVbkFBZlZvdzdablVV?=
 =?utf-8?B?SkZsWFUvZTdCbFJEU2phV2NUTTh2NXA5bE0xdm5WN2xvZ2hIeXZtZUQzZUxI?=
 =?utf-8?B?QVVJYnZ2dlBCMjZ4ZDl0MVF5U2psVXlGVHZrcldybUFoTytYY0RIb0NDeCtm?=
 =?utf-8?B?NWY4Z3Mxdkw2VmdvWHpRU3doWkNNZklyNHdiN01WVEhUbi9rSjg3V0pwMWlV?=
 =?utf-8?B?eXVNU2hla21GUUhtSjlrL0VkcUYyMlRPU3FpY3grclRyZFJJdjBCa0lVdTRh?=
 =?utf-8?B?THd4NXZzTXJQamE3VFF5eUNJdFp5emU2RTlyVGM4eVlCVVZ5QytNdTVmNUpK?=
 =?utf-8?Q?prgV7RIoTdx02GPgk3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7d36420-d736-4201-13e3-08de96fed94b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 12:44:04.6748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MKQJHBL9iZxe2Pl+ylEDwNIdPBB9qWfuimC40g8HOKCN7FPqUR6Yd65T0qlCyMOO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4104
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_FROM(0.00)[bounces-58548-lists,linux-media=lfdr.de];
	RCPT_COUNT_SEVEN(0.00)[7];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[amd.com:+]
X-Rspamd-Queue-Id: A90C63D7D61
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/10/26 14:37, Sumit Semwal wrote:
> linux-next testing showed this htmldoc error due to a missing extra
> line in the comments; add it.
> 
> Fixes: be6d4c9e9d714 ("dma-buf: Add dma_buf_attach_revocable()")
> Reported-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/dma-buf/dma-buf.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index a202a308c079..532c3f14bf9d 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -1353,6 +1353,7 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_attach_revocable, "DMA_BUF");
>   * Upon return importers may continue to access the DMA-buf memory. The caller
>   * must do two additional waits to ensure that the memory is no longer being
>   * accessed:
> + *
>   *  1) Until dma_resv_wait_timeout() retires fences the importer is allowed to
>   *     fully access the memory.
>   *  2) Until the importer calls unmap it is allowed to speculatively


