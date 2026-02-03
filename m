Return-Path: <linux-media+bounces-52092-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLdfE+e6gWm7JAMAu9opvQ
	(envelope-from <linux-media+bounces-52092-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Feb 2026 10:07:51 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C0965D6955
	for <lists+linux-media@lfdr.de>; Tue, 03 Feb 2026 10:07:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4EE4630072A3
	for <lists+linux-media@lfdr.de>; Tue,  3 Feb 2026 09:07:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 676EB396B9A;
	Tue,  3 Feb 2026 09:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nN4n160/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BRyIGOJx"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF17395DB6
	for <linux-media@vger.kernel.org>; Tue,  3 Feb 2026 09:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770109651; cv=none; b=JyKn5dKPLcmjqdAEAZAonI3XxSn7yKL/MjzHb1BjLVgdBdvVEzofpq5Sp2Pbc7pwwVqBkimPdhJmwcvkfJB313QD0iLt9efioSg4VfXLIWsEZAh5y+vgFyGPz1dw24Mf84dDG7FWDMK7oO4GlTpT25l73OH3Ref/J/bBOByoqRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770109651; c=relaxed/simple;
	bh=r7zBYTBwI/33M4f7vzrEMy0LPJOX7EFtuoJ8V6TwbTg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FOWZc51L8N1U3Fe0ivyPS79E3GmDqXFQmTjAJGddDBx5lAQdDIkYn4voTuhkQ4rgfUOuWVqyZwCZI3PBvfL7IsRgoiMtJunQe5Q9BFjtXY8O2Qkd8CYtTFfjHmcuSYQJaMNHbTqPcmTlbXgo7gVY3au/3BJJpfL61JnOXkgJv+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nN4n160/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BRyIGOJx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6138nm87848291
	for <linux-media@vger.kernel.org>; Tue, 3 Feb 2026 09:07:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dowN0l8PG5L77f+jBzl88Eb1rukCALYcJhjeDvDYXuA=; b=nN4n160/dKBL0mzT
	LZOmEfDBC9mI5s+KCqHbYy7k9Ud8OGnovFfAeQVQuoofwILVToCBFkb6Bw1kcnpG
	mLwNq0bbvtTs1hEjRd84gmWsj0wzOKOTzW+qT23b5+1cBYlxW+zk8M/7xKC2SNDt
	1naPjJFy2R/6cyHe9/JzmciMLdH/3ktuRmOBqRhvZUHXDg4oIr/Xe+E1tmZphRnn
	bLRN1ssjO4LJR5LPkX7rf8PTH9+CPwULLU1bvyMC9lN/bU7WNEfv252eJlEX8IFp
	tmSE2iXvAGa0oQnXup9Mnd8ZP6zPH07u9BOkXXIBwkajlFQC8Ka1uJ2mug3xZv4/
	9p3MOQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3dutg1uk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 03 Feb 2026 09:07:29 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34cc88eca7eso5556451a91.2
        for <linux-media@vger.kernel.org>; Tue, 03 Feb 2026 01:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770109648; x=1770714448; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dowN0l8PG5L77f+jBzl88Eb1rukCALYcJhjeDvDYXuA=;
        b=BRyIGOJxODAr1Qds28i2KJ8BNZVL3s57bGDf1AEkcloQxweMcTYWgNL0/gnpUt2pYj
         5uP7Vkf4Q/Nl+QGuVniUx3GPtvvyaEzguYNR1hNu0moUA48D0tnL1QN+sE7eeFc3iDJ1
         MpdYshADh7rtRlTGRe75nQpmGCkGKBxJ/Nn3hxsYchNpoVA5IlMnXeMXOUE5yAzjZkrZ
         0DM2hDzmr5EB0QquvKJI2sxYO5JDudqPMhiT2vzaaHFrO2jagPB0d+6swRStKFzAuxzp
         v3UmkrZ0rn0ZRbAHnX4IA29s3log6fvhMNSFhlmMSuK26ppG+PFx5BW++Ah/SR1LT4nT
         0kuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770109648; x=1770714448;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dowN0l8PG5L77f+jBzl88Eb1rukCALYcJhjeDvDYXuA=;
        b=MM8LZM6fpoPANcH/SqhOyBFNmJvbK+ZWARwmiuJWSUtbJUzP1TEUMck5dWkCWJf1Sf
         hKIA/MjnLR1SNMkIItLM3Z2SmB6EGw+iaICBOjma01CFsA2ACYLZv5OW+2RiRrhdPlIA
         VcEYC20nIPNJajzFVeumgSfnXVhC9BrrzTTlFshdY8iWW+ZhFCUFVPIlXpUywFgcoSRs
         DOBhE4EoL59ARIc/WBzMWMsttkQvFyglg+U9YfNIVKghZ2pjUcaLFE+m/IGs73Ma7lc8
         msrbY762sSdYHWIlqLYqlKFVMFNjmydcz/I/UXDv60NCi7+VmW/VbjRqnRvaQGJ9UQ3k
         T6mQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpcJoZauP6nn6tZU3UBrXi/vfjLla1h3J7Q/XLoNh/2rHIX6PjyCnRQf2ETY/s+117wwxQvp5IdvTfLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzngS2EYqAcf695VKcuJdCQVU5AT7CJb6NZOYyvaR6s/tZKovC8
	BXQTnDMdUoHmLT48zaBAOIe2JAxlcrk9kwvC7EY0L6N6X3mxYa50rVbhhXYv+dioCeEiEM9B/jB
	aGSqf3PExvs3QUWcXLLRtXWgnCARWMk7Jkzn33MEIBuT4x8mb7ZlU+IyeUnvN2TtjsA==
X-Gm-Gg: AZuq6aLbWX3Z1coAtJYiI7O0NtvrUxuP4Pca94Ac9ai92c9nND+5SvC/8zoV5+CeteZ
	n1hMtSfyyKEkWZl9vskz6YLD7YQDk/jqKwKt2LQEsIwa0EOdXu7DAS7bRUuAJhKB65z23sjFJ5m
	ozdwldc/p8le8TQqy3y9/NJ2QhDmiTbxss7Svm71vVPmWfKwDbMhwJwNF0Wn6Ek/PoiE5AJW4Q+
	zjpcmE6s/5jOMc8fSBwoeK7f+bM3y/4LeEXGRIZjs7lqEuSKlrb7nLej9gMMsa1+fHqAHjpCMAF
	YFltu19OEx/Fo68joObHs2OrbfLE9rGY4H6Pk62RB0E3laTMxJB8F+p8eo8NMrr/fUp9qQuot+h
	mSK4Egt8CpvAmLXeIJMn/YkqCZOUQtQ4kha8lKCqN7qYR
X-Received: by 2002:a17:902:b949:b0:2a8:7827:bb32 with SMTP id d9443c01a7336-2a8d96a17c3mr95174945ad.15.1770109648061;
        Tue, 03 Feb 2026 01:07:28 -0800 (PST)
X-Received: by 2002:a17:902:b949:b0:2a8:7827:bb32 with SMTP id d9443c01a7336-2a8d96a17c3mr95174665ad.15.1770109647553;
        Tue, 03 Feb 2026 01:07:27 -0800 (PST)
Received: from [10.206.109.90] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b414071sm160847725ad.29.2026.02.03.01.07.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 01:07:27 -0800 (PST)
Message-ID: <95d2ad4e-082d-b399-3a35-99fd6a3e78c1@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 14:37:16 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 7/8] arm64: dts: qcom: sort out Iris power domains
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>, Jonathan Marek <jonathan@marek.ca>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260201-iris-venus-fix-sm8250-v2-0-6f40d2605c89@oss.qualcomm.com>
 <20260201-iris-venus-fix-sm8250-v2-7-6f40d2605c89@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260201-iris-venus-fix-sm8250-v2-7-6f40d2605c89@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA3MiBTYWx0ZWRfX6/MVJvzaLG4I
 In0zfQWisxIQyNmHCZpMz/VFHhVHN2WFnZm8xUJzXM4NMS9ZfA8KTVIYmfwlDOkZiKg18AXtxXa
 nafZO5TBs4nCcPKhR00YsNwgFL2f95caW5otKhUfHbQ5CgC7bjbVUYZ3dfHn3iGGGkBLXZlwxZa
 dEUshddTD3k4bBHwjotcunFTY34gvgazBN3dlULiZS+ihXoD6wy6G6tV8x9DpIBCG3ChSKIhTld
 2T8BesqYZ11y1txWJwU/vfWnnVCt7mGsRiuDbLngZcf8+JuvoWKMNctOQA2zqY2O2o9sG6MjcCP
 bVSO+a9cBKP9ROCx3OKtTJpTDu4OYDDbQxa2FdmlGp++V0DmTfEg4xQJj3xqIzK0DBOOCdGGadL
 OzxpNUjjSr3FhUqWFAsoduDRPySOEfUebHt83S6TDKqa4vuTUaiaNpcOiBISNfIDM4fC+Wv+Atu
 sz3iyeWvUJp+zcp7hKw==
X-Authority-Analysis: v=2.4 cv=FrgIPmrq c=1 sm=1 tr=0 ts=6981bad1 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KaDJ12nNnFZpivlZOL4A:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: R8m6mCf23zh08OqqHBhJpzrnqAqkwrmO
X-Proofpoint-GUID: R8m6mCf23zh08OqqHBhJpzrnqAqkwrmO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_02,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602030072
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52092-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,aa00000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C0965D6955
X-Rspamd-Action: no action



On 2/1/2026 4:19 PM, Dmitry Baryshkov wrote:
> On SM8250 Iris core requires two power rails to function, MX (for PLLs)
> and MMCX (for everything else). The commit fa245b3f06cd ("arm64: dts:
> qcom: sm8250: Add venus DT node") added only MX power rail, but,
> strangely enough, using MMCX voltage levels.
> 
> Add MMCX domain together with the (more correct) MX OPP levels.
> 
> Fixes: fa245b3f06cd ("arm64: dts: qcom: sm8250: Add venus DT node")
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index 980d6e894b9d..531470506809 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -4321,8 +4321,12 @@ venus: video-codec@aa00000 {
>  			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
>  			power-domains = <&videocc MVS0C_GDSC>,
>  					<&videocc MVS0_GDSC>,
> -					<&rpmhpd RPMHPD_MX>;
> -			power-domain-names = "venus", "vcodec0", "mx";
> +					<&rpmhpd RPMHPD_MX>,
> +					<&rpmhpd RPMHPD_MMCX>;
> +			power-domain-names = "venus",
> +					     "vcodec0",
> +					     "mx",
> +					     "mmcx";
>  			operating-points-v2 = <&venus_opp_table>;
>  
>  			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
> @@ -4348,22 +4352,26 @@ venus_opp_table: opp-table {
>  
>  				opp-720000000 {
>  					opp-hz = /bits/ 64 <720000000>;
> -					required-opps = <&rpmhpd_opp_low_svs>;
> +					required-opps = <&rpmhpd_opp_low_svs>,

should be rpmhpd_opp_svs for MX for PLL to get voted to 720000000.

> +							<&rpmhpd_opp_low_svs>;
>  				};
>  
>  				opp-1014000000 {
>  					opp-hz = /bits/ 64 <1014000000>;
> -					required-opps = <&rpmhpd_opp_svs>;
> +					required-opps = <&rpmhpd_opp_low_svs>,

should be rpmhpd_opp_svs for MX

> +							<&rpmhpd_opp_svs>;
>  				};
>  
>  				opp-1098000000 {
>  					opp-hz = /bits/ 64 <1098000000>;
> -					required-opps = <&rpmhpd_opp_svs_l1>;
> +					required-opps = <&rpmhpd_opp_svs>,

should be rpmhpd_opp_svs_l1 for MX, SVS can only go upto 1066.

> +							<&rpmhpd_opp_svs_l1>;
>  				};
>  
>  				opp-1332000000 {
>  					opp-hz = /bits/ 64 <1332000000>;
> -					required-opps = <&rpmhpd_opp_nom>;
> +					required-opps = <&rpmhpd_opp_svs>,

should be rpmhpd_opp_svs_l1 for MX, which can go upto 1500.

Thanks,
Dikshita
> +							<&rpmhpd_opp_nom>;
>  				};
>  			};
>  		};
> 

