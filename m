Return-Path: <linux-media+bounces-51843-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mAWNJSmtfGkaOQIAu9opvQ
	(envelope-from <linux-media+bounces-51843-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 14:07:53 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 13607BADFC
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 14:07:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1E9743011046
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 13:07:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 355F2303C87;
	Fri, 30 Jan 2026 13:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nNTiLF2S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BiL2VFDw"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52EFD2C21CC
	for <linux-media@vger.kernel.org>; Fri, 30 Jan 2026 13:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769778467; cv=none; b=jw1V+xW/nueqCEzgBuKOL5inokzETM1RLrc+GLAmmfdG1vA6PblXylDUYayzoHSTNW5enHHpcQN1k8vh2pDRaWFKuUvvsHFMr7yoo2XwLKBd7iZEDlsw5dwo66kqAwtKm048LvHD92UexOm3HES82YPForqCsTKb/cZRgQWiOGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769778467; c=relaxed/simple;
	bh=cZC6zDgi2m+OW7OyGNSJ2fOv4uOkrdjIc+vuM9pgHSo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jL0ic+RJrT9K7yjjV7cVoBZCvmVM4bJvOp3gi0p/jmM5uQ58qnhqwUkR9/RkPJ6aw3ZoUvyfceJeYnh1Qo44QfYp8bDKGe/ZO0UUOUrWEw12j2gcMwqz43xJkZQpXR00ttMGJU3wLM1fBNN7MKAswM0vxe94v7n4G362myvANYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nNTiLF2S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BiL2VFDw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60U7GOt92413155
	for <linux-media@vger.kernel.org>; Fri, 30 Jan 2026 13:07:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YAvf1ivfxjBm5CzWbzwZLiUm2gpK7fQYbiI/A4Pfe/I=; b=nNTiLF2SAKAri9eq
	XDj7JusF37scsUKdhAu/9SG+iEfBM2wIZrbjzAOlThzrj7cyBmP1x6FwFLOGF5nf
	2LXRUnTFqh/nmuuwLRhBTAihBTSJqbXoU33UdLkCYAD2fDnO5idO9UXG71flCOCQ
	a/XZxw5eJrup1U9eEYw/D1z8l9d3llrC31QMtgYymROlqMTSK9Uya6ceFEm8dGoR
	SJ91fTwI1+DLqw9oh96jqGbZWrTUnbCE6N8A0bd+1vGY3Yo99COnorPw68jsuEw1
	mPJrYOUhvzk3BBfDMMiqlbZuBi8L6z9dAiDKLno1aQ0fnYcRRCFzMDQRoOvPLvSS
	UhpPew==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0r41h00x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 30 Jan 2026 13:07:44 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34ec823527eso3447774a91.2
        for <linux-media@vger.kernel.org>; Fri, 30 Jan 2026 05:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769778463; x=1770383263; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YAvf1ivfxjBm5CzWbzwZLiUm2gpK7fQYbiI/A4Pfe/I=;
        b=BiL2VFDw96NtuIAkqw+/6UU2TmH2FaTJ2rVdLo+jGBZJjwrbQDrc4P0H0AHdVT+oBH
         ArrrOnzVngsOCCPiIMxuWQKNQjHCJxmvBHpWlRGuwR4lBmXZgS00x+Fx/+bphyCZsjE1
         gOysV+EN4YBHOdSRcqZi/ZgI2Dn3qg2zZknYBkLB0HyVMlYjBcDjeA9O6+uSLySpb2NP
         JGaBY7rAvl7sB8Rl3hUGDjrep2mCLp7rrmH05TVQqsnX6sL+snwmfeHM1ZcD9KWQaeC3
         8XEJmTR5AYTqAJq1K3jvLuwIsXILbeVuZgN4NgQyISdOvVdsnmYFr2Mg7YrYu26T+Vlt
         aSIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769778463; x=1770383263;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YAvf1ivfxjBm5CzWbzwZLiUm2gpK7fQYbiI/A4Pfe/I=;
        b=Hk6V2ELVJE4GQa8/vB/HTnJ7HvVIfr8qJtUMaiE9m3XxR/BtL1Dwr5gaYzv62KvKR5
         zja2jWFvzeKoSoGf04dMR7zLl+WIzJ7/DzI2NFOB606bqf1YA9GbTcCqonaotWB5KwP9
         v7K5542Y10ERPZ5dMHvf7MT5kSV8hCatex7mOgV2xe7NsvM2np7J3KUSt68p5SCBeXWm
         hMgqRV0/zHExHHpEctMvrKbx4gApNRaMm/SwxIE+JD0+phVoOBuNgrtYC2SOhsiezvkF
         SXLUNwf5/raTkz01zVX+YxDXcwz6J+PyjhNj05msPpHMx3iZq+TdzGYcVgmVgNAi9ZBL
         nGIg==
X-Gm-Message-State: AOJu0YwROgReuNzEDHPL0yuKG8pfi2O+ev0rpQeML/rrUmDeiFF1rqj6
	wYJeZqeOzN5rxmxcw26UfKu2bce3+WaCnF+Src4neBHEEQmvvf4yAdILjln5XS/HSXq1/WdsS8I
	4PA9a7rPQf7UKhZFU5TqpZzFXQeg+oeokvra/NYiWkTYlbOt1JWCOjCwYmKbs/eRPCg==
X-Gm-Gg: AZuq6aLsaHDogPVGe3JjUk3v0y5R32E72PpC7WL9GxJvtdUFQQLfLU5pIvlohBAv0k+
	4sfkUuS/mW4e3IphocjP0zqpcOMFAjEj+EkPO3UmHGezzS/Ouk1VXbhJBLVED5pgxlNCwrkjIo0
	lasUZ+UL763Lqoz06ajG3ZhsJHaqVKyXy2akWcUa6hBgsg/X9xnNqFgiU/7vA4GOuTiIUnxtbJC
	RepyjQnEUmqsCEHzpZ/RffDhlf+5VsGdiwCGTbVL+clfICIyroM7aBi/UwXgape5lbihm7E6oXr
	jBMaA60R1J0h5oToAfrA5sGSnrt8MPLkT28x8ontLMQk1xc6BbuQgDku8YoLSGERDh+NL5eaHX9
	Abehyvsw7/7FU0LyGWUYSJUcrkPR+KN9jsi18yNw=
X-Received: by 2002:a17:90a:fc4d:b0:339:a243:e96d with SMTP id 98e67ed59e1d1-3543b3ba948mr3031153a91.36.1769778463366;
        Fri, 30 Jan 2026 05:07:43 -0800 (PST)
X-Received: by 2002:a17:90a:fc4d:b0:339:a243:e96d with SMTP id 98e67ed59e1d1-3543b3ba948mr3031128a91.36.1769778462870;
        Fri, 30 Jan 2026 05:07:42 -0800 (PST)
Received: from [10.0.0.3] ([106.222.235.0])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-353f6206386sm11413672a91.15.2026.01.30.05.07.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 05:07:42 -0800 (PST)
Message-ID: <abb1429e-6251-4827-f0e6-d4a6e4d9a43e@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 18:37:35 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 7/7] arm64: dts: qcom: sm8350-hdk: enable Venus core
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>
References: <20260125-iris-sc8280xp-v3-0-d21861a9ea33@oss.qualcomm.com>
 <20260125-iris-sc8280xp-v3-7-d21861a9ea33@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260125-iris-sc8280xp-v3-7-d21861a9ea33@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YECgKma4Zsu8b37pbNm9bFLqc7e0q1v0
X-Authority-Analysis: v=2.4 cv=W541lBWk c=1 sm=1 tr=0 ts=697cad20 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=6cH4IgXjao/mkWo6W7aGpA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=8MjNe4RYkUGLIfEj70cA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: YECgKma4Zsu8b37pbNm9bFLqc7e0q1v0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDEwNyBTYWx0ZWRfX2JjrZd+hdAmQ
 odOi7MR9mw9PyVWQSb/41AWl/tXG905Wnj1zN4PoXapvUqTaZrihFV9l4NRHa1yL7hxx/CcUrxJ
 8GSfSGsUXw0IAjmS/TR3HDQihGZqumsg/utskIQ+fjhejzeFYo5pxJEGlxIRhfjOwAp/boeaCPc
 0EGHKAB1wR/Arv2HstfZTcbBwmbYWSMQLjuu0uy12CHK1QeBHzwWwrstLJbmeX1IiZKnM2Oxj7b
 mn8itb9rGQBkSbaG+D6E1Wx+9z1M8Kkct4ntbwJN3pKvlmMPR53kT7o68PiqBWZ79Dclv7YFzqc
 dQhwPjbne0VJRiXLUwzqmrfJumydvIjCXnOlqz3d3siDYUBXq63JucYLJeHrinrF6AaKp8YJxlJ
 m7DUmJYiZr98OHIEYocsBvpJVir0FvkPvxncjukg1qUHgKt1FEH6juvmoQAtrpfY1YUIHn7UrBR
 IesDiD7HK+qk9WXnyGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_01,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300107
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
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51843-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 13607BADFC
X-Rspamd-Action: no action



On 1/25/2026 9:03 PM, Dmitry Baryshkov wrote:
> Enable video en/decoder on the SM8350 HDK board. There is no need to
> specify the firmware as the driver will use the default one, provided by
> the linux-firmware.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> index 5f975d009465..79f024fd47f9 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> @@ -894,6 +894,10 @@ &usb_2_qmpphy {
>  	vdda-pll-supply = <&vreg_l5b_0p88>;
>  };
>  
> +&venus {
> +	status = "okay";
> +};

This should be enabled only after proper testing on the SoC.

Thanks,
Dikshita

> +
>  /* PINCTRL - additions to nodes defined in sm8350.dtsi */
>  
>  &tlmm {
> 

