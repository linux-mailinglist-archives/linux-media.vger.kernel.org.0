Return-Path: <linux-media+bounces-65241-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /qd2M865NGqefgYAu9opvQ
	(envelope-from <linux-media+bounces-65241-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 05:38:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C57F6A3AE7
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 05:38:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YWpHj3Bu;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PBtMyuze;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65241-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65241-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3C963305889C
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 03:38:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 314F2322B8F;
	Fri, 19 Jun 2026 03:38:40 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7C12ECD32
	for <linux-media@vger.kernel.org>; Fri, 19 Jun 2026 03:38:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781840319; cv=none; b=RQRODMemzuSEGeH/O6ZvN2qJbKA5sEzArmig/0u95Qu9CaM46MIT54oX5s+hfQrPwxxWkvlThxNSb3x/KysjgRXpD1+1NA0xhFLo9JoSjG/IX1+rXuJFzHTQaBuOgmA21G1ZuW9OmrhNW/nwzOmTYtTEyjQLEU/dVV3qQxtj7E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781840319; c=relaxed/simple;
	bh=6I8FyXeCCWe3tQCxApHyEyXz99IduHe0b/S5cxaOHaY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SSZI1es54qfCF5iDqzbiyUBsCG0pgN+IMwcgX9fo3spR3Y6k1KHapvq/Jugwhd7Mg5fEIssWG8mr3j9hgkjIScXp2gBxyT9JCAe77B9FqQ+FPy6nnXs7aQQtNRXycFSoOWPLHZFziIALdaZ8EWowQjpspNz47ugL+UK24HfBHWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YWpHj3Bu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PBtMyuze; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65J2tgJN3701412
	for <linux-media@vger.kernel.org>; Fri, 19 Jun 2026 03:38:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H8M/0W0fDZglg9470q+DR9bzvfomYGwHSgp+ozjijcw=; b=YWpHj3Buqcpj4cES
	kpEWWZJiuBajn9ZoIBWok2owGqb9idwDV3TPdwBZ5GoUiZ7EhQIYlUEk8iTtiwhG
	ECRfHNR8+H5Pg7BQPUtbw/cRRML96B705FwkWlAgIqX6abXsjzu3GjlvVH0NsFvW
	W83aPZDpJ/osn27idsMq4e+OWjBjTuXGOKHdfedrhE1Px8qfb0URquiRgYgOnPcH
	MtcQl4PkRR+x4rUiBOSPI59xLAfxqtQadbIUfXuc58Yj0p3QP4lhCmwuhRX7qztF
	Wf/gCwCveIqe0Ll8zXuJ1okpldHCyF1hUoSzStKt+wbFzMRyojOrrOuTJ1mmlsVy
	RnuXzg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evmtja47s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 19 Jun 2026 03:38:37 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-845319bb97bso1515332b3a.0
        for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 20:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781840316; x=1782445116; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H8M/0W0fDZglg9470q+DR9bzvfomYGwHSgp+ozjijcw=;
        b=PBtMyuzeKg8dICjiy8biDAmnpi/KQEzkQ5f65jefWCIIh/XbQLRmGg2Pi1Gh1bBzG0
         tJiFe7PqXnXUZMxcKipFv5hwF8C8H9NuIrFtFOo+38mJSM1szjfobzagqFKdmEpFec9b
         SIIYmBRuSDkR6A5aJdJDV2ZGgMVcscswEKM/x1NAKOexEHlsoCAW3TRreF3/lpUGk10q
         TsLRh3BwB8QUdJ1y0C6uH05DDNzE0DHGOAxA9IPPxyj7wYAAu/Vj/2vAx+H94WMZLfrw
         DQZRcGhquFDAbMtVZsXY20goKsyrwG/lxA8Vq8sqYBlWt533EMItUF9mu/XkoylPoTmP
         o+NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781840316; x=1782445116;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H8M/0W0fDZglg9470q+DR9bzvfomYGwHSgp+ozjijcw=;
        b=iDwT8eDEwwX6b3lSf2p5vkvy3dtVZd3s+mB/8Lc5qrUlI7aMTTS75NOAP98Avtqqft
         l4w3Otxv++rnX2abPxJ9p7cwMSZxiNEYARr/wjZVs0nVaPWlAW8lN0WWqgeM20YRyCbQ
         e7gUkcrOsSnw3oYfkW9KA13DizQ5K42Xp6GPRmzpZEW1oF1dcYZkXUN3cSpHu+xaHqSu
         M2xlXJuDRdwb0/CIrb0xVmbZldJUKMAkZKpCigx8CZuUuo+Za2bOeZwA362v2df498eH
         lJ+h3WGsEtBCcp6e/kMZclddIg5OTt5naQs3tLqT/KnMgM/47cNmfsU0ruwrfbeKWEHP
         SrNA==
X-Forwarded-Encrypted: i=1; AFNElJ+KJMjfP6DWye08EagUOgbCtQjSDP6A4KT+OI7y51YCdpyVDuPjj7KqPKm8aEr8+g0CigzZ+CfG2E3aFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwdagVImacyOhsS7yCM8YSxhD/CsaA2pMVyTP/6/VXhQODuCFbj
	6CGDWXaw0FZXeTapHAMF3GmBxmCwdeFz8XsYW25PyksN2vTyJKAyF2ICDNbVRNOONARaUxh7Yzo
	DPioWAVs2Q5PU47GRK14gvzIEWpMB1F6a+4nOvQ4n7nz9sAHEwThVELyJ3ENyfIv2XQ==
X-Gm-Gg: AfdE7ck9zeYuzKYOHVuP8RvQ1sVnjaWii+Xi57Cr15l6/f4w5ucId25Cvc4kVl1I7fr
	CaVhWU9T65RBezE4lX7nWHCzQlci9xbuGfzLAbZEfnpE9ODmCWs/7M22VAwA/lQN+htZNlCtLob
	1u8GI+SJofA1kfTEkUV6VVPQGRTWdTO9JEeNDksNp9gyTNsXoiHRzFPuLh8LawgP1o3F8bmALZi
	FSjbNfRvFeTMAn6Zle66VixgIcI5s3b1KPm8BNqPQv9WjFUWr3GeFlfTj3yx1mZv3bCcQITPU2D
	lPCULovSvgPyq9Lgfo5iWk3+ocYYgwO6R7VQoT7NPJNvKHBmS5WsdhRyW3pCiZAsxal+5sqSZjw
	wDJCG6z/VLOK2wlHx95cOoyAB4tM6YFCqRlR5Tj5gtLKN
X-Received: by 2002:a05:6a00:1ac6:b0:842:72af:b3b7 with SMTP id d2e1a72fcca58-845508bbcf2mr1852167b3a.33.1781840316418;
        Thu, 18 Jun 2026 20:38:36 -0700 (PDT)
X-Received: by 2002:a05:6a00:1ac6:b0:842:72af:b3b7 with SMTP id d2e1a72fcca58-845508bbcf2mr1852144b3a.33.1781840315903;
        Thu, 18 Jun 2026 20:38:35 -0700 (PDT)
Received: from [192.168.29.100] ([49.43.194.141])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8455364c24esm697557b3a.12.2026.06.18.20.38.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 20:38:35 -0700 (PDT)
Message-ID: <264b10a3-26bb-645d-d594-b73f50b91879@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 09:08:27 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 1/3] dt-bindings: media: qcom,qcm2290-venus: document
 shikra Iris compatible
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
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260618-shikra_vpu-v3-0-1a32e26a35a1@oss.qualcomm.com>
 <20260618-shikra_vpu-v3-1-1a32e26a35a1@oss.qualcomm.com>
Content-Language: en-US
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260618-shikra_vpu-v3-1-1a32e26a35a1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDAyOCBTYWx0ZWRfX3NJpagPybNSB
 ip71/lkJpMZMxf/DacR4IJtGyAZc+MCnq43nsRl9VcXNq9YRn8rcPU9DkvX3CfizQx0RysyrI4L
 chvfNrdr22DAzEm8kFKXfsFUxrQTxBE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDAyOCBTYWx0ZWRfX2oWr7DdXgeK0
 V2kwzPV5qXT0dfidjPlWzW7I1openOZCqO7RAcSIGS083wvrnoIlLOZ/R6z43TtRIbhU0Dx2uCm
 5rqOlUdTMSWmZR4p+Igr+sQYHAi7s2Mi+8P80VsA5ThI6Lx8yxy6Cselfd/usNKW+B/YDc2xeyI
 u11ZklJtpV23KopAB80UBztw5ESLbfHEvuhb+JJmEr+uFd3fCepxfg50qfkejZASeZvZRZD6zXN
 KbOP0MYWHA56jNtcHM+W1vXexZm9he8kwzt76Slf2RK11lFybw/uy6Xq3AkwfpyVQWla8AQjHWo
 U3WXIkMk+FOERz3yPX+gHds3CyGJh7Ib2+XH5MfJn7Qg3ysQ60yyZVYO1FvzqhCzXUvcbZQNuJG
 vsQJJAyGvpqaFCjexCu7fIbBEN4fCfGp3jGSzTB4IGbNRl/23zAAwRwAz2rrl6DH9ME3MXWdzfe
 ZR1UQSEoDIj1qobaZQw==
X-Proofpoint-GUID: XBwJBBLRMnmwbVJ5t9R8eqYzpabl4VIL
X-Proofpoint-ORIG-GUID: XBwJBBLRMnmwbVJ5t9R8eqYzpabl4VIL
X-Authority-Analysis: v=2.4 cv=OM8XGyaB c=1 sm=1 tr=0 ts=6a34b9bd cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=LrD0L7TPytbPiIQqxktYyw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=gomYnHnAK4kzn5urjScA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606190028
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65241-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:bod@kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jorge.ramirez@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4C57F6A3AE7


On 6/18/2026 4:09 PM, Vikash Garodia wrote:
> Document the iris video accelerator used on shikra platforms by adding
> the qcom,shikra-iris compatible.
>
> Although QCM2290 and shikra share the same video hardware and overall
> integration, their SMMU programming differs. QCM2290 exposes separate
> stream IDs for the video hardware and the Xtensa path, requiring two
> explicit IOMMU entries, whereas shikra uses a masked SMR to collapse
> equivalent stream IDs into a single mapping. Due to QCM2290’s SID layout
> and Xtensa isolation requirements, such SMR masking is not applicable on
> QCM2290 platforms.
> Since shikra uses the same video hardware as QCM2290 and shares the same
> programming model and capabilities, it is added as a fallback compatible
> to qcom,qcm2290-venus, with conditional handling to allow either one or
> two IOMMU entries.
>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  .../bindings/media/qcom,qcm2290-venus.yaml         | 26 ++++++++++++++++------
>  1 file changed, 19 insertions(+), 7 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> index 5977e7d0a71b4fb5681f1c2094439c251366f01f..b27899ebf164229ceff1ca5cda50ee30d875e953 100644
> --- a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> @@ -13,14 +13,13 @@ description:
>    The Venus AR50_LITE IP is a video encode and decode accelerator present
>    on Qualcomm platforms.
>  
> -allOf:
> -  - $ref: qcom,venus-common.yaml#
> -
>  properties:
>    compatible:
>      oneOf:
>        - items:
> -          - const: qcom,sm6115-venus
> +          - enum:
> +              - qcom,shikra-venus
> +              - qcom,sm6115-venus
>            - const: qcom,qcm2290-venus
>        - const: qcom,qcm2290-venus
>  
> @@ -45,9 +44,6 @@ properties:
>        - const: vcodec0_core
>        - const: vcodec0_bus
>  
> -  iommus:
> -    maxItems: 2
> -
>    interconnects:
>      maxItems: 2
>  
> @@ -65,6 +61,22 @@ required:
>    - power-domain-names
>    - iommus
>  
> +allOf:
> +  - $ref: qcom,venus-common.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,shikra-venus
> +    then:
> +      properties:
> +        iommus:
> +          maxItems: 1
> +    else:
> +      properties:
> +        iommus:
> +          maxItems: 2
> +
>  unevaluatedProperties: false
>  
>  examples:

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>


