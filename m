Return-Path: <linux-media+bounces-61461-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFh4Kq6YBGpiLwIAu9opvQ
	(envelope-from <linux-media+bounces-61461-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 17:28:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4244D5361DD
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 17:28:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 44FF432FAA9B
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 14:30:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBF6B43D50D;
	Wed, 13 May 2026 14:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZV2cLJMZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eoBz9nuR"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3EA43635E
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 14:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778682653; cv=none; b=oa3AuG/7HbvaGODLZImSO2zKkAVdDjHQDxYLmvE5r1LC9Shs9KRKt0Thvjev0VPrHBkFIs7hNASojP6TNx2NVHS6qKqeebfCxks7sP3mPu19moifSYicjV/s1e/0MGXjPWzFS2pk8eeEk4aTrwwc8OQwH7Qg5Q2h41bnF/qWeqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778682653; c=relaxed/simple;
	bh=9vwn9p/G3SBynF/R6x9abjmpGFFEqEuhbl5fGpI/Xo4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Os/5SB4HvVjmhlHADHOQcgVfMy8tkqsU7GLHFHjQi7kNJV36tlUjnQgCMyK0JOfTEzVg7R3UamEneCQ0Ga3hDzhLkfkQ1tDHkEVIi/DuClnSyLjppgxk1JdJkRENj5Kpmj9FoRh/GbWUuyvQe18XmmHtYifZZmSnbRNObkb7tBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZV2cLJMZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eoBz9nuR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DBn8633326359
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 14:30:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kRdRHlj/4FYDgqpaQppw+iq5ofthvt61GQTIwvPfv54=; b=ZV2cLJMZDRi4atUp
	7gvRykW+ST4ITAgk7scyikVL3gdndFwbo8rKTvUhKXHkmRh/l9CrpfFMY8yQXqfG
	fT9sv3BgWY/Wsuqf8WPUwAkc/+JoL1+oobkfZhbjbqrzfufmDCbHaF2fSMCVmocp
	rmcAijS8MpXPFEyF2JSxlejK06CsckT/SHVM++3DHpn0MHHMBpcl7Slt/x74oKsa
	dRsXBYABpnZuaBFVG4o5QVV47Kd1LSVnr7DLXBmIWFlT8seqt/qaU2Wpm5nQC6M9
	Ge4mMXfPQ5jIZjrneJpkuiyZr+GPzqaZqdGvHV0iuchr69jgVvf+sq5L6y8SRclh
	tYEGog==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4kvd9w5a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 14:30:50 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-83536dc3be5so7389252b3a.1
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 07:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778682650; x=1779287450; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kRdRHlj/4FYDgqpaQppw+iq5ofthvt61GQTIwvPfv54=;
        b=eoBz9nuRq4YRspFMGC3/VyVm5e95DLTh8Q+i3IE6zLJfZ19DAl+pbZm5Medftp3S71
         WZWvN6IfuH8x8hrYuDGseh79gV8Q7oifAqhujFxLC0fXwjivOMLESnFTsMiaC8xuaiNO
         HoMa3ZEeNU9Q3ikYQKZut6mOYyNLw85E5c7k8wVT3oAn2G9KR+oIVeVJ+6fWrFKr5fL8
         rukp+lOUJwSTR+9uYpe3O5fMyg1sggXZHqYpbFxYIRarjsOYb6mMwzQCoqDqpkt037n+
         lHXpTAMgUGjrJAY0MtqxTqctrhy5egnTocoEalSPbU82is7S0P+fVwAfVwh/IG2nUMKB
         gmOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778682650; x=1779287450;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kRdRHlj/4FYDgqpaQppw+iq5ofthvt61GQTIwvPfv54=;
        b=bzDtIJcfpQar8v0RgQMqeEgC6dAAc6RHnG7pkKUKruZ3jy1xKzc0T5rux7YoEc94MO
         +i3c4yc7F0il4JA2i1ORlZoubUNnFTglMdV/q3KxNkQLXNLdd/qQM6WhTmHTjryE5Q2g
         79aLygryrC6OPIwA5Zy3SflP8QE+epTMKw3wNHt0HiutZYYSS4x7Sf/oDS2B68BKn9JX
         ttRGyzsJM+yzoH8zn79tAXNyP2Dv2iy40onuDa/CcafK4m9XCDzPaEaaC0kEWHVv05v0
         WW/s7KgKtHe8JrCpYy0hrD/gyBRnGVlgYo07NPOTHhHaCdiq+fqoCuSsaoVHAwes662p
         UxXw==
X-Forwarded-Encrypted: i=1; AFNElJ+RlWTuotV/Pa1eEeGZGMA+QgKMLxBKIhjyYNac5HGAQCRPMO+YqaC+Li2ZFTY5iMxasz/sqN6tu+p4AA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYqY4sn25j4/JYX66bPufbr4NZp/5mioKud8elwnvmf++RxNQj
	szM1cLDqg6OmziZoLiWFJb6YNnptEPizYitCPk+uCCzdzEyq1C9a55Sz6YLBN2U9r70N7UouZSY
	fK/P3CyeLIiclIc9vdztg3X+M8frsQXhhnEDmaCQbC1eZCA3a6/KljGvQwJSpDPGk/A==
X-Gm-Gg: Acq92OEC51S8bTZy79rIDiHWYnCIHPepuWQFcj8+UqsdWae+uNEiIUozvwR/4gWR1za
	NDo53mTUPXIMsV0Xrp0VALOFoa9jbDoj2nnC9o8UNjI56AXh1RpO2idEpClgHcugfQjE3PFIxdp
	1HxDIsBcD73t1vpabSUSoZZiD0vSns3BkUALD/0BRZJ5vG4FsSddLj2E77Q6XkXKshmVaHugNxT
	nZTqLgCQ2lH15HZp+rzQ0STlPQ72Tvh27q4tVkxa3MJSN+LDwcyqH+qZqAsCFDkKS/vcKd2n2Sm
	vERcc1a8CTX00PXRl0XT50AXEY/3yEfBHbf/rus0vrdzdekDfReVvXLcACkJTe6sTAAts12UBel
	pQmdDXUcKu3aslYjmgIM8S9iWDQvm4MEw6vZZ/pQCySsPbmMML5+0bcs=
X-Received: by 2002:a05:6a00:22c6:b0:82c:dfea:9e2a with SMTP id d2e1a72fcca58-83f0542d985mr3656115b3a.2.1778682649571;
        Wed, 13 May 2026 07:30:49 -0700 (PDT)
X-Received: by 2002:a05:6a00:22c6:b0:82c:dfea:9e2a with SMTP id d2e1a72fcca58-83f0542d985mr3656058b3a.2.1778682649050;
        Wed, 13 May 2026 07:30:49 -0700 (PDT)
Received: from [10.204.101.125] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83967dbcf16sm31628277b3a.40.2026.05.13.07.30.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 07:30:48 -0700 (PDT)
Message-ID: <ad875fcf-531a-49af-b58e-575185c12d77@oss.qualcomm.com>
Date: Wed, 13 May 2026 20:00:39 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/14] media: iris: Add platform data for glymur
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-12-7fbb340c5dbd@oss.qualcomm.com>
 <jfypqc5ise7uezog3lwmmrzddbsctir6ze24ma4vp4zgcuwjbf@4443jqib6nxw>
 <b6dc6b32-26ad-6f2e-dfd4-551e7fd0481e@oss.qualcomm.com>
 <wequp7ogk2az3d7yzfxn7wwlr6k5ng2jwrg6anaidseteuwlev@v47yoo4j2gbz>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <wequp7ogk2az3d7yzfxn7wwlr6k5ng2jwrg6anaidseteuwlev@v47yoo4j2gbz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: nNoPJ-s8VD5IZOmSLXTAN6GlyQRU4Gq5
X-Proofpoint-ORIG-GUID: nNoPJ-s8VD5IZOmSLXTAN6GlyQRU4Gq5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0OSBTYWx0ZWRfX6q+5hxO+jFuJ
 60l8eoc5smlFIRbNe/yPP6usDh/YvYFgC1FUMa9UUEolxI0RzY0ZrThbEBc5yu/jdsVf7FCkfrp
 tZElGQCWBTWbbSRR13R5Id0RXfShEva5PV6peS6bA1xOJ+edw254J5QYYzKdqFs/eSv9LmxF6QX
 zh41cK97PljjPAUvHW5sR7l40E+xLCxlsZ9Lt67blAULmOrz6fDa75oXEHfJLNFyjzuwozzqOx/
 Mm+cggVFBvu2xC0YsPWVAjeaRARPMBe96fssx6fY9f+jpRYJDSXK/vDhT8+yH21PwZLEddfLNl2
 goeLtsXa/9RIXcmwGh7o06h3hbcKlzmwtQujbDr1E8QNaOBR5zpMWg8ON7yXNZrOOdQZkKJIZiB
 K49cLi6FoRyKn6SIfQwBlMBhf/zK6MJkzxazopFHkArBC+bY9OZBb7BwmptgNEHTqa/fyN/RuWg
 Gi/yO1JQDysxZIqg5Dg==
X-Authority-Analysis: v=2.4 cv=Iu0utr/g c=1 sm=1 tr=0 ts=6a048b1a cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=AkRF1kMk2nwCDGt8pKAA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130149
X-Rspamd-Queue-Id: 4244D5361DD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61461-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,foo:email,0.0.0.1:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 5/13/2026 7:47 PM, Dmitry Baryshkov wrote:
> On Mon, May 11, 2026 at 09:45:01PM +0530, Vishnu Reddy wrote:
>>
>> On 5/9/2026 2:35 AM, Dmitry Baryshkov wrote:
>>> On Sat, May 09, 2026 at 12:30:01AM +0530, Vishnu Reddy wrote:
>>>> On glymur platform, the iris core shares most properties with the
>>>> iris core on the SM8550 platform. The major difference is that glymur
>>>> integrates two codec cores (vcodec0 and vcodec1), while SM8550 has only
>>>> one. Add glymur specific platform data, reusing SM8550 definitions
>>>> wherever applicable.
>>> This leave me in confusion. Having two cores, each with its own set of
>>> clocks and pm domains, I'd have expected that each core scales
>>> independently. I.e. if the load is pushed to the core0, it requires
>>> core0 clocks to go higher (while core1 clocks can stay at the low freq).
>>> Or, at least, the clocks would be set to the frequency corresponding to
>>> the max of the workloads (if for some reason the cores should stay in
>>> sync).
>>>
>>> However, I don't see it in the code. All clocks and all power domains
>>> seem do be scaled using the common workload. If my assumptions were not
>>> correct, please explain it in the commit message.
>>
>> The OPP core logic sets the rpmhpd level and clock rate based on the OPP table
>> defined in the DT node, where the clock frequency and power rail level are
>> tightly coupled together. Since vcodec0 and vcodec1 share the same power rails,
>> independently scaling one clock high while keeping the other low is not
>> straightforward within this OPP framework.
>>
>> Do you have any suggestion on how best to handle per core independent clock
>> scaling within these constraints?
> 
> This would require more plumbing and driver changes, but:
> 
> 	iris: video-codec@foo {
> 		compatible = "qcom,glymur-iris",
> 		clocks = <only-core-clocks>;
> 		resets = <only-core-resets>;
> 
> 		/* or core@0 */
> 		codec@0 {
> 			clocks, resets, power-domains;
> 			operating-points-v2 = <&iris_opp_table>
> 		};
> 
> 		/* or core@1 */
> 		codec@1 {
> 			clocks, resets, power-domains;
> 			operating-points-v2 = <&iris_opp_table>
> 		};
> 
> 		iris_opp_table: opp-table {
> 			compatible = "operating-points-v2"
> 		};
> 	};
> 

clock source "video_cc_mvs0_clk_src" is common for both the cores. It 
would not matter if core0 is scaled for a specific workload and core1 is 
scaled for different (let say lower), as the common PLL would always 
generate the higher of them.

Infact, going with the approach of exclusive scaling would be an issue 
here. The later core scaling command would bring down/up the corner for 
other core, and could lead to under/over-voting.
>>
>>>> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>>> ---
>>>>   drivers/media/platform/qcom/iris/Makefile          |  1 +
>>>>   .../platform/qcom/iris/iris_platform_common.h      |  5 ++
>>>>   .../media/platform/qcom/iris/iris_platform_gen2.c  | 99 ++++++++++++++++++++++
>>>>   .../platform/qcom/iris/iris_platform_glymur.c      | 97 +++++++++++++++++++++
>>>>   .../platform/qcom/iris/iris_platform_glymur.h      | 17 ++++
>>>>   drivers/media/platform/qcom/iris/iris_probe.c      |  4 +
>>>>   6 files changed, 223 insertions(+)
>>>>
> 


