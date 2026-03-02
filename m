Return-Path: <linux-media+bounces-54061-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MBJyD2BTpWkR9AUAu9opvQ
	(envelope-from <linux-media+bounces-54061-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 10:07:44 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2B41D5416
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 10:07:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 948C4302BDC2
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2026 09:06:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20824383C9E;
	Mon,  2 Mar 2026 09:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="HQP1WVPW"
X-Original-To: linux-media@vger.kernel.org
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012011.outbound.protection.outlook.com [40.107.209.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D7C38BF6D
	for <linux-media@vger.kernel.org>; Mon,  2 Mar 2026 09:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772442385; cv=fail; b=pcadOO9k7KV1Nq+iFBKjTrXWpewpFRMSMExp55YEcKIbwcDmEHJf2TIsu++DMEuxkbSpluJBzJnnVXAlZhIkz6RyAXyd66YEcLfae7DVw9iZeh7eBV0J7TRDYcOJlzDR+y9qPwGvTVEFICbchT7TzXsiEraPwqwAaEygq4NtNFI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772442385; c=relaxed/simple;
	bh=Umc6fE7lkX/NVBu97vQOoUUJnaP0urf/NXML7e+tOt0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fisjv7C34UJydWYnboe3LzTHHz0rdjC4IlpQo5a9cqV56d6lXQSQxb7m1tKAEQKXHYreRB93fS+Vwh4PJ1DCRN8cTmISeKcxX0uI8UHwNDlgVb91vDl1BmNKP5EEXVP8kYI8wYJFo+PM4CSBPbQy9tC9Wqnbh8ZgRbptjS/IJIE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=HQP1WVPW; arc=fail smtp.client-ip=40.107.209.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b0juK0/Fz714bdxr2TsJfsAsgCM/KbuOxzVWI1pTxhvNis0qNduKmoV0rv9Jq8uB58FDHgjrNp12SjzXLzVIrM7DFdZWySzl7/9wy16KZB5uT8UemgonpGVqjLEjCdqWqkZnSmdzIOhatW6qDYlwD67xeGPatnbagXBDNLGkKdmW4p2Zxkc7UQZo5V1AACcZFgaMTB/Njq0GkIXTmns0E2Fw0S91HAb+YhS63sXZu264RHYUKp+HJXao0pMMrC7Shy/4RWV+2OcFiR+Hfk2VQ3zFDHg9tEuIQSYawxX8T23AQ7jK6AuZoXEhpOl4ovhfWXFqJQudA/d79rzk2gkLnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ztNxdJxGcTNOhkLVwu9JhB60ygDNA1sX099tjiDQJ6o=;
 b=fi8TkE4OXV9flh/RSoZoX5odwfSCePhc1UBCC77e//Ey3XGg5H+BR9bF4cRDymFTZkCPGif1NqBJOS80jOzYvplPhKCCq17/zbZIUTEySS8hNdCW6oK6Hvkg+qsjjI6j//NYk3I4PcxERwtG3+XygydKJH/G0HSudOeiLOyR028v3jOkFEdFR3zbtDAGV7WfIaB+XmpGs6MUz/SC77fB193Mguft/aQG7b00P9umFu81L675v5rEtxtSZx56fIpVJ4KSDUQWbyp158UhmB5MyE+hJx0iv4/mqFKNy/AzvHu7IgxaPcCgukBThGgWNxzqda6EsGkd+/moPLKBch736g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ztNxdJxGcTNOhkLVwu9JhB60ygDNA1sX099tjiDQJ6o=;
 b=HQP1WVPWOidd8ouECnE25YPEYOPHvbKYBEbnPv8jhunZJ3LFohbyMFfo7h6rslPW44/CxxvXkqt9om1j5Hl8hOxtmNPKfPDGripAVUcZRqLFfUBFwPVRWf2rY9YC/f5z+T1RXczr9tPiyYP2egxNHMaddenud0Rzplk2egKzhcg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB7533.namprd12.prod.outlook.com (2603:10b6:8:132::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 09:06:20 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9654.014; Mon, 2 Mar 2026
 09:06:20 +0000
Message-ID: <e1d95b76-7e7b-4dc3-a9a2-37f1d7f85988@amd.com>
Date: Mon, 2 Mar 2026 10:06:16 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dma-buf: Suppress a thread-safety complaint
To: Bart Van Assche <bvanassche@acm.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org,
 Marco Elver <elver@google.com>
References: <20260227165501.2062829-1-bvanassche@acm.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260227165501.2062829-1-bvanassche@acm.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0046.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB7533:EE_
X-MS-Office365-Filtering-Correlation-Id: c9222db4-468b-4f80-b0e0-08de783af80f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	q+uJ0GVuwFUvQPjCY9nbtM+8pUburlGAuvXtq1sIC6IgzjNpItRjvquSTw4disSb3yvk+nQk1860lIexScCrddN0NxkeP+lZQTOIe+mJ2uea/vfWI1E6vnV0ErX3eYp9K9EY5RyFQBkBnUhAv64aOkBWPVDfD0UCD6mOpJ4f0d8nl/0y07QDUBQAcEFWfDau5tguaFd0G1waK0S4tRyj71q2WLlMHMB98X5A0bM4PeXvRTlZKv5ltZ/4qPO8SvlCyjwyH3jYd6W8/O7RdodT2G3ngsnHhvIiz9oiT6LOtcMhVSlizrHfhtkeTTKECnSOcLlRQSiBpWgpUkjJGUL/ysljuKvKQ3QsbSPRoLRg011zdm3bHRTLeww7nbE8g+BWulWtrI4Cv5TtNSGI08eIe3RnmnVfzVF6wJtYlfeTQkW51apmPod+KYxd4EkIsSU18KW1d6Gmtt06op/V/vWt9mNjfhOeNsoe353KT8IPRCb5oRoop/1zMhkpPL+oVhMaEDABQ0SiVmWKnd7pqZJB5HpFKopesan7igYaJihjXSecEE8WO4LJQCSqxglc8yH4AR5Od2oZ2xZOR91xOaHebXqNh3Ei0p/SNKcfbTCnq4Q2EP3nYQDYFRrESFVmKWEM+Pi+mmpQCDxOdPcy9vawcqwDpbL5/jK5gOnHF4QHdUZ5Km/494rclgEkrA/QVGsxtiPKmP3a/wdCIam8Gh2qFpoVx6oMMvoJkq2rvcetUtg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MEt5SGs1U0pJVExrcE9td3NlSGJBeWJ5SHYyRG9nOHJNTW9aN29WbEF6WG81?=
 =?utf-8?B?WUMyM1FJcmJhSENWUG1mQkVzTXhmUHlvWW5FWXkrMTNSR1g4RkUvL1ByMjgx?=
 =?utf-8?B?L25obktGMENTaGxKSWUwVFAyazMza1hEN0xWM1RFOWUwQVZDSE96RVowSEJo?=
 =?utf-8?B?TzFLMUNtNC8vaVFiTW1CYTdUanRObHhMM2V0WVlOaFlGTmxpQ0Zsb3laRDMx?=
 =?utf-8?B?bFltVk14QytpaGlXc1htSjNKSDhraGNzcW9Xbyt3eXlzNk1SelEveEtMdWFQ?=
 =?utf-8?B?WVlKUW51MmxRTjV5VE8rbGJrWXB0Q296TDUyTHpCNHFPS3NhdFd2MzRISVpT?=
 =?utf-8?B?RUV3WFhzTVprSXJuNjVUdDhXOG9HWmNOZ2Jpd3hvKzM0TDZ3NjdaZFZkR3E2?=
 =?utf-8?B?WW9hYlFyMEpiRXQ0czZ4ekxheEhWeVRLUEdlN1NnSFZBYlpYRGhaSy9UUmV2?=
 =?utf-8?B?MHllUUttTmRHam1MTVBqMkV4eHJiWkZlcU5WZi96VEVzTGp3ZlRsMUxYdWRG?=
 =?utf-8?B?eGgrbDlGSmdTQnlrNmtZMnQzaDY3ZCtrRG5LRzEzTHpqT2pBYWRVamVaTVFu?=
 =?utf-8?B?cW04QVFGQXlCeFFvYjc2YkxJU0VqRUplTHdZVmpGSDRNVlZXOE05Q2ZDOHJS?=
 =?utf-8?B?dXp6VzlKUnlTNE03dmJmK0p1UVlDcFhrK0JydXZsNEZpamg3OFM3R2lJL0t0?=
 =?utf-8?B?M2ROVEFrb3NTS2tSM1Y3QjJMbGhuSmhNYjBQSzBPUFJPZ3ZFTEVOaFdiczVq?=
 =?utf-8?B?c3pXL1ZkTmozRmE4QjNIbjBndnVaYnlWL0k0NGw4Tzg4bE03Rkl5eWZ4MUhi?=
 =?utf-8?B?Rnd2WGRYSlc3eGtXR2NDZ01BaERqSFNkSEwxR3R3V3Rkby80d2w4eFBlMEJQ?=
 =?utf-8?B?V0MydzZDU3NjaVdBSUpsN2lyck1mWkQ3d0Q1eWlpbWdBZ2lDTGc1Rjhsakxn?=
 =?utf-8?B?c0dsd0FITjFENm1ZT1RUUXJDVVlHY2xNS1dtcXNxWGh5bEh0b0FBNzYxZnBu?=
 =?utf-8?B?ZnliYWZyS3JVL3BtQ2N0M3dsRnZVaWRhVTgwaXdVRFFRTmh1dU1iWkhESHox?=
 =?utf-8?B?MHMzaTVTcjFncFRneVJiMGpNRlFhVERkdmViZlZKTExoR1hZNkwvMHdtYmxl?=
 =?utf-8?B?SDBXeWRrSWE5TE45Z0F4WlJUUUtnTW9VdjlIaHFGVC9CZGpVRlUxSUVGMERJ?=
 =?utf-8?B?Y0dKODQwS0lPaFBOYXRpd2pBSUdCekw2TVRRRUtkNTBlaUU3TWFtaE1hZ3M0?=
 =?utf-8?B?ZWdycTZTUWRYVjBuSmo1ZEZ1TVE2RDR1b0VhZ29INUs1R0ZOcEFLWThXR0FJ?=
 =?utf-8?B?V1pKRnpzWXZpWlU4OVJmdGdpMlNobEpNZDlkWVBzQ28xakEySkVoOWZZSjRH?=
 =?utf-8?B?SGcrVjFCUEs5VjBMVWwvS01CajBmSzZPYU5rMG83VjYrbDBQUDRmL0N2TFRM?=
 =?utf-8?B?OXJPRWRjUEhyL0lYQ3UwRE85ZVkrWnIyWkZFYklDcUgyeFRYa1EwbWVkTHZi?=
 =?utf-8?B?S2VCNmZ5bmtsMUNoZkRtRUFYZlZkaVc4VFdwc1VzcjhzdU9hVlFrRndWTW5B?=
 =?utf-8?B?bXVhdWVSbzg4L0RqVFpZSTF2TTBjRjVvOVVZVWJveXcxZ0xzRWhRRjZHeEpl?=
 =?utf-8?B?aTE4M204aCtGeHI5OFdZeW05UkplaHc3Y0o0N2VEYnprSXp1bktORklkeExx?=
 =?utf-8?B?cDFCcFcyenVYV0U5UGRvQ1JwYVgzakkvZzR3VFlYUFBZbk85S2ZsY1pwQUZv?=
 =?utf-8?B?bnBHeWVjV1l1L3BrR1pkSGJCMUlhWmtaMlNjaE9Sa0NHTldiZTZxdEVGT3Jy?=
 =?utf-8?B?eUNUOWZuZUlFODRjU1ZIWjNpNE9NOTVkbGV3Um9wejF6SCs2em9oNDRWeWVs?=
 =?utf-8?B?RmgwYjlHbTY5cno0ZmlOSndMdUVDNTlOOVZDTGc4aDdvZEhXaEptVzR3eHdr?=
 =?utf-8?B?Q0JETGI1M0xKK2VlcHRxaEdRNTA2L0tWTjdCcGMwZkJ2S2xyT2VmZjZLVDkv?=
 =?utf-8?B?UWNlcWlnK01lU1NRa3JlN1ZXbXBwOTNkeWhySW5vVGxnSG0wWVNRY2NUSFl0?=
 =?utf-8?B?NzZILzJwTnhEdHBzOWlMSlFMd2VsMlJmem54YUNwTTl4UGZ4UTU3VEtGSHdW?=
 =?utf-8?B?Zlc2WkhDVFZVYVhIdHlreFkzM084R3AvQzgxa3lJNnkvT0d6WVFpSjZ1eEdx?=
 =?utf-8?B?cUNxSFJubzV1VFQ0cWJycWcrVU53SDNpL0JSc1VzWHR4VFcwcENoRndTVzN3?=
 =?utf-8?B?OW1mbE02Z2ZJKzJIOVA5Nm1LWkFuU2FBem9ralVrdDY1bFNFcUt2ZU5ZMjV3?=
 =?utf-8?Q?PKMHxISmknAoFq8qD3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9222db4-468b-4f80-b0e0-08de783af80f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 09:06:20.0132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NvvuxZCZkebcblEvtqUuCtswOQOR9znZVfABEuKVUkXqNKZkxPFq5eT9v1L13iOi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7533
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[amd.com:+];
	TAGGED_FROM(0.00)[bounces-54061-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,acm.org:email]
X-Rspamd-Queue-Id: 9A2B41D5416
X-Rspamd-Action: no action

On 2/27/26 17:55, Bart Van Assche wrote:
> Handle all possible dma_resv_lock() return values. This patch prepares
> for enabling compile-time thread-safety analysis. This will cause the
> compiler to check whether all dma_resv_lock() return values are handled.
> 
> Signed-off-by: Bart Van Assche <bvanassche@acm.org>

Reviewed-by: Christian König <christian.koenig@amd.com>

Do you want to push that one upstream through the DMA-buf path or do you want to upstream it through some other branch?

Regards,
Christian.

> ---
> 
> Changes compared to v1:
>  - Removed dead code.
>  - Removed the return value changes.
>  - Added a comment and a WARN_ON() statement.
> 
>  drivers/dma-buf/dma-resv.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index bea3e9858aca..ce9e6c04897f 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -790,8 +790,11 @@ static int __init dma_resv_lockdep(void)
>  	mmap_read_lock(mm);
>  	ww_acquire_init(&ctx, &reservation_ww_class);
>  	ret = dma_resv_lock(&obj, &ctx);
> -	if (ret == -EDEADLK)
> +	if (ret) {
> +		/* Only EDEADLK from the error injection is possible here */
> +		WARN_ON(ret != -EDEADLK);
>  		dma_resv_lock_slow(&obj, &ctx);
> +	}
>  	fs_reclaim_acquire(GFP_KERNEL);
>  	/* for unmap_mapping_range on trylocked buffer objects in shrinkers */
>  	i_mmap_lock_write(&mapping);


