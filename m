Return-Path: <linux-media+bounces-43212-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F348CBA128C
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 21:24:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C8C73A6823
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 19:24:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3474531BCA9;
	Thu, 25 Sep 2025 19:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f1nGj0yW"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FD331B829
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 19:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758828241; cv=none; b=RtH2Xg/yXtuThiUSAe5VnvIn1Y9KKcPZBgAgpbFAQKz2CpDruEl3wpOosFrwh5bmc9VKcuQuh0CB7p8tL6854xyvz77Sp1seDFvZnoPxTvTtcsOPAQ80JLb890pgntfU5CsV7R4aAmSjO8mL+JeKLmUX2IL7Iu7FxHN0lbUaNw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758828241; c=relaxed/simple;
	bh=qVOiSJ/xkldQpfppko5f+GDdoDH5jafwiuMYnDW29VM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rY3SuRfQXM34XxHdM+jumwiy4PkEhH21n85IFn7ouJ2kIRtWqavmOn1MBxM2xJlSLAecq7NhUBQI5LuBfTctgymRwywR5+Q3siGskQJDfWd8DFH72dSEl8hZOkv1N9wEYMzHWLMjIuhR1TUBUCLGG4+8w475wJ3X9SBnHSWC3ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f1nGj0yW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIUtAo025805
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 19:23:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nFIbQPOJhIikZ8uyv0vPrbDdIVIWw6UzrtQN1vaOa1A=; b=f1nGj0yWtK/+uNDQ
	hPJOdqgbVvmSDYRTKXRoO+gfC54LkUDmwulkeKvIYOQNsOlJqL4dow68diqjIDuz
	/wMtJHIUe7vGpVgt4Pg77g28NfzsqalnsapNZuhD4IM7rkqvm6eduvGFnHFcCsCJ
	0VP4P2zjgJTZC+bu42f2lJEo6jvGV1wrgqUtLzLqRbWruYj11szcuFgiBuVi26jU
	4PQK/gTfEN3eqImxnps15BUaIT8VzetFcss4whJYY3gVwtStMJnSYLH3WfrC40jr
	LBDDyZmyTgi9LBfndAgPtNKQjuQgbPT2e43WdBPvPeHD+fP83FlPsmQ+N9GHLLsl
	zGKZmA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db34g3xq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 19:23:58 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-269af520712so16878865ad.2
        for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 12:23:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758828237; x=1759433037;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nFIbQPOJhIikZ8uyv0vPrbDdIVIWw6UzrtQN1vaOa1A=;
        b=FBHw03IEug2FxOeDc27+v8crhuctf7PtTczJmZOGLTIgUkR653kiu/CI2nWPSj+0w+
         0bFUQA1QEngZYdLg+t00v4sX0oflxivZfezGWWdK2k5ZpCEHy9N8UE52AB3P3wl5y9t3
         zYbvLXaUoHul2g6f1vWw7qMjQFRlt0PJarCl2eMeXkNaa41SE4DsnxGbsVy4T/sbaYng
         oOMb1hCHsAD0TvAY7pXi3FwBu5KJAFvlz6hj4PGJzTEZlr2RBlV34Q/3Gb0Ibbr1V7hq
         YMFeTmzeTo0ge0Vzw7i8KWh2azSjC+bAj+N/0Qxcyd6K3V5YDfJTgHQ9CVuFtQHLsmVy
         p4qQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEL+aj0qAEM0oLMdHMp5zQnz5CF+XaYTD3T1RQ6//89jOWf9AuNwBZZCR+zo8R2CBTpqfLlhAahPW9Ww==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywkdfsj0mLy//cMRUryRElfAs3LjvCWjmgmSIgReHBT9yegAllt
	tMuWyVMF9K2YYe6raOtsEjlDwlFPn/D1fVvbk6BwCQ1FeBBYlaCryGlKEXODSwNoCyYLYcp3jsz
	ApUvhTeU31cYFOPfR1vyQDeNqrCiRixdu4+pqDsQqgcMYhLjQJ9uw5OeXVrFbiwLAWQ==
X-Gm-Gg: ASbGncsmTEqufwhPRTL7BfroElWNTB+FybkGzuDrfrbAJ4K+FYOfJKNmhbXKl7KaG32
	lkXv09/PWzk1500KBSRMvc/8rMGZbWwCwdoM7sPiQOWFnT7tNRUyh8+FEMJQ4WxsFNWADINUtyX
	41SEVNvR3vOvE/WUj6E/w0H0TgScKDmFUQNvbPmZZPfcFJHLFdB+XHvlm0Pjm1NEeI7ng7ub3Wg
	KUFVDDfUBbDBu7ZX+rAX3FiZoGfWVhG9LVqhb3lNdgVwcWaR+1PNNwqI1nKkP522ZBAcfBTcwtw
	iMsPrMWTbBTrYXxjKDh6eXt7JaU3UR/8TG3KWN5QBre5uzuRDGtJfXz9ZzuxLbJ9vvmL2AKJ424
	=
X-Received: by 2002:a17:902:e54b:b0:26d:e984:8157 with SMTP id d9443c01a7336-27ed4a08e9emr41388865ad.8.1758828237465;
        Thu, 25 Sep 2025 12:23:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEztnyhBxchpex5jGVQs7EirIp5+bccHdFRYg8BrTZBAky4wA9rK2K7zXi9TcO7EpTHM/11fg==
X-Received: by 2002:a17:902:e54b:b0:26d:e984:8157 with SMTP id d9443c01a7336-27ed4a08e9emr41388585ad.8.1758828236968;
        Thu, 25 Sep 2025 12:23:56 -0700 (PDT)
Received: from [192.168.0.166] ([49.205.248.165])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6727ea7sm32717855ad.61.2025.09.25.12.23.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 12:23:56 -0700 (PDT)
Message-ID: <82c0cc6d-90e9-493f-4e09-32158a707c35@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 00:53:51 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/8] media: dt-bindings: qcom-kaanapali-iris: Add
 kaanapali video codec binding
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Vishnu Reddy <quic_bvisredd@quicinc.com>
References: <20250925-knp_video-v1-0-e323c0b3c0cd@oss.qualcomm.com>
 <20250925-knp_video-v1-1-e323c0b3c0cd@oss.qualcomm.com>
 <CAJKOXPekHM7qPuE=iZZv7QM=Du2PmQc8x4QT5OTy-jor82nbSA@mail.gmail.com>
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <CAJKOXPekHM7qPuE=iZZv7QM=Du2PmQc8x4QT5OTy-jor82nbSA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MiBTYWx0ZWRfX7kp60LP1iCAA
 zs3Qvo2C09MJAZo8WC+/eBOenhOdtlDB2CdDnQrUqXG1MEg5wjqcRkNaDOKWLvLl7f/Hd5L7Ab5
 KVh+fHL3xRkeNYBAEEhkYlyzOn4SAXOX2GJufNFyKJfgX6qBQP6ibWEUZLEUehqyVEMpNUX3bv5
 Orqzy4o0x/kzTUMthwwH/pJcahEMGBiUC2bDNpxFmKpg0Qbup3udj3ZeobxU8wL+SGvAevF7+rS
 mR2Y+h3SAb9/wguN0+EZj9i6v+p2Uj/0vRCrzQSJAekcHdCkQr1S4AuxEzA4vvf319f7md3IE6m
 lHw3/HUCQDqeY6Ds7oocmNNrGPs6NZc315rA0m7H4LBleBgCniMWQyt1G6wYnYn0VpI83vGSNPQ
 siH/8sG4b2gM+MNS85vINURQpqb5dg==
X-Authority-Analysis: v=2.4 cv=Hb0ZjyE8 c=1 sm=1 tr=0 ts=68d596ce cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=AkZwv1uTgJSVxlfcUQlFCg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=gEfo2CItAAAA:8 a=ROs2bDrj2F0jv0Mr51EA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: xUjRtlMnkrk0fOYhshEgu4iDa9V1rW1E
X-Proofpoint-GUID: xUjRtlMnkrk0fOYhshEgu4iDa9V1rW1E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_01,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250172


On 9/25/2025 2:38 PM, Krzysztof Kozlowski wrote:
> On Thu, 25 Sept 2025 at 08:16, Vikash Garodia
> <vikash.garodia@oss.qualcomm.com> wrote:
>>
>> Kaanapali SOC brings in the new generation of video IP i.e iris4. When
>> compared to previous generation, iris3x, it has,
>> - separate power domains for stream and pixel processing hardware blocks
>>   (bse and vpp).
>> - additional power domain for apv codec.
>> - power domains for individual pipes (VPPx).
>> - different clocks and reset lines.
>>
>> There are variants of this hardware, where only a single VPP pipe would
>> be functional (VPP0), and APV may not be present. In such case, the
>> hardware can be enabled without those 2 related power doamins, and
>> corresponding clocks. This explains the min entries for power domains
>> and clocks.
>> Iommus include all the different stream-ids which can be possibly
>> generated by vpu4 video hardware in both secure and non secure
>> execution mode.
>>
>> This patch depends on following patches
> 
> No, it cannot.
> 
> Don't send such patches then. We gave you already clear guidance how
> this is supposed to be solved.

The dependencies would be removed now in next revision.

> 
> 
>> https://lore.kernel.org/all/20250924-knp-interconnect-v1-1-4c822a72141c@oss.qualcomm.com/
>> https://lore.kernel.org/all/20250924-knp-clk-v1-3-29b02b818782@oss.qualcomm.com/
>>
>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> ---
>>  .../bindings/media/qcom,kaanapali-iris.yaml        | 236 +++++++++++++++++++++
>>  1 file changed, 236 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.yaml b/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..f3528d514fe29771227bee5f156962fedb1ea9cd
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.yaml
>> @@ -0,0 +1,236 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/qcom,kaanapali-iris.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm kaanapali iris video encode and decode accelerators
>> +
>> +maintainers:
>> +  - Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> +  - Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>> +
>> +description:
>> +  The iris video processing unit is a video encode and decode accelerator
>> +  present on Qualcomm platforms.
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,kaanapali-iris
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  power-domains:
>> +    minItems: 5
>> +    maxItems: 7
>> +
>> +  power-domain-names:
> 
> Wrong constraints, see writing bindings.

Got it, please review if below is fine

  power-domains:
    minItems: 5
    maxItems: 7
    description:
      Some of the power domains are optional(vpp1 and apv) and depends on the
hardware variants having them or not.

  power-domain-names:
    minItems: 5
    items:
      - const: venus
      - const: vcodec0
      - const: mxc
      - const: mmcx
      - const: vpp0
      - enum: [vpp1, apv]
      - enum: [vpp1, apv]

> 
>> +    items:
>> +      - const: venus
>> +      - const: vcodec0
>> +      - const: vpp0
>> +      - const: vpp1
>> +      - const: apv
>> +      - const: mxc
>> +      - const: mmcx
>> +
>> +  clocks:
>> +    minItems: 8
>> +    maxItems: 10
> 
> also wrong

Please review if below looks good

  clocks:
    minItems: 8
    maxItems: 10
    description:
      Some of the clocks are optional(vcodec_vpp1 and vcodec_apv) and depends on
the hardware variants having them or not.

  clock-names:
    minItems: 8
    items:
      - const: iface
      - const: core
      - const: vcodec0_core
      - const: iface1
      - const: core_freerun
      - const: vcodec0_core_freerun
      - const: vcodec_bse
      - const: vcodec_vpp0
      - enum: [vcodec_vpp1, vcodec_apv]
      - enum: [vcodec_vpp1, vcodec_apv]
> 
>> +
>> +  clock-names:
>> +    items:
>> +      - const: iface
>> +      - const: core
>> +      - const: vcodec0_core
>> +      - const: iface1
>> +      - const: core_freerun
>> +      - const: vcodec0_core_freerun
>> +      - const: vcodec_bse
>> +      - const: vcodec_vpp0
>> +      - const: vcodec_vpp1
>> +      - const: vcodec_apv
>> +
>> +  interconnects:
>> +    maxItems: 2
>> +
>> +  interconnect-names:
>> +    items:
>> +      - const: cpu-cfg
>> +      - const: video-mem
>> +
>> +  resets:
>> +    maxItems: 4
>> +
>> +  reset-names:
>> +    items:
>> +      - const: bus0
>> +      - const: bus1
>> +      - const: core_freerun_reset
>> +      - const: vcodec0_core_freerun_reset
>> +
>> +  iommus:
>> +    minItems: 3
>> +    maxItems: 8
> 
> No, you need to list the items.

Could you please elaborate how this is expected ? any reference would be
appreciated here.

> 
> You've been told that already in that discussion.
> 
> 
>> +
>> +  memory-region:
>> +    maxItems: 1
>> +
>> +  dma-coherent: true
>> +
>> +  operating-points-v2: true
>> +
>> +  opp-table:
>> +    type: object
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - power-domains
>> +  - power-domain-names
>> +  - clocks
>> +  - clock-names
>> +  - interconnects
>> +  - interconnect-names
>> +  - resets
>> +  - reset-names
>> +  - iommus
>> +  - dma-coherent
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interconnect/qcom,kaanapali-rpmh.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/clock/qcom,kaanapali-gcc.h>
>> +    #include <dt-bindings/interconnect/qcom,icc.h>
>> +    #include <dt-bindings/power/qcom,rpmhpd.h>
>> +
>> +    video-codec@2000000 {
>> +      compatible = "qcom,kaanapali-iris";
>> +
> 
> Please read dts coding style and look how dts for Qualcomm is written.

made the changes w.r.t spacing alignment and alphabetical order, following the
reference of sm8750 iris yaml. It can be reviewed in next revision.

Regards,
Vikash
> 
>> +      reg = <0x02000000 0xf0000>;
>> +
>> +      interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +      power-domains = <&video_cc_mvs0c_gdsc>,
> ,
> Krzysztof

