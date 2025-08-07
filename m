Return-Path: <linux-media+bounces-39051-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69870B1D858
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 14:56:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13CBC722F94
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 12:56:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B9152571A1;
	Thu,  7 Aug 2025 12:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XZ5kBhJB"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365F1255F2D
	for <linux-media@vger.kernel.org>; Thu,  7 Aug 2025 12:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754571359; cv=none; b=rry/FrpDlWCeeMaIoUaeS8EnfninDYMS/+2tUJ4U66FW0ymgdinLGFGQ/swteiQmZ079R49B3E5kJuD9l4FXFXr0ItMSAGQOjciOyoyXL29o/c4jdSZlcwr/NYHne/Cf2B1BrfocTqm1U6IOTp3vjsR4T2YSe39UmuRTNGk1tjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754571359; c=relaxed/simple;
	bh=cmLTJCu08IZdkIuuU/IBxWNBdqB/J5DZTkvRxpPHoTU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j5AgJxDi/DgaSNNPOW6ttVsyo49Z4F/Ry8bNdK03ds74EFboNOly9TSnW92kc6xu+fW2T+j6yEvQj+5xPMIroEwgQ8yWqRZaItbbXqz1+lEH+vwXA20Q4e4RRZ8nnwcLt91rME5eyaYQ9oTxuNPrZrgtVqhmzp6AigGy+KAxao0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XZ5kBhJB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5779Cv2I003588
	for <linux-media@vger.kernel.org>; Thu, 7 Aug 2025 12:55:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D4bMHXUEWO9j3LsN7dUEww8s9G0HlpeNdFt7tEVo1/4=; b=XZ5kBhJBZCEgPH7H
	gzINhwRyPPxJbU7Yw1GDvZN1Puxr6n2Pe7YVYSr2JdeBee2FkZugEuQLwjZXBKax
	u8LoQ8Lulo2l+7gPreA7Jw8hhyY3dOaP1F++R+jQJKZWGHapg9p8uvayZoo9x8TK
	9tRWYPFfz4jZhlbe5heY6sg/BhURBbvPL0WjlVJNeumEa54aq6qlN5HWLt99bhra
	Ref7HJ52p5OkSb7wpZ2p2ZgZgElLIaggwfEmqq7Hv2Zgnpz46GLiYaKmigC5q1/t
	Y/Ek0jhNN2PKwd/gqITedJLJVqwp+JeVVjj//SUAg/R4xxzUDpkgjzash2QNRtnT
	mWtjbA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpyae9k8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 07 Aug 2025 12:55:57 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b071271e3eso2671341cf.1
        for <linux-media@vger.kernel.org>; Thu, 07 Aug 2025 05:55:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754571356; x=1755176156;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D4bMHXUEWO9j3LsN7dUEww8s9G0HlpeNdFt7tEVo1/4=;
        b=ccVAAhc6DBqh0zAuzdiBzAZza1GwRYIvEu4NxnnqVVUB45mdGtDM9FNRuLKBVxeZUc
         VnrVIjtp5kovPnO8oUoG3YXne4Aui+vSGiTZTxgyz1kNBNZeTK59iQ92JWfcarfByYw0
         67kU3xEK3SHVz7+eAtHNhyNHInMrdJh994MS+xfd2RxcQZR8drYBSnE9Fzjbokc3vG3C
         iSKztQU6ceHpghO5+chfpM3u5rRkigOWjdTWN3viuexanS8Rd2ix/msN/5NIfJ3zOoje
         6SgDlNvwpRTc7SCuKf3xhpmzTGfVvje9itiOu1DA2umHLWiDo1jBqRofxcO1MXOSjjCs
         ZqBg==
X-Forwarded-Encrypted: i=1; AJvYcCVORFrKJBUt+dtd8Jas6N/+MmWWxeJTqyM2DbiuHdkhi1gXH6TN0+46BJXMcE52rH5vzboDOLoOBV47gQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8l7yIDC0FaIKZJqzmzpuZ7hqXEeNjht7bB839bL6QHrTf4Xl0
	IstnfrUmnYEO9HMfRjwaqBiifZ84uhcRg7r3W/1/SZuJn0szP759501xHLJXpRCUKk0xu9QeLZM
	JDG3qdF7P8R6gKAqsDYRLdYCyrdDqRf8Qp1zdl2lnB0FFuPekQZeL12YzEL+yw2p6Rg==
X-Gm-Gg: ASbGncuGGnOfdV4N1uJJjyZEYvE0h4bQKwMbI7ZTxAGyc8BO5wOQGyMikrJ0MClC1nb
	3/U9axdazjcHemfYM85H+ev/Vr/tQZVmckl1jxsfMKQYVN8H1xF+Nj1QQRRcY8E0dya0FI0rxH4
	1o+vWyWLovAQ9ZzlRTs7+GzTSCJzyB83i9aJODy7nmSBEaPY0Nepu8zGyLTONF5wkYLnSu5bgWC
	gF8rinnYtYNzlXK8reXPwprrcU+G5CJv9Of/aNcfJcvVnc9bGw0/MvBVlgI/0L1QP7ofQxPrY5A
	hOR9QCgtcphOWHpI/WDKb6lLNJHbKB+2sCjjYHCh9G6TYABhlbjU1E8cTYqKszHr9vMtdwLxfA0
	weIjXWNW/OMK6lPFagw==
X-Received: by 2002:a05:622a:1aa3:b0:4ae:73dc:3896 with SMTP id d75a77b69052e-4b0915d7c31mr41550061cf.12.1754571356130;
        Thu, 07 Aug 2025 05:55:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwbcsceg5/p61lAf2t1TB1KGC8pzQd5z817hJbPD8siowrxZQPY7hCXLhIuHIXx+wUv8hceQ==
X-Received: by 2002:a05:622a:1aa3:b0:4ae:73dc:3896 with SMTP id d75a77b69052e-4b0915d7c31mr41549941cf.12.1754571355647;
        Thu, 07 Aug 2025 05:55:55 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c0afsm1298236866b.117.2025.08.07.05.55.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Aug 2025 05:55:55 -0700 (PDT)
Message-ID: <38534c32-7e37-445c-893d-3624bb59981b@oss.qualcomm.com>
Date: Thu, 7 Aug 2025 14:55:52 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Patch v3 2/3] soc: qcom: mdt_loader: Remove pas id parameter
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org
References: <20250807074311.2381713-1-mukesh.ojha@oss.qualcomm.com>
 <20250807074311.2381713-2-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250807074311.2381713-2-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: cqSYVsmlY7YER_cWi1AzljkXTYb6S0_Q
X-Authority-Analysis: v=2.4 cv=MrlS63ae c=1 sm=1 tr=0 ts=6894a25d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=IDvrs2r2PCma8_SM7s4A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX0iOsNL3+aje3
 3/Z1IBqew2M4H2FBVFwIcNQ+fyPryuYldBxMt8fIwReYnRAnRLxUhl1sBgUIUfuL796VgKNQUY1
 4xaoK+/YRRz8LBlWlA9s1VUcndRrbfA1YG6o/1nORHvzBcrOKzJa7l3qYnqsdTAEqu6O6/AIqch
 a5yhiPFUIlfzIlwA4aHf3sPDhFQsA7SQQPdhkXvN5mnmrGVXq0I3ui+3OORBV5NfSkWiqEFT/t3
 9Lc6bnirzllyQH9PASoEb9FkiMvWINNW065sk2JeHTpRnfBRo6iPlqeJaQLnJ9VVs87f1bCOOhX
 e7OrLvGpii8JR8ZauRfxYRtAXZawzeOvxKQn3zISLQP0aEweCcj1h35XEMeMvcPp2isfyW5tYhK
 naDppA2q
X-Proofpoint-GUID: cqSYVsmlY7YER_cWi1AzljkXTYb6S0_Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

On 8/7/25 9:43 AM, Mukesh Ojha wrote:
> pas id is not used in qcom_mdt_load_no_init() and it should not
> be used as it is non-PAS specific function and has no relation
> to PAS specific mechanism.
> 
> Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> Acked-by: Jeff Johnson <jjohnson@kernel.org> # drivers/net/wireless/ath/ath12k/ahb.c
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

