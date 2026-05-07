Return-Path: <linux-media+bounces-60800-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFaBMlqQ/Gn3RQAAu9opvQ
	(envelope-from <linux-media+bounces-60800-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 15:15:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F234E90A5
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 15:15:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B691630166E0
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 13:14:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8985F3F54D8;
	Thu,  7 May 2026 13:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qv/kG7Ih";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UUcvZfnR"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477863E6DED
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 13:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778159672; cv=none; b=BaeTNB2hq33K7NnZ+9oPwrB3HTG8hSt46IgeN7ZQ0j/Mf5WVFCp0BYh0t4OG/7CAhBj2IEOIOjTy6WTp6uuxV41J5hsv/YyuAwDJWg390cZZVBEHErkatSwSb77T0tZbLntNhkZffQqsKL2dfQA6sS6SErWAZEGBdjBKZSHPAyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778159672; c=relaxed/simple;
	bh=ytXAXdVU1RbIHxAdWPmCMlWrMpcdmU2fG/TIhwr79dI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dn+zVGm1uDEQHNCCHvCheTyb8nmZv7qtu5UQGs0xNIozZdX8NU9zDmhr3sCAfVF7Rbi1UwG+XR4QrXzM86+5WQR09wqapUGghHAib4+1mprSOX2C0ptJMRw78L+FqNL9DoswiBpKkp2c6t4++EbbhzM9jcw0UiaMTCPs2AP3Igg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qv/kG7Ih; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UUcvZfnR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647BkZNu682839
	for <linux-media@vger.kernel.org>; Thu, 7 May 2026 13:14:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vwQdmTCMHnbwqgGCPCBdP0sdAsnXRvkdsmJBPtlwIGo=; b=Qv/kG7IhXEdJJwB+
	tdiNpHtjCiXTuoQ+YnnzauNW+bgP3XzGu7l7dpf7LDgWmybXSOpz3MqdM/JZyBGV
	KygaJo1WJu3YRy0EW20YoyWDQJa5kpkc0egN1Zg1xCcQuHvl14PsZrSbXetHkoMH
	v96Bjhys/NUmWBCGF8T+VyjZXLHigl9+0EReiZ9ibt94Th5Y/5zdTD5sVh9AZfID
	RC561xME5y6Vw3N+baEzKGamJnHL6FJpMAFyYay/KkqCJLpz5GHbrZGzXqFxJOkq
	XPu+UNqvm//FWbDtMaeoXrPpVJFmEUHDICcCCAsX5ENBLMAONdm51SG/dPN9KfmC
	O4N6MQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0mhaspa9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 07 May 2026 13:14:29 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ba3245a43dso9492035ad.0
        for <linux-media@vger.kernel.org>; Thu, 07 May 2026 06:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778159669; x=1778764469; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vwQdmTCMHnbwqgGCPCBdP0sdAsnXRvkdsmJBPtlwIGo=;
        b=UUcvZfnRnfp8sthQSKsrA6aCn8ncVEji6XA7Z4X6WVge5S8MHv0C9lktG6WQMau4ar
         DrXOyYkzvEEe5aavsA0v77YErEMZp4Vr8pdiEhkXC29LyFruKDmoiauHq5Kp97qxJWAg
         uc8C5nHPCoC8QMRrys6yjLSg4R6m9iUf5qrIqr92mymfpa7nDg+E1xymcGsYDd5qYfxv
         qk0PMlIV6sDTN4Z9+jqvuqh5lxZ6HqFL3/rNkk8fZjqfPT7hbVc5xHGT/KjNaIF65AeR
         Pfa0L+g63efDez9m8JPDNBO44ukgLpZr8T523rU6BRNxId+e5cDCe/ymo6VgKZLnjTDM
         XwKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778159669; x=1778764469;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vwQdmTCMHnbwqgGCPCBdP0sdAsnXRvkdsmJBPtlwIGo=;
        b=VP1sxVLjYr/9onT8YKMLnqkOvbKBTZOMjf9c7Wzs04TDU4yl+9WiheXwUZRdka+lYc
         fSic5NINOYNs+30VyGne0V+IjZ698PmK8PW2ZWKszoDq2s269CGSrUxLirfgxJunAnGT
         FYhLxfPkgxq+xzsdQdsdhWkZ0zVyEct9kI5Wz9ohPEsaaHJWWTZftbrnluRcfYmqMbPX
         0f7xfVLjgfrL2or8ClAiZIN5pNq2PvMg9OU0dnE8/ywzPSa2aytfUKZcFTH2yglrPOuq
         e5joxwpZ5EOvm9GUj5Rowaey/KWbMi8KA31GkwsDzGnxkcj//dVpupTPIGAUg7xBJgyO
         LHug==
X-Gm-Message-State: AOJu0Yzf9R/4H9MFT8Wzex+ILk+S0GF7w2/Cp3erBprrWvCDSKf0Q9Za
	G58oqRJxCWa/g5yeg2xKRdN8w9FJkMK5s1m66xk2icHn2ijQ4HkICbSPObp8DRKjC0crE9kp6/b
	rXkzBRl4HiLGkAcavGCBLq3wCQAwRn9ZKTxuqk9kVMfNfpuMwOD5fMdRP3v6Mlfnm/w==
X-Gm-Gg: AeBDiet1S05fwojM/XmEZswQ7SU3J6X1v+5W45FrB9veIvNu/DPzV+wLDcSBSyG+j8c
	LXQdlGT56lG2i33Jk1ioLP2Dv662jtIS+2wrTeeXk7aiE65pjU07QExPFTiHTbz6czf51Ia6ZJn
	WKuM4Hd5KJdh6M2jezrK7j6GA3ZzLalfCiqLTcwcFUH7KmBoyKv9Q1i5mg16l2IqFV26Y9vQlpa
	T5ErH+NuqTuGn6SDzvusv4CSH+QUjoyDwr4/WPMyD+5URb9C/eNEpUAQyqPHhG3h/pPiURml87w
	Nbzmg3yJ1ny8y+auOBSEmbDRvzC3jDwDEoK1sfmCUjKSAGFj4sUIsM8H3y2Wx42TSHBQ769DrZp
	eMes3JYEM4ixwChWeuklA2fz4a4MF6Gq0PhsEtVaoe3J611JNIpP5RaS8Nbdpy+jDDl8=
X-Received: by 2002:a17:903:2cb:b0:2ba:9587:25c3 with SMTP id d9443c01a7336-2ba9587276emr59811855ad.1.1778159668788;
        Thu, 07 May 2026 06:14:28 -0700 (PDT)
X-Received: by 2002:a17:903:2cb:b0:2ba:9587:25c3 with SMTP id d9443c01a7336-2ba9587276emr59811615ad.1.1778159668351;
        Thu, 07 May 2026 06:14:28 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.248.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2babb1f0148sm27671115ad.82.2026.05.07.06.14.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 06:14:27 -0700 (PDT)
Message-ID: <48a5691a-5fe5-41dc-acc8-270037cac598@oss.qualcomm.com>
Date: Thu, 7 May 2026 18:44:20 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/16] media: iris: add vpu op hook to disable ARP buffer
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
 <20260507-iris-ar50lt-v1-5-d22cccedc3e2@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ar50lt-v1-5-d22cccedc3e2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDEzMSBTYWx0ZWRfX75DtupvypXjG
 uLy5Xad77QrSvKFUYrrbROQitJPX6JFQrjEEp6nLCWDJAQEJOP8JNJiz/2ZANAGBiGZCWMoQBGw
 w7qGlutCmkWDO4oQBLUmeVC5sZ/ZfRE3hPzyI2oRL+zc/yGG3/M77A2T+tJEz1PzSY8/JYUtoh2
 KdyFhmWYQ8JdM4aW5SWi+bo5g015EO6DJc9vTHdWYuV0StW/CEkMReXHPTa+h8qrRp58m+pcIrO
 x+AYFrE3IH8sSZMdivJJyqmo9ASl27gx+poNflTta+qVhyl730OVqvrB6UiWc2BlF4KevhbZNW6
 D5m6YQUSJ3J4Lnr1eazNldckWWIE0duBf7Nw+QH74XSN9lUHoUveuvvl9cv4JCFPKjTEpo9xrGf
 J+OFh6L5HvE7xNkXa0/wlpRZM3RkAxwz31B3HRmjQZBy2HIQxI+T6w9wjSG+de5W7aX/K1pGZgM
 iM5PtnrnLvUZDUkJxtg==
X-Proofpoint-ORIG-GUID: 3W3_2DnNT7JcZyn1vz1GlN-wDc6FTH5e
X-Proofpoint-GUID: 3W3_2DnNT7JcZyn1vz1GlN-wDc6FTH5e
X-Authority-Analysis: v=2.4 cv=ReWgzVtv c=1 sm=1 tr=0 ts=69fc9035 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=EkRsrf7Hk27R9rd+nIzaeA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=FahMO_wZLRsdh1i3WG8A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070131
X-Rspamd-Queue-Id: 44F234E90A5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-60800-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 5/7/2026 12:12 PM, Dmitry Baryshkov wrote:
> From: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> 
> On AR50LT platforms AbsolutelyPerfectRouting (ARP) needs to be disabled
> so firmware can configure the ARP internal buffer as non-secure for
> encoder usage. In preparation of adding support for AR50LT platforms,
> add an optional disable_arp callback to the VPU ops and invoke it from
> core init and resume paths.
> 
> No functional change for existing platforms.
> 
> Reviewed-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_core.c       | 4 ++++
>   drivers/media/platform/qcom/iris/iris_hfi_common.c | 4 ++++
>   drivers/media/platform/qcom/iris/iris_vpu_common.h | 1 +
>   3 files changed, 9 insertions(+)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

