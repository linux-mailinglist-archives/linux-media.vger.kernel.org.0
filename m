Return-Path: <linux-media+bounces-31487-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5CEAA5753
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 23:31:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6E0CA02C79
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 21:30:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D49C92C10B9;
	Wed, 30 Apr 2025 21:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QJPJgwlV"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F742C0326
	for <linux-media@vger.kernel.org>; Wed, 30 Apr 2025 21:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746048316; cv=none; b=YRLbk/i7zk0xeZh9nrNjD01Xe37B0YkLfnvH53eVyw8rmkxaLNzbE4xfcRBTd8Xj8cjsq5bgSUQh7VliRM/g3OUnjdupiRKBGEBDmrkkpvg+4c7D5Luck7lrBZi2UjcCy7AfbYpF8tTJ2k3aArQAH2VM5p0bfvcCg0Qw1XCjaWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746048316; c=relaxed/simple;
	bh=dN1cAvoLWwLBli6XPD0KhvWowefo93B8nN1x80lziSw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tf/ILpaGpMmeOF5F1PM5g1hGSiYqnYFZW51ixKFO++CTpFvGPLRIxWznUsvaZ/Ld4UDkFMF2cBKZkWj8ZSZ4/+K7c5IHJYa/pOglL+ylFtzyacabSgXRINqNjaUySCNFEMKUPZ2kns0p/qIvAHLyPnBW2dqo4EG+5Kpy6qynexc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QJPJgwlV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53UHRT48002823
	for <linux-media@vger.kernel.org>; Wed, 30 Apr 2025 21:25:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mQ2jnVjO+FK8esFBQJwoX/TVGF2G9VDZcRv8QsM8cuI=; b=QJPJgwlV93pGUs9v
	sAjS5WdfHkEBtc4wZnlFhJ8rI3NZnNeAsP9G0N/ZDnk1L+ta0bCD5YfXVuYsJKFv
	hyNOpYNVgs7nWObCBcTdGVwUE83KBr0xIT06H8QSAJoCh8giSpY8nDnL5Sq/L4Vl
	3VwiFeTbTs956Jv/gMA2qHFFt/F6GdeNsPOEr9D1HbH1ZkrfLywBE1btp2BMmyNt
	uNVbNHLzTp9GbPLEPHd7VEMhtfx6P/cvgmQ0zzJq602M3rv6oD7cF0LsYXd4fqGx
	7Vd9GtO1wi0TDf2XEzatDbspFo9u0oDscDtRW/FdQEm0+jXdExCshExrPzBgR8y3
	aPWlAw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u9umw8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 30 Apr 2025 21:25:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5ad42d6bcso4023885a.2
        for <linux-media@vger.kernel.org>; Wed, 30 Apr 2025 14:25:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746048312; x=1746653112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mQ2jnVjO+FK8esFBQJwoX/TVGF2G9VDZcRv8QsM8cuI=;
        b=aIMpdkMLAUGJOsAWN5voQWSmbb540TuQrVIj0puI3UhTZAhWVGvbWgw6YDh86Y4y/2
         coQf6fKOf8kmA603lIrpWx0UIwp2RveT6OjvyFQjnK1sU3Xidik3KXQeMAKIu0RPzQPT
         ESE9KNwHW+Y6+eEsqrQEZXLGU831gJBEm7kq6o0Vw9FQ+scPZWljyO52ZtKBR0zqBfc4
         lZ4Pohf0YsXiBb/BNuR34s474d4QQxvgWGavwnqhHBBC5SYn6BPteRBSKzPZhEET3akx
         47Z4/YxpXV6Zvr4WRHK+ZmFT8HNBU/fZ90ohbUXndlEjz/bJNP89Q6yyhqgH423C7NBc
         SvMw==
X-Gm-Message-State: AOJu0YzzzblnrX1KhA30rxXGAJboZdiZub3LNAE4pBy8YUVFN1t+DyEF
	qk3ZW/EQI2j60V1fT8gYKRsmRIKitmEA/POVuhoDIDwNgAJmdX/GxU4XJG7uIIXivIFbQW9oaRD
	dWzAZ/xK31esQ9gfX2MiW5zKj/92YQzyZbcY+warVGPdA6QhzK8kfobkFMlYCsw==
X-Gm-Gg: ASbGncskG3axgM464vfpn97pHrD2lETgSbO8lfRj2UHm0kHG+Fe34vyRI61DCjPV/Af
	FMqyCviEOr+lmpg2SF3wLZdL8zEZx0slVy1RoZAe/gGiOuHe/J5V+QzGk12FadRsNDZ48CvJDRd
	Yc8Q0pGJrHMEnhvbVJFw9FqEJ5kM8YB8fbUyNyStRg9iUaJi8CEEoBECJdGXPNR4mKl3wOHN4Kh
	7CJyjGZKWgGxHiXIUpTfMqkavC9H2DuL/oy+nrOZIrsrqpO82OrfHU7xprPAdvomsYkopzWeFPb
	Byx8i00+h3ulyeGN1O+QqhxK7bVSfqXq740GJppO5+c559qy7TRIx3Tb/2E4VrXMlt0=
X-Received: by 2002:a05:620a:d81:b0:7c3:bcb2:f450 with SMTP id af79cd13be357-7cacc1be6a3mr110658585a.15.1746048312427;
        Wed, 30 Apr 2025 14:25:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHno9xC01KtHTcmyiEyJau4nN1jUTcCXOPCTlNFj1PnUJfKhzAvD4jmrGjvb47znNHqT2g5uA==
X-Received: by 2002:a05:620a:d81:b0:7c3:bcb2:f450 with SMTP id af79cd13be357-7cacc1be6a3mr110655985a.15.1746048312015;
        Wed, 30 Apr 2025 14:25:12 -0700 (PDT)
Received: from [192.168.65.132] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acebe215210sm396837966b.68.2025.04.30.14.25.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 14:25:11 -0700 (PDT)
Message-ID: <a5db4897-44d7-4e79-89a8-0db35d49913a@oss.qualcomm.com>
Date: Wed, 30 Apr 2025 23:25:09 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/5] arm64: dts: qcom: qcs8300: add video node
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250501-qcs8300_iris-v7-0-b229d5347990@quicinc.com>
 <20250501-qcs8300_iris-v7-4-b229d5347990@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250501-qcs8300_iris-v7-4-b229d5347990@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7nliHrMUtK_iqx7rhlqOyk5p4qEnDLIs
X-Proofpoint-ORIG-GUID: 7nliHrMUtK_iqx7rhlqOyk5p4qEnDLIs
X-Authority-Analysis: v=2.4 cv=UZZRSLSN c=1 sm=1 tr=0 ts=68129539 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=AFtjm6BWk6c1pdSQgKUA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDE1NyBTYWx0ZWRfX3iPeirXj5PcC LjcWoGhDiMOqCVIIGGetY1EYSfuzNf3S4odxnXcUZKwcT7/9RHPXW/nCZiwDXpZULo+VIgyNTSs oFJk1xFiItoDRxRTG97I7aFqYDGyhPzYu9QvApg8wlFCwRtjLBdPZcyFUSZpkpPianBN3eNXHSF
 Esy4y3EUj3zL8qjZPgeur9jAf7DjxUhC9JDmNZtnNUg1MXlEbE9U4s19+DGXUE7YhtNZYZKrTa8 a/m7BoeOZp9wwrMLzrtFKNl5WKC6eraBTWiFVjmptD3pQKDmD7EGAN155qfaa/TytaXksXK4JNr 2+5Ip+DmUxlqSpLbXzz/hNLEgcFqB0Wl2FnheUGc8aCpw9EVUYqWAeHQ33GGBXW53vkE4esOzeu
 yEs/Ii1XqmkB6/Itesa3oH2pgHa2ramcHskjt5wqt0qOFF7Pd6nJdY5IGSmNl1Q/QH75RtBD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 mlxlogscore=806 spamscore=0 priorityscore=1501 impostorscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300157

On 4/30/25 10:46 PM, Vikash Garodia wrote:
> Add the IRIS video-codec node on QCS8300 platform to support video
> functionality.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

