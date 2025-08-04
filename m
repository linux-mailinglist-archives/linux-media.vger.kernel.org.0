Return-Path: <linux-media+bounces-38854-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF4EB1A313
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 15:17:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 955CB1886415
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 13:17:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3C34261595;
	Mon,  4 Aug 2025 13:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bFFm/K5l"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315A21FBEB9
	for <linux-media@vger.kernel.org>; Mon,  4 Aug 2025 13:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754313429; cv=none; b=cpfZ9u5dxBH5oDJG4jYbfeGpTPK1zdk5IO3U6X0TO89z0CLI2XAecy2CiJlFiQKQeZiDnanHRYicQbds15y6x1RBMvcWC+hnUv6YCd2zs1THSWc+fl7WGEcV/mtuJjBLAoAnDH2JJlyPebL3q+Um8Y6MLT+C4Jn9Eca6Dh9KoPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754313429; c=relaxed/simple;
	bh=LGF57M35rgadv8iq9N20lyYQI6dPzqa4pdKZimyhlbs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DO/et3uJbBRkoxCdrBbSMksEQo4hFdLPQzux6E/kWn96+H+IlIgjC1OD9SLej3329EMAYP8IxUUdnd6lURYAXTPGSSSA2NqmK+tOcIEmeamELnqEEMgrSdsY4C5cyaNeeK0mr8srJVuonGbEsg4256sKdxcqxlEnjl84XoUNoI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bFFm/K5l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5748kdAo004552
	for <linux-media@vger.kernel.org>; Mon, 4 Aug 2025 13:17:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wgXRWKdb8/uIkJlxKRlTEuKqEVXG1EaXlBO5d+CRj9c=; b=bFFm/K5lguhDneyS
	WrB0qC9uZnJMCyoyyTzA6D60uGTmBFWV6+ajaDsBYc1M+qeI0hVynRSaVyh8d0HP
	vwUnwNppc377sTEXgSpfUHt03B8qogqY6JbmEouNYZ7fHWrEBd0/gfNw8xSD/prH
	fWYh3kkIGXJxh4p0najhgLrQ/FqojwQwsRctULet+Dj22D296Hxn2OC3IurXQxWr
	yJL/48cqWZoEUdKxG93HmQv9sUkTj8/LIA9wJqBtIHt6TYLpEiZYUT1oNkGz8Zgq
	5IiC9Po82NlTrbgZdOvfdi1ahcQYSoQC0njdkx/BQgF3u/mzPzx22uEuXmiJYxSq
	pgMJMA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489bek51kd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 04 Aug 2025 13:16:40 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4af23052fb8so2380901cf.0
        for <linux-media@vger.kernel.org>; Mon, 04 Aug 2025 06:16:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754313399; x=1754918199;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wgXRWKdb8/uIkJlxKRlTEuKqEVXG1EaXlBO5d+CRj9c=;
        b=L7Nb83Trw7rAu0Pp1Z2kBUYR2uiJEwjkMpQKL/TBikB0ioSAdWM1EnMAD4ollkpmUn
         sFYG1rolfhlPMczh5aMxXHhOyQls6R9NTOm2y6bglA8ptCWS5EyW/zM6TCyRuZIq0yhB
         IR+7DD+MITO9wEnayX5C+jsZY4uoTEH/WCrCCuPEkOh0r2XxtCENRAnBMlSWaTg6YD7+
         dc1Ur9vfuzGf3ifoXYqrSXRF9/HSljvCIjYLNqoOxDJL2yZoytEAlCKJSYG0D15zCQRs
         EkAW2kxZh8ZX+yMJRzRCwllOmGHyl3yuQjJxMwCdNVv3Ssrv6bmnoV3WPro2CD91v1mF
         V6XA==
X-Forwarded-Encrypted: i=1; AJvYcCV59afLBYvvwUsfqhOuGIvP9nzS9htF5F/d0PZ0ibhv6xp3xCqzXVZBytIgzEyOpE1+YNcE5Ob1a0TWPw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEISpA8v7WpoV8+/wz39jgVfgTVURWIwm9W/3ItjbaHGHzpqux
	JBM5IlEdQv2S0KoVD1nf6iK9FSK50nhohKogNArkffQFlNERteTQsT57xg9idmxgto3K6MfWbEp
	jK8TBdBBjZpOSsCzZl0j6VK0g6+OaergClNUTtrAKrM04sqwQg0g4KP6k09UY8HvaEA==
X-Gm-Gg: ASbGncuc3J/N/Y7Nt5b2cJy2bn9zFeM2rwRoN3+dfWyLKRONZ+8GPPMhDn9r3O4JPsq
	xUb84+5GTCuZpEeMAK/T+Vq9HjCaPee6s5SetBRQT8J08R4OVSiLrTUXsAiVTv3x9UwZoA9T9tD
	a9Yt5R7R+AeYAbgap5xd9xXkNxf8/P3hu45VO3nfgxToLHD6Z8S03/sOcLc9U+KQDXMIx8yietn
	4XBVyti1z/zFwHFFtOclVQVG44iUGWPl78t1IVMtvL8QzpB+oTMEZDR/k7mS68VPYKDaqFuRep/
	iVbLqro8InLqAvuiVVgBBEmqzOxrJwJfuf+CHkWul8so2ym5W1vCPDywLC4+ShPYixQd3RAOyM8
	T6+E4rHe4iFBP0w1TTQ==
X-Received: by 2002:a05:622a:1211:b0:475:1c59:1748 with SMTP id d75a77b69052e-4af10aa56d2mr63735511cf.11.1754313399517;
        Mon, 04 Aug 2025 06:16:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFf7yZ8n4Kn22sR5Uevb5Blz+Ts3PocLhzk4Ya+jFjCOhrB42Tx4xCPXD1tnN8w3MczWz9xng==
X-Received: by 2002:a05:622a:1211:b0:475:1c59:1748 with SMTP id d75a77b69052e-4af10aa56d2mr63734971cf.11.1754313398788;
        Mon, 04 Aug 2025 06:16:38 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8fe82a7sm6859797a12.30.2025.08.04.06.16.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Aug 2025 06:16:38 -0700 (PDT)
Message-ID: <095ab6dd-9b0d-4f58-872a-852c5f19818c@oss.qualcomm.com>
Date: Mon, 4 Aug 2025 15:16:35 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] soc: qcom: mdt_loader: Remove pas id parameter
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
References: <20250804-mdtloader-changes-v1-0-5e74629a2241@oss.qualcomm.com>
 <20250804-mdtloader-changes-v1-2-5e74629a2241@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250804-mdtloader-changes-v1-2-5e74629a2241@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=M7tNKzws c=1 sm=1 tr=0 ts=6890b2d3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=IDvrs2r2PCma8_SM7s4A:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDA3MyBTYWx0ZWRfXydpEGaMoNo0M
 Xwx64YRZvFfKA1ivaUDnxfrEyyuhKrt3GnBgF9HX8kKZ1QkmLpNONZR6oJ8eoF/e+bB5NWhu+t7
 ipkge9nZ+sXE4FrzgIBnrno4O9WtaEPRPq7h0rXg9TbFksyfEhi+Q1vWyOdLF5juR0RvaKKNMNJ
 LrFBWrHCRmkRcETOmDkR5c4+Dz447YCu427CxRfUM5gU/YUfnj6OYcIy9eR3w5q/WB8NND79k8O
 XFYq2Oxz6rKzajarRHikc2Ov3UQRhjN5KkTyUt5gOTCdW94sfUL8LLzdyUMgg8Z4ZX3wZotUpLv
 rUY28/k+DxllISrOYELJVPvmPQtbCvfFLNBVfogMLWvTXRQgs2xl3+rIqfFs7d5rJRtFxbPu2Sx
 2T6CN9Pmwe8wPayE9873npxq0KghGQp44QJ1aAQ+uybRxsx6GdNDQV0HTtDO6L4DiOtVJBfW
X-Proofpoint-ORIG-GUID: uysSOv7rzNq6LsKhZfH7-9sdlUc2sZSy
X-Proofpoint-GUID: uysSOv7rzNq6LsKhZfH7-9sdlUc2sZSy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_05,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0
 suspectscore=0 phishscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508040073

On 8/4/25 2:41 PM, Mukesh Ojha wrote:
> pas id is not used in qcom_mdt_load_no_init() and it should not
> be used as it is non-PAS specific function and has no relation
> to PAS specific mechanism.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

[...]

> -static bool qcom_mdt_bins_are_split(const struct firmware *fw, const char *fw_name)
> +static bool qcom_mdt_bins_are_split(const struct firmware *fw)

This seems unrelated (or at least unmentioned)

Konrad

