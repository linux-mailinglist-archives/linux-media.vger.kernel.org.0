Return-Path: <linux-media+bounces-66850-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 39C6AJIATWo6tQEAu9opvQ
	(envelope-from <linux-media+bounces-66850-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 15:35:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DB971BF89
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 15:35:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=KhGUOvxM;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gVlzvfge;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66850-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66850-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2A235308F11D
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2026 13:24:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DEA641A78A;
	Tue,  7 Jul 2026 13:24:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1AF4189C0
	for <linux-media@vger.kernel.org>; Tue,  7 Jul 2026 13:24:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783430666; cv=none; b=C/vTyItAq1H/BlQKmyQDzf2SH/4s1BIiuMEv5Rf8jLgz5C6oHeVp3Z2d+1UvpH7jIdp46AGSMtYTFu4rLGSgTC/XI+NKjUiO9OrAq4NIAzT4w1BXlzKA9UdaXxoSA+9yOlCvgjpcTcM9jpOfNx2uRnuNiqO0EIISS3T45yvLslw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783430666; c=relaxed/simple;
	bh=ja7GS54UR5AwuTz/Eekhp/5WWgMhkE+m92m9IozVLR4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Oj5b8qLQ8t56eLSDLkTmwQL/OdU8SYDmp0sTCR/Ycfme4BWFSqmCM2IjHKkHRnXkHNc8FIaayXW/pG9SoFNLMNkjSZw/wjPy1s5TU84WDybvPN6xCsKSuGqwT4/94N/RweCQE+Yu7mbAlPxTMiHSOmD8wISW6GkQifjRxgMTKLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KhGUOvxM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gVlzvfge; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C8epN3616557
	for <linux-media@vger.kernel.org>; Tue, 7 Jul 2026 13:24:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PXzVPINo7UFBYynJVJKXjhFd6iei6NVvj44x8Vp1tjM=; b=KhGUOvxMrdzKWiD3
	ygV71kejrqfc6Y8MhpnI9PP4xZLkTuNFtG8EH8mkXAHPUXt/GuUd4ddgsarGRN+z
	201nTmuX4x3rmEQx/C3xRapGigQP/eFGAOnHIYOpJ8aTE6q9Y3b0BAgzj4Oag2Ml
	GG5YjjTVaF5Wm/8ILU8aKNkpvrM66U7X8aNqqr1etrhphr9JuEHVAbXNS8F/QXfe
	ntnBCp9czBaqLkk/I10XV4tr/9xvNMZ7YaN8MZ4RyMY3RFgJR8OzCvbN1rjrd+4T
	UB2eewueVSBmbDmEKhAuy4Ca0BuGRgWfLImugLMqWKX9NA3I72dTAXSqt4wl8jeD
	kogcdQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8vun1ev0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 13:24:24 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c2af04aeeso8543651cf.0
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 06:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783430664; x=1784035464; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PXzVPINo7UFBYynJVJKXjhFd6iei6NVvj44x8Vp1tjM=;
        b=gVlzvfgeYGpjvv+NYU5/Ur7NE2O23Mn03HLEpvj54LjNxSH823BUPhwR5FnsxR16Pj
         iykZkzf+sIhTkBrWNjBBJvVvhaPxBpV9dfBmYtgqCJw5k11tbyClmk7VNAaiOsDt/OU/
         mChCN8cfv83//YRCtg95kj/SmITomhDUxvW5JR1PY4MiFkurNT1Bs5jwYgGlqnbi7muW
         uAB9ePn+nONfKFo1uelR6O/sj3kcqAFU6cKdM2A6gnZzT4gFv5EAQ52ccVWgX8O3kBTg
         NmI+m9+hSiQZEhTL0bI3ag+DNUThaDJxBWBGCN/r/KA3bqFu34HBbfEMNO6w3aNnIz0+
         8p4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783430664; x=1784035464;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PXzVPINo7UFBYynJVJKXjhFd6iei6NVvj44x8Vp1tjM=;
        b=E9kBukXvwUpQH6epi1drluv/exgGxdNOQijwst8ahPMLYlWrU1/biQ+xFEimsXcs8E
         9/8rOOUx8rAdxsDQY0M/exzOLnQz2wDkId27//YzcpIHdDeCEyLCrxAtPZmaW7Up1TMv
         iOVnmpP7q3pc9M+GhtMb9zIrR3bYzaq3TbaWtgUeh1/dFEbEN6xBP0FiEHbIVmoWBFE3
         dGvwAfxLliZM9YMmvm3VtRtM5IjNmyB+TAAuoZ9bxHnBi4dbVfLObNJ4DajzU6toflG7
         8ss5/yfEDARahAjjhVqvnTC9w0l/whZ0e2mbcnQ00uQ6JnS7/avrieeyWYKwUKANbYU5
         t3rA==
X-Forwarded-Encrypted: i=1; AHgh+Rrjqp3RQCz0R0UG+iUyGx1pNUh3Jdivnn11V/YCrUM21QfSzR7i1a320FiebG5nAlow4UqqsHT5LgMoRg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy3EJvNR0Ao8Xx7IgaKebGsVliie+kQY+RNX0ZlkqH80Je/Y4A
	EqOJS4KmCnReR68crJCckmcpeUugd/0av/g38qWNb8fP89CkusoNvvBsxeBDGOhJ2gRHYHyY6/4
	8AKKdcjzTlBaSmpoCbkxfXnaMb7EW/p65dEEBcLsSq8bcxKZHD5hnzN7pzcMKxbf22Q==
X-Gm-Gg: AfdE7clQtDMV2sQJSkfM6IWKYE8StDeG1zzC7G3ltysZsNaQKnraYY96w+Eqe0zQ43A
	vCIKRbrxjJlflMoJo7+oje8Nxma7YGk8kWjET5C+hvHb2QTJd43+RmzzuNi1lzIWSluG48CXUCC
	+v0YbfA8RtUjxX6meZhuO88q5XBKvxG+PBioCxFTENdA1NzhgrJ4oYjXxce583ksh8gXpfuS4xC
	BMsV84ylBjcVr3irJqy5tafGYqi5O/tn87cSqzfUxBSnA0L5Yj8iCtMm98i9eJbTFAHAANJUboI
	s5O2aeYSEklcNh0XfbKWVmZ4u7in+8K6bYQiTztlxI5zMvyM5rXDyqFh4hnR5M9gtQH5mc/r5dI
	W/zUHZKPb7suqBl2DN49DQP50UqUVkJTfNvcDvrdVhJX+WsIx+QAQ/re0nKTBM6nyWNvzybknx9
	9b8XRJH1Y=
X-Received: by 2002:a05:622a:650:b0:51a:68df:a644 with SMTP id d75a77b69052e-51c7a46e933mr26366321cf.3.1783430663207;
        Tue, 07 Jul 2026 06:24:23 -0700 (PDT)
X-Received: by 2002:a05:622a:650:b0:51a:68df:a644 with SMTP id d75a77b69052e-51c7a46e933mr26365811cf.3.1783430662673;
        Tue, 07 Jul 2026 06:24:22 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19daa799sm5687429a12.23.2026.07.07.06.24.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 06:24:21 -0700 (PDT)
Message-ID: <74a5b549-987c-4dac-a1a0-ff81150cd6ab@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 16:24:19 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        linux-media@vger.kernel.org
Cc: bryan.odonoghue@linaro.org, loic.poulain@oss.qualcomm.com,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-6-atanas.filipov@oss.qualcomm.com>
 <51a0abf2-2a72-4551-894b-2c2de91ba0c2@linaro.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <51a0abf2-2a72-4551-894b-2c2de91ba0c2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEzMSBTYWx0ZWRfXxD3VeDqKqswN
 rGMHHk2jX9rRd1870gvqGId2p9xWtVKviqmPZXlh65M73vuY7mgD5QK5KTgkSBw4r7Dspca8eUs
 jAGZvn3G8Ug2Rh68xmG64/wxXhF/BEw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEzMSBTYWx0ZWRfXyPk2G9l2RNqj
 xlHyQvjIWK7mtWUCWpiU7IhG9I4lPqgTV6kpGHmfKmpH9iBvtnu9P51mNWiJLdsHFO0FNuLersi
 xFu8tj0jcFFN3QGUVflaJNKI6N6zZjusJ4ObceL3fVZGZcjX4MuWNZ7pRBruCVL+uPW+oUCnEpd
 uctJGC1eWUJHazgtqi6aaV+FU2y9/cD5hk/BaAd3+hn27lliSBICEdhS7AMqSETG4kjWpJnKl4C
 B0cGPyTuNX+E2y7FDu65TMraNVdX1QuvXYFIV7Iu9pwN9T1kdOdpYp8y99pONYFPmb+ngvAA6/n
 CEsY9UNHjK/xZuoNpG4rGld7DlNFI0GeD0TWLhWUOxI4pWmCA+YGU0KxLm8/ARK3+S82QG2O1Gi
 UTkvZuYXMcX72A0DxA3FzaP7fagIivIR0Lr7hyRbAmBg+Bsnvq4nNd2b2r1oQQVVjCJ/Fzbc3uh
 DmaG0KQ/0y7wm8KlHDg==
X-Proofpoint-GUID: 1rjBz1UNHDENltnwX_eLzBrCxjRwt1o1
X-Authority-Analysis: v=2.4 cv=N+IZ0W9B c=1 sm=1 tr=0 ts=6a4cfe08 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=RukG3nK3fvgRKkzuuZ8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 1rjBz1UNHDENltnwX_eLzBrCxjRwt1o1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070131
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66850-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vladimir.zapolskiy@linaro.org,m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[gjorgji.rosikopulos@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gjorgji.rosikopulos@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A2DB971BF89

Hi Vlad,

On 7/6/2026 10:46 AM, Vladimir Zapolskiy wrote:
<snip>
>>
>> +            interconnects = <&gem_noc MASTER_AMPSS_M0 
>> QCOM_ICC_TAG_ACTIVE_ONLY
>> +                             &config_noc SLAVE_CAMERA_CFG 
>> QCOM_ICC_TAG_ACTIVE_ONLY>,
>> +                            <&mmss_noc MASTER_CAMNOC_HF 
>> QCOM_ICC_TAG_ALWAYS
>> +                             &mc_virt SLAVE_EBI_CH0 
>> QCOM_ICC_TAG_ALWAYS>,
>> +                            <&mmss_noc MASTER_CAMNOC_SF 
>> QCOM_ICC_TAG_ALWAYS
>> +                             &mc_virt SLAVE_EBI_CH0 
>> QCOM_ICC_TAG_ALWAYS>;
>> +            interconnect-names = "cpu-cfg",
>> +                                 "hf-mnoc",
>> +                                 "sf-mnoc";
>
> This is the topic, which may raise a disagreement, but I'll repeat my
> position about the need to remove all "CAMSS bus" specific resources from
> the device node, they are found and should be allocated on parent's side.

The interconnect has functionality to handle bw requests from different 
clients.

Yes the best will be to have camss interconnect, so jpeg and other hw's 
to vote

on that (actually it is possible in icc framework) but what is the 
benefit of moving

those to camss? Is it not better to create camss icc. I understand

you want them to be on parent side. But how to vote on bw? Most of the 
time it

depends on the jpeg encoder configuration based on resolution format 
etc. to set properly average bw.

So i dont see how that can be done with not explicit dependency on jpeg 
with camss and some exported

API's which we discussed with Bryan they are preferable.

Maybe i do not understand properly the proposal but can you just add 
some pseudo code

how you see the things?

Regards,

~Gjorgji


