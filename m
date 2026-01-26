Return-Path: <linux-media+bounces-51534-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNdNFZ87d2mMdQEAu9opvQ
	(envelope-from <linux-media+bounces-51534-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 11:02:07 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0A5865C7
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 11:02:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B12D301F323
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 10:00:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FACA32AAD0;
	Mon, 26 Jan 2026 10:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cCBEKBAi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ej4gTfxf"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC7D32E12D
	for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 10:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769421632; cv=none; b=ev6mJ0azDnA+BSXpENmcwTasxWU0hdoTuV1b5STkmQgtm5KO2XmWOKtSIRUY7BJPWPc+pMK7uR6uHbGosb5fGqB9wx2vA+M3VHLcAxLWcmPUTyKIQ/66aZ8JcGrEcbiohIe/yCxQV6OY+4wO7OJNMZEVkOFbIbjokDNegPUPdEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769421632; c=relaxed/simple;
	bh=0nx8zUDWkK9WrQ3HjuMSpxEdNZinAHVQoSH+iyhLpws=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RRiMexTLcEI9Hw2WS70dpM0CWxGszkTeZjnHC1bbYqY9mpWaF7iewu+jpzDnsLEMSIxJ3TR8MUPi6MNXCaC57CzB6ZRvP0x/ykciUUIJkqe+drSB9eF79AU8lNln0ieSW1HCodFEiKlxwM20Gc5HBDZJQ9ZLJOI7iyTI/jAhU0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cCBEKBAi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ej4gTfxf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60Q96G3m480840
	for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 10:00:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z2NcQNiRQpQSmkaW1sS83QhtWA//oCEj7r8nYuk+mDs=; b=cCBEKBAiAM9UYNh+
	bwXW90fzwGCbzbdjXsedo1MtwV40rM0/CY8MEZ38ARuMRKLI9fE/cd6N1MVryEM9
	llGLPxCLduW0JaiQKtH+pKE+C7i8ouMphTBD1YicvnofiBK/c/Uy45qEIjF66nin
	kvngx7NQs5VyH41j6QNJjL+MWEr/9U3p4GlnLr5IKPIkitpdiHR4r3jR9QpUzvxl
	qzS1SWEhEedPvW3XDq+fKwvb7IQDfa3zp8jjDqs6GUTbGqox+LdZcCLHlchWgMIr
	VlhAobO5QU8ibSKP4nUAKoqvHbJRm8KnyIORflU4EL0sRHR598hpOAPI6T2AjfZr
	1sO6lw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq6uv4me-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 10:00:30 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-894a207e7cdso5216996d6.1
        for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 02:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769421630; x=1770026430; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z2NcQNiRQpQSmkaW1sS83QhtWA//oCEj7r8nYuk+mDs=;
        b=ej4gTfxf08DCr/XUHW5XkfK6NSuIFPmZuYRB17M8KPv/8SG7b6vssoJBn6YmAvqw1M
         DUE7trrCr7BZo6DQfbwnLgEKzILNl0vAZdgHfRVr+sGYApRUkA8Cxo88YvtrauGxvavC
         4xrd2fu5MCb49hrkIE7GStrRDnXeBxNrXlIjCliPq6QzNPFrjkG3qxdYES+/sTuDjyBt
         KzzSgNUnw7ASVsQQI7Z+V60CBdZSlyL2RZ5V3kwj0rUC3lH48vyBkxfwOox58dpioNC0
         FhKjC31d+Ib2igE5M6/jPACeFBKdLutxrisBwA3+G7+wOUu0gd49wVB4xbUKk7JkCeh9
         y4uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769421630; x=1770026430;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z2NcQNiRQpQSmkaW1sS83QhtWA//oCEj7r8nYuk+mDs=;
        b=kRFxcOugxBW/suIuT0MaCjW9IHwr9YrzBTQn9JclGFQnHGfweVuwoy9GNuHhO3xzLP
         ippyprmexbTmklPXBJ+73TUoiaWYHdnZhRxmcAKYHtRfkuaQMJnaDOmiKg3Y0eMpXLQK
         RdNqQZxaUTT/ppuNdGDsGaBtRJUh7NuNcvDCUZKednHIgK9ZWC4oIZKZiD/rpu2j2ilr
         SAfCc2pDeiOZVjn6v8kjei9tuouIo9CUXi8oRe/HZNSwaH7CwfKkZux1nptDJbSP8yi+
         qTmFTMRhiiDTKPRpXEDJhTxirN3u4MLKIz9SK5/RhORufnnHU8oSRnZA/RzjprqO4yGX
         MVxg==
X-Gm-Message-State: AOJu0YxfjPXkJUEA2uxym6mhmibe9cfhvEahkeiXaOVncDTtT+pLNBBX
	4MTHTSgtGHD6nkHeEp5gHA/MkJKpxjG9JK+tcCjxHkzN8nWWe+0TGTOp7mWtRyGL0/v8eT1tU02
	9vxTapGw3s7uAo98FadPqgBx5b5g3bNPxI0HY0JRKxpNwKGvi9EJijQAqGyUMiNHl7g==
X-Gm-Gg: AZuq6aKTJXAUxoxMlFJFX0u1z6TRCqlZGgqtf8HOu2tCjxl6YCvvqvP05XckHtOW8Gh
	u0ia90NBm1BPM2yNupkwOJhKq8F41movOSG/30mHGEHAWcAuJNW5hl9Lwx6EwZMQwUbmdlcUKda
	syrnmAuTer95yoOdunUrtKOv9HELjs39iBkj7kgx5WA7eiTj+7CzbAsjqh+B6RTLy0fZuATqy9Q
	VAAtsktvkahTJfQmP8rqnMEXAAJr11eN7NHyagt5z8lAWGZGOPBlsvDudVFZdF4pjXC6jZM5vlF
	puPm3KkvgiDBHVUvr3QNt7DRdr8HB3HbvN+iBzokKYEELWo3X4qgOIEKZvItAdV8gMKEAF3h/EJ
	GSUDUvacQp2YrO3FIP4uEv09MzSrwOxxYl7mp+G3t5RHvJgbETvPTpAR/vydCFpGY+2U=
X-Received: by 2002:a05:6214:3303:b0:889:e38c:d13a with SMTP id 6a1803df08f44-894b07941dfmr34993716d6.5.1769421629524;
        Mon, 26 Jan 2026 02:00:29 -0800 (PST)
X-Received: by 2002:a05:6214:3303:b0:889:e38c:d13a with SMTP id 6a1803df08f44-894b07941dfmr34993366d6.5.1769421629019;
        Mon, 26 Jan 2026 02:00:29 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385da1a6c87sm27374691fa.36.2026.01.26.02.00.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 02:00:28 -0800 (PST)
Message-ID: <136bf12f-cead-4485-b689-af780c937e2d@oss.qualcomm.com>
Date: Mon, 26 Jan 2026 11:00:25 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] arm64: dts: qcom: sc8280xp: Add Venus
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
        David Heidelberg <david@ixit.cz>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Johan Hovold <johan+linaro@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260125-iris-sc8280xp-v3-0-d21861a9ea33@oss.qualcomm.com>
 <20260125-iris-sc8280xp-v3-4-d21861a9ea33@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260125-iris-sc8280xp-v3-4-d21861a9ea33@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDA4NSBTYWx0ZWRfX6fs6s+NyTtX9
 H1qbEMOvpbXNcU2sJUfurY4KAcIhOQVezboLXn00DFL1nBS7CYj+5OxNnMAA0AqGHl2k3XzE3wv
 ZvYdoVQHrZfrHWBFmP1gFlCph879oUPIPeVg1LoQoUlDPlre49RLOo+tgpgBLFtsps3IVQLCsRj
 Yj3Vr5kdnlgHmJwcQU5ByT/927E+YtWhuTy+6zKwWHrRnfywT8XcoKLN0zSy05v//6iJroqvCHg
 XcITTSv2YBikg1g/Thy9q7VyyTwYPmvOhDW6iZ8nMotdIzw8lSiyZx8AcqyF/1dQou6NsqiNfC2
 rVRdhZNxsoCYchMNBeKTvJkUrcYU/++u5hFYjFHqYAl9Vw5eVQ3uyBSRJBsqSswsFU1OkuG6mr2
 y2HCHeF+6aQfn8vGkScugkAwlbdb+wYwG9o3heLayIUpcSu8cDj/yM1rGhSfjV6QoiHj2fLOEcm
 amT0Xc0RmbQzdsGoqxQ==
X-Authority-Analysis: v=2.4 cv=UqRu9uwB c=1 sm=1 tr=0 ts=69773b3e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=q7sET-JBz6qvjIJve7kA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: y_UvTMmXdCbjTaNugVRQK5MBB0gMZiSY
X-Proofpoint-GUID: y_UvTMmXdCbjTaNugVRQK5MBB0gMZiSY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601260085
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51534-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,linaro.org:email,abf0000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EA0A5865C7
X-Rspamd-Action: no action

On 1/25/26 4:33 PM, Dmitry Baryshkov wrote:
> From: Konrad Dybcio <konradybcio@kernel.org>
> 
> Add the required nodes to enable Venus on sc8280xp.
> 
> [ bod: added interconnect tags ]
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> [ johan: use sm8350 videocc defines ]
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> [ bod: dropped video encoder/decoder declarations ]
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> [ db: dropped llcc icc, switched to sc8280xp compat, added more freqs ]
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

[...]

> +			venus_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-720000000 {
> +					opp-hz = /bits/ 64 <720000000>;

You need to div3 all of these, otherwise this LOW_SVS OPP
will actually apply a more-than-TURBO_L1-requiring frequency..

[...]
> +		videocc: clock-controller@abf0000 {
> +			compatible = "qcom,sc8280xp-videocc";
> +			reg = <0 0x0abf0000 0 0x10000>;
> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK_A>,
> +				 <&sleep_clk>;
> +			power-domains = <&rpmhpd SC8280XP_MMCX>;
> +			required-opps = <&rpmhpd_opp_low_svs>;

AFAICS the PLLs will not turn on if *MX* is at < LOWSVS, but they still
need to be scaled 1:1 with MMCX as the freuqency rises, so you need to
wire up 2 power domains to the OPP table

PLL0 supplies core0 (iris) and PLL1 supplies core1 (CVP)

Konrad

