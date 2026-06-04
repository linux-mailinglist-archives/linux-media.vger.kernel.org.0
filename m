Return-Path: <linux-media+bounces-63748-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Q7TFHTcYIWp//AAAu9opvQ
	(envelope-from <linux-media+bounces-63748-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 08:16:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BEF63D338
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 08:16:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=L9ogwoOp;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Npfe7pq1;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63748-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-63748-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C67BC302FCFB
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 06:16:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 662393D5677;
	Thu,  4 Jun 2026 06:16:22 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2313B0AC3
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 06:16:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780553781; cv=none; b=XIePnhUsA3db0M33SDE5toPnvEzQXKmSpau8f0A8hXsfoyoZL0HMkHcyp4/OW/IWc8iZoZl9ZbDuFOMArn4OOh0ZN8RN/rsO0aCRoGxfPMJXDYAUQQXXkc5R8g/rd++hTF6FqTtO89ONTOallPkmVjhe3MA/apU4NNOEzTQfFdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780553781; c=relaxed/simple;
	bh=LAo1gykKBlyc6hrnwCyTN9ZSW8quXPMknkJE2Y7GFkE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=pz2ouimpndq4Duk9SwCMOIyZzQ4e9Ju7mq7JDu0a/n4U4RRs+JOIjSLXwOdQzAgA1UsICjmY1nZMiW6xQjvrld94HUc7B5qflrU+Hrc0sBV2326sFvCIhs0LcTNZ2esUBQy2vCdlc65Box7orZ/b3SnKPgGOK2qJD1YK1sEI5v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L9ogwoOp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Npfe7pq1; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653LfFsc3241567
	for <linux-media@vger.kernel.org>; Thu, 4 Jun 2026 06:16:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PltNnGhhKDeL8iIccExfCGRq7JR/z+5HhaWbWWSvhQE=; b=L9ogwoOp8II6c7CR
	yvh2QDGdz75nuBt+xCtGVQ+KwA9amMfAh5ie9HO04IHljwQgLvI6Ag/pWR9GUhVw
	S20I99jltULEusGAaFqCPLarQyPYk/h+GXIZRcM7YDaZqCZAY9G1bkPzbZLhypNH
	UtyAEzYK5E8JKo/jyJY8mJWFLPhmo99tAx3+HD3S3dnnMXNIZ/l8x5UH05FVUKzu
	GpvOlKH6srt5Driy7iQc/CgBUVeSC/m4zD+A4grdAYQ4/7px44NmiHBTqngVcdVp
	4m2S+s5uAQpclDgHz1zUDG+xq+sBC9hc3Lsex6s8bbE5tcZC+K0aZFATSodPf1P0
	erA95Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejvd09ey9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 04 Jun 2026 06:16:18 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36b934a336eso277143a91.2
        for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 23:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780553777; x=1781158577; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PltNnGhhKDeL8iIccExfCGRq7JR/z+5HhaWbWWSvhQE=;
        b=Npfe7pq12N0TPd+UCJRGnCAeGuaD2xnqLPeZ9eDWf49crQQ9qGxwpzcffZSXlLMDwY
         f5lUdhYk/UYWDrvzj06OWPFvgQI1KyASVyjRyQVzPh7vSYe6y9wuFUKVcMDFNUw99pFh
         0hEBp41thP1cexGgwq9Mv6AVBD4IraYl6pMO9z7PHnw8pMd2pEbIrhiMuJpvJrkKfv2S
         2MBc8h3YoFhLuZS6Se6Yt2LTFln5KvdnhBE4zUq6miVSM1CK+XnAI27gOOgL2n2BWaYr
         dWJ8l0caj2D5SGV28pkeqf562Kehiif9AH0GvC1tcKci6BMqYutlNshL6+I5Pdp8aDNq
         Lh9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780553777; x=1781158577;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PltNnGhhKDeL8iIccExfCGRq7JR/z+5HhaWbWWSvhQE=;
        b=rO2dBCJoFBbJJDPfDl+tJF/Yf7qn3flXR1uIVsCoOe49o0Lc31XdcJz43j8duuF8MV
         R9tYVQyJ6lsPAGLU7ZNZFV2MrDp9sc4IjF8SWMf4kwgcUvSrOYGBO6g0N24x27jjlMpp
         gePT5RZJl4Q5lvnVSStQYyrzBNMDz7C4I7F6hV9zxFI2WlBLPtgJ70Ps9zqWEX6hTRw9
         IHfNSVAHS9QR7GMhMadsb0QzebQhid/0eqPs7yxuyR3/qOZ7Y8UTz6Vf7ro0TvmjKQLP
         mb0sEc831TPehQdtlSLje3JGzUkvgjRXlO/P63cVAjGs3u4emqL/uAS/NLPF9kWm+2D4
         eLfA==
X-Forwarded-Encrypted: i=1; AFNElJ/iHCDCECO69415OZXNy9SQhiQ274yeScxJcprFnL3NrTxMOVrVdyBehc1yhXnetp+e51JgBqIGRDnSRw==@vger.kernel.org
X-Gm-Message-State: AOJu0YysYiDTY3KNUE61onTl/uA2q5hmsWlxuyHIKXpJMa3S9gCsuLKM
	OvkeOftS0hTOrRpqto37Y1/NLoURrb0NmdDYSnnU72Ue0i7cezBcNIsgSJGQ/KL4F4YQFqUe8Lv
	bt1H8ayxGa3PoH+oqR339ISnFgC9q0G3AtIizvgPkwfbDY10046LsUF2VeBS14uSyrw==
X-Gm-Gg: Acq92OGidOtKw7WVkaVkDSPLtppOsoSUcBH+0WuUgv0NKyATEvnSRJP0H8GIsMljFjN
	OOpYmGnb6aHrNaqc3qJd2iQUpZb0MOnqM8rkpneoI6SJqCXqsyd5DXuGWNsuMvOd+t3pco8csFM
	zyqueBOyIBj2MiTCJKD+8HO02txiA5snutZdIPeDlOpaOiffdvuey1t4ScSSrB42/K8L+BE+2WF
	7MGPoIONoIhlCEUqThJHyvXrQ1L1nx25RLOnxZVAFpathJWoNA+HrvDSwKu5ppmuRcrVxJ2G7hO
	80g9KAYPt9acx7lhuLkQ/gcMvtQZVMVNsgvEu/E7ZiQYV/gtLVaXP0sW/v/WcMizIAabW61QkpI
	SDYK6ZzpnMoZnBGJqMc722IbM+GvYLsPi4+5BFsvau+/kS32/ulMGyOZPSdT9lk8q
X-Received: by 2002:a17:90b:28c6:b0:36b:8baa:a683 with SMTP id 98e67ed59e1d1-36e32a430b2mr6139764a91.19.1780553777530;
        Wed, 03 Jun 2026 23:16:17 -0700 (PDT)
X-Received: by 2002:a17:90b:28c6:b0:36b:8baa:a683 with SMTP id 98e67ed59e1d1-36e32a430b2mr6139735a91.19.1780553777056;
        Wed, 03 Jun 2026 23:16:17 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6bf827e6sm2477908a91.1.2026.06.03.23.16.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 23:16:16 -0700 (PDT)
Message-ID: <a8fcf4fd-3237-389c-8552-addfc2a97dbc@oss.qualcomm.com>
Date: Thu, 4 Jun 2026 11:46:09 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/4] media: dt-bindings: qcom,qcm2290-venus: add Venus
 on SM6115
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260515-iris-sm6115-v2-0-2ab75229de61@oss.qualcomm.com>
 <20260515-iris-sm6115-v2-2-2ab75229de61@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260515-iris-sm6115-v2-2-2ab75229de61@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: SlImscWzHS49oDtwcbUDE0QTvFunKyJX
X-Authority-Analysis: v=2.4 cv=M8h97Sws c=1 sm=1 tr=0 ts=6a211832 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=mmEirQiFKNK8A5MC6IkA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: SlImscWzHS49oDtwcbUDE0QTvFunKyJX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA1OCBTYWx0ZWRfX6/uUcvRz6k0C
 nE7OL1Uc5AhjDgSNxCk+KHg4lx8yFmQGF61fsRf01mHaxH3OVdzlI7PJJvRdkKzniR1z1kYcJRB
 62oDxyCrKZZmhJa8QrB3ublDwkjKZKJbAJ7UwjzVe2D+GsziGg06Nd/pfJEszBeOxP47sln98io
 uVOgD7pmdbXl9iCDESgaYQRWS3xBnmvG7VlJ/WFYCOW2tlBFgSTgO95NE/gXW32JXieBWi8hcwx
 cmzXqRz0R7PRfbMERLSKnCmZBR5byslOCX6JdPuquncSiJ50/5mEufxADoyAHt287hpv8m6/2gi
 NAyERV6Rz82LOIeCz4RqESWTDvwgPneEoXcjGQfKpGOHW28ElYOZZcEfkwehM+1BrOcG+hq6y60
 izYmjZVMPuNmP0HN5CcU2A9nBYl8Y+RvNGTYSSzv4UteRXNgTUIRVOly0RadJpmhU1maAW/4ZrB
 vI8Mm6+nJngg2ecQJtg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040058
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63748-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:bod@kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jorge.ramirez@oss.qualcomm.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 57BEF63D338


On 5/15/2026 5:29 PM, Dmitry Baryshkov wrote:
> The Qualcomm SM6115 platform contains the AR50_Lite core similar to the
> one found on the QCM2290. Define new platform-specific compatible, while
> using QCM2290 as a fallback.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> index 7e6dc410c2d2..ab4c56ee9182 100644
> --- a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> @@ -18,7 +18,11 @@ allOf:
>  
>  properties:
>    compatible:
> -    const: qcom,qcm2290-venus
> +    oneOf:
> +      - items:
> +        - const: qcom,sm6115-venus
> +        - const: qcom,qcm2290-venus
> +      - const: qcom,qcm2290-venus
>  
>    power-domains:
>      maxItems: 3

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>


