Return-Path: <linux-media+bounces-55672-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YIFhEu8DtGnjfQAAu9opvQ
	(envelope-from <linux-media+bounces-55672-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 13:32:47 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBA628309C
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 13:32:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AF0DE303A3F4
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 12:32:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51E89397687;
	Fri, 13 Mar 2026 12:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JkxRwMPD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fGd94D1X"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18FF2396588
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 12:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773405103; cv=none; b=DJwvQ6kKXjEKsfahJmRGoZRWThWDU4skncqu8Z+K44irMWM39ztZ4QLdK+PHdCcGOCwxqygmVu3i5PhBLG/ZcMEjzTZG4yUZrIxa0vVsSyQQ23zXQ13fWD+Bb2pancEjmSaApAQLHVGd55QNTjU4jdsLg3p0gjLC1vmJPz1/SSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773405103; c=relaxed/simple;
	bh=8Ry2ynb+KiDywGGrzqZU68G1uv5eiQWYIw5qNed/54E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nOndJ6Nno6O2B40sK+fHyepS1zsAn81CQ10PWD3wqodChrsoCneBJdbjxosRjpesuNrYd9urt/Wf6PMXwjMb4pJpX0odpno/nYHUiAnP8R4GW+f0ZVot0EsH34nqn+DZB3TDYdzPGloSoDFy1p9pedRnrRK388a5Wc9oLh19Pok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JkxRwMPD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fGd94D1X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D9Tqsx1499093
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 12:31:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3PwyZkGlsHck9FR5zvi65O/ZN6g4iz4HcJAeyFJ0uu4=; b=JkxRwMPDj1Wx1qJL
	XRRrxPpmchMpJBhGmQundROj4xY9HjdpCj5g5TuvfC85plqHShZHGf8X4q9Nlzkp
	RHR8eqSqbfcr0K6HueXLLhCrq+4llCwfijV9Fsk0jN0q/biIeBYD//UNqqCFRICD
	2P+VIF34e3Lq6D6U8QF85vfXgA+eXM9DLrXQ1cklYS7AnW/1uNAr/JtfsBAkEafb
	kNffXk26Zj9YvlJF0gyvTDYeHzce/r32Mtfb9IxPuBhSxoKjW2mpKqsZJximNA35
	FIFe+c8rTv8jV3VmEnYIWc3uRLNDS3FcazxD4Xr4qLE7epr0/vxNCusDcPaW8Xj/
	278s4w==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvg0hghfp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 12:31:40 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6000a7ab3e5so254499137.2
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 05:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773405100; x=1774009900; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3PwyZkGlsHck9FR5zvi65O/ZN6g4iz4HcJAeyFJ0uu4=;
        b=fGd94D1XhZC52y8FxQ+6kS9oPbNSJz8XjhGkezZ+iPFJwGA3WaVFwl/y7YXnHoaD/a
         0HiaBpuFY2UMDjEH84za2t9jKnHfKSJ+Rxz6kLu8C9UDVaiy41aXBV4AZiiusUnM/Sky
         7kt4Ow2ruGsntVLcJ5KcWP69Zt2cUXiA5bBAq4HmsVluhBYaCJ4cuJb5ONxgN6Kgsz6P
         4MbhDd+IS/Uq/Yn3jk9h7FkWiDbHnO61Hu+AJmfXw+2IBCjyoxLNTGIaCJ75zhOIrgxs
         uG6GnYkdb15op4hQXLjEZlZgh3tZD3+xZcAkvkfFUQffubG2qm0iz+57l2moRAqpGue1
         wAsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773405100; x=1774009900;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3PwyZkGlsHck9FR5zvi65O/ZN6g4iz4HcJAeyFJ0uu4=;
        b=VIeYWkwCdHtYnXsuSM7bur+LXBWDklBaGX7uJWsDYVWQWZDM9McA9lpDnNCCkAyAR3
         m9TtlABBxep5YiqzOCqNKmXtdAQDduqLHZO1cf2sXMU8d2dB6rigSDRUbtSw+v4ITrmW
         AAYz9wQDvYbSyf2/mcEoFEj5Hs5mM4ZDwtnhf3OBLinD9yqEmhrXeEgf2VYyN6xF5mjl
         C7Bgm5CN8bmGwxDKXgu1z6SByhR9KK1k1XkSFaDh+HplTHWt+Of4ASEvHrS/Wyp3bANz
         uzoYkujzhYy6E9AuLDVHJyqC2VB1TUeWLFq/FciYX6IavFJ7xej75p2M214oRIrka57I
         h4kQ==
X-Gm-Message-State: AOJu0YwaOE8JwGjsb933mXEPoijVjwfrQ74MdB94vyYQQEesTszXL6D6
	jkr+gxsszxLcX5vmLyMlLS1TCibiyWACbJvHBxRrG1r+h8MPvsbGceGTcZEwt4fBV0LXg8puMNP
	vHQGOm8v2sueDm/Y1iJ/4MOCRdLfn7Wdz4q2v/SV+3Xjr8u4dmdPWwSUA0VAxjHcLIw==
X-Gm-Gg: ATEYQzxNJwrvlMEMvq/8sgKRahMlPlDjlJi3f1PqSjY/IsbOn4BARMEN4+i9WpYpN3z
	2EOQRED/BUU65W7CVPYQL/vQPqHXUFxKfbFgfZbJEHuXkGW8ubvdXaShelanUZzWqvS+pysqnTU
	7HSzKMRo42PYuFh6o++2jkbHpGtkiWSgryx6gxrDyDTVVWRg2+9vbfSIS/CbYE7M7WQO0KulOLL
	nBJqypJ1URY2REnHPtG9e8zsL6rTyhF3Zl2M/Z9x+KC0K5aBDv1nFxEY7Jbz7gsISEWw5/w2ecM
	XzyDGPenUbv7Q8kI+B9amj4Nou1J8D8zKHhQoHhc5H5WXbffLa9mqrjoPJsK0i3TDxlvLYEfZlz
	TbHMbFooKJZVoKXdVU1X2JKkgl/1t30CZ8fE2+RoZqwbiw0I6qInJtD1UeuZ1su1ouzu/WH+5xa
	VNi+8=
X-Received: by 2002:a05:6102:4423:b0:5ff:c831:b99f with SMTP id ada2fe7eead31-6020e20fcb6mr601847137.1.1773405100329;
        Fri, 13 Mar 2026 05:31:40 -0700 (PDT)
X-Received: by 2002:a05:6102:4423:b0:5ff:c831:b99f with SMTP id ada2fe7eead31-6020e20fcb6mr601816137.1.1773405099867;
        Fri, 13 Mar 2026 05:31:39 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976d096d4dsm43030166b.64.2026.03.13.05.31.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 05:31:38 -0700 (PDT)
Message-ID: <b924aa1d-c66b-4451-916f-d66735c61958@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 13:31:35 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] arm64: dts: qcom: sc8280xp: Add Iris core
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Johan Hovold <johan+linaro@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260312-iris-sc8280xp-v4-0-a047ef1e3c7d@oss.qualcomm.com>
 <20260312-iris-sc8280xp-v4-3-a047ef1e3c7d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260312-iris-sc8280xp-v4-3-a047ef1e3c7d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=T6eBjvKQ c=1 sm=1 tr=0 ts=69b403ac cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=NfRDy27ELDDfuPPzlmwA:9
 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: v2J7VmDEWLmnkWguWLNGq_1oOwJ9TcGZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA5OSBTYWx0ZWRfXxFnMkO4DzYVh
 mnHam1yfdhLaSnMmVDTkrh+e4N6iNZRo0PGEkbmgI/clVmB8j7SGKqV2ddkA1vYgg5l+SBbqqkx
 SUz6hxXoQHSIHPoTYUO6wsOS01APV9SFSwuWst1PxFXIbPX7rFb+KNxqC42BACIrcKrsOhdmuPo
 Y3SPqUavdOCkyikVv7I8w5OXaunJC82lPmQWYyAcdssTXpArKM9vlNTFOI5sx2ClEus0dGz21YA
 ZdSlP7hhvrmiNAcLb58y9JWtQsLrwfUJtMh8BTPmkPt3SZrrJR/yr6u09w+YIa5flW/SmyMIIAv
 oXpXSnYjYGnOtJ7gKf3SiGrvmiiCwIh7YoKH6nIu+1787Q6akErgrrHQjEv4aDh+Z63js2dwqa+
 VOnwBexdOqYG5cogrn4AOzmClAUbv3PxCcKGuQoX73VWIlPbK2IVrqr0MpCFFI+zYrranhSQSZU
 a78MUn4ABHfUUPST9zQ==
X-Proofpoint-GUID: v2J7VmDEWLmnkWguWLNGq_1oOwJ9TcGZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130099
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55672-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DBBA628309C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/12/26 4:14 PM, Dmitry Baryshkov wrote:
> From: Konrad Dybcio <konradybcio@kernel.org>
> 
> Add the required nodes to enable Iris core on SC8280XP.
> 
> [ bod: added interconnect tags ]
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> [ johan: use sm8350 videocc defines ]
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> [ bod: dropped video encoder/decoder declarations ]
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> [ db: dropped llcc icc, switched to sc8280xp compat, corrected OPP table ]
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---


> +				opp-240000000 {
> +					opp-hz = /bits/ 64 <240000000>;
> +					required-opps = <&rpmhpd_opp_svs>,
> +							<&rpmhpd_opp_low_svs>;
> +				};
> +
> +				opp-338000000 {
> +					opp-hz = /bits/ 64 <338000000>;
> +					required-opps = <&rpmhpd_opp_svs>,
> +							<&rpmhpd_opp_svs>;
> +				};
> +
> +				opp-366000000 {
> +					opp-hz = /bits/ 64 <366000000>;
> +					required-opps = <&rpmhpd_opp_svs_l1>,
> +							<&rpmhpd_opp_svs_l1>;
> +				};
> +
> +				opp-444000000 {
> +					opp-hz = /bits/ 64 <444000000>;
> +					required-opps = <&rpmhpd_opp_svs_l1>,
> +							<&rpmhpd_opp_nom>;

Interesting differences.. but we talked about it last time and
I assume you got to the bottom of it

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

