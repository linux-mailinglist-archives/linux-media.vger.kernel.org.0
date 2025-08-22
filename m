Return-Path: <linux-media+bounces-40720-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0CAB31030
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 09:22:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 748C9A27217
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 07:22:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9BF52E7BDA;
	Fri, 22 Aug 2025 07:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GQUXIi90"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8712E7BA5
	for <linux-media@vger.kernel.org>; Fri, 22 Aug 2025 07:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755847314; cv=none; b=BEgmIqlCpaJyohIcvro6VHjp+itkFrzKtG+EiFAMkxuhnotHjcZtBqC80dJLX1pBKDPtMqqhTN3XiHVmk7KNc1nUP7l+r2D961KtPm5MeGfGftn7o22ZnSy/X0TIqE5Oo2be9f8yYNTuRRjmkLW1h3yOqa5DCFmK0YwwRZOI3h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755847314; c=relaxed/simple;
	bh=V4JPX43lceWgtpv1oK4d7uW3Xu4KaPczOPiIIa6laxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nvKrQXimNK5J4ToY3r15gYctycLKrf5qB6GBHJe8mV8xdKW1asegmeVnuT6ZdkLyrT9q7O2m+Kyp5+NcanlcwajUHvQz4HT0EG/GsFYuavn7n8rGoD7qfK/Kh9hdyB8CrUWQ2nZp4nGFyrjzym5FW/IQ+vS4rqNwWbvgIR2+btQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GQUXIi90; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M6uSxK020956
	for <linux-media@vger.kernel.org>; Fri, 22 Aug 2025 07:21:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CwMYhINTeHOMx2pjpR5qGtnw
	Sq2aRYrtJiqLa8LjGBE=; b=GQUXIi90WTdoyNI4WgCsrTFFczcJh0Dvor1GYwGI
	RKhwUjpbe+D5HcewVVkl0abs56c3fcsUB4dhmC8XZBJqBKheOb+atEs3DfNrdkAT
	n+Mn8pelhKScD+qkeMIDTrY2sj5dYqnRDEjsAx/fUjSrw3eVgNrg7Qsea1gPc4iP
	vFGxr0boMNBwpfWkPrHOH8fsDngQADzk0up8HsT6LJHP6A/pWVBDzHAYA5C+wJo/
	EyFHhFXqPifnuI1r1ljwiJyRpazMn5VcpVzgRUATrX00VuyRMzdOnjOAM7EYTUgg
	n7Jrvm6+hvr5cYjvFRKf3oLr8/NrIqqROLM0AmYNVApX9Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52ag8tq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 22 Aug 2025 07:21:51 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-244581953b8so22953445ad.2
        for <linux-media@vger.kernel.org>; Fri, 22 Aug 2025 00:21:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755847311; x=1756452111;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CwMYhINTeHOMx2pjpR5qGtnwSq2aRYrtJiqLa8LjGBE=;
        b=Lqh/APP78nqqEa3EWzYraXqZVrII/fDsQvHc0xWxYfGBJRwCsjKCd9LCLnfFn+SIdD
         LJ3AAn2N3qKchJ+Thjr3pulhPMbHYwbcbAupuo3WnPBOhRm470Z/RMm82gJizm4j5vlt
         zS+35PVoYp+iEqdDf0+G/EJIpmQDwXCtm/UOIR0s/xM+zBV7Ws1jZT9U0ojF+sHNm8To
         s+0UofUmVk9CjUd4cd6VGI/al0L2Hwan03ypUpPk6LhVHBErsRlmgdY0pIlF7p2AnnhZ
         cWvKaJFDHWGTj1CI8t7nNkJlDhinwZd5nBz/c22cFuazvHlS8Z3nJq6SSx2fr04Qzah/
         GyaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpgtlAxCPGWCVNNWxa7Tibwbdebxii/V6mB1EHEG+VgpZO1YqfQiZqwI20pRCzu/zGcDYylwLnX7TNEw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzid25VrfObu26S1eFaZx40tUDVSHtcIRCxrA6LVbpuEV0Zq5LP
	k2rCSxn7uct6NgVs8XFI3z51xr9DVml1MZZdPQ1DHZNUVo+UOfQeAt+yV/Riviafqha24cO4arT
	BJoNe6RSY43u4J+l6DCNd+65Sse5JWVfADDBVMxFRLDiGMlXiT7jE+NPNLQ/7VqCr2w==
X-Gm-Gg: ASbGncuRm14T43aFhvdTqMYLjAwK+9ktZoikLg56qL2r57dexEhmrifGhxlEyRS/QfO
	nTZna2cwhDFrrwwHOML54MRTa6JDiwdP1c9oIk/h6V+DKKevRDxY4dVwOinS+gRaz576qEUzc9i
	F8CF4hoEjve1UZQ5Yp3dECH4VFJArNbBcI0+dXeHY4mmX8Pwz2Q3Z1FOmWzFCkZqn1CaLF3c8wP
	AvycYYg/kIY8gu21E7+mQmkPjtVvAkxKEHFN351QFLJOG3ulhrkwW4KxXphMR04xGYhNWL/oMsp
	BN6A6C1/PQlgGEzrnUjxRFMRwqrSEY50tVo/SqUNaG+lYTdAjwYcqZMDjpieIQ0j9q8=
X-Received: by 2002:a17:903:384f:b0:244:6c39:336a with SMTP id d9443c01a7336-2462ee0b49amr27800975ad.3.1755847310930;
        Fri, 22 Aug 2025 00:21:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9jlpoT7r0e0ooZymJDetRkq8dj6rKg+LabazXU04BhuTfjbcXjE4AuKsBYx7BSSyebrJYDQ==
X-Received: by 2002:a17:903:384f:b0:244:6c39:336a with SMTP id d9443c01a7336-2462ee0b49amr27800725ad.3.1755847310512;
        Fri, 22 Aug 2025 00:21:50 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed517beesm74996805ad.134.2025.08.22.00.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 00:21:50 -0700 (PDT)
Date: Fri, 22 Aug 2025 12:51:43 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 07/11] firmware: qcom_scm: Add
 qcom_scm_pas_get_rsc_table() to get resource table
Message-ID: <20250822072143.3amvvxjwldmphtis@hu-mojha-hyd.qualcomm.com>
Mail-Followup-To: Krzysztof Kozlowski <krzk@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <20250819165447.4149674-8-mukesh.ojha@oss.qualcomm.com>
 <4a60c3d3-11fb-40fb-8686-3d83539f250b@kernel.org>
 <20250821172043.fh6sr6w4bwyhov5q@hu-mojha-hyd.qualcomm.com>
 <0741fed1-33d3-431d-8cf3-04b47fe80b03@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0741fed1-33d3-431d-8cf3-04b47fe80b03@kernel.org>
X-Proofpoint-ORIG-GUID: j57l37QhB2UJE6pK7Vtvk9NM6NqXEwXQ
X-Authority-Analysis: v=2.4 cv=B83gEOtM c=1 sm=1 tr=0 ts=68a81a8f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=jCfzradNRyBWwID4TT4A:9
 a=CjuIK1q_8ugA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: j57l37QhB2UJE6pK7Vtvk9NM6NqXEwXQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX4S0nHZXs9NGL
 4s1I3GWPTVyU5hs2NnYR+YCzFmncxo9IloXmzBghwh771eeH2sBu03kljF1Z8FS6EXTxmRfs69Y
 pqI9k6UeFXPN75NJBiMtPEVE2anixNxkJOcUMkMFQXK6XMzn0XGwocFs/gUVpa1LMhfS2NpELK1
 l8c+k6ufmdBl421S+Gsams2UUCpZR5hoMwCRqfRuqIvkh9RfaUwyz7z5GG9g3Ego6aviHu1Dkw1
 pjqM8zsvj5jdZi95LRB6whV20IngSlM1eKOqnleY6W4vTnn+uazDecTHee9oSaP08z90Yg9HaNs
 K/dspnPO4HqYtg2YoUVBYPfzhLFnpv7Z5qt0IEsoD2IjTfHOHjLOU357t7xSQiN196vXAnm8R2M
 cXZ4ssC7orYEX0VCqwdmT0K7oeFCoQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_02,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On Fri, Aug 22, 2025 at 08:22:10AM +0200, Krzysztof Kozlowski wrote:
> On 21/08/2025 19:20, Mukesh Ojha wrote:
> >>
> >> Srsly, what sort of AI hallucinated slop it is?
> >>
> >> I think this is pretty close to proof that your submission does not meet
> >> criteria of open source contribution.
> >>
> >> Did you run any of this through your legal process in Qualcomm?
> >>
> >> I don't trust any part of this code.
> > 
> > I don't know what made you think that way. There could be confusion with
> > my writing and may not have expressed the thing i wanted.
> Commits were written by two different people, but signed only by you.
> They have 100% different style and the other looks like taken out of
> ChatGPT.

I am not expert here how things written and understand by them and
ChatGPT are not used by my organisation.

> 
> Editing patches post factum is another reason.
> 
> Reasoning here is typical for LLM - first claim something ("static is
> possible"), then claim another ("dynamic are always") and then connect
> these two to create false third statement (static and dynamic are always).

Again, I am not an english expert as it is not my first language but I am
explaining again about my thought process, writing for some of devices
where this is the case hence it is written in separate paragraph and the
reason behind, "static is possible" written with chrome in mind which
is true, and "dynamic is always" going to come from EL2(gunyah) and from
TZ on Gunyah absence and this is also true as they are decided on runtime
and not all devices have this dynamic resource requirement.

And writing behind this "This indicates that for Qualcomm devices, all
resources (static and dynamic) will be provided by TrustZone via the SMC
call." is in context of this commit where we are going to get this resources
via SMC call with this series in mind which may be slightly confusing to
someone to understand and I will clarify this in next version.

I believe the mistake I did in this patch is that I did not include
Gunyah/QHEE absence which I have done in other parts of series but this
SMC call in future would be used even in case of Gunyah hence, it was
not used.

I know that I will have to declare these things if I use such tool and if it
falls within my company legal framework.

> 
> You got three strong indications. So this is what made me think that way.
> 
> Best regards,
> Krzysztof

-- 
-Mukesh Ojha

