Return-Path: <linux-media+bounces-39854-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15251B25706
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 00:55:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C3E8C8863E6
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 22:55:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1E542D738D;
	Wed, 13 Aug 2025 22:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mlm+B7aE"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE8F2FB993
	for <linux-media@vger.kernel.org>; Wed, 13 Aug 2025 22:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755125719; cv=none; b=djR29VhYS6QRKWiu2dmeNw1N4BN/7SZorZKcBuj+Pqh94erBAghl96qdVZ0P2WnLn35BJ3KkxuR9aDIboJKLXG845qb5zYGJsXVtsQpEztPq9yJCrrmi2xAMIwc4Z0xS1AocM0nKDUZe2dFIP7HN8SE0LlI+eS0RNyuc3xEYwWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755125719; c=relaxed/simple;
	bh=IRDBklKokVrxIJWgP3cNp+cQqYoCCFC1419AdZuqIVE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DjTAxZQ+Koj7PbvTMrGVSSQaYLc454s40XkgCZQbaHIf4iZGxKuCQDefDP3ssFA9CF+Vni+qJfre/Wspt0JMT5aDXH9wuy23HA0N3WP4S27BOm7UGvTH7nbhJTUkcN/YjWuc7jtcjT5HrDTVN/nPGad7jDnfR3nOOdcxBsGroVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mlm+B7aE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DKixWS002790
	for <linux-media@vger.kernel.org>; Wed, 13 Aug 2025 22:55:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	15n6L+jgRmpWfdGPkRrYhdr4AzVdCA1CkGjZd9TinAk=; b=Mlm+B7aEgb/H2H/S
	oDv3YBRw/IDZV4u3YHPb4tiivbTejs8GPnkna/krIBRVh/pIFY4rUu4grVJHgqxI
	tyCk0xEe68+QpSiwZR/H93am6LkwTqizlc+IEMSmKTiw9CGfi4+oPMpZNlYMTDcC
	pd+mGYXTRSEumRe9sesQrsP+thI5f9LQcAEfnWR9zB+3AfrBZEkCZ+pOFWCblIXy
	KxHuGb2xwXHhuyFQmi/B8WSAq6nFS3P7E0aX6RdXF2OKpv9pIt8PMhFouaO200NX
	oAuun39iIAzL4kWzThwUwVS9FFDlPiqdQ5Z7LtRvinBXV4kvryspzZ432NYi0cJe
	6Ud24g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxdv5fn7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 13 Aug 2025 22:55:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e87031ae5cso8755085a.0
        for <linux-media@vger.kernel.org>; Wed, 13 Aug 2025 15:55:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755125707; x=1755730507;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=15n6L+jgRmpWfdGPkRrYhdr4AzVdCA1CkGjZd9TinAk=;
        b=IxP6En66gQ8GRJ4tXesVSSLNSb6sYlmqGtVi8Q99sazdmR6+pJLFoxnqptcWBAHaGD
         SOgrJwvUqoMYm0Wl7K/cI82LSGaE6Y64zvYsYwhp/xTZXvmFI+suhdU8CgxgArxIDR80
         gzEMdgs/89zs6vRrZS5C8/h3SXYHsVj+e2J3000TjO017uDWoqA9mi6Vw2PqVxCiEkUM
         R04t014EzWYy/ldubeJh1ZoFtZ4E1bjMe5ljgFs8LgQy309FBIr0BNknr+9dbxrweKCz
         jZ9TEdp989rAM7z11eMdD5h/6Y8yYP+LVq3wv2xyxycLFITuivGuk4VGbOF3M8/Z9b5Z
         0IuQ==
X-Gm-Message-State: AOJu0YzxMvWFwMU2/cpyocvS+NH/Hsg30HlAcBC/5si6BAYtpinj8jDK
	xUFs1/d8xY9MnjRA1+R6UAauNiURRhc58uo/vlt8457SNcbnZYgG8Dg1Zx0g3Vv5oFuRbHmZCxe
	U3T0HUhH/CbqOw2Sy83S0LaDsGaC0D6nZx4Kuv3sRBaWlYvGWYcxIXjeI4z5kGpAc+Q==
X-Gm-Gg: ASbGncvhDSSNyp3wXbUvk6L0rSdw2GoKE9gTFiuqeAhvegQ4E/roZRJ8u2TLfwyvPfZ
	5N+Wk1YYLvs9BTAYNcji/CnGzd488sv3kWmjnenwu+IC4CSruD+13nPH0Cx/Cg2oZRio9NTUIrZ
	7Tdu4Ru8jKE9/enfa5hepe0YxGKUMZtas/45GGVzWcwpkiYn8yPST4WN0RTK5EpJ3fkXEwrkqDC
	blsEQwZpSTPus6lnY91ydwm/Dm1Y8YZ7dwi1o+gYtbH3HpsDgLvuzpbS2RKfsEZ6MRXKoER7MTq
	CUouZ5Npu2NKcgOryvE/uq1WbfetUf7AvFFW3Jo3ncmhFXz7zm7QVWXmm7b+W3vhzRwENa0asaG
	g4DArlRRsHS5WKM9zMQ==
X-Received: by 2002:a05:620a:7114:b0:7e8:deb:2b88 with SMTP id af79cd13be357-7e8652610cdmr341649085a.5.1755125707355;
        Wed, 13 Aug 2025 15:55:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHL+JE0kMKFEu4kSodVCBMSDyNOEdDfPuoTQBCZSYXiPZDVvx1jvbqJkcBjR+WKF+Ba2gnIkA==
X-Received: by 2002:a05:620a:7114:b0:7e8:deb:2b88 with SMTP id af79cd13be357-7e8652610cdmr341646185a.5.1755125706781;
        Wed, 13 Aug 2025 15:55:06 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0a3cecsm2470000066b.53.2025.08.13.15.55.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 15:55:06 -0700 (PDT)
Message-ID: <cd2ded3a-ab91-4199-9edf-8acc8d6d11ba@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 00:55:03 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/24] media: iris: Allow substate transition to load
 resources during output streaming
To: Bryan O'Donoghue <bod.linux@nxsw.ie>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil
 <hverkuil@xs4all.nl>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Renjiang Han <quic_renjiang@quicinc.com>,
        Wangao Wang <quic_wangaow@quicinc.com>
References: <20250813-iris-video-encoder-v2-0-c725ff673078@quicinc.com>
 <20250813-iris-video-encoder-v2-5-c725ff673078@quicinc.com>
 <24714b00-cc15-4c9b-b0d4-8c76d702fcc2@nxsw.ie>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <24714b00-cc15-4c9b-b0d4-8c76d702fcc2@nxsw.ie>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IuYecK/g c=1 sm=1 tr=0 ts=689d17cc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=rixuZvB9KV6YaslLPPsA:9
 a=QEXdDO2ut3YA:10 a=1R1Xb7_w0-cA:10 a=OREKyDgYLcYA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 2e5JbewWj9o2Y6EkBQAIIsVlbXIaTBHS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNSBTYWx0ZWRfX3t9vbSOQChq9
 nHMGFU4YMBLdFjtgvPI0G1SECNurlgugUpI+fjCjsLXfz+L9vwkmUcby8CRKGGtqkh+PZvbU+9D
 HBOjHU53RskcE/Q8OM7xeti4uIBC6ee9sU+smDeTShM45dbsxU5CWno8funcV4hYZrnGUfl5F//
 lmQu4YmQHgfKq1o5UT9/inFaNYynMB2khzbK2Ktq3Pl9pEHEPyC3eAEaFCGE4R8Z+tR3BLxqbft
 E6J9d3VE5MkKXTVB8FPG+nljQsr7CFRBooRzGXrVAAZ0fz3/cz1eXwqlJw2h6YGov/XEHKC40z9
 BiCxZXsAJWErzB5fPz2AA1nxnSSdsaw5USf4dzyzu3JgznatAxVTNpzHKFl4L5bkyR6MGu1/lYX
 5l6IeCrk
X-Proofpoint-GUID: 2e5JbewWj9o2Y6EkBQAIIsVlbXIaTBHS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090025

On 8/13/25 11:51 PM, Bryan O'Donoghue wrote:
> On 13/08/2025 10:37, Dikshita Agarwal wrote:
>> However, now after removing that restriction, the instance state can be
>> OUTPUT_STREAMING when firmware start is triggered and substate needs to
>> be moved to LOAD_RESOURCES.
>>
>> Fixes: 547f7b8c5090 ("media: iris: add check to allow sub states transitions")
> 
> If a restriction has been removed, has that restriction been marked as a 
> Fixes: ?
> 
> If not then we can't actually backport this fix as the dependency - the 
> restriction removal has not been marked for backport.

Please stop confusing fixes and backports..

If you're really paranoid about this commit getting autoselected, see
'noautosel' under this section:

https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Konrad

> 
> Please evaluate if the necessary change you have stipulated here has 
> been marked for backport with Fixes: and if so mention the appropriate 
> commit SHA in your commit log.
> 
> If you are referring to the commit immediately preceding this patch "Fix 
> buffer count reporting in internal buffer check" then again you should 
> mention that in the log so _which_ dependency you mean is clear.
> 
> If I were trying to follow this series on some kind of -stable kernel, I 
> don't think this commit log would reasonably tell me which depends I 
> need as an antecedent.
> 
> ---
> bod
> 
> 

