Return-Path: <linux-media+bounces-41682-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F05B420A3
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 15:14:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7EA511BC064B
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 13:14:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ECF6301013;
	Wed,  3 Sep 2025 13:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mrPTe9PE"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF2530101C
	for <linux-media@vger.kernel.org>; Wed,  3 Sep 2025 13:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756905061; cv=none; b=iDy+yGWsmle5h/wbiSOmErSKDnAKvfn79MbbJcfr+xl6xSr7LzH4uUXU26ksv9lKNaHuVUX4qjQIRusMp9MR5fzsopBF7A3v6HMdgGaSb+dQm4BYhGRsMmWnuc1US838jZ/jfqMHBdsqu0IVPpcs0QpaIIPeKm8EGSBkLLvRbrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756905061; c=relaxed/simple;
	bh=W4WCBxQvaUYibDVSr+aUaJpoOgC+JIgx9GXzLqZgHeg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C/aXTysSUeqXvs/iwOZVa4fmGTXDX+hQq028rmQs+LuijAUYOh64lx1KVbLjCoZcSLE4KK9iDEyLBmkkq8bcjL99SxBp+aBhqRiggOUsR6n9g5ChC0Q/HrWEP86rFg0Jn+x9utpjg8F0KbIzj2ohJaDMz0ZuVNFQmVlXT97wbhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mrPTe9PE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583BEsv6022389
	for <linux-media@vger.kernel.org>; Wed, 3 Sep 2025 13:10:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aY1HJAFmHMKDRbWr8GRd/t9G74v0xkZNHeYMb6/rGks=; b=mrPTe9PEaGy6DzLS
	9fSmuqz9PMF9rTCLTiGZvaaDz7w8eC3xYRiw082XJV6Z8hgbqtm3iyLPYpj5jbAB
	+jBryTIJF0X6NXQxDyIqCwSVbjYfnlbS/HTO7iGskh4ExGNbESoeaa375AHCrwNR
	R+bPCxAlD1oF6BBpGGC0R7DwLK6/5r9+qeXMrkg4YqBsdXgijQehkyVEPLM3GeHr
	RAj8nke/okN1tZJxcyxjydYBwNlFvLkcURlgn/4aYpYDUgzPhi7wGbNwsuGhp8DC
	Aezt6w6kxgxe5Zl5JWeMdLbiSfJYHv6zKdFniEoSUdPdUflCXu+FsSPipJb0ignV
	CAu0NQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ut2fknca-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 03 Sep 2025 13:10:59 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b2967fd196so19612531cf.3
        for <linux-media@vger.kernel.org>; Wed, 03 Sep 2025 06:10:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756905058; x=1757509858;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aY1HJAFmHMKDRbWr8GRd/t9G74v0xkZNHeYMb6/rGks=;
        b=QQsMXugJzIJKsVMCVolORJiySHA0Ix/dE9oOrCOEWzmM/vjLylCu0H4ZjUtj8L2Ul2
         fFUR+s/4LBadPD4bi+5zG5K8SBjiUgWJS6noD3iEs1J1J5+SA4p3O8VfM8BSSfiRnfiF
         7fX449qoE2XCj3eqD5v1DsK6FxhG2nc/yEDzo0PcXP+PxdhCPbnyShWKy5aKY9tkr3WW
         U521gH63SMQhxDzsE8Jha6WKKIjYzTFHBUm4YfHlPfWuWrQjU6+vNy2qOWLhcyheoq64
         cfrHN+X0sNcpBaZYB3m4IgWO2uCGw7iHRDQ1uJ8v2a0Pfg/GljrMQz3ytVIRFmpTbjxN
         vqcg==
X-Forwarded-Encrypted: i=1; AJvYcCXYkaEK4iSmS4KYafICuJrK6kPSU+RLbb6AKIEJPLM4oKB2+vPv7Vq29e4dVMUR9MOBWwZa227gppmN6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzE7sf2l53pDlRJc/zV4xM5Oa5wxPjg1NasGbrukIBhKpoEqDL6
	Pv3HB6KmMokCj0b3DUIt42XFoYQKJ+8xvKBLhc+kecx12x9zZCr+Yp+EnWM81DHBR48BuBi1iTw
	ypBL+vqsAmZ27N8uDksKUN0bpSIyGjXLAjrQza+G9xktgL0Ft5WGDJ6T515RAbeSoEg==
X-Gm-Gg: ASbGnctU9ZsWVcrKXiLDvgrxuKQ7OnVLbeDhChXWui4pn3hXckteprm3VL4KFT7DTHM
	0lysBDMggYrtpNwIJtRXHvrzOrRM5vlY7QmjVIfLV7s5VjdR8sy0qRrGKHUvlQWwt42o7altkEG
	548SHSHSzdo48dZ+GKpwO/TkshWNhfJUwpdAK8cGNSqBSEidJSKVwRypwP2+i/R2e3ugrobej4Y
	vSLS9abnb4b3I1FKz2CcBBcmnMRyK2wAw/cIAu84EW5TuT3jHKJUotBXluJkMWcQXT4BOYAEqO1
	l6+lypnrg07/ld8CmIGDXxoV019oc8CXZ5jemVpg/aMbB2rAf2mZlE1MOLtUdyx1oqF9ukNJOiq
	bFir2h51dKtKwmoqkHnP80g==
X-Received: by 2002:a05:622a:15d4:b0:4b2:d8e5:b6e3 with SMTP id d75a77b69052e-4b313dfd74dmr144315201cf.1.1756905057278;
        Wed, 03 Sep 2025 06:10:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlbX86OkDHQrtRozUIs6RfA1kZEBTsuPTQJYPGvCUDsHeOmLvCYNbgn6D4FeDhxE4MBDNULg==
X-Received: by 2002:a05:622a:15d4:b0:4b2:d8e5:b6e3 with SMTP id d75a77b69052e-4b313dfd74dmr144314681cf.1.1756905056546;
        Wed, 03 Sep 2025 06:10:56 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0474be5e99sm30772166b.94.2025.09.03.06.10.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 06:10:56 -0700 (PDT)
Message-ID: <99820dc6-942a-4aca-911e-cc68834e41f0@oss.qualcomm.com>
Date: Wed, 3 Sep 2025 15:10:52 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: dt-bindings: qcom,sm8550-iris: Do not reference
 legacy venus properties
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250823155349.22344-2-krzysztof.kozlowski@linaro.org>
 <20250825113734.iekrgyvctamhb5y7@hu-mojha-hyd.qualcomm.com>
 <a3325bf1-2a3f-416a-ba2a-4fb1e9f85e61@linaro.org>
 <05d40a3b-cc13-b704-cac7-0ecbeea0e59d@quicinc.com>
 <46f5d11d-8bed-4d01-9151-35a24cdacfa5@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <46f5d11d-8bed-4d01-9151-35a24cdacfa5@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzOCBTYWx0ZWRfX+j82wCXeDr5Q
 30/wZz+jdIaIXZ7GkYI/G6c/j8/nLv5lZKLVI0F6evemnOZbsFdZJcIb24n7fPg9RBg5fyxbLbL
 lpD4FPvY8R3GcAFh/rl/qicV7lDo/08LafPIaAcXsDDi2mJnMJM5TQxIM7qkSL+MZluyctWDAuF
 N7UB0PyVnwdkMZwSK3GLdS1S9OCfeUaKvIO2CEbD+ZP49NLjDe7T64WS3m7S/sBiRAtbc18+0E8
 fNcGYKIODwzJN+EyWqRFf2kykLd60u+qQ5VicwCvYs0Uwqx5Z6a5vQExEulMnTA7RItbszTxMyx
 xg7ArOxYxMqs7nYB6urByFlklr7G6Ff7ud2DfiyS6stomDF/0HlrTsLP1TmLeUo4DVew1PAIU5R
 PrNjvfwd
X-Proofpoint-ORIG-GUID: KByhbBU3Yk_D7NRhTa9DB2SNJEvPhPIb
X-Proofpoint-GUID: KByhbBU3Yk_D7NRhTa9DB2SNJEvPhPIb
X-Authority-Analysis: v=2.4 cv=U7iSDfru c=1 sm=1 tr=0 ts=68b83e63 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=PnLdOiXTK5e15ukaaVEA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300038

On 8/28/25 3:57 PM, Krzysztof Kozlowski wrote:
> On 28/08/2025 15:49, Vikash Garodia wrote:
>>>>
>>>> Whether removing will not break any ABI as initial binding enables the IRIS
>>>> related code to use video-firmware, now we are removing it.
>>>> I believe, removing binding always break ABI ? or is it depend on driver
>>>> code not using it ?
>>>
>>> There is no single user of this, out of tree (I briefly checked) and
>>> in-tree, so there is no ABI impact. I am changing the documentation of
>>> the ABI, but there is no actual ABI break because impact is 0.
>>>
>>
>> My understanding here is that the interface "video-firmware" is already defined
>> in the binding. There could be possible out-of-tree users of it, might not be
> 
> There are no such.

I believe the confusion here comes from the requirement that was set out
for the iris driver to support existing (venus-supported) platforms without
binding alterations

Bindings for SM8550 Iris (as in, the hardware block) only came out with the
iris driver, so there was no legacy to support in this case

Konrad

