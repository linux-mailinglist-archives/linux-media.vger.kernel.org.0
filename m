Return-Path: <linux-media+bounces-67624-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VFpSOU03V2rwHQEAu9opvQ
	(envelope-from <linux-media+bounces-67624-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 09:31:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DC875B71E
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 09:31:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=flWivHx6;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=UhpPPZG7;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67624-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67624-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF7873015723
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 07:31:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40E423C457D;
	Wed, 15 Jul 2026 07:31:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4072331EB6
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 07:31:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784100676; cv=none; b=OvQEcnRPXlbNqxlOe6WtlGHAnmyPYz/B39D56qjZfmkn14bmlRv+e8qVRyEgPY3QqaksAKSd4lHaoZKBDk8bn0YCNLsI+mzXEsodVYFfLrtU1j1rhHpIi+GhIBJSoDLez8dz5NgBzTuhsUy87Rah1xb0Ws6mkOaxRtiKDuQBjN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784100676; c=relaxed/simple;
	bh=h8Ayfh15p/outZyG3S/PIYqcrbov9ckVFA754vJaIHQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LX5AYxJl9sOoat0JhhIVCGmd3KhAqgQ39Xr8aTF3dIBrBPi8DWQOyZOA50O6GnAUStdVsiXAKXGhZjQNmgRws898uqakQEnMCqurCxOhrpmmKU8uFWEGcfzB90+kBlAT0kVBQdIoRUAecFKghx7l0aqvEKqm61V3hOAnkgkmjCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=flWivHx6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UhpPPZG7; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F3lHS72555524
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 07:31:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eVZ9ZigYCDlcDM/PZqVHEcpbio13v2AmIbxFezgYnAc=; b=flWivHx6DSNcEF4l
	3+WFGI5my90RIuFOWmXAH/VxAWTSY25H5DEk9L8jww59k0gz5NqgLobeUCCoRnPL
	hkVQWT2o39jdqbcaCjhudF01tzfSHGN+5+Fbp085SMJBeA5O9X5/il0/a6UU+JfF
	tFudpmaESNF+xHLhdbmvcYn7CS7pDJQJjpTGmwNQWk3N1aIbzWTvTKUYSBTPAs3q
	5p462r957NYRZbi7tD/hlVGkw/zqcastK20VjPhAxYz+1eWdIBQl1FaET4C08WPo
	5hVkFCG/XSgBf7Hhg8dVTiIG4IZsvjXhrSWwMu7ZFbJqrgjdtNA8gwVI40dshMNR
	/KwPAg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fds9kthsu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 07:31:11 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c15c77619so13139281cf.1
        for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 00:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784100671; x=1784705471; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eVZ9ZigYCDlcDM/PZqVHEcpbio13v2AmIbxFezgYnAc=;
        b=UhpPPZG7Z9ZraniwaIRdU9Er0GrxvJLt25PFd+pJ3yN+R37aJRjU3y9RcFI8xzkVFs
         zEQUrghf0TL8SszpiMu613yk8HPL0iRW14rPPokoeQfQ6yZ/BHObJbbOtvGyf5rHnGgF
         eVMz+9IzSZHdf/8PO8WtXNjHBfts1kW6kApZ4EefXTG6mF/FlxunIK+pJJDyuCjtmBEP
         rWKtgNE0n/wpAYyNdngpcbmv5b/4PV7KnqQ0lqUfL0tQuV+YinpjKbYI/xxW3XjEWEmI
         YUqWtBNSLl9o8Xih4p0zLtMvXM8LtBI9ySHdImIqSCbEiQwR/2rngSVnQHAcRODIJmZX
         XuCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784100671; x=1784705471;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eVZ9ZigYCDlcDM/PZqVHEcpbio13v2AmIbxFezgYnAc=;
        b=mYrhdtAg2PjwhsXAWkhlUFIhD37TeoxA35iExbxwYhsb1Fn0Lwvt5dFJnyw4yE6XDn
         JTnINWYrMaDb6vbJfy0Fvy8TDD4VDE8AGbvmSx7Wrs2JRYtiLpBKSS0SdFmp78sdYxbB
         VJ0s5SqVZDLdgTq6BNGtjitxggSK3pKr7KGuKjz+T4jf4l42cutBNLxqblFi1hOa0wr/
         MClV1nUo0H1Lq+Qe6gODIxUvQD5QoA1+Xd6utcCxu6NUrHMF9bgrajOhgo0AIP74pilo
         nQ8Axj8Xi+1/QLYWZdN9InrLDa/lPD8Z5aADIAfO/GlEOIUhSK6wtLhjeUYIblHiprAK
         M6MQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro35gzJbjF79fSI3U/MQ6HEmQEpfR38S0HS5/yvDnpDC0A+vph1RackgvUdTUU15fBwYmEOlFuYfXgbSw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzjonhmbv4kCefdSbshfcBK8s8G+aNaUfOaTHPn9EWH5HT2uBUL
	nfgBbrGBaDYXMbA/YPvBmbJCA7TIdhzLMEHtT7KarxRpK9SlhVbUkR8mrX7N8HvcvBaQG3oAdd+
	VVZTBdrwvvRJe1tmtWuFUWiAPvxm8QlDBO+OgEoR/kyD2fvYVVY1s7gyp7RYt+G5bbw==
X-Gm-Gg: AfdE7cndmpB2SlAXt98HYVUmAkjm584n43mzT2K9eOoKw4W1l34n/nW/My3Tbqio+9F
	yg6WoPqebWzwisDN2W8xIwJSnfvt9xjgo4vkNo0HOClHtapirKS+wr2tvveJGyE87b6gjUlH6+e
	d4e/zJIGL1lKlzc/nn/lqgdEf8Y0ZT9jQ5TA4MGv5qrsElLNZszG7ApH7dKXhKBPm52veepQOOZ
	zkrF4368tgXr9KNRXzJTki3Aq23VDWtHACkVNQgMnFg88CdNNmjBsdWKTyjzRq++Xgt7As1Pf7p
	dk9e2wJdBQ+0oOUAXAA0GotP8U1mvDlpKuinjXdnwWBwPBKeq20LTmZ3oqrjUcRA7DPeqJR00pX
	gTyMKcxTQd09vp0GImwomlLMdQpUo6xufm/M=
X-Received: by 2002:ac8:5d4e:0:b0:51c:1744:edf0 with SMTP id d75a77b69052e-51cbf289286mr135432251cf.9.1784100670967;
        Wed, 15 Jul 2026 00:31:10 -0700 (PDT)
X-Received: by 2002:ac8:5d4e:0:b0:51c:1744:edf0 with SMTP id d75a77b69052e-51cbf289286mr135432081cf.9.1784100670440;
        Wed, 15 Jul 2026 00:31:10 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15fc29937esm790840866b.22.2026.07.15.00.31.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 00:31:09 -0700 (PDT)
Message-ID: <d6cbf1c1-9af5-4c06-abd0-0617dcce0bf8@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 09:31:06 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4] i2c: qcom-geni: Add dynamic transfer timeout based on
 transfer length and frequency
To: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Aniket Randive <aniket.randive@oss.qualcomm.com>,
        viken.dadhaniya@oss.qualcomm.com, andi.shyti@kernel.org,
        sumit.semwal@linaro.org, christian.koenig@amd.com
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        naresh.maramaina@oss.qualcomm.com
References: <20260710161056.1799019-1-aniket.randive@oss.qualcomm.com>
 <e53ea721-bcd1-4d8f-9b7a-ea6ec3003f71@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e53ea721-bcd1-4d8f-9b7a-ea6ec3003f71@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Q63iJY2a c=1 sm=1 tr=0 ts=6a57373f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=lLXzRi4vikbFFa1iuNgA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: Umn7HGkB2CaWjte7Rk1_MSxgBxYM9liV
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA3MSBTYWx0ZWRfXwQ5JKdm3LAjV
 Of4ealwXws2Ctvpqj1fFqARCm0c9U2Pl5LLSuYC+6kgbRR6jDXcd1OeyQNpQQXjxQib9NNrWJoq
 Z8gUgfn/Yl0C+akHUXXWpwVfWnqMAaY=
X-Proofpoint-GUID: Umn7HGkB2CaWjte7Rk1_MSxgBxYM9liV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA3MSBTYWx0ZWRfX7iIjYNUIuP++
 nl+9nFmAKxhWkElFEbyACxjXwIgU3KisWCLrn0ziKjBgZVq8+McbNWbMRBQ80wN2lDMcfTE+Ck9
 dy75ipN9tw8rUz6huCZX2ljFEGsIsXq6EmLCv65w1aer45V2IVj1Oe8sf5oGBYzbJSPFTg7MVWU
 EGS4CowRe1fM0gKBtokYHY5bx7unwphw0hJHHDhq2rY0vkngvix9fhK5jehgFJLIi+ae3YNvmwy
 KVLzNaOHXRZVmaZKa7edh+JoLUHgpbBIPl1ujF3S1entkEsYwetRilpMennGWYUwKeHeLfhrBLD
 lmjM0i4wCcj9QJGbmYY+gyOMM14jGf5bCwrIWE9Jq6xaqrRdJ8CoJC37Sccx3dtwNkUL1d9nYQj
 gmbHn8pDTIb4i53/DX4BAu2KpgsvuhYY36D9tvb4UPZPbDCy3u7Ff6Zk2a+JUNy+NUwkIb6DdF+
 7YR7rsAzHfkuAlgTbqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150071
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67624-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:viken.dadhaniya@oss.qualcomm.com,m:andi.shyti@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:linux-i2c@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:naresh.maramaina@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 71DC875B71E

On 7/15/26 6:06 AM, Mukesh Savaliya wrote:
> Hi Aniket, Thanks for addressing previous comments.
> 
> On 7/10/2026 9:40 PM, Aniket Randive wrote:
>> The driver uses a static XFER_TIMEOUT of HZ (1 second) for all transfers
>> regardless of message length or bus frequency, causing unnecessary
>> delays on error paths.
>>
>> Compute the timeout dynamically from message length and bus frequency
>> with a 10x safety margin over the theoretical wire time. Add a 300ms
>> floor to budget for I2C clock stretching, where a slave may hold SCL
>> low indefinitely during internal processing. This detects real hangs
> not only internal processing but it may go bad holding SCL low indefinitely.
>> 3x faster than the old 1s static timeout.
> Meaning, in such case/scenario, don't need to wait till fixes timeout.
> I guess, 3x faster is relative to the 1 sec, but for larger data and slower frequency it may not be 3x. Hence, correct it accordingly.
>>
>> For GPI multi-descriptor transfers, use the maximum message length across
>> all queued messages as the per-completion timeout.
>>
>> Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
>> ---

[...]

>> +/* 300ms floor: budget for clock stretching; slave may hold SCL low indefinitely */
> Already explained in commit log, can remove second part.

This is very much non-obvious, please keep it 

Konrad

