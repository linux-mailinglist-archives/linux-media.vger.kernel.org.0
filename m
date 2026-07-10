Return-Path: <linux-media+bounces-67279-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XABkFCfUUGqA5gIAu9opvQ
	(envelope-from <linux-media+bounces-67279-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 13:14:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 998C873A06D
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 13:14:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=VCTgJ131;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=KU2uoi0I;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67279-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67279-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E94DB304B2A1
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 11:11:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B22B4416CE4;
	Fri, 10 Jul 2026 11:11:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37060410D32
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 11:11:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783681914; cv=none; b=Tle18Yk62poYaxKIgGbW3ETaET1xKoKE3bdpigGuy2P/nMuLg2fadEpQcBnWB/+Ndvo1S/6RJrvqahXmzmizhSZuAB/HbrCeFlw4zk9wCx1ZHWPk3xCaf1RhLSC1Hxn90rJB6KZEtLx9+6iU4Q+tKDw0Ni9AAIHn21ej4fHcKOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783681914; c=relaxed/simple;
	bh=MKPke5BUYCTUcfxDA8duezcYg48WdqfGwObsktUR5lY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sqO0/gVE9IqnYIX7hTSNlChgwk78tibckJLxHjHKgIs+V/I3A6BFoKnSW1BCoB8CHxVdJ0Z9Rer/C72UNytpvfJHzeUq7/xJMI8ACmjBZvTvSFQP2W1iF7Llj9UowCtxLlNR1Pz9EDq/v1RlCux47SV1cye4ENRkiqyz1OqFIbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VCTgJ131; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KU2uoi0I; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AAmPaJ471742
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 11:11:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JU6YRxZVspUNbu+VKz/3WI7sJx1qZ3NhZ7bU7qRiJXg=; b=VCTgJ131iEPM4MAE
	8AYlc6FUY8uYOy4BZ+QjxJUMPxwOJP1fAdceJXbGSle3LxdPLs/ci66EsO43j6Aa
	aCV35X4L1GQDnSm7oi2OXuH2GTtAB8jKnxUTqGN99GkNSqHGFM8BsOCG4XOOiG+R
	K6P28wi4JcS9YD5PpAJvsQNwH9pOd+mbfQXlUGRMwiZ+YRyKyDMRmw6q2tyBKrg5
	zcuhJAAZdqDAkWin8FUYJDLXkAYcL/t/TWBIIzqwQ9YloyN3IjqfdZdvcQWSUsJ7
	wUsiP0u0b/+jxA+UfqEZAI3Hst6y/HtalCKmlTL1+NFiI8dWKz6RLaOIlWWkSug4
	/z5aJQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fax5dgbyw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 11:11:50 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-388b404eae6so1659170a91.0
        for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 04:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783681910; x=1784286710; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JU6YRxZVspUNbu+VKz/3WI7sJx1qZ3NhZ7bU7qRiJXg=;
        b=KU2uoi0IuETp1dL6Tf0Wt5O73+b6emnQZRmNod6hZ8nOWeNKhPGA4ZKw8Tt7KZd2Ho
         53vivZZYXn6UROqxW3RDhkDzur26XM7anpLZ8k0QE7t3VFugB1gYZKTEO64wQdzo6WZv
         aQHGqKYAaLvp1qgimb5b3EGsCbWnpxAraaRvMpk9Mk4KNrXpMUA2UxmkmGCoM7pYZXTr
         z5S2ZKzM/HTT+jSbr8ZPiXbDIyN2Xj6XNxbfCDKuwy7THPBA6yiEHo4WG+FGs6AAzjl0
         LOUt8esrlVB4gVcxNejzVUhM0gteJ/t1JWWw38t9g3GFYsoYvYRVSi2hO7RNkbzvGo1y
         QYMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783681910; x=1784286710;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JU6YRxZVspUNbu+VKz/3WI7sJx1qZ3NhZ7bU7qRiJXg=;
        b=R1HvqQCYQl1/GuwKB8yfi4R8kgALg8vXWNJfDxPsqiifiDYH4u3WtKN1qtP3Po05zb
         sJBT0kl4nPKkXx3bSsYtDeDas1XGptrqrmzXFRyWy3lEp45HzUw135i2Gytn7kKj01Gj
         In9qX/vKhFtCJ9b6rjg3HYW9eDP9p1hDkrt8eB2TU8fkgf6OxGRTAYBIE6+NwUp7vt5I
         3Bc2G0/mf9a0dcxwJzCog/pcCfo9DuWomRe4s1XS+5Wqo2rYjZVMf/ZP57+lcceBkobd
         A8YHwLWJaT40gYjXF9EvafOnGcUcTvvMxmTQH6aJo/jmXy3+ybMjNNOWwSA9BbcNNDaw
         eQRQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro5xNAQbVTc3oVdD0J12T3eVrbnY6P+tqzsdJeOOSoHCLPQKdg6mq7VHqw0ZTnLKF+U6wiH/naFonovvg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6/V6raEmYUtlXpob7QA/3XrpUrx8wtEQuE09crDn7NWrFkg41
	D9t+WUfgWKXSM8eH+wPSgyflDXKA5IeGKcZjDGEUUWUyBBgSxPGZMdcy86IdzdjDFS4+XSxiV2U
	tSP5v8BADvetDlgKYZdaxe87wZHHcIfEQ/mq77EJDSqOZwFC2cTmi4rvEcmi/Yk+bhw==
X-Gm-Gg: AfdE7ck389VSOPZogoojmARY3jshyc9GHdsPSTXwwJffS8xrXl9ahn2Bft5IlshK3gi
	uZHvMmAhwxE9lpRhPPGch0MtA3xYvGwgKjj0sCQ1BPMC1Kk0lNqZH1LQ+kkACe6f89hw3yNmSGd
	++jjgN5rFXOZtSZz9M3VfOTZ9mP9mV5b476cM1umMvM9uqf5DWqFeXbHFG4rgXlh/ZjeX2LWkkv
	gwWhwpVNfxElb8wgAH5RyEUm6AxOiMxwRtZt+RQN9bEZlE551JPL8juzo/qA2F+dg9E95+6wDFY
	9W0cv4m+phyRWq45ua7j+ERvsZkKHn48OIv9PDeal6/ZlHkX/3q+I/87kIjE1tckYWjrlWceNjN
	av+VbXTqKZoq10aBMnrPM42u7wyIojvZO4v94Mbom8Z6YX7pTbA==
X-Received: by 2002:a17:90b:3f8c:b0:387:e0cb:7f7 with SMTP id 98e67ed59e1d1-38942b786e0mr10762373a91.43.1783681910296;
        Fri, 10 Jul 2026 04:11:50 -0700 (PDT)
X-Received: by 2002:a17:90b:3f8c:b0:387:e0cb:7f7 with SMTP id 98e67ed59e1d1-38942b786e0mr10762344a91.43.1783681909714;
        Fri, 10 Jul 2026 04:11:49 -0700 (PDT)
Received: from [192.168.31.103] ([152.58.31.181])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a5516ad7asm2610062a91.3.2026.07.10.04.11.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 04:11:49 -0700 (PDT)
Message-ID: <e775ae90-86d2-4901-8057-264953d25c02@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 16:41:42 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i2c: qcom-geni: Add dynamic transfer timeout based on
 transfer length and frequency
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        mukesh.savaliya@oss.qualcomm.com, viken.dadhaniya@oss.qualcomm.com,
        andi.shyti@kernel.org, sumit.semwal@linaro.org,
        christian.koenig@amd.com
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        naresh.maramaina@oss.qualcomm.com
References: <20260705135739.4038826-1-aniket.randive@oss.qualcomm.com>
 <4f865aaf-a400-4dc6-acaa-80dc22a36af7@oss.qualcomm.com>
 <6b53fa97-0fae-4ba2-a774-ae8df2c2ad4e@oss.qualcomm.com>
 <82326bd4-59f0-45b6-8f06-38896cf9f9bb@oss.qualcomm.com>
Content-Language: en-US
From: Aniket RANDIVE <aniket.randive@oss.qualcomm.com>
In-Reply-To: <82326bd4-59f0-45b6-8f06-38896cf9f9bb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEwOSBTYWx0ZWRfXwDWdZomEfnET
 EF9wyVvBY7f9TGjL+QMgIb+7r3pTahsqN974zG0qphiR77koy9AOGpb7kwpnzThUVzTXvs7GaK0
 tw6SzqUq0UrgCROypwV80SrjZ4yCi4A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEwOSBTYWx0ZWRfX+S6Y/6TY2YDI
 54gZ8dgbu3Jfxm6LCppY/nPSe/ImEUcqDeD7WEjLsqcRbb+8KD7x86q2R5V9lPbpfEYdBC9jpqF
 pIvTbZKhLp6AloqKYbvcXo1ybFtcbfZwahnXBMTMn8ICdMZcFwh/wlP3pGpZMZYzxjB144pXB19
 /XgLsSwjNCQGfrdPBUvEsgrQnIOoBrmU/ZgJ9RktGgJdyJ5gnAjpfH+RwBnzi1mSHURb07zC6I9
 +lVwWv3R6jIQZ6KnSwul6OmCTCw/mKcgp6vXzAHucAuBIBowHytBiaxC8nRJvdHcLvMBUWtfxNL
 u22d5sk44lv+wvrQ3cFisCQyPmmMsnn444uJXlf+tqXFvdJr6PLkU49s7QBlZ+aWFK8WYW9ghvt
 wWNEXGeiZNKccZwtAXWs4Hm8lk+C4twZxMnoO87vsxwAJ2aCEpm99CDO5p2WXtnTVIcp77zOFDB
 ZNuctgzgKKKAlZfsgIA==
X-Proofpoint-GUID: zVL68BnZljObNIeYGYs77IEL8ZOdguKe
X-Proofpoint-ORIG-GUID: zVL68BnZljObNIeYGYs77IEL8ZOdguKe
X-Authority-Analysis: v=2.4 cv=M/x97Sws c=1 sm=1 tr=0 ts=6a50d376 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=9AXozQ6IwN0d4JI31gUtBA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=52HooUGS_mQjH2t11kEA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100109
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67279-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:mukesh.savaliya@oss.qualcomm.com,m:viken.dadhaniya@oss.qualcomm.com,m:andi.shyti@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:linux-i2c@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:naresh.maramaina@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[aniket.randive@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aniket.randive@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 998C873A06D



On 7/10/2026 2:57 PM, Konrad Dybcio wrote:
> On 7/9/26 8:28 AM, Aniket RANDIVE wrote:
>> Thanks Konrad for the review.
>>
>> Sorry, I missed your comments on the v2 patch and ended up posting v3. I'm happy to post a v4 incorporating your feedback once the discussion concludes.
>>
>> On 7/6/2026 5:11 PM, Konrad Dybcio wrote:
>>> On 7/5/26 3:57 PM, Aniket Randive wrote:
>>>> The driver uses a static XFER_TIMEOUT of HZ (1 second) for all transfers
>>>> regardless of message length or bus frequency, causing unnecessary
>>>> delays on error paths.
>>>>
>>>> Compute the timeout dynamically from message length and bus frequency
>>>> with a 10x safety margin over the theoretical wire time and a 300ms
>>>> floor. For GPI multi-descriptor transfers, use the maximum message
>>>> length across all queued messages as the per-completion timeout.
>>>
>>> What's the reason for a 0.3 s floor?
>>
>> The floor accounts for I2C clock stretching. The spec allows slaves to hold SCL low indefinitely during internal processing. A dynamically computed xfer time alone gives no time for that.
>> 300ms value covers worst-case stretching while still detecting real hangs 3x faster than the old 1s static timeout.
> 
> Please put that in the commit message and possibly in the code as a comment

Sure. I will update the commit message accordingly and add a 
corresponding comment in the driver as well.
Thanks,
Aniket

> 
>>
>> Thanks,
>> Aniket
>>
>>>
>>> Why a 10x safety margin specifically?
>>>
>>> [...]
>>
>> The multiplier covers the gap between theoretical xfer time and actual completion time (DMA descriptor setup, interrupt latency, and scheduling jitter on a loaded system)
>> Without it, short transfers would have almost no extra time before a spurious timeout.
> 
> Likewise
> 
> (Should there be a constant safety margin added to account for all
> that? Keep in mind this driver will run on a turbofast Glymur and on
> a notsofast Agatti so any numbers that depend on the processor's
> speed must be reasonable for both)
> 
> Konrad

The 10x multiplier was chosen as a conservative guard band to account 
for the gap between theoretical transfer time and actual completion 
time, including DMA setup, interrupt handling, and scheduling delays. 
Although the value is not derived from a formal worst-case latency 
analysis, it provides sufficient tolerance to accommodate runtime 
variability and helps avoid spurious timeouts across a wide range of 
platforms and system load conditions.

Thanks,
Aniket

