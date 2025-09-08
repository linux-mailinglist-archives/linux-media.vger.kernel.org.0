Return-Path: <linux-media+bounces-42035-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3C6B494E0
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 18:15:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 756681B23991
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 16:15:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EE9B30EF8F;
	Mon,  8 Sep 2025 16:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JWP7pwRJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45EE630DD32
	for <linux-media@vger.kernel.org>; Mon,  8 Sep 2025 16:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757348102; cv=none; b=RbDys9b8Bcku5uimKCrl6AZWyrZXwXgyb9L4yv1D7m/UDVB8OF6JPFCVeNbM+HE0AW0rzMQrrIsnqk+ZGxwNqIqV5P2V0Sk91ez+EnU1bxhA8QMl2l63C9EeBNAncojoJo8C+9uKp0zfQe8J7mW/kTOW46Aym8cGHL+Sp55Ixm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757348102; c=relaxed/simple;
	bh=my2J7ZSJKgwOGws1Hzn3zA5jTkV8FObsyOMISQJ3baM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ed5diWnr85u6/q1AgRhPNsqNQ7Q9EN4Bc0nz3pJVoPlacu/r3xt1Obtt6/KDJ+qDOs9yBWjo0++r2T3Fw7r28ulihNUMBzuSlFNgUtdVIUkHVhCBvukk/lbwP8qyl+XR0yhQWn3cRZ9/AiNrEdNWfuql8vETvOw4+EL+k9xCi08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JWP7pwRJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588Dv8Wr005880
	for <linux-media@vger.kernel.org>; Mon, 8 Sep 2025 16:14:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uNUg7SeCQHOb1a3Kr4zUTJOlns3BsZPwl8vdQ/gvp4U=; b=JWP7pwRJqb/4XlNK
	BSNvvQAQIwgdwBtdYDtuX4xfXMrzCZkoe4s3IuBXiYQ+9P/hGqp9akDdbZ6c9dAL
	iVyB3EjQJp1Y+Gsxs8Yopt0UTQzUfMlo3jfxNEmoqvgfFjgGScLVHoHMsWjp6Rrf
	+rs7Eo2/IQhagay0vlyaCMy4JwQTpZRUiHY1oqXq2glG+jG55s2zJ+QUPVpZQF4E
	NWcB7jKWAwGmcBH+u3gTsUazNdi2+nKGBcmgLxcNMppUfgsr7Gqj6dHX3yfEBQVf
	fwaCklWz40tP12XQt3qskJTB8hHCbHFnQU80gthIPNLsD7d751jx0ExxPhkIUX1w
	BM/eBQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491t37sn98-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 08 Sep 2025 16:14:59 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b600d0a59bso10909361cf.0
        for <linux-media@vger.kernel.org>; Mon, 08 Sep 2025 09:14:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757348098; x=1757952898;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uNUg7SeCQHOb1a3Kr4zUTJOlns3BsZPwl8vdQ/gvp4U=;
        b=JFEZFCY7t9EvEkesuOGabxdKaMIirhFY2UlafQZIUngd0YNTJPqBHTYvIDiFNAnKRH
         a1zXKQLLlYJzj1XBbut6gD6I7B9MzzS1N2vNs456QO4g9ySJtECHUUW0TbxylQGH23EJ
         8JsTbau2zlXQjZw/VEr0S1GbQ4V0VGcUyZHTY+RPYx1wW+XeOTmOd0gNiDqdUnsKX1nO
         EjXdFsrpBFOPSY9QoIBUDWmjq7AwilzFe0g5P2xUtwRYuWMmPQIyCEQ1Ho/LLFIQr5PK
         Mdy1YjjsWJYuNKGdaodLJxJNXTt2c/R+LhUXXGhvsGQAF+C59GIQ4irtiGqHn2/qhKhx
         4KsA==
X-Forwarded-Encrypted: i=1; AJvYcCUv5E61J8b8eT2lX39Ziryp0gJQpi+N1EkzYSgKY++6TO/W6NLluMvDi54S0mH2dBLs4j2s8UxyivNsWw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx66KW4LxX+Y+jNjJsgQhCe9E//2N5/3ctK6NwLOfPi/xQx7mI/
	erF29rTJn8MHan+IT2neTdMVqWrTf+nEEpDsZBCDFNmDTxWPZHFg5AHbnDau9hNOw2JN95M2Uzq
	U76ggClBMkWZZfdirEOluxQ+Po+4ajwP2nKjlqsSVYR3vni5KyxdxqLfityUcjcbmRA==
X-Gm-Gg: ASbGnctYEsL2otke7sIVMjRb66neSu2FJ+nydQvJlsf4edMX3PFna/jW/pgaYbJ+jDo
	cuJ8JnvP9JcuHcim5A7GE8tAop1kxhPbHZ1U2Rwua97tfK2yfpjOVsJGwKUSArHpxrVhl2tB85x
	X3eEVo84ehmJwy0fOtXGM1Iy4XZTeCkOLbbsqMtEkWNYlTiSMjg0zjllLVOMNUMoI1aPlRNQM9r
	9GqmUd6XF+Jn766hQxzyEHaDS9Gp/NxfJHSsq/1C9JLoyrKwxDJnezDknvKbVHMy/au8NuG07uJ
	NJbPa79etS2Nc4WY2T4kle9mZH71j0B4gP4O3glTsfWxNimNg8WjJRg5Vhczz1Cb9hQcU9ERx4g
	nhC7srndCZQt3X3WmbkyBMA==
X-Received: by 2002:a05:622a:1803:b0:4b5:eeb8:9dbd with SMTP id d75a77b69052e-4b5f8389c08mr70178011cf.5.1757348098021;
        Mon, 08 Sep 2025 09:14:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEco+Q/q3RTA++gNO5I3yZ9Bu9pgiKTfiyr/MiXQ9nF5ACsplPzOWYy4LyCZQCEZJJixvAMtA==
X-Received: by 2002:a05:622a:1803:b0:4b5:eeb8:9dbd with SMTP id d75a77b69052e-4b5f8389c08mr70177621cf.5.1757348097446;
        Mon, 08 Sep 2025 09:14:57 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0307435422sm2283685766b.78.2025.09.08.09.14.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 09:14:56 -0700 (PDT)
Message-ID: <0583a79e-d87a-457c-8416-f3a0b240d63b@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 18:14:54 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: lemans-evk-camera: Add DT
 overlay
To: Wenmeng Liu <quic_wenmliu@quicinc.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, bryan.odonoghue@linaro.org,
        vladimir.zapolskiy@linaro.org, todor.too@gmail.com
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
References: <20250815-rb8_camera-v2-0-6806242913ed@quicinc.com>
 <20250815-rb8_camera-v2-3-6806242913ed@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250815-rb8_camera-v2-3-6806242913ed@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: V262aj-Qc4V6wZBb4PNPnevSfd6LGhhk
X-Proofpoint-GUID: V262aj-Qc4V6wZBb4PNPnevSfd6LGhhk
X-Authority-Analysis: v=2.4 cv=NdLm13D4 c=1 sm=1 tr=0 ts=68bf0103 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=gJbItJof4LNU2qWXpP8A:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA2NiBTYWx0ZWRfX9VMUBl8ZASVn
 EZwqjVagV/C1OzvvgHbKyfjPXyjZymly95t4Y+VusxqcqclJhkYvaWjgjjPyZnSMVFjKNX+i1C4
 5ZVylJs+7AoW+Srz219IkAAnaF2293hG8hTLgavBXbL7QPPb+vjN2mwwTlDM0riCLQ1szLd6apJ
 UQ83g9VHtj7RohE9fn03VwTa20ACmGu+dkVlKhOsMElmHahwZDT6DDxFDASq88mBuWRJRKtxIlT
 MTc+ut38MZEgA0njhjo2Ji5Vaj9m21RkLUYoaIfMfNsYYbIaHTzbqZBRMEcJgUGsR9bR0xlU19M
 o2x3egakoA4wT6zISw+Nu96wUjyXUvvtGk6CzIMVHSCHkOjCRbPvbmk9vtVr45M3/h6m0lYjaxh
 qKIYPjXi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080066

On 8/15/25 9:07 AM, Wenmeng Liu wrote:
> Enable IMX577 via CCI1 on Lemans EVK.
> 
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> ---

[...]

> +/*
> + * Camera Sensor overlay on top of leman evk core kit.

"LeMans EVK Core Kit", this will also fit in a /* single-line comment */

[...]

> +&camcc {
> +	status = "okay";
> +};

It's enabled by default and there's never a good reason to disable it

Konrad

