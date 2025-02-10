Return-Path: <linux-media+bounces-25950-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 249E5A2F623
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 18:58:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F1D8188777D
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 17:58:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7D4B2566CD;
	Mon, 10 Feb 2025 17:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W9MCy/FP"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948A724394C
	for <linux-media@vger.kernel.org>; Mon, 10 Feb 2025 17:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739210262; cv=none; b=lOmmA5ysz1/XZhBOnmgNo7RllRDV0CLzItVED9Qvza+pSC2KC+VJzy/GxohDNFnVac0qVjXlGh08Tj8+Mh/sM/INMLpWhL3Hke6vX9skNT8RhPQ2fdQurjZnlcNlVZn6Ncl57sj1zAUunK8t8DxOKlq5Xaxd8B3ZDWwKE61402Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739210262; c=relaxed/simple;
	bh=zFAs1svrsFHe6quOtlp+VDvqJe/2P3nPX7t8jWFy9uA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CfJ5Fe47b4btdEVknuYMThF/wklKgQksjTVKzeBS7W3I03A/gk4PA+mGuDZPrLIcy/0o7C8BvapaZmmSWc3apW8PcXVcV1LzJpWMPAGjU5e234beDnmdE+U6KGagB1XgD+5J0N9K0fkDSATQ/K4elZ3V+o6D4hwgX2PDwSnX0iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W9MCy/FP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A9Vgnm018694
	for <linux-media@vger.kernel.org>; Mon, 10 Feb 2025 17:57:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZoBM0xt2esw7qc4beiqqn/f/AmDRb3BhJo7cr1bIBo8=; b=W9MCy/FPU+e4ARsl
	cXJ5l9zTokouLCvg6wC7UAhgIv9A0gfXBDOrum6mCiBwTTfy1c8U4Y5dWQA8uaoE
	x8YFGyonYrFjxY+SLWyDngjmVNyzBuNUczAHDu2OoGtI96mFEPKiMDyJ4VAvKww3
	ekBLjd/kXPhN6rF8RNnQ2SedhxjpsYWaWHklcZVC7GvcX6uYmaLefr6AqLIaWcDt
	3Hm5PiJBWCDtBhB92KI5QNUOarJzaYh3+anuQiYC1MhWlXnvRZeENWCUWzY/mnxI
	nEJpTDqUymmCIRK4WX3ykxgKgFTPY6AJ/xDdo4nTfS/pDva/2Xsw3Q8TLCoBA1/h
	w8xTDQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0esd7ya-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 10 Feb 2025 17:57:38 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e440e2ddfbso11442426d6.2
        for <linux-media@vger.kernel.org>; Mon, 10 Feb 2025 09:57:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739210257; x=1739815057;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZoBM0xt2esw7qc4beiqqn/f/AmDRb3BhJo7cr1bIBo8=;
        b=ATIkyTqTblGdWEFGw+44bAM0t1C66wStQOlzX6v4ytFNoX7RJJ9Zc+kw+CgWcQnfbs
         3T78fkC0J1XC0SEElEO0pdprMjqQzMfGFA810ygsjTG8JCajog2jrNjD20s15pHIplot
         mcCI+shKUS2rb+EEqAB2mRjk5n479Wf7n2SjVgSgzNGtjNwMj7o77q8uRMGaIo71Lz1K
         UUtBXtiKybs1lvN+lz+xYCNKVabogQVYucLxlTKndHSwzdvP8DnI05uGXpbviQ2k+4Ad
         zcz0kN/amIrBhWlGXGmNpZcRR/aTwYtDo3XasxZEbbFUDxj1wio96Twd3HeIqtov3+2x
         Vsvw==
X-Forwarded-Encrypted: i=1; AJvYcCV7tZQs9YwZ9QjvIcsHiBw9FmpBpm7DyoiCTHX8tnpj/YSR58/Qokb7+Jap7OcVcObW3UaboJf5vXM3vw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGt7A9h6zUbRqbElASeZ2R/6wwSPN3iwKF4UXl90QS/bGpVFqh
	17yo5N4Ec4GZGbalB6tlw15Z1+J8w6zeuFRHXnQJzI4lcFEza6zJ7xiciuLMsUxl13aIG2GsiXD
	+SfGPmm4phji+MCRjhFZSUEHNZsLXN7FMiuVtcSG3dRUUPAkEwE+qANgPRjtwQw==
X-Gm-Gg: ASbGncue3VkEqL0NKQMokZ3qiW7iAbzLYKEoTVRvH+NHJauYIFZvRy8ezBBaKKhj1Il
	rVTmKXxSeH8D1OMDIyeyW6v9aBFImTWJdTSkKKy0JhR4/DlBvIsRBNU0Zb8d54zyRUdXBbeuxrM
	BJaqR7P+rKzzuCKB9WQFPgR0oCB3kOZSUfoWyeTciUivC+5Zv4NUa+WX33HlVfk3lh0aReklu/A
	8wh3dy5qK4K4sYA7fLtWRxD/kk/oOJM/nMoxydczMVESV75ik+WGAtCqLIqELyP5ho3E1D+JRgY
	RJ+vywgHYBen1jtZ9iDOsIRfRNvqrzzrt0syVN8j+ZSrgz52bFQ4NMu3hJ8=
X-Received: by 2002:a05:622a:44a:b0:467:885e:2c6e with SMTP id d75a77b69052e-4716798b651mr67711401cf.1.1739210257543;
        Mon, 10 Feb 2025 09:57:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE7DeNsTh1CNfVirsfKlW9PrWVuIz+r8cJvvKVifTpK5b9AMONLPYgEGR0MpSwUzhNbJHeA4g==
X-Received: by 2002:a05:622a:44a:b0:467:885e:2c6e with SMTP id d75a77b69052e-4716798b651mr67711231cf.1.1739210257120;
        Mon, 10 Feb 2025 09:57:37 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de4f4f4daesm6393175a12.21.2025.02.10.09.57.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 09:57:35 -0800 (PST)
Message-ID: <55a2ddf7-8d38-4dc9-8cd9-80fa90eafa6d@oss.qualcomm.com>
Date: Mon, 10 Feb 2025 18:57:32 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/3] arm64: dts: qcom: sdm670: add camss and cci
To: Richard Acayan <mailingradian@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
References: <20250205035013.206890-5-mailingradian@gmail.com>
 <20250205035013.206890-8-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250205035013.206890-8-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: VRjjKUOTmEVnAIWVm1iNajj_d7DU2WMA
X-Proofpoint-ORIG-GUID: VRjjKUOTmEVnAIWVm1iNajj_d7DU2WMA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_09,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 spamscore=0 mlxlogscore=736
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502100146

On 5.02.2025 4:50 AM, Richard Acayan wrote:
> Add the camera subsystem and CCI used to interface with cameras on the
> Snapdragon 670.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

