Return-Path: <linux-media+bounces-52226-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MEJMFNU/hGns1wMAu9opvQ
	(envelope-from <linux-media+bounces-52226-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Feb 2026 07:59:33 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B1AEF329
	for <lists+linux-media@lfdr.de>; Thu, 05 Feb 2026 07:59:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EB9A13024199
	for <lists+linux-media@lfdr.de>; Thu,  5 Feb 2026 06:59:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1184D3587DA;
	Thu,  5 Feb 2026 06:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TBigeP3z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZwapX/mO"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5228E34F47D
	for <linux-media@vger.kernel.org>; Thu,  5 Feb 2026 06:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770274736; cv=none; b=UXU3DHFaP+kKSbJ1e8IRbH0r2zLHOFFCW40qmsTbHR4waTxr7aNGSZgGTZFM7Gb6g5fLmpWQ8arDHIjf1Cs6CIrby3yA1qpsVpxL4RhNJwk5KKNxgXMLnfBCf27goeF64O8TaPX7CqpBTLTYo7o8i4d8zgR7hvNmUGNFgnPndnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770274736; c=relaxed/simple;
	bh=OsQd4OJxQCGkeIltL4axA1jAp30tN349xP7T+sKbOro=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FAOsbs5YqjAvEVMZ12C0DBn9BO+nPlcNF9l1cER8mj9tb/MEVGXY/cHqVtcoUnG419ujEsP1KoYu/0stCGWZoPi/lnGA7jmkY31tBgUAdAeLutqjSwEEnQI2zigv8i99NcgO040TWj+fPgAaFIp8pVLPFPuERY4yoUB4yCFN868=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TBigeP3z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZwapX/mO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6153eRjD2105003
	for <linux-media@vger.kernel.org>; Thu, 5 Feb 2026 06:58:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9OILCwQRqxb5lWB8oBCRCwBrY3BXjDnIuW6UlVeYlWE=; b=TBigeP3zNnx5XnAO
	K1k5XLjiMGNq9AWavQPALj4WrwRru2JuiGbv3mP3YVsiDKkCZnUoCwhrlSa3Kq+z
	/EFl4ftsE76iVVAZiLwpXcn+qzbLuhQBbgJgvatbAYlRsx14Jvv0NYBQvcOQE9aZ
	PUiSWJJ5XCukz5mik8RpPqcL14b2kiN1kldPgOWH0wBskA8k0X0Bq1t4i6MTeDrY
	L4cjT1coVUbiq8Ijlj9e2gJPoDMyupM/LarMwLgjzLVCDJHou2TufjGeyluEi8xU
	42d8hEHJ0ZcH0Tj9EpM+Q5o2qhTZ6cUk3tOCsto2giz6ApE/7OhZDdMGntj8nIUL
	27nS0g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c44xjk9wr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 05 Feb 2026 06:58:55 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82317005ee6so413682b3a.0
        for <linux-media@vger.kernel.org>; Wed, 04 Feb 2026 22:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770274734; x=1770879534; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9OILCwQRqxb5lWB8oBCRCwBrY3BXjDnIuW6UlVeYlWE=;
        b=ZwapX/mOirU5dGAMAz/IUyTvWV6EX0qxNdac/oRxn04toofatPHqvj/eXUBS3XK0PH
         L61jDd4AEqVu5tufsbFa6EsRMTL5genGm05SaT5FOnQBDDOVP8VgFN1qyzSOAvwQfMUv
         /ByeWOxBPF3TP1M6y2EpIlMg9Sfsf29fWKgtX3HG9ETJBwz7gVRkV7swpUz8IAGuRyuF
         +nG9nPVCJeBT5FrM5eADEm8O+ZkvWAM1e2Fxe3oh1gZ6LzLQzd/5T0NIdxvrVwNEyu7m
         EQqPVAmRBitL1dwbbaErVTpVd1JkmGappDpDhWi5J3ohALwnvOBwra4/rFaEH4TSPJNp
         eHCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770274734; x=1770879534;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9OILCwQRqxb5lWB8oBCRCwBrY3BXjDnIuW6UlVeYlWE=;
        b=MMcYV1UEpoX8bKHOzFd69OWSBZ3m53e0XnocfEhSG31deQJOVCfJBWq5Jh6YVueXuK
         vzOD+fqwLUXeKQdkzOKlw/uMG192DjlR4O0CzMebJLCS6cUi62lmO5EiHZz3qzD0UbD/
         8FdnhcxVM9ZE0ybzw92PkHJV73+Ws9vlwGXUle8FQ2NUd5x6nljpF8dsMpzHbtSasFDZ
         KuHdodQqxXgureAb/+//tFoI98NeMsVnSXQc8VFncIJNnaOMML45r6yPtDIeeIZWO1o4
         HkrgT29h+q5PveGm7jLjlmCaGbJgmHGys/Vy2UaMtZRsupw1GLcRC/1yqtpZUZMYiS/S
         Lvlw==
X-Forwarded-Encrypted: i=1; AJvYcCVfCiwwIWYU8ldrAHLGZHkZFatARsZMLtX6yNSOuir/XhxYcv9ieKSwf9aIU523kZERMGquO5JWUR9FKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxXCxG1hTBk6y8jG/jEYtmlDjvOHKpdj7h3WQBeQAxTdou3U/0
	8YhlivsfzBj9KVQ66TrxkTUlDksjtl1VvAh66ozDQfEXTLu2hFpqqEJ8HFNd5VQRj+X4GYhwwYz
	d4p/sv6XbkY5cGiLXQDLVOOsu2pZCuY2ctdszo7p6a06oiT5WTTaTfmLZFMkQ0u9VEA==
X-Gm-Gg: AZuq6aK5qKkfO8It5Kc6w+6Wws1aw6KngEUivIyiKkWN5+fgtmyQ+xugIIVi46uhlbc
	nOBxKuOIWNjWjOC1HPh5WzuWWyOxuOhl/kq9epvsOMHO0OuFAG0autFgjulkhet3+qOrKw5MRAW
	vyk2/nMCPJh9riLe8AWL3wUjF9k+CRh6EFvD8kNdTnVbHr9P05UXkRYs5pn0l1Hio4F/cEAPbNL
	egGaiZUPO8hsSqyfYp9WV9AczD7ZKOaolN/Ut4Jkkzx2Dr0BisMhOEcNqT82AiXmtZdtZR+Ecn1
	G5AodUI+UNwgM0RvxVeItCRWBekxRH+6/A3xB3fWIzrJmx8YDZwFzWEP/Y1t/3gh4pRIm1+MjUR
	SG6wBiXGbXx6UIl93snK/B9GJxbORyRbLd66neldDMOAzoA==
X-Received: by 2002:a05:6a00:2d27:b0:821:8ea4:480e with SMTP id d2e1a72fcca58-8241c19cff1mr5281551b3a.10.1770274734022;
        Wed, 04 Feb 2026 22:58:54 -0800 (PST)
X-Received: by 2002:a05:6a00:2d27:b0:821:8ea4:480e with SMTP id d2e1a72fcca58-8241c19cff1mr5281523b3a.10.1770274733498;
        Wed, 04 Feb 2026 22:58:53 -0800 (PST)
Received: from [10.204.101.146] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8241d163865sm5163450b3a.9.2026.02.04.22.58.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 22:58:52 -0800 (PST)
Message-ID: <3209b0f8-618b-8de1-95f3-e1bc533ba933@oss.qualcomm.com>
Date: Thu, 5 Feb 2026 12:28:42 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 6/7] arm64: dts: qcom: sm8250: sort out Iris power
 domains
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
References: <20260204-iris-venus-fix-sm8250-v3-0-70fa68e57f96@oss.qualcomm.com>
 <20260204-iris-venus-fix-sm8250-v3-6-70fa68e57f96@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260204-iris-venus-fix-sm8250-v3-6-70fa68e57f96@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DtpbOW/+ c=1 sm=1 tr=0 ts=69843faf cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KaDJ12nNnFZpivlZOL4A:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: EDiVt-1blQBMa_AFqcSxEcuwNzbL-BzA
X-Proofpoint-ORIG-GUID: EDiVt-1blQBMa_AFqcSxEcuwNzbL-BzA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDA0OCBTYWx0ZWRfX3UG8Rf9rpZl9
 emQ6lXMt/iTxScTHEffUMwOWkyiwXkguYPyNR+8O7y9Ef5gI9FnQ0gJYN+4uR1Gw1SqevMpwwdt
 4VNQV94F530UpMl6K8YqAjJcINZH3eTpzet/XzPOuerxlQIVVKv13j87Q2wLPPJ6i/HPXr3flnf
 4AWvdfaoXsslT2HU1dOOwiCdzd0QKvlCZph/0zFWEF9GSOqIs4EO1Mcbd7Dky6r1mM9NwkyPmMz
 3snamdYVAcDHhnSIW5RBNn8W750k5jh0Rq6uZZVbYcDAC6ibLlW0aZLTqRfe3sdjnf+tPb+//wc
 LHL0FsfoV5PzqT24SKA3Idd2OcXV8gYVEFlPwqlnqG2c9wAEtttCMuP6OOu5uDV6MREgTRb4H4B
 o4mXyZ8S9Np7PLyCELwFu6/smjIP0EPTYJ8EbUDKot3jNswr2DQA+Rze+YP/7lKt7jc2C6hPl2I
 cVEH9I7UVWAR9VecXqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_01,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 phishscore=0 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050048
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52226-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,aa00000:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E0B1AEF329
X-Rspamd-Action: no action



On 2/4/2026 6:29 AM, Dmitry Baryshkov wrote:
> On SM8250 Iris core requires two power rails to function, MX (for PLLs)
> and MMCX (for everything else). The commit fa245b3f06cd ("arm64: dts:
> qcom: sm8250: Add venus DT node") added only MX power rail, but,
> strangely enough, using MMCX voltage levels.
> 
> Add MMCX domain together with the (more correct) MX OPP levels.
> 
> Fixes: fa245b3f06cd ("arm64: dts: qcom: sm8250: Add venus DT node")
> Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index 980d6e894b9d..d8be5c1add1b 100644
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
> +					required-opps = <&rpmhpd_opp_svs>,
> +							<&rpmhpd_opp_low_svs>;
>  				};
>  
>  				opp-1014000000 {
>  					opp-hz = /bits/ 64 <1014000000>;
> -					required-opps = <&rpmhpd_opp_svs>;
> +					required-opps = <&rpmhpd_opp_svs>,
> +							<&rpmhpd_opp_svs>;
>  				};
>  
>  				opp-1098000000 {
>  					opp-hz = /bits/ 64 <1098000000>;
> -					required-opps = <&rpmhpd_opp_svs_l1>;
> +					required-opps = <&rpmhpd_opp_svs_l1>,
> +							<&rpmhpd_opp_svs_l1>;
>  				};
>  
>  				opp-1332000000 {
>  					opp-hz = /bits/ 64 <1332000000>;
> -					required-opps = <&rpmhpd_opp_nom>;
> +					required-opps = <&rpmhpd_opp_svs_l1>,
> +							<&rpmhpd_opp_nom>;
>  				};
>  			};
>  		};
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

