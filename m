Return-Path: <linux-media+bounces-54107-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AAXqBie6pWmoFQAAu9opvQ
	(envelope-from <linux-media+bounces-54107-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 17:26:15 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8784D1DCC27
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 17:26:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5D95B30498E4
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2026 16:19:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D76E4014A7;
	Mon,  2 Mar 2026 16:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N4Z9U6Pn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IWGpTkY8"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529BB30B53E
	for <linux-media@vger.kernel.org>; Mon,  2 Mar 2026 16:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772468353; cv=none; b=pOelsX4sjsCct2zA4n5b4mkhvG9HoYrpOZA9xDNOvStuW8ELBCCphDWy5cZyVi4uzcAfoRv30GK0MC+8l0VcNAqhSIP3JA/6ZKNmTjGn8RsVz4nobEBJv/ucGdFYHEYYSaM5ihVxvsMqjpLtgYYcrszNQzmL3/6g60AXoZOqW1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772468353; c=relaxed/simple;
	bh=sYvyd0Zm5Ga2JIOjj5miURFzXTnvIdotwsCvsCSNo8Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JuHk77vfHs5MN3oljHQcIr0EJoSLU3pwIuPGiB6ykRKsX9Ml5zVY65o7GP1a0PpWJIEZTQ2tZPExj2HDhYQZRnQTjD8p/LO3n6FZz4kmrjZXlY5KC2+t627HF7/II6f2wB1uLohciYFv6+U1iRg6745PWXHoRUtgvIEGVHulHL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N4Z9U6Pn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IWGpTkY8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 622G3kLR3753600
	for <linux-media@vger.kernel.org>; Mon, 2 Mar 2026 16:19:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vhjju8BOnGn4NgWCoflGT14vT5s6pSmdtD5C3RVGsmI=; b=N4Z9U6PnJAiI+Oc4
	Cr1dp0Twmmqj2RQn7Ja6QIgvgMnaM7cCtExRrbjIMbBQoOWHieUFJJOGdXvtUJD6
	Xx8hRmOvawnN30Wty/0IZpaajVBdc0TGDoagW9pXCcPJ8xGZpsR3iSSrf/HuvgGP
	eBK7DdF8LbFJDGQFjPf9o3Q7riwPac7uhu2vQns4UMTjJ9pgtLcCdawYYF+R5N9q
	13d7eRK+yZ+kKG4II9b62zlv89BNXCYMhWDJCWgDswz37VvcsKTEOaFFE64kBlri
	jGHUvA324UiEYZl2fSkHsH/c11+4nchSiFWFNk2U0MnLA9kaGrtAOKiCBZ2EZ322
	STYfBg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7kq9gek-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Mar 2026 16:19:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb38346fdbso430418785a.0
        for <linux-media@vger.kernel.org>; Mon, 02 Mar 2026 08:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772468347; x=1773073147; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vhjju8BOnGn4NgWCoflGT14vT5s6pSmdtD5C3RVGsmI=;
        b=IWGpTkY8r0Xxd8wieMvwQrOrMXhVzlavSkj3D3fVzeum8m8RM66awRlXCRzaIslQWF
         g/aOWGgcQ4TTL2h1tFe5UdQJ9aAbBI39U752wwRRt1+tO1InU1hE0eqr2e4rURX3rMag
         fBGnUdL6gOV1r+Gptwm1L+KAe9IjOwwL3dZkn5s8QV7tuYRIRD9h2kV3yhrCtO96Y4F/
         DIxL9mig1ZoU9DD1JfiQlMoKUQn01w1ABGJAhn3gO2Lv2Mcs9uR6JObNCpFIhd9BnY7/
         H93Szhc59AlDlA+LH98auzk+FsGnan+hfIMUC3ygxSG9eT9e97BzIjTTknGcF5aZOlvR
         aMBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772468347; x=1773073147;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vhjju8BOnGn4NgWCoflGT14vT5s6pSmdtD5C3RVGsmI=;
        b=oHFip3iVrz8daOXsIliMJtc7XOb+ULiC0WydpxBXhU4IeqCA5IXw0Gm30qoMRB5yVy
         HV1YOwicyk/hZTRP/Oj0XnYHVwz5RHkFqa2epQXu9sWe+Kw3DW32M9LntdXM382bYIUe
         XBSPjIjjNQQUZWt3GfAb512qRNyUaS4sl10cVHNt7tWtpnUVQBT1WRJi2klr9jNk8yIr
         XJ2MS30XJ4mijXiE48J65mgQS3B3Zdk32e4NY6M/OV8ugj2gyYDSFY/emh/Z5hiBmKs8
         xkXTQgTM/osc7o6lvoVIyCw2DCNo6kb/4z6AphG8ifzA0SjSOUnyINHaBxWNfTlU7Iv+
         B9Lw==
X-Forwarded-Encrypted: i=1; AJvYcCUD4JSCTUx4Js0aYfXOZDVMyY+3scCQvfuRZELQOaxfhq37HCE3n3D4xwkGogO2gNbXWJLqI2pglPmMhA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh1lq2Y/IrQwVnuBXJVFHsRdODbX5NevTG5nWpOyVupepccwvE
	yysvBCrptZGhEQu/OIdZPW5TvbWDQVMUOl+QjzxYw+c5WlMGMExJqnH9occPMUi5wgkzCe1iLPw
	41vqHkDKIBkcpAsBg15Ka9vS2FoctR2T6c5BbYK7i8XBZy7HlZp+mi2DmBTSJIh69EQ==
X-Gm-Gg: ATEYQzwsuy4f8jDOZzZjMRzNMVIxodkNqq4fdB5+nSYCuCObjGlPiKA+KGUbE+MjMyV
	SBVcJZAq2iK1pccyAEJaipZrdvw5tk8kB1S37V/skN8wNc3wALzBVMpIIEsX6Y0w27aodJFWa0e
	zWwkOgD5d4w4KwANnrwpHswtat8yCCk3E+/rfxgKmsdkSdTYItAYhTk2NVihqjELVTzprpeu56u
	5xmipD1PRMfz1QOb3Q73Xo7ujFICFMnIxHV6TpgmPJ396d7HEmxpApXiloxZHoRbHgTsQEVM0ba
	S65Fd+O92QEqDkP43ijiCFu9whBqlQf51fUeM7erd1kuakmwkNFoe7aYtUfJ+LaNkyV7PzH17tO
	IVW5pr2zLc4QbV+y9EnT4u/Wmx/dyngv5MSFMu/cbGYZ8nT4bVjVLkCLEQO5zfiPiRLVS1n2zTr
	5eoqc=
X-Received: by 2002:a05:620a:d8a:b0:8b2:e177:fb18 with SMTP id af79cd13be357-8cbc8f5c8afmr1174065485a.9.1772468347113;
        Mon, 02 Mar 2026 08:19:07 -0800 (PST)
X-Received: by 2002:a05:620a:d8a:b0:8b2:e177:fb18 with SMTP id af79cd13be357-8cbc8f5c8afmr1174060985a.9.1772468346539;
        Mon, 02 Mar 2026 08:19:06 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65fabd36224sm3743718a12.7.2026.03.02.08.19.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 08:19:05 -0800 (PST)
Message-ID: <4fab8e64-8251-4424-974c-19434ee04c76@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 17:19:02 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 08/18] arm64: dts: qcom: x1e80100: Add CAMCC block
 definition
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
 <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-8-95517393bcb2@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-8-95517393bcb2@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: XDb3FnEY-hez3YX9eh0__vx5eeV4LrAa
X-Proofpoint-GUID: XDb3FnEY-hez3YX9eh0__vx5eeV4LrAa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEzNSBTYWx0ZWRfX4jCxN0uojn37
 ntqnKaw7TTMYuQrFPBitGVnS1Ej9G02TN5sXz+7PuP39EXym7/OUOf2rSelaj9SNww9kZMZnHg6
 FZfkgPMQ+70GrpJD2OhtITIVA3+JyZwIVnAjt91Y1K7IIvvvhccWgN3LPWTIxtnMK+GLwIscPpm
 m4vWiFAaiIHt/BA/PL5+mqIiNTuOQcTb69aOn27vI2186MT9mZx5gSI5PGBtApTG/+2BrLpSF/s
 ZYBtDLlcQc8+I3pK08mnaJ7ekLRw00maLzlQ8mtBsSCFmKEN4rlDqnGK+eeKHHOlJXbasKi7GET
 /sEd/q1NZKOzym3rbBEG1n0Fqs8fttIJVkyIVm65QEEelk5Ly3H8zyn3oXyROcw/a365chRgduh
 1lrVcPm8EVKt/vNQ/aL/M1z3+efA5FtJAy7xwuH9Cu9bhqRIPJp/OFE+edA7iWbrufVy4MeiUCv
 ZIQA/4eElYQbAjpI3cQ==
X-Authority-Analysis: v=2.4 cv=GLkF0+NK c=1 sm=1 tr=0 ts=69a5b87c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=72T5t8mROkFztkF13RwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020135
X-Rspamd-Queue-Id: 8784D1DCC27
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54107-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aaf0000:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,linaro.org:email,ade0000:email,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,baylibre.com,gmail.com,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 2/25/26 4:11 PM, Bryan O'Donoghue wrote:
> Add the CAMCC block for x1e80100. The x1e80100 CAMCC block is an iteration
> of previous CAMCC blocks with the exception of having two required
> power-domains not just one.
> 
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> index db65c392e6189..f96411f481305 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> @@ -6,6 +6,7 @@
>  #include <dt-bindings/clock/qcom,rpmh.h>
>  #include <dt-bindings/clock/qcom,sc8280xp-lpasscc.h>
>  #include <dt-bindings/clock/qcom,sm8450-videocc.h>
> +#include <dt-bindings/clock/qcom,x1e80100-camcc.h>
>  #include <dt-bindings/clock/qcom,x1e80100-dispcc.h>
>  #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
>  #include <dt-bindings/clock/qcom,x1e80100-gpucc.h>
> @@ -5464,6 +5465,23 @@ videocc: clock-controller@aaf0000 {
>  			#power-domain-cells = <1>;
>  		};
>  
> +
> +		camcc: clock-controller@ade0000 {
> +			compatible = "qcom,x1e80100-camcc";
> +			reg = <0 0x0ade0000 0 0x20000>;
> +			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
> +				 <&bi_tcxo_div2>,
> +				 <&bi_tcxo_ao_div2>,
> +				 <&sleep_clk>;
> +			power-domains = <&rpmhpd RPMHPD_MXC>,
> +					<&rpmhpd RPMHPD_MMCX>;
> +			required-opps = <&rpmhpd_opp_low_svs>,
> +					<&rpmhpd_opp_low_svs>;

Taniya, in light of the recent discoveries on other platforms, does x1
need a performance vote on MXA here?

Konrad

