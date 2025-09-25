Return-Path: <linux-media+bounces-43215-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B84ABA130D
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 21:31:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 568C24A683B
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 19:31:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 490DF1DF27D;
	Thu, 25 Sep 2025 19:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iSZjTMmu"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FFB257858
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 19:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758828698; cv=none; b=YnIBhJ4WWz4fuWuJsjtxrmHk+0lgypDHM4aAge0QUaVFvDgj+8k+kB2XiFGIXPnCCShYCe+/o6m1b54wCG2tq63smQvMFTXa66hnQtKQ9FK6xOnKwfBXCpV3yEdZAr5N8XUq+smcuWp1BEfThwluU8pzNIVjVVUtt6HGzmNrhPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758828698; c=relaxed/simple;
	bh=ixD4JAeSZTT+cKIC7yfTKECAN5O4rsWfV2NLw5qppKk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L0i9VIswZnwqaTp1UdqNeyvLHRCjSM7qWvAQHb7DY57f6BAC1M+dkb0ab9FpMAJaUdR+SS5ACIn34lsLg0x2S82kmav7ieEGWecxzPkDzzhU/DCkGUiq5dO61JmTbyMWFJL5zF5n48VsjdFJ/MIOG5Z6zS4neAId28kxsDbKrwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iSZjTMmu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIPo15021675
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 19:31:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xN2zeve8MKIwluD+p5R+V0hgYRPi/KXOcVTKAzLg/4s=; b=iSZjTMmumnhjkPd5
	idAoiZHRPTjI2FP0FOQ52Z+3uS6MgotKPSeJyOGdAP2yM6uNAs2rTOKEi1Bv4v7K
	JCRnkRuegx1kKEul6YCLMgIOyaWcZS12eIAyVpBTnzaQGx/OwuVK72JRvwLXeLME
	k66Nd3Iv+m596//tSsmMEFgSdmnjvpojgoTd3EW+usDAkmk6hsaylR0L8KpoeP8O
	JC91/Hx+ZtVZMjZBxQJOHHV4hi6HrwmgTSD/GoxrQp09WIUqsa3WQWHjLf9d7Fus
	QQ2vYY7bQN9vVb2SHPbkOcSgRsv/yTL+BpO6VOFrOvnnuN1fjhP8Y8hTBJxtB+Z2
	qos38w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0qr5dg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 19:31:36 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-32eb18b5659so1313115a91.2
        for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 12:31:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758828695; x=1759433495;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xN2zeve8MKIwluD+p5R+V0hgYRPi/KXOcVTKAzLg/4s=;
        b=T1ApXlLXRKPnEpNIThYX+IwWunbZlJyqFLqOETZxQzvih0OwPf8s4MUd2nK/lMjqCj
         jIafz8Gb61d0hXFvkbuegoTYuVzdh9LbDc/xiGLuyE9jQ5uChDDh3TSJZFydyyZ7lbxp
         yjpKUKawywt6GdgxXmnaEyPNFkm0/njRtZjihjtE/RM0k5YZRUWAIRMEfFIgjh9OuMr0
         OarfVJcOUFon7RhQht3f2cxhawi2gS0awEazq93MTTuu0dzFa0+BDFN6QQmTREGYLtEY
         El/9pgjdqPXj2oK8OdFlH3qNJHm7B7Kqix8TNKvHZ8nADd0aYClrIsbkMRFslPe0Z7Gs
         2cfw==
X-Forwarded-Encrypted: i=1; AJvYcCVQeQSv7/Urgs6+1vziD9z83ixpzc52v1CtShwRgX8N/b7tWwF0X4n1r901+GybWP+EIFYndFRDttxrWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsRknCNgKayqznyRITsb7vxtJF8ZgqeF/y3gDs/HSKL8CwNtNE
	EInasXC6kW+R4aLa5U7q0tR1yIRwl+YFuZV99kqsiByoynieb+dIPX/vwOSP2NXG7G8CnwLrm6q
	EgiVjV2ipagVKrTZhUINaNsR662fNlxnj9YHdA3HY8a3pTd5OwdJfCmq1K3oekUSZLA==
X-Gm-Gg: ASbGncvqvpzciTYv+A0D7ebJ4tOhu/UnGq7YAmh663kxT8T70sHb0Akq6l0BvmgXnxH
	9tXJALKQXomAIU1yuoffrvVyuMVWlpXISnH/HIgMEBwCQy3zB5L8gphxWMBCdUmmzwnt+BQLS2P
	a5yqzTj0iDfkEQKNMcC11fFWWHK1f9hEMTBCnaMev65YX8/EdhEizzcrjFEXiGRU4CVvAoXtKb8
	BvRrymaHV1+/RfxhZ9eUWG7R/pYDIz/Fy4nqUys6C8xg9Tequz2RplVCJaGNwRQG1idPRLcpkuU
	7Oxt2BHsxy9J85s5e6XqXqDST/yVTdmmS30CJCaeoqEZn+8ApElkEIkGHzSisNpporNWnp3kfow
	=
X-Received: by 2002:a17:90b:5109:b0:32b:baaa:21b0 with SMTP id 98e67ed59e1d1-3342a2498b0mr5055275a91.6.1758828695551;
        Thu, 25 Sep 2025 12:31:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcihAr9QeDqmHNipkjhQZA1yhGxUL+6BzxOO9aN0JoSkA8hWKZHTY3tt89U22izY99lHd9JQ==
X-Received: by 2002:a17:90b:5109:b0:32b:baaa:21b0 with SMTP id 98e67ed59e1d1-3342a2498b0mr5055254a91.6.1758828695141;
        Thu, 25 Sep 2025 12:31:35 -0700 (PDT)
Received: from [192.168.0.166] ([49.205.248.165])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3341be3a010sm6552860a91.28.2025.09.25.12.31.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 12:31:34 -0700 (PDT)
Message-ID: <522d7244-0003-a42e-9be0-1d353df8d5bd@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 01:01:29 +0530
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
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
 <nuunkv3xwfes6wed5xf4re2efakndvvrfl4lhmenilkic4sjiy@5cb2f5ygegvm>
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <nuunkv3xwfes6wed5xf4re2efakndvvrfl4lhmenilkic4sjiy@5cb2f5ygegvm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: J6PvWKp9VZMiIolAW6ibykUJczBoojSI
X-Proofpoint-ORIG-GUID: J6PvWKp9VZMiIolAW6ibykUJczBoojSI
X-Authority-Analysis: v=2.4 cv=api/yCZV c=1 sm=1 tr=0 ts=68d59898 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=AkZwv1uTgJSVxlfcUQlFCg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=gEfo2CItAAAA:8 a=eVofJsru2PQPkhUZkREA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX9fpjSJXeix+M
 UKAgTAQEKtfOEo3uvybnc0+8tH1oFvf3h8mPurd9h+2bO6sDMtoyPj/8EJw9H97ybYr1qn1xpQ9
 vZjAuJBM7saDendvMy5qAr+N6dPG6o1rImNhlSo+tw6q0rPUt7xe3ycaxaT9OY1ggY3UrIuXA7E
 uAqJuj9N+euSgx0+P+Nlsn88onSumfKFGn+82K3YWyrgLSWIigCqZR0tBA0lrHOg5s07GChTnaD
 O9HaHA3O3SLSYC4bqV6AouWpdMrP0WnFUJn6cFvisJLySzUGVf0qzi2rvdrFmwmb4dUCMLwl2uy
 /OATfYLWKTsrTDAz+ekm/3wv2q99EAj28Lv1erizFCag7chEDZUyoKORX4UHCbqS9/0DyqRDtsD
 9BbySocwVFbm76FOllsm+CBiGitKKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_01,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171


On 9/26/2025 12:55 AM, Dmitry Baryshkov wrote:
> On Thu, Sep 25, 2025 at 04:44:39AM +0530, Vikash Garodia wrote:
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
> 
> You are sending bindings for a single device on a single platform. How
> comes that it has min != max?

I was planning to reuse this binding for the variant SOCs of kaanapali/vpu4. If
we do not have min interface, then for those variants, we have to either have
separate bindings or add if/else conditions(?). Introducing min now can make it
easily usable for upcoming vpu4 variants.

> 
>> +
>> +  power-domain-names:
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
> And here.

Same case here.
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
> 

