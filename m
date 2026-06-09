Return-Path: <linux-media+bounces-64261-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jICUIPeoJ2o10QIAu9opvQ
	(envelope-from <linux-media+bounces-64261-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 07:47:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 571EC65C894
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 07:47:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=B5VhKDm8;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=MOisqx0z;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64261-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64261-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7586F3024B20
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2026 05:47:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7463A3CE096;
	Tue,  9 Jun 2026 05:47:16 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79E43C9880
	for <linux-media@vger.kernel.org>; Tue,  9 Jun 2026 05:47:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780984035; cv=none; b=Ma+i+wrWMPFu0ZgJsV+12DImZI/obOVQxE9dfx9UgMJlWPvpMxHmRcG0j1biUe2IdIyl5gZRO6TTzLtCEg2qTwHWPwL6lwVJ5WXA+EqWRBzvD6sRQzGmM9bn1awyLghSl+KSToVgPgGCWs1yJiY0zAUeSgeMb1QOf+hE+x9HrsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780984035; c=relaxed/simple;
	bh=so1zBd3nO45nJIzTPGgrERW8Lcd2s/vTZUV+2uG8ilI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QtY3ZoUdR0FkyRbO5s9hzEme3NJ/rpWZn1PH2LUHd9b0R1NuhkCybVyf2RsCZ9NWjQ0c/3TH5c781+fEeJJswewJIFOZdtZh7NAm5vvN1KKNRpvteV5ew1rQDbmyK/2+imjf7xeFiHIoncJSiIPnqCIr9B9VxlCCr94n0ljIrAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B5VhKDm8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MOisqx0z; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6593wp0d1026276
	for <linux-media@vger.kernel.org>; Tue, 9 Jun 2026 05:47:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ngbOWDMjIN8EWkgDlORz4DJk7K8eQHzIas+4rhC1DVU=; b=B5VhKDm87MQusmw9
	aryygQpzC5UfGLdTFQP3AXlVg1nPZ70WRUQuR/xLLxw5/XXUVeWyj9YdVVgN2c3S
	hkAhV1TYrYpyqJ94WIr3k+xcOl0Pa56Ta1CYXrQM5477hX25T54VhOyrcMSKs6+p
	IdaJY9wOKB2meZVgwCUFoRuBFDqrpFJzeGll+wA+Lq1vUbFvzHFTeXRj5UEcm45e
	8fIyEUNf/cg2XfOnNUGP5XRBJ6jd+zMlX1/vJsg9nuUHMgzPsdS5VhTLK+OYGrp9
	NlrEZn97usI6cdIctjyAjeS+i+Ki3YgU2imXk1PWbVgOAoDvalbVwma/KpsIOOUp
	JhrBqg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enunacm31-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 09 Jun 2026 05:47:14 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0c20f7581so55254645ad.0
        for <linux-media@vger.kernel.org>; Mon, 08 Jun 2026 22:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780984034; x=1781588834; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ngbOWDMjIN8EWkgDlORz4DJk7K8eQHzIas+4rhC1DVU=;
        b=MOisqx0zbgzYFbfiwn8kiCqQZFkFR6vgc1+sbmFgVZwdGuynQ6AAAhlDDYJ0zSHWj5
         EPZSCsMqmpk3PQIwonjfY9R8c11xWfwsvQa3rDTBBnYu44oaIFPp/x+JX8lZYYh1wWs8
         VoXqbJJOh8aZiNpepk/dSv5Xy1Gb+MNumPrFBlbIMOwX2XjwIRNxZVa176zsT7wOwznV
         4r0twWf9d4UgQYE7Fr5TxxaYARWSvg1HH9QpW8yHuvx6kw7aHluRK6C+my18OyVZTFED
         ZPbQAKuhsuuXcce5TaJ8D0poW3cHTV70TZ9Qe/DxWckOh8jZ7UUUQmN949UB09I98wg5
         2Dzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780984034; x=1781588834;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ngbOWDMjIN8EWkgDlORz4DJk7K8eQHzIas+4rhC1DVU=;
        b=DMYcGOsxpU0y57f0XW4Oxk7uAlH/5KIPMA0eSDhyzI/6Bdw5K9VyKXIL/M91XGxvEl
         E1sKYfQFwvatjSE1WwGb5GZ7kywIm3GrFAajpyxilltw+oAmAiIvo6jEpSyYKtYg0xP3
         blSLfLf+CBclXbXPVjyGqVRSycImVi/FpJv5x6u/Vek57UKmF12fv3CLvMqZkt2f0Ly9
         wajYCTiDoXpoKn5OKU7jkTjOzqNPAAeOuq4TO8sx3KJ5ZytBuBAEIH854SbIbgUTM+M5
         Z6p/DSe1IMQqG40OmrsG+fgOTf4XPCKPdRJ+Jv8je6O/Ezd3LS4Dh6PnepCHLyybQRl3
         3YEg==
X-Forwarded-Encrypted: i=1; AFNElJ+ih/zmX4JWyJyft/ycg1vYCk2wblEIIKKIZIa1U8oX0wnsWDiYgKdmMBwKqbDp03klOYaPWtxs1PSeEw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzK+uF9zl41a7bPyuZL6g4VzPbCHJDyTEYlsuH1HMgn7wyUblsY
	5qXCoDtGHTCzn9nKPslfgqFtxoVvVVQ21ruBL924OAGm/eqBUu0RhPHTsQlveKeA0WZkU7HZZrA
	yIai/XQr5hHzQ8AUXa4/2SXePym4mMYpnqa+HRUBtpYBziXefjHMbRriuVMl7H7wtTQ==
X-Gm-Gg: Acq92OGvSEvFdlT9gSVQnxtoaoL2thgPtZbhIX6u9Y3BdROMEl0YQAZpqs9pWpxj7GG
	DFr1MnfEoUhCN6K8zh8t6LoxpFv8B6uEjRw+g4luxyOVJdcXlpVOeiRVC1xOZBCW7FnazugC5Ov
	pxwfYkxrHxvd1Z1n6BWMguZyCw/zvieDLZdub+VOQdO1xEi2wXQPmU2XdCDpjjg+hGziCD5iIUq
	+K8/JLhpB28c5GGthS2OqLDsWQ/9R5NF2EePpnRissmT9+UJHoLddQ4EzDGqTJVq2IAAKGqiGY5
	acsU7yuOYM0i5ozyYBuxfvxfg9ocz874S7A+rS/mG6Ip+Q9RivWuzsB03BxAKUPUE7hicV/+ix5
	28oi0eA+GVfgHsK7ZwW7htuNsYLA6bpGSN6gSbQ4JZUEmsAuNRYfLMnaOc1N1nxov
X-Received: by 2002:a17:902:e848:b0:2c0:b6c7:2273 with SMTP id d9443c01a7336-2c1e79e29ebmr222076585ad.3.1780984033346;
        Mon, 08 Jun 2026 22:47:13 -0700 (PDT)
X-Received: by 2002:a17:902:e848:b0:2c0:b6c7:2273 with SMTP id d9443c01a7336-2c1e79e29ebmr222076015ad.3.1780984032810;
        Mon, 08 Jun 2026 22:47:12 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1664950aesm192056405ad.69.2026.06.08.22.47.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 22:47:12 -0700 (PDT)
Message-ID: <44671f38-88d0-55f1-0a54-3997f37c5a60@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 11:17:01 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v7 2/2] arm64: dts: qcom: sm8250: correct frequencies in
 the Iris OPP table
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
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260604-iris-venus-fix-sm8250-v7-0-7bd2f0e5bae8@oss.qualcomm.com>
 <20260604-iris-venus-fix-sm8250-v7-2-7bd2f0e5bae8@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260604-iris-venus-fix-sm8250-v7-2-7bd2f0e5bae8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA1MSBTYWx0ZWRfX5SdcL4CuEqGQ
 uZPPOfTaY/T1FUsCCLV1ZXfzbOA1IRey+rrYYg4n4rqOxvj/AB00+wtJIi0Hzl6mXssj4yh5BqL
 po56E8bnilCKzhhvx33lYfCtLGrqtbkjbPVEH1QIfJ7ANKncoALaGwzNRE5S4g6kR+4StfAG20I
 /4g9leZ2bl+PpL6/FpD5DFj6FG7OEXiORv4hQCay06L3TgFu7JkuJAeN7QwoJs7WXInyr9YkudR
 1PRH3zOON2MhCAcOMlAATHjIft8LswBub+F1dgdJhAb3I9XMkE5hllvxFXOPjz41kcevxPInqyy
 Xg9//177ulK5uS93kkAE4ERWigj+q9gAYCbcYCdNUszWo6OuxuGMp+wUxjhxvdlnJzaDSpXqQyX
 Db/odYURI5n4wD9V6A3NPEyGYfrIpzoXK3kVCiwdsAZxAtCo1dUNP+k4JvYPq7Ak4yCTHU6giI+
 GwMz2OsCNz7LIUALMhQ==
X-Authority-Analysis: v=2.4 cv=RfugzVtv c=1 sm=1 tr=0 ts=6a27a8e2 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=2OYgVc-5B2WHko4x-TYA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: YXR-TaE_QkgmBeekq-K_igYEwPuXLmi4
X-Proofpoint-GUID: YXR-TaE_QkgmBeekq-K_igYEwPuXLmi4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_01,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090051
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64261-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_tdas@quicinc.com,m:jonathan@marek.ca,m:rafael@kernel.org,m:bod@kernel.org,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:mchehab@kernel.org,m:stanimir.varbanov@linaro.org,m:abhinav.kumar@linux.dev,m:hverkuil@kernel.org,m:stefan.schmidt@linaro.org,m:konradybcio@kernel.org,m:bryan.odonoghue@linaro.org,m:dikshita@qti.qualcomm.com,m:ulfh@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-media@vger.kernel.org,m:mchehab+huawei@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,huawei];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 571EC65C894


On 6/4/2026 9:52 PM, Dmitry Baryshkov wrote:
> The OPP table for the Iris core is wrong, it copies the VDD table from
> the downstream kernel, but that table is written for the
> video_cc_mvs0_clk_src, while the upstream uses video_cc_mvs0_clk for OPP
> rate setting (which is clk_src divided by 3). Specify correct
> frequencies in the OPP table.
>
> Fixes: fa245b3f06cd ("arm64: dts: qcom: sm8250: Add venus DT node")
> Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index 6150380795b8..f6044bfaef87 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -4355,26 +4355,26 @@ venus: video-codec@aa00000 {
>  			venus_opp_table: opp-table {
>  				compatible = "operating-points-v2";
>  
> -				opp-720000000 {
> -					opp-hz = /bits/ 64 <720000000>;
> +				opp-240000000 {
> +					opp-hz = /bits/ 64 <240000000>;
>  					required-opps = <&rpmhpd_opp_svs>,
>  							<&rpmhpd_opp_low_svs>;
>  				};
>  
> -				opp-1014000000 {
> -					opp-hz = /bits/ 64 <1014000000>;
> +				opp-338000000 {
> +					opp-hz = /bits/ 64 <338000000>;
>  					required-opps = <&rpmhpd_opp_svs>,
>  							<&rpmhpd_opp_svs>;
>  				};
>  
> -				opp-1098000000 {
> -					opp-hz = /bits/ 64 <1098000000>;
> +				opp-366000000 {
> +					opp-hz = /bits/ 64 <366000000>;
>  					required-opps = <&rpmhpd_opp_svs_l1>,
>  							<&rpmhpd_opp_svs_l1>;
>  				};
>  
> -				opp-1332000000 {
> -					opp-hz = /bits/ 64 <1332000000>;
> +				opp-444000000 {
> +					opp-hz = /bits/ 64 <444000000>;
>  					required-opps = <&rpmhpd_opp_svs_l1>,
>  							<&rpmhpd_opp_nom>;
>  				};

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>


