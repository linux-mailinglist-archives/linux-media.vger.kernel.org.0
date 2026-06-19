Return-Path: <linux-media+bounces-65242-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id x/f/DRzINGpygwYAu9opvQ
	(envelope-from <linux-media+bounces-65242-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 06:39:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 929586A3CF6
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 06:39:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=fxmNR9z0;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WvObQaHU;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65242-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65242-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D0D683083004
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 04:39:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63AA132B117;
	Fri, 19 Jun 2026 04:39:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738B83264C4
	for <linux-media@vger.kernel.org>; Fri, 19 Jun 2026 04:39:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781843947; cv=none; b=FE80WGnqKczElkILx5pW3YVdF/9x6xxeXh2mdrIOpC+HpEUjyh4IYWqmpE1plucn9MBKbgBZa3TvMIAhLAO3G3UnSgEVq62y+X64UzXVNuBGTmH7snJgD5WG/hS9LRCKq0chm+kjelghpTRW245IMnQuNZeRaJHy5sMQQSRAI6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781843947; c=relaxed/simple;
	bh=FQjO08iq/26/OGazDkp6badkB3rcrmNk4JhCePXGmRA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CVapuld6+vbJTxwzMGDluUCgtroISnjq/10JGqxG3EK6HskW10uTocBtbN2IPZiVCNei1B2WyqW8pjC+ztb4cWGkj9bXBNa1aPzYDEVLVrzT7wWIqrnhU8JUdBZHc8hT4Nz7XBtheNYWLx59eJcfdvDc/FnVYhjPusWT9mia/Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fxmNR9z0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WvObQaHU; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65J4aIHo3907760
	for <linux-media@vger.kernel.org>; Fri, 19 Jun 2026 04:39:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3x2awxTOTPboxeibOUVos600OmvxqwMD2rrBfbTZe18=; b=fxmNR9z0mByo5H2V
	/VkhhTD77jUpEaw7ZARwK2JebsCELlQJN/63ePk8mWXnJBF4Eb7FEg9d9LE6tzUF
	1/kvzxgesMSpIbmsqdFgEBWdOXNLpdR+6G20SxYo5seZ4VYfPL5fCHPNmAzi79Qq
	4CQLQI7YghB6fyzLM1NJN7uYsUw0dxO7mTdo2OCtXVOUnivM6nuzIXfJ1qxNdWx4
	oS/9ZcdhNwPRzqA/iDDZuKIwRrr5GxeX03Qw5perBwnW/c5f7P29WZYs4UHHSMys
	sdNoyWkCtKYhlSEh1HteGCFXmYR/6pGaW29Rl6A+RVaI/FcSp7MsZBdFiIi9rCII
	B9AGBg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evm22akbf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 19 Jun 2026 04:39:05 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8423970cb30so1245898b3a.2
        for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 21:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781843944; x=1782448744; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3x2awxTOTPboxeibOUVos600OmvxqwMD2rrBfbTZe18=;
        b=WvObQaHUJ8Q7VwETzaLOCw7ERttRrxU6yvpdMS/WKZoZg9ssGjRjCOfrjp6M4svI4O
         5yyIvfOpDndzjTcUcSiSy4LMZusLtUebwIjTIlzZm/rdxP7Q9i3Uc+WU3+iIp9n0qZgB
         qLeWXsYiRoJKidaYb9hOUK3QTO50jKCqR/c5u2ANCQu0eSybVmCHgLf5VKVe0V+0n7zc
         DWrJwE0iUa+rdMGdfL1bCBOPR7Uu2J5k6nWtawmAbYWRO4t22mxuc97ePawbr2yfVYki
         tROPfn0aZUtTZU97imsROIMd2IW55MrVaRQ6YwbPZcqrx5YLqg1C0I0L2GjoJh3SDTOv
         vOjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781843944; x=1782448744;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3x2awxTOTPboxeibOUVos600OmvxqwMD2rrBfbTZe18=;
        b=MZH8K8lKpLjuSGo9wdA56K5MLbwVwiDpOeb1UAIpkr+tT/cGM0oRaErm4SklbYHMzr
         Xu7vtxDeKLry4pgOBEsa9FV+21HKXKRuOCddO2J9PTVy0YB9zBg8iCvdl6GEZtnbhJnJ
         GTsOUBQ+Han1aEidiZvA57Ef2OeZecQxoFyoXg+ahscjTeT5zvDXOFeQI46HhxS3dPC7
         V2hijRNCsJrBMRfnz+VGkUcZ5hQU1AmNto55Sv2JKbPqzu7bTh2HFppnPFBX6xxpEIUx
         NW5mAU+FE3YVPDUg8S5wdb2EMq7k8zxMGrbvnnLGt9OwowFxJnjh2x6JyNvvZF9Nrogn
         d7AA==
X-Forwarded-Encrypted: i=1; AFNElJ93HRN5csl3jbkhCMDO0DVrP8OSiTROY2NCOf6aaCoU7209hBrc5NsH6wz+aSKZPIsIBJIIwL4pBWu4Gw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLX3l8X3oZ0ZXxrM5Rtnp2SSkymPlQUFWlKIhY79Je0neFYzVB
	zTttWV9LNow1qx/3GfMNMQ8LMon6DxqwLOMjaz/uJRboE3j9BrY83pp/67FjEsA63l1cNlItI8w
	S9JyuKNDkPhe6Up0YezusC6212Kwsem72lUd7SURjrhSmZrDCS5Kdn4OQDGunlaZhPg==
X-Gm-Gg: AfdE7cme6xKM0FQWAD0XD1//KOTCChcAi8OrwjDlXu72mt/lu3iZdgSbMaOnc5vLrFN
	lhHv5yhDLTFwa5qYgFgiMmArZYWZf1SMghaAzxc2F5g6jV3ql2D7a9n6GYWUwQc/FC+d+UD3u8b
	hIU5H7jPuS3XXVdSSoSsRgRK7dqYIz2xG/TBCqZWRkyFXdf+fIxVhogg+K9at0F0DcpQNG+bSve
	sPqgdmj5IswDtBa1ZGa7zqxh/u/pFuD4Swnk54iYa/Mf/OvsP3aO0V4fH8Vkas4UPMo0++Pkylh
	49NcBTFHX4jUhzT+0d/+1BYt/2rUZjsm/6C9XuOxKOqXu1I7K0FXkMZo5h1o7s+DIlXCxqVIknw
	UKGohHYBFVGMNooDAouc28RLFIzmp8+ZgS/sbGyktKFkL
X-Received: by 2002:a05:6a00:2e96:b0:842:4a39:6047 with SMTP id d2e1a72fcca58-845508862damr1981922b3a.29.1781843944444;
        Thu, 18 Jun 2026 21:39:04 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e96:b0:842:4a39:6047 with SMTP id d2e1a72fcca58-845508862damr1981878b3a.29.1781843944001;
        Thu, 18 Jun 2026 21:39:04 -0700 (PDT)
Received: from [192.168.29.100] ([49.43.194.141])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84553829240sm864324b3a.44.2026.06.18.21.38.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 21:39:03 -0700 (PDT)
Message-ID: <c64e8a82-3659-304b-2e9a-fa039d0afc54@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 10:08:54 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: shikra: Add Iris video codec
 node
Content-Language: en-US
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260618-shikra_vpu-v3-0-1a32e26a35a1@oss.qualcomm.com>
 <20260618-shikra_vpu-v3-2-1a32e26a35a1@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260618-shikra_vpu-v3-2-1a32e26a35a1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YN+vDxGx c=1 sm=1 tr=0 ts=6a34c7e9 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=LrD0L7TPytbPiIQqxktYyw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=ofncl5GZK_eaPPRo4moA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: fEl6bIZLajLQ_If65IAN4NYpbkcm897a
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDAzOSBTYWx0ZWRfX0dncpbpUh8h6
 23Tf0z8jw/imHPN5IelAUgbCRvZAu6mWKZdtvfc263GgQqVB31IRMzWshighiwh+gkNz8hsH/DA
 7vE/5B//3wqiAEO70zqh8unsFg3zADA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDAzOSBTYWx0ZWRfXw9c0iPSvPg+0
 RnMpvqMkVx3WyQ+D7LyYXaw36bTQOXWMYwyXzcfEG+IcdGvH4ls1hCdXeaFL4osBjVVdG96qlDI
 gwDp8/1Kgymrhq1scdwmavWZGkeuWIbxIZ+lmW9isjmf/SToA1UGmjr6Hf1+pwbGNiSdaeFhOSe
 zNFhVGoRNg0yUEHhGlZXdu+GRSTeLucXwz20vrTexmOwoLdXHadQXuqOdnmW8ZLzl+4AezeKwxa
 M138VAW1dZBrnvNe77RZ06MvJOYYwpToa3atsl+GxR76HAeP5M3zjP8HZJTIyvulobNGDVY6maO
 /nJ3n61DkVHYQlJTe9qRhrSaEuw3aYzehYfwEttuCRxp/51mlw+DkehQD+wcTgxYkd1FdYeSvm5
 QPwK/VSuuFps2tyw32R46SIKCf7nijJBOY+OgjYJ2LrKUiTpnIQAGx++kMQzHHrhWeaN9hXtp3B
 excsr+1sd4m0RHO1OnA==
X-Proofpoint-ORIG-GUID: fEl6bIZLajLQ_If65IAN4NYpbkcm897a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606190039
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65242-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:bod@kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jorge.ramirez@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 929586A3CF6


On 6/18/2026 4:09 PM, Vikash Garodia wrote:
> Add the Iris video codec device tree node for the Shikra platform.
>
> Shikra reuses the QCM2290-class video hardware and programming model.
> The video node is added to describe the Iris based video decoder
> encoder block, allowing the media driver to probe and initialize
> the hardware.
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 61 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
> index 1ccb0f1419aaa34d32f3c3eaabdb8727a497b501..d8edd14d1f81a49e352f6939d27ea9cf8bb0f019 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -655,6 +655,67 @@ gpucc: clock-controller@5990000 {
>  			#power-domain-cells = <1>;
>  		};
>  
> +		iris: video-codec@5a00000 {
> +			compatible = "qcom,shikra-venus", "qcom,qcm2290-venus";
> +			reg = <0x0 0x5a00000 0x0 0x200000>;
> +			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH 0>;
> +
> +			power-domains = <&gcc GCC_VENUS_GDSC>,
> +					<&gcc GCC_VCODEC0_GDSC>,
> +					<&rpmpd QCM2290_VDDCX>;
> +			power-domain-names = "venus",
> +					     "vcodec0",
> +					     "cx";
> +			operating-points-v2 = <&venus_opp_table>;
> +
> +			clocks = <&gcc GCC_VIDEO_VENUS_CTL_CLK>,
> +				 <&gcc GCC_VIDEO_AHB_CLK>,
> +				 <&gcc GCC_VENUS_CTL_AXI_CLK>,
> +				 <&gcc GCC_VIDEO_THROTTLE_CORE_CLK>,
> +				 <&gcc GCC_VIDEO_VCODEC0_SYS_CLK>,
> +				 <&gcc GCC_VCODEC0_AXI_CLK>;
> +			clock-names = "core",
> +				      "iface",
> +				      "bus",
> +				      "throttle",
> +				      "vcodec0_core",
> +				      "vcodec0_bus";
> +
> +			memory-region = <&video_mem>;
> +			interconnects = <&mmnrt_virt MASTER_VIDEO_P0 RPM_ALWAYS_TAG
> +					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
> +					<&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
> +					 &config_noc SLAVE_VENUS_CFG RPM_ACTIVE_TAG>;
> +			interconnect-names = "video-mem",
> +					     "cpu-cfg";
> +
> +			iommus = <&apps_smmu 0x780 0x0020>;
> +
> +			venus_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-133333333 {
> +					opp-hz = /bits/ 64 <133333333>;
> +					required-opps = <&rpmpd_opp_low_svs>;
> +				};
> +
> +				opp-240000000 {
> +					opp-hz = /bits/ 64 <240000000>;
> +					required-opps = <&rpmpd_opp_svs>;
> +				};
> +
> +				opp-300000000 {
> +					opp-hz = /bits/ 64 <300000000>;
> +					required-opps = <&rpmpd_opp_svs_plus>;
> +				};
> +
> +				opp-384000000 {
> +					opp-hz = /bits/ 64 <384000000>;
> +					required-opps = <&rpmpd_opp_nom>;
> +				};
> +			};
> +		};
> +
>  		dispcc: clock-controller@5f00000 {
>  			compatible = "qcom,shikra-dispcc", "qcom,qcm2290-dispcc";
>  			reg = <0x0 0x05f00000 0x0 0x20000>;

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>


