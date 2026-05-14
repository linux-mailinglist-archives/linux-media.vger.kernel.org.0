Return-Path: <linux-media+bounces-61560-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAcJK+k2BWp9TQIAu9opvQ
	(envelope-from <linux-media+bounces-61560-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 04:43:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 919F353D226
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 04:43:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 32B203018D75
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 02:43:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B54C03F4132;
	Thu, 14 May 2026 02:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eTyoZNkI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SkWCmTy6"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F210D1E1A3D
	for <linux-media@vger.kernel.org>; Thu, 14 May 2026 02:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778726627; cv=none; b=GCDRjP7FAz7TTNvc6NdWnE/MvL49/VTfe0afJjBQ4ULOFtZ5VcTl5nQMGZv1mJJ2fO1Ddc09ETVHUrc7UgqZUikUUH/iPpaSz6KA2We0xoa9h5ZnDJHritDxIh1iV7mVor4lZ9tYNUoLHRNP5iw2Yiut53GywhUt0n4mYJsHulQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778726627; c=relaxed/simple;
	bh=j4VkVGsKmv81DZdgXB2+725aBWLjte6B3kwkxQ0Aapg=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=qDPTL3FoXkc+Ch9vzEDBN+olvEtZKP5qGV7Z7GEkyDeJ+tBX70sKhHx87A0cXH03cL9ba1pB95+FDwfMxHPZq+C709K/FPeMdi0NRiPNGdRlkWqE/QlimCeFLzx3pB3oRaEBR/UR4jH87PYOExKhygzgEgY9q9DeW2K168ix1Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eTyoZNkI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SkWCmTy6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E21ddZ2524321
	for <linux-media@vger.kernel.org>; Thu, 14 May 2026 02:43:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DD9oeM+wN6tf0uECje+qAm54Sbo9Rh+ZmIe6cFAiyIw=; b=eTyoZNkIan6atNiS
	HK8aOfa+Wh7UjtMgx/eOYnVuzdGqf3efjQIwkdU57VZ6XEG6OpxjV5iiyHX1ibdm
	A+nDFBrB05DbvHjXiwwNHtYAJMBuE2jSyjAzzQ5OZLJWOK/04uqYdAkt2q/GaVJ/
	jU6IwbRrDzcTF8K9yi0fOUsnndLEM0U0zGH7uT2vpYLkoee8pegzAJwE7YZk+OMc
	GQylLJvf55dlGUDbOyYUnDlDoCC8tNysXBq4m2IcHNkKe0XwmsGHg51J889ohIXD
	5f6wtAhuE6ZI3MuUOTmXPjfVYqW1CtpedR5m90VRGu7S7esk2g3L/5Q7sRfgIHWF
	QUtoAw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4vkjj0gk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 14 May 2026 02:43:44 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3662eec51e0so4244254a91.3
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 19:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778726624; x=1779331424; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DD9oeM+wN6tf0uECje+qAm54Sbo9Rh+ZmIe6cFAiyIw=;
        b=SkWCmTy68fVTx3qeNbZMiXf/wa+dcGAM7+S19fT3lSmRDlrn2AFqEU92lrxmBCnoXp
         sLmW3axHRrFZoIZbn/55biuEUZedYviV7krX21D0BjPYsBZOLAeCphDaGbedzZKYciWF
         3R+91meFPoPaDryK/R5dXta6W1o9aGTHsEzsNvwhyFhS2hptQy5iuMyflSc3Gz2zoa1n
         V+hE8BTB4TI1Udwm+NaGnn9H10kU3js4Zgb9S5jrE1SQUgM+qxGLztBwVaBpeJXZNkfq
         ouBazIQSGanNLayEUP6VraQOQZKq/bkzyB74c6a/CZ2kQ2/ERisn+YrEbXqpRoN1MndP
         NApg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778726624; x=1779331424;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DD9oeM+wN6tf0uECje+qAm54Sbo9Rh+ZmIe6cFAiyIw=;
        b=IsZgogwb1vMokYrughwEQMIsHFCem6/9oJpznQ1jadff6Kv+oEcgEPsuiwUew/VZop
         97i13/FNWttFo0NXh/59IXXysp4E4ptwSZrVvjFrKiMdbYxv8y8wOpFxL4aOXgaOMnin
         wqS4/C1/w8eIB7OuOUyBKz6GdSxX+iBEsSi05vGXU2FZgEG+ymuuFQx11lQutYKchM0/
         AXC+tFI0lD3wHR1rpBhYhPz/z2mkkw2WYYHGv08VoFW/zsIjDqjIW6hZVS8o2ptY6jIY
         DctEWGmkf0DpomgoqI0Y7D0qOJ3xb2t36KupSFtRoClTd9+K8KimRso/VcBgai1zOR7Y
         ATRA==
X-Forwarded-Encrypted: i=1; AFNElJ+46s/jZJbJ/p68Ei2S2qC0Hxn7wHKho11g24Vu2bMPCSQPK/HtZicdqSRlg7lTTLcWZ9yFkWJOzqSZ1A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFYDII2DNawuDtIpoG9PphegTd2Mvfx14KwJWl91+/AiOz2WcP
	sAT1Mjyesw5Ffk+kuZM41YgWIgmUwnTMspqS/Cor0tpThhI+VympLMdOvxueN/+5MMK9vJtITXo
	iNPWNB7mbvYwAcnCQMXu+Ke+4xVttWZqIUpitBncDDJKW7h35nCAcRi4padLhHxW2HA==
X-Gm-Gg: Acq92OGTWZdxsW9omnnPA/INl0YdIPMWG7U5Qu9HvXSsli4im8yppu6K2inQL6xv77D
	ehsG9TebDZkxQuEWA2JQUmojygqiHZYq6hYs56dKvYoB/U9EtNsjra9Y2tcN9KlpW0o3VR/4EL/
	UQ/U2UsQXy5Nlz+GhThFLXjNaV/pfWZSE1O2UQxMu0TtNt7AlMySuJ9pE5bl1A4TxLYlrGWYZHJ
	BL+2echYknOrtynYBEhZnNERluLsmO3V2py3g9L71SWtRlzc7fM8hI435rdgpL+38GJqWmYR7jQ
	OSy7gpP2HPc4ExC5gnIMlPRxXD6T55wOHnj0yYcfzYTLvieZYh8YrXluzPRMapHPtXJzuCAQQ9J
	JN6FWOtFOxo93wBIkDueC+nO7raJ5Ba/jgsCDpss9/72WFHWxPiBixcp43KT+rqJN4nM9hwaAUK
	qvcO86pXUaEg0WhkCz8VPV6a0F3ss=
X-Received: by 2002:a17:90b:3a0e:b0:369:223a:cb60 with SMTP id 98e67ed59e1d1-369223ad529mr2081171a91.8.1778726623694;
        Wed, 13 May 2026 19:43:43 -0700 (PDT)
X-Received: by 2002:a17:90b:3a0e:b0:369:223a:cb60 with SMTP id 98e67ed59e1d1-369223ad529mr2081134a91.8.1778726623102;
        Wed, 13 May 2026 19:43:43 -0700 (PDT)
Received: from [10.249.28.138] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d0fcb10sm6502625ad.60.2026.05.13.19.43.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 19:43:42 -0700 (PDT)
Message-ID: <d3a7fc7b-259e-4cd8-b72e-a352733e69cf@oss.qualcomm.com>
Date: Thu, 14 May 2026 10:43:37 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: wangao.wang@oss.qualcomm.com,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v7 2/6] media: qcom: iris: Add Long-Term Reference support
 for encoder
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260512-batch2_features-v7-0-4954e3b4df84@oss.qualcomm.com>
 <20260512-batch2_features-v7-2-4954e3b4df84@oss.qualcomm.com>
 <hhmz7gci2o2bbbnsul5aj6oxxtvvzxfuxcifqvg46unl3q5ckm@gxlysjc5y7q5>
Content-Language: en-US
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <hhmz7gci2o2bbbnsul5aj6oxxtvvzxfuxcifqvg46unl3q5ckm@gxlysjc5y7q5>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: iG7zD1u8PGMtTysYx-fdqe72srcBouTw
X-Proofpoint-ORIG-GUID: iG7zD1u8PGMtTysYx-fdqe72srcBouTw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDAyNSBTYWx0ZWRfXz8jTIGZEpMYA
 wbTekkfFb3bi0OqtIpSauzjP9UKEmtI5zOktBvIo/8tv3Ay/mj7zA1ldBfpG2WH0GqLosp7S9P7
 UVAYiOEz/eRTslwae02zCcA/9zmzpnAtQ6IW/F0+9a4X5tXCDHvRxSzYK25Si2RfW0LBducGWmy
 Qg+pKmKRgizpbloLDw9aEDdUYIIFDDyqSoFL+FWHDc68QtWxSUKf+pitX0s4hCcvHFYjjvPKuqw
 PL6z7J1/IGbhTzlZCydzE/JVjYQoCB76x+GTc+0p+oz3GHMGBU9t6QuFuz9MrsHjhRAeEWFbEzB
 C7YEbcoGzDUXYkLO3SmpZs3UgmF6MtXx43HYMwxkYlUkhYG+r3bsZLvVTxCxEkcjoNtdjeZHBoT
 cMpM/3mWuzQvIgA8ryuJpavznyO937DLNtsq/BKmcsk6R8GxhG5Yw7SQtFosGwayots4vDS+O+C
 Wm7HqjmcV7Bu+6P+qdQ==
X-Authority-Analysis: v=2.4 cv=PbDPQChd c=1 sm=1 tr=0 ts=6a0536e0 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=0T0VQSjcn_Gl0omFypMA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_04,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140025
X-Rspamd-Queue-Id: 919F353D226
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61560-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 2026/5/13 18:56, Dmitry Baryshkov wrote:
>> +	if (!ltr_count || hfi_val == INVALID_DEFAULT_MARK_OR_USE_LTR)
>> +		return -EINVAL;
> 
> This means that setting the property will fail if userspace has not
> updated it. Please make sure that defaults don't cause errors.
> 
>> +

The error returned here does not affect the encoding from running, it 
just prevents the invalid value from being passed to the firmware.

-- 
Best Regards,
Wangao


