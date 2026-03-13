Return-Path: <linux-media+bounces-55636-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOR9Bw3fs2ktcQAAu9opvQ
	(envelope-from <linux-media+bounces-55636-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 10:55:25 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2BE280EFD
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 10:55:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AE2273065F37
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 09:54:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAE8638A713;
	Fri, 13 Mar 2026 09:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DhbjcMKN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="isfkRUtt"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0539E389472
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 09:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773395656; cv=none; b=WCNIpPdvamWEeKEreNtxDSV2Q/4D0s369CrQ5900PN8EnFy/Yyd1HgTYRB735GKPRGAu8JNp/qlfldLyKor2T+CObxQGkio8XT+xyjdnmupAIrtHmu/2yp5BKMfDv0kua6cdiji+QgVYcMTy4cAnu+0hY+m/coNuFFu+NjD0e+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773395656; c=relaxed/simple;
	bh=jF+RGW1oq+A2HAK5SMqoEpl7vhxLMd3h55OdaY/EqoM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cHZGnVvYHiWBqwYwp+jJ+7Z8Ghjiih8Al7IJbpoz4BRxLP+CxfNJ1QHv0FefJsmj/2KhiVXRVd4I5VC7+RccacaNOWSKFaXDHd09WjEnV92Zpmy9S5MYUBs83McYQZq7kOMHiAq+J0XTlEBkbPI7ZcikA4MYecIFeL9b0q1MgO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DhbjcMKN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=isfkRUtt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5tdEU1574564
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 09:54:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UMs7baKzQP96vz7tn8LFJ/luoeqtWF5RUkw5fVAin8U=; b=DhbjcMKNsVvJF9GM
	vz8KZkmTiptrfvp/Yr0Z+E29KWdeEdwTmrpGuq/egQhqW95QgTM12N47JGeJxxg0
	JGEBA2l9tRow0UCgsmxEwuhPLDpF/j0OTbglLEXXvc50M8tbpDiq80iSbcYLqwq/
	7J5KWZxNP43gpSd75yz97uPUheTY3VTsLUpSYkdClFapx9AzFePNDxqS6ywQBYvK
	klH5B1rTbiEc/erg1OsbweQ5lAwWpCE0f8gkia/tBKb5siwXn8YZRjIrPYY2cNSQ
	+O0EqrTFiEbXrSI4hjy9PKg+3G7cErqisjm94i64s/YtMmFWKNlppAULwLYXMktL
	cHqQVA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh53nhrp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 09:54:12 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50937c5b742so122258581cf.2
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 02:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773395651; x=1774000451; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UMs7baKzQP96vz7tn8LFJ/luoeqtWF5RUkw5fVAin8U=;
        b=isfkRUttxuyvpm6LHjq36eIMdbGLTzeiHovzqcgE1RjlCrTGg1o+BqxTHvGCEnwOkL
         fwelSsn2OnrjP/YalfhuePsLqQMr0glnKS7Puu7ShF77jmN1odfJvFxg+aW8nXOFfogY
         /nb/GvoyDrXdrEz486VaQbyzyiRxGWfogSWwJfvdu/iC9/FJijQMm6uCyYhqUy44ZUJ0
         HXjcoubXNy+MTjmAfADYUYZZzKlXG44DXV9m3XJREsBXPBixXl9DMZA0/3KYX2nnPw3W
         tEcQYVyIJxCjxbtFU8Dtuishq6X2hYdgUVooWW13ue0Mc5Afa2227GHFAt18q2waeC1/
         EKcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773395651; x=1774000451;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UMs7baKzQP96vz7tn8LFJ/luoeqtWF5RUkw5fVAin8U=;
        b=YlFIn41TQRLqyPIrME4cRFEE3kHIG6d3G69IdjDjZTvkB9/PUXeb6Gs1s40Y/2VRXn
         syBzpTT6314ila6WN6YLNRWt49+D5X8IYsoEbXwVc1SXn2vU3JAQTUDRQDrRMY5+bUjp
         hStJmtqEFIsUI2piVfRiR/zfFmR10wtBhq9ZbgXElcStKm+U/XTghHUV35Pl+EMXx0O3
         r577Pvbn1fBzcqEuUdLoH8PqYD4u1sfrgEAgjbnL1ZPBSU22Zj7Ow35LjmbhiQqeb0EG
         ZY66bydOUX1tsSj4+ShVtSC4n1kMoCNYUs1EXc66BGvqpMK2lykbLdSAXhfLvPoC+lGi
         nkDA==
X-Gm-Message-State: AOJu0YwA2780OSH8RWT/7XWbjRZ83G+VVFHmzw+tMUXyTeUU+9/XvcF6
	/ySNjB6T09Hq2eogdCTPvgcOgHzLrGCNmdzN+kA9oX6tcUQn0EmTG3nRJnzi3SejWDKSXb5KwOT
	RyzI7T9mkprlVsgzPxIdeB+wW3w5wzg9G2sF8rxIAxuOWgVMq7Do/4EcQ2HyDIjjWYw==
X-Gm-Gg: ATEYQzxUaeXx6NBxcjiir2cgL0vwHVTXol1E7rnYgg0pj6QFtIcs0NQiRkgE82fIsep
	Qs+9UjzwvtZyy3L7Gc0g5tHakEXGDns1I7u5M4dfYl0acjjX0cqxTiePK7cEGPe5ccw/cGv4Lno
	M34Y7GY8F9aGRpXNzj40pRmIwLkHX1gvx0VNAkIK1bfZ2v6ZBvzkaUFjLK/1JJFvAdG2wngBEZO
	T4rb25CPLWhKKYmPNPTfjnu1s9OuMcxaB6DmT8Sc+NpjlK1z1MCmMczh62BOWZtgbi1XZDkCsn3
	TUjPE2DQP6ILB4yQW4Ng6L5IoiYCj3Tfl28DHP9IDkTYYF6FVLdyB+97oLCDuF3X3U/Zx05CinV
	ZvhqhbOnuSE4uGrfKwyfSHHJbBcTo7Z5BiY89K2220zUtyB5saVAgLjMDeyDCwcdTEF9RPSM//N
	hySYxY+Qc=
X-Received: by 2002:ac8:5ad6:0:b0:509:2448:41a with SMTP id d75a77b69052e-50957e6d955mr32552171cf.42.1773395651213;
        Fri, 13 Mar 2026 02:54:11 -0700 (PDT)
X-Received: by 2002:ac8:5ad6:0:b0:509:2448:41a with SMTP id d75a77b69052e-50957e6d955mr32552001cf.42.1773395650735;
        Fri, 13 Mar 2026 02:54:10 -0700 (PDT)
Received: from [10.111.173.3] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5093a0ea844sm63722031cf.17.2026.03.13.02.54.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 02:54:10 -0700 (PDT)
Message-ID: <9f5839d8-ccc7-4e7a-856b-46b947993df1@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 17:53:42 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: qcom: camss: Fix csid clock configuration and
 IRQ offset for 8775p
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vikram Sharma <quic_vikramsa@quicinc.com>,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Wenmeng Liu <quic_wenmliu@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260313-vfelite_fix-v1-0-2ee7de00dee7@oss.qualcomm.com>
 <20260313-vfelite_fix-v1-1-2ee7de00dee7@oss.qualcomm.com>
 <3499e8ad-ee87-410b-9db1-215d6c20e195@linaro.org>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <3499e8ad-ee87-410b-9db1-215d6c20e195@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZN/aWH7b c=1 sm=1 tr=0 ts=69b3dec4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=fbPyYwy2ZK-1YPEEdNgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA3NSBTYWx0ZWRfX3ntZtexySFHx
 S6Yn92oUPz14KLHM4YUMkjeDMYPwc+tOu28OCiSsmlTrn39+l989RTLs08noIpocEM+xZ7q9PAT
 VvsecR/1R5Rz+A4y7p/4y6qjqrs9M8kg1FBOi+M0xlWJzn/BYbDlBXuLt1GI37J+ce0pDo2uLvf
 ECT+EKuAtq2CRm7fqKKlTdrs/t8HbRubxRPzEOsgG5oUA6kXD+neMGQ887uUJyotakUto9oBYGh
 nCnvjJjjOMkaCf7oHTISFATOTRyExouZzukAOAKI/uzMQOOvZnNJmQrtQRK3FYMMsISIstv1f6m
 /9gF6k4SrMnwaZBR7jL3C/bj+Y3+buEIK7g2MzXNnz/DfNDaUJtJbUaOwOD2SQvxjZr9WO680sF
 f2hNZJLu1V18+LssXDgjFSoLekU1koZ9H+iDp1sX50M5SNQ9EtI3HRBWfD+EC238I56D3v2+qX8
 +aQbZkcheB0O7dDanOg==
X-Proofpoint-GUID: oKCAFJgk4Hq0L5OGvtoOlT7Sw1V37yvw
X-Proofpoint-ORIG-GUID: oKCAFJgk4Hq0L5OGvtoOlT7Sw1V37yvw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130075
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55636-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,gmail.com,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8F2BE280EFD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bryan,

On 3/13/2026 5:46 PM, Bryan O'Donoghue wrote:
> On 13/03/2026 09:42, Wenmeng Liu wrote:
>> Fix two issues in csid driver for 8775p platform:
>>
>> 1. Simplify clock configuration for csid lite by removing unused clocks
>>     and correcting clock rates. Only vfe_lite_csid and vfe_lite_cphy_rx
>>     clocks are actually needed.
> 
> This should be its own patch and should that patch have a Fixes: ?
> 
> Simplification != fixing a bug.

Sure, There is also an issue with the clock here, I will also modify the 
description.

> 
>> 2. Fix BUF_DONE_IRQ_STATUS_RDI_OFFSET calculation for csid lite on
>>     sa8775p platform. The offset should be 0 for csid lite on sa8775p,
>>
>> Fixes: ed03e99de0fa ("media: qcom: camss: Add support for CSID 690")
>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> 
> Yeah this should be standalone then.
> 
> My general rule here is if your patch requires line items to explain 
> various things being done, then those line-items deserve their own patch.
ACK.
> 
> ---
> bod

Thanks,
Wenmeng


