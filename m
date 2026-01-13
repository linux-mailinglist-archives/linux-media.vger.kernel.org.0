Return-Path: <linux-media+bounces-50572-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A0935D19E4C
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 16:30:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 827CC30811C6
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 15:27:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CBF1392C2F;
	Tue, 13 Jan 2026 15:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PazK/Nv/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GR5R6ZRy"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B3038FF19
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 15:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768318018; cv=none; b=kOFgPW9BoVLBQTvY8xKXoHw3Aqs2SgI4Mz4LovmA6miKP0OGpkzY3iL5NVwJLgciv+CVjVhl0d9Td1a3C+amYJD+pr86QPZvnFe5x9GMB9zgQU8oBEoU5uRaxR4FWTgxDEyPjb85EmuoHeovDXqdPJhP5ZmjM2eN74M7re6qX5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768318018; c=relaxed/simple;
	bh=H9mGWxU5tI/68NlwoUxq/KaGxGic4AYNAg1bQz0mc8g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QJFfl7SR6RzRkgDOvQrcD3uIjaGgQ7Fm6M6eKQKu7kRAGj8cD5VQn42Ct+jyrbsxh82OqVgBAxmQnzD1eP52hhkXGFkVIlqoZ4L6x5i3amu04ksa6KLggYSA+ddocJZSbI5rty/dxVWfAVYFa/ZhIzxuPUSTjAYCsJkDIdFF8fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PazK/Nv/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GR5R6ZRy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DDsVSv2071289
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 15:26:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F1az1Woti5BYc/nrE9F+K1wucFs6vzpU2BiesykC2Rk=; b=PazK/Nv/9u0YNnk3
	4f2m+A63AA6/dckoLcdhElKLR4gyvfV+TzwRMfShfoFjQ0oIlbm/TQcXNQtFh0LZ
	Ksx+/ecmR4UzdyiFD4l2N0dvX/wdoBMidautqc25z6PQCWsz+b/Jn1PGXwufDDs3
	VYmClSeuzwtmrtbwcdld0y2X+/A3rPdo2f9vxCxCJyx/SsJ3kcg1ApwL6JE++WvA
	r8ggYoxRYEJx1UG1uqoRxgNEM7JC1/XIQw47dnUgdYilLVwIikSivKgYN1JV3CB5
	wxc3tOVG/K+poy3XS4tyMrcBlddDAdpETFxRV+DT27Qb95iibWJ1Gttgg+ah5BEc
	6afLEw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnqbm8a4m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 15:26:56 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee409f1880so18775401cf.1
        for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 07:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768318016; x=1768922816; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F1az1Woti5BYc/nrE9F+K1wucFs6vzpU2BiesykC2Rk=;
        b=GR5R6ZRywPq5EMXzqMPOhiQWZHDh9zsKKucPfgq/7HuMAsknQkWrMpOIBAemNlu1hP
         lqFFp/asbvoL595+Rk2lS0Va64UE+UO7kuyMB81j9BImo7V81Q/jIxnJYkNGtJ0J/QyU
         3+57Gy8mFO+xlB8vn6hbBikzdNZq9UzWcAMJ2WgrFuYpZL8Lxs+EKD+BcbFIfaOmIY5w
         EgIusg7CHXNjmyOh1eWWPS/TRDduHp6WUmGBkkHGHIq/G8TgkXmOs2BjY+iVQUSFN0mx
         M9w7kH0+Ltvavda2fvh5xdLR+yda+jwGB6O9xgQyLhEBDpfFB3ddK1Z+aAXGIMTZLigJ
         O5Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768318016; x=1768922816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F1az1Woti5BYc/nrE9F+K1wucFs6vzpU2BiesykC2Rk=;
        b=eOwd5Vz2IBmZkNf5DDoor/6Hq/JRCuwjd541rwG5D9hCU/dqTUHc3AGnxm1XWA5TDi
         jYenVgDgyfSAOJ5O0n0T7C9PpqxYT/Y1zzgW1r6xGcPnOFdVqa4Sf3pOUWpQYT5SdCb4
         VlShS4xSGSE9fIp+djQrOutU15prl7EEHryBqW4bOUCD+dLmqRmlFSR6zedIt4TLd7Hh
         mSCHv+Tz2PP7OYWsXZx+xVj6uMpAY1gBM562A2OpF+WacMpCS9EW5FaOd31XdAw8ve0Y
         Pqx2IKGbZqVydEaQ83UI0DnjCD0GNZUuoT22LVm2LHgBUrLMaHOkTyWFkTwQdxdA/COR
         De6A==
X-Forwarded-Encrypted: i=1; AJvYcCUH0aF8OlZRlHT9TEQggZ+lTYePHtyyUfOlaJ2QfSqy/mr5si//RQ5evdeSucbUP1gG+wSQLAvlBRW0Zg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2SkXkYhEiYt2k2dQVcjZrr8sU2UiTjkoXq4c5l+/quqoXrBTl
	ls0hpvKndvykWNb7SKGZho2/B72hJOuTWbJzu83/M1q1Hdr9KygZ9cvSxK2IBB3BYbObG7VuWfP
	RQIeV3ms+FuM6BR9omr8/RFhfcwbaecSmmfV0+WBvRVqzm9/Xk/Bwg6Vr9uOd1Lpq2g==
X-Gm-Gg: AY/fxX7nkn6dcg6DcokAhpwxt1GmHsVwT+0tjI0jfkX3cak7Zy7axlwYKS5N0V+bIgc
	PJfpfmNOkxSMIf3FuSsHFYvxjpKlfn5h3r9V9vflwuZqTaEcwPZ+kRbsLtjsMktLxYPowglp33v
	M1LihocGO3C5KbeliaFDSrtf/isOkZjxdSwhdKkWeYA7hs1OYyW8mNzwpLqTbo8jfVG6VWUtou/
	L9AsKDCJoHfr7FfJ660e2IYJJWZlfybxH0/uhy15Ug4uEmA+sLVZrRzpyuNkxELbtrbWQ7JR4x/
	gblTPQPU166cpsl8796BuFra4NrtYNteSE5EBYSsMLOf39EqIB6xRgUDv6fSwlqec7bWbCYJT5n
	21J0k8ALzNctJyb9wDk7TzxqcMTQgE/XtPt7yrkqwQub9L6zFpgdq69PCd0Ge6/dCMpw=
X-Received: by 2002:ac8:570f:0:b0:4f0:299b:c785 with SMTP id d75a77b69052e-4ffb4acf414mr226028131cf.11.1768318015371;
        Tue, 13 Jan 2026 07:26:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH63OKsfsC1PCQAIfHI6h3nw+uJWv7koCZrOmWbLpsbWAxrJGkd3sfSU3Ah9H1bPnxDS8ArwA==
X-Received: by 2002:ac8:570f:0:b0:4f0:299b:c785 with SMTP id d75a77b69052e-4ffb4acf414mr226027601cf.11.1768318014831;
        Tue, 13 Jan 2026 07:26:54 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b86ee5287e4sm1020534866b.52.2026.01.13.07.26.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 07:26:53 -0800 (PST)
Message-ID: <e5472469-84be-4ae2-97d8-6756f2cb1a55@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 16:26:50 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] soc: qcom: ubwc: add helper to get min_acc length
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org
References: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
 <20260110-iris-ubwc-v1-2-dd70494dcd7b@oss.qualcomm.com>
 <5594210c-ce25-40ac-9b5c-69c97eb0bd72@oss.qualcomm.com>
 <spk2wlfjgrtvkbxk2rzklsdg7ojpcsehl6c5fzaergrq2chpcs@p6s7px3lrtt5>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <spk2wlfjgrtvkbxk2rzklsdg7ojpcsehl6c5fzaergrq2chpcs@p6s7px3lrtt5>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5ZgYO2GUnzVXdbdjiCWxRC669kh65ax_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDEyOSBTYWx0ZWRfXzaWwdWjVBA4a
 uWgKZ/k5q/+S5dUExMJpOJo9SKPXrU5dXTjISI9+iCeJVIUz9VEC7cgj23qwTv8FkI4DAgFwFRX
 2u9ovPrpzz1iLBm/yEgMe4BXsXNpoE3fZXLjVVFpWOwfUSdzu5ItcayuXiLSPGBf2r+1lkRfez/
 qYNJN8r04jRErsa1UfpdedkKpkc8sbCYYA37VggZ87wnYqFeOCQ/VJVzWdnY6BtoqlxB7x3UbCk
 CcwcumqJqn9bkEV17DOoMfTzbMc0NfsIZGLOBLky+gcZR+i3okvJyVJKRzFmFvsA8+U9iK81uw+
 /mnBPKG9acaOQRikTAILblddEmRC4Qp1ZKXZP7oa3d5ur1YzWuGUGJYMbEMbOXOTXPFP5OMBDQg
 +DBrq9Df1gbh/4beiygay7iSkn4e+8RRBR03VuarBLwWlDuCtrEajkBhHPFwkCtGy9dcsANjEci
 LA5J0LihaCOiJfLoVlg==
X-Proofpoint-ORIG-GUID: 5ZgYO2GUnzVXdbdjiCWxRC669kh65ax_
X-Authority-Analysis: v=2.4 cv=YdmwJgRf c=1 sm=1 tr=0 ts=69666440 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=2hdBVZVomPjqdouaftMA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130129

On 1/13/26 1:24 AM, Dmitry Baryshkov wrote:
> On Mon, Jan 12, 2026 at 12:08:13PM +0100, Konrad Dybcio wrote:
>> On 1/10/26 8:37 PM, Dmitry Baryshkov wrote:
>>> MDSS and GPU drivers use different approaches to get min_acc length.
>>> Add helper function that can be used by all the drivers.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>>  include/linux/soc/qcom/ubwc.h | 7 +++++++
>>>  1 file changed, 7 insertions(+)
>>>
>>> diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
>>> index f052e241736c..50d891493ac8 100644
>>> --- a/include/linux/soc/qcom/ubwc.h
>>> +++ b/include/linux/soc/qcom/ubwc.h
>>> @@ -74,4 +74,11 @@ static inline bool qcom_ubwc_get_ubwc_mode(const struct qcom_ubwc_cfg_data *cfg)
>>>  	return ret;
>>>  }
>>>  
>>> +static inline bool qcom_ubwc_min_acc_length_64b(const struct qcom_ubwc_cfg_data *cfg)
>>> +{
>>> +	return cfg->ubwc_enc_version == UBWC_1_0 &&
>>> +		(cfg->ubwc_dec_version == UBWC_2_0 ||
>>> +		 cfg->ubwc_dec_version == UBWC_3_0);
>>
>> Are you sure this is a correct heuristic?
> 
> No, but it matches what we had in MDSS driver (and I think it matches
> the chipsets that were selected by the GPU driver).

Should we keep a comment that this is a best guess that worked out so
far?

Konrad

