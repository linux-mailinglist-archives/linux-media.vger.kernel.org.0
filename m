Return-Path: <linux-media+bounces-41006-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DF257B33E32
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 13:38:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E3ECC7A7F23
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 11:36:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A9852EBBA9;
	Mon, 25 Aug 2025 11:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HaZ5GNTD"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055842BE039
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 11:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756121866; cv=none; b=p3Enw6dK9cSJZz4W8Qx/sSiIKR76DX4XFU2GN5zD3QxP57Uum9F+xz1iS7Tce98d7t8/PcOpaiSrvE7k2DFyKnO0jEKK4QYHSSBVWCBRoECgzJOBXl2qE9/qvQnVzMMcG+hAxXx7T3tqBpKIf7tnlJyqNlkju3KgbxKrEiN1yvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756121866; c=relaxed/simple;
	bh=XXDOc+eVXEtcbM7tCB0yCE4h0im8hLl5BTt9Niin4jM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=axHuZV9l5z3KCe/XwRBAR9xlnUbbIEYlvHbhOZtzHxE9SJdUfJaYW8ezdk2UJ23SDFncNtwd5nU12YrgN+DTnRitoZ6sXVQPcs1FkZIgzuVFGBTyvDUvuKPeLUfqWSgibz0Fa/JJEkLGGFHdQWQmSMENMukCKC2kFlz2ASiRX1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HaZ5GNTD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8ZYx1032292
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 11:37:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DmTIG+cUBxATSrrDETEY51LA
	vc72wQEgnDzzCf/t1Gg=; b=HaZ5GNTDlFwMmxDoRTQLgqGH8sf7OBYqSckwVNqo
	/xcXu7UJdbFhxVAuCmGvlWCrUWyJ6YDIb1NhueZ6epndBFZHVKiR0+UdbCohJToR
	I1fZCcWicqnDWwLSFlTFHi4Aly5N6t13a9KuGcCTpSbrcuHuHBHrSii/ocOtMQHM
	DaDflu2GsSeEmq5JrWWn8Q2Y+fOyDhJaPpMIw3KF+MGGld/mr5m6uv1rCA+zdhLB
	1npjenLTPyYnDuR+u7QQGkx2/hRJad888HnT8U6KLQzfCMHZMf3mL8dp5ngxJtlL
	PE8JSjPXMaS+ak9cQbv3kHc7llCegvkbtFRWJOgzyZ8Tpg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5wdvu00-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 11:37:42 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-246a8d8a091so31524685ad.2
        for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 04:37:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756121862; x=1756726662;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DmTIG+cUBxATSrrDETEY51LAvc72wQEgnDzzCf/t1Gg=;
        b=TDG5mlvVnB2LCzwlzIITZefvgaRjtcIwQ7y0iYUE7BTvY8Y78xp5B+X7iFMOW/ZVuY
         TbQXMJUWbvE6tnX2B0kvL/xYLotpr37DoytRFRRNFUjpxJ54iU4i3IjHqCB+Cuxcl5s0
         9b9NhOgkjqTxPCJH+nRAGJakFfpOM3IBPpb4rrcyxXIPXJkGBPMFh9zuOub/MGDtTJRW
         +fE/k15UnVpNX85NouPhe4GrkvW3BflYIo3v5XhBs2oszL9cQEiSxBQ4jAtzW5VdeW73
         MH4c8XbAkqTX4gJaadYoxMvMWz/uudJyNkKtiwrfDKAw+LayBNDFDzRWoBmMaPEikhuq
         AbLA==
X-Forwarded-Encrypted: i=1; AJvYcCWttM6GF/2gdPTfd2ndN9dyCryHuqp8mcwlcm8qYKaT5P48YqExx+Cof+EZGdevY/rxy3AbQ9O0NNamHw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRqeRdB7XRvCUkOZmp5nCGoZYjXsHpErj+dUheYHK0+MBXScs9
	WJSyDTv3WoKBl7wGB6iyoLEPZYl0WyllPzEoBBQK9cCbC8EioGKr2dbz9It1UMeCLqP8ubz88Kh
	+C2tXTnsBqzMI98r0QlsWNYrXw3rHmN7d48oSLJfiIhfEpCi0d5Yxy5h4AGNZpmOO1Q==
X-Gm-Gg: ASbGncvfqrWGaZhFFTTKClXzJZede/p0Wo79e6LY1C2PJQP/rr9g60Xklx6aOkWvLO8
	yvt4Ys6YXElfnGgxg8UxR4fQ0IP/OPpHkzgABWzfaP76m9vPOxJxu9oi1e5yDzzdaGrSxf6cNTw
	q0RT1RPdzmZfwSfKDUcw66Bo69OgS34ZPM9puTDBZ9spxZfuIe+jUmmpLjJDSRjJMxoUWrtG5ZR
	YWf15jwi0hIqe/EAvGXU677hS0Qc/LGiYJjpTIPrcVBBRNk7GKlEYoZwRD4VeM9moPdv+5F1ffx
	l6eGc69Q293bXy66kIrVuyioGt2M+FuJq6kLiRKmuL/yh8bCTbKKbEIDK97NuUP14wM=
X-Received: by 2002:a17:902:d60d:b0:246:44c0:a8ec with SMTP id d9443c01a7336-24644c0b418mr128112695ad.35.1756121861616;
        Mon, 25 Aug 2025 04:37:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSYQpcwLgzh2s3jNAOj/+32KQWfX5fGO/hhP4S7+K8CK2vJfbGYNJ54sNqG7gjX4YtIyBCPg==
X-Received: by 2002:a17:902:d60d:b0:246:44c0:a8ec with SMTP id d9443c01a7336-24644c0b418mr128112175ad.35.1756121861173;
        Mon, 25 Aug 2025 04:37:41 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-246687cc38asm66585125ad.67.2025.08.25.04.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 04:37:40 -0700 (PDT)
Date: Mon, 25 Aug 2025 17:07:34 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: dt-bindings: qcom,sm8550-iris: Do not reference
 legacy venus properties
Message-ID: <20250825113734.iekrgyvctamhb5y7@hu-mojha-hyd.qualcomm.com>
References: <20250823155349.22344-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250823155349.22344-2-krzysztof.kozlowski@linaro.org>
X-Proofpoint-GUID: mpr39EIQ3ZVc-XjuClPUCHOoiP8Rmgrw
X-Proofpoint-ORIG-GUID: mpr39EIQ3ZVc-XjuClPUCHOoiP8Rmgrw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX8P74BKvSJ3W1
 1J5uwniyBeI/gmfXH0D1JBJ4NsuC7sSv2xO4c/FwFsjhqu+uDmUU+6vmF23jqfZP2rPc1F+EWMS
 Q5vmjPPBKMFlgQH1HbpazaMIuvRK1a0zCWTm0zpAqvDcDQWrRafaDbC7u8ugX9EvVba0QNUQcOy
 L32nBGFOQi1dqeq0NXH4kwP3wzwWcW/05IZbnqbCNAuKUIk+P5evyOzQc3ftMKYlpWYydychkxt
 9lCd2dK42zo2zMW8u+oM6BO/z9C4wPxteBCTKZtUg3GL/DBXBZ4hDJfy/GUzfNcxLJyhXmnx5uI
 eTsF0ODRZ7bBTfB0Sm+uY1gO9J5aDa98rlAfkruNxVIC2joxHSY8jIQgKR0SDAb2phBYhkFZx9a
 mbGJoC07
X-Authority-Analysis: v=2.4 cv=BJazrEQG c=1 sm=1 tr=0 ts=68ac4b06 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=XmET1tXKQoUtgWt8NUMA:9 a=CjuIK1q_8ugA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_05,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230033

On Sat, Aug 23, 2025 at 05:53:50PM +0200, Krzysztof Kozlowski wrote:
> The Qualcomm SoC Iris video codec is an evolution of previous Venus and
> it comes with its own Iris Linux drivers.  These new drivers were
> accepted under condition they actually improve state of afairs, instead
> of duplicating old, legacy solutions.
> 
> Unfortunately binding still references common parts of Venus without
> actual need and benefit.  For example Iris does not use fake
> "video-firmware" device node (fake because there is no actual device
> underlying it and it was added only to work around some Linux issues
> with IOMMU mappings).
> 
> Stop referencing venus-common schema in the new Qualcomm Iris bindings
> and move all necessary properties, except unused "video-firmware" (no
> driver usage, no DTS).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/media/qcom,sm8550-iris.yaml | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> index c79bf2101812..320227f437a1 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> @@ -26,6 +26,9 @@ properties:
>            - qcom,sm8550-iris
>            - qcom,sm8650-iris
>  
> +  reg:
> +    maxItems: 1
> +
>    power-domains:
>      maxItems: 4
>  
> @@ -45,6 +48,12 @@ properties:
>        - const: core
>        - const: vcodec0_core
>  
> +  firmware-name:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
>    interconnects:
>      maxItems: 2
>  
> @@ -69,6 +78,9 @@ properties:
>  
>    dma-coherent: true
>  
> +  memory-region:
> +    maxItems: 1
> +
>    operating-points-v2: true
>  
>    opp-table:
> @@ -85,7 +97,6 @@ required:
>    - dma-coherent
>  
>  allOf:
> -  - $ref: qcom,venus-common.yaml#
>    - if:

Saw your reply on 
https://lore.kernel.org/lkml/59951c47-1015-4598-a885-25f8f1a27c64@kernel.org/

Just trying to understand ABI here, how all of a sudden we remove a binding
for a hardware just because it did not get noticed until yet that as it is
not a real device and we always say device tree binding should not depend on
drivers but the device but we are saying Iris does not use fake "video-firmware"
device node for removal. I am a bit confused.

Whether removing will not break any ABI as initial binding enables the IRIS
related code to use video-firmware, now we are removing it.
I believe, removing binding always break ABI ? or is it depend on driver
code not using it ?


>        properties:
>          compatible:
> -- 
> 2.48.1
> 

-- 
-Mukesh Ojha

